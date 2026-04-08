	.file	"parser.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Failed to parse right operand"
	.text
	.type	parse_expr_prec, @function
parse_expr_prec:
	pushq	%r15
	movl	%edx, %r15d
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%r8, %r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	movl	$1, %esi
	subq	$40, %rsp
	movq	%rdi, 8(%rsp)
	movq	%rcx, 24(%rsp)
.L20:
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	jne	.L14
	movq	(%rax), %rdi
	call	*string_to_operator@GOTPCREL(%rip)
	movl	%eax, 20(%rsp)
	movl	%eax, %edi
	call	*operator_precedence@GOTPCREL(%rip)
	cmpl	$19, 20(%rsp)
	movl	%eax, %r13d
	je	.L14
	cmpl	%r15d, %eax
	jge	.L3
.L14:
	movq	8(%rsp), %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	jmp	.L1
.L3:
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	24(%rsp), %rsi
	movq	8(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rax, %rbp
	call	parse_primary
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L6
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC0(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L7
.L6:
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rax, %rbp
.L19:
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	jne	.L12
	movq	(%rax), %rdi
	call	*string_to_operator@GOTPCREL(%rip)
	movl	%eax, %r14d
	movl	%eax, %edi
	call	*operator_precedence@GOTPCREL(%rip)
	movl	%eax, %edx
	cmpl	$19, %r14d
	je	.L12
	cmpl	%eax, %r13d
	jl	.L9
.L12:
	movq	%rbx, %rsi
	movl	20(%rsp), %edi
	movq	%rbp, %rcx
	xorl	%edx, %edx
	call	*create_expression@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movl	$1, %esi
	movq	%rax, %rbx
	jmp	.L20
.L9:
	movq	24(%rsp), %rcx
	movq	8(%rsp), %rdi
	movq	%rbp, %rsi
	movq	%r12, %r8
	call	parse_expr_prec
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L19
.L7:
	xorl	%ebx, %ebx
.L1:
	addq	$40, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	parse_expr_prec, .-parse_expr_prec
	.section	.rodata.str1.1
.LC1:
	.string	"Failed to parse expression primary"
	.text
	.type	parse_expression, @function
parse_expression:
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rbx
	movq	%rdi, %rbx
	call	parse_primary
	testq	%rax, %rax
	je	.L26
	movq	%rax, %rdx
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rbp, %r8
	movq	%r12, %rcx
	movq	%rbx, %rdi
	movq	%rax, %rsi
	popq	%rbx
	xorl	%edx, %edx
	popq	%rbp
	popq	%r12
	jmp	parse_expr_prec
.L26:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rbp, %rdx
	leaq	.LC1(%rip), %rdi
	movq	%rax, %rsi
	call	*parser_error@GOTPCREL(%rip)
	popq	%rbx
	xorl	%eax, %eax
	popq	%rbp
	popq	%r12
	ret
	.size	parse_expression, .-parse_expression
	.section	.rodata.str1.1
.LC2:
	.string	"Expected variable type"
.LC3:
	.string	"Expected a type for variable declaration"
.LC4:
	.string	"Unknown variable type"
.LC5:
	.string	"Expected variable name"
.LC6:
	.string	"Failed to parse variable initializer"
	.text
	.type	parse_variable, @function
parse_variable:
	pushq	%r15
	pushq	%r14
	movq	%rsi, %r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	movq	%rdx, %rbx
	pushq	%r8
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %r12
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L29
	cmpl	$6, %eax
	jne	.L32
	movq	(%r12), %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	testb	%al, %al
	je	.L32
.L29:
	movq	(%r12), %rsi
	movq	%r14, %rdi
	call	*search_name@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L33
	movl	32(%rax), %eax
	cmpl	$6, %eax
	je	.L34
	testl	%eax, %eax
	je	.L34
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC3(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L60
.L33:
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC4(%rip), %rdi
	movq	%rax, %rdx
.L60:
	call	*parser_error@GOTPCREL(%rip)
.L34:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$1, 24(%rax)
	movq	%rax, %r12
	je	.L35
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC5(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L35:
	cmpb	$0, 10(%rbx)
	movl	$3, %esi
	je	.L36
	cmpb	$1, 9(%rbx)
	sbbl	%esi, %esi
	andl	$2, %esi
	addl	$3, %esi
.L36:
	movq	(%r12), %rdi
	movq	%r14, %rcx
	movq	%r13, %rdx
	call	*create_symbol@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	je	.L37
.L39:
	xorl	%ebp, %ebp
	jmp	.L38
.L37:
	movq	ASSIGN_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L39
	movq	%rbp, %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rbp, %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rbp, %rdi
	movq	%rbx, %rdx
	movq	%r14, %rsi
	movq	%rax, %r15
	call	parse_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L38
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r15, %rsi
	leaq	.LC6(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L38:
	popq	%rcx
	movq	%rbp, %rdx
	popq	%rbx
	movq	%r12, %rsi
	popq	%rbp
	movq	%r13, %rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*create_variable@GOTPCREL(%rip)
.L32:
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC2(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	popq	%rdx
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	parse_variable, .-parse_variable
	.section	.rodata.str1.1
.LC7:
	.string	"Failed to parse parenthesized expression"
.LC8:
	.string	"Expected ')' after expression"
.LC9:
	.string	"Failed to parse operand of unary '!'"
.LC10:
	.string	"Failed to parse operand of unary '-'"
.LC11:
	.string	"Expected variable name in variable access"
.LC12:
	.string	"Cannot call undefined variable"
.LC13:
	.string	"Cannot call non-function variable"
.LC14:
	.string	"Failed to parse function call argument"
.LC15:
	.string	"Expected ',' or ')' after function call argument"
.LC16:
	.string	"Failed to parse sequence index"
.LC17:
	.string	"Expected ']' after sequence index"
.LC18:
	.string	"Cannot access attribute without a valid scope"
.LC19:
	.string	"Expected attribute name after '.'"
.LC20:
	.string	"Unknown attribute name"
.LC21:
	.string	"Failed to parse variable access"
.LC22:
	.string	"Unexpected token in primary expression"
	.text
	.type	parse_primary, @function
parse_primary:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rdx, %r12
	pushq	%rbp
	pushq	%rbx
	subq	$40, %rsp
	movq	%rdi, (%rsp)
	movq	%rsi, 16(%rsp)
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %r13
	movl	24(%rax), %eax
	cmpl	$2, %eax
	jne	.L62
	movq	0(%r13), %rsi
	xorl	%ebp, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	xorl	%r13d, %r13d
	jmp	.L63
.L62:
	cmpl	$3, %eax
	jne	.L64
	movq	0(%r13), %rsi
	xorl	%ebp, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	movl	$1, %r13d
	jmp	.L63
.L64:
	cmpl	$4, %eax
	jne	.L65
	movq	0(%r13), %rsi
	xorl	%ebp, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	movl	$2, %r13d
	jmp	.L63
.L65:
	cmpl	$6, %eax
	jne	.L66
	movq	TRUE_KEYWORD(%rip), %rsi
	movq	0(%r13), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L67
	movq	0(%r13), %rsi
	xorl	%ebp, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	movl	$3, %r13d
	jmp	.L63
.L67:
	cmpl	$6, 24(%r13)
	jne	.L66
	movq	FALSE_KEYWORD(%rip), %rsi
	movq	0(%r13), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L66
	movq	0(%r13), %rsi
	xorl	%ebp, %ebp
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	movl	$4, %r13d
	jmp	.L63
.L66:
	cmpl	$5, 24(%r13)
	jne	.L76
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movq	0(%r13), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L69
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rax, %rbp
	call	parse_expression
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L70
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC7(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L174
.L70:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movl	24(%rax), %r13d
	movq	%rax, %rbp
	cmpl	$5, %r13d
	je	.L72
.L74:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC8(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L174
.L72:
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L74
	xorl	%ebp, %ebp
	xorl	%eax, %eax
	xorl	%esi, %esi
	jmp	.L63
.L69:
	cmpl	$5, 24(%r13)
	jne	.L76
	movq	NOT_SYMBOL(%rip), %rsi
	movq	0(%r13), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L75
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rax, %rbx
	call	parse_primary
	testq	%rax, %rax
	jne	.L114
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC9(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L174
.L75:
	cmpl	$5, 24(%r13)
	jne	.L76
	movq	SUB_SYMBOL(%rip), %rsi
	movq	0(%r13), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L76
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rax, %rbx
	call	parse_primary
	testq	%rax, %rax
	jne	.L115
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC10(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L174
.L76:
	movl	24(%r13), %eax
	cmpl	$1, %eax
	je	.L80
	cmpl	$6, %eax
	jne	.L79
	movq	SELF_KEYWORD(%rip), %rsi
	movq	0(%r13), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L79
	cmpb	$0, 9(%r12)
	je	.L79
.L80:
	movq	(%rsp), %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L78
	cmpl	$6, %eax
	je	.L81
.L83:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC11(%rip), %rdi
	movq	%rax, %rdx
.L173:
	call	*parser_error@GOTPCREL(%rip)
.L82:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r13, %rsi
	leaq	.LC21(%rip), %rdi
	movq	%rax, %rdx
.L174:
	call	*parser_error@GOTPCREL(%rip)
	addq	$40, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L114:
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
	xorl	%esi, %esi
	movl	$6, %r13d
	jmp	.L63
.L115:
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
	xorl	%esi, %esi
	movl	$7, %r13d
.L63:
	addq	$40, %rsp
	movq	%rbp, %r8
	movq	%rbx, %rdx
	movl	%r13d, %edi
	popq	%rbx
	movq	%rax, %rcx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*create_primary@GOTPCREL(%rip)
.L81:
	movq	SELF_KEYWORD(%rip), %rsi
	movq	(%rbx), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L83
.L78:
	movq	(%rbx), %rsi
	movq	16(%rsp), %rdi
	xorl	%r14d, %r14d
	call	*search_name@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	xorl	%esi, %esi
	movq	%rax, %rdx
	xorl	%edi, %edi
	movq	%rax, %rbx
	call	*create_variable_access@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$1, %esi
	movq	%rax, %rbp
	call	*peek_next_token@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	movq	%rcx, 8(%rsp)
	movq	%rax, %r15
	jmp	.L84
.L111:
	testq	%rbx, %rbx
	je	.L85
	movq	(%rbx), %r14
	testq	%r14, %r14
	cmove	%rbx, %r14
.L85:
	cmpq	$0, 8(%rsp)
	je	.L175
.L86:
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movq	(%r15), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L176
	movq	L_BRACKET_SYMBOL(%rip), %rsi
	movq	(%r15), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L101
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rax, %r15
	call	parse_expression
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	jne	.L102
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r15, %rsi
	leaq	.LC16(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L102:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	jne	.L104
	movq	R_BRACKET_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L104
	movq	%rbp, %rsi
	movq	24(%rsp), %rcx
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$3, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %rbp
.L100:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*peek_next_token@GOTPCREL(%rip)
	movq	%rax, %r15
.L84:
	cmpl	$5, 24(%r15)
	je	.L111
	jmp	.L112
.L175:
	testq	%r14, %r14
	je	.L86
	xorl	%edx, %edx
	cmpl	$0, 32(%r14)
	movq	%rdx, 8(%rsp)
	jne	.L86
	movq	24(%r14), %rax
	movq	16(%rax), %rax
	movq	%rax, 8(%rsp)
	jmp	.L86
.L176:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
	testq	%rbx, %rbx
	jne	.L88
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r14, %rsi
	leaq	.LC12(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L170
.L88:
	cmpl	$0, 32(%rbx)
	jne	.L90
	movq	8(%rbx), %rdi
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	24(%rbx), %rax
	movq	16(%rax), %rdi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	%rbp, %rsi
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movq	%rax, %rbx
	movq	%rax, %rdx
	movl	$2, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%rbx, %rbx
	je	.L89
.L90:
	movl	32(%rbx), %eax
	decl	%eax
	cmpl	$1, %eax
	jbe	.L89
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r14, %rsi
	leaq	.LC13(%rip), %rdi
	movq	%rax, %rdx
.L170:
	call	*parser_error@GOTPCREL(%rip)
.L89:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
.L93:
	cmpl	$5, 24(%r14)
	je	.L177
.L99:
	movq	16(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%r12, %rdx
	call	parse_expression
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L94
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r14, %rsi
	leaq	.LC14(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L94:
	movq	8(%rsp), %rdi
	movq	%r15, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r14
	je	.L95
.L98:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r14, %rsi
	leaq	.LC15(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L173
.L95:
	movq	COMMA_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L96
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
	jmp	.L93
.L96:
	cmpl	$5, 24(%r14)
	jne	.L98
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	(%r14), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L93
	jmp	.L98
.L177:
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	(%r14), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L99
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movq	8(%rsp), %r8
	movl	$1, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	(%rbx), %rbx
	movq	%rax, %rbp
	cmpl	$0, 32(%rbx)
	jne	.L117
	movq	24(%rbx), %rax
	movq	16(%rax), %rax
	movq	%rax, 8(%rsp)
	jmp	.L172
.L104:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r15, %rsi
	leaq	.LC17(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L173
.L101:
	movq	DOT_SYMBOL(%rip), %rsi
	movq	(%r15), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L105
.L112:
	testq	%rbp, %rbp
	je	.L82
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	xorl	%esi, %esi
	movl	$8, %r13d
	jmp	.L63
.L105:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpq	$0, 8(%rsp)
	movq	%rax, %r15
	jne	.L106
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r15, %rsi
	leaq	.LC18(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L173
.L106:
	cmpl	$1, 24(%rax)
	je	.L107
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r15, %rsi
	leaq	.LC19(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L173
.L107:
	movq	(%rax), %rsi
	movq	8(%rsp), %rdi
	call	*search_name@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L108
	testq	%r14, %r14
	je	.L109
	cmpl	$0, 32(%r14)
	je	.L171
	movq	(%r14), %r14
	testq	%r14, %r14
	je	.L109
	cmpl	$0, 32(%r14)
	jne	.L118
.L171:
	movq	8(%r14), %r14
	jmp	.L109
.L118:
	xorl	%r14d, %r14d
.L109:
	movq	(%r15), %rsi
	movq	%r14, %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movq	%rax, %rsi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L108
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r15, %rsi
	leaq	.LC20(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L173
.L108:
	movq	%rbp, %rsi
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movq	%rbx, %rdx
	movl	$2, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %rbp
.L117:
	xorl	%eax, %eax
	movq	%rax, 8(%rsp)
.L172:
	xorl	%r14d, %r14d
	jmp	.L100
.L79:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r13, %rsi
	leaq	.LC22(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L174
	.size	parse_primary, .-parse_primary
	.section	.rodata.str1.1
.LC23:
	.string	"Expected '(' after 'if'"
.LC24:
	.string	"Failed to parse if condition"
.LC25:
	.string	"Expected ')' after if condition"
.LC26:
	.string	"Expected '{' to start if body"
.LC27:
	.string	"Failed to parse if body statement"
.LC28:
	.string	"Expected '(' after 'elif'"
.LC29:
	.string	"Failed to parse else-if condition"
.LC30:
	.string	"Expected ')' after else-if condition"
.LC31:
	.string	"Expected '{' to start else-if body"
.LC32:
	.string	"Failed to parse else-if body statement"
.LC33:
	.string	"Expected '{' to start else body"
.LC34:
	.string	"Failed to parse else body statement"
.LC35:
	.string	"Expected '(' after 'for'"
.LC36:
	.string	"Failed to parse for loop initializer"
.LC37:
	.string	"Expected ';' after for loop initializer"
.LC38:
	.string	"Failed to parse for loop condition"
.LC39:
	.string	"Expected ';' after for loop condition"
.LC40:
	.string	"Failed to parse for loop increment"
.LC41:
	.string	"Expected ')' after for loop increment"
.LC42:
	.string	"Expected '{' to start for loop body"
.LC43:
	.string	"Failed to parse for loop body statement"
.LC44:
	.string	"Expected '(' after 'while'"
.LC45:
	.string	"Failed to parse while condition"
.LC46:
	.string	"Expected ')' after while condition"
.LC47:
	.string	"Expected '{' to start while body"
.LC48:
	.string	"Failed to parse while body statement"
.LC49:
	.string	"Cannot use 'break' outside of a loop"
.LC50:
	.string	"Cannot use 'continue' outside of a loop"
.LC51:
	.string	"Failed to parse statement"
.LC52:
	.string	"Expected ';' after statement"
	.text
	.type	parse_statement, @function
parse_statement:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$56, %rsp
	movq	%rdi, (%rsp)
	movq	%rsi, 8(%rsp)
	call	*peek_current_token@GOTPCREL(%rip)
	cmpl	$6, 24(%rax)
	jne	.L179
	movq	IF_KEYWORD(%rip), %rsi
	movq	(%rax), %rdi
	movq	%rax, %rbp
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L180
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L181
.L183:
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC23(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L353
.L181:
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L183
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%rbx, %rdx
	movq	%rax, %rbp
	call	parse_expression
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L184
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC24(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L184:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L185
.L186:
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC25(%rip), %rdi
	movq	%rax, %rdx
.L353:
	call	*parser_error@GOTPCREL(%rip)
	xorl	%esi, %esi
	jmp	.L208
.L185:
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L186
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L187
.L188:
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC26(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L353
.L187:
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L188
	call	*create_list@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$1, %esi
	leaq	.LC27(%rip), %r13
	movq	%rax, 16(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
.L189:
	cmpl	$5, 24(%rbp)
	je	.L360
.L191:
	movq	8(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%rbx, %rdx
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L190
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	movq	%r13, %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L190:
	movq	16(%rsp), %rdi
	movq	%r14, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L189
.L360:
	movq	R_BRACE_SYMBOL(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L191
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 24(%rsp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 32(%rsp)
.L352:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$6, 24(%rax)
	movq	%rax, %rbp
	jne	.L204
	movq	ELIF_KEYWORD(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L361
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L193
.L194:
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC28(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L353
.L193:
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L194
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%rbx, %rdx
	movq	%rax, %rbp
	call	parse_expression
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L195
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC29(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L195:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L196
.L197:
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC30(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L353
.L196:
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L197
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L198
.L199:
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC31(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L353
.L198:
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L199
	call	*create_list@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$1, %esi
	leaq	.LC32(%rip), %r15
	movq	%rax, 40(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
.L200:
	cmpl	$5, 24(%rbp)
	je	.L362
.L202:
	movq	8(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%rbx, %rdx
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L201
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	movq	%r15, %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L201:
	movq	40(%rsp), %rdi
	movq	%r14, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L200
.L362:
	movq	R_BRACE_SYMBOL(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L202
	movq	40(%rsp), %rsi
	movq	%r13, %rdi
	call	*create_else_if@GOTPCREL(%rip)
	movq	24(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L352
.L361:
	cmpl	$6, 24(%rbp)
	jne	.L204
	movq	ELSE_KEYWORD(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L363
.L204:
	movq	(%rsp), %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	16(%rsp), %rsi
	movq	32(%rsp), %rcx
	movq	%r12, %rdi
	movq	24(%rsp), %rdx
	call	*create_if@GOTPCREL(%rip)
	movq	%rax, %rsi
	jmp	.L208
.L363:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L209
.L210:
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC33(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L353
.L209:
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L210
	movq	(%rsp), %rdi
	movl	$1, %esi
	leaq	.LC34(%rip), %r13
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
.L211:
	cmpl	$5, 24(%rbp)
	je	.L364
.L213:
	movq	8(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%rbx, %rdx
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L212
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	movq	%r13, %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L212:
	movq	32(%rsp), %rdi
	movq	%r14, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L211
.L364:
	movq	R_BRACE_SYMBOL(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L213
	jmp	.L204
.L208:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$2, %edi
	jmp	.L359
.L180:
	movq	FOR_KEYWORD(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L214
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L215
.L217:
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC35(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L354
.L215:
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L217
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L218
.L221:
	movq	8(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%rbx, %rdx
	call	parse_variable
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L220
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC36(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L220
.L218:
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	xorl	%r12d, %r12d
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L222
	jmp	.L221
.L220:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
.L222:
	cmpl	$5, 24(%rbp)
	je	.L223
.L225:
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC37(%rip), %rdi
	movq	%rax, %rdx
.L354:
	call	*parser_error@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	jmp	.L224
.L223:
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L225
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L226
.L229:
	movq	8(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%rbx, %rdx
	call	parse_expression
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L228
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC38(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L228
.L226:
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	xorl	%r13d, %r13d
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L230
	jmp	.L229
.L228:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
.L230:
	cmpl	$5, 24(%rbp)
	je	.L231
.L232:
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC39(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L354
.L231:
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L232
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L233
.L236:
	movq	8(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%rbx, %rdx
	call	parse_expression
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L235
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC40(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L235
.L233:
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	xorl	%r14d, %r14d
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L237
	jmp	.L236
.L235:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
.L237:
	cmpl	$5, 24(%rbp)
	je	.L238
.L239:
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC41(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L354
.L238:
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L239
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L240
.L241:
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC42(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L354
.L240:
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L241
	call	*create_list@GOTPCREL(%rip)
	movb	$1, 11(%rbx)
	movq	%rax, 16(%rsp)
.L355:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L365
.L244:
	movq	8(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%rbx, %rdx
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L243
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC43(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L243:
	movq	16(%rsp), %rdi
	movq	%r15, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L355
.L365:
	movq	R_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L244
	movq	16(%rsp), %rcx
	movb	$0, 11(%rbx)
	movq	%r14, %rdx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	*create_for@GOTPCREL(%rip)
	movq	%rax, %rcx
.L224:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$4, %edi
	jmp	.L359
.L214:
	movq	WHILE_KEYWORD(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L245
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L246
.L248:
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC44(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L356
.L246:
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L248
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%rbx, %rdx
	movq	%rax, %rbp
	call	parse_expression
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L249
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC45(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L249:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L250
.L252:
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC46(%rip), %rdi
	movq	%rax, %rdx
.L356:
	call	*parser_error@GOTPCREL(%rip)
	xorl	%edx, %edx
	jmp	.L251
.L250:
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L252
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L253
.L254:
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC47(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L356
.L253:
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L254
	call	*create_list@GOTPCREL(%rip)
	movb	$1, 11(%rbx)
	movq	(%rsp), %rdi
	movl	$1, %esi
	movq	%rax, %r13
	leaq	.LC48(%rip), %r14
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
.L255:
	cmpl	$5, 24(%rbp)
	je	.L366
.L257:
	movq	8(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%rbx, %rdx
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L256
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	movq	%r14, %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L256:
	movq	%r15, %rsi
	movq	%r13, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L255
.L366:
	movq	R_BRACE_SYMBOL(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L257
	movb	$0, 11(%rbx)
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	*create_while@GOTPCREL(%rip)
	movq	%rax, %rdx
.L251:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$3, %edi
	jmp	.L359
.L245:
	movq	VAR_KEYWORD(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L258
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%rbx, %rdx
	call	parse_variable
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rax, %r9
	xorl	%esi, %esi
	movl	$1, %edi
	jmp	.L358
.L258:
	movq	RETURN_KEYWORD(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L260
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	jne	.L261
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L261
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$5, %edi
.L359:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*create_statement@GOTPCREL(%rip)
.L261:
	movq	8(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%rbx, %rdx
	call	parse_expression
	xorl	%r9d, %r9d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rax, %r8
	xorl	%esi, %esi
	movl	$5, %edi
	jmp	.L358
.L260:
	movq	BREAK_KEYWORD(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L262
	cmpb	$0, 11(%rbx)
	jne	.L263
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC49(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L357
.L263:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$6, %edi
	jmp	.L358
.L262:
	movq	CONTINUE_KEYWORD(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L179
	cmpb	$0, 11(%rbx)
	jne	.L266
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC50(%rip), %rdi
	movq	%rax, %rdx
.L357:
	call	*parser_error@GOTPCREL(%rip)
	xorl	%ebp, %ebp
	jmp	.L178
.L266:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$7, %edi
	jmp	.L358
.L179:
	movq	8(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%rbx, %rdx
	call	parse_expression
	xorl	%r9d, %r9d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rax, %r8
	xorl	%esi, %esi
	xorl	%edi, %edi
.L358:
	call	*create_statement@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movq	%rax, %rbp
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rbp, %rbp
	jne	.L268
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC51(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L268:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	je	.L269
.L271:
	movq	(%rbx), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC52(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L178
.L269:
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L271
.L178:
	addq	$56, %rsp
	movq	%rbp, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	parse_statement, .-parse_statement
	.section	.rodata.str1.1
.LC53:
	.string	"Expected identifier after 'import'"
.LC54:
	.string	"Expected string literal after 'from'"
.LC55:
	.string	"Expected ';' at end of import statement"
.LC56:
	.string	"Failed to import module"
.LC57:
	.string	"Failed to parse import statement"
.LC58:
	.string	"Expected function return type after 'func'"
.LC59:
	.string	"Unknown function return type"
.LC60:
	.string	"Expected function name after return type"
.LC61:
	.string	"Expected '(' after function name"
.LC62:
	.string	"Failed to parse function parameter"
.LC63:
	.string	"Function parameters cannot have default values"
.LC64:
	.string	"Expected ',' or ')' after function parameter"
.LC65:
	.string	"Expected '{' to start function body"
.LC66:
	.string	"Failed to parse function body statement"
.LC67:
	.string	"Unreachable code after return statement"
.LC68:
	.string	"Function missing return statement"
.LC69:
	.string	"Failed to parse function declaration"
.LC70:
	.string	"Expected class name after 'class'"
.LC71:
	.string	"Expected '{' to start class body"
.LC72:
	.string	"Expected method return type after 'method'"
.LC73:
	.string	"Unknown return type for method"
.LC74:
	.string	"Expected method name after return type"
.LC75:
	.string	"Expected '(' after method name"
.LC76:
	.string	"Expected 'self' as first parameter of method"
.LC77:
	.string	"Expected ',' or ')' after method parameter"
.LC78:
	.string	"Failed to parse method parameter"
.LC79:
	.string	"Method parameters cannot have default values"
.LC80:
	.string	"Expected '{' to start method body"
.LC81:
	.string	"Failed to parse method body statement"
.LC82:
	.string	"Method missing return statement"
.LC83:
	.string	"Failed to parse class method"
.LC84:
	.string	"Failed to parse class variable"
.LC85:
	.string	"Unsupported type for class variable"
.LC86:
	.string	"Expected ';' after class variable declaration"
.LC87:
	.string	"Unexpected token in class member"
.LC88:
	.string	"Constructor name conflicts with existing member"
.LC89:
	.string	"0"
.LC90:
	.string	"Failed to parse class declaration"
.LC91:
	.string	"Unexpected token in code member"
	.text
	.globl	parse_code
	.type	parse_code, @function
parse_code:
	pushq	%r15
	pushq	%r14
	movq	%rdx, %r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$120, %rsp
	cmpq	$0, builtin_scope(%rip)
	movq	%rdi, (%rsp)
	jne	.L368
	xorl	%edi, %edi
	call	*create_symbol_table@GOTPCREL(%rip)
	movq	VOID_KEYWORD(%rip), %rdi
	xorl	%edx, %edx
	movl	$6, %esi
	movq	%rax, %rcx
	movq	%rax, builtin_scope(%rip)
	call	*create_symbol@GOTPCREL(%rip)
	movq	builtin_scope(%rip), %rcx
	xorl	%edx, %edx
	movq	INT_KEYWORD(%rip), %rdi
	movl	$6, %esi
	movq	%rax, name_void(%rip)
	call	*create_symbol@GOTPCREL(%rip)
	movq	builtin_scope(%rip), %rcx
	xorl	%edx, %edx
	movq	FLOAT_KEYWORD(%rip), %rdi
	movl	$6, %esi
	movq	%rax, name_int(%rip)
	call	*create_symbol@GOTPCREL(%rip)
	movq	builtin_scope(%rip), %rcx
	xorl	%edx, %edx
	movq	STRING_KEYWORD(%rip), %rdi
	movl	$6, %esi
	movq	%rax, name_float(%rip)
	call	*create_symbol@GOTPCREL(%rip)
	movq	builtin_scope(%rip), %rcx
	xorl	%edx, %edx
	movq	BOOL_KEYWORD(%rip), %rdi
	movq	%rax, name_string(%rip)
	movl	$6, %esi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, name_bool(%rip)
.L368:
	testq	%rbx, %rbx
	jne	.L369
	movq	builtin_scope(%rip), %rbx
.L369:
	call	*create_list@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, 48(%rsp)
	call	*create_symbol_table@GOTPCREL(%rip)
	movq	%rax, 24(%rsp)
.L383:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L486
	movl	24(%rax), %eax
	testl	%eax, %eax
	je	.L486
	cmpl	$6, %eax
	jne	.L416
	movq	IMPORT_KEYWORD(%rip), %rsi
	movq	(%r15), %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %r12d
	testb	%al, %al
	je	.L372
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	je	.L373
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC53(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L564
.L373:
	movq	(%rax), %r12
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$6, 24(%rax)
	movq	%rax, %rbx
	jne	.L375
	movq	FROM_KEYWORD(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L376
.L375:
	xorl	%ebp, %ebp
	jmp	.L377
.L376:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$4, 24(%rax)
	movq	%rax, %rbx
	je	.L378
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC54(%rip), %rdi
	movq	%rax, %rdx
.L564:
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L374
.L378:
	movq	(%rax), %rbp
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
.L377:
	cmpl	$5, 24(%rbx)
	je	.L379
.L380:
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC55(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L564
.L379:
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	movq	(%rbx), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L380
	movq	(%r14), %rcx
	movq	24(%rsp), %rdx
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	*parse_import_file@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L381
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC56(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	24(%rsp), %rcx
	movl	$3, %esi
	movq	%r12, %rdi
	movq	name_void(%rip), %rdx
	call	*create_symbol@GOTPCREL(%rip)
.L381:
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	*create_import@GOTPCREL(%rip)
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L382
.L374:
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r15, %rsi
	leaq	.LC57(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	xorl	%esi, %esi
.L382:
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%edi, %edi
	jmp	.L574
.L372:
	cmpl	$6, 24(%r15)
	jne	.L416
	movq	FUNC_KEYWORD(%rip), %rsi
	movq	(%r15), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L384
	movq	24(%rsp), %rdi
	call	*create_symbol_table@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$1, %esi
	movq	%rax, 8(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L385
	cmpl	$6, %eax
	je	.L386
.L388:
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC58(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L567
.L386:
	movq	(%rbx), %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	testb	%al, %al
	je	.L388
.L385:
	movq	(%rbx), %rsi
	movq	24(%rsp), %rdi
	call	*search_name@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L389
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC59(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L567
.L389:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	je	.L390
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC60(%rip), %rdi
	movq	%rax, %rdx
.L567:
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L387
.L390:
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	8(%rsp), %rcx
	movq	(%rbx), %rdi
	movq	%rbp, %rdx
	movl	$1, %esi
	movq	%rax, 16(%rsp)
	movq	%rcx, 32(%rax)
	movq	%rax, %rcx
	call	*create_symbol@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$1, %esi
	movq	%rax, 56(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L391
.L392:
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC61(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L567
.L391:
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L392
	movq	(%rsp), %rdi
	movl	$1, %esi
	leaq	.LC63(%rip), %r13
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 40(%rsp)
.L393:
	cmpl	$5, 24(%rbx)
	je	.L575
.L401:
	movq	8(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%r14, %rdx
	call	parse_variable
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L394
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC62(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L565
.L394:
	cmpq	$0, 16(%rax)
	je	.L396
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	movq	%r13, %rdi
	movq	%rax, %rdx
.L565:
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L395
.L396:
	movq	40(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
.L395:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L397
.L400:
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC64(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L567
.L397:
	movq	COMMA_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L398
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L393
.L398:
	cmpl	$5, 24(%rbx)
	jne	.L400
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	(%rbx), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L393
	jmp	.L400
.L575:
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	(%rbx), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L401
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L402
.L403:
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC65(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L567
.L402:
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L403
	call	*create_list@GOTPCREL(%rip)
	movb	$1, 8(%r14)
	movq	%rax, 32(%rsp)
.L566:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L576
.L409:
	movq	8(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%r14, %rdx
	call	parse_statement
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L405
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC66(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L408
.L405:
	testb	%r12b, %r12b
	je	.L407
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC67(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L407:
	cmpl	$5, 8(%r13)
	movb	$1, %al
	cmove	%eax, %r12d
.L408:
	movq	32(%rsp), %rdi
	movq	%r13, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L566
.L576:
	movq	R_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L409
	movb	$0, 8(%r14)
	testb	%r12b, %r12b
	jne	.L411
	cmpq	name_void(%rip), %rbp
	jne	.L412
.L413:
	xorl	%esi, %esi
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$5, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	32(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L411
.L412:
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC68(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	cmpq	name_void(%rip), %rbp
	je	.L413
.L411:
	movq	%rbp, %rdx
	movq	8(%rsp), %r9
	movq	32(%rsp), %r8
	movq	40(%rsp), %rcx
	movq	56(%rsp), %rsi
	movq	16(%rsp), %rdi
	call	*create_function_use_ptr@GOTPCREL(%rip)
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L415
.L387:
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r15, %rsi
	leaq	.LC69(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	xorl	%edx, %edx
.L415:
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$1, %edi
	jmp	.L574
.L384:
	cmpl	$6, 24(%r15)
	jne	.L416
	movq	CLASS_KEYWORD(%rip), %rsi
	movq	(%r15), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L416
	movq	24(%rsp), %rdi
	call	*create_symbol_table@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$1, %esi
	movq	%rax, 16(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	je	.L417
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC70(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L573
.L417:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	movq	(%rbx), %rdi
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%rax, 64(%rsp)
	movq	%rcx, 16(%rax)
	movq	%rax, %rcx
	call	*create_symbol@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$1, %esi
	movq	%rax, 8(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L419
.L420:
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC71(%rip), %rdi
	movq	%rax, %rdx
.L573:
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L418
.L419:
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L420
	call	*create_list@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$1, %esi
	movq	%rax, 32(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	xorl	%eax, %eax
	movq	%rax, 56(%rsp)
.L421:
	cmpl	$5, 24(%rbx)
	je	.L577
.L473:
	cmpl	$6, 24(%rbx)
	jne	.L422
	movq	METHOD_KEYWORD(%rip), %rsi
	movq	(%rbx), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L423
	movq	16(%rsp), %rdi
	call	*create_symbol_table@GOTPCREL(%rip)
	movq	8(%rsp), %rdx
	movl	$3, %esi
	movq	SELF_KEYWORD(%rip), %rdi
	movq	%rax, %rcx
	movq	%rax, 40(%rsp)
	call	*create_symbol@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$1, %esi
	movq	%rax, %r13
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L424
	cmpl	$6, %eax
	je	.L425
.L427:
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC72(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L569
.L425:
	movq	0(%rbp), %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	testb	%al, %al
	je	.L427
.L424:
	movq	0(%rbp), %rsi
	movq	16(%rsp), %rdi
	call	*search_name@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L428
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC73(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L569
.L428:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$1, 24(%rax)
	movq	%rax, %rbp
	je	.L429
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC74(%rip), %rdi
	movq	%rax, %rdx
.L569:
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L426
.L429:
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	40(%rsp), %rcx
	movq	0(%rbp), %rsi
	movq	%rax, 72(%rsp)
	movq	%rcx, 32(%rax)
	movq	8(%rsp), %rax
	movq	8(%rax), %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	72(%rsp), %rcx
	movq	%r12, %rdx
	movl	$2, %esi
	movq	%rax, %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$1, %esi
	movq	%rax, 104(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L430
.L431:
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC75(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L569
.L430:
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L431
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$6, 24(%rax)
	movq	%rax, %rbp
	je	.L432
.L434:
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC76(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L433
.L432:
	movq	SELF_KEYWORD(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L434
.L433:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	call	*create_list@GOTPCREL(%rip)
	movq	%r13, %rsi
	movq	8(%rsp), %rdi
	xorl	%edx, %edx
	movq	%rax, 80(%rsp)
	leaq	.LC79(%rip), %r13
	call	*create_variable@GOTPCREL(%rip)
	movq	80(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
.L435:
	cmpl	$5, 24(%rbp)
	je	.L578
.L441:
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC77(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L569
.L578:
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L447
	cmpl	$5, 24(%rbp)
	jne	.L441
	movq	COMMA_SYMBOL(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L437
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	40(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%r14, %rdx
	movq	%rax, %rbp
	call	parse_variable
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L561
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC78(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L568
.L437:
	cmpl	$5, 24(%rbp)
	jne	.L441
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L441
.L447:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L562
	jmp	.L442
.L561:
	cmpq	$0, 16(%rax)
	je	.L445
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	movq	%r13, %rdi
	movq	%rax, %rdx
.L568:
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L444
.L445:
	movq	80(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
.L444:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L435
.L442:
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC80(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L569
.L562:
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L442
	call	*create_list@GOTPCREL(%rip)
	movw	$257, 8(%r14)
	movq	(%rsp), %rdi
	xorl	%r13d, %r13d
	movq	%rax, 88(%rsp)
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
.L448:
	cmpl	$5, 24(%rbp)
	je	.L579
.L453:
	movq	40(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%r14, %rdx
	call	parse_statement
	movq	%rax, 96(%rsp)
	testq	%rax, %rax
	jne	.L449
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC81(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L452
.L449:
	testb	%r13b, %r13b
	je	.L451
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC67(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L451:
	movq	96(%rsp), %rax
	cmpl	$5, 8(%rax)
	movb	$1, %al
	cmove	%eax, %r13d
.L452:
	movq	96(%rsp), %rsi
	movq	88(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L448
.L579:
	movq	R_BRACE_SYMBOL(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L453
	movw	$0, 8(%r14)
	testb	%r13b, %r13b
	jne	.L455
	cmpq	name_void(%rip), %r12
	jne	.L456
.L457:
	xorl	%esi, %esi
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$5, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	88(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L455
.L456:
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC82(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	cmpq	name_void(%rip), %r12
	je	.L457
.L455:
	movq	104(%rsp), %rsi
	movq	40(%rsp), %r9
	movq	%r12, %rdx
	movq	88(%rsp), %r8
	movq	80(%rsp), %rcx
	movq	72(%rsp), %rdi
	call	*create_method_use_ptr@GOTPCREL(%rip)
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L459
.L426:
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC83(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	xorl	%esi, %esi
.L459:
	xorl	%edi, %edi
	xorl	%edx, %edx
	call	*create_class_member@GOTPCREL(%rip)
	movq	32(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L470
.L423:
	cmpl	$6, 24(%rbx)
	jne	.L422
	movq	VAR_KEYWORD(%rip), %rsi
	movq	(%rbx), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L422
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movb	$1, 10(%r14)
	movq	16(%rsp), %rsi
	movq	%r14, %rdx
	movq	(%rsp), %rdi
	movq	%rax, %rbx
	call	parse_variable
	movb	$0, 10(%r14)
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L461
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC84(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L461:
	movq	%rbp, %rdx
	xorl	%esi, %esi
	movl	$1, %edi
	call	*create_class_member@GOTPCREL(%rip)
	movq	32(%rsp), %rdi
	movq	%rax, %rbp
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	cmpl	$1, 8(%rbp)
	jne	.L465
	movq	0(%rbp), %rax
	movq	(%rax), %rax
	cmpq	name_int(%rip), %rax
	je	.L570
	cmpq	name_float(%rip), %rax
	je	.L570
	cmpq	name_string(%rip), %rax
	je	.L570
	cmpq	name_bool(%rip), %rax
	je	.L466
	cmpq	name_void(%rip), %rax
	jne	.L467
.L466:
	incq	56(%rsp)
	jmp	.L465
.L467:
	cmpl	$0, 32(%rax)
	jne	.L468
.L570:
	addq	$8, 56(%rsp)
	jmp	.L465
.L468:
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC85(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L465:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L469
.L471:
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC86(%rip), %rdi
	movq	%rax, %rdx
	jmp	.L571
.L469:
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L471
	jmp	.L470
.L422:
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC87(%rip), %rdi
	movq	%rax, %rdx
.L571:
	call	*parser_error@GOTPCREL(%rip)
.L470:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L421
.L577:
	movq	R_BRACE_SYMBOL(%rip), %rsi
	movq	(%rbx), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L473
	movq	8(%rsp), %rax
	movq	DEFAULT_INIT_NAME(%rip), %rsi
	movq	8(%rax), %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	16(%rsp), %rdi
	movq	%rax, %r13
	movq	%rax, %rsi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L474
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	16(%rsp), %rdi
	movq	%rax, %r12
	call	*create_symbol_table@GOTPCREL(%rip)
	movq	%r13, %rdi
	movq	8(%rsp), %rdx
	movq	%r12, %rcx
	movl	$2, %esi
	movq	%rax, 32(%r12)
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, %rbp
	call	*create_list@GOTPCREL(%rip)
	movq	32(%r12), %rcx
	movq	8(%rsp), %rdx
	movl	$3, %esi
	movq	SELF_KEYWORD(%rip), %rdi
	movq	%rax, 40(%rsp)
	call	*create_symbol@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	8(%rsp), %rdi
	movq	%rax, %rsi
	movq	%rax, 72(%rsp)
	call	*create_variable@GOTPCREL(%rip)
	movq	40(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	call	*create_list@GOTPCREL(%rip)
	movq	72(%rsp), %rdx
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movq	%rax, %r13
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%rax, %r8
	movl	$8, %edi
	call	*create_primary@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	movq	%rax, %rdx
	call	*create_expression@GOTPCREL(%rip)
	xorl	%r9d, %r9d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rax, %r8
	xorl	%esi, %esi
	movl	$5, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%r13, %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	32(%r12), %r9
	movq	%r13, %r8
	movq	%rbp, %rsi
	movq	40(%rsp), %rcx
	movq	8(%rsp), %rdx
	movq	%r12, %rdi
	call	*create_method_use_ptr@GOTPCREL(%rip)
	movq	%r12, %rsi
	xorl	%edi, %edi
	xorl	%edx, %edx
	call	*create_class_member@GOTPCREL(%rip)
	movq	32(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
.L474:
	cmpl	$2, 32(%rbp)
	je	.L475
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC88(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L475:
	movq	8(%rsp), %rax
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi
	movq	8(%rax), %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movl	$40, %edi
	movq	%rax, %r12
	call	*alloc_memory@GOTPCREL(%rip)
	movq	16(%rsp), %rdi
	movq	%rax, %rbx
	call	*create_symbol_table@GOTPCREL(%rip)
	movq	%r12, %rdi
	movq	8(%rsp), %rdx
	movq	%rbx, %rcx
	movl	$2, %esi
	movq	%rax, 32(%rbx)
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, 88(%rsp)
	call	*create_list@GOTPCREL(%rip)
	movq	32(%rbx), %rcx
	movq	8(%rsp), %rdx
	movl	$3, %esi
	movq	SELF_KEYWORD(%rip), %rdi
	movq	%rax, 72(%rsp)
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, 80(%rsp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
.L477:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L580
	movq	8(%r13), %rax
	movq	SELF_KEYWORD(%rip), %rsi
	movq	8(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L477
	movq	8(%r13), %rsi
	movq	0(%r13), %rdi
	xorl	%edx, %edx
	call	*create_variable@GOTPCREL(%rip)
	movq	72(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L477
.L580:
	call	*create_list@GOTPCREL(%rip)
	movq	32(%rsp), %rdi
	movq	%rax, 40(%rsp)
	call	*list_copy@GOTPCREL(%rip)
	movq	80(%rsp), %rdx
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	xorl	%edi, %edi
	movq	%rax, 96(%rsp)
	call	*create_variable_access@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$8, %edi
	movq	%rax, %r8
	call	*create_primary@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	movq	%rax, %rdx
.L572:
	call	*create_expression@GOTPCREL(%rip)
	xorl	%esi, %esi
	xorl	%edi, %edi
	xorl	%r9d, %r9d
	movq	%rax, %r8
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	call	*create_statement@GOTPCREL(%rip)
	movq	40(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
.L480:
	movq	96(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L581
	cmpl	$1, 8(%r13)
	jne	.L480
	movq	0(%r13), %rax
	movq	80(%rsp), %rdx
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	xorl	%edi, %edi
	movq	8(%rax), %r12
	call	*create_variable_access@GOTPCREL(%rip)
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movl	$2, %edi
	movq	%r12, %rdx
	movq	%rax, %rsi
	call	*create_variable_access@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%rax, %r8
	movl	$8, %edi
	call	*create_primary@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	movq	%rax, %rdx
	call	*create_expression@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	0(%r13), %rax
	movq	16(%rax), %rcx
	testq	%rcx, %rcx
	jne	.L481
	movl	$2, %esi
	leaq	.LC89(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rax, %rsi
	xorl	%edi, %edi
	call	*create_primary@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	movq	%rax, %rdx
	call	*create_expression@GOTPCREL(%rip)
	movq	%rax, %rcx
.L481:
	xorl	%edx, %edx
	movq	%r12, %rsi
	movl	$13, %edi
	jmp	.L572
.L581:
	call	*create_list@GOTPCREL(%rip)
	movq	80(%rsp), %rdx
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movq	%rax, %r12
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%rax, %r8
	movl	$8, %edi
	call	*create_primary@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	movq	%rax, %rdx
	call	*create_expression@GOTPCREL(%rip)
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	72(%rsp), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r13
.L483:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L582
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	xorl	%edi, %edi
	movq	8(%rax), %rdx
	call	*create_variable_access@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%rax, %r8
	movl	$8, %edi
	call	*create_primary@GOTPCREL(%rip)
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	movl	$19, %edi
	movq	%rax, %rdx
	call	*create_expression@GOTPCREL(%rip)
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L483
.L582:
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movq	%rbp, %rdx
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%r12, %r8
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rax, %rsi
	movl	$1, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%rax, %r8
	movl	$8, %edi
	call	*create_primary@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	movq	%rax, %rdx
	call	*create_expression@GOTPCREL(%rip)
	xorl	%r9d, %r9d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rax, %r8
	xorl	%esi, %esi
	movl	$5, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	40(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	32(%rbx), %r9
	movq	40(%rsp), %r8
	movq	%rbx, %rdi
	movq	72(%rsp), %rcx
	movq	8(%rsp), %rdx
	movq	88(%rsp), %rsi
	call	*create_method_use_ptr@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	%rbx, %rsi
	xorl	%edi, %edi
	call	*create_class_member@GOTPCREL(%rip)
	movq	32(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	movq	56(%rsp), %r8
	movq	32(%rsp), %rdx
	movq	8(%rsp), %rsi
	movq	64(%rsp), %rdi
	call	*create_class_use_ptr@GOTPCREL(%rip)
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L485
.L418:
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r15, %rsi
	leaq	.LC90(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	xorl	%ecx, %ecx
.L485:
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$2, %edi
.L574:
	call	*create_code_member@GOTPCREL(%rip)
	movq	48(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L383
.L486:
	movq	24(%rsp), %rsi
	movq	48(%rsp), %rdi
	addq	$120, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*create_code@GOTPCREL(%rip)
.L416:
	movq	(%r14), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r15, %rsi
	leaq	.LC91(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L383
	.size	parse_code, .-parse_code
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
