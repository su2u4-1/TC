	.file	"D:\\TC\\src\\output.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O3
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
	.p2align 4
	.def	output_name;	.scl	3;	.type	32;	.endef
	.seh_proc	output_name
output_name:
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
 ; D:\TC\src\output.c:390: void output_name(Name* name, FILE* outfile, size_t indent, Parser* parser) {
	movq	%rcx, %rsi	 ; tmp116, name
	movq	%rdx, %rbx	 ; tmp117, outfile
	movq	%r8, %r12	 ; tmp118, indent
	movq	%r9, %rdi	 ; tmp119, parser
 ; D:\TC\src\output.c:395:     if (name_ptr == NULL) {
	testq	%rcx, %rcx	 ; name
	je	.L2	 ;,
	addq	$1, %r12	 ;, indent
	leaq	.LC1(%rip), %r15	 ;, tmp113
	leaq	.LC2(%rip), %r14	 ;, tmp114
 ; D:\TC\src\output.c:401:     switch (name_ptr->kind) {
	leaq	.L7(%rip), %r13	 ;, tmp115
.L4:
	leaq	-1(%r12), %rbp	 ;, indent
 ; D:\TC\src\output.c:399:     OUT(0, false, "name: \"%s\"\n", (name_ptr->name));
	movq	%rdi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; outfile,
	movq	%rbp, %rdx	 ; indent,
	call	indention	 ;
 ; D:\TC\src\output.c:399:     OUT(0, false, "name: \"%s\"\n", (name_ptr->name));
	movq	(%rsi), %r8	 ; name_52->name,
	movq	%r15, %rdx	 ; tmp113,
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:400:     OUT(0, false, "id: %zu\n", name_ptr->id);
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %r9	 ; parser,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:400:     OUT(0, false, "id: %zu\n", name_ptr->id);
	movq	8(%rsi), %r8	 ; name_52->id,
	movq	%r14, %rdx	 ; tmp114,
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:401:     switch (name_ptr->kind) {
	cmpl	$5, 24(%rsi)	 ;, name_52->kind
	ja	.L5	 ;,
	movl	24(%rsi), %eax	 ; name_52->kind, name_52->kind
 ; D:\TC\src\output.c:424:             OUT(0, false, "kind: \"attribute\"\n");
	movq	%rdi, %r9	 ; parser,
 ; D:\TC\src\output.c:401:     switch (name_ptr->kind) {
	movslq	0(%r13,%rax,4), %rax	 ;, tmp99
	addq	%r13, %rax	 ; tmp115, tmp100
	jmp	*%rax	 ; tmp100
	.section .rdata,"dr"
	.align 4
.L7:
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
 ; D:\TC\src\output.c:421:             OUT(0, true, "kind: \"class\"\n");
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:421:             OUT(0, true, "kind: \"class\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC9(%rip), %rcx	 ;, tmp109
.L21:
 ; D:\TC\src\output.c:432: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:429:             OUT(0, true, "kind: \"unknown_NameType\"\n");
	jmp	fwrite	 ;
	.p2align 4,,10
	.p2align 3
.L9:
 ; D:\TC\src\output.c:416:             OUT(0, false, "kind: \"method\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:416:             OUT(0, false, "kind: \"method\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC8(%rip), %rcx	 ;, tmp107
.L19:
	call	fwrite	 ;
 ; D:\TC\src\output.c:417:             OUT(0, true, "return_type\n");
	movq	%rdi, %r9	 ; parser,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:417:             OUT(0, true, "return_type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rcx	 ;, tmp108
	call	fwrite	 ;
 ; D:\TC\src\output.c:418:             output_name(name_ptr->info.type, outfile, indent + 1, parser);
	movq	16(%rsi), %rsi	 ; name_52->info.type, name
.L13:
 ; D:\TC\src\output.c:395:     if (name_ptr == NULL) {
	leaq	1(%r12), %rax	 ;, ivtmp.25
	testq	%rsi, %rsi	 ; name
	je	.L2	 ;,
	movq	%rax, %r12	 ; ivtmp.25, indent
	jmp	.L4	 ;
	.p2align 4,,10
	.p2align 3
.L10:
 ; D:\TC\src\output.c:411:             OUT(0, false, "kind: \"function\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:411:             OUT(0, false, "kind: \"function\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC6(%rip), %rcx	 ;, tmp105
	jmp	.L19	 ;
	.p2align 4,,10
	.p2align 3
.L11:
 ; D:\TC\src\output.c:406:             OUT(0, false, "kind: \"variable\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:406:             OUT(0, false, "kind: \"variable\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rcx	 ;, tmp103
.L20:
 ; D:\TC\src\output.c:424:             OUT(0, false, "kind: \"attribute\"\n");
	call	fwrite	 ;
 ; D:\TC\src\output.c:425:             OUT(0, true, "type\n");
	movq	%rdi, %r9	 ; parser,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:425:             OUT(0, true, "type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp111
	call	fwrite	 ;
 ; D:\TC\src\output.c:426:             output_name(name_ptr->info.type, outfile, indent + 1, parser);
	movq	16(%rsi), %rsi	 ; name_52->info.type, name
 ; D:\TC\src\output.c:427:             break;
	jmp	.L13	 ;
	.p2align 4,,10
	.p2align 3
.L12:
 ; D:\TC\src\output.c:403:             OUT(0, true, "kind: \"type\"\n");
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:403:             OUT(0, true, "kind: \"type\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC3(%rip), %rcx	 ;, tmp102
	jmp	.L21	 ;
	.p2align 4,,10
	.p2align 3
.L6:
 ; D:\TC\src\output.c:424:             OUT(0, false, "kind: \"attribute\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:424:             OUT(0, false, "kind: \"attribute\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rcx	 ;, tmp110
	jmp	.L20	 ;
.L5:
 ; D:\TC\src\output.c:429:             OUT(0, true, "kind: \"unknown_NameType\"\n");
	movq	%rdi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:429:             OUT(0, true, "kind: \"unknown_NameType\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$25, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC11(%rip), %rcx	 ;, tmp112
	jmp	.L21	 ;
	.p2align 4,,10
	.p2align 3
.L2:
 ; D:\TC\src\output.c:396:         OUT(0, true, "Name pointer: \"NULL\"\n");
	movq	%rdi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%r12, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:396:         OUT(0, true, "Name pointer: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$21, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp91
	jmp	.L21	 ;
	.seh_endproc
	.section .rdata,"dr"
.LC12:
	.ascii "primary\12\0"
.LC13:
	.ascii "type: \"integer\"\12\0"
.LC14:
	.ascii "value: %s\12\0"
.LC15:
	.ascii "type: \"float\"\12\0"
.LC16:
	.ascii "type: \"string\"\12\0"
.LC17:
	.ascii "value: \"%s\"\12\0"
.LC18:
	.ascii "type: \"boolean\"\12\0"
.LC19:
	.ascii "value: \"true\"\12\0"
.LC20:
	.ascii "value: \"false\"\12\0"
.LC21:
	.ascii "type: \"expression\"\12\0"
.LC22:
	.ascii "value\12\0"
.LC23:
	.ascii "type: \"!\"\12\0"
.LC24:
	.ascii "type: \"-\"\12\0"
.LC25:
	.ascii "type: \"variable\"\12\0"
.LC26:
	.ascii "unknown_PrimaryType: %d\12\0"
.LC27:
	.ascii "operator: \"%s\"\12\0"
.LC28:
	.ascii "left\12\0"
.LC29:
	.ascii "right\12\0"
.LC30:
	.ascii "UNKNOWN_OPERATOR\0"
	.text
	.p2align 4
	.def	output_expression;	.scl	3;	.type	32;	.endef
	.seh_proc	output_expression
output_expression:
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
 ; D:\TC\src\output.c:299:     switch (primary_ptr->type) {
	leaq	.L28(%rip), %r15	 ;, tmp142
 ; D:\TC\src\output.c:277: void output_expression(Expression* expression, FILE* outfile, size_t indent, Parser* parser) {
	movq	%rcx, %rbp	 ; tmp145, expression
	movq	%rdx, %rbx	 ; tmp146, outfile
	movq	%r8, %rsi	 ; tmp147, indent
	movq	%r9, %rdi	 ; tmp148, parser
.L37:
 ; D:\TC\src\output.c:282:     if (expression_ptr->operator == OP_NONE) {
	movl	24(%rbp), %ecx	 ; expression_4->operator, _16
	leaq	.LC28(%rip), %r13	 ;, tmp140
	leaq	.LC29(%rip), %r12	 ;, tmp141
 ; D:\TC\src\output.c:282:     if (expression_ptr->operator == OP_NONE) {
	cmpl	$19, %ecx	 ;, _16
	je	.L56	 ;,
.L24:
 ; D:\TC\src\output.c:286:         string op_str = operator_to_string(expression_ptr->operator);
	call	operator_to_string	 ;
 ; D:\TC\src\output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %r9	 ; parser,
	movq	%rsi, %rdx	 ; indent,
 ; D:\TC\src\output.c:286:         string op_str = operator_to_string(expression_ptr->operator);
	movq	%rax, %r14	 ; tmp149, op_str
 ; D:\TC\src\output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	movq	%r14, %r8	 ; op_str,
 ; D:\TC\src\output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	testq	%r14, %r14	 ; op_str
	je	.L57	 ;,
.L51:
 ; D:\TC\src\output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	leaq	.LC27(%rip), %rdx	 ;,
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:289:         output_expression(expression_ptr->expr_left, outfile, indent + 1, parser);
	leaq	1(%rsi), %r14	 ;, _108
 ; D:\TC\src\output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	call	fprintf	 ;
 ; D:\TC\src\output.c:288:         OUT(0, false, "left\n");
	movq	%rdi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:288:         OUT(0, false, "left\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; tmp140,
	movl	$5, %r8d	 ;,
	call	fwrite	 ;
 ; D:\TC\src\output.c:289:         output_expression(expression_ptr->expr_left, outfile, indent + 1, parser);
	movq	0(%rbp), %rcx	 ; expression_92->expr_left, expression_92->expr_left
	movq	%rdi, %r9	 ; parser,
	movq	%r14, %r8	 ; _108,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:\TC\src\output.c:290:         OUT(0, true, "right\n");
	movq	%rdi, %r9	 ; parser,
	movq	%rsi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:290:         OUT(0, true, "right\n");
	movq	%r12, %rcx	 ; tmp141,
	movq	%rbx, %r9	 ; outfile,
	movl	$1, %edx	 ;,
	movl	$6, %r8d	 ;,
	call	fwrite	 ;
 ; D:\TC\src\output.c:291:         output_expression(expression_ptr->right, outfile, indent + 1, parser);
	movq	16(%rbp), %rbp	 ; expression_92->right, expression
 ; D:\TC\src\output.c:282:     if (expression_ptr->operator == OP_NONE) {
	movl	24(%rbp), %ecx	 ;, _16
 ; D:\TC\src\output.c:282:     if (expression_ptr->operator == OP_NONE) {
	cmpl	$19, %ecx	 ;, _16
	je	.L40	 ;,
	movq	%r14, %rsi	 ; _108, indent
	jmp	.L24	 ;
	.p2align 4,,10
	.p2align 3
.L57:
 ; D:\TC\src\output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	leaq	.LC30(%rip), %r8	 ;,
	jmp	.L51	 ;
	.p2align 4,,10
	.p2align 3
.L56:
 ; D:\TC\src\output.c:282:     if (expression_ptr->operator == OP_NONE) {
	movq	%rsi, %r14	 ; indent, _108
.L40:
 ; D:\TC\src\output.c:283:         OUT(0, true, "primary\n");
	movq	%rdi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%r14, %rdx	 ; _108,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:283:         OUT(0, true, "primary\n");
	movq	%rbx, %r9	 ; outfile,
	leaq	2(%r14), %rsi	 ;, indent
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC12(%rip), %rcx	 ;,
	call	fwrite	 ;
 ; D:\TC\src\output.c:284:         output_primary(expression_ptr->prim_left, outfile, indent + 1, parser);
	movq	8(%rbp), %rbp	 ; expression_99->prim_left, primary
.L25:
 ; D:\TC\src\output.c:299:     switch (primary_ptr->type) {
	cmpl	$8, 8(%rbp)	 ;, primary_28->type
	leaq	-1(%rsi), %r12	 ;, indent
	ja	.L26	 ;,
	movl	8(%rbp), %eax	 ; primary_28->type, primary_28->type
 ; D:\TC\src\output.c:336:             OUT(0, false, "type: \"variable\"\n");
	movq	%rdi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%r12, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:299:     switch (primary_ptr->type) {
	movslq	(%r15,%rax,4), %rax	 ;, tmp103
	addq	%r15, %rax	 ; tmp142, tmp104
	jmp	*%rax	 ; tmp104
	.section .rdata,"dr"
	.align 4
.L28:
	.long	.L36-.L28
	.long	.L35-.L28
	.long	.L34-.L28
	.long	.L33-.L28
	.long	.L32-.L28
	.long	.L31-.L28
	.long	.L30-.L28
	.long	.L29-.L28
	.long	.L27-.L28
	.text
	.p2align 4,,10
	.p2align 3
.L29:
 ; D:\TC\src\output.c:331:             OUT(0, false, "type: \"-\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:331:             OUT(0, false, "type: \"-\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC24(%rip), %rcx	 ;, tmp123
.L52:
	call	fwrite	 ;
 ; D:\TC\src\output.c:332:             OUT(0, true, "value\n");
	movq	%rdi, %r9	 ; parser,
	movq	%r12, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	addq	$1, %rsi	 ;, indent
	call	indention	 ;
 ; D:\TC\src\output.c:332:             OUT(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC22(%rip), %rcx	 ;, tmp124
	call	fwrite	 ;
 ; D:\TC\src\output.c:333:             output_primary(primary_ptr->value.operand, outfile, indent + 1, parser);
	movq	0(%rbp), %rbp	 ; primary_28->value.operand, primary
	jmp	.L25	 ;
	.p2align 4,,10
	.p2align 3
.L27:
 ; D:\TC\src\output.c:336:             OUT(0, false, "type: \"variable\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:336:             OUT(0, false, "type: \"variable\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC25(%rip), %rcx	 ;, tmp125
	call	fwrite	 ;
 ; D:\TC\src\output.c:337:             OUT(0, true, "value\n");
	movq	%rdi, %r9	 ; parser,
	movq	%r12, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:337:             OUT(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC22(%rip), %rcx	 ;, tmp126
	call	fwrite	 ;
 ; D:\TC\src\output.c:338:             output_variable_access(primary_ptr->value.var, outfile, indent + 1, parser);
	movq	0(%rbp), %rcx	 ; primary_28->value.var, primary_28->value.var
	movq	%rdi, %r9	 ; parser,
	movq	%rsi, %r8	 ; indent,
	movq	%rbx, %rdx	 ; outfile,
 ; D:\TC\src\output.c:293: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:338:             output_variable_access(primary_ptr->value.var, outfile, indent + 1, parser);
	jmp	output_variable_access	 ;
	.p2align 4,,10
	.p2align 3
.L36:
 ; D:\TC\src\output.c:301:             OUT(0, false, "type: \"integer\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:301:             OUT(0, false, "type: \"integer\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC13(%rip), %rcx	 ;, tmp106
.L53:
 ; D:\TC\src\output.c:305:             OUT(0, false, "type: \"float\"\n");
	call	fwrite	 ;
 ; D:\TC\src\output.c:306:             OUT(0, true, "value: %s\n", (primary_ptr->value.literal_value));
	movq	%r12, %rdx	 ; indent,
	movq	%rdi, %r9	 ; parser,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:306:             OUT(0, true, "value: %s\n", (primary_ptr->value.literal_value));
	movq	0(%rbp), %r8	 ; primary_28->value.literal_value,
	leaq	.LC14(%rip), %rdx	 ;, tmp111
.L54:
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:293: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:306:             OUT(0, true, "value: %s\n", (primary_ptr->value.literal_value));
	jmp	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L35:
 ; D:\TC\src\output.c:305:             OUT(0, false, "type: \"float\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:305:             OUT(0, false, "type: \"float\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC15(%rip), %rcx	 ;, tmp109
	jmp	.L53	 ;
	.p2align 4,,10
	.p2align 3
.L34:
 ; D:\TC\src\output.c:309:             OUT(0, false, "type: \"string\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:309:             OUT(0, false, "type: \"string\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rcx	 ;, tmp112
	call	fwrite	 ;
 ; D:\TC\src\output.c:310:             OUT(0, true, "value: \"%s\"\n", (primary_ptr->value.literal_value));
	movq	%r12, %rdx	 ; indent,
	movq	%rdi, %r9	 ; parser,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:310:             OUT(0, true, "value: \"%s\"\n", (primary_ptr->value.literal_value));
	movq	0(%rbp), %r8	 ; primary_28->value.literal_value,
	leaq	.LC17(%rip), %rdx	 ;, tmp114
	jmp	.L54	 ;
	.p2align 4,,10
	.p2align 3
.L33:
 ; D:\TC\src\output.c:313:             OUT(0, false, "type: \"boolean\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:313:             OUT(0, false, "type: \"boolean\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rcx	 ;, tmp115
	call	fwrite	 ;
 ; D:\TC\src\output.c:314:             OUT(0, true, "value: \"true\"\n");
	movq	%rdi, %r9	 ; parser,
	movq	%r12, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:314:             OUT(0, true, "value: \"true\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC19(%rip), %rcx	 ;, tmp116
.L55:
 ; D:\TC\src\output.c:293: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:318:             OUT(0, true, "value: \"false\"\n");
	jmp	fwrite	 ;
	.p2align 4,,10
	.p2align 3
.L32:
 ; D:\TC\src\output.c:317:             OUT(0, false, "type: \"boolean\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:317:             OUT(0, false, "type: \"boolean\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rcx	 ;, tmp117
	call	fwrite	 ;
 ; D:\TC\src\output.c:318:             OUT(0, true, "value: \"false\"\n");
	movq	%rdi, %r9	 ; parser,
	movq	%r12, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:318:             OUT(0, true, "value: \"false\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC20(%rip), %rcx	 ;, tmp118
	jmp	.L55	 ;
	.p2align 4,,10
	.p2align 3
.L31:
 ; D:\TC\src\output.c:321:             OUT(0, false, "type: \"expression\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:321:             OUT(0, false, "type: \"expression\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$19, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC21(%rip), %rcx	 ;, tmp119
	call	fwrite	 ;
 ; D:\TC\src\output.c:322:             OUT(0, true, "value\n");
	movq	%rdi, %r9	 ; parser,
	movq	%r12, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:322:             OUT(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC22(%rip), %rcx	 ;, tmp120
	call	fwrite	 ;
 ; D:\TC\src\output.c:323:             output_expression(primary_ptr->value.expr, outfile, indent + 1, parser);
	movq	0(%rbp), %rbp	 ; primary_28->value.expr, expression
 ; D:\TC\src\output.c:324:             break;
	jmp	.L37	 ;
	.p2align 4,,10
	.p2align 3
.L30:
 ; D:\TC\src\output.c:326:             OUT(0, false, "type: \"!\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:326:             OUT(0, false, "type: \"!\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC23(%rip), %rcx	 ;, tmp121
	jmp	.L52	 ;
.L26:
 ; D:\TC\src\output.c:341:             OUT(0, true, "unknown_PrimaryType: %d\n", primary_ptr->type);
	movq	%r12, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movq	%rdi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:341:             OUT(0, true, "unknown_PrimaryType: %d\n", primary_ptr->type);
	movl	8(%rbp), %r8d	 ; primary_28->type,
	leaq	.LC26(%rip), %rdx	 ;, tmp129
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:293: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:341:             OUT(0, true, "unknown_PrimaryType: %d\n", primary_ptr->type);
	jmp	fprintf	 ;
	.seh_endproc
	.section .rdata,"dr"
.LC31:
	.ascii "name\12\0"
.LC32:
	.ascii "value: \"NULL\"\12\0"
	.text
	.p2align 4
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
 ; D:\TC\src\output.c:139: void output_variable(Variable* variable, FILE* outfile, size_t indent, Parser* parser) {
	movq	%rdx, %rbx	 ; tmp99, outfile
	movq	%r8, %rdi	 ; tmp100, indent
	movq	%rcx, %rbp	 ; tmp98, variable
 ; D:\TC\src\output.c:144:     OUT(0, false, "type\n");
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:145:     output_name(variable_ptr->type, outfile, indent + 1, parser);
	leaq	1(%rdi), %r12	 ;, _1
 ; D:\TC\src\output.c:139: void output_variable(Variable* variable, FILE* outfile, size_t indent, Parser* parser) {
	movq	%r9, %rsi	 ; tmp101, parser
 ; D:\TC\src\output.c:144:     OUT(0, false, "type\n");
	call	indention	 ;
 ; D:\TC\src\output.c:144:     OUT(0, false, "type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp91
	call	fwrite	 ;
 ; D:\TC\src\output.c:145:     output_name(variable_ptr->type, outfile, indent + 1, parser);
	movq	0(%rbp), %rcx	 ; variable_7(D)->type, variable_7(D)->type
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:146:     OUT(0, false, "name\n");
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %r9	 ; parser,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:146:     OUT(0, false, "name\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC31(%rip), %rcx	 ;, tmp93
	call	fwrite	 ;
 ; D:\TC\src\output.c:147:     output_name(variable_ptr->name, outfile, indent + 1, parser);
	movq	8(%rbp), %rcx	 ; variable_7(D)->name, variable_7(D)->name
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:148:     if (variable_ptr->value != 0) {
	cmpq	$0, 16(%rbp)	 ;, variable_7(D)->value
 ; D:\TC\src\output.c:149:         OUT(0, true, "value\n");
	movq	%rsi, %r9	 ; parser,
	movq	%rdi, %rdx	 ; indent,
	movl	$1, %r8d	 ;,
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:148:     if (variable_ptr->value != 0) {
	je	.L59	 ;,
 ; D:\TC\src\output.c:149:         OUT(0, true, "value\n");
	call	indention	 ;
 ; D:\TC\src\output.c:149:         OUT(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC22(%rip), %rcx	 ;, tmp95
	call	fwrite	 ;
 ; D:\TC\src\output.c:150:         output_expression(variable_ptr->value, outfile, indent + 1, parser);
	movq	16(%rbp), %rcx	 ; variable_7(D)->value, variable_7(D)->value
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
 ; D:\TC\src\output.c:153: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:\TC\src\output.c:150:         output_expression(variable_ptr->value, outfile, indent + 1, parser);
	jmp	output_expression	 ;
	.p2align 4,,10
	.p2align 3
.L59:
 ; D:\TC\src\output.c:152:         OUT(0, true, "value: \"NULL\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:152:         OUT(0, true, "value: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC32(%rip), %rcx	 ;, tmp97
 ; D:\TC\src\output.c:153: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:\TC\src\output.c:152:         OUT(0, true, "value: \"NULL\"\n");
	jmp	fwrite	 ;
	.seh_endproc
	.section .rdata,"dr"
.LC33:
	.ascii "type: \"name\"\12\0"
.LC34:
	.ascii "type: \"function_call\"\12\0"
.LC35:
	.ascii "function\12\0"
.LC36:
	.ascii "arguments\12\0"
.LC37:
	.ascii "arguments[%d]\12\0"
.LC38:
	.ascii "type: \"get sequence_element\"\12\0"
.LC39:
	.ascii "sequence\12\0"
.LC40:
	.ascii "index\12\0"
.LC41:
	.ascii "type: \"get_attribute\"\12\0"
.LC42:
	.ascii "object\12\0"
.LC43:
	.ascii "attribute_name\12\0"
	.align 8
.LC44:
	.ascii "unknown_VariableAccessType: %d\12\0"
	.text
	.p2align 4
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
 ; D:\TC\src\output.c:352:     switch (var_access_ptr->type) {
	movl	16(%rcx), %eax	 ; variable_access_18(D)->type, _1
 ; D:\TC\src\output.c:345: void output_variable_access(VariableAccess* variable_access, FILE* outfile, size_t indent, Parser* parser) {
	movq	%rcx, %rdi	 ; tmp128, variable_access
	movq	%rdx, %rbx	 ; tmp129, outfile
	movq	%r8, %rbp	 ; tmp130, indent
	movq	%r9, %rsi	 ; tmp131, parser
 ; D:\TC\src\output.c:352:     switch (var_access_ptr->type) {
	cmpl	$2, %eax	 ;, _1
	je	.L61	 ;,
	ja	.L62	 ;,
	testl	%eax, %eax	 ; _1
	je	.L74	 ;,
 ; D:\TC\src\output.c:359:             args = list_copy(var_access_ptr->content.args);
	movq	8(%rcx), %rcx	 ; variable_access_18(D)->content.args, variable_access_18(D)->content.args
 ; D:\TC\src\output.c:362:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	leaq	1(%rbp), %r14	 ;, _5
 ; D:\TC\src\output.c:365:             index = -1;
	movl	$-1, %r12d	 ;, index
 ; D:\TC\src\output.c:367:                 OUT(1, false, "arguments[%d]\n", ++index);
	leaq	.LC37(%rip), %r15	 ;, tmp126
 ; D:\TC\src\output.c:359:             args = list_copy(var_access_ptr->content.args);
	call	list_copy	 ;
 ; D:\TC\src\output.c:360:             OUT(0, false, "type: \"function_call\"\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rsi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:359:             args = list_copy(var_access_ptr->content.args);
	movq	%rax, %r13	 ; tmp132, args
 ; D:\TC\src\output.c:360:             OUT(0, false, "type: \"function_call\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:360:             OUT(0, false, "type: \"function_call\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$22, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC34(%rip), %rcx	 ;, tmp108
	call	fwrite	 ;
 ; D:\TC\src\output.c:361:             OUT(0, false, "function\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rsi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:361:             OUT(0, false, "function\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC35(%rip), %rcx	 ;, tmp109
	call	fwrite	 ;
 ; D:\TC\src\output.c:362:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	movq	(%rdi), %rcx	 ; variable_access_18(D)->base, variable_access_18(D)->base
	movq	%rsi, %r9	 ; parser,
	movq	%r14, %r8	 ; _5,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; D:\TC\src\output.c:363:             OUT(0, true, "arguments\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rsi, %r9	 ; parser,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
 ; D:\TC\src\output.c:368:                 output_expression(arg, outfile, indent + 2, parser);
	addq	$2, %rbp	 ;, tmp127
 ; D:\TC\src\output.c:363:             OUT(0, true, "arguments\n");
	call	indention	 ;
 ; D:\TC\src\output.c:363:             OUT(0, true, "arguments\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC36(%rip), %rcx	 ;, tmp111
	call	fwrite	 ;
 ; D:\TC\src\output.c:366:             while ((arg = (Expression*)list_pop(args)) != 0) {
	jmp	.L67	 ;
	.p2align 4,,10
	.p2align 3
.L68:
 ; D:\TC\src\output.c:367:                 OUT(1, false, "arguments[%d]\n", ++index);
	movq	%rsi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%r14, %rdx	 ; _5,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:367:                 OUT(1, false, "arguments[%d]\n", ++index);
	addl	$1, %r12d	 ;, index
	movq	%r15, %rdx	 ; tmp126,
	movq	%rbx, %rcx	 ; outfile,
	movl	%r12d, %r8d	 ; index,
	call	fprintf	 ;
 ; D:\TC\src\output.c:368:                 output_expression(arg, outfile, indent + 2, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %r8	 ; tmp127,
	movq	%rbx, %rdx	 ; outfile,
	movq	%rdi, %rcx	 ; arg,
	call	output_expression	 ;
.L67:
 ; D:\TC\src\output.c:366:             while ((arg = (Expression*)list_pop(args)) != 0) {
	movq	%r13, %rcx	 ; args,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp133, arg
 ; D:\TC\src\output.c:366:             while ((arg = (Expression*)list_pop(args)) != 0) {
	testq	%rax, %rax	 ; arg
	jne	.L68	 ;,
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
	.p2align 4,,10
	.p2align 3
.L62:
 ; D:\TC\src\output.c:352:     switch (var_access_ptr->type) {
	cmpl	$3, %eax	 ;, _1
	jne	.L75	 ;,
 ; D:\TC\src\output.c:372:             OUT(0, false, "type: \"get sequence_element\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
 ; D:\TC\src\output.c:374:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	leaq	1(%rbp), %r12	 ;, _8
 ; D:\TC\src\output.c:372:             OUT(0, false, "type: \"get sequence_element\"\n");
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:372:             OUT(0, false, "type: \"get sequence_element\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$29, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC38(%rip), %rcx	 ;, tmp114
	call	fwrite	 ;
 ; D:\TC\src\output.c:373:             OUT(0, false, "sequence\n");
	movq	%rsi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:373:             OUT(0, false, "sequence\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC39(%rip), %rcx	 ;, tmp115
	call	fwrite	 ;
 ; D:\TC\src\output.c:374:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	movq	(%rdi), %rcx	 ; variable_access_18(D)->base, variable_access_18(D)->base
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _8,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; D:\TC\src\output.c:375:             OUT(0, true, "index\n");
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:375:             OUT(0, true, "index\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC40(%rip), %rcx	 ;, tmp117
	call	fwrite	 ;
 ; D:\TC\src\output.c:376:             output_expression(var_access_ptr->content.index, outfile, indent + 1, parser);
	movq	8(%rdi), %rcx	 ; variable_access_18(D)->content.index, variable_access_18(D)->content.index
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _8,
	movq	%rbx, %rdx	 ; outfile,
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
 ; D:\TC\src\output.c:376:             output_expression(var_access_ptr->content.index, outfile, indent + 1, parser);
	jmp	output_expression	 ;
	.p2align 4,,10
	.p2align 3
.L61:
 ; D:\TC\src\output.c:379:             OUT(0, false, "type: \"get_attribute\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
 ; D:\TC\src\output.c:381:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	leaq	1(%rbp), %r12	 ;, _11
 ; D:\TC\src\output.c:379:             OUT(0, false, "type: \"get_attribute\"\n");
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:379:             OUT(0, false, "type: \"get_attribute\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$22, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC41(%rip), %rcx	 ;, tmp119
	call	fwrite	 ;
 ; D:\TC\src\output.c:380:             OUT(0, false, "object\n");
	movq	%rsi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:380:             OUT(0, false, "object\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC42(%rip), %rcx	 ;, tmp120
	call	fwrite	 ;
 ; D:\TC\src\output.c:381:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	movq	(%rdi), %rcx	 ; variable_access_18(D)->base, variable_access_18(D)->base
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _11,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; D:\TC\src\output.c:382:             OUT(0, true, "attribute_name\n");
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:382:             OUT(0, true, "attribute_name\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	leaq	.LC43(%rip), %rcx	 ;, tmp122
	movl	$1, %edx	 ;,
	call	fwrite	 ;
 ; D:\TC\src\output.c:383:             output_name(var_access_ptr->content.attr_name, outfile, indent + 1, parser);
	movq	8(%rdi), %rcx	 ; variable_access_18(D)->content.attr_name, variable_access_18(D)->content.attr_name
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _11,
.L73:
	movq	%rbx, %rdx	 ; outfile,
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
 ; D:\TC\src\output.c:383:             output_name(var_access_ptr->content.attr_name, outfile, indent + 1, parser);
	jmp	output_name	 ;
	.p2align 4,,10
	.p2align 3
.L74:
 ; D:\TC\src\output.c:354:             OUT(0, false, "type: \"name\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:354:             OUT(0, false, "type: \"name\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC33(%rip), %rcx	 ;, tmp103
	call	fwrite	 ;
 ; D:\TC\src\output.c:355:             OUT(0, true, "name\n");
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:355:             OUT(0, true, "name\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	leaq	.LC31(%rip), %rcx	 ;, tmp104
	movl	$1, %edx	 ;,
	call	fwrite	 ;
 ; D:\TC\src\output.c:356:             output_name(var_access_ptr->content.name, outfile, indent + 1, parser);
	movq	8(%rdi), %rcx	 ; variable_access_18(D)->content.name, variable_access_18(D)->content.name
	movq	%rsi, %r9	 ; parser,
	leaq	1(%rbp), %r8	 ;,
	jmp	.L73	 ;
	.p2align 4,,10
	.p2align 3
.L75:
 ; D:\TC\src\output.c:386:             OUT(0, true, "unknown_VariableAccessType: %d\n", var_access_ptr->type);
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:386:             OUT(0, true, "unknown_VariableAccessType: %d\n", var_access_ptr->type);
	movl	16(%rdi), %r8d	 ; variable_access_18(D)->type,
	leaq	.LC44(%rip), %rdx	 ;, tmp125
	movq	%rbx, %rcx	 ; outfile,
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
 ; D:\TC\src\output.c:386:             OUT(0, true, "unknown_VariableAccessType: %d\n", var_access_ptr->type);
	jmp	fprintf	 ;
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
	.p2align 4
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
	subq	$72, %rsp	 ;,
	.seh_stackalloc	72
	.seh_endprologue
 ; D:\TC\src\output.c:159:     switch (statement_ptr->type) {
	cmpl	$7, 8(%rcx)	 ;, statement_18(D)->type
 ; D:\TC\src\output.c:154: void output_statement(Statement* statement, FILE* outfile, size_t indent, Parser* parser) {
	movq	%rcx, %rbp	 ; tmp195, statement
	movq	%rdx, %rbx	 ; tmp196, outfile
	movq	%r8, %rdi	 ; tmp197, indent
	movq	%r9, %rsi	 ; tmp198, parser
 ; D:\TC\src\output.c:159:     switch (statement_ptr->type) {
	ja	.L77	 ;,
	movl	8(%rcx), %eax	 ; statement_18(D)->type, statement_18(D)->type
	leaq	.L79(%rip), %rdx	 ;, tmp137
 ; D:\TC\src\output.c:188:             OUT(0, false, "continue_statement: \"NULL\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:159:     switch (statement_ptr->type) {
	movslq	(%rdx,%rax,4), %rax	 ;, tmp139
	addq	%rdx, %rax	 ; tmp137, tmp140
 ; D:\TC\src\output.c:188:             OUT(0, false, "continue_statement: \"NULL\"\n");
	movq	%rdi, %rdx	 ; indent,
 ; D:\TC\src\output.c:159:     switch (statement_ptr->type) {
	jmp	*%rax	 ; tmp140
	.section .rdata,"dr"
	.align 4
.L79:
	.long	.L86-.L79
	.long	.L85-.L79
	.long	.L84-.L79
	.long	.L83-.L79
	.long	.L82-.L79
	.long	.L81-.L79
	.long	.L80-.L79
	.long	.L78-.L79
	.text
	.p2align 4,,10
	.p2align 3
.L80:
 ; D:\TC\src\output.c:185:             OUT(0, false, "break_statement: \"NULL\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:185:             OUT(0, false, "break_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$24, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC60(%rip), %rcx	 ;, tmp183
.L109:
 ; D:\TC\src\output.c:202: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:185:             OUT(0, false, "break_statement: \"NULL\"\n");
	jmp	fwrite	 ;
	.p2align 4,,10
	.p2align 3
.L78:
 ; D:\TC\src\output.c:188:             OUT(0, false, "continue_statement: \"NULL\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:188:             OUT(0, false, "continue_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$27, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC61(%rip), %rcx	 ;, tmp184
	jmp	.L109	 ;
	.p2align 4,,10
	.p2align 3
.L86:
 ; D:\TC\src\output.c:191:             if (statement_ptr->stmt.expr == 0) {
	cmpq	$0, 0(%rbp)	 ;, statement_18(D)->stmt.expr
	je	.L111	 ;,
 ; D:\TC\src\output.c:195:             OUT(0, false, "expression_statement\n");
	call	indention	 ;
 ; D:\TC\src\output.c:195:             OUT(0, false, "expression_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$21, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC63(%rip), %rcx	 ;, tmp186
.L110:
	call	fwrite	 ;
 ; D:\TC\src\output.c:196:             output_expression(statement_ptr->stmt.expr, outfile, indent + 1, parser);
	movq	0(%rbp), %rcx	 ; statement_18(D)->stmt.expr, statement_18(D)->stmt.expr
	movq	%rsi, %r9	 ; parser,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
 ; D:\TC\src\output.c:202: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:196:             output_expression(statement_ptr->stmt.expr, outfile, indent + 1, parser);
	jmp	output_expression	 ;
	.p2align 4,,10
	.p2align 3
.L85:
 ; D:\TC\src\output.c:173:             OUT(0, false, "variable_declaration_statement\n");
	call	indention	 ;
 ; D:\TC\src\output.c:173:             OUT(0, false, "variable_declaration_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC57(%rip), %rcx	 ;, tmp176
	call	fwrite	 ;
 ; D:\TC\src\output.c:174:             output_variable(statement_ptr->stmt.var, outfile, indent + 1, parser);
	movq	0(%rbp), %rcx	 ; statement_18(D)->stmt.var, statement_18(D)->stmt.var
	movq	%rsi, %r9	 ; parser,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
 ; D:\TC\src\output.c:202: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:174:             output_variable(statement_ptr->stmt.var, outfile, indent + 1, parser);
	jmp	output_variable	 ;
	.p2align 4,,10
	.p2align 3
.L84:
 ; D:\TC\src\output.c:161:             OUT(0, false, "if_statement\n");
	call	indention	 ;
 ; D:\TC\src\output.c:161:             OUT(0, false, "if_statement\n");
	movq	%rbx, %r9	 ; outfile,
 ; D:\TC\src\output.c:162:             output_if(statement_ptr->stmt.if_stmt, outfile, indent + 1, parser);
	leaq	1(%rdi), %r13	 ;, _2
 ; D:\TC\src\output.c:161:             OUT(0, false, "if_statement\n");
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC45(%rip), %rcx	 ;, tmp142
 ; D:\TC\src\output.c:162:             output_if(statement_ptr->stmt.if_stmt, outfile, indent + 1, parser);
	movq	%r13, %r12	 ; _2, _2
 ; D:\TC\src\output.c:161:             OUT(0, false, "if_statement\n");
	call	fwrite	 ;
 ; D:\TC\src\output.c:162:             output_if(statement_ptr->stmt.if_stmt, outfile, indent + 1, parser);
	movq	0(%rbp), %r14	 ; statement_18(D)->stmt.if_stmt, _3
	movq	%r13, 56(%rsp)	 ; _2, %sfp
 ; D:\TC\src\output.c:212:     output_expression(if_ptr->condition, outfile, indent + 1, parser);
	leaq	2(%rdi), %rbp	 ;, _57
 ; D:\TC\src\output.c:208:     list(Statement*) body = list_copy(if_ptr->body);
	movq	8(%r14), %rcx	 ; _3->body, _3->body
	call	list_copy	 ;
 ; D:\TC\src\output.c:209:     list(ElseIf*) else_if_list = list_copy(if_ptr->else_if);
	movq	16(%r14), %rcx	 ; _3->else_if, _3->else_if
 ; D:\TC\src\output.c:208:     list(Statement*) body = list_copy(if_ptr->body);
	movq	%rax, %r15	 ; tmp199, body
 ; D:\TC\src\output.c:209:     list(ElseIf*) else_if_list = list_copy(if_ptr->else_if);
	call	list_copy	 ;
 ; D:\TC\src\output.c:210:     list(Statement*) else_body = list_copy(if_ptr->else_body);
	movq	24(%r14), %rcx	 ; _3->else_body, _3->else_body
 ; D:\TC\src\output.c:209:     list(ElseIf*) else_if_list = list_copy(if_ptr->else_if);
	movq	%rax, 40(%rsp)	 ; tmp200, %sfp
 ; D:\TC\src\output.c:210:     list(Statement*) else_body = list_copy(if_ptr->else_body);
	call	list_copy	 ;
 ; D:\TC\src\output.c:211:     OUT(0, false, "condition\n");
	movq	%rsi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%r13, %rdx	 ; _2,
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:211:     OUT(0, false, "condition\n");
	leaq	.LC46(%rip), %r13	 ;, tmp191
 ; D:\TC\src\output.c:210:     list(Statement*) else_body = list_copy(if_ptr->else_body);
	movq	%rax, 48(%rsp)	 ; tmp201, %sfp
 ; D:\TC\src\output.c:211:     OUT(0, false, "condition\n");
	call	indention	 ;
 ; D:\TC\src\output.c:211:     OUT(0, false, "condition\n");
	movq	%rbx, %r9	 ; outfile,
	movq	%r13, %rcx	 ; tmp191,
	movl	$1, %edx	 ;,
	movl	$10, %r8d	 ;,
	call	fwrite	 ;
 ; D:\TC\src\output.c:212:     output_expression(if_ptr->condition, outfile, indent + 1, parser);
	movq	(%r14), %rcx	 ; _3->condition, _3->condition
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %r8	 ; _57,
	movq	%rbx, %rdx	 ; outfile,
 ; D:\TC\src\output.c:213:     OUT(0, false, "body\n");
	leaq	.LC47(%rip), %r14	 ;, tmp192
 ; D:\TC\src\output.c:212:     output_expression(if_ptr->condition, outfile, indent + 1, parser);
	call	output_expression	 ;
 ; D:\TC\src\output.c:213:     OUT(0, false, "body\n");
	movq	%rsi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%r12, %rdx	 ; _2,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:213:     OUT(0, false, "body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; tmp192,
	movl	$5, %r8d	 ;,
	call	fwrite	 ;
 ; D:\TC\src\output.c:215:     while ((statement = (Statement*)list_pop(body)) != 0)
	jmp	.L87	 ;
	.p2align 4,,10
	.p2align 3
.L88:
 ; D:\TC\src\output.c:216:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rbp, %r8	 ; _57,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
.L87:
 ; D:\TC\src\output.c:215:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%r15, %rcx	 ; body,
	call	list_pop	 ;
 ; D:\TC\src\output.c:216:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rsi, %r9	 ; parser,
 ; D:\TC\src\output.c:215:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%rax, %rcx	 ; tmp202, statement
 ; D:\TC\src\output.c:215:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	 ; statement
	jne	.L88	 ;,
 ; D:\TC\src\output.c:217:     OUT(0, false, "else_if\n");
	movq	56(%rsp), %rdx	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:232:     output_expression(else_if_ptr->condition, outfile, indent + 1, parser);
	leaq	3(%rdi), %r15	 ;, _64
 ; D:\TC\src\output.c:217:     OUT(0, false, "else_if\n");
	call	indention	 ;
 ; D:\TC\src\output.c:217:     OUT(0, false, "else_if\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rcx	 ;, tmp149
	call	fwrite	 ;
.L89:
 ; D:\TC\src\output.c:219:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != 0)
	movq	40(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %r12	 ; tmp205, else_if
 ; D:\TC\src\output.c:219:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != 0)
	testq	%rax, %rax	 ; else_if
	je	.L112	 ;,
 ; D:\TC\src\output.c:230:     list(Statement*) body = list_copy(else_if_ptr->body);
	movq	8(%r12), %rcx	 ; else_if_60->body, else_if_60->body
	call	list_copy	 ;
 ; D:\TC\src\output.c:231:     OUT(0, false, "condition\n");
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %rdx	 ; _57,
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:230:     list(Statement*) body = list_copy(else_if_ptr->body);
	movq	%rax, %rdi	 ; tmp203, body
 ; D:\TC\src\output.c:231:     OUT(0, false, "condition\n");
	call	indention	 ;
 ; D:\TC\src\output.c:231:     OUT(0, false, "condition\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; tmp191,
	movl	$10, %r8d	 ;,
	call	fwrite	 ;
 ; D:\TC\src\output.c:232:     output_expression(else_if_ptr->condition, outfile, indent + 1, parser);
	movq	(%r12), %rcx	 ; else_if_60->condition, else_if_60->condition
	movq	%rsi, %r9	 ; parser,
	movq	%r15, %r8	 ; _64,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:\TC\src\output.c:233:     OUT(0, true, "body\n");
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %rdx	 ; _57,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:233:     OUT(0, true, "body\n");
	movq	%r14, %rcx	 ; tmp192,
	movq	%rbx, %r9	 ; outfile,
	movl	$1, %edx	 ;,
	movl	$5, %r8d	 ;,
	call	fwrite	 ;
 ; D:\TC\src\output.c:235:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
 ; D:\TC\src\output.c:235:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	 ; statement
	je	.L89	 ;,
.L91:
 ; D:\TC\src\output.c:236:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rax, %rcx	 ; statement,
	movq	%rsi, %r9	 ; parser,
	movq	%r15, %r8	 ; _64,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
 ; D:\TC\src\output.c:235:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
 ; D:\TC\src\output.c:235:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	 ; statement
	jne	.L91	 ;,
	jmp	.L89	 ;
	.p2align 4,,10
	.p2align 3
.L83:
 ; D:\TC\src\output.c:169:             OUT(0, false, "while_statement\n");
	call	indention	 ;
 ; D:\TC\src\output.c:169:             OUT(0, false, "while_statement\n");
	movq	%rbx, %r9	 ; outfile,
 ; D:\TC\src\output.c:170:             output_while(statement_ptr->stmt.while_stmt, outfile, indent + 1, parser);
	leaq	1(%rdi), %r12	 ;, _6
 ; D:\TC\src\output.c:169:             OUT(0, false, "while_statement\n");
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC56(%rip), %rcx	 ;, tmp171
 ; D:\TC\src\output.c:271:     output_expression(while_ptr->condition, outfile, indent + 1, parser);
	addq	$2, %rdi	 ;, _82
 ; D:\TC\src\output.c:169:             OUT(0, false, "while_statement\n");
	call	fwrite	 ;
 ; D:\TC\src\output.c:170:             output_while(statement_ptr->stmt.while_stmt, outfile, indent + 1, parser);
	movq	0(%rbp), %r13	 ; statement_18(D)->stmt.while_stmt, _7
 ; D:\TC\src\output.c:269:     list(Statement*) body = list_copy(while_ptr->body);
	movq	8(%r13), %rcx	 ; _7->body, _7->body
	call	list_copy	 ;
 ; D:\TC\src\output.c:270:     OUT(0, false, "condition\n");
	movq	%rsi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%r12, %rdx	 ; _6,
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:269:     list(Statement*) body = list_copy(while_ptr->body);
	movq	%rax, %rbp	 ; tmp209, body
 ; D:\TC\src\output.c:270:     OUT(0, false, "condition\n");
	call	indention	 ;
 ; D:\TC\src\output.c:270:     OUT(0, false, "condition\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC46(%rip), %rcx	 ;, tmp173
	call	fwrite	 ;
 ; D:\TC\src\output.c:271:     output_expression(while_ptr->condition, outfile, indent + 1, parser);
	movq	0(%r13), %rcx	 ; _7->condition, _7->condition
	movq	%rsi, %r9	 ; parser,
	movq	%rdi, %r8	 ; _82,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:\TC\src\output.c:272:     OUT(0, true, "body\n");
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %rdx	 ; _6,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:272:     OUT(0, true, "body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC47(%rip), %rcx	 ;, tmp175
	call	fwrite	 ;
 ; D:\TC\src\output.c:274:     while ((statement = (Statement*)list_pop(body)) != 0)
	jmp	.L105	 ;
	.p2align 4,,10
	.p2align 3
.L106:
 ; D:\TC\src\output.c:275:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%rdi, %r8	 ; _82,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
.L105:
 ; D:\TC\src\output.c:274:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%rbp, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp210, statement
 ; D:\TC\src\output.c:274:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	 ; statement
	jne	.L106	 ;,
.L76:
 ; D:\TC\src\output.c:202: }
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
.L82:
 ; D:\TC\src\output.c:165:             OUT(0, false, "for_statement\n");
	call	indention	 ;
 ; D:\TC\src\output.c:165:             OUT(0, false, "for_statement\n");
	movq	%rbx, %r9	 ; outfile,
 ; D:\TC\src\output.c:166:             output_for(statement_ptr->stmt.for_stmt, outfile, indent + 1, parser);
	leaq	1(%rdi), %r13	 ;, _4
 ; D:\TC\src\output.c:165:             OUT(0, false, "for_statement\n");
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC50(%rip), %rcx	 ;, tmp155
	call	fwrite	 ;
 ; D:\TC\src\output.c:166:             output_for(statement_ptr->stmt.for_stmt, outfile, indent + 1, parser);
	movq	0(%rbp), %r12	 ; statement_18(D)->stmt.for_stmt, _5
 ; D:\TC\src\output.c:243:     list(Statement*) body = list_copy(for_ptr->body);
	movq	24(%r12), %rcx	 ; _5->body, _5->body
	call	list_copy	 ;
 ; D:\TC\src\output.c:245:         OUT(0, false, "initializer\n");
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\output.c:244:     if (for_ptr->initializer != 0) {
	cmpq	$0, (%r12)	 ;, _5->initializer
 ; D:\TC\src\output.c:245:         OUT(0, false, "initializer\n");
	movq	%rsi, %r9	 ; parser,
 ; D:\TC\src\output.c:243:     list(Statement*) body = list_copy(for_ptr->body);
	movq	%rax, %rbp	 ; tmp207, body
 ; D:\TC\src\output.c:245:         OUT(0, false, "initializer\n");
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:244:     if (for_ptr->initializer != 0) {
	je	.L96	 ;,
 ; D:\TC\src\output.c:245:         OUT(0, false, "initializer\n");
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
	leaq	2(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable	 ;
.L97:
 ; D:\TC\src\output.c:250:         OUT(0, false, "condition\n");
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\output.c:249:     if (for_ptr->condition != 0) {
	cmpq	$0, 8(%r12)	 ;, _5->condition
 ; D:\TC\src\output.c:250:         OUT(0, false, "condition\n");
	movq	%rsi, %r9	 ; parser,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:249:     if (for_ptr->condition != 0) {
	je	.L98	 ;,
 ; D:\TC\src\output.c:250:         OUT(0, false, "condition\n");
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
	movq	%rbx, %rdx	 ; outfile,
	leaq	2(%rdi), %r8	 ;,
	call	output_expression	 ;
.L99:
 ; D:\TC\src\output.c:255:         OUT(0, false, "increment\n");
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\output.c:254:     if (for_ptr->increment != 0) {
	cmpq	$0, 16(%r12)	 ;, _5->increment
 ; D:\TC\src\output.c:255:         OUT(0, false, "increment\n");
	movq	%rsi, %r9	 ; parser,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:254:     if (for_ptr->increment != 0) {
	je	.L100	 ;,
 ; D:\TC\src\output.c:255:         OUT(0, false, "increment\n");
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
	movq	%rbx, %rdx	 ; outfile,
	leaq	2(%rdi), %r8	 ;,
	call	output_expression	 ;
.L101:
 ; D:\TC\src\output.c:259:     OUT(0, true, "body\n");
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:259:     OUT(0, true, "body\n");
	movq	%rbx, %r9	 ; outfile,
 ; D:\TC\src\output.c:262:         output_statement(statement, outfile, indent + 1, parser);
	addq	$2, %rdi	 ;, tmp194
 ; D:\TC\src\output.c:259:     OUT(0, true, "body\n");
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC47(%rip), %rcx	 ;, tmp169
	call	fwrite	 ;
 ; D:\TC\src\output.c:261:     while ((statement = (Statement*)list_pop(body)) != 0)
	jmp	.L102	 ;
	.p2align 4,,10
	.p2align 3
.L103:
 ; D:\TC\src\output.c:262:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%rdi, %r8	 ; tmp194,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
.L102:
 ; D:\TC\src\output.c:261:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%rbp, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp208, statement
 ; D:\TC\src\output.c:261:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	 ; statement
	jne	.L103	 ;,
	jmp	.L76	 ;
	.p2align 4,,10
	.p2align 3
.L81:
 ; D:\TC\src\output.c:177:             if (statement_ptr->stmt.expr == 0) {
	cmpq	$0, 0(%rbp)	 ;, statement_18(D)->stmt.expr
	je	.L113	 ;,
 ; D:\TC\src\output.c:181:             OUT(0, false, "return_statement\n");
	call	indention	 ;
 ; D:\TC\src\output.c:181:             OUT(0, false, "return_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC59(%rip), %rcx	 ;, tmp180
	jmp	.L110	 ;
.L77:
 ; D:\TC\src\output.c:199:             OUT(0, false, "unknown_StatementType: %d\n", statement_ptr->type);
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:199:             OUT(0, false, "unknown_StatementType: %d\n", statement_ptr->type);
	movl	8(%rbp), %r8d	 ; statement_18(D)->type,
	leaq	.LC64(%rip), %rdx	 ;, tmp190
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:202: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:199:             OUT(0, false, "unknown_StatementType: %d\n", statement_ptr->type);
	jmp	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L112:
 ; D:\TC\src\output.c:221:     OUT(0, true, "else_body\n");
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	%rsi, %r9	 ; parser,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:221:     OUT(0, true, "else_body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC49(%rip), %rcx	 ;, tmp154
	call	fwrite	 ;
 ; D:\TC\src\output.c:222:     while ((statement = (Statement*)list_pop(else_body)) != 0)
	jmp	.L93	 ;
	.p2align 4,,10
	.p2align 3
.L94:
 ; D:\TC\src\output.c:223:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %r8	 ; _57,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
.L93:
 ; D:\TC\src\output.c:222:     while ((statement = (Statement*)list_pop(else_body)) != 0)
	movq	48(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp206, statement
 ; D:\TC\src\output.c:222:     while ((statement = (Statement*)list_pop(else_body)) != 0)
	testq	%rax, %rax	 ; statement
	jne	.L94	 ;,
	jmp	.L76	 ;
.L96:
 ; D:\TC\src\output.c:248:         OUT(0, false, "initializer: \"NULL\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:248:         OUT(0, false, "initializer: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$20, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC52(%rip), %rcx	 ;, tmp160
	call	fwrite	 ;
	jmp	.L97	 ;
.L100:
 ; D:\TC\src\output.c:258:         OUT(0, false, "increment: \"NULL\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:258:         OUT(0, false, "increment: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC55(%rip), %rcx	 ;, tmp168
	call	fwrite	 ;
	jmp	.L101	 ;
.L98:
 ; D:\TC\src\output.c:253:         OUT(0, false, "condition: \"NULL\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:253:         OUT(0, false, "condition: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC53(%rip), %rcx	 ;, tmp164
	call	fwrite	 ;
	jmp	.L99	 ;
.L111:
 ; D:\TC\src\output.c:192:                 OUT(0, false, "expression_statement: \"NULL\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:192:                 OUT(0, false, "expression_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$29, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC62(%rip), %rcx	 ;, tmp185
	jmp	.L109	 ;
.L113:
 ; D:\TC\src\output.c:178:                 OUT(0, false, "return_statement: \"NULL\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:178:                 OUT(0, false, "return_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$25, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC58(%rip), %rcx	 ;, tmp179
	jmp	.L109	 ;
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
	.p2align 4
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
	subq	$88, %rsp	 ;,
	.seh_stackalloc	88
	.seh_endprologue
 ; D:\TC\src\output.c:47:     list(CodeMember*) members = list_copy((code)->members);
	movq	(%rcx), %rcx	 ; code_5(D)->members, code_5(D)->members
 ; D:\TC\src\output.c:43: void output_code(Code* code, FILE* outfile, size_t indent, Parser* parser) {
	movq	%rdx, %r15	 ; tmp187, outfile
	movq	%r8, %r14	 ; tmp188, indent
	movq	%r9, %r13	 ; tmp189, parser
 ; D:\TC\src\output.c:47:     list(CodeMember*) members = list_copy((code)->members);
	call	list_copy	 ;
	movq	%rax, 72(%rsp)	 ; tmp190, %sfp
	.p2align 4,,10
	.p2align 3
.L115:
 ; D:\TC\src\output.c:49:     while ((member = (CodeMember*)list_pop(members)) != 0)
	movq	72(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp201, member
 ; D:\TC\src\output.c:49:     while ((member = (CodeMember*)list_pop(members)) != 0)
	testq	%rax, %rax	 ; member
	je	.L138	 ;,
 ; D:\TC\src\output.c:25:     switch (code_member_ptr->type) {
	movl	8(%rbx), %eax	 ; member_9->type, _14
 ; D:\TC\src\output.c:50:         output_code_member(member, outfile, indent + 1, parser);
	leaq	1(%r14), %rdx	 ;, _2
 ; D:\TC\src\output.c:39:             OUT(0, false, "unknown_CodeMemberType: %d\n", code_member_ptr->type);
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%r15, %rcx	 ; outfile,
 ; D:\TC\src\output.c:25:     switch (code_member_ptr->type) {
	cmpl	$1, %eax	 ;, _14
	je	.L116	 ;,
	cmpl	$2, %eax	 ;, _14
	je	.L117	 ;,
	testl	%eax, %eax	 ; _14
	jne	.L118	 ;,
 ; D:\TC\src\output.c:27:             OUT(0, false, "import\n");
	call	indention	 ;
 ; D:\TC\src\output.c:28:             output_import(code_member_ptr->content.import, outfile, indent + 1, parser);
	leaq	2(%r14), %rsi	 ;, _15
 ; D:\TC\src\output.c:27:             OUT(0, false, "import\n");
	movq	%r15, %r9	 ; outfile,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC66(%rip), %rcx	 ;, tmp135
	call	fwrite	 ;
 ; D:\TC\src\output.c:28:             output_import(code_member_ptr->content.import, outfile, indent + 1, parser);
	movq	(%rbx), %rbx	 ; member_9->content.import, _16
 ; D:\TC\src\output.c:57:     OUT(0, false, "name\n");
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; _15,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:57:     OUT(0, false, "name\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC31(%rip), %rcx	 ;, tmp136
	call	fwrite	 ;
 ; D:\TC\src\output.c:58:     output_name(import_ptr->name, outfile, indent + 1, parser);
	movq	(%rbx), %rcx	 ; _16->name, _16->name
	movq	%r13, %r9	 ; parser,
	leaq	3(%r14), %r8	 ;,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	movq	%rsi, %rdx	 ; _15,
	movq	%r15, %rcx	 ; outfile,
	movq	%r13, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	movq	8(%rbx), %rax	 ; _16->source, _24
 ; D:\TC\src\output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	leaq	.LC65(%rip), %r8	 ;, tmp175
	movq	%r15, %rcx	 ; outfile,
	leaq	.LC67(%rip), %rdx	 ;, tmp139
 ; D:\TC\src\output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	testq	%rax, %rax	 ; _24
 ; D:\TC\src\output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	cmovne	%rax, %r8	 ; _24,,
	call	fprintf	 ;
 ; D:\TC\src\output.c:60: }
	jmp	.L115	 ;
	.p2align 4,,10
	.p2align 3
.L116:
 ; D:\TC\src\output.c:31:             OUT(0, false, "function\n");
	call	indention	 ;
 ; D:\TC\src\output.c:32:             output_function(code_member_ptr->content.function, outfile, indent + 1, parser);
	leaq	2(%r14), %rdi	 ;, _17
 ; D:\TC\src\output.c:31:             OUT(0, false, "function\n");
	movq	%r15, %r9	 ; outfile,
	movl	$1, %edx	 ;,
	movl	$9, %r8d	 ;,
	leaq	.LC35(%rip), %rcx	 ;, tmp140
 ; D:\TC\src\output.c:67:     output_name(function_ptr->name, outfile, indent + 1, parser);
	leaq	3(%r14), %rsi	 ;, _26
 ; D:\TC\src\output.c:31:             OUT(0, false, "function\n");
	call	fwrite	 ;
 ; D:\TC\src\output.c:32:             output_function(code_member_ptr->content.function, outfile, indent + 1, parser);
	movq	(%rbx), %rbx	 ; member_9->content.function, _18
 ; D:\TC\src\output.c:66:     OUT(0, false, "name\n");
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _17,
	movq	%r15, %rcx	 ; outfile,
 ; D:\TC\src\output.c:32:             output_function(code_member_ptr->content.function, outfile, indent + 1, parser);
	movq	%rdi, 40(%rsp)	 ; _17, %sfp
 ; D:\TC\src\output.c:77:         output_variable(parameter, outfile, indent + 2, parser);
	leaq	4(%r14), %r12	 ;, tmp182
 ; D:\TC\src\output.c:66:     OUT(0, false, "name\n");
	call	indention	 ;
 ; D:\TC\src\output.c:66:     OUT(0, false, "name\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC31(%rip), %rcx	 ;, tmp141
	call	fwrite	 ;
 ; D:\TC\src\output.c:67:     output_name(function_ptr->name, outfile, indent + 1, parser);
	movq	(%rbx), %rcx	 ; _18->name, _18->name
	movq	%r13, %r9	 ; parser,
	movq	%rsi, %r8	 ; _26,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:68:     OUT(0, false, "return_type\n");
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _17,
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
	movq	%r13, %r9	 ; parser,
	movq	%rsi, %r8	 ; _26,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:70:     OUT(0, false, "parameters\n");
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _17,
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
 ; D:\TC\src\output.c:72:     list(Statement*) body = list_copy(function_ptr->body);
	movq	24(%rbx), %rcx	 ; _18->body, _18->body
 ; D:\TC\src\output.c:74:     int index = -1;
	movl	$-1, %ebx	 ;, index
 ; D:\TC\src\output.c:71:     list(Variable*) parameters = list_copy(function_ptr->parameters);
	movq	%rax, %rbp	 ; tmp191, parameters
 ; D:\TC\src\output.c:72:     list(Statement*) body = list_copy(function_ptr->body);
	call	list_copy	 ;
	movq	%rax, 48(%rsp)	 ; body, %sfp
 ; D:\TC\src\output.c:75:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	jmp	.L121	 ;
	.p2align 4,,10
	.p2align 3
.L122:
 ; D:\TC\src\output.c:76:         OUT(1, false, "parameters[%d]\n", ++index);
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; _26,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:76:         OUT(1, false, "parameters[%d]\n", ++index);
	addl	$1, %ebx	 ;, index
	leaq	.LC69(%rip), %rdx	 ;,
	movq	%r15, %rcx	 ; outfile,
	movl	%ebx, %r8d	 ; index,
	call	fprintf	 ;
 ; D:\TC\src\output.c:77:         output_variable(parameter, outfile, indent + 2, parser);
	movq	%r13, %r9	 ; parser,
	movq	%r12, %r8	 ; tmp182,
	movq	%r15, %rdx	 ; outfile,
	movq	%rdi, %rcx	 ; parameter,
	call	output_variable	 ;
.L121:
 ; D:\TC\src\output.c:75:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	movq	%rbp, %rcx	 ; parameters,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp193, parameter
 ; D:\TC\src\output.c:75:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	testq	%rax, %rax	 ; parameter
	jne	.L122	 ;,
 ; D:\TC\src\output.c:79:     OUT(0, true, "body\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%r13, %r9	 ; parser,
	movq	%r15, %rcx	 ; outfile,
	movq	48(%rsp), %rdi	 ; %sfp, body
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:79:     OUT(0, true, "body\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC47(%rip), %rcx	 ;, tmp150
	call	fwrite	 ;
 ; D:\TC\src\output.c:81:     while ((statement = (Statement*)list_pop(body)) != 0)
	jmp	.L123	 ;
	.p2align 4,,10
	.p2align 3
.L124:
 ; D:\TC\src\output.c:82:         output_statement(statement, outfile, indent + 1, parser);
	movq	%r13, %r9	 ; parser,
	movq	%rsi, %r8	 ; _26,
	movq	%r15, %rdx	 ; outfile,
	call	output_statement	 ;
.L123:
 ; D:\TC\src\output.c:81:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp194, statement
 ; D:\TC\src\output.c:81:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	 ; statement
	jne	.L124	 ;,
	jmp	.L115	 ;
	.p2align 4,,10
	.p2align 3
.L118:
 ; D:\TC\src\output.c:39:             OUT(0, false, "unknown_CodeMemberType: %d\n", code_member_ptr->type);
	call	indention	 ;
 ; D:\TC\src\output.c:39:             OUT(0, false, "unknown_CodeMemberType: %d\n", code_member_ptr->type);
	movl	8(%rbx), %r8d	 ; member_9->type,
	leaq	.LC75(%rip), %rdx	 ;, tmp173
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:40:             break;
	jmp	.L115	 ;
	.p2align 4,,10
	.p2align 3
.L117:
 ; D:\TC\src\output.c:35:             OUT(0, false, "class\n");
	call	indention	 ;
 ; D:\TC\src\output.c:36:             output_class(code_member_ptr->content.class_, outfile, indent + 1, parser);
	leaq	2(%r14), %rsi	 ;, _19
 ; D:\TC\src\output.c:35:             OUT(0, false, "class\n");
	movq	%r15, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC70(%rip), %rcx	 ;, tmp151
	call	fwrite	 ;
 ; D:\TC\src\output.c:36:             output_class(code_member_ptr->content.class_, outfile, indent + 1, parser);
	movq	(%rbx), %rbx	 ; member_9->content.class_, _20
 ; D:\TC\src\output.c:131:     OUT(0, false, "name\n");
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; _19,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:131:     OUT(0, false, "name\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC31(%rip), %rcx	 ;,
	call	fwrite	 ;
 ; D:\TC\src\output.c:132:     output_name(class_ptr->name, outfile, indent + 1, parser);
	leaq	3(%r14), %rax	 ;, _38
	movq	(%rbx), %rcx	 ; _20->name, _20->name
	movq	%r13, %r9	 ; parser,
	movq	%rax, %r8	 ; _38,
	movq	%r15, %rdx	 ; outfile,
	movq	%rax, 48(%rsp)	 ; _38, %sfp
	call	output_name	 ;
 ; D:\TC\src\output.c:133:     OUT(0, true, "members\n");
	movq	%r13, %r9	 ; parser,
	movq	%rsi, %rdx	 ; _19,
	movq	%r15, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
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
	movq	%rax, 40(%rsp)	 ; tmp195, %sfp
	.p2align 4,,10
	.p2align 3
.L125:
 ; D:\TC\src\output.c:136:     while ((member = (ClassMember*)list_pop(members)) != 0)
	movq	40(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp200, member
 ; D:\TC\src\output.c:136:     while ((member = (ClassMember*)list_pop(members)) != 0)
	testq	%rax, %rax	 ; member
	je	.L115	 ;,
 ; D:\TC\src\output.c:112:     switch (class_member_ptr->type) {
	movl	8(%rbx), %eax	 ; member_42->type, _43
 ; D:\TC\src\output.c:112:     switch (class_member_ptr->type) {
	testl	%eax, %eax	 ; _43
	je	.L126	 ;,
	cmpl	$1, %eax	 ;, _43
	je	.L127	 ;,
 ; D:\TC\src\output.c:122:             OUT(0, false, "unknown_ClassMemberType: %d\n", class_member_ptr->type);
	movq	48(%rsp), %rdx	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%r15, %rcx	 ; outfile,
	movq	%r13, %r9	 ; parser,
	call	indention	 ;
 ; D:\TC\src\output.c:122:             OUT(0, false, "unknown_ClassMemberType: %d\n", class_member_ptr->type);
	movl	8(%rbx), %r8d	 ; member_42->type,
	leaq	.LC74(%rip), %rdx	 ;, tmp171
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:123:             break;
	jmp	.L125	 ;
	.p2align 4,,10
	.p2align 3
.L126:
 ; D:\TC\src\output.c:114:             OUT(0, false, "method\n");
	movq	48(%rsp), %rdx	 ; %sfp,
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%r15, %rcx	 ; outfile,
 ; D:\TC\src\output.c:115:             output_method(class_member_ptr->content.method, outfile, indent + 1, parser);
	leaq	4(%r14), %rdi	 ;, _44
 ; D:\TC\src\output.c:90:     output_name(method_ptr->name, outfile, indent + 1, parser);
	leaq	5(%r14), %rsi	 ;, _49
 ; D:\TC\src\output.c:114:             OUT(0, false, "method\n");
	call	indention	 ;
 ; D:\TC\src\output.c:114:             OUT(0, false, "method\n");
	movq	%r15, %r9	 ; outfile,
 ; D:\TC\src\output.c:100:         output_variable(parameter, outfile, indent + 2, parser);
	leaq	6(%r14), %r12	 ;, tmp177
 ; D:\TC\src\output.c:114:             OUT(0, false, "method\n");
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC72(%rip), %rcx	 ;,
	call	fwrite	 ;
 ; D:\TC\src\output.c:115:             output_method(class_member_ptr->content.method, outfile, indent + 1, parser);
	movq	(%rbx), %rbx	 ; member_42->content.method, _45
 ; D:\TC\src\output.c:89:     OUT(0, false, "name\n");
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _44,
	movq	%r15, %rcx	 ; outfile,
 ; D:\TC\src\output.c:115:             output_method(class_member_ptr->content.method, outfile, indent + 1, parser);
	movq	%rdi, 56(%rsp)	 ; _44, %sfp
 ; D:\TC\src\output.c:89:     OUT(0, false, "name\n");
	call	indention	 ;
 ; D:\TC\src\output.c:89:     OUT(0, false, "name\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC31(%rip), %rcx	 ;,
	call	fwrite	 ;
 ; D:\TC\src\output.c:90:     output_name(method_ptr->name, outfile, indent + 1, parser);
	movq	(%rbx), %rcx	 ; _45->name, _45->name
	movq	%r13, %r9	 ; parser,
	movq	%rsi, %r8	 ; _49,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:91:     OUT(0, false, "return_type\n");
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _44,
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
	movq	%r13, %r9	 ; parser,
	movq	%rsi, %r8	 ; _49,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:93:     OUT(0, false, "parameters\n");
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _44,
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
 ; D:\TC\src\output.c:95:     list(Statement*) body = list_copy(method_ptr->body);
	movq	24(%rbx), %rcx	 ; _45->body, _45->body
 ; D:\TC\src\output.c:97:     int index = -1;
	movl	$-1, %ebx	 ;, index
 ; D:\TC\src\output.c:94:     list(Variable*) parameters = list_copy(method_ptr->parameters);
	movq	%rax, %rbp	 ; tmp196, parameters
 ; D:\TC\src\output.c:95:     list(Statement*) body = list_copy(method_ptr->body);
	call	list_copy	 ;
	movq	%rax, 64(%rsp)	 ; body, %sfp
 ; D:\TC\src\output.c:98:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	jmp	.L129	 ;
	.p2align 4,,10
	.p2align 3
.L130:
 ; D:\TC\src\output.c:99:         OUT(1, false, "parameters[%d]\n", ++index);
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; _49,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:99:         OUT(1, false, "parameters[%d]\n", ++index);
	addl	$1, %ebx	 ;, index
	leaq	.LC69(%rip), %rdx	 ;,
	movq	%r15, %rcx	 ; outfile,
	movl	%ebx, %r8d	 ; index,
	call	fprintf	 ;
 ; D:\TC\src\output.c:100:         output_variable(parameter, outfile, indent + 2, parser);
	movq	%r13, %r9	 ; parser,
	movq	%r12, %r8	 ; tmp177,
	movq	%r15, %rdx	 ; outfile,
	movq	%rdi, %rcx	 ; parameter,
	call	output_variable	 ;
.L129:
 ; D:\TC\src\output.c:98:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	movq	%rbp, %rcx	 ; parameters,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp198, parameter
 ; D:\TC\src\output.c:98:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	testq	%rax, %rax	 ; parameter
	jne	.L130	 ;,
 ; D:\TC\src\output.c:102:     OUT(0, true, "body\n");
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	%r13, %r9	 ; parser,
	movq	%r15, %rcx	 ; outfile,
	movq	64(%rsp), %rdi	 ; %sfp, body
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:102:     OUT(0, true, "body\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC47(%rip), %rcx	 ;, tmp166
	call	fwrite	 ;
 ; D:\TC\src\output.c:104:     while ((statement = (Statement*)list_pop(body)) != 0)
	jmp	.L131	 ;
	.p2align 4,,10
	.p2align 3
.L132:
 ; D:\TC\src\output.c:105:         output_statement(statement, outfile, indent + 1, parser);
	movq	%r13, %r9	 ; parser,
	movq	%rsi, %r8	 ; _49,
	movq	%r15, %rdx	 ; outfile,
	call	output_statement	 ;
.L131:
 ; D:\TC\src\output.c:104:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp199, statement
 ; D:\TC\src\output.c:104:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	 ; statement
	jne	.L132	 ;,
	jmp	.L125	 ;
	.p2align 4,,10
	.p2align 3
.L127:
 ; D:\TC\src\output.c:118:             OUT(0, false, "variable\n");
	movq	48(%rsp), %rdx	 ; %sfp,
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
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
	movq	%r13, %r9	 ; parser,
	leaq	4(%r14), %r8	 ;,
	movq	%r15, %rdx	 ; outfile,
	call	output_variable	 ;
 ; D:\TC\src\output.c:120:             break;
	jmp	.L125	 ;
	.p2align 4,,10
	.p2align 3
.L138:
 ; D:\TC\src\output.c:51: }
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
	.seh_endproc
	.ident	"GCC: (GNU) 13.2.0"
	.def	indention;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
