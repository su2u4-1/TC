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
	leaq	.LC0(%rip), %rdi
	leaq	1(%rax), %rsi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	0(%rbp), %rdx
	movq	%r12, %rcx
	movl	$1, %esi
	movq	%rax, %rbx
	movq	%rax, %rdi
	call	*fread@GOTPCREL(%rip)
	movb	$0, (%rbx,%rax)
	movq	%rax, 0(%rbp)
	xorl	%eax, %eax
.L2:
	cmpq	0(%rbp), %rax
	jnb	.L7
	movb	(%rbx,%rax), %dl
	andl	$-5, %edx
	cmpb	$9, %dl
	jne	.L3
	movb	$32, (%rbx,%rax)
.L3:
	incq	%rax
	jmp	.L2
.L7:
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	read_source, .-read_source
	.section	.rodata.str1.1
.LC1:
	.string	"Token(Type: EOF,         Line: %zu, Column: %zu)\n"
.LC2:
	.string	"Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '"
.LC3:
	.string	"Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '"
.LC4:
	.string	"Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '"
.LC5:
	.string	"Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '"
.LC6:
	.string	"Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '"
.LC7:
	.string	"Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '"
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
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	cmpl	$7, 24(%rsi)
	movq	%rdi, %rbx
	ja	.L9
	movl	24(%rsi), %edx
	leaq	.L11(%rip), %rax
	movq	8(%rsi), %rcx
	movslq	(%rax,%rdx,4), %rdx
	incq	%rcx
	addq	%rax, %rdx
	movq	16(%rsi), %rax
	leaq	1(%rax), %r8
	jmp	*%rdx
	.section	.rodata
	.align 4
	.align 4
.L11:
	.long	.L18-.L11
	.long	.L17-.L11
	.long	.L16-.L11
	.long	.L15-.L11
	.long	.L14-.L11
	.long	.L13-.L11
	.long	.L12-.L11
	.long	.L10-.L11
	.text
.L18:
	popq	%rbx
	leaq	.LC1(%rip), %rdx
	popq	%rbp
	movl	$2, %esi
	popq	%r12
	xorl	%eax, %eax
	popq	%r13
	popq	%r14
	jmp	*__fprintf_chk@GOTPCREL(%rip)
.L17:
	leaq	.LC2(%rip), %rdx
	jmp	.L27
.L16:
	leaq	.LC3(%rip), %rdx
.L27:
	movl	$2, %esi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L9:
	xorl	%r12d, %r12d
	leaq	.LC12(%rip), %r13
	jmp	.L19
.L15:
	leaq	.LC4(%rip), %rdx
	jmp	.L27
.L14:
	leaq	.LC5(%rip), %rdx
	jmp	.L27
.L13:
	leaq	.LC6(%rip), %rdx
	jmp	.L27
.L12:
	leaq	.LC7(%rip), %rdx
	jmp	.L27
.L10:
	leaq	.LC8(%rip), %rdx
	jmp	.L27
.L25:
	movsbl	(%r14,%r12), %edi
	movq	%rbx, %rsi
	testb	%dil, %dil
	jne	.L20
	leaq	.LC9(%rip), %rdi
.L28:
	call	*fputs@GOTPCREL(%rip)
.L21:
	incq	%r12
.L19:
	movq	0(%rbp), %r14
	movq	%r14, %rdi
	call	*strlen@GOTPCREL(%rip)
	cmpq	%rax, %r12
	jb	.L25
	jmp	.L29
.L20:
	cmpb	$10, %dil
	jne	.L22
	leaq	.LC10(%rip), %rdi
	jmp	.L28
.L22:
	cmpb	$9, %dil
	jne	.L23
	leaq	.LC11(%rip), %rdi
	jmp	.L28
.L23:
	cmpb	$13, %dil
	jne	.L24
	movq	%r13, %rdi
	jmp	.L28
.L24:
	call	*fputc@GOTPCREL(%rip)
	jmp	.L21
.L29:
	movq	%rbx, %rsi
	leaq	.LC13(%rip), %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	*fputs@GOTPCREL(%rip)
	.size	output_one_token, .-output_one_token
	.section	.rodata.str1.1
.LC14:
	.string	"\ninfo by lib:\n    %s\n"
	.text
	.globl	output_token
	.type	output_token, @function
output_token:
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
.L32:
	xorl	%esi, %esi
	movq	%r12, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L34
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	output_one_token
	cmpl	$0, 24(%rbx)
	jne	.L32
.L34:
	call	*get_info@GOTPCREL(%rip)
	popq	%rbx
	movq	%rbp, %rdi
	leaq	.LC14(%rip), %rdx
	movq	%rax, %rcx
	popq	%rbp
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%r12
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.size	output_token, .-output_token
	.globl	output_ast
	.type	output_ast, @function
output_ast:
	pushq	%rbx
	movq	%rdi, %rbx
	xorl	%edx, %edx
	movq	%rsi, %rdi
	movq	%rbx, %rsi
	subq	$32, %rsp
	movq	%rsp, %rcx
	call	*output_code@GOTPCREL(%rip)
	call	*get_info@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movl	$2, %esi
	leaq	.LC14(%rip), %rdx
	movq	%rax, %rcx
	xorl	%eax, %eax
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
	xorl	%edx, %edx
	movq	%rsi, %rdi
	movq	%rbx, %rsi
	call	*output_TAC@GOTPCREL(%rip)
	call	*get_info@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movl	$2, %esi
	popq	%rbx
	movq	%rax, %rcx
	leaq	.LC14(%rip), %rdx
	xorl	%eax, %eax
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.size	output_tac, .-output_tac
	.section	.rodata.str1.1
.LC15:
	.string	"r"
.LC16:
	.string	"Error opening file: %s\n"
.LC17:
	.string	".token"
.LC18:
	.string	"w"
.LC19:
	.string	".ast"
.LC20:
	.string	".tc"
.LC21:
	.string	".tac"
	.text
	.globl	parse_file
	.type	parse_file, @function
parse_file:
	pushq	%r15
	pushq	%r14
	movl	%edx, %r14d
	pushq	%r13
	movl	%ecx, %r13d
	pushq	%r12
	movl	%esi, %r12d
	pushq	%rbp
	pushq	%rbx
	subq	$40, %rsp
	call	*create_file@GOTPCREL(%rip)
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	*get_full_path@GOTPCREL(%rip)
	xorl	%edx, %edx
	leaq	.LC15(%rip), %rsi
	movq	%rdx, 24(%rsp)
	movq	%rax, %rbp
	movq	%rax, %rdi
	call	*fopen@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L51
	leaq	24(%rsp), %rsi
	movq	%rax, %rdi
	movq	%rax, 8(%rsp)
	call	read_source
	movq	8(%rsp), %rdi
	movq	%rax, %r15
	call	*fclose@GOTPCREL(%rip)
	movq	%rbp, %rdx
	movq	24(%rsp), %rsi
	movq	%r15, %rdi
	call	*create_lexer@GOTPCREL(%rip)
	movq	%rax, %rbp
	testb	%r12b, %r12b
	je	.L42
	movl	$6, %esi
	leaq	.LC17(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, %rsi
	call	*change_file_extension@GOTPCREL(%rip)
	movq	%rbx, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	leaq	.LC18(%rip), %rsi
	movq	%rax, %r15
	movq	%rax, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L43
	movq	stderr(%rip), %rdi
	movq	%r15, %rcx
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC16(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L42
.L43:
	movq	%rax, %rdi
	movq	%rbp, %rsi
	call	output_token
	movq	%r12, %rdi
	call	*fclose@GOTPCREL(%rip)
.L42:
	movq	%rbp, %rdi
	call	*reset_lexer@GOTPCREL(%rip)
	movq	%rbx, %rdi
	call	*create_parser@GOTPCREL(%rip)
	movq	%rax, %rdx
	movl	%r13d, %eax
	orb	%r14b, %al
	je	.L40
	movq	builtin_scope(%rip), %rsi
	movq	%rbp, %rdi
	call	*parse_code@GOTPCREL(%rip)
	movq	%rax, %r12
	testb	%r14b, %r14b
	je	.L46
	movl	$4, %esi
	leaq	.LC19(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, %rsi
	call	*change_file_extension@GOTPCREL(%rip)
	movq	%rbx, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movl	$3, %esi
	leaq	.LC20(%rip), %rdi
	movq	%rax, %r14
	call	*create_string@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, %rsi
	call	*change_file_extension@GOTPCREL(%rip)
	leaq	.LC18(%rip), %rsi
	movq	%r14, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L47
	movq	stderr(%rip), %rdi
	movq	%r14, %rcx
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC16(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L46
.L47:
	movq	%rax, %rdi
	movq	%r12, %rsi
	call	output_ast
	movq	%rbp, %rdi
	call	*fclose@GOTPCREL(%rip)
.L46:
	testb	%r13b, %r13b
	je	.L40
	movl	$4, %esi
	leaq	.LC21(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, %rsi
	call	*change_file_extension@GOTPCREL(%rip)
	movq	%rbx, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movl	$3, %esi
	leaq	.LC20(%rip), %rdi
	movq	%rax, %rbp
	call	*create_string@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, %rsi
	call	*change_file_extension@GOTPCREL(%rip)
	leaq	.LC18(%rip), %rsi
	movq	%rbp, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L49
.L51:
	movq	stderr(%rip), %rdi
	addq	$40, %rsp
	movq	%rbp, %rcx
	xorl	%eax, %eax
	popq	%rbx
	leaq	.LC16(%rip), %rdx
	popq	%rbp
	movl	$2, %esi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*__fprintf_chk@GOTPCREL(%rip)
.L49:
	movq	%r12, %rdi
	call	*tac_code@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, %rsi
	call	output_tac
	addq	$40, %rsp
	movq	%rbx, %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*fclose@GOTPCREL(%rip)
.L40:
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	parse_file, .-parse_file
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
