	.file	"output.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
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
	.type	output_name, @function
output_name:
	pushq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC1(%rip), %r15	;, tmp115
; src/output.c:363: void output_name(Symbol* name, FILE* outfile, size_t indent, char indent_has_next[32]) {
	pushq	%r14	;
	leaq	1(%rdx), %r14	;, ivtmp.34
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp116, name
	pushq	%rbp	;
	movq	%rcx, %rbp	; tmp119, indent_has_next
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp117, outfile
	pushq	%r8	;
.L2:
	leaq	-1(%r14), %r13	;, indent
; src/output.c:366:         ast_output(0, true, "Name: \"NULL\"\n");
	movq	%rbp, %rcx	; indent_has_next,
; src/output.c:365:     if (name == NULL) {
	testq	%r12, %r12	; name
	jne	.L3	;,
; src/output.c:366:         ast_output(0, true, "Name: \"NULL\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC0(%rip), %rdi	;, tmp91
	jmp	.L18	;
.L3:
; src/output.c:370:     ast_output(0, false, "name: \"%s\"\n", name->name);
	xorl	%edx, %edx	;
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%r12), %rcx	; name_15->name, name_15->name
	movq	%r15, %rdx	; tmp115,
	movq	%rbx, %rdi	; outfile,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:371:     ast_output(0, false, "id: %zu\n", name->id);
	xorl	%edx, %edx	;
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	movq	16(%r12), %rcx	; name_15->id, name_15->id
	movq	%rbx, %rdi	; outfile,
	leaq	.LC2(%rip), %rdx	;, tmp95
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:372:     switch (name->kind) {
	cmpl	$6, 32(%r12)	;, name_15->kind
	ja	.L4	;,
	movl	32(%r12), %eax	; name_15->kind, name_15->kind
	leaq	.L6(%rip), %rdx	;, tmp97
; src/output.c:374:             ast_output(0, true, "kind: \"type\"\n");
	movq	%rbp, %rcx	; indent_has_next,
; src/output.c:372:     switch (name->kind) {
	movslq	(%rdx,%rax,4), %rax	;, tmp99
	addq	%rdx, %rax	; tmp97, tmp100
	jmp	*%rax	; tmp100
	.section	.rodata
	.align 4
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
; src/output.c:374:             ast_output(0, true, "kind: \"type\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC3(%rip), %rdi	;, tmp102
	jmp	.L18	;
.L9:
; src/output.c:377:             ast_output(0, false, "kind: \"variable\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	xorl	%edx, %edx	;
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC4(%rip), %rdi	;, tmp103
	jmp	.L16	;
.L11:
; src/output.c:382:             ast_output(0, false, "kind: \"function\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	xorl	%edx, %edx	;
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC6(%rip), %rdi	;, tmp105
	jmp	.L17	;
.L10:
; src/output.c:387:             ast_output(0, false, "kind: \"method\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	xorl	%edx, %edx	;
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC8(%rip), %rdi	;, tmp107
.L17:
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:388:             ast_output(0, true, "return_type\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movq	%rbp, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC7(%rip), %rdi	;, tmp108
	jmp	.L15	;
.L12:
; src/output.c:392:             ast_output(0, true, "kind: \"class\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC9(%rip), %rdi	;, tmp109
	jmp	.L18	;
.L7:
; src/output.c:395:             ast_output(0, false, "kind: \"attribute\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	xorl	%edx, %edx	;
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC10(%rip), %rdi	;, tmp110
.L16:
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:396:             ast_output(0, true, "type\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movq	%rbp, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC5(%rip), %rdi	;, tmp111
.L15:
	call	*fputs@GOTPCREL(%rip)	;
	incq	%r14	; ivtmp.34
; src/output.c:397:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	(%r12), %r12	; name_15->type, name
	jmp	.L2	;
.L8:
; src/output.c:400:             ast_output(0, false, "kind: \"parameter\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	xorl	%edx, %edx	;
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC11(%rip), %rdi	;, tmp112
	jmp	.L16	;
.L4:
; src/output.c:405:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movq	%rbp, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC12(%rip), %rdi	;, tmp114
.L18:
; src/output.c:409: }
	popq	%rax	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fputs@GOTPCREL(%rip)	;
	.size	output_name, .-output_name
	.section	.rodata.str1.1
.LC13:
	.string	"UNKNOWN_OPERATOR"
.LC14:
	.string	"primary\n"
.LC15:
	.string	"type: \"integer\"\n"
.LC16:
	.string	"value: %s\n"
.LC17:
	.string	"type: \"float\"\n"
.LC18:
	.string	"type: \"string\"\n"
.LC19:
	.string	"value: \"%s\"\n"
.LC20:
	.string	"type: \"boolean\"\n"
.LC21:
	.string	"value: \"true\"\n"
.LC22:
	.string	"value: \"false\"\n"
.LC23:
	.string	"type: \"expression\"\n"
.LC24:
	.string	"value\n"
.LC25:
	.string	"type: \"!\"\n"
.LC26:
	.string	"type: \"-\"\n"
.LC27:
	.string	"type: \"variable\"\n"
.LC28:
	.string	"unknown_PrimaryType: %u\n"
.LC29:
	.string	"operator: \"%s\"\n"
.LC30:
	.string	"left\n"
.LC31:
	.string	"right\n"
	.text
	.type	output_expression, @function
output_expression:
	pushq	%r15	;
; src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	leaq	.LC13(%rip), %r15	;, op_str
; src/output.c:256: void output_expression(Expression* expression, FILE* outfile, size_t indent, char indent_has_next[32]) {
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdx, %r12	; tmp136, indent
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp134, expression
	pushq	%rbx	;
	movq	%rcx, %rbx	; tmp137, indent_has_next
	subq	$24, %rsp	;,
; src/output.c:256: void output_expression(Expression* expression, FILE* outfile, size_t indent, char indent_has_next[32]) {
	movq	%rsi, 8(%rsp)	; tmp135, %sfp
.L37:
; src/output.c:258:     if (expression->operator == OP_NONE) {
	movl	24(%rbp), %edi	; expression_9->operator, _1
; src/output.c:258:     if (expression->operator == OP_NONE) {
	cmpl	$19, %edi	;, _1
	jne	.L21	;,
; src/output.c:259:         ast_output(0, true, "primary\n");
	movq	%r12, %rsi	; indent,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	addq	$2, %r12	;, indent
	leaq	.LC14(%rip), %rdi	;, tmp98
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:260:         output_primary(expression->prim_left, outfile, indent + 1, indent_has_next);
	movq	8(%rbp), %r13	; expression_9->prim_left, primary
; src/output.c:273:     switch (primary->type) {
	leaq	.L25(%rip), %r14	;, tmp131
.L22:
	cmpl	$8, 8(%r13)	;, primary_28->type
	leaq	-1(%r12), %rbp	;, indent
	ja	.L23	;,
	movl	8(%r13), %eax	; primary_28->type, primary_28->type
; src/output.c:310:             ast_output(0, false, "type: \"variable\"\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rcx	; indent_has_next,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; indent,
; src/output.c:273:     switch (primary->type) {
	movslq	(%r14,%rax,4), %rax	;, tmp102
	addq	%r14, %rax	; tmp131, tmp103
	jmp	*%rax	; tmp103
	.section	.rodata
	.align 4
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
; src/output.c:275:             ast_output(0, false, "type: \"integer\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC15(%rip), %rdi	;, tmp105
	jmp	.L41	;
.L32:
; src/output.c:279:             ast_output(0, false, "type: \"float\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC17(%rip), %rdi	;, tmp107
.L41:
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:280:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	%rbx, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	0(%r13), %rcx	; primary_28->value.literal_value,
	leaq	.LC16(%rip), %rdx	;, tmp108
.L42:
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:270: }
	addq	$24, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
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
.L31:
; src/output.c:283:             ast_output(0, false, "type: \"string\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC18(%rip), %rdi	;, tmp109
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:284:             ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
	movq	%rbx, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	0(%r13), %rcx	; primary_28->value.literal_value,
	leaq	.LC19(%rip), %rdx	;, tmp110
	jmp	.L42	;
.L30:
; src/output.c:287:             ast_output(0, false, "type: \"boolean\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC20(%rip), %rdi	;, tmp111
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:288:             ast_output(0, true, "value: \"true\"\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC21(%rip), %rdi	;, tmp112
	jmp	.L43	;
.L29:
; src/output.c:291:             ast_output(0, false, "type: \"boolean\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC20(%rip), %rdi	;, tmp113
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:292:             ast_output(0, true, "value: \"false\"\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC22(%rip), %rdi	;, tmp114
.L43:
; src/output.c:270: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fputs@GOTPCREL(%rip)	;
.L28:
; src/output.c:295:             ast_output(0, false, "type: \"expression\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC23(%rip), %rdi	;, tmp115
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:296:             ast_output(0, true, "value\n");
	movq	%rbp, %rsi	; indent,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC24(%rip), %rdi	;, tmp116
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:297:             output_expression(primary->value.expr, outfile, indent + 1, indent_has_next);
	movq	0(%r13), %rbp	; primary_28->value.expr, expression
; src/output.c:298:             break;
	jmp	.L37	;
.L27:
; src/output.c:300:             ast_output(0, false, "type: \"!\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC25(%rip), %rdi	;, tmp117
	jmp	.L40	;
.L26:
; src/output.c:305:             ast_output(0, false, "type: \"-\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC26(%rip), %rdi	;, tmp119
.L40:
	call	*fputs@GOTPCREL(%rip)	;
	incq	%r12	; indent
; src/output.c:306:             ast_output(0, true, "value\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC24(%rip), %rdi	;, tmp120
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:307:             output_primary(primary->value.operand, outfile, indent + 1, indent_has_next);
	movq	0(%r13), %r13	; primary_28->value.operand, primary
	jmp	.L22	;
.L24:
; src/output.c:310:             ast_output(0, false, "type: \"variable\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC27(%rip), %rdi	;, tmp121
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:311:             ast_output(0, true, "value\n");
	movq	%rbx, %rcx	; indent_has_next,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC24(%rip), %rdi	;, tmp122
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:312:             output_variable_access(primary->value.var, outfile, indent + 1, indent_has_next);
	movq	0(%r13), %rdi	; primary_28->value.var,
	movq	%rbx, %rcx	; indent_has_next,
	movq	%r12, %rdx	; indent,
	movq	8(%rsp), %rsi	; %sfp,
; src/output.c:270: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/output.c:312:             output_variable_access(primary->value.var, outfile, indent + 1, indent_has_next);
	jmp	output_variable_access	;
.L23:
; src/output.c:315:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rcx	; indent_has_next,
	movq	%rbp, %rsi	; indent,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%r13), %ecx	; primary_28->type, primary_28->type
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%eax, %eax	;
; src/output.c:270: }
	addq	$24, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC28(%rip), %rdx	;, tmp124
	movl	$2, %esi	;,
; src/output.c:270: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
.L21:
; src/output.c:262:         string op_str = operator_to_string(expression->operator);
	call	*operator_to_string@GOTPCREL(%rip)	;
; src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; indent,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:262:         string op_str = operator_to_string(expression->operator);
	movq	%rax, %r13	; tmp138, op_str
; src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	%rbx, %rcx	; indent_has_next,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	testq	%r13, %r13	; op_str
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rdi	; %sfp,
	leaq	.LC29(%rip), %rdx	;, tmp125
; src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	cmove	%r15, %r13	; op_str,, op_str, op_str
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	movq	%r13, %rcx	; op_str,
; src/output.c:265:         output_expression(expression->expr_left, outfile, indent + 1, indent_has_next);
	leaq	1(%r12), %r13	;, _4
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:264:         ast_output(0, false, "left\n");
	movq	%rbx, %rcx	; indent_has_next,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; indent,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC30(%rip), %rdi	;, tmp126
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:265:         output_expression(expression->expr_left, outfile, indent + 1, indent_has_next);
	movq	0(%rbp), %rdi	; expression_9->expr_left,
	movq	%rbx, %rcx	; indent_has_next,
	movq	%r13, %rdx	; _4,
	movq	8(%rsp), %rsi	; %sfp,
	call	output_expression	;
; src/output.c:266:         ast_output(0, true, "right\n");
	movq	%r12, %rsi	; indent,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rcx	; indent_has_next,
	movl	$1, %edx	;,
; src/output.c:267:         output_expression(expression->right, outfile, indent + 1, indent_has_next);
	movq	%r13, %r12	; _4, indent
; src/output.c:266:         ast_output(0, true, "right\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC31(%rip), %rdi	;, tmp127
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:267:         output_expression(expression->right, outfile, indent + 1, indent_has_next);
	movq	16(%rbp), %rbp	; expression_9->right, expression
	jmp	.L37	;
	.size	output_expression, .-output_expression
	.section	.rodata.str1.1
.LC32:
	.string	"name\n"
.LC33:
	.string	"value: \"NULL\"\n"
	.text
	.type	output_variable, @function
output_variable:
	pushq	%r14	;
	pushq	%r13	;
	movq	%rdi, %r13	; tmp97, variable
	pushq	%r12	;
	movq	%rdx, %r12	; tmp99, indent
; src/output.c:130:     ast_output(0, false, "type\n");
	xorl	%edx, %edx	;
; src/output.c:128: void output_variable(Variable* variable, FILE* outfile, size_t indent, char indent_has_next[32]) {
	pushq	%rbp	;
; src/output.c:131:     output_name(variable->type, outfile, indent + 1, indent_has_next);
	leaq	1(%r12), %r14	;, _1
; src/output.c:128: void output_variable(Variable* variable, FILE* outfile, size_t indent, char indent_has_next[32]) {
	movq	%rcx, %rbp	; tmp100, indent_has_next
	pushq	%rbx	;
; src/output.c:128: void output_variable(Variable* variable, FILE* outfile, size_t indent, char indent_has_next[32]) {
	movq	%rsi, %rbx	; tmp98, outfile
; src/output.c:130:     ast_output(0, false, "type\n");
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC5(%rip), %rdi	;, tmp91
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:131:     output_name(variable->type, outfile, indent + 1, indent_has_next);
	movq	0(%r13), %rdi	; variable_12(D)->type,
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
	movq	%rbx, %rsi	; outfile,
	leaq	.LC32(%rip), %rdi	;, tmp92
	call	*fputs@GOTPCREL(%rip)	;
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
	je	.L45	;,
; src/output.c:135:         ast_output(0, true, "value\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC24(%rip), %rdi	;, tmp94
	call	*fputs@GOTPCREL(%rip)	;
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
.L45:
; src/output.c:138:         ast_output(0, true, "value: \"NULL\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC33(%rip), %rdi	;, tmp96
; src/output.c:140: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fputs@GOTPCREL(%rip)	;
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
.LC45:
	.string	"unknown_VariableAccessType: %u\n"
	.text
	.type	output_variable_access, @function
output_variable_access:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	movq	%rdi, %r13	; tmp125, variable_access
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rdx, %rbp	; tmp127, indent
	pushq	%rbx	;
	subq	$24, %rsp	;,
; src/output.c:324:     switch (variable_access->type) {
	movl	16(%rdi), %eax	; variable_access_19(D)->type, _1
; src/output.c:320: void output_variable_access(VariableAccess* variable_access, FILE* outfile, size_t indent, char indent_has_next[32]) {
	movq	%rsi, (%rsp)	; tmp126, %sfp
	movq	%rcx, 8(%rsp)	; tmp128, %sfp
; src/output.c:324:     switch (variable_access->type) {
	cmpl	$2, %eax	;, _1
	je	.L48	;,
	ja	.L49	;,
	testl	%eax, %eax	; _1
	leaq	1(%rdx), %r14	;, _5
	jne	.L57	;,
; src/output.c:326:             ast_output(0, false, "type: \"name\"\n");
	movq	8(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC34(%rip), %rdi	;, tmp103
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:327:             ast_output(0, true, "name\n");
	movq	8(%rsp), %rcx	; %sfp,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC32(%rip), %rdi	;, tmp104
	movq	(%rsp), %rsi	; %sfp,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:328:             output_name(variable_access->content.name, outfile, indent + 1, indent_has_next);
	movq	8(%r13), %rdi	; variable_access_19(D)->content.name, variable_access_19(D)->content.name
	movq	8(%rsp), %rcx	; %sfp,
	movq	%r14, %rdx	; _5,
	jmp	.L61	;
.L49:
; src/output.c:324:     switch (variable_access->type) {
	cmpl	$3, %eax	;, _1
	jne	.L62	;,
; src/output.c:344:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movq	8(%rsp), %rcx	; %sfp,
; src/output.c:346:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %r12	;, _8
; src/output.c:344:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movq	(%rsp), %rdi	; %sfp,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; indent,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC39(%rip), %rdi	;, tmp113
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:345:             ast_output(0, false, "sequence\n");
	movq	8(%rsp), %rcx	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; indent,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC40(%rip), %rdi	;, tmp114
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:346:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	movq	(%rsp), %rsi	; %sfp,
	movq	0(%r13), %rdi	; variable_access_19(D)->base,
	movq	%r12, %rdx	; _8,
	movq	8(%rsp), %rcx	; %sfp,
	call	output_variable_access	;
; src/output.c:347:             ast_output(0, true, "index\n");
	movq	8(%rsp), %rcx	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC41(%rip), %rdi	;, tmp115
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:348:             output_expression(variable_access->content.index, outfile, indent + 1, indent_has_next);
	movq	8(%r13), %rdi	; variable_access_19(D)->content.index, variable_access_19(D)->content.index
	movq	(%rsp), %rsi	; %sfp,
	movq	%r12, %rdx	; _8,
	movq	8(%rsp), %rcx	; %sfp,
; src/output.c:362: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/output.c:348:             output_expression(variable_access->content.index, outfile, indent + 1, indent_has_next);
	jmp	output_expression	;
.L57:
; src/output.c:331:             args = list_copy(variable_access->content.args);
	movq	8(%rdi), %rdi	; variable_access_19(D)->content.args, variable_access_19(D)->content.args
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC38(%rip), %r15	;, tmp124
; src/output.c:331:             args = list_copy(variable_access->content.args);
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:332:             ast_output(0, false, "type: \"function_call\"\n");
	movq	8(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	(%rsp), %rdi	; %sfp,
; src/output.c:331:             args = list_copy(variable_access->content.args);
	movq	%rax, %r12	; tmp129, args
; src/output.c:332:             ast_output(0, false, "type: \"function_call\"\n");
	movq	%rbp, %rsi	; indent,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC35(%rip), %rdi	;, tmp108
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:333:             ast_output(0, false, "function\n");
	movq	8(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC36(%rip), %rdi	;, tmp109
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:334:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	movq	0(%r13), %rdi	; variable_access_19(D)->base,
	movq	(%rsp), %rsi	; %sfp,
	movq	%r14, %rdx	; _5,
	movq	8(%rsp), %rcx	; %sfp,
; src/output.c:337:             index = -1;
	orl	$-1, %r13d	;, index
; src/output.c:334:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	call	output_variable_access	;
; src/output.c:335:             ast_output(0, true, "arguments\n");
	movq	8(%rsp), %rcx	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC37(%rip), %rdi	;, tmp110
	call	*fputs@GOTPCREL(%rip)	;
.L54:
; src/output.c:338:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	movq	%r12, %rdi	; args,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp130, arg
; src/output.c:338:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	; arg
	je	.L63	;,
; src/output.c:339:                 ast_output(1, false, "arguments[%d]\n", ++index);
	incl	%r13d	; index
; src/output.c:339:                 ast_output(1, false, "arguments[%d]\n", ++index);
	movq	8(%rsp), %rcx	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	xorl	%edx, %edx	;
	movq	%r14, %rsi	; _5,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rdi	; %sfp,
	movl	%r13d, %ecx	; index,
	movq	%r15, %rdx	; tmp124,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:340:                 output_expression(arg, outfile, indent + 2, indent_has_next);
	movq	(%rsp), %rsi	; %sfp,
	leaq	2(%rbp), %rdx	;, tmp112
	movq	%rbx, %rdi	; arg,
	movq	8(%rsp), %rcx	; %sfp,
	call	output_expression	;
	jmp	.L54	;
.L48:
; src/output.c:351:             ast_output(0, false, "type: \"get_attribute\"\n");
	movq	8(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:353:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %r12	;, _11
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC42(%rip), %rdi	;, tmp117
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:352:             ast_output(0, false, "object\n");
	movq	8(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC43(%rip), %rdi	;, tmp118
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:353:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	movq	(%rsp), %rsi	; %sfp,
	movq	0(%r13), %rdi	; variable_access_19(D)->base,
	movq	%r12, %rdx	; _11,
	movq	8(%rsp), %rcx	; %sfp,
	call	output_variable_access	;
; src/output.c:354:             ast_output(0, true, "attribute_name\n");
	movq	8(%rsp), %rcx	; %sfp,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC44(%rip), %rdi	;, tmp119
	movq	(%rsp), %rsi	; %sfp,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:355:             output_name(variable_access->content.attr_name, outfile, indent + 1, indent_has_next);
	movq	8(%r13), %rdi	; variable_access_19(D)->content.attr_name, variable_access_19(D)->content.attr_name
	movq	8(%rsp), %rcx	; %sfp,
	movq	%r12, %rdx	; _11,
.L61:
	movq	(%rsp), %rsi	; %sfp,
; src/output.c:362: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/output.c:355:             output_name(variable_access->content.attr_name, outfile, indent + 1, indent_has_next);
	jmp	output_name	;
.L62:
; src/output.c:358:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movq	8(%rsp), %rcx	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	16(%r13), %ecx	; variable_access_19(D)->type, variable_access_19(D)->type
	movq	(%rsp), %rdi	; %sfp,
	xorl	%eax, %eax	;
; src/output.c:362: }
	addq	$24, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC45(%rip), %rdx	;, tmp122
	movl	$2, %esi	;,
; src/output.c:362: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
.L63:
; src/output.c:362: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
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
.LC58:
	.string	"variable_declaration_statement\n"
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
	.type	output_statement, @function
output_statement:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp188, statement
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdx, %rbx	; tmp190, indent
	subq	$56, %rsp	;,
; src/output.c:143:     switch (statement->type) {
	cmpl	$7, 8(%rdi)	;, statement_19(D)->type
; src/output.c:141: void output_statement(Statement* statement, FILE* outfile, size_t indent, char indent_has_next[32]) {
	movq	%rsi, 8(%rsp)	; tmp189, %sfp
	movq	%rcx, 16(%rsp)	; tmp191, %sfp
; src/output.c:143:     switch (statement->type) {
	ja	.L65	;,
	movl	8(%rdi), %eax	; statement_19(D)->type, statement_19(D)->type
	leaq	.L67(%rip), %rdx	;, tmp137
; src/output.c:173:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movq	16(%rsp), %rcx	; %sfp,
	movq	%rbx, %rsi	; indent,
	movq	8(%rsp), %rdi	; %sfp,
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
; src/output.c:145:             ast_output(0, false, "if_statement\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
; src/output.c:146:             output_if(statement->stmt.if_stmt, outfile, indent + 1, indent_has_next);
	leaq	1(%rbx), %rbp	;, _2
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC46(%rip), %rdi	;, tmp142
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:146:             output_if(statement->stmt.if_stmt, outfile, indent + 1, indent_has_next);
	movq	(%r12), %r15	; statement_19(D)->stmt.if_stmt, _3
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC47(%rip), %r14	;, tmp146
; src/output.c:192:     list(Statement*) body = list_copy(if_->body);
	movq	8(%r15), %rdi	; _3->body, _3->body
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:193:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	movq	16(%r15), %rdi	; _3->else_if, _3->else_if
; src/output.c:192:     list(Statement*) body = list_copy(if_->body);
	movq	%rax, %r13	; tmp192, body
; src/output.c:193:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:194:     list(Statement*) else_body = list_copy(if_->else_body);
	movq	24(%r15), %rdi	; _3->else_body, _3->else_body
; src/output.c:193:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	movq	%rax, %r12	; tmp193, else_if_list
; src/output.c:194:     list(Statement*) else_body = list_copy(if_->else_body);
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:195:     ast_output(0, false, "condition\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; _2,
; src/output.c:194:     list(Statement*) else_body = list_copy(if_->else_body);
	movq	%rax, 40(%rsp)	; tmp194, %sfp
; src/output.c:195:     ast_output(0, false, "condition\n");
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%r14, %rdi	; tmp146,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:196:     output_expression(if_->condition, outfile, indent + 1, indent_has_next);
	leaq	2(%rbx), %rax	;, _57
	movq	(%r15), %rdi	; _3->condition,
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rax, %rdx	; _57,
	movq	%rax, 24(%rsp)	; _57, %sfp
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC48(%rip), %r15	;, tmp147
; src/output.c:196:     output_expression(if_->condition, outfile, indent + 1, indent_has_next);
	call	output_expression	;
; src/output.c:197:     ast_output(0, false, "body\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; _2,
	xorl	%edx, %edx	;
	movq	16(%rsp), %rcx	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; tmp147,
	call	*fputs@GOTPCREL(%rip)	;
.L75:
; src/output.c:199:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r13, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
; src/output.c:200:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	16(%rsp), %rcx	; %sfp,
; src/output.c:199:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rax, %rdi	; tmp195, statement
; src/output.c:199:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L100	;,
; src/output.c:200:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	24(%rsp), %rdx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	call	output_statement	;
	jmp	.L75	;
.L100:
; src/output.c:201:     ast_output(0, false, "else_if\n");
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; _2,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC49(%rip), %rdi	;, tmp148
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:214:     output_expression(else_if->condition, outfile, indent + 1, indent_has_next);
	leaq	3(%rbx), %rax	;, _64
	movq	%rax, 32(%rsp)	; _64, %sfp
.L77:
; src/output.c:203:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	movq	%r12, %rdi	; else_if_list,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp198, else_if
; src/output.c:203:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	testq	%rax, %rax	; else_if
	je	.L101	;,
; src/output.c:212:     list(Statement*) body = list_copy(else_if->body);
	movq	8(%r13), %rdi	; else_if_60->body, else_if_60->body
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:213:     ast_output(0, false, "condition\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	24(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:212:     list(Statement*) body = list_copy(else_if->body);
	movq	%rax, %rbx	; tmp196, body
; src/output.c:213:     ast_output(0, false, "condition\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%r14, %rdi	; tmp146,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:214:     output_expression(else_if->condition, outfile, indent + 1, indent_has_next);
	movq	16(%rsp), %rcx	; %sfp,
	movq	32(%rsp), %rdx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	0(%r13), %rdi	; else_if_60->condition,
	call	output_expression	;
; src/output.c:215:     ast_output(0, true, "body\n");
	movq	24(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %edx	;,
	movq	16(%rsp), %rcx	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; tmp147,
	call	*fputs@GOTPCREL(%rip)	;
.L78:
; src/output.c:217:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbx, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp197, statement
; src/output.c:217:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L77	;,
; src/output.c:218:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	16(%rsp), %rcx	; %sfp,
	movq	32(%rsp), %rdx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	call	output_statement	;
	jmp	.L78	;
.L101:
; src/output.c:205:     ast_output(0, true, "else_body\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; _2,
	movq	16(%rsp), %rcx	; %sfp,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC50(%rip), %rdi	;, tmp152
	call	*fputs@GOTPCREL(%rip)	;
.L81:
; src/output.c:206:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	movq	40(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp199, statement
; src/output.c:206:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L64	;,
; src/output.c:207:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	16(%rsp), %rcx	; %sfp,
	movq	24(%rsp), %rdx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	call	output_statement	;
	jmp	.L81	;
.L70:
; src/output.c:149:             ast_output(0, false, "for_statement\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC51(%rip), %rdi	;, tmp153
; src/output.c:150:             output_for(statement->stmt.for_stmt, outfile, indent + 1, indent_has_next);
	leaq	1(%rbx), %rbp	;, _4
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:150:             output_for(statement->stmt.for_stmt, outfile, indent + 1, indent_has_next);
	movq	(%r12), %r12	; statement_19(D)->stmt.for_stmt, _5
; src/output.c:223:     list(Statement*) body = list_copy(for_->body);
	movq	24(%r12), %rdi	; _5->body, _5->body
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:225:         ast_output(0, false, "initializer\n");
	xorl	%edx, %edx	;
; src/output.c:224:     if (for_->initializer != NULL) {
	cmpq	$0, (%r12)	;, _5->initializer
; src/output.c:225:         ast_output(0, false, "initializer\n");
	movq	%rbp, %rsi	; _4,
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:223:     list(Statement*) body = list_copy(for_->body);
	movq	%rax, %r13	; tmp200, body
; src/output.c:224:     if (for_->initializer != NULL) {
	je	.L84	;,
; src/output.c:225:         ast_output(0, false, "initializer\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC52(%rip), %rdi	;, tmp155
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:226:         output_variable(for_->initializer, outfile, indent + 1, indent_has_next);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	2(%rbx), %rdx	;, tmp156
	movq	(%r12), %rdi	; _5->initializer,
	call	output_variable	;
	jmp	.L85	;
.L84:
; src/output.c:228:         ast_output(0, false, "initializer: \"NULL\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC53(%rip), %rdi	;, tmp157
	call	*fputs@GOTPCREL(%rip)	;
.L85:
; src/output.c:230:         ast_output(0, false, "condition\n");
	xorl	%edx, %edx	;
; src/output.c:229:     if (for_->condition != NULL) {
	cmpq	$0, 8(%r12)	;, _5->condition
; src/output.c:230:         ast_output(0, false, "condition\n");
	movq	16(%rsp), %rcx	; %sfp,
	movq	%rbp, %rsi	; _4,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:229:     if (for_->condition != NULL) {
	je	.L86	;,
; src/output.c:230:         ast_output(0, false, "condition\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC47(%rip), %rdi	;, tmp158
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:231:         output_expression(for_->condition, outfile, indent + 1, indent_has_next);
	movq	8(%r12), %rdi	; _5->condition, _5->condition
	movq	16(%rsp), %rcx	; %sfp,
	leaq	2(%rbx), %rdx	;, tmp159
	movq	8(%rsp), %rsi	; %sfp,
	call	output_expression	;
	jmp	.L87	;
.L86:
; src/output.c:233:         ast_output(0, false, "condition: \"NULL\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC54(%rip), %rdi	;, tmp161
	call	*fputs@GOTPCREL(%rip)	;
.L87:
; src/output.c:235:         ast_output(0, false, "increment\n");
	xorl	%edx, %edx	;
; src/output.c:234:     if (for_->increment != NULL) {
	cmpq	$0, 16(%r12)	;, _5->increment
; src/output.c:235:         ast_output(0, false, "increment\n");
	movq	16(%rsp), %rcx	; %sfp,
	movq	%rbp, %rsi	; _4,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:234:     if (for_->increment != NULL) {
	je	.L88	;,
; src/output.c:235:         ast_output(0, false, "increment\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC55(%rip), %rdi	;, tmp162
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:236:         output_expression(for_->increment, outfile, indent + 1, indent_has_next);
	movq	16(%r12), %rdi	; _5->increment, _5->increment
	movq	16(%rsp), %rcx	; %sfp,
	leaq	2(%rbx), %rdx	;, tmp163
	movq	8(%rsp), %rsi	; %sfp,
	call	output_expression	;
	jmp	.L89	;
.L88:
; src/output.c:238:         ast_output(0, false, "increment: \"NULL\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC56(%rip), %rdi	;, tmp165
	call	*fputs@GOTPCREL(%rip)	;
.L89:
; src/output.c:239:     ast_output(0, true, "body\n");
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; _4,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:242:         output_statement(statement, outfile, indent + 1, indent_has_next);
	addq	$2, %rbx	;, tmp187
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC48(%rip), %rdi	;, tmp166
	call	*fputs@GOTPCREL(%rip)	;
.L90:
; src/output.c:241:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r13, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp201, statement
; src/output.c:241:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L64	;,
; src/output.c:242:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rbx, %rdx	; tmp187,
	call	output_statement	;
	jmp	.L90	;
.L71:
; src/output.c:153:             ast_output(0, false, "while_statement\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC57(%rip), %rdi	;, tmp168
; src/output.c:154:             output_while(statement->stmt.while_stmt, outfile, indent + 1, indent_has_next);
	leaq	1(%rbx), %r13	;, _6
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:154:             output_while(statement->stmt.while_stmt, outfile, indent + 1, indent_has_next);
	movq	(%r12), %r12	; statement_19(D)->stmt.while_stmt, _7
; src/output.c:249:     output_expression(while_->condition, outfile, indent + 1, indent_has_next);
	addq	$2, %rbx	;, _82
; src/output.c:247:     list(Statement*) body = list_copy(while_->body);
	movq	8(%r12), %rdi	; _7->body, _7->body
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:248:     ast_output(0, false, "condition\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	%r13, %rsi	; _6,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:247:     list(Statement*) body = list_copy(while_->body);
	movq	%rax, %rbp	; tmp202, body
; src/output.c:248:     ast_output(0, false, "condition\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC47(%rip), %rdi	;, tmp170
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:249:     output_expression(while_->condition, outfile, indent + 1, indent_has_next);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rbx, %rdx	; _82,
	movq	(%r12), %rdi	; _7->condition,
	call	output_expression	;
; src/output.c:250:     ast_output(0, true, "body\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r13, %rsi	; _6,
	movq	16(%rsp), %rcx	; %sfp,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC48(%rip), %rdi	;, tmp171
	call	*fputs@GOTPCREL(%rip)	;
.L93:
; src/output.c:252:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbp, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp203, statement
; src/output.c:252:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L64	;,
; src/output.c:253:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rbx, %rdx	; _82,
	call	output_statement	;
	jmp	.L93	;
.L73:
; src/output.c:157:             ast_output(0, false, "variable_declaration_statement\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC58(%rip), %rdi	;, tmp172
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:158:             output_variable(statement->stmt.var, outfile, indent + 1, indent_has_next);
	movq	(%r12), %rdi	; statement_19(D)->stmt.var,
	movq	16(%rsp), %rcx	; %sfp,
	leaq	1(%rbx), %rdx	;, tmp173
	movq	8(%rsp), %rsi	; %sfp,
; src/output.c:189: }
	addq	$56, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/output.c:158:             output_variable(statement->stmt.var, outfile, indent + 1, indent_has_next);
	jmp	output_variable	;
.L69:
; src/output.c:161:             if (statement->stmt.expr == NULL) {
	cmpq	$0, (%r12)	;, statement_19(D)->stmt.expr
	jne	.L95	;,
; src/output.c:162:                 ast_output(0, false, "return_statement: \"NULL\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC59(%rip), %rdi	;, tmp174
	jmp	.L98	;
.L95:
; src/output.c:166:             ast_output(0, false, "return_statement\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC60(%rip), %rdi	;, tmp175
	jmp	.L99	;
.L68:
; src/output.c:170:             ast_output(0, false, "break_statement: \"NULL\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC61(%rip), %rdi	;, tmp177
.L98:
; src/output.c:189: }
	addq	$56, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fputs@GOTPCREL(%rip)	;
.L66:
; src/output.c:173:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC62(%rip), %rdi	;, tmp178
	jmp	.L98	;
.L74:
; src/output.c:176:             if (statement->stmt.expr == NULL) {
	cmpq	$0, (%r12)	;, statement_19(D)->stmt.expr
	jne	.L96	;,
; src/output.c:177:                 ast_output(0, false, "expression_statement: \"NULL\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC63(%rip), %rdi	;, tmp179
	jmp	.L98	;
.L96:
; src/output.c:181:             ast_output(0, false, "expression_statement\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC64(%rip), %rdi	;, tmp180
.L99:
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:182:             output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
	movq	(%r12), %rdi	; statement_19(D)->stmt.expr,
	movq	16(%rsp), %rcx	; %sfp,
	leaq	1(%rbx), %rdx	;, tmp181
	movq	8(%rsp), %rsi	; %sfp,
; src/output.c:189: }
	addq	$56, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/output.c:182:             output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
	jmp	output_expression	;
.L65:
; src/output.c:185:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rsi	; indent,
	xorl	%edx, %edx	;
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%r12), %ecx	; statement_19(D)->type, statement_19(D)->type
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:189: }
	addq	$56, %rsp	;,
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC65(%rip), %rdx	;, tmp183
; src/output.c:189: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
; src/output.c:189: }
	popq	%r12	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
; src/output.c:189: }
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
.L64:
; src/output.c:189: }
	addq	$56, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	output_statement, .-output_statement
	.section	.rodata.str1.1
.LC66:
	.string	"Var: \"NULL\"\n"
.LC67:
	.string	"NULL\t%s\n"
.LC68:
	.string	"%s\t%s\n"
	.text
	.type	output_var, @function
output_var:
	pushq	%rbp	;
	pushq	%rbx	;
	pushq	%rbx	;
; src/output.c:507: void output_var(Var* var, FILE* outfile, size_t indent) {
	movq	%rsi, %rbx	; tmp98, outfile
	movq	%rdx, %rsi	; tmp99, indent
; src/output.c:509:     if (var == NULL) {
	testq	%rdi, %rdi	; var
	jne	.L103	;,
; src/output.c:510:         tac_output(indent, "Var: \"NULL\"\n");
	movq	%rbx, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:519: }
	popq	%r11	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
; src/output.c:519: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC66(%rip), %rdi	;, tmp90
; src/output.c:519: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fputs@GOTPCREL(%rip)	;
.L103:
	movq	%rdi, %rbp	; tmp97, var
; src/output.c:515:         tac_output(indent, "NULL\t%s\n", var->name);
	movq	%rbx, %rdi	; outfile,
; src/output.c:514:     if (var->type == NULL)
	cmpq	$0, 16(%rbp)	;, var_7(D)->type
	jne	.L104	;,
; src/output.c:515:         tac_output(indent, "NULL\t%s\n", var->name);
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rbp), %rcx	; var_7(D)->name, var_7(D)->name
	movq	%rbx, %rdi	; outfile,
; src/output.c:519: }
	popq	%r10	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC67(%rip), %rdx	;, tmp92
; src/output.c:519: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/output.c:519: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
.L104:
; src/output.c:517:         tac_output(indent, "%s\t%s\n", var->type->name, var->name);
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:517:         tac_output(indent, "%s\t%s\n", var->type->name, var->name);
	movq	16(%rbp), %rax	; var_7(D)->type, var_7(D)->type
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rbp), %r8	; var_7(D)->name,
	movq	%rbx, %rdi	; outfile,
	leaq	.LC68(%rip), %rdx	;, tmp96
	movl	$2, %esi	;,
	movq	8(%rax), %rcx	; _4->name, _4->name
; src/output.c:519: }
	popq	%r9	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
; src/output.c:519: }
	popq	%rbx	;
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.size	output_var, .-output_var
	.section	.rodata.str1.1
.LC69:
	.string	"true"
.LC70:
	.string	"false"
.LC71:
	.string	"\"NULL\""
.LC72:
	.string	"%lld"
.LC73:
	.string	"%f"
.LC74:
	.string	"void"
.LC75:
	.string	"NONE"
.LC76:
	.string	"unknown_ArgType: %u"
	.text
	.type	output_arg, @function
output_arg:
	pushq	%rbp	;
	pushq	%rbx	;
	pushq	%rbx	;
; src/output.c:542: void output_arg(Arg* arg, FILE* outfile) {
	movq	%rsi, %rbx	; tmp123, outfile
; src/output.c:544:     if (arg == NULL) {
	testq	%rdi, %rdi	; arg
	jne	.L107	;,
; src/output.c:545:         tac_output(0, "\"NULL\"");
	xorl	%esi, %esi	;
	movq	%rbx, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC71(%rip), %rdi	;, tmp97
	jmp	.L122	;
.L107:
; src/output.c:549:     switch (arg->kind) {
	cmpl	$8, 16(%rdi)	;, arg_15(D)->kind
	movq	%rdi, %rbp	; tmp122, arg
	ja	.L108	;,
	movl	16(%rdi), %eax	; arg_15(D)->kind, arg_15(D)->kind
	leaq	.L110(%rip), %rdx	;, tmp99
; src/output.c:558:         case ARG_NONE: tac_output(0, "NONE"); break;
	xorl	%esi, %esi	;
	movq	%rbx, %rdi	; outfile,
; src/output.c:549:     switch (arg->kind) {
	movslq	(%rdx,%rax,4), %rax	;, tmp101
	addq	%rdx, %rax	; tmp99, tmp102
	jmp	*%rax	; tmp102
	.section	.rodata
	.align 4
	.align 4
.L110:
	.long	.L118-.L110
	.long	.L117-.L110
	.long	.L116-.L110
	.long	.L115-.L110
	.long	.L114-.L110
	.long	.L113-.L110
	.long	.L118-.L110
	.long	.L118-.L110
	.long	.L109-.L110
	.text
.L118:
; src/output.c:550:         case ARG_VARIABLE: tac_output(0, "%s", arg->value.variable->name); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:550:         case ARG_VARIABLE: tac_output(0, "%s", arg->value.variable->name); break;
	movq	0(%rbp), %rax	;* arg, arg_15(D)->value.variable
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rdi	;, _2->name
.L123:
	movq	%rbx, %rsi	; outfile,
.L122:
; src/output.c:562: }
	popq	%r11	;
	popq	%rbx	;
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fputs@GOTPCREL(%rip)	;
.L117:
; src/output.c:551:         case ARG_INT: tac_output(0, "%lld", arg->value.int_value); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	0(%rbp), %rcx	; arg_15(D)->value.int_value,
	movq	%rbx, %rdi	; outfile,
; src/output.c:562: }
	popq	%r10	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC72(%rip), %rdx	;, tmp106
; src/output.c:562: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/output.c:562: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
.L116:
; src/output.c:552:         case ARG_FLOAT: tac_output(0, "%f", arg->value.float_value); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movsd	0(%rbp), %xmm0	; arg_15(D)->value.float_value,
	movq	%rbx, %rdi	; outfile,
; src/output.c:562: }
	popq	%r9	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC73(%rip), %rdx	;, tmp107
; src/output.c:562: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movb	$1, %al	;,
; src/output.c:562: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
.L115:
; src/output.c:553:         case ARG_STRING: tac_output(0, "%s", arg->value.string_value); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	0(%rbp), %rdi	; arg_15(D)->value.string_value,
	movq	%rbx, %rsi	; outfile,
	jmp	.L122	;
.L114:
; src/output.c:554:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:554:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	cmpb	$0, 0(%rbp)	;, arg_15(D)->value.bool_value
	leaq	.LC70(%rip), %rdi	;, tmp120
	leaq	.LC69(%rip), %rax	;, tmp121
	cmovne	%rax, %rdi	; tmp120,, tmp121, iftmp.2_13
	jmp	.L123	;
.L113:
; src/output.c:555:         case ARG_VOID: tac_output(0, "void"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC74(%rip), %rdi	;, tmp108
	jmp	.L122	;
.L109:
; src/output.c:558:         case ARG_NONE: tac_output(0, "NONE"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC75(%rip), %rdi	;, tmp113
	jmp	.L122	;
.L108:
; src/output.c:559:         default: tac_output(0, "unknown_ArgType: %u", arg->kind); break;
	movq	%rbx, %rdi	; outfile,
	xorl	%esi, %esi	;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	16(%rbp), %ecx	; arg_15(D)->kind, arg_15(D)->kind
	movq	%rbx, %rdi	; outfile,
; src/output.c:562: }
	popq	%r8	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC76(%rip), %rdx	;, tmp115
; src/output.c:562: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/output.c:562: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.size	output_arg, .-output_arg
	.section	.rodata.str1.1
.LC77:
	.string	"NULL"
.LC78:
	.string	"import\n"
.LC79:
	.string	"source: \"%s\"\n"
.LC80:
	.string	"parameters\n"
.LC81:
	.string	"parameters[%d]\n"
.LC82:
	.string	"class\n"
.LC83:
	.string	"members\n"
.LC84:
	.string	"method\n"
.LC85:
	.string	"variable\n"
.LC86:
	.string	"unknown_ClassMemberType: %u\n"
.LC87:
	.string	"unknown_CodeMemberType: %u\n"
	.text
	.globl	output_code
	.type	output_code, @function
output_code:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdx, %rbx	; tmp178, indent
	subq	$72, %rsp	;,
; src/output.c:45:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rdi), %rdi	; code_5(D)->members,
; src/output.c:43: void output_code(Code* code, FILE* outfile, size_t indent, char indent_has_next[32]) {
	movq	%rsi, 8(%rsp)	; tmp177, %sfp
	movq	%rcx, 16(%rsp)	; tmp179, %sfp
; src/output.c:45:     list(CodeMember*) members = list_copy(code->members);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 48(%rsp)	; tmp180, %sfp
.L125:
; src/output.c:47:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	movq	48(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp191, member
; src/output.c:47:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	; member
	je	.L149	;,
; src/output.c:24:     switch (code_member->type) {
	movl	8(%rbp), %eax	; member_9->type, _14
; src/output.c:38:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movq	16(%rsp), %rcx	; %sfp,
; src/output.c:48:         output_code_member(member, outfile, indent + 1, indent_has_next);
	leaq	1(%rbx), %rsi	;, _2
; src/output.c:38:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	xorl	%edx, %edx	;
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:24:     switch (code_member->type) {
	cmpl	$1, %eax	;, _14
	je	.L126	;,
	cmpl	$2, %eax	;, _14
	je	.L127	;,
	testl	%eax, %eax	; _14
	jne	.L128	;,
; src/output.c:26:             ast_output(0, false, "import\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC78(%rip), %rdi	;, tmp134
; src/output.c:27:             output_import(code_member->content.import, outfile, indent + 1, indent_has_next);
	leaq	2(%rbx), %r12	;, _15
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:27:             output_import(code_member->content.import, outfile, indent + 1, indent_has_next);
	movq	0(%rbp), %rbp	; member_9->content.import, _16
; src/output.c:53:     ast_output(0, false, "name\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r12, %rsi	; _15,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC32(%rip), %rdi	;, tmp135
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:54:     output_name(import->name, outfile, indent + 1, indent_has_next);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	3(%rbx), %rdx	;, tmp136
	movq	0(%rbp), %rdi	; _16->name,
	call	output_name	;
; src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r12, %rsi	; _15,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	8(%rbp), %rcx	; _16->source, _24
	testq	%rcx, %rcx	; _24
	jne	.L129	;,
; src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	leaq	.LC77(%rip), %rcx	;, _24
.L129:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rdi	; %sfp,
	leaq	.LC79(%rip), %rdx	;, tmp137
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:57: }
	jmp	.L125	;
.L126:
; src/output.c:30:             ast_output(0, false, "function\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
; src/output.c:31:             output_function(code_member->content.function, outfile, indent + 1, indent_has_next);
	leaq	2(%rbx), %r12	;, _17
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC36(%rip), %rdi	;,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:31:             output_function(code_member->content.function, outfile, indent + 1, indent_has_next);
	movq	0(%rbp), %r14	; member_9->content.function, _18
; src/output.c:60:     ast_output(0, false, "name\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r12, %rsi	; _17,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC81(%rip), %r15	;, tmp174
; src/output.c:60:     ast_output(0, false, "name\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC32(%rip), %rdi	;, tmp139
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:61:     output_name(function->name, outfile, indent + 1, indent_has_next);
	leaq	3(%rbx), %rax	;, _26
	movq	(%r14), %rdi	; _18->name,
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rax, %rdx	; _26,
	movq	%rax, 24(%rsp)	; _26, %sfp
	call	output_name	;
; src/output.c:62:     ast_output(0, false, "return_type\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; _17,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC7(%rip), %rdi	;, tmp140
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:63:     output_name(function->return_type, outfile, indent + 1, indent_has_next);
	movq	8(%r14), %rdi	; _18->return_type, _18->return_type
	movq	16(%rsp), %rcx	; %sfp,
	leaq	3(%rbx), %rdx	;,
	movq	8(%rsp), %rsi	; %sfp,
	call	output_name	;
; src/output.c:64:     ast_output(0, false, "parameters\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; _17,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC80(%rip), %rdi	;, tmp142
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:65:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%r14), %rdi	; _18->parameters, _18->parameters
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:66:     list(Statement*) body = list_copy(function->body);
	movq	24(%r14), %rdi	; _18->body, _18->body
; src/output.c:68:     int index = -1;
	orl	$-1, %r14d	;, index
; src/output.c:65:     list(Variable*) parameters = list_copy(function->parameters);
	movq	%rax, %r13	; tmp181, parameters
; src/output.c:66:     list(Statement*) body = list_copy(function->body);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 32(%rsp)	; tmp182, %sfp
.L131:
; src/output.c:69:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%r13, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; src/output.c:70:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	16(%rsp), %rcx	; %sfp,
; src/output.c:69:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%rax, %rbp	; tmp183, parameter
; src/output.c:69:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	; parameter
	je	.L150	;,
; src/output.c:70:         ast_output(1, false, "parameters[%d]\n", ++index);
	incl	%r14d	; index
; src/output.c:70:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	24(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%edx, %edx	;
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rdi	; %sfp,
	movl	%r14d, %ecx	; index,
	movq	%r15, %rdx	; tmp174,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:71:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rbp, %rdi	; parameter,
	leaq	4(%rbx), %rdx	;, tmp146
	call	output_variable	;
	jmp	.L131	;
.L150:
; src/output.c:73:     ast_output(0, true, "body\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r12, %rsi	; _17,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC48(%rip), %rdi	;, tmp147
	call	*fputs@GOTPCREL(%rip)	;
.L133:
; src/output.c:75:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	32(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp184, statement
; src/output.c:75:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L125	;,
; src/output.c:76:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	16(%rsp), %rcx	; %sfp,
	movq	24(%rsp), %rdx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	call	output_statement	;
	jmp	.L133	;
.L127:
; src/output.c:34:             ast_output(0, false, "class\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC82(%rip), %rdi	;, tmp148
; src/output.c:35:             output_class(code_member->content.class, outfile, indent + 1, indent_has_next);
	leaq	2(%rbx), %r12	;, _19
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:35:             output_class(code_member->content.class, outfile, indent + 1, indent_has_next);
	movq	0(%rbp), %rbp	; member_9->content.class, _20
; src/output.c:119:     ast_output(0, false, "name\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r12, %rsi	; _19,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC32(%rip), %rdi	;,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:120:     output_name(class->name, outfile, indent + 1, indent_has_next);
	leaq	3(%rbx), %rax	;, _38
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	0(%rbp), %rdi	; _20->name,
	movq	%rax, %rdx	; _38,
	movq	%rax, 24(%rsp)	; _38, %sfp
	call	output_name	;
; src/output.c:121:     ast_output(0, true, "members\n");
	movq	16(%rsp), %rcx	; %sfp,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; _19,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC83(%rip), %rdi	;, tmp150
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:122:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rbp), %rdi	; _20->members, _20->members
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 56(%rsp)	; tmp185, %sfp
.L135:
; src/output.c:124:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	movq	56(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp190, member
; src/output.c:124:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	; member
	je	.L125	;,
; src/output.c:102:     switch (class_member->type) {
	movl	8(%r12), %eax	; member_42->type, _43
; src/output.c:102:     switch (class_member->type) {
	testl	%eax, %eax	; _43
	je	.L136	;,
	decl	%eax	; _43
	jne	.L151	;,
; src/output.c:108:             ast_output(0, false, "variable\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	24(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC85(%rip), %rdi	;, tmp162
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:109:             output_variable(class_member->content.variable, outfile, indent + 1, indent_has_next);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	4(%rbx), %rdx	;, tmp163
	movq	(%r12), %rdi	; member_42->content.variable,
	call	output_variable	;
; src/output.c:110:             break;
	jmp	.L135	;
.L136:
; src/output.c:104:             ast_output(0, false, "method\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	24(%rsp), %rsi	; %sfp,
; src/output.c:89:     int index = -1;
	orl	$-1, %r14d	;, index
; src/output.c:104:             ast_output(0, false, "method\n");
	movq	8(%rsp), %rdi	; %sfp,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC81(%rip), %r15	;, tmp172
; src/output.c:104:             ast_output(0, false, "method\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC84(%rip), %rdi	;,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:105:             output_method(class_member->content.method, outfile, indent + 1, indent_has_next);
	movq	(%r12), %r12	; member_42->content.method, _45
	leaq	4(%rbx), %rax	;, _44
; src/output.c:81:     ast_output(0, false, "name\n");
	xorl	%edx, %edx	;
	movq	16(%rsp), %rcx	; %sfp,
	movq	%rax, %rsi	; _44,
; src/output.c:105:             output_method(class_member->content.method, outfile, indent + 1, indent_has_next);
	movq	%rax, 32(%rsp)	; _44, %sfp
; src/output.c:81:     ast_output(0, false, "name\n");
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC32(%rip), %rdi	;,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:82:     output_name(method->name, outfile, indent + 1, indent_has_next);
	leaq	5(%rbx), %rax	;, _49
	movq	(%r12), %rdi	; _45->name,
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rax, %rdx	; _49,
	movq	%rax, 40(%rsp)	; _49, %sfp
	call	output_name	;
; src/output.c:83:     ast_output(0, false, "return_type\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	32(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC7(%rip), %rdi	;, tmp154
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:84:     output_name(method->return_type, outfile, indent + 1, indent_has_next);
	movq	8(%r12), %rdi	; _45->return_type, _45->return_type
	movq	16(%rsp), %rcx	; %sfp,
	leaq	5(%rbx), %rdx	;,
	movq	8(%rsp), %rsi	; %sfp,
	call	output_name	;
; src/output.c:85:     ast_output(0, false, "parameters\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	32(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC80(%rip), %rdi	;, tmp156
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:86:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%r12), %rdi	; _45->parameters, _45->parameters
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:87:     list(Statement*) body = list_copy(method->body);
	movq	24(%r12), %rdi	; _45->body, _45->body
; src/output.c:86:     list(Variable*) parameters = list_copy(method->parameters);
	movq	%rax, %r13	; tmp186, parameters
; src/output.c:87:     list(Statement*) body = list_copy(method->body);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp187, body
.L139:
; src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%r13, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; src/output.c:91:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	16(%rsp), %rcx	; %sfp,
; src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%rax, %rbp	; tmp188, parameter
; src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	; parameter
	je	.L152	;,
; src/output.c:91:         ast_output(1, false, "parameters[%d]\n", ++index);
	incl	%r14d	; index
; src/output.c:91:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	40(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%edx, %edx	;
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rdi	; %sfp,
	movl	%r14d, %ecx	; index,
	movq	%r15, %rdx	; tmp172,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:92:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rbp, %rdi	; parameter,
	leaq	6(%rbx), %rdx	;, tmp160
	call	output_variable	;
	jmp	.L139	;
.L152:
; src/output.c:94:     ast_output(0, true, "body\n");
	movq	32(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC48(%rip), %rdi	;, tmp161
	call	*fputs@GOTPCREL(%rip)	;
.L141:
; src/output.c:96:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r12, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp189, statement
; src/output.c:96:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L135	;,
; src/output.c:97:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	16(%rsp), %rcx	; %sfp,
	movq	40(%rsp), %rdx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	call	output_statement	;
	jmp	.L141	;
.L151:
; src/output.c:112:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movq	16(%rsp), %rcx	; %sfp,
	movq	24(%rsp), %rsi	; %sfp,
	xorl	%edx, %edx	;
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%r12), %ecx	; member_42->type, member_42->type
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%eax, %eax	;
	leaq	.LC86(%rip), %rdx	;, tmp165
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L135	;
.L128:
; src/output.c:38:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%rbp), %ecx	; member_9->type, member_9->type
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%eax, %eax	;
	leaq	.LC87(%rip), %rdx	;, tmp167
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L125	;
.L149:
; src/output.c:50: }
	addq	$72, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	output_code, .-output_code
	.section	.rodata.str1.1
.LC88:
	.string	"TAC: \"NULL\"\n"
.LC89:
	.string	"TAC {\n"
.LC90:
	.string	"designs: []\n"
.LC91:
	.string	"designs: [\n"
.LC92:
	.string	"NULL "
.LC93:
	.string	"%s "
.LC94:
	.string	"%zu "
.LC95:
	.string	"{}\n"
.LC96:
	.string	"{\n"
.LC97:
	.string	"NULL\t"
.LC98:
	.string	"%s\t"
.LC99:
	.string	"%zu\n"
.LC100:
	.string	"}\n"
.LC101:
	.string	"]\n"
.LC102:
	.string	"entry_point: \"NULL\"\n"
.LC103:
	.string	"entry_point: %s\n"
.LC104:
	.string	"global: []\n"
.LC105:
	.string	"global: [\n"
.LC106:
	.string	"subroutines: []\n"
.LC107:
	.string	"subroutines: [\n"
.LC108:
	.string	"NULL {\n"
.LC109:
	.string	"%s {\n"
.LC110:
	.string	"return_type: \"NULL\"\n"
.LC111:
	.string	"return_type: %s\n"
.LC112:
	.string	"parameters: []\n"
.LC113:
	.string	"parameters: [\n"
.LC114:
	.string	"local: []\n"
.LC115:
	.string	"local: [\n"
.LC116:
	.string	"instructions: []\n"
.LC117:
	.string	"instructions: [\n"
.LC118:
	.string	"add\t"
.LC119:
	.string	"sub\t"
.LC120:
	.string	"mul\t"
.LC121:
	.string	"div\t"
.LC122:
	.string	"mod\t"
.LC123:
	.string	"eq \t"
.LC124:
	.string	"ne \t"
.LC125:
	.string	"lt \t"
.LC126:
	.string	"gt \t"
.LC127:
	.string	"le \t"
.LC128:
	.string	"ge \t"
.LC129:
	.string	"and\t"
.LC130:
	.string	"or \t"
.LC131:
	.string	"not\t"
.LC132:
	.string	"assign\t"
.LC133:
	.string	"get_attr\t"
.LC134:
	.string	"get_elem\t"
.LC135:
	.string	"param\t"
.LC136:
	.string	"alloc\t"
.LC137:
	.string	"jmp_c\t"
.LC138:
	.string	"jmp\t"
.LC139:
	.string	"ret\t"
.LC140:
	.string	"call\t"
.LC141:
	.string	"load\t"
.LC142:
	.string	"store\t"
.LC143:
	.string	"INST_NONE\n"
.LC144:
	.string	"unknown_InstructionType: %u\n"
	.text
	.globl	output_TAC
	.type	output_TAC, @function
output_TAC:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdx, %rbx	; tmp287, indent
	subq	$56, %rsp	;,
; src/output.c:420: void output_TAC(TAC* tac, FILE* outfile, size_t indent) {
	movq	%rsi, 8(%rsp)	; tmp286, %sfp
; src/output.c:422:     if (tac == NULL) {
	testq	%rdi, %rdi	; tac
	jne	.L154	;,
; src/output.c:423:         tac_output(indent, "TAC: \"NULL\"\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rdx, %rsi	; indent,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC88(%rip), %rdi	;, tmp161
	jmp	.L246	;
.L154:
	movq	%rdi, %rbp	; tmp285, tac
; src/output.c:427:     tac_output(indent, "TAC {\n");
	movq	%rdx, %rsi	; indent,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC89(%rip), %rdi	;, tmp162
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:428:     if (list_is_empty(tac->attribute_tables))
	movq	0(%rbp), %rdi	; tac_32(D)->attribute_tables,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:429:         tac_output(indent + 1, "designs: []\n");
	leaq	1(%rbx), %rdx	;, _186
	movq	%rdx, 16(%rsp)	; _186, %sfp
; src/output.c:428:     if (list_is_empty(tac->attribute_tables))
	testb	%al, %al	; tmp288
	je	.L155	;,
; src/output.c:429:         tac_output(indent + 1, "designs: []\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rdx, %rsi	; _186,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC90(%rip), %rdi	;, tmp163
	jmp	.L236	;
.L155:
; src/output.c:431:         tac_output(indent + 1, "designs: [\n");
	movq	16(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC91(%rip), %rdi	;, tmp164
.L235:
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:433:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	movq	0(%rbp), %rdi	; tac_32(D)->attribute_tables,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp291, attribute_table
; src/output.c:433:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	testq	%rax, %rax	; attribute_table
	je	.L247	;,
; src/output.c:434:             output_attribute_table(attribute_table, outfile, indent + 2);
	leaq	2(%rbx), %r14	;, _5
; src/output.c:653:     if (attribute_table->name == NULL)
	cmpq	$0, 8(%r12)	;, attribute_table_40->name
; src/output.c:654:         tac_output(indent, "NULL ");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r14, %rsi	; _5,
; src/output.c:653:     if (attribute_table->name == NULL)
	jne	.L158	;,
; src/output.c:654:         tac_output(indent, "NULL ");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC92(%rip), %rdi	;, tmp165
	call	*fputs@GOTPCREL(%rip)	;
	jmp	.L159	;
.L158:
; src/output.c:656:         tac_output(indent, "%s ", attribute_table->name->name);
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:656:         tac_output(indent, "%s ", attribute_table->name->name);
	movq	8(%r12), %rax	; attribute_table_40->name, attribute_table_40->name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rdi	; %sfp,
	leaq	.LC93(%rip), %rdx	;,
	movl	$2, %esi	;,
	movq	8(%rax), %rcx	; _77->name, _77->name
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L159:
; src/output.c:657:     tac_output(0, "%zu ", attribute_table->size);
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%esi, %esi	;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	movq	16(%r12), %rcx	; attribute_table_40->size, attribute_table_40->size
	movq	8(%rsp), %rdi	; %sfp,
	leaq	.LC94(%rip), %rdx	;, tmp170
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:658:     if (list_is_empty(attribute_table->attributes))
	movq	(%r12), %rdi	; attribute_table_40->attributes,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:659:         tac_output(0, "{}\n");
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%esi, %esi	;
; src/output.c:658:     if (list_is_empty(attribute_table->attributes))
	testb	%al, %al	; tmp289
	je	.L160	;,
; src/output.c:659:         tac_output(0, "{}\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC95(%rip), %rdi	;, tmp171
	jmp	.L235	;
.L160:
; src/output.c:661:         tac_output(0, "{\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC98(%rip), %r15	;, tmp283
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC96(%rip), %rdi	;, tmp172
	call	*fputs@GOTPCREL(%rip)	;
.L162:
; src/output.c:663:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	movq	(%r12), %rdi	; attribute_table_40->attributes,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp290, attribute
; src/output.c:663:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	testq	%rax, %rax	; attribute
	je	.L248	;,
; src/output.c:676:     if (attribute->type == NULL)
	cmpq	$0, 8(%r13)	;, attribute_83->type
; src/output.c:677:         tac_output(indent, "NULL\t");
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:664:             output_attribute(attribute, outfile, indent + 1);
	leaq	3(%rbx), %rsi	;, _82
; src/output.c:676:     if (attribute->type == NULL)
	jne	.L163	;,
; src/output.c:677:         tac_output(indent, "NULL\t");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC97(%rip), %rdi	;, tmp173
	call	*fputs@GOTPCREL(%rip)	;
	jmp	.L164	;
.L163:
; src/output.c:679:         tac_output(indent, "%s\t", attribute->type->name);
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:679:         tac_output(indent, "%s\t", attribute->type->name);
	movq	8(%r13), %rax	; attribute_83->type, attribute_83->type
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r15, %rdx	; tmp283,
	movl	$2, %esi	;,
	movq	8(%rax), %rcx	; _86->name, _86->name
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L164:
; src/output.c:681:         tac_output(0, "NULL ");
	xorl	%esi, %esi	;
; src/output.c:680:     if (attribute->var == NULL)
	cmpq	$0, 0(%r13)	;, attribute_83->var
; src/output.c:681:         tac_output(0, "NULL ");
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:680:     if (attribute->var == NULL)
	jne	.L165	;,
; src/output.c:681:         tac_output(0, "NULL ");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC92(%rip), %rdi	;, tmp177
	call	*fputs@GOTPCREL(%rip)	;
	jmp	.L166	;
.L165:
; src/output.c:683:         tac_output(0, "%s ", attribute->var->name);
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:683:         tac_output(0, "%s ", attribute->var->name);
	movq	0(%r13), %rax	; attribute_83->var, attribute_83->var
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rdi	; %sfp,
	leaq	.LC93(%rip), %rdx	;,
	movl	$2, %esi	;,
	movq	8(%rax), %rcx	; _89->name, _89->name
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L166:
; src/output.c:684:     tac_output(0, "%zu\n", attribute->offset);
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%esi, %esi	;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	16(%r13), %rcx	; attribute_83->offset, attribute_83->offset
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%eax, %eax	;
	leaq	.LC99(%rip), %rdx	;, tmp182
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L162	;
.L248:
; src/output.c:665:         tac_output(indent, "}\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r14, %rsi	; _5,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC100(%rip), %rdi	;, tmp183
	jmp	.L235	;
.L247:
; src/output.c:435:         tac_output(indent + 1, "]\n");
	movq	16(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC101(%rip), %rdi	;, tmp184
.L236:
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:437:     if (tac->entry_point == NULL)
	cmpq	$0, 8(%rbp)	;, tac_32(D)->entry_point
; src/output.c:438:         tac_output(indent + 1, "entry_point: \"NULL\"\n");
	movq	16(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:437:     if (tac->entry_point == NULL)
	jne	.L169	;,
; src/output.c:438:         tac_output(indent + 1, "entry_point: \"NULL\"\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC102(%rip), %rdi	;, tmp185
	call	*fputs@GOTPCREL(%rip)	;
	jmp	.L170	;
.L169:
; src/output.c:440:         tac_output(indent + 1, "entry_point: %s\n", tac->entry_point->name);
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:440:         tac_output(indent + 1, "entry_point: %s\n", tac->entry_point->name);
	movq	8(%rbp), %rax	; tac_32(D)->entry_point, tac_32(D)->entry_point
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rdi	; %sfp,
	leaq	.LC103(%rip), %rdx	;, tmp188
	movl	$2, %esi	;,
	movq	8(%rax), %rcx	; _10->name, _10->name
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L170:
; src/output.c:441:     if (list_is_empty(tac->global_vars))
	movq	16(%rbp), %rdi	; tac_32(D)->global_vars, tac_32(D)->global_vars
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:442:         tac_output(indent + 1, "global: []\n");
	movq	16(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:441:     if (list_is_empty(tac->global_vars))
	testb	%al, %al	; tmp292
	je	.L171	;,
; src/output.c:442:         tac_output(indent + 1, "global: []\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC104(%rip), %rdi	;, tmp190
	jmp	.L237	;
.L171:
; src/output.c:444:         tac_output(indent + 1, "global: [\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:447:             output_var(var, outfile, indent + 2);
	leaq	2(%rbx), %r12	;, tmp282
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC105(%rip), %rdi	;, tmp191
	call	*fputs@GOTPCREL(%rip)	;
.L173:
; src/output.c:446:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	movq	16(%rbp), %rdi	; tac_32(D)->global_vars, tac_32(D)->global_vars
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp293, var
; src/output.c:446:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	testq	%rax, %rax	; var
	je	.L249	;,
; src/output.c:447:             output_var(var, outfile, indent + 2);
	movq	8(%rsp), %rsi	; %sfp,
	movq	%r12, %rdx	; tmp282,
	call	output_var	;
	jmp	.L173	;
.L249:
; src/output.c:448:         tac_output(indent + 1, "]\n");
	movq	16(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC101(%rip), %rdi	;, tmp194
.L237:
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:450:     if (list_is_empty(tac->subroutines))
	movq	24(%rbp), %rdi	; tac_32(D)->subroutines, tac_32(D)->subroutines
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:451:         tac_output(indent + 1, "subroutines: []\n");
	movq	16(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:450:     if (list_is_empty(tac->subroutines))
	testb	%al, %al	; tmp294
	je	.L175	;,
; src/output.c:451:         tac_output(indent + 1, "subroutines: []\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC106(%rip), %rdi	;, tmp196
	jmp	.L245	;
.L175:
; src/output.c:453:         tac_output(indent + 1, "subroutines: [\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC107(%rip), %rdi	;, tmp197
.L244:
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:455:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	movq	24(%rbp), %rdi	; tac_32(D)->subroutines, tac_32(D)->subroutines
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp303, subroutine
; src/output.c:455:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	testq	%rax, %rax	; subroutine
	je	.L250	;,
; src/output.c:456:             output_subroutine(subroutine, outfile, indent + 2);
	leaq	2(%rbx), %rax	;, _22
; src/output.c:469:     if (subroutine->name == NULL)
	cmpq	$0, (%r12)	;, subroutine_56->name
; src/output.c:456:             output_subroutine(subroutine, outfile, indent + 2);
	movq	%rax, 32(%rsp)	; _22, %sfp
; src/output.c:469:     if (subroutine->name == NULL)
	jne	.L178	;,
; src/output.c:470:         tac_output(indent, "NULL {\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rax, %rsi	; _22,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC108(%rip), %rdi	;, tmp198
	call	*fputs@GOTPCREL(%rip)	;
	jmp	.L179	;
.L178:
; src/output.c:472:         tac_output(indent, "%s {\n", subroutine->name->name);
	movq	32(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:472:         tac_output(indent, "%s {\n", subroutine->name->name);
	movq	(%r12), %rax	; subroutine_56->name, subroutine_56->name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rdi	; %sfp,
	leaq	.LC109(%rip), %rdx	;,
	movl	$2, %esi	;,
	movq	8(%rax), %rcx	; _93->name, _93->name
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L179:
; src/output.c:664:             output_attribute(attribute, outfile, indent + 1);
	leaq	3(%rbx), %rax	;, _232
; src/output.c:473:     if (subroutine->return_type == NULL)
	cmpq	$0, 8(%r12)	;, subroutine_56->return_type
; src/output.c:664:             output_attribute(attribute, outfile, indent + 1);
	movq	%rax, 24(%rsp)	; _232, %sfp
; src/output.c:473:     if (subroutine->return_type == NULL)
	jne	.L180	;,
; src/output.c:474:         tac_output(indent + 1, "return_type: \"NULL\"\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rax, %rsi	; _232,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC110(%rip), %rdi	;, tmp202
	call	*fputs@GOTPCREL(%rip)	;
	jmp	.L181	;
.L180:
; src/output.c:476:         tac_output(indent + 1, "return_type: %s\n", subroutine->return_type->name);
	movq	24(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:476:         tac_output(indent + 1, "return_type: %s\n", subroutine->return_type->name);
	movq	8(%r12), %rax	; subroutine_56->return_type, subroutine_56->return_type
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rdi	; %sfp,
	leaq	.LC111(%rip), %rdx	;, tmp205
	movl	$2, %esi	;,
	movq	8(%rax), %rcx	; _98->name, _98->name
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L181:
; src/output.c:477:     if (list_is_empty(subroutine->parameters))
	movq	16(%r12), %rdi	; subroutine_56->parameters, subroutine_56->parameters
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:478:         tac_output(indent + 1, "parameters: []\n");
	movq	24(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:477:     if (list_is_empty(subroutine->parameters))
	testb	%al, %al	; tmp295
	je	.L182	;,
; src/output.c:478:         tac_output(indent + 1, "parameters: []\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC112(%rip), %rdi	;, tmp207
	jmp	.L238	;
.L182:
; src/output.c:480:         tac_output(indent + 1, "parameters: [\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:483:             output_var(parameter, outfile, indent + 2);
	leaq	4(%rbx), %r13	;, tmp280
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC113(%rip), %rdi	;, tmp208
	call	*fputs@GOTPCREL(%rip)	;
.L184:
; src/output.c:482:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	movq	16(%r12), %rdi	; subroutine_56->parameters, subroutine_56->parameters
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp296, parameter
; src/output.c:482:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	testq	%rax, %rax	; parameter
	je	.L251	;,
; src/output.c:483:             output_var(parameter, outfile, indent + 2);
	movq	8(%rsp), %rsi	; %sfp,
	movq	%r13, %rdx	; tmp280,
	call	output_var	;
	jmp	.L184	;
.L251:
; src/output.c:484:         tac_output(indent + 1, "]\n");
	movq	24(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC101(%rip), %rdi	;, tmp211
.L238:
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:486:     if (list_is_empty(subroutine->local_vars))
	movq	24(%r12), %rdi	; subroutine_56->local_vars, subroutine_56->local_vars
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:487:         tac_output(indent + 1, "local: []\n");
	movq	24(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:486:     if (list_is_empty(subroutine->local_vars))
	testb	%al, %al	; tmp297
	je	.L186	;,
; src/output.c:487:         tac_output(indent + 1, "local: []\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC114(%rip), %rdi	;, tmp213
	jmp	.L239	;
.L186:
; src/output.c:489:         tac_output(indent + 1, "local: [\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:492:             output_var(var, outfile, indent + 2);
	leaq	4(%rbx), %r13	;, tmp279
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC115(%rip), %rdi	;, tmp214
	call	*fputs@GOTPCREL(%rip)	;
.L188:
; src/output.c:491:         while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
	movq	24(%r12), %rdi	; subroutine_56->local_vars, subroutine_56->local_vars
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp298, var
; src/output.c:491:         while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
	testq	%rax, %rax	; var
	je	.L252	;,
; src/output.c:492:             output_var(var, outfile, indent + 2);
	movq	8(%rsp), %rsi	; %sfp,
	movq	%r13, %rdx	; tmp279,
	call	output_var	;
	jmp	.L188	;
.L252:
; src/output.c:493:         tac_output(indent + 1, "]\n");
	movq	24(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC101(%rip), %rdi	;, tmp217
.L239:
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:495:     if (list_is_empty(subroutine->blocks))
	movq	32(%r12), %rdi	; subroutine_56->blocks, subroutine_56->blocks
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:496:         tac_output(indent + 1, "instructions: []\n");
	movq	24(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:495:     if (list_is_empty(subroutine->blocks))
	testb	%al, %al	; tmp299
	je	.L190	;,
; src/output.c:496:         tac_output(indent + 1, "instructions: []\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC116(%rip), %rdi	;, tmp219
	jmp	.L243	;
.L190:
; src/output.c:498:         tac_output(indent + 1, "instructions: [\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC117(%rip), %rdi	;, tmp220
.L242:
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:500:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	movq	32(%r12), %rdi	; subroutine_56->blocks, subroutine_56->blocks
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp302, block
; src/output.c:500:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	testq	%rax, %rax	; block
	je	.L253	;,
; src/output.c:501:             output_block(block, outfile, indent + 2);
	leaq	4(%rbx), %rax	;, _118
; src/output.c:527:     if (block->label == NULL)
	cmpq	$0, (%r14)	;, block_119->label
; src/output.c:501:             output_block(block, outfile, indent + 2);
	movq	%rax, 40(%rsp)	; _118, %sfp
; src/output.c:527:     if (block->label == NULL)
	jne	.L193	;,
; src/output.c:528:         tac_output(indent, "NULL ");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rax, %rsi	; _118,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC92(%rip), %rdi	;, tmp221
	call	*fputs@GOTPCREL(%rip)	;
	jmp	.L194	;
.L193:
; src/output.c:530:         tac_output(indent, "%s ", block->label->name);
	movq	40(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:530:         tac_output(indent, "%s ", block->label->name);
	movq	(%r14), %rax	; block_119->label, block_119->label
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rdi	; %sfp,
	leaq	.LC93(%rip), %rdx	;,
	movl	$2, %esi	;,
	movq	8(%rax), %rcx	; _122->name, _122->name
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L194:
; src/output.c:531:     if (list_is_empty(block->instructions))
	movq	8(%r14), %rdi	; block_119->instructions, block_119->instructions
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:532:         tac_output(0, "{}\n");
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%esi, %esi	;
; src/output.c:531:     if (list_is_empty(block->instructions))
	testb	%al, %al	; tmp300
	je	.L195	;,
; src/output.c:532:         tac_output(0, "{}\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC95(%rip), %rdi	;, tmp226
	jmp	.L242	;
.L195:
; src/output.c:534:         tac_output(0, "{\n");
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:570:     switch (instruction->type) {
	leaq	.L200(%rip), %r15	;, tmp277
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC96(%rip), %rdi	;, tmp227
	call	*fputs@GOTPCREL(%rip)	;
.L197:
; src/output.c:536:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	movq	8(%r14), %rdi	; block_119->instructions, block_119->instructions
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp301, instruction
; src/output.c:536:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	testq	%rax, %rax	; instruction
	je	.L254	;,
; src/output.c:570:     switch (instruction->type) {
	cmpl	$25, 24(%r13)	;, instruction_127->type
; src/output.c:537:             output_instruction(instruction, outfile, indent + 1);
	leaq	5(%rbx), %rsi	;, _126
; src/output.c:570:     switch (instruction->type) {
	ja	.L198	;,
	movl	24(%r13), %eax	; instruction_127->type, instruction_127->type
; src/output.c:596:         case INST_NONE: tac_output(indent, "INST_NONE\n"); return;
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:570:     switch (instruction->type) {
	movslq	(%r15,%rax,4), %rax	;, tmp231
	addq	%r15, %rax	; tmp277, tmp232
	jmp	*%rax	; tmp232
	.section	.rodata
	.align 4
	.align 4
.L200:
	.long	.L225-.L200
	.long	.L224-.L200
	.long	.L223-.L200
	.long	.L222-.L200
	.long	.L221-.L200
	.long	.L220-.L200
	.long	.L219-.L200
	.long	.L218-.L200
	.long	.L217-.L200
	.long	.L216-.L200
	.long	.L215-.L200
	.long	.L214-.L200
	.long	.L213-.L200
	.long	.L212-.L200
	.long	.L211-.L200
	.long	.L210-.L200
	.long	.L209-.L200
	.long	.L208-.L200
	.long	.L207-.L200
	.long	.L206-.L200
	.long	.L205-.L200
	.long	.L204-.L200
	.long	.L203-.L200
	.long	.L202-.L200
	.long	.L201-.L200
	.long	.L199-.L200
	.text
.L225:
; src/output.c:571:         case INST_ADD: tac_output(indent, "add\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC118(%rip), %rdi	;, tmp234
	jmp	.L240	;
.L224:
; src/output.c:572:         case INST_SUB: tac_output(indent, "sub\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC119(%rip), %rdi	;, tmp235
	jmp	.L240	;
.L223:
; src/output.c:573:         case INST_MUL: tac_output(indent, "mul\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC120(%rip), %rdi	;, tmp236
	jmp	.L240	;
.L222:
; src/output.c:574:         case INST_DIV: tac_output(indent, "div\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC121(%rip), %rdi	;, tmp237
	jmp	.L240	;
.L221:
; src/output.c:575:         case INST_MOD: tac_output(indent, "mod\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC122(%rip), %rdi	;, tmp238
	jmp	.L240	;
.L220:
; src/output.c:576:         case INST_EQ: tac_output(indent, "eq \t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC123(%rip), %rdi	;, tmp239
	jmp	.L240	;
.L219:
; src/output.c:577:         case INST_NE: tac_output(indent, "ne \t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC124(%rip), %rdi	;, tmp240
	jmp	.L240	;
.L218:
; src/output.c:578:         case INST_LT: tac_output(indent, "lt \t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC125(%rip), %rdi	;, tmp241
	jmp	.L240	;
.L217:
; src/output.c:579:         case INST_GT: tac_output(indent, "gt \t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC126(%rip), %rdi	;, tmp242
	jmp	.L240	;
.L216:
; src/output.c:580:         case INST_LE: tac_output(indent, "le \t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC127(%rip), %rdi	;, tmp243
	jmp	.L240	;
.L215:
; src/output.c:581:         case INST_GE: tac_output(indent, "ge \t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC128(%rip), %rdi	;, tmp244
	jmp	.L240	;
.L214:
; src/output.c:582:         case INST_AND: tac_output(indent, "and\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC129(%rip), %rdi	;, tmp245
	jmp	.L240	;
.L213:
; src/output.c:583:         case INST_OR: tac_output(indent, "or \t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC130(%rip), %rdi	;, tmp246
	jmp	.L240	;
.L212:
; src/output.c:584:         case INST_NOT: tac_output(indent, "not\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC131(%rip), %rdi	;, tmp247
	jmp	.L240	;
.L211:
; src/output.c:585:         case INST_ASSIGN: tac_output(indent, "assign\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC132(%rip), %rdi	;, tmp248
	jmp	.L240	;
.L210:
; src/output.c:586:         case INST_GET_ATTR: tac_output(indent, "get_attr\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC133(%rip), %rdi	;, tmp249
	jmp	.L240	;
.L209:
; src/output.c:587:         case INST_GET_ELEM: tac_output(indent, "get_elem\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC134(%rip), %rdi	;, tmp250
	jmp	.L240	;
.L208:
; src/output.c:588:         case INST_PARAM: tac_output(indent, "param\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC135(%rip), %rdi	;, tmp251
	jmp	.L240	;
.L207:
; src/output.c:589:         case INST_ALLOC: tac_output(indent, "alloc\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC136(%rip), %rdi	;, tmp252
	jmp	.L240	;
.L206:
; src/output.c:590:         case INST_JMP_C: tac_output(indent, "jmp_c\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC137(%rip), %rdi	;, tmp253
	jmp	.L240	;
.L205:
; src/output.c:591:         case INST_JMP: tac_output(indent, "jmp\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC138(%rip), %rdi	;, tmp254
	jmp	.L240	;
.L204:
; src/output.c:592:         case INST_RET: tac_output(indent, "ret\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC139(%rip), %rdi	;, tmp255
	jmp	.L240	;
.L203:
; src/output.c:593:         case INST_CALL: tac_output(indent, "call\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC140(%rip), %rdi	;, tmp256
	jmp	.L240	;
.L202:
; src/output.c:594:         case INST_LOAD: tac_output(indent, "load\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC141(%rip), %rdi	;, tmp257
	jmp	.L240	;
.L201:
; src/output.c:595:         case INST_STORE: tac_output(indent, "store\t"); break;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC142(%rip), %rdi	;, tmp258
.L240:
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:602:     output_arg(instruction->arg1, outfile);
	movq	8(%rsp), %rsi	; %sfp,
	movq	0(%r13), %rdi	; instruction_127->arg1,
	call	output_arg	;
; src/output.c:603:     switch (instruction->type) {
	movl	24(%r13), %ecx	; instruction_127->type, _132
; src/output.c:603:     switch (instruction->type) {
	cmpl	$24, %ecx	;, _132
	jbe	.L255	;,
	jmp	.L197	;
.L199:
; src/output.c:596:         case INST_NONE: tac_output(indent, "INST_NONE\n"); return;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC143(%rip), %rdi	;, tmp259
	call	*fputs@GOTPCREL(%rip)	;
	jmp	.L197	;
.L198:
; src/output.c:598:             tac_output(indent, "unknown_InstructionType: %u\n", instruction->type);
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	24(%r13), %ecx	; instruction_127->type, instruction_127->type
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%eax, %eax	;
	leaq	.LC144(%rip), %rdx	;, tmp261
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L197	;
.L255:
	movl	$1, %eax	;, tmp262
	salq	%cl, %rax	; _132, _4
; src/output.c:603:     switch (instruction->type) {
	testl	$4825087, %eax	;, _4
	jne	.L228	;,
	testl	$25583616, %eax	;, _4
	jne	.L229	;,
	testl	$3145728, %eax	;, _4
	jne	.L230	;,
	jmp	.L197	;
.L228:
; src/output.c:621:             tac_output(0, " ");
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%esi, %esi	;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	movl	$32, %edi	;,
	call	*fputc@GOTPCREL(%rip)	;
; src/output.c:622:             output_arg(instruction->arg2, outfile);
	movq	8(%r13), %rdi	; instruction_127->arg2, instruction_127->arg2
	movq	8(%rsp), %rsi	; %sfp,
	call	output_arg	;
; src/output.c:623:             tac_output(0, " ");
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%esi, %esi	;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$32, %edi	;,
	movq	8(%rsp), %rsi	; %sfp,
	call	*fputc@GOTPCREL(%rip)	;
; src/output.c:624:             output_arg(instruction->arg3, outfile);
	movq	16(%r13), %rdi	; instruction_127->arg3, instruction_127->arg3
	jmp	.L241	;
.L229:
; src/output.c:632:             tac_output(0, " ");
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%esi, %esi	;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$32, %edi	;,
	movq	8(%rsp), %rsi	; %sfp,
	call	*fputc@GOTPCREL(%rip)	;
; src/output.c:633:             output_arg(instruction->arg2, outfile);
	movq	8(%r13), %rdi	; instruction_127->arg2, instruction_127->arg2
.L241:
	movq	8(%rsp), %rsi	; %sfp,
	call	output_arg	;
.L230:
; src/output.c:643:     tac_output(0, "\n");
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%esi, %esi	;
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	movl	$10, %edi	;,
	call	*fputc@GOTPCREL(%rip)	;
	jmp	.L197	;
.L254:
; src/output.c:538:         tac_output(indent, "}\n");
	movq	40(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC100(%rip), %rdi	;, tmp270
	jmp	.L242	;
.L253:
; src/output.c:502:         tac_output(indent + 1, "]\n");
	movq	24(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC101(%rip), %rdi	;, tmp272
.L243:
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:504:     tac_output(indent, "}\n");
	movq	32(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC100(%rip), %rdi	;, tmp273
	jmp	.L244	;
.L250:
; src/output.c:457:         tac_output(indent + 1, "]\n");
	movq	16(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC101(%rip), %rdi	;, tmp275
.L245:
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:459:     tac_output(indent, "}\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rsi	; indent,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC100(%rip), %rdi	;, tmp276
.L246:
; src/output.c:461: }
	addq	$56, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fputs@GOTPCREL(%rip)	;
	.size	output_TAC, .-output_TAC
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
