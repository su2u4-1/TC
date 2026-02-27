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
.LFB65:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdi, %r13
	movq	%rdx, %rdi
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdx, %rbx
	call	strlen@PLT
	movq	%r12, %rdi
	movq	%rax, %r14
	call	strlen@PLT
	leaq	(%r14,%rax), %rdx
	cmpq	%rbp, %rdx
	jnb	.L7
	cmpq	%r13, %rbx
	je	.L8
	subq	$8, %rsp
	.cfi_def_cfa_offset 56
	movq	%rbx, %r9
	movl	$2, %edx
	movq	%rbp, %rsi
	pushq	%r12
	.cfi_def_cfa_offset 64
	movq	%r13, %rdi
	leaq	.LC2(%rip), %r8
	xorl	%eax, %eax
	movq	$-1, %rcx
	call	__snprintf_chk@PLT
	popq	%rax
	.cfi_def_cfa_offset 56
	popq	%rdx
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_remember_state
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
	.p2align 4,,10
	.p2align 3
.L8:
	.cfi_restore_state
	movq	%rbp, %rsi
	leaq	(%rbx,%r14), %rdi
	movq	%r12, %rcx
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	subq	%r14, %rsi
	popq	%rbp
	.cfi_def_cfa_offset 32
	leaq	.LC1(%rip), %rdx
	popq	%r12
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	snprintf@PLT
	.p2align 4,,10
	.p2align 3
.L7:
	.cfi_restore_state
	pushq	%r12
	.cfi_def_cfa_offset 56
	leaq	-1(%rbp), %r9
	movq	%rbp, %rsi
	movq	$-1, %rcx
	pushq	%rbx
	.cfi_def_cfa_offset 64
	subl	%eax, %r9d
	movq	%r13, %rdi
	leaq	.LC0(%rip), %r8
	movl	$2, %edx
	xorl	%eax, %eax
	call	__snprintf_chk@PLT
	popq	%rcx
	.cfi_def_cfa_offset 56
	popq	%rsi
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
.LFE65:
	.size	string_append, .-string_append
	.section	.rodata.str1.1
.LC3:
	.string	""
	.text
	.p2align 4
	.globl	read_source
	.type	read_source, @function
read_source:
.LFB66:
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
	testq	%rax, %rax
	je	.L9
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L12:
	movzbl	(%rbx,%rax), %edx
	andl	$-5, %edx
	cmpb	$9, %dl
	jne	.L11
	movb	$32, (%rbx,%rax)
.L11:
	addq	$1, %rax
	cmpq	0(%rbp), %rax
	jb	.L12
.L9:
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE66:
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
.LFB67:
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
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	movq	%rsi, %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%rsi, 8(%rsp)
	xorl	%esi, %esi
	call	get_next_token@PLT
	testq	%rax, %rax
	je	.L30
	movq	%rax, %rbx
	leaq	.L22(%rip), %r14
	.p2align 4,,10
	.p2align 3
.L38:
	cmpl	$7, 24(%rbx)
	ja	.L20
	movl	24(%rbx), %eax
	movslq	(%r14,%rax,4), %rax
	addq	%r14, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L22:
	.long	.L29-.L22
	.long	.L28-.L22
	.long	.L27-.L22
	.long	.L26-.L22
	.long	.L25-.L22
	.long	.L24-.L22
	.long	.L23-.L22
	.long	.L21-.L22
	.text
	.p2align 4,,10
	.p2align 3
.L23:
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC10(%rip), %rdi
	call	fwrite@PLT
	.p2align 4,,10
	.p2align 3
.L20:
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
	call	__fprintf_chk@PLT
	movq	(%rbx), %rbp
	xorl	%ebx, %ebx
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L32:
	cmpb	$10, %dil
	je	.L44
	cmpb	$9, %dil
	je	.L45
	cmpb	$13, %dil
	je	.L46
	movq	%r12, %rsi
	call	fputc@PLT
.L33:
	addq	$1, %rbx
.L31:
	movq	%rbp, %rdi
	call	strlen@PLT
	cmpq	%rax, %rbx
	jnb	.L47
	movsbl	0(%rbp,%rbx), %edi
	testb	%dil, %dil
	jne	.L32
	movq	%r12, %rcx
	movl	$2, %edx
	movl	$1, %esi
	movq	%r13, %rdi
	call	fwrite@PLT
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L24:
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC9(%rip), %rdi
	call	fwrite@PLT
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L25:
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rdi
	call	fwrite@PLT
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L26:
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	fwrite@PLT
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L29:
	movq	16(%rbx), %rax
	movq	8(%rbx), %rcx
	movl	$2, %esi
	movq	%r12, %rdi
	leaq	.LC4(%rip), %rdx
	leaq	1(%rax), %r8
	addq	$1, %rcx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
.L30:
	call	get_info@PLT
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rdi
	leaq	.LC18(%rip), %rdx
	popq	%rbx
	.cfi_def_cfa_offset 48
	movq	%rax, %rcx
	popq	%rbp
	.cfi_def_cfa_offset 40
	movl	$2, %esi
	popq	%r12
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	__fprintf_chk@PLT
	.p2align 4,,10
	.p2align 3
.L21:
	.cfi_restore_state
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rdi
	call	fwrite@PLT
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L27:
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rdi
	call	fwrite@PLT
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L28:
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	fwrite@PLT
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L46:
	movq	%r12, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rdi
	call	fwrite@PLT
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L44:
	movq	%r12, %rcx
	movl	$2, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	fwrite@PLT
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L47:
	movq	%r12, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC17(%rip), %rdi
	call	fwrite@PLT
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	call	get_next_token@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L38
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L45:
	movq	%r12, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rdi
	call	fwrite@PLT
	jmp	.L33
	.cfi_endproc
.LFE67:
	.size	output_token, .-output_token
	.p2align 4
	.globl	output_ast
	.type	output_ast, @function
output_ast:
.LFB68:
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
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	builtin_scope(%rip), %rsi
	call	parse_code@PLT
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	xorl	%edx, %edx
	movq	%rax, %rdi
	call	output_code@PLT
	call	get_info@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movq	%rbx, %rdi
	leaq	.LC18(%rip), %rdx
	movq	%rax, %rcx
	popq	%rbx
	.cfi_def_cfa_offset 16
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	__fprintf_chk@PLT
	.cfi_endproc
.LFE68:
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
.LFB69:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%esi, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movl	%edx, %r12d
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
	movq	%rax, %rbp
	call	get_full_path@PLT
	leaq	.LC19(%rip), %rsi
	movq	$0, (%rsp)
	movq	%rax, %rdi
	movq	%rax, %r14
	call	fopen@PLT
	testq	%rax, %rax
	je	.L63
	movq	%rax, %rbx
	movq	%rsp, %rsi
	movq	%rax, %rdi
	call	read_source
	movq	%rbx, %rdi
	movq	%rax, %r14
	call	fclose@PLT
	movq	(%rsp), %rsi
	movq	%r14, %rdi
	call	create_lexer@PLT
	movq	%rax, %rbx
	testb	%r13b, %r13b
	jne	.L64
.L53:
	movq	%rbx, %rdi
	call	reset_lexer@PLT
	call	create_parser@PLT
	movq	%rax, %r13
	testb	%r12b, %r12b
	jne	.L65
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L62
	addq	$16, %rsp
	.cfi_remember_state
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
	.p2align 4,,10
	.p2align 3
.L64:
	.cfi_restore_state
	movl	$6, %esi
	leaq	.LC21(%rip), %rdi
	call	create_string@PLT
	movq	%rbp, %rdi
	movq	%rax, %rsi
	call	change_file_extension@PLT
	movq	%rbp, %rdi
	call	get_full_path@PLT
	leaq	.LC22(%rip), %rsi
	movq	%rax, %rdi
	movq	%rax, %r14
	call	fopen@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L66
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	output_token
	movq	%r13, %rdi
	call	fclose@PLT
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L65:
	movl	$4, %esi
	leaq	.LC24(%rip), %rdi
	call	create_string@PLT
	movq	%rbp, %rdi
	movq	%rax, %rsi
	call	change_file_extension@PLT
	movq	%rbp, %rdi
	call	get_full_path@PLT
	leaq	.LC22(%rip), %rsi
	movq	%rax, %rdi
	movq	%rax, %r12
	call	fopen@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L67
	movq	builtin_scope(%rip), %rsi
	movq	%r13, %rdx
	movq	%rbx, %rdi
	call	parse_code@PLT
	xorl	%edx, %edx
	movq	%r13, %rcx
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	output_code@PLT
	call	get_info@PLT
	leaq	.LC18(%rip), %rdx
	movl	$2, %esi
	movq	%rbp, %rdi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L62
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movq	%rbp, %rdi
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
.L63:
	.cfi_restore_state
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	movq	%r14, %rcx
	leaq	.LC20(%rip), %rdx
	jne	.L62
.L61:
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
.L67:
	.cfi_restore_state
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	movq	%r12, %rcx
	leaq	.LC23(%rip), %rdx
	je	.L61
.L62:
	call	__stack_chk_fail@PLT
.L66:
	movq	stderr(%rip), %rdi
	movq	%r14, %rcx
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC23(%rip), %rdx
	call	__fprintf_chk@PLT
	jmp	.L53
	.cfi_endproc
.LFE69:
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
