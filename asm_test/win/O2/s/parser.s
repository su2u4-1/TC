	.file	"parser.c"
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
	movq	%rdx, %r12
	pushq	%rbp
	pushq	%rdi
	movq	%r8, %rdi
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
	movq	%r12, %rcx
	call	search_name
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L28
	movl	32(%rax), %eax
	cmpl	$6, %eax
	je	.L29
	testl	%eax, %eax
	jne	.L55
.L29:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L56
	cmpb	$0, 10(%rdi)
	movl	$3, %edx
	je	.L31
.L57:
	cmpb	$1, 9(%rdi)
	sbbl	%edx, %edx
	andl	$2, %edx
	addl	$3, %edx
.L31:
	movq	(%rbx), %rcx
	movq	%r12, %r9
	movq	%rbp, %r8
	call	create_symbol
	movl	$1, %edx
	movq	%rsi, %rcx
	movq	%rax, %rbx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	je	.L32
.L34:
	xorl	%esi, %esi
.L33:
	addq	$40, %rsp
	movq	%rsi, %r8
	movq	%rbx, %rdx
	movq	%rbp, %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	create_variable
	.p2align 4,,10
	.p2align 3
.L56:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC5(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	cmpb	$0, 10(%rdi)
	movl	$3, %edx
	je	.L31
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L27:
	movq	(%rdi), %rcx
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
.L55:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC3(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L32:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx
	movq	(%rax), %rcx
	movq	(%rdx), %rdx
	call	string_equal
	testb	%al, %al
	je	.L34
	movq	%rsi, %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rsi, %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rsi, %rcx
	movq	%rdi, %r8
	movq	%r12, %rdx
	movq	%rax, %r13
	call	parse_expression
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L33
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC6(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L28:
	movq	(%rdi), %rcx
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
	je	.L180
	cmpl	$3, %eax
	je	.L181
	cmpl	$4, %eax
	je	.L182
	cmpl	$6, %eax
	je	.L183
.L63:
	cmpl	$5, %eax
	je	.L67
	cmpl	$1, %eax
	je	.L69
.L70:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC22(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L58
	.p2align 4,,10
	.p2align 3
.L181:
	movq	(%rsi), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$1, %ebx
.L60:
	movq	%r10, 32(%rsp)
	movl	%ebx, %ecx
	call	create_primary
.L58:
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
.L180:
	movq	(%rsi), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ebx, %ebx
	jmp	.L60
	.p2align 4,,10
	.p2align 3
.L182:
	movq	(%rsi), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ebx
	jmp	.L60
	.p2align 4,,10
	.p2align 3
.L183:
	movq	.refptr.TRUE_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L184
	movl	24(%rsi), %eax
	cmpl	$6, %eax
	jne	.L63
	movq	.refptr.FALSE_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L66
	movl	24(%rsi), %eax
	cmpl	$5, %eax
	jne	.L78
	.p2align 4,,10
	.p2align 3
.L67:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r11
	movq	(%rsi), %rcx
	movq	(%r11), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L185
	movl	24(%rsi), %eax
	cmpl	$5, %eax
	jne	.L78
	movq	.refptr.NOT_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L186
	movl	24(%rsi), %eax
	cmpl	$5, %eax
	jne	.L78
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L79
	movl	24(%rsi), %eax
.L78:
	cmpl	$1, %eax
	je	.L69
	cmpl	$6, %eax
	jne	.L70
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L70
	cmpb	$0, 9(%rdi)
	je	.L70
.L69:
	movq	%rbx, %rcx
	call	peek_current_token
	movq	%rax, %r12
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L82
	cmpl	$6, %eax
	jne	.L85
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L85
.L82:
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
	jne	.L86
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r11
	movq	%r10, 64(%rsp)
	xorl	%r12d, %r12d
	xorl	%r13d, %r13d
	movq	%rsi, 56(%rsp)
	movq	%r15, %rsi
	movq	%r11, 72(%rsp)
.L112:
	testq	%rsi, %rsi
	je	.L87
	movq	(%rsi), %r12
	testq	%r12, %r12
	cmove	%rsi, %r12
.L87:
	testq	%r13, %r13
	jne	.L88
	testq	%r12, %r12
	je	.L88
	movl	32(%r12), %r8d
	testl	%r8d, %r8d
	jne	.L88
	movq	24(%r12), %rax
	movq	16(%rax), %r13
.L88:
	movq	72(%rsp), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L187
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L103
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
	je	.L188
.L104:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	jne	.L106
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L106
	movq	64(%rsp), %rdx
	movq	%r14, %r9
	xorl	%r8d, %r8d
	movl	$3, %ecx
	movq	$0, 32(%rsp)
	call	create_variable_access
	movq	%rax, 64(%rsp)
.L102:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r14
	je	.L112
.L174:
	movq	56(%rsp), %rsi
	movq	64(%rsp), %r10
.L86:
	testq	%r10, %r10
	je	.L84
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$8, %ebx
	jmp	.L60
	.p2align 4,,10
	.p2align 3
.L103:
	movq	.refptr.DOT_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L174
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r14
	testq	%r13, %r13
	je	.L189
	cmpl	$1, 24(%rax)
	jne	.L190
	movq	(%rax), %rdx
	movq	%r13, %rcx
	call	search_name
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L191
.L109:
	movq	64(%rsp), %rdx
	xorl	%r9d, %r9d
	movq	%rsi, %r8
	movl	$2, %ecx
	movq	$0, 32(%rsp)
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	call	create_variable_access
	movq	%rax, 64(%rsp)
	jmp	.L102
	.p2align 4,,10
	.p2align 3
.L187:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
	testq	%rsi, %rsi
	je	.L192
	movl	32(%rsi), %eax
	testl	%eax, %eax
	je	.L193
.L92:
	subl	$1, %eax
	cmpl	$1, %eax
	ja	.L194
.L91:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r15
	call	create_list
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r12
	movq	%rax, %r13
	.p2align 4,,10
	.p2align 3
.L95:
	cmpl	$5, 24(%r15)
	je	.L195
.L101:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L196
.L96:
	movq	%r14, %rdx
	movq	%r13, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	je	.L97
.L100:
	movq	(%rdi), %rcx
	movq	56(%rsp), %rsi
	call	get_full_path
	movq	%r15, %rdx
	leaq	.LC15(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L84:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC21(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L58
	.p2align 4,,10
	.p2align 3
.L195:
	movq	(%r12), %rdx
	movq	(%r15), %rcx
	call	string_equal
	testb	%al, %al
	je	.L101
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
	jne	.L116
	movq	24(%rsi), %rax
	xorl	%r12d, %r12d
	movq	16(%rax), %r13
	jmp	.L102
	.p2align 4,,10
	.p2align 3
.L97:
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L197
	cmpl	$5, 24(%r15)
	jne	.L100
	movq	(%r12), %rdx
	movq	(%r15), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L95
	jmp	.L100
	.p2align 4,,10
	.p2align 3
.L196:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r15, %rdx
	leaq	.LC14(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L96
	.p2align 4,,10
	.p2align 3
.L197:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r15
	jmp	.L95
	.p2align 4,,10
	.p2align 3
.L191:
	testq	%r12, %r12
	je	.L110
	movl	32(%r12), %edx
	testl	%edx, %edx
	je	.L178
	movq	(%r12), %r12
	testq	%r12, %r12
	je	.L110
	movl	32(%r12), %eax
	testl	%eax, %eax
	je	.L178
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L110:
	movq	(%r14), %rdx
	movq	%r12, %rcx
	call	make_method_name
	movq	%r13, %rcx
	movq	%rax, %rdx
	call	search_name_use_strcmp
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L109
	movq	(%rdi), %rcx
	movq	56(%rsp), %rsi
	call	get_full_path
	movq	%r14, %rdx
	leaq	.LC20(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L84
	.p2align 4,,10
	.p2align 3
.L184:
	movq	(%rsi), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$3, %ebx
	jmp	.L60
	.p2align 4,,10
	.p2align 3
.L66:
	movq	(%rsi), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$4, %ebx
	jmp	.L60
	.p2align 4,,10
	.p2align 3
.L194:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r12, %rdx
	leaq	.LC13(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L91
	.p2align 4,,10
	.p2align 3
.L193:
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
	je	.L91
	movl	32(%rsi), %eax
	jmp	.L92
	.p2align 4,,10
	.p2align 3
.L85:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r12, %rdx
	leaq	.LC11(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L84
	.p2align 4,,10
	.p2align 3
.L178:
	movq	8(%r12), %r12
	jmp	.L110
	.p2align 4,,10
	.p2align 3
.L188:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r15, %rdx
	leaq	.LC16(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L185:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movq	%rax, %rsi
	call	parse_expression
	testq	%rax, %rax
	je	.L198
	movq	%rbx, %rcx
	movl	$1, %edx
	movq	%rax, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r8
	movl	24(%rax), %ebx
	movq	%rax, %rsi
	cmpl	$5, %ebx
	jne	.L76
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	%r8, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L76
	movq	56(%rsp), %r8
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	jmp	.L60
	.p2align 4,,10
	.p2align 3
.L186:
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
	je	.L199
	xorl	%r10d, %r10d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$6, %ebx
	jmp	.L60
	.p2align 4,,10
	.p2align 3
.L79:
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
	je	.L200
	xorl	%r10d, %r10d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$7, %ebx
	jmp	.L60
	.p2align 4,,10
	.p2align 3
.L192:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r12, %rdx
	leaq	.LC12(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L91
.L76:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC8(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L58
.L116:
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	jmp	.L102
.L106:
	movq	(%rdi), %rcx
	movq	56(%rsp), %rsi
	call	get_full_path
	movq	%r15, %rdx
	leaq	.LC17(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L84
.L189:
	movq	(%rdi), %rcx
	movq	56(%rsp), %rsi
	call	get_full_path
	movq	%r14, %rdx
	leaq	.LC18(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L84
.L190:
	movq	(%rdi), %rcx
	movq	56(%rsp), %rsi
	call	get_full_path
	movq	%r14, %rdx
	leaq	.LC19(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L84
.L198:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC7(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L58
.L199:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC9(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L58
.L200:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC10(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L58
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
	je	.L373
.L202:
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
.L280:
	movq	%rbx, %rcx
	call	peek_current_token
	movq	%rax, %rdi
	testq	%rbp, %rbp
	je	.L374
.L288:
	movq	%rbx, %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L289
.L291:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC52(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L201:
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
.L289:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L291
	jmp	.L201
	.p2align 4,,10
	.p2align 3
.L373:
	movq	%rax, %rbp
	movq	.refptr.IF_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L375
	movq	.refptr.FOR_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L376
	movq	.refptr.WHILE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L377
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L378
	movq	.refptr.RETURN_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L281
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	je	.L379
.L282:
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
	jmp	.L280
	.p2align 4,,10
	.p2align 3
.L376:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L238
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L238
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L239
.L242:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_variable
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L380
.L241:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L243:
	cmpl	$5, 24(%rbp)
	jne	.L246
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %r14
	movq	0(%rbp), %rcx
	movq	(%r14), %rdx
	call	string_equal
	testb	%al, %al
	je	.L246
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L247
.L250:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L381
.L249:
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
	je	.L253
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L254
.L257:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, 56(%rsp)
	testq	%rax, %rax
	je	.L382
.L256:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L258:
	cmpl	$5, 24(%rbp)
	jne	.L260
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L260
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L262
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L262
	call	create_list
	movb	$1, 11(%rsi)
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r15
	call	get_next_token
	movq	%r12, 64(%rsp)
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14
	movq	%rax, %rbp
	jmp	.L263
	.p2align 4,,10
	.p2align 3
.L264:
	movq	%r12, %rdx
	movq	%r15, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L263:
	cmpl	$5, 24(%rbp)
	jne	.L265
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L383
.L265:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L264
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC43(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L264
	.p2align 4,,10
	.p2align 3
.L374:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC51(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L288
	.p2align 4,,10
	.p2align 3
.L375:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L206
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r12
	movq	(%rax), %rcx
	movq	(%r12), %rdx
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
	movq	%rax, 72(%rsp)
	testq	%rax, %rax
	je	.L384
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
	movq	%rax, %r15
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14
	movq	%rax, %rbp
	jmp	.L212
	.p2align 4,,10
	.p2align 3
.L213:
	movq	%r13, %rdx
	movq	%r15, %rcx
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
	jne	.L385
.L214:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L213
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC27(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L213
	.p2align 4,,10
	.p2align 3
.L206:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC23(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L205:
	xorl	%edx, %edx
.L216:
	movq	$0, 40(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L201
	.p2align 4,,10
	.p2align 3
.L377:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L269
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L269
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
	je	.L386
.L270:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L273
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L273
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L275
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L275
	call	create_list
	movb	$1, 11(%rsi)
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r12
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14
	movq	%rax, %rbp
	jmp	.L276
	.p2align 4,,10
	.p2align 3
.L277:
	movq	%r15, %rdx
	movq	%r12, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L276:
	cmpl	$5, 24(%rbp)
	jne	.L278
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L387
.L278:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L277
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC48(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L277
	.p2align 4,,10
	.p2align 3
.L378:
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
	jmp	.L280
	.p2align 4,,10
	.p2align 3
.L209:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC25(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L205
	.p2align 4,,10
	.p2align 3
.L238:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC35(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L237:
	xorl	%r9d, %r9d
.L245:
	movq	$0, 40(%rsp)
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$4, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L201
	.p2align 4,,10
	.p2align 3
.L269:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC44(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L268:
	xorl	%r8d, %r8d
.L272:
	movq	$0, 40(%rsp)
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$3, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L201
.L384:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC24(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L207
	.p2align 4,,10
	.p2align 3
.L281:
	movq	.refptr.BREAK_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L283
	cmpb	$0, 11(%rsi)
	je	.L388
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$6, %ecx
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L280
	.p2align 4,,10
	.p2align 3
.L246:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC37(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L237
.L211:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC26(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L205
.L385:
	call	create_list
	movq	%rax, 64(%rsp)
	call	create_list
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, 80(%rsp)
	call	peek_next_token
	cmpl	$6, 24(%rax)
	movq	%rax, %rbp
	jne	.L227
	movq	%r15, 88(%rsp)
	.p2align 4,,10
	.p2align 3
.L215:
	movq	.refptr.ELIF_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L389
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L218
	movq	(%r12), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	je	.L218
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
	je	.L390
.L219:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L221
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L221
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L223
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L223
	call	create_list
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r13
	call	get_next_token
	movq	%r15, 56(%rsp)
	movq	%rax, %rbp
	jmp	.L224
	.p2align 4,,10
	.p2align 3
.L225:
	movq	%r15, %rdx
	movq	%r13, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L224:
	cmpl	$5, 24(%rbp)
	jne	.L226
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L391
.L226:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L225
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC32(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L225
	.p2align 4,,10
	.p2align 3
.L391:
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
	je	.L215
	movq	88(%rsp), %r15
.L227:
	movq	%rbx, %rcx
	call	peek_current_token
	movq	80(%rsp), %r9
	movq	64(%rsp), %r8
	movq	%r15, %rdx
	movq	72(%rsp), %rcx
	call	create_if
	movq	%rax, %rdx
	jmp	.L216
	.p2align 4,,10
	.p2align 3
.L390:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC29(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L219
.L239:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	xorl	%r12d, %r12d
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L243
	jmp	.L242
.L273:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC46(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L268
.L253:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC39(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L237
.L379:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rdx
	movq	(%rax), %rcx
	movq	(%rdx), %rdx
	call	string_equal
	testb	%al, %al
	je	.L282
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$5, %ecx
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L201
.L283:
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L202
	cmpb	$0, 11(%rsi)
	je	.L392
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$7, %ecx
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L280
.L247:
	movq	(%r14), %rdx
	movq	(%rax), %rcx
	xorl	%r13d, %r13d
	call	string_equal
	testb	%al, %al
	jne	.L251
	jmp	.L250
.L275:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC47(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L268
.L387:
	movb	$0, 11(%rsi)
	movq	%r12, %rdx
	movq	%r13, %rcx
	call	create_while
	movq	%rax, %r8
	jmp	.L272
.L380:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC36(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L241
.L260:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC41(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L237
.L386:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC45(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L270
.L218:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC28(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L205
.L221:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC30(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L205
.L223:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC31(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L205
.L254:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L257
	movq	$0, 56(%rsp)
	jmp	.L258
.L388:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC49(%rip), %rcx
	xorl	%ebp, %ebp
	movq	%rax, %r8
	call	parser_error
	jmp	.L201
.L381:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC38(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L249
.L262:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC42(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L237
.L383:
	movq	64(%rsp), %r12
	movb	$0, 11(%rsi)
	movq	%r15, %r9
	movq	%r13, %rdx
	movq	56(%rsp), %r8
	movq	%r12, %rcx
	call	create_for
	movq	%rax, %r9
	jmp	.L245
.L389:
	cmpl	$6, 24(%rbp)
	movq	88(%rsp), %r15
	jne	.L227
	movq	.refptr.ELSE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L227
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L230
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L230
	movl	$1, %edx
	movq	%rbx, %rcx
	leaq	.LC34(%rip), %r13
	call	get_next_token
	movq	%rax, %rbp
	jmp	.L231
	.p2align 4,,10
	.p2align 3
.L232:
	movq	80(%rsp), %rcx
	movq	%r12, %rdx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L231:
	cmpl	$5, 24(%rbp)
	jne	.L233
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L227
.L233:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L232
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	movq	%r13, %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L232
.L382:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC40(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L256
.L392:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC50(%rip), %rcx
	xorl	%ebp, %ebp
	movq	%rax, %r8
	call	parser_error
	jmp	.L201
.L230:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC33(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L205
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
.LC56:
	.ascii "Failed to import module\0"
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
	.ascii "Unsupported type for class variable\0"
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
	subq	$168, %rsp
	movq	.refptr.builtin_scope(%rip), %rsi
	cmpq	$0, (%rsi)
	je	.L594
.L394:
	testq	%rbx, %rbx
	je	.L595
.L395:
	call	create_list
	movq	%rbx, %rcx
	movq	%rax, 72(%rsp)
	call	create_symbol_table
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 64(%rsp)
	call	get_next_token
	movq	%rax, 48(%rsp)
	testq	%rax, %rax
	je	.L512
	movq	%r14, %r15
	movq	%rdi, %r14
	jmp	.L396
	.p2align 4,,10
	.p2align 3
.L441:
	movq	(%r14), %rcx
	call	get_full_path
	movq	48(%rsp), %rdx
	leaq	.LC92(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L408:
	movl	$1, %edx
	movq	%r15, %rcx
	call	get_next_token
	movq	%rax, 48(%rsp)
	testq	%rax, %rax
	je	.L512
.L396:
	movq	48(%rsp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	je	.L512
	cmpl	$6, %eax
	jne	.L441
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	48(%rsp), %rax
	movq	(%rax), %rcx
	call	string_equal
	movl	%eax, %esi
	testb	%al, %al
	jne	.L596
	movq	48(%rsp), %rax
	cmpl	$6, 24(%rax)
	jne	.L441
	movq	.refptr.FUNC_KEYWORD(%rip), %rdi
	movq	(%rax), %rcx
	movq	(%rdi), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L597
	movq	48(%rsp), %rax
	cmpl	$6, 24(%rax)
	jne	.L441
	movq	.refptr.CLASS_KEYWORD(%rip), %rsi
	movq	(%rax), %rcx
	movq	(%rsi), %rdx
	call	string_equal
	testb	%al, %al
	je	.L441
	movq	64(%rsp), %rcx
	call	create_symbol_table
	movl	$1, %edx
	movq	%r15, %rcx
	movq	%rax, 80(%rsp)
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L598
	movl	$32, %ecx
	call	alloc_memory
	movq	(%rbx), %rcx
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, %r9
	movq	%rax, 112(%rsp)
	movq	80(%rsp), %rax
	movq	%rax, 16(%r9)
	call	create_symbol
	movl	$1, %edx
	movq	%r15, %rcx
	movq	%rax, 88(%rsp)
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L445
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L445
	call	create_list
	movl	$1, %edx
	movq	%r15, %rcx
	movq	%rax, 96(%rsp)
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12
	movq	$0, 120(%rsp)
	movq	.refptr.SELF_KEYWORD(%rip), %rdi
	movq	%rax, %r10
	jmp	.L446
	.p2align 4,,10
	.p2align 3
.L498:
	cmpl	$6, %eax
	je	.L599
.L447:
	movq	(%r14), %rcx
	movq	%r10, 56(%rsp)
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC88(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L495:
	movl	$1, %edx
	movq	%r15, %rcx
	call	get_next_token
	movq	%rax, %r10
.L446:
	movl	24(%r10), %eax
	cmpl	$5, %eax
	jne	.L498
	movq	(%r10), %rcx
	movq	(%r12), %rdx
	movq	%r10, 56(%rsp)
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	jne	.L499
	movl	24(%r10), %eax
	cmpl	$6, %eax
	jne	.L447
.L599:
	movq	.refptr.METHOD_KEYWORD(%rip), %rax
	movq	(%r10), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	jne	.L600
	cmpl	$6, 24(%r10)
	jne	.L447
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	(%r10), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L447
	movl	$1, %edx
	movq	%r15, %rcx
	call	get_next_token
	movb	$1, 10(%r14)
	movq	%r14, %r8
	movq	%r15, %rcx
	movq	80(%rsp), %rdx
	movq	%rax, %rbx
	call	parse_variable
	movb	$0, 10(%r14)
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L601
.L486:
	movq	%rsi, %r8
	xorl	%edx, %edx
	movl	$1, %ecx
	call	create_class_member
	movq	96(%rsp), %rcx
	movq	%rax, %rsi
	movq	%rax, %rdx
	call	list_append
	cmpl	$1, 8(%rsi)
	je	.L602
.L490:
	movl	$1, %edx
	movq	%r15, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L494
.L496:
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC87(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L495
	.p2align 4,,10
	.p2align 3
.L512:
	movq	64(%rsp), %rdx
	movq	72(%rsp), %rcx
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
.L596:
	movl	$1, %edx
	movq	%r15, %rcx
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L603
	movl	$1, %edx
	movq	%r15, %rcx
	movq	(%rax), %rdi
	xorl	%esi, %esi
	call	get_next_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$6, %eax
	je	.L604
.L401:
	cmpl	$5, %eax
	jne	.L405
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L405
	movq	(%r14), %r9
	movq	64(%rsp), %r8
	movq	%rdi, %rcx
	movq	%rsi, %rdx
	call	parse_import_file
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L605
.L406:
	movq	%rsi, %rdx
	call	create_import
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L400
.L407:
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	call	create_code_member
	movq	72(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L408
	.p2align 4,,10
	.p2align 3
.L597:
	movq	64(%rsp), %rcx
	call	create_symbol_table
	movl	$1, %edx
	movq	%r15, %rcx
	movq	%rax, %rdi
	call	get_next_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L410
	cmpl	$6, %eax
	jne	.L413
	movq	(%rbx), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L413
.L410:
	movq	(%rbx), %rdx
	movq	64(%rsp), %rcx
	call	search_name
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L606
	movl	$1, %edx
	movq	%r15, %rcx
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L607
	movl	$40, %ecx
	call	alloc_memory
	movq	(%rbx), %rcx
	movq	%rbp, %r8
	movl	$1, %edx
	movq	%rdi, 32(%rax)
	movq	%rax, %r9
	movq	%rax, 80(%rsp)
	call	create_symbol
	movl	$1, %edx
	movq	%r15, %rcx
	movq	%rax, 88(%rsp)
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L417
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L417
	movl	$1, %edx
	movq	%r15, %rcx
	call	get_next_token
	movq	%rax, %rbx
	call	create_list
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r12
	movq	.refptr.COMMA_SYMBOL(%rip), %r13
	movq	%rax, 56(%rsp)
	.p2align 4,,10
	.p2align 3
.L418:
	cmpl	$5, 24(%rbx)
	je	.L608
.L426:
	movq	%r14, %r8
	movq	%rdi, %rdx
	movq	%r15, %rcx
	call	parse_variable
	testq	%rax, %rax
	je	.L609
	cmpq	$0, 16(%rax)
	je	.L421
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC63(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L420:
	movl	$1, %edx
	movq	%r15, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L422
.L425:
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC64(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L412:
	movq	(%r14), %rcx
	call	get_full_path
	movq	48(%rsp), %rdx
	leaq	.LC69(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%r8d, %r8d
.L440:
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	movl	$1, %ecx
	call	create_code_member
	movq	72(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L408
	.p2align 4,,10
	.p2align 3
.L445:
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC71(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L443:
	movq	(%r14), %rcx
	call	get_full_path
	movq	48(%rsp), %rdx
	leaq	.LC91(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%r9d, %r9d
.L511:
	xorl	%edx, %edx
	xorl	%r8d, %r8d
	movl	$2, %ecx
	call	create_code_member
	movq	72(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L408
	.p2align 4,,10
	.p2align 3
.L600:
	movq	80(%rsp), %rcx
	call	create_symbol_table
	movq	(%rdi), %rcx
	movq	88(%rsp), %r8
	movl	$3, %edx
	movq	%rax, %r9
	movq	%rax, %rsi
	call	create_symbol
	movl	$1, %edx
	movq	%r15, %rcx
	movq	%rax, %r13
	call	get_next_token
	movq	56(%rsp), %r10
	movq	%rax, %rbp
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L449
	cmpl	$6, %eax
	jne	.L452
	movq	0(%rbp), %rcx
	movq	%r10, 56(%rsp)
	call	is_builtin_type
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L452
.L449:
	movq	0(%rbp), %rdx
	movq	80(%rsp), %rcx
	movq	%r10, 56(%rsp)
	call	search_name
	movq	56(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, 104(%rsp)
	je	.L610
	movl	$1, %edx
	movq	%r15, %rcx
	movq	%r10, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r10
	cmpl	$1, 24(%rax)
	movq	%rax, %rbp
	jne	.L611
	movl	$40, %ecx
	movq	%r10, 56(%rsp)
	call	alloc_memory
	movq	0(%rbp), %rdx
	movq	%rax, 136(%rsp)
	movq	%rax, %rbx
	movq	%rsi, 32(%rax)
	movq	88(%rsp), %rax
	movq	8(%rax), %rcx
	call	make_method_name
	movq	104(%rsp), %r8
	movq	%rbx, %r9
	movl	$2, %edx
	movq	%rax, %rcx
	call	create_symbol
	movl	$1, %edx
	movq	%r15, %rcx
	movq	%rax, 144(%rsp)
	call	get_next_token
	movq	56(%rsp), %r10
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L456
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L456
	movl	$1, %edx
	movq	%r15, %rcx
	call	get_next_token
	movq	56(%rsp), %r10
	cmpl	$6, 24(%rax)
	movq	%rax, %rbp
	je	.L457
.L459:
	movq	(%r14), %rcx
	movq	%r10, 56(%rsp)
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC76(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r10
.L458:
	movl	$1, %edx
	movq	%r15, %rcx
	movq	%r10, 152(%rsp)
	call	get_next_token
	movq	%rax, %rbx
	call	create_list
	movq	88(%rsp), %rcx
	movq	%r13, %rdx
	xorl	%r8d, %r8d
	movq	%rax, %rbp
	movq	%rax, 128(%rsp)
	leaq	.LC79(%rip), %r13
	call	create_variable
	movq	%rbp, %rcx
	movq	%rax, %rdx
	call	list_append
	movq	%rsi, 56(%rsp)
	movq	.refptr.COMMA_SYMBOL(%rip), %rbp
	movq	152(%rsp), %rsi
	.p2align 4,,10
	.p2align 3
.L460:
	cmpl	$5, 24(%rbx)
	je	.L612
.L589:
	movq	%rsi, %r10
.L464:
	movq	(%r14), %rcx
	movq	%r10, 56(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC77(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L451
	.p2align 4,,10
	.p2align 3
.L595:
	movq	(%rsi), %rbx
	jmp	.L395
	.p2align 4,,10
	.p2align 3
.L499:
	movq	.refptr.DEFAULT_INIT_NAME(%rip), %rax
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	movq	88(%rsp), %rax
	movq	8(%rax), %rcx
	call	make_method_name
	movq	80(%rsp), %rcx
	movq	%rax, %rdx
	movq	%rax, %rbx
	call	search_name_use_strcmp
	movq	56(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, 104(%rsp)
	je	.L613
.L500:
	movq	104(%rsp), %rax
	movq	%r10, 56(%rsp)
	cmpl	$2, 32(%rax)
	jne	.L614
.L501:
	movq	88(%rsp), %rbp
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax
	movq	8(%rbp), %rcx
	movq	(%rax), %rdx
	call	make_method_name
	movl	$40, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movq	80(%rsp), %rcx
	movq	%rax, %rsi
	call	create_symbol_table
	movq	%rbp, %r8
	movq	%rbx, %rcx
	movq	%rsi, %r9
	movq	%rax, 32(%rsi)
	movl	$2, %edx
	call	create_symbol
	movq	%rax, 128(%rsp)
	call	create_list
	movq	(%rdi), %rcx
	movq	32(%rsi), %r9
	movq	%rbp, %r8
	movl	$3, %edx
	movq	%rax, 56(%rsp)
	call	create_symbol
	movq	%rax, %rbp
	movq	104(%rsp), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rcx
	call	list_copy
	movq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L503:
	movq	%rbx, %rcx
	call	list_pop
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L615
.L504:
	movq	8(%r12), %rax
	movq	(%rdi), %rdx
	movq	8(%rax), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L503
	movq	8(%r12), %rdx
	movq	(%r12), %rcx
	xorl	%r8d, %r8d
	call	create_variable
	movq	56(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	%rbx, %rcx
	call	list_pop
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L504
.L615:
	call	create_list
	movq	96(%rsp), %rcx
	movq	%rax, %r13
	call	list_copy
	xorl	%r9d, %r9d
	movq	%rbp, %r8
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
.L593:
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
	jmp	.L506
	.p2align 4,,10
	.p2align 3
.L508:
	cmpl	$1, 8(%rdi)
	je	.L616
.L506:
	movq	%rbx, %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L508
	call	create_list
	movq	%rbp, %r8
	xorl	%r9d, %r9d
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
	movq	%rbx, %rcx
	movq	%rax, %rdx
	call	list_append
	movq	56(%rsp), %rcx
	call	list_copy
	movq	%rax, %rbp
	jmp	.L509
	.p2align 4,,10
	.p2align 3
.L510:
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
	movq	%rbx, %rcx
	movq	%rax, %rdx
	call	list_append
.L509:
	movq	%rbp, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L510
	movq	$0, 32(%rsp)
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	104(%rsp), %r8
	call	create_variable_access
	movq	%rbx, 32(%rsp)
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
	movq	32(%rsi), %rax
	movq	%rsi, %rcx
	movq	88(%rsp), %rdi
	movq	%r13, 32(%rsp)
	movq	56(%rsp), %r9
	movq	%rax, 40(%rsp)
	movq	128(%rsp), %rdx
	movq	%rdi, %r8
	call	create_method_use_ptr
	xorl	%r8d, %r8d
	movq	%rsi, %rdx
	xorl	%ecx, %ecx
	call	create_class_member
	movq	96(%rsp), %rsi
	movq	%rax, %rdx
	movq	%rsi, %rcx
	call	list_append
	movq	120(%rsp), %rax
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	80(%rsp), %r9
	movq	112(%rsp), %rcx
	movq	%rax, 32(%rsp)
	call	create_class_use_ptr
	movq	%rax, %r9
	testq	%rax, %rax
	jne	.L511
	jmp	.L443
	.p2align 4,,10
	.p2align 3
.L616:
	movq	(%rdi), %rax
	xorl	%r9d, %r9d
	movq	%rbp, %r8
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	8(%rax), %r12
	movq	$0, 32(%rsp)
	call	create_variable_access
	movq	%r12, %r8
	xorl	%r9d, %r9d
	movl	$2, %ecx
	movq	$0, 32(%rsp)
	movq	%rax, %rdx
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
	je	.L617
.L507:
	xorl	%r8d, %r8d
	movq	%r12, %rdx
	movl	$13, %ecx
	jmp	.L593
	.p2align 4,,10
	.p2align 3
.L494:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L496
	jmp	.L495
	.p2align 4,,10
	.p2align 3
.L602:
	movq	(%rsi), %rax
	movq	.refptr.name_int(%rip), %rdx
	movq	(%rax), %rax
	cmpq	(%rdx), %rax
	je	.L592
	movq	.refptr.name_float(%rip), %rdx
	cmpq	(%rdx), %rax
	je	.L592
	movq	.refptr.name_string(%rip), %rdx
	cmpq	(%rdx), %rax
	je	.L592
	movq	.refptr.name_bool(%rip), %rdx
	cmpq	(%rdx), %rax
	je	.L491
	movq	.refptr.name_void(%rip), %rdx
	cmpq	(%rdx), %rax
	je	.L491
	movl	32(%rax), %eax
	testl	%eax, %eax
	je	.L592
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC86(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L490
	.p2align 4,,10
	.p2align 3
.L592:
	addq	$8, 120(%rsp)
	jmp	.L490
	.p2align 4,,10
	.p2align 3
.L598:
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC70(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L443
	.p2align 4,,10
	.p2align 3
.L603:
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC53(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L400:
	movq	(%r14), %rcx
	call	get_full_path
	movq	48(%rsp), %rdx
	leaq	.LC57(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%edx, %edx
	jmp	.L407
	.p2align 4,,10
	.p2align 3
.L614:
	movq	(%r14), %rcx
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC89(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L501
	.p2align 4,,10
	.p2align 3
.L405:
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC55(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L400
	.p2align 4,,10
	.p2align 3
.L417:
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC61(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L412
	.p2align 4,,10
	.p2align 3
.L456:
	movq	(%r14), %rcx
	movq	%r10, 56(%rsp)
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC75(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r10
.L451:
	movq	(%r14), %rcx
	movq	%r10, 56(%rsp)
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC84(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%edx, %edx
.L484:
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	call	create_class_member
	movq	96(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L495
	.p2align 4,,10
	.p2align 3
.L608:
	movq	(%r12), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L426
	movl	$1, %edx
	movq	%r15, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L428
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L428
	call	create_list
	movb	$1, 8(%r14)
	movl	$1, %edx
	movq	%r15, %rcx
	movq	%rax, 96(%rsp)
	movl	$1, %r13d
	call	get_next_token
	movq	%rbp, 104(%rsp)
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12
	movq	%rax, %rbx
	jmp	.L429
	.p2align 4,,10
	.p2align 3
.L432:
	cmpl	$5, 8(%rbp)
	cmove	%r13d, %esi
.L433:
	movq	96(%rsp), %rcx
	movq	%rbp, %rdx
	call	list_append
	movl	$1, %edx
	movq	%r15, %rcx
	call	get_next_token
	movq	%rax, %rbx
.L429:
	cmpl	$5, 24(%rbx)
	jne	.L434
	movq	(%r12), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L618
.L434:
	movq	%r14, %r8
	movq	%rdi, %rdx
	movq	%r15, %rcx
	call	parse_statement
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L619
	testb	%sil, %sil
	je	.L432
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC67(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L432
	.p2align 4,,10
	.p2align 3
.L421:
	movq	56(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L420
	.p2align 4,,10
	.p2align 3
.L422:
	movq	0(%r13), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L620
	cmpl	$5, 24(%rbx)
	jne	.L425
	movq	(%r12), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L418
	jmp	.L425
	.p2align 4,,10
	.p2align 3
.L612:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L621
	cmpl	$5, 24(%rbx)
	jne	.L589
	movq	0(%rbp), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L622
	movl	$1, %edx
	movq	%r15, %rcx
	call	get_next_token
	movq	56(%rsp), %rdx
	movq	%r14, %r8
	movq	%r15, %rcx
	movq	%rax, %rbx
	call	parse_variable
	testq	%rax, %rax
	je	.L623
	cmpq	$0, 16(%rax)
	je	.L470
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	movq	%r13, %rcx
	movq	%rax, %r8
	call	parser_error
.L469:
	movl	$1, %edx
	movq	%r15, %rcx
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L460
	.p2align 4,,10
	.p2align 3
.L470:
	movq	128(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L469
	.p2align 4,,10
	.p2align 3
.L609:
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC62(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L420
	.p2align 4,,10
	.p2align 3
.L623:
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC78(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L469
	.p2align 4,,10
	.p2align 3
.L594:
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
	jmp	.L394
	.p2align 4,,10
	.p2align 3
.L413:
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC58(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L412
	.p2align 4,,10
	.p2align 3
.L452:
	movq	(%r14), %rcx
	movq	%r10, 56(%rsp)
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC72(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L451
	.p2align 4,,10
	.p2align 3
.L601:
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC85(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L486
	.p2align 4,,10
	.p2align 3
.L620:
	movl	$1, %edx
	movq	%r15, %rcx
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L418
.L607:
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC60(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L412
.L611:
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC74(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L451
.L604:
	movq	.refptr.FROM_KEYWORD(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L402
.L591:
	movl	24(%rbx), %eax
	jmp	.L401
.L622:
	cmpl	$5, 24(%rbx)
	movq	%rsi, %r10
	movq	56(%rsp), %rsi
	jne	.L464
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L464
.L472:
	movl	$1, %edx
	movq	%r15, %rcx
	movq	%r10, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r10
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L467
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L467
	movq	%r10, 152(%rsp)
	xorl	%ebp, %ebp
	call	create_list
	movl	$257, %ecx
	movl	$1, %edx
	movw	%cx, 8(%r14)
	movq	%r15, %rcx
	movq	%rax, 56(%rsp)
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L473
	.p2align 4,,10
	.p2align 3
.L476:
	cmpl	$5, 8(%r13)
	movl	$1, %eax
	cmove	%eax, %ebp
.L477:
	movq	56(%rsp), %rcx
	movq	%r13, %rdx
	call	list_append
	movl	$1, %edx
	movq	%r15, %rcx
	call	get_next_token
	movq	%rax, %rbx
.L473:
	cmpl	$5, 24(%rbx)
	jne	.L478
	movq	(%r12), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L624
.L478:
	movq	%r14, %r8
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	parse_statement
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L625
	testb	%bpl, %bpl
	je	.L476
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC67(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L476
.L613:
	movl	$40, %ecx
	call	alloc_memory
	movq	80(%rsp), %rcx
	movq	%rax, %rbp
	call	create_symbol_table
	movq	88(%rsp), %r13
	movq	%rbx, %rcx
	movq	%rbp, %r9
	movq	%rax, 32(%rbp)
	movl	$2, %edx
	movq	%r13, %r8
	call	create_symbol
	movq	%rax, 104(%rsp)
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
	movq	%rax, %r12
	call	create_variable
	movq	%rsi, %rcx
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
	movq	32(%rbp), %rax
	movq	%rsi, %r9
	movq	%r13, %r8
	movq	%rbx, 32(%rsp)
	movq	104(%rsp), %rdx
	movq	%rbp, %rcx
	movq	%rax, 40(%rsp)
	call	create_method_use_ptr
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	xorl	%ecx, %ecx
	call	create_class_member
	movq	96(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	56(%rsp), %r10
	jmp	.L500
.L467:
	movq	(%r14), %rcx
	movq	%r10, 56(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC80(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L451
.L491:
	addq	$1, 120(%rsp)
	jmp	.L490
	.p2align 4,,10
	.p2align 3
.L625:
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC82(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L477
.L617:
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
	jmp	.L507
.L457:
	movq	(%rdi), %rdx
	movq	(%rax), %rcx
	movq	%r10, 56(%rsp)
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L459
	jmp	.L458
.L624:
	xorl	%edx, %edx
	movq	152(%rsp), %r10
	movw	%dx, 8(%r14)
	testb	%bpl, %bpl
	jne	.L480
	movq	.refptr.name_void(%rip), %rbp
	movq	104(%rsp), %rax
	cmpq	0(%rbp), %rax
	je	.L482
	movq	(%r14), %rcx
	movq	%r10, 152(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC83(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	104(%rsp), %rax
	cmpq	0(%rbp), %rax
	movq	152(%rsp), %r10
	je	.L482
.L480:
	movq	56(%rsp), %rax
	movq	%rsi, 40(%rsp)
	movq	144(%rsp), %rdx
	movq	128(%rsp), %r9
	movq	%r10, 152(%rsp)
	movq	%rax, 32(%rsp)
	movq	104(%rsp), %r8
	movq	136(%rsp), %rcx
	call	create_method_use_ptr
	movq	152(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, %rdx
	jne	.L484
	jmp	.L451
	.p2align 4,,10
	.p2align 3
.L605:
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC56(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	.refptr.name_void(%rip), %rax
	movq	64(%rsp), %r9
	movq	%rdi, %rcx
	movl	$3, %edx
	movq	(%rax), %r8
	call	create_symbol
	movq	%rax, %rcx
	jmp	.L406
.L606:
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC59(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L412
.L610:
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC73(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L451
.L402:
	movl	$1, %edx
	movq	%r15, %rcx
	call	get_next_token
	cmpl	$4, 24(%rax)
	movq	%rax, %rbx
	jne	.L626
	movl	$1, %edx
	movq	%r15, %rcx
	movq	(%rax), %rsi
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L591
.L619:
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC66(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L433
.L621:
	movq	%rsi, %r10
	movq	56(%rsp), %rsi
	jmp	.L472
.L618:
	movb	$0, 8(%r14)
	movq	104(%rsp), %rbp
	testb	%sil, %sil
	jne	.L436
	movq	.refptr.name_void(%rip), %rsi
	cmpq	(%rsi), %rbp
	je	.L438
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC68(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	cmpq	(%rsi), %rbp
	je	.L438
.L436:
	movq	96(%rsp), %rax
	movq	%rdi, 40(%rsp)
	movq	%rbp, %r8
	movq	56(%rsp), %r9
	movq	88(%rsp), %rdx
	movq	%rax, 32(%rsp)
	movq	80(%rsp), %rcx
	call	create_function_use_ptr
	movq	%rax, %r8
	testq	%rax, %rax
	jne	.L440
	jmp	.L412
	.p2align 4,,10
	.p2align 3
.L428:
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC65(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L412
.L626:
	movq	(%r14), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC54(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L400
.L482:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$5, %ecx
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movq	%r10, 152(%rsp)
	call	create_statement
	movq	56(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	152(%rsp), %r10
	jmp	.L480
.L438:
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$5, %ecx
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	call	create_statement
	movq	96(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L436
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
