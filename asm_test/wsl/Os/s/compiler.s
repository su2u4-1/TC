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
	.globl	string_append
	.type	string_append, @function
string_append:
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	movq	%rdx, %rdi
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$24, %rsp
	movq	%rsi, 8(%rsp)
	call	*strlen@GOTPCREL(%rip)
	movq	%rbp, %rdi
	movq	%rax, %r13
	call	*strlen@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	leaq	0(%r13,%rax), %rdx
	cmpq	%rsi, %rdx
	jb	.L2
	leaq	-1(%rsi), %r9
	pushq	%rbp
	leaq	.LC0(%rip), %r8
	orq	$-1, %rcx
	subl	%eax, %r9d
	pushq	%rbx
	movl	$2, %edx
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	*__snprintf_chk@GOTPCREL(%rip)
	jmp	.L6
.L2:
	cmpq	%r12, %rbx
	jne	.L4
	addq	$24, %rsp
	leaq	(%rbx,%r13), %rdi
	subq	%r13, %rsi
	movq	%rbp, %rcx
	popq	%rbx
	leaq	.LC1(%rip), %rdx
	popq	%rbp
	xorl	%eax, %eax
	popq	%r12
	popq	%r13
	jmp	*snprintf@GOTPCREL(%rip)
.L4:
	movq	%rbx, %r9
	pushq	%rcx
	leaq	.LC2(%rip), %r8
	orq	$-1, %rcx
	pushq	%rbp
	movl	$2, %edx
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	*__snprintf_chk@GOTPCREL(%rip)
.L6:
	popq	%rax
	popq	%rdx
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	string_append, .-string_append
	.section	.rodata.str1.1
.LC3:
	.string	""
	.text
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
	movb	$0, (%rbx,%rax)
	movq	%rax, 0(%rbp)
	xorl	%eax, %eax
.L9:
	cmpq	0(%rbp), %rax
	jnb	.L13
	movb	(%rbx,%rax), %dl
	andl	$-5, %edx
	cmpb	$9, %dl
	jne	.L10
	movb	$32, (%rbx,%rax)
.L10:
	incq	%rax
	jmp	.L9
.L13:
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	read_source, .-read_source
	.section	.rodata.str1.1
.LC4:
	.string	"Token(Type: EOF,         Line: %zu, Column: %zu)\n"
.LC5:
	.string	"Token(Type: identifier,  Line: "
.LC6:
	.string	"Token(Type: integer,     Line: "
.LC7:
	.string	"Token(Type: float,       Line: "
.LC8:
	.string	"Token(Type: string,      Line: "
.LC9:
	.string	"Token(Type: symbol,      Line: "
.LC10:
	.string	"Token(Type: keyword,     Line: "
.LC11:
	.string	"Token(Type: comment,     Line: "
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
	.globl	output_token
	.type	output_token, @function
output_token:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	leaq	.L18(%rip), %r13
	pushq	%r12
	movq	%rsi, %r12
	xorl	%esi, %esi
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	movq	%r12, %rdi
	pushq	%r9
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
.L15:
	testq	%rbp, %rbp
	je	.L26
	cmpl	$7, 24(%rbp)
	ja	.L16
	movl	24(%rbp), %eax
	movslq	0(%r13,%rax,4), %rax
	addq	%r13, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
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
.L25:
	movq	16(%rbp), %rax
	movq	8(%rbp), %rcx
	movl	$2, %esi
	movq	%rbx, %rdi
	leaq	.LC4(%rip), %rdx
	leaq	1(%rax), %r8
	incq	%rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L26
.L24:
	movq	%rbx, %rsi
	leaq	.LC5(%rip), %rdi
	jmp	.L36
.L23:
	movq	%rbx, %rsi
	leaq	.LC6(%rip), %rdi
	jmp	.L36
.L22:
	movq	%rbx, %rsi
	leaq	.LC7(%rip), %rdi
	jmp	.L36
.L21:
	movq	%rbx, %rsi
	leaq	.LC8(%rip), %rdi
	jmp	.L36
.L20:
	movq	%rbx, %rsi
	leaq	.LC9(%rip), %rdi
	jmp	.L36
.L19:
	movq	%rbx, %rsi
	leaq	.LC10(%rip), %rdi
	jmp	.L36
.L17:
	movq	%rbx, %rsi
	leaq	.LC11(%rip), %rdi
.L36:
	call	*fputs@GOTPCREL(%rip)
.L16:
	movq	16(%rbp), %rax
	movq	8(%rbp), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	leaq	.LC16(%rip), %r15
	leaq	1(%rdx), %rcx
	leaq	1(%rax), %r8
	xorl	%eax, %eax
	leaq	.LC12(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	0(%rbp), %r14
	xorl	%ebp, %ebp
.L27:
	movq	%r14, %rdi
	call	*strlen@GOTPCREL(%rip)
	cmpq	%rax, %rbp
	jnb	.L38
	movsbl	(%r14,%rbp), %edi
	movq	%rbx, %rsi
	testb	%dil, %dil
	jne	.L28
	leaq	.LC13(%rip), %rdi
	jmp	.L37
.L28:
	cmpb	$10, %dil
	jne	.L30
	leaq	.LC14(%rip), %rdi
.L37:
	call	*fputs@GOTPCREL(%rip)
	jmp	.L29
.L30:
	cmpb	$9, %dil
	jne	.L31
	leaq	.LC15(%rip), %rdi
	jmp	.L37
.L31:
	cmpb	$13, %dil
	jne	.L32
	movq	%r15, %rdi
	jmp	.L37
.L32:
	call	*fputc@GOTPCREL(%rip)
.L29:
	incq	%rbp
	jmp	.L27
.L38:
	movq	%rbx, %rsi
	leaq	.LC17(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	xorl	%esi, %esi
	movq	%r12, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L15
.L26:
	call	*get_info@GOTPCREL(%rip)
	popq	%r8
	movq	%rbx, %rdi
	movl	$2, %esi
	popq	%rbx
	movq	%rax, %rcx
	popq	%rbp
	xorl	%eax, %eax
	popq	%r12
	leaq	.LC18(%rip), %rdx
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.size	output_token, .-output_token
	.globl	output_ast
	.type	output_ast, @function
output_ast:
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rbx
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	pushq	%rax
	movq	builtin_scope(%rip), %rsi
	call	*parse_code@GOTPCREL(%rip)
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	xorl	%edx, %edx
	movq	%rax, %rdi
	call	*output_code@GOTPCREL(%rip)
	call	*get_info@GOTPCREL(%rip)
	popq	%r8
	movq	%rbx, %rdi
	movl	$2, %esi
	movq	%rax, %rcx
	popq	%rbx
	leaq	.LC18(%rip), %rdx
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
	.globl	parse_file
	.type	parse_file, @function
parse_file:
	pushq	%r14
	pushq	%r13
	movl	%edx, %r13d
	pushq	%r12
	movl	%esi, %r12d
	pushq	%rbp
	pushq	%rbx
	subq	$16, %rsp
	call	*create_file@GOTPCREL(%rip)
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	*get_full_path@GOTPCREL(%rip)
	xorl	%r11d, %r11d
	leaq	.LC19(%rip), %rsi
	movq	%rax, %r14
	movq	%r11, 8(%rsp)
	movq	%rax, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%r14, %rcx
	leaq	.LC20(%rip), %rdx
	testq	%rax, %rax
	je	.L48
	leaq	8(%rsp), %rsi
	movq	%rax, %rdi
	movq	%rax, %rbp
	call	read_source
	movq	%rbp, %rdi
	movq	%rax, %r14
	call	*fclose@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movq	%r14, %rdi
	call	*create_lexer@GOTPCREL(%rip)
	movq	%rax, %rbp
	testb	%r12b, %r12b
	je	.L43
	movl	$6, %esi
	leaq	.LC21(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, %rsi
	call	*change_file_extension@GOTPCREL(%rip)
	movq	%rbx, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	leaq	.LC22(%rip), %rsi
	movq	%rax, %r14
	movq	%rax, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L44
	movq	stderr(%rip), %rdi
	movq	%r14, %rcx
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC23(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L43
.L44:
	movq	%rax, %rdi
	movq	%rbp, %rsi
	call	output_token
	movq	%r12, %rdi
	call	*fclose@GOTPCREL(%rip)
.L43:
	movq	%rbp, %rdi
	call	*reset_lexer@GOTPCREL(%rip)
	call	*create_parser@GOTPCREL(%rip)
	movq	%rax, %r14
	testb	%r13b, %r13b
	je	.L41
	movl	$4, %esi
	leaq	.LC24(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, %rsi
	call	*change_file_extension@GOTPCREL(%rip)
	movq	%rbx, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	leaq	.LC22(%rip), %rsi
	movq	%rax, %r12
	movq	%rax, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L46
	movq	%r12, %rcx
	leaq	.LC23(%rip), %rdx
.L48:
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
.L46:
	movq	%r14, %rdx
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	output_ast
	addq	$16, %rsp
	movq	%rbx, %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	*fclose@GOTPCREL(%rip)
.L41:
	addq	$16, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	parse_file, .-parse_file
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
