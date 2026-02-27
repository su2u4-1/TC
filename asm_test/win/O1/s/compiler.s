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
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$48, %rsp
	movq	%rcx, %r12
	movq	%rdx, %rbx
	movq	%r8, %rsi
	movq	%r9, %rdi
	movq	%r8, %rcx
	call	strlen
	movq	%rax, %rbp
	movq	%rdi, %rcx
	call	strlen
	leaq	0(%rbp,%rax), %rdx
	cmpq	%rbx, %rdx
	jnb	.L6
	cmpq	%r12, %rsi
	je	.L7
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC2(%rip), %r8
	movq	%rbx, %rdx
	movq	%r12, %rcx
	call	snprintf
.L1:
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L6:
	leaq	-1(%rbx), %r9
	movq	%rdi, 40(%rsp)
	movq	%rsi, 32(%rsp)
	subl	%eax, %r9d
	leaq	.LC0(%rip), %r8
	movq	%rbx, %rdx
	movq	%r12, %rcx
	call	snprintf
	jmp	.L1
.L7:
	subq	%rbp, %rbx
	movq	%rbx, %rdx
	leaq	(%r12,%rbp), %rcx
	movq	%rdi, %r9
	leaq	.LC1(%rip), %r8
	call	snprintf
	jmp	.L1
	.section .rdata,"dr"
.LC3:
	.ascii "\0"
	.text
	.globl	read_source
	.def	read_source;	.scl	2;	.type	32;	.endef
read_source:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rdi
	movq	%rdx, %rsi
	movl	$2, %r8d
	movl	$0, %edx
	call	fseek
	movq	%rdi, %rcx
	call	ftell
	movq	%rax, (%rsi)
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rdi, %rcx
	call	fseek
	movq	(%rsi), %rax
	leaq	1(%rax), %rdx
	leaq	.LC3(%rip), %rcx
	call	create_string
	movq	%rax, %rbx
	movq	%rdi, %r9
	movq	(%rsi), %r8
	movl	$1, %edx
	movq	%rax, %rcx
	call	fread
	movb	$0, (%rbx,%rax)
	movq	%rax, (%rsi)
	testq	%rax, %rax
	je	.L8
	movl	$0, %eax
	jmp	.L11
.L10:
	addq	$1, %rax
	cmpq	(%rsi), %rax
	jnb	.L8
.L11:
	movzbl	(%rbx,%rax), %edx
	andl	$-5, %edx
	cmpb	$9, %dl
	jne	.L10
	movb	$32, (%rbx,%rax)
	jmp	.L10
.L8:
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rdi
	movq	%rdx, %r14
	movl	$0, %edx
	movq	%r14, %rcx
	call	get_next_token
	testq	%rax, %rax
	je	.L15
	movq	%rax, %rbx
	leaq	.L18(%rip), %r12
	leaq	.LC16(%rip), %r15
	jmp	.L33
.L25:
	movq	16(%rbx), %rdx
	movq	8(%rbx), %rax
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC4(%rip), %rdx
	movq	%rdi, %rcx
	call	fprintf
.L15:
	call	get_info
	movq	%rax, %r8
	leaq	.LC18(%rip), %rdx
	movq	%rdi, %rcx
	call	fprintf
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L24:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rcx
	call	fwrite
.L16:
	movq	16(%rbx), %rdx
	movq	8(%rbx), %rax
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC12(%rip), %rdx
	movq	%rdi, %rcx
	call	fprintf
	movq	(%rbx), %rsi
	movl	$0, %ebx
	leaq	.LC14(%rip), %r13
	leaq	.LC13(%rip), %rbp
	jmp	.L26
.L23:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC6(%rip), %rcx
	call	fwrite
	jmp	.L16
.L22:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rcx
	call	fwrite
	jmp	.L16
.L21:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC8(%rip), %rcx
	call	fwrite
	jmp	.L16
.L20:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC9(%rip), %rcx
	call	fwrite
	jmp	.L16
.L19:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC10(%rip), %rcx
	call	fwrite
	jmp	.L16
.L17:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rcx
	call	fwrite
	jmp	.L16
.L37:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%rbp, %rcx
	call	fwrite
.L28:
	addq	$1, %rbx
.L26:
	movq	%rsi, %rcx
	call	strlen
	cmpq	%rax, %rbx
	jnb	.L36
	movzbl	(%rsi,%rbx), %ecx
	testb	%cl, %cl
	je	.L37
	cmpb	$10, %cl
	je	.L38
	cmpb	$9, %cl
	je	.L39
	cmpb	$13, %cl
	je	.L40
	movsbl	%cl, %ecx
	movq	%rdi, %rdx
	call	fputc
	jmp	.L28
.L38:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%r13, %rcx
	call	fwrite
	jmp	.L28
.L39:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC15(%rip), %rcx
	call	fwrite
	jmp	.L28
.L40:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%r15, %rcx
	call	fwrite
	jmp	.L28
.L36:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC17(%rip), %rcx
	call	fwrite
	movl	$0, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L15
.L33:
	cmpl	$7, 24(%rbx)
	ja	.L16
	movl	24(%rbx), %eax
	movslq	(%r12,%rax,4), %rax
	addq	%r12, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L18:
	.long	.L25-.L18
	.long	.L24-.L18
	.long	.L23-.L18
	.long	.L22-.L18
	.long	.L21-.L18
	.long	.L20-.L18
	.long	.L19-.L18
	.long	.L17-.L18
	.text
	.globl	output_ast
	.def	output_ast;	.scl	2;	.type	32;	.endef
output_ast:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rcx
	movq	%r8, %rsi
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %rdx
	call	parse_code
	movq	%rax, %rcx
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%rbx, %rdx
	call	output_code
	call	get_info
	movq	%rax, %r8
	leaq	.LC18(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
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
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$48, %rsp
	movl	%edx, %r12d
	movl	%r8d, %ebp
	call	create_file
	movq	%rax, %rsi
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdi
	movq	$0, 40(%rsp)
	leaq	.LC19(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	testq	%rax, %rax
	je	.L51
	movq	%rax, %rbx
	leaq	40(%rsp), %rdx
	movq	%rax, %rcx
	call	read_source
	movq	%rax, %rdi
	movq	%rbx, %rcx
	call	fclose
	movq	40(%rsp), %rdx
	movq	%rdi, %rcx
	call	create_lexer
	movq	%rax, %rbx
	testb	%r12b, %r12b
	jne	.L52
.L46:
	movq	%rbx, %rcx
	call	reset_lexer
	call	create_parser
	movq	%rax, %rdi
	testb	%bpl, %bpl
	jne	.L53
.L43:
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L51:
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rdi, %r8
	leaq	.LC20(%rip), %rdx
	call	fprintf
	jmp	.L43
.L52:
	movl	$6, %edx
	leaq	.LC21(%rip), %rcx
	call	create_string
	movq	%rax, %rdx
	movq	%rsi, %rcx
	call	change_file_extension
	movq	%rsi, %rcx
	call	get_full_path
	movq	%rax, %r12
	leaq	.LC22(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L54
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	output_token
	movq	%rdi, %rcx
	call	fclose
	jmp	.L46
.L54:
	call	__getreent
	movq	24(%rax), %rcx
	movq	%r12, %r8
	leaq	.LC23(%rip), %rdx
	call	fprintf
	jmp	.L46
.L53:
	movl	$4, %edx
	leaq	.LC24(%rip), %rcx
	call	create_string
	movq	%rax, %rdx
	movq	%rsi, %rcx
	call	change_file_extension
	movq	%rsi, %rcx
	call	get_full_path
	movq	%rax, %rbp
	leaq	.LC22(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L55
	movq	%rdi, %r8
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	output_ast
	movq	%rsi, %rcx
	call	fclose
	jmp	.L43
.L55:
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rbp, %r8
	leaq	.LC23(%rip), %rdx
	call	fprintf
	jmp	.L43
	.ident	"GCC: (GNU) 13.2.0"
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	snprintf;	.scl	2;	.type	32;	.endef
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	ftell;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	get_info;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
	.def	parse_code;	.scl	2;	.type	32;	.endef
	.def	output_code;	.scl	2;	.type	32;	.endef
	.def	create_file;	.scl	2;	.type	32;	.endef
	.def	get_full_path;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	create_lexer;	.scl	2;	.type	32;	.endef
	.def	reset_lexer;	.scl	2;	.type	32;	.endef
	.def	create_parser;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.builtin_scope, "dr"
	.globl	.refptr.builtin_scope
	.linkonce	discard
.refptr.builtin_scope:
	.quad	builtin_scope
