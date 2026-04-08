	.file	"parser.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Failed to parse expression primary"
	.align 8
.LC1:
	.string	"Failed to parse parenthesized expression"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"Expected ')' after expression"
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"Failed to parse operand of unary '!'"
	.align 8
.LC4:
	.string	"Failed to parse operand of unary '-'"
	.align 8
.LC5:
	.string	"Expected variable name in variable access"
	.align 8
.LC6:
	.string	"Cannot call undefined variable"
	.align 8
.LC7:
	.string	"Cannot call non-function variable"
	.align 8
.LC8:
	.string	"Failed to parse function call argument"
	.align 8
.LC9:
	.string	"Expected ',' or ')' after function call argument"
	.align 8
.LC10:
	.string	"Failed to parse sequence index"
	.align 8
.LC11:
	.string	"Expected ']' after sequence index"
	.align 8
.LC12:
	.string	"Cannot access attribute without a valid scope"
	.align 8
.LC13:
	.string	"Expected attribute name after '.'"
	.section	.rodata.str1.1
.LC14:
	.string	"Unknown attribute name"
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	"Failed to parse variable access"
	.align 8
.LC16:
	.string	"Unexpected token in primary expression"
	.text
	.p2align 4
	.type	parse_primary, @function
parse_primary:
	pushq	%r15
	pushq	%r14
	movq	%rsi, %r14
	pushq	%r13
	pushq	%r12
	movq	%rdx, %r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	subq	$40, %rsp
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %r13
	movl	24(%rax), %eax
	cmpl	$2, %eax
	je	.L129
	cmpl	$3, %eax
	je	.L130
	cmpl	$4, %eax
	je	.L131
	cmpl	$6, %eax
	je	.L132
.L6:
	cmpl	$5, %eax
	je	.L10
	cmpl	$1, %eax
	je	.L12
.L13:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r13, %rsi
	leaq	.LC16(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L20:
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
.L130:
	movq	0(%r13), %rsi
	xorl	%r15d, %r15d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$1, %ebx
.L3:
	addq	$40, %rsp
	movq	%r15, %r8
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
.L129:
	movq	0(%r13), %rsi
	xorl	%r15d, %r15d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%ebx, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L131:
	movq	0(%r13), %rsi
	xorl	%r15d, %r15d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$2, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L132:
	movq	0(%r13), %rdi
	movq	TRUE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L133
	movl	24(%r13), %eax
	cmpl	$6, %eax
	jne	.L6
	movq	0(%r13), %rdi
	movq	FALSE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L9
	movl	24(%r13), %eax
	cmpl	$5, %eax
	jne	.L23
	.p2align 4,,10
	.p2align 3
.L10:
	movq	0(%r13), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L134
	movl	24(%r13), %eax
	cmpl	$5, %eax
	jne	.L23
	movq	0(%r13), %rdi
	movq	NOT_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L135
	movl	24(%r13), %eax
	cmpl	$5, %eax
	jne	.L23
	movq	0(%r13), %rdi
	movq	SUB_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L24
	movl	24(%r13), %eax
.L23:
	cmpl	$1, %eax
	je	.L12
	cmpl	$6, %eax
	jne	.L13
	movq	0(%r13), %rdi
	movq	SELF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L13
	cmpb	$0, 9(%r12)
	je	.L13
.L12:
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L27
	cmpl	$6, %eax
	jne	.L30
	movq	0(%rbp), %rdi
	movq	SELF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L30
.L27:
	movq	0(%rbp), %rsi
	movq	%r14, %rdi
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
	movq	%rax, %r15
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rdx
	jne	.L31
	movq	$0, (%rsp)
	xorl	%ebp, %ebp
.L61:
	movq	8(%rsp), %rax
	testq	%rax, %rax
	je	.L32
	movq	(%rax), %rbp
	testq	%rbp, %rbp
	cmove	%rax, %rbp
.L32:
	cmpq	$0, (%rsp)
	jne	.L33
	testq	%rbp, %rbp
	je	.L33
	movl	32(%rbp), %esi
	movq	$0, (%rsp)
	testl	%esi, %esi
	jne	.L33
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, (%rsp)
.L33:
	movq	(%rdx), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movq	%rdx, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %rdx
	testb	%al, %al
	jne	.L136
	movq	(%rdx), %rdi
	movq	L_BRACKET_SYMBOL(%rip), %rsi
	movq	%rdx, 16(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	16(%rsp), %rdx
	testb	%al, %al
	je	.L50
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%r12, %rdx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movq	%rax, 24(%rsp)
	call	parse_primary
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L137
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%r12, %r8
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	parse_expr_prec
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	je	.L52
.L53:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rcx
	jne	.L55
	movq	(%rax), %rdi
	movq	R_BRACKET_SYMBOL(%rip), %rsi
	movq	%rax, 24(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	24(%rsp), %rcx
	testb	%al, %al
	je	.L55
	movq	%r15, %rsi
	movq	16(%rsp), %rcx
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$3, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %r15
.L49:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rdx
	je	.L61
.L31:
	testq	%r15, %r15
	je	.L29
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$8, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L50:
	movq	(%rdx), %rdi
	movq	DOT_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L31
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpq	$0, (%rsp)
	je	.L138
	cmpl	$1, 24(%rax)
	jne	.L139
	movq	(%rax), %rsi
	movq	(%rsp), %rdi
	movq	%rax, 16(%rsp)
	call	*search_name@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L140
.L58:
	movq	%r15, %rsi
	movq	8(%rsp), %rdx
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movl	$2, %edi
	xorl	%ebp, %ebp
	call	*create_variable_access@GOTPCREL(%rip)
	movq	$0, (%rsp)
	movq	%rax, %r15
	jmp	.L49
	.p2align 4,,10
	.p2align 3
.L136:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpq	$0, 8(%rsp)
	movq	%rax, %rbp
	je	.L141
	movq	8(%rsp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	je	.L142
.L37:
	subl	$1, %eax
	cmpl	$1, %eax
	ja	.L143
.L36:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, (%rsp)
	.p2align 4,,10
	.p2align 3
.L40:
	cmpl	$5, 24(%rbp)
	je	.L144
.L48:
	movq	%r12, %rdx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	parse_primary
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L145
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%r12, %r8
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	parse_expr_prec
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L42
.L43:
	movq	(%rsp), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	je	.L44
.L47:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC9(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L29:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r13, %rsi
	leaq	.LC15(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L144:
	movq	0(%rbp), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L48
	xorl	%ecx, %ecx
	movq	%r15, %rsi
	movq	(%rsp), %r8
	xorl	%edx, %edx
	movl	$1, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %r15
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %ecx
	movq	%rax, 8(%rsp)
	testl	%ecx, %ecx
	jne	.L65
	movq	24(%rax), %rax
	xorl	%ebp, %ebp
	movq	16(%rax), %rax
	movq	%rax, (%rsp)
	jmp	.L49
	.p2align 4,,10
	.p2align 3
.L44:
	movq	(%rax), %rdi
	movq	COMMA_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L146
	cmpl	$5, 24(%rbp)
	jne	.L47
	movq	0(%rbp), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L40
	jmp	.L47
	.p2align 4,,10
	.p2align 3
.L145:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, 16(%rsp)
	call	*peek_current_token@GOTPCREL(%rip)
	movq	16(%rsp), %rdx
	leaq	.LC0(%rip), %rdi
	movq	%rax, %rsi
	call	*parser_error@GOTPCREL(%rip)
.L42:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC8(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	xorl	%esi, %esi
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L146:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L40
	.p2align 4,,10
	.p2align 3
.L140:
	testq	%rbp, %rbp
	movq	16(%rsp), %rcx
	je	.L59
	movl	32(%rbp), %edx
	testl	%edx, %edx
	je	.L126
	movq	0(%rbp), %rbp
	testq	%rbp, %rbp
	je	.L59
	movl	32(%rbp), %eax
	testl	%eax, %eax
	je	.L126
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L59:
	movq	(%rcx), %rsi
	movq	%rcx, 16(%rsp)
	movq	%rbp, %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movq	%rax, %rsi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	testq	%rax, %rax
	movq	%rax, 8(%rsp)
	jne	.L58
	movq	(%r12), %rdi
	movq	%rcx, (%rsp)
	call	*get_full_path@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC14(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L133:
	movq	0(%r13), %rsi
	xorl	%r15d, %r15d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$3, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L9:
	movq	0(%r13), %rsi
	xorl	%r15d, %r15d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$4, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L143:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC7(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L142:
	movq	8(%rsp), %rax
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi
	movq	8(%rax), %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	8(%rsp), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rdi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	%r15, %rsi
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movq	%rax, 8(%rsp)
	movq	%rax, %rdx
	movl	$2, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %r15
	movq	8(%rsp), %rax
	testq	%rax, %rax
	je	.L36
	movl	32(%rax), %eax
	jmp	.L37
	.p2align 4,,10
	.p2align 3
.L30:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC5(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L126:
	movq	8(%rbp), %rbp
	jmp	.L59
.L137:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, 16(%rsp)
	call	*peek_current_token@GOTPCREL(%rip)
	movq	16(%rsp), %rdx
	leaq	.LC0(%rip), %rdi
	movq	%rax, %rsi
	call	*parser_error@GOTPCREL(%rip)
.L52:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	24(%rsp), %rsi
	leaq	.LC10(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	$0, 16(%rsp)
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L134:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%r12, %rdx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	parse_primary
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L147
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	%r12, %r8
	movq	%r14, %rcx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	parse_expr_prec
	testq	%rax, %rax
	je	.L16
	movq	%rbx, %rdi
	movq	%rax, (%rsp)
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	(%rsp), %rdx
	movl	24(%rax), %ebx
	movq	%rax, %rbp
	cmpl	$5, %ebx
	jne	.L21
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	%rdx, (%rsp)
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L21
	movq	(%rsp), %rdx
	xorl	%r15d, %r15d
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L135:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%r12, %rdx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	parse_primary
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L148
	xorl	%r15d, %r15d
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$6, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L24:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%r12, %rdx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	parse_primary
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L149
	xorl	%r15d, %r15d
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$7, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L141:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC6(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L36
.L21:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC2(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L20
.L65:
	movq	$0, (%rsp)
	xorl	%ebp, %ebp
	jmp	.L49
.L55:
	movq	(%r12), %rdi
	movq	%rcx, (%rsp)
	call	*get_full_path@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC11(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L29
.L138:
	movq	(%r12), %rdi
	movq	%rax, (%rsp)
	call	*get_full_path@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC12(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L29
.L139:
	movq	(%r12), %rdi
	movq	%rax, (%rsp)
	call	*get_full_path@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC13(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L29
.L147:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, %r13
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%r13, %rdx
	leaq	.LC0(%rip), %rdi
	movq	%rax, %rsi
	call	*parser_error@GOTPCREL(%rip)
.L16:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC1(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L20
.L149:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC4(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L20
.L148:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	.LC3(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L20
	.size	parse_primary, .-parse_primary
	.section	.rodata.str1.1
.LC17:
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
	jne	.L160
.L158:
	movq	(%rax), %rdi
	call	*string_to_operator@GOTPCREL(%rip)
	movl	%eax, %r12d
	movl	%eax, %edi
	call	*operator_precedence@GOTPCREL(%rip)
	movl	%eax, %ebp
	cmpl	$19, %r12d
	je	.L160
	movl	28(%rsp), %eax
	cmpl	%eax, %ebp
	jl	.L160
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
	je	.L165
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rax, %r13
.L164:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	jne	.L154
	movq	(%rax), %rdi
	call	*string_to_operator@GOTPCREL(%rip)
	movl	%eax, %r14d
	movl	%eax, %edi
	call	*operator_precedence@GOTPCREL(%rip)
	cmpl	$19, %r14d
	je	.L154
	cmpl	%eax, %ebp
	jge	.L154
	movq	16(%rsp), %rcx
	movq	%r13, %rsi
	movq	%r15, %r8
	movl	%eax, %edx
	movq	%rbx, %rdi
	call	parse_expr_prec
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L164
	xorl	%r14d, %r14d
	jmp	.L150
	.p2align 4,,10
	.p2align 3
.L154:
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
	je	.L158
.L160:
	movq	8(%rsp), %r14
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
.L150:
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
.L165:
	movq	(%r15), %rdi
	xorl	%r14d, %r14d
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r13, %rsi
	leaq	.LC17(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L150
	.size	parse_expr_prec, .-parse_expr_prec
	.section	.rodata.str1.1
.LC18:
	.string	"Expected variable type"
	.section	.rodata.str1.8
	.align 8
.LC19:
	.string	"Expected a type for variable declaration"
	.section	.rodata.str1.1
.LC20:
	.string	"Unknown variable type"
.LC21:
	.string	"Expected variable name"
	.section	.rodata.str1.8
	.align 8
.LC22:
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
	je	.L167
	cmpl	$6, %eax
	jne	.L170
	movq	(%rbx), %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	testb	%al, %al
	je	.L170
.L167:
	movq	(%rbx), %rsi
	movq	%r14, %rdi
	call	*search_name@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L171
	movl	32(%rax), %eax
	cmpl	$6, %eax
	je	.L172
	testl	%eax, %eax
	jne	.L200
.L172:
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L201
	cmpb	$0, 10(%r12)
	movl	$3, %esi
	je	.L174
.L203:
	cmpb	$1, 9(%r12)
	sbbl	%esi, %esi
	andl	$2, %esi
	addl	$3, %esi
.L174:
	movq	(%rbx), %rdi
	movq	%r14, %rcx
	movq	%r13, %rdx
	call	*create_symbol@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	je	.L202
.L176:
	xorl	%edx, %edx
.L180:
	addq	$8, %rsp
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
.L201:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC21(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	cmpb	$0, 10(%r12)
	movl	$3, %esi
	je	.L174
	jmp	.L203
	.p2align 4,,10
	.p2align 3
.L170:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC18(%rip), %rdi
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
.L200:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC19(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L172
	.p2align 4,,10
	.p2align 3
.L202:
	movq	(%rax), %rdi
	movq	ASSIGN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L176
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%r12, %rdx
	movq	%r14, %rsi
	movq	%rbp, %rdi
	movq	%rax, %r15
	call	parse_primary
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L204
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	%r12, %r8
	movq	%r14, %rcx
	movq	%rax, %rsi
	movq	%rbp, %rdi
	call	parse_expr_prec
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L180
.L179:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r15, %rsi
	leaq	.LC22(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L176
	.p2align 4,,10
	.p2align 3
.L171:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC20(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L172
.L204:
	movq	(%r12), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbp, %rdi
	movq	%rax, %r14
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%r14, %rdx
	leaq	.LC0(%rip), %rdi
	movq	%rax, %rsi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L179
	.size	parse_variable, .-parse_variable
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
	je	.L397
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_primary
	testq	%rax, %rax
	je	.L398
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rbp, %r8
	movq	%r13, %rcx
	xorl	%edx, %edx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	parse_expr_prec
	movq	%rax, %r8
.L307:
	xorl	%r9d, %r9d
.L395:
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %r12
.L293:
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%r12, %r12
	je	.L399
.L308:
	movq	%rbx, %rdi
	movl	$1, %esi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L309
.L311:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC52(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L205:
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
.L309:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L311
	jmp	.L205
	.p2align 4,,10
	.p2align 3
.L397:
	movq	(%rax), %rdi
	movq	IF_KEYWORD(%rip), %rsi
	movq	%rax, %r12
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L400
	movq	(%r12), %rdi
	movq	FOR_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L401
	movq	(%r12), %rdi
	movq	WHILE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L402
	movq	(%r12), %rdi
	movq	VAR_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L403
	movq	(%r12), %rdi
	movq	RETURN_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L294
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	je	.L404
.L295:
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_primary
	testq	%rax, %rax
	je	.L405
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rbp, %r8
	movq	%r13, %rcx
	xorl	%edx, %edx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	parse_expr_prec
	movq	%rax, %r8
.L297:
	xorl	%r9d, %r9d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$5, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L293
	.p2align 4,,10
	.p2align 3
.L401:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L245
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
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
	call	parse_variable
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L406
.L248:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
.L250:
	cmpl	$5, 24(%r12)
	jne	.L253
	movq	(%r12), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L253
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	je	.L254
.L257:
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_primary
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L407
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rbp, %r8
	movq	%r13, %rcx
	xorl	%edx, %edx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	parse_expr_prec
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L259
.L260:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
.L258:
	cmpl	$5, 24(%r12)
	jne	.L262
	movq	(%r12), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L262
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	je	.L263
.L266:
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_primary
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L408
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rbp, %r8
	movq	%r13, %rcx
	xorl	%edx, %edx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	parse_expr_prec
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	je	.L268
.L269:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
.L267:
	cmpl	$5, 24(%r12)
	jne	.L271
	movq	(%r12), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L271
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L273
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L273
	call	*create_list@GOTPCREL(%rip)
	movb	$1, 11(%rbp)
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%rax, %r15
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L274
	.p2align 4,,10
	.p2align 3
.L275:
	movq	%rcx, %rsi
	movq	%r15, %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
.L274:
	cmpl	$5, 24(%r12)
	jne	.L276
	movq	(%r12), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L409
.L276:
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L275
	movq	0(%rbp), %rdi
	movq	%rax, 24(%rsp)
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC43(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	24(%rsp), %rcx
	jmp	.L275
	.p2align 4,,10
	.p2align 3
.L399:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r13, %rsi
	leaq	.LC51(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L308
	.p2align 4,,10
	.p2align 3
.L400:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L210
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L210
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	%rax, %r12
	call	parse_primary
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L410
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rbp, %r8
	movq	%r13, %rcx
	xorl	%edx, %edx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	parse_expr_prec
	movq	%rax, 32(%rsp)
	testq	%rax, %rax
	je	.L212
.L213:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L215
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L215
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L217
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L217
	call	*create_list@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	leaq	.LC27(%rip), %r14
	movq	%rax, 8(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L218
	.p2align 4,,10
	.p2align 3
.L219:
	movq	8(%rsp), %rdi
	movq	%r15, %rsi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
.L218:
	cmpl	$5, 24(%r12)
	jne	.L220
	movq	(%r12), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L411
.L220:
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L219
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	movq	%r14, %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L219
	.p2align 4,,10
	.p2align 3
.L210:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC23(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L209:
	xorl	%esi, %esi
.L222:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$2, %edi
.L396:
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
.L398:
	movq	0(%rbp), %rdi
	movq	%rax, 8(%rsp)
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, %r12
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%r12, %rdx
	leaq	.LC0(%rip), %rdi
	movq	%rax, %rsi
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %r8
	jmp	.L307
	.p2align 4,,10
	.p2align 3
.L402:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L280
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L280
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	%rax, %r12
	call	parse_primary
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L412
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rbp, %r8
	movq	%r13, %rcx
	xorl	%edx, %edx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	parse_expr_prec
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L282
.L283:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L286
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L286
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L288
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L288
	call	*create_list@GOTPCREL(%rip)
	movb	$1, 11(%rbp)
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%rax, %r14
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L289
	.p2align 4,,10
	.p2align 3
.L290:
	movq	%rcx, %rsi
	movq	%r14, %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
.L289:
	cmpl	$5, 24(%r12)
	jne	.L291
	movq	(%r12), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L413
.L291:
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L290
	movq	0(%rbp), %rdi
	movq	%rax, 8(%rsp)
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC48(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %rcx
	jmp	.L290
	.p2align 4,,10
	.p2align 3
.L403:
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
	jmp	.L293
	.p2align 4,,10
	.p2align 3
.L215:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC25(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L209
	.p2align 4,,10
	.p2align 3
.L245:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC35(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L244:
	xorl	%ecx, %ecx
.L252:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$4, %edi
	jmp	.L396
	.p2align 4,,10
	.p2align 3
.L280:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC44(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L279:
	xorl	%edx, %edx
.L285:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$3, %edi
	jmp	.L396
.L410:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, %r14
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%r14, %rdx
	leaq	.LC0(%rip), %rdi
	movq	%rax, %rsi
	call	*parser_error@GOTPCREL(%rip)
.L212:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC24(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	$0, 32(%rsp)
	jmp	.L213
	.p2align 4,,10
	.p2align 3
.L294:
	movq	(%r12), %rdi
	movq	BREAK_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L298
	cmpb	$0, 11(%rbp)
	je	.L414
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$6, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L293
	.p2align 4,,10
	.p2align 3
.L253:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC37(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L244
.L217:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC26(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L209
.L411:
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 24(%rsp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L394:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	cmpl	$6, 24(%rax)
	movq	%rax, %r12
	jne	.L235
	movq	(%rax), %rdi
	movq	ELIF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L415
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L224
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L224
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	%rax, %r12
	call	parse_primary
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L416
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rbp, %r8
	movq	%r13, %rcx
	xorl	%edx, %edx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	parse_expr_prec
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	je	.L226
.L227:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L229
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L229
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L231
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L231
	call	*create_list@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%rax, %r14
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L232
	.p2align 4,,10
	.p2align 3
.L233:
	movq	%r15, %rsi
	movq	%r14, %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
.L232:
	cmpl	$5, 24(%r12)
	jne	.L234
	movq	(%r12), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L417
.L234:
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L233
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC32(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L233
	.p2align 4,,10
	.p2align 3
.L417:
	movq	16(%rsp), %rdi
	movq	%r14, %rsi
	call	*create_else_if@GOTPCREL(%rip)
	movq	24(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L394
.L416:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, %r14
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%r14, %rdx
	leaq	.LC0(%rip), %rdi
	movq	%rax, %rsi
	call	*parser_error@GOTPCREL(%rip)
.L226:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC29(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	$0, 16(%rsp)
	jmp	.L227
.L246:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	xorl	%r14d, %r14d
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L250
	jmp	.L249
.L286:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC46(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L279
.L262:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC39(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L244
.L404:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L295
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$5, %edi
	jmp	.L396
.L298:
	movq	(%r12), %rdi
	movq	CONTINUE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L301
	cmpb	$0, 11(%rbp)
	je	.L418
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$7, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L293
.L254:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L257
	movq	$0, 8(%rsp)
	jmp	.L258
.L288:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC47(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L279
.L413:
	movb	$0, 11(%rbp)
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	*create_while@GOTPCREL(%rip)
	movq	%rax, %rdx
	jmp	.L285
.L406:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC36(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L248
.L271:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC41(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L244
.L412:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, %r14
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%r14, %rdx
	leaq	.LC0(%rip), %rdi
	movq	%rax, %rsi
	call	*parser_error@GOTPCREL(%rip)
.L282:
	movq	0(%rbp), %rdi
	xorl	%r15d, %r15d
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC45(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L283
.L224:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC28(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L209
.L235:
	movq	%rbx, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movq	40(%rsp), %rcx
	movq	24(%rsp), %rdx
	movq	32(%rsp), %rdi
	call	*create_if@GOTPCREL(%rip)
	movq	%rax, %rsi
	jmp	.L222
.L229:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC30(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L209
.L231:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC31(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L209
.L263:
	movq	(%rax), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L266
	movq	$0, 16(%rsp)
	jmp	.L267
.L414:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC49(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L300:
	xorl	%r12d, %r12d
	jmp	.L205
.L407:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, %r15
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%r15, %rdx
	leaq	.LC0(%rip), %rdi
	movq	%rax, %rsi
	call	*parser_error@GOTPCREL(%rip)
.L259:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC38(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	$0, 8(%rsp)
	jmp	.L260
.L301:
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_primary
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L419
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	xorl	%esi, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rbp, %r8
	movq	%r13, %rcx
	xorl	%edx, %edx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	parse_expr_prec
	movq	%rax, %r12
.L305:
	xorl	%r9d, %r9d
	movq	%r12, %r8
	jmp	.L395
.L409:
	movq	%r15, %rcx
	movb	$0, 11(%rbp)
	movq	16(%rsp), %rdx
	movq	%r14, %rdi
	movq	8(%rsp), %rsi
	call	*create_for@GOTPCREL(%rip)
	movq	%rax, %rcx
	jmp	.L252
.L273:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC42(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L244
.L415:
	cmpl	$6, 24(%r12)
	jne	.L235
	movq	(%r12), %rdi
	movq	ELSE_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L235
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %r12
	jne	.L238
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L238
	movl	$1, %esi
	movq	%rbx, %rdi
	leaq	.LC34(%rip), %r15
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L239
	.p2align 4,,10
	.p2align 3
.L240:
	movq	40(%rsp), %rdi
	movq	%r14, %rsi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%rbx, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
.L239:
	cmpl	$5, 24(%r12)
	jne	.L241
	movq	(%r12), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L235
.L241:
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L240
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	movq	%r15, %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L240
.L405:
	movq	0(%rbp), %rdi
	movq	%rax, 8(%rsp)
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, %r12
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%r12, %rdx
	leaq	.LC0(%rip), %rdi
	movq	%rax, %rsi
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %r8
	jmp	.L297
.L408:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, %r15
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%r15, %rdx
	leaq	.LC0(%rip), %rdi
	movq	%rax, %rsi
	call	*parser_error@GOTPCREL(%rip)
.L268:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC40(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	$0, 16(%rsp)
	jmp	.L269
.L418:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC50(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L300
.L419:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, %r13
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%r13, %rdx
	leaq	.LC0(%rip), %rdi
	movq	%rax, %rsi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L305
.L238:
	movq	0(%rbp), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC33(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L209
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
	je	.L622
.L421:
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
	jne	.L423
	jmp	.L539
	.p2align 4,,10
	.p2align 3
.L468:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC92(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L435:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	.L539
.L423:
	movl	24(%rax), %eax
	testl	%eax, %eax
	je	.L539
	cmpl	$6, %eax
	jne	.L468
	movq	(%rsp), %rax
	movq	IMPORT_KEYWORD(%rip), %rsi
	movq	(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %ebp
	testb	%al, %al
	jne	.L623
	movq	(%rsp), %rax
	cmpl	$6, 24(%rax)
	jne	.L468
	movq	(%rax), %rdi
	movq	FUNC_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L624
	movq	(%rsp), %rax
	cmpl	$6, 24(%rax)
	jne	.L468
	movq	(%rax), %rdi
	movq	CLASS_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L468
	movq	16(%rsp), %rdi
	call	*create_symbol_table@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r15, %rdi
	movq	%rax, 32(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L625
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
	jne	.L472
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L472
	call	*create_list@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r15, %rdi
	movq	%rax, 48(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	movq	$0, 72(%rsp)
	movq	%rax, %r10
	jmp	.L473
	.p2align 4,,10
	.p2align 3
.L525:
	cmpl	$6, %eax
	je	.L626
.L474:
	movq	0(%r13), %rdi
	movq	%r10, 8(%rsp)
	call	*get_full_path@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC88(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L522:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r10
.L473:
	movl	24(%r10), %eax
	cmpl	$5, %eax
	jne	.L525
	movq	(%r10), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	movq	%r10, 8(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	testb	%al, %al
	jne	.L526
	movl	24(%r10), %eax
	cmpl	$6, %eax
	jne	.L474
.L626:
	movq	(%r10), %rdi
	movq	METHOD_KEYWORD(%rip), %rsi
	movq	%r10, 8(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	testb	%al, %al
	jne	.L627
	cmpl	$6, 24(%r10)
	jne	.L474
	movq	(%r10), %rdi
	movq	VAR_KEYWORD(%rip), %rsi
	movq	%r10, 8(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	testb	%al, %al
	je	.L474
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
	je	.L628
.L513:
	movq	%rbp, %rdx
	xorl	%esi, %esi
	movl	$1, %edi
	call	*create_class_member@GOTPCREL(%rip)
	movq	48(%rsp), %rdi
	movq	%rax, %rbp
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	cmpl	$1, 8(%rbp)
	je	.L629
.L517:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L521
.L523:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC87(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L522
	.p2align 4,,10
	.p2align 3
.L539:
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
.L623:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L630
	movq	(%rax), %rbp
	movl	$1, %esi
	movq	%r15, %rdi
	xorl	%ebx, %ebx
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
	movl	24(%rax), %eax
	cmpl	$6, %eax
	je	.L631
.L428:
	cmpl	$5, %eax
	jne	.L432
	movq	(%r12), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L432
	movq	%rbp, %rdi
	movq	0(%r13), %rcx
	movq	16(%rsp), %rdx
	movq	%rbx, %rsi
	call	*parse_import_file@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L632
.L433:
	movq	%rbx, %rsi
	call	*create_import@GOTPCREL(%rip)
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L427
.L434:
	xorl	%edi, %edi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	call	*create_code_member@GOTPCREL(%rip)
	movq	24(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L435
	.p2align 4,,10
	.p2align 3
.L624:
	movq	16(%rsp), %rdi
	call	*create_symbol_table@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r15, %rdi
	movq	%rax, %r12
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L437
	cmpl	$6, %eax
	jne	.L440
	movq	(%rbx), %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	testb	%al, %al
	je	.L440
.L437:
	movq	(%rbx), %rsi
	movq	16(%rsp), %rdi
	call	*search_name@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L633
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$1, 24(%rax)
	movq	%rax, %rbx
	jne	.L634
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
	jne	.L444
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L444
	movl	$1, %esi
	movq	%r15, %rdi
	leaq	.LC63(%rip), %r14
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L445:
	cmpl	$5, 24(%rbx)
	je	.L635
.L453:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	parse_variable
	testq	%rax, %rax
	je	.L636
	cmpq	$0, 16(%rax)
	je	.L448
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	movq	%r14, %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L447:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	je	.L449
.L452:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC64(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L439:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC69(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	xorl	%edx, %edx
.L467:
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	movl	$1, %edi
	call	*create_code_member@GOTPCREL(%rip)
	movq	24(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L435
	.p2align 4,,10
	.p2align 3
.L472:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC71(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L470:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC91(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	xorl	%ecx, %ecx
.L538:
	xorl	%esi, %esi
	xorl	%edx, %edx
	movl	$2, %edi
	call	*create_code_member@GOTPCREL(%rip)
	movq	24(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L435
	.p2align 4,,10
	.p2align 3
.L627:
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
	je	.L476
	cmpl	$6, %eax
	jne	.L479
	movq	%r10, 8(%rsp)
	movq	(%r12), %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	testb	%al, %al
	je	.L479
.L476:
	movq	(%r12), %rsi
	movq	32(%rsp), %rdi
	movq	%r10, 8(%rsp)
	call	*search_name@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, 56(%rsp)
	je	.L637
	movq	%r10, 8(%rsp)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	cmpl	$1, 24(%rax)
	movq	%rax, %r12
	jne	.L638
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
	jne	.L483
	movq	(%rax), %rdi
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movq	%r10, 8(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	testb	%al, %al
	je	.L483
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	cmpl	$6, 24(%rax)
	movq	%rax, %r12
	je	.L484
.L486:
	movq	%r10, 8(%rsp)
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC76(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %r10
.L485:
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
.L487:
	cmpl	$5, 24(%rbx)
	je	.L639
.L617:
	movq	%rbp, %r10
.L491:
	movq	%r10, 8(%rsp)
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC77(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	jmp	.L478
	.p2align 4,,10
	.p2align 3
.L526:
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
	je	.L640
.L527:
	movq	56(%rsp), %rax
	movq	%r10, 8(%rsp)
	cmpl	$2, 32(%rax)
	jne	.L641
.L528:
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
.L530:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L642
	movq	8(%rbx), %rax
	movq	SELF_KEYWORD(%rip), %rsi
	movq	8(%rax), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L530
	movq	8(%rbx), %rsi
	movq	(%rbx), %rdi
	xorl	%edx, %edx
	call	*create_variable@GOTPCREL(%rip)
	movq	%r14, %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L530
	.p2align 4,,10
	.p2align 3
.L642:
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
.L621:
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
	jmp	.L533
	.p2align 4,,10
	.p2align 3
.L535:
	cmpl	$1, 8(%r9)
	je	.L643
.L533:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r9
	testq	%rax, %rax
	jne	.L535
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
	jmp	.L536
	.p2align 4,,10
	.p2align 3
.L537:
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
.L536:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L537
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
	jne	.L538
	jmp	.L470
	.p2align 4,,10
	.p2align 3
.L643:
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
	je	.L644
.L534:
	xorl	%edx, %edx
	movq	%r10, %rsi
	movl	$13, %edi
	jmp	.L621
	.p2align 4,,10
	.p2align 3
.L521:
	movq	(%rax), %rdi
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L523
	jmp	.L522
	.p2align 4,,10
	.p2align 3
.L629:
	movq	0(%rbp), %rax
	movq	(%rax), %rax
	cmpq	name_int(%rip), %rax
	je	.L620
	cmpq	name_float(%rip), %rax
	je	.L620
	cmpq	name_string(%rip), %rax
	je	.L620
	cmpq	name_bool(%rip), %rax
	je	.L518
	cmpq	name_void(%rip), %rax
	je	.L518
	movl	32(%rax), %eax
	testl	%eax, %eax
	je	.L620
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC86(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L517
	.p2align 4,,10
	.p2align 3
.L620:
	addq	$8, 72(%rsp)
	jmp	.L517
	.p2align 4,,10
	.p2align 3
.L625:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC70(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L470
	.p2align 4,,10
	.p2align 3
.L630:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC53(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L427:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	leaq	.LC57(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	xorl	%esi, %esi
	jmp	.L434
	.p2align 4,,10
	.p2align 3
.L641:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC89(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L528
	.p2align 4,,10
	.p2align 3
.L432:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC55(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L427
	.p2align 4,,10
	.p2align 3
.L444:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC61(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L439
	.p2align 4,,10
	.p2align 3
.L483:
	movq	%r10, 8(%rsp)
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC75(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %r10
.L478:
	movq	%r10, 8(%rsp)
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	.LC84(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	xorl	%esi, %esi
.L511:
	xorl	%edi, %edi
	xorl	%edx, %edx
	call	*create_class_member@GOTPCREL(%rip)
	movq	48(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L522
	.p2align 4,,10
	.p2align 3
.L635:
	movq	(%rbx), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L453
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L455
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L455
	call	*create_list@GOTPCREL(%rip)
	movb	$1, 8(%r13)
	movl	$1, %esi
	movq	%r15, %rdi
	movq	%rax, 56(%rsp)
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L456
	.p2align 4,,10
	.p2align 3
.L459:
	cmpl	$5, 8(%r14)
	movl	$1, %eax
	cmove	%eax, %ebp
.L460:
	movq	56(%rsp), %rdi
	movq	%r14, %rsi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
.L456:
	cmpl	$5, 24(%rbx)
	jne	.L461
	movq	(%rbx), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L645
.L461:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L646
	testb	%bpl, %bpl
	je	.L459
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC67(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L459
	.p2align 4,,10
	.p2align 3
.L448:
	movq	32(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L447
	.p2align 4,,10
	.p2align 3
.L449:
	movq	(%rax), %rdi
	movq	COMMA_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L647
	cmpl	$5, 24(%rbx)
	jne	.L452
	movq	(%rbx), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L445
	jmp	.L452
	.p2align 4,,10
	.p2align 3
.L639:
	movq	(%rbx), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L648
	cmpl	$5, 24(%rbx)
	jne	.L617
	movq	(%rbx), %rdi
	movq	COMMA_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L649
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movq	%r13, %rdx
	movq	%r15, %rdi
	movq	%rax, %rbx
	call	parse_variable
	testq	%rax, %rax
	je	.L650
	cmpq	$0, 16(%rax)
	je	.L497
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	movq	%r12, %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
.L496:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L487
	.p2align 4,,10
	.p2align 3
.L497:
	movq	80(%rsp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L496
	.p2align 4,,10
	.p2align 3
.L636:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC62(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L447
	.p2align 4,,10
	.p2align 3
.L650:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	movq	%r14, %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L496
	.p2align 4,,10
	.p2align 3
.L622:
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
	jmp	.L421
	.p2align 4,,10
	.p2align 3
.L440:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC58(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L439
	.p2align 4,,10
	.p2align 3
.L479:
	movq	%r10, 8(%rsp)
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC72(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	jmp	.L478
	.p2align 4,,10
	.p2align 3
.L628:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC85(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L513
	.p2align 4,,10
	.p2align 3
.L647:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L445
.L634:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC60(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L439
.L638:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC74(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	jmp	.L478
.L631:
	movq	(%r12), %rdi
	movq	FROM_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L429
.L619:
	movl	24(%r12), %eax
	jmp	.L428
.L649:
	cmpl	$5, 24(%rbx)
	movq	%rbp, %r10
	movq	8(%rsp), %rbp
	jne	.L491
	movq	(%rbx), %rdi
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movq	%r10, 8(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	testb	%al, %al
	je	.L491
.L499:
	movq	%r10, 8(%rsp)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	cmpl	$5, 24(%rax)
	movq	%rax, %rbx
	jne	.L494
	movq	(%rax), %rdi
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movq	%r10, 8(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	testb	%al, %al
	je	.L494
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
	jmp	.L500
	.p2align 4,,10
	.p2align 3
.L503:
	cmpl	$5, 8(%r14)
	movl	$1, %eax
	cmove	%eax, %r12d
.L504:
	movq	8(%rsp), %rdi
	movq	%r14, %rsi
	call	*list_append@GOTPCREL(%rip)
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
.L500:
	cmpl	$5, 24(%rbx)
	jne	.L505
	movq	(%rbx), %rdi
	movq	R_BRACE_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L651
.L505:
	movq	%r13, %rdx
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L652
	testb	%r12b, %r12b
	je	.L503
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC67(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L503
.L640:
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
	jmp	.L527
.L494:
	movq	%r10, 8(%rsp)
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC80(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	jmp	.L478
.L518:
	addq	$1, 72(%rsp)
	jmp	.L517
	.p2align 4,,10
	.p2align 3
.L652:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC82(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L504
.L644:
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
	jmp	.L534
.L484:
	movq	(%rax), %rdi
	movq	SELF_KEYWORD(%rip), %rsi
	movq	%r10, 8(%rsp)
	call	*string_equal@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	testb	%al, %al
	je	.L486
	jmp	.L485
.L651:
	xorl	%edx, %edx
	movq	104(%rsp), %r10
	movw	%dx, 8(%r13)
	testb	%r12b, %r12b
	jne	.L507
	movq	56(%rsp), %rax
	cmpq	name_void(%rip), %rax
	je	.L509
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
	je	.L509
.L507:
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
	jne	.L511
	jmp	.L478
	.p2align 4,,10
	.p2align 3
.L632:
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
	jmp	.L433
.L633:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC59(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L439
.L637:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	.LC73(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %r10
	jmp	.L478
.L429:
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	cmpl	$4, 24(%rax)
	movq	%rax, %rbx
	jne	.L653
	movq	(%rax), %rbx
	movl	$1, %esi
	movq	%r15, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L619
.L646:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC66(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L460
.L648:
	movq	%rbp, %r10
	movq	8(%rsp), %rbp
	jmp	.L499
.L645:
	movb	$0, 8(%r13)
	testb	%bpl, %bpl
	jne	.L463
	movq	8(%rsp), %rax
	cmpq	name_void(%rip), %rax
	je	.L465
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC68(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	movq	8(%rsp), %rax
	cmpq	name_void(%rip), %rax
	je	.L465
.L463:
	movq	8(%rsp), %rdx
	movq	56(%rsp), %r8
	movq	%r12, %r9
	movq	32(%rsp), %rcx
	movq	48(%rsp), %rsi
	movq	40(%rsp), %rdi
	call	*create_function_use_ptr@GOTPCREL(%rip)
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L467
	jmp	.L439
	.p2align 4,,10
	.p2align 3
.L455:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC65(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L439
.L653:
	movq	0(%r13), %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rbx, %rsi
	leaq	.LC54(%rip), %rdi
	movq	%rax, %rdx
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L427
.L509:
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
	jmp	.L507
.L465:
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
	jmp	.L463
	.size	parse_code, .-parse_code
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
