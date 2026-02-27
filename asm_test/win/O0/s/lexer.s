	.file	"D:\\TC\\src\\lexer.c"
	.text
	.globl	create_lexer
	.def	create_lexer;	.scl	2;	.type	32;	.endef
create_lexer:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	$80, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
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
	.def	create_token;	.scl	3;	.type	32;	.endef
create_token:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 24(%rax)
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Lexer Error at Line %zu, Column %zu: %s\12\0"
	.text
	.def	lexer_error;	.scl	3;	.type	32;	.endef
lexer_error:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	pushq	%rbx
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	32(%rbp), %rax
	leaq	1(%rax), %rsi
	movq	24(%rbp), %rax
	leaq	1(%rax), %rbx
	call	__getreent
	movq	24(%rax), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.def	get_current_char;	.scl	3;	.type	32;	.endef
get_current_char:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	cmpq	%rax, %rdx
	jb	.L7
	movl	$0, %eax
	jmp	.L8
.L7:
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 32(%rax)
	movq	16(%rbp), %rax
	movq	(%rax), %r8
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rcx
	movq	16(%rbp), %rdx
	movq	%rcx, 8(%rdx)
	addq	%r8, %rax
	movzbl	(%rax), %eax
.L8:
	popq	%rbp
	ret
	.def	peek_next_char;	.scl	3;	.type	32;	.endef
peek_next_char:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	cmpq	%rax, %rdx
	jb	.L10
	movl	$0, %eax
	jmp	.L11
.L10:
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
.L11:
	popq	%rbp
	ret
	.def	newline;	.scl	3;	.type	32;	.endef
newline:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 24(%rax)
	movq	16(%rbp), %rax
	movq	$0, 32(%rax)
	nop
	popq	%rbp
	ret
	.def	move_position;	.scl	3;	.type	32;	.endef
move_position:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	cmpl	$0, 24(%rbp)
	js	.L14
	movq	16(%rbp), %rax
	movq	8(%rax), %rdx
	movl	24(%rbp), %eax
	cltq
	addq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movl	24(%rbp), %eax
	cltq
	addq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 32(%rax)
	jmp	.L16
.L14:
	movq	16(%rbp), %rax
	movq	8(%rax), %rdx
	movl	24(%rbp), %eax
	negl	%eax
	cltq
	subq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movl	24(%rbp), %eax
	negl	%eax
	cltq
	subq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 32(%rax)
.L16:
	nop
	popq	%rbp
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
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$152, %rsp
	movq	%rcx, 16(%rbp)
	movl	%edx, %eax
	movb	%al, 24(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movb	%al, -17(%rbp)
	cmpb	$0, -17(%rbp)
	jne	.L18
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rdx, %r9
	movq	%rax, %r8
	movl	$0, %edx
	movl	$0, %ecx
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
	movsbl	24(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	next_token
	jmp	.L19
.L21:
	cmpb	$10, -17(%rbp)
	jne	.L22
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	newline
	movsbl	24(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
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
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	subq	$1, %rax
	movq	%rax, -112(%rbp)
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	subq	$1, %rax
	movq	%rax, -120(%rbp)
	jmp	.L27
.L29:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
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
	movq	16(%rbp), %rax
	movl	$-1, %edx
	movq	%rax, %rcx
	call	move_position
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	subq	-112(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	(%rdx), %rcx
	movq	-112(%rbp), %rdx
	addq	%rdx, %rcx
	movq	%rax, %rdx
	call	create_string
	movq	%rax, -128(%rbp)
	movq	-128(%rbp), %rax
	movq	%rax, %rcx
	call	is_keyword
	testb	%al, %al
	je	.L32
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-120(%rbp), %rcx
	movq	-128(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_token
	jmp	.L19
.L32:
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-120(%rbp), %rcx
	movq	-128(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_token
	jmp	.L19
.L26:
	cmpb	$47, -17(%rbp)
	jle	.L33
	cmpb	$57, -17(%rbp)
	jg	.L33
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	subq	$1, %rax
	movq	%rax, -40(%rbp)
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	subq	$1, %rax
	movq	%rax, -48(%rbp)
	jmp	.L34
.L36:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movb	%al, -17(%rbp)
.L34:
	cmpb	$47, -17(%rbp)
	jle	.L35
	cmpb	$57, -17(%rbp)
	jle	.L36
.L35:
	movl	$2, -24(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	peek_next_char
	movb	%al, -49(%rbp)
	cmpb	$46, -17(%rbp)
	jne	.L37
	cmpb	$47, -49(%rbp)
	jle	.L37
	cmpb	$57, -49(%rbp)
	jg	.L37
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movb	%al, -17(%rbp)
	jmp	.L38
.L40:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
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
	movq	16(%rbp), %rax
	movl	$-1, %edx
	movq	%rax, %rcx
	call	move_position
	movq	16(%rbp), %rax
	movq	24(%rax), %rbx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	subq	-40(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	(%rdx), %rcx
	movq	-40(%rbp), %rdx
	addq	%rdx, %rcx
	movq	%rax, %rdx
	call	create_string
	movq	%rax, %rdx
	movq	-48(%rbp), %rcx
	movl	-24(%rbp), %eax
	movq	%rcx, %r9
	movq	%rbx, %r8
	movl	%eax, %ecx
	call	create_token
	jmp	.L19
.L33:
	cmpb	$34, -17(%rbp)
	jne	.L41
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -96(%rbp)
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	subq	$1, %rax
	movq	%rax, -104(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movb	%al, -17(%rbp)
	jmp	.L42
.L44:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
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
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	lexer_error
	cmpb	$10, -17(%rbp)
	jne	.L46
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	newline
.L46:
	movq	16(%rbp), %rax
	movq	24(%rax), %rbx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	subq	-96(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rcx
	movq	-96(%rbp), %rax
	addq	%rcx, %rax
	movq	%rax, %rcx
	call	create_string
	movq	-104(%rbp), %rdx
	movq	%rdx, %r9
	movq	%rbx, %r8
	movq	%rax, %rdx
	movl	$4, %ecx
	call	create_token
	jmp	.L19
.L45:
	movq	16(%rbp), %rax
	movq	24(%rax), %rbx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	subq	-96(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rcx
	movq	-96(%rbp), %rax
	addq	%rcx, %rax
	movq	%rax, %rcx
	call	create_string
	movq	-104(%rbp), %rdx
	movq	%rdx, %r9
	movq	%rbx, %r8
	movq	%rax, %rdx
	movl	$4, %ecx
	call	create_token
	jmp	.L19
.L41:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	peek_next_char
	movb	%al, -25(%rbp)
	cmpb	$47, -17(%rbp)
	jne	.L47
	cmpb	$47, -25(%rbp)
	jne	.L47
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	addq	$1, %rax
	movq	%rax, -64(%rbp)
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	subq	$1, %rax
	movq	%rax, -72(%rbp)
	jmp	.L48
.L50:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movb	%al, -17(%rbp)
.L48:
	cmpb	$10, -17(%rbp)
	je	.L49
	cmpb	$0, -17(%rbp)
	jne	.L50
.L49:
	movq	16(%rbp), %rax
	movl	$-1, %edx
	movq	%rax, %rcx
	call	move_position
	cmpb	$0, 24(%rbp)
	je	.L51
	movsbl	24(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	next_token
	jmp	.L19
.L51:
	movq	16(%rbp), %rax
	movq	24(%rax), %rbx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	subq	-64(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	(%rdx), %rcx
	movq	-64(%rbp), %rdx
	addq	%rdx, %rcx
	movq	%rax, %rdx
	call	create_string
	movq	-72(%rbp), %rdx
	movq	%rdx, %r9
	movq	%rbx, %r8
	movq	%rax, %rdx
	movl	$7, %ecx
	call	create_token
	jmp	.L19
.L47:
	cmpb	$47, -17(%rbp)
	jne	.L52
	cmpb	$42, -25(%rbp)
	jne	.L52
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	addq	$1, %rax
	movq	%rax, -80(%rbp)
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	subq	$1, %rax
	movq	%rax, -88(%rbp)
	jmp	.L53
.L57:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movb	%al, -17(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	peek_next_char
	movb	%al, -25(%rbp)
	cmpb	$10, -17(%rbp)
	jne	.L54
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	newline
.L54:
	cmpb	$0, -25(%rbp)
	je	.L92
	cmpb	$0, -17(%rbp)
	jne	.L53
	leaq	.LC2(%rip), %r9
	leaq	__func__.0(%rip), %r8
	movl	$125, %edx
	leaq	.LC3(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
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
	movq	16(%rbp), %rax
	movl	$-1, %edx
	movq	%rax, %rcx
	call	move_position
.L59:
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	-80(%rbp), %rdx
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	lexer_error
	cmpb	$0, 24(%rbp)
	je	.L60
	movsbl	24(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	next_token
	jmp	.L19
.L60:
	movq	16(%rbp), %rax
	movq	24(%rax), %rbx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	subq	-80(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	(%rdx), %rcx
	movq	-80(%rbp), %rdx
	addq	%rdx, %rcx
	movq	%rax, %rdx
	call	create_string
	movq	-88(%rbp), %rdx
	movq	%rdx, %r9
	movq	%rbx, %r8
	movq	%rax, %rdx
	movl	$7, %ecx
	call	create_token
	jmp	.L19
.L58:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movb	%al, -17(%rbp)
	cmpb	$0, 24(%rbp)
	je	.L61
	movsbl	24(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	next_token
	jmp	.L19
.L61:
	movq	16(%rbp), %rax
	movq	24(%rax), %rbx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	subq	-80(%rbp), %rax
	leaq	-2(%rax), %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rcx
	movq	-80(%rbp), %rax
	addq	%rcx, %rax
	movq	%rax, %rcx
	call	create_string
	movq	-88(%rbp), %rdx
	movq	%rdx, %r9
	movq	%rbx, %r8
	movq	%rax, %rdx
	movl	$7, %ecx
	call	create_token
	jmp	.L19
.L52:
	cmpb	$61, -17(%rbp)
	jne	.L62
	cmpb	$61, -25(%rbp)
	jne	.L62
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L62:
	cmpb	$33, -17(%rbp)
	jne	.L63
	cmpb	$61, -25(%rbp)
	jne	.L63
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L63:
	cmpb	$60, -17(%rbp)
	jne	.L64
	cmpb	$61, -25(%rbp)
	jne	.L64
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L64:
	cmpb	$62, -17(%rbp)
	jne	.L65
	cmpb	$61, -25(%rbp)
	jne	.L65
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L65:
	cmpb	$43, -17(%rbp)
	jne	.L66
	cmpb	$61, -25(%rbp)
	jne	.L66
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L66:
	cmpb	$45, -17(%rbp)
	jne	.L67
	cmpb	$61, -25(%rbp)
	jne	.L67
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L67:
	cmpb	$42, -17(%rbp)
	jne	.L68
	cmpb	$61, -25(%rbp)
	jne	.L68
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L68:
	cmpb	$47, -17(%rbp)
	jne	.L69
	cmpb	$61, -25(%rbp)
	jne	.L69
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L69:
	cmpb	$37, -17(%rbp)
	jne	.L70
	cmpb	$61, -25(%rbp)
	jne	.L70
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L70:
	cmpb	$38, -17(%rbp)
	jne	.L71
	cmpb	$38, -25(%rbp)
	jne	.L71
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L71:
	cmpb	$124, -17(%rbp)
	jne	.L72
	cmpb	$124, -25(%rbp)
	jne	.L72
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L72:
	cmpb	$40, -17(%rbp)
	jne	.L73
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L73:
	cmpb	$41, -17(%rbp)
	jne	.L74
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L74:
	cmpb	$123, -17(%rbp)
	jne	.L75
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L75:
	cmpb	$125, -17(%rbp)
	jne	.L76
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L76:
	cmpb	$44, -17(%rbp)
	jne	.L77
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L77:
	cmpb	$33, -17(%rbp)
	jne	.L78
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.NOT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L78:
	cmpb	$46, -17(%rbp)
	jne	.L79
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.DOT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L79:
	cmpb	$91, -17(%rbp)
	jne	.L80
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L80:
	cmpb	$93, -17(%rbp)
	jne	.L81
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L81:
	cmpb	$59, -17(%rbp)
	jne	.L82
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L82:
	cmpb	$95, -17(%rbp)
	jne	.L83
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.UNDERLINE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L83:
	cmpb	$43, -17(%rbp)
	jne	.L84
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L84:
	cmpb	$45, -17(%rbp)
	jne	.L85
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L85:
	cmpb	$42, -17(%rbp)
	jne	.L86
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L86:
	cmpb	$47, -17(%rbp)
	jne	.L87
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L87:
	cmpb	$37, -17(%rbp)
	jne	.L88
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L88:
	cmpb	$60, -17(%rbp)
	jne	.L89
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L89:
	cmpb	$62, -17(%rbp)
	jne	.L90
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L90:
	cmpb	$61, -17(%rbp)
	jne	.L91
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L19
.L91:
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	-1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC5(%rip), %rax
	movq	%rax, %rcx
	call	lexer_error
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_token
.L19:
	movq	-8(%rbp), %rbx
	leave
	ret
	.globl	get_next_token
	.def	get_next_token;	.scl	2;	.type	32;	.endef
get_next_token:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movl	%edx, %eax
	movb	%al, 24(%rbp)
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	testq	%rax, %rax
	je	.L94
	movq	16(%rbp), %rax
	movq	40(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 72(%rax)
	movq	16(%rbp), %rax
	movq	48(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	16(%rbp), %rax
	movq	56(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 24(%rax)
	movq	16(%rbp), %rax
	movq	64(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 32(%rax)
	movq	16(%rbp), %rax
	movq	$0, 40(%rax)
	movq	16(%rbp), %rax
	movq	72(%rax), %rax
	jmp	.L95
.L94:
	movsbl	24(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	next_token
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 72(%rax)
	movq	16(%rbp), %rax
	movq	72(%rax), %rax
.L95:
	leave
	ret
	.globl	peek_next_token
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
peek_next_token:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movl	%edx, %eax
	movb	%al, 24(%rbp)
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	testq	%rax, %rax
	je	.L97
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	jmp	.L98
.L97:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -24(%rbp)
	movsbl	24(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -32(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 48(%rax)
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 56(%rax)
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 64(%rax)
	movq	16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	16(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 40(%rax)
	movq	-32(%rbp), %rax
.L98:
	leave
	ret
	.globl	peek_current_token
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
peek_current_token:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	72(%rax), %rax
	popq	%rbp
	ret
	.globl	reset_lexer
	.def	reset_lexer;	.scl	2;	.type	32;	.endef
reset_lexer:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	$0, 8(%rax)
	movq	16(%rbp), %rax
	movq	$0, 24(%rax)
	movq	16(%rbp), %rax
	movq	$0, 32(%rax)
	movq	16(%rbp), %rax
	movq	$0, 40(%rax)
	movq	16(%rbp), %rax
	movq	$0, 48(%rax)
	movq	16(%rbp), %rax
	movq	$0, 56(%rax)
	movq	16(%rbp), %rax
	movq	$0, 64(%rax)
	movq	16(%rbp), %rax
	movq	$0, 72(%rax)
	nop
	popq	%rbp
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
	.section	.rdata$.refptr.UNDERLINE_SYMBOL, "dr"
	.globl	.refptr.UNDERLINE_SYMBOL
	.linkonce	discard
.refptr.UNDERLINE_SYMBOL:
	.quad	UNDERLINE_SYMBOL
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
