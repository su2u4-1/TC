	.file	"file.c"
	.text
	.globl	get_cwd
	.type	get_cwd, @function
get_cwd:
	xorl	%esi, %esi
	xorl	%edi, %edi
	jmp	*getcwd@GOTPCREL(%rip)
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
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	pushq	%rsi
	call	*strlen@GOTPCREL(%rip)
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
	call	*memmove@GOTPCREL(%rip)
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
	call	*memmove@GOTPCREL(%rip)
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
	call	*strlen@GOTPCREL(%rip)
	leaq	.LC0(%rip), %rdi
	leaq	2(%rbp,%rax), %r13
	movq	%r13, %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	%rbx, %r9
	movq	%r12, %r8
	movl	$2, %esi
	movq	%rax, %rbp
	leaq	.LC1(%rip), %rcx
	movq	%rax, %rdi
	orq	$-1, %rdx
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	%r12, %rdi
	call	*free@GOTPCREL(%rip)
	popq	%rcx
	movq	%r13, %rsi
	popq	%rbx
	movq	%rbp, %rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	*create_string@GOTPCREL(%rip)
.L15:
	popq	%rdx
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	absolute_path, .-absolute_path
	.globl	get_file_name
	.type	get_file_name, @function
get_file_name:
	movq	16(%rdi), %rax
	ret
	.size	get_file_name, .-get_file_name
	.globl	get_file_extension
	.type	get_file_extension, @function
get_file_extension:
	movq	8(%rdi), %rax
	ret
	.size	get_file_extension, .-get_file_extension
	.section	.rodata.str1.1
.LC2:
	.string	"/"
	.text
	.globl	get_file_dir
	.type	get_file_dir, @function
get_file_dir:
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L56
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	xorl	%ebp, %ebp
	pushq	%rbx
	xorl	%ebx, %ebx
	pushq	%rsi
.L38:
	movq	8(%rax), %r13
	testq	%r13, %r13
	je	.L37
	movq	(%rax), %rdi
	incq	%rbp
	call	*strlen@GOTPCREL(%rip)
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
	call	*create_string@GOTPCREL(%rip)
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
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L42
	cmpb	$0, (%rbx)
	je	.L42
	movq	%rbx, %rdi
	call	*strlen@GOTPCREL(%rip)
	cmpb	$47, -1(%rbx,%rax)
	je	.L42
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*strcat@GOTPCREL(%rip)
.L42:
	movq	0(%rbp), %rsi
	movq	%rbx, %rdi
	call	*strcat@GOTPCREL(%rip)
	xorl	%eax, %eax
.L41:
	movq	8(%rbp), %rbp
	jmp	.L40
.L59:
	movq	%rbx, %rdi
	call	*strlen@GOTPCREL(%rip)
	popq	%rcx
	movq	%rbx, %rdi
	popq	%rbx
	movq	%rax, %rsi
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	*create_string@GOTPCREL(%rip)
.L35:
	popq	%rdx
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L56:
	xorl	%eax, %eax
	ret
	.size	get_file_dir, .-get_file_dir
	.globl	get_full_path
	.type	get_full_path, @function
get_full_path:
	movq	24(%rdi), %rax
	ret
	.size	get_full_path, .-get_full_path
	.globl	change_file_extension
	.type	change_file_extension, @function
change_file_extension:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	leaq	.LC0(%rip), %r12
	pushq	%rbp
	movq	%rdi, %rbp
	movq	%r12, %r14
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$24, %rsp
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
	call	*strlen@GOTPCREL(%rip)
	movq	16(%rbp), %rdi
	movq	%rax, %r15
	call	*strlen@GOTPCREL(%rip)
	leaq	1(%r15,%rax), %r15
	testq	%rbx, %rbx
	je	.L64
	movq	8(%rsp), %rdi
	call	*strlen@GOTPCREL(%rip)
	addq	%rax, %r15
.L64:
	movq	%r12, %rdi
	leaq	1(%r15), %rsi
	call	*create_string@GOTPCREL(%rip)
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
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L66
.L65:
	movq	%r9, %rsi
	movq	%r12, %rdi
	call	*strcpy@GOTPCREL(%rip)
.L66:
	testq	%rbx, %rbx
	je	.L67
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	*strcat@GOTPCREL(%rip)
.L67:
	movq	%r12, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 24(%rbp)
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movq	%rdi, %rbx
	subq	$24, %rsp
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
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%r13, %r13
	je	.L84
	movq	(%rsp), %rdi
	call	*strlen@GOTPCREL(%rip)
	addq	%rax, %r12
.L84:
	leaq	1(%r12), %rsi
	movq	%r14, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	(%rsp), %r9
	movq	%rbp, %r8
	orq	$-1, %rdx
	movq	%rax, %r12
	leaq	.LC3(%rip), %rcx
	movl	$2, %esi
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	%r12, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	*create_string@GOTPCREL(%rip)
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
	call	*strlen@GOTPCREL(%rip)
	movq	%rbp, %rdi
	movq	%rax, (%rsp)
	call	*strlen@GOTPCREL(%rip)
	movq	(%rsp), %rcx
	movq	8(%rsp), %rdx
	leaq	1(%rcx,%rax), %rsi
	testq	%rdx, %rdx
	je	.L88
	movq	%rsi, (%rsp)
	movq	%r14, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	(%rsp), %rsi
	addq	%rax, %rsi
.L88:
	movq	%r12, %rdi
	incq	%rsi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%r13, %r13
	je	.L89
	cmpb	$0, (%r15)
	je	.L89
	leaq	.LC4(%rip), %rcx
	movq	%rbp, %r9
	movq	%r15, %r8
	movq	%r12, %rdi
	orq	$-1, %rdx
	movl	$2, %esi
	pushq	%rax
	xorl	%eax, %eax
	pushq	%r14
	call	*__sprintf_chk@GOTPCREL(%rip)
	popq	%rdx
	popq	%rcx
	jmp	.L90
.L89:
	movq	%r14, %r9
	movq	%rbp, %r8
	leaq	.LC3(%rip), %rcx
	movq	%r12, %rdi
	orq	$-1, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
.L90:
	movq	%r12, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 24(%rbx)
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	subq	$296, %rsp
	movq	24(%rdi), %rdi
	call	*strlen@GOTPCREL(%rip)
	leaq	.LC0(%rip), %rdi
	movq	%rax, %r13
	leaq	1(%rax), %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	24(%rbp), %rsi
	movq	%rax, 8(%rsp)
	movq	%rax, %rdi
	call	*strcpy@GOTPCREL(%rip)
	testq	%r13, %r13
	je	.L126
	movq	8(%rsp), %rax
	cmpb	$47, (%rax)
	jne	.L126
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$1, %esi
	leaq	.LC2(%rip), %rdi
	movq	%rax, %r14
	call	*create_string@GOTPCREL(%rip)
	xorl	%edi, %edi
	movl	$1, %esi
	movq	%rax, (%r14)
	movq	%rdi, 8(%r14)
	jmp	.L106
.L126:
	xorl	%esi, %esi
	xorl	%r14d, %r14d
.L106:
	movq	%rsi, %r12
	movq	%r14, %rbx
.L107:
	cmpq	%r12, %r13
	jb	.L160
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
	leaq	32(%rsp), %rax
	movq	%rax, %rdi
	movq	%rax, 16(%rsp)
	call	*__strncpy_chk@GOTPCREL(%rip)
	movq	24(%rsp), %rax
	movq	16(%rsp), %rdi
	leaq	.LC5(%rip), %rsi
	movb	$0, 32(%rsp,%rax)
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L110
	movq	16(%rsp), %rdi
	leaq	.LC6(%rip), %rsi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L112
	testq	%r14, %r14
	je	.L113
	cmpq	%r14, %rbx
	je	.L113
	movq	(%r14), %rdi
	leaq	.LC6(%rip), %rsi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L127
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$2, %esi
	leaq	.LC6(%rip), %rdi
	movq	%rax, %r15
	call	*create_string@GOTPCREL(%rip)
	xorl	%esi, %esi
	movq	%rax, (%r15)
	movq	%rsi, 8(%r15)
	movq	%r15, 8(%r14)
	jmp	.L159
.L127:
	movq	%rbx, %rax
.L114:
	testq	%rax, %rax
	je	.L110
	movq	8(%rax), %rdx
	cmpq	%r14, %rdx
	je	.L161
	movq	%rdx, %rax
	jmp	.L114
.L161:
	xorl	%ecx, %ecx
	movq	%rax, %r14
	movq	%rcx, 8(%rax)
	jmp	.L110
.L113:
	testq	%rbx, %rbx
	jne	.L110
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$2, %esi
	leaq	.LC6(%rip), %rdi
	movq	%rax, %rbx
	call	*create_string@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	%rax, (%rbx)
	movq	%rdx, 8(%rbx)
	jmp	.L158
.L112:
	cmpb	$0, 32(%rsp)
	je	.L110
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	24(%rsp), %rsi
	movq	16(%rsp), %rdi
	movq	%rax, %r15
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, (%r15)
	xorl	%eax, %eax
	movq	%rax, 8(%r15)
	testq	%r14, %r14
	je	.L115
	movq	%r15, 8(%r14)
.L115:
	testq	%rbx, %rbx
	je	.L129
.L159:
	movq	%r15, %r14
	jmp	.L110
.L129:
	movq	%r15, %rbx
.L158:
	movq	%rbx, %r14
.L110:
	leaq	1(%r12), %rsi
.L109:
	incq	%r12
	jmp	.L107
.L160:
	movq	%rbx, 0(%rbp)
	testq	%r14, %r14
	je	.L117
	movq	(%r14), %r14
	movl	$46, %esi
	movq	%r14, %rdi
	call	*strrchr@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L117
	cmpq	%rax, %r14
	je	.L117
	movq	%rax, %rsi
	movq	%r14, %rdi
	subq	%r14, %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	%r12, %rdi
	movq	%rax, 16(%rbp)
	call	*strlen@GOTPCREL(%rip)
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	*create_string@GOTPCREL(%rip)
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
	je	.L162
	movq	(%r14), %rdi
	incq	%r13
	call	*strlen@GOTPCREL(%rip)
	movq	8(%r14), %r14
	addq	%rax, %r12
	jmp	.L119
.L162:
	cmpq	$1, %r13
	jbe	.L121
	leaq	-1(%r12,%r13), %r12
.L121:
	leaq	1(%r12), %rsi
	leaq	.LC0(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	leaq	.LC2(%rip), %r13
	movb	$0, (%rax)
	movq	%rax, %r12
	movb	$1, %al
.L122:
	testq	%rbx, %rbx
	je	.L163
	testb	%al, %al
	jne	.L123
	movq	(%rbx), %rdi
	movq	%r13, %rsi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L123
	cmpb	$0, (%r12)
	je	.L123
	movq	%r12, %rdi
	call	*strlen@GOTPCREL(%rip)
	cmpb	$47, -1(%r12,%rax)
	je	.L123
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	*strcat@GOTPCREL(%rip)
.L123:
	movq	(%rbx), %rsi
	movq	%r12, %rdi
	call	*strcat@GOTPCREL(%rip)
	movq	8(%rbx), %rbx
	xorl	%eax, %eax
	jmp	.L122
.L163:
	movq	%r12, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 24(%rbp)
	addq	$296, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	normalize_path, .-normalize_path
	.globl	create_file
	.type	create_file, @function
create_file:
	pushq	%rbp
	movq	%rdi, %rbp
	movl	$32, %edi
	pushq	%rbx
	pushq	%rax
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	absolute_path
	movq	%rbx, %rdi
	movq	%rax, 24(%rbx)
	call	normalize_path
	movq	%rbx, %rax
	popq	%rdx
	popq	%rbx
	popq	%rbp
	ret
	.size	create_file, .-create_file
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
