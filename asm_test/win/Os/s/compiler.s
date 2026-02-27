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
	movq	%rcx, %rbp
	movq	%r8, %rcx
	pushq	%rdi
	movq	%r9, %rdi
	pushq	%rsi
	pushq	%rbx
	movq	%r8, %rbx
	subq	$72, %rsp
	movq	%rdx, 56(%rsp)
	call	strlen
	movq	%rdi, %rcx
	movq	%rax, %rsi
	call	strlen
	movq	56(%rsp), %rdx
	leaq	(%rsi,%rax), %rcx
	cmpq	%rdx, %rcx
	jb	.L2
	movq	%rdi, 40(%rsp)
	leaq	-1(%rdx), %r9
	movq	%rbp, %rcx
	leaq	.LC0(%rip), %r8
	movq	%rbx, 32(%rsp)
	subl	%eax, %r9d
	call	snprintf
	jmp	.L1
.L2:
	cmpq	%rbp, %rbx
	jne	.L4
	addq	$72, %rsp
	leaq	(%rbx,%rsi), %rcx
	subq	%rsi, %rdx
	movq	%rdi, %r9
	popq	%rbx
	leaq	.LC1(%rip), %r8
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	snprintf
.L4:
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC2(%rip), %r8
	movq	%rbp, %rcx
	call	snprintf
.L1:
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC3:
	.ascii "\0"
	.text
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
	movq	%rdi, %r9
	movl	$1, %edx
	movq	%rax, %rcx
	movq	%rax, %rbx
	call	fread
	movb	$0, (%rbx,%rax)
	movq	%rax, (%rsi)
	xorl	%eax, %eax
.L8:
	cmpq	(%rsi), %rax
	jnb	.L12
	movb	(%rbx,%rax), %dl
	andl	$-5, %edx
	cmpb	$9, %dl
	jne	.L9
	movb	$32, (%rbx,%rax)
.L9:
	incq	%rax
	jmp	.L8
.L12:
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.section .rdata,"dr"
.LC4:
	.ascii "Token(Type: EOF,         Line: %zu, Column: %zu)\12\0"
.LC5:
	.ascii "Token(Type: identifier,  Line: \0"
.LC6:
	.ascii "Token(Type: integer,     Line: \0"
.LC7:
	.ascii "Token(Type: float,       Line: \0"
.LC8:
	.ascii "Token(Type: string,      Line: \0"
.LC9:
	.ascii "Token(Type: symbol,      Line: \0"
.LC10:
	.ascii "Token(Type: keyword,     Line: \0"
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
	leaq	.LC16(%rip), %r13
	pushq	%r12
	pushq	%rbp
	leaq	.L17(%rip), %rbp
	pushq	%rdi
	movq	%rdx, %rdi
	xorl	%edx, %edx
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	movq	%rdi, %rcx
	subq	$40, %rsp
	call	get_next_token
	movq	%rax, %rsi
.L14:
	testq	%rsi, %rsi
	je	.L25
	cmpl	$7, 24(%rsi)
	ja	.L15
	movl	24(%rsi), %eax
	movslq	0(%rbp,%rax,4), %rax
	addq	%rbp, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L17:
	.long	.L24-.L17
	.long	.L23-.L17
	.long	.L22-.L17
	.long	.L21-.L17
	.long	.L20-.L17
	.long	.L19-.L17
	.long	.L18-.L17
	.long	.L16-.L17
	.text
.L24:
	movq	16(%rsi), %rdx
	movq	8(%rsi), %rax
	movq	%rbx, %rcx
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC4(%rip), %rdx
	call	fprintf
	jmp	.L25
.L23:
	movq	%rbx, %rdx
	leaq	.LC5(%rip), %rcx
	jmp	.L35
.L22:
	movq	%rbx, %rdx
	leaq	.LC6(%rip), %rcx
	jmp	.L35
.L21:
	movq	%rbx, %rdx
	leaq	.LC7(%rip), %rcx
	jmp	.L35
.L20:
	movq	%rbx, %rdx
	leaq	.LC8(%rip), %rcx
	jmp	.L35
.L19:
	movq	%rbx, %rdx
	leaq	.LC9(%rip), %rcx
	jmp	.L35
.L18:
	movq	%rbx, %rdx
	leaq	.LC10(%rip), %rcx
	jmp	.L35
.L16:
	movq	%rbx, %rdx
	leaq	.LC11(%rip), %rcx
.L35:
	call	fputs
.L15:
	movq	16(%rsi), %rdx
	movq	8(%rsi), %rax
	movq	%rbx, %rcx
	leaq	.LC14(%rip), %r14
	leaq	.LC13(%rip), %r15
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC12(%rip), %rdx
	call	fprintf
	movq	(%rsi), %r12
	xorl	%esi, %esi
.L26:
	movq	%r12, %rcx
	call	strlen
	cmpq	%rax, %rsi
	jnb	.L37
	movsbl	(%r12,%rsi), %ecx
	movq	%rbx, %rdx
	testb	%cl, %cl
	jne	.L27
	movq	%r15, %rcx
	jmp	.L36
.L27:
	cmpb	$10, %cl
	jne	.L29
	movq	%r14, %rcx
.L36:
	call	fputs
	jmp	.L28
.L29:
	cmpb	$9, %cl
	jne	.L30
	leaq	.LC15(%rip), %rcx
	jmp	.L36
.L30:
	cmpb	$13, %cl
	jne	.L31
	movq	%r13, %rcx
	jmp	.L36
.L31:
	call	fputc
.L28:
	incq	%rsi
	jmp	.L26
.L37:
	movq	%rbx, %rdx
	leaq	.LC17(%rip), %rcx
	call	fputs
	xorl	%edx, %edx
	movq	%rdi, %rcx
	call	get_next_token
	movq	%rax, %rsi
	jmp	.L14
.L25:
	call	get_info
	addq	$40, %rsp
	movq	%rbx, %rcx
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
	.globl	output_ast
	.def	output_ast;	.scl	2;	.type	32;	.endef
output_ast:
	pushq	%rbx
	movq	%rcx, %rbx
	movq	%rdx, %rcx
	subq	$48, %rsp
	movq	.refptr.builtin_scope(%rip), %rax
	movq	%r8, 40(%rsp)
	movq	(%rax), %rdx
	call	parse_code
	movq	40(%rsp), %r9
	movq	%rbx, %rdx
	xorl	%r8d, %r8d
	movq	%rax, %rcx
	call	output_code
	call	get_info
	addq	$48, %rsp
	movq	%rbx, %rcx
	leaq	.LC18(%rip), %rdx
	movq	%rax, %r8
	popq	%rbx
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
	.globl	parse_file
	.def	parse_file;	.scl	2;	.type	32;	.endef
parse_file:
	pushq	%r12
	movl	%r8d, %r12d
	pushq	%rbp
	movl	%edx, %ebp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$64, %rsp
	call	create_file
	movq	%rax, %rcx
	movq	%rax, %rbx
	call	get_full_path
	xorl	%edx, %edx
	movq	%rdx, 56(%rsp)
	movq	%rax, %rcx
	leaq	.LC19(%rip), %rdx
	movq	%rax, %rdi
	call	fopen
	testq	%rax, %rax
	jne	.L41
	call	__getreent
	movq	%rdi, %r8
	leaq	.LC20(%rip), %rdx
	movq	24(%rax), %rcx
	jmp	.L47
.L41:
	movq	%rax, %rsi
	leaq	56(%rsp), %rdx
	movq	%rax, %rcx
	call	read_source
	movq	%rsi, %rcx
	movq	%rax, %rdi
	call	fclose
	movq	56(%rsp), %rdx
	movq	%rdi, %rcx
	call	create_lexer
	movq	%rax, %rsi
	testb	%bpl, %bpl
	je	.L42
	movl	$6, %edx
	leaq	.LC21(%rip), %rcx
	call	create_string
	movq	%rbx, %rcx
	movq	%rax, %rdx
	call	change_file_extension
	movq	%rbx, %rcx
	call	get_full_path
	leaq	.LC22(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rbp
	call	fopen
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L43
	call	__getreent
	movq	%rbp, %r8
	leaq	.LC23(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L42
.L43:
	movq	%rax, %rcx
	movq	%rsi, %rdx
	call	output_token
	movq	%rdi, %rcx
	call	fclose
.L42:
	movq	%rsi, %rcx
	call	reset_lexer
	call	create_parser
	testb	%r12b, %r12b
	je	.L40
	movl	$4, %edx
	leaq	.LC24(%rip), %rcx
	movq	%rax, 40(%rsp)
	call	create_string
	movq	%rbx, %rcx
	movq	%rax, %rdx
	call	change_file_extension
	movq	%rbx, %rcx
	call	get_full_path
	leaq	.LC22(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rdi
	call	fopen
	movq	40(%rsp), %r8
	testq	%rax, %rax
	movq	%rax, %rbx
	jne	.L45
	call	__getreent
	movq	%rdi, %r8
	leaq	.LC23(%rip), %rdx
	movq	24(%rax), %rcx
.L47:
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	fprintf
.L45:
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	output_ast
	addq	$64, %rsp
	movq	%rbx, %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	fclose
.L40:
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
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
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
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
