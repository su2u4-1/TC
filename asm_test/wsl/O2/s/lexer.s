	.file	"lexer.c"
	.text
	.p2align 4
	.type	get_current_char.isra.0, @function
get_current_char.isra.0:
.LFB79:
	.cfi_startproc
	movq	8(%rdi), %rax
	cmpq	16(%rdi), %rax
	jnb	.L1
	addq	$1, %rax
	addq	$1, 32(%rdi)
	movq	%rax, 8(%rdi)
.L1:
	ret
	.cfi_endproc
.LFE79:
	.size	get_current_char.isra.0, .-get_current_char.isra.0
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
.LFB72:
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
	movq	8(%rdi), %rcx
	movq	16(%rdi), %rdx
	movq	32(%rdi), %r12
	cmpq	%rdx, %rcx
	jnb	.L5
	leaq	1(%r12), %r8
	leaq	1(%rcx), %rbp
	movl	%esi, %r13d
	movq	%r8, 32(%rdi)
	movq	(%rdi), %rdi
	movq	%rbp, 8(%rbx)
	leaq	(%rdi,%rcx), %r9
	movzbl	(%r9), %eax
	cmpb	$32, %al
	ja	.L6
	leaq	.L8(%rip), %r10
	movzbl	%al, %esi
	movslq	(%r10,%rsi,4), %rsi
	addq	%r10, %rsi
	notrack jmp	*%rsi
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
	.long	.L196-.L8
	.long	.L9-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L196-.L8
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
	.long	.L196-.L8
	.text
	.p2align 4,,10
	.p2align 3
.L93:
	movq	%r8, %r12
	.p2align 4,,10
	.p2align 3
.L5:
	movq	24(%rbx), %xmm0
	movq	%r12, %xmm1
	movl	$32, %edi
	punpcklqdq	%xmm1, %xmm0
	movaps	%xmm0, (%rsp)
	call	alloc_memory@PLT
	movdqa	(%rsp), %xmm0
	movl	$0, 24(%rax)
	movq	$0, (%rax)
	movups	%xmm0, 8(%rax)
.L4:
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
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	.cfi_restore_state
	addq	$1, 24(%rbx)
	movq	$0, 32(%rbx)
.L196:
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movsbl	%r13b, %esi
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
	.p2align 4,,10
	.p2align 3
.L6:
	.cfi_restore_state
	cmpb	$90, %al
	jg	.L11
	cmpb	$64, %al
	jg	.L12
	cmpb	$34, %al
	je	.L13
	leal	-48(%rax), %esi
	cmpb	$9, %sil
	jbe	.L15
	jmp	.L197
	.p2align 4,,10
	.p2align 3
.L199:
	addq	$1, %rbp
	addq	$1, %r8
	movq	%r8, 32(%rbx)
	movq	%rbp, 8(%rbx)
	movzbl	-1(%rdi,%rbp), %eax
.L15:
	leal	-48(%rax), %esi
	cmpb	$9, %sil
	ja	.L198
	cmpq	%rdx, %rbp
	jb	.L199
	movl	$2, %r13d
.L23:
	subq	$1, %r8
	leaq	-1(%rbp), %rsi
	movq	%r12, %xmm4
	movq	%r9, %rdi
	movq	%rsi, 8(%rbx)
	movq	24(%rbx), %xmm0
	subq	%rcx, %rsi
	movq	%r8, 32(%rbx)
	punpcklqdq	%xmm4, %xmm0
	movaps	%xmm0, (%rsp)
	call	create_string@PLT
	movl	$32, %edi
	movq	%rax, %rbx
	call	alloc_memory@PLT
	movdqa	(%rsp), %xmm0
	movl	%r13d, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L11:
	cmpb	$95, %al
	jne	.L200
.L12:
	movabsq	$288230372997595135, %rsi
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L202:
	addq	$1, %rbp
	addq	$1, %r8
	movq	%r8, 32(%rbx)
	movq	%rbp, 8(%rbx)
	movzbl	-1(%rdi,%rbp), %eax
.L17:
	cmpb	$57, %al
	jle	.L201
	subl	$65, %eax
	cmpb	$57, %al
	ja	.L18
	btq	%rax, %rsi
	jnc	.L18
.L20:
	cmpq	%rdx, %rbp
	jb	.L202
.L18:
	leaq	-1(%rbp), %rsi
	subq	$1, %r8
	movq	%r9, %rdi
	movq	%rsi, 8(%rbx)
	subq	%rcx, %rsi
	movq	%r8, 32(%rbx)
	call	create_string@PLT
	movq	%rax, %rdi
	movq	%rax, %rbp
	call	is_keyword@PLT
	movq	24(%rbx), %xmm0
	testb	%al, %al
	je	.L22
	movq	%r12, %xmm2
	movl	$32, %edi
	punpcklqdq	%xmm2, %xmm0
	movaps	%xmm0, (%rsp)
	call	alloc_memory@PLT
	movdqa	(%rsp), %xmm0
	movl	$6, 24(%rax)
	movq	%rbp, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L200:
	leal	-97(%rax), %esi
	cmpb	$25, %sil
	jbe	.L12
	cmpq	%rdx, %rbp
	jnb	.L203
	movzbl	1(%rdi,%rcx), %r9d
	xorl	%r10d, %r10d
.L43:
	cmpb	$61, %r9b
	sete	%sil
	movl	%esi, %edx
	cmpb	$61, %al
	jne	.L85
	testb	%sil, %sil
	je	.L85
	movq	24(%rbx), %xmm0
	leaq	2(%r12), %rax
	addq	$2, %rcx
	movq	%r12, %xmm7
	movq	%rax, 32(%rbx)
	movq	%rcx, 8(%rbx)
	punpcklqdq	%xmm7, %xmm0
	movq	EQ_SYMBOL(%rip), %rbx
	movaps	%xmm0, (%rsp)
.L192:
	movl	$32, %edi
	call	alloc_memory@PLT
	movdqa	(%rsp), %xmm0
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L22:
	movq	%r12, %xmm3
	movl	$32, %edi
	punpcklqdq	%xmm3, %xmm0
	movaps	%xmm0, (%rsp)
	call	alloc_memory@PLT
	movdqa	(%rsp), %xmm0
	movl	$1, 24(%rax)
	movq	%rbp, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L13:
	xorl	%r13d, %r13d
	cmpq	%rdx, %rbp
	jnb	.L27
	leaq	2(%r12), %rax
	movq	%rax, 32(%rbx)
	leaq	2(%rcx), %rax
	movq	%rax, 8(%rbx)
	movzbl	1(%rdi,%rcx), %r13d
.L27:
	movabsq	$-17179870210, %rsi
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L205:
	leaq	1(%rax), %rcx
	addq	$1, 32(%rbx)
	movq	%rcx, 8(%rbx)
	movzbl	(%rdi,%rax), %r13d
.L28:
	cmpb	$34, %r13b
	jbe	.L204
.L30:
	movq	8(%rbx), %rax
	cmpq	%rdx, %rax
	jb	.L205
	xorl	%r13d, %r13d
.L29:
	movq	24(%rbx), %r14
	cmpb	$34, %r13b
	je	.L31
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	leaq	1(%r14), %rcx
	movq	%rbp, %r8
	leaq	.LC0(%rip), %r9
	leaq	.LC1(%rip), %rdx
	movl	$2, %esi
	call	__fprintf_chk@PLT
	cmpb	$10, %r13b
	je	.L32
	movq	24(%rbx), %xmm0
.L33:
	movq	(%rbx), %rdi
	movq	%r12, %xmm5
	movq	%rbp, %rsi
	punpcklqdq	%xmm5, %xmm0
	notq	%rsi
	addq	8(%rbx), %rsi
	addq	%rbp, %rdi
	movaps	%xmm0, (%rsp)
	call	create_string@PLT
	movl	$32, %edi
	movq	%rax, %rbx
	call	alloc_memory@PLT
	movdqa	(%rsp), %xmm0
	movl	$4, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L204:
	btq	%r13, %rsi
	jc	.L30
	jmp	.L29
.L197:
	cmpb	$47, %al
	sete	%sil
	movl	%esi, %r10d
	cmpq	%rdx, %rbp
	jnb	.L91
	movzbl	1(%rdi,%rcx), %r9d
	cmpb	$47, %r9b
	jne	.L38
	testb	%sil, %sil
	je	.L38
	movl	$47, %eax
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L206:
	addq	$1, %rbp
	addq	$1, %r8
	movq	%r8, 32(%rbx)
	movq	%rbp, 8(%rbx)
	movzbl	-1(%rdi,%rbp), %eax
.L36:
	cmpb	$10, %al
	je	.L39
	testb	%al, %al
	je	.L39
	cmpq	%rdx, %rbp
	jb	.L206
.L39:
	leaq	-1(%rbp), %rsi
	subq	$1, %r8
	movq	%rsi, 8(%rbx)
	movq	%r8, 32(%rbx)
	testb	%r13b, %r13b
	jne	.L196
	movq	24(%rbx), %xmm0
	movq	%r12, %xmm7
	addq	$2, %rcx
	subq	%rcx, %rsi
	addq	%rcx, %rdi
	punpcklqdq	%xmm7, %xmm0
	movaps	%xmm0, (%rsp)
.L191:
	call	create_string@PLT
	movl	$32, %edi
	movq	%rax, %rbx
	call	alloc_memory@PLT
	movdqa	(%rsp), %xmm0
	movl	$7, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L4
.L198:
	movl	$2, %r13d
	cmpq	%rdx, %rbp
	jnb	.L23
	cmpb	$46, %al
	jne	.L23
	leaq	(%rdi,%rbp), %rsi
	movzbl	(%rsi), %eax
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L23
	addq	$1, %r8
	addq	$1, %rbp
	movq	%r8, 32(%rbx)
	movq	%rbp, 8(%rbx)
	movzbl	(%rsi), %eax
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L207:
	addq	$1, %rbp
	addq	$1, %r8
	movq	%r8, 32(%rbx)
	movq	%rbp, 8(%rbx)
	movzbl	-1(%rdi,%rbp), %eax
.L25:
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L98
	cmpq	%rdx, %rbp
	jb	.L207
.L98:
	movl	$3, %r13d
	jmp	.L23
.L31:
	movq	%rbp, %rsi
	addq	%rbp, %rdi
	notq	%rsi
	addq	8(%rbx), %rsi
	call	create_string@PLT
	movl	$32, %edi
	movq	%rax, %rbx
	call	alloc_memory@PLT
	movq	%r14, %xmm0
	movq	%r12, %xmm6
	punpcklqdq	%xmm6, %xmm0
	movl	$4, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L4
.L32:
	movq	24(%rbx), %rax
	movq	$0, 32(%rbx)
	addq	$1, %rax
	movq	%rax, 24(%rbx)
	movq	%rax, %xmm0
	jmp	.L33
.L203:
	xorl	%r10d, %r10d
.L91:
	xorl	%r9d, %r9d
	xorl	%edx, %edx
.L35:
	cmpb	$43, %al
	jne	.L56
	testb	%dl, %dl
	jne	.L208
.L56:
	cmpb	$45, %al
	jne	.L57
	testb	%dl, %dl
	jne	.L209
.L57:
	cmpb	$42, %al
	jne	.L58
	testb	%dl, %dl
	jne	.L210
.L59:
	cmpb	$37, %al
	jne	.L60
	testb	%dl, %dl
	jne	.L211
.L60:
	cmpb	$38, %al
	jne	.L61
	cmpb	$38, %r9b
	je	.L212
.L61:
	cmpb	$124, %al
	jne	.L62
	cmpb	$124, %r9b
	je	.L213
.L62:
	movq	24(%rbx), %rdx
	movq	%r12, %xmm6
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
	notrack jmp	*%rax
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
	movq	stderr(%rip), %rdi
	leaq	1(%rdx), %rcx
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC1(%rip), %rdx
	leaq	.LC5(%rip), %r9
	call	__fprintf_chk@PLT
	movl	$32, %edi
	call	alloc_memory@PLT
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	pxor	%xmm0, %xmm0
	movl	%edx, 24(%rax)
	movq	%rcx, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L4
.L38:
	cmpb	$42, %r9b
	jne	.L43
	testb	%sil, %sil
	je	.L43
	leaq	2(%rcx), %rbp
	movl	$42, %eax
	movl	$47, %esi
	.p2align 4,,10
	.p2align 3
.L44:
	cmpb	$42, %sil
	jne	.L158
	cmpb	$47, %al
	je	.L214
.L158:
	movq	8(%rbx), %rax
	cmpq	%rdx, %rax
	jnb	.L45
	leaq	1(%rax), %r8
	addq	$1, 32(%rbx)
	movq	%r8, 8(%rbx)
	movzbl	(%rdi,%rax), %esi
	cmpq	%rdx, %r8
	jnb	.L215
	movzbl	1(%rdi,%rax), %eax
	cmpb	$10, %sil
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
	testb	%sil, %sil
	jne	.L44
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$125, %edx
	leaq	.LC2(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	__assert_fail@PLT
	.p2align 4,,10
	.p2align 3
.L215:
	cmpb	$10, %sil
	jne	.L47
	movq	24(%rbx), %rax
	movq	$0, 32(%rbx)
	addq	$1, %rax
	movq	%rax, 24(%rbx)
.L48:
	addq	$1, %rax
	leaq	3(%rcx), %r8
	movq	stderr(%rip), %rdi
	leaq	.LC4(%rip), %r9
	movq	%rax, %rcx
	leaq	.LC1(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	__fprintf_chk@PLT
	testb	%r13b, %r13b
	jne	.L196
	movq	24(%rbx), %xmm0
	movq	8(%rbx), %rsi
	movq	%r12, %xmm7
	movq	(%rbx), %rdi
	punpcklqdq	%xmm7, %xmm0
	subq	%rbp, %rsi
	movaps	%xmm0, (%rsp)
	addq	%rbp, %rdi
	jmp	.L191
.L214:
	movq	8(%rbx), %rax
	cmpq	%rdx, %rax
	jnb	.L89
	addq	$1, %rax
	addq	$1, 32(%rbx)
	movq	%rax, 8(%rbx)
.L89:
	testb	%r13b, %r13b
	jne	.L196
	movq	24(%rbx), %xmm0
	movq	8(%rbx), %rsi
	movq	%r12, %xmm6
	addq	%rbp, %rdi
	punpcklqdq	%xmm6, %xmm0
	subq	$2, %rsi
	movaps	%xmm0, (%rsp)
	subq	%rbp, %rsi
	jmp	.L191
.L47:
	testb	%sil, %sil
	jne	.L190
	.p2align 4,,10
	.p2align 3
.L45:
	subq	$1, 8(%rbx)
	subq	$1, 32(%rbx)
.L190:
	movq	24(%rbx), %rax
	jmp	.L48
.L58:
	testb	%dl, %dl
	je	.L59
	testb	%r10b, %r10b
	je	.L59
	movq	%rbx, %rdi
	call	get_current_char.isra.0
	movq	32(%rbx), %rax
	movq	24(%rbx), %xmm0
	movq	DIV_ASSIGN_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm6
	punpcklqdq	%xmm6, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L192
.L208:
	movq	%rbx, %rdi
	call	get_current_char.isra.0
	movq	32(%rbx), %rax
	movq	24(%rbx), %xmm0
	movq	ADD_ASSIGN_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm7
	punpcklqdq	%xmm7, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L192
.L209:
	movq	%rbx, %rdi
	call	get_current_char.isra.0
	movq	32(%rbx), %rax
	movq	24(%rbx), %xmm0
	movq	SUB_ASSIGN_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm6
	punpcklqdq	%xmm6, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L192
.L210:
	movq	%rbx, %rdi
	call	get_current_char.isra.0
	movq	32(%rbx), %rax
	movq	24(%rbx), %xmm0
	movq	MUL_ASSIGN_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm7
	punpcklqdq	%xmm7, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L192
.L211:
	movq	%rbx, %rdi
	call	get_current_char.isra.0
	movq	32(%rbx), %rax
	movq	24(%rbx), %xmm0
	movq	MOD_ASSIGN_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm7
	punpcklqdq	%xmm7, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L192
.L212:
	movq	%rbx, %rdi
	call	get_current_char.isra.0
	movq	32(%rbx), %rax
	movq	24(%rbx), %xmm0
	movq	AND_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm6
	punpcklqdq	%xmm6, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L192
.L213:
	movq	%rbx, %rdi
	call	get_current_char.isra.0
	movq	32(%rbx), %rax
	movq	24(%rbx), %xmm0
	movq	OR_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm7
	punpcklqdq	%xmm7, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L192
.L85:
	cmpb	$33, %al
	jne	.L55
	testb	%sil, %sil
	jne	.L216
.L55:
	cmpb	$60, %al
	jne	.L88
	testb	%sil, %sil
	je	.L88
	movq	24(%rbx), %xmm0
	movq	%r12, %xmm7
	leaq	2(%r12), %rax
	addq	$2, %rcx
	movq	%rax, 32(%rbx)
	punpcklqdq	%xmm7, %xmm0
	movq	%rcx, 8(%rbx)
	movq	LE_SYMBOL(%rip), %rbx
	movaps	%xmm0, (%rsp)
	jmp	.L192
.L216:
	movq	24(%rbx), %xmm0
	movq	%r12, %xmm6
	leaq	2(%r12), %rax
	addq	$2, %rcx
	movq	%rax, 32(%rbx)
	punpcklqdq	%xmm6, %xmm0
	movq	%rcx, 8(%rbx)
	movq	NE_SYMBOL(%rip), %rbx
	movaps	%xmm0, (%rsp)
	jmp	.L192
.L88:
	cmpb	$62, %al
	jne	.L35
	testb	%sil, %sil
	je	.L35
	movq	%rbx, %rdi
	call	get_current_char.isra.0
	movq	32(%rbx), %rax
	movq	24(%rbx), %xmm0
	movq	GE_SYMBOL(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm6
	punpcklqdq	%xmm6, %xmm0
	movaps	%xmm0, (%rsp)
	jmp	.L192
.L64:
	movq	R_BRACE_SYMBOL(%rip), %rbx
.L195:
	movl	$32, %edi
	call	alloc_memory@PLT
	movdqa	(%rsp), %xmm6
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L4
.L66:
	movq	L_BRACE_SYMBOL(%rip), %rbx
.L194:
	movl	$32, %edi
	call	alloc_memory@PLT
	movdqa	(%rsp), %xmm7
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm7, 8(%rax)
	jmp	.L4
.L201:
	cmpb	$47, %al
	jg	.L20
	jmp	.L18
.L67:
	movq	R_BRACKET_SYMBOL(%rip), %rbx
.L193:
	movl	$32, %edi
	call	alloc_memory@PLT
	movdqa	(%rsp), %xmm5
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm5, 8(%rax)
	jmp	.L4
.L68:
	movq	L_BRACKET_SYMBOL(%rip), %rbx
	jmp	.L194
.L69:
	movq	GT_SYMBOL(%rip), %rbx
	jmp	.L194
.L70:
	movq	ASSIGN_SYMBOL(%rip), %rbx
	jmp	.L193
.L71:
	movq	LT_SYMBOL(%rip), %rbx
	jmp	.L195
.L72:
	movq	SEMICOLON_SYMBOL(%rip), %rbx
	jmp	.L195
.L73:
	movq	DIV_SYMBOL(%rip), %rbx
	jmp	.L194
.L74:
	movq	DOT_SYMBOL(%rip), %rbx
	jmp	.L195
.L75:
	movq	SUB_SYMBOL(%rip), %rbx
	jmp	.L193
.L76:
	movq	COMMA_SYMBOL(%rip), %rbx
	jmp	.L194
.L77:
	movq	ADD_SYMBOL(%rip), %rbx
	jmp	.L194
.L78:
	movq	MUL_SYMBOL(%rip), %rbx
	jmp	.L195
.L79:
	movq	R_PAREN_SYMBOL(%rip), %rbx
	jmp	.L195
.L80:
	movq	L_PAREN_SYMBOL(%rip), %rbx
	jmp	.L194
.L81:
	movq	MOD_SYMBOL(%rip), %rbx
	jmp	.L193
.L82:
	movq	NOT_SYMBOL(%rip), %rbx
	jmp	.L193
	.cfi_endproc
.LFE72:
	.size	next_token, .-next_token
	.p2align 4
	.globl	create_lexer
	.type	create_lexer, @function
create_lexer:
.LFB65:
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
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	alloc_memory@PLT
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
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE65:
	.size	create_lexer, .-create_lexer
	.p2align 4
	.globl	get_next_token
	.type	get_next_token, @function
get_next_token:
.LFB73:
	.cfi_startproc
	endbr64
	movq	40(%rdi), %rax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	testq	%rax, %rax
	je	.L220
	movq	48(%rdi), %rdx
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	movq	%rax, 72(%rdi)
	movdqu	56(%rdi), %xmm0
	movq	$0, 40(%rdi)
	movq	%rdx, 8(%rdi)
	movups	%xmm0, 24(%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L220:
	.cfi_restore_state
	movsbl	%sil, %esi
	call	next_token
	movq	%rax, 72(%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE73:
	.size	get_next_token, .-get_next_token
	.p2align 4
	.globl	peek_next_token
	.type	peek_next_token, @function
peek_next_token:
.LFB74:
	.cfi_startproc
	endbr64
	movq	40(%rdi), %rax
	testq	%rax, %rax
	je	.L229
	ret
	.p2align 4,,10
	.p2align 3
.L229:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movsbl	%sil, %esi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
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
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE74:
	.size	peek_next_token, .-peek_next_token
	.p2align 4
	.globl	peek_current_token
	.type	peek_current_token, @function
peek_current_token:
.LFB75:
	.cfi_startproc
	endbr64
	movq	72(%rdi), %rax
	ret
	.cfi_endproc
.LFE75:
	.size	peek_current_token, .-peek_current_token
	.p2align 4
	.globl	reset_lexer
	.type	reset_lexer, @function
reset_lexer:
.LFB76:
	.cfi_startproc
	endbr64
	pxor	%xmm0, %xmm0
	movq	$0, 8(%rdi)
	movq	$0, 40(%rdi)
	movq	$0, 64(%rdi)
	movq	$0, 72(%rdi)
	movups	%xmm0, 24(%rdi)
	movups	%xmm0, 48(%rdi)
	ret
	.cfi_endproc
.LFE76:
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
