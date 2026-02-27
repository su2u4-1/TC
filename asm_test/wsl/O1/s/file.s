	.file	"file.c"
	.text
	.globl	get_cwd
	.type	get_cwd, @function
get_cwd:
	subq	$8, %rsp
	movl	$0, %esi
	movl	$0, %edi
	call	*getcwd@GOTPCREL(%rip)
	addq	$8, %rsp
	ret
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
	subq	$8, %rsp
	movq	%rdi, %rbx
	call	*strlen@GOTPCREL(%rip)
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
	call	*memmove@GOTPCREL(%rip)
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
	call	*memmove@GOTPCREL(%rip)
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
	call	*strlen@GOTPCREL(%rip)
	leaq	2(%rbp,%rax), %r13
	movq	%r13, %rsi
	leaq	.LC0(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%rbx, %r9
	movq	%r12, %r8
	leaq	.LC1(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	%r12, %rdi
	call	*free@GOTPCREL(%rip)
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	*create_string@GOTPCREL(%rip)
.L3:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L20:
	testq	%rax, %rax
	je	.L9
	leaq	(%rbx,%rax), %rdi
	jmp	.L13
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
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L34
	movq	%rdi, %r13
	movl	$0, %r12d
	movl	$0, %ebp
	jmp	.L29
.L37:
	movq	(%rax), %rdi
	call	*strlen@GOTPCREL(%rip)
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
	call	*create_string@GOTPCREL(%rip)
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
	call	*strcat@GOTPCREL(%rip)
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
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L32
	cmpb	$0, 0(%rbp)
	je	.L32
	movq	%rbp, %rdi
	call	*strlen@GOTPCREL(%rip)
	cmpb	$47, -1(%rbp,%rax)
	je	.L32
	movw	$47, 0(%rbp,%rax)
	jmp	.L32
.L31:
	movq	%rbp, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbp, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rbx
.L26:
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L34:
	movq	%rax, %rbx
	jmp	.L26
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
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
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
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	16(%rbx), %rdi
	call	*strlen@GOTPCREL(%rip)
	leaq	1(%r12,%rax), %r12
	movq	%rbp, %rdi
	call	*strlen@GOTPCREL(%rip)
	leaq	(%rax,%r12), %rsi
.L46:
	addq	$1, %rsi
	leaq	.LC0(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%r13, %r13
	je	.L43
	cmpb	$0, (%r14)
	jne	.L52
.L43:
	movq	16(%rbx), %rsi
	movq	%r12, %rdi
	call	*strcpy@GOTPCREL(%rip)
.L44:
	testq	%rbp, %rbp
	je	.L45
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	*strcat@GOTPCREL(%rip)
.L45:
	movq	%r12, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%r12, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 24(%rbx)
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L52:
	movq	16(%rbx), %r9
	movq	%r14, %r8
	leaq	.LC1(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L44
.L51:
	movq	%r14, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	16(%rbx), %rdi
	call	*strlen@GOTPCREL(%rip)
	leaq	1(%r12,%rax), %rsi
	jmp	.L46
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
	pushq	%rbx
	subq	$8, %rsp
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
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %r13
	movq	%r14, %rdi
	call	*strlen@GOTPCREL(%rip)
	leaq	(%rax,%r13), %rsi
.L65:
	addq	$1, %rsi
	leaq	.LC0(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %r13
	movq	%r14, %r9
	movq	%r12, %r8
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	%r13, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%r13, %rdi
	call	*create_string@GOTPCREL(%rip)
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
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %r13
	movq	%r12, %rdi
	call	*strlen@GOTPCREL(%rip)
	leaq	1(%r13,%rax), %r13
	movq	%r15, %rdi
	call	*strlen@GOTPCREL(%rip)
	leaq	(%rax,%r13), %rsi
.L64:
	addq	$1, %rsi
	leaq	.LC0(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
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
	call	*__sprintf_chk@GOTPCREL(%rip)
.L63:
	movq	%r13, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%r13, %rdi
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
.L74:
	subq	$8, %rsp
	pushq	%r15
	movq	%r12, %r9
	movq	%r14, %r8
	leaq	.LC4(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	addq	$16, %rsp
	jmp	.L63
.L73:
	movq	%r14, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %r13
	movq	%r12, %rdi
	call	*strlen@GOTPCREL(%rip)
	leaq	1(%r13,%rax), %rsi
	leaq	.LC0(%rip), %r15
	jmp	.L64
.L72:
	movq	%r12, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rsi
	leaq	.LC0(%rip), %r14
	jmp	.L65
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
	pushq	%rbx
	subq	$280, %rsp
	movq	%rdi, %r14
	movq	24(%rdi), %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %r12
	leaq	1(%rax), %rsi
	leaq	.LC0(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %r13
	movq	24(%r14), %rsi
	movq	%rax, %rdi
	call	*strcpy@GOTPCREL(%rip)
	testq	%r12, %r12
	je	.L96
	movl	$0, %esi
	movl	$0, %ebp
	cmpb	$47, 0(%r13)
	jne	.L76
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	movl	$1, %esi
	leaq	.LC2(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 0(%rbp)
	movq	$0, 8(%rbp)
	movl	$1, %esi
	jmp	.L76
.L77:
	cmpq	%rbx, %rsi
	jb	.L107
.L79:
	leaq	1(%rbx), %rsi
.L78:
	leaq	1(%rbx), %rax
	cmpq	%rbx, %r12
	je	.L108
	movq	%rax, %rbx
.L86:
	cmpq	%rbx, %r12
	je	.L77
	cmpb	$47, 0(%r13,%rbx)
	jne	.L78
	jmp	.L77
.L107:
	movq	%rbx, %rax
	subq	%rsi, %rax
	addq	%r13, %rsi
	leaq	16(%rsp), %rdi
	movl	$256, %ecx
	movq	%rax, (%rsp)
	movq	%rax, %rdx
	movq	%rdi, 8(%rsp)
	call	*__strncpy_chk@GOTPCREL(%rip)
	movq	(%rsp), %rax
	movb	$0, 16(%rsp,%rax)
	leaq	.LC5(%rip), %rsi
	movq	8(%rsp), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L79
	leaq	16(%rsp), %rdi
	leaq	.LC6(%rip), %rsi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L81
	testq	%r15, %r15
	je	.L82
	cmpq	%r15, %rbp
	je	.L82
	movq	(%r15), %rdi
	leaq	.LC6(%rip), %rsi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L98
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, (%rsp)
	movl	$2, %esi
	leaq	.LC6(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	$0, 8(%rcx)
	movq	%rcx, 8(%r15)
	movq	%rcx, %r15
	jmp	.L79
.L98:
	movq	%rbp, %rax
	jmp	.L83
.L99:
	movq	%rdx, %rax
.L83:
	testq	%rax, %rax
	je	.L79
	movq	8(%rax), %rdx
	cmpq	%r15, %rdx
	jne	.L99
	movq	$0, 8(%rax)
	movq	%rax, %r15
	jmp	.L79
.L82:
	testq	%rbp, %rbp
	jne	.L79
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	movl	$2, %esi
	leaq	.LC6(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 0(%rbp)
	movq	$0, 8(%rbp)
	movq	%rbp, %r15
	jmp	.L79
.L81:
	cmpb	$0, 16(%rsp)
	je	.L79
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	leaq	16(%rsp), %rdi
	movq	(%rsp), %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	8(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	$0, 8(%rcx)
	testq	%r15, %r15
	je	.L85
	movq	%rcx, 8(%r15)
.L85:
	testq	%rbp, %rbp
	je	.L100
	movq	8(%rsp), %r15
	jmp	.L79
.L100:
	movq	8(%rsp), %rbp
	movq	%rbp, %r15
	jmp	.L79
.L108:
	movq	%rbp, (%r14)
	testq	%r15, %r15
	je	.L87
	movq	(%r15), %r12
	movl	$46, %esi
	movq	%r12, %rdi
	call	*strrchr@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpq	%rax, %r12
	je	.L88
	testq	%rax, %rax
	je	.L88
	movq	%rax, %rsi
	subq	%r12, %rsi
	movq	%r12, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 16(%r14)
	movq	%rbx, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	*create_string@GOTPCREL(%rip)
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
	call	*strlen@GOTPCREL(%rip)
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
	call	*create_string@GOTPCREL(%rip)
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
	call	*strcat@GOTPCREL(%rip)
	movq	8(%rbp), %rbp
	movl	$0, %eax
	testq	%rbp, %rbp
	je	.L95
.L94:
	testb	%al, %al
	jne	.L93
	movq	0(%rbp), %rdi
	movq	%r12, %rsi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L93
	cmpb	$0, (%rbx)
	je	.L93
	movq	%rbx, %rdi
	call	*strlen@GOTPCREL(%rip)
	cmpb	$47, -1(%rbx,%rax)
	je	.L93
	movw	$47, (%rbx,%rax)
	jmp	.L93
.L90:
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rbx
	movb	$0, (%rax)
.L95:
	movq	%rbx, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 24(%r14)
	addq	$280, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L96:
	movq	%r12, %rsi
	movl	$0, %ebp
.L76:
	movq	%rsi, %rbx
	movq	%rbp, %r15
	jmp	.L86
	.size	normalize_path, .-normalize_path
	.globl	create_file
	.type	create_file, @function
create_file:
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbp
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%rbp, %rdi
	call	absolute_path
	movq	%rax, 24(%rbx)
	movq	%rbx, %rdi
	call	normalize_path
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.size	create_file, .-create_file
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
