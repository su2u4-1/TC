	.file	"file.c"
	.text
	.p2align 4
	.globl	get_cwd
	.type	get_cwd, @function
get_cwd:
.LFB65:
	.cfi_startproc
	endbr64
	xorl	%esi, %esi
	xorl	%edi, %edi
	jmp	getcwd@PLT
	.cfi_endproc
.LFE65:
	.size	get_cwd, .-get_cwd
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	""
.LC1:
	.string	"%s/%s"
	.text
	.p2align 4
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
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	strlen@PLT
	testq	%rax, %rax
	je	.L4
	movq	%rax, %r12
	xorl	%ebx, %ebx
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L5:
	cmpq	$1, %rbx
	jbe	.L10
	leaq	1(%rbx), %rsi
	cmpb	$47, %dl
	je	.L11
.L20:
	movq	%rsi, %rbx
.L12:
	cmpq	%r12, %rbx
	jnb	.L36
.L14:
	leaq	0(%rbp,%rbx), %rdi
	movzbl	(%rdi), %edx
	cmpb	$92, %dl
	jne	.L5
	movb	$47, (%rdi)
	cmpq	$1, %rbx
	jbe	.L10
	leaq	1(%rbx), %rsi
.L11:
	leaq	-1(%rbp,%rbx), %rcx
	movzbl	(%rcx), %eax
	cmpb	$46, %al
	je	.L37
.L8:
	cmpb	$47, %al
	jne	.L20
	movq	%r12, %rdx
	addq	%rbp, %rsi
	subq	$1, %r12
	subq	%rbx, %rdx
	call	memmove@PLT
	cmpq	%r12, %rbx
	jb	.L14
	.p2align 4,,10
	.p2align 3
.L36:
	testq	%r12, %r12
	je	.L4
	cmpb	$47, 0(%rbp)
	je	.L25
.L15:
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	getcwd@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L25
	movq	%rax, %rdi
	call	strlen@PLT
	leaq	.LC0(%rip), %rdi
	leaq	2(%r12,%rax), %r13
	movq	%r13, %rsi
	call	create_string@PLT
	movq	%rbp, %r9
	movq	%rbx, %r8
	movl	$2, %esi
	movq	%rax, %r12
	movq	%rax, %rdi
	xorl	%eax, %eax
	movq	$-1, %rdx
	leaq	.LC1(%rip), %rcx
	call	__sprintf_chk@PLT
	movq	%rbx, %rdi
	call	free@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%r13, %rsi
	movq	%r12, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	create_string@PLT
	.p2align 4,,10
	.p2align 3
.L37:
	.cfi_restore_state
	cmpb	$47, -2(%rbp,%rbx)
	leaq	-2(%rbx), %r13
	jne	.L20
	movq	%r12, %rdx
	addq	%rbp, %rsi
	movq	%rcx, %rdi
	subq	$2, %r12
	subq	%rbx, %rdx
	movq	%r13, %rbx
	call	memmove@PLT
	.p2align 4,,10
	.p2align 3
.L10:
	testq	%rbx, %rbx
	jne	.L38
	movl	$1, %ebx
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L25:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%rbp, %rax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	.cfi_restore_state
	xorl	%r12d, %r12d
	jmp	.L15
.L38:
	leaq	0(%rbp,%rbx), %rdi
	leaq	1(%rbx), %rsi
	cmpb	$47, (%rdi)
	jne	.L20
	movzbl	-1(%rbp,%rbx), %eax
	jmp	.L8
	.cfi_endproc
.LFE67:
	.size	absolute_path, .-absolute_path
	.p2align 4
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
	.p2align 4
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
	.p2align 4
	.globl	get_file_dir
	.type	get_file_dir, @function
get_file_dir:
.LFB70:
	.cfi_startproc
	endbr64
	movq	(%rdi), %rdx
	testq	%rdx, %rdx
	je	.L68
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	xorl	%r13d, %r13d
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
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	8(%rdx), %rbx
	testq	%rbx, %rbx
	je	.L41
	.p2align 4,,10
	.p2align 3
.L43:
	movq	(%rdx), %rdi
	addq	$1, %r13
	call	strlen@PLT
	movq	%rbx, %rdx
	addq	%rax, %rbp
	movq	8(%rbx), %rax
	testq	%rax, %rax
	je	.L72
	movq	%rax, %rbx
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L72:
	testq	%r13, %r13
	je	.L41
	leaq	1(%rbp), %rax
	leaq	0(%rbp,%r13), %rsi
	cmpq	$1, %r13
	cmove	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	call	create_string@PLT
	movb	$0, (%rax)
	movq	(%r12), %rbx
	movq	%rax, %rbp
	testq	%rbx, %rbx
	je	.L49
	cmpq	$0, 8(%rbx)
	je	.L49
.L71:
	movq	(%rbx), %r12
.L51:
	movq	%rbp, %rdi
	call	strlen@PLT
	movq	%r12, %rsi
	leaq	0(%rbp,%rax), %rdi
	call	stpcpy@PLT
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L49
	cmpq	$0, 8(%rbx)
	je	.L49
	movq	(%rbx), %r12
	cmpb	$47, (%r12)
	je	.L73
.L54:
	cmpb	$0, 0(%rbp)
	je	.L51
	cmpb	$47, -1(%rax)
	je	.L51
	movl	$47, %ecx
	movw	%cx, (%rax)
	jmp	.L71
	.p2align 4,,10
	.p2align 3
.L49:
	movq	%rbp, %rdi
	call	strlen@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%rbp, %rdi
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
	.p2align 4,,10
	.p2align 3
.L73:
	.cfi_restore_state
	cmpb	$0, 1(%r12)
	je	.L51
	jmp	.L54
.L41:
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
.L68:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE70:
	.size	get_file_dir, .-get_file_dir
	.p2align 4
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
	.p2align 4
	.globl	change_file_extension
	.type	change_file_extension, @function
change_file_extension:
.LFB72:
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
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movq	%rsi, 8(%rdi)
	call	get_file_dir
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L76
	movq	%rax, %rdi
	movq	%r13, %r15
	leaq	.LC0(%rip), %r14
	call	strlen@PLT
	movq	16(%rbx), %rdi
	movq	%rax, %r12
	call	strlen@PLT
	addq	%r12, %rax
	leaq	1(%rax), %r12
	testq	%rbp, %rbp
	je	.L94
.L86:
	movq	%rbp, %rdi
	call	strlen@PLT
	movq	%r14, %rdi
	leaq	1(%r12,%rax), %rsi
	call	create_string@PLT
	movq	%rax, %r12
	testq	%r13, %r13
	je	.L95
	cmpb	$0, (%r15)
	jne	.L96
.L79:
	movq	16(%rbx), %rsi
	movq	%r12, %rdi
	call	strcpy@PLT
.L80:
	testq	%rbp, %rbp
	je	.L82
.L81:
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	strcat@PLT
.L82:
	movq	%r12, %rdi
	call	strlen@PLT
	movq	%r12, %rdi
	movq	%rax, %rsi
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
	.p2align 4,,10
	.p2align 3
.L94:
	.cfi_restore_state
	leaq	2(%rax), %rsi
	movq	%r14, %rdi
	call	create_string@PLT
	cmpb	$0, (%r15)
	movq	%rax, %r12
	je	.L79
.L96:
	movq	16(%rbx), %r9
	movq	%r15, %r8
	leaq	.LC1(%rip), %rcx
	xorl	%eax, %eax
	movq	$-1, %rdx
	movl	$2, %esi
	movq	%r12, %rdi
	call	__sprintf_chk@PLT
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L76:
	movq	16(%rbx), %rdi
	call	strlen@PLT
	testq	%rbp, %rbp
	je	.L85
	leaq	.LC0(%rip), %r14
	leaq	1(%rax), %r12
	movq	%r14, %r15
	jmp	.L86
	.p2align 4,,10
	.p2align 3
.L85:
	leaq	2(%rax), %rsi
	leaq	.LC0(%rip), %rdi
	call	create_string@PLT
	movq	16(%rbx), %rsi
	movq	%rax, %rdi
	movq	%rax, %r12
	call	strcpy@PLT
	jmp	.L82
	.p2align 4,,10
	.p2align 3
.L95:
	movq	16(%rbx), %rsi
	movq	%r12, %rdi
	call	strcpy@PLT
	jmp	.L81
	.cfi_endproc
.LFE72:
	.size	change_file_extension, .-change_file_extension
	.section	.rodata.str1.1
.LC2:
	.string	"%s%s"
.LC3:
	.string	"%s/%s%s"
	.text
	.p2align 4
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
	leaq	.LC0(%rip), %r14
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
	je	.L99
	.p2align 4,,10
	.p2align 3
.L98:
	movq	%rax, %r12
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L98
	movq	%rbp, %rdi
	movq	8(%rbx), %r15
	call	strlen@PLT
	movq	%rax, %r13
	testq	%r15, %r15
	je	.L110
	movq	%r15, %rdi
	leaq	.LC0(%rip), %r14
	call	strlen@PLT
	addq	%rax, %r13
.L100:
	leaq	1(%r13), %rsi
	movq	%r14, %rdi
	call	create_string@PLT
	movq	%r15, %r9
	movq	%rbp, %r8
	movl	$2, %esi
	movq	%rax, %r13
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	__sprintf_chk@PLT
	movq	%r13, %rdi
	call	strlen@PLT
	movq	%r13, %rdi
	movq	%rax, %rsi
	call	create_string@PLT
	movq	%rax, (%r12)
.L99:
	movq	%rbx, %rdi
	call	get_file_dir
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L102
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rbp, %rdi
	movq	8(%rbx), %r15
	movq	%rax, %r13
	call	strlen@PLT
	movq	%r12, %r8
	leaq	0(%r13,%rax), %rsi
	leaq	1(%rsi), %r13
	testq	%r15, %r15
	je	.L115
.L109:
	movq	%r15, %rdi
	movq	%r8, 8(%rsp)
	call	strlen@PLT
	movq	%r14, %rdi
	leaq	1(%r13,%rax), %rsi
	call	create_string@PLT
	testq	%r12, %r12
	movq	8(%rsp), %r8
	movq	%rax, %r13
	je	.L105
	cmpb	$0, (%r8)
	jne	.L116
.L105:
	movq	%r15, %r9
	movq	%rbp, %r8
	leaq	.LC2(%rip), %rcx
	movq	%r13, %rdi
	movq	$-1, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	__sprintf_chk@PLT
.L106:
	movq	%r13, %rdi
	call	strlen@PLT
	movq	%r13, %rdi
	movq	%rax, %rsi
	call	create_string@PLT
	movq	%rax, 24(%rbx)
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
	.p2align 4,,10
	.p2align 3
.L115:
	.cfi_restore_state
	addq	$2, %rsi
	movq	%r14, %rdi
	movq	%r12, 8(%rsp)
	leaq	.LC0(%rip), %r15
	call	create_string@PLT
	movq	8(%rsp), %r8
	movq	%rax, %r13
	cmpb	$0, (%r8)
	je	.L105
.L116:
	subq	$8, %rsp
	.cfi_def_cfa_offset 88
	movq	$-1, %rdx
	movq	%rbp, %r9
	xorl	%eax, %eax
	pushq	%r15
	.cfi_def_cfa_offset 96
	leaq	.LC3(%rip), %rcx
	movl	$2, %esi
	movq	%r13, %rdi
	call	__sprintf_chk@PLT
	popq	%rax
	.cfi_def_cfa_offset 88
	popq	%rdx
	.cfi_def_cfa_offset 80
	jmp	.L106
	.p2align 4,,10
	.p2align 3
.L110:
	leaq	.LC0(%rip), %r14
	movq	%r14, %r15
	jmp	.L100
	.p2align 4,,10
	.p2align 3
.L102:
	movq	%rbp, %rdi
	movq	8(%rbx), %r15
	call	strlen@PLT
	leaq	.LC0(%rip), %r8
	leaq	1(%rax), %r13
	testq	%r15, %r15
	jne	.L109
	leaq	2(%rax), %rsi
	movq	%r14, %rdi
	leaq	.LC0(%rip), %r15
	call	create_string@PLT
	movq	%rax, %r13
	jmp	.L105
	.cfi_endproc
.LFE73:
	.size	change_file_name, .-change_file_name
	.section	.rodata.str1.1
.LC4:
	.string	"/"
.LC5:
	.string	"."
.LC6:
	.string	".."
	.text
	.p2align 4
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
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	xorl	%ebx, %ebx
	subq	$312, %rsp
	.cfi_def_cfa_offset 368
	movq	24(%rdi), %rdi
	movq	%fs:40, %rax
	movq	%rax, 296(%rsp)
	xorl	%eax, %eax
	call	strlen@PLT
	leaq	.LC0(%rip), %rdi
	leaq	1(%rax), %rsi
	movq	%rax, %r15
	call	create_string@PLT
	movq	24(%r12), %rsi
	movq	%rax, %rdi
	movq	%rax, %r14
	call	strcpy@PLT
	testq	%r15, %r15
	je	.L118
	cmpb	$47, (%r14)
	je	.L185
.L118:
	movq	%rbp, %rsi
	movq	%rbx, %r13
	leaq	32(%rsp), %r10
	jmp	.L134
	.p2align 4,,10
	.p2align 3
.L122:
	cmpq	%rbp, %r15
	jb	.L121
.L134:
	movq	%rbp, %rax
	addq	$1, %rbp
	cmpq	%rax, %r15
	je	.L186
	cmpb	$47, (%r14,%rax)
	jne	.L122
	cmpq	%rax, %rsi
	jb	.L120
.L123:
	movq	%rbp, %rsi
	jmp	.L122
	.p2align 4,,10
	.p2align 3
.L186:
	cmpq	%r15, %rsi
	jb	.L120
.L121:
	movq	%rbx, (%r12)
	testq	%r13, %r13
	je	.L135
	movq	0(%r13), %r13
	movl	$46, %esi
	movq	%r13, %rdi
	call	strrchr@PLT
	movq	%rax, %rbp
	cmpq	%rax, %r13
	je	.L135
	testq	%rax, %rax
	je	.L135
	movq	%rax, %rsi
	movq	%r13, %rdi
	subq	%r13, %rsi
	call	create_string@PLT
	movq	%rbp, %rdi
	movq	%rax, 16(%r12)
	call	strlen@PLT
	movq	%rbp, %rdi
	movq	%rax, %rsi
	call	create_string@PLT
	movq	%rax, 8(%r12)
	testq	%rbx, %rbx
	je	.L137
.L189:
	movq	%rbx, %rbp
	xorl	%r15d, %r15d
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L138:
	movq	0(%rbp), %rdi
	addq	$1, %r15
	call	strlen@PLT
	movq	8(%rbp), %rbp
	addq	%rax, %r14
	testq	%rbp, %rbp
	jne	.L138
	leaq	1(%r14), %rax
	cmpq	$1, %r15
	leaq	(%r14,%r15), %rsi
	cmovbe	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	call	create_string@PLT
	movb	$0, (%rax)
	movq	(%rbx), %rbp
	movq	%rax, %r13
	.p2align 4,,10
	.p2align 3
.L144:
	movq	%r13, %rdi
	call	strlen@PLT
	movq	%rbp, %rsi
	leaq	0(%r13,%rax), %rdi
	call	stpcpy@PLT
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L140
	movq	(%rbx), %rbp
	cmpb	$47, 0(%rbp)
	je	.L187
.L147:
	cmpb	$0, 0(%r13)
	je	.L144
	cmpb	$47, -1(%rax)
	je	.L144
	movl	$47, %edx
	movw	%dx, (%rax)
	movq	(%rbx), %rbp
	jmp	.L144
	.p2align 4,,10
	.p2align 3
.L120:
	subq	%rsi, %rax
	movq	%r10, %rdi
	addq	%r14, %rsi
	movl	$256, %ecx
	movq	%rax, %rdx
	movq	%rax, 8(%rsp)
	call	__strncpy_chk@PLT
	movq	8(%rsp), %r8
	movq	%rax, %r10
	movb	$0, 32(%rsp,%r8)
	cmpw	$46, (%rax)
	je	.L123
	cmpw	$11822, (%rax)
	je	.L188
.L127:
	cmpb	$0, 32(%rsp)
	je	.L123
	movl	$16, %edi
	movq	%r10, 24(%rsp)
	movq	%r8, 8(%rsp)
	call	alloc_memory@PLT
	movq	24(%rsp), %r10
	movq	8(%rsp), %rsi
	movq	%rax, 16(%rsp)
	movq	%r10, %rdi
	movq	%r10, 8(%rsp)
	call	create_string@PLT
	movq	16(%rsp), %rdx
	testq	%r13, %r13
	movq	8(%rsp), %r10
	movq	%rax, (%rdx)
	movq	$0, 8(%rdx)
	je	.L133
	movq	%rdx, 8(%r13)
.L133:
	movq	%rdx, %r13
	testq	%rbx, %rbx
	jne	.L123
	movq	%rdx, %rbx
	movq	%rdx, %r13
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L135:
	xorl	%eax, %eax
	movq	%r13, 16(%r12)
	movq	%rax, 8(%r12)
	testq	%rbx, %rbx
	jne	.L189
.L137:
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	create_string@PLT
	movb	$0, (%rax)
	movq	%rax, %r13
	.p2align 4,,10
	.p2align 3
.L140:
	movq	%r13, %rdi
	call	strlen@PLT
	movq	%r13, %rdi
	movq	%rax, %rsi
	call	create_string@PLT
	movq	%rax, 24(%r12)
	movq	296(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L190
	addq	$312, %rsp
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
	.p2align 4,,10
	.p2align 3
.L187:
	.cfi_restore_state
	cmpb	$0, 1(%rbp)
	je	.L144
	jmp	.L147
	.p2align 4,,10
	.p2align 3
.L188:
	cmpb	$0, 2(%rax)
	jne	.L127
	testq	%r13, %r13
	je	.L130
	cmpq	%r13, %rbx
	je	.L130
	movq	0(%r13), %rax
	cmpb	$46, (%rax)
	je	.L191
.L151:
	movq	%rbx, %rax
	jmp	.L132
	.p2align 4,,10
	.p2align 3
.L152:
	movq	%rdx, %rax
.L132:
	testq	%rax, %rax
	je	.L123
	movq	8(%rax), %rdx
	cmpq	%r13, %rdx
	jne	.L152
	movq	$0, 8(%rax)
	movq	%rax, %r13
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L185:
	movl	$16, %edi
	movl	$1, %ebp
	call	alloc_memory@PLT
	movl	$1, %esi
	leaq	.LC4(%rip), %rdi
	movq	%rax, %rbx
	call	create_string@PLT
	movq	$0, 8(%rbx)
	movq	%rax, (%rbx)
	jmp	.L118
	.p2align 4,,10
	.p2align 3
.L130:
	testq	%rbx, %rbx
	jne	.L123
	movl	$16, %edi
	movq	%r10, 8(%rsp)
	call	alloc_memory@PLT
	movl	$2, %esi
	leaq	.LC6(%rip), %rdi
	movq	%rax, %rbx
	call	create_string@PLT
	movq	%rbx, %r13
	movq	8(%rsp), %r10
	movq	$0, 8(%rbx)
	movq	%rax, (%rbx)
	jmp	.L123
.L191:
	cmpb	$46, 1(%rax)
	jne	.L151
	cmpb	$0, 2(%rax)
	jne	.L151
	movl	$16, %edi
	movq	%r10, 16(%rsp)
	call	alloc_memory@PLT
	movl	$2, %esi
	leaq	.LC6(%rip), %rdi
	movq	%rax, 8(%rsp)
	call	create_string@PLT
	movq	8(%rsp), %rdx
	movq	16(%rsp), %r10
	movq	%rax, (%rdx)
	movq	$0, 8(%rdx)
	movq	%rdx, 8(%r13)
	movq	%rdx, %r13
	jmp	.L123
.L190:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE74:
	.size	normalize_path, .-normalize_path
	.p2align 4
	.globl	create_file
	.type	create_file, @function
create_file:
.LFB66:
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
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	alloc_memory@PLT
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	absolute_path
	movq	%rbx, %rdi
	movq	%rax, 24(%rbx)
	call	normalize_path
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movq	%rbx, %rax
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
