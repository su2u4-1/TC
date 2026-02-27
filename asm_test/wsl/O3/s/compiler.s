	.file	"compiler.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%.*s%s"
.LC1:
	.string	"%s"
.LC2:
	.string	"%s%s"
	.text
	.p2align 4
	.globl	string_append
	.type	string_append, @function
string_append:
	pushq	%r14
	pushq	%r13
	movq	%rdi, %r13
	movq	%rdx, %rdi
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movq	%rdx, %rbx
	call	*strlen@GOTPCREL(%rip)
	movq	%r12, %rdi
	movq	%rax, %r14
	call	*strlen@GOTPCREL(%rip)
	leaq	(%r14,%rax), %rdx
	cmpq	%rbp, %rdx
	jnb	.L7
	cmpq	%r13, %rbx
	je	.L8
	subq	$8, %rsp
	movq	%rbx, %r9
	movl	$2, %edx
	movq	%rbp, %rsi
	pushq	%r12
	movq	%r13, %rdi
	leaq	.LC2(%rip), %r8
	xorl	%eax, %eax
	movq	$-1, %rcx
	call	*__snprintf_chk@GOTPCREL(%rip)
	popq	%rax
	popq	%rdx
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L8:
	movq	%rbp, %rsi
	leaq	(%rbx,%r14), %rdi
	movq	%r12, %rcx
	popq	%rbx
	subq	%r14, %rsi
	popq	%rbp
	leaq	.LC1(%rip), %rdx
	popq	%r12
	xorl	%eax, %eax
	popq	%r13
	popq	%r14
	jmp	*snprintf@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L7:
	leaq	-1(%rbp), %r9
	pushq	%r12
	movq	%rbp, %rsi
	movq	$-1, %rcx
	pushq	%rbx
	subl	%eax, %r9d
	movq	%r13, %rdi
	leaq	.LC0(%rip), %r8
	movl	$2, %edx
	xorl	%eax, %eax
	call	*__snprintf_chk@GOTPCREL(%rip)
	popq	%rcx
	popq	%rsi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	string_append, .-string_append
	.section	.rodata.str1.1
.LC3:
	.string	""
	.text
	.p2align 4
	.globl	read_source
	.type	read_source, @function
read_source:
	pushq	%r12
	movq	%rdi, %r12
	movl	$2, %edx
	pushq	%rbp
	movq	%rsi, %rbp
	xorl	%esi, %esi
	pushq	%rbx
	call	*fseek@GOTPCREL(%rip)
	movq	%r12, %rdi
	call	*ftell@GOTPCREL(%rip)
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%r12, %rdi
	movq	%rax, 0(%rbp)
	call	*fseek@GOTPCREL(%rip)
	movq	0(%rbp), %rax
	leaq	.LC3(%rip), %rdi
	leaq	1(%rax), %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	0(%rbp), %rdx
	movq	%r12, %rcx
	movl	$1, %esi
	movq	%rax, %rbx
	movq	%rax, %rdi
	call	*fread@GOTPCREL(%rip)
	xorl	%edx, %edx
	movb	$0, (%rbx,%rax)
	movq	%rax, 0(%rbp)
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
	movq	0(%rbp), %rax
	addq	$1, %rdx
	cmpq	%rax, %rdx
	jb	.L10
.L9:
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L11:
	addq	$1, %rdx
	cmpq	%rax, %rdx
	jb	.L10
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	read_source, .-read_source
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC4:
	.string	"Token(Type: EOF,         Line: %zu, Column: %zu)\n"
	.align 8
.LC5:
	.string	"Token(Type: identifier,  Line: "
	.align 8
.LC6:
	.string	"Token(Type: integer,     Line: "
	.align 8
.LC7:
	.string	"Token(Type: float,       Line: "
	.align 8
.LC8:
	.string	"Token(Type: string,      Line: "
	.align 8
.LC9:
	.string	"Token(Type: symbol,      Line: "
	.align 8
.LC10:
	.string	"Token(Type: keyword,     Line: "
	.align 8
.LC11:
	.string	"Token(Type: comment,     Line: "
	.section	.rodata.str1.1
.LC12:
	.string	"%zu, Column: %zu)\tLexeme: '"
.LC13:
	.string	"\\0"
.LC14:
	.string	"\\n"
.LC15:
	.string	"\\t"
.LC16:
	.string	"\\r"
.LC17:
	.string	"'\n"
.LC18:
	.string	"\ninfo by lib:\n    %s\n"
	.text
	.p2align 4
	.globl	output_token
	.type	output_token, @function
output_token:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	movq	%rsi, %rdi
	pushq	%rbp
	pushq	%rbx
	subq	$24, %rsp
	movq	%rsi, 8(%rsp)
	xorl	%esi, %esi
	call	*get_next_token@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L29
	movq	%rax, %rbx
	leaq	.L21(%rip), %r14
	.p2align 4,,10
	.p2align 3
.L37:
	cmpl	$7, 24(%rbx)
	ja	.L19
	movl	24(%rbx), %eax
	movslq	(%r14,%rax,4), %rax
	addq	%r14, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
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
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC10(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L19:
	movq	16(%rbx), %rax
	movq	8(%rbx), %rdx
	movl	$2, %esi
	movq	%r12, %rdi
	leaq	.LC14(%rip), %r15
	leaq	.LC13(%rip), %r13
	leaq	1(%rdx), %rcx
	leaq	1(%rax), %r8
	xorl	%eax, %eax
	leaq	.LC12(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	(%rbx), %rbp
	xorl	%ebx, %ebx
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L31:
	cmpb	$10, %dil
	je	.L43
	cmpb	$9, %dil
	je	.L44
	cmpb	$13, %dil
	je	.L45
	movq	%r12, %rsi
	call	*fputc@GOTPCREL(%rip)
.L32:
	addq	$1, %rbx
.L30:
	movq	%rbp, %rdi
	call	*strlen@GOTPCREL(%rip)
	cmpq	%rax, %rbx
	jnb	.L46
	movsbl	0(%rbp,%rbx), %edi
	testb	%dil, %dil
	jne	.L31
	movq	%r12, %rcx
	movl	$2, %edx
	movl	$1, %esi
	movq	%r13, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L32
	.p2align 4,,10
	.p2align 3
.L23:
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC9(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L24:
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L25:
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L28:
	movq	16(%rbx), %rax
	movq	8(%rbx), %rcx
	movl	$2, %esi
	movq	%r12, %rdi
	leaq	.LC4(%rip), %rdx
	leaq	1(%rax), %r8
	addq	$1, %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L29:
	call	*get_info@GOTPCREL(%rip)
	addq	$24, %rsp
	movq	%r12, %rdi
	leaq	.LC18(%rip), %rdx
	popq	%rbx
	movq	%rax, %rcx
	popq	%rbp
	movl	$2, %esi
	popq	%r12
	xorl	%eax, %eax
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L20:
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L26:
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L27:
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L45:
	movq	%r12, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L32
	.p2align 4,,10
	.p2align 3
.L43:
	movq	%r12, %rcx
	movl	$2, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L32
	.p2align 4,,10
	.p2align 3
.L46:
	movq	%r12, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC17(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L37
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L44:
	movq	%r12, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L32
	.size	output_token, .-output_token
	.p2align 4
	.globl	output_ast
	.type	output_ast, @function
output_ast:
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rbx
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	subq	$8, %rsp
	movq	builtin_scope(%rip), %rsi
	call	*parse_code@GOTPCREL(%rip)
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	xorl	%edx, %edx
	movq	%rax, %rdi
	call	*output_code@GOTPCREL(%rip)
	call	*get_info@GOTPCREL(%rip)
	addq	$8, %rsp
	movq	%rbx, %rdi
	leaq	.LC18(%rip), %rdx
	movq	%rax, %rcx
	popq	%rbx
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbp
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.size	output_ast, .-output_ast
	.section	.rodata.str1.1
.LC19:
	.string	"r"
.LC20:
	.string	"Error opening file: %s"
.LC21:
	.string	".token"
.LC22:
	.string	"w"
.LC23:
	.string	"Error opening file: %s\n"
.LC24:
	.string	".ast"
	.text
	.p2align 4
	.globl	parse_file
	.type	parse_file, @function
parse_file:
	pushq	%r14
	pushq	%r13
	movl	%esi, %r13d
	pushq	%r12
	movl	%edx, %r12d
	pushq	%rbp
	pushq	%rbx
	subq	$16, %rsp
	call	*create_file@GOTPCREL(%rip)
	movq	%rax, %rdi
	movq	%rax, %rbp
	call	*get_full_path@GOTPCREL(%rip)
	leaq	.LC19(%rip), %rsi
	movq	$0, 8(%rsp)
	movq	%rax, %r14
	movq	%rax, %rdi
	call	*fopen@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L57
	leaq	8(%rsp), %rsi
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	read_source
	movq	%rbx, %rdi
	movq	%rax, %r14
	call	*fclose@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movq	%r14, %rdi
	call	*create_lexer@GOTPCREL(%rip)
	movq	%rax, %rbx
	testb	%r13b, %r13b
	jne	.L58
.L51:
	movq	%rbx, %rdi
	call	*reset_lexer@GOTPCREL(%rip)
	call	*create_parser@GOTPCREL(%rip)
	movq	%rax, %r13
	testb	%r12b, %r12b
	jne	.L59
	addq	$16, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L58:
	movl	$6, %esi
	leaq	.LC21(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rbp, %rdi
	movq	%rax, %rsi
	call	*change_file_extension@GOTPCREL(%rip)
	movq	%rbp, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	leaq	.LC22(%rip), %rsi
	movq	%rax, %r14
	movq	%rax, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L60
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	output_token
	movq	%r13, %rdi
	call	*fclose@GOTPCREL(%rip)
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L59:
	movl	$4, %esi
	leaq	.LC24(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rbp, %rdi
	movq	%rax, %rsi
	call	*change_file_extension@GOTPCREL(%rip)
	movq	%rbp, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	leaq	.LC22(%rip), %rsi
	movq	%rax, %r12
	movq	%rax, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L61
	movq	%r13, %rdx
	movq	%rbx, %rdi
	movq	builtin_scope(%rip), %rsi
	call	*parse_code@GOTPCREL(%rip)
	movq	%r13, %rcx
	movq	%rbp, %rsi
	xorl	%edx, %edx
	movq	%rax, %rdi
	call	*output_code@GOTPCREL(%rip)
	call	*get_info@GOTPCREL(%rip)
	movq	%rbp, %rdi
	movl	$2, %esi
	leaq	.LC18(%rip), %rdx
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	addq	$16, %rsp
	movq	%rbp, %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	*fclose@GOTPCREL(%rip)
.L57:
	movq	%r14, %rcx
	leaq	.LC20(%rip), %rdx
.L56:
	movq	stderr(%rip), %rdi
	addq	$16, %rsp
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	*__fprintf_chk@GOTPCREL(%rip)
.L60:
	movq	stderr(%rip), %rdi
	movq	%r14, %rcx
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC23(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L51
.L61:
	movq	%r12, %rcx
	leaq	.LC23(%rip), %rdx
	jmp	.L56
	.size	parse_file, .-parse_file
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
