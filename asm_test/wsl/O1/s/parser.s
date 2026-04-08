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
	movq	(%r15), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
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
	movq	%rsi, %r13
	movq	%rdx, %r12
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
	movq	%r12, %r8
	movq	%r13, %rcx
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
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	%rbp, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%r12, %rdx
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
	movq	%rsi, %r13
	movq	%rdx, %rbp
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
	movq	%r13, %rdi
	call	*search_name@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L25
	movl	32(%rax), %eax
	cmpl	$6, %eax
	je	.L26
	testl	%eax, %eax
	jne	.L35
.L26:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
	cmpl	$1, 24(%rax)
	jne	.L36
.L27:
	movl	$3, %esi
	cmpb	$0, 10(%rbp)
	je	.L28
	cmpb	$1, 9(%rbp)
	sbbl	%esi, %esi
	andl	$2, %esi
	addl	$3, %esi
.L28:
	movq	(%r14), %rdi
	movq	%r13, %rcx
	movq	%r12, %rdx
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, %r14
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	movl	$0, %r15d
	cmpl	$5, 24(%rax)
	je	.L37
.L29:
	movq	%r15, %rdx
	movq	%r14, %rsi
	movq	%r12, %rdi
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
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%r14, %rsi
	leaq	.LC2(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L21
.L35:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%r14, %rsi
	leaq	.LC3(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L26
.L25:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%r14, %rsi
	leaq	.LC4(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L26
.L36:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%r14, %rsi
	leaq	.LC5(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L27
.L37:
	movq	(%rax), %rdi
	movq	ASSIGN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L29
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_expression
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L29
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	8(%rsp), %rsi
	leaq	.LC6(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L29
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
	movq	%rsi, 8(%rsp)
	movq	%rdx, %r13
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %r12
	movl	24(%rax), %eax
	cmpl	$2, %eax
	je	.L91
	cmpl	$3, %eax
	je	.L92
	cmpl	$4, %eax
	je	.L93
	cmpl	$6, %eax
	je	.L94
.L43:
	cmpl	$5, 24(%r12)
	je	.L95
.L51:
	movl	24(%r12), %eax
	cmpl	$1, %eax
	je	.L52
	cmpl	$6, %eax
	jne	.L53
	movq	(%r12), %rdi
	movq	SELF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L53
	cmpb	$0, 9(%r13)
	je	.L53
.L52:
	movq	%rbp, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L54
	cmpl	$6, %eax
	jne	.L55
	movq	(%rbx), %rdi
	movq	SELF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L55
.L54:
	movq	(%rbx), %rsi
	movq	8(%rsp), %rdi
	call	*search_name@GOTPCREL(%rip)
	movq	%rax, %r15
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
	jne	.L57
	movl	$0, %r14d
	movq	$0, 16(%rsp)
	jmp	.L80
.L91:
	movq	(%r12), %rsi
	movq	$0, (%rsp)
	movl	$0, %ebp
	movl	$0, %ebx
	movl	$0, %r12d
.L40:
	movq	(%rsp), %r8
	movq	%rbp, %rcx
	movq	%rbx, %rdx
	movl	%r12d, %edi
	call	*create_primary@GOTPCREL(%rip)
	movq	%rax, %rbx
.L38:
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L92:
	movq	(%r12), %rsi
	movq	$0, (%rsp)
	movl	$0, %ebp
	movl	$0, %ebx
	movl	$1, %r12d
	jmp	.L40
.L93:
	movq	(%r12), %rsi
	movq	$0, (%rsp)
	movl	$0, %ebp
	movl	$0, %ebx
	movl	$2, %r12d
	jmp	.L40
.L94:
	movq	(%r12), %rdi
	movq	TRUE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L44
	movq	(%r12), %rsi
	movq	$0, (%rsp)
	movl	$0, %ebp
	movl	$0, %ebx
	movl	$3, %r12d
	jmp	.L40
.L44:
	cmpl	$6, 24(%r12)
	jne	.L43
	movq	(%r12), %rdi
	movq	FALSE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L43
	movq	(%r12), %rsi
	movq	$0, (%rsp)
	movl	$0, %ebp
	movl	$0, %ebx
	movl	$4, %r12d
	jmp	.L40
.L95:
	movq	(%r12), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L96
	cmpl	$5, 24(%r12)
	jne	.L51
	movq	(%r12), %rdi
	movq	NOT_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L97
	cmpl	$5, 24(%r12)
	jne	.L51
	movq	(%r12), %rdi
	movq	SUB_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L51
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%r13, %rdx
	movq	8(%rsp), %rsi
	movq	%rbp, %rdi
	call	parse_primary
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L98
	movq	$0, (%rsp)
	movl	$0, %ebx
	movl	$0, %esi
	movl	$7, %r12d
	jmp	.L40
.L96:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	%r13, %rdx
	movq	8(%rsp), %rsi
	movq	%rbp, %rdi
	call	parse_expression
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L99
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	movl	24(%rax), %r12d
	cmpl	$5, %r12d
	jne	.L49
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L49
	movq	$0, (%rsp)
	movl	$0, %ebp
	movl	$0, %esi
	jmp	.L40
.L99:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%r12, %rsi
	leaq	.LC7(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L38
.L49:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC8(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %ebx
	jmp	.L38
.L97:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%r13, %rdx
	movq	8(%rsp), %rsi
	movq	%rbp, %rdi
	call	parse_primary
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L100
	movq	$0, (%rsp)
	movl	$0, %ebx
	movl	$0, %esi
	movl	$6, %r12d
	jmp	.L40
.L100:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC9(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	%rbp, %rbx
	jmp	.L38
.L98:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC10(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	%rbp, %rbx
	jmp	.L38
.L55:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC11(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L81
.L59:
	movq	(%rbx), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L101
	movq	(%rbx), %rdi
	movq	L_BRACKET_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L71
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%r13, %rdx
	movq	8(%rsp), %rsi
	movq	%rbp, %rdi
	call	parse_expression
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.L102
.L72:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	jne	.L73
	movq	(%rax), %rdi
	movq	R_BRACKET_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L73
	movl	$0, %r8d
	movq	24(%rsp), %rcx
	movl	$0, %edx
	movq	(%rsp), %rsi
	movl	$3, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, (%rsp)
.L70:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	jne	.L57
.L80:
	testq	%r15, %r15
	je	.L58
	movq	(%r15), %r14
	testq	%r14, %r14
	cmove	%r15, %r14
.L58:
	cmpq	$0, 16(%rsp)
	jne	.L59
	testq	%r14, %r14
	je	.L59
	movq	$0, 16(%rsp)
	cmpl	$0, 32(%r14)
	jne	.L59
	movq	24(%r14), %rax
	movq	16(%rax), %rax
	movq	%rax, 16(%rsp)
	jmp	.L59
.L101:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%r15, %r15
	je	.L103
	cmpl	$0, 32(%r15)
	je	.L104
.L63:
	movl	32(%r15), %eax
	subl	$1, %eax
	cmpl	$1, %eax
	ja	.L105
.L62:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 16(%rsp)
	jmp	.L64
.L103:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC12(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L62
.L104:
	movq	8(%r15), %rdi
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	24(%r15), %rax
	movq	16(%rax), %rdi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	%rax, %r15
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdx
	movq	(%rsp), %rsi
	movl	$2, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, (%rsp)
	testq	%r15, %r15
	jne	.L63
	jmp	.L62
.L105:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC13(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L62
.L108:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC14(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L65
.L109:
	movq	(%rax), %rdi
	movq	COMMA_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L106
	cmpl	$5, 24(%rbx)
	jne	.L66
	movq	(%rbx), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L66
.L64:
	cmpl	$5, 24(%rbx)
	je	.L107
.L69:
	movq	%r13, %rdx
	movq	8(%rsp), %rsi
	movq	%rbp, %rdi
	call	parse_expression
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L108
.L65:
	movq	%r14, %rsi
	movq	16(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	je	.L109
.L66:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC15(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L81:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%r12, %rsi
	leaq	.LC21(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %ebx
	jmp	.L38
.L106:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L64
.L107:
	movq	(%rbx), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L69
	movq	16(%rsp), %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	(%rsp), %rsi
	movl	$1, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, (%rsp)
	movq	(%r15), %r15
	cmpl	$0, 32(%r15)
	jne	.L86
	movq	24(%r15), %rax
	movq	16(%rax), %rax
	movq	%rax, 16(%rsp)
	movl	$0, %r14d
	jmp	.L70
.L102:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC16(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L72
.L73:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC17(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L81
.L71:
	movq	(%rbx), %rdi
	movq	DOT_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L57
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpq	$0, 16(%rsp)
	je	.L110
	cmpl	$1, 24(%rax)
	jne	.L111
	movq	(%rax), %rsi
	movq	16(%rsp), %rdi
	call	*search_name@GOTPCREL(%rip)
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L112
.L77:
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%r15, %rdx
	movq	(%rsp), %rsi
	movl	$2, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, (%rsp)
	movq	$0, 16(%rsp)
	movl	$0, %r14d
	jmp	.L70
.L110:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC18(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L81
.L111:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC19(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L81
.L112:
	testq	%r14, %r14
	je	.L78
	cmpl	$0, 32(%r14)
	jne	.L79
	movq	8(%r14), %r14
.L78:
	movq	(%rbx), %rsi
	movq	%r14, %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	16(%rsp), %rdi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L77
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC20(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L81
.L79:
	movq	(%r14), %r14
	testq	%r14, %r14
	je	.L78
	cmpl	$0, 32(%r14)
	jne	.L87
	movq	8(%r14), %r14
	jmp	.L78
.L87:
	movq	%rax, %r14
	jmp	.L78
.L86:
	movq	$0, 16(%rsp)
	movl	$0, %r14d
	jmp	.L70
.L57:
	cmpq	$0, (%rsp)
	je	.L81
	movl	$0, %ebp
	movl	$0, %ebx
	movl	$0, %esi
	movl	$8, %r12d
	jmp	.L40
.L53:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%r12, %rsi
	leaq	.LC22(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %ebx
	jmp	.L38
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
	je	.L197
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
.L183:
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rbp, %rbp
	je	.L198
.L190:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	je	.L199
.L191:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC52(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L113:
	movq	%rbp, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L197:
	movq	%rax, %rbp
	movq	(%rax), %rdi
	movq	IF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L200
	movq	0(%rbp), %rdi
	movq	FOR_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L201
	movq	0(%rbp), %rdi
	movq	WHILE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L202
	movq	0(%rbp), %rdi
	movq	VAR_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L182
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
	jmp	.L183
.L200:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L116
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L116
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
	je	.L203
.L119:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L120
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L120
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L122
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L122
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
	leaq	.LC27(%rip), %r15
	jmp	.L124
.L116:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC23(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %esi
.L118:
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$2, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L113
.L203:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC24(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L119
.L120:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC25(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %esi
	jmp	.L118
.L122:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC26(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %esi
	jmp	.L118
.L126:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L204
.L125:
	movq	%rbp, %rsi
	movq	8(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
.L124:
	cmpl	$5, 24(%r14)
	jne	.L126
	movq	(%r14), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L126
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 24(%rsp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 40(%rsp)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$6, 24(%rax)
	je	.L127
	jmp	.L128
.L204:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L125
.L129:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC28(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %esi
	jmp	.L118
.L207:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC29(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L131
.L132:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC30(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %esi
	jmp	.L118
.L134:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC31(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %esi
	jmp	.L118
.L138:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L205
.L137:
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
.L136:
	cmpl	$5, 24(%rbp)
	jne	.L138
	movq	0(%rbp), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L138
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
	jne	.L128
.L127:
	movq	0(%rbp), %rdi
	movq	ELIF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L206
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L129
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L129
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
	je	.L207
.L131:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L132
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L132
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L134
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L134
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, %r15
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L136
.L205:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC32(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L137
.L206:
	cmpl	$6, 24(%rbp)
	jne	.L128
	movq	0(%rbp), %rdi
	movq	ELSE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L208
.L128:
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	40(%rsp), %rcx
	movq	24(%rsp), %rdx
	movq	8(%rsp), %rsi
	movq	32(%rsp), %rdi
	call	*create_if@GOTPCREL(%rip)
	movq	%rax, %rsi
	jmp	.L118
.L208:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L140
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L140
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	leaq	.LC34(%rip), %r15
	jmp	.L142
.L140:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC33(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %esi
	jmp	.L118
.L144:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L209
.L143:
	movq	%r14, %rsi
	movq	40(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
.L142:
	cmpl	$5, 24(%rbp)
	jne	.L144
	movq	0(%rbp), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L144
	jmp	.L128
.L209:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L143
.L201:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L147
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L147
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	je	.L210
.L150:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_variable
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L211
.L152:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
.L151:
	cmpl	$5, 24(%rbp)
	jne	.L153
	movq	0(%rbp), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L153
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	je	.L212
.L155:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_expression
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	je	.L213
.L157:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
.L156:
	cmpl	$5, 24(%rbp)
	jne	.L158
	movq	0(%rbp), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L158
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	je	.L214
.L160:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_expression
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.L215
.L162:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
.L161:
	cmpl	$5, 24(%rbp)
	jne	.L163
	movq	0(%rbp), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L163
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L165
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L165
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, %r15
	movb	$1, 11(%r12)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
	jmp	.L167
.L147:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC35(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %ecx
.L149:
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L113
.L210:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	movq	$0, 8(%rsp)
	testb	%al, %al
	jne	.L151
	jmp	.L150
.L211:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC36(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L152
.L153:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC37(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %ecx
	jmp	.L149
.L212:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	movq	$0, 16(%rsp)
	testb	%al, %al
	jne	.L156
	jmp	.L155
.L213:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC38(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L157
.L158:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC39(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %ecx
	jmp	.L149
.L214:
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	movq	$0, 24(%rsp)
	testb	%al, %al
	jne	.L161
	jmp	.L160
.L215:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC40(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L162
.L163:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC41(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %ecx
	jmp	.L149
.L165:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC42(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %ecx
	jmp	.L149
.L169:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L216
.L168:
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
.L167:
	cmpl	$5, 24(%r14)
	jne	.L169
	movq	(%r14), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L169
	movb	$0, 11(%r12)
	movq	%r15, %rcx
	movq	24(%rsp), %rdx
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	call	*create_for@GOTPCREL(%rip)
	movq	%rax, %rcx
	jmp	.L149
.L216:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%r14, %rsi
	leaq	.LC43(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L168
.L202:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L171
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L171
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
	je	.L217
.L174:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L175
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L175
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L177
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L177
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, %r15
	movb	$1, 11(%r12)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
	jmp	.L179
.L171:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC44(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %edx
.L173:
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %esi
	movl	$3, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L113
.L217:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC45(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L174
.L175:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC46(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %edx
	jmp	.L173
.L177:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC47(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %edx
	jmp	.L173
.L181:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L218
.L180:
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
.L179:
	cmpl	$5, 24(%r14)
	jne	.L181
	movq	(%r14), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L181
	movb	$0, 11(%r12)
	movq	%r15, %rsi
	movq	8(%rsp), %rdi
	call	*create_while@GOTPCREL(%rip)
	movq	%rax, %rdx
	jmp	.L173
.L218:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%r14, %rsi
	leaq	.LC48(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L180
.L182:
	movq	0(%rbp), %rdi
	movq	RETURN_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L184
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	je	.L219
.L185:
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
	jmp	.L183
.L219:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L185
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$5, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L113
.L184:
	movq	0(%rbp), %rdi
	movq	BREAK_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L186
	cmpb	$0, 11(%r12)
	je	.L220
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$6, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L183
.L220:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC49(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %ebp
	jmp	.L113
.L186:
	movq	0(%rbp), %rdi
	movq	CONTINUE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L188
	cmpb	$0, 11(%r12)
	je	.L221
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$7, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L183
.L221:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC50(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %ebp
	jmp	.L113
.L188:
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
	jmp	.L183
.L198:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%r13, %rsi
	leaq	.LC51(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L190
.L199:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L113
	jmp	.L191
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
	.section	.rodata.str1.1
.LC56:
	.string	"Failed to import module"
	.section	.rodata.str1.8
	.align 8
.LC57:
	.string	"Failed to parse import statement"
	.align 8
.LC58:
	.string	"Expected function return type after 'func'"
	.section	.rodata.str1.1
.LC59:
	.string	"Unknown function return type"
	.section	.rodata.str1.8
	.align 8
.LC60:
	.string	"Expected function name after return type"
	.align 8
.LC61:
	.string	"Expected '(' after function name"
	.align 8
.LC62:
	.string	"Failed to parse function parameter"
	.align 8
.LC63:
	.string	"Function parameters cannot have default values"
	.align 8
.LC64:
	.string	"Expected ',' or ')' after function parameter"
	.align 8
.LC65:
	.string	"Expected '{' to start function body"
	.align 8
.LC66:
	.string	"Failed to parse function body statement"
	.align 8
.LC67:
	.string	"Unreachable code after return statement"
	.align 8
.LC68:
	.string	"Function missing return statement"
	.align 8
.LC69:
	.string	"Failed to parse function declaration"
	.align 8
.LC70:
	.string	"Expected class name after 'class'"
	.align 8
.LC71:
	.string	"Expected '{' to start class body"
	.align 8
.LC72:
	.string	"Expected method return type after 'method'"
	.align 8
.LC73:
	.string	"Unknown return type for method"
	.align 8
.LC74:
	.string	"Expected method name after return type"
	.align 8
.LC75:
	.string	"Expected '(' after method name"
	.align 8
.LC76:
	.string	"Expected 'self' as first parameter of method"
	.align 8
.LC77:
	.string	"Expected ',' or ')' after method parameter"
	.align 8
.LC78:
	.string	"Failed to parse method parameter"
	.align 8
.LC79:
	.string	"Method parameters cannot have default values"
	.align 8
.LC80:
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
	.string	"Unsupported type for class variable"
	.align 8
.LC86:
	.string	"Expected ';' after class variable declaration"
	.align 8
.LC87:
	.string	"Unexpected token in class member"
	.align 8
.LC88:
	.string	"Constructor name conflicts with existing member"
	.section	.rodata.str1.1
.LC89:
	.string	"0"
	.section	.rodata.str1.8
	.align 8
.LC90:
	.string	"Failed to parse class declaration"
	.align 8
.LC91:
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
	subq	$136, %rsp
	movq	%rdi, %r14
	movq	%rsi, %rbx
	movq	%rdx, %r13
	cmpq	$0, builtin_scope(%rip)
	je	.L341
.L223:
	testq	%rbx, %rbx
	cmove	builtin_scope(%rip), %rbx
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 32(%rsp)
	movq	%rbx, %rdi
	call	*create_symbol_table@GOTPCREL(%rip)
	movq	%rax, 24(%rsp)
	movl	$1, %esi
	movq	%r14, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L226
	movq	%rax, 8(%rsp)
	movq	%r14, %r15
	jmp	.L225
.L341:
	movl	$0, %edi
	call	*create_symbol_table@GOTPCREL(%rip)
	movq	%rax, %rcx
	movq	%rax, builtin_scope(%rip)
	movl	$0, %edx
	movl	$6, %esi
	movq	VOID_KEYWORD(%rip), %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, name_void(%rip)
	movq	builtin_scope(%rip), %rcx
	movl	$0, %edx
	movl	$6, %esi
	movq	INT_KEYWORD(%rip), %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, name_int(%rip)
	movq	builtin_scope(%rip), %rcx
	movl	$0, %edx
	movl	$6, %esi
	movq	FLOAT_KEYWORD(%rip), %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, name_float(%rip)
	movq	builtin_scope(%rip), %rcx
	movl	$0, %edx
	movl	$6, %esi
	movq	STRING_KEYWORD(%rip), %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, name_string(%rip)
	movq	builtin_scope(%rip), %rcx
	movl	$0, %edx
	movl	$6, %esi
	movq	BOOL_KEYWORD(%rip), %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, name_bool(%rip)
	jmp	.L223
.L374:
	movq	8(%rsp), %rax
	movq	(%rax), %rdi
	movq	IMPORT_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %ebp
	testb	%al, %al
	jne	.L342
	movq	8(%rsp), %rax
	cmpl	$6, 24(%rax)
	jne	.L264
	movq	(%rax), %rdi
	movq	FUNC_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	movb	%al, 56(%rsp)
	testb	%al, %al
	jne	.L343
	movq	8(%rsp), %rax
	cmpl	$6, 24(%rax)
	jne	.L264
	movq	(%rax), %rdi
	movq	CLASS_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L264
	movq	24(%rsp), %rdi
	call	*create_symbol_table@GOTPCREL(%rip)
	movq	%rax, 16(%rsp)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpl	$1, 24(%rax)
	jne	.L344
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rcx
	movq	%rax, 64(%rsp)
	movq	16(%rsp), %rax
	movq	%rax, 16(%rcx)
	movq	(%rbx), %rdi
	movl	$0, %edx
	movl	$0, %esi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, 40(%rsp)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	jne	.L267
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L267
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 48(%rsp)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	$0, 80(%rsp)
	jmp	.L269
.L342:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpl	$1, 24(%rax)
	jne	.L345
	movq	(%rax), %r12
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	movl	$0, %ebp
	cmpl	$6, 24(%rax)
	je	.L346
.L231:
	cmpl	$5, 24(%rbx)
	jne	.L233
	movq	(%rbx), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L233
	movq	0(%r13), %rcx
	movq	24(%rsp), %rdx
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	*parse_import_file@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L347
.L235:
	movq	%rbp, %rsi
	call	*create_import@GOTPCREL(%rip)
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L324
.L236:
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %edi
	call	*create_code_member@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	32(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L237
.L345:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC53(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L324
.L346:
	movq	(%rax), %rdi
	movq	FROM_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L231
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpl	$4, 24(%rax)
	jne	.L348
	movq	(%rax), %rbp
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L231
.L348:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC54(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L324
.L233:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC55(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L324:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	8(%rsp), %rsi
	leaq	.LC57(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %esi
	jmp	.L236
.L347:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC56(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	24(%rsp), %rcx
	movq	name_void(%rip), %rdx
	movl	$3, %esi
	movq	%r12, %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, %rdi
	jmp	.L235
.L343:
	movq	24(%rsp), %rdi
	call	*create_symbol_table@GOTPCREL(%rip)
	movq	%rax, %r12
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L239
	cmpl	$6, %eax
	jne	.L240
	movq	(%rbx), %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	testb	%al, %al
	je	.L240
.L239:
	movq	(%rbx), %rsi
	movq	24(%rsp), %rdi
	call	*search_name@GOTPCREL(%rip)
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	je	.L349
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpl	$1, 24(%rax)
	jne	.L350
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rcx
	movq	%rax, 48(%rsp)
	movq	%r12, 32(%rax)
	movq	(%rbx), %rdi
	movq	16(%rsp), %rdx
	movl	$1, %esi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, 56(%rsp)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	jne	.L244
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L244
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 40(%rsp)
	leaq	.LC62(%rip), %r14
	jmp	.L246
.L240:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC58(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L325:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	8(%rsp), %rsi
	leaq	.LC69(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %edx
	jmp	.L263
.L349:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC59(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L325
.L350:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC60(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L325
.L244:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC61(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L325
.L353:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	movq	%r14, %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L248
.L249:
	movq	%rax, %rsi
	movq	40(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L248
.L354:
	movq	(%rax), %rdi
	movq	COMMA_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L351
	cmpl	$5, 24(%rbx)
	jne	.L250
	movq	(%rbx), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L250
.L246:
	cmpl	$5, 24(%rbx)
	je	.L352
.L253:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	parse_variable
	testq	%rax, %rax
	je	.L353
	cmpq	$0, 16(%rax)
	je	.L249
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC63(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L248:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	je	.L354
.L250:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC64(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L325
.L351:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L246
.L352:
	movq	(%rbx), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L253
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	jne	.L254
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L254
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, %rbx
	movb	$1, 8(%r13)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%r12, 64(%rsp)
	movq	%rax, %r14
	jmp	.L256
.L254:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC65(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L325
.L260:
	movq	%r13, %rdx
	movq	64(%rsp), %rsi
	movq	%r15, %rdi
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L355
	testb	%bpl, %bpl
	jne	.L356
.L259:
	cmpl	$5, 8(%r12)
	movl	$1, %eax
	cmove	%eax, %ebp
.L258:
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
.L256:
	cmpl	$5, 24(%r14)
	jne	.L260
	movq	(%r14), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L260
	movq	64(%rsp), %r12
	movb	$0, 8(%r13)
	testb	%bpl, %bpl
	jne	.L261
	movq	16(%rsp), %rbp
	cmpq	name_void(%rip), %rbp
	je	.L262
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%r14, %rsi
	leaq	.LC68(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	cmpq	name_void(%rip), %rbp
	je	.L262
.L261:
	movq	%r12, %r9
	movq	%rbx, %r8
	movq	40(%rsp), %rcx
	movq	16(%rsp), %rdx
	movq	56(%rsp), %rsi
	movq	48(%rsp), %rdi
	call	*create_function_use_ptr@GOTPCREL(%rip)
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L325
.L263:
	movl	$0, %ecx
	movl	$0, %esi
	movl	$1, %edi
	call	*create_code_member@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	32(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L237
.L355:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%r14, %rsi
	leaq	.LC66(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L258
.L356:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%r14, %rsi
	leaq	.LC67(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L259
.L262:
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$5, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L261
.L344:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC70(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L326
.L267:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC71(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L326:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	8(%rsp), %rsi
	leaq	.LC90(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %ecx
	jmp	.L322
.L310:
	cmpl	$6, 24(%rbx)
	je	.L357
.L270:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC87(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L301:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
.L269:
	cmpl	$5, 24(%rbx)
	jne	.L310
	movq	(%rbx), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L310
	movq	40(%rsp), %rax
	movq	8(%rax), %rdi
	movq	DEFAULT_INIT_NAME(%rip), %rsi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	%rax, %rsi
	movq	16(%rsp), %rdi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	%rax, 56(%rsp)
	testq	%rax, %rax
	je	.L358
.L311:
	movq	56(%rsp), %rax
	cmpl	$2, 32(%rax)
	jne	.L359
.L312:
	movq	40(%rsp), %rbp
	movq	8(%rbp), %rdi
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rbx
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	16(%rsp), %rdi
	call	*create_symbol_table@GOTPCREL(%rip)
	movq	%rax, 32(%r12)
	movq	%r12, %rcx
	movq	%rbp, %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, 96(%rsp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, %r14
	movq	32(%r12), %rcx
	movq	%rbp, %rdx
	movl	$3, %esi
	movq	SELF_KEYWORD(%rip), %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, 88(%rsp)
	movq	56(%rsp), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
.L314:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L360
	movq	8(%rbx), %rax
	movq	8(%rax), %rdi
	movq	SELF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L314
	movq	8(%rbx), %rsi
	movq	(%rbx), %rdi
	movl	$0, %edx
	call	*create_variable@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%r14, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L314
.L357:
	movq	(%rbx), %rdi
	movq	METHOD_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L361
	cmpl	$6, 24(%rbx)
	jne	.L270
	movq	(%rbx), %rdi
	movq	VAR_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L270
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	movb	$1, 10(%r13)
	movq	%r13, %rdx
	movq	16(%rsp), %rsi
	movq	%r15, %rdi
	call	parse_variable
	movq	%rax, %rbx
	movb	$0, 10(%r13)
	testq	%rax, %rax
	je	.L362
.L302:
	movq	%rbx, %rdx
	movl	$0, %esi
	movl	$1, %edi
	call	*create_class_member@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%rax, %rsi
	movq	48(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	cmpl	$1, 8(%rbx)
	je	.L363
.L303:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	je	.L364
.L309:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC86(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L301
.L361:
	movq	16(%rsp), %rdi
	call	*create_symbol_table@GOTPCREL(%rip)
	movq	%rax, %r14
	movq	%rax, %rcx
	movq	40(%rsp), %rdx
	movl	$3, %esi
	movq	SELF_KEYWORD(%rip), %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, %r12
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L272
	cmpl	$6, %eax
	jne	.L273
	movq	0(%rbp), %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	testb	%al, %al
	je	.L273
.L272:
	movq	0(%rbp), %rsi
	movq	16(%rsp), %rdi
	call	*search_name@GOTPCREL(%rip)
	movq	%rax, 88(%rsp)
	testq	%rax, %rax
	je	.L365
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$1, 24(%rax)
	jne	.L366
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, 104(%rsp)
	movq	%r14, 32(%rax)
	movq	0(%rbp), %rsi
	movq	40(%rsp), %rdx
	movq	8(%rdx), %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rdi
	movq	104(%rsp), %rcx
	movq	88(%rsp), %rdx
	movl	$2, %esi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, 112(%rsp)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L277
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L277
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$6, 24(%rax)
	je	.L367
.L279:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC76(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L280:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 96(%rsp)
	movl	$0, %edx
	movq	%r12, %rsi
	movq	40(%rsp), %rdi
	call	*create_variable@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	96(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	leaq	.LC79(%rip), %r12
	jmp	.L281
.L273:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC72(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L327:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC83(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %esi
	jmp	.L300
.L365:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC73(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L327
.L366:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC74(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L327
.L277:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC75(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L327
.L367:
	movq	(%rax), %rdi
	movq	SELF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L280
	jmp	.L279
.L283:
	cmpl	$5, 24(%rbp)
	jne	.L286
	movq	0(%rbp), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L286
.L287:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L291
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L291
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 72(%rsp)
	movb	$1, 8(%r13)
	movb	$1, 9(%r13)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
	movzbl	56(%rsp), %ebp
	movq	%rbx, 120(%rsp)
	jmp	.L293
.L368:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC78(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L288
.L289:
	movq	%rax, %rsi
	movq	96(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L288
.L369:
	movq	0(%rbp), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L287
	cmpl	$5, 24(%rbp)
	jne	.L286
	movq	0(%rbp), %rdi
	movq	COMMA_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L283
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%r13, %rdx
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	parse_variable
	testq	%rax, %rax
	je	.L368
	cmpq	$0, 16(%rax)
	je	.L289
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L288:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
.L281:
	cmpl	$5, 24(%rbp)
	je	.L369
.L286:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC77(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L327
.L291:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC80(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L327
.L297:
	movq	%r13, %rdx
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	parse_statement
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L370
	testb	%bpl, %bpl
	jne	.L371
.L296:
	cmpl	$5, 8(%rbx)
	movl	$1, %eax
	cmove	%eax, %ebp
.L295:
	movq	%rbx, %rsi
	movq	72(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
.L293:
	cmpl	$5, 24(%r12)
	jne	.L297
	movq	(%r12), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L297
	movq	120(%rsp), %rbx
	movb	$0, 8(%r13)
	movb	$0, 9(%r13)
	testb	%bpl, %bpl
	jne	.L298
	movq	88(%rsp), %rbp
	cmpq	name_void(%rip), %rbp
	je	.L299
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%r12, %rsi
	leaq	.LC82(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	cmpq	name_void(%rip), %rbp
	je	.L299
.L298:
	movq	%r14, %r9
	movq	72(%rsp), %r8
	movq	96(%rsp), %rcx
	movq	88(%rsp), %rdx
	movq	112(%rsp), %rsi
	movq	104(%rsp), %rdi
	call	*create_method_use_ptr@GOTPCREL(%rip)
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L327
.L300:
	movl	$0, %edx
	movl	$0, %edi
	call	*create_class_member@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	48(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L301
.L370:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%r12, %rsi
	leaq	.LC81(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L295
.L371:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%r12, %rsi
	leaq	.LC67(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L296
.L299:
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$5, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	72(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L298
.L362:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC84(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L302
.L363:
	movq	(%rbx), %rax
	movq	(%rax), %rax
	cmpq	name_int(%rip), %rax
	je	.L304
	cmpq	name_float(%rip), %rax
	je	.L304
	cmpq	name_string(%rip), %rax
	je	.L304
	cmpq	name_bool(%rip), %rax
	je	.L306
	cmpq	name_void(%rip), %rax
	je	.L306
	cmpl	$0, 32(%rax)
	jne	.L308
	addq	$8, 80(%rsp)
	jmp	.L303
.L304:
	addq	$8, 80(%rsp)
	jmp	.L303
.L306:
	addq	$1, 80(%rsp)
	jmp	.L303
.L308:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbp, %rsi
	leaq	.LC85(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L303
.L364:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L301
	jmp	.L309
.L358:
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	16(%rsp), %rdi
	call	*create_symbol_table@GOTPCREL(%rip)
	movq	%rax, 32(%rbp)
	movq	%rbp, %rcx
	movq	40(%rsp), %rdx
	movl	$2, %esi
	movq	%r12, %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, 56(%rsp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, %r14
	movq	32(%rbp), %rcx
	movq	40(%rsp), %r12
	movq	%r12, %rdx
	movl	$3, %esi
	movq	SELF_KEYWORD(%rip), %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movl	$0, %edx
	movq	%rax, 72(%rsp)
	movq	%rax, %rsi
	movq	%r12, 40(%rsp)
	movq	%r12, %rdi
	call	*create_variable@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%r14, %rdi
	call	*list_append@GOTPCREL(%rip)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, %r12
	movl	$0, %r8d
	movl	$0, %ecx
	movq	72(%rsp), %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$8, %edi
	call	*create_primary@GOTPCREL(%rip)
	movq	%rax, %rdx
	movl	$0, %ecx
	movl	$0, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rax, %r8
	movl	$0, %r9d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$5, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%r12, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	32(%rbp), %r9
	movq	%r12, %r8
	movq	%r14, %rcx
	movq	40(%rsp), %rdx
	movq	56(%rsp), %rsi
	movq	%rbp, %rdi
	call	*create_method_use_ptr@GOTPCREL(%rip)
	movl	$0, %edx
	movq	%rbp, %rsi
	movl	$0, %edi
	call	*create_class_member@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	48(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L311
.L359:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	leaq	.LC88(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L312
.L360:
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%rax, 72(%rsp)
	movq	48(%rsp), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
	movl	$0, %r8d
	movl	$0, %ecx
	movq	88(%rsp), %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$8, %edi
	call	*create_primary@GOTPCREL(%rip)
	movq	%rax, %rdx
	movl	$0, %ecx
	movl	$0, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rax, %r8
	movl	$0, %r9d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	*list_append@GOTPCREL(%rip)
.L317:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L372
	cmpl	$1, 8(%rbx)
	jne	.L317
	movq	(%rbx), %rax
	movq	8(%rax), %rax
	movq	%rax, 104(%rsp)
	movl	$0, %r8d
	movl	$0, %ecx
	movq	88(%rsp), %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %rsi
	movl	$0, %r8d
	movl	$0, %ecx
	movq	104(%rsp), %rdx
	movl	$2, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$8, %edi
	call	*create_primary@GOTPCREL(%rip)
	movq	%rax, %rdx
	movl	$0, %ecx
	movl	$0, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rax, 104(%rsp)
	movq	(%rbx), %rax
	movq	16(%rax), %rcx
	testq	%rcx, %rcx
	je	.L373
.L318:
	movl	$0, %edx
	movq	104(%rsp), %rsi
	movl	$13, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rax, %r8
	movl	$0, %r9d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	72(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L317
.L373:
	movl	$2, %esi
	leaq	.LC89(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rsi
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %edi
	call	*create_primary@GOTPCREL(%rip)
	movq	%rax, %rdx
	movl	$0, %ecx
	movl	$0, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rax, %rcx
	jmp	.L318
.L372:
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, %rbx
	movl	$0, %r8d
	movl	$0, %ecx
	movq	88(%rsp), %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$8, %edi
	call	*create_primary@GOTPCREL(%rip)
	movq	%rax, %rdx
	movl	$0, %ecx
	movl	$0, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r14, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L320
.L321:
	movq	8(%rax), %rdx
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %esi
	movl	$0, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$8, %edi
	call	*create_primary@GOTPCREL(%rip)
	movq	%rax, %rdx
	movl	$0, %ecx
	movl	$0, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	*list_append@GOTPCREL(%rip)
.L320:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L321
	movl	$0, %r8d
	movl	$0, %ecx
	movq	56(%rsp), %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$1, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$8, %edi
	call	*create_primary@GOTPCREL(%rip)
	movq	%rax, %rdx
	movl	$0, %ecx
	movl	$0, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rax, %r8
	movl	$0, %r9d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$5, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	72(%rsp), %rbx
	movq	%rbx, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	32(%r12), %r9
	movq	%rbx, %r8
	movq	%r14, %rcx
	movq	40(%rsp), %r14
	movq	%r14, %rdx
	movq	96(%rsp), %rsi
	movq	%r12, %rdi
	call	*create_method_use_ptr@GOTPCREL(%rip)
	movl	$0, %edx
	movq	%r12, %rsi
	movl	$0, %edi
	call	*create_class_member@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	48(%rsp), %rbx
	movq	%rbx, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	80(%rsp), %r8
	movq	16(%rsp), %rcx
	movq	%rbx, %rdx
	movq	%r14, %rsi
	movq	64(%rsp), %rdi
	call	*create_class_use_ptr@GOTPCREL(%rip)
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L326
.L322:
	movl	$0, %edx
	movl	$0, %esi
	movl	$2, %edi
	call	*create_code_member@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	32(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
.L237:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L226
.L225:
	movq	8(%rsp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	je	.L226
	cmpl	$6, %eax
	je	.L374
.L264:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	8(%rsp), %rsi
	leaq	.LC91(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L237
.L226:
	movq	24(%rsp), %rsi
	movq	32(%rsp), %rdi
	call	*create_code@GOTPCREL(%rip)
	addq	$136, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	parse_code, .-parse_code
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
