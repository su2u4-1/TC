	.file	"D:\\TC\\src\\output.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O2 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
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
	movq	%r9, %rdi	 ; tmp121, parser
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp119, outfile
	subq	$40, %rsp	 ;,
 ; D:\TC\src\output.c:363:     if (name == NULL) {
	testq	%rcx, %rcx	 ; name
	je	.L2	 ;,
	movq	%rcx, %rsi	 ; tmp118, name
	addq	$1, %r12	 ;, indent
	leaq	.LC1(%rip), %r15	 ;, tmp115
	leaq	.LC2(%rip), %r14	 ;, tmp116
 ; D:\TC\src\output.c:370:     switch (name->kind) {
	leaq	.L7(%rip), %r13	 ;, tmp117
.L4:
	leaq	-1(%r12), %rbp	 ;, indent
 ; D:\TC\src\output.c:368:     ast_output(0, false, "name: \"%s\"\n", name->name);
	movq	%rdi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; outfile,
	movq	%rbp, %rdx	 ; indent,
	call	indention	 ;
 ; D:\TC\src\output.c:368:     ast_output(0, false, "name: \"%s\"\n", name->name);
	movq	8(%rsi), %r8	 ; name_58->name,
	movq	%r15, %rdx	 ; tmp115,
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:369:     ast_output(0, false, "id: %zu\n", name->id);
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %r9	 ; parser,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:369:     ast_output(0, false, "id: %zu\n", name->id);
	movq	16(%rsi), %r8	 ; name_58->id,
	movq	%r14, %rdx	 ; tmp116,
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:370:     switch (name->kind) {
	cmpl	$6, 32(%rsi)	 ;, name_58->kind
	ja	.L5	 ;,
	movl	32(%rsi), %eax	 ; name_58->kind, name_58->kind
 ; D:\TC\src\output.c:372:             ast_output(0, true, "kind: \"type\"\n");
	movq	%rdi, %r9	 ; parser,
 ; D:\TC\src\output.c:370:     switch (name->kind) {
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
 ; D:\TC\src\output.c:393:             ast_output(0, false, "kind: \"attribute\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:393:             ast_output(0, false, "kind: \"attribute\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rcx	 ;, tmp110
.L21:
	call	fwrite	 ;
 ; D:\TC\src\output.c:394:             ast_output(0, true, "type\n");
	movq	%rdi, %r9	 ; parser,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:394:             ast_output(0, true, "type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp111
	call	fwrite	 ;
 ; D:\TC\src\output.c:395:             output_name(name->type, outfile, indent + 1, parser);
	movq	(%rsi), %rsi	 ; name_58->type, name
.L14:
 ; D:\TC\src\output.c:363:     if (name == NULL) {
	leaq	1(%r12), %rax	 ;, ivtmp.25
	testq	%rsi, %rsi	 ; name
	je	.L2	 ;,
	movq	%rax, %r12	 ; ivtmp.25, indent
	jmp	.L4	 ;
	.p2align 4,,10
	.p2align 3
.L9:
 ; D:\TC\src\output.c:398:             ast_output(0, false, "kind: \"parameter\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:398:             ast_output(0, false, "kind: \"parameter\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC11(%rip), %rcx	 ;, tmp112
	jmp	.L21	 ;
	.p2align 4,,10
	.p2align 3
.L10:
 ; D:\TC\src\output.c:375:             ast_output(0, false, "kind: \"variable\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:375:             ast_output(0, false, "kind: \"variable\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rcx	 ;, tmp103
	jmp	.L21	 ;
	.p2align 4,,10
	.p2align 3
.L11:
 ; D:\TC\src\output.c:385:             ast_output(0, false, "kind: \"method\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:385:             ast_output(0, false, "kind: \"method\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC8(%rip), %rcx	 ;, tmp107
.L22:
	call	fwrite	 ;
 ; D:\TC\src\output.c:386:             ast_output(0, true, "return_type\n");
	movq	%rdi, %r9	 ; parser,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:386:             ast_output(0, true, "return_type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rcx	 ;, tmp108
	call	fwrite	 ;
 ; D:\TC\src\output.c:387:             output_name(name->type, outfile, indent + 1, parser);
	movq	(%rsi), %rsi	 ; name_58->type, name
 ; D:\TC\src\output.c:388:             break;
	jmp	.L14	 ;
	.p2align 4,,10
	.p2align 3
.L12:
 ; D:\TC\src\output.c:380:             ast_output(0, false, "kind: \"function\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:380:             ast_output(0, false, "kind: \"function\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC6(%rip), %rcx	 ;, tmp105
	jmp	.L22	 ;
	.p2align 4,,10
	.p2align 3
.L13:
 ; D:\TC\src\output.c:390:             ast_output(0, true, "kind: \"class\"\n");
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:390:             ast_output(0, true, "kind: \"class\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC9(%rip), %rcx	 ;, tmp109
.L23:
 ; D:\TC\src\output.c:407: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:403:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	jmp	fwrite	 ;
	.p2align 4,,10
	.p2align 3
.L6:
 ; D:\TC\src\output.c:372:             ast_output(0, true, "kind: \"type\"\n");
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:372:             ast_output(0, true, "kind: \"type\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC3(%rip), %rcx	 ;, tmp102
	jmp	.L23	 ;
.L5:
 ; D:\TC\src\output.c:403:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	movq	%rdi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:403:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$25, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC12(%rip), %rcx	 ;, tmp114
	jmp	.L23	 ;
	.p2align 4,,10
	.p2align 3
.L2:
 ; D:\TC\src\output.c:364:         ast_output(0, true, "Name pointer: \"NULL\"\n");
	movq	%rdi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%r12, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:364:         ast_output(0, true, "Name pointer: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$21, %r8d	 ;,
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
 ; D:\TC\src\output.c:271:     switch (primary->type) {
	leaq	.L30(%rip), %r15	 ;, tmp138
 ; D:\TC\src\output.c:254: void output_expression(Expression* expression, FILE* outfile, size_t indent, Parser* parser) {
	pushq	%r14	 ;
	movq	%rcx, %r14	 ; tmp140, expression
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%r9, %rdi	 ; tmp143, parser
	pushq	%rsi	 ;
	movq	%r8, %rsi	 ; tmp142, indent
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp141, outfile
	subq	$40, %rsp	 ;,
.L39:
 ; D:\TC\src\output.c:256:     if (expression->operator == OP_NONE) {
	movl	24(%r14), %ecx	 ; expression_4->operator, _1
	leaq	.LC30(%rip), %r13	 ;, tmp133
 ; D:\TC\src\output.c:261:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	leaq	.LC13(%rip), %rbp	 ;, tmp137
 ; D:\TC\src\output.c:256:     if (expression->operator == OP_NONE) {
	cmpl	$19, %ecx	 ;, _1
	je	.L54	 ;,
.L26:
 ; D:\TC\src\output.c:260:         string op_str = operator_to_string(expression->operator);
	call	operator_to_string	 ;
 ; D:\TC\src\output.c:261:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	%rdi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; indent,
 ; D:\TC\src\output.c:260:         string op_str = operator_to_string(expression->operator);
	movq	%rax, %r12	 ; tmp144, op_str
 ; D:\TC\src\output.c:261:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:261:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	testq	%r12, %r12	 ; op_str
 ; D:\TC\src\output.c:261:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	%r12, %r8	 ; op_str, op_str
	movq	%rbx, %rcx	 ; outfile,
	cmove	%rbp, %r8	 ; op_str,, tmp137, op_str
	leaq	.LC29(%rip), %rdx	 ;,
 ; D:\TC\src\output.c:263:         output_expression(expression->expr_left, outfile, indent + 1, parser);
	leaq	1(%rsi), %r12	 ;, _5
 ; D:\TC\src\output.c:261:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	call	fprintf	 ;
 ; D:\TC\src\output.c:262:         ast_output(0, false, "left\n");
	movq	%rdi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:262:         ast_output(0, false, "left\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; tmp133,
	movl	$5, %r8d	 ;,
	call	fwrite	 ;
 ; D:\TC\src\output.c:263:         output_expression(expression->expr_left, outfile, indent + 1, parser);
	movq	(%r14), %rcx	 ; expression_92->expr_left, expression_92->expr_left
	movq	%rdi, %r9	 ; parser,
	movq	%r12, %r8	 ; _5,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:\TC\src\output.c:264:         ast_output(0, true, "right\n");
	movq	%rdi, %r9	 ; parser,
	movq	%rsi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:264:         ast_output(0, true, "right\n");
	leaq	.LC31(%rip), %rcx	 ;,
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	call	fwrite	 ;
 ; D:\TC\src\output.c:265:         output_expression(expression->right, outfile, indent + 1, parser);
	movq	16(%r14), %r14	 ; expression_92->right, expression
 ; D:\TC\src\output.c:256:     if (expression->operator == OP_NONE) {
	movl	24(%r14), %ecx	 ; _8->operator, _1
 ; D:\TC\src\output.c:256:     if (expression->operator == OP_NONE) {
	cmpl	$19, %ecx	 ;, _1
	je	.L42	 ;,
	movq	%r12, %rsi	 ; _5, indent
	jmp	.L26	 ;
	.p2align 4,,10
	.p2align 3
.L54:
	movq	%rsi, %r12	 ; indent, _5
.L42:
 ; D:\TC\src\output.c:257:         ast_output(0, true, "primary\n");
	movq	%rdi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%r12, %rdx	 ; _5,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:257:         ast_output(0, true, "primary\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC14(%rip), %rcx	 ;,
	leaq	2(%r12), %rsi	 ;, indent
	call	fwrite	 ;
 ; D:\TC\src\output.c:258:         output_primary(expression->prim_left, outfile, indent + 1, parser);
	movq	8(%r14), %rbp	 ; expression_99->prim_left, primary
.L27:
 ; D:\TC\src\output.c:271:     switch (primary->type) {
	cmpl	$8, 8(%rbp)	 ;, primary_28->type
	leaq	-1(%rsi), %r12	 ;, indent
	ja	.L28	 ;,
	movl	8(%rbp), %eax	 ; primary_28->type, primary_28->type
 ; D:\TC\src\output.c:308:             ast_output(0, false, "type: \"variable\"\n");
	movq	%rdi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%r12, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:271:     switch (primary->type) {
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
 ; D:\TC\src\output.c:303:             ast_output(0, false, "type: \"-\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:303:             ast_output(0, false, "type: \"-\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC26(%rip), %rcx	 ;, tmp122
.L50:
	call	fwrite	 ;
 ; D:\TC\src\output.c:304:             ast_output(0, true, "value\n");
	movq	%rdi, %r9	 ; parser,
	movq	%r12, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	addq	$1, %rsi	 ;, indent
	call	indention	 ;
 ; D:\TC\src\output.c:304:             ast_output(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC24(%rip), %rcx	 ;, tmp123
	call	fwrite	 ;
 ; D:\TC\src\output.c:305:             output_primary(primary->value.operand, outfile, indent + 1, parser);
	movq	0(%rbp), %rbp	 ; primary_28->value.operand, primary
	jmp	.L27	 ;
	.p2align 4,,10
	.p2align 3
.L29:
 ; D:\TC\src\output.c:308:             ast_output(0, false, "type: \"variable\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:308:             ast_output(0, false, "type: \"variable\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC27(%rip), %rcx	 ;, tmp124
	call	fwrite	 ;
 ; D:\TC\src\output.c:309:             ast_output(0, true, "value\n");
	movq	%rdi, %r9	 ; parser,
	movq	%r12, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:309:             ast_output(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC24(%rip), %rcx	 ;, tmp125
	call	fwrite	 ;
 ; D:\TC\src\output.c:310:             output_variable_access(primary->value.var, outfile, indent + 1, parser);
	movq	0(%rbp), %rcx	 ; primary_28->value.var, primary_28->value.var
 ; D:\TC\src\output.c:268: }
	addq	$40, %rsp	 ;,
 ; D:\TC\src\output.c:310:             output_variable_access(primary->value.var, outfile, indent + 1, parser);
	movq	%rdi, %r9	 ; parser,
	movq	%rsi, %r8	 ; indent,
	movq	%rbx, %rdx	 ; outfile,
 ; D:\TC\src\output.c:268: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:310:             output_variable_access(primary->value.var, outfile, indent + 1, parser);
	jmp	output_variable_access	 ;
	.p2align 4,,10
	.p2align 3
.L38:
 ; D:\TC\src\output.c:273:             ast_output(0, false, "type: \"integer\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:273:             ast_output(0, false, "type: \"integer\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC15(%rip), %rcx	 ;, tmp105
.L51:
 ; D:\TC\src\output.c:277:             ast_output(0, false, "type: \"float\"\n");
	call	fwrite	 ;
 ; D:\TC\src\output.c:278:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	%r12, %rdx	 ; indent,
	movq	%rdi, %r9	 ; parser,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:278:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	0(%rbp), %r8	 ; primary_28->value.literal_value,
	leaq	.LC16(%rip), %rdx	 ;, tmp110
.L52:
 ; D:\TC\src\output.c:268: }
	addq	$40, %rsp	 ;,
 ; D:\TC\src\output.c:278:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:268: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:278:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	jmp	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L37:
 ; D:\TC\src\output.c:277:             ast_output(0, false, "type: \"float\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:277:             ast_output(0, false, "type: \"float\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC17(%rip), %rcx	 ;, tmp108
	jmp	.L51	 ;
	.p2align 4,,10
	.p2align 3
.L36:
 ; D:\TC\src\output.c:281:             ast_output(0, false, "type: \"string\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:281:             ast_output(0, false, "type: \"string\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rcx	 ;, tmp111
	call	fwrite	 ;
 ; D:\TC\src\output.c:282:             ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
	movq	%r12, %rdx	 ; indent,
	movq	%rdi, %r9	 ; parser,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:282:             ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
	movq	0(%rbp), %r8	 ; primary_28->value.literal_value,
	leaq	.LC19(%rip), %rdx	 ;, tmp113
	jmp	.L52	 ;
	.p2align 4,,10
	.p2align 3
.L35:
 ; D:\TC\src\output.c:285:             ast_output(0, false, "type: \"boolean\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:285:             ast_output(0, false, "type: \"boolean\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC20(%rip), %rcx	 ;, tmp114
	call	fwrite	 ;
 ; D:\TC\src\output.c:286:             ast_output(0, true, "value: \"true\"\n");
	movq	%rdi, %r9	 ; parser,
	movq	%r12, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:286:             ast_output(0, true, "value: \"true\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC21(%rip), %rcx	 ;, tmp115
.L53:
 ; D:\TC\src\output.c:268: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:290:             ast_output(0, true, "value: \"false\"\n");
	jmp	fwrite	 ;
	.p2align 4,,10
	.p2align 3
.L34:
 ; D:\TC\src\output.c:289:             ast_output(0, false, "type: \"boolean\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:289:             ast_output(0, false, "type: \"boolean\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC20(%rip), %rcx	 ;, tmp116
	call	fwrite	 ;
 ; D:\TC\src\output.c:290:             ast_output(0, true, "value: \"false\"\n");
	movq	%rdi, %r9	 ; parser,
	movq	%r12, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:290:             ast_output(0, true, "value: \"false\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC22(%rip), %rcx	 ;, tmp117
	jmp	.L53	 ;
	.p2align 4,,10
	.p2align 3
.L33:
 ; D:\TC\src\output.c:293:             ast_output(0, false, "type: \"expression\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:293:             ast_output(0, false, "type: \"expression\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$19, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC23(%rip), %rcx	 ;, tmp118
	call	fwrite	 ;
 ; D:\TC\src\output.c:294:             ast_output(0, true, "value\n");
	movq	%rdi, %r9	 ; parser,
	movq	%r12, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:294:             ast_output(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC24(%rip), %rcx	 ;, tmp119
	call	fwrite	 ;
 ; D:\TC\src\output.c:295:             output_expression(primary->value.expr, outfile, indent + 1, parser);
	movq	0(%rbp), %r14	 ; primary_28->value.expr, expression
 ; D:\TC\src\output.c:296:             break;
	jmp	.L39	 ;
	.p2align 4,,10
	.p2align 3
.L32:
 ; D:\TC\src\output.c:298:             ast_output(0, false, "type: \"!\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:298:             ast_output(0, false, "type: \"!\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC25(%rip), %rcx	 ;, tmp120
	jmp	.L50	 ;
.L28:
 ; D:\TC\src\output.c:313:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movq	%r12, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movq	%rdi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:313:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movl	8(%rbp), %r8d	 ; primary_28->type,
 ; D:\TC\src\output.c:268: }
	addq	$40, %rsp	 ;,
 ; D:\TC\src\output.c:313:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movq	%rbx, %rcx	 ; outfile,
	leaq	.LC28(%rip), %rdx	 ;, tmp128
 ; D:\TC\src\output.c:268: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:313:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
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
 ; D:\TC\src\output.c:128:     ast_output(0, false, "type\n");
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\output.c:126: void output_variable(Variable* variable, FILE* outfile, size_t indent, Parser* parser) {
	pushq	%rsi	 ;
	movq	%r9, %rsi	 ; tmp101, parser
 ; D:\TC\src\output.c:129:     output_name(variable->type, outfile, indent + 1, parser);
	leaq	1(%rdi), %r12	 ;, _1
 ; D:\TC\src\output.c:126: void output_variable(Variable* variable, FILE* outfile, size_t indent, Parser* parser) {
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp99, outfile
 ; D:\TC\src\output.c:128:     ast_output(0, false, "type\n");
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:126: void output_variable(Variable* variable, FILE* outfile, size_t indent, Parser* parser) {
	subq	$32, %rsp	 ;,
 ; D:\TC\src\output.c:128:     ast_output(0, false, "type\n");
	call	indention	 ;
 ; D:\TC\src\output.c:128:     ast_output(0, false, "type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp91
	call	fwrite	 ;
 ; D:\TC\src\output.c:129:     output_name(variable->type, outfile, indent + 1, parser);
	movq	0(%rbp), %rcx	 ; variable_13(D)->type, variable_13(D)->type
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:130:     ast_output(0, false, "name\n");
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %r9	 ; parser,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:130:     ast_output(0, false, "name\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC32(%rip), %rcx	 ;, tmp93
	call	fwrite	 ;
 ; D:\TC\src\output.c:131:     output_name(variable->name, outfile, indent + 1, parser);
	movq	8(%rbp), %rcx	 ; variable_13(D)->name, variable_13(D)->name
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:132:     if (variable->value != NULL) {
	cmpq	$0, 16(%rbp)	 ;, variable_13(D)->value
 ; D:\TC\src\output.c:133:         ast_output(0, true, "value\n");
	movq	%rsi, %r9	 ; parser,
	movq	%rdi, %rdx	 ; indent,
	movl	$1, %r8d	 ;,
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:132:     if (variable->value != NULL) {
	je	.L56	 ;,
 ; D:\TC\src\output.c:133:         ast_output(0, true, "value\n");
	call	indention	 ;
 ; D:\TC\src\output.c:133:         ast_output(0, true, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC24(%rip), %rcx	 ;, tmp95
	call	fwrite	 ;
 ; D:\TC\src\output.c:134:         output_expression(variable->value, outfile, indent + 1, parser);
	movq	16(%rbp), %rcx	 ; variable_13(D)->value, variable_13(D)->value
 ; D:\TC\src\output.c:138: }
	addq	$32, %rsp	 ;,
 ; D:\TC\src\output.c:134:         output_expression(variable->value, outfile, indent + 1, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
 ; D:\TC\src\output.c:138: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:\TC\src\output.c:134:         output_expression(variable->value, outfile, indent + 1, parser);
	jmp	output_expression	 ;
	.p2align 4,,10
	.p2align 3
.L56:
 ; D:\TC\src\output.c:136:         ast_output(0, true, "value: \"NULL\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:138: }
	addq	$32, %rsp	 ;,
 ; D:\TC\src\output.c:136:         ast_output(0, true, "value: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
 ; D:\TC\src\output.c:138: }
	popq	%rbx	 ;
 ; D:\TC\src\output.c:136:         ast_output(0, true, "value: \"NULL\"\n");
	movl	$1, %edx	 ;,
	leaq	.LC33(%rip), %rcx	 ;, tmp97
 ; D:\TC\src\output.c:138: }
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:\TC\src\output.c:136:         ast_output(0, true, "value: \"NULL\"\n");
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
	movq	%r9, %rsi	 ; tmp131, parser
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp129, outfile
	subq	$40, %rsp	 ;,
 ; D:\TC\src\output.c:322:     switch (variable_access->type) {
	movl	16(%rcx), %eax	 ; variable_access_19(D)->type, _1
 ; D:\TC\src\output.c:322:     switch (variable_access->type) {
	cmpl	$2, %eax	 ;, _1
	je	.L59	 ;,
	ja	.L60	 ;,
	testl	%eax, %eax	 ; _1
	je	.L73	 ;,
 ; D:\TC\src\output.c:329:             args = list_copy(variable_access->content.args);
	movq	8(%rcx), %rcx	 ; variable_access_19(D)->content.args, variable_access_19(D)->content.args
 ; D:\TC\src\output.c:332:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	leaq	1(%rbp), %r14	 ;, _5
 ; D:\TC\src\output.c:335:             index = -1;
	movl	$-1, %r12d	 ;, index
 ; D:\TC\src\output.c:337:                 ast_output(1, false, "arguments[%d]\n", ++index);
	leaq	.LC38(%rip), %r15	 ;, tmp126
 ; D:\TC\src\output.c:329:             args = list_copy(variable_access->content.args);
	call	list_copy	 ;
 ; D:\TC\src\output.c:330:             ast_output(0, false, "type: \"function_call\"\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rsi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:329:             args = list_copy(variable_access->content.args);
	movq	%rax, %r13	 ; tmp132, args
 ; D:\TC\src\output.c:330:             ast_output(0, false, "type: \"function_call\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:330:             ast_output(0, false, "type: \"function_call\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$22, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC35(%rip), %rcx	 ;, tmp108
	call	fwrite	 ;
 ; D:\TC\src\output.c:331:             ast_output(0, false, "function\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rsi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:331:             ast_output(0, false, "function\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC36(%rip), %rcx	 ;, tmp109
	call	fwrite	 ;
 ; D:\TC\src\output.c:332:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	movq	(%rdi), %rcx	 ; variable_access_19(D)->base, variable_access_19(D)->base
	movq	%rsi, %r9	 ; parser,
	movq	%r14, %r8	 ; _5,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; D:\TC\src\output.c:333:             ast_output(0, true, "arguments\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rsi, %r9	 ; parser,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
 ; D:\TC\src\output.c:338:                 output_expression(arg, outfile, indent + 2, parser);
	addq	$2, %rbp	 ;, tmp127
 ; D:\TC\src\output.c:333:             ast_output(0, true, "arguments\n");
	call	indention	 ;
 ; D:\TC\src\output.c:333:             ast_output(0, true, "arguments\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC37(%rip), %rcx	 ;, tmp111
	call	fwrite	 ;
 ; D:\TC\src\output.c:336:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	jmp	.L65	 ;
	.p2align 4,,10
	.p2align 3
.L66:
 ; D:\TC\src\output.c:337:                 ast_output(1, false, "arguments[%d]\n", ++index);
	movq	%rsi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%r14, %rdx	 ; _5,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:337:                 ast_output(1, false, "arguments[%d]\n", ++index);
	addl	$1, %r12d	 ;, index
	movq	%r15, %rdx	 ; tmp126,
	movq	%rbx, %rcx	 ; outfile,
	movl	%r12d, %r8d	 ; index,
	call	fprintf	 ;
 ; D:\TC\src\output.c:338:                 output_expression(arg, outfile, indent + 2, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %r8	 ; tmp127,
	movq	%rbx, %rdx	 ; outfile,
	movq	%rdi, %rcx	 ; arg,
	call	output_expression	 ;
.L65:
 ; D:\TC\src\output.c:336:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	movq	%r13, %rcx	 ; args,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp133, arg
 ; D:\TC\src\output.c:336:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	 ; arg
	jne	.L66	 ;,
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
	.p2align 4,,10
	.p2align 3
.L60:
 ; D:\TC\src\output.c:322:     switch (variable_access->type) {
	cmpl	$3, %eax	 ;, _1
	jne	.L74	 ;,
 ; D:\TC\src\output.c:342:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:344:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	leaq	1(%rbp), %r12	 ;, _8
 ; D:\TC\src\output.c:342:             ast_output(0, false, "type: \"get sequence_element\"\n");
	xorl	%r8d, %r8d	 ;
	call	indention	 ;
 ; D:\TC\src\output.c:342:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$29, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC39(%rip), %rcx	 ;, tmp114
	call	fwrite	 ;
 ; D:\TC\src\output.c:343:             ast_output(0, false, "sequence\n");
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	xorl	%r8d, %r8d	 ;
	call	indention	 ;
 ; D:\TC\src\output.c:343:             ast_output(0, false, "sequence\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC40(%rip), %rcx	 ;, tmp115
	call	fwrite	 ;
 ; D:\TC\src\output.c:344:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	movq	(%rdi), %rcx	 ; variable_access_19(D)->base, variable_access_19(D)->base
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _8,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; D:\TC\src\output.c:345:             ast_output(0, true, "index\n");
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:345:             ast_output(0, true, "index\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC41(%rip), %rcx	 ;, tmp117
	call	fwrite	 ;
 ; D:\TC\src\output.c:346:             output_expression(variable_access->content.index, outfile, indent + 1, parser);
	movq	8(%rdi), %rcx	 ; variable_access_19(D)->content.index, variable_access_19(D)->content.index
 ; D:\TC\src\output.c:360: }
	addq	$40, %rsp	 ;,
 ; D:\TC\src\output.c:346:             output_expression(variable_access->content.index, outfile, indent + 1, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _8,
	movq	%rbx, %rdx	 ; outfile,
 ; D:\TC\src\output.c:360: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:346:             output_expression(variable_access->content.index, outfile, indent + 1, parser);
	jmp	output_expression	 ;
	.p2align 4,,10
	.p2align 3
.L59:
 ; D:\TC\src\output.c:349:             ast_output(0, false, "type: \"get_attribute\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
 ; D:\TC\src\output.c:351:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	leaq	1(%rbp), %r12	 ;, _11
 ; D:\TC\src\output.c:349:             ast_output(0, false, "type: \"get_attribute\"\n");
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:349:             ast_output(0, false, "type: \"get_attribute\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$22, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC42(%rip), %rcx	 ;, tmp119
	call	fwrite	 ;
 ; D:\TC\src\output.c:350:             ast_output(0, false, "object\n");
	movq	%rsi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:350:             ast_output(0, false, "object\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC43(%rip), %rcx	 ;, tmp120
	call	fwrite	 ;
 ; D:\TC\src\output.c:351:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	movq	(%rdi), %rcx	 ; variable_access_19(D)->base, variable_access_19(D)->base
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _11,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; D:\TC\src\output.c:352:             ast_output(0, true, "attribute_name\n");
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:352:             ast_output(0, true, "attribute_name\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	leaq	.LC44(%rip), %rcx	 ;, tmp122
	movl	$1, %edx	 ;,
	call	fwrite	 ;
 ; D:\TC\src\output.c:353:             output_name(variable_access->content.attr_name, outfile, indent + 1, parser);
	movq	8(%rdi), %rcx	 ; variable_access_19(D)->content.attr_name, variable_access_19(D)->content.attr_name
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _11,
.L72:
 ; D:\TC\src\output.c:360: }
	addq	$40, %rsp	 ;,
 ; D:\TC\src\output.c:353:             output_name(variable_access->content.attr_name, outfile, indent + 1, parser);
	movq	%rbx, %rdx	 ; outfile,
 ; D:\TC\src\output.c:360: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:353:             output_name(variable_access->content.attr_name, outfile, indent + 1, parser);
	jmp	output_name	 ;
	.p2align 4,,10
	.p2align 3
.L73:
 ; D:\TC\src\output.c:324:             ast_output(0, false, "type: \"name\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:324:             ast_output(0, false, "type: \"name\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC34(%rip), %rcx	 ;, tmp103
	call	fwrite	 ;
 ; D:\TC\src\output.c:325:             ast_output(0, true, "name\n");
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:325:             ast_output(0, true, "name\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	leaq	.LC32(%rip), %rcx	 ;, tmp104
	movl	$1, %edx	 ;,
	call	fwrite	 ;
 ; D:\TC\src\output.c:326:             output_name(variable_access->content.name, outfile, indent + 1, parser);
	movq	8(%rdi), %rcx	 ; variable_access_19(D)->content.name, variable_access_19(D)->content.name
	movq	%rsi, %r9	 ; parser,
	leaq	1(%rbp), %r8	 ;,
	jmp	.L72	 ;
	.p2align 4,,10
	.p2align 3
.L74:
 ; D:\TC\src\output.c:356:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:356:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movl	16(%rdi), %r8d	 ; variable_access_19(D)->type,
 ; D:\TC\src\output.c:360: }
	addq	$40, %rsp	 ;,
 ; D:\TC\src\output.c:356:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movq	%rbx, %rcx	 ; outfile,
	leaq	.LC45(%rip), %rdx	 ;, tmp125
 ; D:\TC\src\output.c:360: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:356:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
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
	movq	%r9, %rsi	 ; tmp198, parser
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp196, outfile
	subq	$72, %rsp	 ;,
 ; D:\TC\src\output.c:141:     switch (statement->type) {
	cmpl	$7, 8(%rcx)	 ;, statement_19(D)->type
	ja	.L76	 ;,
	movl	8(%rcx), %eax	 ; statement_19(D)->type, statement_19(D)->type
	leaq	.L78(%rip), %rdx	 ;, tmp137
 ; D:\TC\src\output.c:171:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:141:     switch (statement->type) {
	movslq	(%rdx,%rax,4), %rax	 ;, tmp139
	addq	%rdx, %rax	 ; tmp137, tmp140
 ; D:\TC\src\output.c:171:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movq	%rdi, %rdx	 ; indent,
 ; D:\TC\src\output.c:141:     switch (statement->type) {
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
 ; D:\TC\src\output.c:168:             ast_output(0, false, "break_statement: \"NULL\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:168:             ast_output(0, false, "break_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$24, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC61(%rip), %rcx	 ;, tmp183
.L109:
 ; D:\TC\src\output.c:187: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:168:             ast_output(0, false, "break_statement: \"NULL\"\n");
	jmp	fwrite	 ;
	.p2align 4,,10
	.p2align 3
.L77:
 ; D:\TC\src\output.c:171:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:171:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$27, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC62(%rip), %rcx	 ;, tmp184
	jmp	.L109	 ;
	.p2align 4,,10
	.p2align 3
.L85:
 ; D:\TC\src\output.c:174:             if (statement->stmt.expr == NULL) {
	cmpq	$0, 0(%rbp)	 ;, statement_19(D)->stmt.expr
	je	.L111	 ;,
 ; D:\TC\src\output.c:179:             ast_output(0, false, "expression_statement\n");
	call	indention	 ;
 ; D:\TC\src\output.c:179:             ast_output(0, false, "expression_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$21, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC64(%rip), %rcx	 ;, tmp186
.L110:
	call	fwrite	 ;
 ; D:\TC\src\output.c:180:             output_expression(statement->stmt.expr, outfile, indent + 1, parser);
	movq	0(%rbp), %rcx	 ; statement_19(D)->stmt.expr, statement_19(D)->stmt.expr
 ; D:\TC\src\output.c:187: }
	addq	$72, %rsp	 ;,
 ; D:\TC\src\output.c:180:             output_expression(statement->stmt.expr, outfile, indent + 1, parser);
	movq	%rsi, %r9	 ; parser,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
 ; D:\TC\src\output.c:187: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:180:             output_expression(statement->stmt.expr, outfile, indent + 1, parser);
	jmp	output_expression	 ;
	.p2align 4,,10
	.p2align 3
.L84:
 ; D:\TC\src\output.c:155:             ast_output(0, false, "variable_declaration_statement\n");
	call	indention	 ;
 ; D:\TC\src\output.c:155:             ast_output(0, false, "variable_declaration_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC58(%rip), %rcx	 ;, tmp176
	call	fwrite	 ;
 ; D:\TC\src\output.c:156:             output_variable(statement->stmt.var, outfile, indent + 1, parser);
	movq	0(%rbp), %rcx	 ; statement_19(D)->stmt.var, statement_19(D)->stmt.var
 ; D:\TC\src\output.c:187: }
	addq	$72, %rsp	 ;,
 ; D:\TC\src\output.c:156:             output_variable(statement->stmt.var, outfile, indent + 1, parser);
	movq	%rsi, %r9	 ; parser,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
 ; D:\TC\src\output.c:187: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:156:             output_variable(statement->stmt.var, outfile, indent + 1, parser);
	jmp	output_variable	 ;
	.p2align 4,,10
	.p2align 3
.L83:
 ; D:\TC\src\output.c:143:             ast_output(0, false, "if_statement\n");
	call	indention	 ;
 ; D:\TC\src\output.c:143:             ast_output(0, false, "if_statement\n");
	movq	%rbx, %r9	 ; outfile,
 ; D:\TC\src\output.c:144:             output_if(statement->stmt.if_stmt, outfile, indent + 1, parser);
	leaq	1(%rdi), %r13	 ;, _2
 ; D:\TC\src\output.c:143:             ast_output(0, false, "if_statement\n");
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC46(%rip), %rcx	 ;, tmp142
 ; D:\TC\src\output.c:144:             output_if(statement->stmt.if_stmt, outfile, indent + 1, parser);
	movq	%r13, %r12	 ; _2, _2
 ; D:\TC\src\output.c:143:             ast_output(0, false, "if_statement\n");
	call	fwrite	 ;
 ; D:\TC\src\output.c:144:             output_if(statement->stmt.if_stmt, outfile, indent + 1, parser);
	movq	0(%rbp), %r14	 ; statement_19(D)->stmt.if_stmt, _3
	movq	%r13, 56(%rsp)	 ; _2, %sfp
 ; D:\TC\src\output.c:194:     output_expression(if_->condition, outfile, indent + 1, parser);
	leaq	2(%rdi), %rbp	 ;, _57
 ; D:\TC\src\output.c:190:     list(Statement*) body = list_copy(if_->body);
	movq	8(%r14), %rcx	 ; _3->body, _3->body
	call	list_copy	 ;
 ; D:\TC\src\output.c:191:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	movq	16(%r14), %rcx	 ; _3->else_if, _3->else_if
 ; D:\TC\src\output.c:190:     list(Statement*) body = list_copy(if_->body);
	movq	%rax, %r15	 ; tmp199, body
 ; D:\TC\src\output.c:191:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	call	list_copy	 ;
 ; D:\TC\src\output.c:192:     list(Statement*) else_body = list_copy(if_->else_body);
	movq	24(%r14), %rcx	 ; _3->else_body, _3->else_body
 ; D:\TC\src\output.c:191:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	movq	%rax, 40(%rsp)	 ; tmp200, %sfp
 ; D:\TC\src\output.c:192:     list(Statement*) else_body = list_copy(if_->else_body);
	call	list_copy	 ;
 ; D:\TC\src\output.c:193:     ast_output(0, false, "condition\n");
	movq	%rsi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%r13, %rdx	 ; _2,
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:193:     ast_output(0, false, "condition\n");
	leaq	.LC47(%rip), %r13	 ;, tmp191
 ; D:\TC\src\output.c:192:     list(Statement*) else_body = list_copy(if_->else_body);
	movq	%rax, 48(%rsp)	 ; tmp201, %sfp
 ; D:\TC\src\output.c:193:     ast_output(0, false, "condition\n");
	call	indention	 ;
 ; D:\TC\src\output.c:193:     ast_output(0, false, "condition\n");
	movq	%rbx, %r9	 ; outfile,
	movq	%r13, %rcx	 ; tmp191,
	movl	$1, %edx	 ;,
	movl	$10, %r8d	 ;,
	call	fwrite	 ;
 ; D:\TC\src\output.c:194:     output_expression(if_->condition, outfile, indent + 1, parser);
	movq	(%r14), %rcx	 ; _3->condition, _3->condition
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %r8	 ; _57,
	movq	%rbx, %rdx	 ; outfile,
 ; D:\TC\src\output.c:195:     ast_output(0, false, "body\n");
	leaq	.LC48(%rip), %r14	 ;, tmp192
 ; D:\TC\src\output.c:194:     output_expression(if_->condition, outfile, indent + 1, parser);
	call	output_expression	 ;
 ; D:\TC\src\output.c:195:     ast_output(0, false, "body\n");
	movq	%rsi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%r12, %rdx	 ; _2,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:195:     ast_output(0, false, "body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; tmp192,
	movl	$5, %r8d	 ;,
	call	fwrite	 ;
 ; D:\TC\src\output.c:197:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L86	 ;
	.p2align 4,,10
	.p2align 3
.L87:
 ; D:\TC\src\output.c:198:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rbp, %r8	 ; _57,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
.L86:
 ; D:\TC\src\output.c:197:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r15, %rcx	 ; body,
	call	list_pop	 ;
 ; D:\TC\src\output.c:198:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rsi, %r9	 ; parser,
 ; D:\TC\src\output.c:197:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rax, %rcx	 ; tmp202, statement
 ; D:\TC\src\output.c:197:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L87	 ;,
 ; D:\TC\src\output.c:199:     ast_output(0, false, "else_if\n");
	movq	56(%rsp), %rdx	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:212:     output_expression(else_if->condition, outfile, indent + 1, parser);
	leaq	3(%rdi), %r15	 ;, _64
 ; D:\TC\src\output.c:199:     ast_output(0, false, "else_if\n");
	call	indention	 ;
 ; D:\TC\src\output.c:199:     ast_output(0, false, "else_if\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC49(%rip), %rcx	 ;, tmp149
	call	fwrite	 ;
.L88:
 ; D:\TC\src\output.c:201:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	movq	40(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %r12	 ; tmp205, else_if
 ; D:\TC\src\output.c:201:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	testq	%rax, %rax	 ; else_if
	je	.L112	 ;,
 ; D:\TC\src\output.c:210:     list(Statement*) body = list_copy(else_if->body);
	movq	8(%r12), %rcx	 ; else_if_60->body, else_if_60->body
	call	list_copy	 ;
 ; D:\TC\src\output.c:211:     ast_output(0, false, "condition\n");
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %rdx	 ; _57,
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:210:     list(Statement*) body = list_copy(else_if->body);
	movq	%rax, %rdi	 ; tmp203, body
 ; D:\TC\src\output.c:211:     ast_output(0, false, "condition\n");
	call	indention	 ;
 ; D:\TC\src\output.c:211:     ast_output(0, false, "condition\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; tmp191,
	movl	$10, %r8d	 ;,
	call	fwrite	 ;
 ; D:\TC\src\output.c:212:     output_expression(else_if->condition, outfile, indent + 1, parser);
	movq	(%r12), %rcx	 ; else_if_60->condition, else_if_60->condition
	movq	%rsi, %r9	 ; parser,
	movq	%r15, %r8	 ; _64,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:\TC\src\output.c:213:     ast_output(0, true, "body\n");
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %rdx	 ; _57,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:213:     ast_output(0, true, "body\n");
	movq	%r14, %rcx	 ; tmp192,
	movq	%rbx, %r9	 ; outfile,
	movl	$1, %edx	 ;,
	movl	$5, %r8d	 ;,
	call	fwrite	 ;
 ; D:\TC\src\output.c:215:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
 ; D:\TC\src\output.c:215:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L88	 ;,
.L90:
 ; D:\TC\src\output.c:216:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rax, %rcx	 ; statement,
	movq	%rsi, %r9	 ; parser,
	movq	%r15, %r8	 ; _64,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
 ; D:\TC\src\output.c:215:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
 ; D:\TC\src\output.c:215:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L90	 ;,
	jmp	.L88	 ;
	.p2align 4,,10
	.p2align 3
.L82:
 ; D:\TC\src\output.c:151:             ast_output(0, false, "while_statement\n");
	call	indention	 ;
 ; D:\TC\src\output.c:151:             ast_output(0, false, "while_statement\n");
	movq	%rbx, %r9	 ; outfile,
 ; D:\TC\src\output.c:152:             output_while(statement->stmt.while_stmt, outfile, indent + 1, parser);
	leaq	1(%rdi), %r12	 ;, _6
 ; D:\TC\src\output.c:151:             ast_output(0, false, "while_statement\n");
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC57(%rip), %rcx	 ;, tmp171
 ; D:\TC\src\output.c:247:     output_expression(while_->condition, outfile, indent + 1, parser);
	addq	$2, %rdi	 ;, _82
 ; D:\TC\src\output.c:151:             ast_output(0, false, "while_statement\n");
	call	fwrite	 ;
 ; D:\TC\src\output.c:152:             output_while(statement->stmt.while_stmt, outfile, indent + 1, parser);
	movq	0(%rbp), %r13	 ; statement_19(D)->stmt.while_stmt, _7
 ; D:\TC\src\output.c:245:     list(Statement*) body = list_copy(while_->body);
	movq	8(%r13), %rcx	 ; _7->body, _7->body
	call	list_copy	 ;
 ; D:\TC\src\output.c:246:     ast_output(0, false, "condition\n");
	movq	%rsi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%r12, %rdx	 ; _6,
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:245:     list(Statement*) body = list_copy(while_->body);
	movq	%rax, %rbp	 ; tmp209, body
 ; D:\TC\src\output.c:246:     ast_output(0, false, "condition\n");
	call	indention	 ;
 ; D:\TC\src\output.c:246:     ast_output(0, false, "condition\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC47(%rip), %rcx	 ;, tmp173
	call	fwrite	 ;
 ; D:\TC\src\output.c:247:     output_expression(while_->condition, outfile, indent + 1, parser);
	movq	0(%r13), %rcx	 ; _7->condition, _7->condition
	movq	%rsi, %r9	 ; parser,
	movq	%rdi, %r8	 ; _82,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:\TC\src\output.c:248:     ast_output(0, true, "body\n");
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %rdx	 ; _6,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:248:     ast_output(0, true, "body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rcx	 ;, tmp175
	call	fwrite	 ;
 ; D:\TC\src\output.c:250:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L104	 ;
	.p2align 4,,10
	.p2align 3
.L105:
 ; D:\TC\src\output.c:251:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%rdi, %r8	 ; _82,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
.L104:
 ; D:\TC\src\output.c:250:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbp, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp210, statement
 ; D:\TC\src\output.c:250:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L105	 ;,
.L75:
 ; D:\TC\src\output.c:187: }
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
 ; D:\TC\src\output.c:147:             ast_output(0, false, "for_statement\n");
	call	indention	 ;
 ; D:\TC\src\output.c:147:             ast_output(0, false, "for_statement\n");
	movq	%rbx, %r9	 ; outfile,
 ; D:\TC\src\output.c:148:             output_for(statement->stmt.for_stmt, outfile, indent + 1, parser);
	leaq	1(%rdi), %r13	 ;, _4
 ; D:\TC\src\output.c:147:             ast_output(0, false, "for_statement\n");
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC51(%rip), %rcx	 ;, tmp155
	call	fwrite	 ;
 ; D:\TC\src\output.c:148:             output_for(statement->stmt.for_stmt, outfile, indent + 1, parser);
	movq	0(%rbp), %r12	 ; statement_19(D)->stmt.for_stmt, _5
 ; D:\TC\src\output.c:221:     list(Statement*) body = list_copy(for_->body);
	movq	24(%r12), %rcx	 ; _5->body, _5->body
	call	list_copy	 ;
 ; D:\TC\src\output.c:223:         ast_output(0, false, "initializer\n");
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\output.c:222:     if (for_->initializer != NULL) {
	cmpq	$0, (%r12)	 ;, _5->initializer
 ; D:\TC\src\output.c:223:         ast_output(0, false, "initializer\n");
	movq	%rsi, %r9	 ; parser,
 ; D:\TC\src\output.c:221:     list(Statement*) body = list_copy(for_->body);
	movq	%rax, %rbp	 ; tmp207, body
 ; D:\TC\src\output.c:223:         ast_output(0, false, "initializer\n");
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:222:     if (for_->initializer != NULL) {
	je	.L95	 ;,
 ; D:\TC\src\output.c:223:         ast_output(0, false, "initializer\n");
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
	leaq	2(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable	 ;
.L96:
 ; D:\TC\src\output.c:228:         ast_output(0, false, "condition\n");
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\output.c:227:     if (for_->condition != NULL) {
	cmpq	$0, 8(%r12)	 ;, _5->condition
 ; D:\TC\src\output.c:228:         ast_output(0, false, "condition\n");
	movq	%rsi, %r9	 ; parser,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:227:     if (for_->condition != NULL) {
	je	.L97	 ;,
 ; D:\TC\src\output.c:228:         ast_output(0, false, "condition\n");
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
	movq	%rbx, %rdx	 ; outfile,
	leaq	2(%rdi), %r8	 ;,
	call	output_expression	 ;
.L98:
 ; D:\TC\src\output.c:233:         ast_output(0, false, "increment\n");
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\output.c:232:     if (for_->increment != NULL) {
	cmpq	$0, 16(%r12)	 ;, _5->increment
 ; D:\TC\src\output.c:233:         ast_output(0, false, "increment\n");
	movq	%rsi, %r9	 ; parser,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:232:     if (for_->increment != NULL) {
	je	.L99	 ;,
 ; D:\TC\src\output.c:233:         ast_output(0, false, "increment\n");
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
	movq	%rbx, %rdx	 ; outfile,
	leaq	2(%rdi), %r8	 ;,
	call	output_expression	 ;
.L100:
 ; D:\TC\src\output.c:237:     ast_output(0, true, "body\n");
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:237:     ast_output(0, true, "body\n");
	movq	%rbx, %r9	 ; outfile,
 ; D:\TC\src\output.c:240:         output_statement(statement, outfile, indent + 1, parser);
	addq	$2, %rdi	 ;, tmp194
 ; D:\TC\src\output.c:237:     ast_output(0, true, "body\n");
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rcx	 ;, tmp169
	call	fwrite	 ;
 ; D:\TC\src\output.c:239:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L101	 ;
	.p2align 4,,10
	.p2align 3
.L102:
 ; D:\TC\src\output.c:240:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%rdi, %r8	 ; tmp194,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
.L101:
 ; D:\TC\src\output.c:239:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbp, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp208, statement
 ; D:\TC\src\output.c:239:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L102	 ;,
	jmp	.L75	 ;
	.p2align 4,,10
	.p2align 3
.L80:
 ; D:\TC\src\output.c:159:             if (statement->stmt.expr == NULL) {
	cmpq	$0, 0(%rbp)	 ;, statement_19(D)->stmt.expr
	je	.L113	 ;,
 ; D:\TC\src\output.c:164:             ast_output(0, false, "return_statement\n");
	call	indention	 ;
 ; D:\TC\src\output.c:164:             ast_output(0, false, "return_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC60(%rip), %rcx	 ;, tmp180
	jmp	.L110	 ;
.L76:
 ; D:\TC\src\output.c:183:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	xorl	%r8d, %r8d	 ;
	call	indention	 ;
 ; D:\TC\src\output.c:183:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movl	8(%rbp), %r8d	 ; statement_19(D)->type,
 ; D:\TC\src\output.c:187: }
	addq	$72, %rsp	 ;,
 ; D:\TC\src\output.c:183:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movq	%rbx, %rcx	 ; outfile,
	leaq	.LC65(%rip), %rdx	 ;, tmp190
 ; D:\TC\src\output.c:187: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:183:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	jmp	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L112:
 ; D:\TC\src\output.c:203:     ast_output(0, true, "else_body\n");
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	%rsi, %r9	 ; parser,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:203:     ast_output(0, true, "else_body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC50(%rip), %rcx	 ;, tmp154
	call	fwrite	 ;
 ; D:\TC\src\output.c:204:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	jmp	.L92	 ;
	.p2align 4,,10
	.p2align 3
.L93:
 ; D:\TC\src\output.c:205:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %r8	 ; _57,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
.L92:
 ; D:\TC\src\output.c:204:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	movq	48(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp206, statement
 ; D:\TC\src\output.c:204:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L93	 ;,
	jmp	.L75	 ;
.L95:
 ; D:\TC\src\output.c:226:         ast_output(0, false, "initializer: \"NULL\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:226:         ast_output(0, false, "initializer: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$20, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC53(%rip), %rcx	 ;, tmp160
	call	fwrite	 ;
	jmp	.L96	 ;
.L99:
 ; D:\TC\src\output.c:236:         ast_output(0, false, "increment: \"NULL\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:236:         ast_output(0, false, "increment: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC56(%rip), %rcx	 ;, tmp168
	call	fwrite	 ;
	jmp	.L100	 ;
.L97:
 ; D:\TC\src\output.c:231:         ast_output(0, false, "condition: \"NULL\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:231:         ast_output(0, false, "condition: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC54(%rip), %rcx	 ;, tmp164
	call	fwrite	 ;
	jmp	.L98	 ;
.L111:
 ; D:\TC\src\output.c:175:                 ast_output(0, false, "expression_statement: \"NULL\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:175:                 ast_output(0, false, "expression_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$29, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC63(%rip), %rcx	 ;, tmp185
	jmp	.L109	 ;
.L113:
 ; D:\TC\src\output.c:160:                 ast_output(0, false, "return_statement: \"NULL\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:160:                 ast_output(0, false, "return_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$25, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC59(%rip), %rcx	 ;, tmp179
	jmp	.L109	 ;
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
	.p2align 4
	.globl	output_code
	.def	output_code;	.scl	2;	.type	32;	.endef
output_code:
	pushq	%r15	 ;
	movq	%rdx, %r15	 ; tmp187, outfile
	pushq	%r14	 ;
	movq	%r8, %r14	 ; tmp188, indent
	pushq	%r13	 ;
	movq	%r9, %r13	 ; tmp189, parser
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$88, %rsp	 ;,
 ; D:\TC\src\output.c:43:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rcx), %rcx	 ; code_5(D)->members, code_5(D)->members
	call	list_copy	 ;
	movq	%rax, 72(%rsp)	 ; tmp190, %sfp
	.p2align 4,,10
	.p2align 3
.L115:
 ; D:\TC\src\output.c:45:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	movq	72(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp201, member
 ; D:\TC\src\output.c:45:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	 ; member
	je	.L139	 ;,
 ; D:\TC\src\output.c:22:     switch (code_member->type) {
	movl	8(%rbx), %eax	 ; member_9->type, _14
 ; D:\TC\src\output.c:46:         output_code_member(member, outfile, indent + 1, parser);
	leaq	1(%r14), %rdx	 ;, _2
 ; D:\TC\src\output.c:36:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%r15, %rcx	 ; outfile,
 ; D:\TC\src\output.c:22:     switch (code_member->type) {
	cmpl	$1, %eax	 ;, _14
	je	.L116	 ;,
	cmpl	$2, %eax	 ;, _14
	je	.L117	 ;,
	testl	%eax, %eax	 ; _14
	jne	.L118	 ;,
 ; D:\TC\src\output.c:24:             ast_output(0, false, "import\n");
	call	indention	 ;
 ; D:\TC\src\output.c:25:             output_import(code_member->content.import, outfile, indent + 1, parser);
	leaq	2(%r14), %rsi	 ;, _15
 ; D:\TC\src\output.c:24:             ast_output(0, false, "import\n");
	movq	%r15, %r9	 ; outfile,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC67(%rip), %rcx	 ;, tmp135
	call	fwrite	 ;
 ; D:\TC\src\output.c:25:             output_import(code_member->content.import, outfile, indent + 1, parser);
	movq	(%rbx), %rbx	 ; member_9->content.import, _16
 ; D:\TC\src\output.c:51:     ast_output(0, false, "name\n");
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; _15,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:51:     ast_output(0, false, "name\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC32(%rip), %rcx	 ;, tmp136
	call	fwrite	 ;
 ; D:\TC\src\output.c:52:     output_name(import->name, outfile, indent + 1, parser);
	movq	(%rbx), %rcx	 ; _16->name, _16->name
	movq	%r13, %r9	 ; parser,
	leaq	3(%r14), %r8	 ;,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:53:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	%rsi, %rdx	 ; _15,
	movq	%r15, %rcx	 ; outfile,
	movq	%r13, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:53:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	8(%rbx), %rax	 ; _16->source, _24
 ; D:\TC\src\output.c:53:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	leaq	.LC66(%rip), %r8	 ;, tmp175
	movq	%r15, %rcx	 ; outfile,
	leaq	.LC68(%rip), %rdx	 ;, tmp139
 ; D:\TC\src\output.c:53:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	testq	%rax, %rax	 ; _24
 ; D:\TC\src\output.c:53:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	cmovne	%rax, %r8	 ; _24,,
	call	fprintf	 ;
 ; D:\TC\src\output.c:55: }
	jmp	.L115	 ;
	.p2align 4,,10
	.p2align 3
.L116:
 ; D:\TC\src\output.c:28:             ast_output(0, false, "function\n");
	call	indention	 ;
 ; D:\TC\src\output.c:29:             output_function(code_member->content.function, outfile, indent + 1, parser);
	leaq	2(%r14), %rdi	 ;, _17
 ; D:\TC\src\output.c:28:             ast_output(0, false, "function\n");
	movq	%r15, %r9	 ; outfile,
	movl	$1, %edx	 ;,
	movl	$9, %r8d	 ;,
	leaq	.LC36(%rip), %rcx	 ;, tmp140
 ; D:\TC\src\output.c:59:     output_name(function->name, outfile, indent + 1, parser);
	leaq	3(%r14), %rsi	 ;, _26
 ; D:\TC\src\output.c:28:             ast_output(0, false, "function\n");
	call	fwrite	 ;
 ; D:\TC\src\output.c:29:             output_function(code_member->content.function, outfile, indent + 1, parser);
	movq	(%rbx), %rbx	 ; member_9->content.function, _18
 ; D:\TC\src\output.c:58:     ast_output(0, false, "name\n");
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _17,
	movq	%r15, %rcx	 ; outfile,
 ; D:\TC\src\output.c:29:             output_function(code_member->content.function, outfile, indent + 1, parser);
	movq	%rdi, 40(%rsp)	 ; _17, %sfp
 ; D:\TC\src\output.c:69:         output_variable(parameter, outfile, indent + 2, parser);
	leaq	4(%r14), %r12	 ;, tmp182
 ; D:\TC\src\output.c:58:     ast_output(0, false, "name\n");
	call	indention	 ;
 ; D:\TC\src\output.c:58:     ast_output(0, false, "name\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC32(%rip), %rcx	 ;, tmp141
	call	fwrite	 ;
 ; D:\TC\src\output.c:59:     output_name(function->name, outfile, indent + 1, parser);
	movq	(%rbx), %rcx	 ; _18->name, _18->name
	movq	%r13, %r9	 ; parser,
	movq	%rsi, %r8	 ; _26,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:60:     ast_output(0, false, "return_type\n");
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _17,
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
	movq	%r13, %r9	 ; parser,
	movq	%rsi, %r8	 ; _26,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:62:     ast_output(0, false, "parameters\n");
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _17,
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
 ; D:\TC\src\output.c:64:     list(Statement*) body = list_copy(function->body);
	movq	24(%rbx), %rcx	 ; _18->body, _18->body
 ; D:\TC\src\output.c:66:     int index = -1;
	movl	$-1, %ebx	 ;, index
 ; D:\TC\src\output.c:63:     list(Variable*) parameters = list_copy(function->parameters);
	movq	%rax, %rbp	 ; tmp191, parameters
 ; D:\TC\src\output.c:64:     list(Statement*) body = list_copy(function->body);
	call	list_copy	 ;
	movq	%rax, 48(%rsp)	 ; body, %sfp
 ; D:\TC\src\output.c:67:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	jmp	.L121	 ;
	.p2align 4,,10
	.p2align 3
.L122:
 ; D:\TC\src\output.c:68:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; _26,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:68:         ast_output(1, false, "parameters[%d]\n", ++index);
	addl	$1, %ebx	 ;, index
	leaq	.LC70(%rip), %rdx	 ;,
	movq	%r15, %rcx	 ; outfile,
	movl	%ebx, %r8d	 ; index,
	call	fprintf	 ;
 ; D:\TC\src\output.c:69:         output_variable(parameter, outfile, indent + 2, parser);
	movq	%r13, %r9	 ; parser,
	movq	%r12, %r8	 ; tmp182,
	movq	%r15, %rdx	 ; outfile,
	movq	%rdi, %rcx	 ; parameter,
	call	output_variable	 ;
.L121:
 ; D:\TC\src\output.c:67:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%rbp, %rcx	 ; parameters,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp193, parameter
 ; D:\TC\src\output.c:67:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	 ; parameter
	jne	.L122	 ;,
 ; D:\TC\src\output.c:71:     ast_output(0, true, "body\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%r13, %r9	 ; parser,
	movq	%r15, %rcx	 ; outfile,
	movq	48(%rsp), %rdi	 ; %sfp, body
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:71:     ast_output(0, true, "body\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rcx	 ;, tmp150
	call	fwrite	 ;
 ; D:\TC\src\output.c:73:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L123	 ;
	.p2align 4,,10
	.p2align 3
.L124:
 ; D:\TC\src\output.c:74:         output_statement(statement, outfile, indent + 1, parser);
	movq	%r13, %r9	 ; parser,
	movq	%rsi, %r8	 ; _26,
	movq	%r15, %rdx	 ; outfile,
	call	output_statement	 ;
.L123:
 ; D:\TC\src\output.c:73:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp194, statement
 ; D:\TC\src\output.c:73:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L124	 ;,
	jmp	.L115	 ;
	.p2align 4,,10
	.p2align 3
.L118:
 ; D:\TC\src\output.c:36:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	call	indention	 ;
 ; D:\TC\src\output.c:36:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movl	8(%rbx), %r8d	 ; member_9->type,
	leaq	.LC76(%rip), %rdx	 ;, tmp173
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:37:             break;
	jmp	.L115	 ;
	.p2align 4,,10
	.p2align 3
.L117:
 ; D:\TC\src\output.c:32:             ast_output(0, false, "class\n");
	call	indention	 ;
 ; D:\TC\src\output.c:33:             output_class(code_member->content.class, outfile, indent + 1, parser);
	leaq	2(%r14), %rsi	 ;, _19
 ; D:\TC\src\output.c:32:             ast_output(0, false, "class\n");
	movq	%r15, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC71(%rip), %rcx	 ;, tmp151
	call	fwrite	 ;
 ; D:\TC\src\output.c:33:             output_class(code_member->content.class, outfile, indent + 1, parser);
	movq	(%rbx), %rbx	 ; member_9->content.class, _20
 ; D:\TC\src\output.c:117:     ast_output(0, false, "name\n");
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; _19,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:117:     ast_output(0, false, "name\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC32(%rip), %rcx	 ;,
	call	fwrite	 ;
 ; D:\TC\src\output.c:118:     output_name(class->name, outfile, indent + 1, parser);
	leaq	3(%r14), %rax	 ;, _38
	movq	(%rbx), %rcx	 ; _20->name, _20->name
	movq	%r13, %r9	 ; parser,
	movq	%rax, %r8	 ; _38,
	movq	%r15, %rdx	 ; outfile,
	movq	%rax, 48(%rsp)	 ; _38, %sfp
	call	output_name	 ;
 ; D:\TC\src\output.c:119:     ast_output(0, true, "members\n");
	movq	%r13, %r9	 ; parser,
	movq	%rsi, %rdx	 ; _19,
	movq	%r15, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
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
	movq	%rax, 40(%rsp)	 ; tmp195, %sfp
	.p2align 4,,10
	.p2align 3
.L125:
 ; D:\TC\src\output.c:122:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	movq	40(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp200, member
 ; D:\TC\src\output.c:122:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	 ; member
	je	.L115	 ;,
 ; D:\TC\src\output.c:100:     switch (class_member->type) {
	movl	8(%rbx), %eax	 ; member_42->type, _43
 ; D:\TC\src\output.c:100:     switch (class_member->type) {
	testl	%eax, %eax	 ; _43
	je	.L126	 ;,
	cmpl	$1, %eax	 ;, _43
	je	.L127	 ;,
 ; D:\TC\src\output.c:110:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movq	48(%rsp), %rdx	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%r15, %rcx	 ; outfile,
	movq	%r13, %r9	 ; parser,
	call	indention	 ;
 ; D:\TC\src\output.c:110:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movl	8(%rbx), %r8d	 ; member_42->type,
	leaq	.LC75(%rip), %rdx	 ;, tmp171
	movq	%r15, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:111:             break;
	jmp	.L125	 ;
	.p2align 4,,10
	.p2align 3
.L126:
 ; D:\TC\src\output.c:102:             ast_output(0, false, "method\n");
	movq	48(%rsp), %rdx	 ; %sfp,
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%r15, %rcx	 ; outfile,
 ; D:\TC\src\output.c:103:             output_method(class_member->content.method, outfile, indent + 1, parser);
	leaq	4(%r14), %rdi	 ;, _44
 ; D:\TC\src\output.c:80:     output_name(method->name, outfile, indent + 1, parser);
	leaq	5(%r14), %rsi	 ;, _49
 ; D:\TC\src\output.c:102:             ast_output(0, false, "method\n");
	call	indention	 ;
 ; D:\TC\src\output.c:102:             ast_output(0, false, "method\n");
	movq	%r15, %r9	 ; outfile,
 ; D:\TC\src\output.c:90:         output_variable(parameter, outfile, indent + 2, parser);
	leaq	6(%r14), %r12	 ;, tmp177
 ; D:\TC\src\output.c:102:             ast_output(0, false, "method\n");
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC73(%rip), %rcx	 ;,
	call	fwrite	 ;
 ; D:\TC\src\output.c:103:             output_method(class_member->content.method, outfile, indent + 1, parser);
	movq	(%rbx), %rbx	 ; member_42->content.method, _45
 ; D:\TC\src\output.c:79:     ast_output(0, false, "name\n");
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _44,
	movq	%r15, %rcx	 ; outfile,
 ; D:\TC\src\output.c:103:             output_method(class_member->content.method, outfile, indent + 1, parser);
	movq	%rdi, 56(%rsp)	 ; _44, %sfp
 ; D:\TC\src\output.c:79:     ast_output(0, false, "name\n");
	call	indention	 ;
 ; D:\TC\src\output.c:79:     ast_output(0, false, "name\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC32(%rip), %rcx	 ;,
	call	fwrite	 ;
 ; D:\TC\src\output.c:80:     output_name(method->name, outfile, indent + 1, parser);
	movq	(%rbx), %rcx	 ; _45->name, _45->name
	movq	%r13, %r9	 ; parser,
	movq	%rsi, %r8	 ; _49,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:81:     ast_output(0, false, "return_type\n");
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _44,
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
	movq	%r13, %r9	 ; parser,
	movq	%rsi, %r8	 ; _49,
	movq	%r15, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:83:     ast_output(0, false, "parameters\n");
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _44,
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
 ; D:\TC\src\output.c:85:     list(Statement*) body = list_copy(method->body);
	movq	24(%rbx), %rcx	 ; _45->body, _45->body
 ; D:\TC\src\output.c:87:     int index = -1;
	movl	$-1, %ebx	 ;, index
 ; D:\TC\src\output.c:84:     list(Variable*) parameters = list_copy(method->parameters);
	movq	%rax, %rbp	 ; tmp196, parameters
 ; D:\TC\src\output.c:85:     list(Statement*) body = list_copy(method->body);
	call	list_copy	 ;
	movq	%rax, 64(%rsp)	 ; body, %sfp
 ; D:\TC\src\output.c:88:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	jmp	.L129	 ;
	.p2align 4,,10
	.p2align 3
.L130:
 ; D:\TC\src\output.c:89:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; _49,
	movq	%r15, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:89:         ast_output(1, false, "parameters[%d]\n", ++index);
	addl	$1, %ebx	 ;, index
	leaq	.LC70(%rip), %rdx	 ;,
	movq	%r15, %rcx	 ; outfile,
	movl	%ebx, %r8d	 ; index,
	call	fprintf	 ;
 ; D:\TC\src\output.c:90:         output_variable(parameter, outfile, indent + 2, parser);
	movq	%r13, %r9	 ; parser,
	movq	%r12, %r8	 ; tmp177,
	movq	%r15, %rdx	 ; outfile,
	movq	%rdi, %rcx	 ; parameter,
	call	output_variable	 ;
.L129:
 ; D:\TC\src\output.c:88:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%rbp, %rcx	 ; parameters,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp198, parameter
 ; D:\TC\src\output.c:88:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	 ; parameter
	jne	.L130	 ;,
 ; D:\TC\src\output.c:92:     ast_output(0, true, "body\n");
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	%r13, %r9	 ; parser,
	movq	%r15, %rcx	 ; outfile,
	movq	64(%rsp), %rdi	 ; %sfp, body
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:92:     ast_output(0, true, "body\n");
	movq	%r15, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rcx	 ;, tmp166
	call	fwrite	 ;
 ; D:\TC\src\output.c:94:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L131	 ;
	.p2align 4,,10
	.p2align 3
.L132:
 ; D:\TC\src\output.c:95:         output_statement(statement, outfile, indent + 1, parser);
	movq	%r13, %r9	 ; parser,
	movq	%rsi, %r8	 ; _49,
	movq	%r15, %rdx	 ; outfile,
	call	output_statement	 ;
.L131:
 ; D:\TC\src\output.c:94:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp199, statement
 ; D:\TC\src\output.c:94:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L132	 ;,
	jmp	.L125	 ;
	.p2align 4,,10
	.p2align 3
.L127:
 ; D:\TC\src\output.c:106:             ast_output(0, false, "variable\n");
	movq	48(%rsp), %rdx	 ; %sfp,
	movq	%r13, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
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
	movq	%r13, %r9	 ; parser,
	leaq	4(%r14), %r8	 ;,
	movq	%r15, %rdx	 ; outfile,
	call	output_variable	 ;
 ; D:\TC\src\output.c:108:             break;
	jmp	.L125	 ;
	.p2align 4,,10
	.p2align 3
.L139:
 ; D:\TC\src\output.c:48: }
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
	.ident	"GCC: (GNU) 13.2.0"
	.def	indention;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
