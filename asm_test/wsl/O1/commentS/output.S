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
	.string	"%s\t%s\n"
	.text
	.type	output_var, @function
output_var:
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rsi, %rbp	; tmp98, outfile
	movq	%rdx, %rsi	; tmp99, indent
; src/output.c:509:     if (var == NULL) {
	testq	%rdi, %rdi	; var
	je	.L97	;,
	movq	%rdi, %rbx	; tmp97, var
; src/output.c:514:     if (var->type == NULL)
	cmpq	$0, 16(%rdi)	;, var_7(D)->type
	je	.L98	;,
; src/output.c:517:         tac_output(indent, "%s\t%s\n", var->type->name, var->name);
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:517:         tac_output(indent, "%s\t%s\n", var->type->name, var->name);
	movq	16(%rbx), %rax	; var_7(D)->type, var_7(D)->type
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _4->name, _4->name
	movq	8(%rbx), %r8	; var_7(D)->name,
	leaq	.LC68(%rip), %rdx	;, tmp96
	movl	$2, %esi	;,
	movq	%rbp, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L92:
; src/output.c:519: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
.L97:
; src/output.c:510:         tac_output(indent, "Var: \"NULL\"\n");
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rcx	; outfile,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC66(%rip), %rdi	;, tmp90
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:512:         return;
	jmp	.L92	;
.L98:
; src/output.c:515:         tac_output(indent, "NULL\t%s\n", var->name);
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rbx), %rcx	; var_7(D)->name, var_7(D)->name
	leaq	.LC67(%rip), %rdx	;, tmp92
	movl	$2, %esi	;,
	movq	%rbp, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L92	;
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
	subq	$8, %rsp	;,
	movq	%rsi, %rbp	; tmp126, outfile
; src/output.c:544:     if (arg == NULL) {
	testq	%rdi, %rdi	; arg
	je	.L116	;,
	movq	%rdi, %rbx	; tmp125, arg
; src/output.c:549:     switch (arg->kind) {
	cmpl	$8, 16(%rdi)	;, arg_15(D)->kind
	ja	.L102	;,
	movl	16(%rdi), %eax	; arg_15(D)->kind, arg_15(D)->kind
	leaq	.L104(%rip), %rdx	;, tmp99
	movslq	(%rdx,%rax,4), %rax	;, tmp101
	addq	%rdx, %rax	; tmp99, tmp102
	jmp	*%rax	; tmp102
	.section	.rodata
	.align 4
	.align 4
.L104:
	.long	.L112-.L104
	.long	.L111-.L104
	.long	.L110-.L104
	.long	.L109-.L104
	.long	.L108-.L104
	.long	.L107-.L104
	.long	.L106-.L104
	.long	.L105-.L104
	.long	.L103-.L104
	.text
.L116:
; src/output.c:545:         tac_output(0, "\"NULL\"");
	movl	$0, %esi	;,
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC71(%rip), %rdi	;, tmp97
	call	*fwrite@GOTPCREL(%rip)	;
.L99:
; src/output.c:562: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
.L112:
; src/output.c:550:         case ARG_VARIABLE: tac_output(0, "%s", arg->value.variable->name); break;
	movl	$0, %esi	;,
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:550:         case ARG_VARIABLE: tac_output(0, "%s", arg->value.variable->name); break;
	movq	(%rbx), %rax	; arg_15(D)->value.variable, arg_15(D)->value.variable
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rdi	; _2->name, _2->name
	movq	%rbp, %rsi	; outfile,
	call	*fputs@GOTPCREL(%rip)	;
	jmp	.L99	;
.L111:
; src/output.c:551:         case ARG_INT: tac_output(0, "%lld", arg->value.int_value); break;
	movl	$0, %esi	;,
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rbx), %rcx	; arg_15(D)->value.int_value, arg_15(D)->value.int_value
	leaq	.LC72(%rip), %rdx	;, tmp107
	movl	$2, %esi	;,
	movq	%rbp, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L99	;
.L110:
; src/output.c:552:         case ARG_FLOAT: tac_output(0, "%f", arg->value.float_value); break;
	movl	$0, %esi	;,
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movsd	(%rbx), %xmm0	; arg_15(D)->value.float_value, arg_15(D)->value.float_value
	leaq	.LC73(%rip), %rdx	;, tmp109
	movl	$2, %esi	;,
	movq	%rbp, %rdi	; outfile,
	movl	$1, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L99	;
.L109:
; src/output.c:553:         case ARG_STRING: tac_output(0, "%s", arg->value.string_value); break;
	movl	$0, %esi	;,
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rbx), %rdi	; arg_15(D)->value.string_value, arg_15(D)->value.string_value
	movq	%rbp, %rsi	; outfile,
	call	*fputs@GOTPCREL(%rip)	;
	jmp	.L99	;
.L108:
; src/output.c:554:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	movl	$0, %esi	;,
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:554:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	cmpb	$0, (%rbx)	;, arg_15(D)->value.bool_value
	leaq	.LC70(%rip), %rdi	;, tmp123
	leaq	.LC69(%rip), %rax	;, tmp124
	cmovne	%rax, %rdi	; tmp123,, tmp124, iftmp.2_13
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rsi	; outfile,
	call	*fputs@GOTPCREL(%rip)	;
	jmp	.L99	;
.L107:
; src/output.c:555:         case ARG_VOID: tac_output(0, "void"); break;
	movl	$0, %esi	;,
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC74(%rip), %rdi	;, tmp111
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L99	;
.L106:
; src/output.c:556:         case ARG_LABEL: tac_output(0, "%s", arg->value.label->name); break;
	movl	$0, %esi	;,
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:556:         case ARG_LABEL: tac_output(0, "%s", arg->value.label->name); break;
	movq	(%rbx), %rax	; arg_15(D)->value.label, arg_15(D)->value.label
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rdi	; _8->name, _8->name
	movq	%rbp, %rsi	; outfile,
	call	*fputs@GOTPCREL(%rip)	;
	jmp	.L99	;
.L105:
; src/output.c:557:         case ARG_SUBROUTINE: tac_output(0, "%s", arg->value.subroutine->name); break;
	movl	$0, %esi	;,
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:557:         case ARG_SUBROUTINE: tac_output(0, "%s", arg->value.subroutine->name); break;
	movq	(%rbx), %rax	; arg_15(D)->value.subroutine, arg_15(D)->value.subroutine
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rdi	; _10->name, _10->name
	movq	%rbp, %rsi	; outfile,
	call	*fputs@GOTPCREL(%rip)	;
	jmp	.L99	;
.L103:
; src/output.c:558:         case ARG_NONE: tac_output(0, "NONE"); break;
	movl	$0, %esi	;,
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC75(%rip), %rdi	;, tmp116
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L99	;
.L102:
; src/output.c:559:         default: tac_output(0, "unknown_ArgType: %u", arg->kind); break;
	movl	$0, %esi	;,
	movq	%rbp, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	16(%rbx), %ecx	; arg_15(D)->kind, arg_15(D)->kind
	leaq	.LC76(%rip), %rdx	;, tmp118
	movl	$2, %esi	;,
	movq	%rbp, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L99	;
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
	jmp	.L118	;
.L119:
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
	leaq	.LC80(%rip), %rdi	;, tmp145
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
.L124:
; src/output.c:69:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp192, parameter
; src/output.c:69:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	; parameter
	je	.L141	;,
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
	leaq	.LC81(%rip), %rdx	;,
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
	jmp	.L124	;
.L141:
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
.L126:
; src/output.c:75:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbx, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp193, statement
; src/output.c:75:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	je	.L118	;,
; src/output.c:76:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%r14, %rcx	; indent_has_next,
	movq	%r12, %rdx	; _26,
	movq	%r15, %rsi	; outfile,
	call	output_statement	;
	jmp	.L126	;
.L120:
; src/output.c:34:             ast_output(0, false, "class\n");
	movq	%r14, %rcx	; indent_has_next,
	movl	$0, %edx	;,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC82(%rip), %rdi	;, tmp151
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
	leaq	.LC83(%rip), %rdi	;, tmp154
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:122:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rbx), %rdi	; _20->members, _20->members
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp194, %sfp
; src/output.c:124:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	jmp	.L128	;
.L129:
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
	leaq	.LC84(%rip), %rdi	;,
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
	leaq	.LC80(%rip), %rdi	;, tmp161
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
	jmp	.L132	;
.L133:
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
	leaq	.LC81(%rip), %rdx	;,
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
.L132:
; src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp197, parameter
; src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	; parameter
	jne	.L133	;,
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
	jmp	.L134	;
.L135:
; src/output.c:97:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%r14, %rcx	; indent_has_next,
	movq	%r12, %rdx	; _49,
	movq	%r15, %rsi	; outfile,
	call	output_statement	;
.L134:
; src/output.c:96:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbx, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp198, statement
; src/output.c:96:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L135	;,
.L128:
; src/output.c:124:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp199, member
; src/output.c:124:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	; member
	je	.L118	;,
; src/output.c:102:     switch (class_member->type) {
	movl	8(%rbx), %eax	; member_42->type, _43
; src/output.c:102:     switch (class_member->type) {
	testl	%eax, %eax	; _43
	je	.L129	;,
	cmpl	$1, %eax	;, _43
	je	.L130	;,
; src/output.c:112:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movq	%r14, %rcx	; indent_has_next,
	movl	$0, %edx	;,
	movq	16(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%rbx), %ecx	; member_42->type, member_42->type
	leaq	.LC86(%rip), %rdx	;, tmp171
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L128	;
.L130:
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
	leaq	.LC85(%rip), %rdi	;, tmp167
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:109:             output_variable(class_member->content.variable, outfile, indent + 1, indent_has_next);
	leaq	4(%r13), %rdx	;, tmp168
	movq	(%rbx), %rdi	; member_42->content.variable, member_42->content.variable
	movq	%r14, %rcx	; indent_has_next,
	movq	%r15, %rsi	; outfile,
	call	output_variable	;
; src/output.c:110:             break;
	jmp	.L128	;
.L121:
; src/output.c:38:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movq	%r14, %rcx	; indent_has_next,
	movl	$0, %edx	;,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%rbx), %ecx	; member_9->type, member_9->type
	leaq	.LC87(%rip), %rdx	;, tmp173
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L118:
; src/output.c:47:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	movq	40(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp200, member
; src/output.c:47:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	; member
	je	.L142	;,
; src/output.c:48:         output_code_member(member, outfile, indent + 1, indent_has_next);
	leaq	1(%r13), %rsi	;, _2
; src/output.c:24:     switch (code_member->type) {
	movl	8(%rbx), %eax	; member_9->type, _14
; src/output.c:24:     switch (code_member->type) {
	cmpl	$1, %eax	;, _14
	je	.L119	;,
	cmpl	$2, %eax	;, _14
	je	.L120	;,
	testl	%eax, %eax	; _14
	jne	.L121	;,
; src/output.c:26:             ast_output(0, false, "import\n");
	movq	%r14, %rcx	; indent_has_next,
	movl	$0, %edx	;,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC78(%rip), %rdi	;, tmp135
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
	leaq	.LC77(%rip), %rax	;, tmp174
	cmove	%rax, %rcx	; _24,, tmp174, _24
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC79(%rip), %rdx	;, tmp139
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:57: }
	jmp	.L118	;
.L142:
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
	subq	$56, %rsp	;,
	movq	%rdi, 16(%rsp)	; tac, %sfp
	movq	%rsi, %r15	; tmp327, outfile
	movq	%rdx, %r14	; tmp328, indent
; src/output.c:422:     if (tac == NULL) {
	testq	%rdi, %rdi	; tac
	je	.L226	;,
; src/output.c:427:     tac_output(indent, "TAC {\n");
	movq	%rdx, %rsi	; indent,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC89(%rip), %rdi	;, tmp176
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:428:     if (list_is_empty(tac->attribute_tables))
	movq	16(%rsp), %rax	; %sfp, tac
	movq	(%rax), %rdi	; tac_32(D)->attribute_tables, tac_32(D)->attribute_tables
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:428:     if (list_is_empty(tac->attribute_tables))
	testb	%al, %al	; tmp329
	je	.L146	;,
; src/output.c:429:         tac_output(indent + 1, "designs: []\n");
	leaq	1(%r14), %rsi	;, tmp178
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC90(%rip), %rdi	;, tmp179
	call	*fwrite@GOTPCREL(%rip)	;
.L147:
; src/output.c:437:     if (tac->entry_point == NULL)
	movq	16(%rsp), %rax	; %sfp, tac
	cmpq	$0, 8(%rax)	;, tac_32(D)->entry_point
	je	.L227	;,
; src/output.c:440:         tac_output(indent + 1, "entry_point: %s\n", tac->entry_point->name);
	leaq	1(%r14), %rsi	;, tmp206
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:440:         tac_output(indent + 1, "entry_point: %s\n", tac->entry_point->name);
	movq	16(%rsp), %rax	; %sfp, tac
	movq	8(%rax), %rax	; tac_32(D)->entry_point, tac_32(D)->entry_point
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _10->name, _10->name
	leaq	.LC103(%rip), %rdx	;, tmp209
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L161:
; src/output.c:441:     if (list_is_empty(tac->global_vars))
	movq	16(%rsp), %rax	; %sfp, tac
	movq	16(%rax), %rdi	; tac_32(D)->global_vars, tac_32(D)->global_vars
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:441:     if (list_is_empty(tac->global_vars))
	testb	%al, %al	; tmp333
	je	.L162	;,
; src/output.c:442:         tac_output(indent + 1, "global: []\n");
	leaq	1(%r14), %rsi	;, tmp211
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$11, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC104(%rip), %rdi	;, tmp212
	call	*fwrite@GOTPCREL(%rip)	;
.L163:
; src/output.c:450:     if (list_is_empty(tac->subroutines))
	movq	16(%rsp), %rax	; %sfp, tac
	movq	24(%rax), %rdi	; tac_32(D)->subroutines, tac_32(D)->subroutines
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:450:     if (list_is_empty(tac->subroutines))
	testb	%al, %al	; tmp335
	je	.L166	;,
; src/output.c:451:         tac_output(indent + 1, "subroutines: []\n");
	leaq	1(%r14), %rsi	;, tmp218
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC106(%rip), %rdi	;, tmp219
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L167	;
.L226:
; src/output.c:423:         tac_output(indent, "TAC: \"NULL\"\n");
	movq	%rdx, %rsi	; indent,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC88(%rip), %rdi	;, tmp175
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:425:         return;
	jmp	.L143	;
.L146:
; src/output.c:431:         tac_output(indent + 1, "designs: [\n");
	leaq	1(%r14), %r13	;, _4
	movq	%r13, %rsi	; _4,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$11, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC91(%rip), %rdi	;, tmp180
	call	*fwrite@GOTPCREL(%rip)	;
	leaq	.LC93(%rip), %r12	;, tmp322
	movq	16(%rsp), %rbx	; %sfp, tac
	jmp	.L148	;
.L232:
; src/output.c:654:         tac_output(indent, "NULL ");
	movq	%rax, %rsi	; _5,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC92(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L150	;
.L151:
; src/output.c:661:         tac_output(0, "{\n");
	movl	$0, %esi	;,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC96(%rip), %rdi	;, tmp189
	call	*fwrite@GOTPCREL(%rip)	;
	movq	%r13, 24(%rsp)	; _4, %sfp
	jmp	.L153	;
.L229:
; src/output.c:677:         tac_output(indent, "NULL\t");
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC97(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L155	;
.L230:
; src/output.c:681:         tac_output(0, "NULL ");
	movl	$0, %esi	;,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC92(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
.L157:
; src/output.c:684:     tac_output(0, "%zu\n", attribute->offset);
	movl	$0, %esi	;,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	16(%r13), %rcx	; attribute_83->offset, attribute_83->offset
	leaq	.LC99(%rip), %rdx	;, tmp199
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L153:
; src/output.c:663:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	movq	0(%rbp), %rdi	; attribute_table_40->attributes, attribute_table_40->attributes
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp331, attribute
; src/output.c:663:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	testq	%rax, %rax	; attribute
	je	.L228	;,
; src/output.c:664:             output_attribute(attribute, outfile, indent + 1);
	leaq	3(%r14), %rsi	;, _82
; src/output.c:676:     if (attribute->type == NULL)
	cmpq	$0, 8(%r13)	;, attribute_83->type
	je	.L229	;,
; src/output.c:679:         tac_output(indent, "%s\t", attribute->type->name);
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:679:         tac_output(indent, "%s\t", attribute->type->name);
	movq	8(%r13), %rax	; attribute_83->type, attribute_83->type
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _86->name, _86->name
	leaq	.LC98(%rip), %rdx	;,
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L155:
; src/output.c:680:     if (attribute->var == NULL)
	cmpq	$0, 0(%r13)	;, attribute_83->var
	je	.L230	;,
; src/output.c:683:         tac_output(0, "%s ", attribute->var->name);
	movl	$0, %esi	;,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:683:         tac_output(0, "%s ", attribute->var->name);
	movq	0(%r13), %rax	; attribute_83->var, attribute_83->var
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _89->name, _89->name
	movq	%r12, %rdx	; tmp322,
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L157	;
.L228:
; src/output.c:665:         tac_output(indent, "}\n");
	movq	24(%rsp), %r13	; %sfp, _4
	movq	8(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC100(%rip), %rdi	;, tmp201
	call	*fwrite@GOTPCREL(%rip)	;
.L148:
; src/output.c:433:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	movq	(%rbx), %rdi	; tac_32(D)->attribute_tables, tac_32(D)->attribute_tables
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp332, attribute_table
; src/output.c:433:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	testq	%rax, %rax	; attribute_table
	je	.L231	;,
; src/output.c:434:             output_attribute_table(attribute_table, outfile, indent + 2);
	leaq	2(%r14), %rax	;, _5
	movq	%rax, 8(%rsp)	; _5, %sfp
; src/output.c:653:     if (attribute_table->name == NULL)
	cmpq	$0, 8(%rbp)	;, attribute_table_40->name
	je	.L232	;,
; src/output.c:656:         tac_output(indent, "%s ", attribute_table->name->name);
	movq	8(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:656:         tac_output(indent, "%s ", attribute_table->name->name);
	movq	8(%rbp), %rax	; attribute_table_40->name, attribute_table_40->name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _77->name, _77->name
	movq	%r12, %rdx	; tmp322,
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L150:
; src/output.c:657:     tac_output(0, "%zu ", attribute_table->size);
	movl	$0, %esi	;,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	16(%rbp), %rcx	; attribute_table_40->size, attribute_table_40->size
	leaq	.LC94(%rip), %rdx	;, tmp186
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:658:     if (list_is_empty(attribute_table->attributes))
	movq	0(%rbp), %rdi	; attribute_table_40->attributes, attribute_table_40->attributes
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:658:     if (list_is_empty(attribute_table->attributes))
	testb	%al, %al	; tmp330
	je	.L151	;,
; src/output.c:659:         tac_output(0, "{}\n");
	movl	$0, %esi	;,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$3, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC95(%rip), %rdi	;, tmp188
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L148	;
.L231:
; src/output.c:435:         tac_output(indent + 1, "]\n");
	movq	%r13, %rsi	; _4,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC101(%rip), %rdi	;, tmp203
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L147	;
.L227:
; src/output.c:438:         tac_output(indent + 1, "entry_point: \"NULL\"\n");
	leaq	1(%r14), %rsi	;, tmp204
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$20, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC102(%rip), %rdi	;, tmp205
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L161	;
.L162:
; src/output.c:444:         tac_output(indent + 1, "global: [\n");
	leaq	1(%r14), %rbp	;, _15
	movq	%rbp, %rsi	; _15,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC105(%rip), %rdi	;, tmp213
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:447:             output_var(var, outfile, indent + 2);
	leaq	2(%r14), %rbx	;, tmp317
	movq	16(%rsp), %r12	; %sfp, tac
.L164:
; src/output.c:446:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	movq	16(%r12), %rdi	; tac_32(D)->global_vars, tac_32(D)->global_vars
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp334, var
; src/output.c:446:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	testq	%rax, %rax	; var
	je	.L233	;,
; src/output.c:447:             output_var(var, outfile, indent + 2);
	movq	%rbx, %rdx	; tmp317,
	movq	%r15, %rsi	; outfile,
	call	output_var	;
	jmp	.L164	;
.L233:
; src/output.c:448:         tac_output(indent + 1, "]\n");
	movq	%rbp, %rsi	; _15,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC101(%rip), %rdi	;, tmp216
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L163	;
.L166:
; src/output.c:453:         tac_output(indent + 1, "subroutines: [\n");
	leaq	1(%r14), %rbx	;, _21
	movq	%rbx, %rsi	; _21,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC107(%rip), %rdi	;, tmp220
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:570:     switch (instruction->type) {
	leaq	.L191(%rip), %r13	;, tmp314
	movq	%rbx, 40(%rsp)	; _21, %sfp
	movq	%r14, %rbp	; indent, indent
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L168	;
.L240:
; src/output.c:470:         tac_output(indent, "NULL {\n");
	movq	%r14, %rsi	; _22,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC108(%rip), %rdi	;, tmp221
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L170	;
.L241:
; src/output.c:474:         tac_output(indent + 1, "return_type: \"NULL\"\n");
	leaq	3(%rbp), %rsi	;, tmp225
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$20, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC110(%rip), %rdi	;, tmp226
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L172	;
.L173:
; src/output.c:480:         tac_output(indent + 1, "parameters: [\n");
	leaq	3(%rbp), %r12	;, _103
	movq	%r12, %rsi	; _103,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC113(%rip), %rdi	;, tmp234
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:483:             output_var(parameter, outfile, indent + 2);
	leaq	4(%rbp), %rbx	;, tmp312
	movq	%r14, 24(%rsp)	; _22, %sfp
	movq	8(%rsp), %r14	; %sfp, subroutine
.L175:
; src/output.c:482:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	movq	16(%r14), %rdi	; subroutine_56->parameters, subroutine_56->parameters
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp337, parameter
; src/output.c:482:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	testq	%rax, %rax	; parameter
	je	.L234	;,
; src/output.c:483:             output_var(parameter, outfile, indent + 2);
	movq	%rbx, %rdx	; tmp312,
	movq	%r15, %rsi	; outfile,
	call	output_var	;
	jmp	.L175	;
.L234:
; src/output.c:484:         tac_output(indent + 1, "]\n");
	movq	24(%rsp), %r14	; %sfp, _22
	movq	%r12, %rsi	; _103,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC101(%rip), %rdi	;, tmp237
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L174	;
.L177:
; src/output.c:489:         tac_output(indent + 1, "local: [\n");
	leaq	3(%rbp), %r12	;, _110
	movq	%r12, %rsi	; _110,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC115(%rip), %rdi	;, tmp241
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:492:             output_var(var, outfile, indent + 2);
	leaq	4(%rbp), %rbx	;, tmp311
	movq	%r14, 24(%rsp)	; _22, %sfp
	movq	8(%rsp), %r14	; %sfp, subroutine
.L179:
; src/output.c:491:         while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
	movq	24(%r14), %rdi	; subroutine_56->local_vars, subroutine_56->local_vars
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp339, var
; src/output.c:491:         while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
	testq	%rax, %rax	; var
	je	.L235	;,
; src/output.c:492:             output_var(var, outfile, indent + 2);
	movq	%rbx, %rdx	; tmp311,
	movq	%r15, %rsi	; outfile,
	call	output_var	;
	jmp	.L179	;
.L235:
; src/output.c:493:         tac_output(indent + 1, "]\n");
	movq	24(%rsp), %r14	; %sfp, _22
	movq	%r12, %rsi	; _110,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC101(%rip), %rdi	;, tmp244
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L178	;
.L181:
; src/output.c:498:         tac_output(indent + 1, "instructions: [\n");
	leaq	3(%rbp), %rbx	;, _117
	movq	%rbx, %rsi	; _117,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC117(%rip), %rdi	;, tmp248
	call	*fwrite@GOTPCREL(%rip)	;
	movq	%r14, 24(%rsp)	; _22, %sfp
	movq	%rbx, 32(%rsp)	; _117, %sfp
	jmp	.L183	;
.L238:
; src/output.c:528:         tac_output(indent, "NULL ");
	movq	%r12, %rsi	; _118,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC92(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L185	;
.L186:
; src/output.c:534:         tac_output(0, "{\n");
	movl	$0, %esi	;,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC96(%rip), %rdi	;, tmp255
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L188	;
.L216:
; src/output.c:571:         case INST_ADD: tac_output(indent, "add\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC118(%rip), %rdi	;, tmp262
	call	*fwrite@GOTPCREL(%rip)	;
.L217:
; src/output.c:602:     output_arg(instruction->arg1, outfile);
	movq	(%rbx), %rdi	; instruction_127->arg1, instruction_127->arg1
	movq	%r15, %rsi	; outfile,
	call	output_arg	;
; src/output.c:603:     switch (instruction->type) {
	movl	24(%rbx), %ecx	; instruction_127->type, _132
; src/output.c:603:     switch (instruction->type) {
	cmpl	$24, %ecx	;, _132
	ja	.L188	;,
	movl	$1, %eax	;, tmp291
	salq	%cl, %rax	; _132, _150
	testl	$4825087, %eax	;, _150
	jne	.L219	;,
	testl	$25583616, %eax	;, _150
	jne	.L220	;,
	testl	$3145728, %eax	;, _150
	jne	.L221	;,
	jmp	.L188	;
.L215:
; src/output.c:572:         case INST_SUB: tac_output(indent, "sub\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC119(%rip), %rdi	;, tmp263
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L217	;
.L214:
; src/output.c:573:         case INST_MUL: tac_output(indent, "mul\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC120(%rip), %rdi	;, tmp264
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L217	;
.L213:
; src/output.c:574:         case INST_DIV: tac_output(indent, "div\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC121(%rip), %rdi	;, tmp265
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L217	;
.L212:
; src/output.c:575:         case INST_MOD: tac_output(indent, "mod\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC122(%rip), %rdi	;, tmp266
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L217	;
.L211:
; src/output.c:576:         case INST_EQ: tac_output(indent, "eq \t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC123(%rip), %rdi	;, tmp267
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L217	;
.L210:
; src/output.c:577:         case INST_NE: tac_output(indent, "ne \t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC124(%rip), %rdi	;, tmp268
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L217	;
.L209:
; src/output.c:578:         case INST_LT: tac_output(indent, "lt \t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC125(%rip), %rdi	;, tmp269
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L217	;
.L208:
; src/output.c:579:         case INST_GT: tac_output(indent, "gt \t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC126(%rip), %rdi	;, tmp270
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L217	;
.L207:
; src/output.c:580:         case INST_LE: tac_output(indent, "le \t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC127(%rip), %rdi	;, tmp271
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L217	;
.L206:
; src/output.c:581:         case INST_GE: tac_output(indent, "ge \t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC128(%rip), %rdi	;, tmp272
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L217	;
.L205:
; src/output.c:582:         case INST_AND: tac_output(indent, "and\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC129(%rip), %rdi	;, tmp273
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L217	;
.L204:
; src/output.c:583:         case INST_OR: tac_output(indent, "or \t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC130(%rip), %rdi	;, tmp274
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L217	;
.L203:
; src/output.c:584:         case INST_NOT: tac_output(indent, "not\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC131(%rip), %rdi	;, tmp275
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L217	;
.L202:
; src/output.c:585:         case INST_ASSIGN: tac_output(indent, "assign\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC132(%rip), %rdi	;, tmp276
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L217	;
.L201:
; src/output.c:586:         case INST_GET_ATTR: tac_output(indent, "get_attr\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC133(%rip), %rdi	;, tmp277
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L217	;
.L200:
; src/output.c:587:         case INST_GET_ELEM: tac_output(indent, "get_elem\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC134(%rip), %rdi	;, tmp278
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L217	;
.L199:
; src/output.c:588:         case INST_PARAM: tac_output(indent, "param\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC135(%rip), %rdi	;, tmp279
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L217	;
.L198:
; src/output.c:589:         case INST_ALLOC: tac_output(indent, "alloc\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC136(%rip), %rdi	;, tmp280
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L217	;
.L197:
; src/output.c:590:         case INST_JMP_C: tac_output(indent, "jmp_c\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC137(%rip), %rdi	;, tmp281
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L217	;
.L196:
; src/output.c:591:         case INST_JMP: tac_output(indent, "jmp\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC138(%rip), %rdi	;, tmp282
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L217	;
.L195:
; src/output.c:592:         case INST_RET: tac_output(indent, "ret\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC139(%rip), %rdi	;, tmp283
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L217	;
.L194:
; src/output.c:593:         case INST_CALL: tac_output(indent, "call\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC140(%rip), %rdi	;, tmp284
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L217	;
.L193:
; src/output.c:594:         case INST_LOAD: tac_output(indent, "load\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC141(%rip), %rdi	;, tmp285
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L217	;
.L192:
; src/output.c:595:         case INST_STORE: tac_output(indent, "store\t"); break;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC142(%rip), %rdi	;, tmp286
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L217	;
.L190:
; src/output.c:596:         case INST_NONE: tac_output(indent, "INST_NONE\n"); return;
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC143(%rip), %rdi	;, tmp287
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L188	;
.L189:
; src/output.c:598:             tac_output(indent, "unknown_InstructionType: %u\n", instruction->type);
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	24(%rbx), %ecx	; instruction_127->type, instruction_127->type
	leaq	.LC144(%rip), %rdx	;, tmp289
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L188	;
.L219:
; src/output.c:621:             tac_output(0, " ");
	movl	$0, %esi	;,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rsi	; outfile,
	movl	$32, %edi	;,
	call	*fputc@GOTPCREL(%rip)	;
; src/output.c:622:             output_arg(instruction->arg2, outfile);
	movq	8(%rbx), %rdi	; instruction_127->arg2, instruction_127->arg2
	movq	%r15, %rsi	; outfile,
	call	output_arg	;
; src/output.c:623:             tac_output(0, " ");
	movl	$0, %esi	;,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rsi	; outfile,
	movl	$32, %edi	;,
	call	*fputc@GOTPCREL(%rip)	;
; src/output.c:624:             output_arg(instruction->arg3, outfile);
	movq	16(%rbx), %rdi	; instruction_127->arg3, instruction_127->arg3
	movq	%r15, %rsi	; outfile,
	call	output_arg	;
.L221:
; src/output.c:643:     tac_output(0, "\n");
	movl	$0, %esi	;,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rsi	; outfile,
	movl	$10, %edi	;,
	call	*fputc@GOTPCREL(%rip)	;
.L188:
; src/output.c:536:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	movq	8(%r14), %rdi	; block_119->instructions, block_119->instructions
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp342, instruction
; src/output.c:536:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	testq	%rax, %rax	; instruction
	je	.L236	;,
; src/output.c:537:             output_instruction(instruction, outfile, indent + 1);
	leaq	5(%rbp), %rsi	;, _126
; src/output.c:570:     switch (instruction->type) {
	cmpl	$25, 24(%rbx)	;, instruction_127->type
	ja	.L189	;,
	movl	24(%rbx), %eax	; instruction_127->type, instruction_127->type
	movslq	0(%r13,%rax,4), %rax	;, tmp259
	addq	%r13, %rax	; tmp314, tmp260
	jmp	*%rax	; tmp260
	.section	.rodata
	.align 4
	.align 4
.L191:
	.long	.L216-.L191
	.long	.L215-.L191
	.long	.L214-.L191
	.long	.L213-.L191
	.long	.L212-.L191
	.long	.L211-.L191
	.long	.L210-.L191
	.long	.L209-.L191
	.long	.L208-.L191
	.long	.L207-.L191
	.long	.L206-.L191
	.long	.L205-.L191
	.long	.L204-.L191
	.long	.L203-.L191
	.long	.L202-.L191
	.long	.L201-.L191
	.long	.L200-.L191
	.long	.L199-.L191
	.long	.L198-.L191
	.long	.L197-.L191
	.long	.L196-.L191
	.long	.L195-.L191
	.long	.L194-.L191
	.long	.L193-.L191
	.long	.L192-.L191
	.long	.L190-.L191
	.text
.L220:
; src/output.c:632:             tac_output(0, " ");
	movl	$0, %esi	;,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rsi	; outfile,
	movl	$32, %edi	;,
	call	*fputc@GOTPCREL(%rip)	;
; src/output.c:633:             output_arg(instruction->arg2, outfile);
	movq	8(%rbx), %rdi	; instruction_127->arg2, instruction_127->arg2
	movq	%r15, %rsi	; outfile,
	call	output_arg	;
; src/output.c:634:             break;
	jmp	.L221	;
.L236:
; src/output.c:538:         tac_output(indent, "}\n");
	movq	%r12, %rsi	; _118,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC100(%rip), %rdi	;, tmp299
	call	*fwrite@GOTPCREL(%rip)	;
.L183:
; src/output.c:500:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	movq	8(%rsp), %rax	; %sfp, subroutine
	movq	32(%rax), %rdi	; subroutine_56->blocks, subroutine_56->blocks
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp343, block
; src/output.c:500:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	testq	%rax, %rax	; block
	je	.L237	;,
; src/output.c:501:             output_block(block, outfile, indent + 2);
	leaq	4(%rbp), %r12	;, _118
; src/output.c:527:     if (block->label == NULL)
	cmpq	$0, (%r14)	;, block_119->label
	je	.L238	;,
; src/output.c:530:         tac_output(indent, "%s ", block->label->name);
	movq	%r12, %rsi	; _118,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:530:         tac_output(indent, "%s ", block->label->name);
	movq	(%r14), %rax	; block_119->label, block_119->label
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _122->name, _122->name
	leaq	.LC93(%rip), %rdx	;,
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L185:
; src/output.c:531:     if (list_is_empty(block->instructions))
	movq	8(%r14), %rdi	; block_119->instructions, block_119->instructions
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:531:     if (list_is_empty(block->instructions))
	testb	%al, %al	; tmp341
	je	.L186	;,
; src/output.c:532:         tac_output(0, "{}\n");
	movl	$0, %esi	;,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$3, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC95(%rip), %rdi	;, tmp254
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L183	;
.L237:
; src/output.c:502:         tac_output(indent + 1, "]\n");
	movq	24(%rsp), %r14	; %sfp, _22
	movq	32(%rsp), %rbx	; %sfp, _117
	movq	%rbx, %rsi	; _117,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC101(%rip), %rdi	;, tmp301
	call	*fwrite@GOTPCREL(%rip)	;
.L182:
; src/output.c:504:     tac_output(indent, "}\n");
	movq	%r14, %rsi	; _22,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC100(%rip), %rdi	;, tmp302
	call	*fwrite@GOTPCREL(%rip)	;
.L168:
; src/output.c:455:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	movq	16(%rsp), %rax	; %sfp, tac
	movq	24(%rax), %rdi	; tac_32(D)->subroutines, tac_32(D)->subroutines
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; subroutine, %sfp
; src/output.c:455:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	testq	%rax, %rax	; subroutine
	je	.L239	;,
; src/output.c:456:             output_subroutine(subroutine, outfile, indent + 2);
	leaq	2(%rbp), %r14	;, _22
; src/output.c:469:     if (subroutine->name == NULL)
	movq	8(%rsp), %rax	; %sfp, subroutine
	cmpq	$0, (%rax)	;, subroutine_56->name
	je	.L240	;,
; src/output.c:472:         tac_output(indent, "%s {\n", subroutine->name->name);
	movq	%r14, %rsi	; _22,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:472:         tac_output(indent, "%s {\n", subroutine->name->name);
	movq	8(%rsp), %rax	; %sfp, subroutine
	movq	(%rax), %rax	; subroutine_56->name, subroutine_56->name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _93->name, _93->name
	leaq	.LC109(%rip), %rdx	;,
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L170:
; src/output.c:473:     if (subroutine->return_type == NULL)
	movq	8(%rsp), %rax	; %sfp, subroutine
	cmpq	$0, 8(%rax)	;, subroutine_56->return_type
	je	.L241	;,
; src/output.c:476:         tac_output(indent + 1, "return_type: %s\n", subroutine->return_type->name);
	leaq	3(%rbp), %rsi	;, tmp227
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:476:         tac_output(indent + 1, "return_type: %s\n", subroutine->return_type->name);
	movq	8(%rsp), %rax	; %sfp, subroutine
	movq	8(%rax), %rax	; subroutine_56->return_type, subroutine_56->return_type
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _98->name, _98->name
	leaq	.LC111(%rip), %rdx	;, tmp230
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L172:
; src/output.c:477:     if (list_is_empty(subroutine->parameters))
	movq	8(%rsp), %rax	; %sfp, subroutine
	movq	16(%rax), %rdi	; subroutine_56->parameters, subroutine_56->parameters
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:477:     if (list_is_empty(subroutine->parameters))
	testb	%al, %al	; tmp336
	je	.L173	;,
; src/output.c:478:         tac_output(indent + 1, "parameters: []\n");
	leaq	3(%rbp), %rsi	;, tmp232
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC112(%rip), %rdi	;, tmp233
	call	*fwrite@GOTPCREL(%rip)	;
.L174:
; src/output.c:486:     if (list_is_empty(subroutine->local_vars))
	movq	8(%rsp), %rax	; %sfp, subroutine
	movq	24(%rax), %rdi	; subroutine_56->local_vars, subroutine_56->local_vars
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:486:     if (list_is_empty(subroutine->local_vars))
	testb	%al, %al	; tmp338
	je	.L177	;,
; src/output.c:487:         tac_output(indent + 1, "local: []\n");
	leaq	3(%rbp), %rsi	;, tmp239
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC114(%rip), %rdi	;, tmp240
	call	*fwrite@GOTPCREL(%rip)	;
.L178:
; src/output.c:495:     if (list_is_empty(subroutine->blocks))
	movq	8(%rsp), %rax	; %sfp, subroutine
	movq	32(%rax), %rdi	; subroutine_56->blocks, subroutine_56->blocks
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:495:     if (list_is_empty(subroutine->blocks))
	testb	%al, %al	; tmp340
	je	.L181	;,
; src/output.c:496:         tac_output(indent + 1, "instructions: []\n");
	leaq	3(%rbp), %rsi	;, tmp246
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC116(%rip), %rdi	;, tmp247
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L182	;
.L239:
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
	leaq	.LC101(%rip), %rdi	;, tmp304
	call	*fwrite@GOTPCREL(%rip)	;
.L167:
; src/output.c:459:     tac_output(indent, "}\n");
	movq	%r14, %rsi	; indent,
	movq	%r15, %rdi	; outfile,
	call	*indention_tac@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC100(%rip), %rdi	;, tmp305
	call	*fwrite@GOTPCREL(%rip)	;
.L143:
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
