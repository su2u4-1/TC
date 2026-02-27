	.file	"D:\\TC\\src\\lexer.c"
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Lexer Error at Line %zu, Column %zu: %s\12\0"
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
	.p2align 4
	.def	next_token;	.scl	3;	.type	32;	.endef
next_token:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%r13
	movl	%edx, %r13d
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$48, %rsp
	andq	$-16, %rsp
	subq	$48, %rsp
	movq	8(%rcx), %r14
	movq	16(%rcx), %rdx
	movq	32(%rcx), %r12
	movaps	%xmm6, 48(%rsp)
	movaps	%xmm7, 64(%rsp)
	movaps	%xmm8, 80(%rsp)
	cmpq	%rdx, %r14
	jnb	.L2
	leaq	1(%r12), %rsi
	leaq	1(%r14), %rdi
	movq	%rsi, 32(%rcx)
	movq	(%rcx), %rcx
	movq	%rdi, 8(%rbx)
	leaq	(%rcx,%r14), %r9
	movzbl	(%r9), %eax
	cmpb	$32, %al
	ja	.L3
	leaq	.L5(%rip), %r10
	movzbl	%al, %r8d
	movslq	(%r10,%r8,4), %r8
	addq	%r10, %r8
	jmp	*%r8
	.section .rdata,"dr"
	.align 4
.L5:
	.long	.L99-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L203-.L5
	.long	.L6-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L203-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L203-.L5
	.text
	.p2align 4,,10
	.p2align 3
.L99:
	movq	%rsi, %r12
	.p2align 4,,10
	.p2align 3
.L2:
	movq	24(%rbx), %xmm6
	movq	%r12, %xmm1
	movl	$32, %ecx
	punpcklqdq	%xmm1, %xmm6
	call	alloc_memory
	movl	$0, 24(%rax)
	movq	$0, (%rax)
	movups	%xmm6, 8(%rax)
.L1:
	movaps	48(%rsp), %xmm6
	movaps	64(%rsp), %xmm7
	movaps	80(%rsp), %xmm8
	leaq	-48(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	addq	$1, 24(%rbx)
	movq	$0, 32(%rbx)
.L203:
	movaps	48(%rsp), %xmm6
	movaps	64(%rsp), %xmm7
	movsbl	%r13b, %edx
	movq	%rbx, %rcx
	movaps	80(%rsp), %xmm8
	leaq	-48(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	jmp	next_token
	.p2align 4,,10
	.p2align 3
.L3:
	cmpb	$90, %al
	jg	.L8
	cmpb	$64, %al
	jg	.L9
	cmpb	$34, %al
	je	.L10
	leal	-48(%rax), %r8d
	cmpb	$9, %r8b
	ja	.L11
	leaq	(%rdx,%r12), %r11
	subq	%r14, %r11
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L205:
	leal	-48(%rax), %r10d
	leaq	1(%rdi), %r8
	cmpb	$9, %r10b
	ja	.L22
	addq	$1, %rsi
	movq	%r8, 8(%rbx)
	movq	%r8, %rdi
	movq	%rsi, 32(%rbx)
	movzbl	-1(%rcx,%r8), %eax
.L12:
	cmpq	%rsi, %r11
	jne	.L205
	leal	-48(%rax), %r8d
	cmpb	$9, %r8b
	ja	.L22
.L103:
	movl	$2, %r13d
.L23:
	leaq	-1(%rdi), %rdx
	subq	$1, %rsi
	movq	%r12, %xmm4
	movq	%r9, %rcx
	movq	%rdx, 8(%rbx)
	movq	24(%rbx), %xmm6
	subq	%r14, %rdx
	movq	%rsi, 32(%rbx)
	punpcklqdq	%xmm4, %xmm6
	call	create_string
	movl	$32, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movl	%r13d, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L8:
	cmpb	$95, %al
	jne	.L206
.L9:
	movabsq	$288230372997595135, %r8
	addq	%r12, %rdx
	subq	%r14, %rdx
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L208:
	cmpb	$57, %al
	jle	.L207
	subl	$65, %eax
	cmpb	$57, %al
	ja	.L15
	btq	%rax, %r8
	jnc	.L15
.L17:
	addq	$1, %rdi
	addq	$1, %rsi
	movq	%rsi, 32(%rbx)
	movq	%rdi, 8(%rbx)
	movzbl	-1(%rcx,%rdi), %eax
.L14:
	cmpq	%rsi, %rdx
	jne	.L208
.L15:
	leaq	-1(%rdi), %rdx
	subq	$1, %rsi
	movq	%r9, %rcx
	movq	%rdx, 8(%rbx)
	subq	%r14, %rdx
	movq	%rsi, 32(%rbx)
	call	create_string
	movq	%rax, %rcx
	movq	%rax, %rsi
	call	is_keyword
	movq	24(%rbx), %xmm6
	testb	%al, %al
	je	.L19
	movq	%r12, %xmm2
	movl	$32, %ecx
	punpcklqdq	%xmm2, %xmm6
	call	alloc_memory
	movl	$6, 24(%rax)
	movq	%rsi, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L207:
	cmpb	$47, %al
	jg	.L17
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L206:
	leal	-97(%rax), %r8d
	cmpb	$25, %r8b
	jbe	.L9
	cmpq	%rdx, %rdi
	jnb	.L209
	movzbl	1(%rcx,%r14), %r9d
	xorl	%r10d, %r10d
.L41:
	movq	24(%rbx), %xmm6
	cmpb	$61, %r9b
	movq	%r12, %xmm5
	sete	%r8b
	movdqa	%xmm6, %xmm8
	movl	%r8d, %ecx
	punpcklqdq	%xmm5, %xmm8
	movdqa	%xmm8, %xmm7
	cmpb	$61, %al
	jne	.L91
	testb	%r8b, %r8b
	je	.L91
	addq	$2, %r12
	addq	$2, %r14
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	%r12, 32(%rbx)
	movq	%r14, 8(%rbx)
.L202:
	movq	(%rax), %rbx
	movl	$32, %ecx
	call	alloc_memory
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm8, 8(%rax)
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L19:
	movq	%r12, %xmm3
	movl	$32, %ecx
	punpcklqdq	%xmm3, %xmm6
	call	alloc_memory
	movl	$1, 24(%rax)
	movq	%rsi, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L10:
	xorl	%r13d, %r13d
	cmpq	%rdx, %rdi
	jnb	.L26
	leaq	2(%r12), %rax
	movq	%rax, 32(%rbx)
	leaq	2(%r14), %rax
	movq	%rax, 8(%rbx)
	movzbl	1(%rcx,%r14), %r13d
.L26:
	movabsq	$-17179870210, %r9
	jmp	.L27
	.p2align 4,,10
	.p2align 3
.L211:
	leaq	1(%rax), %r8
	addq	$1, 32(%rbx)
	movq	%r8, 8(%rbx)
	movzbl	(%rcx,%rax), %r13d
.L27:
	cmpb	$34, %r13b
	jbe	.L210
.L29:
	movq	8(%rbx), %rax
	cmpq	%rdx, %rax
	jb	.L211
	xorl	%r13d, %r13d
.L28:
	movq	24(%rbx), %rsi
	cmpb	$34, %r13b
	je	.L30
	call	__getreent
	movq	%rdi, %r9
	leaq	1(%rsi), %r8
	leaq	.LC0(%rip), %rdx
	movq	24(%rax), %rcx
	leaq	.LC1(%rip), %rax
	movq	%rax, 32(%rsp)
	call	fprintf
	cmpb	$10, %r13b
	je	.L31
	movq	24(%rbx), %xmm6
.L32:
	movq	%rdi, %rdx
	addq	(%rbx), %rdi
	movq	%r12, %xmm5
	movq	%rdi, %rcx
	notq	%rdx
	punpcklqdq	%xmm5, %xmm6
	addq	8(%rbx), %rdx
	call	create_string
	movl	$32, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movl	$4, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L210:
	btq	%r13, %r9
	jc	.L29
	jmp	.L28
.L11:
	cmpb	$47, %al
	sete	%r8b
	movl	%r8d, %r10d
	cmpq	%rdx, %rdi
	jnb	.L97
	movzbl	1(%rcx,%r14), %r9d
	cmpb	$47, %r9b
	jne	.L35
	testb	%r8b, %r8b
	je	.L35
	addq	%r12, %rdx
	movl	$47, %r8d
	subq	%r14, %rdx
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L212:
	leaq	1(%rdi), %rax
	testb	%r8b, %r8b
	je	.L37
	cmpb	$10, %r8b
	je	.L37
	addq	$1, %rsi
	movq	%rax, 8(%rbx)
	movq	%rax, %rdi
	movq	%rsi, 32(%rbx)
	movzbl	-1(%rcx,%rax), %r8d
.L36:
	cmpq	%rdx, %rsi
	jne	.L212
.L37:
	leaq	-1(%rdi), %rdx
	subq	$1, %rsi
	movq	%rdx, 8(%rbx)
	movq	%rsi, 32(%rbx)
	testb	%r13b, %r13b
	jne	.L203
	movq	24(%rbx), %xmm6
	addq	$2, %r14
	movq	%r12, %xmm7
	subq	%r14, %rdx
	addq	%r14, %rcx
	punpcklqdq	%xmm7, %xmm6
.L200:
	call	create_string
	movl	$32, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movl	$7, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L1
.L30:
	movq	%rdi, %rdx
	addq	%rdi, %rcx
	notq	%rdx
	addq	8(%rbx), %rdx
	call	create_string
	movl	$32, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movq	%rsi, %xmm0
	movq	%r12, %xmm5
	punpcklqdq	%xmm5, %xmm0
	movl	$4, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L1
.L31:
	movq	24(%rbx), %rax
	movq	$0, 32(%rbx)
	addq	$1, %rax
	movq	%rax, 24(%rbx)
	movq	%rax, %xmm6
	jmp	.L32
.L209:
	xorl	%r10d, %r10d
.L97:
	movq	24(%rbx), %xmm6
	movq	%r12, %xmm2
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	movdqa	%xmm6, %xmm7
	punpcklqdq	%xmm2, %xmm7
.L34:
	cmpb	$43, %al
	jne	.L55
	testb	%cl, %cl
	je	.L55
	cmpq	%rdx, %rdi
	jnb	.L56
	addq	$2, %r12
	addq	$2, %r14
	movq	%r12, 32(%rbx)
	movq	%r14, 8(%rbx)
.L56:
	movq	32(%rbx), %rax
	subq	$2, %rax
	movq	%rax, %xmm7
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	punpcklqdq	%xmm7, %xmm6
.L201:
	movq	(%rax), %rbx
	movl	$32, %ecx
	call	alloc_memory
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L1
.L55:
	cmpb	$45, %al
	jne	.L57
	testb	%cl, %cl
	je	.L57
	cmpq	%rdx, %rdi
	jnb	.L58
	addq	$2, %r12
	addq	$2, %r14
	movq	%r12, 32(%rbx)
	movq	%r14, 8(%rbx)
.L58:
	movq	32(%rbx), %rax
	subq	$2, %rax
	movq	%rax, %xmm3
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	punpcklqdq	%xmm3, %xmm6
	jmp	.L201
.L35:
	cmpb	$42, %r9b
	jne	.L41
	testb	%r8b, %r8b
	je	.L41
	leaq	2(%r14), %rsi
	movl	$42, %r8d
	movl	$47, %eax
	.p2align 4,,10
	.p2align 3
.L42:
	cmpb	$42, %al
	jne	.L165
	cmpb	$47, %r8b
	je	.L213
.L165:
	cmpq	%rdi, %rdx
	je	.L43
	addq	$1, %rdi
	addq	$1, 32(%rbx)
	movq	%rdi, 8(%rbx)
	movzbl	-1(%rcx,%rdi), %eax
	cmpq	%rdx, %rdi
	jnb	.L214
	movzbl	(%rcx,%rdi), %r8d
	cmpb	$10, %al
	jne	.L47
	addq	$1, 24(%rbx)
	movq	$0, 32(%rbx)
	testb	%r8b, %r8b
	jne	.L165
	jmp	.L198
	.p2align 4,,10
	.p2align 3
.L47:
	testb	%r8b, %r8b
	je	.L45
	testb	%al, %al
	jne	.L42
	leaq	.LC2(%rip), %r9
	leaq	__func__.0(%rip), %r8
	movl	$125, %edx
	leaq	.LC3(%rip), %rcx
	call	__assert_func
	.p2align 4,,10
	.p2align 3
.L214:
	cmpb	$10, %al
	jne	.L45
	movq	24(%rbx), %rax
	movq	$0, 32(%rbx)
	leaq	1(%rax), %rdi
	movq	%rdi, 24(%rbx)
.L46:
	call	__getreent
	leaq	3(%r14), %r9
	leaq	1(%rdi), %r8
	movq	24(%rax), %rcx
	leaq	.LC4(%rip), %rax
	leaq	.LC0(%rip), %rdx
	movq	%rax, 32(%rsp)
	call	fprintf
	testb	%r13b, %r13b
	jne	.L203
	movq	8(%rbx), %rdx
	movq	24(%rbx), %xmm6
	movq	%r12, %xmm3
	subq	%rsi, %rdx
	addq	(%rbx), %rsi
	punpcklqdq	%xmm3, %xmm6
	movq	%rsi, %rcx
	jmp	.L200
.L213:
	movq	8(%rbx), %rax
	cmpq	%rdx, %rax
	jnb	.L95
	addq	$1, %rax
	addq	$1, 32(%rbx)
	movq	%rax, 8(%rbx)
.L95:
	testb	%r13b, %r13b
	jne	.L203
	movq	24(%rbx), %xmm6
	movq	%r12, %xmm4
	subq	%rsi, %rax
	addq	%rsi, %rcx
	leaq	-2(%rax), %rdx
	punpcklqdq	%xmm4, %xmm6
	jmp	.L200
.L45:
	testb	%al, %al
	jne	.L198
	.p2align 4,,10
	.p2align 3
.L43:
	subq	$1, 8(%rbx)
	subq	$1, 32(%rbx)
.L198:
	movq	24(%rbx), %rdi
	jmp	.L46
.L57:
	cmpb	$42, %al
	jne	.L59
	testb	%cl, %cl
	je	.L61
	cmpq	%rdx, %rdi
	jnb	.L60
	addq	$2, %r12
	addq	$2, %r14
	movq	%r12, 32(%rbx)
	movq	%r14, 8(%rbx)
.L60:
	movq	32(%rbx), %rax
	subq	$2, %rax
	movq	%rax, %xmm4
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	punpcklqdq	%xmm4, %xmm6
	jmp	.L201
.L61:
	cmpb	$37, %al
	jne	.L63
	testb	%cl, %cl
	je	.L63
	cmpq	%rdx, %rdi
	jnb	.L64
	addq	$2, %r12
	addq	$2, %r14
	movq	%r12, 32(%rbx)
	movq	%r14, 8(%rbx)
.L64:
	movq	32(%rbx), %rax
	subq	$2, %rax
	movq	%rax, %xmm7
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	punpcklqdq	%xmm7, %xmm6
	jmp	.L201
.L63:
	cmpb	$38, %al
	jne	.L65
	cmpb	$38, %r9b
	jne	.L65
	cmpq	%rdx, %rdi
	jnb	.L66
	addq	$2, %r12
	addq	$2, %r14
	movq	%r12, 32(%rbx)
	movq	%r14, 8(%rbx)
.L66:
	movq	32(%rbx), %rax
	subq	$2, %rax
	movq	%rax, %xmm3
	movq	.refptr.AND_SYMBOL(%rip), %rax
	punpcklqdq	%xmm3, %xmm6
	jmp	.L201
.L59:
	testb	%cl, %cl
	je	.L61
	testb	%r10b, %r10b
	je	.L61
	cmpq	%rdx, %rdi
	jnb	.L62
	addq	$2, %r12
	addq	$2, %r14
	movq	%r12, 32(%rbx)
	movq	%r14, 8(%rbx)
.L62:
	movq	32(%rbx), %rax
	subq	$2, %rax
	movq	%rax, %xmm5
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	punpcklqdq	%xmm5, %xmm6
	jmp	.L201
.L65:
	cmpb	$124, %al
	jne	.L67
	cmpb	$124, %r9b
	jne	.L67
	cmpq	%rdx, %rdi
	jnb	.L68
	addq	$2, %r12
	addq	$2, %r14
	movq	%r12, 32(%rbx)
	movq	%r14, 8(%rbx)
.L68:
	movq	32(%rbx), %rax
	subq	$2, %rax
	movq	%rax, %xmm4
	movq	.refptr.OR_SYMBOL(%rip), %rax
	punpcklqdq	%xmm4, %xmm6
	jmp	.L201
.L67:
	subl	$33, %eax
	cmpb	$92, %al
	ja	.L69
	leaq	.L71(%rip), %rdx
	movzbl	%al, %eax
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L71:
	.long	.L88-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L87-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L86-.L71
	.long	.L85-.L71
	.long	.L84-.L71
	.long	.L83-.L71
	.long	.L82-.L71
	.long	.L81-.L71
	.long	.L80-.L71
	.long	.L79-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L78-.L71
	.long	.L77-.L71
	.long	.L76-.L71
	.long	.L75-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L74-.L71
	.long	.L69-.L71
	.long	.L73-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L72-.L71
	.long	.L69-.L71
	.long	.L70-.L71
	.text
.L91:
	cmpb	$33, %al
	jne	.L53
	testb	%r8b, %r8b
	jne	.L215
.L53:
	cmpb	$60, %al
	jne	.L94
	testb	%r8b, %r8b
	je	.L94
	addq	$2, %r12
	addq	$2, %r14
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	%r12, 32(%rbx)
	movq	%r14, 8(%rbx)
	jmp	.L202
.L215:
	addq	$2, %r12
	addq	$2, %r14
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	%r12, 32(%rbx)
	movq	%r14, 8(%rbx)
	jmp	.L202
.L70:
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
.L199:
	movq	(%rax), %rbx
	movl	$32, %ecx
	call	alloc_memory
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm7, 8(%rax)
	jmp	.L1
.L94:
	cmpb	$62, %al
	jne	.L34
	testb	%r8b, %r8b
	je	.L34
	cmpq	%rdx, %rdi
	jnb	.L54
	addq	$2, %r12
	addq	$2, %r14
	movq	%r12, 32(%rbx)
	movq	%r14, 8(%rbx)
.L54:
	movq	32(%rbx), %rax
	subq	$2, %rax
	movq	%rax, %xmm5
	movq	.refptr.GE_SYMBOL(%rip), %rax
	punpcklqdq	%xmm5, %xmm6
	jmp	.L201
.L72:
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	jmp	.L199
.L73:
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax
	jmp	.L199
.L74:
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax
	jmp	.L199
.L75:
	movq	.refptr.GT_SYMBOL(%rip), %rax
	jmp	.L199
.L76:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	jmp	.L199
.L77:
	movq	.refptr.LT_SYMBOL(%rip), %rax
	jmp	.L199
.L78:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	jmp	.L199
.L79:
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	jmp	.L199
.L80:
	movq	.refptr.DOT_SYMBOL(%rip), %rax
	jmp	.L199
.L81:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	jmp	.L199
.L82:
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	jmp	.L199
.L83:
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	jmp	.L199
.L84:
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	jmp	.L199
.L85:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	jmp	.L199
.L86:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	jmp	.L199
.L87:
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	jmp	.L199
.L88:
	movq	.refptr.NOT_SYMBOL(%rip), %rax
	jmp	.L199
.L69:
	call	__getreent
	leaq	.LC0(%rip), %rdx
	movq	%rsi, %r9
	movq	24(%rax), %rcx
	leaq	.LC5(%rip), %rax
	movq	%rax, 32(%rsp)
	movq	%xmm6, %rax
	leaq	1(%rax), %r8
	call	fprintf
	movl	$32, %ecx
	call	alloc_memory
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	pxor	%xmm0, %xmm0
	movl	%edx, 24(%rax)
	movq	%rcx, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L1
.L22:
	cmpq	%rdx, %rdi
	jnb	.L103
	cmpb	$46, %al
	jne	.L103
	leaq	(%rcx,%rdi), %r8
	movzbl	(%r8), %eax
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L103
	leaq	1(%rsi), %r10
	leaq	1(%rdi), %r11
	addq	%rsi, %rdx
	movq	%r10, 32(%rbx)
	subq	%rdi, %rdx
	movq	%r10, %rsi
	movq	%r11, %rdi
	movq	%r11, 8(%rbx)
	movzbl	(%r8), %eax
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L216:
	subl	$48, %eax
	leaq	1(%rdi), %r8
	cmpb	$9, %al
	ja	.L104
	addq	$1, %rsi
	movq	%r8, 8(%rbx)
	movq	%r8, %rdi
	movq	%rsi, 32(%rbx)
	movzbl	-1(%rcx,%r8), %eax
.L24:
	cmpq	%rsi, %rdx
	jne	.L216
.L104:
	movl	$3, %r13d
	jmp	.L23
	.p2align 4
	.globl	create_lexer
	.def	create_lexer;	.scl	2;	.type	32;	.endef
create_lexer:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	movq	%rcx, %rsi
	movl	$80, %ecx
	pushq	%rbx
	movq	%rdx, %rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movq	%rsi, (%rax)
	movq	$0, 8(%rax)
	movq	%rbx, 16(%rax)
	movq	$0, 24(%rax)
	movq	$0, 32(%rax)
	movq	$0, 40(%rax)
	movq	$0, 64(%rax)
	movq	$0, 72(%rax)
	movups	%xmm0, 48(%rax)
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.p2align 4
	.globl	get_next_token
	.def	get_next_token;	.scl	2;	.type	32;	.endef
get_next_token:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	movq	%rcx, %rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	movq	40(%rcx), %rax
	testq	%rax, %rax
	je	.L220
	movq	48(%rcx), %rdx
	movq	-8(%rbp), %rbx
	movq	%rax, 72(%rcx)
	movdqu	56(%rcx), %xmm0
	movq	$0, 40(%rcx)
	movq	%rdx, 8(%rcx)
	movups	%xmm0, 24(%rcx)
	leave
	ret
	.p2align 4,,10
	.p2align 3
.L220:
	movsbl	%dl, %edx
	call	next_token
	movq	%rax, 72(%rbx)
	movq	-8(%rbp), %rbx
	leave
	ret
	.p2align 4
	.globl	peek_next_token
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
peek_next_token:
	movq	40(%rcx), %rax
	testq	%rax, %rax
	je	.L229
	ret
	.p2align 4,,10
	.p2align 3
.L229:
	pushq	%rbp
	movsbl	%dl, %edx
	movq	%rsp, %rbp
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$32, %rsp
	movq	8(%rcx), %rsi
	movaps	%xmm6, 32(%rsp)
	movdqu	24(%rcx), %xmm6
	call	next_token
	movdqu	8(%rbx), %xmm0
	movdqu	24(%rbx), %xmm1
	movq	%rsi, 8(%rbx)
	movq	32(%rbx), %rdx
	movq	%rax, 72(%rbx)
	punpcklqdq	%xmm1, %xmm0
	movq	%rax, 40(%rbx)
	movq	%rdx, 64(%rbx)
	movups	%xmm0, 48(%rbx)
	movups	%xmm6, 24(%rbx)
	movaps	32(%rsp), %xmm6
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.p2align 4
	.globl	peek_current_token
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
peek_current_token:
	movq	72(%rcx), %rax
	ret
	.p2align 4
	.globl	reset_lexer
	.def	reset_lexer;	.scl	2;	.type	32;	.endef
reset_lexer:
	pushq	%rbp
	pxor	%xmm0, %xmm0
	movq	$0, 8(%rcx)
	movq	$0, 40(%rcx)
	movq	%rsp, %rbp
	movq	$0, 64(%rcx)
	andq	$-16, %rsp
	movq	$0, 72(%rcx)
	movups	%xmm0, 24(%rcx)
	movups	%xmm0, 48(%rcx)
	leave
	ret
	.section .rdata,"dr"
	.align 8
__func__.0:
	.ascii "next_token\0"
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	is_keyword;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
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
