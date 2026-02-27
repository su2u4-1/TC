	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Usage: %s <filename>\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB65:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	cmpl	$1, %edi
	jle	.L5
	movq	8(%rsi), %rdi
	movl	$1, %edx
	movl	$1, %esi
	call	parse_file@PLT
	movl	$0, %eax
.L1:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	movq	(%rsi), %rcx
	leaq	.LC0(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	movl	$1, %eax
	jmp	.L1
	.cfi_endproc
.LFE65:
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
