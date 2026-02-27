	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Usage: %s <filename>\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
	decl	%edi
	pushq	%rcx
	jg	.L2
	movq	(%rsi), %rcx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$1, %eax
	jmp	.L1
.L2:
	movq	8(%rsi), %rdi
	movl	$1, %edx
	movl	$1, %esi
	call	*parse_file@GOTPCREL(%rip)
	xorl	%eax, %eax
.L1:
	popq	%rdx
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
