	.file	"parser.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Failed to parse right operand\0"
	.text
	.def	parse_expr_prec;	.scl	3;	.type	32;	.endef
parse_expr_prec:
	pushq	%r15
	pushq	%r14
	movl	%r8d, %r14d
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%r9, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	movl	$1, %edx
	subq	$56, %rsp
	movq	%rcx, 128(%rsp)
	movq	160(%rsp), %r15
.L20:
	call	peek_next_token
	cmpl	$5, 24(%rax)
	jne	.L14
	movq	(%rax), %rcx
	call	string_to_operator
	movl	%eax, %ecx
	movl	%eax, %edi
	call	operator_precedence
	movl	%eax, %r12d
	cmpl	$19, %edi
	je	.L14
	cmpl	%r14d, %eax
	jge	.L3
.L14:
	movq	128(%rsp), %rcx
	call	peek_current_token
	jmp	.L1
.L3:
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	128(%rsp), %rcx
	movq	%r15, %r8
	movq	%rbp, %rdx
	movq	%rax, %rsi
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	jne	.L6
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC0(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L7
.L6:
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %rsi
.L19:
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	jne	.L12
	movq	(%rax), %rcx
	call	string_to_operator
	movl	%eax, %ecx
	movl	%eax, %r13d
	call	operator_precedence
	movl	%eax, %r8d
	cmpl	$19, %r13d
	je	.L12
	cmpl	%eax, %r12d
	jl	.L9
.L12:
	movq	%rbx, %rdx
	movl	%edi, %ecx
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	call	create_expression
	movq	128(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, %rbx
	jmp	.L20
.L9:
	movq	%r15, 32(%rsp)
	movq	128(%rsp), %rcx
	movq	%rsi, %rdx
	movq	%rbp, %r9
	call	parse_expr_prec
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L19
.L7:
	xorl	%ebx, %ebx
.L1:
	addq	$56, %rsp
	movq	%rbx, %rax
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
.LC1:
	.ascii "Failed to parse expression primary\0"
	.text
	.def	parse_expression;	.scl	3;	.type	32;	.endef
parse_expression:
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rdi
	movq	%r8, %rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	subq	$72, %rsp
	call	parse_primary
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L23
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rcx
	movq	%rax, 56(%rsp)
	call	peek_current_token
	movq	56(%rsp), %r8
	leaq	.LC1(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
	jmp	.L22
.L23:
	xorl	%r9d, %r9d
	movq	%rax, %r8
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rdi, 32(%rsp)
	movq	%rbp, %r9
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movq	%rsi, %rcx
	call	parse_expr_prec
	movq	%rax, %rbx
.L22:
	addq	$72, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC2:
	.ascii "Expected variable type\0"
.LC3:
	.ascii "Expected a type for variable declaration\0"
.LC4:
	.ascii "Unknown variable type\0"
.LC5:
	.ascii "Expected variable name\0"
.LC6:
	.ascii "Failed to parse variable initializer\0"
	.text
	.def	parse_variable;	.scl	3;	.type	32;	.endef
parse_variable:
	pushq	%r13
	pushq	%r12
	movq	%rdx, %r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	movq	%r8, %rbx
	subq	$40, %rsp
	call	peek_current_token
	movq	%rax, %rdi
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L27
	cmpl	$6, %eax
	jne	.L30
	movq	(%rdi), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L30
.L27:
	movq	(%rdi), %rdx
	movq	%r12, %rcx
	call	search_name
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L31
	movl	32(%rax), %eax
	cmpl	$6, %eax
	je	.L32
	testl	%eax, %eax
	je	.L32
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC3(%rip), %rcx
	movq	%rax, %r8
	jmp	.L58
.L31:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC4(%rip), %rcx
	movq	%rax, %r8
.L58:
	call	parser_error
.L32:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rdi
	je	.L33
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC5(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L33:
	cmpb	$0, 10(%rbx)
	movl	$3, %edx
	je	.L34
	cmpb	$1, 9(%rbx)
	sbbl	%edx, %edx
	andl	$2, %edx
	addl	$3, %edx
.L34:
	movq	(%rdi), %rcx
	movq	%r12, %r9
	movq	%rbp, %r8
	call	create_symbol
	movl	$1, %edx
	movq	%rsi, %rcx
	movq	%rax, %rdi
	call	peek_next_token
	cmpl	$5, 24(%rax)
	je	.L35
.L37:
	xorl	%esi, %esi
	jmp	.L36
.L35:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx
	movq	(%rax), %rcx
	movq	(%rdx), %rdx
	call	string_equal
	testb	%al, %al
	je	.L37
	movq	%rsi, %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rsi, %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rsi, %rcx
	movq	%rbx, %r8
	movq	%r12, %rdx
	movq	%rax, %r13
	call	parse_expression
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L36
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC6(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L36:
	addq	$40, %rsp
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbp, %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	create_variable
.L30:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC2(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	addq	$40, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.section .rdata,"dr"
.LC7:
	.ascii "Failed to parse parenthesized expression\0"
.LC8:
	.ascii "Expected ')' after expression\0"
.LC9:
	.ascii "Failed to parse operand of unary '!'\0"
.LC10:
	.ascii "Failed to parse operand of unary '-'\0"
.LC11:
	.ascii "Expected variable name in variable access\0"
.LC12:
	.ascii "Cannot call undefined variable\0"
.LC13:
	.ascii "Cannot call non-function variable\0"
.LC14:
	.ascii "Failed to parse function call argument\0"
.LC15:
	.ascii "Expected ',' or ')' after function call argument\0"
.LC16:
	.ascii "Failed to parse sequence index\0"
.LC17:
	.ascii "Expected ']' after sequence index\0"
.LC18:
	.ascii "Cannot access attribute without a valid scope\0"
.LC19:
	.ascii "Expected attribute name after '.'\0"
.LC20:
	.ascii "Unknown attribute name\0"
.LC21:
	.ascii "Failed to parse variable access\0"
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
	movq	%r8, %rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	movq	%rcx, 128(%rsp)
	movq	%rdx, 136(%rsp)
	call	peek_current_token
	movq	%rax, %rbp
	movl	24(%rax), %eax
	cmpl	$2, %eax
	jne	.L60
	movq	0(%rbp), %rdx
	xorl	%esi, %esi
	xorl	%r9d, %r9d
	xorl	%ebx, %ebx
	xorl	%ebp, %ebp
	jmp	.L61
.L60:
	cmpl	$3, %eax
	jne	.L62
	movq	0(%rbp), %rdx
	xorl	%esi, %esi
	xorl	%r9d, %r9d
	xorl	%ebx, %ebx
	movl	$1, %ebp
	jmp	.L61
.L62:
	cmpl	$4, %eax
	jne	.L63
	movq	0(%rbp), %rdx
	xorl	%esi, %esi
	xorl	%r9d, %r9d
	xorl	%ebx, %ebx
	movl	$2, %ebp
	jmp	.L61
.L63:
	cmpl	$6, %eax
	jne	.L64
	movq	.refptr.TRUE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L65
	movq	0(%rbp), %rdx
	xorl	%esi, %esi
	xorl	%r9d, %r9d
	xorl	%ebx, %ebx
	movl	$3, %ebp
	jmp	.L61
.L65:
	cmpl	$6, 24(%rbp)
	jne	.L64
	movq	.refptr.FALSE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L64
	movq	0(%rbp), %rdx
	xorl	%esi, %esi
	xorl	%r9d, %r9d
	xorl	%ebx, %ebx
	movl	$4, %ebp
	jmp	.L61
.L64:
	cmpl	$5, 24(%rbp)
	jne	.L74
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L67
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	136(%rsp), %rdx
	movq	128(%rsp), %rcx
	movq	%rdi, %r8
	movq	%rax, %rsi
	call	parse_expression
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L68
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC7(%rip), %rcx
	movq	%rax, %r8
	jmp	.L167
.L68:
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movl	24(%rax), %ebp
	movq	%rax, %rsi
	cmpl	$5, %ebp
	je	.L70
.L72:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC8(%rip), %rcx
	movq	%rax, %r8
.L167:
	call	parser_error
	xorl	%eax, %eax
	jmp	.L59
.L70:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L72
	xorl	%esi, %esi
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	jmp	.L61
.L67:
	cmpl	$5, 24(%rbp)
	jne	.L74
	movq	.refptr.NOT_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L73
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	136(%rsp), %rdx
	movq	128(%rsp), %rcx
	movq	%rdi, %r8
	movq	%rax, %rbx
	call	parse_primary
	movq	%rax, %r9
	testq	%rax, %rax
	jne	.L112
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC9(%rip), %rcx
	movq	%rax, %r8
	jmp	.L167
.L73:
	cmpl	$5, 24(%rbp)
	jne	.L74
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L74
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	136(%rsp), %rdx
	movq	128(%rsp), %rcx
	movq	%rdi, %r8
	movq	%rax, %rbx
	call	parse_primary
	movq	%rax, %r9
	testq	%rax, %rax
	jne	.L113
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC10(%rip), %rcx
	movq	%rax, %r8
	jmp	.L167
.L112:
	xorl	%esi, %esi
	xorl	%ebx, %ebx
	xorl	%edx, %edx
	movl	$6, %ebp
	jmp	.L61
.L113:
	xorl	%esi, %esi
	xorl	%ebx, %ebx
	xorl	%edx, %edx
	movl	$7, %ebp
.L61:
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r8
	movl	%ebp, %ecx
	call	create_primary
	jmp	.L59
.L74:
	movl	24(%rbp), %eax
	cmpl	$1, %eax
	jne	.L165
.L78:
	movq	128(%rsp), %rcx
	call	peek_current_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	jne	.L75
	jmp	.L76
.L165:
	cmpl	$6, %eax
	jne	.L77
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L77
	cmpb	$0, 9(%rdi)
	jne	.L78
	jmp	.L77
.L75:
	cmpl	$6, %eax
	je	.L79
.L81:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC11(%rip), %rcx
	movq	%rax, %r8
	jmp	.L171
.L79:
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L81
.L76:
	movq	(%rbx), %rdx
	movq	136(%rsp), %rcx
	xorl	%r12d, %r12d
	xorl	%r13d, %r13d
	call	search_name
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movq	%r8, 32(%rsp)
	xorl	%ecx, %ecx
	movq	%rax, %r8
	movq	%rax, %rbx
	call	create_variable_access
	movq	128(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, %rsi
	call	peek_next_token
	movq	%rax, %r14
	jmp	.L82
.L86:
	cmpl	$0, 32(%rbx)
	jne	.L88
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax
	movq	8(%rbx), %rcx
	movq	(%rax), %rdx
	call	make_method_name
	movq	%rax, %rdx
	movq	24(%rbx), %rax
	movq	16(%rax), %rcx
	call	search_name_use_strcmp
	xorl	%ecx, %ecx
	movq	%rsi, %rdx
	xorl	%r9d, %r9d
	movq	%rcx, 32(%rsp)
	movq	%rax, %r8
	movl	$2, %ecx
	movq	%rax, %rbx
	call	create_variable_access
	movq	%rax, %rsi
	testq	%rbx, %rbx
	jne	.L88
.L87:
	movq	128(%rsp), %rcx
	movl	$1, %edx
	leaq	.LC14(%rip), %r15
	call	get_next_token
	movq	%rax, %r12
	call	create_list
	movq	%rax, %r14
.L91:
	cmpl	$5, 24(%r12)
	je	.L172
.L97:
	movq	136(%rsp), %rdx
	movq	128(%rsp), %rcx
	movq	%rdi, %r8
	call	parse_expression
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L92
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r12, %rdx
	movq	%r15, %rcx
	movq	%rax, %r8
	call	parser_error
.L92:
	movq	%r13, %rdx
	movq	%r14, %rcx
	call	list_append
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	je	.L93
.L96:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r12, %rdx
	leaq	.LC15(%rip), %rcx
	movq	%rax, %r8
.L171:
	call	parser_error
	jmp	.L80
.L109:
	testq	%rbx, %rbx
	je	.L83
	movq	(%rbx), %r13
	testq	%r13, %r13
	cmove	%rbx, %r13
.L83:
	testq	%r12, %r12
	je	.L173
.L84:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L174
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L99
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	136(%rsp), %rdx
	movq	128(%rsp), %rcx
	movq	%rdi, %r8
	movq	%rax, %r14
	call	parse_expression
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L100
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r14, %rdx
	leaq	.LC16(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L100:
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r14
	jne	.L102
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L102
	xorl	%edx, %edx
	movq	%r15, %r9
	xorl	%r8d, %r8d
	movl	$3, %ecx
	movq	%rdx, 32(%rsp)
	movq	%rsi, %rdx
	call	create_variable_access
	movq	%rax, %rsi
.L98:
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	peek_next_token
	movq	%rax, %r14
.L82:
	cmpl	$5, 24(%r14)
	je	.L109
	jmp	.L110
.L173:
	testq	%r13, %r13
	je	.L84
	cmpl	$0, 32(%r13)
	jne	.L84
	movq	24(%r13), %rax
	movq	16(%rax), %r12
	jmp	.L84
.L174:
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %r12
	testq	%rbx, %rbx
	jne	.L86
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r12, %rdx
	leaq	.LC12(%rip), %rcx
	movq	%rax, %r8
	jmp	.L168
.L88:
	movl	32(%rbx), %eax
	decl	%eax
	cmpl	$1, %eax
	jbe	.L87
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r12, %rdx
	leaq	.LC13(%rip), %rcx
	movq	%rax, %r8
.L168:
	call	parser_error
	jmp	.L87
.L93:
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L94
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %r12
	jmp	.L91
.L94:
	cmpl	$5, 24(%r12)
	jne	.L96
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L91
	jmp	.L96
.L172:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L97
	movq	%r14, 32(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rsi, %rdx
	movl	$1, %ecx
	call	create_variable_access
	movq	(%rbx), %rbx
	movq	%rax, %rsi
	cmpl	$0, 32(%rbx)
	jne	.L115
	movq	24(%rbx), %rax
	movq	16(%rax), %r12
	jmp	.L170
.L102:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r14, %rdx
	leaq	.LC17(%rip), %rcx
	movq	%rax, %r8
	jmp	.L171
.L99:
	movq	.refptr.DOT_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L103
.L110:
	testq	%rsi, %rsi
	je	.L80
	xorl	%r9d, %r9d
	xorl	%ebx, %ebx
	xorl	%edx, %edx
	movl	$8, %ebp
	jmp	.L61
.L103:
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %r14
	testq	%r12, %r12
	jne	.L104
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r14, %rdx
	leaq	.LC18(%rip), %rcx
	movq	%rax, %r8
	jmp	.L171
.L104:
	cmpl	$1, 24(%rax)
	je	.L105
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r14, %rdx
	leaq	.LC19(%rip), %rcx
	movq	%rax, %r8
	jmp	.L171
.L105:
	movq	(%rax), %rdx
	movq	%r12, %rcx
	call	search_name
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L106
	testq	%r13, %r13
	je	.L107
	cmpl	$0, 32(%r13)
	je	.L169
	movq	0(%r13), %r13
	testq	%r13, %r13
	je	.L107
	cmpl	$0, 32(%r13)
	jne	.L116
.L169:
	movq	8(%r13), %r13
	jmp	.L107
.L116:
	xorl	%r13d, %r13d
.L107:
	movq	(%r14), %rdx
	movq	%r13, %rcx
	call	make_method_name
	movq	%r12, %rcx
	movq	%rax, %rdx
	call	search_name_use_strcmp
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L106
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r14, %rdx
	leaq	.LC20(%rip), %rcx
	movq	%rax, %r8
	jmp	.L171
.L106:
	xorl	%eax, %eax
	movq	%rsi, %rdx
	xorl	%r9d, %r9d
	movq	%rbx, %r8
	movq	%rax, 32(%rsp)
	movl	$2, %ecx
	call	create_variable_access
	movq	%rax, %rsi
.L115:
	xorl	%r12d, %r12d
.L170:
	xorl	%r13d, %r13d
	jmp	.L98
.L80:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC21(%rip), %rcx
	movq	%rax, %r8
	jmp	.L167
.L77:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC22(%rip), %rcx
	movq	%rax, %r8
	jmp	.L167
.L59:
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
.LC23:
	.ascii "Expected '(' after 'if'\0"
.LC24:
	.ascii "Failed to parse if condition\0"
.LC25:
	.ascii "Expected ')' after if condition\0"
.LC26:
	.ascii "Expected '{' to start if body\0"
.LC27:
	.ascii "Failed to parse if body statement\0"
.LC28:
	.ascii "Expected '(' after 'elif'\0"
.LC29:
	.ascii "Failed to parse else-if condition\0"
.LC30:
	.ascii "Expected ')' after else-if condition\0"
.LC31:
	.ascii "Expected '{' to start else-if body\0"
.LC32:
	.ascii "Failed to parse else-if body statement\0"
.LC33:
	.ascii "Expected '{' to start else body\0"
.LC34:
	.ascii "Failed to parse else body statement\0"
.LC35:
	.ascii "Expected '(' after 'for'\0"
.LC36:
	.ascii "Failed to parse for loop initializer\0"
.LC37:
	.ascii "Expected ';' after for loop initializer\0"
.LC38:
	.ascii "Failed to parse for loop condition\0"
.LC39:
	.ascii "Expected ';' after for loop condition\0"
.LC40:
	.ascii "Failed to parse for loop increment\0"
.LC41:
	.ascii "Expected ')' after for loop increment\0"
.LC42:
	.ascii "Expected '{' to start for loop body\0"
.LC43:
	.ascii "Failed to parse for loop body statement\0"
.LC44:
	.ascii "Expected '(' after 'while'\0"
.LC45:
	.ascii "Failed to parse while condition\0"
.LC46:
	.ascii "Expected ')' after while condition\0"
.LC47:
	.ascii "Expected '{' to start while body\0"
.LC48:
	.ascii "Failed to parse while body statement\0"
.LC49:
	.ascii "Cannot use 'break' outside of a loop\0"
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
	movq	%r8, %rbx
	subq	$88, %rsp
	movq	%rcx, 160(%rsp)
	movq	%rdx, 168(%rsp)
	call	peek_current_token
	cmpl	$6, 24(%rax)
	jne	.L176
	movq	%rax, %rsi
	movq	.refptr.IF_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L177
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L178
.L180:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC23(%rip), %rcx
	movq	%rax, %r8
	jmp	.L350
.L178:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L180
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	movq	%rax, %rsi
	call	parse_expression
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L181
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC24(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L181:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L182
.L183:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC25(%rip), %rcx
	movq	%rax, %r8
.L350:
	call	parser_error
	xorl	%edx, %edx
	jmp	.L205
.L182:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L183
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L184
.L185:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC26(%rip), %rcx
	movq	%rax, %r8
	jmp	.L350
.L184:
	movq	.refptr.L_BRACE_SYMBOL(%rip), %r14
	movq	(%rax), %rcx
	movq	(%r14), %rdx
	call	string_equal
	testb	%al, %al
	je	.L185
	call	create_list
	movq	160(%rsp), %rcx
	movl	$1, %edx
	leaq	.LC27(%rip), %rbp
	movq	%rax, 56(%rsp)
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12
	movq	%rax, %rsi
.L186:
	cmpl	$5, 24(%rsi)
	je	.L356
.L188:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_statement
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L187
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	movq	%rbp, %rcx
	movq	%rax, %r8
	call	parser_error
.L187:
	movq	56(%rsp), %rcx
	movq	%r13, %rdx
	call	list_append
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rsi
	jmp	.L186
.L356:
	movq	(%r12), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L188
	call	create_list
	leaq	.LC32(%rip), %r15
	movq	%rax, 64(%rsp)
	call	create_list
	movq	160(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, 72(%rsp)
	call	peek_next_token
	movq	%rax, %rsi
.L189:
	cmpl	$6, 24(%rsi)
	jne	.L201
	movq	.refptr.ELIF_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L357
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L190
.L191:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC28(%rip), %rcx
	movq	%rax, %r8
	jmp	.L350
.L190:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L191
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	movq	%rax, %rsi
	call	parse_expression
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L192
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC29(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L192:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L193
.L194:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC30(%rip), %rcx
	movq	%rax, %r8
	jmp	.L350
.L193:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L194
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L195
.L196:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC31(%rip), %rcx
	movq	%rax, %r8
	jmp	.L350
.L195:
	movq	(%r14), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	je	.L196
	call	create_list
	movq	%rax, %r13
.L349:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L358
.L199:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_statement
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L198
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	movq	%r15, %rcx
	movq	%rax, %r8
	call	parser_error
.L198:
	movq	%rbp, %rdx
	movq	%r13, %rcx
	call	list_append
	jmp	.L349
.L358:
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L199
	movq	%r13, %rdx
	movq	%r12, %rcx
	call	create_else_if
	movq	64(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	peek_next_token
	movq	%rax, %rsi
	jmp	.L189
.L357:
	cmpl	$6, 24(%rsi)
	jne	.L201
	movq	.refptr.ELSE_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L359
.L201:
	movq	160(%rsp), %rcx
	call	peek_current_token
	movq	56(%rsp), %rdx
	movq	72(%rsp), %r9
	movq	%rdi, %rcx
	movq	64(%rsp), %r8
	call	create_if
	movq	%rax, %rdx
	jmp	.L205
.L359:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L206
.L207:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC33(%rip), %rcx
	movq	%rax, %r8
	jmp	.L350
.L206:
	movq	(%r14), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	je	.L207
	movq	160(%rsp), %rcx
	movl	$1, %edx
	leaq	.LC34(%rip), %r12
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r13
	movq	%rax, %rsi
.L208:
	cmpl	$5, 24(%rsi)
	je	.L360
.L210:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L209
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	movq	%r12, %rcx
	movq	%rax, %r8
	call	parser_error
.L209:
	movq	72(%rsp), %rcx
	movq	%r14, %rdx
	call	list_append
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rsi
	jmp	.L208
.L360:
	movq	0(%r13), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L210
	jmp	.L201
.L205:
	xorl	%edi, %edi
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ecx
	movq	%rdi, 40(%rsp)
	movq	%rdi, 32(%rsp)
	jmp	.L355
.L177:
	movq	.refptr.FOR_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L212
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L213
.L215:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC35(%rip), %rcx
	movq	%rax, %r8
	jmp	.L351
.L213:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L215
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L216
.L219:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_variable
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L218
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC36(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L218
.L216:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	xorl	%edi, %edi
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L220
	jmp	.L219
.L218:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rsi
.L220:
	cmpl	$5, 24(%rsi)
	je	.L221
.L223:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC37(%rip), %rcx
	movq	%rax, %r8
.L351:
	call	parser_error
	xorl	%r9d, %r9d
	jmp	.L222
.L221:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %r12
	movq	(%rsi), %rcx
	movq	(%r12), %rdx
	call	string_equal
	testb	%al, %al
	je	.L223
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L224
.L227:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L226
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC38(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L226
.L224:
	movq	(%r12), %rdx
	movq	(%rax), %rcx
	xorl	%ebp, %ebp
	call	string_equal
	testb	%al, %al
	jne	.L228
	jmp	.L227
.L226:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rsi
.L228:
	cmpl	$5, 24(%rsi)
	je	.L229
.L230:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC39(%rip), %rcx
	movq	%rax, %r8
	jmp	.L351
.L229:
	movq	(%r12), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L230
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L231
.L234:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_expression
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L233
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC40(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L233
.L231:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	xorl	%r12d, %r12d
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L235
	jmp	.L234
.L233:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rsi
.L235:
	cmpl	$5, 24(%rsi)
	je	.L236
.L237:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC41(%rip), %rcx
	movq	%rax, %r8
	jmp	.L351
.L236:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L237
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L238
.L239:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC42(%rip), %rcx
	movq	%rax, %r8
	jmp	.L351
.L238:
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L239
	call	create_list
	movb	$1, 11(%rbx)
	movq	160(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, %r13
	leaq	.LC43(%rip), %r14
	call	get_next_token
	movq	%rax, %rsi
.L240:
	cmpl	$5, 24(%rsi)
	je	.L361
.L242:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L241
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	movq	%r14, %rcx
	movq	%rax, %r8
	call	parser_error
.L241:
	movq	%r15, %rdx
	movq	%r13, %rcx
	call	list_append
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rsi
	jmp	.L240
.L361:
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L242
	movb	$0, 11(%rbx)
	movq	%r13, %r9
	movq	%r12, %r8
	movq	%rbp, %rdx
	movq	%rdi, %rcx
	call	create_for
	movq	%rax, %r9
.L222:
	xorl	%esi, %esi
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$4, %ecx
	movq	%rsi, 40(%rsp)
	movq	%rsi, 32(%rsp)
.L355:
	call	create_statement
	movq	%rax, %rsi
	jmp	.L175
.L212:
	movq	.refptr.WHILE_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L243
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L244
.L246:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC44(%rip), %rcx
	movq	%rax, %r8
	jmp	.L352
.L244:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L246
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	movq	%rax, %rsi
	call	parse_expression
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L247
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC45(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L247:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L248
.L250:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC46(%rip), %rcx
	movq	%rax, %r8
.L352:
	call	parser_error
	xorl	%r8d, %r8d
	jmp	.L249
.L248:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L250
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L251
.L252:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC47(%rip), %rcx
	movq	%rax, %r8
	jmp	.L352
.L251:
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L252
	call	create_list
	movb	$1, 11(%rbx)
	movq	160(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, %rbp
	leaq	.LC48(%rip), %r13
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12
	movq	%rax, %rsi
.L253:
	cmpl	$5, 24(%rsi)
	je	.L362
.L255:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L254
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	movq	%r13, %rcx
	movq	%rax, %r8
	call	parser_error
.L254:
	movq	%r14, %rdx
	movq	%rbp, %rcx
	call	list_append
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rsi
	jmp	.L253
.L362:
	movq	(%r12), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L255
	movb	$0, 11(%rbx)
	movq	%rbp, %rdx
	movq	%rdi, %rcx
	call	create_while
	movq	%rax, %r8
.L249:
	xorl	%ebx, %ebx
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$3, %ecx
	movq	%rbx, 40(%rsp)
	movq	%rbx, 32(%rsp)
	jmp	.L355
.L243:
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L256
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_variable
	xorl	%r11d, %r11d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, 40(%rsp)
	xorl	%edx, %edx
	movl	$1, %ecx
	movq	%r11, 32(%rsp)
	jmp	.L354
.L256:
	movq	.refptr.RETURN_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L258
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L259
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rdx
	movq	(%rax), %rcx
	movq	(%rdx), %rdx
	call	string_equal
	testb	%al, %al
	je	.L259
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%r10, 40(%rsp)
	movl	$5, %ecx
	movq	%r10, 32(%rsp)
	jmp	.L355
.L259:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_expression
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%r9, 40(%rsp)
	movl	$5, %ecx
	xorl	%r9d, %r9d
	movq	%rax, 32(%rsp)
	jmp	.L354
.L258:
	movq	.refptr.BREAK_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L260
	cmpb	$0, 11(%rbx)
	jne	.L261
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC49(%rip), %rcx
	movq	%rax, %r8
	jmp	.L353
.L261:
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$6, %ecx
	movq	%r8, 40(%rsp)
	movq	%r8, 32(%rsp)
	xorl	%r8d, %r8d
	jmp	.L354
.L260:
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L176
	cmpb	$0, 11(%rbx)
	jne	.L264
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC50(%rip), %rcx
	movq	%rax, %r8
.L353:
	call	parser_error
	xorl	%esi, %esi
	jmp	.L175
.L264:
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rcx, 40(%rsp)
	movq	%rcx, 32(%rsp)
	movl	$7, %ecx
	jmp	.L354
.L176:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_expression
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, 32(%rsp)
	xorl	%ecx, %ecx
	movq	%rdx, 40(%rsp)
	xorl	%edx, %edx
.L354:
	call	create_statement
	movq	160(%rsp), %rcx
	movq	%rax, %rsi
	call	peek_current_token
	movq	%rax, %rdi
	testq	%rsi, %rsi
	jne	.L265
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC51(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L265:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rdi
	je	.L266
.L268:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC52(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L175
.L266:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rdi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L268
.L175:
	addq	$88, %rsp
	movq	%rsi, %rax
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
.LC53:
	.ascii "Expected identifier after 'import'\0"
.LC54:
	.ascii "Expected string literal after 'from'\0"
.LC55:
	.ascii "Expected ';' at end of import statement\0"
.LC56:
	.ascii "Failed to import module\0"
.LC57:
	.ascii "Failed to parse import statement\0"
.LC58:
	.ascii "Expected function return type after 'func'\0"
.LC59:
	.ascii "Unknown function return type\0"
.LC60:
	.ascii "Expected function name after return type\0"
.LC61:
	.ascii "Expected '(' after function name\0"
.LC62:
	.ascii "Failed to parse function parameter\0"
.LC63:
	.ascii "Function parameters cannot have default values\0"
.LC64:
	.ascii "Expected ',' or ')' after function parameter\0"
.LC65:
	.ascii "Expected '{' to start function body\0"
.LC66:
	.ascii "Failed to parse function body statement\0"
.LC67:
	.ascii "Unreachable code after return statement\0"
.LC68:
	.ascii "Function missing return statement\0"
.LC69:
	.ascii "Failed to parse function declaration\0"
.LC70:
	.ascii "Expected class name after 'class'\0"
.LC71:
	.ascii "Expected '{' to start class body\0"
.LC72:
	.ascii "Expected method return type after 'method'\0"
.LC73:
	.ascii "Unknown return type for method\0"
.LC74:
	.ascii "Expected method name after return type\0"
.LC75:
	.ascii "Expected '(' after method name\0"
.LC76:
	.ascii "Expected 'self' as first parameter of method\0"
.LC77:
	.ascii "Expected ',' or ')' after method parameter\0"
.LC78:
	.ascii "Failed to parse method parameter\0"
.LC79:
	.ascii "Method parameters cannot have default values\0"
.LC80:
	.ascii "Expected '{' to start method body\0"
.LC81:
	.ascii "Failed to parse method body statement\0"
.LC82:
	.ascii "Method missing return statement\0"
.LC83:
	.ascii "Failed to parse class method\0"
.LC84:
	.ascii "Failed to parse class variable\0"
.LC85:
	.ascii "Unsupported type for class variable\0"
.LC86:
	.ascii "Expected ';' after class variable declaration\0"
.LC87:
	.ascii "Unexpected token in class member\0"
.LC88:
	.ascii "Constructor name conflicts with existing member\0"
.LC89:
	.ascii "0\0"
.LC90:
	.ascii "Failed to parse class declaration\0"
.LC91:
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
	movq	%rdx, %rdi
	pushq	%rsi
	pushq	%rbx
	movq	%r8, %rbx
	subq	$152, %rsp
	movq	.refptr.builtin_scope(%rip), %rsi
	movq	%rcx, 48(%rsp)
	cmpq	$0, (%rsi)
	jne	.L364
	xorl	%ecx, %ecx
	call	create_symbol_table
	xorl	%r8d, %r8d
	movl	$6, %edx
	movq	%rax, %r9
	movq	%rax, (%rsi)
	movq	.refptr.VOID_KEYWORD(%rip), %rax
	movq	(%rax), %rcx
	call	create_symbol
	movq	.refptr.name_void(%rip), %rdx
	movq	(%rsi), %r9
	xorl	%r8d, %r8d
	movq	%rax, (%rdx)
	movq	.refptr.INT_KEYWORD(%rip), %rax
	movl	$6, %edx
	movq	(%rax), %rcx
	call	create_symbol
	movq	.refptr.name_int(%rip), %rdx
	movq	(%rsi), %r9
	xorl	%r8d, %r8d
	movq	%rax, (%rdx)
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	movl	$6, %edx
	movq	(%rax), %rcx
	call	create_symbol
	movq	.refptr.name_float(%rip), %rdx
	movq	(%rsi), %r9
	xorl	%r8d, %r8d
	movq	%rax, (%rdx)
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	movl	$6, %edx
	movq	(%rax), %rcx
	call	create_symbol
	movq	.refptr.name_string(%rip), %rdx
	movq	(%rsi), %r9
	xorl	%r8d, %r8d
	movq	%rax, (%rdx)
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	movl	$6, %edx
	movq	(%rax), %rcx
	call	create_symbol
	movq	.refptr.name_bool(%rip), %rdx
	movq	%rax, (%rdx)
.L364:
	testq	%rdi, %rdi
	jne	.L365
	movq	(%rsi), %rdi
.L365:
	call	create_list
	movq	%rdi, %rcx
	movq	%rax, 96(%rsp)
	call	create_symbol_table
	movq	%rax, 72(%rsp)
.L379:
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L482
	movl	24(%rax), %eax
	testl	%eax, %eax
	je	.L482
	cmpl	$6, %eax
	jne	.L412
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %ebp
	testb	%al, %al
	je	.L368
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rsi
	je	.L369
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC53(%rip), %rcx
	movq	%rax, %r8
	jmp	.L560
.L369:
	movq	48(%rsp), %rcx
	movl	$1, %edx
	movq	(%rax), %rbp
	call	get_next_token
	cmpl	$6, 24(%rax)
	movq	%rax, %rsi
	jne	.L371
	movq	.refptr.FROM_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L372
.L371:
	xorl	%edi, %edi
	jmp	.L373
.L372:
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$4, 24(%rax)
	movq	%rax, %rsi
	je	.L374
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC54(%rip), %rcx
	movq	%rax, %r8
.L560:
	call	parser_error
	jmp	.L370
.L374:
	movq	48(%rsp), %rcx
	movl	$1, %edx
	movq	(%rax), %rdi
	call	get_next_token
	movq	%rax, %rsi
.L373:
	cmpl	$5, 24(%rsi)
	je	.L375
.L376:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC55(%rip), %rcx
	movq	%rax, %r8
	jmp	.L560
.L375:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L376
	movq	(%rbx), %r9
	movq	72(%rsp), %r8
	movq	%rdi, %rdx
	movq	%rbp, %rcx
	call	parse_import_file
	testq	%rax, %rax
	jne	.L377
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC56(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	.refptr.name_void(%rip), %rax
	movq	72(%rsp), %r9
	movq	%rbp, %rcx
	movl	$3, %edx
	movq	(%rax), %r8
	call	create_symbol
.L377:
	movq	%rdi, %rdx
	movq	%rax, %rcx
	call	create_import
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L378
.L370:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%r14, %rdx
	leaq	.LC57(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%edx, %edx
.L378:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	jmp	.L570
.L368:
	cmpl	$6, 24(%r14)
	jne	.L412
	movq	.refptr.FUNC_KEYWORD(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L380
	movq	72(%rsp), %rcx
	call	create_symbol_table
	movq	48(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, %r15
	call	get_next_token
	movq	%rax, %rsi
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L381
	cmpl	$6, %eax
	je	.L382
.L384:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC58(%rip), %rcx
	movq	%rax, %r8
	jmp	.L563
.L382:
	movq	(%rsi), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L384
.L381:
	movq	(%rsi), %rdx
	movq	72(%rsp), %rcx
	call	search_name
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L385
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC59(%rip), %rcx
	movq	%rax, %r8
	jmp	.L563
.L385:
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rsi
	je	.L386
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC60(%rip), %rcx
	movq	%rax, %r8
.L563:
	call	parser_error
	jmp	.L383
.L386:
	movl	$40, %ecx
	call	alloc_memory
	movq	(%rsi), %rcx
	movq	%rdi, %r8
	movl	$1, %edx
	movq	%r15, 32(%rax)
	movq	%rax, %r9
	movq	%rax, 56(%rsp)
	call	create_symbol
	movq	48(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, 80(%rsp)
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L387
.L388:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC61(%rip), %rcx
	movq	%rax, %r8
	jmp	.L563
.L387:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L388
	movq	48(%rsp), %rcx
	movl	$1, %edx
	leaq	.LC63(%rip), %r12
	leaq	.LC62(%rip), %r13
	call	get_next_token
	movq	%rax, %rsi
	call	create_list
	movq	%rax, 64(%rsp)
.L389:
	cmpl	$5, 24(%rsi)
	je	.L571
.L397:
	movq	48(%rsp), %rcx
	movq	%r15, %rdx
	movq	%rbx, %r8
	call	parse_variable
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L390
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	movq	%r13, %rcx
	movq	%rax, %r8
	jmp	.L561
.L390:
	cmpq	$0, 16(%rax)
	je	.L392
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	movq	%r12, %rcx
	movq	%rax, %r8
.L561:
	call	parser_error
	jmp	.L391
.L392:
	movq	64(%rsp), %rcx
	call	list_append
.L391:
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L393
.L396:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC64(%rip), %rcx
	movq	%rax, %r8
	jmp	.L563
.L393:
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L394
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rsi
	jmp	.L389
.L394:
	cmpl	$5, 24(%rsi)
	jne	.L396
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L389
	jmp	.L396
.L571:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L397
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L398
.L399:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC65(%rip), %rcx
	movq	%rax, %r8
	jmp	.L563
.L398:
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L399
	call	create_list
	movb	$1, 8(%rbx)
	movq	%rax, %r12
.L562:
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L572
.L405:
	movq	48(%rsp), %rcx
	movq	%rbx, %r8
	movq	%r15, %rdx
	call	parse_statement
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L401
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC66(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L404
.L401:
	testb	%bpl, %bpl
	je	.L403
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC67(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L403:
	cmpl	$5, 8(%r13)
	movb	$1, %al
	cmove	%eax, %ebp
.L404:
	movq	%r13, %rdx
	movq	%r12, %rcx
	call	list_append
	jmp	.L562
.L572:
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L405
	movb	$0, 8(%rbx)
	testb	%bpl, %bpl
	jne	.L407
	movq	.refptr.name_void(%rip), %rbp
	cmpq	0(%rbp), %rdi
	jne	.L408
.L409:
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	xorl	%r8d, %r8d
	movl	$5, %ecx
	movq	%r9, 40(%rsp)
	movq	%r9, 32(%rsp)
	xorl	%r9d, %r9d
	call	create_statement
	movq	%r12, %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L407
.L408:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC68(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	cmpq	0(%rbp), %rdi
	je	.L409
.L407:
	movq	%r15, 40(%rsp)
	movq	64(%rsp), %r9
	movq	%rdi, %r8
	movq	80(%rsp), %rdx
	movq	56(%rsp), %rcx
	movq	%r12, 32(%rsp)
	call	create_function_use_ptr
	movq	%rax, %r8
	testq	%rax, %rax
	jne	.L411
.L383:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%r14, %rdx
	leaq	.LC69(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%r8d, %r8d
.L411:
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$1, %ecx
	jmp	.L570
.L380:
	cmpl	$6, 24(%r14)
	jne	.L412
	movq	.refptr.CLASS_KEYWORD(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L412
	movq	72(%rsp), %rcx
	call	create_symbol_table
	movq	48(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, 64(%rsp)
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rsi
	je	.L413
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC70(%rip), %rcx
	movq	%rax, %r8
	jmp	.L569
.L413:
	movl	$32, %ecx
	call	alloc_memory
	movq	64(%rsp), %rdi
	movq	(%rsi), %rcx
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, %r9
	movq	%rax, 112(%rsp)
	movq	%rdi, 16(%rax)
	call	create_symbol
	movq	48(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, 56(%rsp)
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L415
.L416:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC71(%rip), %rcx
	movq	%rax, %r8
.L569:
	call	parser_error
	jmp	.L414
.L415:
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L416
	call	create_list
	movq	48(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, 80(%rsp)
	call	get_next_token
	xorl	%r8d, %r8d
	movq	%r8, 104(%rsp)
	movq	%rax, %r15
.L417:
	cmpl	$5, 24(%r15)
	je	.L573
.L469:
	cmpl	$6, 24(%r15)
	jne	.L418
	movq	.refptr.METHOD_KEYWORD(%rip), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L419
	movq	64(%rsp), %rcx
	call	create_symbol_table
	movq	56(%rsp), %r8
	movl	$3, %edx
	movq	%rax, %r9
	movq	%rax, 88(%rsp)
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rcx
	call	create_symbol
	movq	48(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, %rbp
	call	get_next_token
	movq	%rax, %rsi
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L420
	cmpl	$6, %eax
	je	.L421
.L423:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC72(%rip), %rcx
	movq	%rax, %r8
	jmp	.L565
.L421:
	movq	(%rsi), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L423
.L420:
	movq	(%rsi), %rdx
	movq	64(%rsp), %rcx
	call	search_name
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L424
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC73(%rip), %rcx
	movq	%rax, %r8
	jmp	.L565
.L424:
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rsi
	je	.L425
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC74(%rip), %rcx
	movq	%rax, %r8
.L565:
	call	parser_error
	jmp	.L422
.L425:
	movl	$40, %ecx
	call	alloc_memory
	movq	88(%rsp), %rdx
	movq	%rax, 120(%rsp)
	movq	%rdx, 32(%rax)
	movq	56(%rsp), %rax
	movq	(%rsi), %rdx
	movq	8(%rax), %rcx
	call	make_method_name
	movq	120(%rsp), %r9
	movq	%rdi, %r8
	movl	$2, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	48(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, 136(%rsp)
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L426
.L427:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC75(%rip), %rcx
	movq	%rax, %r8
	jmp	.L565
.L426:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L427
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$6, 24(%rax)
	movq	%rax, %rsi
	je	.L428
.L430:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC76(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L429
.L428:
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L430
.L429:
	movq	48(%rsp), %rcx
	movl	$1, %edx
	leaq	.LC79(%rip), %r12
	call	get_next_token
	movq	%rax, %rsi
	call	create_list
	movq	56(%rsp), %rcx
	movq	%rbp, %rdx
	xorl	%r8d, %r8d
	movq	%rax, 128(%rsp)
	call	create_variable
	movq	128(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rbp
	movq	.refptr.COMMA_SYMBOL(%rip), %r13
.L431:
	cmpl	$5, 24(%rsi)
	je	.L574
.L437:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC77(%rip), %rcx
	movq	%rax, %r8
	jmp	.L565
.L574:
	movq	0(%rbp), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L443
	cmpl	$5, 24(%rsi)
	jne	.L437
	movq	0(%r13), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L433
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	88(%rsp), %rdx
	movq	48(%rsp), %rcx
	movq	%rbx, %r8
	movq	%rax, %rsi
	call	parse_variable
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L557
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC78(%rip), %rcx
	movq	%rax, %r8
	jmp	.L564
.L433:
	cmpl	$5, 24(%rsi)
	jne	.L437
	movq	0(%rbp), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L437
.L443:
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L558
	jmp	.L438
.L557:
	cmpq	$0, 16(%rax)
	je	.L441
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	movq	%r12, %rcx
	movq	%rax, %r8
.L564:
	call	parser_error
	jmp	.L440
.L441:
	movq	128(%rsp), %rcx
	call	list_append
.L440:
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rsi
	jmp	.L431
.L438:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC80(%rip), %rcx
	movq	%rax, %r8
	jmp	.L565
.L558:
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L438
	call	create_list
	movw	$257, 8(%rbx)
	movq	48(%rsp), %rcx
	xorl	%r13d, %r13d
	movl	$1, %edx
	movq	%rax, %rbp
	call	get_next_token
	movq	%rax, %rsi
.L444:
	cmpl	$5, 24(%rsi)
	je	.L575
.L449:
	movq	88(%rsp), %rdx
	movq	48(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L445
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC81(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L448
.L445:
	testb	%r13b, %r13b
	je	.L447
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC67(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L447:
	cmpl	$5, 8(%r12)
	movb	$1, %al
	cmove	%eax, %r13d
.L448:
	movq	%r12, %rdx
	movq	%rbp, %rcx
	call	list_append
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rsi
	jmp	.L444
.L575:
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L449
	movw	$0, 8(%rbx)
	testb	%r13b, %r13b
	jne	.L451
	movq	.refptr.name_void(%rip), %r12
	cmpq	(%r12), %rdi
	jne	.L452
.L453:
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rcx, 40(%rsp)
	movq	%rcx, 32(%rsp)
	movl	$5, %ecx
	call	create_statement
	movq	%rbp, %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L451
.L452:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC82(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	cmpq	(%r12), %rdi
	je	.L453
.L451:
	movq	88(%rsp), %rax
	movq	%rbp, 32(%rsp)
	movq	%rdi, %r8
	movq	136(%rsp), %rdx
	movq	128(%rsp), %r9
	movq	%rax, 40(%rsp)
	movq	120(%rsp), %rcx
	call	create_method_use_ptr
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L455
.L422:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%r15, %rdx
	leaq	.LC83(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%edx, %edx
.L455:
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	call	create_class_member
	movq	80(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L466
.L419:
	cmpl	$6, 24(%r15)
	jne	.L418
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L418
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movb	$1, 10(%rbx)
	movq	64(%rsp), %rdx
	movq	%rbx, %r8
	movq	48(%rsp), %rcx
	movq	%rax, %rsi
	call	parse_variable
	movb	$0, 10(%rbx)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L457
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC84(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L457:
	movq	%rdi, %r8
	xorl	%edx, %edx
	movl	$1, %ecx
	call	create_class_member
	movq	80(%rsp), %rcx
	movq	%rax, %rdi
	movq	%rax, %rdx
	call	list_append
	cmpl	$1, 8(%rdi)
	jne	.L461
	movq	(%rdi), %rax
	movq	.refptr.name_int(%rip), %rdx
	movq	(%rax), %rax
	cmpq	(%rdx), %rax
	je	.L566
	movq	.refptr.name_float(%rip), %rdx
	cmpq	(%rdx), %rax
	je	.L566
	movq	.refptr.name_string(%rip), %rdx
	cmpq	(%rdx), %rax
	je	.L566
	movq	.refptr.name_bool(%rip), %rdx
	cmpq	(%rdx), %rax
	je	.L462
	movq	.refptr.name_void(%rip), %rdx
	cmpq	(%rdx), %rax
	jne	.L463
.L462:
	incq	104(%rsp)
	jmp	.L461
.L463:
	cmpl	$0, 32(%rax)
	jne	.L464
.L566:
	addq	$8, 104(%rsp)
	jmp	.L461
.L464:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC85(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L461:
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L465
.L467:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC86(%rip), %rcx
	movq	%rax, %r8
	jmp	.L567
.L465:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L467
	jmp	.L466
.L418:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%r15, %rdx
	leaq	.LC87(%rip), %rcx
	movq	%rax, %r8
.L567:
	call	parser_error
.L466:
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %r15
	jmp	.L417
.L573:
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L469
	movq	56(%rsp), %rax
	movq	8(%rax), %rcx
	movq	.refptr.DEFAULT_INIT_NAME(%rip), %rax
	movq	(%rax), %rdx
	call	make_method_name
	movq	64(%rsp), %rcx
	movq	%rax, %rdx
	movq	%rax, %rbp
	call	search_name_use_strcmp
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L470
	movl	$40, %ecx
	call	alloc_memory
	movq	64(%rsp), %rcx
	movq	%rax, %rdi
	call	create_symbol_table
	movq	56(%rsp), %r8
	movq	%rbp, %rcx
	movq	%rdi, %r9
	movq	%rax, 32(%rdi)
	movl	$2, %edx
	call	create_symbol
	movq	%rax, %rsi
	call	create_list
	movq	32(%rdi), %r9
	movq	56(%rsp), %r8
	movl	$3, %edx
	movq	%rax, %rbp
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rcx
	call	create_symbol
	movq	56(%rsp), %rcx
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movq	%rax, %r13
	call	create_variable
	movq	%rbp, %rcx
	movq	%rax, %rdx
	call	list_append
	call	create_list
	xorl	%r9d, %r9d
	movq	%r13, %r8
	xorl	%edx, %edx
	movq	%rax, %r12
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	movq	%rax, 32(%rsp)
	call	create_variable_access
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	movl	$8, %ecx
	call	create_primary
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_expression
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rdx, 40(%rsp)
	movl	$5, %ecx
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	call	create_statement
	movq	%r12, %rcx
	movq	%rax, %rdx
	call	list_append
	movq	32(%rdi), %rax
	movq	%rbp, %r9
	movq	%rsi, %rdx
	movq	%r12, 32(%rsp)
	movq	56(%rsp), %r8
	movq	%rdi, %rcx
	movq	%rax, 40(%rsp)
	call	create_method_use_ptr
	movq	%rdi, %rdx
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	call	create_class_member
	movq	80(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
.L470:
	cmpl	$2, 32(%rsi)
	je	.L471
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%r15, %rdx
	leaq	.LC88(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L471:
	movq	56(%rsp), %rax
	movq	8(%rax), %rcx
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax
	movq	(%rax), %rdx
	call	make_method_name
	movl	$40, %ecx
	movq	%rax, %rbp
	call	alloc_memory
	movq	64(%rsp), %rcx
	movq	%rax, %rdi
	call	create_symbol_table
	movq	56(%rsp), %r8
	movq	%rbp, %rcx
	movq	%rdi, %r9
	movq	%rax, 32(%rdi)
	movl	$2, %edx
	call	create_symbol
	movq	%rax, 120(%rsp)
	call	create_list
	movq	.refptr.SELF_KEYWORD(%rip), %r12
	movq	32(%rdi), %r9
	movl	$3, %edx
	movq	56(%rsp), %r8
	movq	%rax, 88(%rsp)
	movq	(%r12), %rcx
	call	create_symbol
	movq	%rax, %r13
	movq	24(%rsi), %rax
	movq	16(%rax), %rcx
	call	list_copy
	movq	%rax, %rbp
.L473:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L576
	movq	8(%r15), %rax
	movq	(%r12), %rdx
	movq	8(%rax), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L473
	movq	8(%r15), %rdx
	movq	(%r15), %rcx
	xorl	%r8d, %r8d
	call	create_variable
	movq	88(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L473
.L576:
	call	create_list
	movq	80(%rsp), %rcx
	movq	%rax, %rbp
	call	list_copy
	xorl	%r9d, %r9d
	movq	%r13, %r8
	xorl	%edx, %edx
	movq	%rax, %r15
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	movq	%rax, 32(%rsp)
	call	create_variable_access
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	movl	$8, %ecx
	call	create_primary
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	movq	%rax, %r8
.L568:
	call	create_expression
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%r9, 40(%rsp)
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	movq	%rax, 32(%rsp)
	call	create_statement
	movq	%rbp, %rcx
	movq	%rax, %rdx
	call	list_append
.L476:
	movq	%r15, %rcx
	call	list_pop
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L577
	cmpl	$1, 8(%r12)
	jne	.L476
	movq	(%r12), %rax
	xorl	%r11d, %r11d
	xorl	%r9d, %r9d
	movq	%r13, %r8
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	8(%rax), %rax
	movq	%r11, 32(%rsp)
	movq	%rax, 128(%rsp)
	call	create_variable_access
	movq	128(%rsp), %r8
	xorl	%r9d, %r9d
	movl	$2, %ecx
	movq	%rax, %rdx
	xorl	%eax, %eax
	movq	%rax, 32(%rsp)
	call	create_variable_access
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	movl	$8, %ecx
	call	create_primary
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_expression
	movq	%rax, 128(%rsp)
	movq	(%r12), %rax
	movq	16(%rax), %r9
	testq	%r9, %r9
	jne	.L477
	movl	$2, %edx
	leaq	.LC89(%rip), %rcx
	call	create_string
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%r10, 32(%rsp)
	movq	%rax, %rdx
	xorl	%ecx, %ecx
	call	create_primary
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_expression
	movq	%rax, %r9
.L477:
	movq	128(%rsp), %rdx
	xorl	%r8d, %r8d
	movl	$13, %ecx
	jmp	.L568
.L577:
	call	create_list
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movq	%r8, 32(%rsp)
	xorl	%ecx, %ecx
	movq	%r13, %r8
	movq	%rax, %r12
	call	create_variable_access
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	movl	$8, %ecx
	call	create_primary
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_expression
	movq	%r12, %rcx
	movq	%rax, %rdx
	call	list_append
	movq	88(%rsp), %rcx
	call	list_copy
	movq	%rax, %r13
.L479:
	movq	%r13, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L578
	xorl	%ecx, %ecx
	movq	8(%rax), %r8
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movq	%rcx, 32(%rsp)
	xorl	%ecx, %ecx
	call	create_variable_access
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	movl	$8, %ecx
	call	create_primary
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_expression
	movq	%r12, %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L479
.L578:
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	movq	%rsi, %r8
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	xorl	%ecx, %ecx
	call	create_variable_access
	movq	%r12, 32(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_variable_access
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	movl	$8, %ecx
	call	create_primary
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_expression
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rdx, 40(%rsp)
	movl	$5, %ecx
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	call	create_statement
	movq	%rbp, %rcx
	movq	%rax, %rdx
	call	list_append
	movq	32(%rdi), %rax
	movq	%rbp, 32(%rsp)
	movq	%rdi, %rcx
	movq	88(%rsp), %r9
	movq	56(%rsp), %r8
	movq	%rax, 40(%rsp)
	movq	120(%rsp), %rdx
	call	create_method_use_ptr
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	xorl	%ecx, %ecx
	call	create_class_member
	movq	80(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	104(%rsp), %rax
	movq	64(%rsp), %r9
	movq	80(%rsp), %r8
	movq	56(%rsp), %rdx
	movq	%rax, 32(%rsp)
	movq	112(%rsp), %rcx
	call	create_class_use_ptr
	movq	%rax, %r9
	testq	%rax, %rax
	jne	.L481
.L414:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%r14, %rdx
	leaq	.LC90(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%r9d, %r9d
.L481:
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$2, %ecx
.L570:
	call	create_code_member
	movq	96(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L379
.L482:
	movq	72(%rsp), %rdx
	movq	96(%rsp), %rcx
	addq	$152, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	create_code
.L412:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%r14, %rdx
	leaq	.LC91(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L379
	.ident	"GCC: (GNU) 13.2.0"
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	get_full_path;	.scl	2;	.type	32;	.endef
	.def	parser_error;	.scl	2;	.type	32;	.endef
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.def	search_name;	.scl	2;	.type	32;	.endef
	.def	create_symbol;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	create_variable;	.scl	2;	.type	32;	.endef
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
	.def	make_method_name;	.scl	2;	.type	32;	.endef
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	create_else_if;	.scl	2;	.type	32;	.endef
	.def	create_if;	.scl	2;	.type	32;	.endef
	.def	create_for;	.scl	2;	.type	32;	.endef
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.def	create_while;	.scl	2;	.type	32;	.endef
	.def	create_symbol_table;	.scl	2;	.type	32;	.endef
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.def	create_import;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_function_use_ptr;	.scl	2;	.type	32;	.endef
	.def	create_method_use_ptr;	.scl	2;	.type	32;	.endef
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	create_class_use_ptr;	.scl	2;	.type	32;	.endef
	.def	create_code_member;	.scl	2;	.type	32;	.endef
	.def	create_code;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.DEFAULT_INIT_NAME, "dr"
	.globl	.refptr.DEFAULT_INIT_NAME
	.linkonce	discard
.refptr.DEFAULT_INIT_NAME:
	.quad	DEFAULT_INIT_NAME
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
	.section	.rdata$.refptr.DEFAULT_CONSTRUCTOR_NAME, "dr"
	.globl	.refptr.DEFAULT_CONSTRUCTOR_NAME
	.linkonce	discard
.refptr.DEFAULT_CONSTRUCTOR_NAME:
	.quad	DEFAULT_CONSTRUCTOR_NAME
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
