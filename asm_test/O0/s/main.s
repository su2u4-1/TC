	.file	"D:\\TC\\src\\main.c"
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
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	48(%rsp), %rbp
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movl	%ecx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	call	__main
	cmpl	$1, 32(%rbp)
	jg	.L2
	movq	40(%rbp), %rax
	movq	(%rax), %rbx
	call	__getreent
	movq	24(%rax), %rax
	movq	%rbx, %r8
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %eax
	jmp	.L3
.L2:
	movq	40(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$1, %r8d
	movl	$1, %edx
	movq	%rax, %rcx
	call	parse_file
	movl	$0, %eax
.L3:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 13.2.0"
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	parse_file;	.scl	2;	.type	32;	.endef
