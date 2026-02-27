	.file	"D:\\TC\\src\\output.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O1
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
	.ascii "kind: \"unknown_NameType\"\12\0"
	.text
	.def	output_name;	.scl	3;	.type	32;	.endef
	.seh_proc	output_name
output_name:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rsi	 ; tmp127, name
	movq	%rdx, %rbx	 ; tmp128, outfile
	movq	%r8, %rdi	 ; tmp129, indent
	movq	%r9, %rbp	 ; tmp130, parser
 ; D:\TC\src\output.c:395:     if (name_ptr == NULL) {
	testq	%rcx, %rcx	 ; name
	je	.L12	 ;,
 ; D:\TC\src\output.c:399:     OUT(0, false, "name: \"%s\"\n", (name_ptr->name));
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:399:     OUT(0, false, "name: \"%s\"\n", (name_ptr->name));
	movq	(%rsi), %r8	 ; name_13(D)->name,
	leaq	.LC1(%rip), %rdx	 ;, tmp99
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:400:     OUT(0, false, "id: %zu\n", name_ptr->id);
	movq	%rbp, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:400:     OUT(0, false, "id: %zu\n", name_ptr->id);
	movq	8(%rsi), %r8	 ; name_13(D)->id,
	leaq	.LC2(%rip), %rdx	 ;, tmp101
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:401:     switch (name_ptr->kind) {
	cmpl	$5, 24(%rsi)	 ;, name_13(D)->kind
	ja	.L4	 ;,
	movl	24(%rsi), %eax	 ; name_13(D)->kind, name_13(D)->kind
	leaq	.L6(%rip), %rdx	 ;, tmp103
	movslq	(%rdx,%rax,4), %rax	 ;, tmp105
	addq	%rdx, %rax	 ; tmp103, tmp106
	jmp	*%rax	 ; tmp106
	.section .rdata,"dr"
	.align 4
.L6:
	.long	.L11-.L6
	.long	.L10-.L6
	.long	.L9-.L6
	.long	.L8-.L6
	.long	.L7-.L6
	.long	.L5-.L6
	.text
.L12:
 ; D:\TC\src\output.c:396:         OUT(0, true, "Name pointer: \"NULL\"\n");
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:396:         OUT(0, true, "Name pointer: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$21, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp97
	call	fwrite	 ;
	nop	
.L1:
 ; D:\TC\src\output.c:432: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L11:
 ; D:\TC\src\output.c:403:             OUT(0, true, "kind: \"type\"\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:403:             OUT(0, true, "kind: \"type\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC3(%rip), %rcx	 ;, tmp108
	call	fwrite	 ;
 ; D:\TC\src\output.c:404:             break;
	jmp	.L1	 ;
.L10:
 ; D:\TC\src\output.c:406:             OUT(0, false, "kind: \"variable\"\n");
	movq	%rbp, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:406:             OUT(0, false, "kind: \"variable\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rcx	 ;, tmp109
	call	fwrite	 ;
 ; D:\TC\src\output.c:407:             OUT(0, true, "type\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:407:             OUT(0, true, "type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp110
	call	fwrite	 ;
 ; D:\TC\src\output.c:408:             output_name(name_ptr->info.type, outfile, indent + 1, parser);
	movq	16(%rsi), %rcx	 ; name_13(D)->info.type, name_13(D)->info.type
	movq	%rbp, %r9	 ; parser,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:409:             break;
	jmp	.L1	 ;
.L9:
 ; D:\TC\src\output.c:411:             OUT(0, false, "kind: \"function\"\n");
	movq	%rbp, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:411:             OUT(0, false, "kind: \"function\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC6(%rip), %rcx	 ;, tmp113
	call	fwrite	 ;
 ; D:\TC\src\output.c:412:             OUT(0, true, "return_type\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:412:             OUT(0, true, "return_type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rcx	 ;, tmp114
	call	fwrite	 ;
 ; D:\TC\src\output.c:413:             output_name(name_ptr->info.type, outfile, indent + 1, parser);
	movq	16(%rsi), %rcx	 ; name_13(D)->info.type, name_13(D)->info.type
	movq	%rbp, %r9	 ; parser,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:414:             break;
	jmp	.L1	 ;
.L8:
 ; D:\TC\src\output.c:416:             OUT(0, false, "kind: \"method\"\n");
	movq	%rbp, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:416:             OUT(0, false, "kind: \"method\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC8(%rip), %rcx	 ;, tmp117
	call	fwrite	 ;
 ; D:\TC\src\output.c:417:             OUT(0, true, "return_type\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:417:             OUT(0, true, "return_type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rcx	 ;, tmp118
	call	fwrite	 ;
 ; D:\TC\src\output.c:418:             output_name(name_ptr->info.type, outfile, indent + 1, parser);
	movq	16(%rsi), %rcx	 ; name_13(D)->info.type, name_13(D)->info.type
	movq	%rbp, %r9	 ; parser,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:419:             break;
	jmp	.L1	 ;
.L7:
 ; D:\TC\src\output.c:421:             OUT(0, true, "kind: \"class\"\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:421:             OUT(0, true, "kind: \"class\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC9(%rip), %rcx	 ;, tmp121
	call	fwrite	 ;
 ; D:\TC\src\output.c:422:             break;
	jmp	.L1	 ;
.L5:
 ; D:\TC\src\output.c:424:             OUT(0, false, "kind: \"attribute\"\n");
	movq	%rbp, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:424:             OUT(0, false, "kind: \"attribute\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rcx	 ;, tmp122
	call	fwrite	 ;
 ; D:\TC\src\output.c:425:             OUT(0, true, "type\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:425:             OUT(0, true, "type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp123
	call	fwrite	 ;
 ; D:\TC\src\output.c:426:             output_name(name_ptr->info.type, outfile, indent + 1, parser);
	movq	16(%rsi), %rcx	 ; name_13(D)->info.type, name_13(D)->info.type
	movq	%rbp, %r9	 ; parser,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:427:             break;
	jmp	.L1	 ;
.L4:
 ; D:\TC\src\output.c:429:             OUT(0, true, "kind: \"unknown_NameType\"\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:429:             OUT(0, true, "kind: \"unknown_NameType\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$25, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC11(%rip), %rcx	 ;, tmp126
	call	fwrite	 ;
 ; D:\TC\src\output.c:430:             break;
	jmp	.L1	 ;
	.seh_endproc
	.section .rdata,"dr"
.LC12:
	.ascii "UNKNOWN_OPERATOR\0"
.LC13:
	.ascii "primary\12\0"
.LC14:
	.ascii "operator: \"%s\"\12\0"
.LC15:
	.ascii "left\12\0"
.LC16:
	.ascii "right\12\0"
	.text
	.def	output_expression;	.scl	3;	.type	32;	.endef
	.seh_proc	output_expression
output_expression:
	pushq	%r12	 ;
	.seh_pushreg	%r12
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$32, %rsp	 ;,
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %r12	 ; tmp102, expression
	movq	%rdx, %rbx	 ; tmp103, outfile
	movq	%r8, %rbp	 ; tmp104, indent
	movq	%r9, %rsi	 ; tmp105, parser
 ; D:\TC\src\output.c:282:     if (expression_ptr->operator == OP_NONE) {
	movl	24(%rcx), %ecx	 ; expression_9(D)->operator, _1
 ; D:\TC\src\output.c:282:     if (expression_ptr->operator == OP_NONE) {
	cmpl	$19, %ecx	 ;, _1
	je	.L18	 ;,
 ; D:\TC\src\output.c:286:         string op_str = operator_to_string(expression_ptr->operator);
	call	operator_to_string	 ;
	movq	%rax, %rdi	 ; tmp106, op_str
 ; D:\TC\src\output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	testq	%rdi, %rdi	 ; op_str
 ; D:\TC\src\output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	leaq	.LC12(%rip), %r8	 ;, tmp101
	cmovne	%rdi, %r8	 ; op_str,,
	leaq	.LC14(%rip), %rdx	 ;, tmp96
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:288:         OUT(0, false, "left\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:288:         OUT(0, false, "left\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC15(%rip), %rcx	 ;, tmp97
	call	fwrite	 ;
 ; D:\TC\src\output.c:289:         output_expression(expression_ptr->expr_left, outfile, indent + 1, parser);
	leaq	1(%rbp), %rdi	 ;, _4
	movq	(%r12), %rcx	 ; expression_9(D)->expr_left, expression_9(D)->expr_left
	movq	%rsi, %r9	 ; parser,
	movq	%rdi, %r8	 ; _4,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:\TC\src\output.c:290:         OUT(0, true, "right\n");
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:290:         OUT(0, true, "right\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rcx	 ;, tmp99
	call	fwrite	 ;
 ; D:\TC\src\output.c:291:         output_expression(expression_ptr->right, outfile, indent + 1, parser);
	movq	16(%r12), %rcx	 ; expression_9(D)->right, expression_9(D)->right
	movq	%rsi, %r9	 ; parser,
	movq	%rdi, %r8	 ; _4,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
	nop	
.L13:
 ; D:\TC\src\output.c:293: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L18:
 ; D:\TC\src\output.c:283:         OUT(0, true, "primary\n");
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:283:         OUT(0, true, "primary\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC13(%rip), %rcx	 ;, tmp93
	call	fwrite	 ;
 ; D:\TC\src\output.c:284:         output_primary(expression_ptr->prim_left, outfile, indent + 1, parser);
	movq	8(%r12), %rcx	 ; expression_9(D)->prim_left, expression_9(D)->prim_left
	movq	%rsi, %r9	 ; parser,
	leaq	1(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_primary	 ;
	jmp	.L13	 ;
	.seh_endproc
	.section .rdata,"dr"
.LC17:
	.ascii "name\12\0"
.LC18:
	.ascii "value\12\0"
.LC19:
	.ascii "value: \"NULL\"\12\0"
	.text
	.def	output_variable;	.scl	3;	.type	32;	.endef
	.seh_proc	output_variable
output_variable:
	pushq	%r12	 ;
	.seh_pushreg	%r12
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$32, %rsp	 ;,
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbp	 ; tmp98, variable
	movq	%rdx, %rbx	 ; tmp99, outfile
	movq	%r8, %rdi	 ; tmp100, indent
	movq	%r9, %rsi	 ; tmp101, parser
 ; D:\TC\src\output.c:144:     OUT(0, false, "type\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:144:     OUT(0, false, "type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp91
	call	fwrite	 ;
 ; D:\TC\src\output.c:145:     output_name(variable_ptr->type, outfile, indent + 1, parser);
	leaq	1(%rdi), %r12	 ;, _1
	movq	0(%rbp), %rcx	 ; variable_7(D)->type, variable_7(D)->type
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:146:     OUT(0, false, "name\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:146:     OUT(0, false, "name\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC17(%rip), %rcx	 ;, tmp93
	call	fwrite	 ;
 ; D:\TC\src\output.c:147:     output_name(variable_ptr->name, outfile, indent + 1, parser);
	movq	8(%rbp), %rcx	 ; variable_7(D)->name, variable_7(D)->name
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:148:     if (variable_ptr->value != 0) {
	cmpq	$0, 16(%rbp)	 ;, variable_7(D)->value
	je	.L20	 ;,
 ; D:\TC\src\output.c:149:         OUT(0, true, "value\n");
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:149:         OUT(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rcx	 ;, tmp95
	call	fwrite	 ;
 ; D:\TC\src\output.c:150:         output_expression(variable_ptr->value, outfile, indent + 1, parser);
	movq	16(%rbp), %rcx	 ; variable_7(D)->value, variable_7(D)->value
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
	nop	
.L19:
 ; D:\TC\src\output.c:153: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L20:
 ; D:\TC\src\output.c:152:         OUT(0, true, "value: \"NULL\"\n");
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:152:         OUT(0, true, "value: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC19(%rip), %rcx	 ;, tmp97
	call	fwrite	 ;
 ; D:\TC\src\output.c:153: }
	jmp	.L19	 ;
	.seh_endproc
	.section .rdata,"dr"
.LC20:
	.ascii "type: \"name\"\12\0"
.LC21:
	.ascii "type: \"function_call\"\12\0"
.LC22:
	.ascii "function\12\0"
.LC23:
	.ascii "arguments\12\0"
.LC24:
	.ascii "arguments[%d]\12\0"
.LC25:
	.ascii "type: \"get sequence_element\"\12\0"
.LC26:
	.ascii "sequence\12\0"
.LC27:
	.ascii "index\12\0"
.LC28:
	.ascii "type: \"get_attribute\"\12\0"
.LC29:
	.ascii "object\12\0"
.LC30:
	.ascii "attribute_name\12\0"
	.align 8
.LC31:
	.ascii "unknown_VariableAccessType: %d\12\0"
	.text
	.def	output_variable_access;	.scl	3;	.type	32;	.endef
	.seh_proc	output_variable_access
output_variable_access:
	pushq	%r15	 ;
	.seh_pushreg	%r15
	pushq	%r14	 ;
	.seh_pushreg	%r14
	pushq	%r13	 ;
	.seh_pushreg	%r13
	pushq	%r12	 ;
	.seh_pushreg	%r12
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rdi	 ; tmp128, variable_access
	movq	%rdx, %rbx	 ; tmp129, outfile
	movq	%r8, %rbp	 ; tmp130, indent
	movq	%r9, %rsi	 ; tmp131, parser
 ; D:\TC\src\output.c:352:     switch (var_access_ptr->type) {
	movl	16(%rcx), %eax	 ; variable_access_18(D)->type, _1
 ; D:\TC\src\output.c:352:     switch (var_access_ptr->type) {
	cmpl	$2, %eax	 ;, _1
	je	.L23	 ;,
	ja	.L24	 ;,
	testl	%eax, %eax	 ; _1
	je	.L34	 ;,
 ; D:\TC\src\output.c:359:             args = list_copy(var_access_ptr->content.args);
	movq	8(%rcx), %rcx	 ; variable_access_18(D)->content.args, variable_access_18(D)->content.args
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp132, args
 ; D:\TC\src\output.c:360:             OUT(0, false, "type: \"function_call\"\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:360:             OUT(0, false, "type: \"function_call\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$22, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC21(%rip), %rcx	 ;, tmp108
	call	fwrite	 ;
 ; D:\TC\src\output.c:361:             OUT(0, false, "function\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:361:             OUT(0, false, "function\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC22(%rip), %rcx	 ;, tmp109
	call	fwrite	 ;
 ; D:\TC\src\output.c:362:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	leaq	1(%rbp), %r14	 ;, _5
	movq	(%rdi), %rcx	 ; variable_access_18(D)->base, variable_access_18(D)->base
	movq	%rsi, %r9	 ; parser,
	movq	%r14, %r8	 ; _5,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; D:\TC\src\output.c:363:             OUT(0, true, "arguments\n");
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:363:             OUT(0, true, "arguments\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC23(%rip), %rcx	 ;, tmp111
	call	fwrite	 ;
 ; D:\TC\src\output.c:365:             index = -1;
	movl	$-1, %r12d	 ;, index
 ; D:\TC\src\output.c:367:                 OUT(1, false, "arguments[%d]\n", ++index);
	leaq	.LC24(%rip), %r15	 ;, tmp126
 ; D:\TC\src\output.c:368:                 output_expression(arg, outfile, indent + 2, parser);
	addq	$2, %rbp	 ;, tmp127
 ; D:\TC\src\output.c:366:             while ((arg = (Expression*)list_pop(args)) != 0) {
	jmp	.L30	 ;
.L24:
 ; D:\TC\src\output.c:352:     switch (var_access_ptr->type) {
	cmpl	$3, %eax	 ;, _1
	jne	.L35	 ;,
 ; D:\TC\src\output.c:372:             OUT(0, false, "type: \"get sequence_element\"\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:372:             OUT(0, false, "type: \"get sequence_element\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$29, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC25(%rip), %rcx	 ;, tmp114
	call	fwrite	 ;
 ; D:\TC\src\output.c:373:             OUT(0, false, "sequence\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:373:             OUT(0, false, "sequence\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC26(%rip), %rcx	 ;, tmp115
	call	fwrite	 ;
 ; D:\TC\src\output.c:374:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	leaq	1(%rbp), %r12	 ;, _8
	movq	(%rdi), %rcx	 ; variable_access_18(D)->base, variable_access_18(D)->base
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _8,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; D:\TC\src\output.c:375:             OUT(0, true, "index\n");
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:375:             OUT(0, true, "index\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC27(%rip), %rcx	 ;, tmp117
	call	fwrite	 ;
 ; D:\TC\src\output.c:376:             output_expression(var_access_ptr->content.index, outfile, indent + 1, parser);
	movq	8(%rdi), %rcx	 ; variable_access_18(D)->content.index, variable_access_18(D)->content.index
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _8,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:\TC\src\output.c:377:             break;
	jmp	.L22	 ;
.L34:
 ; D:\TC\src\output.c:354:             OUT(0, false, "type: \"name\"\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:354:             OUT(0, false, "type: \"name\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC20(%rip), %rcx	 ;, tmp103
	call	fwrite	 ;
 ; D:\TC\src\output.c:355:             OUT(0, true, "name\n");
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:355:             OUT(0, true, "name\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC17(%rip), %rcx	 ;, tmp104
	call	fwrite	 ;
 ; D:\TC\src\output.c:356:             output_name(var_access_ptr->content.name, outfile, indent + 1, parser);
	movq	8(%rdi), %rcx	 ; variable_access_18(D)->content.name, variable_access_18(D)->content.name
	movq	%rsi, %r9	 ; parser,
	leaq	1(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
	nop	
.L22:
 ; D:\TC\src\output.c:389: }
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
.L31:
 ; D:\TC\src\output.c:367:                 OUT(1, false, "arguments[%d]\n", ++index);
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r14, %rdx	 ; _5,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:367:                 OUT(1, false, "arguments[%d]\n", ++index);
	addl	$1, %r12d	 ;, index
	movl	%r12d, %r8d	 ; index,
	movq	%r15, %rdx	 ; tmp126,
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:368:                 output_expression(arg, outfile, indent + 2, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %r8	 ; tmp127,
	movq	%rbx, %rdx	 ; outfile,
	movq	%rdi, %rcx	 ; arg,
	call	output_expression	 ;
.L30:
 ; D:\TC\src\output.c:366:             while ((arg = (Expression*)list_pop(args)) != 0) {
	movq	%r13, %rcx	 ; args,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp133, arg
 ; D:\TC\src\output.c:366:             while ((arg = (Expression*)list_pop(args)) != 0) {
	testq	%rax, %rax	 ; arg
	jne	.L31	 ;,
	jmp	.L22	 ;
.L23:
 ; D:\TC\src\output.c:379:             OUT(0, false, "type: \"get_attribute\"\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:379:             OUT(0, false, "type: \"get_attribute\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$22, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC28(%rip), %rcx	 ;, tmp119
	call	fwrite	 ;
 ; D:\TC\src\output.c:380:             OUT(0, false, "object\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:380:             OUT(0, false, "object\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC29(%rip), %rcx	 ;, tmp120
	call	fwrite	 ;
 ; D:\TC\src\output.c:381:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	leaq	1(%rbp), %r12	 ;, _11
	movq	(%rdi), %rcx	 ; variable_access_18(D)->base, variable_access_18(D)->base
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _11,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; D:\TC\src\output.c:382:             OUT(0, true, "attribute_name\n");
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:382:             OUT(0, true, "attribute_name\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC30(%rip), %rcx	 ;, tmp122
	call	fwrite	 ;
 ; D:\TC\src\output.c:383:             output_name(var_access_ptr->content.attr_name, outfile, indent + 1, parser);
	movq	8(%rdi), %rcx	 ; variable_access_18(D)->content.attr_name, variable_access_18(D)->content.attr_name
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _11,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:384:             break;
	jmp	.L22	 ;
.L35:
 ; D:\TC\src\output.c:386:             OUT(0, true, "unknown_VariableAccessType: %d\n", var_access_ptr->type);
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:386:             OUT(0, true, "unknown_VariableAccessType: %d\n", var_access_ptr->type);
	movl	16(%rdi), %r8d	 ; variable_access_18(D)->type,
	leaq	.LC31(%rip), %rdx	 ;, tmp125
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:389: }
	jmp	.L22	 ;
	.seh_endproc
	.section .rdata,"dr"
.LC32:
	.ascii "type: \"integer\"\12\0"
.LC33:
	.ascii "value: %s\12\0"
.LC34:
	.ascii "type: \"float\"\12\0"
.LC35:
	.ascii "type: \"string\"\12\0"
.LC36:
	.ascii "value: \"%s\"\12\0"
.LC37:
	.ascii "type: \"boolean\"\12\0"
.LC38:
	.ascii "value: \"true\"\12\0"
.LC39:
	.ascii "value: \"false\"\12\0"
.LC40:
	.ascii "type: \"expression\"\12\0"
.LC41:
	.ascii "type: \"!\"\12\0"
.LC42:
	.ascii "type: \"-\"\12\0"
.LC43:
	.ascii "type: \"variable\"\12\0"
.LC44:
	.ascii "unknown_PrimaryType: %d\12\0"
	.text
	.def	output_primary;	.scl	3;	.type	32;	.endef
	.seh_proc	output_primary
output_primary:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rsi	 ; tmp136, primary
	movq	%rdx, %rbx	 ; tmp137, outfile
	movq	%r8, %rdi	 ; tmp138, indent
	movq	%r9, %rbp	 ; tmp139, parser
 ; D:\TC\src\output.c:299:     switch (primary_ptr->type) {
	cmpl	$8, 8(%rcx)	 ;, primary_15(D)->type
	ja	.L37	 ;,
	movl	8(%rcx), %eax	 ; primary_15(D)->type, primary_15(D)->type
	leaq	.L39(%rip), %rdx	 ;, tmp100
	movslq	(%rdx,%rax,4), %rax	 ;, tmp102
	addq	%rdx, %rax	 ; tmp100, tmp103
	jmp	*%rax	 ; tmp103
	.section .rdata,"dr"
	.align 4
.L39:
	.long	.L47-.L39
	.long	.L46-.L39
	.long	.L45-.L39
	.long	.L44-.L39
	.long	.L43-.L39
	.long	.L42-.L39
	.long	.L41-.L39
	.long	.L40-.L39
	.long	.L38-.L39
	.text
.L47:
 ; D:\TC\src\output.c:301:             OUT(0, false, "type: \"integer\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:301:             OUT(0, false, "type: \"integer\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC32(%rip), %rcx	 ;, tmp105
	call	fwrite	 ;
 ; D:\TC\src\output.c:302:             OUT(0, true, "value: %s\n", (primary_ptr->value.literal_value));
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:302:             OUT(0, true, "value: %s\n", (primary_ptr->value.literal_value));
	movq	(%rsi), %r8	 ; primary_15(D)->value.literal_value,
	leaq	.LC33(%rip), %rdx	 ;, tmp107
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
	nop	
.L36:
 ; D:\TC\src\output.c:344: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L46:
 ; D:\TC\src\output.c:305:             OUT(0, false, "type: \"float\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:305:             OUT(0, false, "type: \"float\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC34(%rip), %rcx	 ;, tmp108
	call	fwrite	 ;
 ; D:\TC\src\output.c:306:             OUT(0, true, "value: %s\n", (primary_ptr->value.literal_value));
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:306:             OUT(0, true, "value: %s\n", (primary_ptr->value.literal_value));
	movq	(%rsi), %r8	 ; primary_15(D)->value.literal_value,
	leaq	.LC33(%rip), %rdx	 ;, tmp110
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:307:             break;
	jmp	.L36	 ;
.L45:
 ; D:\TC\src\output.c:309:             OUT(0, false, "type: \"string\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:309:             OUT(0, false, "type: \"string\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC35(%rip), %rcx	 ;, tmp111
	call	fwrite	 ;
 ; D:\TC\src\output.c:310:             OUT(0, true, "value: \"%s\"\n", (primary_ptr->value.literal_value));
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:310:             OUT(0, true, "value: \"%s\"\n", (primary_ptr->value.literal_value));
	movq	(%rsi), %r8	 ; primary_15(D)->value.literal_value,
	leaq	.LC36(%rip), %rdx	 ;, tmp113
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:311:             break;
	jmp	.L36	 ;
.L44:
 ; D:\TC\src\output.c:313:             OUT(0, false, "type: \"boolean\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:313:             OUT(0, false, "type: \"boolean\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC37(%rip), %rcx	 ;, tmp114
	call	fwrite	 ;
 ; D:\TC\src\output.c:314:             OUT(0, true, "value: \"true\"\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:314:             OUT(0, true, "value: \"true\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC38(%rip), %rcx	 ;, tmp115
	call	fwrite	 ;
 ; D:\TC\src\output.c:315:             break;
	jmp	.L36	 ;
.L43:
 ; D:\TC\src\output.c:317:             OUT(0, false, "type: \"boolean\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:317:             OUT(0, false, "type: \"boolean\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC37(%rip), %rcx	 ;, tmp116
	call	fwrite	 ;
 ; D:\TC\src\output.c:318:             OUT(0, true, "value: \"false\"\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:318:             OUT(0, true, "value: \"false\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC39(%rip), %rcx	 ;, tmp117
	call	fwrite	 ;
 ; D:\TC\src\output.c:319:             break;
	jmp	.L36	 ;
.L42:
 ; D:\TC\src\output.c:321:             OUT(0, false, "type: \"expression\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:321:             OUT(0, false, "type: \"expression\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$19, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC40(%rip), %rcx	 ;, tmp118
	call	fwrite	 ;
 ; D:\TC\src\output.c:322:             OUT(0, true, "value\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:322:             OUT(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rcx	 ;, tmp119
	call	fwrite	 ;
 ; D:\TC\src\output.c:323:             output_expression(primary_ptr->value.expr, outfile, indent + 1, parser);
	movq	(%rsi), %rcx	 ; primary_15(D)->value.expr, primary_15(D)->value.expr
	movq	%rbp, %r9	 ; parser,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:\TC\src\output.c:324:             break;
	jmp	.L36	 ;
.L41:
 ; D:\TC\src\output.c:326:             OUT(0, false, "type: \"!\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:326:             OUT(0, false, "type: \"!\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC41(%rip), %rcx	 ;, tmp122
	call	fwrite	 ;
 ; D:\TC\src\output.c:327:             OUT(0, true, "value\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:327:             OUT(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rcx	 ;, tmp123
	call	fwrite	 ;
 ; D:\TC\src\output.c:328:             output_primary(primary_ptr->value.operand, outfile, indent + 1, parser);
	movq	(%rsi), %rcx	 ; primary_15(D)->value.operand, primary_15(D)->value.operand
	movq	%rbp, %r9	 ; parser,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_primary	 ;
 ; D:\TC\src\output.c:329:             break;
	jmp	.L36	 ;
.L40:
 ; D:\TC\src\output.c:331:             OUT(0, false, "type: \"-\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:331:             OUT(0, false, "type: \"-\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC42(%rip), %rcx	 ;, tmp126
	call	fwrite	 ;
 ; D:\TC\src\output.c:332:             OUT(0, true, "value\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:332:             OUT(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rcx	 ;, tmp127
	call	fwrite	 ;
 ; D:\TC\src\output.c:333:             output_primary(primary_ptr->value.operand, outfile, indent + 1, parser);
	movq	(%rsi), %rcx	 ; primary_15(D)->value.operand, primary_15(D)->value.operand
	movq	%rbp, %r9	 ; parser,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_primary	 ;
 ; D:\TC\src\output.c:334:             break;
	jmp	.L36	 ;
.L38:
 ; D:\TC\src\output.c:336:             OUT(0, false, "type: \"variable\"\n");
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:336:             OUT(0, false, "type: \"variable\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC43(%rip), %rcx	 ;, tmp130
	call	fwrite	 ;
 ; D:\TC\src\output.c:337:             OUT(0, true, "value\n");
	movq	%rbp, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:337:             OUT(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rcx	 ;, tmp131
	call	fwrite	 ;
 ; D:\TC\src\output.c:338:             output_variable_access(primary_ptr->value.var, outfile, indent + 1, parser);
	movq	(%rsi), %rcx	 ; primary_15(D)->value.var, primary_15(D)->value.var
	movq	%rbp, %r9	 ; parser,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; D:\TC\src\output.c:339:             break;
	jmp	.L36	 ;
.L37:
 ; D:\TC\src\output.c:341:             OUT(0, true, "unknown_PrimaryType: %d\n", primary_ptr->type);
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:341:             OUT(0, true, "unknown_PrimaryType: %d\n", primary_ptr->type);
	movl	8(%rsi), %r8d	 ; primary_15(D)->type,
	leaq	.LC44(%rip), %rdx	 ;, tmp135
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:344: }
	jmp	.L36	 ;
	.seh_endproc
	.section .rdata,"dr"
.LC45:
	.ascii "if_statement\12\0"
.LC46:
	.ascii "condition\12\0"
.LC47:
	.ascii "body\12\0"
.LC48:
	.ascii "else_if\12\0"
.LC49:
	.ascii "else_body\12\0"
.LC50:
	.ascii "for_statement\12\0"
.LC51:
	.ascii "initializer\12\0"
.LC52:
	.ascii "initializer: \"NULL\"\12\0"
.LC53:
	.ascii "condition: \"NULL\"\12\0"
.LC54:
	.ascii "increment\12\0"
.LC55:
	.ascii "increment: \"NULL\"\12\0"
.LC56:
	.ascii "while_statement\12\0"
	.align 8
.LC57:
	.ascii "variable_declaration_statement\12\0"
.LC58:
	.ascii "return_statement: \"NULL\"\12\0"
.LC59:
	.ascii "return_statement\12\0"
.LC60:
	.ascii "break_statement: \"NULL\"\12\0"
.LC61:
	.ascii "continue_statement: \"NULL\"\12\0"
.LC62:
	.ascii "expression_statement: \"NULL\"\12\0"
.LC63:
	.ascii "expression_statement\12\0"
.LC64:
	.ascii "unknown_StatementType: %d\12\0"
	.text
	.def	output_statement;	.scl	3;	.type	32;	.endef
	.seh_proc	output_statement
output_statement:
	pushq	%r15	 ;
	.seh_pushreg	%r15
	pushq	%r14	 ;
	.seh_pushreg	%r14
	pushq	%r13	 ;
	.seh_pushreg	%r13
	pushq	%r12	 ;
	.seh_pushreg	%r12
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$56, %rsp	 ;,
	.seh_stackalloc	56
	.seh_endprologue
	movq	%rcx, %rdi	 ; tmp195, statement
	movq	%rdx, %rbx	 ; tmp196, outfile
	movq	%r8, %rbp	 ; tmp197, indent
	movq	%r9, %rsi	 ; tmp198, parser
 ; D:\TC\src\output.c:159:     switch (statement_ptr->type) {
	cmpl	$7, 8(%rcx)	 ;, statement_18(D)->type
	ja	.L50	 ;,
	movl	8(%rcx), %eax	 ; statement_18(D)->type, statement_18(D)->type
	leaq	.L52(%rip), %rdx	 ;, tmp137
	movslq	(%rdx,%rax,4), %rax	 ;, tmp139
	addq	%rdx, %rax	 ; tmp137, tmp140
	jmp	*%rax	 ; tmp140
	.section .rdata,"dr"
	.align 4
.L52:
	.long	.L59-.L52
	.long	.L58-.L52
	.long	.L57-.L52
	.long	.L56-.L52
	.long	.L55-.L52
	.long	.L54-.L52
	.long	.L53-.L52
	.long	.L51-.L52
	.text
.L57:
 ; D:\TC\src\output.c:161:             OUT(0, false, "if_statement\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:161:             OUT(0, false, "if_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC45(%rip), %rcx	 ;, tmp142
	call	fwrite	 ;
 ; D:\TC\src\output.c:162:             output_if(statement_ptr->stmt.if_stmt, outfile, indent + 1, parser);
	leaq	1(%rbp), %r15	 ;, _2
	movq	%r15, 40(%rsp)	 ; _2, %sfp
	movq	(%rdi), %r12	 ; statement_18(D)->stmt.if_stmt, _3
 ; D:\TC\src\output.c:208:     list(Statement*) body = list_copy(if_ptr->body);
	movq	8(%r12), %rcx	 ; _3->body, _3->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp199, body
 ; D:\TC\src\output.c:209:     list(ElseIf*) else_if_list = list_copy(if_ptr->else_if);
	movq	16(%r12), %rcx	 ; _3->else_if, _3->else_if
	call	list_copy	 ;
	movq	%rax, %r14	 ; tmp200, else_if_list
 ; D:\TC\src\output.c:210:     list(Statement*) else_body = list_copy(if_ptr->else_body);
	movq	24(%r12), %rcx	 ; _3->else_body, _3->else_body
	call	list_copy	 ;
	movq	%rax, 32(%rsp)	 ; tmp201, %sfp
 ; D:\TC\src\output.c:211:     OUT(0, false, "condition\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r15, %rdx	 ; _2,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:211:     OUT(0, false, "condition\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC46(%rip), %rcx	 ;, tmp146
	call	fwrite	 ;
 ; D:\TC\src\output.c:212:     output_expression(if_ptr->condition, outfile, indent + 1, parser);
	leaq	2(%rbp), %r13	 ;, _57
	movq	(%r12), %rcx	 ; _3->condition, _3->condition
	movq	%rsi, %r9	 ; parser,
	movq	%r13, %r8	 ; _57,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:\TC\src\output.c:213:     OUT(0, false, "body\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r15, %rdx	 ; _2,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:213:     OUT(0, false, "body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC47(%rip), %rcx	 ;, tmp148
	call	fwrite	 ;
.L60:
 ; D:\TC\src\output.c:215:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp202, statement
 ; D:\TC\src\output.c:215:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	 ; statement
	je	.L81	 ;,
 ; D:\TC\src\output.c:216:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%r13, %r8	 ; _57,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
	jmp	.L60	 ;
.L81:
 ; D:\TC\src\output.c:217:     OUT(0, false, "else_if\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:217:     OUT(0, false, "else_if\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rcx	 ;, tmp149
	call	fwrite	 ;
 ; D:\TC\src\output.c:231:     OUT(0, false, "condition\n");
	leaq	.LC46(%rip), %r15	 ;, tmp191
 ; D:\TC\src\output.c:232:     output_expression(else_if_ptr->condition, outfile, indent + 1, parser);
	addq	$3, %rbp	 ;, _64
.L62:
 ; D:\TC\src\output.c:219:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != 0)
	movq	%r14, %rcx	 ; else_if_list,
	call	list_pop	 ;
	movq	%rax, %r12	 ; tmp205, else_if
 ; D:\TC\src\output.c:219:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != 0)
	testq	%rax, %rax	 ; else_if
	je	.L82	 ;,
 ; D:\TC\src\output.c:230:     list(Statement*) body = list_copy(else_if_ptr->body);
	movq	8(%r12), %rcx	 ; else_if_60->body, else_if_60->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp203, body
 ; D:\TC\src\output.c:231:     OUT(0, false, "condition\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _57,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:231:     OUT(0, false, "condition\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	movq	%r15, %rcx	 ; tmp191,
	call	fwrite	 ;
 ; D:\TC\src\output.c:232:     output_expression(else_if_ptr->condition, outfile, indent + 1, parser);
	movq	(%r12), %rcx	 ; else_if_60->condition, else_if_60->condition
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %r8	 ; _64,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:\TC\src\output.c:233:     OUT(0, true, "body\n");
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%r13, %rdx	 ; _57,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:233:     OUT(0, true, "body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC47(%rip), %rcx	 ;,
	call	fwrite	 ;
.L63:
 ; D:\TC\src\output.c:235:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
 ; D:\TC\src\output.c:235:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	 ; statement
	je	.L62	 ;,
 ; D:\TC\src\output.c:236:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %r8	 ; _64,
	movq	%rbx, %rdx	 ; outfile,
	movq	%rax, %rcx	 ; statement,
	call	output_statement	 ;
	jmp	.L63	 ;
.L82:
 ; D:\TC\src\output.c:221:     OUT(0, true, "else_body\n");
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:221:     OUT(0, true, "else_body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC49(%rip), %rcx	 ;, tmp154
	call	fwrite	 ;
.L66:
 ; D:\TC\src\output.c:222:     while ((statement = (Statement*)list_pop(else_body)) != 0)
	movq	32(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp206, statement
 ; D:\TC\src\output.c:222:     while ((statement = (Statement*)list_pop(else_body)) != 0)
	testq	%rax, %rax	 ; statement
	je	.L49	 ;,
 ; D:\TC\src\output.c:223:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%r13, %r8	 ; _57,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
	jmp	.L66	 ;
.L55:
 ; D:\TC\src\output.c:165:             OUT(0, false, "for_statement\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:165:             OUT(0, false, "for_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC50(%rip), %rcx	 ;, tmp155
	call	fwrite	 ;
 ; D:\TC\src\output.c:166:             output_for(statement_ptr->stmt.for_stmt, outfile, indent + 1, parser);
	leaq	1(%rbp), %r13	 ;, _4
	movq	(%rdi), %r12	 ; statement_18(D)->stmt.for_stmt, _5
 ; D:\TC\src\output.c:243:     list(Statement*) body = list_copy(for_ptr->body);
	movq	24(%r12), %rcx	 ; _5->body, _5->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp207, body
 ; D:\TC\src\output.c:244:     if (for_ptr->initializer != 0) {
	cmpq	$0, (%r12)	 ;, _5->initializer
	je	.L69	 ;,
 ; D:\TC\src\output.c:245:         OUT(0, false, "initializer\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:245:         OUT(0, false, "initializer\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC51(%rip), %rcx	 ;, tmp157
	call	fwrite	 ;
 ; D:\TC\src\output.c:246:         output_variable(for_ptr->initializer, outfile, indent + 1, parser);
	movq	(%r12), %rcx	 ; _5->initializer, _5->initializer
	movq	%rsi, %r9	 ; parser,
	leaq	2(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable	 ;
.L70:
 ; D:\TC\src\output.c:249:     if (for_ptr->condition != 0) {
	cmpq	$0, 8(%r12)	 ;, _5->condition
	je	.L71	 ;,
 ; D:\TC\src\output.c:250:         OUT(0, false, "condition\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:250:         OUT(0, false, "condition\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC46(%rip), %rcx	 ;, tmp161
	call	fwrite	 ;
 ; D:\TC\src\output.c:251:         output_expression(for_ptr->condition, outfile, indent + 1, parser);
	movq	8(%r12), %rcx	 ; _5->condition, _5->condition
	movq	%rsi, %r9	 ; parser,
	leaq	2(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
.L72:
 ; D:\TC\src\output.c:254:     if (for_ptr->increment != 0) {
	cmpq	$0, 16(%r12)	 ;, _5->increment
	je	.L73	 ;,
 ; D:\TC\src\output.c:255:         OUT(0, false, "increment\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:255:         OUT(0, false, "increment\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC54(%rip), %rcx	 ;, tmp165
	call	fwrite	 ;
 ; D:\TC\src\output.c:256:         output_expression(for_ptr->increment, outfile, indent + 1, parser);
	movq	16(%r12), %rcx	 ; _5->increment, _5->increment
	movq	%rsi, %r9	 ; parser,
	leaq	2(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
.L74:
 ; D:\TC\src\output.c:259:     OUT(0, true, "body\n");
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:259:     OUT(0, true, "body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC47(%rip), %rcx	 ;, tmp169
	call	fwrite	 ;
 ; D:\TC\src\output.c:262:         output_statement(statement, outfile, indent + 1, parser);
	addq	$2, %rbp	 ;, tmp194
.L75:
 ; D:\TC\src\output.c:261:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp208, statement
 ; D:\TC\src\output.c:261:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	 ; statement
	je	.L49	 ;,
 ; D:\TC\src\output.c:262:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %r8	 ; tmp194,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
	jmp	.L75	 ;
.L69:
 ; D:\TC\src\output.c:248:         OUT(0, false, "initializer: \"NULL\"\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:248:         OUT(0, false, "initializer: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$20, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC52(%rip), %rcx	 ;, tmp160
	call	fwrite	 ;
	jmp	.L70	 ;
.L71:
 ; D:\TC\src\output.c:253:         OUT(0, false, "condition: \"NULL\"\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:253:         OUT(0, false, "condition: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC53(%rip), %rcx	 ;, tmp164
	call	fwrite	 ;
	jmp	.L72	 ;
.L73:
 ; D:\TC\src\output.c:258:         OUT(0, false, "increment: \"NULL\"\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:258:         OUT(0, false, "increment: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC55(%rip), %rcx	 ;, tmp168
	call	fwrite	 ;
	jmp	.L74	 ;
.L56:
 ; D:\TC\src\output.c:169:             OUT(0, false, "while_statement\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:169:             OUT(0, false, "while_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC56(%rip), %rcx	 ;, tmp171
	call	fwrite	 ;
 ; D:\TC\src\output.c:170:             output_while(statement_ptr->stmt.while_stmt, outfile, indent + 1, parser);
	leaq	1(%rbp), %r12	 ;, _6
	movq	(%rdi), %r13	 ; statement_18(D)->stmt.while_stmt, _7
 ; D:\TC\src\output.c:269:     list(Statement*) body = list_copy(while_ptr->body);
	movq	8(%r13), %rcx	 ; _7->body, _7->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp209, body
 ; D:\TC\src\output.c:270:     OUT(0, false, "condition\n");
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r12, %rdx	 ; _6,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:270:     OUT(0, false, "condition\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC46(%rip), %rcx	 ;, tmp173
	call	fwrite	 ;
 ; D:\TC\src\output.c:271:     output_expression(while_ptr->condition, outfile, indent + 1, parser);
	addq	$2, %rbp	 ;, _82
	movq	0(%r13), %rcx	 ; _7->condition, _7->condition
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %r8	 ; _82,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:\TC\src\output.c:272:     OUT(0, true, "body\n");
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%r12, %rdx	 ; _6,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:272:     OUT(0, true, "body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC47(%rip), %rcx	 ;, tmp175
	call	fwrite	 ;
.L77:
 ; D:\TC\src\output.c:274:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp210, statement
 ; D:\TC\src\output.c:274:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	 ; statement
	je	.L49	 ;,
 ; D:\TC\src\output.c:275:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %r8	 ; _82,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
	jmp	.L77	 ;
.L58:
 ; D:\TC\src\output.c:173:             OUT(0, false, "variable_declaration_statement\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:173:             OUT(0, false, "variable_declaration_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC57(%rip), %rcx	 ;, tmp176
	call	fwrite	 ;
 ; D:\TC\src\output.c:174:             output_variable(statement_ptr->stmt.var, outfile, indent + 1, parser);
	movq	(%rdi), %rcx	 ; statement_18(D)->stmt.var, statement_18(D)->stmt.var
	movq	%rsi, %r9	 ; parser,
	leaq	1(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable	 ;
	nop	
.L49:
 ; D:\TC\src\output.c:202: }
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
.L54:
 ; D:\TC\src\output.c:177:             if (statement_ptr->stmt.expr == 0) {
	cmpq	$0, (%rcx)	 ;, statement_18(D)->stmt.expr
	je	.L83	 ;,
 ; D:\TC\src\output.c:181:             OUT(0, false, "return_statement\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:181:             OUT(0, false, "return_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC59(%rip), %rcx	 ;, tmp180
	call	fwrite	 ;
 ; D:\TC\src\output.c:182:             output_expression(statement_ptr->stmt.expr, outfile, indent + 1, parser);
	movq	(%rdi), %rcx	 ; statement_18(D)->stmt.expr, statement_18(D)->stmt.expr
	movq	%rsi, %r9	 ; parser,
	leaq	1(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:\TC\src\output.c:183:             break;
	jmp	.L49	 ;
.L83:
 ; D:\TC\src\output.c:178:                 OUT(0, false, "return_statement: \"NULL\"\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:178:                 OUT(0, false, "return_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$25, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC58(%rip), %rcx	 ;, tmp179
	call	fwrite	 ;
 ; D:\TC\src\output.c:179:                 return;
	jmp	.L49	 ;
.L53:
 ; D:\TC\src\output.c:185:             OUT(0, false, "break_statement: \"NULL\"\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:185:             OUT(0, false, "break_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$24, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC60(%rip), %rcx	 ;, tmp183
	call	fwrite	 ;
 ; D:\TC\src\output.c:186:             return;
	jmp	.L49	 ;
.L51:
 ; D:\TC\src\output.c:188:             OUT(0, false, "continue_statement: \"NULL\"\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:188:             OUT(0, false, "continue_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$27, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC61(%rip), %rcx	 ;, tmp184
	call	fwrite	 ;
 ; D:\TC\src\output.c:189:             return;
	jmp	.L49	 ;
.L59:
 ; D:\TC\src\output.c:191:             if (statement_ptr->stmt.expr == 0) {
	cmpq	$0, (%rcx)	 ;, statement_18(D)->stmt.expr
	je	.L84	 ;,
 ; D:\TC\src\output.c:195:             OUT(0, false, "expression_statement\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:195:             OUT(0, false, "expression_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$21, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC63(%rip), %rcx	 ;, tmp186
	call	fwrite	 ;
 ; D:\TC\src\output.c:196:             output_expression(statement_ptr->stmt.expr, outfile, indent + 1, parser);
	movq	(%rdi), %rcx	 ; statement_18(D)->stmt.expr, statement_18(D)->stmt.expr
	movq	%rsi, %r9	 ; parser,
	leaq	1(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:\TC\src\output.c:197:             break;
	jmp	.L49	 ;
.L84:
 ; D:\TC\src\output.c:192:                 OUT(0, false, "expression_statement: \"NULL\"\n");
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:192:                 OUT(0, false, "expression_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$29, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC62(%rip), %rcx	 ;, tmp185
	call	fwrite	 ;
 ; D:\TC\src\output.c:193:                 return;
	jmp	.L49	 ;
.L50:
 ; D:\TC\src\output.c:199:             OUT(0, false, "unknown_StatementType: %d\n", statement_ptr->type);
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:199:             OUT(0, false, "unknown_StatementType: %d\n", statement_ptr->type);
	movl	8(%rdi), %r8d	 ; statement_18(D)->type,
	leaq	.LC64(%rip), %rdx	 ;, tmp190
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:200:             return;
	jmp	.L49	 ;
	.seh_endproc
	.section .rdata,"dr"
.LC65:
	.ascii "NULL\0"
.LC66:
	.ascii "import\12\0"
.LC67:
	.ascii "source: \"%s\"\12\0"
.LC68:
	.ascii "parameters\12\0"
.LC69:
	.ascii "parameters[%d]\12\0"
.LC70:
	.ascii "class\12\0"
.LC71:
	.ascii "members\12\0"
.LC72:
	.ascii "method\12\0"
.LC73:
	.ascii "variable\12\0"
.LC74:
	.ascii "unknown_ClassMemberType: %d\12\0"
.LC75:
	.ascii "unknown_CodeMemberType: %d\12\0"
	.text
	.globl	output_code
	.def	output_code;	.scl	2;	.type	32;	.endef
	.seh_proc	output_code
output_code:
	pushq	%r15	 ;
	.seh_pushreg	%r15
	pushq	%r14	 ;
	.seh_pushreg	%r14
	pushq	%r13	 ;
	.seh_pushreg	%r13
	pushq	%r12	 ;
	.seh_pushreg	%r12
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$72, %rsp	 ;,
	.seh_stackalloc	72
	.seh_endprologue
	movq	%rdx, %r15	 ; tmp186, outfile
	movq	%r8, 160(%rsp)	 ; tmp187, indent
	movq	%r9, %r14	 ; tmp188, parser
 ; D:\TC\src\output.c:47:     list(CodeMember*) members = list_copy((code)->members);
	movq	(%rcx), %rcx	 ; code_5(D)->members, code_5(D)->members
	call	list_copy	 ;
	movq	%rax, 56(%rsp)	 ; tmp189, %sfp
 ; D:\TC\src\output.c:49:     while ((member = (CodeMember*)list_pop(members)) != 0)
	jmp	.L86	 ;
.L87:
 ; D:\TC\src\output.c:31:             OUT(0, false, "function\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:31:             OUT(0, false, "function\n");
	movq	%r15, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC22(%rip), %rcx	 ;, tmp140
	call	fwrite	 ;
 ; D:\TC\src\output.c:32:             output_function(code_member_ptr->content.function, outfile, indent + 1, parser);
	movq	160(%rsp), %rax	 ; indent, tmp232
	leaq	2(%rax), %rsi	 ;, _17
	movq	%rsi, 32(%rsp)	 ; _17, %sfp
	movq	(%rbx), %rbx	 ; member_9->content.function, _18
 ; D:\TC\src\output.c:66:     OUT(0, false, "name\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; _17,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:66:     OUT(0, false, "name\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC17(%rip), %rcx	 ;, tmp141
	call	fwrite	 ;
 ; D:\TC\src\output.c:67:     output_name(function_ptr->name, outfile, indent + 1, parser);
	movq	160(%rsp), %rax	 ; indent, tmp233
	leaq	3(%rax), %rdi	 ;, _26
	movq	(%rbx), %rcx	 ; _18->name, _18->name
	movq	%r14, %r9	 ; parser,
	movq	%rdi, %r8	 ; _26,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:68:     OUT(0, false, "return_type\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; _17,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:68:     OUT(0, false, "return_type\n");
	movq	%r15, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rcx	 ;, tmp143
	call	fwrite	 ;
 ; D:\TC\src\output.c:69:     output_name(function_ptr->return_type, outfile, indent + 1, parser);
	movq	8(%rbx), %rcx	 ; _18->return_type, _18->return_type
	movq	%r14, %r9	 ; parser,
	movq	%rdi, %r8	 ; _26,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:70:     OUT(0, false, "parameters\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; _17,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:70:     OUT(0, false, "parameters\n");
	movq	%r15, %r9	 ; outfile,
	movl	$11, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC68(%rip), %rcx	 ;, tmp145
	call	fwrite	 ;
 ; D:\TC\src\output.c:71:     list(Variable*) parameters = list_copy(function_ptr->parameters);
	movq	16(%rbx), %rcx	 ; _18->parameters, _18->parameters
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp190, parameters
 ; D:\TC\src\output.c:72:     list(Statement*) body = list_copy(function_ptr->body);
	movq	24(%rbx), %rcx	 ; _18->body, _18->body
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp191, body
 ; D:\TC\src\output.c:74:     int index = -1;
	movl	$-1, %esi	 ;, index
 ; D:\TC\src\output.c:77:         output_variable(parameter, outfile, indent + 2, parser);
	movq	160(%rsp), %rax	 ; indent, tmp234
	leaq	4(%rax), %r13	 ;, tmp181
.L92:
 ; D:\TC\src\output.c:75:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	movq	%r12, %rcx	 ; parameters,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp192, parameter
 ; D:\TC\src\output.c:75:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	testq	%rax, %rax	 ; parameter
	je	.L108	 ;,
 ; D:\TC\src\output.c:76:         OUT(1, false, "parameters[%d]\n", ++index);
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; _26,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:76:         OUT(1, false, "parameters[%d]\n", ++index);
	addl	$1, %esi	 ;, index
	movl	%esi, %r8d	 ; index,
	leaq	.LC69(%rip), %rdx	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:77:         output_variable(parameter, outfile, indent + 2, parser);
	movq	%r14, %r9	 ; parser,
	movq	%r13, %r8	 ; tmp181,
	movq	%r15, %rdx	 ; outfile,
	movq	%rbx, %rcx	 ; parameter,
	call	output_variable	 ;
	jmp	.L92	 ;
.L108:
 ; D:\TC\src\output.c:79:     OUT(0, true, "body\n");
	movq	%r14, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	32(%rsp), %rdx	 ; %sfp,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:79:     OUT(0, true, "body\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC47(%rip), %rcx	 ;, tmp150
	call	fwrite	 ;
.L94:
 ; D:\TC\src\output.c:81:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%rbp, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp193, statement
 ; D:\TC\src\output.c:81:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	 ; statement
	je	.L86	 ;,
 ; D:\TC\src\output.c:82:         output_statement(statement, outfile, indent + 1, parser);
	movq	%r14, %r9	 ; parser,
	movq	%rdi, %r8	 ; _26,
	movq	%r15, %rdx	 ; outfile,
	call	output_statement	 ;
	jmp	.L94	 ;
.L88:
 ; D:\TC\src\output.c:35:             OUT(0, false, "class\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:35:             OUT(0, false, "class\n");
	movq	%r15, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC70(%rip), %rcx	 ;, tmp151
	call	fwrite	 ;
 ; D:\TC\src\output.c:36:             output_class(code_member_ptr->content.class_, outfile, indent + 1, parser);
	movq	160(%rsp), %rax	 ; indent, tmp235
	leaq	2(%rax), %rsi	 ;, _19
	movq	(%rbx), %rbx	 ; member_9->content.class_, _20
 ; D:\TC\src\output.c:131:     OUT(0, false, "name\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; _19,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:131:     OUT(0, false, "name\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC17(%rip), %rcx	 ;, tmp152
	call	fwrite	 ;
 ; D:\TC\src\output.c:132:     output_name(class_ptr->name, outfile, indent + 1, parser);
	movq	160(%rsp), %rax	 ; indent, tmp237
	addq	$3, %rax	 ;, _38
	movq	%rax, 40(%rsp)	 ; _38, %sfp
	movq	(%rbx), %rcx	 ; _20->name, _20->name
	movq	%r14, %r9	 ; parser,
	movq	%rax, %r8	 ; _38,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:133:     OUT(0, true, "members\n");
	movq	%r14, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rsi, %rdx	 ; _19,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:133:     OUT(0, true, "members\n");
	movq	%r15, %r9	 ; outfile,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC71(%rip), %rcx	 ;, tmp154
	call	fwrite	 ;
 ; D:\TC\src\output.c:134:     list(ClassMember*) members = list_copy(class_ptr->members);
	movq	8(%rbx), %rcx	 ; _20->members, _20->members
	call	list_copy	 ;
	movq	%rax, 32(%rsp)	 ; tmp194, %sfp
 ; D:\TC\src\output.c:136:     while ((member = (ClassMember*)list_pop(members)) != 0)
	jmp	.L96	 ;
.L97:
 ; D:\TC\src\output.c:114:             OUT(0, false, "method\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:114:             OUT(0, false, "method\n");
	movq	%r15, %r9	 ; outfile,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC72(%rip), %rcx	 ;,
	call	fwrite	 ;
 ; D:\TC\src\output.c:115:             output_method(class_member_ptr->content.method, outfile, indent + 1, parser);
	movq	160(%rsp), %rax	 ; indent, tmp239
	leaq	4(%rax), %rsi	 ;, _44
	movq	%rsi, 48(%rsp)	 ; _44, %sfp
	movq	(%rbx), %rbx	 ; member_42->content.method, _45
 ; D:\TC\src\output.c:89:     OUT(0, false, "name\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; _44,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:89:     OUT(0, false, "name\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC17(%rip), %rcx	 ;, tmp157
	call	fwrite	 ;
 ; D:\TC\src\output.c:90:     output_name(method_ptr->name, outfile, indent + 1, parser);
	movq	160(%rsp), %rax	 ; indent, tmp240
	leaq	5(%rax), %rdi	 ;, _49
	movq	(%rbx), %rcx	 ; _45->name, _45->name
	movq	%r14, %r9	 ; parser,
	movq	%rdi, %r8	 ; _49,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:91:     OUT(0, false, "return_type\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; _44,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:91:     OUT(0, false, "return_type\n");
	movq	%r15, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rcx	 ;, tmp159
	call	fwrite	 ;
 ; D:\TC\src\output.c:92:     output_name(method_ptr->return_type, outfile, indent + 1, parser);
	movq	8(%rbx), %rcx	 ; _45->return_type, _45->return_type
	movq	%r14, %r9	 ; parser,
	movq	%rdi, %r8	 ; _49,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:93:     OUT(0, false, "parameters\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; _44,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:93:     OUT(0, false, "parameters\n");
	movq	%r15, %r9	 ; outfile,
	movl	$11, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC68(%rip), %rcx	 ;, tmp161
	call	fwrite	 ;
 ; D:\TC\src\output.c:94:     list(Variable*) parameters = list_copy(method_ptr->parameters);
	movq	16(%rbx), %rcx	 ; _45->parameters, _45->parameters
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp195, parameters
 ; D:\TC\src\output.c:95:     list(Statement*) body = list_copy(method_ptr->body);
	movq	24(%rbx), %rcx	 ; _45->body, _45->body
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp196, body
 ; D:\TC\src\output.c:97:     int index = -1;
	movl	$-1, %esi	 ;, index
 ; D:\TC\src\output.c:100:         output_variable(parameter, outfile, indent + 2, parser);
	movq	160(%rsp), %rax	 ; indent, tmp241
	leaq	6(%rax), %r13	 ;, tmp176
 ; D:\TC\src\output.c:98:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	jmp	.L100	 ;
.L101:
 ; D:\TC\src\output.c:99:         OUT(1, false, "parameters[%d]\n", ++index);
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; _49,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:99:         OUT(1, false, "parameters[%d]\n", ++index);
	addl	$1, %esi	 ;, index
	movl	%esi, %r8d	 ; index,
	leaq	.LC69(%rip), %rdx	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:100:         output_variable(parameter, outfile, indent + 2, parser);
	movq	%r14, %r9	 ; parser,
	movq	%r13, %r8	 ; tmp176,
	movq	%r15, %rdx	 ; outfile,
	movq	%rbx, %rcx	 ; parameter,
	call	output_variable	 ;
.L100:
 ; D:\TC\src\output.c:98:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	movq	%r12, %rcx	 ; parameters,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp197, parameter
 ; D:\TC\src\output.c:98:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	testq	%rax, %rax	 ; parameter
	jne	.L101	 ;,
 ; D:\TC\src\output.c:102:     OUT(0, true, "body\n");
	movq	%r14, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	48(%rsp), %rdx	 ; %sfp,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:102:     OUT(0, true, "body\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC47(%rip), %rcx	 ;, tmp166
	call	fwrite	 ;
 ; D:\TC\src\output.c:104:     while ((statement = (Statement*)list_pop(body)) != 0)
	jmp	.L102	 ;
.L103:
 ; D:\TC\src\output.c:105:         output_statement(statement, outfile, indent + 1, parser);
	movq	%r14, %r9	 ; parser,
	movq	%rdi, %r8	 ; _49,
	movq	%r15, %rdx	 ; outfile,
	call	output_statement	 ;
.L102:
 ; D:\TC\src\output.c:104:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%rbp, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp198, statement
 ; D:\TC\src\output.c:104:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	 ; statement
	jne	.L103	 ;,
.L96:
 ; D:\TC\src\output.c:136:     while ((member = (ClassMember*)list_pop(members)) != 0)
	movq	32(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp199, member
 ; D:\TC\src\output.c:136:     while ((member = (ClassMember*)list_pop(members)) != 0)
	testq	%rax, %rax	 ; member
	je	.L86	 ;,
 ; D:\TC\src\output.c:112:     switch (class_member_ptr->type) {
	movl	8(%rbx), %eax	 ; member_42->type, _43
 ; D:\TC\src\output.c:112:     switch (class_member_ptr->type) {
	testl	%eax, %eax	 ; _43
	je	.L97	 ;,
	cmpl	$1, %eax	 ;, _43
	je	.L98	 ;,
 ; D:\TC\src\output.c:122:             OUT(0, false, "unknown_ClassMemberType: %d\n", class_member_ptr->type);
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:122:             OUT(0, false, "unknown_ClassMemberType: %d\n", class_member_ptr->type);
	movl	8(%rbx), %r8d	 ; member_42->type,
	leaq	.LC74(%rip), %rdx	 ;, tmp171
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:123:             break;
	jmp	.L96	 ;
.L98:
 ; D:\TC\src\output.c:118:             OUT(0, false, "variable\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:118:             OUT(0, false, "variable\n");
	movq	%r15, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC73(%rip), %rcx	 ;, tmp167
	call	fwrite	 ;
 ; D:\TC\src\output.c:119:             output_variable(class_member_ptr->content.variable, outfile, indent + 1, parser);
	movq	(%rbx), %rcx	 ; member_42->content.variable, member_42->content.variable
	movq	%r14, %r9	 ; parser,
	movq	160(%rsp), %rax	 ; indent, tmp242
	leaq	4(%rax), %r8	 ;,
	movq	%r15, %rdx	 ; outfile,
	call	output_variable	 ;
 ; D:\TC\src\output.c:120:             break;
	jmp	.L96	 ;
.L89:
 ; D:\TC\src\output.c:39:             OUT(0, false, "unknown_CodeMemberType: %d\n", code_member_ptr->type);
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:39:             OUT(0, false, "unknown_CodeMemberType: %d\n", code_member_ptr->type);
	movl	8(%rbx), %r8d	 ; member_9->type,
	leaq	.LC75(%rip), %rdx	 ;, tmp173
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
.L86:
 ; D:\TC\src\output.c:49:     while ((member = (CodeMember*)list_pop(members)) != 0)
	movq	56(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp200, member
 ; D:\TC\src\output.c:49:     while ((member = (CodeMember*)list_pop(members)) != 0)
	testq	%rax, %rax	 ; member
	je	.L109	 ;,
 ; D:\TC\src\output.c:50:         output_code_member(member, outfile, indent + 1, parser);
	movq	160(%rsp), %rax	 ; indent, tmp228
	leaq	1(%rax), %rdx	 ;, _2
 ; D:\TC\src\output.c:25:     switch (code_member_ptr->type) {
	movl	8(%rbx), %eax	 ; member_9->type, _14
 ; D:\TC\src\output.c:25:     switch (code_member_ptr->type) {
	cmpl	$1, %eax	 ;, _14
	je	.L87	 ;,
	cmpl	$2, %eax	 ;, _14
	je	.L88	 ;,
	testl	%eax, %eax	 ; _14
	jne	.L89	 ;,
 ; D:\TC\src\output.c:27:             OUT(0, false, "import\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:27:             OUT(0, false, "import\n");
	movq	%r15, %r9	 ; outfile,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC66(%rip), %rcx	 ;, tmp135
	call	fwrite	 ;
 ; D:\TC\src\output.c:28:             output_import(code_member_ptr->content.import, outfile, indent + 1, parser);
	movq	160(%rsp), %rax	 ; indent, tmp229
	leaq	2(%rax), %rsi	 ;, _15
	movq	(%rbx), %rbx	 ; member_9->content.import, _16
 ; D:\TC\src\output.c:57:     OUT(0, false, "name\n");
	movq	%r14, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; _15,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:57:     OUT(0, false, "name\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC17(%rip), %rcx	 ;, tmp136
	call	fwrite	 ;
 ; D:\TC\src\output.c:58:     output_name(import_ptr->name, outfile, indent + 1, parser);
	movq	(%rbx), %rcx	 ; _16->name, _16->name
	movq	%r14, %r9	 ; parser,
	movq	160(%rsp), %rax	 ; indent, tmp230
	leaq	3(%rax), %r8	 ;,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	movq	%r14, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rsi, %rdx	 ; _15,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	movq	8(%rbx), %rax	 ; _16->source, _24
 ; D:\TC\src\output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	testq	%rax, %rax	 ; _24
 ; D:\TC\src\output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	leaq	.LC65(%rip), %r8	 ;, tmp174
	cmovne	%rax, %r8	 ; _24,,
	leaq	.LC67(%rip), %rdx	 ;, tmp139
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:60: }
	jmp	.L86	 ;
.L109:
 ; D:\TC\src\output.c:51: }
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
	.seh_endproc
	.ident	"GCC: (GNU) 13.2.0"
	.def	indention;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
