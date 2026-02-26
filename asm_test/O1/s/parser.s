	.file	"D:\\TC\\src\\parser.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Failed to parse right operand\0"
	.text
	.def	parse_expr_prec;	.scl	3;	.type	32;	.endef
	.seh_proc	parse_expr_prec
parse_expr_prec:
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
	movq	%rdx, %r13
	movl	%r8d, %r15d
	movq	%r9, %r14
	movl	$1, %edx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	je	.L7
	movq	%r13, %rsi
	jmp	.L2
.L14:
	movq	%rbx, %rdx
	leaq	.LC0(%rip), %rcx
	call	parser_error
	jmp	.L1
.L12:
	movl	$1, %edx
	movq	%rdi, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	jne	.L5
.L6:
	movq	(%rax), %rcx
	call	string_to_operator
	movl	%eax, %ebx
	movl	%eax, %ecx
	call	operator_precedence
	cmpl	$19, %ebx
	je	.L5
	cmpl	%eax, %ebp
	jge	.L5
	movq	160(%rsp), %rdx
	movq	%rdx, 32(%rsp)
	movq	%r14, %r9
	movl	%eax, %r8d
	movq	%rsi, %rdx
	movq	%rdi, %rcx
	call	parse_expr_prec
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L12
	jmp	.L1
.L5:
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r13, %rdx
	movl	%r12d, %ecx
	call	create_expression
	movq	%rax, %r13
	movl	$1, %edx
	movq	%rdi, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	jne	.L13
.L7:
	movq	(%rax), %rcx
	call	string_to_operator
	movl	%eax, %r12d
	movl	%eax, %ecx
	call	operator_precedence
	movl	%eax, %ebp
	cmpl	$19, %r12d
	je	.L9
	cmpl	%r15d, %eax
	jl	.L9
	movl	$1, %edx
	movq	%rdi, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rdi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	movq	160(%rsp), %r8
	movq	%r14, %rdx
	movq	%rdi, %rcx
	call	parse_primary
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L14
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %rsi
	movl	$1, %edx
	movq	%rdi, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	je	.L6
	jmp	.L5
.L13:
	movq	%r13, %rsi
	jmp	.L2
.L9:
	movq	%r13, %rsi
.L2:
	movq	%rdi, %rcx
	call	peek_current_token
.L1:
	movq	%rsi, %rax
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
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "Failed to parse expression primary\0"
	.text
	.def	parse_expression;	.scl	3;	.type	32;	.endef
	.seh_proc	parse_expression
parse_expression:
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
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	movq	%r8, %rbp
	call	parse_primary
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L18
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %rdx
	movq	%rbp, 32(%rsp)
	movq	%rdi, %r9
	movl	$0, %r8d
	movq	%rsi, %rcx
	call	parse_expr_prec
	movq	%rax, %rbx
.L15:
	movq	%rbx, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L18:
	movq	%rsi, %rcx
	call	peek_current_token
	movq	%rax, %rdx
	leaq	.LC1(%rip), %rcx
	call	parser_error
	jmp	.L15
	.seh_endproc
	.section .rdata,"dr"
.LC2:
	.ascii "Expected variable type\0"
	.align 8
.LC3:
	.ascii "Expected a type for variable declaration\0"
.LC4:
	.ascii "Unknown variable type\0"
.LC5:
	.ascii "Expected variable name\0"
	.align 8
.LC6:
	.ascii "Failed to parse variable initializer\0"
	.text
	.def	parse_variable;	.scl	3;	.type	32;	.endef
	.seh_proc	parse_variable
parse_variable:
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
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, %rsi
	movq	%rdx, %rbp
	movq	%r8, %r12
	call	peek_current_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L20
	cmpl	$6, %eax
	jne	.L21
	movq	(%rbx), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L21
.L20:
	movq	(%rbx), %rdx
	movq	%rbp, %rcx
	call	search
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L23
	testl	$-5, 24(%rax)
	jne	.L29
.L24:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	cmpl	$1, 24(%rax)
	jne	.L30
.L25:
	movq	(%rbx), %rcx
	movq	%rbp, 32(%rsp)
	movl	$0, %r9d
	movq	%rdi, %r8
	movl	$1, %edx
	call	create_name
	movq	%rax, %rbx
	movl	$1, %edx
	movq	%rsi, %rcx
	call	peek_next_token
	movl	$0, %r13d
	cmpl	$5, 24(%rax)
	je	.L31
.L26:
	movq	%r13, %r8
	movq	%rbx, %rdx
	movq	%rdi, %rcx
	call	create_variable
.L19:
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L21:
	movq	%rbx, %rdx
	leaq	.LC2(%rip), %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L19
.L29:
	movq	%rbx, %rdx
	leaq	.LC3(%rip), %rcx
	call	parser_error
	jmp	.L24
.L23:
	movq	%rbx, %rdx
	leaq	.LC4(%rip), %rcx
	call	parser_error
	jmp	.L24
.L30:
	movq	%rax, %rdx
	leaq	.LC5(%rip), %rcx
	call	parser_error
	jmp	.L25
.L31:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx
	movq	(%rdx), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	je	.L26
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %r14
	movq	%r12, %r8
	movq	%rbp, %rdx
	movq	%rsi, %rcx
	call	parse_expression
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L26
	movq	%r14, %rdx
	leaq	.LC6(%rip), %rcx
	call	parser_error
	jmp	.L26
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC7:
	.ascii "Failed to parse parenthesized expression\0"
.LC8:
	.ascii "Expected ')' after expression\0"
	.align 8
.LC9:
	.ascii "Failed to parse operand of unary '!'\0"
	.align 8
.LC10:
	.ascii "Failed to parse operand of unary '-'\0"
	.align 8
.LC11:
	.ascii "Expected variable name in variable access\0"
	.align 8
.LC12:
	.ascii "Cannot call undefined variable\0"
	.align 8
.LC13:
	.ascii "Cannot call non-function variable\0"
	.align 8
.LC14:
	.ascii "Failed to parse function call argument\0"
	.align 8
.LC15:
	.ascii "Expected ',' or ')' after function call argument\0"
	.align 8
.LC16:
	.ascii "Failed to parse sequence index\0"
	.align 8
.LC17:
	.ascii "Expected ']' after sequence index\0"
	.align 8
.LC18:
	.ascii "Cannot access attribute without a valid scope\0"
	.align 8
.LC19:
	.ascii "Expected attribute name after '.'\0"
.LC20:
	.ascii "Unknown attribute name\0"
	.align 8
.LC21:
	.ascii "Failed to parse variable access\0"
	.align 8
.LC22:
	.ascii "Unexpected token in primary expression\0"
	.text
	.def	parse_primary;	.scl	3;	.type	32;	.endef
	.seh_proc	parse_primary
parse_primary:
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
	movq	%rcx, %rsi
	movq	%rdx, %r14
	movq	%r8, 160(%rsp)
	call	peek_current_token
	movq	%rax, %rdi
	movl	24(%rax), %eax
	cmpl	$2, %eax
	je	.L84
	cmpl	$3, %eax
	je	.L85
	cmpl	$4, %eax
	je	.L86
	cmpl	$6, %eax
	je	.L87
.L37:
	cmpl	$5, 24(%rdi)
	je	.L88
.L45:
	movl	24(%rdi), %eax
	cmpl	$1, %eax
	je	.L46
	cmpl	$6, %eax
	jne	.L47
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L47
	movq	160(%rsp), %rax
	cmpb	$0, 1(%rax)
	je	.L47
.L46:
	movq	%rsi, %rcx
	call	peek_current_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L48
	cmpl	$6, %eax
	jne	.L49
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L49
.L48:
	movq	(%rbx), %rdx
	movq	%r14, %rcx
	call	search
	movq	%rax, %r15
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	create_variable_access
	movq	%rax, %rbp
	movl	$1, %edx
	movq	%rsi, %rcx
	call	peek_next_token
	movq	%rax, %r13
	cmpl	$5, 24(%rax)
	jne	.L51
	movl	$0, %r12d
	movl	$0, %ebx
	movq	%rbp, 56(%rsp)
	jmp	.L73
.L84:
	movq	(%rdi), %rdx
	movl	$0, %ebp
	movl	$0, %esi
	movl	$0, %ebx
	movl	$0, %edi
.L34:
	movq	%rbp, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbx, %r8
	movl	%edi, %ecx
	call	create_primary
	movq	%rax, %rbx
.L32:
	movq	%rbx, %rax
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
.L85:
	movq	(%rdi), %rdx
	movl	$0, %ebp
	movl	$0, %esi
	movl	$0, %ebx
	movl	$1, %edi
	jmp	.L34
.L86:
	movq	(%rdi), %rdx
	movl	$0, %ebp
	movl	$0, %esi
	movl	$0, %ebx
	movl	$2, %edi
	jmp	.L34
.L87:
	movq	.refptr.TRUE_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L38
	movq	(%rdi), %rdx
	movl	$0, %ebp
	movl	$0, %esi
	movl	$0, %ebx
	movl	$3, %edi
	jmp	.L34
.L38:
	cmpl	$6, 24(%rdi)
	jne	.L37
	movq	.refptr.FALSE_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L37
	movq	(%rdi), %rdx
	movl	$0, %ebp
	movl	$0, %esi
	movl	$0, %ebx
	movl	$4, %edi
	jmp	.L34
.L88:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L89
	cmpl	$5, 24(%rdi)
	jne	.L45
	movq	.refptr.NOT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L90
	cmpl	$5, 24(%rdi)
	jne	.L45
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L45
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	movq	160(%rsp), %r8
	movq	%r14, %rdx
	movq	%rsi, %rcx
	call	parse_primary
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L91
	movl	$0, %ebp
	movl	$0, %ebx
	movl	$0, %edx
	movl	$7, %edi
	jmp	.L34
.L89:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %rdi
	movq	160(%rsp), %r8
	movq	%r14, %rdx
	movq	%rsi, %rcx
	call	parse_expression
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L92
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %rsi
	movl	24(%rax), %edi
	cmpl	$5, %edi
	jne	.L43
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L43
	movl	$0, %ebp
	movl	$0, %esi
	movl	$0, %edx
	jmp	.L34
.L92:
	movq	%rdi, %rdx
	leaq	.LC7(%rip), %rcx
	call	parser_error
	jmp	.L32
.L43:
	movq	%rsi, %rdx
	leaq	.LC8(%rip), %rcx
	call	parser_error
	movl	$0, %ebx
	jmp	.L32
.L90:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	movq	160(%rsp), %r8
	movq	%r14, %rdx
	movq	%rsi, %rcx
	call	parse_primary
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L93
	movl	$0, %ebp
	movl	$0, %ebx
	movl	$0, %edx
	movl	$6, %edi
	jmp	.L34
.L93:
	movq	%rbx, %rdx
	leaq	.LC9(%rip), %rcx
	call	parser_error
	movq	%rsi, %rbx
	jmp	.L32
.L91:
	movq	%rbx, %rdx
	leaq	.LC10(%rip), %rcx
	call	parser_error
	movq	%rsi, %rbx
	jmp	.L32
.L49:
	movq	%rbx, %rdx
	leaq	.LC11(%rip), %rcx
	call	parser_error
	jmp	.L74
.L81:
	movq	16(%r15), %r12
.L52:
	testq	%rbx, %rbx
	jne	.L55
	testq	%r12, %r12
	je	.L55
	cmpl	$4, 24(%r12)
	je	.L94
.L55:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L95
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	je	.L66
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %r13
	movq	160(%rsp), %r8
	movq	%r14, %rdx
	movq	%rsi, %rcx
	call	parse_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L96
.L67:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %r13
	cmpl	$5, 24(%rax)
	jne	.L68
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	je	.L68
	movq	$0, 32(%rsp)
	movq	%rbp, %r9
	movl	$0, %r8d
	movq	56(%rsp), %rdx
	movl	$3, %ecx
	call	create_variable_access
	movq	%rax, 56(%rsp)
.L65:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	peek_next_token
	movq	%rax, %r13
	cmpl	$5, 24(%rax)
	jne	.L97
.L73:
	testq	%r15, %r15
	je	.L52
	movl	24(%r15), %eax
	leal	-1(%rax), %edx
	cmpl	$2, %edx
	jbe	.L81
	cmpl	$5, %eax
	je	.L81
	testl	$-5, %eax
	cmove	%r15, %r12
	jmp	.L52
.L94:
	movq	16(%r12), %rbx
	jmp	.L55
.L95:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	testq	%r15, %r15
	je	.L98
.L57:
	movl	24(%r15), %eax
	subl	$2, %eax
	cmpl	$1, %eax
	ja	.L99
.L58:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	call	create_list
	movq	%rax, %r12
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r13
	jmp	.L59
.L98:
	movq	%rax, %rdx
	leaq	.LC12(%rip), %rcx
	call	parser_error
	jmp	.L57
.L99:
	movq	%rbx, %rdx
	leaq	.LC13(%rip), %rcx
	call	parser_error
	jmp	.L58
.L102:
	movq	%rbx, %rdx
	leaq	.LC14(%rip), %rcx
	call	parser_error
	jmp	.L60
.L103:
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L100
	cmpl	$5, 24(%rbx)
	jne	.L61
	movq	0(%r13), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L61
.L59:
	cmpl	$5, 24(%rbx)
	je	.L101
.L64:
	movq	160(%rsp), %r8
	movq	%r14, %rdx
	movq	%rsi, %rcx
	call	parse_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L102
.L60:
	movq	%rbp, %rdx
	movq	%r12, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	je	.L103
.L61:
	movq	%rbx, %rdx
	leaq	.LC15(%rip), %rcx
	call	parser_error
.L74:
	movq	%rdi, %rdx
	leaq	.LC21(%rip), %rcx
	call	parser_error
	movl	$0, %ebx
	jmp	.L32
.L100:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L59
.L101:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L64
	movq	%r12, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movq	56(%rsp), %rdx
	movl	$1, %ecx
	call	create_variable_access
	movq	%rax, 56(%rsp)
	movq	16(%r15), %r15
	movl	$0, %ebx
	movl	$0, %r12d
	jmp	.L65
.L96:
	movq	%r13, %rdx
	leaq	.LC16(%rip), %rcx
	call	parser_error
	jmp	.L67
.L68:
	movq	%r13, %rdx
	leaq	.LC17(%rip), %rcx
	call	parser_error
	jmp	.L74
.L66:
	movq	.refptr.DOT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	je	.L83
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %r12
	testq	%rbx, %rbx
	je	.L104
	cmpl	$1, 24(%rax)
	jne	.L105
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	search
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L106
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %r8
	movq	56(%rsp), %rdx
	movl	$2, %ecx
	call	create_variable_access
	movq	%rax, 56(%rsp)
	movl	$0, %ebx
	movl	$0, %r12d
	jmp	.L65
.L104:
	movq	%rax, %rdx
	leaq	.LC18(%rip), %rcx
	call	parser_error
	jmp	.L74
.L105:
	movq	%rax, %rdx
	leaq	.LC19(%rip), %rcx
	call	parser_error
	jmp	.L74
.L106:
	movq	%r12, %rdx
	leaq	.LC20(%rip), %rcx
	call	parser_error
	jmp	.L74
.L97:
	movq	56(%rsp), %rbp
.L51:
	testq	%rbp, %rbp
	je	.L74
	movl	$0, %esi
	movl	$0, %ebx
	movl	$0, %edx
	movl	$8, %edi
	jmp	.L34
.L83:
	movq	56(%rsp), %rbp
	jmp	.L51
.L47:
	movq	%rdi, %rdx
	leaq	.LC22(%rip), %rcx
	call	parser_error
	movl	$0, %ebx
	jmp	.L32
	.seh_endproc
	.section .rdata,"dr"
.LC23:
	.ascii "Expected '(' after 'if'\0"
.LC24:
	.ascii "Failed to parse if condition\0"
	.align 8
.LC25:
	.ascii "Expected ')' after if condition\0"
.LC26:
	.ascii "Expected '{' to start if body\0"
	.align 8
.LC27:
	.ascii "Failed to parse if body statement\0"
.LC28:
	.ascii "Expected '(' after 'elif'\0"
	.align 8
.LC29:
	.ascii "Failed to parse else-if condition\0"
	.align 8
.LC30:
	.ascii "Expected ')' after else-if condition\0"
	.align 8
.LC31:
	.ascii "Expected '{' to start else-if body\0"
	.align 8
.LC32:
	.ascii "Failed to parse else-if body statement\0"
	.align 8
.LC33:
	.ascii "Expected '{' to start else body\0"
	.align 8
.LC34:
	.ascii "Failed to parse else body statement\0"
.LC35:
	.ascii "Expected '(' after 'for'\0"
	.align 8
.LC36:
	.ascii "Failed to parse for loop initializer\0"
	.align 8
.LC37:
	.ascii "Expected ';' after for loop initializer\0"
	.align 8
.LC38:
	.ascii "Failed to parse for loop condition\0"
	.align 8
.LC39:
	.ascii "Expected ';' after for loop condition\0"
	.align 8
.LC40:
	.ascii "Failed to parse for loop increment\0"
	.align 8
.LC41:
	.ascii "Expected ')' after for loop increment\0"
	.align 8
.LC42:
	.ascii "Expected '{' to start for loop body\0"
	.align 8
.LC43:
	.ascii "Failed to parse for loop body statement\0"
.LC44:
	.ascii "Expected '(' after 'while'\0"
	.align 8
.LC45:
	.ascii "Failed to parse while condition\0"
	.align 8
.LC46:
	.ascii "Expected ')' after while condition\0"
	.align 8
.LC47:
	.ascii "Expected '{' to start while body\0"
	.align 8
.LC48:
	.ascii "Failed to parse while body statement\0"
	.align 8
.LC49:
	.ascii "Cannot use 'break' outside of a loop\0"
	.align 8
.LC50:
	.ascii "Cannot use 'continue' outside of a loop\0"
.LC51:
	.ascii "Failed to parse statement\0"
.LC52:
	.ascii "Expected ';' after statement\0"
	.text
	.def	parse_statement;	.scl	3;	.type	32;	.endef
	.seh_proc	parse_statement
parse_statement:
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
	subq	$104, %rsp
	.seh_stackalloc	104
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%r8, %rdi
	call	peek_current_token
	movq	%rax, %rsi
	cmpl	$6, 24(%rax)
	je	.L190
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	$0, 40(%rsp)
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_statement
	movq	%rax, %rsi
.L177:
	movq	%rbx, %rcx
	call	peek_current_token
	testq	%rsi, %rsi
	je	.L191
.L183:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	je	.L192
.L184:
	movq	%rbx, %rdx
	leaq	.LC52(%rip), %rcx
	call	parser_error
.L107:
	movq	%rsi, %rax
	addq	$104, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L190:
	movq	.refptr.IF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L193
	movq	.refptr.FOR_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L194
	movq	.refptr.WHILE_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L195
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L176
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_variable
	movq	%rax, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$1, %ecx
	call	create_statement
	movq	%rax, %rsi
	jmp	.L177
.L193:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L110
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L110
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, 72(%rsp)
	testq	%rax, %rax
	je	.L196
.L113:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L114
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L114
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L116
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L116
	call	create_list
	movq	%rax, %r15
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r13
	leaq	.LC27(%rip), %r14
	jmp	.L118
.L110:
	movq	%rsi, %rdx
	leaq	.LC23(%rip), %rcx
	call	parser_error
	movl	$0, %edx
.L112:
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$2, %ecx
	call	create_statement
	movq	%rax, %rsi
	jmp	.L107
.L196:
	movq	%rsi, %rdx
	leaq	.LC24(%rip), %rcx
	call	parser_error
	jmp	.L113
.L114:
	movq	%rsi, %rdx
	leaq	.LC25(%rip), %rcx
	call	parser_error
	movl	$0, %edx
	jmp	.L112
.L116:
	movq	%rsi, %rdx
	leaq	.LC26(%rip), %rcx
	call	parser_error
	movl	$0, %edx
	jmp	.L112
.L120:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L197
.L119:
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
.L118:
	cmpl	$5, 24(%r12)
	jne	.L120
	movq	0(%r13), %rdx
	movq	(%r12), %rcx
	call	string_equal
	testb	%al, %al
	je	.L120
	call	create_list
	movq	%rax, 64(%rsp)
	call	create_list
	movq	%rax, 80(%rsp)
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	movq	%rax, %rsi
	cmpl	$6, 24(%rax)
	jne	.L122
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14
	movq	%r15, 88(%rsp)
	jmp	.L121
.L197:
	movq	%r12, %rdx
	movq	%r14, %rcx
	call	parser_error
	jmp	.L119
.L123:
	movq	%rsi, %rdx
	leaq	.LC28(%rip), %rcx
	call	parser_error
	movl	$0, %edx
	jmp	.L112
.L200:
	movq	%rsi, %rdx
	leaq	.LC29(%rip), %rcx
	call	parser_error
	jmp	.L125
.L126:
	movq	%rsi, %rdx
	leaq	.LC30(%rip), %rcx
	call	parser_error
	movl	$0, %edx
	jmp	.L112
.L128:
	movq	%rsi, %rdx
	leaq	.LC31(%rip), %rcx
	call	parser_error
	movl	$0, %edx
	jmp	.L112
.L132:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L198
.L131:
	movq	%r12, %rdx
	movq	%r13, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
.L130:
	cmpl	$5, 24(%rsi)
	jne	.L132
	movq	(%r14), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L132
	movq	%r13, %rdx
	movq	56(%rsp), %rcx
	call	create_else_if
	movq	%rax, %rdx
	movq	64(%rsp), %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	movq	%rax, %rsi
	cmpl	$6, 24(%rax)
	jne	.L189
.L121:
	movq	.refptr.ELIF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L199
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L123
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L123
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, 56(%rsp)
	testq	%rax, %rax
	je	.L200
.L125:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L126
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L126
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L128
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L128
	call	create_list
	movq	%rax, %r13
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	leaq	.LC32(%rip), %r15
	jmp	.L130
.L198:
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	parser_error
	jmp	.L131
.L199:
	movq	88(%rsp), %r15
	cmpl	$6, 24(%rsi)
	jne	.L122
	movq	.refptr.ELSE_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L122
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L134
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L134
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14
	leaq	.LC34(%rip), %r13
	jmp	.L136
.L134:
	movq	%rsi, %rdx
	leaq	.LC33(%rip), %rcx
	call	parser_error
	movl	$0, %edx
	jmp	.L112
.L138:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L201
.L137:
	movq	%r12, %rdx
	movq	80(%rsp), %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
.L136:
	cmpl	$5, 24(%rsi)
	jne	.L138
	movq	(%r14), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L138
	jmp	.L122
.L201:
	movq	%rsi, %rdx
	movq	%r13, %rcx
	call	parser_error
	jmp	.L137
.L189:
	movq	88(%rsp), %r15
.L122:
	movq	%rbx, %rcx
	call	peek_current_token
	movq	80(%rsp), %r9
	movq	64(%rsp), %r8
	movq	%r15, %rdx
	movq	72(%rsp), %rcx
	call	create_if
	movq	%rax, %rdx
	jmp	.L112
.L194:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L141
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L141
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	je	.L202
.L144:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_variable
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L203
.L146:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
.L145:
	cmpl	$5, 24(%rsi)
	jne	.L147
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L147
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
	cmpl	$5, 24(%rax)
	je	.L204
.L149:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L205
.L151:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
.L150:
	cmpl	$5, 24(%r12)
	jne	.L152
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%r12), %rcx
	call	string_equal
	testb	%al, %al
	je	.L152
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
	cmpl	$5, 24(%rax)
	je	.L206
.L154:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, 56(%rsp)
	testq	%rax, %rax
	je	.L207
.L156:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
.L155:
	cmpl	$5, 24(%r12)
	jne	.L157
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%r12), %rcx
	call	string_equal
	testb	%al, %al
	je	.L157
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
	cmpl	$5, 24(%rax)
	jne	.L159
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%r12), %rcx
	call	string_equal
	testb	%al, %al
	je	.L159
	call	create_list
	movq	%rax, %r14
	movb	$1, 2(%rdi)
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r15
	movq	%r13, 64(%rsp)
	jmp	.L161
.L141:
	movq	%rsi, %rdx
	leaq	.LC35(%rip), %rcx
	call	parser_error
	movl	$0, %r9d
.L143:
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r8d
	movl	$0, %edx
	movl	$4, %ecx
	call	create_statement
	movq	%rax, %rsi
	jmp	.L107
.L202:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	movl	$0, %r13d
	testb	%al, %al
	jne	.L145
	jmp	.L144
.L203:
	movq	%rsi, %rdx
	leaq	.LC36(%rip), %rcx
	call	parser_error
	jmp	.L146
.L147:
	movq	%rsi, %rdx
	leaq	.LC37(%rip), %rcx
	call	parser_error
	movl	$0, %r9d
	jmp	.L143
.L204:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%r12), %rcx
	call	string_equal
	movl	$0, %esi
	testb	%al, %al
	jne	.L150
	jmp	.L149
.L205:
	movq	%r12, %rdx
	leaq	.LC38(%rip), %rcx
	call	parser_error
	jmp	.L151
.L152:
	movq	%r12, %rdx
	leaq	.LC39(%rip), %rcx
	call	parser_error
	movl	$0, %r9d
	jmp	.L143
.L206:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%r12), %rcx
	call	string_equal
	movq	$0, 56(%rsp)
	testb	%al, %al
	jne	.L155
	jmp	.L154
.L207:
	movq	%r12, %rdx
	leaq	.LC40(%rip), %rcx
	call	parser_error
	jmp	.L156
.L157:
	movq	%r12, %rdx
	leaq	.LC41(%rip), %rcx
	call	parser_error
	movl	$0, %r9d
	jmp	.L143
.L159:
	movq	%r12, %rdx
	leaq	.LC42(%rip), %rcx
	call	parser_error
	movl	$0, %r9d
	jmp	.L143
.L163:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L208
.L162:
	movq	%r13, %rdx
	movq	%r14, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
.L161:
	cmpl	$5, 24(%r12)
	jne	.L163
	movq	(%r15), %rdx
	movq	(%r12), %rcx
	call	string_equal
	testb	%al, %al
	je	.L163
	movq	64(%rsp), %r13
	movb	$0, 2(%rdi)
	movq	%r14, %r9
	movq	56(%rsp), %r8
	movq	%rsi, %rdx
	movq	%r13, %rcx
	call	create_for
	movq	%rax, %r9
	jmp	.L143
.L208:
	movq	%r12, %rdx
	leaq	.LC43(%rip), %rcx
	call	parser_error
	jmp	.L162
.L195:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L165
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L165
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L209
.L168:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L169
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L169
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L171
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L171
	call	create_list
	movq	%rax, %r13
	movb	$1, 2(%rdi)
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r15
	jmp	.L173
.L165:
	movq	%rsi, %rdx
	leaq	.LC44(%rip), %rcx
	call	parser_error
	movl	$0, %r8d
.L167:
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %edx
	movl	$3, %ecx
	call	create_statement
	movq	%rax, %rsi
	jmp	.L107
.L209:
	movq	%rsi, %rdx
	leaq	.LC45(%rip), %rcx
	call	parser_error
	jmp	.L168
.L169:
	movq	%rsi, %rdx
	leaq	.LC46(%rip), %rcx
	call	parser_error
	movl	$0, %r8d
	jmp	.L167
.L171:
	movq	%rsi, %rdx
	leaq	.LC47(%rip), %rcx
	call	parser_error
	movl	$0, %r8d
	jmp	.L167
.L175:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L210
.L174:
	movq	%rsi, %rdx
	movq	%r13, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
.L173:
	cmpl	$5, 24(%r12)
	jne	.L175
	movq	(%r15), %rdx
	movq	(%r12), %rcx
	call	string_equal
	testb	%al, %al
	je	.L175
	movb	$0, 2(%rdi)
	movq	%r13, %rdx
	movq	%r14, %rcx
	call	create_while
	movq	%rax, %r8
	jmp	.L167
.L210:
	movq	%r12, %rdx
	leaq	.LC48(%rip), %rcx
	call	parser_error
	jmp	.L174
.L176:
	movq	.refptr.RETURN_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L178
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	$0, 40(%rsp)
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$5, %ecx
	call	create_statement
	movq	%rax, %rsi
	jmp	.L177
.L178:
	movq	.refptr.BREAK_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L179
	cmpb	$0, 2(%rdi)
	je	.L211
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$6, %ecx
	call	create_statement
	movq	%rax, %rsi
	jmp	.L177
.L211:
	movq	%rsi, %rdx
	leaq	.LC49(%rip), %rcx
	call	parser_error
	movl	$0, %esi
	jmp	.L107
.L179:
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L181
	cmpb	$0, 2(%rdi)
	je	.L212
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$7, %ecx
	call	create_statement
	movq	%rax, %rsi
	jmp	.L177
.L212:
	movq	%rsi, %rdx
	leaq	.LC50(%rip), %rcx
	call	parser_error
	movl	$0, %esi
	jmp	.L107
.L181:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	$0, 40(%rsp)
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_statement
	movq	%rax, %rsi
	jmp	.L177
.L191:
	movq	%rax, %rdx
	leaq	.LC51(%rip), %rcx
	call	parser_error
	jmp	.L183
.L192:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L107
	jmp	.L184
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC53:
	.ascii "Expected identifier after 'import'\0"
	.align 8
.LC54:
	.ascii "Expected string literal after 'from'\0"
	.align 8
.LC55:
	.ascii "Expected ';' at end of import statement\0"
	.align 8
.LC56:
	.ascii "Failed to parse import statement\0"
	.align 8
.LC57:
	.ascii "Expected function return type after 'func'\0"
.LC58:
	.ascii "Unknown function return type\0"
	.align 8
.LC59:
	.ascii "Expected function name after return type\0"
	.align 8
.LC60:
	.ascii "Expected '(' after function name\0"
	.align 8
.LC61:
	.ascii "Failed to parse function parameter\0"
	.align 8
.LC62:
	.ascii "Function parameters cannot have default values\0"
	.align 8
.LC63:
	.ascii "Expected ',' or ')' after function parameter\0"
	.align 8
.LC64:
	.ascii "Expected '{' to start function body\0"
	.align 8
.LC65:
	.ascii "Failed to parse function body statement\0"
	.align 8
.LC66:
	.ascii "Unreachable code after return statement\0"
	.align 8
.LC67:
	.ascii "Function missing return statement\0"
	.align 8
.LC68:
	.ascii "Failed to parse function declaration\0"
	.align 8
.LC69:
	.ascii "Expected class name after 'class'\0"
	.align 8
.LC70:
	.ascii "Expected '{' to start class body\0"
	.align 8
.LC71:
	.ascii "Expected method return type after 'method'\0"
	.align 8
.LC72:
	.ascii "Unknown return type for method\0"
	.align 8
.LC73:
	.ascii "Expected method name after return type\0"
	.align 8
.LC74:
	.ascii "Expected '(' after method name\0"
	.align 8
.LC75:
	.ascii "Expected 'self' as first parameter of method\0"
	.align 8
.LC76:
	.ascii "Expected ',' or ')' after method parameter\0"
	.align 8
.LC77:
	.ascii "Failed to parse method parameter\0"
	.align 8
.LC78:
	.ascii "Method parameters cannot have default values\0"
	.align 8
.LC79:
	.ascii "Expected '{' to start method body\0"
	.align 8
.LC80:
	.ascii "Failed to parse method body statement\0"
	.align 8
.LC81:
	.ascii "Method missing return statement\0"
.LC82:
	.ascii "Failed to parse class method\0"
	.align 8
.LC83:
	.ascii "Failed to parse class variable\0"
	.align 8
.LC84:
	.ascii "Expected ';' after class variable declaration\0"
	.align 8
.LC85:
	.ascii "Unexpected token in class member\0"
	.align 8
.LC86:
	.ascii "Failed to parse class declaration\0"
	.align 8
.LC87:
	.ascii "Unexpected token in code member\0"
	.text
	.globl	parse_code
	.def	parse_code;	.scl	2;	.type	32;	.endef
	.seh_proc	parse_code
parse_code:
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
	subq	$152, %rsp
	.seh_stackalloc	152
	.seh_endprologue
	movq	%rcx, %r15
	movq	%rdx, %rbx
	movq	%r8, 240(%rsp)
	movq	.refptr.builtin_scope(%rip), %rax
	cmpq	$0, (%rax)
	je	.L308
.L214:
	testq	%rbx, %rbx
	je	.L309
.L215:
	call	create_list
	movq	%rax, 56(%rsp)
	movq	%rbx, %rcx
	call	create_scope
	movq	%rax, 48(%rsp)
	movl	$1, %edx
	movq	%r15, %rcx
	call	get_next_token
	testq	%rax, %rax
	je	.L217
	movq	%rax, %r12
	movq	%r15, %rbp
	jmp	.L216
.L308:
	movl	$0, %ecx
	call	create_scope
	movq	.refptr.builtin_scope(%rip), %rsi
	movq	%rax, (%rsi)
	movq	.refptr.VOID_KEYWORD(%rip), %rdx
	movq	(%rdx), %rcx
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	call	create_name
	movq	.refptr.name_void(%rip), %rdx
	movq	%rax, (%rdx)
	movq	.refptr.INT_KEYWORD(%rip), %rax
	movq	(%rax), %rcx
	movq	(%rsi), %rax
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	call	create_name
	movq	.refptr.name_int(%rip), %rdx
	movq	%rax, (%rdx)
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	movq	(%rax), %rcx
	movq	(%rsi), %rax
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	call	create_name
	movq	.refptr.name_float(%rip), %rdx
	movq	%rax, (%rdx)
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	movq	(%rax), %rcx
	movq	(%rsi), %rax
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	call	create_name
	movq	.refptr.name_string(%rip), %rdx
	movq	%rax, (%rdx)
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	movq	(%rax), %rcx
	movq	(%rsi), %rax
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	call	create_name
	movq	.refptr.name_bool(%rip), %rdx
	movq	%rax, (%rdx)
	jmp	.L214
.L309:
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %rbx
	jmp	.L215
.L326:
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%r12), %rcx
	call	string_equal
	movl	%eax, %esi
	testb	%al, %al
	jne	.L310
	cmpl	$6, 24(%r12)
	jne	.L254
	movq	.refptr.FUNC_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%r12), %rcx
	call	string_equal
	movb	%al, 95(%rsp)
	testb	%al, %al
	jne	.L311
	cmpl	$6, 24(%r12)
	jne	.L254
	movq	.refptr.CLASS_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%r12), %rcx
	call	string_equal
	testb	%al, %al
	je	.L254
	movq	48(%rsp), %rcx
	call	create_scope
	movq	%rax, 64(%rsp)
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	cmpl	$1, 24(%rax)
	jne	.L312
	movq	(%rax), %rcx
	movq	48(%rsp), %rax
	movq	%rax, 32(%rsp)
	movq	64(%rsp), %r9
	movl	$0, %r8d
	movl	$4, %edx
	call	create_name
	movq	%rax, 80(%rsp)
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	jne	.L257
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L257
	call	create_list
	movq	%rax, 72(%rsp)
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r13
	movq	.refptr.METHOD_KEYWORD(%rip), %r15
	movq	.refptr.VAR_KEYWORD(%rip), %r14
	movq	%r12, 112(%rsp)
	movq	%rax, %rbx
	jmp	.L259
.L310:
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	cmpl	$1, 24(%rax)
	jne	.L313
	movq	(%rax), %rdi
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rbx
	movl	$0, %esi
	cmpl	$6, 24(%rax)
	je	.L314
.L222:
	cmpl	$5, 24(%rbx)
	jne	.L224
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L224
	movq	48(%rsp), %r8
	movq	%rsi, %rdx
	movq	%rdi, %rcx
	call	parse_import_file
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L315
.L226:
	movq	%rsi, %rdx
	call	create_import
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L296
.L227:
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	call	create_code_member
	movq	%rax, %rdx
	movq	56(%rsp), %rcx
	call	list_append
	jmp	.L228
.L313:
	movq	%rax, %rdx
	leaq	.LC53(%rip), %rcx
	call	parser_error
	jmp	.L296
.L314:
	movq	.refptr.FROM_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L222
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	cmpl	$4, 24(%rax)
	jne	.L316
	movq	(%rax), %rsi
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L222
.L316:
	movq	%rax, %rdx
	leaq	.LC54(%rip), %rcx
	call	parser_error
	jmp	.L296
.L224:
	movq	%rbx, %rdx
	leaq	.LC55(%rip), %rcx
	call	parser_error
.L296:
	movq	%r12, %rdx
	leaq	.LC56(%rip), %rcx
	call	parser_error
	movl	$0, %edx
	jmp	.L227
.L315:
	movq	.refptr.name_void(%rip), %rax
	movq	(%rax), %r8
	movq	48(%rsp), %rax
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$1, %edx
	movq	%rdi, %rcx
	call	create_name
	movq	%rax, %rcx
	jmp	.L226
.L311:
	movq	48(%rsp), %rcx
	call	create_scope
	movq	%rax, %rdi
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L230
	cmpl	$6, %eax
	jne	.L231
	movq	(%rbx), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L231
.L230:
	movq	(%rbx), %rdx
	movq	48(%rsp), %rcx
	call	search
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L317
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	cmpl	$1, 24(%rax)
	jne	.L318
	movq	(%rax), %rcx
	movq	48(%rsp), %rax
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movq	%r15, %r8
	movl	$2, %edx
	call	create_name
	movq	%rax, 72(%rsp)
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	jne	.L235
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L235
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rbx
	call	create_list
	movq	%rax, 64(%rsp)
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r14
	movq	%r14, %r13
	jmp	.L237
.L231:
	movq	%rbx, %rdx
	leaq	.LC57(%rip), %rcx
	call	parser_error
.L297:
	movq	%r12, %rdx
	leaq	.LC68(%rip), %rcx
	call	parser_error
	movl	$0, %r8d
	jmp	.L253
.L317:
	movq	%rbx, %rdx
	leaq	.LC58(%rip), %rcx
	call	parser_error
	jmp	.L297
.L318:
	movq	%rax, %rdx
	leaq	.LC59(%rip), %rcx
	call	parser_error
	jmp	.L297
.L235:
	movq	%rbx, %rdx
	leaq	.LC60(%rip), %rcx
	call	parser_error
	jmp	.L297
.L321:
	movq	%rbx, %rdx
	leaq	.LC61(%rip), %rcx
	call	parser_error
	jmp	.L239
.L240:
	movq	%rax, %rdx
	movq	64(%rsp), %rcx
	call	list_append
	jmp	.L239
.L322:
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L319
	cmpl	$5, 24(%rbx)
	jne	.L241
	movq	0(%r13), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L241
.L237:
	cmpl	$5, 24(%rbx)
	je	.L320
.L244:
	movq	240(%rsp), %r8
	movq	%rdi, %rdx
	movq	%rbp, %rcx
	call	parse_variable
	testq	%rax, %rax
	je	.L321
	cmpq	$0, 16(%rax)
	je	.L240
	movq	%rbx, %rdx
	leaq	.LC62(%rip), %rcx
	call	parser_error
.L239:
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	je	.L322
.L241:
	movq	%rbx, %rdx
	leaq	.LC63(%rip), %rcx
	call	parser_error
	jmp	.L297
.L319:
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L237
.L320:
	movq	(%r14), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L244
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	jne	.L245
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L245
	call	create_list
	movq	%rax, %r14
	movq	240(%rsp), %rax
	movb	$1, (%rax)
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %r13
	movq	%r12, 80(%rsp)
	movq	240(%rsp), %r12
	jmp	.L247
.L245:
	movq	%rbx, %rdx
	leaq	.LC64(%rip), %rcx
	call	parser_error
	jmp	.L297
.L251:
	movq	%r12, %r8
	movq	%rdi, %rdx
	movq	%rbp, %rcx
	call	parse_statement
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L323
	testb	%sil, %sil
	jne	.L324
.L249:
	cmpl	$5, 8(%rbx)
	movl	$1, %eax
	cmove	%eax, %esi
	movq	%rbx, %rdx
	movq	%r14, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %r13
.L247:
	cmpl	$5, 24(%r13)
	jne	.L251
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	je	.L251
	movq	80(%rsp), %r12
	movq	240(%rsp), %rax
	movb	$0, (%rax)
	testb	%sil, %sil
	jne	.L252
	movq	.refptr.name_void(%rip), %rax
	cmpq	(%rax), %r15
	je	.L252
	movq	%r13, %rdx
	leaq	.LC67(%rip), %rcx
	call	parser_error
.L252:
	movq	%rdi, 32(%rsp)
	movq	%r14, %r9
	movq	64(%rsp), %r8
	movq	%r15, %rdx
	movq	72(%rsp), %rcx
	call	create_function
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L297
.L253:
	movl	$0, %r9d
	movl	$0, %edx
	movl	$1, %ecx
	call	create_code_member
	movq	%rax, %rdx
	movq	56(%rsp), %rcx
	call	list_append
	jmp	.L228
.L323:
	movq	%r13, %rdx
	leaq	.LC65(%rip), %rcx
	call	parser_error
	jmp	.L249
.L324:
	movq	%r13, %rdx
	leaq	.LC66(%rip), %rcx
	call	parser_error
	jmp	.L249
.L312:
	movq	%rax, %rdx
	leaq	.LC69(%rip), %rcx
	call	parser_error
	jmp	.L298
.L257:
	movq	%rbx, %rdx
	leaq	.LC70(%rip), %rcx
	call	parser_error
.L298:
	movq	%r12, %rdx
	leaq	.LC86(%rip), %rcx
	call	parser_error
	movl	$0, %r9d
	jmp	.L294
.L293:
	cmpl	$6, 24(%rbx)
	je	.L325
.L260:
	movq	%rbx, %rdx
	leaq	.LC85(%rip), %rcx
	call	parser_error
.L290:
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rbx
.L259:
	cmpl	$5, 24(%rbx)
	jne	.L293
	movq	0(%r13), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L293
	movq	112(%rsp), %r12
	movq	64(%rsp), %r8
	movq	72(%rsp), %rdx
	movq	80(%rsp), %rcx
	call	create_class
	movq	%rax, %r9
	testq	%rax, %rax
	je	.L298
.L294:
	movl	$0, %r8d
	movl	$0, %edx
	movl	$2, %ecx
	call	create_code_member
	movq	%rax, %rdx
	movq	56(%rsp), %rcx
	call	list_append
.L228:
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L217
.L216:
	movl	24(%r12), %eax
	testl	%eax, %eax
	je	.L217
	cmpl	$6, %eax
	je	.L326
.L254:
	movq	%r12, %rdx
	leaq	.LC87(%rip), %rcx
	call	parser_error
	jmp	.L228
.L325:
	movq	(%r15), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L327
	cmpl	$6, 24(%rbx)
	jne	.L260
	movq	(%r14), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L260
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rsi
	movq	240(%rsp), %r8
	movq	64(%rsp), %rdx
	movq	%rbp, %rcx
	call	parse_variable
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L328
.L291:
	movq	%rbx, %r8
	movl	$0, %edx
	movl	$1, %ecx
	call	create_class_member
	movq	%rax, %rdx
	movq	72(%rsp), %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	je	.L329
.L292:
	movq	%rbx, %rdx
	leaq	.LC84(%rip), %rcx
	call	parser_error
	jmp	.L290
.L327:
	movq	64(%rsp), %rcx
	call	create_scope
	movq	%rax, %r12
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rcx
	movq	%r12, 32(%rsp)
	movl	$0, %r9d
	movq	80(%rsp), %r8
	movl	$1, %edx
	call	create_name
	movq	%rax, %rdi
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rsi
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L262
	cmpl	$6, %eax
	jne	.L263
	movq	(%rsi), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L263
.L262:
	movq	(%rsi), %rdx
	movq	64(%rsp), %rcx
	call	search
	movq	%rax, 104(%rsp)
	testq	%rax, %rax
	je	.L330
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	cmpl	$1, 24(%rax)
	jne	.L331
	movq	(%rax), %rcx
	movq	64(%rsp), %rax
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movq	104(%rsp), %r8
	movl	$3, %edx
	call	create_name
	movq	%rax, 128(%rsp)
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L267
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L267
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$6, 24(%rax)
	je	.L332
.L269:
	movq	%rsi, %rdx
	leaq	.LC75(%rip), %rcx
	call	parser_error
.L270:
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rsi
	call	create_list
	movq	%rax, 120(%rsp)
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	80(%rsp), %rcx
	call	create_variable
	movq	%rax, %rdx
	movq	120(%rsp), %rcx
	call	list_append
	movq	.refptr.COMMA_SYMBOL(%rip), %rdi
	jmp	.L271
.L263:
	movq	%rsi, %rdx
	leaq	.LC71(%rip), %rcx
	call	parser_error
.L299:
	movq	%rbx, %rdx
	leaq	.LC82(%rip), %rcx
	call	parser_error
	movl	$0, %edx
	jmp	.L289
.L330:
	movq	%rsi, %rdx
	leaq	.LC72(%rip), %rcx
	call	parser_error
	jmp	.L299
.L331:
	movq	%rax, %rdx
	leaq	.LC73(%rip), %rcx
	call	parser_error
	jmp	.L299
.L267:
	movq	%rsi, %rdx
	leaq	.LC74(%rip), %rcx
	call	parser_error
	jmp	.L299
.L332:
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L270
	jmp	.L269
.L273:
	cmpl	$5, 24(%rsi)
	jne	.L276
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L276
.L277:
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L281
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L281
	call	create_list
	movq	%rax, 96(%rsp)
	movq	240(%rsp), %rax
	movb	$1, (%rax)
	movb	$1, 1(%rax)
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movzbl	95(%rsp), %edi
	movq	%rbx, 136(%rsp)
	movq	%rax, %rsi
	jmp	.L283
.L333:
	movq	%rsi, %rdx
	leaq	.LC77(%rip), %rcx
	call	parser_error
	jmp	.L278
.L279:
	movq	%rax, %rdx
	movq	120(%rsp), %rcx
	call	list_append
	jmp	.L278
.L334:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L277
	cmpl	$5, 24(%rsi)
	jne	.L276
	movq	(%rdi), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L273
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rsi
	movq	240(%rsp), %r8
	movq	%r12, %rdx
	movq	%rbp, %rcx
	call	parse_variable
	testq	%rax, %rax
	je	.L333
	cmpq	$0, 16(%rax)
	je	.L279
	movq	%rsi, %rdx
	leaq	.LC78(%rip), %rcx
	call	parser_error
.L278:
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rsi
.L271:
	cmpl	$5, 24(%rsi)
	je	.L334
.L276:
	movq	%rsi, %rdx
	leaq	.LC76(%rip), %rcx
	call	parser_error
	jmp	.L299
.L281:
	movq	%rsi, %rdx
	leaq	.LC79(%rip), %rcx
	call	parser_error
	jmp	.L299
.L287:
	movq	240(%rsp), %r8
	movq	%r12, %rdx
	movq	%rbp, %rcx
	call	parse_statement
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L335
	testb	%dil, %dil
	jne	.L336
.L285:
	cmpl	$5, 8(%rbx)
	movl	$1, %eax
	cmove	%eax, %edi
	movq	%rbx, %rdx
	movq	96(%rsp), %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rsi
.L283:
	cmpl	$5, 24(%rsi)
	jne	.L287
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L287
	movq	136(%rsp), %rbx
	movq	240(%rsp), %rax
	movb	$0, (%rax)
	movb	$0, 1(%rax)
	testb	%dil, %dil
	jne	.L288
	movq	.refptr.name_void(%rip), %rax
	movq	104(%rsp), %rdi
	cmpq	(%rax), %rdi
	je	.L288
	movq	%rsi, %rdx
	leaq	.LC81(%rip), %rcx
	call	parser_error
.L288:
	movq	%r12, 32(%rsp)
	movq	96(%rsp), %r9
	movq	120(%rsp), %r8
	movq	104(%rsp), %rdx
	movq	128(%rsp), %rcx
	call	create_method
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L299
.L289:
	movl	$0, %r8d
	movl	$0, %ecx
	call	create_class_member
	movq	%rax, %rdx
	movq	72(%rsp), %rcx
	call	list_append
	jmp	.L290
.L335:
	movq	%rsi, %rdx
	leaq	.LC80(%rip), %rcx
	call	parser_error
	jmp	.L285
.L336:
	movq	%rsi, %rdx
	leaq	.LC66(%rip), %rcx
	call	parser_error
	jmp	.L285
.L328:
	movq	%rsi, %rdx
	leaq	.LC83(%rip), %rcx
	call	parser_error
	jmp	.L291
.L329:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L290
	jmp	.L292
.L217:
	movq	48(%rsp), %rdx
	movq	56(%rsp), %rcx
	call	create_code
	addq	$152, %rsp
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
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
	.def	parser_error;	.scl	2;	.type	32;	.endef
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.def	search;	.scl	2;	.type	32;	.endef
	.def	create_name;	.scl	2;	.type	32;	.endef
	.def	create_variable;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.def	create_else_if;	.scl	2;	.type	32;	.endef
	.def	create_if;	.scl	2;	.type	32;	.endef
	.def	create_for;	.scl	2;	.type	32;	.endef
	.def	create_while;	.scl	2;	.type	32;	.endef
	.def	create_scope;	.scl	2;	.type	32;	.endef
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.def	create_import;	.scl	2;	.type	32;	.endef
	.def	create_code_member;	.scl	2;	.type	32;	.endef
	.def	create_function;	.scl	2;	.type	32;	.endef
	.def	create_class;	.scl	2;	.type	32;	.endef
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.def	create_method;	.scl	2;	.type	32;	.endef
	.def	create_code;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.METHOD_KEYWORD, "dr"
	.globl	.refptr.METHOD_KEYWORD
	.linkonce	discard
.refptr.METHOD_KEYWORD:
	.quad	METHOD_KEYWORD
	.section	.rdata$.refptr.CLASS_KEYWORD, "dr"
	.globl	.refptr.CLASS_KEYWORD
	.linkonce	discard
.refptr.CLASS_KEYWORD:
	.quad	CLASS_KEYWORD
	.section	.rdata$.refptr.FUNC_KEYWORD, "dr"
	.globl	.refptr.FUNC_KEYWORD
	.linkonce	discard
.refptr.FUNC_KEYWORD:
	.quad	FUNC_KEYWORD
	.section	.rdata$.refptr.FROM_KEYWORD, "dr"
	.globl	.refptr.FROM_KEYWORD
	.linkonce	discard
.refptr.FROM_KEYWORD:
	.quad	FROM_KEYWORD
	.section	.rdata$.refptr.IMPORT_KEYWORD, "dr"
	.globl	.refptr.IMPORT_KEYWORD
	.linkonce	discard
.refptr.IMPORT_KEYWORD:
	.quad	IMPORT_KEYWORD
	.section	.rdata$.refptr.name_bool, "dr"
	.globl	.refptr.name_bool
	.linkonce	discard
.refptr.name_bool:
	.quad	name_bool
	.section	.rdata$.refptr.BOOL_KEYWORD, "dr"
	.globl	.refptr.BOOL_KEYWORD
	.linkonce	discard
.refptr.BOOL_KEYWORD:
	.quad	BOOL_KEYWORD
	.section	.rdata$.refptr.name_string, "dr"
	.globl	.refptr.name_string
	.linkonce	discard
.refptr.name_string:
	.quad	name_string
	.section	.rdata$.refptr.STRING_KEYWORD, "dr"
	.globl	.refptr.STRING_KEYWORD
	.linkonce	discard
.refptr.STRING_KEYWORD:
	.quad	STRING_KEYWORD
	.section	.rdata$.refptr.name_float, "dr"
	.globl	.refptr.name_float
	.linkonce	discard
.refptr.name_float:
	.quad	name_float
	.section	.rdata$.refptr.FLOAT_KEYWORD, "dr"
	.globl	.refptr.FLOAT_KEYWORD
	.linkonce	discard
.refptr.FLOAT_KEYWORD:
	.quad	FLOAT_KEYWORD
	.section	.rdata$.refptr.name_int, "dr"
	.globl	.refptr.name_int
	.linkonce	discard
.refptr.name_int:
	.quad	name_int
	.section	.rdata$.refptr.INT_KEYWORD, "dr"
	.globl	.refptr.INT_KEYWORD
	.linkonce	discard
.refptr.INT_KEYWORD:
	.quad	INT_KEYWORD
	.section	.rdata$.refptr.name_void, "dr"
	.globl	.refptr.name_void
	.linkonce	discard
.refptr.name_void:
	.quad	name_void
	.section	.rdata$.refptr.VOID_KEYWORD, "dr"
	.globl	.refptr.VOID_KEYWORD
	.linkonce	discard
.refptr.VOID_KEYWORD:
	.quad	VOID_KEYWORD
	.section	.rdata$.refptr.builtin_scope, "dr"
	.globl	.refptr.builtin_scope
	.linkonce	discard
.refptr.builtin_scope:
	.quad	builtin_scope
	.section	.rdata$.refptr.CONTINUE_KEYWORD, "dr"
	.globl	.refptr.CONTINUE_KEYWORD
	.linkonce	discard
.refptr.CONTINUE_KEYWORD:
	.quad	CONTINUE_KEYWORD
	.section	.rdata$.refptr.BREAK_KEYWORD, "dr"
	.globl	.refptr.BREAK_KEYWORD
	.linkonce	discard
.refptr.BREAK_KEYWORD:
	.quad	BREAK_KEYWORD
	.section	.rdata$.refptr.RETURN_KEYWORD, "dr"
	.globl	.refptr.RETURN_KEYWORD
	.linkonce	discard
.refptr.RETURN_KEYWORD:
	.quad	RETURN_KEYWORD
	.section	.rdata$.refptr.VAR_KEYWORD, "dr"
	.globl	.refptr.VAR_KEYWORD
	.linkonce	discard
.refptr.VAR_KEYWORD:
	.quad	VAR_KEYWORD
	.section	.rdata$.refptr.WHILE_KEYWORD, "dr"
	.globl	.refptr.WHILE_KEYWORD
	.linkonce	discard
.refptr.WHILE_KEYWORD:
	.quad	WHILE_KEYWORD
	.section	.rdata$.refptr.SEMICOLON_SYMBOL, "dr"
	.globl	.refptr.SEMICOLON_SYMBOL
	.linkonce	discard
.refptr.SEMICOLON_SYMBOL:
	.quad	SEMICOLON_SYMBOL
	.section	.rdata$.refptr.FOR_KEYWORD, "dr"
	.globl	.refptr.FOR_KEYWORD
	.linkonce	discard
.refptr.FOR_KEYWORD:
	.quad	FOR_KEYWORD
	.section	.rdata$.refptr.ELSE_KEYWORD, "dr"
	.globl	.refptr.ELSE_KEYWORD
	.linkonce	discard
.refptr.ELSE_KEYWORD:
	.quad	ELSE_KEYWORD
	.section	.rdata$.refptr.ELIF_KEYWORD, "dr"
	.globl	.refptr.ELIF_KEYWORD
	.linkonce	discard
.refptr.ELIF_KEYWORD:
	.quad	ELIF_KEYWORD
	.section	.rdata$.refptr.R_BRACE_SYMBOL, "dr"
	.globl	.refptr.R_BRACE_SYMBOL
	.linkonce	discard
.refptr.R_BRACE_SYMBOL:
	.quad	R_BRACE_SYMBOL
	.section	.rdata$.refptr.L_BRACE_SYMBOL, "dr"
	.globl	.refptr.L_BRACE_SYMBOL
	.linkonce	discard
.refptr.L_BRACE_SYMBOL:
	.quad	L_BRACE_SYMBOL
	.section	.rdata$.refptr.IF_KEYWORD, "dr"
	.globl	.refptr.IF_KEYWORD
	.linkonce	discard
.refptr.IF_KEYWORD:
	.quad	IF_KEYWORD
	.section	.rdata$.refptr.DOT_SYMBOL, "dr"
	.globl	.refptr.DOT_SYMBOL
	.linkonce	discard
.refptr.DOT_SYMBOL:
	.quad	DOT_SYMBOL
	.section	.rdata$.refptr.R_BRACKET_SYMBOL, "dr"
	.globl	.refptr.R_BRACKET_SYMBOL
	.linkonce	discard
.refptr.R_BRACKET_SYMBOL:
	.quad	R_BRACKET_SYMBOL
	.section	.rdata$.refptr.L_BRACKET_SYMBOL, "dr"
	.globl	.refptr.L_BRACKET_SYMBOL
	.linkonce	discard
.refptr.L_BRACKET_SYMBOL:
	.quad	L_BRACKET_SYMBOL
	.section	.rdata$.refptr.COMMA_SYMBOL, "dr"
	.globl	.refptr.COMMA_SYMBOL
	.linkonce	discard
.refptr.COMMA_SYMBOL:
	.quad	COMMA_SYMBOL
	.section	.rdata$.refptr.SELF_KEYWORD, "dr"
	.globl	.refptr.SELF_KEYWORD
	.linkonce	discard
.refptr.SELF_KEYWORD:
	.quad	SELF_KEYWORD
	.section	.rdata$.refptr.SUB_SYMBOL, "dr"
	.globl	.refptr.SUB_SYMBOL
	.linkonce	discard
.refptr.SUB_SYMBOL:
	.quad	SUB_SYMBOL
	.section	.rdata$.refptr.NOT_SYMBOL, "dr"
	.globl	.refptr.NOT_SYMBOL
	.linkonce	discard
.refptr.NOT_SYMBOL:
	.quad	NOT_SYMBOL
	.section	.rdata$.refptr.R_PAREN_SYMBOL, "dr"
	.globl	.refptr.R_PAREN_SYMBOL
	.linkonce	discard
.refptr.R_PAREN_SYMBOL:
	.quad	R_PAREN_SYMBOL
	.section	.rdata$.refptr.L_PAREN_SYMBOL, "dr"
	.globl	.refptr.L_PAREN_SYMBOL
	.linkonce	discard
.refptr.L_PAREN_SYMBOL:
	.quad	L_PAREN_SYMBOL
	.section	.rdata$.refptr.FALSE_KEYWORD, "dr"
	.globl	.refptr.FALSE_KEYWORD
	.linkonce	discard
.refptr.FALSE_KEYWORD:
	.quad	FALSE_KEYWORD
	.section	.rdata$.refptr.TRUE_KEYWORD, "dr"
	.globl	.refptr.TRUE_KEYWORD
	.linkonce	discard
.refptr.TRUE_KEYWORD:
	.quad	TRUE_KEYWORD
	.section	.rdata$.refptr.ASSIGN_SYMBOL, "dr"
	.globl	.refptr.ASSIGN_SYMBOL
	.linkonce	discard
.refptr.ASSIGN_SYMBOL:
	.quad	ASSIGN_SYMBOL
