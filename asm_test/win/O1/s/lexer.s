	.file	"D:\\TC\\src\\lexer.c"
	.text
	.def	get_current_char;	.scl	3;	.type	32;	.endef
get_current_char:
	movq	8(%rcx), %rax
	movl	$0, %edx
	cmpq	16(%rcx), %rax
	jnb	.L1
	addq	$1, 32(%rcx)
	movq	(%rcx), %rdx
	leaq	1(%rax), %r8
	movq	%r8, 8(%rcx)
	movzbl	(%rdx,%rax), %edx
.L1:
	movl	%edx, %eax
	ret
	.def	create_token;	.scl	3;	.type	32;	.endef
create_token:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movl	%ecx, %ebp
	movq	%rdx, %rdi
	movq	%r8, %rsi
	movq	%r9, %rbx
	movl	$32, %ecx
	call	alloc_memory
	movl	%ebp, 24(%rax)
	movq	%rdi, (%rax)
	movq	%rsi, 8(%rax)
	movq	%rbx, 16(%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Lexer Error at Line %zu, Column %zu: %s\12\0"
	.text
	.def	lexer_error;	.scl	3;	.type	32;	.endef
lexer_error:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$48, %rsp
	movq	%rcx, %rdi
	movq	%rdx, %rbx
	movq	%r8, %rsi
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rdi, 32(%rsp)
	leaq	1(%rsi), %r9
	leaq	1(%rbx), %r8
	leaq	.LC0(%rip), %rdx
	call	fprintf
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.section .rdata,"dr"
.LC1:
	.ascii "Unterminated string literal\0"
.LC2:
	.ascii "c != '\\0'\0"
.LC3:
	.ascii "D:\\TC\\src\\lexer.c\0"
.LC4:
	.ascii "Unterminated comment\0"
.LC5:
	.ascii "Unexpected character\0"
	.text
	.def	next_token;	.scl	3;	.type	32;	.endef
next_token:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rbx
	movl	%edx, %esi
	call	get_current_char
	cmpb	$32, %al
	ja	.L9
	movzbl	%al, %edx
	leaq	.L11(%rip), %rcx
	movslq	(%rcx,%rdx,4), %rdx
	addq	%rcx, %rdx
	jmp	*%rdx
	.section .rdata,"dr"
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
	movq	32(%rbx), %r9
	movq	24(%rbx), %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	create_token
.L8:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L10:
	movsbl	%sil, %edx
	movq	%rbx, %rcx
	call	next_token
	jmp	.L8
.L12:
	addq	$1, 24(%rbx)
	movq	$0, 32(%rbx)
	movsbl	%sil, %edx
	movq	%rbx, %rcx
	call	next_token
	jmp	.L8
.L9:
	cmpb	$57, %al
	jg	.L15
	cmpb	$47, %al
	jg	.L16
	cmpb	$34, %al
	jne	.L103
	movq	8(%rbx), %rdi
	movq	32(%rbx), %rax
	leaq	-1(%rax), %r12
	movq	%rbx, %rcx
	call	get_current_char
	movl	%eax, %esi
	cmpb	$34, %al
	ja	.L31
	movabsq	$17179870209, %rax
	btq	%rsi, %rax
	jc	.L32
.L31:
	movabsq	$17179870209, %rbp
.L96:
	movq	%rbx, %rcx
	call	get_current_char
	movl	%eax, %esi
	cmpb	$34, %al
	ja	.L96
	btq	%rsi, %rbp
	jnc	.L96
.L32:
	cmpb	$34, %sil
	je	.L34
	movq	24(%rbx), %rdx
	leaq	-1(%rdi), %r8
	leaq	.LC1(%rip), %rcx
	call	lexer_error
	cmpb	$10, %sil
	je	.L104
.L35:
	movq	24(%rbx), %rsi
	movq	%rdi, %rdx
	notq	%rdx
	addq	8(%rbx), %rdx
	addq	(%rbx), %rdi
	movq	%rdi, %rcx
	call	create_string
	movq	%rax, %rdx
	movq	%r12, %r9
	movq	%rsi, %r8
	movl	$4, %ecx
	call	create_token
	jmp	.L8
.L15:
	leal	-65(%rax), %edx
	cmpb	$57, %dl
	ja	.L20
	movabsq	$288230372997595135, %rcx
	btq	%rdx, %rcx
	jnc	.L20
	movq	8(%rbx), %r12
	leaq	-1(%r12), %rbp
	movq	32(%rbx), %rdi
	subq	$1, %rdi
	movabsq	$288230372997595135, %rsi
	jmp	.L22
.L105:
	cmpb	$47, %al
	jle	.L25
.L24:
	movq	%rbx, %rcx
	call	get_current_char
.L22:
	cmpb	$57, %al
	jle	.L105
	subl	$65, %eax
	cmpb	$57, %al
	ja	.L25
	btq	%rax, %rsi
	jc	.L24
.L25:
	movq	8(%rbx), %rdx
	leaq	-1(%rdx), %rax
	movq	%rax, 8(%rbx)
	subq	$1, 32(%rbx)
	subq	%r12, %rdx
	movq	%rbp, %rcx
	addq	(%rbx), %rcx
	call	create_string
	movq	%rax, %rsi
	movq	%rax, %rcx
	call	is_keyword
	testb	%al, %al
	je	.L27
	movq	%rdi, %r9
	movq	24(%rbx), %r8
	movq	%rsi, %rdx
	movl	$6, %ecx
	call	create_token
	jmp	.L8
.L27:
	movq	%rdi, %r9
	movq	24(%rbx), %r8
	movq	%rsi, %rdx
	movl	$1, %ecx
	call	create_token
	jmp	.L8
.L16:
	movq	8(%rbx), %rbp
	leaq	-1(%rbp), %rdi
	movq	32(%rbx), %rax
	leaq	-1(%rax), %rsi
.L28:
	movq	%rbx, %rcx
	call	get_current_char
	leal	-48(%rax), %edx
	cmpb	$9, %dl
	jbe	.L28
	movq	8(%rbx), %rdx
	movl	$2, %r12d
	cmpq	16(%rbx), %rdx
	jnb	.L29
	cmpb	$46, %al
	je	.L106
.L29:
	movq	8(%rbx), %rdx
	leaq	-1(%rdx), %rax
	movq	%rax, 8(%rbx)
	subq	$1, 32(%rbx)
	movq	24(%rbx), %r13
	subq	%rbp, %rdx
	addq	(%rbx), %rdi
	movq	%rdi, %rcx
	call	create_string
	movq	%rax, %rdx
	movq	%rsi, %r9
	movq	%r13, %r8
	movl	%r12d, %ecx
	call	create_token
	jmp	.L8
.L106:
	movq	(%rbx), %rax
	movzbl	(%rax,%rdx), %eax
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L29
	movq	%rbx, %rcx
	call	get_current_char
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L89
.L30:
	movq	%rbx, %rcx
	call	get_current_char
	subl	$48, %eax
	cmpb	$9, %al
	jbe	.L30
	movl	$3, %r12d
	jmp	.L29
.L89:
	movl	$3, %r12d
	jmp	.L29
.L104:
	addq	$1, 24(%rbx)
	movq	$0, 32(%rbx)
	jmp	.L35
.L34:
	movq	24(%rbx), %rsi
	movq	%rdi, %rdx
	notq	%rdx
	addq	8(%rbx), %rdx
	addq	(%rbx), %rdi
	movq	%rdi, %rcx
	call	create_string
	movq	%rax, %rdx
	movq	%r12, %r9
	movq	%rsi, %r8
	movl	$4, %ecx
	call	create_token
	jmp	.L8
.L103:
	movq	8(%rbx), %rbp
	movq	16(%rbx), %rdi
	cmpq	%rdi, %rbp
	jnb	.L36
	movq	(%rbx), %r12
	movzbl	(%r12,%rbp), %edx
	cmpb	$47, %al
	sete	%cl
	cmpb	$47, %dl
	jne	.L37
	testb	%cl, %cl
	je	.L37
	movq	32(%rbx), %rdi
.L38:
	movq	%rbx, %rcx
	call	get_current_char
	cmpb	$10, %al
	je	.L91
	testb	%al, %al
	jne	.L38
.L91:
	movq	8(%rbx), %rax
	leaq	-1(%rax), %rdx
	movq	%rdx, 8(%rbx)
	subq	$1, 32(%rbx)
	testb	%sil, %sil
	je	.L40
	movsbl	%sil, %edx
	movq	%rbx, %rcx
	call	next_token
	jmp	.L8
.L40:
	addq	$1, %rbp
	movq	24(%rbx), %rbx
	subq	%rbp, %rdx
	leaq	(%r12,%rbp), %rcx
	call	create_string
	movq	%rax, %rdx
	leaq	-1(%rdi), %r9
	movq	%rbx, %r8
	movl	$7, %ecx
	call	create_token
	jmp	.L8
.L46:
	movq	%rbx, %rcx
	call	get_current_char
	movq	8(%rbx), %rdx
	cmpq	%rdi, %rdx
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
	movq	%rbx, %rcx
	call	get_current_char
	testb	%sil, %sil
	jne	.L83
	movq	24(%rbx), %rsi
	movq	8(%rbx), %rax
	leaq	-2(%rax), %rdx
	subq	%rbp, %rdx
	movq	%rbp, %rcx
	addq	(%rbx), %rcx
	call	create_string
	movq	%rax, %rdx
	movq	%r13, %r9
	movq	%rsi, %r8
	movl	$7, %ecx
	call	create_token
	jmp	.L8
.L107:
	leaq	.LC2(%rip), %r9
	leaq	__func__.0(%rip), %r8
	movl	$125, %edx
	leaq	.LC3(%rip), %rcx
	call	__assert_func
.L108:
	subq	$1, 8(%rbx)
	subq	$1, 32(%rbx)
	jmp	.L82
.L48:
	movq	24(%rbx), %rsi
	movq	8(%rbx), %rdx
	subq	%rbp, %rdx
	movq	%rbp, %rcx
	addq	(%rbx), %rcx
	call	create_string
	movq	%rax, %rdx
	movq	%r13, %r9
	movq	%rsi, %r8
	movl	$7, %ecx
	call	create_token
	jmp	.L8
.L83:
	movsbl	%sil, %edx
	movq	%rbx, %rcx
	call	next_token
	jmp	.L8
.L110:
	movq	%rbx, %rcx
	call	get_current_char
	movq	32(%rbx), %rax
	movq	.refptr.EQ_SYMBOL(%rip), %rdx
	movq	(%rdx), %rdx
	leaq	-2(%rax), %r9
	movq	24(%rbx), %r8
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L111:
	movq	%rbx, %rcx
	call	get_current_char
	movq	32(%rbx), %rax
	movq	.refptr.NE_SYMBOL(%rip), %rdx
	movq	(%rdx), %rdx
	leaq	-2(%rax), %r9
	movq	24(%rbx), %r8
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L112:
	movq	%rbx, %rcx
	call	get_current_char
	movq	32(%rbx), %rax
	movq	.refptr.LE_SYMBOL(%rip), %rdx
	movq	(%rdx), %rdx
	leaq	-2(%rax), %r9
	movq	24(%rbx), %r8
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L113:
	movq	%rbx, %rcx
	call	get_current_char
	movq	32(%rbx), %rax
	movq	.refptr.GE_SYMBOL(%rip), %rdx
	movq	(%rdx), %rdx
	leaq	-2(%rax), %r9
	movq	24(%rbx), %r8
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L114:
	movq	%rbx, %rcx
	call	get_current_char
	movq	32(%rbx), %rax
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rdx
	movq	(%rdx), %rdx
	leaq	-2(%rax), %r9
	movq	24(%rbx), %r8
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L115:
	movq	%rbx, %rcx
	call	get_current_char
	movq	32(%rbx), %rax
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rdx
	movq	(%rdx), %rdx
	leaq	-2(%rax), %r9
	movq	24(%rbx), %r8
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L116:
	movq	%rbx, %rcx
	call	get_current_char
	movq	32(%rbx), %rax
	leaq	-2(%rax), %r9
	movq	24(%rbx), %r8
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L117:
	movq	%rbx, %rcx
	call	get_current_char
	movq	32(%rbx), %rax
	leaq	-2(%rax), %r9
	movq	24(%rbx), %r8
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L118:
	movq	%rbx, %rcx
	call	get_current_char
	movq	32(%rbx), %rax
	leaq	-2(%rax), %r9
	movq	24(%rbx), %r8
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L119:
	movq	%rbx, %rcx
	call	get_current_char
	movq	32(%rbx), %rax
	leaq	-2(%rax), %r9
	movq	24(%rbx), %r8
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L120:
	movq	%rbx, %rcx
	call	get_current_char
	movq	32(%rbx), %rax
	leaq	-2(%rax), %r9
	movq	24(%rbx), %r8
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L77:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	24(%rbx), %r8
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L76:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	24(%rbx), %r8
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L63:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	24(%rbx), %r8
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L61:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	24(%rbx), %r8
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L73:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	24(%rbx), %r8
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L79:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	24(%rbx), %r8
	movq	.refptr.NOT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L71:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	24(%rbx), %r8
	movq	.refptr.DOT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L65:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	24(%rbx), %r8
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L64:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	24(%rbx), %r8
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L69:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	24(%rbx), %r8
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L74:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	24(%rbx), %r8
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L72:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	24(%rbx), %r8
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L75:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	24(%rbx), %r8
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L70:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	24(%rbx), %r8
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L78:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	24(%rbx), %r8
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L68:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	24(%rbx), %r8
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L66:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	24(%rbx), %r8
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L67:
	movq	32(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	24(%rbx), %r8
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L8
.L60:
	movq	32(%rbx), %rax
	movq	24(%rbx), %rdx
	leaq	-1(%rax), %r8
	leaq	.LC5(%rip), %rcx
	call	lexer_error
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_token
	jmp	.L8
.L43:
	cmpb	$10, %al
	jne	.L45
	movl	%r12d, %edx
.L80:
	addq	$1, 24(%rbx)
	movq	$0, 32(%rbx)
	jmp	.L44
.L45:
	testb	%al, %al
	je	.L108
.L82:
	movq	24(%rbx), %rdx
	movq	%rbp, %r8
	leaq	.LC4(%rip), %rcx
	call	lexer_error
	testb	%sil, %sil
	je	.L48
	movsbl	%sil, %edx
	movq	%rbx, %rcx
	call	next_token
	jmp	.L8
.L109:
	movq	(%rbx), %rdx
	movzbl	(%rdx,%rbp), %edx
	cmpb	$47, %al
	sete	%cl
.L37:
	cmpb	$42, %dl
	jne	.L41
	testb	%cl, %cl
	je	.L41
	addq	$1, %rbp
	movq	32(%rbx), %rax
	leaq	-1(%rax), %r13
	movl	$47, %eax
	movl	$0, %r12d
	jmp	.L42
.L20:
	movq	8(%rbx), %rbp
	movq	16(%rbx), %rdi
	cmpq	%rdi, %rbp
	jb	.L109
.L36:
	cmpb	$47, %al
	sete	%cl
	movl	$0, %edx
.L41:
	cmpb	$61, %dl
	sete	%r8b
	cmpb	$61, %al
	jne	.L49
	testb	%r8b, %r8b
	jne	.L110
.L49:
	cmpb	$33, %al
	jne	.L50
	testb	%r8b, %r8b
	jne	.L111
.L50:
	cmpb	$60, %al
	jne	.L51
	testb	%r8b, %r8b
	jne	.L112
.L51:
	cmpb	$62, %al
	jne	.L52
	testb	%r8b, %r8b
	jne	.L113
.L52:
	cmpb	$43, %al
	jne	.L53
	testb	%r8b, %r8b
	jne	.L114
.L53:
	cmpb	$45, %al
	jne	.L54
	testb	%r8b, %r8b
	jne	.L115
.L54:
	cmpb	$42, %al
	jne	.L55
	testb	%r8b, %r8b
	jne	.L116
.L55:
	testb	%r8b, %r8b
	je	.L56
	testb	%cl, %cl
	jne	.L117
.L56:
	cmpb	$37, %al
	jne	.L57
	testb	%r8b, %r8b
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
	jmp	*%rax
	.section .rdata,"dr"
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
	.globl	create_lexer
	.def	create_lexer;	.scl	2;	.type	32;	.endef
create_lexer:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rsi
	movq	%rdx, %rbx
	movl	$80, %ecx
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	$0, 8(%rax)
	movq	%rbx, 16(%rax)
	movq	$0, 24(%rax)
	movq	$0, 32(%rax)
	movq	$0, 40(%rax)
	movq	$0, 48(%rax)
	movq	$0, 56(%rax)
	movq	$0, 64(%rax)
	movq	$0, 72(%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.globl	get_next_token
	.def	get_next_token;	.scl	2;	.type	32;	.endef
get_next_token:
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbx
	movq	40(%rcx), %rax
	testq	%rax, %rax
	je	.L124
	movq	%rax, 72(%rcx)
	movq	48(%rcx), %rdx
	movq	%rdx, 8(%rcx)
	movq	56(%rcx), %rdx
	movq	%rdx, 24(%rcx)
	movq	64(%rcx), %rdx
	movq	%rdx, 32(%rcx)
	movq	$0, 40(%rcx)
.L123:
	addq	$32, %rsp
	popq	%rbx
	ret
.L124:
	movsbl	%dl, %edx
	call	next_token
	movq	%rax, 72(%rbx)
	jmp	.L123
	.globl	peek_next_token
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
peek_next_token:
	movq	40(%rcx), %rax
	testq	%rax, %rax
	je	.L133
	ret
.L133:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rbx
	movq	8(%rcx), %rbp
	movq	24(%rcx), %rdi
	movq	32(%rcx), %rsi
	movsbl	%dl, %edx
	call	get_next_token
	movq	8(%rbx), %rdx
	movq	%rdx, 48(%rbx)
	movq	24(%rbx), %rdx
	movq	%rdx, 56(%rbx)
	movq	32(%rbx), %rdx
	movq	%rdx, 64(%rbx)
	movq	%rbp, 8(%rbx)
	movq	%rdi, 24(%rbx)
	movq	%rsi, 32(%rbx)
	movq	%rax, 40(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.globl	peek_current_token
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
peek_current_token:
	movq	72(%rcx), %rax
	ret
	.globl	reset_lexer
	.def	reset_lexer;	.scl	2;	.type	32;	.endef
reset_lexer:
	movq	$0, 8(%rcx)
	movq	$0, 24(%rcx)
	movq	$0, 32(%rcx)
	movq	$0, 40(%rcx)
	movq	$0, 48(%rcx)
	movq	$0, 56(%rcx)
	movq	$0, 64(%rcx)
	movq	$0, 72(%rcx)
	ret
	.section .rdata,"dr"
	.align 8
__func__.0:
	.ascii "next_token\0"
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	is_keyword;	.scl	2;	.type	32;	.endef
	.def	__assert_func;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.ASSIGN_SYMBOL, "dr"
	.globl	.refptr.ASSIGN_SYMBOL
	.linkonce	discard
.refptr.ASSIGN_SYMBOL:
	.quad	ASSIGN_SYMBOL
	.section	.rdata$.refptr.GT_SYMBOL, "dr"
	.globl	.refptr.GT_SYMBOL
	.linkonce	discard
.refptr.GT_SYMBOL:
	.quad	GT_SYMBOL
	.section	.rdata$.refptr.LT_SYMBOL, "dr"
	.globl	.refptr.LT_SYMBOL
	.linkonce	discard
.refptr.LT_SYMBOL:
	.quad	LT_SYMBOL
	.section	.rdata$.refptr.MOD_SYMBOL, "dr"
	.globl	.refptr.MOD_SYMBOL
	.linkonce	discard
.refptr.MOD_SYMBOL:
	.quad	MOD_SYMBOL
	.section	.rdata$.refptr.DIV_SYMBOL, "dr"
	.globl	.refptr.DIV_SYMBOL
	.linkonce	discard
.refptr.DIV_SYMBOL:
	.quad	DIV_SYMBOL
	.section	.rdata$.refptr.MUL_SYMBOL, "dr"
	.globl	.refptr.MUL_SYMBOL
	.linkonce	discard
.refptr.MUL_SYMBOL:
	.quad	MUL_SYMBOL
	.section	.rdata$.refptr.SUB_SYMBOL, "dr"
	.globl	.refptr.SUB_SYMBOL
	.linkonce	discard
.refptr.SUB_SYMBOL:
	.quad	SUB_SYMBOL
	.section	.rdata$.refptr.ADD_SYMBOL, "dr"
	.globl	.refptr.ADD_SYMBOL
	.linkonce	discard
.refptr.ADD_SYMBOL:
	.quad	ADD_SYMBOL
	.section	.rdata$.refptr.SEMICOLON_SYMBOL, "dr"
	.globl	.refptr.SEMICOLON_SYMBOL
	.linkonce	discard
.refptr.SEMICOLON_SYMBOL:
	.quad	SEMICOLON_SYMBOL
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
	.section	.rdata$.refptr.DOT_SYMBOL, "dr"
	.globl	.refptr.DOT_SYMBOL
	.linkonce	discard
.refptr.DOT_SYMBOL:
	.quad	DOT_SYMBOL
	.section	.rdata$.refptr.NOT_SYMBOL, "dr"
	.globl	.refptr.NOT_SYMBOL
	.linkonce	discard
.refptr.NOT_SYMBOL:
	.quad	NOT_SYMBOL
	.section	.rdata$.refptr.COMMA_SYMBOL, "dr"
	.globl	.refptr.COMMA_SYMBOL
	.linkonce	discard
.refptr.COMMA_SYMBOL:
	.quad	COMMA_SYMBOL
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
	.section	.rdata$.refptr.OR_SYMBOL, "dr"
	.globl	.refptr.OR_SYMBOL
	.linkonce	discard
.refptr.OR_SYMBOL:
	.quad	OR_SYMBOL
	.section	.rdata$.refptr.AND_SYMBOL, "dr"
	.globl	.refptr.AND_SYMBOL
	.linkonce	discard
.refptr.AND_SYMBOL:
	.quad	AND_SYMBOL
	.section	.rdata$.refptr.MOD_ASSIGN_SYMBOL, "dr"
	.globl	.refptr.MOD_ASSIGN_SYMBOL
	.linkonce	discard
.refptr.MOD_ASSIGN_SYMBOL:
	.quad	MOD_ASSIGN_SYMBOL
	.section	.rdata$.refptr.DIV_ASSIGN_SYMBOL, "dr"
	.globl	.refptr.DIV_ASSIGN_SYMBOL
	.linkonce	discard
.refptr.DIV_ASSIGN_SYMBOL:
	.quad	DIV_ASSIGN_SYMBOL
	.section	.rdata$.refptr.MUL_ASSIGN_SYMBOL, "dr"
	.globl	.refptr.MUL_ASSIGN_SYMBOL
	.linkonce	discard
.refptr.MUL_ASSIGN_SYMBOL:
	.quad	MUL_ASSIGN_SYMBOL
	.section	.rdata$.refptr.SUB_ASSIGN_SYMBOL, "dr"
	.globl	.refptr.SUB_ASSIGN_SYMBOL
	.linkonce	discard
.refptr.SUB_ASSIGN_SYMBOL:
	.quad	SUB_ASSIGN_SYMBOL
	.section	.rdata$.refptr.ADD_ASSIGN_SYMBOL, "dr"
	.globl	.refptr.ADD_ASSIGN_SYMBOL
	.linkonce	discard
.refptr.ADD_ASSIGN_SYMBOL:
	.quad	ADD_ASSIGN_SYMBOL
	.section	.rdata$.refptr.GE_SYMBOL, "dr"
	.globl	.refptr.GE_SYMBOL
	.linkonce	discard
.refptr.GE_SYMBOL:
	.quad	GE_SYMBOL
	.section	.rdata$.refptr.LE_SYMBOL, "dr"
	.globl	.refptr.LE_SYMBOL
	.linkonce	discard
.refptr.LE_SYMBOL:
	.quad	LE_SYMBOL
	.section	.rdata$.refptr.NE_SYMBOL, "dr"
	.globl	.refptr.NE_SYMBOL
	.linkonce	discard
.refptr.NE_SYMBOL:
	.quad	NE_SYMBOL
	.section	.rdata$.refptr.EQ_SYMBOL, "dr"
	.globl	.refptr.EQ_SYMBOL
	.linkonce	discard
.refptr.EQ_SYMBOL:
	.quad	EQ_SYMBOL
