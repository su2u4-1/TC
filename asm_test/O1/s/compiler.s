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
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, %r12
	movq	%rdx, %rbp
	movq	%r8, %rsi
	movq	%r9, %rdi
	movq	%r8, %rcx
	call	strlen
	movq	%rax, %rbx
	movq	%rdi, %rcx
	call	strlen
	addq	%rax, %rbx
	cmpq	%rbp, %rbx
	jb	.L2
	leaq	-1(%rbp), %r9
	movq	%rdi, 40(%rsp)
	movq	%rsi, 32(%rsp)
	subl	%eax, %r9d
	leaq	.LC0(%rip), %r8
	movq	%rbp, %rdx
	movq	%r12, %rcx
	call	snprintf
	nop
.L1:
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L2:
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC1(%rip), %rdx
	movq	%r12, %rcx
	call	sprintf
	jmp	.L1
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
	leaq	.LC2(%rip), %rcx
	call	create_string
	movq	%rax, %rbx
	movq	%rdi, %r9
	movq	(%rsi), %r8
	movl	$1, %edx
	movq	%rax, %rcx
	call	fread
	movq	(%rsi), %rax
	movb	$0, (%rbx,%rax)
	cmpq	$0, (%rsi)
	je	.L4
	movl	$0, %eax
	jmp	.L7
.L6:
	addq	$1, %rax
	cmpq	(%rsi), %rax
	jnb	.L4
.L7:
	movzbl	(%rbx,%rax), %edx
	andl	$-5, %edx
	cmpb	$9, %dl
	jne	.L6
	movb	$32, (%rbx,%rax)
	jmp	.L6
.L4:
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC3:
	.ascii "Token(Type: EOF,         Line: %zu, Column: %zu)\12\0"
	.align 8
.LC4:
	.ascii "Token(Type: identifier,  Line: \0"
	.align 8
.LC5:
	.ascii "Token(Type: integer,     Line: \0"
	.align 8
.LC6:
	.ascii "Token(Type: float,       Line: \0"
	.align 8
.LC7:
	.ascii "Token(Type: string,      Line: \0"
	.align 8
.LC8:
	.ascii "Token(Type: symbol,      Line: \0"
	.align 8
.LC9:
	.ascii "Token(Type: keyword,     Line: \0"
	.align 8
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
	movq	%rcx, %rdi
	movq	%rdx, %r14
	movl	$0, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L10
	leaq	.L13(%rip), %r12
	leaq	.LC15(%rip), %r15
	jmp	.L28
.L20:
	movq	16(%rbx), %rdx
	movq	8(%rbx), %rax
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC3(%rip), %rdx
	movq	%rdi, %rcx
	call	fprintf
.L10:
	call	get_info
	movq	%rax, %r8
	leaq	.LC17(%rip), %rdx
	movq	%rdi, %rcx
	call	fprintf
	nop
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
.L19:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rcx
	call	fwrite
.L11:
	movq	16(%rbx), %rdx
	movq	8(%rbx), %rax
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC11(%rip), %rdx
	movq	%rdi, %rcx
	call	fprintf
	movq	(%rbx), %rsi
	movl	$0, %ebx
	leaq	.LC13(%rip), %r13
	leaq	.LC12(%rip), %rbp
	jmp	.L21
.L18:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rcx
	call	fwrite
	jmp	.L11
.L17:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC6(%rip), %rcx
	call	fwrite
	jmp	.L11
.L16:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rcx
	call	fwrite
	jmp	.L11
.L15:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC8(%rip), %rcx
	call	fwrite
	jmp	.L11
.L14:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC9(%rip), %rcx
	call	fwrite
	jmp	.L11
.L12:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC10(%rip), %rcx
	call	fwrite
	jmp	.L11
.L31:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%rbp, %rcx
	call	fwrite
.L23:
	addq	$1, %rbx
.L21:
	movq	%rsi, %rcx
	call	strlen
	cmpq	%rax, %rbx
	jnb	.L30
	movzbl	(%rsi,%rbx), %ecx
	testb	%cl, %cl
	je	.L31
	cmpb	$10, %cl
	je	.L32
	cmpb	$9, %cl
	je	.L33
	cmpb	$13, %cl
	je	.L34
	movsbl	%cl, %ecx
	movq	%rdi, %rdx
	call	fputc
	jmp	.L23
.L32:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%r13, %rcx
	call	fwrite
	jmp	.L23
.L33:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC14(%rip), %rcx
	call	fwrite
	jmp	.L23
.L34:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%r15, %rcx
	call	fwrite
	jmp	.L23
.L30:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC16(%rip), %rcx
	call	fwrite
	movl	$0, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L10
.L28:
	cmpl	$7, 24(%rbx)
	ja	.L11
	movl	24(%rbx), %eax
	movslq	(%r12,%rax,4), %rax
	addq	%r12, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L13:
	.long	.L20-.L13
	.long	.L19-.L13
	.long	.L18-.L13
	.long	.L17-.L13
	.long	.L16-.L13
	.long	.L15-.L13
	.long	.L14-.L13
	.long	.L12-.L13
	.text
	.seh_endproc
	.globl	output_ast
	.def	output_ast;	.scl	2;	.type	32;	.endef
	.seh_proc	output_ast
output_ast:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
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
	leaq	.LC17(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
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
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%edx, %r12d
	movl	%r8d, %ebp
	call	create_file
	movq	%rax, %rsi
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdi
	movq	$0, 40(%rsp)
	leaq	.LC18(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L45
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
	jne	.L46
.L39:
	movq	%rbx, %rcx
	call	reset_lexer
	call	create_parser
	movq	%rax, %rdi
	testb	%bpl, %bpl
	jne	.L47
.L36:
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L45:
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rdi, %r8
	leaq	.LC19(%rip), %rdx
	call	fprintf
	jmp	.L36
.L46:
	movl	$6, %edx
	leaq	.LC20(%rip), %rcx
	call	create_string
	movq	%rax, %rdx
	movq	%rsi, %rcx
	call	change_file_extension
	movq	%rsi, %rcx
	call	get_full_path
	movq	%rax, %r12
	leaq	.LC21(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L48
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	output_token
.L41:
	movq	%rdi, %rcx
	call	fclose
	jmp	.L39
.L48:
	call	__getreent
	movq	24(%rax), %rcx
	movq	%r12, %r8
	leaq	.LC22(%rip), %rdx
	call	fprintf
	jmp	.L41
.L47:
	movl	$4, %edx
	leaq	.LC23(%rip), %rcx
	call	create_string
	movq	%rax, %rdx
	movq	%rsi, %rcx
	call	change_file_extension
	movq	%rsi, %rcx
	call	get_full_path
	movq	%rax, %rbp
	leaq	.LC21(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L49
	movq	%rdi, %r8
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	output_ast
.L44:
	movq	%rsi, %rcx
	call	fclose
	jmp	.L36
.L49:
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rbp, %r8
	leaq	.LC22(%rip), %rdx
	call	fprintf
	jmp	.L44
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
