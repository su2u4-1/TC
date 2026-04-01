	.file	"lexer.c"
	.text
	.type	get_current_char, @function
get_current_char:
	movq	8(%rdi), %rax
	xorl	%edx, %edx
	cmpq	16(%rdi), %rax
	jnb	.L1
	movq	(%rdi), %rdx
	leaq	1(%rax), %rcx
	incq	32(%rdi)
	movq	%rcx, 8(%rdi)
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
	.string	"Lexer Error at Line %zu, Column %zu: %s\n"
	.text
	.type	lexer_error, @function
lexer_error:
	movq	%rdi, %r9
	leaq	1(%rsi), %rcx
	leaq	1(%rdx), %r8
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	leaq	.LC0(%rip), %rdx
	xorl	%eax, %eax
	jmp	*__fprintf_chk@GOTPCREL(%rip)
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
	jne	.L9
	movq	32(%rdi), %rcx
	movq	24(%rdi), %rdx
	jmp	.L185
.L9:
	movl	%eax, %edx
	movl	%esi, %r12d
	andl	$-5, %edx
	cmpb	$9, %dl
	je	.L186
	cmpb	$32, %al
	je	.L186
	cmpb	$10, %al
	jne	.L12
	incq	24(%rdi)
	xorl	%edi, %edi
	movq	%rdi, 32(%rbx)
.L186:
	addq	$24, %rsp
	movsbl	%r12b, %esi
	movq	%rbx, %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	next_token
.L12:
	movq	8(%rdi), %rbp
	cmpb	$57, %al
	jg	.L13
	cmpb	$47, %al
	jg	.L14
	cmpb	$34, %al
	jne	.L16
	movabsq	$-17179870210, %rsi
	movq	32(%rdi), %rax
	leaq	-1(%rax), %r13
	call	get_current_char
	movl	%eax, %r12d
	jmp	.L29
.L13:
	leal	-65(%rax), %edx
	cmpb	$57, %dl
	ja	.L16
	movabsq	$288230372997595135, %rsi
	btq	%rdx, %rsi
	jnc	.L16
	movq	32(%rbx), %rcx
	leaq	-1(%rbp), %r8
	leaq	-1(%rcx), %r12
.L19:
	cmpb	$57, %al
	jg	.L20
	cmpb	$47, %al
	jle	.L22
.L21:
	movq	%rbx, %rdi
	call	get_current_char
	jmp	.L19
.L20:
	subl	$65, %eax
	cmpb	$57, %al
	ja	.L22
	btq	%rax, %rsi
	jc	.L21
.L22:
	movq	8(%rbx), %rsi
	movq	(%rbx), %rdi
	decq	32(%rbx)
	leaq	-1(%rsi), %rax
	addq	%r8, %rdi
	subq	%rbp, %rsi
	movq	%rax, 8(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rdi
	movq	%rax, 8(%rsp)
	call	*is_keyword@GOTPCREL(%rip)
	movq	24(%rbx), %rdx
	movq	8(%rsp), %rsi
	movq	%r12, %rcx
	testb	%al, %al
	movl	$6, %edi
	jne	.L187
	movl	$1, %edi
	jmp	.L187
.L14:
	movq	32(%rdi), %rax
	leaq	-1(%rbp), %r9
	leaq	-1(%rax), %r12
.L25:
	movq	%rbx, %rdi
	call	get_current_char
	leal	-48(%rax), %edx
	cmpb	$9, %dl
	jbe	.L25
	movq	8(%rbx), %rdx
	movq	(%rbx), %r8
	movl	$2, %r13d
	cmpq	16(%rbx), %rdx
	jnb	.L26
	cmpb	$46, %al
	jne	.L26
	movb	(%r8,%rdx), %al
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L26
.L184:
	call	get_current_char
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L192
	movq	%rbx, %rdi
	jmp	.L184
.L192:
	movl	$3, %r13d
.L26:
	movq	8(%rbx), %rsi
	decq	32(%rbx)
	leaq	(%r8,%r9), %rdi
	leaq	-1(%rsi), %rax
	subq	%rbp, %rsi
	movq	%rax, 8(%rbx)
	movq	24(%rbx), %rbx
	call	*create_string@GOTPCREL(%rip)
	movq	%r12, %rcx
	movl	%r13d, %edi
	movq	%rax, %rsi
	movq	%rbx, %rdx
	jmp	.L187
.L194:
	btq	%r12, %rsi
	jnc	.L193
.L30:
	movq	%rbx, %rdi
	call	get_current_char
	movl	%eax, %r12d
.L29:
	cmpb	$34, %r12b
	ja	.L30
	jmp	.L194
.L193:
	movq	24(%rbx), %rsi
	cmpb	$34, %r12b
	je	.L32
	leaq	-1(%rbp), %rdx
	leaq	.LC1(%rip), %rdi
	call	lexer_error
	cmpb	$10, %r12b
	jne	.L32
	xorl	%esi, %esi
	incq	24(%rbx)
	movq	%rsi, 32(%rbx)
.L32:
	movq	8(%rbx), %rsi
	movq	24(%rbx), %r12
	leaq	.LC2(%rip), %rdi
	subq	%rbp, %rsi
	cmpq	$1, %rsi
	je	.L189
	movq	(%rbx), %rdi
	decq	%rsi
	addq	%rbp, %rdi
.L189:
	call	*create_string@GOTPCREL(%rip)
	movq	%r13, %rcx
	movq	%r12, %rdx
	movl	$4, %edi
	movq	%rax, %rsi
	jmp	.L187
.L16:
	movq	16(%rbx), %r8
	xorl	%ecx, %ecx
	cmpq	%r8, %rbp
	jnb	.L35
	movq	(%rbx), %rdx
	movb	(%rdx,%rbp), %cl
.L35:
	cmpb	$47, %al
	sete	%sil
	cmpb	$47, %cl
	jne	.L36
	testb	%sil, %sil
	je	.L36
	movq	32(%rbx), %r13
.L37:
	movq	%rbx, %rdi
	call	get_current_char
	cmpb	$10, %al
	je	.L92
	testb	%al, %al
	jne	.L37
.L92:
	movq	8(%rbx), %rax
	decq	32(%rbx)
	leaq	-1(%rax), %rsi
	movq	%rsi, 8(%rbx)
	testb	%r12b, %r12b
	jne	.L186
	leaq	1(%rbp), %rdi
	movq	24(%rbx), %rbp
	subq	%rdi, %rsi
	addq	(%rbx), %rdi
	call	*create_string@GOTPCREL(%rip)
	leaq	-1(%r13), %rcx
	movq	%rbp, %rdx
	movq	%rax, %rsi
	jmp	.L190
.L36:
	cmpb	$42, %cl
	jne	.L40
	testb	%sil, %sil
	je	.L40
	movq	32(%rbx), %rax
	incq	%rbp
	movb	$42, %dl
	leaq	-1(%rax), %r13
	movb	$47, %al
.L41:
	cmpb	$42, %al
	je	.L195
.L45:
	movq	%rbx, %rdi
	call	get_current_char
	movq	8(%rbx), %rdx
	cmpq	%r8, %rdx
	jnb	.L42
	movq	(%rbx), %rcx
	movb	(%rcx,%rdx), %dl
	cmpb	$10, %al
	jne	.L43
	jmp	.L81
.L42:
	cmpb	$10, %al
	jne	.L44
	xorl	%edx, %edx
.L81:
	xorl	%ecx, %ecx
	incq	24(%rbx)
	movq	%rcx, 32(%rbx)
.L43:
	testb	%dl, %dl
	je	.L44
	testb	%al, %al
	jne	.L41
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$126, %edx
	leaq	.LC3(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	call	*__assert_fail@GOTPCREL(%rip)
.L195:
	cmpb	$47, %dl
	jne	.L45
	jmp	.L196
.L44:
	testb	%al, %al
	jne	.L85
	decq	8(%rbx)
	decq	32(%rbx)
.L85:
	movq	24(%rbx), %rsi
	movq	%rbp, %rdx
	leaq	.LC5(%rip), %rdi
	call	lexer_error
	testb	%r12b, %r12b
	jne	.L186
	movq	24(%rbx), %r12
	movq	8(%rbx), %rsi
.L191:
	movq	(%rbx), %rdi
	subq	%rbp, %rsi
	addq	%rbp, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%r13, %rcx
	movq	%r12, %rdx
	movq	%rax, %rsi
.L190:
	movl	$7, %edi
	jmp	.L187
.L40:
	cmpb	$61, %cl
	sete	%dl
	cmpb	$61, %al
	jne	.L48
	testb	%dl, %dl
	je	.L48
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %rdx
	movq	EQ_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L188
.L48:
	cmpb	$33, %al
	jne	.L49
	testb	%dl, %dl
	je	.L49
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %rdx
	movq	NE_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L188
.L49:
	cmpb	$60, %al
	jne	.L50
	testb	%dl, %dl
	je	.L50
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %rdx
	movq	LE_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L188
.L50:
	cmpb	$62, %al
	jne	.L51
	testb	%dl, %dl
	je	.L51
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %rdx
	movq	GE_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L188
.L51:
	cmpb	$43, %al
	jne	.L52
	testb	%dl, %dl
	je	.L52
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %rdx
	movq	ADD_ASSIGN_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L188
.L52:
	cmpb	$45, %al
	jne	.L53
	testb	%dl, %dl
	je	.L53
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %rdx
	movq	SUB_ASSIGN_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L188
.L53:
	cmpb	$42, %al
	jne	.L54
	testb	%dl, %dl
	je	.L54
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %rdx
	movq	MUL_ASSIGN_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L188
.L54:
	testb	%sil, %sil
	je	.L55
	testb	%dl, %dl
	je	.L55
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %rdx
	movq	DIV_ASSIGN_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L188
.L55:
	cmpb	$37, %al
	jne	.L56
	testb	%dl, %dl
	je	.L56
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %rdx
	movq	MOD_ASSIGN_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L188
.L56:
	cmpb	$38, %al
	jne	.L57
	cmpb	$38, %cl
	jne	.L57
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %rdx
	movq	AND_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L188
.L57:
	cmpb	$124, %al
	jne	.L58
	cmpb	$124, %cl
	jne	.L58
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %rdx
	movq	OR_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L188
.L58:
	movq	32(%rbx), %rcx
	movq	24(%rbx), %rsi
	decq	%rcx
	cmpb	$62, %al
	jg	.L59
	cmpb	$32, %al
	jle	.L60
	subl	$33, %eax
	cmpb	$29, %al
	ja	.L60
	leaq	.L62(%rip), %rdx
	movzbl	%al, %eax
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L62:
	.long	.L75-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L74-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L73-.L62
	.long	.L72-.L62
	.long	.L71-.L62
	.long	.L70-.L62
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
	.long	.L65-.L62
	.long	.L64-.L62
	.long	.L63-.L62
	.long	.L61-.L62
	.text
.L59:
	cmpb	$123, %al
	je	.L76
	jg	.L77
	cmpb	$91, %al
	je	.L78
	cmpb	$93, %al
	jne	.L60
	movq	%rsi, %rdx
	movq	R_BRACKET_SYMBOL(%rip), %rsi
	jmp	.L188
.L77:
	cmpb	$125, %al
	jne	.L60
	movq	%rsi, %rdx
	movq	R_BRACE_SYMBOL(%rip), %rsi
	jmp	.L188
.L73:
	movq	%rsi, %rdx
	movq	L_PAREN_SYMBOL(%rip), %rsi
	jmp	.L188
.L72:
	movq	%rsi, %rdx
	movq	R_PAREN_SYMBOL(%rip), %rsi
	jmp	.L188
.L76:
	movq	%rsi, %rdx
	movq	L_BRACE_SYMBOL(%rip), %rsi
	jmp	.L188
.L69:
	movq	%rsi, %rdx
	movq	COMMA_SYMBOL(%rip), %rsi
	jmp	.L188
.L75:
	movq	%rsi, %rdx
	movq	NOT_SYMBOL(%rip), %rsi
	jmp	.L188
.L67:
	movq	%rsi, %rdx
	movq	DOT_SYMBOL(%rip), %rsi
	jmp	.L188
.L78:
	movq	%rsi, %rdx
	movq	L_BRACKET_SYMBOL(%rip), %rsi
	jmp	.L188
.L65:
	movq	%rsi, %rdx
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	jmp	.L188
.L70:
	movq	%rsi, %rdx
	movq	ADD_SYMBOL(%rip), %rsi
	jmp	.L188
.L68:
	movq	%rsi, %rdx
	movq	SUB_SYMBOL(%rip), %rsi
	jmp	.L188
.L71:
	movq	%rsi, %rdx
	movq	MUL_SYMBOL(%rip), %rsi
	jmp	.L188
.L66:
	movq	%rsi, %rdx
	movq	DIV_SYMBOL(%rip), %rsi
	jmp	.L188
.L74:
	movq	%rsi, %rdx
	movq	MOD_SYMBOL(%rip), %rsi
	jmp	.L188
.L64:
	movq	%rsi, %rdx
	movq	LT_SYMBOL(%rip), %rsi
	jmp	.L188
.L61:
	movq	%rsi, %rdx
	movq	GT_SYMBOL(%rip), %rsi
	jmp	.L188
.L63:
	movq	%rsi, %rdx
	movq	ASSIGN_SYMBOL(%rip), %rsi
.L188:
	movl	$5, %edi
	jmp	.L187
.L60:
	movq	%rcx, %rdx
	leaq	.LC6(%rip), %rdi
	call	lexer_error
	xorl	%ecx, %ecx
	xorl	%edx, %edx
.L185:
	xorl	%esi, %esi
	xorl	%edi, %edi
.L187:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	create_token
.L196:
	movq	%rbx, %rdi
	call	get_current_char
	testb	%r12b, %r12b
	jne	.L186
	movq	8(%rbx), %rax
	movq	24(%rbx), %r12
	leaq	-2(%rax), %rsi
	jmp	.L191
	.size	next_token, .-next_token
	.globl	create_lexer
	.type	create_lexer, @function
create_lexer:
	pushq	%rbp
	movq	%rdi, %rbp
	movl	$80, %edi
	pushq	%rbx
	movq	%rsi, %rbx
	pushq	%rax
	call	*alloc_memory@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rbp, (%rax)
	movq	%rdx, 8(%rax)
	movq	%rbx, 16(%rax)
	movq	%rcx, 24(%rax)
	movq	%rcx, 32(%rax)
	movq	%rcx, 40(%rax)
	movq	%rcx, 48(%rax)
	movq	%rcx, 56(%rax)
	movq	%rcx, 64(%rax)
	movq	%rcx, 72(%rax)
	popq	%rsi
	popq	%rbx
	popq	%rbp
	ret
	.size	create_lexer, .-create_lexer
	.globl	get_next_token
	.type	get_next_token, @function
get_next_token:
	movq	40(%rdi), %rax
	pushq	%rbx
	movq	%rdi, %rbx
	testq	%rax, %rax
	je	.L200
	movq	48(%rdi), %rdx
	movq	%rax, 72(%rdi)
	movq	%rdx, 8(%rdi)
	movq	56(%rdi), %rdx
	movq	%rdx, 24(%rdi)
	movq	64(%rdi), %rdx
	movq	%rdx, 32(%rdi)
	xorl	%edx, %edx
	movq	%rdx, 40(%rdi)
	jmp	.L199
.L200:
	movsbl	%sil, %esi
	call	next_token
	movq	%rax, 72(%rbx)
.L199:
	popq	%rbx
	ret
	.size	get_next_token, .-get_next_token
	.globl	peek_next_token
	.type	peek_next_token, @function
peek_next_token:
	movq	40(%rdi), %rax
	testq	%rax, %rax
	jne	.L206
	pushq	%r13
	movsbl	%sil, %esi
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	pushq	%rax
	movq	8(%rdi), %r13
	movq	24(%rdi), %r12
	movq	32(%rdi), %rbp
	call	get_next_token
	movq	8(%rbx), %rdx
	movq	%r13, 8(%rbx)
	movq	%rax, 40(%rbx)
	movq	%rdx, 48(%rbx)
	movq	24(%rbx), %rdx
	movq	%r12, 24(%rbx)
	movq	%rdx, 56(%rbx)
	movq	32(%rbx), %rdx
	movq	%rbp, 32(%rbx)
	movq	%rdx, 64(%rbx)
	popq	%rdx
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L206:
	ret
	.size	peek_next_token, .-peek_next_token
	.globl	peek_current_token
	.type	peek_current_token, @function
peek_current_token:
	movq	72(%rdi), %rax
	ret
	.size	peek_current_token, .-peek_current_token
	.globl	reset_lexer
	.type	reset_lexer, @function
reset_lexer:
	xorl	%eax, %eax
	movq	%rax, 8(%rdi)
	movq	%rax, 24(%rdi)
	movq	%rax, 32(%rdi)
	movq	%rax, 40(%rdi)
	movq	%rax, 48(%rdi)
	movq	%rax, 56(%rdi)
	movq	%rax, 64(%rdi)
	movq	%rax, 72(%rdi)
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
