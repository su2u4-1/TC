	.file	"output.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O3 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Name pointer: \"NULL\"\n"
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
	.string	"kind: \"unknown_NameType\"\n"
	.text
	.p2align 4
	.type	output_name, @function
output_name:
.LFB81:
	.cfi_startproc
	pushq	%r15	;
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	;
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r14	; tmp118, indent
	pushq	%r13	;
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	;
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	;
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rcx, %rbp	; tmp119, parser
	pushq	%rbx	;
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx	; tmp117, outfile
	subq	$8, %rsp	;,
	.cfi_def_cfa_offset 64
; src/output.c:395:     if (name_ptr == NULL) {
	testq	%rdi, %rdi	; name
	je	.L2	;,
	movq	%rdi, %r15	; tmp116, name
	addq	$1, %r14	;, indent
; src/output.c:401:     switch (name_ptr->kind) {
	leaq	.L7(%rip), %r13	;, tmp115
.L4:
	leaq	-1(%r14), %r12	;, indent
; src/output.c:399:     OUT(0, false, "name: \"%s\"\n", (name_ptr->name));
	xorl	%edx, %edx	;
	movq	%rbp, %rcx	; parser,
	movq	%rbx, %rdi	; outfile,
	movq	%r12, %rsi	; indent,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%r15), %rcx	; name_52->name, name_52->name
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; outfile,
	leaq	.LC1(%rip), %rdx	;,
	xorl	%eax, %eax	;
	call	__fprintf_chk@PLT	;
; src/output.c:400:     OUT(0, false, "id: %zu\n", name_ptr->id);
	xorl	%edx, %edx	;
	movq	%rbp, %rcx	; parser,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%r15), %rcx	; name_52->id, name_52->id
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	leaq	.LC2(%rip), %rdx	;,
	movq	%rbx, %rdi	; outfile,
	call	__fprintf_chk@PLT	;
; src/output.c:401:     switch (name_ptr->kind) {
	cmpl	$5, 24(%r15)	;, name_52->kind
	ja	.L5	;,
	movl	24(%r15), %eax	; name_52->kind, name_52->kind
; src/output.c:424:             OUT(0, false, "kind: \"attribute\"\n");
	movq	%rbp, %rcx	; parser,
; src/output.c:401:     switch (name_ptr->kind) {
	movslq	0(%r13,%rax,4), %rax	;, tmp99
	addq	%r13, %rax	; tmp115, tmp100
	notrack jmp	*%rax	; tmp100
	.section	.rodata
	.align 4
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
; src/output.c:421:             OUT(0, true, "kind: \"class\"\n");
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC9(%rip), %rdi	;, tmp109
.L22:
; src/output.c:432: }
	addq	$8, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	fwrite@PLT	;
	.p2align 4,,10
	.p2align 3
.L9:
	.cfi_restore_state
; src/output.c:416:             OUT(0, false, "kind: \"method\"\n");
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC8(%rip), %rdi	;, tmp107
.L20:
	call	fwrite@PLT	;
; src/output.c:417:             OUT(0, true, "return_type\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rdi	;, tmp108
	call	fwrite@PLT	;
; src/output.c:418:             output_name(name_ptr->info.type, outfile, indent + 1, parser);
	movq	16(%r15), %r15	; name_52->info.type, name
.L13:
; src/output.c:395:     if (name_ptr == NULL) {
	leaq	1(%r14), %rax	;, ivtmp.26
	testq	%r15, %r15	; name
	je	.L2	;,
	movq	%rax, %r14	; ivtmp.26, indent
	jmp	.L4	;
	.p2align 4,,10
	.p2align 3
.L10:
; src/output.c:411:             OUT(0, false, "kind: \"function\"\n");
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC6(%rip), %rdi	;, tmp105
	jmp	.L20	;
	.p2align 4,,10
	.p2align 3
.L11:
; src/output.c:406:             OUT(0, false, "kind: \"variable\"\n");
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rdi	;, tmp103
.L21:
	call	fwrite@PLT	;
; src/output.c:425:             OUT(0, true, "type\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp111
	call	fwrite@PLT	;
; src/output.c:426:             output_name(name_ptr->info.type, outfile, indent + 1, parser);
	movq	16(%r15), %r15	; name_52->info.type, name
; src/output.c:427:             break;
	jmp	.L13	;
	.p2align 4,,10
	.p2align 3
.L12:
; src/output.c:403:             OUT(0, true, "kind: \"type\"\n");
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$13, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC3(%rip), %rdi	;, tmp102
	jmp	.L22	;
	.p2align 4,,10
	.p2align 3
.L6:
; src/output.c:424:             OUT(0, false, "kind: \"attribute\"\n");
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rdi	;, tmp110
	jmp	.L21	;
.L5:
; src/output.c:429:             OUT(0, true, "kind: \"unknown_NameType\"\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$25, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rdi	;, tmp112
	jmp	.L22	;
	.p2align 4,,10
	.p2align 3
.L2:
; src/output.c:396:         OUT(0, true, "Name pointer: \"NULL\"\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r14, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$21, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp91
	jmp	.L22	;
	.cfi_endproc
.LFE81:
	.size	output_name, .-output_name
	.section	.rodata.str1.1
.LC12:
	.string	"primary\n"
.LC13:
	.string	"type: \"integer\"\n"
.LC14:
	.string	"value: %s\n"
.LC15:
	.string	"type: \"float\"\n"
.LC16:
	.string	"type: \"string\"\n"
.LC17:
	.string	"value: \"%s\"\n"
.LC18:
	.string	"type: \"boolean\"\n"
.LC19:
	.string	"value: \"true\"\n"
.LC20:
	.string	"value: \"false\"\n"
.LC21:
	.string	"type: \"expression\"\n"
.LC22:
	.string	"value\n"
.LC23:
	.string	"type: \"!\"\n"
.LC24:
	.string	"type: \"-\"\n"
.LC25:
	.string	"type: \"variable\"\n"
.LC26:
	.string	"unknown_PrimaryType: %u\n"
.LC27:
	.string	"operator: \"%s\"\n"
.LC28:
	.string	"left\n"
.LC29:
	.string	"right\n"
.LC30:
	.string	"UNKNOWN_OPERATOR"
	.text
	.p2align 4
	.type	output_expression, @function
output_expression:
.LFB78:
	.cfi_startproc
	pushq	%r15	;
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
; src/output.c:299:     switch (primary_ptr->type) {
	leaq	.L29(%rip), %r15	;, tmp143
; src/output.c:277: void output_expression(Expression* expression, FILE* outfile, size_t indent, Parser* parser) {
	pushq	%r14	;
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	;
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13	; tmp146, expression
	pushq	%r12	;
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rcx, %r12	; tmp149, parser
	pushq	%rbp	;
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdx, %rbp	; tmp148, indent
	pushq	%rbx	;
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx	; tmp147, outfile
	subq	$8, %rsp	;,
	.cfi_def_cfa_offset 64
.L38:
; src/output.c:282:     if (expression_ptr->operator == OP_NONE) {
	movl	24(%r13), %edi	; expression_21->operator, _22
; src/output.c:282:     if (expression_ptr->operator == OP_NONE) {
	cmpl	$19, %edi	;, _22
	je	.L58	;,
.L25:
; src/output.c:286:         string op_str = operator_to_string(expression_ptr->operator);
	call	operator_to_string@PLT	;
; src/output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	movq	%r12, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; indent,
; src/output.c:286:         string op_str = operator_to_string(expression_ptr->operator);
	movq	%rax, %r14	; tmp150, op_str
; src/output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r14, %rcx	; op_str,
; src/output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	testq	%r14, %r14	; op_str
	je	.L59	;,
.L53:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC27(%rip), %rdx	;,
	movq	%rbx, %rdi	; outfile,
; src/output.c:289:         output_expression(expression_ptr->expr_left, outfile, indent + 1, parser);
	leaq	1(%rbp), %r14	;, _108
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	__fprintf_chk@PLT	;
; src/output.c:288:         OUT(0, false, "left\n");
	movq	%r12, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC28(%rip), %rdi	;,
	call	fwrite@PLT	;
; src/output.c:289:         output_expression(expression_ptr->expr_left, outfile, indent + 1, parser);
	movq	0(%r13), %rdi	; expression_92->expr_left, expression_92->expr_left
	movq	%r12, %rcx	; parser,
	movq	%r14, %rdx	; _108,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:290:         OUT(0, true, "right\n");
	movq	%r12, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC29(%rip), %rdi	;,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	call	fwrite@PLT	;
; src/output.c:291:         output_expression(expression_ptr->right, outfile, indent + 1, parser);
	movq	16(%r13), %r13	; expression_92->right, expression
; src/output.c:282:     if (expression_ptr->operator == OP_NONE) {
	movl	24(%r13), %edi	;, _22
; src/output.c:282:     if (expression_ptr->operator == OP_NONE) {
	cmpl	$19, %edi	;, _22
	je	.L41	;,
	movq	%r14, %rbp	; _108, indent
	jmp	.L25	;
	.p2align 4,,10
	.p2align 3
.L59:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC30(%rip), %rcx	;,
	jmp	.L53	;
	.p2align 4,,10
	.p2align 3
.L58:
; src/output.c:282:     if (expression_ptr->operator == OP_NONE) {
	movq	%rbp, %r14	; indent, _108
.L41:
; src/output.c:283:         OUT(0, true, "primary\n");
	movq	%r12, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r14, %rsi	; _108,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	leaq	2(%r14), %rbp	;, indent
	movl	$8, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC12(%rip), %rdi	;,
	call	fwrite@PLT	;
; src/output.c:284:         output_primary(expression_ptr->prim_left, outfile, indent + 1, parser);
	movq	8(%r13), %r13	; expression_99->prim_left, primary
.L26:
; src/output.c:299:     switch (primary_ptr->type) {
	cmpl	$8, 8(%r13)	;, primary_28->type
	leaq	-1(%rbp), %r14	;, indent
	ja	.L27	;,
	movl	8(%r13), %eax	; primary_28->type, primary_28->type
; src/output.c:336:             OUT(0, false, "type: \"variable\"\n");
	movq	%r12, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%r14, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
; src/output.c:299:     switch (primary_ptr->type) {
	movslq	(%r15,%rax,4), %rax	;, tmp103
	addq	%r15, %rax	; tmp143, tmp104
	notrack jmp	*%rax	; tmp104
	.section	.rodata
	.align 4
	.align 4
.L29:
	.long	.L37-.L29
	.long	.L36-.L29
	.long	.L35-.L29
	.long	.L34-.L29
	.long	.L33-.L29
	.long	.L32-.L29
	.long	.L31-.L29
	.long	.L30-.L29
	.long	.L28-.L29
	.text
	.p2align 4,,10
	.p2align 3
.L30:
; src/output.c:331:             OUT(0, false, "type: \"-\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC24(%rip), %rdi	;, tmp123
.L54:
	call	fwrite@PLT	;
; src/output.c:332:             OUT(0, true, "value\n");
	movq	%r12, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r14, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	addq	$1, %rbp	;, indent
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC22(%rip), %rdi	;, tmp124
	call	fwrite@PLT	;
; src/output.c:333:             output_primary(primary_ptr->value.operand, outfile, indent + 1, parser);
	movq	0(%r13), %r13	; primary_28->value.operand, primary
	jmp	.L26	;
	.p2align 4,,10
	.p2align 3
.L28:
; src/output.c:336:             OUT(0, false, "type: \"variable\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC25(%rip), %rdi	;, tmp125
	call	fwrite@PLT	;
; src/output.c:337:             OUT(0, true, "value\n");
	movq	%r12, %rcx	; parser,
	movq	%r14, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC22(%rip), %rdi	;, tmp126
	call	fwrite@PLT	;
; src/output.c:338:             output_variable_access(primary_ptr->value.var, outfile, indent + 1, parser);
	movq	0(%r13), %rdi	; primary_28->value.var, primary_28->value.var
; src/output.c:293: }
	addq	$8, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
; src/output.c:338:             output_variable_access(primary_ptr->value.var, outfile, indent + 1, parser);
	movq	%r12, %rcx	; parser,
	movq	%rbp, %rdx	; indent,
	movq	%rbx, %rsi	; outfile,
; src/output.c:293: }
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
; src/output.c:338:             output_variable_access(primary_ptr->value.var, outfile, indent + 1, parser);
	jmp	output_variable_access	;
	.p2align 4,,10
	.p2align 3
.L37:
	.cfi_restore_state
; src/output.c:301:             OUT(0, false, "type: \"integer\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC13(%rip), %rdi	;, tmp106
.L55:
	call	fwrite@PLT	;
; src/output.c:306:             OUT(0, true, "value: %s\n", (primary_ptr->value.literal_value));
	movq	%r12, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r14, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	0(%r13), %rcx	; primary_28->value.literal_value, primary_28->value.literal_value
	leaq	.LC14(%rip), %rdx	;, tmp111
.L56:
; src/output.c:293: }
	addq	$8, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rdi	; outfile,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/output.c:293: }
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	__fprintf_chk@PLT	;
	.p2align 4,,10
	.p2align 3
.L36:
	.cfi_restore_state
; src/output.c:305:             OUT(0, false, "type: \"float\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC15(%rip), %rdi	;, tmp109
	jmp	.L55	;
	.p2align 4,,10
	.p2align 3
.L35:
; src/output.c:309:             OUT(0, false, "type: \"string\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rdi	;, tmp112
	call	fwrite@PLT	;
; src/output.c:310:             OUT(0, true, "value: \"%s\"\n", (primary_ptr->value.literal_value));
	movq	%r12, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r14, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	0(%r13), %rcx	; primary_28->value.literal_value, primary_28->value.literal_value
	leaq	.LC17(%rip), %rdx	;, tmp114
	jmp	.L56	;
	.p2align 4,,10
	.p2align 3
.L34:
; src/output.c:313:             OUT(0, false, "type: \"boolean\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC18(%rip), %rdi	;, tmp115
	call	fwrite@PLT	;
; src/output.c:314:             OUT(0, true, "value: \"true\"\n");
	movq	%r12, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r14, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC19(%rip), %rdi	;, tmp116
.L57:
; src/output.c:293: }
	addq	$8, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	fwrite@PLT	;
	.p2align 4,,10
	.p2align 3
.L33:
	.cfi_restore_state
; src/output.c:317:             OUT(0, false, "type: \"boolean\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC18(%rip), %rdi	;, tmp117
	call	fwrite@PLT	;
; src/output.c:318:             OUT(0, true, "value: \"false\"\n");
	movq	%r12, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r14, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC20(%rip), %rdi	;, tmp118
	jmp	.L57	;
	.p2align 4,,10
	.p2align 3
.L32:
; src/output.c:321:             OUT(0, false, "type: \"expression\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$19, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC21(%rip), %rdi	;, tmp119
	call	fwrite@PLT	;
; src/output.c:322:             OUT(0, true, "value\n");
	movq	%r12, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r14, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC22(%rip), %rdi	;, tmp120
	call	fwrite@PLT	;
; src/output.c:323:             output_expression(primary_ptr->value.expr, outfile, indent + 1, parser);
	movq	0(%r13), %r13	; primary_28->value.expr, expression
; src/output.c:324:             break;
	jmp	.L38	;
	.p2align 4,,10
	.p2align 3
.L31:
; src/output.c:326:             OUT(0, false, "type: \"!\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC23(%rip), %rdi	;, tmp121
	jmp	.L54	;
.L27:
; src/output.c:341:             OUT(0, true, "unknown_PrimaryType: %u\n", primary_ptr->type);
	movq	%r12, %rcx	; parser,
	movq	%r14, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%r13), %ecx	; primary_28->type, primary_28->type
; src/output.c:293: }
	addq	$8, %rsp	;,
	.cfi_def_cfa_offset 56
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rdi	; outfile,
	leaq	.LC26(%rip), %rdx	;, tmp129
; src/output.c:293: }
	popq	%rbx	;
	.cfi_def_cfa_offset 48
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
; src/output.c:293: }
	popq	%rbp	;
	.cfi_def_cfa_offset 40
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
; src/output.c:293: }
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	__fprintf_chk@PLT	;
	.cfi_endproc
.LFE78:
	.size	output_expression, .-output_expression
	.section	.rodata.str1.1
.LC31:
	.string	"name\n"
.LC32:
	.string	"value: \"NULL\"\n"
	.text
	.p2align 4
	.type	output_variable, @function
output_variable:
.LFB72:
	.cfi_startproc
	pushq	%r14	;
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13	;
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdi, %r13	; tmp98, variable
	pushq	%r12	;
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rdx, %r12	; tmp100, indent
; src/output.c:144:     OUT(0, false, "type\n");
	xorl	%edx, %edx	;
; src/output.c:139: void output_variable(Variable* variable, FILE* outfile, size_t indent, Parser* parser) {
	pushq	%rbp	;
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rcx, %rbp	; tmp101, parser
; src/output.c:145:     output_name(variable_ptr->type, outfile, indent + 1, parser);
	leaq	1(%r12), %r14	;, _1
; src/output.c:139: void output_variable(Variable* variable, FILE* outfile, size_t indent, Parser* parser) {
	pushq	%rbx	;
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
; src/output.c:139: void output_variable(Variable* variable, FILE* outfile, size_t indent, Parser* parser) {
	movq	%rsi, %rbx	; tmp99, outfile
; src/output.c:144:     OUT(0, false, "type\n");
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp91
	call	fwrite@PLT	;
; src/output.c:145:     output_name(variable_ptr->type, outfile, indent + 1, parser);
	movq	0(%r13), %rdi	; variable_7(D)->type, variable_7(D)->type
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _1,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:146:     OUT(0, false, "name\n");
	xorl	%edx, %edx	;
	movq	%rbp, %rcx	; parser,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC31(%rip), %rdi	;, tmp93
	call	fwrite@PLT	;
; src/output.c:147:     output_name(variable_ptr->name, outfile, indent + 1, parser);
	movq	8(%r13), %rdi	; variable_7(D)->name, variable_7(D)->name
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _1,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:148:     if (variable_ptr->value != 0) {
	cmpq	$0, 16(%r13)	;, variable_7(D)->value
; src/output.c:149:         OUT(0, true, "value\n");
	movq	%rbp, %rcx	; parser,
	movq	%r12, %rsi	; indent,
	movl	$1, %edx	;,
	movq	%rbx, %rdi	; outfile,
; src/output.c:148:     if (variable_ptr->value != 0) {
	je	.L61	;,
; src/output.c:149:         OUT(0, true, "value\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC22(%rip), %rdi	;, tmp95
	call	fwrite@PLT	;
; src/output.c:150:         output_expression(variable_ptr->value, outfile, indent + 1, parser);
	movq	16(%r13), %rdi	; variable_7(D)->value, variable_7(D)->value
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _1,
	movq	%rbx, %rsi	; outfile,
; src/output.c:153: }
	popq	%rbx	;
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp	;
	.cfi_def_cfa_offset 32
	popq	%r12	;
	.cfi_def_cfa_offset 24
	popq	%r13	;
	.cfi_def_cfa_offset 16
	popq	%r14	;
	.cfi_def_cfa_offset 8
; src/output.c:150:         output_expression(variable_ptr->value, outfile, indent + 1, parser);
	jmp	output_expression	;
	.p2align 4,,10
	.p2align 3
.L61:
	.cfi_restore_state
; src/output.c:152:         OUT(0, true, "value: \"NULL\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
; src/output.c:153: }
	popq	%rbx	;
	.cfi_def_cfa_offset 40
	popq	%rbp	;
	.cfi_def_cfa_offset 32
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$14, %edx	;,
; src/output.c:153: }
	popq	%r12	;
	.cfi_def_cfa_offset 24
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$1, %esi	;,
; src/output.c:153: }
	popq	%r13	;
	.cfi_def_cfa_offset 16
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC32(%rip), %rdi	;, tmp97
; src/output.c:153: }
	popq	%r14	;
	.cfi_def_cfa_offset 8
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	fwrite@PLT	;
	.cfi_endproc
.LFE72:
	.size	output_variable, .-output_variable
	.section	.rodata.str1.1
.LC33:
	.string	"type: \"name\"\n"
.LC34:
	.string	"type: \"function_call\"\n"
.LC35:
	.string	"function\n"
.LC36:
	.string	"arguments\n"
.LC37:
	.string	"arguments[%d]\n"
.LC38:
	.string	"type: \"get sequence_element\"\n"
.LC39:
	.string	"sequence\n"
.LC40:
	.string	"index\n"
.LC41:
	.string	"type: \"get_attribute\"\n"
.LC42:
	.string	"object\n"
.LC43:
	.string	"attribute_name\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC44:
	.string	"unknown_VariableAccessType: %u\n"
	.text
	.p2align 4
	.type	output_variable_access, @function
output_variable_access:
.LFB80:
	.cfi_startproc
	pushq	%r15	;
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	;
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	;
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13	; tmp127, variable_access
	pushq	%r12	;
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12	; tmp129, indent
	pushq	%rbp	;
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rcx, %rbp	; tmp130, parser
	pushq	%rbx	;
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx	; tmp128, outfile
	subq	$24, %rsp	;,
	.cfi_def_cfa_offset 80
; src/output.c:352:     switch (var_access_ptr->type) {
	movl	16(%rdi), %eax	; variable_access_18(D)->type, _1
; src/output.c:352:     switch (var_access_ptr->type) {
	cmpl	$2, %eax	;, _1
	je	.L64	;,
	ja	.L65	;,
	testl	%eax, %eax	; _1
	je	.L78	;,
; src/output.c:359:             args = list_copy(var_access_ptr->content.args);
	movq	8(%rdi), %rdi	; variable_access_18(D)->content.args, variable_access_18(D)->content.args
; src/output.c:362:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	leaq	1(%r12), %r15	;, _5
; src/output.c:359:             args = list_copy(var_access_ptr->content.args);
	call	list_copy@PLT	;
; src/output.c:360:             OUT(0, false, "type: \"function_call\"\n");
	movq	%rbp, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
; src/output.c:359:             args = list_copy(var_access_ptr->content.args);
	movq	%rax, 8(%rsp)	; tmp131, %sfp
; src/output.c:360:             OUT(0, false, "type: \"function_call\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$22, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC34(%rip), %rdi	;, tmp108
	call	fwrite@PLT	;
; src/output.c:361:             OUT(0, false, "function\n");
	movq	%rbp, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC35(%rip), %rdi	;, tmp109
	call	fwrite@PLT	;
; src/output.c:362:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	movq	0(%r13), %rdi	; variable_access_18(D)->base, variable_access_18(D)->base
	movq	%rbp, %rcx	; parser,
	movq	%r15, %rdx	; _5,
	movq	%rbx, %rsi	; outfile,
; src/output.c:365:             index = -1;
	movl	$-1, %r13d	;, index
; src/output.c:362:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	call	output_variable_access	;
; src/output.c:363:             OUT(0, true, "arguments\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC36(%rip), %rdi	;, tmp111
	call	fwrite@PLT	;
; src/output.c:366:             while ((arg = (Expression*)list_pop(args)) != 0) {
	jmp	.L70	;
	.p2align 4,,10
	.p2align 3
.L71:
; src/output.c:367:                 OUT(1, false, "arguments[%d]\n", ++index);
	movq	%rbp, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%r15, %rsi	; _5,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; src/output.c:367:                 OUT(1, false, "arguments[%d]\n", ++index);
	addl	$1, %r13d	;, index
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	movl	%r13d, %ecx	; index,
	leaq	.LC37(%rip), %rdx	;,
	movq	%rbx, %rdi	; outfile,
	call	__fprintf_chk@PLT	;
; src/output.c:368:                 output_expression(arg, outfile, indent + 2, parser);
	leaq	2(%r12), %rdx	;, tmp113
	movq	%rbp, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	movq	%r14, %rdi	; arg,
	call	output_expression	;
.L70:
; src/output.c:366:             while ((arg = (Expression*)list_pop(args)) != 0) {
	movq	8(%rsp), %rdi	; %sfp,
	call	list_pop@PLT	;
	movq	%rax, %r14	; tmp132, arg
; src/output.c:366:             while ((arg = (Expression*)list_pop(args)) != 0) {
	testq	%rax, %rax	; arg
	jne	.L71	;,
; src/output.c:389: }
	addq	$24, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L65:
	.cfi_restore_state
; src/output.c:352:     switch (var_access_ptr->type) {
	cmpl	$3, %eax	;, _1
	jne	.L79	;,
; src/output.c:372:             OUT(0, false, "type: \"get sequence_element\"\n");
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
; src/output.c:374:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	leaq	1(%r12), %r14	;, _8
; src/output.c:372:             OUT(0, false, "type: \"get sequence_element\"\n");
	xorl	%edx, %edx	;
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$29, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC38(%rip), %rdi	;, tmp114
	call	fwrite@PLT	;
; src/output.c:373:             OUT(0, false, "sequence\n");
	movq	%rbp, %rcx	; parser,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	xorl	%edx, %edx	;
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC39(%rip), %rdi	;, tmp115
	call	fwrite@PLT	;
; src/output.c:374:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	movq	0(%r13), %rdi	; variable_access_18(D)->base, variable_access_18(D)->base
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _8,
	movq	%rbx, %rsi	; outfile,
	call	output_variable_access	;
; src/output.c:375:             OUT(0, true, "index\n");
	movq	%rbp, %rcx	; parser,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC40(%rip), %rdi	;, tmp117
	call	fwrite@PLT	;
; src/output.c:376:             output_expression(var_access_ptr->content.index, outfile, indent + 1, parser);
	movq	8(%r13), %rdi	; variable_access_18(D)->content.index, variable_access_18(D)->content.index
; src/output.c:389: }
	addq	$24, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
; src/output.c:376:             output_expression(var_access_ptr->content.index, outfile, indent + 1, parser);
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _8,
	movq	%rbx, %rsi	; outfile,
; src/output.c:389: }
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
; src/output.c:376:             output_expression(var_access_ptr->content.index, outfile, indent + 1, parser);
	jmp	output_expression	;
	.p2align 4,,10
	.p2align 3
.L64:
	.cfi_restore_state
; src/output.c:379:             OUT(0, false, "type: \"get_attribute\"\n");
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; indent,
; src/output.c:381:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	leaq	1(%r12), %r14	;, _11
; src/output.c:379:             OUT(0, false, "type: \"get_attribute\"\n");
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$22, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC41(%rip), %rdi	;, tmp119
	call	fwrite@PLT	;
; src/output.c:380:             OUT(0, false, "object\n");
	movq	%rbp, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC42(%rip), %rdi	;, tmp120
	call	fwrite@PLT	;
; src/output.c:381:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	movq	0(%r13), %rdi	; variable_access_18(D)->base, variable_access_18(D)->base
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _11,
	movq	%rbx, %rsi	; outfile,
	call	output_variable_access	;
; src/output.c:382:             OUT(0, true, "attribute_name\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$15, %edx	;,
	leaq	.LC43(%rip), %rdi	;, tmp122
	movl	$1, %esi	;,
	call	fwrite@PLT	;
; src/output.c:383:             output_name(var_access_ptr->content.attr_name, outfile, indent + 1, parser);
	movq	8(%r13), %rdi	; variable_access_18(D)->content.attr_name, variable_access_18(D)->content.attr_name
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _11,
.L77:
; src/output.c:389: }
	addq	$24, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
; src/output.c:383:             output_name(var_access_ptr->content.attr_name, outfile, indent + 1, parser);
	movq	%rbx, %rsi	; outfile,
; src/output.c:389: }
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
; src/output.c:383:             output_name(var_access_ptr->content.attr_name, outfile, indent + 1, parser);
	jmp	output_name	;
	.p2align 4,,10
	.p2align 3
.L78:
	.cfi_restore_state
; src/output.c:354:             OUT(0, false, "type: \"name\"\n");
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$13, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC33(%rip), %rdi	;, tmp103
	call	fwrite@PLT	;
; src/output.c:355:             OUT(0, true, "name\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	leaq	.LC31(%rip), %rdi	;, tmp104
	movl	$1, %esi	;,
	call	fwrite@PLT	;
; src/output.c:356:             output_name(var_access_ptr->content.name, outfile, indent + 1, parser);
	movq	8(%r13), %rdi	; variable_access_18(D)->content.name, variable_access_18(D)->content.name
	leaq	1(%r12), %rdx	;, tmp105
	movq	%rbp, %rcx	; parser,
	jmp	.L77	;
	.p2align 4,,10
	.p2align 3
.L79:
; src/output.c:386:             OUT(0, true, "unknown_VariableAccessType: %u\n", var_access_ptr->type);
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	16(%r13), %ecx	; variable_access_18(D)->type, variable_access_18(D)->type
; src/output.c:389: }
	addq	$24, %rsp	;,
	.cfi_def_cfa_offset 56
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rdi	; outfile,
	leaq	.LC44(%rip), %rdx	;, tmp125
; src/output.c:389: }
	popq	%rbx	;
	.cfi_def_cfa_offset 48
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
; src/output.c:389: }
	popq	%rbp	;
	.cfi_def_cfa_offset 40
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
; src/output.c:389: }
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	__fprintf_chk@PLT	;
	.cfi_endproc
.LFE80:
	.size	output_variable_access, .-output_variable_access
	.section	.rodata.str1.1
.LC45:
	.string	"if_statement\n"
.LC46:
	.string	"condition\n"
.LC47:
	.string	"body\n"
.LC48:
	.string	"else_if\n"
.LC49:
	.string	"else_body\n"
.LC50:
	.string	"for_statement\n"
.LC51:
	.string	"initializer\n"
.LC52:
	.string	"initializer: \"NULL\"\n"
.LC53:
	.string	"condition: \"NULL\"\n"
.LC54:
	.string	"increment\n"
.LC55:
	.string	"increment: \"NULL\"\n"
.LC56:
	.string	"while_statement\n"
	.section	.rodata.str1.8
	.align 8
.LC57:
	.string	"variable_declaration_statement\n"
	.section	.rodata.str1.1
.LC58:
	.string	"return_statement: \"NULL\"\n"
.LC59:
	.string	"return_statement\n"
.LC60:
	.string	"break_statement: \"NULL\"\n"
.LC61:
	.string	"continue_statement: \"NULL\"\n"
.LC62:
	.string	"expression_statement: \"NULL\"\n"
.LC63:
	.string	"expression_statement\n"
.LC64:
	.string	"unknown_StatementType: %u\n"
	.text
	.p2align 4
	.type	output_statement, @function
output_statement:
.LFB73:
	.cfi_startproc
	pushq	%r15	;
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	;
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	;
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13	; tmp195, statement
	pushq	%r12	;
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12	; tmp197, indent
	pushq	%rbp	;
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rcx, %rbp	; tmp198, parser
	pushq	%rbx	;
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx	; tmp196, outfile
	subq	$40, %rsp	;,
	.cfi_def_cfa_offset 96
; src/output.c:159:     switch (statement_ptr->type) {
	cmpl	$7, 8(%rdi)	;, statement_18(D)->type
	ja	.L81	;,
	movl	8(%rdi), %eax	; statement_18(D)->type, statement_18(D)->type
	leaq	.L83(%rip), %rdx	;, tmp137
; src/output.c:188:             OUT(0, false, "continue_statement: \"NULL\"\n");
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
; src/output.c:159:     switch (statement_ptr->type) {
	movslq	(%rdx,%rax,4), %rax	;, tmp139
	addq	%rdx, %rax	; tmp137, tmp140
; src/output.c:188:             OUT(0, false, "continue_statement: \"NULL\"\n");
	xorl	%edx, %edx	;
; src/output.c:159:     switch (statement_ptr->type) {
	notrack jmp	*%rax	; tmp140
	.section	.rodata
	.align 4
	.align 4
.L83:
	.long	.L90-.L83
	.long	.L89-.L83
	.long	.L88-.L83
	.long	.L87-.L83
	.long	.L86-.L83
	.long	.L85-.L83
	.long	.L84-.L83
	.long	.L82-.L83
	.text
	.p2align 4,,10
	.p2align 3
.L84:
; src/output.c:185:             OUT(0, false, "break_statement: \"NULL\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$24, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC60(%rip), %rdi	;, tmp183
.L114:
; src/output.c:202: }
	addq	$40, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	fwrite@PLT	;
	.p2align 4,,10
	.p2align 3
.L82:
	.cfi_restore_state
; src/output.c:188:             OUT(0, false, "continue_statement: \"NULL\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$27, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC61(%rip), %rdi	;, tmp184
	jmp	.L114	;
	.p2align 4,,10
	.p2align 3
.L90:
; src/output.c:191:             if (statement_ptr->stmt.expr == 0) {
	cmpq	$0, 0(%r13)	;, statement_18(D)->stmt.expr
	je	.L116	;,
; src/output.c:195:             OUT(0, false, "expression_statement\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$21, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC63(%rip), %rdi	;, tmp186
.L115:
	call	fwrite@PLT	;
; src/output.c:196:             output_expression(statement_ptr->stmt.expr, outfile, indent + 1, parser);
	movq	0(%r13), %rdi	; statement_18(D)->stmt.expr, statement_18(D)->stmt.expr
; src/output.c:202: }
	addq	$40, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
; src/output.c:196:             output_expression(statement_ptr->stmt.expr, outfile, indent + 1, parser);
	movq	%rbp, %rcx	; parser,
	leaq	1(%r12), %rdx	;, tmp187
	movq	%rbx, %rsi	; outfile,
; src/output.c:202: }
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
; src/output.c:196:             output_expression(statement_ptr->stmt.expr, outfile, indent + 1, parser);
	jmp	output_expression	;
	.p2align 4,,10
	.p2align 3
.L89:
	.cfi_restore_state
; src/output.c:173:             OUT(0, false, "variable_declaration_statement\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC57(%rip), %rdi	;, tmp176
	call	fwrite@PLT	;
; src/output.c:174:             output_variable(statement_ptr->stmt.var, outfile, indent + 1, parser);
	movq	0(%r13), %rdi	; statement_18(D)->stmt.var, statement_18(D)->stmt.var
; src/output.c:202: }
	addq	$40, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
; src/output.c:174:             output_variable(statement_ptr->stmt.var, outfile, indent + 1, parser);
	movq	%rbp, %rcx	; parser,
	leaq	1(%r12), %rdx	;, tmp177
	movq	%rbx, %rsi	; outfile,
; src/output.c:202: }
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
; src/output.c:174:             output_variable(statement_ptr->stmt.var, outfile, indent + 1, parser);
	jmp	output_variable	;
	.p2align 4,,10
	.p2align 3
.L88:
	.cfi_restore_state
; src/output.c:161:             OUT(0, false, "if_statement\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$13, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC45(%rip), %rdi	;, tmp142
	call	fwrite@PLT	;
; src/output.c:162:             output_if(statement_ptr->stmt.if_stmt, outfile, indent + 1, parser);
	movq	0(%r13), %r14	; statement_18(D)->stmt.if_stmt, _3
	leaq	1(%r12), %rax	;, _2
; src/output.c:212:     output_expression(if_ptr->condition, outfile, indent + 1, parser);
	leaq	2(%r12), %r13	;, _57
; src/output.c:162:             output_if(statement_ptr->stmt.if_stmt, outfile, indent + 1, parser);
	movq	%rax, 24(%rsp)	; _2, %sfp
; src/output.c:208:     list(Statement*) body = list_copy(if_ptr->body);
	movq	8(%r14), %rdi	; _3->body, _3->body
	call	list_copy@PLT	;
; src/output.c:209:     list(ElseIf*) else_if_list = list_copy(if_ptr->else_if);
	movq	16(%r14), %rdi	; _3->else_if, _3->else_if
; src/output.c:208:     list(Statement*) body = list_copy(if_ptr->body);
	movq	%rax, %r15	; tmp199, body
; src/output.c:209:     list(ElseIf*) else_if_list = list_copy(if_ptr->else_if);
	call	list_copy@PLT	;
; src/output.c:210:     list(Statement*) else_body = list_copy(if_ptr->else_body);
	movq	24(%r14), %rdi	; _3->else_body, _3->else_body
; src/output.c:209:     list(ElseIf*) else_if_list = list_copy(if_ptr->else_if);
	movq	%rax, 8(%rsp)	; tmp200, %sfp
; src/output.c:210:     list(Statement*) else_body = list_copy(if_ptr->else_body);
	call	list_copy@PLT	;
; src/output.c:211:     OUT(0, false, "condition\n");
	movq	%rbp, %rcx	; parser,
	xorl	%edx, %edx	;
	leaq	1(%r12), %rsi	;,
	movq	%rbx, %rdi	; outfile,
; src/output.c:210:     list(Statement*) else_body = list_copy(if_ptr->else_body);
	movq	%rax, 16(%rsp)	; tmp201, %sfp
; src/output.c:211:     OUT(0, false, "condition\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC46(%rip), %rdi	;,
	call	fwrite@PLT	;
; src/output.c:212:     output_expression(if_ptr->condition, outfile, indent + 1, parser);
	movq	(%r14), %rdi	; _3->condition, _3->condition
	movq	%rbp, %rcx	; parser,
	movq	%r13, %rdx	; _57,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:213:     OUT(0, false, "body\n");
	movq	24(%rsp), %rsi	; %sfp,
	movq	%rbp, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC47(%rip), %rdi	;,
	call	fwrite@PLT	;
	jmp	.L91	;
	.p2align 4,,10
	.p2align 3
.L92:
; src/output.c:216:         output_statement(statement, outfile, indent + 1, parser);
	movq	%r13, %rdx	; _57,
	movq	%rbx, %rsi	; outfile,
	call	output_statement	;
.L91:
; src/output.c:215:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%r15, %rdi	; body,
	call	list_pop@PLT	;
; src/output.c:216:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rbp, %rcx	; parser,
; src/output.c:215:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%rax, %rdi	; tmp202, statement
; src/output.c:215:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	; statement
	jne	.L92	;,
; src/output.c:217:     OUT(0, false, "else_if\n");
	movq	24(%rsp), %rsi	; %sfp,
	xorl	%edx, %edx	;
	movq	%rbx, %rdi	; outfile,
; src/output.c:232:     output_expression(else_if_ptr->condition, outfile, indent + 1, parser);
	leaq	3(%r12), %r15	;, _64
; src/output.c:217:     OUT(0, false, "else_if\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$8, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC48(%rip), %rdi	;, tmp149
	call	fwrite@PLT	;
.L93:
; src/output.c:219:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != 0)
	movq	8(%rsp), %rdi	; %sfp,
	call	list_pop@PLT	;
	movq	%rax, %r14	; tmp205, else_if
; src/output.c:219:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != 0)
	testq	%rax, %rax	; else_if
	je	.L117	;,
; src/output.c:230:     list(Statement*) body = list_copy(else_if_ptr->body);
	movq	8(%r14), %rdi	; else_if_60->body, else_if_60->body
	call	list_copy@PLT	;
; src/output.c:231:     OUT(0, false, "condition\n");
	xorl	%edx, %edx	;
	movq	%rbp, %rcx	; parser,
	movq	%r13, %rsi	; _57,
	movq	%rbx, %rdi	; outfile,
; src/output.c:230:     list(Statement*) body = list_copy(else_if_ptr->body);
	movq	%rax, %r12	; tmp203, body
; src/output.c:231:     OUT(0, false, "condition\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC46(%rip), %rdi	;,
	call	fwrite@PLT	;
; src/output.c:232:     output_expression(else_if_ptr->condition, outfile, indent + 1, parser);
	movq	(%r14), %rdi	; else_if_60->condition, else_if_60->condition
	movq	%rbp, %rcx	; parser,
	movq	%r15, %rdx	; _64,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:233:     OUT(0, true, "body\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r13, %rsi	; _57,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC47(%rip), %rdi	;,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	call	fwrite@PLT	;
; src/output.c:235:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%r12, %rdi	; body,
	call	list_pop@PLT	;
; src/output.c:235:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	; statement
	je	.L93	;,
.L95:
; src/output.c:236:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rax, %rdi	; statement,
	movq	%rbp, %rcx	; parser,
	movq	%r15, %rdx	; _64,
	movq	%rbx, %rsi	; outfile,
	call	output_statement	;
; src/output.c:235:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%r12, %rdi	; body,
	call	list_pop@PLT	;
; src/output.c:235:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	; statement
	jne	.L95	;,
	jmp	.L93	;
	.p2align 4,,10
	.p2align 3
.L87:
; src/output.c:169:             OUT(0, false, "while_statement\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC56(%rip), %rdi	;, tmp171
; src/output.c:170:             output_while(statement_ptr->stmt.while_stmt, outfile, indent + 1, parser);
	leaq	1(%r12), %r14	;, _6
; src/output.c:271:     output_expression(while_ptr->condition, outfile, indent + 1, parser);
	addq	$2, %r12	;, _82
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	fwrite@PLT	;
; src/output.c:170:             output_while(statement_ptr->stmt.while_stmt, outfile, indent + 1, parser);
	movq	0(%r13), %r15	; statement_18(D)->stmt.while_stmt, _7
; src/output.c:269:     list(Statement*) body = list_copy(while_ptr->body);
	movq	8(%r15), %rdi	; _7->body, _7->body
	call	list_copy@PLT	;
; src/output.c:270:     OUT(0, false, "condition\n");
	movq	%rbp, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%r14, %rsi	; _6,
	movq	%rbx, %rdi	; outfile,
; src/output.c:269:     list(Statement*) body = list_copy(while_ptr->body);
	movq	%rax, %r13	; tmp209, body
; src/output.c:270:     OUT(0, false, "condition\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC46(%rip), %rdi	;, tmp173
	call	fwrite@PLT	;
; src/output.c:271:     output_expression(while_ptr->condition, outfile, indent + 1, parser);
	movq	(%r15), %rdi	; _7->condition, _7->condition
	movq	%rbp, %rcx	; parser,
	movq	%r12, %rdx	; _82,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:272:     OUT(0, true, "body\n");
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rsi	; _6,
	movq	%rbx, %rdi	; outfile,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC47(%rip), %rdi	;, tmp175
	call	fwrite@PLT	;
	jmp	.L109	;
	.p2align 4,,10
	.p2align 3
.L110:
; src/output.c:275:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rbp, %rcx	; parser,
	movq	%r12, %rdx	; _82,
	movq	%rbx, %rsi	; outfile,
	call	output_statement	;
.L109:
; src/output.c:274:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%r13, %rdi	; body,
	call	list_pop@PLT	;
	movq	%rax, %rdi	; tmp210, statement
; src/output.c:274:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	; statement
	jne	.L110	;,
; src/output.c:202: }
	addq	$40, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L86:
	.cfi_restore_state
; src/output.c:165:             OUT(0, false, "for_statement\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC50(%rip), %rdi	;, tmp155
; src/output.c:166:             output_for(statement_ptr->stmt.for_stmt, outfile, indent + 1, parser);
	leaq	1(%r12), %r14	;, _4
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	fwrite@PLT	;
; src/output.c:166:             output_for(statement_ptr->stmt.for_stmt, outfile, indent + 1, parser);
	movq	0(%r13), %r15	; statement_18(D)->stmt.for_stmt, _5
; src/output.c:243:     list(Statement*) body = list_copy(for_ptr->body);
	movq	24(%r15), %rdi	; _5->body, _5->body
	call	list_copy@PLT	;
; src/output.c:245:         OUT(0, false, "initializer\n");
	xorl	%edx, %edx	;
; src/output.c:244:     if (for_ptr->initializer != 0) {
	cmpq	$0, (%r15)	;, _5->initializer
; src/output.c:245:         OUT(0, false, "initializer\n");
	movq	%rbp, %rcx	; parser,
; src/output.c:243:     list(Statement*) body = list_copy(for_ptr->body);
	movq	%rax, %r13	; tmp207, body
; src/output.c:245:         OUT(0, false, "initializer\n");
	movq	%r14, %rsi	; _4,
	movq	%rbx, %rdi	; outfile,
; src/output.c:244:     if (for_ptr->initializer != 0) {
	je	.L100	;,
; src/output.c:245:         OUT(0, false, "initializer\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC51(%rip), %rdi	;, tmp157
	call	fwrite@PLT	;
; src/output.c:246:         output_variable(for_ptr->initializer, outfile, indent + 1, parser);
	movq	(%r15), %rdi	; _5->initializer, _5->initializer
	leaq	2(%r12), %rdx	;, tmp158
	movq	%rbp, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_variable	;
.L101:
; src/output.c:250:         OUT(0, false, "condition\n");
	xorl	%edx, %edx	;
; src/output.c:249:     if (for_ptr->condition != 0) {
	cmpq	$0, 8(%r15)	;, _5->condition
; src/output.c:250:         OUT(0, false, "condition\n");
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rsi	; _4,
	movq	%rbx, %rdi	; outfile,
; src/output.c:249:     if (for_ptr->condition != 0) {
	je	.L102	;,
; src/output.c:250:         OUT(0, false, "condition\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC46(%rip), %rdi	;, tmp161
	call	fwrite@PLT	;
; src/output.c:251:         output_expression(for_ptr->condition, outfile, indent + 1, parser);
	movq	8(%r15), %rdi	; _5->condition, _5->condition
	movq	%rbp, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	leaq	2(%r12), %rdx	;, tmp162
	call	output_expression	;
.L103:
; src/output.c:255:         OUT(0, false, "increment\n");
	xorl	%edx, %edx	;
; src/output.c:254:     if (for_ptr->increment != 0) {
	cmpq	$0, 16(%r15)	;, _5->increment
; src/output.c:255:         OUT(0, false, "increment\n");
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rsi	; _4,
	movq	%rbx, %rdi	; outfile,
; src/output.c:254:     if (for_ptr->increment != 0) {
	je	.L104	;,
; src/output.c:255:         OUT(0, false, "increment\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC54(%rip), %rdi	;, tmp165
	call	fwrite@PLT	;
; src/output.c:256:         output_expression(for_ptr->increment, outfile, indent + 1, parser);
	movq	16(%r15), %rdi	; _5->increment, _5->increment
	movq	%rbp, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	leaq	2(%r12), %rdx	;, tmp166
	call	output_expression	;
.L105:
; src/output.c:259:     OUT(0, true, "body\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r14, %rsi	; _4,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
; src/output.c:262:         output_statement(statement, outfile, indent + 1, parser);
	addq	$2, %r12	;, tmp194
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC47(%rip), %rdi	;, tmp169
	call	fwrite@PLT	;
	jmp	.L106	;
	.p2align 4,,10
	.p2align 3
.L107:
; src/output.c:262:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rbp, %rcx	; parser,
	movq	%r12, %rdx	; tmp194,
	movq	%rbx, %rsi	; outfile,
	call	output_statement	;
.L106:
; src/output.c:261:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%r13, %rdi	; body,
	call	list_pop@PLT	;
	movq	%rax, %rdi	; tmp208, statement
; src/output.c:261:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	; statement
	jne	.L107	;,
; src/output.c:202: }
	addq	$40, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L85:
	.cfi_restore_state
; src/output.c:177:             if (statement_ptr->stmt.expr == 0) {
	cmpq	$0, 0(%r13)	;, statement_18(D)->stmt.expr
	je	.L118	;,
; src/output.c:181:             OUT(0, false, "return_statement\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC59(%rip), %rdi	;, tmp180
	jmp	.L115	;
.L81:
; src/output.c:199:             OUT(0, false, "unknown_StatementType: %u\n", statement_ptr->type);
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	xorl	%edx, %edx	;
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%r13), %ecx	; statement_18(D)->type, statement_18(D)->type
; src/output.c:202: }
	addq	$40, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rdi	; outfile,
	leaq	.LC64(%rip), %rdx	;, tmp190
; src/output.c:202: }
	popq	%rbx	;
	.cfi_def_cfa_offset 48
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
; src/output.c:202: }
	popq	%rbp	;
	.cfi_def_cfa_offset 40
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
; src/output.c:202: }
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	__fprintf_chk@PLT	;
	.p2align 4,,10
	.p2align 3
.L117:
	.cfi_restore_state
; src/output.c:221:     OUT(0, true, "else_body\n");
	movq	24(%rsp), %rsi	; %sfp,
	movq	%rbp, %rcx	; parser,
	movq	%rbx, %rdi	; outfile,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC49(%rip), %rdi	;, tmp154
	call	fwrite@PLT	;
	jmp	.L97	;
	.p2align 4,,10
	.p2align 3
.L98:
; src/output.c:223:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rbp, %rcx	; parser,
	movq	%r13, %rdx	; _57,
	movq	%rbx, %rsi	; outfile,
	call	output_statement	;
.L97:
; src/output.c:222:     while ((statement = (Statement*)list_pop(else_body)) != 0)
	movq	16(%rsp), %rdi	; %sfp,
	call	list_pop@PLT	;
	movq	%rax, %rdi	; tmp206, statement
; src/output.c:222:     while ((statement = (Statement*)list_pop(else_body)) != 0)
	testq	%rax, %rax	; statement
	jne	.L98	;,
; src/output.c:202: }
	addq	$40, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
	ret	
.L100:
	.cfi_restore_state
; src/output.c:248:         OUT(0, false, "initializer: \"NULL\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$20, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC52(%rip), %rdi	;, tmp160
	call	fwrite@PLT	;
	jmp	.L101	;
.L104:
; src/output.c:258:         OUT(0, false, "increment: \"NULL\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC55(%rip), %rdi	;, tmp168
	call	fwrite@PLT	;
	jmp	.L105	;
.L102:
; src/output.c:253:         OUT(0, false, "condition: \"NULL\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC53(%rip), %rdi	;, tmp164
	call	fwrite@PLT	;
	jmp	.L103	;
.L116:
; src/output.c:192:                 OUT(0, false, "expression_statement: \"NULL\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$29, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC62(%rip), %rdi	;, tmp185
	jmp	.L114	;
.L118:
; src/output.c:178:                 OUT(0, false, "return_statement: \"NULL\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$25, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC58(%rip), %rdi	;, tmp179
	jmp	.L114	;
	.cfi_endproc
.LFE73:
	.size	output_statement, .-output_statement
	.section	.rodata.str1.1
.LC65:
	.string	"NULL"
.LC66:
	.string	"import\n"
.LC67:
	.string	"source: \"%s\"\n"
.LC68:
	.string	"parameters\n"
.LC69:
	.string	"parameters[%d]\n"
.LC70:
	.string	"class\n"
.LC71:
	.string	"members\n"
.LC72:
	.string	"method\n"
.LC73:
	.string	"variable\n"
.LC74:
	.string	"unknown_ClassMemberType: %u\n"
.LC75:
	.string	"unknown_CodeMemberType: %u\n"
	.text
	.p2align 4
	.globl	output_code
	.type	output_code, @function
output_code:
.LFB66:
	.cfi_startproc
	endbr64	
	pushq	%r15	;
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdx, %r15	; tmp188, indent
	pushq	%r14	;
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rcx, %r14	; tmp189, parser
	pushq	%r13	;
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rsi, %r13	; tmp187, outfile
	pushq	%r12	;
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	;
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	;
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp	;,
	.cfi_def_cfa_offset 112
; src/output.c:47:     list(CodeMember*) members = list_copy((code)->members);
	movq	(%rdi), %rdi	; code_5(D)->members, code_5(D)->members
	call	list_copy@PLT	;
	movq	%rax, 40(%rsp)	; tmp190, %sfp
	.p2align 4,,10
	.p2align 3
.L120:
; src/output.c:49:     while ((member = (CodeMember*)list_pop(members)) != 0)
	movq	40(%rsp), %rdi	; %sfp,
	call	list_pop@PLT	;
	movq	%rax, %rbx	; tmp201, member
; src/output.c:49:     while ((member = (CodeMember*)list_pop(members)) != 0)
	testq	%rax, %rax	; member
	je	.L144	;,
; src/output.c:25:     switch (code_member_ptr->type) {
	movl	8(%rbx), %eax	; member_9->type, _14
; src/output.c:50:         output_code_member(member, outfile, indent + 1, parser);
	leaq	1(%r15), %rsi	;, _2
; src/output.c:39:             OUT(0, false, "unknown_CodeMemberType: %u\n", code_member_ptr->type);
	movq	%r14, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%r13, %rdi	; outfile,
; src/output.c:25:     switch (code_member_ptr->type) {
	cmpl	$1, %eax	;, _14
	je	.L121	;,
	cmpl	$2, %eax	;, _14
	je	.L122	;,
	testl	%eax, %eax	; _14
	jne	.L123	;,
; src/output.c:27:             OUT(0, false, "import\n");
	call	indention@PLT	;
; src/output.c:28:             output_import(code_member_ptr->content.import, outfile, indent + 1, parser);
	leaq	2(%r15), %rbp	;, _15
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC66(%rip), %rdi	;, tmp135
	call	fwrite@PLT	;
; src/output.c:28:             output_import(code_member_ptr->content.import, outfile, indent + 1, parser);
	movq	(%rbx), %rbx	; member_9->content.import, _16
; src/output.c:57:     OUT(0, false, "name\n");
	movq	%r14, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; _15,
	movq	%r13, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC31(%rip), %rdi	;, tmp136
	call	fwrite@PLT	;
; src/output.c:58:     output_name(import_ptr->name, outfile, indent + 1, parser);
	movq	(%rbx), %rdi	; _16->name, _16->name
	leaq	3(%r15), %rdx	;, tmp137
	movq	%r14, %rcx	; parser,
	movq	%r13, %rsi	; outfile,
	call	output_name	;
; src/output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	movq	%r14, %rcx	; parser,
	movq	%rbp, %rsi	; _15,
	movq	%r13, %rdi	; outfile,
	movl	$1, %edx	;,
	call	indention@PLT	;
; src/output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	movq	8(%rbx), %rcx	; _16->source, _24
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	%r13, %rdi	; outfile,
; src/output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	leaq	.LC65(%rip), %rax	;, tmp175
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC67(%rip), %rdx	;, tmp139
; src/output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	testq	%rcx, %rcx	; _24
	cmove	%rax, %rcx	; _24,, tmp175, _24
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	call	__fprintf_chk@PLT	;
; src/output.c:60: }
	jmp	.L120	;
	.p2align 4,,10
	.p2align 3
.L121:
; src/output.c:31:             OUT(0, false, "function\n");
	call	indention@PLT	;
; src/output.c:32:             output_function(code_member_ptr->content.function, outfile, indent + 1, parser);
	leaq	2(%r15), %r12	;, _17
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
; src/output.c:67:     output_name(function_ptr->name, outfile, indent + 1, parser);
	leaq	3(%r15), %rbp	;, _26
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC35(%rip), %rdi	;,
	call	fwrite@PLT	;
; src/output.c:32:             output_function(code_member_ptr->content.function, outfile, indent + 1, parser);
	movq	(%rbx), %rbx	; member_9->content.function, _18
; src/output.c:66:     OUT(0, false, "name\n");
	movq	%r14, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; _17,
	movq	%r13, %rdi	; outfile,
; src/output.c:32:             output_function(code_member_ptr->content.function, outfile, indent + 1, parser);
	movq	%r12, 8(%rsp)	; _17, %sfp
; src/output.c:66:     OUT(0, false, "name\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC31(%rip), %rdi	;, tmp141
	call	fwrite@PLT	;
; src/output.c:67:     output_name(function_ptr->name, outfile, indent + 1, parser);
	movq	(%rbx), %rdi	; _18->name, _18->name
	movq	%r14, %rcx	; parser,
	movq	%rbp, %rdx	; _26,
	movq	%r13, %rsi	; outfile,
	call	output_name	;
; src/output.c:68:     OUT(0, false, "return_type\n");
	movq	%r14, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; _17,
	movq	%r13, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rdi	;, tmp143
	call	fwrite@PLT	;
; src/output.c:69:     output_name(function_ptr->return_type, outfile, indent + 1, parser);
	movq	8(%rbx), %rdi	; _18->return_type, _18->return_type
	movq	%r14, %rcx	; parser,
	movq	%rbp, %rdx	; _26,
	movq	%r13, %rsi	; outfile,
	call	output_name	;
; src/output.c:70:     OUT(0, false, "parameters\n");
	movq	%r14, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; _17,
	movq	%r13, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$11, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC68(%rip), %rdi	;, tmp145
	call	fwrite@PLT	;
; src/output.c:71:     list(Variable*) parameters = list_copy(function_ptr->parameters);
	movq	16(%rbx), %rdi	; _18->parameters, _18->parameters
	call	list_copy@PLT	;
; src/output.c:72:     list(Statement*) body = list_copy(function_ptr->body);
	movq	24(%rbx), %rdi	; _18->body, _18->body
; src/output.c:74:     int index = -1;
	movl	$-1, %ebx	;, index
; src/output.c:71:     list(Variable*) parameters = list_copy(function_ptr->parameters);
	movq	%rax, (%rsp)	; tmp191, %sfp
; src/output.c:72:     list(Statement*) body = list_copy(function_ptr->body);
	call	list_copy@PLT	;
	movq	%rax, 16(%rsp)	; body, %sfp
; src/output.c:75:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	jmp	.L126	;
	.p2align 4,,10
	.p2align 3
.L127:
; src/output.c:76:         OUT(1, false, "parameters[%d]\n", ++index);
	movq	%r14, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; _26,
	movq	%r13, %rdi	; outfile,
	call	indention@PLT	;
; src/output.c:76:         OUT(1, false, "parameters[%d]\n", ++index);
	addl	$1, %ebx	;, index
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	%r13, %rdi	; outfile,
	movl	%ebx, %ecx	; index,
	leaq	.LC69(%rip), %rdx	;,
	xorl	%eax, %eax	;
	call	__fprintf_chk@PLT	;
; src/output.c:77:         output_variable(parameter, outfile, indent + 2, parser);
	leaq	4(%r15), %rdx	;, tmp149
	movq	%r14, %rcx	; parser,
	movq	%r13, %rsi	; outfile,
	movq	%r12, %rdi	; parameter,
	call	output_variable	;
.L126:
; src/output.c:75:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	movq	(%rsp), %rdi	; %sfp,
	call	list_pop@PLT	;
	movq	%rax, %r12	; tmp193, parameter
; src/output.c:75:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	testq	%rax, %rax	; parameter
	jne	.L127	;,
; src/output.c:79:     OUT(0, true, "body\n");
	movq	8(%rsp), %rsi	; %sfp,
	movq	%r14, %rcx	; parser,
	movq	%r13, %rdi	; outfile,
	movl	$1, %edx	;,
	movq	16(%rsp), %r12	; %sfp, body
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC47(%rip), %rdi	;, tmp150
	call	fwrite@PLT	;
	jmp	.L128	;
	.p2align 4,,10
	.p2align 3
.L129:
; src/output.c:82:         output_statement(statement, outfile, indent + 1, parser);
	movq	%r14, %rcx	; parser,
	movq	%rbp, %rdx	; _26,
	movq	%r13, %rsi	; outfile,
	call	output_statement	;
.L128:
; src/output.c:81:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%r12, %rdi	; body,
	call	list_pop@PLT	;
	movq	%rax, %rdi	; tmp194, statement
; src/output.c:81:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	; statement
	jne	.L129	;,
	jmp	.L120	;
	.p2align 4,,10
	.p2align 3
.L123:
; src/output.c:39:             OUT(0, false, "unknown_CodeMemberType: %u\n", code_member_ptr->type);
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%rbx), %ecx	; member_9->type, member_9->type
	movl	$2, %esi	;,
	movq	%r13, %rdi	; outfile,
	leaq	.LC75(%rip), %rdx	;, tmp173
	xorl	%eax, %eax	;
	call	__fprintf_chk@PLT	;
	jmp	.L120	;
	.p2align 4,,10
	.p2align 3
.L122:
; src/output.c:35:             OUT(0, false, "class\n");
	call	indention@PLT	;
; src/output.c:36:             output_class(code_member_ptr->content.class_, outfile, indent + 1, parser);
	leaq	2(%r15), %rbp	;, _19
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC70(%rip), %rdi	;, tmp151
	call	fwrite@PLT	;
; src/output.c:36:             output_class(code_member_ptr->content.class_, outfile, indent + 1, parser);
	movq	(%rbx), %rbx	; member_9->content.class_, _20
; src/output.c:131:     OUT(0, false, "name\n");
	movq	%r14, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; _19,
	movq	%r13, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC31(%rip), %rdi	;,
	call	fwrite@PLT	;
; src/output.c:132:     output_name(class_ptr->name, outfile, indent + 1, parser);
	leaq	3(%r15), %rax	;, _38
	movq	(%rbx), %rdi	; _20->name, _20->name
	movq	%r14, %rcx	; parser,
	movq	%rax, %rdx	; _38,
	movq	%r13, %rsi	; outfile,
	movq	%rax, 16(%rsp)	; _38, %sfp
	call	output_name	;
; src/output.c:133:     OUT(0, true, "members\n");
	movq	%r14, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; _19,
	movq	%r13, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$8, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC71(%rip), %rdi	;, tmp154
	call	fwrite@PLT	;
; src/output.c:134:     list(ClassMember*) members = list_copy(class_ptr->members);
	movq	8(%rbx), %rdi	; _20->members, _20->members
	call	list_copy@PLT	;
	movq	%rax, 8(%rsp)	; tmp195, %sfp
	.p2align 4,,10
	.p2align 3
.L130:
; src/output.c:136:     while ((member = (ClassMember*)list_pop(members)) != 0)
	movq	8(%rsp), %rdi	; %sfp,
	call	list_pop@PLT	;
	movq	%rax, %rbx	; tmp200, member
; src/output.c:136:     while ((member = (ClassMember*)list_pop(members)) != 0)
	testq	%rax, %rax	; member
	je	.L120	;,
; src/output.c:112:     switch (class_member_ptr->type) {
	movl	8(%rbx), %eax	; member_42->type, _43
; src/output.c:112:     switch (class_member_ptr->type) {
	testl	%eax, %eax	; _43
	je	.L131	;,
	cmpl	$1, %eax	;, _43
	je	.L132	;,
; src/output.c:122:             OUT(0, false, "unknown_ClassMemberType: %u\n", class_member_ptr->type);
	movq	16(%rsp), %rsi	; %sfp,
	movq	%r14, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%r13, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%rbx), %ecx	; member_42->type, member_42->type
	movl	$2, %esi	;,
	movq	%r13, %rdi	; outfile,
	leaq	.LC74(%rip), %rdx	;, tmp171
	xorl	%eax, %eax	;
	call	__fprintf_chk@PLT	;
	jmp	.L130	;
	.p2align 4,,10
	.p2align 3
.L131:
; src/output.c:114:             OUT(0, false, "method\n");
	movq	16(%rsp), %rsi	; %sfp,
	movq	%r14, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%r13, %rdi	; outfile,
; src/output.c:90:     output_name(method_ptr->name, outfile, indent + 1, parser);
	leaq	5(%r15), %rbp	;, _49
; src/output.c:114:             OUT(0, false, "method\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC72(%rip), %rdi	;,
	call	fwrite@PLT	;
; src/output.c:115:             output_method(class_member_ptr->content.method, outfile, indent + 1, parser);
	leaq	4(%r15), %rax	;, _44
	movq	(%rbx), %rbx	; member_42->content.method, _45
; src/output.c:89:     OUT(0, false, "name\n");
	movq	%r14, %rcx	; parser,
	movq	%rax, %rsi	; _44,
	xorl	%edx, %edx	;
	movq	%r13, %rdi	; outfile,
; src/output.c:115:             output_method(class_member_ptr->content.method, outfile, indent + 1, parser);
	movq	%rax, %r12	; _44, _44
	movq	%rax, 24(%rsp)	; _44, %sfp
; src/output.c:89:     OUT(0, false, "name\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC31(%rip), %rdi	;,
	call	fwrite@PLT	;
; src/output.c:90:     output_name(method_ptr->name, outfile, indent + 1, parser);
	movq	(%rbx), %rdi	; _45->name, _45->name
	movq	%r14, %rcx	; parser,
	movq	%rbp, %rdx	; _49,
	movq	%r13, %rsi	; outfile,
	call	output_name	;
; src/output.c:91:     OUT(0, false, "return_type\n");
	movq	%r14, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; _44,
	movq	%r13, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rdi	;,
	call	fwrite@PLT	;
; src/output.c:92:     output_name(method_ptr->return_type, outfile, indent + 1, parser);
	movq	8(%rbx), %rdi	; _45->return_type, _45->return_type
	movq	%r14, %rcx	; parser,
	movq	%rbp, %rdx	; _49,
	movq	%r13, %rsi	; outfile,
	call	output_name	;
; src/output.c:93:     OUT(0, false, "parameters\n");
	movq	%r14, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; _44,
	movq	%r13, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$11, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC68(%rip), %rdi	;, tmp161
	call	fwrite@PLT	;
; src/output.c:94:     list(Variable*) parameters = list_copy(method_ptr->parameters);
	movq	16(%rbx), %rdi	; _45->parameters, _45->parameters
	call	list_copy@PLT	;
; src/output.c:95:     list(Statement*) body = list_copy(method_ptr->body);
	movq	24(%rbx), %rdi	; _45->body, _45->body
; src/output.c:97:     int index = -1;
	movl	$-1, %ebx	;, index
; src/output.c:94:     list(Variable*) parameters = list_copy(method_ptr->parameters);
	movq	%rax, (%rsp)	; tmp196, %sfp
; src/output.c:95:     list(Statement*) body = list_copy(method_ptr->body);
	call	list_copy@PLT	;
	movq	%rax, 32(%rsp)	; body, %sfp
; src/output.c:98:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	jmp	.L134	;
	.p2align 4,,10
	.p2align 3
.L135:
; src/output.c:99:         OUT(1, false, "parameters[%d]\n", ++index);
	movq	%r14, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; _49,
	movq	%r13, %rdi	; outfile,
	call	indention@PLT	;
; src/output.c:99:         OUT(1, false, "parameters[%d]\n", ++index);
	addl	$1, %ebx	;, index
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	%r13, %rdi	; outfile,
	movl	%ebx, %ecx	; index,
	leaq	.LC69(%rip), %rdx	;,
	xorl	%eax, %eax	;
	call	__fprintf_chk@PLT	;
; src/output.c:100:         output_variable(parameter, outfile, indent + 2, parser);
	leaq	6(%r15), %rdx	;, tmp165
	movq	%r14, %rcx	; parser,
	movq	%r13, %rsi	; outfile,
	movq	%r12, %rdi	; parameter,
	call	output_variable	;
.L134:
; src/output.c:98:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	movq	(%rsp), %rdi	; %sfp,
	call	list_pop@PLT	;
	movq	%rax, %r12	; tmp198, parameter
; src/output.c:98:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	testq	%rax, %rax	; parameter
	jne	.L135	;,
; src/output.c:102:     OUT(0, true, "body\n");
	movq	24(%rsp), %rsi	; %sfp,
	movq	%r14, %rcx	; parser,
	movq	%r13, %rdi	; outfile,
	movl	$1, %edx	;,
	movq	32(%rsp), %r12	; %sfp, body
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC47(%rip), %rdi	;, tmp166
	call	fwrite@PLT	;
	jmp	.L136	;
	.p2align 4,,10
	.p2align 3
.L137:
; src/output.c:105:         output_statement(statement, outfile, indent + 1, parser);
	movq	%r14, %rcx	; parser,
	movq	%rbp, %rdx	; _49,
	movq	%r13, %rsi	; outfile,
	call	output_statement	;
.L136:
; src/output.c:104:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%r12, %rdi	; body,
	call	list_pop@PLT	;
	movq	%rax, %rdi	; tmp199, statement
; src/output.c:104:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	; statement
	jne	.L137	;,
	jmp	.L130	;
	.p2align 4,,10
	.p2align 3
.L132:
; src/output.c:118:             OUT(0, false, "variable\n");
	movq	16(%rsp), %rsi	; %sfp,
	movq	%r14, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%r13, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; outfile,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC73(%rip), %rdi	;, tmp167
	call	fwrite@PLT	;
; src/output.c:119:             output_variable(class_member_ptr->content.variable, outfile, indent + 1, parser);
	movq	(%rbx), %rdi	; member_42->content.variable, member_42->content.variable
	leaq	4(%r15), %rdx	;, tmp168
	movq	%r14, %rcx	; parser,
	movq	%r13, %rsi	; outfile,
	call	output_variable	;
; src/output.c:120:             break;
	jmp	.L130	;
	.p2align 4,,10
	.p2align 3
.L144:
; src/output.c:51: }
	addq	$56, %rsp	;,
	.cfi_def_cfa_offset 56
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE66:
	.size	output_code, .-output_code
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
