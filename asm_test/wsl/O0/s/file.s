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
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L6
.L10:
	movq	-56(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$92, %al
	jne	.L7
	movq	-56(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movb	$47, (%rax)
.L7:
	cmpq	$1, -16(%rbp)
	jbe	.L8
	movq	-56(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L8
	movq	-16(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$46, %al
	jne	.L8
	movq	-16(%rbp), %rax
	leaq	-2(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L8
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	movq	-16(%rbp), %rdx
	leaq	1(%rdx), %rcx
	movq	-56(%rbp), %rdx
	leaq	(%rcx,%rdx), %rsi
	movq	-16(%rbp), %rdx
	leaq	-1(%rdx), %rcx
	movq	-56(%rbp), %rdx
	addq	%rdx, %rcx
	movq	%rax, %rdx
	movq	%rcx, %rdi
	call	*memmove@GOTPCREL(%rip)
	subq	$2, -8(%rbp)
	subq	$2, -16(%rbp)
.L8:
	cmpq	$0, -16(%rbp)
	je	.L9
	movq	-56(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L9
	movq	-16(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L9
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	movq	-16(%rbp), %rdx
	leaq	1(%rdx), %rcx
	movq	-56(%rbp), %rdx
	leaq	(%rcx,%rdx), %rsi
	movq	-56(%rbp), %rcx
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
	cmpq	$0, -8(%rbp)
	je	.L11
	movq	-56(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L11
	movq	-56(%rbp), %rax
	jmp	.L12
.L11:
	call	get_cwd
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L13
	movq	-56(%rbp), %rax
	jmp	.L12
.L13:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	-8(%rbp), %rdx
	addq	%rdx, %rax
	addq	$2, %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	movq	-56(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*sprintf@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	*free@GOTPCREL(%rip)
	movq	-32(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
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
	jne	.L19
	movl	$0, %eax
	jmp	.L20
.L19:
	movq	$0, -8(%rbp)
	movq	$0, -16(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	jmp	.L21
.L23:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L22
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	addq	%rax, -8(%rbp)
	addq	$1, -16(%rbp)
.L22:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
.L21:
	cmpq	$0, -24(%rbp)
	jne	.L23
	cmpq	$0, -16(%rbp)
	jne	.L24
	movl	$0, %eax
	jmp	.L20
.L24:
	cmpq	$1, -16(%rbp)
	jbe	.L25
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	subq	$1, %rax
	movq	%rax, -8(%rbp)
.L25:
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movb	$0, (%rax)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movb	$1, -25(%rbp)
	jmp	.L26
.L29:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L27
	cmpb	$0, -25(%rbp)
	jne	.L28
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L28
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L28
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	leaq	-1(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	je	.L28
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movw	$47, (%rax)
.L28:
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*strcat@GOTPCREL(%rip)
	movb	$0, -25(%rbp)
.L27:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
.L26:
	cmpq	$0, -24(%rbp)
	jne	.L29
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
.L20:
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
	.string	"%s"
	.text
	.globl	change_file_extension
	.type	change_file_extension, @function
change_file_extension:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$72, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	-72(%rbp), %rax
	movq	-80(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	get_file_dir
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L33
	movq	-32(%rbp), %rax
	jmp	.L34
.L33:
	leaq	.LC0(%rip), %rax
.L34:
	movq	%rax, -40(%rbp)
	cmpq	$0, -80(%rbp)
	je	.L35
	movq	-80(%rbp), %rax
	jmp	.L36
.L35:
	leaq	.LC0(%rip), %rax
.L36:
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
	cmpq	$0, -80(%rbp)
	je	.L37
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	addq	%rax, -24(%rbp)
.L37:
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, -56(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L38
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L38
	movq	-72(%rbp), %rax
	movq	16(%rax), %rcx
	movq	-40(%rbp), %rdx
	movq	-56(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*sprintf@GOTPCREL(%rip)
	jmp	.L39
.L38:
	movq	-72(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-56(%rbp), %rax
	leaq	.LC3(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*sprintf@GOTPCREL(%rip)
.L39:
	cmpq	$0, -80(%rbp)
	je	.L40
	movq	-80(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*strcat@GOTPCREL(%rip)
.L40:
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
	.size	change_file_extension, .-change_file_extension
	.section	.rodata
.LC4:
	.string	"%s%s"
.LC5:
	.string	"%s/%s%s"
	.text
	.globl	change_file_name
	.type	change_file_name, @function
change_file_name:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$104, %rsp
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	-104(%rbp), %rax
	movq	-112(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L42
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	jmp	.L43
.L48:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L44
	movq	-104(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L45
	movq	-104(%rbp), %rax
	movq	8(%rax), %rax
	jmp	.L46
.L45:
	leaq	.LC0(%rip), %rax
.L46:
	movq	%rax, -48(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, -32(%rbp)
	movq	-104(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L47
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	addq	%rax, -32(%rbp)
.L47:
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, -56(%rbp)
	movq	-48(%rbp), %rcx
	movq	-112(%rbp), %rdx
	movq	-56(%rbp), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*sprintf@GOTPCREL(%rip)
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	-24(%rbp), %rdx
	movq	%rax, (%rdx)
	jmp	.L42
.L44:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
.L43:
	cmpq	$0, -24(%rbp)
	jne	.L48
.L42:
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	get_file_dir
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	je	.L49
	movq	-64(%rbp), %rax
	jmp	.L50
.L49:
	leaq	.LC0(%rip), %rax
.L50:
	movq	%rax, -72(%rbp)
	movq	-104(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L51
	movq	-104(%rbp), %rax
	movq	8(%rax), %rax
	jmp	.L52
.L51:
	leaq	.LC0(%rip), %rax
.L52:
	movq	%rax, -80(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	addq	%rbx, %rax
	addq	$1, %rax
	movq	%rax, -40(%rbp)
	movq	-104(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L53
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	addq	%rax, -40(%rbp)
.L53:
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, -88(%rbp)
	cmpq	$0, -64(%rbp)
	je	.L54
	movq	-72(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L54
	movq	-80(%rbp), %rsi
	movq	-112(%rbp), %rcx
	movq	-72(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rsi, %r8
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*sprintf@GOTPCREL(%rip)
	jmp	.L55
.L54:
	movq	-80(%rbp), %rcx
	movq	-112(%rbp), %rdx
	movq	-88(%rbp), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*sprintf@GOTPCREL(%rip)
.L55:
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	-104(%rbp), %rdx
	movq	%rax, 24(%rdx)
	nop
	movq	-8(%rbp), %rbx
	leave
	ret
	.size	change_file_name, .-change_file_name
	.section	.rodata
.LC6:
	.string	"."
.LC7:
	.string	".."
	.text
	.globl	normalize_path
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
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, -88(%rbp)
	movq	-424(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-88(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*strcpy@GOTPCREL(%rip)
	movq	$0, -8(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	cmpq	$0, -80(%rbp)
	je	.L57
	movq	-88(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L57
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -96(%rbp)
	movl	$1, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	-96(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	-96(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-96(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-96(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	$1, -24(%rbp)
.L57:
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	jmp	.L58
.L72:
	movq	-32(%rbp), %rax
	cmpq	-80(%rbp), %rax
	je	.L59
	movq	-88(%rbp), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L60
.L59:
	movq	-32(%rbp), %rax
	cmpq	%rax, -24(%rbp)
	jnb	.L61
	movq	-32(%rbp), %rax
	subq	-24(%rbp), %rax
	movq	%rax, -128(%rbp)
	movq	-88(%rbp), %rdx
	movq	-24(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movq	-128(%rbp), %rdx
	leaq	-416(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	*strncpy@GOTPCREL(%rip)
	leaq	-416(%rbp), %rdx
	movq	-128(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	leaq	-416(%rbp), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L61
	leaq	-416(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L63
	cmpq	$0, -16(%rbp)
	je	.L64
	movq	-16(%rbp), %rax
	cmpq	-8(%rbp), %rax
	je	.L64
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L65
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
	jmp	.L83
.L65:
	movq	-8(%rbp), %rax
	movq	%rax, -40(%rbp)
	jmp	.L67
.L69:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -40(%rbp)
.L67:
	cmpq	$0, -40(%rbp)
	je	.L68
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, -16(%rbp)
	jne	.L69
.L68:
	cmpq	$0, -40(%rbp)
	je	.L83
	movq	-40(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L83
.L64:
	cmpq	$0, -8(%rbp)
	jne	.L61
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
	jmp	.L61
.L63:
	leaq	-416(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L61
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -136(%rbp)
	movq	-128(%rbp), %rdx
	leaq	-416(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	-136(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	-136(%rbp), %rax
	movq	$0, 8(%rax)
	cmpq	$0, -16(%rbp)
	je	.L71
	movq	-16(%rbp), %rax
	movq	-136(%rbp), %rdx
	movq	%rdx, 8(%rax)
.L71:
	movq	-136(%rbp), %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L61
	movq	-136(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L61
.L83:
	nop
.L61:
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -24(%rbp)
.L60:
	addq	$1, -32(%rbp)
.L58:
	movq	-32(%rbp), %rax
	cmpq	%rax, -80(%rbp)
	jnb	.L72
	movq	-424(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	cmpq	$0, -16(%rbp)
	je	.L73
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movl	$46, %esi
	movq	%rax, %rdi
	call	*strrchr@GOTPCREL(%rip)
	movq	%rax, -104(%rbp)
	cmpq	$0, -104(%rbp)
	je	.L74
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, -104(%rbp)
	je	.L74
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	-104(%rbp), %rdx
	subq	%rax, %rdx
	movq	%rdx, -112(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	-112(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	-424(%rbp), %rdx
	movq	%rax, 16(%rdx)
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-104(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	-424(%rbp), %rdx
	movq	%rax, 8(%rdx)
	jmp	.L76
.L74:
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-424(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-424(%rbp), %rax
	movq	$0, 8(%rax)
	jmp	.L76
.L73:
	movq	-424(%rbp), %rax
	movq	$0, 16(%rax)
	movq	-424(%rbp), %rax
	movq	$0, 8(%rax)
.L76:
	movq	$0, -48(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	$0, -64(%rbp)
	jmp	.L77
.L78:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	addq	%rax, -48(%rbp)
	addq	$1, -64(%rbp)
	movq	-56(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -56(%rbp)
.L77:
	cmpq	$0, -56(%rbp)
	jne	.L78
	cmpq	$1, -64(%rbp)
	jbe	.L79
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	subq	$1, %rax
	movq	%rax, -48(%rbp)
.L79:
	movq	-48(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, -120(%rbp)
	movq	-120(%rbp), %rax
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	%rax, -56(%rbp)
	movb	$1, -65(%rbp)
	jmp	.L80
.L82:
	cmpb	$0, -65(%rbp)
	jne	.L81
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L81
	movq	-120(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L81
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	leaq	-1(%rax), %rdx
	movq	-120(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	je	.L81
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-120(%rbp), %rax
	addq	%rdx, %rax
	movw	$47, (%rax)
.L81:
	movq	-56(%rbp), %rax
	movq	(%rax), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*strcat@GOTPCREL(%rip)
	movb	$0, -65(%rbp)
	movq	-56(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -56(%rbp)
.L80:
	cmpq	$0, -56(%rbp)
	jne	.L82
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-120(%rbp), %rax
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
