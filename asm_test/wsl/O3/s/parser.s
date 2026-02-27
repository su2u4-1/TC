	.file	"parser.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Failed to parse parenthesized expression"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Expected ')' after expression"
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"Failed to parse operand of unary '!'"
	.align 8
.LC3:
	.string	"Failed to parse operand of unary '-'"
	.align 8
.LC4:
	.string	"Failed to parse variable access"
	.align 8
.LC5:
	.string	"Unexpected token in primary expression"
	.align 8
.LC6:
	.string	"Failed to parse expression primary"
	.text
	.p2align 4
	.type	parse_expression, @function
parse_expression:
	pushq	%r14
	pushq	%r13
	movq	%rsi, %r13
	pushq	%r12
	movq	%rdx, %r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	subq	$16, %rsp
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$2, %eax
	je	.L55
	cmpl	$3, %eax
	je	.L56
	cmpl	$4, %eax
	je	.L57
	cmpl	$6, %eax
	je	.L58
.L6:
	cmpl	$5, %eax
	je	.L10
	cmpl	$1, %eax
	je	.L12
.L13:
	movq	%rbx, %rsi
	leaq	.LC5(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L16:
	movq	%rbp, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	leaq	.LC6(%rip), %rdi
	movq	%rax, %rsi
	call	*parser_error@GOTPCREL(%rip)
	addq	$16, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L56:
	movq	(%rbx), %rsi
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$1, %ebx
.L3:
	movl	%ebx, %edi
	call	*create_primary@GOTPCREL(%rip)
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L16
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	addq	$16, %rsp
	movq	%r12, %r8
	movq	%r13, %rcx
	popq	%rbx
	movq	%rbp, %rdi
	movq	%rax, %rsi
	popq	%rbp
	xorl	%edx, %edx
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	parse_expr_prec
	.p2align 4,,10
	.p2align 3
.L55:
	movq	(%rbx), %rsi
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%ebx, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L57:
	movq	(%rbx), %rsi
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$2, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L58:
	movq	(%rbx), %rdi
	movq	TRUE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L59
	movl	24(%rbx), %eax
	cmpl	$6, %eax
	jne	.L6
	movq	(%rbx), %rdi
	movq	FALSE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L9
	movl	24(%rbx), %eax
	cmpl	$5, %eax
	jne	.L20
	.p2align 4,,10
	.p2align 3
.L10:
	movq	(%rbx), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L60
	movl	24(%rbx), %eax
	cmpl	$5, %eax
	jne	.L20
	movq	(%rbx), %rdi
	movq	NOT_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L61
	movl	24(%rbx), %eax
	cmpl	$5, %eax
	jne	.L20
	movq	(%rbx), %rdi
	movq	SUB_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L21
	movl	24(%rbx), %eax
.L20:
	cmpl	$1, %eax
	je	.L12
	cmpl	$6, %eax
	jne	.L13
	movq	(%rbx), %rdi
	movq	SELF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L13
	cmpb	$0, 1(%r12)
	je	.L13
.L12:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	parse_variable_access
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L23
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$8, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L59:
	movq	(%rbx), %rsi
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$3, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L9:
	movq	(%rbx), %rsi
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$4, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L60:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	parse_expression
	testq	%rax, %rax
	je	.L62
	movq	%rax, 8(%rsp)
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %rdx
	movl	24(%rax), %ebx
	movq	%rax, %r14
	cmpl	$5, %ebx
	jne	.L18
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	%rdx, 8(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L18
	movq	8(%rsp), %rdx
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L61:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	parse_primary
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L63
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$6, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L21:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	parse_primary
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L64
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$7, %ebx
	jmp	.L3
.L18:
	movq	%r14, %rsi
	leaq	.LC1(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L16
.L23:
	movq	%rbx, %rsi
	leaq	.LC4(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L16
.L62:
	movq	%rbx, %rsi
	leaq	.LC0(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L16
.L63:
	movq	%rbx, %rsi
	leaq	.LC2(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L16
.L64:
	movq	%rbx, %rsi
	leaq	.LC3(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L16
	.size	parse_expression, .-parse_expression
	.p2align 4
	.type	parse_primary, @function
parse_primary:
	pushq	%r13
	movq	%rdx, %r13
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	subq	$24, %rsp
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$2, %eax
	je	.L116
	cmpl	$3, %eax
	je	.L117
	cmpl	$4, %eax
	je	.L118
	cmpl	$6, %eax
	je	.L119
.L70:
	cmpl	$5, %eax
	je	.L74
	cmpl	$1, %eax
	je	.L76
.L77:
	movq	%rbx, %rsi
	leaq	.LC5(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L82:
	addq	$24, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L117:
	movq	(%rbx), %rsi
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$1, %ebx
.L67:
	addq	$24, %rsp
	movl	%ebx, %edi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	*create_primary@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L116:
	movq	(%rbx), %rsi
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%ebx, %ebx
	jmp	.L67
	.p2align 4,,10
	.p2align 3
.L118:
	movq	(%rbx), %rsi
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$2, %ebx
	jmp	.L67
	.p2align 4,,10
	.p2align 3
.L119:
	movq	(%rbx), %rdi
	movq	TRUE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L120
	movl	24(%rbx), %eax
	cmpl	$6, %eax
	jne	.L70
	movq	(%rbx), %rdi
	movq	FALSE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L73
	movl	24(%rbx), %eax
	cmpl	$5, %eax
	jne	.L85
	.p2align 4,,10
	.p2align 3
.L74:
	movq	(%rbx), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L121
	movl	24(%rbx), %eax
	cmpl	$5, %eax
	jne	.L85
	movq	(%rbx), %rdi
	movq	NOT_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L122
	movl	24(%rbx), %eax
	cmpl	$5, %eax
	jne	.L85
	movq	(%rbx), %rdi
	movq	SUB_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L86
	movl	24(%rbx), %eax
.L85:
	cmpl	$1, %eax
	je	.L76
	cmpl	$6, %eax
	jne	.L77
	movq	(%rbx), %rdi
	movq	SELF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L77
	cmpb	$0, 1(%r13)
	je	.L77
.L76:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	parse_variable_access
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L88
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$8, %ebx
	jmp	.L67
	.p2align 4,,10
	.p2align 3
.L120:
	movq	(%rbx), %rsi
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$3, %ebx
	jmp	.L67
	.p2align 4,,10
	.p2align 3
.L73:
	movq	(%rbx), %rsi
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$4, %ebx
	jmp	.L67
	.p2align 4,,10
	.p2align 3
.L121:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	parse_expression
	testq	%rax, %rax
	je	.L123
	movq	%rbp, %rdi
	movq	%rax, 8(%rsp)
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %rdx
	movl	24(%rax), %ebx
	movq	%rax, %rbp
	cmpl	$5, %ebx
	jne	.L83
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	%rdx, 8(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L83
	movq	8(%rsp), %rdx
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	jmp	.L67
	.p2align 4,,10
	.p2align 3
.L122:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	parse_primary
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L124
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$6, %ebx
	jmp	.L67
	.p2align 4,,10
	.p2align 3
.L86:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	parse_primary
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L125
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$7, %ebx
	jmp	.L67
.L83:
	movq	%rbp, %rsi
	leaq	.LC1(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L82
.L88:
	movq	%rbx, %rsi
	leaq	.LC4(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L82
.L123:
	movq	%rbx, %rsi
	leaq	.LC0(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L82
.L124:
	movq	%rbx, %rsi
	leaq	.LC2(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L82
.L125:
	movq	%rbx, %rsi
	leaq	.LC3(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L82
	.size	parse_primary, .-parse_primary
	.section	.rodata.str1.1
.LC7:
	.string	"Failed to parse right operand"
	.text
	.p2align 4
	.type	parse_expr_prec, @function
parse_expr_prec:
	pushq	%r15
	movq	%r8, %r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	subq	$40, %rsp
	movq	%rsi, 8(%rsp)
	movl	$1, %esi
	movl	%edx, 28(%rsp)
	movq	%rcx, 16(%rsp)
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	jne	.L136
.L134:
	movq	(%rax), %rdi
	call	*string_to_operator@GOTPCREL(%rip)
	movl	%eax, %r12d
	movl	%eax, %edi
	call	*operator_precedence@GOTPCREL(%rip)
	movl	%eax, %ebp
	cmpl	$19, %r12d
	je	.L136
	movl	28(%rsp), %eax
	cmpl	%eax, %ebp
	jl	.L136
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %rsi
	movq	%r15, %rdx
	movq	%rbx, %rdi
	movq	%rax, %r13
	call	parse_primary
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L141
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rax, %r13
.L140:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	jne	.L130
	movq	(%rax), %rdi
	call	*string_to_operator@GOTPCREL(%rip)
	movl	%eax, %r14d
	movl	%eax, %edi
	call	*operator_precedence@GOTPCREL(%rip)
	cmpl	$19, %r14d
	je	.L130
	cmpl	%eax, %ebp
	jge	.L130
	movq	16(%rsp), %rcx
	movq	%r13, %rsi
	movq	%r15, %r8
	movl	%eax, %edx
	movq	%rbx, %rdi
	call	parse_expr_prec
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L140
	xorl	%r14d, %r14d
	jmp	.L126
	.p2align 4,,10
	.p2align 3
.L130:
	xorl	%edx, %edx
	movq	8(%rsp), %rsi
	movq	%r13, %rcx
	movl	%r12d, %edi
	call	*create_expression@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	je	.L134
.L136:
	movq	8(%rsp), %r14
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
.L126:
	addq	$40, %rsp
	movq	%r14, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L141:
	movq	%r13, %rsi
	leaq	.LC7(%rip), %rdi
	xorl	%r14d, %r14d
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L126
	.size	parse_expr_prec, .-parse_expr_prec
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"Expected variable name in variable access"
	.align 8
.LC9:
	.string	"Cannot call undefined variable"
	.align 8
.LC10:
	.string	"Cannot call non-function variable"
	.align 8
.LC11:
	.string	"Failed to parse function call argument"
	.align 8
.LC12:
	.string	"Expected ',' or ')' after function call argument"
	.align 8
.LC13:
	.string	"Failed to parse sequence index"
	.align 8
.LC14:
	.string	"Expected ']' after sequence index"
	.align 8
.LC15:
	.string	"Cannot access attribute without a valid scope"
	.align 8
.LC16:
	.string	"Expected attribute name after '.'"
	.section	.rodata.str1.1
.LC17:
	.string	"Unknown attribute name"
	.text
	.p2align 4
	.type	parse_variable_access, @function
parse_variable_access:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rdx, %r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movq	%rdi, %rbx
	subq	$40, %rsp
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %r13
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L143
	cmpl	$6, %eax
	jne	.L146
	movq	0(%r13), %rdi
	movq	SELF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L146
.L143:
	movq	0(%r13), %rsi
	movq	%rbp, %rdi
	call	*search@GOTPCREL(%rip)
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	xorl	%edi, %edi
	movq	%rax, %rdx
	movq	%rax, %r14
	call	*create_variable_access@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%rax, %r13
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	jne	.L142
	movq	$0, 8(%rsp)
	movq	$0, 16(%rsp)
.L174:
	testq	%r14, %r14
	je	.L148
	movl	24(%r14), %eax
	leal	-1(%rax), %ecx
	cmpl	$2, %ecx
	jbe	.L177
	cmpl	$5, %eax
	jne	.L149
.L177:
	movq	16(%r14), %rax
	movq	%rax, 16(%rsp)
.L148:
	cmpq	$0, 8(%rsp)
	jne	.L151
	movq	16(%rsp), %rax
	testq	%rax, %rax
	je	.L151
	movq	$0, 8(%rsp)
	cmpl	$4, 24(%rax)
	jne	.L151
	movq	16(%rax), %rax
	movq	%rax, 8(%rsp)
.L151:
	movq	(%r15), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L207
	movq	(%r15), %rdi
	movq	L_BRACKET_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L165
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movq	%rax, 24(%rsp)
	call	parse_primary
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L208
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%r12, %r8
	movq	%rbp, %rcx
	xorl	%edx, %edx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	parse_expr_prec
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L167
.L168:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rdx
	jne	.L170
	movq	(%rax), %rdi
	movq	R_BRACKET_SYMBOL(%rip), %rsi
	movq	%rax, 24(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	24(%rsp), %rdx
	testb	%al, %al
	je	.L170
	movq	%r13, %rsi
	xorl	%r8d, %r8d
	movq	%r15, %rcx
	xorl	%edx, %edx
	movl	$3, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %r13
.L164:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	je	.L174
.L142:
	addq	$40, %rsp
	movq	%r13, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L165:
	movq	(%r15), %rdi
	movq	DOT_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L142
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpq	$0, 8(%rsp)
	movq	%rax, %r15
	je	.L209
	cmpl	$1, 24(%rax)
	jne	.L210
	movq	(%rax), %rsi
	movq	8(%rsp), %rdi
	call	*search@GOTPCREL(%rip)
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L211
	movq	%r13, %rsi
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	movl	$2, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	$0, 8(%rsp)
	movq	$0, 16(%rsp)
	movq	%rax, %r13
	jmp	.L164
	.p2align 4,,10
	.p2align 3
.L207:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	testq	%r14, %r14
	je	.L212
.L153:
	movl	24(%r14), %ecx
	leal	-2(%rcx), %edx
	cmpl	$1, %edx
	ja	.L213
.L154:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r15
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L155:
	cmpl	$5, 24(%r15)
	je	.L214
.L163:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	parse_primary
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L215
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%r12, %r8
	movq	%rbp, %rcx
	xorl	%edx, %edx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	parse_expr_prec
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L157
.L158:
	movq	8(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	je	.L159
.L162:
	movq	%r15, %rsi
	leaq	.LC12(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L145:
	xorl	%r13d, %r13d
	jmp	.L142
	.p2align 4,,10
	.p2align 3
.L214:
	movq	(%r15), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L163
	movq	%r13, %rsi
	movq	8(%rsp), %r8
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$1, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	16(%r14), %r14
	movq	$0, 8(%rsp)
	movq	$0, 16(%rsp)
	movq	%rax, %r13
	jmp	.L164
	.p2align 4,,10
	.p2align 3
.L159:
	movq	(%rax), %rdi
	movq	COMMA_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L216
	cmpl	$5, 24(%r15)
	jne	.L162
	movq	(%r15), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L155
	jmp	.L162
	.p2align 4,,10
	.p2align 3
.L215:
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	leaq	.LC6(%rip), %rdi
	movq	%rax, %rsi
	call	*parser_error@GOTPCREL(%rip)
.L157:
	movq	%r15, %rsi
	leaq	.LC11(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	xorl	%esi, %esi
	jmp	.L158
	.p2align 4,,10
	.p2align 3
.L216:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r15
	jmp	.L155
	.p2align 4,,10
	.p2align 3
.L213:
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L154
	.p2align 4,,10
	.p2align 3
.L146:
	movq	%r13, %rsi
	leaq	.LC8(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L145
	.p2align 4,,10
	.p2align 3
.L149:
	andl	$-5, %eax
	movq	16(%rsp), %rax
	cmove	%r14, %rax
	movq	%rax, 16(%rsp)
	jmp	.L148
.L208:
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	leaq	.LC6(%rip), %rdi
	movq	%rax, %rsi
	call	*parser_error@GOTPCREL(%rip)
.L167:
	movq	24(%rsp), %rsi
	leaq	.LC13(%rip), %rdi
	xorl	%r15d, %r15d
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L168
	.p2align 4,,10
	.p2align 3
.L212:
	movq	%rax, 8(%rsp)
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %rax
	jmp	.L153
.L170:
	movq	%rdx, %rsi
	leaq	.LC14(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L145
.L209:
	movq	%rax, %rsi
	leaq	.LC15(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L145
.L211:
	movq	%r15, %rsi
	leaq	.LC17(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L145
.L210:
	movq	%rax, %rsi
	leaq	.LC16(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L145
	.size	parse_variable_access, .-parse_variable_access
	.section	.rodata.str1.1
.LC18:
	.string	"Expected variable type"
	.section	.rodata.str1.8
	.align 8
.LC19:
	.string	"Expected a type for variable declaration"
	.section	.rodata.str1.1
.LC20:
	.string	"Unknown variable type"
.LC21:
	.string	"Expected variable name"
	.section	.rodata.str1.8
	.align 8
.LC22:
	.string	"Failed to parse variable initializer"
	.text
	.p2align 4
	.type	parse_variable, @function
parse_variable:
	pushq	%r15
	pushq	%r14
	movq	%rdx, %r14
	pushq	%r13
	movq	%rsi, %r13
	pushq	%r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	subq	$8, %rsp
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L218
	cmpl	$6, %eax
	jne	.L221
	movq	(%rbx), %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	testb	%al, %al
	je	.L221
.L218:
	movq	(%rbx), %rsi
	movq	%r13, %rdi
	call	*search@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L222
	testl	$-5, 24(%rax)
	jne	.L245
.L223:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L246
.L224:
	movq	(%rbx), %rdi
	xorl	%ecx, %ecx
	movq	%r13, %r8
	movq	%r12, %rdx
	movl	$1, %esi
	call	*create_name@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	je	.L247
.L226:
	xorl	%edx, %edx
.L230:
	addq	$8, %rsp
	movq	%rbx, %rsi
	movq	%r12, %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*create_variable@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L246:
	movq	%rax, %rsi
	leaq	.LC21(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L224
	.p2align 4,,10
	.p2align 3
.L221:
	movq	%rbx, %rsi
	leaq	.LC18(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	addq	$8, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L245:
	movq	%rbx, %rsi
	leaq	.LC19(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L223
	.p2align 4,,10
	.p2align 3
.L247:
	movq	(%rax), %rdi
	movq	ASSIGN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L226
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%r14, %rdx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	movq	%rax, %r15
	call	parse_primary
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L248
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	%r14, %r8
	movq	%r13, %rcx
	movq	%rax, %rsi
	movq	%rbp, %rdi
	call	parse_expr_prec
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L230
.L229:
	movq	%r15, %rsi
	leaq	.LC22(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L226
	.p2align 4,,10
	.p2align 3
.L222:
	movq	%rbx, %rsi
	leaq	.LC20(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L223
.L248:
	movq	%rbp, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	leaq	.LC6(%rip), %rdi
	movq	%rax, %rsi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L229
	.size	parse_variable, .-parse_variable
	.section	.rodata.str1.1
.LC23:
	.string	"Expected '(' after 'if'"
.LC24:
	.string	"Failed to parse if condition"
	.section	.rodata.str1.8
	.align 8
.LC25:
	.string	"Expected ')' after if condition"
	.section	.rodata.str1.1
.LC26:
	.string	"Expected '{' to start if body"
	.section	.rodata.str1.8
	.align 8
.LC27:
	.string	"Failed to parse if body statement"
	.section	.rodata.str1.1
.LC28:
	.string	"Expected '(' after 'elif'"
	.section	.rodata.str1.8
	.align 8
.LC29:
	.string	"Failed to parse else-if condition"
	.align 8
.LC30:
	.string	"Expected ')' after else-if condition"
	.align 8
.LC31:
	.string	"Expected '{' to start else-if body"
	.align 8
.LC32:
	.string	"Failed to parse else-if body statement"
	.align 8
.LC33:
	.string	"Expected '{' to start else body"
	.align 8
.LC34:
	.string	"Failed to parse else body statement"
	.section	.rodata.str1.1
.LC35:
	.string	"Expected '(' after 'for'"
	.section	.rodata.str1.8
	.align 8
.LC36:
	.string	"Failed to parse for loop initializer"
	.align 8
.LC37:
	.string	"Expected ';' after for loop initializer"
	.align 8
.LC38:
	.string	"Failed to parse for loop condition"
	.align 8
.LC39:
	.string	"Expected ';' after for loop condition"
	.align 8
.LC40:
	.string	"Failed to parse for loop increment"
	.align 8
.LC41:
	.string	"Expected ')' after for loop increment"
	.align 8
.LC42:
	.string	"Expected '{' to start for loop body"
	.align 8
.LC43:
	.string	"Failed to parse for loop body statement"
	.section	.rodata.str1.1
.LC44:
	.string	"Expected '(' after 'while'"
	.section	.rodata.str1.8
	.align 8
.LC45:
	.string	"Failed to parse while condition"
	.align 8
.LC46:
	.string	"Expected ')' after while condition"
	.align 8
.LC47:
	.string	"Expected '{' to start while body"
	.align 8
.LC48:
	.string	"Failed to parse while body statement"
	.align 8
.LC49:
	.string	"Cannot use 'break' outside of a loop"
	.align 8
.LC50:
	.string	"Cannot use 'continue' outside of a loop"
	.section	.rodata.str1.1
.LC51:
	.string	"Failed to parse statement"
.LC52:
	.string	"Expected ';' after statement"
	.text
	.p2align 4
	.type	parse_statement, @function
parse_statement:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rbx
	movq	%rdi, %rbx
	subq	$56, %rsp
	call	*peek_current_token@GOTPCREL(%rip)
	cmpl	$6, 24(%rax)
	je	.L431
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	parse_primary
	testq	%rax, %rax
	je	.L432
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rbp, %r8
	movq	%r12, %rcx
	xorl	%edx, %edx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	parse_expr_prec
.L429:
	movq	%rax, %r8
.L344:
	xorl	%r9d, %r9d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rbp
.L335:
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	testq	%rbp, %rbp
	je	.L433
.L345:
	movq	%rbx, %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L346
.L348:
	movq	%rbx, %rsi
	leaq	.LC52(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L249:
	addq	$56, %rsp
	movq	%rbp, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L346:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L348
	jmp	.L249
	.p2align 4,,10
	.p2align 3
.L431:
	movq	(%rax), %rdi
	movq	IF_KEYWORD(%rip), %rsi
	movq	%rax, %r13
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L434
	movq	0(%r13), %rdi
	movq	FOR_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L435
	movq	0(%r13), %rdi
	movq	WHILE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L436
	movq	0(%r13), %rdi
	movq	VAR_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L437
	movq	0(%r13), %rdi
	movq	RETURN_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L336
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	parse_expression
	xorl	%r9d, %r9d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rax, %r8
	xorl	%esi, %esi
	movl	$5, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L335
	.p2align 4,,10
	.p2align 3
.L435:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L289
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L289
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r14
	je	.L290
.L293:
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	parse_variable
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L438
.L292:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
.L294:
	cmpl	$5, 24(%r14)
	jne	.L297
	movq	(%r14), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L297
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	je	.L298
.L301:
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	parse_primary
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L439
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rbp, %r8
	movq	%r12, %rcx
	xorl	%edx, %edx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	parse_expr_prec
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L303
.L304:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r15
.L302:
	cmpl	$5, 24(%r15)
	jne	.L306
	movq	(%r15), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L306
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	je	.L307
.L310:
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	parse_primary
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L440
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rbp, %r8
	movq	%r12, %rcx
	xorl	%edx, %edx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	parse_expr_prec
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	je	.L312
.L313:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r15
.L311:
	cmpl	$5, 24(%r15)
	jne	.L315
	movq	(%r15), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L315
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	jne	.L317
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L317
	call	*create_list@GOTPCREL(%rip)
	movb	$1, 2(%rbp)
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%rax, %r15
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
	jmp	.L318
	.p2align 4,,10
	.p2align 3
.L319:
	movq	%rax, %rsi
	movq	%r15, %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
.L318:
	cmpl	$5, 24(%r14)
	jne	.L320
	movq	(%r14), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L441
.L320:
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	testq	%rax, %rax
	jne	.L319
	movq	%rax, 24(%rsp)
	movq	%r14, %rsi
	leaq	.LC43(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	24(%rsp), %rax
	jmp	.L319
	.p2align 4,,10
	.p2align 3
.L433:
	movq	%rax, %rsi
	leaq	.LC51(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L345
	.p2align 4,,10
	.p2align 3
.L434:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L254
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L254
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movq	%rax, %r13
	call	parse_primary
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L442
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rbp, %r8
	movq	%r12, %rcx
	xorl	%edx, %edx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	parse_expr_prec
	movq	%rax, 32(%rsp)
	testq	%rax, %rax
	je	.L256
.L257:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L259
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L259
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L261
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L261
	call	*create_list@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%rax, %r15
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
	jmp	.L262
	.p2align 4,,10
	.p2align 3
.L263:
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
.L262:
	cmpl	$5, 24(%r13)
	jne	.L264
	movq	0(%r13), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L443
.L264:
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L263
	movq	%r13, %rsi
	leaq	.LC27(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L263
	.p2align 4,,10
	.p2align 3
.L254:
	movq	%r13, %rsi
	leaq	.LC23(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L253:
	xorl	%esi, %esi
.L266:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$2, %edi
.L430:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*create_statement@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L432:
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	*peek_current_token@GOTPCREL(%rip)
	leaq	.LC6(%rip), %rdi
	movq	%rax, %rsi
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %r8
	jmp	.L344
	.p2align 4,,10
	.p2align 3
.L436:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L324
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L324
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movq	%rax, %r13
	call	parse_expression
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L444
.L325:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L328
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L328
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L330
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L330
	call	*create_list@GOTPCREL(%rip)
	movb	$1, 2(%rbp)
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%rax, %r13
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r15
	jmp	.L331
	.p2align 4,,10
	.p2align 3
.L332:
	movq	%rax, %rsi
	movq	%r13, %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r15
.L331:
	cmpl	$5, 24(%r15)
	jne	.L333
	movq	(%r15), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L445
.L333:
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	testq	%rax, %rax
	jne	.L332
	movq	%rax, 8(%rsp)
	movq	%r15, %rsi
	leaq	.LC48(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %rax
	jmp	.L332
	.p2align 4,,10
	.p2align 3
.L437:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	parse_variable
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rax, %r9
	xorl	%esi, %esi
	movl	$1, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L335
	.p2align 4,,10
	.p2align 3
.L259:
	movq	%r13, %rsi
	leaq	.LC25(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L253
	.p2align 4,,10
	.p2align 3
.L289:
	movq	%r13, %rsi
	leaq	.LC35(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L288:
	xorl	%ecx, %ecx
.L296:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$4, %edi
	jmp	.L430
	.p2align 4,,10
	.p2align 3
.L324:
	movq	%r13, %rsi
	leaq	.LC44(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L323:
	xorl	%edx, %edx
.L327:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$3, %edi
	jmp	.L430
.L442:
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	leaq	.LC6(%rip), %rdi
	movq	%rax, %rsi
	call	*parser_error@GOTPCREL(%rip)
.L256:
	movq	%r13, %rsi
	leaq	.LC24(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	$0, 32(%rsp)
	jmp	.L257
	.p2align 4,,10
	.p2align 3
.L336:
	movq	0(%r13), %rdi
	movq	BREAK_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L337
	cmpb	$0, 2(%rbp)
	je	.L446
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$6, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L335
	.p2align 4,,10
	.p2align 3
.L297:
	movq	%r14, %rsi
	leaq	.LC37(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L288
.L261:
	movq	%r13, %rsi
	leaq	.LC26(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L253
.L443:
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 24(%rsp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L428:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$6, 24(%rax)
	movq	%rax, %r13
	jne	.L279
	movq	(%rax), %rdi
	movq	ELIF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L447
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L268
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L268
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movq	%rax, %r13
	call	parse_primary
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L448
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rbp, %r8
	movq	%r12, %rcx
	xorl	%edx, %edx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	parse_expr_prec
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	je	.L270
.L271:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L273
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L273
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L275
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L275
	call	*create_list@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%rax, %r13
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
	jmp	.L276
	.p2align 4,,10
	.p2align 3
.L277:
	movq	%rax, %rsi
	movq	%r13, %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
.L276:
	cmpl	$5, 24(%r14)
	jne	.L278
	movq	(%r14), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L449
.L278:
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	testq	%rax, %rax
	jne	.L277
	movq	%rax, 8(%rsp)
	movq	%r14, %rsi
	leaq	.LC32(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %rax
	jmp	.L277
	.p2align 4,,10
	.p2align 3
.L449:
	movq	16(%rsp), %rdi
	movq	%r13, %rsi
	call	*create_else_if@GOTPCREL(%rip)
	movq	24(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L428
.L448:
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	leaq	.LC6(%rip), %rdi
	movq	%rax, %rsi
	call	*parser_error@GOTPCREL(%rip)
.L270:
	movq	%r13, %rsi
	leaq	.LC29(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	$0, 16(%rsp)
	jmp	.L271
.L290:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	xorl	%r13d, %r13d
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L294
	jmp	.L293
.L328:
	movq	%r13, %rsi
	leaq	.LC46(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L323
.L306:
	movq	%r15, %rsi
	leaq	.LC39(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L288
.L337:
	movq	0(%r13), %rdi
	movq	CONTINUE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L340
	cmpb	$0, 2(%rbp)
	je	.L450
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$7, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L335
.L298:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L301
	movq	$0, 8(%rsp)
	jmp	.L302
.L330:
	movq	%r13, %rsi
	leaq	.LC47(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L323
.L445:
	movb	$0, 2(%rbp)
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	*create_while@GOTPCREL(%rip)
	movq	%rax, %rdx
	jmp	.L327
.L438:
	movq	%r14, %rsi
	leaq	.LC36(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L292
.L315:
	movq	%r15, %rsi
	leaq	.LC41(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L288
.L444:
	movq	%r13, %rsi
	leaq	.LC45(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L325
.L268:
	movq	%r13, %rsi
	leaq	.LC28(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L253
.L279:
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%r15, %rsi
	movq	40(%rsp), %rcx
	movq	24(%rsp), %rdx
	movq	32(%rsp), %rdi
	call	*create_if@GOTPCREL(%rip)
	movq	%rax, %rsi
	jmp	.L266
.L273:
	movq	%r13, %rsi
	leaq	.LC30(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L253
.L275:
	movq	%r13, %rsi
	leaq	.LC31(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L253
.L307:
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L310
	movq	$0, 16(%rsp)
	jmp	.L311
.L446:
	movq	%r13, %rsi
	leaq	.LC49(%rip), %rdi
	xorl	%ebp, %ebp
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L249
.L439:
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	leaq	.LC6(%rip), %rdi
	movq	%rax, %rsi
	call	*parser_error@GOTPCREL(%rip)
.L303:
	movq	%r15, %rsi
	leaq	.LC38(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	$0, 8(%rsp)
	jmp	.L304
.L340:
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	parse_expression
	jmp	.L429
.L317:
	movq	%r15, %rsi
	leaq	.LC42(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L288
.L441:
	movq	%r15, %rcx
	movb	$0, 2(%rbp)
	movq	16(%rsp), %rdx
	movq	%r13, %rdi
	movq	8(%rsp), %rsi
	call	*create_for@GOTPCREL(%rip)
	movq	%rax, %rcx
	jmp	.L296
.L447:
	cmpl	$6, 24(%r13)
	jne	.L279
	movq	0(%r13), %rdi
	movq	ELSE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L279
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L282
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L282
	movl	$1, %esi
	movq	%rbx, %rdi
	leaq	.LC34(%rip), %r13
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
	jmp	.L283
	.p2align 4,,10
	.p2align 3
.L284:
	movq	%rax, %rsi
	movq	40(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
.L283:
	cmpl	$5, 24(%r14)
	jne	.L285
	movq	(%r14), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L279
.L285:
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	testq	%rax, %rax
	jne	.L284
	movq	%rax, 8(%rsp)
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %rax
	jmp	.L284
.L440:
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	leaq	.LC6(%rip), %rdi
	movq	%rax, %rsi
	call	*parser_error@GOTPCREL(%rip)
.L312:
	movq	%r15, %rsi
	leaq	.LC40(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	$0, 16(%rsp)
	jmp	.L313
.L450:
	movq	%r13, %rsi
	leaq	.LC50(%rip), %rdi
	xorl	%ebp, %ebp
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L249
.L282:
	movq	%r13, %rsi
	leaq	.LC33(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L253
	.size	parse_statement, .-parse_statement
	.section	.rodata.str1.8
	.align 8
.LC53:
	.string	"Expected identifier after 'import'"
	.align 8
.LC54:
	.string	"Expected string literal after 'from'"
	.align 8
.LC55:
	.string	"Expected ';' at end of import statement"
	.align 8
.LC56:
	.string	"Failed to parse import statement"
	.align 8
.LC57:
	.string	"Expected function return type after 'func'"
	.section	.rodata.str1.1
.LC58:
	.string	"Unknown function return type"
	.section	.rodata.str1.8
	.align 8
.LC59:
	.string	"Expected function name after return type"
	.align 8
.LC60:
	.string	"Expected '(' after function name"
	.align 8
.LC61:
	.string	"Failed to parse function parameter"
	.align 8
.LC62:
	.string	"Function parameters cannot have default values"
	.align 8
.LC63:
	.string	"Expected ',' or ')' after function parameter"
	.align 8
.LC64:
	.string	"Expected '{' to start function body"
	.align 8
.LC65:
	.string	"Failed to parse function body statement"
	.align 8
.LC66:
	.string	"Unreachable code after return statement"
	.align 8
.LC67:
	.string	"Function missing return statement"
	.align 8
.LC68:
	.string	"Failed to parse function declaration"
	.align 8
.LC69:
	.string	"Expected class name after 'class'"
	.align 8
.LC70:
	.string	"Expected '{' to start class body"
	.align 8
.LC71:
	.string	"Expected method return type after 'method'"
	.align 8
.LC72:
	.string	"Unknown return type for method"
	.align 8
.LC73:
	.string	"Expected method name after return type"
	.align 8
.LC74:
	.string	"Expected '(' after method name"
	.align 8
.LC75:
	.string	"Expected 'self' as first parameter of method"
	.align 8
.LC76:
	.string	"Expected ',' or ')' after method parameter"
	.align 8
.LC77:
	.string	"Failed to parse method parameter"
	.align 8
.LC78:
	.string	"Method parameters cannot have default values"
	.align 8
.LC79:
	.string	"Expected '{' to start method body"
	.align 8
.LC81:
	.string	"Failed to parse method body statement"
	.align 8
.LC82:
	.string	"Method missing return statement"
	.section	.rodata.str1.1
.LC83:
	.string	"Failed to parse class method"
	.section	.rodata.str1.8
	.align 8
.LC84:
	.string	"Failed to parse class variable"
	.align 8
.LC85:
	.string	"Expected ';' after class variable declaration"
	.align 8
.LC86:
	.string	"Unexpected token in class member"
	.align 8
.LC87:
	.string	"Failed to parse class declaration"
	.align 8
.LC88:
	.string	"Unexpected token in code member"
	.text
	.p2align 4
	.globl	parse_code
	.type	parse_code, @function
parse_code:
	pushq	%r15
	movq	%rdi, %r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$120, %rsp
	cmpq	$0, builtin_scope(%rip)
	movq	%rdx, 8(%rsp)
	je	.L618
.L452:
	testq	%rbx, %rbx
	cmove	builtin_scope(%rip), %rbx
	leaq	.LC88(%rip), %r14
	movq	%r15, %rbp
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 32(%rsp)
	movq	%rbx, %rdi
	call	*create_scope@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r15, %rdi
	movq	%rax, 24(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r10
	testq	%rax, %rax
	jne	.L454
	jmp	.L540
	.p2align 4,,10
	.p2align 3
.L494:
	movq	%r10, %rsi
	movq	%r14, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L466:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r10
	testq	%rax, %rax
	je	.L540
.L454:
	movl	24(%r10), %eax
	testl	%eax, %eax
	je	.L540
	cmpl	$6, %eax
	jne	.L494
	movq	(%r10), %rdi
	movq	IMPORT_KEYWORD(%rip), %rsi
	movq	%r10, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testb	%al, %al
	movl	%eax, %ebx
	jne	.L619
	cmpl	$6, 24(%r10)
	jne	.L494
	movq	(%r10), %rdi
	movq	FUNC_KEYWORD(%rip), %rsi
	movq	%r10, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testb	%al, %al
	jne	.L620
	cmpl	$6, 24(%r10)
	jne	.L494
	movq	(%r10), %rdi
	movq	CLASS_KEYWORD(%rip), %rsi
	movq	%r10, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testb	%al, %al
	je	.L494
	movq	24(%rsp), %rdi
	call	*create_scope@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbp, %rdi
	movq	%rax, 40(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	cmpl	$1, 24(%rax)
	jne	.L621
	movq	%r10, 16(%rsp)
	xorl	%edx, %edx
	movq	(%rax), %rdi
	movl	$4, %esi
	movq	24(%rsp), %r8
	movq	40(%rsp), %rcx
	call	*create_name@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbp, %rdi
	movq	%rax, 56(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L498
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	%r10, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testb	%al, %al
	je	.L498
	call	*create_list@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbp, %rdi
	leaq	.LC86(%rip), %r12
	movq	%rax, 48(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	movq	%rax, %r9
	movq	%r10, 72(%rsp)
	jmp	.L499
	.p2align 4,,10
	.p2align 3
.L537:
	cmpl	$6, %eax
	je	.L622
.L500:
	movq	%r9, %rsi
	movq	%r12, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L533:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r9
.L499:
	movl	24(%r9), %eax
	cmpl	$5, %eax
	jne	.L537
	movq	(%r9), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	movq	%r9, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L538
	movq	16(%rsp), %r9
	movl	24(%r9), %eax
	cmpl	$6, %eax
	jne	.L500
.L622:
	movq	(%r9), %rdi
	movq	METHOD_KEYWORD(%rip), %rsi
	movq	%r9, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	testb	%al, %al
	jne	.L623
	cmpl	$6, 24(%r9)
	jne	.L500
	movq	(%r9), %rdi
	movq	VAR_KEYWORD(%rip), %rsi
	movq	%r9, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	testb	%al, %al
	je	.L500
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %rdx
	movq	40(%rsp), %rsi
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	parse_variable
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L624
.L534:
	xorl	%esi, %esi
	movl	$1, %edi
	call	*create_class_member@GOTPCREL(%rip)
	movq	48(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L535
.L536:
	movq	%rbx, %rsi
	leaq	.LC85(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L533
	.p2align 4,,10
	.p2align 3
.L540:
	movq	24(%rsp), %rsi
	movq	32(%rsp), %rdi
	addq	$120, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*create_code@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L619:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	cmpl	$1, 24(%rax)
	jne	.L625
	movq	%r10, 16(%rsp)
	movq	(%rax), %r13
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	xorl	%ebx, %ebx
	movq	16(%rsp), %r10
	movq	%rax, %r12
	movl	24(%rax), %eax
	cmpl	$6, %eax
	je	.L626
.L459:
	cmpl	$5, %eax
	jne	.L463
	movq	(%r12), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	movq	%r10, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testb	%al, %al
	je	.L463
	movq	%r13, %rdi
	movq	24(%rsp), %rdx
	movq	%rbx, %rsi
	call	*parse_import_file@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, %rdi
	je	.L627
.L464:
	movq	%r10, 16(%rsp)
	movq	%rbx, %rsi
	call	*create_import@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, %rsi
	je	.L458
.L465:
	xorl	%edi, %edi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	call	*create_code_member@GOTPCREL(%rip)
	movq	32(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L466
	.p2align 4,,10
	.p2align 3
.L620:
	movq	24(%rsp), %rdi
	call	*create_scope@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	movq	%rax, %r13
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L468
	cmpl	$6, %eax
	jne	.L471
	movq	%r10, 16(%rsp)
	movq	0(%r13), %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testb	%al, %al
	je	.L471
.L468:
	movq	0(%r13), %rsi
	movq	24(%rsp), %rdi
	movq	%r10, 16(%rsp)
	call	*search@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, 40(%rsp)
	je	.L628
	movq	%r10, 16(%rsp)
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	cmpl	$1, 24(%rax)
	jne	.L629
	movq	%r10, 16(%rsp)
	xorl	%ecx, %ecx
	movq	(%rax), %rdi
	movl	$2, %esi
	movq	24(%rsp), %r8
	movq	40(%rsp), %rdx
	call	*create_name@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbp, %rdi
	movq	%rax, 48(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L475
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movq	%r10, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testb	%al, %al
	je	.L475
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
	call	*create_list@GOTPCREL(%rip)
	movb	%bl, 56(%rsp)
	movq	16(%rsp), %rbx
	movq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L476:
	cmpl	$5, 24(%r13)
	je	.L630
.L484:
	movq	8(%rsp), %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	parse_variable
	testq	%rax, %rax
	je	.L631
	cmpq	$0, 16(%rax)
	je	.L479
	movq	%r13, %rsi
	leaq	.LC62(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L478:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	je	.L480
.L483:
	movq	%rbx, 16(%rsp)
	movq	%r13, %rsi
	leaq	.LC63(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r10
.L470:
	movq	%r10, %rsi
	leaq	.LC68(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	xorl	%edx, %edx
.L493:
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	movl	$1, %edi
	call	*create_code_member@GOTPCREL(%rip)
	movq	32(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L466
	.p2align 4,,10
	.p2align 3
.L498:
	movq	%r10, 16(%rsp)
	movq	%rbx, %rsi
	leaq	.LC70(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r10
.L496:
	movq	%r10, %rsi
	leaq	.LC87(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	xorl	%ecx, %ecx
.L539:
	xorl	%esi, %esi
	xorl	%edx, %edx
	movl	$2, %edi
	call	*create_code_member@GOTPCREL(%rip)
	movq	32(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L466
	.p2align 4,,10
	.p2align 3
.L623:
	movq	40(%rsp), %rdi
	call	*create_scope@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	movq	56(%rsp), %rdx
	movq	SELF_KEYWORD(%rip), %rdi
	movq	%rax, %r8
	movl	$1, %esi
	movq	%rax, %r13
	call	*create_name@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	movq	%rax, %r15
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L502
	cmpl	$6, %eax
	jne	.L505
	movq	%r9, 16(%rsp)
	movq	(%r15), %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	testb	%al, %al
	je	.L505
.L502:
	movq	(%r15), %rsi
	movq	40(%rsp), %rdi
	movq	%r9, 16(%rsp)
	call	*search@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	testq	%rax, %rax
	movq	%rax, 64(%rsp)
	je	.L632
	movq	%r9, 16(%rsp)
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	cmpl	$1, 24(%rax)
	jne	.L633
	movq	%r9, 16(%rsp)
	xorl	%ecx, %ecx
	movq	(%rax), %rdi
	movl	$3, %esi
	movq	40(%rsp), %r8
	movq	64(%rsp), %rdx
	call	*create_name@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbp, %rdi
	movq	%rax, 96(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	jne	.L509
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movq	%r9, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	testb	%al, %al
	je	.L509
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	cmpl	$6, 24(%rax)
	movq	%rax, %r15
	je	.L510
.L512:
	movq	%r9, 16(%rsp)
	movq	%r15, %rsi
	leaq	.LC75(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r9
.L511:
	movq	%r9, 16(%rsp)
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r15
	call	*create_list@GOTPCREL(%rip)
	movq	%rbx, %rsi
	movq	56(%rsp), %rdi
	xorl	%edx, %edx
	movq	%rax, 80(%rsp)
	movq	%r15, %rbx
	call	*create_variable@GOTPCREL(%rip)
	movq	80(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	16(%rsp), %r15
	.p2align 4,,10
	.p2align 3
.L513:
	cmpl	$5, 24(%rbx)
	je	.L634
.L616:
	movq	%r15, %r9
	movq	%rbx, %r15
.L517:
	movq	%r9, 16(%rsp)
	movq	%r15, %rsi
	leaq	.LC76(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	jmp	.L504
	.p2align 4,,10
	.p2align 3
.L538:
	movq	72(%rsp), %r10
	movq	40(%rsp), %rdx
	movq	48(%rsp), %rsi
	movq	56(%rsp), %rdi
	movq	%r10, 16(%rsp)
	call	*create_class@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, %rcx
	jne	.L539
	jmp	.L496
	.p2align 4,,10
	.p2align 3
.L535:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L536
	jmp	.L533
	.p2align 4,,10
	.p2align 3
.L621:
	movq	%rax, %rsi
	leaq	.LC69(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	jmp	.L496
	.p2align 4,,10
	.p2align 3
.L625:
	movq	%rax, %rsi
	leaq	.LC53(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r10
.L458:
	movq	%r10, %rsi
	leaq	.LC56(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	xorl	%esi, %esi
	jmp	.L465
	.p2align 4,,10
	.p2align 3
.L463:
	movq	%r10, 16(%rsp)
	movq	%r12, %rsi
	leaq	.LC55(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	jmp	.L458
	.p2align 4,,10
	.p2align 3
.L475:
	movq	%r10, 16(%rsp)
	movq	%r13, %rsi
	leaq	.LC60(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	jmp	.L470
	.p2align 4,,10
	.p2align 3
.L509:
	movq	%r9, 16(%rsp)
	movq	%r15, %rsi
	leaq	.LC74(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r9
.L504:
	movq	%r9, %rsi
	leaq	.LC83(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	xorl	%esi, %esi
.L532:
	xorl	%edi, %edi
	xorl	%edx, %edx
	call	*create_class_member@GOTPCREL(%rip)
	movq	48(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L533
	.p2align 4,,10
	.p2align 3
.L630:
	movq	0(%r13), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L484
	movq	%rbx, 16(%rsp)
	movl	$1, %esi
	movzbl	56(%rsp), %ebx
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L486
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	%r10, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testb	%al, %al
	je	.L486
	call	*create_list@GOTPCREL(%rip)
	movq	8(%rsp), %rcx
	movl	$1, %esi
	movq	%rbp, %rdi
	movq	%rax, 56(%rsp)
	movb	$1, (%rcx)
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	movq	%r15, 72(%rsp)
	movq	%rax, %r13
	movq	56(%rsp), %r15
	movq	%r10, 64(%rsp)
	jmp	.L487
	.p2align 4,,10
	.p2align 3
.L489:
	cmpl	$5, 8(%rax)
	movl	$1, %ecx
	movq	%rax, %rsi
	movq	%r15, %rdi
	cmove	%ecx, %ebx
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
.L487:
	cmpl	$5, 24(%r13)
	jne	.L491
	movq	0(%r13), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L635
.L491:
	movq	8(%rsp), %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	parse_statement
	testq	%rax, %rax
	je	.L636
	testb	%bl, %bl
	je	.L489
	movq	%rax, 16(%rsp)
	movq	%r13, %rsi
	leaq	.LC66(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %rax
	jmp	.L489
	.p2align 4,,10
	.p2align 3
.L479:
	movq	%rax, %rsi
	movq	%r15, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L478
	.p2align 4,,10
	.p2align 3
.L480:
	movq	(%rax), %rdi
	movq	COMMA_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L637
	cmpl	$5, 24(%r13)
	jne	.L483
	movq	0(%r13), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L476
	jmp	.L483
	.p2align 4,,10
	.p2align 3
.L634:
	movq	(%rbx), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L638
	cmpl	$5, 24(%rbx)
	jne	.L616
	movq	(%rbx), %rdi
	movq	COMMA_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L639
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %rdx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	parse_variable
	testq	%rax, %rax
	je	.L640
	cmpq	$0, 16(%rax)
	je	.L523
	movq	%rbx, %rsi
	leaq	.LC78(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L522:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L513
	.p2align 4,,10
	.p2align 3
.L523:
	movq	80(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L522
	.p2align 4,,10
	.p2align 3
.L631:
	movq	%r13, %rsi
	leaq	.LC61(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L478
	.p2align 4,,10
	.p2align 3
.L640:
	movq	%rbx, %rsi
	leaq	.LC77(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L522
	.p2align 4,,10
	.p2align 3
.L618:
	xorl	%edi, %edi
	call	*create_scope@GOTPCREL(%rip)
	movq	VOID_KEYWORD(%rip), %rdi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rax, %r8
	xorl	%esi, %esi
	movq	%rax, builtin_scope(%rip)
	call	*create_name@GOTPCREL(%rip)
	movq	builtin_scope(%rip), %r8
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	INT_KEYWORD(%rip), %rdi
	xorl	%esi, %esi
	movq	%rax, name_void(%rip)
	call	*create_name@GOTPCREL(%rip)
	movq	builtin_scope(%rip), %r8
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	FLOAT_KEYWORD(%rip), %rdi
	xorl	%esi, %esi
	movq	%rax, name_int(%rip)
	call	*create_name@GOTPCREL(%rip)
	movq	builtin_scope(%rip), %r8
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	STRING_KEYWORD(%rip), %rdi
	xorl	%esi, %esi
	movq	%rax, name_float(%rip)
	call	*create_name@GOTPCREL(%rip)
	movq	builtin_scope(%rip), %r8
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rax, name_string(%rip)
	movq	BOOL_KEYWORD(%rip), %rdi
	xorl	%esi, %esi
	call	*create_name@GOTPCREL(%rip)
	movq	%rax, name_bool(%rip)
	jmp	.L452
	.p2align 4,,10
	.p2align 3
.L471:
	movq	%r10, 16(%rsp)
	movq	%r13, %rsi
	leaq	.LC57(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	jmp	.L470
	.p2align 4,,10
	.p2align 3
.L505:
	movq	%r9, 16(%rsp)
	movq	%r15, %rsi
	leaq	.LC71(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	jmp	.L504
	.p2align 4,,10
	.p2align 3
.L624:
	movq	%rax, 16(%rsp)
	movq	%rbx, %rsi
	leaq	.LC84(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %rdx
	jmp	.L534
	.p2align 4,,10
	.p2align 3
.L637:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
	jmp	.L476
.L629:
	movq	%rax, %rsi
	leaq	.LC59(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	jmp	.L470
.L633:
	movq	%rax, %rsi
	leaq	.LC73(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	jmp	.L504
.L626:
	movq	(%r12), %rdi
	movq	FROM_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testb	%al, %al
	jne	.L460
	movl	24(%r12), %eax
	jmp	.L459
.L639:
	cmpl	$5, 24(%rbx)
	movq	%r15, %r9
	movq	%rbx, %r15
	jne	.L517
	movq	(%rbx), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	%r9, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	testb	%al, %al
	je	.L517
.L525:
	movq	%r9, 16(%rsp)
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L520
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	%r9, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	testb	%al, %al
	je	.L520
	movq	%r9, 88(%rsp)
	call	*create_list@GOTPCREL(%rip)
	movl	$257, %esi
	movq	%rbp, %rdi
	movq	%rax, 16(%rsp)
	movq	8(%rsp), %rax
	movw	%si, (%rax)
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	88(%rsp), %r9
	xorl	%edx, %edx
	movq	%rax, %r15
	movl	%edx, %ebx
	movq	%r9, 104(%rsp)
	jmp	.L526
	.p2align 4,,10
	.p2align 3
.L528:
	cmpl	$5, 8(%rax)
	movl	$1, %ecx
	movq	%rax, %rsi
	movq	16(%rsp), %rdi
	cmove	%ecx, %ebx
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r15
.L526:
	cmpl	$5, 24(%r15)
	jne	.L530
	movq	(%r15), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L641
.L530:
	movq	8(%rsp), %rdx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	parse_statement
	testq	%rax, %rax
	je	.L642
	testb	%bl, %bl
	je	.L528
	movq	%rax, 88(%rsp)
	movq	%r15, %rsi
	leaq	.LC66(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	88(%rsp), %rax
	jmp	.L528
.L520:
	movq	%r9, 16(%rsp)
	movq	%rbx, %rsi
	leaq	.LC79(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	jmp	.L504
	.p2align 4,,10
	.p2align 3
.L642:
	movq	%rax, 88(%rsp)
	movq	%r15, %rsi
	leaq	.LC81(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	88(%rsp), %rax
	jmp	.L528
.L510:
	movq	(%rax), %rdi
	movq	SELF_KEYWORD(%rip), %rsi
	movq	%r9, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	testb	%al, %al
	je	.L512
	jmp	.L511
.L627:
	movq	%r13, %rdi
	movq	24(%rsp), %r8
	xorl	%ecx, %ecx
	movl	$1, %esi
	movq	name_void(%rip), %rdx
	call	*create_name@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	movq	%rax, %rdi
	jmp	.L464
.L641:
	movq	8(%rsp), %rax
	xorl	%ecx, %ecx
	movq	104(%rsp), %r9
	movw	%cx, (%rax)
	testb	%bl, %bl
	jne	.L531
	movq	64(%rsp), %rax
	cmpq	name_void(%rip), %rax
	je	.L531
	movq	%r9, 88(%rsp)
	movq	%r15, %rsi
	leaq	.LC82(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	88(%rsp), %r9
.L531:
	movq	%r9, 88(%rsp)
	movq	64(%rsp), %rsi
	movq	%r13, %r8
	movq	16(%rsp), %rcx
	movq	80(%rsp), %rdx
	movq	96(%rsp), %rdi
	call	*create_method@GOTPCREL(%rip)
	movq	88(%rsp), %r9
	testq	%rax, %rax
	movq	%rax, %rsi
	jne	.L532
	jmp	.L504
	.p2align 4,,10
	.p2align 3
.L628:
	movq	%r13, %rsi
	leaq	.LC58(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	jmp	.L470
.L632:
	movq	%r15, %rsi
	leaq	.LC72(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	jmp	.L504
.L636:
	movq	%rax, 16(%rsp)
	movq	%r13, %rsi
	leaq	.LC65(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %rax
	jmp	.L489
.L460:
	movq	%r10, 16(%rsp)
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	cmpl	$4, 24(%rax)
	jne	.L643
	movq	%r10, 16(%rsp)
	movq	(%rax), %rbx
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	movq	%rax, %r12
	movl	24(%rax), %eax
	jmp	.L459
.L638:
	movq	%r15, %r9
	jmp	.L525
.L486:
	movq	%r10, 16(%rsp)
	movq	%r13, %rsi
	leaq	.LC64(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	jmp	.L470
.L635:
	movq	8(%rsp), %rax
	movq	64(%rsp), %r10
	movq	72(%rsp), %r15
	movb	$0, (%rax)
	testb	%bl, %bl
	jne	.L492
	movq	40(%rsp), %rax
	cmpq	name_void(%rip), %rax
	je	.L492
	movq	%r10, 16(%rsp)
	movq	%r13, %rsi
	leaq	.LC67(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r10
.L492:
	movq	%r10, 16(%rsp)
	movq	%r15, %rdx
	movq	56(%rsp), %rcx
	movq	%r12, %r8
	movq	40(%rsp), %rsi
	movq	48(%rsp), %rdi
	call	*create_function@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, %rdx
	jne	.L493
	jmp	.L470
	.p2align 4,,10
	.p2align 3
.L643:
	movq	%rax, %rsi
	leaq	.LC54(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	jmp	.L458
	.size	parse_code, .-parse_code
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
