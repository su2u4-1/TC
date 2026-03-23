	.file	"D:\\TC\\src\\compiler.c"
	.text
	.section .rdata,"dr"
.LC0:
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
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	create_string_not_check
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
	jmp	.L2
.L5:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$13, %al
	je	.L3
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$9, %al
	jne	.L4
.L3:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$32, (%rax)
.L4:
	addq	$1, -8(%rbp)
.L2:
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, -8(%rbp)
	jb	.L5
	movq	-16(%rbp), %rax
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "Token(Type: EOF,         Line: %zu, Column: %zu)\12\0"
	.align 8
.LC2:
	.ascii "Token(Type: identifier,  Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC3:
	.ascii "Token(Type: integer,     Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC4:
	.ascii "Token(Type: float,       Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC5:
	.ascii "Token(Type: string,      Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC6:
	.ascii "Token(Type: symbol,      Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC7:
	.ascii "Token(Type: keyword,     Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC8:
	.ascii "Token(Type: comment,     Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC9:
	.ascii "\\0\0"
.LC10:
	.ascii "\\n\0"
.LC11:
	.ascii "\\t\0"
.LC12:
	.ascii "\\r\0"
.LC13:
	.ascii "'\12\0"
	.text
	.globl	output_one_token
	.def	output_one_token;	.scl	2;	.type	32;	.endef
output_one_token:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	jne	.L8
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L7
.L8:
	movq	24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	jne	.L10
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L11
.L10:
	movq	24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$2, %eax
	jne	.L12
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC3(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L11
.L12:
	movq	24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$3, %eax
	jne	.L13
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L11
.L13:
	movq	24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$4, %eax
	jne	.L14
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC5(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L11
.L14:
	movq	24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L15
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC6(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L11
.L15:
	movq	24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L16
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L11
.L16:
	movq	24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$7, %eax
	jne	.L11
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC8(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L11:
	movq	$0, -8(%rbp)
	jmp	.L17
.L23:
	movq	24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -9(%rbp)
	cmpb	$0, -9(%rbp)
	jne	.L18
	movq	16(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC9(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L19
.L18:
	cmpb	$10, -9(%rbp)
	jne	.L20
	movq	16(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC10(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L19
.L20:
	cmpb	$9, -9(%rbp)
	jne	.L21
	movq	16(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L19
.L21:
	cmpb	$13, -9(%rbp)
	jne	.L22
	movq	16(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC12(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L19
.L22:
	movsbl	-9(%rbp), %eax
	movq	16(%rbp), %rdx
	movl	%eax, %ecx
	call	fputc
.L19:
	addq	$1, -8(%rbp)
.L17:
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	strlen
	cmpq	%rax, -8(%rbp)
	jb	.L23
	movq	16(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L7:
	leave
	ret
	.section .rdata,"dr"
.LC14:
	.ascii "\12info by lib:\12    %s\12\0"
	.text
	.globl	output_token
	.def	output_token;	.scl	2;	.type	32;	.endef
output_token:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	jmp	.L25
.L28:
	movq	-8(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	output_one_token
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	je	.L29
	movq	24(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
.L25:
	cmpq	$0, -8(%rbp)
	jne	.L28
	jmp	.L27
.L29:
	nop
.L27:
	call	get_info
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC14(%rip), %rdx
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
	leaq	.LC14(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
	leave
	ret
	.section .rdata,"dr"
.LC15:
	.ascii "r\0"
.LC16:
	.ascii "Error opening file: %s\0"
.LC17:
	.ascii ".token\0"
.LC18:
	.ascii "w\0"
.LC19:
	.ascii "Error opening file: %s\12\0"
.LC20:
	.ascii ".ast\0"
.LC21:
	.ascii ".tc\0"
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
	leaq	.LC15(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L32
	call	__getreent
	movq	24(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %r8
	leaq	.LC16(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L31
.L32:
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
	je	.L34
	movl	$6, %edx
	leaq	.LC17(%rip), %rax
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
	leaq	.LC18(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L35
	call	__getreent
	movq	24(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, %r8
	leaq	.LC19(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L34
.L35:
	movq	-40(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	output_token
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
.L34:
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	reset_lexer
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	create_parser
	movq	%rax, -64(%rbp)
	cmpb	$0, 32(%rbp)
	je	.L31
	movl	$4, %edx
	leaq	.LC20(%rip), %rax
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
	movl	$3, %edx
	leaq	.LC21(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	change_file_extension
	movq	-72(%rbp), %rax
	leaq	.LC18(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	jne	.L37
	call	__getreent
	movq	24(%rax), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, %r8
	leaq	.LC19(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L31
.L37:
	movq	-64(%rbp), %rcx
	movq	-40(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	output_ast
	movq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
.L31:
	leave
	ret
	.ident	"GCC: (GNU) 13.2.0"
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	ftell;	.scl	2;	.type	32;	.endef
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	get_info;	.scl	2;	.type	32;	.endef
	.def	parse_code;	.scl	2;	.type	32;	.endef
	.def	output_code;	.scl	2;	.type	32;	.endef
	.def	create_file;	.scl	2;	.type	32;	.endef
	.def	get_full_path;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	create_lexer;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
	.def	reset_lexer;	.scl	2;	.type	32;	.endef
	.def	create_parser;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.builtin_scope, "dr"
	.globl	.refptr.builtin_scope
	.linkonce	discard
.refptr.builtin_scope:
	.quad	builtin_scope
