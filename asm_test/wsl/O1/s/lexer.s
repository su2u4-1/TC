	.file	"lexer.c"
	.text
	.type	get_current_char, @function
get_current_char:
.LFB68:
	.cfi_startproc
	movq	8(%rdi), %rax
	movl	$0, %edx
	cmpq	16(%rdi), %rax
	jnb	.L1
	addq	$1, 32(%rdi)
	movq	(%rdi), %rdx
	leaq	1(%rax), %rcx
	movq	%rcx, 8(%rdi)
	movzbl	(%rdx,%rax), %edx
.L1:
	movl	%edx, %eax
	ret
	.cfi_endproc
.LFE68:
	.size	get_current_char, .-get_current_char
	.type	create_token, @function
create_token:
.LFB66:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	%edi, %r13d
	movq	%rsi, %r12
	movq	%rdx, %rbp
	movq	%rcx, %rbx
	movl	$32, %edi
	call	alloc_memory@PLT
	movl	%r13d, 24(%rax)
	movq	%r12, (%rax)
	movq	%rbp, 8(%rax)
	movq	%rbx, 16(%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE66:
	.size	create_token, .-create_token
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Lexer Error at Line %zu, Column %zu: %s\n"
	.text
	.type	lexer_error, @function
lexer_error:
.LFB67:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rdi, %r9
	leaq	1(%rsi), %rcx
	leaq	1(%rdx), %r8
	leaq	.LC0(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE67:
	.size	lexer_error, .-lexer_error
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Unterminated string literal"
.LC2:
	.string	"src/lexer.c"
.LC3:
	.string	"c != '\\0'"
.LC4:
	.string	"Unterminated comment"
.LC5:
	.string	"Unexpected character"
	.text
	.type	next_token, @function
next_token:
.LFB72:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movq	%rdi, %rbx
	movl	%esi, %ebp
	call	get_current_char
	cmpb	$32, %al
	ja	.L9
	movzbl	%al, %edx
	leaq	.L11(%rip), %rcx
	movslq	(%rcx,%rdx,4), %rdx
	addq	%rcx, %rdx
	notrack jmp	*%rdx
	.section	.rodata
	.align 4
	.align 4
.L11:
	.long	.L13-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L10-.L11
	.long	.L12-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L10-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L10-.L11
	.text
.L13:
	movq	32(%rbx), %rcx
	movq	24(%rbx), %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	create_token
.L8:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L10:
	.cfi_restore_state
	movsbl	%bpl, %esi
	movq	%rbx, %rdi
	call	next_token
	jmp	.L8
.L12:
	addq	$1, 24(%rbx)
	movq	$0, 32(%rbx)
	movsbl	%bpl, %esi
	movq	%rbx, %rdi
	call	next_token
	jmp	.L8
.L9:
	cmpb	$57, %al
	jg	.L15
	cmpb	$47, %al
	jg	.L16
	cmpb	$34, %al
	jne	.L103
	movq	8(%rbx), %r12
	movq	32(%rbx), %rax
	leaq	-1(%rax), %r14
	movq	%rbx, %rdi
	call	get_current_char
	movl	%eax, %ebp
	cmpb	$34, %al
	ja	.L31
	movabsq	$17179870209, %rax
	btq	%rbp, %rax
	jc	.L32
.L31:
	movabsq	$17179870209, %r13
.L96:
	movq	%rbx, %rdi
	call	get_current_char
	movl	%eax, %ebp
	cmpb	$34, %al
	ja	.L96
	btq	%rbp, %r13
	jnc	.L96
.L32:
	cmpb	$34, %bpl
	je	.L34
	leaq	-1(%r12), %rdx
	movq	24(%rbx), %rsi
	leaq	.LC1(%rip), %rdi
	call	lexer_error
	cmpb	$10, %bpl
	je	.L104
.L35:
	movq	24(%rbx), %rbp
	movq	%r12, %rsi
	notq	%rsi
	addq	8(%rbx), %rsi
	movq	%r12, %rdi
	addq	(%rbx), %rdi
	call	create_string@PLT
	movq	%rax, %rsi
	movq	%r14, %rcx
	movq	%rbp, %rdx
	movl	$4, %edi
	call	create_token
	jmp	.L8
.L15:
	leal	-65(%rax), %edx
	cmpb	$57, %dl
	ja	.L20
	movabsq	$288230372997595135, %rcx
	btq	%rdx, %rcx
	jnc	.L20
	movq	8(%rbx), %r14
	leaq	-1(%r14), %r13
	movq	32(%rbx), %rcx
	leaq	-1(%rcx), %r12
	movabsq	$288230372997595135, %rbp
	jmp	.L22
.L105:
	cmpb	$47, %al
	jle	.L25
.L24:
	movq	%rbx, %rdi
	call	get_current_char
.L22:
	cmpb	$57, %al
	jle	.L105
	subl	$65, %eax
	cmpb	$57, %al
	ja	.L25
	btq	%rax, %rbp
	jc	.L24
.L25:
	movq	8(%rbx), %rsi
	leaq	-1(%rsi), %rax
	movq	%rax, 8(%rbx)
	subq	$1, 32(%rbx)
	subq	%r14, %rsi
	movq	%r13, %rdi
	addq	(%rbx), %rdi
	call	create_string@PLT
	movq	%rax, %rbp
	movq	%rax, %rdi
	call	is_keyword@PLT
	testb	%al, %al
	je	.L27
	movq	24(%rbx), %rdx
	movq	%r12, %rcx
	movq	%rbp, %rsi
	movl	$6, %edi
	call	create_token
	jmp	.L8
.L27:
	movq	24(%rbx), %rdx
	movq	%r12, %rcx
	movq	%rbp, %rsi
	movl	$1, %edi
	call	create_token
	jmp	.L8
.L16:
	movq	8(%rbx), %r13
	leaq	-1(%r13), %r12
	movq	32(%rbx), %rax
	leaq	-1(%rax), %rbp
.L28:
	movq	%rbx, %rdi
	call	get_current_char
	leal	-48(%rax), %edx
	cmpb	$9, %dl
	jbe	.L28
	movq	8(%rbx), %rdx
	movl	$2, %r14d
	cmpq	16(%rbx), %rdx
	jnb	.L29
	cmpb	$46, %al
	je	.L106
.L29:
	movq	8(%rbx), %rsi
	leaq	-1(%rsi), %rax
	movq	%rax, 8(%rbx)
	subq	$1, 32(%rbx)
	movq	24(%rbx), %r15
	subq	%r13, %rsi
	movq	%r12, %rdi
	addq	(%rbx), %rdi
	call	create_string@PLT
	movq	%rax, %rsi
	movq	%rbp, %rcx
	movq	%r15, %rdx
	movl	%r14d, %edi
	call	create_token
	jmp	.L8
.L106:
	movq	(%rbx), %rax
	movzbl	(%rax,%rdx), %eax
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L29
	movq	%rbx, %rdi
	call	get_current_char
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L89
.L30:
	movq	%rbx, %rdi
	call	get_current_char
	subl	$48, %eax
	cmpb	$9, %al
	jbe	.L30
	movl	$3, %r14d
	jmp	.L29
.L89:
	movl	$3, %r14d
	jmp	.L29
.L104:
	addq	$1, 24(%rbx)
	movq	$0, 32(%rbx)
	jmp	.L35
.L34:
	movq	24(%rbx), %rbp
	movq	%r12, %rsi
	notq	%rsi
	addq	8(%rbx), %rsi
	movq	%r12, %rdi
	addq	(%rbx), %rdi
	call	create_string@PLT
	movq	%rax, %rsi
	movq	%r14, %rcx
	movq	%rbp, %rdx
	movl	$4, %edi
	call	create_token
	jmp	.L8
.L103:
	movq	8(%rbx), %r13
	movq	16(%rbx), %r12
	cmpq	%r12, %r13
	jnb	.L36
	movq	(%rbx), %r14
	movzbl	(%r14,%r13), %edx
	cmpb	$47, %al
	sete	%cl
	cmpb	$47, %dl
	jne	.L37
	testb	%cl, %cl
	je	.L37
	movq	32(%rbx), %r12
.L38:
	movq	%rbx, %rdi
	call	get_current_char
	cmpb	$10, %al
	je	.L91
	testb	%al, %al
	jne	.L38
.L91:
	movq	8(%rbx), %rax
	leaq	-1(%rax), %rsi
	movq	%rsi, 8(%rbx)
	subq	$1, 32(%rbx)
	testb	%bpl, %bpl
	je	.L40
	movsbl	%bpl, %esi
	movq	%rbx, %rdi
	call	next_token
	jmp	.L8
.L40:
	addq	$1, %r13
	movq	24(%rbx), %rbx
	subq	%r13, %rsi
	leaq	(%r14,%r13), %rdi
	call	create_string@PLT
	movq	%rax, %rsi
	leaq	-1(%r12), %rcx
	movq	%rbx, %rdx
	movl	$7, %edi
	call	create_token
	jmp	.L8
.L46:
	movq	%rbx, %rdi
	call	get_current_char
	movq	8(%rbx), %rdx
	cmpq	%r12, %rdx
	jnb	.L43
	movq	(%rbx), %rcx
	movzbl	(%rcx,%rdx), %edx
	cmpb	$10, %al
	je	.L80
.L44:
	testb	%dl, %dl
	je	.L45
	testb	%al, %al
	je	.L107
.L42:
	cmpb	$42, %al
	jne	.L46
	cmpb	$47, %dl
	jne	.L46
	movq	%rbx, %rdi
	call	get_current_char
	testb	%bpl, %bpl
	jne	.L83
	movq	24(%rbx), %rbp
	movq	8(%rbx), %rax
	leaq	-2(%rax), %rsi
	subq	%r13, %rsi
	movq	%r13, %rdi
	addq	(%rbx), %rdi
	call	create_string@PLT
	movq	%rax, %rsi
	movq	%r15, %rcx
	movq	%rbp, %rdx
	movl	$7, %edi
	call	create_token
	jmp	.L8
.L107:
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$125, %edx
	leaq	.LC2(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	__assert_fail@PLT
.L108:
	subq	$1, 8(%rbx)
	subq	$1, 32(%rbx)
	jmp	.L82
.L48:
	movq	24(%rbx), %rbp
	movq	8(%rbx), %rsi
	subq	%r13, %rsi
	movq	%r13, %rdi
	addq	(%rbx), %rdi
	call	create_string@PLT
	movq	%rax, %rsi
	movq	%r15, %rcx
	movq	%rbp, %rdx
	movl	$7, %edi
	call	create_token
	jmp	.L8
.L83:
	movsbl	%bpl, %esi
	movq	%rbx, %rdi
	call	next_token
	jmp	.L8
.L110:
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	leaq	-2(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	EQ_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L111:
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	leaq	-2(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	NE_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L112:
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	leaq	-2(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	LE_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L113:
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	leaq	-2(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	GE_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L114:
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	leaq	-2(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	ADD_ASSIGN_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L115:
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	leaq	-2(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	SUB_ASSIGN_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L116:
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	leaq	-2(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	MUL_ASSIGN_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L117:
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	leaq	-2(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	DIV_ASSIGN_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L118:
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	leaq	-2(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	MOD_ASSIGN_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L119:
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	leaq	-2(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	AND_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L120:
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	leaq	-2(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	OR_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L77:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L76:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L63:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L61:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	R_BRACE_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L73:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	COMMA_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L79:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	NOT_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L71:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	DOT_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L65:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	L_BRACKET_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L64:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	R_BRACKET_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L69:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L74:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	ADD_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L72:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	SUB_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L75:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	MUL_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L70:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	DIV_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L78:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	MOD_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L68:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	LT_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L66:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	GT_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L67:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	24(%rbx), %rdx
	movq	ASSIGN_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L60:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %rdx
	movq	24(%rbx), %rsi
	leaq	.LC5(%rip), %rdi
	call	lexer_error
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_token
	jmp	.L8
.L43:
	cmpb	$10, %al
	jne	.L45
	movl	%r14d, %edx
.L80:
	addq	$1, 24(%rbx)
	movq	$0, 32(%rbx)
	jmp	.L44
.L45:
	testb	%al, %al
	je	.L108
.L82:
	movq	24(%rbx), %rsi
	movq	%r13, %rdx
	leaq	.LC4(%rip), %rdi
	call	lexer_error
	testb	%bpl, %bpl
	je	.L48
	movsbl	%bpl, %esi
	movq	%rbx, %rdi
	call	next_token
	jmp	.L8
.L109:
	movq	(%rbx), %rdx
	movzbl	(%rdx,%r13), %edx
	cmpb	$47, %al
	sete	%cl
.L37:
	cmpb	$42, %dl
	jne	.L41
	testb	%cl, %cl
	je	.L41
	addq	$1, %r13
	movq	32(%rbx), %rax
	leaq	-1(%rax), %r15
	movl	$47, %eax
	movl	$0, %r14d
	jmp	.L42
.L20:
	movq	8(%rbx), %r13
	movq	16(%rbx), %r12
	cmpq	%r12, %r13
	jb	.L109
.L36:
	cmpb	$47, %al
	sete	%cl
	movl	$0, %edx
.L41:
	cmpb	$61, %dl
	sete	%sil
	cmpb	$61, %al
	jne	.L49
	testb	%sil, %sil
	jne	.L110
.L49:
	cmpb	$33, %al
	jne	.L50
	testb	%sil, %sil
	jne	.L111
.L50:
	cmpb	$60, %al
	jne	.L51
	testb	%sil, %sil
	jne	.L112
.L51:
	cmpb	$62, %al
	jne	.L52
	testb	%sil, %sil
	jne	.L113
.L52:
	cmpb	$43, %al
	jne	.L53
	testb	%sil, %sil
	jne	.L114
.L53:
	cmpb	$45, %al
	jne	.L54
	testb	%sil, %sil
	jne	.L115
.L54:
	cmpb	$42, %al
	jne	.L55
	testb	%sil, %sil
	jne	.L116
.L55:
	testb	%sil, %sil
	je	.L56
	testb	%cl, %cl
	jne	.L117
.L56:
	cmpb	$37, %al
	jne	.L57
	testb	%sil, %sil
	jne	.L118
.L57:
	cmpb	$38, %al
	jne	.L58
	cmpb	$38, %dl
	je	.L119
.L58:
	cmpb	$124, %al
	jne	.L59
	cmpb	$124, %dl
	je	.L120
.L59:
	subl	$33, %eax
	cmpb	$92, %al
	ja	.L60
	movzbl	%al, %eax
	leaq	.L62(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L62:
	.long	.L79-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L78-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L77-.L62
	.long	.L76-.L62
	.long	.L75-.L62
	.long	.L74-.L62
	.long	.L73-.L62
	.long	.L72-.L62
	.long	.L71-.L62
	.long	.L70-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L69-.L62
	.long	.L68-.L62
	.long	.L67-.L62
	.long	.L66-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L65-.L62
	.long	.L60-.L62
	.long	.L64-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L63-.L62
	.long	.L60-.L62
	.long	.L61-.L62
	.text
	.cfi_endproc
.LFE72:
	.size	next_token, .-next_token
	.globl	create_lexer
	.type	create_lexer, @function
create_lexer:
.LFB65:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	movl	$80, %edi
	call	alloc_memory@PLT
	movq	%rbp, (%rax)
	movq	$0, 8(%rax)
	movq	%rbx, 16(%rax)
	movq	$0, 24(%rax)
	movq	$0, 32(%rax)
	movq	$0, 40(%rax)
	movq	$0, 48(%rax)
	movq	$0, 56(%rax)
	movq	$0, 64(%rax)
	movq	$0, 72(%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE65:
	.size	create_lexer, .-create_lexer
	.globl	get_next_token
	.type	get_next_token, @function
get_next_token:
.LFB73:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	40(%rdi), %rax
	testq	%rax, %rax
	je	.L124
	movq	%rax, 72(%rdi)
	movq	48(%rdi), %rdx
	movq	%rdx, 8(%rdi)
	movq	56(%rdi), %rdx
	movq	%rdx, 24(%rdi)
	movq	64(%rdi), %rdx
	movq	%rdx, 32(%rdi)
	movq	$0, 40(%rdi)
.L123:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L124:
	.cfi_restore_state
	movsbl	%sil, %esi
	call	next_token
	movq	%rax, 72(%rbx)
	jmp	.L123
	.cfi_endproc
.LFE73:
	.size	get_next_token, .-get_next_token
	.globl	peek_next_token
	.type	peek_next_token, @function
peek_next_token:
.LFB74:
	.cfi_startproc
	endbr64
	movq	40(%rdi), %rax
	testq	%rax, %rax
	je	.L133
	ret
.L133:
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	%rdi, %rbx
	movq	8(%rdi), %r13
	movq	24(%rdi), %r12
	movq	32(%rdi), %rbp
	movsbl	%sil, %esi
	call	get_next_token
	movq	8(%rbx), %rdx
	movq	%rdx, 48(%rbx)
	movq	24(%rbx), %rdx
	movq	%rdx, 56(%rbx)
	movq	32(%rbx), %rdx
	movq	%rdx, 64(%rbx)
	movq	%r13, 8(%rbx)
	movq	%r12, 24(%rbx)
	movq	%rbp, 32(%rbx)
	movq	%rax, 40(%rbx)
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE74:
	.size	peek_next_token, .-peek_next_token
	.globl	peek_current_token
	.type	peek_current_token, @function
peek_current_token:
.LFB75:
	.cfi_startproc
	endbr64
	movq	72(%rdi), %rax
	ret
	.cfi_endproc
.LFE75:
	.size	peek_current_token, .-peek_current_token
	.globl	reset_lexer
	.type	reset_lexer, @function
reset_lexer:
.LFB76:
	.cfi_startproc
	endbr64
	movq	$0, 8(%rdi)
	movq	$0, 24(%rdi)
	movq	$0, 32(%rdi)
	movq	$0, 40(%rdi)
	movq	$0, 48(%rdi)
	movq	$0, 56(%rdi)
	movq	$0, 64(%rdi)
	movq	$0, 72(%rdi)
	ret
	.cfi_endproc
.LFE76:
	.size	reset_lexer, .-reset_lexer
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 11
__PRETTY_FUNCTION__.0:
	.string	"next_token"
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
