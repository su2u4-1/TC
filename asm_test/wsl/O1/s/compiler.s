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
.LFB65:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %r14
	movq	%rsi, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %r12
	movq	%rdx, %rdi
	call	strlen@PLT
	movq	%rax, %r13
	movq	%r12, %rdi
	call	strlen@PLT
	leaq	0(%r13,%rax), %rdx
	cmpq	%rbx, %rdx
	jnb	.L6
	cmpq	%r14, %rbp
	je	.L7
	subq	$8, %rsp
	.cfi_def_cfa_offset 56
	pushq	%r12
	.cfi_def_cfa_offset 64
	movq	%rbp, %r9
	leaq	.LC2(%rip), %r8
	movq	$-1, %rcx
	movl	$2, %edx
	movq	%rbx, %rsi
	movq	%r14, %rdi
	movl	$0, %eax
	call	__snprintf_chk@PLT
	addq	$16, %rsp
	.cfi_def_cfa_offset 48
.L1:
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
.L6:
	.cfi_restore_state
	leaq	-1(%rbx), %r9
	pushq	%r12
	.cfi_def_cfa_offset 56
	pushq	%rbp
	.cfi_def_cfa_offset 64
	subl	%eax, %r9d
	leaq	.LC0(%rip), %r8
	movq	$-1, %rcx
	movl	$2, %edx
	movq	%rbx, %rsi
	movq	%r14, %rdi
	movl	$0, %eax
	call	__snprintf_chk@PLT
	addq	$16, %rsp
	.cfi_def_cfa_offset 48
	jmp	.L1
.L7:
	subq	%r13, %rbx
	movq	%rbx, %rsi
	leaq	(%r14,%r13), %rdi
	movq	%r12, %rcx
	leaq	.LC1(%rip), %rdx
	movl	$0, %eax
	call	snprintf@PLT
	jmp	.L1
	.cfi_endproc
.LFE65:
	.size	string_append, .-string_append
	.section	.rodata.str1.1
.LC3:
	.string	""
	.text
	.globl	read_source
	.type	read_source, @function
read_source:
.LFB66:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %r12
	movq	%rsi, %rbp
	movl	$2, %edx
	movl	$0, %esi
	call	fseek@PLT
	movq	%r12, %rdi
	call	ftell@PLT
	movq	%rax, 0(%rbp)
	movl	$0, %edx
	movl	$0, %esi
	movq	%r12, %rdi
	call	fseek@PLT
	movq	0(%rbp), %rax
	leaq	1(%rax), %rsi
	leaq	.LC3(%rip), %rdi
	call	create_string@PLT
	movq	%rax, %rbx
	movq	0(%rbp), %rdx
	movq	%r12, %rcx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread@PLT
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
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%rdi, %r12
	movq	%rsi, %rdi
	movq	%rsi, 8(%rsp)
	movl	$0, %esi
	call	get_next_token@PLT
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
	call	__fprintf_chk@PLT
.L15:
	call	get_info@PLT
	movq	%rax, %rcx
	leaq	.LC18(%rip), %rdx
	movl	$2, %esi
	movq	%r12, %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L24:
	.cfi_restore_state
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	fwrite@PLT
.L16:
	movq	16(%rbx), %rax
	movq	8(%rbx), %rdx
	leaq	1(%rdx), %rcx
	leaq	1(%rax), %r8
	leaq	.LC12(%rip), %rdx
	movl	$2, %esi
	movq	%r12, %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
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
	call	fwrite@PLT
	jmp	.L16
.L22:
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	fwrite@PLT
	jmp	.L16
.L21:
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rdi
	call	fwrite@PLT
	jmp	.L16
.L20:
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC9(%rip), %rdi
	call	fwrite@PLT
	jmp	.L16
.L19:
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC10(%rip), %rdi
	call	fwrite@PLT
	jmp	.L16
.L17:
	movq	%r12, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rdi
	call	fwrite@PLT
	jmp	.L16
.L37:
	movq	%r12, %rcx
	movl	$2, %edx
	movl	$1, %esi
	movq	%r13, %rdi
	call	fwrite@PLT
.L28:
	addq	$1, %rbx
.L26:
	movq	%rbp, %rdi
	call	strlen@PLT
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
	call	fputc@PLT
	jmp	.L28
.L38:
	movq	%r12, %rcx
	movl	$2, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	fwrite@PLT
	jmp	.L28
.L39:
	movq	%r12, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rdi
	call	fwrite@PLT
	jmp	.L28
.L40:
	movq	%r12, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rdi
	call	fwrite@PLT
	jmp	.L28
.L36:
	movq	%r12, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC17(%rip), %rdi
	call	fwrite@PLT
	movl	$0, %esi
	movq	8(%rsp), %rdi
	call	get_next_token@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L15
.L33:
	cmpl	$7, 24(%rbx)
	ja	.L16
	movl	24(%rbx), %eax
	movslq	(%r14,%rax,4), %rax
	addq	%r14, %rax
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
	.cfi_endproc
.LFE67:
	.size	output_token, .-output_token
	.globl	output_ast
	.type	output_ast, @function
output_ast:
.LFB68:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	movq	%rdx, %rbp
	movq	builtin_scope(%rip), %rsi
	call	parse_code@PLT
	movq	%rax, %rdi
	movq	%rbp, %rcx
	movl	$0, %edx
	movq	%rbx, %rsi
	call	output_code@PLT
	call	get_info@PLT
	movq	%rax, %rcx
	leaq	.LC18(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
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
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	movl	%esi, %r14d
	movl	%edx, %r13d
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	call	create_file@PLT
	movq	%rax, %rbp
	movq	%rax, %rdi
	call	get_full_path@PLT
	movq	%rax, %r12
	movq	$0, (%rsp)
	leaq	.LC19(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	testq	%rax, %rax
	je	.L52
	movq	%rax, %rbx
	movq	%rsp, %rsi
	movq	%rax, %rdi
	call	read_source
	movq	%rax, %r12
	movq	%rbx, %rdi
	call	fclose@PLT
	movq	(%rsp), %rsi
	movq	%r12, %rdi
	call	create_lexer@PLT
	movq	%rax, %rbx
	testb	%r14b, %r14b
	jne	.L53
.L46:
	movq	%rbx, %rdi
	call	reset_lexer@PLT
	call	create_parser@PLT
	movq	%rax, %r12
	testb	%r13b, %r13b
	jne	.L54
.L43:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L55
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
.L52:
	.cfi_restore_state
	movq	%r12, %rcx
	leaq	.LC20(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	jmp	.L43
.L53:
	movl	$6, %esi
	leaq	.LC21(%rip), %rdi
	call	create_string@PLT
	movq	%rax, %rsi
	movq	%rbp, %rdi
	call	change_file_extension@PLT
	movq	%rbp, %rdi
	call	get_full_path@PLT
	movq	%rax, %r14
	leaq	.LC22(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L56
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	output_token
	movq	%r12, %rdi
	call	fclose@PLT
	jmp	.L46
.L56:
	movq	%r14, %rcx
	leaq	.LC23(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	jmp	.L46
.L54:
	movl	$4, %esi
	leaq	.LC24(%rip), %rdi
	call	create_string@PLT
	movq	%rax, %rsi
	movq	%rbp, %rdi
	call	change_file_extension@PLT
	movq	%rbp, %rdi
	call	get_full_path@PLT
	movq	%rax, %r13
	leaq	.LC22(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L57
	movq	%r12, %rdx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	output_ast
	movq	%rbp, %rdi
	call	fclose@PLT
	jmp	.L43
.L57:
	movq	%r13, %rcx
	leaq	.LC23(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	jmp	.L43
.L55:
	call	__stack_chk_fail@PLT
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
