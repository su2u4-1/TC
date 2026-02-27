	.file	"parser.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Failed to parse expression primary"
	.text
	.type	parse_expression, @function
parse_expression:
	pushq	%r12
	movq	%rdx, %r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movq	%rdi, %rbx
	call	parse_primary
	testq	%rax, %rax
	je	.L5
	movq	%rax, %rdx
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%r12, %r8
	movq	%rbp, %rcx
	movq	%rbx, %rdi
	movq	%rax, %rsi
	popq	%rbx
	xorl	%edx, %edx
	popq	%rbp
	popq	%r12
	jmp	parse_expr_prec
.L5:
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	leaq	.LC0(%rip), %rdi
	movq	%rax, %rsi
	call	*parser_error@GOTPCREL(%rip)
	popq	%rbx
	xorl	%eax, %eax
	popq	%rbp
	popq	%r12
	ret
	.size	parse_expression, .-parse_expression
	.section	.rodata.str1.1
.LC1:
	.string	"Expected variable type"
.LC2:
	.string	"Expected a type for variable declaration"
.LC3:
	.string	"Unknown variable type"
.LC4:
	.string	"Expected variable name"
.LC5:
	.string	"Failed to parse variable initializer"
	.text
	.type	parse_variable, @function
parse_variable:
	pushq	%r15
	pushq	%r14
	movq	%rdx, %r14
	pushq	%r13
	movq	%rsi, %r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	pushq	%r8
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L9
	cmpl	$6, %eax
	jne	.L12
	movq	0(%rbp), %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	testb	%al, %al
	je	.L12
.L9:
	movq	0(%rbp), %rsi
	movq	%r13, %rdi
	call	*search@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L13
	movq	%rbp, %rsi
	leaq	.LC2(%rip), %rdi
	testl	$-5, 24(%rax)
	je	.L14
	jmp	.L34
.L13:
	movq	%rbp, %rsi
	leaq	.LC3(%rip), %rdi
.L34:
	call	*parser_error@GOTPCREL(%rip)
.L14:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$1, 24(%rax)
	movq	%rax, %rbp
	je	.L15
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L15:
	movq	0(%rbp), %rdi
	xorl	%ecx, %ecx
	movq	%r13, %r8
	movq	%r12, %rdx
	movl	$1, %esi
	call	*create_name@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	je	.L16
.L18:
	xorl	%ebx, %ebx
	jmp	.L17
.L16:
	movq	ASSIGN_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L18
	movq	%rbx, %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%r14, %rdx
	movq	%r13, %rsi
	movq	%rax, %r15
	call	parse_expression
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L17
	movq	%r15, %rsi
	leaq	.LC5(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L17:
	popq	%rcx
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	popq	%rbx
	movq	%r12, %rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*create_variable@GOTPCREL(%rip)
.L12:
	movq	%rbp, %rsi
	leaq	.LC1(%rip), %rdi
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
.LC6:
	.string	"Failed to parse parenthesized expression"
.LC7:
	.string	"Expected ')' after expression"
.LC8:
	.string	"Failed to parse operand of unary '!'"
.LC9:
	.string	"Failed to parse operand of unary '-'"
.LC10:
	.string	"Expected variable name in variable access"
.LC11:
	.string	"Cannot call undefined variable"
.LC12:
	.string	"Cannot call non-function variable"
.LC13:
	.string	"Failed to parse function call argument"
.LC14:
	.string	"Expected ',' or ')' after function call argument"
.LC15:
	.string	"Failed to parse sequence index"
.LC16:
	.string	"Expected ']' after sequence index"
.LC17:
	.string	"Cannot access attribute without a valid scope"
.LC18:
	.string	"Expected attribute name after '.'"
.LC19:
	.string	"Unknown attribute name"
.LC20:
	.string	"Failed to parse variable access"
.LC21:
	.string	"Unexpected token in primary expression"
	.text
	.type	parse_primary, @function
parse_primary:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$40, %rsp
	movq	%rdi, (%rsp)
	movq	%rsi, 8(%rsp)
	movq	%rdx, 16(%rsp)
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	movl	24(%rax), %eax
	cmpl	$2, %eax
	jne	.L36
	movq	0(%rbp), %rsi
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	xorl	%r12d, %r12d
	jmp	.L37
.L36:
	cmpl	$3, %eax
	jne	.L38
	movq	0(%rbp), %rsi
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	movl	$1, %r12d
	jmp	.L37
.L38:
	cmpl	$4, %eax
	jne	.L39
	movq	0(%rbp), %rsi
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	movl	$2, %r12d
	jmp	.L37
.L39:
	cmpl	$6, %eax
	jne	.L40
	movq	TRUE_KEYWORD(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L41
	movq	0(%rbp), %rsi
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	movl	$3, %r12d
	jmp	.L37
.L41:
	cmpl	$6, 24(%rbp)
	jne	.L40
	movq	FALSE_KEYWORD(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L40
	movq	0(%rbp), %rsi
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	movl	$4, %r12d
	jmp	.L37
.L40:
	cmpl	$5, 24(%rbp)
	jne	.L50
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L43
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	16(%rsp), %rdx
	movq	%rax, %rbx
	call	parse_expression
	movq	%rbx, %rsi
	leaq	.LC6(%rip), %rdi
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L134
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movl	24(%rax), %r12d
	movq	%rax, %rbx
	cmpl	$5, %r12d
	je	.L46
.L48:
	movq	%rbx, %rsi
	leaq	.LC7(%rip), %rdi
	jmp	.L134
.L46:
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L48
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	xorl	%esi, %esi
	jmp	.L37
.L43:
	cmpl	$5, 24(%rbp)
	jne	.L50
	movq	NOT_SYMBOL(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L49
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	16(%rsp), %rdx
	movq	%rax, %rbx
	call	parse_primary
	movq	%rbx, %rsi
	leaq	.LC8(%rip), %rdi
	testq	%rax, %rax
	jne	.L135
	jmp	.L134
.L49:
	cmpl	$5, 24(%rbp)
	jne	.L50
	movq	SUB_SYMBOL(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L50
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	16(%rsp), %rdx
	movq	%rax, %rbx
	call	parse_primary
	movq	%rbx, %rsi
	leaq	.LC9(%rip), %rdi
	testq	%rax, %rax
	jne	.L136
	jmp	.L134
.L50:
	movl	24(%rbp), %eax
	cmpl	$1, %eax
	je	.L54
	cmpl	$6, %eax
	jne	.L53
	movq	SELF_KEYWORD(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L53
	movq	16(%rsp), %rax
	cmpb	$0, 1(%rax)
	je	.L53
.L54:
	movq	(%rsp), %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L52
	cmpl	$6, %eax
	je	.L55
.L57:
	movq	%rbx, %rsi
	leaq	.LC10(%rip), %rdi
.L133:
	call	*parser_error@GOTPCREL(%rip)
.L56:
	movq	%rbp, %rsi
	leaq	.LC20(%rip), %rdi
.L134:
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
.L135:
	xorl	%ebx, %ebx
	xorl	%ebp, %ebp
	xorl	%esi, %esi
	movl	$6, %r12d
	jmp	.L37
.L136:
	xorl	%ebx, %ebx
	xorl	%ebp, %ebp
	xorl	%esi, %esi
	movl	$7, %r12d
.L37:
	addq	$40, %rsp
	movq	%rbx, %r8
	movq	%rbp, %rdx
	movl	%r12d, %edi
	popq	%rbx
	movq	%rax, %rcx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*create_primary@GOTPCREL(%rip)
.L55:
	movq	SELF_KEYWORD(%rip), %rsi
	movq	(%rbx), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L57
.L52:
	movq	(%rbx), %rsi
	movq	8(%rsp), %rdi
	xorl	%r14d, %r14d
	xorl	%r13d, %r13d
	call	*search@GOTPCREL(%rip)
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movq	%rax, %rdx
	xorl	%edi, %edi
	movq	%rax, %r12
	call	*create_variable_access@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$1, %esi
	movq	%rax, %rbx
	call	*peek_next_token@GOTPCREL(%rip)
	movq	%rax, %r15
	jmp	.L58
.L82:
	testq	%r12, %r12
	jne	.L137
.L59:
	testq	%r14, %r14
	je	.L138
.L62:
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movq	(%r15), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L139
	movq	L_BRACKET_SYMBOL(%rip), %rsi
	movq	(%r15), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L74
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %rdx
	movq	8(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%rax, 24(%rsp)
	call	parse_expression
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L75
	movq	24(%rsp), %rsi
	leaq	.LC15(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L75:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rdx
	jne	.L77
	movq	R_BRACKET_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	movq	%rax, 24(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	24(%rsp), %rdx
	testb	%al, %al
	je	.L77
	movq	%rbx, %rsi
	xorl	%r8d, %r8d
	movq	%r15, %rcx
	xorl	%edx, %edx
	movl	$3, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %rbx
.L73:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*peek_next_token@GOTPCREL(%rip)
	movq	%rax, %r15
.L58:
	cmpl	$5, 24(%r15)
	je	.L82
	jmp	.L83
.L137:
	movl	24(%r12), %eax
	leal	-1(%rax), %edx
	cmpl	$2, %edx
	jbe	.L89
	cmpl	$5, %eax
	jne	.L60
.L89:
	movq	16(%r12), %r13
	jmp	.L59
.L60:
	andl	$-5, %eax
	cmove	%r12, %r13
	jmp	.L59
.L138:
	testq	%r13, %r13
	je	.L62
	cmpl	$4, 24(%r13)
	jne	.L62
	movq	16(%r13), %r14
	jmp	.L62
.L139:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%r12, %r12
	jne	.L64
	movq	%rax, %rsi
	leaq	.LC11(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L64:
	movl	24(%r12), %eax
	subl	$2, %eax
	cmpl	$1, %eax
	jbe	.L65
	movq	%r13, %rsi
	leaq	.LC12(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L65:
	movq	(%rsp), %rdi
	movl	$1, %esi
	leaq	.LC13(%rip), %r14
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, %r15
.L66:
	cmpl	$5, 24(%r13)
	je	.L140
.L72:
	movq	16(%rsp), %rdx
	movq	8(%rsp), %rsi
	movq	(%rsp), %rdi
	call	parse_expression
	testq	%rax, %rax
	jne	.L67
	movq	%rax, 24(%rsp)
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	24(%rsp), %rax
.L67:
	movq	%rax, %rsi
	movq	%r15, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	je	.L68
.L71:
	movq	%r13, %rsi
	leaq	.LC14(%rip), %rdi
	jmp	.L133
.L68:
	movq	COMMA_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L69
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
	jmp	.L66
.L69:
	cmpl	$5, 24(%r13)
	jne	.L71
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	0(%r13), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L66
	jmp	.L71
.L140:
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	0(%r13), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L72
	movq	%rbx, %rsi
	movq	%r15, %r8
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$1, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	16(%r12), %r12
	movq	%rax, %rbx
	jmp	.L132
.L77:
	movq	%rdx, %rsi
	leaq	.LC16(%rip), %rdi
	jmp	.L133
.L74:
	movq	DOT_SYMBOL(%rip), %rsi
	movq	(%r15), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L78
.L83:
	testq	%rbx, %rbx
	je	.L56
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	xorl	%esi, %esi
	movl	$8, %r12d
	jmp	.L37
.L78:
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%r14, %r14
	jne	.L79
	movq	%rax, %rsi
	leaq	.LC17(%rip), %rdi
	jmp	.L133
.L79:
	cmpl	$1, 24(%rax)
	je	.L80
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rdi
	jmp	.L133
.L80:
	movq	(%rax), %rsi
	movq	%r14, %rdi
	call	*search@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L81
	movq	%r13, %rsi
	leaq	.LC19(%rip), %rdi
	jmp	.L133
.L81:
	movq	%rbx, %rsi
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	movl	$2, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %rbx
.L132:
	xorl	%r14d, %r14d
	xorl	%r13d, %r13d
	jmp	.L73
.L53:
	movq	%rbp, %rsi
	leaq	.LC21(%rip), %rdi
	jmp	.L134
	.size	parse_primary, .-parse_primary
	.section	.rodata.str1.1
.LC22:
	.string	"Failed to parse right operand"
	.text
	.type	parse_expr_prec, @function
parse_expr_prec:
	pushq	%r15
	movl	%edx, %r15d
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	movl	$1, %esi
	subq	$40, %rsp
	movq	%rdi, 8(%rsp)
	movq	%rcx, 16(%rsp)
	movq	%r8, 24(%rsp)
.L160:
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	jne	.L154
	movq	(%rax), %rdi
	call	*string_to_operator@GOTPCREL(%rip)
	movl	%eax, %r12d
	movl	%eax, %edi
	call	*operator_precedence@GOTPCREL(%rip)
	movl	%eax, %r13d
	cmpl	$19, %r12d
	je	.L154
	cmpl	%r15d, %eax
	jge	.L143
.L154:
	movq	8(%rsp), %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	jmp	.L141
.L143:
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	24(%rsp), %rdx
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	movq	%rax, %rbp
	call	parse_primary
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L146
	movq	%rbp, %rsi
	leaq	.LC22(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L147
.L146:
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rax, %rbp
.L159:
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	jne	.L152
	movq	(%rax), %rdi
	call	*string_to_operator@GOTPCREL(%rip)
	movl	%eax, %r14d
	movl	%eax, %edi
	call	*operator_precedence@GOTPCREL(%rip)
	movl	%eax, %edx
	cmpl	$19, %r14d
	je	.L152
	cmpl	%eax, %r13d
	jl	.L149
.L152:
	movq	%rbx, %rsi
	movl	%r12d, %edi
	movq	%rbp, %rcx
	xorl	%edx, %edx
	call	*create_expression@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movl	$1, %esi
	movq	%rax, %rbx
	jmp	.L160
.L149:
	movq	24(%rsp), %r8
	movq	16(%rsp), %rcx
	movq	%rbp, %rsi
	movq	8(%rsp), %rdi
	call	parse_expr_prec
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L159
.L147:
	xorl	%ebx, %ebx
.L141:
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
	subq	$72, %rsp
	movq	%rdi, 8(%rsp)
	movq	%rsi, 16(%rsp)
	call	*peek_current_token@GOTPCREL(%rip)
	cmpl	$6, 24(%rax)
	jne	.L162
	movq	IF_KEYWORD(%rip), %rsi
	movq	(%rax), %rdi
	movq	%rax, %rbp
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L163
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L164
.L166:
	movq	%rbp, %rsi
	leaq	.LC23(%rip), %rdi
	jmp	.L331
.L164:
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L166
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	movq	%rbx, %rdx
	movq	%rax, %r12
	call	parse_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L167
	movq	%r12, %rsi
	leaq	.LC24(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L167:
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	je	.L168
.L169:
	movq	%r12, %rsi
	leaq	.LC25(%rip), %rdi
.L331:
	call	*parser_error@GOTPCREL(%rip)
	xorl	%esi, %esi
	jmp	.L191
.L168:
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L169
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	je	.L170
.L171:
	movq	%r12, %rsi
	leaq	.LC26(%rip), %rdi
	jmp	.L331
.L170:
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L171
	call	*create_list@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movl	$1, %esi
	leaq	.LC27(%rip), %r12
	movq	%rax, 24(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
.L172:
	cmpl	$5, 24(%r13)
	je	.L337
.L174:
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	movq	%rbx, %rdx
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L173
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L173:
	movq	24(%rsp), %rdi
	movq	%r14, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
	jmp	.L172
.L337:
	movq	R_BRACE_SYMBOL(%rip), %rsi
	movq	0(%r13), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L174
	call	*create_list@GOTPCREL(%rip)
	leaq	.LC29(%rip), %r14
	movq	%rax, 32(%rsp)
	call	*create_list@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movl	$1, %esi
	movq	%rax, 40(%rsp)
	call	*peek_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
.L175:
	cmpl	$6, 24(%r12)
	jne	.L187
	movq	ELIF_KEYWORD(%rip), %rsi
	movq	(%r12), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L338
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	je	.L176
.L177:
	movq	%r12, %rsi
	leaq	.LC28(%rip), %rdi
	jmp	.L331
.L176:
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L177
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	movq	%rbx, %rdx
	movq	%rax, %r13
	call	parse_expression
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L178
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L178:
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	je	.L179
.L180:
	movq	%r13, %rsi
	leaq	.LC30(%rip), %rdi
	jmp	.L331
.L179:
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L180
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	je	.L181
.L182:
	movq	%r13, %rsi
	leaq	.LC31(%rip), %rdi
	jmp	.L331
.L181:
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L182
	call	*create_list@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movl	$1, %esi
	leaq	.LC32(%rip), %r15
	movq	%rax, 48(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
.L183:
	cmpl	$5, 24(%r13)
	je	.L339
.L185:
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	movq	%rbx, %rdx
	call	parse_statement
	testq	%rax, %rax
	jne	.L184
	movq	%rax, 56(%rsp)
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	56(%rsp), %rax
.L184:
	movq	%rax, %rsi
	movq	48(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
	jmp	.L183
.L339:
	movq	R_BRACE_SYMBOL(%rip), %rsi
	movq	0(%r13), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L185
	movq	%r12, %rdi
	movq	48(%rsp), %rsi
	call	*create_else_if@GOTPCREL(%rip)
	movq	32(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*peek_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L175
.L338:
	cmpl	$6, 24(%r12)
	jne	.L187
	movq	ELSE_KEYWORD(%rip), %rsi
	movq	(%r12), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L340
.L187:
	movq	8(%rsp), %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	24(%rsp), %rsi
	movq	40(%rsp), %rcx
	movq	%rbp, %rdi
	movq	32(%rsp), %rdx
	call	*create_if@GOTPCREL(%rip)
	movq	%rax, %rsi
	jmp	.L191
.L340:
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	je	.L192
.L193:
	movq	%r12, %rsi
	leaq	.LC33(%rip), %rdi
	jmp	.L331
.L192:
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L193
	movq	8(%rsp), %rdi
	movl	$1, %esi
	leaq	.LC34(%rip), %r12
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
.L194:
	cmpl	$5, 24(%r13)
	je	.L341
.L196:
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	movq	%rbx, %rdx
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L195
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L195:
	movq	40(%rsp), %rdi
	movq	%r14, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
	jmp	.L194
.L341:
	movq	R_BRACE_SYMBOL(%rip), %rsi
	movq	0(%r13), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L196
	jmp	.L187
.L191:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$2, %edi
	jmp	.L336
.L163:
	movq	FOR_KEYWORD(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L197
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L198
.L200:
	movq	%rbp, %rsi
	leaq	.LC35(%rip), %rdi
	jmp	.L332
.L198:
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L200
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	je	.L201
.L204:
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	movq	%rbx, %rdx
	call	parse_variable
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L203
	movq	%r12, %rsi
	leaq	.LC36(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L203
.L201:
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	xorl	%ebp, %ebp
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L205
	jmp	.L204
.L203:
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
.L205:
	cmpl	$5, 24(%r12)
	je	.L206
.L208:
	movq	%r12, %rsi
	leaq	.LC37(%rip), %rdi
.L332:
	call	*parser_error@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	jmp	.L207
.L206:
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	movq	(%r12), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L208
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	je	.L209
.L212:
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	movq	%rbx, %rdx
	call	parse_expression
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L211
	movq	%r13, %rsi
	leaq	.LC38(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L211
.L209:
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	xorl	%r12d, %r12d
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L213
	jmp	.L212
.L211:
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
.L213:
	cmpl	$5, 24(%r13)
	je	.L214
.L215:
	movq	%r13, %rsi
	leaq	.LC39(%rip), %rdi
	jmp	.L332
.L214:
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	movq	0(%r13), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L215
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r14
	je	.L216
.L219:
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	movq	%rbx, %rdx
	call	parse_expression
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L218
	movq	%r14, %rsi
	leaq	.LC40(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L218
.L216:
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	xorl	%r13d, %r13d
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L220
	jmp	.L219
.L218:
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
.L220:
	cmpl	$5, 24(%r14)
	je	.L221
.L222:
	movq	%r14, %rsi
	leaq	.LC41(%rip), %rdi
	jmp	.L332
.L221:
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	(%r14), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L222
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r14
	je	.L223
.L224:
	movq	%r14, %rsi
	leaq	.LC42(%rip), %rdi
	jmp	.L332
.L223:
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L224
	call	*create_list@GOTPCREL(%rip)
	movb	$1, 2(%rbx)
	movq	8(%rsp), %rdi
	movl	$1, %esi
	movq	%rax, 24(%rsp)
	leaq	.LC43(%rip), %r15
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
.L225:
	cmpl	$5, 24(%r14)
	je	.L342
.L227:
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	movq	%rbx, %rdx
	call	parse_statement
	testq	%rax, %rax
	jne	.L226
	movq	%rax, 32(%rsp)
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	32(%rsp), %rax
.L226:
	movq	%rax, %rsi
	movq	24(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
	jmp	.L225
.L342:
	movq	R_BRACE_SYMBOL(%rip), %rsi
	movq	(%r14), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L227
	movq	24(%rsp), %rcx
	movb	$0, 2(%rbx)
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	*create_for@GOTPCREL(%rip)
	movq	%rax, %rcx
.L207:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$4, %edi
	jmp	.L336
.L197:
	movq	WHILE_KEYWORD(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L228
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L229
.L231:
	movq	%rbp, %rsi
	leaq	.LC44(%rip), %rdi
	jmp	.L333
.L229:
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L231
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	movq	%rbx, %rdx
	movq	%rax, %r12
	call	parse_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L232
	movq	%r12, %rsi
	leaq	.LC45(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L232:
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	je	.L233
.L235:
	movq	%r12, %rsi
	leaq	.LC46(%rip), %rdi
.L333:
	call	*parser_error@GOTPCREL(%rip)
	xorl	%edx, %edx
	jmp	.L234
.L233:
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L235
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	je	.L236
.L237:
	movq	%r12, %rsi
	leaq	.LC47(%rip), %rdi
	jmp	.L333
.L236:
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L237
	call	*create_list@GOTPCREL(%rip)
	movb	$1, 2(%rbx)
	movq	8(%rsp), %rdi
	movl	$1, %esi
	movq	%rax, %r12
	leaq	.LC48(%rip), %r13
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
.L238:
	cmpl	$5, 24(%r14)
	je	.L343
.L240:
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	movq	%rbx, %rdx
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L239
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L239:
	movq	%r15, %rsi
	movq	%r12, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
	jmp	.L238
.L343:
	movq	R_BRACE_SYMBOL(%rip), %rsi
	movq	(%r14), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L240
	movb	$0, 2(%rbx)
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	*create_while@GOTPCREL(%rip)
	movq	%rax, %rdx
.L234:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$3, %edi
.L336:
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*create_statement@GOTPCREL(%rip)
.L228:
	movq	VAR_KEYWORD(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L241
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	movq	%rbx, %rdx
	call	parse_variable
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rax, %r9
	xorl	%esi, %esi
	movl	$1, %edi
	jmp	.L335
.L241:
	movq	RETURN_KEYWORD(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L243
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	movq	%rbx, %rdx
	call	parse_expression
	xorl	%r9d, %r9d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rax, %r8
	xorl	%esi, %esi
	movl	$5, %edi
	jmp	.L335
.L243:
	movq	BREAK_KEYWORD(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L244
	cmpb	$0, 2(%rbx)
	movq	%rbp, %rsi
	leaq	.LC49(%rip), %rdi
	je	.L334
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$6, %edi
	jmp	.L335
.L244:
	movq	CONTINUE_KEYWORD(%rip), %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L162
	cmpb	$0, 2(%rbx)
	jne	.L248
	movq	%rbp, %rsi
	leaq	.LC50(%rip), %rdi
.L334:
	call	*parser_error@GOTPCREL(%rip)
	xorl	%ebx, %ebx
	jmp	.L161
.L248:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$7, %edi
	jmp	.L335
.L162:
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	movq	%rbx, %rdx
	call	parse_expression
	xorl	%r9d, %r9d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rax, %r8
	xorl	%esi, %esi
	xorl	%edi, %edi
.L335:
	call	*create_statement@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movq	%rax, %rbx
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %rsi
	testq	%rbx, %rbx
	jne	.L250
	leaq	.LC51(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L250:
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L251
.L253:
	movq	%rbp, %rsi
	leaq	.LC52(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L161
.L251:
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L253
.L161:
	addq	$72, %rsp
	movq	%rbx, %rax
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
	.string	"Failed to parse import statement"
.LC57:
	.string	"Expected function return type after 'func'"
.LC58:
	.string	"Unknown function return type"
.LC59:
	.string	"Expected function name after return type"
.LC60:
	.string	"Expected '(' after function name"
.LC61:
	.string	"Failed to parse function parameter"
.LC62:
	.string	"Function parameters cannot have default values"
.LC63:
	.string	"Expected ',' or ')' after function parameter"
.LC64:
	.string	"Expected '{' to start function body"
.LC65:
	.string	"Failed to parse function body statement"
.LC66:
	.string	"Unreachable code after return statement"
.LC67:
	.string	"Function missing return statement"
.LC68:
	.string	"Failed to parse function declaration"
.LC69:
	.string	"Expected class name after 'class'"
.LC70:
	.string	"Expected '{' to start class body"
.LC71:
	.string	"Expected method return type after 'method'"
.LC72:
	.string	"Unknown return type for method"
.LC73:
	.string	"Expected method name after return type"
.LC74:
	.string	"Expected '(' after method name"
.LC75:
	.string	"Expected 'self' as first parameter of method"
.LC76:
	.string	"Expected ',' or ')' after method parameter"
.LC77:
	.string	"Failed to parse method parameter"
.LC78:
	.string	"Method parameters cannot have default values"
.LC79:
	.string	"Expected '{' to start method body"
.LC80:
	.string	"Failed to parse method body statement"
.LC81:
	.string	"Method missing return statement"
.LC82:
	.string	"Failed to parse class method"
.LC83:
	.string	"Failed to parse class variable"
.LC84:
	.string	"Expected ';' after class variable declaration"
.LC85:
	.string	"Unexpected token in class member"
.LC86:
	.string	"Failed to parse class declaration"
.LC87:
	.string	"Unexpected token in code member"
	.text
	.globl	parse_code
	.type	parse_code, @function
parse_code:
	pushq	%r15
	movq	%rdx, %r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$104, %rsp
	cmpq	$0, builtin_scope(%rip)
	movq	%rdi, 8(%rsp)
	jne	.L345
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
.L345:
	testq	%rbx, %rbx
	jne	.L346
	movq	builtin_scope(%rip), %rbx
.L346:
	call	*create_list@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, 32(%rsp)
	call	*create_scope@GOTPCREL(%rip)
	movq	%rax, 16(%rsp)
.L360:
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L433
	movl	24(%rax), %eax
	testl	%eax, %eax
	je	.L433
	cmpl	$6, %eax
	jne	.L388
	movq	IMPORT_KEYWORD(%rip), %rsi
	movq	(%r14), %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %ebx
	testb	%al, %al
	je	.L349
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	leaq	.LC53(%rip), %rdi
	cmpl	$1, 24(%rax)
	movq	%rax, %rsi
	jne	.L509
	movq	(%rax), %rbp
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$6, 24(%rax)
	movq	%rax, %r12
	jne	.L352
	movq	FROM_KEYWORD(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L353
.L352:
	xorl	%ebx, %ebx
	jmp	.L354
.L353:
	movl	$1, %esi
	movq	8(%rsp), %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$4, 24(%rax)
	movq	%rax, %rsi
	je	.L355
	leaq	.LC54(%rip), %rdi
.L509:
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L351
.L355:
	movq	(%rax), %rbx
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
.L354:
	cmpl	$5, 24(%r12)
	je	.L356
.L357:
	movq	%r12, %rsi
	leaq	.LC55(%rip), %rdi
	jmp	.L509
.L356:
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	movq	(%r12), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L357
	movq	16(%rsp), %rdx
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	*parse_import_file@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L358
	movq	16(%rsp), %r8
	xorl	%ecx, %ecx
	movl	$1, %esi
	movq	%rbp, %rdi
	movq	name_void(%rip), %rdx
	call	*create_name@GOTPCREL(%rip)
.L358:
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	*create_import@GOTPCREL(%rip)
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L359
.L351:
	movq	%r14, %rsi
	leaq	.LC56(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	xorl	%esi, %esi
.L359:
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%edi, %edi
	jmp	.L519
.L349:
	cmpl	$6, 24(%r14)
	jne	.L388
	movq	FUNC_KEYWORD(%rip), %rsi
	movq	(%r14), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L361
	movq	16(%rsp), %rdi
	call	*create_scope@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movl	$1, %esi
	movq	%rax, 24(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L362
	cmpl	$6, %eax
	je	.L363
.L365:
	movq	%r13, %rsi
	leaq	.LC57(%rip), %rdi
	jmp	.L513
.L363:
	movq	0(%r13), %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	testb	%al, %al
	je	.L365
.L362:
	movq	0(%r13), %rsi
	movq	16(%rsp), %rdi
	call	*search@GOTPCREL(%rip)
	movq	%r13, %rsi
	leaq	.LC58(%rip), %rdi
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L513
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$1, 24(%rax)
	je	.L367
	movq	%rax, %rsi
	leaq	.LC59(%rip), %rdi
.L513:
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L364
.L367:
	xorl	%ecx, %ecx
	movq	16(%rsp), %r8
	movq	(%rax), %rdi
	movq	%rbp, %rdx
	movl	$2, %esi
	call	*create_name@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movl	$1, %esi
	movq	%rax, 56(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	je	.L368
.L369:
	movq	%r13, %rsi
	leaq	.LC60(%rip), %rdi
	jmp	.L513
.L368:
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L369
	movq	8(%rsp), %rdi
	movl	$1, %esi
	leaq	.LC62(%rip), %r12
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 40(%rsp)
.L370:
	cmpl	$5, 24(%r13)
	je	.L520
.L378:
	movq	24(%rsp), %rsi
	movq	8(%rsp), %rdi
	movq	%r15, %rdx
	call	parse_variable
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L371
	movq	%r13, %rsi
	leaq	.LC61(%rip), %rdi
	jmp	.L510
.L371:
	cmpq	$0, 16(%rax)
	je	.L373
	movq	%r13, %rsi
	movq	%r12, %rdi
.L510:
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L372
.L373:
	movq	40(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
.L372:
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	je	.L374
.L377:
	movq	%r13, %rsi
	leaq	.LC63(%rip), %rdi
	jmp	.L513
.L374:
	movq	COMMA_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L375
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
	jmp	.L370
.L375:
	cmpl	$5, 24(%r13)
	jne	.L377
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	0(%r13), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L370
	jmp	.L377
.L520:
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	0(%r13), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L378
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	je	.L379
.L380:
	movq	%r13, %rsi
	leaq	.LC64(%rip), %rdi
	jmp	.L513
.L379:
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L380
	call	*create_list@GOTPCREL(%rip)
	movb	$1, (%r15)
	movq	%rax, 48(%rsp)
.L512:
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	je	.L521
.L385:
	movq	24(%rsp), %rsi
	movq	8(%rsp), %rdi
	movq	%r15, %rdx
	call	parse_statement
	movq	%r12, %rsi
	leaq	.LC65(%rip), %rdi
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L511
	testb	%bl, %bl
	je	.L383
	leaq	.LC66(%rip), %rdi
.L511:
	call	*parser_error@GOTPCREL(%rip)
.L383:
	cmpl	$5, 8(%r13)
	movb	$1, %al
	movq	48(%rsp), %rdi
	movq	%r13, %rsi
	cmove	%eax, %ebx
	call	*list_append@GOTPCREL(%rip)
	jmp	.L512
.L521:
	movq	R_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L385
	movb	$0, (%r15)
	testb	%bl, %bl
	jne	.L386
	cmpq	name_void(%rip), %rbp
	je	.L386
	movq	%r12, %rsi
	leaq	.LC67(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L386:
	movq	40(%rsp), %rdx
	movq	24(%rsp), %r8
	movq	%rbp, %rsi
	movq	48(%rsp), %rcx
	movq	56(%rsp), %rdi
	call	*create_function@GOTPCREL(%rip)
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L387
.L364:
	movq	%r14, %rsi
	leaq	.LC68(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	xorl	%edx, %edx
.L387:
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$1, %edi
	jmp	.L519
.L361:
	cmpl	$6, 24(%r14)
	jne	.L388
	movq	CLASS_KEYWORD(%rip), %rsi
	movq	(%r14), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L388
	movq	16(%rsp), %rdi
	call	*create_scope@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movl	$1, %esi
	movq	%rax, 24(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	leaq	.LC69(%rip), %rdi
	cmpl	$1, 24(%rax)
	movq	%rax, %rsi
	jne	.L518
	xorl	%edx, %edx
	movq	16(%rsp), %r8
	movq	(%rax), %rdi
	movl	$4, %esi
	movq	24(%rsp), %rcx
	call	*create_name@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movl	$1, %esi
	movq	%rax, 56(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L391
.L392:
	movq	%rbx, %rsi
	leaq	.LC70(%rip), %rdi
.L518:
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L390
.L391:
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L392
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 64(%rsp)
.L427:
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L522
.L431:
	cmpl	$6, 24(%rbx)
	jne	.L394
	movq	METHOD_KEYWORD(%rip), %rsi
	movq	(%rbx), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L395
	movq	24(%rsp), %rdi
	call	*create_scope@GOTPCREL(%rip)
	movq	56(%rsp), %rdx
	xorl	%ecx, %ecx
	movq	SELF_KEYWORD(%rip), %rdi
	movq	%rax, %r8
	movl	$1, %esi
	movq	%rax, 40(%rsp)
	call	*create_name@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movl	$1, %esi
	movq	%rax, %rbp
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L396
	cmpl	$6, %eax
	je	.L397
.L399:
	movq	%r12, %rsi
	leaq	.LC71(%rip), %rdi
	jmp	.L516
.L397:
	movq	(%r12), %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	testb	%al, %al
	je	.L399
.L396:
	movq	(%r12), %rsi
	movq	24(%rsp), %rdi
	call	*search@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC72(%rip), %rdi
	movq	%rax, 48(%rsp)
	testq	%rax, %rax
	je	.L516
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$1, 24(%rax)
	je	.L401
	movq	%rax, %rsi
	leaq	.LC73(%rip), %rdi
.L516:
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L398
.L401:
	xorl	%ecx, %ecx
	movq	24(%rsp), %r8
	movq	(%rax), %rdi
	movl	$3, %esi
	movq	48(%rsp), %rdx
	call	*create_name@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movl	$1, %esi
	movq	%rax, 88(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	je	.L402
.L403:
	movq	%r12, %rsi
	leaq	.LC74(%rip), %rdi
	jmp	.L516
.L402:
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L403
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$6, 24(%rax)
	movq	%rax, %r12
	je	.L404
.L406:
	movq	%r12, %rsi
	leaq	.LC75(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L405
.L404:
	movq	SELF_KEYWORD(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L406
.L405:
	movq	8(%rsp), %rdi
	movl	$1, %esi
	leaq	.LC78(%rip), %r12
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
	call	*create_list@GOTPCREL(%rip)
	movq	56(%rsp), %rdi
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movq	%rax, 72(%rsp)
	call	*create_variable@GOTPCREL(%rip)
	movq	72(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
.L407:
	cmpl	$5, 24(%r13)
	je	.L523
.L413:
	movq	%r13, %rsi
	leaq	.LC76(%rip), %rdi
	jmp	.L516
.L523:
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	0(%r13), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L419
	cmpl	$5, 24(%r13)
	jne	.L413
	movq	COMMA_SYMBOL(%rip), %rsi
	movq	0(%r13), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L409
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	40(%rsp), %rsi
	movq	8(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rax, %rbp
	call	parse_variable
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L506
	movq	%rbp, %rsi
	leaq	.LC77(%rip), %rdi
	jmp	.L514
.L409:
	cmpl	$5, 24(%r13)
	jne	.L413
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	0(%r13), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L413
.L419:
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L507
	jmp	.L414
.L506:
	cmpq	$0, 16(%rax)
	je	.L417
	movq	%rbp, %rsi
	movq	%r12, %rdi
.L514:
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L416
.L417:
	movq	72(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
.L416:
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
	jmp	.L407
.L414:
	movq	%rbp, %rsi
	leaq	.LC79(%rip), %rdi
	jmp	.L516
.L507:
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L414
	call	*create_list@GOTPCREL(%rip)
	movw	$257, (%r15)
	movq	8(%rsp), %rdi
	xorl	%r12d, %r12d
	movq	%rax, 80(%rsp)
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
.L420:
	cmpl	$5, 24(%r13)
	je	.L524
.L424:
	movq	40(%rsp), %rsi
	movq	8(%rsp), %rdi
	movq	%r15, %rdx
	call	parse_statement
	movq	%r13, %rsi
	leaq	.LC80(%rip), %rdi
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L515
	testb	%r12b, %r12b
	je	.L422
	leaq	.LC66(%rip), %rdi
.L515:
	call	*parser_error@GOTPCREL(%rip)
.L422:
	cmpl	$5, 8(%rbp)
	movb	$1, %al
	movq	80(%rsp), %rdi
	movq	%rbp, %rsi
	cmove	%eax, %r12d
	call	*list_append@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
	jmp	.L420
.L524:
	movq	R_BRACE_SYMBOL(%rip), %rsi
	movq	0(%r13), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L424
	movw	$0, (%r15)
	testb	%r12b, %r12b
	jne	.L425
	movq	48(%rsp), %rax
	cmpq	name_void(%rip), %rax
	je	.L425
	movq	%r13, %rsi
	leaq	.LC81(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L425:
	movq	48(%rsp), %rsi
	movq	40(%rsp), %r8
	movq	80(%rsp), %rcx
	movq	72(%rsp), %rdx
	movq	88(%rsp), %rdi
	call	*create_method@GOTPCREL(%rip)
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L426
.L398:
	movq	%rbx, %rsi
	leaq	.LC82(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	xorl	%esi, %esi
.L426:
	xorl	%edi, %edi
	xorl	%edx, %edx
	call	*create_class_member@GOTPCREL(%rip)
	movq	64(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L427
.L395:
	cmpl	$6, 24(%rbx)
	jne	.L394
	movq	VAR_KEYWORD(%rip), %rsi
	movq	(%rbx), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L394
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	24(%rsp), %rsi
	movq	8(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rax, %rbx
	call	parse_variable
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L428
	movq	%rbx, %rsi
	leaq	.LC83(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L428:
	movq	%rbp, %rdx
	xorl	%esi, %esi
	movl	$1, %edi
	call	*create_class_member@GOTPCREL(%rip)
	movq	64(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L429
.L430:
	movq	%rbx, %rsi
	leaq	.LC84(%rip), %rdi
	jmp	.L517
.L429:
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L430
	jmp	.L427
.L394:
	movq	%rbx, %rsi
	leaq	.LC85(%rip), %rdi
.L517:
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L427
.L522:
	movq	R_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L431
	movq	24(%rsp), %rdx
	movq	64(%rsp), %rsi
	movq	56(%rsp), %rdi
	call	*create_class@GOTPCREL(%rip)
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L432
.L390:
	movq	%r14, %rsi
	leaq	.LC86(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	xorl	%ecx, %ecx
.L432:
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$2, %edi
.L519:
	call	*create_code_member@GOTPCREL(%rip)
	movq	32(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L360
.L433:
	movq	16(%rsp), %rsi
	movq	32(%rsp), %rdi
	addq	$104, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*create_code@GOTPCREL(%rip)
.L388:
	movq	%r14, %rsi
	leaq	.LC87(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L360
	.size	parse_code, .-parse_code
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
