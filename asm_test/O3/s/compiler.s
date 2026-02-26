	.file	"D:\\TC\\src\\compiler.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "%.*s%s\0"
.LC1:
	.ascii "%s%s\0"
	.text
	.p2align 4
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
	movq	%r9, %rdi
	movq	%rcx, %r12
	movq	%r8, %rcx
	movq	%rdx, %rbp
	movq	%r8, %rsi
	call	strlen
	movq	%rdi, %rcx
	movq	%rax, %rbx
	call	strlen
	addq	%rax, %rbx
	cmpq	%rbp, %rbx
	jb	.L2
	movq	%rdi, 40(%rsp)
	leaq	-1(%rbp), %r9
	movq	%rbp, %rdx
	movq	%r12, %rcx
	movq	%rsi, 32(%rsp)
	subl	%eax, %r9d
	leaq	.LC0(%rip), %r8
	call	snprintf
	nop
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L2:
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC1(%rip), %rdx
	movq	%r12, %rcx
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	sprintf
	.seh_endproc
	.section .rdata,"dr"
.LC2:
	.ascii "\0"
	.text
	.p2align 4
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
	movq	(%rsi), %rcx
	xorl	%eax, %eax
	testq	%rcx, %rcx
	je	.L6
	.p2align 4,,10
	.p2align 3
.L7:
	movzbl	(%rbx,%rax), %edx
	andl	$-5, %edx
	cmpb	$9, %dl
	jne	.L8
	movb	$32, (%rbx,%rax)
	movq	(%rsi), %rcx
	addq	$1, %rax
	cmpq	%rcx, %rax
	jb	.L7
.L6:
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L8:
	addq	$1, %rax
	cmpq	%rcx, %rax
	jb	.L7
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
	.p2align 4
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
	movq	%rdx, %r14
	movq	%rcx, %rdi
	xorl	%edx, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L25
	leaq	.L17(%rip), %r12
	leaq	.LC15(%rip), %r15
	.p2align 4,,10
	.p2align 3
.L33:
	cmpl	$7, 24(%rbx)
	ja	.L15
	movl	24(%rbx), %eax
	movslq	(%r12,%rax,4), %rax
	addq	%r12, %rax
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
	.p2align 4,,10
	.p2align 3
.L18:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC9(%rip), %rcx
	call	fwrite
	.p2align 4,,10
	.p2align 3
.L15:
	movq	16(%rbx), %rdx
	movq	8(%rbx), %rax
	movq	%rdi, %rcx
	leaq	.LC13(%rip), %r13
	leaq	.LC12(%rip), %rbp
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC11(%rip), %rdx
	call	fprintf
	movq	(%rbx), %rsi
	xorl	%ebx, %ebx
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L27:
	cmpb	$10, %cl
	je	.L38
	cmpb	$9, %cl
	je	.L39
	cmpb	$13, %cl
	je	.L40
	movq	%rdi, %rdx
	call	fputc
.L28:
	addq	$1, %rbx
.L26:
	movq	%rsi, %rcx
	call	strlen
	cmpq	%rax, %rbx
	jnb	.L41
	movsbl	(%rsi,%rbx), %ecx
	testb	%cl, %cl
	jne	.L27
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%rbp, %rcx
	call	fwrite
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L19:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC8(%rip), %rcx
	call	fwrite
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L20:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rcx
	call	fwrite
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L21:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC6(%rip), %rcx
	call	fwrite
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L24:
	movq	16(%rbx), %rdx
	movq	8(%rbx), %rax
	movq	%rdi, %rcx
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC3(%rip), %rdx
	call	fprintf
.L25:
	call	get_info
	leaq	.LC17(%rip), %rdx
	movq	%rdi, %rcx
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
	.p2align 4,,10
	.p2align 3
.L16:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC10(%rip), %rcx
	call	fwrite
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L22:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rcx
	call	fwrite
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L23:
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rcx
	call	fwrite
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L40:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%r15, %rcx
	call	fwrite
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L38:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%r13, %rcx
	call	fwrite
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L41:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC16(%rip), %rcx
	call	fwrite
	xorl	%edx, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L33
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L39:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC14(%rip), %rcx
	call	fwrite
	jmp	.L28
	.seh_endproc
	.p2align 4
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
	movq	.refptr.builtin_scope(%rip), %rax
	movq	%rcx, %rbx
	movq	%rdx, %rcx
	movq	(%rax), %rdx
	movq	%r8, %rsi
	call	parse_code
	xorl	%r8d, %r8d
	movq	%rbx, %rdx
	movq	%rsi, %r9
	movq	%rax, %rcx
	call	output_code
	call	get_info
	leaq	.LC17(%rip), %rdx
	movq	%rbx, %rcx
	movq	%rax, %r8
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
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
	.p2align 4
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
	movq	%rax, %rcx
	movq	%rax, %rsi
	call	get_full_path
	leaq	.LC18(%rip), %rdx
	movq	$0, 40(%rsp)
	movq	%rax, %rcx
	movq	%rax, %rdi
	call	fopen
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L51
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
	jne	.L52
.L45:
	movq	%rbx, %rcx
	call	reset_lexer
	call	create_parser
	movq	%rax, %rdi
	testb	%bpl, %bpl
	jne	.L53
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L52:
	movl	$6, %edx
	leaq	.LC20(%rip), %rcx
	call	create_string
	movq	%rsi, %rcx
	movq	%rax, %rdx
	call	change_file_extension
	movq	%rsi, %rcx
	call	get_full_path
	leaq	.LC21(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	fopen
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L54
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	output_token
.L47:
	movq	%rdi, %rcx
	call	fclose
	jmp	.L45
	.p2align 4,,10
	.p2align 3
.L53:
	movl	$4, %edx
	leaq	.LC23(%rip), %rcx
	call	create_string
	movq	%rsi, %rcx
	movq	%rax, %rdx
	call	change_file_extension
	movq	%rsi, %rcx
	call	get_full_path
	leaq	.LC21(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rbp
	call	fopen
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L55
	movq	.refptr.builtin_scope(%rip), %rax
	movq	%rdi, %r8
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	parse_code
	xorl	%r8d, %r8d
	movq	%rsi, %rdx
	movq	%rdi, %r9
	movq	%rax, %rcx
	call	output_code
	call	get_info
	leaq	.LC17(%rip), %rdx
	movq	%rsi, %rcx
	movq	%rax, %r8
	call	fprintf
.L50:
	movq	%rsi, %rcx
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	fclose
	.p2align 4,,10
	.p2align 3
.L55:
	call	__getreent
	movq	%rbp, %r8
	leaq	.LC22(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L50
	.p2align 4,,10
	.p2align 3
.L54:
	call	__getreent
	movq	%r12, %r8
	leaq	.LC22(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L47
	.p2align 4,,10
	.p2align 3
.L51:
	call	__getreent
	movq	%rdi, %r8
	leaq	.LC19(%rip), %rdx
	movq	24(%rax), %rcx
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	fprintf
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
