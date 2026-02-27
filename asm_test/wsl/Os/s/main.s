	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Usage: %s <filename>\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB50:
	.cfi_startproc
	endbr64
	decl	%edi
	pushq	%rcx
	.cfi_def_cfa_offset 16
	jg	.L2
	movq	(%rsi), %rcx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rdx
	call	__fprintf_chk@PLT
	movl	$1, %eax
	jmp	.L1
.L2:
	movq	8(%rsi), %rdi
	movl	$1, %edx
	movl	$1, %esi
	call	parse_file@PLT
	xorl	%eax, %eax
.L1:
	popq	%rdx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE50:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
