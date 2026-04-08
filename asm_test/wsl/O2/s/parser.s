	.file	"parser.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
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
	jne	.L11
.L9:
	movq	(%rax), %rdi
	call	*string_to_operator@GOTPCREL(%rip)
	movl	%eax, %r12d
	movl	%eax, %edi
	call	*operator_precedence@GOTPCREL(%rip)
	movl	%eax, %ebp
	cmpl	$19, %r12d
	je	.L11
	movl	28(%rsp), %eax
	cmpl	%eax, %ebp
	jl	.L11
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
	je	.L17
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rax, %r13
.L15:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	jne	.L5
	movq	(%rax), %rdi
	call	*string_to_operator@GOTPCREL(%rip)
	movl	%eax, %r14d
	movl	%eax, %edi
	call	*operator_precedence@GOTPCREL(%rip)
	cmpl	$19, %r14d
	je	.L5
	cmpl	%eax, %ebp
	jge	.L5
	movq	16(%rsp), %rcx
	movq	%r13, %rsi
	movq	%r15, %r8
	movl	%eax, %edx
	movq	%rbx, %rdi
	call	parse_expr_prec
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L15
	xorl	%r14d, %r14d
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L5:
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
	je	.L9
.L11:
	movq	8(%rsp), %r14
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
.L1:
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
.L17:
	movq	(%r15), %rdi
	xorl	%r14d, %r14d
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r13, %rsi
	leaq	.LC0(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L1
	.size	parse_expr_prec, .-parse_expr_prec
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Failed to parse expression primary"
	.text
	.p2align 4
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
	je	.L22
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
	.p2align 4,,10
	.p2align 3
.L22:
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
	.p2align 4
	.type	parse_variable, @function
parse_variable:
	pushq	%r15
	pushq	%r14
	movq	%rsi, %r14
	pushq	%r13
	pushq	%r12
	movq	%rdx, %r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	subq	$8, %rsp
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L25
	cmpl	$6, %eax
	jne	.L28
	movq	(%rbx), %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	testb	%al, %al
	je	.L28
.L25:
	movq	(%rbx), %rsi
	movq	%r14, %rdi
	call	*search_name@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L29
	movl	32(%rax), %eax
	cmpl	$6, %eax
	je	.L30
	testl	%eax, %eax
	jne	.L56
.L30:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L57
	cmpb	$0, 10(%r12)
	movl	$3, %esi
	je	.L32
.L58:
	cmpb	$1, 9(%r12)
	sbbl	%esi, %esi
	andl	$2, %esi
	addl	$3, %esi
.L32:
	movq	(%rbx), %rdi
	movq	%r14, %rcx
	movq	%r13, %rdx
	call	*create_symbol@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	je	.L33
.L35:
	xorl	%ebp, %ebp
.L34:
	addq	$8, %rsp
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	movq	%r13, %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*create_variable@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L57:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC5(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	cmpb	$0, 10(%r12)
	movl	$3, %esi
	je	.L32
	jmp	.L58
	.p2align 4,,10
	.p2align 3
.L28:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC2(%rip), %rdi
	movq	%rax, %rdx
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
.L56:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC3(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L33:
	movq	(%rax), %rdi
	movq	ASSIGN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L35
	movq	%rbp, %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rbp, %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rbp, %rdi
	movq	%r12, %rdx
	movq	%r14, %rsi
	movq	%rax, %r15
	call	parse_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L34
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r15, %rsi
	leaq	.LC6(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L34
	.p2align 4,,10
	.p2align 3
.L29:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC4(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L30
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
	je	.L180
	cmpl	$3, %eax
	je	.L181
	cmpl	$4, %eax
	je	.L182
	cmpl	$6, %eax
	je	.L183
.L64:
	cmpl	$5, %eax
	je	.L68
	cmpl	$1, %eax
	je	.L70
.L71:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC22(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L76:
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
.L181:
	movq	0(%rbp), %rsi
	xorl	%r14d, %r14d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$1, %ebx
.L61:
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
.L180:
	movq	0(%rbp), %rsi
	xorl	%r14d, %r14d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%ebx, %ebx
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L182:
	movq	0(%rbp), %rsi
	xorl	%r14d, %r14d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$2, %ebx
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L183:
	movq	0(%rbp), %rdi
	movq	TRUE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L184
	movl	24(%rbp), %eax
	cmpl	$6, %eax
	jne	.L64
	movq	0(%rbp), %rdi
	movq	FALSE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L67
	movl	24(%rbp), %eax
	cmpl	$5, %eax
	jne	.L79
	.p2align 4,,10
	.p2align 3
.L68:
	movq	0(%rbp), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L185
	movl	24(%rbp), %eax
	cmpl	$5, %eax
	jne	.L79
	movq	0(%rbp), %rdi
	movq	NOT_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L186
	movl	24(%rbp), %eax
	cmpl	$5, %eax
	jne	.L79
	movq	0(%rbp), %rdi
	movq	SUB_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L80
	movl	24(%rbp), %eax
.L79:
	cmpl	$1, %eax
	je	.L70
	cmpl	$6, %eax
	jne	.L71
	movq	0(%rbp), %rdi
	movq	SELF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L71
	cmpb	$0, 9(%r12)
	je	.L71
.L70:
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %r14
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L83
	cmpl	$6, %eax
	jne	.L86
	movq	(%r14), %rdi
	movq	SELF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L86
.L83:
	movq	(%r14), %rsi
	movq	%r13, %rdi
	call	*search_name@GOTPCREL(%rip)
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movq	%rax, %rdx
	xorl	%edi, %edi
	movq	%rax, 8(%rsp)
	call	*create_variable_access@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%rax, %r14
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rdx
	jne	.L87
	movq	$0, (%rsp)
	xorl	%r15d, %r15d
.L113:
	movq	8(%rsp), %rax
	testq	%rax, %rax
	je	.L88
	movq	(%rax), %r15
	testq	%r15, %r15
	cmove	%rax, %r15
.L88:
	cmpq	$0, (%rsp)
	jne	.L89
	testq	%r15, %r15
	je	.L89
	movl	32(%r15), %esi
	movq	$0, (%rsp)
	testl	%esi, %esi
	jne	.L89
	movq	24(%r15), %rax
	movq	16(%rax), %rax
	movq	%rax, (%rsp)
.L89:
	movq	(%rdx), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movq	%rdx, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %rdx
	testb	%al, %al
	jne	.L187
	movq	(%rdx), %rdi
	movq	L_BRACKET_SYMBOL(%rip), %rsi
	movq	%rdx, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %rdx
	testb	%al, %al
	je	.L104
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
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	je	.L188
.L105:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rcx
	jne	.L107
	movq	(%rax), %rdi
	movq	R_BRACKET_SYMBOL(%rip), %rsi
	movq	%rax, 24(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	24(%rsp), %rcx
	testb	%al, %al
	je	.L107
	movq	%r14, %rsi
	movq	16(%rsp), %rcx
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$3, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %r14
.L103:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rdx
	je	.L113
.L87:
	testq	%r14, %r14
	je	.L85
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$8, %ebx
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L104:
	movq	(%rdx), %rdi
	movq	DOT_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L87
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpq	$0, (%rsp)
	je	.L189
	cmpl	$1, 24(%rax)
	jne	.L190
	movq	(%rax), %rsi
	movq	(%rsp), %rdi
	movq	%rax, 16(%rsp)
	call	*search_name@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L191
.L110:
	movq	%r14, %rsi
	movq	8(%rsp), %rdx
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movl	$2, %edi
	xorl	%r15d, %r15d
	call	*create_variable_access@GOTPCREL(%rip)
	movq	$0, (%rsp)
	movq	%rax, %r14
	jmp	.L103
	.p2align 4,,10
	.p2align 3
.L187:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpq	$0, 8(%rsp)
	movq	%rax, %r15
	je	.L192
	movq	8(%rsp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	je	.L193
.L93:
	subl	$1, %eax
	cmpl	$1, %eax
	ja	.L194
.L92:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r15
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, (%rsp)
	.p2align 4,,10
	.p2align 3
.L96:
	cmpl	$5, 24(%r15)
	je	.L195
.L102:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_expression
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L196
.L97:
	movq	%r8, %rsi
	movq	(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	je	.L98
.L101:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r15, %rsi
	leaq	.LC15(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L85:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC21(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L195:
	movq	(%r15), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L102
	xorl	%ecx, %ecx
	movq	%r14, %rsi
	movq	(%rsp), %r8
	xorl	%edx, %edx
	movl	$1, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %r14
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %ecx
	movq	%rax, 8(%rsp)
	testl	%ecx, %ecx
	jne	.L117
	movq	24(%rax), %rax
	xorl	%r15d, %r15d
	movq	16(%rax), %rax
	movq	%rax, (%rsp)
	jmp	.L103
	.p2align 4,,10
	.p2align 3
.L98:
	movq	(%rax), %rdi
	movq	COMMA_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L197
	cmpl	$5, 24(%r15)
	jne	.L101
	movq	(%r15), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L96
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L196:
	movq	(%r12), %rdi
	movq	%rax, 16(%rsp)
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r15, %rsi
	leaq	.LC14(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %r8
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L197:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r15
	jmp	.L96
	.p2align 4,,10
	.p2align 3
.L191:
	testq	%r15, %r15
	movq	16(%rsp), %rcx
	je	.L111
	movl	32(%r15), %edx
	testl	%edx, %edx
	je	.L178
	movq	(%r15), %r15
	testq	%r15, %r15
	je	.L111
	movl	32(%r15), %eax
	testl	%eax, %eax
	je	.L178
	xorl	%r15d, %r15d
	.p2align 4,,10
	.p2align 3
.L111:
	movq	(%rcx), %rsi
	movq	%rcx, 16(%rsp)
	movq	%r15, %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movq	%rax, %rsi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	testq	%rax, %rax
	movq	%rax, 8(%rsp)
	jne	.L110
	movq	(%r12), %rdi
	movq	%rcx, (%rsp)
	call	*get_full_path@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC20(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L85
	.p2align 4,,10
	.p2align 3
.L184:
	movq	0(%rbp), %rsi
	xorl	%r14d, %r14d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$3, %ebx
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L67:
	movq	0(%rbp), %rsi
	xorl	%r14d, %r14d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$4, %ebx
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L194:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r15, %rsi
	leaq	.LC13(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L92
	.p2align 4,,10
	.p2align 3
.L193:
	movq	8(%rsp), %rax
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi
	movq	8(%rax), %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	8(%rsp), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rdi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	%r14, %rsi
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movq	%rax, 8(%rsp)
	movq	%rax, %rdx
	movl	$2, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %r14
	movq	8(%rsp), %rax
	testq	%rax, %rax
	je	.L92
	movl	32(%rax), %eax
	jmp	.L93
	.p2align 4,,10
	.p2align 3
.L86:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r14, %rsi
	leaq	.LC11(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L85
	.p2align 4,,10
	.p2align 3
.L178:
	movq	8(%r15), %r15
	jmp	.L111
	.p2align 4,,10
	.p2align 3
.L188:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	24(%rsp), %rsi
	leaq	.LC16(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L105
	.p2align 4,,10
	.p2align 3
.L185:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	parse_expression
	testq	%rax, %rax
	je	.L198
	movq	%rbx, %rdi
	movq	%rax, (%rsp)
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	(%rsp), %rdx
	movl	24(%rax), %ebx
	movq	%rax, %rbp
	cmpl	$5, %ebx
	jne	.L77
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	%rdx, (%rsp)
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L77
	movq	(%rsp), %rdx
	xorl	%r14d, %r14d
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L186:
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
	je	.L199
	xorl	%r14d, %r14d
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$6, %ebx
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L80:
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
	je	.L200
	xorl	%r14d, %r14d
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$7, %ebx
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L192:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r15, %rsi
	leaq	.LC12(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L92
.L77:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC8(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L76
.L117:
	movq	$0, (%rsp)
	xorl	%r15d, %r15d
	jmp	.L103
.L107:
	movq	(%r12), %rdi
	movq	%rcx, (%rsp)
	call	*get_full_path@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC17(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L85
.L189:
	movq	(%r12), %rdi
	movq	%rax, (%rsp)
	call	*get_full_path@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC18(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L85
.L190:
	movq	(%r12), %rdi
	movq	%rax, (%rsp)
	call	*get_full_path@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC19(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L85
.L198:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC7(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L76
.L199:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC9(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L76
.L200:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC10(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L76
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
	.p2align 4
	.type	parse_statement, @function
parse_statement:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	movq	%rsi, %r13
	pushq	%r12
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rbx
	movq	%rdi, %rbx
	subq	$56, %rsp
	call	*peek_current_token@GOTPCREL(%rip)
	cmpl	$6, 24(%rax)
	je	.L374
.L202:
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_expression
	xorl	%r9d, %r9d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rax, %r8
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %r12
.L279:
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%r12, %r12
	je	.L375
.L288:
	movq	%rbx, %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L289
.L291:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC52(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L201:
	addq	$56, %rsp
	movq	%r12, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L289:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L291
	jmp	.L201
	.p2align 4,,10
	.p2align 3
.L374:
	movq	(%rax), %rdi
	movq	IF_KEYWORD(%rip), %rsi
	movq	%rax, %r12
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L376
	movq	(%r12), %rdi
	movq	FOR_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L377
	movq	(%r12), %rdi
	movq	WHILE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L378
	movq	(%r12), %rdi
	movq	VAR_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L379
	movq	(%r12), %rdi
	movq	RETURN_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L280
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	je	.L380
.L281:
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_expression
	xorl	%r9d, %r9d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rax, %r8
	xorl	%esi, %esi
	movl	$5, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L279
	.p2align 4,,10
	.p2align 3
.L377:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L237
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L237
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	je	.L238
.L241:
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_variable
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L381
.L240:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
.L242:
	cmpl	$5, 24(%r12)
	jne	.L245
	movq	(%r12), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L245
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	je	.L246
.L249:
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_expression
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L382
.L248:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
.L250:
	cmpl	$5, 24(%r12)
	jne	.L252
	movq	(%r12), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L252
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	je	.L253
.L256:
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_expression
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.L383
.L255:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
.L257:
	cmpl	$5, 24(%r12)
	jne	.L259
	movq	(%r12), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L259
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L261
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L261
	call	*create_list@GOTPCREL(%rip)
	movb	$1, 11(%rbp)
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%rax, %r15
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L262
	.p2align 4,,10
	.p2align 3
.L263:
	movq	%rcx, %rsi
	movq	%r15, %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
.L262:
	cmpl	$5, 24(%r12)
	jne	.L264
	movq	(%r12), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L384
.L264:
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L263
	movq	0(%rbp), %rdi
	movq	%rax, 16(%rsp)
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC43(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	jmp	.L263
	.p2align 4,,10
	.p2align 3
.L375:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r13, %rsi
	leaq	.LC51(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L288
	.p2align 4,,10
	.p2align 3
.L376:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L206
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L206
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	%rax, %r12
	call	parse_expression
	movq	%rax, 32(%rsp)
	testq	%rax, %rax
	je	.L385
.L207:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L209
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L209
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L211
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L211
	call	*create_list@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	leaq	.LC27(%rip), %r14
	movq	%rax, 8(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L212
	.p2align 4,,10
	.p2align 3
.L213:
	movq	8(%rsp), %rdi
	movq	%r15, %rsi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
.L212:
	cmpl	$5, 24(%r12)
	jne	.L214
	movq	(%r12), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L386
.L214:
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L213
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	movq	%r14, %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L213
	.p2align 4,,10
	.p2align 3
.L206:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC23(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L205:
	xorl	%esi, %esi
.L216:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$2, %edi
.L373:
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
.L378:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
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
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	%rax, %r12
	call	parse_expression
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L387
.L269:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L272
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L272
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L274
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L274
	call	*create_list@GOTPCREL(%rip)
	movb	$1, 11(%rbp)
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%rax, %r14
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L275
	.p2align 4,,10
	.p2align 3
.L276:
	movq	%rcx, %rsi
	movq	%r14, %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
.L275:
	cmpl	$5, 24(%r12)
	jne	.L277
	movq	(%r12), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L388
.L277:
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L276
	movq	0(%rbp), %rdi
	movq	%rax, 8(%rsp)
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC48(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %rcx
	jmp	.L276
	.p2align 4,,10
	.p2align 3
.L379:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_variable
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rax, %r9
	xorl	%esi, %esi
	movl	$1, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L279
	.p2align 4,,10
	.p2align 3
.L209:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC25(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L205
	.p2align 4,,10
	.p2align 3
.L237:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC35(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L236:
	xorl	%ecx, %ecx
.L244:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$4, %edi
	jmp	.L373
	.p2align 4,,10
	.p2align 3
.L268:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC44(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L267:
	xorl	%edx, %edx
.L271:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$3, %edi
	jmp	.L373
.L385:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC24(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L207
	.p2align 4,,10
	.p2align 3
.L280:
	movq	(%r12), %rdi
	movq	BREAK_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L282
	cmpb	$0, 11(%rbp)
	je	.L389
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$6, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L279
	.p2align 4,,10
	.p2align 3
.L245:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC37(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L236
.L211:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC26(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L205
.L386:
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 24(%rsp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L372:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$6, 24(%rax)
	movq	%rax, %r12
	jne	.L227
	movq	(%rax), %rdi
	movq	ELIF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L390
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L218
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L218
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	%rax, %r12
	call	parse_expression
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	je	.L391
.L219:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L221
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L221
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L223
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L223
	call	*create_list@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%rax, %r14
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L224
	.p2align 4,,10
	.p2align 3
.L225:
	movq	%r15, %rsi
	movq	%r14, %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
.L224:
	cmpl	$5, 24(%r12)
	jne	.L226
	movq	(%r12), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L392
.L226:
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L225
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC32(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L225
	.p2align 4,,10
	.p2align 3
.L392:
	movq	16(%rsp), %rdi
	movq	%r14, %rsi
	call	*create_else_if@GOTPCREL(%rip)
	movq	24(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L372
	.p2align 4,,10
	.p2align 3
.L391:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC29(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L219
.L238:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	xorl	%r14d, %r14d
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L242
	jmp	.L241
.L272:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC46(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L267
.L252:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC39(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L236
.L380:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L281
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$5, %edi
	jmp	.L373
.L282:
	movq	(%r12), %rdi
	movq	CONTINUE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L202
	cmpb	$0, 11(%rbp)
	je	.L393
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$7, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L279
.L246:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L249
	movq	$0, 8(%rsp)
	jmp	.L250
.L274:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC47(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L267
.L388:
	movb	$0, 11(%rbp)
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	*create_while@GOTPCREL(%rip)
	movq	%rax, %rdx
	jmp	.L271
.L381:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC36(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L240
.L259:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC41(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L236
.L387:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC45(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L269
.L227:
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movq	40(%rsp), %rcx
	movq	24(%rsp), %rdx
	movq	32(%rsp), %rdi
	call	*create_if@GOTPCREL(%rip)
	movq	%rax, %rsi
	jmp	.L216
.L218:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC28(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L205
.L221:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC30(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L205
.L223:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC31(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L205
.L253:
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L256
	movq	$0, 24(%rsp)
	jmp	.L257
.L389:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC49(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L284:
	xorl	%r12d, %r12d
	jmp	.L201
.L382:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC38(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L248
.L384:
	movq	%r15, %rcx
	movb	$0, 11(%rbp)
	movq	24(%rsp), %rdx
	movq	%r14, %rdi
	movq	8(%rsp), %rsi
	call	*create_for@GOTPCREL(%rip)
	movq	%rax, %rcx
	jmp	.L244
.L261:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC42(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L236
.L390:
	cmpl	$6, 24(%r12)
	jne	.L227
	movq	(%r12), %rdi
	movq	ELSE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L227
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L230
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L230
	movl	$1, %esi
	movq	%rbx, %rdi
	leaq	.LC34(%rip), %r15
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L231
	.p2align 4,,10
	.p2align 3
.L232:
	movq	40(%rsp), %rdi
	movq	%r14, %rsi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
.L231:
	cmpl	$5, 24(%r12)
	jne	.L233
	movq	(%r12), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L227
.L233:
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L232
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	movq	%r15, %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L232
.L383:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC40(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L255
.L393:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC50(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L284
.L230:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC33(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L205
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
.LC82:
	.string	"Failed to parse method body statement"
	.align 8
.LC83:
	.string	"Method missing return statement"
	.section	.rodata.str1.1
.LC84:
	.string	"Failed to parse class method"
	.section	.rodata.str1.8
	.align 8
.LC85:
	.string	"Failed to parse class variable"
	.align 8
.LC86:
	.string	"Unsupported type for class variable"
	.align 8
.LC87:
	.string	"Expected ';' after class variable declaration"
	.align 8
.LC88:
	.string	"Unexpected token in class member"
	.align 8
.LC89:
	.string	"Constructor name conflicts with existing member"
	.section	.rodata.str1.1
.LC90:
	.string	"0"
	.section	.rodata.str1.8
	.align 8
.LC91:
	.string	"Failed to parse class declaration"
	.align 8
.LC92:
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
	movq	%rdx, %rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$120, %rsp
	cmpq	$0, builtin_scope(%rip)
	je	.L596
.L395:
	testq	%rbx, %rbx
	cmove	builtin_scope(%rip), %rbx
	movq	%rbp, %r13
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 24(%rsp)
	movq	%rbx, %rdi
	call	*create_symbol_table@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r15, %rdi
	movq	%rax, 16(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, (%rsp)
	testq	%rax, %rax
	jne	.L397
	jmp	.L513
	.p2align 4,,10
	.p2align 3
.L442:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC92(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L409:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	.L513
.L397:
	movq	(%rsp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	je	.L513
	cmpl	$6, %eax
	jne	.L442
	movq	(%rsp), %rax
	movq	IMPORT_KEYWORD(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %ebp
	testb	%al, %al
	jne	.L597
	movq	(%rsp), %rax
	cmpl	$6, 24(%rax)
	jne	.L442
	movq	(%rax), %rdi
	movq	FUNC_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L598
	movq	(%rsp), %rax
	cmpl	$6, 24(%rax)
	jne	.L442
	movq	(%rax), %rdi
	movq	CLASS_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L442
	movq	16(%rsp), %rdi
	call	*create_symbol_table@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r15, %rdi
	movq	%rax, 32(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L599
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	(%rbx), %rdi
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%rax, %rcx
	movq	%rax, 64(%rsp)
	movq	32(%rsp), %rax
	movq	%rax, 16(%rcx)
	call	*create_symbol@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r15, %rdi
	movq	%rax, 40(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L446
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L446
	call	*create_list@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r15, %rdi
	movq	%rax, 48(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	movq	$0, 72(%rsp)
	movq	%rax, %r10
	jmp	.L447
	.p2align 4,,10
	.p2align 3
.L499:
	cmpl	$6, %eax
	je	.L600
.L448:
	movq	0(%r13), %rdi
	movq	%r10, 8(%rsp)
	call	*get_full_path@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC88(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L496:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r10
.L447:
	movl	24(%r10), %eax
	cmpl	$5, %eax
	jne	.L499
	movq	(%r10), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	movq	%r10, 8(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	testb	%al, %al
	jne	.L500
	movl	24(%r10), %eax
	cmpl	$6, %eax
	jne	.L448
.L600:
	movq	(%r10), %rdi
	movq	METHOD_KEYWORD(%rip), %rsi
	movq	%r10, 8(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	testb	%al, %al
	jne	.L601
	cmpl	$6, 24(%r10)
	jne	.L448
	movq	(%r10), %rdi
	movq	VAR_KEYWORD(%rip), %rsi
	movq	%r10, 8(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	testb	%al, %al
	je	.L448
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movb	$1, 10(%r13)
	movq	%r13, %rdx
	movq	%r15, %rdi
	movq	32(%rsp), %rsi
	movq	%rax, %rbx
	call	parse_variable
	movb	$0, 10(%r13)
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L602
.L487:
	movq	%rbp, %rdx
	xorl	%esi, %esi
	movl	$1, %edi
	call	*create_class_member@GOTPCREL(%rip)
	movq	48(%rsp), %rdi
	movq	%rax, %rbp
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	cmpl	$1, 8(%rbp)
	je	.L603
.L491:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L495
.L497:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC87(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L496
	.p2align 4,,10
	.p2align 3
.L513:
	movq	16(%rsp), %rsi
	movq	24(%rsp), %rdi
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
.L597:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L604
	movq	(%rax), %rbp
	movl	$1, %esi
	movq	%r15, %rdi
	xorl	%ebx, %ebx
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
	movl	24(%rax), %eax
	cmpl	$6, %eax
	je	.L605
.L402:
	cmpl	$5, %eax
	jne	.L406
	movq	(%r12), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L406
	movq	%rbp, %rdi
	movq	0(%r13), %rcx
	movq	16(%rsp), %rdx
	movq	%rbx, %rsi
	call	*parse_import_file@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L606
.L407:
	movq	%rbx, %rsi
	call	*create_import@GOTPCREL(%rip)
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L401
.L408:
	xorl	%edi, %edi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	call	*create_code_member@GOTPCREL(%rip)
	movq	24(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L409
	.p2align 4,,10
	.p2align 3
.L598:
	movq	16(%rsp), %rdi
	call	*create_symbol_table@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r15, %rdi
	movq	%rax, %r12
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L411
	cmpl	$6, %eax
	jne	.L414
	movq	(%rbx), %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	testb	%al, %al
	je	.L414
.L411:
	movq	(%rbx), %rsi
	movq	16(%rsp), %rdi
	call	*search_name@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L607
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L608
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	(%rbx), %rdi
	movq	8(%rsp), %rdx
	movl	$1, %esi
	movq	%rax, %rcx
	movq	%rax, 40(%rsp)
	movq	%r12, 32(%rax)
	call	*create_symbol@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r15, %rdi
	movq	%rax, 48(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L418
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L418
	movl	$1, %esi
	movq	%r15, %rdi
	leaq	.LC63(%rip), %r14
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L419:
	cmpl	$5, 24(%rbx)
	je	.L609
.L427:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	parse_variable
	testq	%rax, %rax
	je	.L610
	cmpq	$0, 16(%rax)
	je	.L422
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	movq	%r14, %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L421:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L423
.L426:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC64(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L413:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC69(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	xorl	%edx, %edx
.L441:
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	movl	$1, %edi
	call	*create_code_member@GOTPCREL(%rip)
	movq	24(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L409
	.p2align 4,,10
	.p2align 3
.L446:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC71(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L444:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC91(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	xorl	%ecx, %ecx
.L512:
	xorl	%esi, %esi
	xorl	%edx, %edx
	movl	$2, %edi
	call	*create_code_member@GOTPCREL(%rip)
	movq	24(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L409
	.p2align 4,,10
	.p2align 3
.L601:
	movq	32(%rsp), %rdi
	call	*create_symbol_table@GOTPCREL(%rip)
	movq	40(%rsp), %rdx
	movl	$3, %esi
	movq	SELF_KEYWORD(%rip), %rdi
	movq	%rax, %rcx
	movq	%rax, %rbp
	call	*create_symbol@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r15, %rdi
	movq	%rax, %r14
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	movq	%rax, %r12
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L450
	cmpl	$6, %eax
	jne	.L453
	movq	%r10, 8(%rsp)
	movq	(%r12), %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	testb	%al, %al
	je	.L453
.L450:
	movq	(%r12), %rsi
	movq	32(%rsp), %rdi
	movq	%r10, 8(%rsp)
	call	*search_name@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, 56(%rsp)
	je	.L611
	movq	%r10, 8(%rsp)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	cmpl	$1, 24(%rax)
	movq	%rax, %r12
	jne	.L612
	movq	%r10, 8(%rsp)
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	(%r12), %rsi
	movq	%rax, 88(%rsp)
	movq	%rax, %rbx
	movq	%rbp, 32(%rax)
	movq	40(%rsp), %rax
	movq	8(%rax), %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	56(%rsp), %rdx
	movq	%rbx, %rcx
	movl	$2, %esi
	movq	%rax, %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r15, %rdi
	movq	%rax, 96(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L457
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movq	%r10, 8(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	testb	%al, %al
	je	.L457
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	cmpl	$6, 24(%rax)
	movq	%rax, %r12
	je	.L458
.L460:
	movq	%r10, 8(%rsp)
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC76(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %r10
.L459:
	movq	%r10, 104(%rsp)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	call	*create_list@GOTPCREL(%rip)
	movq	%r14, %rsi
	movq	40(%rsp), %rdi
	xorl	%edx, %edx
	movq	%rax, %r12
	movq	%rax, 80(%rsp)
	leaq	.LC78(%rip), %r14
	call	*create_variable@GOTPCREL(%rip)
	movq	%r12, %rdi
	leaq	.LC79(%rip), %r12
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	%rbp, 8(%rsp)
	movq	104(%rsp), %rbp
	.p2align 4,,10
	.p2align 3
.L461:
	cmpl	$5, 24(%rbx)
	je	.L613
.L591:
	movq	%rbp, %r10
.L465:
	movq	%r10, 8(%rsp)
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC77(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	jmp	.L452
	.p2align 4,,10
	.p2align 3
.L500:
	movq	40(%rsp), %rax
	movq	%r10, 8(%rsp)
	movq	DEFAULT_INIT_NAME(%rip), %rsi
	movq	8(%rax), %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	32(%rsp), %rdi
	movq	%rax, %rbx
	movq	%rax, %rsi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, 56(%rsp)
	je	.L614
.L501:
	movq	56(%rsp), %rax
	movq	%r10, 8(%rsp)
	cmpl	$2, 32(%rax)
	jne	.L615
.L502:
	movq	40(%rsp), %r12
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi
	movq	8(%r12), %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movl	$40, %edi
	movq	%rax, %rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movq	32(%rsp), %rdi
	movq	%rax, %rbp
	call	*create_symbol_table@GOTPCREL(%rip)
	movq	%r12, %rdx
	movq	%rbp, %rcx
	movl	$2, %esi
	movq	%rbx, %rdi
	movq	%rax, 32(%rbp)
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, 80(%rsp)
	call	*create_list@GOTPCREL(%rip)
	movq	%r12, %rdx
	movq	32(%rbp), %rcx
	movq	SELF_KEYWORD(%rip), %rdi
	movl	$3, %esi
	movq	%rax, %r14
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	56(%rsp), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L504:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L616
	movq	8(%rbx), %rax
	movq	SELF_KEYWORD(%rip), %rsi
	movq	8(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L504
	movq	8(%rbx), %rsi
	movq	(%rbx), %rdi
	xorl	%edx, %edx
	call	*create_variable@GOTPCREL(%rip)
	movq	%r14, %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L504
	.p2align 4,,10
	.p2align 3
.L616:
	call	*create_list@GOTPCREL(%rip)
	movq	48(%rsp), %rdi
	movq	%rax, 8(%rsp)
	call	*list_copy@GOTPCREL(%rip)
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movq	%r12, %rdx
	xorl	%esi, %esi
	xorl	%edi, %edi
	movq	%rax, %rbx
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
.L595:
	call	*create_expression@GOTPCREL(%rip)
	xorl	%esi, %esi
	xorl	%edi, %edi
	xorl	%r9d, %r9d
	movq	%rax, %r8
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	call	*create_statement@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L507
	.p2align 4,,10
	.p2align 3
.L509:
	cmpl	$1, 8(%r9)
	je	.L617
.L507:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r9
	testq	%rax, %rax
	jne	.L509
	call	*create_list@GOTPCREL(%rip)
	movq	%r12, %rdx
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movq	%rax, %rbx
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
	movq	%rbx, %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	%r14, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L510
	.p2align 4,,10
	.p2align 3
.L511:
	movq	8(%rax), %rdx
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%rax, %r8
	movl	$8, %edi
	call	*create_primary@GOTPCREL(%rip)
	xorl	%esi, %esi
	movl	$19, %edi
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	call	*create_expression@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
.L510:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L511
	movq	56(%rsp), %rdx
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rbx, %r8
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
	movq	8(%rsp), %rbx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r14, %rcx
	movq	40(%rsp), %r14
	movq	%rbx, %r8
	movq	32(%rbp), %r9
	movq	80(%rsp), %rsi
	movq	%rbp, %rdi
	movq	%r14, %rdx
	call	*create_method_use_ptr@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	%rbp, %rsi
	xorl	%edi, %edi
	call	*create_class_member@GOTPCREL(%rip)
	movq	48(%rsp), %rbx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	32(%rsp), %rcx
	movq	%rbx, %rdx
	movq	%r14, %rsi
	movq	72(%rsp), %r8
	movq	64(%rsp), %rdi
	call	*create_class_use_ptr@GOTPCREL(%rip)
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L512
	jmp	.L444
	.p2align 4,,10
	.p2align 3
.L617:
	movq	(%r9), %rax
	movq	%r9, 96(%rsp)
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movq	%r12, %rdx
	xorl	%esi, %esi
	xorl	%edi, %edi
	movq	8(%rax), %rax
	movq	%rax, 88(%rsp)
	call	*create_variable_access@GOTPCREL(%rip)
	movq	88(%rsp), %rdx
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movq	%rax, %rsi
	movl	$2, %edi
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
	movq	96(%rsp), %r9
	movq	%rax, %r10
	movq	(%r9), %rax
	movq	16(%rax), %rcx
	testq	%rcx, %rcx
	je	.L618
.L508:
	xorl	%edx, %edx
	movq	%r10, %rsi
	movl	$13, %edi
	jmp	.L595
	.p2align 4,,10
	.p2align 3
.L495:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L497
	jmp	.L496
	.p2align 4,,10
	.p2align 3
.L603:
	movq	0(%rbp), %rax
	movq	(%rax), %rax
	cmpq	name_int(%rip), %rax
	je	.L594
	cmpq	name_float(%rip), %rax
	je	.L594
	cmpq	name_string(%rip), %rax
	je	.L594
	cmpq	name_bool(%rip), %rax
	je	.L492
	cmpq	name_void(%rip), %rax
	je	.L492
	movl	32(%rax), %eax
	testl	%eax, %eax
	je	.L594
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC86(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L491
	.p2align 4,,10
	.p2align 3
.L594:
	addq	$8, 72(%rsp)
	jmp	.L491
	.p2align 4,,10
	.p2align 3
.L599:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC70(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L444
	.p2align 4,,10
	.p2align 3
.L604:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC53(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L401:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC57(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	xorl	%esi, %esi
	jmp	.L408
	.p2align 4,,10
	.p2align 3
.L615:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC89(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L502
	.p2align 4,,10
	.p2align 3
.L406:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC55(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L401
	.p2align 4,,10
	.p2align 3
.L418:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC61(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L413
	.p2align 4,,10
	.p2align 3
.L457:
	movq	%r10, 8(%rsp)
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC75(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %r10
.L452:
	movq	%r10, 8(%rsp)
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC84(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	xorl	%esi, %esi
.L485:
	xorl	%edi, %edi
	xorl	%edx, %edx
	call	*create_class_member@GOTPCREL(%rip)
	movq	48(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L496
	.p2align 4,,10
	.p2align 3
.L609:
	movq	(%rbx), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L427
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L429
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L429
	call	*create_list@GOTPCREL(%rip)
	movb	$1, 8(%r13)
	movl	$1, %esi
	movq	%r15, %rdi
	movq	%rax, 56(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L430
	.p2align 4,,10
	.p2align 3
.L433:
	cmpl	$5, 8(%r14)
	movl	$1, %eax
	cmove	%eax, %ebp
.L434:
	movq	56(%rsp), %rdi
	movq	%r14, %rsi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
.L430:
	cmpl	$5, 24(%rbx)
	jne	.L435
	movq	(%rbx), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L619
.L435:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L620
	testb	%bpl, %bpl
	je	.L433
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC67(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L433
	.p2align 4,,10
	.p2align 3
.L422:
	movq	32(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L421
	.p2align 4,,10
	.p2align 3
.L423:
	movq	(%rax), %rdi
	movq	COMMA_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L621
	cmpl	$5, 24(%rbx)
	jne	.L426
	movq	(%rbx), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L419
	jmp	.L426
	.p2align 4,,10
	.p2align 3
.L613:
	movq	(%rbx), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L622
	cmpl	$5, 24(%rbx)
	jne	.L591
	movq	(%rbx), %rdi
	movq	COMMA_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L623
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movq	%r13, %rdx
	movq	%r15, %rdi
	movq	%rax, %rbx
	call	parse_variable
	testq	%rax, %rax
	je	.L624
	cmpq	$0, 16(%rax)
	je	.L471
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	movq	%r12, %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L470:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L461
	.p2align 4,,10
	.p2align 3
.L471:
	movq	80(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L470
	.p2align 4,,10
	.p2align 3
.L610:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC62(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L421
	.p2align 4,,10
	.p2align 3
.L624:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	movq	%r14, %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L470
	.p2align 4,,10
	.p2align 3
.L596:
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
	jmp	.L395
	.p2align 4,,10
	.p2align 3
.L414:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC58(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L413
	.p2align 4,,10
	.p2align 3
.L453:
	movq	%r10, 8(%rsp)
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC72(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	jmp	.L452
	.p2align 4,,10
	.p2align 3
.L602:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC85(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L487
	.p2align 4,,10
	.p2align 3
.L621:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L419
.L608:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC60(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L413
.L612:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC74(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	jmp	.L452
.L605:
	movq	(%r12), %rdi
	movq	FROM_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L403
.L593:
	movl	24(%r12), %eax
	jmp	.L402
.L623:
	cmpl	$5, 24(%rbx)
	movq	%rbp, %r10
	movq	8(%rsp), %rbp
	jne	.L465
	movq	(%rbx), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	%r10, 8(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	testb	%al, %al
	je	.L465
.L473:
	movq	%r10, 8(%rsp)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L468
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	%r10, 8(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	testb	%al, %al
	je	.L468
	movq	%r10, 104(%rsp)
	xorl	%r12d, %r12d
	call	*create_list@GOTPCREL(%rip)
	movl	$257, %ecx
	movl	$1, %esi
	movq	%r15, %rdi
	movq	%rax, 8(%rsp)
	movw	%cx, 8(%r13)
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L474
	.p2align 4,,10
	.p2align 3
.L477:
	cmpl	$5, 8(%r14)
	movl	$1, %eax
	cmove	%eax, %r12d
.L478:
	movq	8(%rsp), %rdi
	movq	%r14, %rsi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
.L474:
	cmpl	$5, 24(%rbx)
	jne	.L479
	movq	(%rbx), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L625
.L479:
	movq	%r13, %rdx
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L626
	testb	%r12b, %r12b
	je	.L477
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC67(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L477
.L614:
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	32(%rsp), %rdi
	movq	%rax, %rbp
	call	*create_symbol_table@GOTPCREL(%rip)
	movq	40(%rsp), %r14
	movq	%rbx, %rdi
	movq	%rbp, %rcx
	movl	$2, %esi
	movq	%rax, 32(%rbp)
	movq	%r14, %rdx
	movq	%r14, %rbx
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, 56(%rsp)
	call	*create_list@GOTPCREL(%rip)
	movq	32(%rbp), %rcx
	movq	%r14, %rdx
	movq	SELF_KEYWORD(%rip), %rdi
	movq	%rax, %r12
	movl	$3, %esi
	call	*create_symbol@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbx, 40(%rsp)
	movq	%rax, %r14
	movq	%rax, %rsi
	call	*create_variable@GOTPCREL(%rip)
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	call	*create_list@GOTPCREL(%rip)
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movq	%r14, %rdx
	movq	%rax, %rbx
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
	movq	%rbx, %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	32(%rbp), %r9
	movq	%rbx, %r8
	movq	%r12, %rcx
	movq	40(%rsp), %rdx
	movq	56(%rsp), %rsi
	movq	%rbp, %rdi
	call	*create_method_use_ptr@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	%rbp, %rsi
	xorl	%edi, %edi
	call	*create_class_member@GOTPCREL(%rip)
	movq	48(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	jmp	.L501
.L468:
	movq	%r10, 8(%rsp)
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC80(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	jmp	.L452
.L492:
	addq	$1, 72(%rsp)
	jmp	.L491
	.p2align 4,,10
	.p2align 3
.L626:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC82(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L478
.L618:
	movq	%r10, 88(%rsp)
	movl	$2, %esi
	leaq	.LC90(%rip), %rdi
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
	movq	88(%rsp), %r10
	movq	%rax, %rcx
	jmp	.L508
.L458:
	movq	(%rax), %rdi
	movq	SELF_KEYWORD(%rip), %rsi
	movq	%r10, 8(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	testb	%al, %al
	je	.L460
	jmp	.L459
.L625:
	xorl	%edx, %edx
	movq	104(%rsp), %r10
	movw	%dx, 8(%r13)
	testb	%r12b, %r12b
	jne	.L481
	movq	56(%rsp), %rax
	cmpq	name_void(%rip), %rax
	je	.L483
	movq	%r10, 104(%rsp)
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC83(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	56(%rsp), %rax
	movq	104(%rsp), %r10
	cmpq	name_void(%rip), %rax
	je	.L483
.L481:
	movq	%r10, 104(%rsp)
	movq	96(%rsp), %rsi
	movq	%rbp, %r9
	movq	8(%rsp), %r8
	movq	80(%rsp), %rcx
	movq	56(%rsp), %rdx
	movq	88(%rsp), %rdi
	call	*create_method_use_ptr@GOTPCREL(%rip)
	movq	104(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, %rsi
	jne	.L485
	jmp	.L452
	.p2align 4,,10
	.p2align 3
.L606:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC56(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	%rbp, %rdi
	movq	16(%rsp), %rcx
	movq	name_void(%rip), %rdx
	movl	$3, %esi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, %rdi
	jmp	.L407
.L607:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC59(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L413
.L611:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC73(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	jmp	.L452
.L403:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$4, 24(%rax)
	movq	%rax, %rbx
	jne	.L627
	movq	(%rax), %rbx
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L593
.L620:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC66(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L434
.L622:
	movq	%rbp, %r10
	movq	8(%rsp), %rbp
	jmp	.L473
.L619:
	movb	$0, 8(%r13)
	testb	%bpl, %bpl
	jne	.L437
	movq	8(%rsp), %rax
	cmpq	name_void(%rip), %rax
	je	.L439
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC68(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %rax
	cmpq	name_void(%rip), %rax
	je	.L439
.L437:
	movq	8(%rsp), %rdx
	movq	56(%rsp), %r8
	movq	%r12, %r9
	movq	32(%rsp), %rcx
	movq	48(%rsp), %rsi
	movq	40(%rsp), %rdi
	call	*create_function_use_ptr@GOTPCREL(%rip)
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L441
	jmp	.L413
	.p2align 4,,10
	.p2align 3
.L429:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC65(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L413
.L627:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC54(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L401
.L483:
	movq	%r10, 104(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$5, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	104(%rsp), %r10
	jmp	.L481
.L439:
	xorl	%esi, %esi
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$5, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	56(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L437
	.size	parse_code, .-parse_code
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
