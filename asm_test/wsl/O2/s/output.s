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
	.p2align 4
	.type	output_expression, @function
output_expression:
	pushq	%r15
	pushq	%r14
	movq	%rdi, %r14
	pushq	%r13
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$8, %rsp
.L39:
	movl	24(%r14), %edi
	leaq	.LC13(%rip), %r13
	cmpl	$19, %edi
	je	.L54
.L26:
	call	*operator_to_string@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	%r12, %rcx
	movq	%rbp, %rsi
	movq	%rax, %r15
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	testq	%r15, %r15
	movl	$2, %esi
	movq	%rbx, %rdi
	cmove	%r13, %r15
	leaq	.LC29(%rip), %rdx
	xorl	%eax, %eax
	movq	%r15, %rcx
	leaq	1(%rbp), %r15
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	%r12, %rcx
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC30(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	(%r14), %rdi
	movq	%r12, %rcx
	movq	%r15, %rdx
	movq	%rbx, %rsi
	call	output_expression
	movq	%r12, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	leaq	.LC31(%rip), %rdi
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	call	*fwrite@GOTPCREL(%rip)
	movq	16(%r14), %r14
	movl	24(%r14), %edi
	cmpl	$19, %edi
	je	.L42
	movq	%r15, %rbp
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L54:
	movq	%rbp, %r15
.L42:
	movq	%r12, %rcx
	movl	$1, %edx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	leaq	2(%r15), %rbp
	movl	$8, %edx
	movl	$1, %esi
	leaq	.LC14(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	8(%r14), %r13
.L27:
	cmpl	$8, 8(%r13)
	leaq	-1(%rbp), %r14
	ja	.L28
	movl	8(%r13), %eax
	leaq	.L30(%rip), %rsi
	movq	%r12, %rcx
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movslq	(%rsi,%rax,4), %rax
	addq	%rsi, %rax
	movq	%r14, %rsi
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
	leaq	.LC26(%rip), %rdi
.L50:
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
	leaq	.LC24(%rip), %rdi
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
	leaq	.LC27(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r12, %rcx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC24(%rip), %rdi
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
	leaq	.LC15(%rip), %rdi
.L51:
	call	*fwrite@GOTPCREL(%rip)
	movq	%r12, %rcx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	0(%r13), %rcx
	leaq	.LC16(%rip), %rdx
.L52:
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
	leaq	.LC17(%rip), %rdi
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L36:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC18(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r12, %rcx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	0(%r13), %rcx
	leaq	.LC19(%rip), %rdx
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L35:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC20(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r12, %rcx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC21(%rip), %rdi
.L53:
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
	leaq	.LC20(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r12, %rcx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC22(%rip), %rdi
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L33:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$19, %edx
	movl	$1, %esi
	leaq	.LC23(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r14, %rsi
	movq	%r12, %rcx
	movl	$1, %edx
	movq	%rbx, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC24(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	0(%r13), %r14
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L32:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC25(%rip), %rdi
	jmp	.L50
.L28:
	movq	%r12, %rcx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movl	$1, %edx
	call	*indention@GOTPCREL(%rip)
	movl	8(%r13), %ecx
	addq	$8, %rsp
	movq	%rbx, %rdi
	leaq	.LC28(%rip), %rdx
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
	je	.L56
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC24(%rip), %rdi
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
.L56:
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
	je	.L59
	ja	.L60
	testl	%eax, %eax
	je	.L73
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
	jmp	.L65
	.p2align 4,,10
	.p2align 3
.L66:
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
.L65:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L66
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
.L60:
	cmpl	$3, %eax
	jne	.L74
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
.L59:
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
.L72:
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
.L73:
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
	jmp	.L72
	.p2align 4,,10
	.p2align 3
.L74:
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
	ja	.L76
	movl	8(%rdi), %eax
	leaq	.L78(%rip), %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	xorl	%edx, %edx
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L78:
	.long	.L85-.L78
	.long	.L84-.L78
	.long	.L83-.L78
	.long	.L82-.L78
	.long	.L81-.L78
	.long	.L80-.L78
	.long	.L79-.L78
	.long	.L77-.L78
	.text
	.p2align 4,,10
	.p2align 3
.L79:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$24, %edx
	movl	$1, %esi
	leaq	.LC61(%rip), %rdi
.L109:
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
.L77:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$27, %edx
	movl	$1, %esi
	leaq	.LC62(%rip), %rdi
	jmp	.L109
	.p2align 4,,10
	.p2align 3
.L85:
	cmpq	$0, 0(%r13)
	je	.L111
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	.LC64(%rip), %rdi
.L110:
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
.L84:
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
.L83:
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
	jmp	.L86
	.p2align 4,,10
	.p2align 3
.L87:
	movq	%r13, %rdx
	movq	%rbx, %rsi
	call	output_statement
.L86:
	movq	%r15, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rbp, %rcx
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L87
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
.L88:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L112
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
	je	.L88
.L90:
	movq	%rax, %rdi
	movq	%rbp, %rcx
	movq	%r15, %rdx
	movq	%rbx, %rsi
	call	output_statement
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L90
	jmp	.L88
	.p2align 4,,10
	.p2align 3
.L82:
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
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L105:
	movq	%rbp, %rcx
	movq	%r12, %rdx
	movq	%rbx, %rsi
	call	output_statement
.L104:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L105
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
.L81:
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
	je	.L95
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
.L96:
	xorl	%edx, %edx
	cmpq	$0, 8(%r15)
	movq	%rbp, %rcx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	je	.L97
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
.L98:
	xorl	%edx, %edx
	cmpq	$0, 16(%r15)
	movq	%rbp, %rcx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	je	.L99
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
.L100:
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
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L102:
	movq	%rbp, %rcx
	movq	%r12, %rdx
	movq	%rbx, %rsi
	call	output_statement
.L101:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L102
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
.L80:
	cmpq	$0, 0(%r13)
	je	.L113
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC60(%rip), %rdi
	jmp	.L110
.L76:
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
.L112:
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
	jmp	.L92
	.p2align 4,,10
	.p2align 3
.L93:
	movq	%rbp, %rcx
	movq	%r13, %rdx
	movq	%rbx, %rsi
	call	output_statement
.L92:
	movq	16(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L93
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L95:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	.LC53(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L96
.L99:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$18, %edx
	movl	$1, %esi
	leaq	.LC56(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L100
.L97:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$18, %edx
	movl	$1, %esi
	leaq	.LC54(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L98
.L111:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$29, %edx
	movl	$1, %esi
	leaq	.LC63(%rip), %rdi
	jmp	.L109
.L113:
	call	*indention@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$25, %edx
	movl	$1, %esi
	leaq	.LC59(%rip), %rdi
	jmp	.L109
	.size	output_statement, .-output_statement
	.section	.rodata.str1.1
.LC66:
	.string	"Var: \"NULL\"\n"
.LC67:
	.string	"NULL\t%s\n"
.LC68:
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
	je	.L118
	movq	%rdi, %rbx
	movq	%rbp, %rdi
	cmpq	$0, 16(%rbx)
	je	.L119
	call	*indention_tac@GOTPCREL(%rip)
	movq	16(%rbx), %rax
	movq	8(%rbx), %r8
	movq	%rbp, %rdi
	leaq	.LC68(%rip), %rdx
	movl	$2, %esi
	movq	8(%rax), %rcx
	addq	$8, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L119:
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
.L118:
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
.LC69:
	.string	"true"
.LC70:
	.string	"false"
.LC71:
	.string	"\"NULL\""
.LC72:
	.string	"%lld"
.LC73:
	.string	"%f"
.LC74:
	.string	"void"
.LC75:
	.string	"NONE"
.LC76:
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
	je	.L137
	cmpl	$8, 16(%rdi)
	movq	%rdi, %rbx
	ja	.L122
	movl	16(%rdi), %eax
	leaq	.L124(%rip), %rdx
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L124:
	.long	.L125-.L124
	.long	.L131-.L124
	.long	.L130-.L124
	.long	.L129-.L124
	.long	.L128-.L124
	.long	.L127-.L124
	.long	.L125-.L124
	.long	.L125-.L124
	.long	.L123-.L124
	.text
	.p2align 4,,10
	.p2align 3
.L125:
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%rbx), %rax
	movq	8(%rax), %rdi
.L136:
	addq	$8, %rsp
	movq	%rbp, %rsi
	popq	%rbx
	popq	%rbp
	jmp	*fputs@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L123:
	call	*indention_tac@GOTPCREL(%rip)
	addq	$8, %rsp
	movq	%rbp, %rcx
	movl	$4, %edx
	popq	%rbx
	movl	$1, %esi
	leaq	.LC75(%rip), %rdi
	popq	%rbp
	jmp	*fwrite@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L131:
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%rbx), %rcx
	addq	$8, %rsp
	movq	%rbp, %rdi
	popq	%rbx
	leaq	.LC72(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbp
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L130:
	call	*indention_tac@GOTPCREL(%rip)
	movsd	(%rbx), %xmm0
	addq	$8, %rsp
	movq	%rbp, %rdi
	popq	%rbx
	movl	$2, %esi
	movl	$1, %eax
	popq	%rbp
	leaq	.LC73(%rip), %rdx
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L129:
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%rbx), %rdi
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L128:
	call	*indention_tac@GOTPCREL(%rip)
	cmpb	$0, (%rbx)
	leaq	.LC70(%rip), %rdi
	leaq	.LC69(%rip), %rax
	cmovne	%rax, %rdi
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L127:
	call	*indention_tac@GOTPCREL(%rip)
	addq	$8, %rsp
	movq	%rbp, %rcx
	movl	$4, %edx
	popq	%rbx
	movl	$1, %esi
	leaq	.LC74(%rip), %rdi
	popq	%rbp
	jmp	*fwrite@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L137:
	movq	%rbp, %rdi
	xorl	%esi, %esi
	call	*indention_tac@GOTPCREL(%rip)
	addq	$8, %rsp
	movq	%rbp, %rcx
	movl	$6, %edx
	popq	%rbx
	movl	$1, %esi
	leaq	.LC71(%rip), %rdi
	popq	%rbp
	jmp	*fwrite@GOTPCREL(%rip)
.L122:
	movq	%rbp, %rdi
	xorl	%esi, %esi
	call	*indention_tac@GOTPCREL(%rip)
	movl	16(%rbx), %ecx
	addq	$8, %rsp
	movq	%rbp, %rdi
	popq	%rbx
	leaq	.LC76(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbp
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.size	output_arg, .-output_arg
	.section	.rodata.str1.1
.LC77:
	.string	"NULL"
.LC78:
	.string	"import\n"
.LC79:
	.string	"source: \"%s\"\n"
.LC80:
	.string	"parameters\n"
.LC81:
	.string	"parameters[%d]\n"
.LC82:
	.string	"class\n"
.LC83:
	.string	"members\n"
.LC84:
	.string	"method\n"
.LC85:
	.string	"variable\n"
.LC86:
	.string	"unknown_ClassMemberType: %u\n"
.LC87:
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
.L139:
	movq	40(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L163
	movl	8(%rbx), %eax
	leaq	1(%r15), %rsi
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r13, %rdi
	cmpl	$1, %eax
	je	.L140
	cmpl	$2, %eax
	je	.L141
	testl	%eax, %eax
	jne	.L142
	call	*indention@GOTPCREL(%rip)
	movq	%r13, %rcx
	leaq	2(%r15), %rbp
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC78(%rip), %rdi
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
	leaq	.LC77(%rip), %rax
	leaq	.LC79(%rip), %rdx
	testq	%rcx, %rcx
	cmove	%rax, %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L139
	.p2align 4,,10
	.p2align 3
.L140:
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
	leaq	.LC80(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	16(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	24(%rbx), %rdi
	movl	$-1, %ebx
	movq	%rax, (%rsp)
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 16(%rsp)
	jmp	.L145
	.p2align 4,,10
	.p2align 3
.L146:
	addl	$1, %ebx
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	*indention@GOTPCREL(%rip)
	movl	%ebx, %ecx
	leaq	.LC81(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	movq	%r13, %rdi
	call	*__fprintf_chk@GOTPCREL(%rip)
	leaq	4(%r15), %rdx
	movq	%r14, %rcx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	output_variable
.L145:
	movq	(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L146
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
	jmp	.L147
	.p2align 4,,10
	.p2align 3
.L148:
	movq	%r14, %rcx
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	output_statement
.L147:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L148
	jmp	.L139
	.p2align 4,,10
	.p2align 3
.L142:
	call	*indention@GOTPCREL(%rip)
	movl	8(%rbx), %ecx
	movl	$2, %esi
	movq	%r13, %rdi
	leaq	.LC87(%rip), %rdx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L139
	.p2align 4,,10
	.p2align 3
.L141:
	call	*indention@GOTPCREL(%rip)
	movq	%r13, %rcx
	leaq	2(%r15), %rbp
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC82(%rip), %rdi
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
	leaq	.LC83(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	8(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L149:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L139
	movl	8(%rbx), %eax
	testl	%eax, %eax
	je	.L150
	cmpl	$1, %eax
	je	.L151
	movq	16(%rsp), %rsi
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r13, %rdi
	call	*indention@GOTPCREL(%rip)
	movl	8(%rbx), %ecx
	movl	$2, %esi
	movq	%r13, %rdi
	leaq	.LC86(%rip), %rdx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L149
	.p2align 4,,10
	.p2align 3
.L150:
	movq	16(%rsp), %rsi
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r13, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r13, %rcx
	leaq	5(%r15), %rbp
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC84(%rip), %rdi
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
	leaq	.LC80(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	16(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	24(%rbx), %rdi
	movl	$-1, %ebx
	movq	%rax, (%rsp)
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 32(%rsp)
	jmp	.L153
	.p2align 4,,10
	.p2align 3
.L154:
	addl	$1, %ebx
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	*indention@GOTPCREL(%rip)
	movl	%ebx, %ecx
	leaq	.LC81(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	movq	%r13, %rdi
	call	*__fprintf_chk@GOTPCREL(%rip)
	leaq	6(%r15), %rdx
	movq	%r14, %rcx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	output_variable
.L153:
	movq	(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L154
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
	jmp	.L155
	.p2align 4,,10
	.p2align 3
.L156:
	movq	%r14, %rcx
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	output_statement
.L155:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L156
	jmp	.L149
	.p2align 4,,10
	.p2align 3
.L151:
	movq	16(%rsp), %rsi
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r13, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC85(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	(%rbx), %rdi
	leaq	4(%r15), %rdx
	movq	%r14, %rcx
	movq	%r13, %rsi
	call	output_variable
	jmp	.L149
	.p2align 4,,10
	.p2align 3
.L163:
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
.LC88:
	.string	"TAC: \"NULL\"\n"
.LC89:
	.string	"TAC {\n"
.LC90:
	.string	"designs: []\n"
.LC91:
	.string	"designs: [\n"
.LC92:
	.string	"NULL "
.LC93:
	.string	"%s "
.LC94:
	.string	"%zu "
.LC95:
	.string	"{}\n"
.LC96:
	.string	"{\n"
.LC97:
	.string	"NULL\t"
.LC98:
	.string	"%s\t"
.LC99:
	.string	"%zu\n"
.LC100:
	.string	"}\n"
.LC101:
	.string	"]\n"
.LC102:
	.string	"entry_point: \"NULL\"\n"
.LC103:
	.string	"entry_point: %s\n"
.LC104:
	.string	"global: []\n"
.LC105:
	.string	"global: [\n"
.LC106:
	.string	"subroutines: []\n"
.LC107:
	.string	"subroutines: [\n"
.LC108:
	.string	"NULL {\n"
.LC109:
	.string	"%s {\n"
.LC110:
	.string	"return_type: \"NULL\"\n"
.LC111:
	.string	"return_type: %s\n"
.LC112:
	.string	"parameters: []\n"
.LC113:
	.string	"parameters: [\n"
.LC114:
	.string	"local: []\n"
.LC115:
	.string	"local: [\n"
.LC116:
	.string	"instructions: []\n"
.LC117:
	.string	"instructions: [\n"
.LC118:
	.string	"add\t"
.LC119:
	.string	"sub\t"
.LC120:
	.string	"mul\t"
.LC121:
	.string	"div\t"
.LC122:
	.string	"mod\t"
.LC123:
	.string	"eq \t"
.LC124:
	.string	"ne \t"
.LC125:
	.string	"lt \t"
.LC126:
	.string	"gt \t"
.LC127:
	.string	"le \t"
.LC128:
	.string	"ge \t"
.LC129:
	.string	"and\t"
.LC130:
	.string	"or \t"
.LC131:
	.string	"not\t"
.LC132:
	.string	"assign\t"
.LC133:
	.string	"get_attr\t"
.LC134:
	.string	"get_elem\t"
.LC135:
	.string	"param\t"
.LC136:
	.string	"alloc\t"
.LC137:
	.string	"jmp_c\t"
.LC138:
	.string	"jmp\t"
.LC139:
	.string	"ret\t"
.LC140:
	.string	"call\t"
.LC141:
	.string	"load\t"
.LC142:
	.string	"store\t"
.LC143:
	.string	"INST_NONE\n"
.LC144:
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
	je	.L247
	call	*indention_tac@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r15, %rcx
	movl	$6, %edx
	leaq	.LC89(%rip), %rdi
	leaq	1(%r14), %r13
	call	*fwrite@GOTPCREL(%rip)
	movq	32(%rsp), %rax
	movq	(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	movq	%r13, %rsi
	movq	%r15, %rdi
	testb	%al, %al
	je	.L166
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC90(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	leaq	.LC100(%rip), %rax
	movq	%rax, 16(%rsp)
.L167:
	movq	32(%rsp), %rax
	movq	%r13, %rsi
	movq	%r15, %rdi
	cmpq	$0, 8(%rax)
	je	.L248
	call	*indention_tac@GOTPCREL(%rip)
	movq	32(%rsp), %rax
	movl	$2, %esi
	movq	%r15, %rdi
	leaq	.LC103(%rip), %rdx
	movq	8(%rax), %rax
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L181:
	movq	32(%rsp), %rax
	movq	16(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	movq	%r13, %rsi
	movq	%r15, %rdi
	testb	%al, %al
	je	.L182
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$11, %edx
	movl	$1, %esi
	leaq	.LC104(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L183:
	movq	32(%rsp), %rax
	movq	24(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	movq	%r13, %rsi
	movq	%r15, %rdi
	testb	%al, %al
	je	.L186
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC106(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L187:
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	16(%rsp), %rdi
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
.L246:
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*fwrite@GOTPCREL(%rip)
.L166:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$11, %edx
	movl	$1, %esi
	leaq	.LC91(%rip), %rdi
	leaq	.LC93(%rip), %r12
	call	*fwrite@GOTPCREL(%rip)
	leaq	.LC100(%rip), %rax
	movq	32(%rsp), %rbx
	movq	%rax, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L168:
	movq	(%rbx), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L249
	leaq	2(%r14), %rax
	cmpq	$0, 8(%rbp)
	movq	%rax, 8(%rsp)
	je	.L250
	movq	8(%rsp), %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rbp), %rax
	movq	%r12, %rdx
	movq	%r15, %rdi
	movl	$2, %esi
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L170:
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movl	$2, %esi
	movq	16(%rbp), %rcx
	xorl	%eax, %eax
	leaq	.LC94(%rip), %rdx
	movq	%r15, %rdi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	0(%rbp), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	xorl	%esi, %esi
	movq	%r15, %rdi
	testb	%al, %al
	je	.L171
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	.LC95(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L168
	.p2align 4,,10
	.p2align 3
.L171:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC96(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, 24(%rsp)
	jmp	.L173
	.p2align 4,,10
	.p2align 3
.L174:
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%r13), %rax
	movq	%r15, %rdi
	movl	$2, %esi
	leaq	.LC98(%rip), %rdx
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	xorl	%esi, %esi
	cmpq	$0, 0(%r13)
	movq	%r15, %rdi
	je	.L251
.L176:
	call	*indention_tac@GOTPCREL(%rip)
	movq	0(%r13), %rax
	movq	%r12, %rdx
	movq	%r15, %rdi
	movl	$2, %esi
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L177:
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	16(%r13), %rcx
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC99(%rip), %rdx
	movq	%r15, %rdi
	call	*__fprintf_chk@GOTPCREL(%rip)
.L173:
	movq	0(%rbp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L252
	cmpq	$0, 8(%r13)
	leaq	3(%r14), %rsi
	movq	%r15, %rdi
	jne	.L174
	call	*indention_tac@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r15, %rcx
	leaq	.LC97(%rip), %rdi
	movl	$5, %edx
	call	*fwrite@GOTPCREL(%rip)
	xorl	%esi, %esi
	cmpq	$0, 0(%r13)
	movq	%r15, %rdi
	jne	.L176
.L251:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC92(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L177
	.p2align 4,,10
	.p2align 3
.L252:
	movq	8(%rsp), %rsi
	movq	%r15, %rdi
	movq	24(%rsp), %r13
	call	*indention_tac@GOTPCREL(%rip)
	movq	16(%rsp), %rdi
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L168
	.p2align 4,,10
	.p2align 3
.L250:
	movq	%r15, %rdi
	movq	%rax, %rsi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC92(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L170
.L249:
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	leaq	.LC101(%rip), %r8
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	movq	%r8, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L167
.L186:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC107(%rip), %rdi
	leaq	.L211(%rip), %r12
	call	*fwrite@GOTPCREL(%rip)
	leaq	.LC101(%rip), %r8
	movq	%r13, 56(%rsp)
	movq	%r8, 40(%rsp)
	jmp	.L188
	.p2align 4,,10
	.p2align 3
.L256:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC112(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L194:
	movq	24(%rbp), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	movq	%r13, %rsi
	movq	%r15, %rdi
	testb	%al, %al
	je	.L197
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC114(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L198:
	movq	32(%rbp), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	movq	%r13, %rsi
	movq	%r15, %rdi
	testb	%al, %al
	je	.L201
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC116(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L202:
	movq	24(%rsp), %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	16(%rsp), %rdi
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	call	*fwrite@GOTPCREL(%rip)
.L188:
	movq	32(%rsp), %rax
	movq	24(%rax), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L253
	leaq	2(%r14), %rax
	cmpq	$0, 0(%rbp)
	movq	%rax, 24(%rsp)
	je	.L254
	movq	24(%rsp), %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	0(%rbp), %rax
	movl	$2, %esi
	movq	%r15, %rdi
	leaq	.LC109(%rip), %rdx
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L190:
	leaq	3(%r14), %r13
	cmpq	$0, 8(%rbp)
	movq	%r15, %rdi
	movq	%r13, %rsi
	je	.L255
	call	*indention_tac@GOTPCREL(%rip)
	movq	8(%rbp), %rax
	movl	$2, %esi
	movq	%r15, %rdi
	leaq	.LC111(%rip), %rdx
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L192:
	movq	16(%rbp), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	movq	%r13, %rsi
	movq	%r15, %rdi
	testb	%al, %al
	jne	.L256
	call	*indention_tac@GOTPCREL(%rip)
	leaq	4(%r14), %rbx
	movq	%r15, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC113(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L195
	.p2align 4,,10
	.p2align 3
.L196:
	movq	%rbx, %rdx
	movq	%r15, %rsi
	call	output_var
.L195:
	movq	16(%rbp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L196
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	40(%rsp), %rdi
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L194
	.p2align 4,,10
	.p2align 3
.L201:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC117(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%rbp, 8(%rsp)
	movq	%r13, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L203:
	movq	8(%rsp), %rax
	movq	32(%rax), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L257
	leaq	4(%r14), %r13
	cmpq	$0, (%rbx)
	movq	%r15, %rdi
	movq	%r13, %rsi
	je	.L258
	call	*indention_tac@GOTPCREL(%rip)
	movq	(%rbx), %rax
	movl	$2, %esi
	movq	%r15, %rdi
	leaq	.LC93(%rip), %rdx
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L205:
	movq	8(%rbx), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	xorl	%esi, %esi
	movq	%r15, %rdi
	testb	%al, %al
	je	.L206
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	.LC95(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L203
	.p2align 4,,10
	.p2align 3
.L206:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC96(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L208:
	movq	8(%rbx), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L259
	cmpl	$25, 24(%rbp)
	leaq	5(%r14), %rsi
	ja	.L209
	movl	24(%rbp), %eax
	movq	%r15, %rdi
	movslq	(%r12,%rax,4), %rax
	addq	%r12, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L211:
	.long	.L236-.L211
	.long	.L235-.L211
	.long	.L234-.L211
	.long	.L233-.L211
	.long	.L232-.L211
	.long	.L231-.L211
	.long	.L230-.L211
	.long	.L229-.L211
	.long	.L228-.L211
	.long	.L227-.L211
	.long	.L226-.L211
	.long	.L225-.L211
	.long	.L224-.L211
	.long	.L223-.L211
	.long	.L222-.L211
	.long	.L221-.L211
	.long	.L220-.L211
	.long	.L219-.L211
	.long	.L218-.L211
	.long	.L217-.L211
	.long	.L216-.L211
	.long	.L215-.L211
	.long	.L214-.L211
	.long	.L213-.L211
	.long	.L212-.L211
	.long	.L210-.L211
	.text
	.p2align 4,,10
	.p2align 3
.L212:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC142(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L237:
	movq	0(%rbp), %rdi
	movq	%r15, %rsi
	call	output_arg
	movl	24(%rbp), %ecx
	cmpl	$24, %ecx
	ja	.L208
	movl	$1, %eax
	salq	%cl, %rax
	testl	$4825087, %eax
	jne	.L239
	testl	$25583616, %eax
	jne	.L240
	testl	$3145728, %eax
	je	.L208
.L241:
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rsi
	movl	$10, %edi
	call	*fputc@GOTPCREL(%rip)
	jmp	.L208
	.p2align 4,,10
	.p2align 3
.L213:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC141(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L214:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC140(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L215:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC139(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L216:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC138(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L217:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC137(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L218:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC136(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L219:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC135(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L220:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC134(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L221:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC133(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L222:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC132(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L223:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC131(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L224:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC130(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L225:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC129(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L226:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC128(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L227:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC127(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L228:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC126(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L229:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC125(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L230:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC124(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L231:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC123(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L232:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC122(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L233:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC121(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L234:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC120(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L235:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC119(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L236:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC118(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L210:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC143(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L208
	.p2align 4,,10
	.p2align 3
.L240:
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rsi
	movl	$32, %edi
	call	*fputc@GOTPCREL(%rip)
	movq	8(%rbp), %rdi
	movq	%r15, %rsi
	call	output_arg
	jmp	.L241
	.p2align 4,,10
	.p2align 3
.L239:
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
	jmp	.L241
	.p2align 4,,10
	.p2align 3
.L259:
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	16(%rsp), %rdi
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L203
	.p2align 4,,10
	.p2align 3
.L258:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC92(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L205
	.p2align 4,,10
	.p2align 3
.L257:
	movq	48(%rsp), %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	40(%rsp), %rdi
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L202
	.p2align 4,,10
	.p2align 3
.L197:
	call	*indention_tac@GOTPCREL(%rip)
	leaq	4(%r14), %rbx
	movq	%r15, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC115(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L199
	.p2align 4,,10
	.p2align 3
.L200:
	movq	%rbx, %rdx
	movq	%r15, %rsi
	call	output_var
.L199:
	movq	24(%rbp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L200
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	40(%rsp), %rdi
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L198
.L209:
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movl	24(%rbp), %ecx
	movl	$2, %esi
	movq	%r15, %rdi
	leaq	.LC144(%rip), %rdx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L208
	.p2align 4,,10
	.p2align 3
.L255:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	.LC110(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L192
	.p2align 4,,10
	.p2align 3
.L254:
	movq	%r15, %rdi
	movq	%rax, %rsi
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC108(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L190
.L182:
	call	*indention_tac@GOTPCREL(%rip)
	leaq	2(%r14), %rbx
	movq	%r15, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC105(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	32(%rsp), %rbp
	jmp	.L184
	.p2align 4,,10
	.p2align 3
.L185:
	movq	%rbx, %rdx
	movq	%r15, %rsi
	call	output_var
.L184:
	movq	16(%rbp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L185
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	leaq	.LC101(%rip), %r8
	movq	%r15, %rcx
	movl	$2, %edx
	movl	$1, %esi
	movq	%r8, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L183
.L253:
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
	jmp	.L187
.L248:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	.LC102(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L181
.L247:
	call	*indention_tac@GOTPCREL(%rip)
	movq	%r15, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC88(%rip), %rdi
	jmp	.L246
	.size	output_TAC, .-output_TAC
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
