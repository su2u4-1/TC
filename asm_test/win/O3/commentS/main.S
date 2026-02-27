	.file	"D:\\TC\\src\\main.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O3
	.text
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "Usage: %s <filename>\12\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
 ; D:\TC\src\main.c:3: int main(int argc, char* argv[]) {
	movl	%ecx, %ebx	 ; tmp93, argc
	movq	%rdx, %rsi	 ; tmp94, argv
	call	__main	 ;
 ; D:\TC\src\main.c:4:     if (argc < 2) {
	cmpl	$1, %ebx	 ;, argc
	jle	.L5	 ;,
 ; D:\TC\src\main.c:10:     parse_file(filename, true, true);
	movq	8(%rsi), %rcx	 ; MEM[(char * *)argv_8(D) + 8B], MEM[(char * *)argv_8(D) + 8B]
	movl	$1, %r8d	 ;,
	movl	$1, %edx	 ;,
	call	parse_file	 ;
 ; D:\TC\src\main.c:12:     return 0;
	xorl	%eax, %eax	 ; <retval>
.L1:
 ; D:\TC\src\main.c:13: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
.L5:
 ; D:\TC\src\main.c:5:         fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
	movq	(%rsi), %rbx	 ; *argv_8(D), _1
 ; D:\TC\src\main.c:5:         fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
	call	__getreent	 ;
 ; D:\TC\src\main.c:5:         fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
	leaq	.LC0(%rip), %rdx	 ;, tmp90
	movq	24(%rax), %rcx	 ; _2->_stderr, _2->_stderr
	movq	%rbx, %r8	 ; _1,
	call	fprintf	 ;
 ; D:\TC\src\main.c:6:         return 1;
	movl	$1, %eax	 ;, <retval>
	jmp	.L1	 ;
	.seh_endproc
	.ident	"GCC: (GNU) 13.2.0"
	.def	parse_file;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
