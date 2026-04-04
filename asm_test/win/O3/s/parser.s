	.file	"parser.c"
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
	movq	%rdx, %r12
	pushq	%rbp
	pushq	%rdi
	movq	%r8, %rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$88, %rsp
	call	peek_current_token
	movq	%rax, %rbp
	movl	24(%rax), %eax
	cmpl	$2, %eax
	je	.L130
	cmpl	$3, %eax
	je	.L131
	cmpl	$4, %eax
	je	.L132
	cmpl	$6, %eax
	je	.L133
.L6:
	cmpl	$5, %eax
	je	.L10
	cmpl	$1, %eax
	je	.L12
.L13:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC16(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L131:
	movq	0(%rbp), %rdx
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
.L130:
	movq	0(%rbp), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ebx, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L132:
	movq	0(%rbp), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L133:
	movq	.refptr.TRUE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L134
	movl	24(%rbp), %eax
	cmpl	$6, %eax
	jne	.L6
	movq	.refptr.FALSE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L9
	movl	24(%rbp), %eax
	cmpl	$5, %eax
	jne	.L23
	.p2align 4,,10
	.p2align 3
.L10:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r9
	movq	0(%rbp), %rcx
	movq	(%r9), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L135
	movl	24(%rbp), %eax
	cmpl	$5, %eax
	jne	.L23
	movq	.refptr.NOT_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L136
	movl	24(%rbp), %eax
	cmpl	$5, %eax
	jne	.L23
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L24
	movl	24(%rbp), %eax
.L23:
	cmpl	$1, %eax
	je	.L12
	cmpl	$6, %eax
	jne	.L13
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
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
	movq	%r12, %rcx
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
	jne	.L31
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r9
	xorl	%esi, %esi
	xorl	%r13d, %r13d
	movq	%r9, 64(%rsp)
.L61:
	testq	%r15, %r15
	je	.L32
	movq	(%r15), %rsi
	testq	%rsi, %rsi
	cmove	%r15, %rsi
.L32:
	testq	%r13, %r13
	jne	.L33
	testq	%rsi, %rsi
	je	.L33
	movl	32(%rsi), %r8d
	testl	%r8d, %r8d
	jne	.L33
	movq	24(%rsi), %rax
	movq	16(%rax), %r13
.L33:
	movq	64(%rsp), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L137
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L50
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rdi, %r8
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movq	%rax, 72(%rsp)
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L138
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rdi, 32(%rsp)
	movq	%r12, %r9
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	parse_expr_prec
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L52
.L53:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r11
	jne	.L55
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax
	movq	(%r11), %rcx
	movq	%r11, 72(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	72(%rsp), %r11
	testb	%al, %al
	je	.L55
	movq	56(%rsp), %rdx
	movq	%r14, %r9
	xorl	%r8d, %r8d
	movl	$3, %ecx
	movq	$0, 32(%rsp)
	call	create_variable_access
	movq	%rax, 56(%rsp)
.L49:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r14
	je	.L61
.L123:
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
.L50:
	movq	.refptr.DOT_SYMBOL(%rip), %rax
	movq	(%r14), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L123
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r14
	testq	%r13, %r13
	je	.L139
	cmpl	$1, 24(%rax)
	jne	.L140
	movq	(%rax), %rdx
	movq	%r13, %rcx
	call	search_name
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L141
.L58:
	movq	56(%rsp), %rdx
	xorl	%r9d, %r9d
	movq	%r15, %r8
	movl	$2, %ecx
	movq	$0, 32(%rsp)
	xorl	%r13d, %r13d
	xorl	%esi, %esi
	call	create_variable_access
	movq	%rax, 56(%rsp)
	jmp	.L49
	.p2align 4,,10
	.p2align 3
.L137:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	testq	%r15, %r15
	je	.L142
	movl	32(%r15), %eax
	testl	%eax, %eax
	je	.L143
.L37:
	subl	$1, %eax
	cmpl	$1, %eax
	ja	.L144
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
.L40:
	cmpl	$5, 24(%rsi)
	je	.L145
.L48:
	movq	%rdi, %r8
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L146
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rdi, 32(%rsp)
	movq	%r12, %r9
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	parse_expr_prec
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L42
.L43:
	movq	%r14, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rsi
	je	.L44
.L47:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC9(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L29:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC15(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L145:
	movq	0(%r13), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L48
	movq	%r14, 32(%rsp)
	movq	56(%rsp), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$1, %ecx
	call	create_variable_access
	movq	(%r15), %r15
	movq	%rax, 56(%rsp)
	movl	32(%r15), %ecx
	testl	%ecx, %ecx
	jne	.L65
	movq	24(%r15), %rax
	xorl	%esi, %esi
	movq	16(%rax), %r13
	jmp	.L49
	.p2align 4,,10
	.p2align 3
.L44:
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%rsi), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L147
	cmpl	$5, 24(%rsi)
	jne	.L47
	movq	0(%r13), %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L40
	jmp	.L47
	.p2align 4,,10
	.p2align 3
.L146:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rbx, %rcx
	movq	%rax, 72(%rsp)
	call	peek_current_token
	movq	72(%rsp), %r8
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L42:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC8(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%edx, %edx
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L147:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rsi
	jmp	.L40
	.p2align 4,,10
	.p2align 3
.L141:
	testq	%rsi, %rsi
	je	.L59
	movl	32(%rsi), %edx
	testl	%edx, %edx
	je	.L127
	movq	(%rsi), %rsi
	testq	%rsi, %rsi
	je	.L59
	movl	32(%rsi), %eax
	testl	%eax, %eax
	je	.L127
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L59:
	movq	(%r14), %rdx
	movq	%rsi, %rcx
	call	make_method_name
	movq	%r13, %rcx
	movq	%rax, %rdx
	call	search_name_use_strcmp
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L58
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r14, %rdx
	leaq	.LC14(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L134:
	movq	0(%rbp), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$3, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L9:
	movq	0(%rbp), %rdx
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$4, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L144:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC7(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L143:
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax
	movq	8(%r15), %rcx
	movq	(%rax), %rdx
	call	make_method_name
	movq	%rax, %rdx
	movq	24(%r15), %rax
	movq	16(%rax), %rcx
	call	search_name_use_strcmp
	movq	56(%rsp), %rdx
	xorl	%r9d, %r9d
	movq	$0, 32(%rsp)
	movq	%rax, %r8
	movl	$2, %ecx
	movq	%rax, %r15
	call	create_variable_access
	movq	%rax, 56(%rsp)
	testq	%r15, %r15
	je	.L36
	movl	32(%r15), %eax
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
	.p2align 4,,10
	.p2align 3
.L127:
	movq	8(%rsi), %rsi
	jmp	.L59
.L138:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rbx, %rcx
	movq	%rax, %r14
	call	peek_current_token
	movq	%r14, %r8
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L52:
	movq	(%rdi), %rcx
	xorl	%r14d, %r14d
	call	get_full_path
	movq	72(%rsp), %rdx
	leaq	.LC10(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L135:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rdi, %r8
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movq	%rax, %rsi
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L148
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rdi, 32(%rsp)
	xorl	%r8d, %r8d
	movq	%r12, %r9
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
.L136:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rdi, %r8
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movq	%rax, %rsi
	call	parse_primary
	movq	%rax, %r9
	testq	%rax, %rax
	je	.L149
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
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movq	%rax, %rsi
	call	parse_primary
	movq	%rax, %r9
	testq	%rax, %rax
	je	.L150
	xorl	%r10d, %r10d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$7, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L142:
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
.L65:
	xorl	%r13d, %r13d
	xorl	%esi, %esi
	jmp	.L49
.L55:
	movq	(%rdi), %rcx
	movq	%r11, 56(%rsp)
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC11(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L29
.L139:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r14, %rdx
	leaq	.LC12(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L29
.L140:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r14, %rdx
	leaq	.LC13(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L29
.L148:
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
.L150:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rdx
	leaq	.LC4(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%eax, %eax
	jmp	.L1
.L149:
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
	jne	.L152
.L159:
	movq	(%rax), %rcx
	call	string_to_operator
	movl	%eax, %ecx
	movl	%eax, %edi
	call	operator_precedence
	movl	%eax, %esi
	cmpl	$19, %edi
	je	.L152
	cmpl	%r14d, %eax
	jl	.L152
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
	je	.L166
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %rbp
.L165:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	jne	.L155
	movq	(%rax), %rcx
	call	string_to_operator
	movl	%eax, %r15d
	movl	%eax, %ecx
	call	operator_precedence
	cmpl	$19, %r15d
	je	.L155
	cmpl	%eax, %esi
	jge	.L155
	movq	160(%rsp), %rdx
	movq	%r13, %r9
	movl	%eax, %r8d
	movq	%rbx, %rcx
	movq	%rdx, 32(%rsp)
	movq	%rbp, %rdx
	call	parse_expr_prec
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L165
	xorl	%r12d, %r12d
	jmp	.L151
	.p2align 4,,10
	.p2align 3
.L155:
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
	je	.L159
.L152:
	movq	%rbx, %rcx
	call	peek_current_token
.L151:
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
.L166:
	movq	160(%rsp), %rax
	xorl	%r12d, %r12d
	movq	(%rax), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC17(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L151
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
	movq	%rdx, %r12
	pushq	%rbp
	pushq	%rdi
	movq	%r8, %rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	subq	$56, %rsp
	call	peek_current_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L168
	cmpl	$6, %eax
	jne	.L171
	movq	(%rbx), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L171
.L168:
	movq	(%rbx), %rdx
	movq	%r12, %rcx
	call	search_name
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L172
	movl	32(%rax), %eax
	cmpl	$6, %eax
	je	.L173
	testl	%eax, %eax
	jne	.L201
.L173:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L202
	cmpb	$0, 10(%rdi)
	movl	$3, %edx
	jne	.L203
.L175:
	movq	(%rbx), %rcx
	movq	%r12, %r9
	movq	%rbp, %r8
	call	create_symbol
	movl	$1, %edx
	movq	%rsi, %rcx
	movq	%rax, %rbx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	je	.L204
.L177:
	xorl	%r8d, %r8d
.L181:
	addq	$56, %rsp
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
.L203:
	cmpb	$1, 9(%rdi)
	sbbl	%edx, %edx
	andl	$2, %edx
	addl	$3, %edx
	jmp	.L175
	.p2align 4,,10
	.p2align 3
.L202:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC21(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	cmpb	$0, 10(%rdi)
	movl	$3, %edx
	je	.L175
	jmp	.L203
	.p2align 4,,10
	.p2align 3
.L171:
	movq	(%rdi), %rcx
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
.L201:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC19(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L173
	.p2align 4,,10
	.p2align 3
.L204:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx
	movq	(%rax), %rcx
	movq	(%rdx), %rdx
	call	string_equal
	testb	%al, %al
	je	.L177
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rdi, %r8
	movq	%r12, %rdx
	movq	%rsi, %rcx
	movq	%rax, %r13
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L205
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rdi, 32(%rsp)
	xorl	%r8d, %r8d
	movq	%r12, %r9
	movq	%rax, %rdx
	movq	%rsi, %rcx
	call	parse_expr_prec
	movq	%rax, %r8
	testq	%rax, %rax
	jne	.L181
.L180:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC22(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L177
	.p2align 4,,10
	.p2align 3
.L172:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC20(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L173
.L205:
	movq	(%rdi), %rcx
	call	get_full_path
	movq	%rsi, %rcx
	movq	%rax, %r12
	call	peek_current_token
	movq	%r12, %r8
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
	jmp	.L180
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
	je	.L398
.L207:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_primary
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L399
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
.L308:
	movq	%rbp, 32(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	$0, 40(%rsp)
	xorl	%ecx, %ecx
	call	create_statement
	movq	%rax, %rbp
.L295:
	movq	%rbx, %rcx
	call	peek_current_token
	movq	%rax, %rdi
	testq	%rbp, %rbp
	je	.L400
.L309:
	movq	%rbx, %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L310
.L312:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC52(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L206:
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
.L310:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L312
	jmp	.L206
	.p2align 4,,10
	.p2align 3
.L398:
	movq	%rax, %rbp
	movq	.refptr.IF_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L401
	movq	.refptr.FOR_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L402
	movq	.refptr.WHILE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L403
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L404
	movq	.refptr.RETURN_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L296
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	je	.L405
.L297:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_primary
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L406
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
.L299:
	movq	%rbp, 32(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	$0, 40(%rsp)
	movl	$5, %ecx
	call	create_statement
	movq	%rax, %rbp
	jmp	.L295
	.p2align 4,,10
	.p2align 3
.L402:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L247
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L247
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L248
.L251:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_variable
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L407
.L250:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L252:
	cmpl	$5, 24(%rbp)
	jne	.L255
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %r14
	movq	0(%rbp), %rcx
	movq	(%r14), %rdx
	call	string_equal
	testb	%al, %al
	je	.L255
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L256
.L259:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L408
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
	je	.L261
.L262:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L260:
	cmpl	$5, 24(%rbp)
	jne	.L264
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	je	.L264
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L265
.L268:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L409
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
	je	.L270
.L271:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L269:
	cmpl	$5, 24(%rbp)
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
	movq	%rax, %r15
	call	get_next_token
	movq	%r12, 64(%rsp)
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14
	movq	%rax, %rbp
	jmp	.L276
	.p2align 4,,10
	.p2align 3
.L277:
	movq	%r12, %rdx
	movq	%r15, %rcx
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
	jne	.L410
.L278:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L277
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC43(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L277
	.p2align 4,,10
	.p2align 3
.L400:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rdi, %rdx
	leaq	.LC51(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L309
	.p2align 4,,10
	.p2align 3
.L401:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L211
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r12
	movq	(%rax), %rcx
	movq	(%r12), %rdx
	call	string_equal
	testb	%al, %al
	je	.L211
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
	je	.L411
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
	je	.L213
.L214:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L216
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L216
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
	call	create_list
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r15
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14
	movq	%rax, %rbp
	jmp	.L219
	.p2align 4,,10
	.p2align 3
.L220:
	movq	%r13, %rdx
	movq	%r15, %rcx
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
	jne	.L412
.L221:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L220
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC27(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L220
	.p2align 4,,10
	.p2align 3
.L211:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC23(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L210:
	xorl	%edx, %edx
.L223:
	movq	$0, 40(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L206
	.p2align 4,,10
	.p2align 3
.L399:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbx, %rcx
	movq	%rax, %rdi
	call	peek_current_token
	movq	%rdi, %r8
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
	jmp	.L308
	.p2align 4,,10
	.p2align 3
.L403:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L282
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L282
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
	je	.L413
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
	je	.L284
.L285:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L288
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L288
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L290
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L290
	call	create_list
	movb	$1, 11(%rsi)
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r12
	call	get_next_token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14
	movq	%rax, %rbp
	jmp	.L291
	.p2align 4,,10
	.p2align 3
.L292:
	movq	%r15, %rdx
	movq	%r12, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L291:
	cmpl	$5, 24(%rbp)
	jne	.L293
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L414
.L293:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L292
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC48(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L292
	.p2align 4,,10
	.p2align 3
.L404:
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
	jmp	.L295
	.p2align 4,,10
	.p2align 3
.L216:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC25(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L210
	.p2align 4,,10
	.p2align 3
.L247:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC35(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L246:
	xorl	%r9d, %r9d
.L254:
	movq	$0, 40(%rsp)
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$4, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L206
	.p2align 4,,10
	.p2align 3
.L282:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC44(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L281:
	xorl	%r8d, %r8d
.L287:
	movq	$0, 40(%rsp)
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$3, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L206
.L411:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbx, %rcx
	movq	%rax, %r13
	call	peek_current_token
	movq	%r13, %r8
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L213:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC24(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	$0, 72(%rsp)
	jmp	.L214
	.p2align 4,,10
	.p2align 3
.L296:
	movq	.refptr.BREAK_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L300
	cmpb	$0, 11(%rsi)
	je	.L415
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$6, %ecx
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L295
	.p2align 4,,10
	.p2align 3
.L255:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC37(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L246
.L218:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC26(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L210
.L412:
	call	create_list
	movq	%rax, 64(%rsp)
	call	create_list
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, 80(%rsp)
	call	peek_next_token
	cmpl	$6, 24(%rax)
	movq	%rax, %rbp
	jne	.L236
	movq	%r15, 88(%rsp)
	.p2align 4,,10
	.p2align 3
.L222:
	movq	.refptr.ELIF_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L416
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L225
	movq	(%r12), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	je	.L225
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
	je	.L417
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
	je	.L227
.L228:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L230
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L230
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L232
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L232
	call	create_list
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	%rax, %r13
	call	get_next_token
	movq	%r15, 56(%rsp)
	movq	%rax, %rbp
	jmp	.L233
	.p2align 4,,10
	.p2align 3
.L234:
	movq	%r15, %rdx
	movq	%r13, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L233:
	cmpl	$5, 24(%rbp)
	jne	.L235
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L418
.L235:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L234
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC32(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L234
	.p2align 4,,10
	.p2align 3
.L418:
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
	je	.L222
	movq	88(%rsp), %r15
.L236:
	movq	%rbx, %rcx
	call	peek_current_token
	movq	80(%rsp), %r9
	movq	64(%rsp), %r8
	movq	%r15, %rdx
	movq	72(%rsp), %rcx
	call	create_if
	movq	%rax, %rdx
	jmp	.L223
.L417:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbx, %rcx
	movq	%rax, %r13
	call	peek_current_token
	movq	%r13, %r8
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L227:
	movq	(%rsi), %rcx
	xorl	%r15d, %r15d
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC29(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L228
.L248:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	xorl	%r12d, %r12d
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L252
	jmp	.L251
.L288:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC46(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L281
.L264:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC39(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L246
.L405:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rdx
	movq	(%rax), %rcx
	movq	(%rdx), %rdx
	call	string_equal
	testb	%al, %al
	je	.L297
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$5, %ecx
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L206
.L300:
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L207
	cmpb	$0, 11(%rsi)
	je	.L419
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$7, %ecx
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rbp
	jmp	.L295
.L256:
	movq	(%r14), %rdx
	movq	(%rax), %rcx
	xorl	%r13d, %r13d
	call	string_equal
	testb	%al, %al
	jne	.L260
	jmp	.L259
.L290:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC47(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L281
.L414:
	movb	$0, 11(%rsi)
	movq	%r12, %rdx
	movq	%r13, %rcx
	call	create_while
	movq	%rax, %r8
	jmp	.L287
.L407:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC36(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L250
.L273:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC41(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L246
.L413:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbx, %rcx
	movq	%rax, %r12
	call	peek_current_token
	movq	%r12, %r8
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L284:
	movq	(%rsi), %rcx
	xorl	%r13d, %r13d
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC45(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L285
.L225:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC28(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L210
.L230:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC30(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L210
.L232:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC31(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L210
.L265:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L268
	movq	$0, 56(%rsp)
	jmp	.L269
.L415:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC49(%rip), %rcx
	xorl	%ebp, %ebp
	movq	%rax, %r8
	call	parser_error
	jmp	.L206
.L408:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbx, %rcx
	movq	%rax, %r13
	call	peek_current_token
	movq	%r13, %r8
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L261:
	movq	(%rsi), %rcx
	xorl	%r13d, %r13d
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC38(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L262
.L410:
	movq	64(%rsp), %r12
	movb	$0, 11(%rsi)
	movq	%r15, %r9
	movq	%r13, %rdx
	movq	56(%rsp), %r8
	movq	%r12, %rcx
	call	create_for
	movq	%rax, %r9
	jmp	.L254
.L275:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC42(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L246
.L416:
	cmpl	$6, 24(%rbp)
	movq	88(%rsp), %r15
	jne	.L236
	movq	.refptr.ELSE_KEYWORD(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L236
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L239
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	0(%rbp), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L239
	movl	$1, %edx
	movq	%rbx, %rcx
	leaq	.LC34(%rip), %r13
	call	get_next_token
	movq	%rax, %rbp
	jmp	.L240
	.p2align 4,,10
	.p2align 3
.L241:
	movq	80(%rsp), %rcx
	movq	%r12, %rdx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L240:
	cmpl	$5, 24(%rbp)
	jne	.L242
	movq	(%r14), %rdx
	movq	0(%rbp), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L236
.L242:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L241
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	movq	%r13, %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L241
.L406:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbx, %rcx
	movq	%rax, %rdi
	call	peek_current_token
	movq	%rdi, %r8
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
	jmp	.L299
.L409:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbx, %rcx
	movq	%rax, %r14
	call	peek_current_token
	movq	%r14, %r8
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	call	parser_error
.L270:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC40(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	$0, 56(%rsp)
	jmp	.L271
.L419:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC50(%rip), %rcx
	xorl	%ebp, %ebp
	movq	%rax, %r8
	call	parser_error
	jmp	.L206
.L239:
	movq	(%rsi), %rcx
	call	get_full_path
	movq	%rbp, %rdx
	leaq	.LC33(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L210
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
	je	.L620
.L421:
	testq	%rbx, %rbx
	je	.L621
.L422:
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
	je	.L539
	movq	%rdi, %r15
	jmp	.L423
	.p2align 4,,10
	.p2align 3
.L468:
	movq	(%r15), %rcx
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC92(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L435:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, 56(%rsp)
	testq	%rax, %rax
	je	.L539
.L423:
	movq	56(%rsp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	je	.L539
	cmpl	$6, %eax
	jne	.L468
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	56(%rsp), %rax
	movq	(%rax), %rcx
	call	string_equal
	movl	%eax, %esi
	testb	%al, %al
	jne	.L622
	movq	56(%rsp), %rax
	cmpl	$6, 24(%rax)
	jne	.L468
	movq	.refptr.FUNC_KEYWORD(%rip), %rdi
	movq	(%rax), %rcx
	movq	(%rdi), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L623
	movq	56(%rsp), %rax
	cmpl	$6, 24(%rax)
	jne	.L468
	movq	.refptr.CLASS_KEYWORD(%rip), %rsi
	movq	(%rax), %rcx
	movq	(%rsi), %rdx
	call	string_equal
	testb	%al, %al
	je	.L468
	movq	72(%rsp), %rcx
	call	create_symbol_table
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, 88(%rsp)
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L624
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
	jne	.L472
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L472
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
	jmp	.L473
	.p2align 4,,10
	.p2align 3
.L525:
	cmpl	$6, %eax
	je	.L625
.L474:
	movq	(%r15), %rcx
	movq	%r10, 64(%rsp)
	call	get_full_path
	movq	64(%rsp), %rdx
	movq	%rsi, %rcx
	movq	%rax, %r8
	call	parser_error
.L522:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %r10
.L473:
	movl	24(%r10), %eax
	cmpl	$5, %eax
	jne	.L525
	movq	(%r10), %rcx
	movq	(%r12), %rdx
	movq	%r10, 64(%rsp)
	call	string_equal
	movq	64(%rsp), %r10
	testb	%al, %al
	jne	.L526
	movl	24(%r10), %eax
	cmpl	$6, %eax
	jne	.L474
.L625:
	movq	.refptr.METHOD_KEYWORD(%rip), %rax
	movq	(%r10), %rcx
	movq	%r10, 64(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	64(%rsp), %r10
	testb	%al, %al
	jne	.L626
	cmpl	$6, 24(%r10)
	jne	.L474
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	(%r10), %rcx
	movq	%r10, 64(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	64(%rsp), %r10
	testb	%al, %al
	je	.L474
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movb	$1, 10(%r15)
	movq	%r15, %r8
	movq	%r14, %rcx
	movq	88(%rsp), %rdx
	movq	%rax, %rbx
	call	parse_variable
	movb	$0, 10(%r15)
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L627
.L513:
	xorl	%edx, %edx
	movq	%rbp, %r8
	movl	$1, %ecx
	call	create_class_member
	movq	104(%rsp), %rcx
	movq	%rax, %rbx
	movq	%rax, %rdx
	call	list_append
	cmpl	$1, 8(%rbx)
	je	.L628
.L517:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L521
.L523:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC87(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L522
	.p2align 4,,10
	.p2align 3
.L539:
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
.L622:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L629
	movl	$1, %edx
	movq	%r14, %rcx
	movq	(%rax), %rdi
	xorl	%esi, %esi
	call	get_next_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$6, %eax
	je	.L630
.L428:
	cmpl	$5, %eax
	jne	.L432
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L432
	movq	(%r15), %r9
	movq	72(%rsp), %r8
	movq	%rdi, %rcx
	movq	%rsi, %rdx
	call	parse_import_file
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L631
.L433:
	movq	%rsi, %rdx
	call	create_import
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L427
.L434:
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	call	create_code_member
	movq	80(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L435
	.p2align 4,,10
	.p2align 3
.L623:
	movq	72(%rsp), %rcx
	call	create_symbol_table
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rax, %rdi
	call	get_next_token
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L437
	cmpl	$6, %eax
	jne	.L440
	movq	(%rbx), %rcx
	call	is_builtin_type
	testb	%al, %al
	je	.L440
.L437:
	movq	(%rbx), %rdx
	movq	72(%rsp), %rcx
	call	search_name
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L632
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L633
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
	jne	.L444
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L444
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
.L445:
	cmpl	$5, 24(%rbx)
	je	.L634
.L453:
	movq	%r15, %r8
	movq	%rdi, %rdx
	movq	%r14, %rcx
	call	parse_variable
	testq	%rax, %rax
	je	.L635
	cmpq	$0, 16(%rax)
	je	.L448
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC63(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L447:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L449
.L452:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC64(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L439:
	movq	(%r15), %rcx
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC69(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%r8d, %r8d
.L467:
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	movl	$1, %ecx
	call	create_code_member
	movq	80(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L435
	.p2align 4,,10
	.p2align 3
.L472:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC71(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L470:
	movq	(%r15), %rcx
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC91(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%r9d, %r9d
.L538:
	xorl	%edx, %edx
	xorl	%r8d, %r8d
	movl	$2, %ecx
	call	create_code_member
	movq	80(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L435
	.p2align 4,,10
	.p2align 3
.L626:
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
	je	.L476
	cmpl	$6, %eax
	jne	.L479
	movq	0(%r13), %rcx
	movq	%r10, 64(%rsp)
	call	is_builtin_type
	movq	64(%rsp), %r10
	testb	%al, %al
	je	.L479
.L476:
	movq	0(%r13), %rdx
	movq	88(%rsp), %rcx
	movq	%r10, 64(%rsp)
	call	search_name
	movq	64(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, 136(%rsp)
	je	.L636
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r10, 64(%rsp)
	call	get_next_token
	movq	64(%rsp), %r10
	cmpl	$1, 24(%rax)
	movq	%rax, %r13
	jne	.L637
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
	jne	.L483
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	0(%r13), %rcx
	movq	%r10, 64(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	64(%rsp), %r10
	testb	%al, %al
	je	.L483
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	64(%rsp), %r10
	cmpl	$6, 24(%rax)
	movq	%rax, %r13
	je	.L484
.L486:
	movq	(%r15), %rcx
	movq	%r10, 64(%rsp)
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC76(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	64(%rsp), %r10
.L485:
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
.L487:
	cmpl	$5, 24(%rbx)
	je	.L638
.L616:
	movq	%r12, %r10
	movq	%r13, %r12
	movq	%rbx, %r13
.L491:
	movq	(%r15), %rcx
	movq	%r10, 64(%rsp)
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC77(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	64(%rsp), %r10
	jmp	.L478
	.p2align 4,,10
	.p2align 3
.L621:
	movq	(%rsi), %rbx
	jmp	.L422
	.p2align 4,,10
	.p2align 3
.L526:
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
	je	.L639
.L527:
	movq	64(%rsp), %rax
	movq	%r10, 128(%rsp)
	cmpl	$2, 32(%rax)
	jne	.L640
.L528:
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
.L530:
	movq	%rbx, %rcx
	call	list_pop
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L641
.L531:
	movq	8(%r12), %rax
	movq	(%rdi), %rdx
	movq	8(%rax), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L530
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
	jne	.L531
.L641:
	call	create_list
	movq	104(%rsp), %rcx
	movq	%rax, %r13
	call	list_copy
	movq	%rax, %rbx
	jmp	.L533
	.p2align 4,,10
	.p2align 3
.L535:
	cmpl	$1, 8(%rdi)
	je	.L642
.L533:
	movq	%rbx, %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L535
	call	create_list
	movq	%rsi, %rcx
	movq	%rax, %r12
	call	list_copy
	movq	%rax, %rbx
	jmp	.L536
	.p2align 4,,10
	.p2align 3
.L537:
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
.L536:
	movq	%rbx, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L537
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
	jne	.L538
	jmp	.L470
	.p2align 4,,10
	.p2align 3
.L642:
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
	je	.L643
.L534:
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
	jmp	.L533
	.p2align 4,,10
	.p2align 3
.L521:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L523
	jmp	.L522
	.p2align 4,,10
	.p2align 3
.L628:
	movq	(%rbx), %rdx
	movq	.refptr.name_int(%rip), %rcx
	movq	(%rdx), %rax
	cmpq	(%rcx), %rax
	je	.L619
	movq	.refptr.name_float(%rip), %rcx
	cmpq	(%rcx), %rax
	je	.L619
	movq	.refptr.name_string(%rip), %rcx
	cmpq	(%rcx), %rax
	je	.L619
	movq	.refptr.name_bool(%rip), %rcx
	cmpq	(%rcx), %rax
	je	.L518
	movq	.refptr.name_void(%rip), %rcx
	cmpq	(%rcx), %rax
	je	.L518
	movl	32(%rax), %ecx
	testl	%ecx, %ecx
	je	.L619
	movq	8(%rax), %rbx
	movq	8(%rdx), %rax
	movq	8(%rax), %rbp
	call	__getreent
	movq	%rbx, %r9
	leaq	.LC86(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbp, %r8
	call	fprintf
	jmp	.L517
	.p2align 4,,10
	.p2align 3
.L619:
	addq	$8, 120(%rsp)
	jmp	.L517
	.p2align 4,,10
	.p2align 3
.L624:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC70(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L470
	.p2align 4,,10
	.p2align 3
.L629:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC53(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L427:
	movq	(%r15), %rcx
	call	get_full_path
	movq	56(%rsp), %rdx
	leaq	.LC57(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%edx, %edx
	jmp	.L434
	.p2align 4,,10
	.p2align 3
.L640:
	movq	(%r15), %rcx
	call	get_full_path
	movq	128(%rsp), %rdx
	leaq	.LC89(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L528
	.p2align 4,,10
	.p2align 3
.L432:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC55(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L427
	.p2align 4,,10
	.p2align 3
.L444:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC61(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L439
	.p2align 4,,10
	.p2align 3
.L483:
	movq	(%r15), %rcx
	movq	%r10, 64(%rsp)
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC75(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	64(%rsp), %r10
.L478:
	movq	(%r15), %rcx
	movq	%r10, 64(%rsp)
	call	get_full_path
	movq	64(%rsp), %rdx
	leaq	.LC84(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	xorl	%edx, %edx
.L511:
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	call	create_class_member
	movq	104(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L522
	.p2align 4,,10
	.p2align 3
.L634:
	movq	(%r12), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	je	.L453
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L455
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L455
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
	jmp	.L456
	.p2align 4,,10
	.p2align 3
.L459:
	cmpl	$5, 8(%r9)
	cmove	%r13d, %esi
.L460:
	movq	%r9, %rdx
	movq	%r12, %rcx
	call	list_append
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
.L456:
	cmpl	$5, 24(%rbx)
	jne	.L461
	movq	0(%rbp), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L644
.L461:
	movq	%r15, %r8
	movq	%rdi, %rdx
	movq	%r14, %rcx
	call	parse_statement
	movq	%rax, %r9
	testq	%rax, %rax
	je	.L645
	testb	%sil, %sil
	je	.L459
	movq	(%r15), %rcx
	movq	%rax, 104(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC67(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	104(%rsp), %r9
	jmp	.L459
	.p2align 4,,10
	.p2align 3
.L448:
	movq	64(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L447
	.p2align 4,,10
	.p2align 3
.L449:
	movq	0(%r13), %rdx
	movq	(%rax), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L646
	cmpl	$5, 24(%rbx)
	jne	.L452
	movq	(%r12), %rdx
	movq	(%rbx), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L445
	jmp	.L452
	.p2align 4,,10
	.p2align 3
.L638:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L647
	cmpl	$5, 24(%rbx)
	jne	.L616
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L648
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%r15, %r8
	movq	%rbp, %rdx
	movq	%r14, %rcx
	movq	%rax, %rbx
	call	parse_variable
	testq	%rax, %rax
	je	.L649
	cmpq	$0, 16(%rax)
	je	.L497
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC79(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
.L496:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L487
	.p2align 4,,10
	.p2align 3
.L497:
	movq	144(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L496
	.p2align 4,,10
	.p2align 3
.L635:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC62(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L447
	.p2align 4,,10
	.p2align 3
.L649:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC78(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L496
	.p2align 4,,10
	.p2align 3
.L620:
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
	jmp	.L421
	.p2align 4,,10
	.p2align 3
.L440:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC58(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L439
	.p2align 4,,10
	.p2align 3
.L479:
	movq	(%r15), %rcx
	movq	%r10, 64(%rsp)
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC72(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	64(%rsp), %r10
	jmp	.L478
	.p2align 4,,10
	.p2align 3
.L627:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC85(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L513
	.p2align 4,,10
	.p2align 3
.L646:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L445
.L633:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC60(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L439
.L637:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC74(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	64(%rsp), %r10
	jmp	.L478
.L630:
	movq	.refptr.FROM_KEYWORD(%rip), %rax
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L429
.L618:
	movl	24(%rbx), %eax
	jmp	.L428
.L648:
	cmpl	$5, 24(%rbx)
	movq	%r12, %r10
	movq	%r13, %r12
	movq	%rbx, %r13
	jne	.L491
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	%r10, 64(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	64(%rsp), %r10
	testb	%al, %al
	je	.L491
.L499:
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r10, 64(%rsp)
	call	get_next_token
	movq	64(%rsp), %r10
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L494
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rbx), %rcx
	movq	%r10, 64(%rsp)
	movq	(%rax), %rdx
	call	string_equal
	movq	64(%rsp), %r10
	testb	%al, %al
	je	.L494
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
	jmp	.L500
	.p2align 4,,10
	.p2align 3
.L503:
	cmpl	$5, 8(%rbp)
	movl	$1, %eax
	cmove	%eax, %ebx
.L504:
	movq	64(%rsp), %rcx
	movq	%rbp, %rdx
	call	list_append
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %r13
.L500:
	cmpl	$5, 24(%r13)
	jne	.L505
	movq	(%r12), %rdx
	movq	0(%r13), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L650
.L505:
	movq	128(%rsp), %rdx
	movq	%r15, %r8
	movq	%r14, %rcx
	call	parse_statement
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L651
	testb	%bl, %bl
	je	.L503
	movq	(%r15), %rcx
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC67(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L503
.L639:
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
	jmp	.L527
.L494:
	movq	(%r15), %rcx
	movq	%r10, 64(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC80(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	64(%rsp), %r10
	jmp	.L478
.L518:
	addq	$1, 120(%rsp)
	jmp	.L517
	.p2align 4,,10
	.p2align 3
.L651:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC82(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L504
.L643:
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
	jmp	.L534
.L484:
	movq	(%rdi), %rdx
	movq	(%rax), %rcx
	movq	%r10, 64(%rsp)
	call	string_equal
	movq	64(%rsp), %r10
	testb	%al, %al
	je	.L486
	jmp	.L485
.L650:
	xorl	%r8d, %r8d
	movq	168(%rsp), %r10
	movq	128(%rsp), %rbp
	movw	%r8w, 8(%r15)
	testb	%bl, %bl
	jne	.L507
	movq	.refptr.name_void(%rip), %rax
	movq	136(%rsp), %rbx
	cmpq	(%rax), %rbx
	je	.L509
	movq	(%r15), %rcx
	movq	%r10, 128(%rsp)
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC83(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	.refptr.name_void(%rip), %rax
	movq	136(%rsp), %rbx
	movq	128(%rsp), %r10
	cmpq	(%rax), %rbx
	je	.L509
.L507:
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
	jne	.L511
	jmp	.L478
	.p2align 4,,10
	.p2align 3
.L631:
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
	jmp	.L433
.L632:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC59(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L439
.L636:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%r13, %rdx
	leaq	.LC73(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	64(%rsp), %r10
	jmp	.L478
.L429:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	cmpl	$4, 24(%rax)
	movq	%rax, %rbx
	jne	.L652
	movl	$1, %edx
	movq	%r14, %rcx
	movq	(%rax), %rsi
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L618
.L645:
	movq	(%r15), %rcx
	movq	%rax, 104(%rsp)
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC66(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	movq	104(%rsp), %r9
	jmp	.L460
.L647:
	movq	%r12, %r10
	movq	%r13, %r12
	jmp	.L499
.L644:
	movb	$0, 8(%r15)
	movq	112(%rsp), %rbp
	testb	%sil, %sil
	jne	.L463
	movq	.refptr.name_void(%rip), %rsi
	cmpq	(%rsi), %rbp
	je	.L465
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC68(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	cmpq	(%rsi), %rbp
	je	.L465
.L463:
	movq	%rdi, 40(%rsp)
	movq	64(%rsp), %r9
	movq	%rbp, %r8
	movq	96(%rsp), %rdx
	movq	88(%rsp), %rcx
	movq	%r12, 32(%rsp)
	call	create_function_use_ptr
	movq	%rax, %r8
	testq	%rax, %rax
	jne	.L467
	jmp	.L439
	.p2align 4,,10
	.p2align 3
.L455:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC65(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L439
.L652:
	movq	(%r15), %rcx
	call	get_full_path
	movq	%rbx, %rdx
	leaq	.LC54(%rip), %rcx
	movq	%rax, %r8
	call	parser_error
	jmp	.L427
.L509:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$5, %ecx
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movq	%r10, 128(%rsp)
	call	create_statement
	movq	64(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	128(%rsp), %r10
	jmp	.L507
.L465:
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$5, %ecx
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%r12, %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L463
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
	.def	make_method_name;	.scl	2;	.type	32;	.endef
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
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
