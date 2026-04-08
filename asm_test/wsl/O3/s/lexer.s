	.file	"lexer.c"
	.text
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
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	subq	$32, %rsp
	movq	16(%rdi), %rdi
	movq	24(%rbx), %rcx
	movq	40(%rbx), %r12
	cmpq	%rcx, %rdi
	jnb	.L2
	movq	8(%rbx), %r8
	leaq	1(%r12), %rax
	leaq	1(%rdi), %rbp
	movl	%esi, %r13d
	movq	%rax, 40(%rbx)
	leaq	(%r8,%rdi), %r9
	movq	%rbp, 16(%rbx)
	movzbl	(%r9), %edx
	cmpb	$32, %dl
	ja	.L3
	leaq	.L5(%rip), %r10
	movzbl	%dl, %esi
	movslq	(%r10,%rsi,4), %rsi
	addq	%r10, %rsi
	jmp	*%rsi
	.section	.rodata
	.align 4
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
	.long	.L208-.L5
	.long	.L6-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L208-.L5
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
	.long	.L208-.L5
	.text
	.p2align 4,,10
	.p2align 3
.L99:
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L2:
	movq	32(%rbx), %xmm0
	movq	%r12, %xmm1
	movl	$32, %edi
	punpcklqdq	%xmm1, %xmm0
	movaps	%xmm0, (%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm0
	movl	$0, 24(%rax)
	movq	$0, (%rax)
	movups	%xmm0, 8(%rax)
.L1:
	addq	$32, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	addq	$1, 32(%rbx)
	movq	$0, 40(%rbx)
.L208:
	addq	$32, %rsp
	movsbl	%r13b, %esi
	movq	%rbx, %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	next_token
	.p2align 4,,10
	.p2align 3
.L3:
	cmpb	$90, %dl
	jg	.L8
	cmpb	$64, %dl
	jg	.L9
	cmpb	$34, %dl
	je	.L10
	leal	-48(%rdx), %esi
	cmpb	$9, %sil
	ja	.L11
	leaq	(%rcx,%r12), %r11
	subq	%rdi, %r11
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L210:
	leal	-48(%rdx), %r10d
	leaq	1(%rbp), %rsi
	cmpb	$9, %r10b
	ja	.L22
	addq	$1, %rax
	movq	%rsi, 16(%rbx)
	movq	%rsi, %rbp
	movq	%rax, 40(%rbx)
	movzbl	-1(%r8,%rsi), %edx
.L12:
	cmpq	%rax, %r11
	jne	.L210
	leal	-48(%rdx), %esi
	cmpb	$9, %sil
	ja	.L22
.L103:
	movl	$2, %r13d
.L23:
	movq	32(%rbx), %xmm0
	movq	%r12, %xmm4
	leaq	-1(%rbp), %rsi
	subq	$1, %rax
	movq	%rsi, 16(%rbx)
	subq	%rdi, %rsi
	movq	%r9, %rdi
	punpcklqdq	%xmm4, %xmm0
	movq	%rax, 40(%rbx)
	movaps	%xmm0, (%rsp)
	call	*create_string@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm0
	movl	%r13d, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L8:
	cmpb	$95, %dl
	jne	.L211
.L9:
	movabsq	$288230372997595135, %rsi
	addq	%r12, %rcx
	subq	%rdi, %rcx
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L213:
	cmpb	$57, %dl
	jle	.L212
	subl	$65, %edx
	cmpb	$57, %dl
	ja	.L15
	btq	%rdx, %rsi
	jnc	.L15
.L17:
	addq	$1, %rbp
	addq	$1, %rax
	movq	%rax, 40(%rbx)
	movq	%rbp, 16(%rbx)
	movzbl	-1(%r8,%rbp), %edx
.L14:
	cmpq	%rax, %rcx
	jne	.L213
.L15:
	leaq	-1(%rbp), %rsi
	subq	$1, %rax
	movq	%rsi, 16(%rbx)
	subq	%rdi, %rsi
	movq	%r9, %rdi
	movq	%rax, 40(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%rax, %rdi
	call	*is_keyword@GOTPCREL(%rip)
	movq	32(%rbx), %xmm0
	testb	%al, %al
	je	.L19
	movq	%r12, %xmm2
	movl	$32, %edi
	punpcklqdq	%xmm2, %xmm0
	movaps	%xmm0, (%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm0
	movl	$6, 24(%rax)
	movq	%rbp, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L212:
	cmpb	$47, %dl
	jg	.L17
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L211:
	leal	-97(%rdx), %esi
	cmpb	$25, %sil
	jbe	.L9
	cmpq	%rcx, %rbp
	jnb	.L214
	movzbl	1(%r8,%rdi), %r9d
	xorl	%r10d, %r10d
.L41:
	movq	32(%rbx), %xmm0
	cmpb	$61, %r9b
	movq	%r12, %xmm5
	sete	%r8b
	movdqa	%xmm0, %xmm6
	movl	%r8d, %esi
	punpcklqdq	%xmm5, %xmm6
	movaps	%xmm6, 16(%rsp)
	movaps	%xmm6, (%rsp)
	cmpb	$61, %dl
	jne	.L91
	testb	%r8b, %r8b
	je	.L91
	addq	$2, %r12
	addq	$2, %rdi
	movq	%r12, 40(%rbx)
	movq	%rdi, 16(%rbx)
	movq	EQ_SYMBOL(%rip), %rbx
.L204:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	16(%rsp), %xmm7
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm7, 8(%rax)
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L19:
	movq	%r12, %xmm3
	movl	$32, %edi
	punpcklqdq	%xmm3, %xmm0
	movaps	%xmm0, (%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm0
	movl	$1, 24(%rax)
	movq	%rbp, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L10:
	xorl	%r13d, %r13d
	cmpq	%rcx, %rbp
	jnb	.L26
	leaq	2(%r12), %rax
	movq	%rax, 40(%rbx)
	leaq	2(%rdi), %rax
	movq	%rax, 16(%rbx)
	movzbl	1(%r8,%rdi), %r13d
.L26:
	movabsq	$-17179870210, %rsi
	jmp	.L27
	.p2align 4,,10
	.p2align 3
.L216:
	leaq	1(%rax), %rdx
	addq	$1, 40(%rbx)
	movq	%rdx, 16(%rbx)
	movzbl	(%r8,%rax), %r13d
.L27:
	cmpb	$34, %r13b
	jbe	.L215
.L29:
	movq	16(%rbx), %rax
	cmpq	%rcx, %rax
	jb	.L216
	xorl	%r13d, %r13d
.L28:
	movq	32(%rbx), %rax
	cmpb	$34, %r13b
	je	.L30
	subq	$8, %rsp
	movq	(%rbx), %rcx
	leaq	1(%rax), %r8
	movq	%rbp, %r9
	leaq	.LC1(%rip), %rdi
	leaq	.LC0(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	pushq	%rdi
	movq	stderr(%rip), %rdi
	call	*__fprintf_chk@GOTPCREL(%rip)
	popq	%r11
	movq	32(%rbx), %rax
	popq	%r14
	cmpb	$10, %r13b
	jne	.L30
	addq	$1, %rax
	movq	$0, 40(%rbx)
	movq	%rax, 32(%rbx)
	.p2align 4,,10
	.p2align 3
.L30:
	movq	16(%rbx), %rsi
	movq	%rax, %xmm0
	movq	%r12, %xmm5
	leaq	.LC2(%rip), %rdi
	punpcklqdq	%xmm5, %xmm0
	subq	%rbp, %rsi
	movaps	%xmm0, (%rsp)
	cmpq	$1, %rsi
	je	.L202
	movq	8(%rbx), %rdi
	subq	$1, %rsi
	addq	%rbp, %rdi
.L202:
	call	*create_string@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm0
	movl	$4, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L215:
	btq	%r13, %rsi
	jc	.L29
	jmp	.L28
.L11:
	cmpb	$47, %dl
	sete	%sil
	movl	%esi, %r10d
	cmpq	%rcx, %rbp
	jnb	.L97
	movzbl	1(%r8,%rdi), %r9d
	cmpb	$47, %r9b
	jne	.L35
	testb	%sil, %sil
	je	.L35
	addq	%r12, %rcx
	movl	$47, %esi
	subq	%rdi, %rcx
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L217:
	leaq	1(%rbp), %rdx
	testb	%sil, %sil
	je	.L37
	cmpb	$10, %sil
	je	.L37
	addq	$1, %rax
	movq	%rdx, 16(%rbx)
	movq	%rdx, %rbp
	movq	%rax, 40(%rbx)
	movzbl	-1(%r8,%rdx), %esi
.L36:
	cmpq	%rcx, %rax
	jne	.L217
.L37:
	leaq	-1(%rbp), %rsi
	subq	$1, %rax
	movq	%rsi, 16(%rbx)
	movq	%rax, 40(%rbx)
	testb	%r13b, %r13b
	jne	.L208
	movq	32(%rbx), %xmm0
	movq	%r12, %xmm7
	addq	$2, %rdi
	subq	%rdi, %rsi
	addq	%r8, %rdi
	punpcklqdq	%xmm7, %xmm0
	movaps	%xmm0, (%rsp)
.L203:
	call	*create_string@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm0
	movl	$7, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L1
.L214:
	xorl	%r10d, %r10d
.L97:
	movq	32(%rbx), %xmm0
	movq	%r12, %xmm7
	xorl	%r9d, %r9d
	xorl	%esi, %esi
	movdqa	%xmm0, %xmm6
	punpcklqdq	%xmm7, %xmm6
	movaps	%xmm6, (%rsp)
.L34:
	cmpb	$43, %dl
	jne	.L55
	testb	%sil, %sil
	je	.L55
	cmpq	%rcx, %rbp
	jnb	.L56
	addq	$2, %r12
	addq	$2, %rdi
	movq	%r12, 40(%rbx)
	movq	%rdi, 16(%rbx)
.L56:
	movq	40(%rbx), %rax
	movq	ADD_ASSIGN_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm6
	punpcklqdq	%xmm6, %xmm0
	movaps	%xmm0, (%rsp)
.L205:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm0
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L1
.L55:
	cmpb	$45, %dl
	jne	.L57
	testb	%sil, %sil
	je	.L57
	cmpq	%rcx, %rbp
	jnb	.L58
	addq	$2, %r12
	addq	$2, %rdi
	movq	%r12, 40(%rbx)
	movq	%rdi, 16(%rbx)
.L58:
	movq	40(%rbx), %rax
	movq	SUB_ASSIGN_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm7
	punpcklqdq	%xmm7, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L205
.L35:
	cmpb	$42, %r9b
	jne	.L41
	testb	%sil, %sil
	je	.L41
	leaq	2(%rdi), %r14
	movl	$42, %edx
	movl	$47, %eax
	.p2align 4,,10
	.p2align 3
.L42:
	cmpb	$42, %al
	jne	.L167
	cmpb	$47, %dl
	je	.L218
.L167:
	cmpq	%rbp, %rcx
	je	.L43
	addq	$1, %rbp
	addq	$1, 40(%rbx)
	movq	%rbp, 16(%rbx)
	movzbl	-1(%r8,%rbp), %eax
	cmpq	%rcx, %rbp
	jnb	.L219
	movzbl	(%r8,%rbp), %edx
	cmpb	$10, %al
	jne	.L47
	addq	$1, 32(%rbx)
	movq	$0, 40(%rbx)
	testb	%dl, %dl
	jne	.L167
	jmp	.L201
	.p2align 4,,10
	.p2align 3
.L47:
	testb	%dl, %dl
	je	.L45
	testb	%al, %al
	jne	.L42
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$127, %edx
	leaq	.LC3(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	call	*__assert_fail@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L219:
	cmpb	$10, %al
	jne	.L45
	movq	32(%rbx), %rax
	movq	$0, 40(%rbx)
	addq	$1, %rax
	movq	%rax, 32(%rbx)
.L46:
	subq	$8, %rsp
	leaq	3(%rdi), %r9
	movq	(%rbx), %rcx
	leaq	1(%rax), %r8
	leaq	.LC5(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	pushq	%rdx
	leaq	.LC0(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	popq	%r9
	popq	%r10
	testb	%r13b, %r13b
	jne	.L208
	movq	32(%rbx), %xmm0
	movq	16(%rbx), %rsi
	movq	%r12, %xmm7
	movq	8(%rbx), %rdi
	punpcklqdq	%xmm7, %xmm0
	subq	%r14, %rsi
	movaps	%xmm0, (%rsp)
	addq	%r14, %rdi
	jmp	.L203
.L218:
	movq	16(%rbx), %rax
	cmpq	%rcx, %rax
	jnb	.L95
	addq	$1, %rax
	addq	$1, 40(%rbx)
	movq	%rax, 16(%rbx)
.L95:
	testb	%r13b, %r13b
	jne	.L208
	movq	32(%rbx), %xmm0
	movq	%r12, %xmm7
	subq	%r14, %rax
	leaq	(%r8,%r14), %rdi
	leaq	-2(%rax), %rsi
	punpcklqdq	%xmm7, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L203
.L45:
	testb	%al, %al
	jne	.L201
	.p2align 4,,10
	.p2align 3
.L43:
	subq	$1, 16(%rbx)
	subq	$1, 40(%rbx)
.L201:
	movq	32(%rbx), %rax
	jmp	.L46
.L57:
	cmpb	$42, %dl
	jne	.L59
	testb	%sil, %sil
	je	.L61
	cmpq	%rcx, %rbp
	jnb	.L60
	addq	$2, %r12
	addq	$2, %rdi
	movq	%r12, 40(%rbx)
	movq	%rdi, 16(%rbx)
.L60:
	movq	40(%rbx), %rax
	movq	MUL_ASSIGN_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm6
	punpcklqdq	%xmm6, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L205
.L61:
	cmpb	$37, %dl
	jne	.L63
	testb	%sil, %sil
	je	.L63
	cmpq	%rcx, %rbp
	jnb	.L64
	addq	$2, %r12
	addq	$2, %rdi
	movq	%r12, 40(%rbx)
	movq	%rdi, 16(%rbx)
.L64:
	movq	40(%rbx), %rax
	movq	MOD_ASSIGN_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm6
	punpcklqdq	%xmm6, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L205
.L63:
	cmpb	$38, %dl
	jne	.L65
	cmpb	$38, %r9b
	jne	.L65
	cmpq	%rcx, %rbp
	jnb	.L66
	addq	$2, %r12
	addq	$2, %rdi
	movq	%r12, 40(%rbx)
	movq	%rdi, 16(%rbx)
.L66:
	movq	40(%rbx), %rax
	movq	AND_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm7
	punpcklqdq	%xmm7, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L205
.L59:
	testb	%sil, %sil
	je	.L61
	testb	%r10b, %r10b
	je	.L61
	cmpq	%rcx, %rbp
	jnb	.L62
	addq	$2, %r12
	addq	$2, %rdi
	movq	%r12, 40(%rbx)
	movq	%rdi, 16(%rbx)
.L62:
	movq	40(%rbx), %rax
	movq	DIV_ASSIGN_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm7
	punpcklqdq	%xmm7, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L205
.L65:
	cmpb	$124, %dl
	jne	.L67
	cmpb	$124, %r9b
	jne	.L67
	cmpq	%rcx, %rbp
	jnb	.L68
	addq	$2, %r12
	addq	$2, %rdi
	movq	%r12, 40(%rbx)
	movq	%rdi, 16(%rbx)
.L68:
	movq	40(%rbx), %rax
	movq	OR_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm6
	punpcklqdq	%xmm6, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L205
.L67:
	subl	$33, %edx
	cmpb	$92, %dl
	ja	.L69
	leaq	.L71(%rip), %rcx
	movzbl	%dl, %edx
	movslq	(%rcx,%rdx,4), %rdx
	addq	%rcx, %rdx
	jmp	*%rdx
	.section	.rodata
	.align 4
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
	cmpb	$33, %dl
	jne	.L53
	testb	%r8b, %r8b
	jne	.L220
.L53:
	cmpb	$60, %dl
	jne	.L94
	testb	%r8b, %r8b
	je	.L94
	addq	$2, %rdi
	addq	$2, %r12
	movq	%rdi, 16(%rbx)
	movl	$32, %edi
	movq	%r12, 40(%rbx)
	movq	LE_SYMBOL(%rip), %rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	16(%rsp), %xmm6
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L1
.L220:
	addq	$2, %r12
	addq	$2, %rdi
	movq	%r12, 40(%rbx)
	movq	%rdi, 16(%rbx)
	movq	NE_SYMBOL(%rip), %rbx
	jmp	.L204
.L70:
	movq	R_BRACE_SYMBOL(%rip), %rbx
.L207:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm6
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L1
.L94:
	cmpb	$62, %dl
	jne	.L34
	testb	%r8b, %r8b
	je	.L34
	cmpq	%rcx, %rbp
	jnb	.L54
	addq	$2, %r12
	addq	$2, %rdi
	movq	%r12, 40(%rbx)
	movq	%rdi, 16(%rbx)
.L54:
	movq	40(%rbx), %rax
	movq	GE_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm7
	punpcklqdq	%xmm7, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L205
.L72:
	movq	L_BRACE_SYMBOL(%rip), %rbx
.L206:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm7
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm7, 8(%rax)
	jmp	.L1
.L73:
	movq	R_BRACKET_SYMBOL(%rip), %rbx
	jmp	.L206
.L74:
	movq	L_BRACKET_SYMBOL(%rip), %rbx
	jmp	.L207
.L75:
	movq	GT_SYMBOL(%rip), %rbx
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm3
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm3, 8(%rax)
	jmp	.L1
.L76:
	movq	ASSIGN_SYMBOL(%rip), %rbx
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm4
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm4, 8(%rax)
	jmp	.L1
.L77:
	movq	LT_SYMBOL(%rip), %rbx
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm2
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm2, 8(%rax)
	jmp	.L1
.L78:
	movq	SEMICOLON_SYMBOL(%rip), %rbx
	jmp	.L207
.L79:
	movq	DIV_SYMBOL(%rip), %rbx
	jmp	.L207
.L80:
	movq	DOT_SYMBOL(%rip), %rbx
	jmp	.L206
.L81:
	movq	SUB_SYMBOL(%rip), %rbx
	jmp	.L207
.L82:
	movq	COMMA_SYMBOL(%rip), %rbx
	jmp	.L206
.L83:
	movq	ADD_SYMBOL(%rip), %rbx
	jmp	.L206
.L84:
	movq	MUL_SYMBOL(%rip), %rbx
	jmp	.L206
.L85:
	movq	R_PAREN_SYMBOL(%rip), %rbx
	jmp	.L207
.L86:
	movq	L_PAREN_SYMBOL(%rip), %rbx
	jmp	.L206
.L87:
	movq	MOD_SYMBOL(%rip), %rbx
	jmp	.L206
.L88:
	movq	NOT_SYMBOL(%rip), %rbx
	jmp	.L207
.L69:
	movq	%rax, %r9
	leaq	.LC6(%rip), %rcx
	movq	%xmm0, %rax
	movl	$2, %esi
	leaq	1(%rax), %r8
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	pushq	%rdx
	leaq	.LC0(%rip), %rdx
	pushq	%rcx
	movq	(%rbx), %rcx
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	pxor	%xmm0, %xmm0
	movl	%ecx, 24(%rax)
	movq	%rsi, (%rax)
	movups	%xmm0, 8(%rax)
	popq	%rdi
	popq	%r8
	jmp	.L1
.L22:
	cmpq	%rcx, %rbp
	jnb	.L103
	cmpb	$46, %dl
	jne	.L103
	leaq	(%r8,%rbp), %rsi
	movzbl	(%rsi), %edx
	subl	$48, %edx
	cmpb	$9, %dl
	ja	.L103
	leaq	1(%rax), %r10
	leaq	1(%rbp), %r11
	addq	%rax, %rcx
	movq	%r10, 40(%rbx)
	subq	%rbp, %rcx
	movq	%r10, %rax
	movq	%r11, %rbp
	movq	%r11, 16(%rbx)
	movzbl	(%rsi), %edx
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L221:
	subl	$48, %edx
	leaq	1(%rbp), %rsi
	cmpb	$9, %dl
	ja	.L104
	addq	$1, %rax
	movq	%rsi, 16(%rbx)
	movq	%rsi, %rbp
	movq	%rax, 40(%rbx)
	movzbl	-1(%r8,%rsi), %edx
.L24:
	cmpq	%rax, %rcx
	jne	.L221
.L104:
	movl	$3, %r13d
	jmp	.L23
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
	je	.L225
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
.L225:
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
	je	.L234
	ret
	.p2align 4,,10
	.p2align 3
.L234:
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
