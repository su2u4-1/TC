	.file	"parser.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Failed to parse right operand"
	.text
	.type	parse_expr_prec, @function
parse_expr_prec:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$40, %rsp
	movq	%rdi, %r12
	movq	%rsi, 8(%rsp)
	movl	%edx, 28(%rsp)
	movq	%rcx, 16(%rsp)
	movq	%r8, %r15
	movl	$1, %esi
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	je	.L7
	movq	8(%rsp), %rbp
	jmp	.L2
.L15:
	movq	%rbx, %rsi
	leaq	.LC0(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L1
.L13:
	movl	$1, %esi
	movq	%r12, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	jne	.L5
.L6:
	movq	(%rax), %rdi
	call	*string_to_operator@GOTPCREL(%rip)
	movl	%eax, %ebx
	movl	%eax, %edi
	call	*operator_precedence@GOTPCREL(%rip)
	cmpl	$19, %ebx
	je	.L5
	cmpl	%eax, %r13d
	jge	.L5
	movq	%r15, %r8
	movq	16(%rsp), %rcx
	movl	%eax, %edx
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	parse_expr_prec
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L13
	jmp	.L1
.L5:
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	8(%rsp), %rsi
	movl	%r14d, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	movl	$1, %esi
	movq	%r12, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	jne	.L14
.L7:
	movq	(%rax), %rdi
	call	*string_to_operator@GOTPCREL(%rip)
	movl	%eax, %r14d
	movl	%eax, %edi
	call	*operator_precedence@GOTPCREL(%rip)
	movl	%eax, %r13d
	cmpl	$19, %r14d
	je	.L9
	movl	28(%rsp), %eax
	cmpl	%eax, %r13d
	jl	.L9
	movl	$1, %esi
	movq	%r12, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r12, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%r15, %rdx
	movq	16(%rsp), %rsi
	movq	%r12, %rdi
	call	parse_primary
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L15
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rax, %rbp
	movl	$1, %esi
	movq	%r12, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	je	.L6
	jmp	.L5
.L14:
	movq	8(%rsp), %rbp
	jmp	.L2
.L9:
	movq	8(%rsp), %rbp
.L2:
	movq	%r12, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
.L1:
	movq	%rbp, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	parse_expr_prec, .-parse_expr_prec
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Failed to parse expression primary"
	.text
	.type	parse_expression, @function
parse_expression:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbp
	movq	%rsi, %r12
	movq	%rdx, %r13
	call	parse_primary
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L20
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%r13, %r8
	movq	%r12, %rcx
	movl	$0, %edx
	movq	%rbp, %rdi
	call	parse_expr_prec
	movq	%rax, %rbx
.L16:
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L20:
	movq	%rbp, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L16
	.size	parse_expression, .-parse_expression
	.section	.rodata.str1.1
.LC2:
	.string	"Expected variable type"
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"Expected a type for variable declaration"
	.section	.rodata.str1.1
.LC4:
	.string	"Unknown variable type"
.LC5:
	.string	"Expected variable name"
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"Failed to parse variable initializer"
	.text
	.type	parse_variable, @function
parse_variable:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$24, %rsp
	movq	%rdi, %rbx
	movq	%rsi, %r12
	movq	%rdx, %r13
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %r14
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L22
	cmpl	$6, %eax
	jne	.L23
	movq	(%r14), %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	testb	%al, %al
	je	.L23
.L22:
	movq	(%r14), %rsi
	movq	%r12, %rdi
	call	*search@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L25
	testl	$-5, 24(%rax)
	jne	.L32
.L26:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
	cmpl	$1, 24(%rax)
	jne	.L33
.L27:
	movq	(%r14), %rdi
	movq	%r12, %r8
	movl	$0, %ecx
	movq	%rbp, %rdx
	movl	$1, %esi
	call	*create_name@GOTPCREL(%rip)
	movq	%rax, %r14
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	movl	$0, %r15d
	cmpl	$5, 24(%rax)
	je	.L34
.L28:
	movq	%r15, %rdx
	movq	%r14, %rsi
	movq	%rbp, %rdi
	call	*create_variable@GOTPCREL(%rip)
.L21:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L23:
	movq	%r14, %rsi
	leaq	.LC2(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L21
.L32:
	movq	%r14, %rsi
	leaq	.LC3(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L26
.L25:
	movq	%r14, %rsi
	leaq	.LC4(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L26
.L33:
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L27
.L34:
	movq	(%rax), %rdi
	movq	ASSIGN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L28
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	parse_expression
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L28
	movq	8(%rsp), %rsi
	leaq	.LC6(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L28
	.size	parse_variable, .-parse_variable
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"Failed to parse parenthesized expression"
	.section	.rodata.str1.1
.LC8:
	.string	"Expected ')' after expression"
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"Failed to parse operand of unary '!'"
	.align 8
.LC10:
	.string	"Failed to parse operand of unary '-'"
	.align 8
.LC11:
	.string	"Expected variable name in variable access"
	.align 8
.LC12:
	.string	"Cannot call undefined variable"
	.align 8
.LC13:
	.string	"Cannot call non-function variable"
	.align 8
.LC14:
	.string	"Failed to parse function call argument"
	.align 8
.LC15:
	.string	"Expected ',' or ')' after function call argument"
	.align 8
.LC16:
	.string	"Failed to parse sequence index"
	.align 8
.LC17:
	.string	"Expected ']' after sequence index"
	.align 8
.LC18:
	.string	"Cannot access attribute without a valid scope"
	.align 8
.LC19:
	.string	"Expected attribute name after '.'"
	.section	.rodata.str1.1
.LC20:
	.string	"Unknown attribute name"
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"Failed to parse variable access"
	.align 8
.LC22:
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
	movq	%rdi, %rbp
	movq	%rsi, %r15
	movq	%rdx, %r14
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %r12
	movl	24(%rax), %eax
	cmpl	$2, %eax
	je	.L87
	cmpl	$3, %eax
	je	.L88
	cmpl	$4, %eax
	je	.L89
	cmpl	$6, %eax
	je	.L90
.L40:
	cmpl	$5, 24(%r12)
	je	.L91
.L48:
	movl	24(%r12), %eax
	cmpl	$1, %eax
	je	.L49
	cmpl	$6, %eax
	jne	.L50
	movq	(%r12), %rdi
	movq	SELF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L50
	cmpb	$0, 1(%r14)
	je	.L50
.L49:
	movq	%rbp, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L51
	cmpl	$6, %eax
	jne	.L52
	movq	(%rbx), %rdi
	movq	SELF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L52
.L51:
	movq	(%rbx), %rsi
	movq	%r15, %rdi
	call	*search@GOTPCREL(%rip)
	movq	%rax, 16(%rsp)
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, (%rsp)
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	jne	.L54
	movl	$0, %r13d
	movq	$0, 8(%rsp)
	jmp	.L76
.L87:
	movq	(%r12), %rsi
	movq	$0, (%rsp)
	movl	$0, %ebp
	movl	$0, %ebx
	movl	$0, %r12d
.L37:
	movq	(%rsp), %r8
	movq	%rbp, %rcx
	movq	%rbx, %rdx
	movl	%r12d, %edi
	call	*create_primary@GOTPCREL(%rip)
	movq	%rax, %rbx
.L35:
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L88:
	movq	(%r12), %rsi
	movq	$0, (%rsp)
	movl	$0, %ebp
	movl	$0, %ebx
	movl	$1, %r12d
	jmp	.L37
.L89:
	movq	(%r12), %rsi
	movq	$0, (%rsp)
	movl	$0, %ebp
	movl	$0, %ebx
	movl	$2, %r12d
	jmp	.L37
.L90:
	movq	(%r12), %rdi
	movq	TRUE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L41
	movq	(%r12), %rsi
	movq	$0, (%rsp)
	movl	$0, %ebp
	movl	$0, %ebx
	movl	$3, %r12d
	jmp	.L37
.L41:
	cmpl	$6, 24(%r12)
	jne	.L40
	movq	(%r12), %rdi
	movq	FALSE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L40
	movq	(%r12), %rsi
	movq	$0, (%rsp)
	movl	$0, %ebp
	movl	$0, %ebx
	movl	$4, %r12d
	jmp	.L37
.L91:
	movq	(%r12), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L92
	cmpl	$5, 24(%r12)
	jne	.L48
	movq	(%r12), %rdi
	movq	NOT_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L93
	cmpl	$5, 24(%r12)
	jne	.L48
	movq	(%r12), %rdi
	movq	SUB_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L48
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%r14, %rdx
	movq	%r15, %rsi
	movq	%rbp, %rdi
	call	parse_primary
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L94
	movq	$0, (%rsp)
	movl	$0, %ebx
	movl	$0, %esi
	movl	$7, %r12d
	jmp	.L37
.L92:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	%r14, %rdx
	movq	%r15, %rsi
	movq	%rbp, %rdi
	call	parse_expression
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L95
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	movl	24(%rax), %r12d
	cmpl	$5, %r12d
	jne	.L46
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L46
	movq	$0, (%rsp)
	movl	$0, %ebp
	movl	$0, %esi
	jmp	.L37
.L95:
	movq	%r12, %rsi
	leaq	.LC7(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L35
.L46:
	movq	%rbp, %rsi
	leaq	.LC8(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %ebx
	jmp	.L35
.L93:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%r14, %rdx
	movq	%r15, %rsi
	movq	%rbp, %rdi
	call	parse_primary
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L96
	movq	$0, (%rsp)
	movl	$0, %ebx
	movl	$0, %esi
	movl	$6, %r12d
	jmp	.L37
.L96:
	movq	%rbx, %rsi
	leaq	.LC9(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	%rbp, %rbx
	jmp	.L35
.L94:
	movq	%rbx, %rsi
	leaq	.LC10(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	%rbp, %rbx
	jmp	.L35
.L52:
	movq	%rbx, %rsi
	leaq	.LC11(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L77
.L84:
	movq	16(%rsp), %rax
	movq	16(%rax), %r13
.L55:
	cmpq	$0, 8(%rsp)
	jne	.L58
	testq	%r13, %r13
	je	.L58
	movq	$0, 8(%rsp)
	cmpl	$4, 24(%r13)
	je	.L97
.L58:
	movq	(%rbx), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L98
	movq	(%rbx), %rdi
	movq	L_BRACKET_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L69
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%r14, %rdx
	movq	%r15, %rsi
	movq	%rbp, %rdi
	call	parse_expression
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.L99
.L70:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	jne	.L71
	movq	(%rax), %rdi
	movq	R_BRACKET_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L71
	movl	$0, %r8d
	movq	24(%rsp), %rcx
	movl	$0, %edx
	movq	(%rsp), %rsi
	movl	$3, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, (%rsp)
.L68:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	jne	.L54
.L76:
	movq	16(%rsp), %rax
	testq	%rax, %rax
	je	.L55
	movl	24(%rax), %eax
	leal	-1(%rax), %edx
	cmpl	$2, %edx
	jbe	.L84
	cmpl	$5, %eax
	je	.L84
	testl	$-5, %eax
	cmove	16(%rsp), %r13
	jmp	.L55
.L97:
	movq	16(%r13), %rax
	movq	%rax, 8(%rsp)
	jmp	.L58
.L98:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpq	$0, 16(%rsp)
	je	.L100
.L60:
	movq	16(%rsp), %rax
	movl	24(%rax), %eax
	movl	%eax, 8(%rsp)
	subl	$2, %eax
	cmpl	$1, %eax
	ja	.L101
.L61:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	jmp	.L62
.L100:
	movq	%rax, %rsi
	leaq	.LC12(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L60
.L101:
	movq	%rbx, %rsi
	leaq	.LC13(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L61
.L104:
	movq	%rbx, %rsi
	leaq	.LC14(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L63
.L105:
	movq	(%rax), %rdi
	movq	COMMA_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L102
	cmpl	$5, 24(%rbx)
	jne	.L64
	movq	(%rbx), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L64
.L62:
	cmpl	$5, 24(%rbx)
	je	.L103
.L67:
	movq	%r14, %rdx
	movq	%r15, %rsi
	movq	%rbp, %rdi
	call	parse_expression
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L104
.L63:
	movq	%r13, %rsi
	movq	8(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	je	.L105
.L64:
	movq	%rbx, %rsi
	leaq	.LC15(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L77:
	movq	%r12, %rsi
	leaq	.LC21(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %ebx
	jmp	.L35
.L102:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L62
.L103:
	movq	(%rbx), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L67
	movq	8(%rsp), %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	(%rsp), %rsi
	movl	$1, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, (%rsp)
	movq	16(%rsp), %rax
	movq	16(%rax), %rax
	movq	%rax, 16(%rsp)
	movq	$0, 8(%rsp)
	movl	$0, %r13d
	jmp	.L68
.L99:
	movq	%rbx, %rsi
	leaq	.LC16(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L70
.L71:
	movq	%rbx, %rsi
	leaq	.LC17(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L77
.L69:
	movq	(%rbx), %rdi
	movq	DOT_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L54
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpq	$0, 8(%rsp)
	je	.L106
	cmpl	$1, 24(%rax)
	jne	.L107
	movq	(%rax), %rsi
	movq	8(%rsp), %rdi
	call	*search@GOTPCREL(%rip)
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	je	.L108
	movl	$0, %r8d
	movl	$0, %ecx
	movq	16(%rsp), %rdx
	movq	(%rsp), %rsi
	movl	$2, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, (%rsp)
	movq	$0, 8(%rsp)
	movl	$0, %r13d
	jmp	.L68
.L106:
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L77
.L107:
	movq	%rax, %rsi
	leaq	.LC19(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L77
.L108:
	movq	%rbx, %rsi
	leaq	.LC20(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L77
.L54:
	cmpq	$0, (%rsp)
	je	.L77
	movl	$0, %ebp
	movl	$0, %ebx
	movl	$0, %esi
	movl	$8, %r12d
	jmp	.L37
.L50:
	movq	%r12, %rsi
	leaq	.LC22(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %ebx
	jmp	.L35
	.size	parse_primary, .-parse_primary
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
	.type	parse_statement, @function
parse_statement:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$56, %rsp
	movq	%rdi, %rbx
	movq	%rsi, %r13
	movq	%rdx, %r12
	call	*peek_current_token@GOTPCREL(%rip)
	cmpl	$6, 24(%rax)
	je	.L192
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_expression
	movq	%rax, %r8
	movl	$0, %r9d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rbp
.L179:
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	testq	%rbp, %rbp
	je	.L193
.L185:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	je	.L194
.L186:
	movq	%rbx, %rsi
	leaq	.LC52(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L109:
	movq	%rbp, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L192:
	movq	%rax, %rbp
	movq	(%rax), %rdi
	movq	IF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L195
	movq	0(%rbp), %rdi
	movq	FOR_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L196
	movq	0(%rbp), %rdi
	movq	WHILE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L197
	movq	0(%rbp), %rdi
	movq	VAR_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L178
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_variable
	movq	%rax, %r9
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$1, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L179
.L195:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L112
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L112
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_expression
	movq	%rax, 32(%rsp)
	testq	%rax, %rax
	je	.L198
.L115:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L116
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L116
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L118
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L118
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
	leaq	.LC27(%rip), %r15
	jmp	.L120
.L112:
	movq	%rbp, %rsi
	leaq	.LC23(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %esi
.L114:
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$2, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L109
.L198:
	movq	%rbp, %rsi
	leaq	.LC24(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L115
.L116:
	movq	%rbp, %rsi
	leaq	.LC25(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %esi
	jmp	.L114
.L118:
	movq	%rbp, %rsi
	leaq	.LC26(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %esi
	jmp	.L114
.L122:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L199
.L121:
	movq	%rbp, %rsi
	movq	8(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
.L120:
	cmpl	$5, 24(%r14)
	jne	.L122
	movq	(%r14), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L122
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 24(%rsp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 40(%rsp)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$6, 24(%rax)
	je	.L123
	jmp	.L124
.L199:
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L121
.L125:
	movq	%rbp, %rsi
	leaq	.LC28(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %esi
	jmp	.L114
.L202:
	movq	%rbp, %rsi
	leaq	.LC29(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L127
.L128:
	movq	%rbp, %rsi
	leaq	.LC30(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %esi
	jmp	.L114
.L130:
	movq	%rbp, %rsi
	leaq	.LC31(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %esi
	jmp	.L114
.L134:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L200
.L133:
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
.L132:
	cmpl	$5, 24(%rbp)
	jne	.L134
	movq	0(%rbp), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L134
	movq	%r15, %rsi
	movq	16(%rsp), %rdi
	call	*create_else_if@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	24(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$6, 24(%rax)
	jne	.L124
.L123:
	movq	0(%rbp), %rdi
	movq	ELIF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L201
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L125
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L125
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_expression
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	je	.L202
.L127:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L128
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L128
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L130
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L130
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, %r15
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L132
.L200:
	movq	%rbp, %rsi
	leaq	.LC32(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L133
.L201:
	cmpl	$6, 24(%rbp)
	jne	.L124
	movq	0(%rbp), %rdi
	movq	ELSE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L203
.L124:
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	40(%rsp), %rcx
	movq	24(%rsp), %rdx
	movq	8(%rsp), %rsi
	movq	32(%rsp), %rdi
	call	*create_if@GOTPCREL(%rip)
	movq	%rax, %rsi
	jmp	.L114
.L203:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L136
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L136
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	leaq	.LC34(%rip), %r15
	jmp	.L138
.L136:
	movq	%rbp, %rsi
	leaq	.LC33(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %esi
	jmp	.L114
.L140:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L204
.L139:
	movq	%r14, %rsi
	movq	40(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
.L138:
	cmpl	$5, 24(%rbp)
	jne	.L140
	movq	0(%rbp), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L140
	jmp	.L124
.L204:
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L139
.L196:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L143
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L143
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	je	.L205
.L146:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_variable
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L206
.L148:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
.L147:
	cmpl	$5, 24(%rbp)
	jne	.L149
	movq	0(%rbp), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L149
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	je	.L207
.L151:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_expression
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	je	.L208
.L153:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
.L152:
	cmpl	$5, 24(%rbp)
	jne	.L154
	movq	0(%rbp), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L154
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	je	.L209
.L156:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_expression
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.L210
.L158:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
.L157:
	cmpl	$5, 24(%rbp)
	jne	.L159
	movq	0(%rbp), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L159
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L161
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L161
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, %r15
	movb	$1, 2(%r12)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
	jmp	.L163
.L143:
	movq	%rbp, %rsi
	leaq	.LC35(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %ecx
.L145:
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L109
.L205:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	movq	$0, 8(%rsp)
	testb	%al, %al
	jne	.L147
	jmp	.L146
.L206:
	movq	%rbp, %rsi
	leaq	.LC36(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L148
.L149:
	movq	%rbp, %rsi
	leaq	.LC37(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %ecx
	jmp	.L145
.L207:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	movq	$0, 16(%rsp)
	testb	%al, %al
	jne	.L152
	jmp	.L151
.L208:
	movq	%rbp, %rsi
	leaq	.LC38(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L153
.L154:
	movq	%rbp, %rsi
	leaq	.LC39(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %ecx
	jmp	.L145
.L209:
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	movq	$0, 24(%rsp)
	testb	%al, %al
	jne	.L157
	jmp	.L156
.L210:
	movq	%rbp, %rsi
	leaq	.LC40(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L158
.L159:
	movq	%rbp, %rsi
	leaq	.LC41(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %ecx
	jmp	.L145
.L161:
	movq	%rbp, %rsi
	leaq	.LC42(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %ecx
	jmp	.L145
.L165:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L211
.L164:
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
.L163:
	cmpl	$5, 24(%r14)
	jne	.L165
	movq	(%r14), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L165
	movb	$0, 2(%r12)
	movq	%r15, %rcx
	movq	24(%rsp), %rdx
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	call	*create_for@GOTPCREL(%rip)
	movq	%rax, %rcx
	jmp	.L145
.L211:
	movq	%r14, %rsi
	leaq	.LC43(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L164
.L197:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L167
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L167
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_expression
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L212
.L170:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L171
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L171
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L173
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L173
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, %r15
	movb	$1, 2(%r12)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
	jmp	.L175
.L167:
	movq	%rbp, %rsi
	leaq	.LC44(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %edx
.L169:
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %esi
	movl	$3, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L109
.L212:
	movq	%rbp, %rsi
	leaq	.LC45(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L170
.L171:
	movq	%rbp, %rsi
	leaq	.LC46(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %edx
	jmp	.L169
.L173:
	movq	%rbp, %rsi
	leaq	.LC47(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %edx
	jmp	.L169
.L177:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L213
.L176:
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
.L175:
	cmpl	$5, 24(%r14)
	jne	.L177
	movq	(%r14), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L177
	movb	$0, 2(%r12)
	movq	%r15, %rsi
	movq	8(%rsp), %rdi
	call	*create_while@GOTPCREL(%rip)
	movq	%rax, %rdx
	jmp	.L169
.L213:
	movq	%r14, %rsi
	leaq	.LC48(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L176
.L178:
	movq	0(%rbp), %rdi
	movq	RETURN_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L180
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_expression
	movq	%rax, %r8
	movl	$0, %r9d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$5, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L179
.L180:
	movq	0(%rbp), %rdi
	movq	BREAK_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L181
	cmpb	$0, 2(%r12)
	je	.L214
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$6, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L179
.L214:
	movq	%rbp, %rsi
	leaq	.LC49(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %ebp
	jmp	.L109
.L181:
	movq	0(%rbp), %rdi
	movq	CONTINUE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L183
	cmpb	$0, 2(%r12)
	je	.L215
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$7, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L179
.L215:
	movq	%rbp, %rsi
	leaq	.LC50(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %ebp
	jmp	.L109
.L183:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_expression
	movq	%rax, %r8
	movl	$0, %r9d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L179
.L193:
	movq	%rax, %rsi
	leaq	.LC51(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L185
.L194:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L109
	jmp	.L186
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
.LC80:
	.string	"Failed to parse method body statement"
	.align 8
.LC81:
	.string	"Method missing return statement"
	.section	.rodata.str1.1
.LC82:
	.string	"Failed to parse class method"
	.section	.rodata.str1.8
	.align 8
.LC83:
	.string	"Failed to parse class variable"
	.align 8
.LC84:
	.string	"Expected ';' after class variable declaration"
	.align 8
.LC85:
	.string	"Unexpected token in class member"
	.align 8
.LC86:
	.string	"Failed to parse class declaration"
	.align 8
.LC87:
	.string	"Unexpected token in code member"
	.text
	.globl	parse_code
	.type	parse_code, @function
parse_code:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$120, %rsp
	movq	%rdi, %r12
	movq	%rsi, %rbx
	movq	%rdx, 16(%rsp)
	cmpq	$0, builtin_scope(%rip)
	je	.L313
.L217:
	testq	%rbx, %rbx
	cmove	builtin_scope(%rip), %rbx
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 32(%rsp)
	movq	%rbx, %rdi
	call	*create_scope@GOTPCREL(%rip)
	movq	%rax, 24(%rsp)
	movl	$1, %esi
	movq	%r12, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	movq	%r12, %r15
	testq	%rax, %rax
	jne	.L219
.L220:
	movq	24(%rsp), %rsi
	movq	32(%rsp), %rdi
	call	*create_code@GOTPCREL(%rip)
	addq	$120, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L313:
	movl	$0, %edi
	call	*create_scope@GOTPCREL(%rip)
	movq	%rax, %r8
	movq	%rax, builtin_scope(%rip)
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movq	VOID_KEYWORD(%rip), %rdi
	call	*create_name@GOTPCREL(%rip)
	movq	%rax, name_void(%rip)
	movq	builtin_scope(%rip), %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movq	INT_KEYWORD(%rip), %rdi
	call	*create_name@GOTPCREL(%rip)
	movq	%rax, name_int(%rip)
	movq	builtin_scope(%rip), %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movq	FLOAT_KEYWORD(%rip), %rdi
	call	*create_name@GOTPCREL(%rip)
	movq	%rax, name_float(%rip)
	movq	builtin_scope(%rip), %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movq	STRING_KEYWORD(%rip), %rdi
	call	*create_name@GOTPCREL(%rip)
	movq	%rax, name_string(%rip)
	movq	builtin_scope(%rip), %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movq	BOOL_KEYWORD(%rip), %rdi
	call	*create_name@GOTPCREL(%rip)
	movq	%rax, name_bool(%rip)
	jmp	.L217
.L330:
	movq	8(%rsp), %rax
	movq	(%rax), %rdi
	movq	IMPORT_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %ebp
	testb	%al, %al
	jne	.L314
	movq	8(%rsp), %rax
	cmpl	$6, 24(%rax)
	jne	.L257
	movq	(%rax), %rdi
	movq	FUNC_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	movb	%al, 71(%rsp)
	testb	%al, %al
	jne	.L315
	movq	8(%rsp), %rax
	cmpl	$6, 24(%rax)
	jne	.L257
	movq	(%rax), %rdi
	movq	CLASS_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L257
	movq	24(%rsp), %rdi
	call	*create_scope@GOTPCREL(%rip)
	movq	%rax, 40(%rsp)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$1, 24(%rax)
	jne	.L316
	movq	(%rax), %rdi
	movq	24(%rsp), %r8
	movq	40(%rsp), %rcx
	movl	$0, %edx
	movl	$4, %esi
	call	*create_name@GOTPCREL(%rip)
	movq	%rax, 56(%rsp)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	jne	.L260
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L260
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 48(%rsp)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	leaq	.LC85(%rip), %r14
	jmp	.L262
.L314:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$1, 24(%rax)
	jne	.L317
	movq	(%rax), %r12
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	movl	$0, %ebp
	cmpl	$6, 24(%rax)
	je	.L318
.L225:
	cmpl	$5, 24(%rbx)
	jne	.L227
	movq	(%rbx), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L227
	movq	24(%rsp), %rdx
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	*parse_import_file@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L319
.L229:
	movq	%rbp, %rsi
	call	*create_import@GOTPCREL(%rip)
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L299
.L230:
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %edi
	call	*create_code_member@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	32(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L231
.L317:
	movq	%rax, %rsi
	leaq	.LC53(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L299
.L318:
	movq	(%rax), %rdi
	movq	FROM_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L225
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$4, 24(%rax)
	jne	.L320
	movq	(%rax), %rbp
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L225
.L320:
	movq	%rax, %rsi
	leaq	.LC54(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L299
.L227:
	movq	%rbx, %rsi
	leaq	.LC55(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L299:
	movq	8(%rsp), %rsi
	leaq	.LC56(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %esi
	jmp	.L230
.L319:
	movq	24(%rsp), %r8
	movl	$0, %ecx
	movq	name_void(%rip), %rdx
	movl	$1, %esi
	movq	%r12, %rdi
	call	*create_name@GOTPCREL(%rip)
	movq	%rax, %rdi
	jmp	.L229
.L315:
	movq	24(%rsp), %rdi
	call	*create_scope@GOTPCREL(%rip)
	movq	%rax, %r12
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L233
	cmpl	$6, %eax
	jne	.L234
	movq	(%rbx), %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	testb	%al, %al
	je	.L234
.L233:
	movq	(%rbx), %rsi
	movq	24(%rsp), %rdi
	call	*search@GOTPCREL(%rip)
	movq	%rax, 40(%rsp)
	testq	%rax, %rax
	je	.L321
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$1, 24(%rax)
	jne	.L322
	movq	(%rax), %rdi
	movq	24(%rsp), %r8
	movl	$0, %ecx
	movq	40(%rsp), %rdx
	movl	$2, %esi
	call	*create_name@GOTPCREL(%rip)
	movq	%rax, 56(%rsp)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	jne	.L238
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L238
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 48(%rsp)
	leaq	.LC62(%rip), %r14
	leaq	.LC61(%rip), %r13
	jmp	.L240
.L234:
	movq	%rbx, %rsi
	leaq	.LC57(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L300:
	movq	8(%rsp), %rsi
	leaq	.LC68(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %edx
	jmp	.L256
.L321:
	movq	%rbx, %rsi
	leaq	.LC58(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L300
.L322:
	movq	%rax, %rsi
	leaq	.LC59(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L300
.L238:
	movq	%rbx, %rsi
	leaq	.LC60(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L300
.L325:
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L242
.L243:
	movq	%rax, %rsi
	movq	48(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L242
.L326:
	movq	(%rax), %rdi
	movq	COMMA_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L323
	cmpl	$5, 24(%rbx)
	jne	.L244
	movq	(%rbx), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L244
.L240:
	cmpl	$5, 24(%rbx)
	je	.L324
.L247:
	movq	16(%rsp), %rdx
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	parse_variable
	testq	%rax, %rax
	je	.L325
	cmpq	$0, 16(%rax)
	je	.L243
	movq	%rbx, %rsi
	movq	%r14, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L242:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	je	.L326
.L244:
	movq	%rbx, %rsi
	leaq	.LC63(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L300
.L323:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L240
.L324:
	movq	(%rbx), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L247
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	jne	.L248
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L248
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, %r14
	movq	16(%rsp), %rax
	movb	$1, (%rax)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
	jmp	.L250
.L248:
	movq	%rbx, %rsi
	leaq	.LC64(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L300
.L254:
	movq	16(%rsp), %rdx
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	parse_statement
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L327
	testb	%bpl, %bpl
	jne	.L328
.L252:
	cmpl	$5, 8(%rbx)
	movl	$1, %eax
	cmove	%eax, %ebp
	movq	%rbx, %rsi
	movq	%r14, %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
.L250:
	cmpl	$5, 24(%r13)
	jne	.L254
	movq	0(%r13), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L254
	movq	16(%rsp), %rax
	movb	$0, (%rax)
	testb	%bpl, %bpl
	jne	.L255
	movq	40(%rsp), %rax
	cmpq	name_void(%rip), %rax
	je	.L255
	movq	%r13, %rsi
	leaq	.LC67(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L255:
	movq	%r12, %r8
	movq	%r14, %rcx
	movq	48(%rsp), %rdx
	movq	40(%rsp), %rsi
	movq	56(%rsp), %rdi
	call	*create_function@GOTPCREL(%rip)
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L300
.L256:
	movl	$0, %ecx
	movl	$0, %esi
	movl	$1, %edi
	call	*create_code_member@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	32(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L231
.L327:
	movq	%r13, %rsi
	leaq	.LC65(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L252
.L328:
	movq	%r13, %rsi
	leaq	.LC66(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L252
.L316:
	movq	%rax, %rsi
	leaq	.LC69(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L301
.L260:
	movq	%rbx, %rsi
	leaq	.LC70(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L301:
	movq	8(%rsp), %rsi
	leaq	.LC86(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %ecx
	jmp	.L297
.L296:
	cmpl	$6, 24(%rbx)
	je	.L329
.L263:
	movq	%rbx, %rsi
	movq	%r14, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L293:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
.L262:
	cmpl	$5, 24(%rbx)
	jne	.L296
	movq	(%rbx), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L296
	movq	40(%rsp), %rdx
	movq	48(%rsp), %rsi
	movq	56(%rsp), %rdi
	call	*create_class@GOTPCREL(%rip)
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L301
.L297:
	movl	$0, %edx
	movl	$0, %esi
	movl	$2, %edi
	call	*create_code_member@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	32(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
.L231:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L220
.L219:
	movq	8(%rsp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	je	.L220
	cmpl	$6, %eax
	je	.L330
.L257:
	movq	8(%rsp), %rsi
	leaq	.LC87(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L231
.L329:
	movq	(%rbx), %rdi
	movq	METHOD_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L331
	cmpl	$6, 24(%rbx)
	jne	.L263
	movq	(%rbx), %rdi
	movq	VAR_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L263
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	16(%rsp), %rdx
	movq	40(%rsp), %rsi
	movq	%r15, %rdi
	call	parse_variable
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L332
.L294:
	movq	%rbx, %rdx
	movl	$0, %esi
	movl	$1, %edi
	call	*create_class_member@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	48(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	je	.L333
.L295:
	movq	%rbx, %rsi
	leaq	.LC84(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L293
.L331:
	movq	40(%rsp), %rdi
	call	*create_scope@GOTPCREL(%rip)
	movq	%rax, %r13
	movq	%rax, %r8
	movl	$0, %ecx
	movq	56(%rsp), %rdx
	movl	$1, %esi
	movq	SELF_KEYWORD(%rip), %rdi
	call	*create_name@GOTPCREL(%rip)
	movq	%rax, %r12
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L265
	cmpl	$6, %eax
	jne	.L266
	movq	0(%rbp), %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	testb	%al, %al
	je	.L266
.L265:
	movq	0(%rbp), %rsi
	movq	40(%rsp), %rdi
	call	*search@GOTPCREL(%rip)
	movq	%rax, 80(%rsp)
	testq	%rax, %rax
	je	.L334
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$1, 24(%rax)
	jne	.L335
	movq	(%rax), %rdi
	movq	40(%rsp), %r8
	movl	$0, %ecx
	movq	80(%rsp), %rdx
	movl	$3, %esi
	call	*create_name@GOTPCREL(%rip)
	movq	%rax, 96(%rsp)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L270
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L270
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$6, 24(%rax)
	je	.L336
.L272:
	movq	%rbp, %rsi
	leaq	.LC75(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L273:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 88(%rsp)
	movl	$0, %edx
	movq	%r12, %rsi
	movq	56(%rsp), %rdi
	call	*create_variable@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	88(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	leaq	.LC78(%rip), %r12
	jmp	.L274
.L266:
	movq	%rbp, %rsi
	leaq	.LC71(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L302:
	movq	%rbx, %rsi
	leaq	.LC82(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %esi
	jmp	.L292
.L334:
	movq	%rbp, %rsi
	leaq	.LC72(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L302
.L335:
	movq	%rax, %rsi
	leaq	.LC73(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L302
.L270:
	movq	%rbp, %rsi
	leaq	.LC74(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L302
.L336:
	movq	(%rax), %rdi
	movq	SELF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L273
	jmp	.L272
.L276:
	cmpl	$5, 24(%rbp)
	jne	.L279
	movq	0(%rbp), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L279
.L280:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L284
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L284
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 72(%rsp)
	movq	16(%rsp), %rax
	movb	$1, (%rax)
	movb	$1, 1(%rax)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movzbl	71(%rsp), %r12d
	movq	%rbx, 104(%rsp)
	movq	%rax, %rbp
	jmp	.L286
.L337:
	movq	%rbp, %rsi
	leaq	.LC77(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L281
.L282:
	movq	%rax, %rsi
	movq	88(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L281
.L338:
	movq	0(%rbp), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L280
	cmpl	$5, 24(%rbp)
	jne	.L279
	movq	0(%rbp), %rdi
	movq	COMMA_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L276
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	16(%rsp), %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	parse_variable
	testq	%rax, %rax
	je	.L337
	cmpq	$0, 16(%rax)
	je	.L282
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L281:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
.L274:
	cmpl	$5, 24(%rbp)
	je	.L338
.L279:
	movq	%rbp, %rsi
	leaq	.LC76(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L302
.L284:
	movq	%rbp, %rsi
	leaq	.LC79(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L302
.L290:
	movq	16(%rsp), %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	parse_statement
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L339
	testb	%r12b, %r12b
	jne	.L340
.L288:
	cmpl	$5, 8(%rbx)
	movl	$1, %eax
	cmove	%eax, %r12d
	movq	%rbx, %rsi
	movq	72(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
.L286:
	cmpl	$5, 24(%rbp)
	jne	.L290
	movq	0(%rbp), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L290
	movq	104(%rsp), %rbx
	movq	16(%rsp), %rax
	movb	$0, (%rax)
	movb	$0, 1(%rax)
	testb	%r12b, %r12b
	jne	.L291
	movq	80(%rsp), %rax
	cmpq	name_void(%rip), %rax
	je	.L291
	movq	%rbp, %rsi
	leaq	.LC81(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L291:
	movq	%r13, %r8
	movq	72(%rsp), %rcx
	movq	88(%rsp), %rdx
	movq	80(%rsp), %rsi
	movq	96(%rsp), %rdi
	call	*create_method@GOTPCREL(%rip)
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L302
.L292:
	movl	$0, %edx
	movl	$0, %edi
	call	*create_class_member@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	48(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L293
.L339:
	movq	%rbp, %rsi
	leaq	.LC80(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L288
.L340:
	movq	%rbp, %rsi
	leaq	.LC66(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L288
.L332:
	movq	%rbp, %rsi
	leaq	.LC83(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L294
.L333:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L293
	jmp	.L295
	.size	parse_code, .-parse_code
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
