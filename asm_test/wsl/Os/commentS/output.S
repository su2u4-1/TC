	.file	"output.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -Os -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
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
	.type	output_name, @function
output_name:
.LFB66:
	.cfi_startproc
	pushq	%r15	;
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC1(%rip), %r15	;, tmp112
; src/output.c:390: void output_name(Name* name, FILE* outfile, size_t indent, Parser* parser) {
	pushq	%r14	;
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	1(%rdx), %r14	;, ivtmp.25
	pushq	%r13	;
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	;
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12	; tmp113, name
	pushq	%rbp	;
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rcx, %rbp	; tmp116, parser
	pushq	%rbx	;
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx	; tmp114, outfile
	pushq	%r8	;
	.cfi_def_cfa_offset 64
.L2:
	leaq	-1(%r14), %r13	;, indent
; src/output.c:396:         OUT(0, true, "Name pointer: \"NULL\"\n");
	movq	%rbp, %rcx	; parser,
; src/output.c:395:     if (name_ptr == NULL) {
	testq	%r12, %r12	; name
	jne	.L3	;,
; src/output.c:396:         OUT(0, true, "Name pointer: \"NULL\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC0(%rip), %rdi	;, tmp91
	jmp	.L17	;
.L3:
; src/output.c:399:     OUT(0, false, "name: \"%s\"\n", (name_ptr->name));
	xorl	%edx, %edx	;
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%r12), %rcx	; name_13->name,
	movq	%r15, %rdx	; tmp112,
	movq	%rbx, %rdi	; outfile,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	__fprintf_chk@PLT	;
; src/output.c:400:     OUT(0, false, "id: %zu\n", name_ptr->id);
	xorl	%edx, %edx	;
	movq	%rbp, %rcx	; parser,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%r12), %rcx	; name_13->id, name_13->id
	xorl	%eax, %eax	;
	movq	%rbx, %rdi	; outfile,
	leaq	.LC2(%rip), %rdx	;, tmp94
	movl	$2, %esi	;,
	call	__fprintf_chk@PLT	;
; src/output.c:401:     switch (name_ptr->kind) {
	cmpl	$5, 24(%r12)	;, name_13->kind
	ja	.L4	;,
	movl	24(%r12), %eax	; name_13->kind, name_13->kind
	leaq	.L6(%rip), %rdx	;, tmp96
; src/output.c:424:             OUT(0, false, "kind: \"attribute\"\n");
	movq	%rbp, %rcx	; parser,
; src/output.c:401:     switch (name_ptr->kind) {
	movslq	(%rdx,%rax,4), %rax	;, tmp98
	addq	%rdx, %rax	; tmp96, tmp99
	notrack jmp	*%rax	; tmp99
	.section	.rodata
	.align 4
	.align 4
.L6:
	.long	.L11-.L6
	.long	.L10-.L6
	.long	.L9-.L6
	.long	.L8-.L6
	.long	.L7-.L6
	.long	.L5-.L6
	.text
.L11:
; src/output.c:403:             OUT(0, true, "kind: \"type\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC3(%rip), %rdi	;, tmp101
	jmp	.L17	;
.L10:
; src/output.c:406:             OUT(0, false, "kind: \"variable\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	xorl	%edx, %edx	;
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC4(%rip), %rdi	;, tmp102
	jmp	.L16	;
.L9:
; src/output.c:411:             OUT(0, false, "kind: \"function\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	xorl	%edx, %edx	;
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC6(%rip), %rdi	;, tmp104
	jmp	.L14	;
.L8:
; src/output.c:416:             OUT(0, false, "kind: \"method\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	xorl	%edx, %edx	;
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC8(%rip), %rdi	;, tmp106
.L14:
	call	fputs@PLT	;
; src/output.c:417:             OUT(0, true, "return_type\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC7(%rip), %rdi	;, tmp107
.L15:
	call	fputs@PLT	;
	incq	%r14	; ivtmp.25
; src/output.c:418:             output_name(name_ptr->info.type, outfile, indent + 1, parser);
	movq	16(%r12), %r12	; name_13->info.type, name
	jmp	.L2	;
.L7:
; src/output.c:421:             OUT(0, true, "kind: \"class\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC9(%rip), %rdi	;, tmp108
	jmp	.L17	;
.L5:
; src/output.c:424:             OUT(0, false, "kind: \"attribute\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	xorl	%edx, %edx	;
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC10(%rip), %rdi	;, tmp109
.L16:
	call	fputs@PLT	;
; src/output.c:425:             OUT(0, true, "type\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC5(%rip), %rdi	;, tmp110
	jmp	.L15	;
.L4:
; src/output.c:429:             OUT(0, true, "kind: \"unknown_NameType\"\n");
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC11(%rip), %rdi	;, tmp111
.L17:
; src/output.c:432: }
	popq	%rax	;
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
	jmp	fputs@PLT	;
	.cfi_endproc
.LFE66:
	.size	output_name, .-output_name
	.section	.rodata.str1.1
.LC12:
	.string	"UNKNOWN_OPERATOR"
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
	.text
	.type	output_expression, @function
output_expression:
.LFB63:
	.cfi_startproc
	pushq	%r15	;
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
; src/output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	leaq	.LC12(%rip), %r15	;, op_str
; src/output.c:277: void output_expression(Expression* expression, FILE* outfile, size_t indent, Parser* parser) {
	pushq	%r14	;
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	;
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	;
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12	; tmp136, indent
	pushq	%rbp	;
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp	; tmp134, expression
	pushq	%rbx	;
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rcx, %rbx	; tmp137, parser
	subq	$24, %rsp	;,
	.cfi_def_cfa_offset 80
; src/output.c:277: void output_expression(Expression* expression, FILE* outfile, size_t indent, Parser* parser) {
	movq	%rsi, 8(%rsp)	; tmp135, %sfp
.L36:
; src/output.c:282:     if (expression_ptr->operator == OP_NONE) {
	movl	24(%rbp), %edi	; expression_8->operator, _1
; src/output.c:282:     if (expression_ptr->operator == OP_NONE) {
	cmpl	$19, %edi	;, _1
	jne	.L20	;,
; src/output.c:283:         OUT(0, true, "primary\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rcx	; parser,
	movl	$1, %edx	;,
	addq	$2, %r12	;, indent
; src/output.c:299:     switch (primary_ptr->type) {
	leaq	.L24(%rip), %r14	;, tmp131
; src/output.c:283:         OUT(0, true, "primary\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC13(%rip), %rdi	;, tmp98
	call	fputs@PLT	;
; src/output.c:284:         output_primary(expression_ptr->prim_left, outfile, indent + 1, parser);
	movq	8(%rbp), %r13	; expression_8->prim_left, primary
.L21:
; src/output.c:299:     switch (primary_ptr->type) {
	cmpl	$8, 8(%r13)	;, primary_28->type
	leaq	-1(%r12), %rbp	;, indent
	ja	.L22	;,
	movl	8(%r13), %eax	; primary_28->type, primary_28->type
; src/output.c:336:             OUT(0, false, "type: \"variable\"\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; indent,
; src/output.c:299:     switch (primary_ptr->type) {
	movslq	(%r14,%rax,4), %rax	;, tmp102
	addq	%r14, %rax	; tmp131, tmp103
	notrack jmp	*%rax	; tmp103
	.section	.rodata
	.align 4
	.align 4
.L24:
	.long	.L32-.L24
	.long	.L31-.L24
	.long	.L30-.L24
	.long	.L29-.L24
	.long	.L28-.L24
	.long	.L27-.L24
	.long	.L26-.L24
	.long	.L25-.L24
	.long	.L23-.L24
	.text
.L32:
; src/output.c:301:             OUT(0, false, "type: \"integer\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC14(%rip), %rdi	;, tmp105
	jmp	.L40	;
.L31:
; src/output.c:305:             OUT(0, false, "type: \"float\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC16(%rip), %rdi	;, tmp107
.L40:
	call	fputs@PLT	;
; src/output.c:306:             OUT(0, true, "value: %s\n", (primary_ptr->value.literal_value));
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rcx	; parser,
	movq	%rbp, %rsi	; indent,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	0(%r13), %rcx	; primary_28->value.literal_value,
	leaq	.LC15(%rip), %rdx	;, tmp108
.L41:
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:293: }
	addq	$24, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
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
.L30:
	.cfi_restore_state
; src/output.c:309:             OUT(0, false, "type: \"string\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC17(%rip), %rdi	;, tmp109
	call	fputs@PLT	;
; src/output.c:310:             OUT(0, true, "value: \"%s\"\n", (primary_ptr->value.literal_value));
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rcx	; parser,
	movq	%rbp, %rsi	; indent,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	0(%r13), %rcx	; primary_28->value.literal_value,
	leaq	.LC18(%rip), %rdx	;, tmp110
	jmp	.L41	;
.L29:
; src/output.c:313:             OUT(0, false, "type: \"boolean\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC19(%rip), %rdi	;, tmp111
	call	fputs@PLT	;
; src/output.c:314:             OUT(0, true, "value: \"true\"\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rcx	; parser,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC20(%rip), %rdi	;, tmp112
	jmp	.L42	;
.L28:
; src/output.c:317:             OUT(0, false, "type: \"boolean\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC19(%rip), %rdi	;, tmp113
	call	fputs@PLT	;
; src/output.c:318:             OUT(0, true, "value: \"false\"\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rcx	; parser,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC21(%rip), %rdi	;, tmp114
.L42:
; src/output.c:293: }
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
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	fputs@PLT	;
.L27:
	.cfi_restore_state
; src/output.c:321:             OUT(0, false, "type: \"expression\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC22(%rip), %rdi	;, tmp115
	call	fputs@PLT	;
; src/output.c:322:             OUT(0, true, "value\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rcx	; parser,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC23(%rip), %rdi	;, tmp116
	call	fputs@PLT	;
; src/output.c:323:             output_expression(primary_ptr->value.expr, outfile, indent + 1, parser);
	movq	0(%r13), %rbp	; primary_28->value.expr, expression
; src/output.c:324:             break;
	jmp	.L36	;
.L26:
; src/output.c:326:             OUT(0, false, "type: \"!\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC24(%rip), %rdi	;, tmp117
	jmp	.L39	;
.L25:
; src/output.c:331:             OUT(0, false, "type: \"-\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC25(%rip), %rdi	;, tmp119
.L39:
	call	fputs@PLT	;
; src/output.c:332:             OUT(0, true, "value\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rcx	; parser,
	movq	%rbp, %rsi	; indent,
	movl	$1, %edx	;,
	incq	%r12	; indent
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC23(%rip), %rdi	;, tmp120
	call	fputs@PLT	;
; src/output.c:333:             output_primary(primary_ptr->value.operand, outfile, indent + 1, parser);
	movq	0(%r13), %r13	; primary_28->value.operand, primary
	jmp	.L21	;
.L23:
; src/output.c:336:             OUT(0, false, "type: \"variable\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC26(%rip), %rdi	;, tmp121
	call	fputs@PLT	;
; src/output.c:337:             OUT(0, true, "value\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rcx	; parser,
	movq	%rbp, %rsi	; indent,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC23(%rip), %rdi	;, tmp122
	call	fputs@PLT	;
; src/output.c:338:             output_variable_access(primary_ptr->value.var, outfile, indent + 1, parser);
	movq	0(%r13), %rdi	; primary_28->value.var,
	movq	%rbx, %rcx	; parser,
	movq	%r12, %rdx	; indent,
	movq	8(%rsp), %rsi	; %sfp,
; src/output.c:293: }
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
; src/output.c:338:             output_variable_access(primary_ptr->value.var, outfile, indent + 1, parser);
	jmp	output_variable_access	;
.L22:
	.cfi_restore_state
; src/output.c:341:             OUT(0, true, "unknown_PrimaryType: %u\n", primary_ptr->type);
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rcx	; parser,
	movq	%rbp, %rsi	; indent,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%r13), %ecx	; primary_28->type, primary_28->type
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%eax, %eax	;
; src/output.c:293: }
	addq	$24, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC27(%rip), %rdx	;, tmp124
	movl	$2, %esi	;,
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
.L20:
	.cfi_restore_state
; src/output.c:286:         string op_str = operator_to_string(expression_ptr->operator);
	call	operator_to_string@PLT	;
; src/output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; indent,
; src/output.c:286:         string op_str = operator_to_string(expression_ptr->operator);
	movq	%rax, %r13	; tmp138, op_str
; src/output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	movq	%rbx, %rcx	; parser,
	call	indention@PLT	;
; src/output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	testq	%r13, %r13	; op_str
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rdi	; %sfp,
	leaq	.LC28(%rip), %rdx	;, tmp125
; src/output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	cmove	%r15, %r13	; op_str,, op_str, op_str
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	movq	%r13, %rcx	; op_str,
; src/output.c:289:         output_expression(expression_ptr->expr_left, outfile, indent + 1, parser);
	leaq	1(%r12), %r13	;, _4
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	__fprintf_chk@PLT	;
; src/output.c:288:         OUT(0, false, "left\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rcx	; parser,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; indent,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC29(%rip), %rdi	;, tmp126
	call	fputs@PLT	;
; src/output.c:289:         output_expression(expression_ptr->expr_left, outfile, indent + 1, parser);
	movq	0(%rbp), %rdi	; expression_8->expr_left,
	movq	%rbx, %rcx	; parser,
	movq	%r13, %rdx	; _4,
	movq	8(%rsp), %rsi	; %sfp,
	call	output_expression	;
; src/output.c:290:         OUT(0, true, "right\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rcx	; parser,
	movl	$1, %edx	;,
; src/output.c:291:         output_expression(expression_ptr->right, outfile, indent + 1, parser);
	movq	%r13, %r12	; _4, indent
; src/output.c:290:         OUT(0, true, "right\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC30(%rip), %rdi	;, tmp127
	call	fputs@PLT	;
; src/output.c:291:         output_expression(expression_ptr->right, outfile, indent + 1, parser);
	movq	16(%rbp), %rbp	; expression_8->right, expression
	jmp	.L36	;
	.cfi_endproc
.LFE63:
	.size	output_expression, .-output_expression
	.section	.rodata.str1.1
.LC31:
	.string	"name\n"
.LC32:
	.string	"value: \"NULL\"\n"
	.text
	.type	output_variable, @function
output_variable:
.LFB57:
	.cfi_startproc
	pushq	%r14	;
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13	;
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdi, %r13	; tmp97, variable
	pushq	%r12	;
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rdx, %r12	; tmp99, indent
; src/output.c:144:     OUT(0, false, "type\n");
	xorl	%edx, %edx	;
; src/output.c:139: void output_variable(Variable* variable, FILE* outfile, size_t indent, Parser* parser) {
	pushq	%rbp	;
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rcx, %rbp	; tmp100, parser
; src/output.c:145:     output_name(variable_ptr->type, outfile, indent + 1, parser);
	leaq	1(%r12), %r14	;, _1
; src/output.c:139: void output_variable(Variable* variable, FILE* outfile, size_t indent, Parser* parser) {
	pushq	%rbx	;
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
; src/output.c:139: void output_variable(Variable* variable, FILE* outfile, size_t indent, Parser* parser) {
	movq	%rsi, %rbx	; tmp98, outfile
; src/output.c:144:     OUT(0, false, "type\n");
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC5(%rip), %rdi	;, tmp91
	call	fputs@PLT	;
; src/output.c:145:     output_name(variable_ptr->type, outfile, indent + 1, parser);
	movq	0(%r13), %rdi	; variable_7(D)->type,
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
	movq	%rbx, %rsi	; outfile,
	leaq	.LC31(%rip), %rdi	;, tmp92
	call	fputs@PLT	;
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
	je	.L44	;,
; src/output.c:149:         OUT(0, true, "value\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC23(%rip), %rdi	;, tmp94
	call	fputs@PLT	;
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
.L44:
	.cfi_restore_state
; src/output.c:152:         OUT(0, true, "value: \"NULL\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; outfile,
	leaq	.LC32(%rip), %rdi	;, tmp96
; src/output.c:153: }
	popq	%rbx	;
	.cfi_def_cfa_offset 40
	popq	%rbp	;
	.cfi_def_cfa_offset 32
	popq	%r12	;
	.cfi_def_cfa_offset 24
	popq	%r13	;
	.cfi_def_cfa_offset 16
	popq	%r14	;
	.cfi_def_cfa_offset 8
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	fputs@PLT	;
	.cfi_endproc
.LFE57:
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
.LC44:
	.string	"unknown_VariableAccessType: %u\n"
	.text
	.type	output_variable_access, @function
output_variable_access:
.LFB65:
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
	movq	%rdi, %r13	; tmp125, variable_access
	pushq	%r12	;
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	;
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdx, %rbp	; tmp127, indent
	pushq	%rbx	;
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp	;,
	.cfi_def_cfa_offset 80
; src/output.c:352:     switch (var_access_ptr->type) {
	movl	16(%rdi), %eax	; variable_access_18(D)->type, _1
; src/output.c:345: void output_variable_access(VariableAccess* variable_access, FILE* outfile, size_t indent, Parser* parser) {
	movq	%rsi, (%rsp)	; tmp126, %sfp
	movq	%rcx, 8(%rsp)	; tmp128, %sfp
; src/output.c:352:     switch (var_access_ptr->type) {
	cmpl	$2, %eax	;, _1
	je	.L47	;,
	ja	.L48	;,
	testl	%eax, %eax	; _1
	leaq	1(%rdx), %r14	;, _5
	jne	.L56	;,
; src/output.c:354:             OUT(0, false, "type: \"name\"\n");
	movq	8(%rsp), %rcx	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; indent,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC33(%rip), %rdi	;, tmp103
	call	fputs@PLT	;
; src/output.c:355:             OUT(0, true, "name\n");
	movq	8(%rsp), %rcx	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC31(%rip), %rdi	;, tmp104
	call	fputs@PLT	;
; src/output.c:356:             output_name(var_access_ptr->content.name, outfile, indent + 1, parser);
	movq	8(%r13), %rdi	; variable_access_18(D)->content.name, variable_access_18(D)->content.name
	movq	8(%rsp), %rcx	; %sfp,
	movq	%r14, %rdx	; _5,
	jmp	.L60	;
.L48:
; src/output.c:352:     switch (var_access_ptr->type) {
	cmpl	$3, %eax	;, _1
	jne	.L61	;,
; src/output.c:372:             OUT(0, false, "type: \"get sequence_element\"\n");
	movq	8(%rsp), %rcx	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; indent,
; src/output.c:374:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	leaq	1(%rbp), %r12	;, _8
; src/output.c:372:             OUT(0, false, "type: \"get sequence_element\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC38(%rip), %rdi	;, tmp113
	call	fputs@PLT	;
; src/output.c:373:             OUT(0, false, "sequence\n");
	movq	8(%rsp), %rcx	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; indent,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC39(%rip), %rdi	;, tmp114
	call	fputs@PLT	;
; src/output.c:374:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	movq	(%rsp), %rsi	; %sfp,
	movq	0(%r13), %rdi	; variable_access_18(D)->base,
	movq	%r12, %rdx	; _8,
	movq	8(%rsp), %rcx	; %sfp,
	call	output_variable_access	;
; src/output.c:375:             OUT(0, true, "index\n");
	movq	8(%rsp), %rcx	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC40(%rip), %rdi	;, tmp115
	call	fputs@PLT	;
; src/output.c:376:             output_expression(var_access_ptr->content.index, outfile, indent + 1, parser);
	movq	8(%r13), %rdi	; variable_access_18(D)->content.index, variable_access_18(D)->content.index
	movq	(%rsp), %rsi	; %sfp,
	movq	%r12, %rdx	; _8,
	movq	8(%rsp), %rcx	; %sfp,
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
; src/output.c:376:             output_expression(var_access_ptr->content.index, outfile, indent + 1, parser);
	jmp	output_expression	;
.L56:
	.cfi_restore_state
; src/output.c:359:             args = list_copy(var_access_ptr->content.args);
	movq	8(%rdi), %rdi	; variable_access_18(D)->content.args, variable_access_18(D)->content.args
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC37(%rip), %r15	;, tmp124
; src/output.c:359:             args = list_copy(var_access_ptr->content.args);
	call	list_copy@PLT	;
; src/output.c:360:             OUT(0, false, "type: \"function_call\"\n");
	movq	8(%rsp), %rcx	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; indent,
; src/output.c:359:             args = list_copy(var_access_ptr->content.args);
	movq	%rax, %r12	; tmp129, args
; src/output.c:360:             OUT(0, false, "type: \"function_call\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC34(%rip), %rdi	;, tmp108
	call	fputs@PLT	;
; src/output.c:361:             OUT(0, false, "function\n");
	movq	8(%rsp), %rcx	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; indent,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC35(%rip), %rdi	;, tmp109
	call	fputs@PLT	;
; src/output.c:362:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	movq	0(%r13), %rdi	; variable_access_18(D)->base,
	movq	(%rsp), %rsi	; %sfp,
	movq	%r14, %rdx	; _5,
	movq	8(%rsp), %rcx	; %sfp,
; src/output.c:365:             index = -1;
	orl	$-1, %r13d	;, index
; src/output.c:362:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	call	output_variable_access	;
; src/output.c:363:             OUT(0, true, "arguments\n");
	movq	8(%rsp), %rcx	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC36(%rip), %rdi	;, tmp110
	call	fputs@PLT	;
.L53:
; src/output.c:366:             while ((arg = (Expression*)list_pop(args)) != 0) {
	movq	%r12, %rdi	; args,
	call	list_pop@PLT	;
	movq	%rax, %rbx	; tmp130, arg
; src/output.c:366:             while ((arg = (Expression*)list_pop(args)) != 0) {
	testq	%rax, %rax	; arg
	je	.L62	;,
; src/output.c:367:                 OUT(1, false, "arguments[%d]\n", ++index);
	movq	8(%rsp), %rcx	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	xorl	%edx, %edx	;
	movq	%r14, %rsi	; _5,
; src/output.c:367:                 OUT(1, false, "arguments[%d]\n", ++index);
	incl	%r13d	; index
; src/output.c:367:                 OUT(1, false, "arguments[%d]\n", ++index);
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rdi	; %sfp,
	movl	%r13d, %ecx	; index,
	movq	%r15, %rdx	; tmp124,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	__fprintf_chk@PLT	;
; src/output.c:368:                 output_expression(arg, outfile, indent + 2, parser);
	movq	(%rsp), %rsi	; %sfp,
	leaq	2(%rbp), %rdx	;, tmp112
	movq	%rbx, %rdi	; arg,
	movq	8(%rsp), %rcx	; %sfp,
	call	output_expression	;
	jmp	.L53	;
.L47:
; src/output.c:379:             OUT(0, false, "type: \"get_attribute\"\n");
	movq	8(%rsp), %rcx	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; indent,
; src/output.c:381:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	leaq	1(%rbp), %r12	;, _11
; src/output.c:379:             OUT(0, false, "type: \"get_attribute\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC41(%rip), %rdi	;, tmp117
	call	fputs@PLT	;
; src/output.c:380:             OUT(0, false, "object\n");
	movq	8(%rsp), %rcx	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; indent,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC42(%rip), %rdi	;, tmp118
	call	fputs@PLT	;
; src/output.c:381:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	movq	(%rsp), %rsi	; %sfp,
	movq	0(%r13), %rdi	; variable_access_18(D)->base,
	movq	%r12, %rdx	; _11,
	movq	8(%rsp), %rcx	; %sfp,
	call	output_variable_access	;
; src/output.c:382:             OUT(0, true, "attribute_name\n");
	movq	8(%rsp), %rcx	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC43(%rip), %rdi	;, tmp119
	call	fputs@PLT	;
; src/output.c:383:             output_name(var_access_ptr->content.attr_name, outfile, indent + 1, parser);
	movq	8(%r13), %rdi	; variable_access_18(D)->content.attr_name, variable_access_18(D)->content.attr_name
	movq	8(%rsp), %rcx	; %sfp,
	movq	%r12, %rdx	; _11,
.L60:
	movq	(%rsp), %rsi	; %sfp,
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
; src/output.c:383:             output_name(var_access_ptr->content.attr_name, outfile, indent + 1, parser);
	jmp	output_name	;
.L61:
	.cfi_restore_state
; src/output.c:386:             OUT(0, true, "unknown_VariableAccessType: %u\n", var_access_ptr->type);
	movq	8(%rsp), %rcx	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; indent,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	16(%r13), %ecx	; variable_access_18(D)->type, variable_access_18(D)->type
	movq	(%rsp), %rdi	; %sfp,
	xorl	%eax, %eax	;
; src/output.c:389: }
	addq	$24, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC44(%rip), %rdx	;, tmp122
	movl	$2, %esi	;,
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
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	__fprintf_chk@PLT	;
.L62:
	.cfi_restore_state
; src/output.c:389: }
	addq	$24, %rsp	;,
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
.LFE65:
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
.LC57:
	.string	"variable_declaration_statement\n"
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
	.type	output_statement, @function
output_statement:
.LFB58:
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
	pushq	%r12	;
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12	; tmp188, statement
	pushq	%rbp	;
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	;
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, %rbx	; tmp190, indent
	subq	$56, %rsp	;,
	.cfi_def_cfa_offset 112
; src/output.c:159:     switch (statement_ptr->type) {
	cmpl	$7, 8(%rdi)	;, statement_18(D)->type
; src/output.c:154: void output_statement(Statement* statement, FILE* outfile, size_t indent, Parser* parser) {
	movq	%rsi, 8(%rsp)	; tmp189, %sfp
	movq	%rcx, 16(%rsp)	; tmp191, %sfp
; src/output.c:159:     switch (statement_ptr->type) {
	ja	.L64	;,
	movl	8(%rdi), %eax	; statement_18(D)->type, statement_18(D)->type
	leaq	.L66(%rip), %rdx	;, tmp137
; src/output.c:188:             OUT(0, false, "continue_statement: \"NULL\"\n");
	movq	16(%rsp), %rcx	; %sfp,
	movq	%rbx, %rsi	; indent,
	movq	8(%rsp), %rdi	; %sfp,
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
.L66:
	.long	.L73-.L66
	.long	.L72-.L66
	.long	.L71-.L66
	.long	.L70-.L66
	.long	.L69-.L66
	.long	.L68-.L66
	.long	.L67-.L66
	.long	.L65-.L66
	.text
.L71:
; src/output.c:161:             OUT(0, false, "if_statement\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
; src/output.c:162:             output_if(statement_ptr->stmt.if_stmt, outfile, indent + 1, parser);
	leaq	1(%rbx), %rbp	;, _2
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC45(%rip), %rdi	;, tmp142
	leaq	.LC46(%rip), %r14	;, tmp146
	call	fputs@PLT	;
; src/output.c:162:             output_if(statement_ptr->stmt.if_stmt, outfile, indent + 1, parser);
	movq	(%r12), %r15	; statement_18(D)->stmt.if_stmt, _3
; src/output.c:208:     list(Statement*) body = list_copy(if_ptr->body);
	movq	8(%r15), %rdi	; _3->body, _3->body
	call	list_copy@PLT	;
; src/output.c:209:     list(ElseIf*) else_if_list = list_copy(if_ptr->else_if);
	movq	16(%r15), %rdi	; _3->else_if, _3->else_if
; src/output.c:208:     list(Statement*) body = list_copy(if_ptr->body);
	movq	%rax, %r13	; tmp192, body
; src/output.c:209:     list(ElseIf*) else_if_list = list_copy(if_ptr->else_if);
	call	list_copy@PLT	;
; src/output.c:210:     list(Statement*) else_body = list_copy(if_ptr->else_body);
	movq	24(%r15), %rdi	; _3->else_body, _3->else_body
; src/output.c:209:     list(ElseIf*) else_if_list = list_copy(if_ptr->else_if);
	movq	%rax, %r12	; tmp193, else_if_list
; src/output.c:210:     list(Statement*) else_body = list_copy(if_ptr->else_body);
	call	list_copy@PLT	;
; src/output.c:211:     OUT(0, false, "condition\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; _2,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:210:     list(Statement*) else_body = list_copy(if_ptr->else_body);
	movq	%rax, 40(%rsp)	; tmp194, %sfp
; src/output.c:211:     OUT(0, false, "condition\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%r14, %rdi	; tmp146,
	call	fputs@PLT	;
; src/output.c:212:     output_expression(if_ptr->condition, outfile, indent + 1, parser);
	leaq	2(%rbx), %rax	;, _57
	movq	(%r15), %rdi	; _3->condition,
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rax, %rdx	; _57,
	movq	%rax, 24(%rsp)	; _57, %sfp
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC47(%rip), %r15	;, tmp147
; src/output.c:212:     output_expression(if_ptr->condition, outfile, indent + 1, parser);
	call	output_expression	;
; src/output.c:213:     OUT(0, false, "body\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; _2,
	xorl	%edx, %edx	;
	movq	16(%rsp), %rcx	; %sfp,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; tmp147,
	call	fputs@PLT	;
.L74:
; src/output.c:215:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%r13, %rdi	; body,
	call	list_pop@PLT	;
; src/output.c:216:         output_statement(statement, outfile, indent + 1, parser);
	movq	16(%rsp), %rcx	; %sfp,
; src/output.c:215:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%rax, %rdi	; tmp195, statement
; src/output.c:215:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	; statement
	je	.L99	;,
; src/output.c:216:         output_statement(statement, outfile, indent + 1, parser);
	movq	24(%rsp), %rdx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	call	output_statement	;
	jmp	.L74	;
.L99:
; src/output.c:217:     OUT(0, false, "else_if\n");
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; _2,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC48(%rip), %rdi	;, tmp148
	call	fputs@PLT	;
; src/output.c:232:     output_expression(else_if_ptr->condition, outfile, indent + 1, parser);
	leaq	3(%rbx), %rax	;, _64
	movq	%rax, 32(%rsp)	; _64, %sfp
.L76:
; src/output.c:219:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != 0)
	movq	%r12, %rdi	; else_if_list,
	call	list_pop@PLT	;
	movq	%rax, %r13	; tmp198, else_if
; src/output.c:219:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != 0)
	testq	%rax, %rax	; else_if
	je	.L100	;,
; src/output.c:230:     list(Statement*) body = list_copy(else_if_ptr->body);
	movq	8(%r13), %rdi	; else_if_60->body, else_if_60->body
	call	list_copy@PLT	;
; src/output.c:231:     OUT(0, false, "condition\n");
	movq	16(%rsp), %rcx	; %sfp,
	movq	24(%rsp), %rsi	; %sfp,
	xorl	%edx, %edx	;
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:230:     list(Statement*) body = list_copy(else_if_ptr->body);
	movq	%rax, %rbx	; tmp196, body
; src/output.c:231:     OUT(0, false, "condition\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%r14, %rdi	; tmp146,
	call	fputs@PLT	;
; src/output.c:232:     output_expression(else_if_ptr->condition, outfile, indent + 1, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	32(%rsp), %rdx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	0(%r13), %rdi	; else_if_60->condition,
	call	output_expression	;
; src/output.c:233:     OUT(0, true, "body\n");
	movq	24(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %edx	;,
	movq	16(%rsp), %rcx	; %sfp,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; tmp147,
	call	fputs@PLT	;
.L77:
; src/output.c:235:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%rbx, %rdi	; body,
	call	list_pop@PLT	;
	movq	%rax, %rdi	; tmp197, statement
; src/output.c:235:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	; statement
	je	.L76	;,
; src/output.c:236:         output_statement(statement, outfile, indent + 1, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	32(%rsp), %rdx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	call	output_statement	;
	jmp	.L77	;
.L100:
; src/output.c:221:     OUT(0, true, "else_body\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	16(%rsp), %rcx	; %sfp,
	movq	%rbp, %rsi	; _2,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC49(%rip), %rdi	;, tmp152
	call	fputs@PLT	;
.L80:
; src/output.c:222:     while ((statement = (Statement*)list_pop(else_body)) != 0)
	movq	40(%rsp), %rdi	; %sfp,
	call	list_pop@PLT	;
	movq	%rax, %rdi	; tmp199, statement
; src/output.c:222:     while ((statement = (Statement*)list_pop(else_body)) != 0)
	testq	%rax, %rax	; statement
	je	.L63	;,
; src/output.c:223:         output_statement(statement, outfile, indent + 1, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	24(%rsp), %rdx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	call	output_statement	;
	jmp	.L80	;
.L69:
; src/output.c:165:             OUT(0, false, "for_statement\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC50(%rip), %rdi	;, tmp153
; src/output.c:166:             output_for(statement_ptr->stmt.for_stmt, outfile, indent + 1, parser);
	leaq	1(%rbx), %rbp	;, _4
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	fputs@PLT	;
; src/output.c:166:             output_for(statement_ptr->stmt.for_stmt, outfile, indent + 1, parser);
	movq	(%r12), %r12	; statement_18(D)->stmt.for_stmt, _5
; src/output.c:243:     list(Statement*) body = list_copy(for_ptr->body);
	movq	24(%r12), %rdi	; _5->body, _5->body
	call	list_copy@PLT	;
; src/output.c:245:         OUT(0, false, "initializer\n");
	xorl	%edx, %edx	;
; src/output.c:244:     if (for_ptr->initializer != 0) {
	cmpq	$0, (%r12)	;, _5->initializer
; src/output.c:245:         OUT(0, false, "initializer\n");
	movq	%rbp, %rsi	; _4,
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:243:     list(Statement*) body = list_copy(for_ptr->body);
	movq	%rax, %r13	; tmp200, body
; src/output.c:244:     if (for_ptr->initializer != 0) {
	je	.L83	;,
; src/output.c:245:         OUT(0, false, "initializer\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC51(%rip), %rdi	;, tmp155
	call	fputs@PLT	;
; src/output.c:246:         output_variable(for_ptr->initializer, outfile, indent + 1, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	2(%rbx), %rdx	;, tmp156
	movq	(%r12), %rdi	; _5->initializer,
	call	output_variable	;
	jmp	.L84	;
.L83:
; src/output.c:248:         OUT(0, false, "initializer: \"NULL\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC52(%rip), %rdi	;, tmp157
	call	fputs@PLT	;
.L84:
; src/output.c:250:         OUT(0, false, "condition\n");
	xorl	%edx, %edx	;
; src/output.c:249:     if (for_ptr->condition != 0) {
	cmpq	$0, 8(%r12)	;, _5->condition
; src/output.c:250:         OUT(0, false, "condition\n");
	movq	16(%rsp), %rcx	; %sfp,
	movq	%rbp, %rsi	; _4,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:249:     if (for_ptr->condition != 0) {
	je	.L85	;,
; src/output.c:250:         OUT(0, false, "condition\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC46(%rip), %rdi	;, tmp158
	call	fputs@PLT	;
; src/output.c:251:         output_expression(for_ptr->condition, outfile, indent + 1, parser);
	movq	8(%r12), %rdi	; _5->condition, _5->condition
	movq	16(%rsp), %rcx	; %sfp,
	leaq	2(%rbx), %rdx	;, tmp159
	movq	8(%rsp), %rsi	; %sfp,
	call	output_expression	;
	jmp	.L86	;
.L85:
; src/output.c:253:         OUT(0, false, "condition: \"NULL\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC53(%rip), %rdi	;, tmp161
	call	fputs@PLT	;
.L86:
; src/output.c:255:         OUT(0, false, "increment\n");
	xorl	%edx, %edx	;
; src/output.c:254:     if (for_ptr->increment != 0) {
	cmpq	$0, 16(%r12)	;, _5->increment
; src/output.c:255:         OUT(0, false, "increment\n");
	movq	16(%rsp), %rcx	; %sfp,
	movq	%rbp, %rsi	; _4,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:254:     if (for_ptr->increment != 0) {
	je	.L87	;,
; src/output.c:255:         OUT(0, false, "increment\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC54(%rip), %rdi	;, tmp162
	call	fputs@PLT	;
; src/output.c:256:         output_expression(for_ptr->increment, outfile, indent + 1, parser);
	movq	16(%r12), %rdi	; _5->increment, _5->increment
	movq	16(%rsp), %rcx	; %sfp,
	leaq	2(%rbx), %rdx	;, tmp163
	movq	8(%rsp), %rsi	; %sfp,
	call	output_expression	;
	jmp	.L88	;
.L87:
; src/output.c:258:         OUT(0, false, "increment: \"NULL\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC55(%rip), %rdi	;, tmp165
	call	fputs@PLT	;
.L88:
; src/output.c:259:     OUT(0, true, "body\n");
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; _4,
; src/output.c:262:         output_statement(statement, outfile, indent + 1, parser);
	addq	$2, %rbx	;, tmp187
; src/output.c:259:     OUT(0, true, "body\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC47(%rip), %rdi	;, tmp166
	call	fputs@PLT	;
.L89:
; src/output.c:261:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%r13, %rdi	; body,
	call	list_pop@PLT	;
	movq	%rax, %rdi	; tmp201, statement
; src/output.c:261:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	; statement
	je	.L63	;,
; src/output.c:262:         output_statement(statement, outfile, indent + 1, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rbx, %rdx	; tmp187,
	call	output_statement	;
	jmp	.L89	;
.L70:
; src/output.c:169:             OUT(0, false, "while_statement\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC56(%rip), %rdi	;, tmp168
; src/output.c:170:             output_while(statement_ptr->stmt.while_stmt, outfile, indent + 1, parser);
	leaq	1(%rbx), %r13	;, _6
; src/output.c:271:     output_expression(while_ptr->condition, outfile, indent + 1, parser);
	addq	$2, %rbx	;, _82
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	fputs@PLT	;
; src/output.c:170:             output_while(statement_ptr->stmt.while_stmt, outfile, indent + 1, parser);
	movq	(%r12), %r12	; statement_18(D)->stmt.while_stmt, _7
; src/output.c:269:     list(Statement*) body = list_copy(while_ptr->body);
	movq	8(%r12), %rdi	; _7->body, _7->body
	call	list_copy@PLT	;
; src/output.c:270:     OUT(0, false, "condition\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	%r13, %rsi	; _6,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:269:     list(Statement*) body = list_copy(while_ptr->body);
	movq	%rax, %rbp	; tmp202, body
; src/output.c:270:     OUT(0, false, "condition\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC46(%rip), %rdi	;, tmp170
	call	fputs@PLT	;
; src/output.c:271:     output_expression(while_ptr->condition, outfile, indent + 1, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rbx, %rdx	; _82,
	movq	(%r12), %rdi	; _7->condition,
	call	output_expression	;
; src/output.c:272:     OUT(0, true, "body\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	16(%rsp), %rcx	; %sfp,
	movq	%r13, %rsi	; _6,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC47(%rip), %rdi	;, tmp171
	call	fputs@PLT	;
.L92:
; src/output.c:274:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%rbp, %rdi	; body,
	call	list_pop@PLT	;
	movq	%rax, %rdi	; tmp203, statement
; src/output.c:274:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	; statement
	je	.L63	;,
; src/output.c:275:         output_statement(statement, outfile, indent + 1, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rbx, %rdx	; _82,
	call	output_statement	;
	jmp	.L92	;
.L72:
; src/output.c:173:             OUT(0, false, "variable_declaration_statement\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC57(%rip), %rdi	;, tmp172
	call	fputs@PLT	;
; src/output.c:174:             output_variable(statement_ptr->stmt.var, outfile, indent + 1, parser);
	movq	(%r12), %rdi	; statement_18(D)->stmt.var,
	movq	16(%rsp), %rcx	; %sfp,
	leaq	1(%rbx), %rdx	;, tmp173
	movq	8(%rsp), %rsi	; %sfp,
; src/output.c:202: }
	addq	$56, %rsp	;,
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
; src/output.c:174:             output_variable(statement_ptr->stmt.var, outfile, indent + 1, parser);
	jmp	output_variable	;
.L68:
	.cfi_restore_state
; src/output.c:177:             if (statement_ptr->stmt.expr == 0) {
	cmpq	$0, (%r12)	;, statement_18(D)->stmt.expr
	jne	.L94	;,
; src/output.c:178:                 OUT(0, false, "return_statement: \"NULL\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC58(%rip), %rdi	;, tmp174
	jmp	.L97	;
.L94:
; src/output.c:181:             OUT(0, false, "return_statement\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC59(%rip), %rdi	;, tmp175
	jmp	.L98	;
.L67:
; src/output.c:185:             OUT(0, false, "break_statement: \"NULL\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC60(%rip), %rdi	;, tmp177
.L97:
; src/output.c:202: }
	addq	$56, %rsp	;,
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
	jmp	fputs@PLT	;
.L65:
	.cfi_restore_state
; src/output.c:188:             OUT(0, false, "continue_statement: \"NULL\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC61(%rip), %rdi	;, tmp178
	jmp	.L97	;
.L73:
; src/output.c:191:             if (statement_ptr->stmt.expr == 0) {
	cmpq	$0, (%r12)	;, statement_18(D)->stmt.expr
	jne	.L95	;,
; src/output.c:192:                 OUT(0, false, "expression_statement: \"NULL\"\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC62(%rip), %rdi	;, tmp179
	jmp	.L97	;
.L95:
; src/output.c:195:             OUT(0, false, "expression_statement\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC63(%rip), %rdi	;, tmp180
.L98:
	call	fputs@PLT	;
; src/output.c:196:             output_expression(statement_ptr->stmt.expr, outfile, indent + 1, parser);
	movq	(%r12), %rdi	; statement_18(D)->stmt.expr,
	movq	16(%rsp), %rcx	; %sfp,
	leaq	1(%rbx), %rdx	;, tmp181
	movq	8(%rsp), %rsi	; %sfp,
; src/output.c:202: }
	addq	$56, %rsp	;,
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
; src/output.c:196:             output_expression(statement_ptr->stmt.expr, outfile, indent + 1, parser);
	jmp	output_expression	;
.L64:
	.cfi_restore_state
; src/output.c:199:             OUT(0, false, "unknown_StatementType: %u\n", statement_ptr->type);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rsi	; indent,
	xorl	%edx, %edx	;
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%r12), %ecx	; statement_18(D)->type, statement_18(D)->type
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:202: }
	addq	$56, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	;
	.cfi_def_cfa_offset 48
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC64(%rip), %rdx	;, tmp183
; src/output.c:202: }
	popq	%rbp	;
	.cfi_def_cfa_offset 40
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
; src/output.c:202: }
	popq	%r12	;
	.cfi_def_cfa_offset 32
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
; src/output.c:202: }
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	__fprintf_chk@PLT	;
.L63:
	.cfi_restore_state
; src/output.c:202: }
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
.LFE58:
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
	.globl	output_code
	.type	output_code, @function
output_code:
.LFB51:
	.cfi_startproc
	endbr64	
	pushq	%r15	;
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	;
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	;
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	;
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	;
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	;
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, %rbx	; tmp178, indent
	subq	$72, %rsp	;,
	.cfi_def_cfa_offset 128
; src/output.c:47:     list(CodeMember*) members = list_copy((code)->members);
	movq	(%rdi), %rdi	; code_5(D)->members,
; src/output.c:43: void output_code(Code* code, FILE* outfile, size_t indent, Parser* parser) {
	movq	%rsi, 8(%rsp)	; tmp177, %sfp
	movq	%rcx, 16(%rsp)	; tmp179, %sfp
; src/output.c:47:     list(CodeMember*) members = list_copy((code)->members);
	call	list_copy@PLT	;
	movq	%rax, 48(%rsp)	; tmp180, %sfp
.L102:
; src/output.c:49:     while ((member = (CodeMember*)list_pop(members)) != 0)
	movq	48(%rsp), %rdi	; %sfp,
	call	list_pop@PLT	;
	movq	%rax, %rbp	; tmp191, member
; src/output.c:49:     while ((member = (CodeMember*)list_pop(members)) != 0)
	testq	%rax, %rax	; member
	je	.L126	;,
; src/output.c:25:     switch (code_member_ptr->type) {
	movl	8(%rbp), %eax	; member_9->type, _14
; src/output.c:39:             OUT(0, false, "unknown_CodeMemberType: %u\n", code_member_ptr->type);
	movq	16(%rsp), %rcx	; %sfp,
; src/output.c:50:         output_code_member(member, outfile, indent + 1, parser);
	leaq	1(%rbx), %rsi	;, _2
; src/output.c:39:             OUT(0, false, "unknown_CodeMemberType: %u\n", code_member_ptr->type);
	xorl	%edx, %edx	;
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:25:     switch (code_member_ptr->type) {
	cmpl	$1, %eax	;, _14
	je	.L103	;,
	cmpl	$2, %eax	;, _14
	je	.L104	;,
	testl	%eax, %eax	; _14
	jne	.L105	;,
; src/output.c:27:             OUT(0, false, "import\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC66(%rip), %rdi	;, tmp134
; src/output.c:28:             output_import(code_member_ptr->content.import, outfile, indent + 1, parser);
	leaq	2(%rbx), %r12	;, _15
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	fputs@PLT	;
; src/output.c:57:     OUT(0, false, "name\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; _15,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:28:             output_import(code_member_ptr->content.import, outfile, indent + 1, parser);
	movq	0(%rbp), %rbp	; member_9->content.import, _16
; src/output.c:57:     OUT(0, false, "name\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC31(%rip), %rdi	;, tmp135
	call	fputs@PLT	;
; src/output.c:58:     output_name(import_ptr->name, outfile, indent + 1, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	3(%rbx), %rdx	;, tmp136
	movq	0(%rbp), %rdi	; _16->name,
	call	output_name	;
; src/output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r12, %rsi	; _15,
	movl	$1, %edx	;,
	call	indention@PLT	;
; src/output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	movq	8(%rbp), %rcx	; _16->source, _24
	testq	%rcx, %rcx	; _24
	jne	.L106	;,
; src/output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	leaq	.LC65(%rip), %rcx	;, _24
.L106:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rdi	; %sfp,
	leaq	.LC67(%rip), %rdx	;, tmp137
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	__fprintf_chk@PLT	;
; src/output.c:60: }
	jmp	.L102	;
.L103:
; src/output.c:31:             OUT(0, false, "function\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
; src/output.c:32:             output_function(code_member_ptr->content.function, outfile, indent + 1, parser);
	leaq	2(%rbx), %r12	;, _17
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC35(%rip), %rdi	;,
	leaq	.LC69(%rip), %r15	;, tmp174
	call	fputs@PLT	;
; src/output.c:66:     OUT(0, false, "name\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; _17,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:32:             output_function(code_member_ptr->content.function, outfile, indent + 1, parser);
	movq	0(%rbp), %r14	; member_9->content.function, _18
; src/output.c:66:     OUT(0, false, "name\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC31(%rip), %rdi	;, tmp139
	call	fputs@PLT	;
; src/output.c:67:     output_name(function_ptr->name, outfile, indent + 1, parser);
	leaq	3(%rbx), %rax	;, _26
	movq	(%r14), %rdi	; _18->name,
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rax, %rdx	; _26,
	movq	%rax, 24(%rsp)	; _26, %sfp
	call	output_name	;
; src/output.c:68:     OUT(0, false, "return_type\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; _17,
	movq	8(%rsp), %rdi	; %sfp,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC7(%rip), %rdi	;, tmp140
	call	fputs@PLT	;
; src/output.c:69:     output_name(function_ptr->return_type, outfile, indent + 1, parser);
	movq	8(%r14), %rdi	; _18->return_type, _18->return_type
	movq	16(%rsp), %rcx	; %sfp,
	leaq	3(%rbx), %rdx	;,
	movq	8(%rsp), %rsi	; %sfp,
	call	output_name	;
; src/output.c:70:     OUT(0, false, "parameters\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; _17,
	movq	8(%rsp), %rdi	; %sfp,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC68(%rip), %rdi	;, tmp142
	call	fputs@PLT	;
; src/output.c:71:     list(Variable*) parameters = list_copy(function_ptr->parameters);
	movq	16(%r14), %rdi	; _18->parameters, _18->parameters
	call	list_copy@PLT	;
; src/output.c:72:     list(Statement*) body = list_copy(function_ptr->body);
	movq	24(%r14), %rdi	; _18->body, _18->body
; src/output.c:74:     int index = -1;
	orl	$-1, %r14d	;, index
; src/output.c:71:     list(Variable*) parameters = list_copy(function_ptr->parameters);
	movq	%rax, %r13	; tmp181, parameters
; src/output.c:72:     list(Statement*) body = list_copy(function_ptr->body);
	call	list_copy@PLT	;
	movq	%rax, 32(%rsp)	; tmp182, %sfp
.L108:
; src/output.c:75:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	movq	%r13, %rdi	; parameters,
	call	list_pop@PLT	;
; src/output.c:76:         OUT(1, false, "parameters[%d]\n", ++index);
	movq	16(%rsp), %rcx	; %sfp,
; src/output.c:75:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	movq	%rax, %rbp	; tmp183, parameter
; src/output.c:75:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	testq	%rax, %rax	; parameter
	je	.L127	;,
; src/output.c:76:         OUT(1, false, "parameters[%d]\n", ++index);
	movq	24(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%edx, %edx	;
; src/output.c:76:         OUT(1, false, "parameters[%d]\n", ++index);
	incl	%r14d	; index
; src/output.c:76:         OUT(1, false, "parameters[%d]\n", ++index);
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rdi	; %sfp,
	movl	%r14d, %ecx	; index,
	movq	%r15, %rdx	; tmp174,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	__fprintf_chk@PLT	;
; src/output.c:77:         output_variable(parameter, outfile, indent + 2, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rbp, %rdi	; parameter,
	leaq	4(%rbx), %rdx	;, tmp146
	call	output_variable	;
	jmp	.L108	;
.L127:
; src/output.c:79:     OUT(0, true, "body\n");
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r12, %rsi	; _17,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC47(%rip), %rdi	;, tmp147
	call	fputs@PLT	;
.L110:
; src/output.c:81:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	32(%rsp), %rdi	; %sfp,
	call	list_pop@PLT	;
	movq	%rax, %rdi	; tmp184, statement
; src/output.c:81:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	; statement
	je	.L102	;,
; src/output.c:82:         output_statement(statement, outfile, indent + 1, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	24(%rsp), %rdx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	call	output_statement	;
	jmp	.L110	;
.L104:
; src/output.c:35:             OUT(0, false, "class\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC70(%rip), %rdi	;, tmp148
; src/output.c:36:             output_class(code_member_ptr->content.class_, outfile, indent + 1, parser);
	leaq	2(%rbx), %r12	;, _19
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	fputs@PLT	;
; src/output.c:131:     OUT(0, false, "name\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; _19,
	movq	8(%rsp), %rdi	; %sfp,
; src/output.c:36:             output_class(code_member_ptr->content.class_, outfile, indent + 1, parser);
	movq	0(%rbp), %rbp	; member_9->content.class_, _20
; src/output.c:131:     OUT(0, false, "name\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC31(%rip), %rdi	;,
	call	fputs@PLT	;
; src/output.c:132:     output_name(class_ptr->name, outfile, indent + 1, parser);
	leaq	3(%rbx), %rax	;, _38
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	0(%rbp), %rdi	; _20->name,
	movq	%rax, %rdx	; _38,
	movq	%rax, 24(%rsp)	; _38, %sfp
	call	output_name	;
; src/output.c:133:     OUT(0, true, "members\n");
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r12, %rsi	; _19,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC71(%rip), %rdi	;, tmp150
	call	fputs@PLT	;
; src/output.c:134:     list(ClassMember*) members = list_copy(class_ptr->members);
	movq	8(%rbp), %rdi	; _20->members, _20->members
	call	list_copy@PLT	;
	movq	%rax, 56(%rsp)	; tmp185, %sfp
.L112:
; src/output.c:136:     while ((member = (ClassMember*)list_pop(members)) != 0)
	movq	56(%rsp), %rdi	; %sfp,
	call	list_pop@PLT	;
	movq	%rax, %r12	; tmp190, member
; src/output.c:136:     while ((member = (ClassMember*)list_pop(members)) != 0)
	testq	%rax, %rax	; member
	je	.L102	;,
; src/output.c:112:     switch (class_member_ptr->type) {
	movl	8(%r12), %eax	; member_42->type, _43
; src/output.c:112:     switch (class_member_ptr->type) {
	testl	%eax, %eax	; _43
	je	.L113	;,
	decl	%eax	; _43
	jne	.L128	;,
; src/output.c:118:             OUT(0, false, "variable\n");
	movq	16(%rsp), %rcx	; %sfp,
	movq	24(%rsp), %rsi	; %sfp,
	xorl	%edx, %edx	;
	movq	8(%rsp), %rdi	; %sfp,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC73(%rip), %rdi	;, tmp162
	call	fputs@PLT	;
; src/output.c:119:             output_variable(class_member_ptr->content.variable, outfile, indent + 1, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	4(%rbx), %rdx	;, tmp163
	movq	(%r12), %rdi	; member_42->content.variable,
	call	output_variable	;
; src/output.c:120:             break;
	jmp	.L112	;
.L113:
; src/output.c:114:             OUT(0, false, "method\n");
	movq	16(%rsp), %rcx	; %sfp,
	movq	24(%rsp), %rsi	; %sfp,
	xorl	%edx, %edx	;
; src/output.c:97:     int index = -1;
	orl	$-1, %r14d	;, index
; src/output.c:114:             OUT(0, false, "method\n");
	movq	8(%rsp), %rdi	; %sfp,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC69(%rip), %r15	;, tmp172
; src/output.c:114:             OUT(0, false, "method\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC72(%rip), %rdi	;,
	call	fputs@PLT	;
; src/output.c:115:             output_method(class_member_ptr->content.method, outfile, indent + 1, parser);
	leaq	4(%rbx), %rax	;, _44
; src/output.c:89:     OUT(0, false, "name\n");
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%edx, %edx	;
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rax, %rsi	; _44,
; src/output.c:115:             output_method(class_member_ptr->content.method, outfile, indent + 1, parser);
	movq	(%r12), %r12	; member_42->content.method, _45
	movq	%rax, 32(%rsp)	; _44, %sfp
; src/output.c:89:     OUT(0, false, "name\n");
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC31(%rip), %rdi	;,
	call	fputs@PLT	;
; src/output.c:90:     output_name(method_ptr->name, outfile, indent + 1, parser);
	leaq	5(%rbx), %rax	;, _49
	movq	(%r12), %rdi	; _45->name,
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rax, %rdx	; _49,
	movq	%rax, 40(%rsp)	; _49, %sfp
	call	output_name	;
; src/output.c:91:     OUT(0, false, "return_type\n");
	movq	16(%rsp), %rcx	; %sfp,
	movq	32(%rsp), %rsi	; %sfp,
	xorl	%edx, %edx	;
	movq	8(%rsp), %rdi	; %sfp,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC7(%rip), %rdi	;, tmp154
	call	fputs@PLT	;
; src/output.c:92:     output_name(method_ptr->return_type, outfile, indent + 1, parser);
	movq	8(%r12), %rdi	; _45->return_type, _45->return_type
	movq	16(%rsp), %rcx	; %sfp,
	leaq	5(%rbx), %rdx	;,
	movq	8(%rsp), %rsi	; %sfp,
	call	output_name	;
; src/output.c:93:     OUT(0, false, "parameters\n");
	movq	16(%rsp), %rcx	; %sfp,
	movq	32(%rsp), %rsi	; %sfp,
	xorl	%edx, %edx	;
	movq	8(%rsp), %rdi	; %sfp,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC68(%rip), %rdi	;, tmp156
	call	fputs@PLT	;
; src/output.c:94:     list(Variable*) parameters = list_copy(method_ptr->parameters);
	movq	16(%r12), %rdi	; _45->parameters, _45->parameters
	call	list_copy@PLT	;
; src/output.c:95:     list(Statement*) body = list_copy(method_ptr->body);
	movq	24(%r12), %rdi	; _45->body, _45->body
; src/output.c:94:     list(Variable*) parameters = list_copy(method_ptr->parameters);
	movq	%rax, %r13	; tmp186, parameters
; src/output.c:95:     list(Statement*) body = list_copy(method_ptr->body);
	call	list_copy@PLT	;
	movq	%rax, %r12	; tmp187, body
.L116:
; src/output.c:98:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	movq	%r13, %rdi	; parameters,
	call	list_pop@PLT	;
; src/output.c:99:         OUT(1, false, "parameters[%d]\n", ++index);
	movq	16(%rsp), %rcx	; %sfp,
; src/output.c:98:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	movq	%rax, %rbp	; tmp188, parameter
; src/output.c:98:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	testq	%rax, %rax	; parameter
	je	.L129	;,
; src/output.c:99:         OUT(1, false, "parameters[%d]\n", ++index);
	movq	40(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%edx, %edx	;
; src/output.c:99:         OUT(1, false, "parameters[%d]\n", ++index);
	incl	%r14d	; index
; src/output.c:99:         OUT(1, false, "parameters[%d]\n", ++index);
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rdi	; %sfp,
	movl	%r14d, %ecx	; index,
	movq	%r15, %rdx	; tmp172,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	__fprintf_chk@PLT	;
; src/output.c:100:         output_variable(parameter, outfile, indent + 2, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rbp, %rdi	; parameter,
	leaq	6(%rbx), %rdx	;, tmp160
	call	output_variable	;
	jmp	.L116	;
.L129:
; src/output.c:102:     OUT(0, true, "body\n");
	movq	32(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %edx	;,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC47(%rip), %rdi	;, tmp161
	call	fputs@PLT	;
.L118:
; src/output.c:104:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%r12, %rdi	; body,
	call	list_pop@PLT	;
	movq	%rax, %rdi	; tmp189, statement
; src/output.c:104:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	; statement
	je	.L112	;,
; src/output.c:105:         output_statement(statement, outfile, indent + 1, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	40(%rsp), %rdx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	call	output_statement	;
	jmp	.L118	;
.L128:
; src/output.c:122:             OUT(0, false, "unknown_ClassMemberType: %u\n", class_member_ptr->type);
	movq	16(%rsp), %rcx	; %sfp,
	movq	24(%rsp), %rsi	; %sfp,
	xorl	%edx, %edx	;
	movq	8(%rsp), %rdi	; %sfp,
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%r12), %ecx	; member_42->type, member_42->type
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%eax, %eax	;
	leaq	.LC74(%rip), %rdx	;, tmp165
	movl	$2, %esi	;,
	call	__fprintf_chk@PLT	;
	jmp	.L112	;
.L105:
; src/output.c:39:             OUT(0, false, "unknown_CodeMemberType: %u\n", code_member_ptr->type);
	call	indention@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%rbp), %ecx	; member_9->type, member_9->type
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%eax, %eax	;
	leaq	.LC75(%rip), %rdx	;, tmp167
	movl	$2, %esi	;,
	call	__fprintf_chk@PLT	;
	jmp	.L102	;
.L126:
; src/output.c:51: }
	addq	$72, %rsp	;,
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
.LFE51:
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
