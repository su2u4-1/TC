	.file	"main.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O1 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Usage: %s <filename>\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB65:
	.cfi_startproc
	endbr64	
	subq	$8, %rsp	;,
	.cfi_def_cfa_offset 16
; src/main.c:4:     if (argc < 2) {
	cmpl	$1, %edi	;, tmp92
	jle	.L5	;,
; src/main.c:10:     parse_file(filename, true, true);
	movq	8(%rsi), %rdi	; MEM[(char * *)argv_7(D) + 8B], MEM[(char * *)argv_7(D) + 8B]
	movl	$1, %edx	;,
	movl	$1, %esi	;,
	call	parse_file@PLT	;
; src/main.c:12:     return 0;
	movl	$0, %eax	;, <retval>
.L1:
; src/main.c:13: }
	addq	$8, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
.L5:
	.cfi_restore_state
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsi), %rcx	; *argv_7(D),
	leaq	.LC0(%rip), %rdx	;, tmp89
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	__fprintf_chk@PLT	;
; src/main.c:6:         return 1;
	movl	$1, %eax	;, <retval>
	jmp	.L1	;
	.cfi_endproc
.LFE65:
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
