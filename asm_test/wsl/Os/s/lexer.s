	.file	"lexer.c"
	.text
	.type	get_current_char, @function
get_current_char:
	movq	16(%rdi), %rax
	xorl	%edx, %edx
	cmpq	24(%rdi), %rax
	jnb	.L1
	movq	8(%rdi), %rdx
	leaq	1(%rax), %rcx
	incq	40(%rdi)
	movq	%rcx, 16(%rdi)
	movb	(%rdx,%rax), %dl
.L1:
	movl	%edx, %eax
	ret
	.size	get_current_char, .-get_current_char
	.type	create_token, @function
create_token:
	pushq	%r13
	movl	%edi, %r13d
	movl	$32, %edi
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rbx
	movq	%rcx, %rbx
	pushq	%rax
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%r13d, 24(%rax)
	movq	%r12, (%rax)
	movq	%rbp, 8(%rax)
	movq	%rbx, 16(%rax)
	popq	%rdx
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	create_token, .-create_token
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"[Lexer Error] at %s:%zu:%zu: %s\n"
	.text
	.type	lexer_error, @function
lexer_error:
	subq	$16, %rsp
	leaq	1(%rdx), %r9
	leaq	1(%rsi), %r8
	xorl	%eax, %eax
	pushq	%rdi
	leaq	.LC0(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	addq	$24, %rsp
	ret
	.size	lexer_error, .-lexer_error
	.section	.rodata.str1.1
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
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	subq	$24, %rsp
	call	get_current_char
	testb	%al, %al
	jne	.L10
	movq	40(%rdi), %rcx
	movq	32(%rdi), %rdx
	jmp	.L186
.L10:
	movl	%eax, %edx
	movl	%esi, %r12d
	andl	$-5, %edx
	cmpb	$9, %dl
	je	.L187
	cmpb	$32, %al
	je	.L187
	cmpb	$10, %al
	jne	.L13
	incq	32(%rdi)
	xorl	%edi, %edi
	movq	%rdi, 40(%rbx)
.L187:
	addq	$24, %rsp
	movsbl	%r12b, %esi
	movq	%rbx, %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	next_token
.L13:
	movq	16(%rdi), %rbp
	cmpb	$57, %al
	jg	.L14
	cmpb	$47, %al
	jg	.L15
	cmpb	$34, %al
	jne	.L17
	movabsq	$-17179870210, %rsi
	movq	40(%rdi), %rax
	leaq	-1(%rax), %r13
	call	get_current_char
	movl	%eax, %r12d
	jmp	.L30
.L14:
	leal	-65(%rax), %edx
	cmpb	$57, %dl
	ja	.L17
	movabsq	$288230372997595135, %rsi
	btq	%rdx, %rsi
	jnc	.L17
	movq	40(%rbx), %rcx
	leaq	-1(%rbp), %r8
	leaq	-1(%rcx), %r12
.L20:
	cmpb	$57, %al
	jg	.L21
	cmpb	$47, %al
	jle	.L23
.L22:
	movq	%rbx, %rdi
	call	get_current_char
	jmp	.L20
.L21:
	subl	$65, %eax
	cmpb	$57, %al
	ja	.L23
	btq	%rax, %rsi
	jc	.L22
.L23:
	movq	16(%rbx), %rsi
	movq	8(%rbx), %rdi
	decq	40(%rbx)
	leaq	-1(%rsi), %rax
	addq	%r8, %rdi
	subq	%rbp, %rsi
	movq	%rax, 16(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rdi
	movq	%rax, 8(%rsp)
	call	*is_keyword@GOTPCREL(%rip)
	movq	32(%rbx), %rdx
	movq	8(%rsp), %rsi
	movq	%r12, %rcx
	testb	%al, %al
	movl	$6, %edi
	jne	.L188
	movl	$1, %edi
	jmp	.L188
.L15:
	movq	40(%rdi), %rax
	leaq	-1(%rbp), %r9
	leaq	-1(%rax), %r12
.L26:
	movq	%rbx, %rdi
	call	get_current_char
	leal	-48(%rax), %edx
	cmpb	$9, %dl
	jbe	.L26
	movq	16(%rbx), %rdx
	movq	8(%rbx), %r8
	movl	$2, %r13d
	cmpq	24(%rbx), %rdx
	jnb	.L27
	cmpb	$46, %al
	jne	.L27
	movb	(%r8,%rdx), %al
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L27
.L185:
	call	get_current_char
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L193
	movq	%rbx, %rdi
	jmp	.L185
.L193:
	movl	$3, %r13d
.L27:
	movq	16(%rbx), %rsi
	decq	40(%rbx)
	leaq	(%r8,%r9), %rdi
	leaq	-1(%rsi), %rax
	subq	%rbp, %rsi
	movq	%rax, 16(%rbx)
	movq	32(%rbx), %rbx
	call	*create_string@GOTPCREL(%rip)
	movq	%r12, %rcx
	movl	%r13d, %edi
	movq	%rax, %rsi
	movq	%rbx, %rdx
	jmp	.L188
.L195:
	btq	%r12, %rsi
	jnc	.L194
.L31:
	movq	%rbx, %rdi
	call	get_current_char
	movl	%eax, %r12d
.L30:
	cmpb	$34, %r12b
	ja	.L31
	jmp	.L195
.L194:
	movq	32(%rbx), %rsi
	cmpb	$34, %r12b
	je	.L33
	movq	(%rbx), %rcx
	leaq	-1(%rbp), %rdx
	leaq	.LC1(%rip), %rdi
	call	lexer_error
	cmpb	$10, %r12b
	jne	.L33
	xorl	%esi, %esi
	incq	32(%rbx)
	movq	%rsi, 40(%rbx)
.L33:
	movq	16(%rbx), %rsi
	movq	32(%rbx), %r12
	leaq	.LC2(%rip), %rdi
	subq	%rbp, %rsi
	cmpq	$1, %rsi
	je	.L190
	movq	8(%rbx), %rdi
	decq	%rsi
	addq	%rbp, %rdi
.L190:
	call	*create_string@GOTPCREL(%rip)
	movq	%r13, %rcx
	movq	%r12, %rdx
	movl	$4, %edi
	movq	%rax, %rsi
	jmp	.L188
.L17:
	movq	24(%rbx), %r8
	xorl	%ecx, %ecx
	cmpq	%r8, %rbp
	jnb	.L36
	movq	8(%rbx), %rdx
	movb	(%rdx,%rbp), %cl
.L36:
	cmpb	$47, %al
	sete	%sil
	cmpb	$47, %cl
	jne	.L37
	testb	%sil, %sil
	je	.L37
	movq	40(%rbx), %r13
.L38:
	movq	%rbx, %rdi
	call	get_current_char
	cmpb	$10, %al
	je	.L93
	testb	%al, %al
	jne	.L38
.L93:
	movq	16(%rbx), %rax
	decq	40(%rbx)
	leaq	-1(%rax), %rsi
	movq	%rsi, 16(%rbx)
	testb	%r12b, %r12b
	jne	.L187
	leaq	1(%rbp), %rdi
	movq	32(%rbx), %rbp
	subq	%rdi, %rsi
	addq	8(%rbx), %rdi
	call	*create_string@GOTPCREL(%rip)
	leaq	-1(%r13), %rcx
	movq	%rbp, %rdx
	movq	%rax, %rsi
	jmp	.L191
.L37:
	cmpb	$42, %cl
	jne	.L41
	testb	%sil, %sil
	je	.L41
	movq	40(%rbx), %rax
	incq	%rbp
	movb	$42, %dl
	leaq	-1(%rax), %r13
	movb	$47, %al
.L42:
	cmpb	$42, %al
	je	.L196
.L46:
	movq	%rbx, %rdi
	call	get_current_char
	movq	16(%rbx), %rdx
	cmpq	%r8, %rdx
	jnb	.L43
	movq	8(%rbx), %rcx
	movb	(%rcx,%rdx), %dl
	cmpb	$10, %al
	jne	.L44
	jmp	.L82
.L43:
	cmpb	$10, %al
	jne	.L45
	xorl	%edx, %edx
.L82:
	xorl	%ecx, %ecx
	incq	32(%rbx)
	movq	%rcx, 40(%rbx)
.L44:
	testb	%dl, %dl
	je	.L45
	testb	%al, %al
	jne	.L42
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$127, %edx
	leaq	.LC3(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	call	*__assert_fail@GOTPCREL(%rip)
.L196:
	cmpb	$47, %dl
	jne	.L46
	jmp	.L197
.L45:
	testb	%al, %al
	jne	.L86
	decq	16(%rbx)
	decq	40(%rbx)
.L86:
	movq	32(%rbx), %rsi
	movq	(%rbx), %rcx
	movq	%rbp, %rdx
	leaq	.LC5(%rip), %rdi
	call	lexer_error
	testb	%r12b, %r12b
	jne	.L187
	movq	32(%rbx), %r12
	movq	16(%rbx), %rsi
.L192:
	movq	8(%rbx), %rdi
	subq	%rbp, %rsi
	addq	%rbp, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%r13, %rcx
	movq	%r12, %rdx
	movq	%rax, %rsi
.L191:
	movl	$7, %edi
	jmp	.L188
.L41:
	cmpb	$61, %cl
	sete	%dl
	cmpb	$61, %al
	jne	.L49
	testb	%dl, %dl
	je	.L49
	movq	%rbx, %rdi
	call	get_current_char
	movq	40(%rbx), %rax
	movq	32(%rbx), %rdx
	movq	EQ_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L189
.L49:
	cmpb	$33, %al
	jne	.L50
	testb	%dl, %dl
	je	.L50
	movq	%rbx, %rdi
	call	get_current_char
	movq	40(%rbx), %rax
	movq	32(%rbx), %rdx
	movq	NE_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L189
.L50:
	cmpb	$60, %al
	jne	.L51
	testb	%dl, %dl
	je	.L51
	movq	%rbx, %rdi
	call	get_current_char
	movq	40(%rbx), %rax
	movq	32(%rbx), %rdx
	movq	LE_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L189
.L51:
	cmpb	$62, %al
	jne	.L52
	testb	%dl, %dl
	je	.L52
	movq	%rbx, %rdi
	call	get_current_char
	movq	40(%rbx), %rax
	movq	32(%rbx), %rdx
	movq	GE_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L189
.L52:
	cmpb	$43, %al
	jne	.L53
	testb	%dl, %dl
	je	.L53
	movq	%rbx, %rdi
	call	get_current_char
	movq	40(%rbx), %rax
	movq	32(%rbx), %rdx
	movq	ADD_ASSIGN_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L189
.L53:
	cmpb	$45, %al
	jne	.L54
	testb	%dl, %dl
	je	.L54
	movq	%rbx, %rdi
	call	get_current_char
	movq	40(%rbx), %rax
	movq	32(%rbx), %rdx
	movq	SUB_ASSIGN_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L189
.L54:
	cmpb	$42, %al
	jne	.L55
	testb	%dl, %dl
	je	.L55
	movq	%rbx, %rdi
	call	get_current_char
	movq	40(%rbx), %rax
	movq	32(%rbx), %rdx
	movq	MUL_ASSIGN_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L189
.L55:
	testb	%sil, %sil
	je	.L56
	testb	%dl, %dl
	je	.L56
	movq	%rbx, %rdi
	call	get_current_char
	movq	40(%rbx), %rax
	movq	32(%rbx), %rdx
	movq	DIV_ASSIGN_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L189
.L56:
	cmpb	$37, %al
	jne	.L57
	testb	%dl, %dl
	je	.L57
	movq	%rbx, %rdi
	call	get_current_char
	movq	40(%rbx), %rax
	movq	32(%rbx), %rdx
	movq	MOD_ASSIGN_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L189
.L57:
	cmpb	$38, %al
	jne	.L58
	cmpb	$38, %cl
	jne	.L58
	movq	%rbx, %rdi
	call	get_current_char
	movq	40(%rbx), %rax
	movq	32(%rbx), %rdx
	movq	AND_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L189
.L58:
	cmpb	$124, %al
	jne	.L59
	cmpb	$124, %cl
	jne	.L59
	movq	%rbx, %rdi
	call	get_current_char
	movq	40(%rbx), %rax
	movq	32(%rbx), %rdx
	movq	OR_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L189
.L59:
	movq	40(%rbx), %rcx
	movq	32(%rbx), %rsi
	leaq	-1(%rcx), %rdx
	cmpb	$62, %al
	jg	.L60
	cmpb	$32, %al
	jle	.L61
	subl	$33, %eax
	cmpb	$29, %al
	ja	.L61
	leaq	.L63(%rip), %rcx
	movzbl	%al, %eax
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L63:
	.long	.L76-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L75-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L74-.L63
	.long	.L73-.L63
	.long	.L72-.L63
	.long	.L71-.L63
	.long	.L70-.L63
	.long	.L69-.L63
	.long	.L68-.L63
	.long	.L67-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L66-.L63
	.long	.L65-.L63
	.long	.L64-.L63
	.long	.L62-.L63
	.text
.L60:
	cmpb	$123, %al
	je	.L77
	jg	.L78
	cmpb	$91, %al
	je	.L79
	cmpb	$93, %al
	jne	.L61
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movq	R_BRACKET_SYMBOL(%rip), %rsi
	jmp	.L189
.L78:
	cmpb	$125, %al
	jne	.L61
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movq	R_BRACE_SYMBOL(%rip), %rsi
	jmp	.L189
.L74:
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movq	L_PAREN_SYMBOL(%rip), %rsi
	jmp	.L189
.L73:
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movq	R_PAREN_SYMBOL(%rip), %rsi
	jmp	.L189
.L77:
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movq	L_BRACE_SYMBOL(%rip), %rsi
	jmp	.L189
.L70:
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movq	COMMA_SYMBOL(%rip), %rsi
	jmp	.L189
.L76:
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movq	NOT_SYMBOL(%rip), %rsi
	jmp	.L189
.L68:
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movq	DOT_SYMBOL(%rip), %rsi
	jmp	.L189
.L79:
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movq	L_BRACKET_SYMBOL(%rip), %rsi
	jmp	.L189
.L66:
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	jmp	.L189
.L71:
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movq	ADD_SYMBOL(%rip), %rsi
	jmp	.L189
.L69:
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movq	SUB_SYMBOL(%rip), %rsi
	jmp	.L189
.L72:
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movq	MUL_SYMBOL(%rip), %rsi
	jmp	.L189
.L67:
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movq	DIV_SYMBOL(%rip), %rsi
	jmp	.L189
.L75:
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movq	MOD_SYMBOL(%rip), %rsi
	jmp	.L189
.L65:
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movq	LT_SYMBOL(%rip), %rsi
	jmp	.L189
.L62:
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movq	GT_SYMBOL(%rip), %rsi
	jmp	.L189
.L64:
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movq	ASSIGN_SYMBOL(%rip), %rsi
.L189:
	movl	$5, %edi
	jmp	.L188
.L61:
	movq	(%rbx), %rcx
	leaq	.LC6(%rip), %rdi
	call	lexer_error
	xorl	%ecx, %ecx
	xorl	%edx, %edx
.L186:
	xorl	%esi, %esi
	xorl	%edi, %edi
.L188:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	create_token
.L197:
	movq	%rbx, %rdi
	call	get_current_char
	testb	%r12b, %r12b
	jne	.L187
	movq	16(%rbx), %rax
	movq	32(%rbx), %r12
	leaq	-2(%rax), %rsi
	jmp	.L192
	.size	next_token, .-next_token
	.globl	create_lexer
	.type	create_lexer, @function
create_lexer:
	pushq	%r12
	movq	%rdi, %r12
	movl	$88, %edi
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movq	%rdx, %rbx
	call	*alloc_memory@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%r12, 8(%rax)
	movq	%rdx, 16(%rax)
	movq	%rbp, 24(%rax)
	movq	%rcx, 32(%rax)
	movq	%rcx, 40(%rax)
	movq	%rcx, 48(%rax)
	movq	%rcx, 56(%rax)
	movq	%rcx, 64(%rax)
	movq	%rcx, 72(%rax)
	movq	%rcx, 80(%rax)
	movq	%rbx, (%rax)
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	create_lexer, .-create_lexer
	.globl	get_next_token
	.type	get_next_token, @function
get_next_token:
	movq	48(%rdi), %rax
	pushq	%rbx
	movq	%rdi, %rbx
	testq	%rax, %rax
	je	.L201
	movq	56(%rdi), %rdx
	movq	%rax, 80(%rdi)
	movq	%rdx, 16(%rdi)
	movq	64(%rdi), %rdx
	movq	%rdx, 32(%rdi)
	movq	72(%rdi), %rdx
	movq	%rdx, 40(%rdi)
	xorl	%edx, %edx
	movq	%rdx, 48(%rdi)
	jmp	.L200
.L201:
	movsbl	%sil, %esi
	call	next_token
	movq	%rax, 80(%rbx)
.L200:
	popq	%rbx
	ret
	.size	get_next_token, .-get_next_token
	.globl	peek_next_token
	.type	peek_next_token, @function
peek_next_token:
	movq	48(%rdi), %rax
	testq	%rax, %rax
	jne	.L207
	pushq	%r13
	movsbl	%sil, %esi
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	pushq	%rax
	movq	16(%rdi), %r13
	movq	32(%rdi), %r12
	movq	40(%rdi), %rbp
	call	get_next_token
	movq	16(%rbx), %rdx
	movq	%r13, 16(%rbx)
	movq	%rax, 48(%rbx)
	movq	%rdx, 56(%rbx)
	movq	32(%rbx), %rdx
	movq	%r12, 32(%rbx)
	movq	%rdx, 64(%rbx)
	movq	40(%rbx), %rdx
	movq	%rbp, 40(%rbx)
	movq	%rdx, 72(%rbx)
	popq	%rdx
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L207:
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
	xorl	%eax, %eax
	movq	%rax, 16(%rdi)
	movq	%rax, 32(%rdi)
	movq	%rax, 40(%rdi)
	movq	%rax, 48(%rdi)
	movq	%rax, 56(%rdi)
	movq	%rax, 64(%rdi)
	movq	%rax, 72(%rdi)
	movq	%rax, 80(%rdi)
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
