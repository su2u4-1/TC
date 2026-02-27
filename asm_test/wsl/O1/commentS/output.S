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
	.string	"kind: \"unknown_NameType\"\n"
	.text
	.type	output_name, @function
output_name:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rsi, %rbx	; tmp128, outfile
	movq	%rdx, %r12	; tmp129, indent
	movq	%rcx, %r13	; tmp130, parser
; src/output.c:395:     if (name_ptr == NULL) {
	testq	%rdi, %rdi	; name
	je	.L13	;,
	movq	%rdi, %rbp	; tmp127, name
; src/output.c:399:     OUT(0, false, "name: \"%s\"\n", (name_ptr->name));
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	0(%rbp), %rcx	; name_13(D)->name, name_13(D)->name
	leaq	.LC1(%rip), %rdx	;, tmp99
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:400:     OUT(0, false, "id: %zu\n", name_ptr->id);
	movq	%r13, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rbp), %rcx	; name_13(D)->id, name_13(D)->id
	leaq	.LC2(%rip), %rdx	;, tmp101
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:401:     switch (name_ptr->kind) {
	cmpl	$5, 24(%rbp)	;, name_13(D)->kind
	ja	.L4	;,
	movl	24(%rbp), %eax	; name_13(D)->kind, name_13(D)->kind
	leaq	.L6(%rip), %rdx	;, tmp103
	movslq	(%rdx,%rax,4), %rax	;, tmp105
	addq	%rdx, %rax	; tmp103, tmp106
	jmp	*%rax	; tmp106
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
.L13:
; src/output.c:396:         OUT(0, true, "Name pointer: \"NULL\"\n");
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$21, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp97
	call	*fwrite@GOTPCREL(%rip)	;
.L1:
; src/output.c:432: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L11:
; src/output.c:403:             OUT(0, true, "kind: \"type\"\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$13, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC3(%rip), %rdi	;, tmp108
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L1	;
.L10:
; src/output.c:406:             OUT(0, false, "kind: \"variable\"\n");
	movq	%r13, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rdi	;, tmp109
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:407:             OUT(0, true, "type\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp110
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:408:             output_name(name_ptr->info.type, outfile, indent + 1, parser);
	leaq	1(%r12), %rdx	;, tmp111
	movq	16(%rbp), %rdi	; name_13(D)->info.type, name_13(D)->info.type
	movq	%r13, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:409:             break;
	jmp	.L1	;
.L9:
; src/output.c:411:             OUT(0, false, "kind: \"function\"\n");
	movq	%r13, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC6(%rip), %rdi	;, tmp113
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:412:             OUT(0, true, "return_type\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rdi	;, tmp114
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:413:             output_name(name_ptr->info.type, outfile, indent + 1, parser);
	leaq	1(%r12), %rdx	;, tmp115
	movq	16(%rbp), %rdi	; name_13(D)->info.type, name_13(D)->info.type
	movq	%r13, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:414:             break;
	jmp	.L1	;
.L8:
; src/output.c:416:             OUT(0, false, "kind: \"method\"\n");
	movq	%r13, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC8(%rip), %rdi	;, tmp117
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:417:             OUT(0, true, "return_type\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rdi	;, tmp118
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:418:             output_name(name_ptr->info.type, outfile, indent + 1, parser);
	leaq	1(%r12), %rdx	;, tmp119
	movq	16(%rbp), %rdi	; name_13(D)->info.type, name_13(D)->info.type
	movq	%r13, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:419:             break;
	jmp	.L1	;
.L7:
; src/output.c:421:             OUT(0, true, "kind: \"class\"\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC9(%rip), %rdi	;, tmp121
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L1	;
.L5:
; src/output.c:424:             OUT(0, false, "kind: \"attribute\"\n");
	movq	%r13, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rdi	;, tmp122
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:425:             OUT(0, true, "type\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp123
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:426:             output_name(name_ptr->info.type, outfile, indent + 1, parser);
	leaq	1(%r12), %rdx	;, tmp124
	movq	16(%rbp), %rdi	; name_13(D)->info.type, name_13(D)->info.type
	movq	%r13, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:427:             break;
	jmp	.L1	;
.L4:
; src/output.c:429:             OUT(0, true, "kind: \"unknown_NameType\"\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$25, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rdi	;, tmp126
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L1	;
	.size	output_name, .-output_name
	.section	.rodata.str1.1
.LC12:
	.string	"type: \"integer\"\n"
.LC13:
	.string	"value: %s\n"
.LC14:
	.string	"type: \"float\"\n"
.LC15:
	.string	"type: \"string\"\n"
.LC16:
	.string	"value: \"%s\"\n"
.LC17:
	.string	"type: \"boolean\"\n"
.LC18:
	.string	"value: \"true\"\n"
.LC19:
	.string	"value: \"false\"\n"
.LC20:
	.string	"type: \"expression\"\n"
.LC21:
	.string	"value\n"
.LC22:
	.string	"type: \"!\"\n"
.LC23:
	.string	"type: \"-\"\n"
.LC24:
	.string	"type: \"variable\"\n"
.LC25:
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
; src/output.c:299:     switch (primary_ptr->type) {
	cmpl	$8, 8(%rdi)	;, primary_15(D)->type
	ja	.L15	;,
	movl	8(%rdi), %eax	; primary_15(D)->type, primary_15(D)->type
	leaq	.L17(%rip), %rdx	;, tmp100
	movslq	(%rdx,%rax,4), %rax	;, tmp102
	addq	%rdx, %rax	; tmp100, tmp103
	jmp	*%rax	; tmp103
	.section	.rodata
	.align 4
	.align 4
.L17:
	.long	.L25-.L17
	.long	.L24-.L17
	.long	.L23-.L17
	.long	.L22-.L17
	.long	.L21-.L17
	.long	.L20-.L17
	.long	.L19-.L17
	.long	.L18-.L17
	.long	.L16-.L17
	.text
.L25:
; src/output.c:301:             OUT(0, false, "type: \"integer\"\n");
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC12(%rip), %rdi	;, tmp105
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:302:             OUT(0, true, "value: %s\n", (primary_ptr->value.literal_value));
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%r12), %rcx	; primary_15(D)->value.literal_value, primary_15(D)->value.literal_value
	leaq	.LC13(%rip), %rdx	;, tmp107
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L14:
; src/output.c:344: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L24:
; src/output.c:305:             OUT(0, false, "type: \"float\"\n");
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC14(%rip), %rdi	;, tmp108
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:306:             OUT(0, true, "value: %s\n", (primary_ptr->value.literal_value));
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%r12), %rcx	; primary_15(D)->value.literal_value, primary_15(D)->value.literal_value
	leaq	.LC13(%rip), %rdx	;, tmp110
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L14	;
.L23:
; src/output.c:309:             OUT(0, false, "type: \"string\"\n");
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC15(%rip), %rdi	;, tmp111
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:310:             OUT(0, true, "value: \"%s\"\n", (primary_ptr->value.literal_value));
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%r12), %rcx	; primary_15(D)->value.literal_value, primary_15(D)->value.literal_value
	leaq	.LC16(%rip), %rdx	;, tmp113
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L14	;
.L22:
; src/output.c:313:             OUT(0, false, "type: \"boolean\"\n");
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC17(%rip), %rdi	;, tmp114
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:314:             OUT(0, true, "value: \"true\"\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC18(%rip), %rdi	;, tmp115
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L14	;
.L21:
; src/output.c:317:             OUT(0, false, "type: \"boolean\"\n");
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC17(%rip), %rdi	;, tmp116
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:318:             OUT(0, true, "value: \"false\"\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC19(%rip), %rdi	;, tmp117
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L14	;
.L20:
; src/output.c:321:             OUT(0, false, "type: \"expression\"\n");
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$19, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC20(%rip), %rdi	;, tmp118
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:322:             OUT(0, true, "value\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC21(%rip), %rdi	;, tmp119
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:323:             output_expression(primary_ptr->value.expr, outfile, indent + 1, parser);
	leaq	1(%rbp), %rdx	;, tmp120
	movq	(%r12), %rdi	; primary_15(D)->value.expr, primary_15(D)->value.expr
	movq	%r13, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:324:             break;
	jmp	.L14	;
.L19:
; src/output.c:326:             OUT(0, false, "type: \"!\"\n");
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC22(%rip), %rdi	;, tmp122
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:327:             OUT(0, true, "value\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC21(%rip), %rdi	;, tmp123
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:328:             output_primary(primary_ptr->value.operand, outfile, indent + 1, parser);
	leaq	1(%rbp), %rdx	;, tmp124
	movq	(%r12), %rdi	; primary_15(D)->value.operand, primary_15(D)->value.operand
	movq	%r13, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_primary	;
; src/output.c:329:             break;
	jmp	.L14	;
.L18:
; src/output.c:331:             OUT(0, false, "type: \"-\"\n");
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC23(%rip), %rdi	;, tmp126
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:332:             OUT(0, true, "value\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC21(%rip), %rdi	;, tmp127
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:333:             output_primary(primary_ptr->value.operand, outfile, indent + 1, parser);
	leaq	1(%rbp), %rdx	;, tmp128
	movq	(%r12), %rdi	; primary_15(D)->value.operand, primary_15(D)->value.operand
	movq	%r13, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_primary	;
; src/output.c:334:             break;
	jmp	.L14	;
.L16:
; src/output.c:336:             OUT(0, false, "type: \"variable\"\n");
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC24(%rip), %rdi	;, tmp130
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:337:             OUT(0, true, "value\n");
	movq	%r13, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC21(%rip), %rdi	;, tmp131
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:338:             output_variable_access(primary_ptr->value.var, outfile, indent + 1, parser);
	leaq	1(%rbp), %rdx	;, tmp132
	movq	(%r12), %rdi	; primary_15(D)->value.var, primary_15(D)->value.var
	movq	%r13, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_variable_access	;
; src/output.c:339:             break;
	jmp	.L14	;
.L15:
; src/output.c:341:             OUT(0, true, "unknown_PrimaryType: %u\n", primary_ptr->type);
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%r12), %ecx	; primary_15(D)->type, primary_15(D)->type
	leaq	.LC25(%rip), %rdx	;, tmp135
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:344: }
	jmp	.L14	;
	.size	output_primary, .-output_primary
	.section	.rodata.str1.1
.LC26:
	.string	"UNKNOWN_OPERATOR"
.LC27:
	.string	"primary\n"
.LC28:
	.string	"operator: \"%s\"\n"
.LC29:
	.string	"left\n"
.LC30:
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
; src/output.c:282:     if (expression_ptr->operator == OP_NONE) {
	movl	24(%rdi), %edi	; expression_9(D)->operator, _1
; src/output.c:282:     if (expression_ptr->operator == OP_NONE) {
	cmpl	$19, %edi	;, _1
	je	.L34	;,
; src/output.c:286:         string op_str = operator_to_string(expression_ptr->operator);
	call	*operator_to_string@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp106, op_str
; src/output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	movq	%r12, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	testq	%r14, %r14	; op_str
	leaq	.LC26(%rip), %rax	;, tmp101
	cmove	%rax, %r14	; op_str,, tmp101, op_str
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r14, %rcx	; op_str,
	leaq	.LC28(%rip), %rdx	;, tmp96
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:288:         OUT(0, false, "left\n");
	movq	%r12, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC29(%rip), %rdi	;, tmp97
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:289:         output_expression(expression_ptr->expr_left, outfile, indent + 1, parser);
	leaq	1(%rbp), %r14	;, _4
	movq	0(%r13), %rdi	; expression_9(D)->expr_left, expression_9(D)->expr_left
	movq	%r12, %rcx	; parser,
	movq	%r14, %rdx	; _4,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:290:         OUT(0, true, "right\n");
	movq	%r12, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC30(%rip), %rdi	;, tmp99
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:291:         output_expression(expression_ptr->right, outfile, indent + 1, parser);
	movq	16(%r13), %rdi	; expression_9(D)->right, expression_9(D)->right
	movq	%r12, %rcx	; parser,
	movq	%r14, %rdx	; _4,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
.L28:
; src/output.c:293: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
.L34:
; src/output.c:283:         OUT(0, true, "primary\n");
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$8, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC27(%rip), %rdi	;, tmp93
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:284:         output_primary(expression_ptr->prim_left, outfile, indent + 1, parser);
	leaq	1(%rbp), %rdx	;, tmp94
	movq	8(%r13), %rdi	; expression_9(D)->prim_left, expression_9(D)->prim_left
	movq	%r12, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_primary	;
	jmp	.L28	;
	.size	output_expression, .-output_expression
	.section	.rodata.str1.1
.LC31:
	.string	"name\n"
.LC32:
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
; src/output.c:144:     OUT(0, false, "type\n");
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
; src/output.c:145:     output_name(variable_ptr->type, outfile, indent + 1, parser);
	leaq	1(%r12), %r14	;, _1
	movq	0(%r13), %rdi	; variable_7(D)->type, variable_7(D)->type
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _1,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:146:     OUT(0, false, "name\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC31(%rip), %rdi	;, tmp93
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:147:     output_name(variable_ptr->name, outfile, indent + 1, parser);
	movq	8(%r13), %rdi	; variable_7(D)->name, variable_7(D)->name
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _1,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:148:     if (variable_ptr->value != 0) {
	cmpq	$0, 16(%r13)	;, variable_7(D)->value
	je	.L36	;,
; src/output.c:149:         OUT(0, true, "value\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC21(%rip), %rdi	;, tmp95
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:150:         output_expression(variable_ptr->value, outfile, indent + 1, parser);
	movq	16(%r13), %rdi	; variable_7(D)->value, variable_7(D)->value
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _1,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
.L35:
; src/output.c:153: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
.L36:
; src/output.c:152:         OUT(0, true, "value: \"NULL\"\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC32(%rip), %rdi	;, tmp97
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:153: }
	jmp	.L35	;
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
; src/output.c:352:     switch (var_access_ptr->type) {
	movl	16(%rdi), %eax	; variable_access_18(D)->type, _1
; src/output.c:352:     switch (var_access_ptr->type) {
	cmpl	$2, %eax	;, _1
	je	.L40	;,
	ja	.L41	;,
	testl	%eax, %eax	; _1
	je	.L52	;,
; src/output.c:359:             args = list_copy(var_access_ptr->content.args);
	movq	8(%rdi), %rdi	; variable_access_18(D)->content.args, variable_access_18(D)->content.args
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp131, %sfp
; src/output.c:360:             OUT(0, false, "type: \"function_call\"\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$22, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC34(%rip), %rdi	;, tmp108
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:361:             OUT(0, false, "function\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC35(%rip), %rdi	;, tmp109
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:362:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	leaq	1(%r13), %r15	;, _5
	movq	(%r12), %rdi	; variable_access_18(D)->base, variable_access_18(D)->base
	movq	%rbp, %rcx	; parser,
	movq	%r15, %rdx	; _5,
	movq	%rbx, %rsi	; outfile,
	call	output_variable_access	;
; src/output.c:363:             OUT(0, true, "arguments\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC36(%rip), %rdi	;, tmp111
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:365:             index = -1;
	movl	$-1, %r14d	;, index
; src/output.c:366:             while ((arg = (Expression*)list_pop(args)) != 0) {
	jmp	.L47	;
.L41:
; src/output.c:352:     switch (var_access_ptr->type) {
	cmpl	$3, %eax	;, _1
	jne	.L53	;,
; src/output.c:372:             OUT(0, false, "type: \"get sequence_element\"\n");
	movl	$0, %edx	;,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$29, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC38(%rip), %rdi	;, tmp114
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:373:             OUT(0, false, "sequence\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC39(%rip), %rdi	;, tmp115
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:374:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	leaq	1(%r13), %r14	;, _8
	movq	(%r12), %rdi	; variable_access_18(D)->base, variable_access_18(D)->base
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _8,
	movq	%rbx, %rsi	; outfile,
	call	output_variable_access	;
; src/output.c:375:             OUT(0, true, "index\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC40(%rip), %rdi	;, tmp117
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:376:             output_expression(var_access_ptr->content.index, outfile, indent + 1, parser);
	movq	8(%r12), %rdi	; variable_access_18(D)->content.index, variable_access_18(D)->content.index
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _8,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:377:             break;
	jmp	.L39	;
.L52:
; src/output.c:354:             OUT(0, false, "type: \"name\"\n");
	movl	$0, %edx	;,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$13, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC33(%rip), %rdi	;, tmp103
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:355:             OUT(0, true, "name\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC31(%rip), %rdi	;, tmp104
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:356:             output_name(var_access_ptr->content.name, outfile, indent + 1, parser);
	leaq	1(%r13), %rdx	;, tmp105
	movq	8(%r12), %rdi	; variable_access_18(D)->content.name, variable_access_18(D)->content.name
	movq	%rbp, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
.L39:
; src/output.c:389: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L48:
; src/output.c:367:                 OUT(1, false, "arguments[%d]\n", ++index);
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r15, %rsi	; _5,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:367:                 OUT(1, false, "arguments[%d]\n", ++index);
	addl	$1, %r14d	;, index
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%r14d, %ecx	; index,
	leaq	.LC37(%rip), %rdx	;,
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:368:                 output_expression(arg, outfile, indent + 2, parser);
	leaq	2(%r13), %rdx	;, tmp113
	movq	%rbp, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	movq	%r12, %rdi	; arg,
	call	output_expression	;
.L47:
; src/output.c:366:             while ((arg = (Expression*)list_pop(args)) != 0) {
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp132, arg
; src/output.c:366:             while ((arg = (Expression*)list_pop(args)) != 0) {
	testq	%rax, %rax	; arg
	jne	.L48	;,
	jmp	.L39	;
.L40:
; src/output.c:379:             OUT(0, false, "type: \"get_attribute\"\n");
	movl	$0, %edx	;,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$22, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC41(%rip), %rdi	;, tmp119
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:380:             OUT(0, false, "object\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC42(%rip), %rdi	;, tmp120
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:381:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	leaq	1(%r13), %r14	;, _11
	movq	(%r12), %rdi	; variable_access_18(D)->base, variable_access_18(D)->base
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _11,
	movq	%rbx, %rsi	; outfile,
	call	output_variable_access	;
; src/output.c:382:             OUT(0, true, "attribute_name\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC43(%rip), %rdi	;, tmp122
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:383:             output_name(var_access_ptr->content.attr_name, outfile, indent + 1, parser);
	movq	8(%r12), %rdi	; variable_access_18(D)->content.attr_name, variable_access_18(D)->content.attr_name
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _11,
	movq	%rbx, %rsi	; outfile,
	call	output_name	;
; src/output.c:384:             break;
	jmp	.L39	;
.L53:
; src/output.c:386:             OUT(0, true, "unknown_VariableAccessType: %u\n", var_access_ptr->type);
	movl	$1, %edx	;,
	movq	%r13, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	16(%r12), %ecx	; variable_access_18(D)->type, variable_access_18(D)->type
	leaq	.LC44(%rip), %rdx	;, tmp125
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:389: }
	jmp	.L39	;
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
; src/output.c:159:     switch (statement_ptr->type) {
	cmpl	$7, 8(%rdi)	;, statement_18(D)->type
	ja	.L55	;,
	movl	8(%rdi), %eax	; statement_18(D)->type, statement_18(D)->type
	leaq	.L57(%rip), %rdx	;, tmp137
	movslq	(%rdx,%rax,4), %rax	;, tmp139
	addq	%rdx, %rax	; tmp137, tmp140
	jmp	*%rax	; tmp140
	.section	.rodata
	.align 4
	.align 4
.L57:
	.long	.L64-.L57
	.long	.L63-.L57
	.long	.L62-.L57
	.long	.L61-.L57
	.long	.L60-.L57
	.long	.L59-.L57
	.long	.L58-.L57
	.long	.L56-.L57
	.text
.L62:
; src/output.c:161:             OUT(0, false, "if_statement\n");
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$13, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC45(%rip), %rdi	;, tmp142
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:162:             output_if(statement_ptr->stmt.if_stmt, outfile, indent + 1, parser);
	leaq	1(%r12), %r14	;, _2
	movq	0(%r13), %r15	; statement_18(D)->stmt.if_stmt, _3
; src/output.c:208:     list(Statement*) body = list_copy(if_ptr->body);
	movq	8(%r15), %rdi	; _3->body, _3->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp199, body
; src/output.c:209:     list(ElseIf*) else_if_list = list_copy(if_ptr->else_if);
	movq	16(%r15), %rdi	; _3->else_if, _3->else_if
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp200, %sfp
; src/output.c:210:     list(Statement*) else_body = list_copy(if_ptr->else_body);
	movq	24(%r15), %rdi	; _3->else_body, _3->else_body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 16(%rsp)	; tmp201, %sfp
; src/output.c:211:     OUT(0, false, "condition\n");
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
	leaq	.LC46(%rip), %rdi	;, tmp146
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:212:     output_expression(if_ptr->condition, outfile, indent + 1, parser);
	leaq	2(%r12), %r14	;, _57
	movq	(%r15), %rdi	; _3->condition, _3->condition
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _57,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:213:     OUT(0, false, "body\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	24(%rsp), %rsi	; %sfp,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC47(%rip), %rdi	;, tmp148
	call	*fwrite@GOTPCREL(%rip)	;
.L65:
; src/output.c:215:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%r13, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp202, statement
; src/output.c:215:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	; statement
	je	.L87	;,
; src/output.c:216:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _57,
	movq	%rbx, %rsi	; outfile,
	call	output_statement	;
	jmp	.L65	;
.L87:
; src/output.c:217:     OUT(0, false, "else_if\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	24(%rsp), %rsi	; %sfp,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$8, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC48(%rip), %rdi	;, tmp149
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:232:     output_expression(else_if_ptr->condition, outfile, indent + 1, parser);
	leaq	3(%r12), %r13	;, _64
.L67:
; src/output.c:219:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != 0)
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp205, else_if
; src/output.c:219:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != 0)
	testq	%rax, %rax	; else_if
	je	.L88	;,
; src/output.c:230:     list(Statement*) body = list_copy(else_if_ptr->body);
	movq	8(%r15), %rdi	; else_if_60->body, else_if_60->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp203, body
; src/output.c:231:     OUT(0, false, "condition\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r14, %rsi	; _57,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC46(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:232:     output_expression(else_if_ptr->condition, outfile, indent + 1, parser);
	movq	(%r15), %rdi	; else_if_60->condition, else_if_60->condition
	movq	%rbp, %rcx	; parser,
	movq	%r13, %rdx	; _64,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:233:     OUT(0, true, "body\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r14, %rsi	; _57,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC47(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
.L68:
; src/output.c:235:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%r12, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
; src/output.c:235:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	; statement
	je	.L67	;,
; src/output.c:236:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rbp, %rcx	; parser,
	movq	%r13, %rdx	; _64,
	movq	%rbx, %rsi	; outfile,
	movq	%rax, %rdi	; statement,
	call	output_statement	;
	jmp	.L68	;
.L88:
; src/output.c:221:     OUT(0, true, "else_body\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	24(%rsp), %rsi	; %sfp,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC49(%rip), %rdi	;, tmp154
	call	*fwrite@GOTPCREL(%rip)	;
.L71:
; src/output.c:222:     while ((statement = (Statement*)list_pop(else_body)) != 0)
	movq	16(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp206, statement
; src/output.c:222:     while ((statement = (Statement*)list_pop(else_body)) != 0)
	testq	%rax, %rax	; statement
	je	.L54	;,
; src/output.c:223:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rbp, %rcx	; parser,
	movq	%r14, %rdx	; _57,
	movq	%rbx, %rsi	; outfile,
	call	output_statement	;
	jmp	.L71	;
.L60:
; src/output.c:165:             OUT(0, false, "for_statement\n");
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC50(%rip), %rdi	;, tmp155
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:166:             output_for(statement_ptr->stmt.for_stmt, outfile, indent + 1, parser);
	leaq	1(%r12), %r14	;, _4
	movq	0(%r13), %r15	; statement_18(D)->stmt.for_stmt, _5
; src/output.c:243:     list(Statement*) body = list_copy(for_ptr->body);
	movq	24(%r15), %rdi	; _5->body, _5->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp207, body
; src/output.c:244:     if (for_ptr->initializer != 0) {
	cmpq	$0, (%r15)	;, _5->initializer
	je	.L74	;,
; src/output.c:245:         OUT(0, false, "initializer\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r14, %rsi	; _4,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC51(%rip), %rdi	;, tmp157
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:246:         output_variable(for_ptr->initializer, outfile, indent + 1, parser);
	leaq	2(%r12), %rdx	;, tmp158
	movq	(%r15), %rdi	; _5->initializer, _5->initializer
	movq	%rbp, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_variable	;
.L75:
; src/output.c:249:     if (for_ptr->condition != 0) {
	cmpq	$0, 8(%r15)	;, _5->condition
	je	.L76	;,
; src/output.c:250:         OUT(0, false, "condition\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r14, %rsi	; _4,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC46(%rip), %rdi	;, tmp161
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:251:         output_expression(for_ptr->condition, outfile, indent + 1, parser);
	leaq	2(%r12), %rdx	;, tmp162
	movq	8(%r15), %rdi	; _5->condition, _5->condition
	movq	%rbp, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
.L77:
; src/output.c:254:     if (for_ptr->increment != 0) {
	cmpq	$0, 16(%r15)	;, _5->increment
	je	.L78	;,
; src/output.c:255:         OUT(0, false, "increment\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r14, %rsi	; _4,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC54(%rip), %rdi	;, tmp165
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:256:         output_expression(for_ptr->increment, outfile, indent + 1, parser);
	leaq	2(%r12), %rdx	;, tmp166
	movq	16(%r15), %rdi	; _5->increment, _5->increment
	movq	%rbp, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
.L79:
; src/output.c:259:     OUT(0, true, "body\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r14, %rsi	; _4,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC47(%rip), %rdi	;, tmp169
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:262:         output_statement(statement, outfile, indent + 1, parser);
	addq	$2, %r12	;, tmp194
.L80:
; src/output.c:261:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%r13, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp208, statement
; src/output.c:261:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	; statement
	je	.L54	;,
; src/output.c:262:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rbp, %rcx	; parser,
	movq	%r12, %rdx	; tmp194,
	movq	%rbx, %rsi	; outfile,
	call	output_statement	;
	jmp	.L80	;
.L74:
; src/output.c:248:         OUT(0, false, "initializer: \"NULL\"\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r14, %rsi	; _4,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$20, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC52(%rip), %rdi	;, tmp160
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L75	;
.L76:
; src/output.c:253:         OUT(0, false, "condition: \"NULL\"\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r14, %rsi	; _4,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC53(%rip), %rdi	;, tmp164
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L77	;
.L78:
; src/output.c:258:         OUT(0, false, "increment: \"NULL\"\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r14, %rsi	; _4,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC55(%rip), %rdi	;, tmp168
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L79	;
.L61:
; src/output.c:169:             OUT(0, false, "while_statement\n");
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC56(%rip), %rdi	;, tmp171
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:170:             output_while(statement_ptr->stmt.while_stmt, outfile, indent + 1, parser);
	leaq	1(%r12), %r14	;, _6
	movq	0(%r13), %r15	; statement_18(D)->stmt.while_stmt, _7
; src/output.c:269:     list(Statement*) body = list_copy(while_ptr->body);
	movq	8(%r15), %rdi	; _7->body, _7->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp209, body
; src/output.c:270:     OUT(0, false, "condition\n");
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r14, %rsi	; _6,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC46(%rip), %rdi	;, tmp173
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:271:     output_expression(while_ptr->condition, outfile, indent + 1, parser);
	addq	$2, %r12	;, _82
	movq	(%r15), %rdi	; _7->condition, _7->condition
	movq	%rbp, %rcx	; parser,
	movq	%r12, %rdx	; _82,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:272:     OUT(0, true, "body\n");
	movq	%rbp, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%r14, %rsi	; _6,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC47(%rip), %rdi	;, tmp175
	call	*fwrite@GOTPCREL(%rip)	;
.L82:
; src/output.c:274:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%r13, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp210, statement
; src/output.c:274:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	; statement
	je	.L54	;,
; src/output.c:275:         output_statement(statement, outfile, indent + 1, parser);
	movq	%rbp, %rcx	; parser,
	movq	%r12, %rdx	; _82,
	movq	%rbx, %rsi	; outfile,
	call	output_statement	;
	jmp	.L82	;
.L63:
; src/output.c:173:             OUT(0, false, "variable_declaration_statement\n");
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC57(%rip), %rdi	;, tmp176
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:174:             output_variable(statement_ptr->stmt.var, outfile, indent + 1, parser);
	leaq	1(%r12), %rdx	;, tmp177
	movq	0(%r13), %rdi	; statement_18(D)->stmt.var, statement_18(D)->stmt.var
	movq	%rbp, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_variable	;
.L54:
; src/output.c:202: }
	addq	$40, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L59:
; src/output.c:177:             if (statement_ptr->stmt.expr == 0) {
	cmpq	$0, (%rdi)	;, statement_18(D)->stmt.expr
	je	.L89	;,
; src/output.c:181:             OUT(0, false, "return_statement\n");
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC59(%rip), %rdi	;, tmp180
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:182:             output_expression(statement_ptr->stmt.expr, outfile, indent + 1, parser);
	leaq	1(%r12), %rdx	;, tmp181
	movq	0(%r13), %rdi	; statement_18(D)->stmt.expr, statement_18(D)->stmt.expr
	movq	%rbp, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:183:             break;
	jmp	.L54	;
.L89:
; src/output.c:178:                 OUT(0, false, "return_statement: \"NULL\"\n");
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$25, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC58(%rip), %rdi	;, tmp179
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:179:                 return;
	jmp	.L54	;
.L58:
; src/output.c:185:             OUT(0, false, "break_statement: \"NULL\"\n");
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$24, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC60(%rip), %rdi	;, tmp183
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L54	;
.L56:
; src/output.c:188:             OUT(0, false, "continue_statement: \"NULL\"\n");
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$27, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC61(%rip), %rdi	;, tmp184
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L54	;
.L64:
; src/output.c:191:             if (statement_ptr->stmt.expr == 0) {
	cmpq	$0, (%rdi)	;, statement_18(D)->stmt.expr
	je	.L90	;,
; src/output.c:195:             OUT(0, false, "expression_statement\n");
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$21, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC63(%rip), %rdi	;, tmp186
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:196:             output_expression(statement_ptr->stmt.expr, outfile, indent + 1, parser);
	leaq	1(%r12), %rdx	;, tmp187
	movq	0(%r13), %rdi	; statement_18(D)->stmt.expr, statement_18(D)->stmt.expr
	movq	%rbp, %rcx	; parser,
	movq	%rbx, %rsi	; outfile,
	call	output_expression	;
; src/output.c:197:             break;
	jmp	.L54	;
.L90:
; src/output.c:192:                 OUT(0, false, "expression_statement: \"NULL\"\n");
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; outfile,
	movl	$29, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC62(%rip), %rdi	;, tmp185
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:193:                 return;
	jmp	.L54	;
.L55:
; src/output.c:199:             OUT(0, false, "unknown_StatementType: %u\n", statement_ptr->type);
	movl	$0, %edx	;,
	movq	%r12, %rsi	; indent,
	movq	%rbx, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%r13), %ecx	; statement_18(D)->type, statement_18(D)->type
	leaq	.LC64(%rip), %rdx	;, tmp190
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L54	;
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
; src/output.c:47:     list(CodeMember*) members = list_copy((code)->members);
	movq	(%rdi), %rdi	; code_5(D)->members, code_5(D)->members
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 40(%rsp)	; tmp189, %sfp
	movq	%r15, %rax	; parser, parser
	movq	%r14, %r15	; outfile, outfile
	movq	%rax, %r14	; parser, parser
; src/output.c:49:     while ((member = (CodeMember*)list_pop(members)) != 0)
	jmp	.L92	;
.L93:
; src/output.c:31:             OUT(0, false, "function\n");
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC35(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:32:             output_function(code_member_ptr->content.function, outfile, indent + 1, parser);
	leaq	2(%r13), %rbp	;, _17
	movq	%rbp, 8(%rsp)	; _17, %sfp
	movq	(%rbx), %rbx	; member_9->content.function, _18
; src/output.c:66:     OUT(0, false, "name\n");
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; _17,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC31(%rip), %rdi	;, tmp141
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:67:     output_name(function_ptr->name, outfile, indent + 1, parser);
	leaq	3(%r13), %r12	;, _26
	movq	(%rbx), %rdi	; _18->name, _18->name
	movq	%r14, %rcx	; parser,
	movq	%r12, %rdx	; _26,
	movq	%r15, %rsi	; outfile,
	call	output_name	;
; src/output.c:68:     OUT(0, false, "return_type\n");
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
; src/output.c:69:     output_name(function_ptr->return_type, outfile, indent + 1, parser);
	movq	8(%rbx), %rdi	; _18->return_type, _18->return_type
	movq	%r14, %rcx	; parser,
	movq	%r12, %rdx	; _26,
	movq	%r15, %rsi	; outfile,
	call	output_name	;
; src/output.c:70:     OUT(0, false, "parameters\n");
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; _17,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$11, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC68(%rip), %rdi	;, tmp145
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:71:     list(Variable*) parameters = list_copy(function_ptr->parameters);
	movq	16(%rbx), %rdi	; _18->parameters, _18->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, (%rsp)	; tmp190, %sfp
; src/output.c:72:     list(Statement*) body = list_copy(function_ptr->body);
	movq	24(%rbx), %rdi	; _18->body, _18->body
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:74:     int index = -1;
	movl	$-1, %ebp	;, index
	movq	%rax, 16(%rsp)	; body, %sfp
.L98:
; src/output.c:75:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	movq	(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp192, parameter
; src/output.c:75:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	testq	%rax, %rax	; parameter
	je	.L115	;,
; src/output.c:76:         OUT(1, false, "parameters[%d]\n", ++index);
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r12, %rsi	; _26,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:76:         OUT(1, false, "parameters[%d]\n", ++index);
	addl	$1, %ebp	;, index
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebp, %ecx	; index,
	leaq	.LC69(%rip), %rdx	;,
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:77:         output_variable(parameter, outfile, indent + 2, parser);
	leaq	4(%r13), %rdx	;, tmp149
	movq	%r14, %rcx	; parser,
	movq	%r15, %rsi	; outfile,
	movq	%rbx, %rdi	; parameter,
	call	output_variable	;
	jmp	.L98	;
.L115:
; src/output.c:79:     OUT(0, true, "body\n");
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
	leaq	.LC47(%rip), %rdi	;, tmp150
	call	*fwrite@GOTPCREL(%rip)	;
.L100:
; src/output.c:81:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%rbx, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp193, statement
; src/output.c:81:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	; statement
	je	.L92	;,
; src/output.c:82:         output_statement(statement, outfile, indent + 1, parser);
	movq	%r14, %rcx	; parser,
	movq	%r12, %rdx	; _26,
	movq	%r15, %rsi	; outfile,
	call	output_statement	;
	jmp	.L100	;
.L94:
; src/output.c:35:             OUT(0, false, "class\n");
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC70(%rip), %rdi	;, tmp151
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:36:             output_class(code_member_ptr->content.class_, outfile, indent + 1, parser);
	leaq	2(%r13), %rbp	;, _19
	movq	(%rbx), %rbx	; member_9->content.class_, _20
; src/output.c:131:     OUT(0, false, "name\n");
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; _19,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC31(%rip), %rdi	;, tmp152
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:132:     output_name(class_ptr->name, outfile, indent + 1, parser);
	leaq	3(%r13), %rax	;, _38
	movq	%rax, 16(%rsp)	; _38, %sfp
	movq	(%rbx), %rdi	; _20->name, _20->name
	movq	%r14, %rcx	; parser,
	movq	%rax, %rdx	; _38,
	movq	%r15, %rsi	; outfile,
	call	output_name	;
; src/output.c:133:     OUT(0, true, "members\n");
	movq	%r14, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; _19,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$8, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC71(%rip), %rdi	;, tmp154
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:134:     list(ClassMember*) members = list_copy(class_ptr->members);
	movq	8(%rbx), %rdi	; _20->members, _20->members
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp194, %sfp
; src/output.c:136:     while ((member = (ClassMember*)list_pop(members)) != 0)
	jmp	.L102	;
.L103:
; src/output.c:114:             OUT(0, false, "method\n");
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	16(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC72(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:115:             output_method(class_member_ptr->content.method, outfile, indent + 1, parser);
	leaq	4(%r13), %rbp	;, _44
	movq	%rbp, 24(%rsp)	; _44, %sfp
	movq	(%rbx), %rbx	; member_42->content.method, _45
; src/output.c:89:     OUT(0, false, "name\n");
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; _44,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC31(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:90:     output_name(method_ptr->name, outfile, indent + 1, parser);
	leaq	5(%r13), %r12	;, _49
	movq	(%rbx), %rdi	; _45->name, _45->name
	movq	%r14, %rcx	; parser,
	movq	%r12, %rdx	; _49,
	movq	%r15, %rsi	; outfile,
	call	output_name	;
; src/output.c:91:     OUT(0, false, "return_type\n");
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
; src/output.c:92:     output_name(method_ptr->return_type, outfile, indent + 1, parser);
	movq	8(%rbx), %rdi	; _45->return_type, _45->return_type
	movq	%r14, %rcx	; parser,
	movq	%r12, %rdx	; _49,
	movq	%r15, %rsi	; outfile,
	call	output_name	;
; src/output.c:93:     OUT(0, false, "parameters\n");
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; _44,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$11, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC68(%rip), %rdi	;, tmp161
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:94:     list(Variable*) parameters = list_copy(method_ptr->parameters);
	movq	16(%rbx), %rdi	; _45->parameters, _45->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, (%rsp)	; tmp195, %sfp
; src/output.c:95:     list(Statement*) body = list_copy(method_ptr->body);
	movq	24(%rbx), %rdi	; _45->body, _45->body
	call	*list_copy@GOTPCREL(%rip)	;
; src/output.c:97:     int index = -1;
	movl	$-1, %ebp	;, index
	movq	%rax, 32(%rsp)	; body, %sfp
; src/output.c:98:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	jmp	.L106	;
.L107:
; src/output.c:99:         OUT(1, false, "parameters[%d]\n", ++index);
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r12, %rsi	; _49,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:99:         OUT(1, false, "parameters[%d]\n", ++index);
	addl	$1, %ebp	;, index
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebp, %ecx	; index,
	leaq	.LC69(%rip), %rdx	;,
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:100:         output_variable(parameter, outfile, indent + 2, parser);
	leaq	6(%r13), %rdx	;, tmp165
	movq	%r14, %rcx	; parser,
	movq	%r15, %rsi	; outfile,
	movq	%rbx, %rdi	; parameter,
	call	output_variable	;
.L106:
; src/output.c:98:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	movq	(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp197, parameter
; src/output.c:98:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	testq	%rax, %rax	; parameter
	jne	.L107	;,
; src/output.c:102:     OUT(0, true, "body\n");
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
	leaq	.LC47(%rip), %rdi	;, tmp166
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L108	;
.L109:
; src/output.c:105:         output_statement(statement, outfile, indent + 1, parser);
	movq	%r14, %rcx	; parser,
	movq	%r12, %rdx	; _49,
	movq	%r15, %rsi	; outfile,
	call	output_statement	;
.L108:
; src/output.c:104:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	%rbx, %rdi	; body,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp198, statement
; src/output.c:104:     while ((statement = (Statement*)list_pop(body)) != 0)
	testq	%rax, %rax	; statement
	jne	.L109	;,
.L102:
; src/output.c:136:     while ((member = (ClassMember*)list_pop(members)) != 0)
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp199, member
; src/output.c:136:     while ((member = (ClassMember*)list_pop(members)) != 0)
	testq	%rax, %rax	; member
	je	.L92	;,
; src/output.c:112:     switch (class_member_ptr->type) {
	movl	8(%rbx), %eax	; member_42->type, _43
; src/output.c:112:     switch (class_member_ptr->type) {
	testl	%eax, %eax	; _43
	je	.L103	;,
	cmpl	$1, %eax	;, _43
	je	.L104	;,
; src/output.c:122:             OUT(0, false, "unknown_ClassMemberType: %u\n", class_member_ptr->type);
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	16(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%rbx), %ecx	; member_42->type, member_42->type
	leaq	.LC74(%rip), %rdx	;, tmp171
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L102	;
.L104:
; src/output.c:118:             OUT(0, false, "variable\n");
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	16(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC73(%rip), %rdi	;, tmp167
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:119:             output_variable(class_member_ptr->content.variable, outfile, indent + 1, parser);
	leaq	4(%r13), %rdx	;, tmp168
	movq	(%rbx), %rdi	; member_42->content.variable, member_42->content.variable
	movq	%r14, %rcx	; parser,
	movq	%r15, %rsi	; outfile,
	call	output_variable	;
; src/output.c:120:             break;
	jmp	.L102	;
.L95:
; src/output.c:39:             OUT(0, false, "unknown_CodeMemberType: %u\n", code_member_ptr->type);
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	8(%rbx), %ecx	; member_9->type, member_9->type
	leaq	.LC75(%rip), %rdx	;, tmp173
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L92:
; src/output.c:49:     while ((member = (CodeMember*)list_pop(members)) != 0)
	movq	40(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp200, member
; src/output.c:49:     while ((member = (CodeMember*)list_pop(members)) != 0)
	testq	%rax, %rax	; member
	je	.L116	;,
; src/output.c:50:         output_code_member(member, outfile, indent + 1, parser);
	leaq	1(%r13), %rsi	;, _2
; src/output.c:25:     switch (code_member_ptr->type) {
	movl	8(%rbx), %eax	; member_9->type, _14
; src/output.c:25:     switch (code_member_ptr->type) {
	cmpl	$1, %eax	;, _14
	je	.L93	;,
	cmpl	$2, %eax	;, _14
	je	.L94	;,
	testl	%eax, %eax	; _14
	jne	.L95	;,
; src/output.c:27:             OUT(0, false, "import\n");
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC66(%rip), %rdi	;, tmp135
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:28:             output_import(code_member_ptr->content.import, outfile, indent + 1, parser);
	leaq	2(%r13), %rbp	;, _15
	movq	(%rbx), %rbx	; member_9->content.import, _16
; src/output.c:57:     OUT(0, false, "name\n");
	movq	%r14, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; _15,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; outfile,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC31(%rip), %rdi	;, tmp136
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:58:     output_name(import_ptr->name, outfile, indent + 1, parser);
	leaq	3(%r13), %rdx	;, tmp137
	movq	(%rbx), %rdi	; _16->name, _16->name
	movq	%r14, %rcx	; parser,
	movq	%r15, %rsi	; outfile,
	call	output_name	;
; src/output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	movq	%r14, %rcx	; parser,
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; _15,
	movq	%r15, %rdi	; outfile,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	movq	8(%rbx), %rcx	; _16->source, _24
; src/output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	testq	%rcx, %rcx	; _24
	leaq	.LC65(%rip), %rax	;, tmp174
	cmove	%rax, %rcx	; _24,, tmp174, _24
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC67(%rip), %rdx	;, tmp139
	movl	$2, %esi	;,
	movq	%r15, %rdi	; outfile,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/output.c:60: }
	jmp	.L92	;
.L116:
; src/output.c:51: }
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
