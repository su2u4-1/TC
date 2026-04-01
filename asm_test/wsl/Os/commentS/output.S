	.file	"output.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
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
	.string	"kind: \"parameter\"\n"
.LC12:
	.string	"kind: \"unknown_NameType\"\n"
	.text
	.type	output_name, @function
output_name:
	pushq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC1(%rip), %r15	;, tmp115
; src/output.c:361: void output_name(Symbol* name, FILE* outfile, size_t indent, Parser* parser) {
	pushq	%r14	;
	leaq	1(%rdx), %r14	;, ivtmp.25
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp116, name
	pushq	%rbp	;
	movq	%rcx, %rbp	; tmp119, parser
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp117, outfile
	pushq	%r8	;
.L2:
	leaq	-1(%r14), %r13	;, indent
; src/output.c:364:         ast_output(0, true, "Name pointer: \"NULL\"\n");
	movq	%rbp, %rcx	; parser,
; src/output.c:363:     if (name == NULL) {
	testq	%r12, %r12	; name
	jne	.L3	;,
; src/output.c:364:         ast_output(0, true, "Name pointer: \"NULL\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC0(%rip), %rdi	;, tmp91
	jmp	.L18	;
.L3:
; src/output.c:368:     ast_output(0, false, "name: \"%s\"\n", name->name);
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
; src/output.c:369:     ast_output(0, false, "id: %zu\n", name->id);
	xorl	%edx, %edx	;
	movq	%rbp, %rcx	; parser,
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
; src/output.c:370:     switch (name->kind) {
	cmpl	$6, 32(%r12)	;, name_15->kind
	ja	.L4	;,
	movl	32(%r12), %eax	; name_15->kind, name_15->kind
	leaq	.L6(%rip), %rdx	;, tmp97
; src/output.c:372:             ast_output(0, true, "kind: \"type\"\n");
	movq	%rbp, %rcx	; parser,
; src/output.c:370:     switch (name->kind) {
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
; src/output.c:372:             ast_output(0, true, "kind: \"type\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC3(%rip), %rdi	;, tmp102
	jmp	.L18	;
.L9:
; src/output.c:375:             ast_output(0, false, "kind: \"variable\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	xorl	%edx, %edx	;
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC4(%rip), %rdi	;, tmp103
	jmp	.L16	;
.L11:
; src/output.c:380:             ast_output(0, false, "kind: \"function\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	xorl	%edx, %edx	;
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC6(%rip), %rdi	;, tmp105
	jmp	.L17	;
.L10:
; src/output.c:385:             ast_output(0, false, "kind: \"method\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	xorl	%edx, %edx	;
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC8(%rip), %rdi	;, tmp107
.L17:
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:386:             ast_output(0, true, "return_type\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC7(%rip), %rdi	;, tmp108
	jmp	.L15	;
.L12:
; src/output.c:390:             ast_output(0, true, "kind: \"class\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC9(%rip), %rdi	;, tmp109
	jmp	.L18	;
.L7:
; src/output.c:393:             ast_output(0, false, "kind: \"attribute\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	xorl	%edx, %edx	;
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC10(%rip), %rdi	;, tmp110
.L16:
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:394:             ast_output(0, true, "type\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC5(%rip), %rdi	;, tmp111
.L15:
	call	*fputs@GOTPCREL(%rip)	;
	incq	%r14	; ivtmp.25
; src/output.c:395:             output_name(name->type, outfile, indent + 1, parser);
	movq	(%r12), %r12	; name_15->type, name
	jmp	.L2	;
.L8:
; src/output.c:398:             ast_output(0, false, "kind: \"parameter\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	xorl	%edx, %edx	;
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC11(%rip), %rdi	;, tmp112
	jmp	.L16	;
.L4:
; src/output.c:403:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC12(%rip), %rdi	;, tmp114
.L18:
; src/output.c:407: }
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
; src/output.c:261:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	leaq	.LC13(%rip), %r15	;, op_str
; src/output.c:254: void output_expression(Expression* expression, FILE* outfile, size_t indent, Parser* parser) {
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdx, %r12	; tmp136, indent
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp134, expression
	pushq	%rbx	;
	movq	%rcx, %rbx	; tmp137, parser
	subq	$24, %rsp	;,
; src/output.c:254: void output_expression(Expression* expression, FILE* outfile, size_t indent, Parser* parser) {
	movq	%rsi, 8(%rsp)	; tmp135, %sfp
.L37:
; src/output.c:256:     if (expression->operator == OP_NONE) {
	movl	24(%rbp), %edi	; expression_9->operator, _1
; src/output.c:256:     if (expression->operator == OP_NONE) {
	cmpl	$19, %edi	;, _1
	jne	.L21	;,
; src/output.c:257:         ast_output(0, true, "primary\n");
	movq	%r12, %rsi	; indent,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rcx	; parser,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	addq	$2, %r12	;, indent
	leaq	.LC14(%rip), %rdi	;, tmp98
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:258:         output_primary(expression->prim_left, outfile, indent + 1, parser);
	movq	8(%rbp), %r13	; expression_9->prim_left, primary
; src/output.c:271:     switch (primary->type) {
	leaq	.L25(%rip), %r14	;, tmp131
.L22:
	cmpl	$8, 8(%r13)	;, primary_28->type
	leaq	-1(%r12), %rbp	;, indent
	ja	.L23	;,
	movl	8(%r13), %eax	; primary_28->type, primary_28->type
; src/output.c:308:             ast_output(0, false, "type: \"variable\"\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; indent,
; src/output.c:271:     switch (primary->type) {
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
; src/output.c:273:             ast_output(0, false, "type: \"integer\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC15(%rip), %rdi	;, tmp105
	jmp	.L41	;
.L32:
; src/output.c:277:             ast_output(0, false, "type: \"float\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC17(%rip), %rdi	;, tmp107
.L41:
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:278:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	%rbx, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	0(%r13), %rcx	; primary_28->value.literal_value,
	leaq	.LC16(%rip), %rdx	;, tmp108
.L42:
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:268: }
	addq	$24, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/output.c:268: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
.L31:
; src/output.c:281:             ast_output(0, false, "type: \"string\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC18(%rip), %rdi	;, tmp109
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:282:             ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
	movq	%rbx, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	0(%r13), %rcx	; primary_28->value.literal_value,
	leaq	.LC19(%rip), %rdx	;, tmp110
	jmp	.L42	;
.L30:
; src/output.c:285:             ast_output(0, false, "type: \"boolean\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC20(%rip), %rdi	;, tmp111
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:286:             ast_output(0, true, "value: \"true\"\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rcx	; parser,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC21(%rip), %rdi	;, tmp112
	jmp	.L43	;
.L29:
; src/output.c:289:             ast_output(0, false, "type: \"boolean\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC20(%rip), %rdi	;, tmp113
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:290:             ast_output(0, true, "value: \"false\"\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rcx	; parser,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC22(%rip), %rdi	;, tmp114
.L43:
; src/output.c:268: }
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
; src/output.c:293:             ast_output(0, false, "type: \"expression\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC23(%rip), %rdi	;, tmp115
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:294:             ast_output(0, true, "value\n");
	movq	%rbp, %rsi	; indent,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rcx	; parser,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC24(%rip), %rdi	;, tmp116
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:295:             output_expression(primary->value.expr, outfile, indent + 1, parser);
	movq	0(%r13), %rbp	; primary_28->value.expr, expression
; src/output.c:296:             break;
	jmp	.L37	;
.L27:
; src/output.c:298:             ast_output(0, false, "type: \"!\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC25(%rip), %rdi	;, tmp117
	jmp	.L40	;
.L26:
; src/output.c:303:             ast_output(0, false, "type: \"-\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC26(%rip), %rdi	;, tmp119
.L40:
	call	*fputs@GOTPCREL(%rip)	;
	incq	%r12	; indent
; src/output.c:304:             ast_output(0, true, "value\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC24(%rip), %rdi	;, tmp120
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:305:             output_primary(primary->value.operand, outfile, indent + 1, parser);
	movq	0(%r13), %r13	; primary_28->value.operand, primary
	jmp	.L22	;
.L24:
; src/output.c:308:             ast_output(0, false, "type: \"variable\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC27(%rip), %rdi	;, tmp121
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:309:             ast_output(0, true, "value\n");
	movq	%rbx, %rcx	; parser,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC24(%rip), %rdi	;, tmp122
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:310:             output_variable_access(primary->value.var, outfile, indent + 1, parser);
	movq	0(%r13), %rdi	; primary_28->value.var,
	movq	%rbx, %rcx	; parser,
	movq	%r12, %rdx	; indent,
	movq	8(%rsp), %rsi	; %sfp,
; src/output.c:268: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/output.c:310:             output_variable_access(primary->value.var, outfile, indent + 1, parser);
	jmp	output_variable_access	;
.L23:
; src/output.c:313:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rcx	; parser,
	movq	%rbp, %rsi	; indent,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%r13), %ecx	; primary_28->type, primary_28->type
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%eax, %eax	;
; src/output.c:268: }
	addq	$24, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC28(%rip), %rdx	;, tmp124
	movl	$2, %esi	;,
; src/output.c:268: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
.L21:
; src/output.c:260:         string op_str = operator_to_string(expression->operator);
	call	*operator_to_string@GOTPCREL(%rip)	;
; src/output.c:261:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; indent,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:260:         string op_str = operator_to_string(expression->operator);
	movq	%rax, %r13	; tmp138, op_str
; src/output.c:261:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	%rbx, %rcx	; parser,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:261:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	testq	%r13, %r13	; op_str
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rdi	; %sfp,
	leaq	.LC29(%rip), %rdx	;, tmp125
; src/output.c:261:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	cmove	%r15, %r13	; op_str,, op_str, op_str
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	movq	%r13, %rcx	; op_str,
; src/output.c:263:         output_expression(expression->expr_left, outfile, indent + 1, parser);
	leaq	1(%r12), %r13	;, _4
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:262:         ast_output(0, false, "left\n");
	movq	%rbx, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; indent,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC30(%rip), %rdi	;, tmp126
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:263:         output_expression(expression->expr_left, outfile, indent + 1, parser);
	movq	0(%rbp), %rdi	; expression_9->expr_left,
	movq	%rbx, %rcx	; parser,
	movq	%r13, %rdx	; _4,
	movq	8(%rsp), %rsi	; %sfp,
	call	output_expression	;
; src/output.c:264:         ast_output(0, true, "right\n");
	movq	%r12, %rsi	; indent,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rcx	; parser,
	movl	$1, %edx	;,
; src/output.c:265:         output_expression(expression->right, outfile, indent + 1, parser);
	movq	%r13, %r12	; _4, indent
; src/output.c:264:         ast_output(0, true, "right\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC31(%rip), %rdi	;, tmp127
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:265:         output_expression(expression->right, outfile, indent + 1, parser);
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
; src/output.c:128:     ast_output(0, false, "type\n");
	xorl	%edx, %edx	;
; src/output.c:126: void output_variable(Variable* variable, FILE* outfile, size_t indent, Parser* parser) {
	pushq	%rbp	;
; src/output.c:129:     output_name(variable->type, outfile, indent + 1, parser);
	leaq	1(%r12), %r14	;, _1
; src/output.c:126: void output_variable(Variable* variable, FILE* outfile, size_t indent, Parser* parser) {
	movq	%rcx, %rbp	; tmp100, parser
	pushq	%rbx	;
; src/output.c:126: void output_variable(Variable* variable, FILE* outfile, size_t indent, Parser* parser) {
	movq	%rsi, %rbx	; tmp98, outfile
; src/output.c:128:     ast_output(0, false, "type\n");
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC5(%rip), %rdi	;, tmp91
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:129:     output_name(variable->type, outfile, indent + 1, parser);
	movq	0(%r13), %rdi	; variable_12(D)->type,
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _1,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:130:     ast_output(0, false, "name\n");
	xorl	%edx, %edx	;
	movq	%rbp, %rcx	; parser,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC32(%rip), %rdi	;, tmp92
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:131:     output_name(variable->name, outfile, indent + 1, parser);
	movq	8(%r13), %rdi	; variable_12(D)->name, variable_12(D)->name
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _1,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:132:     if (variable->value != NULL) {
	cmpq	$0, 16(%r13)	;, variable_12(D)->value
; src/output.c:133:         ast_output(0, true, "value\n");
	movq	%rbp, %rcx	; parser,
	movq	%r12, %rsi	; indent,
	movl	$1, %edx	;,
	movq	%rbx, %rdi	; outfile,
; src/output.c:132:     if (variable->value != NULL) {
	je	.L45	;,
; src/output.c:133:         ast_output(0, true, "value\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC24(%rip), %rdi	;, tmp94
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:134:         output_expression(variable->value, outfile, indent + 1, parser);
	movq	16(%r13), %rdi	; variable_12(D)->value, variable_12(D)->value
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _1,
	movq	%rbx, %rsi	; outfile,
; src/output.c:138: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; src/output.c:134:         output_expression(variable->value, outfile, indent + 1, parser);
	jmp	output_expression	;
.L45:
; src/output.c:136:         ast_output(0, true, "value: \"NULL\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC33(%rip), %rdi	;, tmp96
; src/output.c:138: }
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
; src/output.c:322:     switch (variable_access->type) {
	movl	16(%rdi), %eax	; variable_access_19(D)->type, _1
; src/output.c:318: void output_variable_access(VariableAccess* variable_access, FILE* outfile, size_t indent, Parser* parser) {
	movq	%rsi, (%rsp)	; tmp126, %sfp
	movq	%rcx, 8(%rsp)	; tmp128, %sfp
; src/output.c:322:     switch (variable_access->type) {
	cmpl	$2, %eax	;, _1
	je	.L48	;,
	ja	.L49	;,
	testl	%eax, %eax	; _1
	leaq	1(%rdx), %r14	;, _5
	jne	.L57	;,
; src/output.c:324:             ast_output(0, false, "type: \"name\"\n");
	movq	8(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC34(%rip), %rdi	;, tmp103
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:325:             ast_output(0, true, "name\n");
	movq	8(%rsp), %rcx	; %sfp,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC32(%rip), %rdi	;, tmp104
	movq	(%rsp), %rsi	; %sfp,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:326:             output_name(variable_access->content.name, outfile, indent + 1, parser);
	movq	8(%r13), %rdi	; variable_access_19(D)->content.name, variable_access_19(D)->content.name
	movq	8(%rsp), %rcx	; %sfp,
	movq	%r14, %rdx	; _5,
	jmp	.L61	;
.L49:
; src/output.c:322:     switch (variable_access->type) {
	cmpl	$3, %eax	;, _1
	jne	.L62	;,
; src/output.c:342:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movq	8(%rsp), %rcx	; %sfp,
; src/output.c:344:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	leaq	1(%rbp), %r12	;, _8
; src/output.c:342:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movq	(%rsp), %rdi	; %sfp,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; indent,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC39(%rip), %rdi	;, tmp113
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:343:             ast_output(0, false, "sequence\n");
	movq	8(%rsp), %rcx	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; indent,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC40(%rip), %rdi	;, tmp114
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:344:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	movq	(%rsp), %rsi	; %sfp,
	movq	0(%r13), %rdi	; variable_access_19(D)->base,
	movq	%r12, %rdx	; _8,
	movq	8(%rsp), %rcx	; %sfp,
	call	output_variable_access	;
; src/output.c:345:             ast_output(0, true, "index\n");
	movq	8(%rsp), %rcx	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC41(%rip), %rdi	;, tmp115
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:346:             output_expression(variable_access->content.index, outfile, indent + 1, parser);
	movq	8(%r13), %rdi	; variable_access_19(D)->content.index, variable_access_19(D)->content.index
	movq	(%rsp), %rsi	; %sfp,
	movq	%r12, %rdx	; _8,
	movq	8(%rsp), %rcx	; %sfp,
; src/output.c:360: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/output.c:346:             output_expression(variable_access->content.index, outfile, indent + 1, parser);
	jmp	output_expression	;
.L57:
; src/output.c:329:             args = list_copy(variable_access->content.args);
	movq	8(%rdi), %rdi	; variable_access_19(D)->content.args, variable_access_19(D)->content.args
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC38(%rip), %r15	;, tmp124
; src/output.c:329:             args = list_copy(variable_access->content.args);
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:330:             ast_output(0, false, "type: \"function_call\"\n");
	movq	8(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	(%rsp), %rdi	; %sfp,
; src/output.c:329:             args = list_copy(variable_access->content.args);
	movq	%rax, %r12	; tmp129, args
; src/output.c:330:             ast_output(0, false, "type: \"function_call\"\n");
	movq	%rbp, %rsi	; indent,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC35(%rip), %rdi	;, tmp108
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:331:             ast_output(0, false, "function\n");
	movq	8(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC36(%rip), %rdi	;, tmp109
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:332:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	movq	0(%r13), %rdi	; variable_access_19(D)->base,
	movq	(%rsp), %rsi	; %sfp,
	movq	%r14, %rdx	; _5,
	movq	8(%rsp), %rcx	; %sfp,
; src/output.c:335:             index = -1;
	orl	$-1, %r13d	;, index
; src/output.c:332:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	call	output_variable_access	;
; src/output.c:333:             ast_output(0, true, "arguments\n");
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
; src/output.c:336:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	movq	%r12, %rdi	; args,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp130, arg
; src/output.c:336:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	; arg
	je	.L63	;,
; src/output.c:337:                 ast_output(1, false, "arguments[%d]\n", ++index);
	incl	%r13d	; index
; src/output.c:337:                 ast_output(1, false, "arguments[%d]\n", ++index);
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
; src/output.c:338:                 output_expression(arg, outfile, indent + 2, parser);
	movq	(%rsp), %rsi	; %sfp,
	leaq	2(%rbp), %rdx	;, tmp112
	movq	%rbx, %rdi	; arg,
	movq	8(%rsp), %rcx	; %sfp,
	call	output_expression	;
	jmp	.L54	;
.L48:
; src/output.c:349:             ast_output(0, false, "type: \"get_attribute\"\n");
	movq	8(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:351:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	leaq	1(%rbp), %r12	;, _11
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC42(%rip), %rdi	;, tmp117
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:350:             ast_output(0, false, "object\n");
	movq	8(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC43(%rip), %rdi	;, tmp118
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:351:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	movq	(%rsp), %rsi	; %sfp,
	movq	0(%r13), %rdi	; variable_access_19(D)->base,
	movq	%r12, %rdx	; _11,
	movq	8(%rsp), %rcx	; %sfp,
	call	output_variable_access	;
; src/output.c:352:             ast_output(0, true, "attribute_name\n");
	movq	8(%rsp), %rcx	; %sfp,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC44(%rip), %rdi	;, tmp119
	movq	(%rsp), %rsi	; %sfp,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:353:             output_name(variable_access->content.attr_name, outfile, indent + 1, parser);
	movq	8(%r13), %rdi	; variable_access_19(D)->content.attr_name, variable_access_19(D)->content.attr_name
	movq	8(%rsp), %rcx	; %sfp,
	movq	%r12, %rdx	; _11,
.L61:
	movq	(%rsp), %rsi	; %sfp,
; src/output.c:360: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/output.c:353:             output_name(variable_access->content.attr_name, outfile, indent + 1, parser);
	jmp	output_name	;
.L62:
; src/output.c:356:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movq	8(%rsp), %rcx	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	16(%r13), %ecx	; variable_access_19(D)->type, variable_access_19(D)->type
	movq	(%rsp), %rdi	; %sfp,
	xorl	%eax, %eax	;
; src/output.c:360: }
	addq	$24, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC45(%rip), %rdx	;, tmp122
	movl	$2, %esi	;,
; src/output.c:360: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
.L63:
; src/output.c:360: }
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
; src/output.c:141:     switch (statement->type) {
	cmpl	$7, 8(%rdi)	;, statement_19(D)->type
; src/output.c:139: void output_statement(Statement* statement, FILE* outfile, size_t indent, Parser* parser) {
	movq	%rsi, 8(%rsp)	; tmp189, %sfp
	movq	%rcx, 16(%rsp)	; tmp191, %sfp
; src/output.c:141:     switch (statement->type) {
	ja	.L65	;,
	movl	8(%rdi), %eax	; statement_19(D)->type, statement_19(D)->type
	leaq	.L67(%rip), %rdx	;, tmp137
; src/output.c:171:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movq	16(%rsp), %rcx	; %sfp,
	movq	%rbx, %rsi	; indent,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:141:     switch (statement->type) {
	movslq	(%rdx,%rax,4), %rax	;, tmp139
	addq	%rdx, %rax	; tmp137, tmp140
; src/output.c:171:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	xorl	%edx, %edx	;
; src/output.c:141:     switch (statement->type) {
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
; src/output.c:143:             ast_output(0, false, "if_statement\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
; src/output.c:144:             output_if(statement->stmt.if_stmt, outfile, indent + 1, parser);
	leaq	1(%rbx), %rbp	;, _2
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC46(%rip), %rdi	;, tmp142
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:144:             output_if(statement->stmt.if_stmt, outfile, indent + 1, parser);
	movq	(%r12), %r15	; statement_19(D)->stmt.if_stmt, _3
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC47(%rip), %r14	;, tmp146
; src/output.c:190:     list(Statement*) body = list_copy(if_->body);
	movq	8(%r15), %rdi	; _3->body, _3->body
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:191:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	movq	16(%r15), %rdi	; _3->else_if, _3->else_if
; src/output.c:190:     list(Statement*) body = list_copy(if_->body);
	movq	%rax, %r13	; tmp192, body
; src/output.c:191:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:192:     list(Statement*) else_body = list_copy(if_->else_body);
	movq	24(%r15), %rdi	; _3->else_body, _3->else_body
; src/output.c:191:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	movq	%rax, %r12	; tmp193, else_if_list
; src/output.c:192:     list(Statement*) else_body = list_copy(if_->else_body);
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:193:     ast_output(0, false, "condition\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; _2,
; src/output.c:192:     list(Statement*) else_body = list_copy(if_->else_body);
	movq	%rax, 40(%rsp)	; tmp194, %sfp
; src/output.c:193:     ast_output(0, false, "condition\n");
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%r14, %rdi	; tmp146,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:194:     output_expression(if_->condition, outfile, indent + 1, parser);
	leaq	2(%rbx), %rax	;, _57
	movq	(%r15), %rdi	; _3->condition,
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rax, %rdx	; _57,
	movq	%rax, 24(%rsp)	; _57, %sfp
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC48(%rip), %r15	;, tmp147
; src/output.c:194:     output_expression(if_->condition, outfile, indent + 1, parser);
	call	output_expression	;
; src/output.c:195:     ast_output(0, false, "body\n");
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
; src/output.c:197:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r13, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
; src/output.c:198:         output_statement(statement, outfile, indent + 1, parser);
	movq	16(%rsp), %rcx	; %sfp,
; src/output.c:197:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rax, %rdi	; tmp195, statement
; src/output.c:197:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L100	;,
; src/output.c:198:         output_statement(statement, outfile, indent + 1, parser);
	movq	24(%rsp), %rdx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	call	output_statement	;
	jmp	.L75	;
.L100:
; src/output.c:199:     ast_output(0, false, "else_if\n");
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; _2,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC49(%rip), %rdi	;, tmp148
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:212:     output_expression(else_if->condition, outfile, indent + 1, parser);
	leaq	3(%rbx), %rax	;, _64
	movq	%rax, 32(%rsp)	; _64, %sfp
.L77:
; src/output.c:201:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	movq	%r12, %rdi	; else_if_list,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp198, else_if
; src/output.c:201:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	testq	%rax, %rax	; else_if
	je	.L101	;,
; src/output.c:210:     list(Statement*) body = list_copy(else_if->body);
	movq	8(%r13), %rdi	; else_if_60->body, else_if_60->body
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:211:     ast_output(0, false, "condition\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	24(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:210:     list(Statement*) body = list_copy(else_if->body);
	movq	%rax, %rbx	; tmp196, body
; src/output.c:211:     ast_output(0, false, "condition\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%r14, %rdi	; tmp146,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:212:     output_expression(else_if->condition, outfile, indent + 1, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	32(%rsp), %rdx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	0(%r13), %rdi	; else_if_60->condition,
	call	output_expression	;
; src/output.c:213:     ast_output(0, true, "body\n");
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
; src/output.c:215:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbx, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp197, statement
; src/output.c:215:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L77	;,
; src/output.c:216:         output_statement(statement, outfile, indent + 1, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	32(%rsp), %rdx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	call	output_statement	;
	jmp	.L78	;
.L101:
; src/output.c:203:     ast_output(0, true, "else_body\n");
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
; src/output.c:204:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	movq	40(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp199, statement
; src/output.c:204:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L64	;,
; src/output.c:205:         output_statement(statement, outfile, indent + 1, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	24(%rsp), %rdx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	call	output_statement	;
	jmp	.L81	;
.L70:
; src/output.c:147:             ast_output(0, false, "for_statement\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC51(%rip), %rdi	;, tmp153
; src/output.c:148:             output_for(statement->stmt.for_stmt, outfile, indent + 1, parser);
	leaq	1(%rbx), %rbp	;, _4
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:148:             output_for(statement->stmt.for_stmt, outfile, indent + 1, parser);
	movq	(%r12), %r12	; statement_19(D)->stmt.for_stmt, _5
; src/output.c:221:     list(Statement*) body = list_copy(for_->body);
	movq	24(%r12), %rdi	; _5->body, _5->body
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:223:         ast_output(0, false, "initializer\n");
	xorl	%edx, %edx	;
; src/output.c:222:     if (for_->initializer != NULL) {
	cmpq	$0, (%r12)	;, _5->initializer
; src/output.c:223:         ast_output(0, false, "initializer\n");
	movq	%rbp, %rsi	; _4,
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:221:     list(Statement*) body = list_copy(for_->body);
	movq	%rax, %r13	; tmp200, body
; src/output.c:222:     if (for_->initializer != NULL) {
	je	.L84	;,
; src/output.c:223:         ast_output(0, false, "initializer\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC52(%rip), %rdi	;, tmp155
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:224:         output_variable(for_->initializer, outfile, indent + 1, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	2(%rbx), %rdx	;, tmp156
	movq	(%r12), %rdi	; _5->initializer,
	call	output_variable	;
	jmp	.L85	;
.L84:
; src/output.c:226:         ast_output(0, false, "initializer: \"NULL\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC53(%rip), %rdi	;, tmp157
	call	*fputs@GOTPCREL(%rip)	;
.L85:
; src/output.c:228:         ast_output(0, false, "condition\n");
	xorl	%edx, %edx	;
; src/output.c:227:     if (for_->condition != NULL) {
	cmpq	$0, 8(%r12)	;, _5->condition
; src/output.c:228:         ast_output(0, false, "condition\n");
	movq	16(%rsp), %rcx	; %sfp,
	movq	%rbp, %rsi	; _4,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:227:     if (for_->condition != NULL) {
	je	.L86	;,
; src/output.c:228:         ast_output(0, false, "condition\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC47(%rip), %rdi	;, tmp158
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:229:         output_expression(for_->condition, outfile, indent + 1, parser);
	movq	8(%r12), %rdi	; _5->condition, _5->condition
	movq	16(%rsp), %rcx	; %sfp,
	leaq	2(%rbx), %rdx	;, tmp159
	movq	8(%rsp), %rsi	; %sfp,
	call	output_expression	;
	jmp	.L87	;
.L86:
; src/output.c:231:         ast_output(0, false, "condition: \"NULL\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC54(%rip), %rdi	;, tmp161
	call	*fputs@GOTPCREL(%rip)	;
.L87:
; src/output.c:233:         ast_output(0, false, "increment\n");
	xorl	%edx, %edx	;
; src/output.c:232:     if (for_->increment != NULL) {
	cmpq	$0, 16(%r12)	;, _5->increment
; src/output.c:233:         ast_output(0, false, "increment\n");
	movq	16(%rsp), %rcx	; %sfp,
	movq	%rbp, %rsi	; _4,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:232:     if (for_->increment != NULL) {
	je	.L88	;,
; src/output.c:233:         ast_output(0, false, "increment\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC55(%rip), %rdi	;, tmp162
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:234:         output_expression(for_->increment, outfile, indent + 1, parser);
	movq	16(%r12), %rdi	; _5->increment, _5->increment
	movq	16(%rsp), %rcx	; %sfp,
	leaq	2(%rbx), %rdx	;, tmp163
	movq	8(%rsp), %rsi	; %sfp,
	call	output_expression	;
	jmp	.L89	;
.L88:
; src/output.c:236:         ast_output(0, false, "increment: \"NULL\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC56(%rip), %rdi	;, tmp165
	call	*fputs@GOTPCREL(%rip)	;
.L89:
; src/output.c:237:     ast_output(0, true, "body\n");
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; _4,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:240:         output_statement(statement, outfile, indent + 1, parser);
	addq	$2, %rbx	;, tmp187
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC48(%rip), %rdi	;, tmp166
	call	*fputs@GOTPCREL(%rip)	;
.L90:
; src/output.c:239:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r13, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp201, statement
; src/output.c:239:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L64	;,
; src/output.c:240:         output_statement(statement, outfile, indent + 1, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rbx, %rdx	; tmp187,
	call	output_statement	;
	jmp	.L90	;
.L71:
; src/output.c:151:             ast_output(0, false, "while_statement\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC57(%rip), %rdi	;, tmp168
; src/output.c:152:             output_while(statement->stmt.while_stmt, outfile, indent + 1, parser);
	leaq	1(%rbx), %r13	;, _6
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:152:             output_while(statement->stmt.while_stmt, outfile, indent + 1, parser);
	movq	(%r12), %r12	; statement_19(D)->stmt.while_stmt, _7
; src/output.c:247:     output_expression(while_->condition, outfile, indent + 1, parser);
	addq	$2, %rbx	;, _82
; src/output.c:245:     list(Statement*) body = list_copy(while_->body);
	movq	8(%r12), %rdi	; _7->body, _7->body
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:246:     ast_output(0, false, "condition\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	%r13, %rsi	; _6,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:245:     list(Statement*) body = list_copy(while_->body);
	movq	%rax, %rbp	; tmp202, body
; src/output.c:246:     ast_output(0, false, "condition\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC47(%rip), %rdi	;, tmp170
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:247:     output_expression(while_->condition, outfile, indent + 1, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rbx, %rdx	; _82,
	movq	(%r12), %rdi	; _7->condition,
	call	output_expression	;
; src/output.c:248:     ast_output(0, true, "body\n");
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
; src/output.c:250:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbp, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp203, statement
; src/output.c:250:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L64	;,
; src/output.c:251:         output_statement(statement, outfile, indent + 1, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rbx, %rdx	; _82,
	call	output_statement	;
	jmp	.L93	;
.L73:
; src/output.c:155:             ast_output(0, false, "variable_declaration_statement\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC58(%rip), %rdi	;, tmp172
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:156:             output_variable(statement->stmt.var, outfile, indent + 1, parser);
	movq	(%r12), %rdi	; statement_19(D)->stmt.var,
	movq	16(%rsp), %rcx	; %sfp,
	leaq	1(%rbx), %rdx	;, tmp173
	movq	8(%rsp), %rsi	; %sfp,
; src/output.c:187: }
	addq	$56, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/output.c:156:             output_variable(statement->stmt.var, outfile, indent + 1, parser);
	jmp	output_variable	;
.L69:
; src/output.c:159:             if (statement->stmt.expr == NULL) {
	cmpq	$0, (%r12)	;, statement_19(D)->stmt.expr
	jne	.L95	;,
; src/output.c:160:                 ast_output(0, false, "return_statement: \"NULL\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC59(%rip), %rdi	;, tmp174
	jmp	.L98	;
.L95:
; src/output.c:164:             ast_output(0, false, "return_statement\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC60(%rip), %rdi	;, tmp175
	jmp	.L99	;
.L68:
; src/output.c:168:             ast_output(0, false, "break_statement: \"NULL\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC61(%rip), %rdi	;, tmp177
.L98:
; src/output.c:187: }
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
; src/output.c:171:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC62(%rip), %rdi	;, tmp178
	jmp	.L98	;
.L74:
; src/output.c:174:             if (statement->stmt.expr == NULL) {
	cmpq	$0, (%r12)	;, statement_19(D)->stmt.expr
	jne	.L96	;,
; src/output.c:175:                 ast_output(0, false, "expression_statement: \"NULL\"\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC63(%rip), %rdi	;, tmp179
	jmp	.L98	;
.L96:
; src/output.c:179:             ast_output(0, false, "expression_statement\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC64(%rip), %rdi	;, tmp180
.L99:
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:180:             output_expression(statement->stmt.expr, outfile, indent + 1, parser);
	movq	(%r12), %rdi	; statement_19(D)->stmt.expr,
	movq	16(%rsp), %rcx	; %sfp,
	leaq	1(%rbx), %rdx	;, tmp181
	movq	8(%rsp), %rsi	; %sfp,
; src/output.c:187: }
	addq	$56, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/output.c:180:             output_expression(statement->stmt.expr, outfile, indent + 1, parser);
	jmp	output_expression	;
.L65:
; src/output.c:183:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rsi	; indent,
	xorl	%edx, %edx	;
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%r12), %ecx	; statement_19(D)->type, statement_19(D)->type
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:187: }
	addq	$56, %rsp	;,
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC65(%rip), %rdx	;, tmp183
; src/output.c:187: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
; src/output.c:187: }
	popq	%r12	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
; src/output.c:187: }
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
.L64:
; src/output.c:187: }
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
	.string	"NULL"
.LC67:
	.string	"import\n"
.LC68:
	.string	"source: \"%s\"\n"
.LC69:
	.string	"parameters\n"
.LC70:
	.string	"parameters[%d]\n"
.LC71:
	.string	"class\n"
.LC72:
	.string	"members\n"
.LC73:
	.string	"method\n"
.LC74:
	.string	"variable\n"
.LC75:
	.string	"unknown_ClassMemberType: %u\n"
.LC76:
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
; src/output.c:43:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rdi), %rdi	; code_5(D)->members,
; src/output.c:41: void output_code(Code* code, FILE* outfile, size_t indent, Parser* parser) {
	movq	%rsi, 8(%rsp)	; tmp177, %sfp
	movq	%rcx, 16(%rsp)	; tmp179, %sfp
; src/output.c:43:     list(CodeMember*) members = list_copy(code->members);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 48(%rsp)	; tmp180, %sfp
.L103:
; src/output.c:45:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	movq	48(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp191, member
; src/output.c:45:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	; member
	je	.L127	;,
; src/output.c:22:     switch (code_member->type) {
	movl	8(%rbp), %eax	; member_9->type, _14
; src/output.c:36:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movq	16(%rsp), %rcx	; %sfp,
; src/output.c:46:         output_code_member(member, outfile, indent + 1, parser);
	leaq	1(%rbx), %rsi	;, _2
; src/output.c:36:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	xorl	%edx, %edx	;
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:22:     switch (code_member->type) {
	cmpl	$1, %eax	;, _14
	je	.L104	;,
	cmpl	$2, %eax	;, _14
	je	.L105	;,
	testl	%eax, %eax	; _14
	jne	.L106	;,
; src/output.c:24:             ast_output(0, false, "import\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC67(%rip), %rdi	;, tmp134
; src/output.c:25:             output_import(code_member->content.import, outfile, indent + 1, parser);
	leaq	2(%rbx), %r12	;, _15
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:25:             output_import(code_member->content.import, outfile, indent + 1, parser);
	movq	0(%rbp), %rbp	; member_9->content.import, _16
; src/output.c:51:     ast_output(0, false, "name\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r12, %rsi	; _15,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC32(%rip), %rdi	;, tmp135
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:52:     output_name(import->name, outfile, indent + 1, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	3(%rbx), %rdx	;, tmp136
	movq	0(%rbp), %rdi	; _16->name,
	call	output_name	;
; src/output.c:53:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r12, %rsi	; _15,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:53:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	8(%rbp), %rcx	; _16->source, _24
	testq	%rcx, %rcx	; _24
	jne	.L107	;,
; src/output.c:53:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	leaq	.LC66(%rip), %rcx	;, _24
.L107:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rdi	; %sfp,
	leaq	.LC68(%rip), %rdx	;, tmp137
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:55: }
	jmp	.L103	;
.L104:
; src/output.c:28:             ast_output(0, false, "function\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
; src/output.c:29:             output_function(code_member->content.function, outfile, indent + 1, parser);
	leaq	2(%rbx), %r12	;, _17
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC36(%rip), %rdi	;,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:29:             output_function(code_member->content.function, outfile, indent + 1, parser);
	movq	0(%rbp), %r14	; member_9->content.function, _18
; src/output.c:58:     ast_output(0, false, "name\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r12, %rsi	; _17,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC70(%rip), %r15	;, tmp174
; src/output.c:58:     ast_output(0, false, "name\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC32(%rip), %rdi	;, tmp139
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:59:     output_name(function->name, outfile, indent + 1, parser);
	leaq	3(%rbx), %rax	;, _26
	movq	(%r14), %rdi	; _18->name,
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rax, %rdx	; _26,
	movq	%rax, 24(%rsp)	; _26, %sfp
	call	output_name	;
; src/output.c:60:     ast_output(0, false, "return_type\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; _17,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC7(%rip), %rdi	;, tmp140
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:61:     output_name(function->return_type, outfile, indent + 1, parser);
	movq	8(%r14), %rdi	; _18->return_type, _18->return_type
	movq	16(%rsp), %rcx	; %sfp,
	leaq	3(%rbx), %rdx	;,
	movq	8(%rsp), %rsi	; %sfp,
	call	output_name	;
; src/output.c:62:     ast_output(0, false, "parameters\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; _17,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC69(%rip), %rdi	;, tmp142
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:63:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%r14), %rdi	; _18->parameters, _18->parameters
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:64:     list(Statement*) body = list_copy(function->body);
	movq	24(%r14), %rdi	; _18->body, _18->body
; src/output.c:66:     int index = -1;
	orl	$-1, %r14d	;, index
; src/output.c:63:     list(Variable*) parameters = list_copy(function->parameters);
	movq	%rax, %r13	; tmp181, parameters
; src/output.c:64:     list(Statement*) body = list_copy(function->body);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 32(%rsp)	; tmp182, %sfp
.L109:
; src/output.c:67:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%r13, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; src/output.c:68:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	16(%rsp), %rcx	; %sfp,
; src/output.c:67:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%rax, %rbp	; tmp183, parameter
; src/output.c:67:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	; parameter
	je	.L128	;,
; src/output.c:68:         ast_output(1, false, "parameters[%d]\n", ++index);
	incl	%r14d	; index
; src/output.c:68:         ast_output(1, false, "parameters[%d]\n", ++index);
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
; src/output.c:69:         output_variable(parameter, outfile, indent + 2, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rbp, %rdi	; parameter,
	leaq	4(%rbx), %rdx	;, tmp146
	call	output_variable	;
	jmp	.L109	;
.L128:
; src/output.c:71:     ast_output(0, true, "body\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r12, %rsi	; _17,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC48(%rip), %rdi	;, tmp147
	call	*fputs@GOTPCREL(%rip)	;
.L111:
; src/output.c:73:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	32(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp184, statement
; src/output.c:73:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L103	;,
; src/output.c:74:         output_statement(statement, outfile, indent + 1, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	24(%rsp), %rdx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	call	output_statement	;
	jmp	.L111	;
.L105:
; src/output.c:32:             ast_output(0, false, "class\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC71(%rip), %rdi	;, tmp148
; src/output.c:33:             output_class(code_member->content.class, outfile, indent + 1, parser);
	leaq	2(%rbx), %r12	;, _19
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:33:             output_class(code_member->content.class, outfile, indent + 1, parser);
	movq	0(%rbp), %rbp	; member_9->content.class, _20
; src/output.c:117:     ast_output(0, false, "name\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r12, %rsi	; _19,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC32(%rip), %rdi	;,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:118:     output_name(class->name, outfile, indent + 1, parser);
	leaq	3(%rbx), %rax	;, _38
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	0(%rbp), %rdi	; _20->name,
	movq	%rax, %rdx	; _38,
	movq	%rax, 24(%rsp)	; _38, %sfp
	call	output_name	;
; src/output.c:119:     ast_output(0, true, "members\n");
	movq	16(%rsp), %rcx	; %sfp,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; _19,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC72(%rip), %rdi	;, tmp150
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:120:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rbp), %rdi	; _20->members, _20->members
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 56(%rsp)	; tmp185, %sfp
.L113:
; src/output.c:122:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	movq	56(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp190, member
; src/output.c:122:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	; member
	je	.L103	;,
; src/output.c:100:     switch (class_member->type) {
	movl	8(%r12), %eax	; member_42->type, _43
; src/output.c:100:     switch (class_member->type) {
	testl	%eax, %eax	; _43
	je	.L114	;,
	decl	%eax	; _43
	jne	.L129	;,
; src/output.c:106:             ast_output(0, false, "variable\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	24(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC74(%rip), %rdi	;, tmp162
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:107:             output_variable(class_member->content.variable, outfile, indent + 1, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	4(%rbx), %rdx	;, tmp163
	movq	(%r12), %rdi	; member_42->content.variable,
	call	output_variable	;
; src/output.c:108:             break;
	jmp	.L113	;
.L114:
; src/output.c:102:             ast_output(0, false, "method\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	24(%rsp), %rsi	; %sfp,
; src/output.c:87:     int index = -1;
	orl	$-1, %r14d	;, index
; src/output.c:102:             ast_output(0, false, "method\n");
	movq	8(%rsp), %rdi	; %sfp,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC70(%rip), %r15	;, tmp172
; src/output.c:102:             ast_output(0, false, "method\n");
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC73(%rip), %rdi	;,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:103:             output_method(class_member->content.method, outfile, indent + 1, parser);
	movq	(%r12), %r12	; member_42->content.method, _45
	leaq	4(%rbx), %rax	;, _44
; src/output.c:79:     ast_output(0, false, "name\n");
	xorl	%edx, %edx	;
	movq	16(%rsp), %rcx	; %sfp,
	movq	%rax, %rsi	; _44,
; src/output.c:103:             output_method(class_member->content.method, outfile, indent + 1, parser);
	movq	%rax, 32(%rsp)	; _44, %sfp
; src/output.c:79:     ast_output(0, false, "name\n");
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC32(%rip), %rdi	;,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:80:     output_name(method->name, outfile, indent + 1, parser);
	leaq	5(%rbx), %rax	;, _49
	movq	(%r12), %rdi	; _45->name,
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rax, %rdx	; _49,
	movq	%rax, 40(%rsp)	; _49, %sfp
	call	output_name	;
; src/output.c:81:     ast_output(0, false, "return_type\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	32(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC7(%rip), %rdi	;, tmp154
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:82:     output_name(method->return_type, outfile, indent + 1, parser);
	movq	8(%r12), %rdi	; _45->return_type, _45->return_type
	movq	16(%rsp), %rcx	; %sfp,
	leaq	5(%rbx), %rdx	;,
	movq	8(%rsp), %rsi	; %sfp,
	call	output_name	;
; src/output.c:83:     ast_output(0, false, "parameters\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	32(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC69(%rip), %rdi	;, tmp156
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:84:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%r12), %rdi	; _45->parameters, _45->parameters
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:85:     list(Statement*) body = list_copy(method->body);
	movq	24(%r12), %rdi	; _45->body, _45->body
; src/output.c:84:     list(Variable*) parameters = list_copy(method->parameters);
	movq	%rax, %r13	; tmp186, parameters
; src/output.c:85:     list(Statement*) body = list_copy(method->body);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp187, body
.L117:
; src/output.c:88:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%r13, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; src/output.c:89:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	16(%rsp), %rcx	; %sfp,
; src/output.c:88:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%rax, %rbp	; tmp188, parameter
; src/output.c:88:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	; parameter
	je	.L130	;,
; src/output.c:89:         ast_output(1, false, "parameters[%d]\n", ++index);
	incl	%r14d	; index
; src/output.c:89:         ast_output(1, false, "parameters[%d]\n", ++index);
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
; src/output.c:90:         output_variable(parameter, outfile, indent + 2, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rbp, %rdi	; parameter,
	leaq	6(%rbx), %rdx	;, tmp160
	call	output_variable	;
	jmp	.L117	;
.L130:
; src/output.c:92:     ast_output(0, true, "body\n");
	movq	32(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %edx	;,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC48(%rip), %rdi	;, tmp161
	call	*fputs@GOTPCREL(%rip)	;
.L119:
; src/output.c:94:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r12, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp189, statement
; src/output.c:94:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L113	;,
; src/output.c:95:         output_statement(statement, outfile, indent + 1, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	40(%rsp), %rdx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	call	output_statement	;
	jmp	.L119	;
.L129:
; src/output.c:110:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movq	16(%rsp), %rcx	; %sfp,
	movq	24(%rsp), %rsi	; %sfp,
	xorl	%edx, %edx	;
	movq	8(%rsp), %rdi	; %sfp,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%r12), %ecx	; member_42->type, member_42->type
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%eax, %eax	;
	leaq	.LC75(%rip), %rdx	;, tmp165
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L113	;
.L106:
; src/output.c:36:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%rbp), %ecx	; member_9->type, member_9->type
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%eax, %eax	;
	leaq	.LC76(%rip), %rdx	;, tmp167
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L103	;
.L127:
; src/output.c:48: }
	addq	$72, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	output_code, .-output_code
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
