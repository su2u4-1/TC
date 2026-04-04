	.file	"compiler.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
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
	leaq	.LC0(%rip), %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	0(%rbp), %rdx
	movq	%r12, %rcx
	movl	$1, %esi
	movq	%rax, %rdi
	call	*fread@GOTPCREL(%rip)
	movb	$0, (%rbx,%rax)
	movq	%rax, 0(%rbp)
	testq	%rax, %rax
	je	.L1
	movl	$0, %eax
	jmp	.L4
.L3:
	addq	$1, %rax
	cmpq	0(%rbp), %rax
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
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	read_source, .-read_source
	.section	.rodata.str1.8,"aMS",@progbits,1
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
	.section	.rodata.str1.1
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %r13
	movq	%rsi, %r12
	cmpl	$7, 24(%rsi)
	ja	.L8
	movl	24(%rsi), %eax
	leaq	.L10(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
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
	movq	16(%rsi), %rax
	movq	8(%rsi), %rcx
	addq	$1, %rcx
	leaq	1(%rax), %r8
	leaq	.LC1(%rip), %rdx
	movl	$2, %esi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L7
.L16:
	movq	16(%rsi), %rax
	movq	8(%rsi), %rcx
	addq	$1, %rcx
	leaq	1(%rax), %r8
	leaq	.LC2(%rip), %rdx
	movl	$2, %esi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L8:
	movl	$0, %ebx
	leaq	.LC12(%rip), %r15
	leaq	.LC9(%rip), %r14
	jmp	.L19
.L15:
	movq	16(%rsi), %rax
	movq	8(%rsi), %rcx
	addq	$1, %rcx
	leaq	1(%rax), %r8
	leaq	.LC3(%rip), %rdx
	movl	$2, %esi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L8
.L14:
	movq	16(%rsi), %rax
	movq	8(%rsi), %rcx
	addq	$1, %rcx
	leaq	1(%rax), %r8
	leaq	.LC4(%rip), %rdx
	movl	$2, %esi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L8
.L13:
	movq	16(%rsi), %rax
	movq	8(%rsi), %rcx
	addq	$1, %rcx
	leaq	1(%rax), %r8
	leaq	.LC5(%rip), %rdx
	movl	$2, %esi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L8
.L12:
	movq	16(%rsi), %rax
	movq	8(%rsi), %rcx
	addq	$1, %rcx
	leaq	1(%rax), %r8
	leaq	.LC6(%rip), %rdx
	movl	$2, %esi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L8
.L11:
	movq	16(%rsi), %rax
	movq	8(%rsi), %rcx
	addq	$1, %rcx
	leaq	1(%rax), %r8
	leaq	.LC7(%rip), %rdx
	movl	$2, %esi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L8
.L9:
	movq	16(%rsi), %rax
	movq	8(%rsi), %rcx
	addq	$1, %rcx
	leaq	1(%rax), %r8
	leaq	.LC8(%rip), %rdx
	movl	$2, %esi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L8
.L28:
	movq	%r13, %rcx
	movl	$2, %edx
	movl	$1, %esi
	movq	%r14, %rdi
	call	*fwrite@GOTPCREL(%rip)
.L21:
	addq	$1, %rbx
.L19:
	movq	(%r12), %rbp
	movq	%rbp, %rdi
	call	*strlen@GOTPCREL(%rip)
	cmpq	%rax, %rbx
	jnb	.L27
	movzbl	0(%rbp,%rbx), %edi
	testb	%dil, %dil
	je	.L28
	cmpb	$10, %dil
	je	.L29
	cmpb	$9, %dil
	je	.L30
	cmpb	$13, %dil
	je	.L31
	movsbl	%dil, %edi
	movq	%r13, %rsi
	call	*fputc@GOTPCREL(%rip)
	jmp	.L21
.L29:
	movq	%r13, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC10(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L21
.L30:
	movq	%r13, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L21
.L31:
	movq	%r13, %rcx
	movl	$2, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L21
.L27:
	movq	%r13, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC13(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L7:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	output_one_token, .-output_one_token
	.section	.rodata.str1.1
.LC14:
	.string	"\ninfo by lib:\n    %s\n"
	.text
	.globl	output_token
	.type	output_token, @function
output_token:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbp
	movq	%rsi, %r12
	movl	$0, %esi
	movq	%r12, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L33
.L34:
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	output_one_token
	cmpl	$0, 24(%rbx)
	je	.L33
	movl	$0, %esi
	movq	%r12, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L34
.L33:
	call	*get_info@GOTPCREL(%rip)
	movq	%rax, %rcx
	leaq	.LC14(%rip), %rdx
	movl	$2, %esi
	movq	%rbp, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	output_token, .-output_token
	.globl	output_ast
	.type	output_ast, @function
output_ast:
	pushq	%rbx
	subq	$32, %rsp
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	movq	%rsp, %rcx
	movl	$0, %edx
	movq	%rbx, %rsi
	call	*output_code@GOTPCREL(%rip)
	call	*get_info@GOTPCREL(%rip)
	movq	%rax, %rcx
	leaq	.LC14(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	addq	$32, %rsp
	popq	%rbx
	ret
	.size	output_ast, .-output_ast
	.globl	output_tac
	.type	output_tac, @function
output_tac:
	pushq	%rbx
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	movl	$0, %edx
	movq	%rbx, %rsi
	call	*output_TAC@GOTPCREL(%rip)
	call	*get_info@GOTPCREL(%rip)
	movq	%rax, %rcx
	leaq	.LC14(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	popq	%rbx
	ret
	.size	output_tac, .-output_tac
	.section	.rodata.str1.1
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
.LC22:
	.string	".tac"
	.text
	.globl	parse_file
	.type	parse_file, @function
parse_file:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$24, %rsp
	movl	%esi, %r14d
	movl	%edx, %r13d
	movl	%ecx, %r12d
	call	*create_file@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %r15
	movq	$0, 8(%rsp)
	leaq	.LC15(%rip), %rsi
	movq	%rax, %rdi
	call	*fopen@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L51
	movq	%rax, %rbp
	leaq	8(%rsp), %rsi
	movq	%rax, %rdi
	call	read_source
	movq	%rax, %r15
	movq	%rbp, %rdi
	call	*fclose@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movq	%r15, %rdi
	call	*create_lexer@GOTPCREL(%rip)
	movq	%rax, %rbp
	testb	%r14b, %r14b
	jne	.L52
.L44:
	movq	%rbp, %rdi
	call	*reset_lexer@GOTPCREL(%rip)
	movq	%rbx, %rdi
	call	*create_parser@GOTPCREL(%rip)
	movl	%r12d, %ecx
	orb	%r13b, %cl
	jne	.L53
.L41:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L51:
	movq	%r15, %rcx
	leaq	.LC16(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L41
.L52:
	movl	$6, %esi
	leaq	.LC17(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	*change_file_extension@GOTPCREL(%rip)
	movq	%rbx, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %r15
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L54
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	output_token
	movq	%r14, %rdi
	call	*fclose@GOTPCREL(%rip)
	jmp	.L44
.L54:
	movq	%r15, %rcx
	leaq	.LC19(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L44
.L53:
	movq	%rax, %rdx
	movq	builtin_scope(%rip), %rsi
	movq	%rbp, %rdi
	call	*parse_code@GOTPCREL(%rip)
	movq	%rax, %rbp
	testb	%r13b, %r13b
	jne	.L55
.L47:
	testb	%r12b, %r12b
	je	.L41
	movl	$4, %esi
	leaq	.LC22(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	*change_file_extension@GOTPCREL(%rip)
	movq	%rbx, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %r12
	movl	$3, %esi
	leaq	.LC21(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	*change_file_extension@GOTPCREL(%rip)
	leaq	.LC18(%rip), %rsi
	movq	%r12, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L56
	movq	%rbp, %rdi
	call	*tac_code@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	output_tac
	movq	%rbx, %rdi
	call	*fclose@GOTPCREL(%rip)
	jmp	.L41
.L55:
	movl	$4, %esi
	leaq	.LC20(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	*change_file_extension@GOTPCREL(%rip)
	movq	%rbx, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %r14
	movl	$3, %esi
	leaq	.LC21(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	*change_file_extension@GOTPCREL(%rip)
	leaq	.LC18(%rip), %rsi
	movq	%r14, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L57
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	output_ast
	movq	%r13, %rdi
	call	*fclose@GOTPCREL(%rip)
	jmp	.L47
.L57:
	movq	%r14, %rcx
	leaq	.LC19(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L47
.L56:
	movq	%r12, %rcx
	leaq	.LC19(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L41
	.size	parse_file, .-parse_file
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
