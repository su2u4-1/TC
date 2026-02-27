	.file	"D:\\TC\\src\\file.c"
	.text
	.globl	get_cwd
	.def	get_cwd;	.scl	2;	.type	32;	.endef
get_cwd:
	subq	$40, %rsp
	movl	$0, %edx
	movl	$0, %ecx
	call	getcwd
	addq	$40, %rsp
	ret
	.section .rdata,"dr"
.LC0:
	.ascii "\0"
.LC1:
	.ascii "%s/%s\0"
	.text
	.globl	absolute_path
	.def	absolute_path;	.scl	2;	.type	32;	.endef
absolute_path:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rbx
	call	strlen
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L4
	movl	$0, %eax
	jmp	.L11
.L23:
	movb	$47, (%rcx)
	cmpq	$1, %rax
	jbe	.L20
.L6:
	leaq	-1(%rbx,%rax), %rcx
	cmpb	$46, (%rcx)
	je	.L21
.L10:
	leaq	(%rbx,%rax), %rcx
	cmpb	$47, (%rcx)
	jne	.L9
.L13:
	leaq	-1(%rax), %rdi
	cmpb	$47, -1(%rbx,%rax)
	jne	.L9
	leaq	1(%rbx,%rax), %rdx
	movq	%rsi, %r8
	subq	%rax, %r8
	call	memmove
	subq	$1, %rsi
	movq	%rdi, %rax
	jmp	.L9
.L21:
	leaq	-2(%rax), %rdi
	cmpb	$47, -2(%rbx,%rax)
	jne	.L10
	leaq	1(%rbx,%rax), %rdx
	movq	%rsi, %r8
	subq	%rax, %r8
	call	memmove
	subq	$2, %rsi
	movq	%rdi, %rax
.L8:
	testq	%rax, %rax
	jne	.L10
.L9:
	addq	$1, %rax
	cmpq	%rsi, %rax
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
	testq	%rsi, %rsi
	je	.L4
	movq	%rbx, %rax
	cmpb	$47, (%rbx)
	je	.L3
.L4:
	call	get_cwd
	movq	%rax, %rdi
	movq	%rbx, %rax
	testq	%rdi, %rdi
	je	.L3
	movq	%rdi, %rcx
	call	strlen
	leaq	2(%rsi,%rax), %rbp
	movq	%rbp, %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string
	movq	%rax, %rsi
	movq	%rbx, %r9
	movq	%rdi, %r8
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movq	%rdi, %rcx
	call	free
	movq	%rbp, %rdx
	movq	%rsi, %rcx
	call	create_string
.L3:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L20:
	testq	%rax, %rax
	je	.L9
	leaq	(%rbx,%rax), %rcx
	jmp	.L13
	.globl	get_file_name
	.def	get_file_name;	.scl	2;	.type	32;	.endef
get_file_name:
	movq	16(%rcx), %rax
	ret
	.globl	get_file_extension
	.def	get_file_extension;	.scl	2;	.type	32;	.endef
get_file_extension:
	movq	8(%rcx), %rax
	ret
	.section .rdata,"dr"
.LC2:
	.ascii "/\0"
	.text
	.globl	get_file_dir
	.def	get_file_dir;	.scl	2;	.type	32;	.endef
get_file_dir:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L34
	movq	%rcx, %rbp
	movl	$0, %edi
	movl	$0, %esi
	jmp	.L29
.L37:
	movq	(%rax), %rcx
	call	strlen
	addq	%rax, %rsi
	addq	$1, %rdi
	movq	%rbx, %rax
.L29:
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L37
	testq	%rdi, %rdi
	je	.L26
	leaq	-1(%rsi,%rdi), %rax
	cmpq	$1, %rdi
	cmova	%rax, %rsi
	leaq	1(%rsi), %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string
	movq	%rax, %rsi
	movb	$0, (%rax)
	movq	0(%rbp), %rbx
	testq	%rbx, %rbx
	je	.L31
	movl	$1, %eax
	leaq	.LC2(%rip), %rbp
	movl	$0, %edi
	jmp	.L33
.L32:
	movq	(%rbx), %rdx
	movq	%rsi, %rcx
	call	strcat
	movq	8(%rbx), %rbx
	movl	%edi, %eax
	testq	%rbx, %rbx
	je	.L31
.L33:
	cmpq	$0, 8(%rbx)
	je	.L31
	testb	%al, %al
	jne	.L32
	movq	(%rbx), %rcx
	movq	%rbp, %rdx
	call	strcmp
	testl	%eax, %eax
	je	.L32
	cmpb	$0, (%rsi)
	je	.L32
	movq	%rsi, %rcx
	call	strlen
	cmpb	$47, -1(%rsi,%rax)
	je	.L32
	movw	$47, (%rsi,%rax)
	jmp	.L32
.L31:
	movq	%rsi, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	%rsi, %rcx
	call	create_string
	movq	%rax, %rbx
.L26:
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L34:
	movq	%rax, %rbx
	jmp	.L26
	.globl	get_full_path
	.def	get_full_path;	.scl	2;	.type	32;	.endef
get_full_path:
	movq	24(%rcx), %rax
	ret
	.globl	change_file_extension
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
change_file_extension:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	movq	%rdx, 8(%rcx)
	call	get_file_dir
	movq	%rax, %rbp
	testq	%rax, %rax
	leaq	.LC0(%rip), %r12
	cmovne	%rax, %r12
	testq	%rsi, %rsi
	je	.L51
	movq	%r12, %rcx
	call	strlen
	movq	%rax, %rdi
	movq	16(%rbx), %rcx
	call	strlen
	leaq	1(%rdi,%rax), %rdi
	movq	%rsi, %rcx
	call	strlen
	leaq	(%rax,%rdi), %rdx
.L46:
	addq	$1, %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string
	movq	%rax, %rdi
	testq	%rbp, %rbp
	je	.L43
	cmpb	$0, (%r12)
	jne	.L52
.L43:
	movq	16(%rbx), %rdx
	movq	%rdi, %rcx
	call	strcpy
.L44:
	testq	%rsi, %rsi
	je	.L45
	movq	%rsi, %rdx
	movq	%rdi, %rcx
	call	strcat
.L45:
	movq	%rdi, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	%rdi, %rcx
	call	create_string
	movq	%rax, 24(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L52:
	movq	16(%rbx), %r9
	movq	%r12, %r8
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	jmp	.L44
.L51:
	movq	%r12, %rcx
	call	strlen
	movq	%rax, %rdi
	movq	16(%rbx), %rcx
	call	strlen
	leaq	1(%rdi,%rax), %rdx
	jmp	.L46
	.section .rdata,"dr"
.LC3:
	.ascii "%s%s\0"
.LC4:
	.ascii "%s/%s%s\0"
	.text
	.globl	change_file_name
	.def	change_file_name;	.scl	2;	.type	32;	.endef
change_file_name:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rdi
	movq	%rdx, 16(%rcx)
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L55
.L54:
	movq	%rax, %rsi
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L54
	movq	8(%rbx), %r12
	testq	%r12, %r12
	je	.L72
	movq	%rdi, %rcx
	call	strlen
	movq	%rax, %rbp
	movq	%r12, %rcx
	call	strlen
	leaq	(%rax,%rbp), %rdx
.L65:
	addq	$1, %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string
	movq	%rax, %rbp
	movq	%r12, %r9
	movq	%rdi, %r8
	leaq	.LC3(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movq	%rbp, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	%rbp, %rcx
	call	create_string
	movq	%rax, (%rsi)
.L55:
	movq	%rbx, %rcx
	call	get_file_dir
	movq	%rax, %rsi
	testq	%rax, %rax
	leaq	.LC0(%rip), %r12
	cmovne	%rax, %r12
	movq	8(%rbx), %r13
	testq	%r13, %r13
	je	.L73
	movq	%r12, %rcx
	call	strlen
	movq	%rax, %rbp
	movq	%rdi, %rcx
	call	strlen
	leaq	1(%rbp,%rax), %rbp
	movq	%r13, %rcx
	call	strlen
	leaq	(%rax,%rbp), %rdx
.L64:
	addq	$1, %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string
	movq	%rax, %rbp
	testq	%rsi, %rsi
	je	.L62
	cmpb	$0, (%r12)
	jne	.L74
.L62:
	movq	%r13, %r9
	movq	%rdi, %r8
	leaq	.LC3(%rip), %rdx
	movq	%rbp, %rcx
	call	sprintf
.L63:
	movq	%rbp, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	%rbp, %rcx
	call	create_string
	movq	%rax, 24(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L74:
	movq	%r13, 32(%rsp)
	movq	%rdi, %r9
	movq	%r12, %r8
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	jmp	.L63
.L73:
	movq	%r12, %rcx
	call	strlen
	movq	%rax, %rbp
	movq	%rdi, %rcx
	call	strlen
	leaq	1(%rbp,%rax), %rdx
	leaq	.LC0(%rip), %r13
	jmp	.L64
.L72:
	movq	%rdi, %rcx
	call	strlen
	movq	%rax, %rdx
	leaq	.LC0(%rip), %r12
	jmp	.L65
	.section .rdata,"dr"
.LC5:
	.ascii ".\0"
.LC6:
	.ascii "..\0"
	.text
	.globl	normalize_path
	.def	normalize_path;	.scl	2;	.type	32;	.endef
normalize_path:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$304, %rsp
	movq	%rcx, %r13
	movq	24(%rcx), %rcx
	call	strlen
	movq	%rax, %rdi
	leaq	1(%rax), %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string
	movq	%rax, %r12
	movq	24(%r13), %rdx
	movq	%rax, %rcx
	call	strcpy
	testq	%rdi, %rdi
	je	.L96
	movl	$0, %edx
	movl	$0, %esi
	cmpb	$47, (%r12)
	jne	.L76
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %rsi
	movl	$1, %edx
	leaq	.LC2(%rip), %rcx
	call	create_string
	movq	%rax, (%rsi)
	movq	$0, 8(%rsi)
	movl	$1, %edx
	jmp	.L76
.L77:
	cmpq	%rbx, %rdx
	jb	.L107
.L79:
	leaq	1(%rbx), %rdx
.L78:
	leaq	1(%rbx), %rax
	cmpq	%rbx, %rdi
	je	.L108
	movq	%rax, %rbx
.L86:
	cmpq	%rbx, %rdi
	je	.L77
	cmpb	$47, (%r12,%rbx)
	jne	.L78
	jmp	.L77
.L107:
	movq	%rbx, %r15
	subq	%rdx, %r15
	addq	%r12, %rdx
	movq	%r15, %r8
	movq	40(%rsp), %rcx
	call	strncpy
	movb	$0, 48(%rsp,%r15)
	leaq	.LC5(%rip), %rdx
	movq	40(%rsp), %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L79
	leaq	48(%rsp), %rcx
	leaq	.LC6(%rip), %rdx
	call	strcmp
	testl	%eax, %eax
	jne	.L81
	testq	%r14, %r14
	je	.L82
	cmpq	%r14, %rsi
	je	.L82
	movq	(%r14), %rcx
	leaq	.LC6(%rip), %rdx
	call	strcmp
	testl	%eax, %eax
	jne	.L98
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %r15
	movl	$2, %edx
	leaq	.LC6(%rip), %rcx
	call	create_string
	movq	%rax, (%r15)
	movq	$0, 8(%r15)
	movq	%r15, 8(%r14)
	movq	%r15, %r14
	jmp	.L79
.L98:
	movq	%rsi, %rax
	jmp	.L83
.L99:
	movq	%rdx, %rax
.L83:
	testq	%rax, %rax
	je	.L79
	movq	8(%rax), %rdx
	cmpq	%r14, %rdx
	jne	.L99
	movq	$0, 8(%rax)
	movq	%rax, %r14
	jmp	.L79
.L82:
	testq	%rsi, %rsi
	jne	.L79
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %rsi
	movl	$2, %edx
	leaq	.LC6(%rip), %rcx
	call	create_string
	movq	%rax, (%rsi)
	movq	$0, 8(%rsi)
	movq	%rsi, %r14
	jmp	.L79
.L81:
	cmpb	$0, 48(%rsp)
	je	.L79
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, 32(%rsp)
	leaq	48(%rsp), %rcx
	movq	%r15, %rdx
	call	create_string
	movq	32(%rsp), %rdx
	movq	%rax, (%rdx)
	movq	$0, 8(%rdx)
	testq	%r14, %r14
	je	.L85
	movq	%rdx, 8(%r14)
.L85:
	testq	%rsi, %rsi
	je	.L100
	movq	32(%rsp), %r14
	jmp	.L79
.L100:
	movq	32(%rsp), %rsi
	movq	%rsi, %r14
	jmp	.L79
.L108:
	movq	%rsi, 0(%r13)
	testq	%r14, %r14
	je	.L87
	movq	(%r14), %rdi
	movl	$46, %edx
	movq	%rdi, %rcx
	call	strrchr
	movq	%rax, %rbx
	cmpq	%rax, %rdi
	je	.L88
	testq	%rax, %rax
	je	.L88
	movq	%rax, %rdx
	subq	%rdi, %rdx
	movq	%rdi, %rcx
	call	create_string
	movq	%rax, 16(%r13)
	movq	%rbx, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	create_string
	movq	%rax, %r14
	jmp	.L89
.L88:
	movq	%rdi, 16(%r13)
	movl	$0, %r14d
.L89:
	movq	%r14, 8(%r13)
	testq	%rsi, %rsi
	je	.L90
	movq	%rsi, %rbx
	movl	$0, %edi
	movl	$0, %r12d
.L91:
	movq	(%rbx), %rcx
	call	strlen
	addq	%rax, %r12
	movq	%rdi, %rax
	addq	$1, %rdi
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L91
	addq	%r12, %rax
	cmpq	$1, %rdi
	cmova	%rax, %r12
	leaq	1(%r12), %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string
	movq	%rax, %rbx
	movb	$0, (%rax)
	movl	$1, %eax
	leaq	.LC2(%rip), %r12
	movl	$0, %edi
	jmp	.L94
.L87:
	movq	$0, 16(%r13)
	jmp	.L89
.L93:
	movq	(%rsi), %rdx
	movq	%rbx, %rcx
	call	strcat
	movq	8(%rsi), %rsi
	movl	%edi, %eax
	testq	%rsi, %rsi
	je	.L95
.L94:
	testb	%al, %al
	jne	.L93
	movq	(%rsi), %rcx
	movq	%r12, %rdx
	call	strcmp
	testl	%eax, %eax
	je	.L93
	cmpb	$0, (%rbx)
	je	.L93
	movq	%rbx, %rcx
	call	strlen
	cmpb	$47, -1(%rbx,%rax)
	je	.L93
	movw	$47, (%rbx,%rax)
	jmp	.L93
.L90:
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	call	create_string
	movq	%rax, %rbx
	movb	$0, (%rax)
.L95:
	movq	%rbx, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	create_string
	movq	%rax, 24(%r13)
	leaq	-56(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.L96:
	movq	%rdi, %rdx
	movl	$0, %esi
.L76:
	movq	%rdx, %rbx
	movq	%rsi, %r14
	leaq	48(%rsp), %rax
	movq	%rax, 40(%rsp)
	jmp	.L86
	.globl	create_file
	.def	create_file;	.scl	2;	.type	32;	.endef
create_file:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rsi
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, %rbx
	movq	%rsi, %rcx
	call	absolute_path
	movq	%rax, 24(%rbx)
	movq	%rbx, %rcx
	call	normalize_path
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.ident	"GCC: (GNU) 13.2.0"
	.def	getcwd;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	strcat;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef
