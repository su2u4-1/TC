	.file	"output.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O2 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
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
	.p2align 4
	.def	output_name;	.scl	3;	.type	32;	.endef
output_name:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%r8, %r12	 ; tmp120, indent
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%r9, %rdi	 ; tmp121, indent_has_next
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp119, outfile
	subq	$40, %rsp	 ;,
 ; D:/TC/src/output.c:365:     if (name == NULL) {
	testq	%rcx, %rcx	 ; name
	je	.L2	 ;,
	movq	%rcx, %rsi	 ; tmp118, name
	addq	$1, %r12	 ;, indent
	leaq	.LC1(%rip), %r15	 ;, tmp115
	leaq	.LC2(%rip), %r14	 ;, tmp116
 ; D:/TC/src/output.c:372:     switch (name->kind) {
	leaq	.L7(%rip), %r13	 ;, tmp117
.L4:
	leaq	-1(%r12), %rbp	 ;, indent
 ; D:/TC/src/output.c:370:     ast_output(0, false, "name: \"%s\"\n", name->name);
	movq	%rdi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; outfile,
	movq	%rbp, %rdx	 ; indent,
	call	indention	 ;
 ; D:/TC/src/output.c:370:     ast_output(0, false, "name: \"%s\"\n", name->name);
	movq	8(%rsi), %r8	 ; name_58->name,
	movq	%r15, %rdx	 ; tmp115,
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:371:     ast_output(0, false, "id: %zu\n", name->id);
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %r9	 ; indent_has_next,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:371:     ast_output(0, false, "id: %zu\n", name->id);
	movq	16(%rsi), %r8	 ; name_58->id,
	movq	%r14, %rdx	 ; tmp116,
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:372:     switch (name->kind) {
	cmpl	$6, 32(%rsi)	 ;, name_58->kind
	ja	.L5	 ;,
	movl	32(%rsi), %eax	 ; name_58->kind, name_58->kind
 ; D:/TC/src/output.c:374:             ast_output(0, true, "kind: \"type\"\n");
	movq	%rdi, %r9	 ; indent_has_next,
 ; D:/TC/src/output.c:372:     switch (name->kind) {
	movslq	0(%r13,%rax,4), %rax	 ;, tmp99
	addq	%r13, %rax	 ; tmp117, tmp100
	jmp	*%rax	 ; tmp100
	.section .rdata,"dr"
	.align 4
.L7:
	.long	.L13-.L7
	.long	.L12-.L7
	.long	.L11-.L7
	.long	.L10-.L7
	.long	.L9-.L7
	.long	.L8-.L7
	.long	.L6-.L7
	.text
	.p2align 4,,10
	.p2align 3
.L8:
 ; D:/TC/src/output.c:395:             ast_output(0, false, "kind: \"attribute\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:395:             ast_output(0, false, "kind: \"attribute\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rcx	 ;, tmp110
.L21:
	call	fwrite	 ;
 ; D:/TC/src/output.c:396:             ast_output(0, true, "type\n");
	movq	%rdi, %r9	 ; indent_has_next,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:396:             ast_output(0, true, "type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp111
	call	fwrite	 ;
 ; D:/TC/src/output.c:397:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rsi	 ; name_58->type, name
.L14:
 ; D:/TC/src/output.c:365:     if (name == NULL) {
	leaq	1(%r12), %rax	 ;, ivtmp.34
	testq	%rsi, %rsi	 ; name
	je	.L2	 ;,
	movq	%rax, %r12	 ; ivtmp.34, indent
	jmp	.L4	 ;
	.p2align 4,,10
	.p2align 3
.L9:
 ; D:/TC/src/output.c:400:             ast_output(0, false, "kind: \"parameter\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:400:             ast_output(0, false, "kind: \"parameter\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC11(%rip), %rcx	 ;, tmp112
	jmp	.L21	 ;
	.p2align 4,,10
	.p2align 3
.L10:
 ; D:/TC/src/output.c:377:             ast_output(0, false, "kind: \"variable\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:377:             ast_output(0, false, "kind: \"variable\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rcx	 ;, tmp103
	jmp	.L21	 ;
	.p2align 4,,10
	.p2align 3
.L11:
 ; D:/TC/src/output.c:387:             ast_output(0, false, "kind: \"method\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:387:             ast_output(0, false, "kind: \"method\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC8(%rip), %rcx	 ;, tmp107
.L22:
	call	fwrite	 ;
 ; D:/TC/src/output.c:388:             ast_output(0, true, "return_type\n");
	movq	%rdi, %r9	 ; indent_has_next,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:388:             ast_output(0, true, "return_type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rcx	 ;, tmp108
	call	fwrite	 ;
 ; D:/TC/src/output.c:389:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rsi	 ; name_58->type, name
 ; D:/TC/src/output.c:390:             break;
	jmp	.L14	 ;
	.p2align 4,,10
	.p2align 3
.L12:
 ; D:/TC/src/output.c:382:             ast_output(0, false, "kind: \"function\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:382:             ast_output(0, false, "kind: \"function\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC6(%rip), %rcx	 ;, tmp105
	jmp	.L22	 ;
	.p2align 4,,10
	.p2align 3
.L13:
 ; D:/TC/src/output.c:392:             ast_output(0, true, "kind: \"class\"\n");
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:392:             ast_output(0, true, "kind: \"class\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC9(%rip), %rcx	 ;, tmp109
.L23:
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
	jmp	fwrite	 ;
	.p2align 4,,10
	.p2align 3
.L6:
 ; D:/TC/src/output.c:374:             ast_output(0, true, "kind: \"type\"\n");
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:374:             ast_output(0, true, "kind: \"type\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC3(%rip), %rcx	 ;, tmp102
	jmp	.L23	 ;
.L5:
 ; D:/TC/src/output.c:405:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	movq	%rdi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:405:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$25, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC12(%rip), %rcx	 ;, tmp114
	jmp	.L23	 ;
	.p2align 4,,10
	.p2align 3
.L2:
 ; D:/TC/src/output.c:366:         ast_output(0, true, "Name: \"NULL\"\n");
	movq	%rdi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%r12, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:366:         ast_output(0, true, "Name: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp91
	jmp	.L23	 ;
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
	.p2align 4
	.def	output_expression;	.scl	3;	.type	32;	.endef
output_expression:
	pushq	%r15	 ;
 ; D:/TC/src/output.c:273:     switch (primary->type) {
	leaq	.L30(%rip), %r15	 ;, tmp138
 ; D:/TC/src/output.c:256: void output_expression(Expression* expression, FILE* outfile, size_t indent, char indent_has_next[32]) {
	pushq	%r14	 ;
	movq	%rcx, %r14	 ; tmp140, expression
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%r9, %rdi	 ; tmp143, indent_has_next
	pushq	%rsi	 ;
	movq	%r8, %rsi	 ; tmp142, indent
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp141, outfile
	subq	$40, %rsp	 ;,
.L39:
 ; D:/TC/src/output.c:258:     if (expression->operator == OP_NONE) {
	movl	24(%r14), %ecx	 ; expression_4->operator, _1
	leaq	.LC30(%rip), %r13	 ;, tmp133
 ; D:/TC/src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	leaq	.LC13(%rip), %rbp	 ;, tmp137
 ; D:/TC/src/output.c:258:     if (expression->operator == OP_NONE) {
	cmpl	$19, %ecx	 ;, _1
	je	.L54	 ;,
.L26:
 ; D:/TC/src/output.c:262:         string op_str = operator_to_string(expression->operator);
	call	operator_to_string	 ;
 ; D:/TC/src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	%rdi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; indent,
 ; D:/TC/src/output.c:262:         string op_str = operator_to_string(expression->operator);
	movq	%rax, %r12	 ; tmp144, op_str
 ; D:/TC/src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	testq	%r12, %r12	 ; op_str
 ; D:/TC/src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	%r12, %r8	 ; op_str, op_str
	movq	%rbx, %rcx	 ; outfile,
	cmove	%rbp, %r8	 ; op_str,, tmp137, op_str
	leaq	.LC29(%rip), %rdx	 ;,
 ; D:/TC/src/output.c:265:         output_expression(expression->expr_left, outfile, indent + 1, indent_has_next);
	leaq	1(%rsi), %r12	 ;, _5
 ; D:/TC/src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	call	fprintf	 ;
 ; D:/TC/src/output.c:264:         ast_output(0, false, "left\n");
	movq	%rdi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:264:         ast_output(0, false, "left\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; tmp133,
	movl	$5, %r8d	 ;,
	call	fwrite	 ;
 ; D:/TC/src/output.c:265:         output_expression(expression->expr_left, outfile, indent + 1, indent_has_next);
	movq	(%r14), %rcx	 ; expression_92->expr_left, expression_92->expr_left
	movq	%rdi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _5,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:/TC/src/output.c:266:         ast_output(0, true, "right\n");
	movq	%rdi, %r9	 ; indent_has_next,
	movq	%rsi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:266:         ast_output(0, true, "right\n");
	leaq	.LC31(%rip), %rcx	 ;,
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	call	fwrite	 ;
 ; D:/TC/src/output.c:267:         output_expression(expression->right, outfile, indent + 1, indent_has_next);
	movq	16(%r14), %r14	 ; expression_92->right, expression
 ; D:/TC/src/output.c:258:     if (expression->operator == OP_NONE) {
	movl	24(%r14), %ecx	 ; _8->operator, _1
 ; D:/TC/src/output.c:258:     if (expression->operator == OP_NONE) {
	cmpl	$19, %ecx	 ;, _1
	je	.L42	 ;,
	movq	%r12, %rsi	 ; _5, indent
	jmp	.L26	 ;
	.p2align 4,,10
	.p2align 3
.L54:
	movq	%rsi, %r12	 ; indent, _5
.L42:
 ; D:/TC/src/output.c:259:         ast_output(0, true, "primary\n");
	movq	%rdi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%r12, %rdx	 ; _5,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:259:         ast_output(0, true, "primary\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC14(%rip), %rcx	 ;,
	leaq	2(%r12), %rsi	 ;, indent
	call	fwrite	 ;
 ; D:/TC/src/output.c:260:         output_primary(expression->prim_left, outfile, indent + 1, indent_has_next);
	movq	8(%r14), %rbp	 ; expression_99->prim_left, primary
.L27:
 ; D:/TC/src/output.c:273:     switch (primary->type) {
	cmpl	$8, 8(%rbp)	 ;, primary_28->type
	leaq	-1(%rsi), %r12	 ;, indent
	ja	.L28	 ;,
	movl	8(%rbp), %eax	 ; primary_28->type, primary_28->type
 ; D:/TC/src/output.c:310:             ast_output(0, false, "type: \"variable\"\n");
	movq	%rdi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%r12, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
 ; D:/TC/src/output.c:273:     switch (primary->type) {
	movslq	(%r15,%rax,4), %rax	 ;, tmp102
	addq	%r15, %rax	 ; tmp138, tmp103
	jmp	*%rax	 ; tmp103
	.section .rdata,"dr"
	.align 4
.L30:
	.long	.L38-.L30
	.long	.L37-.L30
	.long	.L36-.L30
	.long	.L35-.L30
	.long	.L34-.L30
	.long	.L33-.L30
	.long	.L32-.L30
	.long	.L31-.L30
	.long	.L29-.L30
	.text
	.p2align 4,,10
	.p2align 3
.L31:
 ; D:/TC/src/output.c:305:             ast_output(0, false, "type: \"-\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:305:             ast_output(0, false, "type: \"-\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC26(%rip), %rcx	 ;, tmp122
.L50:
	call	fwrite	 ;
 ; D:/TC/src/output.c:306:             ast_output(0, true, "value\n");
	movq	%rdi, %r9	 ; indent_has_next,
	movq	%r12, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	addq	$1, %rsi	 ;, indent
	call	indention	 ;
 ; D:/TC/src/output.c:306:             ast_output(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC24(%rip), %rcx	 ;, tmp123
	call	fwrite	 ;
 ; D:/TC/src/output.c:307:             output_primary(primary->value.operand, outfile, indent + 1, indent_has_next);
	movq	0(%rbp), %rbp	 ; primary_28->value.operand, primary
	jmp	.L27	 ;
	.p2align 4,,10
	.p2align 3
.L29:
 ; D:/TC/src/output.c:310:             ast_output(0, false, "type: \"variable\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:310:             ast_output(0, false, "type: \"variable\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC27(%rip), %rcx	 ;, tmp124
	call	fwrite	 ;
 ; D:/TC/src/output.c:311:             ast_output(0, true, "value\n");
	movq	%rdi, %r9	 ; indent_has_next,
	movq	%r12, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:311:             ast_output(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC24(%rip), %rcx	 ;, tmp125
	call	fwrite	 ;
 ; D:/TC/src/output.c:312:             output_variable_access(primary->value.var, outfile, indent + 1, indent_has_next);
	movq	0(%rbp), %rcx	 ; primary_28->value.var, primary_28->value.var
 ; D:/TC/src/output.c:270: }
	addq	$40, %rsp	 ;,
 ; D:/TC/src/output.c:312:             output_variable_access(primary->value.var, outfile, indent + 1, indent_has_next);
	movq	%rdi, %r9	 ; indent_has_next,
	movq	%rsi, %r8	 ; indent,
	movq	%rbx, %rdx	 ; outfile,
 ; D:/TC/src/output.c:270: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:/TC/src/output.c:312:             output_variable_access(primary->value.var, outfile, indent + 1, indent_has_next);
	jmp	output_variable_access	 ;
	.p2align 4,,10
	.p2align 3
.L38:
 ; D:/TC/src/output.c:275:             ast_output(0, false, "type: \"integer\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:275:             ast_output(0, false, "type: \"integer\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC15(%rip), %rcx	 ;, tmp105
.L51:
 ; D:/TC/src/output.c:279:             ast_output(0, false, "type: \"float\"\n");
	call	fwrite	 ;
 ; D:/TC/src/output.c:280:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	%r12, %rdx	 ; indent,
	movq	%rdi, %r9	 ; indent_has_next,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:280:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	0(%rbp), %r8	 ; primary_28->value.literal_value,
	leaq	.LC16(%rip), %rdx	 ;, tmp110
.L52:
 ; D:/TC/src/output.c:270: }
	addq	$40, %rsp	 ;,
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
	popq	%r15	 ;
 ; D:/TC/src/output.c:280:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	jmp	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L37:
 ; D:/TC/src/output.c:279:             ast_output(0, false, "type: \"float\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:279:             ast_output(0, false, "type: \"float\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC17(%rip), %rcx	 ;, tmp108
	jmp	.L51	 ;
	.p2align 4,,10
	.p2align 3
.L36:
 ; D:/TC/src/output.c:283:             ast_output(0, false, "type: \"string\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:283:             ast_output(0, false, "type: \"string\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rcx	 ;, tmp111
	call	fwrite	 ;
 ; D:/TC/src/output.c:284:             ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
	movq	%r12, %rdx	 ; indent,
	movq	%rdi, %r9	 ; indent_has_next,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:284:             ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
	movq	0(%rbp), %r8	 ; primary_28->value.literal_value,
	leaq	.LC19(%rip), %rdx	 ;, tmp113
	jmp	.L52	 ;
	.p2align 4,,10
	.p2align 3
.L35:
 ; D:/TC/src/output.c:287:             ast_output(0, false, "type: \"boolean\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:287:             ast_output(0, false, "type: \"boolean\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC20(%rip), %rcx	 ;, tmp114
	call	fwrite	 ;
 ; D:/TC/src/output.c:288:             ast_output(0, true, "value: \"true\"\n");
	movq	%rdi, %r9	 ; indent_has_next,
	movq	%r12, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:288:             ast_output(0, true, "value: \"true\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC21(%rip), %rcx	 ;, tmp115
.L53:
 ; D:/TC/src/output.c:270: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:/TC/src/output.c:292:             ast_output(0, true, "value: \"false\"\n");
	jmp	fwrite	 ;
	.p2align 4,,10
	.p2align 3
.L34:
 ; D:/TC/src/output.c:291:             ast_output(0, false, "type: \"boolean\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:291:             ast_output(0, false, "type: \"boolean\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC20(%rip), %rcx	 ;, tmp116
	call	fwrite	 ;
 ; D:/TC/src/output.c:292:             ast_output(0, true, "value: \"false\"\n");
	movq	%rdi, %r9	 ; indent_has_next,
	movq	%r12, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:292:             ast_output(0, true, "value: \"false\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC22(%rip), %rcx	 ;, tmp117
	jmp	.L53	 ;
	.p2align 4,,10
	.p2align 3
.L33:
 ; D:/TC/src/output.c:295:             ast_output(0, false, "type: \"expression\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:295:             ast_output(0, false, "type: \"expression\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$19, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC23(%rip), %rcx	 ;, tmp118
	call	fwrite	 ;
 ; D:/TC/src/output.c:296:             ast_output(0, true, "value\n");
	movq	%rdi, %r9	 ; indent_has_next,
	movq	%r12, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:296:             ast_output(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC24(%rip), %rcx	 ;, tmp119
	call	fwrite	 ;
 ; D:/TC/src/output.c:297:             output_expression(primary->value.expr, outfile, indent + 1, indent_has_next);
	movq	0(%rbp), %r14	 ; primary_28->value.expr, expression
 ; D:/TC/src/output.c:298:             break;
	jmp	.L39	 ;
	.p2align 4,,10
	.p2align 3
.L32:
 ; D:/TC/src/output.c:300:             ast_output(0, false, "type: \"!\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:300:             ast_output(0, false, "type: \"!\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC25(%rip), %rcx	 ;, tmp120
	jmp	.L50	 ;
.L28:
 ; D:/TC/src/output.c:315:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movq	%r12, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movq	%rdi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:315:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movl	8(%rbp), %r8d	 ; primary_28->type,
 ; D:/TC/src/output.c:270: }
	addq	$40, %rsp	 ;,
 ; D:/TC/src/output.c:315:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movq	%rbx, %rcx	 ; outfile,
	leaq	.LC28(%rip), %rdx	 ;, tmp128
 ; D:/TC/src/output.c:270: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:/TC/src/output.c:315:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	jmp	fprintf	 ;
	.section .rdata,"dr"
.LC32:
	.ascii "name\12\0"
.LC33:
	.ascii "value: \"NULL\"\12\0"
	.text
	.p2align 4
	.def	output_variable;	.scl	3;	.type	32;	.endef
output_variable:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%rcx, %rbp	 ; tmp98, variable
	pushq	%rdi	 ;
	movq	%r8, %rdi	 ; tmp100, indent
 ; D:/TC/src/output.c:130:     ast_output(0, false, "type\n");
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/output.c:128: void output_variable(Variable* variable, FILE* outfile, size_t indent, char indent_has_next[32]) {
	pushq	%rsi	 ;
	movq	%r9, %rsi	 ; tmp101, indent_has_next
 ; D:/TC/src/output.c:131:     output_name(variable->type, outfile, indent + 1, indent_has_next);
	leaq	1(%rdi), %r12	 ;, _1
 ; D:/TC/src/output.c:128: void output_variable(Variable* variable, FILE* outfile, size_t indent, char indent_has_next[32]) {
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp99, outfile
 ; D:/TC/src/output.c:130:     ast_output(0, false, "type\n");
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
 ; D:/TC/src/output.c:128: void output_variable(Variable* variable, FILE* outfile, size_t indent, char indent_has_next[32]) {
	subq	$32, %rsp	 ;,
 ; D:/TC/src/output.c:130:     ast_output(0, false, "type\n");
	call	indention	 ;
 ; D:/TC/src/output.c:130:     ast_output(0, false, "type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp91
	call	fwrite	 ;
 ; D:/TC/src/output.c:131:     output_name(variable->type, outfile, indent + 1, indent_has_next);
	movq	0(%rbp), %rcx	 ; variable_13(D)->type, variable_13(D)->type
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
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC32(%rip), %rcx	 ;, tmp93
	call	fwrite	 ;
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
	je	.L56	 ;,
 ; D:/TC/src/output.c:135:         ast_output(0, true, "value\n");
	call	indention	 ;
 ; D:/TC/src/output.c:135:         ast_output(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC24(%rip), %rcx	 ;, tmp95
	call	fwrite	 ;
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
	.p2align 4,,10
	.p2align 3
.L56:
 ; D:/TC/src/output.c:138:         ast_output(0, true, "value: \"NULL\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:140: }
	addq	$32, %rsp	 ;,
 ; D:/TC/src/output.c:138:         ast_output(0, true, "value: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
 ; D:/TC/src/output.c:140: }
	popq	%rbx	 ;
 ; D:/TC/src/output.c:138:         ast_output(0, true, "value: \"NULL\"\n");
	movl	$1, %edx	 ;,
	leaq	.LC33(%rip), %rcx	 ;, tmp97
 ; D:/TC/src/output.c:140: }
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:/TC/src/output.c:138:         ast_output(0, true, "value: \"NULL\"\n");
	jmp	fwrite	 ;
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
	.align 8
.LC45:
	.ascii "unknown_VariableAccessType: %u\12\0"
	.text
	.p2align 4
	.def	output_variable_access;	.scl	3;	.type	32;	.endef
output_variable_access:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%r8, %rbp	 ; tmp130, indent
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp128, variable_access
	pushq	%rsi	 ;
	movq	%r9, %rsi	 ; tmp131, indent_has_next
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp129, outfile
	subq	$40, %rsp	 ;,
 ; D:/TC/src/output.c:324:     switch (variable_access->type) {
	movl	16(%rcx), %eax	 ; variable_access_19(D)->type, _1
 ; D:/TC/src/output.c:324:     switch (variable_access->type) {
	cmpl	$2, %eax	 ;, _1
	je	.L59	 ;,
	ja	.L60	 ;,
	testl	%eax, %eax	 ; _1
	je	.L73	 ;,
 ; D:/TC/src/output.c:331:             args = list_copy(variable_access->content.args);
	movq	8(%rcx), %rcx	 ; variable_access_19(D)->content.args, variable_access_19(D)->content.args
 ; D:/TC/src/output.c:334:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %r14	 ;, _5
 ; D:/TC/src/output.c:337:             index = -1;
	movl	$-1, %r12d	 ;, index
 ; D:/TC/src/output.c:339:                 ast_output(1, false, "arguments[%d]\n", ++index);
	leaq	.LC38(%rip), %r15	 ;, tmp126
 ; D:/TC/src/output.c:331:             args = list_copy(variable_access->content.args);
	call	list_copy	 ;
 ; D:/TC/src/output.c:332:             ast_output(0, false, "type: \"function_call\"\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rsi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; outfile,
 ; D:/TC/src/output.c:331:             args = list_copy(variable_access->content.args);
	movq	%rax, %r13	 ; tmp132, args
 ; D:/TC/src/output.c:332:             ast_output(0, false, "type: \"function_call\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:332:             ast_output(0, false, "type: \"function_call\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$22, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC35(%rip), %rcx	 ;, tmp108
	call	fwrite	 ;
 ; D:/TC/src/output.c:333:             ast_output(0, false, "function\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rsi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:333:             ast_output(0, false, "function\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC36(%rip), %rcx	 ;, tmp109
	call	fwrite	 ;
 ; D:/TC/src/output.c:334:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	movq	(%rdi), %rcx	 ; variable_access_19(D)->base, variable_access_19(D)->base
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r14, %r8	 ; _5,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; D:/TC/src/output.c:335:             ast_output(0, true, "arguments\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
 ; D:/TC/src/output.c:340:                 output_expression(arg, outfile, indent + 2, indent_has_next);
	addq	$2, %rbp	 ;, tmp127
 ; D:/TC/src/output.c:335:             ast_output(0, true, "arguments\n");
	call	indention	 ;
 ; D:/TC/src/output.c:335:             ast_output(0, true, "arguments\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC37(%rip), %rcx	 ;, tmp111
	call	fwrite	 ;
 ; D:/TC/src/output.c:338:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	jmp	.L65	 ;
	.p2align 4,,10
	.p2align 3
.L66:
 ; D:/TC/src/output.c:339:                 ast_output(1, false, "arguments[%d]\n", ++index);
	movq	%rsi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%r14, %rdx	 ; _5,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:339:                 ast_output(1, false, "arguments[%d]\n", ++index);
	addl	$1, %r12d	 ;, index
	movq	%r15, %rdx	 ; tmp126,
	movq	%rbx, %rcx	 ; outfile,
	movl	%r12d, %r8d	 ; index,
	call	fprintf	 ;
 ; D:/TC/src/output.c:340:                 output_expression(arg, outfile, indent + 2, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbp, %r8	 ; tmp127,
	movq	%rbx, %rdx	 ; outfile,
	movq	%rdi, %rcx	 ; arg,
	call	output_expression	 ;
.L65:
 ; D:/TC/src/output.c:338:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	movq	%r13, %rcx	 ; args,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp133, arg
 ; D:/TC/src/output.c:338:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	 ; arg
	jne	.L66	 ;,
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
	.p2align 4,,10
	.p2align 3
.L60:
 ; D:/TC/src/output.c:324:     switch (variable_access->type) {
	cmpl	$3, %eax	 ;, _1
	jne	.L74	 ;,
 ; D:/TC/src/output.c:344:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
 ; D:/TC/src/output.c:346:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %r12	 ;, _8
 ; D:/TC/src/output.c:344:             ast_output(0, false, "type: \"get sequence_element\"\n");
	xorl	%r8d, %r8d	 ;
	call	indention	 ;
 ; D:/TC/src/output.c:344:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$29, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC39(%rip), %rcx	 ;, tmp114
	call	fwrite	 ;
 ; D:/TC/src/output.c:345:             ast_output(0, false, "sequence\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	xorl	%r8d, %r8d	 ;
	call	indention	 ;
 ; D:/TC/src/output.c:345:             ast_output(0, false, "sequence\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC40(%rip), %rcx	 ;, tmp115
	call	fwrite	 ;
 ; D:/TC/src/output.c:346:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	movq	(%rdi), %rcx	 ; variable_access_19(D)->base, variable_access_19(D)->base
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _8,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; D:/TC/src/output.c:347:             ast_output(0, true, "index\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:347:             ast_output(0, true, "index\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC41(%rip), %rcx	 ;, tmp117
	call	fwrite	 ;
 ; D:/TC/src/output.c:348:             output_expression(variable_access->content.index, outfile, indent + 1, indent_has_next);
	movq	8(%rdi), %rcx	 ; variable_access_19(D)->content.index, variable_access_19(D)->content.index
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
	.p2align 4,,10
	.p2align 3
.L59:
 ; D:/TC/src/output.c:351:             ast_output(0, false, "type: \"get_attribute\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
 ; D:/TC/src/output.c:353:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %r12	 ;, _11
 ; D:/TC/src/output.c:351:             ast_output(0, false, "type: \"get_attribute\"\n");
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:351:             ast_output(0, false, "type: \"get_attribute\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$22, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC42(%rip), %rcx	 ;, tmp119
	call	fwrite	 ;
 ; D:/TC/src/output.c:352:             ast_output(0, false, "object\n");
	movq	%rsi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:352:             ast_output(0, false, "object\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC43(%rip), %rcx	 ;, tmp120
	call	fwrite	 ;
 ; D:/TC/src/output.c:353:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	movq	(%rdi), %rcx	 ; variable_access_19(D)->base, variable_access_19(D)->base
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _11,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; D:/TC/src/output.c:354:             ast_output(0, true, "attribute_name\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:354:             ast_output(0, true, "attribute_name\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	leaq	.LC44(%rip), %rcx	 ;, tmp122
	movl	$1, %edx	 ;,
	call	fwrite	 ;
 ; D:/TC/src/output.c:355:             output_name(variable_access->content.attr_name, outfile, indent + 1, indent_has_next);
	movq	8(%rdi), %rcx	 ; variable_access_19(D)->content.attr_name, variable_access_19(D)->content.attr_name
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _11,
.L72:
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
	.p2align 4,,10
	.p2align 3
.L73:
 ; D:/TC/src/output.c:326:             ast_output(0, false, "type: \"name\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:326:             ast_output(0, false, "type: \"name\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC34(%rip), %rcx	 ;, tmp103
	call	fwrite	 ;
 ; D:/TC/src/output.c:327:             ast_output(0, true, "name\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:327:             ast_output(0, true, "name\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	leaq	.LC32(%rip), %rcx	 ;, tmp104
	movl	$1, %edx	 ;,
	call	fwrite	 ;
 ; D:/TC/src/output.c:328:             output_name(variable_access->content.name, outfile, indent + 1, indent_has_next);
	movq	8(%rdi), %rcx	 ; variable_access_19(D)->content.name, variable_access_19(D)->content.name
	movq	%rsi, %r9	 ; indent_has_next,
	leaq	1(%rbp), %r8	 ;,
	jmp	.L72	 ;
	.p2align 4,,10
	.p2align 3
.L74:
 ; D:/TC/src/output.c:358:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:358:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movl	16(%rdi), %r8d	 ; variable_access_19(D)->type,
 ; D:/TC/src/output.c:362: }
	addq	$40, %rsp	 ;,
 ; D:/TC/src/output.c:358:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movq	%rbx, %rcx	 ; outfile,
	leaq	.LC45(%rip), %rdx	 ;, tmp125
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
	.align 8
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
	.p2align 4
	.def	output_statement;	.scl	3;	.type	32;	.endef
output_statement:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%rcx, %rbp	 ; tmp195, statement
	pushq	%rdi	 ;
	movq	%r8, %rdi	 ; tmp197, indent
	pushq	%rsi	 ;
	movq	%r9, %rsi	 ; tmp198, indent_has_next
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp196, outfile
	subq	$72, %rsp	 ;,
 ; D:/TC/src/output.c:143:     switch (statement->type) {
	cmpl	$7, 8(%rcx)	 ;, statement_19(D)->type
	ja	.L76	 ;,
	movl	8(%rcx), %eax	 ; statement_19(D)->type, statement_19(D)->type
	leaq	.L78(%rip), %rdx	 ;, tmp137
 ; D:/TC/src/output.c:173:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; outfile,
 ; D:/TC/src/output.c:143:     switch (statement->type) {
	movslq	(%rdx,%rax,4), %rax	 ;, tmp139
	addq	%rdx, %rax	 ; tmp137, tmp140
 ; D:/TC/src/output.c:173:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movq	%rdi, %rdx	 ; indent,
 ; D:/TC/src/output.c:143:     switch (statement->type) {
	jmp	*%rax	 ; tmp140
	.section .rdata,"dr"
	.align 4
.L78:
	.long	.L85-.L78
	.long	.L84-.L78
	.long	.L83-.L78
	.long	.L82-.L78
	.long	.L81-.L78
	.long	.L80-.L78
	.long	.L79-.L78
	.long	.L77-.L78
	.text
	.p2align 4,,10
	.p2align 3
.L79:
 ; D:/TC/src/output.c:170:             ast_output(0, false, "break_statement: \"NULL\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:170:             ast_output(0, false, "break_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$24, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC61(%rip), %rcx	 ;, tmp183
.L109:
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
	jmp	fwrite	 ;
	.p2align 4,,10
	.p2align 3
.L77:
 ; D:/TC/src/output.c:173:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:173:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$27, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC62(%rip), %rcx	 ;, tmp184
	jmp	.L109	 ;
	.p2align 4,,10
	.p2align 3
.L85:
 ; D:/TC/src/output.c:176:             if (statement->stmt.expr == NULL) {
	cmpq	$0, 0(%rbp)	 ;, statement_19(D)->stmt.expr
	je	.L111	 ;,
 ; D:/TC/src/output.c:181:             ast_output(0, false, "expression_statement\n");
	call	indention	 ;
 ; D:/TC/src/output.c:181:             ast_output(0, false, "expression_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$21, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC64(%rip), %rcx	 ;, tmp186
.L110:
	call	fwrite	 ;
 ; D:/TC/src/output.c:182:             output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
	movq	0(%rbp), %rcx	 ; statement_19(D)->stmt.expr, statement_19(D)->stmt.expr
 ; D:/TC/src/output.c:189: }
	addq	$72, %rsp	 ;,
 ; D:/TC/src/output.c:182:             output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
 ; D:/TC/src/output.c:189: }
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
	.p2align 4,,10
	.p2align 3
.L84:
 ; D:/TC/src/output.c:157:             ast_output(0, false, "variable_declaration_statement\n");
	call	indention	 ;
 ; D:/TC/src/output.c:157:             ast_output(0, false, "variable_declaration_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC58(%rip), %rcx	 ;, tmp176
	call	fwrite	 ;
 ; D:/TC/src/output.c:158:             output_variable(statement->stmt.var, outfile, indent + 1, indent_has_next);
	movq	0(%rbp), %rcx	 ; statement_19(D)->stmt.var, statement_19(D)->stmt.var
 ; D:/TC/src/output.c:189: }
	addq	$72, %rsp	 ;,
 ; D:/TC/src/output.c:158:             output_variable(statement->stmt.var, outfile, indent + 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
 ; D:/TC/src/output.c:189: }
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
	.p2align 4,,10
	.p2align 3
.L83:
 ; D:/TC/src/output.c:145:             ast_output(0, false, "if_statement\n");
	call	indention	 ;
 ; D:/TC/src/output.c:145:             ast_output(0, false, "if_statement\n");
	movq	%rbx, %r9	 ; outfile,
 ; D:/TC/src/output.c:146:             output_if(statement->stmt.if_stmt, outfile, indent + 1, indent_has_next);
	leaq	1(%rdi), %r13	 ;, _2
 ; D:/TC/src/output.c:145:             ast_output(0, false, "if_statement\n");
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC46(%rip), %rcx	 ;, tmp142
 ; D:/TC/src/output.c:146:             output_if(statement->stmt.if_stmt, outfile, indent + 1, indent_has_next);
	movq	%r13, %r12	 ; _2, _2
 ; D:/TC/src/output.c:145:             ast_output(0, false, "if_statement\n");
	call	fwrite	 ;
 ; D:/TC/src/output.c:146:             output_if(statement->stmt.if_stmt, outfile, indent + 1, indent_has_next);
	movq	0(%rbp), %r14	 ; statement_19(D)->stmt.if_stmt, _3
	movq	%r13, 56(%rsp)	 ; _2, %sfp
 ; D:/TC/src/output.c:196:     output_expression(if_->condition, outfile, indent + 1, indent_has_next);
	leaq	2(%rdi), %rbp	 ;, _57
 ; D:/TC/src/output.c:192:     list(Statement*) body = list_copy(if_->body);
	movq	8(%r14), %rcx	 ; _3->body, _3->body
	call	list_copy	 ;
 ; D:/TC/src/output.c:193:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	movq	16(%r14), %rcx	 ; _3->else_if, _3->else_if
 ; D:/TC/src/output.c:192:     list(Statement*) body = list_copy(if_->body);
	movq	%rax, %r15	 ; tmp199, body
 ; D:/TC/src/output.c:193:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	call	list_copy	 ;
 ; D:/TC/src/output.c:194:     list(Statement*) else_body = list_copy(if_->else_body);
	movq	24(%r14), %rcx	 ; _3->else_body, _3->else_body
 ; D:/TC/src/output.c:193:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	movq	%rax, 40(%rsp)	 ; tmp200, %sfp
 ; D:/TC/src/output.c:194:     list(Statement*) else_body = list_copy(if_->else_body);
	call	list_copy	 ;
 ; D:/TC/src/output.c:195:     ast_output(0, false, "condition\n");
	movq	%rsi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%r13, %rdx	 ; _2,
	movq	%rbx, %rcx	 ; outfile,
 ; D:/TC/src/output.c:195:     ast_output(0, false, "condition\n");
	leaq	.LC47(%rip), %r13	 ;, tmp191
 ; D:/TC/src/output.c:194:     list(Statement*) else_body = list_copy(if_->else_body);
	movq	%rax, 48(%rsp)	 ; tmp201, %sfp
 ; D:/TC/src/output.c:195:     ast_output(0, false, "condition\n");
	call	indention	 ;
 ; D:/TC/src/output.c:195:     ast_output(0, false, "condition\n");
	movq	%rbx, %r9	 ; outfile,
	movq	%r13, %rcx	 ; tmp191,
	movl	$1, %edx	 ;,
	movl	$10, %r8d	 ;,
	call	fwrite	 ;
 ; D:/TC/src/output.c:196:     output_expression(if_->condition, outfile, indent + 1, indent_has_next);
	movq	(%r14), %rcx	 ; _3->condition, _3->condition
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbp, %r8	 ; _57,
	movq	%rbx, %rdx	 ; outfile,
 ; D:/TC/src/output.c:197:     ast_output(0, false, "body\n");
	leaq	.LC48(%rip), %r14	 ;, tmp192
 ; D:/TC/src/output.c:196:     output_expression(if_->condition, outfile, indent + 1, indent_has_next);
	call	output_expression	 ;
 ; D:/TC/src/output.c:197:     ast_output(0, false, "body\n");
	movq	%rsi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%r12, %rdx	 ; _2,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:197:     ast_output(0, false, "body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; tmp192,
	movl	$5, %r8d	 ;,
	call	fwrite	 ;
 ; D:/TC/src/output.c:199:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L86	 ;
	.p2align 4,,10
	.p2align 3
.L87:
 ; D:/TC/src/output.c:200:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rbp, %r8	 ; _57,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
.L86:
 ; D:/TC/src/output.c:199:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r15, %rcx	 ; body,
	call	list_pop	 ;
 ; D:/TC/src/output.c:200:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
 ; D:/TC/src/output.c:199:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rax, %rcx	 ; tmp202, statement
 ; D:/TC/src/output.c:199:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L87	 ;,
 ; D:/TC/src/output.c:201:     ast_output(0, false, "else_if\n");
	movq	56(%rsp), %rdx	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; outfile,
 ; D:/TC/src/output.c:214:     output_expression(else_if->condition, outfile, indent + 1, indent_has_next);
	leaq	3(%rdi), %r15	 ;, _64
 ; D:/TC/src/output.c:201:     ast_output(0, false, "else_if\n");
	call	indention	 ;
 ; D:/TC/src/output.c:201:     ast_output(0, false, "else_if\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC49(%rip), %rcx	 ;, tmp149
	call	fwrite	 ;
.L88:
 ; D:/TC/src/output.c:203:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	movq	40(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %r12	 ; tmp205, else_if
 ; D:/TC/src/output.c:203:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	testq	%rax, %rax	 ; else_if
	je	.L112	 ;,
 ; D:/TC/src/output.c:212:     list(Statement*) body = list_copy(else_if->body);
	movq	8(%r12), %rcx	 ; else_if_60->body, else_if_60->body
	call	list_copy	 ;
 ; D:/TC/src/output.c:213:     ast_output(0, false, "condition\n");
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbp, %rdx	 ; _57,
	movq	%rbx, %rcx	 ; outfile,
 ; D:/TC/src/output.c:212:     list(Statement*) body = list_copy(else_if->body);
	movq	%rax, %rdi	 ; tmp203, body
 ; D:/TC/src/output.c:213:     ast_output(0, false, "condition\n");
	call	indention	 ;
 ; D:/TC/src/output.c:213:     ast_output(0, false, "condition\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; tmp191,
	movl	$10, %r8d	 ;,
	call	fwrite	 ;
 ; D:/TC/src/output.c:214:     output_expression(else_if->condition, outfile, indent + 1, indent_has_next);
	movq	(%r12), %rcx	 ; else_if_60->condition, else_if_60->condition
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r15, %r8	 ; _64,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:/TC/src/output.c:215:     ast_output(0, true, "body\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbp, %rdx	 ; _57,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:215:     ast_output(0, true, "body\n");
	movq	%r14, %rcx	 ; tmp192,
	movq	%rbx, %r9	 ; outfile,
	movl	$1, %edx	 ;,
	movl	$5, %r8d	 ;,
	call	fwrite	 ;
 ; D:/TC/src/output.c:217:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
 ; D:/TC/src/output.c:217:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L88	 ;,
.L90:
 ; D:/TC/src/output.c:218:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rax, %rcx	 ; statement,
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r15, %r8	 ; _64,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
 ; D:/TC/src/output.c:217:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
 ; D:/TC/src/output.c:217:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L90	 ;,
	jmp	.L88	 ;
	.p2align 4,,10
	.p2align 3
.L82:
 ; D:/TC/src/output.c:153:             ast_output(0, false, "while_statement\n");
	call	indention	 ;
 ; D:/TC/src/output.c:153:             ast_output(0, false, "while_statement\n");
	movq	%rbx, %r9	 ; outfile,
 ; D:/TC/src/output.c:154:             output_while(statement->stmt.while_stmt, outfile, indent + 1, indent_has_next);
	leaq	1(%rdi), %r12	 ;, _6
 ; D:/TC/src/output.c:153:             ast_output(0, false, "while_statement\n");
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC57(%rip), %rcx	 ;, tmp171
 ; D:/TC/src/output.c:249:     output_expression(while_->condition, outfile, indent + 1, indent_has_next);
	addq	$2, %rdi	 ;, _82
 ; D:/TC/src/output.c:153:             ast_output(0, false, "while_statement\n");
	call	fwrite	 ;
 ; D:/TC/src/output.c:154:             output_while(statement->stmt.while_stmt, outfile, indent + 1, indent_has_next);
	movq	0(%rbp), %r13	 ; statement_19(D)->stmt.while_stmt, _7
 ; D:/TC/src/output.c:247:     list(Statement*) body = list_copy(while_->body);
	movq	8(%r13), %rcx	 ; _7->body, _7->body
	call	list_copy	 ;
 ; D:/TC/src/output.c:248:     ast_output(0, false, "condition\n");
	movq	%rsi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%r12, %rdx	 ; _6,
	movq	%rbx, %rcx	 ; outfile,
 ; D:/TC/src/output.c:247:     list(Statement*) body = list_copy(while_->body);
	movq	%rax, %rbp	 ; tmp209, body
 ; D:/TC/src/output.c:248:     ast_output(0, false, "condition\n");
	call	indention	 ;
 ; D:/TC/src/output.c:248:     ast_output(0, false, "condition\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC47(%rip), %rcx	 ;, tmp173
	call	fwrite	 ;
 ; D:/TC/src/output.c:249:     output_expression(while_->condition, outfile, indent + 1, indent_has_next);
	movq	0(%r13), %rcx	 ; _7->condition, _7->condition
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rdi, %r8	 ; _82,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:/TC/src/output.c:250:     ast_output(0, true, "body\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %rdx	 ; _6,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:250:     ast_output(0, true, "body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rcx	 ;, tmp175
	call	fwrite	 ;
 ; D:/TC/src/output.c:252:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L104	 ;
	.p2align 4,,10
	.p2align 3
.L105:
 ; D:/TC/src/output.c:253:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rdi, %r8	 ; _82,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
.L104:
 ; D:/TC/src/output.c:252:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbp, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp210, statement
 ; D:/TC/src/output.c:252:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L105	 ;,
.L75:
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
	.p2align 4,,10
	.p2align 3
.L81:
 ; D:/TC/src/output.c:149:             ast_output(0, false, "for_statement\n");
	call	indention	 ;
 ; D:/TC/src/output.c:149:             ast_output(0, false, "for_statement\n");
	movq	%rbx, %r9	 ; outfile,
 ; D:/TC/src/output.c:150:             output_for(statement->stmt.for_stmt, outfile, indent + 1, indent_has_next);
	leaq	1(%rdi), %r13	 ;, _4
 ; D:/TC/src/output.c:149:             ast_output(0, false, "for_statement\n");
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC51(%rip), %rcx	 ;, tmp155
	call	fwrite	 ;
 ; D:/TC/src/output.c:150:             output_for(statement->stmt.for_stmt, outfile, indent + 1, indent_has_next);
	movq	0(%rbp), %r12	 ; statement_19(D)->stmt.for_stmt, _5
 ; D:/TC/src/output.c:223:     list(Statement*) body = list_copy(for_->body);
	movq	24(%r12), %rcx	 ; _5->body, _5->body
	call	list_copy	 ;
 ; D:/TC/src/output.c:225:         ast_output(0, false, "initializer\n");
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/output.c:224:     if (for_->initializer != NULL) {
	cmpq	$0, (%r12)	 ;, _5->initializer
 ; D:/TC/src/output.c:225:         ast_output(0, false, "initializer\n");
	movq	%rsi, %r9	 ; indent_has_next,
 ; D:/TC/src/output.c:223:     list(Statement*) body = list_copy(for_->body);
	movq	%rax, %rbp	 ; tmp207, body
 ; D:/TC/src/output.c:225:         ast_output(0, false, "initializer\n");
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
 ; D:/TC/src/output.c:224:     if (for_->initializer != NULL) {
	je	.L95	 ;,
 ; D:/TC/src/output.c:225:         ast_output(0, false, "initializer\n");
	call	indention	 ;
 ; D:/TC/src/output.c:225:         ast_output(0, false, "initializer\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC52(%rip), %rcx	 ;, tmp157
	call	fwrite	 ;
 ; D:/TC/src/output.c:226:         output_variable(for_->initializer, outfile, indent + 1, indent_has_next);
	movq	(%r12), %rcx	 ; _5->initializer, _5->initializer
	movq	%rsi, %r9	 ; indent_has_next,
	leaq	2(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable	 ;
.L96:
 ; D:/TC/src/output.c:230:         ast_output(0, false, "condition\n");
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/output.c:229:     if (for_->condition != NULL) {
	cmpq	$0, 8(%r12)	 ;, _5->condition
 ; D:/TC/src/output.c:230:         ast_output(0, false, "condition\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
 ; D:/TC/src/output.c:229:     if (for_->condition != NULL) {
	je	.L97	 ;,
 ; D:/TC/src/output.c:230:         ast_output(0, false, "condition\n");
	call	indention	 ;
 ; D:/TC/src/output.c:230:         ast_output(0, false, "condition\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC47(%rip), %rcx	 ;, tmp161
	call	fwrite	 ;
 ; D:/TC/src/output.c:231:         output_expression(for_->condition, outfile, indent + 1, indent_has_next);
	movq	8(%r12), %rcx	 ; _5->condition, _5->condition
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbx, %rdx	 ; outfile,
	leaq	2(%rdi), %r8	 ;,
	call	output_expression	 ;
.L98:
 ; D:/TC/src/output.c:235:         ast_output(0, false, "increment\n");
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/output.c:234:     if (for_->increment != NULL) {
	cmpq	$0, 16(%r12)	 ;, _5->increment
 ; D:/TC/src/output.c:235:         ast_output(0, false, "increment\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
 ; D:/TC/src/output.c:234:     if (for_->increment != NULL) {
	je	.L99	 ;,
 ; D:/TC/src/output.c:235:         ast_output(0, false, "increment\n");
	call	indention	 ;
 ; D:/TC/src/output.c:235:         ast_output(0, false, "increment\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC55(%rip), %rcx	 ;, tmp165
	call	fwrite	 ;
 ; D:/TC/src/output.c:236:         output_expression(for_->increment, outfile, indent + 1, indent_has_next);
	movq	16(%r12), %rcx	 ; _5->increment, _5->increment
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbx, %rdx	 ; outfile,
	leaq	2(%rdi), %r8	 ;,
	call	output_expression	 ;
.L100:
 ; D:/TC/src/output.c:239:     ast_output(0, true, "body\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:239:     ast_output(0, true, "body\n");
	movq	%rbx, %r9	 ; outfile,
 ; D:/TC/src/output.c:242:         output_statement(statement, outfile, indent + 1, indent_has_next);
	addq	$2, %rdi	 ;, tmp194
 ; D:/TC/src/output.c:239:     ast_output(0, true, "body\n");
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rcx	 ;, tmp169
	call	fwrite	 ;
 ; D:/TC/src/output.c:241:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L101	 ;
	.p2align 4,,10
	.p2align 3
.L102:
 ; D:/TC/src/output.c:242:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rdi, %r8	 ; tmp194,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
.L101:
 ; D:/TC/src/output.c:241:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbp, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp208, statement
 ; D:/TC/src/output.c:241:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L102	 ;,
	jmp	.L75	 ;
	.p2align 4,,10
	.p2align 3
.L80:
 ; D:/TC/src/output.c:161:             if (statement->stmt.expr == NULL) {
	cmpq	$0, 0(%rbp)	 ;, statement_19(D)->stmt.expr
	je	.L113	 ;,
 ; D:/TC/src/output.c:166:             ast_output(0, false, "return_statement\n");
	call	indention	 ;
 ; D:/TC/src/output.c:166:             ast_output(0, false, "return_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC60(%rip), %rcx	 ;, tmp180
	jmp	.L110	 ;
.L76:
 ; D:/TC/src/output.c:185:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	xorl	%r8d, %r8d	 ;
	call	indention	 ;
 ; D:/TC/src/output.c:185:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movl	8(%rbp), %r8d	 ; statement_19(D)->type,
 ; D:/TC/src/output.c:189: }
	addq	$72, %rsp	 ;,
 ; D:/TC/src/output.c:185:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movq	%rbx, %rcx	 ; outfile,
	leaq	.LC65(%rip), %rdx	 ;, tmp190
 ; D:/TC/src/output.c:189: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:/TC/src/output.c:185:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	jmp	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L112:
 ; D:/TC/src/output.c:205:     ast_output(0, true, "else_body\n");
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:205:     ast_output(0, true, "else_body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC50(%rip), %rcx	 ;, tmp154
	call	fwrite	 ;
 ; D:/TC/src/output.c:206:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	jmp	.L92	 ;
	.p2align 4,,10
	.p2align 3
.L93:
 ; D:/TC/src/output.c:207:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbp, %r8	 ; _57,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
.L92:
 ; D:/TC/src/output.c:206:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	movq	48(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp206, statement
 ; D:/TC/src/output.c:206:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L93	 ;,
	jmp	.L75	 ;
.L95:
 ; D:/TC/src/output.c:228:         ast_output(0, false, "initializer: \"NULL\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:228:         ast_output(0, false, "initializer: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$20, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC53(%rip), %rcx	 ;, tmp160
	call	fwrite	 ;
	jmp	.L96	 ;
.L99:
 ; D:/TC/src/output.c:238:         ast_output(0, false, "increment: \"NULL\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:238:         ast_output(0, false, "increment: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC56(%rip), %rcx	 ;, tmp168
	call	fwrite	 ;
	jmp	.L100	 ;
.L97:
 ; D:/TC/src/output.c:233:         ast_output(0, false, "condition: \"NULL\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:233:         ast_output(0, false, "condition: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC54(%rip), %rcx	 ;, tmp164
	call	fwrite	 ;
	jmp	.L98	 ;
.L111:
 ; D:/TC/src/output.c:177:                 ast_output(0, false, "expression_statement: \"NULL\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:177:                 ast_output(0, false, "expression_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$29, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC63(%rip), %rcx	 ;, tmp185
	jmp	.L109	 ;
.L113:
 ; D:/TC/src/output.c:162:                 ast_output(0, false, "return_statement: \"NULL\"\n");
	call	indention	 ;
 ; D:/TC/src/output.c:162:                 ast_output(0, false, "return_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$25, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC59(%rip), %rcx	 ;, tmp179
	jmp	.L109	 ;
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
	.p2align 4
	.def	output_var;	.scl	3;	.type	32;	.endef
output_var:
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp110, outfile
	movq	%r8, %rdx	 ; tmp111, indent
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
 ; D:/TC/src/output.c:509:     if (var == NULL) {
	testq	%rcx, %rcx	 ; var
	je	.L121	 ;,
	movq	%rcx, %rbx	 ; tmp109, var
 ; D:/TC/src/output.c:515:         tac_output(indent, "NULL\t%s\n", var->name);
	movq	%rsi, %rcx	 ; outfile,
 ; D:/TC/src/output.c:514:     if (var->type == NULL)
	cmpq	$0, 16(%rbx)	 ;, var_13(D)->type
	je	.L122	 ;,
 ; D:/TC/src/output.c:516:     else if (var->original_name)
	cmpq	$0, (%rbx)	 ;, var_13(D)->original_name
	je	.L117	 ;,
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
	.p2align 4,,10
	.p2align 3
.L117:
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
	.p2align 4,,10
	.p2align 3
.L122:
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
	.p2align 4,,10
	.p2align 3
.L121:
 ; D:/TC/src/output.c:510:         tac_output(indent, "Var: \"NULL\"\n");
	movq	%rsi, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:521: }
	addq	$56, %rsp	 ;,
 ; D:/TC/src/output.c:510:         tac_output(indent, "Var: \"NULL\"\n");
	movq	%rsi, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
 ; D:/TC/src/output.c:521: }
	popq	%rbx	 ;
 ; D:/TC/src/output.c:510:         tac_output(indent, "Var: \"NULL\"\n");
	movl	$1, %edx	 ;,
	leaq	.LC66(%rip), %rcx	 ;, tmp96
 ; D:/TC/src/output.c:521: }
	popq	%rsi	 ;
 ; D:/TC/src/output.c:510:         tac_output(indent, "Var: \"NULL\"\n");
	jmp	fwrite	 ;
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
	.p2align 4
	.def	output_arg;	.scl	3;	.type	32;	.endef
output_arg:
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp150, outfile
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:/TC/src/output.c:546:     if (arg == NULL) {
	testq	%rcx, %rcx	 ; arg
	je	.L145	 ;,
 ; D:/TC/src/output.c:551:     switch (arg->kind) {
	cmpl	$9, 16(%rcx)	 ;, arg_27(D)->kind
	movq	%rcx, %rbx	 ; tmp149, arg
	ja	.L125	 ;,
	movl	16(%rcx), %eax	 ; arg_27(D)->kind, arg_27(D)->kind
	leaq	.L127(%rip), %rdx	 ;, tmp111
	movslq	(%rdx,%rax,4), %rax	 ;, tmp113
	addq	%rdx, %rax	 ; tmp111, tmp114
	jmp	*%rax	 ; tmp114
	.section .rdata,"dr"
	.align 4
.L127:
	.long	.L128-.L127
	.long	.L134-.L127
	.long	.L133-.L127
	.long	.L132-.L127
	.long	.L131-.L127
	.long	.L130-.L127
	.long	.L129-.L127
	.long	.L128-.L127
	.long	.L128-.L127
	.long	.L126-.L127
	.text
	.p2align 4,,10
	.p2align 3
.L128:
 ; D:/TC/src/output.c:566:             if (arg->value.subroutine->original_name)
	movq	(%rcx), %rax	 ;* arg, arg_27(D)->value.subroutine
 ; D:/TC/src/output.c:567:                 tac_output(0, "%s(%s)", arg->value.subroutine->name, arg->value.subroutine->original_name->name);
	xorl	%edx, %edx	 ;
	movq	%rsi, %rcx	 ; outfile,
 ; D:/TC/src/output.c:566:             if (arg->value.subroutine->original_name)
	cmpq	$0, (%rax)	 ;,* arg_27(D)->value.subroutine
	je	.L138	 ;,
 ; D:/TC/src/output.c:567:                 tac_output(0, "%s(%s)", arg->value.subroutine->name, arg->value.subroutine->original_name->name);
	call	indention_tac	 ;
 ; D:/TC/src/output.c:567:                 tac_output(0, "%s(%s)", arg->value.subroutine->name, arg->value.subroutine->original_name->name);
	movq	(%rbx), %rax	 ;* arg, _18
	movq	%rsi, %rcx	 ; outfile,
	movq	(%rax), %rdx	 ;* _18, _18->original_name
	movq	8(%rax), %r8	 ;,
	movq	8(%rdx), %r9	 ;,
 ; D:/TC/src/output.c:575: }
	addq	$40, %rsp	 ;,
 ; D:/TC/src/output.c:567:                 tac_output(0, "%s(%s)", arg->value.subroutine->name, arg->value.subroutine->original_name->name);
	leaq	.LC73(%rip), %rdx	 ;, tmp137
 ; D:/TC/src/output.c:575: }
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/output.c:567:                 tac_output(0, "%s(%s)", arg->value.subroutine->name, arg->value.subroutine->original_name->name);
	jmp	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L134:
 ; D:/TC/src/output.c:558:         case ARG_INT: tac_output(0, "%lld", arg->value.int_value); break;
	xorl	%edx, %edx	 ;
	movq	%rsi, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:558:         case ARG_INT: tac_output(0, "%lld", arg->value.int_value); break;
	movq	(%rbx), %r8	 ; arg_27(D)->value.int_value,
	leaq	.LC74(%rip), %rdx	 ;, tmp124
.L143:
 ; D:/TC/src/output.c:575: }
	addq	$40, %rsp	 ;,
 ; D:/TC/src/output.c:560:         case ARG_STRING: tac_output(0, "\"%s\"", arg->value.string_value); break;
	movq	%rsi, %rcx	 ; outfile,
 ; D:/TC/src/output.c:575: }
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/output.c:560:         case ARG_STRING: tac_output(0, "\"%s\"", arg->value.string_value); break;
	jmp	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L131:
 ; D:/TC/src/output.c:561:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	xorl	%edx, %edx	 ;
	movq	%rsi, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:561:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	cmpb	$0, (%rbx)	 ;, arg_27(D)->value.bool_value
	leaq	.LC71(%rip), %rcx	 ;, tmp147
	leaq	.LC70(%rip), %rax	 ;, tmp148
	cmovne	%rax, %rcx	 ; tmp147,, tmp148, iftmp.2_25
.L142:
 ; D:/TC/src/output.c:575: }
	addq	$40, %rsp	 ;,
 ; D:/TC/src/output.c:561:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	movq	%rsi, %rdx	 ; outfile,
 ; D:/TC/src/output.c:575: }
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/output.c:561:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	jmp	fputs	 ;
	.p2align 4,,10
	.p2align 3
.L130:
 ; D:/TC/src/output.c:562:         case ARG_VOID: tac_output(0, "void"); break;
	movq	%rsi, %rcx	 ; outfile,
	xorl	%edx, %edx	 ;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:575: }
	addq	$40, %rsp	 ;,
 ; D:/TC/src/output.c:562:         case ARG_VOID: tac_output(0, "void"); break;
	movq	%rsi, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
 ; D:/TC/src/output.c:575: }
	popq	%rbx	 ;
 ; D:/TC/src/output.c:562:         case ARG_VOID: tac_output(0, "void"); break;
	movl	$1, %edx	 ;,
	leaq	.LC77(%rip), %rcx	 ;, tmp130
 ; D:/TC/src/output.c:575: }
	popq	%rsi	 ;
 ; D:/TC/src/output.c:562:         case ARG_VOID: tac_output(0, "void"); break;
	jmp	fwrite	 ;
	.p2align 4,,10
	.p2align 3
.L129:
 ; D:/TC/src/output.c:563:         case ARG_LABEL: tac_output(0, "%s", arg->value.label->name); break;
	movq	%rsi, %rcx	 ; outfile,
	xorl	%edx, %edx	 ;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:563:         case ARG_LABEL: tac_output(0, "%s", arg->value.label->name); break;
	movq	(%rbx), %rax	 ;* arg, arg_27(D)->value.label
	movq	8(%rax), %rcx	 ;, _14->name
	jmp	.L142	 ;
	.p2align 4,,10
	.p2align 3
.L126:
 ; D:/TC/src/output.c:571:         case ARG_NONE: tac_output(0, "NONE"); break;
	movq	%rsi, %rcx	 ; outfile,
	xorl	%edx, %edx	 ;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:575: }
	addq	$40, %rsp	 ;,
 ; D:/TC/src/output.c:571:         case ARG_NONE: tac_output(0, "NONE"); break;
	movq	%rsi, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
 ; D:/TC/src/output.c:575: }
	popq	%rbx	 ;
 ; D:/TC/src/output.c:571:         case ARG_NONE: tac_output(0, "NONE"); break;
	movl	$1, %edx	 ;,
	leaq	.LC78(%rip), %rcx	 ;, tmp140
 ; D:/TC/src/output.c:575: }
	popq	%rsi	 ;
 ; D:/TC/src/output.c:571:         case ARG_NONE: tac_output(0, "NONE"); break;
	jmp	fwrite	 ;
	.p2align 4,,10
	.p2align 3
.L133:
 ; D:/TC/src/output.c:559:         case ARG_FLOAT: tac_output(0, "%f", arg->value.float_value); break;
	movq	%rsi, %rcx	 ; outfile,
	xorl	%edx, %edx	 ;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:559:         case ARG_FLOAT: tac_output(0, "%f", arg->value.float_value); break;
	movq	(%rbx), %r8	 ; arg_27(D)->value.float_value, arg_27(D)->value.float_value
 ; D:/TC/src/output.c:575: }
	addq	$40, %rsp	 ;,
 ; D:/TC/src/output.c:559:         case ARG_FLOAT: tac_output(0, "%f", arg->value.float_value); break;
	movq	%rsi, %rcx	 ; outfile,
 ; D:/TC/src/output.c:575: }
	popq	%rbx	 ;
 ; D:/TC/src/output.c:559:         case ARG_FLOAT: tac_output(0, "%f", arg->value.float_value); break;
	leaq	.LC75(%rip), %rdx	 ;, tmp127
 ; D:/TC/src/output.c:575: }
	popq	%rsi	 ;
 ; D:/TC/src/output.c:559:         case ARG_FLOAT: tac_output(0, "%f", arg->value.float_value); break;
	movq	%r8, %xmm2	 ; arg_27(D)->value.float_value,
	jmp	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L132:
 ; D:/TC/src/output.c:560:         case ARG_STRING: tac_output(0, "\"%s\"", arg->value.string_value); break;
	xorl	%edx, %edx	 ;
	movq	%rsi, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:560:         case ARG_STRING: tac_output(0, "\"%s\"", arg->value.string_value); break;
	movq	(%rbx), %r8	 ; arg_27(D)->value.string_value,
	leaq	.LC76(%rip), %rdx	 ;, tmp129
	jmp	.L143	 ;
	.p2align 4,,10
	.p2align 3
.L145:
 ; D:/TC/src/output.c:547:         tac_output(0, "\"NULL\"");
	movq	%rsi, %rcx	 ; outfile,
	xorl	%edx, %edx	 ;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:575: }
	addq	$40, %rsp	 ;,
 ; D:/TC/src/output.c:547:         tac_output(0, "\"NULL\"");
	movq	%rsi, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
 ; D:/TC/src/output.c:575: }
	popq	%rbx	 ;
 ; D:/TC/src/output.c:547:         tac_output(0, "\"NULL\"");
	movl	$1, %edx	 ;,
	leaq	.LC72(%rip), %rcx	 ;, tmp109
 ; D:/TC/src/output.c:575: }
	popq	%rsi	 ;
 ; D:/TC/src/output.c:547:         tac_output(0, "\"NULL\"");
	jmp	fwrite	 ;
.L125:
 ; D:/TC/src/output.c:572:         default: tac_output(0, "unknown_ArgType: %u", arg->kind); break;
	movq	%rsi, %rcx	 ; outfile,
	xorl	%edx, %edx	 ;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:572:         default: tac_output(0, "unknown_ArgType: %u", arg->kind); break;
	movl	16(%rbx), %r8d	 ; arg_27(D)->kind,
 ; D:/TC/src/output.c:575: }
	addq	$40, %rsp	 ;,
 ; D:/TC/src/output.c:572:         default: tac_output(0, "unknown_ArgType: %u", arg->kind); break;
	movq	%rsi, %rcx	 ; outfile,
 ; D:/TC/src/output.c:575: }
	popq	%rbx	 ;
 ; D:/TC/src/output.c:572:         default: tac_output(0, "unknown_ArgType: %u", arg->kind); break;
	leaq	.LC79(%rip), %rdx	 ;, tmp142
 ; D:/TC/src/output.c:575: }
	popq	%rsi	 ;
 ; D:/TC/src/output.c:572:         default: tac_output(0, "unknown_ArgType: %u", arg->kind); break;
	jmp	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L138:
 ; D:/TC/src/output.c:569:                 tac_output(0, "%s", arg->value.subroutine->name);
	call	indention_tac	 ;
 ; D:/TC/src/output.c:569:                 tac_output(0, "%s", arg->value.subroutine->name);
	movq	(%rbx), %rax	 ;* arg, arg_27(D)->value.subroutine
	movq	8(%rax), %rcx	 ;, _22->name
	jmp	.L142	 ;
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
	.p2align 4
	.globl	output_code
	.def	output_code;	.scl	2;	.type	32;	.endef
output_code:
	pushq	%r15	 ;
	movq	%rdx, %r15	 ; tmp187, outfile
	pushq	%r14	 ;
	movq	%r8, %r14	 ; tmp188, indent
	pushq	%r13	 ;
	movq	%r9, %r13	 ; tmp189, indent_has_next
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$88, %rsp	 ;,
 ; D:/TC/src/output.c:45:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rcx), %rcx	 ; code_5(D)->members, code_5(D)->members
	call	list_copy	 ;
	movq	%rax, 72(%rsp)	 ; tmp190, %sfp
	.p2align 4,,10
	.p2align 3
.L147:
 ; D:/TC/src/output.c:47:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	movq	72(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp201, member
 ; D:/TC/src/output.c:47:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	 ; member
	je	.L171	 ;,
 ; D:/TC/src/output.c:24:     switch (code_member->type) {
	movl	8(%rbx), %eax	 ; member_9->type, _14
 ; D:/TC/src/output.c:48:         output_code_member(member, outfile, indent + 1, indent_has_next);
	leaq	1(%r14), %rdx	 ;, _2
 ; D:/TC/src/output.c:38:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movq	%r13, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%r15, %rcx	 ; outfile,
 ; D:/TC/src/output.c:24:     switch (code_member->type) {
	cmpl	$1, %eax	 ;, _14
	je	.L148	 ;,
	cmpl	$2, %eax	 ;, _14
	je	.L149	 ;,
	testl	%eax, %eax	 ; _14
	jne	.L150	 ;,
 ; D:/TC/src/output.c:26:             ast_output(0, false, "import\n");
	call	indention	 ;
 ; D:/TC/src/output.c:27:             output_import(code_member->content.import, outfile, indent + 1, indent_has_next);
	leaq	2(%r14), %rsi	 ;, _15
 ; D:/TC/src/output.c:26:             ast_output(0, false, "import\n");
	movq	%r15, %r9	 ; outfile,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC81(%rip), %rcx	 ;, tmp135
	call	fwrite	 ;
 ; D:/TC/src/output.c:27:             output_import(code_member->content.import, outfile, indent + 1, indent_has_next);
	movq	(%rbx), %rbx	 ; member_9->content.import, _16
 ; D:/TC/src/output.c:53:     ast_output(0, false, "name\n");
	movq	%r13, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; _15,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:53:     ast_output(0, false, "name\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC32(%rip), %rcx	 ;, tmp136
	call	fwrite	 ;
 ; D:/TC/src/output.c:54:     output_name(import->name, outfile, indent + 1, indent_has_next);
	movq	(%rbx), %rcx	 ; _16->name, _16->name
	movq	%r13, %r9	 ; indent_has_next,
	leaq	3(%r14), %r8	 ;,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:/TC/src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	%rsi, %rdx	 ; _15,
	movq	%r15, %rcx	 ; outfile,
	movq	%r13, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	8(%rbx), %rax	 ; _16->source, _24
 ; D:/TC/src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	leaq	.LC80(%rip), %r8	 ;, tmp175
	movq	%r15, %rcx	 ; outfile,
	leaq	.LC82(%rip), %rdx	 ;, tmp139
 ; D:/TC/src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	testq	%rax, %rax	 ; _24
 ; D:/TC/src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	cmovne	%rax, %r8	 ; _24,,
	call	fprintf	 ;
 ; D:/TC/src/output.c:57: }
	jmp	.L147	 ;
	.p2align 4,,10
	.p2align 3
.L148:
 ; D:/TC/src/output.c:30:             ast_output(0, false, "function\n");
	call	indention	 ;
 ; D:/TC/src/output.c:31:             output_function(code_member->content.function, outfile, indent + 1, indent_has_next);
	leaq	2(%r14), %rdi	 ;, _17
 ; D:/TC/src/output.c:30:             ast_output(0, false, "function\n");
	movq	%r15, %r9	 ; outfile,
	movl	$1, %edx	 ;,
	movl	$9, %r8d	 ;,
	leaq	.LC36(%rip), %rcx	 ;, tmp140
 ; D:/TC/src/output.c:61:     output_name(function->name, outfile, indent + 1, indent_has_next);
	leaq	3(%r14), %rsi	 ;, _26
 ; D:/TC/src/output.c:30:             ast_output(0, false, "function\n");
	call	fwrite	 ;
 ; D:/TC/src/output.c:31:             output_function(code_member->content.function, outfile, indent + 1, indent_has_next);
	movq	(%rbx), %rbx	 ; member_9->content.function, _18
 ; D:/TC/src/output.c:60:     ast_output(0, false, "name\n");
	movq	%r13, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _17,
	movq	%r15, %rcx	 ; outfile,
 ; D:/TC/src/output.c:31:             output_function(code_member->content.function, outfile, indent + 1, indent_has_next);
	movq	%rdi, 40(%rsp)	 ; _17, %sfp
 ; D:/TC/src/output.c:71:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	leaq	4(%r14), %r12	 ;, tmp182
 ; D:/TC/src/output.c:60:     ast_output(0, false, "name\n");
	call	indention	 ;
 ; D:/TC/src/output.c:60:     ast_output(0, false, "name\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC32(%rip), %rcx	 ;, tmp141
	call	fwrite	 ;
 ; D:/TC/src/output.c:61:     output_name(function->name, outfile, indent + 1, indent_has_next);
	movq	(%rbx), %rcx	 ; _18->name, _18->name
	movq	%r13, %r9	 ; indent_has_next,
	movq	%rsi, %r8	 ; _26,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:/TC/src/output.c:62:     ast_output(0, false, "return_type\n");
	movq	%r13, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _17,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:62:     ast_output(0, false, "return_type\n");
	movq	%r15, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rcx	 ;, tmp143
	call	fwrite	 ;
 ; D:/TC/src/output.c:63:     output_name(function->return_type, outfile, indent + 1, indent_has_next);
	movq	8(%rbx), %rcx	 ; _18->return_type, _18->return_type
	movq	%r13, %r9	 ; indent_has_next,
	movq	%rsi, %r8	 ; _26,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:/TC/src/output.c:64:     ast_output(0, false, "parameters\n");
	movq	%r13, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _17,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:64:     ast_output(0, false, "parameters\n");
	movq	%r15, %r9	 ; outfile,
	movl	$11, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC83(%rip), %rcx	 ;, tmp145
	call	fwrite	 ;
 ; D:/TC/src/output.c:65:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%rbx), %rcx	 ; _18->parameters, _18->parameters
	call	list_copy	 ;
 ; D:/TC/src/output.c:66:     list(Statement*) body = list_copy(function->body);
	movq	24(%rbx), %rcx	 ; _18->body, _18->body
 ; D:/TC/src/output.c:68:     int index = -1;
	movl	$-1, %ebx	 ;, index
 ; D:/TC/src/output.c:65:     list(Variable*) parameters = list_copy(function->parameters);
	movq	%rax, %rbp	 ; tmp191, parameters
 ; D:/TC/src/output.c:66:     list(Statement*) body = list_copy(function->body);
	call	list_copy	 ;
	movq	%rax, 48(%rsp)	 ; body, %sfp
 ; D:/TC/src/output.c:69:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	jmp	.L153	 ;
	.p2align 4,,10
	.p2align 3
.L154:
 ; D:/TC/src/output.c:70:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	%r13, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; _26,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:70:         ast_output(1, false, "parameters[%d]\n", ++index);
	addl	$1, %ebx	 ;, index
	leaq	.LC84(%rip), %rdx	 ;,
	movq	%r15, %rcx	 ; outfile,
	movl	%ebx, %r8d	 ; index,
	call	fprintf	 ;
 ; D:/TC/src/output.c:71:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	movq	%r13, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; tmp182,
	movq	%r15, %rdx	 ; outfile,
	movq	%rdi, %rcx	 ; parameter,
	call	output_variable	 ;
.L153:
 ; D:/TC/src/output.c:69:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%rbp, %rcx	 ; parameters,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp193, parameter
 ; D:/TC/src/output.c:69:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	 ; parameter
	jne	.L154	 ;,
 ; D:/TC/src/output.c:73:     ast_output(0, true, "body\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%r13, %r9	 ; indent_has_next,
	movq	%r15, %rcx	 ; outfile,
	movq	48(%rsp), %rdi	 ; %sfp, body
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:73:     ast_output(0, true, "body\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rcx	 ;, tmp150
	call	fwrite	 ;
 ; D:/TC/src/output.c:75:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L155	 ;
	.p2align 4,,10
	.p2align 3
.L156:
 ; D:/TC/src/output.c:76:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%r13, %r9	 ; indent_has_next,
	movq	%rsi, %r8	 ; _26,
	movq	%r15, %rdx	 ; outfile,
	call	output_statement	 ;
.L155:
 ; D:/TC/src/output.c:75:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp194, statement
 ; D:/TC/src/output.c:75:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L156	 ;,
	jmp	.L147	 ;
	.p2align 4,,10
	.p2align 3
.L150:
 ; D:/TC/src/output.c:38:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	call	indention	 ;
 ; D:/TC/src/output.c:38:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movl	8(%rbx), %r8d	 ; member_9->type,
	leaq	.LC90(%rip), %rdx	 ;, tmp173
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:39:             break;
	jmp	.L147	 ;
	.p2align 4,,10
	.p2align 3
.L149:
 ; D:/TC/src/output.c:34:             ast_output(0, false, "class\n");
	call	indention	 ;
 ; D:/TC/src/output.c:35:             output_class(code_member->content.class, outfile, indent + 1, indent_has_next);
	leaq	2(%r14), %rsi	 ;, _19
 ; D:/TC/src/output.c:34:             ast_output(0, false, "class\n");
	movq	%r15, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC85(%rip), %rcx	 ;, tmp151
	call	fwrite	 ;
 ; D:/TC/src/output.c:35:             output_class(code_member->content.class, outfile, indent + 1, indent_has_next);
	movq	(%rbx), %rbx	 ; member_9->content.class, _20
 ; D:/TC/src/output.c:119:     ast_output(0, false, "name\n");
	movq	%r13, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; _19,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:119:     ast_output(0, false, "name\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC32(%rip), %rcx	 ;,
	call	fwrite	 ;
 ; D:/TC/src/output.c:120:     output_name(class->name, outfile, indent + 1, indent_has_next);
	leaq	3(%r14), %rax	 ;, _38
	movq	(%rbx), %rcx	 ; _20->name, _20->name
	movq	%r13, %r9	 ; indent_has_next,
	movq	%rax, %r8	 ; _38,
	movq	%r15, %rdx	 ; outfile,
	movq	%rax, 48(%rsp)	 ; _38, %sfp
	call	output_name	 ;
 ; D:/TC/src/output.c:121:     ast_output(0, true, "members\n");
	movq	%r13, %r9	 ; indent_has_next,
	movq	%rsi, %rdx	 ; _19,
	movq	%r15, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:121:     ast_output(0, true, "members\n");
	movq	%r15, %r9	 ; outfile,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC86(%rip), %rcx	 ;, tmp154
	call	fwrite	 ;
 ; D:/TC/src/output.c:122:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rbx), %rcx	 ; _20->members, _20->members
	call	list_copy	 ;
	movq	%rax, 40(%rsp)	 ; tmp195, %sfp
	.p2align 4,,10
	.p2align 3
.L157:
 ; D:/TC/src/output.c:124:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	movq	40(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp200, member
 ; D:/TC/src/output.c:124:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	 ; member
	je	.L147	 ;,
 ; D:/TC/src/output.c:102:     switch (class_member->type) {
	movl	8(%rbx), %eax	 ; member_42->type, _43
 ; D:/TC/src/output.c:102:     switch (class_member->type) {
	testl	%eax, %eax	 ; _43
	je	.L158	 ;,
	cmpl	$1, %eax	 ;, _43
	je	.L159	 ;,
 ; D:/TC/src/output.c:112:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movq	48(%rsp), %rdx	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%r15, %rcx	 ; outfile,
	movq	%r13, %r9	 ; indent_has_next,
	call	indention	 ;
 ; D:/TC/src/output.c:112:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movl	8(%rbx), %r8d	 ; member_42->type,
	leaq	.LC89(%rip), %rdx	 ;, tmp171
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:113:             break;
	jmp	.L157	 ;
	.p2align 4,,10
	.p2align 3
.L158:
 ; D:/TC/src/output.c:104:             ast_output(0, false, "method\n");
	movq	48(%rsp), %rdx	 ; %sfp,
	movq	%r13, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%r15, %rcx	 ; outfile,
 ; D:/TC/src/output.c:105:             output_method(class_member->content.method, outfile, indent + 1, indent_has_next);
	leaq	4(%r14), %rdi	 ;, _44
 ; D:/TC/src/output.c:82:     output_name(method->name, outfile, indent + 1, indent_has_next);
	leaq	5(%r14), %rsi	 ;, _49
 ; D:/TC/src/output.c:104:             ast_output(0, false, "method\n");
	call	indention	 ;
 ; D:/TC/src/output.c:104:             ast_output(0, false, "method\n");
	movq	%r15, %r9	 ; outfile,
 ; D:/TC/src/output.c:92:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	leaq	6(%r14), %r12	 ;, tmp177
 ; D:/TC/src/output.c:104:             ast_output(0, false, "method\n");
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC87(%rip), %rcx	 ;,
	call	fwrite	 ;
 ; D:/TC/src/output.c:105:             output_method(class_member->content.method, outfile, indent + 1, indent_has_next);
	movq	(%rbx), %rbx	 ; member_42->content.method, _45
 ; D:/TC/src/output.c:81:     ast_output(0, false, "name\n");
	movq	%r13, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _44,
	movq	%r15, %rcx	 ; outfile,
 ; D:/TC/src/output.c:105:             output_method(class_member->content.method, outfile, indent + 1, indent_has_next);
	movq	%rdi, 56(%rsp)	 ; _44, %sfp
 ; D:/TC/src/output.c:81:     ast_output(0, false, "name\n");
	call	indention	 ;
 ; D:/TC/src/output.c:81:     ast_output(0, false, "name\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC32(%rip), %rcx	 ;,
	call	fwrite	 ;
 ; D:/TC/src/output.c:82:     output_name(method->name, outfile, indent + 1, indent_has_next);
	movq	(%rbx), %rcx	 ; _45->name, _45->name
	movq	%r13, %r9	 ; indent_has_next,
	movq	%rsi, %r8	 ; _49,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:/TC/src/output.c:83:     ast_output(0, false, "return_type\n");
	movq	%r13, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _44,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:83:     ast_output(0, false, "return_type\n");
	movq	%r15, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rcx	 ;, tmp159
	call	fwrite	 ;
 ; D:/TC/src/output.c:84:     output_name(method->return_type, outfile, indent + 1, indent_has_next);
	movq	8(%rbx), %rcx	 ; _45->return_type, _45->return_type
	movq	%r13, %r9	 ; indent_has_next,
	movq	%rsi, %r8	 ; _49,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:/TC/src/output.c:85:     ast_output(0, false, "parameters\n");
	movq	%r13, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _44,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:85:     ast_output(0, false, "parameters\n");
	movq	%r15, %r9	 ; outfile,
	movl	$11, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC83(%rip), %rcx	 ;, tmp161
	call	fwrite	 ;
 ; D:/TC/src/output.c:86:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%rbx), %rcx	 ; _45->parameters, _45->parameters
	call	list_copy	 ;
 ; D:/TC/src/output.c:87:     list(Statement*) body = list_copy(method->body);
	movq	24(%rbx), %rcx	 ; _45->body, _45->body
 ; D:/TC/src/output.c:89:     int index = -1;
	movl	$-1, %ebx	 ;, index
 ; D:/TC/src/output.c:86:     list(Variable*) parameters = list_copy(method->parameters);
	movq	%rax, %rbp	 ; tmp196, parameters
 ; D:/TC/src/output.c:87:     list(Statement*) body = list_copy(method->body);
	call	list_copy	 ;
	movq	%rax, 64(%rsp)	 ; body, %sfp
 ; D:/TC/src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	jmp	.L161	 ;
	.p2align 4,,10
	.p2align 3
.L162:
 ; D:/TC/src/output.c:91:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	%r13, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; _49,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:91:         ast_output(1, false, "parameters[%d]\n", ++index);
	addl	$1, %ebx	 ;, index
	leaq	.LC84(%rip), %rdx	 ;,
	movq	%r15, %rcx	 ; outfile,
	movl	%ebx, %r8d	 ; index,
	call	fprintf	 ;
 ; D:/TC/src/output.c:92:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	movq	%r13, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; tmp177,
	movq	%r15, %rdx	 ; outfile,
	movq	%rdi, %rcx	 ; parameter,
	call	output_variable	 ;
.L161:
 ; D:/TC/src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%rbp, %rcx	 ; parameters,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp198, parameter
 ; D:/TC/src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	 ; parameter
	jne	.L162	 ;,
 ; D:/TC/src/output.c:94:     ast_output(0, true, "body\n");
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	%r13, %r9	 ; indent_has_next,
	movq	%r15, %rcx	 ; outfile,
	movq	64(%rsp), %rdi	 ; %sfp, body
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:/TC/src/output.c:94:     ast_output(0, true, "body\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rcx	 ;, tmp166
	call	fwrite	 ;
 ; D:/TC/src/output.c:96:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L163	 ;
	.p2align 4,,10
	.p2align 3
.L164:
 ; D:/TC/src/output.c:97:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%r13, %r9	 ; indent_has_next,
	movq	%rsi, %r8	 ; _49,
	movq	%r15, %rdx	 ; outfile,
	call	output_statement	 ;
.L163:
 ; D:/TC/src/output.c:96:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp199, statement
 ; D:/TC/src/output.c:96:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L164	 ;,
	jmp	.L157	 ;
	.p2align 4,,10
	.p2align 3
.L159:
 ; D:/TC/src/output.c:108:             ast_output(0, false, "variable\n");
	movq	48(%rsp), %rdx	 ; %sfp,
	movq	%r13, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:108:             ast_output(0, false, "variable\n");
	movq	%r15, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC88(%rip), %rcx	 ;, tmp167
	call	fwrite	 ;
 ; D:/TC/src/output.c:109:             output_variable(class_member->content.variable, outfile, indent + 1, indent_has_next);
	movq	(%rbx), %rcx	 ; member_42->content.variable, member_42->content.variable
	movq	%r13, %r9	 ; indent_has_next,
	leaq	4(%r14), %r8	 ;,
	movq	%r15, %rdx	 ; outfile,
	call	output_variable	 ;
 ; D:/TC/src/output.c:110:             break;
	jmp	.L157	 ;
	.p2align 4,,10
	.p2align 3
.L171:
 ; D:/TC/src/output.c:50: }
	addq	$88, %rsp	 ;,
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
	.p2align 4
	.globl	output_TAC
	.def	output_TAC;	.scl	2;	.type	32;	.endef
output_TAC:
	pushq	%r15	 ;
	pushq	%r14	 ;
	movq	%rdx, %r14	 ; tmp312, outfile
 ; D:/TC/src/output.c:423:         tac_output(indent, "TAC: \"NULL\"\n");
	movq	%r8, %rdx	 ; indent,
 ; D:/TC/src/output.c:420: void output_TAC(TAC* tac, FILE* outfile, size_t indent) {
	pushq	%r13	 ;
	movq	%r8, %r13	 ; tmp313, indent
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$104, %rsp	 ;,
 ; D:/TC/src/output.c:422:     if (tac == NULL) {
	testq	%rcx, %rcx	 ; tac
 ; D:/TC/src/output.c:420: void output_TAC(TAC* tac, FILE* outfile, size_t indent) {
	movq	%rcx, 48(%rsp)	 ; tac, %sfp
 ; D:/TC/src/output.c:423:         tac_output(indent, "TAC: \"NULL\"\n");
	movq	%r14, %rcx	 ; outfile,
 ; D:/TC/src/output.c:422:     if (tac == NULL) {
	je	.L256	 ;,
 ; D:/TC/src/output.c:427:     tac_output(indent, "TAC {\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:427:     tac_output(indent, "TAC {\n");
	movl	$1, %edx	 ;,
	movq	%r14, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	leaq	.LC92(%rip), %rcx	 ;, tmp167
 ; D:/TC/src/output.c:429:         tac_output(indent + 1, "designs: []\n");
	leaq	1(%r13), %rbp	 ;, _239
 ; D:/TC/src/output.c:427:     tac_output(indent, "TAC {\n");
	call	fwrite	 ;
 ; D:/TC/src/output.c:428:     if (list_is_empty(tac->attribute_tables))
	movq	48(%rsp), %rax	 ; %sfp, tac
	movq	(%rax), %rcx	 ; tac_32(D)->attribute_tables, tac_32(D)->attribute_tables
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:429:         tac_output(indent + 1, "designs: []\n");
	movq	%rbp, %rdx	 ; _239,
	movq	%r14, %rcx	 ; outfile,
 ; D:/TC/src/output.c:428:     if (list_is_empty(tac->attribute_tables))
	testb	%al, %al	 ; tmp314
	je	.L174	 ;,
 ; D:/TC/src/output.c:429:         tac_output(indent + 1, "designs: []\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:429:         tac_output(indent + 1, "designs: []\n");
	movq	%r14, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC93(%rip), %rcx	 ;, tmp169
	call	fwrite	 ;
	leaq	.LC104(%rip), %rax	 ;, tmp291
	movq	%rax, 56(%rsp)	 ; tmp291, %sfp
.L175:
 ; D:/TC/src/output.c:437:     if (tac->entry_point == NULL)
	movq	48(%rsp), %rax	 ; %sfp, tac
 ; D:/TC/src/output.c:438:         tac_output(indent + 1, "entry_point: \"NULL\"\n");
	movq	%rbp, %rdx	 ; _239,
	movq	%r14, %rcx	 ; outfile,
 ; D:/TC/src/output.c:437:     if (tac->entry_point == NULL)
	cmpq	$0, 8(%rax)	 ;, tac_32(D)->entry_point
	je	.L257	 ;,
 ; D:/TC/src/output.c:440:         tac_output(indent + 1, "entry_point: %s\n", tac->entry_point->name);
	call	indention_tac	 ;
 ; D:/TC/src/output.c:440:         tac_output(indent + 1, "entry_point: %s\n", tac->entry_point->name);
	movq	48(%rsp), %rax	 ; %sfp, tac
	leaq	.LC107(%rip), %rdx	 ;, tmp201
	movq	%r14, %rcx	 ; outfile,
	movq	8(%rax), %rax	 ; tac_32(D)->entry_point, tac_32(D)->entry_point
	movq	8(%rax), %r8	 ; _10->name,
	call	fprintf	 ;
.L190:
 ; D:/TC/src/output.c:441:     if (list_is_empty(tac->global_vars))
	movq	48(%rsp), %rax	 ; %sfp, tac
	movq	16(%rax), %rcx	 ; tac_32(D)->global_vars, tac_32(D)->global_vars
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:442:         tac_output(indent + 1, "global: []\n");
	movq	%rbp, %rdx	 ; _239,
	movq	%r14, %rcx	 ; outfile,
 ; D:/TC/src/output.c:441:     if (list_is_empty(tac->global_vars))
	testb	%al, %al	 ; tmp318
	je	.L191	 ;,
 ; D:/TC/src/output.c:442:         tac_output(indent + 1, "global: []\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:442:         tac_output(indent + 1, "global: []\n");
	movq	%r14, %r9	 ; outfile,
	movl	$11, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC108(%rip), %rcx	 ;, tmp203
	call	fwrite	 ;
.L192:
 ; D:/TC/src/output.c:450:     if (list_is_empty(tac->subroutines))
	movq	48(%rsp), %rax	 ; %sfp, tac
	movq	24(%rax), %rcx	 ; tac_32(D)->subroutines, tac_32(D)->subroutines
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:451:         tac_output(indent + 1, "subroutines: []\n");
	movq	%rbp, %rdx	 ; _239,
	movq	%r14, %rcx	 ; outfile,
 ; D:/TC/src/output.c:450:     if (list_is_empty(tac->subroutines))
	testb	%al, %al	 ; tmp320
	je	.L195	 ;,
 ; D:/TC/src/output.c:451:         tac_output(indent + 1, "subroutines: []\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:451:         tac_output(indent + 1, "subroutines: []\n");
	movq	%r14, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC110(%rip), %rcx	 ;, tmp209
	call	fwrite	 ;
.L196:
 ; D:/TC/src/output.c:459:     tac_output(indent, "}\n");
	movq	%r13, %rdx	 ; indent,
	movq	%r14, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:459:     tac_output(indent, "}\n");
	movq	56(%rsp), %rcx	 ; %sfp,
	movq	%r14, %r9	 ; outfile,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
.L255:
 ; D:/TC/src/output.c:461: }
	addq	$104, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:/TC/src/output.c:459:     tac_output(indent, "}\n");
	jmp	fwrite	 ;
.L174:
 ; D:/TC/src/output.c:431:         tac_output(indent + 1, "designs: [\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:431:         tac_output(indent + 1, "designs: [\n");
	movq	%r14, %r9	 ; outfile,
	movl	$11, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC94(%rip), %rcx	 ;, tmp170
 ; D:/TC/src/output.c:669:         tac_output(indent, "%s ", attribute_table->name->name);
	leaq	.LC96(%rip), %r12	 ;, tmp308
 ; D:/TC/src/output.c:431:         tac_output(indent + 1, "designs: [\n");
	call	fwrite	 ;
	leaq	.LC104(%rip), %rax	 ;, tmp291
 ; D:/TC/src/output.c:692:         tac_output(indent, "%s\t", attribute->type->name);
	leaq	.LC101(%rip), %rdi	 ;, tmp309
	movq	%rax, 56(%rsp)	 ; tmp291, %sfp
	.p2align 4,,10
	.p2align 3
.L176:
 ; D:/TC/src/output.c:433:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	movq	48(%rsp), %rax	 ; %sfp, tac
	movq	(%rax), %rcx	 ; tac_32(D)->attribute_tables, tac_32(D)->attribute_tables
	call	list_pop	 ;
	movq	%rax, %rsi	 ; tmp317, attribute_table
 ; D:/TC/src/output.c:433:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	testq	%rax, %rax	 ; attribute_table
	je	.L258	 ;,
 ; D:/TC/src/output.c:434:             output_attribute_table(attribute_table, outfile, indent + 2);
	leaq	2(%r13), %r15	 ;, _5
 ; D:/TC/src/output.c:666:     if (attribute_table->name == NULL)
	cmpq	$0, 8(%rsi)	 ;, attribute_table_42->name
 ; D:/TC/src/output.c:667:         tac_output(indent, "NULL ");
	movq	%r14, %rcx	 ; outfile,
	movq	%r15, %rdx	 ; _5,
 ; D:/TC/src/output.c:666:     if (attribute_table->name == NULL)
	je	.L259	 ;,
 ; D:/TC/src/output.c:669:         tac_output(indent, "%s ", attribute_table->name->name);
	call	indention_tac	 ;
 ; D:/TC/src/output.c:669:         tac_output(indent, "%s ", attribute_table->name->name);
	movq	8(%rsi), %rax	 ; attribute_table_42->name, attribute_table_42->name
	movq	%r12, %rdx	 ; tmp308,
	movq	%r14, %rcx	 ; outfile,
	movq	8(%rax), %r8	 ; _77->name,
	call	fprintf	 ;
.L178:
 ; D:/TC/src/output.c:670:     tac_output(0, "%zu ", attribute_table->size);
	xorl	%edx, %edx	 ;
	movq	%r14, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:670:     tac_output(0, "%zu ", attribute_table->size);
	movq	16(%rsi), %r8	 ; attribute_table_42->size,
	leaq	.LC97(%rip), %rdx	 ;, tmp176
	movq	%r14, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:671:     if (list_is_empty(attribute_table->attributes))
	movq	(%rsi), %rcx	 ; attribute_table_42->attributes, attribute_table_42->attributes
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:672:         tac_output(0, "{}\n");
	xorl	%edx, %edx	 ;
	movq	%r14, %rcx	 ; outfile,
 ; D:/TC/src/output.c:671:     if (list_is_empty(attribute_table->attributes))
	testb	%al, %al	 ; tmp315
	je	.L179	 ;,
 ; D:/TC/src/output.c:672:         tac_output(0, "{}\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:672:         tac_output(0, "{}\n");
	movq	%r14, %r9	 ; outfile,
	movl	$3, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC98(%rip), %rcx	 ;, tmp178
	call	fwrite	 ;
	jmp	.L176	 ;
	.p2align 4,,10
	.p2align 3
.L179:
 ; D:/TC/src/output.c:674:         tac_output(0, "{\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:674:         tac_output(0, "{\n");
	movq	%r14, %r9	 ; outfile,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC99(%rip), %rcx	 ;, tmp179
	call	fwrite	 ;
 ; D:/TC/src/output.c:676:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	jmp	.L181	 ;
	.p2align 4,,10
	.p2align 3
.L182:
 ; D:/TC/src/output.c:692:         tac_output(indent, "%s\t", attribute->type->name);
	call	indention_tac	 ;
 ; D:/TC/src/output.c:692:         tac_output(indent, "%s\t", attribute->type->name);
	movq	8(%rbx), %rax	 ; attribute_83->type, attribute_83->type
	movq	%rdi, %rdx	 ; tmp309,
	movq	%r14, %rcx	 ; outfile,
	movq	8(%rax), %r8	 ; _86->name,
	call	fprintf	 ;
 ; D:/TC/src/output.c:693:     if (attribute->var == NULL)
	movq	(%rbx), %rax	 ; attribute_83->var, _88
 ; D:/TC/src/output.c:694:         tac_output(0, "NULL ");
	xorl	%edx, %edx	 ;
	movq	%r14, %rcx	 ; outfile,
 ; D:/TC/src/output.c:693:     if (attribute->var == NULL)
	testq	%rax, %rax	 ; _88
	je	.L260	 ;,
.L184:
 ; D:/TC/src/output.c:695:     else if (attribute->var->original_name)
	cmpq	$0, (%rax)	 ;, _88->original_name
	je	.L186	 ;,
 ; D:/TC/src/output.c:696:         tac_output(0, "%s(%s) ", attribute->var->name, attribute->var->original_name->name);
	call	indention_tac	 ;
 ; D:/TC/src/output.c:696:         tac_output(0, "%s(%s) ", attribute->var->name, attribute->var->original_name->name);
	movq	(%rbx), %rax	 ; attribute_83->var, _90
	movq	%r14, %rcx	 ; outfile,
	movq	(%rax), %rdx	 ; _90->original_name, _90->original_name
	movq	8(%rax), %r8	 ; _90->name,
	movq	8(%rdx), %r9	 ; _91->name,
	leaq	.LC102(%rip), %rdx	 ;, tmp188
	call	fprintf	 ;
.L185:
 ; D:/TC/src/output.c:699:     tac_output(0, "%zu\n", attribute->offset);
	xorl	%edx, %edx	 ;
	movq	%r14, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:699:     tac_output(0, "%zu\n", attribute->offset);
	movq	16(%rbx), %r8	 ; attribute_83->offset,
	leaq	.LC103(%rip), %rdx	 ;, tmp193
	movq	%r14, %rcx	 ; outfile,
	call	fprintf	 ;
.L181:
 ; D:/TC/src/output.c:676:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	movq	(%rsi), %rcx	 ; attribute_table_42->attributes, attribute_table_42->attributes
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp316, attribute
 ; D:/TC/src/output.c:676:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	testq	%rax, %rax	 ; attribute
	je	.L261	 ;,
 ; D:/TC/src/output.c:689:     if (attribute->type == NULL)
	cmpq	$0, 8(%rbx)	 ;, attribute_83->type
 ; D:/TC/src/output.c:677:             output_attribute(attribute, outfile, indent + 1);
	leaq	3(%r13), %rdx	 ;, _82
 ; D:/TC/src/output.c:690:         tac_output(indent, "NULL\t");
	movq	%r14, %rcx	 ; outfile,
 ; D:/TC/src/output.c:689:     if (attribute->type == NULL)
	jne	.L182	 ;,
 ; D:/TC/src/output.c:690:         tac_output(indent, "NULL\t");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:690:         tac_output(indent, "NULL\t");
	movl	$1, %edx	 ;,
	movq	%r14, %r9	 ; outfile,
	leaq	.LC100(%rip), %rcx	 ;,
	movl	$5, %r8d	 ;,
	call	fwrite	 ;
 ; D:/TC/src/output.c:693:     if (attribute->var == NULL)
	movq	(%rbx), %rax	 ; attribute_83->var, _88
 ; D:/TC/src/output.c:694:         tac_output(0, "NULL ");
	xorl	%edx, %edx	 ;
	movq	%r14, %rcx	 ; outfile,
 ; D:/TC/src/output.c:693:     if (attribute->var == NULL)
	testq	%rax, %rax	 ; _88
	jne	.L184	 ;,
.L260:
 ; D:/TC/src/output.c:694:         tac_output(0, "NULL ");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:694:         tac_output(0, "NULL ");
	movq	%r14, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC95(%rip), %rcx	 ;, tmp184
	call	fwrite	 ;
	jmp	.L185	 ;
	.p2align 4,,10
	.p2align 3
.L186:
 ; D:/TC/src/output.c:698:         tac_output(0, "%s ", attribute->var->name);
	call	indention_tac	 ;
 ; D:/TC/src/output.c:698:         tac_output(0, "%s ", attribute->var->name);
	movq	(%rbx), %rax	 ; attribute_83->var, attribute_83->var
	movq	%r12, %rdx	 ; tmp308,
	movq	%r14, %rcx	 ; outfile,
	movq	8(%rax), %r8	 ; _94->name,
	call	fprintf	 ;
	jmp	.L185	 ;
	.p2align 4,,10
	.p2align 3
.L261:
 ; D:/TC/src/output.c:678:         tac_output(indent, "}\n");
	movq	%r15, %rdx	 ; _5,
	movq	%r14, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:678:         tac_output(indent, "}\n");
	movq	56(%rsp), %rcx	 ; %sfp,
	movq	%r14, %r9	 ; outfile,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	call	fwrite	 ;
	jmp	.L176	 ;
	.p2align 4,,10
	.p2align 3
.L259:
 ; D:/TC/src/output.c:667:         tac_output(indent, "NULL ");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:667:         tac_output(indent, "NULL ");
	movq	%r14, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC95(%rip), %rcx	 ;, tmp171
	call	fwrite	 ;
	jmp	.L178	 ;
.L258:
 ; D:/TC/src/output.c:435:         tac_output(indent + 1, "]\n");
	movq	%rbp, %rdx	 ; _239,
	movq	%r14, %rcx	 ; outfile,
 ; D:/TC/src/output.c:435:         tac_output(indent + 1, "]\n");
	leaq	.LC105(%rip), %r12	 ;, tmp292
 ; D:/TC/src/output.c:435:         tac_output(indent + 1, "]\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:435:         tac_output(indent + 1, "]\n");
	movq	%r14, %r9	 ; outfile,
	movl	$1, %edx	 ;,
	movq	%r12, %rcx	 ; tmp292,
	movl	$2, %r8d	 ;,
	call	fwrite	 ;
	jmp	.L175	 ;
.L195:
 ; D:/TC/src/output.c:453:         tac_output(indent + 1, "subroutines: [\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:453:         tac_output(indent + 1, "subroutines: [\n");
	movq	%r14, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC111(%rip), %rcx	 ;, tmp210
	leaq	.LC105(%rip), %r12	 ;, tmp292
	call	fwrite	 ;
 ; D:/TC/src/output.c:583:     switch (instruction->type) {
	leaq	.L220(%rip), %r15	 ;, tmp301
	movq	%rbp, 88(%rsp)	 ; _239, %sfp
	movq	%r12, 64(%rsp)	 ; tmp292, %sfp
 ; D:/TC/src/output.c:455:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	jmp	.L197	 ;
	.p2align 4,,10
	.p2align 3
.L265:
 ; D:/TC/src/output.c:478:         tac_output(indent + 1, "parameters: []\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:478:         tac_output(indent + 1, "parameters: []\n");
	movq	%r14, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC116(%rip), %rcx	 ;, tmp220
	call	fwrite	 ;
.L203:
 ; D:/TC/src/output.c:486:     if (list_is_empty(subroutine->local_vars))
	movq	24(%rsi), %rcx	 ; subroutine_66->local_vars, subroutine_66->local_vars
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:487:         tac_output(indent + 1, "local: []\n");
	movq	%rdi, %rdx	 ; _238,
	movq	%r14, %rcx	 ; outfile,
 ; D:/TC/src/output.c:486:     if (list_is_empty(subroutine->local_vars))
	testb	%al, %al	 ; tmp323
	je	.L206	 ;,
 ; D:/TC/src/output.c:487:         tac_output(indent + 1, "local: []\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:487:         tac_output(indent + 1, "local: []\n");
	movq	%r14, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC118(%rip), %rcx	 ;, tmp226
	call	fwrite	 ;
.L207:
 ; D:/TC/src/output.c:495:     if (list_is_empty(subroutine->blocks))
	movq	32(%rsi), %rcx	 ; subroutine_66->blocks, subroutine_66->blocks
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:496:         tac_output(indent + 1, "instructions: []\n");
	movq	%rdi, %rdx	 ; _238,
	movq	%r14, %rcx	 ; outfile,
 ; D:/TC/src/output.c:495:     if (list_is_empty(subroutine->blocks))
	testb	%al, %al	 ; tmp325
	je	.L210	 ;,
 ; D:/TC/src/output.c:496:         tac_output(indent + 1, "instructions: []\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:496:         tac_output(indent + 1, "instructions: []\n");
	movq	%r14, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC120(%rip), %rcx	 ;, tmp232
	call	fwrite	 ;
.L211:
 ; D:/TC/src/output.c:504:     tac_output(indent, "}\n");
	movq	%rbp, %rdx	 ; _22,
	movq	%r14, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:504:     tac_output(indent, "}\n");
	movq	56(%rsp), %rcx	 ; %sfp,
	movq	%r14, %r9	 ; outfile,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	call	fwrite	 ;
.L197:
 ; D:/TC/src/output.c:455:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	movq	48(%rsp), %rax	 ; %sfp, tac
	movq	24(%rax), %rcx	 ; tac_32(D)->subroutines, tac_32(D)->subroutines
	call	list_pop	 ;
	movq	%rax, %rsi	 ; tmp329, subroutine
 ; D:/TC/src/output.c:455:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	testq	%rax, %rax	 ; subroutine
	je	.L262	 ;,
 ; D:/TC/src/output.c:456:             output_subroutine(subroutine, outfile, indent + 2);
	leaq	2(%r13), %rbp	 ;, _22
 ; D:/TC/src/output.c:469:     if (subroutine->name == NULL)
	cmpq	$0, (%rsi)	 ;, subroutine_66->name
 ; D:/TC/src/output.c:470:         tac_output(indent, "NULL {\n");
	movq	%r14, %rcx	 ; outfile,
	movq	%rbp, %rdx	 ; _22,
 ; D:/TC/src/output.c:469:     if (subroutine->name == NULL)
	je	.L263	 ;,
 ; D:/TC/src/output.c:472:         tac_output(indent, "%s {\n", subroutine->name->name);
	call	indention_tac	 ;
 ; D:/TC/src/output.c:472:         tac_output(indent, "%s {\n", subroutine->name->name);
	movq	(%rsi), %rax	 ; subroutine_66->name, subroutine_66->name
	leaq	.LC113(%rip), %rdx	 ;, tmp214
	movq	%r14, %rcx	 ; outfile,
	movq	8(%rax), %r8	 ; _98->name,
	call	fprintf	 ;
.L199:
 ; D:/TC/src/output.c:677:             output_attribute(attribute, outfile, indent + 1);
	leaq	3(%r13), %rdi	 ;, _238
 ; D:/TC/src/output.c:473:     if (subroutine->return_type == NULL)
	cmpq	$0, 8(%rsi)	 ;, subroutine_66->return_type
 ; D:/TC/src/output.c:474:         tac_output(indent + 1, "return_type: \"NULL\"\n");
	movq	%r14, %rcx	 ; outfile,
	movq	%rdi, %rdx	 ; _238,
 ; D:/TC/src/output.c:473:     if (subroutine->return_type == NULL)
	je	.L264	 ;,
 ; D:/TC/src/output.c:476:         tac_output(indent + 1, "return_type: %s\n", subroutine->return_type->name);
	call	indention_tac	 ;
 ; D:/TC/src/output.c:476:         tac_output(indent + 1, "return_type: %s\n", subroutine->return_type->name);
	movq	8(%rsi), %rax	 ; subroutine_66->return_type, subroutine_66->return_type
	leaq	.LC115(%rip), %rdx	 ;, tmp218
	movq	%r14, %rcx	 ; outfile,
	movq	8(%rax), %r8	 ; _103->name,
	call	fprintf	 ;
.L201:
 ; D:/TC/src/output.c:477:     if (list_is_empty(subroutine->parameters))
	movq	16(%rsi), %rcx	 ; subroutine_66->parameters, subroutine_66->parameters
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:478:         tac_output(indent + 1, "parameters: []\n");
	movq	%rdi, %rdx	 ; _238,
	movq	%r14, %rcx	 ; outfile,
 ; D:/TC/src/output.c:477:     if (list_is_empty(subroutine->parameters))
	testb	%al, %al	 ; tmp321
	jne	.L265	 ;,
 ; D:/TC/src/output.c:480:         tac_output(indent + 1, "parameters: [\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:480:         tac_output(indent + 1, "parameters: [\n");
	movq	%r14, %r9	 ; outfile,
 ; D:/TC/src/output.c:483:             output_var(parameter, outfile, indent + 2);
	leaq	4(%r13), %rbx	 ;, tmp300
 ; D:/TC/src/output.c:480:         tac_output(indent + 1, "parameters: [\n");
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC117(%rip), %rcx	 ;, tmp221
	call	fwrite	 ;
 ; D:/TC/src/output.c:482:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	jmp	.L204	 ;
	.p2align 4,,10
	.p2align 3
.L205:
 ; D:/TC/src/output.c:483:             output_var(parameter, outfile, indent + 2);
	movq	%rbx, %r8	 ; tmp300,
	movq	%r14, %rdx	 ; outfile,
	call	output_var	 ;
.L204:
 ; D:/TC/src/output.c:482:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	movq	16(%rsi), %rcx	 ; subroutine_66->parameters, subroutine_66->parameters
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp322, parameter
 ; D:/TC/src/output.c:482:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	jne	.L205	 ;,
 ; D:/TC/src/output.c:484:         tac_output(indent + 1, "]\n");
	movq	%rdi, %rdx	 ; _238,
	movq	%r14, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:484:         tac_output(indent + 1, "]\n");
	movq	64(%rsp), %rcx	 ; %sfp,
	movq	%r14, %r9	 ; outfile,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	call	fwrite	 ;
	jmp	.L203	 ;
	.p2align 4,,10
	.p2align 3
.L210:
 ; D:/TC/src/output.c:498:         tac_output(indent + 1, "instructions: [\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:498:         tac_output(indent + 1, "instructions: [\n");
	movq	%r14, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC121(%rip), %rcx	 ;, tmp233
	call	fwrite	 ;
	movq	%rbp, 72(%rsp)	 ; _22, %sfp
	movq	%rsi, 40(%rsp)	 ; subroutine, %sfp
	movq	%rdi, 80(%rsp)	 ; _238, %sfp
	.p2align 4,,10
	.p2align 3
.L212:
 ; D:/TC/src/output.c:500:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	movq	40(%rsp), %rax	 ; %sfp, subroutine
	movq	32(%rax), %rcx	 ; subroutine_66->blocks, subroutine_66->blocks
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp328, block
 ; D:/TC/src/output.c:500:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	testq	%rax, %rax	 ; block
	je	.L266	 ;,
 ; D:/TC/src/output.c:501:             output_block(block, outfile, indent + 2);
	leaq	4(%r13), %r12	 ;, _123
 ; D:/TC/src/output.c:529:     if (block->label == NULL)
	cmpq	$0, (%rbx)	 ;, block_124->label
 ; D:/TC/src/output.c:530:         tac_output(indent, "NULL ");
	movq	%r14, %rcx	 ; outfile,
	movq	%r12, %rdx	 ; _123,
 ; D:/TC/src/output.c:529:     if (block->label == NULL)
	je	.L267	 ;,
 ; D:/TC/src/output.c:532:         tac_output(indent, "%s ", block->label->name);
	call	indention_tac	 ;
 ; D:/TC/src/output.c:532:         tac_output(indent, "%s ", block->label->name);
	movq	(%rbx), %rax	 ; block_124->label, block_124->label
	leaq	.LC96(%rip), %rdx	 ;,
	movq	%r14, %rcx	 ; outfile,
	movq	8(%rax), %r8	 ; _127->name,
	call	fprintf	 ;
.L214:
 ; D:/TC/src/output.c:533:     if (list_is_empty(block->instructions))
	movq	8(%rbx), %rcx	 ; block_124->instructions, block_124->instructions
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:534:         tac_output(0, "{}\n");
	xorl	%edx, %edx	 ;
	movq	%r14, %rcx	 ; outfile,
 ; D:/TC/src/output.c:533:     if (list_is_empty(block->instructions))
	testb	%al, %al	 ; tmp326
	je	.L215	 ;,
 ; D:/TC/src/output.c:534:         tac_output(0, "{}\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:534:         tac_output(0, "{}\n");
	movq	%r14, %r9	 ; outfile,
	movl	$3, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC98(%rip), %rcx	 ;, tmp239
	call	fwrite	 ;
	jmp	.L212	 ;
	.p2align 4,,10
	.p2align 3
.L215:
 ; D:/TC/src/output.c:536:         tac_output(0, "{\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:536:         tac_output(0, "{\n");
	movq	%r14, %r9	 ; outfile,
 ; D:/TC/src/output.c:539:             output_instruction(instruction, outfile, indent + 1);
	leaq	5(%r13), %rdi	 ;, _131
 ; D:/TC/src/output.c:536:         tac_output(0, "{\n");
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC99(%rip), %rcx	 ;, tmp240
	movl	$1, %ebp	 ;, tmp295
	call	fwrite	 ;
	.p2align 4,,10
	.p2align 3
.L217:
 ; D:/TC/src/output.c:538:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	movq	8(%rbx), %rcx	 ; block_124->instructions, block_124->instructions
	call	list_pop	 ;
	movq	%rax, %rsi	 ; tmp327, instruction
 ; D:/TC/src/output.c:538:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	testq	%rax, %rax	 ; instruction
	je	.L268	 ;,
 ; D:/TC/src/output.c:583:     switch (instruction->type) {
	cmpl	$25, 24(%rsi)	 ;, instruction_132->type
	ja	.L218	 ;,
	movl	24(%rsi), %eax	 ; instruction_132->type, instruction_132->type
 ; D:/TC/src/output.c:609:         case INST_NONE: tac_output(indent, "INST_NONE\n"); return;
	movq	%rdi, %rdx	 ; _131,
	movq	%r14, %rcx	 ; outfile,
 ; D:/TC/src/output.c:583:     switch (instruction->type) {
	movslq	(%r15,%rax,4), %rax	 ;, tmp244
	addq	%r15, %rax	 ; tmp301, tmp245
	jmp	*%rax	 ; tmp245
	.section .rdata,"dr"
	.align 4
.L220:
	.long	.L245-.L220
	.long	.L244-.L220
	.long	.L243-.L220
	.long	.L242-.L220
	.long	.L241-.L220
	.long	.L240-.L220
	.long	.L239-.L220
	.long	.L238-.L220
	.long	.L237-.L220
	.long	.L236-.L220
	.long	.L235-.L220
	.long	.L234-.L220
	.long	.L233-.L220
	.long	.L232-.L220
	.long	.L231-.L220
	.long	.L230-.L220
	.long	.L229-.L220
	.long	.L228-.L220
	.long	.L227-.L220
	.long	.L226-.L220
	.long	.L225-.L220
	.long	.L224-.L220
	.long	.L223-.L220
	.long	.L222-.L220
	.long	.L221-.L220
	.long	.L219-.L220
	.text
	.p2align 4,,10
	.p2align 3
.L221:
 ; D:/TC/src/output.c:608:         case INST_STORE: tac_output(indent, "store\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:608:         case INST_STORE: tac_output(indent, "store\t"); break;
	movq	%r14, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC146(%rip), %rcx	 ;, tmp271
	call	fwrite	 ;
	.p2align 4,,10
	.p2align 3
.L246:
 ; D:/TC/src/output.c:615:     output_arg(instruction->arg1, outfile);
	movq	(%rsi), %rcx	 ; instruction_132->arg1, instruction_132->arg1
	movq	%r14, %rdx	 ; outfile,
	call	output_arg	 ;
 ; D:/TC/src/output.c:616:     switch (instruction->type) {
	movl	24(%rsi), %ecx	 ; instruction_132->type, _137
 ; D:/TC/src/output.c:616:     switch (instruction->type) {
	cmpl	$24, %ecx	 ;, _137
	ja	.L217	 ;,
	movq	%rbp, %rax	 ; tmp295, _4
	salq	%cl, %rax	 ; _137, _4
	testl	$4825087, %eax	 ;, _4
	jne	.L248	 ;,
	testl	$25583616, %eax	 ;, _4
	jne	.L249	 ;,
	testl	$3145728, %eax	 ;, _4
	je	.L217	 ;,
.L250:
 ; D:/TC/src/output.c:656:     tac_output(0, "\n");
	xorl	%edx, %edx	 ;
	movq	%r14, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:656:     tac_output(0, "\n");
	movq	%r14, %rdx	 ; outfile,
	movl	$10, %ecx	 ;,
	call	fputc	 ;
	jmp	.L217	 ;
	.p2align 4,,10
	.p2align 3
.L222:
 ; D:/TC/src/output.c:607:         case INST_LOAD: tac_output(indent, "load\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:607:         case INST_LOAD: tac_output(indent, "load\t"); break;
	movq	%r14, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC145(%rip), %rcx	 ;, tmp270
	call	fwrite	 ;
 ; D:/TC/src/output.c:607:         case INST_LOAD: tac_output(indent, "load\t"); break;
	jmp	.L246	 ;
	.p2align 4,,10
	.p2align 3
.L223:
 ; D:/TC/src/output.c:606:         case INST_CALL: tac_output(indent, "call\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:606:         case INST_CALL: tac_output(indent, "call\t"); break;
	movq	%r14, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC144(%rip), %rcx	 ;, tmp269
	call	fwrite	 ;
 ; D:/TC/src/output.c:606:         case INST_CALL: tac_output(indent, "call\t"); break;
	jmp	.L246	 ;
	.p2align 4,,10
	.p2align 3
.L224:
 ; D:/TC/src/output.c:605:         case INST_RET: tac_output(indent, "ret\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:605:         case INST_RET: tac_output(indent, "ret\t"); break;
	movq	%r14, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC143(%rip), %rcx	 ;, tmp268
	call	fwrite	 ;
 ; D:/TC/src/output.c:605:         case INST_RET: tac_output(indent, "ret\t"); break;
	jmp	.L246	 ;
	.p2align 4,,10
	.p2align 3
.L225:
 ; D:/TC/src/output.c:604:         case INST_JMP: tac_output(indent, "jmp\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:604:         case INST_JMP: tac_output(indent, "jmp\t"); break;
	movq	%r14, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC142(%rip), %rcx	 ;, tmp267
	call	fwrite	 ;
 ; D:/TC/src/output.c:604:         case INST_JMP: tac_output(indent, "jmp\t"); break;
	jmp	.L246	 ;
	.p2align 4,,10
	.p2align 3
.L226:
 ; D:/TC/src/output.c:603:         case INST_JMP_C: tac_output(indent, "jmp_c\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:603:         case INST_JMP_C: tac_output(indent, "jmp_c\t"); break;
	movq	%r14, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC141(%rip), %rcx	 ;, tmp266
	call	fwrite	 ;
 ; D:/TC/src/output.c:603:         case INST_JMP_C: tac_output(indent, "jmp_c\t"); break;
	jmp	.L246	 ;
	.p2align 4,,10
	.p2align 3
.L227:
 ; D:/TC/src/output.c:602:         case INST_ALLOC: tac_output(indent, "alloc\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:602:         case INST_ALLOC: tac_output(indent, "alloc\t"); break;
	movq	%r14, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC140(%rip), %rcx	 ;, tmp265
	call	fwrite	 ;
 ; D:/TC/src/output.c:602:         case INST_ALLOC: tac_output(indent, "alloc\t"); break;
	jmp	.L246	 ;
	.p2align 4,,10
	.p2align 3
.L228:
 ; D:/TC/src/output.c:601:         case INST_PARAM: tac_output(indent, "param\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:601:         case INST_PARAM: tac_output(indent, "param\t"); break;
	movq	%r14, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC139(%rip), %rcx	 ;, tmp264
	call	fwrite	 ;
 ; D:/TC/src/output.c:601:         case INST_PARAM: tac_output(indent, "param\t"); break;
	jmp	.L246	 ;
	.p2align 4,,10
	.p2align 3
.L229:
 ; D:/TC/src/output.c:600:         case INST_GET_ELEM: tac_output(indent, "get_elem\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:600:         case INST_GET_ELEM: tac_output(indent, "get_elem\t"); break;
	movq	%r14, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC138(%rip), %rcx	 ;, tmp263
	call	fwrite	 ;
 ; D:/TC/src/output.c:600:         case INST_GET_ELEM: tac_output(indent, "get_elem\t"); break;
	jmp	.L246	 ;
	.p2align 4,,10
	.p2align 3
.L230:
 ; D:/TC/src/output.c:599:         case INST_GET_ATTR: tac_output(indent, "get_attr\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:599:         case INST_GET_ATTR: tac_output(indent, "get_attr\t"); break;
	movq	%r14, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC137(%rip), %rcx	 ;, tmp262
	call	fwrite	 ;
 ; D:/TC/src/output.c:599:         case INST_GET_ATTR: tac_output(indent, "get_attr\t"); break;
	jmp	.L246	 ;
	.p2align 4,,10
	.p2align 3
.L231:
 ; D:/TC/src/output.c:598:         case INST_ASSIGN: tac_output(indent, "assign\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:598:         case INST_ASSIGN: tac_output(indent, "assign\t"); break;
	movq	%r14, %r9	 ; outfile,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC136(%rip), %rcx	 ;, tmp261
	call	fwrite	 ;
 ; D:/TC/src/output.c:598:         case INST_ASSIGN: tac_output(indent, "assign\t"); break;
	jmp	.L246	 ;
	.p2align 4,,10
	.p2align 3
.L232:
 ; D:/TC/src/output.c:597:         case INST_NOT: tac_output(indent, "not\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:597:         case INST_NOT: tac_output(indent, "not\t"); break;
	movq	%r14, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC135(%rip), %rcx	 ;, tmp260
	call	fwrite	 ;
 ; D:/TC/src/output.c:597:         case INST_NOT: tac_output(indent, "not\t"); break;
	jmp	.L246	 ;
	.p2align 4,,10
	.p2align 3
.L233:
 ; D:/TC/src/output.c:596:         case INST_OR: tac_output(indent, "or \t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:596:         case INST_OR: tac_output(indent, "or \t"); break;
	movq	%r14, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC134(%rip), %rcx	 ;, tmp259
	call	fwrite	 ;
 ; D:/TC/src/output.c:596:         case INST_OR: tac_output(indent, "or \t"); break;
	jmp	.L246	 ;
	.p2align 4,,10
	.p2align 3
.L234:
 ; D:/TC/src/output.c:595:         case INST_AND: tac_output(indent, "and\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:595:         case INST_AND: tac_output(indent, "and\t"); break;
	movq	%r14, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC133(%rip), %rcx	 ;, tmp258
	call	fwrite	 ;
 ; D:/TC/src/output.c:595:         case INST_AND: tac_output(indent, "and\t"); break;
	jmp	.L246	 ;
	.p2align 4,,10
	.p2align 3
.L235:
 ; D:/TC/src/output.c:594:         case INST_GE: tac_output(indent, "ge \t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:594:         case INST_GE: tac_output(indent, "ge \t"); break;
	movq	%r14, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC132(%rip), %rcx	 ;, tmp257
	call	fwrite	 ;
 ; D:/TC/src/output.c:594:         case INST_GE: tac_output(indent, "ge \t"); break;
	jmp	.L246	 ;
	.p2align 4,,10
	.p2align 3
.L236:
 ; D:/TC/src/output.c:593:         case INST_LE: tac_output(indent, "le \t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:593:         case INST_LE: tac_output(indent, "le \t"); break;
	movq	%r14, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC131(%rip), %rcx	 ;, tmp256
	call	fwrite	 ;
 ; D:/TC/src/output.c:593:         case INST_LE: tac_output(indent, "le \t"); break;
	jmp	.L246	 ;
	.p2align 4,,10
	.p2align 3
.L237:
 ; D:/TC/src/output.c:592:         case INST_GT: tac_output(indent, "gt \t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:592:         case INST_GT: tac_output(indent, "gt \t"); break;
	movq	%r14, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC130(%rip), %rcx	 ;, tmp255
	call	fwrite	 ;
 ; D:/TC/src/output.c:592:         case INST_GT: tac_output(indent, "gt \t"); break;
	jmp	.L246	 ;
	.p2align 4,,10
	.p2align 3
.L238:
 ; D:/TC/src/output.c:591:         case INST_LT: tac_output(indent, "lt \t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:591:         case INST_LT: tac_output(indent, "lt \t"); break;
	movq	%r14, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC129(%rip), %rcx	 ;, tmp254
	call	fwrite	 ;
 ; D:/TC/src/output.c:591:         case INST_LT: tac_output(indent, "lt \t"); break;
	jmp	.L246	 ;
	.p2align 4,,10
	.p2align 3
.L239:
 ; D:/TC/src/output.c:590:         case INST_NE: tac_output(indent, "ne \t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:590:         case INST_NE: tac_output(indent, "ne \t"); break;
	movq	%r14, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC128(%rip), %rcx	 ;, tmp253
	call	fwrite	 ;
 ; D:/TC/src/output.c:590:         case INST_NE: tac_output(indent, "ne \t"); break;
	jmp	.L246	 ;
	.p2align 4,,10
	.p2align 3
.L240:
 ; D:/TC/src/output.c:589:         case INST_EQ: tac_output(indent, "eq \t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:589:         case INST_EQ: tac_output(indent, "eq \t"); break;
	movq	%r14, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC127(%rip), %rcx	 ;, tmp252
	call	fwrite	 ;
 ; D:/TC/src/output.c:589:         case INST_EQ: tac_output(indent, "eq \t"); break;
	jmp	.L246	 ;
	.p2align 4,,10
	.p2align 3
.L241:
 ; D:/TC/src/output.c:588:         case INST_MOD: tac_output(indent, "mod\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:588:         case INST_MOD: tac_output(indent, "mod\t"); break;
	movq	%r14, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC126(%rip), %rcx	 ;, tmp251
	call	fwrite	 ;
 ; D:/TC/src/output.c:588:         case INST_MOD: tac_output(indent, "mod\t"); break;
	jmp	.L246	 ;
	.p2align 4,,10
	.p2align 3
.L242:
 ; D:/TC/src/output.c:587:         case INST_DIV: tac_output(indent, "div\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:587:         case INST_DIV: tac_output(indent, "div\t"); break;
	movq	%r14, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC125(%rip), %rcx	 ;, tmp250
	call	fwrite	 ;
 ; D:/TC/src/output.c:587:         case INST_DIV: tac_output(indent, "div\t"); break;
	jmp	.L246	 ;
	.p2align 4,,10
	.p2align 3
.L243:
 ; D:/TC/src/output.c:586:         case INST_MUL: tac_output(indent, "mul\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:586:         case INST_MUL: tac_output(indent, "mul\t"); break;
	movq	%r14, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC124(%rip), %rcx	 ;, tmp249
	call	fwrite	 ;
 ; D:/TC/src/output.c:586:         case INST_MUL: tac_output(indent, "mul\t"); break;
	jmp	.L246	 ;
	.p2align 4,,10
	.p2align 3
.L244:
 ; D:/TC/src/output.c:585:         case INST_SUB: tac_output(indent, "sub\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:585:         case INST_SUB: tac_output(indent, "sub\t"); break;
	movq	%r14, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC123(%rip), %rcx	 ;, tmp248
	call	fwrite	 ;
 ; D:/TC/src/output.c:585:         case INST_SUB: tac_output(indent, "sub\t"); break;
	jmp	.L246	 ;
	.p2align 4,,10
	.p2align 3
.L245:
 ; D:/TC/src/output.c:584:         case INST_ADD: tac_output(indent, "add\t"); break;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:584:         case INST_ADD: tac_output(indent, "add\t"); break;
	movq	%r14, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC122(%rip), %rcx	 ;, tmp247
	call	fwrite	 ;
 ; D:/TC/src/output.c:584:         case INST_ADD: tac_output(indent, "add\t"); break;
	jmp	.L246	 ;
	.p2align 4,,10
	.p2align 3
.L219:
 ; D:/TC/src/output.c:609:         case INST_NONE: tac_output(indent, "INST_NONE\n"); return;
	call	indention_tac	 ;
 ; D:/TC/src/output.c:609:         case INST_NONE: tac_output(indent, "INST_NONE\n"); return;
	movq	%r14, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC147(%rip), %rcx	 ;, tmp272
	call	fwrite	 ;
 ; D:/TC/src/output.c:609:         case INST_NONE: tac_output(indent, "INST_NONE\n"); return;
	jmp	.L217	 ;
	.p2align 4,,10
	.p2align 3
.L249:
 ; D:/TC/src/output.c:645:             tac_output(0, " ");
	xorl	%edx, %edx	 ;
	movq	%r14, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:645:             tac_output(0, " ");
	movq	%r14, %rdx	 ; outfile,
	movl	$32, %ecx	 ;,
	call	fputc	 ;
 ; D:/TC/src/output.c:646:             output_arg(instruction->arg2, outfile);
	movq	8(%rsi), %rcx	 ; instruction_132->arg2, instruction_132->arg2
	movq	%r14, %rdx	 ; outfile,
	call	output_arg	 ;
 ; D:/TC/src/output.c:647:             break;
	jmp	.L250	 ;
	.p2align 4,,10
	.p2align 3
.L248:
 ; D:/TC/src/output.c:634:             tac_output(0, " ");
	xorl	%edx, %edx	 ;
	movq	%r14, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:634:             tac_output(0, " ");
	movq	%r14, %rdx	 ; outfile,
	movl	$32, %ecx	 ;,
	call	fputc	 ;
 ; D:/TC/src/output.c:635:             output_arg(instruction->arg2, outfile);
	movq	8(%rsi), %rcx	 ; instruction_132->arg2, instruction_132->arg2
	movq	%r14, %rdx	 ; outfile,
	call	output_arg	 ;
 ; D:/TC/src/output.c:636:             tac_output(0, " ");
	xorl	%edx, %edx	 ;
	movq	%r14, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:636:             tac_output(0, " ");
	movq	%r14, %rdx	 ; outfile,
	movl	$32, %ecx	 ;,
	call	fputc	 ;
 ; D:/TC/src/output.c:637:             output_arg(instruction->arg3, outfile);
	movq	16(%rsi), %rcx	 ; instruction_132->arg3, instruction_132->arg3
	movq	%r14, %rdx	 ; outfile,
	call	output_arg	 ;
 ; D:/TC/src/output.c:638:             break;
	jmp	.L250	 ;
	.p2align 4,,10
	.p2align 3
.L268:
 ; D:/TC/src/output.c:540:         tac_output(indent, "}\n");
	movq	%r12, %rdx	 ; _123,
	movq	%r14, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:540:         tac_output(indent, "}\n");
	movq	56(%rsp), %rcx	 ; %sfp,
	movq	%r14, %r9	 ; outfile,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	call	fwrite	 ;
	jmp	.L212	 ;
	.p2align 4,,10
	.p2align 3
.L267:
 ; D:/TC/src/output.c:530:         tac_output(indent, "NULL ");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:530:         tac_output(indent, "NULL ");
	movq	%r14, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC95(%rip), %rcx	 ;, tmp234
	call	fwrite	 ;
	jmp	.L214	 ;
	.p2align 4,,10
	.p2align 3
.L266:
 ; D:/TC/src/output.c:502:         tac_output(indent + 1, "]\n");
	movq	80(%rsp), %rdx	 ; %sfp,
	movq	%r14, %rcx	 ; outfile,
	movq	72(%rsp), %rbp	 ; %sfp, _22
	call	indention_tac	 ;
 ; D:/TC/src/output.c:502:         tac_output(indent + 1, "]\n");
	movq	64(%rsp), %rcx	 ; %sfp,
	movq	%r14, %r9	 ; outfile,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	call	fwrite	 ;
	jmp	.L211	 ;
	.p2align 4,,10
	.p2align 3
.L206:
 ; D:/TC/src/output.c:489:         tac_output(indent + 1, "local: [\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:489:         tac_output(indent + 1, "local: [\n");
	movq	%r14, %r9	 ; outfile,
 ; D:/TC/src/output.c:492:             output_var(var, outfile, indent + 2);
	leaq	4(%r13), %rbx	 ;, tmp299
 ; D:/TC/src/output.c:489:         tac_output(indent + 1, "local: [\n");
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC119(%rip), %rcx	 ;, tmp227
	call	fwrite	 ;
 ; D:/TC/src/output.c:491:         while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
	jmp	.L208	 ;
	.p2align 4,,10
	.p2align 3
.L209:
 ; D:/TC/src/output.c:492:             output_var(var, outfile, indent + 2);
	movq	%rbx, %r8	 ; tmp299,
	movq	%r14, %rdx	 ; outfile,
	call	output_var	 ;
.L208:
 ; D:/TC/src/output.c:491:         while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
	movq	24(%rsi), %rcx	 ; subroutine_66->local_vars, subroutine_66->local_vars
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp324, var
 ; D:/TC/src/output.c:491:         while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
	testq	%rax, %rax	 ; var
	jne	.L209	 ;,
 ; D:/TC/src/output.c:493:         tac_output(indent + 1, "]\n");
	movq	%rdi, %rdx	 ; _238,
	movq	%r14, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:493:         tac_output(indent + 1, "]\n");
	movq	64(%rsp), %rcx	 ; %sfp,
	movq	%r14, %r9	 ; outfile,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	call	fwrite	 ;
	jmp	.L207	 ;
.L218:
 ; D:/TC/src/output.c:611:             tac_output(indent, "unknown_InstructionType: %u\n", instruction->type);
	movq	%rdi, %rdx	 ; _131,
	movq	%r14, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:611:             tac_output(indent, "unknown_InstructionType: %u\n", instruction->type);
	movl	24(%rsi), %r8d	 ; instruction_132->type,
	leaq	.LC148(%rip), %rdx	 ;, tmp274
	movq	%r14, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:613:             return;
	jmp	.L217	 ;
	.p2align 4,,10
	.p2align 3
.L264:
 ; D:/TC/src/output.c:474:         tac_output(indent + 1, "return_type: \"NULL\"\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:474:         tac_output(indent + 1, "return_type: \"NULL\"\n");
	movq	%r14, %r9	 ; outfile,
	movl	$20, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC114(%rip), %rcx	 ;, tmp215
	call	fwrite	 ;
	jmp	.L201	 ;
	.p2align 4,,10
	.p2align 3
.L263:
 ; D:/TC/src/output.c:470:         tac_output(indent, "NULL {\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:470:         tac_output(indent, "NULL {\n");
	movq	%r14, %r9	 ; outfile,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC112(%rip), %rcx	 ;, tmp211
	call	fwrite	 ;
	jmp	.L199	 ;
.L191:
 ; D:/TC/src/output.c:444:         tac_output(indent + 1, "global: [\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:444:         tac_output(indent + 1, "global: [\n");
	movq	%r14, %r9	 ; outfile,
 ; D:/TC/src/output.c:447:             output_var(var, outfile, indent + 2);
	leaq	2(%r13), %rbx	 ;, tmp304
 ; D:/TC/src/output.c:444:         tac_output(indent + 1, "global: [\n");
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC109(%rip), %rcx	 ;, tmp204
	call	fwrite	 ;
	movq	48(%rsp), %rsi	 ; %sfp, tac
 ; D:/TC/src/output.c:446:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	jmp	.L193	 ;
	.p2align 4,,10
	.p2align 3
.L194:
 ; D:/TC/src/output.c:447:             output_var(var, outfile, indent + 2);
	movq	%rbx, %r8	 ; tmp304,
	movq	%r14, %rdx	 ; outfile,
	call	output_var	 ;
.L193:
 ; D:/TC/src/output.c:446:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	movq	16(%rsi), %rcx	 ; tac_32(D)->global_vars, tac_32(D)->global_vars
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp319, var
 ; D:/TC/src/output.c:446:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	testq	%rax, %rax	 ; var
	jne	.L194	 ;,
 ; D:/TC/src/output.c:448:         tac_output(indent + 1, "]\n");
	movq	%rbp, %rdx	 ; _239,
	movq	%r14, %rcx	 ; outfile,
 ; D:/TC/src/output.c:448:         tac_output(indent + 1, "]\n");
	leaq	.LC105(%rip), %r12	 ;, tmp292
 ; D:/TC/src/output.c:448:         tac_output(indent + 1, "]\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:448:         tac_output(indent + 1, "]\n");
	movq	%r14, %r9	 ; outfile,
	movl	$1, %edx	 ;,
	movq	%r12, %rcx	 ; tmp292,
	movl	$2, %r8d	 ;,
	call	fwrite	 ;
	jmp	.L192	 ;
.L262:
 ; D:/TC/src/output.c:457:         tac_output(indent + 1, "]\n");
	movq	88(%rsp), %rbp	 ; %sfp, _239
	movq	64(%rsp), %r12	 ; %sfp, tmp292
	movq	%r14, %rcx	 ; outfile,
	movq	%rbp, %rdx	 ; _239,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:457:         tac_output(indent + 1, "]\n");
	movq	%r14, %r9	 ; outfile,
	movl	$1, %edx	 ;,
	movq	%r12, %rcx	 ; tmp292,
	movl	$2, %r8d	 ;,
	call	fwrite	 ;
	jmp	.L196	 ;
.L257:
 ; D:/TC/src/output.c:438:         tac_output(indent + 1, "entry_point: \"NULL\"\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:438:         tac_output(indent + 1, "entry_point: \"NULL\"\n");
	movq	%r14, %r9	 ; outfile,
	movl	$20, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC106(%rip), %rcx	 ;, tmp198
	call	fwrite	 ;
	jmp	.L190	 ;
.L256:
 ; D:/TC/src/output.c:423:         tac_output(indent, "TAC: \"NULL\"\n");
	call	indention_tac	 ;
 ; D:/TC/src/output.c:423:         tac_output(indent, "TAC: \"NULL\"\n");
	movq	%r14, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC91(%rip), %rcx	 ;, tmp166
	jmp	.L255	 ;
	.ident	"GCC: (GNU) 13.2.0"
	.def	indention;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	indention_tac;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	list_is_empty;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
