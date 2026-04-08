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
	.ascii "primary\12\0"
.LC14:
	.ascii "type: \"integer\"\12\0"
.LC15:
	.ascii "value: %s\12\0"
.LC16:
	.ascii "type: \"float\"\12\0"
.LC17:
	.ascii "type: \"string\"\12\0"
.LC18:
	.ascii "value: \"%s\"\12\0"
.LC19:
	.ascii "type: \"boolean\"\12\0"
.LC20:
	.ascii "value: \"true\"\12\0"
.LC21:
	.ascii "value: \"false\"\12\0"
.LC22:
	.ascii "type: \"expression\"\12\0"
.LC23:
	.ascii "value\12\0"
.LC24:
	.ascii "type: \"!\"\12\0"
.LC25:
	.ascii "type: \"-\"\12\0"
.LC26:
	.ascii "type: \"variable\"\12\0"
.LC27:
	.ascii "unknown_PrimaryType: %u\12\0"
.LC28:
	.ascii "operator: \"%s\"\12\0"
.LC29:
	.ascii "left\12\0"
.LC30:
	.ascii "right\12\0"
.LC31:
	.ascii "UNKNOWN_OPERATOR\0"
	.text
	.p2align 4
	.def	output_expression;	.scl	3;	.type	32;	.endef
output_expression:
	pushq	%r15
	leaq	.L30(%rip), %r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rdi
	movq	%r9, %rdi
	pushq	%rsi
	movq	%r8, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$40, %rsp
.L39:
	movl	24(%rbp), %ecx
	leaq	.LC29(%rip), %r13
	leaq	.LC30(%rip), %r12
	cmpl	$19, %ecx
	je	.L59
.L26:
	call	operator_to_string
	xorl	%r8d, %r8d
	movq	%rdi, %r9
	movq	%rsi, %rdx
	movq	%rax, %r14
	movq	%rbx, %rcx
	call	indention
	movq	%r14, %r8
	testq	%r14, %r14
	je	.L60
.L54:
	leaq	.LC28(%rip), %rdx
	movq	%rbx, %rcx
	leaq	1(%rsi), %r14
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
	movq	0(%rbp), %rcx
	movq	%rdi, %r9
	movq	%r14, %r8
	movq	%rbx, %rdx
	call	output_expression
	movq	%rdi, %r9
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%r12, %rcx
	movq	%rbx, %r9
	movl	$1, %edx
	movl	$6, %r8d
	call	fwrite
	movq	16(%rbp), %rbp
	movl	24(%rbp), %ecx
	cmpl	$19, %ecx
	je	.L42
	movq	%r14, %rsi
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L60:
	leaq	.LC31(%rip), %r8
	jmp	.L54
	.p2align 4,,10
	.p2align 3
.L59:
	movq	%rsi, %r14
.L42:
	movq	%rdi, %r9
	movl	$1, %r8d
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	leaq	2(%r14), %rsi
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC13(%rip), %rcx
	call	fwrite
	movq	8(%rbp), %rbp
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
	leaq	.LC25(%rip), %rcx
.L55:
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
	leaq	.LC23(%rip), %rcx
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
	leaq	.LC26(%rip), %rcx
	call	fwrite
	movq	%rdi, %r9
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC23(%rip), %rcx
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
	leaq	.LC14(%rip), %rcx
.L56:
	call	fwrite
	movq	%r12, %rdx
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	0(%rbp), %r8
	leaq	.LC15(%rip), %rdx
.L57:
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
	leaq	.LC16(%rip), %rcx
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L36:
	call	indention
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC17(%rip), %rcx
	call	fwrite
	movq	%r12, %rdx
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	0(%rbp), %r8
	leaq	.LC18(%rip), %rdx
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L35:
	call	indention
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC19(%rip), %rcx
	call	fwrite
	movq	%rdi, %r9
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC20(%rip), %rcx
.L58:
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
	leaq	.LC19(%rip), %rcx
	call	fwrite
	movq	%rdi, %r9
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC21(%rip), %rcx
	jmp	.L58
	.p2align 4,,10
	.p2align 3
.L33:
	call	indention
	movq	%rbx, %r9
	movl	$19, %r8d
	movl	$1, %edx
	leaq	.LC22(%rip), %rcx
	call	fwrite
	movq	%rdi, %r9
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC23(%rip), %rcx
	call	fwrite
	movq	0(%rbp), %rbp
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L32:
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC24(%rip), %rcx
	jmp	.L55
.L28:
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movq	%rdi, %r9
	movl	$1, %r8d
	call	indention
	movl	8(%rbp), %r8d
	addq	$40, %rsp
	movq	%rbx, %rcx
	leaq	.LC27(%rip), %rdx
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
	je	.L62
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC23(%rip), %rcx
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
.L62:
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
	je	.L65
	ja	.L66
	testl	%eax, %eax
	je	.L79
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
	jmp	.L71
	.p2align 4,,10
	.p2align 3
.L72:
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
.L71:
	movq	%r13, %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L72
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
.L66:
	cmpl	$3, %eax
	jne	.L80
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
.L65:
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
.L78:
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
.L79:
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
	jmp	.L78
	.p2align 4,,10
	.p2align 3
.L80:
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
	ja	.L82
	movl	8(%rcx), %eax
	leaq	.L84(%rip), %rdx
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	movq	%rdi, %rdx
	jmp	*%rax
	.section .rdata,"dr"
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
	call	indention
	movq	%rbx, %r9
	movl	$24, %r8d
	movl	$1, %edx
	leaq	.LC61(%rip), %rcx
.L115:
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
.L83:
	call	indention
	movq	%rbx, %r9
	movl	$27, %r8d
	movl	$1, %edx
	leaq	.LC62(%rip), %rcx
	jmp	.L115
	.p2align 4,,10
	.p2align 3
.L91:
	cmpq	$0, 0(%rbp)
	je	.L117
	call	indention
	movq	%rbx, %r9
	movl	$21, %r8d
	movl	$1, %edx
	leaq	.LC64(%rip), %rcx
.L116:
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
.L90:
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
.L89:
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
	jmp	.L92
	.p2align 4,,10
	.p2align 3
.L93:
	movq	%rbp, %r8
	movq	%rbx, %rdx
	call	output_statement
.L92:
	movq	%r15, %rcx
	call	list_pop
	movq	%rsi, %r9
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L93
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
.L94:
	movq	40(%rsp), %rcx
	call	list_pop
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L118
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
	je	.L94
.L96:
	movq	%rax, %rcx
	movq	%rsi, %r9
	movq	%r15, %r8
	movq	%rbx, %rdx
	call	output_statement
	movq	%rdi, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L96
	jmp	.L94
	.p2align 4,,10
	.p2align 3
.L88:
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
	jmp	.L110
	.p2align 4,,10
	.p2align 3
.L111:
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	output_statement
.L110:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L111
.L81:
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
.L87:
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
	je	.L101
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
.L102:
	xorl	%r8d, %r8d
	cmpq	$0, 8(%r12)
	movq	%rsi, %r9
	movq	%r13, %rdx
	movq	%rbx, %rcx
	je	.L103
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
.L104:
	xorl	%r8d, %r8d
	cmpq	$0, 16(%r12)
	movq	%rsi, %r9
	movq	%r13, %rdx
	movq	%rbx, %rcx
	je	.L105
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
.L106:
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
	jmp	.L107
	.p2align 4,,10
	.p2align 3
.L108:
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	output_statement
.L107:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L108
	jmp	.L81
	.p2align 4,,10
	.p2align 3
.L86:
	cmpq	$0, 0(%rbp)
	je	.L119
	call	indention
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC60(%rip), %rcx
	jmp	.L116
.L82:
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
.L118:
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
	jmp	.L98
	.p2align 4,,10
	.p2align 3
.L99:
	movq	%rsi, %r9
	movq	%rbp, %r8
	movq	%rbx, %rdx
	call	output_statement
.L98:
	movq	48(%rsp), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L99
	jmp	.L81
.L101:
	call	indention
	movq	%rbx, %r9
	movl	$20, %r8d
	movl	$1, %edx
	leaq	.LC53(%rip), %rcx
	call	fwrite
	jmp	.L102
.L105:
	call	indention
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC56(%rip), %rcx
	call	fwrite
	jmp	.L106
.L103:
	call	indention
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC54(%rip), %rcx
	call	fwrite
	jmp	.L104
.L117:
	call	indention
	movq	%rbx, %r9
	movl	$29, %r8d
	movl	$1, %edx
	leaq	.LC63(%rip), %rcx
	jmp	.L115
.L119:
	call	indention
	movq	%rbx, %r9
	movl	$25, %r8d
	movl	$1, %edx
	leaq	.LC59(%rip), %rcx
	jmp	.L115
	.section .rdata,"dr"
.LC66:
	.ascii "Var: \"NULL\"\12\0"
.LC67:
	.ascii "NULL\11%s\12\0"
.LC68:
	.ascii "%s\11%s(%s)\12\0"
.LC69:
	.ascii "%s\11%s\12\0"
	.text
	.p2align 4
	.def	output_var;	.scl	3;	.type	32;	.endef
output_var:
	pushq	%rsi
	movq	%rdx, %rsi
	movq	%r8, %rdx
	pushq	%rbx
	subq	$56, %rsp
	testq	%rcx, %rcx
	je	.L127
	movq	%rcx, %rbx
	movq	%rsi, %rcx
	cmpq	$0, 16(%rbx)
	je	.L128
	cmpq	$0, (%rbx)
	je	.L123
	call	indention_tac
	movq	16(%rbx), %rax
	movq	%rsi, %rcx
	leaq	.LC68(%rip), %rdx
	movq	8(%rax), %r8
	movq	(%rbx), %rax
	movq	8(%rax), %rax
	movq	%rax, 32(%rsp)
	movq	8(%rbx), %r9
	call	fprintf
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
	.p2align 3
.L123:
	call	indention_tac
	movq	16(%rbx), %rax
	movq	8(%rbx), %r9
	movq	%rsi, %rcx
	leaq	.LC69(%rip), %rdx
	movq	8(%rax), %r8
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L128:
	call	indention_tac
	movq	8(%rbx), %r8
	addq	$56, %rsp
	movq	%rsi, %rcx
	popq	%rbx
	leaq	.LC67(%rip), %rdx
	popq	%rsi
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L127:
	movq	%rsi, %rcx
	call	indention_tac
	addq	$56, %rsp
	movq	%rsi, %r9
	movl	$12, %r8d
	popq	%rbx
	movl	$1, %edx
	leaq	.LC66(%rip), %rcx
	popq	%rsi
	jmp	fwrite
	.section .rdata,"dr"
.LC70:
	.ascii "true\0"
.LC71:
	.ascii "false\0"
.LC72:
	.ascii "\"NULL\"\0"
.LC73:
	.ascii "%s(%s)\0"
.LC74:
	.ascii "%lld\0"
.LC75:
	.ascii "%f\0"
.LC76:
	.ascii "\"%s\"\0"
.LC77:
	.ascii "void\0"
.LC78:
	.ascii "NONE\0"
.LC79:
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
	je	.L151
	cmpl	$9, 16(%rcx)
	movq	%rcx, %rbx
	ja	.L131
	movl	16(%rcx), %eax
	leaq	.L133(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L133:
	.long	.L134-.L133
	.long	.L140-.L133
	.long	.L139-.L133
	.long	.L138-.L133
	.long	.L137-.L133
	.long	.L136-.L133
	.long	.L135-.L133
	.long	.L134-.L133
	.long	.L134-.L133
	.long	.L132-.L133
	.text
	.p2align 4,,10
	.p2align 3
.L134:
	movq	(%rcx), %rax
	xorl	%edx, %edx
	movq	%rsi, %rcx
	cmpq	$0, (%rax)
	je	.L144
	call	indention_tac
	movq	(%rbx), %rax
	movq	%rsi, %rcx
	movq	(%rax), %rdx
	movq	8(%rax), %r8
	movq	8(%rdx), %r9
	addq	$40, %rsp
	leaq	.LC73(%rip), %rdx
	popq	%rbx
	popq	%rsi
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L140:
	xorl	%edx, %edx
	movq	%rsi, %rcx
	call	indention_tac
	movq	(%rbx), %r8
	leaq	.LC74(%rip), %rdx
.L149:
	addq	$40, %rsp
	movq	%rsi, %rcx
	popq	%rbx
	popq	%rsi
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L137:
	xorl	%edx, %edx
	movq	%rsi, %rcx
	call	indention_tac
	cmpb	$0, (%rbx)
	leaq	.LC71(%rip), %rcx
	leaq	.LC70(%rip), %rax
	cmovne	%rax, %rcx
.L148:
	addq	$40, %rsp
	movq	%rsi, %rdx
	popq	%rbx
	popq	%rsi
	jmp	fputs
	.p2align 4,,10
	.p2align 3
.L136:
	movq	%rsi, %rcx
	xorl	%edx, %edx
	call	indention_tac
	addq	$40, %rsp
	movq	%rsi, %r9
	movl	$4, %r8d
	popq	%rbx
	movl	$1, %edx
	leaq	.LC77(%rip), %rcx
	popq	%rsi
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L135:
	movq	%rsi, %rcx
	xorl	%edx, %edx
	call	indention_tac
	movq	(%rbx), %rax
	movq	8(%rax), %rcx
	jmp	.L148
	.p2align 4,,10
	.p2align 3
.L132:
	movq	%rsi, %rcx
	xorl	%edx, %edx
	call	indention_tac
	addq	$40, %rsp
	movq	%rsi, %r9
	movl	$4, %r8d
	popq	%rbx
	movl	$1, %edx
	leaq	.LC78(%rip), %rcx
	popq	%rsi
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L139:
	movq	%rsi, %rcx
	xorl	%edx, %edx
	call	indention_tac
	movq	(%rbx), %r8
	addq	$40, %rsp
	movq	%rsi, %rcx
	popq	%rbx
	leaq	.LC75(%rip), %rdx
	popq	%rsi
	movq	%r8, %xmm2
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L138:
	xorl	%edx, %edx
	movq	%rsi, %rcx
	call	indention_tac
	movq	(%rbx), %r8
	leaq	.LC76(%rip), %rdx
	jmp	.L149
	.p2align 4,,10
	.p2align 3
.L151:
	movq	%rsi, %rcx
	xorl	%edx, %edx
	call	indention_tac
	addq	$40, %rsp
	movq	%rsi, %r9
	movl	$6, %r8d
	popq	%rbx
	movl	$1, %edx
	leaq	.LC72(%rip), %rcx
	popq	%rsi
	jmp	fwrite
.L131:
	movq	%rsi, %rcx
	xorl	%edx, %edx
	call	indention_tac
	movl	16(%rbx), %r8d
	addq	$40, %rsp
	movq	%rsi, %rcx
	popq	%rbx
	leaq	.LC79(%rip), %rdx
	popq	%rsi
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L144:
	call	indention_tac
	movq	(%rbx), %rax
	movq	8(%rax), %rcx
	jmp	.L148
	.section .rdata,"dr"
.LC80:
	.ascii "NULL\0"
.LC81:
	.ascii "import\12\0"
.LC82:
	.ascii "source: \"%s\"\12\0"
.LC83:
	.ascii "parameters\12\0"
.LC84:
	.ascii "parameters[%d]\12\0"
.LC85:
	.ascii "class\12\0"
.LC86:
	.ascii "members\12\0"
.LC87:
	.ascii "method\12\0"
.LC88:
	.ascii "variable\12\0"
.LC89:
	.ascii "unknown_ClassMemberType: %u\12\0"
.LC90:
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
.L153:
	movq	72(%rsp), %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L177
	movl	8(%rbx), %eax
	leaq	1(%r14), %rdx
	movq	%r13, %r9
	xorl	%r8d, %r8d
	movq	%r15, %rcx
	cmpl	$1, %eax
	je	.L154
	cmpl	$2, %eax
	je	.L155
	testl	%eax, %eax
	jne	.L156
	call	indention
	leaq	2(%r14), %rsi
	movq	%r15, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC81(%rip), %rcx
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
	leaq	.LC80(%rip), %r8
	movq	%r15, %rcx
	leaq	.LC82(%rip), %rdx
	testq	%rax, %rax
	cmovne	%rax, %r8
	call	fprintf
	jmp	.L153
	.p2align 4,,10
	.p2align 3
.L154:
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
	leaq	.LC83(%rip), %rcx
	call	fwrite
	movq	16(%rbx), %rcx
	call	list_copy
	movq	24(%rbx), %rcx
	movl	$-1, %ebx
	movq	%rax, %rbp
	call	list_copy
	movq	%rax, 48(%rsp)
	jmp	.L159
	.p2align 4,,10
	.p2align 3
.L160:
	movq	%r13, %r9
	xorl	%r8d, %r8d
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	indention
	addl	$1, %ebx
	leaq	.LC84(%rip), %rdx
	movq	%r15, %rcx
	movl	%ebx, %r8d
	call	fprintf
	movq	%r13, %r9
	movq	%r12, %r8
	movq	%r15, %rdx
	movq	%rdi, %rcx
	call	output_variable
.L159:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L160
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
	jmp	.L161
	.p2align 4,,10
	.p2align 3
.L162:
	movq	%r13, %r9
	movq	%rsi, %r8
	movq	%r15, %rdx
	call	output_statement
.L161:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L162
	jmp	.L153
	.p2align 4,,10
	.p2align 3
.L156:
	call	indention
	movl	8(%rbx), %r8d
	leaq	.LC90(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
	jmp	.L153
	.p2align 4,,10
	.p2align 3
.L155:
	call	indention
	leaq	2(%r14), %rsi
	movq	%r15, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC85(%rip), %rcx
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
	leaq	.LC86(%rip), %rcx
	call	fwrite
	movq	8(%rbx), %rcx
	call	list_copy
	movq	%rax, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L163:
	movq	40(%rsp), %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L153
	movl	8(%rbx), %eax
	testl	%eax, %eax
	je	.L164
	cmpl	$1, %eax
	je	.L165
	movq	48(%rsp), %rdx
	xorl	%r8d, %r8d
	movq	%r15, %rcx
	movq	%r13, %r9
	call	indention
	movl	8(%rbx), %r8d
	leaq	.LC89(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
	jmp	.L163
	.p2align 4,,10
	.p2align 3
.L164:
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
	leaq	.LC87(%rip), %rcx
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
	leaq	.LC83(%rip), %rcx
	call	fwrite
	movq	16(%rbx), %rcx
	call	list_copy
	movq	24(%rbx), %rcx
	movl	$-1, %ebx
	movq	%rax, %rbp
	call	list_copy
	movq	%rax, 64(%rsp)
	jmp	.L167
	.p2align 4,,10
	.p2align 3
.L168:
	movq	%r13, %r9
	xorl	%r8d, %r8d
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	indention
	addl	$1, %ebx
	leaq	.LC84(%rip), %rdx
	movq	%r15, %rcx
	movl	%ebx, %r8d
	call	fprintf
	movq	%r13, %r9
	movq	%r12, %r8
	movq	%r15, %rdx
	movq	%rdi, %rcx
	call	output_variable
.L167:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L168
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
	jmp	.L169
	.p2align 4,,10
	.p2align 3
.L170:
	movq	%r13, %r9
	movq	%rsi, %r8
	movq	%r15, %rdx
	call	output_statement
.L169:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L170
	jmp	.L163
	.p2align 4,,10
	.p2align 3
.L165:
	movq	48(%rsp), %rdx
	movq	%r13, %r9
	xorl	%r8d, %r8d
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC88(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rcx
	movq	%r13, %r9
	leaq	4(%r14), %r8
	movq	%r15, %rdx
	call	output_variable
	jmp	.L163
	.p2align 4,,10
	.p2align 3
.L177:
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
.LC91:
	.ascii "TAC: \"NULL\"\12\0"
.LC92:
	.ascii "TAC {\12\0"
.LC93:
	.ascii "designs: []\12\0"
.LC94:
	.ascii "designs: [\12\0"
.LC95:
	.ascii "NULL \0"
.LC96:
	.ascii "%s \0"
.LC97:
	.ascii "%zu \0"
.LC98:
	.ascii "{}\12\0"
.LC99:
	.ascii "{\12\0"
.LC100:
	.ascii "NULL\11\0"
.LC101:
	.ascii "%s\11\0"
.LC102:
	.ascii "%s(%s) \0"
.LC103:
	.ascii "%zu\12\0"
.LC104:
	.ascii "}\12\0"
.LC105:
	.ascii "]\12\0"
.LC106:
	.ascii "entry_point: \"NULL\"\12\0"
.LC107:
	.ascii "entry_point: %s\12\0"
.LC108:
	.ascii "global: []\12\0"
.LC109:
	.ascii "global: [\12\0"
.LC110:
	.ascii "subroutines: []\12\0"
.LC111:
	.ascii "subroutines: [\12\0"
.LC112:
	.ascii "NULL {\12\0"
.LC113:
	.ascii "%s {\12\0"
.LC114:
	.ascii "return_type: \"NULL\"\12\0"
.LC115:
	.ascii "return_type: %s\12\0"
.LC116:
	.ascii "parameters: []\12\0"
.LC117:
	.ascii "parameters: [\12\0"
.LC118:
	.ascii "local: []\12\0"
.LC119:
	.ascii "local: [\12\0"
.LC120:
	.ascii "instructions: []\12\0"
.LC121:
	.ascii "instructions: [\12\0"
.LC122:
	.ascii "add\11\0"
.LC123:
	.ascii "sub\11\0"
.LC124:
	.ascii "mul\11\0"
.LC125:
	.ascii "div\11\0"
.LC126:
	.ascii "mod\11\0"
.LC127:
	.ascii "eq \11\0"
.LC128:
	.ascii "ne \11\0"
.LC129:
	.ascii "lt \11\0"
.LC130:
	.ascii "gt \11\0"
.LC131:
	.ascii "le \11\0"
.LC132:
	.ascii "ge \11\0"
.LC133:
	.ascii "and\11\0"
.LC134:
	.ascii "or \11\0"
.LC135:
	.ascii "not\11\0"
.LC136:
	.ascii "assign\11\0"
.LC137:
	.ascii "get_attr\11\0"
.LC138:
	.ascii "get_elem\11\0"
.LC139:
	.ascii "param\11\0"
.LC140:
	.ascii "alloc\11\0"
.LC141:
	.ascii "jmp_c\11\0"
.LC142:
	.ascii "jmp\11\0"
.LC143:
	.ascii "ret\11\0"
.LC144:
	.ascii "call\11\0"
.LC145:
	.ascii "load\11\0"
.LC146:
	.ascii "store\11\0"
.LC147:
	.ascii "INST_NONE\12\0"
.LC148:
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
	je	.L262
	call	indention_tac
	movl	$1, %edx
	movq	%r14, %r9
	movl	$6, %r8d
	leaq	.LC92(%rip), %rcx
	leaq	1(%r13), %rbp
	call	fwrite
	movq	48(%rsp), %rax
	movq	(%rax), %rcx
	call	list_is_empty
	movq	%rbp, %rdx
	movq	%r14, %rcx
	testb	%al, %al
	je	.L180
	call	indention_tac
	movq	%r14, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC93(%rip), %rcx
	call	fwrite
	leaq	.LC104(%rip), %rax
	movq	%rax, 56(%rsp)
.L181:
	movq	48(%rsp), %rax
	movq	%rbp, %rdx
	movq	%r14, %rcx
	cmpq	$0, 8(%rax)
	je	.L263
	call	indention_tac
	movq	48(%rsp), %rax
	leaq	.LC107(%rip), %rdx
	movq	%r14, %rcx
	movq	8(%rax), %rax
	movq	8(%rax), %r8
	call	fprintf
.L196:
	movq	48(%rsp), %rax
	movq	16(%rax), %rcx
	call	list_is_empty
	movq	%rbp, %rdx
	movq	%r14, %rcx
	testb	%al, %al
	je	.L197
	call	indention_tac
	movq	%r14, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC108(%rip), %rcx
	call	fwrite
.L198:
	movq	48(%rsp), %rax
	movq	24(%rax), %rcx
	call	list_is_empty
	movq	%rbp, %rdx
	movq	%r14, %rcx
	testb	%al, %al
	je	.L201
	call	indention_tac
	movq	%r14, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC110(%rip), %rcx
	call	fwrite
.L202:
	movq	%r13, %rdx
	movq	%r14, %rcx
	call	indention_tac
	movq	56(%rsp), %rcx
	movq	%r14, %r9
	movl	$2, %r8d
	movl	$1, %edx
.L261:
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
.L180:
	call	indention_tac
	movq	%r14, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC94(%rip), %rcx
	leaq	.LC96(%rip), %r12
	call	fwrite
	leaq	.LC104(%rip), %rax
	leaq	.LC101(%rip), %rdi
	movq	%rax, 56(%rsp)
	.p2align 4,,10
	.p2align 3
.L182:
	movq	48(%rsp), %rax
	movq	(%rax), %rcx
	call	list_pop
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L264
	leaq	2(%r13), %r15
	cmpq	$0, 8(%rsi)
	movq	%r14, %rcx
	movq	%r15, %rdx
	je	.L265
	call	indention_tac
	movq	8(%rsi), %rax
	movq	%r12, %rdx
	movq	%r14, %rcx
	movq	8(%rax), %r8
	call	fprintf
.L184:
	xorl	%edx, %edx
	movq	%r14, %rcx
	call	indention_tac
	movq	16(%rsi), %r8
	leaq	.LC97(%rip), %rdx
	movq	%r14, %rcx
	call	fprintf
	movq	(%rsi), %rcx
	call	list_is_empty
	xorl	%edx, %edx
	movq	%r14, %rcx
	testb	%al, %al
	je	.L185
	call	indention_tac
	movq	%r14, %r9
	movl	$3, %r8d
	movl	$1, %edx
	leaq	.LC98(%rip), %rcx
	call	fwrite
	jmp	.L182
	.p2align 4,,10
	.p2align 3
.L185:
	call	indention_tac
	movq	%r14, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC99(%rip), %rcx
	call	fwrite
	jmp	.L187
	.p2align 4,,10
	.p2align 3
.L188:
	call	indention_tac
	movq	8(%rbx), %rax
	movq	%rdi, %rdx
	movq	%r14, %rcx
	movq	8(%rax), %r8
	call	fprintf
	movq	(%rbx), %rax
	xorl	%edx, %edx
	movq	%r14, %rcx
	testq	%rax, %rax
	je	.L266
.L190:
	cmpq	$0, (%rax)
	je	.L192
	call	indention_tac
	movq	(%rbx), %rax
	movq	%r14, %rcx
	movq	(%rax), %rdx
	movq	8(%rax), %r8
	movq	8(%rdx), %r9
	leaq	.LC102(%rip), %rdx
	call	fprintf
.L191:
	xorl	%edx, %edx
	movq	%r14, %rcx
	call	indention_tac
	movq	16(%rbx), %r8
	leaq	.LC103(%rip), %rdx
	movq	%r14, %rcx
	call	fprintf
.L187:
	movq	(%rsi), %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L267
	cmpq	$0, 8(%rbx)
	leaq	3(%r13), %rdx
	movq	%r14, %rcx
	jne	.L188
	call	indention_tac
	movl	$1, %edx
	movq	%r14, %r9
	leaq	.LC100(%rip), %rcx
	movl	$5, %r8d
	call	fwrite
	movq	(%rbx), %rax
	xorl	%edx, %edx
	movq	%r14, %rcx
	testq	%rax, %rax
	jne	.L190
.L266:
	call	indention_tac
	movq	%r14, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC95(%rip), %rcx
	call	fwrite
	jmp	.L191
	.p2align 4,,10
	.p2align 3
.L192:
	call	indention_tac
	movq	(%rbx), %rax
	movq	%r12, %rdx
	movq	%r14, %rcx
	movq	8(%rax), %r8
	call	fprintf
	jmp	.L191
	.p2align 4,,10
	.p2align 3
.L267:
	movq	%r15, %rdx
	movq	%r14, %rcx
	call	indention_tac
	movq	56(%rsp), %rcx
	movq	%r14, %r9
	movl	$2, %r8d
	movl	$1, %edx
	call	fwrite
	jmp	.L182
	.p2align 4,,10
	.p2align 3
.L265:
	call	indention_tac
	movq	%r14, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC95(%rip), %rcx
	call	fwrite
	jmp	.L184
.L264:
	movq	%rbp, %rdx
	movq	%r14, %rcx
	leaq	.LC105(%rip), %r12
	call	indention_tac
	movq	%r14, %r9
	movl	$1, %edx
	movq	%r12, %rcx
	movl	$2, %r8d
	call	fwrite
	jmp	.L181
.L201:
	call	indention_tac
	movq	%r14, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC111(%rip), %rcx
	leaq	.LC105(%rip), %r12
	call	fwrite
	leaq	.L226(%rip), %r15
	movq	%rbp, 88(%rsp)
	movq	%r12, 64(%rsp)
	jmp	.L203
	.p2align 4,,10
	.p2align 3
.L271:
	call	indention_tac
	movq	%r14, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC116(%rip), %rcx
	call	fwrite
.L209:
	movq	24(%rsi), %rcx
	call	list_is_empty
	movq	%rdi, %rdx
	movq	%r14, %rcx
	testb	%al, %al
	je	.L212
	call	indention_tac
	movq	%r14, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC118(%rip), %rcx
	call	fwrite
.L213:
	movq	32(%rsi), %rcx
	call	list_is_empty
	movq	%rdi, %rdx
	movq	%r14, %rcx
	testb	%al, %al
	je	.L216
	call	indention_tac
	movq	%r14, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC120(%rip), %rcx
	call	fwrite
.L217:
	movq	%rbp, %rdx
	movq	%r14, %rcx
	call	indention_tac
	movq	56(%rsp), %rcx
	movq	%r14, %r9
	movl	$2, %r8d
	movl	$1, %edx
	call	fwrite
.L203:
	movq	48(%rsp), %rax
	movq	24(%rax), %rcx
	call	list_pop
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L268
	leaq	2(%r13), %rbp
	cmpq	$0, (%rsi)
	movq	%r14, %rcx
	movq	%rbp, %rdx
	je	.L269
	call	indention_tac
	movq	(%rsi), %rax
	leaq	.LC113(%rip), %rdx
	movq	%r14, %rcx
	movq	8(%rax), %r8
	call	fprintf
.L205:
	leaq	3(%r13), %rdi
	cmpq	$0, 8(%rsi)
	movq	%r14, %rcx
	movq	%rdi, %rdx
	je	.L270
	call	indention_tac
	movq	8(%rsi), %rax
	leaq	.LC115(%rip), %rdx
	movq	%r14, %rcx
	movq	8(%rax), %r8
	call	fprintf
.L207:
	movq	16(%rsi), %rcx
	call	list_is_empty
	movq	%rdi, %rdx
	movq	%r14, %rcx
	testb	%al, %al
	jne	.L271
	call	indention_tac
	movq	%r14, %r9
	leaq	4(%r13), %rbx
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC117(%rip), %rcx
	call	fwrite
	jmp	.L210
	.p2align 4,,10
	.p2align 3
.L211:
	movq	%rbx, %r8
	movq	%r14, %rdx
	call	output_var
.L210:
	movq	16(%rsi), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L211
	movq	%rdi, %rdx
	movq	%r14, %rcx
	call	indention_tac
	movq	64(%rsp), %rcx
	movq	%r14, %r9
	movl	$2, %r8d
	movl	$1, %edx
	call	fwrite
	jmp	.L209
	.p2align 4,,10
	.p2align 3
.L216:
	call	indention_tac
	movq	%r14, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC121(%rip), %rcx
	call	fwrite
	movq	%rbp, 72(%rsp)
	movq	%rsi, 40(%rsp)
	movq	%rdi, 80(%rsp)
	.p2align 4,,10
	.p2align 3
.L218:
	movq	40(%rsp), %rax
	movq	32(%rax), %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L272
	leaq	4(%r13), %r12
	cmpq	$0, (%rbx)
	movq	%r14, %rcx
	movq	%r12, %rdx
	je	.L273
	call	indention_tac
	movq	(%rbx), %rax
	leaq	.LC96(%rip), %rdx
	movq	%r14, %rcx
	movq	8(%rax), %r8
	call	fprintf
.L220:
	movq	8(%rbx), %rcx
	call	list_is_empty
	xorl	%edx, %edx
	movq	%r14, %rcx
	testb	%al, %al
	je	.L221
	call	indention_tac
	movq	%r14, %r9
	movl	$3, %r8d
	movl	$1, %edx
	leaq	.LC98(%rip), %rcx
	call	fwrite
	jmp	.L218
	.p2align 4,,10
	.p2align 3
.L221:
	call	indention_tac
	movq	%r14, %r9
	leaq	5(%r13), %rdi
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC99(%rip), %rcx
	movl	$1, %ebp
	call	fwrite
	.p2align 4,,10
	.p2align 3
.L223:
	movq	8(%rbx), %rcx
	call	list_pop
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L274
	cmpl	$25, 24(%rsi)
	ja	.L224
	movl	24(%rsi), %eax
	movq	%rdi, %rdx
	movq	%r14, %rcx
	movslq	(%r15,%rax,4), %rax
	addq	%r15, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L226:
	.long	.L251-.L226
	.long	.L250-.L226
	.long	.L249-.L226
	.long	.L248-.L226
	.long	.L247-.L226
	.long	.L246-.L226
	.long	.L245-.L226
	.long	.L244-.L226
	.long	.L243-.L226
	.long	.L242-.L226
	.long	.L241-.L226
	.long	.L240-.L226
	.long	.L239-.L226
	.long	.L238-.L226
	.long	.L237-.L226
	.long	.L236-.L226
	.long	.L235-.L226
	.long	.L234-.L226
	.long	.L233-.L226
	.long	.L232-.L226
	.long	.L231-.L226
	.long	.L230-.L226
	.long	.L229-.L226
	.long	.L228-.L226
	.long	.L227-.L226
	.long	.L225-.L226
	.text
	.p2align 4,,10
	.p2align 3
.L227:
	call	indention_tac
	movq	%r14, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC146(%rip), %rcx
	call	fwrite
	.p2align 4,,10
	.p2align 3
.L252:
	movq	(%rsi), %rcx
	movq	%r14, %rdx
	call	output_arg
	movl	24(%rsi), %ecx
	cmpl	$24, %ecx
	ja	.L223
	movq	%rbp, %rax
	salq	%cl, %rax
	testl	$4825087, %eax
	jne	.L254
	testl	$25583616, %eax
	jne	.L255
	testl	$3145728, %eax
	je	.L223
.L256:
	xorl	%edx, %edx
	movq	%r14, %rcx
	call	indention_tac
	movq	%r14, %rdx
	movl	$10, %ecx
	call	fputc
	jmp	.L223
	.p2align 4,,10
	.p2align 3
.L228:
	call	indention_tac
	movq	%r14, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC145(%rip), %rcx
	call	fwrite
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L229:
	call	indention_tac
	movq	%r14, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC144(%rip), %rcx
	call	fwrite
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L230:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC143(%rip), %rcx
	call	fwrite
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L231:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC142(%rip), %rcx
	call	fwrite
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L232:
	call	indention_tac
	movq	%r14, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC141(%rip), %rcx
	call	fwrite
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L233:
	call	indention_tac
	movq	%r14, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC140(%rip), %rcx
	call	fwrite
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L234:
	call	indention_tac
	movq	%r14, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC139(%rip), %rcx
	call	fwrite
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L235:
	call	indention_tac
	movq	%r14, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC138(%rip), %rcx
	call	fwrite
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L236:
	call	indention_tac
	movq	%r14, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC137(%rip), %rcx
	call	fwrite
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L237:
	call	indention_tac
	movq	%r14, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC136(%rip), %rcx
	call	fwrite
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L238:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC135(%rip), %rcx
	call	fwrite
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L239:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC134(%rip), %rcx
	call	fwrite
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L240:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC133(%rip), %rcx
	call	fwrite
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L241:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC132(%rip), %rcx
	call	fwrite
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L242:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC131(%rip), %rcx
	call	fwrite
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L243:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC130(%rip), %rcx
	call	fwrite
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L244:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC129(%rip), %rcx
	call	fwrite
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L245:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC128(%rip), %rcx
	call	fwrite
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L246:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC127(%rip), %rcx
	call	fwrite
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L247:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC126(%rip), %rcx
	call	fwrite
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L248:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC125(%rip), %rcx
	call	fwrite
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L249:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC124(%rip), %rcx
	call	fwrite
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L250:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC123(%rip), %rcx
	call	fwrite
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L251:
	call	indention_tac
	movq	%r14, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC122(%rip), %rcx
	call	fwrite
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L225:
	call	indention_tac
	movq	%r14, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC147(%rip), %rcx
	call	fwrite
	jmp	.L223
	.p2align 4,,10
	.p2align 3
.L255:
	xorl	%edx, %edx
	movq	%r14, %rcx
	call	indention_tac
	movq	%r14, %rdx
	movl	$32, %ecx
	call	fputc
	movq	8(%rsi), %rcx
	movq	%r14, %rdx
	call	output_arg
	jmp	.L256
	.p2align 4,,10
	.p2align 3
.L254:
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
	jmp	.L256
	.p2align 4,,10
	.p2align 3
.L274:
	movq	%r12, %rdx
	movq	%r14, %rcx
	call	indention_tac
	movq	56(%rsp), %rcx
	movq	%r14, %r9
	movl	$2, %r8d
	movl	$1, %edx
	call	fwrite
	jmp	.L218
	.p2align 4,,10
	.p2align 3
.L273:
	call	indention_tac
	movq	%r14, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC95(%rip), %rcx
	call	fwrite
	jmp	.L220
	.p2align 4,,10
	.p2align 3
.L272:
	movq	80(%rsp), %rdx
	movq	%r14, %rcx
	movq	72(%rsp), %rbp
	call	indention_tac
	movq	64(%rsp), %rcx
	movq	%r14, %r9
	movl	$2, %r8d
	movl	$1, %edx
	call	fwrite
	jmp	.L217
	.p2align 4,,10
	.p2align 3
.L212:
	call	indention_tac
	movq	%r14, %r9
	leaq	4(%r13), %rbx
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC119(%rip), %rcx
	call	fwrite
	jmp	.L214
	.p2align 4,,10
	.p2align 3
.L215:
	movq	%rbx, %r8
	movq	%r14, %rdx
	call	output_var
.L214:
	movq	24(%rsi), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L215
	movq	%rdi, %rdx
	movq	%r14, %rcx
	call	indention_tac
	movq	64(%rsp), %rcx
	movq	%r14, %r9
	movl	$2, %r8d
	movl	$1, %edx
	call	fwrite
	jmp	.L213
.L224:
	movq	%rdi, %rdx
	movq	%r14, %rcx
	call	indention_tac
	movl	24(%rsi), %r8d
	leaq	.LC148(%rip), %rdx
	movq	%r14, %rcx
	call	fprintf
	jmp	.L223
	.p2align 4,,10
	.p2align 3
.L270:
	call	indention_tac
	movq	%r14, %r9
	movl	$20, %r8d
	movl	$1, %edx
	leaq	.LC114(%rip), %rcx
	call	fwrite
	jmp	.L207
	.p2align 4,,10
	.p2align 3
.L269:
	call	indention_tac
	movq	%r14, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC112(%rip), %rcx
	call	fwrite
	jmp	.L205
.L197:
	call	indention_tac
	movq	%r14, %r9
	leaq	2(%r13), %rbx
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC109(%rip), %rcx
	call	fwrite
	movq	48(%rsp), %rsi
	jmp	.L199
	.p2align 4,,10
	.p2align 3
.L200:
	movq	%rbx, %r8
	movq	%r14, %rdx
	call	output_var
.L199:
	movq	16(%rsi), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L200
	movq	%rbp, %rdx
	movq	%r14, %rcx
	leaq	.LC105(%rip), %r12
	call	indention_tac
	movq	%r14, %r9
	movl	$1, %edx
	movq	%r12, %rcx
	movl	$2, %r8d
	call	fwrite
	jmp	.L198
.L268:
	movq	88(%rsp), %rbp
	movq	64(%rsp), %r12
	movq	%r14, %rcx
	movq	%rbp, %rdx
	call	indention_tac
	movq	%r14, %r9
	movl	$1, %edx
	movq	%r12, %rcx
	movl	$2, %r8d
	call	fwrite
	jmp	.L202
.L263:
	call	indention_tac
	movq	%r14, %r9
	movl	$20, %r8d
	movl	$1, %edx
	leaq	.LC106(%rip), %rcx
	call	fwrite
	jmp	.L196
.L262:
	call	indention_tac
	movq	%r14, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC91(%rip), %rcx
	jmp	.L261
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
