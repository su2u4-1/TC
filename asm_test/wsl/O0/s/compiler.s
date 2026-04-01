	.file	"compiler.c"
	.text
	.section	.rodata
.LC0:
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
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
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
	jmp	.L2
.L5:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$13, %al
	je	.L3
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$9, %al
	jne	.L4
.L3:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$32, (%rax)
.L4:
	addq	$1, -8(%rbp)
.L2:
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, -8(%rbp)
	jb	.L5
	movq	-16(%rbp), %rax
	leave
	ret
	.size	read_source, .-read_source
	.section	.rodata
	.align 8
.LC1:
	.string	"Token(Type: EOF,         Line: %zu, Column: %zu)\n"
	.align 8
.LC2:
	.string	"Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '"
	.align 8
.LC3:
	.string	"Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '"
	.align 8
.LC4:
	.string	"Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '"
	.align 8
.LC5:
	.string	"Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '"
	.align 8
.LC6:
	.string	"Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '"
	.align 8
.LC7:
	.string	"Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '"
	.align 8
.LC8:
	.string	"Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '"
.LC9:
	.string	"\\0"
.LC10:
	.string	"\\n"
.LC11:
	.string	"\\t"
.LC12:
	.string	"\\r"
.LC13:
	.string	"'\n"
	.text
	.globl	output_one_token
	.type	output_one_token, @function
output_one_token:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	jne	.L8
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-24(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L7
.L8:
	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	jne	.L10
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-24(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L11
.L10:
	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$2, %eax
	jne	.L12
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-24(%rbp), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L11
.L12:
	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$3, %eax
	jne	.L13
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-24(%rbp), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L11
.L13:
	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$4, %eax
	jne	.L14
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-24(%rbp), %rax
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L11
.L14:
	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L15
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-24(%rbp), %rax
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L11
.L15:
	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L16
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-24(%rbp), %rax
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L11
.L16:
	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$7, %eax
	jne	.L11
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-24(%rbp), %rax
	leaq	.LC8(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
.L11:
	movq	$0, -8(%rbp)
	jmp	.L17
.L23:
	movq	-32(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -9(%rbp)
	cmpb	$0, -9(%rbp)
	jne	.L18
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L19
.L18:
	cmpb	$10, -9(%rbp)
	jne	.L20
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L19
.L20:
	cmpb	$9, -9(%rbp)
	jne	.L21
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L19
.L21:
	cmpb	$13, -9(%rbp)
	jne	.L22
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L19
.L22:
	movsbl	-9(%rbp), %eax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	*fputc@GOTPCREL(%rip)
.L19:
	addq	$1, -8(%rbp)
.L17:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	cmpq	%rax, -8(%rbp)
	jb	.L23
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
.L7:
	leave
	ret
	.size	output_one_token, .-output_one_token
	.section	.rodata
.LC14:
	.string	"\ninfo by lib:\n    %s\n"
	.text
	.globl	output_token
	.type	output_token, @function
output_token:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	jmp	.L25
.L28:
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	output_one_token
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	je	.L29
	movq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
.L25:
	cmpq	$0, -8(%rbp)
	jne	.L28
	jmp	.L27
.L29:
	nop
.L27:
	call	*get_info@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	leaq	.LC14(%rip), %rcx
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
	leaq	.LC14(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	nop
	leave
	ret
	.size	output_ast, .-output_ast
	.section	.rodata
.LC15:
	.string	"r"
.LC16:
	.string	"Error opening file: %s"
.LC17:
	.string	".token"
.LC18:
	.string	"w"
.LC19:
	.string	"Error opening file: %s\n"
.LC20:
	.string	".ast"
.LC21:
	.string	".tc"
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
	leaq	.LC15(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L32
	movq	stderr(%rip), %rax
	movq	-16(%rbp), %rdx
	leaq	.LC16(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L31
.L32:
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
	je	.L34
	movl	$6, %esi
	leaq	.LC17(%rip), %rax
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
	leaq	.LC18(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L35
	movq	stderr(%rip), %rax
	movq	-48(%rbp), %rdx
	leaq	.LC19(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L34
.L35:
	movq	-40(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	output_token
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	*fclose@GOTPCREL(%rip)
.L34:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	*reset_lexer@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	*create_parser@GOTPCREL(%rip)
	movq	%rax, -64(%rbp)
	cmpb	$0, -112(%rbp)
	je	.L31
	movl	$4, %esi
	leaq	.LC20(%rip), %rax
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
	movl	$3, %esi
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*change_file_extension@GOTPCREL(%rip)
	movq	-72(%rbp), %rax
	leaq	.LC18(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	jne	.L37
	movq	stderr(%rip), %rax
	movq	-72(%rbp), %rdx
	leaq	.LC19(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L31
.L37:
	movq	-64(%rbp), %rdx
	movq	-40(%rbp), %rcx
	movq	-80(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	output_ast
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	*fclose@GOTPCREL(%rip)
.L31:
	leave
	ret
	.size	parse_file, .-parse_file
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
