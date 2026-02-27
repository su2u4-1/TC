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
	je	.L13
	movq	%rdi, %rbp
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	0(%rbp), %rcx
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
	movq	8(%rbp), %rcx
	leaq	.LC2(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	cmpl	$5, 24(%rbp)
	ja	.L4
	movl	24(%rbp), %eax
	leaq	.L6(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L6:
	.long	.L11-.L6
	.long	.L10-.L6
	.long	.L9-.L6
	.long	.L8-.L6
	.long	.L7-.L6
	.long	.L5-.L6
	.text
.L13:
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
.L11:
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
.L10:
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
	movq	16(%rbp), %rdi
	movq	%r13, %rcx
	movq	%rbx, %rsi
	call	output_name
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
	movq	16(%rbp), %rdi
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
	movq	16(%rbp), %rdi
	movq	%r13, %rcx
	movq	%rbx, %rsi
	call	output_name
	jmp	.L1
.L7:
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
.L5:
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
	movq	16(%rbp), %rdi
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
	leaq	.LC11(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L1
	.size	output_name, .-output_name
	.section	.rodata.str1.1
.LC12:
	.string	"type: \"integer\"\n"
.LC13:
	.string	"value: %s\n"
.LC14:
	.string	"type: \"float\"\n"
.LC15:
	.string	"type: \"string\"\n"
.LC16:
	.string	"value: \"%s\"\n"
.LC17:
	.string	"type: \"boolean\"\n"
.LC18:
	.string	"value: \"true\"\n"
.LC19:
	.string	"value: \"false\"\n"
.LC20:
	.string	"type: \"expression\"\n"
.LC21:
	.string	"value\n"
.LC22:
	.string	"type: \"!\"\n"
.LC23:
	.string	"type: \"-\"\n"
.LC24:
	.string	"type: \"variable\"\n"
.LC25:
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
	ja	.L15
	movl	8(%rdi), %eax
	leaq	.L17(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L17:
	.long	.L25-.L17
	.long	.L24-.L17
	.long	.L23-.L17
	.long	.L22-.L17
	.long	.L21-.L17
	.long	.L20-.L17
	.long	.L19-.L17
	.long	.L18-.L17
	.long	.L16-.L17
	.text
.L25:
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC12(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	(%r12), %rcx
	leaq	.LC13(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L14:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L24:
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC14(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	(%r12), %rcx
	leaq	.LC13(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L14
.L23:
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	(%r12), %rcx
	leaq	.LC16(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L14
.L22:
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC17(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC18(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L14
.L21:
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC17(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC19(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L14
.L20:
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$19, %edx
	movl	$1, %esi
	leaq	.LC20(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC21(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%rbp), %rdx
	movq	(%r12), %rdi
	movq	%r13, %rcx
	movq	%rbx, %rsi
	call	output_expression
	jmp	.L14
.L19:
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC22(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC21(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%rbp), %rdx
	movq	(%r12), %rdi
	movq	%r13, %rcx
	movq	%rbx, %rsi
	call	output_primary
	jmp	.L14
.L18:
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
	leaq	.LC21(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%rbp), %rdx
	movq	(%r12), %rdi
	movq	%r13, %rcx
	movq	%rbx, %rsi
	call	output_primary
	jmp	.L14
.L16:
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$17, %edx
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
	leaq	.LC21(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%rbp), %rdx
	movq	(%r12), %rdi
	movq	%r13, %rcx
	movq	%rbx, %rsi
	call	output_variable_access
	jmp	.L14
.L15:
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movl	8(%r12), %ecx
	leaq	.LC25(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L14
	.size	output_primary, .-output_primary
	.section	.rodata.str1.1
.LC26:
	.string	"UNKNOWN_OPERATOR"
.LC27:
	.string	"primary\n"
.LC28:
	.string	"operator: \"%s\"\n"
.LC29:
	.string	"left\n"
.LC30:
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
	je	.L34
	call	*operator_to_string@GOTPCREL(%rip)
	movq	%rax, %r14
	movq	%r12, %rcx
	movl	$0, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	testq	%r14, %r14
	leaq	.LC26(%rip), %rax
	cmove	%rax, %r14
	movq	%r14, %rcx
	leaq	.LC28(%rip), %rdx
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
	leaq	.LC29(%rip), %rdi
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
	leaq	.LC30(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	16(%r13), %rdi
	movq	%r12, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_expression
.L28:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L34:
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$8, %edx
	movl	$1, %esi
	leaq	.LC27(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%rbp), %rdx
	movq	8(%r13), %rdi
	movq	%r12, %rcx
	movq	%rbx, %rsi
	call	output_primary
	jmp	.L28
	.size	output_expression, .-output_expression
	.section	.rodata.str1.1
.LC31:
	.string	"name\n"
.LC32:
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
	leaq	.LC31(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	8(%r13), %rdi
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_name
	cmpq	$0, 16(%r13)
	je	.L36
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC21(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	16(%r13), %rdi
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_expression
.L35:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L36:
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC32(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L35
	.size	output_variable, .-output_variable
	.section	.rodata.str1.1
.LC33:
	.string	"type: \"name\"\n"
.LC34:
	.string	"type: \"function_call\"\n"
.LC35:
	.string	"function\n"
.LC36:
	.string	"arguments\n"
.LC37:
	.string	"arguments[%d]\n"
.LC38:
	.string	"type: \"get sequence_element\"\n"
.LC39:
	.string	"sequence\n"
.LC40:
	.string	"index\n"
.LC41:
	.string	"type: \"get_attribute\"\n"
.LC42:
	.string	"object\n"
.LC43:
	.string	"attribute_name\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC44:
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
	je	.L40
	ja	.L41
	testl	%eax, %eax
	je	.L52
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
	leaq	.LC34(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC35(%rip), %rdi
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
	leaq	.LC36(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$-1, %r14d
	jmp	.L47
.L41:
	cmpl	$3, %eax
	jne	.L53
	movl	$0, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$29, %edx
	movl	$1, %esi
	leaq	.LC38(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC39(%rip), %rdi
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
	leaq	.LC40(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	8(%r12), %rdi
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_expression
	jmp	.L39
.L52:
	movl	$0, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$13, %edx
	movl	$1, %esi
	leaq	.LC33(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC31(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%r13), %rdx
	movq	8(%r12), %rdi
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	call	output_name
.L39:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L48:
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	addl	$1, %r14d
	movl	%r14d, %ecx
	leaq	.LC37(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	leaq	2(%r13), %rdx
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	output_expression
.L47:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L48
	jmp	.L39
.L40:
	movl	$0, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$22, %edx
	movl	$1, %esi
	leaq	.LC41(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC42(%rip), %rdi
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
	leaq	.LC43(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	8(%r12), %rdi
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_name
	jmp	.L39
.L53:
	movl	$1, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movl	16(%r12), %ecx
	leaq	.LC44(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L39
	.size	output_variable_access, .-output_variable_access
	.section	.rodata.str1.1
.LC45:
	.string	"if_statement\n"
.LC46:
	.string	"condition\n"
.LC47:
	.string	"body\n"
.LC48:
	.string	"else_if\n"
.LC49:
	.string	"else_body\n"
.LC50:
	.string	"for_statement\n"
.LC51:
	.string	"initializer\n"
.LC52:
	.string	"initializer: \"NULL\"\n"
.LC53:
	.string	"condition: \"NULL\"\n"
.LC54:
	.string	"increment\n"
.LC55:
	.string	"increment: \"NULL\"\n"
.LC56:
	.string	"while_statement\n"
	.section	.rodata.str1.8
	.align 8
.LC57:
	.string	"variable_declaration_statement\n"
	.section	.rodata.str1.1
.LC58:
	.string	"return_statement: \"NULL\"\n"
.LC59:
	.string	"return_statement\n"
.LC60:
	.string	"break_statement: \"NULL\"\n"
.LC61:
	.string	"continue_statement: \"NULL\"\n"
.LC62:
	.string	"expression_statement: \"NULL\"\n"
.LC63:
	.string	"expression_statement\n"
.LC64:
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
	ja	.L55
	movl	8(%rdi), %eax
	leaq	.L57(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L57:
	.long	.L64-.L57
	.long	.L63-.L57
	.long	.L62-.L57
	.long	.L61-.L57
	.long	.L60-.L57
	.long	.L59-.L57
	.long	.L58-.L57
	.long	.L56-.L57
	.text
.L62:
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$13, %edx
	movl	$1, %esi
	leaq	.LC45(%rip), %rdi
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
	leaq	.LC46(%rip), %rdi
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
	leaq	.LC47(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L65:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L87
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_statement
	jmp	.L65
.L87:
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	24(%rsp), %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$8, %edx
	movl	$1, %esi
	leaq	.LC48(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	3(%r12), %r13
.L67:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L88
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
	leaq	.LC46(%rip), %rdi
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
	leaq	.LC47(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L68:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L67
	movq	%rbp, %rcx
	movq	%r13, %rdx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	output_statement
	jmp	.L68
.L88:
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	24(%rsp), %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC49(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L71:
	movq	16(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L54
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_statement
	jmp	.L71
.L60:
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC50(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%r12), %r14
	movq	0(%r13), %r15
	movq	24(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r13
	cmpq	$0, (%r15)
	je	.L74
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC51(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	2(%r12), %rdx
	movq	(%r15), %rdi
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	call	output_variable
.L75:
	cmpq	$0, 8(%r15)
	je	.L76
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC46(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	2(%r12), %rdx
	movq	8(%r15), %rdi
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	call	output_expression
.L77:
	cmpq	$0, 16(%r15)
	je	.L78
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC54(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	2(%r12), %rdx
	movq	16(%r15), %rdi
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	call	output_expression
.L79:
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC47(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	addq	$2, %r12
.L80:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L54
	movq	%rbp, %rcx
	movq	%r12, %rdx
	movq	%rbx, %rsi
	call	output_statement
	jmp	.L80
.L74:
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	.LC52(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L75
.L76:
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$18, %edx
	movl	$1, %esi
	leaq	.LC53(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L77
.L78:
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$18, %edx
	movl	$1, %esi
	leaq	.LC55(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L79
.L61:
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC56(%rip), %rdi
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
	leaq	.LC46(%rip), %rdi
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
	leaq	.LC47(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L82:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L54
	movq	%rbp, %rcx
	movq	%r12, %rdx
	movq	%rbx, %rsi
	call	output_statement
	jmp	.L82
.L63:
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC57(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%r12), %rdx
	movq	0(%r13), %rdi
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	call	output_variable
.L54:
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L59:
	cmpq	$0, (%rdi)
	je	.L89
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC59(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%r12), %rdx
	movq	0(%r13), %rdi
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	call	output_expression
	jmp	.L54
.L89:
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$25, %edx
	movl	$1, %esi
	leaq	.LC58(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L54
.L58:
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$24, %edx
	movl	$1, %esi
	leaq	.LC60(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L54
.L56:
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$27, %edx
	movl	$1, %esi
	leaq	.LC61(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L54
.L64:
	cmpq	$0, (%rdi)
	je	.L90
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	.LC63(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	1(%r12), %rdx
	movq	0(%r13), %rdi
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	call	output_expression
	jmp	.L54
.L90:
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$29, %edx
	movl	$1, %esi
	leaq	.LC62(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L54
.L55:
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movl	8(%r13), %ecx
	leaq	.LC64(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L54
	.size	output_statement, .-output_statement
	.section	.rodata.str1.1
.LC65:
	.string	"NULL"
.LC66:
	.string	"import\n"
.LC67:
	.string	"source: \"%s\"\n"
.LC68:
	.string	"parameters\n"
.LC69:
	.string	"parameters[%d]\n"
.LC70:
	.string	"class\n"
.LC71:
	.string	"members\n"
.LC72:
	.string	"method\n"
.LC73:
	.string	"variable\n"
.LC74:
	.string	"unknown_ClassMemberType: %u\n"
.LC75:
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
	jmp	.L92
.L93:
	movq	%r14, %rcx
	movl	$0, %edx
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC35(%rip), %rdi
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
	leaq	.LC31(%rip), %rdi
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
	leaq	.LC68(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	16(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, (%rsp)
	movq	24(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movl	$-1, %ebp
	movq	%rax, 16(%rsp)
.L98:
	movq	(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L115
	movq	%r14, %rcx
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	addl	$1, %ebp
	movl	%ebp, %ecx
	leaq	.LC69(%rip), %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	leaq	4(%r13), %rdx
	movq	%r14, %rcx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	output_variable
	jmp	.L98
.L115:
	movq	16(%rsp), %rbx
	movq	%r14, %rcx
	movl	$1, %edx
	movq	8(%rsp), %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC47(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L100:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L92
	movq	%r14, %rcx
	movq	%r12, %rdx
	movq	%r15, %rsi
	call	output_statement
	jmp	.L100
.L94:
	movq	%r14, %rcx
	movl	$0, %edx
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC70(%rip), %rdi
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
	leaq	.LC31(%rip), %rdi
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
	leaq	.LC71(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	8(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	jmp	.L102
.L103:
	movq	%r14, %rcx
	movl	$0, %edx
	movq	16(%rsp), %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC72(%rip), %rdi
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
	leaq	.LC31(%rip), %rdi
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
	leaq	.LC68(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	16(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, (%rsp)
	movq	24(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movl	$-1, %ebp
	movq	%rax, 32(%rsp)
	jmp	.L106
.L107:
	movq	%r14, %rcx
	movl	$0, %edx
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	addl	$1, %ebp
	movl	%ebp, %ecx
	leaq	.LC69(%rip), %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	leaq	6(%r13), %rdx
	movq	%r14, %rcx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	output_variable
.L106:
	movq	(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L107
	movq	32(%rsp), %rbx
	movq	%r14, %rcx
	movl	$1, %edx
	movq	24(%rsp), %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC47(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L108
.L109:
	movq	%r14, %rcx
	movq	%r12, %rdx
	movq	%r15, %rsi
	call	output_statement
.L108:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L109
.L102:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L92
	movl	8(%rbx), %eax
	testl	%eax, %eax
	je	.L103
	cmpl	$1, %eax
	je	.L104
	movq	%r14, %rcx
	movl	$0, %edx
	movq	16(%rsp), %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movl	8(%rbx), %ecx
	leaq	.LC74(%rip), %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L102
.L104:
	movq	%r14, %rcx
	movl	$0, %edx
	movq	16(%rsp), %rsi
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC73(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	4(%r13), %rdx
	movq	(%rbx), %rdi
	movq	%r14, %rcx
	movq	%r15, %rsi
	call	output_variable
	jmp	.L102
.L95:
	movq	%r14, %rcx
	movl	$0, %edx
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movl	8(%rbx), %ecx
	leaq	.LC75(%rip), %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L92:
	movq	40(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L116
	leaq	1(%r13), %rsi
	movl	8(%rbx), %eax
	cmpl	$1, %eax
	je	.L93
	cmpl	$2, %eax
	je	.L94
	testl	%eax, %eax
	jne	.L95
	movq	%r14, %rcx
	movl	$0, %edx
	movq	%r15, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC66(%rip), %rdi
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
	leaq	.LC31(%rip), %rdi
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
	leaq	.LC65(%rip), %rax
	cmove	%rax, %rcx
	leaq	.LC67(%rip), %rdx
	movl	$2, %esi
	movq	%r15, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L92
.L116:
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
