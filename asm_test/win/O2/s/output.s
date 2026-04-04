	.file	"output.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Name: \"NULL\"\12\0"
.LC1:
	.ascii "name: \"%s\"\12\0"
.LC2:
	.ascii "id: %zu\12\0"
.LC3:
	.ascii "kind: \"type\"\12\0"
.LC4:
	.ascii "kind: \"variable\"\12\0"
.LC5:
	.ascii "type\12\0"
.LC6:
	.ascii "kind: \"function\"\12\0"
.LC7:
	.ascii "return_type\12\0"
.LC8:
	.ascii "kind: \"method\"\12\0"
.LC9:
	.ascii "kind: \"class\"\12\0"
.LC10:
	.ascii "kind: \"attribute\"\12\0"
.LC11:
	.ascii "kind: \"parameter\"\12\0"
.LC12:
	.ascii "kind: \"unknown_NameType\"\12\0"
	.text
	.p2align 4
	.def	output_name;	.scl	3;	.type	32;	.endef
output_name:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%r8, %r12
	pushq	%rbp
	pushq	%rdi
	movq	%r9, %rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$40, %rsp
	testq	%rcx, %rcx
	je	.L2
	movq	%rcx, %rsi
	addq	$1, %r12
	leaq	.LC1(%rip), %r15
	leaq	.LC2(%rip), %r14
	leaq	.L7(%rip), %r13
.L4:
	leaq	-1(%r12), %rbp
	movq	%rdi, %r9
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	movq	%rbp, %rdx
	call	indention
	movq	8(%rsi), %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	fprintf
	xorl	%r8d, %r8d
	movq	%rdi, %r9
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	16(%rsi), %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	fprintf
	cmpl	$6, 32(%rsi)
	ja	.L5
	movl	32(%rsi), %eax
	movq	%rdi, %r9
	movslq	0(%r13,%rax,4), %rax
	addq	%r13, %rax
	jmp	*%rax
	.section .rdata,"dr"
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
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC10(%rip), %rcx
.L21:
	call	fwrite
	movq	%rdi, %r9
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rsi
.L14:
	leaq	1(%r12), %rax
	testq	%rsi, %rsi
	je	.L2
	movq	%rax, %r12
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L9:
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rcx
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L10:
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rcx
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L11:
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC8(%rip), %rcx
.L22:
	call	fwrite
	movq	%rdi, %r9
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rsi
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L12:
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC6(%rip), %rcx
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L13:
	movl	$1, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC9(%rip), %rcx
.L23:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L6:
	movl	$1, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC3(%rip), %rcx
	jmp	.L23
.L5:
	movq	%rdi, %r9
	movl	$1, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$25, %r8d
	movl	$1, %edx
	leaq	.LC12(%rip), %rcx
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L2:
	movq	%rdi, %r9
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	jmp	.L23
	.section .rdata,"dr"
.LC13:
	.ascii "UNKNOWN_OPERATOR\0"
.LC14:
	.ascii "primary\12\0"
.LC15:
	.ascii "type: \"integer\"\12\0"
.LC16:
	.ascii "value: %s\12\0"
.LC17:
	.ascii "type: \"float\"\12\0"
.LC18:
	.ascii "type: \"string\"\12\0"
.LC19:
	.ascii "value: \"%s\"\12\0"
.LC20:
	.ascii "type: \"boolean\"\12\0"
.LC21:
	.ascii "value: \"true\"\12\0"
.LC22:
	.ascii "value: \"false\"\12\0"
.LC23:
	.ascii "type: \"expression\"\12\0"
.LC24:
	.ascii "value\12\0"
.LC25:
	.ascii "type: \"!\"\12\0"
.LC26:
	.ascii "type: \"-\"\12\0"
.LC27:
	.ascii "type: \"variable\"\12\0"
.LC28:
	.ascii "unknown_PrimaryType: %u\12\0"
.LC29:
	.ascii "operator: \"%s\"\12\0"
.LC30:
	.ascii "left\12\0"
.LC31:
	.ascii "right\12\0"
	.text
	.p2align 4
	.def	output_expression;	.scl	3;	.type	32;	.endef
output_expression:
	pushq	%r15
	leaq	.L30(%rip), %r15
	pushq	%r14
	movq	%rcx, %r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	movq	%r9, %rdi
	pushq	%rsi
	movq	%r8, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$40, %rsp
.L39:
	movl	24(%r14), %ecx
	leaq	.LC30(%rip), %r13
	leaq	.LC13(%rip), %rbp
	cmpl	$19, %ecx
	je	.L54
.L26:
	call	operator_to_string
	movq	%rdi, %r9
	xorl	%r8d, %r8d
	movq	%rsi, %rdx
	movq	%rax, %r12
	movq	%rbx, %rcx
	call	indention
	testq	%r12, %r12
	movq	%r12, %r8
	movq	%rbx, %rcx
	cmove	%rbp, %r8
	leaq	.LC29(%rip), %rdx
	leaq	1(%rsi), %r12
	call	fprintf
	movq	%rdi, %r9
	xorl	%r8d, %r8d
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$1, %edx
	movq	%r13, %rcx
	movl	$5, %r8d
	call	fwrite
	movq	(%r14), %rcx
	movq	%rdi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_expression
	movq	%rdi, %r9
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	leaq	.LC31(%rip), %rcx
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	call	fwrite
	movq	16(%r14), %r14
	movl	24(%r14), %ecx
	cmpl	$19, %ecx
	je	.L42
	movq	%r12, %rsi
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L54:
	movq	%rsi, %r12
.L42:
	movq	%rdi, %r9
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC14(%rip), %rcx
	leaq	2(%r12), %rsi
	call	fwrite
	movq	8(%r14), %rbp
.L27:
	cmpl	$8, 8(%rbp)
	leaq	-1(%rsi), %r12
	ja	.L28
	movl	8(%rbp), %eax
	movq	%rdi, %r9
	xorl	%r8d, %r8d
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movslq	(%r15,%rax,4), %rax
	addq	%r15, %rax
	jmp	*%rax
	.section .rdata,"dr"
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
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC26(%rip), %rcx
.L50:
	call	fwrite
	movq	%rdi, %r9
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	addq	$1, %rsi
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC24(%rip), %rcx
	call	fwrite
	movq	0(%rbp), %rbp
	jmp	.L27
	.p2align 4,,10
	.p2align 3
.L29:
	call	indention
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC27(%rip), %rcx
	call	fwrite
	movq	%rdi, %r9
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC24(%rip), %rcx
	call	fwrite
	movq	0(%rbp), %rcx
	addq	$40, %rsp
	movq	%rdi, %r9
	movq	%rsi, %r8
	movq	%rbx, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	output_variable_access
	.p2align 4,,10
	.p2align 3
.L38:
	call	indention
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC15(%rip), %rcx
.L51:
	call	fwrite
	movq	%r12, %rdx
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	0(%rbp), %r8
	leaq	.LC16(%rip), %rdx
.L52:
	addq	$40, %rsp
	movq	%rbx, %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L37:
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC17(%rip), %rcx
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L36:
	call	indention
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC18(%rip), %rcx
	call	fwrite
	movq	%r12, %rdx
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	0(%rbp), %r8
	leaq	.LC19(%rip), %rdx
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L35:
	call	indention
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC20(%rip), %rcx
	call	fwrite
	movq	%rdi, %r9
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC21(%rip), %rcx
.L53:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L34:
	call	indention
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC20(%rip), %rcx
	call	fwrite
	movq	%rdi, %r9
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC22(%rip), %rcx
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L33:
	call	indention
	movq	%rbx, %r9
	movl	$19, %r8d
	movl	$1, %edx
	leaq	.LC23(%rip), %rcx
	call	fwrite
	movq	%rdi, %r9
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC24(%rip), %rcx
	call	fwrite
	movq	0(%rbp), %r14
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L32:
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC25(%rip), %rcx
	jmp	.L50
.L28:
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movq	%rdi, %r9
	movl	$1, %r8d
	call	indention
	movl	8(%rbp), %r8d
	addq	$40, %rsp
	movq	%rbx, %rcx
	leaq	.LC28(%rip), %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fprintf
	.section .rdata,"dr"
.LC32:
	.ascii "name\12\0"
.LC33:
	.ascii "value: \"NULL\"\12\0"
	.text
	.p2align 4
	.def	output_variable;	.scl	3;	.type	32;	.endef
output_variable:
	pushq	%r12
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rdi
	movq	%r8, %rdi
	xorl	%r8d, %r8d
	pushq	%rsi
	movq	%r9, %rsi
	leaq	1(%rdi), %r12
	pushq	%rbx
	movq	%rdx, %rbx
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	subq	$32, %rsp
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rcx
	call	fwrite
	movq	0(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_name
	xorl	%r8d, %r8d
	movq	%rsi, %r9
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC32(%rip), %rcx
	call	fwrite
	movq	8(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_name
	cmpq	$0, 16(%rbp)
	movq	%rsi, %r9
	movq	%rdi, %rdx
	movl	$1, %r8d
	movq	%rbx, %rcx
	je	.L56
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC24(%rip), %rcx
	call	fwrite
	movq	16(%rbp), %rcx
	addq	$32, %rsp
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	output_expression
	.p2align 4,,10
	.p2align 3
.L56:
	call	indention
	addq	$32, %rsp
	movq	%rbx, %r9
	movl	$14, %r8d
	popq	%rbx
	movl	$1, %edx
	leaq	.LC33(%rip), %rcx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	fwrite
	.section .rdata,"dr"
.LC34:
	.ascii "type: \"name\"\12\0"
.LC35:
	.ascii "type: \"function_call\"\12\0"
.LC36:
	.ascii "function\12\0"
.LC37:
	.ascii "arguments\12\0"
.LC38:
	.ascii "arguments[%d]\12\0"
.LC39:
	.ascii "type: \"get sequence_element\"\12\0"
.LC40:
	.ascii "sequence\12\0"
.LC41:
	.ascii "index\12\0"
.LC42:
	.ascii "type: \"get_attribute\"\12\0"
.LC43:
	.ascii "object\12\0"
.LC44:
	.ascii "attribute_name\12\0"
	.align 8
.LC45:
	.ascii "unknown_VariableAccessType: %u\12\0"
	.text
	.p2align 4
	.def	output_variable_access;	.scl	3;	.type	32;	.endef
output_variable_access:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%r8, %rbp
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	movq	%r9, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$40, %rsp
	movl	16(%rcx), %eax
	cmpl	$2, %eax
	je	.L59
	ja	.L60
	testl	%eax, %eax
	je	.L73
	movq	8(%rcx), %rcx
	leaq	1(%rbp), %r14
	movl	$-1, %r12d
	leaq	.LC38(%rip), %r15
	call	list_copy
	movq	%rbp, %rdx
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	movq	%rax, %r13
	call	indention
	movq	%rbx, %r9
	movl	$22, %r8d
	movl	$1, %edx
	leaq	.LC35(%rip), %rcx
	call	fwrite
	movq	%rbp, %rdx
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC36(%rip), %rcx
	call	fwrite
	movq	(%rdi), %rcx
	movq	%rsi, %r9
	movq	%r14, %r8
	movq	%rbx, %rdx
	call	output_variable_access
	movq	%rbp, %rdx
	movq	%rsi, %r9
	movq	%rbx, %rcx
	movl	$1, %r8d
	addq	$2, %rbp
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC37(%rip), %rcx
	call	fwrite
	jmp	.L65
	.p2align 4,,10
	.p2align 3
.L66:
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	indention
	addl	$1, %r12d
	movq	%r15, %rdx
	movq	%rbx, %rcx
	movl	%r12d, %r8d
	call	fprintf
	movq	%rsi, %r9
	movq	%rbp, %r8
	movq	%rbx, %rdx
	movq	%rdi, %rcx
	call	output_expression
.L65:
	movq	%r13, %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L66
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
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
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	leaq	1(%rbp), %r12
	xorl	%r8d, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$29, %r8d
	movl	$1, %edx
	leaq	.LC39(%rip), %rcx
	call	fwrite
	movq	%rsi, %r9
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC40(%rip), %rcx
	call	fwrite
	movq	(%rdi), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_variable_access
	movq	%rsi, %r9
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC41(%rip), %rcx
	call	fwrite
	movq	8(%rdi), %rcx
	addq	$40, %rsp
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	output_expression
	.p2align 4,,10
	.p2align 3
.L59:
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	leaq	1(%rbp), %r12
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$22, %r8d
	movl	$1, %edx
	leaq	.LC42(%rip), %rcx
	call	fwrite
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC43(%rip), %rcx
	call	fwrite
	movq	(%rdi), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_variable_access
	movq	%rsi, %r9
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$15, %r8d
	leaq	.LC44(%rip), %rcx
	movl	$1, %edx
	call	fwrite
	movq	8(%rdi), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
.L72:
	addq	$40, %rsp
	movq	%rbx, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	output_name
	.p2align 4,,10
	.p2align 3
.L73:
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC34(%rip), %rcx
	call	fwrite
	movq	%rsi, %r9
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	leaq	.LC32(%rip), %rcx
	movl	$1, %edx
	call	fwrite
	movq	8(%rdi), %rcx
	movq	%rsi, %r9
	leaq	1(%rbp), %r8
	jmp	.L72
	.p2align 4,,10
	.p2align 3
.L74:
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movl	16(%rdi), %r8d
	addq	$40, %rsp
	movq	%rbx, %rcx
	leaq	.LC45(%rip), %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fprintf
	.section .rdata,"dr"
.LC46:
	.ascii "if_statement\12\0"
.LC47:
	.ascii "condition\12\0"
.LC48:
	.ascii "body\12\0"
.LC49:
	.ascii "else_if\12\0"
.LC50:
	.ascii "else_body\12\0"
.LC51:
	.ascii "for_statement\12\0"
.LC52:
	.ascii "initializer\12\0"
.LC53:
	.ascii "initializer: \"NULL\"\12\0"
.LC54:
	.ascii "condition: \"NULL\"\12\0"
.LC55:
	.ascii "increment\12\0"
.LC56:
	.ascii "increment: \"NULL\"\12\0"
.LC57:
	.ascii "while_statement\12\0"
	.align 8
.LC58:
	.ascii "variable_declaration_statement\12\0"
.LC59:
	.ascii "return_statement: \"NULL\"\12\0"
.LC60:
	.ascii "return_statement\12\0"
.LC61:
	.ascii "break_statement: \"NULL\"\12\0"
.LC62:
	.ascii "continue_statement: \"NULL\"\12\0"
.LC63:
	.ascii "expression_statement: \"NULL\"\12\0"
.LC64:
	.ascii "expression_statement\12\0"
.LC65:
	.ascii "unknown_StatementType: %u\12\0"
	.text
	.p2align 4
	.def	output_statement;	.scl	3;	.type	32;	.endef
output_statement:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rdi
	movq	%r8, %rdi
	pushq	%rsi
	movq	%r9, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$72, %rsp
	cmpl	$7, 8(%rcx)
	ja	.L76
	movl	8(%rcx), %eax
	leaq	.L78(%rip), %rdx
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	movq	%rdi, %rdx
	jmp	*%rax
	.section .rdata,"dr"
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
	call	indention
	movq	%rbx, %r9
	movl	$24, %r8d
	movl	$1, %edx
	leaq	.LC61(%rip), %rcx
.L109:
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L77:
	call	indention
	movq	%rbx, %r9
	movl	$27, %r8d
	movl	$1, %edx
	leaq	.LC62(%rip), %rcx
	jmp	.L109
	.p2align 4,,10
	.p2align 3
.L85:
	cmpq	$0, 0(%rbp)
	je	.L111
	call	indention
	movq	%rbx, %r9
	movl	$21, %r8d
	movl	$1, %edx
	leaq	.LC64(%rip), %rcx
.L110:
	call	fwrite
	movq	0(%rbp), %rcx
	addq	$72, %rsp
	movq	%rsi, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	output_expression
	.p2align 4,,10
	.p2align 3
.L84:
	call	indention
	movq	%rbx, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC58(%rip), %rcx
	call	fwrite
	movq	0(%rbp), %rcx
	addq	$72, %rsp
	movq	%rsi, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	output_variable
	.p2align 4,,10
	.p2align 3
.L83:
	call	indention
	movq	%rbx, %r9
	leaq	1(%rdi), %r13
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC46(%rip), %rcx
	movq	%r13, %r12
	call	fwrite
	movq	0(%rbp), %r14
	movq	%r13, 56(%rsp)
	leaq	2(%rdi), %rbp
	movq	8(%r14), %rcx
	call	list_copy
	movq	16(%r14), %rcx
	movq	%rax, %r15
	call	list_copy
	movq	24(%r14), %rcx
	movq	%rax, 40(%rsp)
	call	list_copy
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	leaq	.LC47(%rip), %r13
	movq	%rax, 48(%rsp)
	call	indention
	movq	%rbx, %r9
	movq	%r13, %rcx
	movl	$1, %edx
	movl	$10, %r8d
	call	fwrite
	movq	(%r14), %rcx
	movq	%rsi, %r9
	movq	%rbp, %r8
	movq	%rbx, %rdx
	leaq	.LC48(%rip), %r14
	call	output_expression
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$1, %edx
	movq	%r14, %rcx
	movl	$5, %r8d
	call	fwrite
	jmp	.L86
	.p2align 4,,10
	.p2align 3
.L87:
	movq	%rbp, %r8
	movq	%rbx, %rdx
	call	output_statement
.L86:
	movq	%r15, %rcx
	call	list_pop
	movq	%rsi, %r9
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L87
	movq	56(%rsp), %rdx
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	leaq	3(%rdi), %r15
	call	indention
	movq	%rbx, %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC49(%rip), %rcx
	call	fwrite
.L88:
	movq	40(%rsp), %rcx
	call	list_pop
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L112
	movq	8(%r12), %rcx
	call	list_copy
	xorl	%r8d, %r8d
	movq	%rsi, %r9
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movq	%rax, %rdi
	call	indention
	movq	%rbx, %r9
	movl	$1, %edx
	movq	%r13, %rcx
	movl	$10, %r8d
	call	fwrite
	movq	(%r12), %rcx
	movq	%rsi, %r9
	movq	%r15, %r8
	movq	%rbx, %rdx
	call	output_expression
	movq	%rsi, %r9
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%r14, %rcx
	movq	%rbx, %r9
	movl	$1, %edx
	movl	$5, %r8d
	call	fwrite
	movq	%rdi, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L88
.L90:
	movq	%rax, %rcx
	movq	%rsi, %r9
	movq	%r15, %r8
	movq	%rbx, %rdx
	call	output_statement
	movq	%rdi, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L90
	jmp	.L88
	.p2align 4,,10
	.p2align 3
.L82:
	call	indention
	movq	%rbx, %r9
	leaq	1(%rdi), %r12
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC57(%rip), %rcx
	addq	$2, %rdi
	call	fwrite
	movq	0(%rbp), %r13
	movq	8(%r13), %rcx
	call	list_copy
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movq	%rax, %rbp
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC47(%rip), %rcx
	call	fwrite
	movq	0(%r13), %rcx
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	output_expression
	movq	%rsi, %r9
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC48(%rip), %rcx
	call	fwrite
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L105:
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	output_statement
.L104:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L105
.L75:
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L81:
	call	indention
	movq	%rbx, %r9
	leaq	1(%rdi), %r13
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC51(%rip), %rcx
	call	fwrite
	movq	0(%rbp), %r12
	movq	24(%r12), %rcx
	call	list_copy
	xorl	%r8d, %r8d
	cmpq	$0, (%r12)
	movq	%rsi, %r9
	movq	%rax, %rbp
	movq	%r13, %rdx
	movq	%rbx, %rcx
	je	.L95
	call	indention
	movq	%rbx, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC52(%rip), %rcx
	call	fwrite
	movq	(%r12), %rcx
	movq	%rsi, %r9
	leaq	2(%rdi), %r8
	movq	%rbx, %rdx
	call	output_variable
.L96:
	xorl	%r8d, %r8d
	cmpq	$0, 8(%r12)
	movq	%rsi, %r9
	movq	%r13, %rdx
	movq	%rbx, %rcx
	je	.L97
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC47(%rip), %rcx
	call	fwrite
	movq	8(%r12), %rcx
	movq	%rsi, %r9
	movq	%rbx, %rdx
	leaq	2(%rdi), %r8
	call	output_expression
.L98:
	xorl	%r8d, %r8d
	cmpq	$0, 16(%r12)
	movq	%rsi, %r9
	movq	%r13, %rdx
	movq	%rbx, %rcx
	je	.L99
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC55(%rip), %rcx
	call	fwrite
	movq	16(%r12), %rcx
	movq	%rsi, %r9
	movq	%rbx, %rdx
	leaq	2(%rdi), %r8
	call	output_expression
.L100:
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	addq	$2, %rdi
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC48(%rip), %rcx
	call	fwrite
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L102:
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	output_statement
.L101:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L102
	jmp	.L75
	.p2align 4,,10
	.p2align 3
.L80:
	cmpq	$0, 0(%rbp)
	je	.L113
	call	indention
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC60(%rip), %rcx
	jmp	.L110
.L76:
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	call	indention
	movl	8(%rbp), %r8d
	addq	$72, %rsp
	movq	%rbx, %rcx
	leaq	.LC65(%rip), %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L112:
	movq	56(%rsp), %rdx
	movq	%rsi, %r9
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC50(%rip), %rcx
	call	fwrite
	jmp	.L92
	.p2align 4,,10
	.p2align 3
.L93:
	movq	%rsi, %r9
	movq	%rbp, %r8
	movq	%rbx, %rdx
	call	output_statement
.L92:
	movq	48(%rsp), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L93
	jmp	.L75
.L95:
	call	indention
	movq	%rbx, %r9
	movl	$20, %r8d
	movl	$1, %edx
	leaq	.LC53(%rip), %rcx
	call	fwrite
	jmp	.L96
.L99:
	call	indention
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC56(%rip), %rcx
	call	fwrite
	jmp	.L100
.L97:
	call	indention
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC54(%rip), %rcx
	call	fwrite
	jmp	.L98
.L111:
	call	indention
	movq	%rbx, %r9
	movl	$29, %r8d
	movl	$1, %edx
	leaq	.LC63(%rip), %rcx
	jmp	.L109
.L113:
	call	indention
	movq	%rbx, %r9
	movl	$25, %r8d
	movl	$1, %edx
	leaq	.LC59(%rip), %rcx
	jmp	.L109
	.section .rdata,"dr"
.LC66:
	.ascii "Var: \"NULL\"\12\0"
.LC67:
	.ascii "NULL\11%s\12\0"
.LC68:
	.ascii "%s\11%s\12\0"
	.text
	.p2align 4
	.def	output_var;	.scl	3;	.type	32;	.endef
output_var:
	pushq	%rsi
	movq	%rdx, %rsi
	movq	%r8, %rdx
	pushq	%rbx
	subq	$40, %rsp
	testq	%rcx, %rcx
	je	.L118
	movq	%rcx, %rbx
	movq	%rsi, %rcx
	cmpq	$0, 16(%rbx)
	je	.L119
	call	indention_tac
	movq	16(%rbx), %rax
	movq	8(%rbx), %r9
	movq	%rsi, %rcx
	leaq	.LC68(%rip), %rdx
	movq	8(%rax), %r8
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L119:
	call	indention_tac
	movq	8(%rbx), %r8
	addq	$40, %rsp
	movq	%rsi, %rcx
	popq	%rbx
	leaq	.LC67(%rip), %rdx
	popq	%rsi
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L118:
	movq	%rsi, %rcx
	call	indention_tac
	addq	$40, %rsp
	movq	%rsi, %r9
	movl	$12, %r8d
	popq	%rbx
	movl	$1, %edx
	leaq	.LC66(%rip), %rcx
	popq	%rsi
	jmp	fwrite
	.section .rdata,"dr"
.LC69:
	.ascii "true\0"
.LC70:
	.ascii "false\0"
.LC71:
	.ascii "\"NULL\"\0"
.LC72:
	.ascii "%lld\0"
.LC73:
	.ascii "%f\0"
.LC74:
	.ascii "void\0"
.LC75:
	.ascii "NONE\0"
.LC76:
	.ascii "unknown_ArgType: %u\0"
	.text
	.p2align 4
	.def	output_arg;	.scl	3;	.type	32;	.endef
output_arg:
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	subq	$40, %rsp
	testq	%rcx, %rcx
	je	.L137
	cmpl	$8, 16(%rcx)
	movq	%rcx, %rbx
	ja	.L122
	movl	16(%rcx), %eax
	leaq	.L124(%rip), %rdx
	movq	%rsi, %rcx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	xorl	%edx, %edx
	jmp	*%rax
	.section .rdata,"dr"
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
	call	indention_tac
	movq	(%rbx), %rax
	movq	8(%rax), %rcx
.L136:
	addq	$40, %rsp
	movq	%rsi, %rdx
	popq	%rbx
	popq	%rsi
	jmp	fputs
	.p2align 4,,10
	.p2align 3
.L123:
	call	indention_tac
	addq	$40, %rsp
	movq	%rsi, %r9
	movl	$4, %r8d
	popq	%rbx
	movl	$1, %edx
	leaq	.LC75(%rip), %rcx
	popq	%rsi
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L131:
	call	indention_tac
	movq	(%rbx), %r8
	addq	$40, %rsp
	movq	%rsi, %rcx
	popq	%rbx
	leaq	.LC72(%rip), %rdx
	popq	%rsi
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L130:
	call	indention_tac
	movq	(%rbx), %r8
	addq	$40, %rsp
	movq	%rsi, %rcx
	popq	%rbx
	leaq	.LC73(%rip), %rdx
	popq	%rsi
	movq	%r8, %xmm2
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L129:
	call	indention_tac
	movq	(%rbx), %rcx
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L128:
	call	indention_tac
	cmpb	$0, (%rbx)
	leaq	.LC70(%rip), %rcx
	leaq	.LC69(%rip), %rax
	cmovne	%rax, %rcx
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L127:
	call	indention_tac
	addq	$40, %rsp
	movq	%rsi, %r9
	movl	$4, %r8d
	popq	%rbx
	movl	$1, %edx
	leaq	.LC74(%rip), %rcx
	popq	%rsi
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L137:
	movq	%rsi, %rcx
	xorl	%edx, %edx
	call	indention_tac
	addq	$40, %rsp
	movq	%rsi, %r9
	movl	$6, %r8d
	popq	%rbx
	movl	$1, %edx
	leaq	.LC71(%rip), %rcx
	popq	%rsi
	jmp	fwrite
.L122:
	movq	%rsi, %rcx
	xorl	%edx, %edx
	call	indention_tac
	movl	16(%rbx), %r8d
	addq	$40, %rsp
	movq	%rsi, %rcx
	popq	%rbx
	leaq	.LC76(%rip), %rdx
	popq	%rsi
	jmp	fprintf
	.section .rdata,"dr"
.LC77:
	.ascii "NULL\0"
.LC78:
	.ascii "import\12\0"
.LC79:
	.ascii "source: \"%s\"\12\0"
.LC80:
	.ascii "parameters\12\0"
.LC81:
	.ascii "parameters[%d]\12\0"
.LC82:
	.ascii "class\12\0"
.LC83:
	.ascii "members\12\0"
.LC84:
	.ascii "method\12\0"
.LC85:
	.ascii "variable\12\0"
.LC86:
	.ascii "unknown_ClassMemberType: %u\12\0"
.LC87:
	.ascii "unknown_CodeMemberType: %u\12\0"
	.text
	.p2align 4
	.globl	output_code
	.def	output_code;	.scl	2;	.type	32;	.endef
output_code:
	pushq	%r15
	movq	%rdx, %r15
	pushq	%r14
	movq	%r8, %r14
	pushq	%r13
	movq	%r9, %r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$88, %rsp
	movq	(%rcx), %rcx
	call	list_copy
	movq	%rax, 72(%rsp)
	.p2align 4,,10
	.p2align 3
.L139:
	movq	72(%rsp), %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L163
	movl	8(%rbx), %eax
	leaq	1(%r14), %rdx
	movq	%r13, %r9
	xorl	%r8d, %r8d
	movq	%r15, %rcx
	cmpl	$1, %eax
	je	.L140
	cmpl	$2, %eax
	je	.L141
	testl	%eax, %eax
	jne	.L142
	call	indention
	leaq	2(%r14), %rsi
	movq	%r15, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC78(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rbx
	movq	%r13, %r9
	xorl	%r8d, %r8d
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC32(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rcx
	movq	%r13, %r9
	leaq	3(%r14), %r8
	movq	%r15, %rdx
	call	output_name
	movq	%rsi, %rdx
	movq	%r15, %rcx
	movq	%r13, %r9
	movl	$1, %r8d
	call	indention
	movq	8(%rbx), %rax
	leaq	.LC77(%rip), %r8
	movq	%r15, %rcx
	leaq	.LC79(%rip), %rdx
	testq	%rax, %rax
	cmovne	%rax, %r8
	call	fprintf
	jmp	.L139
	.p2align 4,,10
	.p2align 3
.L140:
	call	indention
	leaq	2(%r14), %rdi
	movq	%r15, %r9
	movl	$1, %edx
	movl	$9, %r8d
	leaq	.LC36(%rip), %rcx
	leaq	3(%r14), %rsi
	call	fwrite
	movq	(%rbx), %rbx
	movq	%r13, %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	%r15, %rcx
	movq	%rdi, 40(%rsp)
	leaq	4(%r14), %r12
	call	indention
	movq	%r15, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC32(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rcx
	movq	%r13, %r9
	movq	%rsi, %r8
	movq	%r15, %rdx
	call	output_name
	movq	%r13, %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rcx
	call	fwrite
	movq	8(%rbx), %rcx
	movq	%r13, %r9
	movq	%rsi, %r8
	movq	%r15, %rdx
	call	output_name
	movq	%r13, %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC80(%rip), %rcx
	call	fwrite
	movq	16(%rbx), %rcx
	call	list_copy
	movq	24(%rbx), %rcx
	movl	$-1, %ebx
	movq	%rax, %rbp
	call	list_copy
	movq	%rax, 48(%rsp)
	jmp	.L145
	.p2align 4,,10
	.p2align 3
.L146:
	movq	%r13, %r9
	xorl	%r8d, %r8d
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	indention
	addl	$1, %ebx
	leaq	.LC81(%rip), %rdx
	movq	%r15, %rcx
	movl	%ebx, %r8d
	call	fprintf
	movq	%r13, %r9
	movq	%r12, %r8
	movq	%r15, %rdx
	movq	%rdi, %rcx
	call	output_variable
.L145:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L146
	movq	40(%rsp), %rdx
	movq	%r13, %r9
	movq	%r15, %rcx
	movq	48(%rsp), %rdi
	movl	$1, %r8d
	call	indention
	movq	%r15, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC48(%rip), %rcx
	call	fwrite
	jmp	.L147
	.p2align 4,,10
	.p2align 3
.L148:
	movq	%r13, %r9
	movq	%rsi, %r8
	movq	%r15, %rdx
	call	output_statement
.L147:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L148
	jmp	.L139
	.p2align 4,,10
	.p2align 3
.L142:
	call	indention
	movl	8(%rbx), %r8d
	leaq	.LC87(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
	jmp	.L139
	.p2align 4,,10
	.p2align 3
.L141:
	call	indention
	leaq	2(%r14), %rsi
	movq	%r15, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC82(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rbx
	movq	%r13, %r9
	xorl	%r8d, %r8d
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC32(%rip), %rcx
	call	fwrite
	leaq	3(%r14), %rax
	movq	(%rbx), %rcx
	movq	%r13, %r9
	movq	%rax, %r8
	movq	%r15, %rdx
	movq	%rax, 48(%rsp)
	call	output_name
	movq	%r13, %r9
	movq	%rsi, %rdx
	movq	%r15, %rcx
	movl	$1, %r8d
	call	indention
	movq	%r15, %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC83(%rip), %rcx
	call	fwrite
	movq	8(%rbx), %rcx
	call	list_copy
	movq	%rax, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L149:
	movq	40(%rsp), %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L139
	movl	8(%rbx), %eax
	testl	%eax, %eax
	je	.L150
	cmpl	$1, %eax
	je	.L151
	movq	48(%rsp), %rdx
	xorl	%r8d, %r8d
	movq	%r15, %rcx
	movq	%r13, %r9
	call	indention
	movl	8(%rbx), %r8d
	leaq	.LC86(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
	jmp	.L149
	.p2align 4,,10
	.p2align 3
.L150:
	movq	48(%rsp), %rdx
	movq	%r13, %r9
	xorl	%r8d, %r8d
	movq	%r15, %rcx
	leaq	4(%r14), %rdi
	leaq	5(%r14), %rsi
	call	indention
	movq	%r15, %r9
	leaq	6(%r14), %r12
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC84(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rbx
	movq	%r13, %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	%r15, %rcx
	movq	%rdi, 56(%rsp)
	call	indention
	movq	%r15, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC32(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rcx
	movq	%r13, %r9
	movq	%rsi, %r8
	movq	%r15, %rdx
	call	output_name
	movq	%r13, %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rcx
	call	fwrite
	movq	8(%rbx), %rcx
	movq	%r13, %r9
	movq	%rsi, %r8
	movq	%r15, %rdx
	call	output_name
	movq	%r13, %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC80(%rip), %rcx
	call	fwrite
	movq	16(%rbx), %rcx
	call	list_copy
	movq	24(%rbx), %rcx
	movl	$-1, %ebx
	movq	%rax, %rbp
	call	list_copy
	movq	%rax, 64(%rsp)
	jmp	.L153
	.p2align 4,,10
	.p2align 3
.L154:
	movq	%r13, %r9
	xorl	%r8d, %r8d
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	indention
	addl	$1, %ebx
	leaq	.LC81(%rip), %rdx
	movq	%r15, %rcx
	movl	%ebx, %r8d
	call	fprintf
	movq	%r13, %r9
	movq	%r12, %r8
	movq	%r15, %rdx
	movq	%rdi, %rcx
	call	output_variable
.L153:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L154
	movq	56(%rsp), %rdx
	movq	%r13, %r9
	movq	%r15, %rcx
	movq	64(%rsp), %rdi
	movl	$1, %r8d
	call	indention
	movq	%r15, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC48(%rip), %rcx
	call	fwrite
	jmp	.L155
	.p2align 4,,10
	.p2align 3
.L156:
	movq	%r13, %r9
	movq	%rsi, %r8
	movq	%r15, %rdx
	call	output_statement
.L155:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L156
	jmp	.L149
	.p2align 4,,10
	.p2align 3
.L151:
	movq	48(%rsp), %rdx
	movq	%r13, %r9
	xorl	%r8d, %r8d
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC85(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rcx
	movq	%r13, %r9
	leaq	4(%r14), %r8
	movq	%r15, %rdx
	call	output_variable
	jmp	.L149
	.p2align 4,,10
	.p2align 3
.L163:
	addq	$88, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.section .rdata,"dr"
.LC88:
	.ascii "TAC: \"NULL\"\12\0"
.LC89:
	.ascii "TAC {\12\0"
.LC90:
	.ascii "designs: []\12\0"
.LC91:
	.ascii "designs: [\12\0"
.LC92:
	.ascii "NULL \0"
.LC93:
	.ascii "%s \0"
.LC94:
	.ascii "%zu \0"
.LC95:
	.ascii "{}\12\0"
.LC96:
	.ascii "{\12\0"
.LC97:
	.ascii "NULL\11\0"
.LC98:
	.ascii "%s\11\0"
.LC99:
	.ascii "%zu\12\0"
.LC100:
	.ascii "}\12\0"
.LC101:
	.ascii "]\12\0"
.LC102:
	.ascii "entry_point: \"NULL\"\12\0"
.LC103:
	.ascii "entry_point: %s\12\0"
.LC104:
	.ascii "global: []\12\0"
.LC105:
	.ascii "global: [\12\0"
.LC106:
	.ascii "subroutines: []\12\0"
.LC107:
	.ascii "subroutines: [\12\0"
.LC108:
	.ascii "NULL {\12\0"
.LC109:
	.ascii "%s {\12\0"
.LC110:
	.ascii "return_type: \"NULL\"\12\0"
.LC111:
	.ascii "return_type: %s\12\0"
.LC112:
	.ascii "parameters: []\12\0"
.LC113:
	.ascii "parameters: [\12\0"
.LC114:
	.ascii "local: []\12\0"
.LC115:
	.ascii "local: [\12\0"
.LC116:
	.ascii "instructions: []\12\0"
.LC117:
	.ascii "instructions: [\12\0"
.LC118:
	.ascii "add\11\0"
.LC119:
	.ascii "sub\11\0"
.LC120:
	.ascii "mul\11\0"
.LC121:
	.ascii "div\11\0"
.LC122:
	.ascii "mod\11\0"
.LC123:
	.ascii "eq \11\0"
.LC124:
	.ascii "ne \11\0"
.LC125:
	.ascii "lt \11\0"
.LC126:
	.ascii "gt \11\0"
.LC127:
	.ascii "le \11\0"
.LC128:
	.ascii "ge \11\0"
.LC129:
	.ascii "and\11\0"
.LC130:
	.ascii "or \11\0"
.LC131:
	.ascii "not\11\0"
.LC132:
	.ascii "assign\11\0"
.LC133:
	.ascii "get_attr\11\0"
.LC134:
	.ascii "get_elem\11\0"
.LC135:
	.ascii "param\11\0"
.LC136:
	.ascii "alloc\11\0"
.LC137:
	.ascii "jmp_c\11\0"
.LC138:
	.ascii "jmp\11\0"
.LC139:
	.ascii "ret\11\0"
.LC140:
	.ascii "call\11\0"
.LC141:
	.ascii "load\11\0"
.LC142:
	.ascii "store\11\0"
.LC143:
	.ascii "INST_NONE\12\0"
.LC144:
	.ascii "unknown_InstructionType: %u\12\0"
	.text
	.p2align 4
	.globl	output_TAC
	.def	output_TAC;	.scl	2;	.type	32;	.endef
output_TAC:
	pushq	%r15
	pushq	%r14
	movq	%rdx, %r14
	movq	%r8, %rdx
	pushq	%r13
	movq	%r8, %r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$104, %rsp
	testq	%rcx, %rcx
	movq	%rcx, 48(%rsp)
	movq	%r14, %rcx
	je	.L247
	call	indention_tac
	movl	$1, %edx
	movq	%r14, %r9
	movl	$6, %r8d
	leaq	.LC89(%rip), %rcx
	leaq	1(%r13), %r12
	call	fwrite
	movq	48(%rsp), %rax
	movq	(%rax), %rcx
	call	list_is_empty
	movq	%r12, %rdx
	movq	%r14, %rcx
	testb	%al, %al
	je	.L166
	call	indention_tac
	movq	%r14, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC90(%rip), %rcx
	call	fwrite
	leaq	.LC100(%rip), %rax
	movq	%rax, 56(%rsp)
.L167:
	movq	48(%rsp), %rax
	movq	%r12, %rdx
	movq	%r14, %rcx
	cmpq	$0, 8(%rax)
	je	.L248
	call	indention_tac
	movq	48(%rsp), %rax
	leaq	.LC103(%rip), %rdx
	movq	%r14, %rcx
	movq	8(%rax), %rax
	movq	8(%rax), %r8
	call	fprintf
.L181:
	movq	48(%rsp), %rax
	movq	16(%rax), %rcx
	call	list_is_empty
	movq	%r12, %rdx
	movq	%r14, %rcx
	testb	%al, %al
	je	.L182
	call	indention_tac
	movq	%r14, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC104(%rip), %rcx
	call	fwrite
.L183:
	movq	48(%rsp), %rax
	movq	24(%rax), %rcx
	call	list_is_empty
	movq	%r12, %rdx
	movq	%r14, %rcx
	testb	%al, %al
	je	.L186
	call	indention_tac
	movq	%r14, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC106(%rip), %rcx
	call	fwrite
.L187:
	movq	%r13, %rdx
	movq	%r14, %rcx
	call	indention_tac
	movq	56(%rsp), %rcx
	movq	%r14, %r9
	movl	$2, %r8d
	movl	$1, %edx
.L246:
	addq	$104, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fwrite
.L166:
	call	indention_tac
	movq	%r14, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC91(%rip), %rcx
	leaq	.LC93(%rip), %rdi
	call	fwrite
	leaq	.LC100(%rip), %rax
	leaq	.LC98(%rip), %rbp
	movq	%rax, 56(%rsp)
	.p2align 4,,10
	.p2align 3
.L168:
	movq	48(%rsp), %rax
	movq	(%rax), %rcx
	call	list_pop
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L249
	leaq	2(%r13), %r15
	cmpq	$0, 8(%rsi)
	movq	%r14, %rcx
	movq	%r15, %rdx
	je	.L250
	call	indention_tac
	movq	8(%rsi), %rax
	movq	%rdi, %rdx
	movq	%r14, %rcx
	movq	8(%rax), %r8
	call	fprintf
.L170:
	xorl	%edx, %edx
	movq	%r14, %rcx
	call	indention_tac
	movq	16(%rsi), %r8
	leaq	.LC94(%rip), %rdx
	movq	%r14, %rcx
	call	fprintf
	movq	(%rsi), %rcx
	call	list_is_empty
	xorl	%edx, %edx
	movq	%r14, %rcx
	testb	%al, %al
	je	.L171
	call	indention_tac
	movq	%r14, %r9
	movl	$3, %r8d
	movl	$1, %edx
	leaq	.LC95(%rip), %rcx
	call	fwrite
	jmp	.L168
	.p2align 4,,10
	.p2align 3
.L171:
	call	indention_tac
	movq	%r14, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC96(%rip), %rcx
	call	fwrite
	jmp	.L173
	.p2align 4,,10
	.p2align 3
.L174:
	call	indention_tac
	movq	8(%rbx), %rax
	movq	%rbp, %rdx
	movq	%r14, %rcx
	movq	8(%rax), %r8
	call	fprintf
	xorl	%edx, %edx
	cmpq	$0, (%rbx)
	movq	%r14, %rcx
	je	.L251
.L176:
	call	indention_tac
	movq	(%rbx), %rax
	movq	%rdi, %rdx
	movq	%r14, %rcx
	movq	8(%rax), %r8
	call	fprintf
.L177:
	xorl	%edx, %edx
	movq	%r14, %rcx
	call	indention_tac
	movq	16(%rbx), %r8
	leaq	.LC99(%rip), %rdx
	movq	%r14, %rcx
	call	fprintf
.L173:
	movq	(%rsi), %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L252
	cmpq	$0, 8(%rbx)
	leaq	3(%r13), %rdx
	movq	%r14, %rcx
	jne	.L174
	call	indention_tac
	movl	$1, %edx
	movq	%r14, %r9
	leaq	.LC97(%rip), %rcx
	movl	$5, %r8d
	call	fwrite
	xorl	%edx, %edx
	cmpq	$0, (%rbx)
	movq	%r14, %rcx
	jne	.L176
.L251:
	call	indention_tac
	movq	%r14, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC92(%rip), %rcx
	call	fwrite
	jmp	.L177
	.p2align 4,,10
	.p2align 3
.L252:
	movq	%r15, %rdx
	movq	%r14, %rcx
	call	indention_tac
	movq	56(%rsp), %rcx
	movq	%r14, %r9
	movl	$2, %r8d
	movl	$1, %edx
	call	fwrite
	jmp	.L168
	.p2align 4,,10
	.p2align 3
.L250:
	call	indention_tac
	movq	%r14, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC92(%rip), %rcx
	call	fwrite
	jmp	.L170
.L249:
	movq	%r12, %rdx
	movq	%r14, %rcx
	leaq	.LC101(%rip), %rbx
	call	indention_tac
	movq	%r14, %r9
	movl	$1, %edx
	movq	%rbx, %rcx
	movl	$2, %r8d
	call	fwrite
	jmp	.L167
.L186:
	call	indention_tac
	movq	%r14, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC107(%rip), %rcx
	leaq	.LC101(%rip), %rbx
	call	fwrite
	leaq	.L211(%rip), %r15
	movq	%r12, 88(%rsp)
	movq	%rbx, 64(%rsp)
	jmp	.L188
	.p2align 4,,10
	.p2align 3
.L256:
	call	indention_tac
	movq	%r14, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC112(%rip), %rcx
	call	fwrite
.L194:
	movq	24(%rsi), %rcx
	call	list_is_empty
	movq	%rdi, %rdx
	movq	%r14, %rcx
	testb	%al, %al
	je	.L197
	call	indention_tac
	movq	%r14, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC114(%rip), %rcx
	call	fwrite
.L198:
	movq	32(%rsi), %rcx
	call	list_is_empty
	movq	%rdi, %rdx
	movq	%r14, %rcx
	testb	%al, %al
	je	.L201
	call	indention_tac
	movq	%r14, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC116(%rip), %rcx
	call	fwrite
.L202:
	movq	%rbp, %rdx
	movq	%r14, %rcx
	call	indention_tac
	movq	56(%rsp), %rcx
	movq	%r14, %r9
	movl	$2, %r8d
	movl	$1, %edx
	call	fwrite
.L188:
	movq	48(%rsp), %rax
	movq	24(%rax), %rcx
	call	list_pop
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L253
	leaq	2(%r13), %rbp
	cmpq	$0, (%rsi)
	movq	%r14, %rcx
	movq	%rbp, %rdx
	je	.L254
	call	indention_tac
	movq	(%rsi), %rax
	leaq	.LC109(%rip), %rdx
	movq	%r14, %rcx
	movq	8(%rax), %r8
	call	fprintf
.L190:
	leaq	3(%r13), %rdi
	cmpq	$0, 8(%rsi)
	movq	%r14, %rcx
	movq	%rdi, %rdx
	je	.L255
	call	indention_tac
	movq	8(%rsi), %rax
	leaq	.LC111(%rip), %rdx
	movq	%r14, %rcx
	movq	8(%rax), %r8
	call	fprintf
.L192:
	movq	16(%rsi), %rcx
	call	list_is_empty
	movq	%rdi, %rdx
	movq	%r14, %rcx
	testb	%al, %al
	jne	.L256
	call	indention_tac
	movq	%r14, %r9
	leaq	4(%r13), %rbx
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC113(%rip), %rcx
	call	fwrite
	jmp	.L195
	.p2align 4,,10
	.p2align 3
.L196:
	movq	%rbx, %r8
	movq	%r14, %rdx
	call	output_var
.L195:
	movq	16(%rsi), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L196
	movq	%rdi, %rdx
	movq	%r14, %rcx
	call	indention_tac
	movq	64(%rsp), %rcx
	movq	%r14, %r9
	movl	$2, %r8d
	movl	$1, %edx
	call	fwrite
	jmp	.L194
	.p2align 4,,10
	.p2align 3
.L201:
	call	indention_tac
	movq	%r14, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC117(%rip), %rcx
	call	fwrite
	movq	%rbp, 72(%rsp)
	movq	%rsi, 40(%rsp)
	movq	%rdi, 80(%rsp)
	.p2align 4,,10
	.p2align 3
.L203:
	movq	40(%rsp), %rax
	movq	32(%rax), %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L257
	leaq	4(%r13), %r12
	cmpq	$0, (%rbx)
	movq	%r14, %rcx
	movq	%r12, %rdx
	je	.L258
	call	indention_tac
	movq	(%rbx), %rax
	leaq	.LC93(%rip), %rdx
	movq	%r14, %rcx
	movq	8(%rax), %r8
	call	fprintf
.L205:
	movq	8(%rbx), %rcx
	call	list_is_empty
	xorl	%edx, %edx
	movq	%r14, %rcx
	testb	%al, %al
	je	.L206
	call	indention_tac
	movq	%r14, %r9
	movl	$3, %r8d
	movl	$1, %edx
	leaq	.LC95(%rip), %rcx
	call	fwrite
	jmp	.L203
	.p2align 4,,10
	.p2align 3
.L206:
	call	indention_tac
	movq	%r14, %r9
	leaq	5(%r13), %rdi
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC96(%rip), %rcx
	movl	$1, %ebp
	call	fwrite
	.p2align 4,,10
	.p2align 3
.L208:
	movq	8(%rbx), %rcx
	call	list_pop
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L259
	cmpl	$25, 24(%rsi)
	ja	.L209
	movl	24(%rsi), %eax
	movq	%rdi, %rdx
	movq	%r14, %rcx
	movslq	(%r15,%rax,4), %rax
	addq	%r15, %rax
	jmp	*%rax
	.section .rdata,"dr"
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
	call	indention_tac
	movq	%r14, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC142(%rip), %rcx
	call	fwrite
	.p2align 4,,10
	.p2align 3
.L237:
	movq	(%rsi), %rcx
	movq	%r14, %rdx
	call	output_arg
	movl	24(%rsi), %ecx
	cmpl	$24, %ecx
	ja	.L208
	movq	%rbp, %rax
	salq	%cl, %rax
	testl	$4825087, %eax
	jne	.L239
	testl	$25583616, %eax
	jne	.L240
	testl	$3145728, %eax
	je	.L208
.L241:
	xorl	%edx, %edx
	movq	%r14, %rcx
	call	indention_tac
	movq	%r14, %rdx
	movl	$10, %ecx
	call	fputc
	jmp	.L208
	.p2align 4,,10
	.p2align 3
.L213:
	call	indention_tac
	movq	%r14, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC141(%rip), %rcx
	call	fwrite
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L214:
	call	indention_tac
	movq	%r14, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC140(%rip), %rcx
	call	fwrite
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L215:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC139(%rip), %rcx
	call	fwrite
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L216:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC138(%rip), %rcx
	call	fwrite
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L217:
	call	indention_tac
	movq	%r14, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC137(%rip), %rcx
	call	fwrite
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L218:
	call	indention_tac
	movq	%r14, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC136(%rip), %rcx
	call	fwrite
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L219:
	call	indention_tac
	movq	%r14, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC135(%rip), %rcx
	call	fwrite
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L220:
	call	indention_tac
	movq	%r14, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC134(%rip), %rcx
	call	fwrite
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L221:
	call	indention_tac
	movq	%r14, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC133(%rip), %rcx
	call	fwrite
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L222:
	call	indention_tac
	movq	%r14, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC132(%rip), %rcx
	call	fwrite
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L223:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC131(%rip), %rcx
	call	fwrite
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L224:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC130(%rip), %rcx
	call	fwrite
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L225:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC129(%rip), %rcx
	call	fwrite
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L226:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC128(%rip), %rcx
	call	fwrite
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L227:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC127(%rip), %rcx
	call	fwrite
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L228:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC126(%rip), %rcx
	call	fwrite
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L229:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC125(%rip), %rcx
	call	fwrite
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L230:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC124(%rip), %rcx
	call	fwrite
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L231:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC123(%rip), %rcx
	call	fwrite
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L232:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC122(%rip), %rcx
	call	fwrite
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L233:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC121(%rip), %rcx
	call	fwrite
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L234:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC120(%rip), %rcx
	call	fwrite
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L235:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC119(%rip), %rcx
	call	fwrite
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L236:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC118(%rip), %rcx
	call	fwrite
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L210:
	call	indention_tac
	movq	%r14, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC143(%rip), %rcx
	call	fwrite
	jmp	.L208
	.p2align 4,,10
	.p2align 3
.L240:
	xorl	%edx, %edx
	movq	%r14, %rcx
	call	indention_tac
	movq	%r14, %rdx
	movl	$32, %ecx
	call	fputc
	movq	8(%rsi), %rcx
	movq	%r14, %rdx
	call	output_arg
	jmp	.L241
	.p2align 4,,10
	.p2align 3
.L239:
	xorl	%edx, %edx
	movq	%r14, %rcx
	call	indention_tac
	movq	%r14, %rdx
	movl	$32, %ecx
	call	fputc
	movq	8(%rsi), %rcx
	movq	%r14, %rdx
	call	output_arg
	xorl	%edx, %edx
	movq	%r14, %rcx
	call	indention_tac
	movq	%r14, %rdx
	movl	$32, %ecx
	call	fputc
	movq	16(%rsi), %rcx
	movq	%r14, %rdx
	call	output_arg
	jmp	.L241
	.p2align 4,,10
	.p2align 3
.L259:
	movq	%r12, %rdx
	movq	%r14, %rcx
	call	indention_tac
	movq	56(%rsp), %rcx
	movq	%r14, %r9
	movl	$2, %r8d
	movl	$1, %edx
	call	fwrite
	jmp	.L203
	.p2align 4,,10
	.p2align 3
.L258:
	call	indention_tac
	movq	%r14, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC92(%rip), %rcx
	call	fwrite
	jmp	.L205
	.p2align 4,,10
	.p2align 3
.L257:
	movq	80(%rsp), %rdx
	movq	%r14, %rcx
	movq	72(%rsp), %rbp
	call	indention_tac
	movq	64(%rsp), %rcx
	movq	%r14, %r9
	movl	$2, %r8d
	movl	$1, %edx
	call	fwrite
	jmp	.L202
	.p2align 4,,10
	.p2align 3
.L197:
	call	indention_tac
	movq	%r14, %r9
	leaq	4(%r13), %rbx
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC115(%rip), %rcx
	call	fwrite
	jmp	.L199
	.p2align 4,,10
	.p2align 3
.L200:
	movq	%rbx, %r8
	movq	%r14, %rdx
	call	output_var
.L199:
	movq	24(%rsi), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L200
	movq	%rdi, %rdx
	movq	%r14, %rcx
	call	indention_tac
	movq	64(%rsp), %rcx
	movq	%r14, %r9
	movl	$2, %r8d
	movl	$1, %edx
	call	fwrite
	jmp	.L198
.L209:
	movq	%rdi, %rdx
	movq	%r14, %rcx
	call	indention_tac
	movl	24(%rsi), %r8d
	leaq	.LC144(%rip), %rdx
	movq	%r14, %rcx
	call	fprintf
	jmp	.L208
	.p2align 4,,10
	.p2align 3
.L255:
	call	indention_tac
	movq	%r14, %r9
	movl	$20, %r8d
	movl	$1, %edx
	leaq	.LC110(%rip), %rcx
	call	fwrite
	jmp	.L192
	.p2align 4,,10
	.p2align 3
.L254:
	call	indention_tac
	movq	%r14, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC108(%rip), %rcx
	call	fwrite
	jmp	.L190
.L182:
	call	indention_tac
	movq	%r14, %r9
	leaq	2(%r13), %rbx
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC105(%rip), %rcx
	call	fwrite
	movq	48(%rsp), %rsi
	jmp	.L184
	.p2align 4,,10
	.p2align 3
.L185:
	movq	%rbx, %r8
	movq	%r14, %rdx
	call	output_var
.L184:
	movq	16(%rsi), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L185
	movq	%r12, %rdx
	movq	%r14, %rcx
	leaq	.LC101(%rip), %rbx
	call	indention_tac
	movq	%r14, %r9
	movl	$1, %edx
	movq	%rbx, %rcx
	movl	$2, %r8d
	call	fwrite
	jmp	.L183
.L253:
	movq	88(%rsp), %r12
	movq	64(%rsp), %rbx
	movq	%r14, %rcx
	movq	%r12, %rdx
	call	indention_tac
	movq	%r14, %r9
	movl	$1, %edx
	movq	%rbx, %rcx
	movl	$2, %r8d
	call	fwrite
	jmp	.L187
.L248:
	call	indention_tac
	movq	%r14, %r9
	movl	$20, %r8d
	movl	$1, %edx
	leaq	.LC102(%rip), %rcx
	call	fwrite
	jmp	.L181
.L247:
	call	indention_tac
	movq	%r14, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC88(%rip), %rcx
	jmp	.L246
	.ident	"GCC: (GNU) 13.2.0"
	.def	indention;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	indention_tac;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	list_is_empty;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
