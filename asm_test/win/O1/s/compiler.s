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
	leaq	.LC0(%rip), %rcx
	call	create_string_not_check
	movq	%rax, %rbx
	movq	%rdi, %r9
	movq	(%rsi), %r8
	movl	$1, %edx
	movq	%rax, %rcx
	call	fread
	movb	$0, (%rbx,%rax)
	movq	%rax, (%rsi)
	testq	%rax, %rax
	je	.L1
	movl	$0, %eax
	jmp	.L4
.L3:
	addq	$1, %rax
	cmpq	(%rsi), %rax
	jnb	.L1
.L4:
	movzbl	(%rbx,%rax), %edx
	andl	$-5, %edx
	cmpb	$9, %dl
	jne	.L3
	movb	$32, (%rbx,%rax)
	jmp	.L3
.L1:
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
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
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rdi
	movq	%rdx, %rsi
	cmpl	$7, 24(%rdx)
	ja	.L8
	movl	24(%rdx), %eax
	leaq	.L10(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L10:
	.long	.L17-.L10
	.long	.L16-.L10
	.long	.L15-.L10
	.long	.L14-.L10
	.long	.L13-.L10
	.long	.L12-.L10
	.long	.L11-.L10
	.long	.L9-.L10
	.text
.L17:
	movq	16(%rsi), %rdx
	movq	8(%rsi), %rax
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC1(%rip), %rdx
	call	fprintf
	jmp	.L7
.L16:
	movq	16(%rsi), %rdx
	movq	8(%rsi), %rax
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC2(%rip), %rdx
	call	fprintf
.L8:
	movl	$0, %ebx
	leaq	.LC12(%rip), %r12
	leaq	.LC10(%rip), %r13
	leaq	.LC9(%rip), %rbp
	jmp	.L19
.L15:
	movq	16(%rsi), %rdx
	movq	8(%rsi), %rax
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC3(%rip), %rdx
	call	fprintf
	jmp	.L8
.L14:
	movq	16(%rsi), %rdx
	movq	8(%rsi), %rax
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC4(%rip), %rdx
	call	fprintf
	jmp	.L8
.L13:
	movq	16(%rsi), %rdx
	movq	8(%rsi), %rax
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC5(%rip), %rdx
	call	fprintf
	jmp	.L8
.L12:
	movq	16(%rsi), %rdx
	movq	8(%rsi), %rax
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC6(%rip), %rdx
	call	fprintf
	jmp	.L8
.L11:
	movq	16(%rsi), %rdx
	movq	8(%rsi), %rax
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC7(%rip), %rdx
	call	fprintf
	jmp	.L8
.L9:
	movq	16(%rsi), %rdx
	movq	8(%rsi), %rax
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC8(%rip), %rdx
	call	fprintf
	jmp	.L8
.L28:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%rbp, %rcx
	call	fwrite
.L21:
	addq	$1, %rbx
.L19:
	movq	(%rsi), %r14
	movq	%r14, %rcx
	call	strlen
	cmpq	%rax, %rbx
	jnb	.L27
	movzbl	(%r14,%rbx), %ecx
	testb	%cl, %cl
	je	.L28
	cmpb	$10, %cl
	je	.L29
	cmpb	$9, %cl
	je	.L30
	cmpb	$13, %cl
	je	.L31
	movsbl	%cl, %ecx
	movq	%rdi, %rdx
	call	fputc
	jmp	.L21
.L29:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%r13, %rcx
	call	fwrite
	jmp	.L21
.L30:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rcx
	call	fwrite
	jmp	.L21
.L31:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%r12, %rcx
	call	fwrite
	jmp	.L21
.L27:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC13(%rip), %rcx
	call	fwrite
.L7:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.section .rdata,"dr"
.LC14:
	.ascii "\12info by lib:\12    %s\12\0"
	.text
	.globl	output_token
	.def	output_token;	.scl	2;	.type	32;	.endef
output_token:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	movl	$0, %edx
	movq	%rdi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L33
.L34:
	movq	%rbx, %rdx
	movq	%rsi, %rcx
	call	output_one_token
	cmpl	$0, 24(%rbx)
	je	.L33
	movl	$0, %edx
	movq	%rdi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L34
.L33:
	call	get_info
	movq	%rax, %r8
	leaq	.LC14(%rip), %rdx
	movq	%rsi, %rcx
	call	fprintf
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.globl	output_ast
	.def	output_ast;	.scl	2;	.type	32;	.endef
output_ast:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	andq	$-16, %rsp
	subq	$64, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rcx
	leaq	32(%rsp), %r9
	movl	$0, %r8d
	movq	%rbx, %rdx
	call	output_code
	call	get_info
	movq	%rax, %r8
	leaq	.LC14(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	movq	-8(%rbp), %rbx
	leave
	ret
	.globl	output_tac
	.def	output_tac;	.scl	2;	.type	32;	.endef
output_tac:
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rcx
	movl	$0, %r8d
	movq	%rbx, %rdx
	call	output_TAC
	call	get_info
	movq	%rax, %r8
	leaq	.LC14(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	addq	$32, %rsp
	popq	%rbx
	ret
	.section .rdata,"dr"
.LC15:
	.ascii "r\0"
.LC16:
	.ascii "Error opening file: %s\12\0"
.LC17:
	.ascii ".token\0"
.LC18:
	.ascii "w\0"
.LC19:
	.ascii ".ast\0"
.LC20:
	.ascii ".tc\0"
.LC21:
	.ascii ".tac\0"
	.text
	.globl	parse_file
	.def	parse_file;	.scl	2;	.type	32;	.endef
parse_file:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$48, %rsp
	movl	%edx, %r13d
	movl	%r8d, %r12d
	movl	%r9d, %ebp
	call	create_file
	movq	%rax, %rbx
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdi
	movq	$0, 40(%rsp)
	leaq	.LC15(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	testq	%rax, %rax
	je	.L51
	movq	%rax, %rsi
	leaq	40(%rsp), %rdx
	movq	%rax, %rcx
	call	read_source
	movq	%rax, %r14
	movq	%rsi, %rcx
	call	fclose
	movq	%rdi, %r8
	movq	40(%rsp), %rdx
	movq	%r14, %rcx
	call	create_lexer
	movq	%rax, %rsi
	testb	%r13b, %r13b
	jne	.L52
.L44:
	movq	%rsi, %rcx
	call	reset_lexer
	movq	%rbx, %rcx
	call	create_parser
	movl	%ebp, %edi
	orb	%r12b, %dil
	jne	.L53
.L41:
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L51:
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rdi, %r8
	leaq	.LC16(%rip), %rdx
	call	fprintf
	jmp	.L41
.L52:
	movl	$6, %edx
	leaq	.LC17(%rip), %rcx
	call	create_string
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	change_file_extension
	movq	%rbx, %rcx
	call	get_full_path
	movq	%rax, %r13
	leaq	.LC18(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L54
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	output_token
	movq	%rdi, %rcx
	call	fclose
	jmp	.L44
.L54:
	call	__getreent
	movq	24(%rax), %rcx
	movq	%r13, %r8
	leaq	.LC16(%rip), %rdx
	call	fprintf
	jmp	.L44
.L53:
	movq	.refptr.builtin_scope(%rip), %rdx
	movq	(%rdx), %rdx
	movq	%rax, %r8
	movq	%rsi, %rcx
	call	parse_code
	movq	%rax, %rdi
	testb	%r12b, %r12b
	jne	.L55
.L47:
	testb	%bpl, %bpl
	je	.L41
	movl	$4, %edx
	leaq	.LC21(%rip), %rcx
	call	create_string
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	change_file_extension
	movq	%rbx, %rcx
	call	get_full_path
	movq	%rax, %rsi
	movl	$3, %edx
	leaq	.LC20(%rip), %rcx
	call	create_string
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	change_file_extension
	leaq	.LC18(%rip), %rdx
	movq	%rsi, %rcx
	call	fopen
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L56
	movq	%rdi, %rcx
	call	tac_code
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	output_tac
	movq	%rbx, %rcx
	call	fclose
	jmp	.L41
.L55:
	movl	$4, %edx
	leaq	.LC19(%rip), %rcx
	call	create_string
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	change_file_extension
	movq	%rbx, %rcx
	call	get_full_path
	movq	%rax, %r12
	movl	$3, %edx
	leaq	.LC20(%rip), %rcx
	call	create_string
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	change_file_extension
	leaq	.LC18(%rip), %rdx
	movq	%r12, %rcx
	call	fopen
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L57
	movq	%rdi, %rdx
	movq	%rax, %rcx
	call	output_ast
	movq	%rsi, %rcx
	call	fclose
	jmp	.L47
.L57:
	call	__getreent
	movq	24(%rax), %rcx
	movq	%r12, %r8
	leaq	.LC16(%rip), %rdx
	call	fprintf
	jmp	.L47
.L56:
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rsi, %r8
	leaq	.LC16(%rip), %rdx
	call	fprintf
	jmp	.L41
	.ident	"GCC: (GNU) 13.2.0"
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	ftell;	.scl	2;	.type	32;	.endef
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	get_info;	.scl	2;	.type	32;	.endef
	.def	output_code;	.scl	2;	.type	32;	.endef
	.def	output_TAC;	.scl	2;	.type	32;	.endef
	.def	create_file;	.scl	2;	.type	32;	.endef
	.def	get_full_path;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	create_lexer;	.scl	2;	.type	32;	.endef
	.def	reset_lexer;	.scl	2;	.type	32;	.endef
	.def	create_parser;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
	.def	parse_code;	.scl	2;	.type	32;	.endef
	.def	tac_code;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.builtin_scope, "dr"
	.globl	.refptr.builtin_scope
	.linkonce	discard
.refptr.builtin_scope:
	.quad	builtin_scope
