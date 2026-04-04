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
	movq	%rsi, %r12
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L4
	movl	$0, %edx
	jmp	.L11
.L24:
	movb	$47, (%rcx)
	cmpq	$1, %rdx
	jbe	.L21
.L6:
	leaq	-1(%rbx,%rdx), %rdi
	cmpb	$46, (%rdi)
	je	.L22
.L10:
	leaq	(%rbx,%rdx), %rdi
	cmpb	$47, (%rdi)
	jne	.L9
.L16:
	leaq	-1(%rdx), %r13
	cmpb	$47, -1(%rbx,%rdx)
	jne	.L9
	movq	%rbp, %rax
	subq	%rdx, %rax
	leaq	1(%rbx,%rdx), %rsi
	movq	%rax, %rdx
	call	*memmove@GOTPCREL(%rip)
	subq	$1, %rbp
	movq	%r13, %rdx
	jmp	.L9
.L22:
	leaq	-2(%rdx), %r13
	cmpb	$47, -2(%rbx,%rdx)
	jne	.L10
	movq	%rbp, %rax
	subq	%rdx, %rax
	leaq	1(%rbx,%rdx), %rsi
	movq	%rax, %rdx
	call	*memmove@GOTPCREL(%rip)
	subq	$2, %rbp
	movq	%r13, %rdx
.L8:
	testq	%rdx, %rdx
	jne	.L10
.L9:
	addq	$1, %rdx
	cmpq	%rbp, %rdx
	jnb	.L23
.L11:
	leaq	(%rbx,%rdx), %rcx
	movzbl	(%rcx), %eax
	cmpb	$92, %al
	je	.L24
	cmpq	$1, %rdx
	jbe	.L8
	cmpb	$47, %al
	jne	.L9
	jmp	.L6
.L23:
	cmpq	$1, %rbp
	jbe	.L12
	movzbl	(%rbx), %eax
	subl	$65, %eax
	cmpb	$25, %al
	ja	.L13
	cmpb	$58, 1(%rbx)
	je	.L25
.L13:
	cmpb	$47, (%rbx)
	je	.L3
.L4:
	testq	%r12, %r12
	je	.L26
.L15:
	movq	%r12, %rdi
	call	*strlen@GOTPCREL(%rip)
	leaq	2(%rbp,%rax), %r13
	movq	%r13, %rsi
	leaq	.LC0(%rip), %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%rbx, %r9
	movq	%r12, %r8
	leaq	.LC1(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rdi
	movl	$0, %esi
	call	absolute_path
	movq	%rax, %rbx
.L3:
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L25:
	leaq	1(%rbx), %rsi
	movq	%rbp, %rdx
	movq	%rbx, %rdi
	call	*memmove@GOTPCREL(%rip)
	movb	$47, (%rbx)
	movb	$47, 2(%rbx)
	jmp	.L3
.L12:
	testq	%rbp, %rbp
	je	.L4
	jmp	.L13
.L26:
	movl	$0, %esi
	movl	$0, %edi
	call	*getcwd@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L15
	jmp	.L3
.L21:
	testq	%rdx, %rdx
	je	.L9
	leaq	(%rbx,%rdx), %rdi
	jmp	.L16
	.size	absolute_path, .-absolute_path
	.section	.rodata.str1.1
.LC2:
	.string	"/"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"Warning: Path component too long, truncating to %zu characters\n"
	.section	.rodata.str1.1
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
	subq	$296, %rsp
	movq	%rdi, %rbx
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r15
	movl	$0, %esi
	movq	%rbx, %rdi
	call	absolute_path
	movq	%rax, %rdi
	movq	%rax, 24(%r15)
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %r12
	leaq	1(%rax), %rsi
	leaq	.LC0(%rip), %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%rax, %r14
	movq	24(%r15), %rsi
	movq	%rax, %rdi
	call	*strcpy@GOTPCREL(%rip)
	testq	%r12, %r12
	je	.L49
	movl	$0, %ebx
	movq	$0, 8(%rsp)
	cmpb	$47, (%r14)
	jne	.L28
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%rax, 8(%rsp)
	movl	$1, %esi
	leaq	.LC2(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, (%rbx)
	movq	$0, 8(%rbx)
	movl	$1, %ebx
	jmp	.L28
.L62:
	movl	$255, %ecx
	leaq	.LC3(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	$255, 16(%rsp)
	jmp	.L32
.L51:
	movq	%rbp, %rax
	jmp	.L36
.L52:
	movq	%rdx, %rax
.L36:
	testq	%rax, %rax
	je	.L31
	movq	8(%rax), %rdx
	movq	8(%rsp), %rcx
	cmpq	%rcx, %rdx
	jne	.L52
	movq	$0, 8(%rax)
	movq	%rax, 8(%rsp)
	jmp	.L31
.L35:
	testq	%rbp, %rbp
	jne	.L31
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	movl	$2, %esi
	leaq	.LC5(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 0(%rbp)
	movq	$0, 8(%rbp)
	movq	%rbp, 8(%rsp)
	jmp	.L31
.L34:
	cmpb	$0, 32(%rsp)
	jne	.L60
.L31:
	leaq	1(%rbx), %r13
.L30:
	leaq	1(%rbx), %rax
	cmpq	%rbx, %r12
	je	.L61
	movq	%rax, %rbx
.L39:
	cmpq	%rbx, %r12
	je	.L29
	cmpb	$47, (%r14,%rbx)
	jne	.L30
.L29:
	cmpq	%rbx, %r13
	jnb	.L31
	movq	%rbx, %rax
	subq	%r13, %rax
	movq	%rax, 16(%rsp)
	cmpq	$255, %rax
	ja	.L62
.L32:
	leaq	(%r14,%r13), %rsi
	movq	16(%rsp), %rdx
	movq	24(%rsp), %r13
	movq	%r13, %rdi
	call	*strncpy@GOTPCREL(%rip)
	movq	16(%rsp), %rax
	movb	$0, 32(%rsp,%rax)
	leaq	.LC4(%rip), %rsi
	movq	%r13, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L31
	leaq	.LC5(%rip), %rsi
	movq	%r13, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L34
	movq	8(%rsp), %rax
	testq	%rax, %rax
	je	.L35
	cmpq	%rbp, %rax
	je	.L35
	movq	(%rax), %rdi
	leaq	.LC5(%rip), %rsi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L51
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r13
	movl	$2, %esi
	leaq	.LC5(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 0(%r13)
	movq	$0, 8(%r13)
	movq	8(%rsp), %rax
	movq	%r13, 8(%rax)
	movq	%r13, 8(%rsp)
	jmp	.L31
.L60:
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r13
	leaq	32(%rsp), %rdi
	movq	16(%rsp), %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 0(%r13)
	movq	$0, 8(%r13)
	movq	8(%rsp), %rax
	testq	%rax, %rax
	je	.L38
	movq	%r13, 8(%rax)
.L38:
	testq	%rbp, %rbp
	je	.L53
	movq	%r13, 8(%rsp)
	jmp	.L31
.L53:
	movq	%r13, 8(%rsp)
	movq	%r13, %rbp
	jmp	.L31
.L61:
	movq	%rbp, (%r15)
	movq	8(%rsp), %rax
	testq	%rax, %rax
	je	.L40
	movq	(%rax), %r12
	movl	$46, %esi
	movq	%r12, %rdi
	call	*strrchr@GOTPCREL(%rip)
	movq	%rax, %rbx
	cmpq	%rax, %r12
	je	.L41
	testq	%rax, %rax
	je	.L41
	movq	%rax, %rsi
	subq	%r12, %rsi
	movq	%r12, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 16(%r15)
	movq	%rbx, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	jmp	.L42
.L41:
	movq	%r12, 16(%r15)
	movq	$0, 8(%rsp)
.L42:
	movq	8(%rsp), %rax
	movq	%rax, 8(%r15)
	testq	%rbp, %rbp
	je	.L43
	movq	%rbp, %rbx
	movl	$0, %r12d
	movl	$0, %r13d
.L44:
	movq	(%rbx), %rdi
	call	*strlen@GOTPCREL(%rip)
	addq	%rax, %r13
	movq	%r12, %rax
	addq	$1, %r12
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L44
	addq	%r13, %rax
	cmpq	$1, %r12
	cmova	%rax, %r13
	leaq	1(%r13), %rsi
	leaq	.LC0(%rip), %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%rax, %rbx
	movb	$0, (%rax)
	movl	$1, %eax
	leaq	.LC2(%rip), %r12
	jmp	.L47
.L40:
	movq	$0, 16(%r15)
	jmp	.L42
.L46:
	movq	0(%rbp), %rsi
	movq	%rbx, %rdi
	call	*strcat@GOTPCREL(%rip)
	movq	8(%rbp), %rbp
	movl	$0, %eax
	testq	%rbp, %rbp
	je	.L48
.L47:
	testb	%al, %al
	jne	.L46
	movq	0(%rbp), %rdi
	movq	%r12, %rsi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L46
	cmpb	$0, (%rbx)
	je	.L46
	movq	%rbx, %rdi
	call	*strlen@GOTPCREL(%rip)
	cmpb	$47, -1(%rbx,%rax)
	je	.L46
	movw	$47, (%rbx,%rax)
	jmp	.L46
.L43:
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%rax, %rbx
	movb	$0, (%rax)
.L48:
	movq	%rbx, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 24(%r15)
	movq	%r15, %rax
	addq	$296, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L49:
	movq	%r12, %rbx
	movq	$0, 8(%rsp)
.L28:
	movq	8(%rsp), %rbp
	movq	%rbx, %r13
	leaq	32(%rsp), %rax
	movq	%rax, 24(%rsp)
	jmp	.L39
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
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L73
	movq	%rdi, %r13
	movl	$0, %r12d
	movl	$0, %ebp
	jmp	.L68
.L76:
	movq	(%rax), %rdi
	call	*strlen@GOTPCREL(%rip)
	addq	%rax, %rbp
	addq	$1, %r12
	movq	%rbx, %rax
.L68:
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L76
	testq	%r12, %r12
	je	.L65
	leaq	-1(%rbp,%r12), %rax
	cmpq	$1, %r12
	cmova	%rax, %rbp
	leaq	1(%rbp), %rsi
	leaq	.LC0(%rip), %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%rax, %rbp
	movb	$0, (%rax)
	movq	0(%r13), %rbx
	testq	%rbx, %rbx
	je	.L70
	movl	$1, %eax
	leaq	.LC2(%rip), %r12
	jmp	.L72
.L71:
	movq	(%rbx), %rsi
	movq	%rbp, %rdi
	call	*strcat@GOTPCREL(%rip)
	movq	8(%rbx), %rbx
	movl	$0, %eax
	testq	%rbx, %rbx
	je	.L70
.L72:
	cmpq	$0, 8(%rbx)
	je	.L70
	testb	%al, %al
	jne	.L71
	movq	(%rbx), %rdi
	movq	%r12, %rsi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L71
	cmpb	$0, 0(%rbp)
	je	.L71
	movq	%rbp, %rdi
	call	*strlen@GOTPCREL(%rip)
	cmpb	$47, -1(%rbp,%rax)
	je	.L71
	movw	$47, 0(%rbp,%rax)
	jmp	.L71
.L70:
	movq	%rbp, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbp, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rbx
.L65:
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L73:
	movq	%rax, %rbx
	jmp	.L65
	.size	get_file_dir, .-get_file_dir
	.section	.rodata.str1.1
.LC6:
	.string	"%s/%s%s"
.LC7:
	.string	"%s%s"
	.text
	.type	rebuild_full_path, @function
rebuild_full_path:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	call	get_file_dir
	movq	%rax, %rbp
	testq	%rax, %rax
	leaq	.LC0(%rip), %r13
	cmovne	%rax, %r13
	movq	8(%rbx), %r14
	testq	%r14, %r14
	je	.L88
	movq	%r13, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	16(%rbx), %rdi
	call	*strlen@GOTPCREL(%rip)
	leaq	1(%r12,%rax), %r12
	movq	%r14, %rdi
	call	*strlen@GOTPCREL(%rip)
	leaq	(%rax,%r12), %rsi
.L83:
	addq	$1, %rsi
	leaq	.LC0(%rip), %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rbp, %rbp
	je	.L81
	cmpb	$0, 0(%r13)
	jne	.L89
.L81:
	movq	%r14, %r9
	movq	16(%rbx), %r8
	leaq	.LC7(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	movq	%r12, %rdi
	movl	$0, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
.L82:
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
.L89:
	subq	$8, %rsp
	pushq	%r14
	movq	16(%rbx), %r9
	movq	%r13, %r8
	leaq	.LC6(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	addq	$16, %rsp
	jmp	.L82
.L88:
	movq	%r13, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	16(%rbx), %rdi
	call	*strlen@GOTPCREL(%rip)
	leaq	1(%r12,%rax), %rsi
	leaq	.LC0(%rip), %r14
	jmp	.L83
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
	subq	$8, %rsp
	movq	%rsi, 8(%rdi)
	call	rebuild_full_path
	addq	$8, %rsp
	ret
	.size	change_file_extension, .-change_file_extension
	.globl	change_file_name
	.type	change_file_name, @function
change_file_name:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbp
	movq	%rsi, %r12
	movq	%rsi, 16(%rdi)
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L95
.L94:
	movq	%rax, %rbx
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L94
	movq	8(%rbp), %r14
	testq	%r14, %r14
	je	.L104
	movq	%r12, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %r13
	movq	%r14, %rdi
	call	*strlen@GOTPCREL(%rip)
	leaq	(%rax,%r13), %rsi
.L99:
	addq	$1, %rsi
	leaq	.LC0(%rip), %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%rax, %r13
	movq	%r14, %r9
	movq	%r12, %r8
	leaq	.LC7(%rip), %rcx
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
	movq	%rax, (%rbx)
.L95:
	movq	%rbp, %rdi
	call	rebuild_full_path
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L104:
	movq	%r12, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rsi
	leaq	.LC0(%rip), %r14
	jmp	.L99
	.size	change_file_name, .-change_file_name
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
