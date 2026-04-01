	.file	"output.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O1 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
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
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rsi, %rbx	; tmp134, outfile
	movq	%rdx, %r12	; tmp135, indent
	movq	%rcx, %r13	; tmp136, parser
; src/output.c:363:     if (name == NULL) {
	testq	%rdi, %rdi	; name
	je	.L14	;,
	movq	%rdi, %rbp	; tmp133, name
; src/output.c:368:     ast_output(0, false, "name: \"%s\"\n", name->name);
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rbp), %rcx	; name_15(D)->name, name_15(D)->name
	leaq	.LC1(%rip), %rdx	;, tmp101
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:369:     ast_output(0, false, "id: %zu\n", name->id);
	movq	%r13, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	16(%rbp), %rcx	; name_15(D)->id, name_15(D)->id
	leaq	.LC2(%rip), %rdx	;, tmp103
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:370:     switch (name->kind) {
	cmpl	$6, 32(%rbp)	;, name_15(D)->kind
	ja	.L4	;,
	movl	32(%rbp), %eax	; name_15(D)->kind, name_15(D)->kind
	leaq	.L6(%rip), %rdx	;, tmp105
	movslq	(%rdx,%rax,4), %rax	;, tmp107
	addq	%rdx, %rax	; tmp105, tmp108
	jmp	*%rax	; tmp108
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
.L14:
; src/output.c:364:         ast_output(0, true, "Name pointer: \"NULL\"\n");
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$21, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp99
	call	*fwrite@GOTPCREL(%rip)	;
.L1:
; src/output.c:407: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L5:
; src/output.c:372:             ast_output(0, true, "kind: \"type\"\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$13, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC3(%rip), %rdi	;, tmp110
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L1	;
.L9:
; src/output.c:375:             ast_output(0, false, "kind: \"variable\"\n");
	movq	%r13, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rdi	;, tmp111
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:376:             ast_output(0, true, "type\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp112
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:377:             output_name(name->type, outfile, indent + 1, parser);
	leaq	1(%r12), %rdx	;, tmp113
	movq	0(%rbp), %rdi	; name_15(D)->type, name_15(D)->type
	movq	%r13, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:378:             break;
	jmp	.L1	;
.L11:
; src/output.c:380:             ast_output(0, false, "kind: \"function\"\n");
	movq	%r13, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC6(%rip), %rdi	;, tmp115
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:381:             ast_output(0, true, "return_type\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rdi	;, tmp116
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:382:             output_name(name->type, outfile, indent + 1, parser);
	leaq	1(%r12), %rdx	;, tmp117
	movq	0(%rbp), %rdi	; name_15(D)->type, name_15(D)->type
	movq	%r13, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:383:             break;
	jmp	.L1	;
.L10:
; src/output.c:385:             ast_output(0, false, "kind: \"method\"\n");
	movq	%r13, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC8(%rip), %rdi	;, tmp119
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:386:             ast_output(0, true, "return_type\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rdi	;, tmp120
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:387:             output_name(name->type, outfile, indent + 1, parser);
	leaq	1(%r12), %rdx	;, tmp121
	movq	0(%rbp), %rdi	; name_15(D)->type, name_15(D)->type
	movq	%r13, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:388:             break;
	jmp	.L1	;
.L12:
; src/output.c:390:             ast_output(0, true, "kind: \"class\"\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC9(%rip), %rdi	;, tmp123
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L1	;
.L7:
; src/output.c:393:             ast_output(0, false, "kind: \"attribute\"\n");
	movq	%r13, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rdi	;, tmp124
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:394:             ast_output(0, true, "type\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp125
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:395:             output_name(name->type, outfile, indent + 1, parser);
	leaq	1(%r12), %rdx	;, tmp126
	movq	0(%rbp), %rdi	; name_15(D)->type, name_15(D)->type
	movq	%r13, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:396:             break;
	jmp	.L1	;
.L8:
; src/output.c:398:             ast_output(0, false, "kind: \"parameter\"\n");
	movq	%r13, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rdi	;, tmp128
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:399:             ast_output(0, true, "type\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp129
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:400:             output_name(name->type, outfile, indent + 1, parser);
	leaq	1(%r12), %rdx	;, tmp130
	movq	0(%rbp), %rdi	; name_15(D)->type, name_15(D)->type
	movq	%r13, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:401:             break;
	jmp	.L1	;
.L4:
; src/output.c:403:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$25, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC12(%rip), %rdi	;, tmp132
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L1	;
	.size	output_name, .-output_name
	.section	.rodata.str1.1
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
	.text
	.type	output_primary, @function
output_primary:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %r12	; tmp136, primary
	movq	%rsi, %rbx	; tmp137, outfile
	movq	%rdx, %rbp	; tmp138, indent
	movq	%rcx, %r13	; tmp139, parser
; src/output.c:271:     switch (primary->type) {
	cmpl	$8, 8(%rdi)	;, primary_16(D)->type
	ja	.L16	;,
	movl	8(%rdi), %eax	; primary_16(D)->type, primary_16(D)->type
	leaq	.L18(%rip), %rdx	;, tmp100
	movslq	(%rdx,%rax,4), %rax	;, tmp102
	addq	%rdx, %rax	; tmp100, tmp103
	jmp	*%rax	; tmp103
	.section	.rodata
	.align 4
	.align 4
.L18:
	.long	.L26-.L18
	.long	.L25-.L18
	.long	.L24-.L18
	.long	.L23-.L18
	.long	.L22-.L18
	.long	.L21-.L18
	.long	.L20-.L18
	.long	.L19-.L18
	.long	.L17-.L18
	.text
.L26:
; src/output.c:273:             ast_output(0, false, "type: \"integer\"\n");
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC13(%rip), %rdi	;, tmp105
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:274:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%r12), %rcx	; primary_16(D)->value.literal_value, primary_16(D)->value.literal_value
	leaq	.LC14(%rip), %rdx	;, tmp107
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L15:
; src/output.c:317: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L25:
; src/output.c:277:             ast_output(0, false, "type: \"float\"\n");
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC15(%rip), %rdi	;, tmp108
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:278:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%r12), %rcx	; primary_16(D)->value.literal_value, primary_16(D)->value.literal_value
	leaq	.LC14(%rip), %rdx	;, tmp110
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L15	;
.L24:
; src/output.c:281:             ast_output(0, false, "type: \"string\"\n");
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rdi	;, tmp111
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:282:             ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%r12), %rcx	; primary_16(D)->value.literal_value, primary_16(D)->value.literal_value
	leaq	.LC17(%rip), %rdx	;, tmp113
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L15	;
.L23:
; src/output.c:285:             ast_output(0, false, "type: \"boolean\"\n");
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC18(%rip), %rdi	;, tmp114
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:286:             ast_output(0, true, "value: \"true\"\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC19(%rip), %rdi	;, tmp115
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L15	;
.L22:
; src/output.c:289:             ast_output(0, false, "type: \"boolean\"\n");
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC18(%rip), %rdi	;, tmp116
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:290:             ast_output(0, true, "value: \"false\"\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC20(%rip), %rdi	;, tmp117
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L15	;
.L21:
; src/output.c:293:             ast_output(0, false, "type: \"expression\"\n");
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$19, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC21(%rip), %rdi	;, tmp118
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:294:             ast_output(0, true, "value\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC22(%rip), %rdi	;, tmp119
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:295:             output_expression(primary->value.expr, outfile, indent + 1, parser);
	leaq	1(%rbp), %rdx	;, tmp120
	movq	(%r12), %rdi	; primary_16(D)->value.expr, primary_16(D)->value.expr
	movq	%r13, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:296:             break;
	jmp	.L15	;
.L20:
; src/output.c:298:             ast_output(0, false, "type: \"!\"\n");
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC23(%rip), %rdi	;, tmp122
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:299:             ast_output(0, true, "value\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC22(%rip), %rdi	;, tmp123
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:300:             output_primary(primary->value.operand, outfile, indent + 1, parser);
	leaq	1(%rbp), %rdx	;, tmp124
	movq	(%r12), %rdi	; primary_16(D)->value.operand, primary_16(D)->value.operand
	movq	%r13, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_primary	;
; src/output.c:301:             break;
	jmp	.L15	;
.L19:
; src/output.c:303:             ast_output(0, false, "type: \"-\"\n");
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC24(%rip), %rdi	;, tmp126
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:304:             ast_output(0, true, "value\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC22(%rip), %rdi	;, tmp127
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:305:             output_primary(primary->value.operand, outfile, indent + 1, parser);
	leaq	1(%rbp), %rdx	;, tmp128
	movq	(%r12), %rdi	; primary_16(D)->value.operand, primary_16(D)->value.operand
	movq	%r13, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_primary	;
; src/output.c:306:             break;
	jmp	.L15	;
.L17:
; src/output.c:308:             ast_output(0, false, "type: \"variable\"\n");
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC25(%rip), %rdi	;, tmp130
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:309:             ast_output(0, true, "value\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC22(%rip), %rdi	;, tmp131
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:310:             output_variable_access(primary->value.var, outfile, indent + 1, parser);
	leaq	1(%rbp), %rdx	;, tmp132
	movq	(%r12), %rdi	; primary_16(D)->value.var, primary_16(D)->value.var
	movq	%r13, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_variable_access	;
; src/output.c:311:             break;
	jmp	.L15	;
.L16:
; src/output.c:313:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%r12), %ecx	; primary_16(D)->type, primary_16(D)->type
	leaq	.LC26(%rip), %rdx	;, tmp135
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:317: }
	jmp	.L15	;
	.size	output_primary, .-output_primary
	.section	.rodata.str1.1
.LC27:
	.string	"UNKNOWN_OPERATOR"
.LC28:
	.string	"primary\n"
.LC29:
	.string	"operator: \"%s\"\n"
.LC30:
	.string	"left\n"
.LC31:
	.string	"right\n"
	.text
	.type	output_expression, @function
output_expression:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %r13	; tmp102, expression
	movq	%rsi, %rbx	; tmp103, outfile
	movq	%rdx, %rbp	; tmp104, indent
	movq	%rcx, %r12	; tmp105, parser
; src/output.c:256:     if (expression->operator == OP_NONE) {
	movl	24(%rdi), %edi	; expression_10(D)->operator, _1
; src/output.c:256:     if (expression->operator == OP_NONE) {
	cmpl	$19, %edi	;, _1
	je	.L35	;,
; src/output.c:260:         string op_str = operator_to_string(expression->operator);
	call	*operator_to_string@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp106, op_str
; src/output.c:261:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	%r12, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:261:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	testq	%r14, %r14	; op_str
	leaq	.LC27(%rip), %rax	;, tmp101
	cmove	%rax, %r14	; op_str,, tmp101, op_str
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r14, %rcx	; op_str,
	leaq	.LC29(%rip), %rdx	;, tmp96
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:262:         ast_output(0, false, "left\n");
	movq	%r12, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC30(%rip), %rdi	;, tmp97
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:263:         output_expression(expression->expr_left, outfile, indent + 1, parser);
	leaq	1(%rbp), %r14	;, _4
	movq	0(%r13), %rdi	; expression_10(D)->expr_left, expression_10(D)->expr_left
	movq	%r12, %rcx	; parser,
	movq	%r14, %rdx	; _4,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:264:         ast_output(0, true, "right\n");
	movq	%r12, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC31(%rip), %rdi	;, tmp99
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:265:         output_expression(expression->right, outfile, indent + 1, parser);
	movq	16(%r13), %rdi	; expression_10(D)->right, expression_10(D)->right
	movq	%r12, %rcx	; parser,
	movq	%r14, %rdx	; _4,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
.L29:
; src/output.c:268: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
.L35:
; src/output.c:257:         ast_output(0, true, "primary\n");
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$8, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC28(%rip), %rdi	;, tmp93
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:258:         output_primary(expression->prim_left, outfile, indent + 1, parser);
	leaq	1(%rbp), %rdx	;, tmp94
	movq	8(%r13), %rdi	; expression_10(D)->prim_left, expression_10(D)->prim_left
	movq	%r12, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_primary	;
	jmp	.L29	;
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
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %r13	; tmp98, variable
	movq	%rsi, %rbx	; tmp99, outfile
	movq	%rdx, %r12	; tmp100, indent
	movq	%rcx, %rbp	; tmp101, parser
; src/output.c:128:     ast_output(0, false, "type\n");
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp91
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:129:     output_name(variable->type, outfile, indent + 1, parser);
	leaq	1(%r12), %r14	;, _1
	movq	0(%r13), %rdi	; variable_12(D)->type, variable_12(D)->type
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _1,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:130:     ast_output(0, false, "name\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC32(%rip), %rdi	;, tmp93
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:131:     output_name(variable->name, outfile, indent + 1, parser);
	movq	8(%r13), %rdi	; variable_12(D)->name, variable_12(D)->name
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _1,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:132:     if (variable->value != NULL) {
	cmpq	$0, 16(%r13)	;, variable_12(D)->value
	je	.L37	;,
; src/output.c:133:         ast_output(0, true, "value\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC22(%rip), %rdi	;, tmp95
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:134:         output_expression(variable->value, outfile, indent + 1, parser);
	movq	16(%r13), %rdi	; variable_12(D)->value, variable_12(D)->value
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _1,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
.L36:
; src/output.c:138: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
.L37:
; src/output.c:136:         ast_output(0, true, "value: \"NULL\"\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC33(%rip), %rdi	;, tmp97
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:138: }
	jmp	.L36	;
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
	.type	output_variable_access, @function
output_variable_access:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$24, %rsp	;,
	movq	%rdi, %r12	; tmp127, variable_access
	movq	%rsi, %rbx	; tmp128, outfile
	movq	%rdx, %r13	; tmp129, indent
	movq	%rcx, %rbp	; tmp130, parser
; src/output.c:322:     switch (variable_access->type) {
	movl	16(%rdi), %eax	; variable_access_19(D)->type, _1
; src/output.c:322:     switch (variable_access->type) {
	cmpl	$2, %eax	;, _1
	je	.L41	;,
	ja	.L42	;,
	testl	%eax, %eax	; _1
	je	.L53	;,
; src/output.c:329:             args = list_copy(variable_access->content.args);
	movq	8(%rdi), %rdi	; variable_access_19(D)->content.args, variable_access_19(D)->content.args
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp131, %sfp
; src/output.c:330:             ast_output(0, false, "type: \"function_call\"\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$22, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC35(%rip), %rdi	;, tmp108
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:331:             ast_output(0, false, "function\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC36(%rip), %rdi	;, tmp109
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:332:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	leaq	1(%r13), %r15	;, _5
	movq	(%r12), %rdi	; variable_access_19(D)->base, variable_access_19(D)->base
	movq	%rbp, %rcx	; parser,
	movq	%r15, %rdx	; _5,
	movq	%rbx, %rsi	; outfile,
	call	output_variable_access	;
; src/output.c:333:             ast_output(0, true, "arguments\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC37(%rip), %rdi	;, tmp111
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:335:             index = -1;
	movl	$-1, %r14d	;, index
; src/output.c:336:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	jmp	.L48	;
.L42:
; src/output.c:322:     switch (variable_access->type) {
	cmpl	$3, %eax	;, _1
	jne	.L54	;,
; src/output.c:342:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movl	$0, %edx	;,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$29, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC39(%rip), %rdi	;, tmp114
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:343:             ast_output(0, false, "sequence\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC40(%rip), %rdi	;, tmp115
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:344:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	leaq	1(%r13), %r14	;, _8
	movq	(%r12), %rdi	; variable_access_19(D)->base, variable_access_19(D)->base
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _8,
	movq	%rbx, %rsi	; outfile,
	call	output_variable_access	;
; src/output.c:345:             ast_output(0, true, "index\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC41(%rip), %rdi	;, tmp117
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:346:             output_expression(variable_access->content.index, outfile, indent + 1, parser);
	movq	8(%r12), %rdi	; variable_access_19(D)->content.index, variable_access_19(D)->content.index
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _8,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:347:             break;
	jmp	.L40	;
.L53:
; src/output.c:324:             ast_output(0, false, "type: \"name\"\n");
	movl	$0, %edx	;,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$13, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC34(%rip), %rdi	;, tmp103
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:325:             ast_output(0, true, "name\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC32(%rip), %rdi	;, tmp104
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:326:             output_name(variable_access->content.name, outfile, indent + 1, parser);
	leaq	1(%r13), %rdx	;, tmp105
	movq	8(%r12), %rdi	; variable_access_19(D)->content.name, variable_access_19(D)->content.name
	movq	%rbp, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
.L40:
; src/output.c:360: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L49:
; src/output.c:337:                 ast_output(1, false, "arguments[%d]\n", ++index);
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r15, %rsi	; _5,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:337:                 ast_output(1, false, "arguments[%d]\n", ++index);
	addl	$1, %r14d	;, index
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%r14d, %ecx	; index,
	leaq	.LC38(%rip), %rdx	;,
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:338:                 output_expression(arg, outfile, indent + 2, parser);
	leaq	2(%r13), %rdx	;, tmp113
	movq	%rbp, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	movq	%r12, %rdi	; arg,
	call	output_expression	;
.L48:
; src/output.c:336:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp132, arg
; src/output.c:336:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	; arg
	jne	.L49	;,
	jmp	.L40	;
.L41:
; src/output.c:349:             ast_output(0, false, "type: \"get_attribute\"\n");
	movl	$0, %edx	;,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$22, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC42(%rip), %rdi	;, tmp119
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:350:             ast_output(0, false, "object\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC43(%rip), %rdi	;, tmp120
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:351:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	leaq	1(%r13), %r14	;, _11
	movq	(%r12), %rdi	; variable_access_19(D)->base, variable_access_19(D)->base
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _11,
	movq	%rbx, %rsi	; outfile,
	call	output_variable_access	;
; src/output.c:352:             ast_output(0, true, "attribute_name\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC44(%rip), %rdi	;, tmp122
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:353:             output_name(variable_access->content.attr_name, outfile, indent + 1, parser);
	movq	8(%r12), %rdi	; variable_access_19(D)->content.attr_name, variable_access_19(D)->content.attr_name
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _11,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:354:             break;
	jmp	.L40	;
.L54:
; src/output.c:356:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movl	$1, %edx	;,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	16(%r12), %ecx	; variable_access_19(D)->type, variable_access_19(D)->type
	leaq	.LC45(%rip), %rdx	;, tmp125
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:360: }
	jmp	.L40	;
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
	.type	output_statement, @function
output_statement:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$40, %rsp	;,
	movq	%rdi, %r13	; tmp195, statement
	movq	%rsi, %rbx	; tmp196, outfile
	movq	%rdx, %r12	; tmp197, indent
	movq	%rcx, %rbp	; tmp198, parser
; src/output.c:141:     switch (statement->type) {
	cmpl	$7, 8(%rdi)	;, statement_19(D)->type
	ja	.L56	;,
	movl	8(%rdi), %eax	; statement_19(D)->type, statement_19(D)->type
	leaq	.L58(%rip), %rdx	;, tmp137
	movslq	(%rdx,%rax,4), %rax	;, tmp139
	addq	%rdx, %rax	; tmp137, tmp140
	jmp	*%rax	; tmp140
	.section	.rodata
	.align 4
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
; src/output.c:143:             ast_output(0, false, "if_statement\n");
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$13, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC46(%rip), %rdi	;, tmp142
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:144:             output_if(statement->stmt.if_stmt, outfile, indent + 1, parser);
	leaq	1(%r12), %r14	;, _2
	movq	0(%r13), %r15	; statement_19(D)->stmt.if_stmt, _3
; src/output.c:190:     list(Statement*) body = list_copy(if_->body);
	movq	8(%r15), %rdi	; _3->body, _3->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp199, body
; src/output.c:191:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	movq	16(%r15), %rdi	; _3->else_if, _3->else_if
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp200, %sfp
; src/output.c:192:     list(Statement*) else_body = list_copy(if_->else_body);
	movq	24(%r15), %rdi	; _3->else_body, _3->else_body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 16(%rsp)	; tmp201, %sfp
; src/output.c:193:     ast_output(0, false, "condition\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r14, 24(%rsp)	; _2, %sfp
	movq	%r14, %rsi	; _2,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC47(%rip), %rdi	;, tmp146
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:194:     output_expression(if_->condition, outfile, indent + 1, parser);
	leaq	2(%r12), %r14	;, _57
	movq	(%r15), %rdi	; _3->condition, _3->condition
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _57,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:195:     ast_output(0, false, "body\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	24(%rsp), %rsi	; %sfp,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC48(%rip), %rdi	;, tmp148
	call	*fwrite@GOTPCREL(%rip)	;
.L66:
; src/output.c:197:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r13, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp202, statement
; src/output.c:197:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L88	;,
; src/output.c:198:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _57,
	movq	%rbx, %rsi	; outfile,
	call	output_statement	;
	jmp	.L66	;
.L88:
; src/output.c:199:     ast_output(0, false, "else_if\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	24(%rsp), %rsi	; %sfp,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$8, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC49(%rip), %rdi	;, tmp149
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:212:     output_expression(else_if->condition, outfile, indent + 1, parser);
	leaq	3(%r12), %r13	;, _64
.L68:
; src/output.c:201:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp205, else_if
; src/output.c:201:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	testq	%rax, %rax	; else_if
	je	.L89	;,
; src/output.c:210:     list(Statement*) body = list_copy(else_if->body);
	movq	8(%r15), %rdi	; else_if_60->body, else_if_60->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp203, body
; src/output.c:211:     ast_output(0, false, "condition\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r14, %rsi	; _57,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC47(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:212:     output_expression(else_if->condition, outfile, indent + 1, parser);
	movq	(%r15), %rdi	; else_if_60->condition, else_if_60->condition
	movq	%rbp, %rcx	; parser,
	movq	%r13, %rdx	; _64,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:213:     ast_output(0, true, "body\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r14, %rsi	; _57,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC48(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
.L69:
; src/output.c:215:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r12, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
; src/output.c:215:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L68	;,
; src/output.c:216:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rbp, %rcx	; parser,
	movq	%r13, %rdx	; _64,
	movq	%rbx, %rsi	; outfile,
	movq	%rax, %rdi	; statement,
	call	output_statement	;
	jmp	.L69	;
.L89:
; src/output.c:203:     ast_output(0, true, "else_body\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	24(%rsp), %rsi	; %sfp,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC50(%rip), %rdi	;, tmp154
	call	*fwrite@GOTPCREL(%rip)	;
.L72:
; src/output.c:204:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	movq	16(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp206, statement
; src/output.c:204:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L55	;,
; src/output.c:205:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _57,
	movq	%rbx, %rsi	; outfile,
	call	output_statement	;
	jmp	.L72	;
.L61:
; src/output.c:147:             ast_output(0, false, "for_statement\n");
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC51(%rip), %rdi	;, tmp155
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:148:             output_for(statement->stmt.for_stmt, outfile, indent + 1, parser);
	leaq	1(%r12), %r14	;, _4
	movq	0(%r13), %r15	; statement_19(D)->stmt.for_stmt, _5
; src/output.c:221:     list(Statement*) body = list_copy(for_->body);
	movq	24(%r15), %rdi	; _5->body, _5->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp207, body
; src/output.c:222:     if (for_->initializer != NULL) {
	cmpq	$0, (%r15)	;, _5->initializer
	je	.L75	;,
; src/output.c:223:         ast_output(0, false, "initializer\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r14, %rsi	; _4,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC52(%rip), %rdi	;, tmp157
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:224:         output_variable(for_->initializer, outfile, indent + 1, parser);
	leaq	2(%r12), %rdx	;, tmp158
	movq	(%r15), %rdi	; _5->initializer, _5->initializer
	movq	%rbp, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_variable	;
.L76:
; src/output.c:227:     if (for_->condition != NULL) {
	cmpq	$0, 8(%r15)	;, _5->condition
	je	.L77	;,
; src/output.c:228:         ast_output(0, false, "condition\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r14, %rsi	; _4,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC47(%rip), %rdi	;, tmp161
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:229:         output_expression(for_->condition, outfile, indent + 1, parser);
	leaq	2(%r12), %rdx	;, tmp162
	movq	8(%r15), %rdi	; _5->condition, _5->condition
	movq	%rbp, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
.L78:
; src/output.c:232:     if (for_->increment != NULL) {
	cmpq	$0, 16(%r15)	;, _5->increment
	je	.L79	;,
; src/output.c:233:         ast_output(0, false, "increment\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r14, %rsi	; _4,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC55(%rip), %rdi	;, tmp165
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:234:         output_expression(for_->increment, outfile, indent + 1, parser);
	leaq	2(%r12), %rdx	;, tmp166
	movq	16(%r15), %rdi	; _5->increment, _5->increment
	movq	%rbp, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
.L80:
; src/output.c:237:     ast_output(0, true, "body\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r14, %rsi	; _4,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC48(%rip), %rdi	;, tmp169
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:240:         output_statement(statement, outfile, indent + 1, parser);
	addq	$2, %r12	;, tmp194
.L81:
; src/output.c:239:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r13, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp208, statement
; src/output.c:239:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L55	;,
; src/output.c:240:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rbp, %rcx	; parser,
	movq	%r12, %rdx	; tmp194,
	movq	%rbx, %rsi	; outfile,
	call	output_statement	;
	jmp	.L81	;
.L75:
; src/output.c:226:         ast_output(0, false, "initializer: \"NULL\"\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r14, %rsi	; _4,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$20, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC53(%rip), %rdi	;, tmp160
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L76	;
.L77:
; src/output.c:231:         ast_output(0, false, "condition: \"NULL\"\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r14, %rsi	; _4,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC54(%rip), %rdi	;, tmp164
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L78	;
.L79:
; src/output.c:236:         ast_output(0, false, "increment: \"NULL\"\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r14, %rsi	; _4,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC56(%rip), %rdi	;, tmp168
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L80	;
.L62:
; src/output.c:151:             ast_output(0, false, "while_statement\n");
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC57(%rip), %rdi	;, tmp171
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:152:             output_while(statement->stmt.while_stmt, outfile, indent + 1, parser);
	leaq	1(%r12), %r14	;, _6
	movq	0(%r13), %r15	; statement_19(D)->stmt.while_stmt, _7
; src/output.c:245:     list(Statement*) body = list_copy(while_->body);
	movq	8(%r15), %rdi	; _7->body, _7->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp209, body
; src/output.c:246:     ast_output(0, false, "condition\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r14, %rsi	; _6,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC47(%rip), %rdi	;, tmp173
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:247:     output_expression(while_->condition, outfile, indent + 1, parser);
	addq	$2, %r12	;, _82
	movq	(%r15), %rdi	; _7->condition, _7->condition
	movq	%rbp, %rcx	; parser,
	movq	%r12, %rdx	; _82,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:248:     ast_output(0, true, "body\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r14, %rsi	; _6,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC48(%rip), %rdi	;, tmp175
	call	*fwrite@GOTPCREL(%rip)	;
.L83:
; src/output.c:250:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r13, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp210, statement
; src/output.c:250:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L55	;,
; src/output.c:251:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rbp, %rcx	; parser,
	movq	%r12, %rdx	; _82,
	movq	%rbx, %rsi	; outfile,
	call	output_statement	;
	jmp	.L83	;
.L64:
; src/output.c:155:             ast_output(0, false, "variable_declaration_statement\n");
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC58(%rip), %rdi	;, tmp176
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:156:             output_variable(statement->stmt.var, outfile, indent + 1, parser);
	leaq	1(%r12), %rdx	;, tmp177
	movq	0(%r13), %rdi	; statement_19(D)->stmt.var, statement_19(D)->stmt.var
	movq	%rbp, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_variable	;
.L55:
; src/output.c:187: }
	addq	$40, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L60:
; src/output.c:159:             if (statement->stmt.expr == NULL) {
	cmpq	$0, (%rdi)	;, statement_19(D)->stmt.expr
	je	.L90	;,
; src/output.c:164:             ast_output(0, false, "return_statement\n");
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC60(%rip), %rdi	;, tmp180
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:165:             output_expression(statement->stmt.expr, outfile, indent + 1, parser);
	leaq	1(%r12), %rdx	;, tmp181
	movq	0(%r13), %rdi	; statement_19(D)->stmt.expr, statement_19(D)->stmt.expr
	movq	%rbp, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:166:             break;
	jmp	.L55	;
.L90:
; src/output.c:160:                 ast_output(0, false, "return_statement: \"NULL\"\n");
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$25, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC59(%rip), %rdi	;, tmp179
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:162:                 return;
	jmp	.L55	;
.L59:
; src/output.c:168:             ast_output(0, false, "break_statement: \"NULL\"\n");
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$24, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC61(%rip), %rdi	;, tmp183
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L55	;
.L57:
; src/output.c:171:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$27, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC62(%rip), %rdi	;, tmp184
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L55	;
.L65:
; src/output.c:174:             if (statement->stmt.expr == NULL) {
	cmpq	$0, (%rdi)	;, statement_19(D)->stmt.expr
	je	.L91	;,
; src/output.c:179:             ast_output(0, false, "expression_statement\n");
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$21, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC64(%rip), %rdi	;, tmp186
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:180:             output_expression(statement->stmt.expr, outfile, indent + 1, parser);
	leaq	1(%r12), %rdx	;, tmp187
	movq	0(%r13), %rdi	; statement_19(D)->stmt.expr, statement_19(D)->stmt.expr
	movq	%rbp, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:181:             break;
	jmp	.L55	;
.L91:
; src/output.c:175:                 ast_output(0, false, "expression_statement: \"NULL\"\n");
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$29, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC63(%rip), %rdi	;, tmp185
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:177:                 return;
	jmp	.L55	;
.L56:
; src/output.c:183:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%r13), %ecx	; statement_19(D)->type, statement_19(D)->type
	leaq	.LC65(%rip), %rdx	;, tmp190
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L55	;
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
	subq	$56, %rsp	;,
	movq	%rsi, %r14	; tmp186, outfile
	movq	%rdx, %r13	; tmp187, indent
	movq	%rcx, %r15	; tmp188, parser
; src/output.c:43:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rdi), %rdi	; code_5(D)->members, code_5(D)->members
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 40(%rsp)	; tmp189, %sfp
	movq	%r15, %rax	; parser, parser
	movq	%r14, %r15	; outfile, outfile
	movq	%rax, %r14	; parser, parser
; src/output.c:45:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	jmp	.L93	;
.L94:
; src/output.c:28:             ast_output(0, false, "function\n");
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC36(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:29:             output_function(code_member->content.function, outfile, indent + 1, parser);
	leaq	2(%r13), %rbp	;, _17
	movq	%rbp, 8(%rsp)	; _17, %sfp
	movq	(%rbx), %rbx	; member_9->content.function, _18
; src/output.c:58:     ast_output(0, false, "name\n");
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; _17,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC32(%rip), %rdi	;, tmp141
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:59:     output_name(function->name, outfile, indent + 1, parser);
	leaq	3(%r13), %r12	;, _26
	movq	(%rbx), %rdi	; _18->name, _18->name
	movq	%r14, %rcx	; parser,
	movq	%r12, %rdx	; _26,
	movq	%r15, %rsi	; outfile,
	call	output_name	;
; src/output.c:60:     ast_output(0, false, "return_type\n");
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; _17,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rdi	;, tmp143
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:61:     output_name(function->return_type, outfile, indent + 1, parser);
	movq	8(%rbx), %rdi	; _18->return_type, _18->return_type
	movq	%r14, %rcx	; parser,
	movq	%r12, %rdx	; _26,
	movq	%r15, %rsi	; outfile,
	call	output_name	;
; src/output.c:62:     ast_output(0, false, "parameters\n");
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; _17,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$11, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC69(%rip), %rdi	;, tmp145
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:63:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%rbx), %rdi	; _18->parameters, _18->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, (%rsp)	; tmp190, %sfp
; src/output.c:64:     list(Statement*) body = list_copy(function->body);
	movq	24(%rbx), %rdi	; _18->body, _18->body
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:66:     int index = -1;
	movl	$-1, %ebp	;, index
	movq	%rax, 16(%rsp)	; body, %sfp
.L99:
; src/output.c:67:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp192, parameter
; src/output.c:67:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	; parameter
	je	.L116	;,
; src/output.c:68:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r12, %rsi	; _26,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:68:         ast_output(1, false, "parameters[%d]\n", ++index);
	addl	$1, %ebp	;, index
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebp, %ecx	; index,
	leaq	.LC70(%rip), %rdx	;,
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:69:         output_variable(parameter, outfile, indent + 2, parser);
	leaq	4(%r13), %rdx	;, tmp149
	movq	%r14, %rcx	; parser,
	movq	%r15, %rsi	; outfile,
	movq	%rbx, %rdi	; parameter,
	call	output_variable	;
	jmp	.L99	;
.L116:
; src/output.c:71:     ast_output(0, true, "body\n");
	movq	16(%rsp), %rbx	; %sfp, body
	movq	%r14, %rcx	; parser,
	movl	$1, %edx	;,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC48(%rip), %rdi	;, tmp150
	call	*fwrite@GOTPCREL(%rip)	;
.L101:
; src/output.c:73:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbx, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp193, statement
; src/output.c:73:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L93	;,
; src/output.c:74:         output_statement(statement, outfile, indent + 1, parser);
	movq	%r14, %rcx	; parser,
	movq	%r12, %rdx	; _26,
	movq	%r15, %rsi	; outfile,
	call	output_statement	;
	jmp	.L101	;
.L95:
; src/output.c:32:             ast_output(0, false, "class\n");
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC71(%rip), %rdi	;, tmp151
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:33:             output_class(code_member->content.class, outfile, indent + 1, parser);
	leaq	2(%r13), %rbp	;, _19
	movq	(%rbx), %rbx	; member_9->content.class, _20
; src/output.c:117:     ast_output(0, false, "name\n");
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; _19,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC32(%rip), %rdi	;, tmp152
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:118:     output_name(class->name, outfile, indent + 1, parser);
	leaq	3(%r13), %rax	;, _38
	movq	%rax, 16(%rsp)	; _38, %sfp
	movq	(%rbx), %rdi	; _20->name, _20->name
	movq	%r14, %rcx	; parser,
	movq	%rax, %rdx	; _38,
	movq	%r15, %rsi	; outfile,
	call	output_name	;
; src/output.c:119:     ast_output(0, true, "members\n");
	movq	%r14, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; _19,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$8, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC72(%rip), %rdi	;, tmp154
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:120:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rbx), %rdi	; _20->members, _20->members
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp194, %sfp
; src/output.c:122:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	jmp	.L103	;
.L104:
; src/output.c:102:             ast_output(0, false, "method\n");
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	16(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC73(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:103:             output_method(class_member->content.method, outfile, indent + 1, parser);
	leaq	4(%r13), %rbp	;, _44
	movq	%rbp, 24(%rsp)	; _44, %sfp
	movq	(%rbx), %rbx	; member_42->content.method, _45
; src/output.c:79:     ast_output(0, false, "name\n");
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; _44,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC32(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:80:     output_name(method->name, outfile, indent + 1, parser);
	leaq	5(%r13), %r12	;, _49
	movq	(%rbx), %rdi	; _45->name, _45->name
	movq	%r14, %rcx	; parser,
	movq	%r12, %rdx	; _49,
	movq	%r15, %rsi	; outfile,
	call	output_name	;
; src/output.c:81:     ast_output(0, false, "return_type\n");
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; _44,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rdi	;, tmp159
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:82:     output_name(method->return_type, outfile, indent + 1, parser);
	movq	8(%rbx), %rdi	; _45->return_type, _45->return_type
	movq	%r14, %rcx	; parser,
	movq	%r12, %rdx	; _49,
	movq	%r15, %rsi	; outfile,
	call	output_name	;
; src/output.c:83:     ast_output(0, false, "parameters\n");
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; _44,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$11, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC69(%rip), %rdi	;, tmp161
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:84:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%rbx), %rdi	; _45->parameters, _45->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, (%rsp)	; tmp195, %sfp
; src/output.c:85:     list(Statement*) body = list_copy(method->body);
	movq	24(%rbx), %rdi	; _45->body, _45->body
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:87:     int index = -1;
	movl	$-1, %ebp	;, index
	movq	%rax, 32(%rsp)	; body, %sfp
; src/output.c:88:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	jmp	.L107	;
.L108:
; src/output.c:89:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r12, %rsi	; _49,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:89:         ast_output(1, false, "parameters[%d]\n", ++index);
	addl	$1, %ebp	;, index
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebp, %ecx	; index,
	leaq	.LC70(%rip), %rdx	;,
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:90:         output_variable(parameter, outfile, indent + 2, parser);
	leaq	6(%r13), %rdx	;, tmp165
	movq	%r14, %rcx	; parser,
	movq	%r15, %rsi	; outfile,
	movq	%rbx, %rdi	; parameter,
	call	output_variable	;
.L107:
; src/output.c:88:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp197, parameter
; src/output.c:88:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	; parameter
	jne	.L108	;,
; src/output.c:92:     ast_output(0, true, "body\n");
	movq	32(%rsp), %rbx	; %sfp, body
	movq	%r14, %rcx	; parser,
	movl	$1, %edx	;,
	movq	24(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC48(%rip), %rdi	;, tmp166
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L109	;
.L110:
; src/output.c:95:         output_statement(statement, outfile, indent + 1, parser);
	movq	%r14, %rcx	; parser,
	movq	%r12, %rdx	; _49,
	movq	%r15, %rsi	; outfile,
	call	output_statement	;
.L109:
; src/output.c:94:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbx, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp198, statement
; src/output.c:94:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L110	;,
.L103:
; src/output.c:122:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp199, member
; src/output.c:122:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	; member
	je	.L93	;,
; src/output.c:100:     switch (class_member->type) {
	movl	8(%rbx), %eax	; member_42->type, _43
; src/output.c:100:     switch (class_member->type) {
	testl	%eax, %eax	; _43
	je	.L104	;,
	cmpl	$1, %eax	;, _43
	je	.L105	;,
; src/output.c:110:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	16(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%rbx), %ecx	; member_42->type, member_42->type
	leaq	.LC75(%rip), %rdx	;, tmp171
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L103	;
.L105:
; src/output.c:106:             ast_output(0, false, "variable\n");
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	16(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC74(%rip), %rdi	;, tmp167
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:107:             output_variable(class_member->content.variable, outfile, indent + 1, parser);
	leaq	4(%r13), %rdx	;, tmp168
	movq	(%rbx), %rdi	; member_42->content.variable, member_42->content.variable
	movq	%r14, %rcx	; parser,
	movq	%r15, %rsi	; outfile,
	call	output_variable	;
; src/output.c:108:             break;
	jmp	.L103	;
.L96:
; src/output.c:36:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%rbx), %ecx	; member_9->type, member_9->type
	leaq	.LC76(%rip), %rdx	;, tmp173
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L93:
; src/output.c:45:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	movq	40(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp200, member
; src/output.c:45:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	; member
	je	.L117	;,
; src/output.c:46:         output_code_member(member, outfile, indent + 1, parser);
	leaq	1(%r13), %rsi	;, _2
; src/output.c:22:     switch (code_member->type) {
	movl	8(%rbx), %eax	; member_9->type, _14
; src/output.c:22:     switch (code_member->type) {
	cmpl	$1, %eax	;, _14
	je	.L94	;,
	cmpl	$2, %eax	;, _14
	je	.L95	;,
	testl	%eax, %eax	; _14
	jne	.L96	;,
; src/output.c:24:             ast_output(0, false, "import\n");
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC67(%rip), %rdi	;, tmp135
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:25:             output_import(code_member->content.import, outfile, indent + 1, parser);
	leaq	2(%r13), %rbp	;, _15
	movq	(%rbx), %rbx	; member_9->content.import, _16
; src/output.c:51:     ast_output(0, false, "name\n");
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; _15,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC32(%rip), %rdi	;, tmp136
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:52:     output_name(import->name, outfile, indent + 1, parser);
	leaq	3(%r13), %rdx	;, tmp137
	movq	(%rbx), %rdi	; _16->name, _16->name
	movq	%r14, %rcx	; parser,
	movq	%r15, %rsi	; outfile,
	call	output_name	;
; src/output.c:53:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	%r14, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; _15,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:53:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	8(%rbx), %rcx	; _16->source, _24
; src/output.c:53:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	testq	%rcx, %rcx	; _24
	leaq	.LC66(%rip), %rax	;, tmp174
	cmove	%rax, %rcx	; _24,, tmp174, _24
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC68(%rip), %rdx	;, tmp139
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:55: }
	jmp	.L93	;
.L117:
; src/output.c:48: }
	addq	$56, %rsp	;,
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
