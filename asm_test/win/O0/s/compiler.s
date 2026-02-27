	.file	"D:\\TC\\src\\compiler.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "%.*s%s\0"
.LC1:
	.ascii "%s\0"
.LC2:
	.ascii "%s%s\0"
	.text
	.globl	string_append
	.def	string_append;	.scl	2;	.type	32;	.endef
string_append:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	32(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, -8(%rbp)
	movq	40(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	cmpq	24(%rbp), %rax
	jb	.L2
	movq	24(%rbp), %rax
	subq	-16(%rbp), %rax
	subq	$1, %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	%eax, %r8d
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	40(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movq	32(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movl	%r8d, %r9d
	leaq	.LC0(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L5
.L2:
	movq	32(%rbp), %rax
	cmpq	16(%rbp), %rax
	jne	.L4
	movq	24(%rbp), %rax
	subq	-8(%rbp), %rax
	movq	16(%rbp), %rcx
	movq	-8(%rbp), %rdx
	addq	%rdx, %rcx
	movq	40(%rbp), %rdx
	movq	%rdx, %r9
	leaq	.LC1(%rip), %r8
	movq	%rax, %rdx
	call	snprintf
	jmp	.L5
.L4:
	movq	32(%rbp), %r8
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	40(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movq	%r8, %r9
	leaq	.LC2(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
.L5:
	nop
	leave
	ret
	.section .rdata,"dr"
.LC3:
	.ascii "\0"
	.text
	.globl	read_source
	.def	read_source;	.scl	2;	.type	32;	.endef
read_source:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movl	$2, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	fseek
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	ftell
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	fseek
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, %rax
	movq	%rax, %rdx
	leaq	.LC3(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	%rax, -16(%rbp)
	movq	24(%rbp), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rcx
	movq	-16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$1, %edx
	movq	%rax, %rcx
	call	fread
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	24(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	$0, -8(%rbp)
	jmp	.L7
.L10:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$13, %al
	je	.L8
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$9, %al
	jne	.L9
.L8:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$32, (%rax)
.L9:
	addq	$1, -8(%rbp)
.L7:
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, -8(%rbp)
	jb	.L10
	movq	-16(%rbp), %rax
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "Token(Type: EOF,         Line: %zu, Column: %zu)\12\0"
	.align 8
.LC5:
	.ascii "Token(Type: identifier,  Line: \0"
	.align 8
.LC6:
	.ascii "Token(Type: integer,     Line: \0"
	.align 8
.LC7:
	.ascii "Token(Type: float,       Line: \0"
	.align 8
.LC8:
	.ascii "Token(Type: string,      Line: \0"
	.align 8
.LC9:
	.ascii "Token(Type: symbol,      Line: \0"
	.align 8
.LC10:
	.ascii "Token(Type: keyword,     Line: \0"
	.align 8
.LC11:
	.ascii "Token(Type: comment,     Line: \0"
.LC12:
	.ascii "%zu, Column: %zu)\11Lexeme: '\0"
.LC13:
	.ascii "\\0\0"
.LC14:
	.ascii "\\n\0"
.LC15:
	.ascii "\\t\0"
.LC16:
	.ascii "\\r\0"
.LC17:
	.ascii "'\12\0"
.LC18:
	.ascii "\12info by lib:\12    %s\12\0"
	.text
	.globl	output_token
	.def	output_token;	.scl	2;	.type	32;	.endef
output_token:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	jmp	.L13
.L30:
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	jne	.L14
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L15
.L14:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	jne	.L16
	movq	16(%rbp), %rax
	movq	%rax, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L17
.L16:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$2, %eax
	jne	.L18
	movq	16(%rbp), %rax
	movq	%rax, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L17
.L18:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$3, %eax
	jne	.L19
	movq	16(%rbp), %rax
	movq	%rax, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L17
.L19:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$4, %eax
	jne	.L20
	movq	16(%rbp), %rax
	movq	%rax, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L17
.L20:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L21
	movq	16(%rbp), %rax
	movq	%rax, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC9(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L17
.L21:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L22
	movq	16(%rbp), %rax
	movq	%rax, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC10(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L17
.L22:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$7, %eax
	jne	.L17
	movq	16(%rbp), %rax
	movq	%rax, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L17:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC12(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L23
.L29:
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -33(%rbp)
	cmpb	$0, -33(%rbp)
	jne	.L24
	movq	16(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L25
.L24:
	cmpb	$10, -33(%rbp)
	jne	.L26
	movq	16(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC14(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L25
.L26:
	cmpb	$9, -33(%rbp)
	jne	.L27
	movq	16(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L25
.L27:
	cmpb	$13, -33(%rbp)
	jne	.L28
	movq	16(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC16(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L25
.L28:
	movsbl	-33(%rbp), %eax
	movq	16(%rbp), %rdx
	movl	%eax, %ecx
	call	fputc
.L25:
	addq	$1, -16(%rbp)
.L23:
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	cmpq	%rax, -16(%rbp)
	jb	.L29
	movq	16(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC17(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	24(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
.L13:
	cmpq	$0, -8(%rbp)
	jne	.L30
.L15:
	call	get_info
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC18(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
	leave
	ret
	.globl	output_ast
	.def	output_ast;	.scl	2;	.type	32;	.endef
output_ast:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %rdx
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_code
	movq	%rax, -8(%rbp)
	movq	32(%rbp), %rcx
	movq	16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	output_code
	call	get_info
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC18(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
	leave
	ret
	.section .rdata,"dr"
.LC19:
	.ascii "r\0"
.LC20:
	.ascii "Error opening file: %s\0"
.LC21:
	.ascii ".token\0"
.LC22:
	.ascii "w\0"
.LC23:
	.ascii "Error opening file: %s\12\0"
.LC24:
	.ascii ".ast\0"
	.text
	.globl	parse_file
	.def	parse_file;	.scl	2;	.type	32;	.endef
parse_file:
	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-128, %rsp
	movq	%rcx, 16(%rbp)
	movl	%edx, %eax
	movl	%r8d, %edx
	movb	%al, 24(%rbp)
	movl	%edx, %eax
	movb	%al, 32(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	create_file
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, -16(%rbp)
	movq	$0, -88(%rbp)
	movq	-16(%rbp), %rax
	leaq	.LC19(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L33
	call	__getreent
	movq	24(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %r8
	leaq	.LC20(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L32
.L33:
	leaq	-88(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	read_source
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movq	-88(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	create_lexer
	movq	%rax, -40(%rbp)
	cmpb	$0, 24(%rbp)
	je	.L35
	movl	$6, %edx
	leaq	.LC21(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	change_file_extension
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	leaq	.LC22(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L36
	call	__getreent
	movq	24(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, %r8
	leaq	.LC23(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L35
.L36:
	movq	-40(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	output_token
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
.L35:
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	reset_lexer
	call	create_parser
	movq	%rax, -64(%rbp)
	cmpb	$0, 32(%rbp)
	je	.L32
	movl	$4, %edx
	leaq	.LC24(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	change_file_extension
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	leaq	.LC22(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	jne	.L38
	call	__getreent
	movq	24(%rax), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, %r8
	leaq	.LC23(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L32
.L38:
	movq	-64(%rbp), %rcx
	movq	-40(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	output_ast
	movq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
.L32:
	leave
	ret
	.ident	"GCC: (GNU) 13.2.0"
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	snprintf;	.scl	2;	.type	32;	.endef
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	ftell;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
	.def	get_info;	.scl	2;	.type	32;	.endef
	.def	parse_code;	.scl	2;	.type	32;	.endef
	.def	output_code;	.scl	2;	.type	32;	.endef
	.def	create_file;	.scl	2;	.type	32;	.endef
	.def	get_full_path;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	create_lexer;	.scl	2;	.type	32;	.endef
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
	.def	reset_lexer;	.scl	2;	.type	32;	.endef
	.def	create_parser;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.builtin_scope, "dr"
	.globl	.refptr.builtin_scope
	.linkonce	discard
.refptr.builtin_scope:
	.quad	builtin_scope
