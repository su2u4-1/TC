	.file	"D:\\TC\\src\\parser.c"
	.text
	.section .rdata,"dr"
.LC0:
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
	jne	.L2
.L9:
	movq	(%rax), %rcx
	call	string_to_operator
	movl	%eax, %ecx
	movl	%eax, %edi
	call	operator_precedence
	movl	%eax, %esi
	cmpl	$19, %edi
	je	.L2
	cmpl	%r14d, %eax
	jl	.L2
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
	je	.L17
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %rbp
.L15:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	jne	.L5
	movq	(%rax), %rcx
	call	string_to_operator
	movl	%eax, %r15d
	movl	%eax, %ecx
	call	operator_precedence
	cmpl	$19, %r15d
	je	.L5
	cmpl	%eax, %esi
	jge	.L5
	movq	160(%rsp), %rdx
	movq	%r13, %r9
	movl	%eax, %r8d
	movq	%rbx, %rcx
	movq	%rdx, 32(%rsp)
	movq	%rbp, %rdx
	call	parse_expr_prec
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L15
	xorl	%r12d, %r12d
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L5:
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
	je	.L9
.L2:
	movq	%rbx, %rcx
	call	peek_current_token
.L1:
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
.L17:
	movq	160(%rsp), %rax
	xorl	%r12d, %r12d
	movq	(%rax), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC0(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L1
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "Failed to parse expression primary\0"
	.text
	.p2align 4
	.def	parse_expression;	.scl	3;	.type	32;	.endef
parse_expression:
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rdi
	movq	%r8, %rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	subq	$56, %rsp
	call	parse_primary
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L22
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
.L18:
	addq	$56, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L22:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rcx
	movq	%rax, %rdi
	call	peek_current_token
	movq	%rdi, %r8
	leaq	.LC1(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
	jmp	.L18
	.section .rdata,"dr"
.LC2:
	.ascii "Expected variable type\0"
	.align 8
.LC3:
	.ascii "Expected a type for variable declaration\0"
.LC4:
	.ascii "Unknown variable type\0"
.LC5:
	.ascii "Expected variable name\0"
	.align 8
.LC6:
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
	subq	$40, %rsp
	call	peek_current_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L24
	cmpl	$6, %eax
	jne	.L27
	movq	(%rbx), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L27
.L24:
	movq	(%rbx), %rdx
	movq	%rbp, %rcx
	call	search_name
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L28
	movl	32(%rax), %eax
	cmpl	$5, %eax
	je	.L29
	testl	%eax, %eax
	jne	.L52
.L29:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L53
.L30:
	movq	(%rbx), %rcx
	movq	%rbp, %r9
	movq	%rdi, %r8
	movl	$2, %edx
	call	create_symbol
	movl	$1, %edx
	movq	%rsi, %rcx
	movq	%rax, %rbx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	je	.L31
.L33:
	xorl	%esi, %esi
.L32:
	addq	$40, %rsp
	movq	%rsi, %r8
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
.L53:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC5(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L27:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
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
	.p2align 4,,10
	.p2align 3
.L52:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC3(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L31:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx
	movq	(%rax), %rcx
	movq	(%rdx), %rdx
	call	string_equal
	testb	%al, %al
	je	.L33
	movq	%rsi, %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rsi, %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rsi, %rcx
	movq	%r12, %r8
	movq	%rbp, %rdx
	movq	%rax, %r13
	call	parse_expression
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L32
	movq	(%r12), %rcx
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC6(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L32
	.p2align 4,,10
	.p2align 3
.L28:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC4(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L29
	.section .rdata,"dr"
	.align 8
.LC7:
	.ascii "Failed to parse parenthesized expression\0"
.LC8:
	.ascii "Expected ')' after expression\0"
	.align 8
.LC9:
	.ascii "Failed to parse operand of unary '!'\0"
	.align 8
.LC10:
	.ascii "Failed to parse operand of unary '-'\0"
	.align 8
.LC11:
	.ascii "Expected variable name in variable access\0"
	.align 8
.LC12:
	.ascii "Cannot call undefined variable\0"
	.align 8
.LC13:
	.ascii "Cannot call non-function variable\0"
	.align 8
.LC14:
	.ascii "Failed to parse function call argument\0"
	.align 8
.LC15:
	.ascii "Expected ',' or ')' after function call argument\0"
	.align 8
.LC16:
	.ascii "Failed to parse sequence index\0"
	.align 8
.LC17:
	.ascii "Expected ']' after sequence index\0"
	.align 8
.LC18:
	.ascii "Cannot access attribute without a valid scope\0"
	.align 8
.LC19:
	.ascii "Expected attribute name after '.'\0"
.LC20:
	.ascii "Unknown attribute name\0"
	.align 8
.LC21:
	.ascii "Failed to parse variable access\0"
	.align 8
.LC22:
	.ascii "Unexpected token in primary expression\0"
	.text
	.p2align 4
	.def	parse_primary;	.scl	3;	.type	32;	.endef
parse_primary:
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
	subq	$88, %rsp
	call	peek_current_token
	movq	%rax, %r14
	movl	24(%rax), %eax
	cmpl	$2, %eax
	je	.L168
	cmpl	$3, %eax
	je	.L169
	cmpl	$4, %eax
	je	.L170
	cmpl	$6, %eax
	je	.L171
.L59:
	cmpl	$5, %eax
	je	.L63
	cmpl	$1, %eax
	je	.L65
.L66:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%r14, %rdx
	leaq	.LC22(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L54
	.p2align 4,,10
	.p2align 3
.L169:
	movq	(%r14), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$1, %ebx
.L56:
	movq	%r10, 32(%rsp)
	movl	%ebx, %ecx
	call	create_primary
.L54:
	addq	$88, %rsp
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
.L168:
	movq	(%r14), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ebx, %ebx
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L170:
	movq	(%r14), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ebx
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L171:
	movq	.refptr.TRUE_KEYWORD(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L172
	movl	24(%r14), %eax
	cmpl	$6, %eax
	jne	.L59
	movq	.refptr.FALSE_KEYWORD(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L62
	movl	24(%r14), %eax
	cmpl	$5, %eax
	jne	.L74
	.p2align 4,,10
	.p2align 3
.L63:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r11
	movq	(%r14), %rcx
	movq	(%r11), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L173
	movl	24(%r14), %eax
	cmpl	$5, %eax
	jne	.L74
	movq	.refptr.NOT_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L174
	movl	24(%r14), %eax
	cmpl	$5, %eax
	jne	.L74
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L75
	movl	24(%r14), %eax
.L74:
	cmpl	$1, %eax
	je	.L65
	cmpl	$6, %eax
	jne	.L66
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L66
	cmpb	$0, 9(%rsi)
	je	.L66
.L65:
	movq	%rbx, %rcx
	call	peek_current_token
	movq	%rax, %rbp
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L78
	cmpl	$6, %eax
	jne	.L81
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L81
.L78:
	movq	0(%rbp), %rdx
	movq	%rdi, %rcx
	call	search_name
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
	movq	56(%rsp), %r10
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	jne	.L82
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r11
	movq	%r10, 64(%rsp)
	xorl	%r12d, %r12d
	xorl	%r13d, %r13d
	movq	%r14, 56(%rsp)
	movq	%rdi, %r14
	movq	%r11, 72(%rsp)
.L105:
	testq	%rbp, %rbp
	je	.L83
	movq	0(%rbp), %r12
	testq	%r12, %r12
	cmove	%rbp, %r12
.L83:
	testq	%r13, %r13
	jne	.L84
	testq	%r12, %r12
	je	.L84
	movl	32(%r12), %edx
	testl	%edx, %edx
	jne	.L84
	movq	8(%r12), %r13
.L84:
	movq	72(%rsp), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L175
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L98
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	movq	%rax, %r15
	call	parse_expression
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L176
.L99:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	jne	.L101
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L101
	movq	64(%rsp), %rdx
	movq	%rdi, %r9
	xorl	%r8d, %r8d
	movl	$3, %ecx
	movq	$0, 32(%rsp)
	call	create_variable_access
	movq	%rax, 64(%rsp)
.L97:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	je	.L105
.L163:
	movq	56(%rsp), %r14
	movq	64(%rsp), %r10
.L82:
	testq	%r10, %r10
	je	.L80
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$8, %ebx
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L98:
	movq	.refptr.DOT_SYMBOL(%rip), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L163
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
	testq	%r13, %r13
	je	.L177
	cmpl	$1, 24(%rax)
	jne	.L178
	movq	(%rax), %rdx
	movq	%r13, %rcx
	call	search_name
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L179
	movq	64(%rsp), %rdx
	xorl	%r9d, %r9d
	movq	%rax, %r8
	movl	$2, %ecx
	movq	$0, 32(%rsp)
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	call	create_variable_access
	movq	%rax, 64(%rsp)
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L175:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rdi
	testq	%rbp, %rbp
	je	.L180
	movl	32(%rbp), %eax
	testl	%eax, %eax
	je	.L181
.L88:
	cmpl	$1, %eax
	jne	.L182
.L87:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r15
	call	create_list
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rdi
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L90:
	cmpl	$5, 24(%r15)
	je	.L183
.L96:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L184
.L91:
	movq	%r13, %rdx
	movq	%r12, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	je	.L92
.L95:
	movq	(%rsi), %rcx
	movq	56(%rsp), %r14
	call	get_full_path
	movq	%r15, %rdx
	leaq	.LC15(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L80:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%r14, %rdx
	leaq	.LC21(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L54
	.p2align 4,,10
	.p2align 3
.L183:
	movq	(%rdi), %rdx
	movq	(%r15), %rcx
	call	string_equal
	testb	%al, %al
	je	.L96
	movq	%r12, 32(%rsp)
	movq	64(%rsp), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$1, %ecx
	call	create_variable_access
	movq	0(%rbp), %rbp
	movq	%rax, 64(%rsp)
	movl	32(%rbp), %eax
	testl	%eax, %eax
	jne	.L109
	movq	8(%rbp), %r13
	xorl	%r12d, %r12d
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L92:
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L185
	cmpl	$5, 24(%r15)
	jne	.L95
	movq	(%rdi), %rdx
	movq	(%r15), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L90
	jmp	.L95
	.p2align 4,,10
	.p2align 3
.L184:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%r15, %rdx
	leaq	.LC14(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L91
	.p2align 4,,10
	.p2align 3
.L185:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r15
	jmp	.L90
	.p2align 4,,10
	.p2align 3
.L182:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC13(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L87
	.p2align 4,,10
	.p2align 3
.L172:
	movq	(%r14), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$3, %ebx
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L62:
	movq	(%r14), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$4, %ebx
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L181:
	movq	.refptr.CONSTRUCTOR_NAME(%rip), %rax
	movq	8(%rbp), %rcx
	movq	(%rax), %rdx
	call	search_name
	movq	64(%rsp), %rdx
	xorl	%r9d, %r9d
	movq	$0, 32(%rsp)
	movq	%rax, %r8
	movl	$2, %ecx
	movq	%rax, %rbp
	call	create_variable_access
	movq	%rax, 64(%rsp)
	testq	%rbp, %rbp
	je	.L87
	movl	32(%rbp), %eax
	jmp	.L88
	.p2align 4,,10
	.p2align 3
.L81:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC11(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L176:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%r15, %rdx
	leaq	.LC16(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L173:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%rax, %rbp
	call	parse_expression
	testq	%rax, %rax
	je	.L186
	movq	%rbx, %rcx
	movl	$1, %edx
	movq	%rax, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r8
	movl	24(%rax), %ebx
	movq	%rax, %rdi
	cmpl	$5, %ebx
	jne	.L72
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rdi), %rcx
	movq	%r8, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L72
	movq	56(%rsp), %r8
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L174:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%rax, %rbp
	call	parse_primary
	movq	%rax, %r9
	testq	%rax, %rax
	je	.L187
	xorl	%r10d, %r10d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$6, %ebx
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L75:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%rax, %rbp
	call	parse_primary
	movq	%rax, %r9
	testq	%rax, %rax
	je	.L188
	xorl	%r10d, %r10d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$7, %ebx
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L180:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC12(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L87
.L72:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC8(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L54
.L109:
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	jmp	.L97
.L101:
	movq	(%rsi), %rcx
	movq	56(%rsp), %r14
	call	get_full_path
	movq	%r15, %rdx
	leaq	.LC17(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L80
.L178:
	movq	(%rsi), %rcx
	movq	56(%rsp), %r14
	call	get_full_path
	movq	%r12, %rdx
	leaq	.LC19(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L80
.L177:
	movq	(%rsi), %rcx
	movq	56(%rsp), %r14
	call	get_full_path
	movq	%r12, %rdx
	leaq	.LC18(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L80
.L179:
	movq	(%rsi), %rcx
	movq	56(%rsp), %r14
	call	get_full_path
	movq	%r12, %rdx
	leaq	.LC20(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L80
.L186:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC7(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L54
.L188:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC10(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L54
.L187:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC9(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L54
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
	je	.L361
.L190:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	$0, 40(%rsp)
	xorl	%ecx, %ecx
	movq	%rax, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
.L268:
	movq	%rbx, %rcx
	call	peek_current_token
	movq	%rax, %rdi
	testq	%rbp, %rbp
	je	.L362
.L276:
	movq	%rbx, %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L277
.L279:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC52(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L189:
	addq	$104, %rsp
	movq	%rbp, %rax
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
.L277:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L279
	jmp	.L189
	.p2align 4,,10
	.p2align 3
.L361:
	movq	%rax, %rbp
	movq	.refptr.IF_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L363
	movq	.refptr.FOR_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L364
	movq	.refptr.WHILE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L365
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L366
	movq	.refptr.RETURN_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L269
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	je	.L367
.L270:
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
	movq	%rax, %rbp
	jmp	.L268
	.p2align 4,,10
	.p2align 3
.L364:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L226
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L226
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L227
.L230:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_variable
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L368
.L229:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L231:
	cmpl	$5, 24(%rbp)
	jne	.L234
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %r14
	movq	0(%rbp), %rcx
	movq	(%r14), %rdx
	call	string_equal
	testb	%al, %al
	je	.L234
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L235
.L238:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L369
.L237:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L239:
	cmpl	$5, 24(%rbp)
	jne	.L241
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	je	.L241
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L242
.L245:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, 56(%rsp)
	testq	%rax, %rax
	je	.L370
.L244:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L246:
	cmpl	$5, 24(%rbp)
	jne	.L248
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L248
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L250
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L250
	call	create_list
	movb	$1, 10(%rsi)
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r15
	call	get_next_token
	movq	%r12, 64(%rsp)
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14
	movq	%rax, %rbp
	jmp	.L251
	.p2align 4,,10
	.p2align 3
.L252:
	movq	%r12, %rdx
	movq	%r15, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L251:
	cmpl	$5, 24(%rbp)
	jne	.L253
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L371
.L253:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L252
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC43(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L362:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC51(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L276
	.p2align 4,,10
	.p2align 3
.L363:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L194
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r12
	movq	(%rax), %rcx
	movq	(%r12), %rdx
	call	string_equal
	testb	%al, %al
	je	.L194
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%rax, %rbp
	call	parse_expression
	movq	%rax, 72(%rsp)
	testq	%rax, %rax
	je	.L372
.L195:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L197
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L197
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L199
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L199
	call	create_list
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r15
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14
	movq	%rax, %rbp
	jmp	.L200
	.p2align 4,,10
	.p2align 3
.L201:
	movq	%r13, %rdx
	movq	%r15, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L200:
	cmpl	$5, 24(%rbp)
	jne	.L202
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L373
.L202:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L201
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC27(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L201
	.p2align 4,,10
	.p2align 3
.L194:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC23(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L193:
	xorl	%edx, %edx
.L204:
	movq	$0, 40(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L189
	.p2align 4,,10
	.p2align 3
.L365:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L257
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L257
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%rax, %rbp
	call	parse_expression
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L374
.L258:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L261
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L261
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L263
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L263
	call	create_list
	movb	$1, 10(%rsi)
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r12
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14
	movq	%rax, %rbp
	jmp	.L264
	.p2align 4,,10
	.p2align 3
.L265:
	movq	%r15, %rdx
	movq	%r12, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L264:
	cmpl	$5, 24(%rbp)
	jne	.L266
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L375
.L266:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L265
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC48(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L265
	.p2align 4,,10
	.p2align 3
.L366:
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
	movq	%rax, %rbp
	jmp	.L268
	.p2align 4,,10
	.p2align 3
.L197:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC25(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L193
	.p2align 4,,10
	.p2align 3
.L226:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC35(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L225:
	xorl	%r9d, %r9d
.L233:
	movq	$0, 40(%rsp)
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$4, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L189
	.p2align 4,,10
	.p2align 3
.L257:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC44(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L256:
	xorl	%r8d, %r8d
.L260:
	movq	$0, 40(%rsp)
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$3, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L189
.L372:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC24(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L195
	.p2align 4,,10
	.p2align 3
.L269:
	movq	.refptr.BREAK_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L271
	cmpb	$0, 10(%rsi)
	je	.L376
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$6, %ecx
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L268
	.p2align 4,,10
	.p2align 3
.L234:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC37(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L225
.L199:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC26(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L193
.L373:
	call	create_list
	movq	%rax, 64(%rsp)
	call	create_list
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, 80(%rsp)
	call	peek_next_token
	cmpl	$6, 24(%rax)
	movq	%rax, %rbp
	jne	.L215
	movq	%r15, 88(%rsp)
	.p2align 4,,10
	.p2align 3
.L203:
	movq	.refptr.ELIF_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L377
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L206
	movq	(%r12), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	je	.L206
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%rax, %rbp
	call	parse_expression
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L378
.L207:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L209
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L209
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L211
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L211
	call	create_list
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r13
	call	get_next_token
	movq	%r15, 56(%rsp)
	movq	%rax, %rbp
	jmp	.L212
	.p2align 4,,10
	.p2align 3
.L213:
	movq	%r15, %rdx
	movq	%r13, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L212:
	cmpl	$5, 24(%rbp)
	jne	.L214
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L379
.L214:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L213
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC32(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L213
	.p2align 4,,10
	.p2align 3
.L379:
	movq	56(%rsp), %r15
	movq	%r13, %rdx
	movq	%r15, %rcx
	call	create_else_if
	movq	64(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	cmpl	$6, 24(%rax)
	movq	%rax, %rbp
	je	.L203
	movq	88(%rsp), %r15
.L215:
	movq	%rbx, %rcx
	call	peek_current_token
	movq	80(%rsp), %r9
	movq	64(%rsp), %r8
	movq	%r15, %rdx
	movq	72(%rsp), %rcx
	call	create_if
	movq	%rax, %rdx
	jmp	.L204
	.p2align 4,,10
	.p2align 3
.L378:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC29(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L207
.L227:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	xorl	%r12d, %r12d
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L231
	jmp	.L230
.L261:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC46(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L256
.L241:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC39(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L225
.L367:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rdx
	movq	(%rax), %rcx
	movq	(%rdx), %rdx
	call	string_equal
	testb	%al, %al
	je	.L270
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$5, %ecx
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L189
.L271:
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L190
	cmpb	$0, 10(%rsi)
	je	.L380
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$7, %ecx
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L268
.L235:
	movq	(%r14), %rdx
	movq	(%rax), %rcx
	xorl	%r13d, %r13d
	call	string_equal
	testb	%al, %al
	jne	.L239
	jmp	.L238
.L263:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC47(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L256
.L375:
	movb	$0, 10(%rsi)
	movq	%r12, %rdx
	movq	%r13, %rcx
	call	create_while
	movq	%rax, %r8
	jmp	.L260
.L368:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC36(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L229
.L248:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC41(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L225
.L374:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC45(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L258
.L206:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC28(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L193
.L209:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC30(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L193
.L211:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC31(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L193
.L242:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L245
	movq	$0, 56(%rsp)
	jmp	.L246
.L376:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC49(%rip), %rcx
	xorl	%ebp, %ebp
	movq	%rax, %r8
	call	parser_error
	jmp	.L189
.L369:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC38(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L237
.L250:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC42(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L225
.L371:
	movq	64(%rsp), %r12
	movb	$0, 10(%rsi)
	movq	%r15, %r9
	movq	%r13, %rdx
	movq	56(%rsp), %r8
	movq	%r12, %rcx
	call	create_for
	movq	%rax, %r9
	jmp	.L233
.L377:
	cmpl	$6, 24(%rbp)
	movq	88(%rsp), %r15
	jne	.L215
	movq	.refptr.ELSE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L215
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L218
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L218
	movl	$1, %edx
	movq	%rbx, %rcx
	leaq	.LC34(%rip), %r13
	call	get_next_token
	movq	%rax, %rbp
	jmp	.L219
	.p2align 4,,10
	.p2align 3
.L220:
	movq	80(%rsp), %rcx
	movq	%r12, %rdx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L219:
	cmpl	$5, 24(%rbp)
	jne	.L221
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L215
.L221:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L220
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	movq	%r13, %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L220
.L370:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC40(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L244
.L380:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC50(%rip), %rcx
	xorl	%ebp, %ebp
	movq	%rax, %r8
	call	parser_error
	jmp	.L189
.L218:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC33(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L193
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
	.ascii "Failed to import module '%s' from source '%s'\12\0"
	.align 8
.LC57:
	.ascii "Failed to parse import statement\0"
	.align 8
.LC58:
	.ascii "Expected function return type after 'func'\0"
.LC59:
	.ascii "Unknown function return type\0"
	.align 8
.LC60:
	.ascii "Expected function name after return type\0"
	.align 8
.LC61:
	.ascii "Expected '(' after function name\0"
	.align 8
.LC62:
	.ascii "Failed to parse function parameter\0"
	.align 8
.LC63:
	.ascii "Function parameters cannot have default values\0"
	.align 8
.LC64:
	.ascii "Expected ',' or ')' after function parameter\0"
	.align 8
.LC65:
	.ascii "Expected '{' to start function body\0"
	.align 8
.LC66:
	.ascii "Failed to parse function body statement\0"
	.align 8
.LC67:
	.ascii "Unreachable code after return statement\0"
	.align 8
.LC68:
	.ascii "Function missing return statement\0"
	.align 8
.LC69:
	.ascii "Failed to parse function declaration\0"
	.align 8
.LC70:
	.ascii "Expected class name after 'class'\0"
	.align 8
.LC71:
	.ascii "Expected '{' to start class body\0"
	.align 8
.LC72:
	.ascii "Expected method return type after 'method'\0"
	.align 8
.LC73:
	.ascii "Unknown return type for method\0"
	.align 8
.LC74:
	.ascii "Expected method name after return type\0"
	.align 8
.LC75:
	.ascii "Expected '(' after method name\0"
	.align 8
.LC76:
	.ascii "Expected 'self' as first parameter of method\0"
	.align 8
.LC77:
	.ascii "Expected ',' or ')' after method parameter\0"
	.align 8
.LC78:
	.ascii "Failed to parse method parameter\0"
	.align 8
.LC79:
	.ascii "Method parameters cannot have default values\0"
	.align 8
.LC80:
	.ascii "Expected '{' to start method body\0"
	.align 8
.LC82:
	.ascii "Failed to parse method body statement\0"
	.align 8
.LC83:
	.ascii "Method missing return statement\0"
.LC84:
	.ascii "Failed to parse class method\0"
	.align 8
.LC85:
	.ascii "Failed to parse class variable\0"
	.align 8
.LC86:
	.ascii "Expected ';' after class variable declaration\0"
	.align 8
.LC87:
	.ascii "Unexpected token in class member\0"
	.align 8
.LC88:
	.ascii "Constructor name conflicts with existing member\0"
	.align 8
.LC89:
	.ascii "Failed to parse class declaration\0"
	.align 8
.LC90:
	.ascii "Unexpected token in code member\0"
	.text
	.p2align 4
	.globl	parse_code
	.def	parse_code;	.scl	2;	.type	32;	.endef
parse_code:
	pushq	%r15
	pushq	%r14
	movq	%r8, %r14
	pushq	%r13
	movq	%rcx, %r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$152, %rsp
	movq	.refptr.builtin_scope(%rip), %rsi
	cmpq	$0, (%rsi)
	je	.L551
.L382:
	testq	%rbx, %rbx
	je	.L552
.L383:
	call	create_list
	movq	%rbx, %rcx
	movq	%rax, 72(%rsp)
	call	create_symbol_table
	movl	$1, %edx
	movq	%r13, %rcx
	movq	%rax, 64(%rsp)
	call	get_next_token
	movq	%rax, %r11
	testq	%rax, %rax
	je	.L474
	movq	%r14, %r12
	movq	.refptr.CLASS_KEYWORD(%rip), %r15
	movq	%r13, %r14
	jmp	.L384
	.p2align 4,,10
	.p2align 3
.L425:
	movq	(%r12), %rcx
	movq	%r11, 56(%rsp)
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC90(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L396:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %r11
	testq	%rax, %rax
	je	.L474
.L384:
	movl	24(%r11), %eax
	testl	%eax, %eax
	je	.L474
	cmpl	$6, %eax
	jne	.L425
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax
	movq	(%r11), %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	movl	%eax, %esi
	jne	.L553
	cmpl	$6, 24(%r11)
	jne	.L425
	movq	.refptr.FUNC_KEYWORD(%rip), %rax
	movq	(%r11), %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	jne	.L554
	cmpl	$6, 24(%r11)
	jne	.L425
	movq	(%r11), %rcx
	movq	(%r15), %rdx
	movq	%r11, 56(%rsp)
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	je	.L425
	movq	64(%rsp), %rcx
	call	create_symbol_table
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 80(%rsp)
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L555
	movq	(%rax), %rcx
	movq	80(%rsp), %r9
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%r11, 56(%rsp)
	call	create_symbol
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 96(%rsp)
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L429
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	je	.L429
	call	create_list
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 88(%rsp)
	call	get_next_token
	movq	56(%rsp), %r11
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rdi
	movq	%rax, %r10
	movq	%r11, 112(%rsp)
	jmp	.L430
	.p2align 4,,10
	.p2align 3
.L469:
	cmpl	$6, %eax
	je	.L556
.L431:
	movq	(%r12), %rcx
	movq	%r10, 56(%rsp)
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC87(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L465:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %r10
.L430:
	movl	24(%r10), %eax
	cmpl	$5, %eax
	jne	.L469
	movq	(%r10), %rcx
	movq	(%rdi), %rdx
	movq	%r10, 56(%rsp)
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	jne	.L470
	movl	24(%r10), %eax
	cmpl	$6, %eax
	jne	.L431
.L556:
	movq	.refptr.METHOD_KEYWORD(%rip), %rax
	movq	(%r10), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	jne	.L557
	cmpl	$6, 24(%r10)
	jne	.L431
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	(%r10), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L431
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	80(%rsp), %rdx
	movq	%r12, %r8
	movq	%r14, %rcx
	movq	%rax, %rbx
	call	parse_variable
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L558
.L466:
	movq	%rsi, %r8
	xorl	%edx, %edx
	movl	$1, %ecx
	call	create_class_member
	movq	88(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L467
.L468:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC86(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L465
	.p2align 4,,10
	.p2align 3
.L474:
	movq	64(%rsp), %rdx
	movq	72(%rsp), %rcx
	addq	$152, %rsp
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
.L553:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L559
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
	je	.L560
.L389:
	cmpl	$5, %eax
	jne	.L393
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	je	.L393
	movq	(%r12), %r9
	movq	64(%rsp), %r8
	movq	%rdi, %rcx
	movq	%rsi, %rdx
	call	parse_import_file
	movq	56(%rsp), %r11
	testq	%rax, %rax
	movq	%rax, %rcx
	je	.L561
.L394:
	movq	%rsi, %rdx
	movq	%r11, 56(%rsp)
	call	create_import
	movq	56(%rsp), %r11
	testq	%rax, %rax
	movq	%rax, %rdx
	je	.L388
.L395:
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	call	create_code_member
	movq	72(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L396
	.p2align 4,,10
	.p2align 3
.L554:
	movq	64(%rsp), %rcx
	call	create_symbol_table
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, %rdi
	call	get_next_token
	movq	56(%rsp), %r11
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L398
	cmpl	$6, %eax
	jne	.L401
	movq	(%rbx), %rcx
	movq	%r11, 56(%rsp)
	call	is_builtin_type
	movq	56(%rsp), %r11
	testb	%al, %al
	je	.L401
.L398:
	movq	(%rbx), %rdx
	movq	64(%rsp), %rcx
	movq	%r11, 56(%rsp)
	call	search_name
	movq	56(%rsp), %r11
	testq	%rax, %rax
	movq	%rax, 80(%rsp)
	je	.L562
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r11, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L563
	movq	(%rax), %rcx
	movq	80(%rsp), %r8
	movq	%rdi, %r9
	movl	$1, %edx
	movq	%r11, 56(%rsp)
	call	create_symbol
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 88(%rsp)
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L405
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	je	.L405
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r11, 96(%rsp)
	call	get_next_token
	movq	%rax, %rbx
	call	create_list
	movb	%sil, 104(%rsp)
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rbp
	movq	%rax, 56(%rsp)
	movq	.refptr.COMMA_SYMBOL(%rip), %r13
	movq	96(%rsp), %rsi
	.p2align 4,,10
	.p2align 3
.L406:
	cmpl	$5, 24(%rbx)
	je	.L564
.L414:
	movq	%r12, %r8
	movq	%rdi, %rdx
	movq	%r14, %rcx
	call	parse_variable
	testq	%rax, %rax
	je	.L565
	cmpq	$0, 16(%rax)
	je	.L409
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC63(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L408:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L410
.L413:
	movq	(%r12), %rcx
	movq	%rsi, 56(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC64(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r11
.L400:
	movq	(%r12), %rcx
	movq	%r11, 56(%rsp)
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC69(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%r8d, %r8d
.L424:
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	movl	$1, %ecx
	call	create_code_member
	movq	72(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L396
	.p2align 4,,10
	.p2align 3
.L429:
	movq	(%r12), %rcx
	movq	%r11, 56(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC71(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r11
.L427:
	movq	(%r12), %rcx
	movq	%r11, 56(%rsp)
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC89(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%r9d, %r9d
.L473:
	xorl	%edx, %edx
	xorl	%r8d, %r8d
	movl	$2, %ecx
	call	create_code_member
	movq	72(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L396
	.p2align 4,,10
	.p2align 3
.L557:
	movq	80(%rsp), %rcx
	call	create_symbol_table
	movq	96(%rsp), %r8
	movl	$2, %edx
	movq	%rax, %rsi
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	%rsi, %r9
	movq	(%rax), %rcx
	call	create_symbol
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, %r13
	call	get_next_token
	movq	56(%rsp), %r10
	movq	%rax, %rbp
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L433
	cmpl	$6, %eax
	jne	.L436
	movq	0(%rbp), %rcx
	movq	%r10, 56(%rsp)
	call	is_builtin_type
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L436
.L433:
	movq	0(%rbp), %rdx
	movq	80(%rsp), %rcx
	movq	%r10, 56(%rsp)
	call	search_name
	movq	56(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, 104(%rsp)
	je	.L566
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r10, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r10
	cmpl	$1, 24(%rax)
	movq	%rax, %rbp
	jne	.L567
	movq	(%rax), %rcx
	movq	104(%rsp), %r8
	movq	%rsi, %r9
	movl	$1, %edx
	movq	%r10, 56(%rsp)
	call	create_symbol
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 128(%rsp)
	call	get_next_token
	movq	56(%rsp), %r10
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L440
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L440
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	56(%rsp), %r10
	cmpl	$6, 24(%rax)
	movq	%rax, %rbp
	je	.L441
.L443:
	movq	(%r12), %rcx
	movq	%r10, 56(%rsp)
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC76(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r10
.L442:
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r10, 136(%rsp)
	call	get_next_token
	movq	%rax, %rbx
	call	create_list
	movq	96(%rsp), %rcx
	movq	%r13, %rdx
	xorl	%r8d, %r8d
	movq	%rax, %rbp
	movq	%rax, 120(%rsp)
	leaq	.LC79(%rip), %r13
	call	create_variable
	movq	%rbp, %rcx
	movq	%rax, %rdx
	call	list_append
	movq	%rsi, 56(%rsp)
	movq	.refptr.COMMA_SYMBOL(%rip), %rbp
	movq	136(%rsp), %rsi
	.p2align 4,,10
	.p2align 3
.L444:
	cmpl	$5, 24(%rbx)
	je	.L568
.L549:
	movq	%rsi, %r10
.L448:
	movq	(%r12), %rcx
	movq	%r10, 56(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC77(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L435
	.p2align 4,,10
	.p2align 3
.L552:
	movq	(%rsi), %rbx
	jmp	.L383
	.p2align 4,,10
	.p2align 3
.L470:
	movq	112(%rsp), %r11
	movq	80(%rsp), %rcx
	movq	%r10, 56(%rsp)
	movq	.refptr.CONSTRUCTOR_NAME(%rip), %rbx
	movq	%r11, 104(%rsp)
	movq	(%rbx), %rdx
	call	search_name
	movq	56(%rsp), %r10
	movq	104(%rsp), %r11
	testq	%rax, %rax
	je	.L569
.L471:
	cmpl	$1, 32(%rax)
	movq	%r10, 56(%rsp)
	jne	.L570
.L472:
	movq	80(%rsp), %r8
	movq	88(%rsp), %rdx
	movq	%r11, 56(%rsp)
	movq	96(%rsp), %rcx
	call	create_class
	movq	56(%rsp), %r11
	testq	%rax, %rax
	movq	%rax, %r9
	jne	.L473
	jmp	.L427
	.p2align 4,,10
	.p2align 3
.L467:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L468
	jmp	.L465
	.p2align 4,,10
	.p2align 3
.L555:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC70(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L427
	.p2align 4,,10
	.p2align 3
.L559:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC53(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r11
.L388:
	movq	(%r12), %rcx
	movq	%r11, 56(%rsp)
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC57(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%edx, %edx
	jmp	.L395
	.p2align 4,,10
	.p2align 3
.L570:
	movq	(%r12), %rcx
	movq	%r11, 104(%rsp)
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC88(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	104(%rsp), %r11
	jmp	.L472
	.p2align 4,,10
	.p2align 3
.L393:
	movq	(%r12), %rcx
	movq	%r11, 56(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC55(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L388
	.p2align 4,,10
	.p2align 3
.L405:
	movq	(%r12), %rcx
	movq	%r11, 56(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC61(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L400
	.p2align 4,,10
	.p2align 3
.L440:
	movq	(%r12), %rcx
	movq	%r10, 56(%rsp)
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC75(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r10
.L435:
	movq	(%r12), %rcx
	movq	%r10, 56(%rsp)
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC84(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%edx, %edx
.L464:
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	call	create_class_member
	movq	88(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L465
	.p2align 4,,10
	.p2align 3
.L564:
	movq	0(%rbp), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L414
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rsi, 96(%rsp)
	movzbl	104(%rsp), %esi
	call	get_next_token
	movq	96(%rsp), %r11
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L416
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	%r11, 96(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	96(%rsp), %r11
	testb	%al, %al
	je	.L416
	movq	%r11, 104(%rsp)
	movl	$1, %r13d
	call	create_list
	movb	$1, 8(%r12)
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 96(%rsp)
	call	get_next_token
	movq	104(%rsp), %r11
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rbp
	movq	%rax, %rbx
	movq	%r11, 112(%rsp)
	jmp	.L417
	.p2align 4,,10
	.p2align 3
.L420:
	cmpl	$5, 8(%r9)
	cmove	%r13d, %esi
.L421:
	movq	96(%rsp), %rcx
	movq	%r9, %rdx
	call	list_append
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
.L417:
	cmpl	$5, 24(%rbx)
	jne	.L422
	movq	0(%rbp), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L571
.L422:
	movq	%r12, %r8
	movq	%rdi, %rdx
	movq	%r14, %rcx
	call	parse_statement
	movq	%rax, %r9
	testq	%rax, %rax
	je	.L572
	testb	%sil, %sil
	je	.L420
	movq	(%r12), %rcx
	movq	%rax, 104(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC67(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	104(%rsp), %r9
	jmp	.L420
	.p2align 4,,10
	.p2align 3
.L409:
	movq	56(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L408
	.p2align 4,,10
	.p2align 3
.L410:
	movq	0(%r13), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L573
	cmpl	$5, 24(%rbx)
	jne	.L413
	movq	0(%rbp), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L406
	jmp	.L413
	.p2align 4,,10
	.p2align 3
.L568:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L574
	cmpl	$5, 24(%rbx)
	jne	.L549
	movq	0(%rbp), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L575
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	56(%rsp), %rdx
	movq	%r12, %r8
	movq	%r14, %rcx
	movq	%rax, %rbx
	call	parse_variable
	testq	%rax, %rax
	je	.L576
	cmpq	$0, 16(%rax)
	je	.L454
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	movq	%r13, %rcx
	movq	%rax, %r8
	call	parser_error
.L453:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L444
	.p2align 4,,10
	.p2align 3
.L454:
	movq	120(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L453
	.p2align 4,,10
	.p2align 3
.L565:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC62(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L408
	.p2align 4,,10
	.p2align 3
.L576:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC78(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L453
	.p2align 4,,10
	.p2align 3
.L551:
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
	jmp	.L382
	.p2align 4,,10
	.p2align 3
.L401:
	movq	(%r12), %rcx
	movq	%r11, 56(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC58(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L400
	.p2align 4,,10
	.p2align 3
.L436:
	movq	(%r12), %rcx
	movq	%r10, 56(%rsp)
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC72(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L435
	.p2align 4,,10
	.p2align 3
.L558:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC85(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L466
	.p2align 4,,10
	.p2align 3
.L573:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L406
.L563:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC60(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L400
.L567:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC74(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L435
.L560:
	movq	.refptr.FROM_KEYWORD(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	jne	.L390
	movl	24(%rbx), %eax
	jmp	.L389
.L575:
	cmpl	$5, 24(%rbx)
	movq	%rsi, %r10
	movq	56(%rsp), %rsi
	jne	.L448
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L448
.L456:
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r10, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r10
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L451
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L451
	movq	%r10, 136(%rsp)
	xorl	%ebp, %ebp
	call	create_list
	movl	$257, %edx
	movq	%r14, %rcx
	movw	%dx, 8(%r12)
	movl	$1, %edx
	movq	%rax, 56(%rsp)
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L457
	.p2align 4,,10
	.p2align 3
.L460:
	cmpl	$5, 8(%r13)
	movl	$1, %eax
	cmove	%eax, %ebp
.L461:
	movq	56(%rsp), %rcx
	movq	%r13, %rdx
	call	list_append
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
.L457:
	cmpl	$5, 24(%rbx)
	jne	.L462
	movq	(%rdi), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L577
.L462:
	movq	%r12, %r8
	movq	%rsi, %rdx
	movq	%r14, %rcx
	call	parse_statement
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L578
	testb	%bpl, %bpl
	je	.L460
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC67(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L460
.L569:
	movq	80(%rsp), %rcx
	call	create_symbol_table
	movq	(%rbx), %rcx
	movq	96(%rsp), %r8
	movl	$1, %edx
	movq	%rax, %r9
	call	create_symbol
	movq	104(%rsp), %r11
	movq	56(%rsp), %r10
	jmp	.L471
.L451:
	movq	(%r12), %rcx
	movq	%r10, 56(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC80(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L435
	.p2align 4,,10
	.p2align 3
.L578:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC82(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L461
.L441:
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L443
	jmp	.L442
.L561:
	call	__getreent
	movq	%rsi, %r9
	movq	%rdi, %r8
	leaq	.LC56(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	movq	.refptr.name_void(%rip), %rax
	movq	64(%rsp), %r9
	movq	%rdi, %rcx
	movl	$2, %edx
	movq	(%rax), %r8
	call	create_symbol
	movq	56(%rsp), %r11
	movq	%rax, %rcx
	jmp	.L394
.L577:
	xorl	%eax, %eax
	movq	136(%rsp), %r10
	movw	%ax, 8(%r12)
	testb	%bpl, %bpl
	jne	.L463
	movq	.refptr.name_void(%rip), %rax
	movq	104(%rsp), %rdx
	cmpq	(%rax), %rdx
	je	.L463
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC83(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	136(%rsp), %r10
.L463:
	movq	104(%rsp), %rdx
	movq	56(%rsp), %r9
	movq	%rsi, 32(%rsp)
	movq	120(%rsp), %r8
	movq	128(%rsp), %rcx
	movq	%r10, 136(%rsp)
	call	create_method
	movq	136(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, %rdx
	jne	.L464
	jmp	.L435
	.p2align 4,,10
	.p2align 3
.L562:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC59(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L400
.L566:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC73(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L435
.L572:
	movq	(%r12), %rcx
	movq	%rax, 104(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC66(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	104(%rsp), %r9
	jmp	.L421
.L390:
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r11, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$4, 24(%rax)
	movq	%rax, %rbx
	jne	.L579
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rsi
	call	get_next_token
	movq	56(%rsp), %r11
	movq	%rax, %rbx
	movl	24(%rax), %eax
	jmp	.L389
.L574:
	movq	%rsi, %r10
	movq	56(%rsp), %rsi
	jmp	.L456
.L416:
	movq	(%r12), %rcx
	movq	%r11, 56(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC65(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L400
.L571:
	movb	$0, 8(%r12)
	movq	112(%rsp), %r11
	testb	%sil, %sil
	jne	.L423
	movq	.refptr.name_void(%rip), %rax
	movq	80(%rsp), %rsi
	cmpq	(%rax), %rsi
	je	.L423
	movq	(%r12), %rcx
	movq	%r11, 104(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC68(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	104(%rsp), %r11
.L423:
	movq	56(%rsp), %r8
	movq	96(%rsp), %r9
	movq	%rdi, 32(%rsp)
	movq	80(%rsp), %rdx
	movq	88(%rsp), %rcx
	movq	%r11, 104(%rsp)
	call	create_function
	movq	104(%rsp), %r11
	testq	%rax, %rax
	movq	%rax, %r8
	jne	.L424
	jmp	.L400
	.p2align 4,,10
	.p2align 3
.L579:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC54(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L388
	.ident	"GCC: (GNU) 13.2.0"
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
	.def	get_full_path;	.scl	2;	.type	32;	.endef
	.def	parser_error;	.scl	2;	.type	32;	.endef
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.def	search_name;	.scl	2;	.type	32;	.endef
	.def	create_symbol;	.scl	2;	.type	32;	.endef
	.def	create_variable;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.def	create_else_if;	.scl	2;	.type	32;	.endef
	.def	create_if;	.scl	2;	.type	32;	.endef
	.def	create_while;	.scl	2;	.type	32;	.endef
	.def	create_for;	.scl	2;	.type	32;	.endef
	.def	create_symbol_table;	.scl	2;	.type	32;	.endef
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.def	create_code;	.scl	2;	.type	32;	.endef
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.def	create_import;	.scl	2;	.type	32;	.endef
	.def	create_code_member;	.scl	2;	.type	32;	.endef
	.def	create_class;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
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
