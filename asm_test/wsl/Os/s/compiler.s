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
.LFB50:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdi, %r12
	movq	%rdx, %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rcx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdx, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	movq	%rsi, 8(%rsp)
	call	strlen@PLT
	movq	%rbp, %rdi
	movq	%rax, %r13
	call	strlen@PLT
	movq	8(%rsp), %rsi
	leaq	0(%r13,%rax), %rdx
	cmpq	%rsi, %rdx
	jb	.L2
	pushq	%rbp
	.cfi_remember_state
	.cfi_def_cfa_offset 72
	leaq	-1(%rsi), %r9
	leaq	.LC0(%rip), %r8
	orq	$-1, %rcx
	pushq	%rbx
	.cfi_def_cfa_offset 80
	subl	%eax, %r9d
	movl	$2, %edx
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	__snprintf_chk@PLT
	jmp	.L6
.L2:
	.cfi_restore_state
	cmpq	%r12, %rbx
	jne	.L4
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	leaq	(%rbx,%r13), %rdi
	subq	%r13, %rsi
	movq	%rbp, %rcx
	popq	%rbx
	.cfi_def_cfa_offset 32
	leaq	.LC1(%rip), %rdx
	popq	%rbp
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	snprintf@PLT
.L4:
	.cfi_restore_state
	pushq	%rcx
	.cfi_def_cfa_offset 72
	movq	%rbx, %r9
	leaq	.LC2(%rip), %r8
	orq	$-1, %rcx
	pushq	%rbp
	.cfi_def_cfa_offset 80
	movl	$2, %edx
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	__snprintf_chk@PLT
.L6:
	popq	%rax
	.cfi_def_cfa_offset 72
	popq	%rdx
	.cfi_def_cfa_offset 64
	addq	$24, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE50:
	.size	string_append, .-string_append
	.section	.rodata.str1.1
.LC3:
	.string	""
	.text
	.globl	read_source
	.type	read_source, @function
read_source:
.LFB51:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$2, %edx
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rbp
	xorl	%esi, %esi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	call	fseek@PLT
	movq	%r12, %rdi
	call	ftell@PLT
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%r12, %rdi
	movq	%rax, 0(%rbp)
	call	fseek@PLT
	movq	0(%rbp), %rax
	leaq	.LC3(%rip), %rdi
	leaq	1(%rax), %rsi
	call	create_string@PLT
	movq	0(%rbp), %rdx
	movq	%r12, %rcx
	movl	$1, %esi
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	fread@PLT
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
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE51:
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
.LFB52:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leaq	.L18(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	xorl	%esi, %esi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	movq	%r12, %rdi
	pushq	%r9
	.cfi_def_cfa_offset 64
	call	get_next_token@PLT
	movq	%rax, %rbp
.L15:
	testq	%rbp, %rbp
	je	.L26
	cmpl	$7, 24(%rbp)
	ja	.L16
	movl	24(%rbp), %eax
	movslq	0(%r13,%rax,4), %rax
	addq	%r13, %rax
	notrack jmp	*%rax
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
	call	__fprintf_chk@PLT
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
	call	fputs@PLT
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
	call	__fprintf_chk@PLT
	movq	0(%rbp), %r14
	xorl	%ebp, %ebp
.L27:
	movq	%r14, %rdi
	call	strlen@PLT
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
	call	fputs@PLT
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
	call	fputc@PLT
.L29:
	incq	%rbp
	jmp	.L27
.L38:
	movq	%rbx, %rsi
	leaq	.LC17(%rip), %rdi
	call	fputs@PLT
	xorl	%esi, %esi
	movq	%r12, %rdi
	call	get_next_token@PLT
	movq	%rax, %rbp
	jmp	.L15
.L26:
	call	get_info@PLT
	popq	%r8
	.cfi_def_cfa_offset 56
	movq	%rbx, %rdi
	movl	$2, %esi
	popq	%rbx
	.cfi_def_cfa_offset 48
	movq	%rax, %rcx
	popq	%rbp
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%r12
	.cfi_def_cfa_offset 32
	leaq	.LC18(%rip), %rdx
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	__fprintf_chk@PLT
	.cfi_endproc
.LFE52:
	.size	output_token, .-output_token
	.globl	output_ast
	.type	output_ast, @function
output_ast:
.LFB53:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	pushq	%rax
	.cfi_def_cfa_offset 32
	movq	builtin_scope(%rip), %rsi
	call	parse_code@PLT
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	xorl	%edx, %edx
	movq	%rax, %rdi
	call	output_code@PLT
	call	get_info@PLT
	popq	%r8
	.cfi_def_cfa_offset 24
	movq	%rbx, %rdi
	movl	$2, %esi
	movq	%rax, %rcx
	popq	%rbx
	.cfi_def_cfa_offset 16
	leaq	.LC18(%rip), %rdx
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	__fprintf_chk@PLT
	.cfi_endproc
.LFE53:
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
.LFB54:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%edx, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movl	%esi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	call	create_file@PLT
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	get_full_path@PLT
	xorl	%r11d, %r11d
	leaq	.LC19(%rip), %rsi
	movq	%rax, %rdi
	movq	%r11, (%rsp)
	movq	%rax, %r14
	call	fopen@PLT
	testq	%rax, %rax
	jne	.L42
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	movq	%r14, %rcx
	leaq	.LC20(%rip), %rdx
	je	.L52
	jmp	.L53
.L42:
	movq	%rax, %rbp
	movq	%rsp, %rsi
	movq	%rax, %rdi
	call	read_source
	movq	%rbp, %rdi
	movq	%rax, %r14
	call	fclose@PLT
	movq	(%rsp), %rsi
	movq	%r14, %rdi
	call	create_lexer@PLT
	movq	%rax, %rbp
	testb	%r12b, %r12b
	je	.L44
	movl	$6, %esi
	leaq	.LC21(%rip), %rdi
	call	create_string@PLT
	movq	%rbx, %rdi
	movq	%rax, %rsi
	call	change_file_extension@PLT
	movq	%rbx, %rdi
	call	get_full_path@PLT
	leaq	.LC22(%rip), %rsi
	movq	%rax, %rdi
	movq	%rax, %r14
	call	fopen@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L45
	movq	stderr(%rip), %rdi
	movq	%r14, %rcx
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC23(%rip), %rdx
	call	__fprintf_chk@PLT
	jmp	.L44
.L45:
	movq	%rax, %rdi
	movq	%rbp, %rsi
	call	output_token
	movq	%r12, %rdi
	call	fclose@PLT
.L44:
	movq	%rbp, %rdi
	call	reset_lexer@PLT
	call	create_parser@PLT
	movq	%rax, %r14
	testb	%r13b, %r13b
	je	.L41
	movl	$4, %esi
	leaq	.LC24(%rip), %rdi
	call	create_string@PLT
	movq	%rbx, %rdi
	movq	%rax, %rsi
	call	change_file_extension@PLT
	movq	%rbx, %rdi
	call	get_full_path@PLT
	leaq	.LC22(%rip), %rsi
	movq	%rax, %rdi
	movq	%rax, %r12
	call	fopen@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L47
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	movq	%r12, %rcx
	leaq	.LC23(%rip), %rdx
	jne	.L53
.L52:
	movq	stderr(%rip), %rdi
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	__fprintf_chk@PLT
.L47:
	.cfi_restore_state
	movq	%rax, %rdi
	movq	%r14, %rdx
	movq	%rbp, %rsi
	call	output_ast
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L53
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	fclose@PLT
.L41:
	.cfi_restore_state
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	je	.L50
.L53:
	call	__stack_chk_fail@PLT
.L50:
	addq	$16, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE54:
	.size	parse_file, .-parse_file
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
