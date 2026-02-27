	.file	"parser.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Failed to parse expression primary"
	.text
	.p2align 4
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
	.p2align 4,,10
	.p2align 3
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
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Expected variable type"
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"Expected a type for variable declaration"
	.section	.rodata.str1.1
.LC3:
	.string	"Unknown variable type"
.LC4:
	.string	"Expected variable name"
	.section	.rodata.str1.8
	.align 8
.LC5:
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
	subq	$24, %rsp
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L9
	cmpl	$6, %eax
	jne	.L12
	movq	(%rbx), %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	testb	%al, %al
	je	.L12
.L9:
	movq	(%rbx), %rsi
	movq	%r13, %rdi
	call	*search@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L13
	testl	$-5, 24(%rax)
	jne	.L34
.L14:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L35
.L15:
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
	je	.L16
.L18:
	xorl	%edx, %edx
.L17:
	addq	$24, %rsp
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
.L35:
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L12:
	movq	%rbx, %rsi
	leaq	.LC1(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	addq	$24, %rsp
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
.L34:
	movq	%rbx, %rsi
	leaq	.LC2(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L16:
	movq	(%rax), %rdi
	movq	ASSIGN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L18
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
	call	parse_expression
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L17
	movq	%rax, 8(%rsp)
	movq	%r15, %rsi
	leaq	.LC5(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %rdx
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L13:
	movq	%rbx, %rsi
	leaq	.LC3(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L14
	.size	parse_variable, .-parse_variable
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"Failed to parse parenthesized expression"
	.section	.rodata.str1.1
.LC7:
	.string	"Expected ')' after expression"
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"Failed to parse operand of unary '!'"
	.align 8
.LC9:
	.string	"Failed to parse operand of unary '-'"
	.align 8
.LC10:
	.string	"Expected variable name in variable access"
	.align 8
.LC11:
	.string	"Cannot call undefined variable"
	.align 8
.LC12:
	.string	"Cannot call non-function variable"
	.align 8
.LC13:
	.string	"Failed to parse function call argument"
	.align 8
.LC14:
	.string	"Expected ',' or ')' after function call argument"
	.align 8
.LC15:
	.string	"Failed to parse sequence index"
	.align 8
.LC16:
	.string	"Expected ']' after sequence index"
	.align 8
.LC17:
	.string	"Cannot access attribute without a valid scope"
	.align 8
.LC18:
	.string	"Expected attribute name after '.'"
	.section	.rodata.str1.1
.LC19:
	.string	"Unknown attribute name"
	.section	.rodata.str1.8
	.align 8
.LC20:
	.string	"Failed to parse variable access"
	.align 8
.LC21:
	.string	"Unexpected token in primary expression"
	.text
	.p2align 4
	.type	parse_primary, @function
parse_primary:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	movq	%rsi, %r13
	pushq	%r12
	movq	%rdx, %r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	subq	$40, %rsp
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	movl	24(%rax), %eax
	cmpl	$2, %eax
	je	.L144
	cmpl	$3, %eax
	je	.L145
	cmpl	$4, %eax
	je	.L146
	cmpl	$6, %eax
	je	.L147
.L41:
	cmpl	$5, %eax
	je	.L45
	cmpl	$1, %eax
	je	.L47
.L48:
	movq	%rbp, %rsi
	leaq	.LC21(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L53:
	addq	$40, %rsp
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
.L145:
	movq	0(%rbp), %rsi
	xorl	%r14d, %r14d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$1, %ebx
.L38:
	addq	$40, %rsp
	movq	%r14, %r8
	movl	%ebx, %edi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*create_primary@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L144:
	movq	0(%rbp), %rsi
	xorl	%r14d, %r14d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%ebx, %ebx
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L146:
	movq	0(%rbp), %rsi
	xorl	%r14d, %r14d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$2, %ebx
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L147:
	movq	0(%rbp), %rdi
	movq	TRUE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L148
	movl	24(%rbp), %eax
	cmpl	$6, %eax
	jne	.L41
	movq	0(%rbp), %rdi
	movq	FALSE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L44
	movl	24(%rbp), %eax
	cmpl	$5, %eax
	jne	.L56
	.p2align 4,,10
	.p2align 3
.L45:
	movq	0(%rbp), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L149
	movl	24(%rbp), %eax
	cmpl	$5, %eax
	jne	.L56
	movq	0(%rbp), %rdi
	movq	NOT_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L150
	movl	24(%rbp), %eax
	cmpl	$5, %eax
	jne	.L56
	movq	0(%rbp), %rdi
	movq	SUB_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L57
	movl	24(%rbp), %eax
.L56:
	cmpl	$1, %eax
	je	.L47
	cmpl	$6, %eax
	jne	.L48
	movq	0(%rbp), %rdi
	movq	SELF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L48
	cmpb	$0, 1(%r12)
	je	.L48
.L47:
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %r14
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L60
	cmpl	$6, %eax
	jne	.L63
	movq	(%r14), %rdi
	movq	SELF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L63
.L60:
	movq	(%r14), %rsi
	movq	%r13, %rdi
	call	*search@GOTPCREL(%rip)
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	xorl	%edi, %edi
	movq	%rax, %rdx
	movq	%rax, 8(%rsp)
	call	*create_variable_access@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%rax, %r14
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	jne	.L64
	movq	$0, 16(%rsp)
	movq	$0, (%rsp)
.L87:
	movq	8(%rsp), %rax
	testq	%rax, %rax
	je	.L65
	movl	24(%rax), %eax
	leal	-1(%rax), %ecx
	cmpl	$2, %ecx
	jbe	.L93
	cmpl	$5, %eax
	jne	.L66
.L93:
	movq	8(%rsp), %rax
	movq	16(%rax), %rax
	movq	%rax, 16(%rsp)
.L65:
	cmpq	$0, (%rsp)
	jne	.L68
	movq	16(%rsp), %rax
	testq	%rax, %rax
	je	.L68
	cmpl	$4, 24(%rax)
	movq	$0, (%rsp)
	jne	.L68
	movq	16(%rax), %rax
	movq	%rax, (%rsp)
.L68:
	movq	(%r15), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L151
	movq	(%r15), %rdi
	movq	L_BRACKET_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L80
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	%rax, 24(%rsp)
	call	parse_expression
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L152
.L81:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rdx
	jne	.L83
	movq	(%rax), %rdi
	movq	R_BRACKET_SYMBOL(%rip), %rsi
	movq	%rax, 24(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	24(%rsp), %rdx
	testb	%al, %al
	je	.L83
	movq	%r14, %rsi
	xorl	%r8d, %r8d
	movq	%r15, %rcx
	xorl	%edx, %edx
	movl	$3, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %r14
.L79:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	je	.L87
.L64:
	testq	%r14, %r14
	je	.L62
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$8, %ebx
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L80:
	movq	(%r15), %rdi
	movq	DOT_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L64
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpq	$0, (%rsp)
	je	.L153
	cmpl	$1, 24(%rax)
	jne	.L154
	movq	(%rax), %rsi
	movq	(%rsp), %rdi
	movq	%rax, 16(%rsp)
	call	*search@GOTPCREL(%rip)
	movq	16(%rsp), %rdx
	testq	%rax, %rax
	movq	%rax, 8(%rsp)
	je	.L155
	movq	%r14, %rsi
	movq	8(%rsp), %rdx
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movl	$2, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	$0, (%rsp)
	movq	$0, 16(%rsp)
	movq	%rax, %r14
	jmp	.L79
	.p2align 4,,10
	.p2align 3
.L151:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpq	$0, 8(%rsp)
	movq	%rax, %r15
	je	.L156
.L70:
	movq	8(%rsp), %rax
	movl	24(%rax), %eax
	leal	-2(%rax), %edx
	movl	%eax, (%rsp)
	cmpl	$1, %edx
	ja	.L157
.L71:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r15
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, (%rsp)
	.p2align 4,,10
	.p2align 3
.L72:
	cmpl	$5, 24(%r15)
	je	.L158
.L78:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_expression
	testq	%rax, %rax
	je	.L159
.L73:
	movq	%rax, %rsi
	movq	(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	je	.L74
.L77:
	movq	%r15, %rsi
	leaq	.LC14(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L62:
	movq	%rbp, %rsi
	leaq	.LC20(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L158:
	movq	(%r15), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L78
	movq	%r14, %rsi
	movq	(%rsp), %r8
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$1, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	$0, (%rsp)
	movq	$0, 16(%rsp)
	movq	%rax, %r14
	movq	8(%rsp), %rax
	movq	16(%rax), %rax
	movq	%rax, 8(%rsp)
	jmp	.L79
	.p2align 4,,10
	.p2align 3
.L74:
	movq	(%rax), %rdi
	movq	COMMA_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L160
	cmpl	$5, 24(%r15)
	jne	.L77
	movq	(%r15), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L72
	jmp	.L77
	.p2align 4,,10
	.p2align 3
.L159:
	movq	%rax, 16(%rsp)
	movq	%r15, %rsi
	leaq	.LC13(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %rax
	jmp	.L73
	.p2align 4,,10
	.p2align 3
.L160:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r15
	jmp	.L72
	.p2align 4,,10
	.p2align 3
.L148:
	movq	0(%rbp), %rsi
	xorl	%r14d, %r14d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$3, %ebx
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L157:
	movq	%r15, %rsi
	leaq	.LC12(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L71
	.p2align 4,,10
	.p2align 3
.L44:
	movq	0(%rbp), %rsi
	xorl	%r14d, %r14d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$4, %ebx
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L66:
	andl	$-5, %eax
	movq	16(%rsp), %rax
	cmove	8(%rsp), %rax
	movq	%rax, 16(%rsp)
	jmp	.L65
	.p2align 4,,10
	.p2align 3
.L63:
	movq	%r14, %rsi
	leaq	.LC10(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L62
	.p2align 4,,10
	.p2align 3
.L152:
	movq	24(%rsp), %rsi
	leaq	.LC15(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L81
	.p2align 4,,10
	.p2align 3
.L149:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	parse_expression
	testq	%rax, %rax
	je	.L161
	movq	%rbx, %rdi
	movq	%rax, (%rsp)
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	(%rsp), %rdx
	movl	24(%rax), %ebx
	movq	%rax, %rbp
	cmpl	$5, %ebx
	jne	.L54
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	%rdx, (%rsp)
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L54
	movq	(%rsp), %rdx
	xorl	%r14d, %r14d
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L150:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	parse_primary
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L162
	xorl	%r14d, %r14d
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$6, %ebx
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L57:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	parse_primary
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L163
	xorl	%r14d, %r14d
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$7, %ebx
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L156:
	movq	%rax, %rsi
	leaq	.LC11(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L70
.L54:
	movq	%rbp, %rsi
	leaq	.LC7(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L53
.L83:
	movq	%rdx, %rsi
	leaq	.LC16(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L62
.L153:
	movq	%rax, %rsi
	leaq	.LC17(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L62
.L155:
	movq	%rdx, %rsi
	leaq	.LC19(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L62
.L154:
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L62
.L161:
	movq	%rbp, %rsi
	leaq	.LC6(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L53
.L162:
	movq	%rbp, %rsi
	leaq	.LC8(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L53
.L163:
	movq	%rbp, %rsi
	leaq	.LC9(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L53
	.size	parse_primary, .-parse_primary
	.section	.rodata.str1.1
.LC22:
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
	jne	.L174
.L172:
	movq	(%rax), %rdi
	call	*string_to_operator@GOTPCREL(%rip)
	movl	%eax, %r12d
	movl	%eax, %edi
	call	*operator_precedence@GOTPCREL(%rip)
	movl	%eax, %ebp
	cmpl	$19, %r12d
	je	.L174
	movl	28(%rsp), %eax
	cmpl	%eax, %ebp
	jl	.L174
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
	je	.L179
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rax, %r13
.L178:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	jne	.L168
	movq	(%rax), %rdi
	call	*string_to_operator@GOTPCREL(%rip)
	movl	%eax, %r14d
	movl	%eax, %edi
	call	*operator_precedence@GOTPCREL(%rip)
	cmpl	$19, %r14d
	je	.L168
	cmpl	%eax, %ebp
	jge	.L168
	movq	16(%rsp), %rcx
	movq	%r13, %rsi
	movq	%r15, %r8
	movl	%eax, %edx
	movq	%rbx, %rdi
	call	parse_expr_prec
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L178
	xorl	%r14d, %r14d
	jmp	.L164
	.p2align 4,,10
	.p2align 3
.L168:
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
	je	.L172
.L174:
	movq	8(%rsp), %r14
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
.L164:
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
.L179:
	movq	%r13, %rsi
	leaq	.LC22(%rip), %rdi
	xorl	%r14d, %r14d
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L164
	.size	parse_expr_prec, .-parse_expr_prec
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
	je	.L349
.L181:
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	parse_expression
	xorl	%r9d, %r9d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rax, %r8
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rbp
.L258:
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	testq	%rbp, %rbp
	je	.L350
.L266:
	movq	%rbx, %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L267
.L269:
	movq	%rbx, %rsi
	leaq	.LC52(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L180:
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
.L267:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L269
	jmp	.L180
	.p2align 4,,10
	.p2align 3
.L349:
	movq	(%rax), %rdi
	movq	IF_KEYWORD(%rip), %rsi
	movq	%rax, %r13
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L351
	movq	0(%r13), %rdi
	movq	FOR_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L352
	movq	0(%r13), %rdi
	movq	WHILE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L353
	movq	0(%r13), %rdi
	movq	VAR_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L354
	movq	0(%r13), %rdi
	movq	RETURN_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L259
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
	jmp	.L258
	.p2align 4,,10
	.p2align 3
.L352:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L216
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L216
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r14
	je	.L217
.L220:
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	parse_variable
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L355
.L219:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
.L221:
	cmpl	$5, 24(%r14)
	jne	.L224
	movq	(%r14), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L224
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	je	.L225
.L228:
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	parse_expression
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L356
.L227:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r15
.L229:
	cmpl	$5, 24(%r15)
	jne	.L231
	movq	(%r15), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L231
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	je	.L232
.L235:
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	parse_expression
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.L357
.L234:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r15
.L236:
	cmpl	$5, 24(%r15)
	jne	.L238
	movq	(%r15), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L238
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	jne	.L240
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L240
	call	*create_list@GOTPCREL(%rip)
	movb	$1, 2(%rbp)
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%rax, %r15
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
	jmp	.L241
	.p2align 4,,10
	.p2align 3
.L242:
	movq	%rax, %rsi
	movq	%r15, %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
.L241:
	cmpl	$5, 24(%r14)
	jne	.L243
	movq	(%r14), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L358
.L243:
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	testq	%rax, %rax
	jne	.L242
	movq	%rax, 16(%rsp)
	movq	%r14, %rsi
	leaq	.LC43(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %rax
	jmp	.L242
	.p2align 4,,10
	.p2align 3
.L350:
	movq	%rax, %rsi
	leaq	.LC51(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L266
	.p2align 4,,10
	.p2align 3
.L351:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L185
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L185
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movq	%rax, %r13
	call	parse_expression
	movq	%rax, 32(%rsp)
	testq	%rax, %rax
	je	.L359
.L186:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L188
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L188
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L190
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L190
	call	*create_list@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%rax, %r15
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
	jmp	.L191
	.p2align 4,,10
	.p2align 3
.L192:
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
.L191:
	cmpl	$5, 24(%r13)
	jne	.L193
	movq	0(%r13), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L360
.L193:
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L192
	movq	%r13, %rsi
	leaq	.LC27(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L192
	.p2align 4,,10
	.p2align 3
.L185:
	movq	%r13, %rsi
	leaq	.LC23(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L184:
	xorl	%esi, %esi
.L195:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$2, %edi
.L348:
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
.L353:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L247
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L247
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
	je	.L361
.L248:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L251
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L251
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L253
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L253
	call	*create_list@GOTPCREL(%rip)
	movb	$1, 2(%rbp)
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%rax, %r13
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r15
	jmp	.L254
	.p2align 4,,10
	.p2align 3
.L255:
	movq	%rax, %rsi
	movq	%r13, %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r15
.L254:
	cmpl	$5, 24(%r15)
	jne	.L256
	movq	(%r15), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L362
.L256:
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	testq	%rax, %rax
	jne	.L255
	movq	%rax, 8(%rsp)
	movq	%r15, %rsi
	leaq	.LC48(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %rax
	jmp	.L255
	.p2align 4,,10
	.p2align 3
.L354:
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
	jmp	.L258
	.p2align 4,,10
	.p2align 3
.L188:
	movq	%r13, %rsi
	leaq	.LC25(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L184
	.p2align 4,,10
	.p2align 3
.L216:
	movq	%r13, %rsi
	leaq	.LC35(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L215:
	xorl	%ecx, %ecx
.L223:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$4, %edi
	jmp	.L348
	.p2align 4,,10
	.p2align 3
.L247:
	movq	%r13, %rsi
	leaq	.LC44(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L246:
	xorl	%edx, %edx
.L250:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$3, %edi
	jmp	.L348
.L359:
	movq	%r13, %rsi
	leaq	.LC24(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L186
	.p2align 4,,10
	.p2align 3
.L259:
	movq	0(%r13), %rdi
	movq	BREAK_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L260
	cmpb	$0, 2(%rbp)
	je	.L363
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$6, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L258
	.p2align 4,,10
	.p2align 3
.L224:
	movq	%r14, %rsi
	leaq	.LC37(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L215
.L190:
	movq	%r13, %rsi
	leaq	.LC26(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L184
.L360:
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 24(%rsp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L347:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$6, 24(%rax)
	movq	%rax, %r13
	jne	.L206
	movq	(%rax), %rdi
	movq	ELIF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L364
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L197
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L197
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movq	%rax, %r13
	call	parse_expression
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	je	.L365
.L198:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L200
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L200
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L202
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L202
	call	*create_list@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%rax, %r13
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
	jmp	.L203
	.p2align 4,,10
	.p2align 3
.L204:
	movq	%rax, %rsi
	movq	%r13, %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
.L203:
	cmpl	$5, 24(%r14)
	jne	.L205
	movq	(%r14), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L366
.L205:
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	testq	%rax, %rax
	jne	.L204
	movq	%rax, 8(%rsp)
	movq	%r14, %rsi
	leaq	.LC32(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %rax
	jmp	.L204
	.p2align 4,,10
	.p2align 3
.L366:
	movq	16(%rsp), %rdi
	movq	%r13, %rsi
	call	*create_else_if@GOTPCREL(%rip)
	movq	24(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L347
	.p2align 4,,10
	.p2align 3
.L365:
	movq	%r13, %rsi
	leaq	.LC29(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L198
.L217:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	xorl	%r13d, %r13d
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L221
	jmp	.L220
.L251:
	movq	%r13, %rsi
	leaq	.LC46(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L246
.L231:
	movq	%r15, %rsi
	leaq	.LC39(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L215
.L260:
	movq	0(%r13), %rdi
	movq	CONTINUE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L181
	cmpb	$0, 2(%rbp)
	je	.L367
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$7, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L258
.L225:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L228
	movq	$0, 8(%rsp)
	jmp	.L229
.L362:
	movb	$0, 2(%rbp)
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	*create_while@GOTPCREL(%rip)
	movq	%rax, %rdx
	jmp	.L250
.L253:
	movq	%r13, %rsi
	leaq	.LC47(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L246
.L355:
	movq	%r14, %rsi
	leaq	.LC36(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L219
.L238:
	movq	%r15, %rsi
	leaq	.LC41(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L215
.L361:
	movq	%r13, %rsi
	leaq	.LC45(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L248
.L206:
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%r15, %rsi
	movq	40(%rsp), %rcx
	movq	24(%rsp), %rdx
	movq	32(%rsp), %rdi
	call	*create_if@GOTPCREL(%rip)
	movq	%rax, %rsi
	jmp	.L195
.L197:
	movq	%r13, %rsi
	leaq	.LC28(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L184
.L200:
	movq	%r13, %rsi
	leaq	.LC30(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L184
.L202:
	movq	%r13, %rsi
	leaq	.LC31(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L184
.L232:
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L235
	movq	$0, 24(%rsp)
	jmp	.L236
.L363:
	movq	%r13, %rsi
	leaq	.LC49(%rip), %rdi
	xorl	%ebp, %ebp
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L180
.L356:
	movq	%r15, %rsi
	leaq	.LC38(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L227
.L240:
	movq	%r15, %rsi
	leaq	.LC42(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L215
.L358:
	movq	%r15, %rcx
	movb	$0, 2(%rbp)
	movq	24(%rsp), %rdx
	movq	%r13, %rdi
	movq	8(%rsp), %rsi
	call	*create_for@GOTPCREL(%rip)
	movq	%rax, %rcx
	jmp	.L223
.L364:
	cmpl	$6, 24(%r13)
	jne	.L206
	movq	0(%r13), %rdi
	movq	ELSE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L206
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L209
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L209
	movl	$1, %esi
	movq	%rbx, %rdi
	leaq	.LC34(%rip), %r13
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
	jmp	.L210
	.p2align 4,,10
	.p2align 3
.L211:
	movq	%rax, %rsi
	movq	40(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r14
.L210:
	cmpl	$5, 24(%r14)
	jne	.L212
	movq	(%r14), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L206
.L212:
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	testq	%rax, %rax
	jne	.L211
	movq	%rax, 8(%rsp)
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %rax
	jmp	.L211
.L357:
	movq	%r15, %rsi
	leaq	.LC40(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L234
.L367:
	movq	%r13, %rsi
	leaq	.LC50(%rip), %rdi
	xorl	%ebp, %ebp
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L180
.L209:
	movq	%r13, %rsi
	leaq	.LC33(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L184
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
	je	.L535
.L369:
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
	jne	.L371
	jmp	.L457
	.p2align 4,,10
	.p2align 3
.L411:
	movq	%r10, %rsi
	movq	%r14, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L383:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r10
	testq	%rax, %rax
	je	.L457
.L371:
	movl	24(%r10), %eax
	testl	%eax, %eax
	je	.L457
	cmpl	$6, %eax
	jne	.L411
	movq	(%r10), %rdi
	movq	IMPORT_KEYWORD(%rip), %rsi
	movq	%r10, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testb	%al, %al
	movl	%eax, %ebx
	jne	.L536
	cmpl	$6, 24(%r10)
	jne	.L411
	movq	(%r10), %rdi
	movq	FUNC_KEYWORD(%rip), %rsi
	movq	%r10, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testb	%al, %al
	jne	.L537
	cmpl	$6, 24(%r10)
	jne	.L411
	movq	(%r10), %rdi
	movq	CLASS_KEYWORD(%rip), %rsi
	movq	%r10, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testb	%al, %al
	je	.L411
	movq	24(%rsp), %rdi
	call	*create_scope@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbp, %rdi
	movq	%rax, 40(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	cmpl	$1, 24(%rax)
	jne	.L538
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
	jne	.L415
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	%r10, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testb	%al, %al
	je	.L415
	call	*create_list@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbp, %rdi
	leaq	.LC86(%rip), %r12
	movq	%rax, 48(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	movq	%rax, %r9
	movq	%r10, 72(%rsp)
	jmp	.L416
	.p2align 4,,10
	.p2align 3
.L454:
	cmpl	$6, %eax
	je	.L539
.L417:
	movq	%r9, %rsi
	movq	%r12, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L450:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r9
.L416:
	movl	24(%r9), %eax
	cmpl	$5, %eax
	jne	.L454
	movq	(%r9), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	movq	%r9, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L455
	movq	16(%rsp), %r9
	movl	24(%r9), %eax
	cmpl	$6, %eax
	jne	.L417
.L539:
	movq	(%r9), %rdi
	movq	METHOD_KEYWORD(%rip), %rsi
	movq	%r9, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	testb	%al, %al
	jne	.L540
	cmpl	$6, 24(%r9)
	jne	.L417
	movq	(%r9), %rdi
	movq	VAR_KEYWORD(%rip), %rsi
	movq	%r9, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	testb	%al, %al
	je	.L417
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
	je	.L541
.L451:
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
	je	.L452
.L453:
	movq	%rbx, %rsi
	leaq	.LC85(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L450
	.p2align 4,,10
	.p2align 3
.L457:
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
.L536:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	cmpl	$1, 24(%rax)
	jne	.L542
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
	je	.L543
.L376:
	cmpl	$5, %eax
	jne	.L380
	movq	(%r12), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	movq	%r10, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testb	%al, %al
	je	.L380
	movq	%r13, %rdi
	movq	24(%rsp), %rdx
	movq	%rbx, %rsi
	call	*parse_import_file@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, %rdi
	je	.L544
.L381:
	movq	%r10, 16(%rsp)
	movq	%rbx, %rsi
	call	*create_import@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, %rsi
	je	.L375
.L382:
	xorl	%edi, %edi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	call	*create_code_member@GOTPCREL(%rip)
	movq	32(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L383
	.p2align 4,,10
	.p2align 3
.L537:
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
	je	.L385
	cmpl	$6, %eax
	jne	.L388
	movq	%r10, 16(%rsp)
	movq	0(%r13), %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testb	%al, %al
	je	.L388
.L385:
	movq	0(%r13), %rsi
	movq	24(%rsp), %rdi
	movq	%r10, 16(%rsp)
	call	*search@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, 40(%rsp)
	je	.L545
	movq	%r10, 16(%rsp)
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	cmpl	$1, 24(%rax)
	jne	.L546
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
	jne	.L392
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movq	%r10, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testb	%al, %al
	je	.L392
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
.L393:
	cmpl	$5, 24(%r13)
	je	.L547
.L401:
	movq	8(%rsp), %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	parse_variable
	testq	%rax, %rax
	je	.L548
	cmpq	$0, 16(%rax)
	je	.L396
	movq	%r13, %rsi
	leaq	.LC62(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L395:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	je	.L397
.L400:
	movq	%rbx, 16(%rsp)
	movq	%r13, %rsi
	leaq	.LC63(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r10
.L387:
	movq	%r10, %rsi
	leaq	.LC68(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	xorl	%edx, %edx
.L410:
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	movl	$1, %edi
	call	*create_code_member@GOTPCREL(%rip)
	movq	32(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L383
	.p2align 4,,10
	.p2align 3
.L415:
	movq	%r10, 16(%rsp)
	movq	%rbx, %rsi
	leaq	.LC70(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r10
.L413:
	movq	%r10, %rsi
	leaq	.LC87(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	xorl	%ecx, %ecx
.L456:
	xorl	%esi, %esi
	xorl	%edx, %edx
	movl	$2, %edi
	call	*create_code_member@GOTPCREL(%rip)
	movq	32(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L383
	.p2align 4,,10
	.p2align 3
.L540:
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
	je	.L419
	cmpl	$6, %eax
	jne	.L422
	movq	%r9, 16(%rsp)
	movq	(%r15), %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	testb	%al, %al
	je	.L422
.L419:
	movq	(%r15), %rsi
	movq	40(%rsp), %rdi
	movq	%r9, 16(%rsp)
	call	*search@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	testq	%rax, %rax
	movq	%rax, 64(%rsp)
	je	.L549
	movq	%r9, 16(%rsp)
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	cmpl	$1, 24(%rax)
	jne	.L550
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
	jne	.L426
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movq	%r9, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	testb	%al, %al
	je	.L426
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	cmpl	$6, 24(%rax)
	movq	%rax, %r15
	je	.L427
.L429:
	movq	%r9, 16(%rsp)
	movq	%r15, %rsi
	leaq	.LC75(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r9
.L428:
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
.L430:
	cmpl	$5, 24(%rbx)
	je	.L551
.L533:
	movq	%r15, %r9
	movq	%rbx, %r15
.L434:
	movq	%r9, 16(%rsp)
	movq	%r15, %rsi
	leaq	.LC76(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	jmp	.L421
	.p2align 4,,10
	.p2align 3
.L455:
	movq	72(%rsp), %r10
	movq	40(%rsp), %rdx
	movq	48(%rsp), %rsi
	movq	56(%rsp), %rdi
	movq	%r10, 16(%rsp)
	call	*create_class@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, %rcx
	jne	.L456
	jmp	.L413
	.p2align 4,,10
	.p2align 3
.L452:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L453
	jmp	.L450
	.p2align 4,,10
	.p2align 3
.L538:
	movq	%rax, %rsi
	leaq	.LC69(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	jmp	.L413
	.p2align 4,,10
	.p2align 3
.L542:
	movq	%rax, %rsi
	leaq	.LC53(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r10
.L375:
	movq	%r10, %rsi
	leaq	.LC56(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	xorl	%esi, %esi
	jmp	.L382
	.p2align 4,,10
	.p2align 3
.L380:
	movq	%r10, 16(%rsp)
	movq	%r12, %rsi
	leaq	.LC55(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	jmp	.L375
	.p2align 4,,10
	.p2align 3
.L392:
	movq	%r10, 16(%rsp)
	movq	%r13, %rsi
	leaq	.LC60(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	jmp	.L387
	.p2align 4,,10
	.p2align 3
.L426:
	movq	%r9, 16(%rsp)
	movq	%r15, %rsi
	leaq	.LC74(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r9
.L421:
	movq	%r9, %rsi
	leaq	.LC83(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	xorl	%esi, %esi
.L449:
	xorl	%edi, %edi
	xorl	%edx, %edx
	call	*create_class_member@GOTPCREL(%rip)
	movq	48(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L450
	.p2align 4,,10
	.p2align 3
.L547:
	movq	0(%r13), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L401
	movq	%rbx, 16(%rsp)
	movl	$1, %esi
	movzbl	56(%rsp), %ebx
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L403
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	%r10, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testb	%al, %al
	je	.L403
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
	jmp	.L404
	.p2align 4,,10
	.p2align 3
.L406:
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
.L404:
	cmpl	$5, 24(%r13)
	jne	.L408
	movq	0(%r13), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L552
.L408:
	movq	8(%rsp), %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	parse_statement
	testq	%rax, %rax
	je	.L553
	testb	%bl, %bl
	je	.L406
	movq	%rax, 16(%rsp)
	movq	%r13, %rsi
	leaq	.LC66(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %rax
	jmp	.L406
	.p2align 4,,10
	.p2align 3
.L396:
	movq	%rax, %rsi
	movq	%r15, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L395
	.p2align 4,,10
	.p2align 3
.L397:
	movq	(%rax), %rdi
	movq	COMMA_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L554
	cmpl	$5, 24(%r13)
	jne	.L400
	movq	0(%r13), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L393
	jmp	.L400
	.p2align 4,,10
	.p2align 3
.L551:
	movq	(%rbx), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L555
	cmpl	$5, 24(%rbx)
	jne	.L533
	movq	(%rbx), %rdi
	movq	COMMA_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L556
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %rdx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	parse_variable
	testq	%rax, %rax
	je	.L557
	cmpq	$0, 16(%rax)
	je	.L440
	movq	%rbx, %rsi
	leaq	.LC78(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
.L439:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L430
	.p2align 4,,10
	.p2align 3
.L440:
	movq	80(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L439
	.p2align 4,,10
	.p2align 3
.L548:
	movq	%r13, %rsi
	leaq	.LC61(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L395
	.p2align 4,,10
	.p2align 3
.L557:
	movq	%rbx, %rsi
	leaq	.LC77(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L439
	.p2align 4,,10
	.p2align 3
.L535:
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
	jmp	.L369
	.p2align 4,,10
	.p2align 3
.L388:
	movq	%r10, 16(%rsp)
	movq	%r13, %rsi
	leaq	.LC57(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	jmp	.L387
	.p2align 4,,10
	.p2align 3
.L422:
	movq	%r9, 16(%rsp)
	movq	%r15, %rsi
	leaq	.LC71(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	jmp	.L421
	.p2align 4,,10
	.p2align 3
.L541:
	movq	%rax, 16(%rsp)
	movq	%rbx, %rsi
	leaq	.LC84(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %rdx
	jmp	.L451
	.p2align 4,,10
	.p2align 3
.L554:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r13
	jmp	.L393
.L546:
	movq	%rax, %rsi
	leaq	.LC59(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	jmp	.L387
.L550:
	movq	%rax, %rsi
	leaq	.LC73(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	jmp	.L421
.L543:
	movq	(%r12), %rdi
	movq	FROM_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	testb	%al, %al
	jne	.L377
	movl	24(%r12), %eax
	jmp	.L376
.L556:
	cmpl	$5, 24(%rbx)
	movq	%r15, %r9
	movq	%rbx, %r15
	jne	.L434
	movq	(%rbx), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	%r9, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	testb	%al, %al
	je	.L434
.L442:
	movq	%r9, 16(%rsp)
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L437
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	%r9, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	testb	%al, %al
	je	.L437
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
	jmp	.L443
	.p2align 4,,10
	.p2align 3
.L445:
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
.L443:
	cmpl	$5, 24(%r15)
	jne	.L447
	movq	(%r15), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L558
.L447:
	movq	8(%rsp), %rdx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	parse_statement
	testq	%rax, %rax
	je	.L559
	testb	%bl, %bl
	je	.L445
	movq	%rax, 88(%rsp)
	movq	%r15, %rsi
	leaq	.LC66(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	88(%rsp), %rax
	jmp	.L445
.L437:
	movq	%r9, 16(%rsp)
	movq	%rbx, %rsi
	leaq	.LC79(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	jmp	.L421
	.p2align 4,,10
	.p2align 3
.L559:
	movq	%rax, 88(%rsp)
	movq	%r15, %rsi
	leaq	.LC81(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	88(%rsp), %rax
	jmp	.L445
.L427:
	movq	(%rax), %rdi
	movq	SELF_KEYWORD(%rip), %rsi
	movq	%r9, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	testb	%al, %al
	je	.L429
	jmp	.L428
.L544:
	movq	%r13, %rdi
	movq	24(%rsp), %r8
	xorl	%ecx, %ecx
	movl	$1, %esi
	movq	name_void(%rip), %rdx
	call	*create_name@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	movq	%rax, %rdi
	jmp	.L381
.L558:
	movq	8(%rsp), %rax
	xorl	%ecx, %ecx
	movq	104(%rsp), %r9
	movw	%cx, (%rax)
	testb	%bl, %bl
	jne	.L448
	movq	64(%rsp), %rax
	cmpq	name_void(%rip), %rax
	je	.L448
	movq	%r9, 88(%rsp)
	movq	%r15, %rsi
	leaq	.LC82(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	88(%rsp), %r9
.L448:
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
	jne	.L449
	jmp	.L421
	.p2align 4,,10
	.p2align 3
.L545:
	movq	%r13, %rsi
	leaq	.LC58(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	jmp	.L387
.L549:
	movq	%r15, %rsi
	leaq	.LC72(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	jmp	.L421
.L553:
	movq	%rax, 16(%rsp)
	movq	%r13, %rsi
	leaq	.LC65(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %rax
	jmp	.L406
.L377:
	movq	%r10, 16(%rsp)
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	cmpl	$4, 24(%rax)
	jne	.L560
	movq	%r10, 16(%rsp)
	movq	(%rax), %rbx
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	movq	%rax, %r12
	movl	24(%rax), %eax
	jmp	.L376
.L555:
	movq	%r15, %r9
	jmp	.L442
.L403:
	movq	%r10, 16(%rsp)
	movq	%r13, %rsi
	leaq	.LC64(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	jmp	.L387
.L552:
	movq	8(%rsp), %rax
	movq	64(%rsp), %r10
	movq	72(%rsp), %r15
	movb	$0, (%rax)
	testb	%bl, %bl
	jne	.L409
	movq	40(%rsp), %rax
	cmpq	name_void(%rip), %rax
	je	.L409
	movq	%r10, 16(%rsp)
	movq	%r13, %rsi
	leaq	.LC67(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r10
.L409:
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
	jne	.L410
	jmp	.L387
	.p2align 4,,10
	.p2align 3
.L560:
	movq	%rax, %rsi
	leaq	.LC54(%rip), %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r10
	jmp	.L375
	.size	parse_code, .-parse_code
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
