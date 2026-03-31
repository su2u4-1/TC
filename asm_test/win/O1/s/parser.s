	.file	"D:\\TC\\src\\parser.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Failed to parse right operand\0"
	.text
	.def	parse_expr_prec;	.scl	3;	.type	32;	.endef
parse_expr_prec:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	movq	%rcx, %rdi
	movq	%rdx, %r13
	movl	%r8d, %r15d
	movq	%r9, %r14
	movl	$1, %edx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	je	.L7
	movq	%r13, %rsi
	jmp	.L2
.L15:
	movq	160(%rsp), %rax
	movq	(%rax), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC0(%rip), %rcx
	call	parser_error
	jmp	.L1
.L13:
	movl	$1, %edx
	movq	%rdi, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	jne	.L5
.L6:
	movq	(%rax), %rcx
	call	string_to_operator
	movl	%eax, %ebx
	movl	%eax, %ecx
	call	operator_precedence
	cmpl	$19, %ebx
	je	.L5
	cmpl	%eax, %ebp
	jge	.L5
	movq	160(%rsp), %rdx
	movq	%rdx, 32(%rsp)
	movq	%r14, %r9
	movl	%eax, %r8d
	movq	%rsi, %rdx
	movq	%rdi, %rcx
	call	parse_expr_prec
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L13
	jmp	.L1
.L5:
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r13, %rdx
	movl	%r12d, %ecx
	call	create_expression
	movq	%rax, %r13
	movl	$1, %edx
	movq	%rdi, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	jne	.L14
.L7:
	movq	(%rax), %rcx
	call	string_to_operator
	movl	%eax, %r12d
	movl	%eax, %ecx
	call	operator_precedence
	movl	%eax, %ebp
	cmpl	$19, %r12d
	je	.L9
	cmpl	%r15d, %eax
	jl	.L9
	movl	$1, %edx
	movq	%rdi, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rdi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	movq	160(%rsp), %r8
	movq	%r14, %rdx
	movq	%rdi, %rcx
	call	parse_primary
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L15
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %rsi
	movl	$1, %edx
	movq	%rdi, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	je	.L6
	jmp	.L5
.L14:
	movq	%r13, %rsi
	jmp	.L2
.L9:
	movq	%r13, %rsi
.L2:
	movq	%rdi, %rcx
	call	peek_current_token
.L1:
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
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "Failed to parse expression primary\0"
	.text
	.def	parse_expression;	.scl	3;	.type	32;	.endef
parse_expression:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	movq	%rcx, %rsi
	movq	%rdx, %rbp
	movq	%r8, %rdi
	call	parse_primary
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L20
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %rdx
	movq	%rdi, 32(%rsp)
	movq	%rbp, %r9
	movl	$0, %r8d
	movq	%rsi, %rcx
	call	parse_expr_prec
	movq	%rax, %rbx
.L16:
	movq	%rbx, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L20:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %rdi
	movq	%rsi, %rcx
	call	peek_current_token
	movq	%rax, %rdx
	movq	%rdi, %r8
	leaq	.LC1(%rip), %rcx
	call	parser_error
	jmp	.L16
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
	.def	parse_variable;	.scl	3;	.type	32;	.endef
parse_variable:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rsi
	movq	%rdx, %rbp
	movq	%r8, %r12
	call	peek_current_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L22
	cmpl	$6, %eax
	jne	.L23
	movq	(%rbx), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L23
.L22:
	movq	(%rbx), %rdx
	movq	%rbp, %rcx
	call	search_name
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L25
	movl	32(%rax), %eax
	cmpl	$6, %eax
	je	.L26
	testl	%eax, %eax
	jne	.L32
.L26:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	cmpl	$1, 24(%rax)
	jne	.L33
.L27:
	movq	(%rbx), %rcx
	movq	%rbp, %r9
	movq	%rdi, %r8
	movl	$3, %edx
	call	create_symbol
	movq	%rax, %rbx
	movl	$1, %edx
	movq	%rsi, %rcx
	call	peek_next_token
	movl	$0, %r13d
	cmpl	$5, 24(%rax)
	je	.L34
.L28:
	movq	%r13, %r8
	movq	%rbx, %rdx
	movq	%rdi, %rcx
	call	create_variable
.L21:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L23:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC2(%rip), %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L21
.L32:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC3(%rip), %rcx
	call	parser_error
	jmp	.L26
.L25:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC4(%rip), %rcx
	call	parser_error
	jmp	.L26
.L33:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC5(%rip), %rcx
	call	parser_error
	jmp	.L27
.L34:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx
	movq	(%rdx), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	je	.L28
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %r14
	movq	%r12, %r8
	movq	%rbp, %rdx
	movq	%rsi, %rcx
	call	parse_expression
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L28
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%r14, %rdx
	leaq	.LC6(%rip), %rcx
	call	parser_error
	jmp	.L28
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
	.def	parse_primary;	.scl	3;	.type	32;	.endef
parse_primary:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$72, %rsp
	movq	%rcx, %rsi
	movq	%rdx, 152(%rsp)
	movq	%r8, %r15
	call	peek_current_token
	movq	%rax, %rdi
	movl	24(%rax), %eax
	cmpl	$2, %eax
	je	.L89
	cmpl	$3, %eax
	je	.L90
	cmpl	$4, %eax
	je	.L91
	cmpl	$6, %eax
	je	.L92
.L40:
	cmpl	$5, 24(%rdi)
	je	.L93
.L48:
	movl	24(%rdi), %eax
	cmpl	$1, %eax
	je	.L49
	cmpl	$6, %eax
	jne	.L50
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L50
	cmpb	$0, 9(%r15)
	je	.L50
.L49:
	movq	%rsi, %rcx
	call	peek_current_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L51
	cmpl	$6, %eax
	jne	.L52
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L52
.L51:
	movq	(%rbx), %rdx
	movq	152(%rsp), %rcx
	call	search_name
	movq	%rax, %r14
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	create_variable_access
	movq	%rax, %rbp
	movl	$1, %edx
	movq	%rsi, %rcx
	call	peek_next_token
	movq	%rax, %r13
	cmpl	$5, 24(%rax)
	jne	.L54
	movl	$0, %ebx
	movl	$0, %r12d
	movq	%rdi, 56(%rsp)
	movq	%rbp, 48(%rsp)
	movq	152(%rsp), %rdi
	jmp	.L77
.L89:
	movq	(%rdi), %rdx
	movl	$0, %ebp
	movl	$0, %esi
	movl	$0, %ebx
	movl	$0, %edi
.L37:
	movq	%rbp, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbx, %r8
	movl	%edi, %ecx
	call	create_primary
	movq	%rax, %rbx
.L35:
	movq	%rbx, %rax
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L90:
	movq	(%rdi), %rdx
	movl	$0, %ebp
	movl	$0, %esi
	movl	$0, %ebx
	movl	$1, %edi
	jmp	.L37
.L91:
	movq	(%rdi), %rdx
	movl	$0, %ebp
	movl	$0, %esi
	movl	$0, %ebx
	movl	$2, %edi
	jmp	.L37
.L92:
	movq	.refptr.TRUE_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L41
	movq	(%rdi), %rdx
	movl	$0, %ebp
	movl	$0, %esi
	movl	$0, %ebx
	movl	$3, %edi
	jmp	.L37
.L41:
	cmpl	$6, 24(%rdi)
	jne	.L40
	movq	.refptr.FALSE_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L40
	movq	(%rdi), %rdx
	movl	$0, %ebp
	movl	$0, %esi
	movl	$0, %ebx
	movl	$4, %edi
	jmp	.L37
.L93:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L94
	cmpl	$5, 24(%rdi)
	jne	.L48
	movq	.refptr.NOT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L95
	cmpl	$5, 24(%rdi)
	jne	.L48
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L48
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	movq	%r15, %r8
	movq	152(%rsp), %rdx
	movq	%rsi, %rcx
	call	parse_primary
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L96
	movl	$0, %ebp
	movl	$0, %ebx
	movl	$0, %edx
	movl	$7, %edi
	jmp	.L37
.L94:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %rdi
	movq	%r15, %r8
	movq	152(%rsp), %rdx
	movq	%rsi, %rcx
	call	parse_expression
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L97
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %rsi
	movl	24(%rax), %edi
	cmpl	$5, %edi
	jne	.L46
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L46
	movl	$0, %ebp
	movl	$0, %esi
	movl	$0, %edx
	jmp	.L37
.L97:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rdi, %rdx
	leaq	.LC7(%rip), %rcx
	call	parser_error
	jmp	.L35
.L46:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC8(%rip), %rcx
	call	parser_error
	movl	$0, %ebx
	jmp	.L35
.L95:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	movq	%r15, %r8
	movq	152(%rsp), %rdx
	movq	%rsi, %rcx
	call	parse_primary
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L98
	movl	$0, %ebp
	movl	$0, %ebx
	movl	$0, %edx
	movl	$6, %edi
	jmp	.L37
.L98:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC9(%rip), %rcx
	call	parser_error
	movq	%rsi, %rbx
	jmp	.L35
.L96:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC10(%rip), %rcx
	call	parser_error
	movq	%rsi, %rbx
	jmp	.L35
.L52:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC11(%rip), %rcx
	call	parser_error
	jmp	.L78
.L56:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L99
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	je	.L68
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %r13
	movq	%r15, %r8
	movq	%rdi, %rdx
	movq	%rsi, %rcx
	call	parse_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L100
.L69:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %r13
	cmpl	$5, 24(%rax)
	jne	.L70
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	je	.L70
	movq	$0, 32(%rsp)
	movq	%rbp, %r9
	movl	$0, %r8d
	movq	48(%rsp), %rdx
	movl	$3, %ecx
	call	create_variable_access
	movq	%rax, 48(%rsp)
.L67:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	peek_next_token
	movq	%rax, %r13
	cmpl	$5, 24(%rax)
	jne	.L101
.L77:
	testq	%r14, %r14
	je	.L55
	movq	(%r14), %rbx
	testq	%rbx, %rbx
	cmove	%r14, %rbx
.L55:
	testq	%r12, %r12
	jne	.L56
	testq	%rbx, %rbx
	je	.L56
	cmpl	$0, 32(%rbx)
	jne	.L56
	movq	24(%rbx), %rax
	movq	16(%rax), %r12
	jmp	.L56
.L99:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	testq	%r14, %r14
	je	.L102
	cmpl	$0, 32(%r14)
	je	.L103
.L60:
	movl	32(%r14), %eax
	subl	$1, %eax
	cmpl	$1, %eax
	ja	.L104
.L59:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	call	create_list
	movq	%rax, %r12
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r13
	jmp	.L61
.L102:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC12(%rip), %rcx
	call	parser_error
	jmp	.L59
.L103:
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax
	movq	(%rax), %rdx
	movq	8(%r14), %rcx
	call	make_method_name
	movq	%rax, %rdx
	movq	24(%r14), %rax
	movq	16(%rax), %rcx
	call	search_name_use_strcmp
	movq	%rax, %r14
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %r8
	movq	48(%rsp), %rdx
	movl	$2, %ecx
	call	create_variable_access
	movq	%rax, 48(%rsp)
	testq	%r14, %r14
	jne	.L60
	jmp	.L59
.L104:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC13(%rip), %rcx
	call	parser_error
	jmp	.L59
.L107:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC14(%rip), %rcx
	call	parser_error
	jmp	.L62
.L108:
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L105
	cmpl	$5, 24(%rbx)
	jne	.L63
	movq	0(%r13), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L63
.L61:
	cmpl	$5, 24(%rbx)
	je	.L106
.L66:
	movq	%r15, %r8
	movq	%rdi, %rdx
	movq	%rsi, %rcx
	call	parse_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L107
.L62:
	movq	%rbp, %rdx
	movq	%r12, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	je	.L108
.L63:
	movq	56(%rsp), %rdi
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC15(%rip), %rcx
	call	parser_error
.L78:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rdi, %rdx
	leaq	.LC21(%rip), %rcx
	call	parser_error
	movl	$0, %ebx
	jmp	.L35
.L105:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L61
.L106:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L66
	movq	%r12, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movq	48(%rsp), %rdx
	movl	$1, %ecx
	call	create_variable_access
	movq	%rax, 48(%rsp)
	movq	(%r14), %r14
	cmpl	$0, 32(%r14)
	jne	.L83
	movq	24(%r14), %rax
	movq	16(%rax), %r12
	movl	$0, %ebx
	jmp	.L67
.L100:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%r13, %rdx
	leaq	.LC16(%rip), %rcx
	call	parser_error
	jmp	.L69
.L70:
	movq	56(%rsp), %rdi
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%r13, %rdx
	leaq	.LC17(%rip), %rcx
	call	parser_error
	jmp	.L78
.L68:
	movq	.refptr.DOT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	je	.L87
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %r13
	testq	%r12, %r12
	je	.L109
	cmpl	$1, 24(%rax)
	jne	.L110
	movq	(%rax), %rdx
	movq	%r12, %rcx
	call	search_name
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L111
.L74:
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%r14, %r8
	movq	48(%rsp), %rdx
	movl	$2, %ecx
	call	create_variable_access
	movq	%rax, 48(%rsp)
	movl	$0, %r12d
	movl	$0, %ebx
	jmp	.L67
.L109:
	movq	56(%rsp), %rdi
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%r13, %rdx
	leaq	.LC18(%rip), %rcx
	call	parser_error
	jmp	.L78
.L110:
	movq	56(%rsp), %rdi
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%r13, %rdx
	leaq	.LC19(%rip), %rcx
	call	parser_error
	jmp	.L78
.L111:
	testq	%rbx, %rbx
	je	.L75
	cmpl	$0, 32(%rbx)
	jne	.L76
	movq	8(%rbx), %rbx
.L75:
	movq	0(%r13), %rdx
	movq	%rbx, %rcx
	call	make_method_name
	movq	%rax, %rdx
	movq	%r12, %rcx
	call	search_name_use_strcmp
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L74
	movq	56(%rsp), %rdi
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%r13, %rdx
	leaq	.LC20(%rip), %rcx
	call	parser_error
	jmp	.L78
.L76:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L75
	cmpl	$0, 32(%rbx)
	jne	.L84
	movq	8(%rbx), %rbx
	jmp	.L75
.L84:
	movq	%rax, %rbx
	jmp	.L75
.L83:
	movl	$0, %r12d
	movl	$0, %ebx
	jmp	.L67
.L101:
	movq	56(%rsp), %rdi
	movq	48(%rsp), %rbp
.L54:
	testq	%rbp, %rbp
	je	.L78
	movl	$0, %esi
	movl	$0, %ebx
	movl	$0, %edx
	movl	$8, %edi
	jmp	.L37
.L87:
	movq	56(%rsp), %rdi
	movq	48(%rsp), %rbp
	jmp	.L54
.L50:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rdi, %rdx
	leaq	.LC22(%rip), %rcx
	call	parser_error
	movl	$0, %ebx
	jmp	.L35
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
	.def	parse_statement;	.scl	3;	.type	32;	.endef
parse_statement:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$104, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%r8, %rdi
	call	peek_current_token
	cmpl	$6, 24(%rax)
	je	.L197
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	$0, 40(%rsp)
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_statement
	movq	%rax, %rbp
.L182:
	movq	%rbx, %rcx
	call	peek_current_token
	movq	%rax, %rsi
	testq	%rbp, %rbp
	je	.L198
.L189:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	je	.L199
.L190:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC52(%rip), %rcx
	call	parser_error
.L112:
	movq	%rbp, %rax
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
.L197:
	movq	%rax, %rsi
	movq	.refptr.IF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L200
	movq	.refptr.FOR_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L201
	movq	.refptr.WHILE_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L202
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L181
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_variable
	movq	%rax, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$1, %ecx
	call	create_statement
	movq	%rax, %rbp
	jmp	.L182
.L200:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L115
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L115
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, 72(%rsp)
	testq	%rax, %rax
	je	.L203
.L118:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L119
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L119
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L121
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L121
	call	create_list
	movq	%rax, %r15
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r13
	leaq	.LC27(%rip), %r14
	jmp	.L123
.L115:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC23(%rip), %rcx
	call	parser_error
	movl	$0, %edx
.L117:
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$2, %ecx
	call	create_statement
	movq	%rax, %rbp
	jmp	.L112
.L203:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC24(%rip), %rcx
	call	parser_error
	jmp	.L118
.L119:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC25(%rip), %rcx
	call	parser_error
	movl	$0, %edx
	jmp	.L117
.L121:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC26(%rip), %rcx
	call	parser_error
	movl	$0, %edx
	jmp	.L117
.L125:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L204
.L124:
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
.L123:
	cmpl	$5, 24(%r12)
	jne	.L125
	movq	0(%r13), %rdx
	movq	(%r12), %rcx
	call	string_equal
	testb	%al, %al
	je	.L125
	call	create_list
	movq	%rax, 64(%rsp)
	call	create_list
	movq	%rax, 80(%rsp)
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	movq	%rax, %rsi
	cmpl	$6, 24(%rax)
	jne	.L127
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14
	movq	%r15, 88(%rsp)
	jmp	.L126
.L204:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%r12, %rdx
	movq	%r14, %rcx
	call	parser_error
	jmp	.L124
.L128:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC28(%rip), %rcx
	call	parser_error
	movl	$0, %edx
	jmp	.L117
.L207:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC29(%rip), %rcx
	call	parser_error
	jmp	.L130
.L131:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC30(%rip), %rcx
	call	parser_error
	movl	$0, %edx
	jmp	.L117
.L133:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC31(%rip), %rcx
	call	parser_error
	movl	$0, %edx
	jmp	.L117
.L137:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L205
.L136:
	movq	%r12, %rdx
	movq	%r13, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
.L135:
	cmpl	$5, 24(%rsi)
	jne	.L137
	movq	(%r14), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L137
	movq	%r13, %rdx
	movq	56(%rsp), %rcx
	call	create_else_if
	movq	%rax, %rdx
	movq	64(%rsp), %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	movq	%rax, %rsi
	cmpl	$6, 24(%rax)
	jne	.L195
.L126:
	movq	.refptr.ELIF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L206
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L128
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L128
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, 56(%rsp)
	testq	%rax, %rax
	je	.L207
.L130:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L131
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L131
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L133
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L133
	call	create_list
	movq	%rax, %r13
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	leaq	.LC32(%rip), %r15
	jmp	.L135
.L205:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	movq	%r15, %rcx
	call	parser_error
	jmp	.L136
.L206:
	movq	88(%rsp), %r15
	cmpl	$6, 24(%rsi)
	jne	.L127
	movq	.refptr.ELSE_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L127
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L139
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L139
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14
	leaq	.LC34(%rip), %r13
	jmp	.L141
.L139:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC33(%rip), %rcx
	call	parser_error
	movl	$0, %edx
	jmp	.L117
.L143:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L208
.L142:
	movq	%r12, %rdx
	movq	80(%rsp), %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
.L141:
	cmpl	$5, 24(%rsi)
	jne	.L143
	movq	(%r14), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L143
	jmp	.L127
.L208:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	movq	%r13, %rcx
	call	parser_error
	jmp	.L142
.L195:
	movq	88(%rsp), %r15
.L127:
	movq	%rbx, %rcx
	call	peek_current_token
	movq	80(%rsp), %r9
	movq	64(%rsp), %r8
	movq	%r15, %rdx
	movq	72(%rsp), %rcx
	call	create_if
	movq	%rax, %rdx
	jmp	.L117
.L201:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L146
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L146
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	je	.L209
.L149:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_variable
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L210
.L151:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
.L150:
	cmpl	$5, 24(%rsi)
	jne	.L152
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L152
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
	cmpl	$5, 24(%rax)
	je	.L211
.L154:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L212
.L156:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
.L155:
	cmpl	$5, 24(%r12)
	jne	.L157
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%r12), %rcx
	call	string_equal
	testb	%al, %al
	je	.L157
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
	cmpl	$5, 24(%rax)
	je	.L213
.L159:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, 56(%rsp)
	testq	%rax, %rax
	je	.L214
.L161:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
.L160:
	cmpl	$5, 24(%r12)
	jne	.L162
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%r12), %rcx
	call	string_equal
	testb	%al, %al
	je	.L162
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
	cmpl	$5, 24(%rax)
	jne	.L164
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%r12), %rcx
	call	string_equal
	testb	%al, %al
	je	.L164
	call	create_list
	movq	%rax, %r14
	movb	$1, 10(%rdi)
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r15
	movq	%r13, 64(%rsp)
	jmp	.L166
.L146:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC35(%rip), %rcx
	call	parser_error
	movl	$0, %r9d
.L148:
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r8d
	movl	$0, %edx
	movl	$4, %ecx
	call	create_statement
	movq	%rax, %rbp
	jmp	.L112
.L209:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	movl	$0, %r13d
	testb	%al, %al
	jne	.L150
	jmp	.L149
.L210:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC36(%rip), %rcx
	call	parser_error
	jmp	.L151
.L152:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC37(%rip), %rcx
	call	parser_error
	movl	$0, %r9d
	jmp	.L148
.L211:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%r12), %rcx
	call	string_equal
	movl	$0, %esi
	testb	%al, %al
	jne	.L155
	jmp	.L154
.L212:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%r12, %rdx
	leaq	.LC38(%rip), %rcx
	call	parser_error
	jmp	.L156
.L157:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%r12, %rdx
	leaq	.LC39(%rip), %rcx
	call	parser_error
	movl	$0, %r9d
	jmp	.L148
.L213:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%r12), %rcx
	call	string_equal
	movq	$0, 56(%rsp)
	testb	%al, %al
	jne	.L160
	jmp	.L159
.L214:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%r12, %rdx
	leaq	.LC40(%rip), %rcx
	call	parser_error
	jmp	.L161
.L162:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%r12, %rdx
	leaq	.LC41(%rip), %rcx
	call	parser_error
	movl	$0, %r9d
	jmp	.L148
.L164:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%r12, %rdx
	leaq	.LC42(%rip), %rcx
	call	parser_error
	movl	$0, %r9d
	jmp	.L148
.L168:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L215
.L167:
	movq	%r13, %rdx
	movq	%r14, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
.L166:
	cmpl	$5, 24(%r12)
	jne	.L168
	movq	(%r15), %rdx
	movq	(%r12), %rcx
	call	string_equal
	testb	%al, %al
	je	.L168
	movq	64(%rsp), %r13
	movb	$0, 10(%rdi)
	movq	%r14, %r9
	movq	56(%rsp), %r8
	movq	%rsi, %rdx
	movq	%r13, %rcx
	call	create_for
	movq	%rax, %r9
	jmp	.L148
.L215:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%r12, %rdx
	leaq	.LC43(%rip), %rcx
	call	parser_error
	jmp	.L167
.L202:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L170
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L170
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L216
.L173:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L174
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L174
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L176
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L176
	call	create_list
	movq	%rax, %r13
	movb	$1, 10(%rdi)
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r15
	jmp	.L178
.L170:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC44(%rip), %rcx
	call	parser_error
	movl	$0, %r8d
.L172:
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %edx
	movl	$3, %ecx
	call	create_statement
	movq	%rax, %rbp
	jmp	.L112
.L216:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC45(%rip), %rcx
	call	parser_error
	jmp	.L173
.L174:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC46(%rip), %rcx
	call	parser_error
	movl	$0, %r8d
	jmp	.L172
.L176:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC47(%rip), %rcx
	call	parser_error
	movl	$0, %r8d
	jmp	.L172
.L180:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L217
.L179:
	movq	%rsi, %rdx
	movq	%r13, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
.L178:
	cmpl	$5, 24(%r12)
	jne	.L180
	movq	(%r15), %rdx
	movq	(%r12), %rcx
	call	string_equal
	testb	%al, %al
	je	.L180
	movb	$0, 10(%rdi)
	movq	%r13, %rdx
	movq	%r14, %rcx
	call	create_while
	movq	%rax, %r8
	jmp	.L172
.L217:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%r12, %rdx
	leaq	.LC48(%rip), %rcx
	call	parser_error
	jmp	.L179
.L181:
	movq	.refptr.RETURN_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L183
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	je	.L218
.L184:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	$0, 40(%rsp)
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$5, %ecx
	call	create_statement
	movq	%rax, %rbp
	jmp	.L182
.L218:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rdx
	movq	(%rdx), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	je	.L184
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$5, %ecx
	call	create_statement
	movq	%rax, %rbp
	jmp	.L112
.L183:
	movq	.refptr.BREAK_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L185
	cmpb	$0, 10(%rdi)
	je	.L219
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$6, %ecx
	call	create_statement
	movq	%rax, %rbp
	jmp	.L182
.L219:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC49(%rip), %rcx
	call	parser_error
	movl	$0, %ebp
	jmp	.L112
.L185:
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L187
	cmpb	$0, 10(%rdi)
	je	.L220
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$7, %ecx
	call	create_statement
	movq	%rax, %rbp
	jmp	.L182
.L220:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC50(%rip), %rcx
	call	parser_error
	movl	$0, %ebp
	jmp	.L112
.L187:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	$0, 40(%rsp)
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_statement
	movq	%rax, %rbp
	jmp	.L182
.L198:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC51(%rip), %rcx
	call	parser_error
	jmp	.L189
.L199:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L112
	jmp	.L190
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
	.ascii "[warning] Unsupported type for class variable '%s': %s\12\0"
	.align 8
.LC86:
	.ascii "Expected ';' after class variable declaration\0"
	.align 8
.LC87:
	.ascii "Unexpected token in class member\0"
	.align 8
.LC88:
	.ascii "Constructor name conflicts with existing member\0"
.LC89:
	.ascii "0\0"
	.align 8
.LC90:
	.ascii "Failed to parse class declaration\0"
	.align 8
.LC91:
	.ascii "Unexpected token in code member\0"
	.text
	.globl	parse_code
	.def	parse_code;	.scl	2;	.type	32;	.endef
parse_code:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$184, %rsp
	movq	%rcx, %rdi
	movq	%rdx, %rbx
	movq	%r8, %r15
	movq	.refptr.builtin_scope(%rip), %rax
	cmpq	$0, (%rax)
	je	.L337
.L222:
	testq	%rbx, %rbx
	je	.L338
.L223:
	call	create_list
	movq	%rax, 80(%rsp)
	movq	%rbx, %rcx
	call	create_symbol_table
	movq	%rax, 72(%rsp)
	movl	$1, %edx
	movq	%rdi, %rcx
	call	get_next_token
	testq	%rax, %rax
	je	.L225
	movq	%rax, 56(%rsp)
	movq	%rdi, %r14
	jmp	.L224
.L337:
	movl	$0, %ecx
	call	create_symbol_table
	movq	%rax, %r9
	movq	.refptr.builtin_scope(%rip), %rsi
	movq	%rax, (%rsi)
	movq	.refptr.VOID_KEYWORD(%rip), %rax
	movq	(%rax), %rcx
	movl	$0, %r8d
	movl	$6, %edx
	call	create_symbol
	movq	.refptr.name_void(%rip), %rdx
	movq	%rax, (%rdx)
	movq	.refptr.INT_KEYWORD(%rip), %rax
	movq	(%rax), %rcx
	movq	(%rsi), %r9
	movl	$0, %r8d
	movl	$6, %edx
	call	create_symbol
	movq	.refptr.name_int(%rip), %rdx
	movq	%rax, (%rdx)
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	movq	(%rax), %rcx
	movq	(%rsi), %r9
	movl	$0, %r8d
	movl	$6, %edx
	call	create_symbol
	movq	.refptr.name_float(%rip), %rdx
	movq	%rax, (%rdx)
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	movq	(%rax), %rcx
	movq	(%rsi), %r9
	movl	$0, %r8d
	movl	$6, %edx
	call	create_symbol
	movq	.refptr.name_string(%rip), %rdx
	movq	%rax, (%rdx)
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	movq	(%rax), %rcx
	movq	(%rsi), %r9
	movl	$0, %r8d
	movl	$6, %edx
	call	create_symbol
	movq	.refptr.name_bool(%rip), %rdx
	movq	%rax, (%rdx)
	jmp	.L222
.L338:
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %rbx
	jmp	.L223
.L371:
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	56(%rsp), %rax
	movq	(%rax), %rcx
	call	string_equal
	movl	%eax, %esi
	testb	%al, %al
	jne	.L339
	movq	56(%rsp), %rax
	cmpl	$6, 24(%rax)
	jne	.L262
	movq	.refptr.FUNC_KEYWORD(%rip), %rdi
	movq	(%rdi), %rdx
	movq	(%rax), %rcx
	call	string_equal
	movb	%al, 104(%rsp)
	testb	%al, %al
	jne	.L340
	movq	56(%rsp), %rax
	cmpl	$6, 24(%rax)
	jne	.L262
	movq	.refptr.CLASS_KEYWORD(%rip), %rdi
	movq	(%rdi), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	je	.L262
	movq	72(%rsp), %rcx
	call	create_symbol_table
	movq	%rax, 64(%rsp)
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	cmpl	$1, 24(%rax)
	jne	.L341
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, %r9
	movq	%rax, 112(%rsp)
	movq	64(%rsp), %rax
	movq	%rax, 16(%r9)
	movq	(%rbx), %rcx
	movl	$0, %r8d
	movl	$0, %edx
	call	create_symbol
	movq	%rax, 88(%rsp)
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	jne	.L265
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L265
	call	create_list
	movq	%rax, 96(%rsp)
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	$0, 120(%rsp)
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rdi
	movq	.refptr.VAR_KEYWORD(%rip), %rbp
	movq	%rax, %rbx
	jmp	.L267
.L339:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	cmpl	$1, 24(%rax)
	jne	.L342
	movq	(%rax), %rdi
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	movl	$0, %esi
	cmpl	$6, 24(%rax)
	je	.L343
.L230:
	cmpl	$5, 24(%rbx)
	jne	.L232
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L232
	movq	(%r15), %r9
	movq	72(%rsp), %r8
	movq	%rsi, %rdx
	movq	%rdi, %rcx
	call	parse_import_file
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L344
.L234:
	movq	%rsi, %rdx
	call	create_import
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L321
.L235:
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	call	create_code_member
	movq	%rax, %rdx
	movq	80(%rsp), %rcx
	call	list_append
	jmp	.L236
.L342:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC53(%rip), %rcx
	call	parser_error
	jmp	.L321
.L343:
	movq	.refptr.FROM_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L230
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	cmpl	$4, 24(%rax)
	jne	.L345
	movq	(%rax), %rsi
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L230
.L345:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC54(%rip), %rcx
	call	parser_error
	jmp	.L321
.L232:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC55(%rip), %rcx
	call	parser_error
.L321:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	56(%rsp), %rdx
	leaq	.LC57(%rip), %rcx
	call	parser_error
	movl	$0, %edx
	jmp	.L235
.L344:
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rsi, %r9
	movq	%rdi, %r8
	leaq	.LC56(%rip), %rdx
	call	fprintf
	movq	72(%rsp), %r9
	movq	.refptr.name_void(%rip), %rax
	movq	(%rax), %r8
	movl	$3, %edx
	movq	%rdi, %rcx
	call	create_symbol
	movq	%rax, %rcx
	jmp	.L234
.L340:
	movq	72(%rsp), %rcx
	call	create_symbol_table
	movq	%rax, %rdi
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L238
	cmpl	$6, %eax
	jne	.L239
	movq	(%rbx), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L239
.L238:
	movq	(%rbx), %rdx
	movq	72(%rsp), %rcx
	call	search_name
	movq	%rax, 64(%rsp)
	testq	%rax, %rax
	je	.L346
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	cmpl	$1, 24(%rax)
	jne	.L347
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, %r13
	movq	%rdi, 32(%rax)
	movq	(%rbx), %rcx
	movq	%rax, %r9
	movq	64(%rsp), %r8
	movl	$1, %edx
	call	create_symbol
	movq	%rax, 96(%rsp)
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	jne	.L243
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L243
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	call	create_list
	movq	%rax, 88(%rsp)
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r12
	movq	%r12, %rbp
	jmp	.L245
.L239:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC58(%rip), %rcx
	call	parser_error
.L322:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	56(%rsp), %rdx
	leaq	.LC69(%rip), %rcx
	call	parser_error
	movl	$0, %r8d
	jmp	.L261
.L346:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC59(%rip), %rcx
	call	parser_error
	jmp	.L322
.L347:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC60(%rip), %rcx
	call	parser_error
	jmp	.L322
.L243:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC61(%rip), %rcx
	call	parser_error
	jmp	.L322
.L350:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC62(%rip), %rcx
	call	parser_error
	jmp	.L247
.L248:
	movq	%rax, %rdx
	movq	88(%rsp), %rcx
	call	list_append
	jmp	.L247
.L351:
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L348
	cmpl	$5, 24(%rbx)
	jne	.L249
	movq	0(%rbp), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L249
.L245:
	cmpl	$5, 24(%rbx)
	je	.L349
.L252:
	movq	%r15, %r8
	movq	%rdi, %rdx
	movq	%r14, %rcx
	call	parse_variable
	testq	%rax, %rax
	je	.L350
	cmpq	$0, 16(%rax)
	je	.L248
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC63(%rip), %rcx
	call	parser_error
.L247:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	je	.L351
.L249:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC64(%rip), %rcx
	call	parser_error
	jmp	.L322
.L348:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L245
.L349:
	movq	(%r12), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L252
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	jne	.L253
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L253
	call	create_list
	movq	%rax, %rbp
	movb	$1, 8(%r15)
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %r12
	jmp	.L255
.L253:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC65(%rip), %rcx
	call	parser_error
	jmp	.L322
.L259:
	movq	%r15, %r8
	movq	%rdi, %rdx
	movq	%r14, %rcx
	call	parse_statement
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L352
	testb	%sil, %sil
	jne	.L353
.L258:
	cmpl	$5, 8(%rbx)
	movl	$1, %eax
	cmove	%eax, %esi
.L257:
	movq	%rbx, %rdx
	movq	%rbp, %rcx
	call	list_append
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %r12
.L255:
	cmpl	$5, 24(%r12)
	jne	.L259
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%r12), %rcx
	call	string_equal
	testb	%al, %al
	je	.L259
	movb	$0, 8(%r15)
	testb	%sil, %sil
	jne	.L260
	movq	.refptr.name_void(%rip), %rax
	movq	64(%rsp), %rsi
	cmpq	(%rax), %rsi
	je	.L260
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%r12, %rdx
	leaq	.LC68(%rip), %rcx
	call	parser_error
.L260:
	movq	%rdi, 40(%rsp)
	movq	%rbp, 32(%rsp)
	movq	88(%rsp), %r9
	movq	64(%rsp), %r8
	movq	96(%rsp), %rdx
	movq	%r13, %rcx
	call	create_function_use_ptr
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L322
.L261:
	movl	$0, %r9d
	movl	$0, %edx
	movl	$1, %ecx
	call	create_code_member
	movq	%rax, %rdx
	movq	80(%rsp), %rcx
	call	list_append
	jmp	.L236
.L352:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%r12, %rdx
	leaq	.LC66(%rip), %rcx
	call	parser_error
	jmp	.L257
.L353:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%r12, %rdx
	leaq	.LC67(%rip), %rcx
	call	parser_error
	jmp	.L258
.L341:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC70(%rip), %rcx
	call	parser_error
	jmp	.L323
.L265:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC71(%rip), %rcx
	call	parser_error
.L323:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	56(%rsp), %rdx
	leaq	.LC90(%rip), %rcx
	call	parser_error
	movl	$0, %r9d
	jmp	.L319
.L307:
	cmpl	$6, 24(%rbx)
	je	.L354
.L268:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC87(%rip), %rcx
	call	parser_error
.L298:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
.L267:
	cmpl	$5, 24(%rbx)
	jne	.L307
	movq	(%rdi), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L307
	movq	%rbx, 104(%rsp)
	movq	.refptr.DEFAULT_INIT_NAME(%rip), %rax
	movq	(%rax), %rdx
	movq	88(%rsp), %rax
	movq	8(%rax), %rcx
	call	make_method_name
	movq	%rax, %rbx
	movq	%rax, %rdx
	movq	64(%rsp), %rcx
	call	search_name_use_strcmp
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L355
.L308:
	cmpl	$2, 32(%r13)
	jne	.L356
.L309:
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax
	movq	(%rax), %rdx
	movq	88(%rsp), %rsi
	movq	8(%rsi), %rcx
	call	make_method_name
	movq	%rax, %rbx
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, %rdi
	movq	64(%rsp), %rcx
	call	create_symbol_table
	movq	%rax, 32(%rdi)
	movq	%rdi, %r9
	movq	%rsi, %r8
	movl	$2, %edx
	movq	%rbx, %rcx
	call	create_symbol
	movq	%rax, 104(%rsp)
	call	create_list
	movq	%rax, %rbp
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rcx
	movq	32(%rdi), %r9
	movq	%rsi, %r8
	movl	$3, %edx
	call	create_symbol
	movq	%rax, %rdx
	movl	$0, %r8d
	movq	%rsi, %rcx
	call	create_variable
	movq	%rax, %rdx
	movq	%rbp, %rcx
	call	list_append
	movq	24(%r13), %rax
	movq	16(%rax), %rcx
	call	list_copy
	movq	%rax, %rsi
	movq	.refptr.SELF_KEYWORD(%rip), %r12
.L311:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L357
	movq	(%r12), %rdx
	movq	8(%rbx), %rax
	movq	8(%rax), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L311
	movq	8(%rbx), %rdx
	movq	(%rbx), %rcx
	movl	$0, %r8d
	call	create_variable
	movq	%rax, %rdx
	movq	%rbp, %rcx
	call	list_append
	jmp	.L311
.L354:
	movq	.refptr.METHOD_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L358
	cmpl	$6, 24(%rbx)
	jne	.L268
	movq	0(%rbp), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L268
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rsi
	movq	%r15, %r8
	movq	64(%rsp), %rdx
	movq	%r14, %rcx
	call	parse_variable
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L359
.L299:
	movq	%rbx, %r8
	movl	$0, %edx
	movl	$1, %ecx
	call	create_class_member
	movq	%rax, %rbx
	movq	%rax, %rdx
	movq	96(%rsp), %rcx
	call	list_append
	cmpl	$1, 8(%rbx)
	je	.L360
.L300:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	cmpl	$5, 24(%rax)
	je	.L361
.L306:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC86(%rip), %rcx
	call	parser_error
	jmp	.L298
.L358:
	movq	64(%rsp), %rcx
	call	create_symbol_table
	movq	%rax, %r13
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rcx
	movq	%r13, %r9
	movq	88(%rsp), %r8
	movl	$3, %edx
	call	create_symbol
	movq	%rax, %r12
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rsi
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L270
	cmpl	$6, %eax
	jne	.L271
	movq	(%rsi), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L271
.L270:
	movq	(%rsi), %rdx
	movq	64(%rsp), %rcx
	call	search_name
	movq	%rax, 136(%rsp)
	testq	%rax, %rax
	je	.L362
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$1, 24(%rax)
	jne	.L363
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, 152(%rsp)
	movq	%r13, 32(%rax)
	movq	(%rsi), %rdx
	movq	88(%rsp), %rsi
	movq	8(%rsi), %rcx
	call	make_method_name
	movq	%rax, %rcx
	movq	152(%rsp), %r9
	movq	136(%rsp), %r8
	movl	$2, %edx
	call	create_symbol
	movq	%rax, 160(%rsp)
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L275
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L275
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$6, 24(%rax)
	je	.L364
.L277:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC76(%rip), %rcx
	call	parser_error
.L278:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rsi
	call	create_list
	movq	%rax, 144(%rsp)
	movl	$0, %r8d
	movq	%r12, %rdx
	movq	88(%rsp), %rcx
	call	create_variable
	movq	%rax, %rdx
	movq	144(%rsp), %rcx
	call	list_append
	movq	.refptr.COMMA_SYMBOL(%rip), %r12
	jmp	.L279
.L271:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC72(%rip), %rcx
	call	parser_error
.L324:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rbx, %rdx
	leaq	.LC83(%rip), %rcx
	call	parser_error
	movl	$0, %edx
	jmp	.L297
.L362:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC73(%rip), %rcx
	call	parser_error
	jmp	.L324
.L363:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC74(%rip), %rcx
	call	parser_error
	jmp	.L324
.L275:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC75(%rip), %rcx
	call	parser_error
	jmp	.L324
.L364:
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L278
	jmp	.L277
.L281:
	cmpl	$5, 24(%rsi)
	jne	.L284
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L284
.L285:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	jne	.L289
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L289
	call	create_list
	movq	%rax, 128(%rsp)
	movb	$1, 8(%r15)
	movb	$1, 9(%r15)
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %r12
	movzbl	104(%rsp), %esi
	movq	%rbx, 168(%rsp)
	jmp	.L291
.L365:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC78(%rip), %rcx
	call	parser_error
	jmp	.L286
.L287:
	movq	%rax, %rdx
	movq	144(%rsp), %rcx
	call	list_append
	jmp	.L286
.L366:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L285
	cmpl	$5, 24(%rsi)
	jne	.L284
	movq	(%r12), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L281
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rsi
	movq	%r15, %r8
	movq	%r13, %rdx
	movq	%r14, %rcx
	call	parse_variable
	testq	%rax, %rax
	je	.L365
	cmpq	$0, 16(%rax)
	je	.L287
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC79(%rip), %rcx
	call	parser_error
.L286:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rsi
.L279:
	cmpl	$5, 24(%rsi)
	je	.L366
.L284:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC77(%rip), %rcx
	call	parser_error
	jmp	.L324
.L289:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC80(%rip), %rcx
	call	parser_error
	jmp	.L324
.L295:
	movq	%r15, %r8
	movq	%r13, %rdx
	movq	%r14, %rcx
	call	parse_statement
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L367
	testb	%sil, %sil
	jne	.L368
.L294:
	cmpl	$5, 8(%rbx)
	movl	$1, %eax
	cmove	%eax, %esi
.L293:
	movq	%rbx, %rdx
	movq	128(%rsp), %rcx
	call	list_append
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %r12
.L291:
	cmpl	$5, 24(%r12)
	jne	.L295
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%r12), %rcx
	call	string_equal
	testb	%al, %al
	je	.L295
	movq	168(%rsp), %rbx
	movb	$0, 8(%r15)
	movb	$0, 9(%r15)
	testb	%sil, %sil
	jne	.L296
	movq	.refptr.name_void(%rip), %rax
	movq	136(%rsp), %rsi
	cmpq	(%rax), %rsi
	je	.L296
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%r12, %rdx
	leaq	.LC82(%rip), %rcx
	call	parser_error
.L296:
	movq	%r13, 40(%rsp)
	movq	128(%rsp), %rax
	movq	%rax, 32(%rsp)
	movq	144(%rsp), %r9
	movq	136(%rsp), %r8
	movq	160(%rsp), %rdx
	movq	152(%rsp), %rcx
	call	create_method_use_ptr
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L324
.L297:
	movl	$0, %r8d
	movl	$0, %ecx
	call	create_class_member
	movq	%rax, %rdx
	movq	96(%rsp), %rcx
	call	list_append
	jmp	.L298
.L367:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%r12, %rdx
	leaq	.LC81(%rip), %rcx
	call	parser_error
	jmp	.L293
.L368:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%r12, %rdx
	leaq	.LC67(%rip), %rcx
	call	parser_error
	jmp	.L294
.L359:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	%rsi, %rdx
	leaq	.LC84(%rip), %rcx
	call	parser_error
	jmp	.L299
.L360:
	movq	(%rbx), %rdx
	movq	(%rdx), %rax
	movq	.refptr.name_int(%rip), %rcx
	cmpq	(%rcx), %rax
	je	.L301
	movq	.refptr.name_float(%rip), %rcx
	cmpq	(%rcx), %rax
	je	.L301
	movq	.refptr.name_string(%rip), %rcx
	cmpq	(%rcx), %rax
	je	.L301
	movq	.refptr.name_bool(%rip), %rcx
	cmpq	(%rcx), %rax
	je	.L303
	movq	.refptr.name_void(%rip), %rcx
	cmpq	(%rcx), %rax
	je	.L303
	cmpl	$0, 32(%rax)
	jne	.L305
	addq	$8, 120(%rsp)
	jmp	.L300
.L301:
	addq	$8, 120(%rsp)
	jmp	.L300
.L303:
	addq	$1, 120(%rsp)
	jmp	.L300
.L305:
	movq	8(%rax), %rsi
	movq	8(%rdx), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC85(%rip), %rdx
	call	fprintf
	jmp	.L300
.L361:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L298
	jmp	.L306
.L355:
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, %rsi
	movq	64(%rsp), %rcx
	call	create_symbol_table
	movq	%rax, 32(%rsi)
	movq	%rsi, %r9
	movq	88(%rsp), %r12
	movq	%r12, %r8
	movl	$2, %edx
	movq	%rbx, %rcx
	call	create_symbol
	movq	%rax, %r13
	call	create_list
	movq	%rax, %rdi
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rcx
	movq	32(%rsi), %r9
	movq	%r12, %r8
	movl	$3, %edx
	call	create_symbol
	movq	%rax, %rbp
	movl	$0, %r8d
	movq	%rax, %rdx
	movq	%r12, %rcx
	call	create_variable
	movq	%rax, %rdx
	movq	%rdi, %rcx
	call	list_append
	call	create_list
	movq	%rax, %rbx
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rbp, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	create_variable_access
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$8, %ecx
	call	create_primary
	movq	%rax, %r8
	movl	$0, %r9d
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	$0, 40(%rsp)
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$5, %ecx
	call	create_statement
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	list_append
	movq	32(%rsi), %rax
	movq	%rax, 40(%rsp)
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%r12, %r8
	movq	%r13, %rdx
	movq	%rsi, %rcx
	call	create_method_use_ptr
	movl	$0, %r8d
	movq	%rsi, %rdx
	movl	$0, %ecx
	call	create_class_member
	movq	%rax, %rdx
	movq	96(%rsp), %rcx
	call	list_append
	jmp	.L308
.L356:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	104(%rsp), %rdx
	leaq	.LC88(%rip), %rcx
	call	parser_error
	jmp	.L309
.L357:
	call	create_list
	movq	%rax, %r12
	movq	96(%rsp), %rcx
	call	list_copy
	movq	%rax, %rsi
.L314:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L369
	cmpl	$1, 8(%rbx)
	jne	.L314
	movq	(%rbx), %rax
	movq	8(%rax), %r8
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_variable_access
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$8, %ecx
	call	create_primary
	movq	%rax, %r8
	movl	$0, %r9d
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, 128(%rsp)
	movq	(%rbx), %rax
	movq	16(%rax), %r9
	testq	%r9, %r9
	je	.L370
.L315:
	movl	$0, %r8d
	movq	128(%rsp), %rdx
	movl	$13, %ecx
	call	create_expression
	movq	$0, 40(%rsp)
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_statement
	movq	%rax, %rdx
	movq	%r12, %rcx
	call	list_append
	jmp	.L314
.L370:
	movl	$2, %edx
	leaq	.LC89(%rip), %rcx
	call	create_string
	movq	%rax, %rdx
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	call	create_primary
	movq	%rax, %r8
	movl	$0, %r9d
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %r9
	jmp	.L315
.L369:
	call	create_list
	movq	%rax, %rbx
	movq	%rbp, %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L317
.L318:
	movq	8(%rax), %r8
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_variable_access
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$8, %ecx
	call	create_primary
	movq	%rax, %r8
	movl	$0, %r9d
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	list_append
.L317:
	movq	%rsi, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L318
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%r13, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	create_variable_access
	movq	%rax, %rdx
	movq	%rbx, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$1, %ecx
	call	create_variable_access
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$8, %ecx
	call	create_primary
	movq	%rax, %r8
	movl	$0, %r9d
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	$0, 40(%rsp)
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$5, %ecx
	call	create_statement
	movq	%rax, %rdx
	movq	%r12, %rcx
	call	list_append
	movq	32(%rdi), %rax
	movq	%rax, 40(%rsp)
	movq	%r12, 32(%rsp)
	movq	%rbp, %r9
	movq	88(%rsp), %rsi
	movq	%rsi, %r8
	movq	104(%rsp), %rdx
	movq	%rdi, %rcx
	call	create_method_use_ptr
	movl	$0, %r8d
	movq	%rdi, %rdx
	movl	$0, %ecx
	call	create_class_member
	movq	%rax, %rdx
	movq	96(%rsp), %rdi
	movq	%rdi, %rcx
	call	list_append
	movq	120(%rsp), %rax
	movq	%rax, 32(%rsp)
	movq	64(%rsp), %r9
	movq	%rdi, %r8
	movq	%rsi, %rdx
	movq	112(%rsp), %rcx
	call	create_class_use_ptr
	movq	%rax, %r9
	testq	%rax, %rax
	je	.L323
.L319:
	movl	$0, %r8d
	movl	$0, %edx
	movl	$2, %ecx
	call	create_code_member
	movq	%rax, %rdx
	movq	80(%rsp), %rcx
	call	list_append
.L236:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, 56(%rsp)
	testq	%rax, %rax
	je	.L225
.L224:
	movq	56(%rsp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	je	.L225
	cmpl	$6, %eax
	je	.L371
.L262:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rax, %r8
	movq	56(%rsp), %rdx
	leaq	.LC91(%rip), %rcx
	call	parser_error
	jmp	.L236
.L225:
	movq	72(%rsp), %rdx
	movq	80(%rsp), %rcx
	call	create_code
	addq	$184, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.ident	"GCC: (GNU) 13.2.0"
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
	.def	get_full_path;	.scl	2;	.type	32;	.endef
	.def	parser_error;	.scl	2;	.type	32;	.endef
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.def	search_name;	.scl	2;	.type	32;	.endef
	.def	create_symbol;	.scl	2;	.type	32;	.endef
	.def	create_variable;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	make_method_name;	.scl	2;	.type	32;	.endef
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.def	create_else_if;	.scl	2;	.type	32;	.endef
	.def	create_if;	.scl	2;	.type	32;	.endef
	.def	create_for;	.scl	2;	.type	32;	.endef
	.def	create_while;	.scl	2;	.type	32;	.endef
	.def	create_symbol_table;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.def	create_import;	.scl	2;	.type	32;	.endef
	.def	create_code_member;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	create_function_use_ptr;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.def	create_method_use_ptr;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	create_class_use_ptr;	.scl	2;	.type	32;	.endef
	.def	create_code;	.scl	2;	.type	32;	.endef
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
