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
	.def	output_name;	.scl	3;	.type	32;	.endef
output_name:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rdx, %rbx
	movq	%r8, %rdi
	movq	%r9, %rbp
	testq	%rcx, %rcx
	je	.L14
	movq	%rcx, %rsi
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	8(%rsi), %r8
	leaq	.LC1(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	movq	%rbp, %r9
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	16(%rsi), %r8
	leaq	.LC2(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	cmpl	$6, 32(%rsi)
	ja	.L4
	movl	32(%rsi), %eax
	leaq	.L6(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
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
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	call	fwrite
.L1:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L5:
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC3(%rip), %rcx
	call	fwrite
	jmp	.L1
.L9:
	movq	%rbp, %r9
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rcx
	movq	%rbp, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_name
	jmp	.L1
.L11:
	movq	%rbp, %r9
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC6(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rcx
	movq	%rbp, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_name
	jmp	.L1
.L10:
	movq	%rbp, %r9
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC8(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rcx
	movq	%rbp, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_name
	jmp	.L1
.L12:
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC9(%rip), %rcx
	call	fwrite
	jmp	.L1
.L7:
	movq	%rbp, %r9
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC10(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rcx
	movq	%rbp, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_name
	jmp	.L1
.L8:
	movq	%rbp, %r9
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rcx
	movq	%rbp, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_name
	jmp	.L1
.L4:
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$25, %r8d
	movl	$1, %edx
	leaq	.LC12(%rip), %rcx
	call	fwrite
	jmp	.L1
	.section .rdata,"dr"
.LC13:
	.ascii "UNKNOWN_OPERATOR\0"
.LC14:
	.ascii "primary\12\0"
.LC15:
	.ascii "operator: \"%s\"\12\0"
.LC16:
	.ascii "left\12\0"
.LC17:
	.ascii "right\12\0"
	.text
	.def	output_expression;	.scl	3;	.type	32;	.endef
output_expression:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %r12
	movq	%rdx, %rbx
	movq	%r8, %rbp
	movq	%r9, %rsi
	movl	24(%rcx), %ecx
	cmpl	$19, %ecx
	je	.L21
	call	operator_to_string
	movq	%rax, %rdi
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	testq	%rdi, %rdi
	leaq	.LC13(%rip), %r8
	cmovne	%rdi, %r8
	leaq	.LC15(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC16(%rip), %rcx
	call	fwrite
	leaq	1(%rbp), %rdi
	movq	(%r12), %rcx
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	output_expression
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC17(%rip), %rcx
	call	fwrite
	movq	16(%r12), %rcx
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	output_expression
.L15:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L21:
	movl	$1, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC14(%rip), %rcx
	call	fwrite
	movq	8(%r12), %rcx
	movq	%rsi, %r9
	leaq	1(%rbp), %r8
	movq	%rbx, %rdx
	call	output_primary
	jmp	.L15
	.section .rdata,"dr"
.LC18:
	.ascii "name\12\0"
.LC19:
	.ascii "value\12\0"
.LC20:
	.ascii "value: \"NULL\"\12\0"
	.text
	.def	output_variable;	.scl	3;	.type	32;	.endef
output_variable:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbp
	movq	%rdx, %rbx
	movq	%r8, %rdi
	movq	%r9, %rsi
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rcx
	call	fwrite
	leaq	1(%rdi), %r12
	movq	0(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_name
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC18(%rip), %rcx
	call	fwrite
	movq	8(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_name
	cmpq	$0, 16(%rbp)
	je	.L23
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC19(%rip), %rcx
	call	fwrite
	movq	16(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_expression
.L22:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L23:
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC20(%rip), %rcx
	call	fwrite
	jmp	.L22
	.section .rdata,"dr"
.LC21:
	.ascii "type: \"name\"\12\0"
.LC22:
	.ascii "type: \"function_call\"\12\0"
.LC23:
	.ascii "function\12\0"
.LC24:
	.ascii "arguments\12\0"
.LC25:
	.ascii "arguments[%d]\12\0"
.LC26:
	.ascii "type: \"get sequence_element\"\12\0"
.LC27:
	.ascii "sequence\12\0"
.LC28:
	.ascii "index\12\0"
.LC29:
	.ascii "type: \"get_attribute\"\12\0"
.LC30:
	.ascii "object\12\0"
.LC31:
	.ascii "attribute_name\12\0"
	.align 8
.LC32:
	.ascii "unknown_VariableAccessType: %u\12\0"
	.text
	.def	output_variable_access;	.scl	3;	.type	32;	.endef
output_variable_access:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rdi
	movq	%rdx, %rbx
	movq	%r8, %rbp
	movq	%r9, %rsi
	movl	16(%rcx), %eax
	cmpl	$2, %eax
	je	.L27
	ja	.L28
	testl	%eax, %eax
	je	.L39
	movq	8(%rcx), %rcx
	call	list_copy
	movq	%rax, %r13
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$22, %r8d
	movl	$1, %edx
	leaq	.LC22(%rip), %rcx
	call	fwrite
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC23(%rip), %rcx
	call	fwrite
	leaq	1(%rbp), %r14
	movq	(%rdi), %rcx
	movq	%rsi, %r9
	movq	%r14, %r8
	movq	%rbx, %rdx
	call	output_variable_access
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC24(%rip), %rcx
	call	fwrite
	movl	$-1, %r12d
	leaq	.LC25(%rip), %r15
	addq	$2, %rbp
	jmp	.L34
.L28:
	cmpl	$3, %eax
	jne	.L40
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$29, %r8d
	movl	$1, %edx
	leaq	.LC26(%rip), %rcx
	call	fwrite
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC27(%rip), %rcx
	call	fwrite
	leaq	1(%rbp), %r12
	movq	(%rdi), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_variable_access
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC28(%rip), %rcx
	call	fwrite
	movq	8(%rdi), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_expression
	jmp	.L26
.L39:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC21(%rip), %rcx
	call	fwrite
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC18(%rip), %rcx
	call	fwrite
	movq	8(%rdi), %rcx
	movq	%rsi, %r9
	leaq	1(%rbp), %r8
	movq	%rbx, %rdx
	call	output_name
.L26:
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
.L35:
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	indention
	addl	$1, %r12d
	movl	%r12d, %r8d
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	fprintf
	movq	%rsi, %r9
	movq	%rbp, %r8
	movq	%rbx, %rdx
	movq	%rdi, %rcx
	call	output_expression
.L34:
	movq	%r13, %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L35
	jmp	.L26
.L27:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$22, %r8d
	movl	$1, %edx
	leaq	.LC29(%rip), %rcx
	call	fwrite
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC30(%rip), %rcx
	call	fwrite
	leaq	1(%rbp), %r12
	movq	(%rdi), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_variable_access
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC31(%rip), %rcx
	call	fwrite
	movq	8(%rdi), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_name
	jmp	.L26
.L40:
	movl	$1, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movl	16(%rdi), %r8d
	leaq	.LC32(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L26
	.section .rdata,"dr"
.LC33:
	.ascii "type: \"integer\"\12\0"
.LC34:
	.ascii "value: %s\12\0"
.LC35:
	.ascii "type: \"float\"\12\0"
.LC36:
	.ascii "type: \"string\"\12\0"
.LC37:
	.ascii "value: \"%s\"\12\0"
.LC38:
	.ascii "type: \"boolean\"\12\0"
.LC39:
	.ascii "value: \"true\"\12\0"
.LC40:
	.ascii "value: \"false\"\12\0"
.LC41:
	.ascii "type: \"expression\"\12\0"
.LC42:
	.ascii "type: \"!\"\12\0"
.LC43:
	.ascii "type: \"-\"\12\0"
.LC44:
	.ascii "type: \"variable\"\12\0"
.LC45:
	.ascii "unknown_PrimaryType: %u\12\0"
	.text
	.def	output_primary;	.scl	3;	.type	32;	.endef
output_primary:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rsi
	movq	%rdx, %rbx
	movq	%r8, %rdi
	movq	%r9, %rbp
	cmpl	$8, 8(%rcx)
	ja	.L42
	movl	8(%rcx), %eax
	leaq	.L44(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L44:
	.long	.L52-.L44
	.long	.L51-.L44
	.long	.L50-.L44
	.long	.L49-.L44
	.long	.L48-.L44
	.long	.L47-.L44
	.long	.L46-.L44
	.long	.L45-.L44
	.long	.L43-.L44
	.text
.L52:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC33(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	(%rsi), %r8
	leaq	.LC34(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
.L41:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L51:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC35(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	(%rsi), %r8
	leaq	.LC34(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L41
.L50:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC36(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	(%rsi), %r8
	leaq	.LC37(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L41
.L49:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC38(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC39(%rip), %rcx
	call	fwrite
	jmp	.L41
.L48:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC38(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC40(%rip), %rcx
	call	fwrite
	jmp	.L41
.L47:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$19, %r8d
	movl	$1, %edx
	leaq	.LC41(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC19(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rcx
	movq	%rbp, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_expression
	jmp	.L41
.L46:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC42(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC19(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rcx
	movq	%rbp, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_primary
	jmp	.L41
.L45:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC43(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC19(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rcx
	movq	%rbp, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_primary
	jmp	.L41
.L43:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC44(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC19(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rcx
	movq	%rbp, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_variable_access
	jmp	.L41
.L42:
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movl	8(%rsi), %r8d
	leaq	.LC45(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L41
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
	.def	output_statement;	.scl	3;	.type	32;	.endef
output_statement:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	movq	%rcx, %rdi
	movq	%rdx, %rbx
	movq	%r8, %rbp
	movq	%r9, %rsi
	cmpl	$7, 8(%rcx)
	ja	.L56
	movl	8(%rcx), %eax
	leaq	.L58(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
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
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC46(%rip), %rcx
	call	fwrite
	leaq	1(%rbp), %r15
	movq	%r15, 40(%rsp)
	movq	(%rdi), %r12
	movq	8(%r12), %rcx
	call	list_copy
	movq	%rax, %rdi
	movq	16(%r12), %rcx
	call	list_copy
	movq	%rax, %r14
	movq	24(%r12), %rcx
	call	list_copy
	movq	%rax, 32(%rsp)
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC47(%rip), %rcx
	call	fwrite
	leaq	2(%rbp), %r13
	movq	(%r12), %rcx
	movq	%rsi, %r9
	movq	%r13, %r8
	movq	%rbx, %rdx
	call	output_expression
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC48(%rip), %rcx
	call	fwrite
.L66:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L88
	movq	%rsi, %r9
	movq	%r13, %r8
	movq	%rbx, %rdx
	call	output_statement
	jmp	.L66
.L88:
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	40(%rsp), %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC49(%rip), %rcx
	call	fwrite
	leaq	.LC47(%rip), %r15
	addq	$3, %rbp
.L68:
	movq	%r14, %rcx
	call	list_pop
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L89
	movq	8(%r12), %rcx
	call	list_copy
	movq	%rax, %rdi
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	movq	%r15, %rcx
	call	fwrite
	movq	(%r12), %rcx
	movq	%rsi, %r9
	movq	%rbp, %r8
	movq	%rbx, %rdx
	call	output_expression
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC48(%rip), %rcx
	call	fwrite
.L69:
	movq	%rdi, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L68
	movq	%rsi, %r9
	movq	%rbp, %r8
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	output_statement
	jmp	.L69
.L89:
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	40(%rsp), %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC50(%rip), %rcx
	call	fwrite
.L72:
	movq	32(%rsp), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L55
	movq	%rsi, %r9
	movq	%r13, %r8
	movq	%rbx, %rdx
	call	output_statement
	jmp	.L72
.L61:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC51(%rip), %rcx
	call	fwrite
	leaq	1(%rbp), %r13
	movq	(%rdi), %r12
	movq	24(%r12), %rcx
	call	list_copy
	movq	%rax, %rdi
	cmpq	$0, (%r12)
	je	.L75
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC52(%rip), %rcx
	call	fwrite
	movq	(%r12), %rcx
	movq	%rsi, %r9
	leaq	2(%rbp), %r8
	movq	%rbx, %rdx
	call	output_variable
.L76:
	cmpq	$0, 8(%r12)
	je	.L77
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC47(%rip), %rcx
	call	fwrite
	movq	8(%r12), %rcx
	movq	%rsi, %r9
	leaq	2(%rbp), %r8
	movq	%rbx, %rdx
	call	output_expression
.L78:
	cmpq	$0, 16(%r12)
	je	.L79
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC55(%rip), %rcx
	call	fwrite
	movq	16(%r12), %rcx
	movq	%rsi, %r9
	leaq	2(%rbp), %r8
	movq	%rbx, %rdx
	call	output_expression
.L80:
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC48(%rip), %rcx
	call	fwrite
	addq	$2, %rbp
.L81:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L55
	movq	%rsi, %r9
	movq	%rbp, %r8
	movq	%rbx, %rdx
	call	output_statement
	jmp	.L81
.L75:
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$20, %r8d
	movl	$1, %edx
	leaq	.LC53(%rip), %rcx
	call	fwrite
	jmp	.L76
.L77:
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC54(%rip), %rcx
	call	fwrite
	jmp	.L78
.L79:
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC56(%rip), %rcx
	call	fwrite
	jmp	.L80
.L62:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC57(%rip), %rcx
	call	fwrite
	leaq	1(%rbp), %r12
	movq	(%rdi), %r13
	movq	8(%r13), %rcx
	call	list_copy
	movq	%rax, %rdi
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC47(%rip), %rcx
	call	fwrite
	addq	$2, %rbp
	movq	0(%r13), %rcx
	movq	%rsi, %r9
	movq	%rbp, %r8
	movq	%rbx, %rdx
	call	output_expression
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC48(%rip), %rcx
	call	fwrite
.L83:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L55
	movq	%rsi, %r9
	movq	%rbp, %r8
	movq	%rbx, %rdx
	call	output_statement
	jmp	.L83
.L64:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC58(%rip), %rcx
	call	fwrite
	movq	(%rdi), %rcx
	movq	%rsi, %r9
	leaq	1(%rbp), %r8
	movq	%rbx, %rdx
	call	output_variable
.L55:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L60:
	cmpq	$0, (%rcx)
	je	.L90
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC60(%rip), %rcx
	call	fwrite
	movq	(%rdi), %rcx
	movq	%rsi, %r9
	leaq	1(%rbp), %r8
	movq	%rbx, %rdx
	call	output_expression
	jmp	.L55
.L90:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$25, %r8d
	movl	$1, %edx
	leaq	.LC59(%rip), %rcx
	call	fwrite
	jmp	.L55
.L59:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$24, %r8d
	movl	$1, %edx
	leaq	.LC61(%rip), %rcx
	call	fwrite
	jmp	.L55
.L57:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$27, %r8d
	movl	$1, %edx
	leaq	.LC62(%rip), %rcx
	call	fwrite
	jmp	.L55
.L65:
	cmpq	$0, (%rcx)
	je	.L91
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$21, %r8d
	movl	$1, %edx
	leaq	.LC64(%rip), %rcx
	call	fwrite
	movq	(%rdi), %rcx
	movq	%rsi, %r9
	leaq	1(%rbp), %r8
	movq	%rbx, %rdx
	call	output_expression
	jmp	.L55
.L91:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$29, %r8d
	movl	$1, %edx
	leaq	.LC63(%rip), %rcx
	call	fwrite
	jmp	.L55
.L56:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movl	8(%rdi), %r8d
	leaq	.LC65(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L55
	.section .rdata,"dr"
.LC66:
	.ascii "Var: \"NULL\"\12\0"
.LC67:
	.ascii "NULL\11%s\12\0"
.LC68:
	.ascii "%s\11%s\12\0"
	.text
	.def	output_var;	.scl	3;	.type	32;	.endef
output_var:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rdx, %rsi
	movq	%r8, %rdx
	testq	%rcx, %rcx
	je	.L97
	movq	%rcx, %rbx
	cmpq	$0, 16(%rcx)
	je	.L98
	movq	%rsi, %rcx
	call	indention_tac
	movq	16(%rbx), %rax
	movq	8(%rbx), %r9
	movq	8(%rax), %r8
	leaq	.LC68(%rip), %rdx
	movq	%rsi, %rcx
	call	fprintf
.L92:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L97:
	movq	%rsi, %rcx
	call	indention_tac
	movq	%rsi, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC66(%rip), %rcx
	call	fwrite
	jmp	.L92
.L98:
	movq	%rsi, %rcx
	call	indention_tac
	movq	8(%rbx), %r8
	leaq	.LC67(%rip), %rdx
	movq	%rsi, %rcx
	call	fprintf
	jmp	.L92
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
	.def	output_arg;	.scl	3;	.type	32;	.endef
output_arg:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rdx, %rsi
	testq	%rcx, %rcx
	je	.L116
	movq	%rcx, %rbx
	cmpl	$8, 16(%rcx)
	ja	.L102
	movl	16(%rcx), %eax
	leaq	.L104(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L104:
	.long	.L112-.L104
	.long	.L111-.L104
	.long	.L110-.L104
	.long	.L109-.L104
	.long	.L108-.L104
	.long	.L107-.L104
	.long	.L106-.L104
	.long	.L105-.L104
	.long	.L103-.L104
	.text
.L116:
	movl	$0, %edx
	movq	%rsi, %rcx
	call	indention_tac
	movq	%rsi, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC71(%rip), %rcx
	call	fwrite
.L99:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L112:
	movl	$0, %edx
	movq	%rsi, %rcx
	call	indention_tac
	movq	(%rbx), %rax
	movq	8(%rax), %rcx
	movq	%rsi, %rdx
	call	fputs
	jmp	.L99
.L111:
	movl	$0, %edx
	movq	%rsi, %rcx
	call	indention_tac
	movq	(%rbx), %r8
	leaq	.LC72(%rip), %rdx
	movq	%rsi, %rcx
	call	fprintf
	jmp	.L99
.L110:
	movl	$0, %edx
	movq	%rsi, %rcx
	call	indention_tac
	movq	(%rbx), %r8
	movq	%r8, %xmm2
	leaq	.LC73(%rip), %rdx
	movq	%rsi, %rcx
	call	fprintf
	jmp	.L99
.L109:
	movl	$0, %edx
	movq	%rsi, %rcx
	call	indention_tac
	movq	(%rbx), %rcx
	movq	%rsi, %rdx
	call	fputs
	jmp	.L99
.L108:
	movl	$0, %edx
	movq	%rsi, %rcx
	call	indention_tac
	cmpb	$0, (%rbx)
	leaq	.LC70(%rip), %rcx
	leaq	.LC69(%rip), %rax
	cmovne	%rax, %rcx
	movq	%rsi, %rdx
	call	fputs
	jmp	.L99
.L107:
	movl	$0, %edx
	movq	%rsi, %rcx
	call	indention_tac
	movq	%rsi, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC74(%rip), %rcx
	call	fwrite
	jmp	.L99
.L106:
	movl	$0, %edx
	movq	%rsi, %rcx
	call	indention_tac
	movq	(%rbx), %rax
	movq	8(%rax), %rcx
	movq	%rsi, %rdx
	call	fputs
	jmp	.L99
.L105:
	movl	$0, %edx
	movq	%rsi, %rcx
	call	indention_tac
	movq	(%rbx), %rax
	movq	8(%rax), %rcx
	movq	%rsi, %rdx
	call	fputs
	jmp	.L99
.L103:
	movl	$0, %edx
	movq	%rsi, %rcx
	call	indention_tac
	movq	%rsi, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC75(%rip), %rcx
	call	fwrite
	jmp	.L99
.L102:
	movl	$0, %edx
	movq	%rsi, %rcx
	call	indention_tac
	movl	16(%rbx), %r8d
	leaq	.LC76(%rip), %rdx
	movq	%rsi, %rcx
	call	fprintf
	jmp	.L99
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
	.globl	output_code
	.def	output_code;	.scl	2;	.type	32;	.endef
output_code:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$72, %rsp
	movq	%rdx, %r15
	movq	%r8, 160(%rsp)
	movq	%r9, %r14
	movq	(%rcx), %rcx
	call	list_copy
	movq	%rax, 56(%rsp)
	jmp	.L118
.L119:
	movq	%r14, %r9
	movl	$0, %r8d
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC23(%rip), %rcx
	call	fwrite
	movq	160(%rsp), %rax
	leaq	2(%rax), %rsi
	movq	%rsi, 32(%rsp)
	movq	(%rbx), %rbx
	movq	%r14, %r9
	movl	$0, %r8d
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC18(%rip), %rcx
	call	fwrite
	movq	160(%rsp), %rax
	leaq	3(%rax), %rdi
	movq	(%rbx), %rcx
	movq	%r14, %r9
	movq	%rdi, %r8
	movq	%r15, %rdx
	call	output_name
	movq	%r14, %r9
	movl	$0, %r8d
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rcx
	call	fwrite
	movq	8(%rbx), %rcx
	movq	%r14, %r9
	movq	%rdi, %r8
	movq	%r15, %rdx
	call	output_name
	movq	%r14, %r9
	movl	$0, %r8d
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC80(%rip), %rcx
	call	fwrite
	movq	16(%rbx), %rcx
	call	list_copy
	movq	%rax, %r12
	movq	24(%rbx), %rcx
	call	list_copy
	movq	%rax, %rbp
	movl	$-1, %esi
	movq	160(%rsp), %rax
	leaq	4(%rax), %r13
.L124:
	movq	%r12, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L141
	movq	%r14, %r9
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%r15, %rcx
	call	indention
	addl	$1, %esi
	movl	%esi, %r8d
	leaq	.LC81(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
	movq	%r14, %r9
	movq	%r13, %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	output_variable
	jmp	.L124
.L141:
	movq	%r14, %r9
	movl	$1, %r8d
	movq	32(%rsp), %rdx
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC48(%rip), %rcx
	call	fwrite
.L126:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L118
	movq	%r14, %r9
	movq	%rdi, %r8
	movq	%r15, %rdx
	call	output_statement
	jmp	.L126
.L120:
	movq	%r14, %r9
	movl	$0, %r8d
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC82(%rip), %rcx
	call	fwrite
	movq	160(%rsp), %rax
	leaq	2(%rax), %rsi
	movq	(%rbx), %rbx
	movq	%r14, %r9
	movl	$0, %r8d
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC18(%rip), %rcx
	call	fwrite
	movq	160(%rsp), %rax
	addq	$3, %rax
	movq	%rax, 40(%rsp)
	movq	(%rbx), %rcx
	movq	%r14, %r9
	movq	%rax, %r8
	movq	%r15, %rdx
	call	output_name
	movq	%r14, %r9
	movl	$1, %r8d
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC83(%rip), %rcx
	call	fwrite
	movq	8(%rbx), %rcx
	call	list_copy
	movq	%rax, 32(%rsp)
	jmp	.L128
.L129:
	movq	%r14, %r9
	movl	$0, %r8d
	movq	40(%rsp), %rdx
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC84(%rip), %rcx
	call	fwrite
	movq	160(%rsp), %rax
	leaq	4(%rax), %rsi
	movq	%rsi, 48(%rsp)
	movq	(%rbx), %rbx
	movq	%r14, %r9
	movl	$0, %r8d
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC18(%rip), %rcx
	call	fwrite
	movq	160(%rsp), %rax
	leaq	5(%rax), %rdi
	movq	(%rbx), %rcx
	movq	%r14, %r9
	movq	%rdi, %r8
	movq	%r15, %rdx
	call	output_name
	movq	%r14, %r9
	movl	$0, %r8d
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rcx
	call	fwrite
	movq	8(%rbx), %rcx
	movq	%r14, %r9
	movq	%rdi, %r8
	movq	%r15, %rdx
	call	output_name
	movq	%r14, %r9
	movl	$0, %r8d
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC80(%rip), %rcx
	call	fwrite
	movq	16(%rbx), %rcx
	call	list_copy
	movq	%rax, %r12
	movq	24(%rbx), %rcx
	call	list_copy
	movq	%rax, %rbp
	movl	$-1, %esi
	movq	160(%rsp), %rax
	leaq	6(%rax), %r13
	jmp	.L132
.L133:
	movq	%r14, %r9
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%r15, %rcx
	call	indention
	addl	$1, %esi
	movl	%esi, %r8d
	leaq	.LC81(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
	movq	%r14, %r9
	movq	%r13, %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	output_variable
.L132:
	movq	%r12, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L133
	movq	%r14, %r9
	movl	$1, %r8d
	movq	48(%rsp), %rdx
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC48(%rip), %rcx
	call	fwrite
	jmp	.L134
.L135:
	movq	%r14, %r9
	movq	%rdi, %r8
	movq	%r15, %rdx
	call	output_statement
.L134:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L135
.L128:
	movq	32(%rsp), %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L118
	movl	8(%rbx), %eax
	testl	%eax, %eax
	je	.L129
	cmpl	$1, %eax
	je	.L130
	movq	%r14, %r9
	movl	$0, %r8d
	movq	40(%rsp), %rdx
	movq	%r15, %rcx
	call	indention
	movl	8(%rbx), %r8d
	leaq	.LC86(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
	jmp	.L128
.L130:
	movq	%r14, %r9
	movl	$0, %r8d
	movq	40(%rsp), %rdx
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC85(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rcx
	movq	%r14, %r9
	movq	160(%rsp), %rax
	leaq	4(%rax), %r8
	movq	%r15, %rdx
	call	output_variable
	jmp	.L128
.L121:
	movq	%r14, %r9
	movl	$0, %r8d
	movq	%r15, %rcx
	call	indention
	movl	8(%rbx), %r8d
	leaq	.LC87(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
.L118:
	movq	56(%rsp), %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L142
	movq	160(%rsp), %rax
	leaq	1(%rax), %rdx
	movl	8(%rbx), %eax
	cmpl	$1, %eax
	je	.L119
	cmpl	$2, %eax
	je	.L120
	testl	%eax, %eax
	jne	.L121
	movq	%r14, %r9
	movl	$0, %r8d
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC78(%rip), %rcx
	call	fwrite
	movq	160(%rsp), %rax
	leaq	2(%rax), %rsi
	movq	(%rbx), %rbx
	movq	%r14, %r9
	movl	$0, %r8d
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC18(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rcx
	movq	%r14, %r9
	movq	160(%rsp), %rax
	leaq	3(%rax), %r8
	movq	%r15, %rdx
	call	output_name
	movq	%r14, %r9
	movl	$1, %r8d
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	indention
	movq	8(%rbx), %rax
	testq	%rax, %rax
	leaq	.LC77(%rip), %r8
	cmovne	%rax, %r8
	leaq	.LC79(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
	jmp	.L118
.L142:
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
	.globl	output_TAC
	.def	output_TAC;	.scl	2;	.type	32;	.endef
output_TAC:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$72, %rsp
	movq	%rcx, 144(%rsp)
	movq	%rdx, %r15
	movq	%r8, %r14
	testq	%rcx, %rcx
	je	.L226
	movq	%r8, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC89(%rip), %rcx
	call	fwrite
	movq	144(%rsp), %rax
	movq	(%rax), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L146
	leaq	1(%r14), %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC90(%rip), %rcx
	call	fwrite
.L147:
	movq	144(%rsp), %rax
	cmpq	$0, 8(%rax)
	je	.L227
	leaq	1(%r14), %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	144(%rsp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %r8
	leaq	.LC103(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
.L161:
	movq	144(%rsp), %rax
	movq	16(%rax), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L162
	leaq	1(%r14), %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC104(%rip), %rcx
	call	fwrite
.L163:
	movq	144(%rsp), %rax
	movq	24(%rax), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L166
	leaq	1(%r14), %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC106(%rip), %rcx
	call	fwrite
	jmp	.L167
.L226:
	movq	%r8, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC88(%rip), %rcx
	call	fwrite
	jmp	.L143
.L146:
	leaq	1(%r14), %rbx
	movq	%rbx, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC91(%rip), %rcx
	call	fwrite
	leaq	.LC93(%rip), %rdi
	leaq	.LC98(%rip), %rbp
	jmp	.L148
.L232:
	movq	%r13, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC92(%rip), %rcx
	call	fwrite
	jmp	.L150
.L151:
	movl	$0, %edx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC96(%rip), %rcx
	call	fwrite
	jmp	.L153
.L229:
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC97(%rip), %rcx
	call	fwrite
	jmp	.L155
.L230:
	movl	$0, %edx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC92(%rip), %rcx
	call	fwrite
.L157:
	movl	$0, %edx
	movq	%r15, %rcx
	call	indention_tac
	movq	16(%rsi), %r8
	leaq	.LC99(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
.L153:
	movq	(%r12), %rcx
	call	list_pop
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L228
	leaq	3(%r14), %rdx
	cmpq	$0, 8(%rsi)
	je	.L229
	movq	%r15, %rcx
	call	indention_tac
	movq	8(%rsi), %rax
	movq	8(%rax), %r8
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	fprintf
.L155:
	cmpq	$0, (%rsi)
	je	.L230
	movl	$0, %edx
	movq	%r15, %rcx
	call	indention_tac
	movq	(%rsi), %rax
	movq	8(%rax), %r8
	movq	%rdi, %rdx
	movq	%r15, %rcx
	call	fprintf
	jmp	.L157
.L228:
	movq	%r13, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC100(%rip), %rcx
	call	fwrite
.L148:
	movq	144(%rsp), %rax
	movq	(%rax), %rcx
	call	list_pop
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L231
	leaq	2(%r14), %r13
	cmpq	$0, 8(%r12)
	je	.L232
	movq	%r13, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	8(%r12), %rax
	movq	8(%rax), %r8
	movq	%rdi, %rdx
	movq	%r15, %rcx
	call	fprintf
.L150:
	movl	$0, %edx
	movq	%r15, %rcx
	call	indention_tac
	movq	16(%r12), %r8
	leaq	.LC94(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
	movq	(%r12), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L151
	movl	$0, %edx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$3, %r8d
	movl	$1, %edx
	leaq	.LC95(%rip), %rcx
	call	fwrite
	jmp	.L148
.L231:
	movq	%rbx, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC101(%rip), %rcx
	call	fwrite
	jmp	.L147
.L227:
	leaq	1(%r14), %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$20, %r8d
	movl	$1, %edx
	leaq	.LC102(%rip), %rcx
	call	fwrite
	jmp	.L161
.L162:
	leaq	1(%r14), %rsi
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC105(%rip), %rcx
	call	fwrite
	leaq	2(%r14), %rbx
	movq	144(%rsp), %rdi
.L164:
	movq	16(%rdi), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L233
	movq	%rbx, %r8
	movq	%r15, %rdx
	call	output_var
	jmp	.L164
.L233:
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC101(%rip), %rcx
	call	fwrite
	jmp	.L163
.L166:
	leaq	1(%r14), %rbp
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC107(%rip), %rcx
	call	fwrite
	leaq	.L191(%rip), %r13
	movq	%rbp, 56(%rsp)
	jmp	.L168
.L240:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC108(%rip), %rcx
	call	fwrite
	jmp	.L170
.L241:
	leaq	3(%r14), %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$20, %r8d
	movl	$1, %edx
	leaq	.LC110(%rip), %rcx
	call	fwrite
	jmp	.L172
.L173:
	leaq	3(%r14), %rsi
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC113(%rip), %rcx
	call	fwrite
	leaq	4(%r14), %rbx
.L175:
	movq	16(%rdi), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L234
	movq	%rbx, %r8
	movq	%r15, %rdx
	call	output_var
	jmp	.L175
.L234:
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC101(%rip), %rcx
	call	fwrite
	jmp	.L174
.L177:
	leaq	3(%r14), %rsi
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC115(%rip), %rcx
	call	fwrite
	leaq	4(%r14), %rbx
.L179:
	movq	24(%rdi), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L235
	movq	%rbx, %r8
	movq	%r15, %rdx
	call	output_var
	jmp	.L179
.L235:
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC101(%rip), %rcx
	call	fwrite
	jmp	.L178
.L181:
	leaq	3(%r14), %rbx
	movq	%rbx, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC117(%rip), %rcx
	call	fwrite
	movq	%rbp, 40(%rsp)
	movq	%rbx, 48(%rsp)
	jmp	.L183
.L238:
	movq	%rax, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC92(%rip), %rcx
	call	fwrite
	jmp	.L185
.L186:
	movl	$0, %edx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC96(%rip), %rcx
	call	fwrite
	leaq	5(%r14), %rbp
	movl	$1, %r12d
	jmp	.L188
.L216:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC118(%rip), %rcx
	call	fwrite
.L217:
	movq	(%rbx), %rcx
	movq	%r15, %rdx
	call	output_arg
	movl	24(%rbx), %ecx
	cmpl	$24, %ecx
	ja	.L188
	movq	%r12, %rax
	salq	%cl, %rax
	testl	$4825087, %eax
	jne	.L219
	testl	$25583616, %eax
	jne	.L220
	testl	$3145728, %eax
	jne	.L221
	jmp	.L188
.L215:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC119(%rip), %rcx
	call	fwrite
	jmp	.L217
.L214:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC120(%rip), %rcx
	call	fwrite
	jmp	.L217
.L213:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC121(%rip), %rcx
	call	fwrite
	jmp	.L217
.L212:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC122(%rip), %rcx
	call	fwrite
	jmp	.L217
.L211:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC123(%rip), %rcx
	call	fwrite
	jmp	.L217
.L210:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC124(%rip), %rcx
	call	fwrite
	jmp	.L217
.L209:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC125(%rip), %rcx
	call	fwrite
	jmp	.L217
.L208:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC126(%rip), %rcx
	call	fwrite
	jmp	.L217
.L207:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC127(%rip), %rcx
	call	fwrite
	jmp	.L217
.L206:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC128(%rip), %rcx
	call	fwrite
	jmp	.L217
.L205:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC129(%rip), %rcx
	call	fwrite
	jmp	.L217
.L204:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC130(%rip), %rcx
	call	fwrite
	jmp	.L217
.L203:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC131(%rip), %rcx
	call	fwrite
	jmp	.L217
.L202:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC132(%rip), %rcx
	call	fwrite
	jmp	.L217
.L201:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC133(%rip), %rcx
	call	fwrite
	jmp	.L217
.L200:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC134(%rip), %rcx
	call	fwrite
	jmp	.L217
.L199:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC135(%rip), %rcx
	call	fwrite
	jmp	.L217
.L198:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC136(%rip), %rcx
	call	fwrite
	jmp	.L217
.L197:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC137(%rip), %rcx
	call	fwrite
	jmp	.L217
.L196:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC138(%rip), %rcx
	call	fwrite
	jmp	.L217
.L195:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC139(%rip), %rcx
	call	fwrite
	jmp	.L217
.L194:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC140(%rip), %rcx
	call	fwrite
	jmp	.L217
.L193:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC141(%rip), %rcx
	call	fwrite
	jmp	.L217
.L192:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC142(%rip), %rcx
	call	fwrite
	jmp	.L217
.L190:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC143(%rip), %rcx
	call	fwrite
	jmp	.L188
.L189:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movl	24(%rbx), %r8d
	leaq	.LC144(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
	jmp	.L188
.L219:
	movl	$0, %edx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %rdx
	movl	$32, %ecx
	call	fputc
	movq	8(%rbx), %rcx
	movq	%r15, %rdx
	call	output_arg
	movl	$0, %edx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %rdx
	movl	$32, %ecx
	call	fputc
	movq	16(%rbx), %rcx
	movq	%r15, %rdx
	call	output_arg
.L221:
	movl	$0, %edx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %rdx
	movl	$10, %ecx
	call	fputc
.L188:
	movq	8(%rsi), %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L236
	cmpl	$25, 24(%rbx)
	ja	.L189
	movl	24(%rbx), %eax
	movslq	0(%r13,%rax,4), %rax
	addq	%r13, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L191:
	.long	.L216-.L191
	.long	.L215-.L191
	.long	.L214-.L191
	.long	.L213-.L191
	.long	.L212-.L191
	.long	.L211-.L191
	.long	.L210-.L191
	.long	.L209-.L191
	.long	.L208-.L191
	.long	.L207-.L191
	.long	.L206-.L191
	.long	.L205-.L191
	.long	.L204-.L191
	.long	.L203-.L191
	.long	.L202-.L191
	.long	.L201-.L191
	.long	.L200-.L191
	.long	.L199-.L191
	.long	.L198-.L191
	.long	.L197-.L191
	.long	.L196-.L191
	.long	.L195-.L191
	.long	.L194-.L191
	.long	.L193-.L191
	.long	.L192-.L191
	.long	.L190-.L191
	.text
.L220:
	movl	$0, %edx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %rdx
	movl	$32, %ecx
	call	fputc
	movq	8(%rbx), %rcx
	movq	%r15, %rdx
	call	output_arg
	jmp	.L221
.L236:
	movq	32(%rsp), %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC100(%rip), %rcx
	call	fwrite
.L183:
	movq	32(%rdi), %rcx
	call	list_pop
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L237
	leaq	4(%r14), %rax
	movq	%rax, 32(%rsp)
	cmpq	$0, (%rsi)
	je	.L238
	movq	32(%rsp), %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	(%rsi), %rax
	movq	8(%rax), %r8
	leaq	.LC93(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
.L185:
	movq	8(%rsi), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L186
	movl	$0, %edx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$3, %r8d
	movl	$1, %edx
	leaq	.LC95(%rip), %rcx
	call	fwrite
	jmp	.L183
.L237:
	movq	40(%rsp), %rbp
	movq	48(%rsp), %rbx
	movq	%rbx, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC101(%rip), %rcx
	call	fwrite
.L182:
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC100(%rip), %rcx
	call	fwrite
.L168:
	movq	144(%rsp), %rax
	movq	24(%rax), %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L239
	leaq	2(%r14), %rbp
	cmpq	$0, (%rdi)
	je	.L240
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	(%rdi), %rax
	movq	8(%rax), %r8
	leaq	.LC109(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
.L170:
	cmpq	$0, 8(%rdi)
	je	.L241
	leaq	3(%r14), %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	8(%rdi), %rax
	movq	8(%rax), %r8
	leaq	.LC111(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
.L172:
	movq	16(%rdi), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L173
	leaq	3(%r14), %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC112(%rip), %rcx
	call	fwrite
.L174:
	movq	24(%rdi), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L177
	leaq	3(%r14), %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC114(%rip), %rcx
	call	fwrite
.L178:
	movq	32(%rdi), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L181
	leaq	3(%r14), %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC116(%rip), %rcx
	call	fwrite
	jmp	.L182
.L239:
	movq	56(%rsp), %rbp
	movq	%rbp, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC101(%rip), %rcx
	call	fwrite
.L167:
	movq	%r14, %rdx
	movq	%r15, %rcx
	call	indention_tac
	movq	%r15, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC100(%rip), %rcx
	call	fwrite
.L143:
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
