	.file	"D:\\TC\\src\\parser.c"
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Failed to parse parenthesized expression\0"
.LC1:
	.ascii "Expected ')' after expression\0"
	.align 8
.LC2:
	.ascii "Failed to parse operand of unary '!'\0"
	.align 8
.LC3:
	.ascii "Failed to parse operand of unary '-'\0"
	.align 8
.LC4:
	.ascii "Failed to parse variable access\0"
	.align 8
.LC5:
	.ascii "Unexpected token in primary expression\0"
	.align 8
.LC6:
	.ascii "Failed to parse expression primary\0"
	.text
	.p2align 4
	.def	parse_expression;	.scl	3;	.type	32;	.endef
parse_expression:
	pushq	%r12
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rdi
	movq	%r8, %rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	subq	$64, %rsp
	call	peek_current_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$2, %eax
	je	.L54
	cmpl	$3, %eax
	je	.L55
	cmpl	$4, %eax
	je	.L56
	cmpl	$6, %eax
	je	.L57
.L6:
	cmpl	$5, %eax
	je	.L10
	cmpl	$1, %eax
	je	.L12
.L13:
	movq	%rbx, %rdx
	leaq	.LC5(%rip), %rcx
	call	parser_error
.L16:
	movq	%rsi, %rcx
	call	peek_current_token
	leaq	.LC6(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
	xorl	%eax, %eax
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L55:
	movq	(%rbx), %rdx
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$1, %ebx
.L3:
	movq	%rax, 32(%rsp)
	movl	%ebx, %ecx
	call	create_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L16
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rdi, 32(%rsp)
	movq	%rbp, %r9
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movq	%rsi, %rcx
	call	parse_expr_prec
.L1:
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L54:
	movq	(%rbx), %rdx
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ebx, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L56:
	movq	(%rbx), %rdx
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L57:
	movq	.refptr.TRUE_KEYWORD(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L58
	movl	24(%rbx), %eax
	cmpl	$6, %eax
	jne	.L6
	movq	.refptr.FALSE_KEYWORD(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L9
	movl	24(%rbx), %eax
	cmpl	$5, %eax
	jne	.L20
	.p2align 4,,10
	.p2align 3
.L10:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L59
	movl	24(%rbx), %eax
	cmpl	$5, %eax
	jne	.L20
	movq	.refptr.NOT_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L60
	movl	24(%rbx), %eax
	cmpl	$5, %eax
	jne	.L20
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L21
	movl	24(%rbx), %eax
.L20:
	cmpl	$1, %eax
	je	.L12
	cmpl	$6, %eax
	jne	.L13
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L13
	cmpb	$0, 1(%rdi)
	je	.L13
.L12:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rsi, %rcx
	call	parse_variable_access
	testq	%rax, %rax
	je	.L23
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$8, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L58:
	movq	(%rbx), %rdx
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$3, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L9:
	movq	(%rbx), %rdx
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$4, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L59:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rsi, %rcx
	movq	%rax, %rbx
	call	parse_expression
	testq	%rax, %rax
	je	.L61
	movl	$1, %edx
	movq	%rsi, %rcx
	movq	%rax, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r8
	movl	24(%rax), %ebx
	movq	%rax, %r12
	cmpl	$5, %ebx
	jne	.L18
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%r12), %rcx
	movq	%r8, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L18
	movq	56(%rsp), %r8
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L60:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rsi, %rcx
	movq	%rax, %rbx
	call	parse_primary
	movq	%rax, %r9
	testq	%rax, %rax
	je	.L62
	xorl	%eax, %eax
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$6, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L21:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rsi, %rcx
	movq	%rax, %rbx
	call	parse_primary
	movq	%rax, %r9
	testq	%rax, %rax
	je	.L63
	xorl	%eax, %eax
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$7, %ebx
	jmp	.L3
.L18:
	movq	%r12, %rdx
	leaq	.LC1(%rip), %rcx
	call	parser_error
	jmp	.L16
.L23:
	movq	%rbx, %rdx
	leaq	.LC4(%rip), %rcx
	call	parser_error
	jmp	.L16
.L61:
	movq	%rbx, %rdx
	leaq	.LC0(%rip), %rcx
	call	parser_error
	jmp	.L16
.L62:
	movq	%rbx, %rdx
	leaq	.LC2(%rip), %rcx
	call	parser_error
	jmp	.L16
.L63:
	movq	%rbx, %rdx
	leaq	.LC3(%rip), %rcx
	call	parser_error
	jmp	.L16
	.p2align 4
	.def	parse_primary;	.scl	3;	.type	32;	.endef
parse_primary:
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rdi
	movq	%r8, %rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	subq	$72, %rsp
	call	peek_current_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$2, %eax
	je	.L115
	cmpl	$3, %eax
	je	.L116
	cmpl	$4, %eax
	je	.L117
	cmpl	$6, %eax
	je	.L118
.L69:
	cmpl	$5, %eax
	je	.L73
	cmpl	$1, %eax
	je	.L75
.L76:
	movq	%rbx, %rdx
	leaq	.LC5(%rip), %rcx
	call	parser_error
	xorl	%eax, %eax
	jmp	.L64
	.p2align 4,,10
	.p2align 3
.L116:
	movq	(%rbx), %rdx
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$1, %ebx
.L66:
	movq	%rax, 32(%rsp)
	movl	%ebx, %ecx
	call	create_primary
.L64:
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L115:
	movq	(%rbx), %rdx
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ebx, %ebx
	jmp	.L66
	.p2align 4,,10
	.p2align 3
.L117:
	movq	(%rbx), %rdx
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ebx
	jmp	.L66
	.p2align 4,,10
	.p2align 3
.L118:
	movq	.refptr.TRUE_KEYWORD(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L119
	movl	24(%rbx), %eax
	cmpl	$6, %eax
	jne	.L69
	movq	.refptr.FALSE_KEYWORD(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L72
	movl	24(%rbx), %eax
	cmpl	$5, %eax
	jne	.L84
	.p2align 4,,10
	.p2align 3
.L73:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L120
	movl	24(%rbx), %eax
	cmpl	$5, %eax
	jne	.L84
	movq	.refptr.NOT_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L121
	movl	24(%rbx), %eax
	cmpl	$5, %eax
	jne	.L84
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L85
	movl	24(%rbx), %eax
.L84:
	cmpl	$1, %eax
	je	.L75
	cmpl	$6, %eax
	jne	.L76
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L76
	cmpb	$0, 1(%rdi)
	je	.L76
.L75:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rsi, %rcx
	call	parse_variable_access
	testq	%rax, %rax
	je	.L87
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$8, %ebx
	jmp	.L66
	.p2align 4,,10
	.p2align 3
.L119:
	movq	(%rbx), %rdx
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$3, %ebx
	jmp	.L66
	.p2align 4,,10
	.p2align 3
.L72:
	movq	(%rbx), %rdx
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$4, %ebx
	jmp	.L66
	.p2align 4,,10
	.p2align 3
.L120:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rsi, %rcx
	movq	%rax, %rbx
	call	parse_expression
	testq	%rax, %rax
	je	.L122
	movq	%rsi, %rcx
	movl	$1, %edx
	movq	%rax, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r8
	movl	24(%rax), %ebx
	movq	%rax, %rsi
	cmpl	$5, %ebx
	jne	.L82
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	%r8, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L82
	movq	56(%rsp), %r8
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	jmp	.L66
	.p2align 4,,10
	.p2align 3
.L121:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rsi, %rcx
	movq	%rax, %rbx
	call	parse_primary
	movq	%rax, %r9
	testq	%rax, %rax
	je	.L123
	xorl	%eax, %eax
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$6, %ebx
	jmp	.L66
	.p2align 4,,10
	.p2align 3
.L85:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rsi, %rcx
	movq	%rax, %rbx
	call	parse_primary
	movq	%rax, %r9
	testq	%rax, %rax
	je	.L124
	xorl	%eax, %eax
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$7, %ebx
	jmp	.L66
.L82:
	movq	%rsi, %rdx
	leaq	.LC1(%rip), %rcx
	call	parser_error
	xorl	%eax, %eax
	jmp	.L64
.L87:
	movq	%rbx, %rdx
	leaq	.LC4(%rip), %rcx
	call	parser_error
	xorl	%eax, %eax
	jmp	.L64
.L122:
	movq	%rbx, %rdx
	leaq	.LC0(%rip), %rcx
	call	parser_error
	xorl	%eax, %eax
	jmp	.L64
.L123:
	movq	%rbx, %rdx
	leaq	.LC2(%rip), %rcx
	call	parser_error
	xorl	%eax, %eax
	jmp	.L64
.L124:
	movq	%rbx, %rdx
	leaq	.LC3(%rip), %rcx
	call	parser_error
	xorl	%eax, %eax
	jmp	.L64
	.section .rdata,"dr"
.LC7:
	.ascii "Failed to parse right operand\0"
	.text
	.p2align 4
	.def	parse_expr_prec;	.scl	3;	.type	32;	.endef
parse_expr_prec:
	pushq	%r15
	pushq	%r14
	movl	%r8d, %r14d
	pushq	%r13
	movq	%r9, %r13
	pushq	%r12
	movq	%rdx, %r12
	movl	$1, %edx
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$56, %rsp
	call	peek_next_token
	cmpl	$5, 24(%rax)
	jne	.L126
.L133:
	movq	(%rax), %rcx
	call	string_to_operator
	movl	%eax, %ecx
	movl	%eax, %edi
	call	operator_precedence
	movl	%eax, %esi
	cmpl	$19, %edi
	je	.L126
	cmpl	%r14d, %eax
	jl	.L126
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	160(%rsp), %r8
	movq	%r13, %rdx
	movq	%rbx, %rcx
	movq	%rax, %rbp
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L140
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %rbp
.L139:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	jne	.L129
	movq	(%rax), %rcx
	call	string_to_operator
	movl	%eax, %r15d
	movl	%eax, %ecx
	call	operator_precedence
	cmpl	$19, %r15d
	je	.L129
	cmpl	%eax, %esi
	jge	.L129
	movq	160(%rsp), %rdx
	movq	%r13, %r9
	movl	%eax, %r8d
	movq	%rbx, %rcx
	movq	%rdx, 32(%rsp)
	movq	%rbp, %rdx
	call	parse_expr_prec
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L139
	xorl	%r12d, %r12d
	jmp	.L125
	.p2align 4,,10
	.p2align 3
.L129:
	xorl	%r8d, %r8d
	movq	%r12, %rdx
	movq	%rbp, %r9
	movl	%edi, %ecx
	call	create_expression
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r12
	call	peek_next_token
	cmpl	$5, 24(%rax)
	je	.L133
.L126:
	movq	%rbx, %rcx
	call	peek_current_token
.L125:
	addq	$56, %rsp
	movq	%r12, %rax
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
.L140:
	movq	%rbp, %rdx
	leaq	.LC7(%rip), %rcx
	xorl	%r12d, %r12d
	call	parser_error
	jmp	.L125
	.section .rdata,"dr"
	.align 8
.LC8:
	.ascii "Expected variable name in variable access\0"
	.align 8
.LC9:
	.ascii "Cannot call undefined variable\0"
	.align 8
.LC10:
	.ascii "Cannot call non-function variable\0"
	.align 8
.LC11:
	.ascii "Failed to parse function call argument\0"
	.align 8
.LC12:
	.ascii "Expected ',' or ')' after function call argument\0"
	.align 8
.LC13:
	.ascii "Failed to parse sequence index\0"
	.align 8
.LC14:
	.ascii "Expected ']' after sequence index\0"
	.align 8
.LC15:
	.ascii "Cannot access attribute without a valid scope\0"
	.align 8
.LC16:
	.ascii "Expected attribute name after '.'\0"
.LC17:
	.ascii "Unknown attribute name\0"
	.text
	.p2align 4
	.def	parse_variable_access;	.scl	3;	.type	32;	.endef
parse_variable_access:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	movq	%r8, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$72, %rsp
	call	peek_current_token
	movq	%rax, %rbp
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L142
	cmpl	$6, %eax
	jne	.L145
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L145
.L142:
	movq	0(%rbp), %rdx
	movq	%rsi, %rcx
	call	search
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	$0, 32(%rsp)
	movq	%rax, %r8
	movq	%rax, %rbp
	call	create_variable_access
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, 56(%rsp)
	call	peek_next_token
	movq	56(%rsp), %r9
	cmpl	$5, 24(%rax)
	movq	%rax, %r14
	jne	.L141
	xorl	%r12d, %r12d
	xorl	%r13d, %r13d
	movq	%r12, %r15
	movq	%r9, %r12
.L173:
	testq	%rbp, %rbp
	je	.L147
	movl	24(%rbp), %eax
	leal	-1(%rax), %edx
	cmpl	$2, %edx
	jbe	.L176
	cmpl	$5, %eax
	jne	.L148
.L176:
	movq	16(%rbp), %r13
.L147:
	testq	%r15, %r15
	jne	.L150
	testq	%r13, %r13
	je	.L150
	cmpl	$4, 24(%r13)
	jne	.L150
	movq	16(%r13), %r15
.L150:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L207
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L164
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rdi, %r8
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	movq	%rax, 56(%rsp)
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L208
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	parse_expr_prec
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L166
.L167:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r8
	jne	.L169
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax
	movq	(%r8), %rcx
	movq	%r8, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r8
	testb	%al, %al
	je	.L169
	movq	%r12, %rdx
	movq	%r14, %r9
	xorl	%r8d, %r8d
	movl	$3, %ecx
	movq	$0, 32(%rsp)
	call	create_variable_access
	movq	%rax, %r12
.L163:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r14
	je	.L173
.L205:
	movq	%r12, %r9
.L141:
	addq	$72, %rsp
	movq	%r9, %rax
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
.L164:
	movq	.refptr.DOT_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L205
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r13
	testq	%r15, %r15
	je	.L209
	cmpl	$1, 24(%rax)
	jne	.L210
	movq	(%rax), %rdx
	movq	%r15, %rcx
	call	search
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L211
	movq	%r12, %rdx
	xorl	%r9d, %r9d
	movq	%rax, %r8
	movl	$2, %ecx
	movq	$0, 32(%rsp)
	xorl	%r15d, %r15d
	xorl	%r13d, %r13d
	call	create_variable_access
	movq	%rax, %r12
	jmp	.L163
	.p2align 4,,10
	.p2align 3
.L207:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	testq	%rbp, %rbp
	je	.L212
.L152:
	movl	24(%rbp), %ecx
	subl	$2, %ecx
	cmpl	$1, %ecx
	ja	.L213
.L153:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r15
	call	create_list
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r13
	movq	%rax, %r14
	.p2align 4,,10
	.p2align 3
.L154:
	cmpl	$5, 24(%r15)
	je	.L214
.L162:
	movq	%rdi, %r8
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L215
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	parse_expr_prec
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L156
.L157:
	movq	%r14, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	je	.L158
.L161:
	movq	%r15, %rdx
	leaq	.LC12(%rip), %rcx
	call	parser_error
.L144:
	xorl	%r9d, %r9d
	jmp	.L141
	.p2align 4,,10
	.p2align 3
.L214:
	movq	0(%r13), %rdx
	movq	(%r15), %rcx
	call	string_equal
	testb	%al, %al
	je	.L162
	movq	%r14, 32(%rsp)
	movq	%r12, %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$1, %ecx
	xorl	%r15d, %r15d
	xorl	%r13d, %r13d
	call	create_variable_access
	movq	16(%rbp), %rbp
	movq	%rax, %r12
	jmp	.L163
	.p2align 4,,10
	.p2align 3
.L158:
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L216
	cmpl	$5, 24(%r15)
	jne	.L161
	movq	0(%r13), %rdx
	movq	(%r15), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L154
	jmp	.L161
	.p2align 4,,10
	.p2align 3
.L215:
	movq	%rbx, %rcx
	call	peek_current_token
	leaq	.LC6(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L156:
	movq	%r15, %rdx
	leaq	.LC11(%rip), %rcx
	call	parser_error
	xorl	%edx, %edx
	jmp	.L157
	.p2align 4,,10
	.p2align 3
.L216:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r15
	jmp	.L154
	.p2align 4,,10
	.p2align 3
.L213:
	movq	%rax, %rdx
	leaq	.LC10(%rip), %rcx
	call	parser_error
	jmp	.L153
	.p2align 4,,10
	.p2align 3
.L145:
	movq	%rbp, %rdx
	leaq	.LC8(%rip), %rcx
	call	parser_error
	jmp	.L144
	.p2align 4,,10
	.p2align 3
.L148:
	andl	$-5, %eax
	cmove	%rbp, %r13
	jmp	.L147
.L208:
	movq	%rbx, %rcx
	call	peek_current_token
	leaq	.LC6(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L166:
	movq	56(%rsp), %rdx
	leaq	.LC13(%rip), %rcx
	xorl	%r14d, %r14d
	call	parser_error
	jmp	.L167
	.p2align 4,,10
	.p2align 3
.L212:
	movq	%rax, %rdx
	leaq	.LC9(%rip), %rcx
	movq	%rax, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %rax
	jmp	.L152
.L169:
	movq	%r8, %rdx
	leaq	.LC14(%rip), %rcx
	call	parser_error
	jmp	.L144
.L209:
	movq	%rax, %rdx
	leaq	.LC15(%rip), %rcx
	call	parser_error
	jmp	.L144
.L211:
	movq	%r13, %rdx
	leaq	.LC17(%rip), %rcx
	call	parser_error
	jmp	.L144
.L210:
	movq	%rax, %rdx
	leaq	.LC16(%rip), %rcx
	call	parser_error
	jmp	.L144
	.section .rdata,"dr"
.LC18:
	.ascii "Expected variable type\0"
	.align 8
.LC19:
	.ascii "Expected a type for variable declaration\0"
.LC20:
	.ascii "Unknown variable type\0"
.LC21:
	.ascii "Expected variable name\0"
	.align 8
.LC22:
	.ascii "Failed to parse variable initializer\0"
	.text
	.p2align 4
	.def	parse_variable;	.scl	3;	.type	32;	.endef
parse_variable:
	pushq	%r13
	pushq	%r12
	movq	%r8, %r12
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	subq	$56, %rsp
	call	peek_current_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L218
	cmpl	$6, %eax
	jne	.L221
	movq	(%rbx), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L221
.L218:
	movq	(%rbx), %rdx
	movq	%rbp, %rcx
	call	search
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L222
	testl	$-5, 24(%rax)
	jne	.L245
.L223:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L246
.L224:
	movq	(%rbx), %rcx
	movq	%rbp, 32(%rsp)
	xorl	%r9d, %r9d
	movq	%rdi, %r8
	movl	$1, %edx
	call	create_name
	movl	$1, %edx
	movq	%rsi, %rcx
	movq	%rax, %rbx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	je	.L247
.L226:
	xorl	%r8d, %r8d
.L230:
	addq	$56, %rsp
	movq	%rbx, %rdx
	movq	%rdi, %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	create_variable
	.p2align 4,,10
	.p2align 3
.L246:
	movq	%rax, %rdx
	leaq	.LC21(%rip), %rcx
	call	parser_error
	jmp	.L224
	.p2align 4,,10
	.p2align 3
.L221:
	movq	%rbx, %rdx
	leaq	.LC18(%rip), %rcx
	call	parser_error
	addq	$56, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L245:
	movq	%rbx, %rdx
	leaq	.LC19(%rip), %rcx
	call	parser_error
	jmp	.L223
	.p2align 4,,10
	.p2align 3
.L247:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx
	movq	(%rax), %rcx
	movq	(%rdx), %rdx
	call	string_equal
	testb	%al, %al
	je	.L226
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%r12, %r8
	movq	%rbp, %rdx
	movq	%rsi, %rcx
	movq	%rax, %r13
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L248
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%r12, 32(%rsp)
	xorl	%r8d, %r8d
	movq	%rbp, %r9
	movq	%rax, %rdx
	movq	%rsi, %rcx
	call	parse_expr_prec
	movq	%rax, %r8
	testq	%rax, %rax
	jne	.L230
.L229:
	movq	%r13, %rdx
	leaq	.LC22(%rip), %rcx
	call	parser_error
	jmp	.L226
	.p2align 4,,10
	.p2align 3
.L222:
	movq	%rbx, %rdx
	leaq	.LC20(%rip), %rcx
	call	parser_error
	jmp	.L223
.L248:
	movq	%rsi, %rcx
	call	peek_current_token
	leaq	.LC6(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
	jmp	.L229
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
	.p2align 4
	.def	parse_statement;	.scl	3;	.type	32;	.endef
parse_statement:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	movq	%r8, %rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$104, %rsp
	call	peek_current_token
	cmpl	$6, 24(%rax)
	je	.L430
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L431
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rsi, 32(%rsp)
	xorl	%r8d, %r8d
	movq	%rdi, %r9
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	parse_expr_prec
	movq	%rax, %r8
.L344:
	movq	$0, 40(%rsp)
	movq	%r8, 32(%rsp)
.L429:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	create_statement
	movq	%rax, %rsi
.L336:
	movq	%rbx, %rcx
	call	peek_current_token
	testq	%rsi, %rsi
	je	.L432
.L345:
	movq	%rbx, %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L346
.L348:
	movq	%rbx, %rdx
	leaq	.LC52(%rip), %rcx
	call	parser_error
.L249:
	addq	$104, %rsp
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
	.p2align 4,,10
	.p2align 3
.L346:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L348
	jmp	.L249
	.p2align 4,,10
	.p2align 3
.L430:
	movq	%rax, %rbp
	movq	.refptr.IF_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L433
	movq	.refptr.FOR_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L434
	movq	.refptr.WHILE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L435
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L436
	movq	.refptr.RETURN_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L337
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	$0, 40(%rsp)
	movl	$5, %ecx
	movq	%rax, 32(%rsp)
	call	create_statement
	movq	%rax, %rsi
	jmp	.L336
	.p2align 4,,10
	.p2align 3
.L434:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L290
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L290
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L291
.L294:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_variable
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L437
.L293:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L295:
	cmpl	$5, 24(%rbp)
	jne	.L298
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %r14
	movq	0(%rbp), %rcx
	movq	(%r14), %rdx
	call	string_equal
	testb	%al, %al
	je	.L298
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L299
.L302:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L438
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rsi, 32(%rsp)
	movq	%rdi, %r9
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	parse_expr_prec
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L304
.L305:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L303:
	cmpl	$5, 24(%rbp)
	jne	.L307
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	je	.L307
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L308
.L311:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L439
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rsi, 32(%rsp)
	movq	%rdi, %r9
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	parse_expr_prec
	movq	%rax, 56(%rsp)
	testq	%rax, %rax
	je	.L313
.L314:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L312:
	cmpl	$5, 24(%rbp)
	jne	.L316
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L316
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L318
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L318
	call	create_list
	movb	$1, 2(%rsi)
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r14
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rbp
	movq	%r13, %rdx
	movq	%rax, %r13
	movq	%rdx, %r15
	movq	%rbp, %rax
	movq	%rsi, %rbp
	movq	%rbx, %rsi
	movq	%r12, %rbx
	movq	%rax, %r12
	jmp	.L319
	.p2align 4,,10
	.p2align 3
.L320:
	movq	%rax, %rdx
	movq	%r14, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %r13
.L319:
	cmpl	$5, 24(%r13)
	jne	.L321
	movq	(%r12), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L440
.L321:
	movq	%rbp, %r8
	movq	%rdi, %rdx
	movq	%rsi, %rcx
	call	parse_statement
	testq	%rax, %rax
	jne	.L320
	movq	%r13, %rdx
	leaq	.LC43(%rip), %rcx
	movq	%rax, 64(%rsp)
	call	parser_error
	movq	64(%rsp), %rax
	jmp	.L320
	.p2align 4,,10
	.p2align 3
.L432:
	movq	%rax, %rdx
	leaq	.LC51(%rip), %rcx
	call	parser_error
	jmp	.L345
	.p2align 4,,10
	.p2align 3
.L433:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L254
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r15
	movq	(%rax), %rcx
	movq	(%r15), %rdx
	call	string_equal
	testb	%al, %al
	je	.L254
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%rax, %rbp
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L441
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rsi, 32(%rsp)
	movq	%rdi, %r9
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	parse_expr_prec
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L256
.L257:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L259
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L259
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L261
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L261
	call	create_list
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r14
	call	get_next_token
	movq	%r13, 56(%rsp)
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rbp
	movq	%rax, %r13
	jmp	.L262
	.p2align 4,,10
	.p2align 3
.L263:
	movq	%r12, %rdx
	movq	%r14, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r13
.L262:
	cmpl	$5, 24(%r13)
	jne	.L264
	movq	0(%rbp), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L442
.L264:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L263
	movq	%r13, %rdx
	leaq	.LC27(%rip), %rcx
	call	parser_error
	jmp	.L263
	.p2align 4,,10
	.p2align 3
.L254:
	movq	%rbp, %rdx
	leaq	.LC23(%rip), %rcx
	call	parser_error
.L253:
	xorl	%edx, %edx
.L266:
	movq	$0, 40(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rsi
	jmp	.L249
	.p2align 4,,10
	.p2align 3
.L431:
	movq	%rbx, %rcx
	movq	%rax, 56(%rsp)
	call	peek_current_token
	leaq	.LC6(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
	movq	56(%rsp), %r8
	jmp	.L344
	.p2align 4,,10
	.p2align 3
.L435:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L325
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L325
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%rax, %rbp
	call	parse_expression
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L443
.L326:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L329
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L329
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L331
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L331
	call	create_list
	movb	$1, 2(%rsi)
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r13
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rbp
	movq	%rax, %r15
	jmp	.L332
	.p2align 4,,10
	.p2align 3
.L333:
	movq	%r12, %rdx
	movq	%r13, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r15
.L332:
	cmpl	$5, 24(%r15)
	jne	.L334
	movq	0(%rbp), %rdx
	movq	(%r15), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L444
.L334:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L333
	movq	%r15, %rdx
	leaq	.LC48(%rip), %rcx
	call	parser_error
	jmp	.L333
	.p2align 4,,10
	.p2align 3
.L436:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_variable
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, 40(%rsp)
	movl	$1, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rsi
	jmp	.L336
	.p2align 4,,10
	.p2align 3
.L259:
	movq	%rbp, %rdx
	leaq	.LC25(%rip), %rcx
	call	parser_error
	jmp	.L253
	.p2align 4,,10
	.p2align 3
.L290:
	movq	%rbp, %rdx
	leaq	.LC35(%rip), %rcx
	call	parser_error
.L289:
	xorl	%r9d, %r9d
.L297:
	movq	$0, 40(%rsp)
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$4, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rsi
	jmp	.L249
	.p2align 4,,10
	.p2align 3
.L325:
	movq	%rbp, %rdx
	leaq	.LC44(%rip), %rcx
	call	parser_error
.L324:
	xorl	%r8d, %r8d
.L328:
	movq	$0, 40(%rsp)
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$3, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rsi
	jmp	.L249
.L441:
	movq	%rbx, %rcx
	call	peek_current_token
	leaq	.LC6(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L256:
	movq	%rbp, %rdx
	leaq	.LC24(%rip), %rcx
	xorl	%r13d, %r13d
	call	parser_error
	jmp	.L257
	.p2align 4,,10
	.p2align 3
.L337:
	movq	.refptr.BREAK_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L338
	cmpb	$0, 2(%rsi)
	je	.L445
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$6, %ecx
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rsi
	jmp	.L336
	.p2align 4,,10
	.p2align 3
.L298:
	movq	%rbp, %rdx
	leaq	.LC37(%rip), %rcx
	call	parser_error
	jmp	.L289
.L261:
	movq	%rbp, %rdx
	leaq	.LC26(%rip), %rcx
	call	parser_error
	jmp	.L253
.L442:
	movq	56(%rsp), %r13
	call	create_list
	movq	%rax, 64(%rsp)
	call	create_list
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, 72(%rsp)
	call	peek_next_token
	cmpl	$6, 24(%rax)
	movq	%rax, %r12
	jne	.L279
	movq	%r13, 80(%rsp)
	movq	%r14, 88(%rsp)
	.p2align 4,,10
	.p2align 3
.L265:
	movq	.refptr.ELIF_KEYWORD(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L446
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L268
	movq	(%r15), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	je	.L268
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%rax, %r12
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L447
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rsi, 32(%rsp)
	movq	%rdi, %r9
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	parse_expr_prec
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L270
.L271:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L273
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L273
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L275
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L275
	call	create_list
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r12
	call	get_next_token
	movq	%r13, 56(%rsp)
	movq	%rax, %r13
	jmp	.L276
	.p2align 4,,10
	.p2align 3
.L277:
	movq	%r14, %rdx
	movq	%r12, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r13
.L276:
	cmpl	$5, 24(%r13)
	jne	.L278
	movq	0(%rbp), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L448
.L278:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L277
	movq	%r13, %rdx
	leaq	.LC32(%rip), %rcx
	call	parser_error
	jmp	.L277
	.p2align 4,,10
	.p2align 3
.L448:
	movq	56(%rsp), %r13
	movq	%r12, %rdx
	movq	%r13, %rcx
	call	create_else_if
	movq	64(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	cmpl	$6, 24(%rax)
	movq	%rax, %r12
	je	.L265
	movq	80(%rsp), %r13
	movq	88(%rsp), %r14
.L279:
	movq	%rbx, %rcx
	call	peek_current_token
	movq	72(%rsp), %r9
	movq	%r14, %rdx
	movq	%r13, %rcx
	movq	64(%rsp), %r8
	call	create_if
	movq	%rax, %rdx
	jmp	.L266
.L447:
	movq	%rbx, %rcx
	call	peek_current_token
	leaq	.LC6(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L270:
	movq	%r12, %rdx
	leaq	.LC29(%rip), %rcx
	xorl	%r13d, %r13d
	call	parser_error
	jmp	.L271
.L291:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	xorl	%r12d, %r12d
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L295
	jmp	.L294
.L329:
	movq	%rbp, %rdx
	leaq	.LC46(%rip), %rcx
	call	parser_error
	jmp	.L324
.L307:
	movq	%rbp, %rdx
	leaq	.LC39(%rip), %rcx
	call	parser_error
	jmp	.L289
.L338:
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L341
	cmpb	$0, 2(%rsi)
	je	.L449
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$7, %ecx
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rsi
	jmp	.L336
.L299:
	movq	(%r14), %rdx
	movq	(%rax), %rcx
	xorl	%r13d, %r13d
	call	string_equal
	testb	%al, %al
	jne	.L303
	jmp	.L302
.L331:
	movq	%rbp, %rdx
	leaq	.LC47(%rip), %rcx
	call	parser_error
	jmp	.L324
.L444:
	movb	$0, 2(%rsi)
	movq	%r13, %rdx
	movq	%r14, %rcx
	call	create_while
	movq	%rax, %r8
	jmp	.L328
.L437:
	movq	%rbp, %rdx
	leaq	.LC36(%rip), %rcx
	call	parser_error
	jmp	.L293
.L316:
	movq	%rbp, %rdx
	leaq	.LC41(%rip), %rcx
	call	parser_error
	jmp	.L289
.L443:
	movq	%rbp, %rdx
	leaq	.LC45(%rip), %rcx
	call	parser_error
	jmp	.L326
.L268:
	movq	%r12, %rdx
	leaq	.LC28(%rip), %rcx
	call	parser_error
	jmp	.L253
.L273:
	movq	%r12, %rdx
	leaq	.LC30(%rip), %rcx
	call	parser_error
	jmp	.L253
.L275:
	movq	%r12, %rdx
	leaq	.LC31(%rip), %rcx
	call	parser_error
	jmp	.L253
.L308:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L311
	movq	$0, 56(%rsp)
	jmp	.L312
.L445:
	movq	%rbp, %rdx
	leaq	.LC49(%rip), %rcx
	xorl	%esi, %esi
	call	parser_error
	jmp	.L249
.L438:
	movq	%rbx, %rcx
	call	peek_current_token
	leaq	.LC6(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L304:
	movq	%rbp, %rdx
	leaq	.LC38(%rip), %rcx
	xorl	%r13d, %r13d
	call	parser_error
	jmp	.L305
.L341:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	$0, 40(%rsp)
	movq	%rax, 32(%rsp)
	jmp	.L429
.L440:
	movb	$0, 2(%rbp)
	movq	56(%rsp), %r8
	movq	%r14, %r9
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	create_for
	movq	%rax, %r9
	jmp	.L297
.L318:
	movq	%rbp, %rdx
	leaq	.LC42(%rip), %rcx
	call	parser_error
	jmp	.L289
.L446:
	cmpl	$6, 24(%r12)
	movq	80(%rsp), %r13
	movq	88(%rsp), %r14
	jne	.L279
	movq	.refptr.ELSE_KEYWORD(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L279
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L282
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L282
	movl	$1, %edx
	movq	%rbx, %rcx
	leaq	.LC34(%rip), %r12
	call	get_next_token
	movq	%rax, %r15
	jmp	.L283
	.p2align 4,,10
	.p2align 3
.L284:
	movq	72(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r15
.L283:
	cmpl	$5, 24(%r15)
	jne	.L285
	movq	0(%rbp), %rdx
	movq	(%r15), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L279
.L285:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	testq	%rax, %rax
	jne	.L284
	movq	%r15, %rdx
	movq	%r12, %rcx
	movq	%rax, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %rax
	jmp	.L284
.L439:
	movq	%rbx, %rcx
	call	peek_current_token
	leaq	.LC6(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L313:
	movq	%rbp, %rdx
	leaq	.LC40(%rip), %rcx
	call	parser_error
	movq	$0, 56(%rsp)
	jmp	.L314
.L449:
	movq	%rbp, %rdx
	leaq	.LC50(%rip), %rcx
	xorl	%esi, %esi
	call	parser_error
	jmp	.L249
.L282:
	movq	%r12, %rdx
	leaq	.LC33(%rip), %rcx
	call	parser_error
	jmp	.L253
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
.LC81:
	.ascii "Failed to parse method body statement\0"
	.align 8
.LC82:
	.ascii "Method missing return statement\0"
.LC83:
	.ascii "Failed to parse class method\0"
	.align 8
.LC84:
	.ascii "Failed to parse class variable\0"
	.align 8
.LC85:
	.ascii "Expected ';' after class variable declaration\0"
	.align 8
.LC86:
	.ascii "Unexpected token in class member\0"
	.align 8
.LC87:
	.ascii "Failed to parse class declaration\0"
	.align 8
.LC88:
	.ascii "Unexpected token in code member\0"
	.text
	.p2align 4
	.globl	parse_code
	.def	parse_code;	.scl	2;	.type	32;	.endef
parse_code:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$168, %rsp
	movq	.refptr.builtin_scope(%rip), %rsi
	movq	%r8, 72(%rsp)
	cmpq	$0, (%rsi)
	je	.L616
.L451:
	testq	%rbx, %rbx
	je	.L617
.L452:
	call	create_list
	movq	%rbx, %rcx
	movq	%rax, 80(%rsp)
	call	create_scope
	movl	$1, %edx
	movq	%rdi, %rcx
	movq	%rax, 64(%rsp)
	call	get_next_token
	testq	%rax, %rax
	je	.L539
	movq	.refptr.CLASS_KEYWORD(%rip), %r13
	movq	%rax, %r11
	movq	%rdi, %r14
	jmp	.L453
	.p2align 4,,10
	.p2align 3
.L493:
	movq	%r11, %rdx
	leaq	.LC88(%rip), %rcx
	call	parser_error
.L465:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %r11
	testq	%rax, %rax
	je	.L539
.L453:
	movl	24(%r11), %eax
	testl	%eax, %eax
	je	.L539
	cmpl	$6, %eax
	jne	.L493
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax
	movq	(%r11), %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	movl	%eax, %ebx
	jne	.L618
	cmpl	$6, 24(%r11)
	jne	.L493
	movq	.refptr.FUNC_KEYWORD(%rip), %rax
	movq	(%r11), %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	jne	.L619
	cmpl	$6, 24(%r11)
	jne	.L493
	movq	(%r11), %rcx
	movq	0(%r13), %rdx
	movq	%r11, 56(%rsp)
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	je	.L493
	movq	64(%rsp), %rcx
	call	create_scope
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 88(%rsp)
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$1, 24(%rax)
	jne	.L620
	movq	(%rax), %rcx
	movq	64(%rsp), %rax
	xorl	%r8d, %r8d
	movl	$4, %edx
	movq	88(%rsp), %r9
	movq	%r11, 56(%rsp)
	movq	%rax, 32(%rsp)
	call	create_name
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 104(%rsp)
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L497
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	je	.L497
	call	create_list
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 96(%rsp)
	call	get_next_token
	movq	56(%rsp), %r11
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12
	movq	.refptr.VAR_KEYWORD(%rip), %rdi
	movq	%rax, %r10
	movq	%r11, 112(%rsp)
	jmp	.L498
	.p2align 4,,10
	.p2align 3
.L536:
	cmpl	$6, %eax
	je	.L621
.L499:
	movq	%r10, %rdx
	leaq	.LC86(%rip), %rcx
	call	parser_error
.L532:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %r10
.L498:
	movl	24(%r10), %eax
	cmpl	$5, %eax
	jne	.L536
	movq	(%r12), %rdx
	movq	(%r10), %rcx
	movq	%r10, 56(%rsp)
	call	string_equal
	testb	%al, %al
	jne	.L537
	movq	56(%rsp), %r10
	movl	24(%r10), %eax
	cmpl	$6, %eax
	jne	.L499
.L621:
	movq	.refptr.METHOD_KEYWORD(%rip), %rax
	movq	(%r10), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	jne	.L622
	cmpl	$6, 24(%r10)
	jne	.L499
	movq	(%r10), %rcx
	movq	(%rdi), %rdx
	movq	%r10, 56(%rsp)
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L499
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	72(%rsp), %r8
	movq	88(%rsp), %rdx
	movq	%r14, %rcx
	movq	%rax, %rbx
	call	parse_variable
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L623
.L533:
	xorl	%edx, %edx
	movl	$1, %ecx
	call	create_class_member
	movq	96(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L534
.L535:
	movq	%rbx, %rdx
	leaq	.LC85(%rip), %rcx
	call	parser_error
	jmp	.L532
	.p2align 4,,10
	.p2align 3
.L539:
	movq	64(%rsp), %rdx
	movq	80(%rsp), %rcx
	addq	$168, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	create_code
	.p2align 4,,10
	.p2align 3
.L618:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$1, 24(%rax)
	jne	.L624
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdi
	call	get_next_token
	xorl	%esi, %esi
	movq	56(%rsp), %r11
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$6, %eax
	je	.L625
.L458:
	cmpl	$5, %eax
	jne	.L462
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	je	.L462
	movq	64(%rsp), %r8
	movq	%rdi, %rcx
	movq	%rsi, %rdx
	call	parse_import_file
	movq	56(%rsp), %r11
	testq	%rax, %rax
	movq	%rax, %rcx
	je	.L626
.L463:
	movq	%rsi, %rdx
	movq	%r11, 56(%rsp)
	call	create_import
	movq	56(%rsp), %r11
	testq	%rax, %rax
	movq	%rax, %rdx
	je	.L457
.L464:
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	call	create_code_member
	movq	80(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L465
	.p2align 4,,10
	.p2align 3
.L619:
	movq	64(%rsp), %rcx
	call	create_scope
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, %rsi
	call	get_next_token
	movq	56(%rsp), %r11
	movq	%rax, %rbp
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L467
	cmpl	$6, %eax
	jne	.L470
	movq	0(%rbp), %rcx
	movq	%r11, 56(%rsp)
	call	is_builtin_type
	movq	56(%rsp), %r11
	testb	%al, %al
	je	.L470
.L467:
	movq	0(%rbp), %rdx
	movq	64(%rsp), %rcx
	movq	%r11, 56(%rsp)
	call	search
	movq	56(%rsp), %r11
	testq	%rax, %rax
	movq	%rax, %rdi
	je	.L627
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r11, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$1, 24(%rax)
	jne	.L628
	movq	(%rax), %rcx
	movq	64(%rsp), %rax
	xorl	%r9d, %r9d
	movq	%rdi, %r8
	movl	$2, %edx
	movq	%r11, 56(%rsp)
	movq	%rax, 32(%rsp)
	call	create_name
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 88(%rsp)
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L474
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	je	.L474
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r11, 96(%rsp)
	call	get_next_token
	movq	%rax, %rbp
	call	create_list
	movq	%rdi, 104(%rsp)
	movq	%rbp, %rdi
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r12
	movq	%rax, 56(%rsp)
	movl	%ebx, %ebp
	movq	.refptr.COMMA_SYMBOL(%rip), %r15
	movq	96(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L475:
	cmpl	$5, 24(%rdi)
	je	.L629
.L483:
	movq	72(%rsp), %r8
	movq	%rsi, %rdx
	movq	%r14, %rcx
	call	parse_variable
	testq	%rax, %rax
	je	.L630
	cmpq	$0, 16(%rax)
	je	.L478
	movq	%rdi, %rdx
	leaq	.LC62(%rip), %rcx
	call	parser_error
.L477:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rdi
	je	.L479
.L482:
	movq	%rdi, %rdx
	leaq	.LC63(%rip), %rcx
	movq	%rbx, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r11
.L469:
	movq	%r11, %rdx
	leaq	.LC68(%rip), %rcx
	call	parser_error
	xorl	%r8d, %r8d
.L492:
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	movl	$1, %ecx
	call	create_code_member
	movq	80(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L465
	.p2align 4,,10
	.p2align 3
.L497:
	movq	%rbx, %rdx
	leaq	.LC70(%rip), %rcx
	movq	%r11, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r11
.L495:
	movq	%r11, %rdx
	leaq	.LC87(%rip), %rcx
	call	parser_error
	xorl	%r9d, %r9d
.L538:
	xorl	%edx, %edx
	xorl	%r8d, %r8d
	movl	$2, %ecx
	call	create_code_member
	movq	80(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L465
	.p2align 4,,10
	.p2align 3
.L622:
	movq	88(%rsp), %rcx
	call	create_scope
	movq	104(%rsp), %r8
	xorl	%r9d, %r9d
	movl	$1, %edx
	movq	%rax, %rsi
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rcx
	movq	%rsi, 32(%rsp)
	call	create_name
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, %rbp
	call	get_next_token
	movq	56(%rsp), %r10
	movq	%rax, %r15
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L501
	cmpl	$6, %eax
	jne	.L504
	movq	(%r15), %rcx
	movq	%r10, 56(%rsp)
	call	is_builtin_type
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L504
.L501:
	movq	(%r15), %rdx
	movq	88(%rsp), %rcx
	movq	%r10, 56(%rsp)
	call	search
	movq	56(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L631
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r10, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r10
	cmpl	$1, 24(%rax)
	jne	.L632
	movq	(%rax), %rcx
	movq	88(%rsp), %rax
	xorl	%r9d, %r9d
	movq	%rbx, %r8
	movl	$3, %edx
	movq	%r10, 56(%rsp)
	movq	%rax, 32(%rsp)
	call	create_name
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 136(%rsp)
	call	get_next_token
	movq	56(%rsp), %r10
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	jne	.L508
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%r15), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L508
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	56(%rsp), %r10
	cmpl	$6, 24(%rax)
	movq	%rax, %r15
	je	.L509
.L511:
	movq	%r15, %rdx
	leaq	.LC75(%rip), %rcx
	movq	%r10, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r10
.L510:
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r10, 56(%rsp)
	call	get_next_token
	movq	%rax, %r15
	call	create_list
	movq	104(%rsp), %rcx
	movq	%rbp, %rdx
	xorl	%r8d, %r8d
	movq	%rax, 120(%rsp)
	call	create_variable
	movq	120(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	%rbx, 128(%rsp)
	movq	%r15, %rbx
	movq	.refptr.COMMA_SYMBOL(%rip), %rbp
	movq	%r12, %r15
	movq	56(%rsp), %r12
	.p2align 4,,10
	.p2align 3
.L512:
	cmpl	$5, 24(%rbx)
	je	.L633
.L614:
	movq	%r12, %r10
	movq	%r15, %r12
	movq	%rbx, %r15
.L516:
	movq	%r15, %rdx
	leaq	.LC76(%rip), %rcx
	movq	%r10, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L503
	.p2align 4,,10
	.p2align 3
.L617:
	movq	(%rsi), %rbx
	jmp	.L452
	.p2align 4,,10
	.p2align 3
.L537:
	movq	112(%rsp), %r11
	movq	88(%rsp), %r8
	movq	96(%rsp), %rdx
	movq	104(%rsp), %rcx
	movq	%r11, 56(%rsp)
	call	create_class
	movq	56(%rsp), %r11
	testq	%rax, %rax
	movq	%rax, %r9
	jne	.L538
	jmp	.L495
	.p2align 4,,10
	.p2align 3
.L534:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L535
	jmp	.L532
	.p2align 4,,10
	.p2align 3
.L620:
	movq	%rax, %rdx
	leaq	.LC69(%rip), %rcx
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L495
	.p2align 4,,10
	.p2align 3
.L624:
	movq	%rax, %rdx
	leaq	.LC53(%rip), %rcx
	call	parser_error
	movq	56(%rsp), %r11
.L457:
	movq	%r11, %rdx
	leaq	.LC56(%rip), %rcx
	call	parser_error
	xorl	%edx, %edx
	jmp	.L464
	.p2align 4,,10
	.p2align 3
.L462:
	movq	%rbx, %rdx
	leaq	.LC55(%rip), %rcx
	movq	%r11, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L457
	.p2align 4,,10
	.p2align 3
.L474:
	movq	%rbp, %rdx
	leaq	.LC60(%rip), %rcx
	movq	%r11, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L469
	.p2align 4,,10
	.p2align 3
.L508:
	movq	%r15, %rdx
	leaq	.LC74(%rip), %rcx
	movq	%r10, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r10
.L503:
	movq	%r10, %rdx
	leaq	.LC83(%rip), %rcx
	call	parser_error
	xorl	%edx, %edx
.L531:
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	call	create_class_member
	movq	96(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L532
	.p2align 4,,10
	.p2align 3
.L629:
	movq	(%r12), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L483
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rbx, 96(%rsp)
	movq	104(%rsp), %rdi
	call	get_next_token
	movl	%ebp, %ebx
	movq	96(%rsp), %r11
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L485
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%r12), %rcx
	movq	%r11, 96(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	96(%rsp), %r11
	testb	%al, %al
	je	.L485
	call	create_list
	movl	$1, %edx
	movq	%r14, %rcx
	movl	$1, %ebp
	movq	%rax, %r15
	movq	72(%rsp), %rax
	movb	$1, (%rax)
	call	get_next_token
	movq	96(%rsp), %r11
	movq	%rdi, 112(%rsp)
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12
	movq	%rax, %rdi
	movq	%r11, 104(%rsp)
	jmp	.L486
	.p2align 4,,10
	.p2align 3
.L488:
	cmpl	$5, 8(%rax)
	movq	%rax, %rdx
	movq	%r15, %rcx
	cmove	%ebp, %ebx
	call	list_append
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rdi
.L486:
	cmpl	$5, 24(%rdi)
	jne	.L490
	movq	(%r12), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L634
.L490:
	movq	72(%rsp), %r8
	movq	%rsi, %rdx
	movq	%r14, %rcx
	call	parse_statement
	testq	%rax, %rax
	je	.L635
	testb	%bl, %bl
	je	.L488
	movq	%rdi, %rdx
	leaq	.LC66(%rip), %rcx
	movq	%rax, 96(%rsp)
	call	parser_error
	movq	96(%rsp), %rax
	jmp	.L488
	.p2align 4,,10
	.p2align 3
.L478:
	movq	56(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L477
	.p2align 4,,10
	.p2align 3
.L479:
	movq	(%r15), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L636
	cmpl	$5, 24(%rdi)
	jne	.L482
	movq	(%r12), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L475
	jmp	.L482
	.p2align 4,,10
	.p2align 3
.L633:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L637
	cmpl	$5, 24(%rbx)
	jne	.L614
	movq	0(%rbp), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L638
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	72(%rsp), %r8
	movq	%rsi, %rdx
	movq	%r14, %rcx
	movq	%rax, %rbx
	call	parse_variable
	testq	%rax, %rax
	je	.L639
	cmpq	$0, 16(%rax)
	je	.L522
	movq	%rbx, %rdx
	leaq	.LC78(%rip), %rcx
	call	parser_error
.L521:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L512
	.p2align 4,,10
	.p2align 3
.L522:
	movq	120(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L521
	.p2align 4,,10
	.p2align 3
.L630:
	movq	%rdi, %rdx
	leaq	.LC61(%rip), %rcx
	call	parser_error
	jmp	.L477
	.p2align 4,,10
	.p2align 3
.L639:
	movq	%rbx, %rdx
	leaq	.LC77(%rip), %rcx
	call	parser_error
	jmp	.L521
	.p2align 4,,10
	.p2align 3
.L616:
	xorl	%ecx, %ecx
	call	create_scope
	movq	.refptr.VOID_KEYWORD(%rip), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, (%rsi)
	movq	(%rdx), %rcx
	movq	%rax, 32(%rsp)
	xorl	%edx, %edx
	call	create_name
	movq	.refptr.name_void(%rip), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, (%rdx)
	movq	.refptr.INT_KEYWORD(%rip), %rax
	xorl	%edx, %edx
	movq	(%rax), %rcx
	movq	(%rsi), %rax
	movq	%rax, 32(%rsp)
	call	create_name
	movq	.refptr.name_int(%rip), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, (%rdx)
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	xorl	%edx, %edx
	movq	(%rax), %rcx
	movq	(%rsi), %rax
	movq	%rax, 32(%rsp)
	call	create_name
	movq	.refptr.name_float(%rip), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, (%rdx)
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	xorl	%edx, %edx
	movq	(%rax), %rcx
	movq	(%rsi), %rax
	movq	%rax, 32(%rsp)
	call	create_name
	movq	.refptr.name_string(%rip), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, (%rdx)
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	xorl	%edx, %edx
	movq	(%rax), %rcx
	movq	(%rsi), %rax
	movq	%rax, 32(%rsp)
	call	create_name
	movq	.refptr.name_bool(%rip), %rdx
	movq	%rax, (%rdx)
	jmp	.L451
	.p2align 4,,10
	.p2align 3
.L470:
	movq	%rbp, %rdx
	leaq	.LC57(%rip), %rcx
	movq	%r11, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L469
	.p2align 4,,10
	.p2align 3
.L504:
	movq	%r15, %rdx
	leaq	.LC71(%rip), %rcx
	movq	%r10, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L503
	.p2align 4,,10
	.p2align 3
.L623:
	movq	%rbx, %rdx
	leaq	.LC84(%rip), %rcx
	movq	%rax, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r8
	jmp	.L533
	.p2align 4,,10
	.p2align 3
.L636:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rdi
	jmp	.L475
.L628:
	movq	%rax, %rdx
	leaq	.LC59(%rip), %rcx
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L469
.L632:
	movq	%rax, %rdx
	leaq	.LC73(%rip), %rcx
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L503
.L625:
	movq	.refptr.FROM_KEYWORD(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	jne	.L459
	movl	24(%rbx), %eax
	jmp	.L458
.L638:
	movq	%r12, %r10
	movq	%r15, %r12
	movq	%rbx, %r15
	movq	128(%rsp), %rbx
	cmpl	$5, 24(%r15)
	jne	.L516
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%r15), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L516
.L524:
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r10, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r10
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L519
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L519
	movq	%r10, 128(%rsp)
	movq	%r12, %r15
	xorl	%ebp, %ebp
	call	create_list
	movl	$257, %ecx
	movl	$1, %edx
	movq	%rax, 56(%rsp)
	movq	72(%rsp), %rax
	movw	%cx, (%rax)
	movq	%r14, %rcx
	call	get_next_token
	movq	128(%rsp), %r10
	movq	72(%rsp), %r12
	movq	%rbx, 152(%rsp)
	movq	%rax, %rbx
	movq	%r10, 144(%rsp)
	jmp	.L525
	.p2align 4,,10
	.p2align 3
.L527:
	movq	56(%rsp), %rcx
	cmpl	$5, 8(%rax)
	movq	%rax, %rdx
	movl	$1, %ebx
	cmove	%ebx, %ebp
	call	list_append
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
.L525:
	cmpl	$5, 24(%rbx)
	jne	.L529
	movq	(%r15), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L640
.L529:
	movq	%r12, %r8
	movq	%rsi, %rdx
	movq	%r14, %rcx
	call	parse_statement
	testq	%rax, %rax
	je	.L641
	testb	%bpl, %bpl
	je	.L527
	movq	%rbx, %rdx
	leaq	.LC66(%rip), %rcx
	movq	%rax, 128(%rsp)
	call	parser_error
	movq	128(%rsp), %rax
	jmp	.L527
.L519:
	movq	%rbp, %rdx
	leaq	.LC79(%rip), %rcx
	movq	%r10, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L503
	.p2align 4,,10
	.p2align 3
.L641:
	movq	%rbx, %rdx
	leaq	.LC81(%rip), %rcx
	movq	%rax, 128(%rsp)
	call	parser_error
	movq	128(%rsp), %rax
	jmp	.L527
.L509:
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%r15), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L511
	jmp	.L510
.L626:
	movq	.refptr.name_void(%rip), %rax
	movq	%rdi, %rcx
	xorl	%r9d, %r9d
	movl	$1, %edx
	movq	(%rax), %r8
	movq	64(%rsp), %rax
	movq	%rax, 32(%rsp)
	call	create_name
	movq	56(%rsp), %r11
	movq	%rax, %rcx
	jmp	.L463
.L640:
	movq	72(%rsp), %rax
	xorl	%edx, %edx
	movq	%r15, %r12
	movq	144(%rsp), %r10
	movq	%rbx, %r15
	movq	152(%rsp), %rbx
	movw	%dx, (%rax)
	testb	%bpl, %bpl
	jne	.L530
	movq	.refptr.name_void(%rip), %rax
	cmpq	(%rax), %rbx
	je	.L530
	movq	%r15, %rdx
	leaq	.LC82(%rip), %rcx
	movq	%r10, 128(%rsp)
	call	parser_error
	movq	128(%rsp), %r10
.L530:
	movq	%rsi, 32(%rsp)
	movq	56(%rsp), %r9
	movq	%rbx, %rdx
	movq	120(%rsp), %r8
	movq	136(%rsp), %rcx
	movq	%r10, 128(%rsp)
	call	create_method
	movq	128(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, %rdx
	jne	.L531
	jmp	.L503
	.p2align 4,,10
	.p2align 3
.L627:
	movq	%rbp, %rdx
	leaq	.LC58(%rip), %rcx
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L469
.L631:
	movq	%r15, %rdx
	leaq	.LC72(%rip), %rcx
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L503
.L635:
	movq	%rdi, %rdx
	leaq	.LC65(%rip), %rcx
	movq	%rax, 96(%rsp)
	call	parser_error
	movq	96(%rsp), %rax
	jmp	.L488
.L459:
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r11, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$4, 24(%rax)
	jne	.L642
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rsi
	call	get_next_token
	movq	56(%rsp), %r11
	movq	%rax, %rbx
	movl	24(%rax), %eax
	jmp	.L458
.L637:
	movq	%r12, %r10
	movq	128(%rsp), %rbx
	movq	%r15, %r12
	jmp	.L524
.L485:
	movq	%r12, %rdx
	leaq	.LC64(%rip), %rcx
	movq	%r11, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L469
.L634:
	movq	72(%rsp), %rax
	movq	%rdi, %r9
	movq	104(%rsp), %r11
	movq	112(%rsp), %rdi
	movb	$0, (%rax)
	testb	%bl, %bl
	jne	.L491
	movq	.refptr.name_void(%rip), %rax
	cmpq	(%rax), %rdi
	je	.L491
	movq	%r9, %rdx
	leaq	.LC67(%rip), %rcx
	movq	%r11, 96(%rsp)
	call	parser_error
	movq	96(%rsp), %r11
.L491:
	movq	%rsi, 32(%rsp)
	movq	56(%rsp), %r8
	movq	%r15, %r9
	movq	%rdi, %rdx
	movq	88(%rsp), %rcx
	movq	%r11, 96(%rsp)
	call	create_function
	movq	96(%rsp), %r11
	testq	%rax, %rax
	movq	%rax, %r8
	jne	.L492
	jmp	.L469
	.p2align 4,,10
	.p2align 3
.L642:
	movq	%rax, %rdx
	leaq	.LC54(%rip), %rcx
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L457
	.ident	"GCC: (GNU) 13.2.0"
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
	.def	parser_error;	.scl	2;	.type	32;	.endef
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.def	search;	.scl	2;	.type	32;	.endef
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.def	create_name;	.scl	2;	.type	32;	.endef
	.def	create_variable;	.scl	2;	.type	32;	.endef
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.def	create_else_if;	.scl	2;	.type	32;	.endef
	.def	create_if;	.scl	2;	.type	32;	.endef
	.def	create_while;	.scl	2;	.type	32;	.endef
	.def	create_for;	.scl	2;	.type	32;	.endef
	.def	create_scope;	.scl	2;	.type	32;	.endef
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.def	create_code;	.scl	2;	.type	32;	.endef
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.def	create_import;	.scl	2;	.type	32;	.endef
	.def	create_code_member;	.scl	2;	.type	32;	.endef
	.def	create_class;	.scl	2;	.type	32;	.endef
	.def	create_method;	.scl	2;	.type	32;	.endef
	.def	create_function;	.scl	2;	.type	32;	.endef
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
	.section	.rdata$.refptr.ASSIGN_SYMBOL, "dr"
	.globl	.refptr.ASSIGN_SYMBOL
	.linkonce	discard
.refptr.ASSIGN_SYMBOL:
	.quad	ASSIGN_SYMBOL
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
