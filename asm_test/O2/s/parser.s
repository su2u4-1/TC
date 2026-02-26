	.file	"D:\\TC\\src\\parser.c"
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Failed to parse expression primary\0"
	.text
	.p2align 4
	.def	parse_expression;	.scl	3;	.type	32;	.endef
	.seh_proc	parse_expression
parse_expression:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%r8, %rdi
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L5
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rdi, 32(%rsp)
	xorl	%r8d, %r8d
	movq	%rsi, %r9
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	parse_expr_prec
	movq	%rax, %r8
.L1:
	movq	%r8, %rax
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%rbx, %rcx
	movq	%rax, 56(%rsp)
	call	peek_current_token
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
	movq	56(%rsp), %r8
	jmp	.L1
	.seh_endproc
	.section .rdata,"dr"
.LC1:
	.ascii "Expected variable type\0"
	.align 8
.LC2:
	.ascii "Expected a type for variable declaration\0"
.LC3:
	.ascii "Unknown variable type\0"
.LC4:
	.ascii "Expected variable name\0"
	.align 8
.LC5:
	.ascii "Failed to parse variable initializer\0"
	.text
	.p2align 4
	.def	parse_variable;	.scl	3;	.type	32;	.endef
	.seh_proc	parse_variable
parse_variable:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$72, %rsp
	.seh_stackalloc	72
	.seh_endprologue
	movq	%rcx, %rsi
	movq	%rdx, %rbp
	movq	%r8, %r12
	call	peek_current_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L7
	cmpl	$6, %eax
	jne	.L10
	movq	(%rbx), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L10
.L7:
	movq	(%rbx), %rdx
	movq	%rbp, %rcx
	call	search
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L11
	testl	$-5, 24(%rax)
	jne	.L31
.L12:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L32
.L13:
	movq	(%rbx), %rcx
	movq	%rbp, 32(%rsp)
	xorl	%r9d, %r9d
	movq	%rdi, %r8
	movl	$1, %edx
	call	create_name
	movl	$1, %edx
	movq	%rsi, %rcx
	movq	%rax, %rbx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	je	.L14
.L16:
	xorl	%r8d, %r8d
.L15:
	movq	%rbx, %rdx
	movq	%rdi, %rcx
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	create_variable
	.p2align 4,,10
	.p2align 3
.L32:
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rcx
	call	parser_error
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L10:
	movq	%rbx, %rdx
	leaq	.LC1(%rip), %rcx
	call	parser_error
	xorl	%eax, %eax
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L31:
	movq	%rbx, %rdx
	leaq	.LC2(%rip), %rcx
	call	parser_error
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L14:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx
	movq	(%rax), %rcx
	movq	(%rdx), %rdx
	call	string_equal
	testb	%al, %al
	je	.L16
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%r12, %r8
	movq	%rbp, %rdx
	movq	%rsi, %rcx
	movq	%rax, %r13
	call	parse_expression
	movq	%rax, %r8
	testq	%rax, %rax
	jne	.L15
	movq	%r13, %rdx
	leaq	.LC5(%rip), %rcx
	movq	%rax, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r8
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L11:
	movq	%rbx, %rdx
	leaq	.LC3(%rip), %rcx
	call	parser_error
	jmp	.L12
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC6:
	.ascii "Failed to parse parenthesized expression\0"
.LC7:
	.ascii "Expected ')' after expression\0"
	.align 8
.LC8:
	.ascii "Failed to parse operand of unary '!'\0"
	.align 8
.LC9:
	.ascii "Failed to parse operand of unary '-'\0"
	.align 8
.LC10:
	.ascii "Expected variable name in variable access\0"
	.align 8
.LC11:
	.ascii "Cannot call undefined variable\0"
	.align 8
.LC12:
	.ascii "Cannot call non-function variable\0"
	.align 8
.LC13:
	.ascii "Failed to parse function call argument\0"
	.align 8
.LC14:
	.ascii "Expected ',' or ')' after function call argument\0"
	.align 8
.LC15:
	.ascii "Failed to parse sequence index\0"
	.align 8
.LC16:
	.ascii "Expected ']' after sequence index\0"
	.align 8
.LC17:
	.ascii "Cannot access attribute without a valid scope\0"
	.align 8
.LC18:
	.ascii "Expected attribute name after '.'\0"
.LC19:
	.ascii "Unknown attribute name\0"
	.align 8
.LC20:
	.ascii "Failed to parse variable access\0"
	.align 8
.LC21:
	.ascii "Unexpected token in primary expression\0"
	.text
	.p2align 4
	.def	parse_primary;	.scl	3;	.type	32;	.endef
	.seh_proc	parse_primary
parse_primary:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$88, %rsp
	.seh_stackalloc	88
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%rdx, %rdi
	movq	%r8, %rsi
	call	peek_current_token
	movq	%rax, %r14
	movl	24(%rax), %eax
	cmpl	$2, %eax
	je	.L141
	cmpl	$3, %eax
	je	.L142
	cmpl	$4, %eax
	je	.L143
	cmpl	$6, %eax
	je	.L144
.L38:
	cmpl	$5, %eax
	je	.L42
	cmpl	$1, %eax
	je	.L44
.L45:
	movq	%r14, %rdx
	leaq	.LC21(%rip), %rcx
	call	parser_error
	xorl	%eax, %eax
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L142:
	movq	(%r14), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$1, %ebx
.L35:
	movq	%r10, 32(%rsp)
	movl	%ebx, %ecx
	call	create_primary
.L33:
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
.L141:
	movq	(%r14), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ebx, %ebx
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L143:
	movq	(%r14), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ebx
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L144:
	movq	.refptr.TRUE_KEYWORD(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L145
	movl	24(%r14), %eax
	cmpl	$6, %eax
	jne	.L38
	movq	.refptr.FALSE_KEYWORD(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L41
	movl	24(%r14), %eax
	cmpl	$5, %eax
	jne	.L53
	.p2align 4,,10
	.p2align 3
.L42:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r8
	movq	(%r14), %rcx
	movq	(%r8), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L146
	movl	24(%r14), %eax
	cmpl	$5, %eax
	jne	.L53
	movq	.refptr.NOT_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L147
	movl	24(%r14), %eax
	cmpl	$5, %eax
	jne	.L53
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L54
	movl	24(%r14), %eax
.L53:
	cmpl	$1, %eax
	je	.L44
	cmpl	$6, %eax
	jne	.L45
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L45
	cmpb	$0, 1(%rsi)
	je	.L45
.L44:
	movq	%rbx, %rcx
	call	peek_current_token
	movq	%rax, %rbp
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L57
	cmpl	$6, %eax
	jne	.L60
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L60
.L57:
	movq	0(%rbp), %rdx
	movq	%rdi, %rcx
	call	search
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
	jne	.L61
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r8
	movq	%rsi, 176(%rsp)
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	movq	%r8, 64(%rsp)
.L84:
	testq	%rbp, %rbp
	je	.L62
	movl	24(%rbp), %eax
	leal	-1(%rax), %edx
	cmpl	$2, %edx
	jbe	.L90
	cmpl	$5, %eax
	jne	.L63
.L90:
	movq	16(%rbp), %r13
.L62:
	testq	%r12, %r12
	jne	.L65
	testq	%r13, %r13
	je	.L65
	cmpl	$4, 24(%r13)
	jne	.L65
	movq	16(%r13), %r12
.L65:
	movq	64(%rsp), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L148
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L77
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	176(%rsp), %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%rax, %r15
	call	parse_expression
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L149
.L78:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	jne	.L80
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L80
	movq	56(%rsp), %rdx
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movl	$3, %ecx
	movq	$0, 32(%rsp)
	call	create_variable_access
	movq	%rax, 56(%rsp)
.L76:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	je	.L84
.L137:
	movq	56(%rsp), %r10
.L61:
	testq	%r10, %r10
	je	.L59
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$8, %ebx
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L77:
	movq	.refptr.DOT_SYMBOL(%rip), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L137
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r13
	testq	%r12, %r12
	je	.L150
	cmpl	$1, 24(%rax)
	jne	.L151
	movq	(%rax), %rdx
	movq	%r12, %rcx
	call	search
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L152
	movq	56(%rsp), %rdx
	xorl	%r9d, %r9d
	movq	%rax, %r8
	movl	$2, %ecx
	movq	$0, 32(%rsp)
	xorl	%r12d, %r12d
	xorl	%r13d, %r13d
	call	create_variable_access
	movq	%rax, 56(%rsp)
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L148:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	testq	%rbp, %rbp
	je	.L153
.L67:
	movl	24(%rbp), %eax
	leal	-2(%rax), %ecx
	cmpl	$1, %ecx
	ja	.L154
.L68:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r15
	call	create_list
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rsi
	movq	.refptr.COMMA_SYMBOL(%rip), %r13
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L69:
	cmpl	$5, 24(%r15)
	je	.L155
.L75:
	movq	176(%rsp), %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	testq	%rax, %rax
	je	.L156
.L70:
	movq	%rax, %rdx
	movq	%r12, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	je	.L71
.L74:
	movq	%r15, %rdx
	leaq	.LC14(%rip), %rcx
	call	parser_error
.L59:
	movq	%r14, %rdx
	leaq	.LC20(%rip), %rcx
	call	parser_error
	xorl	%eax, %eax
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L155:
	movq	(%rsi), %rdx
	movq	(%r15), %rcx
	call	string_equal
	testb	%al, %al
	je	.L75
	movq	%r12, 32(%rsp)
	movq	56(%rsp), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$1, %ecx
	xorl	%r12d, %r12d
	xorl	%r13d, %r13d
	call	create_variable_access
	movq	16(%rbp), %rbp
	movq	%rax, 56(%rsp)
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L71:
	movq	0(%r13), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L157
	cmpl	$5, 24(%r15)
	jne	.L74
	movq	(%rsi), %rdx
	movq	(%r15), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L69
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L156:
	movq	%r15, %rdx
	leaq	.LC13(%rip), %rcx
	movq	%rax, 72(%rsp)
	call	parser_error
	movq	72(%rsp), %rax
	jmp	.L70
	.p2align 4,,10
	.p2align 3
.L157:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r15
	jmp	.L69
	.p2align 4,,10
	.p2align 3
.L145:
	movq	(%r14), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$3, %ebx
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L154:
	movq	%rsi, %rdx
	leaq	.LC12(%rip), %rcx
	call	parser_error
	jmp	.L68
	.p2align 4,,10
	.p2align 3
.L41:
	movq	(%r14), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$4, %ebx
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L63:
	andl	$-5, %eax
	cmove	%rbp, %r13
	jmp	.L62
	.p2align 4,,10
	.p2align 3
.L60:
	movq	%rbp, %rdx
	leaq	.LC10(%rip), %rcx
	call	parser_error
	jmp	.L59
	.p2align 4,,10
	.p2align 3
.L149:
	movq	%r15, %rdx
	leaq	.LC15(%rip), %rcx
	call	parser_error
	jmp	.L78
	.p2align 4,,10
	.p2align 3
.L146:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%rax, %rbp
	call	parse_expression
	testq	%rax, %rax
	je	.L158
	movq	%rbx, %rcx
	movl	$1, %edx
	movq	%rax, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r8
	movl	24(%rax), %ebx
	movq	%rax, %rsi
	cmpl	$5, %ebx
	jne	.L51
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	%r8, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L51
	movq	56(%rsp), %r8
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L147:
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
	je	.L159
	xorl	%r10d, %r10d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$6, %ebx
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L54:
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
	je	.L160
	xorl	%r10d, %r10d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$7, %ebx
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L153:
	movq	%rax, %rdx
	leaq	.LC11(%rip), %rcx
	call	parser_error
	jmp	.L67
.L51:
	movq	%rsi, %rdx
	leaq	.LC7(%rip), %rcx
	call	parser_error
	xorl	%eax, %eax
	jmp	.L33
.L80:
	movq	%r15, %rdx
	leaq	.LC16(%rip), %rcx
	call	parser_error
	jmp	.L59
.L152:
	movq	%r13, %rdx
	leaq	.LC19(%rip), %rcx
	call	parser_error
	jmp	.L59
.L151:
	movq	%rax, %rdx
	leaq	.LC18(%rip), %rcx
	call	parser_error
	jmp	.L59
.L150:
	movq	%rax, %rdx
	leaq	.LC17(%rip), %rcx
	call	parser_error
	jmp	.L59
.L158:
	movq	%rbp, %rdx
	leaq	.LC6(%rip), %rcx
	call	parser_error
	xorl	%eax, %eax
	jmp	.L33
.L160:
	movq	%rbp, %rdx
	leaq	.LC9(%rip), %rcx
	call	parser_error
	xorl	%eax, %eax
	jmp	.L33
.L159:
	movq	%rbp, %rdx
	leaq	.LC8(%rip), %rcx
	call	parser_error
	xorl	%eax, %eax
	jmp	.L33
	.seh_endproc
	.section .rdata,"dr"
.LC22:
	.ascii "Failed to parse right operand\0"
	.text
	.p2align 4
	.def	parse_expr_prec;	.scl	3;	.type	32;	.endef
	.seh_proc	parse_expr_prec
parse_expr_prec:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%rdx, %r12
	movl	%r8d, %r14d
	movq	%r9, %r13
.L174:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	jne	.L162
	movq	(%rax), %rcx
	call	string_to_operator
	movl	%eax, %ecx
	movl	%eax, %edi
	call	operator_precedence
	movl	%eax, %esi
	cmpl	$19, %edi
	je	.L162
	cmpl	%r14d, %eax
	jl	.L162
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
	je	.L176
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %rbp
.L175:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	jne	.L165
	movq	(%rax), %rcx
	call	string_to_operator
	movl	%eax, %r15d
	movl	%eax, %ecx
	call	operator_precedence
	cmpl	$19, %r15d
	je	.L165
	cmpl	%eax, %esi
	jge	.L165
	movq	160(%rsp), %rdx
	movq	%r13, %r9
	movl	%eax, %r8d
	movq	%rbx, %rcx
	movq	%rdx, 32(%rsp)
	movq	%rbp, %rdx
	call	parse_expr_prec
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L175
	xorl	%r12d, %r12d
	jmp	.L161
	.p2align 4,,10
	.p2align 3
.L165:
	movq	%r12, %rdx
	movq	%rbp, %r9
	xorl	%r8d, %r8d
	movl	%edi, %ecx
	call	create_expression
	movq	%rax, %r12
	jmp	.L174
	.p2align 4,,10
	.p2align 3
.L162:
	movq	%rbx, %rcx
	call	peek_current_token
.L161:
	movq	%r12, %rax
	addq	$56, %rsp
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
	movq	%rbp, %rdx
	leaq	.LC22(%rip), %rcx
	xorl	%r12d, %r12d
	call	parser_error
	jmp	.L161
	.seh_endproc
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
	.seh_proc	parse_statement
parse_statement:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$104, %rsp
	.seh_stackalloc	104
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%rdx, %rdi
	movq	%r8, %rsi
	call	peek_current_token
	cmpl	$6, 24(%rax)
	movq	%rax, %rbp
	je	.L344
.L178:
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
	movq	%rax, %rsi
.L256:
	movq	%rbx, %rcx
	call	peek_current_token
	testq	%rsi, %rsi
	je	.L345
.L263:
	movq	%rbx, %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L264
.L266:
	movq	%rbx, %rdx
	leaq	.LC52(%rip), %rcx
	call	parser_error
.L177:
	movq	%rsi, %rax
	addq	$104, %rsp
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
.L264:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L266
	jmp	.L177
	.p2align 4,,10
	.p2align 3
.L344:
	movq	.refptr.IF_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L346
	movq	.refptr.FOR_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L347
	movq	.refptr.WHILE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L348
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L349
	movq	.refptr.RETURN_KEYWORD(%rip), %rax
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
	call	parse_expression
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	$0, 40(%rsp)
	movl	$5, %ecx
	movq	%rax, 32(%rsp)
	call	create_statement
	movq	%rax, %rsi
	jmp	.L256
	.p2align 4,,10
	.p2align 3
.L347:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L214
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L214
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L215
.L218:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_variable
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L350
.L217:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L219:
	cmpl	$5, 24(%rbp)
	jne	.L222
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %r14
	movq	0(%rbp), %rcx
	movq	(%r14), %rdx
	call	string_equal
	testb	%al, %al
	je	.L222
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L223
.L226:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L351
.L225:
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
	je	.L229
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L230
.L233:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, 64(%rsp)
	testq	%rax, %rax
	je	.L352
.L232:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L234:
	cmpl	$5, 24(%rbp)
	jne	.L236
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L236
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L238
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L238
	call	create_list
	movb	$1, 2(%rsi)
	movq	%rbx, %rcx
	movq	%r13, %r15
	movl	$1, %edx
	movq	%rax, %r14
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rbp
	movq	%rax, %rdx
	movq	%rbp, %rax
	movq	%rdx, %r13
	movq	%rsi, %rbp
	movq	%rbx, %rsi
	movq	%r12, %rbx
	movq	%rax, %r12
	jmp	.L239
	.p2align 4,,10
	.p2align 3
.L240:
	movq	%rax, %rdx
	movq	%r14, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %r13
.L239:
	cmpl	$5, 24(%r13)
	jne	.L241
	movq	(%r12), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L353
.L241:
	movq	%rbp, %r8
	movq	%rdi, %rdx
	movq	%rsi, %rcx
	call	parse_statement
	testq	%rax, %rax
	jne	.L240
	movq	%r13, %rdx
	leaq	.LC43(%rip), %rcx
	movq	%rax, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %rax
	jmp	.L240
	.p2align 4,,10
	.p2align 3
.L345:
	movq	%rax, %rdx
	leaq	.LC51(%rip), %rcx
	call	parser_error
	jmp	.L263
	.p2align 4,,10
	.p2align 3
.L346:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L182
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r15
	movq	(%rax), %rcx
	movq	(%r15), %rdx
	call	string_equal
	testb	%al, %al
	je	.L182
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
	je	.L354
.L183:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L185
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L185
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L187
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L187
	call	create_list
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r14
	call	get_next_token
	movq	%r13, 56(%rsp)
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rbp
	movq	%rax, %r13
	jmp	.L188
	.p2align 4,,10
	.p2align 3
.L189:
	movq	%r12, %rdx
	movq	%r14, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r13
.L188:
	cmpl	$5, 24(%r13)
	jne	.L190
	movq	0(%rbp), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L355
.L190:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L189
	movq	%r13, %rdx
	leaq	.LC27(%rip), %rcx
	call	parser_error
	jmp	.L189
	.p2align 4,,10
	.p2align 3
.L182:
	movq	%rbp, %rdx
	leaq	.LC23(%rip), %rcx
	call	parser_error
.L181:
	xorl	%edx, %edx
.L192:
	movq	$0, 40(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rsi
	jmp	.L177
	.p2align 4,,10
	.p2align 3
.L348:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L245
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L245
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%rax, %rbp
	call	parse_expression
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L356
.L246:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L249
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L249
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L251
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L251
	call	create_list
	movb	$1, 2(%rsi)
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r13
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rbp
	movq	%rax, %r15
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L253:
	movq	%r12, %rdx
	movq	%r13, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r15
.L252:
	cmpl	$5, 24(%r15)
	jne	.L254
	movq	0(%rbp), %rdx
	movq	(%r15), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L357
.L254:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L253
	movq	%r15, %rdx
	leaq	.LC48(%rip), %rcx
	call	parser_error
	jmp	.L253
	.p2align 4,,10
	.p2align 3
.L349:
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
	movq	%rax, %rsi
	jmp	.L256
	.p2align 4,,10
	.p2align 3
.L185:
	movq	%rbp, %rdx
	leaq	.LC25(%rip), %rcx
	call	parser_error
	jmp	.L181
	.p2align 4,,10
	.p2align 3
.L214:
	movq	%rbp, %rdx
	leaq	.LC35(%rip), %rcx
	call	parser_error
.L213:
	xorl	%r9d, %r9d
.L221:
	movq	$0, 40(%rsp)
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$4, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rsi
	jmp	.L177
	.p2align 4,,10
	.p2align 3
.L245:
	movq	%rbp, %rdx
	leaq	.LC44(%rip), %rcx
	call	parser_error
.L244:
	xorl	%r8d, %r8d
.L248:
	movq	$0, 40(%rsp)
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$3, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rsi
	jmp	.L177
.L354:
	movq	%rbp, %rdx
	leaq	.LC24(%rip), %rcx
	call	parser_error
	jmp	.L183
	.p2align 4,,10
	.p2align 3
.L257:
	movq	.refptr.BREAK_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L258
	cmpb	$0, 2(%rsi)
	je	.L358
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$6, %ecx
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rsi
	jmp	.L256
	.p2align 4,,10
	.p2align 3
.L222:
	movq	%rbp, %rdx
	leaq	.LC37(%rip), %rcx
	call	parser_error
	jmp	.L213
.L187:
	movq	%rbp, %rdx
	leaq	.LC26(%rip), %rcx
	call	parser_error
	jmp	.L181
.L355:
	movq	56(%rsp), %r13
	call	create_list
	movq	%rax, 64(%rsp)
	call	create_list
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, 72(%rsp)
	call	peek_next_token
	cmpl	$6, 24(%rax)
	movq	%rax, %r12
	jne	.L203
	movq	%r13, 80(%rsp)
	movq	%r14, 88(%rsp)
	.p2align 4,,10
	.p2align 3
.L191:
	movq	.refptr.ELIF_KEYWORD(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L359
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L194
	movq	(%r15), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	je	.L194
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%rax, %r12
	call	parse_expression
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L360
.L195:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L197
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L197
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L199
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L199
	call	create_list
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r12
	call	get_next_token
	movq	%r13, 56(%rsp)
	movq	%rax, %r13
	jmp	.L200
	.p2align 4,,10
	.p2align 3
.L201:
	movq	%r14, %rdx
	movq	%r12, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r13
.L200:
	cmpl	$5, 24(%r13)
	jne	.L202
	movq	0(%rbp), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L361
.L202:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L201
	movq	%r13, %rdx
	leaq	.LC32(%rip), %rcx
	call	parser_error
	jmp	.L201
	.p2align 4,,10
	.p2align 3
.L361:
	movq	56(%rsp), %r13
	movq	%r12, %rdx
	movq	%r13, %rcx
	call	create_else_if
	movq	64(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	cmpl	$6, 24(%rax)
	movq	%rax, %r12
	je	.L191
	movq	80(%rsp), %r13
	movq	88(%rsp), %r14
.L203:
	movq	%rbx, %rcx
	call	peek_current_token
	movq	72(%rsp), %r9
	movq	%r14, %rdx
	movq	%r13, %rcx
	movq	64(%rsp), %r8
	call	create_if
	movq	%rax, %rdx
	jmp	.L192
	.p2align 4,,10
	.p2align 3
.L360:
	movq	%r12, %rdx
	leaq	.LC29(%rip), %rcx
	call	parser_error
	jmp	.L195
.L215:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	xorl	%r12d, %r12d
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L219
	jmp	.L218
.L249:
	movq	%rbp, %rdx
	leaq	.LC46(%rip), %rcx
	call	parser_error
	jmp	.L244
.L229:
	movq	%rbp, %rdx
	leaq	.LC39(%rip), %rcx
	call	parser_error
	jmp	.L213
.L258:
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L178
	cmpb	$0, 2(%rsi)
	je	.L362
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$7, %ecx
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rsi
	jmp	.L256
.L223:
	movq	(%r14), %rdx
	movq	(%rax), %rcx
	xorl	%r13d, %r13d
	call	string_equal
	testb	%al, %al
	jne	.L227
	jmp	.L226
.L251:
	movq	%rbp, %rdx
	leaq	.LC47(%rip), %rcx
	call	parser_error
	jmp	.L244
.L357:
	movb	$0, 2(%rsi)
	movq	%r13, %rdx
	movq	%r14, %rcx
	call	create_while
	movq	%rax, %r8
	jmp	.L248
.L350:
	movq	%rbp, %rdx
	leaq	.LC36(%rip), %rcx
	call	parser_error
	jmp	.L217
.L236:
	movq	%rbp, %rdx
	leaq	.LC41(%rip), %rcx
	call	parser_error
	jmp	.L213
.L356:
	movq	%rbp, %rdx
	leaq	.LC45(%rip), %rcx
	call	parser_error
	jmp	.L246
.L194:
	movq	%r12, %rdx
	leaq	.LC28(%rip), %rcx
	call	parser_error
	jmp	.L181
.L197:
	movq	%r12, %rdx
	leaq	.LC30(%rip), %rcx
	call	parser_error
	jmp	.L181
.L199:
	movq	%r12, %rdx
	leaq	.LC31(%rip), %rcx
	call	parser_error
	jmp	.L181
.L230:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L233
	movq	$0, 64(%rsp)
	jmp	.L234
.L358:
	movq	%rbp, %rdx
	leaq	.LC49(%rip), %rcx
	xorl	%esi, %esi
	call	parser_error
	jmp	.L177
.L351:
	movq	%rbp, %rdx
	leaq	.LC38(%rip), %rcx
	call	parser_error
	jmp	.L225
.L238:
	movq	%rbp, %rdx
	leaq	.LC42(%rip), %rcx
	call	parser_error
	jmp	.L213
.L353:
	movb	$0, 2(%rbp)
	movq	64(%rsp), %r8
	movq	%r14, %r9
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	create_for
	movq	%rax, %r9
	jmp	.L221
.L359:
	cmpl	$6, 24(%r12)
	movq	80(%rsp), %r13
	movq	88(%rsp), %r14
	jne	.L203
	movq	.refptr.ELSE_KEYWORD(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L203
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L206
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L206
	movl	$1, %edx
	movq	%rbx, %rcx
	leaq	.LC34(%rip), %r12
	call	get_next_token
	movq	%rax, %r15
	jmp	.L207
	.p2align 4,,10
	.p2align 3
.L208:
	movq	72(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r15
.L207:
	cmpl	$5, 24(%r15)
	jne	.L209
	movq	0(%rbp), %rdx
	movq	(%r15), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L203
.L209:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	testq	%rax, %rax
	jne	.L208
	movq	%r15, %rdx
	movq	%r12, %rcx
	movq	%rax, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %rax
	jmp	.L208
.L352:
	movq	%rbp, %rdx
	leaq	.LC40(%rip), %rcx
	call	parser_error
	jmp	.L232
.L362:
	movq	%rbp, %rdx
	leaq	.LC50(%rip), %rcx
	xorl	%esi, %esi
	call	parser_error
	jmp	.L177
.L206:
	movq	%r12, %rdx
	leaq	.LC33(%rip), %rcx
	call	parser_error
	jmp	.L181
	.seh_endproc
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
	.ascii "Failed to parse import statement\0"
	.align 8
.LC57:
	.ascii "Expected function return type after 'func'\0"
.LC58:
	.ascii "Unknown function return type\0"
	.align 8
.LC59:
	.ascii "Expected function name after return type\0"
	.align 8
.LC60:
	.ascii "Expected '(' after function name\0"
	.align 8
.LC61:
	.ascii "Failed to parse function parameter\0"
	.align 8
.LC62:
	.ascii "Function parameters cannot have default values\0"
	.align 8
.LC63:
	.ascii "Expected ',' or ')' after function parameter\0"
	.align 8
.LC64:
	.ascii "Expected '{' to start function body\0"
	.align 8
.LC65:
	.ascii "Failed to parse function body statement\0"
	.align 8
.LC66:
	.ascii "Unreachable code after return statement\0"
	.align 8
.LC67:
	.ascii "Function missing return statement\0"
	.align 8
.LC68:
	.ascii "Failed to parse function declaration\0"
	.align 8
.LC69:
	.ascii "Expected class name after 'class'\0"
	.align 8
.LC70:
	.ascii "Expected '{' to start class body\0"
	.align 8
.LC71:
	.ascii "Expected method return type after 'method'\0"
	.align 8
.LC72:
	.ascii "Unknown return type for method\0"
	.align 8
.LC73:
	.ascii "Expected method name after return type\0"
	.align 8
.LC74:
	.ascii "Expected '(' after method name\0"
	.align 8
.LC75:
	.ascii "Expected 'self' as first parameter of method\0"
	.align 8
.LC76:
	.ascii "Expected ',' or ')' after method parameter\0"
	.align 8
.LC77:
	.ascii "Failed to parse method parameter\0"
	.align 8
.LC78:
	.ascii "Method parameters cannot have default values\0"
	.align 8
.LC79:
	.ascii "Expected '{' to start method body\0"
	.align 8
.LC81:
	.ascii "Failed to parse method body statement\0"
	.align 8
.LC82:
	.ascii "Method missing return statement\0"
.LC83:
	.ascii "Failed to parse class method\0"
	.align 8
.LC84:
	.ascii "Failed to parse class variable\0"
	.align 8
.LC85:
	.ascii "Expected ';' after class variable declaration\0"
	.align 8
.LC86:
	.ascii "Unexpected token in class member\0"
	.align 8
.LC87:
	.ascii "Failed to parse class declaration\0"
	.align 8
.LC88:
	.ascii "Unexpected token in code member\0"
	.text
	.p2align 4
	.globl	parse_code
	.def	parse_code;	.scl	2;	.type	32;	.endef
	.seh_proc	parse_code
parse_code:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$168, %rsp
	.seh_stackalloc	168
	.seh_endprologue
	movq	.refptr.builtin_scope(%rip), %rsi
	cmpq	$0, (%rsi)
	movq	%r8, 72(%rsp)
	movq	%rcx, %rdi
	movq	%rdx, %rbx
	je	.L528
.L364:
	testq	%rbx, %rbx
	je	.L529
.L365:
	call	create_list
	movq	%rbx, %rcx
	movq	%rax, 80(%rsp)
	call	create_scope
	movl	$1, %edx
	movq	%rdi, %rcx
	movq	%rax, 64(%rsp)
	call	get_next_token
	testq	%rax, %rax
	je	.L452
	movq	.refptr.CLASS_KEYWORD(%rip), %r13
	movq	%rax, %r11
	movq	%rdi, %r14
	jmp	.L366
	.p2align 4,,10
	.p2align 3
.L406:
	movq	%r11, %rdx
	leaq	.LC88(%rip), %rcx
	call	parser_error
.L378:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %r11
	testq	%rax, %rax
	je	.L452
.L366:
	movl	24(%r11), %eax
	testl	%eax, %eax
	je	.L452
	cmpl	$6, %eax
	jne	.L406
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax
	movq	(%r11), %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	movl	%eax, %ebx
	jne	.L530
	cmpl	$6, 24(%r11)
	jne	.L406
	movq	.refptr.FUNC_KEYWORD(%rip), %rax
	movq	(%r11), %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	jne	.L531
	cmpl	$6, 24(%r11)
	jne	.L406
	movq	(%r11), %rcx
	movq	0(%r13), %rdx
	movq	%r11, 56(%rsp)
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	je	.L406
	movq	64(%rsp), %rcx
	call	create_scope
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 88(%rsp)
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$1, 24(%rax)
	jne	.L532
	movq	(%rax), %rcx
	movq	64(%rsp), %rax
	xorl	%r8d, %r8d
	movl	$4, %edx
	movq	88(%rsp), %r9
	movq	%r11, 56(%rsp)
	movq	%rax, 32(%rsp)
	call	create_name
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 104(%rsp)
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L410
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	je	.L410
	call	create_list
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 96(%rsp)
	call	get_next_token
	movq	56(%rsp), %r11
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12
	movq	.refptr.VAR_KEYWORD(%rip), %rdi
	movq	%rax, %r10
	movq	%r11, 112(%rsp)
	jmp	.L411
	.p2align 4,,10
	.p2align 3
.L449:
	cmpl	$6, %eax
	je	.L533
.L412:
	movq	%r10, %rdx
	leaq	.LC86(%rip), %rcx
	call	parser_error
.L445:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %r10
.L411:
	movl	24(%r10), %eax
	cmpl	$5, %eax
	jne	.L449
	movq	(%r12), %rdx
	movq	(%r10), %rcx
	movq	%r10, 56(%rsp)
	call	string_equal
	testb	%al, %al
	jne	.L450
	movq	56(%rsp), %r10
	movl	24(%r10), %eax
	cmpl	$6, %eax
	jne	.L412
.L533:
	movq	.refptr.METHOD_KEYWORD(%rip), %rax
	movq	(%r10), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	jne	.L534
	cmpl	$6, 24(%r10)
	jne	.L412
	movq	(%r10), %rcx
	movq	(%rdi), %rdx
	movq	%r10, 56(%rsp)
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L412
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	72(%rsp), %r8
	movq	88(%rsp), %rdx
	movq	%r14, %rcx
	movq	%rax, %rbx
	call	parse_variable
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L535
.L446:
	xorl	%edx, %edx
	movl	$1, %ecx
	call	create_class_member
	movq	96(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L447
.L448:
	movq	%rbx, %rdx
	leaq	.LC85(%rip), %rcx
	call	parser_error
	jmp	.L445
	.p2align 4,,10
	.p2align 3
.L452:
	movq	64(%rsp), %rdx
	movq	80(%rsp), %rcx
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
.L530:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$1, 24(%rax)
	jne	.L536
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
	je	.L537
.L371:
	cmpl	$5, %eax
	jne	.L375
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	je	.L375
	movq	64(%rsp), %r8
	movq	%rdi, %rcx
	movq	%rsi, %rdx
	call	parse_import_file
	movq	56(%rsp), %r11
	testq	%rax, %rax
	movq	%rax, %rcx
	je	.L538
.L376:
	movq	%rsi, %rdx
	movq	%r11, 56(%rsp)
	call	create_import
	movq	56(%rsp), %r11
	testq	%rax, %rax
	movq	%rax, %rdx
	je	.L370
.L377:
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	call	create_code_member
	movq	80(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L378
	.p2align 4,,10
	.p2align 3
.L531:
	movq	64(%rsp), %rcx
	call	create_scope
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, %rsi
	call	get_next_token
	movq	56(%rsp), %r11
	movq	%rax, %rbp
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L380
	cmpl	$6, %eax
	jne	.L383
	movq	0(%rbp), %rcx
	movq	%r11, 56(%rsp)
	call	is_builtin_type
	movq	56(%rsp), %r11
	testb	%al, %al
	je	.L383
.L380:
	movq	0(%rbp), %rdx
	movq	64(%rsp), %rcx
	movq	%r11, 56(%rsp)
	call	search
	movq	56(%rsp), %r11
	testq	%rax, %rax
	movq	%rax, %rdi
	je	.L539
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r11, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$1, 24(%rax)
	jne	.L540
	movq	(%rax), %rcx
	movq	64(%rsp), %rax
	xorl	%r9d, %r9d
	movq	%rdi, %r8
	movl	$2, %edx
	movq	%r11, 56(%rsp)
	movq	%rax, 32(%rsp)
	call	create_name
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 88(%rsp)
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L387
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	je	.L387
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r11, 96(%rsp)
	call	get_next_token
	movq	%rax, %rbp
	call	create_list
	movq	%rdi, 104(%rsp)
	movq	%rbp, %rdi
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r12
	movq	%rax, 56(%rsp)
	movl	%ebx, %ebp
	movq	.refptr.COMMA_SYMBOL(%rip), %r15
	movq	96(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L388:
	cmpl	$5, 24(%rdi)
	je	.L541
.L396:
	movq	72(%rsp), %r8
	movq	%rsi, %rdx
	movq	%r14, %rcx
	call	parse_variable
	testq	%rax, %rax
	je	.L542
	cmpq	$0, 16(%rax)
	je	.L391
	movq	%rdi, %rdx
	leaq	.LC62(%rip), %rcx
	call	parser_error
.L390:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rdi
	je	.L392
.L395:
	movq	%rdi, %rdx
	leaq	.LC63(%rip), %rcx
	movq	%rbx, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r11
.L382:
	movq	%r11, %rdx
	leaq	.LC68(%rip), %rcx
	call	parser_error
	xorl	%r8d, %r8d
.L405:
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	movl	$1, %ecx
	call	create_code_member
	movq	80(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L378
	.p2align 4,,10
	.p2align 3
.L410:
	movq	%rbx, %rdx
	leaq	.LC70(%rip), %rcx
	movq	%r11, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r11
.L408:
	movq	%r11, %rdx
	leaq	.LC87(%rip), %rcx
	call	parser_error
	xorl	%r9d, %r9d
.L451:
	xorl	%edx, %edx
	xorl	%r8d, %r8d
	movl	$2, %ecx
	call	create_code_member
	movq	80(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L378
	.p2align 4,,10
	.p2align 3
.L534:
	movq	88(%rsp), %rcx
	call	create_scope
	movq	104(%rsp), %r8
	xorl	%r9d, %r9d
	movl	$1, %edx
	movq	%rax, %rsi
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rcx
	movq	%rsi, 32(%rsp)
	call	create_name
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, %rbp
	call	get_next_token
	movq	56(%rsp), %r10
	movq	%rax, %r15
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L414
	cmpl	$6, %eax
	jne	.L417
	movq	(%r15), %rcx
	movq	%r10, 56(%rsp)
	call	is_builtin_type
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L417
.L414:
	movq	(%r15), %rdx
	movq	88(%rsp), %rcx
	movq	%r10, 56(%rsp)
	call	search
	movq	56(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L543
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r10, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r10
	cmpl	$1, 24(%rax)
	jne	.L544
	movq	(%rax), %rcx
	movq	88(%rsp), %rax
	xorl	%r9d, %r9d
	movq	%rbx, %r8
	movl	$3, %edx
	movq	%r10, 56(%rsp)
	movq	%rax, 32(%rsp)
	call	create_name
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 136(%rsp)
	call	get_next_token
	movq	56(%rsp), %r10
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	jne	.L421
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%r15), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L421
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	56(%rsp), %r10
	cmpl	$6, 24(%rax)
	movq	%rax, %r15
	je	.L422
.L424:
	movq	%r15, %rdx
	leaq	.LC75(%rip), %rcx
	movq	%r10, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r10
.L423:
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r10, 56(%rsp)
	call	get_next_token
	movq	%rax, %r15
	call	create_list
	movq	104(%rsp), %rcx
	movq	%rbp, %rdx
	xorl	%r8d, %r8d
	movq	%rax, 120(%rsp)
	call	create_variable
	movq	120(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	%rbx, 128(%rsp)
	movq	%r15, %rbx
	movq	.refptr.COMMA_SYMBOL(%rip), %rbp
	movq	%r12, %r15
	movq	56(%rsp), %r12
	.p2align 4,,10
	.p2align 3
.L425:
	cmpl	$5, 24(%rbx)
	je	.L545
.L527:
	movq	%r12, %r10
	movq	%r15, %r12
	movq	%rbx, %r15
.L429:
	movq	%r15, %rdx
	leaq	.LC76(%rip), %rcx
	movq	%r10, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L416
	.p2align 4,,10
	.p2align 3
.L529:
	movq	(%rsi), %rbx
	jmp	.L365
	.p2align 4,,10
	.p2align 3
.L450:
	movq	112(%rsp), %r11
	movq	88(%rsp), %r8
	movq	96(%rsp), %rdx
	movq	104(%rsp), %rcx
	movq	%r11, 56(%rsp)
	call	create_class
	movq	56(%rsp), %r11
	testq	%rax, %rax
	movq	%rax, %r9
	jne	.L451
	jmp	.L408
	.p2align 4,,10
	.p2align 3
.L447:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L448
	jmp	.L445
	.p2align 4,,10
	.p2align 3
.L532:
	movq	%rax, %rdx
	leaq	.LC69(%rip), %rcx
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L408
	.p2align 4,,10
	.p2align 3
.L536:
	movq	%rax, %rdx
	leaq	.LC53(%rip), %rcx
	call	parser_error
	movq	56(%rsp), %r11
.L370:
	movq	%r11, %rdx
	leaq	.LC56(%rip), %rcx
	call	parser_error
	xorl	%edx, %edx
	jmp	.L377
	.p2align 4,,10
	.p2align 3
.L375:
	movq	%rbx, %rdx
	leaq	.LC55(%rip), %rcx
	movq	%r11, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L370
	.p2align 4,,10
	.p2align 3
.L387:
	movq	%rbp, %rdx
	leaq	.LC60(%rip), %rcx
	movq	%r11, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L382
	.p2align 4,,10
	.p2align 3
.L421:
	movq	%r15, %rdx
	leaq	.LC74(%rip), %rcx
	movq	%r10, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r10
.L416:
	movq	%r10, %rdx
	leaq	.LC83(%rip), %rcx
	call	parser_error
	xorl	%edx, %edx
.L444:
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	call	create_class_member
	movq	96(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L445
	.p2align 4,,10
	.p2align 3
.L541:
	movq	(%r12), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L396
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rbx, 96(%rsp)
	movq	104(%rsp), %rdi
	call	get_next_token
	movl	%ebp, %ebx
	movq	96(%rsp), %r11
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L398
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%r12), %rcx
	movq	%r11, 96(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	96(%rsp), %r11
	testb	%al, %al
	je	.L398
	call	create_list
	movl	$1, %edx
	movq	%r14, %rcx
	movl	$1, %ebp
	movq	%rax, %r15
	movq	72(%rsp), %rax
	movb	$1, (%rax)
	call	get_next_token
	movq	96(%rsp), %r11
	movq	%rdi, 112(%rsp)
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12
	movq	%rax, %rdi
	movq	%r11, 104(%rsp)
	jmp	.L399
	.p2align 4,,10
	.p2align 3
.L401:
	cmpl	$5, 8(%rax)
	movq	%rax, %rdx
	movq	%r15, %rcx
	cmove	%ebp, %ebx
	call	list_append
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rdi
.L399:
	cmpl	$5, 24(%rdi)
	jne	.L403
	movq	(%r12), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L546
.L403:
	movq	72(%rsp), %r8
	movq	%rsi, %rdx
	movq	%r14, %rcx
	call	parse_statement
	testq	%rax, %rax
	je	.L547
	testb	%bl, %bl
	je	.L401
	movq	%rdi, %rdx
	leaq	.LC66(%rip), %rcx
	movq	%rax, 96(%rsp)
	call	parser_error
	movq	96(%rsp), %rax
	jmp	.L401
	.p2align 4,,10
	.p2align 3
.L391:
	movq	56(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L390
	.p2align 4,,10
	.p2align 3
.L392:
	movq	(%r15), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L548
	cmpl	$5, 24(%rdi)
	jne	.L395
	movq	(%r12), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L388
	jmp	.L395
	.p2align 4,,10
	.p2align 3
.L545:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L549
	cmpl	$5, 24(%rbx)
	jne	.L527
	movq	0(%rbp), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L550
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	72(%rsp), %r8
	movq	%rsi, %rdx
	movq	%r14, %rcx
	movq	%rax, %rbx
	call	parse_variable
	testq	%rax, %rax
	je	.L551
	cmpq	$0, 16(%rax)
	je	.L435
	movq	%rbx, %rdx
	leaq	.LC78(%rip), %rcx
	call	parser_error
.L434:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L425
	.p2align 4,,10
	.p2align 3
.L435:
	movq	120(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L434
	.p2align 4,,10
	.p2align 3
.L542:
	movq	%rdi, %rdx
	leaq	.LC61(%rip), %rcx
	call	parser_error
	jmp	.L390
	.p2align 4,,10
	.p2align 3
.L551:
	movq	%rbx, %rdx
	leaq	.LC77(%rip), %rcx
	call	parser_error
	jmp	.L434
	.p2align 4,,10
	.p2align 3
.L528:
	xorl	%ecx, %ecx
	call	create_scope
	movq	.refptr.VOID_KEYWORD(%rip), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, (%rsi)
	movq	(%rdx), %rcx
	movq	%rax, 32(%rsp)
	xorl	%edx, %edx
	call	create_name
	movq	.refptr.name_void(%rip), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, (%rdx)
	movq	.refptr.INT_KEYWORD(%rip), %rax
	xorl	%edx, %edx
	movq	(%rax), %rcx
	movq	(%rsi), %rax
	movq	%rax, 32(%rsp)
	call	create_name
	movq	.refptr.name_int(%rip), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, (%rdx)
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	xorl	%edx, %edx
	movq	(%rax), %rcx
	movq	(%rsi), %rax
	movq	%rax, 32(%rsp)
	call	create_name
	movq	.refptr.name_float(%rip), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, (%rdx)
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	xorl	%edx, %edx
	movq	(%rax), %rcx
	movq	(%rsi), %rax
	movq	%rax, 32(%rsp)
	call	create_name
	movq	.refptr.name_string(%rip), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, (%rdx)
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	xorl	%edx, %edx
	movq	(%rax), %rcx
	movq	(%rsi), %rax
	movq	%rax, 32(%rsp)
	call	create_name
	movq	.refptr.name_bool(%rip), %rdx
	movq	%rax, (%rdx)
	jmp	.L364
	.p2align 4,,10
	.p2align 3
.L383:
	movq	%rbp, %rdx
	leaq	.LC57(%rip), %rcx
	movq	%r11, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L382
	.p2align 4,,10
	.p2align 3
.L417:
	movq	%r15, %rdx
	leaq	.LC71(%rip), %rcx
	movq	%r10, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L416
	.p2align 4,,10
	.p2align 3
.L535:
	movq	%rbx, %rdx
	leaq	.LC84(%rip), %rcx
	movq	%rax, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r8
	jmp	.L446
	.p2align 4,,10
	.p2align 3
.L548:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rdi
	jmp	.L388
.L540:
	movq	%rax, %rdx
	leaq	.LC59(%rip), %rcx
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L382
.L544:
	movq	%rax, %rdx
	leaq	.LC73(%rip), %rcx
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L416
.L537:
	movq	.refptr.FROM_KEYWORD(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	jne	.L372
	movl	24(%rbx), %eax
	jmp	.L371
.L550:
	movq	%r12, %r10
	movq	%r15, %r12
	movq	%rbx, %r15
	movq	128(%rsp), %rbx
	cmpl	$5, 24(%r15)
	jne	.L429
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%r15), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L429
.L437:
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r10, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r10
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L432
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L432
	movq	%r10, 128(%rsp)
	movq	%r12, %r15
	xorl	%ebp, %ebp
	call	create_list
	movl	$257, %ecx
	movl	$1, %edx
	movq	%rax, 56(%rsp)
	movq	72(%rsp), %rax
	movw	%cx, (%rax)
	movq	%r14, %rcx
	call	get_next_token
	movq	128(%rsp), %r10
	movq	72(%rsp), %r12
	movq	%rbx, 152(%rsp)
	movq	%rax, %rbx
	movq	%r10, 144(%rsp)
	jmp	.L438
	.p2align 4,,10
	.p2align 3
.L440:
	movq	56(%rsp), %rcx
	cmpl	$5, 8(%rax)
	movq	%rax, %rdx
	movl	$1, %ebx
	cmove	%ebx, %ebp
	call	list_append
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
.L438:
	cmpl	$5, 24(%rbx)
	jne	.L442
	movq	(%r15), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L552
.L442:
	movq	%r12, %r8
	movq	%rsi, %rdx
	movq	%r14, %rcx
	call	parse_statement
	testq	%rax, %rax
	je	.L553
	testb	%bpl, %bpl
	je	.L440
	movq	%rbx, %rdx
	leaq	.LC66(%rip), %rcx
	movq	%rax, 128(%rsp)
	call	parser_error
	movq	128(%rsp), %rax
	jmp	.L440
.L432:
	movq	%rbp, %rdx
	leaq	.LC79(%rip), %rcx
	movq	%r10, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L416
	.p2align 4,,10
	.p2align 3
.L553:
	movq	%rbx, %rdx
	leaq	.LC81(%rip), %rcx
	movq	%rax, 128(%rsp)
	call	parser_error
	movq	128(%rsp), %rax
	jmp	.L440
.L422:
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%r15), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L424
	jmp	.L423
.L538:
	movq	.refptr.name_void(%rip), %rax
	movq	%rdi, %rcx
	xorl	%r9d, %r9d
	movl	$1, %edx
	movq	(%rax), %r8
	movq	64(%rsp), %rax
	movq	%rax, 32(%rsp)
	call	create_name
	movq	56(%rsp), %r11
	movq	%rax, %rcx
	jmp	.L376
.L552:
	movq	72(%rsp), %rax
	xorl	%edx, %edx
	movq	%r15, %r12
	movq	144(%rsp), %r10
	movq	%rbx, %r15
	movq	152(%rsp), %rbx
	movw	%dx, (%rax)
	testb	%bpl, %bpl
	jne	.L443
	movq	.refptr.name_void(%rip), %rax
	cmpq	(%rax), %rbx
	je	.L443
	movq	%r15, %rdx
	leaq	.LC82(%rip), %rcx
	movq	%r10, 128(%rsp)
	call	parser_error
	movq	128(%rsp), %r10
.L443:
	movq	%rsi, 32(%rsp)
	movq	56(%rsp), %r9
	movq	%rbx, %rdx
	movq	120(%rsp), %r8
	movq	136(%rsp), %rcx
	movq	%r10, 128(%rsp)
	call	create_method
	movq	128(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, %rdx
	jne	.L444
	jmp	.L416
	.p2align 4,,10
	.p2align 3
.L539:
	movq	%rbp, %rdx
	leaq	.LC58(%rip), %rcx
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L382
.L543:
	movq	%r15, %rdx
	leaq	.LC72(%rip), %rcx
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L416
.L547:
	movq	%rdi, %rdx
	leaq	.LC65(%rip), %rcx
	movq	%rax, 96(%rsp)
	call	parser_error
	movq	96(%rsp), %rax
	jmp	.L401
.L372:
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r11, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$4, 24(%rax)
	jne	.L554
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rsi
	call	get_next_token
	movq	56(%rsp), %r11
	movq	%rax, %rbx
	movl	24(%rax), %eax
	jmp	.L371
.L549:
	movq	%r12, %r10
	movq	128(%rsp), %rbx
	movq	%r15, %r12
	jmp	.L437
.L398:
	movq	%r12, %rdx
	leaq	.LC64(%rip), %rcx
	movq	%r11, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L382
.L546:
	movq	72(%rsp), %rax
	movq	%rdi, %r9
	movq	104(%rsp), %r11
	movq	112(%rsp), %rdi
	movb	$0, (%rax)
	testb	%bl, %bl
	jne	.L404
	movq	.refptr.name_void(%rip), %rax
	cmpq	(%rax), %rdi
	je	.L404
	movq	%r9, %rdx
	leaq	.LC67(%rip), %rcx
	movq	%r11, 96(%rsp)
	call	parser_error
	movq	96(%rsp), %r11
.L404:
	movq	%rsi, 32(%rsp)
	movq	56(%rsp), %r8
	movq	%r15, %r9
	movq	%rdi, %rdx
	movq	88(%rsp), %rcx
	movq	%r11, 96(%rsp)
	call	create_function
	movq	96(%rsp), %r11
	testq	%rax, %rax
	movq	%rax, %r8
	jne	.L405
	jmp	.L382
	.p2align 4,,10
	.p2align 3
.L554:
	movq	%rax, %rdx
	leaq	.LC54(%rip), %rcx
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L370
	.seh_endproc
	.ident	"GCC: (GNU) 13.2.0"
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
	.def	parser_error;	.scl	2;	.type	32;	.endef
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.def	search;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	create_name;	.scl	2;	.type	32;	.endef
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
	.def	create_variable;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.def	create_else_if;	.scl	2;	.type	32;	.endef
	.def	create_if;	.scl	2;	.type	32;	.endef
	.def	create_while;	.scl	2;	.type	32;	.endef
	.def	create_for;	.scl	2;	.type	32;	.endef
	.def	create_scope;	.scl	2;	.type	32;	.endef
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.def	create_code;	.scl	2;	.type	32;	.endef
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.def	create_import;	.scl	2;	.type	32;	.endef
	.def	create_code_member;	.scl	2;	.type	32;	.endef
	.def	create_class;	.scl	2;	.type	32;	.endef
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
