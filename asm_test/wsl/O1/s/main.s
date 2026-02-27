	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Usage: %s <filename>\n"
	.text
	.globl	main
	.type	main, @function
main:
	subq	$8, %rsp
	cmpl	$1, %edi
	jle	.L5
	movq	8(%rsi), %rdi
	movl	$1, %edx
	movl	$1, %esi
	call	*parse_file@GOTPCREL(%rip)
	movl	$0, %eax
.L1:
	addq	$8, %rsp
	ret
.L5:
	movq	(%rsi), %rcx
	leaq	.LC0(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$1, %eax
	jmp	.L1
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
