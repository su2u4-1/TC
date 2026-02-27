	.file	"D:\\TC\\src\\main.c"
	.text
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "Usage: %s <filename>\12\0"
	.section	.text.startup,"x"
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
main:
	pushq	%rsi
	movl	%ecx, %esi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$56, %rsp
	call	__main
	decl	%esi
	jg	.L2
	movq	(%rbx), %r8
	movq	%r8, 40(%rsp)
	call	__getreent
	movq	40(%rsp), %r8
	leaq	.LC0(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	movl	$1, %eax
	jmp	.L1
.L2:
	movq	8(%rbx), %rcx
	movl	$1, %r8d
	movl	$1, %edx
	call	parse_file
	xorl	%eax, %eax
.L1:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.ident	"GCC: (GNU) 13.2.0"
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	parse_file;	.scl	2;	.type	32;	.endef
