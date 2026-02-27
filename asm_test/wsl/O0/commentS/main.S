	.file	"main.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O0 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.section	.rodata
.LC0:
	.string	"Usage: %s <filename>\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	;,
	movl	%edi, -20(%rbp)	; argc, argc
	movq	%rsi, -32(%rbp)	; argv, argv
; src/main.c:4:     if (argc < 2) {
	cmpl	$1, -20(%rbp)	;, argc
	jg	.L2	;,
; src/main.c:5:         fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
	movq	-32(%rbp), %rax	; argv, tmp86
	movq	(%rax), %rdx	; *argv_7(D), _1
	movq	stderr(%rip), %rax	; stderr, stderr.0_2
	leaq	.LC0(%rip), %rcx	;, tmp87
	movq	%rcx, %rsi	; tmp87,
	movq	%rax, %rdi	; stderr.0_2,
	movl	$0, %eax	;,
	call	fprintf@PLT	;
; src/main.c:6:         return 1;
	movl	$1, %eax	;, _3
	jmp	.L3	;
.L2:
; src/main.c:8:     string filename = argv[1];
	movq	-32(%rbp), %rax	; argv, tmp88
	movq	8(%rax), %rax	; MEM[(char * *)argv_7(D) + 8B], tmp89
	movq	%rax, -8(%rbp)	; tmp89, filename
; src/main.c:10:     parse_file(filename, true, true);
	movq	-8(%rbp), %rax	; filename, tmp90
	movl	$1, %edx	;,
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp90,
	call	parse_file@PLT	;
; src/main.c:12:     return 0;
	movl	$0, %eax	;, _3
.L3:
; src/main.c:13: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	main, .-main
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
