	.file	"compiler.c"
	.text
	.section .rdata,"dr"
.LC0:
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
	leaq	.LC0(%rip), %rcx
	leaq	1(%rax), %rdx
	call	create_string_not_check
	movq	(%rsi), %r8
	movq	%rdi, %r9
	movl	$1, %edx
	movq	%rax, %rcx
	movq	%rax, %rbx
	call	fread
	movb	$0, (%rbx,%rax)
	movq	%rax, (%rsi)
	xorl	%eax, %eax
.L2:
	cmpq	(%rsi), %rax
	jnb	.L7
	movb	(%rbx,%rax), %dl
	andl	$-5, %edx
	cmpb	$9, %dl
	jne	.L3
	movb	$32, (%rbx,%rax)
.L3:
	incq	%rax
	jmp	.L2
.L7:
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.section .rdata,"dr"
.LC1:
	.ascii "Token(Type: EOF,         Line: %zu, Column: %zu)\12\0"
.LC2:
	.ascii "Token(Type: identifier,  Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC3:
	.ascii "Token(Type: integer,     Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC4:
	.ascii "Token(Type: float,       Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC5:
	.ascii "Token(Type: string,      Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC6:
	.ascii "Token(Type: symbol,      Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC7:
	.ascii "Token(Type: keyword,     Line: %zu, Column: %zu)\11Lexeme: '\0"
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
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$32, %rsp
	cmpl	$7, 24(%rdx)
	ja	.L9
	movl	24(%rdx), %edx
	leaq	.L11(%rip), %rax
	movslq	(%rax,%rdx,4), %rcx
	movq	16(%rsi), %rdx
	addq	%rax, %rcx
	movq	8(%rsi), %rax
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	jmp	*%rcx
	.section .rdata,"dr"
	.align 4
.L11:
	.long	.L18-.L11
	.long	.L17-.L11
	.long	.L16-.L11
	.long	.L15-.L11
	.long	.L14-.L11
	.long	.L13-.L11
	.long	.L12-.L11
	.long	.L10-.L11
	.text
.L18:
	addq	$32, %rsp
	movq	%rbx, %rcx
	leaq	.LC1(%rip), %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	fprintf
.L17:
	leaq	.LC2(%rip), %rdx
	jmp	.L27
.L16:
	leaq	.LC3(%rip), %rdx
.L27:
	movq	%rbx, %rcx
	call	fprintf
.L9:
	xorl	%edi, %edi
	leaq	.LC12(%rip), %rbp
	leaq	.LC10(%rip), %r12
	leaq	.LC9(%rip), %r13
	jmp	.L19
.L15:
	leaq	.LC4(%rip), %rdx
	jmp	.L27
.L14:
	leaq	.LC5(%rip), %rdx
	jmp	.L27
.L13:
	leaq	.LC6(%rip), %rdx
	jmp	.L27
.L12:
	leaq	.LC7(%rip), %rdx
	jmp	.L27
.L10:
	leaq	.LC8(%rip), %rdx
	jmp	.L27
.L25:
	movsbl	(%r14,%rdi), %ecx
	movq	%rbx, %rdx
	testb	%cl, %cl
	jne	.L20
	movq	%r13, %rcx
.L28:
	call	fputs
.L21:
	incq	%rdi
.L19:
	movq	(%rsi), %r14
	movq	%r14, %rcx
	call	strlen
	cmpq	%rax, %rdi
	jb	.L25
	jmp	.L29
.L20:
	cmpb	$10, %cl
	jne	.L22
	movq	%r12, %rcx
	jmp	.L28
.L22:
	cmpb	$9, %cl
	jne	.L23
	leaq	.LC11(%rip), %rcx
	jmp	.L28
.L23:
	cmpb	$13, %cl
	jne	.L24
	movq	%rbp, %rcx
	jmp	.L28
.L24:
	call	fputc
	jmp	.L21
.L29:
	addq	$32, %rsp
	movq	%rbx, %rdx
	leaq	.LC13(%rip), %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	fputs
	.section .rdata,"dr"
.LC14:
	.ascii "\12info by lib:\12    %s\12\0"
	.text
	.globl	output_token
	.def	output_token;	.scl	2;	.type	32;	.endef
output_token:
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	subq	$32, %rsp
.L32:
	xorl	%edx, %edx
	movq	%rdi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L34
	movq	%rbx, %rdx
	movq	%rsi, %rcx
	call	output_one_token
	cmpl	$0, 24(%rbx)
	jne	.L32
.L34:
	call	get_info
	addq	$32, %rsp
	movq	%rsi, %rcx
	leaq	.LC14(%rip), %rdx
	popq	%rbx
	movq	%rax, %r8
	popq	%rsi
	popq	%rdi
	jmp	fprintf
	.globl	output_ast
	.def	output_ast;	.scl	2;	.type	32;	.endef
output_ast:
	pushq	%rbx
	movq	%rcx, %rbx
	xorl	%r8d, %r8d
	movq	%rdx, %rcx
	movq	%rbx, %rdx
	subq	$64, %rsp
	leaq	32(%rsp), %r9
	call	output_code
	call	get_info
	movq	%rbx, %rcx
	leaq	.LC14(%rip), %rdx
	movq	%rax, %r8
	call	fprintf
	addq	$64, %rsp
	popq	%rbx
	ret
	.globl	output_tac
	.def	output_tac;	.scl	2;	.type	32;	.endef
output_tac:
	pushq	%rbx
	movq	%rcx, %rbx
	xorl	%r8d, %r8d
	movq	%rdx, %rcx
	movq	%rbx, %rdx
	subq	$32, %rsp
	call	output_TAC
	call	get_info
	addq	$32, %rsp
	movq	%rbx, %rcx
	leaq	.LC14(%rip), %rdx
	movq	%rax, %r8
	popq	%rbx
	jmp	fprintf
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
.LC22:
	.ascii ".tac\0"
	.text
	.globl	parse_file
	.def	parse_file;	.scl	2;	.type	32;	.endef
parse_file:
	pushq	%r13
	movl	%edx, %r13d
	pushq	%r12
	movl	%r8d, %r12d
	pushq	%rbp
	movl	%r9d, %ebp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	call	create_file
	movq	%rax, %rcx
	movq	%rax, %rbx
	call	get_full_path
	xorl	%edx, %edx
	movq	%rdx, 40(%rsp)
	movq	%rax, %rcx
	leaq	.LC15(%rip), %rdx
	movq	%rax, %rdi
	call	fopen
	testq	%rax, %rax
	jne	.L41
	call	__getreent
	movq	%rdi, %r8
	leaq	.LC16(%rip), %rdx
	movq	24(%rax), %rcx
	jmp	.L51
.L41:
	movq	%rax, %rsi
	leaq	40(%rsp), %rdx
	movq	%rax, %rcx
	call	read_source
	movq	%rsi, %rcx
	movq	%rax, %rdi
	call	fclose
	movq	40(%rsp), %rdx
	movq	%rdi, %rcx
	call	create_lexer
	movq	%rax, %rsi
	testb	%r13b, %r13b
	je	.L42
	movl	$6, %edx
	leaq	.LC17(%rip), %rcx
	call	create_string
	movq	%rbx, %rcx
	movq	%rax, %rdx
	call	change_file_extension
	movq	%rbx, %rcx
	call	get_full_path
	leaq	.LC18(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	fopen
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L43
	call	__getreent
	movq	%r13, %r8
	leaq	.LC19(%rip), %rdx
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
	movq	%rbx, %rcx
	call	create_parser
	movq	%rax, %r8
	movl	%ebp, %eax
	orb	%r12b, %al
	je	.L40
	movq	.refptr.builtin_scope(%rip), %rax
	movq	%rsi, %rcx
	movq	(%rax), %rdx
	call	parse_code
	movq	%rax, %rdi
	testb	%r12b, %r12b
	je	.L46
	movl	$4, %edx
	leaq	.LC20(%rip), %rcx
	call	create_string
	movq	%rbx, %rcx
	movq	%rax, %rdx
	call	change_file_extension
	movq	%rbx, %rcx
	call	get_full_path
	movl	$3, %edx
	leaq	.LC21(%rip), %rcx
	movq	%rax, %r12
	call	create_string
	movq	%rbx, %rcx
	movq	%rax, %rdx
	call	change_file_extension
	leaq	.LC18(%rip), %rdx
	movq	%r12, %rcx
	call	fopen
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L47
	call	__getreent
	movq	%r12, %r8
	leaq	.LC19(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L46
.L47:
	movq	%rax, %rcx
	movq	%rdi, %rdx
	call	output_ast
	movq	%rsi, %rcx
	call	fclose
.L46:
	testb	%bpl, %bpl
	je	.L40
	movl	$4, %edx
	leaq	.LC22(%rip), %rcx
	call	create_string
	movq	%rbx, %rcx
	movq	%rax, %rdx
	call	change_file_extension
	movq	%rbx, %rcx
	call	get_full_path
	movl	$3, %edx
	leaq	.LC21(%rip), %rcx
	movq	%rax, %rsi
	call	create_string
	movq	%rbx, %rcx
	movq	%rax, %rdx
	call	change_file_extension
	leaq	.LC18(%rip), %rdx
	movq	%rsi, %rcx
	call	fopen
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L49
	call	__getreent
	movq	%rsi, %r8
	leaq	.LC19(%rip), %rdx
	movq	24(%rax), %rcx
.L51:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	fprintf
.L49:
	movq	%rdi, %rcx
	call	tac_code
	movq	%rbx, %rcx
	movq	%rax, %rdx
	call	output_tac
	addq	$56, %rsp
	movq	%rbx, %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	fclose
.L40:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.ident	"GCC: (GNU) 13.2.0"
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	ftell;	.scl	2;	.type	32;	.endef
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	get_info;	.scl	2;	.type	32;	.endef
	.def	output_code;	.scl	2;	.type	32;	.endef
	.def	output_TAC;	.scl	2;	.type	32;	.endef
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
	.def	parse_code;	.scl	2;	.type	32;	.endef
	.def	tac_code;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.builtin_scope, "dr"
	.globl	.refptr.builtin_scope
	.linkonce	discard
.refptr.builtin_scope:
	.quad	builtin_scope
