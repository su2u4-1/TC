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
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %r14
	movq	%rsi, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %r12
	movq	%rdx, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %r13
	movq	%r12, %rdi
	call	*strlen@GOTPCREL(%rip)
	leaq	0(%r13,%rax), %rdx
	cmpq	%rbx, %rdx
	jnb	.L6
	cmpq	%r14, %rbp
	je	.L7
	subq	$8, %rsp
	pushq	%r12
	movq	%rbp, %r9
	leaq	.LC2(%rip), %r8
	movq	$-1, %rcx
	movl	$2, %edx
	movq	%rbx, %rsi
	movq	%r14, %rdi
	movl	$0, %eax
	call	*__snprintf_chk@GOTPCREL(%rip)
	addq	$16, %rsp
.L1:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L6:
	leaq	-1(%rbx), %r9
	pushq	%r12
	pushq	%rbp
	subl	%eax, %r9d
	leaq	.LC0(%rip), %r8
	movq	$-1, %rcx
	movl	$2, %edx
	movq	%rbx, %rsi
	movq	%r14, %rdi
	movl	$0, %eax
	call	*__snprintf_chk@GOTPCREL(%rip)
	addq	$16, %rsp
	jmp	.L1
.L7:
	subq	%r13, %rbx
	movq	%rbx, %rsi
	leaq	(%r14,%r13), %rdi
	movq	%r12, %rcx
	leaq	.LC1(%rip), %rdx
	movl	$0, %eax
	call	*snprintf@GOTPCREL(%rip)
	jmp	.L1
	.size	string_append, .-string_append
	.section	.rodata.str1.1
.LC3:
	.string	""
	.text
	.globl	read_source
	.type	read_source, @function
read_source:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %r12
	movq	%rsi, %rbp
	movl	$2, %edx
	movl	$0, %esi
	call	*fseek@GOTPCREL(%rip)
	movq	%r12, %rdi
	call	*ftell@GOTPCREL(%rip)
	movq	%rax, 0(%rbp)
	movl	$0, %edx
	movl	$0, %esi
	movq	%r12, %rdi
	call	*fseek@GOTPCREL(%rip)
	movq	0(%rbp), %rax
	leaq	1(%rax), %rsi
	leaq	.LC3(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	0(%rbp), %rdx
	movq	%r12, %rcx
	movl	$1, %esi
	movq	%rax, %rdi
	call	*fread@GOTPCREL(%rip)
	movb	$0, (%rbx,%rax)
	movq	%rax, 0(%rbp)
	testq	%rax, %rax
	je	.L8
	movl	$0, %eax
	jmp	.L11
.L10:
	addq	$1, %rax
	cmpq	0(%rbp), %rax
	jnb	.L8
.L11:
	movzbl	(%rbx,%rax), %edx
	andl	$-5, %edx
	cmpb	$9, %dl
	jne	.L10
	movb	$32, (%rbx,%rax)
	jmp	.L10
.L8:
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
	.globl	output_token
	.type	output_token, @function
output_token:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$24, %rsp
	movq	%rdi, %r12
	movq	%rsi, %rdi
	movq	%rsi, 8(%rsp)
	movl	$0, %esi
	call	*get_next_token@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L15
	movq	%rax, %rbx
	leaq	.L18(%rip), %r14
	jmp	.L33
.L25:
	movq	16(%rbx), %rax
	movq	8(%rbx), %rcx
	addq	$1, %rcx
	leaq	1(%rax), %r8
	leaq	.LC4(%rip), %rdx
	movl	$2, %esi
	movq	%r12, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L15:
	call	*get_info@GOTPCREL(%rip)
	movq	%rax, %rcx
	leaq	.LC18(%rip), %rdx
	movl	$2, %esi
	movq	%r12, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L24:
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L16:
	movq	16(%rbx), %rax
	movq	8(%rbx), %rdx
	leaq	1(%rdx), %rcx
	leaq	1(%rax), %r8
	leaq	.LC12(%rip), %rdx
	movl	$2, %esi
	movq	%r12, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	(%rbx), %rbp
	movl	$0, %ebx
	leaq	.LC14(%rip), %r15
	leaq	.LC13(%rip), %r13
	jmp	.L26
.L23:
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L16
.L22:
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L16
.L21:
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L16
.L20:
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC9(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L16
.L19:
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC10(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L16
.L17:
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L16
.L37:
	movq	%r12, %rcx
	movl	$2, %edx
	movl	$1, %esi
	movq	%r13, %rdi
	call	*fwrite@GOTPCREL(%rip)
.L28:
	addq	$1, %rbx
.L26:
	movq	%rbp, %rdi
	call	*strlen@GOTPCREL(%rip)
	cmpq	%rax, %rbx
	jnb	.L36
	movzbl	0(%rbp,%rbx), %edi
	testb	%dil, %dil
	je	.L37
	cmpb	$10, %dil
	je	.L38
	cmpb	$9, %dil
	je	.L39
	cmpb	$13, %dil
	je	.L40
	movsbl	%dil, %edi
	movq	%r12, %rsi
	call	*fputc@GOTPCREL(%rip)
	jmp	.L28
.L38:
	movq	%r12, %rcx
	movl	$2, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L28
.L39:
	movq	%r12, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L28
.L40:
	movq	%r12, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L28
.L36:
	movq	%r12, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC17(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %esi
	movq	8(%rsp), %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L15
.L33:
	cmpl	$7, 24(%rbx)
	ja	.L16
	movl	24(%rbx), %eax
	movslq	(%r14,%rax,4), %rax
	addq	%r14, %rax
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
	.size	output_token, .-output_token
	.globl	output_ast
	.type	output_ast, @function
output_ast:
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	movq	%rdx, %rbp
	movq	builtin_scope(%rip), %rsi
	call	*parse_code@GOTPCREL(%rip)
	movq	%rax, %rdi
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%rbx, %rsi
	call	*output_code@GOTPCREL(%rip)
	call	*get_info@GOTPCREL(%rip)
	movq	%rax, %rcx
	leaq	.LC18(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
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
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$16, %rsp
	movl	%esi, %r14d
	movl	%edx, %r13d
	call	*create_file@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	$0, 8(%rsp)
	leaq	.LC19(%rip), %rsi
	movq	%rax, %rdi
	call	*fopen@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L51
	movq	%rax, %rbx
	leaq	8(%rsp), %rsi
	movq	%rax, %rdi
	call	read_source
	movq	%rax, %r12
	movq	%rbx, %rdi
	call	*fclose@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movq	%r12, %rdi
	call	*create_lexer@GOTPCREL(%rip)
	movq	%rax, %rbx
	testb	%r14b, %r14b
	jne	.L52
.L46:
	movq	%rbx, %rdi
	call	*reset_lexer@GOTPCREL(%rip)
	call	*create_parser@GOTPCREL(%rip)
	movq	%rax, %r12
	testb	%r13b, %r13b
	jne	.L53
.L43:
	addq	$16, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L51:
	movq	%r12, %rcx
	leaq	.LC20(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L43
.L52:
	movl	$6, %esi
	leaq	.LC21(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbp, %rdi
	call	*change_file_extension@GOTPCREL(%rip)
	movq	%rbp, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %r14
	leaq	.LC22(%rip), %rsi
	movq	%rax, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L54
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	output_token
	movq	%r12, %rdi
	call	*fclose@GOTPCREL(%rip)
	jmp	.L46
.L54:
	movq	%r14, %rcx
	leaq	.LC23(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L46
.L53:
	movl	$4, %esi
	leaq	.LC24(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbp, %rdi
	call	*change_file_extension@GOTPCREL(%rip)
	movq	%rbp, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %r13
	leaq	.LC22(%rip), %rsi
	movq	%rax, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L55
	movq	%r12, %rdx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	output_ast
	movq	%rbp, %rdi
	call	*fclose@GOTPCREL(%rip)
	jmp	.L43
.L55:
	movq	%r13, %rcx
	leaq	.LC23(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L43
	.size	parse_file, .-parse_file
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
