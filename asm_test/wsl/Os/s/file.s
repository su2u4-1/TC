	.file	"file.c"
	.text
	.globl	get_cwd
	.type	get_cwd, @function
get_cwd:
.LFB50:
	.cfi_startproc
	endbr64
	xorl	%esi, %esi
	xorl	%edi, %edi
	jmp	getcwd@PLT
	.cfi_endproc
.LFE50:
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
.LFB52:
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
	movq	%rdi, %rbx
	pushq	%rsi
	.cfi_def_cfa_offset 48
	call	strlen@PLT
	xorl	%edx, %edx
	movq	%rax, %rbp
.L3:
	cmpq	%rbp, %rdx
	jnb	.L31
	leaq	(%rbx,%rdx), %rcx
	movb	(%rcx), %al
	cmpb	$92, %al
	jne	.L4
	movb	$47, (%rcx)
	cmpq	$1, %rdx
	jbe	.L9
.L10:
	leaq	-1(%rbx,%rdx), %rdi
	cmpb	$46, (%rdi)
	jne	.L11
	jmp	.L32
.L4:
	cmpq	$1, %rdx
	jbe	.L9
	cmpb	$47, %al
	jne	.L11
	jmp	.L10
.L32:
	cmpb	$47, -2(%rbx,%rdx)
	leaq	-2(%rdx), %r12
	jne	.L11
	movq	%rbp, %rax
	leaq	1(%rbx,%rdx), %rsi
	subq	$2, %rbp
	subq	%rdx, %rax
	movq	%rax, %rdx
	call	memmove@PLT
	movq	%r12, %rdx
.L9:
	testq	%rdx, %rdx
	je	.L12
.L11:
	leaq	(%rbx,%rdx), %rdi
	cmpb	$47, (%rdi)
	jne	.L12
	cmpb	$47, -1(%rbx,%rdx)
	leaq	-1(%rdx), %r12
	jne	.L12
	movq	%rbp, %rax
	leaq	1(%rbx,%rdx), %rsi
	decq	%rbp
	subq	%rdx, %rax
	movq	%rax, %rdx
	call	memmove@PLT
	movq	%r12, %rdx
.L12:
	incq	%rdx
	jmp	.L3
.L31:
	testq	%rbp, %rbp
	je	.L14
	cmpb	$47, (%rbx)
	je	.L15
.L14:
	call	get_cwd
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L15
	movq	%rax, %rdi
	call	strlen@PLT
	leaq	.LC0(%rip), %rdi
	leaq	2(%rbp,%rax), %r13
	movq	%r13, %rsi
	call	create_string@PLT
	movq	%rbx, %r9
	movq	%r12, %r8
	movl	$2, %esi
	movq	%rax, %rbp
	leaq	.LC1(%rip), %rcx
	movq	%rax, %rdi
	orq	$-1, %rdx
	xorl	%eax, %eax
	call	__sprintf_chk@PLT
	movq	%r12, %rdi
	call	free@PLT
	popq	%rcx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%r13, %rsi
	popq	%rbx
	.cfi_def_cfa_offset 32
	movq	%rbp, %rdi
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	create_string@PLT
.L15:
	.cfi_restore_state
	popq	%rdx
	.cfi_def_cfa_offset 40
	movq	%rbx, %rax
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
.LFE52:
	.size	absolute_path, .-absolute_path
	.globl	get_file_name
	.type	get_file_name, @function
get_file_name:
.LFB53:
	.cfi_startproc
	endbr64
	movq	16(%rdi), %rax
	ret
	.cfi_endproc
.LFE53:
	.size	get_file_name, .-get_file_name
	.globl	get_file_extension
	.type	get_file_extension, @function
get_file_extension:
.LFB54:
	.cfi_startproc
	endbr64
	movq	8(%rdi), %rax
	ret
	.cfi_endproc
.LFE54:
	.size	get_file_extension, .-get_file_extension
	.section	.rodata.str1.1
.LC2:
	.string	"/"
	.text
	.globl	get_file_dir
	.type	get_file_dir, @function
get_file_dir:
.LFB55:
	.cfi_startproc
	endbr64
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L56
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	xorl	%ebx, %ebx
	pushq	%rsi
	.cfi_def_cfa_offset 48
.L38:
	movq	8(%rax), %r13
	testq	%r13, %r13
	je	.L37
	movq	(%rax), %rdi
	incq	%rbp
	call	strlen@PLT
	addq	%rax, %rbx
	movq	%r13, %rax
	jmp	.L38
.L37:
	testq	%rbp, %rbp
	je	.L35
	cmpq	$1, %rbp
	je	.L39
	leaq	-1(%rbx,%rbp), %rbx
.L39:
	leaq	1(%rbx), %rsi
	leaq	.LC0(%rip), %rdi
	call	create_string@PLT
	movb	$0, (%rax)
	movq	%rax, %rbx
	movq	(%r12), %rbp
	movb	$1, %al
	leaq	.LC2(%rip), %r12
.L40:
	testq	%rbp, %rbp
	je	.L59
	cmpq	$0, 8(%rbp)
	je	.L41
	testb	%al, %al
	jne	.L42
	movq	0(%rbp), %rdi
	movq	%r12, %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L42
	cmpb	$0, (%rbx)
	je	.L42
	movq	%rbx, %rdi
	call	strlen@PLT
	cmpb	$47, -1(%rbx,%rax)
	je	.L42
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	strcat@PLT
.L42:
	movq	0(%rbp), %rsi
	movq	%rbx, %rdi
	call	strcat@PLT
	xorl	%eax, %eax
.L41:
	movq	8(%rbp), %rbp
	jmp	.L40
.L59:
	movq	%rbx, %rdi
	call	strlen@PLT
	popq	%rcx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 32
	movq	%rax, %rsi
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 8
	jmp	create_string@PLT
.L35:
	.cfi_restore_state
	popq	%rdx
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L56:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE55:
	.size	get_file_dir, .-get_file_dir
	.globl	get_full_path
	.type	get_full_path, @function
get_full_path:
.LFB56:
	.cfi_startproc
	endbr64
	movq	24(%rdi), %rax
	ret
	.cfi_endproc
.LFE56:
	.size	get_full_path, .-get_full_path
	.globl	change_file_extension
	.type	change_file_extension, @function
change_file_extension:
.LFB57:
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
	leaq	.LC0(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	movq	%r12, %r14
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%rsi, 8(%rdi)
	call	get_file_dir
	testq	%rax, %rax
	movq	%rax, %r13
	cmovne	%rax, %r14
	testq	%rbx, %rbx
	movq	%r12, %rax
	cmovne	%rbx, %rax
	movq	%r14, %rdi
	movq	%rax, 8(%rsp)
	call	strlen@PLT
	movq	16(%rbp), %rdi
	movq	%rax, %r15
	call	strlen@PLT
	leaq	1(%r15,%rax), %r15
	testq	%rbx, %rbx
	je	.L64
	movq	8(%rsp), %rdi
	call	strlen@PLT
	addq	%rax, %r15
.L64:
	movq	%r12, %rdi
	leaq	1(%r15), %rsi
	call	create_string@PLT
	testq	%r13, %r13
	movq	16(%rbp), %r9
	movq	%rax, %r12
	je	.L65
	cmpb	$0, (%r14)
	je	.L65
	movq	%rax, %rdi
	movq	%r14, %r8
	leaq	.LC1(%rip), %rcx
	xorl	%eax, %eax
	orq	$-1, %rdx
	movl	$2, %esi
	call	__sprintf_chk@PLT
	jmp	.L66
.L65:
	movq	%r9, %rsi
	movq	%r12, %rdi
	call	strcpy@PLT
.L66:
	testq	%rbx, %rbx
	je	.L67
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	strcat@PLT
.L67:
	movq	%r12, %rdi
	call	strlen@PLT
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	create_string@PLT
	movq	%rax, 24(%rbp)
	addq	$24, %rsp
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
	.cfi_endproc
.LFE57:
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
.LFB58:
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
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	(%rdi), %rax
	movq	%rsi, 16(%rdi)
	testq	%rax, %rax
	je	.L82
.L81:
	movq	%rax, %r15
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L81
	movq	8(%rbx), %r13
	leaq	.LC0(%rip), %r14
	movq	%rbp, %rdi
	movq	%r14, %rax
	testq	%r13, %r13
	cmovne	%r13, %rax
	movq	%rax, (%rsp)
	call	strlen@PLT
	movq	%rax, %r12
	testq	%r13, %r13
	je	.L84
	movq	(%rsp), %rdi
	call	strlen@PLT
	addq	%rax, %r12
.L84:
	leaq	1(%r12), %rsi
	movq	%r14, %rdi
	call	create_string@PLT
	movq	(%rsp), %r9
	movq	%rbp, %r8
	orq	$-1, %rdx
	movq	%rax, %r12
	leaq	.LC3(%rip), %rcx
	movl	$2, %esi
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	__sprintf_chk@PLT
	movq	%r12, %rdi
	call	strlen@PLT
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	create_string@PLT
	movq	%rax, (%r15)
.L82:
	movq	%rbx, %rdi
	leaq	.LC0(%rip), %r12
	call	get_file_dir
	movq	%r12, %r15
	movq	8(%rbx), %rdx
	movq	%r12, %r14
	testq	%rax, %rax
	movq	%rax, %r13
	cmovne	%rax, %r15
	testq	%rdx, %rdx
	movq	%rdx, 8(%rsp)
	cmovne	%rdx, %r14
	movq	%r15, %rdi
	call	strlen@PLT
	movq	%rbp, %rdi
	movq	%rax, (%rsp)
	call	strlen@PLT
	movq	(%rsp), %rcx
	movq	8(%rsp), %rdx
	leaq	1(%rcx,%rax), %rsi
	testq	%rdx, %rdx
	je	.L88
	movq	%r14, %rdi
	movq	%rsi, (%rsp)
	call	strlen@PLT
	movq	(%rsp), %rsi
	addq	%rax, %rsi
.L88:
	movq	%r12, %rdi
	incq	%rsi
	call	create_string@PLT
	movq	%rax, %r12
	testq	%r13, %r13
	je	.L89
	cmpb	$0, (%r15)
	je	.L89
	pushq	%rax
	.cfi_def_cfa_offset 88
	leaq	.LC4(%rip), %rcx
	orq	$-1, %rdx
	movq	%rbp, %r9
	pushq	%r14
	.cfi_def_cfa_offset 96
	movq	%r15, %r8
	movl	$2, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	__sprintf_chk@PLT
	popq	%rdx
	.cfi_def_cfa_offset 88
	popq	%rcx
	.cfi_def_cfa_offset 80
	jmp	.L90
.L89:
	movq	%r14, %r9
	movq	%rbp, %r8
	leaq	.LC3(%rip), %rcx
	movq	%r12, %rdi
	orq	$-1, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	__sprintf_chk@PLT
.L90:
	movq	%r12, %rdi
	call	strlen@PLT
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	create_string@PLT
	movq	%rax, 24(%rbx)
	addq	$24, %rsp
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
	.cfi_endproc
.LFE58:
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
.LFB59:
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
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$312, %rsp
	.cfi_def_cfa_offset 368
	movq	24(%rdi), %rdi
	movq	%fs:40, %rax
	movq	%rax, 296(%rsp)
	xorl	%eax, %eax
	call	strlen@PLT
	leaq	.LC0(%rip), %rdi
	leaq	1(%rax), %rsi
	movq	%rax, %r13
	call	create_string@PLT
	movq	24(%rbp), %rsi
	movq	%rax, %rdi
	movq	%rax, 8(%rsp)
	call	strcpy@PLT
	testq	%r13, %r13
	je	.L127
	movq	8(%rsp), %rax
	cmpb	$47, (%rax)
	jne	.L127
	movl	$16, %edi
	call	alloc_memory@PLT
	movl	$1, %esi
	leaq	.LC2(%rip), %rdi
	movq	%rax, %r14
	call	create_string@PLT
	xorl	%edi, %edi
	movl	$1, %esi
	movq	%rax, (%r14)
	movq	%rdi, 8(%r14)
	jmp	.L106
.L127:
	xorl	%esi, %esi
	xorl	%r14d, %r14d
.L106:
	movq	%rsi, %r12
	movq	%r14, %rbx
.L107:
	cmpq	%r12, %r13
	jb	.L161
	cmpq	%r13, %r12
	je	.L108
	movq	8(%rsp), %rax
	cmpb	$47, (%rax,%r12)
	jne	.L109
.L108:
	cmpq	%r12, %rsi
	jnb	.L110
	movq	%r12, %rax
	movl	$256, %ecx
	subq	%rsi, %rax
	movq	%rax, 24(%rsp)
	movq	8(%rsp), %rax
	movq	24(%rsp), %rdx
	addq	%rax, %rsi
	leaq	40(%rsp), %rax
	movq	%rax, %rdi
	movq	%rax, 16(%rsp)
	call	__strncpy_chk@PLT
	movq	24(%rsp), %rax
	movq	16(%rsp), %rdi
	leaq	.LC5(%rip), %rsi
	movb	$0, 40(%rsp,%rax)
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L110
	movq	16(%rsp), %rdi
	leaq	.LC6(%rip), %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L112
	testq	%r14, %r14
	je	.L113
	cmpq	%r14, %rbx
	je	.L113
	movq	(%r14), %rdi
	leaq	.LC6(%rip), %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L128
	movl	$16, %edi
	call	alloc_memory@PLT
	movl	$2, %esi
	leaq	.LC6(%rip), %rdi
	movq	%rax, %r15
	call	create_string@PLT
	xorl	%esi, %esi
	movq	%rax, (%r15)
	movq	%rsi, 8(%r15)
	movq	%r15, 8(%r14)
	jmp	.L160
.L128:
	movq	%rbx, %rax
.L114:
	testq	%rax, %rax
	je	.L110
	movq	8(%rax), %rdx
	cmpq	%r14, %rdx
	je	.L162
	movq	%rdx, %rax
	jmp	.L114
.L162:
	xorl	%ecx, %ecx
	movq	%rax, %r14
	movq	%rcx, 8(%rax)
	jmp	.L110
.L113:
	testq	%rbx, %rbx
	jne	.L110
	movl	$16, %edi
	call	alloc_memory@PLT
	movl	$2, %esi
	leaq	.LC6(%rip), %rdi
	movq	%rax, %rbx
	call	create_string@PLT
	xorl	%edx, %edx
	movq	%rax, (%rbx)
	movq	%rdx, 8(%rbx)
	jmp	.L159
.L112:
	cmpb	$0, 40(%rsp)
	je	.L110
	movl	$16, %edi
	call	alloc_memory@PLT
	movq	24(%rsp), %rsi
	movq	16(%rsp), %rdi
	movq	%rax, %r15
	call	create_string@PLT
	movq	%rax, (%r15)
	xorl	%eax, %eax
	movq	%rax, 8(%r15)
	testq	%r14, %r14
	je	.L115
	movq	%r15, 8(%r14)
.L115:
	testq	%rbx, %rbx
	je	.L130
.L160:
	movq	%r15, %r14
	jmp	.L110
.L130:
	movq	%r15, %rbx
.L159:
	movq	%rbx, %r14
.L110:
	leaq	1(%r12), %rsi
.L109:
	incq	%r12
	jmp	.L107
.L161:
	movq	%rbx, 0(%rbp)
	testq	%r14, %r14
	je	.L117
	movq	(%r14), %r14
	movl	$46, %esi
	movq	%r14, %rdi
	call	strrchr@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L117
	cmpq	%rax, %r14
	je	.L117
	movq	%rax, %rsi
	movq	%r14, %rdi
	subq	%r14, %rsi
	call	create_string@PLT
	movq	%r12, %rdi
	movq	%rax, 16(%rbp)
	call	strlen@PLT
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	create_string@PLT
	jmp	.L118
.L117:
	movq	%r14, 16(%rbp)
	xorl	%eax, %eax
.L118:
	movq	%rax, 8(%rbp)
	movq	%rbx, %r14
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
.L119:
	testq	%r14, %r14
	je	.L163
	movq	(%r14), %rdi
	incq	%r13
	call	strlen@PLT
	movq	8(%r14), %r14
	addq	%rax, %r12
	jmp	.L119
.L163:
	cmpq	$1, %r13
	jbe	.L121
	leaq	-1(%r12,%r13), %r12
.L121:
	leaq	1(%r12), %rsi
	leaq	.LC0(%rip), %rdi
	call	create_string@PLT
	leaq	.LC2(%rip), %r13
	movb	$0, (%rax)
	movq	%rax, %r12
	movb	$1, %al
.L122:
	testq	%rbx, %rbx
	je	.L164
	testb	%al, %al
	jne	.L123
	movq	(%rbx), %rdi
	movq	%r13, %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L123
	cmpb	$0, (%r12)
	je	.L123
	movq	%r12, %rdi
	call	strlen@PLT
	cmpb	$47, -1(%r12,%rax)
	je	.L123
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	strcat@PLT
.L123:
	movq	(%rbx), %rsi
	movq	%r12, %rdi
	call	strcat@PLT
	movq	8(%rbx), %rbx
	xorl	%eax, %eax
	jmp	.L122
.L164:
	movq	%r12, %rdi
	call	strlen@PLT
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	create_string@PLT
	movq	%rax, 24(%rbp)
	movq	296(%rsp), %rax
	subq	%fs:40, %rax
	je	.L125
	call	__stack_chk_fail@PLT
.L125:
	addq	$312, %rsp
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
	.cfi_endproc
.LFE59:
	.size	normalize_path, .-normalize_path
	.globl	create_file
	.type	create_file, @function
create_file:
.LFB51:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	movl	$32, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	pushq	%rax
	.cfi_def_cfa_offset 32
	call	alloc_memory@PLT
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	absolute_path
	movq	%rbx, %rdi
	movq	%rax, 24(%rbx)
	call	normalize_path
	movq	%rbx, %rax
	popq	%rdx
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE51:
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
