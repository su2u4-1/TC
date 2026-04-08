	.file	"lexer.c"
	.text
	.type	get_current_char, @function
get_current_char:
	movq	16(%rdi), %rax
	movl	$0, %edx
	cmpq	24(%rdi), %rax
	jnb	.L1
	addq	$1, 40(%rdi)
	movq	8(%rdi), %rdx
	leaq	1(%rax), %rcx
	movq	%rcx, 16(%rdi)
	movzbl	(%rdx,%rax), %edx
.L1:
	movl	%edx, %eax
	ret
	.size	get_current_char, .-get_current_char
	.type	create_token, @function
create_token:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movl	%edi, %r13d
	movq	%rsi, %r12
	movq	%rdx, %rbp
	movq	%rcx, %rbx
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%r13d, 24(%rax)
	movq	%r12, (%rax)
	movq	%rbp, 8(%rax)
	movq	%rbx, 16(%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	create_token, .-create_token
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"[Lexer Error] at %s:%zu:%zu: %s\n"
	.text
	.type	lexer_error, @function
lexer_error:
	subq	$16, %rsp
	pushq	%rdi
	leaq	1(%rdx), %r9
	leaq	1(%rsi), %r8
	leaq	.LC0(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	addq	$24, %rsp
	ret
	.size	lexer_error, .-lexer_error
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Unterminated string literal"
	.section	.rodata
.LC2:
	.string	""
	.string	""
	.section	.rodata.str1.1
.LC3:
	.string	"src/lexer.c"
.LC4:
	.string	"c != '\\0'"
.LC5:
	.string	"Unterminated comment"
.LC6:
	.string	"Unexpected character"
	.text
	.type	next_token, @function
next_token:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbx
	movl	%esi, %ebp
	call	get_current_char
	cmpb	$32, %al
	ja	.L9
	movzbl	%al, %edx
	leaq	.L11(%rip), %rcx
	movslq	(%rcx,%rdx,4), %rdx
	addq	%rcx, %rdx
	jmp	*%rdx
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
	movq	40(%rbx), %rcx
	movq	32(%rbx), %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	create_token
.L8:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L10:
	movsbl	%bpl, %esi
	movq	%rbx, %rdi
	call	next_token
	jmp	.L8
.L12:
	addq	$1, 32(%rbx)
	movq	$0, 40(%rbx)
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
	movq	16(%rbx), %r12
	movq	40(%rbx), %rax
	leaq	-1(%rax), %r13
	movq	%rbx, %rdi
	call	get_current_char
	movl	%eax, %ebp
	cmpb	$34, %al
	ja	.L31
	movabsq	$17179870209, %rax
	btq	%rbp, %rax
	jc	.L32
.L31:
	movabsq	$17179870209, %r14
.L96:
	movq	%rbx, %rdi
	call	get_current_char
	movl	%eax, %ebp
	cmpb	$34, %al
	ja	.L96
	btq	%rbp, %r14
	jnc	.L96
.L32:
	cmpb	$34, %bpl
	jne	.L104
.L34:
	movq	16(%rbx), %rsi
	subq	%r12, %rsi
	cmpq	$1, %rsi
	je	.L105
	movq	32(%rbx), %rbp
	subq	$1, %rsi
	movq	%r12, %rdi
	addq	8(%rbx), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%r13, %rcx
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
	movq	16(%rbx), %r14
	leaq	-1(%r14), %r13
	movq	40(%rbx), %rcx
	leaq	-1(%rcx), %r12
	movabsq	$288230372997595135, %rbp
	jmp	.L22
.L106:
	cmpb	$47, %al
	jle	.L25
.L24:
	movq	%rbx, %rdi
	call	get_current_char
.L22:
	cmpb	$57, %al
	jle	.L106
	subl	$65, %eax
	cmpb	$57, %al
	ja	.L25
	btq	%rax, %rbp
	jc	.L24
.L25:
	movq	16(%rbx), %rsi
	leaq	-1(%rsi), %rax
	movq	%rax, 16(%rbx)
	subq	$1, 40(%rbx)
	subq	%r14, %rsi
	movq	%r13, %rdi
	addq	8(%rbx), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%rax, %rdi
	call	*is_keyword@GOTPCREL(%rip)
	testb	%al, %al
	je	.L27
	movq	32(%rbx), %rdx
	movq	%r12, %rcx
	movq	%rbp, %rsi
	movl	$6, %edi
	call	create_token
	jmp	.L8
.L27:
	movq	32(%rbx), %rdx
	movq	%r12, %rcx
	movq	%rbp, %rsi
	movl	$1, %edi
	call	create_token
	jmp	.L8
.L16:
	movq	16(%rbx), %r13
	leaq	-1(%r13), %r12
	movq	40(%rbx), %rax
	leaq	-1(%rax), %rbp
.L28:
	movq	%rbx, %rdi
	call	get_current_char
	leal	-48(%rax), %edx
	cmpb	$9, %dl
	jbe	.L28
	movq	16(%rbx), %rdx
	movl	$2, %r14d
	cmpq	24(%rbx), %rdx
	jnb	.L29
	cmpb	$46, %al
	je	.L107
.L29:
	movq	16(%rbx), %rsi
	leaq	-1(%rsi), %rax
	movq	%rax, 16(%rbx)
	subq	$1, 40(%rbx)
	movq	32(%rbx), %r15
	subq	%r13, %rsi
	movq	%r12, %rdi
	addq	8(%rbx), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbp, %rcx
	movq	%r15, %rdx
	movl	%r14d, %edi
	call	create_token
	jmp	.L8
.L107:
	movq	8(%rbx), %rax
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
	movq	(%rbx), %rcx
	leaq	-1(%r12), %rdx
	movq	32(%rbx), %rsi
	leaq	.LC1(%rip), %rdi
	call	lexer_error
	cmpb	$10, %bpl
	jne	.L34
	addq	$1, 32(%rbx)
	movq	$0, 40(%rbx)
	jmp	.L34
.L105:
	movq	32(%rbx), %rbx
	leaq	.LC2(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%r13, %rcx
	movq	%rbx, %rdx
	movl	$4, %edi
	call	create_token
	jmp	.L8
.L103:
	movq	16(%rbx), %r13
	movq	24(%rbx), %r12
	cmpq	%r12, %r13
	jnb	.L36
	movq	8(%rbx), %r14
	movzbl	(%r14,%r13), %edx
	cmpb	$47, %al
	sete	%cl
	cmpb	$47, %dl
	jne	.L37
	testb	%cl, %cl
	je	.L37
	movq	40(%rbx), %r12
.L38:
	movq	%rbx, %rdi
	call	get_current_char
	cmpb	$10, %al
	je	.L91
	testb	%al, %al
	jne	.L38
.L91:
	movq	16(%rbx), %rax
	leaq	-1(%rax), %rsi
	movq	%rsi, 16(%rbx)
	subq	$1, 40(%rbx)
	testb	%bpl, %bpl
	je	.L40
	movsbl	%bpl, %esi
	movq	%rbx, %rdi
	call	next_token
	jmp	.L8
.L40:
	addq	$1, %r13
	movq	32(%rbx), %rbx
	subq	%r13, %rsi
	leaq	(%r14,%r13), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rsi
	leaq	-1(%r12), %rcx
	movq	%rbx, %rdx
	movl	$7, %edi
	call	create_token
	jmp	.L8
.L46:
	movq	%rbx, %rdi
	call	get_current_char
	movq	16(%rbx), %rdx
	cmpq	%r12, %rdx
	jnb	.L43
	movq	8(%rbx), %rcx
	movzbl	(%rcx,%rdx), %edx
	cmpb	$10, %al
	je	.L80
.L44:
	testb	%dl, %dl
	je	.L45
	testb	%al, %al
	je	.L108
.L42:
	cmpb	$42, %al
	jne	.L46
	cmpb	$47, %dl
	jne	.L46
	movq	%rbx, %rdi
	call	get_current_char
	testb	%bpl, %bpl
	jne	.L83
	movq	32(%rbx), %rbp
	movq	16(%rbx), %rax
	leaq	-2(%rax), %rsi
	subq	%r13, %rsi
	movq	%r13, %rdi
	addq	8(%rbx), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%r15, %rcx
	movq	%rbp, %rdx
	movl	$7, %edi
	call	create_token
	jmp	.L8
.L108:
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$127, %edx
	leaq	.LC3(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	call	*__assert_fail@GOTPCREL(%rip)
.L109:
	subq	$1, 16(%rbx)
	subq	$1, 40(%rbx)
	jmp	.L82
.L48:
	movq	32(%rbx), %rbp
	movq	16(%rbx), %rsi
	subq	%r13, %rsi
	movq	%r13, %rdi
	addq	8(%rbx), %rdi
	call	*create_string@GOTPCREL(%rip)
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
.L111:
	movq	%rbx, %rdi
	call	get_current_char
	movq	40(%rbx), %rax
	leaq	-2(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	EQ_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L112:
	movq	%rbx, %rdi
	call	get_current_char
	movq	40(%rbx), %rax
	leaq	-2(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	NE_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L113:
	movq	%rbx, %rdi
	call	get_current_char
	movq	40(%rbx), %rax
	leaq	-2(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	LE_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L114:
	movq	%rbx, %rdi
	call	get_current_char
	movq	40(%rbx), %rax
	leaq	-2(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	GE_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L115:
	movq	%rbx, %rdi
	call	get_current_char
	movq	40(%rbx), %rax
	leaq	-2(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	ADD_ASSIGN_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L116:
	movq	%rbx, %rdi
	call	get_current_char
	movq	40(%rbx), %rax
	leaq	-2(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	SUB_ASSIGN_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L117:
	movq	%rbx, %rdi
	call	get_current_char
	movq	40(%rbx), %rax
	leaq	-2(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	MUL_ASSIGN_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L118:
	movq	%rbx, %rdi
	call	get_current_char
	movq	40(%rbx), %rax
	leaq	-2(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	DIV_ASSIGN_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L119:
	movq	%rbx, %rdi
	call	get_current_char
	movq	40(%rbx), %rax
	leaq	-2(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	MOD_ASSIGN_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L120:
	movq	%rbx, %rdi
	call	get_current_char
	movq	40(%rbx), %rax
	leaq	-2(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	AND_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L121:
	movq	%rbx, %rdi
	call	get_current_char
	movq	40(%rbx), %rax
	leaq	-2(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	OR_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L77:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	L_PAREN_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L76:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	R_PAREN_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L63:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	L_BRACE_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L61:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	R_BRACE_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L73:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	COMMA_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L79:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	NOT_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L71:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	DOT_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L65:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	L_BRACKET_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L64:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	R_BRACKET_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L69:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L74:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	ADD_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L72:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	SUB_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L75:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	MUL_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L70:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	DIV_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L78:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	MOD_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L68:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	LT_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L66:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	GT_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L67:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %rcx
	movq	32(%rbx), %rdx
	movq	ASSIGN_SYMBOL(%rip), %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L8
.L60:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %rdx
	movq	32(%rbx), %rsi
	movq	(%rbx), %rcx
	leaq	.LC6(%rip), %rdi
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
	addq	$1, 32(%rbx)
	movq	$0, 40(%rbx)
	jmp	.L44
.L45:
	testb	%al, %al
	je	.L109
.L82:
	movq	(%rbx), %rcx
	movq	32(%rbx), %rsi
	movq	%r13, %rdx
	leaq	.LC5(%rip), %rdi
	call	lexer_error
	testb	%bpl, %bpl
	je	.L48
	movsbl	%bpl, %esi
	movq	%rbx, %rdi
	call	next_token
	jmp	.L8
.L110:
	movq	8(%rbx), %rdx
	movzbl	(%rdx,%r13), %edx
	cmpb	$47, %al
	sete	%cl
.L37:
	cmpb	$42, %dl
	jne	.L41
	testb	%cl, %cl
	je	.L41
	addq	$1, %r13
	movq	40(%rbx), %rax
	leaq	-1(%rax), %r15
	movl	$47, %eax
	movl	$0, %r14d
	jmp	.L42
.L20:
	movq	16(%rbx), %r13
	movq	24(%rbx), %r12
	cmpq	%r12, %r13
	jb	.L110
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
	jne	.L111
.L49:
	cmpb	$33, %al
	jne	.L50
	testb	%sil, %sil
	jne	.L112
.L50:
	cmpb	$60, %al
	jne	.L51
	testb	%sil, %sil
	jne	.L113
.L51:
	cmpb	$62, %al
	jne	.L52
	testb	%sil, %sil
	jne	.L114
.L52:
	cmpb	$43, %al
	jne	.L53
	testb	%sil, %sil
	jne	.L115
.L53:
	cmpb	$45, %al
	jne	.L54
	testb	%sil, %sil
	jne	.L116
.L54:
	cmpb	$42, %al
	jne	.L55
	testb	%sil, %sil
	jne	.L117
.L55:
	testb	%sil, %sil
	je	.L56
	testb	%cl, %cl
	jne	.L118
.L56:
	cmpb	$37, %al
	jne	.L57
	testb	%sil, %sil
	jne	.L119
.L57:
	cmpb	$38, %al
	jne	.L58
	cmpb	$38, %dl
	je	.L120
.L58:
	cmpb	$124, %al
	jne	.L59
	cmpb	$124, %dl
	je	.L121
.L59:
	subl	$33, %eax
	cmpb	$92, %al
	ja	.L60
	movzbl	%al, %eax
	leaq	.L62(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
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
	.size	next_token, .-next_token
	.globl	create_lexer
	.type	create_lexer, @function
create_lexer:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %r12
	movq	%rsi, %rbp
	movq	%rdx, %rbx
	movl	$88, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r12, 8(%rax)
	movq	$0, 16(%rax)
	movq	%rbp, 24(%rax)
	movq	$0, 32(%rax)
	movq	$0, 40(%rax)
	movq	$0, 48(%rax)
	movq	$0, 56(%rax)
	movq	$0, 64(%rax)
	movq	$0, 72(%rax)
	movq	$0, 80(%rax)
	movq	%rbx, (%rax)
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	create_lexer, .-create_lexer
	.globl	get_next_token
	.type	get_next_token, @function
get_next_token:
	pushq	%rbx
	movq	%rdi, %rbx
	movq	48(%rdi), %rax
	testq	%rax, %rax
	je	.L125
	movq	%rax, 80(%rdi)
	movq	56(%rdi), %rdx
	movq	%rdx, 16(%rdi)
	movq	64(%rdi), %rdx
	movq	%rdx, 32(%rdi)
	movq	72(%rdi), %rdx
	movq	%rdx, 40(%rdi)
	movq	$0, 48(%rdi)
.L124:
	popq	%rbx
	ret
.L125:
	movsbl	%sil, %esi
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L124
	.size	get_next_token, .-get_next_token
	.globl	peek_next_token
	.type	peek_next_token, @function
peek_next_token:
	movq	48(%rdi), %rax
	testq	%rax, %rax
	je	.L134
	ret
.L134:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbx
	movq	16(%rdi), %r13
	movq	32(%rdi), %r12
	movq	40(%rdi), %rbp
	movsbl	%sil, %esi
	call	get_next_token
	movq	16(%rbx), %rdx
	movq	%rdx, 56(%rbx)
	movq	32(%rbx), %rdx
	movq	%rdx, 64(%rbx)
	movq	40(%rbx), %rdx
	movq	%rdx, 72(%rbx)
	movq	%r13, 16(%rbx)
	movq	%r12, 32(%rbx)
	movq	%rbp, 40(%rbx)
	movq	%rax, 48(%rbx)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	peek_next_token, .-peek_next_token
	.globl	peek_current_token
	.type	peek_current_token, @function
peek_current_token:
	movq	80(%rdi), %rax
	ret
	.size	peek_current_token, .-peek_current_token
	.globl	reset_lexer
	.type	reset_lexer, @function
reset_lexer:
	movq	$0, 16(%rdi)
	movq	$0, 32(%rdi)
	movq	$0, 40(%rdi)
	movq	$0, 48(%rdi)
	movq	$0, 56(%rdi)
	movq	$0, 64(%rdi)
	movq	$0, 72(%rdi)
	movq	$0, 80(%rdi)
	ret
	.size	reset_lexer, .-reset_lexer
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 11
__PRETTY_FUNCTION__.0:
	.string	"next_token"
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
