	.file	"lexer.c"
	.text
	.globl	create_lexer
	.type	create_lexer, @function
create_lexer:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$80, %edi
	call	*alloc_memory@GOTPCREL(%rip)
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
	ret
	.size	create_lexer, .-create_lexer
	.type	create_token, @function
create_token:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
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
	ret
	.size	create_token, .-create_token
	.section	.rodata
	.align 8
.LC0:
	.string	"Lexer Error at Line %zu, Column %zu: %s\n"
	.text
	.type	lexer_error, @function
lexer_error:
	pushq	%rbp
	movq	%rsp, %rbp
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
	call	*fprintf@GOTPCREL(%rip)
	nop
	leave
	ret
	.size	lexer_error, .-lexer_error
	.type	get_current_char, @function
get_current_char:
	pushq	%rbp
	movq	%rsp, %rbp
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
	ret
	.size	get_current_char, .-get_current_char
	.type	peek_next_char, @function
peek_next_char:
	pushq	%rbp
	movq	%rsp, %rbp
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
	ret
	.size	peek_next_char, .-peek_next_char
	.type	newline, @function
newline:
	pushq	%rbp
	movq	%rsp, %rbp
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
	ret
	.size	newline, .-newline
	.type	move_position, @function
move_position:
	pushq	%rbp
	movq	%rsp, %rbp
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
	ret
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
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$136, %rsp
	movq	%rdi, -136(%rbp)
	movl	%esi, %eax
	movb	%al, -140(%rbp)
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movb	%al, -17(%rbp)
	cmpb	$0, -17(%rbp)
	jne	.L18
	movq	-136(%rbp), %rax
	movq	32(%rax), %rdx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	create_token
	jmp	.L19
.L18:
	cmpb	$32, -17(%rbp)
	je	.L20
	cmpb	$9, -17(%rbp)
	je	.L20
	cmpb	$13, -17(%rbp)
	jne	.L21
.L20:
	movsbl	-140(%rbp), %edx
	movq	-136(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	next_token
	jmp	.L19
.L21:
	cmpb	$10, -17(%rbp)
	jne	.L22
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	newline
	movsbl	-140(%rbp), %edx
	movq	-136(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	next_token
	jmp	.L19
.L22:
	cmpb	$96, -17(%rbp)
	jle	.L23
	cmpb	$122, -17(%rbp)
	jle	.L24
.L23:
	cmpb	$64, -17(%rbp)
	jle	.L25
	cmpb	$90, -17(%rbp)
	jle	.L24
.L25:
	cmpb	$95, -17(%rbp)
	jne	.L26
.L24:
	movq	-136(%rbp), %rax
	movq	8(%rax), %rax
	subq	$1, %rax
	movq	%rax, -112(%rbp)
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	subq	$1, %rax
	movq	%rax, -120(%rbp)
	jmp	.L27
.L29:
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movb	%al, -17(%rbp)
.L27:
	cmpb	$96, -17(%rbp)
	jle	.L28
	cmpb	$122, -17(%rbp)
	jle	.L29
.L28:
	cmpb	$64, -17(%rbp)
	jle	.L30
	cmpb	$90, -17(%rbp)
	jle	.L29
.L30:
	cmpb	$47, -17(%rbp)
	jle	.L31
	cmpb	$57, -17(%rbp)
	jle	.L29
.L31:
	cmpb	$95, -17(%rbp)
	je	.L29
	movq	-136(%rbp), %rax
	movl	$-1, %esi
	movq	%rax, %rdi
	call	move_position
	movq	-136(%rbp), %rax
	movq	8(%rax), %rax
	subq	-112(%rbp), %rax
	movq	-136(%rbp), %rdx
	movq	(%rdx), %rcx
	movq	-112(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, -128(%rbp)
	movq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	*is_keyword@GOTPCREL(%rip)
	testb	%al, %al
	je	.L32
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-120(%rbp), %rcx
	movq	-128(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_token
	jmp	.L19
.L32:
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-120(%rbp), %rcx
	movq	-128(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	create_token
	jmp	.L19
.L26:
	cmpb	$47, -17(%rbp)
	jle	.L33
	cmpb	$57, -17(%rbp)
	jg	.L33
	movq	-136(%rbp), %rax
	movq	8(%rax), %rax
	subq	$1, %rax
	movq	%rax, -40(%rbp)
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	subq	$1, %rax
	movq	%rax, -48(%rbp)
	jmp	.L34
.L36:
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movb	%al, -17(%rbp)
.L34:
	cmpb	$47, -17(%rbp)
	jle	.L35
	cmpb	$57, -17(%rbp)
	jle	.L36
.L35:
	movl	$2, -24(%rbp)
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	peek_next_char
	movb	%al, -49(%rbp)
	cmpb	$46, -17(%rbp)
	jne	.L37
	cmpb	$47, -49(%rbp)
	jle	.L37
	cmpb	$57, -49(%rbp)
	jg	.L37
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movb	%al, -17(%rbp)
	jmp	.L38
.L40:
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movb	%al, -17(%rbp)
.L38:
	cmpb	$47, -17(%rbp)
	jle	.L39
	cmpb	$57, -17(%rbp)
	jle	.L40
.L39:
	movl	$3, -24(%rbp)
.L37:
	movq	-136(%rbp), %rax
	movl	$-1, %esi
	movq	%rax, %rdi
	call	move_position
	movq	-136(%rbp), %rax
	movq	24(%rax), %rbx
	movq	-136(%rbp), %rax
	movq	8(%rax), %rax
	subq	-40(%rbp), %rax
	movq	-136(%rbp), %rdx
	movq	(%rdx), %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	-48(%rbp), %rdx
	movl	-24(%rbp), %eax
	movq	%rdx, %rcx
	movq	%rbx, %rdx
	movl	%eax, %edi
	call	create_token
	jmp	.L19
.L33:
	cmpb	$34, -17(%rbp)
	jne	.L41
	movq	-136(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -96(%rbp)
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	subq	$1, %rax
	movq	%rax, -104(%rbp)
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movb	%al, -17(%rbp)
	jmp	.L42
.L44:
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movb	%al, -17(%rbp)
.L42:
	cmpb	$34, -17(%rbp)
	je	.L43
	cmpb	$0, -17(%rbp)
	je	.L43
	cmpb	$10, -17(%rbp)
	jne	.L44
.L43:
	cmpb	$34, -17(%rbp)
	je	.L45
	movq	-96(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	lexer_error
	cmpb	$10, -17(%rbp)
	jne	.L46
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	newline
.L46:
	movq	-136(%rbp), %rax
	movq	24(%rax), %rbx
	movq	-136(%rbp), %rax
	movq	8(%rax), %rax
	subq	-96(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-136(%rbp), %rax
	movq	(%rax), %rcx
	movq	-96(%rbp), %rax
	addq	%rcx, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	-104(%rbp), %rax
	movq	%rax, %rcx
	movq	%rbx, %rdx
	movl	$4, %edi
	call	create_token
	jmp	.L19
.L45:
	movq	-136(%rbp), %rax
	movq	24(%rax), %rbx
	movq	-136(%rbp), %rax
	movq	8(%rax), %rax
	subq	-96(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-136(%rbp), %rax
	movq	(%rax), %rcx
	movq	-96(%rbp), %rax
	addq	%rcx, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	-104(%rbp), %rax
	movq	%rax, %rcx
	movq	%rbx, %rdx
	movl	$4, %edi
	call	create_token
	jmp	.L19
.L41:
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	peek_next_char
	movb	%al, -25(%rbp)
	cmpb	$47, -17(%rbp)
	jne	.L47
	cmpb	$47, -25(%rbp)
	jne	.L47
	movq	-136(%rbp), %rax
	movq	8(%rax), %rax
	addq	$1, %rax
	movq	%rax, -64(%rbp)
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	subq	$1, %rax
	movq	%rax, -72(%rbp)
	jmp	.L48
.L50:
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movb	%al, -17(%rbp)
.L48:
	cmpb	$10, -17(%rbp)
	je	.L49
	cmpb	$0, -17(%rbp)
	jne	.L50
.L49:
	movq	-136(%rbp), %rax
	movl	$-1, %esi
	movq	%rax, %rdi
	call	move_position
	cmpb	$0, -140(%rbp)
	je	.L51
	movsbl	-140(%rbp), %edx
	movq	-136(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	next_token
	jmp	.L19
.L51:
	movq	-136(%rbp), %rax
	movq	24(%rax), %rbx
	movq	-136(%rbp), %rax
	movq	8(%rax), %rax
	subq	-64(%rbp), %rax
	movq	-136(%rbp), %rdx
	movq	(%rdx), %rcx
	movq	-64(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	movq	%rbx, %rdx
	movl	$7, %edi
	call	create_token
	jmp	.L19
.L47:
	cmpb	$47, -17(%rbp)
	jne	.L52
	cmpb	$42, -25(%rbp)
	jne	.L52
	movq	-136(%rbp), %rax
	movq	8(%rax), %rax
	addq	$1, %rax
	movq	%rax, -80(%rbp)
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	subq	$1, %rax
	movq	%rax, -88(%rbp)
	jmp	.L53
.L57:
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movb	%al, -17(%rbp)
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	peek_next_char
	movb	%al, -25(%rbp)
	cmpb	$10, -17(%rbp)
	jne	.L54
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	newline
.L54:
	cmpb	$0, -25(%rbp)
	je	.L92
	cmpb	$0, -17(%rbp)
	jne	.L53
	leaq	__PRETTY_FUNCTION__.0(%rip), %rax
	movq	%rax, %rcx
	movl	$125, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	*__assert_fail@GOTPCREL(%rip)
.L53:
	cmpb	$42, -17(%rbp)
	jne	.L57
	cmpb	$47, -25(%rbp)
	jne	.L57
	jmp	.L56
.L92:
	nop
.L56:
	cmpb	$0, -25(%rbp)
	jne	.L58
	cmpb	$0, -17(%rbp)
	jne	.L59
	movq	-136(%rbp), %rax
	movl	$-1, %esi
	movq	%rax, %rdi
	call	move_position
.L59:
	movq	-136(%rbp), %rax
	movq	24(%rax), %rax
	movq	-80(%rbp), %rdx
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	lexer_error
	cmpb	$0, -140(%rbp)
	je	.L60
	movsbl	-140(%rbp), %edx
	movq	-136(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	next_token
	jmp	.L19
.L60:
	movq	-136(%rbp), %rax
	movq	24(%rax), %rbx
	movq	-136(%rbp), %rax
	movq	8(%rax), %rax
	subq	-80(%rbp), %rax
	movq	-136(%rbp), %rdx
	movq	(%rdx), %rcx
	movq	-80(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	-88(%rbp), %rax
	movq	%rax, %rcx
	movq	%rbx, %rdx
	movl	$7, %edi
	call	create_token
	jmp	.L19
.L58:
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movb	%al, -17(%rbp)
	cmpb	$0, -140(%rbp)
	je	.L61
	movsbl	-140(%rbp), %edx
	movq	-136(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	next_token
	jmp	.L19
.L61:
	movq	-136(%rbp), %rax
	movq	24(%rax), %rbx
	movq	-136(%rbp), %rax
	movq	8(%rax), %rax
	subq	-80(%rbp), %rax
	leaq	-2(%rax), %rdx
	movq	-136(%rbp), %rax
	movq	(%rax), %rcx
	movq	-80(%rbp), %rax
	addq	%rcx, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	-88(%rbp), %rax
	movq	%rax, %rcx
	movq	%rbx, %rdx
	movl	$7, %edi
	call	create_token
	jmp	.L19
.L52:
	cmpb	$61, -17(%rbp)
	jne	.L62
	cmpb	$61, -25(%rbp)
	jne	.L62
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	EQ_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L62:
	cmpb	$33, -17(%rbp)
	jne	.L63
	cmpb	$61, -25(%rbp)
	jne	.L63
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	NE_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L63:
	cmpb	$60, -17(%rbp)
	jne	.L64
	cmpb	$61, -25(%rbp)
	jne	.L64
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	LE_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L64:
	cmpb	$62, -17(%rbp)
	jne	.L65
	cmpb	$61, -25(%rbp)
	jne	.L65
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	GE_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L65:
	cmpb	$43, -17(%rbp)
	jne	.L66
	cmpb	$61, -25(%rbp)
	jne	.L66
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L66:
	cmpb	$45, -17(%rbp)
	jne	.L67
	cmpb	$61, -25(%rbp)
	jne	.L67
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L67:
	cmpb	$42, -17(%rbp)
	jne	.L68
	cmpb	$61, -25(%rbp)
	jne	.L68
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L68:
	cmpb	$47, -17(%rbp)
	jne	.L69
	cmpb	$61, -25(%rbp)
	jne	.L69
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L69:
	cmpb	$37, -17(%rbp)
	jne	.L70
	cmpb	$61, -25(%rbp)
	jne	.L70
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L70:
	cmpb	$38, -17(%rbp)
	jne	.L71
	cmpb	$38, -25(%rbp)
	jne	.L71
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	AND_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L71:
	cmpb	$124, -17(%rbp)
	jne	.L72
	cmpb	$124, -25(%rbp)
	jne	.L72
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	get_current_char
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	OR_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L72:
	cmpb	$40, -17(%rbp)
	jne	.L73
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	L_PAREN_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L73:
	cmpb	$41, -17(%rbp)
	jne	.L74
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	R_PAREN_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L74:
	cmpb	$123, -17(%rbp)
	jne	.L75
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	L_BRACE_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L75:
	cmpb	$125, -17(%rbp)
	jne	.L76
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	R_BRACE_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L76:
	cmpb	$44, -17(%rbp)
	jne	.L77
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	COMMA_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L77:
	cmpb	$33, -17(%rbp)
	jne	.L78
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	NOT_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L78:
	cmpb	$46, -17(%rbp)
	jne	.L79
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	DOT_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L79:
	cmpb	$91, -17(%rbp)
	jne	.L80
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	L_BRACKET_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L80:
	cmpb	$93, -17(%rbp)
	jne	.L81
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	R_BRACKET_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L81:
	cmpb	$59, -17(%rbp)
	jne	.L82
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	SEMICOLON_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L82:
	cmpb	$95, -17(%rbp)
	jne	.L83
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	UNDERLINE_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L83:
	cmpb	$43, -17(%rbp)
	jne	.L84
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	ADD_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L84:
	cmpb	$45, -17(%rbp)
	jne	.L85
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	SUB_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L85:
	cmpb	$42, -17(%rbp)
	jne	.L86
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	MUL_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L86:
	cmpb	$47, -17(%rbp)
	jne	.L87
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	DIV_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L87:
	cmpb	$37, -17(%rbp)
	jne	.L88
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	MOD_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L88:
	cmpb	$60, -17(%rbp)
	jne	.L89
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	LT_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L89:
	cmpb	$62, -17(%rbp)
	jne	.L90
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	GT_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L90:
	cmpb	$61, -17(%rbp)
	jne	.L91
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rdx
	movq	ASSIGN_SYMBOL(%rip), %rax
	movq	%rax, %rsi
	movl	$5, %edi
	call	create_token
	jmp	.L19
.L91:
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rdx
	movq	-136(%rbp), %rax
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
	ret
	.size	next_token, .-next_token
	.globl	get_next_token
	.type	get_next_token, @function
get_next_token:
	pushq	%rbp
	movq	%rsp, %rbp
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
	ret
	.size	get_next_token, .-get_next_token
	.globl	peek_next_token
	.type	peek_next_token, @function
peek_next_token:
	pushq	%rbp
	movq	%rsp, %rbp
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
	movq	%rax, -8(%rbp)
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-40(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -24(%rbp)
	movsbl	-44(%rbp), %edx
	movq	-40(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	get_next_token
	movq	%rax, -32(%rbp)
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
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-40(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 40(%rax)
	movq	-32(%rbp), %rax
.L98:
	leave
	ret
	.size	peek_next_token, .-peek_next_token
	.globl	peek_current_token
	.type	peek_current_token, @function
peek_current_token:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	72(%rax), %rax
	popq	%rbp
	ret
	.size	peek_current_token, .-peek_current_token
	.globl	reset_lexer
	.type	reset_lexer, @function
reset_lexer:
	pushq	%rbp
	movq	%rsp, %rbp
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
