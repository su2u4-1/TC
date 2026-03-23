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
	cmpl	$5, %eax
	je	.L32
	testl	%eax, %eax
	je	.L32
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC3(%rip), %rcx
	movq	%rax, %r8
	jmp	.L55
.L31:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC4(%rip), %rcx
	movq	%rax, %r8
.L55:
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
	movq	(%rdi), %rcx
	movq	%r12, %r9
	movq	%rbp, %r8
	movl	$2, %edx
	call	create_symbol
	movl	$1, %edx
	movq	%rsi, %rcx
	movq	%rax, %rdi
	call	peek_next_token
	cmpl	$5, 24(%rax)
	je	.L34
.L36:
	xorl	%esi, %esi
	jmp	.L35
.L34:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx
	movq	(%rax), %rcx
	movq	(%rdx), %rdx
	call	string_equal
	testb	%al, %al
	je	.L36
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
	jne	.L35
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC6(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L35:
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
	pushq	%rsi
	movq	%r8, %rsi
	pushq	%rbx
	subq	$56, %rsp
	movq	%rcx, 128(%rsp)
	movq	%rdx, 136(%rsp)
	call	peek_current_token
	movq	%rax, %rbp
	movl	24(%rax), %eax
	cmpl	$2, %eax
	jne	.L57
	movq	0(%rbp), %rdx
	xorl	%ebx, %ebx
	xorl	%r9d, %r9d
	xorl	%edi, %edi
	xorl	%ebp, %ebp
	jmp	.L58
.L57:
	cmpl	$3, %eax
	jne	.L59
	movq	0(%rbp), %rdx
	xorl	%ebx, %ebx
	xorl	%r9d, %r9d
	xorl	%edi, %edi
	movl	$1, %ebp
	jmp	.L58
.L59:
	cmpl	$4, %eax
	jne	.L60
	movq	0(%rbp), %rdx
	xorl	%ebx, %ebx
	xorl	%r9d, %r9d
	xorl	%edi, %edi
	movl	$2, %ebp
	jmp	.L58
.L60:
	cmpl	$6, %eax
	jne	.L61
	movq	.refptr.TRUE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L62
	movq	0(%rbp), %rdx
	xorl	%ebx, %ebx
	xorl	%r9d, %r9d
	xorl	%edi, %edi
	movl	$3, %ebp
	jmp	.L58
.L62:
	cmpl	$6, 24(%rbp)
	jne	.L61
	movq	.refptr.FALSE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L61
	movq	0(%rbp), %rdx
	xorl	%ebx, %ebx
	xorl	%r9d, %r9d
	xorl	%edi, %edi
	movl	$4, %ebp
	jmp	.L58
.L61:
	cmpl	$5, 24(%rbp)
	jne	.L71
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L64
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	136(%rsp), %rdx
	movq	128(%rsp), %rcx
	movq	%rsi, %r8
	movq	%rax, %rbx
	call	parse_expression
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L65
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC7(%rip), %rcx
	movq	%rax, %r8
	jmp	.L154
.L65:
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movl	24(%rax), %ebp
	movq	%rax, %rbx
	cmpl	$5, %ebp
	je	.L67
.L69:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC8(%rip), %rcx
	movq	%rax, %r8
.L154:
	call	parser_error
	xorl	%eax, %eax
	jmp	.L56
.L67:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L69
	xorl	%ebx, %ebx
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	jmp	.L58
.L64:
	cmpl	$5, 24(%rbp)
	jne	.L71
	movq	.refptr.NOT_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L70
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	136(%rsp), %rdx
	movq	128(%rsp), %rcx
	movq	%rsi, %r8
	movq	%rax, %rbx
	call	parse_primary
	movq	%rax, %r9
	testq	%rax, %rax
	jne	.L106
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC9(%rip), %rcx
	movq	%rax, %r8
	jmp	.L154
.L70:
	cmpl	$5, 24(%rbp)
	jne	.L71
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L71
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	136(%rsp), %rdx
	movq	128(%rsp), %rcx
	movq	%rsi, %r8
	movq	%rax, %rbx
	call	parse_primary
	movq	%rax, %r9
	testq	%rax, %rax
	jne	.L107
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC10(%rip), %rcx
	movq	%rax, %r8
	jmp	.L154
.L106:
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%edx, %edx
	movl	$6, %ebp
	jmp	.L58
.L107:
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%edx, %edx
	movl	$7, %ebp
.L58:
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r8
	movl	%ebp, %ecx
	call	create_primary
	jmp	.L56
.L71:
	movl	24(%rbp), %eax
	cmpl	$1, %eax
	jne	.L152
.L75:
	movq	128(%rsp), %rcx
	call	peek_current_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	jne	.L72
	jmp	.L73
.L152:
	cmpl	$6, %eax
	jne	.L74
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L74
	cmpb	$0, 9(%rsi)
	jne	.L75
	jmp	.L74
.L72:
	cmpl	$6, %eax
	je	.L76
.L78:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC11(%rip), %rcx
	movq	%rax, %r8
	jmp	.L157
.L76:
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L78
.L73:
	movq	(%rbx), %rdx
	movq	136(%rsp), %rcx
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	call	search_name
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movq	%r8, 32(%rsp)
	xorl	%ecx, %ecx
	movq	%rax, %r8
	movq	%rax, %rdi
	call	create_variable_access
	movq	128(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, %rbx
	call	peek_next_token
	movq	%rax, %r14
	jmp	.L79
.L83:
	cmpl	$0, 32(%rdi)
	jne	.L85
	movq	.refptr.CONSTRUCTOR_NAME(%rip), %rax
	movq	8(%rdi), %rcx
	movq	(%rax), %rdx
	call	search_name
	xorl	%ecx, %ecx
	movq	%rbx, %rdx
	xorl	%r9d, %r9d
	movq	%rcx, 32(%rsp)
	movq	%rax, %r8
	movl	$2, %ecx
	movq	%rax, %rdi
	call	create_variable_access
	movq	%rax, %rbx
	testq	%rdi, %rdi
	jne	.L85
.L84:
	movq	128(%rsp), %rcx
	movl	$1, %edx
	leaq	.LC14(%rip), %r14
	call	get_next_token
	movq	%rax, %r12
	call	create_list
	movq	%rax, %r13
.L87:
	cmpl	$5, 24(%r12)
	je	.L158
.L93:
	movq	136(%rsp), %rdx
	movq	128(%rsp), %rcx
	movq	%rsi, %r8
	call	parse_expression
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L88
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%r12, %rdx
	movq	%r14, %rcx
	movq	%rax, %r8
	call	parser_error
.L88:
	movq	%r15, %rdx
	movq	%r13, %rcx
	call	list_append
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	je	.L89
.L92:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%r12, %rdx
	leaq	.LC15(%rip), %rcx
	movq	%rax, %r8
.L157:
	call	parser_error
	jmp	.L77
.L103:
	testq	%rdi, %rdi
	je	.L80
	movq	(%rdi), %r12
	testq	%r12, %r12
	cmove	%rdi, %r12
.L80:
	testq	%r13, %r13
	je	.L159
.L81:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L160
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L95
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	136(%rsp), %rdx
	movq	128(%rsp), %rcx
	movq	%rsi, %r8
	movq	%rax, %r14
	call	parse_expression
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L96
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%r14, %rdx
	leaq	.LC16(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L96:
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r14
	jne	.L98
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L98
	xorl	%edx, %edx
	movq	%r15, %r9
	xorl	%r8d, %r8d
	movl	$3, %ecx
	movq	%rdx, 32(%rsp)
	movq	%rbx, %rdx
	call	create_variable_access
	movq	%rax, %rbx
.L94:
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	peek_next_token
	movq	%rax, %r14
.L79:
	cmpl	$5, 24(%r14)
	je	.L103
	jmp	.L104
.L159:
	testq	%r12, %r12
	je	.L81
	cmpl	$0, 32(%r12)
	jne	.L81
	movq	8(%r12), %r13
	jmp	.L81
.L160:
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %r12
	testq	%rdi, %rdi
	jne	.L83
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%r12, %rdx
	leaq	.LC12(%rip), %rcx
	movq	%rax, %r8
	jmp	.L155
.L85:
	cmpl	$1, 32(%rdi)
	je	.L84
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%r12, %rdx
	leaq	.LC13(%rip), %rcx
	movq	%rax, %r8
.L155:
	call	parser_error
	jmp	.L84
.L89:
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L90
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %r12
	jmp	.L87
.L90:
	cmpl	$5, 24(%r12)
	jne	.L92
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L87
	jmp	.L92
.L158:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L93
	movq	%r13, 32(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rbx, %rdx
	movl	$1, %ecx
	call	create_variable_access
	movq	(%rdi), %rdi
	movq	%rax, %rbx
	cmpl	$0, 32(%rdi)
	jne	.L109
	movq	8(%rdi), %r13
	jmp	.L156
.L98:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%r14, %rdx
	leaq	.LC17(%rip), %rcx
	movq	%rax, %r8
	jmp	.L157
.L95:
	movq	.refptr.DOT_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L99
.L104:
	testq	%rbx, %rbx
	je	.L77
	xorl	%r9d, %r9d
	xorl	%edi, %edi
	xorl	%edx, %edx
	movl	$8, %ebp
	jmp	.L58
.L99:
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %r12
	testq	%r13, %r13
	jne	.L100
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%r12, %rdx
	leaq	.LC18(%rip), %rcx
	movq	%rax, %r8
	jmp	.L157
.L100:
	cmpl	$1, 24(%rax)
	je	.L101
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%r12, %rdx
	leaq	.LC19(%rip), %rcx
	movq	%rax, %r8
	jmp	.L157
.L101:
	movq	(%rax), %rdx
	movq	%r13, %rcx
	call	search_name
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L102
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%r12, %rdx
	leaq	.LC20(%rip), %rcx
	movq	%rax, %r8
	jmp	.L157
.L102:
	xorl	%eax, %eax
	movq	%rbx, %rdx
	xorl	%r9d, %r9d
	movq	%rdi, %r8
	movq	%rax, 32(%rsp)
	movl	$2, %ecx
	call	create_variable_access
	movq	%rax, %rbx
.L109:
	xorl	%r13d, %r13d
.L156:
	xorl	%r12d, %r12d
	jmp	.L94
.L77:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC21(%rip), %rcx
	movq	%rax, %r8
	jmp	.L154
.L74:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC22(%rip), %rcx
	movq	%rax, %r8
	jmp	.L154
.L56:
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
	jne	.L162
	movq	%rax, %rsi
	movq	.refptr.IF_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L163
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L164
.L166:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC23(%rip), %rcx
	movq	%rax, %r8
	jmp	.L336
.L164:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L166
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
	jne	.L167
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC24(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L167:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L168
.L169:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC25(%rip), %rcx
	movq	%rax, %r8
.L336:
	call	parser_error
	xorl	%edx, %edx
	jmp	.L191
.L168:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L169
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L170
.L171:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC26(%rip), %rcx
	movq	%rax, %r8
	jmp	.L336
.L170:
	movq	.refptr.L_BRACE_SYMBOL(%rip), %r14
	movq	(%rax), %rcx
	movq	(%r14), %rdx
	call	string_equal
	testb	%al, %al
	je	.L171
	call	create_list
	movq	160(%rsp), %rcx
	movl	$1, %edx
	leaq	.LC27(%rip), %rbp
	movq	%rax, 56(%rsp)
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12
	movq	%rax, %rsi
.L172:
	cmpl	$5, 24(%rsi)
	je	.L342
.L174:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_statement
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L173
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	movq	%rbp, %rcx
	movq	%rax, %r8
	call	parser_error
.L173:
	movq	56(%rsp), %rcx
	movq	%r13, %rdx
	call	list_append
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rsi
	jmp	.L172
.L342:
	movq	(%r12), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L174
	call	create_list
	leaq	.LC32(%rip), %r15
	movq	%rax, 64(%rsp)
	call	create_list
	movq	160(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, 72(%rsp)
	call	peek_next_token
	movq	%rax, %rsi
.L175:
	cmpl	$6, 24(%rsi)
	jne	.L187
	movq	.refptr.ELIF_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L343
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L176
.L177:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC28(%rip), %rcx
	movq	%rax, %r8
	jmp	.L336
.L176:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L177
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
	jne	.L178
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC29(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L178:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L179
.L180:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC30(%rip), %rcx
	movq	%rax, %r8
	jmp	.L336
.L179:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L180
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L181
.L182:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC31(%rip), %rcx
	movq	%rax, %r8
	jmp	.L336
.L181:
	movq	(%r14), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	je	.L182
	call	create_list
	movq	%rax, %r13
.L335:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L344
.L185:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_statement
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L184
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	movq	%r15, %rcx
	movq	%rax, %r8
	call	parser_error
.L184:
	movq	%rbp, %rdx
	movq	%r13, %rcx
	call	list_append
	jmp	.L335
.L344:
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L185
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
	jmp	.L175
.L343:
	cmpl	$6, 24(%rsi)
	jne	.L187
	movq	.refptr.ELSE_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L345
.L187:
	movq	160(%rsp), %rcx
	call	peek_current_token
	movq	56(%rsp), %rdx
	movq	72(%rsp), %r9
	movq	%rdi, %rcx
	movq	64(%rsp), %r8
	call	create_if
	movq	%rax, %rdx
	jmp	.L191
.L345:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L192
.L193:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC33(%rip), %rcx
	movq	%rax, %r8
	jmp	.L336
.L192:
	movq	(%r14), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	je	.L193
	movq	160(%rsp), %rcx
	movl	$1, %edx
	leaq	.LC34(%rip), %r12
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r13
	movq	%rax, %rsi
.L194:
	cmpl	$5, 24(%rsi)
	je	.L346
.L196:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L195
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	movq	%r12, %rcx
	movq	%rax, %r8
	call	parser_error
.L195:
	movq	72(%rsp), %rcx
	movq	%r14, %rdx
	call	list_append
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rsi
	jmp	.L194
.L346:
	movq	0(%r13), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L196
	jmp	.L187
.L191:
	xorl	%edi, %edi
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ecx
	movq	%rdi, 40(%rsp)
	movq	%rdi, 32(%rsp)
	jmp	.L341
.L163:
	movq	.refptr.FOR_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L198
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L199
.L201:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC35(%rip), %rcx
	movq	%rax, %r8
	jmp	.L337
.L199:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L201
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L202
.L205:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_variable
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L204
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC36(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L204
.L202:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	xorl	%edi, %edi
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L206
	jmp	.L205
.L204:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rsi
.L206:
	cmpl	$5, 24(%rsi)
	je	.L207
.L209:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC37(%rip), %rcx
	movq	%rax, %r8
.L337:
	call	parser_error
	xorl	%r9d, %r9d
	jmp	.L208
.L207:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %r12
	movq	(%rsi), %rcx
	movq	(%r12), %rdx
	call	string_equal
	testb	%al, %al
	je	.L209
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L210
.L213:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L212
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC38(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L212
.L210:
	movq	(%r12), %rdx
	movq	(%rax), %rcx
	xorl	%ebp, %ebp
	call	string_equal
	testb	%al, %al
	jne	.L214
	jmp	.L213
.L212:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rsi
.L214:
	cmpl	$5, 24(%rsi)
	je	.L215
.L216:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC39(%rip), %rcx
	movq	%rax, %r8
	jmp	.L337
.L215:
	movq	(%r12), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L216
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L217
.L220:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_expression
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L219
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC40(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L219
.L217:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	xorl	%r12d, %r12d
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L221
	jmp	.L220
.L219:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rsi
.L221:
	cmpl	$5, 24(%rsi)
	je	.L222
.L223:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC41(%rip), %rcx
	movq	%rax, %r8
	jmp	.L337
.L222:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L223
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L224
.L225:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC42(%rip), %rcx
	movq	%rax, %r8
	jmp	.L337
.L224:
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L225
	call	create_list
	movb	$1, 10(%rbx)
	movq	160(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, %r13
	leaq	.LC43(%rip), %r14
	call	get_next_token
	movq	%rax, %rsi
.L226:
	cmpl	$5, 24(%rsi)
	je	.L347
.L228:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L227
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	movq	%r14, %rcx
	movq	%rax, %r8
	call	parser_error
.L227:
	movq	%r15, %rdx
	movq	%r13, %rcx
	call	list_append
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rsi
	jmp	.L226
.L347:
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L228
	movb	$0, 10(%rbx)
	movq	%r13, %r9
	movq	%r12, %r8
	movq	%rbp, %rdx
	movq	%rdi, %rcx
	call	create_for
	movq	%rax, %r9
.L208:
	xorl	%esi, %esi
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$4, %ecx
	movq	%rsi, 40(%rsp)
	movq	%rsi, 32(%rsp)
.L341:
	call	create_statement
	movq	%rax, %rsi
	jmp	.L161
.L198:
	movq	.refptr.WHILE_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L229
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L230
.L232:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC44(%rip), %rcx
	movq	%rax, %r8
	jmp	.L338
.L230:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L232
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
	jne	.L233
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC45(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L233:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L234
.L236:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC46(%rip), %rcx
	movq	%rax, %r8
.L338:
	call	parser_error
	xorl	%r8d, %r8d
	jmp	.L235
.L234:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L236
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L237
.L238:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC47(%rip), %rcx
	movq	%rax, %r8
	jmp	.L338
.L237:
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L238
	call	create_list
	movb	$1, 10(%rbx)
	movq	160(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, %rbp
	leaq	.LC48(%rip), %r13
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12
	movq	%rax, %rsi
.L239:
	cmpl	$5, 24(%rsi)
	je	.L348
.L241:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L240
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	movq	%r13, %rcx
	movq	%rax, %r8
	call	parser_error
.L240:
	movq	%r14, %rdx
	movq	%rbp, %rcx
	call	list_append
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rsi
	jmp	.L239
.L348:
	movq	(%r12), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L241
	movb	$0, 10(%rbx)
	movq	%rbp, %rdx
	movq	%rdi, %rcx
	call	create_while
	movq	%rax, %r8
.L235:
	xorl	%ebx, %ebx
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$3, %ecx
	movq	%rbx, 40(%rsp)
	movq	%rbx, 32(%rsp)
	jmp	.L341
.L229:
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L242
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
	jmp	.L340
.L242:
	movq	.refptr.RETURN_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L244
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L245
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rdx
	movq	(%rax), %rcx
	movq	(%rdx), %rdx
	call	string_equal
	testb	%al, %al
	je	.L245
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%r10, 40(%rsp)
	movl	$5, %ecx
	movq	%r10, 32(%rsp)
	jmp	.L341
.L245:
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
	jmp	.L340
.L244:
	movq	.refptr.BREAK_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L246
	cmpb	$0, 10(%rbx)
	jne	.L247
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC49(%rip), %rcx
	movq	%rax, %r8
	jmp	.L339
.L247:
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$6, %ecx
	movq	%r8, 40(%rsp)
	movq	%r8, 32(%rsp)
	xorl	%r8d, %r8d
	jmp	.L340
.L246:
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L162
	cmpb	$0, 10(%rbx)
	jne	.L250
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC50(%rip), %rcx
	movq	%rax, %r8
.L339:
	call	parser_error
	xorl	%esi, %esi
	jmp	.L161
.L250:
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rcx, 40(%rsp)
	movq	%rcx, 32(%rsp)
	movl	$7, %ecx
	jmp	.L340
.L162:
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
.L340:
	call	create_statement
	movq	160(%rsp), %rcx
	movq	%rax, %rsi
	call	peek_current_token
	movq	%rax, %rdi
	testq	%rsi, %rsi
	jne	.L251
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC51(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L251:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rdi
	je	.L252
.L254:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC52(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L161
.L252:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rdi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L254
.L161:
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
	.ascii "Failed to import module '%s' from source '%s'\12\0"
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
	.ascii "Expected ';' after class variable declaration\0"
.LC86:
	.ascii "Unexpected token in class member\0"
.LC87:
	.ascii "Constructor name conflicts with existing member\0"
.LC88:
	.ascii "Failed to parse class declaration\0"
.LC89:
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
	subq	$136, %rsp
	movq	.refptr.builtin_scope(%rip), %rsi
	movq	%rcx, 56(%rsp)
	cmpq	$0, (%rsi)
	jne	.L350
	xorl	%ecx, %ecx
	call	create_symbol_table
	xorl	%r8d, %r8d
	movl	$5, %edx
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
	movl	$5, %edx
	movq	(%rax), %rcx
	call	create_symbol
	movq	.refptr.name_int(%rip), %rdx
	movq	(%rsi), %r9
	xorl	%r8d, %r8d
	movq	%rax, (%rdx)
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	movl	$5, %edx
	movq	(%rax), %rcx
	call	create_symbol
	movq	.refptr.name_float(%rip), %rdx
	movq	(%rsi), %r9
	xorl	%r8d, %r8d
	movq	%rax, (%rdx)
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	movl	$5, %edx
	movq	(%rax), %rcx
	call	create_symbol
	movq	.refptr.name_string(%rip), %rdx
	movq	(%rsi), %r9
	xorl	%r8d, %r8d
	movq	%rax, (%rdx)
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	movl	$5, %edx
	movq	(%rax), %rcx
	call	create_symbol
	movq	.refptr.name_bool(%rip), %rdx
	movq	%rax, (%rdx)
.L350:
	testq	%rdi, %rdi
	jne	.L351
	movq	(%rsi), %rdi
.L351:
	call	create_list
	movq	%rdi, %rcx
	movq	%rax, 80(%rsp)
	call	create_symbol_table
	movq	%rax, 72(%rsp)
.L365:
	movq	56(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L442
	movl	24(%rax), %eax
	testl	%eax, %eax
	je	.L442
	cmpl	$6, %eax
	jne	.L394
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax
	movq	0(%r13), %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edi
	testb	%al, %al
	je	.L354
	movq	56(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rsi
	je	.L355
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC53(%rip), %rcx
	movq	%rax, %r8
	jmp	.L518
.L355:
	movq	56(%rsp), %rcx
	movl	$1, %edx
	movq	(%rax), %rdi
	call	get_next_token
	cmpl	$6, 24(%rax)
	movq	%rax, %rbp
	jne	.L357
	movq	.refptr.FROM_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L358
.L357:
	xorl	%esi, %esi
	jmp	.L359
.L358:
	movq	56(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$4, 24(%rax)
	movq	%rax, %rsi
	je	.L360
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC54(%rip), %rcx
	movq	%rax, %r8
.L518:
	call	parser_error
	jmp	.L356
.L360:
	movq	56(%rsp), %rcx
	movl	$1, %edx
	movq	(%rax), %rsi
	call	get_next_token
	movq	%rax, %rbp
.L359:
	cmpl	$5, 24(%rbp)
	je	.L361
.L362:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC55(%rip), %rcx
	movq	%rax, %r8
	jmp	.L518
.L361:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L362
	movq	(%rbx), %r9
	movq	72(%rsp), %r8
	movq	%rsi, %rdx
	movq	%rdi, %rcx
	call	parse_import_file
	testq	%rax, %rax
	jne	.L363
	call	__getreent
	movq	%rsi, %r9
	movq	%rdi, %r8
	leaq	.LC56(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	movq	.refptr.name_void(%rip), %rax
	movq	72(%rsp), %r9
	movq	%rdi, %rcx
	movl	$2, %edx
	movq	(%rax), %r8
	call	create_symbol
.L363:
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	create_import
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L364
.L356:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC57(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%edx, %edx
.L364:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	jmp	.L525
.L354:
	cmpl	$6, 24(%r13)
	jne	.L394
	movq	.refptr.FUNC_KEYWORD(%rip), %rax
	movq	0(%r13), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L366
	movq	72(%rsp), %rcx
	call	create_symbol_table
	movq	56(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, %r15
	call	get_next_token
	movq	%rax, %rsi
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L367
	cmpl	$6, %eax
	je	.L368
.L370:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC58(%rip), %rcx
	movq	%rax, %r8
	jmp	.L520
.L368:
	movq	(%rsi), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L370
.L367:
	movq	(%rsi), %rdx
	movq	72(%rsp), %rcx
	call	search_name
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L371
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC59(%rip), %rcx
	movq	%rax, %r8
	jmp	.L520
.L371:
	movq	56(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rsi
	je	.L372
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC60(%rip), %rcx
	movq	%rax, %r8
.L520:
	call	parser_error
	jmp	.L369
.L372:
	movq	(%rax), %rcx
	movq	%r15, %r9
	movq	%rbp, %r8
	movl	$1, %edx
	call	create_symbol
	movq	56(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, 96(%rsp)
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L373
.L374:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC61(%rip), %rcx
	movq	%rax, %r8
	jmp	.L520
.L373:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L374
	movq	56(%rsp), %rcx
	movl	$1, %edx
	leaq	.LC63(%rip), %r14
	leaq	.LC62(%rip), %r12
	call	get_next_token
	movq	%rax, %rsi
	call	create_list
	movq	%rax, 64(%rsp)
.L375:
	cmpl	$5, 24(%rsi)
	je	.L526
.L383:
	movq	56(%rsp), %rcx
	movq	%r15, %rdx
	movq	%rbx, %r8
	call	parse_variable
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L376
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	movq	%r12, %rcx
	movq	%rax, %r8
	jmp	.L519
.L376:
	cmpq	$0, 16(%rax)
	je	.L378
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	movq	%r14, %rcx
	movq	%rax, %r8
.L519:
	call	parser_error
	jmp	.L377
.L378:
	movq	64(%rsp), %rcx
	call	list_append
.L377:
	movq	56(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L379
.L382:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC64(%rip), %rcx
	movq	%rax, %r8
	jmp	.L520
.L379:
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L380
	movq	56(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rsi
	jmp	.L375
.L380:
	cmpl	$5, 24(%rsi)
	jne	.L382
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L375
	jmp	.L382
.L526:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L383
	movq	56(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L384
.L385:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC65(%rip), %rcx
	movq	%rax, %r8
	jmp	.L520
.L384:
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L385
	call	create_list
	movb	$1, 8(%rbx)
	movq	56(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, 88(%rsp)
	leaq	.LC67(%rip), %r14
	call	get_next_token
	movq	%rax, %rsi
.L386:
	cmpl	$5, 24(%rsi)
	je	.L527
.L391:
	movq	56(%rsp), %rcx
	movq	%rbx, %r8
	movq	%r15, %rdx
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L387
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC66(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L390
.L387:
	testb	%dil, %dil
	je	.L389
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	movq	%r14, %rcx
	movq	%rax, %r8
	call	parser_error
.L389:
	cmpl	$5, 8(%r12)
	movb	$1, %al
	cmove	%eax, %edi
.L390:
	movq	88(%rsp), %rcx
	movq	%r12, %rdx
	call	list_append
	movq	56(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rsi
	jmp	.L386
.L527:
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L391
	movb	$0, 8(%rbx)
	testb	%dil, %dil
	jne	.L392
	movq	.refptr.name_void(%rip), %rax
	cmpq	(%rax), %rbp
	je	.L392
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC68(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L392:
	movq	%r15, 32(%rsp)
	movq	64(%rsp), %r8
	movq	%rbp, %rdx
	movq	88(%rsp), %r9
	movq	96(%rsp), %rcx
	call	create_function
	movq	%rax, %r8
	testq	%rax, %rax
	jne	.L393
.L369:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC69(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%r8d, %r8d
.L393:
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$1, %ecx
	jmp	.L525
.L366:
	cmpl	$6, 24(%r13)
	jne	.L394
	movq	.refptr.CLASS_KEYWORD(%rip), %rax
	movq	0(%r13), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L394
	movq	72(%rsp), %rcx
	call	create_symbol_table
	movq	56(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, 64(%rsp)
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rsi
	je	.L395
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC70(%rip), %rcx
	movq	%rax, %r8
	jmp	.L524
.L395:
	movq	64(%rsp), %r9
	movq	(%rax), %rcx
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	call	create_symbol
	movq	56(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, 88(%rsp)
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L397
.L398:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC71(%rip), %rcx
	movq	%rax, %r8
.L524:
	call	parser_error
	jmp	.L396
.L397:
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L398
	call	create_list
	movq	%rax, 96(%rsp)
.L434:
	movq	56(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L528
.L438:
	cmpl	$6, 24(%rsi)
	jne	.L400
	movq	.refptr.METHOD_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L401
	movq	64(%rsp), %rcx
	call	create_symbol_table
	movq	88(%rsp), %r8
	movl	$2, %edx
	movq	%rax, %r9
	movq	%rax, %r15
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rcx
	call	create_symbol
	movq	56(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, %rbp
	call	get_next_token
	movq	%rax, %rdi
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L402
	cmpl	$6, %eax
	je	.L403
.L405:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC72(%rip), %rcx
	movq	%rax, %r8
	jmp	.L522
.L403:
	movq	(%rdi), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L405
.L402:
	movq	(%rdi), %rdx
	movq	64(%rsp), %rcx
	call	search_name
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L406
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC73(%rip), %rcx
	movq	%rax, %r8
	jmp	.L522
.L406:
	movq	56(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rdi
	je	.L407
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC74(%rip), %rcx
	movq	%rax, %r8
.L522:
	call	parser_error
	jmp	.L404
.L407:
	movq	(%rax), %rcx
	movq	%r15, %r9
	movq	%r14, %r8
	movl	$1, %edx
	call	create_symbol
	movq	56(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, 120(%rsp)
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rdi
	je	.L408
.L409:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC75(%rip), %rcx
	movq	%rax, %r8
	jmp	.L522
.L408:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rdi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L409
	movq	56(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$6, 24(%rax)
	movq	%rax, %rdi
	je	.L410
.L412:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC76(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L411
.L410:
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rdi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L412
.L411:
	movq	56(%rsp), %rcx
	movl	$1, %edx
	leaq	.LC79(%rip), %r12
	call	get_next_token
	movq	%rax, %rdi
	call	create_list
	movq	88(%rsp), %rcx
	movq	%rbp, %rdx
	xorl	%r8d, %r8d
	movq	%rax, 104(%rsp)
	call	create_variable
	movq	104(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rbp
.L413:
	cmpl	$5, 24(%rdi)
	je	.L529
.L419:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC77(%rip), %rcx
	movq	%rax, %r8
	jmp	.L522
.L529:
	movq	0(%rbp), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L425
	cmpl	$5, 24(%rdi)
	jne	.L419
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%rdi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L415
	movq	56(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	56(%rsp), %rcx
	movq	%r15, %rdx
	movq	%rbx, %r8
	movq	%rax, %rdi
	call	parse_variable
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L515
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC78(%rip), %rcx
	movq	%rax, %r8
	jmp	.L521
.L415:
	cmpl	$5, 24(%rdi)
	jne	.L419
	movq	0(%rbp), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L419
.L425:
	movq	56(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rdi
	je	.L516
	jmp	.L420
.L515:
	cmpq	$0, 16(%rax)
	je	.L423
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	movq	%r12, %rcx
	movq	%rax, %r8
.L521:
	call	parser_error
	jmp	.L422
.L423:
	movq	104(%rsp), %rcx
	call	list_append
.L422:
	movq	56(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rdi
	jmp	.L413
.L420:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC80(%rip), %rcx
	movq	%rax, %r8
	jmp	.L522
.L516:
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rdi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L420
	call	create_list
	movw	$257, 8(%rbx)
	movq	56(%rsp), %rcx
	xorl	%r12d, %r12d
	movl	$1, %edx
	movq	%rax, 112(%rsp)
	call	get_next_token
	movq	%rax, %rdi
.L426:
	cmpl	$5, 24(%rdi)
	je	.L530
.L431:
	movq	56(%rsp), %rcx
	movq	%rbx, %r8
	movq	%r15, %rdx
	call	parse_statement
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L427
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC81(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L430
.L427:
	testb	%r12b, %r12b
	je	.L429
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC67(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L429:
	cmpl	$5, 8(%rbp)
	movb	$1, %al
	cmove	%eax, %r12d
.L430:
	movq	112(%rsp), %rcx
	movq	%rbp, %rdx
	call	list_append
	movq	56(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rdi
	jmp	.L426
.L530:
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rdi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L431
	movw	$0, 8(%rbx)
	testb	%r12b, %r12b
	jne	.L432
	movq	.refptr.name_void(%rip), %rax
	cmpq	(%rax), %r14
	je	.L432
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC82(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L432:
	movq	%r15, 32(%rsp)
	movq	112(%rsp), %r9
	movq	%r14, %rdx
	movq	104(%rsp), %r8
	movq	120(%rsp), %rcx
	call	create_method
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L433
.L404:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC83(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%edx, %edx
.L433:
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	call	create_class_member
	movq	96(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L434
.L401:
	cmpl	$6, 24(%rsi)
	jne	.L400
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L400
	movq	56(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	64(%rsp), %rdx
	movq	56(%rsp), %rcx
	movq	%rbx, %r8
	movq	%rax, %rsi
	call	parse_variable
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L435
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC84(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L435:
	movq	%rdi, %r8
	xorl	%edx, %edx
	movl	$1, %ecx
	call	create_class_member
	movq	96(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	56(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L436
.L437:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC85(%rip), %rcx
	movq	%rax, %r8
	jmp	.L523
.L436:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L437
	jmp	.L434
.L400:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC86(%rip), %rcx
	movq	%rax, %r8
.L523:
	call	parser_error
	jmp	.L434
.L528:
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L438
	movq	.refptr.CONSTRUCTOR_NAME(%rip), %rdi
	movq	64(%rsp), %rcx
	movq	(%rdi), %rdx
	call	search_name
	testq	%rax, %rax
	jne	.L439
	movq	64(%rsp), %rcx
	call	create_symbol_table
	movq	88(%rsp), %r8
	movq	(%rdi), %rcx
	movl	$1, %edx
	movq	%rax, %r9
	call	create_symbol
.L439:
	cmpl	$1, 32(%rax)
	je	.L440
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC87(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L440:
	movq	64(%rsp), %r8
	movq	96(%rsp), %rdx
	movq	88(%rsp), %rcx
	call	create_class
	movq	%rax, %r9
	testq	%rax, %rax
	jne	.L441
.L396:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC88(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%r9d, %r9d
.L441:
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$2, %ecx
.L525:
	call	create_code_member
	movq	80(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L365
.L442:
	movq	72(%rsp), %rdx
	movq	80(%rsp), %rcx
	addq	$136, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	create_code
.L394:
	movq	(%rbx), %rcx
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC89(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L365
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
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	create_else_if;	.scl	2;	.type	32;	.endef
	.def	create_if;	.scl	2;	.type	32;	.endef
	.def	create_for;	.scl	2;	.type	32;	.endef
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.def	create_while;	.scl	2;	.type	32;	.endef
	.def	create_symbol_table;	.scl	2;	.type	32;	.endef
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	create_import;	.scl	2;	.type	32;	.endef
	.def	create_function;	.scl	2;	.type	32;	.endef
	.def	create_method;	.scl	2;	.type	32;	.endef
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.def	create_class;	.scl	2;	.type	32;	.endef
	.def	create_code_member;	.scl	2;	.type	32;	.endef
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
	.section	.rdata$.refptr.CONSTRUCTOR_NAME, "dr"
	.globl	.refptr.CONSTRUCTOR_NAME
	.linkonce	discard
.refptr.CONSTRUCTOR_NAME:
	.quad	CONSTRUCTOR_NAME
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
