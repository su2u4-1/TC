	.file	"file.c"
	.text
	.globl	get_cwd
	.type	get_cwd, @function
get_cwd:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, %esi
	movl	$0, %edi
	call	getcwd@PLT
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	get_cwd, .-get_cwd
	.globl	create_file
	.type	create_file, @function
create_file:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$32, %edi
	call	alloc_memory@PLT
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
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
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
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -40(%rbp)
	movq	$0, -32(%rbp)
	jmp	.L6
.L10:
	movq	-56(%rbp), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$92, %al
	jne	.L7
	movq	-56(%rbp), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movb	$47, (%rax)
.L7:
	cmpq	$1, -32(%rbp)
	jbe	.L8
	movq	-56(%rbp), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L8
	movq	-32(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$46, %al
	jne	.L8
	movq	-32(%rbp), %rax
	leaq	-2(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L8
	movq	-40(%rbp), %rax
	subq	-32(%rbp), %rax
	movq	-32(%rbp), %rdx
	leaq	1(%rdx), %rcx
	movq	-56(%rbp), %rdx
	leaq	(%rcx,%rdx), %rsi
	movq	-32(%rbp), %rdx
	leaq	-1(%rdx), %rcx
	movq	-56(%rbp), %rdx
	addq	%rdx, %rcx
	movq	%rax, %rdx
	movq	%rcx, %rdi
	call	memmove@PLT
	subq	$2, -40(%rbp)
	subq	$2, -32(%rbp)
.L8:
	cmpq	$0, -32(%rbp)
	je	.L9
	movq	-56(%rbp), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L9
	movq	-32(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L9
	movq	-40(%rbp), %rax
	subq	-32(%rbp), %rax
	movq	-32(%rbp), %rdx
	leaq	1(%rdx), %rcx
	movq	-56(%rbp), %rdx
	leaq	(%rcx,%rdx), %rsi
	movq	-56(%rbp), %rcx
	movq	-32(%rbp), %rdx
	addq	%rdx, %rcx
	movq	%rax, %rdx
	movq	%rcx, %rdi
	call	memmove@PLT
	subq	$1, -40(%rbp)
	subq	$1, -32(%rbp)
.L9:
	addq	$1, -32(%rbp)
.L6:
	movq	-32(%rbp), %rax
	cmpq	-40(%rbp), %rax
	jb	.L10
	cmpq	$0, -40(%rbp)
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
	call	strlen@PLT
	movq	-40(%rbp), %rdx
	addq	%rdx, %rax
	addq	$2, %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	create_string@PLT
	movq	%rax, -8(%rbp)
	movq	-56(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	create_string@PLT
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	absolute_path, .-absolute_path
	.globl	get_file_name
	.type	get_file_name, @function
get_file_name:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	get_file_name, .-get_file_name
	.globl	get_file_extension
	.type	get_file_extension, @function
get_file_extension:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	get_file_extension, .-get_file_extension
	.section	.rodata
.LC2:
	.string	"/"
	.text
	.globl	get_file_dir
	.type	get_file_dir, @function
get_file_dir:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L19
	movl	$0, %eax
	jmp	.L20
.L19:
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
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
	call	strlen@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	%rax, -40(%rbp)
	addq	$1, -32(%rbp)
.L22:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
.L21:
	cmpq	$0, -24(%rbp)
	jne	.L23
	cmpq	$0, -32(%rbp)
	jne	.L24
	movl	$0, %eax
	jmp	.L20
.L24:
	cmpq	$1, -32(%rbp)
	jbe	.L25
	movq	-32(%rbp), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	subq	$1, %rax
	movq	%rax, -40(%rbp)
.L25:
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	create_string@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movb	$0, (%rax)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movb	$1, -41(%rbp)
	jmp	.L26
.L29:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L27
	cmpb	$0, -41(%rbp)
	jne	.L28
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L28
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L28
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	leaq	-1(%rax), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	je	.L28
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movw	$47, (%rax)
.L28:
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	movb	$0, -41(%rbp)
.L27:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
.L26:
	cmpq	$0, -24(%rbp)
	jne	.L29
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	create_string@PLT
.L20:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	get_file_dir, .-get_file_dir
	.globl	get_full_path
	.type	get_full_path, @function
get_full_path:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	get_full_path, .-get_full_path
	.section	.rodata
.LC3:
	.string	"%s"
	.text
	.globl	change_file_extension
	.type	change_file_extension, @function
change_file_extension:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	-72(%rbp), %rax
	movq	-80(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	get_file_dir
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	je	.L33
	movq	-48(%rbp), %rax
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
	movq	%rax, -32(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rbx
	movq	-72(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	addq	%rbx, %rax
	addq	$1, %rax
	movq	%rax, -56(%rbp)
	cmpq	$0, -80(%rbp)
	je	.L37
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	addq	%rax, -56(%rbp)
.L37:
	movq	-56(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	create_string@PLT
	movq	%rax, -24(%rbp)
	cmpq	$0, -48(%rbp)
	je	.L38
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L38
	movq	-72(%rbp), %rax
	movq	16(%rax), %rcx
	movq	-40(%rbp), %rdx
	movq	-24(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	jmp	.L39
.L38:
	movq	-72(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-24(%rbp), %rax
	leaq	.LC3(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
.L39:
	cmpq	$0, -80(%rbp)
	je	.L40
	movq	-80(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
.L40:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	create_string@PLT
	movq	-72(%rbp), %rdx
	movq	%rax, 24(%rdx)
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
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
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$104, %rsp
	.cfi_offset 3, -24
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
	movq	%rax, -88(%rbp)
	jmp	.L43
.L48:
	movq	-88(%rbp), %rax
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
	movq	%rax, -64(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -80(%rbp)
	movq	-104(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L47
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	addq	%rax, -80(%rbp)
.L47:
	movq	-80(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	create_string@PLT
	movq	%rax, -56(%rbp)
	movq	-64(%rbp), %rcx
	movq	-112(%rbp), %rdx
	movq	-56(%rbp), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	create_string@PLT
	movq	-88(%rbp), %rdx
	movq	%rax, (%rdx)
	jmp	.L42
.L44:
	movq	-88(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -88(%rbp)
.L43:
	cmpq	$0, -88(%rbp)
	jne	.L48
.L42:
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	get_file_dir
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	je	.L49
	movq	-48(%rbp), %rax
	jmp	.L50
.L49:
	leaq	.LC0(%rip), %rax
.L50:
	movq	%rax, -40(%rbp)
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
	movq	%rax, -32(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rbx
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	addq	%rbx, %rax
	addq	$1, %rax
	movq	%rax, -72(%rbp)
	movq	-104(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L53
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	addq	%rax, -72(%rbp)
.L53:
	movq	-72(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	create_string@PLT
	movq	%rax, -24(%rbp)
	cmpq	$0, -48(%rbp)
	je	.L54
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L54
	movq	-32(%rbp), %rsi
	movq	-112(%rbp), %rcx
	movq	-40(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rsi, %r8
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	jmp	.L55
.L54:
	movq	-32(%rbp), %rcx
	movq	-112(%rbp), %rdx
	movq	-24(%rbp), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
.L55:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	create_string@PLT
	movq	-104(%rbp), %rdx
	movq	%rax, 24(%rdx)
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
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
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$448, %rsp
	movq	%rdi, -440(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-440(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -352(%rbp)
	movq	-352(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	create_string@PLT
	movq	%rax, -344(%rbp)
	movq	-440(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-344(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	$0, -416(%rbp)
	movq	$0, -408(%rbp)
	movq	$0, -400(%rbp)
	cmpq	$0, -352(%rbp)
	je	.L57
	movq	-344(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L57
	movl	$16, %edi
	call	alloc_memory@PLT
	movq	%rax, -336(%rbp)
	movl	$1, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	create_string@PLT
	movq	-336(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	-336(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-336(%rbp), %rax
	movq	%rax, -416(%rbp)
	movq	-336(%rbp), %rax
	movq	%rax, -408(%rbp)
	movq	$1, -400(%rbp)
.L57:
	movq	-400(%rbp), %rax
	movq	%rax, -392(%rbp)
	jmp	.L58
.L72:
	movq	-392(%rbp), %rax
	cmpq	-352(%rbp), %rax
	je	.L59
	movq	-344(%rbp), %rdx
	movq	-392(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L60
.L59:
	movq	-392(%rbp), %rax
	cmpq	%rax, -400(%rbp)
	jnb	.L61
	movq	-392(%rbp), %rax
	subq	-400(%rbp), %rax
	movq	%rax, -304(%rbp)
	movq	-344(%rbp), %rdx
	movq	-400(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movq	-304(%rbp), %rdx
	leaq	-272(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	leaq	-272(%rbp), %rdx
	movq	-304(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	leaq	-272(%rbp), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L61
	leaq	-272(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L63
	cmpq	$0, -408(%rbp)
	je	.L64
	movq	-408(%rbp), %rax
	cmpq	-416(%rbp), %rax
	je	.L64
	movq	-408(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L65
	movl	$16, %edi
	call	alloc_memory@PLT
	movq	%rax, -288(%rbp)
	movl	$2, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	create_string@PLT
	movq	-288(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	-288(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-408(%rbp), %rax
	movq	-288(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-288(%rbp), %rax
	movq	%rax, -408(%rbp)
	jmp	.L84
.L65:
	movq	-416(%rbp), %rax
	movq	%rax, -384(%rbp)
	jmp	.L67
.L69:
	movq	-384(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -384(%rbp)
.L67:
	cmpq	$0, -384(%rbp)
	je	.L68
	movq	-384(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, -408(%rbp)
	jne	.L69
.L68:
	cmpq	$0, -384(%rbp)
	je	.L84
	movq	-384(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-384(%rbp), %rax
	movq	%rax, -408(%rbp)
	jmp	.L84
.L64:
	cmpq	$0, -416(%rbp)
	jne	.L61
	movl	$16, %edi
	call	alloc_memory@PLT
	movq	%rax, -280(%rbp)
	movl	$2, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	create_string@PLT
	movq	-280(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	-280(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-280(%rbp), %rax
	movq	%rax, -416(%rbp)
	movq	-280(%rbp), %rax
	movq	%rax, -408(%rbp)
	jmp	.L61
.L63:
	leaq	-272(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L61
	movl	$16, %edi
	call	alloc_memory@PLT
	movq	%rax, -296(%rbp)
	movq	-304(%rbp), %rdx
	leaq	-272(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	create_string@PLT
	movq	-296(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	-296(%rbp), %rax
	movq	$0, 8(%rax)
	cmpq	$0, -408(%rbp)
	je	.L71
	movq	-408(%rbp), %rax
	movq	-296(%rbp), %rdx
	movq	%rdx, 8(%rax)
.L71:
	movq	-296(%rbp), %rax
	movq	%rax, -408(%rbp)
	cmpq	$0, -416(%rbp)
	jne	.L61
	movq	-296(%rbp), %rax
	movq	%rax, -416(%rbp)
	jmp	.L61
.L84:
	nop
.L61:
	movq	-392(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -400(%rbp)
.L60:
	addq	$1, -392(%rbp)
.L58:
	movq	-392(%rbp), %rax
	cmpq	%rax, -352(%rbp)
	jnb	.L72
	movq	-440(%rbp), %rax
	movq	-416(%rbp), %rdx
	movq	%rdx, (%rax)
	cmpq	$0, -408(%rbp)
	je	.L73
	movq	-408(%rbp), %rax
	movq	(%rax), %rax
	movl	$46, %esi
	movq	%rax, %rdi
	call	strrchr@PLT
	movq	%rax, -328(%rbp)
	cmpq	$0, -328(%rbp)
	je	.L74
	movq	-408(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, -328(%rbp)
	je	.L74
	movq	-408(%rbp), %rax
	movq	(%rax), %rax
	movq	-328(%rbp), %rdx
	subq	%rax, %rdx
	movq	%rdx, -320(%rbp)
	movq	-408(%rbp), %rax
	movq	(%rax), %rax
	movq	-320(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	create_string@PLT
	movq	-440(%rbp), %rdx
	movq	%rax, 16(%rdx)
	movq	-328(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-328(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	create_string@PLT
	movq	-440(%rbp), %rdx
	movq	%rax, 8(%rdx)
	jmp	.L76
.L74:
	movq	-408(%rbp), %rax
	movq	(%rax), %rdx
	movq	-440(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-440(%rbp), %rax
	movq	$0, 8(%rax)
	jmp	.L76
.L73:
	movq	-440(%rbp), %rax
	movq	$0, 16(%rax)
	movq	-440(%rbp), %rax
	movq	$0, 8(%rax)
.L76:
	movq	$0, -376(%rbp)
	movq	-416(%rbp), %rax
	movq	%rax, -368(%rbp)
	movq	$0, -360(%rbp)
	jmp	.L77
.L78:
	movq	-368(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	addq	%rax, -376(%rbp)
	addq	$1, -360(%rbp)
	movq	-368(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -368(%rbp)
.L77:
	cmpq	$0, -368(%rbp)
	jne	.L78
	cmpq	$1, -360(%rbp)
	jbe	.L79
	movq	-360(%rbp), %rdx
	movq	-376(%rbp), %rax
	addq	%rdx, %rax
	subq	$1, %rax
	movq	%rax, -376(%rbp)
.L79:
	movq	-376(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	create_string@PLT
	movq	%rax, -312(%rbp)
	movq	-312(%rbp), %rax
	movb	$0, (%rax)
	movq	-416(%rbp), %rax
	movq	%rax, -368(%rbp)
	movb	$1, -417(%rbp)
	jmp	.L80
.L82:
	cmpb	$0, -417(%rbp)
	jne	.L81
	movq	-368(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L81
	movq	-312(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L81
	movq	-312(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	leaq	-1(%rax), %rdx
	movq	-312(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	je	.L81
	movq	-312(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-312(%rbp), %rax
	addq	%rdx, %rax
	movw	$47, (%rax)
.L81:
	movq	-368(%rbp), %rax
	movq	(%rax), %rdx
	movq	-312(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	movb	$0, -417(%rbp)
	movq	-368(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -368(%rbp)
.L80:
	cmpq	$0, -368(%rbp)
	jne	.L82
	movq	-312(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-312(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	create_string@PLT
	movq	-440(%rbp), %rdx
	movq	%rax, 24(%rdx)
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L83
	call	__stack_chk_fail@PLT
.L83:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	normalize_path, .-normalize_path
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
