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
	movl	$21, %r8d
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
	.ascii "NULL\0"
.LC67:
	.ascii "import\12\0"
.LC68:
	.ascii "source: \"%s\"\12\0"
.LC69:
	.ascii "parameters\12\0"
.LC70:
	.ascii "parameters[%d]\12\0"
.LC71:
	.ascii "class\12\0"
.LC72:
	.ascii "members\12\0"
.LC73:
	.ascii "method\12\0"
.LC74:
	.ascii "variable\12\0"
.LC75:
	.ascii "unknown_ClassMemberType: %u\12\0"
.LC76:
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
	jmp	.L93
.L94:
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
	leaq	.LC69(%rip), %rcx
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
.L99:
	movq	%r12, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L116
	movq	%r14, %r9
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%r15, %rcx
	call	indention
	addl	$1, %esi
	movl	%esi, %r8d
	leaq	.LC70(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
	movq	%r14, %r9
	movq	%r13, %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	output_variable
	jmp	.L99
.L116:
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
.L101:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L93
	movq	%r14, %r9
	movq	%rdi, %r8
	movq	%r15, %rdx
	call	output_statement
	jmp	.L101
.L95:
	movq	%r14, %r9
	movl	$0, %r8d
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC71(%rip), %rcx
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
	leaq	.LC72(%rip), %rcx
	call	fwrite
	movq	8(%rbx), %rcx
	call	list_copy
	movq	%rax, 32(%rsp)
	jmp	.L103
.L104:
	movq	%r14, %r9
	movl	$0, %r8d
	movq	40(%rsp), %rdx
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC73(%rip), %rcx
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
	leaq	.LC69(%rip), %rcx
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
	jmp	.L107
.L108:
	movq	%r14, %r9
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%r15, %rcx
	call	indention
	addl	$1, %esi
	movl	%esi, %r8d
	leaq	.LC70(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
	movq	%r14, %r9
	movq	%r13, %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	output_variable
.L107:
	movq	%r12, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L108
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
	jmp	.L109
.L110:
	movq	%r14, %r9
	movq	%rdi, %r8
	movq	%r15, %rdx
	call	output_statement
.L109:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L110
.L103:
	movq	32(%rsp), %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L93
	movl	8(%rbx), %eax
	testl	%eax, %eax
	je	.L104
	cmpl	$1, %eax
	je	.L105
	movq	%r14, %r9
	movl	$0, %r8d
	movq	40(%rsp), %rdx
	movq	%r15, %rcx
	call	indention
	movl	8(%rbx), %r8d
	leaq	.LC75(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
	jmp	.L103
.L105:
	movq	%r14, %r9
	movl	$0, %r8d
	movq	40(%rsp), %rdx
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC74(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rcx
	movq	%r14, %r9
	movq	160(%rsp), %rax
	leaq	4(%rax), %r8
	movq	%r15, %rdx
	call	output_variable
	jmp	.L103
.L96:
	movq	%r14, %r9
	movl	$0, %r8d
	movq	%r15, %rcx
	call	indention
	movl	8(%rbx), %r8d
	leaq	.LC76(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
.L93:
	movq	56(%rsp), %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L117
	movq	160(%rsp), %rax
	leaq	1(%rax), %rdx
	movl	8(%rbx), %eax
	cmpl	$1, %eax
	je	.L94
	cmpl	$2, %eax
	je	.L95
	testl	%eax, %eax
	jne	.L96
	movq	%r14, %r9
	movl	$0, %r8d
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC67(%rip), %rcx
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
	leaq	.LC66(%rip), %r8
	cmovne	%rax, %r8
	leaq	.LC68(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
	jmp	.L93
.L117:
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
