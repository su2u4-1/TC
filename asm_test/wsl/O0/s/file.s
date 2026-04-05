	.file	"file.c"
	.text
	.globl	get_cwd
	.type	get_cwd, @function
get_cwd:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$0, %esi
	movl	$0, %edi
	call	*getcwd@GOTPCREL(%rip)
	popq	%rbp
	ret
	.size	get_cwd, .-get_cwd
	.globl	create_file
	.type	create_file, @function
create_file:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	absolute_path
	movq	-8(%rbp), %rdx
	movq	%rax, 24(%rdx)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	normalize_path
	movq	-8(%rbp), %rax
	leave
	ret
	.size	create_file, .-create_file
	.section	.rodata
.LC0:
	.string	""
.LC1:
	.string	"%s/%s"
	.text
	.globl	absolute_path
	.type	absolute_path, @function
absolute_path:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L6
.L10:
	movq	-40(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$92, %al
	jne	.L7
	movq	-40(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movb	$47, (%rax)
.L7:
	cmpq	$1, -16(%rbp)
	jbe	.L8
	movq	-40(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L8
	movq	-16(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$46, %al
	jne	.L8
	movq	-16(%rbp), %rax
	leaq	-2(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L8
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	movq	-16(%rbp), %rdx
	leaq	1(%rdx), %rcx
	movq	-40(%rbp), %rdx
	leaq	(%rcx,%rdx), %rsi
	movq	-16(%rbp), %rdx
	leaq	-1(%rdx), %rcx
	movq	-40(%rbp), %rdx
	addq	%rdx, %rcx
	movq	%rax, %rdx
	movq	%rcx, %rdi
	call	*memmove@GOTPCREL(%rip)
	subq	$2, -8(%rbp)
	subq	$2, -16(%rbp)
.L8:
	cmpq	$0, -16(%rbp)
	je	.L9
	movq	-40(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L9
	movq	-16(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L9
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	movq	-16(%rbp), %rdx
	leaq	1(%rdx), %rcx
	movq	-40(%rbp), %rdx
	leaq	(%rcx,%rdx), %rsi
	movq	-40(%rbp), %rcx
	movq	-16(%rbp), %rdx
	addq	%rdx, %rcx
	movq	%rax, %rdx
	movq	%rcx, %rdi
	call	*memmove@GOTPCREL(%rip)
	subq	$1, -8(%rbp)
	subq	$1, -16(%rbp)
.L9:
	addq	$1, -16(%rbp)
.L6:
	movq	-16(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jb	.L10
	cmpq	$1, -8(%rbp)
	jbe	.L11
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$64, %al
	jle	.L11
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$90, %al
	jg	.L11
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$58, %al
	jne	.L11
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	*tolower@GOTPCREL(%rip)
	movl	%eax, %edx
	movq	-40(%rbp), %rax
	movb	%dl, (%rax)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	-8(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	*memmove@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	movb	$47, (%rax)
	movq	-40(%rbp), %rax
	addq	$2, %rax
	movb	$47, (%rax)
	movq	-40(%rbp), %rax
	jmp	.L12
.L11:
	cmpq	$1, -8(%rbp)
	jbe	.L13
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$64, %al
	jle	.L13
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$90, %al
	jg	.L13
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$58, %al
	jne	.L13
	movq	-40(%rbp), %rax
	jmp	.L12
.L13:
	cmpq	$0, -8(%rbp)
	je	.L14
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L14
	movq	-40(%rbp), %rax
	jmp	.L12
.L14:
	cmpq	$0, -48(%rbp)
	jne	.L15
	call	get_cwd
	movq	%rax, -48(%rbp)
.L15:
	cmpq	$0, -48(%rbp)
	jne	.L16
	movq	-40(%rbp), %rax
	jmp	.L12
.L16:
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	-8(%rbp), %rdx
	addq	%rdx, %rax
	addq	$2, %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%rax, -32(%rbp)
	movq	-40(%rbp), %rcx
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*sprintf@GOTPCREL(%rip)
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movl	$0, %esi
	movq	%rax, %rdi
	call	absolute_path
.L12:
	leave
	ret
	.size	absolute_path, .-absolute_path
	.globl	get_file_name
	.type	get_file_name, @function
get_file_name:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	popq	%rbp
	ret
	.size	get_file_name, .-get_file_name
	.globl	get_file_extension
	.type	get_file_extension, @function
get_file_extension:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	popq	%rbp
	ret
	.size	get_file_extension, .-get_file_extension
	.section	.rodata
.LC2:
	.string	"/"
	.text
	.globl	get_file_dir
	.type	get_file_dir, @function
get_file_dir:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L22
	movl	$0, %eax
	jmp	.L23
.L22:
	movq	$0, -8(%rbp)
	movq	$0, -16(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	jmp	.L24
.L26:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L25
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	addq	%rax, -8(%rbp)
	addq	$1, -16(%rbp)
.L25:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
.L24:
	cmpq	$0, -24(%rbp)
	jne	.L26
	cmpq	$0, -16(%rbp)
	jne	.L27
	movl	$0, %eax
	jmp	.L23
.L27:
	cmpq	$1, -16(%rbp)
	jbe	.L28
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	subq	$1, %rax
	movq	%rax, -8(%rbp)
.L28:
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movb	$0, (%rax)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movb	$1, -25(%rbp)
	jmp	.L29
.L32:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L30
	cmpb	$0, -25(%rbp)
	jne	.L31
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L31
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L31
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	leaq	-1(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	je	.L31
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movw	$47, (%rax)
.L31:
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*strcat@GOTPCREL(%rip)
	movb	$0, -25(%rbp)
.L30:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
.L29:
	cmpq	$0, -24(%rbp)
	jne	.L32
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
.L23:
	leave
	ret
	.size	get_file_dir, .-get_file_dir
	.globl	get_full_path
	.type	get_full_path, @function
get_full_path:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	popq	%rbp
	ret
	.size	get_full_path, .-get_full_path
	.section	.rodata
.LC3:
	.string	"%s/%s%s"
.LC4:
	.string	"%s%s"
	.text
	.type	rebuild_full_path, @function
rebuild_full_path:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$72, %rsp
	movq	%rdi, -72(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	get_file_dir
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L36
	movq	-32(%rbp), %rax
	jmp	.L37
.L36:
	leaq	.LC0(%rip), %rax
.L37:
	movq	%rax, -40(%rbp)
	movq	-72(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L38
	movq	-72(%rbp), %rax
	movq	8(%rax), %rax
	jmp	.L39
.L38:
	leaq	.LC0(%rip), %rax
.L39:
	movq	%rax, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	-72(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	addq	%rbx, %rax
	addq	$1, %rax
	movq	%rax, -24(%rbp)
	movq	-72(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L40
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	addq	%rax, -24(%rbp)
.L40:
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%rax, -56(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L41
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L41
	movq	-72(%rbp), %rax
	movq	16(%rax), %rcx
	movq	-48(%rbp), %rsi
	movq	-40(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rsi, %r8
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*sprintf@GOTPCREL(%rip)
	jmp	.L42
.L41:
	movq	-72(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-48(%rbp), %rcx
	movq	-56(%rbp), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*sprintf@GOTPCREL(%rip)
.L42:
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	-72(%rbp), %rdx
	movq	%rax, 24(%rdx)
	nop
	movq	-8(%rbp), %rbx
	leave
	ret
	.size	rebuild_full_path, .-rebuild_full_path
	.globl	change_file_extension
	.type	change_file_extension, @function
change_file_extension:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	rebuild_full_path
	nop
	leave
	ret
	.size	change_file_extension, .-change_file_extension
	.globl	change_file_name
	.type	change_file_name, @function
change_file_name:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L45
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L46
.L51:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L47
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L48
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	jmp	.L49
.L48:
	leaq	.LC0(%rip), %rax
.L49:
	movq	%rax, -24(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L50
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	addq	%rax, -16(%rbp)
.L50:
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rcx
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*sprintf@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	-8(%rbp), %rdx
	movq	%rax, (%rdx)
	jmp	.L45
.L47:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
.L46:
	cmpq	$0, -8(%rbp)
	jne	.L51
.L45:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	rebuild_full_path
	nop
	leave
	ret
	.size	change_file_name, .-change_file_name
	.section	.rodata
	.align 8
.LC5:
	.string	"Warning: Path component too long, truncating to %zu characters\n"
.LC6:
	.string	"."
.LC7:
	.string	".."
	.text
	.type	normalize_path, @function
normalize_path:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$432, %rsp
	movq	%rdi, -424(%rbp)
	movq	-424(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%rax, -96(%rbp)
	movq	-424(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-96(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*strcpy@GOTPCREL(%rip)
	movq	$0, -8(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	cmpq	$0, -88(%rbp)
	je	.L53
	movq	-96(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L53
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -104(%rbp)
	movl	$1, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	-104(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	-104(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-104(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-104(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	$1, -24(%rbp)
.L53:
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	jmp	.L54
.L69:
	movq	-32(%rbp), %rax
	cmpq	-88(%rbp), %rax
	je	.L55
	movq	-96(%rbp), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L56
.L55:
	movq	-32(%rbp), %rax
	cmpq	%rax, -24(%rbp)
	jnb	.L57
	movq	-32(%rbp), %rax
	subq	-24(%rbp), %rax
	movq	%rax, -40(%rbp)
	cmpq	$255, -40(%rbp)
	jbe	.L58
	movq	$255, -40(%rbp)
	movq	stderr(%rip), %rax
	movq	-40(%rbp), %rdx
	leaq	.LC5(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
.L58:
	movq	-96(%rbp), %rdx
	movq	-24(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movq	-40(%rbp), %rdx
	leaq	-416(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	*strncpy@GOTPCREL(%rip)
	leaq	-416(%rbp), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	leaq	-416(%rbp), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L57
	leaq	-416(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L60
	cmpq	$0, -16(%rbp)
	je	.L61
	movq	-16(%rbp), %rax
	cmpq	-8(%rbp), %rax
	je	.L61
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L62
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -144(%rbp)
	movl	$2, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	-144(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	-144(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-16(%rbp), %rax
	movq	-144(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-144(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L80
.L62:
	movq	-8(%rbp), %rax
	movq	%rax, -48(%rbp)
	jmp	.L64
.L66:
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -48(%rbp)
.L64:
	cmpq	$0, -48(%rbp)
	je	.L65
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, -16(%rbp)
	jne	.L66
.L65:
	cmpq	$0, -48(%rbp)
	je	.L80
	movq	-48(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-48(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L80
.L61:
	cmpq	$0, -8(%rbp)
	jne	.L57
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -152(%rbp)
	movl	$2, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	-152(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	-152(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-152(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-152(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L57
.L60:
	leaq	-416(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L57
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -136(%rbp)
	movq	-40(%rbp), %rdx
	leaq	-416(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	-136(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	-136(%rbp), %rax
	movq	$0, 8(%rax)
	cmpq	$0, -16(%rbp)
	je	.L68
	movq	-16(%rbp), %rax
	movq	-136(%rbp), %rdx
	movq	%rdx, 8(%rax)
.L68:
	movq	-136(%rbp), %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L57
	movq	-136(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L57
.L80:
	nop
.L57:
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -24(%rbp)
.L56:
	addq	$1, -32(%rbp)
.L54:
	movq	-32(%rbp), %rax
	cmpq	%rax, -88(%rbp)
	jnb	.L69
	movq	-424(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	cmpq	$0, -16(%rbp)
	je	.L70
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movl	$46, %esi
	movq	%rax, %rdi
	call	*strrchr@GOTPCREL(%rip)
	movq	%rax, -112(%rbp)
	cmpq	$0, -112(%rbp)
	je	.L71
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, -112(%rbp)
	je	.L71
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	-112(%rbp), %rdx
	subq	%rax, %rdx
	movq	%rdx, -120(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	-120(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	-424(%rbp), %rdx
	movq	%rax, 16(%rdx)
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	-424(%rbp), %rdx
	movq	%rax, 8(%rdx)
	jmp	.L73
.L71:
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-424(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-424(%rbp), %rax
	movq	$0, 8(%rax)
	jmp	.L73
.L70:
	movq	-424(%rbp), %rax
	movq	$0, 16(%rax)
	movq	-424(%rbp), %rax
	movq	$0, 8(%rax)
.L73:
	movq	$0, -56(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -64(%rbp)
	movq	$0, -72(%rbp)
	jmp	.L74
.L75:
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	addq	%rax, -56(%rbp)
	addq	$1, -72(%rbp)
	movq	-64(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -64(%rbp)
.L74:
	cmpq	$0, -64(%rbp)
	jne	.L75
	cmpq	$1, -72(%rbp)
	jbe	.L76
	movq	-72(%rbp), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	subq	$1, %rax
	movq	%rax, -56(%rbp)
.L76:
	movq	-56(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%rax, -128(%rbp)
	movq	-128(%rbp), %rax
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	%rax, -64(%rbp)
	movb	$1, -73(%rbp)
	jmp	.L77
.L79:
	cmpb	$0, -73(%rbp)
	jne	.L78
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L78
	movq	-128(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L78
	movq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	leaq	-1(%rax), %rdx
	movq	-128(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	je	.L78
	movq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-128(%rbp), %rax
	addq	%rdx, %rax
	movw	$47, (%rax)
.L78:
	movq	-64(%rbp), %rax
	movq	(%rax), %rdx
	movq	-128(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*strcat@GOTPCREL(%rip)
	movb	$0, -73(%rbp)
	movq	-64(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -64(%rbp)
.L77:
	cmpq	$0, -64(%rbp)
	jne	.L79
	movq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-128(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	-424(%rbp), %rdx
	movq	%rax, 24(%rdx)
	nop
	leave
	ret
	.size	normalize_path, .-normalize_path
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
