	.file	"compiler.c"
	.text
	.section	.rodata
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
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%rcx, -64(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	cmpq	-48(%rbp), %rax
	jb	.L2
	movq	-48(%rbp), %rax
	subq	-16(%rbp), %rax
	subq	$1, %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	%eax, %edi
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	-40(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	%edi, %ecx
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rdi
	movl	$0, %eax
	call	*snprintf@GOTPCREL(%rip)
	jmp	.L5
.L2:
	movq	-56(%rbp), %rax
	cmpq	-40(%rbp), %rax
	jne	.L4
	movq	-48(%rbp), %rax
	subq	-8(%rbp), %rax
	movq	-40(%rbp), %rcx
	movq	-8(%rbp), %rdx
	leaq	(%rcx,%rdx), %rdi
	movq	-64(%rbp), %rdx
	movq	%rdx, %rcx
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rsi
	movl	$0, %eax
	call	*snprintf@GOTPCREL(%rip)
	jmp	.L5
.L4:
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	-40(%rbp), %rax
	movq	%rcx, %r8
	movq	%rdx, %rcx
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rdi
	movl	$0, %eax
	call	*snprintf@GOTPCREL(%rip)
.L5:
	nop
	leave
	ret
	.size	string_append, .-string_append
	.section	.rodata
.LC3:
	.string	""
	.text
	.globl	read_source
	.type	read_source, @function
read_source:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-40(%rbp), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	*fseek@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	*ftell@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-40(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	*fseek@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	movq	-40(%rbp), %rcx
	movq	-16(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*fread@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-48(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	$0, -8(%rbp)
	jmp	.L7
.L10:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$13, %al
	je	.L8
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$9, %al
	jne	.L9
.L8:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$32, (%rax)
.L9:
	addq	$1, -8(%rbp)
.L7:
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, -8(%rbp)
	jb	.L10
	movq	-16(%rbp), %rax
	leave
	ret
	.size	read_source, .-read_source
	.section	.rodata
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
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	-64(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	jmp	.L13
.L30:
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	jne	.L14
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-56(%rbp), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L15
.L14:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	jne	.L16
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L17
.L16:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$2, %eax
	jne	.L18
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L17
.L18:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$3, %eax
	jne	.L19
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L17
.L19:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$4, %eax
	jne	.L20
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L17
.L20:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L21
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L17
.L21:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L22
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L17
.L22:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$7, %eax
	jne	.L17
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
.L17:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-56(%rbp), %rax
	leaq	.LC12(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L23
.L29:
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -33(%rbp)
	cmpb	$0, -33(%rbp)
	jne	.L24
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L25
.L24:
	cmpb	$10, -33(%rbp)
	jne	.L26
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L25
.L26:
	cmpb	$9, -33(%rbp)
	jne	.L27
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L25
.L27:
	cmpb	$13, -33(%rbp)
	jne	.L28
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L25
.L28:
	movsbl	-33(%rbp), %eax
	movq	-56(%rbp), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	*fputc@GOTPCREL(%rip)
.L25:
	addq	$1, -16(%rbp)
.L23:
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	cmpq	%rax, -16(%rbp)
	jb	.L29
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-64(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
.L13:
	cmpq	$0, -8(%rbp)
	jne	.L30
.L15:
	call	*get_info@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	leaq	.LC18(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	nop
	leave
	ret
	.size	output_token, .-output_token
	.globl	output_ast
	.type	output_ast, @function
output_ast:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	builtin_scope(%rip), %rcx
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	*parse_code@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-40(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-8(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*output_code@GOTPCREL(%rip)
	call	*get_info@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	leaq	.LC18(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	nop
	leave
	ret
	.size	output_ast, .-output_ast
	.section	.rodata
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
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$112, %rsp
	movq	%rdi, -104(%rbp)
	movl	%esi, %ecx
	movl	%edx, %eax
	movl	%ecx, %edx
	movb	%dl, -108(%rbp)
	movb	%al, -112(%rbp)
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	*create_file@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	movq	$0, -88(%rbp)
	movq	-16(%rbp), %rax
	leaq	.LC19(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L33
	movq	stderr(%rip), %rax
	movq	-16(%rbp), %rdx
	leaq	.LC20(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L32
.L33:
	leaq	-88(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	read_source
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	*fclose@GOTPCREL(%rip)
	movq	-88(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*create_lexer@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	cmpb	$0, -108(%rbp)
	je	.L35
	movl	$6, %esi
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*change_file_extension@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	leaq	.LC22(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L36
	movq	stderr(%rip), %rax
	movq	-48(%rbp), %rdx
	leaq	.LC23(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L35
.L36:
	movq	-40(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	output_token
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	*fclose@GOTPCREL(%rip)
.L35:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	*reset_lexer@GOTPCREL(%rip)
	call	*create_parser@GOTPCREL(%rip)
	movq	%rax, -64(%rbp)
	cmpb	$0, -112(%rbp)
	je	.L32
	movl	$4, %esi
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*change_file_extension@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	leaq	.LC22(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	jne	.L38
	movq	stderr(%rip), %rax
	movq	-72(%rbp), %rdx
	leaq	.LC23(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L32
.L38:
	movq	-64(%rbp), %rdx
	movq	-40(%rbp), %rcx
	movq	-80(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	output_ast
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	*fclose@GOTPCREL(%rip)
.L32:
	leave
	ret
	.size	parse_file, .-parse_file
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
