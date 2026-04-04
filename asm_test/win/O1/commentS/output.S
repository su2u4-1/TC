	.file	"output.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O1 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
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
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rdx, %rbx	 ; tmp134, outfile
	movq	%r8, %rdi	 ; tmp135, indent
	movq	%r9, %rbp	 ; tmp136, indent_has_next
 ; D:/TC/src/output.c:365:     if (name == NULL) {
	testq	%rcx, %rcx	 ; name
	je	.L14	 ;,
	movq	%rcx, %rsi	 ; tmp133, name
 ; D:/TC/src/output.c:370:     ast_output(0, false, "name: \"%s\"\n", name->name);
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:370:     ast_output(0, false, "name: \"%s\"\n", name->name);
	movq	8(%rsi), %r8	 ; name_15(D)->name,
	leaq	.LC1(%rip), %rdx	 ;, tmp101
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:371:     ast_output(0, false, "id: %zu\n", name->id);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:371:     ast_output(0, false, "id: %zu\n", name->id);
	movq	16(%rsi), %r8	 ; name_15(D)->id,
	leaq	.LC2(%rip), %rdx	 ;, tmp103
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:372:     switch (name->kind) {
	cmpl	$6, 32(%rsi)	 ;, name_15(D)->kind
	ja	.L4	 ;,
	movl	32(%rsi), %eax	 ; name_15(D)->kind, name_15(D)->kind
	leaq	.L6(%rip), %rdx	 ;, tmp105
	movslq	(%rdx,%rax,4), %rax	 ;, tmp107
	addq	%rdx, %rax	 ; tmp105, tmp108
	jmp	*%rax	 ; tmp108
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
.L14:
 ; D:/TC/src/output.c:366:         ast_output(0, true, "Name: \"NULL\"\n");
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:366:         ast_output(0, true, "Name: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp99
	call	fwrite	 ;
.L1:
 ; D:/TC/src/output.c:409: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L5:
 ; D:/TC/src/output.c:374:             ast_output(0, true, "kind: \"type\"\n");
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:374:             ast_output(0, true, "kind: \"type\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC3(%rip), %rcx	 ;, tmp110
	call	fwrite	 ;
 ; D:/TC/src/output.c:375:             break;
	jmp	.L1	 ;
.L9:
 ; D:/TC/src/output.c:377:             ast_output(0, false, "kind: \"variable\"\n");
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:377:             ast_output(0, false, "kind: \"variable\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rcx	 ;, tmp111
	call	fwrite	 ;
 ; D:/TC/src/output.c:378:             ast_output(0, true, "type\n");
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:378:             ast_output(0, true, "type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp112
	call	fwrite	 ;
 ; D:/TC/src/output.c:379:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rcx	 ; name_15(D)->type, name_15(D)->type
	movq	%rbp, %r9	 ; indent_has_next,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:/TC/src/output.c:380:             break;
	jmp	.L1	 ;
.L11:
 ; D:/TC/src/output.c:382:             ast_output(0, false, "kind: \"function\"\n");
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:382:             ast_output(0, false, "kind: \"function\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC6(%rip), %rcx	 ;, tmp115
	call	fwrite	 ;
 ; D:/TC/src/output.c:383:             ast_output(0, true, "return_type\n");
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:383:             ast_output(0, true, "return_type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rcx	 ;, tmp116
	call	fwrite	 ;
 ; D:/TC/src/output.c:384:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rcx	 ; name_15(D)->type, name_15(D)->type
	movq	%rbp, %r9	 ; indent_has_next,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:/TC/src/output.c:385:             break;
	jmp	.L1	 ;
.L10:
 ; D:/TC/src/output.c:387:             ast_output(0, false, "kind: \"method\"\n");
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:387:             ast_output(0, false, "kind: \"method\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC8(%rip), %rcx	 ;, tmp119
	call	fwrite	 ;
 ; D:/TC/src/output.c:388:             ast_output(0, true, "return_type\n");
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:388:             ast_output(0, true, "return_type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rcx	 ;, tmp120
	call	fwrite	 ;
 ; D:/TC/src/output.c:389:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rcx	 ; name_15(D)->type, name_15(D)->type
	movq	%rbp, %r9	 ; indent_has_next,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:/TC/src/output.c:390:             break;
	jmp	.L1	 ;
.L12:
 ; D:/TC/src/output.c:392:             ast_output(0, true, "kind: \"class\"\n");
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:392:             ast_output(0, true, "kind: \"class\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC9(%rip), %rcx	 ;, tmp123
	call	fwrite	 ;
 ; D:/TC/src/output.c:393:             break;
	jmp	.L1	 ;
.L7:
 ; D:/TC/src/output.c:395:             ast_output(0, false, "kind: \"attribute\"\n");
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:395:             ast_output(0, false, "kind: \"attribute\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rcx	 ;, tmp124
	call	fwrite	 ;
 ; D:/TC/src/output.c:396:             ast_output(0, true, "type\n");
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:396:             ast_output(0, true, "type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp125
	call	fwrite	 ;
 ; D:/TC/src/output.c:397:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rcx	 ; name_15(D)->type, name_15(D)->type
	movq	%rbp, %r9	 ; indent_has_next,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:/TC/src/output.c:398:             break;
	jmp	.L1	 ;
.L8:
 ; D:/TC/src/output.c:400:             ast_output(0, false, "kind: \"parameter\"\n");
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:400:             ast_output(0, false, "kind: \"parameter\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC11(%rip), %rcx	 ;, tmp128
	call	fwrite	 ;
 ; D:/TC/src/output.c:401:             ast_output(0, true, "type\n");
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:401:             ast_output(0, true, "type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp129
	call	fwrite	 ;
 ; D:/TC/src/output.c:402:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rcx	 ; name_15(D)->type, name_15(D)->type
	movq	%rbp, %r9	 ; indent_has_next,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:/TC/src/output.c:403:             break;
	jmp	.L1	 ;
.L4:
 ; D:/TC/src/output.c:405:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:405:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$25, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC12(%rip), %rcx	 ;, tmp132
	call	fwrite	 ;
 ; D:/TC/src/output.c:406:             break;
	jmp	.L1	 ;
	.section .rdata,"dr"
.LC13:
	.ascii "UNKNOWN_OPERATOR\0"
.LC14:
	.ascii "primary\12\0"
.LC15:
	.ascii "operator: \"%s\"\12\0"
.LC16:
	.ascii "left\12\0"
.LC17:
	.ascii "right\12\0"
	.text
	.def	output_expression;	.scl	3;	.type	32;	.endef
output_expression:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %r12	 ; tmp102, expression
	movq	%rdx, %rbx	 ; tmp103, outfile
	movq	%r8, %rbp	 ; tmp104, indent
	movq	%r9, %rsi	 ; tmp105, indent_has_next
 ; D:/TC/src/output.c:258:     if (expression->operator == OP_NONE) {
	movl	24(%rcx), %ecx	 ; expression_10(D)->operator, _1
 ; D:/TC/src/output.c:258:     if (expression->operator == OP_NONE) {
	cmpl	$19, %ecx	 ;, _1
	je	.L21	 ;,
 ; D:/TC/src/output.c:262:         string op_str = operator_to_string(expression->operator);
	call	operator_to_string	 ;
	movq	%rax, %rdi	 ; tmp106, op_str
 ; D:/TC/src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	testq	%rdi, %rdi	 ; op_str
 ; D:/TC/src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	leaq	.LC13(%rip), %r8	 ;, tmp101
	cmovne	%rdi, %r8	 ; op_str,,
	leaq	.LC15(%rip), %rdx	 ;, tmp96
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:264:         ast_output(0, false, "left\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:264:         ast_output(0, false, "left\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rcx	 ;, tmp97
	call	fwrite	 ;
 ; D:/TC/src/output.c:265:         output_expression(expression->expr_left, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %rdi	 ;, _4
	movq	(%r12), %rcx	 ; expression_10(D)->expr_left, expression_10(D)->expr_left
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rdi, %r8	 ; _4,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:/TC/src/output.c:266:         ast_output(0, true, "right\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:266:         ast_output(0, true, "right\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC17(%rip), %rcx	 ;, tmp99
	call	fwrite	 ;
 ; D:/TC/src/output.c:267:         output_expression(expression->right, outfile, indent + 1, indent_has_next);
	movq	16(%r12), %rcx	 ; expression_10(D)->right, expression_10(D)->right
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rdi, %r8	 ; _4,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
.L15:
 ; D:/TC/src/output.c:270: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L21:
 ; D:/TC/src/output.c:259:         ast_output(0, true, "primary\n");
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:259:         ast_output(0, true, "primary\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC14(%rip), %rcx	 ;, tmp93
	call	fwrite	 ;
 ; D:/TC/src/output.c:260:         output_primary(expression->prim_left, outfile, indent + 1, indent_has_next);
	movq	8(%r12), %rcx	 ; expression_10(D)->prim_left, expression_10(D)->prim_left
	movq	%rsi, %r9	 ; indent_has_next,
	leaq	1(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_primary	 ;
	jmp	.L15	 ;
	.section .rdata,"dr"
.LC18:
	.ascii "name\12\0"
.LC19:
	.ascii "value\12\0"
.LC20:
	.ascii "value: \"NULL\"\12\0"
	.text
	.def	output_variable;	.scl	3;	.type	32;	.endef
output_variable:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rbp	 ; tmp98, variable
	movq	%rdx, %rbx	 ; tmp99, outfile
	movq	%r8, %rdi	 ; tmp100, indent
	movq	%r9, %rsi	 ; tmp101, indent_has_next
 ; D:/TC/src/output.c:130:     ast_output(0, false, "type\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:130:     ast_output(0, false, "type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp91
	call	fwrite	 ;
 ; D:/TC/src/output.c:131:     output_name(variable->type, outfile, indent + 1, indent_has_next);
	leaq	1(%rdi), %r12	 ;, _1
	movq	0(%rbp), %rcx	 ; variable_13(D)->type, variable_13(D)->type
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:/TC/src/output.c:132:     ast_output(0, false, "name\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:132:     ast_output(0, false, "name\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rcx	 ;, tmp93
	call	fwrite	 ;
 ; D:/TC/src/output.c:133:     output_name(variable->name, outfile, indent + 1, indent_has_next);
	movq	8(%rbp), %rcx	 ; variable_13(D)->name, variable_13(D)->name
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:/TC/src/output.c:134:     if (variable->value != NULL) {
	cmpq	$0, 16(%rbp)	 ;, variable_13(D)->value
	je	.L23	 ;,
 ; D:/TC/src/output.c:135:         ast_output(0, true, "value\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:135:         ast_output(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC19(%rip), %rcx	 ;, tmp95
	call	fwrite	 ;
 ; D:/TC/src/output.c:136:         output_expression(variable->value, outfile, indent + 1, indent_has_next);
	movq	16(%rbp), %rcx	 ; variable_13(D)->value, variable_13(D)->value
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
.L22:
 ; D:/TC/src/output.c:140: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L23:
 ; D:/TC/src/output.c:138:         ast_output(0, true, "value: \"NULL\"\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:138:         ast_output(0, true, "value: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC20(%rip), %rcx	 ;, tmp97
	call	fwrite	 ;
 ; D:/TC/src/output.c:140: }
	jmp	.L22	 ;
	.section .rdata,"dr"
.LC21:
	.ascii "type: \"name\"\12\0"
.LC22:
	.ascii "type: \"function_call\"\12\0"
.LC23:
	.ascii "function\12\0"
.LC24:
	.ascii "arguments\12\0"
.LC25:
	.ascii "arguments[%d]\12\0"
.LC26:
	.ascii "type: \"get sequence_element\"\12\0"
.LC27:
	.ascii "sequence\12\0"
.LC28:
	.ascii "index\12\0"
.LC29:
	.ascii "type: \"get_attribute\"\12\0"
.LC30:
	.ascii "object\12\0"
.LC31:
	.ascii "attribute_name\12\0"
	.align 8
.LC32:
	.ascii "unknown_VariableAccessType: %u\12\0"
	.text
	.def	output_variable_access;	.scl	3;	.type	32;	.endef
output_variable_access:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rdi	 ; tmp128, variable_access
	movq	%rdx, %rbx	 ; tmp129, outfile
	movq	%r8, %rbp	 ; tmp130, indent
	movq	%r9, %rsi	 ; tmp131, indent_has_next
 ; D:/TC/src/output.c:324:     switch (variable_access->type) {
	movl	16(%rcx), %eax	 ; variable_access_19(D)->type, _1
 ; D:/TC/src/output.c:324:     switch (variable_access->type) {
	cmpl	$2, %eax	 ;, _1
	je	.L27	 ;,
	ja	.L28	 ;,
	testl	%eax, %eax	 ; _1
	je	.L39	 ;,
 ; D:/TC/src/output.c:331:             args = list_copy(variable_access->content.args);
	movq	8(%rcx), %rcx	 ; variable_access_19(D)->content.args, variable_access_19(D)->content.args
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp132, args
 ; D:/TC/src/output.c:332:             ast_output(0, false, "type: \"function_call\"\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:332:             ast_output(0, false, "type: \"function_call\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$22, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC22(%rip), %rcx	 ;, tmp108
	call	fwrite	 ;
 ; D:/TC/src/output.c:333:             ast_output(0, false, "function\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:333:             ast_output(0, false, "function\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC23(%rip), %rcx	 ;, tmp109
	call	fwrite	 ;
 ; D:/TC/src/output.c:334:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %r14	 ;, _5
	movq	(%rdi), %rcx	 ; variable_access_19(D)->base, variable_access_19(D)->base
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r14, %r8	 ; _5,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; D:/TC/src/output.c:335:             ast_output(0, true, "arguments\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:335:             ast_output(0, true, "arguments\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC24(%rip), %rcx	 ;, tmp111
	call	fwrite	 ;
 ; D:/TC/src/output.c:337:             index = -1;
	movl	$-1, %r12d	 ;, index
 ; D:/TC/src/output.c:339:                 ast_output(1, false, "arguments[%d]\n", ++index);
	leaq	.LC25(%rip), %r15	 ;, tmp126
 ; D:/TC/src/output.c:340:                 output_expression(arg, outfile, indent + 2, indent_has_next);
	addq	$2, %rbp	 ;, tmp127
 ; D:/TC/src/output.c:338:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	jmp	.L34	 ;
.L28:
 ; D:/TC/src/output.c:324:     switch (variable_access->type) {
	cmpl	$3, %eax	 ;, _1
	jne	.L40	 ;,
 ; D:/TC/src/output.c:344:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:344:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$29, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC26(%rip), %rcx	 ;, tmp114
	call	fwrite	 ;
 ; D:/TC/src/output.c:345:             ast_output(0, false, "sequence\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:345:             ast_output(0, false, "sequence\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC27(%rip), %rcx	 ;, tmp115
	call	fwrite	 ;
 ; D:/TC/src/output.c:346:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %r12	 ;, _8
	movq	(%rdi), %rcx	 ; variable_access_19(D)->base, variable_access_19(D)->base
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _8,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; D:/TC/src/output.c:347:             ast_output(0, true, "index\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:347:             ast_output(0, true, "index\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC28(%rip), %rcx	 ;, tmp117
	call	fwrite	 ;
 ; D:/TC/src/output.c:348:             output_expression(variable_access->content.index, outfile, indent + 1, indent_has_next);
	movq	8(%rdi), %rcx	 ; variable_access_19(D)->content.index, variable_access_19(D)->content.index
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _8,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:/TC/src/output.c:349:             break;
	jmp	.L26	 ;
.L39:
 ; D:/TC/src/output.c:326:             ast_output(0, false, "type: \"name\"\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:326:             ast_output(0, false, "type: \"name\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC21(%rip), %rcx	 ;, tmp103
	call	fwrite	 ;
 ; D:/TC/src/output.c:327:             ast_output(0, true, "name\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:327:             ast_output(0, true, "name\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rcx	 ;, tmp104
	call	fwrite	 ;
 ; D:/TC/src/output.c:328:             output_name(variable_access->content.name, outfile, indent + 1, indent_has_next);
	movq	8(%rdi), %rcx	 ; variable_access_19(D)->content.name, variable_access_19(D)->content.name
	movq	%rsi, %r9	 ; indent_has_next,
	leaq	1(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
.L26:
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
.L35:
 ; D:/TC/src/output.c:339:                 ast_output(1, false, "arguments[%d]\n", ++index);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r14, %rdx	 ; _5,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:339:                 ast_output(1, false, "arguments[%d]\n", ++index);
	addl	$1, %r12d	 ;, index
	movl	%r12d, %r8d	 ; index,
	movq	%r15, %rdx	 ; tmp126,
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:340:                 output_expression(arg, outfile, indent + 2, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbp, %r8	 ; tmp127,
	movq	%rbx, %rdx	 ; outfile,
	movq	%rdi, %rcx	 ; arg,
	call	output_expression	 ;
.L34:
 ; D:/TC/src/output.c:338:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	movq	%r13, %rcx	 ; args,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp133, arg
 ; D:/TC/src/output.c:338:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	 ; arg
	jne	.L35	 ;,
	jmp	.L26	 ;
.L27:
 ; D:/TC/src/output.c:351:             ast_output(0, false, "type: \"get_attribute\"\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:351:             ast_output(0, false, "type: \"get_attribute\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$22, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC29(%rip), %rcx	 ;, tmp119
	call	fwrite	 ;
 ; D:/TC/src/output.c:352:             ast_output(0, false, "object\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:352:             ast_output(0, false, "object\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC30(%rip), %rcx	 ;, tmp120
	call	fwrite	 ;
 ; D:/TC/src/output.c:353:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %r12	 ;, _11
	movq	(%rdi), %rcx	 ; variable_access_19(D)->base, variable_access_19(D)->base
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _11,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; D:/TC/src/output.c:354:             ast_output(0, true, "attribute_name\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:354:             ast_output(0, true, "attribute_name\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC31(%rip), %rcx	 ;, tmp122
	call	fwrite	 ;
 ; D:/TC/src/output.c:355:             output_name(variable_access->content.attr_name, outfile, indent + 1, indent_has_next);
	movq	8(%rdi), %rcx	 ; variable_access_19(D)->content.attr_name, variable_access_19(D)->content.attr_name
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _11,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:/TC/src/output.c:356:             break;
	jmp	.L26	 ;
.L40:
 ; D:/TC/src/output.c:358:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:358:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movl	16(%rdi), %r8d	 ; variable_access_19(D)->type,
	leaq	.LC32(%rip), %rdx	 ;, tmp125
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:362: }
	jmp	.L26	 ;
	.section .rdata,"dr"
.LC33:
	.ascii "type: \"integer\"\12\0"
.LC34:
	.ascii "value: %s\12\0"
.LC35:
	.ascii "type: \"float\"\12\0"
.LC36:
	.ascii "type: \"string\"\12\0"
.LC37:
	.ascii "value: \"%s\"\12\0"
.LC38:
	.ascii "type: \"boolean\"\12\0"
.LC39:
	.ascii "value: \"true\"\12\0"
.LC40:
	.ascii "value: \"false\"\12\0"
.LC41:
	.ascii "type: \"expression\"\12\0"
.LC42:
	.ascii "type: \"!\"\12\0"
.LC43:
	.ascii "type: \"-\"\12\0"
.LC44:
	.ascii "type: \"variable\"\12\0"
.LC45:
	.ascii "unknown_PrimaryType: %u\12\0"
	.text
	.def	output_primary;	.scl	3;	.type	32;	.endef
output_primary:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp136, primary
	movq	%rdx, %rbx	 ; tmp137, outfile
	movq	%r8, %rdi	 ; tmp138, indent
	movq	%r9, %rbp	 ; tmp139, indent_has_next
 ; D:/TC/src/output.c:273:     switch (primary->type) {
	cmpl	$8, 8(%rcx)	 ;, primary_16(D)->type
	ja	.L42	 ;,
	movl	8(%rcx), %eax	 ; primary_16(D)->type, primary_16(D)->type
	leaq	.L44(%rip), %rdx	 ;, tmp100
	movslq	(%rdx,%rax,4), %rax	 ;, tmp102
	addq	%rdx, %rax	 ; tmp100, tmp103
	jmp	*%rax	 ; tmp103
	.section .rdata,"dr"
	.align 4
.L44:
	.long	.L52-.L44
	.long	.L51-.L44
	.long	.L50-.L44
	.long	.L49-.L44
	.long	.L48-.L44
	.long	.L47-.L44
	.long	.L46-.L44
	.long	.L45-.L44
	.long	.L43-.L44
	.text
.L52:
 ; D:/TC/src/output.c:275:             ast_output(0, false, "type: \"integer\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:275:             ast_output(0, false, "type: \"integer\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC33(%rip), %rcx	 ;, tmp105
	call	fwrite	 ;
 ; D:/TC/src/output.c:276:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:276:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	(%rsi), %r8	 ; primary_16(D)->value.literal_value,
	leaq	.LC34(%rip), %rdx	 ;, tmp107
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
.L41:
 ; D:/TC/src/output.c:319: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L51:
 ; D:/TC/src/output.c:279:             ast_output(0, false, "type: \"float\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:279:             ast_output(0, false, "type: \"float\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC35(%rip), %rcx	 ;, tmp108
	call	fwrite	 ;
 ; D:/TC/src/output.c:280:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:280:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	(%rsi), %r8	 ; primary_16(D)->value.literal_value,
	leaq	.LC34(%rip), %rdx	 ;, tmp110
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:281:             break;
	jmp	.L41	 ;
.L50:
 ; D:/TC/src/output.c:283:             ast_output(0, false, "type: \"string\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:283:             ast_output(0, false, "type: \"string\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC36(%rip), %rcx	 ;, tmp111
	call	fwrite	 ;
 ; D:/TC/src/output.c:284:             ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:284:             ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
	movq	(%rsi), %r8	 ; primary_16(D)->value.literal_value,
	leaq	.LC37(%rip), %rdx	 ;, tmp113
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:285:             break;
	jmp	.L41	 ;
.L49:
 ; D:/TC/src/output.c:287:             ast_output(0, false, "type: \"boolean\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:287:             ast_output(0, false, "type: \"boolean\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC38(%rip), %rcx	 ;, tmp114
	call	fwrite	 ;
 ; D:/TC/src/output.c:288:             ast_output(0, true, "value: \"true\"\n");
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:288:             ast_output(0, true, "value: \"true\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC39(%rip), %rcx	 ;, tmp115
	call	fwrite	 ;
 ; D:/TC/src/output.c:289:             break;
	jmp	.L41	 ;
.L48:
 ; D:/TC/src/output.c:291:             ast_output(0, false, "type: \"boolean\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:291:             ast_output(0, false, "type: \"boolean\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC38(%rip), %rcx	 ;, tmp116
	call	fwrite	 ;
 ; D:/TC/src/output.c:292:             ast_output(0, true, "value: \"false\"\n");
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:292:             ast_output(0, true, "value: \"false\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC40(%rip), %rcx	 ;, tmp117
	call	fwrite	 ;
 ; D:/TC/src/output.c:293:             break;
	jmp	.L41	 ;
.L47:
 ; D:/TC/src/output.c:295:             ast_output(0, false, "type: \"expression\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:295:             ast_output(0, false, "type: \"expression\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$19, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC41(%rip), %rcx	 ;, tmp118
	call	fwrite	 ;
 ; D:/TC/src/output.c:296:             ast_output(0, true, "value\n");
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:296:             ast_output(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC19(%rip), %rcx	 ;, tmp119
	call	fwrite	 ;
 ; D:/TC/src/output.c:297:             output_expression(primary->value.expr, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rcx	 ; primary_16(D)->value.expr, primary_16(D)->value.expr
	movq	%rbp, %r9	 ; indent_has_next,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:/TC/src/output.c:298:             break;
	jmp	.L41	 ;
.L46:
 ; D:/TC/src/output.c:300:             ast_output(0, false, "type: \"!\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:300:             ast_output(0, false, "type: \"!\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC42(%rip), %rcx	 ;, tmp122
	call	fwrite	 ;
 ; D:/TC/src/output.c:301:             ast_output(0, true, "value\n");
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:301:             ast_output(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC19(%rip), %rcx	 ;, tmp123
	call	fwrite	 ;
 ; D:/TC/src/output.c:302:             output_primary(primary->value.operand, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rcx	 ; primary_16(D)->value.operand, primary_16(D)->value.operand
	movq	%rbp, %r9	 ; indent_has_next,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_primary	 ;
 ; D:/TC/src/output.c:303:             break;
	jmp	.L41	 ;
.L45:
 ; D:/TC/src/output.c:305:             ast_output(0, false, "type: \"-\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:305:             ast_output(0, false, "type: \"-\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC43(%rip), %rcx	 ;, tmp126
	call	fwrite	 ;
 ; D:/TC/src/output.c:306:             ast_output(0, true, "value\n");
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:306:             ast_output(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC19(%rip), %rcx	 ;, tmp127
	call	fwrite	 ;
 ; D:/TC/src/output.c:307:             output_primary(primary->value.operand, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rcx	 ; primary_16(D)->value.operand, primary_16(D)->value.operand
	movq	%rbp, %r9	 ; indent_has_next,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_primary	 ;
 ; D:/TC/src/output.c:308:             break;
	jmp	.L41	 ;
.L43:
 ; D:/TC/src/output.c:310:             ast_output(0, false, "type: \"variable\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:310:             ast_output(0, false, "type: \"variable\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC44(%rip), %rcx	 ;, tmp130
	call	fwrite	 ;
 ; D:/TC/src/output.c:311:             ast_output(0, true, "value\n");
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:311:             ast_output(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC19(%rip), %rcx	 ;, tmp131
	call	fwrite	 ;
 ; D:/TC/src/output.c:312:             output_variable_access(primary->value.var, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rcx	 ; primary_16(D)->value.var, primary_16(D)->value.var
	movq	%rbp, %r9	 ; indent_has_next,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; D:/TC/src/output.c:313:             break;
	jmp	.L41	 ;
.L42:
 ; D:/TC/src/output.c:315:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:315:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movl	8(%rsi), %r8d	 ; primary_16(D)->type,
	leaq	.LC45(%rip), %rdx	 ;, tmp135
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:319: }
	jmp	.L41	 ;
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
	.def	output_statement;	.scl	3;	.type	32;	.endef
output_statement:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
	movq	%rcx, %rdi	 ; tmp195, statement
	movq	%rdx, %rbx	 ; tmp196, outfile
	movq	%r8, %rbp	 ; tmp197, indent
	movq	%r9, %rsi	 ; tmp198, indent_has_next
 ; D:/TC/src/output.c:143:     switch (statement->type) {
	cmpl	$7, 8(%rcx)	 ;, statement_19(D)->type
	ja	.L56	 ;,
	movl	8(%rcx), %eax	 ; statement_19(D)->type, statement_19(D)->type
	leaq	.L58(%rip), %rdx	 ;, tmp137
	movslq	(%rdx,%rax,4), %rax	 ;, tmp139
	addq	%rdx, %rax	 ; tmp137, tmp140
	jmp	*%rax	 ; tmp140
	.section .rdata,"dr"
	.align 4
.L58:
	.long	.L65-.L58
	.long	.L64-.L58
	.long	.L63-.L58
	.long	.L62-.L58
	.long	.L61-.L58
	.long	.L60-.L58
	.long	.L59-.L58
	.long	.L57-.L58
	.text
.L63:
 ; D:/TC/src/output.c:145:             ast_output(0, false, "if_statement\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:145:             ast_output(0, false, "if_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC46(%rip), %rcx	 ;, tmp142
	call	fwrite	 ;
 ; D:/TC/src/output.c:146:             output_if(statement->stmt.if_stmt, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %r15	 ;, _2
	movq	%r15, 40(%rsp)	 ; _2, %sfp
	movq	(%rdi), %r12	 ; statement_19(D)->stmt.if_stmt, _3
 ; D:/TC/src/output.c:192:     list(Statement*) body = list_copy(if_->body);
	movq	8(%r12), %rcx	 ; _3->body, _3->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp199, body
 ; D:/TC/src/output.c:193:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	movq	16(%r12), %rcx	 ; _3->else_if, _3->else_if
	call	list_copy	 ;
	movq	%rax, %r14	 ; tmp200, else_if_list
 ; D:/TC/src/output.c:194:     list(Statement*) else_body = list_copy(if_->else_body);
	movq	24(%r12), %rcx	 ; _3->else_body, _3->else_body
	call	list_copy	 ;
	movq	%rax, 32(%rsp)	 ; tmp201, %sfp
 ; D:/TC/src/output.c:195:     ast_output(0, false, "condition\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r15, %rdx	 ; _2,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:195:     ast_output(0, false, "condition\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC47(%rip), %rcx	 ;, tmp146
	call	fwrite	 ;
 ; D:/TC/src/output.c:196:     output_expression(if_->condition, outfile, indent + 1, indent_has_next);
	leaq	2(%rbp), %r13	 ;, _57
	movq	(%r12), %rcx	 ; _3->condition, _3->condition
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r13, %r8	 ; _57,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:/TC/src/output.c:197:     ast_output(0, false, "body\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r15, %rdx	 ; _2,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:197:     ast_output(0, false, "body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rcx	 ;, tmp148
	call	fwrite	 ;
.L66:
 ; D:/TC/src/output.c:199:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp202, statement
 ; D:/TC/src/output.c:199:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L88	 ;,
 ; D:/TC/src/output.c:200:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r13, %r8	 ; _57,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
	jmp	.L66	 ;
.L88:
 ; D:/TC/src/output.c:201:     ast_output(0, false, "else_if\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:201:     ast_output(0, false, "else_if\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC49(%rip), %rcx	 ;, tmp149
	call	fwrite	 ;
 ; D:/TC/src/output.c:213:     ast_output(0, false, "condition\n");
	leaq	.LC47(%rip), %r15	 ;, tmp191
 ; D:/TC/src/output.c:214:     output_expression(else_if->condition, outfile, indent + 1, indent_has_next);
	addq	$3, %rbp	 ;, _64
.L68:
 ; D:/TC/src/output.c:203:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	movq	%r14, %rcx	 ; else_if_list,
	call	list_pop	 ;
	movq	%rax, %r12	 ; tmp205, else_if
 ; D:/TC/src/output.c:203:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	testq	%rax, %rax	 ; else_if
	je	.L89	 ;,
 ; D:/TC/src/output.c:212:     list(Statement*) body = list_copy(else_if->body);
	movq	8(%r12), %rcx	 ; else_if_60->body, else_if_60->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp203, body
 ; D:/TC/src/output.c:213:     ast_output(0, false, "condition\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _57,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:213:     ast_output(0, false, "condition\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	movq	%r15, %rcx	 ; tmp191,
	call	fwrite	 ;
 ; D:/TC/src/output.c:214:     output_expression(else_if->condition, outfile, indent + 1, indent_has_next);
	movq	(%r12), %rcx	 ; else_if_60->condition, else_if_60->condition
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbp, %r8	 ; _64,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:/TC/src/output.c:215:     ast_output(0, true, "body\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%r13, %rdx	 ; _57,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:215:     ast_output(0, true, "body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rcx	 ;,
	call	fwrite	 ;
.L69:
 ; D:/TC/src/output.c:217:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
 ; D:/TC/src/output.c:217:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L68	 ;,
 ; D:/TC/src/output.c:218:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbp, %r8	 ; _64,
	movq	%rbx, %rdx	 ; outfile,
	movq	%rax, %rcx	 ; statement,
	call	output_statement	 ;
	jmp	.L69	 ;
.L89:
 ; D:/TC/src/output.c:205:     ast_output(0, true, "else_body\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:205:     ast_output(0, true, "else_body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC50(%rip), %rcx	 ;, tmp154
	call	fwrite	 ;
.L72:
 ; D:/TC/src/output.c:206:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	movq	32(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp206, statement
 ; D:/TC/src/output.c:206:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L55	 ;,
 ; D:/TC/src/output.c:207:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r13, %r8	 ; _57,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
	jmp	.L72	 ;
.L61:
 ; D:/TC/src/output.c:149:             ast_output(0, false, "for_statement\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:149:             ast_output(0, false, "for_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC51(%rip), %rcx	 ;, tmp155
	call	fwrite	 ;
 ; D:/TC/src/output.c:150:             output_for(statement->stmt.for_stmt, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %r13	 ;, _4
	movq	(%rdi), %r12	 ; statement_19(D)->stmt.for_stmt, _5
 ; D:/TC/src/output.c:223:     list(Statement*) body = list_copy(for_->body);
	movq	24(%r12), %rcx	 ; _5->body, _5->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp207, body
 ; D:/TC/src/output.c:224:     if (for_->initializer != NULL) {
	cmpq	$0, (%r12)	 ;, _5->initializer
	je	.L75	 ;,
 ; D:/TC/src/output.c:225:         ast_output(0, false, "initializer\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
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
	leaq	2(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable	 ;
.L76:
 ; D:/TC/src/output.c:229:     if (for_->condition != NULL) {
	cmpq	$0, 8(%r12)	 ;, _5->condition
	je	.L77	 ;,
 ; D:/TC/src/output.c:230:         ast_output(0, false, "condition\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
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
	leaq	2(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
.L78:
 ; D:/TC/src/output.c:234:     if (for_->increment != NULL) {
	cmpq	$0, 16(%r12)	 ;, _5->increment
	je	.L79	 ;,
 ; D:/TC/src/output.c:235:         ast_output(0, false, "increment\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
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
	leaq	2(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
.L80:
 ; D:/TC/src/output.c:239:     ast_output(0, true, "body\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:239:     ast_output(0, true, "body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rcx	 ;, tmp169
	call	fwrite	 ;
 ; D:/TC/src/output.c:242:         output_statement(statement, outfile, indent + 1, indent_has_next);
	addq	$2, %rbp	 ;, tmp194
.L81:
 ; D:/TC/src/output.c:241:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp208, statement
 ; D:/TC/src/output.c:241:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L55	 ;,
 ; D:/TC/src/output.c:242:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbp, %r8	 ; tmp194,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
	jmp	.L81	 ;
.L75:
 ; D:/TC/src/output.c:228:         ast_output(0, false, "initializer: \"NULL\"\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:228:         ast_output(0, false, "initializer: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$20, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC53(%rip), %rcx	 ;, tmp160
	call	fwrite	 ;
	jmp	.L76	 ;
.L77:
 ; D:/TC/src/output.c:233:         ast_output(0, false, "condition: \"NULL\"\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:233:         ast_output(0, false, "condition: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC54(%rip), %rcx	 ;, tmp164
	call	fwrite	 ;
	jmp	.L78	 ;
.L79:
 ; D:/TC/src/output.c:238:         ast_output(0, false, "increment: \"NULL\"\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:238:         ast_output(0, false, "increment: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC56(%rip), %rcx	 ;, tmp168
	call	fwrite	 ;
	jmp	.L80	 ;
.L62:
 ; D:/TC/src/output.c:153:             ast_output(0, false, "while_statement\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:153:             ast_output(0, false, "while_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC57(%rip), %rcx	 ;, tmp171
	call	fwrite	 ;
 ; D:/TC/src/output.c:154:             output_while(statement->stmt.while_stmt, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %r12	 ;, _6
	movq	(%rdi), %r13	 ; statement_19(D)->stmt.while_stmt, _7
 ; D:/TC/src/output.c:247:     list(Statement*) body = list_copy(while_->body);
	movq	8(%r13), %rcx	 ; _7->body, _7->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp209, body
 ; D:/TC/src/output.c:248:     ast_output(0, false, "condition\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r12, %rdx	 ; _6,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:248:     ast_output(0, false, "condition\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC47(%rip), %rcx	 ;, tmp173
	call	fwrite	 ;
 ; D:/TC/src/output.c:249:     output_expression(while_->condition, outfile, indent + 1, indent_has_next);
	addq	$2, %rbp	 ;, _82
	movq	0(%r13), %rcx	 ; _7->condition, _7->condition
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbp, %r8	 ; _82,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:/TC/src/output.c:250:     ast_output(0, true, "body\n");
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%r12, %rdx	 ; _6,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:250:     ast_output(0, true, "body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rcx	 ;, tmp175
	call	fwrite	 ;
.L83:
 ; D:/TC/src/output.c:252:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp210, statement
 ; D:/TC/src/output.c:252:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L55	 ;,
 ; D:/TC/src/output.c:253:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbp, %r8	 ; _82,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
	jmp	.L83	 ;
.L64:
 ; D:/TC/src/output.c:157:             ast_output(0, false, "variable_declaration_statement\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:157:             ast_output(0, false, "variable_declaration_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC58(%rip), %rcx	 ;, tmp176
	call	fwrite	 ;
 ; D:/TC/src/output.c:158:             output_variable(statement->stmt.var, outfile, indent + 1, indent_has_next);
	movq	(%rdi), %rcx	 ; statement_19(D)->stmt.var, statement_19(D)->stmt.var
	movq	%rsi, %r9	 ; indent_has_next,
	leaq	1(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable	 ;
.L55:
 ; D:/TC/src/output.c:189: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
.L60:
 ; D:/TC/src/output.c:161:             if (statement->stmt.expr == NULL) {
	cmpq	$0, (%rcx)	 ;, statement_19(D)->stmt.expr
	je	.L90	 ;,
 ; D:/TC/src/output.c:166:             ast_output(0, false, "return_statement\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:166:             ast_output(0, false, "return_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC60(%rip), %rcx	 ;, tmp180
	call	fwrite	 ;
 ; D:/TC/src/output.c:167:             output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
	movq	(%rdi), %rcx	 ; statement_19(D)->stmt.expr, statement_19(D)->stmt.expr
	movq	%rsi, %r9	 ; indent_has_next,
	leaq	1(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:/TC/src/output.c:168:             break;
	jmp	.L55	 ;
.L90:
 ; D:/TC/src/output.c:162:                 ast_output(0, false, "return_statement: \"NULL\"\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:162:                 ast_output(0, false, "return_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$25, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC59(%rip), %rcx	 ;, tmp179
	call	fwrite	 ;
 ; D:/TC/src/output.c:164:                 return;
	jmp	.L55	 ;
.L59:
 ; D:/TC/src/output.c:170:             ast_output(0, false, "break_statement: \"NULL\"\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:170:             ast_output(0, false, "break_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$24, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC61(%rip), %rcx	 ;, tmp183
	call	fwrite	 ;
 ; D:/TC/src/output.c:171:             break;
	jmp	.L55	 ;
.L57:
 ; D:/TC/src/output.c:173:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:173:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$27, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC62(%rip), %rcx	 ;, tmp184
	call	fwrite	 ;
 ; D:/TC/src/output.c:174:             break;
	jmp	.L55	 ;
.L65:
 ; D:/TC/src/output.c:176:             if (statement->stmt.expr == NULL) {
	cmpq	$0, (%rcx)	 ;, statement_19(D)->stmt.expr
	je	.L91	 ;,
 ; D:/TC/src/output.c:181:             ast_output(0, false, "expression_statement\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:181:             ast_output(0, false, "expression_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$21, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC64(%rip), %rcx	 ;, tmp186
	call	fwrite	 ;
 ; D:/TC/src/output.c:182:             output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
	movq	(%rdi), %rcx	 ; statement_19(D)->stmt.expr, statement_19(D)->stmt.expr
	movq	%rsi, %r9	 ; indent_has_next,
	leaq	1(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:/TC/src/output.c:183:             break;
	jmp	.L55	 ;
.L91:
 ; D:/TC/src/output.c:177:                 ast_output(0, false, "expression_statement: \"NULL\"\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:177:                 ast_output(0, false, "expression_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$29, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC63(%rip), %rcx	 ;, tmp185
	call	fwrite	 ;
 ; D:/TC/src/output.c:179:                 return;
	jmp	.L55	 ;
.L56:
 ; D:/TC/src/output.c:185:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:185:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movl	8(%rdi), %r8d	 ; statement_19(D)->type,
	leaq	.LC65(%rip), %rdx	 ;, tmp190
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:186:             break;
	jmp	.L55	 ;
	.section .rdata,"dr"
.LC66:
	.ascii "Var: \"NULL\"\12\0"
.LC67:
	.ascii "NULL\11%s\12\0"
.LC68:
	.ascii "%s\11%s\12\0"
	.text
	.def	output_var;	.scl	3;	.type	32;	.endef
output_var:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rdx, %rsi	 ; tmp98, outfile
	movq	%r8, %rdx	 ; tmp99, indent
 ; D:/TC/src/output.c:509:     if (var == NULL) {
	testq	%rcx, %rcx	 ; var
	je	.L97	 ;,
	movq	%rcx, %rbx	 ; tmp97, var
 ; D:/TC/src/output.c:514:     if (var->type == NULL)
	cmpq	$0, 16(%rcx)	 ;, var_7(D)->type
	je	.L98	 ;,
 ; D:/TC/src/output.c:517:         tac_output(indent, "%s\t%s\n", var->type->name, var->name);
	movq	%rsi, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:517:         tac_output(indent, "%s\t%s\n", var->type->name, var->name);
	movq	16(%rbx), %rax	 ; var_7(D)->type, var_7(D)->type
	movq	8(%rbx), %r9	 ; var_7(D)->name,
	movq	8(%rax), %r8	 ; _4->name,
	leaq	.LC68(%rip), %rdx	 ;, tmp96
	movq	%rsi, %rcx	 ; outfile,
	call	fprintf	 ;
.L92:
 ; D:/TC/src/output.c:519: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
.L97:
 ; D:/TC/src/output.c:510:         tac_output(indent, "Var: \"NULL\"\n");
	movq	%rsi, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:510:         tac_output(indent, "Var: \"NULL\"\n");
	movq	%rsi, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC66(%rip), %rcx	 ;, tmp90
	call	fwrite	 ;
 ; D:/TC/src/output.c:512:         return;
	jmp	.L92	 ;
.L98:
 ; D:/TC/src/output.c:515:         tac_output(indent, "NULL\t%s\n", var->name);
	movq	%rsi, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:515:         tac_output(indent, "NULL\t%s\n", var->name);
	movq	8(%rbx), %r8	 ; var_7(D)->name,
	leaq	.LC67(%rip), %rdx	 ;, tmp92
	movq	%rsi, %rcx	 ; outfile,
	call	fprintf	 ;
	jmp	.L92	 ;
	.section .rdata,"dr"
.LC69:
	.ascii "true\0"
.LC70:
	.ascii "false\0"
.LC71:
	.ascii "\"NULL\"\0"
.LC72:
	.ascii "%lld\0"
.LC73:
	.ascii "%f\0"
.LC74:
	.ascii "void\0"
.LC75:
	.ascii "NONE\0"
.LC76:
	.ascii "unknown_ArgType: %u\0"
	.text
	.def	output_arg;	.scl	3;	.type	32;	.endef
output_arg:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rdx, %rsi	 ; tmp127, outfile
 ; D:/TC/src/output.c:544:     if (arg == NULL) {
	testq	%rcx, %rcx	 ; arg
	je	.L116	 ;,
	movq	%rcx, %rbx	 ; tmp126, arg
 ; D:/TC/src/output.c:549:     switch (arg->kind) {
	cmpl	$8, 16(%rcx)	 ;, arg_15(D)->kind
	ja	.L102	 ;,
	movl	16(%rcx), %eax	 ; arg_15(D)->kind, arg_15(D)->kind
	leaq	.L104(%rip), %rdx	 ;, tmp99
	movslq	(%rdx,%rax,4), %rax	 ;, tmp101
	addq	%rdx, %rax	 ; tmp99, tmp102
	jmp	*%rax	 ; tmp102
	.section .rdata,"dr"
	.align 4
.L104:
	.long	.L112-.L104
	.long	.L111-.L104
	.long	.L110-.L104
	.long	.L109-.L104
	.long	.L108-.L104
	.long	.L107-.L104
	.long	.L106-.L104
	.long	.L105-.L104
	.long	.L103-.L104
	.text
.L116:
 ; D:/TC/src/output.c:545:         tac_output(0, "\"NULL\"");
	movl	$0, %edx	 ;,
	movq	%rsi, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:545:         tac_output(0, "\"NULL\"");
	movq	%rsi, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC71(%rip), %rcx	 ;, tmp97
	call	fwrite	 ;
.L99:
 ; D:/TC/src/output.c:562: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
.L112:
 ; D:/TC/src/output.c:550:         case ARG_VARIABLE: tac_output(0, "%s", arg->value.variable->name); break;
	movl	$0, %edx	 ;,
	movq	%rsi, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:550:         case ARG_VARIABLE: tac_output(0, "%s", arg->value.variable->name); break;
	movq	(%rbx), %rax	 ; arg_15(D)->value.variable, arg_15(D)->value.variable
	movq	8(%rax), %rcx	 ; _2->name, _2->name
	movq	%rsi, %rdx	 ; outfile,
	call	fputs	 ;
 ; D:/TC/src/output.c:550:         case ARG_VARIABLE: tac_output(0, "%s", arg->value.variable->name); break;
	jmp	.L99	 ;
.L111:
 ; D:/TC/src/output.c:551:         case ARG_INT: tac_output(0, "%lld", arg->value.int_value); break;
	movl	$0, %edx	 ;,
	movq	%rsi, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:551:         case ARG_INT: tac_output(0, "%lld", arg->value.int_value); break;
	movq	(%rbx), %r8	 ; arg_15(D)->value.int_value,
	leaq	.LC72(%rip), %rdx	 ;, tmp107
	movq	%rsi, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:551:         case ARG_INT: tac_output(0, "%lld", arg->value.int_value); break;
	jmp	.L99	 ;
.L110:
 ; D:/TC/src/output.c:552:         case ARG_FLOAT: tac_output(0, "%f", arg->value.float_value); break;
	movl	$0, %edx	 ;,
	movq	%rsi, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:552:         case ARG_FLOAT: tac_output(0, "%f", arg->value.float_value); break;
	movq	(%rbx), %r8	 ; arg_15(D)->value.float_value, arg_15(D)->value.float_value
	movq	%r8, %xmm2	 ; arg_15(D)->value.float_value,
	leaq	.LC73(%rip), %rdx	 ;, tmp110
	movq	%rsi, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:552:         case ARG_FLOAT: tac_output(0, "%f", arg->value.float_value); break;
	jmp	.L99	 ;
.L109:
 ; D:/TC/src/output.c:553:         case ARG_STRING: tac_output(0, "%s", arg->value.string_value); break;
	movl	$0, %edx	 ;,
	movq	%rsi, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:553:         case ARG_STRING: tac_output(0, "%s", arg->value.string_value); break;
	movq	(%rbx), %rcx	 ; arg_15(D)->value.string_value, arg_15(D)->value.string_value
	movq	%rsi, %rdx	 ; outfile,
	call	fputs	 ;
 ; D:/TC/src/output.c:553:         case ARG_STRING: tac_output(0, "%s", arg->value.string_value); break;
	jmp	.L99	 ;
.L108:
 ; D:/TC/src/output.c:554:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	movl	$0, %edx	 ;,
	movq	%rsi, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:554:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	cmpb	$0, (%rbx)	 ;, arg_15(D)->value.bool_value
	leaq	.LC70(%rip), %rcx	 ;, tmp124
	leaq	.LC69(%rip), %rax	 ;, tmp125
	cmovne	%rax, %rcx	 ; tmp124,, tmp125, iftmp.2_13
 ; D:/TC/src/output.c:554:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	movq	%rsi, %rdx	 ; outfile,
	call	fputs	 ;
 ; D:/TC/src/output.c:554:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	jmp	.L99	 ;
.L107:
 ; D:/TC/src/output.c:555:         case ARG_VOID: tac_output(0, "void"); break;
	movl	$0, %edx	 ;,
	movq	%rsi, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:555:         case ARG_VOID: tac_output(0, "void"); break;
	movq	%rsi, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC74(%rip), %rcx	 ;, tmp112
	call	fwrite	 ;
 ; D:/TC/src/output.c:555:         case ARG_VOID: tac_output(0, "void"); break;
	jmp	.L99	 ;
.L106:
 ; D:/TC/src/output.c:556:         case ARG_LABEL: tac_output(0, "%s", arg->value.label->name); break;
	movl	$0, %edx	 ;,
	movq	%rsi, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:556:         case ARG_LABEL: tac_output(0, "%s", arg->value.label->name); break;
	movq	(%rbx), %rax	 ; arg_15(D)->value.label, arg_15(D)->value.label
	movq	8(%rax), %rcx	 ; _8->name, _8->name
	movq	%rsi, %rdx	 ; outfile,
	call	fputs	 ;
 ; D:/TC/src/output.c:556:         case ARG_LABEL: tac_output(0, "%s", arg->value.label->name); break;
	jmp	.L99	 ;
.L105:
 ; D:/TC/src/output.c:557:         case ARG_SUBROUTINE: tac_output(0, "%s", arg->value.subroutine->name); break;
	movl	$0, %edx	 ;,
	movq	%rsi, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:557:         case ARG_SUBROUTINE: tac_output(0, "%s", arg->value.subroutine->name); break;
	movq	(%rbx), %rax	 ; arg_15(D)->value.subroutine, arg_15(D)->value.subroutine
	movq	8(%rax), %rcx	 ; _10->name, _10->name
	movq	%rsi, %rdx	 ; outfile,
	call	fputs	 ;
 ; D:/TC/src/output.c:557:         case ARG_SUBROUTINE: tac_output(0, "%s", arg->value.subroutine->name); break;
	jmp	.L99	 ;
.L103:
 ; D:/TC/src/output.c:558:         case ARG_NONE: tac_output(0, "NONE"); break;
	movl	$0, %edx	 ;,
	movq	%rsi, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:558:         case ARG_NONE: tac_output(0, "NONE"); break;
	movq	%rsi, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC75(%rip), %rcx	 ;, tmp117
	call	fwrite	 ;
 ; D:/TC/src/output.c:558:         case ARG_NONE: tac_output(0, "NONE"); break;
	jmp	.L99	 ;
.L102:
 ; D:/TC/src/output.c:559:         default: tac_output(0, "unknown_ArgType: %u", arg->kind); break;
	movl	$0, %edx	 ;,
	movq	%rsi, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:559:         default: tac_output(0, "unknown_ArgType: %u", arg->kind); break;
	movl	16(%rbx), %r8d	 ; arg_15(D)->kind,
	leaq	.LC76(%rip), %rdx	 ;, tmp119
	movq	%rsi, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:559:         default: tac_output(0, "unknown_ArgType: %u", arg->kind); break;
	jmp	.L99	 ;
	.section .rdata,"dr"
.LC77:
	.ascii "NULL\0"
.LC78:
	.ascii "import\12\0"
.LC79:
	.ascii "source: \"%s\"\12\0"
.LC80:
	.ascii "parameters\12\0"
.LC81:
	.ascii "parameters[%d]\12\0"
.LC82:
	.ascii "class\12\0"
.LC83:
	.ascii "members\12\0"
.LC84:
	.ascii "method\12\0"
.LC85:
	.ascii "variable\12\0"
.LC86:
	.ascii "unknown_ClassMemberType: %u\12\0"
.LC87:
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
	subq	$72, %rsp	 ;,
	movq	%rdx, %r15	 ; tmp186, outfile
	movq	%r8, 160(%rsp)	 ; tmp187, indent
	movq	%r9, %r14	 ; tmp188, indent_has_next
 ; D:/TC/src/output.c:45:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rcx), %rcx	 ; code_5(D)->members, code_5(D)->members
	call	list_copy	 ;
	movq	%rax, 56(%rsp)	 ; tmp189, %sfp
 ; D:/TC/src/output.c:47:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	jmp	.L118	 ;
.L119:
 ; D:/TC/src/output.c:30:             ast_output(0, false, "function\n");
	movq	%r14, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:30:             ast_output(0, false, "function\n");
	movq	%r15, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC23(%rip), %rcx	 ;, tmp140
	call	fwrite	 ;
 ; D:/TC/src/output.c:31:             output_function(code_member->content.function, outfile, indent + 1, indent_has_next);
	movq	160(%rsp), %rax	 ; indent, tmp232
	leaq	2(%rax), %rsi	 ;, _17
	movq	%rsi, 32(%rsp)	 ; _17, %sfp
	movq	(%rbx), %rbx	 ; member_9->content.function, _18
 ; D:/TC/src/output.c:60:     ast_output(0, false, "name\n");
	movq	%r14, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; _17,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:60:     ast_output(0, false, "name\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rcx	 ;, tmp141
	call	fwrite	 ;
 ; D:/TC/src/output.c:61:     output_name(function->name, outfile, indent + 1, indent_has_next);
	movq	160(%rsp), %rax	 ; indent, tmp233
	leaq	3(%rax), %rdi	 ;, _26
	movq	(%rbx), %rcx	 ; _18->name, _18->name
	movq	%r14, %r9	 ; indent_has_next,
	movq	%rdi, %r8	 ; _26,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:/TC/src/output.c:62:     ast_output(0, false, "return_type\n");
	movq	%r14, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; _17,
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
	movq	%r14, %r9	 ; indent_has_next,
	movq	%rdi, %r8	 ; _26,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:/TC/src/output.c:64:     ast_output(0, false, "parameters\n");
	movq	%r14, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; _17,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:64:     ast_output(0, false, "parameters\n");
	movq	%r15, %r9	 ; outfile,
	movl	$11, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC80(%rip), %rcx	 ;, tmp145
	call	fwrite	 ;
 ; D:/TC/src/output.c:65:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%rbx), %rcx	 ; _18->parameters, _18->parameters
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp190, parameters
 ; D:/TC/src/output.c:66:     list(Statement*) body = list_copy(function->body);
	movq	24(%rbx), %rcx	 ; _18->body, _18->body
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp191, body
 ; D:/TC/src/output.c:68:     int index = -1;
	movl	$-1, %esi	 ;, index
 ; D:/TC/src/output.c:71:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	movq	160(%rsp), %rax	 ; indent, tmp234
	leaq	4(%rax), %r13	 ;, tmp181
.L124:
 ; D:/TC/src/output.c:69:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%r12, %rcx	 ; parameters,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp192, parameter
 ; D:/TC/src/output.c:69:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	 ; parameter
	je	.L141	 ;,
 ; D:/TC/src/output.c:70:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	%r14, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; _26,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:70:         ast_output(1, false, "parameters[%d]\n", ++index);
	addl	$1, %esi	 ;, index
	movl	%esi, %r8d	 ; index,
	leaq	.LC81(%rip), %rdx	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:71:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	movq	%r14, %r9	 ; indent_has_next,
	movq	%r13, %r8	 ; tmp181,
	movq	%r15, %rdx	 ; outfile,
	movq	%rbx, %rcx	 ; parameter,
	call	output_variable	 ;
	jmp	.L124	 ;
.L141:
 ; D:/TC/src/output.c:73:     ast_output(0, true, "body\n");
	movq	%r14, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	32(%rsp), %rdx	 ; %sfp,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:73:     ast_output(0, true, "body\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rcx	 ;, tmp150
	call	fwrite	 ;
.L126:
 ; D:/TC/src/output.c:75:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbp, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp193, statement
 ; D:/TC/src/output.c:75:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L118	 ;,
 ; D:/TC/src/output.c:76:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%r14, %r9	 ; indent_has_next,
	movq	%rdi, %r8	 ; _26,
	movq	%r15, %rdx	 ; outfile,
	call	output_statement	 ;
	jmp	.L126	 ;
.L120:
 ; D:/TC/src/output.c:34:             ast_output(0, false, "class\n");
	movq	%r14, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:34:             ast_output(0, false, "class\n");
	movq	%r15, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC82(%rip), %rcx	 ;, tmp151
	call	fwrite	 ;
 ; D:/TC/src/output.c:35:             output_class(code_member->content.class, outfile, indent + 1, indent_has_next);
	movq	160(%rsp), %rax	 ; indent, tmp235
	leaq	2(%rax), %rsi	 ;, _19
	movq	(%rbx), %rbx	 ; member_9->content.class, _20
 ; D:/TC/src/output.c:119:     ast_output(0, false, "name\n");
	movq	%r14, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; _19,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:119:     ast_output(0, false, "name\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rcx	 ;, tmp152
	call	fwrite	 ;
 ; D:/TC/src/output.c:120:     output_name(class->name, outfile, indent + 1, indent_has_next);
	movq	160(%rsp), %rax	 ; indent, tmp237
	addq	$3, %rax	 ;, _38
	movq	%rax, 40(%rsp)	 ; _38, %sfp
	movq	(%rbx), %rcx	 ; _20->name, _20->name
	movq	%r14, %r9	 ; indent_has_next,
	movq	%rax, %r8	 ; _38,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:/TC/src/output.c:121:     ast_output(0, true, "members\n");
	movq	%r14, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rsi, %rdx	 ; _19,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:121:     ast_output(0, true, "members\n");
	movq	%r15, %r9	 ; outfile,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC83(%rip), %rcx	 ;, tmp154
	call	fwrite	 ;
 ; D:/TC/src/output.c:122:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rbx), %rcx	 ; _20->members, _20->members
	call	list_copy	 ;
	movq	%rax, 32(%rsp)	 ; tmp194, %sfp
 ; D:/TC/src/output.c:124:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	jmp	.L128	 ;
.L129:
 ; D:/TC/src/output.c:104:             ast_output(0, false, "method\n");
	movq	%r14, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:104:             ast_output(0, false, "method\n");
	movq	%r15, %r9	 ; outfile,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC84(%rip), %rcx	 ;,
	call	fwrite	 ;
 ; D:/TC/src/output.c:105:             output_method(class_member->content.method, outfile, indent + 1, indent_has_next);
	movq	160(%rsp), %rax	 ; indent, tmp239
	leaq	4(%rax), %rsi	 ;, _44
	movq	%rsi, 48(%rsp)	 ; _44, %sfp
	movq	(%rbx), %rbx	 ; member_42->content.method, _45
 ; D:/TC/src/output.c:81:     ast_output(0, false, "name\n");
	movq	%r14, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; _44,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:81:     ast_output(0, false, "name\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rcx	 ;, tmp157
	call	fwrite	 ;
 ; D:/TC/src/output.c:82:     output_name(method->name, outfile, indent + 1, indent_has_next);
	movq	160(%rsp), %rax	 ; indent, tmp240
	leaq	5(%rax), %rdi	 ;, _49
	movq	(%rbx), %rcx	 ; _45->name, _45->name
	movq	%r14, %r9	 ; indent_has_next,
	movq	%rdi, %r8	 ; _49,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:/TC/src/output.c:83:     ast_output(0, false, "return_type\n");
	movq	%r14, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; _44,
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
	movq	%r14, %r9	 ; indent_has_next,
	movq	%rdi, %r8	 ; _49,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:/TC/src/output.c:85:     ast_output(0, false, "parameters\n");
	movq	%r14, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; _44,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:85:     ast_output(0, false, "parameters\n");
	movq	%r15, %r9	 ; outfile,
	movl	$11, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC80(%rip), %rcx	 ;, tmp161
	call	fwrite	 ;
 ; D:/TC/src/output.c:86:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%rbx), %rcx	 ; _45->parameters, _45->parameters
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp195, parameters
 ; D:/TC/src/output.c:87:     list(Statement*) body = list_copy(method->body);
	movq	24(%rbx), %rcx	 ; _45->body, _45->body
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp196, body
 ; D:/TC/src/output.c:89:     int index = -1;
	movl	$-1, %esi	 ;, index
 ; D:/TC/src/output.c:92:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	movq	160(%rsp), %rax	 ; indent, tmp241
	leaq	6(%rax), %r13	 ;, tmp176
 ; D:/TC/src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	jmp	.L132	 ;
.L133:
 ; D:/TC/src/output.c:91:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	%r14, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; _49,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:91:         ast_output(1, false, "parameters[%d]\n", ++index);
	addl	$1, %esi	 ;, index
	movl	%esi, %r8d	 ; index,
	leaq	.LC81(%rip), %rdx	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:92:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	movq	%r14, %r9	 ; indent_has_next,
	movq	%r13, %r8	 ; tmp176,
	movq	%r15, %rdx	 ; outfile,
	movq	%rbx, %rcx	 ; parameter,
	call	output_variable	 ;
.L132:
 ; D:/TC/src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%r12, %rcx	 ; parameters,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp197, parameter
 ; D:/TC/src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	 ; parameter
	jne	.L133	 ;,
 ; D:/TC/src/output.c:94:     ast_output(0, true, "body\n");
	movq	%r14, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	48(%rsp), %rdx	 ; %sfp,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:94:     ast_output(0, true, "body\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rcx	 ;, tmp166
	call	fwrite	 ;
 ; D:/TC/src/output.c:96:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L134	 ;
.L135:
 ; D:/TC/src/output.c:97:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%r14, %r9	 ; indent_has_next,
	movq	%rdi, %r8	 ; _49,
	movq	%r15, %rdx	 ; outfile,
	call	output_statement	 ;
.L134:
 ; D:/TC/src/output.c:96:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbp, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp198, statement
 ; D:/TC/src/output.c:96:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L135	 ;,
.L128:
 ; D:/TC/src/output.c:124:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	movq	32(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp199, member
 ; D:/TC/src/output.c:124:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	 ; member
	je	.L118	 ;,
 ; D:/TC/src/output.c:102:     switch (class_member->type) {
	movl	8(%rbx), %eax	 ; member_42->type, _43
 ; D:/TC/src/output.c:102:     switch (class_member->type) {
	testl	%eax, %eax	 ; _43
	je	.L129	 ;,
	cmpl	$1, %eax	 ;, _43
	je	.L130	 ;,
 ; D:/TC/src/output.c:112:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movq	%r14, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:112:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movl	8(%rbx), %r8d	 ; member_42->type,
	leaq	.LC86(%rip), %rdx	 ;, tmp171
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:113:             break;
	jmp	.L128	 ;
.L130:
 ; D:/TC/src/output.c:108:             ast_output(0, false, "variable\n");
	movq	%r14, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:108:             ast_output(0, false, "variable\n");
	movq	%r15, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC85(%rip), %rcx	 ;, tmp167
	call	fwrite	 ;
 ; D:/TC/src/output.c:109:             output_variable(class_member->content.variable, outfile, indent + 1, indent_has_next);
	movq	(%rbx), %rcx	 ; member_42->content.variable, member_42->content.variable
	movq	%r14, %r9	 ; indent_has_next,
	movq	160(%rsp), %rax	 ; indent, tmp242
	leaq	4(%rax), %r8	 ;,
	movq	%r15, %rdx	 ; outfile,
	call	output_variable	 ;
 ; D:/TC/src/output.c:110:             break;
	jmp	.L128	 ;
.L121:
 ; D:/TC/src/output.c:38:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movq	%r14, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:38:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movl	8(%rbx), %r8d	 ; member_9->type,
	leaq	.LC87(%rip), %rdx	 ;, tmp173
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
.L118:
 ; D:/TC/src/output.c:47:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	movq	56(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp200, member
 ; D:/TC/src/output.c:47:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	 ; member
	je	.L142	 ;,
 ; D:/TC/src/output.c:48:         output_code_member(member, outfile, indent + 1, indent_has_next);
	movq	160(%rsp), %rax	 ; indent, tmp228
	leaq	1(%rax), %rdx	 ;, _2
 ; D:/TC/src/output.c:24:     switch (code_member->type) {
	movl	8(%rbx), %eax	 ; member_9->type, _14
 ; D:/TC/src/output.c:24:     switch (code_member->type) {
	cmpl	$1, %eax	 ;, _14
	je	.L119	 ;,
	cmpl	$2, %eax	 ;, _14
	je	.L120	 ;,
	testl	%eax, %eax	 ; _14
	jne	.L121	 ;,
 ; D:/TC/src/output.c:26:             ast_output(0, false, "import\n");
	movq	%r14, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:26:             ast_output(0, false, "import\n");
	movq	%r15, %r9	 ; outfile,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC78(%rip), %rcx	 ;, tmp135
	call	fwrite	 ;
 ; D:/TC/src/output.c:27:             output_import(code_member->content.import, outfile, indent + 1, indent_has_next);
	movq	160(%rsp), %rax	 ; indent, tmp229
	leaq	2(%rax), %rsi	 ;, _15
	movq	(%rbx), %rbx	 ; member_9->content.import, _16
 ; D:/TC/src/output.c:53:     ast_output(0, false, "name\n");
	movq	%r14, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; _15,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:53:     ast_output(0, false, "name\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rcx	 ;, tmp136
	call	fwrite	 ;
 ; D:/TC/src/output.c:54:     output_name(import->name, outfile, indent + 1, indent_has_next);
	movq	(%rbx), %rcx	 ; _16->name, _16->name
	movq	%r14, %r9	 ; indent_has_next,
	movq	160(%rsp), %rax	 ; indent, tmp230
	leaq	3(%rax), %r8	 ;,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:/TC/src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	%r14, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rsi, %rdx	 ; _15,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:/TC/src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	8(%rbx), %rax	 ; _16->source, _24
 ; D:/TC/src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	testq	%rax, %rax	 ; _24
 ; D:/TC/src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	leaq	.LC77(%rip), %r8	 ;, tmp174
	cmovne	%rax, %r8	 ; _24,,
	leaq	.LC79(%rip), %rdx	 ;, tmp139
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:57: }
	jmp	.L118	 ;
.L142:
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
.LC88:
	.ascii "TAC: \"NULL\"\12\0"
.LC89:
	.ascii "TAC {\12\0"
.LC90:
	.ascii "designs: []\12\0"
.LC91:
	.ascii "designs: [\12\0"
.LC92:
	.ascii "NULL \0"
.LC93:
	.ascii "%s \0"
.LC94:
	.ascii "%zu \0"
.LC95:
	.ascii "{}\12\0"
.LC96:
	.ascii "{\12\0"
.LC97:
	.ascii "NULL\11\0"
.LC98:
	.ascii "%s\11\0"
.LC99:
	.ascii "%zu\12\0"
.LC100:
	.ascii "}\12\0"
.LC101:
	.ascii "]\12\0"
.LC102:
	.ascii "entry_point: \"NULL\"\12\0"
.LC103:
	.ascii "entry_point: %s\12\0"
.LC104:
	.ascii "global: []\12\0"
.LC105:
	.ascii "global: [\12\0"
.LC106:
	.ascii "subroutines: []\12\0"
.LC107:
	.ascii "subroutines: [\12\0"
.LC108:
	.ascii "NULL {\12\0"
.LC109:
	.ascii "%s {\12\0"
.LC110:
	.ascii "return_type: \"NULL\"\12\0"
.LC111:
	.ascii "return_type: %s\12\0"
.LC112:
	.ascii "parameters: []\12\0"
.LC113:
	.ascii "parameters: [\12\0"
.LC114:
	.ascii "local: []\12\0"
.LC115:
	.ascii "local: [\12\0"
.LC116:
	.ascii "instructions: []\12\0"
.LC117:
	.ascii "instructions: [\12\0"
.LC118:
	.ascii "add\11\0"
.LC119:
	.ascii "sub\11\0"
.LC120:
	.ascii "mul\11\0"
.LC121:
	.ascii "div\11\0"
.LC122:
	.ascii "mod\11\0"
.LC123:
	.ascii "eq \11\0"
.LC124:
	.ascii "ne \11\0"
.LC125:
	.ascii "lt \11\0"
.LC126:
	.ascii "gt \11\0"
.LC127:
	.ascii "le \11\0"
.LC128:
	.ascii "ge \11\0"
.LC129:
	.ascii "and\11\0"
.LC130:
	.ascii "or \11\0"
.LC131:
	.ascii "not\11\0"
.LC132:
	.ascii "assign\11\0"
.LC133:
	.ascii "get_attr\11\0"
.LC134:
	.ascii "get_elem\11\0"
.LC135:
	.ascii "param\11\0"
.LC136:
	.ascii "alloc\11\0"
.LC137:
	.ascii "jmp_c\11\0"
.LC138:
	.ascii "jmp\11\0"
.LC139:
	.ascii "ret\11\0"
.LC140:
	.ascii "call\11\0"
.LC141:
	.ascii "load\11\0"
.LC142:
	.ascii "store\11\0"
.LC143:
	.ascii "INST_NONE\12\0"
.LC144:
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
	pushq	%rbx	 ;
	subq	$72, %rsp	 ;,
	movq	%rcx, 144(%rsp)	 ; tmp324, tac
	movq	%rdx, %r15	 ; tmp325, outfile
	movq	%r8, %r14	 ; tmp326, indent
 ; D:/TC/src/output.c:422:     if (tac == NULL) {
	testq	%rcx, %rcx	 ;
	je	.L226	 ;,
 ; D:/TC/src/output.c:427:     tac_output(indent, "TAC {\n");
	movq	%r8, %rdx	 ; indent,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:427:     tac_output(indent, "TAC {\n");
	movq	%r15, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC89(%rip), %rcx	 ;, tmp176
	call	fwrite	 ;
 ; D:/TC/src/output.c:428:     if (list_is_empty(tac->attribute_tables))
	movq	144(%rsp), %rax	 ; tac, tmp377
	movq	(%rax), %rcx	 ; tac_32(D)->attribute_tables, tac_32(D)->attribute_tables
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:428:     if (list_is_empty(tac->attribute_tables))
	testb	%al, %al	 ; tmp327
	je	.L146	 ;,
 ; D:/TC/src/output.c:429:         tac_output(indent + 1, "designs: []\n");
	leaq	1(%r14), %rdx	 ;, tmp178
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:429:         tac_output(indent + 1, "designs: []\n");
	movq	%r15, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC90(%rip), %rcx	 ;, tmp179
	call	fwrite	 ;
.L147:
 ; D:/TC/src/output.c:437:     if (tac->entry_point == NULL)
	movq	144(%rsp), %rax	 ; tac, tmp379
	cmpq	$0, 8(%rax)	 ;, tac_32(D)->entry_point
	je	.L227	 ;,
 ; D:/TC/src/output.c:440:         tac_output(indent + 1, "entry_point: %s\n", tac->entry_point->name);
	leaq	1(%r14), %rdx	 ;, tmp206
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:440:         tac_output(indent + 1, "entry_point: %s\n", tac->entry_point->name);
	movq	144(%rsp), %rax	 ; tac, tmp380
	movq	8(%rax), %rax	 ; tac_32(D)->entry_point, tac_32(D)->entry_point
	movq	8(%rax), %r8	 ; _10->name,
	leaq	.LC103(%rip), %rdx	 ;, tmp209
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
.L161:
 ; D:/TC/src/output.c:441:     if (list_is_empty(tac->global_vars))
	movq	144(%rsp), %rax	 ; tac, tmp381
	movq	16(%rax), %rcx	 ; tac_32(D)->global_vars, tac_32(D)->global_vars
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:441:     if (list_is_empty(tac->global_vars))
	testb	%al, %al	 ; tmp331
	je	.L162	 ;,
 ; D:/TC/src/output.c:442:         tac_output(indent + 1, "global: []\n");
	leaq	1(%r14), %rdx	 ;, tmp211
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:442:         tac_output(indent + 1, "global: []\n");
	movq	%r15, %r9	 ; outfile,
	movl	$11, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC104(%rip), %rcx	 ;, tmp212
	call	fwrite	 ;
.L163:
 ; D:/TC/src/output.c:450:     if (list_is_empty(tac->subroutines))
	movq	144(%rsp), %rax	 ; tac, tmp382
	movq	24(%rax), %rcx	 ; tac_32(D)->subroutines, tac_32(D)->subroutines
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:450:     if (list_is_empty(tac->subroutines))
	testb	%al, %al	 ; tmp333
	je	.L166	 ;,
 ; D:/TC/src/output.c:451:         tac_output(indent + 1, "subroutines: []\n");
	leaq	1(%r14), %rdx	 ;, tmp218
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:451:         tac_output(indent + 1, "subroutines: []\n");
	movq	%r15, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC106(%rip), %rcx	 ;, tmp219
	call	fwrite	 ;
	jmp	.L167	 ;
.L226:
 ; D:/TC/src/output.c:423:         tac_output(indent, "TAC: \"NULL\"\n");
	movq	%r8, %rdx	 ; indent,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:423:         tac_output(indent, "TAC: \"NULL\"\n");
	movq	%r15, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC88(%rip), %rcx	 ;, tmp175
	call	fwrite	 ;
 ; D:/TC/src/output.c:425:         return;
	jmp	.L143	 ;
.L146:
 ; D:/TC/src/output.c:431:         tac_output(indent + 1, "designs: [\n");
	leaq	1(%r14), %rbx	 ;, _4
	movq	%rbx, %rdx	 ; _4,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:431:         tac_output(indent + 1, "designs: [\n");
	movq	%r15, %r9	 ; outfile,
	movl	$11, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC91(%rip), %rcx	 ;, tmp180
	call	fwrite	 ;
 ; D:/TC/src/output.c:656:         tac_output(indent, "%s ", attribute_table->name->name);
	leaq	.LC93(%rip), %rdi	 ;, tmp321
 ; D:/TC/src/output.c:679:         tac_output(indent, "%s\t", attribute->type->name);
	leaq	.LC98(%rip), %rbp	 ;, tmp322
 ; D:/TC/src/output.c:433:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	jmp	.L148	 ;
.L232:
 ; D:/TC/src/output.c:654:         tac_output(indent, "NULL ");
	movq	%r13, %rdx	 ; _5,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:654:         tac_output(indent, "NULL ");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC92(%rip), %rcx	 ;, tmp181
	call	fwrite	 ;
	jmp	.L150	 ;
.L151:
 ; D:/TC/src/output.c:661:         tac_output(0, "{\n");
	movl	$0, %edx	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:661:         tac_output(0, "{\n");
	movq	%r15, %r9	 ; outfile,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC96(%rip), %rcx	 ;, tmp189
	call	fwrite	 ;
 ; D:/TC/src/output.c:663:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	jmp	.L153	 ;
.L229:
 ; D:/TC/src/output.c:677:         tac_output(indent, "NULL\t");
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:677:         tac_output(indent, "NULL\t");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC97(%rip), %rcx	 ;,
	call	fwrite	 ;
	jmp	.L155	 ;
.L230:
 ; D:/TC/src/output.c:681:         tac_output(0, "NULL ");
	movl	$0, %edx	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:681:         tac_output(0, "NULL ");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC92(%rip), %rcx	 ;, tmp194
	call	fwrite	 ;
.L157:
 ; D:/TC/src/output.c:684:     tac_output(0, "%zu\n", attribute->offset);
	movl	$0, %edx	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:684:     tac_output(0, "%zu\n", attribute->offset);
	movq	16(%rsi), %r8	 ; attribute_83->offset,
	leaq	.LC99(%rip), %rdx	 ;, tmp199
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
.L153:
 ; D:/TC/src/output.c:663:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	movq	(%r12), %rcx	 ; attribute_table_42->attributes, attribute_table_42->attributes
	call	list_pop	 ;
	movq	%rax, %rsi	 ; tmp329, attribute
 ; D:/TC/src/output.c:663:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	testq	%rax, %rax	 ; attribute
	je	.L228	 ;,
 ; D:/TC/src/output.c:664:             output_attribute(attribute, outfile, indent + 1);
	leaq	3(%r14), %rdx	 ;, _82
 ; D:/TC/src/output.c:676:     if (attribute->type == NULL)
	cmpq	$0, 8(%rsi)	 ;, attribute_83->type
	je	.L229	 ;,
 ; D:/TC/src/output.c:679:         tac_output(indent, "%s\t", attribute->type->name);
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:679:         tac_output(indent, "%s\t", attribute->type->name);
	movq	8(%rsi), %rax	 ; attribute_83->type, attribute_83->type
	movq	8(%rax), %r8	 ; _86->name,
	movq	%rbp, %rdx	 ; tmp322,
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
.L155:
 ; D:/TC/src/output.c:680:     if (attribute->var == NULL)
	cmpq	$0, (%rsi)	 ;, attribute_83->var
	je	.L230	 ;,
 ; D:/TC/src/output.c:683:         tac_output(0, "%s ", attribute->var->name);
	movl	$0, %edx	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:683:         tac_output(0, "%s ", attribute->var->name);
	movq	(%rsi), %rax	 ; attribute_83->var, attribute_83->var
	movq	8(%rax), %r8	 ; _89->name,
	movq	%rdi, %rdx	 ; tmp321,
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
	jmp	.L157	 ;
.L228:
 ; D:/TC/src/output.c:665:         tac_output(indent, "}\n");
	movq	%r13, %rdx	 ; _5,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:665:         tac_output(indent, "}\n");
	movq	%r15, %r9	 ; outfile,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC100(%rip), %rcx	 ;, tmp201
	call	fwrite	 ;
.L148:
 ; D:/TC/src/output.c:433:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	movq	144(%rsp), %rax	 ; tac, tmp378
	movq	(%rax), %rcx	 ; tac_32(D)->attribute_tables, tac_32(D)->attribute_tables
	call	list_pop	 ;
	movq	%rax, %r12	 ; tmp330, attribute_table
 ; D:/TC/src/output.c:433:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	testq	%rax, %rax	 ; attribute_table
	je	.L231	 ;,
 ; D:/TC/src/output.c:434:             output_attribute_table(attribute_table, outfile, indent + 2);
	leaq	2(%r14), %r13	 ;, _5
 ; D:/TC/src/output.c:653:     if (attribute_table->name == NULL)
	cmpq	$0, 8(%r12)	 ;, attribute_table_42->name
	je	.L232	 ;,
 ; D:/TC/src/output.c:656:         tac_output(indent, "%s ", attribute_table->name->name);
	movq	%r13, %rdx	 ; _5,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:656:         tac_output(indent, "%s ", attribute_table->name->name);
	movq	8(%r12), %rax	 ; attribute_table_42->name, attribute_table_42->name
	movq	8(%rax), %r8	 ; _77->name,
	movq	%rdi, %rdx	 ; tmp321,
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
.L150:
 ; D:/TC/src/output.c:657:     tac_output(0, "%zu ", attribute_table->size);
	movl	$0, %edx	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:657:     tac_output(0, "%zu ", attribute_table->size);
	movq	16(%r12), %r8	 ; attribute_table_42->size,
	leaq	.LC94(%rip), %rdx	 ;, tmp186
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:658:     if (list_is_empty(attribute_table->attributes))
	movq	(%r12), %rcx	 ; attribute_table_42->attributes, attribute_table_42->attributes
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:658:     if (list_is_empty(attribute_table->attributes))
	testb	%al, %al	 ; tmp328
	je	.L151	 ;,
 ; D:/TC/src/output.c:659:         tac_output(0, "{}\n");
	movl	$0, %edx	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:659:         tac_output(0, "{}\n");
	movq	%r15, %r9	 ; outfile,
	movl	$3, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC95(%rip), %rcx	 ;, tmp188
	call	fwrite	 ;
	jmp	.L148	 ;
.L231:
 ; D:/TC/src/output.c:435:         tac_output(indent + 1, "]\n");
	movq	%rbx, %rdx	 ; _4,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:435:         tac_output(indent + 1, "]\n");
	movq	%r15, %r9	 ; outfile,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC101(%rip), %rcx	 ;, tmp203
	call	fwrite	 ;
	jmp	.L147	 ;
.L227:
 ; D:/TC/src/output.c:438:         tac_output(indent + 1, "entry_point: \"NULL\"\n");
	leaq	1(%r14), %rdx	 ;, tmp204
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:438:         tac_output(indent + 1, "entry_point: \"NULL\"\n");
	movq	%r15, %r9	 ; outfile,
	movl	$20, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC102(%rip), %rcx	 ;, tmp205
	call	fwrite	 ;
	jmp	.L161	 ;
.L162:
 ; D:/TC/src/output.c:444:         tac_output(indent + 1, "global: [\n");
	leaq	1(%r14), %rsi	 ;, _15
	movq	%rsi, %rdx	 ; _15,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:444:         tac_output(indent + 1, "global: [\n");
	movq	%r15, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC105(%rip), %rcx	 ;, tmp213
	call	fwrite	 ;
 ; D:/TC/src/output.c:447:             output_var(var, outfile, indent + 2);
	leaq	2(%r14), %rbx	 ;, tmp317
	movq	144(%rsp), %rdi	 ; tac, tac
.L164:
 ; D:/TC/src/output.c:446:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	movq	16(%rdi), %rcx	 ; tac_32(D)->global_vars, tac_32(D)->global_vars
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp332, var
 ; D:/TC/src/output.c:446:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	testq	%rax, %rax	 ; var
	je	.L233	 ;,
 ; D:/TC/src/output.c:447:             output_var(var, outfile, indent + 2);
	movq	%rbx, %r8	 ; tmp317,
	movq	%r15, %rdx	 ; outfile,
	call	output_var	 ;
	jmp	.L164	 ;
.L233:
 ; D:/TC/src/output.c:448:         tac_output(indent + 1, "]\n");
	movq	%rsi, %rdx	 ; _15,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:448:         tac_output(indent + 1, "]\n");
	movq	%r15, %r9	 ; outfile,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC101(%rip), %rcx	 ;, tmp216
	call	fwrite	 ;
	jmp	.L163	 ;
.L166:
 ; D:/TC/src/output.c:453:         tac_output(indent + 1, "subroutines: [\n");
	leaq	1(%r14), %rbp	 ;, _21
	movq	%rbp, %rdx	 ; _21,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:453:         tac_output(indent + 1, "subroutines: [\n");
	movq	%r15, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC107(%rip), %rcx	 ;, tmp220
	call	fwrite	 ;
 ; D:/TC/src/output.c:570:     switch (instruction->type) {
	leaq	.L191(%rip), %r13	 ;, tmp314
	movq	%rbp, 56(%rsp)	 ; _21, %sfp
 ; D:/TC/src/output.c:455:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	jmp	.L168	 ;
.L240:
 ; D:/TC/src/output.c:470:         tac_output(indent, "NULL {\n");
	movq	%rbp, %rdx	 ; _22,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:470:         tac_output(indent, "NULL {\n");
	movq	%r15, %r9	 ; outfile,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC108(%rip), %rcx	 ;, tmp221
	call	fwrite	 ;
	jmp	.L170	 ;
.L241:
 ; D:/TC/src/output.c:474:         tac_output(indent + 1, "return_type: \"NULL\"\n");
	leaq	3(%r14), %rdx	 ;, tmp225
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:474:         tac_output(indent + 1, "return_type: \"NULL\"\n");
	movq	%r15, %r9	 ; outfile,
	movl	$20, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC110(%rip), %rcx	 ;, tmp226
	call	fwrite	 ;
	jmp	.L172	 ;
.L173:
 ; D:/TC/src/output.c:480:         tac_output(indent + 1, "parameters: [\n");
	leaq	3(%r14), %rsi	 ;, _103
	movq	%rsi, %rdx	 ; _103,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:480:         tac_output(indent + 1, "parameters: [\n");
	movq	%r15, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC113(%rip), %rcx	 ;, tmp234
	call	fwrite	 ;
 ; D:/TC/src/output.c:483:             output_var(parameter, outfile, indent + 2);
	leaq	4(%r14), %rbx	 ;, tmp313
.L175:
 ; D:/TC/src/output.c:482:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	movq	16(%rdi), %rcx	 ; subroutine_66->parameters, subroutine_66->parameters
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp335, parameter
 ; D:/TC/src/output.c:482:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	je	.L234	 ;,
 ; D:/TC/src/output.c:483:             output_var(parameter, outfile, indent + 2);
	movq	%rbx, %r8	 ; tmp313,
	movq	%r15, %rdx	 ; outfile,
	call	output_var	 ;
	jmp	.L175	 ;
.L234:
 ; D:/TC/src/output.c:484:         tac_output(indent + 1, "]\n");
	movq	%rsi, %rdx	 ; _103,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:484:         tac_output(indent + 1, "]\n");
	movq	%r15, %r9	 ; outfile,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC101(%rip), %rcx	 ;, tmp237
	call	fwrite	 ;
	jmp	.L174	 ;
.L177:
 ; D:/TC/src/output.c:489:         tac_output(indent + 1, "local: [\n");
	leaq	3(%r14), %rsi	 ;, _110
	movq	%rsi, %rdx	 ; _110,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:489:         tac_output(indent + 1, "local: [\n");
	movq	%r15, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC115(%rip), %rcx	 ;, tmp241
	call	fwrite	 ;
 ; D:/TC/src/output.c:492:             output_var(var, outfile, indent + 2);
	leaq	4(%r14), %rbx	 ;, tmp312
.L179:
 ; D:/TC/src/output.c:491:         while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
	movq	24(%rdi), %rcx	 ; subroutine_66->local_vars, subroutine_66->local_vars
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp337, var
 ; D:/TC/src/output.c:491:         while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
	testq	%rax, %rax	 ; var
	je	.L235	 ;,
 ; D:/TC/src/output.c:492:             output_var(var, outfile, indent + 2);
	movq	%rbx, %r8	 ; tmp312,
	movq	%r15, %rdx	 ; outfile,
	call	output_var	 ;
	jmp	.L179	 ;
.L235:
 ; D:/TC/src/output.c:493:         tac_output(indent + 1, "]\n");
	movq	%rsi, %rdx	 ; _110,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:493:         tac_output(indent + 1, "]\n");
	movq	%r15, %r9	 ; outfile,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC101(%rip), %rcx	 ;, tmp244
	call	fwrite	 ;
	jmp	.L178	 ;
.L181:
 ; D:/TC/src/output.c:498:         tac_output(indent + 1, "instructions: [\n");
	leaq	3(%r14), %rbx	 ;, _117
	movq	%rbx, %rdx	 ; _117,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:498:         tac_output(indent + 1, "instructions: [\n");
	movq	%r15, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC117(%rip), %rcx	 ;, tmp248
	call	fwrite	 ;
	movq	%rbp, 40(%rsp)	 ; _22, %sfp
	movq	%rbx, 48(%rsp)	 ; _117, %sfp
 ; D:/TC/src/output.c:500:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	jmp	.L183	 ;
.L238:
 ; D:/TC/src/output.c:528:         tac_output(indent, "NULL ");
	movq	%rax, %rdx	 ; _118,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:528:         tac_output(indent, "NULL ");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC92(%rip), %rcx	 ;, tmp249
	call	fwrite	 ;
	jmp	.L185	 ;
.L186:
 ; D:/TC/src/output.c:534:         tac_output(0, "{\n");
	movl	$0, %edx	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:534:         tac_output(0, "{\n");
	movq	%r15, %r9	 ; outfile,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC96(%rip), %rcx	 ;, tmp255
	call	fwrite	 ;
 ; D:/TC/src/output.c:537:             output_instruction(instruction, outfile, indent + 1);
	leaq	5(%r14), %rbp	 ;, _126
	movl	$1, %r12d	 ;, tmp308
 ; D:/TC/src/output.c:536:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	jmp	.L188	 ;
.L216:
 ; D:/TC/src/output.c:571:         case INST_ADD: tac_output(indent, "add\t"); break;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:571:         case INST_ADD: tac_output(indent, "add\t"); break;
	movq	%r15, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC118(%rip), %rcx	 ;, tmp262
	call	fwrite	 ;
.L217:
 ; D:/TC/src/output.c:602:     output_arg(instruction->arg1, outfile);
	movq	(%rbx), %rcx	 ; instruction_127->arg1, instruction_127->arg1
	movq	%r15, %rdx	 ; outfile,
	call	output_arg	 ;
 ; D:/TC/src/output.c:603:     switch (instruction->type) {
	movl	24(%rbx), %ecx	 ; instruction_127->type, _132
 ; D:/TC/src/output.c:603:     switch (instruction->type) {
	cmpl	$24, %ecx	 ;, _132
	ja	.L188	 ;,
	movq	%r12, %rax	 ; tmp308, _150
	salq	%cl, %rax	 ; _132, _150
	testl	$4825087, %eax	 ;, _150
	jne	.L219	 ;,
	testl	$25583616, %eax	 ;, _150
	jne	.L220	 ;,
	testl	$3145728, %eax	 ;, _150
	jne	.L221	 ;,
	jmp	.L188	 ;
.L215:
 ; D:/TC/src/output.c:572:         case INST_SUB: tac_output(indent, "sub\t"); break;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:572:         case INST_SUB: tac_output(indent, "sub\t"); break;
	movq	%r15, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC119(%rip), %rcx	 ;, tmp263
	call	fwrite	 ;
 ; D:/TC/src/output.c:572:         case INST_SUB: tac_output(indent, "sub\t"); break;
	jmp	.L217	 ;
.L214:
 ; D:/TC/src/output.c:573:         case INST_MUL: tac_output(indent, "mul\t"); break;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:573:         case INST_MUL: tac_output(indent, "mul\t"); break;
	movq	%r15, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC120(%rip), %rcx	 ;, tmp264
	call	fwrite	 ;
 ; D:/TC/src/output.c:573:         case INST_MUL: tac_output(indent, "mul\t"); break;
	jmp	.L217	 ;
.L213:
 ; D:/TC/src/output.c:574:         case INST_DIV: tac_output(indent, "div\t"); break;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:574:         case INST_DIV: tac_output(indent, "div\t"); break;
	movq	%r15, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC121(%rip), %rcx	 ;, tmp265
	call	fwrite	 ;
 ; D:/TC/src/output.c:574:         case INST_DIV: tac_output(indent, "div\t"); break;
	jmp	.L217	 ;
.L212:
 ; D:/TC/src/output.c:575:         case INST_MOD: tac_output(indent, "mod\t"); break;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:575:         case INST_MOD: tac_output(indent, "mod\t"); break;
	movq	%r15, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC122(%rip), %rcx	 ;, tmp266
	call	fwrite	 ;
 ; D:/TC/src/output.c:575:         case INST_MOD: tac_output(indent, "mod\t"); break;
	jmp	.L217	 ;
.L211:
 ; D:/TC/src/output.c:576:         case INST_EQ: tac_output(indent, "eq \t"); break;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:576:         case INST_EQ: tac_output(indent, "eq \t"); break;
	movq	%r15, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC123(%rip), %rcx	 ;, tmp267
	call	fwrite	 ;
 ; D:/TC/src/output.c:576:         case INST_EQ: tac_output(indent, "eq \t"); break;
	jmp	.L217	 ;
.L210:
 ; D:/TC/src/output.c:577:         case INST_NE: tac_output(indent, "ne \t"); break;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:577:         case INST_NE: tac_output(indent, "ne \t"); break;
	movq	%r15, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC124(%rip), %rcx	 ;, tmp268
	call	fwrite	 ;
 ; D:/TC/src/output.c:577:         case INST_NE: tac_output(indent, "ne \t"); break;
	jmp	.L217	 ;
.L209:
 ; D:/TC/src/output.c:578:         case INST_LT: tac_output(indent, "lt \t"); break;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:578:         case INST_LT: tac_output(indent, "lt \t"); break;
	movq	%r15, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC125(%rip), %rcx	 ;, tmp269
	call	fwrite	 ;
 ; D:/TC/src/output.c:578:         case INST_LT: tac_output(indent, "lt \t"); break;
	jmp	.L217	 ;
.L208:
 ; D:/TC/src/output.c:579:         case INST_GT: tac_output(indent, "gt \t"); break;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:579:         case INST_GT: tac_output(indent, "gt \t"); break;
	movq	%r15, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC126(%rip), %rcx	 ;, tmp270
	call	fwrite	 ;
 ; D:/TC/src/output.c:579:         case INST_GT: tac_output(indent, "gt \t"); break;
	jmp	.L217	 ;
.L207:
 ; D:/TC/src/output.c:580:         case INST_LE: tac_output(indent, "le \t"); break;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:580:         case INST_LE: tac_output(indent, "le \t"); break;
	movq	%r15, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC127(%rip), %rcx	 ;, tmp271
	call	fwrite	 ;
 ; D:/TC/src/output.c:580:         case INST_LE: tac_output(indent, "le \t"); break;
	jmp	.L217	 ;
.L206:
 ; D:/TC/src/output.c:581:         case INST_GE: tac_output(indent, "ge \t"); break;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:581:         case INST_GE: tac_output(indent, "ge \t"); break;
	movq	%r15, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC128(%rip), %rcx	 ;, tmp272
	call	fwrite	 ;
 ; D:/TC/src/output.c:581:         case INST_GE: tac_output(indent, "ge \t"); break;
	jmp	.L217	 ;
.L205:
 ; D:/TC/src/output.c:582:         case INST_AND: tac_output(indent, "and\t"); break;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:582:         case INST_AND: tac_output(indent, "and\t"); break;
	movq	%r15, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC129(%rip), %rcx	 ;, tmp273
	call	fwrite	 ;
 ; D:/TC/src/output.c:582:         case INST_AND: tac_output(indent, "and\t"); break;
	jmp	.L217	 ;
.L204:
 ; D:/TC/src/output.c:583:         case INST_OR: tac_output(indent, "or \t"); break;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:583:         case INST_OR: tac_output(indent, "or \t"); break;
	movq	%r15, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC130(%rip), %rcx	 ;, tmp274
	call	fwrite	 ;
 ; D:/TC/src/output.c:583:         case INST_OR: tac_output(indent, "or \t"); break;
	jmp	.L217	 ;
.L203:
 ; D:/TC/src/output.c:584:         case INST_NOT: tac_output(indent, "not\t"); break;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:584:         case INST_NOT: tac_output(indent, "not\t"); break;
	movq	%r15, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC131(%rip), %rcx	 ;, tmp275
	call	fwrite	 ;
 ; D:/TC/src/output.c:584:         case INST_NOT: tac_output(indent, "not\t"); break;
	jmp	.L217	 ;
.L202:
 ; D:/TC/src/output.c:585:         case INST_ASSIGN: tac_output(indent, "assign\t"); break;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:585:         case INST_ASSIGN: tac_output(indent, "assign\t"); break;
	movq	%r15, %r9	 ; outfile,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC132(%rip), %rcx	 ;, tmp276
	call	fwrite	 ;
 ; D:/TC/src/output.c:585:         case INST_ASSIGN: tac_output(indent, "assign\t"); break;
	jmp	.L217	 ;
.L201:
 ; D:/TC/src/output.c:586:         case INST_GET_ATTR: tac_output(indent, "get_attr\t"); break;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:586:         case INST_GET_ATTR: tac_output(indent, "get_attr\t"); break;
	movq	%r15, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC133(%rip), %rcx	 ;, tmp277
	call	fwrite	 ;
 ; D:/TC/src/output.c:586:         case INST_GET_ATTR: tac_output(indent, "get_attr\t"); break;
	jmp	.L217	 ;
.L200:
 ; D:/TC/src/output.c:587:         case INST_GET_ELEM: tac_output(indent, "get_elem\t"); break;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:587:         case INST_GET_ELEM: tac_output(indent, "get_elem\t"); break;
	movq	%r15, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC134(%rip), %rcx	 ;, tmp278
	call	fwrite	 ;
 ; D:/TC/src/output.c:587:         case INST_GET_ELEM: tac_output(indent, "get_elem\t"); break;
	jmp	.L217	 ;
.L199:
 ; D:/TC/src/output.c:588:         case INST_PARAM: tac_output(indent, "param\t"); break;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:588:         case INST_PARAM: tac_output(indent, "param\t"); break;
	movq	%r15, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC135(%rip), %rcx	 ;, tmp279
	call	fwrite	 ;
 ; D:/TC/src/output.c:588:         case INST_PARAM: tac_output(indent, "param\t"); break;
	jmp	.L217	 ;
.L198:
 ; D:/TC/src/output.c:589:         case INST_ALLOC: tac_output(indent, "alloc\t"); break;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:589:         case INST_ALLOC: tac_output(indent, "alloc\t"); break;
	movq	%r15, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC136(%rip), %rcx	 ;, tmp280
	call	fwrite	 ;
 ; D:/TC/src/output.c:589:         case INST_ALLOC: tac_output(indent, "alloc\t"); break;
	jmp	.L217	 ;
.L197:
 ; D:/TC/src/output.c:590:         case INST_JMP_C: tac_output(indent, "jmp_c\t"); break;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:590:         case INST_JMP_C: tac_output(indent, "jmp_c\t"); break;
	movq	%r15, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC137(%rip), %rcx	 ;, tmp281
	call	fwrite	 ;
 ; D:/TC/src/output.c:590:         case INST_JMP_C: tac_output(indent, "jmp_c\t"); break;
	jmp	.L217	 ;
.L196:
 ; D:/TC/src/output.c:591:         case INST_JMP: tac_output(indent, "jmp\t"); break;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:591:         case INST_JMP: tac_output(indent, "jmp\t"); break;
	movq	%r15, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC138(%rip), %rcx	 ;, tmp282
	call	fwrite	 ;
 ; D:/TC/src/output.c:591:         case INST_JMP: tac_output(indent, "jmp\t"); break;
	jmp	.L217	 ;
.L195:
 ; D:/TC/src/output.c:592:         case INST_RET: tac_output(indent, "ret\t"); break;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:592:         case INST_RET: tac_output(indent, "ret\t"); break;
	movq	%r15, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC139(%rip), %rcx	 ;, tmp283
	call	fwrite	 ;
 ; D:/TC/src/output.c:592:         case INST_RET: tac_output(indent, "ret\t"); break;
	jmp	.L217	 ;
.L194:
 ; D:/TC/src/output.c:593:         case INST_CALL: tac_output(indent, "call\t"); break;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:593:         case INST_CALL: tac_output(indent, "call\t"); break;
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC140(%rip), %rcx	 ;, tmp284
	call	fwrite	 ;
 ; D:/TC/src/output.c:593:         case INST_CALL: tac_output(indent, "call\t"); break;
	jmp	.L217	 ;
.L193:
 ; D:/TC/src/output.c:594:         case INST_LOAD: tac_output(indent, "load\t"); break;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:594:         case INST_LOAD: tac_output(indent, "load\t"); break;
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC141(%rip), %rcx	 ;, tmp285
	call	fwrite	 ;
 ; D:/TC/src/output.c:594:         case INST_LOAD: tac_output(indent, "load\t"); break;
	jmp	.L217	 ;
.L192:
 ; D:/TC/src/output.c:595:         case INST_STORE: tac_output(indent, "store\t"); break;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:595:         case INST_STORE: tac_output(indent, "store\t"); break;
	movq	%r15, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC142(%rip), %rcx	 ;, tmp286
	call	fwrite	 ;
 ; D:/TC/src/output.c:595:         case INST_STORE: tac_output(indent, "store\t"); break;
	jmp	.L217	 ;
.L190:
 ; D:/TC/src/output.c:596:         case INST_NONE: tac_output(indent, "INST_NONE\n"); return;
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:596:         case INST_NONE: tac_output(indent, "INST_NONE\n"); return;
	movq	%r15, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC143(%rip), %rcx	 ;, tmp287
	call	fwrite	 ;
 ; D:/TC/src/output.c:596:         case INST_NONE: tac_output(indent, "INST_NONE\n"); return;
	jmp	.L188	 ;
.L189:
 ; D:/TC/src/output.c:598:             tac_output(indent, "unknown_InstructionType: %u\n", instruction->type);
	movq	%rbp, %rdx	 ; _126,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:598:             tac_output(indent, "unknown_InstructionType: %u\n", instruction->type);
	movl	24(%rbx), %r8d	 ; instruction_127->type,
	leaq	.LC144(%rip), %rdx	 ;, tmp289
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:/TC/src/output.c:600:             return;
	jmp	.L188	 ;
.L219:
 ; D:/TC/src/output.c:621:             tac_output(0, " ");
	movl	$0, %edx	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:621:             tac_output(0, " ");
	movq	%r15, %rdx	 ; outfile,
	movl	$32, %ecx	 ;,
	call	fputc	 ;
 ; D:/TC/src/output.c:622:             output_arg(instruction->arg2, outfile);
	movq	8(%rbx), %rcx	 ; instruction_127->arg2, instruction_127->arg2
	movq	%r15, %rdx	 ; outfile,
	call	output_arg	 ;
 ; D:/TC/src/output.c:623:             tac_output(0, " ");
	movl	$0, %edx	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:623:             tac_output(0, " ");
	movq	%r15, %rdx	 ; outfile,
	movl	$32, %ecx	 ;,
	call	fputc	 ;
 ; D:/TC/src/output.c:624:             output_arg(instruction->arg3, outfile);
	movq	16(%rbx), %rcx	 ; instruction_127->arg3, instruction_127->arg3
	movq	%r15, %rdx	 ; outfile,
	call	output_arg	 ;
.L221:
 ; D:/TC/src/output.c:643:     tac_output(0, "\n");
	movl	$0, %edx	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:643:     tac_output(0, "\n");
	movq	%r15, %rdx	 ; outfile,
	movl	$10, %ecx	 ;,
	call	fputc	 ;
.L188:
 ; D:/TC/src/output.c:536:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	movq	8(%rsi), %rcx	 ; block_119->instructions, block_119->instructions
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp340, instruction
 ; D:/TC/src/output.c:536:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	testq	%rax, %rax	 ; instruction
	je	.L236	 ;,
 ; D:/TC/src/output.c:570:     switch (instruction->type) {
	cmpl	$25, 24(%rbx)	 ;, instruction_127->type
	ja	.L189	 ;,
	movl	24(%rbx), %eax	 ; instruction_127->type, instruction_127->type
	movslq	0(%r13,%rax,4), %rax	 ;, tmp259
	addq	%r13, %rax	 ; tmp314, tmp260
	jmp	*%rax	 ; tmp260
	.section .rdata,"dr"
	.align 4
.L191:
	.long	.L216-.L191
	.long	.L215-.L191
	.long	.L214-.L191
	.long	.L213-.L191
	.long	.L212-.L191
	.long	.L211-.L191
	.long	.L210-.L191
	.long	.L209-.L191
	.long	.L208-.L191
	.long	.L207-.L191
	.long	.L206-.L191
	.long	.L205-.L191
	.long	.L204-.L191
	.long	.L203-.L191
	.long	.L202-.L191
	.long	.L201-.L191
	.long	.L200-.L191
	.long	.L199-.L191
	.long	.L198-.L191
	.long	.L197-.L191
	.long	.L196-.L191
	.long	.L195-.L191
	.long	.L194-.L191
	.long	.L193-.L191
	.long	.L192-.L191
	.long	.L190-.L191
	.text
.L220:
 ; D:/TC/src/output.c:632:             tac_output(0, " ");
	movl	$0, %edx	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:632:             tac_output(0, " ");
	movq	%r15, %rdx	 ; outfile,
	movl	$32, %ecx	 ;,
	call	fputc	 ;
 ; D:/TC/src/output.c:633:             output_arg(instruction->arg2, outfile);
	movq	8(%rbx), %rcx	 ; instruction_127->arg2, instruction_127->arg2
	movq	%r15, %rdx	 ; outfile,
	call	output_arg	 ;
 ; D:/TC/src/output.c:634:             break;
	jmp	.L221	 ;
.L236:
 ; D:/TC/src/output.c:538:         tac_output(indent, "}\n");
	movq	32(%rsp), %rdx	 ; %sfp,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:538:         tac_output(indent, "}\n");
	movq	%r15, %r9	 ; outfile,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC100(%rip), %rcx	 ;, tmp299
	call	fwrite	 ;
.L183:
 ; D:/TC/src/output.c:500:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	movq	32(%rdi), %rcx	 ; subroutine_66->blocks, subroutine_66->blocks
	call	list_pop	 ;
	movq	%rax, %rsi	 ; tmp341, block
 ; D:/TC/src/output.c:500:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	testq	%rax, %rax	 ; block
	je	.L237	 ;,
 ; D:/TC/src/output.c:501:             output_block(block, outfile, indent + 2);
	leaq	4(%r14), %rax	 ;, _118
	movq	%rax, 32(%rsp)	 ; _118, %sfp
 ; D:/TC/src/output.c:527:     if (block->label == NULL)
	cmpq	$0, (%rsi)	 ;, block_119->label
	je	.L238	 ;,
 ; D:/TC/src/output.c:530:         tac_output(indent, "%s ", block->label->name);
	movq	32(%rsp), %rdx	 ; %sfp,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:530:         tac_output(indent, "%s ", block->label->name);
	movq	(%rsi), %rax	 ; block_119->label, block_119->label
	movq	8(%rax), %r8	 ; _122->name,
	leaq	.LC93(%rip), %rdx	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
.L185:
 ; D:/TC/src/output.c:531:     if (list_is_empty(block->instructions))
	movq	8(%rsi), %rcx	 ; block_119->instructions, block_119->instructions
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:531:     if (list_is_empty(block->instructions))
	testb	%al, %al	 ; tmp339
	je	.L186	 ;,
 ; D:/TC/src/output.c:532:         tac_output(0, "{}\n");
	movl	$0, %edx	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:532:         tac_output(0, "{}\n");
	movq	%r15, %r9	 ; outfile,
	movl	$3, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC95(%rip), %rcx	 ;, tmp254
	call	fwrite	 ;
	jmp	.L183	 ;
.L237:
 ; D:/TC/src/output.c:502:         tac_output(indent + 1, "]\n");
	movq	40(%rsp), %rbp	 ; %sfp, _22
	movq	48(%rsp), %rbx	 ; %sfp, _117
	movq	%rbx, %rdx	 ; _117,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:502:         tac_output(indent + 1, "]\n");
	movq	%r15, %r9	 ; outfile,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC101(%rip), %rcx	 ;, tmp301
	call	fwrite	 ;
.L182:
 ; D:/TC/src/output.c:504:     tac_output(indent, "}\n");
	movq	%rbp, %rdx	 ; _22,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:504:     tac_output(indent, "}\n");
	movq	%r15, %r9	 ; outfile,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC100(%rip), %rcx	 ;, tmp302
	call	fwrite	 ;
.L168:
 ; D:/TC/src/output.c:455:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	movq	144(%rsp), %rax	 ; tac, tmp385
	movq	24(%rax), %rcx	 ; tac_32(D)->subroutines, tac_32(D)->subroutines
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp342, subroutine
 ; D:/TC/src/output.c:455:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	testq	%rax, %rax	 ; subroutine
	je	.L239	 ;,
 ; D:/TC/src/output.c:456:             output_subroutine(subroutine, outfile, indent + 2);
	leaq	2(%r14), %rbp	 ;, _22
 ; D:/TC/src/output.c:469:     if (subroutine->name == NULL)
	cmpq	$0, (%rdi)	 ;, subroutine_66->name
	je	.L240	 ;,
 ; D:/TC/src/output.c:472:         tac_output(indent, "%s {\n", subroutine->name->name);
	movq	%rbp, %rdx	 ; _22,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:472:         tac_output(indent, "%s {\n", subroutine->name->name);
	movq	(%rdi), %rax	 ; subroutine_66->name, subroutine_66->name
	movq	8(%rax), %r8	 ; _93->name,
	leaq	.LC109(%rip), %rdx	 ;, tmp224
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
.L170:
 ; D:/TC/src/output.c:473:     if (subroutine->return_type == NULL)
	cmpq	$0, 8(%rdi)	 ;, subroutine_66->return_type
	je	.L241	 ;,
 ; D:/TC/src/output.c:476:         tac_output(indent + 1, "return_type: %s\n", subroutine->return_type->name);
	leaq	3(%r14), %rdx	 ;, tmp227
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:476:         tac_output(indent + 1, "return_type: %s\n", subroutine->return_type->name);
	movq	8(%rdi), %rax	 ; subroutine_66->return_type, subroutine_66->return_type
	movq	8(%rax), %r8	 ; _98->name,
	leaq	.LC111(%rip), %rdx	 ;, tmp230
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
.L172:
 ; D:/TC/src/output.c:477:     if (list_is_empty(subroutine->parameters))
	movq	16(%rdi), %rcx	 ; subroutine_66->parameters, subroutine_66->parameters
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:477:     if (list_is_empty(subroutine->parameters))
	testb	%al, %al	 ; tmp334
	je	.L173	 ;,
 ; D:/TC/src/output.c:478:         tac_output(indent + 1, "parameters: []\n");
	leaq	3(%r14), %rdx	 ;, tmp232
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:478:         tac_output(indent + 1, "parameters: []\n");
	movq	%r15, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC112(%rip), %rcx	 ;, tmp233
	call	fwrite	 ;
.L174:
 ; D:/TC/src/output.c:486:     if (list_is_empty(subroutine->local_vars))
	movq	24(%rdi), %rcx	 ; subroutine_66->local_vars, subroutine_66->local_vars
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:486:     if (list_is_empty(subroutine->local_vars))
	testb	%al, %al	 ; tmp336
	je	.L177	 ;,
 ; D:/TC/src/output.c:487:         tac_output(indent + 1, "local: []\n");
	leaq	3(%r14), %rdx	 ;, tmp239
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:487:         tac_output(indent + 1, "local: []\n");
	movq	%r15, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC114(%rip), %rcx	 ;, tmp240
	call	fwrite	 ;
.L178:
 ; D:/TC/src/output.c:495:     if (list_is_empty(subroutine->blocks))
	movq	32(%rdi), %rcx	 ; subroutine_66->blocks, subroutine_66->blocks
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:495:     if (list_is_empty(subroutine->blocks))
	testb	%al, %al	 ; tmp338
	je	.L181	 ;,
 ; D:/TC/src/output.c:496:         tac_output(indent + 1, "instructions: []\n");
	leaq	3(%r14), %rdx	 ;, tmp246
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:496:         tac_output(indent + 1, "instructions: []\n");
	movq	%r15, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC116(%rip), %rcx	 ;, tmp247
	call	fwrite	 ;
	jmp	.L182	 ;
.L239:
 ; D:/TC/src/output.c:457:         tac_output(indent + 1, "]\n");
	movq	56(%rsp), %rbp	 ; %sfp, _21
	movq	%rbp, %rdx	 ; _21,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:457:         tac_output(indent + 1, "]\n");
	movq	%r15, %r9	 ; outfile,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC101(%rip), %rcx	 ;, tmp304
	call	fwrite	 ;
.L167:
 ; D:/TC/src/output.c:459:     tac_output(indent, "}\n");
	movq	%r14, %rdx	 ; indent,
	movq	%r15, %rcx	 ; outfile,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:459:     tac_output(indent, "}\n");
	movq	%r15, %r9	 ; outfile,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC100(%rip), %rcx	 ;, tmp305
	call	fwrite	 ;
.L143:
 ; D:/TC/src/output.c:461: }
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
