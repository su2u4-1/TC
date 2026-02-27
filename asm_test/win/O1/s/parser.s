	.file	"D:\\TC\\src\\parser.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Failed to parse right operand\0"
	.text
	.def	parse_expr_prec;	.scl	3;	.type	32;	.endef
parse_expr_prec:
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
	movq	%rdx, %r13
	movl	%r8d, %r15d
	movq	%r9, %r14
	movl	$1, %edx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	je	.L7
	movq	%r13, %rsi
	jmp	.L2
.L15:
	movq	%rbx, %rdx
	leaq	.LC0(%rip), %rcx
	call	parser_error
	jmp	.L1
.L13:
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
	jne	.L13
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
	jne	.L14
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
	je	.L15
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
.L14:
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
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "Failed to parse expression primary\0"
	.text
	.def	parse_expression;	.scl	3;	.type	32;	.endef
parse_expression:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	movq	%r8, %rbp
	call	parse_primary
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L20
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
.L16:
	movq	%rbx, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L20:
	movq	%rsi, %rcx
	call	peek_current_token
	movq	%rax, %rdx
	leaq	.LC1(%rip), %rcx
	call	parser_error
	jmp	.L16
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
parse_variable:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$48, %rsp
	movq	%rcx, %rsi
	movq	%rdx, %rbp
	movq	%r8, %r12
	call	peek_current_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L22
	cmpl	$6, %eax
	jne	.L23
	movq	(%rbx), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L23
.L22:
	movq	(%rbx), %rdx
	movq	%rbp, %rcx
	call	search
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L25
	testl	$-5, 24(%rax)
	jne	.L32
.L26:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	cmpl	$1, 24(%rax)
	jne	.L33
.L27:
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
	je	.L34
.L28:
	movq	%r13, %r8
	movq	%rbx, %rdx
	movq	%rdi, %rcx
	call	create_variable
.L21:
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L23:
	movq	%rbx, %rdx
	leaq	.LC2(%rip), %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L21
.L32:
	movq	%rbx, %rdx
	leaq	.LC3(%rip), %rcx
	call	parser_error
	jmp	.L26
.L25:
	movq	%rbx, %rdx
	leaq	.LC4(%rip), %rcx
	call	parser_error
	jmp	.L26
.L33:
	movq	%rax, %rdx
	leaq	.LC5(%rip), %rcx
	call	parser_error
	jmp	.L27
.L34:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx
	movq	(%rdx), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	je	.L28
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
	jne	.L28
	movq	%r14, %rdx
	leaq	.LC6(%rip), %rcx
	call	parser_error
	jmp	.L28
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
parse_primary:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$72, %rsp
	movq	%rcx, %rsi
	movq	%rdx, %r14
	movq	%r8, 160(%rsp)
	call	peek_current_token
	movq	%rax, %rdi
	movl	24(%rax), %eax
	cmpl	$2, %eax
	je	.L88
	cmpl	$3, %eax
	je	.L89
	cmpl	$4, %eax
	je	.L90
	cmpl	$6, %eax
	je	.L91
.L40:
	cmpl	$5, 24(%rdi)
	je	.L92
.L48:
	movl	24(%rdi), %eax
	cmpl	$1, %eax
	je	.L49
	cmpl	$6, %eax
	jne	.L50
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L50
	movq	160(%rsp), %rax
	cmpb	$0, 1(%rax)
	je	.L50
.L49:
	movq	%rsi, %rcx
	call	peek_current_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L51
	cmpl	$6, %eax
	jne	.L52
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L52
.L51:
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
	jne	.L54
	movl	$0, %r12d
	movl	$0, %ebx
	movq	%rbp, 56(%rsp)
	jmp	.L76
.L88:
	movq	(%rdi), %rdx
	movl	$0, %ebp
	movl	$0, %esi
	movl	$0, %ebx
	movl	$0, %edi
.L37:
	movq	%rbp, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbx, %r8
	movl	%edi, %ecx
	call	create_primary
	movq	%rax, %rbx
.L35:
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
.L89:
	movq	(%rdi), %rdx
	movl	$0, %ebp
	movl	$0, %esi
	movl	$0, %ebx
	movl	$1, %edi
	jmp	.L37
.L90:
	movq	(%rdi), %rdx
	movl	$0, %ebp
	movl	$0, %esi
	movl	$0, %ebx
	movl	$2, %edi
	jmp	.L37
.L91:
	movq	.refptr.TRUE_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L41
	movq	(%rdi), %rdx
	movl	$0, %ebp
	movl	$0, %esi
	movl	$0, %ebx
	movl	$3, %edi
	jmp	.L37
.L41:
	cmpl	$6, 24(%rdi)
	jne	.L40
	movq	.refptr.FALSE_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L40
	movq	(%rdi), %rdx
	movl	$0, %ebp
	movl	$0, %esi
	movl	$0, %ebx
	movl	$4, %edi
	jmp	.L37
.L92:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L93
	cmpl	$5, 24(%rdi)
	jne	.L48
	movq	.refptr.NOT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L94
	cmpl	$5, 24(%rdi)
	jne	.L48
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L48
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
	je	.L95
	movl	$0, %ebp
	movl	$0, %ebx
	movl	$0, %edx
	movl	$7, %edi
	jmp	.L37
.L93:
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
	je	.L96
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %rsi
	movl	24(%rax), %edi
	cmpl	$5, %edi
	jne	.L46
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L46
	movl	$0, %ebp
	movl	$0, %esi
	movl	$0, %edx
	jmp	.L37
.L96:
	movq	%rdi, %rdx
	leaq	.LC7(%rip), %rcx
	call	parser_error
	jmp	.L35
.L46:
	movq	%rsi, %rdx
	leaq	.LC8(%rip), %rcx
	call	parser_error
	movl	$0, %ebx
	jmp	.L35
.L94:
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
	je	.L97
	movl	$0, %ebp
	movl	$0, %ebx
	movl	$0, %edx
	movl	$6, %edi
	jmp	.L37
.L97:
	movq	%rbx, %rdx
	leaq	.LC9(%rip), %rcx
	call	parser_error
	movq	%rsi, %rbx
	jmp	.L35
.L95:
	movq	%rbx, %rdx
	leaq	.LC10(%rip), %rcx
	call	parser_error
	movq	%rsi, %rbx
	jmp	.L35
.L52:
	movq	%rbx, %rdx
	leaq	.LC11(%rip), %rcx
	call	parser_error
	jmp	.L77
.L84:
	movq	16(%r15), %r12
.L55:
	testq	%rbx, %rbx
	jne	.L58
	testq	%r12, %r12
	je	.L58
	cmpl	$4, 24(%r12)
	je	.L98
.L58:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L99
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	je	.L69
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
	je	.L100
.L70:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %r13
	cmpl	$5, 24(%rax)
	jne	.L71
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	je	.L71
	movq	$0, 32(%rsp)
	movq	%rbp, %r9
	movl	$0, %r8d
	movq	56(%rsp), %rdx
	movl	$3, %ecx
	call	create_variable_access
	movq	%rax, 56(%rsp)
.L68:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	peek_next_token
	movq	%rax, %r13
	cmpl	$5, 24(%rax)
	jne	.L101
.L76:
	testq	%r15, %r15
	je	.L55
	movl	24(%r15), %eax
	leal	-1(%rax), %edx
	cmpl	$2, %edx
	jbe	.L84
	cmpl	$5, %eax
	je	.L84
	testl	$-5, %eax
	cmove	%r15, %r12
	jmp	.L55
.L98:
	movq	16(%r12), %rbx
	jmp	.L58
.L99:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	testq	%r15, %r15
	je	.L102
.L60:
	movl	24(%r15), %eax
	subl	$2, %eax
	cmpl	$1, %eax
	ja	.L103
.L61:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	call	create_list
	movq	%rax, %r12
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r13
	jmp	.L62
.L102:
	movq	%rax, %rdx
	leaq	.LC12(%rip), %rcx
	call	parser_error
	jmp	.L60
.L103:
	movq	%rbx, %rdx
	leaq	.LC13(%rip), %rcx
	call	parser_error
	jmp	.L61
.L106:
	movq	%rbx, %rdx
	leaq	.LC14(%rip), %rcx
	call	parser_error
	jmp	.L63
.L107:
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L104
	cmpl	$5, 24(%rbx)
	jne	.L64
	movq	0(%r13), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L64
.L62:
	cmpl	$5, 24(%rbx)
	je	.L105
.L67:
	movq	160(%rsp), %r8
	movq	%r14, %rdx
	movq	%rsi, %rcx
	call	parse_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L106
.L63:
	movq	%rbp, %rdx
	movq	%r12, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	je	.L107
.L64:
	movq	%rbx, %rdx
	leaq	.LC15(%rip), %rcx
	call	parser_error
.L77:
	movq	%rdi, %rdx
	leaq	.LC21(%rip), %rcx
	call	parser_error
	movl	$0, %ebx
	jmp	.L35
.L104:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L62
.L105:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L67
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
	jmp	.L68
.L100:
	movq	%r13, %rdx
	leaq	.LC16(%rip), %rcx
	call	parser_error
	jmp	.L70
.L71:
	movq	%r13, %rdx
	leaq	.LC17(%rip), %rcx
	call	parser_error
	jmp	.L77
.L69:
	movq	.refptr.DOT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	je	.L86
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %r12
	testq	%rbx, %rbx
	je	.L108
	cmpl	$1, 24(%rax)
	jne	.L109
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	search
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L110
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %r8
	movq	56(%rsp), %rdx
	movl	$2, %ecx
	call	create_variable_access
	movq	%rax, 56(%rsp)
	movl	$0, %ebx
	movl	$0, %r12d
	jmp	.L68
.L108:
	movq	%rax, %rdx
	leaq	.LC18(%rip), %rcx
	call	parser_error
	jmp	.L77
.L109:
	movq	%rax, %rdx
	leaq	.LC19(%rip), %rcx
	call	parser_error
	jmp	.L77
.L110:
	movq	%r12, %rdx
	leaq	.LC20(%rip), %rcx
	call	parser_error
	jmp	.L77
.L101:
	movq	56(%rsp), %rbp
.L54:
	testq	%rbp, %rbp
	je	.L77
	movl	$0, %esi
	movl	$0, %ebx
	movl	$0, %edx
	movl	$8, %edi
	jmp	.L37
.L86:
	movq	56(%rsp), %rbp
	jmp	.L54
.L50:
	movq	%rdi, %rdx
	leaq	.LC22(%rip), %rcx
	call	parser_error
	movl	$0, %ebx
	jmp	.L35
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
parse_statement:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$104, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%r8, %rdi
	call	peek_current_token
	cmpl	$6, 24(%rax)
	je	.L195
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
.L181:
	movq	%rbx, %rcx
	call	peek_current_token
	testq	%rsi, %rsi
	je	.L196
.L187:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	je	.L197
.L188:
	movq	%rbx, %rdx
	leaq	.LC52(%rip), %rcx
	call	parser_error
.L111:
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
.L195:
	movq	%rax, %rsi
	movq	.refptr.IF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L198
	movq	.refptr.FOR_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L199
	movq	.refptr.WHILE_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L200
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L180
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
	jmp	.L181
.L198:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L114
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L114
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
	je	.L201
.L117:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L118
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L118
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L120
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L120
	call	create_list
	movq	%rax, %r15
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r13
	leaq	.LC27(%rip), %r14
	jmp	.L122
.L114:
	movq	%rsi, %rdx
	leaq	.LC23(%rip), %rcx
	call	parser_error
	movl	$0, %edx
.L116:
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$2, %ecx
	call	create_statement
	movq	%rax, %rsi
	jmp	.L111
.L201:
	movq	%rsi, %rdx
	leaq	.LC24(%rip), %rcx
	call	parser_error
	jmp	.L117
.L118:
	movq	%rsi, %rdx
	leaq	.LC25(%rip), %rcx
	call	parser_error
	movl	$0, %edx
	jmp	.L116
.L120:
	movq	%rsi, %rdx
	leaq	.LC26(%rip), %rcx
	call	parser_error
	movl	$0, %edx
	jmp	.L116
.L124:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L202
.L123:
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
.L122:
	cmpl	$5, 24(%r12)
	jne	.L124
	movq	0(%r13), %rdx
	movq	(%r12), %rcx
	call	string_equal
	testb	%al, %al
	je	.L124
	call	create_list
	movq	%rax, 64(%rsp)
	call	create_list
	movq	%rax, 80(%rsp)
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	movq	%rax, %rsi
	cmpl	$6, 24(%rax)
	jne	.L126
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14
	movq	%r15, 88(%rsp)
	jmp	.L125
.L202:
	movq	%r12, %rdx
	movq	%r14, %rcx
	call	parser_error
	jmp	.L123
.L127:
	movq	%rsi, %rdx
	leaq	.LC28(%rip), %rcx
	call	parser_error
	movl	$0, %edx
	jmp	.L116
.L205:
	movq	%rsi, %rdx
	leaq	.LC29(%rip), %rcx
	call	parser_error
	jmp	.L129
.L130:
	movq	%rsi, %rdx
	leaq	.LC30(%rip), %rcx
	call	parser_error
	movl	$0, %edx
	jmp	.L116
.L132:
	movq	%rsi, %rdx
	leaq	.LC31(%rip), %rcx
	call	parser_error
	movl	$0, %edx
	jmp	.L116
.L136:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L203
.L135:
	movq	%r12, %rdx
	movq	%r13, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
.L134:
	cmpl	$5, 24(%rsi)
	jne	.L136
	movq	(%r14), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L136
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
	jne	.L193
.L125:
	movq	.refptr.ELIF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L204
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L127
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L127
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
	je	.L205
.L129:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L130
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L130
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L132
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L132
	call	create_list
	movq	%rax, %r13
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	leaq	.LC32(%rip), %r15
	jmp	.L134
.L203:
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	parser_error
	jmp	.L135
.L204:
	movq	88(%rsp), %r15
	cmpl	$6, 24(%rsi)
	jne	.L126
	movq	.refptr.ELSE_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L126
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L138
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L138
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14
	leaq	.LC34(%rip), %r13
	jmp	.L140
.L138:
	movq	%rsi, %rdx
	leaq	.LC33(%rip), %rcx
	call	parser_error
	movl	$0, %edx
	jmp	.L116
.L142:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L206
.L141:
	movq	%r12, %rdx
	movq	80(%rsp), %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
.L140:
	cmpl	$5, 24(%rsi)
	jne	.L142
	movq	(%r14), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L142
	jmp	.L126
.L206:
	movq	%rsi, %rdx
	movq	%r13, %rcx
	call	parser_error
	jmp	.L141
.L193:
	movq	88(%rsp), %r15
.L126:
	movq	%rbx, %rcx
	call	peek_current_token
	movq	80(%rsp), %r9
	movq	64(%rsp), %r8
	movq	%r15, %rdx
	movq	72(%rsp), %rcx
	call	create_if
	movq	%rax, %rdx
	jmp	.L116
.L199:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L145
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L145
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	je	.L207
.L148:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_variable
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L208
.L150:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
.L149:
	cmpl	$5, 24(%rsi)
	jne	.L151
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L151
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
	cmpl	$5, 24(%rax)
	je	.L209
.L153:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L210
.L155:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
.L154:
	cmpl	$5, 24(%r12)
	jne	.L156
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%r12), %rcx
	call	string_equal
	testb	%al, %al
	je	.L156
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
	cmpl	$5, 24(%rax)
	je	.L211
.L158:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, 56(%rsp)
	testq	%rax, %rax
	je	.L212
.L160:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
.L159:
	cmpl	$5, 24(%r12)
	jne	.L161
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%r12), %rcx
	call	string_equal
	testb	%al, %al
	je	.L161
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
	cmpl	$5, 24(%rax)
	jne	.L163
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%r12), %rcx
	call	string_equal
	testb	%al, %al
	je	.L163
	call	create_list
	movq	%rax, %r14
	movb	$1, 2(%rdi)
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r15
	movq	%r13, 64(%rsp)
	jmp	.L165
.L145:
	movq	%rsi, %rdx
	leaq	.LC35(%rip), %rcx
	call	parser_error
	movl	$0, %r9d
.L147:
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r8d
	movl	$0, %edx
	movl	$4, %ecx
	call	create_statement
	movq	%rax, %rsi
	jmp	.L111
.L207:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	movl	$0, %r13d
	testb	%al, %al
	jne	.L149
	jmp	.L148
.L208:
	movq	%rsi, %rdx
	leaq	.LC36(%rip), %rcx
	call	parser_error
	jmp	.L150
.L151:
	movq	%rsi, %rdx
	leaq	.LC37(%rip), %rcx
	call	parser_error
	movl	$0, %r9d
	jmp	.L147
.L209:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%r12), %rcx
	call	string_equal
	movl	$0, %esi
	testb	%al, %al
	jne	.L154
	jmp	.L153
.L210:
	movq	%r12, %rdx
	leaq	.LC38(%rip), %rcx
	call	parser_error
	jmp	.L155
.L156:
	movq	%r12, %rdx
	leaq	.LC39(%rip), %rcx
	call	parser_error
	movl	$0, %r9d
	jmp	.L147
.L211:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%r12), %rcx
	call	string_equal
	movq	$0, 56(%rsp)
	testb	%al, %al
	jne	.L159
	jmp	.L158
.L212:
	movq	%r12, %rdx
	leaq	.LC40(%rip), %rcx
	call	parser_error
	jmp	.L160
.L161:
	movq	%r12, %rdx
	leaq	.LC41(%rip), %rcx
	call	parser_error
	movl	$0, %r9d
	jmp	.L147
.L163:
	movq	%r12, %rdx
	leaq	.LC42(%rip), %rcx
	call	parser_error
	movl	$0, %r9d
	jmp	.L147
.L167:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L213
.L166:
	movq	%r13, %rdx
	movq	%r14, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
.L165:
	cmpl	$5, 24(%r12)
	jne	.L167
	movq	(%r15), %rdx
	movq	(%r12), %rcx
	call	string_equal
	testb	%al, %al
	je	.L167
	movq	64(%rsp), %r13
	movb	$0, 2(%rdi)
	movq	%r14, %r9
	movq	56(%rsp), %r8
	movq	%rsi, %rdx
	movq	%r13, %rcx
	call	create_for
	movq	%rax, %r9
	jmp	.L147
.L213:
	movq	%r12, %rdx
	leaq	.LC43(%rip), %rcx
	call	parser_error
	jmp	.L166
.L200:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L169
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L169
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
	je	.L214
.L172:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L173
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L173
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L175
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L175
	call	create_list
	movq	%rax, %r13
	movb	$1, 2(%rdi)
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r15
	jmp	.L177
.L169:
	movq	%rsi, %rdx
	leaq	.LC44(%rip), %rcx
	call	parser_error
	movl	$0, %r8d
.L171:
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %edx
	movl	$3, %ecx
	call	create_statement
	movq	%rax, %rsi
	jmp	.L111
.L214:
	movq	%rsi, %rdx
	leaq	.LC45(%rip), %rcx
	call	parser_error
	jmp	.L172
.L173:
	movq	%rsi, %rdx
	leaq	.LC46(%rip), %rcx
	call	parser_error
	movl	$0, %r8d
	jmp	.L171
.L175:
	movq	%rsi, %rdx
	leaq	.LC47(%rip), %rcx
	call	parser_error
	movl	$0, %r8d
	jmp	.L171
.L179:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L215
.L178:
	movq	%rsi, %rdx
	movq	%r13, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
.L177:
	cmpl	$5, 24(%r12)
	jne	.L179
	movq	(%r15), %rdx
	movq	(%r12), %rcx
	call	string_equal
	testb	%al, %al
	je	.L179
	movb	$0, 2(%rdi)
	movq	%r13, %rdx
	movq	%r14, %rcx
	call	create_while
	movq	%rax, %r8
	jmp	.L171
.L215:
	movq	%r12, %rdx
	leaq	.LC48(%rip), %rcx
	call	parser_error
	jmp	.L178
.L180:
	movq	.refptr.RETURN_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L182
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
	jmp	.L181
.L182:
	movq	.refptr.BREAK_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L183
	cmpb	$0, 2(%rdi)
	je	.L216
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$6, %ecx
	call	create_statement
	movq	%rax, %rsi
	jmp	.L181
.L216:
	movq	%rsi, %rdx
	leaq	.LC49(%rip), %rcx
	call	parser_error
	movl	$0, %esi
	jmp	.L111
.L183:
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L185
	cmpb	$0, 2(%rdi)
	je	.L217
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$7, %ecx
	call	create_statement
	movq	%rax, %rsi
	jmp	.L181
.L217:
	movq	%rsi, %rdx
	leaq	.LC50(%rip), %rcx
	call	parser_error
	movl	$0, %esi
	jmp	.L111
.L185:
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
	jmp	.L181
.L196:
	movq	%rax, %rdx
	leaq	.LC51(%rip), %rcx
	call	parser_error
	jmp	.L187
.L197:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L111
	jmp	.L188
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
parse_code:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$152, %rsp
	movq	%rcx, %r15
	movq	%rdx, %rbx
	movq	%r8, 240(%rsp)
	movq	.refptr.builtin_scope(%rip), %rax
	cmpq	$0, (%rax)
	je	.L314
.L219:
	testq	%rbx, %rbx
	je	.L315
.L220:
	call	create_list
	movq	%rax, 56(%rsp)
	movq	%rbx, %rcx
	call	create_scope
	movq	%rax, 48(%rsp)
	movl	$1, %edx
	movq	%r15, %rcx
	call	get_next_token
	testq	%rax, %rax
	je	.L222
	movq	%rax, %r12
	movq	%r15, %rbp
	jmp	.L221
.L314:
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
	jmp	.L219
.L315:
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %rbx
	jmp	.L220
.L332:
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%r12), %rcx
	call	string_equal
	movl	%eax, %esi
	testb	%al, %al
	jne	.L316
	cmpl	$6, 24(%r12)
	jne	.L259
	movq	.refptr.FUNC_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%r12), %rcx
	call	string_equal
	movb	%al, 95(%rsp)
	testb	%al, %al
	jne	.L317
	cmpl	$6, 24(%r12)
	jne	.L259
	movq	.refptr.CLASS_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%r12), %rcx
	call	string_equal
	testb	%al, %al
	je	.L259
	movq	48(%rsp), %rcx
	call	create_scope
	movq	%rax, 64(%rsp)
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	cmpl	$1, 24(%rax)
	jne	.L318
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
	jne	.L262
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L262
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
	jmp	.L264
.L316:
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	cmpl	$1, 24(%rax)
	jne	.L319
	movq	(%rax), %rdi
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rbx
	movl	$0, %esi
	cmpl	$6, 24(%rax)
	je	.L320
.L227:
	cmpl	$5, 24(%rbx)
	jne	.L229
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L229
	movq	48(%rsp), %r8
	movq	%rsi, %rdx
	movq	%rdi, %rcx
	call	parse_import_file
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L321
.L231:
	movq	%rsi, %rdx
	call	create_import
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L301
.L232:
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	call	create_code_member
	movq	%rax, %rdx
	movq	56(%rsp), %rcx
	call	list_append
	jmp	.L233
.L319:
	movq	%rax, %rdx
	leaq	.LC53(%rip), %rcx
	call	parser_error
	jmp	.L301
.L320:
	movq	.refptr.FROM_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L227
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	cmpl	$4, 24(%rax)
	jne	.L322
	movq	(%rax), %rsi
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L227
.L322:
	movq	%rax, %rdx
	leaq	.LC54(%rip), %rcx
	call	parser_error
	jmp	.L301
.L229:
	movq	%rbx, %rdx
	leaq	.LC55(%rip), %rcx
	call	parser_error
.L301:
	movq	%r12, %rdx
	leaq	.LC56(%rip), %rcx
	call	parser_error
	movl	$0, %edx
	jmp	.L232
.L321:
	movq	.refptr.name_void(%rip), %rax
	movq	(%rax), %r8
	movq	48(%rsp), %rax
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$1, %edx
	movq	%rdi, %rcx
	call	create_name
	movq	%rax, %rcx
	jmp	.L231
.L317:
	movq	48(%rsp), %rcx
	call	create_scope
	movq	%rax, %rdi
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L235
	cmpl	$6, %eax
	jne	.L236
	movq	(%rbx), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L236
.L235:
	movq	(%rbx), %rdx
	movq	48(%rsp), %rcx
	call	search
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L323
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	cmpl	$1, 24(%rax)
	jne	.L324
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
	jne	.L240
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L240
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rbx
	call	create_list
	movq	%rax, 64(%rsp)
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r14
	movq	%r14, %r13
	jmp	.L242
.L236:
	movq	%rbx, %rdx
	leaq	.LC57(%rip), %rcx
	call	parser_error
.L302:
	movq	%r12, %rdx
	leaq	.LC68(%rip), %rcx
	call	parser_error
	movl	$0, %r8d
	jmp	.L258
.L323:
	movq	%rbx, %rdx
	leaq	.LC58(%rip), %rcx
	call	parser_error
	jmp	.L302
.L324:
	movq	%rax, %rdx
	leaq	.LC59(%rip), %rcx
	call	parser_error
	jmp	.L302
.L240:
	movq	%rbx, %rdx
	leaq	.LC60(%rip), %rcx
	call	parser_error
	jmp	.L302
.L327:
	movq	%rbx, %rdx
	leaq	.LC61(%rip), %rcx
	call	parser_error
	jmp	.L244
.L245:
	movq	%rax, %rdx
	movq	64(%rsp), %rcx
	call	list_append
	jmp	.L244
.L328:
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L325
	cmpl	$5, 24(%rbx)
	jne	.L246
	movq	0(%r13), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L246
.L242:
	cmpl	$5, 24(%rbx)
	je	.L326
.L249:
	movq	240(%rsp), %r8
	movq	%rdi, %rdx
	movq	%rbp, %rcx
	call	parse_variable
	testq	%rax, %rax
	je	.L327
	cmpq	$0, 16(%rax)
	je	.L245
	movq	%rbx, %rdx
	leaq	.LC62(%rip), %rcx
	call	parser_error
.L244:
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	je	.L328
.L246:
	movq	%rbx, %rdx
	leaq	.LC63(%rip), %rcx
	call	parser_error
	jmp	.L302
.L325:
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L242
.L326:
	movq	(%r14), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L249
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	jne	.L250
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L250
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
	jmp	.L252
.L250:
	movq	%rbx, %rdx
	leaq	.LC64(%rip), %rcx
	call	parser_error
	jmp	.L302
.L256:
	movq	%r12, %r8
	movq	%rdi, %rdx
	movq	%rbp, %rcx
	call	parse_statement
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L329
	testb	%sil, %sil
	jne	.L330
.L254:
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
.L252:
	cmpl	$5, 24(%r13)
	jne	.L256
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	je	.L256
	movq	80(%rsp), %r12
	movq	240(%rsp), %rax
	movb	$0, (%rax)
	testb	%sil, %sil
	jne	.L257
	movq	.refptr.name_void(%rip), %rax
	cmpq	(%rax), %r15
	je	.L257
	movq	%r13, %rdx
	leaq	.LC67(%rip), %rcx
	call	parser_error
.L257:
	movq	%rdi, 32(%rsp)
	movq	%r14, %r9
	movq	64(%rsp), %r8
	movq	%r15, %rdx
	movq	72(%rsp), %rcx
	call	create_function
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L302
.L258:
	movl	$0, %r9d
	movl	$0, %edx
	movl	$1, %ecx
	call	create_code_member
	movq	%rax, %rdx
	movq	56(%rsp), %rcx
	call	list_append
	jmp	.L233
.L329:
	movq	%r13, %rdx
	leaq	.LC65(%rip), %rcx
	call	parser_error
	jmp	.L254
.L330:
	movq	%r13, %rdx
	leaq	.LC66(%rip), %rcx
	call	parser_error
	jmp	.L254
.L318:
	movq	%rax, %rdx
	leaq	.LC69(%rip), %rcx
	call	parser_error
	jmp	.L303
.L262:
	movq	%rbx, %rdx
	leaq	.LC70(%rip), %rcx
	call	parser_error
.L303:
	movq	%r12, %rdx
	leaq	.LC86(%rip), %rcx
	call	parser_error
	movl	$0, %r9d
	jmp	.L299
.L298:
	cmpl	$6, 24(%rbx)
	je	.L331
.L265:
	movq	%rbx, %rdx
	leaq	.LC85(%rip), %rcx
	call	parser_error
.L295:
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rbx
.L264:
	cmpl	$5, 24(%rbx)
	jne	.L298
	movq	0(%r13), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L298
	movq	112(%rsp), %r12
	movq	64(%rsp), %r8
	movq	72(%rsp), %rdx
	movq	80(%rsp), %rcx
	call	create_class
	movq	%rax, %r9
	testq	%rax, %rax
	je	.L303
.L299:
	movl	$0, %r8d
	movl	$0, %edx
	movl	$2, %ecx
	call	create_code_member
	movq	%rax, %rdx
	movq	56(%rsp), %rcx
	call	list_append
.L233:
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L222
.L221:
	movl	24(%r12), %eax
	testl	%eax, %eax
	je	.L222
	cmpl	$6, %eax
	je	.L332
.L259:
	movq	%r12, %rdx
	leaq	.LC87(%rip), %rcx
	call	parser_error
	jmp	.L233
.L331:
	movq	(%r15), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L333
	cmpl	$6, 24(%rbx)
	jne	.L265
	movq	(%r14), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L265
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
	je	.L334
.L296:
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
	je	.L335
.L297:
	movq	%rbx, %rdx
	leaq	.LC84(%rip), %rcx
	call	parser_error
	jmp	.L295
.L333:
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
	je	.L267
	cmpl	$6, %eax
	jne	.L268
	movq	(%rsi), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L268
.L267:
	movq	(%rsi), %rdx
	movq	64(%rsp), %rcx
	call	search
	movq	%rax, 104(%rsp)
	testq	%rax, %rax
	je	.L336
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	cmpl	$1, 24(%rax)
	jne	.L337
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
	jne	.L272
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L272
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$6, 24(%rax)
	je	.L338
.L274:
	movq	%rsi, %rdx
	leaq	.LC75(%rip), %rcx
	call	parser_error
.L275:
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
	jmp	.L276
.L268:
	movq	%rsi, %rdx
	leaq	.LC71(%rip), %rcx
	call	parser_error
.L304:
	movq	%rbx, %rdx
	leaq	.LC82(%rip), %rcx
	call	parser_error
	movl	$0, %edx
	jmp	.L294
.L336:
	movq	%rsi, %rdx
	leaq	.LC72(%rip), %rcx
	call	parser_error
	jmp	.L304
.L337:
	movq	%rax, %rdx
	leaq	.LC73(%rip), %rcx
	call	parser_error
	jmp	.L304
.L272:
	movq	%rsi, %rdx
	leaq	.LC74(%rip), %rcx
	call	parser_error
	jmp	.L304
.L338:
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L275
	jmp	.L274
.L278:
	cmpl	$5, 24(%rsi)
	jne	.L281
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L281
.L282:
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L286
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L286
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
	jmp	.L288
.L339:
	movq	%rsi, %rdx
	leaq	.LC77(%rip), %rcx
	call	parser_error
	jmp	.L283
.L284:
	movq	%rax, %rdx
	movq	120(%rsp), %rcx
	call	list_append
	jmp	.L283
.L340:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L282
	cmpl	$5, 24(%rsi)
	jne	.L281
	movq	(%rdi), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L278
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rsi
	movq	240(%rsp), %r8
	movq	%r12, %rdx
	movq	%rbp, %rcx
	call	parse_variable
	testq	%rax, %rax
	je	.L339
	cmpq	$0, 16(%rax)
	je	.L284
	movq	%rsi, %rdx
	leaq	.LC78(%rip), %rcx
	call	parser_error
.L283:
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rsi
.L276:
	cmpl	$5, 24(%rsi)
	je	.L340
.L281:
	movq	%rsi, %rdx
	leaq	.LC76(%rip), %rcx
	call	parser_error
	jmp	.L304
.L286:
	movq	%rsi, %rdx
	leaq	.LC79(%rip), %rcx
	call	parser_error
	jmp	.L304
.L292:
	movq	240(%rsp), %r8
	movq	%r12, %rdx
	movq	%rbp, %rcx
	call	parse_statement
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L341
	testb	%dil, %dil
	jne	.L342
.L290:
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
.L288:
	cmpl	$5, 24(%rsi)
	jne	.L292
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L292
	movq	136(%rsp), %rbx
	movq	240(%rsp), %rax
	movb	$0, (%rax)
	movb	$0, 1(%rax)
	testb	%dil, %dil
	jne	.L293
	movq	.refptr.name_void(%rip), %rax
	movq	104(%rsp), %rdi
	cmpq	(%rax), %rdi
	je	.L293
	movq	%rsi, %rdx
	leaq	.LC81(%rip), %rcx
	call	parser_error
.L293:
	movq	%r12, 32(%rsp)
	movq	96(%rsp), %r9
	movq	120(%rsp), %r8
	movq	104(%rsp), %rdx
	movq	128(%rsp), %rcx
	call	create_method
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L304
.L294:
	movl	$0, %r8d
	movl	$0, %ecx
	call	create_class_member
	movq	%rax, %rdx
	movq	72(%rsp), %rcx
	call	list_append
	jmp	.L295
.L341:
	movq	%rsi, %rdx
	leaq	.LC80(%rip), %rcx
	call	parser_error
	jmp	.L290
.L342:
	movq	%rsi, %rdx
	leaq	.LC66(%rip), %rcx
	call	parser_error
	jmp	.L290
.L334:
	movq	%rsi, %rdx
	leaq	.LC83(%rip), %rcx
	call	parser_error
	jmp	.L296
.L335:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L295
	jmp	.L297
.L222:
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
