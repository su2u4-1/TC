	.file	"output.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Name: \"NULL\"\12\0"
.LC1:
	.ascii "name: \"%s\"\12\0"
.LC2:
	.ascii "id: %zu\12\0"
.LC3:
	.ascii "kind: \"type\"\12\0"
.LC4:
	.ascii "kind: \"variable\"\12\0"
.LC5:
	.ascii "type\12\0"
.LC6:
	.ascii "kind: \"function\"\12\0"
.LC7:
	.ascii "return_type\12\0"
.LC8:
	.ascii "kind: \"method\"\12\0"
.LC9:
	.ascii "kind: \"class\"\12\0"
.LC10:
	.ascii "kind: \"attribute\"\12\0"
.LC11:
	.ascii "kind: \"parameter\"\12\0"
.LC12:
	.ascii "kind: \"unknown_NameType\"\12\0"
	.text
	.def	output_name;	.scl	3;	.type	32;	.endef
output_name:
	pushq	%r15	 ;
 ; D:/TC/src/output.c:371:     ast_output(0, false, "id: %zu\n", name->id);
	leaq	.LC2(%rip), %r15	 ;, tmp116
 ; D:/TC/src/output.c:363: void output_name(Symbol* name, FILE* outfile, size_t indent, char indent_has_next[32]) {
	pushq	%r14	 ;
 ; D:/TC/src/output.c:370:     ast_output(0, false, "name: \"%s\"\n", name->name);
	leaq	.LC1(%rip), %r14	 ;, tmp115
 ; D:/TC/src/output.c:363: void output_name(Symbol* name, FILE* outfile, size_t indent, char indent_has_next[32]) {
	pushq	%r13	 ;
 ; D:/TC/src/output.c:372:     switch (name->kind) {
	leaq	.L6(%rip), %r13	 ;, tmp117
 ; D:/TC/src/output.c:363: void output_name(Symbol* name, FILE* outfile, size_t indent, char indent_has_next[32]) {
	pushq	%r12	 ;
	leaq	1(%r8), %r12	 ;, ivtmp.33
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp118, name
	pushq	%rsi	 ;
	movq	%r9, %rsi	 ; tmp121, indent_has_next
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp119, outfile
	subq	$40, %rsp	 ;,
.L2:
	leaq	-1(%r12), %rbp	 ;, indent
 ; D:/TC/src/output.c:366:         ast_output(0, true, "Name: \"NULL\"\n");
	movq	%rsi, %r9	 ; indent_has_next,
 ; D:/TC/src/output.c:365:     if (name == NULL) {
	testq	%rdi, %rdi	 ; name
	jne	.L3	 ;,
 ; D:/TC/src/output.c:366:         ast_output(0, true, "Name: \"NULL\"\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:366:         ast_output(0, true, "Name: \"NULL\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC0(%rip), %rcx	 ;, tmp91
	jmp	.L18	 ;
.L3:
 ; D:/TC/src/output.c:370:     ast_output(0, false, "name: \"%s\"\n", name->name);
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:370:     ast_output(0, false, "name: \"%s\"\n", name->name);
	movq	8(%rdi), %r8	 ; name_15->name,
	movq	%r14, %rdx	 ; tmp115,
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:371:     ast_output(0, false, "id: %zu\n", name->id);
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:371:     ast_output(0, false, "id: %zu\n", name->id);
	movq	16(%rdi), %r8	 ; name_15->id,
	movq	%r15, %rdx	 ; tmp116,
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:372:     switch (name->kind) {
	cmpl	$6, 32(%rdi)	 ;, name_15->kind
	ja	.L4	 ;,
	movl	32(%rdi), %eax	 ; name_15->kind, name_15->kind
 ; D:/TC/src/output.c:374:             ast_output(0, true, "kind: \"type\"\n");
	movq	%rsi, %r9	 ; indent_has_next,
 ; D:/TC/src/output.c:372:     switch (name->kind) {
	movslq	0(%r13,%rax,4), %rax	 ;, tmp99
	addq	%r13, %rax	 ; tmp117, tmp100
	jmp	*%rax	 ; tmp100
	.section .rdata,"dr"
	.align 4
.L6:
	.long	.L12-.L6
	.long	.L11-.L6
	.long	.L10-.L6
	.long	.L9-.L6
	.long	.L8-.L6
	.long	.L7-.L6
	.long	.L5-.L6
	.text
.L5:
 ; D:/TC/src/output.c:374:             ast_output(0, true, "kind: \"type\"\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:374:             ast_output(0, true, "kind: \"type\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC3(%rip), %rcx	 ;, tmp102
	jmp	.L18	 ;
.L9:
 ; D:/TC/src/output.c:377:             ast_output(0, false, "kind: \"variable\"\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	xorl	%r8d, %r8d	 ;
	call	indention	 ;
 ; D:/TC/src/output.c:377:             ast_output(0, false, "kind: \"variable\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC4(%rip), %rcx	 ;, tmp103
	jmp	.L16	 ;
.L11:
 ; D:/TC/src/output.c:382:             ast_output(0, false, "kind: \"function\"\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	xorl	%r8d, %r8d	 ;
	call	indention	 ;
 ; D:/TC/src/output.c:382:             ast_output(0, false, "kind: \"function\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC6(%rip), %rcx	 ;, tmp105
	jmp	.L17	 ;
.L10:
 ; D:/TC/src/output.c:387:             ast_output(0, false, "kind: \"method\"\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	xorl	%r8d, %r8d	 ;
	call	indention	 ;
 ; D:/TC/src/output.c:387:             ast_output(0, false, "kind: \"method\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC8(%rip), %rcx	 ;, tmp107
.L17:
	call	fputs	 ;
 ; D:/TC/src/output.c:388:             ast_output(0, true, "return_type\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:388:             ast_output(0, true, "return_type\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC7(%rip), %rcx	 ;, tmp108
	jmp	.L15	 ;
.L12:
 ; D:/TC/src/output.c:392:             ast_output(0, true, "kind: \"class\"\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:392:             ast_output(0, true, "kind: \"class\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC9(%rip), %rcx	 ;, tmp109
	jmp	.L18	 ;
.L7:
 ; D:/TC/src/output.c:395:             ast_output(0, false, "kind: \"attribute\"\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	xorl	%r8d, %r8d	 ;
	call	indention	 ;
 ; D:/TC/src/output.c:395:             ast_output(0, false, "kind: \"attribute\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC10(%rip), %rcx	 ;, tmp110
.L16:
	call	fputs	 ;
 ; D:/TC/src/output.c:396:             ast_output(0, true, "type\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:396:             ast_output(0, true, "type\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC5(%rip), %rcx	 ;, tmp111
.L15:
	call	fputs	 ;
	incq	%r12	 ; ivtmp.33
 ; D:/TC/src/output.c:397:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	(%rdi), %rdi	 ; name_15->type, name
	jmp	.L2	 ;
.L8:
 ; D:/TC/src/output.c:400:             ast_output(0, false, "kind: \"parameter\"\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	xorl	%r8d, %r8d	 ;
	call	indention	 ;
 ; D:/TC/src/output.c:400:             ast_output(0, false, "kind: \"parameter\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC11(%rip), %rcx	 ;, tmp112
	jmp	.L16	 ;
.L4:
 ; D:/TC/src/output.c:405:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:405:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC12(%rip), %rcx	 ;, tmp114
.L18:
 ; D:/TC/src/output.c:409: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:/TC/src/output.c:405:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	jmp	fputs	 ;
	.section .rdata,"dr"
.LC13:
	.ascii "UNKNOWN_OPERATOR\0"
.LC14:
	.ascii "primary\12\0"
.LC15:
	.ascii "type: \"integer\"\12\0"
.LC16:
	.ascii "value: %s\12\0"
.LC17:
	.ascii "type: \"float\"\12\0"
.LC18:
	.ascii "type: \"string\"\12\0"
.LC19:
	.ascii "value: \"%s\"\12\0"
.LC20:
	.ascii "type: \"boolean\"\12\0"
.LC21:
	.ascii "value: \"true\"\12\0"
.LC22:
	.ascii "value: \"false\"\12\0"
.LC23:
	.ascii "type: \"expression\"\12\0"
.LC24:
	.ascii "value\12\0"
.LC25:
	.ascii "type: \"!\"\12\0"
.LC26:
	.ascii "type: \"-\"\12\0"
.LC27:
	.ascii "type: \"variable\"\12\0"
.LC28:
	.ascii "unknown_PrimaryType: %u\12\0"
.LC29:
	.ascii "operator: \"%s\"\12\0"
.LC30:
	.ascii "left\12\0"
.LC31:
	.ascii "right\12\0"
	.text
	.def	output_expression;	.scl	3;	.type	32;	.endef
output_expression:
	pushq	%r14	 ;
 ; D:/TC/src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	leaq	.LC13(%rip), %r14	 ;, op_str
 ; D:/TC/src/output.c:256: void output_expression(Expression* expression, FILE* outfile, size_t indent, char indent_has_next[32]) {
	pushq	%r13	 ;
 ; D:/TC/src/output.c:273:     switch (primary->type) {
	leaq	.L25(%rip), %r13	 ;, tmp131
 ; D:/TC/src/output.c:256: void output_expression(Expression* expression, FILE* outfile, size_t indent, char indent_has_next[32]) {
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%r8, %rbp	 ; tmp137, indent
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp135, expression
	pushq	%rsi	 ;
	movq	%r9, %rsi	 ; tmp138, indent_has_next
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp136, outfile
	subq	$32, %rsp	 ;,
.L37:
 ; D:/TC/src/output.c:258:     if (expression->operator == OP_NONE) {
	movl	24(%rdi), %ecx	 ; expression_11->operator, _1
 ; D:/TC/src/output.c:258:     if (expression->operator == OP_NONE) {
	cmpl	$19, %ecx	 ;, _1
	jne	.L21	 ;,
 ; D:/TC/src/output.c:259:         ast_output(0, true, "primary\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:259:         ast_output(0, true, "primary\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC14(%rip), %rcx	 ;, tmp98
	addq	$2, %rbp	 ;, indent
	call	fputs	 ;
 ; D:/TC/src/output.c:260:         output_primary(expression->prim_left, outfile, indent + 1, indent_has_next);
	movq	8(%rdi), %r12	 ; expression_11->prim_left, primary
.L22:
 ; D:/TC/src/output.c:273:     switch (primary->type) {
	cmpl	$8, 8(%r12)	 ;, primary_28->type
	leaq	-1(%rbp), %rdi	 ;, indent
	ja	.L23	 ;,
	movl	8(%r12), %eax	 ; primary_28->type, primary_28->type
 ; D:/TC/src/output.c:310:             ast_output(0, false, "type: \"variable\"\n");
	movq	%rsi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
 ; D:/TC/src/output.c:273:     switch (primary->type) {
	movslq	0(%r13,%rax,4), %rax	 ;, tmp102
	addq	%r13, %rax	 ; tmp131, tmp103
	jmp	*%rax	 ; tmp103
	.section .rdata,"dr"
	.align 4
.L25:
	.long	.L33-.L25
	.long	.L32-.L25
	.long	.L31-.L25
	.long	.L30-.L25
	.long	.L29-.L25
	.long	.L28-.L25
	.long	.L27-.L25
	.long	.L26-.L25
	.long	.L24-.L25
	.text
.L33:
 ; D:/TC/src/output.c:275:             ast_output(0, false, "type: \"integer\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:275:             ast_output(0, false, "type: \"integer\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC15(%rip), %rcx	 ;, tmp105
	jmp	.L41	 ;
.L32:
 ; D:/TC/src/output.c:279:             ast_output(0, false, "type: \"float\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:279:             ast_output(0, false, "type: \"float\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC17(%rip), %rcx	 ;, tmp107
.L41:
	call	fputs	 ;
 ; D:/TC/src/output.c:280:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	%rdi, %rdx	 ; indent,
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:280:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	(%r12), %r8	 ; primary_28->value.literal_value,
	leaq	.LC16(%rip), %rdx	 ;, tmp108
.L42:
 ; D:/TC/src/output.c:270: }
	addq	$32, %rsp	 ;,
 ; D:/TC/src/output.c:280:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	%rbx, %rcx	 ; outfile,
 ; D:/TC/src/output.c:270: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
 ; D:/TC/src/output.c:280:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	jmp	fprintf	 ;
.L31:
 ; D:/TC/src/output.c:283:             ast_output(0, false, "type: \"string\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:283:             ast_output(0, false, "type: \"string\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC18(%rip), %rcx	 ;, tmp109
	call	fputs	 ;
 ; D:/TC/src/output.c:284:             ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
	movq	%rdi, %rdx	 ; indent,
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:284:             ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
	movq	(%r12), %r8	 ; primary_28->value.literal_value,
	leaq	.LC19(%rip), %rdx	 ;, tmp110
	jmp	.L42	 ;
.L30:
 ; D:/TC/src/output.c:287:             ast_output(0, false, "type: \"boolean\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:287:             ast_output(0, false, "type: \"boolean\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC20(%rip), %rcx	 ;, tmp111
	call	fputs	 ;
 ; D:/TC/src/output.c:288:             ast_output(0, true, "value: \"true\"\n");
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:288:             ast_output(0, true, "value: \"true\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC21(%rip), %rcx	 ;, tmp112
	jmp	.L43	 ;
.L29:
 ; D:/TC/src/output.c:291:             ast_output(0, false, "type: \"boolean\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:291:             ast_output(0, false, "type: \"boolean\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC20(%rip), %rcx	 ;, tmp113
	call	fputs	 ;
 ; D:/TC/src/output.c:292:             ast_output(0, true, "value: \"false\"\n");
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:292:             ast_output(0, true, "value: \"false\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC22(%rip), %rcx	 ;, tmp114
.L43:
 ; D:/TC/src/output.c:270: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
 ; D:/TC/src/output.c:292:             ast_output(0, true, "value: \"false\"\n");
	jmp	fputs	 ;
.L28:
 ; D:/TC/src/output.c:295:             ast_output(0, false, "type: \"expression\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:295:             ast_output(0, false, "type: \"expression\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC23(%rip), %rcx	 ;, tmp115
	call	fputs	 ;
 ; D:/TC/src/output.c:296:             ast_output(0, true, "value\n");
	movq	%rdi, %rdx	 ; indent,
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:296:             ast_output(0, true, "value\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC24(%rip), %rcx	 ;, tmp116
	call	fputs	 ;
 ; D:/TC/src/output.c:297:             output_expression(primary->value.expr, outfile, indent + 1, indent_has_next);
	movq	(%r12), %rdi	 ; primary_28->value.expr, expression
 ; D:/TC/src/output.c:298:             break;
	jmp	.L37	 ;
.L27:
 ; D:/TC/src/output.c:300:             ast_output(0, false, "type: \"!\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:300:             ast_output(0, false, "type: \"!\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC25(%rip), %rcx	 ;, tmp117
	jmp	.L40	 ;
.L26:
 ; D:/TC/src/output.c:305:             ast_output(0, false, "type: \"-\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:305:             ast_output(0, false, "type: \"-\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC26(%rip), %rcx	 ;, tmp119
.L40:
	call	fputs	 ;
 ; D:/TC/src/output.c:306:             ast_output(0, true, "value\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	incq	%rbp	 ; indent
	call	indention	 ;
 ; D:/TC/src/output.c:306:             ast_output(0, true, "value\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC24(%rip), %rcx	 ;, tmp120
	call	fputs	 ;
 ; D:/TC/src/output.c:307:             output_primary(primary->value.operand, outfile, indent + 1, indent_has_next);
	movq	(%r12), %r12	 ; primary_28->value.operand, primary
	jmp	.L22	 ;
.L24:
 ; D:/TC/src/output.c:310:             ast_output(0, false, "type: \"variable\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:310:             ast_output(0, false, "type: \"variable\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC27(%rip), %rcx	 ;, tmp121
	call	fputs	 ;
 ; D:/TC/src/output.c:311:             ast_output(0, true, "value\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:311:             ast_output(0, true, "value\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC24(%rip), %rcx	 ;, tmp122
	call	fputs	 ;
 ; D:/TC/src/output.c:312:             output_variable_access(primary->value.var, outfile, indent + 1, indent_has_next);
	movq	(%r12), %rcx	 ; primary_28->value.var,
 ; D:/TC/src/output.c:270: }
	addq	$32, %rsp	 ;,
 ; D:/TC/src/output.c:312:             output_variable_access(primary->value.var, outfile, indent + 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbp, %r8	 ; indent,
	movq	%rbx, %rdx	 ; outfile,
 ; D:/TC/src/output.c:270: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
 ; D:/TC/src/output.c:312:             output_variable_access(primary->value.var, outfile, indent + 1, indent_has_next);
	jmp	output_variable_access	 ;
.L23:
 ; D:/TC/src/output.c:315:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:315:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movl	8(%r12), %r8d	 ; primary_28->type,
 ; D:/TC/src/output.c:270: }
	addq	$32, %rsp	 ;,
 ; D:/TC/src/output.c:315:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movq	%rbx, %rcx	 ; outfile,
	leaq	.LC28(%rip), %rdx	 ;, tmp124
 ; D:/TC/src/output.c:270: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
 ; D:/TC/src/output.c:315:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	jmp	fprintf	 ;
.L21:
 ; D:/TC/src/output.c:262:         string op_str = operator_to_string(expression->operator);
	call	operator_to_string	 ;
 ; D:/TC/src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	%rsi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
 ; D:/TC/src/output.c:262:         string op_str = operator_to_string(expression->operator);
	movq	%rax, %r12	 ; tmp139, op_str
 ; D:/TC/src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	testq	%r12, %r12	 ; op_str
 ; D:/TC/src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	leaq	.LC29(%rip), %rdx	 ;, tmp125
	movq	%rbx, %rcx	 ; outfile,
 ; D:/TC/src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	cmove	%r14, %r12	 ; op_str,, op_str, op_str
 ; D:/TC/src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	%r12, %r8	 ; op_str,
 ; D:/TC/src/output.c:265:         output_expression(expression->expr_left, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %r12	 ;, _5
 ; D:/TC/src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	call	fprintf	 ;
 ; D:/TC/src/output.c:264:         ast_output(0, false, "left\n");
	movq	%rsi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:264:         ast_output(0, false, "left\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC30(%rip), %rcx	 ;, tmp126
	call	fputs	 ;
 ; D:/TC/src/output.c:265:         output_expression(expression->expr_left, outfile, indent + 1, indent_has_next);
	movq	(%rdi), %rcx	 ; expression_11->expr_left,
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _5,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:/TC/src/output.c:266:         ast_output(0, true, "right\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
 ; D:/TC/src/output.c:267:         output_expression(expression->right, outfile, indent + 1, indent_has_next);
	movq	%r12, %rbp	 ; _5, indent
 ; D:/TC/src/output.c:266:         ast_output(0, true, "right\n");
	call	indention	 ;
 ; D:/TC/src/output.c:266:         ast_output(0, true, "right\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC31(%rip), %rcx	 ;, tmp127
	call	fputs	 ;
 ; D:/TC/src/output.c:267:         output_expression(expression->right, outfile, indent + 1, indent_has_next);
	movq	16(%rdi), %rdi	 ; expression_11->right, expression
	jmp	.L37	 ;
	.section .rdata,"dr"
.LC32:
	.ascii "name\12\0"
.LC33:
	.ascii "value: \"NULL\"\12\0"
	.text
	.def	output_variable;	.scl	3;	.type	32;	.endef
output_variable:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%rcx, %rbp	 ; tmp97, variable
	pushq	%rdi	 ;
	movq	%r8, %rdi	 ; tmp99, indent
 ; D:/TC/src/output.c:130:     ast_output(0, false, "type\n");
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/output.c:128: void output_variable(Variable* variable, FILE* outfile, size_t indent, char indent_has_next[32]) {
	pushq	%rsi	 ;
	movq	%r9, %rsi	 ; tmp100, indent_has_next
 ; D:/TC/src/output.c:131:     output_name(variable->type, outfile, indent + 1, indent_has_next);
	leaq	1(%rdi), %r12	 ;, _1
 ; D:/TC/src/output.c:128: void output_variable(Variable* variable, FILE* outfile, size_t indent, char indent_has_next[32]) {
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp98, outfile
 ; D:/TC/src/output.c:130:     ast_output(0, false, "type\n");
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
 ; D:/TC/src/output.c:128: void output_variable(Variable* variable, FILE* outfile, size_t indent, char indent_has_next[32]) {
	subq	$32, %rsp	 ;,
 ; D:/TC/src/output.c:130:     ast_output(0, false, "type\n");
	call	indention	 ;
 ; D:/TC/src/output.c:130:     ast_output(0, false, "type\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC5(%rip), %rcx	 ;, tmp91
	call	fputs	 ;
 ; D:/TC/src/output.c:131:     output_name(variable->type, outfile, indent + 1, indent_has_next);
	movq	0(%rbp), %rcx	 ; variable_13(D)->type,
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:/TC/src/output.c:132:     ast_output(0, false, "name\n");
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:132:     ast_output(0, false, "name\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC32(%rip), %rcx	 ;, tmp92
	call	fputs	 ;
 ; D:/TC/src/output.c:133:     output_name(variable->name, outfile, indent + 1, indent_has_next);
	movq	8(%rbp), %rcx	 ; variable_13(D)->name, variable_13(D)->name
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:/TC/src/output.c:134:     if (variable->value != NULL) {
	cmpq	$0, 16(%rbp)	 ;, variable_13(D)->value
 ; D:/TC/src/output.c:135:         ast_output(0, true, "value\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rdi, %rdx	 ; indent,
	movl	$1, %r8d	 ;,
	movq	%rbx, %rcx	 ; outfile,
 ; D:/TC/src/output.c:134:     if (variable->value != NULL) {
	je	.L45	 ;,
 ; D:/TC/src/output.c:135:         ast_output(0, true, "value\n");
	call	indention	 ;
 ; D:/TC/src/output.c:135:         ast_output(0, true, "value\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC24(%rip), %rcx	 ;, tmp94
	call	fputs	 ;
 ; D:/TC/src/output.c:136:         output_expression(variable->value, outfile, indent + 1, indent_has_next);
	movq	16(%rbp), %rcx	 ; variable_13(D)->value, variable_13(D)->value
 ; D:/TC/src/output.c:140: }
	addq	$32, %rsp	 ;,
 ; D:/TC/src/output.c:136:         output_expression(variable->value, outfile, indent + 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
 ; D:/TC/src/output.c:140: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:/TC/src/output.c:136:         output_expression(variable->value, outfile, indent + 1, indent_has_next);
	jmp	output_expression	 ;
.L45:
 ; D:/TC/src/output.c:138:         ast_output(0, true, "value: \"NULL\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:140: }
	addq	$32, %rsp	 ;,
 ; D:/TC/src/output.c:138:         ast_output(0, true, "value: \"NULL\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC33(%rip), %rcx	 ;, tmp96
 ; D:/TC/src/output.c:140: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:/TC/src/output.c:138:         ast_output(0, true, "value: \"NULL\"\n");
	jmp	fputs	 ;
	.section .rdata,"dr"
.LC34:
	.ascii "type: \"name\"\12\0"
.LC35:
	.ascii "type: \"function_call\"\12\0"
.LC36:
	.ascii "function\12\0"
.LC37:
	.ascii "arguments\12\0"
.LC38:
	.ascii "arguments[%d]\12\0"
.LC39:
	.ascii "type: \"get sequence_element\"\12\0"
.LC40:
	.ascii "sequence\12\0"
.LC41:
	.ascii "index\12\0"
.LC42:
	.ascii "type: \"get_attribute\"\12\0"
.LC43:
	.ascii "object\12\0"
.LC44:
	.ascii "attribute_name\12\0"
.LC45:
	.ascii "unknown_VariableAccessType: %u\12\0"
	.text
	.def	output_variable_access;	.scl	3;	.type	32;	.endef
output_variable_access:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%rcx, %rbp	 ; tmp126, variable_access
	pushq	%rdi	 ;
	movq	%r8, %rdi	 ; tmp128, indent
	pushq	%rsi	 ;
	movq	%r9, %rsi	 ; tmp129, indent_has_next
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp127, outfile
	subq	$40, %rsp	 ;,
 ; D:/TC/src/output.c:324:     switch (variable_access->type) {
	movl	16(%rcx), %eax	 ; variable_access_19(D)->type, _1
 ; D:/TC/src/output.c:324:     switch (variable_access->type) {
	cmpl	$2, %eax	 ;, _1
	je	.L48	 ;,
	ja	.L49	 ;,
	testl	%eax, %eax	 ; _1
	leaq	1(%r8), %r13	 ;, _5
	jne	.L57	 ;,
 ; D:/TC/src/output.c:326:             ast_output(0, false, "type: \"name\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:326:             ast_output(0, false, "type: \"name\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC34(%rip), %rcx	 ;, tmp103
	call	fputs	 ;
 ; D:/TC/src/output.c:327:             ast_output(0, true, "name\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:327:             ast_output(0, true, "name\n");
	leaq	.LC32(%rip), %rcx	 ;, tmp104
	movq	%rbx, %rdx	 ; outfile,
	call	fputs	 ;
 ; D:/TC/src/output.c:328:             output_name(variable_access->content.name, outfile, indent + 1, indent_has_next);
	movq	8(%rbp), %rcx	 ; variable_access_19(D)->content.name, variable_access_19(D)->content.name
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r13, %r8	 ; _5,
	jmp	.L61	 ;
.L49:
 ; D:/TC/src/output.c:324:     switch (variable_access->type) {
	cmpl	$3, %eax	 ;, _1
	jne	.L62	 ;,
 ; D:/TC/src/output.c:344:             ast_output(0, false, "type: \"get sequence_element\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
 ; D:/TC/src/output.c:346:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	leaq	1(%rdi), %r12	 ;, _8
 ; D:/TC/src/output.c:344:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:344:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC39(%rip), %rcx	 ;, tmp113
	call	fputs	 ;
 ; D:/TC/src/output.c:345:             ast_output(0, false, "sequence\n");
	movq	%rsi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:345:             ast_output(0, false, "sequence\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC40(%rip), %rcx	 ;, tmp114
	call	fputs	 ;
 ; D:/TC/src/output.c:346:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	movq	0(%rbp), %rcx	 ; variable_access_19(D)->base,
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _8,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; D:/TC/src/output.c:347:             ast_output(0, true, "index\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:347:             ast_output(0, true, "index\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC41(%rip), %rcx	 ;, tmp115
	call	fputs	 ;
 ; D:/TC/src/output.c:348:             output_expression(variable_access->content.index, outfile, indent + 1, indent_has_next);
	movq	8(%rbp), %rcx	 ; variable_access_19(D)->content.index, variable_access_19(D)->content.index
 ; D:/TC/src/output.c:362: }
	addq	$40, %rsp	 ;,
 ; D:/TC/src/output.c:348:             output_expression(variable_access->content.index, outfile, indent + 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _8,
	movq	%rbx, %rdx	 ; outfile,
 ; D:/TC/src/output.c:362: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:/TC/src/output.c:348:             output_expression(variable_access->content.index, outfile, indent + 1, indent_has_next);
	jmp	output_expression	 ;
.L57:
 ; D:/TC/src/output.c:331:             args = list_copy(variable_access->content.args);
	movq	8(%rcx), %rcx	 ; variable_access_19(D)->content.args, variable_access_19(D)->content.args
 ; D:/TC/src/output.c:339:                 ast_output(1, false, "arguments[%d]\n", ++index);
	leaq	.LC38(%rip), %r14	 ;, tmp124
 ; D:/TC/src/output.c:331:             args = list_copy(variable_access->content.args);
	call	list_copy	 ;
 ; D:/TC/src/output.c:332:             ast_output(0, false, "type: \"function_call\"\n");
	movq	%rsi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
 ; D:/TC/src/output.c:331:             args = list_copy(variable_access->content.args);
	movq	%rax, %r12	 ; tmp130, args
 ; D:/TC/src/output.c:332:             ast_output(0, false, "type: \"function_call\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:332:             ast_output(0, false, "type: \"function_call\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC35(%rip), %rcx	 ;, tmp108
	call	fputs	 ;
 ; D:/TC/src/output.c:333:             ast_output(0, false, "function\n");
	movq	%rsi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:333:             ast_output(0, false, "function\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC36(%rip), %rcx	 ;, tmp109
	call	fputs	 ;
 ; D:/TC/src/output.c:334:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	movq	0(%rbp), %rcx	 ; variable_access_19(D)->base,
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r13, %r8	 ; _5,
	movq	%rbx, %rdx	 ; outfile,
 ; D:/TC/src/output.c:337:             index = -1;
	orl	$-1, %ebp	 ;, index
 ; D:/TC/src/output.c:334:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	call	output_variable_access	 ;
 ; D:/TC/src/output.c:335:             ast_output(0, true, "arguments\n");
	movq	%rdi, %rdx	 ; indent,
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
 ; D:/TC/src/output.c:340:                 output_expression(arg, outfile, indent + 2, indent_has_next);
	addq	$2, %rdi	 ;, tmp125
 ; D:/TC/src/output.c:335:             ast_output(0, true, "arguments\n");
	call	indention	 ;
 ; D:/TC/src/output.c:335:             ast_output(0, true, "arguments\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC37(%rip), %rcx	 ;, tmp110
	call	fputs	 ;
.L54:
 ; D:/TC/src/output.c:338:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	movq	%r12, %rcx	 ; args,
	call	list_pop	 ;
	movq	%rax, %r15	 ; tmp131, arg
 ; D:/TC/src/output.c:338:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	 ; arg
	je	.L63	 ;,
 ; D:/TC/src/output.c:339:                 ast_output(1, false, "arguments[%d]\n", ++index);
	movq	%rsi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%r13, %rdx	 ; _5,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:339:                 ast_output(1, false, "arguments[%d]\n", ++index);
	incl	%ebp	 ; index
	movq	%r14, %rdx	 ; tmp124,
	movq	%rbx, %rcx	 ; outfile,
	movl	%ebp, %r8d	 ; index,
	call	fprintf	 ;
 ; D:/TC/src/output.c:340:                 output_expression(arg, outfile, indent + 2, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rdi, %r8	 ; tmp125,
	movq	%rbx, %rdx	 ; outfile,
	movq	%r15, %rcx	 ; arg,
	call	output_expression	 ;
	jmp	.L54	 ;
.L48:
 ; D:/TC/src/output.c:351:             ast_output(0, false, "type: \"get_attribute\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
 ; D:/TC/src/output.c:353:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	leaq	1(%rdi), %r12	 ;, _11
 ; D:/TC/src/output.c:351:             ast_output(0, false, "type: \"get_attribute\"\n");
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:351:             ast_output(0, false, "type: \"get_attribute\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC42(%rip), %rcx	 ;, tmp117
	call	fputs	 ;
 ; D:/TC/src/output.c:352:             ast_output(0, false, "object\n");
	movq	%rsi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:352:             ast_output(0, false, "object\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC43(%rip), %rcx	 ;, tmp118
	call	fputs	 ;
 ; D:/TC/src/output.c:353:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	movq	0(%rbp), %rcx	 ; variable_access_19(D)->base,
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _11,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; D:/TC/src/output.c:354:             ast_output(0, true, "attribute_name\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:354:             ast_output(0, true, "attribute_name\n");
	leaq	.LC44(%rip), %rcx	 ;, tmp119
	movq	%rbx, %rdx	 ; outfile,
	call	fputs	 ;
 ; D:/TC/src/output.c:355:             output_name(variable_access->content.attr_name, outfile, indent + 1, indent_has_next);
	movq	8(%rbp), %rcx	 ; variable_access_19(D)->content.attr_name, variable_access_19(D)->content.attr_name
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _11,
.L61:
 ; D:/TC/src/output.c:362: }
	addq	$40, %rsp	 ;,
 ; D:/TC/src/output.c:355:             output_name(variable_access->content.attr_name, outfile, indent + 1, indent_has_next);
	movq	%rbx, %rdx	 ; outfile,
 ; D:/TC/src/output.c:362: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:/TC/src/output.c:355:             output_name(variable_access->content.attr_name, outfile, indent + 1, indent_has_next);
	jmp	output_name	 ;
.L62:
 ; D:/TC/src/output.c:358:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:358:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movl	16(%rbp), %r8d	 ; variable_access_19(D)->type,
 ; D:/TC/src/output.c:362: }
	addq	$40, %rsp	 ;,
 ; D:/TC/src/output.c:358:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movq	%rbx, %rcx	 ; outfile,
	leaq	.LC45(%rip), %rdx	 ;, tmp122
 ; D:/TC/src/output.c:362: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:/TC/src/output.c:358:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	jmp	fprintf	 ;
.L63:
 ; D:/TC/src/output.c:362: }
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
	.section .rdata,"dr"
.LC46:
	.ascii "if_statement\12\0"
.LC47:
	.ascii "condition\12\0"
.LC48:
	.ascii "body\12\0"
.LC49:
	.ascii "else_if\12\0"
.LC50:
	.ascii "else_body\12\0"
.LC51:
	.ascii "for_statement\12\0"
.LC52:
	.ascii "initializer\12\0"
.LC53:
	.ascii "initializer: \"NULL\"\12\0"
.LC54:
	.ascii "condition: \"NULL\"\12\0"
.LC55:
	.ascii "increment\12\0"
.LC56:
	.ascii "increment: \"NULL\"\12\0"
.LC57:
	.ascii "while_statement\12\0"
.LC58:
	.ascii "variable_declaration_statement\12\0"
.LC59:
	.ascii "return_statement: \"NULL\"\12\0"
.LC60:
	.ascii "return_statement\12\0"
.LC61:
	.ascii "break_statement: \"NULL\"\12\0"
.LC62:
	.ascii "continue_statement: \"NULL\"\12\0"
.LC63:
	.ascii "expression_statement: \"NULL\"\12\0"
.LC64:
	.ascii "expression_statement\12\0"
.LC65:
	.ascii "unknown_StatementType: %u\12\0"
	.text
	.def	output_statement;	.scl	3;	.type	32;	.endef
output_statement:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp188, statement
	pushq	%rbx	 ;
	movq	%r8, %rbx	 ; tmp190, indent
	subq	$72, %rsp	 ;,
 ; D:/TC/src/output.c:143:     switch (statement->type) {
	cmpl	$7, 8(%rcx)	 ;, statement_19(D)->type
 ; D:/TC/src/output.c:141: void output_statement(Statement* statement, FILE* outfile, size_t indent, char indent_has_next[32]) {
	movq	%rdx, 40(%rsp)	 ; tmp189, %sfp
	movq	%r9, 48(%rsp)	 ; tmp191, %sfp
 ; D:/TC/src/output.c:143:     switch (statement->type) {
	ja	.L65	 ;,
	movl	8(%rcx), %eax	 ; statement_19(D)->type, statement_19(D)->type
	leaq	.L67(%rip), %rdx	 ;, tmp137
 ; D:/TC/src/output.c:173:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movq	48(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/output.c:143:     switch (statement->type) {
	movslq	(%rdx,%rax,4), %rax	 ;, tmp139
	addq	%rdx, %rax	 ; tmp137, tmp140
 ; D:/TC/src/output.c:173:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movq	%rbx, %rdx	 ; indent,
 ; D:/TC/src/output.c:143:     switch (statement->type) {
	jmp	*%rax	 ; tmp140
	.section .rdata,"dr"
	.align 4
.L67:
	.long	.L74-.L67
	.long	.L73-.L67
	.long	.L72-.L67
	.long	.L71-.L67
	.long	.L70-.L67
	.long	.L69-.L67
	.long	.L68-.L67
	.long	.L66-.L67
	.text
.L72:
 ; D:/TC/src/output.c:145:             ast_output(0, false, "if_statement\n");
	call	indention	 ;
 ; D:/TC/src/output.c:145:             ast_output(0, false, "if_statement\n");
	movq	40(%rsp), %rdx	 ; %sfp,
 ; D:/TC/src/output.c:146:             output_if(statement->stmt.if_stmt, outfile, indent + 1, indent_has_next);
	leaq	1(%rbx), %rdi	 ;, _2
 ; D:/TC/src/output.c:145:             ast_output(0, false, "if_statement\n");
	leaq	.LC46(%rip), %rcx	 ;, tmp142
 ; D:/TC/src/output.c:195:     ast_output(0, false, "condition\n");
	leaq	.LC47(%rip), %r14	 ;, tmp146
 ; D:/TC/src/output.c:145:             ast_output(0, false, "if_statement\n");
	call	fputs	 ;
 ; D:/TC/src/output.c:146:             output_if(statement->stmt.if_stmt, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %r15	 ; statement_19(D)->stmt.if_stmt, _3
 ; D:/TC/src/output.c:196:     output_expression(if_->condition, outfile, indent + 1, indent_has_next);
	leaq	2(%rbx), %rsi	 ;, _57
 ; D:/TC/src/output.c:192:     list(Statement*) body = list_copy(if_->body);
	movq	8(%r15), %rcx	 ; _3->body, _3->body
	call	list_copy	 ;
 ; D:/TC/src/output.c:193:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	movq	16(%r15), %rcx	 ; _3->else_if, _3->else_if
 ; D:/TC/src/output.c:192:     list(Statement*) body = list_copy(if_->body);
	movq	%rax, %r13	 ; tmp192, body
 ; D:/TC/src/output.c:193:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	call	list_copy	 ;
 ; D:/TC/src/output.c:194:     list(Statement*) else_body = list_copy(if_->else_body);
	movq	24(%r15), %rcx	 ; _3->else_body, _3->else_body
 ; D:/TC/src/output.c:193:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	movq	%rax, %r12	 ; tmp193, else_if_list
 ; D:/TC/src/output.c:194:     list(Statement*) else_body = list_copy(if_->else_body);
	call	list_copy	 ;
 ; D:/TC/src/output.c:195:     ast_output(0, false, "condition\n");
	movq	48(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _2,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/output.c:194:     list(Statement*) else_body = list_copy(if_->else_body);
	movq	%rax, %rbp	 ; tmp194, else_body
 ; D:/TC/src/output.c:195:     ast_output(0, false, "condition\n");
	call	indention	 ;
 ; D:/TC/src/output.c:195:     ast_output(0, false, "condition\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%r14, %rcx	 ; tmp146,
	call	fputs	 ;
 ; D:/TC/src/output.c:196:     output_expression(if_->condition, outfile, indent + 1, indent_has_next);
	movq	(%r15), %rcx	 ; _3->condition,
	movq	48(%rsp), %r9	 ; %sfp,
	movq	%rsi, %r8	 ; _57,
	movq	40(%rsp), %rdx	 ; %sfp,
 ; D:/TC/src/output.c:197:     ast_output(0, false, "body\n");
	leaq	.LC48(%rip), %r15	 ;, tmp147
 ; D:/TC/src/output.c:196:     output_expression(if_->condition, outfile, indent + 1, indent_has_next);
	call	output_expression	 ;
 ; D:/TC/src/output.c:197:     ast_output(0, false, "body\n");
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%rdi, %rdx	 ; _2,
	xorl	%r8d, %r8d	 ;
	movq	48(%rsp), %r9	 ; %sfp,
	call	indention	 ;
 ; D:/TC/src/output.c:197:     ast_output(0, false, "body\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%r15, %rcx	 ; tmp147,
	call	fputs	 ;
.L75:
 ; D:/TC/src/output.c:199:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r13, %rcx	 ; body,
	call	list_pop	 ;
 ; D:/TC/src/output.c:200:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	48(%rsp), %r9	 ; %sfp,
 ; D:/TC/src/output.c:199:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rax, %rcx	 ; tmp195, statement
 ; D:/TC/src/output.c:199:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L100	 ;,
 ; D:/TC/src/output.c:200:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rsi, %r8	 ; _57,
	call	output_statement	 ;
	jmp	.L75	 ;
.L100:
 ; D:/TC/src/output.c:201:     ast_output(0, false, "else_if\n");
	movq	40(%rsp), %rcx	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _2,
	call	indention	 ;
 ; D:/TC/src/output.c:201:     ast_output(0, false, "else_if\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC49(%rip), %rcx	 ;, tmp148
	call	fputs	 ;
 ; D:/TC/src/output.c:214:     output_expression(else_if->condition, outfile, indent + 1, indent_has_next);
	leaq	3(%rbx), %rax	 ;, _64
	movq	%rax, 56(%rsp)	 ; _64, %sfp
.L77:
 ; D:/TC/src/output.c:203:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	movq	%r12, %rcx	 ; else_if_list,
	call	list_pop	 ;
	movq	%rax, %r13	 ; tmp198, else_if
 ; D:/TC/src/output.c:203:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	testq	%rax, %rax	 ; else_if
	je	.L101	 ;,
 ; D:/TC/src/output.c:212:     list(Statement*) body = list_copy(else_if->body);
	movq	8(%r13), %rcx	 ; else_if_60->body, else_if_60->body
	call	list_copy	 ;
 ; D:/TC/src/output.c:213:     ast_output(0, false, "condition\n");
	movq	48(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; _57,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/output.c:212:     list(Statement*) body = list_copy(else_if->body);
	movq	%rax, %rbx	 ; tmp196, body
 ; D:/TC/src/output.c:213:     ast_output(0, false, "condition\n");
	call	indention	 ;
 ; D:/TC/src/output.c:213:     ast_output(0, false, "condition\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%r14, %rcx	 ; tmp146,
	call	fputs	 ;
 ; D:/TC/src/output.c:214:     output_expression(else_if->condition, outfile, indent + 1, indent_has_next);
	movq	48(%rsp), %r9	 ; %sfp,
	movq	56(%rsp), %r8	 ; %sfp,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	0(%r13), %rcx	 ; else_if_60->condition,
	call	output_expression	 ;
 ; D:/TC/src/output.c:215:     ast_output(0, true, "body\n");
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	48(%rsp), %r9	 ; %sfp,
	movq	%rsi, %rdx	 ; _57,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:215:     ast_output(0, true, "body\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%r15, %rcx	 ; tmp147,
	call	fputs	 ;
.L78:
 ; D:/TC/src/output.c:217:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbx, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp197, statement
 ; D:/TC/src/output.c:217:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L77	 ;,
 ; D:/TC/src/output.c:218:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	48(%rsp), %r9	 ; %sfp,
	movq	56(%rsp), %r8	 ; %sfp,
	movq	40(%rsp), %rdx	 ; %sfp,
	call	output_statement	 ;
	jmp	.L78	 ;
.L101:
 ; D:/TC/src/output.c:205:     ast_output(0, true, "else_body\n");
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	48(%rsp), %r9	 ; %sfp,
	movq	%rdi, %rdx	 ; _2,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:205:     ast_output(0, true, "else_body\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC50(%rip), %rcx	 ;, tmp152
	call	fputs	 ;
.L81:
 ; D:/TC/src/output.c:206:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	movq	%rbp, %rcx	 ; else_body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp199, statement
 ; D:/TC/src/output.c:206:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L64	 ;,
 ; D:/TC/src/output.c:207:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	48(%rsp), %r9	 ; %sfp,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rsi, %r8	 ; _57,
	call	output_statement	 ;
	jmp	.L81	 ;
.L70:
 ; D:/TC/src/output.c:149:             ast_output(0, false, "for_statement\n");
	call	indention	 ;
 ; D:/TC/src/output.c:149:             ast_output(0, false, "for_statement\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC51(%rip), %rcx	 ;, tmp153
 ; D:/TC/src/output.c:150:             output_for(statement->stmt.for_stmt, outfile, indent + 1, indent_has_next);
	leaq	1(%rbx), %rdi	 ;, _4
 ; D:/TC/src/output.c:149:             ast_output(0, false, "for_statement\n");
	call	fputs	 ;
 ; D:/TC/src/output.c:150:             output_for(statement->stmt.for_stmt, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rsi	 ; statement_19(D)->stmt.for_stmt, _5
 ; D:/TC/src/output.c:223:     list(Statement*) body = list_copy(for_->body);
	movq	24(%rsi), %rcx	 ; _5->body, _5->body
	call	list_copy	 ;
 ; D:/TC/src/output.c:225:         ast_output(0, false, "initializer\n");
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/output.c:224:     if (for_->initializer != NULL) {
	cmpq	$0, (%rsi)	 ;, _5->initializer
 ; D:/TC/src/output.c:225:         ast_output(0, false, "initializer\n");
	movq	%rdi, %rdx	 ; _4,
	movq	48(%rsp), %r9	 ; %sfp,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/output.c:223:     list(Statement*) body = list_copy(for_->body);
	movq	%rax, %rbp	 ; tmp200, body
 ; D:/TC/src/output.c:224:     if (for_->initializer != NULL) {
	je	.L84	 ;,
 ; D:/TC/src/output.c:225:         ast_output(0, false, "initializer\n");
	call	indention	 ;
 ; D:/TC/src/output.c:225:         ast_output(0, false, "initializer\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC52(%rip), %rcx	 ;, tmp155
	call	fputs	 ;
 ; D:/TC/src/output.c:226:         output_variable(for_->initializer, outfile, indent + 1, indent_has_next);
	movq	48(%rsp), %r9	 ; %sfp,
	movq	(%rsi), %rcx	 ; _5->initializer,
	leaq	2(%rbx), %r8	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	call	output_variable	 ;
	jmp	.L85	 ;
.L84:
 ; D:/TC/src/output.c:228:         ast_output(0, false, "initializer: \"NULL\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:228:         ast_output(0, false, "initializer: \"NULL\"\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC53(%rip), %rcx	 ;, tmp157
	call	fputs	 ;
.L85:
 ; D:/TC/src/output.c:230:         ast_output(0, false, "condition\n");
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/output.c:229:     if (for_->condition != NULL) {
	cmpq	$0, 8(%rsi)	 ;, _5->condition
 ; D:/TC/src/output.c:230:         ast_output(0, false, "condition\n");
	movq	48(%rsp), %r9	 ; %sfp,
	movq	%rdi, %rdx	 ; _4,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/output.c:229:     if (for_->condition != NULL) {
	je	.L86	 ;,
 ; D:/TC/src/output.c:230:         ast_output(0, false, "condition\n");
	call	indention	 ;
 ; D:/TC/src/output.c:230:         ast_output(0, false, "condition\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC47(%rip), %rcx	 ;, tmp158
	call	fputs	 ;
 ; D:/TC/src/output.c:231:         output_expression(for_->condition, outfile, indent + 1, indent_has_next);
	movq	8(%rsi), %rcx	 ; _5->condition, _5->condition
	movq	48(%rsp), %r9	 ; %sfp,
	leaq	2(%rbx), %r8	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	call	output_expression	 ;
	jmp	.L87	 ;
.L86:
 ; D:/TC/src/output.c:233:         ast_output(0, false, "condition: \"NULL\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:233:         ast_output(0, false, "condition: \"NULL\"\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC54(%rip), %rcx	 ;, tmp161
	call	fputs	 ;
.L87:
 ; D:/TC/src/output.c:235:         ast_output(0, false, "increment\n");
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/output.c:234:     if (for_->increment != NULL) {
	cmpq	$0, 16(%rsi)	 ;, _5->increment
 ; D:/TC/src/output.c:235:         ast_output(0, false, "increment\n");
	movq	48(%rsp), %r9	 ; %sfp,
	movq	%rdi, %rdx	 ; _4,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/output.c:234:     if (for_->increment != NULL) {
	je	.L88	 ;,
 ; D:/TC/src/output.c:235:         ast_output(0, false, "increment\n");
	call	indention	 ;
 ; D:/TC/src/output.c:235:         ast_output(0, false, "increment\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC55(%rip), %rcx	 ;, tmp162
	call	fputs	 ;
 ; D:/TC/src/output.c:236:         output_expression(for_->increment, outfile, indent + 1, indent_has_next);
	movq	16(%rsi), %rcx	 ; _5->increment, _5->increment
	movq	48(%rsp), %r9	 ; %sfp,
	leaq	2(%rbx), %r8	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	call	output_expression	 ;
	jmp	.L89	 ;
.L88:
 ; D:/TC/src/output.c:238:         ast_output(0, false, "increment: \"NULL\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:238:         ast_output(0, false, "increment: \"NULL\"\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC56(%rip), %rcx	 ;, tmp165
	call	fputs	 ;
.L89:
 ; D:/TC/src/output.c:239:     ast_output(0, true, "body\n");
	movq	48(%rsp), %r9	 ; %sfp,
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%rdi, %rdx	 ; _4,
 ; D:/TC/src/output.c:242:         output_statement(statement, outfile, indent + 1, indent_has_next);
	addq	$2, %rbx	 ;, tmp187
 ; D:/TC/src/output.c:239:     ast_output(0, true, "body\n");
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:239:     ast_output(0, true, "body\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC48(%rip), %rcx	 ;, tmp166
	call	fputs	 ;
.L90:
 ; D:/TC/src/output.c:241:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbp, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp201, statement
 ; D:/TC/src/output.c:241:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L64	 ;,
 ; D:/TC/src/output.c:242:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	48(%rsp), %r9	 ; %sfp,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rbx, %r8	 ; tmp187,
	call	output_statement	 ;
	jmp	.L90	 ;
.L71:
 ; D:/TC/src/output.c:153:             ast_output(0, false, "while_statement\n");
	call	indention	 ;
 ; D:/TC/src/output.c:153:             ast_output(0, false, "while_statement\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC57(%rip), %rcx	 ;, tmp168
 ; D:/TC/src/output.c:154:             output_while(statement->stmt.while_stmt, outfile, indent + 1, indent_has_next);
	leaq	1(%rbx), %rdi	 ;, _6
 ; D:/TC/src/output.c:249:     output_expression(while_->condition, outfile, indent + 1, indent_has_next);
	addq	$2, %rbx	 ;, _82
 ; D:/TC/src/output.c:153:             ast_output(0, false, "while_statement\n");
	call	fputs	 ;
 ; D:/TC/src/output.c:154:             output_while(statement->stmt.while_stmt, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rbp	 ; statement_19(D)->stmt.while_stmt, _7
 ; D:/TC/src/output.c:247:     list(Statement*) body = list_copy(while_->body);
	movq	8(%rbp), %rcx	 ; _7->body, _7->body
	call	list_copy	 ;
 ; D:/TC/src/output.c:248:     ast_output(0, false, "condition\n");
	movq	48(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _6,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/output.c:247:     list(Statement*) body = list_copy(while_->body);
	movq	%rax, %rsi	 ; tmp202, body
 ; D:/TC/src/output.c:248:     ast_output(0, false, "condition\n");
	call	indention	 ;
 ; D:/TC/src/output.c:248:     ast_output(0, false, "condition\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC47(%rip), %rcx	 ;, tmp170
	call	fputs	 ;
 ; D:/TC/src/output.c:249:     output_expression(while_->condition, outfile, indent + 1, indent_has_next);
	movq	48(%rsp), %r9	 ; %sfp,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rbx, %r8	 ; _82,
	movq	0(%rbp), %rcx	 ; _7->condition,
	call	output_expression	 ;
 ; D:/TC/src/output.c:250:     ast_output(0, true, "body\n");
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	48(%rsp), %r9	 ; %sfp,
	movq	%rdi, %rdx	 ; _6,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:250:     ast_output(0, true, "body\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC48(%rip), %rcx	 ;, tmp171
	call	fputs	 ;
.L93:
 ; D:/TC/src/output.c:252:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rsi, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp203, statement
 ; D:/TC/src/output.c:252:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L64	 ;,
 ; D:/TC/src/output.c:253:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	48(%rsp), %r9	 ; %sfp,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rbx, %r8	 ; _82,
	call	output_statement	 ;
	jmp	.L93	 ;
.L73:
 ; D:/TC/src/output.c:157:             ast_output(0, false, "variable_declaration_statement\n");
	call	indention	 ;
 ; D:/TC/src/output.c:157:             ast_output(0, false, "variable_declaration_statement\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC58(%rip), %rcx	 ;, tmp172
	call	fputs	 ;
 ; D:/TC/src/output.c:158:             output_variable(statement->stmt.var, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rcx	 ; statement_19(D)->stmt.var,
	movq	48(%rsp), %r9	 ; %sfp,
	leaq	1(%rbx), %r8	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
 ; D:/TC/src/output.c:189: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:/TC/src/output.c:158:             output_variable(statement->stmt.var, outfile, indent + 1, indent_has_next);
	jmp	output_variable	 ;
.L69:
 ; D:/TC/src/output.c:161:             if (statement->stmt.expr == NULL) {
	cmpq	$0, (%rsi)	 ;, statement_19(D)->stmt.expr
	jne	.L95	 ;,
 ; D:/TC/src/output.c:162:                 ast_output(0, false, "return_statement: \"NULL\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:162:                 ast_output(0, false, "return_statement: \"NULL\"\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC59(%rip), %rcx	 ;, tmp174
	jmp	.L98	 ;
.L95:
 ; D:/TC/src/output.c:166:             ast_output(0, false, "return_statement\n");
	call	indention	 ;
 ; D:/TC/src/output.c:166:             ast_output(0, false, "return_statement\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC60(%rip), %rcx	 ;, tmp175
	jmp	.L99	 ;
.L68:
 ; D:/TC/src/output.c:170:             ast_output(0, false, "break_statement: \"NULL\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:170:             ast_output(0, false, "break_statement: \"NULL\"\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC61(%rip), %rcx	 ;, tmp177
.L98:
 ; D:/TC/src/output.c:189: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:/TC/src/output.c:170:             ast_output(0, false, "break_statement: \"NULL\"\n");
	jmp	fputs	 ;
.L66:
 ; D:/TC/src/output.c:173:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:173:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC62(%rip), %rcx	 ;, tmp178
	jmp	.L98	 ;
.L74:
 ; D:/TC/src/output.c:176:             if (statement->stmt.expr == NULL) {
	cmpq	$0, (%rsi)	 ;, statement_19(D)->stmt.expr
	jne	.L96	 ;,
 ; D:/TC/src/output.c:177:                 ast_output(0, false, "expression_statement: \"NULL\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:177:                 ast_output(0, false, "expression_statement: \"NULL\"\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC63(%rip), %rcx	 ;, tmp179
	jmp	.L98	 ;
.L96:
 ; D:/TC/src/output.c:181:             ast_output(0, false, "expression_statement\n");
	call	indention	 ;
 ; D:/TC/src/output.c:181:             ast_output(0, false, "expression_statement\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC64(%rip), %rcx	 ;, tmp180
.L99:
	call	fputs	 ;
 ; D:/TC/src/output.c:182:             output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rcx	 ; statement_19(D)->stmt.expr,
	movq	48(%rsp), %r9	 ; %sfp,
	leaq	1(%rbx), %r8	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
 ; D:/TC/src/output.c:189: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:/TC/src/output.c:182:             output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
	jmp	output_expression	 ;
.L65:
 ; D:/TC/src/output.c:185:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	48(%rsp), %r9	 ; %sfp,
	movq	%rbx, %rdx	 ; indent,
	xorl	%r8d, %r8d	 ;
	call	indention	 ;
 ; D:/TC/src/output.c:185:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movl	8(%rsi), %r8d	 ; statement_19(D)->type,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/output.c:189: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
 ; D:/TC/src/output.c:185:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	leaq	.LC65(%rip), %rdx	 ;, tmp183
 ; D:/TC/src/output.c:189: }
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:/TC/src/output.c:185:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	jmp	fprintf	 ;
.L64:
 ; D:/TC/src/output.c:189: }
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
	.section .rdata,"dr"
.LC66:
	.ascii "Var: \"NULL\"\12\0"
.LC67:
	.ascii "NULL\11%s\12\0"
.LC68:
	.ascii "%s\11%s(%s)\12\0"
.LC69:
	.ascii "%s\11%s\12\0"
	.text
	.def	output_var;	.scl	3;	.type	32;	.endef
output_var:
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp110, outfile
	movq	%r8, %rdx	 ; tmp111, indent
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
 ; D:/TC/src/output.c:509:     if (var == NULL) {
	testq	%rcx, %rcx	 ; var
	jne	.L103	 ;,
 ; D:/TC/src/output.c:510:         tac_output(indent, "Var: \"NULL\"\n");
	movq	%rsi, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:521: }
	addq	$56, %rsp	 ;,
 ; D:/TC/src/output.c:510:         tac_output(indent, "Var: \"NULL\"\n");
	movq	%rsi, %rdx	 ; outfile,
	leaq	.LC66(%rip), %rcx	 ;, tmp96
 ; D:/TC/src/output.c:521: }
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/output.c:510:         tac_output(indent, "Var: \"NULL\"\n");
	jmp	fputs	 ;
.L103:
	movq	%rcx, %rbx	 ; tmp109, var
 ; D:/TC/src/output.c:515:         tac_output(indent, "NULL\t%s\n", var->name);
	movq	%rsi, %rcx	 ; outfile,
 ; D:/TC/src/output.c:514:     if (var->type == NULL)
	cmpq	$0, 16(%rbx)	 ;, var_13(D)->type
	jne	.L104	 ;,
 ; D:/TC/src/output.c:515:         tac_output(indent, "NULL\t%s\n", var->name);
	call	indention_tac	 ;
 ; D:/TC/src/output.c:515:         tac_output(indent, "NULL\t%s\n", var->name);
	movq	8(%rbx), %r8	 ; var_13(D)->name,
 ; D:/TC/src/output.c:521: }
	addq	$56, %rsp	 ;,
 ; D:/TC/src/output.c:515:         tac_output(indent, "NULL\t%s\n", var->name);
	movq	%rsi, %rcx	 ; outfile,
 ; D:/TC/src/output.c:521: }
	popq	%rbx	 ;
 ; D:/TC/src/output.c:515:         tac_output(indent, "NULL\t%s\n", var->name);
	leaq	.LC67(%rip), %rdx	 ;, tmp98
 ; D:/TC/src/output.c:521: }
	popq	%rsi	 ;
 ; D:/TC/src/output.c:515:         tac_output(indent, "NULL\t%s\n", var->name);
	jmp	fprintf	 ;
.L104:
 ; D:/TC/src/output.c:516:     else if (var->original_name)
	cmpq	$0, (%rbx)	 ;, var_13(D)->original_name
	je	.L105	 ;,
 ; D:/TC/src/output.c:517:         tac_output(indent, "%s\t%s(%s)\n", var->type->name, var->name, var->original_name->name);
	call	indention_tac	 ;
 ; D:/TC/src/output.c:517:         tac_output(indent, "%s\t%s(%s)\n", var->type->name, var->name, var->original_name->name);
	movq	16(%rbx), %rax	 ; var_13(D)->type, var_13(D)->type
	movq	%rsi, %rcx	 ; outfile,
	leaq	.LC68(%rip), %rdx	 ;, tmp104
	movq	8(%rax), %r8	 ; _7->name, _7->name
	movq	(%rbx), %rax	 ; var_13(D)->original_name, var_13(D)->original_name
	movq	8(%rax), %rax	 ; _4->name, _4->name
	movq	%rax, 32(%rsp)	 ; _4->name,
	movq	8(%rbx), %r9	 ; var_13(D)->name,
	call	fprintf	 ;
 ; D:/TC/src/output.c:521: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
.L105:
 ; D:/TC/src/output.c:519:         tac_output(indent, "%s\t%s\n", var->type->name, var->name);
	call	indention_tac	 ;
 ; D:/TC/src/output.c:519:         tac_output(indent, "%s\t%s\n", var->type->name, var->name);
	movq	16(%rbx), %rax	 ; var_13(D)->type, var_13(D)->type
	movq	8(%rbx), %r9	 ; var_13(D)->name,
	movq	%rsi, %rcx	 ; outfile,
	leaq	.LC69(%rip), %rdx	 ;, tmp108
	movq	8(%rax), %r8	 ; _10->name,
 ; D:/TC/src/output.c:521: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/output.c:519:         tac_output(indent, "%s\t%s\n", var->type->name, var->name);
	jmp	fprintf	 ;
	.section .rdata,"dr"
.LC70:
	.ascii "true\0"
.LC71:
	.ascii "false\0"
.LC72:
	.ascii "\"NULL\"\0"
.LC73:
	.ascii "%s(%s)\0"
.LC74:
	.ascii "%lld\0"
.LC75:
	.ascii "%f\0"
.LC76:
	.ascii "\"%s\"\0"
.LC77:
	.ascii "void\0"
.LC78:
	.ascii "NONE\0"
.LC79:
	.ascii "unknown_ArgType: %u\0"
	.text
	.def	output_arg;	.scl	3;	.type	32;	.endef
output_arg:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp148, outfile
	subq	$40, %rsp	 ;,
 ; D:/TC/src/output.c:546:     if (arg == NULL) {
	testq	%rcx, %rcx	 ; arg
	jne	.L110	 ;,
 ; D:/TC/src/output.c:547:         tac_output(0, "\"NULL\"");
	xorl	%edx, %edx	 ;
	movq	%rbx, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:547:         tac_output(0, "\"NULL\"");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC72(%rip), %rcx	 ;, tmp109
	jmp	.L127	 ;
.L110:
 ; D:/TC/src/output.c:551:     switch (arg->kind) {
	cmpl	$9, 16(%rcx)	 ;, arg_27(D)->kind
	movq	%rcx, %rsi	 ; tmp147, arg
	ja	.L111	 ;,
	movl	16(%rcx), %eax	 ; arg_27(D)->kind, arg_27(D)->kind
	leaq	.L113(%rip), %rdx	 ;, tmp111
	movslq	(%rdx,%rax,4), %rax	 ;, tmp113
	addq	%rdx, %rax	 ; tmp111, tmp114
	jmp	*%rax	 ; tmp114
	.section .rdata,"dr"
	.align 4
.L113:
	.long	.L114-.L113
	.long	.L120-.L113
	.long	.L119-.L113
	.long	.L118-.L113
	.long	.L117-.L113
	.long	.L116-.L113
	.long	.L115-.L113
	.long	.L114-.L113
	.long	.L114-.L113
	.long	.L112-.L113
	.text
.L115:
 ; D:/TC/src/output.c:563:         case ARG_LABEL: tac_output(0, "%s", arg->value.label->name); break;
	xorl	%edx, %edx	 ;
	movq	%rbx, %rcx	 ; outfile,
.L122:
 ; D:/TC/src/output.c:556:                 tac_output(0, "%s", arg->value.variable->name);
	call	indention_tac	 ;
 ; D:/TC/src/output.c:556:                 tac_output(0, "%s", arg->value.variable->name);
	movq	(%rsi), %rax	 ;* arg, arg_27(D)->value.variable
	movq	8(%rax), %rcx	 ;, _8->name
.L129:
	movq	%rbx, %rdx	 ; outfile,
.L127:
 ; D:/TC/src/output.c:575: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/output.c:556:                 tac_output(0, "%s", arg->value.variable->name);
	jmp	fputs	 ;
.L120:
 ; D:/TC/src/output.c:558:         case ARG_INT: tac_output(0, "%lld", arg->value.int_value); break;
	xorl	%edx, %edx	 ;
	movq	%rbx, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:558:         case ARG_INT: tac_output(0, "%lld", arg->value.int_value); break;
	movq	(%rsi), %r8	 ; arg_27(D)->value.int_value,
	leaq	.LC74(%rip), %rdx	 ;, tmp123
	jmp	.L130	 ;
.L119:
 ; D:/TC/src/output.c:559:         case ARG_FLOAT: tac_output(0, "%f", arg->value.float_value); break;
	movq	%rbx, %rcx	 ; outfile,
	xorl	%edx, %edx	 ;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:559:         case ARG_FLOAT: tac_output(0, "%f", arg->value.float_value); break;
	movq	(%rsi), %r8	 ; arg_27(D)->value.float_value, arg_27(D)->value.float_value
 ; D:/TC/src/output.c:575: }
	addq	$40, %rsp	 ;,
 ; D:/TC/src/output.c:559:         case ARG_FLOAT: tac_output(0, "%f", arg->value.float_value); break;
	movq	%rbx, %rcx	 ; outfile,
	leaq	.LC75(%rip), %rdx	 ;, tmp126
 ; D:/TC/src/output.c:575: }
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/output.c:559:         case ARG_FLOAT: tac_output(0, "%f", arg->value.float_value); break;
	movq	%r8, %xmm2	 ; arg_27(D)->value.float_value,
	jmp	fprintf	 ;
.L118:
 ; D:/TC/src/output.c:560:         case ARG_STRING: tac_output(0, "\"%s\"", arg->value.string_value); break;
	xorl	%edx, %edx	 ;
	movq	%rbx, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:560:         case ARG_STRING: tac_output(0, "\"%s\"", arg->value.string_value); break;
	movq	(%rsi), %r8	 ; arg_27(D)->value.string_value,
	leaq	.LC76(%rip), %rdx	 ;, tmp127
.L130:
 ; D:/TC/src/output.c:575: }
	addq	$40, %rsp	 ;,
 ; D:/TC/src/output.c:560:         case ARG_STRING: tac_output(0, "\"%s\"", arg->value.string_value); break;
	movq	%rbx, %rcx	 ; outfile,
 ; D:/TC/src/output.c:575: }
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/output.c:560:         case ARG_STRING: tac_output(0, "\"%s\"", arg->value.string_value); break;
	jmp	fprintf	 ;
.L117:
 ; D:/TC/src/output.c:561:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	xorl	%edx, %edx	 ;
	movq	%rbx, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:561:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	cmpb	$0, (%rsi)	 ;, arg_27(D)->value.bool_value
	leaq	.LC71(%rip), %rcx	 ;, tmp145
	leaq	.LC70(%rip), %rax	 ;, tmp146
	cmovne	%rax, %rcx	 ; tmp145,, tmp146, iftmp.2_25
	jmp	.L129	 ;
.L116:
 ; D:/TC/src/output.c:562:         case ARG_VOID: tac_output(0, "void"); break;
	xorl	%edx, %edx	 ;
	movq	%rbx, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:562:         case ARG_VOID: tac_output(0, "void"); break;
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC77(%rip), %rcx	 ;, tmp128
	jmp	.L127	 ;
.L114:
 ; D:/TC/src/output.c:566:             if (arg->value.subroutine->original_name)
	movq	(%rcx), %rax	 ;* arg, arg_27(D)->value.subroutine
 ; D:/TC/src/output.c:567:                 tac_output(0, "%s(%s)", arg->value.subroutine->name, arg->value.subroutine->original_name->name);
	xorl	%edx, %edx	 ;
	movq	%rbx, %rcx	 ; outfile,
 ; D:/TC/src/output.c:566:             if (arg->value.subroutine->original_name)
	cmpq	$0, (%rax)	 ;,* arg_27(D)->value.subroutine
	je	.L122	 ;,
 ; D:/TC/src/output.c:567:                 tac_output(0, "%s(%s)", arg->value.subroutine->name, arg->value.subroutine->original_name->name);
	call	indention_tac	 ;
 ; D:/TC/src/output.c:567:                 tac_output(0, "%s(%s)", arg->value.subroutine->name, arg->value.subroutine->original_name->name);
	movq	(%rsi), %rax	 ;* arg, _18
	movq	%rbx, %rcx	 ; outfile,
	movq	(%rax), %rdx	 ;* _18, _18->original_name
	movq	8(%rax), %r8	 ;,
	movq	8(%rdx), %r9	 ;,
 ; D:/TC/src/output.c:575: }
	addq	$40, %rsp	 ;,
 ; D:/TC/src/output.c:567:                 tac_output(0, "%s(%s)", arg->value.subroutine->name, arg->value.subroutine->original_name->name);
	leaq	.LC73(%rip), %rdx	 ;, tmp135
 ; D:/TC/src/output.c:575: }
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/output.c:567:                 tac_output(0, "%s(%s)", arg->value.subroutine->name, arg->value.subroutine->original_name->name);
	jmp	fprintf	 ;
.L112:
 ; D:/TC/src/output.c:571:         case ARG_NONE: tac_output(0, "NONE"); break;
	xorl	%edx, %edx	 ;
	movq	%rbx, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:571:         case ARG_NONE: tac_output(0, "NONE"); break;
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC78(%rip), %rcx	 ;, tmp138
	jmp	.L127	 ;
.L111:
 ; D:/TC/src/output.c:572:         default: tac_output(0, "unknown_ArgType: %u", arg->kind); break;
	movq	%rbx, %rcx	 ; outfile,
	xorl	%edx, %edx	 ;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:572:         default: tac_output(0, "unknown_ArgType: %u", arg->kind); break;
	movl	16(%rsi), %r8d	 ; arg_27(D)->kind,
 ; D:/TC/src/output.c:575: }
	addq	$40, %rsp	 ;,
 ; D:/TC/src/output.c:572:         default: tac_output(0, "unknown_ArgType: %u", arg->kind); break;
	movq	%rbx, %rcx	 ; outfile,
	leaq	.LC79(%rip), %rdx	 ;, tmp140
 ; D:/TC/src/output.c:575: }
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/output.c:572:         default: tac_output(0, "unknown_ArgType: %u", arg->kind); break;
	jmp	fprintf	 ;
	.section .rdata,"dr"
.LC80:
	.ascii "NULL\0"
.LC81:
	.ascii "import\12\0"
.LC82:
	.ascii "source: \"%s\"\12\0"
.LC83:
	.ascii "parameters\12\0"
.LC84:
	.ascii "parameters[%d]\12\0"
.LC85:
	.ascii "class\12\0"
.LC86:
	.ascii "members\12\0"
.LC87:
	.ascii "method\12\0"
.LC88:
	.ascii "variable\12\0"
.LC89:
	.ascii "unknown_ClassMemberType: %u\12\0"
.LC90:
	.ascii "unknown_CodeMemberType: %u\12\0"
	.text
	.globl	output_code
	.def	output_code;	.scl	2;	.type	32;	.endef
output_code:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%r8, %rbx	 ; tmp184, indent
	subq	$72, %rsp	 ;,
 ; D:/TC/src/output.c:45:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rcx), %rcx	 ; code_5(D)->members,
 ; D:/TC/src/output.c:43: void output_code(Code* code, FILE* outfile, size_t indent, char indent_has_next[32]) {
	movq	%rdx, 152(%rsp)	 ; tmp183, outfile
	movq	%r9, 168(%rsp)	 ; tmp185, indent_has_next
 ; D:/TC/src/output.c:45:     list(CodeMember*) members = list_copy(code->members);
	call	list_copy	 ;
	movq	%rax, 48(%rsp)	 ; tmp186, %sfp
.L133:
 ; D:/TC/src/output.c:47:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	movq	48(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rsi	 ; tmp197, member
 ; D:/TC/src/output.c:47:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	 ; member
	je	.L157	 ;,
 ; D:/TC/src/output.c:24:     switch (code_member->type) {
	movl	8(%rsi), %eax	 ; member_9->type, _14
 ; D:/TC/src/output.c:38:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movq	168(%rsp), %r9	 ; indent_has_next,
 ; D:/TC/src/output.c:48:         output_code_member(member, outfile, indent + 1, indent_has_next);
	leaq	1(%rbx), %rdx	 ;, _2
 ; D:/TC/src/output.c:38:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	xorl	%r8d, %r8d	 ;
	movq	152(%rsp), %rcx	 ; outfile,
 ; D:/TC/src/output.c:24:     switch (code_member->type) {
	cmpl	$1, %eax	 ;, _14
	je	.L134	 ;,
	cmpl	$2, %eax	 ;, _14
	je	.L135	 ;,
	testl	%eax, %eax	 ; _14
	jne	.L136	 ;,
 ; D:/TC/src/output.c:26:             ast_output(0, false, "import\n");
	call	indention	 ;
 ; D:/TC/src/output.c:26:             ast_output(0, false, "import\n");
	leaq	.LC81(%rip), %rcx	 ;, tmp134
 ; D:/TC/src/output.c:27:             output_import(code_member->content.import, outfile, indent + 1, indent_has_next);
	leaq	2(%rbx), %rdi	 ;, _15
 ; D:/TC/src/output.c:26:             ast_output(0, false, "import\n");
	movq	152(%rsp), %rdx	 ; outfile,
	call	fputs	 ;
 ; D:/TC/src/output.c:53:     ast_output(0, false, "name\n");
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _15,
 ; D:/TC/src/output.c:27:             output_import(code_member->content.import, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rsi	 ; member_9->content.import, _16
 ; D:/TC/src/output.c:53:     ast_output(0, false, "name\n");
	movq	168(%rsp), %r9	 ; indent_has_next,
	movq	152(%rsp), %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:53:     ast_output(0, false, "name\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC32(%rip), %rcx	 ;, tmp135
	call	fputs	 ;
 ; D:/TC/src/output.c:54:     output_name(import->name, outfile, indent + 1, indent_has_next);
	movq	168(%rsp), %r9	 ; indent_has_next,
	movq	(%rsi), %rcx	 ; _16->name,
	leaq	3(%rbx), %r8	 ;,
	movq	152(%rsp), %rdx	 ; outfile,
	call	output_name	 ;
 ; D:/TC/src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	168(%rsp), %r9	 ; indent_has_next,
	movq	152(%rsp), %rcx	 ; outfile,
	movq	%rdi, %rdx	 ; _15,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	8(%rsi), %r8	 ; _16->source, _24
	testq	%r8, %r8	 ; _24
	jne	.L137	 ;,
 ; D:/TC/src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	leaq	.LC80(%rip), %r8	 ;, _24
.L137:
 ; D:/TC/src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	152(%rsp), %rcx	 ; outfile,
	leaq	.LC82(%rip), %rdx	 ;, tmp137
	call	fprintf	 ;
 ; D:/TC/src/output.c:57: }
	jmp	.L133	 ;
.L134:
 ; D:/TC/src/output.c:30:             ast_output(0, false, "function\n");
	call	indention	 ;
 ; D:/TC/src/output.c:31:             output_function(code_member->content.function, outfile, indent + 1, indent_has_next);
	leaq	2(%rbx), %rdi	 ;, _17
 ; D:/TC/src/output.c:68:     int index = -1;
	orl	$-1, %r13d	 ;, index
 ; D:/TC/src/output.c:71:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	leaq	4(%rbx), %r14	 ;, tmp178
 ; D:/TC/src/output.c:30:             ast_output(0, false, "function\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC36(%rip), %rcx	 ;, tmp138
	call	fputs	 ;
 ; D:/TC/src/output.c:60:     ast_output(0, false, "name\n");
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _17,
 ; D:/TC/src/output.c:31:             output_function(code_member->content.function, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rbp	 ; member_9->content.function, _18
 ; D:/TC/src/output.c:60:     ast_output(0, false, "name\n");
	movq	168(%rsp), %r9	 ; indent_has_next,
	movq	152(%rsp), %rcx	 ; outfile,
 ; D:/TC/src/output.c:61:     output_name(function->name, outfile, indent + 1, indent_has_next);
	leaq	3(%rbx), %rsi	 ;, _26
 ; D:/TC/src/output.c:60:     ast_output(0, false, "name\n");
	call	indention	 ;
 ; D:/TC/src/output.c:60:     ast_output(0, false, "name\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC32(%rip), %rcx	 ;, tmp139
	call	fputs	 ;
 ; D:/TC/src/output.c:61:     output_name(function->name, outfile, indent + 1, indent_has_next);
	movq	0(%rbp), %rcx	 ; _18->name,
	movq	168(%rsp), %r9	 ; indent_has_next,
	movq	%rsi, %r8	 ; _26,
	movq	152(%rsp), %rdx	 ; outfile,
	call	output_name	 ;
 ; D:/TC/src/output.c:62:     ast_output(0, false, "return_type\n");
	movq	168(%rsp), %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _17,
	movq	152(%rsp), %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:62:     ast_output(0, false, "return_type\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC7(%rip), %rcx	 ;, tmp140
	call	fputs	 ;
 ; D:/TC/src/output.c:63:     output_name(function->return_type, outfile, indent + 1, indent_has_next);
	movq	8(%rbp), %rcx	 ; _18->return_type, _18->return_type
	movq	168(%rsp), %r9	 ; indent_has_next,
	movq	%rsi, %r8	 ; _26,
	movq	152(%rsp), %rdx	 ; outfile,
	call	output_name	 ;
 ; D:/TC/src/output.c:64:     ast_output(0, false, "parameters\n");
	movq	168(%rsp), %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _17,
	movq	152(%rsp), %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:64:     ast_output(0, false, "parameters\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC83(%rip), %rcx	 ;, tmp142
	call	fputs	 ;
 ; D:/TC/src/output.c:65:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%rbp), %rcx	 ; _18->parameters, _18->parameters
	call	list_copy	 ;
 ; D:/TC/src/output.c:66:     list(Statement*) body = list_copy(function->body);
	movq	24(%rbp), %rcx	 ; _18->body, _18->body
 ; D:/TC/src/output.c:65:     list(Variable*) parameters = list_copy(function->parameters);
	movq	%rax, %r12	 ; tmp187, parameters
 ; D:/TC/src/output.c:66:     list(Statement*) body = list_copy(function->body);
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp188, body
.L139:
 ; D:/TC/src/output.c:69:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%r12, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:/TC/src/output.c:70:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	168(%rsp), %r9	 ; indent_has_next,
 ; D:/TC/src/output.c:69:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%rax, %r15	 ; tmp189, parameter
 ; D:/TC/src/output.c:69:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	 ; parameter
	je	.L158	 ;,
 ; D:/TC/src/output.c:70:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	152(%rsp), %rcx	 ; outfile,
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; _26,
 ; D:/TC/src/output.c:70:         ast_output(1, false, "parameters[%d]\n", ++index);
	incl	%r13d	 ; index
 ; D:/TC/src/output.c:70:         ast_output(1, false, "parameters[%d]\n", ++index);
	call	indention	 ;
 ; D:/TC/src/output.c:70:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	152(%rsp), %rcx	 ; outfile,
	movl	%r13d, %r8d	 ; index,
	leaq	.LC84(%rip), %rdx	 ;,
	call	fprintf	 ;
 ; D:/TC/src/output.c:71:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	movq	168(%rsp), %r9	 ; indent_has_next,
	movq	%r14, %r8	 ; tmp178,
	movq	%r15, %rcx	 ; parameter,
	movq	152(%rsp), %rdx	 ; outfile,
	call	output_variable	 ;
	jmp	.L139	 ;
.L158:
 ; D:/TC/src/output.c:73:     ast_output(0, true, "body\n");
	movq	152(%rsp), %rcx	 ; outfile,
	movq	%rdi, %rdx	 ; _17,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:73:     ast_output(0, true, "body\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC48(%rip), %rcx	 ;, tmp147
	call	fputs	 ;
.L141:
 ; D:/TC/src/output.c:75:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbp, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp190, statement
 ; D:/TC/src/output.c:75:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L133	 ;,
 ; D:/TC/src/output.c:76:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	168(%rsp), %r9	 ; indent_has_next,
	movq	152(%rsp), %rdx	 ; outfile,
	movq	%rsi, %r8	 ; _26,
	call	output_statement	 ;
	jmp	.L141	 ;
.L135:
 ; D:/TC/src/output.c:34:             ast_output(0, false, "class\n");
	call	indention	 ;
 ; D:/TC/src/output.c:34:             ast_output(0, false, "class\n");
	leaq	.LC85(%rip), %rcx	 ;, tmp148
 ; D:/TC/src/output.c:35:             output_class(code_member->content.class, outfile, indent + 1, indent_has_next);
	leaq	2(%rbx), %rdi	 ;, _19
 ; D:/TC/src/output.c:34:             ast_output(0, false, "class\n");
	movq	152(%rsp), %rdx	 ; outfile,
 ; D:/TC/src/output.c:104:             ast_output(0, false, "method\n");
	leaq	.LC87(%rip), %r14	 ;, tmp174
 ; D:/TC/src/output.c:34:             ast_output(0, false, "class\n");
	call	fputs	 ;
 ; D:/TC/src/output.c:119:     ast_output(0, false, "name\n");
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _19,
 ; D:/TC/src/output.c:35:             output_class(code_member->content.class, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rsi	 ; member_9->content.class, _20
 ; D:/TC/src/output.c:119:     ast_output(0, false, "name\n");
	movq	168(%rsp), %r9	 ; indent_has_next,
	movq	152(%rsp), %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:119:     ast_output(0, false, "name\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC32(%rip), %rcx	 ;,
	call	fputs	 ;
 ; D:/TC/src/output.c:120:     output_name(class->name, outfile, indent + 1, indent_has_next);
	leaq	3(%rbx), %rax	 ;, _38
	movq	168(%rsp), %r9	 ; indent_has_next,
	movq	(%rsi), %rcx	 ; _20->name,
	movq	152(%rsp), %rdx	 ; outfile,
	movq	%rax, %r8	 ; _38,
	movq	%rax, 32(%rsp)	 ; _38, %sfp
	call	output_name	 ;
 ; D:/TC/src/output.c:121:     ast_output(0, true, "members\n");
	movq	168(%rsp), %r9	 ; indent_has_next,
	movq	152(%rsp), %rcx	 ; outfile,
	movq	%rdi, %rdx	 ; _19,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:121:     ast_output(0, true, "members\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC86(%rip), %rcx	 ;, tmp150
	call	fputs	 ;
 ; D:/TC/src/output.c:122:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rsi), %rcx	 ; _20->members, _20->members
	call	list_copy	 ;
	movq	%rax, 56(%rsp)	 ; tmp191, %sfp
.L143:
 ; D:/TC/src/output.c:124:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	movq	56(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rsi	 ; tmp196, member
 ; D:/TC/src/output.c:124:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	 ; member
	je	.L133	 ;,
 ; D:/TC/src/output.c:102:     switch (class_member->type) {
	movl	8(%rsi), %eax	 ; member_42->type, _43
 ; D:/TC/src/output.c:102:     switch (class_member->type) {
	testl	%eax, %eax	 ; _43
	je	.L144	 ;,
	decl	%eax	 ; _43
	jne	.L159	 ;,
 ; D:/TC/src/output.c:108:             ast_output(0, false, "variable\n");
	movq	168(%rsp), %r9	 ; indent_has_next,
	movq	32(%rsp), %rdx	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	152(%rsp), %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:108:             ast_output(0, false, "variable\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC88(%rip), %rcx	 ;, tmp162
	call	fputs	 ;
 ; D:/TC/src/output.c:109:             output_variable(class_member->content.variable, outfile, indent + 1, indent_has_next);
	movq	168(%rsp), %r9	 ; indent_has_next,
	movq	(%rsi), %rcx	 ; member_42->content.variable,
	leaq	4(%rbx), %r8	 ;,
	movq	152(%rsp), %rdx	 ; outfile,
	call	output_variable	 ;
 ; D:/TC/src/output.c:110:             break;
	jmp	.L143	 ;
.L144:
 ; D:/TC/src/output.c:104:             ast_output(0, false, "method\n");
	movq	32(%rsp), %rdx	 ; %sfp,
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/output.c:105:             output_method(class_member->content.method, outfile, indent + 1, indent_has_next);
	leaq	4(%rbx), %rdi	 ;, _44
 ; D:/TC/src/output.c:89:     int index = -1;
	orl	$-1, %r13d	 ;, index
 ; D:/TC/src/output.c:104:             ast_output(0, false, "method\n");
	movq	168(%rsp), %r9	 ; indent_has_next,
	movq	152(%rsp), %rcx	 ; outfile,
 ; D:/TC/src/output.c:92:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	leaq	6(%rbx), %r15	 ;, tmp173
 ; D:/TC/src/output.c:104:             ast_output(0, false, "method\n");
	call	indention	 ;
 ; D:/TC/src/output.c:104:             ast_output(0, false, "method\n");
	movq	152(%rsp), %rdx	 ; outfile,
	movq	%r14, %rcx	 ; tmp174,
	call	fputs	 ;
 ; D:/TC/src/output.c:81:     ast_output(0, false, "name\n");
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _44,
 ; D:/TC/src/output.c:105:             output_method(class_member->content.method, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rbp	 ; member_42->content.method, _45
 ; D:/TC/src/output.c:81:     ast_output(0, false, "name\n");
	movq	168(%rsp), %r9	 ; indent_has_next,
	movq	152(%rsp), %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:81:     ast_output(0, false, "name\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC32(%rip), %rcx	 ;,
	call	fputs	 ;
 ; D:/TC/src/output.c:82:     output_name(method->name, outfile, indent + 1, indent_has_next);
	leaq	5(%rbx), %rax	 ;, _49
	movq	0(%rbp), %rcx	 ; _45->name,
	movq	168(%rsp), %r9	 ; indent_has_next,
	movq	152(%rsp), %rdx	 ; outfile,
	movq	%rax, %r8	 ; _49,
	movq	%rax, 40(%rsp)	 ; _49, %sfp
	call	output_name	 ;
 ; D:/TC/src/output.c:83:     ast_output(0, false, "return_type\n");
	movq	168(%rsp), %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _44,
	movq	152(%rsp), %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:83:     ast_output(0, false, "return_type\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC7(%rip), %rcx	 ;, tmp154
	call	fputs	 ;
 ; D:/TC/src/output.c:84:     output_name(method->return_type, outfile, indent + 1, indent_has_next);
	movq	8(%rbp), %rcx	 ; _45->return_type, _45->return_type
	leaq	5(%rbx), %r8	 ;,
	movq	168(%rsp), %r9	 ; indent_has_next,
	movq	152(%rsp), %rdx	 ; outfile,
	call	output_name	 ;
 ; D:/TC/src/output.c:85:     ast_output(0, false, "parameters\n");
	movq	168(%rsp), %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _44,
	movq	152(%rsp), %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:85:     ast_output(0, false, "parameters\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC83(%rip), %rcx	 ;, tmp156
	call	fputs	 ;
 ; D:/TC/src/output.c:86:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%rbp), %rcx	 ; _45->parameters, _45->parameters
	call	list_copy	 ;
 ; D:/TC/src/output.c:87:     list(Statement*) body = list_copy(method->body);
	movq	24(%rbp), %rcx	 ; _45->body, _45->body
 ; D:/TC/src/output.c:86:     list(Variable*) parameters = list_copy(method->parameters);
	movq	%rax, %r12	 ; tmp192, parameters
 ; D:/TC/src/output.c:87:     list(Statement*) body = list_copy(method->body);
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp193, body
.L147:
 ; D:/TC/src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%r12, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:/TC/src/output.c:91:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	168(%rsp), %r9	 ; indent_has_next,
 ; D:/TC/src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%rax, %rsi	 ; tmp194, parameter
 ; D:/TC/src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	 ; parameter
	je	.L160	 ;,
 ; D:/TC/src/output.c:91:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	152(%rsp), %rcx	 ; outfile,
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/output.c:91:         ast_output(1, false, "parameters[%d]\n", ++index);
	incl	%r13d	 ; index
 ; D:/TC/src/output.c:91:         ast_output(1, false, "parameters[%d]\n", ++index);
	call	indention	 ;
 ; D:/TC/src/output.c:91:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	152(%rsp), %rcx	 ; outfile,
	movl	%r13d, %r8d	 ; index,
	leaq	.LC84(%rip), %rdx	 ;,
	call	fprintf	 ;
 ; D:/TC/src/output.c:92:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	movq	168(%rsp), %r9	 ; indent_has_next,
	movq	%r15, %r8	 ; tmp173,
	movq	%rsi, %rcx	 ; parameter,
	movq	152(%rsp), %rdx	 ; outfile,
	call	output_variable	 ;
	jmp	.L147	 ;
.L160:
 ; D:/TC/src/output.c:94:     ast_output(0, true, "body\n");
	movq	152(%rsp), %rcx	 ; outfile,
	movq	%rdi, %rdx	 ; _44,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:94:     ast_output(0, true, "body\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC48(%rip), %rcx	 ;, tmp161
	call	fputs	 ;
.L149:
 ; D:/TC/src/output.c:96:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbp, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp195, statement
 ; D:/TC/src/output.c:96:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L143	 ;,
 ; D:/TC/src/output.c:97:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	168(%rsp), %r9	 ; indent_has_next,
	movq	40(%rsp), %r8	 ; %sfp,
	movq	152(%rsp), %rdx	 ; outfile,
	call	output_statement	 ;
	jmp	.L149	 ;
.L159:
 ; D:/TC/src/output.c:112:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movq	32(%rsp), %rdx	 ; %sfp,
	movq	152(%rsp), %rcx	 ; outfile,
	xorl	%r8d, %r8d	 ;
	movq	168(%rsp), %r9	 ; indent_has_next,
	call	indention	 ;
 ; D:/TC/src/output.c:112:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movl	8(%rsi), %r8d	 ; member_42->type,
	movq	152(%rsp), %rcx	 ; outfile,
	leaq	.LC89(%rip), %rdx	 ;, tmp165
	call	fprintf	 ;
 ; D:/TC/src/output.c:113:             break;
	jmp	.L143	 ;
.L136:
 ; D:/TC/src/output.c:38:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	call	indention	 ;
 ; D:/TC/src/output.c:38:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movl	8(%rsi), %r8d	 ; member_9->type,
	movq	152(%rsp), %rcx	 ; outfile,
	leaq	.LC90(%rip), %rdx	 ;, tmp167
	call	fprintf	 ;
 ; D:/TC/src/output.c:39:             break;
	jmp	.L133	 ;
.L157:
 ; D:/TC/src/output.c:50: }
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
	.section .rdata,"dr"
.LC91:
	.ascii "TAC: \"NULL\"\12\0"
.LC92:
	.ascii "TAC {\12\0"
.LC93:
	.ascii "designs: []\12\0"
.LC94:
	.ascii "designs: [\12\0"
.LC95:
	.ascii "NULL \0"
.LC96:
	.ascii "%s \0"
.LC97:
	.ascii "%zu \0"
.LC98:
	.ascii "{}\12\0"
.LC99:
	.ascii "{\12\0"
.LC100:
	.ascii "NULL\11\0"
.LC101:
	.ascii "%s\11\0"
.LC102:
	.ascii "%s(%s) \0"
.LC103:
	.ascii "%zu\12\0"
.LC104:
	.ascii "}\12\0"
.LC105:
	.ascii "]\12\0"
.LC106:
	.ascii "entry_point: \"NULL\"\12\0"
.LC107:
	.ascii "entry_point: %s\12\0"
.LC108:
	.ascii "global: []\12\0"
.LC109:
	.ascii "global: [\12\0"
.LC110:
	.ascii "subroutines: []\12\0"
.LC111:
	.ascii "subroutines: [\12\0"
.LC112:
	.ascii "NULL {\12\0"
.LC113:
	.ascii "%s {\12\0"
.LC114:
	.ascii "return_type: \"NULL\"\12\0"
.LC115:
	.ascii "return_type: %s\12\0"
.LC116:
	.ascii "parameters: []\12\0"
.LC117:
	.ascii "parameters: [\12\0"
.LC118:
	.ascii "local: []\12\0"
.LC119:
	.ascii "local: [\12\0"
.LC120:
	.ascii "instructions: []\12\0"
.LC121:
	.ascii "instructions: [\12\0"
.LC122:
	.ascii "add\11\0"
.LC123:
	.ascii "sub\11\0"
.LC124:
	.ascii "mul\11\0"
.LC125:
	.ascii "div\11\0"
.LC126:
	.ascii "mod\11\0"
.LC127:
	.ascii "eq \11\0"
.LC128:
	.ascii "ne \11\0"
.LC129:
	.ascii "lt \11\0"
.LC130:
	.ascii "gt \11\0"
.LC131:
	.ascii "le \11\0"
.LC132:
	.ascii "ge \11\0"
.LC133:
	.ascii "and\11\0"
.LC134:
	.ascii "or \11\0"
.LC135:
	.ascii "not\11\0"
.LC136:
	.ascii "assign\11\0"
.LC137:
	.ascii "get_attr\11\0"
.LC138:
	.ascii "get_elem\11\0"
.LC139:
	.ascii "param\11\0"
.LC140:
	.ascii "alloc\11\0"
.LC141:
	.ascii "jmp_c\11\0"
.LC142:
	.ascii "jmp\11\0"
.LC143:
	.ascii "ret\11\0"
.LC144:
	.ascii "call\11\0"
.LC145:
	.ascii "load\11\0"
.LC146:
	.ascii "store\11\0"
.LC147:
	.ascii "INST_NONE\12\0"
.LC148:
	.ascii "unknown_InstructionType: %u\12\0"
	.text
	.globl	output_TAC
	.def	output_TAC;	.scl	2;	.type	32;	.endef
output_TAC:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%r8, %rsi	 ; tmp306, indent
	pushq	%rbx	 ;
	subq	$88, %rsp	 ;,
 ; D:/TC/src/output.c:420: void output_TAC(TAC* tac, FILE* outfile, size_t indent) {
	movq	%rdx, 40(%rsp)	 ; tmp305, %sfp
 ; D:/TC/src/output.c:422:     if (tac == NULL) {
	testq	%rcx, %rcx	 ; tac
	jne	.L162	 ;,
 ; D:/TC/src/output.c:423:         tac_output(indent, "TAC: \"NULL\"\n");
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%r8, %rdx	 ; indent,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:423:         tac_output(indent, "TAC: \"NULL\"\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC91(%rip), %rcx	 ;, tmp166
	jmp	.L254	 ;
.L162:
	movq	%rcx, %rbp	 ; tmp304, tac
 ; D:/TC/src/output.c:427:     tac_output(indent, "TAC {\n");
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%r8, %rdx	 ; indent,
 ; D:/TC/src/output.c:429:         tac_output(indent + 1, "designs: []\n");
	leaq	1(%rsi), %rdi	 ;, _193
 ; D:/TC/src/output.c:427:     tac_output(indent, "TAC {\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:427:     tac_output(indent, "TAC {\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC92(%rip), %rcx	 ;, tmp167
	call	fputs	 ;
 ; D:/TC/src/output.c:428:     if (list_is_empty(tac->attribute_tables))
	movq	0(%rbp), %rcx	 ; tac_32(D)->attribute_tables,
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:429:         tac_output(indent + 1, "designs: []\n");
	movq	%rdi, 48(%rsp)	 ; _193, %sfp
 ; D:/TC/src/output.c:428:     if (list_is_empty(tac->attribute_tables))
	testb	%al, %al	 ; tmp307
	je	.L163	 ;,
 ; D:/TC/src/output.c:429:         tac_output(indent + 1, "designs: []\n");
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%rdi, %rdx	 ; _193,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:429:         tac_output(indent + 1, "designs: []\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC93(%rip), %rcx	 ;, tmp168
	jmp	.L245	 ;
.L163:
 ; D:/TC/src/output.c:431:         tac_output(indent + 1, "designs: [\n");
	movq	48(%rsp), %rdx	 ; %sfp,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/output.c:669:         tac_output(indent, "%s ", attribute_table->name->name);
	leaq	.LC96(%rip), %r13	 ;, tmp301
 ; D:/TC/src/output.c:692:         tac_output(indent, "%s\t", attribute->type->name);
	leaq	.LC101(%rip), %r14	 ;, tmp302
 ; D:/TC/src/output.c:431:         tac_output(indent + 1, "designs: [\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:431:         tac_output(indent + 1, "designs: [\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC94(%rip), %rcx	 ;, tmp169
	call	fputs	 ;
.L165:
 ; D:/TC/src/output.c:433:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	movq	0(%rbp), %rcx	 ; tac_32(D)->attribute_tables,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp310, attribute_table
 ; D:/TC/src/output.c:433:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	testq	%rax, %rax	 ; attribute_table
	je	.L255	 ;,
 ; D:/TC/src/output.c:434:             output_attribute_table(attribute_table, outfile, indent + 2);
	leaq	2(%rsi), %r12	 ;, _5
 ; D:/TC/src/output.c:666:     if (attribute_table->name == NULL)
	cmpq	$0, 8(%rdi)	 ;, attribute_table_42->name
 ; D:/TC/src/output.c:667:         tac_output(indent, "NULL ");
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%r12, %rdx	 ; _5,
 ; D:/TC/src/output.c:666:     if (attribute_table->name == NULL)
	jne	.L166	 ;,
 ; D:/TC/src/output.c:667:         tac_output(indent, "NULL ");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:667:         tac_output(indent, "NULL ");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC95(%rip), %rcx	 ;, tmp170
	call	fputs	 ;
	jmp	.L167	 ;
.L166:
 ; D:/TC/src/output.c:669:         tac_output(indent, "%s ", attribute_table->name->name);
	call	indention_tac	 ;
 ; D:/TC/src/output.c:669:         tac_output(indent, "%s ", attribute_table->name->name);
	movq	8(%rdi), %rax	 ; attribute_table_42->name, attribute_table_42->name
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%r13, %rdx	 ; tmp301,
	movq	8(%rax), %r8	 ; _77->name,
	call	fprintf	 ;
.L167:
 ; D:/TC/src/output.c:670:     tac_output(0, "%zu ", attribute_table->size);
	movq	40(%rsp), %rcx	 ; %sfp,
	xorl	%edx, %edx	 ;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:670:     tac_output(0, "%zu ", attribute_table->size);
	movq	16(%rdi), %r8	 ; attribute_table_42->size,
	movq	40(%rsp), %rcx	 ; %sfp,
	leaq	.LC97(%rip), %rdx	 ;, tmp175
	call	fprintf	 ;
 ; D:/TC/src/output.c:671:     if (list_is_empty(attribute_table->attributes))
	movq	(%rdi), %rcx	 ; attribute_table_42->attributes,
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:672:         tac_output(0, "{}\n");
	movq	40(%rsp), %rcx	 ; %sfp,
	xorl	%edx, %edx	 ;
 ; D:/TC/src/output.c:671:     if (list_is_empty(attribute_table->attributes))
	testb	%al, %al	 ; tmp308
	je	.L168	 ;,
 ; D:/TC/src/output.c:672:         tac_output(0, "{}\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:672:         tac_output(0, "{}\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC98(%rip), %rcx	 ;, tmp176
	jmp	.L244	 ;
.L168:
 ; D:/TC/src/output.c:674:         tac_output(0, "{\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:674:         tac_output(0, "{\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC99(%rip), %rcx	 ;, tmp177
 ; D:/TC/src/output.c:690:         tac_output(indent, "NULL\t");
	leaq	.LC100(%rip), %r15	 ;, tmp299
 ; D:/TC/src/output.c:674:         tac_output(0, "{\n");
	call	fputs	 ;
.L170:
 ; D:/TC/src/output.c:676:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	movq	(%rdi), %rcx	 ; attribute_table_42->attributes,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp309, attribute
 ; D:/TC/src/output.c:676:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	testq	%rax, %rax	 ; attribute
	je	.L256	 ;,
 ; D:/TC/src/output.c:689:     if (attribute->type == NULL)
	cmpq	$0, 8(%rbx)	 ;, attribute_83->type
 ; D:/TC/src/output.c:690:         tac_output(indent, "NULL\t");
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/output.c:677:             output_attribute(attribute, outfile, indent + 1);
	leaq	3(%rsi), %rdx	 ;, _82
 ; D:/TC/src/output.c:689:     if (attribute->type == NULL)
	jne	.L171	 ;,
 ; D:/TC/src/output.c:690:         tac_output(indent, "NULL\t");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:690:         tac_output(indent, "NULL\t");
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%r15, %rcx	 ; tmp299,
	call	fputs	 ;
	jmp	.L172	 ;
.L171:
 ; D:/TC/src/output.c:692:         tac_output(indent, "%s\t", attribute->type->name);
	call	indention_tac	 ;
 ; D:/TC/src/output.c:692:         tac_output(indent, "%s\t", attribute->type->name);
	movq	8(%rbx), %rax	 ; attribute_83->type, attribute_83->type
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%r14, %rdx	 ; tmp302,
	movq	8(%rax), %r8	 ; _86->name,
	call	fprintf	 ;
.L172:
 ; D:/TC/src/output.c:693:     if (attribute->var == NULL)
	movq	(%rbx), %rax	 ; attribute_83->var, _88
 ; D:/TC/src/output.c:694:         tac_output(0, "NULL ");
	movq	40(%rsp), %rcx	 ; %sfp,
	xorl	%edx, %edx	 ;
 ; D:/TC/src/output.c:693:     if (attribute->var == NULL)
	testq	%rax, %rax	 ; _88
	jne	.L173	 ;,
 ; D:/TC/src/output.c:694:         tac_output(0, "NULL ");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:694:         tac_output(0, "NULL ");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC95(%rip), %rcx	 ;, tmp182
	call	fputs	 ;
	jmp	.L174	 ;
.L173:
 ; D:/TC/src/output.c:695:     else if (attribute->var->original_name)
	cmpq	$0, (%rax)	 ;, _88->original_name
	je	.L175	 ;,
 ; D:/TC/src/output.c:696:         tac_output(0, "%s(%s) ", attribute->var->name, attribute->var->original_name->name);
	call	indention_tac	 ;
 ; D:/TC/src/output.c:696:         tac_output(0, "%s(%s) ", attribute->var->name, attribute->var->original_name->name);
	movq	(%rbx), %rax	 ; attribute_83->var, _90
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	(%rax), %rdx	 ; _90->original_name, _90->original_name
	movq	8(%rax), %r8	 ; _90->name,
	movq	8(%rdx), %r9	 ; _91->name,
	leaq	.LC102(%rip), %rdx	 ;, tmp186
	call	fprintf	 ;
	jmp	.L174	 ;
.L175:
 ; D:/TC/src/output.c:698:         tac_output(0, "%s ", attribute->var->name);
	call	indention_tac	 ;
 ; D:/TC/src/output.c:698:         tac_output(0, "%s ", attribute->var->name);
	movq	(%rbx), %rax	 ; attribute_83->var, attribute_83->var
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%r13, %rdx	 ; tmp301,
	movq	8(%rax), %r8	 ; _94->name,
	call	fprintf	 ;
.L174:
 ; D:/TC/src/output.c:699:     tac_output(0, "%zu\n", attribute->offset);
	movq	40(%rsp), %rcx	 ; %sfp,
	xorl	%edx, %edx	 ;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:699:     tac_output(0, "%zu\n", attribute->offset);
	movq	16(%rbx), %r8	 ; attribute_83->offset,
	movq	40(%rsp), %rcx	 ; %sfp,
	leaq	.LC103(%rip), %rdx	 ;, tmp191
	call	fprintf	 ;
	jmp	.L170	 ;
.L256:
 ; D:/TC/src/output.c:678:         tac_output(indent, "}\n");
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%r12, %rdx	 ; _5,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:678:         tac_output(indent, "}\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC104(%rip), %rcx	 ;, tmp192
.L244:
	call	fputs	 ;
	jmp	.L165	 ;
.L255:
 ; D:/TC/src/output.c:435:         tac_output(indent + 1, "]\n");
	movq	48(%rsp), %rdx	 ; %sfp,
	movq	40(%rsp), %rcx	 ; %sfp,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:435:         tac_output(indent + 1, "]\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC105(%rip), %rcx	 ;, tmp193
.L245:
	call	fputs	 ;
 ; D:/TC/src/output.c:437:     if (tac->entry_point == NULL)
	cmpq	$0, 8(%rbp)	 ;, tac_32(D)->entry_point
 ; D:/TC/src/output.c:438:         tac_output(indent + 1, "entry_point: \"NULL\"\n");
	movq	48(%rsp), %rdx	 ; %sfp,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/output.c:437:     if (tac->entry_point == NULL)
	jne	.L178	 ;,
 ; D:/TC/src/output.c:438:         tac_output(indent + 1, "entry_point: \"NULL\"\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:438:         tac_output(indent + 1, "entry_point: \"NULL\"\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC106(%rip), %rcx	 ;, tmp194
	call	fputs	 ;
	jmp	.L179	 ;
.L178:
 ; D:/TC/src/output.c:440:         tac_output(indent + 1, "entry_point: %s\n", tac->entry_point->name);
	call	indention_tac	 ;
 ; D:/TC/src/output.c:440:         tac_output(indent + 1, "entry_point: %s\n", tac->entry_point->name);
	movq	8(%rbp), %rax	 ; tac_32(D)->entry_point, tac_32(D)->entry_point
	movq	40(%rsp), %rcx	 ; %sfp,
	leaq	.LC107(%rip), %rdx	 ;, tmp197
	movq	8(%rax), %r8	 ; _10->name,
	call	fprintf	 ;
.L179:
 ; D:/TC/src/output.c:441:     if (list_is_empty(tac->global_vars))
	movq	16(%rbp), %rcx	 ; tac_32(D)->global_vars, tac_32(D)->global_vars
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:442:         tac_output(indent + 1, "global: []\n");
	movq	48(%rsp), %rdx	 ; %sfp,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/output.c:441:     if (list_is_empty(tac->global_vars))
	testb	%al, %al	 ; tmp311
	je	.L180	 ;,
 ; D:/TC/src/output.c:442:         tac_output(indent + 1, "global: []\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:442:         tac_output(indent + 1, "global: []\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC108(%rip), %rcx	 ;, tmp199
	jmp	.L246	 ;
.L180:
 ; D:/TC/src/output.c:444:         tac_output(indent + 1, "global: [\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:444:         tac_output(indent + 1, "global: [\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC109(%rip), %rcx	 ;, tmp200
 ; D:/TC/src/output.c:447:             output_var(var, outfile, indent + 2);
	leaq	2(%rsi), %rbx	 ;, tmp297
 ; D:/TC/src/output.c:444:         tac_output(indent + 1, "global: [\n");
	call	fputs	 ;
.L182:
 ; D:/TC/src/output.c:446:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	movq	16(%rbp), %rcx	 ; tac_32(D)->global_vars, tac_32(D)->global_vars
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp312, var
 ; D:/TC/src/output.c:446:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	testq	%rax, %rax	 ; var
	je	.L257	 ;,
 ; D:/TC/src/output.c:447:             output_var(var, outfile, indent + 2);
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rbx, %r8	 ; tmp297,
	call	output_var	 ;
	jmp	.L182	 ;
.L257:
 ; D:/TC/src/output.c:448:         tac_output(indent + 1, "]\n");
	movq	48(%rsp), %rdx	 ; %sfp,
	movq	40(%rsp), %rcx	 ; %sfp,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:448:         tac_output(indent + 1, "]\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC105(%rip), %rcx	 ;, tmp203
.L246:
	call	fputs	 ;
 ; D:/TC/src/output.c:450:     if (list_is_empty(tac->subroutines))
	movq	24(%rbp), %rcx	 ; tac_32(D)->subroutines, tac_32(D)->subroutines
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:451:         tac_output(indent + 1, "subroutines: []\n");
	movq	48(%rsp), %rdx	 ; %sfp,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/output.c:450:     if (list_is_empty(tac->subroutines))
	testb	%al, %al	 ; tmp313
	je	.L184	 ;,
 ; D:/TC/src/output.c:451:         tac_output(indent + 1, "subroutines: []\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:451:         tac_output(indent + 1, "subroutines: []\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC110(%rip), %rcx	 ;, tmp205
	jmp	.L253	 ;
.L184:
 ; D:/TC/src/output.c:453:         tac_output(indent + 1, "subroutines: [\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:453:         tac_output(indent + 1, "subroutines: [\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC111(%rip), %rcx	 ;, tmp206
 ; D:/TC/src/output.c:583:     switch (instruction->type) {
	leaq	.L209(%rip), %r14	 ;, tmp294
 ; D:/TC/src/output.c:453:         tac_output(indent + 1, "subroutines: [\n");
	call	fputs	 ;
.L186:
 ; D:/TC/src/output.c:455:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	movq	24(%rbp), %rcx	 ; tac_32(D)->subroutines, tac_32(D)->subroutines
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp322, subroutine
 ; D:/TC/src/output.c:455:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	testq	%rax, %rax	 ; subroutine
	je	.L258	 ;,
 ; D:/TC/src/output.c:456:             output_subroutine(subroutine, outfile, indent + 2);
	leaq	2(%rsi), %rax	 ;, _22
 ; D:/TC/src/output.c:469:     if (subroutine->name == NULL)
	cmpq	$0, (%rdi)	 ;, subroutine_66->name
 ; D:/TC/src/output.c:456:             output_subroutine(subroutine, outfile, indent + 2);
	movq	%rax, 64(%rsp)	 ; _22, %sfp
 ; D:/TC/src/output.c:469:     if (subroutine->name == NULL)
	jne	.L187	 ;,
 ; D:/TC/src/output.c:470:         tac_output(indent, "NULL {\n");
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%rax, %rdx	 ; _22,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:470:         tac_output(indent, "NULL {\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC112(%rip), %rcx	 ;, tmp207
	call	fputs	 ;
	jmp	.L188	 ;
.L187:
 ; D:/TC/src/output.c:472:         tac_output(indent, "%s {\n", subroutine->name->name);
	movq	64(%rsp), %rdx	 ; %sfp,
	movq	40(%rsp), %rcx	 ; %sfp,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:472:         tac_output(indent, "%s {\n", subroutine->name->name);
	movq	(%rdi), %rax	 ; subroutine_66->name, subroutine_66->name
	movq	40(%rsp), %rcx	 ; %sfp,
	leaq	.LC113(%rip), %rdx	 ;, tmp210
	movq	8(%rax), %r8	 ; _98->name,
	call	fprintf	 ;
.L188:
 ; D:/TC/src/output.c:677:             output_attribute(attribute, outfile, indent + 1);
	leaq	3(%rsi), %rax	 ;, _239
 ; D:/TC/src/output.c:473:     if (subroutine->return_type == NULL)
	cmpq	$0, 8(%rdi)	 ;, subroutine_66->return_type
 ; D:/TC/src/output.c:677:             output_attribute(attribute, outfile, indent + 1);
	movq	%rax, 56(%rsp)	 ; _239, %sfp
 ; D:/TC/src/output.c:473:     if (subroutine->return_type == NULL)
	jne	.L189	 ;,
 ; D:/TC/src/output.c:474:         tac_output(indent + 1, "return_type: \"NULL\"\n");
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%rax, %rdx	 ; _239,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:474:         tac_output(indent + 1, "return_type: \"NULL\"\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC114(%rip), %rcx	 ;, tmp211
	call	fputs	 ;
	jmp	.L190	 ;
.L189:
 ; D:/TC/src/output.c:476:         tac_output(indent + 1, "return_type: %s\n", subroutine->return_type->name);
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	40(%rsp), %rcx	 ; %sfp,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:476:         tac_output(indent + 1, "return_type: %s\n", subroutine->return_type->name);
	movq	8(%rdi), %rax	 ; subroutine_66->return_type, subroutine_66->return_type
	movq	40(%rsp), %rcx	 ; %sfp,
	leaq	.LC115(%rip), %rdx	 ;, tmp214
	movq	8(%rax), %r8	 ; _103->name,
	call	fprintf	 ;
.L190:
 ; D:/TC/src/output.c:477:     if (list_is_empty(subroutine->parameters))
	movq	16(%rdi), %rcx	 ; subroutine_66->parameters, subroutine_66->parameters
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:478:         tac_output(indent + 1, "parameters: []\n");
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/output.c:477:     if (list_is_empty(subroutine->parameters))
	testb	%al, %al	 ; tmp314
	je	.L191	 ;,
 ; D:/TC/src/output.c:478:         tac_output(indent + 1, "parameters: []\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:478:         tac_output(indent + 1, "parameters: []\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC116(%rip), %rcx	 ;, tmp216
	jmp	.L247	 ;
.L191:
 ; D:/TC/src/output.c:480:         tac_output(indent + 1, "parameters: [\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:480:         tac_output(indent + 1, "parameters: [\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC117(%rip), %rcx	 ;, tmp217
 ; D:/TC/src/output.c:483:             output_var(parameter, outfile, indent + 2);
	leaq	4(%rsi), %rbx	 ;, tmp293
 ; D:/TC/src/output.c:480:         tac_output(indent + 1, "parameters: [\n");
	call	fputs	 ;
.L193:
 ; D:/TC/src/output.c:482:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	movq	16(%rdi), %rcx	 ; subroutine_66->parameters, subroutine_66->parameters
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp315, parameter
 ; D:/TC/src/output.c:482:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	je	.L259	 ;,
 ; D:/TC/src/output.c:483:             output_var(parameter, outfile, indent + 2);
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rbx, %r8	 ; tmp293,
	call	output_var	 ;
	jmp	.L193	 ;
.L259:
 ; D:/TC/src/output.c:484:         tac_output(indent + 1, "]\n");
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	40(%rsp), %rcx	 ; %sfp,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:484:         tac_output(indent + 1, "]\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC105(%rip), %rcx	 ;, tmp220
.L247:
	call	fputs	 ;
 ; D:/TC/src/output.c:486:     if (list_is_empty(subroutine->local_vars))
	movq	24(%rdi), %rcx	 ; subroutine_66->local_vars, subroutine_66->local_vars
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:487:         tac_output(indent + 1, "local: []\n");
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/output.c:486:     if (list_is_empty(subroutine->local_vars))
	testb	%al, %al	 ; tmp316
	je	.L195	 ;,
 ; D:/TC/src/output.c:487:         tac_output(indent + 1, "local: []\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:487:         tac_output(indent + 1, "local: []\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC118(%rip), %rcx	 ;, tmp222
	jmp	.L248	 ;
.L195:
 ; D:/TC/src/output.c:489:         tac_output(indent + 1, "local: [\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:489:         tac_output(indent + 1, "local: [\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC119(%rip), %rcx	 ;, tmp223
 ; D:/TC/src/output.c:492:             output_var(var, outfile, indent + 2);
	leaq	4(%rsi), %rbx	 ;, tmp292
 ; D:/TC/src/output.c:489:         tac_output(indent + 1, "local: [\n");
	call	fputs	 ;
.L197:
 ; D:/TC/src/output.c:491:         while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
	movq	24(%rdi), %rcx	 ; subroutine_66->local_vars, subroutine_66->local_vars
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp317, var
 ; D:/TC/src/output.c:491:         while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
	testq	%rax, %rax	 ; var
	je	.L260	 ;,
 ; D:/TC/src/output.c:492:             output_var(var, outfile, indent + 2);
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rbx, %r8	 ; tmp292,
	call	output_var	 ;
	jmp	.L197	 ;
.L260:
 ; D:/TC/src/output.c:493:         tac_output(indent + 1, "]\n");
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	40(%rsp), %rcx	 ; %sfp,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:493:         tac_output(indent + 1, "]\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC105(%rip), %rcx	 ;, tmp226
.L248:
	call	fputs	 ;
 ; D:/TC/src/output.c:495:     if (list_is_empty(subroutine->blocks))
	movq	32(%rdi), %rcx	 ; subroutine_66->blocks, subroutine_66->blocks
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:496:         tac_output(indent + 1, "instructions: []\n");
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/output.c:495:     if (list_is_empty(subroutine->blocks))
	testb	%al, %al	 ; tmp318
	je	.L199	 ;,
 ; D:/TC/src/output.c:496:         tac_output(indent + 1, "instructions: []\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:496:         tac_output(indent + 1, "instructions: []\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC120(%rip), %rcx	 ;, tmp228
	jmp	.L252	 ;
.L199:
 ; D:/TC/src/output.c:498:         tac_output(indent + 1, "instructions: [\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:498:         tac_output(indent + 1, "instructions: [\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC121(%rip), %rcx	 ;, tmp229
.L251:
 ; D:/TC/src/output.c:540:         tac_output(indent, "}\n");
	call	fputs	 ;
 ; D:/TC/src/output.c:500:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	movq	32(%rdi), %rcx	 ; subroutine_66->blocks, subroutine_66->blocks
	call	list_pop	 ;
	movq	%rax, %r13	 ; tmp321, block
 ; D:/TC/src/output.c:500:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	testq	%rax, %rax	 ; block
	je	.L261	 ;,
 ; D:/TC/src/output.c:501:             output_block(block, outfile, indent + 2);
	leaq	4(%rsi), %rax	 ;, _123
 ; D:/TC/src/output.c:529:     if (block->label == NULL)
	cmpq	$0, 0(%r13)	 ;, block_124->label
 ; D:/TC/src/output.c:501:             output_block(block, outfile, indent + 2);
	movq	%rax, 72(%rsp)	 ; _123, %sfp
 ; D:/TC/src/output.c:529:     if (block->label == NULL)
	jne	.L202	 ;,
 ; D:/TC/src/output.c:530:         tac_output(indent, "NULL ");
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%rax, %rdx	 ; _123,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:530:         tac_output(indent, "NULL ");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC95(%rip), %rcx	 ;, tmp230
	call	fputs	 ;
	jmp	.L203	 ;
.L202:
 ; D:/TC/src/output.c:532:         tac_output(indent, "%s ", block->label->name);
	movq	72(%rsp), %rdx	 ; %sfp,
	movq	40(%rsp), %rcx	 ; %sfp,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:532:         tac_output(indent, "%s ", block->label->name);
	movq	0(%r13), %rax	 ; block_124->label, block_124->label
	movq	40(%rsp), %rcx	 ; %sfp,
	leaq	.LC96(%rip), %rdx	 ;,
	movq	8(%rax), %r8	 ; _127->name,
	call	fprintf	 ;
.L203:
 ; D:/TC/src/output.c:533:     if (list_is_empty(block->instructions))
	movq	8(%r13), %rcx	 ; block_124->instructions, block_124->instructions
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:534:         tac_output(0, "{}\n");
	movq	40(%rsp), %rcx	 ; %sfp,
	xorl	%edx, %edx	 ;
 ; D:/TC/src/output.c:533:     if (list_is_empty(block->instructions))
	testb	%al, %al	 ; tmp319
	je	.L204	 ;,
 ; D:/TC/src/output.c:534:         tac_output(0, "{}\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:534:         tac_output(0, "{}\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC98(%rip), %rcx	 ;, tmp235
	jmp	.L251	 ;
.L204:
 ; D:/TC/src/output.c:536:         tac_output(0, "{\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:536:         tac_output(0, "{\n");
	movq	40(%rsp), %rdx	 ; %sfp,
 ; D:/TC/src/output.c:539:             output_instruction(instruction, outfile, indent + 1);
	leaq	5(%rsi), %rbx	 ;, _131
 ; D:/TC/src/output.c:536:         tac_output(0, "{\n");
	leaq	.LC99(%rip), %rcx	 ;, tmp236
	movl	$1, %r15d	 ;, tmp288
	call	fputs	 ;
.L206:
 ; D:/TC/src/output.c:538:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	movq	8(%r13), %rcx	 ; block_124->instructions, block_124->instructions
	call	list_pop	 ;
	movq	%rax, %r12	 ; tmp320, instruction
 ; D:/TC/src/output.c:538:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	testq	%rax, %rax	 ; instruction
	je	.L262	 ;,
 ; D:/TC/src/output.c:583:     switch (instruction->type) {
	cmpl	$25, 24(%r12)	 ;, instruction_132->type
	ja	.L207	 ;,
	movl	24(%r12), %eax	 ; instruction_132->type, instruction_132->type
 ; D:/TC/src/output.c:609:         case INST_NONE: tac_output(indent, "INST_NONE\n"); return;
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%rbx, %rdx	 ; _131,
 ; D:/TC/src/output.c:583:     switch (instruction->type) {
	movslq	(%r14,%rax,4), %rax	 ;, tmp240
	addq	%r14, %rax	 ; tmp294, tmp241
	jmp	*%rax	 ; tmp241
	.section .rdata,"dr"
	.align 4
.L209:
	.long	.L234-.L209
	.long	.L233-.L209
	.long	.L232-.L209
	.long	.L231-.L209
	.long	.L230-.L209
	.long	.L229-.L209
	.long	.L228-.L209
	.long	.L227-.L209
	.long	.L226-.L209
	.long	.L225-.L209
	.long	.L224-.L209
	.long	.L223-.L209
	.long	.L222-.L209
	.long	.L221-.L209
	.long	.L220-.L209
	.long	.L219-.L209
	.long	.L218-.L209
	.long	.L217-.L209
	.long	.L216-.L209
	.long	.L215-.L209
	.long	.L214-.L209
	.long	.L213-.L209
	.long	.L212-.L209
	.long	.L211-.L209
	.long	.L210-.L209
	.long	.L208-.L209
	.text
.L234:
 ; D:/TC/src/output.c:584:         case INST_ADD: tac_output(indent, "add\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:584:         case INST_ADD: tac_output(indent, "add\t"); break;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC122(%rip), %rcx	 ;, tmp243
	jmp	.L249	 ;
.L233:
 ; D:/TC/src/output.c:585:         case INST_SUB: tac_output(indent, "sub\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:585:         case INST_SUB: tac_output(indent, "sub\t"); break;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC123(%rip), %rcx	 ;, tmp244
	jmp	.L249	 ;
.L232:
 ; D:/TC/src/output.c:586:         case INST_MUL: tac_output(indent, "mul\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:586:         case INST_MUL: tac_output(indent, "mul\t"); break;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC124(%rip), %rcx	 ;, tmp245
	jmp	.L249	 ;
.L231:
 ; D:/TC/src/output.c:587:         case INST_DIV: tac_output(indent, "div\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:587:         case INST_DIV: tac_output(indent, "div\t"); break;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC125(%rip), %rcx	 ;, tmp246
	jmp	.L249	 ;
.L230:
 ; D:/TC/src/output.c:588:         case INST_MOD: tac_output(indent, "mod\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:588:         case INST_MOD: tac_output(indent, "mod\t"); break;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC126(%rip), %rcx	 ;, tmp247
	jmp	.L249	 ;
.L229:
 ; D:/TC/src/output.c:589:         case INST_EQ: tac_output(indent, "eq \t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:589:         case INST_EQ: tac_output(indent, "eq \t"); break;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC127(%rip), %rcx	 ;, tmp248
	jmp	.L249	 ;
.L228:
 ; D:/TC/src/output.c:590:         case INST_NE: tac_output(indent, "ne \t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:590:         case INST_NE: tac_output(indent, "ne \t"); break;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC128(%rip), %rcx	 ;, tmp249
	jmp	.L249	 ;
.L227:
 ; D:/TC/src/output.c:591:         case INST_LT: tac_output(indent, "lt \t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:591:         case INST_LT: tac_output(indent, "lt \t"); break;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC129(%rip), %rcx	 ;, tmp250
	jmp	.L249	 ;
.L226:
 ; D:/TC/src/output.c:592:         case INST_GT: tac_output(indent, "gt \t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:592:         case INST_GT: tac_output(indent, "gt \t"); break;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC130(%rip), %rcx	 ;, tmp251
	jmp	.L249	 ;
.L225:
 ; D:/TC/src/output.c:593:         case INST_LE: tac_output(indent, "le \t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:593:         case INST_LE: tac_output(indent, "le \t"); break;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC131(%rip), %rcx	 ;, tmp252
	jmp	.L249	 ;
.L224:
 ; D:/TC/src/output.c:594:         case INST_GE: tac_output(indent, "ge \t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:594:         case INST_GE: tac_output(indent, "ge \t"); break;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC132(%rip), %rcx	 ;, tmp253
	jmp	.L249	 ;
.L223:
 ; D:/TC/src/output.c:595:         case INST_AND: tac_output(indent, "and\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:595:         case INST_AND: tac_output(indent, "and\t"); break;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC133(%rip), %rcx	 ;, tmp254
	jmp	.L249	 ;
.L222:
 ; D:/TC/src/output.c:596:         case INST_OR: tac_output(indent, "or \t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:596:         case INST_OR: tac_output(indent, "or \t"); break;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC134(%rip), %rcx	 ;, tmp255
	jmp	.L249	 ;
.L221:
 ; D:/TC/src/output.c:597:         case INST_NOT: tac_output(indent, "not\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:597:         case INST_NOT: tac_output(indent, "not\t"); break;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC135(%rip), %rcx	 ;, tmp256
	jmp	.L249	 ;
.L220:
 ; D:/TC/src/output.c:598:         case INST_ASSIGN: tac_output(indent, "assign\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:598:         case INST_ASSIGN: tac_output(indent, "assign\t"); break;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC136(%rip), %rcx	 ;, tmp257
	jmp	.L249	 ;
.L219:
 ; D:/TC/src/output.c:599:         case INST_GET_ATTR: tac_output(indent, "get_attr\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:599:         case INST_GET_ATTR: tac_output(indent, "get_attr\t"); break;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC137(%rip), %rcx	 ;, tmp258
	jmp	.L249	 ;
.L218:
 ; D:/TC/src/output.c:600:         case INST_GET_ELEM: tac_output(indent, "get_elem\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:600:         case INST_GET_ELEM: tac_output(indent, "get_elem\t"); break;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC138(%rip), %rcx	 ;, tmp259
	jmp	.L249	 ;
.L217:
 ; D:/TC/src/output.c:601:         case INST_PARAM: tac_output(indent, "param\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:601:         case INST_PARAM: tac_output(indent, "param\t"); break;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC139(%rip), %rcx	 ;, tmp260
	jmp	.L249	 ;
.L216:
 ; D:/TC/src/output.c:602:         case INST_ALLOC: tac_output(indent, "alloc\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:602:         case INST_ALLOC: tac_output(indent, "alloc\t"); break;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC140(%rip), %rcx	 ;, tmp261
	jmp	.L249	 ;
.L215:
 ; D:/TC/src/output.c:603:         case INST_JMP_C: tac_output(indent, "jmp_c\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:603:         case INST_JMP_C: tac_output(indent, "jmp_c\t"); break;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC141(%rip), %rcx	 ;, tmp262
	jmp	.L249	 ;
.L214:
 ; D:/TC/src/output.c:604:         case INST_JMP: tac_output(indent, "jmp\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:604:         case INST_JMP: tac_output(indent, "jmp\t"); break;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC142(%rip), %rcx	 ;, tmp263
	jmp	.L249	 ;
.L213:
 ; D:/TC/src/output.c:605:         case INST_RET: tac_output(indent, "ret\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:605:         case INST_RET: tac_output(indent, "ret\t"); break;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC143(%rip), %rcx	 ;, tmp264
	jmp	.L249	 ;
.L212:
 ; D:/TC/src/output.c:606:         case INST_CALL: tac_output(indent, "call\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:606:         case INST_CALL: tac_output(indent, "call\t"); break;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC144(%rip), %rcx	 ;, tmp265
	jmp	.L249	 ;
.L211:
 ; D:/TC/src/output.c:607:         case INST_LOAD: tac_output(indent, "load\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:607:         case INST_LOAD: tac_output(indent, "load\t"); break;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC145(%rip), %rcx	 ;, tmp266
	jmp	.L249	 ;
.L210:
 ; D:/TC/src/output.c:608:         case INST_STORE: tac_output(indent, "store\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:608:         case INST_STORE: tac_output(indent, "store\t"); break;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC146(%rip), %rcx	 ;, tmp267
.L249:
	call	fputs	 ;
 ; D:/TC/src/output.c:615:     output_arg(instruction->arg1, outfile);
	movq	(%r12), %rcx	 ; instruction_132->arg1,
	movq	40(%rsp), %rdx	 ; %sfp,
	call	output_arg	 ;
 ; D:/TC/src/output.c:616:     switch (instruction->type) {
	movl	24(%r12), %ecx	 ; instruction_132->type, _137
 ; D:/TC/src/output.c:616:     switch (instruction->type) {
	cmpl	$24, %ecx	 ;, _137
	jbe	.L263	 ;,
	jmp	.L206	 ;
.L208:
 ; D:/TC/src/output.c:609:         case INST_NONE: tac_output(indent, "INST_NONE\n"); return;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:609:         case INST_NONE: tac_output(indent, "INST_NONE\n"); return;
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC147(%rip), %rcx	 ;, tmp268
	call	fputs	 ;
 ; D:/TC/src/output.c:609:         case INST_NONE: tac_output(indent, "INST_NONE\n"); return;
	jmp	.L206	 ;
.L207:
 ; D:/TC/src/output.c:611:             tac_output(indent, "unknown_InstructionType: %u\n", instruction->type);
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%rbx, %rdx	 ; _131,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:611:             tac_output(indent, "unknown_InstructionType: %u\n", instruction->type);
	movl	24(%r12), %r8d	 ; instruction_132->type,
	movq	40(%rsp), %rcx	 ; %sfp,
	leaq	.LC148(%rip), %rdx	 ;, tmp270
	call	fprintf	 ;
 ; D:/TC/src/output.c:613:             return;
	jmp	.L206	 ;
.L263:
	movq	%r15, %rax	 ; tmp288, _4
	salq	%cl, %rax	 ; _137, _4
 ; D:/TC/src/output.c:616:     switch (instruction->type) {
	testl	$4825087, %eax	 ;, _4
	jne	.L237	 ;,
	testl	$25583616, %eax	 ;, _4
	jne	.L238	 ;,
	testl	$3145728, %eax	 ;, _4
	jne	.L239	 ;,
	jmp	.L206	 ;
.L237:
 ; D:/TC/src/output.c:634:             tac_output(0, " ");
	movq	40(%rsp), %rcx	 ; %sfp,
	xorl	%edx, %edx	 ;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:634:             tac_output(0, " ");
	movq	40(%rsp), %rdx	 ; %sfp,
	movl	$32, %ecx	 ;,
	call	fputc	 ;
 ; D:/TC/src/output.c:635:             output_arg(instruction->arg2, outfile);
	movq	8(%r12), %rcx	 ; instruction_132->arg2, instruction_132->arg2
	movq	40(%rsp), %rdx	 ; %sfp,
	call	output_arg	 ;
 ; D:/TC/src/output.c:636:             tac_output(0, " ");
	movq	40(%rsp), %rcx	 ; %sfp,
	xorl	%edx, %edx	 ;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:636:             tac_output(0, " ");
	movq	40(%rsp), %rdx	 ; %sfp,
	movl	$32, %ecx	 ;,
	call	fputc	 ;
 ; D:/TC/src/output.c:637:             output_arg(instruction->arg3, outfile);
	movq	16(%r12), %rcx	 ; instruction_132->arg3, instruction_132->arg3
	jmp	.L250	 ;
.L238:
 ; D:/TC/src/output.c:645:             tac_output(0, " ");
	movq	40(%rsp), %rcx	 ; %sfp,
	xorl	%edx, %edx	 ;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:645:             tac_output(0, " ");
	movq	40(%rsp), %rdx	 ; %sfp,
	movl	$32, %ecx	 ;,
	call	fputc	 ;
 ; D:/TC/src/output.c:646:             output_arg(instruction->arg2, outfile);
	movq	8(%r12), %rcx	 ; instruction_132->arg2, instruction_132->arg2
.L250:
	movq	40(%rsp), %rdx	 ; %sfp,
	call	output_arg	 ;
.L239:
 ; D:/TC/src/output.c:656:     tac_output(0, "\n");
	movq	40(%rsp), %rcx	 ; %sfp,
	xorl	%edx, %edx	 ;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:656:     tac_output(0, "\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	movl	$10, %ecx	 ;,
	call	fputc	 ;
	jmp	.L206	 ;
.L262:
 ; D:/TC/src/output.c:540:         tac_output(indent, "}\n");
	movq	72(%rsp), %rdx	 ; %sfp,
	movq	40(%rsp), %rcx	 ; %sfp,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:540:         tac_output(indent, "}\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC104(%rip), %rcx	 ;, tmp279
	jmp	.L251	 ;
.L261:
 ; D:/TC/src/output.c:502:         tac_output(indent + 1, "]\n");
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	40(%rsp), %rcx	 ; %sfp,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:502:         tac_output(indent + 1, "]\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC105(%rip), %rcx	 ;, tmp281
.L252:
	call	fputs	 ;
 ; D:/TC/src/output.c:504:     tac_output(indent, "}\n");
	movq	64(%rsp), %rdx	 ; %sfp,
	movq	40(%rsp), %rcx	 ; %sfp,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:504:     tac_output(indent, "}\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC104(%rip), %rcx	 ;, tmp282
	call	fputs	 ;
	jmp	.L186	 ;
.L258:
 ; D:/TC/src/output.c:457:         tac_output(indent + 1, "]\n");
	movq	48(%rsp), %rdx	 ; %sfp,
	movq	40(%rsp), %rcx	 ; %sfp,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:457:         tac_output(indent + 1, "]\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC105(%rip), %rcx	 ;, tmp284
.L253:
	call	fputs	 ;
 ; D:/TC/src/output.c:459:     tac_output(indent, "}\n");
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%rsi, %rdx	 ; indent,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:459:     tac_output(indent, "}\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC104(%rip), %rcx	 ;, tmp285
.L254:
 ; D:/TC/src/output.c:461: }
	addq	$88, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:/TC/src/output.c:459:     tac_output(indent, "}\n");
	jmp	fputs	 ;
	.ident	"GCC: (GNU) 13.2.0"
	.def	indention;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	indention_tac;	.scl	2;	.type	32;	.endef
	.def	list_is_empty;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
