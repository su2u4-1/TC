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
	.p2align 4
	.globl	string_append
	.def	string_append;	.scl	2;	.type	32;	.endef
string_append:
	pushq	%r12
	pushq	%rbp
	movq	%rcx, %rbp
	movq	%r8, %rcx
	pushq	%rdi
	movq	%r9, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movq	%r8, %rbx
	subq	$48, %rsp
	call	strlen
	movq	%rdi, %rcx
	movq	%rax, %r12
	call	strlen
	leaq	(%r12,%rax), %rdx
	cmpq	%rsi, %rdx
	jnb	.L7
	cmpq	%rbp, %rbx
	je	.L8
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rsi, %rdx
	movq	%rbp, %rcx
	leaq	.LC2(%rip), %r8
	call	snprintf
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L8:
	addq	$48, %rsp
	subq	%r12, %rsi
	leaq	(%rbx,%r12), %rcx
	movq	%rdi, %r9
	popq	%rbx
	movq	%rsi, %rdx
	leaq	.LC1(%rip), %r8
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	snprintf
	.p2align 4,,10
	.p2align 3
.L7:
	movq	%rdi, 40(%rsp)
	leaq	-1(%rsi), %r9
	movq	%rsi, %rdx
	movq	%rbp, %rcx
	movq	%rbx, 32(%rsp)
	subl	%eax, %r9d
	leaq	.LC0(%rip), %r8
	call	snprintf
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.section .rdata,"dr"
.LC3:
	.ascii "\0"
	.text
	.p2align 4
	.globl	read_source
	.def	read_source;	.scl	2;	.type	32;	.endef
read_source:
	pushq	%rdi
	movl	$2, %r8d
	movq	%rcx, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	xorl	%edx, %edx
	pushq	%rbx
	subq	$32, %rsp
	call	fseek
	movq	%rdi, %rcx
	call	ftell
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rdi, %rcx
	movq	%rax, (%rsi)
	call	fseek
	movq	(%rsi), %rax
	leaq	.LC3(%rip), %rcx
	leaq	1(%rax), %rdx
	call	create_string
	movq	(%rsi), %r8
	movl	$1, %edx
	movq	%rdi, %r9
	movq	%rax, %rcx
	movq	%rax, %rbx
	call	fread
	xorl	%edx, %edx
	movb	$0, (%rbx,%rax)
	movq	%rax, (%rsi)
	testq	%rax, %rax
	je	.L9
	.p2align 4,,10
	.p2align 3
.L10:
	movzbl	(%rbx,%rdx), %ecx
	andl	$-5, %ecx
	cmpb	$9, %cl
	jne	.L11
	movb	$32, (%rbx,%rdx)
	movq	(%rsi), %rax
	addq	$1, %rdx
	cmpq	%rax, %rdx
	jb	.L10
.L9:
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L11:
	addq	$1, %rdx
	cmpq	%rax, %rdx
	jb	.L10
	addq	$32, %rsp
	movq	%rbx, %rax
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
	.p2align 4
	.globl	output_token
	.def	output_token;	.scl	2;	.type	32;	.endef
output_token:
	pushq	%r15
	pushq	%r14
	movq	%rdx, %r14
	xorl	%edx, %edx
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	movq	%rcx, %rdi
	movq	%r14, %rcx
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	call	get_next_token
	testq	%rax, %rax
	je	.L29
	movq	%rax, %rbx
	leaq	.L21(%rip), %r12
	leaq	.LC16(%rip), %r15
	.p2align 4,,10
	.p2align 3
.L37:
	cmpl	$7, 24(%rbx)
	ja	.L19
	movl	24(%rbx), %eax
	movslq	(%r12,%rax,4), %rax
	addq	%r12, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L21:
	.long	.L28-.L21
	.long	.L27-.L21
	.long	.L26-.L21
	.long	.L25-.L21
	.long	.L24-.L21
	.long	.L23-.L21
	.long	.L22-.L21
	.long	.L20-.L21
	.text
	.p2align 4,,10
	.p2align 3
.L22:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC10(%rip), %rcx
	call	fwrite
	.p2align 4,,10
	.p2align 3
.L19:
	movq	16(%rbx), %rdx
	movq	8(%rbx), %rax
	movq	%rdi, %rcx
	leaq	.LC14(%rip), %r13
	leaq	.LC13(%rip), %rbp
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC12(%rip), %rdx
	call	fprintf
	movq	(%rbx), %rsi
	xorl	%ebx, %ebx
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L31:
	cmpb	$10, %cl
	je	.L43
	cmpb	$9, %cl
	je	.L44
	cmpb	$13, %cl
	je	.L45
	movq	%rdi, %rdx
	call	fputc
.L32:
	addq	$1, %rbx
.L30:
	movq	%rsi, %rcx
	call	strlen
	cmpq	%rax, %rbx
	jnb	.L46
	movsbl	(%rsi,%rbx), %ecx
	testb	%cl, %cl
	jne	.L31
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%rbp, %rcx
	call	fwrite
	jmp	.L32
	.p2align 4,,10
	.p2align 3
.L23:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC9(%rip), %rcx
	call	fwrite
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L24:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC8(%rip), %rcx
	call	fwrite
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L25:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rcx
	call	fwrite
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L28:
	movq	16(%rbx), %rdx
	movq	8(%rbx), %rax
	movq	%rdi, %rcx
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC4(%rip), %rdx
	call	fprintf
.L29:
	call	get_info
	addq	$40, %rsp
	movq	%rdi, %rcx
	leaq	.LC18(%rip), %rdx
	popq	%rbx
	movq	%rax, %r8
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L20:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rcx
	call	fwrite
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L26:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC6(%rip), %rcx
	call	fwrite
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L27:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rcx
	call	fwrite
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L45:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%r15, %rcx
	call	fwrite
	jmp	.L32
	.p2align 4,,10
	.p2align 3
.L43:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%r13, %rcx
	call	fwrite
	jmp	.L32
	.p2align 4,,10
	.p2align 3
.L46:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC17(%rip), %rcx
	call	fwrite
	xorl	%edx, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L37
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L44:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC15(%rip), %rcx
	call	fwrite
	jmp	.L32
	.p2align 4
	.globl	output_ast
	.def	output_ast;	.scl	2;	.type	32;	.endef
output_ast:
	pushq	%rsi
	movq	%r8, %rsi
	pushq	%rbx
	movq	%rcx, %rbx
	movq	%rdx, %rcx
	subq	$40, %rsp
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %rdx
	call	parse_code
	movq	%rbx, %rdx
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rax, %rcx
	call	output_code
	call	get_info
	addq	$40, %rsp
	movq	%rbx, %rcx
	leaq	.LC18(%rip), %rdx
	popq	%rbx
	movq	%rax, %r8
	popq	%rsi
	jmp	fprintf
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
	.p2align 4
	.globl	parse_file
	.def	parse_file;	.scl	2;	.type	32;	.endef
parse_file:
	pushq	%r12
	movl	%edx, %r12d
	pushq	%rbp
	movl	%r8d, %ebp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$48, %rsp
	call	create_file
	movq	%rax, %rcx
	movq	%rax, %rsi
	call	get_full_path
	leaq	.LC19(%rip), %rdx
	movq	$0, 40(%rsp)
	movq	%rax, %rcx
	movq	%rax, %rdi
	call	fopen
	testq	%rax, %rax
	je	.L57
	movq	%rax, %rbx
	leaq	40(%rsp), %rdx
	movq	%rax, %rcx
	call	read_source
	movq	%rbx, %rcx
	movq	%rax, %rdi
	call	fclose
	movq	40(%rsp), %rdx
	movq	%rdi, %rcx
	call	create_lexer
	movq	%rax, %rbx
	testb	%r12b, %r12b
	jne	.L58
.L51:
	movq	%rbx, %rcx
	call	reset_lexer
	call	create_parser
	movq	%rax, %rdi
	testb	%bpl, %bpl
	jne	.L59
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L58:
	movl	$6, %edx
	leaq	.LC21(%rip), %rcx
	call	create_string
	movq	%rsi, %rcx
	movq	%rax, %rdx
	call	change_file_extension
	movq	%rsi, %rcx
	call	get_full_path
	leaq	.LC22(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	fopen
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L60
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	output_token
	movq	%rdi, %rcx
	call	fclose
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L59:
	movl	$4, %edx
	leaq	.LC24(%rip), %rcx
	call	create_string
	movq	%rsi, %rcx
	movq	%rax, %rdx
	call	change_file_extension
	movq	%rsi, %rcx
	call	get_full_path
	leaq	.LC22(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rbp
	call	fopen
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L61
	movq	.refptr.builtin_scope(%rip), %rax
	movq	%rdi, %r8
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	parse_code
	movq	%rdi, %r9
	movq	%rsi, %rdx
	xorl	%r8d, %r8d
	movq	%rax, %rcx
	call	output_code
	call	get_info
	movq	%rsi, %rcx
	leaq	.LC18(%rip), %rdx
	movq	%rax, %r8
	call	fprintf
	addq	$48, %rsp
	movq	%rsi, %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	fclose
	.p2align 4,,10
	.p2align 3
.L61:
	call	__getreent
	movq	%rbp, %r8
	leaq	.LC23(%rip), %rdx
	movq	24(%rax), %rcx
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L60:
	call	__getreent
	movq	%r12, %r8
	leaq	.LC23(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L57:
	call	__getreent
	movq	%rdi, %r8
	leaq	.LC20(%rip), %rdx
	movq	24(%rax), %rcx
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	fprintf
	.ident	"GCC: (GNU) 13.2.0"
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	snprintf;	.scl	2;	.type	32;	.endef
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	ftell;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
	.def	get_info;	.scl	2;	.type	32;	.endef
	.def	parse_code;	.scl	2;	.type	32;	.endef
	.def	output_code;	.scl	2;	.type	32;	.endef
	.def	create_file;	.scl	2;	.type	32;	.endef
	.def	get_full_path;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	create_lexer;	.scl	2;	.type	32;	.endef
	.def	reset_lexer;	.scl	2;	.type	32;	.endef
	.def	create_parser;	.scl	2;	.type	32;	.endef
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.builtin_scope, "dr"
	.globl	.refptr.builtin_scope
	.linkonce	discard
.refptr.builtin_scope:
	.quad	builtin_scope
