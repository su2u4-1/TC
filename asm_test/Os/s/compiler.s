	.file	"D:\\TC\\src\\compiler.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "%.*s%s\0"
.LC1:
	.ascii "%s%s\0"
	.text
	.globl	string_append
	.def	string_append;	.scl	2;	.type	32;	.endef
	.seh_proc	string_append
string_append:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%r9, %rbx
	movq	%rcx, %rbp
	movq	%r8, %rcx
	movq	%rdx, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	strlen
	movq	%rbx, %rcx
	movq	%rax, %rdi
	call	strlen
	movq	56(%rsp), %rdx
	movq	48(%rsp), %r8
	addq	%rax, %rdi
	cmpq	%rdx, %rdi
	jb	.L2
	movq	%r8, 32(%rsp)
	leaq	-1(%rdx), %r9
	movq	%rbp, %rcx
	leaq	.LC0(%rip), %r8
	movq	%rbx, 40(%rsp)
	subl	%eax, %r9d
	call	snprintf
	nop
	addq	$64, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rbp
	ret
.L2:
	movq	%rbx, %r9
	leaq	.LC1(%rip), %rdx
	movq	%rbp, %rcx
	addq	$64, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rbp
	jmp	sprintf
	.seh_endproc
	.section .rdata,"dr"
.LC2:
	.ascii "\0"
	.text
	.globl	read_source
	.def	read_source;	.scl	2;	.type	32;	.endef
	.seh_proc	read_source
read_source:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	$2, %r8d
	movq	%rdx, %rsi
	movq	%rcx, %rdi
	xorl	%edx, %edx
	call	fseek
	movq	%rdi, %rcx
	call	ftell
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rdi, %rcx
	movq	%rax, (%rsi)
	call	fseek
	movq	(%rsi), %rax
	leaq	.LC2(%rip), %rcx
	leaq	1(%rax), %rdx
	call	create_string
	movq	(%rsi), %r8
	movq	%rdi, %r9
	movl	$1, %edx
	movq	%rax, %rcx
	movq	%rax, %rbx
	call	fread
	movq	(%rsi), %rax
	movb	$0, (%rbx,%rax)
	xorl	%eax, %eax
.L7:
	cmpq	(%rsi), %rax
	jnb	.L10
	movb	(%rbx,%rax), %dl
	andl	$-5, %edx
	cmpb	$9, %dl
	jne	.L8
	movb	$32, (%rbx,%rax)
.L8:
	incq	%rax
	jmp	.L7
.L10:
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "Token(Type: EOF,         Line: %zu, Column: %zu)\12\0"
.LC4:
	.ascii "Token(Type: identifier,  Line: \0"
.LC5:
	.ascii "Token(Type: integer,     Line: \0"
.LC6:
	.ascii "Token(Type: float,       Line: \0"
.LC7:
	.ascii "Token(Type: string,      Line: \0"
.LC8:
	.ascii "Token(Type: symbol,      Line: \0"
.LC9:
	.ascii "Token(Type: keyword,     Line: \0"
.LC10:
	.ascii "Token(Type: comment,     Line: \0"
.LC11:
	.ascii "%zu, Column: %zu)\11Lexeme: '\0"
.LC12:
	.ascii "\\0\0"
.LC13:
	.ascii "\\n\0"
.LC14:
	.ascii "\\t\0"
.LC15:
	.ascii "\\r\0"
.LC16:
	.ascii "'\12\0"
.LC17:
	.ascii "\12info by lib:\12    %s\12\0"
	.text
	.globl	output_token
	.def	output_token;	.scl	2;	.type	32;	.endef
	.seh_proc	output_token
output_token:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	leaq	.L15(%rip), %rbp
	leaq	.LC15(%rip), %r13
	movq	%rdx, %rdi
	movq	%rcx, %rbx
	xorl	%edx, %edx
	movq	%rdi, %rcx
	call	get_next_token
	movq	%rax, %rsi
.L12:
	testq	%rsi, %rsi
	je	.L23
	cmpl	$7, 24(%rsi)
	ja	.L13
	movl	24(%rsi), %eax
	movslq	0(%rbp,%rax,4), %rax
	addq	%rbp, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L15:
	.long	.L22-.L15
	.long	.L21-.L15
	.long	.L20-.L15
	.long	.L19-.L15
	.long	.L18-.L15
	.long	.L17-.L15
	.long	.L16-.L15
	.long	.L14-.L15
	.text
.L22:
	movq	16(%rsi), %rdx
	movq	8(%rsi), %rax
	movq	%rbx, %rcx
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC3(%rip), %rdx
	call	fprintf
	jmp	.L23
.L21:
	movq	%rbx, %rdx
	leaq	.LC4(%rip), %rcx
	jmp	.L32
.L20:
	movq	%rbx, %rdx
	leaq	.LC5(%rip), %rcx
	jmp	.L32
.L19:
	movq	%rbx, %rdx
	leaq	.LC6(%rip), %rcx
	jmp	.L32
.L18:
	movq	%rbx, %rdx
	leaq	.LC7(%rip), %rcx
	jmp	.L32
.L17:
	movq	%rbx, %rdx
	leaq	.LC8(%rip), %rcx
	jmp	.L32
.L16:
	movq	%rbx, %rdx
	leaq	.LC9(%rip), %rcx
	jmp	.L32
.L14:
	movq	%rbx, %rdx
	leaq	.LC10(%rip), %rcx
.L32:
	call	fputs
.L13:
	movq	16(%rsi), %rdx
	movq	8(%rsi), %rax
	movq	%rbx, %rcx
	leaq	.LC13(%rip), %r14
	leaq	.LC12(%rip), %r15
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC11(%rip), %rdx
	call	fprintf
	movq	(%rsi), %r12
	xorl	%esi, %esi
.L24:
	movq	%r12, %rcx
	call	strlen
	cmpq	%rax, %rsi
	jnb	.L34
	movsbl	(%r12,%rsi), %ecx
	movq	%rbx, %rdx
	testb	%cl, %cl
	jne	.L25
	movq	%r15, %rcx
	jmp	.L33
.L25:
	cmpb	$10, %cl
	jne	.L27
	movq	%r14, %rcx
.L33:
	call	fputs
	jmp	.L26
.L27:
	cmpb	$9, %cl
	jne	.L28
	leaq	.LC14(%rip), %rcx
	jmp	.L33
.L28:
	cmpb	$13, %cl
	jne	.L29
	movq	%r13, %rcx
	jmp	.L33
.L29:
	call	fputc
.L26:
	incq	%rsi
	jmp	.L24
.L34:
	movq	%rbx, %rdx
	leaq	.LC16(%rip), %rcx
	call	fputs
	xorl	%edx, %edx
	movq	%rdi, %rcx
	call	get_next_token
	movq	%rax, %rsi
	jmp	.L12
.L23:
	call	get_info
	leaq	.LC17(%rip), %rdx
	movq	%rbx, %rcx
	movq	%rax, %r8
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fprintf
	.seh_endproc
	.globl	output_ast
	.def	output_ast;	.scl	2;	.type	32;	.endef
	.seh_proc	output_ast
output_ast:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	.refptr.builtin_scope(%rip), %rax
	movq	%rcx, %rbx
	movq	%rdx, %rcx
	movq	(%rax), %rdx
	movq	%r8, 40(%rsp)
	call	parse_code
	movq	40(%rsp), %r9
	xorl	%r8d, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	output_code
	call	get_info
	leaq	.LC17(%rip), %rdx
	movq	%rbx, %rcx
	movq	%rax, %r8
	addq	$48, %rsp
	popq	%rbx
	jmp	fprintf
	.seh_endproc
	.section .rdata,"dr"
.LC18:
	.ascii "r\0"
.LC19:
	.ascii "Error opening file: %s\0"
.LC20:
	.ascii ".token\0"
.LC21:
	.ascii "w\0"
.LC22:
	.ascii "Error opening file: %s\12\0"
.LC23:
	.ascii ".ast\0"
	.text
	.globl	parse_file
	.def	parse_file;	.scl	2;	.type	32;	.endef
	.seh_proc	parse_file
parse_file:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movl	%edx, %ebp
	movl	%r8d, %r12d
	call	create_file
	movq	%rax, %rcx
	movq	%rax, %rbx
	call	get_full_path
	leaq	.LC18(%rip), %rdx
	movq	%rax, %rdi
	xorl	%eax, %eax
	movq	%rdi, %rcx
	movq	%rax, 56(%rsp)
	call	fopen
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L37
	call	__getreent
	movq	%rdi, %r8
	leaq	.LC19(%rip), %rdx
	movq	24(%rax), %rcx
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	fprintf
.L37:
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
	je	.L38
	movl	$6, %edx
	leaq	.LC20(%rip), %rcx
	call	create_string
	movq	%rbx, %rcx
	movq	%rax, %rdx
	call	change_file_extension
	movq	%rbx, %rcx
	call	get_full_path
	leaq	.LC21(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rbp
	call	fopen
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L39
	call	__getreent
	movq	%rbp, %r8
	leaq	.LC22(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L40
.L39:
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	output_token
.L40:
	movq	%rdi, %rcx
	call	fclose
.L38:
	movq	%rsi, %rcx
	call	reset_lexer
	call	create_parser
	testb	%r12b, %r12b
	je	.L36
	movl	$4, %edx
	leaq	.LC23(%rip), %rcx
	movq	%rax, 40(%rsp)
	call	create_string
	movq	%rbx, %rcx
	movq	%rax, %rdx
	call	change_file_extension
	movq	%rbx, %rcx
	call	get_full_path
	leaq	.LC21(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rdi
	call	fopen
	movq	40(%rsp), %r8
	testq	%rax, %rax
	movq	%rax, %rbx
	jne	.L42
	call	__getreent
	movq	%rdi, %r8
	leaq	.LC22(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L43
.L42:
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	output_ast
.L43:
	movq	%rbx, %rcx
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	fclose
.L36:
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 13.2.0"
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	snprintf;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
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
