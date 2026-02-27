	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Usage: %s <filename>\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	subq	$8, %rsp
	cmpl	$1, %edi
	jle	.L6
	movq	8(%rsi), %rdi
	movl	$1, %edx
	movl	$1, %esi
	call	*parse_file@GOTPCREL(%rip)
	xorl	%eax, %eax
.L1:
	addq	$8, %rsp
	ret
.L6:
	movq	(%rsi), %rcx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$1, %eax
	jmp	.L1
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
