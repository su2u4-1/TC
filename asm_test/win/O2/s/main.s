	.file	"D:\\TC\\src\\main.c"
	.text
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "Usage: %s <filename>\12\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
main:
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movl	%ecx, %ebx
	subq	$40, %rsp
	call	__main
	cmpl	$1, %ebx
	jle	.L6
	movq	8(%rsi), %rcx
	movl	$1, %r8d
	movl	$1, %edx
	call	parse_file
	xorl	%eax, %eax
.L1:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L6:
	movq	(%rsi), %rbx
	call	__getreent
	leaq	.LC0(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	call	fprintf
	movl	$1, %eax
	jmp	.L1
	.ident	"GCC: (GNU) 13.2.0"
	.def	parse_file;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
