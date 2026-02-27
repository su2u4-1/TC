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
	.def	output_name;	.scl	3;	.type	32;	.endef
	.seh_proc	output_name
output_name:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rsi
	movq	%rdx, %rbx
	movq	%r8, %rdi
	movq	%r9, %rbp
	testq	%rcx, %rcx
	je	.L12
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	(%rsi), %r8
	leaq	.LC1(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	movq	%rbp, %r9
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	8(%rsi), %r8
	leaq	.LC2(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	cmpl	$5, 24(%rsi)
	ja	.L4
	movl	24(%rsi), %eax
	leaq	.L6(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L6:
	.long	.L11-.L6
	.long	.L10-.L6
	.long	.L9-.L6
	.long	.L8-.L6
	.long	.L7-.L6
	.long	.L5-.L6
	.text
.L12:
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$21, %r8d
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	call	fwrite
	nop
.L1:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L11:
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
.L10:
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
	movq	16(%rsi), %rcx
	movq	%rbp, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_name
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
	movq	16(%rsi), %rcx
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
	movq	16(%rsi), %rcx
	movq	%rbp, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_name
	jmp	.L1
.L7:
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
.L5:
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
	movq	16(%rsi), %rcx
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
	leaq	.LC11(%rip), %rcx
	call	fwrite
	jmp	.L1
	.seh_endproc
	.section .rdata,"dr"
.LC12:
	.ascii "UNKNOWN_OPERATOR\0"
.LC13:
	.ascii "primary\12\0"
.LC14:
	.ascii "operator: \"%s\"\12\0"
.LC15:
	.ascii "left\12\0"
.LC16:
	.ascii "right\12\0"
	.text
	.def	output_expression;	.scl	3;	.type	32;	.endef
	.seh_proc	output_expression
output_expression:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %r12
	movq	%rdx, %rbx
	movq	%r8, %rbp
	movq	%r9, %rsi
	movl	24(%rcx), %ecx
	cmpl	$19, %ecx
	je	.L18
	call	operator_to_string
	movq	%rax, %rdi
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	testq	%rdi, %rdi
	leaq	.LC12(%rip), %r8
	cmovne	%rdi, %r8
	leaq	.LC14(%rip), %rdx
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
	leaq	.LC15(%rip), %rcx
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
	leaq	.LC16(%rip), %rcx
	call	fwrite
	movq	16(%r12), %rcx
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	output_expression
	nop
.L13:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L18:
	movl	$1, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC13(%rip), %rcx
	call	fwrite
	movq	8(%r12), %rcx
	movq	%rsi, %r9
	leaq	1(%rbp), %r8
	movq	%rbx, %rdx
	call	output_primary
	jmp	.L13
	.seh_endproc
	.section .rdata,"dr"
.LC17:
	.ascii "name\12\0"
.LC18:
	.ascii "value\12\0"
.LC19:
	.ascii "value: \"NULL\"\12\0"
	.text
	.def	output_variable;	.scl	3;	.type	32;	.endef
	.seh_proc	output_variable
output_variable:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
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
	leaq	.LC17(%rip), %rcx
	call	fwrite
	movq	8(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_name
	cmpq	$0, 16(%rbp)
	je	.L20
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC18(%rip), %rcx
	call	fwrite
	movq	16(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_expression
	nop
.L19:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L20:
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC19(%rip), %rcx
	call	fwrite
	jmp	.L19
	.seh_endproc
	.section .rdata,"dr"
.LC20:
	.ascii "type: \"name\"\12\0"
.LC21:
	.ascii "type: \"function_call\"\12\0"
.LC22:
	.ascii "function\12\0"
.LC23:
	.ascii "arguments\12\0"
.LC24:
	.ascii "arguments[%d]\12\0"
.LC25:
	.ascii "type: \"get sequence_element\"\12\0"
.LC26:
	.ascii "sequence\12\0"
.LC27:
	.ascii "index\12\0"
.LC28:
	.ascii "type: \"get_attribute\"\12\0"
.LC29:
	.ascii "object\12\0"
.LC30:
	.ascii "attribute_name\12\0"
	.align 8
.LC31:
	.ascii "unknown_VariableAccessType: %u\12\0"
	.text
	.def	output_variable_access;	.scl	3;	.type	32;	.endef
	.seh_proc	output_variable_access
output_variable_access:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rdi
	movq	%rdx, %rbx
	movq	%r8, %rbp
	movq	%r9, %rsi
	movl	16(%rcx), %eax
	cmpl	$2, %eax
	je	.L23
	ja	.L24
	testl	%eax, %eax
	je	.L34
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
	leaq	.LC21(%rip), %rcx
	call	fwrite
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC22(%rip), %rcx
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
	leaq	.LC23(%rip), %rcx
	call	fwrite
	movl	$-1, %r12d
	leaq	.LC24(%rip), %r15
	addq	$2, %rbp
	jmp	.L30
.L24:
	cmpl	$3, %eax
	jne	.L35
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$29, %r8d
	movl	$1, %edx
	leaq	.LC25(%rip), %rcx
	call	fwrite
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC26(%rip), %rcx
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
	leaq	.LC27(%rip), %rcx
	call	fwrite
	movq	8(%rdi), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_expression
	jmp	.L22
.L34:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC20(%rip), %rcx
	call	fwrite
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC17(%rip), %rcx
	call	fwrite
	movq	8(%rdi), %rcx
	movq	%rsi, %r9
	leaq	1(%rbp), %r8
	movq	%rbx, %rdx
	call	output_name
	nop
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
	ret
.L31:
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
.L30:
	movq	%r13, %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L31
	jmp	.L22
.L23:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$22, %r8d
	movl	$1, %edx
	leaq	.LC28(%rip), %rcx
	call	fwrite
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC29(%rip), %rcx
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
	leaq	.LC30(%rip), %rcx
	call	fwrite
	movq	8(%rdi), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_name
	jmp	.L22
.L35:
	movl	$1, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movl	16(%rdi), %r8d
	leaq	.LC31(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L22
	.seh_endproc
	.section .rdata,"dr"
.LC32:
	.ascii "type: \"integer\"\12\0"
.LC33:
	.ascii "value: %s\12\0"
.LC34:
	.ascii "type: \"float\"\12\0"
.LC35:
	.ascii "type: \"string\"\12\0"
.LC36:
	.ascii "value: \"%s\"\12\0"
.LC37:
	.ascii "type: \"boolean\"\12\0"
.LC38:
	.ascii "value: \"true\"\12\0"
.LC39:
	.ascii "value: \"false\"\12\0"
.LC40:
	.ascii "type: \"expression\"\12\0"
.LC41:
	.ascii "type: \"!\"\12\0"
.LC42:
	.ascii "type: \"-\"\12\0"
.LC43:
	.ascii "type: \"variable\"\12\0"
.LC44:
	.ascii "unknown_PrimaryType: %u\12\0"
	.text
	.def	output_primary;	.scl	3;	.type	32;	.endef
	.seh_proc	output_primary
output_primary:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rsi
	movq	%rdx, %rbx
	movq	%r8, %rdi
	movq	%r9, %rbp
	cmpl	$8, 8(%rcx)
	ja	.L37
	movl	8(%rcx), %eax
	leaq	.L39(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L39:
	.long	.L47-.L39
	.long	.L46-.L39
	.long	.L45-.L39
	.long	.L44-.L39
	.long	.L43-.L39
	.long	.L42-.L39
	.long	.L41-.L39
	.long	.L40-.L39
	.long	.L38-.L39
	.text
.L47:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC32(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	(%rsi), %r8
	leaq	.LC33(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	nop
.L36:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L46:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC34(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	(%rsi), %r8
	leaq	.LC33(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L36
.L45:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC35(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	(%rsi), %r8
	leaq	.LC36(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L36
.L44:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC37(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC38(%rip), %rcx
	call	fwrite
	jmp	.L36
.L43:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC37(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC39(%rip), %rcx
	call	fwrite
	jmp	.L36
.L42:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$19, %r8d
	movl	$1, %edx
	leaq	.LC40(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC18(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rcx
	movq	%rbp, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_expression
	jmp	.L36
.L41:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
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
	leaq	.LC18(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rcx
	movq	%rbp, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_primary
	jmp	.L36
.L40:
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
	leaq	.LC18(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rcx
	movq	%rbp, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_primary
	jmp	.L36
.L38:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$17, %r8d
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
	leaq	.LC18(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rcx
	movq	%rbp, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_variable_access
	jmp	.L36
.L37:
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movl	8(%rsi), %r8d
	leaq	.LC44(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L36
	.seh_endproc
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
	.def	output_statement;	.scl	3;	.type	32;	.endef
	.seh_proc	output_statement
output_statement:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	%rcx, %rdi
	movq	%rdx, %rbx
	movq	%r8, %rbp
	movq	%r9, %rsi
	cmpl	$7, 8(%rcx)
	ja	.L50
	movl	8(%rcx), %eax
	leaq	.L52(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L52:
	.long	.L59-.L52
	.long	.L58-.L52
	.long	.L57-.L52
	.long	.L56-.L52
	.long	.L55-.L52
	.long	.L54-.L52
	.long	.L53-.L52
	.long	.L51-.L52
	.text
.L57:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC45(%rip), %rcx
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
	leaq	.LC46(%rip), %rcx
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
	leaq	.LC47(%rip), %rcx
	call	fwrite
.L60:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L81
	movq	%rsi, %r9
	movq	%r13, %r8
	movq	%rbx, %rdx
	call	output_statement
	jmp	.L60
.L81:
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	40(%rsp), %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC48(%rip), %rcx
	call	fwrite
	leaq	.LC46(%rip), %r15
	addq	$3, %rbp
.L62:
	movq	%r14, %rcx
	call	list_pop
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L82
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
	leaq	.LC47(%rip), %rcx
	call	fwrite
.L63:
	movq	%rdi, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L62
	movq	%rsi, %r9
	movq	%rbp, %r8
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	output_statement
	jmp	.L63
.L82:
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	40(%rsp), %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC49(%rip), %rcx
	call	fwrite
.L66:
	movq	32(%rsp), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L49
	movq	%rsi, %r9
	movq	%r13, %r8
	movq	%rbx, %rdx
	call	output_statement
	jmp	.L66
.L55:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC50(%rip), %rcx
	call	fwrite
	leaq	1(%rbp), %r13
	movq	(%rdi), %r12
	movq	24(%r12), %rcx
	call	list_copy
	movq	%rax, %rdi
	cmpq	$0, (%r12)
	je	.L69
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC51(%rip), %rcx
	call	fwrite
	movq	(%r12), %rcx
	movq	%rsi, %r9
	leaq	2(%rbp), %r8
	movq	%rbx, %rdx
	call	output_variable
.L70:
	cmpq	$0, 8(%r12)
	je	.L71
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC46(%rip), %rcx
	call	fwrite
	movq	8(%r12), %rcx
	movq	%rsi, %r9
	leaq	2(%rbp), %r8
	movq	%rbx, %rdx
	call	output_expression
.L72:
	cmpq	$0, 16(%r12)
	je	.L73
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC54(%rip), %rcx
	call	fwrite
	movq	16(%r12), %rcx
	movq	%rsi, %r9
	leaq	2(%rbp), %r8
	movq	%rbx, %rdx
	call	output_expression
.L74:
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC47(%rip), %rcx
	call	fwrite
	addq	$2, %rbp
.L75:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L49
	movq	%rsi, %r9
	movq	%rbp, %r8
	movq	%rbx, %rdx
	call	output_statement
	jmp	.L75
.L69:
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$20, %r8d
	movl	$1, %edx
	leaq	.LC52(%rip), %rcx
	call	fwrite
	jmp	.L70
.L71:
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC53(%rip), %rcx
	call	fwrite
	jmp	.L72
.L73:
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC55(%rip), %rcx
	call	fwrite
	jmp	.L74
.L56:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC56(%rip), %rcx
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
	leaq	.LC46(%rip), %rcx
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
	leaq	.LC47(%rip), %rcx
	call	fwrite
.L77:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L49
	movq	%rsi, %r9
	movq	%rbp, %r8
	movq	%rbx, %rdx
	call	output_statement
	jmp	.L77
.L58:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC57(%rip), %rcx
	call	fwrite
	movq	(%rdi), %rcx
	movq	%rsi, %r9
	leaq	1(%rbp), %r8
	movq	%rbx, %rdx
	call	output_variable
	nop
.L49:
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
.L54:
	cmpq	$0, (%rcx)
	je	.L83
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC59(%rip), %rcx
	call	fwrite
	movq	(%rdi), %rcx
	movq	%rsi, %r9
	leaq	1(%rbp), %r8
	movq	%rbx, %rdx
	call	output_expression
	jmp	.L49
.L83:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$25, %r8d
	movl	$1, %edx
	leaq	.LC58(%rip), %rcx
	call	fwrite
	jmp	.L49
.L53:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$24, %r8d
	movl	$1, %edx
	leaq	.LC60(%rip), %rcx
	call	fwrite
	jmp	.L49
.L51:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$27, %r8d
	movl	$1, %edx
	leaq	.LC61(%rip), %rcx
	call	fwrite
	jmp	.L49
.L59:
	cmpq	$0, (%rcx)
	je	.L84
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$21, %r8d
	movl	$1, %edx
	leaq	.LC63(%rip), %rcx
	call	fwrite
	movq	(%rdi), %rcx
	movq	%rsi, %r9
	leaq	1(%rbp), %r8
	movq	%rbx, %rdx
	call	output_expression
	jmp	.L49
.L84:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$29, %r8d
	movl	$1, %edx
	leaq	.LC62(%rip), %rcx
	call	fwrite
	jmp	.L49
.L50:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movl	8(%rdi), %r8d
	leaq	.LC64(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L49
	.seh_endproc
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
	.globl	output_code
	.def	output_code;	.scl	2;	.type	32;	.endef
	.seh_proc	output_code
output_code:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$72, %rsp
	.seh_stackalloc	72
	.seh_endprologue
	movq	%rdx, %r15
	movq	%r8, 160(%rsp)
	movq	%r9, %r14
	movq	(%rcx), %rcx
	call	list_copy
	movq	%rax, 56(%rsp)
	jmp	.L86
.L87:
	movq	%r14, %r9
	movl	$0, %r8d
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC22(%rip), %rcx
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
	leaq	.LC17(%rip), %rcx
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
	leaq	.LC68(%rip), %rcx
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
.L92:
	movq	%r12, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L108
	movq	%r14, %r9
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%r15, %rcx
	call	indention
	addl	$1, %esi
	movl	%esi, %r8d
	leaq	.LC69(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
	movq	%r14, %r9
	movq	%r13, %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	output_variable
	jmp	.L92
.L108:
	movq	%r14, %r9
	movl	$1, %r8d
	movq	32(%rsp), %rdx
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC47(%rip), %rcx
	call	fwrite
.L94:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L86
	movq	%r14, %r9
	movq	%rdi, %r8
	movq	%r15, %rdx
	call	output_statement
	jmp	.L94
.L88:
	movq	%r14, %r9
	movl	$0, %r8d
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC70(%rip), %rcx
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
	leaq	.LC17(%rip), %rcx
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
	leaq	.LC71(%rip), %rcx
	call	fwrite
	movq	8(%rbx), %rcx
	call	list_copy
	movq	%rax, 32(%rsp)
	jmp	.L96
.L97:
	movq	%r14, %r9
	movl	$0, %r8d
	movq	40(%rsp), %rdx
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC72(%rip), %rcx
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
	leaq	.LC17(%rip), %rcx
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
	leaq	.LC68(%rip), %rcx
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
	jmp	.L100
.L101:
	movq	%r14, %r9
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%r15, %rcx
	call	indention
	addl	$1, %esi
	movl	%esi, %r8d
	leaq	.LC69(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
	movq	%r14, %r9
	movq	%r13, %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	output_variable
.L100:
	movq	%r12, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L101
	movq	%r14, %r9
	movl	$1, %r8d
	movq	48(%rsp), %rdx
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC47(%rip), %rcx
	call	fwrite
	jmp	.L102
.L103:
	movq	%r14, %r9
	movq	%rdi, %r8
	movq	%r15, %rdx
	call	output_statement
.L102:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L103
.L96:
	movq	32(%rsp), %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L86
	movl	8(%rbx), %eax
	testl	%eax, %eax
	je	.L97
	cmpl	$1, %eax
	je	.L98
	movq	%r14, %r9
	movl	$0, %r8d
	movq	40(%rsp), %rdx
	movq	%r15, %rcx
	call	indention
	movl	8(%rbx), %r8d
	leaq	.LC74(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
	jmp	.L96
.L98:
	movq	%r14, %r9
	movl	$0, %r8d
	movq	40(%rsp), %rdx
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC73(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rcx
	movq	%r14, %r9
	movq	160(%rsp), %rax
	leaq	4(%rax), %r8
	movq	%r15, %rdx
	call	output_variable
	jmp	.L96
.L89:
	movq	%r14, %r9
	movl	$0, %r8d
	movq	%r15, %rcx
	call	indention
	movl	8(%rbx), %r8d
	leaq	.LC75(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
.L86:
	movq	56(%rsp), %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L109
	movq	160(%rsp), %rax
	leaq	1(%rax), %rdx
	movl	8(%rbx), %eax
	cmpl	$1, %eax
	je	.L87
	cmpl	$2, %eax
	je	.L88
	testl	%eax, %eax
	jne	.L89
	movq	%r14, %r9
	movl	$0, %r8d
	movq	%r15, %rcx
	call	indention
	movq	%r15, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC66(%rip), %rcx
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
	leaq	.LC17(%rip), %rcx
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
	leaq	.LC65(%rip), %r8
	cmovne	%rax, %r8
	leaq	.LC67(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
	jmp	.L86
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
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 13.2.0"
	.def	indention;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
