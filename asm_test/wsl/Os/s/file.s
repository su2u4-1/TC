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
	pushq	%r14
	pushq	%r13
	leaq	.LC0(%rip), %r13
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	pushq	%rbx
	subq	$16, %rsp
.L20:
	movq	%rdi, 8(%rsp)
	call	*strlen@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movq	%rax, %rsi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rbp
	xorl	%eax, %eax
.L3:
	cmpq	%rbp, %rax
	jnb	.L35
	leaq	(%rbx,%rax), %rcx
	movb	(%rcx), %dl
	cmpb	$92, %dl
	jne	.L4
	movb	$47, (%rcx)
	cmpq	$1, %rax
	jbe	.L9
.L10:
	leaq	-1(%rbx,%rax), %rdi
	cmpb	$46, (%rdi)
	jne	.L11
	jmp	.L36
.L4:
	cmpq	$1, %rax
	jbe	.L9
	cmpb	$47, %dl
	jne	.L11
	jmp	.L10
.L36:
	cmpb	$47, -2(%rbx,%rax)
	leaq	-2(%rax), %r14
	jne	.L11
	movq	%rbp, %rdx
	leaq	1(%rbx,%rax), %rsi
	subq	$2, %rbp
	subq	%rax, %rdx
	call	*memmove@GOTPCREL(%rip)
	movq	%r14, %rax
.L9:
	testq	%rax, %rax
	je	.L12
.L11:
	leaq	(%rbx,%rax), %rdi
	cmpb	$47, (%rdi)
	jne	.L12
	cmpb	$47, -1(%rbx,%rax)
	leaq	-1(%rax), %r14
	jne	.L12
	movq	%rbp, %rdx
	leaq	1(%rbx,%rax), %rsi
	decq	%rbp
	subq	%rax, %rdx
	call	*memmove@GOTPCREL(%rip)
	movq	%r14, %rax
.L12:
	incq	%rax
	jmp	.L3
.L35:
	cmpq	$1, %rbp
	jbe	.L14
	movsbl	(%rbx), %edi
	leal	-65(%rdi), %eax
	cmpb	$25, %al
	ja	.L15
	cmpb	$58, 1(%rbx)
	jne	.L16
	call	*to_lower@GOTPCREL(%rip)
	leaq	1(%rbx), %rsi
	movq	%rbp, %rdx
	movq	%rbx, %rdi
	call	*memmove@GOTPCREL(%rip)
	movb	$47, (%rbx)
	movb	$47, 2(%rbx)
	jmp	.L2
.L14:
	testq	%rbp, %rbp
	je	.L16
.L15:
	cmpb	$47, (%rbx)
	je	.L2
.L16:
	testq	%r12, %r12
	jne	.L18
	call	get_cwd
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L2
.L18:
	movq	%r12, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%r13, %rdi
	leaq	2(%rbp,%rax), %r14
	movq	%r14, %rsi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%r12, %r8
	movq	%rbx, %r9
	orq	$-1, %rdx
	movq	%rax, %rbp
	movq	%rax, %rdi
	leaq	.LC1(%rip), %rcx
	xorl	%eax, %eax
	movl	$2, %esi
	xorl	%r12d, %r12d
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rdi
	jmp	.L20
.L2:
	addq	$16, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	absolute_path, .-absolute_path
	.section	.rodata.str1.1
.LC2:
	.string	"/"
.LC3:
	.string	"Warning: Path component too long, truncating to %zu characters\n"
.LC4:
	.string	"."
.LC5:
	.string	".."
	.text
	.globl	create_file
	.type	create_file, @function
create_file:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	movl	$32, %edi
	subq	$296, %rsp
	call	*alloc_memory@GOTPCREL(%rip)
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	absolute_path
	movq	%rax, %rdi
	movq	%rax, 24(%rbp)
	call	*strlen@GOTPCREL(%rip)
	leaq	.LC0(%rip), %rdi
	leaq	1(%rax), %rsi
	movq	%rax, 16(%rsp)
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	24(%rbp), %rsi
	movq	%rax, %r13
	movq	%rax, %rdi
	call	*strcpy@GOTPCREL(%rip)
	cmpq	$0, 16(%rsp)
	je	.L59
	cmpb	$47, 0(%r13)
	jne	.L59
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	leaq	.LC2(%rip), %rdi
	movl	$1, %esi
	movq	%rax, %r15
	call	*create_string@GOTPCREL(%rip)
	xorl	%edi, %edi
	movl	$1, %r9d
	movq	%rax, (%r15)
	movq	%rdi, 8(%r15)
	jmp	.L38
.L59:
	xorl	%r9d, %r9d
	xorl	%r15d, %r15d
.L38:
	movq	%r9, %r12
	movq	%r15, %rbx
.L39:
	cmpq	%r12, 16(%rsp)
	jb	.L92
	je	.L40
	cmpb	$47, 0(%r13,%r12)
	jne	.L41
.L40:
	cmpq	%r12, %r9
	jnb	.L42
	movq	%r12, %r14
	subq	%r9, %r14
	cmpq	$255, %r14
	jbe	.L43
	movq	%r9, 8(%rsp)
	movq	%r14, %rcx
	movl	$2, %esi
	xorl	%eax, %eax
	movq	stderr(%rip), %rdi
	leaq	.LC3(%rip), %rdx
	movl	$255, %r14d
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	8(%rsp), %r9
.L43:
	leaq	32(%rsp), %rax
	leaq	0(%r13,%r9), %rsi
	movq	%r14, %rdx
	movq	%rax, %rdi
	movq	%rax, 8(%rsp)
	call	*strncpy@GOTPCREL(%rip)
	movb	$0, 32(%rsp,%r14)
	movq	8(%rsp), %rdi
	leaq	.LC4(%rip), %rsi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L42
	movq	8(%rsp), %rdi
	leaq	.LC5(%rip), %rsi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L45
	testq	%r15, %r15
	je	.L46
	cmpq	%rbx, %r15
	je	.L46
	movq	(%r15), %rdi
	leaq	.LC5(%rip), %rsi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L60
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$2, %esi
	leaq	.LC5(%rip), %rdi
	movq	%rax, %r14
	call	*create_string@GOTPCREL(%rip)
	xorl	%esi, %esi
	movq	%rax, (%r14)
	movq	%rsi, 8(%r14)
	movq	%r14, 8(%r15)
	movq	%r14, %r15
	jmp	.L42
.L60:
	movq	%rbx, %rax
.L47:
	testq	%rax, %rax
	je	.L42
	movq	8(%rax), %rdx
	cmpq	%rdx, %r15
	je	.L93
	movq	%rdx, %rax
	jmp	.L47
.L93:
	xorl	%ecx, %ecx
	movq	%rax, %r15
	movq	%rcx, 8(%rax)
	jmp	.L42
.L46:
	testq	%rbx, %rbx
	jne	.L42
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$2, %esi
	leaq	.LC5(%rip), %rdi
	movq	%rax, %rbx
	call	*create_string@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	%rax, (%rbx)
	movq	%rdx, 8(%rbx)
	jmp	.L91
.L45:
	cmpb	$0, 32(%rsp)
	je	.L42
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	movq	%r14, %rsi
	movq	%rax, 24(%rsp)
	call	*create_string@GOTPCREL(%rip)
	movq	24(%rsp), %rdx
	movq	%rax, (%rdx)
	xorl	%eax, %eax
	movq	%rax, 8(%rdx)
	testq	%r15, %r15
	je	.L48
	movq	%rdx, 8(%r15)
.L48:
	movq	%rdx, %r15
	testq	%rbx, %rbx
	jne	.L42
	movq	%rdx, %rbx
.L91:
	movq	%rbx, %r15
.L42:
	leaq	1(%r12), %r9
.L41:
	incq	%r12
	jmp	.L39
.L92:
	movq	%rbx, 0(%rbp)
	testq	%r15, %r15
	je	.L50
	movq	(%r15), %r15
	movl	$46, %esi
	movq	%r15, %rdi
	call	*strrchr@GOTPCREL(%rip)
	movq	%rax, %r12
	cmpq	%rax, %r15
	je	.L50
	testq	%rax, %rax
	je	.L50
	movq	%rax, %rsi
	movq	%r15, %rdi
	subq	%r15, %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	%r12, %rdi
	movq	%rax, 16(%rbp)
	call	*strlen@GOTPCREL(%rip)
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	*create_string@GOTPCREL(%rip)
	jmp	.L51
.L50:
	movq	%r15, 16(%rbp)
	xorl	%eax, %eax
.L51:
	movq	%rax, 8(%rbp)
	movq	%rbx, %r14
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
.L52:
	testq	%r14, %r14
	je	.L94
	movq	(%r14), %rdi
	incq	%r13
	call	*strlen@GOTPCREL(%rip)
	movq	8(%r14), %r14
	addq	%rax, %r12
	jmp	.L52
.L94:
	cmpq	$1, %r13
	jbe	.L54
	leaq	-1(%r12,%r13), %r12
.L54:
	leaq	1(%r12), %rsi
	leaq	.LC0(%rip), %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	leaq	.LC2(%rip), %r13
	movb	$0, (%rax)
	movq	%rax, %r12
	movb	$1, %al
.L55:
	testq	%rbx, %rbx
	je	.L95
	testb	%al, %al
	jne	.L56
	movq	(%rbx), %rdi
	movq	%r13, %rsi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L56
	cmpb	$0, (%r12)
	je	.L56
	movq	%r12, %rdi
	call	*strlen@GOTPCREL(%rip)
	cmpb	$47, -1(%r12,%rax)
	je	.L56
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	*strcat@GOTPCREL(%rip)
.L56:
	movq	(%rbx), %rsi
	movq	%r12, %rdi
	call	*strcat@GOTPCREL(%rip)
	movq	8(%rbx), %rbx
	xorl	%eax, %eax
	jmp	.L55
.L95:
	movq	%r12, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 24(%rbp)
	addq	$296, %rsp
	movq	%rbp, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	create_file, .-create_file
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
	.globl	get_file_dir
	.type	get_file_dir, @function
get_file_dir:
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L119
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	xorl	%ebp, %ebp
	pushq	%rbx
	xorl	%ebx, %ebx
	pushq	%rsi
.L101:
	movq	8(%rax), %r13
	testq	%r13, %r13
	je	.L100
	movq	(%rax), %rdi
	incq	%rbp
	call	*strlen@GOTPCREL(%rip)
	addq	%rax, %rbx
	movq	%r13, %rax
	jmp	.L101
.L100:
	testq	%rbp, %rbp
	je	.L98
	cmpq	$1, %rbp
	je	.L102
	leaq	-1(%rbx,%rbp), %rbx
.L102:
	leaq	1(%rbx), %rsi
	leaq	.LC0(%rip), %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	movb	$0, (%rax)
	movq	%rax, %rbx
	movq	(%r12), %rbp
	movb	$1, %al
	leaq	.LC2(%rip), %r12
.L103:
	testq	%rbp, %rbp
	je	.L122
	cmpq	$0, 8(%rbp)
	je	.L104
	testb	%al, %al
	jne	.L105
	movq	0(%rbp), %rdi
	movq	%r12, %rsi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L105
	cmpb	$0, (%rbx)
	je	.L105
	movq	%rbx, %rdi
	call	*strlen@GOTPCREL(%rip)
	cmpb	$47, -1(%rbx,%rax)
	je	.L105
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*strcat@GOTPCREL(%rip)
.L105:
	movq	0(%rbp), %rsi
	movq	%rbx, %rdi
	call	*strcat@GOTPCREL(%rip)
	xorl	%eax, %eax
.L104:
	movq	8(%rbp), %rbp
	jmp	.L103
.L122:
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
.L98:
	popq	%rdx
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L119:
	xorl	%eax, %eax
	ret
	.size	get_file_dir, .-get_file_dir
	.section	.rodata.str1.1
.LC6:
	.string	"%s/%s%s"
.LC7:
	.string	"%s%s"
	.text
	.type	rebuild_full_path, @function
rebuild_full_path:
	pushq	%r15
	leaq	.LC0(%rip), %r15
	pushq	%r14
	movq	%r15, %r14
	pushq	%r13
	movq	%r15, %r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	subq	$24, %rsp
	call	get_file_dir
	movq	8(%rbx), %rdx
	testq	%rax, %rax
	movq	%rax, %r12
	cmovne	%rax, %r14
	testq	%rdx, %rdx
	movq	%rdx, 8(%rsp)
	cmovne	%rdx, %r13
	movq	%r14, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	16(%rbx), %rdi
	movq	%rax, %rbp
	call	*strlen@GOTPCREL(%rip)
	movq	8(%rsp), %rdx
	leaq	1(%rbp,%rax), %rbp
	testq	%rdx, %rdx
	je	.L126
	movq	%r13, %rdi
	call	*strlen@GOTPCREL(%rip)
	addq	%rax, %rbp
.L126:
	leaq	1(%rbp), %rsi
	movq	%r15, %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	testq	%r12, %r12
	movq	16(%rbx), %r8
	movq	%rax, %rbp
	je	.L127
	cmpb	$0, (%r14)
	je	.L127
	movq	%r8, %r9
	leaq	.LC6(%rip), %rcx
	movq	%r14, %r8
	movq	%rbp, %rdi
	orq	$-1, %rdx
	movl	$2, %esi
	pushq	%rax
	xorl	%eax, %eax
	pushq	%r13
	call	*__sprintf_chk@GOTPCREL(%rip)
	popq	%rdx
	popq	%rcx
	jmp	.L128
.L127:
	movq	%r13, %r9
	leaq	.LC7(%rip), %rcx
	orq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	movq	%rbp, %rdi
	call	*__sprintf_chk@GOTPCREL(%rip)
.L128:
	movq	%rbp, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rbp, %rdi
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
	.size	rebuild_full_path, .-rebuild_full_path
	.globl	get_full_path
	.type	get_full_path, @function
get_full_path:
	movq	24(%rdi), %rax
	ret
	.size	get_full_path, .-get_full_path
	.globl	change_file_extension
	.type	change_file_extension, @function
change_file_extension:
	movq	%rsi, 8(%rdi)
	jmp	rebuild_full_path
	.size	change_file_extension, .-change_file_extension
	.globl	change_file_name
	.type	change_file_name, @function
change_file_name:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	subq	$24, %rsp
	movq	(%rdi), %rax
	movq	%rsi, 16(%rdi)
	testq	%rax, %rax
	je	.L142
.L141:
	movq	%rax, %r15
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L141
	movq	8(%rbp), %r13
	leaq	.LC0(%rip), %r14
	movq	%r12, %rdi
	movq	%r14, %rax
	testq	%r13, %r13
	cmovne	%r13, %rax
	movq	%rax, 8(%rsp)
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%r13, %r13
	je	.L144
	movq	8(%rsp), %rdi
	call	*strlen@GOTPCREL(%rip)
	addq	%rax, %rbx
.L144:
	leaq	1(%rbx), %rsi
	movq	%r14, %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	8(%rsp), %r9
	movq	%r12, %r8
	orq	$-1, %rdx
	movq	%rax, %rbx
	leaq	.LC7(%rip), %rcx
	movl	$2, %esi
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	%rbx, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, (%r15)
.L142:
	addq	$24, %rsp
	movq	%rbp, %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	rebuild_full_path
	.size	change_file_name, .-change_file_name
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
