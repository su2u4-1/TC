	.file	"lexer.c"
	.text
	.globl	create_lexer
	.type	create_lexer, @function
create_lexer:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$80, %edi
	call	alloc_memory@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 24(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 32(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 40(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 48(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 56(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 64(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 72(%rax)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	create_lexer, .-create_lexer
	.type	create_token, @function
create_token:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movl	$32, %edi
	call	alloc_memory@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	-20(%rbp), %edx
	movl	%edx, 24(%rax)
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	create_token, .-create_token
	.section	.rodata
	.align 8
.LC0:
	.string	"Lexer Error at Line %zu, Column %zu: %s\n"
	.text
	.type	lexer_error, @function
lexer_error:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	stderr(%rip), %rax
	movq	-8(%rbp), %rsi
	movq	%rsi, %r8
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	lexer_error, .-lexer_error
	.type	get_current_char, @function
get_current_char:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	cmpq	%rax, %rdx
	jb	.L7
	movl	$0, %eax
	jmp	.L8
.L7:
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 32(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rsi
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-8(%rbp), %rdx
	movq	%rcx, 8(%rdx)
	addq	%rsi, %rax
	movzbl	(%rax), %eax
.L8:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	get_current_char, .-get_current_char
	.type	peek_next_char, @function
peek_next_char:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	cmpq	%rax, %rdx
	jb	.L10
	movl	$0, %eax
	jmp	.L11
.L10:
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
.L11:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	peek_next_char, .-peek_next_char
	.type	newline, @function
newline:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 24(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 32(%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	newline, .-newline
	.type	move_position, @function
move_position:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	cmpl	$0, -12(%rbp)
	js	.L14
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-12(%rbp), %eax
	cltq
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	32(%rax), %rdx
	movl	-12(%rbp), %eax
	cltq
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 32(%rax)
	jmp	.L16
.L14:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-12(%rbp), %eax
	negl	%eax
	cltq
	subq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	32(%rax), %rdx
	movl	-12(%rbp), %eax
	negl	%eax
	cltq
	subq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 32(%rax)
.L16:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	move_position, .-move_position
	.section	.rodata
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
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$120, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -120(%rbp)
	movl	%esi, %eax
	movb	%al, -124(%rbp)
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movb	%al, -111(%rbp)
	cmpb	$0, -111(%rbp)
	jne	.L18
	movq	-120(%rbp), %rax
	movq	32(%rax), %rdx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	create_token
	jmp	.L19
.L18:
	cmpb	$32, -111(%rbp)
	je	.L20
	cmpb	$9, -111(%rbp)
	je	.L20
	cmpb	$13, -111(%rbp)
	jne	.L21
.L20:
	movsbl	-124(%rbp), %edx
	movq	-120(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	next_token
	jmp	.L19
.L21:
	cmpb	$10, -111(%rbp)
	jne	.L22
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	newline
	movsbl	-124(%rbp), %edx
	movq	-120(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	next_token
	jmp	.L19
.L22:
	cmpb	$96, -111(%rbp)
	jle	.L23
	cmpb	$122, -111(%rbp)
	jle	.L24
.L23:
	cmpb	$64, -111(%rbp)
	jle	.L25
	cmpb	$90, -111(%rbp)
	jle	.L24
.L25:
	cmpb	$95, -111(%rbp)
	jne	.L26
.L24:
	movq	-120(%rbp), %rax
	movq	8(%rax), %rax
	subq	$1, %rax
	movq	%rax, -40(%rbp)
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	subq	$1, %rax
	movq	%rax, -32(%rbp)
	jmp	.L27
.L29:
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movb	%al, -111(%rbp)
.L27:
	cmpb	$96, -111(%rbp)
	jle	.L28
	cmpb	$122, -111(%rbp)
	jle	.L29
.L28:
	cmpb	$64, -111(%rbp)
	jle	.L30
	cmpb	$90, -111(%rbp)
	jle	.L29
.L30:
	cmpb	$47, -111(%rbp)
	jle	.L31
	cmpb	$57, -111(%rbp)
	jle	.L29
.L31:
	cmpb	$95, -111(%rbp)
	je	.L29
	movq	-120(%rbp), %rax
	movl	$-1, %esi
	movq	%rax, %rdi
	call	move_position
	movq	-120(%rbp), %rax
	movq	8(%rax), %rax
	subq	-40(%rbp), %rax
	movq	-120(%rbp), %rdx
	movq	(%rdx), %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	create_string@PLT
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	is_keyword@PLT
	testb	%al, %al
	je	.L32
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_token
	jmp	.L19
.L32:
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	create_token
	jmp	.L19
.L26:
	cmpb	$47, -111(%rbp)
	jle	.L33
	cmpb	$57, -111(%rbp)
	jg	.L33
	movq	-120(%rbp), %rax
	movq	8(%rax), %rax
	subq	$1, %rax
	movq	%rax, -104(%rbp)
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	subq	$1, %rax
	movq	%rax, -96(%rbp)
	jmp	.L34
.L36:
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movb	%al, -111(%rbp)
.L34:
	cmpb	$47, -111(%rbp)
	jle	.L35
	cmpb	$57, -111(%rbp)
	jle	.L36
.L35:
	movl	$2, -108(%rbp)
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	peek_next_char
	movb	%al, -109(%rbp)
	cmpb	$46, -111(%rbp)
	jne	.L37
	cmpb	$47, -109(%rbp)
	jle	.L37
	cmpb	$57, -109(%rbp)
	jg	.L37
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movb	%al, -111(%rbp)
	jmp	.L38
.L40:
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movb	%al, -111(%rbp)
.L38:
	cmpb	$47, -111(%rbp)
	jle	.L39
	cmpb	$57, -111(%rbp)
	jle	.L40
.L39:
	movl	$3, -108(%rbp)
.L37:
	movq	-120(%rbp), %rax
	movl	$-1, %esi
	movq	%rax, %rdi
	call	move_position
	movq	-120(%rbp), %rax
	movq	24(%rax), %rbx
	movq	-120(%rbp), %rax
	movq	8(%rax), %rax
	subq	-104(%rbp), %rax
	movq	-120(%rbp), %rdx
	movq	(%rdx), %rcx
	movq	-104(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	create_string@PLT
	movq	%rax, %rsi
	movq	-96(%rbp), %rdx
	movl	-108(%rbp), %eax
	movq	%rdx, %rcx
	movq	%rbx, %rdx
	movl	%eax, %edi
	call	create_token
	jmp	.L19
.L33:
	cmpb	$34, -111(%rbp)
	jne	.L41
	movq	-120(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -56(%rbp)
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	subq	$1, %rax
	movq	%rax, -48(%rbp)
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movb	%al, -111(%rbp)
	jmp	.L42
.L44:
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movb	%al, -111(%rbp)
.L42:
	cmpb	$34, -111(%rbp)
	je	.L43
	cmpb	$0, -111(%rbp)
	je	.L43
	cmpb	$10, -111(%rbp)
	jne	.L44
.L43:
	cmpb	$34, -111(%rbp)
	je	.L45
	movq	-56(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	lexer_error
	cmpb	$10, -111(%rbp)
	jne	.L46
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	newline
.L46:
	movq	-120(%rbp), %rax
	movq	24(%rax), %rbx
	movq	-120(%rbp), %rax
	movq	8(%rax), %rax
	subq	-56(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-120(%rbp), %rax
	movq	(%rax), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	create_string@PLT
	movq	%rax, %rsi
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movq	%rbx, %rdx
	movl	$4, %edi
	call	create_token
	jmp	.L19
.L45:
	movq	-120(%rbp), %rax
	movq	24(%rax), %rbx
	movq	-120(%rbp), %rax
	movq	8(%rax), %rax
	subq	-56(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-120(%rbp), %rax
	movq	(%rax), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	create_string@PLT
	movq	%rax, %rsi
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movq	%rbx, %rdx
	movl	$4, %edi
	call	create_token
	jmp	.L19
.L41:
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	peek_next_char
	movb	%al, -110(%rbp)
	cmpb	$47, -111(%rbp)
	jne	.L47
	cmpb	$47, -110(%rbp)
	jne	.L47
	movq	-120(%rbp), %rax
	movq	8(%rax), %rax
	addq	$1, %rax
	movq	%rax, -88(%rbp)
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	subq	$1, %rax
	movq	%rax, -80(%rbp)
	jmp	.L48
.L50:
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movb	%al, -111(%rbp)
.L48:
	cmpb	$10, -111(%rbp)
	je	.L49
	cmpb	$0, -111(%rbp)
	jne	.L50
.L49:
	movq	-120(%rbp), %rax
	movl	$-1, %esi
	movq	%rax, %rdi
	call	move_position
	cmpb	$0, -124(%rbp)
	je	.L51
	movsbl	-124(%rbp), %edx
	movq	-120(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	next_token
	jmp	.L19
.L51:
	movq	-120(%rbp), %rax
	movq	24(%rax), %rbx
	movq	-120(%rbp), %rax
	movq	8(%rax), %rax
	subq	-88(%rbp), %rax
	movq	-120(%rbp), %rdx
	movq	(%rdx), %rcx
	movq	-88(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	create_string@PLT
	movq	%rax, %rsi
	movq	-80(%rbp), %rax
	movq	%rax, %rcx
	movq	%rbx, %rdx
	movl	$7, %edi
	call	create_token
	jmp	.L19
.L47:
	cmpb	$47, -111(%rbp)
	jne	.L52
	cmpb	$42, -110(%rbp)
	jne	.L52
	movq	-120(%rbp), %rax
	movq	8(%rax), %rax
	addq	$1, %rax
	movq	%rax, -72(%rbp)
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	subq	$1, %rax
	movq	%rax, -64(%rbp)
	jmp	.L53
.L57:
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movb	%al, -111(%rbp)
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	peek_next_char
	movb	%al, -110(%rbp)
	cmpb	$10, -111(%rbp)
	jne	.L54
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	newline
.L54:
	cmpb	$0, -110(%rbp)
	je	.L92
	cmpb	$0, -111(%rbp)
	jne	.L53
	leaq	__PRETTY_FUNCTION__.0(%rip), %rax
	movq	%rax, %rcx
	movl	$125, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L53:
	cmpb	$42, -111(%rbp)
	jne	.L57
	cmpb	$47, -110(%rbp)
	jne	.L57
	jmp	.L56
.L92:
	nop
.L56:
	cmpb	$0, -110(%rbp)
	jne	.L58
	cmpb	$0, -111(%rbp)
	jne	.L59
	movq	-120(%rbp), %rax
	movl	$-1, %esi
	movq	%rax, %rdi
	call	move_position
.L59:
	movq	-120(%rbp), %rax
	movq	24(%rax), %rax
	movq	-72(%rbp), %rdx
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	lexer_error
	cmpb	$0, -124(%rbp)
	je	.L60
	movsbl	-124(%rbp), %edx
	movq	-120(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	next_token
	jmp	.L19
.L60:
	movq	-120(%rbp), %rax
	movq	24(%rax), %rbx
	movq	-120(%rbp), %rax
	movq	8(%rax), %rax
	subq	-72(%rbp), %rax
	movq	-120(%rbp), %rdx
	movq	(%rdx), %rcx
	movq	-72(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	create_string@PLT
	movq	%rax, %rsi
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	movq	%rbx, %rdx
	movl	$7, %edi
	call	create_token
	jmp	.L19
.L58:
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movb	%al, -111(%rbp)
	cmpb	$0, -124(%rbp)
	je	.L61
	movsbl	-124(%rbp), %edx
	movq	-120(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	next_token
	jmp	.L19
.L61:
	movq	-120(%rbp), %rax
	movq	24(%rax), %rbx
	movq	-120(%rbp), %rax
	movq	8(%rax), %rax
	subq	-72(%rbp), %rax
	leaq	-2(%rax), %rdx
	movq	-120(%rbp), %rax
	movq	(%rax), %rcx
	movq	-72(%rbp), %rax
	addq	%rcx, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	create_string@PLT
	movq	%rax, %rsi
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	movq	%rbx, %rdx
	movl	$7, %edi
	call	create_token
	jmp	.L19
.L52:
	cmpb	$61, -111(%rbp)
	jne	.L62
	cmpb	$61, -110(%rbp)
	jne	.L62
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	EQ_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L62:
	cmpb	$33, -111(%rbp)
	jne	.L63
	cmpb	$61, -110(%rbp)
	jne	.L63
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	NE_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L63:
	cmpb	$60, -111(%rbp)
	jne	.L64
	cmpb	$61, -110(%rbp)
	jne	.L64
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	LE_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L64:
	cmpb	$62, -111(%rbp)
	jne	.L65
	cmpb	$61, -110(%rbp)
	jne	.L65
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	GE_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L65:
	cmpb	$43, -111(%rbp)
	jne	.L66
	cmpb	$61, -110(%rbp)
	jne	.L66
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L66:
	cmpb	$45, -111(%rbp)
	jne	.L67
	cmpb	$61, -110(%rbp)
	jne	.L67
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L67:
	cmpb	$42, -111(%rbp)
	jne	.L68
	cmpb	$61, -110(%rbp)
	jne	.L68
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L68:
	cmpb	$47, -111(%rbp)
	jne	.L69
	cmpb	$61, -110(%rbp)
	jne	.L69
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L69:
	cmpb	$37, -111(%rbp)
	jne	.L70
	cmpb	$61, -110(%rbp)
	jne	.L70
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L70:
	cmpb	$38, -111(%rbp)
	jne	.L71
	cmpb	$38, -110(%rbp)
	jne	.L71
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	AND_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L71:
	cmpb	$124, -111(%rbp)
	jne	.L72
	cmpb	$124, -110(%rbp)
	jne	.L72
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	OR_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L72:
	cmpb	$40, -111(%rbp)
	jne	.L73
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	L_PAREN_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L73:
	cmpb	$41, -111(%rbp)
	jne	.L74
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	R_PAREN_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L74:
	cmpb	$123, -111(%rbp)
	jne	.L75
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	L_BRACE_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L75:
	cmpb	$125, -111(%rbp)
	jne	.L76
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	R_BRACE_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L76:
	cmpb	$44, -111(%rbp)
	jne	.L77
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	COMMA_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L77:
	cmpb	$33, -111(%rbp)
	jne	.L78
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	NOT_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L78:
	cmpb	$46, -111(%rbp)
	jne	.L79
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	DOT_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L79:
	cmpb	$91, -111(%rbp)
	jne	.L80
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	L_BRACKET_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L80:
	cmpb	$93, -111(%rbp)
	jne	.L81
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	R_BRACKET_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L81:
	cmpb	$59, -111(%rbp)
	jne	.L82
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	SEMICOLON_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L82:
	cmpb	$95, -111(%rbp)
	jne	.L83
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	UNDERLINE_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L83:
	cmpb	$43, -111(%rbp)
	jne	.L84
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	ADD_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L84:
	cmpb	$45, -111(%rbp)
	jne	.L85
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	SUB_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L85:
	cmpb	$42, -111(%rbp)
	jne	.L86
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	MUL_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L86:
	cmpb	$47, -111(%rbp)
	jne	.L87
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	DIV_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L87:
	cmpb	$37, -111(%rbp)
	jne	.L88
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	MOD_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L88:
	cmpb	$60, -111(%rbp)
	jne	.L89
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	LT_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L89:
	cmpb	$62, -111(%rbp)
	jne	.L90
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	GT_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L90:
	cmpb	$61, -111(%rbp)
	jne	.L91
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rdx
	movq	ASSIGN_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L91:
	movq	-120(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rdx
	movq	-120(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	lexer_error
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_token
.L19:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	next_token, .-next_token
	.globl	get_next_token
	.type	get_next_token, @function
get_next_token:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, %eax
	movb	%al, -28(%rbp)
	movq	-24(%rbp), %rax
	movq	40(%rax), %rax
	testq	%rax, %rax
	je	.L94
	movq	-24(%rbp), %rax
	movq	40(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 72(%rax)
	movq	-24(%rbp), %rax
	movq	48(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-24(%rbp), %rax
	movq	56(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 24(%rax)
	movq	-24(%rbp), %rax
	movq	64(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 32(%rax)
	movq	-24(%rbp), %rax
	movq	$0, 40(%rax)
	movq	-24(%rbp), %rax
	movq	72(%rax), %rax
	jmp	.L95
.L94:
	movsbl	-28(%rbp), %edx
	movq	-24(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	next_token
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 72(%rax)
	movq	-24(%rbp), %rax
	movq	72(%rax), %rax
.L95:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	get_next_token, .-get_next_token
	.globl	peek_next_token
	.type	peek_next_token, @function
peek_next_token:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, %eax
	movb	%al, -44(%rbp)
	movq	-40(%rbp), %rax
	movq	40(%rax), %rax
	testq	%rax, %rax
	je	.L97
	movq	-40(%rbp), %rax
	movq	40(%rax), %rax
	jmp	.L98
.L97:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-40(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -16(%rbp)
	movsbl	-44(%rbp), %edx
	movq	-40(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 48(%rax)
	movq	-40(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 56(%rax)
	movq	-40(%rbp), %rax
	movq	32(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 64(%rax)
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-40(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	-40(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 40(%rax)
	movq	-8(%rbp), %rax
.L98:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	peek_next_token, .-peek_next_token
	.globl	peek_current_token
	.type	peek_current_token, @function
peek_current_token:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	72(%rax), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	peek_current_token, .-peek_current_token
	.globl	reset_lexer
	.type	reset_lexer, @function
reset_lexer:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 24(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 32(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 40(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 48(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 56(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 64(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 72(%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
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
