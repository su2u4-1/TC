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
	jmp	.L18
.L3:
	xorl	%edx, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	8(%r12), %rcx
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
	movq	16(%r12), %rcx
	movq	%rbx, %rdi
	leaq	.LC2(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	cmpl	$6, 32(%r12)
	ja	.L4
	movl	32(%r12), %eax
	leaq	.L6(%rip), %rdx
	movq	%rbp, %rcx
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
.L5:
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC3(%rip), %rdi
	jmp	.L18
.L9:
	movq	%r13, %rsi
	movq	%rbx, %rdi
	xorl	%edx, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC4(%rip), %rdi
	jmp	.L16
.L11:
	movq	%r13, %rsi
	movq	%rbx, %rdi
	xorl	%edx, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC6(%rip), %rdi
	jmp	.L17
.L10:
	movq	%r13, %rsi
	movq	%rbx, %rdi
	xorl	%edx, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC8(%rip), %rdi
.L17:
	call	*fputs@GOTPCREL(%rip)
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC7(%rip), %rdi
	jmp	.L15
.L12:
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC9(%rip), %rdi
	jmp	.L18
.L7:
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
.L15:
	call	*fputs@GOTPCREL(%rip)
	incq	%r14
	movq	(%r12), %r12
	jmp	.L2
.L8:
	movq	%r13, %rsi
	movq	%rbx, %rdi
	xorl	%edx, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC11(%rip), %rdi
	jmp	.L16
.L4:
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC12(%rip), %rdi
.L18:
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
.LC13:
	.string	"UNKNOWN_OPERATOR"
.LC14:
	.string	"primary\n"
.LC15:
	.string	"type: \"integer\"\n"
.LC16:
	.string	"value: %s\n"
.LC17:
	.string	"type: \"float\"\n"
.LC18:
	.string	"type: \"string\"\n"
.LC19:
	.string	"value: \"%s\"\n"
.LC20:
	.string	"type: \"boolean\"\n"
.LC21:
	.string	"value: \"true\"\n"
.LC22:
	.string	"value: \"false\"\n"
.LC23:
	.string	"type: \"expression\"\n"
.LC24:
	.string	"value\n"
.LC25:
	.string	"type: \"!\"\n"
.LC26:
	.string	"type: \"-\"\n"
.LC27:
	.string	"type: \"variable\"\n"
.LC28:
	.string	"unknown_PrimaryType: %u\n"
.LC29:
	.string	"operator: \"%s\"\n"
.LC30:
	.string	"left\n"
.LC31:
	.string	"right\n"
	.text
	.type	output_expression, @function
output_expression:
	pushq	%r15
	leaq	.LC13(%rip), %r15
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
.L37:
	movl	24(%rbp), %edi
	cmpl	$19, %edi
	jne	.L21
	movq	%r12, %rsi
	movq	8(%rsp), %rdi
	movq	%rbx, %rcx
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	addq	$2, %r12
	leaq	.LC14(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%rbp), %r13
	leaq	.L25(%rip), %r14
.L22:
	cmpl	$8, 8(%r13)
	leaq	-1(%r12), %rbp
	ja	.L23
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
.L25:
	.long	.L33-.L25
	.long	.L32-.L25
	.long	.L31-.L25
	.long	.L30-.L25
	.long	.L29-.L25
	.long	.L28-.L25
	.long	.L27-.L25
	.long	.L26-.L25
	.long	.L24-.L25
	.text
.L33:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC15(%rip), %rdi
	jmp	.L41
.L32:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC17(%rip), %rdi
.L41:
	call	*fputs@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	8(%rsp), %rdi
	call	*indention@GOTPCREL(%rip)
	movq	0(%r13), %rcx
	leaq	.LC16(%rip), %rdx
.L42:
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
.L31:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC18(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	8(%rsp), %rdi
	call	*indention@GOTPCREL(%rip)
	movq	0(%r13), %rcx
	leaq	.LC19(%rip), %rdx
	jmp	.L42
.L30:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC20(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movq	%rbp, %rsi
	movq	%rbx, %rcx
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC21(%rip), %rdi
	jmp	.L43
.L29:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC20(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movq	%rbp, %rsi
	movq	%rbx, %rcx
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC22(%rip), %rdi
.L43:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*fputs@GOTPCREL(%rip)
.L28:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC23(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	%rbp, %rsi
	movq	8(%rsp), %rdi
	movq	%rbx, %rcx
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC24(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	0(%r13), %rbp
	jmp	.L37
.L27:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC25(%rip), %rdi
	jmp	.L40
.L26:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC26(%rip), %rdi
.L40:
	call	*fputs@GOTPCREL(%rip)
	incq	%r12
	movq	8(%rsp), %rdi
	movq	%rbx, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC24(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	0(%r13), %r13
	jmp	.L22
.L24:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC27(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movq	8(%rsp), %rdi
	movq	%rbp, %rsi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC24(%rip), %rdi
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
.L23:
	movq	8(%rsp), %rdi
	movq	%rbx, %rcx
	movq	%rbp, %rsi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movl	8(%r13), %ecx
	movq	8(%rsp), %rdi
	xorl	%eax, %eax
	addq	$24, %rsp
	leaq	.LC28(%rip), %rdx
	movl	$2, %esi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*__fprintf_chk@GOTPCREL(%rip)
.L21:
	call	*operator_to_string@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	8(%rsp), %rdi
	movq	%rax, %r13
	movq	%rbx, %rcx
	call	*indention@GOTPCREL(%rip)
	testq	%r13, %r13
	movq	8(%rsp), %rdi
	leaq	.LC29(%rip), %rdx
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
	leaq	.LC30(%rip), %rdi
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
	leaq	.LC31(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	16(%rbp), %rbp
	jmp	.L37
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
	leaq	.LC32(%rip), %rdi
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
	je	.L45
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC24(%rip), %rdi
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
.L45:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC33(%rip), %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	*fputs@GOTPCREL(%rip)
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
.LC45:
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
	je	.L48
	ja	.L49
	testl	%eax, %eax
	leaq	1(%rdx), %r14
	jne	.L57
	movq	8(%rsp), %rcx
	xorl	%edx, %edx
	movq	(%rsp), %rdi
	movq	%rbp, %rsi
	call	*indention@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC34(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%rsp), %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	(%rsp), %rdi
	call	*indention@GOTPCREL(%rip)
	leaq	.LC32(%rip), %rdi
	movq	(%rsp), %rsi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%r13), %rdi
	movq	8(%rsp), %rcx
	movq	%r14, %rdx
	jmp	.L61
.L49:
	cmpl	$3, %eax
	jne	.L62
	movq	8(%rsp), %rcx
	leaq	1(%rbp), %r12
	movq	(%rsp), %rdi
	xorl	%edx, %edx
	movq	%rbp, %rsi
	call	*indention@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC39(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%rsp), %rcx
	movq	(%rsp), %rdi
	xorl	%edx, %edx
	movq	%rbp, %rsi
	call	*indention@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC40(%rip), %rdi
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
	leaq	.LC41(%rip), %rdi
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
.L57:
	movq	8(%rdi), %rdi
	leaq	.LC38(%rip), %r15
	call	*list_copy@GOTPCREL(%rip)
	movq	8(%rsp), %rcx
	xorl	%edx, %edx
	movq	(%rsp), %rdi
	movq	%rax, %r12
	movq	%rbp, %rsi
	call	*indention@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC35(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%rsp), %rcx
	xorl	%edx, %edx
	movq	(%rsp), %rdi
	movq	%rbp, %rsi
	call	*indention@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC36(%rip), %rdi
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
	leaq	.LC37(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L54:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L63
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
	jmp	.L54
.L48:
	movq	8(%rsp), %rcx
	xorl	%edx, %edx
	movq	(%rsp), %rdi
	movq	%rbp, %rsi
	call	*indention@GOTPCREL(%rip)
	leaq	1(%rbp), %r12
	movq	(%rsp), %rsi
	leaq	.LC42(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%rsp), %rcx
	xorl	%edx, %edx
	movq	(%rsp), %rdi
	movq	%rbp, %rsi
	call	*indention@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC43(%rip), %rdi
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
	leaq	.LC44(%rip), %rdi
	movq	(%rsp), %rsi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%r13), %rdi
	movq	8(%rsp), %rcx
	movq	%r12, %rdx
.L61:
	movq	(%rsp), %rsi
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	output_name
.L62:
	movq	8(%rsp), %rcx
	movq	(%rsp), %rdi
	movq	%rbp, %rsi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movl	16(%r13), %ecx
	movq	(%rsp), %rdi
	xorl	%eax, %eax
	addq	$24, %rsp
	leaq	.LC45(%rip), %rdx
	movl	$2, %esi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*__fprintf_chk@GOTPCREL(%rip)
.L63:
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
.LC58:
	.string	"variable_declaration_statement\n"
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
	movq	%rdi, %r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$56, %rsp
	cmpl	$7, 8(%rdi)
	movq	%rsi, 8(%rsp)
	movq	%rcx, 16(%rsp)
	ja	.L65
	movl	8(%rdi), %eax
	leaq	.L67(%rip), %rdx
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
.L67:
	.long	.L74-.L67
	.long	.L73-.L67
	.long	.L72-.L67
	.long	.L71-.L67
	.long	.L70-.L67
	.long	.L69-.L67
	.long	.L68-.L67
	.long	.L66-.L67
	.text
.L72:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	1(%rbx), %rbp
	leaq	.LC46(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	(%r12), %r15
	leaq	.LC47(%rip), %r14
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
	leaq	.LC48(%rip), %r15
	call	output_expression
	movq	8(%rsp), %rdi
	movq	%rbp, %rsi
	xorl	%edx, %edx
	movq	16(%rsp), %rcx
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movq	%r15, %rdi
	call	*fputs@GOTPCREL(%rip)
.L75:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L100
	movq	24(%rsp), %rdx
	movq	8(%rsp), %rsi
	call	output_statement
	jmp	.L75
.L100:
	movq	8(%rsp), %rdi
	xorl	%edx, %edx
	movq	%rbp, %rsi
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC49(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	leaq	3(%rbx), %rax
	movq	%rax, 32(%rsp)
.L77:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L101
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
.L78:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L77
	movq	16(%rsp), %rcx
	movq	32(%rsp), %rdx
	movq	8(%rsp), %rsi
	call	output_statement
	jmp	.L78
.L101:
	movq	8(%rsp), %rdi
	movq	%rbp, %rsi
	movq	16(%rsp), %rcx
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC50(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L81:
	movq	40(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L64
	movq	16(%rsp), %rcx
	movq	24(%rsp), %rdx
	movq	8(%rsp), %rsi
	call	output_statement
	jmp	.L81
.L70:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC51(%rip), %rdi
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
	je	.L84
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC52(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rsi
	leaq	2(%rbx), %rdx
	movq	(%r12), %rdi
	call	output_variable
	jmp	.L85
.L84:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC53(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L85:
	xorl	%edx, %edx
	cmpq	$0, 8(%r12)
	movq	16(%rsp), %rcx
	movq	%rbp, %rsi
	movq	8(%rsp), %rdi
	je	.L86
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC47(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%r12), %rdi
	movq	16(%rsp), %rcx
	leaq	2(%rbx), %rdx
	movq	8(%rsp), %rsi
	call	output_expression
	jmp	.L87
.L86:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC54(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L87:
	xorl	%edx, %edx
	cmpq	$0, 16(%r12)
	movq	16(%rsp), %rcx
	movq	%rbp, %rsi
	movq	8(%rsp), %rdi
	je	.L88
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC55(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	16(%r12), %rdi
	movq	16(%rsp), %rcx
	leaq	2(%rbx), %rdx
	movq	8(%rsp), %rsi
	call	output_expression
	jmp	.L89
.L88:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC56(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L89:
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rdi
	movl	$1, %edx
	movq	%rbp, %rsi
	call	*indention@GOTPCREL(%rip)
	addq	$2, %rbx
	movq	8(%rsp), %rsi
	leaq	.LC48(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L90:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L64
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rsi
	movq	%rbx, %rdx
	call	output_statement
	jmp	.L90
.L71:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC57(%rip), %rdi
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
	leaq	.LC47(%rip), %rdi
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
	leaq	.LC48(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L93:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L64
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rsi
	movq	%rbx, %rdx
	call	output_statement
	jmp	.L93
.L73:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC58(%rip), %rdi
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
.L69:
	cmpq	$0, (%r12)
	jne	.L95
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC59(%rip), %rdi
	jmp	.L98
.L95:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC60(%rip), %rdi
	jmp	.L99
.L68:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC61(%rip), %rdi
.L98:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*fputs@GOTPCREL(%rip)
.L66:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC62(%rip), %rdi
	jmp	.L98
.L74:
	cmpq	$0, (%r12)
	jne	.L96
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC63(%rip), %rdi
	jmp	.L98
.L96:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC64(%rip), %rdi
.L99:
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
.L65:
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rdi
	movq	%rbx, %rsi
	xorl	%edx, %edx
	call	*indention@GOTPCREL(%rip)
	movl	8(%r12), %ecx
	movq	8(%rsp), %rdi
	addq	$56, %rsp
	popq	%rbx
	leaq	.LC65(%rip), %rdx
	popq	%rbp
	movl	$2, %esi
	popq	%r12
	xorl	%eax, %eax
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*__fprintf_chk@GOTPCREL(%rip)
.L64:
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
	pushq	%rbp
	movq	%rsi, %rbp
	movq	%rdx, %rsi
	testq	%rdi, %rdi
	jne	.L103
	movq	%rbp, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	popq	%rbx
	movq	%rbp, %rsi
	popq	%rbx
	leaq	.LC66(%rip), %rdi
	popq	%rbp
	jmp	*fputs@GOTPCREL(%rip)
.L103:
	movq	%rdi, %rbx
	movq	%rbp, %rdi
	cmpq	$0, 16(%rbx)
	jne	.L104
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rbx), %rcx
	movq	%rbp, %rdi
	popq	%r11
	leaq	.LC67(%rip), %rdx
	popq	%rbx
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbp
	jmp	*__fprintf_chk@GOTPCREL(%rip)
.L104:
	cmpq	$0, (%rbx)
	je	.L105
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%rbx), %rax
	movq	16(%rbx), %rdx
	movq	%rbp, %rdi
	movq	8(%rbx), %r8
	movl	$2, %esi
	movq	8(%rdx), %rcx
	movq	8(%rax), %r9
	leaq	.LC68(%rip), %rdx
	xorl	%eax, %eax
	popq	%r10
	popq	%rbx
	popq	%rbp
	jmp	*__fprintf_chk@GOTPCREL(%rip)
.L105:
	call	*indention_tac@GOTPCREL(%rip)
	movq	16(%rbx), %rax
	movq	8(%rbx), %r8
	movq	%rbp, %rdi
	leaq	.LC69(%rip), %rdx
	movl	$2, %esi
	movq	8(%rax), %rcx
	popq	%r9
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	jmp	*__fprintf_chk@GOTPCREL(%rip)
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
	movq	%rsi, %rbx
	pushq	%rbp
	testq	%rdi, %rdi
	jne	.L108
	xorl	%esi, %esi
	movq	%rbx, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC72(%rip), %rdi
	jmp	.L125
.L108:
	cmpl	$9, 16(%rdi)
	movq	%rdi, %rbp
	ja	.L109
	movl	16(%rdi), %eax
	leaq	.L111(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L111:
	.long	.L112-.L111
	.long	.L118-.L111
	.long	.L117-.L111
	.long	.L116-.L111
	.long	.L115-.L111
	.long	.L114-.L111
	.long	.L113-.L111
	.long	.L112-.L111
	.long	.L112-.L111
	.long	.L110-.L111
	.text
.L113:
	xorl	%esi, %esi
	movq	%rbx, %rdi
.L120:
	call	*indention_tac@GOTPCREL(%rip)
	movq	0(%rbp), %rax
	movq	8(%rax), %rdi
.L127:
	movq	%rbx, %rsi
.L125:
	popq	%rbx
	popq	%rbx
	popq	%rbp
	jmp	*fputs@GOTPCREL(%rip)
.L118:
	xorl	%esi, %esi
	movq	%rbx, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	0(%rbp), %rcx
	leaq	.LC74(%rip), %rdx
	jmp	.L128
.L117:
	movq	%rbx, %rdi
	xorl	%esi, %esi
	call	*indention_tac@GOTPCREL(%rip)
	movsd	0(%rbp), %xmm0
	movq	%rbx, %rdi
	popq	%r11
	leaq	.LC75(%rip), %rdx
	popq	%rbx
	movl	$2, %esi
	movb	$1, %al
	popq	%rbp
	jmp	*__fprintf_chk@GOTPCREL(%rip)
.L116:
	xorl	%esi, %esi
	movq	%rbx, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	0(%rbp), %rcx
	leaq	.LC76(%rip), %rdx
.L128:
	popq	%r10
	movq	%rbx, %rdi
	movl	$2, %esi
	popq	%rbx
	xorl	%eax, %eax
	popq	%rbp
	jmp	*__fprintf_chk@GOTPCREL(%rip)
.L115:
	xorl	%esi, %esi
	movq	%rbx, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	cmpb	$0, 0(%rbp)
	leaq	.LC71(%rip), %rdi
	leaq	.LC70(%rip), %rax
	cmovne	%rax, %rdi
	jmp	.L127
.L114:
	xorl	%esi, %esi
	movq	%rbx, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC77(%rip), %rdi
	jmp	.L125
.L112:
	movq	(%rdi), %rax
	xorl	%esi, %esi
	movq	%rbx, %rdi
	cmpq	$0, (%rax)
	je	.L120
	call	*indention_tac@GOTPCREL(%rip)
	movq	0(%rbp), %rax
	movq	%rbx, %rdi
	movl	$2, %esi
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	movq	8(%rdx), %r8
	popq	%r9
	leaq	.LC73(%rip), %rdx
	popq	%rbx
	popq	%rbp
	jmp	*__fprintf_chk@GOTPCREL(%rip)
.L110:
	xorl	%esi, %esi
	movq	%rbx, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC78(%rip), %rdi
	jmp	.L125
.L109:
	movq	%rbx, %rdi
	xorl	%esi, %esi
	call	*indention_tac@GOTPCREL(%rip)
	movl	16(%rbp), %ecx
	movq	%rbx, %rdi
	popq	%r8
	leaq	.LC79(%rip), %rdx
	popq	%rbx
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbp
	jmp	*__fprintf_chk@GOTPCREL(%rip)
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
	movq	%rdx, %rbx
	subq	$72, %rsp
	movq	(%rdi), %rdi
	movq	%rsi, 8(%rsp)
	movq	%rcx, 16(%rsp)
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 48(%rsp)
.L131:
	movq	48(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L155
	movl	8(%rbp), %eax
	movq	16(%rsp), %rcx
	leaq	1(%rbx), %rsi
	xorl	%edx, %edx
	movq	8(%rsp), %rdi
	cmpl	$1, %eax
	je	.L132
	cmpl	$2, %eax
	je	.L133
	testl	%eax, %eax
	jne	.L134
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC81(%rip), %rdi
	leaq	2(%rbx), %r12
	call	*fputs@GOTPCREL(%rip)
	movq	0(%rbp), %rbp
	movq	16(%rsp), %rcx
	xorl	%edx, %edx
	movq	8(%rsp), %rdi
	movq	%r12, %rsi
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC32(%rip), %rdi
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
	jne	.L135
	leaq	.LC80(%rip), %rcx
.L135:
	movq	8(%rsp), %rdi
	leaq	.LC82(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L131
.L132:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	2(%rbx), %r12
	leaq	.LC36(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	0(%rbp), %r14
	movq	16(%rsp), %rcx
	xorl	%edx, %edx
	movq	8(%rsp), %rdi
	movq	%r12, %rsi
	leaq	.LC84(%rip), %r15
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC32(%rip), %rdi
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
	leaq	.LC83(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	16(%r14), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	24(%r14), %rdi
	orl	$-1, %r14d
	movq	%rax, %r13
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 32(%rsp)
.L137:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L156
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
	jmp	.L137
.L156:
	movq	8(%rsp), %rdi
	movq	%r12, %rsi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC48(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L139:
	movq	32(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L131
	movq	16(%rsp), %rcx
	movq	24(%rsp), %rdx
	movq	8(%rsp), %rsi
	call	output_statement
	jmp	.L139
.L133:
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC85(%rip), %rdi
	leaq	2(%rbx), %r12
	call	*fputs@GOTPCREL(%rip)
	movq	0(%rbp), %rbp
	movq	16(%rsp), %rcx
	xorl	%edx, %edx
	movq	8(%rsp), %rdi
	movq	%r12, %rsi
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC32(%rip), %rdi
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
	leaq	.LC86(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	8(%rbp), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 56(%rsp)
.L141:
	movq	56(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L131
	movl	8(%r12), %eax
	testl	%eax, %eax
	je	.L142
	decl	%eax
	jne	.L157
	movq	16(%rsp), %rcx
	xorl	%edx, %edx
	movq	24(%rsp), %rsi
	movq	8(%rsp), %rdi
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC88(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rsi
	leaq	4(%rbx), %rdx
	movq	(%r12), %rdi
	call	output_variable
	jmp	.L141
.L142:
	movq	16(%rsp), %rcx
	xorl	%edx, %edx
	movq	24(%rsp), %rsi
	orl	$-1, %r14d
	movq	8(%rsp), %rdi
	leaq	.LC84(%rip), %r15
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC87(%rip), %rdi
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
	leaq	.LC32(%rip), %rdi
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
	leaq	.LC83(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	16(%r12), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	24(%r12), %rdi
	movq	%rax, %r13
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
.L145:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L158
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
	jmp	.L145
.L158:
	movq	32(%rsp), %rsi
	movq	8(%rsp), %rdi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC48(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L147:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L141
	movq	16(%rsp), %rcx
	movq	40(%rsp), %rdx
	movq	8(%rsp), %rsi
	call	output_statement
	jmp	.L147
.L157:
	movq	16(%rsp), %rcx
	movq	24(%rsp), %rsi
	xorl	%edx, %edx
	movq	8(%rsp), %rdi
	call	*indention@GOTPCREL(%rip)
	movl	8(%r12), %ecx
	movq	8(%rsp), %rdi
	xorl	%eax, %eax
	leaq	.LC89(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L141
.L134:
	call	*indention@GOTPCREL(%rip)
	movl	8(%rbp), %ecx
	movq	8(%rsp), %rdi
	xorl	%eax, %eax
	leaq	.LC90(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L131
.L155:
	addq	$72, %rsp
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
	movq	%rdx, %rbx
	subq	$56, %rsp
	movq	%rsi, 8(%rsp)
	testq	%rdi, %rdi
	jne	.L160
	movq	8(%rsp), %rdi
	movq	%rdx, %rsi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC91(%rip), %rdi
	jmp	.L253
.L160:
	movq	%rdi, %rbp
	movq	%rdx, %rsi
	movq	8(%rsp), %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC92(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	0(%rbp), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	leaq	1(%rbx), %rdx
	movq	%rdx, 16(%rsp)
	testb	%al, %al
	je	.L161
	movq	8(%rsp), %rdi
	movq	%rdx, %rsi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC93(%rip), %rdi
	jmp	.L243
.L161:
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC94(%rip), %rdi
.L242:
	call	*fputs@GOTPCREL(%rip)
	movq	0(%rbp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L254
	leaq	2(%rbx), %r14
	cmpq	$0, 8(%r13)
	movq	8(%rsp), %rdi
	movq	%r14, %rsi
	jne	.L164
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC95(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	jmp	.L165
.L164:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%r13), %rax
	movq	8(%rsp), %rdi
	leaq	.LC96(%rip), %rdx
	movl	$2, %esi
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L165:
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	call	*indention_tac@GOTPCREL(%rip)
	movl	$2, %esi
	movq	16(%r13), %rcx
	xorl	%eax, %eax
	movq	8(%rsp), %rdi
	leaq	.LC97(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	0(%r13), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	testb	%al, %al
	je	.L166
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC98(%rip), %rdi
	jmp	.L242
.L166:
	call	*indention_tac@GOTPCREL(%rip)
	leaq	.LC101(%rip), %r15
	movq	8(%rsp), %rsi
	leaq	.LC99(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L168:
	movq	0(%r13), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L255
	cmpq	$0, 8(%r12)
	movq	8(%rsp), %rdi
	leaq	3(%rbx), %rsi
	jne	.L169
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC100(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	jmp	.L170
.L169:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%r12), %rax
	movq	8(%rsp), %rdi
	movq	%r15, %rdx
	movl	$2, %esi
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L170:
	movq	(%r12), %rax
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	testq	%rax, %rax
	jne	.L171
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC95(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	jmp	.L172
.L171:
	cmpq	$0, (%rax)
	je	.L173
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%r12), %rax
	movq	8(%rsp), %rdi
	movl	$2, %esi
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	movq	8(%rdx), %r8
	leaq	.LC102(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L172
.L173:
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%r12), %rax
	movq	8(%rsp), %rdi
	leaq	.LC96(%rip), %rdx
	movl	$2, %esi
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L172:
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	call	*indention_tac@GOTPCREL(%rip)
	movq	16(%r12), %rcx
	movq	8(%rsp), %rdi
	xorl	%eax, %eax
	leaq	.LC103(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L168
.L255:
	movq	8(%rsp), %rdi
	movq	%r14, %rsi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC104(%rip), %rdi
	jmp	.L242
.L254:
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC105(%rip), %rdi
.L243:
	call	*fputs@GOTPCREL(%rip)
	cmpq	$0, 8(%rbp)
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	jne	.L176
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC106(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	jmp	.L177
.L176:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rbp), %rax
	movq	8(%rsp), %rdi
	leaq	.LC107(%rip), %rdx
	movl	$2, %esi
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L177:
	movq	16(%rbp), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	testb	%al, %al
	je	.L178
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC108(%rip), %rdi
	jmp	.L244
.L178:
	call	*indention_tac@GOTPCREL(%rip)
	leaq	2(%rbx), %r12
	movq	8(%rsp), %rsi
	leaq	.LC109(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L180:
	movq	16(%rbp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L256
	movq	8(%rsp), %rsi
	movq	%r12, %rdx
	call	output_var
	jmp	.L180
.L256:
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC105(%rip), %rdi
.L244:
	call	*fputs@GOTPCREL(%rip)
	movq	24(%rbp), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	testb	%al, %al
	je	.L182
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC110(%rip), %rdi
	jmp	.L252
.L182:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC111(%rip), %rdi
.L251:
	call	*fputs@GOTPCREL(%rip)
	movq	24(%rbp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L257
	leaq	2(%rbx), %rax
	cmpq	$0, (%r12)
	movq	%rax, 32(%rsp)
	jne	.L185
	movq	8(%rsp), %rdi
	movq	%rax, %rsi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC112(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	jmp	.L186
.L185:
	movq	32(%rsp), %rsi
	movq	8(%rsp), %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%r12), %rax
	movq	8(%rsp), %rdi
	leaq	.LC113(%rip), %rdx
	movl	$2, %esi
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L186:
	leaq	3(%rbx), %rax
	cmpq	$0, 8(%r12)
	movq	%rax, 24(%rsp)
	jne	.L187
	movq	8(%rsp), %rdi
	movq	%rax, %rsi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC114(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	jmp	.L188
.L187:
	movq	24(%rsp), %rsi
	movq	8(%rsp), %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%r12), %rax
	movq	8(%rsp), %rdi
	leaq	.LC115(%rip), %rdx
	movl	$2, %esi
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L188:
	movq	16(%r12), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	movq	24(%rsp), %rsi
	movq	8(%rsp), %rdi
	testb	%al, %al
	je	.L189
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC116(%rip), %rdi
	jmp	.L245
.L189:
	call	*indention_tac@GOTPCREL(%rip)
	leaq	4(%rbx), %r13
	movq	8(%rsp), %rsi
	leaq	.LC117(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L191:
	movq	16(%r12), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L258
	movq	8(%rsp), %rsi
	movq	%r13, %rdx
	call	output_var
	jmp	.L191
.L258:
	movq	24(%rsp), %rsi
	movq	8(%rsp), %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC105(%rip), %rdi
.L245:
	call	*fputs@GOTPCREL(%rip)
	movq	24(%r12), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	movq	24(%rsp), %rsi
	movq	8(%rsp), %rdi
	testb	%al, %al
	je	.L193
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC118(%rip), %rdi
	jmp	.L246
.L193:
	call	*indention_tac@GOTPCREL(%rip)
	leaq	4(%rbx), %r13
	movq	8(%rsp), %rsi
	leaq	.LC119(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L195:
	movq	24(%r12), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L259
	movq	8(%rsp), %rsi
	movq	%r13, %rdx
	call	output_var
	jmp	.L195
.L259:
	movq	24(%rsp), %rsi
	movq	8(%rsp), %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC105(%rip), %rdi
.L246:
	call	*fputs@GOTPCREL(%rip)
	movq	32(%r12), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	movq	24(%rsp), %rsi
	movq	8(%rsp), %rdi
	testb	%al, %al
	je	.L197
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC120(%rip), %rdi
	jmp	.L250
.L197:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC121(%rip), %rdi
.L249:
	call	*fputs@GOTPCREL(%rip)
	movq	32(%r12), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L260
	leaq	4(%rbx), %rax
	cmpq	$0, (%r14)
	movq	%rax, 40(%rsp)
	jne	.L200
	movq	8(%rsp), %rdi
	movq	%rax, %rsi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC95(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	jmp	.L201
.L200:
	movq	40(%rsp), %rsi
	movq	8(%rsp), %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%r14), %rax
	movq	8(%rsp), %rdi
	leaq	.LC96(%rip), %rdx
	movl	$2, %esi
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L201:
	movq	8(%r14), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	testb	%al, %al
	je	.L202
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC98(%rip), %rdi
	jmp	.L249
.L202:
	call	*indention_tac@GOTPCREL(%rip)
	leaq	.L207(%rip), %r15
	movq	8(%rsp), %rsi
	leaq	.LC99(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L204:
	movq	8(%r14), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L261
	cmpl	$25, 24(%r13)
	leaq	5(%rbx), %rsi
	ja	.L205
	movl	24(%r13), %eax
	movq	8(%rsp), %rdi
	movslq	(%r15,%rax,4), %rax
	addq	%r15, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L207:
	.long	.L232-.L207
	.long	.L231-.L207
	.long	.L230-.L207
	.long	.L229-.L207
	.long	.L228-.L207
	.long	.L227-.L207
	.long	.L226-.L207
	.long	.L225-.L207
	.long	.L224-.L207
	.long	.L223-.L207
	.long	.L222-.L207
	.long	.L221-.L207
	.long	.L220-.L207
	.long	.L219-.L207
	.long	.L218-.L207
	.long	.L217-.L207
	.long	.L216-.L207
	.long	.L215-.L207
	.long	.L214-.L207
	.long	.L213-.L207
	.long	.L212-.L207
	.long	.L211-.L207
	.long	.L210-.L207
	.long	.L209-.L207
	.long	.L208-.L207
	.long	.L206-.L207
	.text
.L232:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC122(%rip), %rdi
	jmp	.L247
.L231:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC123(%rip), %rdi
	jmp	.L247
.L230:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC124(%rip), %rdi
	jmp	.L247
.L229:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC125(%rip), %rdi
	jmp	.L247
.L228:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC126(%rip), %rdi
	jmp	.L247
.L227:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC127(%rip), %rdi
	jmp	.L247
.L226:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC128(%rip), %rdi
	jmp	.L247
.L225:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC129(%rip), %rdi
	jmp	.L247
.L224:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC130(%rip), %rdi
	jmp	.L247
.L223:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC131(%rip), %rdi
	jmp	.L247
.L222:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC132(%rip), %rdi
	jmp	.L247
.L221:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC133(%rip), %rdi
	jmp	.L247
.L220:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC134(%rip), %rdi
	jmp	.L247
.L219:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC135(%rip), %rdi
	jmp	.L247
.L218:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC136(%rip), %rdi
	jmp	.L247
.L217:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC137(%rip), %rdi
	jmp	.L247
.L216:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC138(%rip), %rdi
	jmp	.L247
.L215:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC139(%rip), %rdi
	jmp	.L247
.L214:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC140(%rip), %rdi
	jmp	.L247
.L213:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC141(%rip), %rdi
	jmp	.L247
.L212:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC142(%rip), %rdi
	jmp	.L247
.L211:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC143(%rip), %rdi
	jmp	.L247
.L210:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC144(%rip), %rdi
	jmp	.L247
.L209:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC145(%rip), %rdi
	jmp	.L247
.L208:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC146(%rip), %rdi
.L247:
	call	*fputs@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movq	0(%r13), %rdi
	call	output_arg
	movl	24(%r13), %ecx
	cmpl	$24, %ecx
	jbe	.L262
	jmp	.L204
.L206:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC147(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	jmp	.L204
.L205:
	movq	8(%rsp), %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movl	24(%r13), %ecx
	movq	8(%rsp), %rdi
	xorl	%eax, %eax
	leaq	.LC148(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L204
.L262:
	movl	$1, %eax
	salq	%cl, %rax
	testl	$4825087, %eax
	jne	.L235
	testl	$25583616, %eax
	jne	.L236
	testl	$3145728, %eax
	jne	.L237
	jmp	.L204
.L235:
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movl	$32, %edi
	call	*fputc@GOTPCREL(%rip)
	movq	8(%r13), %rdi
	movq	8(%rsp), %rsi
	call	output_arg
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	call	*indention_tac@GOTPCREL(%rip)
	movl	$32, %edi
	movq	8(%rsp), %rsi
	call	*fputc@GOTPCREL(%rip)
	movq	16(%r13), %rdi
	jmp	.L248
.L236:
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	call	*indention_tac@GOTPCREL(%rip)
	movl	$32, %edi
	movq	8(%rsp), %rsi
	call	*fputc@GOTPCREL(%rip)
	movq	8(%r13), %rdi
.L248:
	movq	8(%rsp), %rsi
	call	output_arg
.L237:
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movl	$10, %edi
	call	*fputc@GOTPCREL(%rip)
	jmp	.L204
.L261:
	movq	40(%rsp), %rsi
	movq	8(%rsp), %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC104(%rip), %rdi
	jmp	.L249
.L260:
	movq	24(%rsp), %rsi
	movq	8(%rsp), %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC105(%rip), %rdi
.L250:
	call	*fputs@GOTPCREL(%rip)
	movq	32(%rsp), %rsi
	movq	8(%rsp), %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC104(%rip), %rdi
	jmp	.L251
.L257:
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC105(%rip), %rdi
.L252:
	call	*fputs@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movq	%rbx, %rsi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC104(%rip), %rdi
.L253:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*fputs@GOTPCREL(%rip)
	.size	output_TAC, .-output_TAC
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
