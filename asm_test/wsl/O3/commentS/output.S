	.file	"output.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O3 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Name: \"NULL\"\n"
.LC1:
	.string	"name: \"%s\"\n"
.LC2:
	.string	"id: %zu\n"
.LC3:
	.string	"kind: \"type\"\n"
.LC4:
	.string	"kind: \"variable\"\n"
.LC5:
	.string	"type\n"
.LC6:
	.string	"kind: \"function\"\n"
.LC7:
	.string	"return_type\n"
.LC8:
	.string	"kind: \"method\"\n"
.LC9:
	.string	"kind: \"class\"\n"
.LC10:
	.string	"kind: \"attribute\"\n"
.LC11:
	.string	"kind: \"parameter\"\n"
.LC12:
	.string	"kind: \"unknown_NameType\"\n"
	.text
	.p2align 4
	.type	output_name, @function
output_name:
	pushq	%r15	;
	pushq	%r14	;
	movq	%rdx, %r14	; tmp120, indent
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rcx, %rbp	; tmp121, indent_has_next
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp119, outfile
	subq	$8, %rsp	;,
; src/output.c:365:     if (name == NULL) {
	testq	%rdi, %rdi	; name
	je	.L2	;,
	movq	%rdi, %r15	; tmp118, name
	addq	$1, %r14	;, indent
; src/output.c:372:     switch (name->kind) {
	leaq	.L7(%rip), %r13	;, tmp117
.L4:
	leaq	-1(%r14), %r12	;, indent
; src/output.c:370:     ast_output(0, false, "name: \"%s\"\n", name->name);
	xorl	%edx, %edx	;
	movq	%rbp, %rcx	; indent_has_next,
	movq	%rbx, %rdi	; outfile,
	movq	%r12, %rsi	; indent,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%r15), %rcx	; name_58->name, name_58->name
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC1(%rip), %rdx	;,
	movq	%rbx, %rdi	; outfile,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:371:     ast_output(0, false, "id: %zu\n", name->id);
	xorl	%edx, %edx	;
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	movq	16(%r15), %rcx	; name_58->id, name_58->id
	movl	$2, %esi	;,
	leaq	.LC2(%rip), %rdx	;,
	movq	%rbx, %rdi	; outfile,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:372:     switch (name->kind) {
	cmpl	$6, 32(%r15)	;, name_58->kind
	ja	.L5	;,
	movl	32(%r15), %eax	; name_58->kind, name_58->kind
; src/output.c:374:             ast_output(0, true, "kind: \"type\"\n");
	movq	%rbp, %rcx	; indent_has_next,
; src/output.c:372:     switch (name->kind) {
	movslq	0(%r13,%rax,4), %rax	;, tmp99
	addq	%r13, %rax	; tmp117, tmp100
	jmp	*%rax	; tmp100
	.section	.rodata
	.align 4
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
; src/output.c:395:             ast_output(0, false, "kind: \"attribute\"\n");
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rdi	;, tmp110
.L21:
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:396:             ast_output(0, true, "type\n");
	movq	%rbp, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp111
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:397:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	(%r15), %r15	; name_58->type, name
.L14:
; src/output.c:365:     if (name == NULL) {
	leaq	1(%r14), %rax	;, ivtmp.35
	testq	%r15, %r15	; name
	je	.L2	;,
	movq	%rax, %r14	; ivtmp.35, indent
	jmp	.L4	;
	.p2align 4,,10
	.p2align 3
.L9:
; src/output.c:400:             ast_output(0, false, "kind: \"parameter\"\n");
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rdi	;, tmp112
	jmp	.L21	;
	.p2align 4,,10
	.p2align 3
.L10:
; src/output.c:377:             ast_output(0, false, "kind: \"variable\"\n");
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rdi	;, tmp103
	jmp	.L21	;
	.p2align 4,,10
	.p2align 3
.L11:
; src/output.c:387:             ast_output(0, false, "kind: \"method\"\n");
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC8(%rip), %rdi	;, tmp107
.L22:
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:388:             ast_output(0, true, "return_type\n");
	movq	%rbp, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rdi	;, tmp108
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:389:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	(%r15), %r15	; name_58->type, name
; src/output.c:390:             break;
	jmp	.L14	;
	.p2align 4,,10
	.p2align 3
.L12:
; src/output.c:382:             ast_output(0, false, "kind: \"function\"\n");
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC6(%rip), %rdi	;, tmp105
	jmp	.L22	;
	.p2align 4,,10
	.p2align 3
.L13:
; src/output.c:392:             ast_output(0, true, "kind: \"class\"\n");
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC9(%rip), %rdi	;, tmp109
.L23:
; src/output.c:409: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fwrite@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L6:
; src/output.c:374:             ast_output(0, true, "kind: \"type\"\n");
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$13, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC3(%rip), %rdi	;, tmp102
	jmp	.L23	;
.L5:
; src/output.c:405:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	movq	%rbp, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$25, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC12(%rip), %rdi	;, tmp114
	jmp	.L23	;
	.p2align 4,,10
	.p2align 3
.L2:
; src/output.c:366:         ast_output(0, true, "Name: \"NULL\"\n");
	movq	%rbp, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	movq	%r14, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$13, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp91
	jmp	.L23	;
	.size	output_name, .-output_name
	.section	.rodata.str1.1
.LC13:
	.string	"primary\n"
.LC14:
	.string	"type: \"integer\"\n"
.LC15:
	.string	"value: %s\n"
.LC16:
	.string	"type: \"float\"\n"
.LC17:
	.string	"type: \"string\"\n"
.LC18:
	.string	"value: \"%s\"\n"
.LC19:
	.string	"type: \"boolean\"\n"
.LC20:
	.string	"value: \"true\"\n"
.LC21:
	.string	"value: \"false\"\n"
.LC22:
	.string	"type: \"expression\"\n"
.LC23:
	.string	"value\n"
.LC24:
	.string	"type: \"!\"\n"
.LC25:
	.string	"type: \"-\"\n"
.LC26:
	.string	"type: \"variable\"\n"
.LC27:
	.string	"unknown_PrimaryType: %u\n"
.LC28:
	.string	"operator: \"%s\"\n"
.LC29:
	.string	"left\n"
.LC30:
	.string	"right\n"
.LC31:
	.string	"UNKNOWN_OPERATOR"
	.text
	.p2align 4
	.type	output_expression, @function
output_expression:
	pushq	%r15	;
; src/output.c:273:     switch (primary->type) {
	leaq	.L30(%rip), %r15	;, tmp143
; src/output.c:256: void output_expression(Expression* expression, FILE* outfile, size_t indent, char indent_has_next[32]) {
	pushq	%r14	;
	pushq	%r13	;
	movq	%rdi, %r13	; tmp146, expression
	pushq	%r12	;
	movq	%rcx, %r12	; tmp149, indent_has_next
	pushq	%rbp	;
	movq	%rdx, %rbp	; tmp148, indent
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp147, outfile
	subq	$8, %rsp	;,
.L39:
; src/output.c:258:     if (expression->operator == OP_NONE) {
	movl	24(%r13), %edi	; expression_21->operator, _22
; src/output.c:258:     if (expression->operator == OP_NONE) {
	cmpl	$19, %edi	;, _22
	je	.L59	;,
.L26:
; src/output.c:262:         string op_str = operator_to_string(expression->operator);
	call	*operator_to_string@GOTPCREL(%rip)	;
; src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	%r12, %rcx	; indent_has_next,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; indent,
; src/output.c:262:         string op_str = operator_to_string(expression->operator);
	movq	%rax, %r14	; tmp150, op_str
; src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r14, %rcx	; op_str,
; src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	testq	%r14, %r14	; op_str
	je	.L60	;,
.L54:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC28(%rip), %rdx	;,
	movq	%rbx, %rdi	; outfile,
; src/output.c:265:         output_expression(expression->expr_left, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %r14	;, _108
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:264:         ast_output(0, false, "left\n");
	movq	%r12, %rcx	; indent_has_next,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC29(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:265:         output_expression(expression->expr_left, outfile, indent + 1, indent_has_next);
	movq	0(%r13), %rdi	; expression_92->expr_left, expression_92->expr_left
	movq	%r12, %rcx	; indent_has_next,
	movq	%r14, %rdx	; _108,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:266:         ast_output(0, true, "right\n");
	movq	%r12, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC30(%rip), %rdi	;,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:267:         output_expression(expression->right, outfile, indent + 1, indent_has_next);
	movq	16(%r13), %r13	; expression_92->right, expression
; src/output.c:258:     if (expression->operator == OP_NONE) {
	movl	24(%r13), %edi	;, _22
; src/output.c:258:     if (expression->operator == OP_NONE) {
	cmpl	$19, %edi	;, _22
	je	.L42	;,
	movq	%r14, %rbp	; _108, indent
	jmp	.L26	;
	.p2align 4,,10
	.p2align 3
.L60:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC31(%rip), %rcx	;,
	jmp	.L54	;
	.p2align 4,,10
	.p2align 3
.L59:
; src/output.c:258:     if (expression->operator == OP_NONE) {
	movq	%rbp, %r14	; indent, _108
.L42:
; src/output.c:259:         ast_output(0, true, "primary\n");
	movq	%r12, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	movq	%r14, %rsi	; _108,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	leaq	2(%r14), %rbp	;, indent
	movl	$8, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC13(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:260:         output_primary(expression->prim_left, outfile, indent + 1, indent_has_next);
	movq	8(%r13), %r13	; expression_99->prim_left, primary
.L27:
; src/output.c:273:     switch (primary->type) {
	cmpl	$8, 8(%r13)	;, primary_28->type
	leaq	-1(%rbp), %r14	;, indent
	ja	.L28	;,
	movl	8(%r13), %eax	; primary_28->type, primary_28->type
; src/output.c:310:             ast_output(0, false, "type: \"variable\"\n");
	movq	%r12, %rcx	; indent_has_next,
	xorl	%edx, %edx	;
	movq	%r14, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
; src/output.c:273:     switch (primary->type) {
	movslq	(%r15,%rax,4), %rax	;, tmp103
	addq	%r15, %rax	; tmp143, tmp104
	jmp	*%rax	; tmp104
	.section	.rodata
	.align 4
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
; src/output.c:305:             ast_output(0, false, "type: \"-\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC25(%rip), %rdi	;, tmp123
.L55:
	call	*fwrite@GOTPCREL(%rip)	;
	addq	$1, %rbp	;, indent
; src/output.c:306:             ast_output(0, true, "value\n");
	movq	%r12, %rcx	; indent_has_next,
	movq	%r14, %rsi	; indent,
	movl	$1, %edx	;,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC23(%rip), %rdi	;, tmp124
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:307:             output_primary(primary->value.operand, outfile, indent + 1, indent_has_next);
	movq	0(%r13), %r13	; primary_28->value.operand, primary
	jmp	.L27	;
	.p2align 4,,10
	.p2align 3
.L29:
; src/output.c:310:             ast_output(0, false, "type: \"variable\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC26(%rip), %rdi	;, tmp125
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:311:             ast_output(0, true, "value\n");
	movq	%r12, %rcx	; indent_has_next,
	movq	%r14, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC23(%rip), %rdi	;, tmp126
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:312:             output_variable_access(primary->value.var, outfile, indent + 1, indent_has_next);
	movq	0(%r13), %rdi	; primary_28->value.var, primary_28->value.var
; src/output.c:270: }
	addq	$8, %rsp	;,
; src/output.c:312:             output_variable_access(primary->value.var, outfile, indent + 1, indent_has_next);
	movq	%r12, %rcx	; indent_has_next,
	movq	%rbp, %rdx	; indent,
	movq	%rbx, %rsi	; outfile,
; src/output.c:270: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/output.c:312:             output_variable_access(primary->value.var, outfile, indent + 1, indent_has_next);
	jmp	output_variable_access	;
	.p2align 4,,10
	.p2align 3
.L38:
; src/output.c:275:             ast_output(0, false, "type: \"integer\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC14(%rip), %rdi	;, tmp106
.L56:
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:280:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	%r12, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	movq	%r14, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	0(%r13), %rcx	; primary_28->value.literal_value, primary_28->value.literal_value
	leaq	.LC15(%rip), %rdx	;, tmp111
.L57:
; src/output.c:270: }
	addq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rdi	; outfile,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/output.c:270: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L37:
; src/output.c:279:             ast_output(0, false, "type: \"float\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rdi	;, tmp109
	jmp	.L56	;
	.p2align 4,,10
	.p2align 3
.L36:
; src/output.c:283:             ast_output(0, false, "type: \"string\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC17(%rip), %rdi	;, tmp112
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:284:             ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
	movq	%r12, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	movq	%r14, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	0(%r13), %rcx	; primary_28->value.literal_value, primary_28->value.literal_value
	leaq	.LC18(%rip), %rdx	;, tmp114
	jmp	.L57	;
	.p2align 4,,10
	.p2align 3
.L35:
; src/output.c:287:             ast_output(0, false, "type: \"boolean\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC19(%rip), %rdi	;, tmp115
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:288:             ast_output(0, true, "value: \"true\"\n");
	movq	%r12, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	movq	%r14, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC20(%rip), %rdi	;, tmp116
.L58:
; src/output.c:270: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fwrite@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L34:
; src/output.c:291:             ast_output(0, false, "type: \"boolean\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC19(%rip), %rdi	;, tmp117
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:292:             ast_output(0, true, "value: \"false\"\n");
	movq	%r12, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	movq	%r14, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC21(%rip), %rdi	;, tmp118
	jmp	.L58	;
	.p2align 4,,10
	.p2align 3
.L33:
; src/output.c:295:             ast_output(0, false, "type: \"expression\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$19, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC22(%rip), %rdi	;, tmp119
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:296:             ast_output(0, true, "value\n");
	movq	%r12, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	movq	%r14, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC23(%rip), %rdi	;, tmp120
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:297:             output_expression(primary->value.expr, outfile, indent + 1, indent_has_next);
	movq	0(%r13), %r13	; primary_28->value.expr, expression
; src/output.c:298:             break;
	jmp	.L39	;
	.p2align 4,,10
	.p2align 3
.L32:
; src/output.c:300:             ast_output(0, false, "type: \"!\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC24(%rip), %rdi	;, tmp121
	jmp	.L55	;
.L28:
; src/output.c:315:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movq	%r12, %rcx	; indent_has_next,
	movq	%r14, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%r13), %ecx	; primary_28->type, primary_28->type
; src/output.c:270: }
	addq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rdi	; outfile,
	leaq	.LC27(%rip), %rdx	;, tmp129
; src/output.c:270: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
; src/output.c:270: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
; src/output.c:270: }
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.size	output_expression, .-output_expression
	.section	.rodata.str1.1
.LC32:
	.string	"name\n"
.LC33:
	.string	"value: \"NULL\"\n"
	.text
	.p2align 4
	.type	output_variable, @function
output_variable:
	pushq	%r14	;
	pushq	%r13	;
	movq	%rdi, %r13	; tmp98, variable
	pushq	%r12	;
	movq	%rdx, %r12	; tmp100, indent
; src/output.c:130:     ast_output(0, false, "type\n");
	xorl	%edx, %edx	;
; src/output.c:128: void output_variable(Variable* variable, FILE* outfile, size_t indent, char indent_has_next[32]) {
	pushq	%rbp	;
; src/output.c:131:     output_name(variable->type, outfile, indent + 1, indent_has_next);
	leaq	1(%r12), %r14	;, _1
; src/output.c:128: void output_variable(Variable* variable, FILE* outfile, size_t indent, char indent_has_next[32]) {
	movq	%rcx, %rbp	; tmp101, indent_has_next
	pushq	%rbx	;
; src/output.c:128: void output_variable(Variable* variable, FILE* outfile, size_t indent, char indent_has_next[32]) {
	movq	%rsi, %rbx	; tmp99, outfile
; src/output.c:130:     ast_output(0, false, "type\n");
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp91
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:131:     output_name(variable->type, outfile, indent + 1, indent_has_next);
	movq	0(%r13), %rdi	; variable_12(D)->type, variable_12(D)->type
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r14, %rdx	; _1,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:132:     ast_output(0, false, "name\n");
	xorl	%edx, %edx	;
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC32(%rip), %rdi	;, tmp93
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:133:     output_name(variable->name, outfile, indent + 1, indent_has_next);
	movq	8(%r13), %rdi	; variable_12(D)->name, variable_12(D)->name
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r14, %rdx	; _1,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:134:     if (variable->value != NULL) {
	cmpq	$0, 16(%r13)	;, variable_12(D)->value
; src/output.c:135:         ast_output(0, true, "value\n");
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r12, %rsi	; indent,
	movl	$1, %edx	;,
	movq	%rbx, %rdi	; outfile,
; src/output.c:134:     if (variable->value != NULL) {
	je	.L62	;,
; src/output.c:135:         ast_output(0, true, "value\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC23(%rip), %rdi	;, tmp95
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:136:         output_expression(variable->value, outfile, indent + 1, indent_has_next);
	movq	16(%r13), %rdi	; variable_12(D)->value, variable_12(D)->value
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r14, %rdx	; _1,
	movq	%rbx, %rsi	; outfile,
; src/output.c:140: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; src/output.c:136:         output_expression(variable->value, outfile, indent + 1, indent_has_next);
	jmp	output_expression	;
	.p2align 4,,10
	.p2align 3
.L62:
; src/output.c:138:         ast_output(0, true, "value: \"NULL\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
; src/output.c:140: }
	popq	%rbx	;
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$14, %edx	;,
; src/output.c:140: }
	popq	%r12	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$1, %esi	;,
; src/output.c:140: }
	popq	%r13	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC33(%rip), %rdi	;, tmp97
; src/output.c:140: }
	popq	%r14	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fwrite@GOTPCREL(%rip)	;
	.size	output_variable, .-output_variable
	.section	.rodata.str1.1
.LC34:
	.string	"type: \"name\"\n"
.LC35:
	.string	"type: \"function_call\"\n"
.LC36:
	.string	"function\n"
.LC37:
	.string	"arguments\n"
.LC38:
	.string	"arguments[%d]\n"
.LC39:
	.string	"type: \"get sequence_element\"\n"
.LC40:
	.string	"sequence\n"
.LC41:
	.string	"index\n"
.LC42:
	.string	"type: \"get_attribute\"\n"
.LC43:
	.string	"object\n"
.LC44:
	.string	"attribute_name\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC45:
	.string	"unknown_VariableAccessType: %u\n"
	.text
	.p2align 4
	.type	output_variable_access, @function
output_variable_access:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	movq	%rdi, %r13	; tmp127, variable_access
	pushq	%r12	;
	movq	%rdx, %r12	; tmp129, indent
	pushq	%rbp	;
	movq	%rcx, %rbp	; tmp130, indent_has_next
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp128, outfile
	subq	$24, %rsp	;,
; src/output.c:324:     switch (variable_access->type) {
	movl	16(%rdi), %eax	; variable_access_19(D)->type, _1
; src/output.c:324:     switch (variable_access->type) {
	cmpl	$2, %eax	;, _1
	je	.L65	;,
	ja	.L66	;,
	testl	%eax, %eax	; _1
	je	.L79	;,
; src/output.c:331:             args = list_copy(variable_access->content.args);
	movq	8(%rdi), %rdi	; variable_access_19(D)->content.args, variable_access_19(D)->content.args
; src/output.c:334:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	leaq	1(%r12), %r15	;, _5
; src/output.c:331:             args = list_copy(variable_access->content.args);
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:332:             ast_output(0, false, "type: \"function_call\"\n");
	movq	%rbp, %rcx	; indent_has_next,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; indent,
; src/output.c:331:             args = list_copy(variable_access->content.args);
	movq	%rax, 8(%rsp)	; tmp131, %sfp
; src/output.c:332:             ast_output(0, false, "type: \"function_call\"\n");
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$22, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC35(%rip), %rdi	;, tmp108
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:333:             ast_output(0, false, "function\n");
	movq	%rbp, %rcx	; indent_has_next,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC36(%rip), %rdi	;, tmp109
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:334:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	movq	0(%r13), %rdi	; variable_access_19(D)->base, variable_access_19(D)->base
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r15, %rdx	; _5,
	movq	%rbx, %rsi	; outfile,
; src/output.c:337:             index = -1;
	movl	$-1, %r13d	;, index
; src/output.c:334:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	call	output_variable_access	;
; src/output.c:335:             ast_output(0, true, "arguments\n");
	movq	%rbp, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC37(%rip), %rdi	;, tmp111
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:338:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	jmp	.L71	;
	.p2align 4,,10
	.p2align 3
.L72:
; src/output.c:339:                 ast_output(1, false, "arguments[%d]\n", ++index);
	addl	$1, %r13d	;, index
; src/output.c:339:                 ast_output(1, false, "arguments[%d]\n", ++index);
	movq	%rbp, %rcx	; indent_has_next,
	xorl	%edx, %edx	;
	movq	%r15, %rsi	; _5,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%r13d, %ecx	; index,
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; outfile,
	leaq	.LC38(%rip), %rdx	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:340:                 output_expression(arg, outfile, indent + 2, indent_has_next);
	leaq	2(%r12), %rdx	;, tmp113
	movq	%rbp, %rcx	; indent_has_next,
	movq	%rbx, %rsi	; outfile,
	movq	%r14, %rdi	; arg,
	call	output_expression	;
.L71:
; src/output.c:338:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp132, arg
; src/output.c:338:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	; arg
	jne	.L72	;,
; src/output.c:362: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L66:
; src/output.c:324:     switch (variable_access->type) {
	cmpl	$3, %eax	;, _1
	jne	.L80	;,
; src/output.c:346:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	leaq	1(%r12), %r14	;, _8
; src/output.c:344:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	xorl	%edx, %edx	;
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$29, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC39(%rip), %rdi	;, tmp114
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:345:             ast_output(0, false, "sequence\n");
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	xorl	%edx, %edx	;
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC40(%rip), %rdi	;, tmp115
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:346:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	movq	0(%r13), %rdi	; variable_access_19(D)->base, variable_access_19(D)->base
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r14, %rdx	; _8,
	movq	%rbx, %rsi	; outfile,
	call	output_variable_access	;
; src/output.c:347:             ast_output(0, true, "index\n");
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC41(%rip), %rdi	;, tmp117
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:348:             output_expression(variable_access->content.index, outfile, indent + 1, indent_has_next);
	movq	8(%r13), %rdi	; variable_access_19(D)->content.index, variable_access_19(D)->content.index
; src/output.c:362: }
	addq	$24, %rsp	;,
; src/output.c:348:             output_expression(variable_access->content.index, outfile, indent + 1, indent_has_next);
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r14, %rdx	; _8,
	movq	%rbx, %rsi	; outfile,
; src/output.c:362: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/output.c:348:             output_expression(variable_access->content.index, outfile, indent + 1, indent_has_next);
	jmp	output_expression	;
	.p2align 4,,10
	.p2align 3
.L65:
; src/output.c:351:             ast_output(0, false, "type: \"get_attribute\"\n");
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; indent,
; src/output.c:353:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	leaq	1(%r12), %r14	;, _11
; src/output.c:351:             ast_output(0, false, "type: \"get_attribute\"\n");
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$22, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC42(%rip), %rdi	;, tmp119
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:352:             ast_output(0, false, "object\n");
	movq	%rbp, %rcx	; indent_has_next,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC43(%rip), %rdi	;, tmp120
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:353:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	movq	0(%r13), %rdi	; variable_access_19(D)->base, variable_access_19(D)->base
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r14, %rdx	; _11,
	movq	%rbx, %rsi	; outfile,
	call	output_variable_access	;
; src/output.c:354:             ast_output(0, true, "attribute_name\n");
	movq	%rbp, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$15, %edx	;,
	leaq	.LC44(%rip), %rdi	;, tmp122
	movl	$1, %esi	;,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:355:             output_name(variable_access->content.attr_name, outfile, indent + 1, indent_has_next);
	movq	8(%r13), %rdi	; variable_access_19(D)->content.attr_name, variable_access_19(D)->content.attr_name
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r14, %rdx	; _11,
.L78:
; src/output.c:362: }
	addq	$24, %rsp	;,
; src/output.c:355:             output_name(variable_access->content.attr_name, outfile, indent + 1, indent_has_next);
	movq	%rbx, %rsi	; outfile,
; src/output.c:362: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/output.c:355:             output_name(variable_access->content.attr_name, outfile, indent + 1, indent_has_next);
	jmp	output_name	;
	.p2align 4,,10
	.p2align 3
.L79:
; src/output.c:326:             ast_output(0, false, "type: \"name\"\n");
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$13, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC34(%rip), %rdi	;, tmp103
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:327:             ast_output(0, true, "name\n");
	movq	%rbp, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	leaq	.LC32(%rip), %rdi	;, tmp104
	movl	$1, %esi	;,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:328:             output_name(variable_access->content.name, outfile, indent + 1, indent_has_next);
	movq	8(%r13), %rdi	; variable_access_19(D)->content.name, variable_access_19(D)->content.name
	leaq	1(%r12), %rdx	;, tmp105
	movq	%rbp, %rcx	; indent_has_next,
	jmp	.L78	;
	.p2align 4,,10
	.p2align 3
.L80:
; src/output.c:358:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	16(%r13), %ecx	; variable_access_19(D)->type, variable_access_19(D)->type
; src/output.c:362: }
	addq	$24, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rdi	; outfile,
	leaq	.LC45(%rip), %rdx	;, tmp125
; src/output.c:362: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
; src/output.c:362: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
; src/output.c:362: }
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.size	output_variable_access, .-output_variable_access
	.section	.rodata.str1.1
.LC46:
	.string	"if_statement\n"
.LC47:
	.string	"condition\n"
.LC48:
	.string	"body\n"
.LC49:
	.string	"else_if\n"
.LC50:
	.string	"else_body\n"
.LC51:
	.string	"for_statement\n"
.LC52:
	.string	"initializer\n"
.LC53:
	.string	"initializer: \"NULL\"\n"
.LC54:
	.string	"condition: \"NULL\"\n"
.LC55:
	.string	"increment\n"
.LC56:
	.string	"increment: \"NULL\"\n"
.LC57:
	.string	"while_statement\n"
	.section	.rodata.str1.8
	.align 8
.LC58:
	.string	"variable_declaration_statement\n"
	.section	.rodata.str1.1
.LC59:
	.string	"return_statement: \"NULL\"\n"
.LC60:
	.string	"return_statement\n"
.LC61:
	.string	"break_statement: \"NULL\"\n"
.LC62:
	.string	"continue_statement: \"NULL\"\n"
.LC63:
	.string	"expression_statement: \"NULL\"\n"
.LC64:
	.string	"expression_statement\n"
.LC65:
	.string	"unknown_StatementType: %u\n"
	.text
	.p2align 4
	.type	output_statement, @function
output_statement:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	movq	%rdi, %r13	; tmp195, statement
	pushq	%r12	;
	movq	%rdx, %r12	; tmp197, indent
	pushq	%rbp	;
	movq	%rcx, %rbp	; tmp198, indent_has_next
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp196, outfile
	subq	$40, %rsp	;,
; src/output.c:143:     switch (statement->type) {
	cmpl	$7, 8(%rdi)	;, statement_19(D)->type
	ja	.L82	;,
	movl	8(%rdi), %eax	; statement_19(D)->type, statement_19(D)->type
	leaq	.L84(%rip), %rdx	;, tmp137
; src/output.c:173:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
; src/output.c:143:     switch (statement->type) {
	movslq	(%rdx,%rax,4), %rax	;, tmp139
	addq	%rdx, %rax	; tmp137, tmp140
; src/output.c:173:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	xorl	%edx, %edx	;
; src/output.c:143:     switch (statement->type) {
	jmp	*%rax	; tmp140
	.section	.rodata
	.align 4
	.align 4
.L84:
	.long	.L91-.L84
	.long	.L90-.L84
	.long	.L89-.L84
	.long	.L88-.L84
	.long	.L87-.L84
	.long	.L86-.L84
	.long	.L85-.L84
	.long	.L83-.L84
	.text
	.p2align 4,,10
	.p2align 3
.L85:
; src/output.c:170:             ast_output(0, false, "break_statement: \"NULL\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$24, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC61(%rip), %rdi	;, tmp183
.L115:
; src/output.c:189: }
	addq	$40, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fwrite@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L83:
; src/output.c:173:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$27, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC62(%rip), %rdi	;, tmp184
	jmp	.L115	;
	.p2align 4,,10
	.p2align 3
.L91:
; src/output.c:176:             if (statement->stmt.expr == NULL) {
	cmpq	$0, 0(%r13)	;, statement_19(D)->stmt.expr
	je	.L117	;,
; src/output.c:181:             ast_output(0, false, "expression_statement\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$21, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC64(%rip), %rdi	;, tmp186
.L116:
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:182:             output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
	movq	0(%r13), %rdi	; statement_19(D)->stmt.expr, statement_19(D)->stmt.expr
; src/output.c:189: }
	addq	$40, %rsp	;,
; src/output.c:182:             output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
	movq	%rbp, %rcx	; indent_has_next,
	leaq	1(%r12), %rdx	;, tmp187
	movq	%rbx, %rsi	; outfile,
; src/output.c:189: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/output.c:182:             output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
	jmp	output_expression	;
	.p2align 4,,10
	.p2align 3
.L90:
; src/output.c:157:             ast_output(0, false, "variable_declaration_statement\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC58(%rip), %rdi	;, tmp176
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:158:             output_variable(statement->stmt.var, outfile, indent + 1, indent_has_next);
	movq	0(%r13), %rdi	; statement_19(D)->stmt.var, statement_19(D)->stmt.var
; src/output.c:189: }
	addq	$40, %rsp	;,
; src/output.c:158:             output_variable(statement->stmt.var, outfile, indent + 1, indent_has_next);
	movq	%rbp, %rcx	; indent_has_next,
	leaq	1(%r12), %rdx	;, tmp177
	movq	%rbx, %rsi	; outfile,
; src/output.c:189: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/output.c:158:             output_variable(statement->stmt.var, outfile, indent + 1, indent_has_next);
	jmp	output_variable	;
	.p2align 4,,10
	.p2align 3
.L89:
; src/output.c:145:             ast_output(0, false, "if_statement\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$13, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC46(%rip), %rdi	;, tmp142
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:146:             output_if(statement->stmt.if_stmt, outfile, indent + 1, indent_has_next);
	movq	0(%r13), %r14	; statement_19(D)->stmt.if_stmt, _3
	leaq	1(%r12), %rax	;, _2
; src/output.c:196:     output_expression(if_->condition, outfile, indent + 1, indent_has_next);
	leaq	2(%r12), %r13	;, _57
; src/output.c:146:             output_if(statement->stmt.if_stmt, outfile, indent + 1, indent_has_next);
	movq	%rax, 24(%rsp)	; _2, %sfp
; src/output.c:192:     list(Statement*) body = list_copy(if_->body);
	movq	8(%r14), %rdi	; _3->body, _3->body
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:193:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	movq	16(%r14), %rdi	; _3->else_if, _3->else_if
; src/output.c:192:     list(Statement*) body = list_copy(if_->body);
	movq	%rax, %r15	; tmp199, body
; src/output.c:193:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:194:     list(Statement*) else_body = list_copy(if_->else_body);
	movq	24(%r14), %rdi	; _3->else_body, _3->else_body
; src/output.c:193:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	movq	%rax, 8(%rsp)	; tmp200, %sfp
; src/output.c:194:     list(Statement*) else_body = list_copy(if_->else_body);
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:195:     ast_output(0, false, "condition\n");
	movq	%rbp, %rcx	; indent_has_next,
	xorl	%edx, %edx	;
	leaq	1(%r12), %rsi	;,
; src/output.c:194:     list(Statement*) else_body = list_copy(if_->else_body);
	movq	%rax, 16(%rsp)	; tmp201, %sfp
; src/output.c:195:     ast_output(0, false, "condition\n");
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC47(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:196:     output_expression(if_->condition, outfile, indent + 1, indent_has_next);
	movq	(%r14), %rdi	; _3->condition, _3->condition
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r13, %rdx	; _57,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:197:     ast_output(0, false, "body\n");
	movq	24(%rsp), %rsi	; %sfp,
	movq	%rbp, %rcx	; indent_has_next,
	xorl	%edx, %edx	;
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC48(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L92	;
	.p2align 4,,10
	.p2align 3
.L93:
; src/output.c:200:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%r13, %rdx	; _57,
	movq	%rbx, %rsi	; outfile,
	call	output_statement	;
.L92:
; src/output.c:199:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r15, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
; src/output.c:200:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rbp, %rcx	; indent_has_next,
; src/output.c:199:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rax, %rdi	; tmp202, statement
; src/output.c:199:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L93	;,
; src/output.c:201:     ast_output(0, false, "else_if\n");
	movq	24(%rsp), %rsi	; %sfp,
	xorl	%edx, %edx	;
	movq	%rbx, %rdi	; outfile,
; src/output.c:214:     output_expression(else_if->condition, outfile, indent + 1, indent_has_next);
	leaq	3(%r12), %r15	;, _64
; src/output.c:201:     ast_output(0, false, "else_if\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$8, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC49(%rip), %rdi	;, tmp149
	call	*fwrite@GOTPCREL(%rip)	;
.L94:
; src/output.c:203:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp205, else_if
; src/output.c:203:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	testq	%rax, %rax	; else_if
	je	.L118	;,
; src/output.c:212:     list(Statement*) body = list_copy(else_if->body);
	movq	8(%r14), %rdi	; else_if_60->body, else_if_60->body
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:213:     ast_output(0, false, "condition\n");
	xorl	%edx, %edx	;
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r13, %rsi	; _57,
; src/output.c:212:     list(Statement*) body = list_copy(else_if->body);
	movq	%rax, %r12	; tmp203, body
; src/output.c:213:     ast_output(0, false, "condition\n");
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC47(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:214:     output_expression(else_if->condition, outfile, indent + 1, indent_has_next);
	movq	(%r14), %rdi	; else_if_60->condition, else_if_60->condition
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r15, %rdx	; _64,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:215:     ast_output(0, true, "body\n");
	movq	%rbp, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	movq	%r13, %rsi	; _57,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC48(%rip), %rdi	;,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:217:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r12, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
; src/output.c:217:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L94	;,
.L96:
; src/output.c:218:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rax, %rdi	; statement,
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r15, %rdx	; _64,
	movq	%rbx, %rsi	; outfile,
	call	output_statement	;
; src/output.c:217:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r12, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
; src/output.c:217:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L96	;,
	jmp	.L94	;
	.p2align 4,,10
	.p2align 3
.L88:
; src/output.c:153:             ast_output(0, false, "while_statement\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC57(%rip), %rdi	;, tmp171
; src/output.c:154:             output_while(statement->stmt.while_stmt, outfile, indent + 1, indent_has_next);
	leaq	1(%r12), %r14	;, _6
; src/output.c:249:     output_expression(while_->condition, outfile, indent + 1, indent_has_next);
	addq	$2, %r12	;, _82
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:154:             output_while(statement->stmt.while_stmt, outfile, indent + 1, indent_has_next);
	movq	0(%r13), %r15	; statement_19(D)->stmt.while_stmt, _7
; src/output.c:247:     list(Statement*) body = list_copy(while_->body);
	movq	8(%r15), %rdi	; _7->body, _7->body
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:248:     ast_output(0, false, "condition\n");
	movq	%rbp, %rcx	; indent_has_next,
	xorl	%edx, %edx	;
	movq	%r14, %rsi	; _6,
; src/output.c:247:     list(Statement*) body = list_copy(while_->body);
	movq	%rax, %r13	; tmp209, body
; src/output.c:248:     ast_output(0, false, "condition\n");
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC47(%rip), %rdi	;, tmp173
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:249:     output_expression(while_->condition, outfile, indent + 1, indent_has_next);
	movq	(%r15), %rdi	; _7->condition, _7->condition
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r12, %rdx	; _82,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:250:     ast_output(0, true, "body\n");
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r14, %rsi	; _6,
	movq	%rbx, %rdi	; outfile,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC48(%rip), %rdi	;, tmp175
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L110	;
	.p2align 4,,10
	.p2align 3
.L111:
; src/output.c:253:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r12, %rdx	; _82,
	movq	%rbx, %rsi	; outfile,
	call	output_statement	;
.L110:
; src/output.c:252:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r13, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp210, statement
; src/output.c:252:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L111	;,
; src/output.c:189: }
	addq	$40, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L87:
; src/output.c:149:             ast_output(0, false, "for_statement\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC51(%rip), %rdi	;, tmp155
; src/output.c:150:             output_for(statement->stmt.for_stmt, outfile, indent + 1, indent_has_next);
	leaq	1(%r12), %r14	;, _4
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:150:             output_for(statement->stmt.for_stmt, outfile, indent + 1, indent_has_next);
	movq	0(%r13), %r15	; statement_19(D)->stmt.for_stmt, _5
; src/output.c:223:     list(Statement*) body = list_copy(for_->body);
	movq	24(%r15), %rdi	; _5->body, _5->body
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:225:         ast_output(0, false, "initializer\n");
	xorl	%edx, %edx	;
; src/output.c:224:     if (for_->initializer != NULL) {
	cmpq	$0, (%r15)	;, _5->initializer
; src/output.c:225:         ast_output(0, false, "initializer\n");
	movq	%rbp, %rcx	; indent_has_next,
; src/output.c:223:     list(Statement*) body = list_copy(for_->body);
	movq	%rax, %r13	; tmp207, body
; src/output.c:225:         ast_output(0, false, "initializer\n");
	movq	%r14, %rsi	; _4,
	movq	%rbx, %rdi	; outfile,
; src/output.c:224:     if (for_->initializer != NULL) {
	je	.L101	;,
; src/output.c:225:         ast_output(0, false, "initializer\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC52(%rip), %rdi	;, tmp157
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:226:         output_variable(for_->initializer, outfile, indent + 1, indent_has_next);
	movq	(%r15), %rdi	; _5->initializer, _5->initializer
	leaq	2(%r12), %rdx	;, tmp158
	movq	%rbp, %rcx	; indent_has_next,
	movq	%rbx, %rsi	; outfile,
	call	output_variable	;
.L102:
; src/output.c:230:         ast_output(0, false, "condition\n");
	xorl	%edx, %edx	;
; src/output.c:229:     if (for_->condition != NULL) {
	cmpq	$0, 8(%r15)	;, _5->condition
; src/output.c:230:         ast_output(0, false, "condition\n");
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r14, %rsi	; _4,
	movq	%rbx, %rdi	; outfile,
; src/output.c:229:     if (for_->condition != NULL) {
	je	.L103	;,
; src/output.c:230:         ast_output(0, false, "condition\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC47(%rip), %rdi	;, tmp161
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:231:         output_expression(for_->condition, outfile, indent + 1, indent_has_next);
	movq	8(%r15), %rdi	; _5->condition, _5->condition
	movq	%rbp, %rcx	; indent_has_next,
	movq	%rbx, %rsi	; outfile,
	leaq	2(%r12), %rdx	;, tmp162
	call	output_expression	;
.L104:
; src/output.c:235:         ast_output(0, false, "increment\n");
	xorl	%edx, %edx	;
; src/output.c:234:     if (for_->increment != NULL) {
	cmpq	$0, 16(%r15)	;, _5->increment
; src/output.c:235:         ast_output(0, false, "increment\n");
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r14, %rsi	; _4,
	movq	%rbx, %rdi	; outfile,
; src/output.c:234:     if (for_->increment != NULL) {
	je	.L105	;,
; src/output.c:235:         ast_output(0, false, "increment\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC55(%rip), %rdi	;, tmp165
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:236:         output_expression(for_->increment, outfile, indent + 1, indent_has_next);
	movq	16(%r15), %rdi	; _5->increment, _5->increment
	movq	%rbp, %rcx	; indent_has_next,
	movq	%rbx, %rsi	; outfile,
	leaq	2(%r12), %rdx	;, tmp166
	call	output_expression	;
.L106:
; src/output.c:239:     ast_output(0, true, "body\n");
	movq	%rbp, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	movq	%r14, %rsi	; _4,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:242:         output_statement(statement, outfile, indent + 1, indent_has_next);
	addq	$2, %r12	;, tmp194
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC48(%rip), %rdi	;, tmp169
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L107	;
	.p2align 4,,10
	.p2align 3
.L108:
; src/output.c:242:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r12, %rdx	; tmp194,
	movq	%rbx, %rsi	; outfile,
	call	output_statement	;
.L107:
; src/output.c:241:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r13, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp208, statement
; src/output.c:241:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L108	;,
; src/output.c:189: }
	addq	$40, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L86:
; src/output.c:161:             if (statement->stmt.expr == NULL) {
	cmpq	$0, 0(%r13)	;, statement_19(D)->stmt.expr
	je	.L119	;,
; src/output.c:166:             ast_output(0, false, "return_statement\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC60(%rip), %rdi	;, tmp180
	jmp	.L116	;
.L82:
; src/output.c:185:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	xorl	%edx, %edx	;
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%r13), %ecx	; statement_19(D)->type, statement_19(D)->type
; src/output.c:189: }
	addq	$40, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rdi	; outfile,
	leaq	.LC65(%rip), %rdx	;, tmp190
; src/output.c:189: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
; src/output.c:189: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
; src/output.c:189: }
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L118:
; src/output.c:205:     ast_output(0, true, "else_body\n");
	movq	24(%rsp), %rsi	; %sfp,
	movq	%rbp, %rcx	; indent_has_next,
	movq	%rbx, %rdi	; outfile,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC50(%rip), %rdi	;, tmp154
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L98	;
	.p2align 4,,10
	.p2align 3
.L99:
; src/output.c:207:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r13, %rdx	; _57,
	movq	%rbx, %rsi	; outfile,
	call	output_statement	;
.L98:
; src/output.c:206:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	movq	16(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp206, statement
; src/output.c:206:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L99	;,
; src/output.c:189: }
	addq	$40, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L101:
; src/output.c:228:         ast_output(0, false, "initializer: \"NULL\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$20, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC53(%rip), %rdi	;, tmp160
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L102	;
.L105:
; src/output.c:238:         ast_output(0, false, "increment: \"NULL\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC56(%rip), %rdi	;, tmp168
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L106	;
.L103:
; src/output.c:233:         ast_output(0, false, "condition: \"NULL\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC54(%rip), %rdi	;, tmp164
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L104	;
.L117:
; src/output.c:177:                 ast_output(0, false, "expression_statement: \"NULL\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$29, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC63(%rip), %rdi	;, tmp185
	jmp	.L115	;
.L119:
; src/output.c:162:                 ast_output(0, false, "return_statement: \"NULL\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$25, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC59(%rip), %rdi	;, tmp179
	jmp	.L115	;
	.size	output_statement, .-output_statement
	.section	.rodata.str1.1
.LC66:
	.string	"true"
.LC67:
	.string	"false"
.LC68:
	.string	"\"NULL\""
.LC69:
	.string	"%lld"
.LC70:
	.string	"%f"
.LC71:
	.string	"void"
.LC72:
	.string	"NONE"
.LC73:
	.string	"unknown_ArgType: %u"
	.text
	.p2align 4
	.type	output_arg, @function
output_arg:
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp126, outfile
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/output.c:544:     if (arg == NULL) {
	testq	%rdi, %rdi	; arg
	je	.L137	;,
; src/output.c:549:     switch (arg->kind) {
	cmpl	$8, 16(%rdi)	;, arg_15(D)->kind
	movq	%rdi, %rbx	; tmp125, arg
	ja	.L122	;,
	movl	16(%rdi), %eax	; arg_15(D)->kind, arg_15(D)->kind
	leaq	.L124(%rip), %rdx	;, tmp99
; src/output.c:558:         case ARG_NONE: tac_output(0, "NONE"); break;
	xorl	%esi, %esi	;
	movq	%rbp, %rdi	; outfile,
; src/output.c:549:     switch (arg->kind) {
	movslq	(%rdx,%rax,4), %rax	;, tmp101
	addq	%rdx, %rax	; tmp99, tmp102
	jmp	*%rax	; tmp102
	.section	.rodata
	.align 4
	.align 4
.L124:
	.long	.L125-.L124
	.long	.L131-.L124
	.long	.L130-.L124
	.long	.L129-.L124
	.long	.L128-.L124
	.long	.L127-.L124
	.long	.L125-.L124
	.long	.L125-.L124
	.long	.L123-.L124
	.text
	.p2align 4,,10
	.p2align 3
.L125:
; src/output.c:557:         case ARG_SUBROUTINE: tac_output(0, "%s", arg->value.subroutine->name); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:557:         case ARG_SUBROUTINE: tac_output(0, "%s", arg->value.subroutine->name); break;
	movq	(%rbx), %rax	;* arg, arg_15(D)->value.subroutine
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rdi	;, _10->name
.L136:
; src/output.c:562: }
	addq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rsi	; outfile,
; src/output.c:562: }
	popq	%rbx	;
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fputs@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L123:
; src/output.c:558:         case ARG_NONE: tac_output(0, "NONE"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:562: }
	addq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rcx	; outfile,
	movl	$4, %edx	;,
; src/output.c:562: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$1, %esi	;,
	leaq	.LC72(%rip), %rdi	;, tmp116
; src/output.c:562: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fwrite@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L131:
; src/output.c:551:         case ARG_INT: tac_output(0, "%lld", arg->value.int_value); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rbx), %rcx	; arg_15(D)->value.int_value, arg_15(D)->value.int_value
; src/output.c:562: }
	addq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rdi	; outfile,
; src/output.c:562: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC69(%rip), %rdx	;, tmp107
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/output.c:562: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L130:
; src/output.c:552:         case ARG_FLOAT: tac_output(0, "%f", arg->value.float_value); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movsd	(%rbx), %xmm0	; arg_15(D)->value.float_value, arg_15(D)->value.float_value
; src/output.c:562: }
	addq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rdi	; outfile,
; src/output.c:562: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movl	$1, %eax	;,
; src/output.c:562: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC70(%rip), %rdx	;, tmp109
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L129:
; src/output.c:553:         case ARG_STRING: tac_output(0, "%s", arg->value.string_value); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rbx), %rdi	; arg_15(D)->value.string_value, arg_15(D)->value.string_value
	jmp	.L136	;
	.p2align 4,,10
	.p2align 3
.L128:
; src/output.c:554:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:554:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	cmpb	$0, (%rbx)	;, arg_15(D)->value.bool_value
	leaq	.LC67(%rip), %rdi	;, tmp123
	leaq	.LC66(%rip), %rax	;, tmp124
	cmovne	%rax, %rdi	; tmp123,, tmp124, iftmp.2_13
	jmp	.L136	;
	.p2align 4,,10
	.p2align 3
.L127:
; src/output.c:555:         case ARG_VOID: tac_output(0, "void"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:562: }
	addq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rcx	; outfile,
	movl	$4, %edx	;,
; src/output.c:562: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$1, %esi	;,
	leaq	.LC71(%rip), %rdi	;, tmp111
; src/output.c:562: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fwrite@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L137:
; src/output.c:545:         tac_output(0, "\"NULL\"");
	movq	%rbp, %rdi	; outfile,
	xorl	%esi, %esi	;
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:562: }
	addq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rcx	; outfile,
	movl	$6, %edx	;,
; src/output.c:562: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$1, %esi	;,
	leaq	.LC68(%rip), %rdi	;, tmp97
; src/output.c:562: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fwrite@GOTPCREL(%rip)	;
.L122:
; src/output.c:559:         default: tac_output(0, "unknown_ArgType: %u", arg->kind); break;
	movq	%rbp, %rdi	; outfile,
	xorl	%esi, %esi	;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	16(%rbx), %ecx	; arg_15(D)->kind, arg_15(D)->kind
; src/output.c:562: }
	addq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rdi	; outfile,
; src/output.c:562: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC73(%rip), %rdx	;, tmp118
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/output.c:562: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.size	output_arg, .-output_arg
	.section	.rodata.str1.1
.LC74:
	.string	"NULL"
.LC75:
	.string	"import\n"
.LC76:
	.string	"source: \"%s\"\n"
.LC77:
	.string	"parameters\n"
.LC78:
	.string	"parameters[%d]\n"
.LC79:
	.string	"class\n"
.LC80:
	.string	"members\n"
.LC81:
	.string	"method\n"
.LC82:
	.string	"variable\n"
.LC83:
	.string	"unknown_ClassMemberType: %u\n"
.LC84:
	.string	"unknown_CodeMemberType: %u\n"
	.text
	.p2align 4
	.globl	output_code
	.type	output_code, @function
output_code:
	pushq	%r15	;
	movq	%rdx, %r15	; tmp188, indent
	pushq	%r14	;
	movq	%rcx, %r14	; tmp189, indent_has_next
	pushq	%r13	;
	movq	%rsi, %r13	; tmp187, outfile
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$56, %rsp	;,
; src/output.c:45:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rdi), %rdi	; code_5(D)->members, code_5(D)->members
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 40(%rsp)	; tmp190, %sfp
	.p2align 4,,10
	.p2align 3
.L139:
; src/output.c:47:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	movq	40(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp201, member
; src/output.c:47:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	; member
	je	.L163	;,
; src/output.c:24:     switch (code_member->type) {
	movl	8(%rbx), %eax	; member_9->type, _14
; src/output.c:48:         output_code_member(member, outfile, indent + 1, indent_has_next);
	leaq	1(%r15), %rsi	;, _2
; src/output.c:38:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movq	%r14, %rcx	; indent_has_next,
	xorl	%edx, %edx	;
	movq	%r13, %rdi	; outfile,
; src/output.c:24:     switch (code_member->type) {
	cmpl	$1, %eax	;, _14
	je	.L140	;,
	cmpl	$2, %eax	;, _14
	je	.L141	;,
	testl	%eax, %eax	; _14
	jne	.L142	;,
; src/output.c:26:             ast_output(0, false, "import\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
; src/output.c:27:             output_import(code_member->content.import, outfile, indent + 1, indent_has_next);
	leaq	2(%r15), %rbp	;, _15
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC75(%rip), %rdi	;, tmp135
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:27:             output_import(code_member->content.import, outfile, indent + 1, indent_has_next);
	movq	(%rbx), %rbx	; member_9->content.import, _16
; src/output.c:53:     ast_output(0, false, "name\n");
	movq	%r14, %rcx	; indent_has_next,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; _15,
	movq	%r13, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC32(%rip), %rdi	;, tmp136
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:54:     output_name(import->name, outfile, indent + 1, indent_has_next);
	movq	(%rbx), %rdi	; _16->name, _16->name
	leaq	3(%r15), %rdx	;, tmp137
	movq	%r14, %rcx	; indent_has_next,
	movq	%r13, %rsi	; outfile,
	call	output_name	;
; src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	%r14, %rcx	; indent_has_next,
	movq	%rbp, %rsi	; _15,
	movq	%r13, %rdi	; outfile,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	8(%rbx), %rcx	; _16->source, _24
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	%r13, %rdi	; outfile,
; src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	leaq	.LC74(%rip), %rax	;, tmp175
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC76(%rip), %rdx	;, tmp139
; src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	testq	%rcx, %rcx	; _24
	cmove	%rax, %rcx	; _24,, tmp175, _24
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:57: }
	jmp	.L139	;
	.p2align 4,,10
	.p2align 3
.L140:
; src/output.c:30:             ast_output(0, false, "function\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
; src/output.c:31:             output_function(code_member->content.function, outfile, indent + 1, indent_has_next);
	leaq	2(%r15), %r12	;, _17
; src/output.c:61:     output_name(function->name, outfile, indent + 1, indent_has_next);
	leaq	3(%r15), %rbp	;, _26
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC36(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:31:             output_function(code_member->content.function, outfile, indent + 1, indent_has_next);
	movq	(%rbx), %rbx	; member_9->content.function, _18
; src/output.c:60:     ast_output(0, false, "name\n");
	movq	%r14, %rcx	; indent_has_next,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; _17,
	movq	%r13, %rdi	; outfile,
; src/output.c:31:             output_function(code_member->content.function, outfile, indent + 1, indent_has_next);
	movq	%r12, 8(%rsp)	; _17, %sfp
; src/output.c:60:     ast_output(0, false, "name\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC32(%rip), %rdi	;, tmp141
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:61:     output_name(function->name, outfile, indent + 1, indent_has_next);
	movq	(%rbx), %rdi	; _18->name, _18->name
	movq	%r14, %rcx	; indent_has_next,
	movq	%rbp, %rdx	; _26,
	movq	%r13, %rsi	; outfile,
	call	output_name	;
; src/output.c:62:     ast_output(0, false, "return_type\n");
	movq	%r14, %rcx	; indent_has_next,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; _17,
	movq	%r13, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rdi	;, tmp143
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:63:     output_name(function->return_type, outfile, indent + 1, indent_has_next);
	movq	8(%rbx), %rdi	; _18->return_type, _18->return_type
	movq	%r14, %rcx	; indent_has_next,
	movq	%rbp, %rdx	; _26,
	movq	%r13, %rsi	; outfile,
	call	output_name	;
; src/output.c:64:     ast_output(0, false, "parameters\n");
	movq	%r14, %rcx	; indent_has_next,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; _17,
	movq	%r13, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$11, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC77(%rip), %rdi	;, tmp145
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:65:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%rbx), %rdi	; _18->parameters, _18->parameters
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:66:     list(Statement*) body = list_copy(function->body);
	movq	24(%rbx), %rdi	; _18->body, _18->body
; src/output.c:68:     int index = -1;
	movl	$-1, %ebx	;, index
; src/output.c:65:     list(Variable*) parameters = list_copy(function->parameters);
	movq	%rax, (%rsp)	; tmp191, %sfp
; src/output.c:66:     list(Statement*) body = list_copy(function->body);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 16(%rsp)	; body, %sfp
; src/output.c:69:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	jmp	.L145	;
	.p2align 4,,10
	.p2align 3
.L146:
; src/output.c:70:         ast_output(1, false, "parameters[%d]\n", ++index);
	addl	$1, %ebx	;, index
; src/output.c:70:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	%r14, %rcx	; indent_has_next,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; _26,
	movq	%r13, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebx, %ecx	; index,
	leaq	.LC78(%rip), %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	movq	%r13, %rdi	; outfile,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:71:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	leaq	4(%r15), %rdx	;, tmp149
	movq	%r14, %rcx	; indent_has_next,
	movq	%r13, %rsi	; outfile,
	movq	%r12, %rdi	; parameter,
	call	output_variable	;
.L145:
; src/output.c:69:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp193, parameter
; src/output.c:69:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	; parameter
	jne	.L146	;,
; src/output.c:73:     ast_output(0, true, "body\n");
	movq	8(%rsp), %rsi	; %sfp,
	movq	%r14, %rcx	; indent_has_next,
	movq	%r13, %rdi	; outfile,
	movq	16(%rsp), %r12	; %sfp, body
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC48(%rip), %rdi	;, tmp150
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L147	;
	.p2align 4,,10
	.p2align 3
.L148:
; src/output.c:76:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%r14, %rcx	; indent_has_next,
	movq	%rbp, %rdx	; _26,
	movq	%r13, %rsi	; outfile,
	call	output_statement	;
.L147:
; src/output.c:75:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r12, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp194, statement
; src/output.c:75:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L148	;,
	jmp	.L139	;
	.p2align 4,,10
	.p2align 3
.L142:
; src/output.c:38:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%rbx), %ecx	; member_9->type, member_9->type
	movl	$2, %esi	;,
	movq	%r13, %rdi	; outfile,
	leaq	.LC84(%rip), %rdx	;, tmp173
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L139	;
	.p2align 4,,10
	.p2align 3
.L141:
; src/output.c:34:             ast_output(0, false, "class\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
; src/output.c:35:             output_class(code_member->content.class, outfile, indent + 1, indent_has_next);
	leaq	2(%r15), %rbp	;, _19
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC79(%rip), %rdi	;, tmp151
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:35:             output_class(code_member->content.class, outfile, indent + 1, indent_has_next);
	movq	(%rbx), %rbx	; member_9->content.class, _20
; src/output.c:119:     ast_output(0, false, "name\n");
	movq	%r14, %rcx	; indent_has_next,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; _19,
	movq	%r13, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC32(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:120:     output_name(class->name, outfile, indent + 1, indent_has_next);
	leaq	3(%r15), %rax	;, _38
	movq	(%rbx), %rdi	; _20->name, _20->name
	movq	%r14, %rcx	; indent_has_next,
	movq	%rax, %rdx	; _38,
	movq	%r13, %rsi	; outfile,
	movq	%rax, 16(%rsp)	; _38, %sfp
	call	output_name	;
; src/output.c:121:     ast_output(0, true, "members\n");
	movq	%r14, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; _19,
	movq	%r13, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$8, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC80(%rip), %rdi	;, tmp154
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:122:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rbx), %rdi	; _20->members, _20->members
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp195, %sfp
	.p2align 4,,10
	.p2align 3
.L149:
; src/output.c:124:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp200, member
; src/output.c:124:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	; member
	je	.L139	;,
; src/output.c:102:     switch (class_member->type) {
	movl	8(%rbx), %eax	; member_42->type, _43
; src/output.c:102:     switch (class_member->type) {
	testl	%eax, %eax	; _43
	je	.L150	;,
	cmpl	$1, %eax	;, _43
	je	.L151	;,
; src/output.c:112:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movq	16(%rsp), %rsi	; %sfp,
	movq	%r14, %rcx	; indent_has_next,
	xorl	%edx, %edx	;
	movq	%r13, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%rbx), %ecx	; member_42->type, member_42->type
	movl	$2, %esi	;,
	movq	%r13, %rdi	; outfile,
	leaq	.LC83(%rip), %rdx	;, tmp171
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L149	;
	.p2align 4,,10
	.p2align 3
.L150:
; src/output.c:104:             ast_output(0, false, "method\n");
	movq	16(%rsp), %rsi	; %sfp,
	movq	%r14, %rcx	; indent_has_next,
	xorl	%edx, %edx	;
	movq	%r13, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
; src/output.c:82:     output_name(method->name, outfile, indent + 1, indent_has_next);
	leaq	5(%r15), %rbp	;, _49
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC81(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:105:             output_method(class_member->content.method, outfile, indent + 1, indent_has_next);
	movq	(%rbx), %rbx	; member_42->content.method, _45
	leaq	4(%r15), %rax	;, _44
; src/output.c:81:     ast_output(0, false, "name\n");
	movq	%r14, %rcx	; indent_has_next,
; src/output.c:105:             output_method(class_member->content.method, outfile, indent + 1, indent_has_next);
	movq	%rax, %r12	; _44, _44
; src/output.c:81:     ast_output(0, false, "name\n");
	movq	%rax, %rsi	; _44,
; src/output.c:105:             output_method(class_member->content.method, outfile, indent + 1, indent_has_next);
	movq	%rax, 24(%rsp)	; _44, %sfp
; src/output.c:81:     ast_output(0, false, "name\n");
	xorl	%edx, %edx	;
	movq	%r13, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC32(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:82:     output_name(method->name, outfile, indent + 1, indent_has_next);
	movq	(%rbx), %rdi	; _45->name, _45->name
	movq	%r14, %rcx	; indent_has_next,
	movq	%rbp, %rdx	; _49,
	movq	%r13, %rsi	; outfile,
	call	output_name	;
; src/output.c:83:     ast_output(0, false, "return_type\n");
	movq	%r14, %rcx	; indent_has_next,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; _44,
	movq	%r13, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:84:     output_name(method->return_type, outfile, indent + 1, indent_has_next);
	movq	8(%rbx), %rdi	; _45->return_type, _45->return_type
	movq	%r14, %rcx	; indent_has_next,
	movq	%rbp, %rdx	; _49,
	movq	%r13, %rsi	; outfile,
	call	output_name	;
; src/output.c:85:     ast_output(0, false, "parameters\n");
	movq	%r14, %rcx	; indent_has_next,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; _44,
	movq	%r13, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$11, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC77(%rip), %rdi	;, tmp161
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:86:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%rbx), %rdi	; _45->parameters, _45->parameters
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:87:     list(Statement*) body = list_copy(method->body);
	movq	24(%rbx), %rdi	; _45->body, _45->body
; src/output.c:89:     int index = -1;
	movl	$-1, %ebx	;, index
; src/output.c:86:     list(Variable*) parameters = list_copy(method->parameters);
	movq	%rax, (%rsp)	; tmp196, %sfp
; src/output.c:87:     list(Statement*) body = list_copy(method->body);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 32(%rsp)	; body, %sfp
; src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	jmp	.L153	;
	.p2align 4,,10
	.p2align 3
.L154:
; src/output.c:91:         ast_output(1, false, "parameters[%d]\n", ++index);
	addl	$1, %ebx	;, index
; src/output.c:91:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	%r14, %rcx	; indent_has_next,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; _49,
	movq	%r13, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebx, %ecx	; index,
	leaq	.LC78(%rip), %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	movq	%r13, %rdi	; outfile,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:92:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	leaq	6(%r15), %rdx	;, tmp165
	movq	%r14, %rcx	; indent_has_next,
	movq	%r13, %rsi	; outfile,
	movq	%r12, %rdi	; parameter,
	call	output_variable	;
.L153:
; src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp198, parameter
; src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	; parameter
	jne	.L154	;,
; src/output.c:94:     ast_output(0, true, "body\n");
	movq	24(%rsp), %rsi	; %sfp,
	movq	%r14, %rcx	; indent_has_next,
	movq	%r13, %rdi	; outfile,
	movq	32(%rsp), %r12	; %sfp, body
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC48(%rip), %rdi	;, tmp166
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L155	;
	.p2align 4,,10
	.p2align 3
.L156:
; src/output.c:97:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%r14, %rcx	; indent_has_next,
	movq	%rbp, %rdx	; _49,
	movq	%r13, %rsi	; outfile,
	call	output_statement	;
.L155:
; src/output.c:96:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r12, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp199, statement
; src/output.c:96:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L156	;,
	jmp	.L149	;
	.p2align 4,,10
	.p2align 3
.L151:
; src/output.c:108:             ast_output(0, false, "variable\n");
	movq	16(%rsp), %rsi	; %sfp,
	movq	%r14, %rcx	; indent_has_next,
	xorl	%edx, %edx	;
	movq	%r13, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC82(%rip), %rdi	;, tmp167
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:109:             output_variable(class_member->content.variable, outfile, indent + 1, indent_has_next);
	movq	(%rbx), %rdi	; member_42->content.variable, member_42->content.variable
	leaq	4(%r15), %rdx	;, tmp168
	movq	%r14, %rcx	; indent_has_next,
	movq	%r13, %rsi	; outfile,
	call	output_variable	;
; src/output.c:110:             break;
	jmp	.L149	;
	.p2align 4,,10
	.p2align 3
.L163:
; src/output.c:50: }
	addq	$56, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	output_code, .-output_code
	.section	.rodata.str1.1
.LC85:
	.string	"TAC: \"NULL\"\n"
.LC86:
	.string	"TAC {\n"
.LC87:
	.string	"designs: []\n"
.LC88:
	.string	"designs: [\n"
.LC89:
	.string	"NULL "
.LC90:
	.string	"%s "
.LC91:
	.string	"%zu "
.LC92:
	.string	"{}\n"
.LC93:
	.string	"{\n"
.LC94:
	.string	"NULL\t"
.LC95:
	.string	"%s\t"
.LC96:
	.string	"%zu\n"
.LC97:
	.string	"}\n"
.LC98:
	.string	"]\n"
.LC99:
	.string	"entry_point: \"NULL\"\n"
.LC100:
	.string	"entry_point: %s\n"
.LC101:
	.string	"global: []\n"
.LC102:
	.string	"global: [\n"
.LC103:
	.string	"NULL\t%s\n"
.LC104:
	.string	"%s\t%s\n"
.LC105:
	.string	"subroutines: []\n"
.LC106:
	.string	"subroutines: [\n"
.LC107:
	.string	"NULL {\n"
.LC108:
	.string	"%s {\n"
.LC109:
	.string	"return_type: \"NULL\"\n"
.LC110:
	.string	"return_type: %s\n"
.LC111:
	.string	"parameters: []\n"
.LC112:
	.string	"parameters: [\n"
.LC113:
	.string	"local: []\n"
.LC114:
	.string	"local: [\n"
.LC115:
	.string	"instructions: []\n"
.LC116:
	.string	"instructions: [\n"
.LC117:
	.string	"add\t"
.LC118:
	.string	"sub\t"
.LC119:
	.string	"mul\t"
.LC120:
	.string	"div\t"
.LC121:
	.string	"mod\t"
.LC122:
	.string	"eq \t"
.LC123:
	.string	"ne \t"
.LC124:
	.string	"lt \t"
.LC125:
	.string	"gt \t"
.LC126:
	.string	"le \t"
.LC127:
	.string	"ge \t"
.LC128:
	.string	"and\t"
.LC129:
	.string	"or \t"
.LC130:
	.string	"not\t"
.LC131:
	.string	"assign\t"
.LC132:
	.string	"get_attr\t"
.LC133:
	.string	"get_elem\t"
.LC134:
	.string	"param\t"
.LC135:
	.string	"alloc\t"
.LC136:
	.string	"jmp_c\t"
.LC137:
	.string	"jmp\t"
.LC138:
	.string	"ret\t"
.LC139:
	.string	"call\t"
.LC140:
	.string	"load\t"
.LC141:
	.string	"store\t"
.LC142:
	.string	"INST_NONE\n"
.LC143:
	.string	"unknown_InstructionType: %u\n"
	.text
	.p2align 4
	.globl	output_TAC
	.type	output_TAC, @function
output_TAC:
	pushq	%r15	;
	movq	%rsi, %r15	; tmp341, outfile
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$72, %rsp	;,
; src/output.c:420: void output_TAC(TAC* tac, FILE* outfile, size_t indent) {
	movq	%rdi, 8(%rsp)	; tac, %sfp
	movq	%rdx, 48(%rsp)	; tmp342, %sfp
; src/output.c:422:     if (tac == NULL) {
	testq	%rdi, %rdi	; tac
	je	.L253	;,
	movq	%rdx, %rbx	; tmp342, indent
; src/output.c:427:     tac_output(indent, "TAC {\n");
	movq	%rdx, %rsi	; indent,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$1, %esi	;,
	movq	%r15, %rcx	; outfile,
	movl	$6, %edx	;,
	leaq	.LC86(%rip), %rdi	;, tmp177
; src/output.c:429:         tac_output(indent + 1, "designs: []\n");
	leaq	1(%rbx), %r13	;, _266
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:428:     if (list_is_empty(tac->attribute_tables))
	movq	8(%rsp), %rax	; %sfp, tac
	movq	(%rax), %rdi	; tac_32(D)->attribute_tables, tac_32(D)->attribute_tables
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:429:         tac_output(indent + 1, "designs: []\n");
	movq	%r13, %rsi	; _266,
	movq	%r15, %rdi	; outfile,
; src/output.c:428:     if (list_is_empty(tac->attribute_tables))
	testb	%al, %al	; tmp343
	je	.L166	;,
; src/output.c:429:         tac_output(indent + 1, "designs: []\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC87(%rip), %rdi	;, tmp179
	call	*fwrite@GOTPCREL(%rip)	;
	leaq	.LC97(%rip), %rax	;, tmp312
	movq	%rax, 24(%rsp)	; tmp312, %sfp
.L167:
; src/output.c:437:     if (tac->entry_point == NULL)
	movq	8(%rsp), %rax	; %sfp, tac
; src/output.c:438:         tac_output(indent + 1, "entry_point: \"NULL\"\n");
	movq	%r13, %rsi	; _266,
	movq	%r15, %rdi	; outfile,
; src/output.c:437:     if (tac->entry_point == NULL)
	cmpq	$0, 8(%rax)	;, tac_32(D)->entry_point
	je	.L254	;,
; src/output.c:440:         tac_output(indent + 1, "entry_point: %s\n", tac->entry_point->name);
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:440:         tac_output(indent + 1, "entry_point: %s\n", tac->entry_point->name);
	movq	8(%rsp), %rax	; %sfp, tac
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	leaq	.LC100(%rip), %rdx	;, tmp207
; src/output.c:440:         tac_output(indent + 1, "entry_point: %s\n", tac->entry_point->name);
	movq	8(%rax), %rax	; tac_32(D)->entry_point, tac_32(D)->entry_point
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _10->name, _10->name
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L181:
; src/output.c:441:     if (list_is_empty(tac->global_vars))
	movq	8(%rsp), %rax	; %sfp, tac
	movq	16(%rax), %rdi	; tac_32(D)->global_vars, tac_32(D)->global_vars
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:442:         tac_output(indent + 1, "global: []\n");
	movq	%r13, %rsi	; _266,
	movq	%r15, %rdi	; outfile,
; src/output.c:441:     if (list_is_empty(tac->global_vars))
	testb	%al, %al	; tmp347
	je	.L182	;,
; src/output.c:442:         tac_output(indent + 1, "global: []\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$11, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC101(%rip), %rdi	;, tmp209
	call	*fwrite@GOTPCREL(%rip)	;
.L183:
; src/output.c:450:     if (list_is_empty(tac->subroutines))
	movq	8(%rsp), %rax	; %sfp, tac
	movq	24(%rax), %rdi	; tac_32(D)->subroutines, tac_32(D)->subroutines
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:451:         tac_output(indent + 1, "subroutines: []\n");
	movq	%r13, %rsi	; _266,
	movq	%r15, %rdi	; outfile,
; src/output.c:450:     if (list_is_empty(tac->subroutines))
	testb	%al, %al	; tmp349
	je	.L188	;,
; src/output.c:451:         tac_output(indent + 1, "subroutines: []\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC105(%rip), %rdi	;, tmp220
	call	*fwrite@GOTPCREL(%rip)	;
.L189:
; src/output.c:459:     tac_output(indent, "}\n");
	movq	48(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	24(%rsp), %rdi	; %sfp,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
.L252:
; src/output.c:461: }
	addq	$72, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fwrite@GOTPCREL(%rip)	;
.L166:
; src/output.c:431:         tac_output(indent + 1, "designs: [\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$11, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC88(%rip), %rdi	;, tmp180
	leaq	.LC90(%rip), %r12	;, tmp336
	call	*fwrite@GOTPCREL(%rip)	;
	leaq	.LC97(%rip), %rax	;, tmp312
	movq	%r13, 16(%rsp)	; _266, %sfp
	movq	48(%rsp), %r13	; %sfp, indent
	movq	%rax, 24(%rsp)	; tmp312, %sfp
	leaq	.LC95(%rip), %r14	;, tmp338
	.p2align 4,,10
	.p2align 3
.L168:
; src/output.c:433:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	movq	8(%rsp), %rax	; %sfp, tac
	movq	(%rax), %rdi	; tac_32(D)->attribute_tables, tac_32(D)->attribute_tables
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp346, attribute_table
; src/output.c:433:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	testq	%rax, %rax	; attribute_table
	je	.L255	;,
; src/output.c:434:             output_attribute_table(attribute_table, outfile, indent + 2);
	leaq	2(%r13), %rax	;, _5
; src/output.c:653:     if (attribute_table->name == NULL)
	cmpq	$0, 8(%rbp)	;, attribute_table_40->name
; src/output.c:654:         tac_output(indent, "NULL ");
	movq	%r15, %rdi	; outfile,
; src/output.c:434:             output_attribute_table(attribute_table, outfile, indent + 2);
	movq	%rax, (%rsp)	; _5, %sfp
; src/output.c:654:         tac_output(indent, "NULL ");
	movq	%rax, %rsi	; _5,
; src/output.c:653:     if (attribute_table->name == NULL)
	je	.L256	;,
; src/output.c:656:         tac_output(indent, "%s ", attribute_table->name->name);
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:656:         tac_output(indent, "%s ", attribute_table->name->name);
	movq	8(%rbp), %rax	; attribute_table_40->name, attribute_table_40->name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r12, %rdx	; tmp336,
	movq	%r15, %rdi	; outfile,
	movl	$2, %esi	;,
	movq	8(%rax), %rcx	; _77->name, _77->name
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L170:
; src/output.c:657:     tac_output(0, "%zu ", attribute_table->size);
	xorl	%esi, %esi	;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	16(%rbp), %rcx	; attribute_table_40->size, attribute_table_40->size
	xorl	%eax, %eax	;
	leaq	.LC91(%rip), %rdx	;, tmp186
	movq	%r15, %rdi	; outfile,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:658:     if (list_is_empty(attribute_table->attributes))
	movq	0(%rbp), %rdi	; attribute_table_40->attributes, attribute_table_40->attributes
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:659:         tac_output(0, "{}\n");
	xorl	%esi, %esi	;
	movq	%r15, %rdi	; outfile,
; src/output.c:658:     if (list_is_empty(attribute_table->attributes))
	testb	%al, %al	; tmp344
	je	.L171	;,
; src/output.c:659:         tac_output(0, "{}\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$3, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC92(%rip), %rdi	;, tmp188
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L168	;
	.p2align 4,,10
	.p2align 3
.L171:
; src/output.c:661:         tac_output(0, "{\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC93(%rip), %rdi	;, tmp189
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L173	;
	.p2align 4,,10
	.p2align 3
.L174:
; src/output.c:679:         tac_output(indent, "%s\t", attribute->type->name);
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:679:         tac_output(indent, "%s\t", attribute->type->name);
	movq	8(%rbx), %rax	; attribute_83->type, attribute_83->type
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rdi	; outfile,
	movq	%r14, %rdx	; tmp338,
	movl	$2, %esi	;,
	movq	8(%rax), %rcx	; _86->name, _86->name
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:681:         tac_output(0, "NULL ");
	xorl	%esi, %esi	;
; src/output.c:680:     if (attribute->var == NULL)
	cmpq	$0, (%rbx)	;, attribute_83->var
; src/output.c:681:         tac_output(0, "NULL ");
	movq	%r15, %rdi	; outfile,
; src/output.c:680:     if (attribute->var == NULL)
	je	.L257	;,
.L176:
; src/output.c:683:         tac_output(0, "%s ", attribute->var->name);
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:683:         tac_output(0, "%s ", attribute->var->name);
	movq	(%rbx), %rax	; attribute_83->var, attribute_83->var
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r12, %rdx	; tmp336,
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movq	8(%rax), %rcx	; _89->name, _89->name
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L177:
; src/output.c:684:     tac_output(0, "%zu\n", attribute->offset);
	xorl	%esi, %esi	;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	16(%rbx), %rcx	; attribute_83->offset, attribute_83->offset
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC96(%rip), %rdx	;, tmp199
	movq	%r15, %rdi	; outfile,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L173:
; src/output.c:663:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	movq	0(%rbp), %rdi	; attribute_table_40->attributes, attribute_table_40->attributes
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp345, attribute
; src/output.c:663:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	testq	%rax, %rax	; attribute
	je	.L258	;,
; src/output.c:676:     if (attribute->type == NULL)
	cmpq	$0, 8(%rbx)	;, attribute_83->type
; src/output.c:664:             output_attribute(attribute, outfile, indent + 1);
	leaq	3(%r13), %rsi	;, _82
; src/output.c:677:         tac_output(indent, "NULL\t");
	movq	%r15, %rdi	; outfile,
; src/output.c:676:     if (attribute->type == NULL)
	jne	.L174	;,
; src/output.c:677:         tac_output(indent, "NULL\t");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$1, %esi	;,
	movq	%r15, %rcx	; outfile,
	leaq	.LC94(%rip), %rdi	;,
	movl	$5, %edx	;,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:681:         tac_output(0, "NULL ");
	xorl	%esi, %esi	;
; src/output.c:680:     if (attribute->var == NULL)
	cmpq	$0, (%rbx)	;, attribute_83->var
; src/output.c:681:         tac_output(0, "NULL ");
	movq	%r15, %rdi	; outfile,
; src/output.c:680:     if (attribute->var == NULL)
	jne	.L176	;,
.L257:
; src/output.c:681:         tac_output(0, "NULL ");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC89(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L177	;
	.p2align 4,,10
	.p2align 3
.L258:
; src/output.c:665:         tac_output(indent, "}\n");
	movq	(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	24(%rsp), %rdi	; %sfp,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L168	;
	.p2align 4,,10
	.p2align 3
.L256:
; src/output.c:654:         tac_output(indent, "NULL ");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC89(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L170	;
.L255:
; src/output.c:435:         tac_output(indent + 1, "]\n");
	movq	16(%rsp), %r13	; %sfp, _266
	movq	%r15, %rdi	; outfile,
	movq	%r13, %rsi	; _266,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC98(%rip), %r8	;, tmp313
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	movq	%r8, %rdi	; tmp313,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L167	;
.L188:
; src/output.c:453:         tac_output(indent + 1, "subroutines: [\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC106(%rip), %rdi	;, tmp221
; src/output.c:570:     switch (instruction->type) {
	leaq	.L217(%rip), %r14	;, tmp326
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	*fwrite@GOTPCREL(%rip)	;
	leaq	.LC98(%rip), %r8	;, tmp313
	movq	%r13, 56(%rsp)	; _266, %sfp
	movq	48(%rsp), %r13	; %sfp, indent
	movq	%r8, 40(%rsp)	; tmp313, %sfp
	jmp	.L190	;
	.p2align 4,,10
	.p2align 3
.L262:
; src/output.c:487:         tac_output(indent + 1, "local: []\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC113(%rip), %rdi	;, tmp242
	call	*fwrite@GOTPCREL(%rip)	;
.L202:
; src/output.c:495:     if (list_is_empty(subroutine->blocks))
	movq	32(%rbx), %rdi	; subroutine_56->blocks, subroutine_56->blocks
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:496:         tac_output(indent + 1, "instructions: []\n");
	movq	(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; outfile,
; src/output.c:495:     if (list_is_empty(subroutine->blocks))
	testb	%al, %al	; tmp354
	je	.L207	;,
; src/output.c:496:         tac_output(indent + 1, "instructions: []\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC115(%rip), %rdi	;, tmp253
	call	*fwrite@GOTPCREL(%rip)	;
.L208:
; src/output.c:504:     tac_output(indent, "}\n");
	movq	32(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	24(%rsp), %rdi	; %sfp,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	call	*fwrite@GOTPCREL(%rip)	;
.L190:
; src/output.c:455:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	movq	8(%rsp), %rax	; %sfp, tac
	movq	24(%rax), %rdi	; tac_32(D)->subroutines, tac_32(D)->subroutines
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp358, subroutine
; src/output.c:455:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	testq	%rax, %rax	; subroutine
	je	.L259	;,
; src/output.c:456:             output_subroutine(subroutine, outfile, indent + 2);
	leaq	2(%r13), %rax	;, _22
; src/output.c:469:     if (subroutine->name == NULL)
	cmpq	$0, (%rbx)	;, subroutine_56->name
; src/output.c:470:         tac_output(indent, "NULL {\n");
	movq	%r15, %rdi	; outfile,
; src/output.c:456:             output_subroutine(subroutine, outfile, indent + 2);
	movq	%rax, 32(%rsp)	; _22, %sfp
; src/output.c:470:         tac_output(indent, "NULL {\n");
	movq	%rax, %rsi	; _22,
; src/output.c:469:     if (subroutine->name == NULL)
	je	.L260	;,
; src/output.c:472:         tac_output(indent, "%s {\n", subroutine->name->name);
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:472:         tac_output(indent, "%s {\n", subroutine->name->name);
	movq	(%rbx), %rax	; subroutine_56->name, subroutine_56->name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	leaq	.LC108(%rip), %rdx	;,
	movq	8(%rax), %rcx	; _98->name, _98->name
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L192:
; src/output.c:664:             output_attribute(attribute, outfile, indent + 1);
	leaq	3(%r13), %rax	;, _265
; src/output.c:473:     if (subroutine->return_type == NULL)
	cmpq	$0, 8(%rbx)	;, subroutine_56->return_type
; src/output.c:474:         tac_output(indent + 1, "return_type: \"NULL\"\n");
	movq	%r15, %rdi	; outfile,
; src/output.c:664:             output_attribute(attribute, outfile, indent + 1);
	movq	%rax, (%rsp)	; _265, %sfp
; src/output.c:474:         tac_output(indent + 1, "return_type: \"NULL\"\n");
	movq	%rax, %rsi	; _265,
; src/output.c:473:     if (subroutine->return_type == NULL)
	je	.L261	;,
; src/output.c:476:         tac_output(indent + 1, "return_type: %s\n", subroutine->return_type->name);
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:476:         tac_output(indent + 1, "return_type: %s\n", subroutine->return_type->name);
	movq	8(%rbx), %rax	; subroutine_56->return_type, subroutine_56->return_type
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	leaq	.LC110(%rip), %rdx	;, tmp229
	movq	8(%rax), %rcx	; _103->name, _103->name
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L194:
; src/output.c:477:     if (list_is_empty(subroutine->parameters))
	movq	16(%rbx), %rdi	; subroutine_56->parameters, subroutine_56->parameters
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:478:         tac_output(indent + 1, "parameters: []\n");
	movq	(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; outfile,
; src/output.c:477:     if (list_is_empty(subroutine->parameters))
	testb	%al, %al	; tmp350
	je	.L195	;,
; src/output.c:478:         tac_output(indent + 1, "parameters: []\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC111(%rip), %rdi	;, tmp231
	call	*fwrite@GOTPCREL(%rip)	;
.L196:
; src/output.c:486:     if (list_is_empty(subroutine->local_vars))
	movq	24(%rbx), %rdi	; subroutine_56->local_vars, subroutine_56->local_vars
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:487:         tac_output(indent + 1, "local: []\n");
	movq	(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; outfile,
; src/output.c:486:     if (list_is_empty(subroutine->local_vars))
	testb	%al, %al	; tmp352
	jne	.L262	;,
; src/output.c:489:         tac_output(indent + 1, "local: [\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:492:             output_var(var, outfile, indent + 2);
	leaq	4(%r13), %rbp	;, _116
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC114(%rip), %rdi	;, tmp243
	call	*fwrite@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L203:
; src/output.c:491:         while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
	movq	24(%rbx), %rdi	; subroutine_56->local_vars, subroutine_56->local_vars
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp353, var
; src/output.c:491:         while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
	testq	%rax, %rax	; var
	je	.L263	;,
; src/output.c:514:     if (var->type == NULL)
	cmpq	$0, 16(%r12)	;, var_117->type
; src/output.c:515:         tac_output(indent, "NULL\t%s\n", var->name);
	movq	%rbp, %rsi	; _116,
	movq	%r15, %rdi	; outfile,
; src/output.c:514:     if (var->type == NULL)
	je	.L264	;,
; src/output.c:517:         tac_output(indent, "%s\t%s\n", var->type->name, var->name);
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:517:         tac_output(indent, "%s\t%s\n", var->type->name, var->name);
	movq	16(%r12), %rax	; var_117->type, var_117->type
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%r12), %r8	; var_117->name,
	movq	%r15, %rdi	; outfile,
	leaq	.LC104(%rip), %rdx	;,
	movl	$2, %esi	;,
	movq	8(%rax), %rcx	; _134->name, _134->name
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L203	;
	.p2align 4,,10
	.p2align 3
.L264:
; src/output.c:515:         tac_output(indent, "NULL\t%s\n", var->name);
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%r12), %rcx	; var_117->name, var_117->name
	movq	%r15, %rdi	; outfile,
	xorl	%eax, %eax	;
	leaq	.LC103(%rip), %rdx	;,
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L203	;
	.p2align 4,,10
	.p2align 3
.L263:
; src/output.c:493:         tac_output(indent + 1, "]\n");
	movq	(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	40(%rsp), %rdi	; %sfp,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L202	;
	.p2align 4,,10
	.p2align 3
.L195:
; src/output.c:480:         tac_output(indent + 1, "parameters: [\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:483:             output_var(parameter, outfile, indent + 2);
	leaq	4(%r13), %rbp	;, _109
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC112(%rip), %rdi	;, tmp232
	call	*fwrite@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L197:
; src/output.c:482:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	movq	16(%rbx), %rdi	; subroutine_56->parameters, subroutine_56->parameters
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp351, parameter
; src/output.c:482:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	testq	%rax, %rax	; parameter
	je	.L265	;,
; src/output.c:514:     if (var->type == NULL)
	cmpq	$0, 16(%r12)	;, parameter_110->type
; src/output.c:515:         tac_output(indent, "NULL\t%s\n", var->name);
	movq	%rbp, %rsi	; _109,
	movq	%r15, %rdi	; outfile,
; src/output.c:514:     if (var->type == NULL)
	je	.L266	;,
; src/output.c:517:         tac_output(indent, "%s\t%s\n", var->type->name, var->name);
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:517:         tac_output(indent, "%s\t%s\n", var->type->name, var->name);
	movq	16(%r12), %rax	; parameter_110->type, parameter_110->type
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%r12), %r8	; parameter_110->name,
	movq	%r15, %rdi	; outfile,
	leaq	.LC104(%rip), %rdx	;,
	movl	$2, %esi	;,
	movq	8(%rax), %rcx	; _129->name, _129->name
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L197	;
	.p2align 4,,10
	.p2align 3
.L266:
; src/output.c:515:         tac_output(indent, "NULL\t%s\n", var->name);
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%r12), %rcx	; parameter_110->name, parameter_110->name
	movq	%r15, %rdi	; outfile,
	xorl	%eax, %eax	;
	leaq	.LC103(%rip), %rdx	;,
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L197	;
	.p2align 4,,10
	.p2align 3
.L265:
; src/output.c:484:         tac_output(indent + 1, "]\n");
	movq	(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	40(%rsp), %rdi	; %sfp,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L196	;
	.p2align 4,,10
	.p2align 3
.L207:
; src/output.c:498:         tac_output(indent + 1, "instructions: [\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC116(%rip), %rdi	;, tmp254
	call	*fwrite@GOTPCREL(%rip)	;
	movq	%rbx, 16(%rsp)	; subroutine, %sfp
	.p2align 4,,10
	.p2align 3
.L209:
; src/output.c:500:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	movq	16(%rsp), %rax	; %sfp, subroutine
	movq	32(%rax), %rdi	; subroutine_56->blocks, subroutine_56->blocks
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp357, block
; src/output.c:500:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	testq	%rax, %rax	; block
	je	.L267	;,
; src/output.c:501:             output_block(block, outfile, indent + 2);
	leaq	4(%r13), %r12	;, _123
; src/output.c:527:     if (block->label == NULL)
	cmpq	$0, 0(%rbp)	;, block_124->label
; src/output.c:528:         tac_output(indent, "NULL ");
	movq	%r15, %rdi	; outfile,
	movq	%r12, %rsi	; _123,
; src/output.c:527:     if (block->label == NULL)
	je	.L268	;,
; src/output.c:530:         tac_output(indent, "%s ", block->label->name);
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:530:         tac_output(indent, "%s ", block->label->name);
	movq	0(%rbp), %rax	; block_124->label, block_124->label
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	leaq	.LC90(%rip), %rdx	;,
	movq	8(%rax), %rcx	; _137->name, _137->name
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L211:
; src/output.c:531:     if (list_is_empty(block->instructions))
	movq	8(%rbp), %rdi	; block_124->instructions, block_124->instructions
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:532:         tac_output(0, "{}\n");
	xorl	%esi, %esi	;
	movq	%r15, %rdi	; outfile,
; src/output.c:531:     if (list_is_empty(block->instructions))
	testb	%al, %al	; tmp355
	je	.L212	;,
; src/output.c:532:         tac_output(0, "{}\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$3, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC92(%rip), %rdi	;, tmp260
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L209	;
	.p2align 4,,10
	.p2align 3
.L212:
; src/output.c:534:         tac_output(0, "{\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC93(%rip), %rdi	;, tmp261
	call	*fwrite@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L214:
; src/output.c:536:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	movq	8(%rbp), %rdi	; block_124->instructions, block_124->instructions
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp356, instruction
; src/output.c:536:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	testq	%rax, %rax	; instruction
	je	.L269	;,
; src/output.c:570:     switch (instruction->type) {
	cmpl	$25, 24(%rbx)	;, instruction_142->type
; src/output.c:537:             output_instruction(instruction, outfile, indent + 1);
	leaq	5(%r13), %rsi	;, _141
; src/output.c:570:     switch (instruction->type) {
	ja	.L215	;,
	movl	24(%rbx), %eax	; instruction_142->type, instruction_142->type
; src/output.c:596:         case INST_NONE: tac_output(indent, "INST_NONE\n"); return;
	movq	%r15, %rdi	; outfile,
; src/output.c:570:     switch (instruction->type) {
	movslq	(%r14,%rax,4), %rax	;, tmp265
	addq	%r14, %rax	; tmp326, tmp266
	jmp	*%rax	; tmp266
	.section	.rodata
	.align 4
	.align 4
.L217:
	.long	.L242-.L217
	.long	.L241-.L217
	.long	.L240-.L217
	.long	.L239-.L217
	.long	.L238-.L217
	.long	.L237-.L217
	.long	.L236-.L217
	.long	.L235-.L217
	.long	.L234-.L217
	.long	.L233-.L217
	.long	.L232-.L217
	.long	.L231-.L217
	.long	.L230-.L217
	.long	.L229-.L217
	.long	.L228-.L217
	.long	.L227-.L217
	.long	.L226-.L217
	.long	.L225-.L217
	.long	.L224-.L217
	.long	.L223-.L217
	.long	.L222-.L217
	.long	.L221-.L217
	.long	.L220-.L217
	.long	.L219-.L217
	.long	.L218-.L217
	.long	.L216-.L217
	.text
	.p2align 4,,10
	.p2align 3
.L218:
; src/output.c:595:         case INST_STORE: tac_output(indent, "store\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC141(%rip), %rdi	;, tmp292
	call	*fwrite@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L243:
; src/output.c:602:     output_arg(instruction->arg1, outfile);
	movq	(%rbx), %rdi	; instruction_142->arg1, instruction_142->arg1
	movq	%r15, %rsi	; outfile,
	call	output_arg	;
; src/output.c:603:     switch (instruction->type) {
	movl	24(%rbx), %ecx	; instruction_142->type, _147
; src/output.c:603:     switch (instruction->type) {
	cmpl	$24, %ecx	;, _147
	ja	.L214	;,
	movl	$1, %eax	;, tmp297
	salq	%cl, %rax	; _147, _4
	testl	$4825087, %eax	;, _4
	jne	.L245	;,
	testl	$25583616, %eax	;, _4
	jne	.L246	;,
	testl	$3145728, %eax	;, _4
	je	.L214	;,
.L247:
; src/output.c:643:     tac_output(0, "\n");
	xorl	%esi, %esi	;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rsi	; outfile,
	movl	$10, %edi	;,
	call	*fputc@GOTPCREL(%rip)	;
	jmp	.L214	;
	.p2align 4,,10
	.p2align 3
.L219:
; src/output.c:594:         case INST_LOAD: tac_output(indent, "load\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC140(%rip), %rdi	;, tmp291
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L220:
; src/output.c:593:         case INST_CALL: tac_output(indent, "call\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC139(%rip), %rdi	;, tmp290
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L221:
; src/output.c:592:         case INST_RET: tac_output(indent, "ret\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC138(%rip), %rdi	;, tmp289
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L222:
; src/output.c:591:         case INST_JMP: tac_output(indent, "jmp\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC137(%rip), %rdi	;, tmp288
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L223:
; src/output.c:590:         case INST_JMP_C: tac_output(indent, "jmp_c\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC136(%rip), %rdi	;, tmp287
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L224:
; src/output.c:589:         case INST_ALLOC: tac_output(indent, "alloc\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC135(%rip), %rdi	;, tmp286
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L225:
; src/output.c:588:         case INST_PARAM: tac_output(indent, "param\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC134(%rip), %rdi	;, tmp285
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L226:
; src/output.c:587:         case INST_GET_ELEM: tac_output(indent, "get_elem\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC133(%rip), %rdi	;, tmp284
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L227:
; src/output.c:586:         case INST_GET_ATTR: tac_output(indent, "get_attr\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC132(%rip), %rdi	;, tmp283
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L228:
; src/output.c:585:         case INST_ASSIGN: tac_output(indent, "assign\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC131(%rip), %rdi	;, tmp282
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L229:
; src/output.c:584:         case INST_NOT: tac_output(indent, "not\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC130(%rip), %rdi	;, tmp281
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L230:
; src/output.c:583:         case INST_OR: tac_output(indent, "or \t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC129(%rip), %rdi	;, tmp280
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L231:
; src/output.c:582:         case INST_AND: tac_output(indent, "and\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC128(%rip), %rdi	;, tmp279
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L232:
; src/output.c:581:         case INST_GE: tac_output(indent, "ge \t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC127(%rip), %rdi	;, tmp278
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L233:
; src/output.c:580:         case INST_LE: tac_output(indent, "le \t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC126(%rip), %rdi	;, tmp277
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L234:
; src/output.c:579:         case INST_GT: tac_output(indent, "gt \t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC125(%rip), %rdi	;, tmp276
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L235:
; src/output.c:578:         case INST_LT: tac_output(indent, "lt \t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC124(%rip), %rdi	;, tmp275
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L236:
; src/output.c:577:         case INST_NE: tac_output(indent, "ne \t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC123(%rip), %rdi	;, tmp274
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L237:
; src/output.c:576:         case INST_EQ: tac_output(indent, "eq \t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC122(%rip), %rdi	;, tmp273
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L238:
; src/output.c:575:         case INST_MOD: tac_output(indent, "mod\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC121(%rip), %rdi	;, tmp272
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L239:
; src/output.c:574:         case INST_DIV: tac_output(indent, "div\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC120(%rip), %rdi	;, tmp271
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L240:
; src/output.c:573:         case INST_MUL: tac_output(indent, "mul\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC119(%rip), %rdi	;, tmp270
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L241:
; src/output.c:572:         case INST_SUB: tac_output(indent, "sub\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC118(%rip), %rdi	;, tmp269
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L242:
; src/output.c:571:         case INST_ADD: tac_output(indent, "add\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC117(%rip), %rdi	;, tmp268
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L216:
; src/output.c:596:         case INST_NONE: tac_output(indent, "INST_NONE\n"); return;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC142(%rip), %rdi	;, tmp293
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L214	;
	.p2align 4,,10
	.p2align 3
.L246:
; src/output.c:632:             tac_output(0, " ");
	xorl	%esi, %esi	;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rsi	; outfile,
	movl	$32, %edi	;,
	call	*fputc@GOTPCREL(%rip)	;
; src/output.c:633:             output_arg(instruction->arg2, outfile);
	movq	8(%rbx), %rdi	; instruction_142->arg2, instruction_142->arg2
	movq	%r15, %rsi	; outfile,
	call	output_arg	;
; src/output.c:634:             break;
	jmp	.L247	;
	.p2align 4,,10
	.p2align 3
.L245:
; src/output.c:621:             tac_output(0, " ");
	xorl	%esi, %esi	;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rsi	; outfile,
	movl	$32, %edi	;,
	call	*fputc@GOTPCREL(%rip)	;
; src/output.c:622:             output_arg(instruction->arg2, outfile);
	movq	8(%rbx), %rdi	; instruction_142->arg2, instruction_142->arg2
	movq	%r15, %rsi	; outfile,
	call	output_arg	;
; src/output.c:623:             tac_output(0, " ");
	xorl	%esi, %esi	;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rsi	; outfile,
	movl	$32, %edi	;,
	call	*fputc@GOTPCREL(%rip)	;
; src/output.c:624:             output_arg(instruction->arg3, outfile);
	movq	16(%rbx), %rdi	; instruction_142->arg3, instruction_142->arg3
	movq	%r15, %rsi	; outfile,
	call	output_arg	;
; src/output.c:625:             break;
	jmp	.L247	;
	.p2align 4,,10
	.p2align 3
.L269:
; src/output.c:538:         tac_output(indent, "}\n");
	movq	%r12, %rsi	; _123,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	24(%rsp), %rdi	; %sfp,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L209	;
	.p2align 4,,10
	.p2align 3
.L268:
; src/output.c:528:         tac_output(indent, "NULL ");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC89(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L211	;
	.p2align 4,,10
	.p2align 3
.L267:
; src/output.c:502:         tac_output(indent + 1, "]\n");
	movq	(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	40(%rsp), %rdi	; %sfp,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L208	;
.L215:
; src/output.c:598:             tac_output(indent, "unknown_InstructionType: %u\n", instruction->type);
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	24(%rbx), %ecx	; instruction_142->type, instruction_142->type
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	leaq	.LC143(%rip), %rdx	;, tmp295
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L214	;
	.p2align 4,,10
	.p2align 3
.L260:
; src/output.c:470:         tac_output(indent, "NULL {\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC107(%rip), %rdi	;, tmp222
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L192	;
	.p2align 4,,10
	.p2align 3
.L261:
; src/output.c:474:         tac_output(indent + 1, "return_type: \"NULL\"\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$20, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC109(%rip), %rdi	;, tmp226
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L194	;
.L259:
; src/output.c:457:         tac_output(indent + 1, "]\n");
	movq	56(%rsp), %r13	; %sfp, _266
	movq	40(%rsp), %r8	; %sfp, tmp313
	movq	%r15, %rdi	; outfile,
	movq	%r13, %rsi	; _266,
	movq	%r8, (%rsp)	; tmp313, %sfp
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rdi	; %sfp,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L189	;
.L182:
; src/output.c:444:         tac_output(indent + 1, "global: [\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC102(%rip), %rdi	;, tmp210
	leaq	.LC104(%rip), %rbp	;, tmp330
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:447:             output_var(var, outfile, indent + 2);
	movq	48(%rsp), %rax	; %sfp, indent
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC103(%rip), %r12	;, tmp331
; src/output.c:447:             output_var(var, outfile, indent + 2);
	leaq	2(%rax), %rbx	;, _16
	.p2align 4,,10
	.p2align 3
.L184:
; src/output.c:446:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	movq	8(%rsp), %rax	; %sfp, tac
	movq	16(%rax), %rdi	; tac_32(D)->global_vars, tac_32(D)->global_vars
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp348, var
; src/output.c:446:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	testq	%rax, %rax	; var
	je	.L270	;,
; src/output.c:514:     if (var->type == NULL)
	cmpq	$0, 16(%r14)	;, var_49->type
; src/output.c:515:         tac_output(indent, "NULL\t%s\n", var->name);
	movq	%rbx, %rsi	; _16,
	movq	%r15, %rdi	; outfile,
; src/output.c:514:     if (var->type == NULL)
	je	.L271	;,
; src/output.c:517:         tac_output(indent, "%s\t%s\n", var->type->name, var->name);
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:517:         tac_output(indent, "%s\t%s\n", var->type->name, var->name);
	movq	16(%r14), %rdx	; var_49->type, var_49->type
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%r14), %r8	; var_49->name,
	movq	%r15, %rdi	; outfile,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	movq	8(%rdx), %rcx	; _95->name, _95->name
	movq	%rbp, %rdx	; tmp330,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L184	;
	.p2align 4,,10
	.p2align 3
.L271:
; src/output.c:515:         tac_output(indent, "NULL\t%s\n", var->name);
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%r14), %rcx	; var_49->name, var_49->name
	movq	%r12, %rdx	; tmp331,
	movq	%r15, %rdi	; outfile,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L184	;
.L270:
; src/output.c:448:         tac_output(indent + 1, "]\n");
	movq	%r13, %rsi	; _266,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC98(%rip), %r8	;, tmp313
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	movq	%r8, %rdi	; tmp313,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L183	;
.L254:
; src/output.c:438:         tac_output(indent + 1, "entry_point: \"NULL\"\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$20, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC99(%rip), %rdi	;, tmp204
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L181	;
.L253:
; src/output.c:423:         tac_output(indent, "TAC: \"NULL\"\n");
	movq	%rdx, %rsi	; tmp342,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC85(%rip), %rdi	;, tmp176
	jmp	.L252	;
	.size	output_TAC, .-output_TAC
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
