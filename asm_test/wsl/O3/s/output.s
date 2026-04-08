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
	.p2align 4
	.type	output_name, @function
output_name:
	pushq	%r15
	pushq	%r14
	movq	%rdx, %r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$8, %rsp
	testq	%rdi, %rdi
	je	.L2
	movq	%rdi, %r15
	addq	$1, %r14
	leaq	.L7(%rip), %r13
.L4:
	leaq	-1(%r14), %r12
	xorl	%edx, %edx
	movq	%rbp, %rcx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	call	*indention@GOTPCREL(%rip)
	movq	8(%r15), %rcx
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC1(%rip), %rdx
	movq	%rbx, %rdi
	call	*__fprintf_chk@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	%rbp, %rcx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	xorl	%eax, %eax
	movq	16(%r15), %rcx
	movl	$2, %esi
	leaq	.LC2(%rip), %rdx
	movq	%rbx, %rdi
	call	*__fprintf_chk@GOTPCREL(%rip)
	cmpl	$6, 32(%r15)
	ja	.L5
	movl	32(%r15), %eax
	movq	%rbp, %rcx
	movslq	0(%r13,%rax,4), %rax
	addq	%r13, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L7:
	.long	.L13-.L7
	.long	.L12-.L7
	.long	.L11-.L7
	.long	.L10-.L7
	.long	.L9-.L7
	.long	.L8-.L7
	.long	.L6-.L7
	.text
	.p2align 4,,10
	.p2align 3
.L8:
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$18, %edx
	movl	$1, %esi
	leaq	.LC10(%rip), %rdi
.L21:
	call	*fwrite@GOTPCREL(%rip)
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	(%r15), %r15
.L14:
	leaq	1(%r14), %rax
	testq	%r15, %r15
	je	.L2
	movq	%rax, %r14
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L9:
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$18, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rdi
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L10:
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rdi
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L11:
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rdi
.L22:
	call	*fwrite@GOTPCREL(%rip)
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	(%r15), %r15
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L12:
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rdi
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L13:
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC9(%rip), %rdi
.L23:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*fwrite@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L6:
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$13, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	jmp	.L23
.L5:
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$25, %edx
	movl	$1, %esi
	leaq	.LC12(%rip), %rdi
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L2:
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$13, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	jmp	.L23
	.size	output_name, .-output_name
	.section	.rodata.str1.1
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
.LC31:
	.string	"UNKNOWN_OPERATOR"
	.text
	.p2align 4
	.type	output_expression, @function
output_expression:
	pushq	%r15
	leaq	.L30(%rip), %r15
	pushq	%r14
	pushq	%r13
	movq	%rdi, %r13
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$8, %rsp
.L39:
	movl	24(%r13), %edi
	cmpl	$19, %edi
	je	.L59
.L26:
	call	*operator_to_string@GOTPCREL(%rip)
	movq	%r12, %rcx
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movq	%rax, %r14
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r14, %rcx
	testq	%r14, %r14
	je	.L60
.L54:
	leaq	.LC28(%rip), %rdx
	movq	%rbx, %rdi
	leaq	1(%rbp), %r14
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	%r12, %rcx
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC29(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
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
	leaq	.LC30(%rip), %rdi
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	call	*fwrite@GOTPCREL(%rip)
	movq	16(%r13), %r13
	movl	24(%r13), %edi
	cmpl	$19, %edi
	je	.L42
	movq	%r14, %rbp
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L60:
	leaq	.LC31(%rip), %rcx
	jmp	.L54
	.p2align 4,,10
	.p2align 3
.L59:
	movq	%rbp, %r14
.L42:
	movq	%r12, %rcx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	leaq	2(%r14), %rbp
	movl	$8, %edx
	movl	$1, %esi
	leaq	.LC13(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	8(%r13), %r13
.L27:
	cmpl	$8, 8(%r13)
	leaq	-1(%rbp), %r14
	ja	.L28
	movl	8(%r13), %eax
	movq	%r12, %rcx
	xorl	%edx, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movslq	(%r15,%rax,4), %rax
	addq	%r15, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L30:
	.long	.L38-.L30
	.long	.L37-.L30
	.long	.L36-.L30
	.long	.L35-.L30
	.long	.L34-.L30
	.long	.L33-.L30
	.long	.L32-.L30
	.long	.L31-.L30
	.long	.L29-.L30
	.text
	.p2align 4,,10
	.p2align 3
.L31:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC25(%rip), %rdi
.L55:
	call	*fwrite@GOTPCREL(%rip)
	addq	$1, %rbp
	movq	%r12, %rcx
	movq	%r14, %rsi
	movl	$1, %edx
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC23(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	0(%r13), %r13
	jmp	.L27
	.p2align 4,,10
	.p2align 3
.L29:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC26(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r12, %rcx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC23(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	0(%r13), %rdi
	addq	$8, %rsp
	movq	%r12, %rcx
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	output_variable_access
	.p2align 4,,10
	.p2align 3
.L38:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC14(%rip), %rdi
.L56:
	call	*fwrite@GOTPCREL(%rip)
	movq	%r12, %rcx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	0(%r13), %rcx
	leaq	.LC15(%rip), %rdx
.L57:
	addq	$8, %rsp
	movq	%rbx, %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L37:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rdi
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L36:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC17(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r12, %rcx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	0(%r13), %rcx
	leaq	.LC18(%rip), %rdx
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L35:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC19(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r12, %rcx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC20(%rip), %rdi
.L58:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*fwrite@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L34:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC19(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r12, %rcx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC21(%rip), %rdi
	jmp	.L58
	.p2align 4,,10
	.p2align 3
.L33:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$19, %edx
	movl	$1, %esi
	leaq	.LC22(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r12, %rcx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC23(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	0(%r13), %r13
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L32:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC24(%rip), %rdi
	jmp	.L55
.L28:
	movq	%r12, %rcx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movl	8(%r13), %ecx
	addq	$8, %rsp
	movq	%rbx, %rdi
	leaq	.LC27(%rip), %rdx
	popq	%rbx
	movl	$2, %esi
	popq	%rbp
	xorl	%eax, %eax
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.size	output_expression, .-output_expression
	.section	.rodata.str1.1
.LC32:
	.string	"name\n"
.LC33:
	.string	"value: \"NULL\"\n"
	.text
	.p2align 4
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
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
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
	movq	%rbp, %rcx
	movq	%r12, %rsi
	movl	$1, %edx
	movq	%rbx, %rdi
	je	.L62
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC23(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
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
	.p2align 4,,10
	.p2align 3
.L62:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	popq	%rbx
	popq	%rbp
	movl	$14, %edx
	popq	%r12
	movl	$1, %esi
	popq	%r13
	leaq	.LC33(%rip), %rdi
	popq	%r14
	jmp	*fwrite@GOTPCREL(%rip)
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
	.p2align 4
	.type	output_variable_access, @function
output_variable_access:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	movq	%rdi, %r13
	pushq	%r12
	movq	%rdx, %r12
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$24, %rsp
	movl	16(%rdi), %eax
	cmpl	$2, %eax
	je	.L65
	ja	.L66
	testl	%eax, %eax
	je	.L79
	movq	8(%rdi), %rdi
	leaq	1(%r12), %r15
	call	*list_copy@GOTPCREL(%rip)
	movq	%rbp, %rcx
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rax, 8(%rsp)
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$22, %edx
	movl	$1, %esi
	leaq	.LC35(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%rbp, %rcx
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC36(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	0(%r13), %rdi
	movq	%rbp, %rcx
	movq	%r15, %rdx
	movq	%rbx, %rsi
	movl	$-1, %r13d
	call	output_variable_access
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC37(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L71
	.p2align 4,,10
	.p2align 3
.L72:
	addl	$1, %r13d
	movq	%rbp, %rcx
	xorl	%edx, %edx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movl	%r13d, %ecx
	movl	$2, %esi
	movq	%rbx, %rdi
	leaq	.LC38(%rip), %rdx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	leaq	2(%r12), %rdx
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	movq	%r14, %rdi
	call	output_expression
.L71:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L72
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L66:
	cmpl	$3, %eax
	jne	.L80
	leaq	1(%r12), %r14
	movq	%r12, %rsi
	movq	%rbx, %rdi
	xorl	%edx, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$29, %edx
	movl	$1, %esi
	leaq	.LC39(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%rbp, %rcx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	xorl	%edx, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC40(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	0(%r13), %rdi
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_variable_access
	movq	%rbp, %rcx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC41(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	8(%r13), %rdi
	addq	$24, %rsp
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	output_expression
	.p2align 4,,10
	.p2align 3
.L65:
	xorl	%edx, %edx
	movq	%r12, %rsi
	leaq	1(%r12), %r14
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$22, %edx
	movl	$1, %esi
	leaq	.LC42(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%rbp, %rcx
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC43(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	0(%r13), %rdi
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_variable_access
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$15, %edx
	leaq	.LC44(%rip), %rdi
	movl	$1, %esi
	call	*fwrite@GOTPCREL(%rip)
	movq	8(%r13), %rdi
	movq	%rbp, %rcx
	movq	%r14, %rdx
.L78:
	addq	$24, %rsp
	movq	%rbx, %rsi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	output_name
	.p2align 4,,10
	.p2align 3
.L79:
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$13, %edx
	movl	$1, %esi
	leaq	.LC34(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$5, %edx
	leaq	.LC32(%rip), %rdi
	movl	$1, %esi
	call	*fwrite@GOTPCREL(%rip)
	movq	8(%r13), %rdi
	leaq	1(%r12), %rdx
	movq	%rbp, %rcx
	jmp	.L78
	.p2align 4,,10
	.p2align 3
.L80:
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movl	16(%r13), %ecx
	addq	$24, %rsp
	movq	%rbx, %rdi
	leaq	.LC45(%rip), %rdx
	popq	%rbx
	movl	$2, %esi
	popq	%rbp
	xorl	%eax, %eax
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*__fprintf_chk@GOTPCREL(%rip)
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
	.p2align 4
	.type	output_statement, @function
output_statement:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	movq	%rdi, %r13
	pushq	%r12
	movq	%rdx, %r12
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$40, %rsp
	cmpl	$7, 8(%rdi)
	ja	.L82
	movl	8(%rdi), %eax
	leaq	.L84(%rip), %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	xorl	%edx, %edx
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L84:
	.long	.L91-.L84
	.long	.L90-.L84
	.long	.L89-.L84
	.long	.L88-.L84
	.long	.L87-.L84
	.long	.L86-.L84
	.long	.L85-.L84
	.long	.L83-.L84
	.text
	.p2align 4,,10
	.p2align 3
.L85:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$24, %edx
	movl	$1, %esi
	leaq	.LC61(%rip), %rdi
.L115:
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*fwrite@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L83:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$27, %edx
	movl	$1, %esi
	leaq	.LC62(%rip), %rdi
	jmp	.L115
	.p2align 4,,10
	.p2align 3
.L91:
	cmpq	$0, 0(%r13)
	je	.L117
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	.LC64(%rip), %rdi
.L116:
	call	*fwrite@GOTPCREL(%rip)
	movq	0(%r13), %rdi
	addq	$40, %rsp
	movq	%rbp, %rcx
	leaq	1(%r12), %rdx
	movq	%rbx, %rsi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	output_expression
	.p2align 4,,10
	.p2align 3
.L90:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC58(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	0(%r13), %rdi
	addq	$40, %rsp
	movq	%rbp, %rcx
	leaq	1(%r12), %rdx
	movq	%rbx, %rsi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	output_variable
	.p2align 4,,10
	.p2align 3
.L89:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$13, %edx
	movl	$1, %esi
	leaq	.LC46(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	0(%r13), %r14
	leaq	1(%r12), %rax
	leaq	2(%r12), %r13
	movq	%rax, 24(%rsp)
	movq	8(%r14), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	16(%r14), %rdi
	movq	%rax, %r15
	call	*list_copy@GOTPCREL(%rip)
	movq	24(%r14), %rdi
	movq	%rax, 8(%rsp)
	call	*list_copy@GOTPCREL(%rip)
	movq	%rbp, %rcx
	xorl	%edx, %edx
	leaq	1(%r12), %rsi
	movq	%rax, 16(%rsp)
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC47(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	(%r14), %rdi
	movq	%rbp, %rcx
	movq	%r13, %rdx
	movq	%rbx, %rsi
	call	output_expression
	movq	24(%rsp), %rsi
	movq	%rbp, %rcx
	xorl	%edx, %edx
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC48(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L92
	.p2align 4,,10
	.p2align 3
.L93:
	movq	%r13, %rdx
	movq	%rbx, %rsi
	call	output_statement
.L92:
	movq	%r15, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rbp, %rcx
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L93
	movq	24(%rsp), %rsi
	xorl	%edx, %edx
	movq	%rbx, %rdi
	leaq	3(%r12), %r15
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$8, %edx
	movl	$1, %esi
	leaq	.LC49(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L94:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L118
	movq	8(%r14), %rdi
	call	*list_copy@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	%rbp, %rcx
	movq	%r13, %rsi
	movq	%rax, %r12
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC47(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	(%r14), %rdi
	movq	%rbp, %rcx
	movq	%r15, %rdx
	movq	%rbx, %rsi
	call	output_expression
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	leaq	.LC48(%rip), %rdi
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L94
.L96:
	movq	%rax, %rdi
	movq	%rbp, %rcx
	movq	%r15, %rdx
	movq	%rbx, %rsi
	call	output_statement
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L96
	jmp	.L94
	.p2align 4,,10
	.p2align 3
.L88:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC57(%rip), %rdi
	leaq	1(%r12), %r14
	addq	$2, %r12
	call	*fwrite@GOTPCREL(%rip)
	movq	0(%r13), %r15
	movq	8(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rbp, %rcx
	xorl	%edx, %edx
	movq	%r14, %rsi
	movq	%rax, %r13
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC47(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	(%r15), %rdi
	movq	%rbp, %rcx
	movq	%r12, %rdx
	movq	%rbx, %rsi
	call	output_expression
	movq	%rbp, %rcx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC48(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L110
	.p2align 4,,10
	.p2align 3
.L111:
	movq	%rbp, %rcx
	movq	%r12, %rdx
	movq	%rbx, %rsi
	call	output_statement
.L110:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L111
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L87:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC51(%rip), %rdi
	leaq	1(%r12), %r14
	call	*fwrite@GOTPCREL(%rip)
	movq	0(%r13), %r15
	movq	24(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	xorl	%edx, %edx
	cmpq	$0, (%r15)
	movq	%rbp, %rcx
	movq	%rax, %r13
	movq	%r14, %rsi
	movq	%rbx, %rdi
	je	.L101
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC52(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	(%r15), %rdi
	leaq	2(%r12), %rdx
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	call	output_variable
.L102:
	xorl	%edx, %edx
	cmpq	$0, 8(%r15)
	movq	%rbp, %rcx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	je	.L103
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC47(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	8(%r15), %rdi
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	leaq	2(%r12), %rdx
	call	output_expression
.L104:
	xorl	%edx, %edx
	cmpq	$0, 16(%r15)
	movq	%rbp, %rcx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	je	.L105
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC55(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	16(%r15), %rdi
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	leaq	2(%r12), %rdx
	call	output_expression
.L106:
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	addq	$2, %r12
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC48(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L107
	.p2align 4,,10
	.p2align 3
.L108:
	movq	%rbp, %rcx
	movq	%r12, %rdx
	movq	%rbx, %rsi
	call	output_statement
.L107:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L108
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L86:
	cmpq	$0, 0(%r13)
	je	.L119
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC60(%rip), %rdi
	jmp	.L116
.L82:
	movq	%r12, %rsi
	movq	%rbx, %rdi
	xorl	%edx, %edx
	call	*indention@GOTPCREL(%rip)
	movl	8(%r13), %ecx
	addq	$40, %rsp
	movq	%rbx, %rdi
	leaq	.LC65(%rip), %rdx
	popq	%rbx
	movl	$2, %esi
	popq	%rbp
	xorl	%eax, %eax
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L118:
	movq	24(%rsp), %rsi
	movq	%rbp, %rcx
	movq	%rbx, %rdi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC50(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L98
	.p2align 4,,10
	.p2align 3
.L99:
	movq	%rbp, %rcx
	movq	%r13, %rdx
	movq	%rbx, %rsi
	call	output_statement
.L98:
	movq	16(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L99
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L101:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	.LC53(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L102
.L105:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$18, %edx
	movl	$1, %esi
	leaq	.LC56(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L106
.L103:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$18, %edx
	movl	$1, %esi
	leaq	.LC54(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L104
.L117:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$29, %edx
	movl	$1, %esi
	leaq	.LC63(%rip), %rdi
	jmp	.L115
.L119:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$25, %edx
	movl	$1, %esi
	leaq	.LC59(%rip), %rdi
	jmp	.L115
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
	.p2align 4
	.type	output_var, @function
output_var:
	pushq	%rbp
	movq	%rsi, %rbp
	movq	%rdx, %rsi
	pushq	%rbx
	subq	$8, %rsp
	testq	%rdi, %rdi
	je	.L125
	movq	%rdi, %rbx
	movq	%rbp, %rdi
	cmpq	$0, 16(%rbx)
	je	.L126
	cmpq	$0, (%rbx)
	je	.L123
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%rbx), %rax
	movq	16(%rbx), %rdx
	movq	%rbp, %rdi
	movq	8(%rbx), %r8
	movl	$2, %esi
	movq	8(%rdx), %rcx
	movq	8(%rax), %r9
	addq	$8, %rsp
	xorl	%eax, %eax
	popq	%rbx
	leaq	.LC68(%rip), %rdx
	popq	%rbp
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L123:
	call	*indention_tac@GOTPCREL(%rip)
	movq	16(%rbx), %rax
	movq	8(%rbx), %r8
	movq	%rbp, %rdi
	leaq	.LC69(%rip), %rdx
	movl	$2, %esi
	movq	8(%rax), %rcx
	addq	$8, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L126:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rbx), %rcx
	addq	$8, %rsp
	movq	%rbp, %rdi
	popq	%rbx
	leaq	.LC67(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbp
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L125:
	movq	%rbp, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	addq	$8, %rsp
	movq	%rbp, %rcx
	movl	$12, %edx
	popq	%rbx
	movl	$1, %esi
	leaq	.LC66(%rip), %rdi
	popq	%rbp
	jmp	*fwrite@GOTPCREL(%rip)
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
	.p2align 4
	.type	output_arg, @function
output_arg:
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	subq	$8, %rsp
	testq	%rdi, %rdi
	je	.L149
	cmpl	$9, 16(%rdi)
	movq	%rdi, %rbx
	ja	.L129
	movl	16(%rdi), %eax
	leaq	.L131(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L131:
	.long	.L132-.L131
	.long	.L138-.L131
	.long	.L137-.L131
	.long	.L136-.L131
	.long	.L135-.L131
	.long	.L134-.L131
	.long	.L133-.L131
	.long	.L132-.L131
	.long	.L132-.L131
	.long	.L130-.L131
	.text
	.p2align 4,,10
	.p2align 3
.L132:
	movq	(%rdi), %rax
	xorl	%esi, %esi
	movq	%rbp, %rdi
	cmpq	$0, (%rax)
	je	.L142
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%rbx), %rax
	movq	%rbp, %rdi
	movl	$2, %esi
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	movq	8(%rdx), %r8
	addq	$8, %rsp
	leaq	.LC73(%rip), %rdx
	popq	%rbx
	popq	%rbp
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L138:
	xorl	%esi, %esi
	movq	%rbp, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%rbx), %rcx
	leaq	.LC74(%rip), %rdx
.L147:
	addq	$8, %rsp
	movq	%rbp, %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L135:
	xorl	%esi, %esi
	movq	%rbp, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	cmpb	$0, (%rbx)
	leaq	.LC71(%rip), %rdi
	leaq	.LC70(%rip), %rax
	cmovne	%rax, %rdi
.L146:
	addq	$8, %rsp
	movq	%rbp, %rsi
	popq	%rbx
	popq	%rbp
	jmp	*fputs@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L134:
	movq	%rbp, %rdi
	xorl	%esi, %esi
	call	*indention_tac@GOTPCREL(%rip)
	addq	$8, %rsp
	movq	%rbp, %rcx
	movl	$4, %edx
	popq	%rbx
	movl	$1, %esi
	leaq	.LC77(%rip), %rdi
	popq	%rbp
	jmp	*fwrite@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L133:
	movq	%rbp, %rdi
	xorl	%esi, %esi
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%rbx), %rax
	movq	8(%rax), %rdi
	jmp	.L146
	.p2align 4,,10
	.p2align 3
.L130:
	movq	%rbp, %rdi
	xorl	%esi, %esi
	call	*indention_tac@GOTPCREL(%rip)
	addq	$8, %rsp
	movq	%rbp, %rcx
	movl	$4, %edx
	popq	%rbx
	movl	$1, %esi
	leaq	.LC78(%rip), %rdi
	popq	%rbp
	jmp	*fwrite@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L137:
	movq	%rbp, %rdi
	xorl	%esi, %esi
	call	*indention_tac@GOTPCREL(%rip)
	movsd	(%rbx), %xmm0
	addq	$8, %rsp
	movq	%rbp, %rdi
	popq	%rbx
	movl	$2, %esi
	movl	$1, %eax
	popq	%rbp
	leaq	.LC75(%rip), %rdx
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L136:
	xorl	%esi, %esi
	movq	%rbp, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%rbx), %rcx
	leaq	.LC76(%rip), %rdx
	jmp	.L147
	.p2align 4,,10
	.p2align 3
.L149:
	movq	%rbp, %rdi
	xorl	%esi, %esi
	call	*indention_tac@GOTPCREL(%rip)
	addq	$8, %rsp
	movq	%rbp, %rcx
	movl	$6, %edx
	popq	%rbx
	movl	$1, %esi
	leaq	.LC72(%rip), %rdi
	popq	%rbp
	jmp	*fwrite@GOTPCREL(%rip)
.L129:
	movq	%rbp, %rdi
	xorl	%esi, %esi
	call	*indention_tac@GOTPCREL(%rip)
	movl	16(%rbx), %ecx
	addq	$8, %rsp
	movq	%rbp, %rdi
	popq	%rbx
	leaq	.LC79(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbp
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L142:
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%rbx), %rax
	movq	8(%rax), %rdi
	jmp	.L146
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
	.p2align 4
	.globl	output_code
	.type	output_code, @function
output_code:
	pushq	%r15
	movq	%rdx, %r15
	pushq	%r14
	movq	%rcx, %r14
	pushq	%r13
	movq	%rsi, %r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$56, %rsp
	movq	(%rdi), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L151:
	movq	40(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L175
	movl	8(%rbx), %eax
	leaq	1(%r15), %rsi
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r13, %rdi
	cmpl	$1, %eax
	je	.L152
	cmpl	$2, %eax
	je	.L153
	testl	%eax, %eax
	jne	.L154
	call	*indention@GOTPCREL(%rip)
	movq	%r13, %rcx
	leaq	2(%r15), %rbp
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC81(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	(%rbx), %rbx
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC32(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	(%rbx), %rdi
	leaq	3(%r15), %rdx
	movq	%r14, %rcx
	movq	%r13, %rsi
	call	output_name
	movq	%r14, %rcx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	8(%rbx), %rcx
	movl	$2, %esi
	movq	%r13, %rdi
	leaq	.LC80(%rip), %rax
	leaq	.LC82(%rip), %rdx
	testq	%rcx, %rcx
	cmove	%rax, %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L151
	.p2align 4,,10
	.p2align 3
.L152:
	call	*indention@GOTPCREL(%rip)
	movq	%r13, %rcx
	leaq	2(%r15), %r12
	leaq	3(%r15), %rbp
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC36(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	(%rbx), %rbx
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%r13, %rdi
	movq	%r12, 8(%rsp)
	call	*indention@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC32(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	(%rbx), %rdi
	movq	%r14, %rcx
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	output_name
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	8(%rbx), %rdi
	movq	%r14, %rcx
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	output_name
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$11, %edx
	movl	$1, %esi
	leaq	.LC83(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	16(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	24(%rbx), %rdi
	movl	$-1, %ebx
	movq	%rax, (%rsp)
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 16(%rsp)
	jmp	.L157
	.p2align 4,,10
	.p2align 3
.L158:
	addl	$1, %ebx
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	*indention@GOTPCREL(%rip)
	movl	%ebx, %ecx
	leaq	.LC84(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	movq	%r13, %rdi
	call	*__fprintf_chk@GOTPCREL(%rip)
	leaq	4(%r15), %rdx
	movq	%r14, %rcx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	output_variable
.L157:
	movq	(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L158
	movq	8(%rsp), %rsi
	movq	%r14, %rcx
	movq	%r13, %rdi
	movq	16(%rsp), %r12
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC48(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L159
	.p2align 4,,10
	.p2align 3
.L160:
	movq	%r14, %rcx
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	output_statement
.L159:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L160
	jmp	.L151
	.p2align 4,,10
	.p2align 3
.L154:
	call	*indention@GOTPCREL(%rip)
	movl	8(%rbx), %ecx
	movl	$2, %esi
	movq	%r13, %rdi
	leaq	.LC90(%rip), %rdx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L151
	.p2align 4,,10
	.p2align 3
.L153:
	call	*indention@GOTPCREL(%rip)
	movq	%r13, %rcx
	leaq	2(%r15), %rbp
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC85(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	(%rbx), %rbx
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC32(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	3(%r15), %rax
	movq	(%rbx), %rdi
	movq	%r14, %rcx
	movq	%rax, %rdx
	movq	%r13, %rsi
	movq	%rax, 16(%rsp)
	call	output_name
	movq	%r14, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$8, %edx
	movl	$1, %esi
	leaq	.LC86(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	8(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L161:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L151
	movl	8(%rbx), %eax
	testl	%eax, %eax
	je	.L162
	cmpl	$1, %eax
	je	.L163
	movq	16(%rsp), %rsi
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r13, %rdi
	call	*indention@GOTPCREL(%rip)
	movl	8(%rbx), %ecx
	movl	$2, %esi
	movq	%r13, %rdi
	leaq	.LC89(%rip), %rdx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L161
	.p2align 4,,10
	.p2align 3
.L162:
	movq	16(%rsp), %rsi
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r13, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r13, %rcx
	leaq	5(%r15), %rbp
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC87(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	(%rbx), %rbx
	leaq	4(%r15), %rax
	movq	%r14, %rcx
	movq	%rax, %r12
	movq	%rax, %rsi
	movq	%rax, 24(%rsp)
	xorl	%edx, %edx
	movq	%r13, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC32(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	(%rbx), %rdi
	movq	%r14, %rcx
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	output_name
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	8(%rbx), %rdi
	movq	%r14, %rcx
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	output_name
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$11, %edx
	movl	$1, %esi
	leaq	.LC83(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	16(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	24(%rbx), %rdi
	movl	$-1, %ebx
	movq	%rax, (%rsp)
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 32(%rsp)
	jmp	.L165
	.p2align 4,,10
	.p2align 3
.L166:
	addl	$1, %ebx
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	*indention@GOTPCREL(%rip)
	movl	%ebx, %ecx
	leaq	.LC84(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	movq	%r13, %rdi
	call	*__fprintf_chk@GOTPCREL(%rip)
	leaq	6(%r15), %rdx
	movq	%r14, %rcx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	output_variable
.L165:
	movq	(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L166
	movq	24(%rsp), %rsi
	movq	%r14, %rcx
	movq	%r13, %rdi
	movq	32(%rsp), %r12
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC48(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L167
	.p2align 4,,10
	.p2align 3
.L168:
	movq	%r14, %rcx
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	output_statement
.L167:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L168
	jmp	.L161
	.p2align 4,,10
	.p2align 3
.L163:
	movq	16(%rsp), %rsi
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r13, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC88(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	(%rbx), %rdi
	leaq	4(%r15), %rdx
	movq	%r14, %rcx
	movq	%r13, %rsi
	call	output_variable
	jmp	.L161
	.p2align 4,,10
	.p2align 3
.L175:
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
	.p2align 4
	.globl	output_TAC
	.type	output_TAC, @function
output_TAC:
	pushq	%r15
	movq	%rsi, %r15
	movq	%rdx, %rsi
	pushq	%r14
	movq	%rdx, %r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$72, %rsp
	testq	%rdi, %rdi
	movq	%rdi, 32(%rsp)
	movq	%r15, %rdi
	je	.L260
	call	*indention_tac@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r15, %rcx
	movl	$6, %edx
	leaq	.LC92(%rip), %rdi
	leaq	1(%r14), %r13
	call	*fwrite@GOTPCREL(%rip)
	movq	32(%rsp), %rax
	movq	(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	movq	%r13, %rsi
	movq	%r15, %rdi
	testb	%al, %al
	je	.L178
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC93(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	.LC104(%rip), %rax
	movq	%rax, 16(%rsp)
.L179:
	movq	32(%rsp), %rax
	movq	%r13, %rsi
	movq	%r15, %rdi
	cmpq	$0, 8(%rax)
	je	.L261
	call	*indention_tac@GOTPCREL(%rip)
	movq	32(%rsp), %rax
	movl	$2, %esi
	movq	%r15, %rdi
	leaq	.LC107(%rip), %rdx
	movq	8(%rax), %rax
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L194:
	movq	32(%rsp), %rax
	movq	16(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	movq	%r13, %rsi
	movq	%r15, %rdi
	testb	%al, %al
	je	.L195
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$11, %edx
	movl	$1, %esi
	leaq	.LC108(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L196:
	movq	32(%rsp), %rax
	movq	24(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	movq	%r13, %rsi
	movq	%r15, %rdi
	testb	%al, %al
	je	.L199
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC110(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L200:
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	16(%rsp), %rdi
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
.L259:
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*fwrite@GOTPCREL(%rip)
.L178:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$11, %edx
	movl	$1, %esi
	leaq	.LC94(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	.LC104(%rip), %rax
	movq	32(%rsp), %rbx
	movq	%rax, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L180:
	movq	(%rbx), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L262
	leaq	2(%r14), %rax
	cmpq	$0, 8(%rbp)
	movq	%r15, %rdi
	movq	%rax, 8(%rsp)
	movq	%rax, %rsi
	je	.L263
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rbp), %rax
	movl	$2, %esi
	movq	%r15, %rdi
	leaq	.LC96(%rip), %rdx
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L182:
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movl	$2, %esi
	movq	16(%rbp), %rcx
	xorl	%eax, %eax
	leaq	.LC97(%rip), %rdx
	movq	%r15, %rdi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	0(%rbp), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	xorl	%esi, %esi
	movq	%r15, %rdi
	testb	%al, %al
	je	.L183
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	.LC98(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L180
	.p2align 4,,10
	.p2align 3
.L183:
	call	*indention_tac@GOTPCREL(%rip)
	leaq	.LC101(%rip), %r12
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC99(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, 24(%rsp)
	jmp	.L185
	.p2align 4,,10
	.p2align 3
.L186:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%r13), %rax
	movq	%r15, %rdi
	movq	%r12, %rdx
	movl	$2, %esi
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	0(%r13), %rax
	xorl	%esi, %esi
	movq	%r15, %rdi
	testq	%rax, %rax
	je	.L264
.L188:
	cmpq	$0, (%rax)
	je	.L190
	call	*indention_tac@GOTPCREL(%rip)
	movq	0(%r13), %rax
	movl	$2, %esi
	movq	%r15, %rdi
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	movq	8(%rdx), %r8
	leaq	.LC102(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
.L189:
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	16(%r13), %rcx
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC103(%rip), %rdx
	movq	%r15, %rdi
	call	*__fprintf_chk@GOTPCREL(%rip)
.L185:
	movq	0(%rbp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L265
	cmpq	$0, 8(%r13)
	leaq	3(%r14), %rsi
	movq	%r15, %rdi
	jne	.L186
	call	*indention_tac@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r15, %rcx
	leaq	.LC100(%rip), %rdi
	movl	$5, %edx
	call	*fwrite@GOTPCREL(%rip)
	movq	0(%r13), %rax
	xorl	%esi, %esi
	movq	%r15, %rdi
	testq	%rax, %rax
	jne	.L188
.L264:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC95(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L189
	.p2align 4,,10
	.p2align 3
.L190:
	call	*indention_tac@GOTPCREL(%rip)
	movq	0(%r13), %rax
	movl	$2, %esi
	movq	%r15, %rdi
	leaq	.LC96(%rip), %rdx
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L189
	.p2align 4,,10
	.p2align 3
.L265:
	movq	8(%rsp), %rsi
	movq	%r15, %rdi
	movq	24(%rsp), %r13
	call	*indention_tac@GOTPCREL(%rip)
	movq	16(%rsp), %rdi
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L180
	.p2align 4,,10
	.p2align 3
.L263:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC95(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L182
.L262:
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	leaq	.LC105(%rip), %r8
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	movq	%r8, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L179
.L199:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC111(%rip), %rdi
	leaq	.L224(%rip), %r12
	call	*fwrite@GOTPCREL(%rip)
	leaq	.LC105(%rip), %r8
	movq	%r13, 56(%rsp)
	movq	%r8, 40(%rsp)
	jmp	.L201
	.p2align 4,,10
	.p2align 3
.L269:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC116(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L207:
	movq	24(%rbp), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	movq	%r13, %rsi
	movq	%r15, %rdi
	testb	%al, %al
	je	.L210
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC118(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L211:
	movq	32(%rbp), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	movq	%r13, %rsi
	movq	%r15, %rdi
	testb	%al, %al
	je	.L214
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC120(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L215:
	movq	24(%rsp), %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	16(%rsp), %rdi
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	call	*fwrite@GOTPCREL(%rip)
.L201:
	movq	32(%rsp), %rax
	movq	24(%rax), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L266
	leaq	2(%r14), %rax
	cmpq	$0, 0(%rbp)
	movq	%r15, %rdi
	movq	%rax, 24(%rsp)
	movq	%rax, %rsi
	je	.L267
	call	*indention_tac@GOTPCREL(%rip)
	movq	0(%rbp), %rax
	movl	$2, %esi
	movq	%r15, %rdi
	leaq	.LC113(%rip), %rdx
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L203:
	leaq	3(%r14), %r13
	cmpq	$0, 8(%rbp)
	movq	%r15, %rdi
	movq	%r13, %rsi
	je	.L268
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rbp), %rax
	movl	$2, %esi
	movq	%r15, %rdi
	leaq	.LC115(%rip), %rdx
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L205:
	movq	16(%rbp), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	movq	%r13, %rsi
	movq	%r15, %rdi
	testb	%al, %al
	jne	.L269
	call	*indention_tac@GOTPCREL(%rip)
	leaq	4(%r14), %rbx
	movq	%r15, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC117(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L208
	.p2align 4,,10
	.p2align 3
.L209:
	movq	%rbx, %rdx
	movq	%r15, %rsi
	call	output_var
.L208:
	movq	16(%rbp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L209
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	40(%rsp), %rdi
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
	.p2align 4,,10
	.p2align 3
.L214:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC121(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%rbp, 8(%rsp)
	movq	%r13, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L216:
	movq	8(%rsp), %rax
	movq	32(%rax), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L270
	leaq	4(%r14), %r13
	cmpq	$0, (%rbx)
	movq	%r15, %rdi
	movq	%r13, %rsi
	je	.L271
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%rbx), %rax
	movl	$2, %esi
	movq	%r15, %rdi
	leaq	.LC96(%rip), %rdx
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L218:
	movq	8(%rbx), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	xorl	%esi, %esi
	movq	%r15, %rdi
	testb	%al, %al
	je	.L219
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	.LC98(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L216
	.p2align 4,,10
	.p2align 3
.L219:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC99(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L221:
	movq	8(%rbx), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L272
	cmpl	$25, 24(%rbp)
	leaq	5(%r14), %rsi
	ja	.L222
	movl	24(%rbp), %eax
	movq	%r15, %rdi
	movslq	(%r12,%rax,4), %rax
	addq	%r12, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L224:
	.long	.L249-.L224
	.long	.L248-.L224
	.long	.L247-.L224
	.long	.L246-.L224
	.long	.L245-.L224
	.long	.L244-.L224
	.long	.L243-.L224
	.long	.L242-.L224
	.long	.L241-.L224
	.long	.L240-.L224
	.long	.L239-.L224
	.long	.L238-.L224
	.long	.L237-.L224
	.long	.L236-.L224
	.long	.L235-.L224
	.long	.L234-.L224
	.long	.L233-.L224
	.long	.L232-.L224
	.long	.L231-.L224
	.long	.L230-.L224
	.long	.L229-.L224
	.long	.L228-.L224
	.long	.L227-.L224
	.long	.L226-.L224
	.long	.L225-.L224
	.long	.L223-.L224
	.text
	.p2align 4,,10
	.p2align 3
.L225:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC146(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L250:
	movq	0(%rbp), %rdi
	movq	%r15, %rsi
	call	output_arg
	movl	24(%rbp), %ecx
	cmpl	$24, %ecx
	ja	.L221
	movl	$1, %eax
	salq	%cl, %rax
	testl	$4825087, %eax
	jne	.L252
	testl	$25583616, %eax
	jne	.L253
	testl	$3145728, %eax
	je	.L221
.L254:
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rsi
	movl	$10, %edi
	call	*fputc@GOTPCREL(%rip)
	jmp	.L221
	.p2align 4,,10
	.p2align 3
.L226:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC145(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L227:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC144(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L228:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC143(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L229:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC142(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L230:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC141(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L231:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC140(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L232:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC139(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L233:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC138(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L234:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC137(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L235:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC136(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L236:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC135(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L237:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC134(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L238:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC133(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L239:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC132(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L240:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC131(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L241:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC130(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L242:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC129(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L243:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC128(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L244:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC127(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L245:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC126(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L246:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC125(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L247:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC124(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L248:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC123(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L249:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC122(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L223:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC147(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
	.p2align 4,,10
	.p2align 3
.L253:
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rsi
	movl	$32, %edi
	call	*fputc@GOTPCREL(%rip)
	movq	8(%rbp), %rdi
	movq	%r15, %rsi
	call	output_arg
	jmp	.L254
	.p2align 4,,10
	.p2align 3
.L252:
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rsi
	movl	$32, %edi
	call	*fputc@GOTPCREL(%rip)
	movq	8(%rbp), %rdi
	movq	%r15, %rsi
	call	output_arg
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rsi
	movl	$32, %edi
	call	*fputc@GOTPCREL(%rip)
	movq	16(%rbp), %rdi
	movq	%r15, %rsi
	call	output_arg
	jmp	.L254
	.p2align 4,,10
	.p2align 3
.L272:
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	16(%rsp), %rdi
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L216
	.p2align 4,,10
	.p2align 3
.L271:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC95(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L218
	.p2align 4,,10
	.p2align 3
.L270:
	movq	48(%rsp), %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	40(%rsp), %rdi
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L215
	.p2align 4,,10
	.p2align 3
.L210:
	call	*indention_tac@GOTPCREL(%rip)
	leaq	4(%r14), %rbx
	movq	%r15, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC119(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L212
	.p2align 4,,10
	.p2align 3
.L213:
	movq	%rbx, %rdx
	movq	%r15, %rsi
	call	output_var
.L212:
	movq	24(%rbp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L213
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	40(%rsp), %rdi
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L211
.L222:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movl	24(%rbp), %ecx
	movl	$2, %esi
	movq	%r15, %rdi
	leaq	.LC148(%rip), %rdx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L221
	.p2align 4,,10
	.p2align 3
.L268:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	.LC114(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L205
	.p2align 4,,10
	.p2align 3
.L267:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC112(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L203
.L195:
	call	*indention_tac@GOTPCREL(%rip)
	leaq	2(%r14), %rbx
	movq	%r15, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC109(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	32(%rsp), %rbp
	jmp	.L197
	.p2align 4,,10
	.p2align 3
.L198:
	movq	%rbx, %rdx
	movq	%r15, %rsi
	call	output_var
.L197:
	movq	16(%rbp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L198
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	leaq	.LC105(%rip), %r8
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	movq	%r8, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L196
.L266:
	movq	56(%rsp), %r13
	movq	40(%rsp), %r8
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%r8, 8(%rsp)
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L200
.L261:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	.LC106(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L194
.L260:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC91(%rip), %rdi
	jmp	.L259
	.size	output_TAC, .-output_TAC
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
