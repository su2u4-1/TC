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
	pushq	%r15
	leaq	.LC2(%rip), %r15
	pushq	%r14
	leaq	.LC1(%rip), %r14
	pushq	%r13
	leaq	.L6(%rip), %r13
	pushq	%r12
	leaq	1(%r8), %r12
	pushq	%rbp
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	movq	%r9, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$40, %rsp
.L2:
	leaq	-1(%r12), %rbp
	movq	%rsi, %r9
	testq	%rdi, %rdi
	jne	.L3
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC0(%rip), %rcx
	jmp	.L18
.L3:
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	8(%rdi), %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	fprintf
	xorl	%r8d, %r8d
	movq	%rsi, %r9
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	16(%rdi), %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	fprintf
	cmpl	$6, 32(%rdi)
	ja	.L4
	movl	32(%rdi), %eax
	movq	%rsi, %r9
	movslq	0(%r13,%rax,4), %rax
	addq	%r13, %rax
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
.L5:
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC3(%rip), %rcx
	jmp	.L18
.L9:
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC4(%rip), %rcx
	jmp	.L16
.L11:
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC6(%rip), %rcx
	jmp	.L17
.L10:
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC8(%rip), %rcx
.L17:
	call	fputs
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movq	%rsi, %r9
	movl	$1, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC7(%rip), %rcx
	jmp	.L15
.L12:
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC9(%rip), %rcx
	jmp	.L18
.L7:
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC10(%rip), %rcx
.L16:
	call	fputs
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movq	%rsi, %r9
	movl	$1, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC5(%rip), %rcx
.L15:
	call	fputs
	incq	%r12
	movq	(%rdi), %rdi
	jmp	.L2
.L8:
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC11(%rip), %rcx
	jmp	.L16
.L4:
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movq	%rsi, %r9
	movl	$1, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC12(%rip), %rcx
.L18:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fputs
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
	.def	output_expression;	.scl	3;	.type	32;	.endef
output_expression:
	pushq	%r14
	leaq	.LC13(%rip), %r14
	pushq	%r13
	leaq	.L25(%rip), %r13
	pushq	%r12
	pushq	%rbp
	movq	%r8, %rbp
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	movq	%r9, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$32, %rsp
.L37:
	movl	24(%rdi), %ecx
	cmpl	$19, %ecx
	jne	.L21
	movq	%rbp, %rdx
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC14(%rip), %rcx
	addq	$2, %rbp
	call	fputs
	movq	8(%rdi), %r12
.L22:
	cmpl	$8, 8(%r12)
	leaq	-1(%rbp), %rdi
	ja	.L23
	movl	8(%r12), %eax
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movslq	0(%r13,%rax,4), %rax
	addq	%r13, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L25:
	.long	.L33-.L25
	.long	.L32-.L25
	.long	.L31-.L25
	.long	.L30-.L25
	.long	.L29-.L25
	.long	.L28-.L25
	.long	.L27-.L25
	.long	.L26-.L25
	.long	.L24-.L25
	.text
.L33:
	call	indention
	movq	%rbx, %rdx
	leaq	.LC15(%rip), %rcx
	jmp	.L41
.L32:
	call	indention
	movq	%rbx, %rdx
	leaq	.LC17(%rip), %rcx
.L41:
	call	fputs
	movq	%rdi, %rdx
	movq	%rsi, %r9
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	(%r12), %r8
	leaq	.LC16(%rip), %rdx
.L42:
	addq	$32, %rsp
	movq	%rbx, %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	fprintf
.L31:
	call	indention
	movq	%rbx, %rdx
	leaq	.LC18(%rip), %rcx
	call	fputs
	movq	%rdi, %rdx
	movq	%rsi, %r9
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	(%r12), %r8
	leaq	.LC19(%rip), %rdx
	jmp	.L42
.L30:
	call	indention
	movq	%rbx, %rdx
	leaq	.LC20(%rip), %rcx
	call	fputs
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%rsi, %r9
	movl	$1, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC21(%rip), %rcx
	jmp	.L43
.L29:
	call	indention
	movq	%rbx, %rdx
	leaq	.LC20(%rip), %rcx
	call	fputs
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%rsi, %r9
	movl	$1, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC22(%rip), %rcx
.L43:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	fputs
.L28:
	call	indention
	movq	%rbx, %rdx
	leaq	.LC23(%rip), %rcx
	call	fputs
	movq	%rdi, %rdx
	movq	%rsi, %r9
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC24(%rip), %rcx
	call	fputs
	movq	(%r12), %rdi
	jmp	.L37
.L27:
	call	indention
	movq	%rbx, %rdx
	leaq	.LC25(%rip), %rcx
	jmp	.L40
.L26:
	call	indention
	movq	%rbx, %rdx
	leaq	.LC26(%rip), %rcx
.L40:
	call	fputs
	movq	%rsi, %r9
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	incq	%rbp
	call	indention
	movq	%rbx, %rdx
	leaq	.LC24(%rip), %rcx
	call	fputs
	movq	(%r12), %r12
	jmp	.L22
.L24:
	call	indention
	movq	%rbx, %rdx
	leaq	.LC27(%rip), %rcx
	call	fputs
	movq	%rsi, %r9
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC24(%rip), %rcx
	call	fputs
	movq	(%r12), %rcx
	addq	$32, %rsp
	movq	%rsi, %r9
	movq	%rbp, %r8
	movq	%rbx, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	output_variable_access
.L23:
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%rsi, %r9
	movl	$1, %r8d
	call	indention
	movl	8(%r12), %r8d
	addq	$32, %rsp
	movq	%rbx, %rcx
	leaq	.LC28(%rip), %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	fprintf
.L21:
	call	operator_to_string
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movq	%rax, %r12
	movq	%rbx, %rcx
	call	indention
	testq	%r12, %r12
	leaq	.LC29(%rip), %rdx
	movq	%rbx, %rcx
	cmove	%r14, %r12
	movq	%r12, %r8
	leaq	1(%rbp), %r12
	call	fprintf
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC30(%rip), %rcx
	call	fputs
	movq	(%rdi), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_expression
	movq	%rbp, %rdx
	movq	%rsi, %r9
	movq	%rbx, %rcx
	movl	$1, %r8d
	movq	%r12, %rbp
	call	indention
	movq	%rbx, %rdx
	leaq	.LC31(%rip), %rcx
	call	fputs
	movq	16(%rdi), %rdi
	jmp	.L37
	.section .rdata,"dr"
.LC32:
	.ascii "name\12\0"
.LC33:
	.ascii "value: \"NULL\"\12\0"
	.text
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
	movq	%rbx, %rdx
	leaq	.LC5(%rip), %rcx
	call	fputs
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
	movq	%rbx, %rdx
	leaq	.LC32(%rip), %rcx
	call	fputs
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
	je	.L45
	call	indention
	movq	%rbx, %rdx
	leaq	.LC24(%rip), %rcx
	call	fputs
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
.L45:
	call	indention
	addq	$32, %rsp
	movq	%rbx, %rdx
	leaq	.LC33(%rip), %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	fputs
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
.LC45:
	.ascii "unknown_VariableAccessType: %u\12\0"
	.text
	.def	output_variable_access;	.scl	3;	.type	32;	.endef
output_variable_access:
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
	subq	$40, %rsp
	movl	16(%rcx), %eax
	cmpl	$2, %eax
	je	.L48
	ja	.L49
	testl	%eax, %eax
	leaq	1(%r8), %r13
	jne	.L57
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC34(%rip), %rcx
	call	fputs
	movq	%rsi, %r9
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	leaq	.LC32(%rip), %rcx
	movq	%rbx, %rdx
	call	fputs
	movq	8(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r13, %r8
	jmp	.L61
.L49:
	cmpl	$3, %eax
	jne	.L62
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	leaq	1(%rdi), %r12
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC39(%rip), %rcx
	call	fputs
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC40(%rip), %rcx
	call	fputs
	movq	0(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_variable_access
	movq	%rsi, %r9
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC41(%rip), %rcx
	call	fputs
	movq	8(%rbp), %rcx
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
.L57:
	movq	8(%rcx), %rcx
	leaq	.LC38(%rip), %r14
	call	list_copy
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%rax, %r12
	call	indention
	movq	%rbx, %rdx
	leaq	.LC35(%rip), %rcx
	call	fputs
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC36(%rip), %rcx
	call	fputs
	movq	0(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r13, %r8
	movq	%rbx, %rdx
	orl	$-1, %ebp
	call	output_variable_access
	movq	%rdi, %rdx
	movq	%rsi, %r9
	movq	%rbx, %rcx
	movl	$1, %r8d
	addq	$2, %rdi
	call	indention
	movq	%rbx, %rdx
	leaq	.LC37(%rip), %rcx
	call	fputs
.L54:
	movq	%r12, %rcx
	call	list_pop
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L63
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	incl	%ebp
	movq	%r14, %rdx
	movq	%rbx, %rcx
	movl	%ebp, %r8d
	call	fprintf
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	movq	%r15, %rcx
	call	output_expression
	jmp	.L54
.L48:
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	leaq	1(%rdi), %r12
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC42(%rip), %rcx
	call	fputs
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC43(%rip), %rcx
	call	fputs
	movq	0(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_variable_access
	movq	%rsi, %r9
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	leaq	.LC44(%rip), %rcx
	movq	%rbx, %rdx
	call	fputs
	movq	8(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
.L61:
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
.L62:
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movl	16(%rbp), %r8d
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
.L63:
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
	movq	%rcx, %rsi
	pushq	%rbx
	movq	%r8, %rbx
	subq	$72, %rsp
	cmpl	$7, 8(%rcx)
	movq	%rdx, 40(%rsp)
	movq	%r9, 48(%rsp)
	ja	.L65
	movl	8(%rcx), %eax
	leaq	.L67(%rip), %rdx
	movq	48(%rsp), %r9
	xorl	%r8d, %r8d
	movq	40(%rsp), %rcx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	movq	%rbx, %rdx
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L67:
	.long	.L74-.L67
	.long	.L73-.L67
	.long	.L72-.L67
	.long	.L71-.L67
	.long	.L70-.L67
	.long	.L69-.L67
	.long	.L68-.L67
	.long	.L66-.L67
	.text
.L72:
	call	indention
	movq	40(%rsp), %rdx
	leaq	1(%rbx), %rdi
	leaq	.LC46(%rip), %rcx
	leaq	.LC47(%rip), %r14
	call	fputs
	movq	(%rsi), %r15
	leaq	2(%rbx), %rsi
	movq	8(%r15), %rcx
	call	list_copy
	movq	16(%r15), %rcx
	movq	%rax, %r13
	call	list_copy
	movq	24(%r15), %rcx
	movq	%rax, %r12
	call	list_copy
	movq	48(%rsp), %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	40(%rsp), %rcx
	movq	%rax, %rbp
	call	indention
	movq	40(%rsp), %rdx
	movq	%r14, %rcx
	call	fputs
	movq	(%r15), %rcx
	movq	48(%rsp), %r9
	movq	%rsi, %r8
	movq	40(%rsp), %rdx
	leaq	.LC48(%rip), %r15
	call	output_expression
	movq	40(%rsp), %rcx
	movq	%rdi, %rdx
	xorl	%r8d, %r8d
	movq	48(%rsp), %r9
	call	indention
	movq	40(%rsp), %rdx
	movq	%r15, %rcx
	call	fputs
.L75:
	movq	%r13, %rcx
	call	list_pop
	movq	48(%rsp), %r9
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L100
	movq	40(%rsp), %rdx
	movq	%rsi, %r8
	call	output_statement
	jmp	.L75
.L100:
	movq	40(%rsp), %rcx
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC49(%rip), %rcx
	call	fputs
	leaq	3(%rbx), %rax
	movq	%rax, 56(%rsp)
.L77:
	movq	%r12, %rcx
	call	list_pop
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L101
	movq	8(%r13), %rcx
	call	list_copy
	movq	48(%rsp), %r9
	xorl	%r8d, %r8d
	movq	%rsi, %rdx
	movq	40(%rsp), %rcx
	movq	%rax, %rbx
	call	indention
	movq	40(%rsp), %rdx
	movq	%r14, %rcx
	call	fputs
	movq	48(%rsp), %r9
	movq	56(%rsp), %r8
	movq	40(%rsp), %rdx
	movq	0(%r13), %rcx
	call	output_expression
	movq	40(%rsp), %rcx
	movq	48(%rsp), %r9
	movq	%rsi, %rdx
	movl	$1, %r8d
	call	indention
	movq	40(%rsp), %rdx
	movq	%r15, %rcx
	call	fputs
.L78:
	movq	%rbx, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L77
	movq	48(%rsp), %r9
	movq	56(%rsp), %r8
	movq	40(%rsp), %rdx
	call	output_statement
	jmp	.L78
.L101:
	movq	40(%rsp), %rcx
	movq	48(%rsp), %r9
	movq	%rdi, %rdx
	movl	$1, %r8d
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC50(%rip), %rcx
	call	fputs
.L81:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L64
	movq	48(%rsp), %r9
	movq	40(%rsp), %rdx
	movq	%rsi, %r8
	call	output_statement
	jmp	.L81
.L70:
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC51(%rip), %rcx
	leaq	1(%rbx), %rdi
	call	fputs
	movq	(%rsi), %rsi
	movq	24(%rsi), %rcx
	call	list_copy
	xorl	%r8d, %r8d
	cmpq	$0, (%rsi)
	movq	%rdi, %rdx
	movq	48(%rsp), %r9
	movq	40(%rsp), %rcx
	movq	%rax, %rbp
	je	.L84
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC52(%rip), %rcx
	call	fputs
	movq	48(%rsp), %r9
	movq	(%rsi), %rcx
	leaq	2(%rbx), %r8
	movq	40(%rsp), %rdx
	call	output_variable
	jmp	.L85
.L84:
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC53(%rip), %rcx
	call	fputs
.L85:
	xorl	%r8d, %r8d
	cmpq	$0, 8(%rsi)
	movq	48(%rsp), %r9
	movq	%rdi, %rdx
	movq	40(%rsp), %rcx
	je	.L86
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC47(%rip), %rcx
	call	fputs
	movq	8(%rsi), %rcx
	movq	48(%rsp), %r9
	leaq	2(%rbx), %r8
	movq	40(%rsp), %rdx
	call	output_expression
	jmp	.L87
.L86:
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC54(%rip), %rcx
	call	fputs
.L87:
	xorl	%r8d, %r8d
	cmpq	$0, 16(%rsi)
	movq	48(%rsp), %r9
	movq	%rdi, %rdx
	movq	40(%rsp), %rcx
	je	.L88
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC55(%rip), %rcx
	call	fputs
	movq	16(%rsi), %rcx
	movq	48(%rsp), %r9
	leaq	2(%rbx), %r8
	movq	40(%rsp), %rdx
	call	output_expression
	jmp	.L89
.L88:
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC56(%rip), %rcx
	call	fputs
.L89:
	movq	48(%rsp), %r9
	movq	40(%rsp), %rcx
	movq	%rdi, %rdx
	addq	$2, %rbx
	movl	$1, %r8d
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC48(%rip), %rcx
	call	fputs
.L90:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L64
	movq	48(%rsp), %r9
	movq	40(%rsp), %rdx
	movq	%rbx, %r8
	call	output_statement
	jmp	.L90
.L71:
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC57(%rip), %rcx
	leaq	1(%rbx), %rdi
	addq	$2, %rbx
	call	fputs
	movq	(%rsi), %rbp
	movq	8(%rbp), %rcx
	call	list_copy
	movq	48(%rsp), %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	40(%rsp), %rcx
	movq	%rax, %rsi
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC47(%rip), %rcx
	call	fputs
	movq	48(%rsp), %r9
	movq	40(%rsp), %rdx
	movq	%rbx, %r8
	movq	0(%rbp), %rcx
	call	output_expression
	movq	40(%rsp), %rcx
	movq	48(%rsp), %r9
	movq	%rdi, %rdx
	movl	$1, %r8d
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC48(%rip), %rcx
	call	fputs
.L93:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L64
	movq	48(%rsp), %r9
	movq	40(%rsp), %rdx
	movq	%rbx, %r8
	call	output_statement
	jmp	.L93
.L73:
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC58(%rip), %rcx
	call	fputs
	movq	(%rsi), %rcx
	movq	48(%rsp), %r9
	leaq	1(%rbx), %r8
	movq	40(%rsp), %rdx
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
.L69:
	cmpq	$0, (%rsi)
	jne	.L95
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC59(%rip), %rcx
	jmp	.L98
.L95:
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC60(%rip), %rcx
	jmp	.L99
.L68:
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC61(%rip), %rcx
.L98:
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fputs
.L66:
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC62(%rip), %rcx
	jmp	.L98
.L74:
	cmpq	$0, (%rsi)
	jne	.L96
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC63(%rip), %rcx
	jmp	.L98
.L96:
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC64(%rip), %rcx
.L99:
	call	fputs
	movq	(%rsi), %rcx
	movq	48(%rsp), %r9
	leaq	1(%rbx), %r8
	movq	40(%rsp), %rdx
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
.L65:
	movq	40(%rsp), %rcx
	movq	48(%rsp), %r9
	movq	%rbx, %rdx
	xorl	%r8d, %r8d
	call	indention
	movl	8(%rsi), %r8d
	movq	40(%rsp), %rcx
	addq	$72, %rsp
	popq	%rbx
	leaq	.LC65(%rip), %rdx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fprintf
.L64:
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
	movq	%r8, %rbx
	subq	$72, %rsp
	movq	(%rcx), %rcx
	movq	%rdx, 152(%rsp)
	movq	%r9, 168(%rsp)
	call	list_copy
	movq	%rax, 48(%rsp)
.L103:
	movq	48(%rsp), %rcx
	call	list_pop
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L127
	movl	8(%rsi), %eax
	movq	168(%rsp), %r9
	leaq	1(%rbx), %rdx
	xorl	%r8d, %r8d
	movq	152(%rsp), %rcx
	cmpl	$1, %eax
	je	.L104
	cmpl	$2, %eax
	je	.L105
	testl	%eax, %eax
	jne	.L106
	call	indention
	leaq	.LC67(%rip), %rcx
	leaq	2(%rbx), %rdi
	movq	152(%rsp), %rdx
	call	fputs
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	(%rsi), %rsi
	movq	168(%rsp), %r9
	movq	152(%rsp), %rcx
	call	indention
	movq	152(%rsp), %rdx
	leaq	.LC32(%rip), %rcx
	call	fputs
	movq	168(%rsp), %r9
	movq	(%rsi), %rcx
	leaq	3(%rbx), %r8
	movq	152(%rsp), %rdx
	call	output_name
	movq	168(%rsp), %r9
	movq	152(%rsp), %rcx
	movq	%rdi, %rdx
	movl	$1, %r8d
	call	indention
	movq	8(%rsi), %r8
	testq	%r8, %r8
	jne	.L107
	leaq	.LC66(%rip), %r8
.L107:
	movq	152(%rsp), %rcx
	leaq	.LC68(%rip), %rdx
	call	fprintf
	jmp	.L103
.L104:
	call	indention
	leaq	2(%rbx), %rdi
	orl	$-1, %r13d
	leaq	4(%rbx), %r14
	movq	152(%rsp), %rdx
	leaq	.LC36(%rip), %rcx
	call	fputs
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	(%rsi), %rbp
	movq	168(%rsp), %r9
	movq	152(%rsp), %rcx
	leaq	3(%rbx), %rsi
	call	indention
	movq	152(%rsp), %rdx
	leaq	.LC32(%rip), %rcx
	call	fputs
	movq	0(%rbp), %rcx
	movq	168(%rsp), %r9
	movq	%rsi, %r8
	movq	152(%rsp), %rdx
	call	output_name
	movq	168(%rsp), %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	152(%rsp), %rcx
	call	indention
	movq	152(%rsp), %rdx
	leaq	.LC7(%rip), %rcx
	call	fputs
	movq	8(%rbp), %rcx
	movq	168(%rsp), %r9
	movq	%rsi, %r8
	movq	152(%rsp), %rdx
	call	output_name
	movq	168(%rsp), %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	152(%rsp), %rcx
	call	indention
	movq	152(%rsp), %rdx
	leaq	.LC69(%rip), %rcx
	call	fputs
	movq	16(%rbp), %rcx
	call	list_copy
	movq	24(%rbp), %rcx
	movq	%rax, %r12
	call	list_copy
	movq	%rax, %rbp
.L109:
	movq	%r12, %rcx
	call	list_pop
	movq	168(%rsp), %r9
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L128
	movq	152(%rsp), %rcx
	xorl	%r8d, %r8d
	movq	%rsi, %rdx
	incl	%r13d
	call	indention
	movq	152(%rsp), %rcx
	movl	%r13d, %r8d
	leaq	.LC70(%rip), %rdx
	call	fprintf
	movq	168(%rsp), %r9
	movq	%r14, %r8
	movq	%r15, %rcx
	movq	152(%rsp), %rdx
	call	output_variable
	jmp	.L109
.L128:
	movq	152(%rsp), %rcx
	movq	%rdi, %rdx
	movl	$1, %r8d
	call	indention
	movq	152(%rsp), %rdx
	leaq	.LC48(%rip), %rcx
	call	fputs
.L111:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L103
	movq	168(%rsp), %r9
	movq	152(%rsp), %rdx
	movq	%rsi, %r8
	call	output_statement
	jmp	.L111
.L105:
	call	indention
	leaq	.LC71(%rip), %rcx
	leaq	2(%rbx), %rdi
	movq	152(%rsp), %rdx
	leaq	.LC73(%rip), %r14
	call	fputs
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	(%rsi), %rsi
	movq	168(%rsp), %r9
	movq	152(%rsp), %rcx
	call	indention
	movq	152(%rsp), %rdx
	leaq	.LC32(%rip), %rcx
	call	fputs
	leaq	3(%rbx), %rax
	movq	168(%rsp), %r9
	movq	(%rsi), %rcx
	movq	152(%rsp), %rdx
	movq	%rax, %r8
	movq	%rax, 32(%rsp)
	call	output_name
	movq	168(%rsp), %r9
	movq	152(%rsp), %rcx
	movq	%rdi, %rdx
	movl	$1, %r8d
	call	indention
	movq	152(%rsp), %rdx
	leaq	.LC72(%rip), %rcx
	call	fputs
	movq	8(%rsi), %rcx
	call	list_copy
	movq	%rax, 56(%rsp)
.L113:
	movq	56(%rsp), %rcx
	call	list_pop
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L103
	movl	8(%rsi), %eax
	testl	%eax, %eax
	je	.L114
	decl	%eax
	jne	.L129
	movq	168(%rsp), %r9
	movq	32(%rsp), %rdx
	xorl	%r8d, %r8d
	movq	152(%rsp), %rcx
	call	indention
	movq	152(%rsp), %rdx
	leaq	.LC74(%rip), %rcx
	call	fputs
	movq	168(%rsp), %r9
	movq	(%rsi), %rcx
	leaq	4(%rbx), %r8
	movq	152(%rsp), %rdx
	call	output_variable
	jmp	.L113
.L114:
	movq	32(%rsp), %rdx
	xorl	%r8d, %r8d
	leaq	4(%rbx), %rdi
	orl	$-1, %r13d
	movq	168(%rsp), %r9
	movq	152(%rsp), %rcx
	leaq	6(%rbx), %r15
	call	indention
	movq	152(%rsp), %rdx
	movq	%r14, %rcx
	call	fputs
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	(%rsi), %rbp
	movq	168(%rsp), %r9
	movq	152(%rsp), %rcx
	call	indention
	movq	152(%rsp), %rdx
	leaq	.LC32(%rip), %rcx
	call	fputs
	leaq	5(%rbx), %rax
	movq	0(%rbp), %rcx
	movq	168(%rsp), %r9
	movq	152(%rsp), %rdx
	movq	%rax, %r8
	movq	%rax, 40(%rsp)
	call	output_name
	movq	168(%rsp), %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	152(%rsp), %rcx
	call	indention
	movq	152(%rsp), %rdx
	leaq	.LC7(%rip), %rcx
	call	fputs
	movq	8(%rbp), %rcx
	leaq	5(%rbx), %r8
	movq	168(%rsp), %r9
	movq	152(%rsp), %rdx
	call	output_name
	movq	168(%rsp), %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	152(%rsp), %rcx
	call	indention
	movq	152(%rsp), %rdx
	leaq	.LC69(%rip), %rcx
	call	fputs
	movq	16(%rbp), %rcx
	call	list_copy
	movq	24(%rbp), %rcx
	movq	%rax, %r12
	call	list_copy
	movq	%rax, %rbp
.L117:
	movq	%r12, %rcx
	call	list_pop
	movq	168(%rsp), %r9
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L130
	movq	40(%rsp), %rdx
	movq	152(%rsp), %rcx
	xorl	%r8d, %r8d
	incl	%r13d
	call	indention
	movq	152(%rsp), %rcx
	movl	%r13d, %r8d
	leaq	.LC70(%rip), %rdx
	call	fprintf
	movq	168(%rsp), %r9
	movq	%r15, %r8
	movq	%rsi, %rcx
	movq	152(%rsp), %rdx
	call	output_variable
	jmp	.L117
.L130:
	movq	152(%rsp), %rcx
	movq	%rdi, %rdx
	movl	$1, %r8d
	call	indention
	movq	152(%rsp), %rdx
	leaq	.LC48(%rip), %rcx
	call	fputs
.L119:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L113
	movq	168(%rsp), %r9
	movq	40(%rsp), %r8
	movq	152(%rsp), %rdx
	call	output_statement
	jmp	.L119
.L129:
	movq	32(%rsp), %rdx
	movq	152(%rsp), %rcx
	xorl	%r8d, %r8d
	movq	168(%rsp), %r9
	call	indention
	movl	8(%rsi), %r8d
	movq	152(%rsp), %rcx
	leaq	.LC75(%rip), %rdx
	call	fprintf
	jmp	.L113
.L106:
	call	indention
	movl	8(%rsi), %r8d
	movq	152(%rsp), %rcx
	leaq	.LC76(%rip), %rdx
	call	fprintf
	jmp	.L103
.L127:
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
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
