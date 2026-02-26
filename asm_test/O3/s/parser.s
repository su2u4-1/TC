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
	.seh_proc	parse_expression
parse_expression:
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
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, %rsi
	movq	%rdx, %rbp
	movq	%r8, %rdi
	call	peek_current_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$2, %eax
	je	.L53
	cmpl	$3, %eax
	je	.L54
	cmpl	$4, %eax
	je	.L55
	cmpl	$6, %eax
	je	.L56
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
.L54:
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
.L53:
	movq	(%rbx), %rdx
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ebx, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L55:
	movq	(%rbx), %rdx
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L56:
	movq	.refptr.TRUE_KEYWORD(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L57
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
	jne	.L58
	movl	24(%rbx), %eax
	cmpl	$5, %eax
	jne	.L20
	movq	.refptr.NOT_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L59
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
.L57:
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
.L58:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rsi, %rcx
	movq	%rax, %rbx
	call	parse_expression
	testq	%rax, %rax
	je	.L60
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
.L59:
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
	je	.L61
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
	je	.L62
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
.L60:
	movq	%rbx, %rdx
	leaq	.LC0(%rip), %rcx
	call	parser_error
	jmp	.L16
.L61:
	movq	%rbx, %rdx
	leaq	.LC2(%rip), %rcx
	call	parser_error
	jmp	.L16
.L62:
	movq	%rbx, %rdx
	leaq	.LC3(%rip), %rcx
	call	parser_error
	jmp	.L16
	.seh_endproc
	.p2align 4
	.def	parse_primary;	.scl	3;	.type	32;	.endef
	.seh_proc	parse_primary
parse_primary:
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
	movq	%rdx, %rbp
	movq	%r8, %rdi
	call	peek_current_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$2, %eax
	je	.L113
	cmpl	$3, %eax
	je	.L114
	cmpl	$4, %eax
	je	.L115
	cmpl	$6, %eax
	je	.L116
.L68:
	cmpl	$5, %eax
	je	.L72
	cmpl	$1, %eax
	je	.L74
.L75:
	movq	%rbx, %rdx
	leaq	.LC5(%rip), %rcx
	call	parser_error
	xorl	%eax, %eax
	jmp	.L63
	.p2align 4,,10
	.p2align 3
.L114:
	movq	(%rbx), %rdx
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$1, %ebx
.L65:
	movq	%rax, 32(%rsp)
	movl	%ebx, %ecx
	call	create_primary
.L63:
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L113:
	movq	(%rbx), %rdx
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ebx, %ebx
	jmp	.L65
	.p2align 4,,10
	.p2align 3
.L115:
	movq	(%rbx), %rdx
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ebx
	jmp	.L65
	.p2align 4,,10
	.p2align 3
.L116:
	movq	.refptr.TRUE_KEYWORD(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L117
	movl	24(%rbx), %eax
	cmpl	$6, %eax
	jne	.L68
	movq	.refptr.FALSE_KEYWORD(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L71
	movl	24(%rbx), %eax
	cmpl	$5, %eax
	jne	.L83
	.p2align 4,,10
	.p2align 3
.L72:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L118
	movl	24(%rbx), %eax
	cmpl	$5, %eax
	jne	.L83
	movq	.refptr.NOT_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L119
	movl	24(%rbx), %eax
	cmpl	$5, %eax
	jne	.L83
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L84
	movl	24(%rbx), %eax
.L83:
	cmpl	$1, %eax
	je	.L74
	cmpl	$6, %eax
	jne	.L75
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L75
	cmpb	$0, 1(%rdi)
	je	.L75
.L74:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rsi, %rcx
	call	parse_variable_access
	testq	%rax, %rax
	je	.L86
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$8, %ebx
	jmp	.L65
	.p2align 4,,10
	.p2align 3
.L117:
	movq	(%rbx), %rdx
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$3, %ebx
	jmp	.L65
	.p2align 4,,10
	.p2align 3
.L71:
	movq	(%rbx), %rdx
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$4, %ebx
	jmp	.L65
	.p2align 4,,10
	.p2align 3
.L118:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rsi, %rcx
	movq	%rax, %rbx
	call	parse_expression
	testq	%rax, %rax
	je	.L120
	movq	%rsi, %rcx
	movl	$1, %edx
	movq	%rax, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r8
	movl	24(%rax), %ebx
	movq	%rax, %rsi
	cmpl	$5, %ebx
	jne	.L81
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	%r8, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L81
	movq	56(%rsp), %r8
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	jmp	.L65
	.p2align 4,,10
	.p2align 3
.L119:
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
	je	.L121
	xorl	%eax, %eax
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$6, %ebx
	jmp	.L65
	.p2align 4,,10
	.p2align 3
.L84:
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
	je	.L122
	xorl	%eax, %eax
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$7, %ebx
	jmp	.L65
.L81:
	movq	%rsi, %rdx
	leaq	.LC1(%rip), %rcx
	call	parser_error
	xorl	%eax, %eax
	jmp	.L63
.L86:
	movq	%rbx, %rdx
	leaq	.LC4(%rip), %rcx
	call	parser_error
	xorl	%eax, %eax
	jmp	.L63
.L120:
	movq	%rbx, %rdx
	leaq	.LC0(%rip), %rcx
	call	parser_error
	xorl	%eax, %eax
	jmp	.L63
.L121:
	movq	%rbx, %rdx
	leaq	.LC2(%rip), %rcx
	call	parser_error
	xorl	%eax, %eax
	jmp	.L63
.L122:
	movq	%rbx, %rdx
	leaq	.LC3(%rip), %rcx
	call	parser_error
	xorl	%eax, %eax
	jmp	.L63
	.seh_endproc
	.section .rdata,"dr"
.LC7:
	.ascii "Failed to parse right operand\0"
	.text
	.p2align 4
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
	movq	%rcx, %rbx
	movq	%rdx, %r12
	movl	%r8d, %r14d
	movq	%r9, %r13
.L136:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	jne	.L124
	movq	(%rax), %rcx
	call	string_to_operator
	movl	%eax, %ecx
	movl	%eax, %edi
	call	operator_precedence
	movl	%eax, %esi
	cmpl	$19, %edi
	je	.L124
	cmpl	%r14d, %eax
	jl	.L124
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
	je	.L138
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %rbp
.L137:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	jne	.L127
	movq	(%rax), %rcx
	call	string_to_operator
	movl	%eax, %r15d
	movl	%eax, %ecx
	call	operator_precedence
	cmpl	$19, %r15d
	je	.L127
	cmpl	%eax, %esi
	jge	.L127
	movq	160(%rsp), %rdx
	movq	%r13, %r9
	movl	%eax, %r8d
	movq	%rbx, %rcx
	movq	%rdx, 32(%rsp)
	movq	%rbp, %rdx
	call	parse_expr_prec
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L137
	xorl	%r12d, %r12d
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L127:
	movq	%r12, %rdx
	movq	%rbp, %r9
	xorl	%r8d, %r8d
	movl	%edi, %ecx
	call	create_expression
	movq	%rax, %r12
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L124:
	movq	%rbx, %rcx
	call	peek_current_token
.L123:
	movq	%r12, %rax
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
	.p2align 4,,10
	.p2align 3
.L138:
	movq	%rbp, %rdx
	leaq	.LC7(%rip), %rcx
	xorl	%r12d, %r12d
	call	parser_error
	jmp	.L123
	.seh_endproc
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
	.seh_proc	parse_variable_access
parse_variable_access:
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
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	movq	%r8, %rdi
	call	peek_current_token
	movq	%rax, %rbp
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L140
	cmpl	$6, %eax
	jne	.L143
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L143
.L140:
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
	jne	.L139
	xorl	%r12d, %r12d
	xorl	%r13d, %r13d
	movq	%r12, %r15
	movq	%r9, %r12
.L171:
	testq	%rbp, %rbp
	je	.L145
	movl	24(%rbp), %eax
	leal	-1(%rax), %edx
	cmpl	$2, %edx
	jbe	.L174
	cmpl	$5, %eax
	jne	.L146
.L174:
	movq	16(%rbp), %r13
.L145:
	testq	%r15, %r15
	jne	.L148
	testq	%r13, %r13
	je	.L148
	cmpl	$4, 24(%r13)
	jne	.L148
	movq	16(%r13), %r15
.L148:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L204
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L162
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
	je	.L205
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
	je	.L164
.L165:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r8
	jne	.L167
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax
	movq	(%r8), %rcx
	movq	%r8, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r8
	testb	%al, %al
	je	.L167
	movq	%r12, %rdx
	movq	%r14, %r9
	xorl	%r8d, %r8d
	movl	$3, %ecx
	movq	$0, 32(%rsp)
	call	create_variable_access
	movq	%rax, %r12
.L161:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r14
	je	.L171
.L203:
	movq	%r12, %r9
.L139:
	movq	%r9, %rax
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
.L162:
	movq	.refptr.DOT_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L203
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r13
	testq	%r15, %r15
	je	.L206
	cmpl	$1, 24(%rax)
	jne	.L207
	movq	(%rax), %rdx
	movq	%r15, %rcx
	call	search
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L208
	movq	%r12, %rdx
	xorl	%r9d, %r9d
	movq	%rax, %r8
	movl	$2, %ecx
	movq	$0, 32(%rsp)
	xorl	%r15d, %r15d
	xorl	%r13d, %r13d
	call	create_variable_access
	movq	%rax, %r12
	jmp	.L161
	.p2align 4,,10
	.p2align 3
.L204:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	testq	%rbp, %rbp
	je	.L209
.L150:
	movl	24(%rbp), %ecx
	subl	$2, %ecx
	cmpl	$1, %ecx
	ja	.L210
.L151:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r15
	call	create_list
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r13
	movq	%rax, %r14
	.p2align 4,,10
	.p2align 3
.L152:
	cmpl	$5, 24(%r15)
	je	.L211
.L160:
	movq	%rdi, %r8
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L212
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
	je	.L154
.L155:
	movq	%r14, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	je	.L156
.L159:
	movq	%r15, %rdx
	leaq	.LC12(%rip), %rcx
	call	parser_error
.L142:
	xorl	%r9d, %r9d
	jmp	.L139
	.p2align 4,,10
	.p2align 3
.L211:
	movq	0(%r13), %rdx
	movq	(%r15), %rcx
	call	string_equal
	testb	%al, %al
	je	.L160
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
	jmp	.L161
	.p2align 4,,10
	.p2align 3
.L156:
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L213
	cmpl	$5, 24(%r15)
	jne	.L159
	movq	0(%r13), %rdx
	movq	(%r15), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L152
	jmp	.L159
	.p2align 4,,10
	.p2align 3
.L212:
	movq	%rbx, %rcx
	call	peek_current_token
	leaq	.LC6(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L154:
	movq	%r15, %rdx
	leaq	.LC11(%rip), %rcx
	call	parser_error
	xorl	%edx, %edx
	jmp	.L155
	.p2align 4,,10
	.p2align 3
.L213:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r15
	jmp	.L152
	.p2align 4,,10
	.p2align 3
.L210:
	movq	%rax, %rdx
	leaq	.LC10(%rip), %rcx
	call	parser_error
	jmp	.L151
	.p2align 4,,10
	.p2align 3
.L143:
	movq	%rbp, %rdx
	leaq	.LC8(%rip), %rcx
	call	parser_error
	jmp	.L142
	.p2align 4,,10
	.p2align 3
.L146:
	andl	$-5, %eax
	cmove	%rbp, %r13
	jmp	.L145
.L205:
	movq	%rbx, %rcx
	call	peek_current_token
	leaq	.LC6(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L164:
	movq	56(%rsp), %rdx
	leaq	.LC13(%rip), %rcx
	xorl	%r14d, %r14d
	call	parser_error
	jmp	.L165
	.p2align 4,,10
	.p2align 3
.L209:
	movq	%rax, %rdx
	leaq	.LC9(%rip), %rcx
	movq	%rax, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %rax
	jmp	.L150
.L167:
	movq	%r8, %rdx
	leaq	.LC14(%rip), %rcx
	call	parser_error
	jmp	.L142
.L206:
	movq	%rax, %rdx
	leaq	.LC15(%rip), %rcx
	call	parser_error
	jmp	.L142
.L208:
	movq	%r13, %rdx
	leaq	.LC17(%rip), %rcx
	call	parser_error
	jmp	.L142
.L207:
	movq	%rax, %rdx
	leaq	.LC16(%rip), %rcx
	call	parser_error
	jmp	.L142
	.seh_endproc
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
	.seh_proc	parse_variable
parse_variable:
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
	movq	%rcx, %rsi
	movq	%rdx, %rbp
	movq	%r8, %r12
	call	peek_current_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L215
	cmpl	$6, %eax
	jne	.L218
	movq	(%rbx), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L218
.L215:
	movq	(%rbx), %rdx
	movq	%rbp, %rcx
	call	search
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L219
	testl	$-5, 24(%rax)
	jne	.L241
.L220:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L242
.L221:
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
	je	.L243
.L223:
	xorl	%r8d, %r8d
.L227:
	movq	%rbx, %rdx
	movq	%rdi, %rcx
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	create_variable
	.p2align 4,,10
	.p2align 3
.L242:
	movq	%rax, %rdx
	leaq	.LC21(%rip), %rcx
	call	parser_error
	jmp	.L221
	.p2align 4,,10
	.p2align 3
.L218:
	movq	%rbx, %rdx
	leaq	.LC18(%rip), %rcx
	call	parser_error
	xorl	%eax, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L241:
	movq	%rbx, %rdx
	leaq	.LC19(%rip), %rcx
	call	parser_error
	jmp	.L220
	.p2align 4,,10
	.p2align 3
.L243:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx
	movq	(%rax), %rcx
	movq	(%rdx), %rdx
	call	string_equal
	testb	%al, %al
	je	.L223
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
	je	.L244
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
	jne	.L227
.L226:
	movq	%r13, %rdx
	leaq	.LC22(%rip), %rcx
	call	parser_error
	jmp	.L223
	.p2align 4,,10
	.p2align 3
.L219:
	movq	%rbx, %rdx
	leaq	.LC20(%rip), %rcx
	call	parser_error
	jmp	.L220
.L244:
	movq	%rsi, %rcx
	call	peek_current_token
	leaq	.LC6(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
	jmp	.L226
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
	.p2align 4
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
	movq	%rdx, %rdi
	movq	%r8, %rsi
	call	peek_current_token
	cmpl	$6, 24(%rax)
	movq	%rax, %rbp
	je	.L425
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L426
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
.L340:
	movq	$0, 40(%rsp)
	movq	%r8, 32(%rsp)
.L424:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	create_statement
	movq	%rax, %rsi
.L332:
	movq	%rbx, %rcx
	call	peek_current_token
	testq	%rsi, %rsi
	je	.L427
.L341:
	movq	%rbx, %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L342
.L344:
	movq	%rbx, %rdx
	leaq	.LC52(%rip), %rcx
	call	parser_error
.L245:
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
	.p2align 4,,10
	.p2align 3
.L342:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L344
	jmp	.L245
	.p2align 4,,10
	.p2align 3
.L425:
	movq	.refptr.IF_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L428
	movq	.refptr.FOR_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L429
	movq	.refptr.WHILE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L430
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L431
	movq	.refptr.RETURN_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L333
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
	jmp	.L332
	.p2align 4,,10
	.p2align 3
.L429:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L286
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L286
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L287
.L290:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_variable
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L432
.L289:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L291:
	cmpl	$5, 24(%rbp)
	jne	.L294
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %r14
	movq	0(%rbp), %rcx
	movq	(%r14), %rdx
	call	string_equal
	testb	%al, %al
	je	.L294
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L295
.L298:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L433
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
	je	.L300
.L301:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L299:
	cmpl	$5, 24(%rbp)
	jne	.L303
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	je	.L303
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L304
.L307:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L434
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
	je	.L309
.L310:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L308:
	cmpl	$5, 24(%rbp)
	jne	.L312
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L312
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L314
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L314
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
	jmp	.L315
	.p2align 4,,10
	.p2align 3
.L316:
	movq	%rax, %rdx
	movq	%r14, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %r13
.L315:
	cmpl	$5, 24(%r13)
	jne	.L317
	movq	(%r12), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L435
.L317:
	movq	%rbp, %r8
	movq	%rdi, %rdx
	movq	%rsi, %rcx
	call	parse_statement
	testq	%rax, %rax
	jne	.L316
	movq	%r13, %rdx
	leaq	.LC43(%rip), %rcx
	movq	%rax, 64(%rsp)
	call	parser_error
	movq	64(%rsp), %rax
	jmp	.L316
	.p2align 4,,10
	.p2align 3
.L427:
	movq	%rax, %rdx
	leaq	.LC51(%rip), %rcx
	call	parser_error
	jmp	.L341
	.p2align 4,,10
	.p2align 3
.L428:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L250
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r15
	movq	(%rax), %rcx
	movq	(%r15), %rdx
	call	string_equal
	testb	%al, %al
	je	.L250
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
	je	.L436
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
	je	.L252
.L253:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L255
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L255
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L257
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L257
	call	create_list
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r14
	call	get_next_token
	movq	%r13, 56(%rsp)
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rbp
	movq	%rax, %r13
	jmp	.L258
	.p2align 4,,10
	.p2align 3
.L259:
	movq	%r12, %rdx
	movq	%r14, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r13
.L258:
	cmpl	$5, 24(%r13)
	jne	.L260
	movq	0(%rbp), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L437
.L260:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L259
	movq	%r13, %rdx
	leaq	.LC27(%rip), %rcx
	call	parser_error
	jmp	.L259
	.p2align 4,,10
	.p2align 3
.L250:
	movq	%rbp, %rdx
	leaq	.LC23(%rip), %rcx
	call	parser_error
.L249:
	xorl	%edx, %edx
.L262:
	movq	$0, 40(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rsi
	jmp	.L245
	.p2align 4,,10
	.p2align 3
.L426:
	movq	%rbx, %rcx
	movq	%rax, 56(%rsp)
	call	peek_current_token
	leaq	.LC6(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
	movq	56(%rsp), %r8
	jmp	.L340
	.p2align 4,,10
	.p2align 3
.L430:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L321
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L321
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
	je	.L438
.L322:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L325
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L325
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L327
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L327
	call	create_list
	movb	$1, 2(%rsi)
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r13
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rbp
	movq	%rax, %r15
	jmp	.L328
	.p2align 4,,10
	.p2align 3
.L329:
	movq	%r12, %rdx
	movq	%r13, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r15
.L328:
	cmpl	$5, 24(%r15)
	jne	.L330
	movq	0(%rbp), %rdx
	movq	(%r15), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L439
.L330:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L329
	movq	%r15, %rdx
	leaq	.LC48(%rip), %rcx
	call	parser_error
	jmp	.L329
	.p2align 4,,10
	.p2align 3
.L431:
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
	jmp	.L332
	.p2align 4,,10
	.p2align 3
.L255:
	movq	%rbp, %rdx
	leaq	.LC25(%rip), %rcx
	call	parser_error
	jmp	.L249
	.p2align 4,,10
	.p2align 3
.L286:
	movq	%rbp, %rdx
	leaq	.LC35(%rip), %rcx
	call	parser_error
.L285:
	xorl	%r9d, %r9d
.L293:
	movq	$0, 40(%rsp)
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$4, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rsi
	jmp	.L245
	.p2align 4,,10
	.p2align 3
.L321:
	movq	%rbp, %rdx
	leaq	.LC44(%rip), %rcx
	call	parser_error
.L320:
	xorl	%r8d, %r8d
.L324:
	movq	$0, 40(%rsp)
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$3, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rsi
	jmp	.L245
.L436:
	movq	%rbx, %rcx
	call	peek_current_token
	leaq	.LC6(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L252:
	movq	%rbp, %rdx
	leaq	.LC24(%rip), %rcx
	xorl	%r13d, %r13d
	call	parser_error
	jmp	.L253
	.p2align 4,,10
	.p2align 3
.L333:
	movq	.refptr.BREAK_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L334
	cmpb	$0, 2(%rsi)
	je	.L440
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$6, %ecx
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rsi
	jmp	.L332
	.p2align 4,,10
	.p2align 3
.L294:
	movq	%rbp, %rdx
	leaq	.LC37(%rip), %rcx
	call	parser_error
	jmp	.L285
.L257:
	movq	%rbp, %rdx
	leaq	.LC26(%rip), %rcx
	call	parser_error
	jmp	.L249
.L437:
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
	jne	.L275
	movq	%r13, 80(%rsp)
	movq	%r14, 88(%rsp)
	.p2align 4,,10
	.p2align 3
.L261:
	movq	.refptr.ELIF_KEYWORD(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L441
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L264
	movq	(%r15), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	je	.L264
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
	je	.L442
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
	je	.L266
.L267:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L269
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L269
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L271
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L271
	call	create_list
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r12
	call	get_next_token
	movq	%r13, 56(%rsp)
	movq	%rax, %r13
	jmp	.L272
	.p2align 4,,10
	.p2align 3
.L273:
	movq	%r14, %rdx
	movq	%r12, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r13
.L272:
	cmpl	$5, 24(%r13)
	jne	.L274
	movq	0(%rbp), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L443
.L274:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L273
	movq	%r13, %rdx
	leaq	.LC32(%rip), %rcx
	call	parser_error
	jmp	.L273
	.p2align 4,,10
	.p2align 3
.L443:
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
	je	.L261
	movq	80(%rsp), %r13
	movq	88(%rsp), %r14
.L275:
	movq	%rbx, %rcx
	call	peek_current_token
	movq	72(%rsp), %r9
	movq	%r14, %rdx
	movq	%r13, %rcx
	movq	64(%rsp), %r8
	call	create_if
	movq	%rax, %rdx
	jmp	.L262
.L442:
	movq	%rbx, %rcx
	call	peek_current_token
	leaq	.LC6(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L266:
	movq	%r12, %rdx
	leaq	.LC29(%rip), %rcx
	xorl	%r13d, %r13d
	call	parser_error
	jmp	.L267
.L287:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	xorl	%r12d, %r12d
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L291
	jmp	.L290
.L325:
	movq	%rbp, %rdx
	leaq	.LC46(%rip), %rcx
	call	parser_error
	jmp	.L320
.L303:
	movq	%rbp, %rdx
	leaq	.LC39(%rip), %rcx
	call	parser_error
	jmp	.L285
.L334:
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L337
	cmpb	$0, 2(%rsi)
	je	.L444
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$7, %ecx
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rsi
	jmp	.L332
.L295:
	movq	(%r14), %rdx
	movq	(%rax), %rcx
	xorl	%r13d, %r13d
	call	string_equal
	testb	%al, %al
	jne	.L299
	jmp	.L298
.L327:
	movq	%rbp, %rdx
	leaq	.LC47(%rip), %rcx
	call	parser_error
	jmp	.L320
.L439:
	movb	$0, 2(%rsi)
	movq	%r13, %rdx
	movq	%r14, %rcx
	call	create_while
	movq	%rax, %r8
	jmp	.L324
.L432:
	movq	%rbp, %rdx
	leaq	.LC36(%rip), %rcx
	call	parser_error
	jmp	.L289
.L312:
	movq	%rbp, %rdx
	leaq	.LC41(%rip), %rcx
	call	parser_error
	jmp	.L285
.L438:
	movq	%rbp, %rdx
	leaq	.LC45(%rip), %rcx
	call	parser_error
	jmp	.L322
.L264:
	movq	%r12, %rdx
	leaq	.LC28(%rip), %rcx
	call	parser_error
	jmp	.L249
.L269:
	movq	%r12, %rdx
	leaq	.LC30(%rip), %rcx
	call	parser_error
	jmp	.L249
.L271:
	movq	%r12, %rdx
	leaq	.LC31(%rip), %rcx
	call	parser_error
	jmp	.L249
.L304:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L307
	movq	$0, 56(%rsp)
	jmp	.L308
.L440:
	movq	%rbp, %rdx
	leaq	.LC49(%rip), %rcx
	xorl	%esi, %esi
	call	parser_error
	jmp	.L245
.L433:
	movq	%rbx, %rcx
	call	peek_current_token
	leaq	.LC6(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L300:
	movq	%rbp, %rdx
	leaq	.LC38(%rip), %rcx
	xorl	%r13d, %r13d
	call	parser_error
	jmp	.L301
.L337:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	$0, 40(%rsp)
	movq	%rax, 32(%rsp)
	jmp	.L424
.L435:
	movb	$0, 2(%rbp)
	movq	56(%rsp), %r8
	movq	%r14, %r9
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	create_for
	movq	%rax, %r9
	jmp	.L293
.L314:
	movq	%rbp, %rdx
	leaq	.LC42(%rip), %rcx
	call	parser_error
	jmp	.L285
.L441:
	cmpl	$6, 24(%r12)
	movq	80(%rsp), %r13
	movq	88(%rsp), %r14
	jne	.L275
	movq	.refptr.ELSE_KEYWORD(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L275
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L278
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L278
	movl	$1, %edx
	movq	%rbx, %rcx
	leaq	.LC34(%rip), %r12
	call	get_next_token
	movq	%rax, %r15
	jmp	.L279
	.p2align 4,,10
	.p2align 3
.L280:
	movq	72(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r15
.L279:
	cmpl	$5, 24(%r15)
	jne	.L281
	movq	0(%rbp), %rdx
	movq	(%r15), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L275
.L281:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	testq	%rax, %rax
	jne	.L280
	movq	%r15, %rdx
	movq	%r12, %rcx
	movq	%rax, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %rax
	jmp	.L280
.L434:
	movq	%rbx, %rcx
	call	peek_current_token
	leaq	.LC6(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L309:
	movq	%rbp, %rdx
	leaq	.LC40(%rip), %rcx
	call	parser_error
	movq	$0, 56(%rsp)
	jmp	.L310
.L444:
	movq	%rbp, %rdx
	leaq	.LC50(%rip), %rcx
	xorl	%esi, %esi
	call	parser_error
	jmp	.L245
.L278:
	movq	%r12, %rdx
	leaq	.LC33(%rip), %rcx
	call	parser_error
	jmp	.L249
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
	subq	$168, %rsp
	.seh_stackalloc	168
	.seh_endprologue
	movq	.refptr.builtin_scope(%rip), %rsi
	cmpq	$0, (%rsi)
	movq	%r8, 72(%rsp)
	movq	%rcx, %rdi
	movq	%rdx, %rbx
	je	.L610
.L446:
	testq	%rbx, %rbx
	je	.L611
.L447:
	call	create_list
	movq	%rbx, %rcx
	movq	%rax, 80(%rsp)
	call	create_scope
	movl	$1, %edx
	movq	%rdi, %rcx
	movq	%rax, 64(%rsp)
	call	get_next_token
	testq	%rax, %rax
	je	.L534
	movq	.refptr.CLASS_KEYWORD(%rip), %r13
	movq	%rax, %r11
	movq	%rdi, %r14
	jmp	.L448
	.p2align 4,,10
	.p2align 3
.L488:
	movq	%r11, %rdx
	leaq	.LC88(%rip), %rcx
	call	parser_error
.L460:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %r11
	testq	%rax, %rax
	je	.L534
.L448:
	movl	24(%r11), %eax
	testl	%eax, %eax
	je	.L534
	cmpl	$6, %eax
	jne	.L488
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax
	movq	(%r11), %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	movl	%eax, %ebx
	jne	.L612
	cmpl	$6, 24(%r11)
	jne	.L488
	movq	.refptr.FUNC_KEYWORD(%rip), %rax
	movq	(%r11), %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	jne	.L613
	cmpl	$6, 24(%r11)
	jne	.L488
	movq	(%r11), %rcx
	movq	0(%r13), %rdx
	movq	%r11, 56(%rsp)
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	je	.L488
	movq	64(%rsp), %rcx
	call	create_scope
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 88(%rsp)
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$1, 24(%rax)
	jne	.L614
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
	jne	.L492
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	je	.L492
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
	jmp	.L493
	.p2align 4,,10
	.p2align 3
.L531:
	cmpl	$6, %eax
	je	.L615
.L494:
	movq	%r10, %rdx
	leaq	.LC86(%rip), %rcx
	call	parser_error
.L527:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %r10
.L493:
	movl	24(%r10), %eax
	cmpl	$5, %eax
	jne	.L531
	movq	(%r12), %rdx
	movq	(%r10), %rcx
	movq	%r10, 56(%rsp)
	call	string_equal
	testb	%al, %al
	jne	.L532
	movq	56(%rsp), %r10
	movl	24(%r10), %eax
	cmpl	$6, %eax
	jne	.L494
.L615:
	movq	.refptr.METHOD_KEYWORD(%rip), %rax
	movq	(%r10), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	jne	.L616
	cmpl	$6, 24(%r10)
	jne	.L494
	movq	(%r10), %rcx
	movq	(%rdi), %rdx
	movq	%r10, 56(%rsp)
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L494
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
	je	.L617
.L528:
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
	je	.L529
.L530:
	movq	%rbx, %rdx
	leaq	.LC85(%rip), %rcx
	call	parser_error
	jmp	.L527
	.p2align 4,,10
	.p2align 3
.L534:
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
.L612:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$1, 24(%rax)
	jne	.L618
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
	je	.L619
.L453:
	cmpl	$5, %eax
	jne	.L457
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	je	.L457
	movq	64(%rsp), %r8
	movq	%rdi, %rcx
	movq	%rsi, %rdx
	call	parse_import_file
	movq	56(%rsp), %r11
	testq	%rax, %rax
	movq	%rax, %rcx
	je	.L620
.L458:
	movq	%rsi, %rdx
	movq	%r11, 56(%rsp)
	call	create_import
	movq	56(%rsp), %r11
	testq	%rax, %rax
	movq	%rax, %rdx
	je	.L452
.L459:
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	call	create_code_member
	movq	80(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L460
	.p2align 4,,10
	.p2align 3
.L613:
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
	je	.L462
	cmpl	$6, %eax
	jne	.L465
	movq	0(%rbp), %rcx
	movq	%r11, 56(%rsp)
	call	is_builtin_type
	movq	56(%rsp), %r11
	testb	%al, %al
	je	.L465
.L462:
	movq	0(%rbp), %rdx
	movq	64(%rsp), %rcx
	movq	%r11, 56(%rsp)
	call	search
	movq	56(%rsp), %r11
	testq	%rax, %rax
	movq	%rax, %rdi
	je	.L621
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r11, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$1, 24(%rax)
	jne	.L622
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
	jne	.L469
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	je	.L469
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
.L470:
	cmpl	$5, 24(%rdi)
	je	.L623
.L478:
	movq	72(%rsp), %r8
	movq	%rsi, %rdx
	movq	%r14, %rcx
	call	parse_variable
	testq	%rax, %rax
	je	.L624
	cmpq	$0, 16(%rax)
	je	.L473
	movq	%rdi, %rdx
	leaq	.LC62(%rip), %rcx
	call	parser_error
.L472:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rdi
	je	.L474
.L477:
	movq	%rdi, %rdx
	leaq	.LC63(%rip), %rcx
	movq	%rbx, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r11
.L464:
	movq	%r11, %rdx
	leaq	.LC68(%rip), %rcx
	call	parser_error
	xorl	%r8d, %r8d
.L487:
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	movl	$1, %ecx
	call	create_code_member
	movq	80(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L460
	.p2align 4,,10
	.p2align 3
.L492:
	movq	%rbx, %rdx
	leaq	.LC70(%rip), %rcx
	movq	%r11, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r11
.L490:
	movq	%r11, %rdx
	leaq	.LC87(%rip), %rcx
	call	parser_error
	xorl	%r9d, %r9d
.L533:
	xorl	%edx, %edx
	xorl	%r8d, %r8d
	movl	$2, %ecx
	call	create_code_member
	movq	80(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L460
	.p2align 4,,10
	.p2align 3
.L616:
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
	je	.L496
	cmpl	$6, %eax
	jne	.L499
	movq	(%r15), %rcx
	movq	%r10, 56(%rsp)
	call	is_builtin_type
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L499
.L496:
	movq	(%r15), %rdx
	movq	88(%rsp), %rcx
	movq	%r10, 56(%rsp)
	call	search
	movq	56(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L625
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r10, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r10
	cmpl	$1, 24(%rax)
	jne	.L626
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
	jne	.L503
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%r15), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L503
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	56(%rsp), %r10
	cmpl	$6, 24(%rax)
	movq	%rax, %r15
	je	.L504
.L506:
	movq	%r15, %rdx
	leaq	.LC75(%rip), %rcx
	movq	%r10, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r10
.L505:
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
.L507:
	cmpl	$5, 24(%rbx)
	je	.L627
.L609:
	movq	%r12, %r10
	movq	%r15, %r12
	movq	%rbx, %r15
.L511:
	movq	%r15, %rdx
	leaq	.LC76(%rip), %rcx
	movq	%r10, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L498
	.p2align 4,,10
	.p2align 3
.L611:
	movq	(%rsi), %rbx
	jmp	.L447
	.p2align 4,,10
	.p2align 3
.L532:
	movq	112(%rsp), %r11
	movq	88(%rsp), %r8
	movq	96(%rsp), %rdx
	movq	104(%rsp), %rcx
	movq	%r11, 56(%rsp)
	call	create_class
	movq	56(%rsp), %r11
	testq	%rax, %rax
	movq	%rax, %r9
	jne	.L533
	jmp	.L490
	.p2align 4,,10
	.p2align 3
.L529:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L530
	jmp	.L527
	.p2align 4,,10
	.p2align 3
.L614:
	movq	%rax, %rdx
	leaq	.LC69(%rip), %rcx
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L490
	.p2align 4,,10
	.p2align 3
.L618:
	movq	%rax, %rdx
	leaq	.LC53(%rip), %rcx
	call	parser_error
	movq	56(%rsp), %r11
.L452:
	movq	%r11, %rdx
	leaq	.LC56(%rip), %rcx
	call	parser_error
	xorl	%edx, %edx
	jmp	.L459
	.p2align 4,,10
	.p2align 3
.L457:
	movq	%rbx, %rdx
	leaq	.LC55(%rip), %rcx
	movq	%r11, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L452
	.p2align 4,,10
	.p2align 3
.L469:
	movq	%rbp, %rdx
	leaq	.LC60(%rip), %rcx
	movq	%r11, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L464
	.p2align 4,,10
	.p2align 3
.L503:
	movq	%r15, %rdx
	leaq	.LC74(%rip), %rcx
	movq	%r10, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r10
.L498:
	movq	%r10, %rdx
	leaq	.LC83(%rip), %rcx
	call	parser_error
	xorl	%edx, %edx
.L526:
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	call	create_class_member
	movq	96(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L527
	.p2align 4,,10
	.p2align 3
.L623:
	movq	(%r12), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L478
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rbx, 96(%rsp)
	movq	104(%rsp), %rdi
	call	get_next_token
	movl	%ebp, %ebx
	movq	96(%rsp), %r11
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L480
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%r12), %rcx
	movq	%r11, 96(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	96(%rsp), %r11
	testb	%al, %al
	je	.L480
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
	jmp	.L481
	.p2align 4,,10
	.p2align 3
.L483:
	cmpl	$5, 8(%rax)
	movq	%rax, %rdx
	movq	%r15, %rcx
	cmove	%ebp, %ebx
	call	list_append
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rdi
.L481:
	cmpl	$5, 24(%rdi)
	jne	.L485
	movq	(%r12), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L628
.L485:
	movq	72(%rsp), %r8
	movq	%rsi, %rdx
	movq	%r14, %rcx
	call	parse_statement
	testq	%rax, %rax
	je	.L629
	testb	%bl, %bl
	je	.L483
	movq	%rdi, %rdx
	leaq	.LC66(%rip), %rcx
	movq	%rax, 96(%rsp)
	call	parser_error
	movq	96(%rsp), %rax
	jmp	.L483
	.p2align 4,,10
	.p2align 3
.L473:
	movq	56(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L472
	.p2align 4,,10
	.p2align 3
.L474:
	movq	(%r15), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L630
	cmpl	$5, 24(%rdi)
	jne	.L477
	movq	(%r12), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L470
	jmp	.L477
	.p2align 4,,10
	.p2align 3
.L627:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L631
	cmpl	$5, 24(%rbx)
	jne	.L609
	movq	0(%rbp), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L632
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	72(%rsp), %r8
	movq	%rsi, %rdx
	movq	%r14, %rcx
	movq	%rax, %rbx
	call	parse_variable
	testq	%rax, %rax
	je	.L633
	cmpq	$0, 16(%rax)
	je	.L517
	movq	%rbx, %rdx
	leaq	.LC78(%rip), %rcx
	call	parser_error
.L516:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L507
	.p2align 4,,10
	.p2align 3
.L517:
	movq	120(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L516
	.p2align 4,,10
	.p2align 3
.L624:
	movq	%rdi, %rdx
	leaq	.LC61(%rip), %rcx
	call	parser_error
	jmp	.L472
	.p2align 4,,10
	.p2align 3
.L633:
	movq	%rbx, %rdx
	leaq	.LC77(%rip), %rcx
	call	parser_error
	jmp	.L516
	.p2align 4,,10
	.p2align 3
.L610:
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
	jmp	.L446
	.p2align 4,,10
	.p2align 3
.L465:
	movq	%rbp, %rdx
	leaq	.LC57(%rip), %rcx
	movq	%r11, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L464
	.p2align 4,,10
	.p2align 3
.L499:
	movq	%r15, %rdx
	leaq	.LC71(%rip), %rcx
	movq	%r10, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L498
	.p2align 4,,10
	.p2align 3
.L617:
	movq	%rbx, %rdx
	leaq	.LC84(%rip), %rcx
	movq	%rax, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r8
	jmp	.L528
	.p2align 4,,10
	.p2align 3
.L630:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rdi
	jmp	.L470
.L622:
	movq	%rax, %rdx
	leaq	.LC59(%rip), %rcx
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L464
.L626:
	movq	%rax, %rdx
	leaq	.LC73(%rip), %rcx
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L498
.L619:
	movq	.refptr.FROM_KEYWORD(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	jne	.L454
	movl	24(%rbx), %eax
	jmp	.L453
.L632:
	movq	%r12, %r10
	movq	%r15, %r12
	movq	%rbx, %r15
	movq	128(%rsp), %rbx
	cmpl	$5, 24(%r15)
	jne	.L511
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%r15), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L511
.L519:
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r10, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r10
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L514
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L514
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
	jmp	.L520
	.p2align 4,,10
	.p2align 3
.L522:
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
.L520:
	cmpl	$5, 24(%rbx)
	jne	.L524
	movq	(%r15), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L634
.L524:
	movq	%r12, %r8
	movq	%rsi, %rdx
	movq	%r14, %rcx
	call	parse_statement
	testq	%rax, %rax
	je	.L635
	testb	%bpl, %bpl
	je	.L522
	movq	%rbx, %rdx
	leaq	.LC66(%rip), %rcx
	movq	%rax, 128(%rsp)
	call	parser_error
	movq	128(%rsp), %rax
	jmp	.L522
.L514:
	movq	%rbp, %rdx
	leaq	.LC79(%rip), %rcx
	movq	%r10, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L498
	.p2align 4,,10
	.p2align 3
.L635:
	movq	%rbx, %rdx
	leaq	.LC81(%rip), %rcx
	movq	%rax, 128(%rsp)
	call	parser_error
	movq	128(%rsp), %rax
	jmp	.L522
.L504:
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%r15), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L506
	jmp	.L505
.L620:
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
	jmp	.L458
.L634:
	movq	72(%rsp), %rax
	xorl	%edx, %edx
	movq	%r15, %r12
	movq	144(%rsp), %r10
	movq	%rbx, %r15
	movq	152(%rsp), %rbx
	movw	%dx, (%rax)
	testb	%bpl, %bpl
	jne	.L525
	movq	.refptr.name_void(%rip), %rax
	cmpq	(%rax), %rbx
	je	.L525
	movq	%r15, %rdx
	leaq	.LC82(%rip), %rcx
	movq	%r10, 128(%rsp)
	call	parser_error
	movq	128(%rsp), %r10
.L525:
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
	jne	.L526
	jmp	.L498
	.p2align 4,,10
	.p2align 3
.L621:
	movq	%rbp, %rdx
	leaq	.LC58(%rip), %rcx
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L464
.L625:
	movq	%r15, %rdx
	leaq	.LC72(%rip), %rcx
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L498
.L629:
	movq	%rdi, %rdx
	leaq	.LC65(%rip), %rcx
	movq	%rax, 96(%rsp)
	call	parser_error
	movq	96(%rsp), %rax
	jmp	.L483
.L454:
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r11, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$4, 24(%rax)
	jne	.L636
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rsi
	call	get_next_token
	movq	56(%rsp), %r11
	movq	%rax, %rbx
	movl	24(%rax), %eax
	jmp	.L453
.L631:
	movq	%r12, %r10
	movq	128(%rsp), %rbx
	movq	%r15, %r12
	jmp	.L519
.L480:
	movq	%r12, %rdx
	leaq	.LC64(%rip), %rcx
	movq	%r11, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L464
.L628:
	movq	72(%rsp), %rax
	movq	%rdi, %r9
	movq	104(%rsp), %r11
	movq	112(%rsp), %rdi
	movb	$0, (%rax)
	testb	%bl, %bl
	jne	.L486
	movq	.refptr.name_void(%rip), %rax
	cmpq	(%rax), %rdi
	je	.L486
	movq	%r9, %rdx
	leaq	.LC67(%rip), %rcx
	movq	%r11, 96(%rsp)
	call	parser_error
	movq	96(%rsp), %r11
.L486:
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
	jne	.L487
	jmp	.L464
	.p2align 4,,10
	.p2align 3
.L636:
	movq	%rax, %rdx
	leaq	.LC54(%rip), %rcx
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L452
	.seh_endproc
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
