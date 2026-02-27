	.file	"main.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Usage: %s <filename>\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
; src/main.c:4:     if (argc < 2) {
	decl	%edi	; tmp92
; src/main.c:3: int main(int argc, char* argv[]) {
	pushq	%rcx	;
; src/main.c:4:     if (argc < 2) {
	jg	.L2	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rsi), %rcx	; *argv_7(D),
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC0(%rip), %rdx	;, tmp89
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/main.c:6:         return 1;
	movl	$1, %eax	;, <retval>
	jmp	.L1	;
.L2:
; src/main.c:10:     parse_file(filename, true, true);
	movq	8(%rsi), %rdi	; MEM[(char * *)argv_7(D) + 8B], MEM[(char * *)argv_7(D) + 8B]
	movl	$1, %edx	;,
	movl	$1, %esi	;,
	call	*parse_file@GOTPCREL(%rip)	;
; src/main.c:12:     return 0;
	xorl	%eax, %eax	; <retval>
.L1:
; src/main.c:13: }
	popq	%rdx	;
	ret	
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
