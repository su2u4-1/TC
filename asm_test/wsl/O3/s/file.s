	.file	"file.c"
	.text
	.p2align 4
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
	.p2align 4
	.globl	absolute_path
	.type	absolute_path, @function
absolute_path:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	pushq	%rbx
	call	*strlen@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L4
	movq	%rax, %r13
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
	cmpq	%r13, %rbx
	jnb	.L36
.L14:
	leaq	(%r12,%rbx), %rbp
	movzbl	0(%rbp), %edx
	cmpb	$92, %dl
	jne	.L5
	movb	$47, 0(%rbp)
	cmpq	$1, %rbx
	jbe	.L10
	leaq	1(%rbx), %rsi
.L11:
	leaq	-1(%r12,%rbx), %rdi
	movzbl	(%rdi), %eax
	cmpb	$46, %al
	je	.L37
.L8:
	cmpb	$47, %al
	jne	.L20
	movq	%r13, %rdx
	subq	$1, %r13
	addq	%r12, %rsi
	movq	%rbp, %rdi
	subq	%rbx, %rdx
	call	*memmove@GOTPCREL(%rip)
	cmpq	%r13, %rbx
	jb	.L14
	.p2align 4,,10
	.p2align 3
.L36:
	testq	%r13, %r13
	je	.L4
	cmpb	$47, (%r12)
	je	.L25
.L15:
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	*getcwd@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L25
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	leaq	.LC0(%rip), %rdi
	leaq	2(%r13,%rax), %r13
	movq	%r13, %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	%r12, %r9
	movq	%rbx, %r8
	movl	$2, %esi
	movq	%rax, %rbp
	movq	%rax, %rdi
	xorl	%eax, %eax
	movq	$-1, %rdx
	leaq	.LC1(%rip), %rcx
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	%rbx, %rdi
	call	*free@GOTPCREL(%rip)
	popq	%rbx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	*create_string@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L37:
	leaq	-2(%rbx), %r14
	leaq	(%r12,%r14), %rbp
	cmpb	$47, 0(%rbp)
	jne	.L20
	movq	%r13, %rdx
	addq	%r12, %rsi
	subq	$2, %r13
	subq	%rbx, %rdx
	movq	%r14, %rbx
	call	*memmove@GOTPCREL(%rip)
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
	popq	%rbx
	movq	%r12, %rax
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	xorl	%r13d, %r13d
	jmp	.L15
.L38:
	cmpb	$47, 0(%rbp)
	leaq	1(%rbx), %rsi
	jne	.L20
	movzbl	-1(%r12,%rbx), %eax
	jmp	.L8
	.size	absolute_path, .-absolute_path
	.p2align 4
	.globl	get_file_name
	.type	get_file_name, @function
get_file_name:
	movq	16(%rdi), %rax
	ret
	.size	get_file_name, .-get_file_name
	.p2align 4
	.globl	get_file_extension
	.type	get_file_extension, @function
get_file_extension:
	movq	8(%rdi), %rax
	ret
	.size	get_file_extension, .-get_file_extension
	.p2align 4
	.globl	get_file_dir
	.type	get_file_dir, @function
get_file_dir:
	movq	(%rdi), %rdx
	testq	%rdx, %rdx
	je	.L68
	pushq	%r13
	xorl	%r13d, %r13d
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	xorl	%ebp, %ebp
	pushq	%rbx
	subq	$8, %rsp
	movq	8(%rdx), %rbx
	testq	%rbx, %rbx
	je	.L41
	.p2align 4,,10
	.p2align 3
.L43:
	movq	(%rdx), %rdi
	addq	$1, %r13
	call	*strlen@GOTPCREL(%rip)
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
	call	*create_string@GOTPCREL(%rip)
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
	call	*strlen@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	0(%rbp,%rax), %rdi
	call	*stpcpy@GOTPCREL(%rip)
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
	call	*strlen@GOTPCREL(%rip)
	addq	$8, %rsp
	movq	%rbp, %rdi
	popq	%rbx
	movq	%rax, %rsi
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	*create_string@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L73:
	cmpb	$0, 1(%r12)
	je	.L51
	jmp	.L54
.L41:
	popq	%rdx
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L68:
	xorl	%eax, %eax
	ret
	.size	get_file_dir, .-get_file_dir
	.p2align 4
	.globl	get_full_path
	.type	get_full_path, @function
get_full_path:
	movq	24(%rdi), %rax
	ret
	.size	get_full_path, .-get_full_path
	.p2align 4
	.globl	change_file_extension
	.type	change_file_extension, @function
change_file_extension:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movq	%rdi, %rbx
	subq	$8, %rsp
	movq	%rsi, 8(%rdi)
	call	get_file_dir
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L76
	movq	%rax, %rdi
	movq	%r13, %r15
	leaq	.LC0(%rip), %r14
	call	*strlen@GOTPCREL(%rip)
	movq	16(%rbx), %rdi
	movq	%rax, %r12
	call	*strlen@GOTPCREL(%rip)
	addq	%r12, %rax
	leaq	1(%rax), %r12
	testq	%rbp, %rbp
	je	.L94
.L86:
	movq	%rbp, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%r14, %rdi
	leaq	1(%r12,%rax), %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%r13, %r13
	je	.L95
	cmpb	$0, (%r15)
	jne	.L96
.L79:
	movq	16(%rbx), %rsi
	movq	%r12, %rdi
	call	*strcpy@GOTPCREL(%rip)
.L80:
	testq	%rbp, %rbp
	je	.L82
.L81:
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	*strcat@GOTPCREL(%rip)
.L82:
	movq	%r12, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 24(%rbx)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L94:
	leaq	2(%rax), %rsi
	movq	%r14, %rdi
	call	*create_string@GOTPCREL(%rip)
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
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L76:
	movq	16(%rbx), %rdi
	call	*strlen@GOTPCREL(%rip)
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
	call	*create_string@GOTPCREL(%rip)
	movq	16(%rbx), %rsi
	movq	%rax, %r12
	movq	%rax, %rdi
	call	*strcpy@GOTPCREL(%rip)
	jmp	.L82
	.p2align 4,,10
	.p2align 3
.L95:
	movq	16(%rbx), %rsi
	movq	%r12, %rdi
	call	*strcpy@GOTPCREL(%rip)
	jmp	.L81
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
	pushq	%r15
	pushq	%r14
	leaq	.LC0(%rip), %r14
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
	je	.L99
	.p2align 4,,10
	.p2align 3
.L98:
	movq	%rax, %r12
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L98
	movq	8(%rbx), %r15
	movq	%rbp, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%r15, %r15
	je	.L110
	movq	%r15, %rdi
	leaq	.LC0(%rip), %r14
	call	*strlen@GOTPCREL(%rip)
	addq	%rax, %r13
.L100:
	leaq	1(%r13), %rsi
	movq	%r14, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%r15, %r9
	movq	%rbp, %r8
	movl	$2, %esi
	movq	%rax, %r13
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	%r13, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%r13, %rdi
	movq	%rax, %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, (%r12)
.L99:
	movq	%rbx, %rdi
	call	get_file_dir
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L102
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rbp, %rdi
	movq	8(%rbx), %r15
	movq	%rax, %r13
	call	*strlen@GOTPCREL(%rip)
	movq	%r12, %r8
	leaq	0(%r13,%rax), %rsi
	leaq	1(%rsi), %r13
	testq	%r15, %r15
	je	.L115
.L109:
	movq	%r8, 8(%rsp)
	movq	%r15, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%r14, %rdi
	leaq	1(%r13,%rax), %rsi
	call	*create_string@GOTPCREL(%rip)
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
	call	*__sprintf_chk@GOTPCREL(%rip)
.L106:
	movq	%r13, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%r13, %rdi
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
	.p2align 4,,10
	.p2align 3
.L115:
	addq	$2, %rsi
	movq	%r12, 8(%rsp)
	movq	%r14, %rdi
	leaq	.LC0(%rip), %r15
	call	*create_string@GOTPCREL(%rip)
	movq	8(%rsp), %r8
	movq	%rax, %r13
	cmpb	$0, (%r8)
	je	.L105
.L116:
	subq	$8, %rsp
	movq	$-1, %rdx
	movq	%rbp, %r9
	xorl	%eax, %eax
	pushq	%r15
	leaq	.LC3(%rip), %rcx
	movl	$2, %esi
	movq	%r13, %rdi
	call	*__sprintf_chk@GOTPCREL(%rip)
	popq	%rax
	popq	%rdx
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
	movq	8(%rbx), %r15
	movq	%rbp, %rdi
	call	*strlen@GOTPCREL(%rip)
	leaq	.LC0(%rip), %r8
	leaq	1(%rax), %r13
	testq	%r15, %r15
	jne	.L109
	leaq	2(%rax), %rsi
	movq	%r14, %rdi
	leaq	.LC0(%rip), %r15
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %r13
	jmp	.L105
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	xorl	%ebp, %ebp
	pushq	%rbx
	xorl	%ebx, %ebx
	subq	$296, %rsp
	movq	24(%rdi), %rdi
	call	*strlen@GOTPCREL(%rip)
	leaq	.LC0(%rip), %rdi
	leaq	1(%rax), %rsi
	movq	%rax, %r15
	call	*create_string@GOTPCREL(%rip)
	movq	24(%r12), %rsi
	movq	%rax, %r14
	movq	%rax, %rdi
	call	*strcpy@GOTPCREL(%rip)
	testq	%r15, %r15
	je	.L118
	cmpb	$47, (%r14)
	je	.L184
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
	je	.L185
	cmpb	$47, (%r14,%rax)
	jne	.L122
	cmpq	%rax, %rsi
	jb	.L120
.L123:
	movq	%rbp, %rsi
	jmp	.L122
	.p2align 4,,10
	.p2align 3
.L185:
	cmpq	%r15, %rsi
	jb	.L120
.L121:
	movq	%rbx, (%r12)
	testq	%r13, %r13
	je	.L135
	movq	0(%r13), %r13
	movl	$46, %esi
	movq	%r13, %rdi
	call	*strrchr@GOTPCREL(%rip)
	movq	%rax, %rbp
	cmpq	%rax, %r13
	je	.L135
	testq	%rax, %rax
	je	.L135
	movq	%rax, %rsi
	movq	%r13, %rdi
	subq	%r13, %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	%rbp, %rdi
	movq	%rax, 16(%r12)
	call	*strlen@GOTPCREL(%rip)
	movq	%rbp, %rdi
	movq	%rax, %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%r12)
	testq	%rbx, %rbx
	je	.L137
.L188:
	movq	%rbx, %rbp
	xorl	%r15d, %r15d
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L138:
	movq	0(%rbp), %rdi
	addq	$1, %r15
	call	*strlen@GOTPCREL(%rip)
	movq	8(%rbp), %rbp
	addq	%rax, %r14
	testq	%rbp, %rbp
	jne	.L138
	leaq	1(%r14), %rax
	cmpq	$1, %r15
	leaq	(%r14,%r15), %rsi
	cmovbe	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movb	$0, (%rax)
	movq	(%rbx), %rbp
	movq	%rax, %r13
	.p2align 4,,10
	.p2align 3
.L144:
	movq	%r13, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	0(%r13,%rax), %rdi
	call	*stpcpy@GOTPCREL(%rip)
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L140
	movq	(%rbx), %rbp
	cmpb	$47, 0(%rbp)
	je	.L186
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
	movq	%rax, 8(%rsp)
	movq	%rax, %rdx
	call	*__strncpy_chk@GOTPCREL(%rip)
	movq	8(%rsp), %r8
	movq	%rax, %r10
	movb	$0, 32(%rsp,%r8)
	cmpw	$46, (%rax)
	je	.L123
	cmpw	$11822, (%rax)
	je	.L187
.L127:
	cmpb	$0, 32(%rsp)
	je	.L123
	movq	%r10, 24(%rsp)
	movl	$16, %edi
	movq	%r8, 8(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	24(%rsp), %r10
	movq	8(%rsp), %rsi
	movq	%rax, 16(%rsp)
	movq	%r10, 8(%rsp)
	movq	%r10, %rdi
	call	*create_string@GOTPCREL(%rip)
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
	jne	.L188
.L137:
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movb	$0, (%rax)
	movq	%rax, %r13
.L140:
	movq	%r13, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%r13, %rdi
	movq	%rax, %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 24(%r12)
	addq	$296, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L186:
	cmpb	$0, 1(%rbp)
	je	.L144
	jmp	.L147
	.p2align 4,,10
	.p2align 3
.L187:
	cmpb	$0, 2(%rax)
	jne	.L127
	testq	%r13, %r13
	je	.L130
	cmpq	%r13, %rbx
	je	.L130
	movq	0(%r13), %rax
	cmpb	$46, (%rax)
	je	.L189
.L150:
	movq	%rbx, %rax
	jmp	.L132
	.p2align 4,,10
	.p2align 3
.L151:
	movq	%rdx, %rax
.L132:
	testq	%rax, %rax
	je	.L123
	movq	8(%rax), %rdx
	cmpq	%r13, %rdx
	jne	.L151
	movq	$0, 8(%rax)
	movq	%rax, %r13
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L184:
	movl	$16, %edi
	movl	$1, %ebp
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$1, %esi
	leaq	.LC4(%rip), %rdi
	movq	%rax, %rbx
	call	*create_string@GOTPCREL(%rip)
	movq	$0, 8(%rbx)
	movq	%rax, (%rbx)
	jmp	.L118
	.p2align 4,,10
	.p2align 3
.L130:
	testq	%rbx, %rbx
	jne	.L123
	movq	%r10, 8(%rsp)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$2, %esi
	leaq	.LC6(%rip), %rdi
	movq	%rax, %rbx
	call	*create_string@GOTPCREL(%rip)
	movq	%rbx, %r13
	movq	8(%rsp), %r10
	movq	$0, 8(%rbx)
	movq	%rax, (%rbx)
	jmp	.L123
.L189:
	cmpb	$46, 1(%rax)
	jne	.L150
	cmpb	$0, 2(%rax)
	jne	.L150
	movq	%r10, 16(%rsp)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$2, %esi
	leaq	.LC6(%rip), %rdi
	movq	%rax, 8(%rsp)
	call	*create_string@GOTPCREL(%rip)
	movq	8(%rsp), %rdx
	movq	16(%rsp), %r10
	movq	%rax, (%rdx)
	movq	$0, 8(%rdx)
	movq	%rdx, 8(%r13)
	movq	%rdx, %r13
	jmp	.L123
	.size	normalize_path, .-normalize_path
	.p2align 4
	.globl	create_file
	.type	create_file, @function
create_file:
	pushq	%rbp
	movq	%rdi, %rbp
	movl	$32, %edi
	pushq	%rbx
	subq	$8, %rsp
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	absolute_path
	movq	%rbx, %rdi
	movq	%rax, 24(%rbx)
	call	normalize_path
	addq	$8, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	ret
	.size	create_file, .-create_file
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
