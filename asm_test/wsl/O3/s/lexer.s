	.file	"lexer.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Unterminated string literal"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Lexer Error at Line %zu, Column %zu: %s\n"
	.section	.rodata.str1.1
.LC2:
	.string	"src/lexer.c"
.LC3:
	.string	"c != '\\0'"
.LC4:
	.string	"Unterminated comment"
.LC5:
	.string	"Unexpected character"
	.text
	.p2align 4
	.type	next_token, @function
next_token:
	pushq	%r14
	pushq	%r13
	movl	%esi, %r13d
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	subq	$32, %rsp
	movq	8(%rdi), %rdi
	movq	16(%rbx), %rsi
	movq	32(%rbx), %r12
	cmpq	%rsi, %rdi
	jnb	.L2
	movq	(%rbx), %rcx
	leaq	1(%r12), %rax
	leaq	1(%rdi), %rbp
	movq	%rax, 32(%rbx)
	leaq	(%rcx,%rdi), %r9
	movq	%rbp, 8(%rbx)
	movzbl	(%r9), %edx
	cmpb	$32, %dl
	ja	.L3
	leaq	.L5(%rip), %r10
	movzbl	%dl, %r8d
	movslq	(%r10,%r8,4), %r8
	addq	%r10, %r8
	jmp	*%r8
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
	.long	.L205-.L5
	.long	.L6-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L205-.L5
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
	.long	.L205-.L5
	.text
	.p2align 4,,10
	.p2align 3
.L99:
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L2:
	movq	24(%rbx), %xmm0
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
	addq	$1, 24(%rbx)
	movq	$0, 32(%rbx)
.L205:
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
	leal	-48(%rdx), %r8d
	cmpb	$9, %r8b
	ja	.L11
	leaq	(%rsi,%r12), %r11
	subq	%rdi, %r11
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L207:
	leal	-48(%rdx), %r10d
	leaq	1(%rbp), %r8
	cmpb	$9, %r10b
	ja	.L22
	addq	$1, %rax
	movq	%r8, 8(%rbx)
	movq	%r8, %rbp
	movq	%rax, 32(%rbx)
	movzbl	-1(%rcx,%r8), %edx
.L12:
	cmpq	%rax, %r11
	jne	.L207
	leal	-48(%rdx), %r8d
	cmpb	$9, %r8b
	ja	.L22
.L103:
	movl	$2, %r13d
.L23:
	movq	24(%rbx), %xmm0
	movq	%r12, %xmm4
	leaq	-1(%rbp), %rsi
	subq	$1, %rax
	movq	%rsi, 8(%rbx)
	subq	%rdi, %rsi
	movq	%r9, %rdi
	punpcklqdq	%xmm4, %xmm0
	movq	%rax, 32(%rbx)
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
	jne	.L208
.L9:
	movabsq	$288230372997595135, %r8
	addq	%r12, %rsi
	subq	%rdi, %rsi
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L210:
	cmpb	$57, %dl
	jle	.L209
	subl	$65, %edx
	cmpb	$57, %dl
	ja	.L15
	btq	%rdx, %r8
	jnc	.L15
.L17:
	addq	$1, %rbp
	addq	$1, %rax
	movq	%rax, 32(%rbx)
	movq	%rbp, 8(%rbx)
	movzbl	-1(%rcx,%rbp), %edx
.L14:
	cmpq	%rax, %rsi
	jne	.L210
.L15:
	leaq	-1(%rbp), %rsi
	subq	$1, %rax
	movq	%rsi, 8(%rbx)
	subq	%rdi, %rsi
	movq	%r9, %rdi
	movq	%rax, 32(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%rax, %rdi
	call	*is_keyword@GOTPCREL(%rip)
	movq	24(%rbx), %xmm0
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
.L209:
	cmpb	$47, %dl
	jg	.L17
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L208:
	leal	-97(%rdx), %r8d
	cmpb	$25, %r8b
	jbe	.L9
	cmpq	%rsi, %rbp
	jnb	.L211
	movzbl	1(%rcx,%rdi), %r9d
	xorl	%r10d, %r10d
.L41:
	movq	24(%rbx), %xmm0
	cmpb	$61, %r9b
	movq	%r12, %xmm5
	sete	%r8b
	movdqa	%xmm0, %xmm6
	movl	%r8d, %ecx
	punpcklqdq	%xmm5, %xmm6
	movaps	%xmm6, 16(%rsp)
	movaps	%xmm6, (%rsp)
	cmpb	$61, %dl
	jne	.L91
	testb	%r8b, %r8b
	je	.L91
	addq	$2, %r12
	addq	$2, %rdi
	movq	%r12, 32(%rbx)
	movq	%rdi, 8(%rbx)
	movq	EQ_SYMBOL(%rip), %rbx
.L200:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	16(%rsp), %xmm6
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
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
	cmpq	%rsi, %rbp
	jnb	.L26
	leaq	2(%r12), %rax
	movq	%rax, 32(%rbx)
	leaq	2(%rdi), %rax
	movq	%rax, 8(%rbx)
	movzbl	1(%rcx,%rdi), %r13d
.L26:
	movabsq	$-17179870210, %rdi
	jmp	.L27
	.p2align 4,,10
	.p2align 3
.L213:
	leaq	1(%rax), %rdx
	addq	$1, 32(%rbx)
	movq	%rdx, 8(%rbx)
	movzbl	(%rcx,%rax), %r13d
.L27:
	cmpb	$34, %r13b
	jbe	.L212
.L29:
	movq	8(%rbx), %rax
	cmpq	%rsi, %rax
	jb	.L213
	xorl	%r13d, %r13d
.L28:
	movq	24(%rbx), %r14
	cmpb	$34, %r13b
	je	.L30
	xorl	%eax, %eax
	movq	stderr(%rip), %rdi
	leaq	1(%r14), %rcx
	movq	%rbp, %r8
	leaq	.LC0(%rip), %r9
	leaq	.LC1(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	cmpb	$10, %r13b
	je	.L31
	movq	24(%rbx), %xmm0
.L32:
	movq	(%rbx), %rdi
	movq	%r12, %xmm5
	movq	%rbp, %rsi
	punpcklqdq	%xmm5, %xmm0
	notq	%rsi
	addq	8(%rbx), %rsi
	movaps	%xmm0, (%rsp)
	addq	%rbp, %rdi
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
.L212:
	btq	%r13, %rdi
	jc	.L29
	jmp	.L28
.L11:
	cmpb	$47, %dl
	sete	%r8b
	movl	%r8d, %r10d
	cmpq	%rsi, %rbp
	jnb	.L97
	movzbl	1(%rcx,%rdi), %r9d
	cmpb	$47, %r9b
	jne	.L35
	testb	%r8b, %r8b
	je	.L35
	addq	%r12, %rsi
	movl	$47, %r8d
	subq	%rdi, %rsi
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L214:
	leaq	1(%rbp), %rdx
	testb	%r8b, %r8b
	je	.L37
	cmpb	$10, %r8b
	je	.L37
	addq	$1, %rax
	movq	%rdx, 8(%rbx)
	movq	%rdx, %rbp
	movq	%rax, 32(%rbx)
	movzbl	-1(%rcx,%rdx), %r8d
.L36:
	cmpq	%rsi, %rax
	jne	.L214
.L37:
	leaq	-1(%rbp), %rsi
	subq	$1, %rax
	movq	%rsi, 8(%rbx)
	movq	%rax, 32(%rbx)
	testb	%r13b, %r13b
	jne	.L205
	movq	24(%rbx), %xmm0
	movq	%r12, %xmm7
	addq	$2, %rdi
	subq	%rdi, %rsi
	addq	%rcx, %rdi
	punpcklqdq	%xmm7, %xmm0
	movaps	%xmm0, (%rsp)
.L199:
	call	*create_string@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm0
	movl	$7, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L1
.L30:
	movq	%rbp, %rsi
	leaq	(%rcx,%rbp), %rdi
	notq	%rsi
	addq	8(%rbx), %rsi
	call	*create_string@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, %xmm0
	movq	%r12, %xmm7
	punpcklqdq	%xmm7, %xmm0
	movl	$4, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L1
.L31:
	movq	24(%rbx), %rax
	movq	$0, 32(%rbx)
	addq	$1, %rax
	movq	%rax, 24(%rbx)
	movq	%rax, %xmm0
	jmp	.L32
.L211:
	xorl	%r10d, %r10d
.L97:
	movq	24(%rbx), %xmm0
	movq	%r12, %xmm7
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	movdqa	%xmm0, %xmm6
	punpcklqdq	%xmm7, %xmm6
	movaps	%xmm6, (%rsp)
.L34:
	cmpb	$43, %dl
	jne	.L55
	testb	%cl, %cl
	je	.L55
	cmpq	%rsi, %rbp
	jnb	.L56
	addq	$2, %r12
	addq	$2, %rdi
	movq	%r12, 32(%rbx)
	movq	%rdi, 8(%rbx)
.L56:
	movq	32(%rbx), %rax
	movq	ADD_ASSIGN_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm7
	punpcklqdq	%xmm7, %xmm0
	movaps	%xmm0, (%rsp)
.L201:
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
	testb	%cl, %cl
	je	.L57
	cmpq	%rsi, %rbp
	jnb	.L58
	addq	$2, %r12
	addq	$2, %rdi
	movq	%r12, 32(%rbx)
	movq	%rdi, 8(%rbx)
.L58:
	movq	32(%rbx), %rax
	movq	SUB_ASSIGN_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm5
	punpcklqdq	%xmm5, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L201
.L35:
	cmpb	$42, %r9b
	jne	.L41
	testb	%r8b, %r8b
	je	.L41
	leaq	2(%rdi), %r14
	movl	$42, %edx
	movl	$47, %eax
	.p2align 4,,10
	.p2align 3
.L42:
	cmpb	$42, %al
	jne	.L165
	cmpb	$47, %dl
	je	.L215
.L165:
	cmpq	%rbp, %rsi
	je	.L43
	addq	$1, %rbp
	addq	$1, 32(%rbx)
	movq	%rbp, 8(%rbx)
	movzbl	-1(%rcx,%rbp), %eax
	cmpq	%rsi, %rbp
	jnb	.L216
	movzbl	(%rcx,%rbp), %edx
	cmpb	$10, %al
	jne	.L47
	addq	$1, 24(%rbx)
	movq	$0, 32(%rbx)
	testb	%dl, %dl
	jne	.L165
	jmp	.L198
	.p2align 4,,10
	.p2align 3
.L47:
	testb	%dl, %dl
	je	.L45
	testb	%al, %al
	jne	.L42
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$125, %edx
	leaq	.LC2(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	*__assert_fail@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L216:
	cmpb	$10, %al
	jne	.L45
	movq	24(%rbx), %rax
	movq	$0, 32(%rbx)
	addq	$1, %rax
	movq	%rax, 24(%rbx)
.L46:
	leaq	1(%rax), %rcx
	leaq	3(%rdi), %r8
	xorl	%eax, %eax
	movq	stderr(%rip), %rdi
	leaq	.LC4(%rip), %r9
	leaq	.LC1(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	testb	%r13b, %r13b
	jne	.L205
	movq	24(%rbx), %xmm0
	movq	8(%rbx), %rsi
	movq	%r12, %xmm6
	movq	(%rbx), %rdi
	punpcklqdq	%xmm6, %xmm0
	subq	%r14, %rsi
	movaps	%xmm0, (%rsp)
	addq	%r14, %rdi
	jmp	.L199
.L215:
	movq	8(%rbx), %rax
	cmpq	%rsi, %rax
	jnb	.L95
	addq	$1, %rax
	addq	$1, 32(%rbx)
	movq	%rax, 8(%rbx)
.L95:
	testb	%r13b, %r13b
	jne	.L205
	movq	24(%rbx), %xmm0
	movq	%r12, %xmm5
	subq	%r14, %rax
	leaq	(%rcx,%r14), %rdi
	leaq	-2(%rax), %rsi
	punpcklqdq	%xmm5, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L199
.L45:
	testb	%al, %al
	jne	.L198
	.p2align 4,,10
	.p2align 3
.L43:
	subq	$1, 8(%rbx)
	subq	$1, 32(%rbx)
.L198:
	movq	24(%rbx), %rax
	jmp	.L46
.L57:
	cmpb	$42, %dl
	jne	.L59
	testb	%cl, %cl
	je	.L61
	cmpq	%rsi, %rbp
	jnb	.L60
	addq	$2, %r12
	addq	$2, %rdi
	movq	%r12, 32(%rbx)
	movq	%rdi, 8(%rbx)
.L60:
	movq	32(%rbx), %rax
	movq	MUL_ASSIGN_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm6
	punpcklqdq	%xmm6, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L201
.L61:
	cmpb	$37, %dl
	jne	.L63
	testb	%cl, %cl
	je	.L63
	cmpq	%rsi, %rbp
	jnb	.L64
	addq	$2, %r12
	addq	$2, %rdi
	movq	%r12, 32(%rbx)
	movq	%rdi, 8(%rbx)
.L64:
	movq	32(%rbx), %rax
	movq	MOD_ASSIGN_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm5
	punpcklqdq	%xmm5, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L201
.L63:
	cmpb	$38, %dl
	jne	.L65
	cmpb	$38, %r9b
	jne	.L65
	cmpq	%rsi, %rbp
	jnb	.L66
	addq	$2, %r12
	addq	$2, %rdi
	movq	%r12, 32(%rbx)
	movq	%rdi, 8(%rbx)
.L66:
	movq	32(%rbx), %rax
	movq	AND_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm6
	punpcklqdq	%xmm6, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L201
.L59:
	testb	%cl, %cl
	je	.L61
	testb	%r10b, %r10b
	je	.L61
	cmpq	%rsi, %rbp
	jnb	.L62
	addq	$2, %r12
	addq	$2, %rdi
	movq	%r12, 32(%rbx)
	movq	%rdi, 8(%rbx)
.L62:
	movq	32(%rbx), %rax
	movq	DIV_ASSIGN_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm7
	punpcklqdq	%xmm7, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L201
.L65:
	cmpb	$124, %dl
	jne	.L67
	cmpb	$124, %r9b
	jne	.L67
	cmpq	%rsi, %rbp
	jnb	.L68
	addq	$2, %r12
	addq	$2, %rdi
	movq	%r12, 32(%rbx)
	movq	%rdi, 8(%rbx)
.L68:
	movq	32(%rbx), %rax
	movq	OR_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm7
	punpcklqdq	%xmm7, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L201
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
	jne	.L217
.L53:
	cmpb	$60, %dl
	jne	.L94
	testb	%r8b, %r8b
	je	.L94
	addq	$2, %rdi
	addq	$2, %r12
	movq	%rdi, 8(%rbx)
	movl	$32, %edi
	movq	%r12, 32(%rbx)
	movq	LE_SYMBOL(%rip), %rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	16(%rsp), %xmm5
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm5, 8(%rax)
	jmp	.L1
.L217:
	addq	$2, %r12
	addq	$2, %rdi
	movq	%r12, 32(%rbx)
	movq	%rdi, 8(%rbx)
	movq	NE_SYMBOL(%rip), %rbx
	jmp	.L200
.L70:
	movq	R_BRACE_SYMBOL(%rip), %rbx
.L204:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm5
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm5, 8(%rax)
	jmp	.L1
.L94:
	cmpb	$62, %dl
	jne	.L34
	testb	%r8b, %r8b
	je	.L34
	cmpq	%rsi, %rbp
	jnb	.L54
	addq	$2, %r12
	addq	$2, %rdi
	movq	%r12, 32(%rbx)
	movq	%rdi, 8(%rbx)
.L54:
	movq	32(%rbx), %rax
	movq	GE_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm6
	punpcklqdq	%xmm6, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L201
.L72:
	movq	L_BRACE_SYMBOL(%rip), %rbx
.L202:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm7
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm7, 8(%rax)
	jmp	.L1
.L73:
	movq	R_BRACKET_SYMBOL(%rip), %rbx
	jmp	.L202
.L74:
	movq	L_BRACKET_SYMBOL(%rip), %rbx
.L203:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm6
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L1
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
	jmp	.L204
.L79:
	movq	DIV_SYMBOL(%rip), %rbx
	jmp	.L203
.L80:
	movq	DOT_SYMBOL(%rip), %rbx
	jmp	.L204
.L81:
	movq	SUB_SYMBOL(%rip), %rbx
	jmp	.L202
.L82:
	movq	COMMA_SYMBOL(%rip), %rbx
	jmp	.L203
.L83:
	movq	ADD_SYMBOL(%rip), %rbx
	jmp	.L203
.L84:
	movq	MUL_SYMBOL(%rip), %rbx
	jmp	.L204
.L85:
	movq	R_PAREN_SYMBOL(%rip), %rbx
	jmp	.L203
.L86:
	movq	L_PAREN_SYMBOL(%rip), %rbx
	jmp	.L204
.L87:
	movq	MOD_SYMBOL(%rip), %rbx
	jmp	.L202
.L88:
	movq	NOT_SYMBOL(%rip), %rbx
	jmp	.L202
.L69:
	movq	%xmm0, %rcx
	movq	%rax, %r8
	xorl	%eax, %eax
	movq	stderr(%rip), %rdi
	addq	$1, %rcx
	leaq	.LC1(%rip), %rdx
	movl	$2, %esi
	leaq	.LC5(%rip), %r9
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	pxor	%xmm0, %xmm0
	movl	%edx, 24(%rax)
	movq	%rcx, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L1
.L22:
	cmpq	%rsi, %rbp
	jnb	.L103
	cmpb	$46, %dl
	jne	.L103
	leaq	(%rcx,%rbp), %r8
	movzbl	(%r8), %edx
	subl	$48, %edx
	cmpb	$9, %dl
	ja	.L103
	leaq	1(%rax), %r10
	leaq	1(%rbp), %r11
	addq	%rax, %rsi
	movq	%r10, 32(%rbx)
	subq	%rbp, %rsi
	movq	%r10, %rax
	movq	%r11, %rbp
	movq	%r11, 8(%rbx)
	movzbl	(%r8), %edx
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L218:
	subl	$48, %edx
	leaq	1(%rbp), %r8
	cmpb	$9, %dl
	ja	.L104
	addq	$1, %rax
	movq	%r8, 8(%rbx)
	movq	%r8, %rbp
	movq	%rax, 32(%rbx)
	movzbl	-1(%rcx,%r8), %edx
.L24:
	cmpq	%rax, %rsi
	jne	.L218
.L104:
	movl	$3, %r13d
	jmp	.L23
	.size	next_token, .-next_token
	.p2align 4
	.globl	create_lexer
	.type	create_lexer, @function
create_lexer:
	pushq	%rbp
	movq	%rdi, %rbp
	movl	$80, %edi
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$8, %rsp
	call	*alloc_memory@GOTPCREL(%rip)
	pxor	%xmm0, %xmm0
	movq	%rbp, (%rax)
	movq	$0, 8(%rax)
	movq	%rbx, 16(%rax)
	movq	$0, 24(%rax)
	movq	$0, 32(%rax)
	movq	$0, 40(%rax)
	movq	$0, 64(%rax)
	movq	$0, 72(%rax)
	movups	%xmm0, 48(%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.size	create_lexer, .-create_lexer
	.p2align 4
	.globl	get_next_token
	.type	get_next_token, @function
get_next_token:
	movq	40(%rdi), %rax
	pushq	%rbx
	movq	%rdi, %rbx
	testq	%rax, %rax
	je	.L222
	movq	48(%rdi), %rdx
	popq	%rbx
	movq	%rax, 72(%rdi)
	movdqu	56(%rdi), %xmm0
	movq	$0, 40(%rdi)
	movq	%rdx, 8(%rdi)
	movups	%xmm0, 24(%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L222:
	movsbl	%sil, %esi
	call	next_token
	movq	%rax, 72(%rbx)
	popq	%rbx
	ret
	.size	get_next_token, .-get_next_token
	.p2align 4
	.globl	peek_next_token
	.type	peek_next_token, @function
peek_next_token:
	movq	40(%rdi), %rax
	testq	%rax, %rax
	je	.L231
	ret
	.p2align 4,,10
	.p2align 3
.L231:
	pushq	%rbp
	movsbl	%sil, %esi
	pushq	%rbx
	movq	%rdi, %rbx
	subq	$24, %rsp
	movdqu	24(%rdi), %xmm1
	movq	8(%rdi), %rbp
	movaps	%xmm1, (%rsp)
	call	next_token
	movdqu	8(%rbx), %xmm0
	movdqu	24(%rbx), %xmm2
	movq	%rbp, 8(%rbx)
	movq	32(%rbx), %rdx
	movdqa	(%rsp), %xmm1
	movq	%rax, 72(%rbx)
	punpcklqdq	%xmm2, %xmm0
	movq	%rax, 40(%rbx)
	movq	%rdx, 64(%rbx)
	movups	%xmm0, 48(%rbx)
	movups	%xmm1, 24(%rbx)
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.size	peek_next_token, .-peek_next_token
	.p2align 4
	.globl	peek_current_token
	.type	peek_current_token, @function
peek_current_token:
	movq	72(%rdi), %rax
	ret
	.size	peek_current_token, .-peek_current_token
	.p2align 4
	.globl	reset_lexer
	.type	reset_lexer, @function
reset_lexer:
	pxor	%xmm0, %xmm0
	movq	$0, 8(%rdi)
	movq	$0, 40(%rdi)
	movq	$0, 64(%rdi)
	movq	$0, 72(%rdi)
	movups	%xmm0, 24(%rdi)
	movups	%xmm0, 48(%rdi)
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
