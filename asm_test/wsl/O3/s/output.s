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
	movl	$21, %edx
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
.L121:
	movq	40(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L145
	movl	8(%rbx), %eax
	leaq	1(%r15), %rsi
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r13, %rdi
	cmpl	$1, %eax
	je	.L122
	cmpl	$2, %eax
	je	.L123
	testl	%eax, %eax
	jne	.L124
	call	*indention@GOTPCREL(%rip)
	movq	%r13, %rcx
	leaq	2(%r15), %rbp
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC67(%rip), %rdi
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
	leaq	.LC66(%rip), %rax
	leaq	.LC68(%rip), %rdx
	testq	%rcx, %rcx
	cmove	%rax, %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L121
	.p2align 4,,10
	.p2align 3
.L122:
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
	leaq	.LC69(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	16(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	24(%rbx), %rdi
	movl	$-1, %ebx
	movq	%rax, (%rsp)
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 16(%rsp)
	jmp	.L127
	.p2align 4,,10
	.p2align 3
.L128:
	addl	$1, %ebx
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	*indention@GOTPCREL(%rip)
	movl	%ebx, %ecx
	leaq	.LC70(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	movq	%r13, %rdi
	call	*__fprintf_chk@GOTPCREL(%rip)
	leaq	4(%r15), %rdx
	movq	%r14, %rcx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	output_variable
.L127:
	movq	(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L128
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
	jmp	.L129
	.p2align 4,,10
	.p2align 3
.L130:
	movq	%r14, %rcx
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	output_statement
.L129:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L130
	jmp	.L121
	.p2align 4,,10
	.p2align 3
.L124:
	call	*indention@GOTPCREL(%rip)
	movl	8(%rbx), %ecx
	movl	$2, %esi
	movq	%r13, %rdi
	leaq	.LC76(%rip), %rdx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L121
	.p2align 4,,10
	.p2align 3
.L123:
	call	*indention@GOTPCREL(%rip)
	movq	%r13, %rcx
	leaq	2(%r15), %rbp
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC71(%rip), %rdi
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
	leaq	.LC72(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	8(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
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
	movq	16(%rsp), %rsi
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r13, %rdi
	call	*indention@GOTPCREL(%rip)
	movl	8(%rbx), %ecx
	movl	$2, %esi
	movq	%r13, %rdi
	leaq	.LC75(%rip), %rdx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L131
	.p2align 4,,10
	.p2align 3
.L132:
	movq	16(%rsp), %rsi
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r13, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r13, %rcx
	leaq	5(%r15), %rbp
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC73(%rip), %rdi
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
	leaq	.LC69(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	16(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	24(%rbx), %rdi
	movl	$-1, %ebx
	movq	%rax, (%rsp)
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 32(%rsp)
	jmp	.L135
	.p2align 4,,10
	.p2align 3
.L136:
	addl	$1, %ebx
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	*indention@GOTPCREL(%rip)
	movl	%ebx, %ecx
	leaq	.LC70(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	movq	%r13, %rdi
	call	*__fprintf_chk@GOTPCREL(%rip)
	leaq	6(%r15), %rdx
	movq	%r14, %rcx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	output_variable
.L135:
	movq	(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L136
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
	jmp	.L137
	.p2align 4,,10
	.p2align 3
.L138:
	movq	%r14, %rcx
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	output_statement
.L137:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L138
	jmp	.L131
	.p2align 4,,10
	.p2align 3
.L133:
	movq	16(%rsp), %rsi
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r13, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	%r13, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC74(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	(%rbx), %rdi
	leaq	4(%r15), %rdx
	movq	%r14, %rcx
	movq	%r13, %rsi
	call	output_variable
	jmp	.L131
	.p2align 4,,10
	.p2align 3
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
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
