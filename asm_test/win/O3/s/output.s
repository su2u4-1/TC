	.file	"D:\\TC\\src\\output.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Name pointer: \"NULL\"\12\0"
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
	movq	(%rsi), %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	fprintf
	xorl	%r8d, %r8d
	movq	%rdi, %r9
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	8(%rsi), %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	fprintf
	cmpl	$5, 24(%rsi)
	ja	.L5
	movl	24(%rsi), %eax
	movq	%rdi, %r9
	movslq	0(%r13,%rax,4), %rax
	addq	%r13, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L7:
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
	movl	$1, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC9(%rip), %rcx
.L22:
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
.L9:
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC8(%rip), %rcx
.L20:
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
	movq	16(%rsi), %rsi
.L13:
	leaq	1(%r12), %rax
	testq	%rsi, %rsi
	je	.L2
	movq	%rax, %r12
	jmp	.L4
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
	leaq	.LC6(%rip), %rcx
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L11:
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rcx
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
	movq	16(%rsi), %rsi
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L12:
	movl	$1, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC3(%rip), %rcx
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L6:
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC10(%rip), %rcx
	jmp	.L21
.L5:
	movq	%rdi, %r9
	movl	$1, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$25, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rcx
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L2:
	movq	%rdi, %r9
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$21, %r8d
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	jmp	.L22
	.section .rdata,"dr"
.LC12:
	.ascii "primary\12\0"
.LC13:
	.ascii "type: \"integer\"\12\0"
.LC14:
	.ascii "value: %s\12\0"
.LC15:
	.ascii "type: \"float\"\12\0"
.LC16:
	.ascii "type: \"string\"\12\0"
.LC17:
	.ascii "value: \"%s\"\12\0"
.LC18:
	.ascii "type: \"boolean\"\12\0"
.LC19:
	.ascii "value: \"true\"\12\0"
.LC20:
	.ascii "value: \"false\"\12\0"
.LC21:
	.ascii "type: \"expression\"\12\0"
.LC22:
	.ascii "value\12\0"
.LC23:
	.ascii "type: \"!\"\12\0"
.LC24:
	.ascii "type: \"-\"\12\0"
.LC25:
	.ascii "type: \"variable\"\12\0"
.LC26:
	.ascii "unknown_PrimaryType: %u\12\0"
.LC27:
	.ascii "operator: \"%s\"\12\0"
.LC28:
	.ascii "left\12\0"
.LC29:
	.ascii "right\12\0"
.LC30:
	.ascii "UNKNOWN_OPERATOR\0"
	.text
	.p2align 4
	.def	output_expression;	.scl	3;	.type	32;	.endef
output_expression:
	pushq	%r15
	leaq	.L29(%rip), %r15
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
.L38:
	movl	24(%rbp), %ecx
	leaq	.LC28(%rip), %r13
	leaq	.LC29(%rip), %r12
	cmpl	$19, %ecx
	je	.L58
.L25:
	call	operator_to_string
	xorl	%r8d, %r8d
	movq	%rdi, %r9
	movq	%rsi, %rdx
	movq	%rax, %r14
	movq	%rbx, %rcx
	call	indention
	movq	%r14, %r8
	testq	%r14, %r14
	je	.L59
.L53:
	leaq	.LC27(%rip), %rdx
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
	je	.L41
	movq	%r14, %rsi
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L59:
	leaq	.LC30(%rip), %r8
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L58:
	movq	%rsi, %r14
.L41:
	movq	%rdi, %r9
	movl	$1, %r8d
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	leaq	2(%r14), %rsi
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC12(%rip), %rcx
	call	fwrite
	movq	8(%rbp), %rbp
.L26:
	cmpl	$8, 8(%rbp)
	leaq	-1(%rsi), %r12
	ja	.L27
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
.L29:
	.long	.L37-.L29
	.long	.L36-.L29
	.long	.L35-.L29
	.long	.L34-.L29
	.long	.L33-.L29
	.long	.L32-.L29
	.long	.L31-.L29
	.long	.L30-.L29
	.long	.L28-.L29
	.text
	.p2align 4,,10
	.p2align 3
.L30:
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC24(%rip), %rcx
.L54:
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
	leaq	.LC22(%rip), %rcx
	call	fwrite
	movq	0(%rbp), %rbp
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L28:
	call	indention
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC25(%rip), %rcx
	call	fwrite
	movq	%rdi, %r9
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC22(%rip), %rcx
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
.L37:
	call	indention
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC13(%rip), %rcx
.L55:
	call	fwrite
	movq	%r12, %rdx
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	0(%rbp), %r8
	leaq	.LC14(%rip), %rdx
.L56:
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
.L36:
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC15(%rip), %rcx
	jmp	.L55
	.p2align 4,,10
	.p2align 3
.L35:
	call	indention
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC16(%rip), %rcx
	call	fwrite
	movq	%r12, %rdx
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	0(%rbp), %r8
	leaq	.LC17(%rip), %rdx
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L34:
	call	indention
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC18(%rip), %rcx
	call	fwrite
	movq	%rdi, %r9
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC19(%rip), %rcx
.L57:
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
.L33:
	call	indention
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC18(%rip), %rcx
	call	fwrite
	movq	%rdi, %r9
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC20(%rip), %rcx
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L32:
	call	indention
	movq	%rbx, %r9
	movl	$19, %r8d
	movl	$1, %edx
	leaq	.LC21(%rip), %rcx
	call	fwrite
	movq	%rdi, %r9
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC22(%rip), %rcx
	call	fwrite
	movq	0(%rbp), %rbp
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L31:
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC23(%rip), %rcx
	jmp	.L54
.L27:
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movq	%rdi, %r9
	movl	$1, %r8d
	call	indention
	movl	8(%rbp), %r8d
	addq	$40, %rsp
	movq	%rbx, %rcx
	leaq	.LC26(%rip), %rdx
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
.LC31:
	.ascii "name\12\0"
.LC32:
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
	leaq	.LC31(%rip), %rcx
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
	je	.L61
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC22(%rip), %rcx
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
.L61:
	call	indention
	addq	$32, %rsp
	movq	%rbx, %r9
	movl	$14, %r8d
	popq	%rbx
	movl	$1, %edx
	leaq	.LC32(%rip), %rcx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	fwrite
	.section .rdata,"dr"
.LC33:
	.ascii "type: \"name\"\12\0"
.LC34:
	.ascii "type: \"function_call\"\12\0"
.LC35:
	.ascii "function\12\0"
.LC36:
	.ascii "arguments\12\0"
.LC37:
	.ascii "arguments[%d]\12\0"
.LC38:
	.ascii "type: \"get sequence_element\"\12\0"
.LC39:
	.ascii "sequence\12\0"
.LC40:
	.ascii "index\12\0"
.LC41:
	.ascii "type: \"get_attribute\"\12\0"
.LC42:
	.ascii "object\12\0"
.LC43:
	.ascii "attribute_name\12\0"
	.align 8
.LC44:
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
	je	.L64
	ja	.L65
	testl	%eax, %eax
	je	.L78
	movq	8(%rcx), %rcx
	leaq	1(%rbp), %r14
	movl	$-1, %r12d
	leaq	.LC37(%rip), %r15
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
	leaq	.LC34(%rip), %rcx
	call	fwrite
	movq	%rbp, %rdx
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC35(%rip), %rcx
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
	leaq	.LC36(%rip), %rcx
	call	fwrite
	jmp	.L70
	.p2align 4,,10
	.p2align 3
.L71:
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
.L70:
	movq	%r13, %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L71
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
.L65:
	cmpl	$3, %eax
	jne	.L79
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	leaq	1(%rbp), %r12
	xorl	%r8d, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$29, %r8d
	movl	$1, %edx
	leaq	.LC38(%rip), %rcx
	call	fwrite
	movq	%rsi, %r9
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC39(%rip), %rcx
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
	leaq	.LC40(%rip), %rcx
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
.L64:
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	leaq	1(%rbp), %r12
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$22, %r8d
	movl	$1, %edx
	leaq	.LC41(%rip), %rcx
	call	fwrite
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC42(%rip), %rcx
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
	leaq	.LC43(%rip), %rcx
	movl	$1, %edx
	call	fwrite
	movq	8(%rdi), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
.L77:
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
.L78:
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC33(%rip), %rcx
	call	fwrite
	movq	%rsi, %r9
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	leaq	.LC31(%rip), %rcx
	movl	$1, %edx
	call	fwrite
	movq	8(%rdi), %rcx
	movq	%rsi, %r9
	leaq	1(%rbp), %r8
	jmp	.L77
	.p2align 4,,10
	.p2align 3
.L79:
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movl	16(%rdi), %r8d
	addq	$40, %rsp
	movq	%rbx, %rcx
	leaq	.LC44(%rip), %rdx
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
.LC45:
	.ascii "if_statement\12\0"
.LC46:
	.ascii "condition\12\0"
.LC47:
	.ascii "body\12\0"
.LC48:
	.ascii "else_if\12\0"
.LC49:
	.ascii "else_body\12\0"
.LC50:
	.ascii "for_statement\12\0"
.LC51:
	.ascii "initializer\12\0"
.LC52:
	.ascii "initializer: \"NULL\"\12\0"
.LC53:
	.ascii "condition: \"NULL\"\12\0"
.LC54:
	.ascii "increment\12\0"
.LC55:
	.ascii "increment: \"NULL\"\12\0"
.LC56:
	.ascii "while_statement\12\0"
	.align 8
.LC57:
	.ascii "variable_declaration_statement\12\0"
.LC58:
	.ascii "return_statement: \"NULL\"\12\0"
.LC59:
	.ascii "return_statement\12\0"
.LC60:
	.ascii "break_statement: \"NULL\"\12\0"
.LC61:
	.ascii "continue_statement: \"NULL\"\12\0"
.LC62:
	.ascii "expression_statement: \"NULL\"\12\0"
.LC63:
	.ascii "expression_statement\12\0"
.LC64:
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
	ja	.L81
	movl	8(%rcx), %eax
	leaq	.L83(%rip), %rdx
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	movq	%rdi, %rdx
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L83:
	.long	.L90-.L83
	.long	.L89-.L83
	.long	.L88-.L83
	.long	.L87-.L83
	.long	.L86-.L83
	.long	.L85-.L83
	.long	.L84-.L83
	.long	.L82-.L83
	.text
	.p2align 4,,10
	.p2align 3
.L84:
	call	indention
	movq	%rbx, %r9
	movl	$24, %r8d
	movl	$1, %edx
	leaq	.LC60(%rip), %rcx
.L114:
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
.L82:
	call	indention
	movq	%rbx, %r9
	movl	$27, %r8d
	movl	$1, %edx
	leaq	.LC61(%rip), %rcx
	jmp	.L114
	.p2align 4,,10
	.p2align 3
.L90:
	cmpq	$0, 0(%rbp)
	je	.L116
	call	indention
	movq	%rbx, %r9
	movl	$21, %r8d
	movl	$1, %edx
	leaq	.LC63(%rip), %rcx
.L115:
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
.L89:
	call	indention
	movq	%rbx, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC57(%rip), %rcx
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
.L88:
	call	indention
	movq	%rbx, %r9
	leaq	1(%rdi), %r13
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC45(%rip), %rcx
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
	leaq	.LC46(%rip), %r13
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
	leaq	.LC47(%rip), %r14
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
	jmp	.L91
	.p2align 4,,10
	.p2align 3
.L92:
	movq	%rbp, %r8
	movq	%rbx, %rdx
	call	output_statement
.L91:
	movq	%r15, %rcx
	call	list_pop
	movq	%rsi, %r9
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L92
	movq	56(%rsp), %rdx
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	leaq	3(%rdi), %r15
	call	indention
	movq	%rbx, %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC48(%rip), %rcx
	call	fwrite
.L93:
	movq	40(%rsp), %rcx
	call	list_pop
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L117
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
	je	.L93
.L95:
	movq	%rax, %rcx
	movq	%rsi, %r9
	movq	%r15, %r8
	movq	%rbx, %rdx
	call	output_statement
	movq	%rdi, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L95
	jmp	.L93
	.p2align 4,,10
	.p2align 3
.L87:
	call	indention
	movq	%rbx, %r9
	leaq	1(%rdi), %r12
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC56(%rip), %rcx
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
	leaq	.LC46(%rip), %rcx
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
	leaq	.LC47(%rip), %rcx
	call	fwrite
	jmp	.L109
	.p2align 4,,10
	.p2align 3
.L110:
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	output_statement
.L109:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L110
.L80:
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
.L86:
	call	indention
	movq	%rbx, %r9
	leaq	1(%rdi), %r13
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC50(%rip), %rcx
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
	je	.L100
	call	indention
	movq	%rbx, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC51(%rip), %rcx
	call	fwrite
	movq	(%r12), %rcx
	movq	%rsi, %r9
	leaq	2(%rdi), %r8
	movq	%rbx, %rdx
	call	output_variable
.L101:
	xorl	%r8d, %r8d
	cmpq	$0, 8(%r12)
	movq	%rsi, %r9
	movq	%r13, %rdx
	movq	%rbx, %rcx
	je	.L102
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC46(%rip), %rcx
	call	fwrite
	movq	8(%r12), %rcx
	movq	%rsi, %r9
	movq	%rbx, %rdx
	leaq	2(%rdi), %r8
	call	output_expression
.L103:
	xorl	%r8d, %r8d
	cmpq	$0, 16(%r12)
	movq	%rsi, %r9
	movq	%r13, %rdx
	movq	%rbx, %rcx
	je	.L104
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC54(%rip), %rcx
	call	fwrite
	movq	16(%r12), %rcx
	movq	%rsi, %r9
	movq	%rbx, %rdx
	leaq	2(%rdi), %r8
	call	output_expression
.L105:
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	addq	$2, %rdi
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC47(%rip), %rcx
	call	fwrite
	jmp	.L106
	.p2align 4,,10
	.p2align 3
.L107:
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	output_statement
.L106:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L107
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L85:
	cmpq	$0, 0(%rbp)
	je	.L118
	call	indention
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC59(%rip), %rcx
	jmp	.L115
.L81:
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	call	indention
	movl	8(%rbp), %r8d
	addq	$72, %rsp
	movq	%rbx, %rcx
	leaq	.LC64(%rip), %rdx
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
.L117:
	movq	56(%rsp), %rdx
	movq	%rsi, %r9
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC49(%rip), %rcx
	call	fwrite
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L98:
	movq	%rsi, %r9
	movq	%rbp, %r8
	movq	%rbx, %rdx
	call	output_statement
.L97:
	movq	48(%rsp), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L98
	jmp	.L80
.L100:
	call	indention
	movq	%rbx, %r9
	movl	$20, %r8d
	movl	$1, %edx
	leaq	.LC52(%rip), %rcx
	call	fwrite
	jmp	.L101
.L104:
	call	indention
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC55(%rip), %rcx
	call	fwrite
	jmp	.L105
.L102:
	call	indention
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC53(%rip), %rcx
	call	fwrite
	jmp	.L103
.L116:
	call	indention
	movq	%rbx, %r9
	movl	$29, %r8d
	movl	$1, %edx
	leaq	.LC62(%rip), %rcx
	jmp	.L114
.L118:
	call	indention
	movq	%rbx, %r9
	movl	$25, %r8d
	movl	$1, %edx
	leaq	.LC58(%rip), %rcx
	jmp	.L114
	.section .rdata,"dr"
.LC65:
	.ascii "NULL\0"
.LC66:
	.ascii "import\12\0"
.LC67:
	.ascii "source: \"%s\"\12\0"
.LC68:
	.ascii "parameters\12\0"
.LC69:
	.ascii "parameters[%d]\12\0"
.LC70:
	.ascii "class\12\0"
.LC71:
	.ascii "members\12\0"
.LC72:
	.ascii "method\12\0"
.LC73:
	.ascii "variable\12\0"
.LC74:
	.ascii "unknown_ClassMemberType: %u\12\0"
.LC75:
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
.L120:
	movq	72(%rsp), %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L144
	movl	8(%rbx), %eax
	leaq	1(%r14), %rdx
	movq	%r13, %r9
	xorl	%r8d, %r8d
	movq	%r15, %rcx
	cmpl	$1, %eax
	je	.L121
	cmpl	$2, %eax
	je	.L122
	testl	%eax, %eax
	jne	.L123
	call	indention
	leaq	2(%r14), %rsi
	movq	%r15, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC66(%rip), %rcx
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
	leaq	.LC31(%rip), %rcx
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
	leaq	.LC65(%rip), %r8
	movq	%r15, %rcx
	leaq	.LC67(%rip), %rdx
	testq	%rax, %rax
	cmovne	%rax, %r8
	call	fprintf
	jmp	.L120
	.p2align 4,,10
	.p2align 3
.L121:
	call	indention
	leaq	2(%r14), %rdi
	movq	%r15, %r9
	movl	$1, %edx
	movl	$9, %r8d
	leaq	.LC35(%rip), %rcx
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
	leaq	.LC31(%rip), %rcx
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
	leaq	.LC68(%rip), %rcx
	call	fwrite
	movq	16(%rbx), %rcx
	call	list_copy
	movq	24(%rbx), %rcx
	movl	$-1, %ebx
	movq	%rax, %rbp
	call	list_copy
	movq	%rax, 48(%rsp)
	jmp	.L126
	.p2align 4,,10
	.p2align 3
.L127:
	movq	%r13, %r9
	xorl	%r8d, %r8d
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	indention
	addl	$1, %ebx
	leaq	.LC69(%rip), %rdx
	movq	%r15, %rcx
	movl	%ebx, %r8d
	call	fprintf
	movq	%r13, %r9
	movq	%r12, %r8
	movq	%r15, %rdx
	movq	%rdi, %rcx
	call	output_variable
.L126:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L127
	movq	40(%rsp), %rdx
	movq	%r13, %r9
	movq	%r15, %rcx
	movq	48(%rsp), %rdi
	movl	$1, %r8d
	call	indention
	movq	%r15, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC47(%rip), %rcx
	call	fwrite
	jmp	.L128
	.p2align 4,,10
	.p2align 3
.L129:
	movq	%r13, %r9
	movq	%rsi, %r8
	movq	%r15, %rdx
	call	output_statement
.L128:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L129
	jmp	.L120
	.p2align 4,,10
	.p2align 3
.L123:
	call	indention
	movl	8(%rbx), %r8d
	leaq	.LC75(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
	jmp	.L120
	.p2align 4,,10
	.p2align 3
.L122:
	call	indention
	leaq	2(%r14), %rsi
	movq	%r15, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC70(%rip), %rcx
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
	leaq	.LC31(%rip), %rcx
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
	leaq	.LC71(%rip), %rcx
	call	fwrite
	movq	8(%rbx), %rcx
	call	list_copy
	movq	%rax, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L130:
	movq	40(%rsp), %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L120
	movl	8(%rbx), %eax
	testl	%eax, %eax
	je	.L131
	cmpl	$1, %eax
	je	.L132
	movq	48(%rsp), %rdx
	xorl	%r8d, %r8d
	movq	%r15, %rcx
	movq	%r13, %r9
	call	indention
	movl	8(%rbx), %r8d
	leaq	.LC74(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
	jmp	.L130
	.p2align 4,,10
	.p2align 3
.L131:
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
	leaq	.LC72(%rip), %rcx
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
	leaq	.LC31(%rip), %rcx
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
	leaq	.LC68(%rip), %rcx
	call	fwrite
	movq	16(%rbx), %rcx
	call	list_copy
	movq	24(%rbx), %rcx
	movl	$-1, %ebx
	movq	%rax, %rbp
	call	list_copy
	movq	%rax, 64(%rsp)
	jmp	.L134
	.p2align 4,,10
	.p2align 3
.L135:
	movq	%r13, %r9
	xorl	%r8d, %r8d
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	indention
	addl	$1, %ebx
	leaq	.LC69(%rip), %rdx
	movq	%r15, %rcx
	movl	%ebx, %r8d
	call	fprintf
	movq	%r13, %r9
	movq	%r12, %r8
	movq	%r15, %rdx
	movq	%rdi, %rcx
	call	output_variable
.L134:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L135
	movq	56(%rsp), %rdx
	movq	%r13, %r9
	movq	%r15, %rcx
	movq	64(%rsp), %rdi
	movl	$1, %r8d
	call	indention
	movq	%r15, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC47(%rip), %rcx
	call	fwrite
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L137:
	movq	%r13, %r9
	movq	%rsi, %r8
	movq	%r15, %rdx
	call	output_statement
.L136:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L137
	jmp	.L130
	.p2align 4,,10
	.p2align 3
.L132:
	movq	48(%rsp), %rdx
	movq	%r13, %r9
	xorl	%r8d, %r8d
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC73(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rcx
	movq	%r13, %r9
	leaq	4(%r14), %r8
	movq	%r15, %rdx
	call	output_variable
	jmp	.L130
	.p2align 4,,10
	.p2align 3
.L144:
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
	.ident	"GCC: (GNU) 13.2.0"
	.def	indention;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
