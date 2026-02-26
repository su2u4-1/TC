	.file	"D:\\TC\\src\\main.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O0
	.text
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "Usage: %s <filename>\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$56, %rsp	 ;,
	.seh_stackalloc	56
	leaq	48(%rsp), %rbp	 ;,
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movl	%ecx, 32(%rbp)	 ; argc, argc
	movq	%rdx, 40(%rbp)	 ; argv, argv
 ; D:\TC\src\main.c:3: int main(int argc, char* argv[]) {
	call	__main	 ;
 ; D:\TC\src\main.c:4:     if (argc < 2) {
	cmpl	$1, 32(%rbp)	 ;, argc
	jg	.L2	 ;,
 ; D:\TC\src\main.c:5:         fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
	movq	40(%rbp), %rax	 ; argv, tmp87
	movq	(%rax), %rbx	 ; *argv_8(D), _1
 ; D:\TC\src\main.c:5:         fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
	call	__getreent	 ;
 ; D:\TC\src\main.c:5:         fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
	movq	24(%rax), %rax	 ; _2->_stderr, _3
 ; D:\TC\src\main.c:5:         fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
	movq	%rbx, %r8	 ; _1,
	leaq	.LC0(%rip), %rdx	 ;, tmp88
	movq	%rax, %rcx	 ; _3,
	call	fprintf	 ;
 ; D:\TC\src\main.c:6:         return 1;
	movl	$1, %eax	 ;, _4
	jmp	.L3	 ;
.L2:
 ; D:\TC\src\main.c:8:     string filename = argv[1];
	movq	40(%rbp), %rax	 ; argv, tmp89
	movq	8(%rax), %rax	 ; MEM[(char * *)argv_8(D) + 8B], tmp90
	movq	%rax, -8(%rbp)	 ; tmp90, filename
 ; D:\TC\src\main.c:10:     parse_file(filename, true, true);
	movq	-8(%rbp), %rax	 ; filename, tmp91
	movl	$1, %r8d	 ;,
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp91,
	call	parse_file	 ;
 ; D:\TC\src\main.c:12:     return 0;
	movl	$0, %eax	 ;, _4
.L3:
 ; D:\TC\src\main.c:13: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.ident	"GCC: (GNU) 13.2.0"
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	parse_file;	.scl	2;	.type	32;	.endef
