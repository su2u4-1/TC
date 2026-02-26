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
	.seh_proc	output_name
output_name:
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
	movq	%rcx, %rsi
	movq	%rdx, %rbx
	movq	%r8, %r12
	movq	%r9, %rdi
	testq	%rcx, %rcx
	je	.L2
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
.L21:
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
.L19:
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
	jmp	.L19
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
.L20:
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
	jmp	.L21
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
	jmp	.L20
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
	jmp	.L21
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
	jmp	.L21
	.seh_endproc
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
	.ascii "unknown_PrimaryType: %d\12\0"
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
	.seh_proc	output_expression
output_expression:
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
	leaq	.L28(%rip), %r15
	movq	%rcx, %rbp
	movq	%rdx, %rbx
	movq	%r8, %rsi
	movq	%r9, %rdi
.L37:
	movl	24(%rbp), %ecx
	leaq	.LC28(%rip), %r13
	leaq	.LC29(%rip), %r12
	cmpl	$19, %ecx
	je	.L56
.L24:
	call	operator_to_string
	xorl	%r8d, %r8d
	movq	%rdi, %r9
	movq	%rsi, %rdx
	movq	%rax, %r14
	movq	%rbx, %rcx
	call	indention
	movq	%r14, %r8
	testq	%r14, %r14
	je	.L57
.L51:
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
	je	.L40
	movq	%r14, %rsi
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L57:
	leaq	.LC30(%rip), %r8
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L56:
	movq	%rsi, %r14
.L40:
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
.L25:
	cmpl	$8, 8(%rbp)
	leaq	-1(%rsi), %r12
	ja	.L26
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
.L28:
	.long	.L36-.L28
	.long	.L35-.L28
	.long	.L34-.L28
	.long	.L33-.L28
	.long	.L32-.L28
	.long	.L31-.L28
	.long	.L30-.L28
	.long	.L29-.L28
	.long	.L27-.L28
	.text
	.p2align 4,,10
	.p2align 3
.L29:
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC24(%rip), %rcx
.L52:
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
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L27:
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
	movq	%rdi, %r9
	movq	%rsi, %r8
	movq	%rbx, %rdx
	addq	$40, %rsp
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
.L36:
	call	indention
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC13(%rip), %rcx
.L53:
	call	fwrite
	movq	%r12, %rdx
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	0(%rbp), %r8
	leaq	.LC14(%rip), %rdx
.L54:
	movq	%rbx, %rcx
	addq	$40, %rsp
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
.L35:
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC15(%rip), %rcx
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L34:
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
	jmp	.L54
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
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC19(%rip), %rcx
.L55:
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
.L32:
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
	jmp	.L55
	.p2align 4,,10
	.p2align 3
.L31:
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
	jmp	.L37
	.p2align 4,,10
	.p2align 3
.L30:
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC23(%rip), %rcx
	jmp	.L52
.L26:
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movq	%rdi, %r9
	movl	$1, %r8d
	call	indention
	movl	8(%rbp), %r8d
	leaq	.LC26(%rip), %rdx
	movq	%rbx, %rcx
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fprintf
	.seh_endproc
	.section .rdata,"dr"
.LC31:
	.ascii "name\12\0"
.LC32:
	.ascii "value: \"NULL\"\12\0"
	.text
	.p2align 4
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
	movq	%rdx, %rbx
	movq	%r8, %rdi
	movq	%rcx, %rbp
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	leaq	1(%rdi), %r12
	movq	%r9, %rsi
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
	je	.L59
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC22(%rip), %rcx
	call	fwrite
	movq	16(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	output_expression
	.p2align 4,,10
	.p2align 3
.L59:
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC32(%rip), %rcx
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	fwrite
	.seh_endproc
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
	.ascii "unknown_VariableAccessType: %d\12\0"
	.text
	.p2align 4
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
	movl	16(%rcx), %eax
	movq	%rcx, %rdi
	movq	%rdx, %rbx
	movq	%r8, %rbp
	movq	%r9, %rsi
	cmpl	$2, %eax
	je	.L61
	ja	.L62
	testl	%eax, %eax
	je	.L74
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
	jmp	.L67
	.p2align 4,,10
	.p2align 3
.L68:
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
.L67:
	movq	%r13, %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L68
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
.L62:
	cmpl	$3, %eax
	jne	.L75
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	leaq	1(%rbp), %r12
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$29, %r8d
	movl	$1, %edx
	leaq	.LC38(%rip), %rcx
	call	fwrite
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
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
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	addq	$40, %rsp
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
.L61:
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
.L73:
	movq	%rbx, %rdx
	addq	$40, %rsp
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
.L74:
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
	jmp	.L73
	.p2align 4,,10
	.p2align 3
.L75:
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movl	16(%rdi), %r8d
	leaq	.LC44(%rip), %rdx
	movq	%rbx, %rcx
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fprintf
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
	.ascii "unknown_StatementType: %d\12\0"
	.text
	.p2align 4
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
	subq	$72, %rsp
	.seh_stackalloc	72
	.seh_endprologue
	cmpl	$7, 8(%rcx)
	movq	%rcx, %rbp
	movq	%rdx, %rbx
	movq	%r8, %rdi
	movq	%r9, %rsi
	ja	.L77
	movl	8(%rcx), %eax
	leaq	.L79(%rip), %rdx
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	movq	%rdi, %rdx
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L79:
	.long	.L86-.L79
	.long	.L85-.L79
	.long	.L84-.L79
	.long	.L83-.L79
	.long	.L82-.L79
	.long	.L81-.L79
	.long	.L80-.L79
	.long	.L78-.L79
	.text
	.p2align 4,,10
	.p2align 3
.L80:
	call	indention
	movq	%rbx, %r9
	movl	$24, %r8d
	movl	$1, %edx
	leaq	.LC60(%rip), %rcx
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
.L78:
	call	indention
	movq	%rbx, %r9
	movl	$27, %r8d
	movl	$1, %edx
	leaq	.LC61(%rip), %rcx
	jmp	.L109
	.p2align 4,,10
	.p2align 3
.L86:
	cmpq	$0, 0(%rbp)
	je	.L111
	call	indention
	movq	%rbx, %r9
	movl	$21, %r8d
	movl	$1, %edx
	leaq	.LC63(%rip), %rcx
.L110:
	call	fwrite
	movq	0(%rbp), %rcx
	movq	%rsi, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	addq	$72, %rsp
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
.L85:
	call	indention
	movq	%rbx, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC57(%rip), %rcx
	call	fwrite
	movq	0(%rbp), %rcx
	movq	%rsi, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	addq	$72, %rsp
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
.L84:
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
	jmp	.L87
	.p2align 4,,10
	.p2align 3
.L88:
	movq	%rbp, %r8
	movq	%rbx, %rdx
	call	output_statement
.L87:
	movq	%r15, %rcx
	call	list_pop
	movq	%rsi, %r9
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L88
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
.L89:
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
	je	.L89
.L91:
	movq	%rax, %rcx
	movq	%rsi, %r9
	movq	%r15, %r8
	movq	%rbx, %rdx
	call	output_statement
	movq	%rdi, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L91
	jmp	.L89
	.p2align 4,,10
	.p2align 3
.L83:
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
	jmp	.L105
	.p2align 4,,10
	.p2align 3
.L106:
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	output_statement
.L105:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L106
.L76:
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
.L82:
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
	je	.L96
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
.L97:
	xorl	%r8d, %r8d
	cmpq	$0, 8(%r12)
	movq	%rsi, %r9
	movq	%r13, %rdx
	movq	%rbx, %rcx
	je	.L98
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
.L99:
	xorl	%r8d, %r8d
	cmpq	$0, 16(%r12)
	movq	%rsi, %r9
	movq	%r13, %rdx
	movq	%rbx, %rcx
	je	.L100
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
.L101:
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
	jmp	.L102
	.p2align 4,,10
	.p2align 3
.L103:
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	output_statement
.L102:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L103
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L81:
	cmpq	$0, 0(%rbp)
	je	.L113
	call	indention
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC59(%rip), %rcx
	jmp	.L110
.L77:
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movl	8(%rbp), %r8d
	leaq	.LC64(%rip), %rdx
	movq	%rbx, %rcx
	addq	$72, %rsp
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
	leaq	.LC49(%rip), %rcx
	call	fwrite
	jmp	.L93
	.p2align 4,,10
	.p2align 3
.L94:
	movq	%rsi, %r9
	movq	%rbp, %r8
	movq	%rbx, %rdx
	call	output_statement
.L93:
	movq	48(%rsp), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L94
	jmp	.L76
.L96:
	call	indention
	movq	%rbx, %r9
	movl	$20, %r8d
	movl	$1, %edx
	leaq	.LC52(%rip), %rcx
	call	fwrite
	jmp	.L97
.L100:
	call	indention
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC55(%rip), %rcx
	call	fwrite
	jmp	.L101
.L98:
	call	indention
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC53(%rip), %rcx
	call	fwrite
	jmp	.L99
.L111:
	call	indention
	movq	%rbx, %r9
	movl	$29, %r8d
	movl	$1, %edx
	leaq	.LC62(%rip), %rcx
	jmp	.L109
.L113:
	call	indention
	movq	%rbx, %r9
	movl	$25, %r8d
	movl	$1, %edx
	leaq	.LC58(%rip), %rcx
	jmp	.L109
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
	.ascii "unknown_ClassMemberType: %d\12\0"
.LC75:
	.ascii "unknown_CodeMemberType: %d\12\0"
	.text
	.p2align 4
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
	subq	$88, %rsp
	.seh_stackalloc	88
	.seh_endprologue
	movq	(%rcx), %rcx
	movq	%rdx, %r15
	movq	%r8, %r14
	movq	%r9, %r13
	call	list_copy
	movq	%rax, 72(%rsp)
	.p2align 4,,10
	.p2align 3
.L115:
	movq	72(%rsp), %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L138
	movl	8(%rbx), %eax
	leaq	1(%r14), %rdx
	movq	%r13, %r9
	xorl	%r8d, %r8d
	movq	%r15, %rcx
	cmpl	$1, %eax
	je	.L116
	cmpl	$2, %eax
	je	.L117
	testl	%eax, %eax
	jne	.L118
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
	jmp	.L115
	.p2align 4,,10
	.p2align 3
.L116:
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
	jmp	.L121
	.p2align 4,,10
	.p2align 3
.L122:
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
.L121:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L122
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
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L124:
	movq	%r13, %r9
	movq	%rsi, %r8
	movq	%r15, %rdx
	call	output_statement
.L123:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L124
	jmp	.L115
	.p2align 4,,10
	.p2align 3
.L118:
	call	indention
	movl	8(%rbx), %r8d
	leaq	.LC75(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
	jmp	.L115
	.p2align 4,,10
	.p2align 3
.L117:
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
.L125:
	movq	40(%rsp), %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L115
	movl	8(%rbx), %eax
	testl	%eax, %eax
	je	.L126
	cmpl	$1, %eax
	je	.L127
	movq	48(%rsp), %rdx
	xorl	%r8d, %r8d
	movq	%r15, %rcx
	movq	%r13, %r9
	call	indention
	movl	8(%rbx), %r8d
	leaq	.LC74(%rip), %rdx
	movq	%r15, %rcx
	call	fprintf
	jmp	.L125
	.p2align 4,,10
	.p2align 3
.L126:
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
	jmp	.L129
	.p2align 4,,10
	.p2align 3
.L130:
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
.L129:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L130
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
	jmp	.L131
	.p2align 4,,10
	.p2align 3
.L132:
	movq	%r13, %r9
	movq	%rsi, %r8
	movq	%r15, %rdx
	call	output_statement
.L131:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L132
	jmp	.L125
	.p2align 4,,10
	.p2align 3
.L127:
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
	jmp	.L125
	.p2align 4,,10
	.p2align 3
.L138:
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
	.seh_endproc
	.ident	"GCC: (GNU) 13.2.0"
	.def	indention;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
