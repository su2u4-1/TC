	.file	"compiler.c"
	.text
	.section .rdata,"dr"
.LC0:
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
	testq	%rax, %rax
	je	.L1
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L4:
	movzbl	(%rbx,%rax), %edx
	andl	$-5, %edx
	cmpb	$9, %dl
	jne	.L3
	movb	$32, (%rbx,%rax)
.L3:
	addq	$1, %rax
	cmpq	(%rsi), %rax
	jb	.L4
.L1:
	addq	$32, %rsp
	movq	%rbx, %rax
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
	.p2align 4
	.globl	output_one_token
	.def	output_one_token;	.scl	2;	.type	32;	.endef
output_one_token:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	subq	$32, %rsp
	cmpl	$7, 24(%rdx)
	ja	.L12
	movl	24(%rdx), %eax
	leaq	.L14(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	movq	16(%rsi), %rdx
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L14:
	.long	.L21-.L14
	.long	.L20-.L14
	.long	.L19-.L14
	.long	.L18-.L14
	.long	.L17-.L14
	.long	.L16-.L14
	.long	.L15-.L14
	.long	.L13-.L14
	.text
	.p2align 4,,10
	.p2align 3
.L19:
	movq	8(%rsi), %rax
	leaq	1(%rdx), %r9
	leaq	.LC3(%rip), %rdx
	leaq	1(%rax), %r8
	call	fprintf
	.p2align 4,,10
	.p2align 3
.L12:
	xorl	%ebx, %ebx
	leaq	.LC12(%rip), %r12
	leaq	.LC10(%rip), %r13
	leaq	.LC9(%rip), %rbp
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L23:
	cmpb	$10, %cl
	je	.L30
	cmpb	$9, %cl
	je	.L31
	cmpb	$13, %cl
	je	.L32
	movq	%rdi, %rdx
	call	fputc
.L24:
	addq	$1, %rbx
.L22:
	movq	(%rsi), %r14
	movq	%r14, %rcx
	call	strlen
	cmpq	%rax, %rbx
	jnb	.L33
	movsbl	(%r14,%rbx), %ecx
	testb	%cl, %cl
	jne	.L23
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%rbp, %rcx
	call	fwrite
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L32:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%r12, %rcx
	call	fwrite
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L30:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%r13, %rcx
	call	fwrite
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L33:
	addq	$32, %rsp
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	popq	%rbx
	leaq	.LC13(%rip), %rcx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L31:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rcx
	call	fwrite
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L15:
	movq	8(%rsi), %rax
	leaq	1(%rdx), %r9
	leaq	.LC7(%rip), %rdx
	leaq	1(%rax), %r8
	call	fprintf
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L13:
	movq	8(%rsi), %rax
	leaq	1(%rdx), %r9
	leaq	.LC8(%rip), %rdx
	leaq	1(%rax), %r8
	call	fprintf
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L21:
	movq	8(%rsi), %rax
	addq	$32, %rsp
	leaq	1(%rdx), %r9
	leaq	.LC1(%rip), %rdx
	popq	%rbx
	popq	%rsi
	leaq	1(%rax), %r8
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L20:
	movq	8(%rsi), %rax
	leaq	1(%rdx), %r9
	leaq	.LC2(%rip), %rdx
	leaq	1(%rax), %r8
	call	fprintf
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L18:
	movq	8(%rsi), %rax
	leaq	1(%rdx), %r9
	leaq	.LC4(%rip), %rdx
	leaq	1(%rax), %r8
	call	fprintf
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L17:
	movq	8(%rsi), %rax
	leaq	1(%rdx), %r9
	leaq	.LC5(%rip), %rdx
	leaq	1(%rax), %r8
	call	fprintf
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L16:
	movq	8(%rsi), %rax
	leaq	1(%rdx), %r9
	leaq	.LC6(%rip), %rdx
	leaq	1(%rax), %r8
	call	fprintf
	jmp	.L12
	.section .rdata,"dr"
.LC14:
	.ascii "\12info by lib:\12    %s\12\0"
	.text
	.p2align 4
	.globl	output_token
	.def	output_token;	.scl	2;	.type	32;	.endef
output_token:
	pushq	%rdi
	movq	%rdx, %rdi
	xorl	%edx, %edx
	pushq	%rsi
	movq	%rcx, %rsi
	movq	%rdi, %rcx
	pushq	%rbx
	subq	$32, %rsp
	call	get_next_token
	testq	%rax, %rax
	je	.L35
	movq	%rax, %rbx
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L42:
	xorl	%edx, %edx
	movq	%rdi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L35
.L36:
	movq	%rbx, %rdx
	movq	%rsi, %rcx
	call	output_one_token
	movl	24(%rbx), %eax
	testl	%eax, %eax
	jne	.L42
.L35:
	call	get_info
	addq	$32, %rsp
	movq	%rsi, %rcx
	leaq	.LC14(%rip), %rdx
	popq	%rbx
	movq	%rax, %r8
	popq	%rsi
	popq	%rdi
	jmp	fprintf
	.p2align 4
	.globl	output_ast
	.def	output_ast;	.scl	2;	.type	32;	.endef
output_ast:
	pushq	%rbp
	xorl	%r8d, %r8d
	movq	%rsp, %rbp
	pushq	%rbx
	movq	%rcx, %rbx
	movq	%rdx, %rcx
	movq	%rbx, %rdx
	andq	$-16, %rsp
	subq	$64, %rsp
	leaq	32(%rsp), %r9
	call	output_code
	call	get_info
	movq	%rbx, %rcx
	leaq	.LC14(%rip), %rdx
	movq	%rax, %r8
	call	fprintf
	movq	-8(%rbp), %rbx
	leave
	ret
	.p2align 4
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
	.p2align 4
	.globl	parse_file
	.def	parse_file;	.scl	2;	.type	32;	.endef
parse_file:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	movl	%edx, %r14d
	pushq	%r13
	movl	%r8d, %r13d
	pushq	%r12
	movl	%r9d, %r12d
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$80, %rsp
	call	create_file
	movq	%rax, %rcx
	movq	%rax, %rbx
	call	get_full_path
	leaq	.LC15(%rip), %rdx
	movq	$0, 40(%rsp)
	movq	%rax, %rcx
	movq	%rax, %rdi
	call	fopen
	testq	%rax, %rax
	je	.L59
	movq	%rax, %rsi
	leaq	40(%rsp), %rdx
	movq	%rax, %rcx
	call	read_source
	movq	%rsi, %rcx
	movq	%rax, %r15
	call	fclose
	movq	40(%rsp), %rdx
	movq	%rdi, %r8
	movq	%r15, %rcx
	call	create_lexer
	movq	%rax, %rsi
	testb	%r14b, %r14b
	jne	.L60
.L49:
	movq	%rsi, %rcx
	movl	%r12d, %edi
	call	reset_lexer
	movq	%rbx, %rcx
	call	create_parser
	orb	%r13b, %dil
	jne	.L61
.L47:
	leaq	-56(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L60:
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
	movq	%rax, %r14
	call	fopen
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L62
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	output_token
	movq	%rdi, %rcx
	call	fclose
	jmp	.L49
	.p2align 4,,10
	.p2align 3
.L61:
	movq	.refptr.builtin_scope(%rip), %rdx
	movq	%rax, %r8
	movq	%rsi, %rcx
	movq	(%rdx), %rdx
	call	parse_code
	movq	%rax, %rdi
	testb	%r13b, %r13b
	jne	.L63
.L53:
	testb	%r12b, %r12b
	je	.L47
	movl	$4, %edx
	leaq	.LC21(%rip), %rcx
	call	create_string
	movq	%rbx, %rcx
	movq	%rax, %rdx
	call	change_file_extension
	movq	%rbx, %rcx
	call	get_full_path
	movl	$3, %edx
	leaq	.LC20(%rip), %rcx
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
	je	.L64
	movq	%rdi, %rcx
	call	tac_code
	movq	%rbx, %rdx
	xorl	%r8d, %r8d
	movq	%rax, %rcx
	call	output_TAC
	call	get_info
	movq	%rbx, %rcx
	leaq	.LC14(%rip), %rdx
	movq	%rax, %r8
	call	fprintf
	leaq	-56(%rbp), %rsp
	movq	%rbx, %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	fclose
	.p2align 4,,10
	.p2align 3
.L63:
	movl	$4, %edx
	leaq	.LC19(%rip), %rcx
	call	create_string
	movq	%rbx, %rcx
	movq	%rax, %rdx
	call	change_file_extension
	movq	%rbx, %rcx
	call	get_full_path
	movl	$3, %edx
	leaq	.LC20(%rip), %rcx
	movq	%rax, %r13
	call	create_string
	movq	%rbx, %rcx
	movq	%rax, %rdx
	call	change_file_extension
	leaq	.LC18(%rip), %rdx
	movq	%r13, %rcx
	call	fopen
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L65
	leaq	48(%rsp), %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rcx
	movq	%rax, %rdx
	call	output_code
	call	get_info
	movq	%rsi, %rcx
	leaq	.LC14(%rip), %rdx
	movq	%rax, %r8
	call	fprintf
	movq	%rsi, %rcx
	call	fclose
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L64:
	call	__getreent
	movq	%rsi, %r8
	movq	24(%rax), %rcx
.L58:
	leaq	-56(%rbp), %rsp
	leaq	.LC16(%rip), %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L62:
	call	__getreent
	movq	%r14, %r8
	leaq	.LC16(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L49
	.p2align 4,,10
	.p2align 3
.L59:
	call	__getreent
	movq	%rdi, %r8
	movq	24(%rax), %rcx
	jmp	.L58
	.p2align 4,,10
	.p2align 3
.L65:
	call	__getreent
	movq	%r13, %r8
	leaq	.LC16(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L53
	.ident	"GCC: (GNU) 13.2.0"
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	ftell;	.scl	2;	.type	32;	.endef
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
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
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
	.def	parse_code;	.scl	2;	.type	32;	.endef
	.def	tac_code;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.builtin_scope, "dr"
	.globl	.refptr.builtin_scope
	.linkonce	discard
.refptr.builtin_scope:
	.quad	builtin_scope
