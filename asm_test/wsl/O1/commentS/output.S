	.file	"output.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O1 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
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
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rsi, %rbx	; tmp134, outfile
	movq	%rdx, %r12	; tmp135, indent
	movq	%rcx, %r13	; tmp136, indent_has_next
; src/output.c:365:     if (name == NULL) {
	testq	%rdi, %rdi	; name
	je	.L14	;,
	movq	%rdi, %rbp	; tmp133, name
; src/output.c:370:     ast_output(0, false, "name: \"%s\"\n", name->name);
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
; src/output.c:371:     ast_output(0, false, "id: %zu\n", name->id);
	movq	%r13, %rcx	; indent_has_next,
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
; src/output.c:372:     switch (name->kind) {
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
; src/output.c:366:         ast_output(0, true, "Name: \"NULL\"\n");
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$13, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp99
	call	*fwrite@GOTPCREL(%rip)	;
.L1:
; src/output.c:409: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L5:
; src/output.c:374:             ast_output(0, true, "kind: \"type\"\n");
	movq	%r13, %rcx	; indent_has_next,
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
; src/output.c:377:             ast_output(0, false, "kind: \"variable\"\n");
	movq	%r13, %rcx	; indent_has_next,
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
; src/output.c:378:             ast_output(0, true, "type\n");
	movq	%r13, %rcx	; indent_has_next,
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
; src/output.c:379:             output_name(name->type, outfile, indent + 1, indent_has_next);
	leaq	1(%r12), %rdx	;, tmp113
	movq	0(%rbp), %rdi	; name_15(D)->type, name_15(D)->type
	movq	%r13, %rcx	; indent_has_next,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:380:             break;
	jmp	.L1	;
.L11:
; src/output.c:382:             ast_output(0, false, "kind: \"function\"\n");
	movq	%r13, %rcx	; indent_has_next,
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
; src/output.c:383:             ast_output(0, true, "return_type\n");
	movq	%r13, %rcx	; indent_has_next,
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
; src/output.c:384:             output_name(name->type, outfile, indent + 1, indent_has_next);
	leaq	1(%r12), %rdx	;, tmp117
	movq	0(%rbp), %rdi	; name_15(D)->type, name_15(D)->type
	movq	%r13, %rcx	; indent_has_next,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:385:             break;
	jmp	.L1	;
.L10:
; src/output.c:387:             ast_output(0, false, "kind: \"method\"\n");
	movq	%r13, %rcx	; indent_has_next,
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
; src/output.c:388:             ast_output(0, true, "return_type\n");
	movq	%r13, %rcx	; indent_has_next,
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
; src/output.c:389:             output_name(name->type, outfile, indent + 1, indent_has_next);
	leaq	1(%r12), %rdx	;, tmp121
	movq	0(%rbp), %rdi	; name_15(D)->type, name_15(D)->type
	movq	%r13, %rcx	; indent_has_next,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:390:             break;
	jmp	.L1	;
.L12:
; src/output.c:392:             ast_output(0, true, "kind: \"class\"\n");
	movq	%r13, %rcx	; indent_has_next,
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
; src/output.c:395:             ast_output(0, false, "kind: \"attribute\"\n");
	movq	%r13, %rcx	; indent_has_next,
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
; src/output.c:396:             ast_output(0, true, "type\n");
	movq	%r13, %rcx	; indent_has_next,
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
; src/output.c:397:             output_name(name->type, outfile, indent + 1, indent_has_next);
	leaq	1(%r12), %rdx	;, tmp126
	movq	0(%rbp), %rdi	; name_15(D)->type, name_15(D)->type
	movq	%r13, %rcx	; indent_has_next,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:398:             break;
	jmp	.L1	;
.L8:
; src/output.c:400:             ast_output(0, false, "kind: \"parameter\"\n");
	movq	%r13, %rcx	; indent_has_next,
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
; src/output.c:401:             ast_output(0, true, "type\n");
	movq	%r13, %rcx	; indent_has_next,
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
; src/output.c:402:             output_name(name->type, outfile, indent + 1, indent_has_next);
	leaq	1(%r12), %rdx	;, tmp130
	movq	0(%rbp), %rdi	; name_15(D)->type, name_15(D)->type
	movq	%r13, %rcx	; indent_has_next,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:403:             break;
	jmp	.L1	;
.L4:
; src/output.c:405:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	movq	%r13, %rcx	; indent_has_next,
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
	movq	%rcx, %r13	; tmp139, indent_has_next
; src/output.c:273:     switch (primary->type) {
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
; src/output.c:275:             ast_output(0, false, "type: \"integer\"\n");
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
; src/output.c:276:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	%r13, %rcx	; indent_has_next,
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
; src/output.c:319: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L25:
; src/output.c:279:             ast_output(0, false, "type: \"float\"\n");
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
; src/output.c:280:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	%r13, %rcx	; indent_has_next,
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
; src/output.c:283:             ast_output(0, false, "type: \"string\"\n");
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
; src/output.c:284:             ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
	movq	%r13, %rcx	; indent_has_next,
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
; src/output.c:287:             ast_output(0, false, "type: \"boolean\"\n");
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
; src/output.c:288:             ast_output(0, true, "value: \"true\"\n");
	movq	%r13, %rcx	; indent_has_next,
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
; src/output.c:291:             ast_output(0, false, "type: \"boolean\"\n");
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
; src/output.c:292:             ast_output(0, true, "value: \"false\"\n");
	movq	%r13, %rcx	; indent_has_next,
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
; src/output.c:295:             ast_output(0, false, "type: \"expression\"\n");
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
; src/output.c:296:             ast_output(0, true, "value\n");
	movq	%r13, %rcx	; indent_has_next,
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
; src/output.c:297:             output_expression(primary->value.expr, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %rdx	;, tmp120
	movq	(%r12), %rdi	; primary_16(D)->value.expr, primary_16(D)->value.expr
	movq	%r13, %rcx	; indent_has_next,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:298:             break;
	jmp	.L15	;
.L20:
; src/output.c:300:             ast_output(0, false, "type: \"!\"\n");
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
; src/output.c:301:             ast_output(0, true, "value\n");
	movq	%r13, %rcx	; indent_has_next,
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
; src/output.c:302:             output_primary(primary->value.operand, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %rdx	;, tmp124
	movq	(%r12), %rdi	; primary_16(D)->value.operand, primary_16(D)->value.operand
	movq	%r13, %rcx	; indent_has_next,
	movq	%rbx, %rsi	; outfile,
	call	output_primary	;
; src/output.c:303:             break;
	jmp	.L15	;
.L19:
; src/output.c:305:             ast_output(0, false, "type: \"-\"\n");
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
; src/output.c:306:             ast_output(0, true, "value\n");
	movq	%r13, %rcx	; indent_has_next,
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
; src/output.c:307:             output_primary(primary->value.operand, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %rdx	;, tmp128
	movq	(%r12), %rdi	; primary_16(D)->value.operand, primary_16(D)->value.operand
	movq	%r13, %rcx	; indent_has_next,
	movq	%rbx, %rsi	; outfile,
	call	output_primary	;
; src/output.c:308:             break;
	jmp	.L15	;
.L17:
; src/output.c:310:             ast_output(0, false, "type: \"variable\"\n");
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
; src/output.c:311:             ast_output(0, true, "value\n");
	movq	%r13, %rcx	; indent_has_next,
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
; src/output.c:312:             output_variable_access(primary->value.var, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %rdx	;, tmp132
	movq	(%r12), %rdi	; primary_16(D)->value.var, primary_16(D)->value.var
	movq	%r13, %rcx	; indent_has_next,
	movq	%rbx, %rsi	; outfile,
	call	output_variable_access	;
; src/output.c:313:             break;
	jmp	.L15	;
.L16:
; src/output.c:315:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
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
; src/output.c:319: }
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
	movq	%rcx, %r12	; tmp105, indent_has_next
; src/output.c:258:     if (expression->operator == OP_NONE) {
	movl	24(%rdi), %edi	; expression_10(D)->operator, _1
; src/output.c:258:     if (expression->operator == OP_NONE) {
	cmpl	$19, %edi	;, _1
	je	.L35	;,
; src/output.c:262:         string op_str = operator_to_string(expression->operator);
	call	*operator_to_string@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp106, op_str
; src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	%r12, %rcx	; indent_has_next,
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
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
; src/output.c:264:         ast_output(0, false, "left\n");
	movq	%r12, %rcx	; indent_has_next,
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
; src/output.c:265:         output_expression(expression->expr_left, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %r14	;, _4
	movq	0(%r13), %rdi	; expression_10(D)->expr_left, expression_10(D)->expr_left
	movq	%r12, %rcx	; indent_has_next,
	movq	%r14, %rdx	; _4,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:266:         ast_output(0, true, "right\n");
	movq	%r12, %rcx	; indent_has_next,
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
; src/output.c:267:         output_expression(expression->right, outfile, indent + 1, indent_has_next);
	movq	16(%r13), %rdi	; expression_10(D)->right, expression_10(D)->right
	movq	%r12, %rcx	; indent_has_next,
	movq	%r14, %rdx	; _4,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
.L29:
; src/output.c:270: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
.L35:
; src/output.c:259:         ast_output(0, true, "primary\n");
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
; src/output.c:260:         output_primary(expression->prim_left, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %rdx	;, tmp94
	movq	8(%r13), %rdi	; expression_10(D)->prim_left, expression_10(D)->prim_left
	movq	%r12, %rcx	; indent_has_next,
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
	movq	%rcx, %rbp	; tmp101, indent_has_next
; src/output.c:130:     ast_output(0, false, "type\n");
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
; src/output.c:131:     output_name(variable->type, outfile, indent + 1, indent_has_next);
	leaq	1(%r12), %r14	;, _1
	movq	0(%r13), %rdi	; variable_12(D)->type, variable_12(D)->type
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r14, %rdx	; _1,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:132:     ast_output(0, false, "name\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:133:     output_name(variable->name, outfile, indent + 1, indent_has_next);
	movq	8(%r13), %rdi	; variable_12(D)->name, variable_12(D)->name
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r14, %rdx	; _1,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:134:     if (variable->value != NULL) {
	cmpq	$0, 16(%r13)	;, variable_12(D)->value
	je	.L37	;,
; src/output.c:135:         ast_output(0, true, "value\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:136:         output_expression(variable->value, outfile, indent + 1, indent_has_next);
	movq	16(%r13), %rdi	; variable_12(D)->value, variable_12(D)->value
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r14, %rdx	; _1,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
.L36:
; src/output.c:140: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
.L37:
; src/output.c:138:         ast_output(0, true, "value: \"NULL\"\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:140: }
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
	movq	%rcx, %rbp	; tmp130, indent_has_next
; src/output.c:324:     switch (variable_access->type) {
	movl	16(%rdi), %eax	; variable_access_19(D)->type, _1
; src/output.c:324:     switch (variable_access->type) {
	cmpl	$2, %eax	;, _1
	je	.L41	;,
	ja	.L42	;,
	testl	%eax, %eax	; _1
	je	.L53	;,
; src/output.c:331:             args = list_copy(variable_access->content.args);
	movq	8(%rdi), %rdi	; variable_access_19(D)->content.args, variable_access_19(D)->content.args
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp131, %sfp
; src/output.c:332:             ast_output(0, false, "type: \"function_call\"\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:333:             ast_output(0, false, "function\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:334:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	leaq	1(%r13), %r15	;, _5
	movq	(%r12), %rdi	; variable_access_19(D)->base, variable_access_19(D)->base
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r15, %rdx	; _5,
	movq	%rbx, %rsi	; outfile,
	call	output_variable_access	;
; src/output.c:335:             ast_output(0, true, "arguments\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:337:             index = -1;
	movl	$-1, %r14d	;, index
; src/output.c:338:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	jmp	.L48	;
.L42:
; src/output.c:324:     switch (variable_access->type) {
	cmpl	$3, %eax	;, _1
	jne	.L54	;,
; src/output.c:344:             ast_output(0, false, "type: \"get sequence_element\"\n");
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
; src/output.c:345:             ast_output(0, false, "sequence\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:346:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	leaq	1(%r13), %r14	;, _8
	movq	(%r12), %rdi	; variable_access_19(D)->base, variable_access_19(D)->base
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r14, %rdx	; _8,
	movq	%rbx, %rsi	; outfile,
	call	output_variable_access	;
; src/output.c:347:             ast_output(0, true, "index\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:348:             output_expression(variable_access->content.index, outfile, indent + 1, indent_has_next);
	movq	8(%r12), %rdi	; variable_access_19(D)->content.index, variable_access_19(D)->content.index
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r14, %rdx	; _8,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:349:             break;
	jmp	.L40	;
.L53:
; src/output.c:326:             ast_output(0, false, "type: \"name\"\n");
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
; src/output.c:327:             ast_output(0, true, "name\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:328:             output_name(variable_access->content.name, outfile, indent + 1, indent_has_next);
	leaq	1(%r13), %rdx	;, tmp105
	movq	8(%r12), %rdi	; variable_access_19(D)->content.name, variable_access_19(D)->content.name
	movq	%rbp, %rcx	; indent_has_next,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
.L40:
; src/output.c:362: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L49:
; src/output.c:339:                 ast_output(1, false, "arguments[%d]\n", ++index);
	movq	%rbp, %rcx	; indent_has_next,
	movl	$0, %edx	;,
	movq	%r15, %rsi	; _5,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:339:                 ast_output(1, false, "arguments[%d]\n", ++index);
	addl	$1, %r14d	;, index
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%r14d, %ecx	; index,
	leaq	.LC38(%rip), %rdx	;,
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:340:                 output_expression(arg, outfile, indent + 2, indent_has_next);
	leaq	2(%r13), %rdx	;, tmp113
	movq	%rbp, %rcx	; indent_has_next,
	movq	%rbx, %rsi	; outfile,
	movq	%r12, %rdi	; arg,
	call	output_expression	;
.L48:
; src/output.c:338:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp132, arg
; src/output.c:338:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	; arg
	jne	.L49	;,
	jmp	.L40	;
.L41:
; src/output.c:351:             ast_output(0, false, "type: \"get_attribute\"\n");
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
; src/output.c:352:             ast_output(0, false, "object\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:353:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	leaq	1(%r13), %r14	;, _11
	movq	(%r12), %rdi	; variable_access_19(D)->base, variable_access_19(D)->base
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r14, %rdx	; _11,
	movq	%rbx, %rsi	; outfile,
	call	output_variable_access	;
; src/output.c:354:             ast_output(0, true, "attribute_name\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:355:             output_name(variable_access->content.attr_name, outfile, indent + 1, indent_has_next);
	movq	8(%r12), %rdi	; variable_access_19(D)->content.attr_name, variable_access_19(D)->content.attr_name
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r14, %rdx	; _11,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:356:             break;
	jmp	.L40	;
.L54:
; src/output.c:358:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
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
; src/output.c:362: }
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
	movq	%rcx, %rbp	; tmp198, indent_has_next
; src/output.c:143:     switch (statement->type) {
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
; src/output.c:145:             ast_output(0, false, "if_statement\n");
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
; src/output.c:146:             output_if(statement->stmt.if_stmt, outfile, indent + 1, indent_has_next);
	leaq	1(%r12), %r14	;, _2
	movq	0(%r13), %r15	; statement_19(D)->stmt.if_stmt, _3
; src/output.c:192:     list(Statement*) body = list_copy(if_->body);
	movq	8(%r15), %rdi	; _3->body, _3->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp199, body
; src/output.c:193:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	movq	16(%r15), %rdi	; _3->else_if, _3->else_if
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp200, %sfp
; src/output.c:194:     list(Statement*) else_body = list_copy(if_->else_body);
	movq	24(%r15), %rdi	; _3->else_body, _3->else_body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 16(%rsp)	; tmp201, %sfp
; src/output.c:195:     ast_output(0, false, "condition\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:196:     output_expression(if_->condition, outfile, indent + 1, indent_has_next);
	leaq	2(%r12), %r14	;, _57
	movq	(%r15), %rdi	; _3->condition, _3->condition
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r14, %rdx	; _57,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:197:     ast_output(0, false, "body\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:199:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r13, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp202, statement
; src/output.c:199:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L88	;,
; src/output.c:200:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r14, %rdx	; _57,
	movq	%rbx, %rsi	; outfile,
	call	output_statement	;
	jmp	.L66	;
.L88:
; src/output.c:201:     ast_output(0, false, "else_if\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:214:     output_expression(else_if->condition, outfile, indent + 1, indent_has_next);
	leaq	3(%r12), %r13	;, _64
.L68:
; src/output.c:203:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp205, else_if
; src/output.c:203:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	testq	%rax, %rax	; else_if
	je	.L89	;,
; src/output.c:212:     list(Statement*) body = list_copy(else_if->body);
	movq	8(%r15), %rdi	; else_if_60->body, else_if_60->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp203, body
; src/output.c:213:     ast_output(0, false, "condition\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:214:     output_expression(else_if->condition, outfile, indent + 1, indent_has_next);
	movq	(%r15), %rdi	; else_if_60->condition, else_if_60->condition
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r13, %rdx	; _64,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:215:     ast_output(0, true, "body\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:217:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r12, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
; src/output.c:217:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L68	;,
; src/output.c:218:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r13, %rdx	; _64,
	movq	%rbx, %rsi	; outfile,
	movq	%rax, %rdi	; statement,
	call	output_statement	;
	jmp	.L69	;
.L89:
; src/output.c:205:     ast_output(0, true, "else_body\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:206:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	movq	16(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp206, statement
; src/output.c:206:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L55	;,
; src/output.c:207:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r14, %rdx	; _57,
	movq	%rbx, %rsi	; outfile,
	call	output_statement	;
	jmp	.L72	;
.L61:
; src/output.c:149:             ast_output(0, false, "for_statement\n");
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
; src/output.c:150:             output_for(statement->stmt.for_stmt, outfile, indent + 1, indent_has_next);
	leaq	1(%r12), %r14	;, _4
	movq	0(%r13), %r15	; statement_19(D)->stmt.for_stmt, _5
; src/output.c:223:     list(Statement*) body = list_copy(for_->body);
	movq	24(%r15), %rdi	; _5->body, _5->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp207, body
; src/output.c:224:     if (for_->initializer != NULL) {
	cmpq	$0, (%r15)	;, _5->initializer
	je	.L75	;,
; src/output.c:225:         ast_output(0, false, "initializer\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:226:         output_variable(for_->initializer, outfile, indent + 1, indent_has_next);
	leaq	2(%r12), %rdx	;, tmp158
	movq	(%r15), %rdi	; _5->initializer, _5->initializer
	movq	%rbp, %rcx	; indent_has_next,
	movq	%rbx, %rsi	; outfile,
	call	output_variable	;
.L76:
; src/output.c:229:     if (for_->condition != NULL) {
	cmpq	$0, 8(%r15)	;, _5->condition
	je	.L77	;,
; src/output.c:230:         ast_output(0, false, "condition\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:231:         output_expression(for_->condition, outfile, indent + 1, indent_has_next);
	leaq	2(%r12), %rdx	;, tmp162
	movq	8(%r15), %rdi	; _5->condition, _5->condition
	movq	%rbp, %rcx	; indent_has_next,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
.L78:
; src/output.c:234:     if (for_->increment != NULL) {
	cmpq	$0, 16(%r15)	;, _5->increment
	je	.L79	;,
; src/output.c:235:         ast_output(0, false, "increment\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:236:         output_expression(for_->increment, outfile, indent + 1, indent_has_next);
	leaq	2(%r12), %rdx	;, tmp166
	movq	16(%r15), %rdi	; _5->increment, _5->increment
	movq	%rbp, %rcx	; indent_has_next,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
.L80:
; src/output.c:239:     ast_output(0, true, "body\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:242:         output_statement(statement, outfile, indent + 1, indent_has_next);
	addq	$2, %r12	;, tmp194
.L81:
; src/output.c:241:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r13, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp208, statement
; src/output.c:241:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L55	;,
; src/output.c:242:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r12, %rdx	; tmp194,
	movq	%rbx, %rsi	; outfile,
	call	output_statement	;
	jmp	.L81	;
.L75:
; src/output.c:228:         ast_output(0, false, "initializer: \"NULL\"\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:233:         ast_output(0, false, "condition: \"NULL\"\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:238:         ast_output(0, false, "increment: \"NULL\"\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:153:             ast_output(0, false, "while_statement\n");
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
; src/output.c:154:             output_while(statement->stmt.while_stmt, outfile, indent + 1, indent_has_next);
	leaq	1(%r12), %r14	;, _6
	movq	0(%r13), %r15	; statement_19(D)->stmt.while_stmt, _7
; src/output.c:247:     list(Statement*) body = list_copy(while_->body);
	movq	8(%r15), %rdi	; _7->body, _7->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp209, body
; src/output.c:248:     ast_output(0, false, "condition\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:249:     output_expression(while_->condition, outfile, indent + 1, indent_has_next);
	addq	$2, %r12	;, _82
	movq	(%r15), %rdi	; _7->condition, _7->condition
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r12, %rdx	; _82,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:250:     ast_output(0, true, "body\n");
	movq	%rbp, %rcx	; indent_has_next,
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
; src/output.c:252:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r13, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp210, statement
; src/output.c:252:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L55	;,
; src/output.c:253:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rbp, %rcx	; indent_has_next,
	movq	%r12, %rdx	; _82,
	movq	%rbx, %rsi	; outfile,
	call	output_statement	;
	jmp	.L83	;
.L64:
; src/output.c:157:             ast_output(0, false, "variable_declaration_statement\n");
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
; src/output.c:158:             output_variable(statement->stmt.var, outfile, indent + 1, indent_has_next);
	leaq	1(%r12), %rdx	;, tmp177
	movq	0(%r13), %rdi	; statement_19(D)->stmt.var, statement_19(D)->stmt.var
	movq	%rbp, %rcx	; indent_has_next,
	movq	%rbx, %rsi	; outfile,
	call	output_variable	;
.L55:
; src/output.c:189: }
	addq	$40, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L60:
; src/output.c:161:             if (statement->stmt.expr == NULL) {
	cmpq	$0, (%rdi)	;, statement_19(D)->stmt.expr
	je	.L90	;,
; src/output.c:166:             ast_output(0, false, "return_statement\n");
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
; src/output.c:167:             output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
	leaq	1(%r12), %rdx	;, tmp181
	movq	0(%r13), %rdi	; statement_19(D)->stmt.expr, statement_19(D)->stmt.expr
	movq	%rbp, %rcx	; indent_has_next,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:168:             break;
	jmp	.L55	;
.L90:
; src/output.c:162:                 ast_output(0, false, "return_statement: \"NULL\"\n");
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
; src/output.c:164:                 return;
	jmp	.L55	;
.L59:
; src/output.c:170:             ast_output(0, false, "break_statement: \"NULL\"\n");
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
; src/output.c:173:             ast_output(0, false, "continue_statement: \"NULL\"\n");
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
; src/output.c:176:             if (statement->stmt.expr == NULL) {
	cmpq	$0, (%rdi)	;, statement_19(D)->stmt.expr
	je	.L91	;,
; src/output.c:181:             ast_output(0, false, "expression_statement\n");
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
; src/output.c:182:             output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
	leaq	1(%r12), %rdx	;, tmp187
	movq	0(%r13), %rdi	; statement_19(D)->stmt.expr, statement_19(D)->stmt.expr
	movq	%rbp, %rcx	; indent_has_next,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:183:             break;
	jmp	.L55	;
.L91:
; src/output.c:177:                 ast_output(0, false, "expression_statement: \"NULL\"\n");
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
; src/output.c:179:                 return;
	jmp	.L55	;
.L56:
; src/output.c:185:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
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
	.string	"Var: \"NULL\"\n"
.LC67:
	.string	"NULL\t%s\n"
.LC68:
	.string	"%s\t%s(%s)\n"
.LC69:
	.string	"%s\t%s\n"
	.text
	.type	output_var, @function
output_var:
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rsi, %rbp	; tmp110, outfile
	movq	%rdx, %rsi	; tmp111, indent
; src/output.c:509:     if (var == NULL) {
	testq	%rdi, %rdi	; var
	je	.L98	;,
	movq	%rdi, %rbx	; tmp109, var
; src/output.c:514:     if (var->type == NULL)
	cmpq	$0, 16(%rdi)	;, var_13(D)->type
	je	.L99	;,
; src/output.c:516:     else if (var->original_name)
	cmpq	$0, (%rdi)	;, var_13(D)->original_name
	je	.L96	;,
; src/output.c:517:         tac_output(indent, "%s\t%s(%s)\n", var->type->name, var->name, var->original_name->name);
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:517:         tac_output(indent, "%s\t%s(%s)\n", var->type->name, var->name, var->original_name->name);
	movq	(%rbx), %rax	; var_13(D)->original_name, var_13(D)->original_name
	movq	16(%rbx), %rdx	; var_13(D)->type, var_13(D)->type
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rdx), %rcx	; _7->name, _7->name
	movq	8(%rax), %r9	; _4->name,
	movq	8(%rbx), %r8	; var_13(D)->name,
	leaq	.LC68(%rip), %rdx	;, tmp104
	movl	$2, %esi	;,
	movq	%rbp, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L92:
; src/output.c:521: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
.L98:
; src/output.c:510:         tac_output(indent, "Var: \"NULL\"\n");
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rcx	; outfile,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC66(%rip), %rdi	;, tmp96
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:512:         return;
	jmp	.L92	;
.L99:
; src/output.c:515:         tac_output(indent, "NULL\t%s\n", var->name);
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rbx), %rcx	; var_13(D)->name, var_13(D)->name
	leaq	.LC67(%rip), %rdx	;, tmp98
	movl	$2, %esi	;,
	movq	%rbp, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L92	;
.L96:
; src/output.c:519:         tac_output(indent, "%s\t%s\n", var->type->name, var->name);
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:519:         tac_output(indent, "%s\t%s\n", var->type->name, var->name);
	movq	16(%rbx), %rax	; var_13(D)->type, var_13(D)->type
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _10->name, _10->name
	movq	8(%rbx), %r8	; var_13(D)->name,
	leaq	.LC69(%rip), %rdx	;, tmp108
	movl	$2, %esi	;,
	movq	%rbp, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L92	;
	.size	output_var, .-output_var
	.section	.rodata.str1.1
.LC70:
	.string	"true"
.LC71:
	.string	"false"
.LC72:
	.string	"\"NULL\""
.LC73:
	.string	"%s(%s)"
.LC74:
	.string	"%lld"
.LC75:
	.string	"%f"
.LC76:
	.string	"\"%s\""
.LC77:
	.string	"void"
.LC78:
	.string	"NONE"
.LC79:
	.string	"unknown_ArgType: %u"
	.text
	.type	output_arg, @function
output_arg:
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rsi, %rbp	; tmp149, outfile
; src/output.c:546:     if (arg == NULL) {
	testq	%rdi, %rdi	; arg
	je	.L119	;,
	movq	%rdi, %rbx	; tmp148, arg
; src/output.c:551:     switch (arg->kind) {
	cmpl	$9, 16(%rdi)	;, arg_27(D)->kind
	ja	.L103	;,
	movl	16(%rdi), %eax	; arg_27(D)->kind, arg_27(D)->kind
	leaq	.L105(%rip), %rdx	;, tmp111
	movslq	(%rdx,%rax,4), %rax	;, tmp113
	addq	%rdx, %rax	; tmp111, tmp114
	jmp	*%rax	; tmp114
	.section	.rodata
	.align 4
	.align 4
.L105:
	.long	.L113-.L105
	.long	.L112-.L105
	.long	.L111-.L105
	.long	.L110-.L105
	.long	.L109-.L105
	.long	.L108-.L105
	.long	.L107-.L105
	.long	.L106-.L105
	.long	.L106-.L105
	.long	.L104-.L105
	.text
.L119:
; src/output.c:547:         tac_output(0, "\"NULL\"");
	movl	$0, %esi	;,
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC72(%rip), %rdi	;, tmp109
	call	*fwrite@GOTPCREL(%rip)	;
.L100:
; src/output.c:575: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
.L113:
; src/output.c:553:             if (arg->value.variable->original_name)
	movq	(%rdi), %rax	; arg_27(D)->value.variable, arg_27(D)->value.variable
; src/output.c:553:             if (arg->value.variable->original_name)
	cmpq	$0, (%rax)	;, _2->original_name
	je	.L114	;,
; src/output.c:554:                 tac_output(0, "%s(%s)", arg->value.variable->name, arg->value.variable->original_name->name);
	movl	$0, %esi	;,
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:554:                 tac_output(0, "%s(%s)", arg->value.variable->name, arg->value.variable->original_name->name);
	movq	(%rbx), %rax	; arg_27(D)->value.variable, _4
	movq	(%rax), %rdx	; _4->original_name, _4->original_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _4->name, _4->name
	movq	8(%rdx), %r8	; _5->name,
	leaq	.LC73(%rip), %rdx	;, tmp120
	movl	$2, %esi	;,
	movq	%rbp, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L100	;
.L114:
; src/output.c:556:                 tac_output(0, "%s", arg->value.variable->name);
	movl	$0, %esi	;,
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:556:                 tac_output(0, "%s", arg->value.variable->name);
	movq	(%rbx), %rax	; arg_27(D)->value.variable, arg_27(D)->value.variable
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rdi	; _8->name, _8->name
	movq	%rbp, %rsi	; outfile,
	call	*fputs@GOTPCREL(%rip)	;
	jmp	.L100	;
.L112:
; src/output.c:558:         case ARG_INT: tac_output(0, "%lld", arg->value.int_value); break;
	movl	$0, %esi	;,
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rbx), %rcx	; arg_27(D)->value.int_value, arg_27(D)->value.int_value
	leaq	.LC74(%rip), %rdx	;, tmp124
	movl	$2, %esi	;,
	movq	%rbp, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L100	;
.L111:
; src/output.c:559:         case ARG_FLOAT: tac_output(0, "%f", arg->value.float_value); break;
	movl	$0, %esi	;,
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movsd	(%rbx), %xmm0	; arg_27(D)->value.float_value, arg_27(D)->value.float_value
	leaq	.LC75(%rip), %rdx	;, tmp126
	movl	$2, %esi	;,
	movq	%rbp, %rdi	; outfile,
	movl	$1, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L100	;
.L110:
; src/output.c:560:         case ARG_STRING: tac_output(0, "\"%s\"", arg->value.string_value); break;
	movl	$0, %esi	;,
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rbx), %rcx	; arg_27(D)->value.string_value, arg_27(D)->value.string_value
	leaq	.LC76(%rip), %rdx	;, tmp128
	movl	$2, %esi	;,
	movq	%rbp, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L100	;
.L109:
; src/output.c:561:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	movl	$0, %esi	;,
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:561:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	cmpb	$0, (%rbx)	;, arg_27(D)->value.bool_value
	leaq	.LC71(%rip), %rdi	;, tmp146
	leaq	.LC70(%rip), %rax	;, tmp147
	cmovne	%rax, %rdi	; tmp146,, tmp147, iftmp.2_25
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rsi	; outfile,
	call	*fputs@GOTPCREL(%rip)	;
	jmp	.L100	;
.L108:
; src/output.c:562:         case ARG_VOID: tac_output(0, "void"); break;
	movl	$0, %esi	;,
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC77(%rip), %rdi	;, tmp129
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L100	;
.L107:
; src/output.c:563:         case ARG_LABEL: tac_output(0, "%s", arg->value.label->name); break;
	movl	$0, %esi	;,
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:563:         case ARG_LABEL: tac_output(0, "%s", arg->value.label->name); break;
	movq	(%rbx), %rax	; arg_27(D)->value.label, arg_27(D)->value.label
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rdi	; _14->name, _14->name
	movq	%rbp, %rsi	; outfile,
	call	*fputs@GOTPCREL(%rip)	;
	jmp	.L100	;
.L106:
; src/output.c:566:             if (arg->value.subroutine->original_name)
	movq	(%rdi), %rax	; arg_27(D)->value.subroutine, arg_27(D)->value.subroutine
; src/output.c:566:             if (arg->value.subroutine->original_name)
	cmpq	$0, (%rax)	;, _16->original_name
	je	.L116	;,
; src/output.c:567:                 tac_output(0, "%s(%s)", arg->value.subroutine->name, arg->value.subroutine->original_name->name);
	movl	$0, %esi	;,
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:567:                 tac_output(0, "%s(%s)", arg->value.subroutine->name, arg->value.subroutine->original_name->name);
	movq	(%rbx), %rax	; arg_27(D)->value.subroutine, _18
	movq	(%rax), %rdx	; _18->original_name, _18->original_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _18->name, _18->name
	movq	8(%rdx), %r8	; _19->name,
	leaq	.LC73(%rip), %rdx	;, tmp136
	movl	$2, %esi	;,
	movq	%rbp, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L100	;
.L116:
; src/output.c:569:                 tac_output(0, "%s", arg->value.subroutine->name);
	movl	$0, %esi	;,
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:569:                 tac_output(0, "%s", arg->value.subroutine->name);
	movq	(%rbx), %rax	; arg_27(D)->value.subroutine, arg_27(D)->value.subroutine
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rdi	; _22->name, _22->name
	movq	%rbp, %rsi	; outfile,
	call	*fputs@GOTPCREL(%rip)	;
	jmp	.L100	;
.L104:
; src/output.c:571:         case ARG_NONE: tac_output(0, "NONE"); break;
	movl	$0, %esi	;,
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC78(%rip), %rdi	;, tmp139
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L100	;
.L103:
; src/output.c:572:         default: tac_output(0, "unknown_ArgType: %u", arg->kind); break;
	movl	$0, %esi	;,
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	16(%rbx), %ecx	; arg_27(D)->kind, arg_27(D)->kind
	leaq	.LC79(%rip), %rdx	;, tmp141
	movl	$2, %esi	;,
	movq	%rbp, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L100	;
	.size	output_arg, .-output_arg
	.section	.rodata.str1.1
.LC80:
	.string	"NULL"
.LC81:
	.string	"import\n"
.LC82:
	.string	"source: \"%s\"\n"
.LC83:
	.string	"parameters\n"
.LC84:
	.string	"parameters[%d]\n"
.LC85:
	.string	"class\n"
.LC86:
	.string	"members\n"
.LC87:
	.string	"method\n"
.LC88:
	.string	"variable\n"
.LC89:
	.string	"unknown_ClassMemberType: %u\n"
.LC90:
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
	movq	%rcx, %r15	; tmp188, indent_has_next
; src/output.c:45:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rdi), %rdi	; code_5(D)->members, code_5(D)->members
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 40(%rsp)	; tmp189, %sfp
	movq	%r15, %rax	; indent_has_next, indent_has_next
	movq	%r14, %r15	; outfile, outfile
	movq	%rax, %r14	; indent_has_next, indent_has_next
; src/output.c:47:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	jmp	.L121	;
.L122:
; src/output.c:30:             ast_output(0, false, "function\n");
	movq	%r14, %rcx	; indent_has_next,
	movl	$0, %edx	;,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC36(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:31:             output_function(code_member->content.function, outfile, indent + 1, indent_has_next);
	leaq	2(%r13), %rbp	;, _17
	movq	%rbp, 8(%rsp)	; _17, %sfp
	movq	(%rbx), %rbx	; member_9->content.function, _18
; src/output.c:60:     ast_output(0, false, "name\n");
	movq	%r14, %rcx	; indent_has_next,
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
; src/output.c:61:     output_name(function->name, outfile, indent + 1, indent_has_next);
	leaq	3(%r13), %r12	;, _26
	movq	(%rbx), %rdi	; _18->name, _18->name
	movq	%r14, %rcx	; indent_has_next,
	movq	%r12, %rdx	; _26,
	movq	%r15, %rsi	; outfile,
	call	output_name	;
; src/output.c:62:     ast_output(0, false, "return_type\n");
	movq	%r14, %rcx	; indent_has_next,
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
; src/output.c:63:     output_name(function->return_type, outfile, indent + 1, indent_has_next);
	movq	8(%rbx), %rdi	; _18->return_type, _18->return_type
	movq	%r14, %rcx	; indent_has_next,
	movq	%r12, %rdx	; _26,
	movq	%r15, %rsi	; outfile,
	call	output_name	;
; src/output.c:64:     ast_output(0, false, "parameters\n");
	movq	%r14, %rcx	; indent_has_next,
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; _17,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$11, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC83(%rip), %rdi	;, tmp145
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:65:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%rbx), %rdi	; _18->parameters, _18->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, (%rsp)	; tmp190, %sfp
; src/output.c:66:     list(Statement*) body = list_copy(function->body);
	movq	24(%rbx), %rdi	; _18->body, _18->body
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:68:     int index = -1;
	movl	$-1, %ebp	;, index
	movq	%rax, 16(%rsp)	; body, %sfp
.L127:
; src/output.c:69:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp192, parameter
; src/output.c:69:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	; parameter
	je	.L144	;,
; src/output.c:70:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	%r14, %rcx	; indent_has_next,
	movl	$0, %edx	;,
	movq	%r12, %rsi	; _26,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:70:         ast_output(1, false, "parameters[%d]\n", ++index);
	addl	$1, %ebp	;, index
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebp, %ecx	; index,
	leaq	.LC84(%rip), %rdx	;,
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:71:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	leaq	4(%r13), %rdx	;, tmp149
	movq	%r14, %rcx	; indent_has_next,
	movq	%r15, %rsi	; outfile,
	movq	%rbx, %rdi	; parameter,
	call	output_variable	;
	jmp	.L127	;
.L144:
; src/output.c:73:     ast_output(0, true, "body\n");
	movq	16(%rsp), %rbx	; %sfp, body
	movq	%r14, %rcx	; indent_has_next,
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
.L129:
; src/output.c:75:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbx, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp193, statement
; src/output.c:75:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L121	;,
; src/output.c:76:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%r14, %rcx	; indent_has_next,
	movq	%r12, %rdx	; _26,
	movq	%r15, %rsi	; outfile,
	call	output_statement	;
	jmp	.L129	;
.L123:
; src/output.c:34:             ast_output(0, false, "class\n");
	movq	%r14, %rcx	; indent_has_next,
	movl	$0, %edx	;,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC85(%rip), %rdi	;, tmp151
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:35:             output_class(code_member->content.class, outfile, indent + 1, indent_has_next);
	leaq	2(%r13), %rbp	;, _19
	movq	(%rbx), %rbx	; member_9->content.class, _20
; src/output.c:119:     ast_output(0, false, "name\n");
	movq	%r14, %rcx	; indent_has_next,
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
; src/output.c:120:     output_name(class->name, outfile, indent + 1, indent_has_next);
	leaq	3(%r13), %rax	;, _38
	movq	%rax, 16(%rsp)	; _38, %sfp
	movq	(%rbx), %rdi	; _20->name, _20->name
	movq	%r14, %rcx	; indent_has_next,
	movq	%rax, %rdx	; _38,
	movq	%r15, %rsi	; outfile,
	call	output_name	;
; src/output.c:121:     ast_output(0, true, "members\n");
	movq	%r14, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; _19,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$8, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC86(%rip), %rdi	;, tmp154
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:122:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rbx), %rdi	; _20->members, _20->members
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp194, %sfp
; src/output.c:124:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	jmp	.L131	;
.L132:
; src/output.c:104:             ast_output(0, false, "method\n");
	movq	%r14, %rcx	; indent_has_next,
	movl	$0, %edx	;,
	movq	16(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC87(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:105:             output_method(class_member->content.method, outfile, indent + 1, indent_has_next);
	leaq	4(%r13), %rbp	;, _44
	movq	%rbp, 24(%rsp)	; _44, %sfp
	movq	(%rbx), %rbx	; member_42->content.method, _45
; src/output.c:81:     ast_output(0, false, "name\n");
	movq	%r14, %rcx	; indent_has_next,
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
; src/output.c:82:     output_name(method->name, outfile, indent + 1, indent_has_next);
	leaq	5(%r13), %r12	;, _49
	movq	(%rbx), %rdi	; _45->name, _45->name
	movq	%r14, %rcx	; indent_has_next,
	movq	%r12, %rdx	; _49,
	movq	%r15, %rsi	; outfile,
	call	output_name	;
; src/output.c:83:     ast_output(0, false, "return_type\n");
	movq	%r14, %rcx	; indent_has_next,
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
; src/output.c:84:     output_name(method->return_type, outfile, indent + 1, indent_has_next);
	movq	8(%rbx), %rdi	; _45->return_type, _45->return_type
	movq	%r14, %rcx	; indent_has_next,
	movq	%r12, %rdx	; _49,
	movq	%r15, %rsi	; outfile,
	call	output_name	;
; src/output.c:85:     ast_output(0, false, "parameters\n");
	movq	%r14, %rcx	; indent_has_next,
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; _44,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$11, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC83(%rip), %rdi	;, tmp161
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:86:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%rbx), %rdi	; _45->parameters, _45->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, (%rsp)	; tmp195, %sfp
; src/output.c:87:     list(Statement*) body = list_copy(method->body);
	movq	24(%rbx), %rdi	; _45->body, _45->body
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:89:     int index = -1;
	movl	$-1, %ebp	;, index
	movq	%rax, 32(%rsp)	; body, %sfp
; src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	jmp	.L135	;
.L136:
; src/output.c:91:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	%r14, %rcx	; indent_has_next,
	movl	$0, %edx	;,
	movq	%r12, %rsi	; _49,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:91:         ast_output(1, false, "parameters[%d]\n", ++index);
	addl	$1, %ebp	;, index
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebp, %ecx	; index,
	leaq	.LC84(%rip), %rdx	;,
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:92:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	leaq	6(%r13), %rdx	;, tmp165
	movq	%r14, %rcx	; indent_has_next,
	movq	%r15, %rsi	; outfile,
	movq	%rbx, %rdi	; parameter,
	call	output_variable	;
.L135:
; src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp197, parameter
; src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	; parameter
	jne	.L136	;,
; src/output.c:94:     ast_output(0, true, "body\n");
	movq	32(%rsp), %rbx	; %sfp, body
	movq	%r14, %rcx	; indent_has_next,
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
	jmp	.L137	;
.L138:
; src/output.c:97:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%r14, %rcx	; indent_has_next,
	movq	%r12, %rdx	; _49,
	movq	%r15, %rsi	; outfile,
	call	output_statement	;
.L137:
; src/output.c:96:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbx, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp198, statement
; src/output.c:96:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L138	;,
.L131:
; src/output.c:124:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp199, member
; src/output.c:124:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	; member
	je	.L121	;,
; src/output.c:102:     switch (class_member->type) {
	movl	8(%rbx), %eax	; member_42->type, _43
; src/output.c:102:     switch (class_member->type) {
	testl	%eax, %eax	; _43
	je	.L132	;,
	cmpl	$1, %eax	;, _43
	je	.L133	;,
; src/output.c:112:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movq	%r14, %rcx	; indent_has_next,
	movl	$0, %edx	;,
	movq	16(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%rbx), %ecx	; member_42->type, member_42->type
	leaq	.LC89(%rip), %rdx	;, tmp171
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L131	;
.L133:
; src/output.c:108:             ast_output(0, false, "variable\n");
	movq	%r14, %rcx	; indent_has_next,
	movl	$0, %edx	;,
	movq	16(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC88(%rip), %rdi	;, tmp167
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:109:             output_variable(class_member->content.variable, outfile, indent + 1, indent_has_next);
	leaq	4(%r13), %rdx	;, tmp168
	movq	(%rbx), %rdi	; member_42->content.variable, member_42->content.variable
	movq	%r14, %rcx	; indent_has_next,
	movq	%r15, %rsi	; outfile,
	call	output_variable	;
; src/output.c:110:             break;
	jmp	.L131	;
.L124:
; src/output.c:38:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movq	%r14, %rcx	; indent_has_next,
	movl	$0, %edx	;,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%rbx), %ecx	; member_9->type, member_9->type
	leaq	.LC90(%rip), %rdx	;, tmp173
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L121:
; src/output.c:47:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	movq	40(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp200, member
; src/output.c:47:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	; member
	je	.L145	;,
; src/output.c:48:         output_code_member(member, outfile, indent + 1, indent_has_next);
	leaq	1(%r13), %rsi	;, _2
; src/output.c:24:     switch (code_member->type) {
	movl	8(%rbx), %eax	; member_9->type, _14
; src/output.c:24:     switch (code_member->type) {
	cmpl	$1, %eax	;, _14
	je	.L122	;,
	cmpl	$2, %eax	;, _14
	je	.L123	;,
	testl	%eax, %eax	; _14
	jne	.L124	;,
; src/output.c:26:             ast_output(0, false, "import\n");
	movq	%r14, %rcx	; indent_has_next,
	movl	$0, %edx	;,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC81(%rip), %rdi	;, tmp135
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:27:             output_import(code_member->content.import, outfile, indent + 1, indent_has_next);
	leaq	2(%r13), %rbp	;, _15
	movq	(%rbx), %rbx	; member_9->content.import, _16
; src/output.c:53:     ast_output(0, false, "name\n");
	movq	%r14, %rcx	; indent_has_next,
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
; src/output.c:54:     output_name(import->name, outfile, indent + 1, indent_has_next);
	leaq	3(%r13), %rdx	;, tmp137
	movq	(%rbx), %rdi	; _16->name, _16->name
	movq	%r14, %rcx	; indent_has_next,
	movq	%r15, %rsi	; outfile,
	call	output_name	;
; src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	%r14, %rcx	; indent_has_next,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; _15,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	8(%rbx), %rcx	; _16->source, _24
; src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	testq	%rcx, %rcx	; _24
	leaq	.LC80(%rip), %rax	;, tmp174
	cmove	%rax, %rcx	; _24,, tmp174, _24
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC82(%rip), %rdx	;, tmp139
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:57: }
	jmp	.L121	;
.L145:
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
.LC91:
	.string	"TAC: \"NULL\"\n"
.LC92:
	.string	"TAC {\n"
.LC93:
	.string	"designs: []\n"
.LC94:
	.string	"designs: [\n"
.LC95:
	.string	"NULL "
.LC96:
	.string	"%s "
.LC97:
	.string	"%zu "
.LC98:
	.string	"{}\n"
.LC99:
	.string	"{\n"
.LC100:
	.string	"NULL\t"
.LC101:
	.string	"%s\t"
.LC102:
	.string	"%s(%s) "
.LC103:
	.string	"%zu\n"
.LC104:
	.string	"}\n"
.LC105:
	.string	"]\n"
.LC106:
	.string	"entry_point: \"NULL\"\n"
.LC107:
	.string	"entry_point: %s\n"
.LC108:
	.string	"global: []\n"
.LC109:
	.string	"global: [\n"
.LC110:
	.string	"subroutines: []\n"
.LC111:
	.string	"subroutines: [\n"
.LC112:
	.string	"NULL {\n"
.LC113:
	.string	"%s {\n"
.LC114:
	.string	"return_type: \"NULL\"\n"
.LC115:
	.string	"return_type: %s\n"
.LC116:
	.string	"parameters: []\n"
.LC117:
	.string	"parameters: [\n"
.LC118:
	.string	"local: []\n"
.LC119:
	.string	"local: [\n"
.LC120:
	.string	"instructions: []\n"
.LC121:
	.string	"instructions: [\n"
.LC122:
	.string	"add\t"
.LC123:
	.string	"sub\t"
.LC124:
	.string	"mul\t"
.LC125:
	.string	"div\t"
.LC126:
	.string	"mod\t"
.LC127:
	.string	"eq \t"
.LC128:
	.string	"ne \t"
.LC129:
	.string	"lt \t"
.LC130:
	.string	"gt \t"
.LC131:
	.string	"le \t"
.LC132:
	.string	"ge \t"
.LC133:
	.string	"and\t"
.LC134:
	.string	"or \t"
.LC135:
	.string	"not\t"
.LC136:
	.string	"assign\t"
.LC137:
	.string	"get_attr\t"
.LC138:
	.string	"get_elem\t"
.LC139:
	.string	"param\t"
.LC140:
	.string	"alloc\t"
.LC141:
	.string	"jmp_c\t"
.LC142:
	.string	"jmp\t"
.LC143:
	.string	"ret\t"
.LC144:
	.string	"call\t"
.LC145:
	.string	"load\t"
.LC146:
	.string	"store\t"
.LC147:
	.string	"INST_NONE\n"
.LC148:
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
	subq	$56, %rsp	;,
	movq	%rdi, 16(%rsp)	; tac, %sfp
	movq	%rsi, %r15	; tmp336, outfile
	movq	%rdx, %r14	; tmp337, indent
; src/output.c:422:     if (tac == NULL) {
	testq	%rdi, %rdi	; tac
	je	.L230	;,
; src/output.c:427:     tac_output(indent, "TAC {\n");
	movq	%rdx, %rsi	; indent,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC92(%rip), %rdi	;, tmp181
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:428:     if (list_is_empty(tac->attribute_tables))
	movq	16(%rsp), %rax	; %sfp, tac
	movq	(%rax), %rdi	; tac_32(D)->attribute_tables, tac_32(D)->attribute_tables
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:428:     if (list_is_empty(tac->attribute_tables))
	testb	%al, %al	; tmp338
	je	.L149	;,
; src/output.c:429:         tac_output(indent + 1, "designs: []\n");
	leaq	1(%r14), %rsi	;, tmp183
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC93(%rip), %rdi	;, tmp184
	call	*fwrite@GOTPCREL(%rip)	;
.L150:
; src/output.c:437:     if (tac->entry_point == NULL)
	movq	16(%rsp), %rax	; %sfp, tac
	cmpq	$0, 8(%rax)	;, tac_32(D)->entry_point
	je	.L231	;,
; src/output.c:440:         tac_output(indent + 1, "entry_point: %s\n", tac->entry_point->name);
	leaq	1(%r14), %rsi	;, tmp215
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:440:         tac_output(indent + 1, "entry_point: %s\n", tac->entry_point->name);
	movq	16(%rsp), %rax	; %sfp, tac
	movq	8(%rax), %rax	; tac_32(D)->entry_point, tac_32(D)->entry_point
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _10->name, _10->name
	leaq	.LC107(%rip), %rdx	;, tmp218
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L165:
; src/output.c:441:     if (list_is_empty(tac->global_vars))
	movq	16(%rsp), %rax	; %sfp, tac
	movq	16(%rax), %rdi	; tac_32(D)->global_vars, tac_32(D)->global_vars
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:441:     if (list_is_empty(tac->global_vars))
	testb	%al, %al	; tmp342
	je	.L166	;,
; src/output.c:442:         tac_output(indent + 1, "global: []\n");
	leaq	1(%r14), %rsi	;, tmp220
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$11, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC108(%rip), %rdi	;, tmp221
	call	*fwrite@GOTPCREL(%rip)	;
.L167:
; src/output.c:450:     if (list_is_empty(tac->subroutines))
	movq	16(%rsp), %rax	; %sfp, tac
	movq	24(%rax), %rdi	; tac_32(D)->subroutines, tac_32(D)->subroutines
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:450:     if (list_is_empty(tac->subroutines))
	testb	%al, %al	; tmp344
	je	.L170	;,
; src/output.c:451:         tac_output(indent + 1, "subroutines: []\n");
	leaq	1(%r14), %rsi	;, tmp227
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC110(%rip), %rdi	;, tmp228
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L171	;
.L230:
; src/output.c:423:         tac_output(indent, "TAC: \"NULL\"\n");
	movq	%rdx, %rsi	; indent,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC91(%rip), %rdi	;, tmp180
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:425:         return;
	jmp	.L146	;
.L149:
; src/output.c:431:         tac_output(indent + 1, "designs: [\n");
	leaq	1(%r14), %r12	;, _4
	movq	%r12, %rsi	; _4,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$11, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC94(%rip), %rdi	;, tmp185
	call	*fwrite@GOTPCREL(%rip)	;
	movq	16(%rsp), %rbx	; %sfp, tac
	jmp	.L151	;
.L237:
; src/output.c:667:         tac_output(indent, "NULL ");
	movq	%rax, %rsi	; _5,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC95(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L153	;
.L154:
; src/output.c:674:         tac_output(0, "{\n");
	movl	$0, %esi	;,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC99(%rip), %rdi	;, tmp194
	call	*fwrite@GOTPCREL(%rip)	;
	leaq	.LC101(%rip), %r13	;, tmp327
	movq	%r12, 24(%rsp)	; _4, %sfp
	jmp	.L156	;
.L233:
; src/output.c:690:         tac_output(indent, "NULL\t");
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC100(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L158	;
.L234:
; src/output.c:694:         tac_output(0, "NULL ");
	movl	$0, %esi	;,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC95(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L160	;
.L235:
; src/output.c:696:         tac_output(0, "%s(%s) ", attribute->var->name, attribute->var->original_name->name);
	movl	$0, %esi	;,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:696:         tac_output(0, "%s(%s) ", attribute->var->name, attribute->var->original_name->name);
	movq	(%r12), %rax	; attribute_83->var, _90
	movq	(%rax), %rdx	; _90->original_name, _90->original_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _90->name, _90->name
	movq	8(%rdx), %r8	; _91->name,
	leaq	.LC102(%rip), %rdx	;,
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L160:
; src/output.c:699:     tac_output(0, "%zu\n", attribute->offset);
	movl	$0, %esi	;,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	16(%r12), %rcx	; attribute_83->offset, attribute_83->offset
	leaq	.LC103(%rip), %rdx	;, tmp208
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L156:
; src/output.c:676:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	movq	0(%rbp), %rdi	; attribute_table_40->attributes, attribute_table_40->attributes
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp340, attribute
; src/output.c:676:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	testq	%rax, %rax	; attribute
	je	.L232	;,
; src/output.c:677:             output_attribute(attribute, outfile, indent + 1);
	leaq	3(%r14), %rsi	;, _82
; src/output.c:689:     if (attribute->type == NULL)
	cmpq	$0, 8(%r12)	;, attribute_83->type
	je	.L233	;,
; src/output.c:692:         tac_output(indent, "%s\t", attribute->type->name);
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:692:         tac_output(indent, "%s\t", attribute->type->name);
	movq	8(%r12), %rax	; attribute_83->type, attribute_83->type
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _86->name, _86->name
	movq	%r13, %rdx	; tmp327,
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L158:
; src/output.c:693:     if (attribute->var == NULL)
	movq	(%r12), %rax	; attribute_83->var, _88
; src/output.c:693:     if (attribute->var == NULL)
	testq	%rax, %rax	; _88
	je	.L234	;,
; src/output.c:695:     else if (attribute->var->original_name)
	cmpq	$0, (%rax)	;, _88->original_name
	jne	.L235	;,
; src/output.c:698:         tac_output(0, "%s ", attribute->var->name);
	movl	$0, %esi	;,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:698:         tac_output(0, "%s ", attribute->var->name);
	movq	(%r12), %rax	; attribute_83->var, attribute_83->var
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _94->name, _94->name
	leaq	.LC96(%rip), %rdx	;,
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L160	;
.L232:
; src/output.c:678:         tac_output(indent, "}\n");
	movq	24(%rsp), %r12	; %sfp, _4
	movq	8(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC104(%rip), %rdi	;, tmp210
	call	*fwrite@GOTPCREL(%rip)	;
.L151:
; src/output.c:433:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	movq	(%rbx), %rdi	; tac_32(D)->attribute_tables, tac_32(D)->attribute_tables
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp341, attribute_table
; src/output.c:433:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	testq	%rax, %rax	; attribute_table
	je	.L236	;,
; src/output.c:434:             output_attribute_table(attribute_table, outfile, indent + 2);
	leaq	2(%r14), %rax	;, _5
	movq	%rax, 8(%rsp)	; _5, %sfp
; src/output.c:666:     if (attribute_table->name == NULL)
	cmpq	$0, 8(%rbp)	;, attribute_table_40->name
	je	.L237	;,
; src/output.c:669:         tac_output(indent, "%s ", attribute_table->name->name);
	movq	8(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:669:         tac_output(indent, "%s ", attribute_table->name->name);
	movq	8(%rbp), %rax	; attribute_table_40->name, attribute_table_40->name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _77->name, _77->name
	leaq	.LC96(%rip), %rdx	;,
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L153:
; src/output.c:670:     tac_output(0, "%zu ", attribute_table->size);
	movl	$0, %esi	;,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	16(%rbp), %rcx	; attribute_table_40->size, attribute_table_40->size
	leaq	.LC97(%rip), %rdx	;, tmp191
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:671:     if (list_is_empty(attribute_table->attributes))
	movq	0(%rbp), %rdi	; attribute_table_40->attributes, attribute_table_40->attributes
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:671:     if (list_is_empty(attribute_table->attributes))
	testb	%al, %al	; tmp339
	je	.L154	;,
; src/output.c:672:         tac_output(0, "{}\n");
	movl	$0, %esi	;,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$3, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC98(%rip), %rdi	;, tmp193
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L151	;
.L236:
; src/output.c:435:         tac_output(indent + 1, "]\n");
	movq	%r12, %rsi	; _4,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC105(%rip), %rdi	;, tmp212
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L150	;
.L231:
; src/output.c:438:         tac_output(indent + 1, "entry_point: \"NULL\"\n");
	leaq	1(%r14), %rsi	;, tmp213
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$20, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC106(%rip), %rdi	;, tmp214
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L165	;
.L166:
; src/output.c:444:         tac_output(indent + 1, "global: [\n");
	leaq	1(%r14), %rbp	;, _15
	movq	%rbp, %rsi	; _15,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC109(%rip), %rdi	;, tmp222
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:447:             output_var(var, outfile, indent + 2);
	leaq	2(%r14), %rbx	;, tmp326
	movq	16(%rsp), %r12	; %sfp, tac
.L168:
; src/output.c:446:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	movq	16(%r12), %rdi	; tac_32(D)->global_vars, tac_32(D)->global_vars
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp343, var
; src/output.c:446:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	testq	%rax, %rax	; var
	je	.L238	;,
; src/output.c:447:             output_var(var, outfile, indent + 2);
	movq	%rbx, %rdx	; tmp326,
	movq	%r15, %rsi	; outfile,
	call	output_var	;
	jmp	.L168	;
.L238:
; src/output.c:448:         tac_output(indent + 1, "]\n");
	movq	%rbp, %rsi	; _15,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC105(%rip), %rdi	;, tmp225
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L167	;
.L170:
; src/output.c:453:         tac_output(indent + 1, "subroutines: [\n");
	leaq	1(%r14), %rbx	;, _21
	movq	%rbx, %rsi	; _21,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC111(%rip), %rdi	;, tmp229
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:583:     switch (instruction->type) {
	leaq	.L195(%rip), %r13	;, tmp323
	movq	%rbx, 40(%rsp)	; _21, %sfp
	movq	%r14, %rbp	; indent, indent
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L172	;
.L245:
; src/output.c:470:         tac_output(indent, "NULL {\n");
	movq	%r14, %rsi	; _22,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC112(%rip), %rdi	;, tmp230
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L174	;
.L246:
; src/output.c:474:         tac_output(indent + 1, "return_type: \"NULL\"\n");
	leaq	3(%rbp), %rsi	;, tmp234
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$20, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC114(%rip), %rdi	;, tmp235
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L176	;
.L177:
; src/output.c:480:         tac_output(indent + 1, "parameters: [\n");
	leaq	3(%rbp), %r12	;, _108
	movq	%r12, %rsi	; _108,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC117(%rip), %rdi	;, tmp243
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:483:             output_var(parameter, outfile, indent + 2);
	leaq	4(%rbp), %rbx	;, tmp321
	movq	%r14, 24(%rsp)	; _22, %sfp
	movq	8(%rsp), %r14	; %sfp, subroutine
.L179:
; src/output.c:482:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	movq	16(%r14), %rdi	; subroutine_56->parameters, subroutine_56->parameters
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp346, parameter
; src/output.c:482:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	testq	%rax, %rax	; parameter
	je	.L239	;,
; src/output.c:483:             output_var(parameter, outfile, indent + 2);
	movq	%rbx, %rdx	; tmp321,
	movq	%r15, %rsi	; outfile,
	call	output_var	;
	jmp	.L179	;
.L239:
; src/output.c:484:         tac_output(indent + 1, "]\n");
	movq	24(%rsp), %r14	; %sfp, _22
	movq	%r12, %rsi	; _108,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC105(%rip), %rdi	;, tmp246
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L178	;
.L181:
; src/output.c:489:         tac_output(indent + 1, "local: [\n");
	leaq	3(%rbp), %r12	;, _115
	movq	%r12, %rsi	; _115,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC119(%rip), %rdi	;, tmp250
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:492:             output_var(var, outfile, indent + 2);
	leaq	4(%rbp), %rbx	;, tmp320
	movq	%r14, 24(%rsp)	; _22, %sfp
	movq	8(%rsp), %r14	; %sfp, subroutine
.L183:
; src/output.c:491:         while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
	movq	24(%r14), %rdi	; subroutine_56->local_vars, subroutine_56->local_vars
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp348, var
; src/output.c:491:         while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
	testq	%rax, %rax	; var
	je	.L240	;,
; src/output.c:492:             output_var(var, outfile, indent + 2);
	movq	%rbx, %rdx	; tmp320,
	movq	%r15, %rsi	; outfile,
	call	output_var	;
	jmp	.L183	;
.L240:
; src/output.c:493:         tac_output(indent + 1, "]\n");
	movq	24(%rsp), %r14	; %sfp, _22
	movq	%r12, %rsi	; _115,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC105(%rip), %rdi	;, tmp253
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L182	;
.L185:
; src/output.c:498:         tac_output(indent + 1, "instructions: [\n");
	leaq	3(%rbp), %rbx	;, _122
	movq	%rbx, %rsi	; _122,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC121(%rip), %rdi	;, tmp257
	call	*fwrite@GOTPCREL(%rip)	;
	movq	%r14, 24(%rsp)	; _22, %sfp
	movq	%rbx, 32(%rsp)	; _122, %sfp
	jmp	.L187	;
.L243:
; src/output.c:530:         tac_output(indent, "NULL ");
	movq	%r12, %rsi	; _123,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC95(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L189	;
.L190:
; src/output.c:536:         tac_output(0, "{\n");
	movl	$0, %esi	;,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC99(%rip), %rdi	;, tmp264
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L192	;
.L220:
; src/output.c:584:         case INST_ADD: tac_output(indent, "add\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC122(%rip), %rdi	;, tmp271
	call	*fwrite@GOTPCREL(%rip)	;
.L221:
; src/output.c:615:     output_arg(instruction->arg1, outfile);
	movq	(%rbx), %rdi	; instruction_132->arg1, instruction_132->arg1
	movq	%r15, %rsi	; outfile,
	call	output_arg	;
; src/output.c:616:     switch (instruction->type) {
	movl	24(%rbx), %ecx	; instruction_132->type, _137
; src/output.c:616:     switch (instruction->type) {
	cmpl	$24, %ecx	;, _137
	ja	.L192	;,
	movl	$1, %eax	;, tmp300
	salq	%cl, %rax	; _137, _155
	testl	$4825087, %eax	;, _155
	jne	.L223	;,
	testl	$25583616, %eax	;, _155
	jne	.L224	;,
	testl	$3145728, %eax	;, _155
	jne	.L225	;,
	jmp	.L192	;
.L219:
; src/output.c:585:         case INST_SUB: tac_output(indent, "sub\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC123(%rip), %rdi	;, tmp272
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L221	;
.L218:
; src/output.c:586:         case INST_MUL: tac_output(indent, "mul\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC124(%rip), %rdi	;, tmp273
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L221	;
.L217:
; src/output.c:587:         case INST_DIV: tac_output(indent, "div\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC125(%rip), %rdi	;, tmp274
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L221	;
.L216:
; src/output.c:588:         case INST_MOD: tac_output(indent, "mod\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC126(%rip), %rdi	;, tmp275
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L221	;
.L215:
; src/output.c:589:         case INST_EQ: tac_output(indent, "eq \t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC127(%rip), %rdi	;, tmp276
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L221	;
.L214:
; src/output.c:590:         case INST_NE: tac_output(indent, "ne \t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC128(%rip), %rdi	;, tmp277
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L221	;
.L213:
; src/output.c:591:         case INST_LT: tac_output(indent, "lt \t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC129(%rip), %rdi	;, tmp278
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L221	;
.L212:
; src/output.c:592:         case INST_GT: tac_output(indent, "gt \t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC130(%rip), %rdi	;, tmp279
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L221	;
.L211:
; src/output.c:593:         case INST_LE: tac_output(indent, "le \t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC131(%rip), %rdi	;, tmp280
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L221	;
.L210:
; src/output.c:594:         case INST_GE: tac_output(indent, "ge \t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC132(%rip), %rdi	;, tmp281
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L221	;
.L209:
; src/output.c:595:         case INST_AND: tac_output(indent, "and\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC133(%rip), %rdi	;, tmp282
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L221	;
.L208:
; src/output.c:596:         case INST_OR: tac_output(indent, "or \t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC134(%rip), %rdi	;, tmp283
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L221	;
.L207:
; src/output.c:597:         case INST_NOT: tac_output(indent, "not\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC135(%rip), %rdi	;, tmp284
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L221	;
.L206:
; src/output.c:598:         case INST_ASSIGN: tac_output(indent, "assign\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC136(%rip), %rdi	;, tmp285
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L221	;
.L205:
; src/output.c:599:         case INST_GET_ATTR: tac_output(indent, "get_attr\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC137(%rip), %rdi	;, tmp286
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L221	;
.L204:
; src/output.c:600:         case INST_GET_ELEM: tac_output(indent, "get_elem\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC138(%rip), %rdi	;, tmp287
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L221	;
.L203:
; src/output.c:601:         case INST_PARAM: tac_output(indent, "param\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC139(%rip), %rdi	;, tmp288
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L221	;
.L202:
; src/output.c:602:         case INST_ALLOC: tac_output(indent, "alloc\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC140(%rip), %rdi	;, tmp289
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L221	;
.L201:
; src/output.c:603:         case INST_JMP_C: tac_output(indent, "jmp_c\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC141(%rip), %rdi	;, tmp290
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L221	;
.L200:
; src/output.c:604:         case INST_JMP: tac_output(indent, "jmp\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC142(%rip), %rdi	;, tmp291
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L221	;
.L199:
; src/output.c:605:         case INST_RET: tac_output(indent, "ret\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC143(%rip), %rdi	;, tmp292
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L221	;
.L198:
; src/output.c:606:         case INST_CALL: tac_output(indent, "call\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC144(%rip), %rdi	;, tmp293
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L221	;
.L197:
; src/output.c:607:         case INST_LOAD: tac_output(indent, "load\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC145(%rip), %rdi	;, tmp294
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L221	;
.L196:
; src/output.c:608:         case INST_STORE: tac_output(indent, "store\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC146(%rip), %rdi	;, tmp295
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L221	;
.L194:
; src/output.c:609:         case INST_NONE: tac_output(indent, "INST_NONE\n"); return;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC147(%rip), %rdi	;, tmp296
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L192	;
.L193:
; src/output.c:611:             tac_output(indent, "unknown_InstructionType: %u\n", instruction->type);
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	24(%rbx), %ecx	; instruction_132->type, instruction_132->type
	leaq	.LC148(%rip), %rdx	;, tmp298
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L192	;
.L223:
; src/output.c:634:             tac_output(0, " ");
	movl	$0, %esi	;,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rsi	; outfile,
	movl	$32, %edi	;,
	call	*fputc@GOTPCREL(%rip)	;
; src/output.c:635:             output_arg(instruction->arg2, outfile);
	movq	8(%rbx), %rdi	; instruction_132->arg2, instruction_132->arg2
	movq	%r15, %rsi	; outfile,
	call	output_arg	;
; src/output.c:636:             tac_output(0, " ");
	movl	$0, %esi	;,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rsi	; outfile,
	movl	$32, %edi	;,
	call	*fputc@GOTPCREL(%rip)	;
; src/output.c:637:             output_arg(instruction->arg3, outfile);
	movq	16(%rbx), %rdi	; instruction_132->arg3, instruction_132->arg3
	movq	%r15, %rsi	; outfile,
	call	output_arg	;
.L225:
; src/output.c:656:     tac_output(0, "\n");
	movl	$0, %esi	;,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rsi	; outfile,
	movl	$10, %edi	;,
	call	*fputc@GOTPCREL(%rip)	;
.L192:
; src/output.c:538:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	movq	8(%r14), %rdi	; block_124->instructions, block_124->instructions
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp351, instruction
; src/output.c:538:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	testq	%rax, %rax	; instruction
	je	.L241	;,
; src/output.c:539:             output_instruction(instruction, outfile, indent + 1);
	leaq	5(%rbp), %rsi	;, _131
; src/output.c:583:     switch (instruction->type) {
	cmpl	$25, 24(%rbx)	;, instruction_132->type
	ja	.L193	;,
	movl	24(%rbx), %eax	; instruction_132->type, instruction_132->type
	movslq	0(%r13,%rax,4), %rax	;, tmp268
	addq	%r13, %rax	; tmp323, tmp269
	jmp	*%rax	; tmp269
	.section	.rodata
	.align 4
	.align 4
.L195:
	.long	.L220-.L195
	.long	.L219-.L195
	.long	.L218-.L195
	.long	.L217-.L195
	.long	.L216-.L195
	.long	.L215-.L195
	.long	.L214-.L195
	.long	.L213-.L195
	.long	.L212-.L195
	.long	.L211-.L195
	.long	.L210-.L195
	.long	.L209-.L195
	.long	.L208-.L195
	.long	.L207-.L195
	.long	.L206-.L195
	.long	.L205-.L195
	.long	.L204-.L195
	.long	.L203-.L195
	.long	.L202-.L195
	.long	.L201-.L195
	.long	.L200-.L195
	.long	.L199-.L195
	.long	.L198-.L195
	.long	.L197-.L195
	.long	.L196-.L195
	.long	.L194-.L195
	.text
.L224:
; src/output.c:645:             tac_output(0, " ");
	movl	$0, %esi	;,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rsi	; outfile,
	movl	$32, %edi	;,
	call	*fputc@GOTPCREL(%rip)	;
; src/output.c:646:             output_arg(instruction->arg2, outfile);
	movq	8(%rbx), %rdi	; instruction_132->arg2, instruction_132->arg2
	movq	%r15, %rsi	; outfile,
	call	output_arg	;
; src/output.c:647:             break;
	jmp	.L225	;
.L241:
; src/output.c:540:         tac_output(indent, "}\n");
	movq	%r12, %rsi	; _123,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC104(%rip), %rdi	;, tmp308
	call	*fwrite@GOTPCREL(%rip)	;
.L187:
; src/output.c:500:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	movq	8(%rsp), %rax	; %sfp, subroutine
	movq	32(%rax), %rdi	; subroutine_56->blocks, subroutine_56->blocks
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp352, block
; src/output.c:500:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	testq	%rax, %rax	; block
	je	.L242	;,
; src/output.c:501:             output_block(block, outfile, indent + 2);
	leaq	4(%rbp), %r12	;, _123
; src/output.c:529:     if (block->label == NULL)
	cmpq	$0, (%r14)	;, block_124->label
	je	.L243	;,
; src/output.c:532:         tac_output(indent, "%s ", block->label->name);
	movq	%r12, %rsi	; _123,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:532:         tac_output(indent, "%s ", block->label->name);
	movq	(%r14), %rax	; block_124->label, block_124->label
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _127->name, _127->name
	leaq	.LC96(%rip), %rdx	;,
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L189:
; src/output.c:533:     if (list_is_empty(block->instructions))
	movq	8(%r14), %rdi	; block_124->instructions, block_124->instructions
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:533:     if (list_is_empty(block->instructions))
	testb	%al, %al	; tmp350
	je	.L190	;,
; src/output.c:534:         tac_output(0, "{}\n");
	movl	$0, %esi	;,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$3, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC98(%rip), %rdi	;, tmp263
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L187	;
.L242:
; src/output.c:502:         tac_output(indent + 1, "]\n");
	movq	24(%rsp), %r14	; %sfp, _22
	movq	32(%rsp), %rbx	; %sfp, _122
	movq	%rbx, %rsi	; _122,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC105(%rip), %rdi	;, tmp310
	call	*fwrite@GOTPCREL(%rip)	;
.L186:
; src/output.c:504:     tac_output(indent, "}\n");
	movq	%r14, %rsi	; _22,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC104(%rip), %rdi	;, tmp311
	call	*fwrite@GOTPCREL(%rip)	;
.L172:
; src/output.c:455:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	movq	16(%rsp), %rax	; %sfp, tac
	movq	24(%rax), %rdi	; tac_32(D)->subroutines, tac_32(D)->subroutines
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; subroutine, %sfp
; src/output.c:455:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	testq	%rax, %rax	; subroutine
	je	.L244	;,
; src/output.c:456:             output_subroutine(subroutine, outfile, indent + 2);
	leaq	2(%rbp), %r14	;, _22
; src/output.c:469:     if (subroutine->name == NULL)
	movq	8(%rsp), %rax	; %sfp, subroutine
	cmpq	$0, (%rax)	;, subroutine_56->name
	je	.L245	;,
; src/output.c:472:         tac_output(indent, "%s {\n", subroutine->name->name);
	movq	%r14, %rsi	; _22,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:472:         tac_output(indent, "%s {\n", subroutine->name->name);
	movq	8(%rsp), %rax	; %sfp, subroutine
	movq	(%rax), %rax	; subroutine_56->name, subroutine_56->name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _98->name, _98->name
	leaq	.LC113(%rip), %rdx	;,
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L174:
; src/output.c:473:     if (subroutine->return_type == NULL)
	movq	8(%rsp), %rax	; %sfp, subroutine
	cmpq	$0, 8(%rax)	;, subroutine_56->return_type
	je	.L246	;,
; src/output.c:476:         tac_output(indent + 1, "return_type: %s\n", subroutine->return_type->name);
	leaq	3(%rbp), %rsi	;, tmp236
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:476:         tac_output(indent + 1, "return_type: %s\n", subroutine->return_type->name);
	movq	8(%rsp), %rax	; %sfp, subroutine
	movq	8(%rax), %rax	; subroutine_56->return_type, subroutine_56->return_type
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _103->name, _103->name
	leaq	.LC115(%rip), %rdx	;, tmp239
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L176:
; src/output.c:477:     if (list_is_empty(subroutine->parameters))
	movq	8(%rsp), %rax	; %sfp, subroutine
	movq	16(%rax), %rdi	; subroutine_56->parameters, subroutine_56->parameters
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:477:     if (list_is_empty(subroutine->parameters))
	testb	%al, %al	; tmp345
	je	.L177	;,
; src/output.c:478:         tac_output(indent + 1, "parameters: []\n");
	leaq	3(%rbp), %rsi	;, tmp241
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC116(%rip), %rdi	;, tmp242
	call	*fwrite@GOTPCREL(%rip)	;
.L178:
; src/output.c:486:     if (list_is_empty(subroutine->local_vars))
	movq	8(%rsp), %rax	; %sfp, subroutine
	movq	24(%rax), %rdi	; subroutine_56->local_vars, subroutine_56->local_vars
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:486:     if (list_is_empty(subroutine->local_vars))
	testb	%al, %al	; tmp347
	je	.L181	;,
; src/output.c:487:         tac_output(indent + 1, "local: []\n");
	leaq	3(%rbp), %rsi	;, tmp248
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC118(%rip), %rdi	;, tmp249
	call	*fwrite@GOTPCREL(%rip)	;
.L182:
; src/output.c:495:     if (list_is_empty(subroutine->blocks))
	movq	8(%rsp), %rax	; %sfp, subroutine
	movq	32(%rax), %rdi	; subroutine_56->blocks, subroutine_56->blocks
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:495:     if (list_is_empty(subroutine->blocks))
	testb	%al, %al	; tmp349
	je	.L185	;,
; src/output.c:496:         tac_output(indent + 1, "instructions: []\n");
	leaq	3(%rbp), %rsi	;, tmp255
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC120(%rip), %rdi	;, tmp256
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L186	;
.L244:
; src/output.c:457:         tac_output(indent + 1, "]\n");
	movq	40(%rsp), %rbx	; %sfp, _21
	movq	%rbp, %r14	; indent, indent
	movq	%rbx, %rsi	; _21,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC105(%rip), %rdi	;, tmp313
	call	*fwrite@GOTPCREL(%rip)	;
.L171:
; src/output.c:459:     tac_output(indent, "}\n");
	movq	%r14, %rsi	; indent,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC104(%rip), %rdi	;, tmp314
	call	*fwrite@GOTPCREL(%rip)	;
.L146:
; src/output.c:461: }
	addq	$56, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	output_TAC, .-output_TAC
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
