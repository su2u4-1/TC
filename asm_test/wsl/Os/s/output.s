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
	pushq	%r15
	leaq	.LC1(%rip), %r15
	pushq	%r14
	leaq	1(%rdx), %r14
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rbx
	movq	%rsi, %rbx
	pushq	%r8
.L2:
	leaq	-1(%r14), %r13
	movq	%rbp, %rcx
	testq	%r12, %r12
	jne	.L3
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC0(%rip), %rdi
	jmp	.L17
.L3:
	xorl	%edx, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	(%r12), %rcx
	movq	%r15, %rdx
	movq	%rbx, %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	%rbp, %rcx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	xorl	%eax, %eax
	movq	8(%r12), %rcx
	movq	%rbx, %rdi
	leaq	.LC2(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	cmpl	$5, 24(%r12)
	ja	.L4
	movl	24(%r12), %eax
	leaq	.L6(%rip), %rdx
	movq	%rbp, %rcx
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
.L11:
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC3(%rip), %rdi
	jmp	.L17
.L10:
	movq	%r13, %rsi
	movq	%rbx, %rdi
	xorl	%edx, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC4(%rip), %rdi
	jmp	.L16
.L9:
	movq	%r13, %rsi
	movq	%rbx, %rdi
	xorl	%edx, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC6(%rip), %rdi
	jmp	.L14
.L8:
	movq	%r13, %rsi
	movq	%rbx, %rdi
	xorl	%edx, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC8(%rip), %rdi
.L14:
	call	*fputs@GOTPCREL(%rip)
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC7(%rip), %rdi
.L15:
	call	*fputs@GOTPCREL(%rip)
	incq	%r14
	movq	16(%r12), %r12
	jmp	.L2
.L7:
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC9(%rip), %rdi
	jmp	.L17
.L5:
	movq	%r13, %rsi
	movq	%rbx, %rdi
	xorl	%edx, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC10(%rip), %rdi
.L16:
	call	*fputs@GOTPCREL(%rip)
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC5(%rip), %rdi
	jmp	.L15
.L4:
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC11(%rip), %rdi
.L17:
	popq	%rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*fputs@GOTPCREL(%rip)
	.size	output_name, .-output_name
	.section	.rodata.str1.1
.LC12:
	.string	"UNKNOWN_OPERATOR"
.LC13:
	.string	"primary\n"
.LC14:
	.string	"type: \"integer\"\n"
.LC15:
	.string	"value: %s\n"
.LC16:
	.string	"type: \"float\"\n"
.LC17:
	.string	"type: \"string\"\n"
.LC18:
	.string	"value: \"%s\"\n"
.LC19:
	.string	"type: \"boolean\"\n"
.LC20:
	.string	"value: \"true\"\n"
.LC21:
	.string	"value: \"false\"\n"
.LC22:
	.string	"type: \"expression\"\n"
.LC23:
	.string	"value\n"
.LC24:
	.string	"type: \"!\"\n"
.LC25:
	.string	"type: \"-\"\n"
.LC26:
	.string	"type: \"variable\"\n"
.LC27:
	.string	"unknown_PrimaryType: %u\n"
.LC28:
	.string	"operator: \"%s\"\n"
.LC29:
	.string	"left\n"
.LC30:
	.string	"right\n"
	.text
	.type	output_expression, @function
output_expression:
	pushq	%r15
	leaq	.LC12(%rip), %r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rdx, %r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$24, %rsp
	movq	%rsi, 8(%rsp)
.L36:
	movl	24(%rbp), %edi
	cmpl	$19, %edi
	jne	.L20
	movq	%r12, %rsi
	movq	8(%rsp), %rdi
	movq	%rbx, %rcx
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	addq	$2, %r12
	leaq	.LC13(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%rbp), %r13
	leaq	.L24(%rip), %r14
.L21:
	cmpl	$8, 8(%r13)
	leaq	-1(%r12), %rbp
	ja	.L22
	movl	8(%r13), %eax
	movq	8(%rsp), %rdi
	movq	%rbx, %rcx
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movslq	(%r14,%rax,4), %rax
	addq	%r14, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L24:
	.long	.L32-.L24
	.long	.L31-.L24
	.long	.L30-.L24
	.long	.L29-.L24
	.long	.L28-.L24
	.long	.L27-.L24
	.long	.L26-.L24
	.long	.L25-.L24
	.long	.L23-.L24
	.text
.L32:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC14(%rip), %rdi
	jmp	.L40
.L31:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC16(%rip), %rdi
.L40:
	call	*fputs@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	8(%rsp), %rdi
	call	*indention@GOTPCREL(%rip)
	movq	0(%r13), %rcx
	leaq	.LC15(%rip), %rdx
.L41:
	movq	8(%rsp), %rdi
	addq	$24, %rsp
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*__fprintf_chk@GOTPCREL(%rip)
.L30:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC17(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	8(%rsp), %rdi
	call	*indention@GOTPCREL(%rip)
	movq	0(%r13), %rcx
	leaq	.LC18(%rip), %rdx
	jmp	.L41
.L29:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC19(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movq	%rbp, %rsi
	movq	%rbx, %rcx
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC20(%rip), %rdi
	jmp	.L42
.L28:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC19(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movq	%rbp, %rsi
	movq	%rbx, %rcx
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC21(%rip), %rdi
.L42:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*fputs@GOTPCREL(%rip)
.L27:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC22(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	%rbp, %rsi
	movq	8(%rsp), %rdi
	movq	%rbx, %rcx
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC23(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	0(%r13), %rbp
	jmp	.L36
.L26:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC24(%rip), %rdi
	jmp	.L39
.L25:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC25(%rip), %rdi
.L39:
	call	*fputs@GOTPCREL(%rip)
	incq	%r12
	movq	8(%rsp), %rdi
	movq	%rbx, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC23(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	0(%r13), %r13
	jmp	.L21
.L23:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC26(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movq	8(%rsp), %rdi
	movq	%rbp, %rsi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC23(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	0(%r13), %rdi
	movq	%rbx, %rcx
	movq	%r12, %rdx
	movq	8(%rsp), %rsi
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	output_variable_access
.L22:
	movq	8(%rsp), %rdi
	movq	%rbx, %rcx
	movq	%rbp, %rsi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movl	8(%r13), %ecx
	movq	8(%rsp), %rdi
	xorl	%eax, %eax
	addq	$24, %rsp
	leaq	.LC27(%rip), %rdx
	movl	$2, %esi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*__fprintf_chk@GOTPCREL(%rip)
.L20:
	call	*operator_to_string@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	8(%rsp), %rdi
	movq	%rax, %r13
	movq	%rbx, %rcx
	call	*indention@GOTPCREL(%rip)
	testq	%r13, %r13
	movq	8(%rsp), %rdi
	leaq	.LC28(%rip), %rdx
	cmove	%r15, %r13
	movl	$2, %esi
	xorl	%eax, %eax
	movq	%r13, %rcx
	leaq	1(%r12), %r13
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	%rbx, %rcx
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	8(%rsp), %rdi
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC29(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	0(%rbp), %rdi
	movq	%rbx, %rcx
	movq	%r13, %rdx
	movq	8(%rsp), %rsi
	call	output_expression
	movq	%r12, %rsi
	movq	8(%rsp), %rdi
	movq	%rbx, %rcx
	movl	$1, %edx
	movq	%r13, %r12
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC30(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	16(%rbp), %rbp
	jmp	.L36
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
	movq	%rdi, %r13
	pushq	%r12
	movq	%rdx, %r12
	xorl	%edx, %edx
	pushq	%rbp
	leaq	1(%r12), %r14
	movq	%rcx, %rbp
	pushq	%rbx
	movq	%rsi, %rbx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC5(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	0(%r13), %rdi
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_name
	xorl	%edx, %edx
	movq	%rbp, %rcx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC31(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%r13), %rdi
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_name
	cmpq	$0, 16(%r13)
	movq	%rbp, %rcx
	movq	%r12, %rsi
	movl	$1, %edx
	movq	%rbx, %rdi
	je	.L44
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC23(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	16(%r13), %rdi
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	output_expression
.L44:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC32(%rip), %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	*fputs@GOTPCREL(%rip)
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
.LC44:
	.string	"unknown_VariableAccessType: %u\n"
	.text
	.type	output_variable_access, @function
output_variable_access:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	movq	%rdi, %r13
	pushq	%r12
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rbx
	subq	$24, %rsp
	movl	16(%rdi), %eax
	movq	%rsi, (%rsp)
	movq	%rcx, 8(%rsp)
	cmpl	$2, %eax
	je	.L47
	ja	.L48
	testl	%eax, %eax
	leaq	1(%rdx), %r14
	jne	.L56
	movq	8(%rsp), %rcx
	xorl	%edx, %edx
	movq	(%rsp), %rdi
	movq	%rbp, %rsi
	call	*indention@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC33(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%rsp), %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	(%rsp), %rdi
	call	*indention@GOTPCREL(%rip)
	leaq	.LC31(%rip), %rdi
	movq	(%rsp), %rsi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%r13), %rdi
	movq	8(%rsp), %rcx
	movq	%r14, %rdx
	jmp	.L60
.L48:
	cmpl	$3, %eax
	jne	.L61
	movq	8(%rsp), %rcx
	leaq	1(%rbp), %r12
	movq	(%rsp), %rdi
	xorl	%edx, %edx
	movq	%rbp, %rsi
	call	*indention@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC38(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%rsp), %rcx
	movq	(%rsp), %rdi
	xorl	%edx, %edx
	movq	%rbp, %rsi
	call	*indention@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC39(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	movq	0(%r13), %rdi
	movq	%r12, %rdx
	movq	8(%rsp), %rcx
	call	output_variable_access
	movq	8(%rsp), %rcx
	movq	(%rsp), %rdi
	movq	%rbp, %rsi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC40(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%r13), %rdi
	movq	(%rsp), %rsi
	movq	%r12, %rdx
	movq	8(%rsp), %rcx
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	output_expression
.L56:
	movq	8(%rdi), %rdi
	leaq	.LC37(%rip), %r15
	call	*list_copy@GOTPCREL(%rip)
	movq	8(%rsp), %rcx
	xorl	%edx, %edx
	movq	(%rsp), %rdi
	movq	%rax, %r12
	movq	%rbp, %rsi
	call	*indention@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC34(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%rsp), %rcx
	xorl	%edx, %edx
	movq	(%rsp), %rdi
	movq	%rbp, %rsi
	call	*indention@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC35(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	0(%r13), %rdi
	movq	(%rsp), %rsi
	movq	%r14, %rdx
	movq	8(%rsp), %rcx
	orl	$-1, %r13d
	call	output_variable_access
	movq	8(%rsp), %rcx
	movq	(%rsp), %rdi
	movq	%rbp, %rsi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC36(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L53:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L62
	incl	%r13d
	movq	8(%rsp), %rcx
	movq	(%rsp), %rdi
	xorl	%edx, %edx
	movq	%r14, %rsi
	call	*indention@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	%r13d, %ecx
	movq	%r15, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	2(%rbp), %rdx
	movq	%rbx, %rdi
	movq	8(%rsp), %rcx
	call	output_expression
	jmp	.L53
.L47:
	movq	8(%rsp), %rcx
	xorl	%edx, %edx
	movq	(%rsp), %rdi
	movq	%rbp, %rsi
	call	*indention@GOTPCREL(%rip)
	leaq	1(%rbp), %r12
	movq	(%rsp), %rsi
	leaq	.LC41(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%rsp), %rcx
	xorl	%edx, %edx
	movq	(%rsp), %rdi
	movq	%rbp, %rsi
	call	*indention@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC42(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	movq	0(%r13), %rdi
	movq	%r12, %rdx
	movq	8(%rsp), %rcx
	call	output_variable_access
	movq	8(%rsp), %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	(%rsp), %rdi
	call	*indention@GOTPCREL(%rip)
	leaq	.LC43(%rip), %rdi
	movq	(%rsp), %rsi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%r13), %rdi
	movq	8(%rsp), %rcx
	movq	%r12, %rdx
.L60:
	movq	(%rsp), %rsi
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	output_name
.L61:
	movq	8(%rsp), %rcx
	movq	(%rsp), %rdi
	movq	%rbp, %rsi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movl	16(%r13), %ecx
	movq	(%rsp), %rdi
	xorl	%eax, %eax
	addq	$24, %rsp
	leaq	.LC44(%rip), %rdx
	movl	$2, %esi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*__fprintf_chk@GOTPCREL(%rip)
.L62:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
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
.LC57:
	.string	"variable_declaration_statement\n"
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
	movq	%rdi, %r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$56, %rsp
	cmpl	$7, 8(%rdi)
	movq	%rsi, 8(%rsp)
	movq	%rcx, 16(%rsp)
	ja	.L64
	movl	8(%rdi), %eax
	leaq	.L66(%rip), %rdx
	movq	16(%rsp), %rcx
	movq	%rbx, %rsi
	movq	8(%rsp), %rdi
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	xorl	%edx, %edx
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L66:
	.long	.L73-.L66
	.long	.L72-.L66
	.long	.L71-.L66
	.long	.L70-.L66
	.long	.L69-.L66
	.long	.L68-.L66
	.long	.L67-.L66
	.long	.L65-.L66
	.text
.L71:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	1(%rbx), %rbp
	leaq	.LC45(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	(%r12), %r15
	leaq	.LC46(%rip), %r14
	movq	8(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	16(%r15), %rdi
	movq	%rax, %r13
	call	*list_copy@GOTPCREL(%rip)
	movq	24(%r15), %rdi
	movq	%rax, %r12
	call	*list_copy@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movq	%rax, 40(%rsp)
	movq	8(%rsp), %rdi
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movq	%r14, %rdi
	call	*fputs@GOTPCREL(%rip)
	leaq	2(%rbx), %rax
	movq	(%r15), %rdi
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rsi
	movq	%rax, %rdx
	movq	%rax, 24(%rsp)
	leaq	.LC47(%rip), %r15
	call	output_expression
	movq	8(%rsp), %rdi
	movq	%rbp, %rsi
	xorl	%edx, %edx
	movq	16(%rsp), %rcx
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movq	%r15, %rdi
	call	*fputs@GOTPCREL(%rip)
.L74:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L99
	movq	24(%rsp), %rdx
	movq	8(%rsp), %rsi
	call	output_statement
	jmp	.L74
.L99:
	movq	8(%rsp), %rdi
	xorl	%edx, %edx
	movq	%rbp, %rsi
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC48(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	leaq	3(%rbx), %rax
	movq	%rax, 32(%rsp)
.L76:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L100
	movq	8(%r13), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	xorl	%edx, %edx
	movq	24(%rsp), %rsi
	movq	8(%rsp), %rdi
	movq	%rax, %rbx
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movq	%r14, %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	movq	32(%rsp), %rdx
	movq	8(%rsp), %rsi
	movq	0(%r13), %rdi
	call	output_expression
	movq	24(%rsp), %rsi
	movq	8(%rsp), %rdi
	movl	$1, %edx
	movq	16(%rsp), %rcx
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movq	%r15, %rdi
	call	*fputs@GOTPCREL(%rip)
.L77:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L76
	movq	16(%rsp), %rcx
	movq	32(%rsp), %rdx
	movq	8(%rsp), %rsi
	call	output_statement
	jmp	.L77
.L100:
	movq	8(%rsp), %rdi
	movq	%rbp, %rsi
	movq	16(%rsp), %rcx
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC49(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L80:
	movq	40(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L63
	movq	16(%rsp), %rcx
	movq	24(%rsp), %rdx
	movq	8(%rsp), %rsi
	call	output_statement
	jmp	.L80
.L69:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC50(%rip), %rdi
	leaq	1(%rbx), %rbp
	call	*fputs@GOTPCREL(%rip)
	movq	(%r12), %r12
	movq	24(%r12), %rdi
	call	*list_copy@GOTPCREL(%rip)
	xorl	%edx, %edx
	cmpq	$0, (%r12)
	movq	%rbp, %rsi
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rdi
	movq	%rax, %r13
	je	.L83
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC51(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rsi
	leaq	2(%rbx), %rdx
	movq	(%r12), %rdi
	call	output_variable
	jmp	.L84
.L83:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC52(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L84:
	xorl	%edx, %edx
	cmpq	$0, 8(%r12)
	movq	16(%rsp), %rcx
	movq	%rbp, %rsi
	movq	8(%rsp), %rdi
	je	.L85
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC46(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%r12), %rdi
	movq	16(%rsp), %rcx
	leaq	2(%rbx), %rdx
	movq	8(%rsp), %rsi
	call	output_expression
	jmp	.L86
.L85:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC53(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L86:
	xorl	%edx, %edx
	cmpq	$0, 16(%r12)
	movq	16(%rsp), %rcx
	movq	%rbp, %rsi
	movq	8(%rsp), %rdi
	je	.L87
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC54(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	16(%r12), %rdi
	movq	16(%rsp), %rcx
	leaq	2(%rbx), %rdx
	movq	8(%rsp), %rsi
	call	output_expression
	jmp	.L88
.L87:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC55(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L88:
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rdi
	movl	$1, %edx
	movq	%rbp, %rsi
	call	*indention@GOTPCREL(%rip)
	addq	$2, %rbx
	movq	8(%rsp), %rsi
	leaq	.LC47(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L89:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L63
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rsi
	movq	%rbx, %rdx
	call	output_statement
	jmp	.L89
.L70:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC56(%rip), %rdi
	leaq	1(%rbx), %r13
	call	*fputs@GOTPCREL(%rip)
	movq	(%r12), %r12
	addq	$2, %rbx
	movq	8(%r12), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	xorl	%edx, %edx
	movq	%r13, %rsi
	movq	8(%rsp), %rdi
	movq	%rax, %rbp
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC46(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rsi
	movq	%rbx, %rdx
	movq	(%r12), %rdi
	call	output_expression
	movq	8(%rsp), %rdi
	movq	%r13, %rsi
	movq	16(%rsp), %rcx
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC47(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L92:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L63
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rsi
	movq	%rbx, %rdx
	call	output_statement
	jmp	.L92
.L72:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC57(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	(%r12), %rdi
	movq	16(%rsp), %rcx
	leaq	1(%rbx), %rdx
	movq	8(%rsp), %rsi
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	output_variable
.L68:
	cmpq	$0, (%r12)
	jne	.L94
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC58(%rip), %rdi
	jmp	.L97
.L94:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC59(%rip), %rdi
	jmp	.L98
.L67:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC60(%rip), %rdi
.L97:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*fputs@GOTPCREL(%rip)
.L65:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC61(%rip), %rdi
	jmp	.L97
.L73:
	cmpq	$0, (%r12)
	jne	.L95
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC62(%rip), %rdi
	jmp	.L97
.L95:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC63(%rip), %rdi
.L98:
	call	*fputs@GOTPCREL(%rip)
	movq	(%r12), %rdi
	movq	16(%rsp), %rcx
	leaq	1(%rbx), %rdx
	movq	8(%rsp), %rsi
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	output_expression
.L64:
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rdi
	movq	%rbx, %rsi
	xorl	%edx, %edx
	call	*indention@GOTPCREL(%rip)
	movl	8(%r12), %ecx
	movq	8(%rsp), %rdi
	addq	$56, %rsp
	popq	%rbx
	leaq	.LC64(%rip), %rdx
	popq	%rbp
	movl	$2, %esi
	popq	%r12
	xorl	%eax, %eax
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*__fprintf_chk@GOTPCREL(%rip)
.L63:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
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
	movq	%rdx, %rbx
	subq	$72, %rsp
	movq	(%rdi), %rdi
	movq	%rsi, 8(%rsp)
	movq	%rcx, 16(%rsp)
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 48(%rsp)
.L102:
	movq	48(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L126
	movl	8(%rbp), %eax
	movq	16(%rsp), %rcx
	leaq	1(%rbx), %rsi
	xorl	%edx, %edx
	movq	8(%rsp), %rdi
	cmpl	$1, %eax
	je	.L103
	cmpl	$2, %eax
	je	.L104
	testl	%eax, %eax
	jne	.L105
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC66(%rip), %rdi
	leaq	2(%rbx), %r12
	call	*fputs@GOTPCREL(%rip)
	movq	0(%rbp), %rbp
	movq	16(%rsp), %rcx
	xorl	%edx, %edx
	movq	8(%rsp), %rdi
	movq	%r12, %rsi
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC31(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rsi
	leaq	3(%rbx), %rdx
	movq	0(%rbp), %rdi
	call	output_name
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rdi
	movq	%r12, %rsi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	8(%rbp), %rcx
	testq	%rcx, %rcx
	jne	.L106
	leaq	.LC65(%rip), %rcx
.L106:
	movq	8(%rsp), %rdi
	leaq	.LC67(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L102
.L103:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	2(%rbx), %r12
	leaq	.LC35(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	0(%rbp), %r14
	movq	16(%rsp), %rcx
	xorl	%edx, %edx
	movq	8(%rsp), %rdi
	movq	%r12, %rsi
	leaq	.LC69(%rip), %r15
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC31(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	leaq	3(%rbx), %rax
	movq	(%r14), %rdi
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rsi
	movq	%rax, %rdx
	movq	%rax, 24(%rsp)
	call	output_name
	movq	16(%rsp), %rcx
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	8(%rsp), %rdi
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC7(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%r14), %rdi
	movq	16(%rsp), %rcx
	leaq	3(%rbx), %rdx
	movq	8(%rsp), %rsi
	call	output_name
	movq	16(%rsp), %rcx
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	8(%rsp), %rdi
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC68(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	16(%r14), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	24(%r14), %rdi
	orl	$-1, %r14d
	movq	%rax, %r13
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 32(%rsp)
.L108:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L127
	incl	%r14d
	movq	24(%rsp), %rsi
	movq	8(%rsp), %rdi
	xorl	%edx, %edx
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movl	%r14d, %ecx
	movq	%r15, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rsi
	movq	%rbp, %rdi
	leaq	4(%rbx), %rdx
	call	output_variable
	jmp	.L108
.L127:
	movq	8(%rsp), %rdi
	movq	%r12, %rsi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC47(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L110:
	movq	32(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L102
	movq	16(%rsp), %rcx
	movq	24(%rsp), %rdx
	movq	8(%rsp), %rsi
	call	output_statement
	jmp	.L110
.L104:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC70(%rip), %rdi
	leaq	2(%rbx), %r12
	call	*fputs@GOTPCREL(%rip)
	movq	0(%rbp), %rbp
	movq	16(%rsp), %rcx
	xorl	%edx, %edx
	movq	8(%rsp), %rdi
	movq	%r12, %rsi
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC31(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	leaq	3(%rbx), %rax
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rsi
	movq	0(%rbp), %rdi
	movq	%rax, %rdx
	movq	%rax, 24(%rsp)
	call	output_name
	movq	16(%rsp), %rcx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	8(%rsp), %rdi
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC71(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%rbp), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 56(%rsp)
.L112:
	movq	56(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L102
	movl	8(%r12), %eax
	testl	%eax, %eax
	je	.L113
	decl	%eax
	jne	.L128
	movq	16(%rsp), %rcx
	xorl	%edx, %edx
	movq	24(%rsp), %rsi
	movq	8(%rsp), %rdi
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC73(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rsi
	leaq	4(%rbx), %rdx
	movq	(%r12), %rdi
	call	output_variable
	jmp	.L112
.L113:
	movq	16(%rsp), %rcx
	xorl	%edx, %edx
	movq	24(%rsp), %rsi
	orl	$-1, %r14d
	movq	8(%rsp), %rdi
	leaq	.LC69(%rip), %r15
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC72(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	(%r12), %r12
	leaq	4(%rbx), %rax
	xorl	%edx, %edx
	movq	16(%rsp), %rcx
	movq	%rax, %rsi
	movq	%rax, 32(%rsp)
	movq	8(%rsp), %rdi
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC31(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	leaq	5(%rbx), %rax
	movq	(%r12), %rdi
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rsi
	movq	%rax, %rdx
	movq	%rax, 40(%rsp)
	call	output_name
	movq	16(%rsp), %rcx
	xorl	%edx, %edx
	movq	32(%rsp), %rsi
	movq	8(%rsp), %rdi
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC7(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%r12), %rdi
	movq	16(%rsp), %rcx
	leaq	5(%rbx), %rdx
	movq	8(%rsp), %rsi
	call	output_name
	movq	16(%rsp), %rcx
	xorl	%edx, %edx
	movq	32(%rsp), %rsi
	movq	8(%rsp), %rdi
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC68(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	16(%r12), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	24(%r12), %rdi
	movq	%rax, %r13
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
.L116:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L129
	incl	%r14d
	movq	40(%rsp), %rsi
	movq	8(%rsp), %rdi
	xorl	%edx, %edx
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movl	%r14d, %ecx
	movq	%r15, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rsi
	movq	%rbp, %rdi
	leaq	6(%rbx), %rdx
	call	output_variable
	jmp	.L116
.L129:
	movq	32(%rsp), %rsi
	movq	8(%rsp), %rdi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC47(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L118:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L112
	movq	16(%rsp), %rcx
	movq	40(%rsp), %rdx
	movq	8(%rsp), %rsi
	call	output_statement
	jmp	.L118
.L128:
	movq	16(%rsp), %rcx
	movq	24(%rsp), %rsi
	xorl	%edx, %edx
	movq	8(%rsp), %rdi
	call	*indention@GOTPCREL(%rip)
	movl	8(%r12), %ecx
	movq	8(%rsp), %rdi
	xorl	%eax, %eax
	leaq	.LC74(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L112
.L105:
	call	*indention@GOTPCREL(%rip)
	movl	8(%rbp), %ecx
	movq	8(%rsp), %rdi
	xorl	%eax, %eax
	leaq	.LC75(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L102
.L126:
	addq	$72, %rsp
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
