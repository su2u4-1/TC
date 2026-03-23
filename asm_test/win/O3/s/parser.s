	.file	"D:\\TC\\src\\parser.c"
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Failed to parse expression primary\0"
	.align 8
.LC1:
	.ascii "Failed to parse parenthesized expression\0"
.LC2:
	.ascii "Expected ')' after expression\0"
	.align 8
.LC3:
	.ascii "Failed to parse operand of unary '!'\0"
	.align 8
.LC4:
	.ascii "Failed to parse operand of unary '-'\0"
	.align 8
.LC5:
	.ascii "Expected variable name in variable access\0"
	.align 8
.LC6:
	.ascii "Cannot call undefined variable\0"
	.align 8
.LC7:
	.ascii "Cannot call non-function variable\0"
	.align 8
.LC8:
	.ascii "Failed to parse function call argument\0"
	.align 8
.LC9:
	.ascii "Expected ',' or ')' after function call argument\0"
	.align 8
.LC10:
	.ascii "Failed to parse sequence index\0"
	.align 8
.LC11:
	.ascii "Expected ']' after sequence index\0"
	.align 8
.LC12:
	.ascii "Cannot access attribute without a valid scope\0"
	.align 8
.LC13:
	.ascii "Expected attribute name after '.'\0"
.LC14:
	.ascii "Unknown attribute name\0"
	.align 8
.LC15:
	.ascii "Failed to parse variable access\0"
	.align 8
.LC16:
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
	movq	%rax, %r15
	movl	24(%rax), %eax
	cmpl	$2, %eax
	je	.L122
	cmpl	$3, %eax
	je	.L123
	cmpl	$4, %eax
	je	.L124
	cmpl	$6, %eax
	je	.L125
.L6:
	cmpl	$5, %eax
	je	.L10
	cmpl	$1, %eax
	je	.L12
.L13:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r15, %rdx
	leaq	.LC16(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L123:
	movq	(%r15), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$1, %ebx
.L3:
	movq	%r10, 32(%rsp)
	movl	%ebx, %ecx
	call	create_primary
.L1:
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
.L122:
	movq	(%r15), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ebx, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L124:
	movq	(%r15), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L125:
	movq	.refptr.TRUE_KEYWORD(%rip), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L126
	movl	24(%r15), %eax
	cmpl	$6, %eax
	jne	.L6
	movq	.refptr.FALSE_KEYWORD(%rip), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L9
	movl	24(%r15), %eax
	cmpl	$5, %eax
	jne	.L23
	.p2align 4,,10
	.p2align 3
.L10:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r9
	movq	(%r15), %rcx
	movq	(%r9), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L127
	movl	24(%r15), %eax
	cmpl	$5, %eax
	jne	.L23
	movq	.refptr.NOT_SYMBOL(%rip), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L128
	movl	24(%r15), %eax
	cmpl	$5, %eax
	jne	.L23
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L24
	movl	24(%r15), %eax
.L23:
	cmpl	$1, %eax
	je	.L12
	cmpl	$6, %eax
	jne	.L13
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%r15), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L13
	cmpb	$0, 9(%rdi)
	je	.L13
.L12:
	movq	%rbx, %rcx
	call	peek_current_token
	movq	%rax, %rsi
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L27
	cmpl	$6, %eax
	jne	.L30
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L30
.L27:
	movq	(%rsi), %rdx
	movq	%rbp, %rcx
	call	search_name
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	$0, 32(%rsp)
	movq	%rax, %r8
	movq	%rax, %r12
	call	create_variable_access
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, 56(%rsp)
	call	peek_next_token
	movq	56(%rsp), %r10
	cmpl	$5, 24(%rax)
	movq	%rax, %r14
	jne	.L31
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r9
	xorl	%esi, %esi
	xorl	%r13d, %r13d
	movq	%r9, 64(%rsp)
.L58:
	testq	%r12, %r12
	je	.L32
	movq	(%r12), %rsi
	testq	%rsi, %rsi
	cmove	%r12, %rsi
.L32:
	testq	%r13, %r13
	jne	.L33
	testq	%rsi, %rsi
	je	.L33
	movl	32(%rsi), %edx
	testl	%edx, %edx
	jne	.L33
	movq	8(%rsi), %r13
.L33:
	movq	64(%rsp), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L129
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L49
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movq	%rax, 72(%rsp)
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L130
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rdi, 32(%rsp)
	movq	%rbp, %r9
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	parse_expr_prec
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L51
.L52:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r11
	jne	.L54
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax
	movq	(%r11), %rcx
	movq	%r11, 72(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	72(%rsp), %r11
	testb	%al, %al
	je	.L54
	movq	56(%rsp), %rdx
	movq	%r14, %r9
	xorl	%r8d, %r8d
	movl	$3, %ecx
	movq	$0, 32(%rsp)
	call	create_variable_access
	movq	%rax, 56(%rsp)
.L48:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r14
	je	.L58
.L116:
	movq	56(%rsp), %r10
.L31:
	testq	%r10, %r10
	je	.L29
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$8, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L49:
	movq	.refptr.DOT_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L116
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	testq	%r13, %r13
	je	.L131
	cmpl	$1, 24(%rax)
	jne	.L132
	movq	(%rax), %rdx
	movq	%r13, %rcx
	call	search_name
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L133
	movq	56(%rsp), %rdx
	xorl	%r9d, %r9d
	movq	%rax, %r8
	movl	$2, %ecx
	movq	$0, 32(%rsp)
	xorl	%r13d, %r13d
	xorl	%esi, %esi
	call	create_variable_access
	movq	%rax, 56(%rsp)
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L129:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	testq	%r12, %r12
	je	.L134
	movl	32(%r12), %eax
	testl	%eax, %eax
	je	.L135
.L37:
	cmpl	$1, %eax
	jne	.L136
.L36:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	call	create_list
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r13
	movq	%rax, %r14
	.p2align 4,,10
	.p2align 3
.L39:
	cmpl	$5, 24(%rsi)
	je	.L137
.L47:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L138
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rdi, 32(%rsp)
	movq	%rbp, %r9
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	parse_expr_prec
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L41
.L42:
	movq	%r14, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L43
.L46:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC9(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L29:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r15, %rdx
	leaq	.LC15(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L137:
	movq	0(%r13), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L47
	movq	%r14, 32(%rsp)
	movq	56(%rsp), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$1, %ecx
	call	create_variable_access
	movq	(%r12), %r12
	movq	%rax, 56(%rsp)
	movl	32(%r12), %eax
	testl	%eax, %eax
	jne	.L62
	movq	8(%r12), %r13
	xorl	%esi, %esi
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L43:
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L139
	cmpl	$5, 24(%rsi)
	jne	.L46
	movq	0(%r13), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L39
	jmp	.L46
	.p2align 4,,10
	.p2align 3
.L138:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rbx, %rcx
	movq	%rax, 72(%rsp)
	call	peek_current_token
	movq	72(%rsp), %r8
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L41:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC8(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%edx, %edx
	jmp	.L42
	.p2align 4,,10
	.p2align 3
.L139:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L136:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC7(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L126:
	movq	(%r15), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$3, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L9:
	movq	(%r15), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$4, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L135:
	movq	.refptr.CONSTRUCTOR_NAME(%rip), %rax
	movq	8(%r12), %rcx
	movq	(%rax), %rdx
	call	search_name
	movq	56(%rsp), %rdx
	xorl	%r9d, %r9d
	movq	$0, 32(%rsp)
	movq	%rax, %r8
	movl	$2, %ecx
	movq	%rax, %r12
	call	create_variable_access
	movq	%rax, 56(%rsp)
	testq	%r12, %r12
	je	.L36
	movl	32(%r12), %eax
	jmp	.L37
	.p2align 4,,10
	.p2align 3
.L30:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC5(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L29
.L130:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rbx, %rcx
	movq	%rax, %r14
	call	peek_current_token
	movq	%r14, %r8
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L51:
	movq	(%rdi), %rcx
	xorl	%r14d, %r14d
	call	get_full_path
	movq	72(%rsp), %rdx
	leaq	.LC10(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L127:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movq	%rax, %rsi
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L140
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rdi, 32(%rsp)
	xorl	%r8d, %r8d
	movq	%rbp, %r9
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	parse_expr_prec
	testq	%rax, %rax
	je	.L16
	movq	%rbx, %rcx
	movl	$1, %edx
	movq	%rax, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r8
	movl	24(%rax), %ebx
	movq	%rax, %rsi
	cmpl	$5, %ebx
	jne	.L21
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	%r8, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L21
	movq	56(%rsp), %r8
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L128:
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
	je	.L141
	xorl	%r10d, %r10d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$6, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L24:
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
	je	.L142
	xorl	%r10d, %r10d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$7, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L134:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC6(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L36
.L21:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC2(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L1
.L62:
	xorl	%r13d, %r13d
	xorl	%esi, %esi
	jmp	.L48
.L54:
	movq	(%rdi), %rcx
	movq	%r11, 56(%rsp)
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC11(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L29
.L133:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC14(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L29
.L132:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC13(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L29
.L131:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC12(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L29
.L140:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rbx, %rcx
	movq	%rax, %rbp
	call	peek_current_token
	movq	%rbp, %r8
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L16:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC1(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L1
.L142:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC4(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L1
.L141:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC3(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L1
	.section .rdata,"dr"
.LC17:
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
	jne	.L144
.L151:
	movq	(%rax), %rcx
	call	string_to_operator
	movl	%eax, %ecx
	movl	%eax, %edi
	call	operator_precedence
	movl	%eax, %esi
	cmpl	$19, %edi
	je	.L144
	cmpl	%r14d, %eax
	jl	.L144
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
	je	.L158
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %rbp
.L157:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	jne	.L147
	movq	(%rax), %rcx
	call	string_to_operator
	movl	%eax, %r15d
	movl	%eax, %ecx
	call	operator_precedence
	cmpl	$19, %r15d
	je	.L147
	cmpl	%eax, %esi
	jge	.L147
	movq	160(%rsp), %rdx
	movq	%r13, %r9
	movl	%eax, %r8d
	movq	%rbx, %rcx
	movq	%rdx, 32(%rsp)
	movq	%rbp, %rdx
	call	parse_expr_prec
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L157
	xorl	%r12d, %r12d
	jmp	.L143
	.p2align 4,,10
	.p2align 3
.L147:
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
	je	.L151
.L144:
	movq	%rbx, %rcx
	call	peek_current_token
.L143:
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
.L158:
	movq	160(%rsp), %rax
	xorl	%r12d, %r12d
	movq	(%rax), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC17(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L143
	.section .rdata,"dr"
.LC18:
	.ascii "Expected variable type\0"
	.align 8
.LC19:
	.ascii "Expected a type for variable declaration\0"
.LC20:
	.ascii "Unknown variable type\0"
.LC21:
	.ascii "Expected variable name\0"
	.align 8
.LC22:
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
	subq	$56, %rsp
	call	peek_current_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L160
	cmpl	$6, %eax
	jne	.L163
	movq	(%rbx), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L163
.L160:
	movq	(%rbx), %rdx
	movq	%rbp, %rcx
	call	search_name
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L164
	movl	32(%rax), %eax
	cmpl	$5, %eax
	je	.L165
	testl	%eax, %eax
	jne	.L190
.L165:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L191
.L166:
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
	je	.L192
.L168:
	xorl	%r8d, %r8d
.L172:
	addq	$56, %rsp
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
.L191:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC21(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L166
	.p2align 4,,10
	.p2align 3
.L163:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC18(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	addq	$56, %rsp
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
.L190:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC19(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L165
	.p2align 4,,10
	.p2align 3
.L192:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx
	movq	(%rax), %rcx
	movq	(%rdx), %rdx
	call	string_equal
	testb	%al, %al
	je	.L168
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
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L193
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%r12, 32(%rsp)
	xorl	%r8d, %r8d
	movq	%rbp, %r9
	movq	%rax, %rdx
	movq	%rsi, %rcx
	call	parse_expr_prec
	movq	%rax, %r8
	testq	%rax, %rax
	jne	.L172
.L171:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC22(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L168
	.p2align 4,,10
	.p2align 3
.L164:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC20(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L165
.L193:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rsi, %rcx
	movq	%rax, %rbp
	call	peek_current_token
	movq	%rbp, %r8
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
	jmp	.L171
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
	je	.L386
.L195:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_primary
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L387
	xorl	%r9d, %r9d
	movq	%rax, %r8
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rsi, 32(%rsp)
	movq	%rdi, %r9
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	parse_expr_prec
	movq	%rax, %rbp
.L296:
	movq	%rbp, 32(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	$0, 40(%rsp)
	xorl	%ecx, %ecx
	call	create_statement
	movq	%rax, %rbp
.L283:
	movq	%rbx, %rcx
	call	peek_current_token
	movq	%rax, %rdi
	testq	%rbp, %rbp
	je	.L388
.L297:
	movq	%rbx, %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L298
.L300:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC52(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L194:
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
.L298:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L300
	jmp	.L194
	.p2align 4,,10
	.p2align 3
.L386:
	movq	%rax, %rbp
	movq	.refptr.IF_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L389
	movq	.refptr.FOR_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L390
	movq	.refptr.WHILE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L391
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L392
	movq	.refptr.RETURN_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L284
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	je	.L393
.L285:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_primary
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L394
	xorl	%r9d, %r9d
	movq	%rax, %r8
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rsi, 32(%rsp)
	movq	%rdi, %r9
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	parse_expr_prec
	movq	%rax, %rbp
.L287:
	movq	%rbp, 32(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	$0, 40(%rsp)
	movl	$5, %ecx
	call	create_statement
	movq	%rax, %rbp
	jmp	.L283
	.p2align 4,,10
	.p2align 3
.L390:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L235
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L235
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L236
.L239:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_variable
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L395
.L238:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L240:
	cmpl	$5, 24(%rbp)
	jne	.L243
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %r14
	movq	0(%rbp), %rcx
	movq	(%r14), %rdx
	call	string_equal
	testb	%al, %al
	je	.L243
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L244
.L247:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L396
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rsi, 32(%rsp)
	movq	%rdi, %r9
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	parse_expr_prec
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L249
.L250:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L248:
	cmpl	$5, 24(%rbp)
	jne	.L252
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	je	.L252
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L253
.L256:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L397
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rsi, 32(%rsp)
	movq	%rdi, %r9
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	parse_expr_prec
	movq	%rax, 56(%rsp)
	testq	%rax, %rax
	je	.L258
.L259:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L257:
	cmpl	$5, 24(%rbp)
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
	movq	%rax, %r15
	call	get_next_token
	movq	%r12, 64(%rsp)
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14
	movq	%rax, %rbp
	jmp	.L264
	.p2align 4,,10
	.p2align 3
.L265:
	movq	%r12, %rdx
	movq	%r15, %rcx
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
	jne	.L398
.L266:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L265
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC43(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L265
	.p2align 4,,10
	.p2align 3
.L388:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC51(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L297
	.p2align 4,,10
	.p2align 3
.L389:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L199
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r12
	movq	(%rax), %rcx
	movq	(%r12), %rdx
	call	string_equal
	testb	%al, %al
	je	.L199
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%rax, %rbp
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L399
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rsi, 32(%rsp)
	movq	%rdi, %r9
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	parse_expr_prec
	movq	%rax, 72(%rsp)
	testq	%rax, %rax
	je	.L201
.L202:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L204
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L204
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L206
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L206
	call	create_list
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r15
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14
	movq	%rax, %rbp
	jmp	.L207
	.p2align 4,,10
	.p2align 3
.L208:
	movq	%r13, %rdx
	movq	%r15, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L207:
	cmpl	$5, 24(%rbp)
	jne	.L209
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L400
.L209:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L208
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC27(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L208
	.p2align 4,,10
	.p2align 3
.L199:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC23(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L198:
	xorl	%edx, %edx
.L211:
	movq	$0, 40(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L194
	.p2align 4,,10
	.p2align 3
.L387:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbx, %rcx
	movq	%rax, %rdi
	call	peek_current_token
	movq	%rdi, %r8
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
	jmp	.L296
	.p2align 4,,10
	.p2align 3
.L391:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L270
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L270
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%rax, %rbp
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L401
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rsi, 32(%rsp)
	movq	%rdi, %r9
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	parse_expr_prec
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L272
.L273:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L276
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L276
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L278
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L278
	call	create_list
	movb	$1, 10(%rsi)
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r12
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14
	movq	%rax, %rbp
	jmp	.L279
	.p2align 4,,10
	.p2align 3
.L280:
	movq	%r15, %rdx
	movq	%r12, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L279:
	cmpl	$5, 24(%rbp)
	jne	.L281
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L402
.L281:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L280
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC48(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L280
	.p2align 4,,10
	.p2align 3
.L392:
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
	jmp	.L283
	.p2align 4,,10
	.p2align 3
.L204:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC25(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L198
	.p2align 4,,10
	.p2align 3
.L235:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC35(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L234:
	xorl	%r9d, %r9d
.L242:
	movq	$0, 40(%rsp)
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$4, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L194
	.p2align 4,,10
	.p2align 3
.L270:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC44(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L269:
	xorl	%r8d, %r8d
.L275:
	movq	$0, 40(%rsp)
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$3, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L194
.L399:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbx, %rcx
	movq	%rax, %r13
	call	peek_current_token
	movq	%r13, %r8
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L201:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC24(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	$0, 72(%rsp)
	jmp	.L202
	.p2align 4,,10
	.p2align 3
.L284:
	movq	.refptr.BREAK_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L288
	cmpb	$0, 10(%rsi)
	je	.L403
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$6, %ecx
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L283
	.p2align 4,,10
	.p2align 3
.L243:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC37(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L234
.L206:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC26(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L198
.L400:
	call	create_list
	movq	%rax, 64(%rsp)
	call	create_list
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, 80(%rsp)
	call	peek_next_token
	cmpl	$6, 24(%rax)
	movq	%rax, %rbp
	jne	.L224
	movq	%r15, 88(%rsp)
	.p2align 4,,10
	.p2align 3
.L210:
	movq	.refptr.ELIF_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L404
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L213
	movq	(%r12), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	je	.L213
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%rax, %rbp
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L405
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rsi, 32(%rsp)
	movq	%rdi, %r9
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	parse_expr_prec
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L215
.L216:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L218
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L218
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L220
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L220
	call	create_list
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r13
	call	get_next_token
	movq	%r15, 56(%rsp)
	movq	%rax, %rbp
	jmp	.L221
	.p2align 4,,10
	.p2align 3
.L222:
	movq	%r15, %rdx
	movq	%r13, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L221:
	cmpl	$5, 24(%rbp)
	jne	.L223
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L406
.L223:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L222
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC32(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L222
	.p2align 4,,10
	.p2align 3
.L406:
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
	je	.L210
	movq	88(%rsp), %r15
.L224:
	movq	%rbx, %rcx
	call	peek_current_token
	movq	80(%rsp), %r9
	movq	64(%rsp), %r8
	movq	%r15, %rdx
	movq	72(%rsp), %rcx
	call	create_if
	movq	%rax, %rdx
	jmp	.L211
.L405:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbx, %rcx
	movq	%rax, %r13
	call	peek_current_token
	movq	%r13, %r8
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L215:
	movq	(%rsi), %rcx
	xorl	%r15d, %r15d
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC29(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L216
.L236:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	xorl	%r12d, %r12d
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L240
	jmp	.L239
.L276:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC46(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L269
.L252:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC39(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L234
.L393:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rdx
	movq	(%rax), %rcx
	movq	(%rdx), %rdx
	call	string_equal
	testb	%al, %al
	je	.L285
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$5, %ecx
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L194
.L288:
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L195
	cmpb	$0, 10(%rsi)
	je	.L407
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$7, %ecx
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L283
.L244:
	movq	(%r14), %rdx
	movq	(%rax), %rcx
	xorl	%r13d, %r13d
	call	string_equal
	testb	%al, %al
	jne	.L248
	jmp	.L247
.L278:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC47(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L269
.L402:
	movb	$0, 10(%rsi)
	movq	%r12, %rdx
	movq	%r13, %rcx
	call	create_while
	movq	%rax, %r8
	jmp	.L275
.L395:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC36(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L238
.L261:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC41(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L234
.L401:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbx, %rcx
	movq	%rax, %r12
	call	peek_current_token
	movq	%r12, %r8
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L272:
	movq	(%rsi), %rcx
	xorl	%r13d, %r13d
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC45(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L273
.L213:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC28(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L198
.L218:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC30(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L198
.L220:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC31(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L198
.L253:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L256
	movq	$0, 56(%rsp)
	jmp	.L257
.L403:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC49(%rip), %rcx
	xorl	%ebp, %ebp
	movq	%rax, %r8
	call	parser_error
	jmp	.L194
.L396:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbx, %rcx
	movq	%rax, %r13
	call	peek_current_token
	movq	%r13, %r8
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L249:
	movq	(%rsi), %rcx
	xorl	%r13d, %r13d
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC38(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L250
.L398:
	movq	64(%rsp), %r12
	movb	$0, 10(%rsi)
	movq	%r15, %r9
	movq	%r13, %rdx
	movq	56(%rsp), %r8
	movq	%r12, %rcx
	call	create_for
	movq	%rax, %r9
	jmp	.L242
.L263:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC42(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L234
.L404:
	cmpl	$6, 24(%rbp)
	movq	88(%rsp), %r15
	jne	.L224
	movq	.refptr.ELSE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L224
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L227
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L227
	movl	$1, %edx
	movq	%rbx, %rcx
	leaq	.LC34(%rip), %r13
	call	get_next_token
	movq	%rax, %rbp
	jmp	.L228
	.p2align 4,,10
	.p2align 3
.L229:
	movq	80(%rsp), %rcx
	movq	%r12, %rdx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L228:
	cmpl	$5, 24(%rbp)
	jne	.L230
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L224
.L230:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L229
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	movq	%r13, %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L229
.L394:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbx, %rcx
	movq	%rax, %rdi
	call	peek_current_token
	movq	%rdi, %r8
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
	jmp	.L287
.L397:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbx, %rcx
	movq	%rax, %r14
	call	peek_current_token
	movq	%r14, %r8
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L258:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC40(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	$0, 56(%rsp)
	jmp	.L259
.L407:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC50(%rip), %rcx
	xorl	%ebp, %ebp
	movq	%rax, %r8
	call	parser_error
	jmp	.L194
.L227:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC33(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L198
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
	je	.L578
.L409:
	testq	%rbx, %rbx
	je	.L579
.L410:
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
	je	.L501
	movq	%r14, %r12
	movq	.refptr.CLASS_KEYWORD(%rip), %r15
	movq	%r13, %r14
	jmp	.L411
	.p2align 4,,10
	.p2align 3
.L452:
	movq	(%r12), %rcx
	movq	%r11, 56(%rsp)
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC90(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L423:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %r11
	testq	%rax, %rax
	je	.L501
.L411:
	movl	24(%r11), %eax
	testl	%eax, %eax
	je	.L501
	cmpl	$6, %eax
	jne	.L452
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax
	movq	(%r11), %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	movl	%eax, %esi
	jne	.L580
	cmpl	$6, 24(%r11)
	jne	.L452
	movq	.refptr.FUNC_KEYWORD(%rip), %rax
	movq	(%r11), %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	jne	.L581
	cmpl	$6, 24(%r11)
	jne	.L452
	movq	(%r11), %rcx
	movq	(%r15), %rdx
	movq	%r11, 56(%rsp)
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	je	.L452
	movq	64(%rsp), %rcx
	call	create_symbol_table
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 80(%rsp)
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L582
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
	jne	.L456
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	je	.L456
	call	create_list
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 88(%rsp)
	call	get_next_token
	movq	56(%rsp), %r11
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rdi
	movq	%rax, %r10
	movq	%r11, 112(%rsp)
	jmp	.L457
	.p2align 4,,10
	.p2align 3
.L496:
	cmpl	$6, %eax
	je	.L583
.L458:
	movq	(%r12), %rcx
	movq	%r10, 56(%rsp)
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC87(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L492:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %r10
.L457:
	movl	24(%r10), %eax
	cmpl	$5, %eax
	jne	.L496
	movq	(%r10), %rcx
	movq	(%rdi), %rdx
	movq	%r10, 56(%rsp)
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	jne	.L497
	movl	24(%r10), %eax
	cmpl	$6, %eax
	jne	.L458
.L583:
	movq	.refptr.METHOD_KEYWORD(%rip), %rax
	movq	(%r10), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	jne	.L584
	cmpl	$6, 24(%r10)
	jne	.L458
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	(%r10), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L458
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
	je	.L585
.L493:
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
	je	.L494
.L495:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC86(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L492
	.p2align 4,,10
	.p2align 3
.L501:
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
.L580:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L586
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
	je	.L587
.L416:
	cmpl	$5, %eax
	jne	.L420
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	je	.L420
	movq	(%r12), %r9
	movq	64(%rsp), %r8
	movq	%rdi, %rcx
	movq	%rsi, %rdx
	call	parse_import_file
	movq	56(%rsp), %r11
	testq	%rax, %rax
	movq	%rax, %rcx
	je	.L588
.L421:
	movq	%rsi, %rdx
	movq	%r11, 56(%rsp)
	call	create_import
	movq	56(%rsp), %r11
	testq	%rax, %rax
	movq	%rax, %rdx
	je	.L415
.L422:
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	call	create_code_member
	movq	72(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L423
	.p2align 4,,10
	.p2align 3
.L581:
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
	je	.L425
	cmpl	$6, %eax
	jne	.L428
	movq	(%rbx), %rcx
	movq	%r11, 56(%rsp)
	call	is_builtin_type
	movq	56(%rsp), %r11
	testb	%al, %al
	je	.L428
.L425:
	movq	(%rbx), %rdx
	movq	64(%rsp), %rcx
	movq	%r11, 56(%rsp)
	call	search_name
	movq	56(%rsp), %r11
	testq	%rax, %rax
	movq	%rax, 80(%rsp)
	je	.L589
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r11, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L590
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
	jne	.L432
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	je	.L432
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
.L433:
	cmpl	$5, 24(%rbx)
	je	.L591
.L441:
	movq	%r12, %r8
	movq	%rdi, %rdx
	movq	%r14, %rcx
	call	parse_variable
	testq	%rax, %rax
	je	.L592
	cmpq	$0, 16(%rax)
	je	.L436
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC63(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L435:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L437
.L440:
	movq	(%r12), %rcx
	movq	%rsi, 56(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC64(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r11
.L427:
	movq	(%r12), %rcx
	movq	%r11, 56(%rsp)
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC69(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%r8d, %r8d
.L451:
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	movl	$1, %ecx
	call	create_code_member
	movq	72(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L423
	.p2align 4,,10
	.p2align 3
.L456:
	movq	(%r12), %rcx
	movq	%r11, 56(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC71(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r11
.L454:
	movq	(%r12), %rcx
	movq	%r11, 56(%rsp)
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC89(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%r9d, %r9d
.L500:
	xorl	%edx, %edx
	xorl	%r8d, %r8d
	movl	$2, %ecx
	call	create_code_member
	movq	72(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L423
	.p2align 4,,10
	.p2align 3
.L584:
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
	je	.L460
	cmpl	$6, %eax
	jne	.L463
	movq	0(%rbp), %rcx
	movq	%r10, 56(%rsp)
	call	is_builtin_type
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L463
.L460:
	movq	0(%rbp), %rdx
	movq	80(%rsp), %rcx
	movq	%r10, 56(%rsp)
	call	search_name
	movq	56(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, 104(%rsp)
	je	.L593
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r10, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r10
	cmpl	$1, 24(%rax)
	movq	%rax, %rbp
	jne	.L594
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
	jne	.L467
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L467
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	56(%rsp), %r10
	cmpl	$6, 24(%rax)
	movq	%rax, %rbp
	je	.L468
.L470:
	movq	(%r12), %rcx
	movq	%r10, 56(%rsp)
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC76(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r10
.L469:
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
.L471:
	cmpl	$5, 24(%rbx)
	je	.L595
.L576:
	movq	%rsi, %r10
.L475:
	movq	(%r12), %rcx
	movq	%r10, 56(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC77(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L462
	.p2align 4,,10
	.p2align 3
.L579:
	movq	(%rsi), %rbx
	jmp	.L410
	.p2align 4,,10
	.p2align 3
.L497:
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
	je	.L596
.L498:
	cmpl	$1, 32(%rax)
	movq	%r10, 56(%rsp)
	jne	.L597
.L499:
	movq	80(%rsp), %r8
	movq	88(%rsp), %rdx
	movq	%r11, 56(%rsp)
	movq	96(%rsp), %rcx
	call	create_class
	movq	56(%rsp), %r11
	testq	%rax, %rax
	movq	%rax, %r9
	jne	.L500
	jmp	.L454
	.p2align 4,,10
	.p2align 3
.L494:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L495
	jmp	.L492
	.p2align 4,,10
	.p2align 3
.L582:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC70(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L454
	.p2align 4,,10
	.p2align 3
.L586:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC53(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r11
.L415:
	movq	(%r12), %rcx
	movq	%r11, 56(%rsp)
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC57(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%edx, %edx
	jmp	.L422
	.p2align 4,,10
	.p2align 3
.L597:
	movq	(%r12), %rcx
	movq	%r11, 104(%rsp)
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC88(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	104(%rsp), %r11
	jmp	.L499
	.p2align 4,,10
	.p2align 3
.L420:
	movq	(%r12), %rcx
	movq	%r11, 56(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC55(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L415
	.p2align 4,,10
	.p2align 3
.L432:
	movq	(%r12), %rcx
	movq	%r11, 56(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC61(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L427
	.p2align 4,,10
	.p2align 3
.L467:
	movq	(%r12), %rcx
	movq	%r10, 56(%rsp)
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC75(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r10
.L462:
	movq	(%r12), %rcx
	movq	%r10, 56(%rsp)
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC84(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%edx, %edx
.L491:
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	call	create_class_member
	movq	88(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L492
	.p2align 4,,10
	.p2align 3
.L591:
	movq	0(%rbp), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L441
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rsi, 96(%rsp)
	movzbl	104(%rsp), %esi
	call	get_next_token
	movq	96(%rsp), %r11
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L443
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	%r11, 96(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	96(%rsp), %r11
	testb	%al, %al
	je	.L443
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
	jmp	.L444
	.p2align 4,,10
	.p2align 3
.L447:
	cmpl	$5, 8(%r9)
	cmove	%r13d, %esi
.L448:
	movq	96(%rsp), %rcx
	movq	%r9, %rdx
	call	list_append
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
.L444:
	cmpl	$5, 24(%rbx)
	jne	.L449
	movq	0(%rbp), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L598
.L449:
	movq	%r12, %r8
	movq	%rdi, %rdx
	movq	%r14, %rcx
	call	parse_statement
	movq	%rax, %r9
	testq	%rax, %rax
	je	.L599
	testb	%sil, %sil
	je	.L447
	movq	(%r12), %rcx
	movq	%rax, 104(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC67(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	104(%rsp), %r9
	jmp	.L447
	.p2align 4,,10
	.p2align 3
.L436:
	movq	56(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L435
	.p2align 4,,10
	.p2align 3
.L437:
	movq	0(%r13), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L600
	cmpl	$5, 24(%rbx)
	jne	.L440
	movq	0(%rbp), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L433
	jmp	.L440
	.p2align 4,,10
	.p2align 3
.L595:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L601
	cmpl	$5, 24(%rbx)
	jne	.L576
	movq	0(%rbp), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L602
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	56(%rsp), %rdx
	movq	%r12, %r8
	movq	%r14, %rcx
	movq	%rax, %rbx
	call	parse_variable
	testq	%rax, %rax
	je	.L603
	cmpq	$0, 16(%rax)
	je	.L481
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	movq	%r13, %rcx
	movq	%rax, %r8
	call	parser_error
.L480:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L471
	.p2align 4,,10
	.p2align 3
.L481:
	movq	120(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L480
	.p2align 4,,10
	.p2align 3
.L592:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC62(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L435
	.p2align 4,,10
	.p2align 3
.L603:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC78(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L480
	.p2align 4,,10
	.p2align 3
.L578:
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
	jmp	.L409
	.p2align 4,,10
	.p2align 3
.L428:
	movq	(%r12), %rcx
	movq	%r11, 56(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC58(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L427
	.p2align 4,,10
	.p2align 3
.L463:
	movq	(%r12), %rcx
	movq	%r10, 56(%rsp)
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC72(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L462
	.p2align 4,,10
	.p2align 3
.L585:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC85(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L493
	.p2align 4,,10
	.p2align 3
.L600:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L433
.L590:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC60(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L427
.L594:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC74(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L462
.L587:
	movq	.refptr.FROM_KEYWORD(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r11
	testb	%al, %al
	jne	.L417
	movl	24(%rbx), %eax
	jmp	.L416
.L602:
	cmpl	$5, 24(%rbx)
	movq	%rsi, %r10
	movq	56(%rsp), %rsi
	jne	.L475
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L475
.L483:
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r10, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r10
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L478
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L478
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
	jmp	.L484
	.p2align 4,,10
	.p2align 3
.L487:
	cmpl	$5, 8(%r13)
	movl	$1, %eax
	cmove	%eax, %ebp
.L488:
	movq	56(%rsp), %rcx
	movq	%r13, %rdx
	call	list_append
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
.L484:
	cmpl	$5, 24(%rbx)
	jne	.L489
	movq	(%rdi), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L604
.L489:
	movq	%r12, %r8
	movq	%rsi, %rdx
	movq	%r14, %rcx
	call	parse_statement
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L605
	testb	%bpl, %bpl
	je	.L487
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC67(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L487
.L596:
	movq	80(%rsp), %rcx
	call	create_symbol_table
	movq	(%rbx), %rcx
	movq	96(%rsp), %r8
	movl	$1, %edx
	movq	%rax, %r9
	call	create_symbol
	movq	104(%rsp), %r11
	movq	56(%rsp), %r10
	jmp	.L498
.L478:
	movq	(%r12), %rcx
	movq	%r10, 56(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC80(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L462
	.p2align 4,,10
	.p2align 3
.L605:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC82(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L488
.L468:
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	%r10, 56(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	56(%rsp), %r10
	testb	%al, %al
	je	.L470
	jmp	.L469
.L588:
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
	jmp	.L421
.L604:
	xorl	%eax, %eax
	movq	136(%rsp), %r10
	movw	%ax, 8(%r12)
	testb	%bpl, %bpl
	jne	.L490
	movq	.refptr.name_void(%rip), %rax
	movq	104(%rsp), %rdx
	cmpq	(%rax), %rdx
	je	.L490
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC83(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	136(%rsp), %r10
.L490:
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
	jne	.L491
	jmp	.L462
	.p2align 4,,10
	.p2align 3
.L589:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC59(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L427
.L593:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC73(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r10
	jmp	.L462
.L599:
	movq	(%r12), %rcx
	movq	%rax, 104(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC66(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	104(%rsp), %r9
	jmp	.L448
.L417:
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r11, 56(%rsp)
	call	get_next_token
	movq	56(%rsp), %r11
	cmpl	$4, 24(%rax)
	movq	%rax, %rbx
	jne	.L606
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r11, 56(%rsp)
	movq	(%rax), %rsi
	call	get_next_token
	movq	56(%rsp), %r11
	movq	%rax, %rbx
	movl	24(%rax), %eax
	jmp	.L416
.L601:
	movq	%rsi, %r10
	movq	56(%rsp), %rsi
	jmp	.L483
.L443:
	movq	(%r12), %rcx
	movq	%r11, 56(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC65(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L427
.L598:
	movb	$0, 8(%r12)
	movq	112(%rsp), %r11
	testb	%sil, %sil
	jne	.L450
	movq	.refptr.name_void(%rip), %rax
	movq	80(%rsp), %rsi
	cmpq	(%rax), %rsi
	je	.L450
	movq	(%r12), %rcx
	movq	%r11, 104(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC68(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	104(%rsp), %r11
.L450:
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
	jne	.L451
	jmp	.L427
	.p2align 4,,10
	.p2align 3
.L606:
	movq	(%r12), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC54(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	56(%rsp), %r11
	jmp	.L415
	.ident	"GCC: (GNU) 13.2.0"
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
	.def	get_full_path;	.scl	2;	.type	32;	.endef
	.def	parser_error;	.scl	2;	.type	32;	.endef
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	search_name;	.scl	2;	.type	32;	.endef
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.def	create_symbol;	.scl	2;	.type	32;	.endef
	.def	create_variable;	.scl	2;	.type	32;	.endef
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
	.section	.rdata$.refptr.ASSIGN_SYMBOL, "dr"
	.globl	.refptr.ASSIGN_SYMBOL
	.linkonce	discard
.refptr.ASSIGN_SYMBOL:
	.quad	ASSIGN_SYMBOL
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
