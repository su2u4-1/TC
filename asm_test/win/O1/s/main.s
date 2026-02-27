	.file	"D:\\TC\\src\\main.c"
	.text
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "Usage: %s <filename>\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
main:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movl	%ecx, %ebx
	movq	%rdx, %rsi
	call	__main
	cmpl	$1, %ebx
	jle	.L5
	movq	8(%rsi), %rcx
	movl	$1, %r8d
	movl	$1, %edx
	call	parse_file
	movl	$0, %eax
.L1:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L5:
	movq	(%rsi), %rbx
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	leaq	.LC0(%rip), %rdx
	call	fprintf
	movl	$1, %eax
	jmp	.L1
	.ident	"GCC: (GNU) 13.2.0"
	.def	parse_file;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
