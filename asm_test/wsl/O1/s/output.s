	.file	"output.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Name: \"NULL\"\n"
.LC1:
	.string	"name: \"%s\"\n"
.LC2:
	.string	"id: %zu\n"
.LC3:
	.string	"kind: \"type\"\n"
.LC4:
	.string	"kind: \"variable\"\n"
.LC5:
	.string	"type\n"
.LC6:
	.string	"kind: \"function\"\n"
.LC7:
	.string	"return_type\n"
.LC8:
	.string	"kind: \"method\"\n"
.LC9:
	.string	"kind: \"class\"\n"
.LC10:
	.string	"kind: \"attribute\"\n"
.LC11:
	.string	"kind: \"parameter\"\n"
.LC12:
	.string	"kind: \"unknown_NameType\"\n"
	.text
	.type	output_name, @function
output_name:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rsi, %rbx
	movq	%rdx, %r12
	movq	%rcx, %r13
	testq	%rdi, %rdi
	je	.L14
	movq	%rdi, %rbp
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	8(%rbp), %rcx
	leaq	.LC1(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	16(%rbp), %rcx
	leaq	.LC2(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	cmpl	$6, 32(%rbp)
	ja	.L4
	movl	32(%rbp), %eax
	leaq	.L6(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L6:
	.long	.L12-.L6
	.long	.L11-.L6
	.long	.L10-.L6
	.long	.L9-.L6
	.long	.L8-.L6
	.long	.L7-.L6
	.long	.L5-.L6
	.text
.L14:
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$13, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L1:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L5:
	movq	%r13, %rcx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$13, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L1
.L9:
	movq	%r13, %rcx
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%r12), %rdx
	movq	0(%rbp), %rdi
	movq	%r13, %rcx
	movq	%rbx, %rsi
	call	output_name
	jmp	.L1
.L11:
	movq	%r13, %rcx
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%r12), %rdx
	movq	0(%rbp), %rdi
	movq	%r13, %rcx
	movq	%rbx, %rsi
	call	output_name
	jmp	.L1
.L10:
	movq	%r13, %rcx
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%r12), %rdx
	movq	0(%rbp), %rdi
	movq	%r13, %rcx
	movq	%rbx, %rsi
	call	output_name
	jmp	.L1
.L12:
	movq	%r13, %rcx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC9(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L1
.L7:
	movq	%r13, %rcx
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$18, %edx
	movl	$1, %esi
	leaq	.LC10(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%r12), %rdx
	movq	0(%rbp), %rdi
	movq	%r13, %rcx
	movq	%rbx, %rsi
	call	output_name
	jmp	.L1
.L8:
	movq	%r13, %rcx
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$18, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%r12), %rdx
	movq	0(%rbp), %rdi
	movq	%r13, %rcx
	movq	%rbx, %rsi
	call	output_name
	jmp	.L1
.L4:
	movq	%r13, %rcx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$25, %edx
	movl	$1, %esi
	leaq	.LC12(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L1
	.size	output_name, .-output_name
	.section	.rodata.str1.1
.LC13:
	.string	"type: \"integer\"\n"
.LC14:
	.string	"value: %s\n"
.LC15:
	.string	"type: \"float\"\n"
.LC16:
	.string	"type: \"string\"\n"
.LC17:
	.string	"value: \"%s\"\n"
.LC18:
	.string	"type: \"boolean\"\n"
.LC19:
	.string	"value: \"true\"\n"
.LC20:
	.string	"value: \"false\"\n"
.LC21:
	.string	"type: \"expression\"\n"
.LC22:
	.string	"value\n"
.LC23:
	.string	"type: \"!\"\n"
.LC24:
	.string	"type: \"-\"\n"
.LC25:
	.string	"type: \"variable\"\n"
.LC26:
	.string	"unknown_PrimaryType: %u\n"
	.text
	.type	output_primary, @function
output_primary:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %r12
	movq	%rsi, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %r13
	cmpl	$8, 8(%rdi)
	ja	.L16
	movl	8(%rdi), %eax
	leaq	.L18(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L18:
	.long	.L26-.L18
	.long	.L25-.L18
	.long	.L24-.L18
	.long	.L23-.L18
	.long	.L22-.L18
	.long	.L21-.L18
	.long	.L20-.L18
	.long	.L19-.L18
	.long	.L17-.L18
	.text
.L26:
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC13(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	(%r12), %rcx
	leaq	.LC14(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L15:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L25:
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	(%r12), %rcx
	leaq	.LC14(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L15
.L24:
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	(%r12), %rcx
	leaq	.LC17(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L15
.L23:
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC18(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC19(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L15
.L22:
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC18(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC20(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L15
.L21:
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$19, %edx
	movl	$1, %esi
	leaq	.LC21(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC22(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%rbp), %rdx
	movq	(%r12), %rdi
	movq	%r13, %rcx
	movq	%rbx, %rsi
	call	output_expression
	jmp	.L15
.L20:
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC23(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC22(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%rbp), %rdx
	movq	(%r12), %rdi
	movq	%r13, %rcx
	movq	%rbx, %rsi
	call	output_primary
	jmp	.L15
.L19:
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC24(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC22(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%rbp), %rdx
	movq	(%r12), %rdi
	movq	%r13, %rcx
	movq	%rbx, %rsi
	call	output_primary
	jmp	.L15
.L17:
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC25(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC22(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%rbp), %rdx
	movq	(%r12), %rdi
	movq	%r13, %rcx
	movq	%rbx, %rsi
	call	output_variable_access
	jmp	.L15
.L16:
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movl	8(%r12), %ecx
	leaq	.LC26(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L15
	.size	output_primary, .-output_primary
	.section	.rodata.str1.1
.LC27:
	.string	"UNKNOWN_OPERATOR"
.LC28:
	.string	"primary\n"
.LC29:
	.string	"operator: \"%s\"\n"
.LC30:
	.string	"left\n"
.LC31:
	.string	"right\n"
	.text
	.type	output_expression, @function
output_expression:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %r13
	movq	%rsi, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %r12
	movl	24(%rdi), %edi
	cmpl	$19, %edi
	je	.L35
	call	*operator_to_string@GOTPCREL(%rip)
	movq	%rax, %r14
	movq	%r12, %rcx
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	testq	%r14, %r14
	leaq	.LC27(%rip), %rax
	cmove	%rax, %r14
	movq	%r14, %rcx
	leaq	.LC29(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	%r12, %rcx
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC30(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%rbp), %r14
	movq	0(%r13), %rdi
	movq	%r12, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_expression
	movq	%r12, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC31(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	16(%r13), %rdi
	movq	%r12, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_expression
.L29:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L35:
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$8, %edx
	movl	$1, %esi
	leaq	.LC28(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%rbp), %rdx
	movq	8(%r13), %rdi
	movq	%r12, %rcx
	movq	%rbx, %rsi
	call	output_primary
	jmp	.L29
	.size	output_expression, .-output_expression
	.section	.rodata.str1.1
.LC32:
	.string	"name\n"
.LC33:
	.string	"value: \"NULL\"\n"
	.text
	.type	output_variable, @function
output_variable:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %r13
	movq	%rsi, %rbx
	movq	%rdx, %r12
	movq	%rcx, %rbp
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%r12), %r14
	movq	0(%r13), %rdi
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_name
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC32(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	8(%r13), %rdi
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_name
	cmpq	$0, 16(%r13)
	je	.L37
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC22(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	16(%r13), %rdi
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_expression
.L36:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L37:
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC33(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L36
	.size	output_variable, .-output_variable
	.section	.rodata.str1.1
.LC34:
	.string	"type: \"name\"\n"
.LC35:
	.string	"type: \"function_call\"\n"
.LC36:
	.string	"function\n"
.LC37:
	.string	"arguments\n"
.LC38:
	.string	"arguments[%d]\n"
.LC39:
	.string	"type: \"get sequence_element\"\n"
.LC40:
	.string	"sequence\n"
.LC41:
	.string	"index\n"
.LC42:
	.string	"type: \"get_attribute\"\n"
.LC43:
	.string	"object\n"
.LC44:
	.string	"attribute_name\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC45:
	.string	"unknown_VariableAccessType: %u\n"
	.text
	.type	output_variable_access, @function
output_variable_access:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$24, %rsp
	movq	%rdi, %r12
	movq	%rsi, %rbx
	movq	%rdx, %r13
	movq	%rcx, %rbp
	movl	16(%rdi), %eax
	cmpl	$2, %eax
	je	.L41
	ja	.L42
	testl	%eax, %eax
	je	.L53
	movq	8(%rdi), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$22, %edx
	movl	$1, %esi
	leaq	.LC35(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC36(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%r13), %r15
	movq	(%r12), %rdi
	movq	%rbp, %rcx
	movq	%r15, %rdx
	movq	%rbx, %rsi
	call	output_variable_access
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC37(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$-1, %r14d
	jmp	.L48
.L42:
	cmpl	$3, %eax
	jne	.L54
	movl	$0, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$29, %edx
	movl	$1, %esi
	leaq	.LC39(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC40(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%r13), %r14
	movq	(%r12), %rdi
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_variable_access
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC41(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	8(%r12), %rdi
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_expression
	jmp	.L40
.L53:
	movl	$0, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$13, %edx
	movl	$1, %esi
	leaq	.LC34(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC32(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%r13), %rdx
	movq	8(%r12), %rdi
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	call	output_name
.L40:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L49:
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	addl	$1, %r14d
	movl	%r14d, %ecx
	leaq	.LC38(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	leaq	2(%r13), %rdx
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	output_expression
.L48:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L49
	jmp	.L40
.L41:
	movl	$0, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$22, %edx
	movl	$1, %esi
	leaq	.LC42(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC43(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%r13), %r14
	movq	(%r12), %rdi
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_variable_access
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC44(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	8(%r12), %rdi
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_name
	jmp	.L40
.L54:
	movl	$1, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movl	16(%r12), %ecx
	leaq	.LC45(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L40
	.size	output_variable_access, .-output_variable_access
	.section	.rodata.str1.1
.LC46:
	.string	"if_statement\n"
.LC47:
	.string	"condition\n"
.LC48:
	.string	"body\n"
.LC49:
	.string	"else_if\n"
.LC50:
	.string	"else_body\n"
.LC51:
	.string	"for_statement\n"
.LC52:
	.string	"initializer\n"
.LC53:
	.string	"initializer: \"NULL\"\n"
.LC54:
	.string	"condition: \"NULL\"\n"
.LC55:
	.string	"increment\n"
.LC56:
	.string	"increment: \"NULL\"\n"
.LC57:
	.string	"while_statement\n"
	.section	.rodata.str1.8
	.align 8
.LC58:
	.string	"variable_declaration_statement\n"
	.section	.rodata.str1.1
.LC59:
	.string	"return_statement: \"NULL\"\n"
.LC60:
	.string	"return_statement\n"
.LC61:
	.string	"break_statement: \"NULL\"\n"
.LC62:
	.string	"continue_statement: \"NULL\"\n"
.LC63:
	.string	"expression_statement: \"NULL\"\n"
.LC64:
	.string	"expression_statement\n"
.LC65:
	.string	"unknown_StatementType: %u\n"
	.text
	.type	output_statement, @function
output_statement:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$40, %rsp
	movq	%rdi, %r13
	movq	%rsi, %rbx
	movq	%rdx, %r12
	movq	%rcx, %rbp
	cmpl	$7, 8(%rdi)
	ja	.L56
	movl	8(%rdi), %eax
	leaq	.L58(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L58:
	.long	.L65-.L58
	.long	.L64-.L58
	.long	.L63-.L58
	.long	.L62-.L58
	.long	.L61-.L58
	.long	.L60-.L58
	.long	.L59-.L58
	.long	.L57-.L58
	.text
.L63:
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$13, %edx
	movl	$1, %esi
	leaq	.LC46(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%r12), %r14
	movq	0(%r13), %r15
	movq	8(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r13
	movq	16(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	movq	24(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 16(%rsp)
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%r14, 24(%rsp)
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC47(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	2(%r12), %r14
	movq	(%r15), %rdi
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_expression
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	24(%rsp), %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC48(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L66:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L88
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_statement
	jmp	.L66
.L88:
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	24(%rsp), %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$8, %edx
	movl	$1, %esi
	leaq	.LC49(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	3(%r12), %r13
.L68:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L89
	movq	8(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC47(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	(%r15), %rdi
	movq	%rbp, %rcx
	movq	%r13, %rdx
	movq	%rbx, %rsi
	call	output_expression
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC48(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L69:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L68
	movq	%rbp, %rcx
	movq	%r13, %rdx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	output_statement
	jmp	.L69
.L89:
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	24(%rsp), %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC50(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L72:
	movq	16(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L55
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_statement
	jmp	.L72
.L61:
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC51(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%r12), %r14
	movq	0(%r13), %r15
	movq	24(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r13
	cmpq	$0, (%r15)
	je	.L75
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC52(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	2(%r12), %rdx
	movq	(%r15), %rdi
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	call	output_variable
.L76:
	cmpq	$0, 8(%r15)
	je	.L77
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC47(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	2(%r12), %rdx
	movq	8(%r15), %rdi
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	call	output_expression
.L78:
	cmpq	$0, 16(%r15)
	je	.L79
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC55(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	2(%r12), %rdx
	movq	16(%r15), %rdi
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	call	output_expression
.L80:
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC48(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	addq	$2, %r12
.L81:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L55
	movq	%rbp, %rcx
	movq	%r12, %rdx
	movq	%rbx, %rsi
	call	output_statement
	jmp	.L81
.L75:
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	.LC53(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L76
.L77:
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$18, %edx
	movl	$1, %esi
	leaq	.LC54(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L78
.L79:
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$18, %edx
	movl	$1, %esi
	leaq	.LC56(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L80
.L62:
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC57(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%r12), %r14
	movq	0(%r13), %r15
	movq	8(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r13
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC47(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	addq	$2, %r12
	movq	(%r15), %rdi
	movq	%rbp, %rcx
	movq	%r12, %rdx
	movq	%rbx, %rsi
	call	output_expression
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC48(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L83:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L55
	movq	%rbp, %rcx
	movq	%r12, %rdx
	movq	%rbx, %rsi
	call	output_statement
	jmp	.L83
.L64:
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC58(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%r12), %rdx
	movq	0(%r13), %rdi
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	call	output_variable
.L55:
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L60:
	cmpq	$0, (%rdi)
	je	.L90
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC60(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%r12), %rdx
	movq	0(%r13), %rdi
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	call	output_expression
	jmp	.L55
.L90:
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$25, %edx
	movl	$1, %esi
	leaq	.LC59(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L55
.L59:
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$24, %edx
	movl	$1, %esi
	leaq	.LC61(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L55
.L57:
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$27, %edx
	movl	$1, %esi
	leaq	.LC62(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L55
.L65:
	cmpq	$0, (%rdi)
	je	.L91
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	.LC64(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%r12), %rdx
	movq	0(%r13), %rdi
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	call	output_expression
	jmp	.L55
.L91:
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$29, %edx
	movl	$1, %esi
	leaq	.LC63(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L55
.L56:
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movl	8(%r13), %ecx
	leaq	.LC65(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L55
	.size	output_statement, .-output_statement
	.section	.rodata.str1.1
.LC66:
	.string	"Var: \"NULL\"\n"
.LC67:
	.string	"NULL\t%s\n"
.LC68:
	.string	"%s\t%s(%s)\n"
.LC69:
	.string	"%s\t%s\n"
	.text
	.type	output_var, @function
output_var:
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rsi, %rbp
	movq	%rdx, %rsi
	testq	%rdi, %rdi
	je	.L98
	movq	%rdi, %rbx
	cmpq	$0, 16(%rdi)
	je	.L99
	cmpq	$0, (%rdi)
	je	.L96
	movq	%rbp, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%rbx), %rax
	movq	16(%rbx), %rdx
	movq	8(%rdx), %rcx
	movq	8(%rax), %r9
	movq	8(%rbx), %r8
	leaq	.LC68(%rip), %rdx
	movl	$2, %esi
	movq	%rbp, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L92:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.L98:
	movq	%rbp, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%rbp, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC66(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L92
.L99:
	movq	%rbp, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rbx), %rcx
	leaq	.LC67(%rip), %rdx
	movl	$2, %esi
	movq	%rbp, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L92
.L96:
	movq	%rbp, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	movq	8(%rbx), %r8
	leaq	.LC69(%rip), %rdx
	movl	$2, %esi
	movq	%rbp, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L92
	.size	output_var, .-output_var
	.section	.rodata.str1.1
.LC70:
	.string	"true"
.LC71:
	.string	"false"
.LC72:
	.string	"\"NULL\""
.LC73:
	.string	"%s(%s)"
.LC74:
	.string	"%lld"
.LC75:
	.string	"%f"
.LC76:
	.string	"\"%s\""
.LC77:
	.string	"void"
.LC78:
	.string	"NONE"
.LC79:
	.string	"unknown_ArgType: %u"
	.text
	.type	output_arg, @function
output_arg:
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rsi, %rbp
	testq	%rdi, %rdi
	je	.L119
	movq	%rdi, %rbx
	cmpl	$9, 16(%rdi)
	ja	.L103
	movl	16(%rdi), %eax
	leaq	.L105(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L105:
	.long	.L113-.L105
	.long	.L112-.L105
	.long	.L111-.L105
	.long	.L110-.L105
	.long	.L109-.L105
	.long	.L108-.L105
	.long	.L107-.L105
	.long	.L106-.L105
	.long	.L106-.L105
	.long	.L104-.L105
	.text
.L119:
	movl	$0, %esi
	movq	%rbp, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%rbp, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC72(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L100:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.L113:
	movq	(%rdi), %rax
	cmpq	$0, (%rax)
	je	.L114
	movl	$0, %esi
	movq	%rbp, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%rbx), %rax
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	movq	8(%rdx), %r8
	leaq	.LC73(%rip), %rdx
	movl	$2, %esi
	movq	%rbp, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L100
.L114:
	movl	$0, %esi
	movq	%rbp, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%rbx), %rax
	movq	8(%rax), %rdi
	movq	%rbp, %rsi
	call	*fputs@GOTPCREL(%rip)
	jmp	.L100
.L112:
	movl	$0, %esi
	movq	%rbp, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%rbx), %rcx
	leaq	.LC74(%rip), %rdx
	movl	$2, %esi
	movq	%rbp, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L100
.L111:
	movl	$0, %esi
	movq	%rbp, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movsd	(%rbx), %xmm0
	leaq	.LC75(%rip), %rdx
	movl	$2, %esi
	movq	%rbp, %rdi
	movl	$1, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L100
.L110:
	movl	$0, %esi
	movq	%rbp, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%rbx), %rcx
	leaq	.LC76(%rip), %rdx
	movl	$2, %esi
	movq	%rbp, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L100
.L109:
	movl	$0, %esi
	movq	%rbp, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	cmpb	$0, (%rbx)
	leaq	.LC71(%rip), %rdi
	leaq	.LC70(%rip), %rax
	cmovne	%rax, %rdi
	movq	%rbp, %rsi
	call	*fputs@GOTPCREL(%rip)
	jmp	.L100
.L108:
	movl	$0, %esi
	movq	%rbp, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%rbp, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC77(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L100
.L107:
	movl	$0, %esi
	movq	%rbp, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%rbx), %rax
	movq	8(%rax), %rdi
	movq	%rbp, %rsi
	call	*fputs@GOTPCREL(%rip)
	jmp	.L100
.L106:
	movq	(%rdi), %rax
	cmpq	$0, (%rax)
	je	.L116
	movl	$0, %esi
	movq	%rbp, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%rbx), %rax
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	movq	8(%rdx), %r8
	leaq	.LC73(%rip), %rdx
	movl	$2, %esi
	movq	%rbp, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L100
.L116:
	movl	$0, %esi
	movq	%rbp, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%rbx), %rax
	movq	8(%rax), %rdi
	movq	%rbp, %rsi
	call	*fputs@GOTPCREL(%rip)
	jmp	.L100
.L104:
	movl	$0, %esi
	movq	%rbp, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%rbp, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC78(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L100
.L103:
	movl	$0, %esi
	movq	%rbp, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movl	16(%rbx), %ecx
	leaq	.LC79(%rip), %rdx
	movl	$2, %esi
	movq	%rbp, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L100
	.size	output_arg, .-output_arg
	.section	.rodata.str1.1
.LC80:
	.string	"NULL"
.LC81:
	.string	"import\n"
.LC82:
	.string	"source: \"%s\"\n"
.LC83:
	.string	"parameters\n"
.LC84:
	.string	"parameters[%d]\n"
.LC85:
	.string	"class\n"
.LC86:
	.string	"members\n"
.LC87:
	.string	"method\n"
.LC88:
	.string	"variable\n"
.LC89:
	.string	"unknown_ClassMemberType: %u\n"
.LC90:
	.string	"unknown_CodeMemberType: %u\n"
	.text
	.globl	output_code
	.type	output_code, @function
output_code:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$56, %rsp
	movq	%rsi, %r14
	movq	%rdx, %r13
	movq	%rcx, %r15
	movq	(%rdi), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 40(%rsp)
	movq	%r15, %rax
	movq	%r14, %r15
	movq	%rax, %r14
	jmp	.L121
.L122:
	movq	%r14, %rcx
	movl	$0, %edx
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC36(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	2(%r13), %rbp
	movq	%rbp, 8(%rsp)
	movq	(%rbx), %rbx
	movq	%r14, %rcx
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC32(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	3(%r13), %r12
	movq	(%rbx), %rdi
	movq	%r14, %rcx
	movq	%r12, %rdx
	movq	%r15, %rsi
	call	output_name
	movq	%r14, %rcx
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	8(%rbx), %rdi
	movq	%r14, %rcx
	movq	%r12, %rdx
	movq	%r15, %rsi
	call	output_name
	movq	%r14, %rcx
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$11, %edx
	movl	$1, %esi
	leaq	.LC83(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	16(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, (%rsp)
	movq	24(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movl	$-1, %ebp
	movq	%rax, 16(%rsp)
.L127:
	movq	(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L144
	movq	%r14, %rcx
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	addl	$1, %ebp
	movl	%ebp, %ecx
	leaq	.LC84(%rip), %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	leaq	4(%r13), %rdx
	movq	%r14, %rcx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	output_variable
	jmp	.L127
.L144:
	movq	16(%rsp), %rbx
	movq	%r14, %rcx
	movl	$1, %edx
	movq	8(%rsp), %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC48(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L129:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L121
	movq	%r14, %rcx
	movq	%r12, %rdx
	movq	%r15, %rsi
	call	output_statement
	jmp	.L129
.L123:
	movq	%r14, %rcx
	movl	$0, %edx
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC85(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	2(%r13), %rbp
	movq	(%rbx), %rbx
	movq	%r14, %rcx
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC32(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	3(%r13), %rax
	movq	%rax, 16(%rsp)
	movq	(%rbx), %rdi
	movq	%r14, %rcx
	movq	%rax, %rdx
	movq	%r15, %rsi
	call	output_name
	movq	%r14, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$8, %edx
	movl	$1, %esi
	leaq	.LC86(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	8(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	jmp	.L131
.L132:
	movq	%r14, %rcx
	movl	$0, %edx
	movq	16(%rsp), %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC87(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	4(%r13), %rbp
	movq	%rbp, 24(%rsp)
	movq	(%rbx), %rbx
	movq	%r14, %rcx
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC32(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	5(%r13), %r12
	movq	(%rbx), %rdi
	movq	%r14, %rcx
	movq	%r12, %rdx
	movq	%r15, %rsi
	call	output_name
	movq	%r14, %rcx
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	8(%rbx), %rdi
	movq	%r14, %rcx
	movq	%r12, %rdx
	movq	%r15, %rsi
	call	output_name
	movq	%r14, %rcx
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$11, %edx
	movl	$1, %esi
	leaq	.LC83(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	16(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, (%rsp)
	movq	24(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movl	$-1, %ebp
	movq	%rax, 32(%rsp)
	jmp	.L135
.L136:
	movq	%r14, %rcx
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	addl	$1, %ebp
	movl	%ebp, %ecx
	leaq	.LC84(%rip), %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	leaq	6(%r13), %rdx
	movq	%r14, %rcx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	output_variable
.L135:
	movq	(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L136
	movq	32(%rsp), %rbx
	movq	%r14, %rcx
	movl	$1, %edx
	movq	24(%rsp), %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC48(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L137
.L138:
	movq	%r14, %rcx
	movq	%r12, %rdx
	movq	%r15, %rsi
	call	output_statement
.L137:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L138
.L131:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L121
	movl	8(%rbx), %eax
	testl	%eax, %eax
	je	.L132
	cmpl	$1, %eax
	je	.L133
	movq	%r14, %rcx
	movl	$0, %edx
	movq	16(%rsp), %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movl	8(%rbx), %ecx
	leaq	.LC89(%rip), %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L131
.L133:
	movq	%r14, %rcx
	movl	$0, %edx
	movq	16(%rsp), %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC88(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	4(%r13), %rdx
	movq	(%rbx), %rdi
	movq	%r14, %rcx
	movq	%r15, %rsi
	call	output_variable
	jmp	.L131
.L124:
	movq	%r14, %rcx
	movl	$0, %edx
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movl	8(%rbx), %ecx
	leaq	.LC90(%rip), %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L121:
	movq	40(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L145
	leaq	1(%r13), %rsi
	movl	8(%rbx), %eax
	cmpl	$1, %eax
	je	.L122
	cmpl	$2, %eax
	je	.L123
	testl	%eax, %eax
	jne	.L124
	movq	%r14, %rcx
	movl	$0, %edx
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC81(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	2(%r13), %rbp
	movq	(%rbx), %rbx
	movq	%r14, %rcx
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC32(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	3(%r13), %rdx
	movq	(%rbx), %rdi
	movq	%r14, %rcx
	movq	%r15, %rsi
	call	output_name
	movq	%r14, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	8(%rbx), %rcx
	testq	%rcx, %rcx
	leaq	.LC80(%rip), %rax
	cmove	%rax, %rcx
	leaq	.LC82(%rip), %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L121
.L145:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	output_code, .-output_code
	.section	.rodata.str1.1
.LC91:
	.string	"TAC: \"NULL\"\n"
.LC92:
	.string	"TAC {\n"
.LC93:
	.string	"designs: []\n"
.LC94:
	.string	"designs: [\n"
.LC95:
	.string	"NULL "
.LC96:
	.string	"%s "
.LC97:
	.string	"%zu "
.LC98:
	.string	"{}\n"
.LC99:
	.string	"{\n"
.LC100:
	.string	"NULL\t"
.LC101:
	.string	"%s\t"
.LC102:
	.string	"%s(%s) "
.LC103:
	.string	"%zu\n"
.LC104:
	.string	"}\n"
.LC105:
	.string	"]\n"
.LC106:
	.string	"entry_point: \"NULL\"\n"
.LC107:
	.string	"entry_point: %s\n"
.LC108:
	.string	"global: []\n"
.LC109:
	.string	"global: [\n"
.LC110:
	.string	"subroutines: []\n"
.LC111:
	.string	"subroutines: [\n"
.LC112:
	.string	"NULL {\n"
.LC113:
	.string	"%s {\n"
.LC114:
	.string	"return_type: \"NULL\"\n"
.LC115:
	.string	"return_type: %s\n"
.LC116:
	.string	"parameters: []\n"
.LC117:
	.string	"parameters: [\n"
.LC118:
	.string	"local: []\n"
.LC119:
	.string	"local: [\n"
.LC120:
	.string	"instructions: []\n"
.LC121:
	.string	"instructions: [\n"
.LC122:
	.string	"add\t"
.LC123:
	.string	"sub\t"
.LC124:
	.string	"mul\t"
.LC125:
	.string	"div\t"
.LC126:
	.string	"mod\t"
.LC127:
	.string	"eq \t"
.LC128:
	.string	"ne \t"
.LC129:
	.string	"lt \t"
.LC130:
	.string	"gt \t"
.LC131:
	.string	"le \t"
.LC132:
	.string	"ge \t"
.LC133:
	.string	"and\t"
.LC134:
	.string	"or \t"
.LC135:
	.string	"not\t"
.LC136:
	.string	"assign\t"
.LC137:
	.string	"get_attr\t"
.LC138:
	.string	"get_elem\t"
.LC139:
	.string	"param\t"
.LC140:
	.string	"alloc\t"
.LC141:
	.string	"jmp_c\t"
.LC142:
	.string	"jmp\t"
.LC143:
	.string	"ret\t"
.LC144:
	.string	"call\t"
.LC145:
	.string	"load\t"
.LC146:
	.string	"store\t"
.LC147:
	.string	"INST_NONE\n"
.LC148:
	.string	"unknown_InstructionType: %u\n"
	.text
	.globl	output_TAC
	.type	output_TAC, @function
output_TAC:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$56, %rsp
	movq	%rdi, 16(%rsp)
	movq	%rsi, %r15
	movq	%rdx, %r14
	testq	%rdi, %rdi
	je	.L230
	movq	%rdx, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC92(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L149
	leaq	1(%r14), %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC93(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L150:
	movq	16(%rsp), %rax
	cmpq	$0, 8(%rax)
	je	.L231
	leaq	1(%r14), %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	16(%rsp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rcx
	leaq	.LC107(%rip), %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L165:
	movq	16(%rsp), %rax
	movq	16(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L166
	leaq	1(%r14), %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$11, %edx
	movl	$1, %esi
	leaq	.LC108(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L167:
	movq	16(%rsp), %rax
	movq	24(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L170
	leaq	1(%r14), %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC110(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L171
.L230:
	movq	%rdx, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC91(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L146
.L149:
	leaq	1(%r14), %r12
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$11, %edx
	movl	$1, %esi
	leaq	.LC94(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	16(%rsp), %rbx
	jmp	.L151
.L237:
	movq	%rax, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC95(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L153
.L154:
	movl	$0, %esi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC99(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	.LC101(%rip), %r13
	movq	%r12, 24(%rsp)
	jmp	.L156
.L233:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC100(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L158
.L234:
	movl	$0, %esi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC95(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L160
.L235:
	movl	$0, %esi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%r12), %rax
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	movq	8(%rdx), %r8
	leaq	.LC102(%rip), %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L160:
	movl	$0, %esi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	16(%r12), %rcx
	leaq	.LC103(%rip), %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L156:
	movq	0(%rbp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L232
	leaq	3(%r14), %rsi
	cmpq	$0, 8(%r12)
	je	.L233
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%r12), %rax
	movq	8(%rax), %rcx
	movq	%r13, %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L158:
	movq	(%r12), %rax
	testq	%rax, %rax
	je	.L234
	cmpq	$0, (%rax)
	jne	.L235
	movl	$0, %esi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%r12), %rax
	movq	8(%rax), %rcx
	leaq	.LC96(%rip), %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L160
.L232:
	movq	24(%rsp), %r12
	movq	8(%rsp), %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC104(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L151:
	movq	(%rbx), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L236
	leaq	2(%r14), %rax
	movq	%rax, 8(%rsp)
	cmpq	$0, 8(%rbp)
	je	.L237
	movq	8(%rsp), %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rbp), %rax
	movq	8(%rax), %rcx
	leaq	.LC96(%rip), %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L153:
	movl	$0, %esi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	16(%rbp), %rcx
	leaq	.LC97(%rip), %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	0(%rbp), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L154
	movl	$0, %esi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	.LC98(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L151
.L236:
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC105(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L150
.L231:
	leaq	1(%r14), %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	.LC106(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L165
.L166:
	leaq	1(%r14), %rbp
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC109(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	2(%r14), %rbx
	movq	16(%rsp), %r12
.L168:
	movq	16(%r12), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L238
	movq	%rbx, %rdx
	movq	%r15, %rsi
	call	output_var
	jmp	.L168
.L238:
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC105(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L167
.L170:
	leaq	1(%r14), %rbx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC111(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	.L195(%rip), %r13
	movq	%rbx, 40(%rsp)
	movq	%r14, %rbp
	jmp	.L172
.L245:
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC112(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L174
.L246:
	leaq	3(%rbp), %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	.LC114(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L176
.L177:
	leaq	3(%rbp), %r12
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC117(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	4(%rbp), %rbx
	movq	%r14, 24(%rsp)
	movq	8(%rsp), %r14
.L179:
	movq	16(%r14), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L239
	movq	%rbx, %rdx
	movq	%r15, %rsi
	call	output_var
	jmp	.L179
.L239:
	movq	24(%rsp), %r14
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC105(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L178
.L181:
	leaq	3(%rbp), %r12
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC119(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	4(%rbp), %rbx
	movq	%r14, 24(%rsp)
	movq	8(%rsp), %r14
.L183:
	movq	24(%r14), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L240
	movq	%rbx, %rdx
	movq	%r15, %rsi
	call	output_var
	jmp	.L183
.L240:
	movq	24(%rsp), %r14
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC105(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L182
.L185:
	leaq	3(%rbp), %rbx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC121(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r14, 24(%rsp)
	movq	%rbx, 32(%rsp)
	jmp	.L187
.L243:
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC95(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L189
.L190:
	movl	$0, %esi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC99(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L192
.L220:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC122(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L221:
	movq	(%rbx), %rdi
	movq	%r15, %rsi
	call	output_arg
	movl	24(%rbx), %ecx
	cmpl	$24, %ecx
	ja	.L192
	movl	$1, %eax
	salq	%cl, %rax
	testl	$4825087, %eax
	jne	.L223
	testl	$25583616, %eax
	jne	.L224
	testl	$3145728, %eax
	jne	.L225
	jmp	.L192
.L219:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC123(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
.L218:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC124(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
.L217:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC125(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
.L216:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC126(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
.L215:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC127(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
.L214:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC128(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
.L213:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC129(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
.L212:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC130(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
.L211:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC131(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
.L210:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC132(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
.L209:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC133(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
.L208:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC134(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
.L207:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC135(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
.L206:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC136(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
.L205:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC137(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
.L204:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC138(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
.L203:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC139(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
.L202:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC140(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
.L201:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC141(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
.L200:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC142(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
.L199:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC143(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
.L198:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC144(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
.L197:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC145(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
.L196:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC146(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
.L194:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC147(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L192
.L193:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movl	24(%rbx), %ecx
	leaq	.LC148(%rip), %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L192
.L223:
	movl	$0, %esi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rsi
	movl	$32, %edi
	call	*fputc@GOTPCREL(%rip)
	movq	8(%rbx), %rdi
	movq	%r15, %rsi
	call	output_arg
	movl	$0, %esi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rsi
	movl	$32, %edi
	call	*fputc@GOTPCREL(%rip)
	movq	16(%rbx), %rdi
	movq	%r15, %rsi
	call	output_arg
.L225:
	movl	$0, %esi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rsi
	movl	$10, %edi
	call	*fputc@GOTPCREL(%rip)
.L192:
	movq	8(%r14), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L241
	leaq	5(%rbp), %rsi
	cmpl	$25, 24(%rbx)
	ja	.L193
	movl	24(%rbx), %eax
	movslq	0(%r13,%rax,4), %rax
	addq	%r13, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L195:
	.long	.L220-.L195
	.long	.L219-.L195
	.long	.L218-.L195
	.long	.L217-.L195
	.long	.L216-.L195
	.long	.L215-.L195
	.long	.L214-.L195
	.long	.L213-.L195
	.long	.L212-.L195
	.long	.L211-.L195
	.long	.L210-.L195
	.long	.L209-.L195
	.long	.L208-.L195
	.long	.L207-.L195
	.long	.L206-.L195
	.long	.L205-.L195
	.long	.L204-.L195
	.long	.L203-.L195
	.long	.L202-.L195
	.long	.L201-.L195
	.long	.L200-.L195
	.long	.L199-.L195
	.long	.L198-.L195
	.long	.L197-.L195
	.long	.L196-.L195
	.long	.L194-.L195
	.text
.L224:
	movl	$0, %esi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rsi
	movl	$32, %edi
	call	*fputc@GOTPCREL(%rip)
	movq	8(%rbx), %rdi
	movq	%r15, %rsi
	call	output_arg
	jmp	.L225
.L241:
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC104(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L187:
	movq	8(%rsp), %rax
	movq	32(%rax), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L242
	leaq	4(%rbp), %r12
	cmpq	$0, (%r14)
	je	.L243
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%r14), %rax
	movq	8(%rax), %rcx
	leaq	.LC96(%rip), %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L189:
	movq	8(%r14), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L190
	movl	$0, %esi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	.LC98(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L187
.L242:
	movq	24(%rsp), %r14
	movq	32(%rsp), %rbx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC105(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L186:
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC104(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L172:
	movq	16(%rsp), %rax
	movq	24(%rax), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L244
	leaq	2(%rbp), %r14
	movq	8(%rsp), %rax
	cmpq	$0, (%rax)
	je	.L245
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rcx
	leaq	.LC113(%rip), %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L174:
	movq	8(%rsp), %rax
	cmpq	$0, 8(%rax)
	je	.L246
	leaq	3(%rbp), %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rcx
	leaq	.LC115(%rip), %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L176:
	movq	8(%rsp), %rax
	movq	16(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L177
	leaq	3(%rbp), %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC116(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L178:
	movq	8(%rsp), %rax
	movq	24(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L181
	leaq	3(%rbp), %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC118(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L182:
	movq	8(%rsp), %rax
	movq	32(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L185
	leaq	3(%rbp), %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC120(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L186
.L244:
	movq	40(%rsp), %rbx
	movq	%rbp, %r14
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC105(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L171:
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC104(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L146:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	output_TAC, .-output_TAC
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
