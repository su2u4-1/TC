	.file	"lexer.c"
	.text
	.type	get_current_char, @function
get_current_char:
.LFB53:
	.cfi_startproc
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
	.cfi_endproc
.LFE53:
	.size	get_current_char, .-get_current_char
	.type	create_token, @function
create_token:
.LFB51:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	%edi, %r13d
	movl	$32, %edi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rcx, %rbx
	pushq	%rax
	.cfi_def_cfa_offset 48
	call	alloc_memory@PLT
	movl	%r13d, 24(%rax)
	movq	%r12, (%rax)
	movq	%rbp, 8(%rax)
	movq	%rbx, 16(%rax)
	popq	%rdx
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
.LFE51:
	.size	create_token, .-create_token
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Lexer Error at Line %zu, Column %zu: %s\n"
	.text
	.type	lexer_error, @function
lexer_error:
.LFB52:
	.cfi_startproc
	movq	%rdi, %r9
	movq	stderr(%rip), %rdi
	leaq	1(%rsi), %rcx
	xorl	%eax, %eax
	leaq	1(%rdx), %r8
	movl	$2, %esi
	leaq	.LC0(%rip), %rdx
	jmp	__fprintf_chk@PLT
	.cfi_endproc
.LFE52:
	.size	lexer_error, .-lexer_error
	.section	.rodata.str1.1
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
.LFB57:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbx
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	call	get_current_char
	testb	%al, %al
	jne	.L9
	movq	32(%rdi), %rcx
	movq	24(%rdi), %rdx
	jmp	.L183
.L9:
	movl	%eax, %edx
	movl	%esi, %r12d
	andl	$-5, %edx
	cmpb	$9, %dl
	je	.L184
	cmpb	$32, %al
	je	.L184
	cmpb	$10, %al
	jne	.L12
	xorl	%ebp, %ebp
	incq	24(%rdi)
	movq	%rbp, 32(%rdi)
.L184:
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movsbl	%r12b, %esi
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	next_token
.L12:
	.cfi_restore_state
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
	decq	32(%rbx)
	movq	(%rbx), %rdi
	leaq	-1(%rsi), %rax
	subq	%rbp, %rsi
	movq	%rax, 8(%rbx)
	addq	%r8, %rdi
	call	create_string@PLT
	movq	%rax, %rdi
	movq	%rax, 8(%rsp)
	call	is_keyword@PLT
	movq	24(%rbx), %rdx
	movq	8(%rsp), %rsi
	movq	%r12, %rcx
	testb	%al, %al
	movl	$6, %edi
	jne	.L185
	movl	$1, %edi
	jmp	.L185
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
.L182:
	call	get_current_char
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L190
	movq	%rbx, %rdi
	jmp	.L182
.L190:
	movl	$3, %r13d
.L26:
	movq	8(%rbx), %rsi
	decq	32(%rbx)
	leaq	(%r8,%r9), %rdi
	leaq	-1(%rsi), %rax
	subq	%rbp, %rsi
	movq	%rax, 8(%rbx)
	movq	24(%rbx), %rbx
	call	create_string@PLT
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	%r13d, %edi
	movq	%rax, %rsi
	jmp	.L185
.L192:
	btq	%r12, %rsi
	jnc	.L191
.L30:
	movq	%rbx, %rdi
	call	get_current_char
	movl	%eax, %r12d
.L29:
	cmpb	$34, %r12b
	ja	.L30
	jmp	.L192
.L191:
	movq	24(%rbx), %r14
	cmpb	$34, %r12b
	je	.L31
	leaq	-1(%rbp), %rdx
	movq	%r14, %rsi
	leaq	.LC1(%rip), %rdi
	call	lexer_error
	cmpb	$10, %r12b
	jne	.L32
	xorl	%r10d, %r10d
	incq	24(%rbx)
	movq	%r10, 32(%rbx)
.L32:
	movq	(%rbx), %rdi
	movq	%rbp, %rsi
	movq	24(%rbx), %r12
	notq	%rsi
	addq	8(%rbx), %rsi
	addq	%rbp, %rdi
	call	create_string@PLT
	movq	%r13, %rcx
	movq	%r12, %rdx
	movq	%rax, %rsi
	jmp	.L187
.L31:
	movq	(%rbx), %rdi
	movq	%rbp, %rsi
	notq	%rsi
	addq	8(%rbx), %rsi
	addq	%rbp, %rdi
	call	create_string@PLT
	movq	%r13, %rcx
	movq	%r14, %rdx
	movq	%rax, %rsi
.L187:
	movl	$4, %edi
	jmp	.L185
.L16:
	movq	16(%rbx), %r8
	xorl	%ecx, %ecx
	cmpq	%r8, %rbp
	jnb	.L33
	movq	(%rbx), %rdx
	movb	(%rdx,%rbp), %cl
.L33:
	cmpb	$47, %al
	sete	%sil
	cmpb	$47, %cl
	jne	.L34
	testb	%sil, %sil
	je	.L34
	movq	32(%rbx), %r13
.L35:
	movq	%rbx, %rdi
	call	get_current_char
	cmpb	$10, %al
	je	.L90
	testb	%al, %al
	jne	.L35
.L90:
	movq	8(%rbx), %rax
	decq	32(%rbx)
	leaq	-1(%rax), %rsi
	movq	%rsi, 8(%rbx)
	testb	%r12b, %r12b
	jne	.L184
	leaq	1(%rbp), %rdi
	movq	24(%rbx), %rbp
	subq	%rdi, %rsi
	addq	(%rbx), %rdi
	call	create_string@PLT
	leaq	-1(%r13), %rcx
	movq	%rbp, %rdx
	movq	%rax, %rsi
	jmp	.L188
.L34:
	cmpb	$42, %cl
	jne	.L38
	testb	%sil, %sil
	je	.L38
	movq	32(%rbx), %rax
	incq	%rbp
	movb	$42, %dl
	leaq	-1(%rax), %r13
	movb	$47, %al
.L39:
	cmpb	$42, %al
	je	.L193
.L43:
	movq	%rbx, %rdi
	call	get_current_char
	movq	8(%rbx), %rdx
	cmpq	%r8, %rdx
	jnb	.L40
	movq	(%rbx), %rcx
	movb	(%rcx,%rdx), %dl
	cmpb	$10, %al
	jne	.L41
	jmp	.L79
.L40:
	cmpb	$10, %al
	jne	.L42
	xorl	%edx, %edx
.L79:
	xorl	%r9d, %r9d
	incq	24(%rbx)
	movq	%r9, 32(%rbx)
.L41:
	testb	%dl, %dl
	je	.L42
	testb	%al, %al
	jne	.L39
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$125, %edx
	leaq	.LC2(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	__assert_fail@PLT
.L193:
	cmpb	$47, %dl
	jne	.L43
	jmp	.L194
.L42:
	testb	%al, %al
	jne	.L83
	decq	8(%rbx)
	decq	32(%rbx)
.L83:
	movq	24(%rbx), %rsi
	movq	%rbp, %rdx
	leaq	.LC4(%rip), %rdi
	call	lexer_error
	testb	%r12b, %r12b
	jne	.L184
	movq	24(%rbx), %r12
	movq	8(%rbx), %rsi
.L189:
	movq	(%rbx), %rdi
	subq	%rbp, %rsi
	addq	%rbp, %rdi
	call	create_string@PLT
	movq	%r13, %rcx
	movq	%r12, %rdx
	movq	%rax, %rsi
.L188:
	movl	$7, %edi
	jmp	.L185
.L38:
	cmpb	$61, %cl
	sete	%dl
	cmpb	$61, %al
	jne	.L46
	testb	%dl, %dl
	je	.L46
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %rdx
	movq	EQ_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L186
.L46:
	cmpb	$33, %al
	jne	.L47
	testb	%dl, %dl
	je	.L47
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %rdx
	movq	NE_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L186
.L47:
	cmpb	$60, %al
	jne	.L48
	testb	%dl, %dl
	je	.L48
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %rdx
	movq	LE_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L186
.L48:
	cmpb	$62, %al
	jne	.L49
	testb	%dl, %dl
	je	.L49
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %rdx
	movq	GE_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L186
.L49:
	cmpb	$43, %al
	jne	.L50
	testb	%dl, %dl
	je	.L50
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %rdx
	movq	ADD_ASSIGN_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L186
.L50:
	cmpb	$45, %al
	jne	.L51
	testb	%dl, %dl
	je	.L51
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %rdx
	movq	SUB_ASSIGN_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L186
.L51:
	cmpb	$42, %al
	jne	.L52
	testb	%dl, %dl
	je	.L52
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %rdx
	movq	MUL_ASSIGN_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L186
.L52:
	testb	%sil, %sil
	je	.L53
	testb	%dl, %dl
	je	.L53
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %rdx
	movq	DIV_ASSIGN_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L186
.L53:
	cmpb	$37, %al
	jne	.L54
	testb	%dl, %dl
	je	.L54
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %rdx
	movq	MOD_ASSIGN_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L186
.L54:
	cmpb	$38, %al
	jne	.L55
	cmpb	$38, %cl
	jne	.L55
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %rdx
	movq	AND_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L186
.L55:
	cmpb	$124, %al
	jne	.L56
	cmpb	$124, %cl
	jne	.L56
	movq	%rbx, %rdi
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %rdx
	movq	OR_SYMBOL(%rip), %rsi
	leaq	-2(%rax), %rcx
	jmp	.L186
.L56:
	movq	32(%rbx), %rcx
	movq	24(%rbx), %rsi
	decq	%rcx
	cmpb	$62, %al
	jg	.L57
	cmpb	$32, %al
	jle	.L58
	subl	$33, %eax
	cmpb	$29, %al
	ja	.L58
	leaq	.L60(%rip), %rdx
	movzbl	%al, %eax
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L60:
	.long	.L73-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L72-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L71-.L60
	.long	.L70-.L60
	.long	.L69-.L60
	.long	.L68-.L60
	.long	.L67-.L60
	.long	.L66-.L60
	.long	.L65-.L60
	.long	.L64-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L63-.L60
	.long	.L62-.L60
	.long	.L61-.L60
	.long	.L59-.L60
	.text
.L57:
	cmpb	$123, %al
	je	.L74
	jg	.L75
	cmpb	$91, %al
	je	.L76
	cmpb	$93, %al
	jne	.L58
	movq	%rsi, %rdx
	movq	R_BRACKET_SYMBOL(%rip), %rsi
	jmp	.L186
.L75:
	cmpb	$125, %al
	jne	.L58
	movq	%rsi, %rdx
	movq	R_BRACE_SYMBOL(%rip), %rsi
	jmp	.L186
.L71:
	movq	%rsi, %rdx
	movq	L_PAREN_SYMBOL(%rip), %rsi
	jmp	.L186
.L70:
	movq	%rsi, %rdx
	movq	R_PAREN_SYMBOL(%rip), %rsi
	jmp	.L186
.L74:
	movq	%rsi, %rdx
	movq	L_BRACE_SYMBOL(%rip), %rsi
	jmp	.L186
.L67:
	movq	%rsi, %rdx
	movq	COMMA_SYMBOL(%rip), %rsi
	jmp	.L186
.L73:
	movq	%rsi, %rdx
	movq	NOT_SYMBOL(%rip), %rsi
	jmp	.L186
.L65:
	movq	%rsi, %rdx
	movq	DOT_SYMBOL(%rip), %rsi
	jmp	.L186
.L76:
	movq	%rsi, %rdx
	movq	L_BRACKET_SYMBOL(%rip), %rsi
	jmp	.L186
.L63:
	movq	%rsi, %rdx
	movq	SEMICOLON_SYMBOL(%rip), %rsi
	jmp	.L186
.L68:
	movq	%rsi, %rdx
	movq	ADD_SYMBOL(%rip), %rsi
	jmp	.L186
.L66:
	movq	%rsi, %rdx
	movq	SUB_SYMBOL(%rip), %rsi
	jmp	.L186
.L69:
	movq	%rsi, %rdx
	movq	MUL_SYMBOL(%rip), %rsi
	jmp	.L186
.L64:
	movq	%rsi, %rdx
	movq	DIV_SYMBOL(%rip), %rsi
	jmp	.L186
.L72:
	movq	%rsi, %rdx
	movq	MOD_SYMBOL(%rip), %rsi
	jmp	.L186
.L62:
	movq	%rsi, %rdx
	movq	LT_SYMBOL(%rip), %rsi
	jmp	.L186
.L59:
	movq	%rsi, %rdx
	movq	GT_SYMBOL(%rip), %rsi
	jmp	.L186
.L61:
	movq	%rsi, %rdx
	movq	ASSIGN_SYMBOL(%rip), %rsi
.L186:
	movl	$5, %edi
	jmp	.L185
.L58:
	movq	%rcx, %rdx
	leaq	.LC5(%rip), %rdi
	call	lexer_error
	xorl	%ecx, %ecx
	xorl	%edx, %edx
.L183:
	xorl	%esi, %esi
	xorl	%edi, %edi
.L185:
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	create_token
.L194:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	get_current_char
	testb	%r12b, %r12b
	jne	.L184
	movq	8(%rbx), %rax
	movq	24(%rbx), %r12
	leaq	-2(%rax), %rsi
	jmp	.L189
	.cfi_endproc
.LFE57:
	.size	next_token, .-next_token
	.globl	create_lexer
	.type	create_lexer, @function
create_lexer:
.LFB50:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	movl	$80, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbx
	pushq	%rax
	.cfi_def_cfa_offset 32
	call	alloc_memory@PLT
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
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE50:
	.size	create_lexer, .-create_lexer
	.globl	get_next_token
	.type	get_next_token, @function
get_next_token:
.LFB58:
	.cfi_startproc
	endbr64
	movq	40(%rdi), %rax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	testq	%rax, %rax
	je	.L198
	movq	48(%rdi), %rdx
	movq	%rax, 72(%rdi)
	movq	%rdx, 8(%rdi)
	movq	56(%rdi), %rdx
	movq	%rdx, 24(%rdi)
	movq	64(%rdi), %rdx
	movq	%rdx, 32(%rdi)
	xorl	%edx, %edx
	movq	%rdx, 40(%rdi)
	jmp	.L197
.L198:
	movsbl	%sil, %esi
	call	next_token
	movq	%rax, 72(%rbx)
.L197:
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE58:
	.size	get_next_token, .-get_next_token
	.globl	peek_next_token
	.type	peek_next_token, @function
peek_next_token:
.LFB59:
	.cfi_startproc
	endbr64
	movq	40(%rdi), %rax
	testq	%rax, %rax
	jne	.L204
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movsbl	%sil, %esi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	pushq	%rax
	.cfi_def_cfa_offset 48
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
.L204:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	ret
	.cfi_endproc
.LFE59:
	.size	peek_next_token, .-peek_next_token
	.globl	peek_current_token
	.type	peek_current_token, @function
peek_current_token:
.LFB60:
	.cfi_startproc
	endbr64
	movq	72(%rdi), %rax
	ret
	.cfi_endproc
.LFE60:
	.size	peek_current_token, .-peek_current_token
	.globl	reset_lexer
	.type	reset_lexer, @function
reset_lexer:
.LFB61:
	.cfi_startproc
	endbr64
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
	.cfi_endproc
.LFE61:
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
