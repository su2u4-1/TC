	.file	"D:\\TC\\src\\lexer.c"
	.text
	.p2align 4
	.def	get_current_char.isra.0;	.scl	3;	.type	32;	.endef
get_current_char.isra.0:
	movq	8(%rcx), %rax
	cmpq	16(%rcx), %rax
	jnb	.L1
	addq	$1, %rax
	addq	$1, 32(%rcx)
	movq	%rax, 8(%rcx)
.L1:
	ret
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
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$64, %rsp
	movq	8(%rcx), %r12
	movq	16(%rcx), %rdx
	movq	32(%rcx), %rdi
	movaps	%xmm6, 64(%rsp)
	cmpq	%rdx, %r12
	jnb	.L5
	leaq	1(%rdi), %r9
	leaq	1(%r12), %rsi
	movq	%r9, 32(%rcx)
	movq	(%rcx), %rcx
	movq	%rsi, 8(%rbx)
	leaq	(%rcx,%r12), %r10
	movzbl	(%r10), %eax
	cmpb	$32, %al
	ja	.L6
	leaq	.L8(%rip), %r11
	movzbl	%al, %r8d
	movslq	(%r11,%r8,4), %r8
	addq	%r11, %r8
	jmp	*%r8
	.section .rdata,"dr"
	.align 4
.L8:
	.long	.L93-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L193-.L8
	.long	.L9-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L193-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L193-.L8
	.text
	.p2align 4,,10
	.p2align 3
.L93:
	movq	%r9, %rdi
	.p2align 4,,10
	.p2align 3
.L5:
	movq	24(%rbx), %xmm6
	movq	%rdi, %xmm1
	movl	$32, %ecx
	punpcklqdq	%xmm1, %xmm6
	call	alloc_memory
	movl	$0, 24(%rax)
	movq	$0, (%rax)
	movups	%xmm6, 8(%rax)
.L4:
	movaps	64(%rsp), %xmm6
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
.L9:
	addq	$1, 24(%rbx)
	movq	$0, 32(%rbx)
.L193:
	movaps	64(%rsp), %xmm6
	leaq	-48(%rbp), %rsp
	movsbl	%r13b, %edx
	movq	%rbx, %rcx
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
.L6:
	cmpb	$90, %al
	jg	.L11
	cmpb	$64, %al
	jg	.L12
	cmpb	$34, %al
	je	.L13
	leal	-48(%rax), %r8d
	cmpb	$9, %r8b
	jbe	.L15
	jmp	.L194
	.p2align 4,,10
	.p2align 3
.L196:
	addq	$1, %rsi
	addq	$1, %r9
	movq	%r9, 32(%rbx)
	movq	%rsi, 8(%rbx)
	movzbl	-1(%rcx,%rsi), %eax
.L15:
	leal	-48(%rax), %r8d
	cmpb	$9, %r8b
	ja	.L195
	cmpq	%rdx, %rsi
	jb	.L196
	movl	$2, %r13d
.L23:
	subq	$1, %r9
	leaq	-1(%rsi), %rdx
	movq	%rdi, %xmm4
	movq	%r10, %rcx
	movq	%rdx, 8(%rbx)
	movq	24(%rbx), %xmm6
	subq	%r12, %rdx
	movq	%r9, 32(%rbx)
	punpcklqdq	%xmm4, %xmm6
	call	create_string
	movl	$32, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movl	%r13d, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L11:
	cmpb	$95, %al
	jne	.L197
.L12:
	movabsq	$288230372997595135, %r8
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L199:
	addq	$1, %rsi
	addq	$1, %r9
	movq	%r9, 32(%rbx)
	movq	%rsi, 8(%rbx)
	movzbl	-1(%rcx,%rsi), %eax
.L17:
	cmpb	$57, %al
	jle	.L198
	subl	$65, %eax
	cmpb	$57, %al
	ja	.L18
	btq	%rax, %r8
	jnc	.L18
.L20:
	cmpq	%rdx, %rsi
	jb	.L199
.L18:
	leaq	-1(%rsi), %rdx
	subq	$1, %r9
	movq	%r10, %rcx
	movq	%rdx, 8(%rbx)
	subq	%r12, %rdx
	movq	%r9, 32(%rbx)
	call	create_string
	movq	%rax, %rcx
	movq	%rax, %rsi
	call	is_keyword
	movq	24(%rbx), %xmm6
	testb	%al, %al
	je	.L22
	movq	%rdi, %xmm2
	movl	$32, %ecx
	punpcklqdq	%xmm2, %xmm6
	call	alloc_memory
	movl	$6, 24(%rax)
	movq	%rsi, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L197:
	leal	-97(%rax), %r8d
	cmpb	$25, %r8b
	jbe	.L12
	cmpq	%rdx, %rsi
	jnb	.L200
	movzbl	1(%rcx,%r12), %r10d
	xorl	%r11d, %r11d
.L43:
	cmpb	$61, %r10b
	sete	%cl
	movl	%ecx, %edx
	cmpb	$61, %al
	jne	.L85
	testb	%cl, %cl
	je	.L85
	addq	$2, %r12
	leaq	2(%rdi), %rax
	movq	24(%rbx), %xmm6
	movq	%rdi, %xmm5
	movq	%r12, 8(%rbx)
	movq	%rax, 32(%rbx)
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	punpcklqdq	%xmm5, %xmm6
.L191:
	movq	(%rax), %rbx
	movl	$32, %ecx
	call	alloc_memory
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L22:
	movq	%rdi, %xmm3
	movl	$32, %ecx
	punpcklqdq	%xmm3, %xmm6
	call	alloc_memory
	movl	$1, 24(%rax)
	movq	%rsi, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L13:
	xorl	%r13d, %r13d
	cmpq	%rdx, %rsi
	jnb	.L27
	leaq	2(%rdi), %rax
	movq	%rax, 32(%rbx)
	leaq	2(%r12), %rax
	movq	%rax, 8(%rbx)
	movzbl	1(%rcx,%r12), %r13d
.L27:
	movabsq	$-17179870210, %r9
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L202:
	leaq	1(%rax), %r8
	addq	$1, 32(%rbx)
	movq	%r8, 8(%rbx)
	movzbl	(%rcx,%rax), %r13d
.L28:
	cmpb	$34, %r13b
	jbe	.L201
.L30:
	movq	8(%rbx), %rax
	cmpq	%rdx, %rax
	jb	.L202
	xorl	%r13d, %r13d
.L29:
	movq	24(%rbx), %r12
	cmpb	$34, %r13b
	je	.L31
	call	__getreent
	movq	%rsi, %r9
	leaq	1(%r12), %r8
	leaq	.LC0(%rip), %rdx
	movq	24(%rax), %rcx
	leaq	.LC1(%rip), %rax
	movq	%rax, 32(%rsp)
	call	fprintf
	cmpb	$10, %r13b
	je	.L32
	movq	24(%rbx), %xmm6
.L33:
	movq	(%rbx), %rcx
	movq	%rsi, %rdx
	movq	%rdi, %xmm5
	notq	%rdx
	addq	8(%rbx), %rdx
	punpcklqdq	%xmm5, %xmm6
	addq	%rsi, %rcx
	call	create_string
	movl	$32, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movl	$4, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L201:
	btq	%r13, %r9
	jc	.L30
	jmp	.L29
.L194:
	cmpb	$47, %al
	sete	%r8b
	movl	%r8d, %r11d
	cmpq	%rdx, %rsi
	jnb	.L91
	movzbl	1(%rcx,%r12), %r10d
	cmpb	$47, %r10b
	jne	.L38
	testb	%r8b, %r8b
	je	.L38
	movl	$47, %eax
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L203:
	addq	$1, %rsi
	addq	$1, %r9
	movq	%r9, 32(%rbx)
	movq	%rsi, 8(%rbx)
	movzbl	-1(%rcx,%rsi), %eax
.L36:
	cmpb	$10, %al
	je	.L39
	testb	%al, %al
	je	.L39
	cmpq	%rdx, %rsi
	jb	.L203
.L39:
	leaq	-1(%rsi), %rdx
	subq	$1, %r9
	movq	%rdx, 8(%rbx)
	movq	%r9, 32(%rbx)
	testb	%r13b, %r13b
	jne	.L193
	movq	24(%rbx), %xmm6
	addq	$2, %r12
	movq	%rdi, %xmm2
	subq	%r12, %rdx
	addq	%r12, %rcx
	punpcklqdq	%xmm2, %xmm6
.L192:
	call	create_string
	movl	$32, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movl	$7, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L4
.L195:
	movl	$2, %r13d
	cmpq	%rdx, %rsi
	jnb	.L23
	cmpb	$46, %al
	jne	.L23
	leaq	(%rcx,%rsi), %r8
	movzbl	(%r8), %eax
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L23
	addq	$1, %r9
	addq	$1, %rsi
	movq	%r9, 32(%rbx)
	movq	%rsi, 8(%rbx)
	movzbl	(%r8), %eax
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L204:
	addq	$1, %rsi
	addq	$1, %r9
	movq	%r9, 32(%rbx)
	movq	%rsi, 8(%rbx)
	movzbl	-1(%rcx,%rsi), %eax
.L25:
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L98
	cmpq	%rdx, %rsi
	jb	.L204
.L98:
	movl	$3, %r13d
	jmp	.L23
.L31:
	movq	%rsi, %rdx
	addq	%rsi, %rcx
	notq	%rdx
	addq	8(%rbx), %rdx
	call	create_string
	movl	$32, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movq	%r12, %xmm0
	movq	%rdi, %xmm5
	punpcklqdq	%xmm5, %xmm0
	movl	$4, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L4
.L32:
	movq	24(%rbx), %rax
	movq	$0, 32(%rbx)
	addq	$1, %rax
	movq	%rax, 24(%rbx)
	movq	%rax, %xmm6
	jmp	.L33
.L200:
	xorl	%r11d, %r11d
.L91:
	xorl	%r10d, %r10d
	xorl	%edx, %edx
.L35:
	cmpb	$43, %al
	jne	.L56
	testb	%dl, %dl
	jne	.L205
.L56:
	cmpb	$45, %al
	jne	.L57
	testb	%dl, %dl
	jne	.L206
.L57:
	cmpb	$42, %al
	jne	.L58
	testb	%dl, %dl
	jne	.L207
.L59:
	cmpb	$37, %al
	jne	.L60
	testb	%dl, %dl
	jne	.L208
.L60:
	cmpb	$38, %al
	jne	.L61
	cmpb	$38, %r10b
	je	.L209
.L61:
	cmpb	$124, %al
	jne	.L62
	cmpb	$124, %r10b
	je	.L210
.L62:
	movq	24(%rbx), %rbx
	movq	%rdi, %xmm4
	subl	$33, %eax
	movq	%rbx, %xmm6
	punpcklqdq	%xmm4, %xmm6
	cmpb	$92, %al
	ja	.L63
	leaq	.L65(%rip), %rdx
	movzbl	%al, %eax
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L65:
	.long	.L82-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L81-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L80-.L65
	.long	.L79-.L65
	.long	.L78-.L65
	.long	.L77-.L65
	.long	.L76-.L65
	.long	.L75-.L65
	.long	.L74-.L65
	.long	.L73-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L72-.L65
	.long	.L71-.L65
	.long	.L70-.L65
	.long	.L69-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L68-.L65
	.long	.L63-.L65
	.long	.L67-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L66-.L65
	.long	.L63-.L65
	.long	.L64-.L65
	.text
.L63:
	movq	%r9, 56(%rsp)
	call	__getreent
	movq	56(%rsp), %r9
	leaq	.LC0(%rip), %rdx
	leaq	1(%rbx), %r8
	movq	24(%rax), %rcx
	leaq	.LC5(%rip), %rax
	movq	%rax, 32(%rsp)
	call	fprintf
	movl	$32, %ecx
	call	alloc_memory
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	pxor	%xmm0, %xmm0
	movl	%edx, 24(%rax)
	movq	%rcx, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L4
.L38:
	cmpb	$42, %r10b
	jne	.L43
	testb	%r8b, %r8b
	je	.L43
	leaq	2(%r12), %rsi
	movl	$42, %eax
	movl	$47, %r8d
	.p2align 4,,10
	.p2align 3
.L44:
	cmpb	$42, %r8b
	jne	.L158
	cmpb	$47, %al
	je	.L211
.L158:
	movq	8(%rbx), %rax
	cmpq	%rdx, %rax
	jnb	.L45
	leaq	1(%rax), %r9
	addq	$1, 32(%rbx)
	movq	%r9, 8(%rbx)
	movzbl	(%rcx,%rax), %r8d
	cmpq	%rdx, %r9
	jnb	.L212
	movzbl	1(%rcx,%rax), %eax
	cmpb	$10, %r8b
	jne	.L49
	addq	$1, 24(%rbx)
	movq	$0, 32(%rbx)
	testb	%al, %al
	jne	.L158
	jmp	.L190
	.p2align 4,,10
	.p2align 3
.L49:
	testb	%al, %al
	je	.L47
	testb	%r8b, %r8b
	jne	.L44
	leaq	.LC2(%rip), %r9
	leaq	__func__.0(%rip), %r8
	movl	$125, %edx
	leaq	.LC3(%rip), %rcx
	call	__assert_func
	.p2align 4,,10
	.p2align 3
.L212:
	cmpb	$10, %r8b
	jne	.L47
	movq	24(%rbx), %rax
	movq	$0, 32(%rbx)
	leaq	1(%rax), %r14
	movq	%r14, 24(%rbx)
.L48:
	call	__getreent
	leaq	3(%r12), %r9
	leaq	1(%r14), %r8
	movq	24(%rax), %rcx
	leaq	.LC4(%rip), %rax
	leaq	.LC0(%rip), %rdx
	movq	%rax, 32(%rsp)
	call	fprintf
	testb	%r13b, %r13b
	jne	.L193
	movq	24(%rbx), %xmm6
	movq	8(%rbx), %rdx
	movq	%rdi, %xmm3
	movq	(%rbx), %rcx
	punpcklqdq	%xmm3, %xmm6
	subq	%rsi, %rdx
	addq	%rsi, %rcx
	jmp	.L192
.L211:
	movq	8(%rbx), %rax
	cmpq	%rdx, %rax
	jnb	.L89
	addq	$1, %rax
	addq	$1, 32(%rbx)
	movq	%rax, 8(%rbx)
.L89:
	testb	%r13b, %r13b
	jne	.L193
	movq	8(%rbx), %rdx
	movq	24(%rbx), %xmm6
	movq	%rdi, %xmm4
	addq	%rsi, %rcx
	subq	$2, %rdx
	punpcklqdq	%xmm4, %xmm6
	subq	%rsi, %rdx
	jmp	.L192
.L47:
	testb	%r8b, %r8b
	jne	.L190
	.p2align 4,,10
	.p2align 3
.L45:
	subq	$1, 8(%rbx)
	subq	$1, 32(%rbx)
.L190:
	movq	24(%rbx), %r14
	jmp	.L48
.L58:
	testb	%dl, %dl
	je	.L59
	testb	%r11b, %r11b
	je	.L59
	movq	%rbx, %rcx
	call	get_current_char.isra.0
	movq	32(%rbx), %rax
	movq	24(%rbx), %xmm6
	subq	$2, %rax
	movq	%rax, %xmm3
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	punpcklqdq	%xmm3, %xmm6
	jmp	.L191
.L205:
	movq	%rbx, %rcx
	call	get_current_char.isra.0
	movq	32(%rbx), %rax
	movq	24(%rbx), %xmm6
	subq	$2, %rax
	movq	%rax, %xmm3
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	punpcklqdq	%xmm3, %xmm6
	jmp	.L191
.L206:
	movq	%rbx, %rcx
	call	get_current_char.isra.0
	movq	32(%rbx), %rax
	movq	24(%rbx), %xmm6
	subq	$2, %rax
	movq	%rax, %xmm4
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	punpcklqdq	%xmm4, %xmm6
	jmp	.L191
.L207:
	movq	%rbx, %rcx
	call	get_current_char.isra.0
	movq	32(%rbx), %rax
	movq	24(%rbx), %xmm6
	subq	$2, %rax
	movq	%rax, %xmm5
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	punpcklqdq	%xmm5, %xmm6
	jmp	.L191
.L208:
	movq	%rbx, %rcx
	call	get_current_char.isra.0
	movq	32(%rbx), %rax
	movq	24(%rbx), %xmm6
	subq	$2, %rax
	movq	%rax, %xmm4
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	punpcklqdq	%xmm4, %xmm6
	jmp	.L191
.L209:
	movq	%rbx, %rcx
	call	get_current_char.isra.0
	movq	32(%rbx), %rax
	movq	24(%rbx), %xmm6
	subq	$2, %rax
	movq	%rax, %xmm5
	movq	.refptr.AND_SYMBOL(%rip), %rax
	punpcklqdq	%xmm5, %xmm6
	jmp	.L191
.L210:
	movq	%rbx, %rcx
	call	get_current_char.isra.0
	movq	32(%rbx), %rax
	movq	24(%rbx), %xmm6
	subq	$2, %rax
	movq	%rax, %xmm3
	movq	.refptr.OR_SYMBOL(%rip), %rax
	punpcklqdq	%xmm3, %xmm6
	jmp	.L191
.L85:
	cmpb	$33, %al
	jne	.L55
	testb	%cl, %cl
	jne	.L213
.L55:
	cmpb	$60, %al
	jne	.L88
	testb	%cl, %cl
	je	.L88
	movq	24(%rbx), %xmm6
	leaq	2(%rdi), %rax
	addq	$2, %r12
	movq	%rdi, %xmm4
	movq	%rax, 32(%rbx)
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	%r12, 8(%rbx)
	punpcklqdq	%xmm4, %xmm6
	jmp	.L191
.L213:
	movq	24(%rbx), %xmm6
	leaq	2(%rdi), %rax
	addq	$2, %r12
	movq	%rdi, %xmm3
	movq	%rax, 32(%rbx)
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	%r12, 8(%rbx)
	punpcklqdq	%xmm3, %xmm6
	jmp	.L191
.L88:
	cmpb	$62, %al
	jne	.L35
	testb	%cl, %cl
	je	.L35
	movq	%rbx, %rcx
	call	get_current_char.isra.0
	movq	32(%rbx), %rax
	movq	24(%rbx), %xmm6
	subq	$2, %rax
	movq	%rax, %xmm5
	movq	.refptr.GE_SYMBOL(%rip), %rax
	punpcklqdq	%xmm5, %xmm6
	jmp	.L191
.L64:
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	jmp	.L191
.L66:
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	jmp	.L191
.L198:
	cmpb	$47, %al
	jg	.L20
	jmp	.L18
.L67:
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax
	jmp	.L191
.L68:
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax
	jmp	.L191
.L69:
	movq	.refptr.GT_SYMBOL(%rip), %rax
	jmp	.L191
.L70:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	jmp	.L191
.L71:
	movq	.refptr.LT_SYMBOL(%rip), %rax
	jmp	.L191
.L72:
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	jmp	.L191
.L73:
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	jmp	.L191
.L74:
	movq	.refptr.DOT_SYMBOL(%rip), %rax
	jmp	.L191
.L75:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	jmp	.L191
.L76:
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	jmp	.L191
.L77:
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	jmp	.L191
.L78:
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	jmp	.L191
.L79:
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	jmp	.L191
.L80:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	jmp	.L191
.L81:
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	jmp	.L191
.L82:
	movq	.refptr.NOT_SYMBOL(%rip), %rax
	jmp	.L191
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
	je	.L217
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
.L217:
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
	je	.L226
	ret
	.p2align 4,,10
	.p2align 3
.L226:
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
