	.file	"D:\\TC\\src\\lexer.c"
	.text
	.def	get_current_char;	.scl	3;	.type	32;	.endef
get_current_char:
	movq	8(%rcx), %rax
	xorl	%edx, %edx
	cmpq	16(%rcx), %rax
	jnb	.L1
	movq	(%rcx), %rdx
	leaq	1(%rax), %r8
	incq	32(%rcx)
	movq	%r8, 8(%rcx)
	movb	(%rdx,%rax), %dl
.L1:
	movl	%edx, %eax
	ret
	.def	create_token;	.scl	3;	.type	32;	.endef
create_token:
	pushq	%rbp
	movl	%ecx, %ebp
	movl	$32, %ecx
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	movq	%r8, %rsi
	pushq	%rbx
	movq	%r9, %rbx
	subq	$40, %rsp
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
.LC0:
	.ascii "Lexer Error at Line %zu, Column %zu: %s\12\0"
	.text
	.def	lexer_error;	.scl	3;	.type	32;	.endef
lexer_error:
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	movq	%r8, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$48, %rsp
	call	__getreent
	leaq	1(%rsi), %r9
	leaq	1(%rbx), %r8
	movq	24(%rax), %rcx
	movq	%rdi, 32(%rsp)
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
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	movl	%edx, %edi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$48, %rsp
	call	get_current_char
	testb	%al, %al
	jne	.L10
	movq	32(%rcx), %r9
	movq	24(%rcx), %r8
	jmp	.L184
.L10:
	movl	%eax, %edx
	andl	$-5, %edx
	cmpb	$9, %dl
	je	.L185
	cmpb	$32, %al
	je	.L185
	cmpb	$10, %al
	jne	.L13
	xorl	%r9d, %r9d
	incq	24(%rcx)
	movq	%r9, 32(%rcx)
.L185:
	addq	$48, %rsp
	movsbl	%dil, %edx
	movq	%rbx, %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	next_token
.L13:
	movq	8(%rcx), %rsi
	cmpb	$57, %al
	jg	.L14
	cmpb	$47, %al
	jg	.L15
	cmpb	$34, %al
	jne	.L17
	movabsq	$-17179870210, %r9
	movq	32(%rcx), %rax
	leaq	-1(%rax), %rbp
	call	get_current_char
	movl	%eax, %edi
	jmp	.L30
.L14:
	leal	-65(%rax), %edx
	cmpb	$57, %dl
	ja	.L17
	movabsq	$288230372997595135, %r11
	btq	%rdx, %r11
	jnc	.L17
	movq	32(%rbx), %rdi
	leaq	-1(%rsi), %r10
	leaq	-1(%rdi), %r9
.L20:
	cmpb	$57, %al
	jg	.L21
	cmpb	$47, %al
	jle	.L23
.L22:
	movq	%rbx, %rcx
	call	get_current_char
	jmp	.L20
.L21:
	subl	$65, %eax
	cmpb	$57, %al
	ja	.L23
	btq	%rax, %r11
	jc	.L22
.L23:
	movq	8(%rbx), %rdx
	movq	(%rbx), %rcx
	movq	%r9, 40(%rsp)
	decq	32(%rbx)
	leaq	-1(%rdx), %rax
	addq	%r10, %rcx
	subq	%rsi, %rdx
	movq	%rax, 8(%rbx)
	call	create_string
	movq	%rax, %rcx
	movq	%rax, 32(%rsp)
	call	is_keyword
	movq	24(%rbx), %r8
	movq	32(%rsp), %rdx
	movl	$6, %ecx
	testb	%al, %al
	movq	40(%rsp), %r9
	jne	.L186
	movl	$1, %ecx
	jmp	.L186
.L15:
	movq	32(%rcx), %rax
	leaq	-1(%rsi), %r10
	leaq	-1(%rax), %rdi
.L26:
	movq	%rbx, %rcx
	call	get_current_char
	leal	-48(%rax), %edx
	cmpb	$9, %dl
	jbe	.L26
	movq	8(%rbx), %rdx
	movq	(%rbx), %r9
	movl	$2, %ebp
	cmpq	16(%rbx), %rdx
	jnb	.L27
	cmpb	$46, %al
	jne	.L27
	movb	(%r9,%rdx), %al
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L27
.L183:
	call	get_current_char
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L191
	movq	%rbx, %rcx
	jmp	.L183
.L191:
	movl	$3, %ebp
.L27:
	movq	8(%rbx), %rdx
	decq	32(%rbx)
	leaq	(%r9,%r10), %rcx
	movq	24(%rbx), %r8
	leaq	-1(%rdx), %rax
	subq	%rsi, %rdx
	movq	%rax, 8(%rbx)
	movq	%r8, 32(%rsp)
	call	create_string
	movq	32(%rsp), %r8
	movq	%rdi, %r9
	movl	%ebp, %ecx
	movq	%rax, %rdx
	jmp	.L186
.L193:
	btq	%rdi, %r9
	jnc	.L192
.L31:
	movq	%rbx, %rcx
	call	get_current_char
	movl	%eax, %edi
.L30:
	cmpb	$34, %dil
	ja	.L31
	jmp	.L193
.L192:
	movq	24(%rbx), %r12
	cmpb	$34, %dil
	je	.L32
	leaq	-1(%rsi), %r8
	movq	%r12, %rdx
	leaq	.LC1(%rip), %rcx
	call	lexer_error
	cmpb	$10, %dil
	jne	.L33
	xorl	%r8d, %r8d
	incq	24(%rbx)
	movq	%r8, 32(%rbx)
.L33:
	movq	24(%rbx), %r8
	movq	%rsi, %rdx
	addq	(%rbx), %rsi
	notq	%rdx
	movq	%rsi, %rcx
	addq	8(%rbx), %rdx
	movq	%r8, 32(%rsp)
	call	create_string
	movq	32(%rsp), %r8
	movq	%rbp, %r9
	movq	%rax, %rdx
	jmp	.L188
.L32:
	movq	%rsi, %rdx
	addq	(%rbx), %rsi
	notq	%rdx
	movq	%rsi, %rcx
	addq	8(%rbx), %rdx
	call	create_string
	movq	%rbp, %r9
	movq	%r12, %r8
	movq	%rax, %rdx
.L188:
	movl	$4, %ecx
	jmp	.L186
.L17:
	movq	16(%rbx), %r9
	xorl	%ecx, %ecx
	cmpq	%r9, %rsi
	jnb	.L34
	movq	(%rbx), %rdx
	movb	(%rdx,%rsi), %cl
.L34:
	cmpb	$47, %al
	sete	%r8b
	cmpb	$47, %cl
	jne	.L35
	testb	%r8b, %r8b
	je	.L35
	movq	32(%rbx), %rbp
.L36:
	movq	%rbx, %rcx
	call	get_current_char
	cmpb	$10, %al
	je	.L91
	testb	%al, %al
	jne	.L36
.L91:
	movq	8(%rbx), %rax
	decq	32(%rbx)
	leaq	-1(%rax), %rdx
	movq	%rdx, 8(%rbx)
	testb	%dil, %dil
	jne	.L185
	movq	24(%rbx), %r8
	leaq	1(%rsi), %rcx
	subq	%rcx, %rdx
	addq	(%rbx), %rcx
	movq	%r8, 32(%rsp)
	call	create_string
	leaq	-1(%rbp), %r9
	movq	%rax, %rdx
	jmp	.L189
.L35:
	cmpb	$42, %cl
	jne	.L39
	testb	%r8b, %r8b
	je	.L39
	movq	32(%rbx), %rax
	incq	%rsi
	movb	$42, %dl
	leaq	-1(%rax), %rbp
	movb	$47, %al
.L40:
	cmpb	$42, %al
	je	.L194
.L44:
	movq	%rbx, %rcx
	call	get_current_char
	movq	8(%rbx), %rdx
	cmpq	%r9, %rdx
	jnb	.L41
	movq	(%rbx), %rcx
	movb	(%rcx,%rdx), %dl
	cmpb	$10, %al
	jne	.L42
	jmp	.L80
.L41:
	cmpb	$10, %al
	jne	.L43
	xorl	%edx, %edx
.L80:
	xorl	%ecx, %ecx
	incq	24(%rbx)
	movq	%rcx, 32(%rbx)
.L42:
	testb	%dl, %dl
	je	.L43
	testb	%al, %al
	jne	.L40
	leaq	.LC2(%rip), %r9
	leaq	__func__.0(%rip), %r8
	movl	$125, %edx
	leaq	.LC3(%rip), %rcx
	call	__assert_func
.L194:
	cmpb	$47, %dl
	jne	.L44
	jmp	.L195
.L43:
	testb	%al, %al
	jne	.L84
	decq	8(%rbx)
	decq	32(%rbx)
.L84:
	movq	24(%rbx), %rdx
	movq	%rsi, %r8
	leaq	.LC4(%rip), %rcx
	call	lexer_error
	testb	%dil, %dil
	jne	.L185
	movq	24(%rbx), %r8
	movq	8(%rbx), %rdx
	movq	%r8, 32(%rsp)
.L190:
	subq	%rsi, %rdx
	addq	(%rbx), %rsi
	movq	%rsi, %rcx
	call	create_string
	movq	%rbp, %r9
	movq	%rax, %rdx
.L189:
	movq	32(%rsp), %r8
	movl	$7, %ecx
	jmp	.L186
.L39:
	cmpb	$61, %cl
	sete	%dl
	cmpb	$61, %al
	jne	.L47
	testb	%dl, %dl
	je	.L47
	movq	%rbx, %rcx
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %r8
	leaq	-2(%rax), %r9
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	jmp	.L187
.L47:
	cmpb	$33, %al
	jne	.L48
	testb	%dl, %dl
	je	.L48
	movq	%rbx, %rcx
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %r8
	leaq	-2(%rax), %r9
	movq	.refptr.NE_SYMBOL(%rip), %rax
	jmp	.L187
.L48:
	cmpb	$60, %al
	jne	.L49
	testb	%dl, %dl
	je	.L49
	movq	%rbx, %rcx
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %r8
	leaq	-2(%rax), %r9
	movq	.refptr.LE_SYMBOL(%rip), %rax
	jmp	.L187
.L49:
	cmpb	$62, %al
	jne	.L50
	testb	%dl, %dl
	je	.L50
	movq	%rbx, %rcx
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %r8
	leaq	-2(%rax), %r9
	movq	.refptr.GE_SYMBOL(%rip), %rax
	jmp	.L187
.L50:
	cmpb	$43, %al
	jne	.L51
	testb	%dl, %dl
	je	.L51
	movq	%rbx, %rcx
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %r8
	leaq	-2(%rax), %r9
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L187
.L51:
	cmpb	$45, %al
	jne	.L52
	testb	%dl, %dl
	je	.L52
	movq	%rbx, %rcx
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %r8
	leaq	-2(%rax), %r9
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L187
.L52:
	cmpb	$42, %al
	jne	.L53
	testb	%dl, %dl
	je	.L53
	movq	%rbx, %rcx
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %r8
	leaq	-2(%rax), %r9
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L187
.L53:
	testb	%r8b, %r8b
	je	.L54
	testb	%dl, %dl
	je	.L54
	movq	%rbx, %rcx
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %r8
	leaq	-2(%rax), %r9
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L187
.L54:
	cmpb	$37, %al
	jne	.L55
	testb	%dl, %dl
	je	.L55
	movq	%rbx, %rcx
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %r8
	leaq	-2(%rax), %r9
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L187
.L55:
	cmpb	$38, %al
	jne	.L56
	cmpb	$38, %cl
	jne	.L56
	movq	%rbx, %rcx
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %r8
	leaq	-2(%rax), %r9
	movq	.refptr.AND_SYMBOL(%rip), %rax
	jmp	.L187
.L56:
	cmpb	$124, %al
	jne	.L57
	cmpb	$124, %cl
	jne	.L57
	movq	%rbx, %rcx
	call	get_current_char
	movq	32(%rbx), %rax
	movq	24(%rbx), %r8
	leaq	-2(%rax), %r9
	movq	.refptr.OR_SYMBOL(%rip), %rax
	jmp	.L187
.L57:
	movq	32(%rbx), %rdi
	movq	24(%rbx), %rdx
	leaq	-1(%rdi), %r9
	cmpb	$62, %al
	jg	.L58
	cmpb	$32, %al
	jle	.L59
	subl	$33, %eax
	cmpb	$29, %al
	ja	.L59
	leaq	.L61(%rip), %rcx
	movzbl	%al, %eax
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L61:
	.long	.L74-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L73-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L72-.L61
	.long	.L71-.L61
	.long	.L70-.L61
	.long	.L69-.L61
	.long	.L68-.L61
	.long	.L67-.L61
	.long	.L66-.L61
	.long	.L65-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L64-.L61
	.long	.L63-.L61
	.long	.L62-.L61
	.long	.L60-.L61
	.text
.L58:
	cmpb	$123, %al
	je	.L75
	jg	.L76
	cmpb	$91, %al
	je	.L77
	cmpb	$93, %al
	jne	.L59
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax
	movq	%rdx, %r8
	jmp	.L187
.L76:
	cmpb	$125, %al
	jne	.L59
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	%rdx, %r8
	jmp	.L187
.L72:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	%rdx, %r8
	jmp	.L187
.L71:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	%rdx, %r8
	jmp	.L187
.L75:
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	%rdx, %r8
	jmp	.L187
.L68:
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	%rdx, %r8
	jmp	.L187
.L74:
	movq	.refptr.NOT_SYMBOL(%rip), %rax
	movq	%rdx, %r8
	jmp	.L187
.L66:
	movq	.refptr.DOT_SYMBOL(%rip), %rax
	movq	%rdx, %r8
	jmp	.L187
.L77:
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax
	movq	%rdx, %r8
	jmp	.L187
.L64:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	%rdx, %r8
	jmp	.L187
.L69:
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	%rdx, %r8
	jmp	.L187
.L67:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	%rdx, %r8
	jmp	.L187
.L70:
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	%rdx, %r8
	jmp	.L187
.L65:
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	%rdx, %r8
	jmp	.L187
.L73:
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	%rdx, %r8
	jmp	.L187
.L63:
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	%rdx, %r8
	jmp	.L187
.L60:
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	%rdx, %r8
	jmp	.L187
.L62:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	%rdx, %r8
.L187:
	movq	(%rax), %rdx
	movl	$5, %ecx
	jmp	.L186
.L59:
	movq	%r9, %r8
	leaq	.LC5(%rip), %rcx
	call	lexer_error
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
.L184:
	xorl	%edx, %edx
	xorl	%ecx, %ecx
.L186:
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	create_token
.L195:
	movq	%rbx, %rcx
	call	get_current_char
	testb	%dil, %dil
	jne	.L185
	movq	24(%rbx), %r8
	movq	8(%rbx), %rax
	movq	%r8, 32(%rsp)
	leaq	-2(%rax), %rdx
	jmp	.L190
	.globl	create_lexer
	.def	create_lexer;	.scl	2;	.type	32;	.endef
create_lexer:
	pushq	%rsi
	movq	%rcx, %rsi
	movl	$80, %ecx
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$40, %rsp
	call	alloc_memory
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rsi, (%rax)
	movq	%rdx, 8(%rax)
	movq	%rbx, 16(%rax)
	movq	%rcx, 24(%rax)
	movq	%rcx, 32(%rax)
	movq	%rcx, 40(%rax)
	movq	%rcx, 48(%rax)
	movq	%rcx, 56(%rax)
	movq	%rcx, 64(%rax)
	movq	%rcx, 72(%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.globl	get_next_token
	.def	get_next_token;	.scl	2;	.type	32;	.endef
get_next_token:
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$32, %rsp
	movq	40(%rcx), %rax
	testq	%rax, %rax
	je	.L199
	movq	48(%rcx), %rdx
	movq	%rax, 72(%rcx)
	movq	%rdx, 8(%rcx)
	movq	56(%rcx), %rdx
	movq	%rdx, 24(%rcx)
	movq	64(%rcx), %rdx
	movq	%rdx, 32(%rcx)
	xorl	%edx, %edx
	movq	%rdx, 40(%rcx)
	jmp	.L198
.L199:
	movsbl	%dl, %edx
	call	next_token
	movq	%rax, 72(%rbx)
.L198:
	addq	$32, %rsp
	popq	%rbx
	ret
	.globl	peek_next_token
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
peek_next_token:
	movq	40(%rcx), %rax
	testq	%rax, %rax
	jne	.L205
	pushq	%rbp
	movsbl	%dl, %edx
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$40, %rsp
	movq	8(%rcx), %rbp
	movq	24(%rcx), %rdi
	movq	32(%rcx), %rsi
	call	get_next_token
	movq	8(%rbx), %rdx
	movq	%rbp, 8(%rbx)
	movq	%rax, 40(%rbx)
	movq	%rdx, 48(%rbx)
	movq	24(%rbx), %rdx
	movq	%rdi, 24(%rbx)
	movq	%rdx, 56(%rbx)
	movq	32(%rbx), %rdx
	movq	%rsi, 32(%rbx)
	movq	%rdx, 64(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L205:
	ret
	.globl	peek_current_token
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
peek_current_token:
	movq	72(%rcx), %rax
	ret
	.globl	reset_lexer
	.def	reset_lexer;	.scl	2;	.type	32;	.endef
reset_lexer:
	xorl	%eax, %eax
	movq	%rax, 8(%rcx)
	movq	%rax, 24(%rcx)
	movq	%rax, 32(%rcx)
	movq	%rax, 40(%rcx)
	movq	%rax, 48(%rcx)
	movq	%rax, 56(%rcx)
	movq	%rax, 64(%rcx)
	movq	%rax, 72(%rcx)
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
