	.file	"lexer.c"
	.text
	.p2align 4
	.type	get_current_char.isra.0, @function
get_current_char.isra.0:
	movq	16(%rdi), %rax
	cmpq	24(%rdi), %rax
	jnb	.L1
	addq	$1, %rax
	addq	$1, 40(%rdi)
	movq	%rax, 16(%rdi)
.L1:
	ret
	.size	get_current_char.isra.0, .-get_current_char.isra.0
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"[Lexer Error] at %s:%zu:%zu: %s\n"
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
	.p2align 4
	.type	next_token, @function
next_token:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	subq	$24, %rsp
	movq	16(%rdi), %rdi
	movq	24(%rbx), %rdx
	movq	40(%rbx), %r13
	cmpq	%rdx, %rdi
	jnb	.L5
	movq	8(%rbx), %rcx
	leaq	1(%r13), %r9
	leaq	1(%rdi), %rbp
	movl	%esi, %r12d
	movq	%r9, 40(%rbx)
	leaq	(%rcx,%rdi), %r8
	movq	%rbp, 16(%rbx)
	movzbl	(%r8), %eax
	cmpb	$32, %al
	ja	.L6
	leaq	.L8(%rip), %r10
	movzbl	%al, %esi
	movslq	(%r10,%rsi,4), %rsi
	addq	%r10, %rsi
	jmp	*%rsi
	.section	.rodata
	.align 4
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
	.long	.L199-.L8
	.long	.L9-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L199-.L8
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
	.long	.L199-.L8
	.text
	.p2align 4,,10
	.p2align 3
.L93:
	movq	%r9, %r13
	.p2align 4,,10
	.p2align 3
.L5:
	movq	32(%rbx), %xmm0
	movq	%r13, %xmm1
	movl	$32, %edi
	punpcklqdq	%xmm1, %xmm0
	movaps	%xmm0, (%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm0
	movl	$0, 24(%rax)
	movq	$0, (%rax)
	movups	%xmm0, 8(%rax)
.L4:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	addq	$1, 32(%rbx)
	movq	$0, 40(%rbx)
.L199:
	addq	$24, %rsp
	movsbl	%r12b, %esi
	movq	%rbx, %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
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
	leal	-48(%rax), %esi
	cmpb	$9, %sil
	jbe	.L15
	jmp	.L200
	.p2align 4,,10
	.p2align 3
.L202:
	addq	$1, %rbp
	addq	$1, %r9
	movq	%r9, 40(%rbx)
	movq	%rbp, 16(%rbx)
	movzbl	-1(%rcx,%rbp), %eax
.L15:
	leal	-48(%rax), %esi
	cmpb	$9, %sil
	ja	.L201
	cmpq	%rdx, %rbp
	jb	.L202
	movl	$2, %r12d
.L23:
	movq	32(%rbx), %xmm0
	movq	%r13, %xmm4
	subq	$1, %r9
	leaq	-1(%rbp), %rsi
	movq	%rsi, 16(%rbx)
	subq	%rdi, %rsi
	movq	%r8, %rdi
	punpcklqdq	%xmm4, %xmm0
	movq	%r9, 40(%rbx)
	movaps	%xmm0, (%rsp)
	call	*create_string@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm0
	movl	%r12d, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L11:
	cmpb	$95, %al
	jne	.L203
.L12:
	movabsq	$288230372997595135, %rsi
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L205:
	addq	$1, %rbp
	addq	$1, %r9
	movq	%r9, 40(%rbx)
	movq	%rbp, 16(%rbx)
	movzbl	-1(%rcx,%rbp), %eax
.L17:
	cmpb	$57, %al
	jle	.L204
	subl	$65, %eax
	cmpb	$57, %al
	ja	.L18
	btq	%rax, %rsi
	jnc	.L18
.L20:
	cmpq	%rdx, %rbp
	jb	.L205
.L18:
	leaq	-1(%rbp), %rsi
	subq	$1, %r9
	movq	%rsi, 16(%rbx)
	subq	%rdi, %rsi
	movq	%r8, %rdi
	movq	%r9, 40(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%rax, %rdi
	call	*is_keyword@GOTPCREL(%rip)
	movq	32(%rbx), %xmm0
	testb	%al, %al
	je	.L22
	movq	%r13, %xmm2
	movl	$32, %edi
	punpcklqdq	%xmm2, %xmm0
	movaps	%xmm0, (%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm0
	movl	$6, 24(%rax)
	movq	%rbp, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L203:
	leal	-97(%rax), %esi
	cmpb	$25, %sil
	jbe	.L12
	cmpq	%rdx, %rbp
	jnb	.L206
	movzbl	1(%rcx,%rdi), %r8d
	xorl	%r10d, %r10d
.L43:
	cmpb	$61, %r8b
	sete	%cl
	movl	%ecx, %edx
	cmpb	$61, %al
	jne	.L85
	testb	%cl, %cl
	je	.L85
	movq	32(%rbx), %xmm0
	leaq	2(%r13), %rax
	addq	$2, %rdi
	movq	%r13, %xmm7
	movq	%rax, 40(%rbx)
	movq	%rdi, 16(%rbx)
	punpcklqdq	%xmm7, %xmm0
	movq	EQ_SYMBOL(%rip), %rbx
	movaps	%xmm0, (%rsp)
.L198:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm0
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L22:
	movq	%r13, %xmm3
	movl	$32, %edi
	punpcklqdq	%xmm3, %xmm0
	movaps	%xmm0, (%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm0
	movl	$1, 24(%rax)
	movq	%rbp, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L13:
	xorl	%r12d, %r12d
	cmpq	%rdx, %rbp
	jnb	.L27
	leaq	2(%r13), %rax
	movq	%rax, 40(%rbx)
	leaq	2(%rdi), %rax
	movq	%rax, 16(%rbx)
	movzbl	1(%rcx,%rdi), %r12d
.L27:
	movabsq	$-17179870210, %rdi
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L208:
	leaq	1(%rax), %rsi
	addq	$1, 40(%rbx)
	movq	%rsi, 16(%rbx)
	movzbl	(%rcx,%rax), %r12d
.L28:
	cmpb	$34, %r12b
	jbe	.L207
.L30:
	movq	16(%rbx), %rax
	cmpq	%rdx, %rax
	jb	.L208
	xorl	%r12d, %r12d
.L29:
	movq	32(%rbx), %rax
	cmpb	$34, %r12b
	je	.L31
	subq	$8, %rsp
	movq	(%rbx), %rcx
	leaq	1(%rax), %r8
	movq	%rbp, %r9
	leaq	.LC1(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	pushq	%rdx
	leaq	.LC0(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	popq	%r10
	movq	32(%rbx), %rax
	popq	%r11
	cmpb	$10, %r12b
	jne	.L31
	addq	$1, %rax
	movq	$0, 40(%rbx)
	movq	%rax, 32(%rbx)
	.p2align 4,,10
	.p2align 3
.L31:
	movq	16(%rbx), %rsi
	movq	%rax, %xmm0
	movq	%r13, %xmm5
	leaq	.LC2(%rip), %rdi
	punpcklqdq	%xmm5, %xmm0
	subq	%rbp, %rsi
	movaps	%xmm0, (%rsp)
	cmpq	$1, %rsi
	je	.L194
	movq	8(%rbx), %rdi
	subq	$1, %rsi
	addq	%rbp, %rdi
.L194:
	call	*create_string@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm0
	movl	$4, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L207:
	btq	%r12, %rdi
	jc	.L30
	jmp	.L29
.L200:
	cmpb	$47, %al
	sete	%sil
	movl	%esi, %r10d
	cmpq	%rdx, %rbp
	jnb	.L91
	movzbl	1(%rcx,%rdi), %r8d
	cmpb	$47, %r8b
	jne	.L38
	testb	%sil, %sil
	je	.L38
	movl	$47, %eax
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L209:
	addq	$1, %rbp
	addq	$1, %r9
	movq	%r9, 40(%rbx)
	movq	%rbp, 16(%rbx)
	movzbl	-1(%rcx,%rbp), %eax
.L36:
	cmpb	$10, %al
	je	.L39
	testb	%al, %al
	je	.L39
	cmpq	%rdx, %rbp
	jb	.L209
.L39:
	leaq	-1(%rbp), %rsi
	subq	$1, %r9
	movq	%rsi, 16(%rbx)
	movq	%r9, 40(%rbx)
	testb	%r12b, %r12b
	jne	.L199
	movq	32(%rbx), %xmm0
	movq	%r13, %xmm6
	addq	$2, %rdi
	subq	%rdi, %rsi
	addq	%rcx, %rdi
	punpcklqdq	%xmm6, %xmm0
	movaps	%xmm0, (%rsp)
.L195:
	call	*create_string@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm0
	movl	$7, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L4
.L201:
	movl	$2, %r12d
	cmpq	%rdx, %rbp
	jnb	.L23
	cmpb	$46, %al
	jne	.L23
	leaq	(%rcx,%rbp), %rsi
	movzbl	(%rsi), %eax
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L23
	addq	$1, %r9
	addq	$1, %rbp
	movq	%r9, 40(%rbx)
	movq	%rbp, 16(%rbx)
	movzbl	(%rsi), %eax
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L210:
	addq	$1, %rbp
	addq	$1, %r9
	movq	%r9, 40(%rbx)
	movq	%rbp, 16(%rbx)
	movzbl	-1(%rcx,%rbp), %eax
.L25:
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L98
	cmpq	%rdx, %rbp
	jb	.L210
.L98:
	movl	$3, %r12d
	jmp	.L23
.L206:
	xorl	%r10d, %r10d
.L91:
	xorl	%r8d, %r8d
	xorl	%edx, %edx
.L35:
	cmpb	$43, %al
	jne	.L56
	testb	%dl, %dl
	jne	.L211
.L56:
	cmpb	$45, %al
	jne	.L57
	testb	%dl, %dl
	jne	.L212
.L57:
	cmpb	$42, %al
	jne	.L58
	testb	%dl, %dl
	jne	.L213
.L59:
	cmpb	$37, %al
	jne	.L60
	testb	%dl, %dl
	jne	.L214
.L60:
	cmpb	$38, %al
	jne	.L61
	cmpb	$38, %r8b
	je	.L215
.L61:
	cmpb	$124, %al
	jne	.L62
	cmpb	$124, %r8b
	je	.L216
.L62:
	movq	32(%rbx), %rdx
	movq	%r13, %xmm6
	subl	$33, %eax
	movq	%rdx, %xmm7
	punpcklqdq	%xmm6, %xmm7
	movaps	%xmm7, (%rsp)
	cmpb	$92, %al
	ja	.L63
	leaq	.L65(%rip), %rcx
	movzbl	%al, %eax
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
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
	pushq	%rax
	leaq	1(%rdx), %r8
	leaq	.LC6(%rip), %rax
	movl	$2, %esi
	pushq	%rax
	leaq	.LC0(%rip), %rdx
	movq	(%rbx), %rcx
	xorl	%eax, %eax
	movq	stderr(%rip), %rdi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	pxor	%xmm0, %xmm0
	movl	%edx, 24(%rax)
	movq	%rcx, (%rax)
	movups	%xmm0, 8(%rax)
	popq	%rsi
	popq	%rdi
	jmp	.L4
.L38:
	cmpb	$42, %r8b
	jne	.L43
	testb	%sil, %sil
	je	.L43
	leaq	2(%rdi), %rbp
	movl	$42, %eax
	movl	$47, %esi
	.p2align 4,,10
	.p2align 3
.L44:
	cmpb	$42, %sil
	jne	.L160
	cmpb	$47, %al
	je	.L217
.L160:
	movq	16(%rbx), %rax
	cmpq	%rdx, %rax
	jnb	.L45
	leaq	1(%rax), %r8
	addq	$1, 40(%rbx)
	movq	%r8, 16(%rbx)
	movzbl	(%rcx,%rax), %esi
	cmpq	%rdx, %r8
	jnb	.L218
	movzbl	1(%rcx,%rax), %eax
	cmpb	$10, %sil
	jne	.L49
	addq	$1, 32(%rbx)
	movq	$0, 40(%rbx)
	testb	%al, %al
	jne	.L160
	jmp	.L193
	.p2align 4,,10
	.p2align 3
.L49:
	testb	%al, %al
	je	.L47
	testb	%sil, %sil
	jne	.L44
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$127, %edx
	leaq	.LC3(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	call	*__assert_fail@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L218:
	cmpb	$10, %sil
	jne	.L47
	movq	32(%rbx), %rax
	movq	$0, 40(%rbx)
	addq	$1, %rax
	movq	%rax, 32(%rbx)
.L48:
	subq	$8, %rsp
	leaq	3(%rdi), %r9
	leaq	1(%rax), %r8
	movq	(%rbx), %rcx
	leaq	.LC5(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	pushq	%rdx
	leaq	.LC0(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	popq	%r8
	popq	%r9
	testb	%r12b, %r12b
	jne	.L199
	movq	32(%rbx), %xmm0
	movq	16(%rbx), %rsi
	movq	%r13, %xmm7
	movq	8(%rbx), %rdi
	punpcklqdq	%xmm7, %xmm0
	subq	%rbp, %rsi
	movaps	%xmm0, (%rsp)
	addq	%rbp, %rdi
	jmp	.L195
.L217:
	movq	16(%rbx), %rax
	cmpq	%rdx, %rax
	jnb	.L89
	addq	$1, %rax
	addq	$1, 40(%rbx)
	movq	%rax, 16(%rbx)
.L89:
	testb	%r12b, %r12b
	jne	.L199
	movq	32(%rbx), %xmm0
	movq	16(%rbx), %rsi
	movq	%r13, %xmm7
	leaq	(%rcx,%rbp), %rdi
	punpcklqdq	%xmm7, %xmm0
	subq	$2, %rsi
	movaps	%xmm0, (%rsp)
	subq	%rbp, %rsi
	jmp	.L195
.L47:
	testb	%sil, %sil
	jne	.L193
	.p2align 4,,10
	.p2align 3
.L45:
	subq	$1, 16(%rbx)
	subq	$1, 40(%rbx)
.L193:
	movq	32(%rbx), %rax
	jmp	.L48
.L58:
	testb	%dl, %dl
	je	.L59
	testb	%r10b, %r10b
	je	.L59
	movq	%rbx, %rdi
	call	get_current_char.isra.0
	movq	40(%rbx), %rax
	movq	32(%rbx), %xmm0
	movq	DIV_ASSIGN_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm7
	punpcklqdq	%xmm7, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L198
.L211:
	movq	%rbx, %rdi
	call	get_current_char.isra.0
	movq	40(%rbx), %rax
	movq	32(%rbx), %xmm0
	movq	ADD_ASSIGN_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm6
	punpcklqdq	%xmm6, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L198
.L212:
	movq	%rbx, %rdi
	call	get_current_char.isra.0
	movq	40(%rbx), %rax
	movq	32(%rbx), %xmm0
	movq	SUB_ASSIGN_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm7
	punpcklqdq	%xmm7, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L198
.L213:
	movq	%rbx, %rdi
	call	get_current_char.isra.0
	movq	40(%rbx), %rax
	movq	32(%rbx), %xmm0
	movq	MUL_ASSIGN_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm6
	punpcklqdq	%xmm6, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L198
.L214:
	movq	%rbx, %rdi
	call	get_current_char.isra.0
	movq	40(%rbx), %rax
	movq	32(%rbx), %xmm0
	movq	MOD_ASSIGN_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm6
	punpcklqdq	%xmm6, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L198
.L215:
	movq	%rbx, %rdi
	call	get_current_char.isra.0
	movq	40(%rbx), %rax
	movq	32(%rbx), %xmm0
	movq	AND_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm7
	punpcklqdq	%xmm7, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L198
.L216:
	movq	%rbx, %rdi
	call	get_current_char.isra.0
	movq	40(%rbx), %rax
	movq	32(%rbx), %xmm0
	movq	OR_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm6
	punpcklqdq	%xmm6, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L198
.L85:
	cmpb	$33, %al
	jne	.L55
	testb	%cl, %cl
	jne	.L219
.L55:
	cmpb	$60, %al
	jne	.L88
	testb	%cl, %cl
	je	.L88
	movq	32(%rbx), %xmm0
	movq	%r13, %xmm6
	leaq	2(%r13), %rax
	addq	$2, %rdi
	movq	%rax, 40(%rbx)
	punpcklqdq	%xmm6, %xmm0
	movq	%rdi, 16(%rbx)
	movq	LE_SYMBOL(%rip), %rbx
	movaps	%xmm0, (%rsp)
	jmp	.L198
.L219:
	movq	32(%rbx), %xmm0
	movq	%r13, %xmm7
	leaq	2(%r13), %rax
	addq	$2, %rdi
	movq	%rax, 40(%rbx)
	punpcklqdq	%xmm7, %xmm0
	movq	%rdi, 16(%rbx)
	movq	NE_SYMBOL(%rip), %rbx
	movaps	%xmm0, (%rsp)
	jmp	.L198
.L88:
	cmpb	$62, %al
	jne	.L35
	testb	%cl, %cl
	je	.L35
	movq	%rbx, %rdi
	call	get_current_char.isra.0
	movq	40(%rbx), %rax
	movq	32(%rbx), %xmm0
	movq	GE_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm7
	punpcklqdq	%xmm7, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L198
.L64:
	movq	R_BRACE_SYMBOL(%rip), %rbx
.L196:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm7
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm7, 8(%rax)
	jmp	.L4
.L66:
	movq	L_BRACE_SYMBOL(%rip), %rbx
.L197:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm6
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L4
.L204:
	cmpb	$47, %al
	jg	.L20
	jmp	.L18
.L67:
	movq	R_BRACKET_SYMBOL(%rip), %rbx
	jmp	.L197
.L68:
	movq	L_BRACKET_SYMBOL(%rip), %rbx
	jmp	.L196
.L69:
	movq	GT_SYMBOL(%rip), %rbx
	jmp	.L197
.L70:
	movq	ASSIGN_SYMBOL(%rip), %rbx
	jmp	.L196
.L71:
	movq	LT_SYMBOL(%rip), %rbx
	jmp	.L196
.L72:
	movq	SEMICOLON_SYMBOL(%rip), %rbx
	jmp	.L196
.L73:
	movq	DIV_SYMBOL(%rip), %rbx
	jmp	.L196
.L74:
	movq	DOT_SYMBOL(%rip), %rbx
	jmp	.L197
.L75:
	movq	SUB_SYMBOL(%rip), %rbx
	jmp	.L196
.L76:
	movq	COMMA_SYMBOL(%rip), %rbx
	jmp	.L197
.L77:
	movq	ADD_SYMBOL(%rip), %rbx
	jmp	.L197
.L78:
	movq	MUL_SYMBOL(%rip), %rbx
	jmp	.L197
.L79:
	movq	R_PAREN_SYMBOL(%rip), %rbx
	jmp	.L196
.L80:
	movq	L_PAREN_SYMBOL(%rip), %rbx
	jmp	.L196
.L81:
	movq	MOD_SYMBOL(%rip), %rbx
	jmp	.L197
.L82:
	movq	NOT_SYMBOL(%rip), %rbx
	jmp	.L196
	.size	next_token, .-next_token
	.p2align 4
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
	pxor	%xmm0, %xmm0
	movq	%r12, 8(%rax)
	movq	$0, 16(%rax)
	movq	%rbp, 24(%rax)
	movq	$0, 32(%rax)
	movq	$0, 40(%rax)
	movq	$0, 48(%rax)
	movq	$0, 72(%rax)
	movq	$0, 80(%rax)
	movq	%rbx, (%rax)
	movups	%xmm0, 56(%rax)
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	create_lexer, .-create_lexer
	.p2align 4
	.globl	get_next_token
	.type	get_next_token, @function
get_next_token:
	movq	48(%rdi), %rax
	pushq	%rbx
	movq	%rdi, %rbx
	testq	%rax, %rax
	je	.L223
	movq	56(%rdi), %rdx
	popq	%rbx
	movq	%rax, 80(%rdi)
	movdqu	64(%rdi), %xmm0
	movq	$0, 48(%rdi)
	movq	%rdx, 16(%rdi)
	movups	%xmm0, 32(%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L223:
	movsbl	%sil, %esi
	call	next_token
	movq	%rax, 80(%rbx)
	popq	%rbx
	ret
	.size	get_next_token, .-get_next_token
	.p2align 4
	.globl	peek_next_token
	.type	peek_next_token, @function
peek_next_token:
	movq	48(%rdi), %rax
	testq	%rax, %rax
	je	.L232
	ret
	.p2align 4,,10
	.p2align 3
.L232:
	pushq	%rbp
	movsbl	%sil, %esi
	pushq	%rbx
	movq	%rdi, %rbx
	subq	$24, %rsp
	movdqu	32(%rdi), %xmm1
	movq	16(%rdi), %rbp
	movaps	%xmm1, (%rsp)
	call	next_token
	movdqu	16(%rbx), %xmm0
	movdqu	32(%rbx), %xmm2
	movq	%rbp, 16(%rbx)
	movq	40(%rbx), %rdx
	movdqa	(%rsp), %xmm1
	movq	%rax, 80(%rbx)
	punpcklqdq	%xmm2, %xmm0
	movq	%rax, 48(%rbx)
	movq	%rdx, 72(%rbx)
	movups	%xmm0, 56(%rbx)
	movups	%xmm1, 32(%rbx)
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.size	peek_next_token, .-peek_next_token
	.p2align 4
	.globl	peek_current_token
	.type	peek_current_token, @function
peek_current_token:
	movq	80(%rdi), %rax
	ret
	.size	peek_current_token, .-peek_current_token
	.p2align 4
	.globl	reset_lexer
	.type	reset_lexer, @function
reset_lexer:
	pxor	%xmm0, %xmm0
	movq	$0, 16(%rdi)
	movq	$0, 48(%rdi)
	movq	$0, 72(%rdi)
	movq	$0, 80(%rdi)
	movups	%xmm0, 32(%rdi)
	movups	%xmm0, 56(%rdi)
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
