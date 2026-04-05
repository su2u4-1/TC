	.file	"compiler.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
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
	leaq	.LC0(%rip), %rdi
	leaq	1(%rax), %rsi
	call	*create_string_not_check@GOTPCREL(%rip)
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
	je	.L1
	.p2align 4,,10
	.p2align 3
.L2:
	movzbl	(%rbx,%rdx), %ecx
	andl	$-5, %ecx
	cmpb	$9, %cl
	jne	.L3
	movb	$32, (%rbx,%rdx)
	movq	0(%rbp), %rax
	addq	$1, %rdx
	cmpq	%rax, %rdx
	jb	.L2
.L1:
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L3:
	addq	$1, %rdx
	cmpq	%rax, %rdx
	jb	.L2
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
	.p2align 4
	.globl	output_one_token
	.type	output_one_token, @function
output_one_token:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	subq	$8, %rsp
	cmpl	$7, 24(%rsi)
	ja	.L11
	movl	24(%rsi), %eax
	leaq	.L13(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
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
	.p2align 4,,10
	.p2align 3
.L18:
	movq	16(%rsi), %rax
	movq	8(%rsi), %rcx
	leaq	.LC3(%rip), %rdx
	movl	$2, %esi
	leaq	1(%rax), %r8
	addq	$1, %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L11:
	xorl	%ebx, %ebx
	leaq	.LC12(%rip), %r14
	leaq	.LC9(%rip), %r13
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L22:
	cmpb	$10, %dil
	je	.L29
	cmpb	$9, %dil
	je	.L30
	cmpb	$13, %dil
	je	.L31
	movq	%r12, %rsi
	call	*fputc@GOTPCREL(%rip)
.L23:
	addq	$1, %rbx
.L21:
	movq	0(%rbp), %r15
	movq	%r15, %rdi
	call	*strlen@GOTPCREL(%rip)
	cmpq	%rax, %rbx
	jnb	.L32
	movsbl	(%r15,%rbx), %edi
	testb	%dil, %dil
	jne	.L22
	movq	%r12, %rcx
	movl	$2, %edx
	movl	$1, %esi
	movq	%r13, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L31:
	movq	%r12, %rcx
	movl	$2, %edx
	movl	$1, %esi
	movq	%r14, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L29:
	movq	%r12, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC10(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L32:
	addq	$8, %rsp
	movq	%r12, %rcx
	movl	$2, %edx
	movl	$1, %esi
	popq	%rbx
	leaq	.LC13(%rip), %rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*fwrite@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L30:
	movq	%r12, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L14:
	movq	16(%rsi), %rax
	movq	8(%rsi), %rcx
	leaq	.LC7(%rip), %rdx
	movl	$2, %esi
	leaq	1(%rax), %r8
	addq	$1, %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L12:
	movq	16(%rsi), %rax
	movq	8(%rsi), %rcx
	leaq	.LC8(%rip), %rdx
	movl	$2, %esi
	leaq	1(%rax), %r8
	addq	$1, %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L20:
	movq	16(%rsi), %rax
	movq	8(%rsi), %rcx
	addq	$8, %rsp
	leaq	.LC1(%rip), %rdx
	popq	%rbx
	movl	$2, %esi
	popq	%rbp
	leaq	1(%rax), %r8
	popq	%r12
	addq	$1, %rcx
	popq	%r13
	xorl	%eax, %eax
	popq	%r14
	popq	%r15
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L19:
	movq	16(%rsi), %rax
	movq	8(%rsi), %rcx
	leaq	.LC2(%rip), %rdx
	movl	$2, %esi
	leaq	1(%rax), %r8
	addq	$1, %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L17:
	movq	16(%rsi), %rax
	movq	8(%rsi), %rcx
	leaq	.LC4(%rip), %rdx
	movl	$2, %esi
	leaq	1(%rax), %r8
	addq	$1, %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L16:
	movq	16(%rsi), %rax
	movq	8(%rsi), %rcx
	leaq	.LC5(%rip), %rdx
	movl	$2, %esi
	leaq	1(%rax), %r8
	addq	$1, %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L15:
	movq	16(%rsi), %rax
	movq	8(%rsi), %rcx
	leaq	.LC6(%rip), %rdx
	movl	$2, %esi
	leaq	1(%rax), %r8
	addq	$1, %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L11
	.size	output_one_token, .-output_one_token
	.section	.rodata.str1.1
.LC14:
	.string	"\ninfo by lib:\n    %s\n"
	.text
	.p2align 4
	.globl	output_token
	.type	output_token, @function
output_token:
	pushq	%r12
	movq	%rsi, %r12
	xorl	%esi, %esi
	pushq	%rbp
	movq	%rdi, %rbp
	movq	%r12, %rdi
	pushq	%rbx
	call	*get_next_token@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L34
	movq	%rax, %rbx
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L41:
	xorl	%esi, %esi
	movq	%r12, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L34
.L35:
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	output_one_token
	movl	24(%rbx), %eax
	testl	%eax, %eax
	jne	.L41
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
	.p2align 4
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
	.p2align 4
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
	.p2align 4
	.globl	parse_file
	.type	parse_file, @function
parse_file:
	pushq	%r15
	movl	%edx, %r15d
	pushq	%r14
	movl	%ecx, %r14d
	pushq	%r13
	movl	%esi, %r13d
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$56, %rsp
	call	*create_file@GOTPCREL(%rip)
	movq	%rax, %rdi
	movq	%rax, %r12
	call	*get_full_path@GOTPCREL(%rip)
	leaq	.LC15(%rip), %rsi
	movq	$0, 8(%rsp)
	movq	%rax, %rbp
	movq	%rax, %rdi
	call	*fopen@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L64
	leaq	8(%rsp), %rsi
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	read_source
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	*fclose@GOTPCREL(%rip)
	movq	%rbp, %rdi
	movq	8(%rsp), %rsi
	call	*create_lexer@GOTPCREL(%rip)
	movq	%rax, %rbp
	testb	%r13b, %r13b
	jne	.L65
.L48:
	movq	%rbp, %rdi
	call	*reset_lexer@GOTPCREL(%rip)
	movq	%r12, %rdi
	call	*create_parser@GOTPCREL(%rip)
	movl	%r14d, %ecx
	orb	%r15b, %cl
	jne	.L66
.L46:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L65:
	movl	$6, %esi
	leaq	.LC17(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	*change_file_extension@GOTPCREL(%rip)
	movq	%r12, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rbx
	movq	%rax, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L49
	jmp	.L67
	.p2align 4,,10
	.p2align 3
.L68:
	movq	%rax, %rsi
	movq	%r13, %rdi
	call	output_one_token
	movl	24(%rbx), %eax
	testl	%eax, %eax
	je	.L50
.L49:
	xorl	%esi, %esi
	movq	%rbp, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L68
.L50:
	call	*get_info@GOTPCREL(%rip)
	movq	%r13, %rdi
	movl	$2, %esi
	leaq	.LC14(%rip), %rdx
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	%r13, %rdi
	call	*fclose@GOTPCREL(%rip)
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L66:
	movq	%rbp, %rdi
	movq	builtin_scope(%rip), %rsi
	movq	%rax, %rdx
	call	*parse_code@GOTPCREL(%rip)
	movq	%rax, %rbp
	testb	%r15b, %r15b
	jne	.L69
.L54:
	testb	%r14b, %r14b
	je	.L46
	movl	$4, %esi
	leaq	.LC22(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	*change_file_extension@GOTPCREL(%rip)
	movq	%r12, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movl	$3, %esi
	leaq	.LC21(%rip), %rdi
	movq	%rax, %r13
	call	*create_string@GOTPCREL(%rip)
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	*change_file_extension@GOTPCREL(%rip)
	leaq	.LC18(%rip), %rsi
	movq	%r13, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L70
	movq	%rbp, %rdi
	call	*tac_code@GOTPCREL(%rip)
	movq	%rbx, %rsi
	xorl	%edx, %edx
	movq	%rax, %rdi
	call	*output_TAC@GOTPCREL(%rip)
	call	*get_info@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movl	$2, %esi
	leaq	.LC14(%rip), %rdx
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	addq	$56, %rsp
	movq	%rbx, %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*fclose@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L69:
	movl	$4, %esi
	leaq	.LC20(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	*change_file_extension@GOTPCREL(%rip)
	movq	%r12, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movl	$3, %esi
	leaq	.LC21(%rip), %rdi
	movq	%rax, %r13
	call	*create_string@GOTPCREL(%rip)
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	*change_file_extension@GOTPCREL(%rip)
	leaq	.LC18(%rip), %rsi
	movq	%r13, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L71
	leaq	16(%rsp), %rcx
	xorl	%edx, %edx
	movq	%rbp, %rdi
	movq	%rax, %rsi
	call	*output_code@GOTPCREL(%rip)
	call	*get_info@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movl	$2, %esi
	leaq	.LC14(%rip), %rdx
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	%rbx, %rdi
	call	*fclose@GOTPCREL(%rip)
	jmp	.L54
.L64:
	movq	%rbp, %rcx
	leaq	.LC16(%rip), %rdx
.L63:
	movq	stderr(%rip), %rdi
	addq	$56, %rsp
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*__fprintf_chk@GOTPCREL(%rip)
.L71:
	movq	stderr(%rip), %rdi
	movq	%r13, %rcx
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC19(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L54
.L70:
	movq	%r13, %rcx
	leaq	.LC19(%rip), %rdx
	jmp	.L63
.L67:
	movq	stderr(%rip), %rdi
	movq	%rbx, %rcx
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC19(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L48
	.size	parse_file, .-parse_file
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
