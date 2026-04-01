	.file	"output.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Name pointer: \"NULL\"\n"
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
	movl	$21, %edx
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
	.string	"NULL"
.LC67:
	.string	"import\n"
.LC68:
	.string	"source: \"%s\"\n"
.LC69:
	.string	"parameters\n"
.LC70:
	.string	"parameters[%d]\n"
.LC71:
	.string	"class\n"
.LC72:
	.string	"members\n"
.LC73:
	.string	"method\n"
.LC74:
	.string	"variable\n"
.LC75:
	.string	"unknown_ClassMemberType: %u\n"
.LC76:
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
	jmp	.L93
.L94:
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
	leaq	.LC69(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	16(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, (%rsp)
	movq	24(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movl	$-1, %ebp
	movq	%rax, 16(%rsp)
.L99:
	movq	(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L116
	movq	%r14, %rcx
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	addl	$1, %ebp
	movl	%ebp, %ecx
	leaq	.LC70(%rip), %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	leaq	4(%r13), %rdx
	movq	%r14, %rcx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	output_variable
	jmp	.L99
.L116:
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
.L101:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L93
	movq	%r14, %rcx
	movq	%r12, %rdx
	movq	%r15, %rsi
	call	output_statement
	jmp	.L101
.L95:
	movq	%r14, %rcx
	movl	$0, %edx
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC71(%rip), %rdi
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
	leaq	.LC72(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	8(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	jmp	.L103
.L104:
	movq	%r14, %rcx
	movl	$0, %edx
	movq	16(%rsp), %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC73(%rip), %rdi
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
	leaq	.LC69(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	16(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, (%rsp)
	movq	24(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movl	$-1, %ebp
	movq	%rax, 32(%rsp)
	jmp	.L107
.L108:
	movq	%r14, %rcx
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	addl	$1, %ebp
	movl	%ebp, %ecx
	leaq	.LC70(%rip), %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	leaq	6(%r13), %rdx
	movq	%r14, %rcx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	output_variable
.L107:
	movq	(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L108
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
	jmp	.L109
.L110:
	movq	%r14, %rcx
	movq	%r12, %rdx
	movq	%r15, %rsi
	call	output_statement
.L109:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L110
.L103:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L93
	movl	8(%rbx), %eax
	testl	%eax, %eax
	je	.L104
	cmpl	$1, %eax
	je	.L105
	movq	%r14, %rcx
	movl	$0, %edx
	movq	16(%rsp), %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movl	8(%rbx), %ecx
	leaq	.LC75(%rip), %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L103
.L105:
	movq	%r14, %rcx
	movl	$0, %edx
	movq	16(%rsp), %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC74(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	4(%r13), %rdx
	movq	(%rbx), %rdi
	movq	%r14, %rcx
	movq	%r15, %rsi
	call	output_variable
	jmp	.L103
.L96:
	movq	%r14, %rcx
	movl	$0, %edx
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movl	8(%rbx), %ecx
	leaq	.LC76(%rip), %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L93:
	movq	40(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L117
	leaq	1(%r13), %rsi
	movl	8(%rbx), %eax
	cmpl	$1, %eax
	je	.L94
	cmpl	$2, %eax
	je	.L95
	testl	%eax, %eax
	jne	.L96
	movq	%r14, %rcx
	movl	$0, %edx
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC67(%rip), %rdi
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
	leaq	.LC66(%rip), %rax
	cmove	%rax, %rcx
	leaq	.LC68(%rip), %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L93
.L117:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	output_code, .-output_code
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
