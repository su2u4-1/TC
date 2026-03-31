	.file	"D:\\TC\\src\\output.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O1 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Name pointer: \"NULL\"\12\0"
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
	movq	%r9, %rbp	 ; tmp136, parser
 ; D:\TC\src\output.c:363:     if (name == NULL) {
	testq	%rcx, %rcx	 ; name
	je	.L14	 ;,
	movq	%rcx, %rsi	 ; tmp133, name
 ; D:\TC\src\output.c:368:     ast_output(0, false, "name: \"%s\"\n", name->name);
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:368:     ast_output(0, false, "name: \"%s\"\n", name->name);
	movq	8(%rsi), %r8	 ; name_15(D)->name,
	leaq	.LC1(%rip), %rdx	 ;, tmp101
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:369:     ast_output(0, false, "id: %zu\n", name->id);
	movq	%rbp, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:369:     ast_output(0, false, "id: %zu\n", name->id);
	movq	16(%rsi), %r8	 ; name_15(D)->id,
	leaq	.LC2(%rip), %rdx	 ;, tmp103
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:370:     switch (name->kind) {
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
 ; D:\TC\src\output.c:364:         ast_output(0, true, "Name pointer: \"NULL\"\n");
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:364:         ast_output(0, true, "Name pointer: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$21, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp99
	call	fwrite	 ;
.L1:
 ; D:\TC\src\output.c:407: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L5:
 ; D:\TC\src\output.c:372:             ast_output(0, true, "kind: \"type\"\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:372:             ast_output(0, true, "kind: \"type\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC3(%rip), %rcx	 ;, tmp110
	call	fwrite	 ;
 ; D:\TC\src\output.c:373:             break;
	jmp	.L1	 ;
.L9:
 ; D:\TC\src\output.c:375:             ast_output(0, false, "kind: \"variable\"\n");
	movq	%rbp, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:375:             ast_output(0, false, "kind: \"variable\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rcx	 ;, tmp111
	call	fwrite	 ;
 ; D:\TC\src\output.c:376:             ast_output(0, true, "type\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:376:             ast_output(0, true, "type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp112
	call	fwrite	 ;
 ; D:\TC\src\output.c:377:             output_name(name->type, outfile, indent + 1, parser);
	movq	(%rsi), %rcx	 ; name_15(D)->type, name_15(D)->type
	movq	%rbp, %r9	 ; parser,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:378:             break;
	jmp	.L1	 ;
.L11:
 ; D:\TC\src\output.c:380:             ast_output(0, false, "kind: \"function\"\n");
	movq	%rbp, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:380:             ast_output(0, false, "kind: \"function\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC6(%rip), %rcx	 ;, tmp115
	call	fwrite	 ;
 ; D:\TC\src\output.c:381:             ast_output(0, true, "return_type\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:381:             ast_output(0, true, "return_type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rcx	 ;, tmp116
	call	fwrite	 ;
 ; D:\TC\src\output.c:382:             output_name(name->type, outfile, indent + 1, parser);
	movq	(%rsi), %rcx	 ; name_15(D)->type, name_15(D)->type
	movq	%rbp, %r9	 ; parser,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:383:             break;
	jmp	.L1	 ;
.L10:
 ; D:\TC\src\output.c:385:             ast_output(0, false, "kind: \"method\"\n");
	movq	%rbp, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:385:             ast_output(0, false, "kind: \"method\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC8(%rip), %rcx	 ;, tmp119
	call	fwrite	 ;
 ; D:\TC\src\output.c:386:             ast_output(0, true, "return_type\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:386:             ast_output(0, true, "return_type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rcx	 ;, tmp120
	call	fwrite	 ;
 ; D:\TC\src\output.c:387:             output_name(name->type, outfile, indent + 1, parser);
	movq	(%rsi), %rcx	 ; name_15(D)->type, name_15(D)->type
	movq	%rbp, %r9	 ; parser,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:388:             break;
	jmp	.L1	 ;
.L12:
 ; D:\TC\src\output.c:390:             ast_output(0, true, "kind: \"class\"\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:390:             ast_output(0, true, "kind: \"class\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC9(%rip), %rcx	 ;, tmp123
	call	fwrite	 ;
 ; D:\TC\src\output.c:391:             break;
	jmp	.L1	 ;
.L7:
 ; D:\TC\src\output.c:393:             ast_output(0, false, "kind: \"attribute\"\n");
	movq	%rbp, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:393:             ast_output(0, false, "kind: \"attribute\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rcx	 ;, tmp124
	call	fwrite	 ;
 ; D:\TC\src\output.c:394:             ast_output(0, true, "type\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:394:             ast_output(0, true, "type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp125
	call	fwrite	 ;
 ; D:\TC\src\output.c:395:             output_name(name->type, outfile, indent + 1, parser);
	movq	(%rsi), %rcx	 ; name_15(D)->type, name_15(D)->type
	movq	%rbp, %r9	 ; parser,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:396:             break;
	jmp	.L1	 ;
.L8:
 ; D:\TC\src\output.c:398:             ast_output(0, false, "kind: \"parameter\"\n");
	movq	%rbp, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:398:             ast_output(0, false, "kind: \"parameter\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC11(%rip), %rcx	 ;, tmp128
	call	fwrite	 ;
 ; D:\TC\src\output.c:399:             ast_output(0, true, "type\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:399:             ast_output(0, true, "type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp129
	call	fwrite	 ;
 ; D:\TC\src\output.c:400:             output_name(name->type, outfile, indent + 1, parser);
	movq	(%rsi), %rcx	 ; name_15(D)->type, name_15(D)->type
	movq	%rbp, %r9	 ; parser,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:401:             break;
	jmp	.L1	 ;
.L4:
 ; D:\TC\src\output.c:403:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:403:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$25, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC12(%rip), %rcx	 ;, tmp132
	call	fwrite	 ;
 ; D:\TC\src\output.c:404:             break;
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
	movq	%r9, %rsi	 ; tmp105, parser
 ; D:\TC\src\output.c:256:     if (expression->operator == OP_NONE) {
	movl	24(%rcx), %ecx	 ; expression_10(D)->operator, _1
 ; D:\TC\src\output.c:256:     if (expression->operator == OP_NONE) {
	cmpl	$19, %ecx	 ;, _1
	je	.L21	 ;,
 ; D:\TC\src\output.c:260:         string op_str = operator_to_string(expression->operator);
	call	operator_to_string	 ;
	movq	%rax, %rdi	 ; tmp106, op_str
 ; D:\TC\src\output.c:261:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:261:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	testq	%rdi, %rdi	 ; op_str
 ; D:\TC\src\output.c:261:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	leaq	.LC13(%rip), %r8	 ;, tmp101
	cmovne	%rdi, %r8	 ; op_str,,
	leaq	.LC15(%rip), %rdx	 ;, tmp96
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:262:         ast_output(0, false, "left\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:262:         ast_output(0, false, "left\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rcx	 ;, tmp97
	call	fwrite	 ;
 ; D:\TC\src\output.c:263:         output_expression(expression->expr_left, outfile, indent + 1, parser);
	leaq	1(%rbp), %rdi	 ;, _4
	movq	(%r12), %rcx	 ; expression_10(D)->expr_left, expression_10(D)->expr_left
	movq	%rsi, %r9	 ; parser,
	movq	%rdi, %r8	 ; _4,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:\TC\src\output.c:264:         ast_output(0, true, "right\n");
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:264:         ast_output(0, true, "right\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC17(%rip), %rcx	 ;, tmp99
	call	fwrite	 ;
 ; D:\TC\src\output.c:265:         output_expression(expression->right, outfile, indent + 1, parser);
	movq	16(%r12), %rcx	 ; expression_10(D)->right, expression_10(D)->right
	movq	%rsi, %r9	 ; parser,
	movq	%rdi, %r8	 ; _4,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
.L15:
 ; D:\TC\src\output.c:268: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L21:
 ; D:\TC\src\output.c:257:         ast_output(0, true, "primary\n");
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:257:         ast_output(0, true, "primary\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC14(%rip), %rcx	 ;, tmp93
	call	fwrite	 ;
 ; D:\TC\src\output.c:258:         output_primary(expression->prim_left, outfile, indent + 1, parser);
	movq	8(%r12), %rcx	 ; expression_10(D)->prim_left, expression_10(D)->prim_left
	movq	%rsi, %r9	 ; parser,
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
	movq	%r9, %rsi	 ; tmp101, parser
 ; D:\TC\src\output.c:128:     ast_output(0, false, "type\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:128:     ast_output(0, false, "type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp91
	call	fwrite	 ;
 ; D:\TC\src\output.c:129:     output_name(variable->type, outfile, indent + 1, parser);
	leaq	1(%rdi), %r12	 ;, _1
	movq	0(%rbp), %rcx	 ; variable_13(D)->type, variable_13(D)->type
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:130:     ast_output(0, false, "name\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:130:     ast_output(0, false, "name\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rcx	 ;, tmp93
	call	fwrite	 ;
 ; D:\TC\src\output.c:131:     output_name(variable->name, outfile, indent + 1, parser);
	movq	8(%rbp), %rcx	 ; variable_13(D)->name, variable_13(D)->name
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:132:     if (variable->value != NULL) {
	cmpq	$0, 16(%rbp)	 ;, variable_13(D)->value
	je	.L23	 ;,
 ; D:\TC\src\output.c:133:         ast_output(0, true, "value\n");
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:133:         ast_output(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC19(%rip), %rcx	 ;, tmp95
	call	fwrite	 ;
 ; D:\TC\src\output.c:134:         output_expression(variable->value, outfile, indent + 1, parser);
	movq	16(%rbp), %rcx	 ; variable_13(D)->value, variable_13(D)->value
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
.L22:
 ; D:\TC\src\output.c:138: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L23:
 ; D:\TC\src\output.c:136:         ast_output(0, true, "value: \"NULL\"\n");
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:136:         ast_output(0, true, "value: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC20(%rip), %rcx	 ;, tmp97
	call	fwrite	 ;
 ; D:\TC\src\output.c:138: }
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
	movq	%r9, %rsi	 ; tmp131, parser
 ; D:\TC\src\output.c:322:     switch (variable_access->type) {
	movl	16(%rcx), %eax	 ; variable_access_19(D)->type, _1
 ; D:\TC\src\output.c:322:     switch (variable_access->type) {
	cmpl	$2, %eax	 ;, _1
	je	.L27	 ;,
	ja	.L28	 ;,
	testl	%eax, %eax	 ; _1
	je	.L39	 ;,
 ; D:\TC\src\output.c:329:             args = list_copy(variable_access->content.args);
	movq	8(%rcx), %rcx	 ; variable_access_19(D)->content.args, variable_access_19(D)->content.args
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp132, args
 ; D:\TC\src\output.c:330:             ast_output(0, false, "type: \"function_call\"\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:330:             ast_output(0, false, "type: \"function_call\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$22, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC22(%rip), %rcx	 ;, tmp108
	call	fwrite	 ;
 ; D:\TC\src\output.c:331:             ast_output(0, false, "function\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:331:             ast_output(0, false, "function\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC23(%rip), %rcx	 ;, tmp109
	call	fwrite	 ;
 ; D:\TC\src\output.c:332:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	leaq	1(%rbp), %r14	 ;, _5
	movq	(%rdi), %rcx	 ; variable_access_19(D)->base, variable_access_19(D)->base
	movq	%rsi, %r9	 ; parser,
	movq	%r14, %r8	 ; _5,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; D:\TC\src\output.c:333:             ast_output(0, true, "arguments\n");
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:333:             ast_output(0, true, "arguments\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC24(%rip), %rcx	 ;, tmp111
	call	fwrite	 ;
 ; D:\TC\src\output.c:335:             index = -1;
	movl	$-1, %r12d	 ;, index
 ; D:\TC\src\output.c:337:                 ast_output(1, false, "arguments[%d]\n", ++index);
	leaq	.LC25(%rip), %r15	 ;, tmp126
 ; D:\TC\src\output.c:338:                 output_expression(arg, outfile, indent + 2, parser);
	addq	$2, %rbp	 ;, tmp127
 ; D:\TC\src\output.c:336:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	jmp	.L34	 ;
.L28:
 ; D:\TC\src\output.c:322:     switch (variable_access->type) {
	cmpl	$3, %eax	 ;, _1
	jne	.L40	 ;,
 ; D:\TC\src\output.c:342:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:342:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$29, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC26(%rip), %rcx	 ;, tmp114
	call	fwrite	 ;
 ; D:\TC\src\output.c:343:             ast_output(0, false, "sequence\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:343:             ast_output(0, false, "sequence\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC27(%rip), %rcx	 ;, tmp115
	call	fwrite	 ;
 ; D:\TC\src\output.c:344:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	leaq	1(%rbp), %r12	 ;, _8
	movq	(%rdi), %rcx	 ; variable_access_19(D)->base, variable_access_19(D)->base
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _8,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; D:\TC\src\output.c:345:             ast_output(0, true, "index\n");
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:345:             ast_output(0, true, "index\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC28(%rip), %rcx	 ;, tmp117
	call	fwrite	 ;
 ; D:\TC\src\output.c:346:             output_expression(variable_access->content.index, outfile, indent + 1, parser);
	movq	8(%rdi), %rcx	 ; variable_access_19(D)->content.index, variable_access_19(D)->content.index
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _8,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:\TC\src\output.c:347:             break;
	jmp	.L26	 ;
.L39:
 ; D:\TC\src\output.c:324:             ast_output(0, false, "type: \"name\"\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:324:             ast_output(0, false, "type: \"name\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC21(%rip), %rcx	 ;, tmp103
	call	fwrite	 ;
 ; D:\TC\src\output.c:325:             ast_output(0, true, "name\n");
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:325:             ast_output(0, true, "name\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rcx	 ;, tmp104
	call	fwrite	 ;
 ; D:\TC\src\output.c:326:             output_name(variable_access->content.name, outfile, indent + 1, parser);
	movq	8(%rdi), %rcx	 ; variable_access_19(D)->content.name, variable_access_19(D)->content.name
	movq	%rsi, %r9	 ; parser,
	leaq	1(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
.L26:
 ; D:\TC\src\output.c:360: }
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
 ; D:\TC\src\output.c:337:                 ast_output(1, false, "arguments[%d]\n", ++index);
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r14, %rdx	 ; _5,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:337:                 ast_output(1, false, "arguments[%d]\n", ++index);
	addl	$1, %r12d	 ;, index
	movl	%r12d, %r8d	 ; index,
	movq	%r15, %rdx	 ; tmp126,
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:338:                 output_expression(arg, outfile, indent + 2, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %r8	 ; tmp127,
	movq	%rbx, %rdx	 ; outfile,
	movq	%rdi, %rcx	 ; arg,
	call	output_expression	 ;
.L34:
 ; D:\TC\src\output.c:336:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	movq	%r13, %rcx	 ; args,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp133, arg
 ; D:\TC\src\output.c:336:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	 ; arg
	jne	.L35	 ;,
	jmp	.L26	 ;
.L27:
 ; D:\TC\src\output.c:349:             ast_output(0, false, "type: \"get_attribute\"\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:349:             ast_output(0, false, "type: \"get_attribute\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$22, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC29(%rip), %rcx	 ;, tmp119
	call	fwrite	 ;
 ; D:\TC\src\output.c:350:             ast_output(0, false, "object\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:350:             ast_output(0, false, "object\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC30(%rip), %rcx	 ;, tmp120
	call	fwrite	 ;
 ; D:\TC\src\output.c:351:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	leaq	1(%rbp), %r12	 ;, _11
	movq	(%rdi), %rcx	 ; variable_access_19(D)->base, variable_access_19(D)->base
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _11,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; D:\TC\src\output.c:352:             ast_output(0, true, "attribute_name\n");
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:352:             ast_output(0, true, "attribute_name\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC31(%rip), %rcx	 ;, tmp122
	call	fwrite	 ;
 ; D:\TC\src\output.c:353:             output_name(variable_access->content.attr_name, outfile, indent + 1, parser);
	movq	8(%rdi), %rcx	 ; variable_access_19(D)->content.attr_name, variable_access_19(D)->content.attr_name
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _11,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:354:             break;
	jmp	.L26	 ;
.L40:
 ; D:\TC\src\output.c:356:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:356:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movl	16(%rdi), %r8d	 ; variable_access_19(D)->type,
	leaq	.LC32(%rip), %rdx	 ;, tmp125
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:360: }
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
	movq	%r9, %rbp	 ; tmp139, parser
 ; D:\TC\src\output.c:271:     switch (primary->type) {
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
 ; D:\TC\src\output.c:273:             ast_output(0, false, "type: \"integer\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:273:             ast_output(0, false, "type: \"integer\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC33(%rip), %rcx	 ;, tmp105
	call	fwrite	 ;
 ; D:\TC\src\output.c:274:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:274:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	(%rsi), %r8	 ; primary_16(D)->value.literal_value,
	leaq	.LC34(%rip), %rdx	 ;, tmp107
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
.L41:
 ; D:\TC\src\output.c:317: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L51:
 ; D:\TC\src\output.c:277:             ast_output(0, false, "type: \"float\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:277:             ast_output(0, false, "type: \"float\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC35(%rip), %rcx	 ;, tmp108
	call	fwrite	 ;
 ; D:\TC\src\output.c:278:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:278:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	(%rsi), %r8	 ; primary_16(D)->value.literal_value,
	leaq	.LC34(%rip), %rdx	 ;, tmp110
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:279:             break;
	jmp	.L41	 ;
.L50:
 ; D:\TC\src\output.c:281:             ast_output(0, false, "type: \"string\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:281:             ast_output(0, false, "type: \"string\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC36(%rip), %rcx	 ;, tmp111
	call	fwrite	 ;
 ; D:\TC\src\output.c:282:             ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:282:             ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
	movq	(%rsi), %r8	 ; primary_16(D)->value.literal_value,
	leaq	.LC37(%rip), %rdx	 ;, tmp113
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:283:             break;
	jmp	.L41	 ;
.L49:
 ; D:\TC\src\output.c:285:             ast_output(0, false, "type: \"boolean\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:285:             ast_output(0, false, "type: \"boolean\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC38(%rip), %rcx	 ;, tmp114
	call	fwrite	 ;
 ; D:\TC\src\output.c:286:             ast_output(0, true, "value: \"true\"\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:286:             ast_output(0, true, "value: \"true\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC39(%rip), %rcx	 ;, tmp115
	call	fwrite	 ;
 ; D:\TC\src\output.c:287:             break;
	jmp	.L41	 ;
.L48:
 ; D:\TC\src\output.c:289:             ast_output(0, false, "type: \"boolean\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:289:             ast_output(0, false, "type: \"boolean\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC38(%rip), %rcx	 ;, tmp116
	call	fwrite	 ;
 ; D:\TC\src\output.c:290:             ast_output(0, true, "value: \"false\"\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:290:             ast_output(0, true, "value: \"false\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC40(%rip), %rcx	 ;, tmp117
	call	fwrite	 ;
 ; D:\TC\src\output.c:291:             break;
	jmp	.L41	 ;
.L47:
 ; D:\TC\src\output.c:293:             ast_output(0, false, "type: \"expression\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:293:             ast_output(0, false, "type: \"expression\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$19, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC41(%rip), %rcx	 ;, tmp118
	call	fwrite	 ;
 ; D:\TC\src\output.c:294:             ast_output(0, true, "value\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:294:             ast_output(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC19(%rip), %rcx	 ;, tmp119
	call	fwrite	 ;
 ; D:\TC\src\output.c:295:             output_expression(primary->value.expr, outfile, indent + 1, parser);
	movq	(%rsi), %rcx	 ; primary_16(D)->value.expr, primary_16(D)->value.expr
	movq	%rbp, %r9	 ; parser,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:\TC\src\output.c:296:             break;
	jmp	.L41	 ;
.L46:
 ; D:\TC\src\output.c:298:             ast_output(0, false, "type: \"!\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:298:             ast_output(0, false, "type: \"!\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC42(%rip), %rcx	 ;, tmp122
	call	fwrite	 ;
 ; D:\TC\src\output.c:299:             ast_output(0, true, "value\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:299:             ast_output(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC19(%rip), %rcx	 ;, tmp123
	call	fwrite	 ;
 ; D:\TC\src\output.c:300:             output_primary(primary->value.operand, outfile, indent + 1, parser);
	movq	(%rsi), %rcx	 ; primary_16(D)->value.operand, primary_16(D)->value.operand
	movq	%rbp, %r9	 ; parser,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_primary	 ;
 ; D:\TC\src\output.c:301:             break;
	jmp	.L41	 ;
.L45:
 ; D:\TC\src\output.c:303:             ast_output(0, false, "type: \"-\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:303:             ast_output(0, false, "type: \"-\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC43(%rip), %rcx	 ;, tmp126
	call	fwrite	 ;
 ; D:\TC\src\output.c:304:             ast_output(0, true, "value\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:304:             ast_output(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC19(%rip), %rcx	 ;, tmp127
	call	fwrite	 ;
 ; D:\TC\src\output.c:305:             output_primary(primary->value.operand, outfile, indent + 1, parser);
	movq	(%rsi), %rcx	 ; primary_16(D)->value.operand, primary_16(D)->value.operand
	movq	%rbp, %r9	 ; parser,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_primary	 ;
 ; D:\TC\src\output.c:306:             break;
	jmp	.L41	 ;
.L43:
 ; D:\TC\src\output.c:308:             ast_output(0, false, "type: \"variable\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:308:             ast_output(0, false, "type: \"variable\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC44(%rip), %rcx	 ;, tmp130
	call	fwrite	 ;
 ; D:\TC\src\output.c:309:             ast_output(0, true, "value\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:309:             ast_output(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC19(%rip), %rcx	 ;, tmp131
	call	fwrite	 ;
 ; D:\TC\src\output.c:310:             output_variable_access(primary->value.var, outfile, indent + 1, parser);
	movq	(%rsi), %rcx	 ; primary_16(D)->value.var, primary_16(D)->value.var
	movq	%rbp, %r9	 ; parser,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; D:\TC\src\output.c:311:             break;
	jmp	.L41	 ;
.L42:
 ; D:\TC\src\output.c:313:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:313:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movl	8(%rsi), %r8d	 ; primary_16(D)->type,
	leaq	.LC45(%rip), %rdx	 ;, tmp135
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:317: }
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
	movq	%r9, %rsi	 ; tmp198, parser
 ; D:\TC\src\output.c:141:     switch (statement->type) {
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
 ; D:\TC\src\output.c:143:             ast_output(0, false, "if_statement\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:143:             ast_output(0, false, "if_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC46(%rip), %rcx	 ;, tmp142
	call	fwrite	 ;
 ; D:\TC\src\output.c:144:             output_if(statement->stmt.if_stmt, outfile, indent + 1, parser);
	leaq	1(%rbp), %r15	 ;, _2
	movq	%r15, 40(%rsp)	 ; _2, %sfp
	movq	(%rdi), %r12	 ; statement_19(D)->stmt.if_stmt, _3
 ; D:\TC\src\output.c:190:     list(Statement*) body = list_copy(if_->body);
	movq	8(%r12), %rcx	 ; _3->body, _3->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp199, body
 ; D:\TC\src\output.c:191:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	movq	16(%r12), %rcx	 ; _3->else_if, _3->else_if
	call	list_copy	 ;
	movq	%rax, %r14	 ; tmp200, else_if_list
 ; D:\TC\src\output.c:192:     list(Statement*) else_body = list_copy(if_->else_body);
	movq	24(%r12), %rcx	 ; _3->else_body, _3->else_body
	call	list_copy	 ;
	movq	%rax, 32(%rsp)	 ; tmp201, %sfp
 ; D:\TC\src\output.c:193:     ast_output(0, false, "condition\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r15, %rdx	 ; _2,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:193:     ast_output(0, false, "condition\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC47(%rip), %rcx	 ;, tmp146
	call	fwrite	 ;
 ; D:\TC\src\output.c:194:     output_expression(if_->condition, outfile, indent + 1, parser);
	leaq	2(%rbp), %r13	 ;, _57
	movq	(%r12), %rcx	 ; _3->condition, _3->condition
	movq	%rsi, %r9	 ; parser,
	movq	%r13, %r8	 ; _57,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:\TC\src\output.c:195:     ast_output(0, false, "body\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r15, %rdx	 ; _2,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:195:     ast_output(0, false, "body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rcx	 ;, tmp148
	call	fwrite	 ;
.L66:
 ; D:\TC\src\output.c:197:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp202, statement
 ; D:\TC\src\output.c:197:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L88	 ;,
 ; D:\TC\src\output.c:198:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%r13, %r8	 ; _57,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
	jmp	.L66	 ;
.L88:
 ; D:\TC\src\output.c:199:     ast_output(0, false, "else_if\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:199:     ast_output(0, false, "else_if\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC49(%rip), %rcx	 ;, tmp149
	call	fwrite	 ;
 ; D:\TC\src\output.c:211:     ast_output(0, false, "condition\n");
	leaq	.LC47(%rip), %r15	 ;, tmp191
 ; D:\TC\src\output.c:212:     output_expression(else_if->condition, outfile, indent + 1, parser);
	addq	$3, %rbp	 ;, _64
.L68:
 ; D:\TC\src\output.c:201:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	movq	%r14, %rcx	 ; else_if_list,
	call	list_pop	 ;
	movq	%rax, %r12	 ; tmp205, else_if
 ; D:\TC\src\output.c:201:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	testq	%rax, %rax	 ; else_if
	je	.L89	 ;,
 ; D:\TC\src\output.c:210:     list(Statement*) body = list_copy(else_if->body);
	movq	8(%r12), %rcx	 ; else_if_60->body, else_if_60->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp203, body
 ; D:\TC\src\output.c:211:     ast_output(0, false, "condition\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _57,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:211:     ast_output(0, false, "condition\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	movq	%r15, %rcx	 ; tmp191,
	call	fwrite	 ;
 ; D:\TC\src\output.c:212:     output_expression(else_if->condition, outfile, indent + 1, parser);
	movq	(%r12), %rcx	 ; else_if_60->condition, else_if_60->condition
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %r8	 ; _64,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:\TC\src\output.c:213:     ast_output(0, true, "body\n");
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%r13, %rdx	 ; _57,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:213:     ast_output(0, true, "body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rcx	 ;,
	call	fwrite	 ;
.L69:
 ; D:\TC\src\output.c:215:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
 ; D:\TC\src\output.c:215:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L68	 ;,
 ; D:\TC\src\output.c:216:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %r8	 ; _64,
	movq	%rbx, %rdx	 ; outfile,
	movq	%rax, %rcx	 ; statement,
	call	output_statement	 ;
	jmp	.L69	 ;
.L89:
 ; D:\TC\src\output.c:203:     ast_output(0, true, "else_body\n");
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:203:     ast_output(0, true, "else_body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC50(%rip), %rcx	 ;, tmp154
	call	fwrite	 ;
.L72:
 ; D:\TC\src\output.c:204:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	movq	32(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp206, statement
 ; D:\TC\src\output.c:204:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L55	 ;,
 ; D:\TC\src\output.c:205:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%r13, %r8	 ; _57,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
	jmp	.L72	 ;
.L61:
 ; D:\TC\src\output.c:147:             ast_output(0, false, "for_statement\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:147:             ast_output(0, false, "for_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC51(%rip), %rcx	 ;, tmp155
	call	fwrite	 ;
 ; D:\TC\src\output.c:148:             output_for(statement->stmt.for_stmt, outfile, indent + 1, parser);
	leaq	1(%rbp), %r13	 ;, _4
	movq	(%rdi), %r12	 ; statement_19(D)->stmt.for_stmt, _5
 ; D:\TC\src\output.c:221:     list(Statement*) body = list_copy(for_->body);
	movq	24(%r12), %rcx	 ; _5->body, _5->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp207, body
 ; D:\TC\src\output.c:222:     if (for_->initializer != NULL) {
	cmpq	$0, (%r12)	 ;, _5->initializer
	je	.L75	 ;,
 ; D:\TC\src\output.c:223:         ast_output(0, false, "initializer\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:223:         ast_output(0, false, "initializer\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC52(%rip), %rcx	 ;, tmp157
	call	fwrite	 ;
 ; D:\TC\src\output.c:224:         output_variable(for_->initializer, outfile, indent + 1, parser);
	movq	(%r12), %rcx	 ; _5->initializer, _5->initializer
	movq	%rsi, %r9	 ; parser,
	leaq	2(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable	 ;
.L76:
 ; D:\TC\src\output.c:227:     if (for_->condition != NULL) {
	cmpq	$0, 8(%r12)	 ;, _5->condition
	je	.L77	 ;,
 ; D:\TC\src\output.c:228:         ast_output(0, false, "condition\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:228:         ast_output(0, false, "condition\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC47(%rip), %rcx	 ;, tmp161
	call	fwrite	 ;
 ; D:\TC\src\output.c:229:         output_expression(for_->condition, outfile, indent + 1, parser);
	movq	8(%r12), %rcx	 ; _5->condition, _5->condition
	movq	%rsi, %r9	 ; parser,
	leaq	2(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
.L78:
 ; D:\TC\src\output.c:232:     if (for_->increment != NULL) {
	cmpq	$0, 16(%r12)	 ;, _5->increment
	je	.L79	 ;,
 ; D:\TC\src\output.c:233:         ast_output(0, false, "increment\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:233:         ast_output(0, false, "increment\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC55(%rip), %rcx	 ;, tmp165
	call	fwrite	 ;
 ; D:\TC\src\output.c:234:         output_expression(for_->increment, outfile, indent + 1, parser);
	movq	16(%r12), %rcx	 ; _5->increment, _5->increment
	movq	%rsi, %r9	 ; parser,
	leaq	2(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
.L80:
 ; D:\TC\src\output.c:237:     ast_output(0, true, "body\n");
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:237:     ast_output(0, true, "body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rcx	 ;, tmp169
	call	fwrite	 ;
 ; D:\TC\src\output.c:240:         output_statement(statement, outfile, indent + 1, parser);
	addq	$2, %rbp	 ;, tmp194
.L81:
 ; D:\TC\src\output.c:239:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp208, statement
 ; D:\TC\src\output.c:239:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L55	 ;,
 ; D:\TC\src\output.c:240:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %r8	 ; tmp194,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
	jmp	.L81	 ;
.L75:
 ; D:\TC\src\output.c:226:         ast_output(0, false, "initializer: \"NULL\"\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:226:         ast_output(0, false, "initializer: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$20, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC53(%rip), %rcx	 ;, tmp160
	call	fwrite	 ;
	jmp	.L76	 ;
.L77:
 ; D:\TC\src\output.c:231:         ast_output(0, false, "condition: \"NULL\"\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:231:         ast_output(0, false, "condition: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC54(%rip), %rcx	 ;, tmp164
	call	fwrite	 ;
	jmp	.L78	 ;
.L79:
 ; D:\TC\src\output.c:236:         ast_output(0, false, "increment: \"NULL\"\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:236:         ast_output(0, false, "increment: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC56(%rip), %rcx	 ;, tmp168
	call	fwrite	 ;
	jmp	.L80	 ;
.L62:
 ; D:\TC\src\output.c:151:             ast_output(0, false, "while_statement\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:151:             ast_output(0, false, "while_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC57(%rip), %rcx	 ;, tmp171
	call	fwrite	 ;
 ; D:\TC\src\output.c:152:             output_while(statement->stmt.while_stmt, outfile, indent + 1, parser);
	leaq	1(%rbp), %r12	 ;, _6
	movq	(%rdi), %r13	 ; statement_19(D)->stmt.while_stmt, _7
 ; D:\TC\src\output.c:245:     list(Statement*) body = list_copy(while_->body);
	movq	8(%r13), %rcx	 ; _7->body, _7->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp209, body
 ; D:\TC\src\output.c:246:     ast_output(0, false, "condition\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r12, %rdx	 ; _6,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:246:     ast_output(0, false, "condition\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC47(%rip), %rcx	 ;, tmp173
	call	fwrite	 ;
 ; D:\TC\src\output.c:247:     output_expression(while_->condition, outfile, indent + 1, parser);
	addq	$2, %rbp	 ;, _82
	movq	0(%r13), %rcx	 ; _7->condition, _7->condition
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %r8	 ; _82,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:\TC\src\output.c:248:     ast_output(0, true, "body\n");
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%r12, %rdx	 ; _6,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:248:     ast_output(0, true, "body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rcx	 ;, tmp175
	call	fwrite	 ;
.L83:
 ; D:\TC\src\output.c:250:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp210, statement
 ; D:\TC\src\output.c:250:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L55	 ;,
 ; D:\TC\src\output.c:251:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %r8	 ; _82,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
	jmp	.L83	 ;
.L64:
 ; D:\TC\src\output.c:155:             ast_output(0, false, "variable_declaration_statement\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:155:             ast_output(0, false, "variable_declaration_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC58(%rip), %rcx	 ;, tmp176
	call	fwrite	 ;
 ; D:\TC\src\output.c:156:             output_variable(statement->stmt.var, outfile, indent + 1, parser);
	movq	(%rdi), %rcx	 ; statement_19(D)->stmt.var, statement_19(D)->stmt.var
	movq	%rsi, %r9	 ; parser,
	leaq	1(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable	 ;
.L55:
 ; D:\TC\src\output.c:187: }
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
 ; D:\TC\src\output.c:159:             if (statement->stmt.expr == NULL) {
	cmpq	$0, (%rcx)	 ;, statement_19(D)->stmt.expr
	je	.L90	 ;,
 ; D:\TC\src\output.c:164:             ast_output(0, false, "return_statement\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:164:             ast_output(0, false, "return_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC60(%rip), %rcx	 ;, tmp180
	call	fwrite	 ;
 ; D:\TC\src\output.c:165:             output_expression(statement->stmt.expr, outfile, indent + 1, parser);
	movq	(%rdi), %rcx	 ; statement_19(D)->stmt.expr, statement_19(D)->stmt.expr
	movq	%rsi, %r9	 ; parser,
	leaq	1(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:\TC\src\output.c:166:             break;
	jmp	.L55	 ;
.L90:
 ; D:\TC\src\output.c:160:                 ast_output(0, false, "return_statement: \"NULL\"\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:160:                 ast_output(0, false, "return_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$25, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC59(%rip), %rcx	 ;, tmp179
	call	fwrite	 ;
 ; D:\TC\src\output.c:162:                 return;
	jmp	.L55	 ;
.L59:
 ; D:\TC\src\output.c:168:             ast_output(0, false, "break_statement: \"NULL\"\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:168:             ast_output(0, false, "break_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$24, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC61(%rip), %rcx	 ;, tmp183
	call	fwrite	 ;
 ; D:\TC\src\output.c:169:             break;
	jmp	.L55	 ;
.L57:
 ; D:\TC\src\output.c:171:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:171:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$27, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC62(%rip), %rcx	 ;, tmp184
	call	fwrite	 ;
 ; D:\TC\src\output.c:172:             break;
	jmp	.L55	 ;
.L65:
 ; D:\TC\src\output.c:174:             if (statement->stmt.expr == NULL) {
	cmpq	$0, (%rcx)	 ;, statement_19(D)->stmt.expr
	je	.L91	 ;,
 ; D:\TC\src\output.c:179:             ast_output(0, false, "expression_statement\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:179:             ast_output(0, false, "expression_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$21, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC64(%rip), %rcx	 ;, tmp186
	call	fwrite	 ;
 ; D:\TC\src\output.c:180:             output_expression(statement->stmt.expr, outfile, indent + 1, parser);
	movq	(%rdi), %rcx	 ; statement_19(D)->stmt.expr, statement_19(D)->stmt.expr
	movq	%rsi, %r9	 ; parser,
	leaq	1(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:\TC\src\output.c:181:             break;
	jmp	.L55	 ;
.L91:
 ; D:\TC\src\output.c:175:                 ast_output(0, false, "expression_statement: \"NULL\"\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:175:                 ast_output(0, false, "expression_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$29, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC63(%rip), %rcx	 ;, tmp185
	call	fwrite	 ;
 ; D:\TC\src\output.c:177:                 return;
	jmp	.L55	 ;
.L56:
 ; D:\TC\src\output.c:183:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:183:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movl	8(%rdi), %r8d	 ; statement_19(D)->type,
	leaq	.LC65(%rip), %rdx	 ;, tmp190
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:184:             break;
	jmp	.L55	 ;
	.section .rdata,"dr"
.LC66:
	.ascii "NULL\0"
.LC67:
	.ascii "import\12\0"
.LC68:
	.ascii "source: \"%s\"\12\0"
.LC69:
	.ascii "parameters\12\0"
.LC70:
	.ascii "parameters[%d]\12\0"
.LC71:
	.ascii "class\12\0"
.LC72:
	.ascii "members\12\0"
.LC73:
	.ascii "method\12\0"
.LC74:
	.ascii "variable\12\0"
.LC75:
	.ascii "unknown_ClassMemberType: %u\12\0"
.LC76:
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
	movq	%r9, %r14	 ; tmp188, parser
 ; D:\TC\src\output.c:43:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rcx), %rcx	 ; code_5(D)->members, code_5(D)->members
	call	list_copy	 ;
	movq	%rax, 56(%rsp)	 ; tmp189, %sfp
 ; D:\TC\src\output.c:45:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	jmp	.L93	 ;
.L94:
 ; D:\TC\src\output.c:28:             ast_output(0, false, "function\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:28:             ast_output(0, false, "function\n");
	movq	%r15, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC23(%rip), %rcx	 ;, tmp140
	call	fwrite	 ;
 ; D:\TC\src\output.c:29:             output_function(code_member->content.function, outfile, indent + 1, parser);
	movq	160(%rsp), %rax	 ; indent, tmp232
	leaq	2(%rax), %rsi	 ;, _17
	movq	%rsi, 32(%rsp)	 ; _17, %sfp
	movq	(%rbx), %rbx	 ; member_9->content.function, _18
 ; D:\TC\src\output.c:58:     ast_output(0, false, "name\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; _17,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:58:     ast_output(0, false, "name\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rcx	 ;, tmp141
	call	fwrite	 ;
 ; D:\TC\src\output.c:59:     output_name(function->name, outfile, indent + 1, parser);
	movq	160(%rsp), %rax	 ; indent, tmp233
	leaq	3(%rax), %rdi	 ;, _26
	movq	(%rbx), %rcx	 ; _18->name, _18->name
	movq	%r14, %r9	 ; parser,
	movq	%rdi, %r8	 ; _26,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:60:     ast_output(0, false, "return_type\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; _17,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:60:     ast_output(0, false, "return_type\n");
	movq	%r15, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rcx	 ;, tmp143
	call	fwrite	 ;
 ; D:\TC\src\output.c:61:     output_name(function->return_type, outfile, indent + 1, parser);
	movq	8(%rbx), %rcx	 ; _18->return_type, _18->return_type
	movq	%r14, %r9	 ; parser,
	movq	%rdi, %r8	 ; _26,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:62:     ast_output(0, false, "parameters\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; _17,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:62:     ast_output(0, false, "parameters\n");
	movq	%r15, %r9	 ; outfile,
	movl	$11, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC69(%rip), %rcx	 ;, tmp145
	call	fwrite	 ;
 ; D:\TC\src\output.c:63:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%rbx), %rcx	 ; _18->parameters, _18->parameters
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp190, parameters
 ; D:\TC\src\output.c:64:     list(Statement*) body = list_copy(function->body);
	movq	24(%rbx), %rcx	 ; _18->body, _18->body
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp191, body
 ; D:\TC\src\output.c:66:     int index = -1;
	movl	$-1, %esi	 ;, index
 ; D:\TC\src\output.c:69:         output_variable(parameter, outfile, indent + 2, parser);
	movq	160(%rsp), %rax	 ; indent, tmp234
	leaq	4(%rax), %r13	 ;, tmp181
.L99:
 ; D:\TC\src\output.c:67:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%r12, %rcx	 ; parameters,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp192, parameter
 ; D:\TC\src\output.c:67:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	 ; parameter
	je	.L116	 ;,
 ; D:\TC\src\output.c:68:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; _26,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:68:         ast_output(1, false, "parameters[%d]\n", ++index);
	addl	$1, %esi	 ;, index
	movl	%esi, %r8d	 ; index,
	leaq	.LC70(%rip), %rdx	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:69:         output_variable(parameter, outfile, indent + 2, parser);
	movq	%r14, %r9	 ; parser,
	movq	%r13, %r8	 ; tmp181,
	movq	%r15, %rdx	 ; outfile,
	movq	%rbx, %rcx	 ; parameter,
	call	output_variable	 ;
	jmp	.L99	 ;
.L116:
 ; D:\TC\src\output.c:71:     ast_output(0, true, "body\n");
	movq	%r14, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	32(%rsp), %rdx	 ; %sfp,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:71:     ast_output(0, true, "body\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rcx	 ;, tmp150
	call	fwrite	 ;
.L101:
 ; D:\TC\src\output.c:73:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbp, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp193, statement
 ; D:\TC\src\output.c:73:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L93	 ;,
 ; D:\TC\src\output.c:74:         output_statement(statement, outfile, indent + 1, parser);
	movq	%r14, %r9	 ; parser,
	movq	%rdi, %r8	 ; _26,
	movq	%r15, %rdx	 ; outfile,
	call	output_statement	 ;
	jmp	.L101	 ;
.L95:
 ; D:\TC\src\output.c:32:             ast_output(0, false, "class\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:32:             ast_output(0, false, "class\n");
	movq	%r15, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC71(%rip), %rcx	 ;, tmp151
	call	fwrite	 ;
 ; D:\TC\src\output.c:33:             output_class(code_member->content.class, outfile, indent + 1, parser);
	movq	160(%rsp), %rax	 ; indent, tmp235
	leaq	2(%rax), %rsi	 ;, _19
	movq	(%rbx), %rbx	 ; member_9->content.class, _20
 ; D:\TC\src\output.c:117:     ast_output(0, false, "name\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; _19,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:117:     ast_output(0, false, "name\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rcx	 ;, tmp152
	call	fwrite	 ;
 ; D:\TC\src\output.c:118:     output_name(class->name, outfile, indent + 1, parser);
	movq	160(%rsp), %rax	 ; indent, tmp237
	addq	$3, %rax	 ;, _38
	movq	%rax, 40(%rsp)	 ; _38, %sfp
	movq	(%rbx), %rcx	 ; _20->name, _20->name
	movq	%r14, %r9	 ; parser,
	movq	%rax, %r8	 ; _38,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:119:     ast_output(0, true, "members\n");
	movq	%r14, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rsi, %rdx	 ; _19,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:119:     ast_output(0, true, "members\n");
	movq	%r15, %r9	 ; outfile,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC72(%rip), %rcx	 ;, tmp154
	call	fwrite	 ;
 ; D:\TC\src\output.c:120:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rbx), %rcx	 ; _20->members, _20->members
	call	list_copy	 ;
	movq	%rax, 32(%rsp)	 ; tmp194, %sfp
 ; D:\TC\src\output.c:122:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	jmp	.L103	 ;
.L104:
 ; D:\TC\src\output.c:102:             ast_output(0, false, "method\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:102:             ast_output(0, false, "method\n");
	movq	%r15, %r9	 ; outfile,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC73(%rip), %rcx	 ;,
	call	fwrite	 ;
 ; D:\TC\src\output.c:103:             output_method(class_member->content.method, outfile, indent + 1, parser);
	movq	160(%rsp), %rax	 ; indent, tmp239
	leaq	4(%rax), %rsi	 ;, _44
	movq	%rsi, 48(%rsp)	 ; _44, %sfp
	movq	(%rbx), %rbx	 ; member_42->content.method, _45
 ; D:\TC\src\output.c:79:     ast_output(0, false, "name\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; _44,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:79:     ast_output(0, false, "name\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rcx	 ;, tmp157
	call	fwrite	 ;
 ; D:\TC\src\output.c:80:     output_name(method->name, outfile, indent + 1, parser);
	movq	160(%rsp), %rax	 ; indent, tmp240
	leaq	5(%rax), %rdi	 ;, _49
	movq	(%rbx), %rcx	 ; _45->name, _45->name
	movq	%r14, %r9	 ; parser,
	movq	%rdi, %r8	 ; _49,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:81:     ast_output(0, false, "return_type\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; _44,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:81:     ast_output(0, false, "return_type\n");
	movq	%r15, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rcx	 ;, tmp159
	call	fwrite	 ;
 ; D:\TC\src\output.c:82:     output_name(method->return_type, outfile, indent + 1, parser);
	movq	8(%rbx), %rcx	 ; _45->return_type, _45->return_type
	movq	%r14, %r9	 ; parser,
	movq	%rdi, %r8	 ; _49,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:83:     ast_output(0, false, "parameters\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; _44,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:83:     ast_output(0, false, "parameters\n");
	movq	%r15, %r9	 ; outfile,
	movl	$11, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC69(%rip), %rcx	 ;, tmp161
	call	fwrite	 ;
 ; D:\TC\src\output.c:84:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%rbx), %rcx	 ; _45->parameters, _45->parameters
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp195, parameters
 ; D:\TC\src\output.c:85:     list(Statement*) body = list_copy(method->body);
	movq	24(%rbx), %rcx	 ; _45->body, _45->body
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp196, body
 ; D:\TC\src\output.c:87:     int index = -1;
	movl	$-1, %esi	 ;, index
 ; D:\TC\src\output.c:90:         output_variable(parameter, outfile, indent + 2, parser);
	movq	160(%rsp), %rax	 ; indent, tmp241
	leaq	6(%rax), %r13	 ;, tmp176
 ; D:\TC\src\output.c:88:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	jmp	.L107	 ;
.L108:
 ; D:\TC\src\output.c:89:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; _49,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:89:         ast_output(1, false, "parameters[%d]\n", ++index);
	addl	$1, %esi	 ;, index
	movl	%esi, %r8d	 ; index,
	leaq	.LC70(%rip), %rdx	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:90:         output_variable(parameter, outfile, indent + 2, parser);
	movq	%r14, %r9	 ; parser,
	movq	%r13, %r8	 ; tmp176,
	movq	%r15, %rdx	 ; outfile,
	movq	%rbx, %rcx	 ; parameter,
	call	output_variable	 ;
.L107:
 ; D:\TC\src\output.c:88:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%r12, %rcx	 ; parameters,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp197, parameter
 ; D:\TC\src\output.c:88:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	 ; parameter
	jne	.L108	 ;,
 ; D:\TC\src\output.c:92:     ast_output(0, true, "body\n");
	movq	%r14, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	48(%rsp), %rdx	 ; %sfp,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:92:     ast_output(0, true, "body\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rcx	 ;, tmp166
	call	fwrite	 ;
 ; D:\TC\src\output.c:94:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L109	 ;
.L110:
 ; D:\TC\src\output.c:95:         output_statement(statement, outfile, indent + 1, parser);
	movq	%r14, %r9	 ; parser,
	movq	%rdi, %r8	 ; _49,
	movq	%r15, %rdx	 ; outfile,
	call	output_statement	 ;
.L109:
 ; D:\TC\src\output.c:94:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbp, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp198, statement
 ; D:\TC\src\output.c:94:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L110	 ;,
.L103:
 ; D:\TC\src\output.c:122:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	movq	32(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp199, member
 ; D:\TC\src\output.c:122:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	 ; member
	je	.L93	 ;,
 ; D:\TC\src\output.c:100:     switch (class_member->type) {
	movl	8(%rbx), %eax	 ; member_42->type, _43
 ; D:\TC\src\output.c:100:     switch (class_member->type) {
	testl	%eax, %eax	 ; _43
	je	.L104	 ;,
	cmpl	$1, %eax	 ;, _43
	je	.L105	 ;,
 ; D:\TC\src\output.c:110:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:110:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movl	8(%rbx), %r8d	 ; member_42->type,
	leaq	.LC75(%rip), %rdx	 ;, tmp171
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:111:             break;
	jmp	.L103	 ;
.L105:
 ; D:\TC\src\output.c:106:             ast_output(0, false, "variable\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:106:             ast_output(0, false, "variable\n");
	movq	%r15, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC74(%rip), %rcx	 ;, tmp167
	call	fwrite	 ;
 ; D:\TC\src\output.c:107:             output_variable(class_member->content.variable, outfile, indent + 1, parser);
	movq	(%rbx), %rcx	 ; member_42->content.variable, member_42->content.variable
	movq	%r14, %r9	 ; parser,
	movq	160(%rsp), %rax	 ; indent, tmp242
	leaq	4(%rax), %r8	 ;,
	movq	%r15, %rdx	 ; outfile,
	call	output_variable	 ;
 ; D:\TC\src\output.c:108:             break;
	jmp	.L103	 ;
.L96:
 ; D:\TC\src\output.c:36:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:36:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movl	8(%rbx), %r8d	 ; member_9->type,
	leaq	.LC76(%rip), %rdx	 ;, tmp173
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
.L93:
 ; D:\TC\src\output.c:45:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	movq	56(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp200, member
 ; D:\TC\src\output.c:45:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	 ; member
	je	.L117	 ;,
 ; D:\TC\src\output.c:46:         output_code_member(member, outfile, indent + 1, parser);
	movq	160(%rsp), %rax	 ; indent, tmp228
	leaq	1(%rax), %rdx	 ;, _2
 ; D:\TC\src\output.c:22:     switch (code_member->type) {
	movl	8(%rbx), %eax	 ; member_9->type, _14
 ; D:\TC\src\output.c:22:     switch (code_member->type) {
	cmpl	$1, %eax	 ;, _14
	je	.L94	 ;,
	cmpl	$2, %eax	 ;, _14
	je	.L95	 ;,
	testl	%eax, %eax	 ; _14
	jne	.L96	 ;,
 ; D:\TC\src\output.c:24:             ast_output(0, false, "import\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:24:             ast_output(0, false, "import\n");
	movq	%r15, %r9	 ; outfile,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC67(%rip), %rcx	 ;, tmp135
	call	fwrite	 ;
 ; D:\TC\src\output.c:25:             output_import(code_member->content.import, outfile, indent + 1, parser);
	movq	160(%rsp), %rax	 ; indent, tmp229
	leaq	2(%rax), %rsi	 ;, _15
	movq	(%rbx), %rbx	 ; member_9->content.import, _16
 ; D:\TC\src\output.c:51:     ast_output(0, false, "name\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; _15,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:51:     ast_output(0, false, "name\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rcx	 ;, tmp136
	call	fwrite	 ;
 ; D:\TC\src\output.c:52:     output_name(import->name, outfile, indent + 1, parser);
	movq	(%rbx), %rcx	 ; _16->name, _16->name
	movq	%r14, %r9	 ; parser,
	movq	160(%rsp), %rax	 ; indent, tmp230
	leaq	3(%rax), %r8	 ;,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:53:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	%r14, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rsi, %rdx	 ; _15,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:53:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	8(%rbx), %rax	 ; _16->source, _24
 ; D:\TC\src\output.c:53:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	testq	%rax, %rax	 ; _24
 ; D:\TC\src\output.c:53:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	leaq	.LC66(%rip), %r8	 ;, tmp174
	cmovne	%rax, %r8	 ; _24,,
	leaq	.LC68(%rip), %rdx	 ;, tmp139
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:55: }
	jmp	.L93	 ;
.L117:
 ; D:\TC\src\output.c:48: }
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
