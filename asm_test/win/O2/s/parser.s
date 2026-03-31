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
	cmpl	$6, %eax
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
	movl	$3, %edx
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
	movq	%rdx, %rbp
	pushq	%rdi
	movq	%r8, %rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$88, %rsp
	call	peek_current_token
	movq	%rax, %rsi
	movl	24(%rax), %eax
	cmpl	$2, %eax
	je	.L176
	cmpl	$3, %eax
	je	.L177
	cmpl	$4, %eax
	je	.L178
	cmpl	$6, %eax
	je	.L179
.L59:
	cmpl	$5, %eax
	je	.L63
	cmpl	$1, %eax
	je	.L65
.L66:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC22(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L54
	.p2align 4,,10
	.p2align 3
.L177:
	movq	(%rsi), %rdx
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
.L176:
	movq	(%rsi), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ebx, %ebx
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L178:
	movq	(%rsi), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ebx
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L179:
	movq	.refptr.TRUE_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L180
	movl	24(%rsi), %eax
	cmpl	$6, %eax
	jne	.L59
	movq	.refptr.FALSE_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L62
	movl	24(%rsi), %eax
	cmpl	$5, %eax
	jne	.L74
	.p2align 4,,10
	.p2align 3
.L63:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r11
	movq	(%rsi), %rcx
	movq	(%r11), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L181
	movl	24(%rsi), %eax
	cmpl	$5, %eax
	jne	.L74
	movq	.refptr.NOT_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L182
	movl	24(%rsi), %eax
	cmpl	$5, %eax
	jne	.L74
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L75
	movl	24(%rsi), %eax
.L74:
	cmpl	$1, %eax
	je	.L65
	cmpl	$6, %eax
	jne	.L66
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L66
	cmpb	$0, 9(%rdi)
	je	.L66
.L65:
	movq	%rbx, %rcx
	call	peek_current_token
	movq	%rax, %r12
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L78
	cmpl	$6, %eax
	jne	.L81
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L81
.L78:
	movq	(%r12), %rdx
	movq	%rbp, %rcx
	call	search_name
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	$0, 32(%rsp)
	movq	%rax, %r8
	movq	%rax, %r15
	call	create_variable_access
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, 56(%rsp)
	call	peek_next_token
	movq	56(%rsp), %r10
	cmpl	$5, 24(%rax)
	movq	%rax, %r14
	jne	.L82
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r11
	movq	%r10, 64(%rsp)
	xorl	%r12d, %r12d
	xorl	%r13d, %r13d
	movq	%rsi, 56(%rsp)
	movq	%r15, %rsi
	movq	%r11, 72(%rsp)
.L108:
	testq	%rsi, %rsi
	je	.L83
	movq	(%rsi), %r12
	testq	%r12, %r12
	cmove	%rsi, %r12
.L83:
	testq	%r13, %r13
	jne	.L84
	testq	%r12, %r12
	je	.L84
	movl	32(%r12), %r8d
	testl	%r8d, %r8d
	jne	.L84
	movq	24(%r12), %rax
	movq	16(%rax), %r13
.L84:
	movq	72(%rsp), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L183
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L99
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movq	%rax, %r15
	call	parse_expression
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L184
.L100:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	jne	.L102
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L102
	movq	64(%rsp), %rdx
	movq	%r14, %r9
	xorl	%r8d, %r8d
	movl	$3, %ecx
	movq	$0, 32(%rsp)
	call	create_variable_access
	movq	%rax, 64(%rsp)
.L98:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r14
	je	.L108
.L170:
	movq	56(%rsp), %rsi
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
.L99:
	movq	.refptr.DOT_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L170
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r14
	testq	%r13, %r13
	je	.L185
	cmpl	$1, 24(%rax)
	jne	.L186
	movq	(%rax), %rdx
	movq	%r13, %rcx
	call	search_name
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L187
.L105:
	movq	64(%rsp), %rdx
	xorl	%r9d, %r9d
	movq	%rsi, %r8
	movl	$2, %ecx
	movq	$0, 32(%rsp)
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	call	create_variable_access
	movq	%rax, 64(%rsp)
	jmp	.L98
	.p2align 4,,10
	.p2align 3
.L183:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
	testq	%rsi, %rsi
	je	.L188
	movl	32(%rsi), %eax
	testl	%eax, %eax
	je	.L189
.L88:
	subl	$1, %eax
	cmpl	$1, %eax
	ja	.L190
.L87:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r15
	call	create_list
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r12
	movq	%rax, %r13
	.p2align 4,,10
	.p2align 3
.L91:
	cmpl	$5, 24(%r15)
	je	.L191
.L97:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L192
.L92:
	movq	%r14, %rdx
	movq	%r13, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	je	.L93
.L96:
	movq	(%rdi), %rcx
	movq	56(%rsp), %rsi
	call	get_full_path
	movq	%r15, %rdx
	leaq	.LC15(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L80:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC21(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L54
	.p2align 4,,10
	.p2align 3
.L191:
	movq	(%r12), %rdx
	movq	(%r15), %rcx
	call	string_equal
	testb	%al, %al
	je	.L97
	movq	%r13, 32(%rsp)
	movq	64(%rsp), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$1, %ecx
	call	create_variable_access
	movq	(%rsi), %rsi
	movq	%rax, 64(%rsp)
	movl	32(%rsi), %ecx
	testl	%ecx, %ecx
	jne	.L112
	movq	24(%rsi), %rax
	xorl	%r12d, %r12d
	movq	16(%rax), %r13
	jmp	.L98
	.p2align 4,,10
	.p2align 3
.L93:
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L193
	cmpl	$5, 24(%r15)
	jne	.L96
	movq	(%r12), %rdx
	movq	(%r15), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L91
	jmp	.L96
	.p2align 4,,10
	.p2align 3
.L192:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r15, %rdx
	leaq	.LC14(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L92
	.p2align 4,,10
	.p2align 3
.L193:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r15
	jmp	.L91
	.p2align 4,,10
	.p2align 3
.L187:
	testq	%r12, %r12
	je	.L106
	movl	32(%r12), %edx
	testl	%edx, %edx
	je	.L174
	movq	(%r12), %r12
	testq	%r12, %r12
	je	.L106
	movl	32(%r12), %eax
	testl	%eax, %eax
	je	.L174
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L106:
	movq	(%r14), %rdx
	movq	%r12, %rcx
	call	make_method_name
	movq	%r13, %rcx
	movq	%rax, %rdx
	call	search_name_use_strcmp
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L105
	movq	(%rdi), %rcx
	movq	56(%rsp), %rsi
	call	get_full_path
	movq	%r14, %rdx
	leaq	.LC20(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L180:
	movq	(%rsi), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$3, %ebx
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L62:
	movq	(%rsi), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$4, %ebx
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L190:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r12, %rdx
	leaq	.LC13(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L87
	.p2align 4,,10
	.p2align 3
.L189:
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax
	movq	8(%rsi), %rcx
	movq	(%rax), %rdx
	call	make_method_name
	movq	%rax, %rdx
	movq	24(%rsi), %rax
	movq	16(%rax), %rcx
	call	search_name_use_strcmp
	movq	64(%rsp), %rdx
	xorl	%r9d, %r9d
	movq	$0, 32(%rsp)
	movq	%rax, %r8
	movl	$2, %ecx
	movq	%rax, %rsi
	call	create_variable_access
	movq	%rax, 64(%rsp)
	testq	%rsi, %rsi
	je	.L87
	movl	32(%rsi), %eax
	jmp	.L88
	.p2align 4,,10
	.p2align 3
.L81:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r12, %rdx
	leaq	.LC11(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L174:
	movq	8(%r12), %r12
	jmp	.L106
	.p2align 4,,10
	.p2align 3
.L184:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r15, %rdx
	leaq	.LC16(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L100
	.p2align 4,,10
	.p2align 3
.L181:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movq	%rax, %rsi
	call	parse_expression
	testq	%rax, %rax
	je	.L194
	movq	%rbx, %rcx
	movl	$1, %edx
	movq	%rax, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r8
	movl	24(%rax), %ebx
	movq	%rax, %rsi
	cmpl	$5, %ebx
	jne	.L72
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
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
.L182:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movq	%rax, %rsi
	call	parse_primary
	movq	%rax, %r9
	testq	%rax, %rax
	je	.L195
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
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movq	%rax, %rsi
	call	parse_primary
	movq	%rax, %r9
	testq	%rax, %rax
	je	.L196
	xorl	%r10d, %r10d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$7, %ebx
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L188:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r12, %rdx
	leaq	.LC12(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L87
.L72:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC8(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L54
.L112:
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	jmp	.L98
.L102:
	movq	(%rdi), %rcx
	movq	56(%rsp), %rsi
	call	get_full_path
	movq	%r15, %rdx
	leaq	.LC17(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L80
.L185:
	movq	(%rdi), %rcx
	movq	56(%rsp), %rsi
	call	get_full_path
	movq	%r14, %rdx
	leaq	.LC18(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L80
.L186:
	movq	(%rdi), %rcx
	movq	56(%rsp), %rsi
	call	get_full_path
	movq	%r14, %rdx
	leaq	.LC19(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L80
.L194:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC7(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L54
.L195:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC9(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L54
.L196:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC10(%rip), %rcx
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
	je	.L369
.L198:
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
.L276:
	movq	%rbx, %rcx
	call	peek_current_token
	movq	%rax, %rdi
	testq	%rbp, %rbp
	je	.L370
.L284:
	movq	%rbx, %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L285
.L287:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC52(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L197:
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
.L285:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L287
	jmp	.L197
	.p2align 4,,10
	.p2align 3
.L369:
	movq	%rax, %rbp
	movq	.refptr.IF_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L371
	movq	.refptr.FOR_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L372
	movq	.refptr.WHILE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L373
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L374
	movq	.refptr.RETURN_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L277
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	je	.L375
.L278:
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
	jmp	.L276
	.p2align 4,,10
	.p2align 3
.L372:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L234
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
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
	call	parse_variable
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L376
.L237:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L239:
	cmpl	$5, 24(%rbp)
	jne	.L242
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %r14
	movq	0(%rbp), %rcx
	movq	(%r14), %rdx
	call	string_equal
	testb	%al, %al
	je	.L242
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L243
.L246:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L377
.L245:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L247:
	cmpl	$5, 24(%rbp)
	jne	.L249
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	je	.L249
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L250
.L253:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, 56(%rsp)
	testq	%rax, %rax
	je	.L378
.L252:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L254:
	cmpl	$5, 24(%rbp)
	jne	.L256
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L256
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L258
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L258
	call	create_list
	movb	$1, 10(%rsi)
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r15
	call	get_next_token
	movq	%r12, 64(%rsp)
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14
	movq	%rax, %rbp
	jmp	.L259
	.p2align 4,,10
	.p2align 3
.L260:
	movq	%r12, %rdx
	movq	%r15, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L259:
	cmpl	$5, 24(%rbp)
	jne	.L261
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L379
.L261:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L260
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC43(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L260
	.p2align 4,,10
	.p2align 3
.L370:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC51(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L284
	.p2align 4,,10
	.p2align 3
.L371:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L202
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r12
	movq	(%rax), %rcx
	movq	(%r12), %rdx
	call	string_equal
	testb	%al, %al
	je	.L202
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
	je	.L380
.L203:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L205
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L205
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L207
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L207
	call	create_list
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r15
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14
	movq	%rax, %rbp
	jmp	.L208
	.p2align 4,,10
	.p2align 3
.L209:
	movq	%r13, %rdx
	movq	%r15, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L208:
	cmpl	$5, 24(%rbp)
	jne	.L210
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L381
.L210:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L209
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC27(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L209
	.p2align 4,,10
	.p2align 3
.L202:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC23(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L201:
	xorl	%edx, %edx
.L212:
	movq	$0, 40(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L197
	.p2align 4,,10
	.p2align 3
.L373:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L265
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L265
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
	je	.L382
.L266:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L269
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L269
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L271
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L271
	call	create_list
	movb	$1, 10(%rsi)
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r12
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14
	movq	%rax, %rbp
	jmp	.L272
	.p2align 4,,10
	.p2align 3
.L273:
	movq	%r15, %rdx
	movq	%r12, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L272:
	cmpl	$5, 24(%rbp)
	jne	.L274
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L383
.L274:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L273
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC48(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L273
	.p2align 4,,10
	.p2align 3
.L374:
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
	jmp	.L276
	.p2align 4,,10
	.p2align 3
.L205:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC25(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L201
	.p2align 4,,10
	.p2align 3
.L234:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC35(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L233:
	xorl	%r9d, %r9d
.L241:
	movq	$0, 40(%rsp)
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$4, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L197
	.p2align 4,,10
	.p2align 3
.L265:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC44(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L264:
	xorl	%r8d, %r8d
.L268:
	movq	$0, 40(%rsp)
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$3, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L197
.L380:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC24(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L203
	.p2align 4,,10
	.p2align 3
.L277:
	movq	.refptr.BREAK_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L279
	cmpb	$0, 10(%rsi)
	je	.L384
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$6, %ecx
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L276
	.p2align 4,,10
	.p2align 3
.L242:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC37(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L233
.L207:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC26(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L201
.L381:
	call	create_list
	movq	%rax, 64(%rsp)
	call	create_list
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, 80(%rsp)
	call	peek_next_token
	cmpl	$6, 24(%rax)
	movq	%rax, %rbp
	jne	.L223
	movq	%r15, 88(%rsp)
	.p2align 4,,10
	.p2align 3
.L211:
	movq	.refptr.ELIF_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L385
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L214
	movq	(%r12), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	je	.L214
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
	je	.L386
.L215:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L217
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L217
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L219
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L219
	call	create_list
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r13
	call	get_next_token
	movq	%r15, 56(%rsp)
	movq	%rax, %rbp
	jmp	.L220
	.p2align 4,,10
	.p2align 3
.L221:
	movq	%r15, %rdx
	movq	%r13, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L220:
	cmpl	$5, 24(%rbp)
	jne	.L222
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L387
.L222:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L221
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC32(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L221
	.p2align 4,,10
	.p2align 3
.L387:
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
	je	.L211
	movq	88(%rsp), %r15
.L223:
	movq	%rbx, %rcx
	call	peek_current_token
	movq	80(%rsp), %r9
	movq	64(%rsp), %r8
	movq	%r15, %rdx
	movq	72(%rsp), %rcx
	call	create_if
	movq	%rax, %rdx
	jmp	.L212
	.p2align 4,,10
	.p2align 3
.L386:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC29(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L215
.L235:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	xorl	%r12d, %r12d
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L239
	jmp	.L238
.L269:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC46(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L264
.L249:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC39(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L233
.L375:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rdx
	movq	(%rax), %rcx
	movq	(%rdx), %rdx
	call	string_equal
	testb	%al, %al
	je	.L278
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$5, %ecx
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L197
.L279:
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L198
	cmpb	$0, 10(%rsi)
	je	.L388
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$7, %ecx
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L276
.L243:
	movq	(%r14), %rdx
	movq	(%rax), %rcx
	xorl	%r13d, %r13d
	call	string_equal
	testb	%al, %al
	jne	.L247
	jmp	.L246
.L271:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC47(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L264
.L383:
	movb	$0, 10(%rsi)
	movq	%r12, %rdx
	movq	%r13, %rcx
	call	create_while
	movq	%rax, %r8
	jmp	.L268
.L376:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC36(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L237
.L256:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC41(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L233
.L382:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC45(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L266
.L214:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC28(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L201
.L217:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC30(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L201
.L219:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC31(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L201
.L250:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L253
	movq	$0, 56(%rsp)
	jmp	.L254
.L384:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC49(%rip), %rcx
	xorl	%ebp, %ebp
	movq	%rax, %r8
	call	parser_error
	jmp	.L197
.L377:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC38(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L245
.L258:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC42(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L233
.L379:
	movq	64(%rsp), %r12
	movb	$0, 10(%rsi)
	movq	%r15, %r9
	movq	%r13, %rdx
	movq	56(%rsp), %r8
	movq	%r12, %rcx
	call	create_for
	movq	%rax, %r9
	jmp	.L241
.L385:
	cmpl	$6, 24(%rbp)
	movq	88(%rsp), %r15
	jne	.L223
	movq	.refptr.ELSE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L223
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L226
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L226
	movl	$1, %edx
	movq	%rbx, %rcx
	leaq	.LC34(%rip), %r13
	call	get_next_token
	movq	%rax, %rbp
	jmp	.L227
	.p2align 4,,10
	.p2align 3
.L228:
	movq	80(%rsp), %rcx
	movq	%r12, %rdx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L227:
	cmpl	$5, 24(%rbp)
	jne	.L229
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L223
.L229:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L228
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	movq	%r13, %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L228
.L378:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC40(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L252
.L388:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC50(%rip), %rcx
	xorl	%ebp, %ebp
	movq	%rax, %r8
	call	parser_error
	jmp	.L197
.L226:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC33(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L201
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
	.ascii "[warning] Unsupported type for class variable '%s': %s\12\0"
	.align 8
.LC87:
	.ascii "Expected ';' after class variable declaration\0"
	.align 8
.LC88:
	.ascii "Unexpected token in class member\0"
	.align 8
.LC89:
	.ascii "Constructor name conflicts with existing member\0"
.LC90:
	.ascii "0\0"
	.align 8
.LC91:
	.ascii "Failed to parse class declaration\0"
	.align 8
.LC92:
	.ascii "Unexpected token in code member\0"
	.text
	.p2align 4
	.globl	parse_code
	.def	parse_code;	.scl	2;	.type	32;	.endef
parse_code:
	pushq	%r15
	pushq	%r14
	movq	%rcx, %r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	movq	%r8, %rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$184, %rsp
	movq	.refptr.builtin_scope(%rip), %rsi
	cmpq	$0, (%rsi)
	je	.L581
.L390:
	testq	%rbx, %rbx
	je	.L582
.L391:
	call	create_list
	movq	%rbx, %rcx
	movq	%rax, 80(%rsp)
	call	create_symbol_table
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 72(%rsp)
	call	get_next_token
	movq	%rax, 56(%rsp)
	testq	%rax, %rax
	je	.L500
	movq	%rdi, %r15
	jmp	.L392
	.p2align 4,,10
	.p2align 3
.L433:
	movq	(%r15), %rcx
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC92(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L404:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, 56(%rsp)
	testq	%rax, %rax
	je	.L500
.L392:
	movq	56(%rsp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	je	.L500
	cmpl	$6, %eax
	jne	.L433
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	56(%rsp), %rax
	movq	(%rax), %rcx
	call	string_equal
	movl	%eax, %esi
	testb	%al, %al
	jne	.L583
	movq	56(%rsp), %rax
	cmpl	$6, 24(%rax)
	jne	.L433
	movq	.refptr.FUNC_KEYWORD(%rip), %rdi
	movq	(%rax), %rcx
	movq	(%rdi), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L584
	movq	56(%rsp), %rax
	cmpl	$6, 24(%rax)
	jne	.L433
	movq	.refptr.CLASS_KEYWORD(%rip), %rsi
	movq	(%rax), %rcx
	movq	(%rsi), %rdx
	call	string_equal
	testb	%al, %al
	je	.L433
	movq	72(%rsp), %rcx
	call	create_symbol_table
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 88(%rsp)
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L585
	movl	$32, %ecx
	call	alloc_memory
	movq	(%rbx), %rcx
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, %r9
	movq	%rax, 112(%rsp)
	movq	88(%rsp), %rax
	movq	%rax, 16(%r9)
	call	create_symbol
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 96(%rsp)
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L437
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L437
	call	create_list
	movl	$1, %edx
	movq	%r14, %rcx
	leaq	.LC88(%rip), %rsi
	movq	%rax, 104(%rsp)
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12
	movq	$0, 120(%rsp)
	movq	.refptr.SELF_KEYWORD(%rip), %rdi
	movq	%rax, %r10
	jmp	.L438
	.p2align 4,,10
	.p2align 3
.L486:
	cmpl	$6, %eax
	je	.L586
.L439:
	movq	(%r15), %rcx
	movq	%r10, 64(%rsp)
	call	get_full_path
	movq	64(%rsp), %rdx
	movq	%rsi, %rcx
	movq	%rax, %r8
	call	parser_error
.L483:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %r10
.L438:
	movl	24(%r10), %eax
	cmpl	$5, %eax
	jne	.L486
	movq	(%r10), %rcx
	movq	(%r12), %rdx
	movq	%r10, 64(%rsp)
	call	string_equal
	movq	64(%rsp), %r10
	testb	%al, %al
	jne	.L487
	movl	24(%r10), %eax
	cmpl	$6, %eax
	jne	.L439
.L586:
	movq	.refptr.METHOD_KEYWORD(%rip), %rax
	movq	(%r10), %rcx
	movq	%r10, 64(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	64(%rsp), %r10
	testb	%al, %al
	jne	.L587
	cmpl	$6, 24(%r10)
	jne	.L439
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	(%r10), %rcx
	movq	%r10, 64(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	64(%rsp), %r10
	testb	%al, %al
	je	.L439
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	88(%rsp), %rdx
	movq	%r15, %r8
	movq	%r14, %rcx
	movq	%rax, %rbx
	call	parse_variable
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L588
.L474:
	xorl	%edx, %edx
	movq	%rbp, %r8
	movl	$1, %ecx
	call	create_class_member
	movq	104(%rsp), %rcx
	movq	%rax, %rbx
	movq	%rax, %rdx
	call	list_append
	cmpl	$1, 8(%rbx)
	je	.L589
.L478:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L482
.L484:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC87(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L483
	.p2align 4,,10
	.p2align 3
.L500:
	movq	72(%rsp), %rdx
	movq	80(%rsp), %rcx
	addq	$184, %rsp
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
.L583:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L590
	movl	$1, %edx
	movq	%r14, %rcx
	movq	(%rax), %rdi
	xorl	%esi, %esi
	call	get_next_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$6, %eax
	je	.L591
.L397:
	cmpl	$5, %eax
	jne	.L401
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L401
	movq	(%r15), %r9
	movq	72(%rsp), %r8
	movq	%rdi, %rcx
	movq	%rsi, %rdx
	call	parse_import_file
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L592
.L402:
	movq	%rsi, %rdx
	call	create_import
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L396
.L403:
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	call	create_code_member
	movq	80(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L404
	.p2align 4,,10
	.p2align 3
.L584:
	movq	72(%rsp), %rcx
	call	create_symbol_table
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, %rdi
	call	get_next_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L406
	cmpl	$6, %eax
	jne	.L409
	movq	(%rbx), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L409
.L406:
	movq	(%rbx), %rdx
	movq	72(%rsp), %rcx
	call	search_name
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L593
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L594
	movl	$40, %ecx
	call	alloc_memory
	movq	(%rbx), %rcx
	movq	%rbp, %r8
	movl	$1, %edx
	movq	%rdi, 32(%rax)
	movq	%rax, %r9
	movq	%rax, 88(%rsp)
	call	create_symbol
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 96(%rsp)
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L413
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L413
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	call	create_list
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r12
	movq	.refptr.COMMA_SYMBOL(%rip), %r13
	movq	%rax, 64(%rsp)
	.p2align 4,,10
	.p2align 3
.L414:
	cmpl	$5, 24(%rbx)
	je	.L595
.L422:
	movq	%r15, %r8
	movq	%rdi, %rdx
	movq	%r14, %rcx
	call	parse_variable
	testq	%rax, %rax
	je	.L596
	cmpq	$0, 16(%rax)
	je	.L417
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC63(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L416:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L418
.L421:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC64(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L408:
	movq	(%r15), %rcx
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC69(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%r8d, %r8d
.L432:
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	movl	$1, %ecx
	call	create_code_member
	movq	80(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L404
	.p2align 4,,10
	.p2align 3
.L437:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC71(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L435:
	movq	(%r15), %rcx
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC91(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%r9d, %r9d
.L499:
	xorl	%edx, %edx
	xorl	%r8d, %r8d
	movl	$2, %ecx
	call	create_code_member
	movq	80(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L404
	.p2align 4,,10
	.p2align 3
.L587:
	movq	88(%rsp), %rcx
	call	create_symbol_table
	movq	(%rdi), %rcx
	movq	96(%rsp), %r8
	movl	$3, %edx
	movq	%rax, %r9
	movq	%rax, %rbp
	call	create_symbol
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, %rbx
	call	get_next_token
	movq	64(%rsp), %r10
	movq	%rax, %r13
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L441
	cmpl	$6, %eax
	jne	.L444
	movq	0(%r13), %rcx
	movq	%r10, 64(%rsp)
	call	is_builtin_type
	movq	64(%rsp), %r10
	testb	%al, %al
	je	.L444
.L441:
	movq	0(%r13), %rdx
	movq	88(%rsp), %rcx
	movq	%r10, 64(%rsp)
	call	search_name
	movq	64(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, 136(%rsp)
	je	.L597
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r10, 64(%rsp)
	call	get_next_token
	movq	64(%rsp), %r10
	cmpl	$1, 24(%rax)
	movq	%rax, %r13
	jne	.L598
	movl	$40, %ecx
	movq	%r10, 64(%rsp)
	call	alloc_memory
	movq	96(%rsp), %rcx
	movq	0(%r13), %rdx
	movq	%rbp, 32(%rax)
	movq	8(%rcx), %rcx
	movq	%rax, 152(%rsp)
	call	make_method_name
	movq	152(%rsp), %r9
	movl	$2, %edx
	movq	136(%rsp), %r8
	movq	%rax, %rcx
	call	create_symbol
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 160(%rsp)
	call	get_next_token
	movq	64(%rsp), %r10
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L448
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%r13), %rcx
	movq	%r10, 64(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	64(%rsp), %r10
	testb	%al, %al
	je	.L448
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	64(%rsp), %r10
	cmpl	$6, 24(%rax)
	movq	%rax, %r13
	je	.L449
.L451:
	movq	(%r15), %rcx
	movq	%r10, 64(%rsp)
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC76(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	64(%rsp), %r10
.L450:
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r10, 64(%rsp)
	call	get_next_token
	movq	%rax, %r13
	call	create_list
	movq	96(%rsp), %rcx
	movq	%rbx, %rdx
	xorl	%r8d, %r8d
	movq	%rax, 144(%rsp)
	movq	%r13, %rbx
	movq	%r12, %r13
	call	create_variable
	movq	144(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	64(%rsp), %r12
	.p2align 4,,10
	.p2align 3
.L452:
	cmpl	$5, 24(%rbx)
	je	.L599
.L577:
	movq	%r12, %r10
	movq	%r13, %r12
	movq	%rbx, %r13
.L456:
	movq	(%r15), %rcx
	movq	%r10, 64(%rsp)
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC77(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	64(%rsp), %r10
	jmp	.L443
	.p2align 4,,10
	.p2align 3
.L582:
	movq	(%rsi), %rbx
	jmp	.L391
	.p2align 4,,10
	.p2align 3
.L487:
	movq	.refptr.DEFAULT_INIT_NAME(%rip), %rax
	movq	%r10, 128(%rsp)
	movq	(%rax), %rdx
	movq	96(%rsp), %rax
	movq	8(%rax), %rcx
	call	make_method_name
	movq	88(%rsp), %rcx
	movq	%rax, %rdx
	movq	%rax, %rbx
	call	search_name_use_strcmp
	movq	128(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, 64(%rsp)
	je	.L600
.L488:
	movq	64(%rsp), %rax
	movq	%r10, 128(%rsp)
	cmpl	$2, 32(%rax)
	jne	.L601
.L489:
	movq	96(%rsp), %r13
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax
	movq	8(%r13), %rcx
	movq	(%rax), %rdx
	call	make_method_name
	movl	$40, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movq	88(%rsp), %rcx
	movq	%rax, %rbp
	call	create_symbol_table
	movq	%rbx, %rcx
	movq	%rbp, %r9
	movq	%r13, %r8
	movq	%rax, 32(%rbp)
	movl	$2, %edx
	call	create_symbol
	movq	%rax, 128(%rsp)
	call	create_list
	movq	32(%rbp), %r9
	movq	(%rdi), %rcx
	movq	%r13, %r8
	movl	$3, %edx
	movq	%rax, %rsi
	call	create_symbol
	xorl	%r8d, %r8d
	movq	%r13, %rcx
	movq	%rax, %rdx
	call	create_variable
	movq	%rsi, %rcx
	movq	%rax, %rdx
	call	list_append
	movq	64(%rsp), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rcx
	call	list_copy
	movq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L491:
	movq	%rbx, %rcx
	call	list_pop
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L602
.L492:
	movq	8(%r12), %rax
	movq	(%rdi), %rdx
	movq	8(%rax), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L491
	movq	8(%r12), %rdx
	movq	(%r12), %rcx
	xorl	%r8d, %r8d
	call	create_variable
	movq	%rsi, %rcx
	movq	%rax, %rdx
	call	list_append
	movq	%rbx, %rcx
	call	list_pop
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L492
.L602:
	call	create_list
	movq	104(%rsp), %rcx
	movq	%rax, %r13
	call	list_copy
	movq	%rax, %rbx
	jmp	.L494
	.p2align 4,,10
	.p2align 3
.L496:
	cmpl	$1, 8(%rdi)
	je	.L603
.L494:
	movq	%rbx, %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L496
	call	create_list
	movq	%rsi, %rcx
	movq	%rax, %r12
	call	list_copy
	movq	%rax, %rbx
	jmp	.L497
	.p2align 4,,10
	.p2align 3
.L498:
	movq	8(%rax), %r8
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	$0, 32(%rsp)
	call	create_variable_access
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	movl	$8, %ecx
	call	create_primary
	xorl	%edx, %edx
	movl	$19, %ecx
	xorl	%r9d, %r9d
	movq	%rax, %r8
	call	create_expression
	movq	%r12, %rcx
	movq	%rax, %rdx
	call	list_append
.L497:
	movq	%rbx, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L498
	movq	$0, 32(%rsp)
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	64(%rsp), %r8
	call	create_variable_access
	movq	%r12, 32(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_variable_access
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	movl	$8, %ecx
	call	create_primary
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_expression
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	$0, 40(%rsp)
	movl	$5, %ecx
	movq	%rax, 32(%rsp)
	call	create_statement
	movq	%r13, %rcx
	movq	%rax, %rdx
	call	list_append
	movq	32(%rbp), %rax
	movq	%rsi, %r9
	movq	%rbp, %rcx
	movq	96(%rsp), %rsi
	movq	%r13, 32(%rsp)
	movq	%rax, 40(%rsp)
	movq	128(%rsp), %rdx
	movq	%rsi, %r8
	call	create_method_use_ptr
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	xorl	%ecx, %ecx
	call	create_class_member
	movq	104(%rsp), %rdi
	movq	%rax, %rdx
	movq	%rdi, %rcx
	call	list_append
	movq	120(%rsp), %rax
	movq	%rdi, %r8
	movq	%rsi, %rdx
	movq	88(%rsp), %r9
	movq	112(%rsp), %rcx
	movq	%rax, 32(%rsp)
	call	create_class_use_ptr
	movq	%rax, %r9
	testq	%rax, %rax
	jne	.L499
	jmp	.L435
	.p2align 4,,10
	.p2align 3
.L603:
	movq	(%rdi), %rax
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	8(%rax), %r8
	movq	$0, 32(%rsp)
	call	create_variable_access
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	movl	$8, %ecx
	call	create_primary
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_expression
	movq	%rax, %r12
	movq	(%rdi), %rax
	movq	16(%rax), %r9
	testq	%r9, %r9
	je	.L604
.L495:
	xorl	%r8d, %r8d
	movq	%r12, %rdx
	movl	$13, %ecx
	call	create_expression
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	movq	$0, 40(%rsp)
	xorl	%r8d, %r8d
	movq	%rax, 32(%rsp)
	call	create_statement
	movq	%r13, %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L494
	.p2align 4,,10
	.p2align 3
.L482:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L484
	jmp	.L483
	.p2align 4,,10
	.p2align 3
.L589:
	movq	(%rbx), %rdx
	movq	.refptr.name_int(%rip), %rcx
	movq	(%rdx), %rax
	cmpq	(%rcx), %rax
	je	.L580
	movq	.refptr.name_float(%rip), %rcx
	cmpq	(%rcx), %rax
	je	.L580
	movq	.refptr.name_string(%rip), %rcx
	cmpq	(%rcx), %rax
	je	.L580
	movq	.refptr.name_bool(%rip), %rcx
	cmpq	(%rcx), %rax
	je	.L479
	movq	.refptr.name_void(%rip), %rcx
	cmpq	(%rcx), %rax
	je	.L479
	movl	32(%rax), %ecx
	testl	%ecx, %ecx
	je	.L580
	movq	8(%rax), %rbx
	movq	8(%rdx), %rax
	movq	8(%rax), %rbp
	call	__getreent
	movq	%rbx, %r9
	leaq	.LC86(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbp, %r8
	call	fprintf
	jmp	.L478
	.p2align 4,,10
	.p2align 3
.L580:
	addq	$8, 120(%rsp)
	jmp	.L478
	.p2align 4,,10
	.p2align 3
.L585:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC70(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L435
	.p2align 4,,10
	.p2align 3
.L590:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC53(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L396:
	movq	(%r15), %rcx
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC57(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%edx, %edx
	jmp	.L403
	.p2align 4,,10
	.p2align 3
.L601:
	movq	(%r15), %rcx
	call	get_full_path
	movq	128(%rsp), %rdx
	leaq	.LC89(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L489
	.p2align 4,,10
	.p2align 3
.L401:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC55(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L396
	.p2align 4,,10
	.p2align 3
.L413:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC61(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L408
	.p2align 4,,10
	.p2align 3
.L448:
	movq	(%r15), %rcx
	movq	%r10, 64(%rsp)
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC75(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	64(%rsp), %r10
.L443:
	movq	(%r15), %rcx
	movq	%r10, 64(%rsp)
	call	get_full_path
	movq	64(%rsp), %rdx
	leaq	.LC84(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%edx, %edx
.L472:
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	call	create_class_member
	movq	104(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L483
	.p2align 4,,10
	.p2align 3
.L595:
	movq	(%r12), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L422
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L424
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L424
	call	create_list
	movb	$1, 8(%r15)
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, %r12
	movl	$1, %r13d
	call	get_next_token
	movq	%rbp, 112(%rsp)
	movq	%rax, %rbx
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	%rax, %rbp
	jmp	.L425
	.p2align 4,,10
	.p2align 3
.L428:
	cmpl	$5, 8(%r9)
	cmove	%r13d, %esi
.L429:
	movq	%r9, %rdx
	movq	%r12, %rcx
	call	list_append
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
.L425:
	cmpl	$5, 24(%rbx)
	jne	.L430
	movq	0(%rbp), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L605
.L430:
	movq	%r15, %r8
	movq	%rdi, %rdx
	movq	%r14, %rcx
	call	parse_statement
	movq	%rax, %r9
	testq	%rax, %rax
	je	.L606
	testb	%sil, %sil
	je	.L428
	movq	(%r15), %rcx
	movq	%rax, 104(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC67(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	104(%rsp), %r9
	jmp	.L428
	.p2align 4,,10
	.p2align 3
.L417:
	movq	64(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L416
	.p2align 4,,10
	.p2align 3
.L418:
	movq	0(%r13), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L607
	cmpl	$5, 24(%rbx)
	jne	.L421
	movq	(%r12), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L414
	jmp	.L421
	.p2align 4,,10
	.p2align 3
.L599:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L608
	cmpl	$5, 24(%rbx)
	jne	.L577
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L609
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%r15, %r8
	movq	%rbp, %rdx
	movq	%r14, %rcx
	movq	%rax, %rbx
	call	parse_variable
	testq	%rax, %rax
	je	.L610
	cmpq	$0, 16(%rax)
	je	.L462
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC79(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L461:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L452
	.p2align 4,,10
	.p2align 3
.L462:
	movq	144(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L461
	.p2align 4,,10
	.p2align 3
.L596:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC62(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L416
	.p2align 4,,10
	.p2align 3
.L610:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC78(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L461
	.p2align 4,,10
	.p2align 3
.L581:
	xorl	%ecx, %ecx
	call	create_symbol_table
	xorl	%r8d, %r8d
	movl	$6, %edx
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
	movl	$6, %edx
	movq	(%rax), %rcx
	call	create_symbol
	movq	.refptr.name_int(%rip), %rdx
	movq	(%rsi), %r9
	xorl	%r8d, %r8d
	movq	%rax, (%rdx)
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	movl	$6, %edx
	movq	(%rax), %rcx
	call	create_symbol
	movq	.refptr.name_float(%rip), %rdx
	movq	(%rsi), %r9
	xorl	%r8d, %r8d
	movq	%rax, (%rdx)
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	movl	$6, %edx
	movq	(%rax), %rcx
	call	create_symbol
	movq	.refptr.name_string(%rip), %rdx
	movq	(%rsi), %r9
	xorl	%r8d, %r8d
	movq	%rax, (%rdx)
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	movl	$6, %edx
	movq	(%rax), %rcx
	call	create_symbol
	movq	.refptr.name_bool(%rip), %rdx
	movq	%rax, (%rdx)
	jmp	.L390
	.p2align 4,,10
	.p2align 3
.L409:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC58(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L408
	.p2align 4,,10
	.p2align 3
.L444:
	movq	(%r15), %rcx
	movq	%r10, 64(%rsp)
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC72(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	64(%rsp), %r10
	jmp	.L443
	.p2align 4,,10
	.p2align 3
.L588:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC85(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L474
	.p2align 4,,10
	.p2align 3
.L607:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L414
.L594:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC60(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L408
.L598:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC74(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	64(%rsp), %r10
	jmp	.L443
.L591:
	movq	.refptr.FROM_KEYWORD(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L398
.L579:
	movl	24(%rbx), %eax
	jmp	.L397
.L609:
	cmpl	$5, 24(%rbx)
	movq	%r12, %r10
	movq	%r13, %r12
	movq	%rbx, %r13
	jne	.L456
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	%r10, 64(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	64(%rsp), %r10
	testb	%al, %al
	je	.L456
.L464:
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r10, 64(%rsp)
	call	get_next_token
	movq	64(%rsp), %r10
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L459
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	%r10, 64(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	64(%rsp), %r10
	testb	%al, %al
	je	.L459
	movq	%r10, 128(%rsp)
	call	create_list
	movl	$257, %r9d
	movl	$1, %edx
	movq	%r14, %rcx
	movw	%r9w, 8(%r15)
	movq	%rax, 64(%rsp)
	call	get_next_token
	movq	128(%rsp), %r10
	xorl	%r11d, %r11d
	movq	%rbp, 128(%rsp)
	movq	%rax, %r13
	movl	%r11d, %ebx
	movq	%r10, 168(%rsp)
	jmp	.L465
	.p2align 4,,10
	.p2align 3
.L468:
	cmpl	$5, 8(%rbp)
	movl	$1, %eax
	cmove	%eax, %ebx
.L469:
	movq	64(%rsp), %rcx
	movq	%rbp, %rdx
	call	list_append
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %r13
.L465:
	cmpl	$5, 24(%r13)
	jne	.L470
	movq	(%r12), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L611
.L470:
	movq	128(%rsp), %rdx
	movq	%r15, %r8
	movq	%r14, %rcx
	call	parse_statement
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L612
	testb	%bl, %bl
	je	.L468
	movq	(%r15), %rcx
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC67(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L468
.L600:
	movl	$40, %ecx
	call	alloc_memory
	movq	88(%rsp), %rcx
	movq	%rax, %rsi
	call	create_symbol_table
	movq	96(%rsp), %r13
	movq	%rbx, %rcx
	movq	%rsi, %r9
	movq	%rax, 32(%rsi)
	movl	$2, %edx
	movq	%r13, %r8
	call	create_symbol
	movq	%rax, 64(%rsp)
	call	create_list
	movq	32(%rsi), %r9
	movq	(%rdi), %rcx
	movq	%r13, %r8
	movl	$3, %edx
	movq	%rax, %rbp
	call	create_symbol
	xorl	%r8d, %r8d
	movq	%r13, %rcx
	movq	%rax, %rdx
	movq	%rax, %r12
	call	create_variable
	movq	%rbp, %rcx
	movq	%rax, %rdx
	call	list_append
	call	create_list
	xorl	%r9d, %r9d
	movq	%r12, %r8
	xorl	%edx, %edx
	movq	$0, 32(%rsp)
	xorl	%ecx, %ecx
	movq	%rax, %rbx
	call	create_variable_access
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	movl	$8, %ecx
	call	create_primary
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_expression
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	$0, 40(%rsp)
	movl	$5, %ecx
	movq	%rax, 32(%rsp)
	call	create_statement
	movq	%rbx, %rcx
	movq	%rax, %rdx
	call	list_append
	movq	32(%rsi), %rax
	movq	%rbp, %r9
	movq	%r13, %r8
	movq	%rbx, 32(%rsp)
	movq	64(%rsp), %rdx
	movq	%rsi, %rcx
	movq	%rax, 40(%rsp)
	call	create_method_use_ptr
	xorl	%r8d, %r8d
	movq	%rsi, %rdx
	xorl	%ecx, %ecx
	call	create_class_member
	movq	104(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	128(%rsp), %r10
	jmp	.L488
.L459:
	movq	(%r15), %rcx
	movq	%r10, 64(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC80(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	64(%rsp), %r10
	jmp	.L443
.L479:
	addq	$1, 120(%rsp)
	jmp	.L478
	.p2align 4,,10
	.p2align 3
.L612:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC82(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L469
.L604:
	movl	$2, %edx
	leaq	.LC90(%rip), %rcx
	call	create_string
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movq	$0, 32(%rsp)
	movq	%rax, %rdx
	call	create_primary
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_expression
	movq	%rax, %r9
	jmp	.L495
.L449:
	movq	(%rdi), %rdx
	movq	(%rax), %rcx
	movq	%r10, 64(%rsp)
	call	string_equal
	movq	64(%rsp), %r10
	testb	%al, %al
	je	.L451
	jmp	.L450
.L611:
	xorl	%r8d, %r8d
	movq	168(%rsp), %r10
	movq	128(%rsp), %rbp
	movw	%r8w, 8(%r15)
	testb	%bl, %bl
	jne	.L471
	movq	.refptr.name_void(%rip), %rax
	movq	136(%rsp), %rbx
	cmpq	(%rax), %rbx
	je	.L471
	movq	(%r15), %rcx
	movq	%r10, 128(%rsp)
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC83(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	128(%rsp), %r10
.L471:
	movq	64(%rsp), %rax
	movq	%rbp, 40(%rsp)
	movq	160(%rsp), %rdx
	movq	144(%rsp), %r9
	movq	%r10, 128(%rsp)
	movq	%rax, 32(%rsp)
	movq	136(%rsp), %r8
	movq	152(%rsp), %rcx
	call	create_method_use_ptr
	movq	128(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, %rdx
	jne	.L472
	jmp	.L443
	.p2align 4,,10
	.p2align 3
.L592:
	call	__getreent
	movq	%rsi, %r9
	movq	%rdi, %r8
	leaq	.LC56(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	movq	.refptr.name_void(%rip), %rax
	movq	72(%rsp), %r9
	movq	%rdi, %rcx
	movl	$3, %edx
	movq	(%rax), %r8
	call	create_symbol
	movq	%rax, %rcx
	jmp	.L402
.L593:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC59(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L408
.L597:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC73(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	64(%rsp), %r10
	jmp	.L443
.L398:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	cmpl	$4, 24(%rax)
	movq	%rax, %rbx
	jne	.L613
	movl	$1, %edx
	movq	%r14, %rcx
	movq	(%rax), %rsi
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L579
.L606:
	movq	(%r15), %rcx
	movq	%rax, 104(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC66(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	104(%rsp), %r9
	jmp	.L429
.L608:
	movq	%r12, %r10
	movq	%r13, %r12
	jmp	.L464
.L605:
	movb	$0, 8(%r15)
	movq	112(%rsp), %rbp
	testb	%sil, %sil
	jne	.L431
	movq	.refptr.name_void(%rip), %rax
	cmpq	(%rax), %rbp
	je	.L431
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC68(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L431:
	movq	%rdi, 40(%rsp)
	movq	64(%rsp), %r9
	movq	%rbp, %r8
	movq	96(%rsp), %rdx
	movq	88(%rsp), %rcx
	movq	%r12, 32(%rsp)
	call	create_function_use_ptr
	movq	%rax, %r8
	testq	%rax, %rax
	jne	.L432
	jmp	.L408
	.p2align 4,,10
	.p2align 3
.L424:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC65(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L408
.L613:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC54(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L396
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
	.def	make_method_name;	.scl	2;	.type	32;	.endef
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.def	create_else_if;	.scl	2;	.type	32;	.endef
	.def	create_if;	.scl	2;	.type	32;	.endef
	.def	create_while;	.scl	2;	.type	32;	.endef
	.def	create_for;	.scl	2;	.type	32;	.endef
	.def	create_symbol_table;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.def	create_code;	.scl	2;	.type	32;	.endef
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.def	create_import;	.scl	2;	.type	32;	.endef
	.def	create_code_member;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	create_method_use_ptr;	.scl	2;	.type	32;	.endef
	.def	create_class_use_ptr;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	create_function_use_ptr;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.DEFAULT_INIT_NAME, "dr"
	.globl	.refptr.DEFAULT_INIT_NAME
	.linkonce	discard
.refptr.DEFAULT_INIT_NAME:
	.quad	DEFAULT_INIT_NAME
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
	.section	.rdata$.refptr.DEFAULT_CONSTRUCTOR_NAME, "dr"
	.globl	.refptr.DEFAULT_CONSTRUCTOR_NAME
	.linkonce	discard
.refptr.DEFAULT_CONSTRUCTOR_NAME:
	.quad	DEFAULT_CONSTRUCTOR_NAME
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
