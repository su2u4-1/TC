	.file	"D:\\TC\\src\\parser.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Failed to parse expression primary\0"
	.text
	.def	parse_expression;	.scl	3;	.type	32;	.endef
	.seh_proc	parse_expression
parse_expression:
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
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	movq	%r8, %rbp
	call	parse_primary
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L2
	movq	%rsi, %rcx
	call	peek_current_token
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
	jmp	.L1
.L2:
	xorl	%r9d, %r9d
	movq	%rax, %r8
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rbp, 32(%rsp)
	movq	%rdi, %r9
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movq	%rsi, %rcx
	call	parse_expr_prec
	movq	%rax, %rbx
.L1:
	movq	%rbx, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC1:
	.ascii "Expected variable type\0"
.LC2:
	.ascii "Expected a type for variable declaration\0"
.LC3:
	.ascii "Unknown variable type\0"
.LC4:
	.ascii "Expected variable name\0"
.LC5:
	.ascii "Failed to parse variable initializer\0"
	.text
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
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%r8, %r12
	call	peek_current_token
	movq	%rax, %rsi
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L6
	cmpl	$6, %eax
	jne	.L9
	movq	(%rsi), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L9
.L6:
	movq	(%rsi), %rdx
	movq	%rbp, %rcx
	call	search
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L10
	movq	%rsi, %rdx
	leaq	.LC2(%rip), %rcx
	testl	$-5, 24(%rax)
	je	.L11
	jmp	.L30
.L10:
	movq	%rsi, %rdx
	leaq	.LC3(%rip), %rcx
.L30:
	call	parser_error
.L11:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rsi
	je	.L12
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rcx
	call	parser_error
.L12:
	movq	%rbp, 32(%rsp)
	movq	(%rsi), %rcx
	xorl	%r9d, %r9d
	movq	%rdi, %r8
	movl	$1, %edx
	call	create_name
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %rsi
	call	peek_next_token
	cmpl	$5, 24(%rax)
	je	.L13
.L15:
	xorl	%r8d, %r8d
	jmp	.L14
.L13:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx
	movq	(%rax), %rcx
	movq	(%rdx), %rdx
	call	string_equal
	testb	%al, %al
	je	.L15
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%r12, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movq	%rax, %r13
	call	parse_expression
	movq	%rax, %r8
	testq	%rax, %rax
	jne	.L14
	movq	%r13, %rdx
	leaq	.LC5(%rip), %rcx
	movq	%rax, 56(%rsp)
	call	parser_error
	movq	56(%rsp), %r8
.L14:
	movq	%rsi, %rdx
	movq	%rdi, %rcx
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	create_variable
.L9:
	movq	%rsi, %rdx
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
	.seh_endproc
	.section .rdata,"dr"
.LC6:
	.ascii "Failed to parse parenthesized expression\0"
.LC7:
	.ascii "Expected ')' after expression\0"
.LC8:
	.ascii "Failed to parse operand of unary '!'\0"
.LC9:
	.ascii "Failed to parse operand of unary '-'\0"
.LC10:
	.ascii "Expected variable name in variable access\0"
.LC11:
	.ascii "Cannot call undefined variable\0"
.LC12:
	.ascii "Cannot call non-function variable\0"
.LC13:
	.ascii "Failed to parse function call argument\0"
.LC14:
	.ascii "Expected ',' or ')' after function call argument\0"
.LC15:
	.ascii "Failed to parse sequence index\0"
.LC16:
	.ascii "Expected ']' after sequence index\0"
.LC17:
	.ascii "Cannot access attribute without a valid scope\0"
.LC18:
	.ascii "Expected attribute name after '.'\0"
.LC19:
	.ascii "Unknown attribute name\0"
.LC20:
	.ascii "Failed to parse variable access\0"
.LC21:
	.ascii "Unexpected token in primary expression\0"
	.text
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
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	%rcx, 128(%rsp)
	movq	%r8, %rbp
	movq	%rdx, 136(%rsp)
	call	peek_current_token
	movq	%rax, %rsi
	movl	24(%rax), %eax
	cmpl	$2, %eax
	jne	.L32
	movq	(%rsi), %rdx
	xorl	%ebx, %ebx
	xorl	%r9d, %r9d
	xorl	%esi, %esi
	xorl	%edi, %edi
	jmp	.L33
.L32:
	cmpl	$3, %eax
	jne	.L34
	movq	(%rsi), %rdx
	xorl	%ebx, %ebx
	xorl	%r9d, %r9d
	xorl	%esi, %esi
	movl	$1, %edi
	jmp	.L33
.L34:
	cmpl	$4, %eax
	jne	.L35
	movq	(%rsi), %rdx
	xorl	%ebx, %ebx
	xorl	%r9d, %r9d
	xorl	%esi, %esi
	movl	$2, %edi
	jmp	.L33
.L35:
	cmpl	$6, %eax
	jne	.L36
	movq	.refptr.TRUE_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L37
	movq	(%rsi), %rdx
	xorl	%ebx, %ebx
	xorl	%r9d, %r9d
	xorl	%esi, %esi
	movl	$3, %edi
	jmp	.L33
.L37:
	cmpl	$6, 24(%rsi)
	jne	.L36
	movq	.refptr.FALSE_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L36
	movq	(%rsi), %rdx
	xorl	%ebx, %ebx
	xorl	%r9d, %r9d
	xorl	%esi, %esi
	movl	$4, %edi
	jmp	.L33
.L36:
	cmpl	$5, 24(%rsi)
	jne	.L46
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L39
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	136(%rsp), %rdx
	movq	128(%rsp), %rcx
	movq	%rbp, %r8
	movq	%rax, %rbx
	call	parse_expression
	movq	%rbx, %rdx
	leaq	.LC6(%rip), %rcx
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L126
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movl	24(%rax), %edi
	movq	%rax, %rbx
	cmpl	$5, %edi
	je	.L42
.L44:
	movq	%rbx, %rdx
	leaq	.LC7(%rip), %rcx
.L126:
	call	parser_error
	xorl	%eax, %eax
	jmp	.L31
.L42:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L44
	xorl	%ebx, %ebx
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	jmp	.L33
.L39:
	cmpl	$5, 24(%rsi)
	jne	.L46
	movq	.refptr.NOT_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L45
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	136(%rsp), %rdx
	movq	128(%rsp), %rcx
	movq	%rbp, %r8
	movq	%rax, %rbx
	call	parse_primary
	movq	%rbx, %rdx
	leaq	.LC8(%rip), %rcx
	movq	%rax, %r9
	testq	%rax, %rax
	je	.L126
	xorl	%ebx, %ebx
	xorl	%esi, %esi
	xorl	%edx, %edx
	movl	$6, %edi
	jmp	.L33
.L45:
	cmpl	$5, 24(%rsi)
	jne	.L46
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L46
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	136(%rsp), %rdx
	movq	128(%rsp), %rcx
	movq	%rbp, %r8
	movq	%rax, %rbx
	call	parse_primary
	movq	%rbx, %rdx
	leaq	.LC9(%rip), %rcx
	movq	%rax, %r9
	testq	%rax, %rax
	je	.L126
	xorl	%ebx, %ebx
	xorl	%esi, %esi
	xorl	%edx, %edx
	movl	$7, %edi
.L33:
	movq	%rbx, 32(%rsp)
	movq	%rsi, %r8
	movl	%edi, %ecx
	call	create_primary
	jmp	.L31
.L46:
	movl	24(%rsi), %eax
	cmpl	$1, %eax
	jne	.L125
.L50:
	movq	128(%rsp), %rcx
	call	peek_current_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	jne	.L47
	jmp	.L48
.L125:
	cmpl	$6, %eax
	jne	.L49
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L49
	cmpb	$0, 1(%rbp)
	jne	.L50
	jmp	.L49
.L47:
	cmpl	$6, %eax
	je	.L51
.L53:
	movq	%rbx, %rdx
	leaq	.LC10(%rip), %rcx
	jmp	.L128
.L51:
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L53
.L48:
	movq	(%rbx), %rdx
	movq	136(%rsp), %rcx
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	call	search
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movq	%rcx, 32(%rsp)
	movq	%rax, %r8
	xorl	%ecx, %ecx
	movq	%rax, %rdi
	call	create_variable_access
	movq	128(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, %rbx
	call	peek_next_token
	movq	%rax, %r14
	jmp	.L54
.L59:
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L70
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	136(%rsp), %rdx
	movq	128(%rsp), %rcx
	movq	%rbp, %r8
	movq	%rax, %r15
	call	parse_expression
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L71
	movq	%r15, %rdx
	leaq	.LC15(%rip), %rcx
	call	parser_error
.L71:
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r15
	jne	.L73
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L73
	xorl	%edx, %edx
	movq	%r14, %r9
	xorl	%r8d, %r8d
	movl	$3, %ecx
	movq	%rdx, 32(%rsp)
	movq	%rbx, %rdx
	call	create_variable_access
	movq	%rax, %rbx
.L69:
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	peek_next_token
	movq	%rax, %r14
.L54:
	cmpl	$5, 24(%r14)
	jne	.L79
	testq	%rdi, %rdi
	jne	.L129
.L55:
	testq	%r13, %r13
	je	.L130
.L58:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L59
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %r12
	testq	%rdi, %rdi
	jne	.L60
	movq	%rax, %rdx
	leaq	.LC11(%rip), %rcx
	call	parser_error
.L60:
	movl	24(%rdi), %eax
	subl	$2, %eax
	cmpl	$1, %eax
	jbe	.L61
	movq	%r12, %rdx
	leaq	.LC12(%rip), %rcx
	call	parser_error
.L61:
	movq	128(%rsp), %rcx
	movl	$1, %edx
	leaq	.LC13(%rip), %r14
	call	get_next_token
	movq	%rax, %r12
	call	create_list
	movq	%rax, %r13
.L62:
	cmpl	$5, 24(%r12)
	je	.L131
.L68:
	movq	136(%rsp), %rdx
	movq	128(%rsp), %rcx
	movq	%rbp, %r8
	call	parse_expression
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L63
	movq	%r12, %rdx
	movq	%r14, %rcx
	call	parser_error
.L63:
	movq	%r15, %rdx
	movq	%r13, %rcx
	call	list_append
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	je	.L64
.L67:
	movq	%r12, %rdx
	leaq	.LC14(%rip), %rcx
.L128:
	call	parser_error
	jmp	.L52
.L129:
	movl	24(%rdi), %eax
	leal	-1(%rax), %edx
	cmpl	$2, %edx
	jbe	.L85
	cmpl	$5, %eax
	jne	.L56
.L85:
	movq	16(%rdi), %r12
	jmp	.L55
.L56:
	andl	$-5, %eax
	cmove	%rdi, %r12
	jmp	.L55
.L130:
	testq	%r12, %r12
	je	.L58
	cmpl	$4, 24(%r12)
	jne	.L58
	movq	16(%r12), %r13
	jmp	.L58
.L64:
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L65
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %r12
	jmp	.L62
.L65:
	cmpl	$5, 24(%r12)
	jne	.L67
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L62
	jmp	.L67
.L131:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L68
	movq	%r13, 32(%rsp)
	movq	%rbx, %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$1, %ecx
	call	create_variable_access
	movq	16(%rdi), %rdi
	movq	%rax, %rbx
	jmp	.L127
.L73:
	movq	%r15, %rdx
	leaq	.LC16(%rip), %rcx
	jmp	.L128
.L70:
	movq	.refptr.DOT_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L74
.L79:
	testq	%rbx, %rbx
	je	.L52
	xorl	%r9d, %r9d
	xorl	%esi, %esi
	xorl	%edx, %edx
	movl	$8, %edi
	jmp	.L33
.L74:
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	128(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %r12
	testq	%r13, %r13
	jne	.L75
	movq	%rax, %rdx
	leaq	.LC17(%rip), %rcx
	jmp	.L128
.L75:
	cmpl	$1, 24(%rax)
	je	.L76
	movq	%rax, %rdx
	leaq	.LC18(%rip), %rcx
	jmp	.L128
.L76:
	movq	(%rax), %rdx
	movq	%r13, %rcx
	call	search
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L77
	movq	%r12, %rdx
	leaq	.LC19(%rip), %rcx
	jmp	.L128
.L77:
	xorl	%eax, %eax
	movq	%rbx, %rdx
	xorl	%r9d, %r9d
	movq	%rdi, %r8
	movq	%rax, 32(%rsp)
	movl	$2, %ecx
	call	create_variable_access
	movq	%rax, %rbx
.L127:
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	jmp	.L69
.L52:
	movq	%rsi, %rdx
	leaq	.LC20(%rip), %rcx
	jmp	.L126
.L49:
	movq	%rsi, %rdx
	leaq	.LC21(%rip), %rcx
	jmp	.L126
.L31:
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
	.seh_endproc
	.section .rdata,"dr"
.LC22:
	.ascii "Failed to parse right operand\0"
	.text
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
	movq	%rdx, %rsi
	movl	%r8d, %r15d
	movq	%r9, %r12
.L150:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	jne	.L145
	movq	(%rax), %rcx
	call	string_to_operator
	movl	%eax, %ecx
	movl	%eax, %ebp
	call	operator_precedence
	movl	%eax, %r13d
	cmpl	$19, %ebp
	je	.L145
	cmpl	%r15d, %eax
	jge	.L134
.L145:
	movq	%rbx, %rcx
	call	peek_current_token
	jmp	.L132
.L134:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	160(%rsp), %r8
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movq	%rax, %rdi
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	jne	.L137
	movq	%rdi, %rdx
	leaq	.LC22(%rip), %rcx
	call	parser_error
	jmp	.L138
.L137:
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %rdi
.L149:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	jne	.L143
	movq	(%rax), %rcx
	call	string_to_operator
	movl	%eax, %ecx
	movl	%eax, %r14d
	call	operator_precedence
	movl	%eax, %r8d
	cmpl	$19, %r14d
	je	.L143
	cmpl	%eax, %r13d
	jl	.L140
.L143:
	movq	%rsi, %rdx
	movq	%rdi, %r9
	xorl	%r8d, %r8d
	movl	%ebp, %ecx
	call	create_expression
	movq	%rax, %rsi
	jmp	.L150
.L140:
	movq	160(%rsp), %rax
	movq	%rdi, %rdx
	movq	%r12, %r9
	movq	%rbx, %rcx
	movq	%rax, 32(%rsp)
	call	parse_expr_prec
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L149
.L138:
	xorl	%esi, %esi
.L132:
	movq	%rsi, %rax
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
	.seh_endproc
	.section .rdata,"dr"
.LC23:
	.ascii "Expected '(' after 'if'\0"
.LC24:
	.ascii "Failed to parse if condition\0"
.LC25:
	.ascii "Expected ')' after if condition\0"
.LC26:
	.ascii "Expected '{' to start if body\0"
.LC27:
	.ascii "Failed to parse if body statement\0"
.LC28:
	.ascii "Expected '(' after 'elif'\0"
.LC29:
	.ascii "Failed to parse else-if condition\0"
.LC30:
	.ascii "Expected ')' after else-if condition\0"
.LC31:
	.ascii "Expected '{' to start else-if body\0"
.LC32:
	.ascii "Failed to parse else-if body statement\0"
.LC33:
	.ascii "Expected '{' to start else body\0"
.LC34:
	.ascii "Failed to parse else body statement\0"
.LC35:
	.ascii "Expected '(' after 'for'\0"
.LC36:
	.ascii "Failed to parse for loop initializer\0"
.LC37:
	.ascii "Expected ';' after for loop initializer\0"
.LC38:
	.ascii "Failed to parse for loop condition\0"
.LC39:
	.ascii "Expected ';' after for loop condition\0"
.LC40:
	.ascii "Failed to parse for loop increment\0"
.LC41:
	.ascii "Expected ')' after for loop increment\0"
.LC42:
	.ascii "Expected '{' to start for loop body\0"
.LC43:
	.ascii "Failed to parse for loop body statement\0"
.LC44:
	.ascii "Expected '(' after 'while'\0"
.LC45:
	.ascii "Failed to parse while condition\0"
.LC46:
	.ascii "Expected ')' after while condition\0"
.LC47:
	.ascii "Expected '{' to start while body\0"
.LC48:
	.ascii "Failed to parse while body statement\0"
.LC49:
	.ascii "Cannot use 'break' outside of a loop\0"
.LC50:
	.ascii "Cannot use 'continue' outside of a loop\0"
.LC51:
	.ascii "Failed to parse statement\0"
.LC52:
	.ascii "Expected ';' after statement\0"
	.text
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
	subq	$88, %rsp
	.seh_stackalloc	88
	.seh_endprologue
	movq	%rcx, 160(%rsp)
	movq	%r8, %rbx
	movq	%rdx, 168(%rsp)
	call	peek_current_token
	cmpl	$6, 24(%rax)
	movq	%rax, %rsi
	jne	.L152
	movq	.refptr.IF_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L153
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L154
.L156:
	movq	%rsi, %rdx
	leaq	.LC23(%rip), %rcx
	jmp	.L321
.L154:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L156
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	movq	%rax, %rdi
	call	parse_expression
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L157
	movq	%rdi, %rdx
	leaq	.LC24(%rip), %rcx
	call	parser_error
.L157:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rdi
	je	.L158
.L159:
	movq	%rdi, %rdx
	leaq	.LC25(%rip), %rcx
.L321:
	call	parser_error
	xorl	%edx, %edx
	jmp	.L181
.L158:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r14
	movq	(%rax), %rcx
	movq	(%r14), %rdx
	call	string_equal
	testb	%al, %al
	je	.L159
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rdi
	je	.L160
.L161:
	movq	%rdi, %rdx
	leaq	.LC26(%rip), %rcx
	jmp	.L321
.L160:
	movq	.refptr.L_BRACE_SYMBOL(%rip), %r13
	movq	(%rax), %rcx
	movq	0(%r13), %rdx
	call	string_equal
	testb	%al, %al
	je	.L161
	call	create_list
	movq	160(%rsp), %rcx
	movl	$1, %edx
	leaq	.LC27(%rip), %rdi
	movq	%rax, 48(%rsp)
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rbp
	movq	%rax, %r12
.L162:
	cmpl	$5, 24(%r12)
	je	.L327
.L164:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L163
	movq	%r12, %rdx
	movq	%rdi, %rcx
	call	parser_error
.L163:
	movq	48(%rsp), %rcx
	movq	%r15, %rdx
	call	list_append
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %r12
	jmp	.L162
.L327:
	movq	0(%rbp), %rdx
	movq	(%r12), %rcx
	call	string_equal
	testb	%al, %al
	je	.L164
	call	create_list
	leaq	.LC32(%rip), %r15
	movq	%rax, 56(%rsp)
	call	create_list
	movq	160(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, 64(%rsp)
	call	peek_next_token
	movq	%rax, %rbp
.L165:
	cmpl	$6, 24(%rbp)
	jne	.L177
	movq	.refptr.ELIF_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L328
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L166
.L167:
	movq	%rbp, %rdx
	leaq	.LC28(%rip), %rcx
	jmp	.L321
.L166:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L167
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	movq	%rax, %r12
	call	parse_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L168
	movq	%r12, %rdx
	leaq	.LC29(%rip), %rcx
	call	parser_error
.L168:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	je	.L169
.L170:
	movq	%r12, %rdx
	leaq	.LC30(%rip), %rcx
	jmp	.L321
.L169:
	movq	(%r14), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	je	.L170
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	je	.L171
.L172:
	movq	%r12, %rdx
	leaq	.LC31(%rip), %rcx
	jmp	.L321
.L171:
	movq	0(%r13), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	je	.L172
	call	create_list
	movq	%rax, %r12
.L320:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rdi
	je	.L329
.L175:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_statement
	testq	%rax, %rax
	jne	.L174
	movq	%rdi, %rdx
	movq	%r15, %rcx
	movq	%rax, 72(%rsp)
	call	parser_error
	movq	72(%rsp), %rax
.L174:
	movq	%rax, %rdx
	movq	%r12, %rcx
	call	list_append
	jmp	.L320
.L329:
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rdi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L175
	movq	%rbp, %rcx
	movq	%r12, %rdx
	call	create_else_if
	movq	56(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	peek_next_token
	movq	%rax, %rbp
	jmp	.L165
.L328:
	cmpl	$6, 24(%rbp)
	jne	.L177
	movq	.refptr.ELSE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L330
.L177:
	movq	160(%rsp), %rcx
	call	peek_current_token
	movq	48(%rsp), %rdx
	movq	64(%rsp), %r9
	movq	%rsi, %rcx
	movq	56(%rsp), %r8
	call	create_if
	movq	%rax, %rdx
	jmp	.L181
.L330:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L182
.L183:
	movq	%rbp, %rdx
	leaq	.LC33(%rip), %rcx
	jmp	.L321
.L182:
	movq	0(%r13), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	je	.L183
	movq	160(%rsp), %rcx
	movl	$1, %edx
	leaq	.LC34(%rip), %rbp
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12
	movq	%rax, %r13
.L184:
	cmpl	$5, 24(%r13)
	je	.L331
.L186:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L185
	movq	%r13, %rdx
	movq	%rbp, %rcx
	call	parser_error
.L185:
	movq	64(%rsp), %rcx
	movq	%r14, %rdx
	call	list_append
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %r13
	jmp	.L184
.L331:
	movq	(%r12), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	je	.L186
	jmp	.L177
.L181:
	xorl	%esi, %esi
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ecx
	movq	%rsi, 40(%rsp)
	movq	%rsi, 32(%rsp)
	jmp	.L326
.L153:
	movq	.refptr.FOR_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L188
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L189
.L191:
	movq	%rsi, %rdx
	leaq	.LC35(%rip), %rcx
	jmp	.L322
.L189:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L191
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rdi
	je	.L192
.L195:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_variable
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L194
	movq	%rdi, %rdx
	leaq	.LC36(%rip), %rcx
	call	parser_error
	jmp	.L194
.L192:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rdi), %rcx
	xorl	%esi, %esi
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L196
	jmp	.L195
.L194:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rdi
.L196:
	cmpl	$5, 24(%rdi)
	je	.L197
.L199:
	movq	%rdi, %rdx
	leaq	.LC37(%rip), %rcx
.L322:
	call	parser_error
	xorl	%r9d, %r9d
	jmp	.L198
.L197:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %r12
	movq	(%rdi), %rcx
	movq	(%r12), %rdx
	call	string_equal
	testb	%al, %al
	je	.L199
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L200
.L203:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_expression
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L202
	movq	%rbp, %rdx
	leaq	.LC38(%rip), %rcx
	call	parser_error
	jmp	.L202
.L200:
	movq	(%r12), %rdx
	movq	(%rax), %rcx
	xorl	%edi, %edi
	call	string_equal
	testb	%al, %al
	jne	.L204
	jmp	.L203
.L202:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rbp
.L204:
	cmpl	$5, 24(%rbp)
	je	.L205
.L206:
	movq	%rbp, %rdx
	leaq	.LC39(%rip), %rcx
	jmp	.L322
.L205:
	movq	(%r12), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	je	.L206
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	je	.L207
.L210:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L209
	movq	%r12, %rdx
	leaq	.LC40(%rip), %rcx
	call	parser_error
	jmp	.L209
.L207:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%r12), %rcx
	xorl	%ebp, %ebp
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L211
	jmp	.L210
.L209:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %r12
.L211:
	cmpl	$5, 24(%r12)
	je	.L212
.L213:
	movq	%r12, %rdx
	leaq	.LC41(%rip), %rcx
	jmp	.L322
.L212:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L213
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	je	.L214
.L215:
	movq	%r12, %rdx
	leaq	.LC42(%rip), %rcx
	jmp	.L322
.L214:
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%r12), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L215
	call	create_list
	movb	$1, 2(%rbx)
	movq	160(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, %r12
	leaq	.LC43(%rip), %r13
	call	get_next_token
	movq	%rax, %r15
.L216:
	cmpl	$5, 24(%r15)
	je	.L332
.L218:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L217
	movq	%r15, %rdx
	movq	%r13, %rcx
	call	parser_error
.L217:
	movq	%r14, %rdx
	movq	%r12, %rcx
	call	list_append
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %r15
	jmp	.L216
.L332:
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L218
	movb	$0, 2(%rbx)
	movq	%r12, %r9
	movq	%rbp, %r8
	movq	%rdi, %rdx
	movq	%rsi, %rcx
	call	create_for
	movq	%rax, %r9
.L198:
	xorl	%ebx, %ebx
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$4, %ecx
	movq	%rbx, 40(%rsp)
	movq	%rbx, 32(%rsp)
.L326:
	call	create_statement
	movq	%rax, %rbx
	jmp	.L151
.L188:
	movq	.refptr.WHILE_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L219
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L220
.L222:
	movq	%rsi, %rdx
	leaq	.LC44(%rip), %rcx
	jmp	.L323
.L220:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L222
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	movq	%rax, %rsi
	call	parse_expression
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L223
	movq	%rsi, %rdx
	leaq	.LC45(%rip), %rcx
	call	parser_error
.L223:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L224
.L226:
	movq	%rsi, %rdx
	leaq	.LC46(%rip), %rcx
.L323:
	call	parser_error
	xorl	%r8d, %r8d
	jmp	.L225
.L224:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L226
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L227
.L228:
	movq	%rsi, %rdx
	leaq	.LC47(%rip), %rcx
	jmp	.L323
.L227:
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L228
	call	create_list
	movb	$1, 2(%rbx)
	movq	160(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, %rbp
	leaq	.LC48(%rip), %r13
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12
	movq	%rax, %rsi
.L229:
	cmpl	$5, 24(%rsi)
	je	.L333
.L231:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L230
	movq	%rsi, %rdx
	movq	%r13, %rcx
	call	parser_error
.L230:
	movq	%r14, %rdx
	movq	%rbp, %rcx
	call	list_append
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rsi
	jmp	.L229
.L333:
	movq	(%r12), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L231
	movb	$0, 2(%rbx)
	movq	%rbp, %rdx
	movq	%rdi, %rcx
	call	create_while
	movq	%rax, %r8
.L225:
	xorl	%r11d, %r11d
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$3, %ecx
	movq	%r11, 40(%rsp)
	movq	%r11, 32(%rsp)
	jmp	.L326
.L219:
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L232
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_variable
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, 40(%rsp)
	xorl	%edx, %edx
	movl	$1, %ecx
	movq	%r10, 32(%rsp)
	jmp	.L325
.L232:
	movq	.refptr.RETURN_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L234
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_expression
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%r9, 40(%rsp)
	movl	$5, %ecx
	xorl	%r9d, %r9d
	movq	%rax, 32(%rsp)
	jmp	.L325
.L234:
	movq	.refptr.BREAK_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L235
	cmpb	$0, 2(%rbx)
	movq	%rsi, %rdx
	leaq	.LC49(%rip), %rcx
	je	.L324
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$6, %ecx
	movq	%r8, 40(%rsp)
	movq	%r8, 32(%rsp)
	xorl	%r8d, %r8d
	jmp	.L325
.L235:
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L152
	cmpb	$0, 2(%rbx)
	jne	.L239
	movq	%rsi, %rdx
	leaq	.LC50(%rip), %rcx
.L324:
	call	parser_error
	xorl	%ebx, %ebx
	jmp	.L151
.L239:
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rcx, 40(%rsp)
	movq	%rcx, 32(%rsp)
	movl	$7, %ecx
	jmp	.L325
.L152:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	parse_expression
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, 32(%rsp)
	xorl	%ecx, %ecx
	movq	%rdx, 40(%rsp)
	xorl	%edx, %edx
.L325:
	call	create_statement
	movq	160(%rsp), %rcx
	movq	%rax, %rbx
	call	peek_current_token
	movq	%rax, %rdx
	testq	%rbx, %rbx
	jne	.L240
	leaq	.LC51(%rip), %rcx
	call	parser_error
.L240:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L241
.L243:
	movq	%rsi, %rdx
	leaq	.LC52(%rip), %rcx
	call	parser_error
	jmp	.L151
.L241:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L243
.L151:
	movq	%rbx, %rax
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
	.seh_endproc
	.section .rdata,"dr"
.LC53:
	.ascii "Expected identifier after 'import'\0"
.LC54:
	.ascii "Expected string literal after 'from'\0"
.LC55:
	.ascii "Expected ';' at end of import statement\0"
.LC56:
	.ascii "Failed to parse import statement\0"
.LC57:
	.ascii "Expected function return type after 'func'\0"
.LC58:
	.ascii "Unknown function return type\0"
.LC59:
	.ascii "Expected function name after return type\0"
.LC60:
	.ascii "Expected '(' after function name\0"
.LC61:
	.ascii "Failed to parse function parameter\0"
.LC62:
	.ascii "Function parameters cannot have default values\0"
.LC63:
	.ascii "Expected ',' or ')' after function parameter\0"
.LC64:
	.ascii "Expected '{' to start function body\0"
.LC65:
	.ascii "Failed to parse function body statement\0"
.LC66:
	.ascii "Unreachable code after return statement\0"
.LC67:
	.ascii "Function missing return statement\0"
.LC68:
	.ascii "Failed to parse function declaration\0"
.LC69:
	.ascii "Expected class name after 'class'\0"
.LC70:
	.ascii "Expected '{' to start class body\0"
.LC71:
	.ascii "Expected method return type after 'method'\0"
.LC72:
	.ascii "Unknown return type for method\0"
.LC73:
	.ascii "Expected method name after return type\0"
.LC74:
	.ascii "Expected '(' after method name\0"
.LC75:
	.ascii "Expected 'self' as first parameter of method\0"
.LC76:
	.ascii "Expected ',' or ')' after method parameter\0"
.LC77:
	.ascii "Failed to parse method parameter\0"
.LC78:
	.ascii "Method parameters cannot have default values\0"
.LC79:
	.ascii "Expected '{' to start method body\0"
.LC80:
	.ascii "Failed to parse method body statement\0"
.LC81:
	.ascii "Method missing return statement\0"
.LC82:
	.ascii "Failed to parse class method\0"
.LC83:
	.ascii "Failed to parse class variable\0"
.LC84:
	.ascii "Expected ';' after class variable declaration\0"
.LC85:
	.ascii "Unexpected token in class member\0"
.LC86:
	.ascii "Failed to parse class declaration\0"
.LC87:
	.ascii "Unexpected token in code member\0"
	.text
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
	subq	$136, %rsp
	.seh_stackalloc	136
	.seh_endprologue
	movq	.refptr.builtin_scope(%rip), %rbx
	cmpq	$0, (%rbx)
	movq	%rcx, 48(%rsp)
	movq	%rdx, %rsi
	movq	%r8, %r14
	jne	.L335
	xorl	%ecx, %ecx
	call	create_scope
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, (%rbx)
	movq	%rax, 32(%rsp)
	movq	.refptr.VOID_KEYWORD(%rip), %rax
	movq	(%rax), %rcx
	call	create_name
	movq	.refptr.name_void(%rip), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, (%rdx)
	movq	(%rbx), %rax
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	movq	.refptr.INT_KEYWORD(%rip), %rax
	movq	(%rax), %rcx
	call	create_name
	movq	.refptr.name_int(%rip), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, (%rdx)
	movq	(%rbx), %rax
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	movq	(%rax), %rcx
	call	create_name
	movq	.refptr.name_float(%rip), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, (%rdx)
	movq	(%rbx), %rax
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	movq	(%rax), %rcx
	call	create_name
	movq	.refptr.name_string(%rip), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, (%rdx)
	movq	(%rbx), %rax
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	movq	(%rax), %rcx
	call	create_name
	movq	.refptr.name_bool(%rip), %rdx
	movq	%rax, (%rdx)
.L335:
	testq	%rsi, %rsi
	jne	.L336
	movq	(%rbx), %rsi
.L336:
	call	create_list
	movq	%rsi, %rcx
	movq	%rax, 64(%rsp)
	call	create_scope
	movq	%rax, %r12
.L350:
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L423
	movl	24(%rax), %eax
	testl	%eax, %eax
	je	.L423
	cmpl	$6, %eax
	jne	.L378
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %esi
	testb	%al, %al
	je	.L339
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	leaq	.LC53(%rip), %rcx
	cmpl	$1, 24(%rax)
	movq	%rax, %rdx
	jne	.L498
	movq	48(%rsp), %rcx
	movl	$1, %edx
	movq	(%rax), %rdi
	call	get_next_token
	cmpl	$6, 24(%rax)
	movq	%rax, %rbp
	jne	.L342
	movq	.refptr.FROM_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L343
.L342:
	xorl	%esi, %esi
	jmp	.L344
.L343:
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$4, 24(%rax)
	movq	%rax, %rdx
	je	.L345
	leaq	.LC54(%rip), %rcx
.L498:
	call	parser_error
	jmp	.L341
.L345:
	movq	48(%rsp), %rcx
	movl	$1, %edx
	movq	(%rax), %rsi
	call	get_next_token
	movq	%rax, %rbp
.L344:
	cmpl	$5, 24(%rbp)
	je	.L346
.L347:
	movq	%rbp, %rdx
	leaq	.LC55(%rip), %rcx
	jmp	.L498
.L346:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L347
	movq	%r12, %r8
	movq	%rsi, %rdx
	movq	%rdi, %rcx
	call	parse_import_file
	testq	%rax, %rax
	jne	.L348
	movq	%r12, 32(%rsp)
	xorl	%r9d, %r9d
	movl	$1, %edx
	movq	%rdi, %rcx
	movq	.refptr.name_void(%rip), %rax
	movq	(%rax), %r8
	call	create_name
.L348:
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	create_import
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L349
.L341:
	movq	%rbx, %rdx
	leaq	.LC56(%rip), %rcx
	call	parser_error
	xorl	%edx, %edx
.L349:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	jmp	.L508
.L339:
	cmpl	$6, 24(%rbx)
	jne	.L378
	movq	.refptr.FUNC_KEYWORD(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L351
	movq	%r12, %rcx
	call	create_scope
	movq	48(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, %r15
	call	get_next_token
	movq	%rax, %rbp
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L352
	cmpl	$6, %eax
	je	.L353
.L355:
	movq	%rbp, %rdx
	leaq	.LC57(%rip), %rcx
	jmp	.L502
.L353:
	movq	0(%rbp), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L355
.L352:
	movq	0(%rbp), %rdx
	movq	%r12, %rcx
	call	search
	movq	%rbp, %rdx
	leaq	.LC58(%rip), %rcx
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L502
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$1, 24(%rax)
	je	.L357
	movq	%rax, %rdx
	leaq	.LC59(%rip), %rcx
.L502:
	call	parser_error
	jmp	.L354
.L357:
	movq	%r12, 32(%rsp)
	movq	(%rax), %rcx
	xorl	%r9d, %r9d
	movq	%rdi, %r8
	movl	$2, %edx
	call	create_name
	movq	48(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, 80(%rsp)
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L358
.L359:
	movq	%rbp, %rdx
	leaq	.LC60(%rip), %rcx
	jmp	.L502
.L358:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L359
	movq	48(%rsp), %rcx
	movl	$1, %edx
	leaq	.LC62(%rip), %r13
	call	get_next_token
	movq	%rax, %rbp
	call	create_list
	movq	%rax, 56(%rsp)
.L360:
	cmpl	$5, 24(%rbp)
	je	.L509
.L368:
	movq	48(%rsp), %rcx
	movq	%r15, %rdx
	movq	%r14, %r8
	call	parse_variable
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L361
	movq	%rbp, %rdx
	leaq	.LC61(%rip), %rcx
	jmp	.L499
.L361:
	cmpq	$0, 16(%rax)
	je	.L363
	movq	%rbp, %rdx
	movq	%r13, %rcx
.L499:
	call	parser_error
	jmp	.L362
.L363:
	movq	56(%rsp), %rcx
	call	list_append
.L362:
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L364
.L367:
	movq	%rbp, %rdx
	leaq	.LC63(%rip), %rcx
	jmp	.L502
.L364:
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L365
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rbp
	jmp	.L360
.L365:
	cmpl	$5, 24(%rbp)
	jne	.L367
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L360
	jmp	.L367
.L509:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L368
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L369
.L370:
	movq	%rbp, %rdx
	leaq	.LC64(%rip), %rcx
	jmp	.L502
.L369:
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L370
	call	create_list
	movb	$1, (%r14)
	movq	%rax, 72(%rsp)
.L501:
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	je	.L510
.L375:
	movq	48(%rsp), %rcx
	movq	%r15, %rdx
	movq	%r14, %r8
	call	parse_statement
	movq	%r13, %rdx
	leaq	.LC65(%rip), %rcx
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L500
	testb	%sil, %sil
	je	.L373
	leaq	.LC66(%rip), %rcx
.L500:
	call	parser_error
.L373:
	movq	72(%rsp), %rcx
	cmpl	$5, 8(%rbp)
	movb	$1, %al
	movq	%rbp, %rdx
	cmove	%eax, %esi
	call	list_append
	jmp	.L501
.L510:
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	0(%r13), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L375
	movb	$0, (%r14)
	testb	%sil, %sil
	jne	.L376
	movq	.refptr.name_void(%rip), %rax
	cmpq	(%rax), %rdi
	je	.L376
	movq	%r13, %rdx
	leaq	.LC67(%rip), %rcx
	call	parser_error
.L376:
	movq	%r15, 32(%rsp)
	movq	56(%rsp), %r8
	movq	%rdi, %rdx
	movq	72(%rsp), %r9
	movq	80(%rsp), %rcx
	call	create_function
	movq	%rax, %r8
	testq	%rax, %rax
	jne	.L377
.L354:
	movq	%rbx, %rdx
	leaq	.LC68(%rip), %rcx
	call	parser_error
	xorl	%r8d, %r8d
.L377:
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$1, %ecx
	jmp	.L508
.L351:
	cmpl	$6, 24(%rbx)
	jne	.L378
	movq	.refptr.CLASS_KEYWORD(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L378
	movq	%r12, %rcx
	call	create_scope
	movq	48(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, 56(%rsp)
	call	get_next_token
	leaq	.LC69(%rip), %rcx
	cmpl	$1, 24(%rax)
	movq	%rax, %rdx
	jne	.L507
	movq	%r12, 32(%rsp)
	movq	(%rax), %rcx
	xorl	%r8d, %r8d
	movl	$4, %edx
	movq	56(%rsp), %r9
	call	create_name
	movq	48(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, 88(%rsp)
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L381
.L382:
	movq	%rsi, %rdx
	leaq	.LC70(%rip), %rcx
.L507:
	call	parser_error
	jmp	.L380
.L381:
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L382
	call	create_list
	movq	%rax, 96(%rsp)
.L417:
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L511
.L421:
	cmpl	$6, 24(%rsi)
	jne	.L384
	movq	.refptr.METHOD_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L385
	movq	56(%rsp), %rcx
	call	create_scope
	movq	88(%rsp), %r8
	xorl	%r9d, %r9d
	movl	$1, %edx
	movq	%rax, 32(%rsp)
	movq	%rax, 72(%rsp)
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rcx
	call	create_name
	movq	48(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, %rbp
	call	get_next_token
	movq	%rax, %rdi
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L386
	cmpl	$6, %eax
	je	.L387
.L389:
	movq	%rdi, %rdx
	leaq	.LC71(%rip), %rcx
	jmp	.L505
.L387:
	movq	(%rdi), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L389
.L386:
	movq	(%rdi), %rdx
	movq	56(%rsp), %rcx
	call	search
	movq	%rdi, %rdx
	leaq	.LC72(%rip), %rcx
	movq	%rax, 80(%rsp)
	testq	%rax, %rax
	je	.L505
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$1, 24(%rax)
	je	.L391
	movq	%rax, %rdx
	leaq	.LC73(%rip), %rcx
.L505:
	call	parser_error
	jmp	.L388
.L391:
	movq	56(%rsp), %rdi
	movq	80(%rsp), %r8
	xorl	%r9d, %r9d
	movl	$3, %edx
	movq	%rdi, 32(%rsp)
	movq	(%rax), %rcx
	call	create_name
	movq	48(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, 120(%rsp)
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rdi
	je	.L392
.L393:
	movq	%rdi, %rdx
	leaq	.LC74(%rip), %rcx
	jmp	.L505
.L392:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rdi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L393
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$6, 24(%rax)
	movq	%rax, %rdi
	je	.L394
.L396:
	movq	%rdi, %rdx
	leaq	.LC75(%rip), %rcx
	call	parser_error
	jmp	.L395
.L394:
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rdi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L396
.L395:
	movq	48(%rsp), %rcx
	movl	$1, %edx
	leaq	.LC78(%rip), %r13
	call	get_next_token
	movq	%rax, %r15
	call	create_list
	movq	88(%rsp), %rcx
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movq	%rax, 104(%rsp)
	call	create_variable
	movq	104(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rdi
.L397:
	cmpl	$5, 24(%r15)
	je	.L512
.L403:
	movq	%r15, %rdx
	leaq	.LC76(%rip), %rcx
	jmp	.L505
.L512:
	movq	(%rdi), %rdx
	movq	(%r15), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L409
	cmpl	$5, 24(%r15)
	jne	.L403
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L399
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	72(%rsp), %rdx
	movq	48(%rsp), %rcx
	movq	%r14, %r8
	movq	%rax, %rbp
	call	parse_variable
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L496
	movq	%rbp, %rdx
	leaq	.LC77(%rip), %rcx
	jmp	.L503
.L399:
	cmpl	$5, 24(%r15)
	jne	.L403
	movq	(%rdi), %rdx
	movq	(%r15), %rcx
	call	string_equal
	testb	%al, %al
	je	.L403
.L409:
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L497
	jmp	.L404
.L496:
	cmpq	$0, 16(%rax)
	je	.L407
	movq	%rbp, %rdx
	movq	%r13, %rcx
.L503:
	call	parser_error
	jmp	.L406
.L407:
	movq	104(%rsp), %rcx
	call	list_append
.L406:
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %r15
	jmp	.L397
.L404:
	movq	%rbp, %rdx
	leaq	.LC79(%rip), %rcx
	jmp	.L505
.L497:
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L404
	call	create_list
	movw	$257, (%r14)
	movq	48(%rsp), %rcx
	xorl	%r13d, %r13d
	movl	$1, %edx
	movq	%rax, 112(%rsp)
	leaq	.LC80(%rip), %r15
	call	get_next_token
	movq	%rax, %rdi
.L410:
	cmpl	$5, 24(%rdi)
	je	.L513
.L414:
	movq	72(%rsp), %rdx
	movq	48(%rsp), %rcx
	movq	%r14, %r8
	call	parse_statement
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L411
	movq	%rdi, %rdx
	movq	%r15, %rcx
	jmp	.L504
.L411:
	testb	%r13b, %r13b
	je	.L412
	movq	%rdi, %rdx
	leaq	.LC66(%rip), %rcx
.L504:
	call	parser_error
.L412:
	movq	112(%rsp), %rcx
	cmpl	$5, 8(%rbp)
	movb	$1, %al
	movq	%rbp, %rdx
	cmove	%eax, %r13d
	call	list_append
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rdi
	jmp	.L410
.L513:
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rdi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L414
	movw	$0, (%r14)
	testb	%r13b, %r13b
	jne	.L415
	movq	.refptr.name_void(%rip), %rax
	movq	80(%rsp), %rdx
	cmpq	(%rax), %rdx
	je	.L415
	movq	%rdi, %rdx
	leaq	.LC81(%rip), %rcx
	call	parser_error
.L415:
	movq	72(%rsp), %rax
	movq	80(%rsp), %rdx
	movq	112(%rsp), %r9
	movq	104(%rsp), %r8
	movq	%rax, 32(%rsp)
	movq	120(%rsp), %rcx
	call	create_method
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L416
.L388:
	movq	%rsi, %rdx
	leaq	.LC82(%rip), %rcx
	call	parser_error
	xorl	%edx, %edx
.L416:
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	call	create_class_member
	movq	96(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L417
.L385:
	cmpl	$6, 24(%rsi)
	jne	.L384
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L384
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	56(%rsp), %rdx
	movq	48(%rsp), %rcx
	movq	%r14, %r8
	movq	%rax, %rsi
	call	parse_variable
	movq	%rax, %r8
	testq	%rax, %rax
	jne	.L418
	movq	%rsi, %rdx
	leaq	.LC83(%rip), %rcx
	movq	%rax, 72(%rsp)
	call	parser_error
	movq	72(%rsp), %r8
.L418:
	xorl	%edx, %edx
	movl	$1, %ecx
	call	create_class_member
	movq	96(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	48(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L419
.L420:
	movq	%rsi, %rdx
	leaq	.LC84(%rip), %rcx
	jmp	.L506
.L419:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L420
	jmp	.L417
.L384:
	movq	%rsi, %rdx
	leaq	.LC85(%rip), %rcx
.L506:
	call	parser_error
	jmp	.L417
.L511:
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L421
	movq	56(%rsp), %r8
	movq	96(%rsp), %rdx
	movq	88(%rsp), %rcx
	call	create_class
	movq	%rax, %r9
	testq	%rax, %rax
	jne	.L422
.L380:
	movq	%rbx, %rdx
	leaq	.LC86(%rip), %rcx
	call	parser_error
	xorl	%r9d, %r9d
.L422:
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$2, %ecx
.L508:
	call	create_code_member
	movq	64(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L350
.L423:
	movq	64(%rsp), %rcx
	movq	%r12, %rdx
	addq	$136, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	create_code
.L378:
	movq	%rbx, %rdx
	leaq	.LC87(%rip), %rcx
	call	parser_error
	jmp	.L350
	.seh_endproc
	.ident	"GCC: (GNU) 13.2.0"
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
	.def	parser_error;	.scl	2;	.type	32;	.endef
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.def	search;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	create_name;	.scl	2;	.type	32;	.endef
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	create_variable;	.scl	2;	.type	32;	.endef
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.def	create_else_if;	.scl	2;	.type	32;	.endef
	.def	create_if;	.scl	2;	.type	32;	.endef
	.def	create_for;	.scl	2;	.type	32;	.endef
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.def	create_while;	.scl	2;	.type	32;	.endef
	.def	create_scope;	.scl	2;	.type	32;	.endef
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.def	create_import;	.scl	2;	.type	32;	.endef
	.def	create_function;	.scl	2;	.type	32;	.endef
	.def	create_method;	.scl	2;	.type	32;	.endef
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.def	create_class;	.scl	2;	.type	32;	.endef
	.def	create_code_member;	.scl	2;	.type	32;	.endef
	.def	create_code;	.scl	2;	.type	32;	.endef
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
