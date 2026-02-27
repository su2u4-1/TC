	.file	"file.c"
	.text
	.globl	get_cwd
	.type	get_cwd, @function
get_cwd:
.LFB65:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$0, %esi
	movl	$0, %edi
	call	getcwd@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE65:
	.size	get_cwd, .-get_cwd
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	""
.LC1:
	.string	"%s/%s"
	.text
	.globl	absolute_path
	.type	absolute_path, @function
absolute_path:
.LFB67:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	%rdi, %rbx
	call	strlen@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L4
	movl	$0, %eax
	jmp	.L11
.L23:
	movb	$47, (%rcx)
	cmpq	$1, %rax
	jbe	.L20
.L6:
	leaq	-1(%rbx,%rax), %rdi
	cmpb	$46, (%rdi)
	je	.L21
.L10:
	leaq	(%rbx,%rax), %rdi
	cmpb	$47, (%rdi)
	jne	.L9
.L13:
	leaq	-1(%rax), %r12
	cmpb	$47, -1(%rbx,%rax)
	jne	.L9
	movq	%rbp, %rdx
	subq	%rax, %rdx
	leaq	1(%rbx,%rax), %rsi
	call	memmove@PLT
	subq	$1, %rbp
	movq	%r12, %rax
	jmp	.L9
.L21:
	leaq	-2(%rax), %r12
	cmpb	$47, -2(%rbx,%rax)
	jne	.L10
	movq	%rbp, %rdx
	subq	%rax, %rdx
	leaq	1(%rbx,%rax), %rsi
	call	memmove@PLT
	subq	$2, %rbp
	movq	%r12, %rax
.L8:
	testq	%rax, %rax
	jne	.L10
.L9:
	addq	$1, %rax
	cmpq	%rbp, %rax
	jnb	.L22
.L11:
	leaq	(%rbx,%rax), %rcx
	movzbl	(%rcx), %edx
	cmpb	$92, %dl
	je	.L23
	cmpq	$1, %rax
	jbe	.L8
	cmpb	$47, %dl
	jne	.L9
	jmp	.L6
.L22:
	testq	%rbp, %rbp
	je	.L4
	movq	%rbx, %rax
	cmpb	$47, (%rbx)
	je	.L3
.L4:
	call	get_cwd
	movq	%rax, %r12
	movq	%rbx, %rax
	testq	%r12, %r12
	je	.L3
	movq	%r12, %rdi
	call	strlen@PLT
	leaq	2(%rbp,%rax), %r13
	movq	%r13, %rsi
	leaq	.LC0(%rip), %rdi
	call	create_string@PLT
	movq	%rax, %rbp
	movq	%rbx, %r9
	movq	%r12, %r8
	leaq	.LC1(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__sprintf_chk@PLT
	movq	%r12, %rdi
	call	free@PLT
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	create_string@PLT
.L3:
	addq	$8, %rsp
	.cfi_remember_state
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
.L20:
	.cfi_restore_state
	testq	%rax, %rax
	je	.L9
	leaq	(%rbx,%rax), %rdi
	jmp	.L13
	.cfi_endproc
.LFE67:
	.size	absolute_path, .-absolute_path
	.globl	get_file_name
	.type	get_file_name, @function
get_file_name:
.LFB68:
	.cfi_startproc
	endbr64
	movq	16(%rdi), %rax
	ret
	.cfi_endproc
.LFE68:
	.size	get_file_name, .-get_file_name
	.globl	get_file_extension
	.type	get_file_extension, @function
get_file_extension:
.LFB69:
	.cfi_startproc
	endbr64
	movq	8(%rdi), %rax
	ret
	.cfi_endproc
.LFE69:
	.size	get_file_extension, .-get_file_extension
	.section	.rodata.str1.1
.LC2:
	.string	"/"
	.text
	.globl	get_file_dir
	.type	get_file_dir, @function
get_file_dir:
.LFB70:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L34
	movq	%rdi, %r13
	movl	$0, %r12d
	movl	$0, %ebp
	jmp	.L29
.L37:
	movq	(%rax), %rdi
	call	strlen@PLT
	addq	%rax, %rbp
	addq	$1, %r12
	movq	%rbx, %rax
.L29:
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L37
	testq	%r12, %r12
	je	.L26
	leaq	-1(%rbp,%r12), %rax
	cmpq	$1, %r12
	cmova	%rax, %rbp
	leaq	1(%rbp), %rsi
	leaq	.LC0(%rip), %rdi
	call	create_string@PLT
	movq	%rax, %rbp
	movb	$0, (%rax)
	movq	0(%r13), %rbx
	testq	%rbx, %rbx
	je	.L31
	movl	$1, %eax
	leaq	.LC2(%rip), %r12
	jmp	.L33
.L32:
	movq	(%rbx), %rsi
	movq	%rbp, %rdi
	call	strcat@PLT
	movq	8(%rbx), %rbx
	movl	$0, %eax
	testq	%rbx, %rbx
	je	.L31
.L33:
	cmpq	$0, 8(%rbx)
	je	.L31
	testb	%al, %al
	jne	.L32
	movq	(%rbx), %rdi
	movq	%r12, %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L32
	cmpb	$0, 0(%rbp)
	je	.L32
	movq	%rbp, %rdi
	call	strlen@PLT
	cmpb	$47, -1(%rbp,%rax)
	je	.L32
	movw	$47, 0(%rbp,%rax)
	jmp	.L32
.L31:
	movq	%rbp, %rdi
	call	strlen@PLT
	movq	%rax, %rsi
	movq	%rbp, %rdi
	call	create_string@PLT
	movq	%rax, %rbx
.L26:
	movq	%rbx, %rax
	addq	$8, %rsp
	.cfi_remember_state
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
.L34:
	.cfi_restore_state
	movq	%rax, %rbx
	jmp	.L26
	.cfi_endproc
.LFE70:
	.size	get_file_dir, .-get_file_dir
	.globl	get_full_path
	.type	get_full_path, @function
get_full_path:
.LFB71:
	.cfi_startproc
	endbr64
	movq	24(%rdi), %rax
	ret
	.cfi_endproc
.LFE71:
	.size	get_full_path, .-get_full_path
	.globl	change_file_extension
	.type	change_file_extension, @function
change_file_extension:
.LFB72:
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
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	movq	%rsi, 8(%rdi)
	call	get_file_dir
	movq	%rax, %r13
	testq	%rax, %rax
	leaq	.LC0(%rip), %r14
	cmovne	%rax, %r14
	testq	%rbp, %rbp
	je	.L51
	movq	%r14, %rdi
	call	strlen@PLT
	movq	%rax, %r12
	movq	16(%rbx), %rdi
	call	strlen@PLT
	leaq	1(%r12,%rax), %r12
	movq	%rbp, %rdi
	call	strlen@PLT
	leaq	(%rax,%r12), %rsi
.L46:
	addq	$1, %rsi
	leaq	.LC0(%rip), %rdi
	call	create_string@PLT
	movq	%rax, %r12
	testq	%r13, %r13
	je	.L43
	cmpb	$0, (%r14)
	jne	.L52
.L43:
	movq	16(%rbx), %rsi
	movq	%r12, %rdi
	call	strcpy@PLT
.L44:
	testq	%rbp, %rbp
	je	.L45
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	strcat@PLT
.L45:
	movq	%r12, %rdi
	call	strlen@PLT
	movq	%rax, %rsi
	movq	%r12, %rdi
	call	create_string@PLT
	movq	%rax, 24(%rbx)
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
.L52:
	.cfi_restore_state
	movq	16(%rbx), %r9
	movq	%r14, %r8
	leaq	.LC1(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__sprintf_chk@PLT
	jmp	.L44
.L51:
	movq	%r14, %rdi
	call	strlen@PLT
	movq	%rax, %r12
	movq	16(%rbx), %rdi
	call	strlen@PLT
	leaq	1(%r12,%rax), %rsi
	jmp	.L46
	.cfi_endproc
.LFE72:
	.size	change_file_extension, .-change_file_extension
	.section	.rodata.str1.1
.LC3:
	.string	"%s%s"
.LC4:
	.string	"%s/%s%s"
	.text
	.globl	change_file_name
	.type	change_file_name, @function
change_file_name:
.LFB73:
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
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movq	%rdi, %rbx
	movq	%rsi, %r12
	movq	%rsi, 16(%rdi)
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L55
.L54:
	movq	%rax, %rbp
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L54
	movq	8(%rbx), %r14
	testq	%r14, %r14
	je	.L72
	movq	%r12, %rdi
	call	strlen@PLT
	movq	%rax, %r13
	movq	%r14, %rdi
	call	strlen@PLT
	leaq	(%rax,%r13), %rsi
.L65:
	addq	$1, %rsi
	leaq	.LC0(%rip), %rdi
	call	create_string@PLT
	movq	%rax, %r13
	movq	%r14, %r9
	movq	%r12, %r8
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__sprintf_chk@PLT
	movq	%r13, %rdi
	call	strlen@PLT
	movq	%rax, %rsi
	movq	%r13, %rdi
	call	create_string@PLT
	movq	%rax, 0(%rbp)
.L55:
	movq	%rbx, %rdi
	call	get_file_dir
	movq	%rax, %rbp
	testq	%rax, %rax
	leaq	.LC0(%rip), %r14
	cmovne	%rax, %r14
	movq	8(%rbx), %r15
	testq	%r15, %r15
	je	.L73
	movq	%r14, %rdi
	call	strlen@PLT
	movq	%rax, %r13
	movq	%r12, %rdi
	call	strlen@PLT
	leaq	1(%r13,%rax), %r13
	movq	%r15, %rdi
	call	strlen@PLT
	leaq	(%rax,%r13), %rsi
.L64:
	addq	$1, %rsi
	leaq	.LC0(%rip), %rdi
	call	create_string@PLT
	movq	%rax, %r13
	testq	%rbp, %rbp
	je	.L62
	cmpb	$0, (%r14)
	jne	.L74
.L62:
	movq	%r15, %r9
	movq	%r12, %r8
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	movq	%r13, %rdi
	movl	$0, %eax
	call	__sprintf_chk@PLT
.L63:
	movq	%r13, %rdi
	call	strlen@PLT
	movq	%rax, %rsi
	movq	%r13, %rdi
	call	create_string@PLT
	movq	%rax, 24(%rbx)
	addq	$8, %rsp
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
.L74:
	.cfi_restore_state
	subq	$8, %rsp
	.cfi_def_cfa_offset 72
	pushq	%r15
	.cfi_def_cfa_offset 80
	movq	%r12, %r9
	movq	%r14, %r8
	leaq	.LC4(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__sprintf_chk@PLT
	addq	$16, %rsp
	.cfi_def_cfa_offset 64
	jmp	.L63
.L73:
	movq	%r14, %rdi
	call	strlen@PLT
	movq	%rax, %r13
	movq	%r12, %rdi
	call	strlen@PLT
	leaq	1(%r13,%rax), %rsi
	leaq	.LC0(%rip), %r15
	jmp	.L64
.L72:
	movq	%r12, %rdi
	call	strlen@PLT
	movq	%rax, %rsi
	leaq	.LC0(%rip), %r14
	jmp	.L65
	.cfi_endproc
.LFE73:
	.size	change_file_name, .-change_file_name
	.section	.rodata.str1.1
.LC5:
	.string	"."
.LC6:
	.string	".."
	.text
	.globl	normalize_path
	.type	normalize_path, @function
normalize_path:
.LFB74:
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
	subq	$296, %rsp
	.cfi_def_cfa_offset 352
	movq	%rdi, %r14
	movq	%fs:40, %rax
	movq	%rax, 280(%rsp)
	xorl	%eax, %eax
	movq	24(%rdi), %rdi
	call	strlen@PLT
	movq	%rax, %r12
	leaq	1(%rax), %rsi
	leaq	.LC0(%rip), %rdi
	call	create_string@PLT
	movq	%rax, %r13
	movq	24(%r14), %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	testq	%r12, %r12
	je	.L97
	movl	$0, %esi
	movl	$0, %ebp
	cmpb	$47, 0(%r13)
	jne	.L76
	movl	$16, %edi
	call	alloc_memory@PLT
	movq	%rax, %rbp
	movl	$1, %esi
	leaq	.LC2(%rip), %rdi
	call	create_string@PLT
	movq	%rax, 0(%rbp)
	movq	$0, 8(%rbp)
	movl	$1, %esi
	jmp	.L76
.L77:
	cmpq	%rbx, %rsi
	jb	.L108
.L79:
	leaq	1(%rbx), %rsi
.L78:
	leaq	1(%rbx), %rax
	cmpq	%rbx, %r12
	je	.L109
	movq	%rax, %rbx
.L86:
	cmpq	%rbx, %r12
	je	.L77
	cmpb	$47, 0(%r13,%rbx)
	jne	.L78
	jmp	.L77
.L108:
	movq	%rbx, %rax
	subq	%rsi, %rax
	addq	%r13, %rsi
	leaq	16(%rsp), %rdi
	movl	$256, %ecx
	movq	%rax, (%rsp)
	movq	%rax, %rdx
	movq	%rdi, 8(%rsp)
	call	__strncpy_chk@PLT
	movq	(%rsp), %rax
	movb	$0, 16(%rsp,%rax)
	leaq	.LC5(%rip), %rsi
	movq	8(%rsp), %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L79
	leaq	16(%rsp), %rdi
	leaq	.LC6(%rip), %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L81
	testq	%r15, %r15
	je	.L82
	cmpq	%r15, %rbp
	je	.L82
	movq	(%r15), %rdi
	leaq	.LC6(%rip), %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L99
	movl	$16, %edi
	call	alloc_memory@PLT
	movq	%rax, (%rsp)
	movl	$2, %esi
	leaq	.LC6(%rip), %rdi
	call	create_string@PLT
	movq	(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	$0, 8(%rcx)
	movq	%rcx, 8(%r15)
	movq	%rcx, %r15
	jmp	.L79
.L99:
	movq	%rbp, %rax
	jmp	.L83
.L100:
	movq	%rdx, %rax
.L83:
	testq	%rax, %rax
	je	.L79
	movq	8(%rax), %rdx
	cmpq	%r15, %rdx
	jne	.L100
	movq	$0, 8(%rax)
	movq	%rax, %r15
	jmp	.L79
.L82:
	testq	%rbp, %rbp
	jne	.L79
	movl	$16, %edi
	call	alloc_memory@PLT
	movq	%rax, %rbp
	movl	$2, %esi
	leaq	.LC6(%rip), %rdi
	call	create_string@PLT
	movq	%rax, 0(%rbp)
	movq	$0, 8(%rbp)
	movq	%rbp, %r15
	jmp	.L79
.L81:
	cmpb	$0, 16(%rsp)
	je	.L79
	movl	$16, %edi
	call	alloc_memory@PLT
	movq	%rax, 8(%rsp)
	leaq	16(%rsp), %rdi
	movq	(%rsp), %rsi
	call	create_string@PLT
	movq	8(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	$0, 8(%rcx)
	testq	%r15, %r15
	je	.L85
	movq	%rcx, 8(%r15)
.L85:
	testq	%rbp, %rbp
	je	.L101
	movq	8(%rsp), %r15
	jmp	.L79
.L101:
	movq	8(%rsp), %rbp
	movq	%rbp, %r15
	jmp	.L79
.L109:
	movq	%rbp, (%r14)
	testq	%r15, %r15
	je	.L87
	movq	(%r15), %r12
	movl	$46, %esi
	movq	%r12, %rdi
	call	strrchr@PLT
	movq	%rax, %rbx
	cmpq	%rax, %r12
	je	.L88
	testq	%rax, %rax
	je	.L88
	movq	%rax, %rsi
	subq	%r12, %rsi
	movq	%r12, %rdi
	call	create_string@PLT
	movq	%rax, 16(%r14)
	movq	%rbx, %rdi
	call	strlen@PLT
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	create_string@PLT
	movq	%rax, %r15
	jmp	.L89
.L88:
	movq	%r12, 16(%r14)
	movl	$0, %r15d
.L89:
	movq	%r15, 8(%r14)
	testq	%rbp, %rbp
	je	.L90
	movq	%rbp, %rbx
	movl	$0, %r12d
	movl	$0, %r13d
.L91:
	movq	(%rbx), %rdi
	call	strlen@PLT
	addq	%rax, %r13
	movq	%r12, %rax
	addq	$1, %r12
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L91
	addq	%r13, %rax
	cmpq	$1, %r12
	cmova	%rax, %r13
	leaq	1(%r13), %rsi
	leaq	.LC0(%rip), %rdi
	call	create_string@PLT
	movq	%rax, %rbx
	movb	$0, (%rax)
	movl	$1, %eax
	leaq	.LC2(%rip), %r12
	jmp	.L94
.L87:
	movq	$0, 16(%r14)
	jmp	.L89
.L93:
	movq	0(%rbp), %rsi
	movq	%rbx, %rdi
	call	strcat@PLT
	movq	8(%rbp), %rbp
	movl	$0, %eax
	testq	%rbp, %rbp
	je	.L95
.L94:
	testb	%al, %al
	jne	.L93
	movq	0(%rbp), %rdi
	movq	%r12, %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L93
	cmpb	$0, (%rbx)
	je	.L93
	movq	%rbx, %rdi
	call	strlen@PLT
	cmpb	$47, -1(%rbx,%rax)
	je	.L93
	movw	$47, (%rbx,%rax)
	jmp	.L93
.L90:
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	create_string@PLT
	movq	%rax, %rbx
	movb	$0, (%rax)
.L95:
	movq	%rbx, %rdi
	call	strlen@PLT
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	create_string@PLT
	movq	%rax, 24(%r14)
	movq	280(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L110
	addq	$296, %rsp
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
.L97:
	.cfi_restore_state
	movq	%r12, %rsi
	movl	$0, %ebp
.L76:
	movq	%rsi, %rbx
	movq	%rbp, %r15
	jmp	.L86
.L110:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE74:
	.size	normalize_path, .-normalize_path
	.globl	create_file
	.type	create_file, @function
create_file:
.LFB66:
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
	movq	%rdi, %rbp
	movl	$32, %edi
	call	alloc_memory@PLT
	movq	%rax, %rbx
	movq	%rbp, %rdi
	call	absolute_path
	movq	%rax, 24(%rbx)
	movq	%rbx, %rdi
	call	normalize_path
	movq	%rbx, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE66:
	.size	create_file, .-create_file
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
