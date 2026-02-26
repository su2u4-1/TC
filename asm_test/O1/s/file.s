	.file	"D:\\TC\\src\\file.c"
	.text
	.globl	get_cwd
	.def	get_cwd;	.scl	2;	.type	32;	.endef
	.seh_proc	get_cwd
get_cwd:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movl	$0, %edx
	movl	$0, %ecx
	call	getcwd
	addq	$40, %rsp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "\0"
.LC1:
	.ascii "%s/%s\0"
	.text
	.globl	absolute_path
	.def	absolute_path;	.scl	2;	.type	32;	.endef
	.seh_proc	absolute_path
absolute_path:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rbx
	call	strlen
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L3
	movl	$0, %eax
	jmp	.L10
.L21:
	movb	$47, (%rcx)
	cmpq	$1, %rax
	jbe	.L18
.L5:
	leaq	-1(%rbx,%rax), %rcx
	cmpb	$46, (%rcx)
	je	.L19
.L9:
	leaq	(%rbx,%rax), %rcx
	cmpb	$47, (%rcx)
	jne	.L8
.L12:
	leaq	-1(%rax), %rdi
	cmpb	$47, -1(%rbx,%rax)
	jne	.L8
	leaq	1(%rbx,%rax), %rdx
	movq	%rsi, %r8
	subq	%rax, %r8
	call	memmove
	subq	$1, %rsi
	movq	%rdi, %rax
	jmp	.L8
.L19:
	leaq	-2(%rax), %rdi
	cmpb	$47, -2(%rbx,%rax)
	jne	.L9
	leaq	1(%rbx,%rax), %rdx
	movq	%rsi, %r8
	subq	%rax, %r8
	call	memmove
	subq	$2, %rsi
	movq	%rdi, %rax
.L7:
	testq	%rax, %rax
	jne	.L9
.L8:
	addq	$1, %rax
	cmpq	%rsi, %rax
	jnb	.L20
.L10:
	leaq	(%rbx,%rax), %rcx
	movzbl	(%rcx), %edx
	cmpb	$92, %dl
	je	.L21
	cmpq	$1, %rax
	jbe	.L7
	cmpb	$47, %dl
	jne	.L8
	jmp	.L5
.L20:
	testq	%rsi, %rsi
	je	.L3
	movq	%rbx, %rax
	cmpb	$47, (%rbx)
	je	.L2
.L3:
	call	get_cwd
	movq	%rax, %rdi
	movq	%rbx, %rax
	testq	%rdi, %rdi
	je	.L2
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
.L2:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L18:
	testq	%rax, %rax
	je	.L8
	leaq	(%rbx,%rax), %rcx
	jmp	.L12
	.seh_endproc
	.globl	get_file_name
	.def	get_file_name;	.scl	2;	.type	32;	.endef
	.seh_proc	get_file_name
get_file_name:
	.seh_endprologue
	movq	16(%rcx), %rax
	ret
	.seh_endproc
	.globl	get_file_extension
	.def	get_file_extension;	.scl	2;	.type	32;	.endef
	.seh_proc	get_file_extension
get_file_extension:
	.seh_endprologue
	movq	8(%rcx), %rax
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC2:
	.ascii "/\0"
	.text
	.globl	get_file_dir
	.def	get_file_dir;	.scl	2;	.type	32;	.endef
	.seh_proc	get_file_dir
get_file_dir:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rbp
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L32
	movl	$0, %edi
	movl	$0, %esi
	jmp	.L27
.L34:
	movq	(%rax), %rcx
	call	strlen
	addq	%rax, %rsi
	addq	$1, %rdi
	movq	%rbx, %rax
.L27:
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L34
	testq	%rdi, %rdi
	je	.L24
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
	je	.L29
	movl	$1, %eax
	leaq	.LC2(%rip), %rbp
	movl	$0, %edi
	jmp	.L31
.L30:
	movq	(%rbx), %rdx
	movq	%rsi, %rcx
	call	strcat
	movq	8(%rbx), %rbx
	movl	%edi, %eax
	testq	%rbx, %rbx
	je	.L29
.L31:
	cmpq	$0, 8(%rbx)
	je	.L29
	testb	%al, %al
	jne	.L30
	movq	(%rbx), %rcx
	movq	%rbp, %rdx
	call	strcmp
	testl	%eax, %eax
	je	.L30
	cmpb	$0, (%rsi)
	je	.L30
	movq	%rsi, %rcx
	call	strlen
	cmpb	$47, -1(%rsi,%rax)
	je	.L30
	movw	$47, (%rsi,%rax)
	jmp	.L30
.L29:
	movq	%rsi, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	%rsi, %rcx
	call	create_string
	movq	%rax, %rbx
.L24:
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L32:
	movq	%rax, %rbx
	jmp	.L24
	.seh_endproc
	.globl	get_full_path
	.def	get_full_path;	.scl	2;	.type	32;	.endef
	.seh_proc	get_full_path
get_full_path:
	.seh_endprologue
	movq	24(%rcx), %rax
	ret
	.seh_endproc
	.globl	change_file_extension
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
	.seh_proc	change_file_extension
change_file_extension:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	movq	%rdx, 8(%rcx)
	call	get_file_dir
	movq	%rax, %rbp
	testq	%rax, %rax
	leaq	.LC0(%rip), %r12
	cmovne	%rax, %r12
	testq	%rsi, %rsi
	je	.L47
	movq	%r12, %rcx
	call	strlen
	movq	%rax, %rdi
	movq	16(%rbx), %rcx
	call	strlen
	leaq	1(%rdi,%rax), %rdi
	movq	%rsi, %rcx
	call	strlen
	leaq	(%rax,%rdi), %rdx
.L43:
	addq	$1, %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string
	movq	%rax, %rdi
	testq	%rbp, %rbp
	je	.L40
	cmpb	$0, (%r12)
	jne	.L48
.L40:
	movq	16(%rbx), %rdx
	movq	%rdi, %rcx
	call	strcpy
.L41:
	testq	%rsi, %rsi
	je	.L42
	movq	%rsi, %rdx
	movq	%rdi, %rcx
	call	strcat
.L42:
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
.L48:
	movq	16(%rbx), %r9
	movq	%r12, %r8
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	jmp	.L41
.L47:
	movq	%r12, %rcx
	call	strlen
	movq	%rax, %rdi
	movq	16(%rbx), %rcx
	call	strlen
	leaq	1(%rdi,%rax), %rdx
	jmp	.L43
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "%s%s\0"
.LC4:
	.ascii "%s/%s%s\0"
	.text
	.globl	change_file_name
	.def	change_file_name;	.scl	2;	.type	32;	.endef
	.seh_proc	change_file_name
change_file_name:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%rdx, %rdi
	movq	%rdx, 16(%rcx)
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L51
.L50:
	movq	%rax, %rsi
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L50
	movq	8(%rbx), %r12
	testq	%r12, %r12
	je	.L67
	movq	%rdi, %rcx
	call	strlen
	movq	%rax, %rbp
	movq	%r12, %rcx
	call	strlen
	leaq	(%rax,%rbp), %rdx
.L61:
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
.L51:
	movq	%rbx, %rcx
	call	get_file_dir
	movq	%rax, %rsi
	testq	%rax, %rax
	leaq	.LC0(%rip), %r12
	cmovne	%rax, %r12
	movq	8(%rbx), %r13
	testq	%r13, %r13
	je	.L68
	movq	%r12, %rcx
	call	strlen
	movq	%rax, %rbp
	movq	%rdi, %rcx
	call	strlen
	leaq	1(%rbp,%rax), %rbp
	movq	%r13, %rcx
	call	strlen
	leaq	(%rax,%rbp), %rdx
.L60:
	addq	$1, %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string
	movq	%rax, %rbp
	testq	%rsi, %rsi
	je	.L58
	cmpb	$0, (%r12)
	jne	.L69
.L58:
	movq	%r13, %r9
	movq	%rdi, %r8
	leaq	.LC3(%rip), %rdx
	movq	%rbp, %rcx
	call	sprintf
.L59:
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
.L69:
	movq	%r13, 32(%rsp)
	movq	%rdi, %r9
	movq	%r12, %r8
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	jmp	.L59
.L68:
	movq	%r12, %rcx
	call	strlen
	movq	%rax, %rbp
	movq	%rdi, %rcx
	call	strlen
	leaq	1(%rbp,%rax), %rdx
	leaq	.LC0(%rip), %r13
	jmp	.L60
.L67:
	movq	%rdi, %rcx
	call	strlen
	movq	%rax, %rdx
	leaq	.LC0(%rip), %r12
	jmp	.L61
	.seh_endproc
	.section .rdata,"dr"
.LC5:
	.ascii ".\0"
.LC6:
	.ascii "..\0"
	.text
	.globl	normalize_path
	.def	normalize_path;	.scl	2;	.type	32;	.endef
	.seh_proc	normalize_path
normalize_path:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$312, %rsp
	.seh_stackalloc	312
	.seh_endprologue
	movq	%rcx, %r12
	movq	24(%rcx), %rcx
	call	strlen
	movq	%rax, %rdi
	leaq	1(%rax), %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string
	movq	%rax, %rbp
	movq	24(%r12), %rdx
	movq	%rax, %rcx
	call	strcpy
	testq	%rdi, %rdi
	je	.L91
	movl	$0, %edx
	movl	$0, %esi
	cmpb	$47, 0(%rbp)
	jne	.L71
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %rsi
	movl	$1, %edx
	leaq	.LC2(%rip), %rcx
	call	create_string
	movq	%rax, (%rsi)
	movq	$0, 8(%rsi)
	movl	$1, %edx
	jmp	.L71
.L72:
	cmpq	%rbx, %rdx
	jb	.L101
.L74:
	leaq	1(%rbx), %rdx
.L73:
	leaq	1(%rbx), %rax
	cmpq	%rbx, %rdi
	je	.L102
	movq	%rax, %rbx
.L81:
	cmpq	%rbx, %rdi
	je	.L72
	cmpb	$47, 0(%rbp,%rbx)
	jne	.L73
	jmp	.L72
.L101:
	movq	%rbx, %r14
	subq	%rdx, %r14
	addq	%rbp, %rdx
	movq	%r14, %r8
	movq	%r15, %rcx
	call	strncpy
	movb	$0, 48(%rsp,%r14)
	leaq	.LC5(%rip), %rdx
	movq	%r15, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L74
	leaq	48(%rsp), %rcx
	leaq	.LC6(%rip), %rdx
	call	strcmp
	testl	%eax, %eax
	jne	.L76
	testq	%r13, %r13
	je	.L77
	cmpq	%r13, %rsi
	je	.L77
	movq	0(%r13), %rcx
	leaq	.LC6(%rip), %rdx
	call	strcmp
	testl	%eax, %eax
	jne	.L93
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %r14
	movl	$2, %edx
	leaq	.LC6(%rip), %rcx
	call	create_string
	movq	%rax, (%r14)
	movq	$0, 8(%r14)
	movq	%r14, 8(%r13)
	movq	%r14, %r13
	jmp	.L74
.L93:
	movq	%rsi, %rax
	jmp	.L78
.L94:
	movq	%rdx, %rax
.L78:
	testq	%rax, %rax
	je	.L74
	movq	8(%rax), %rdx
	cmpq	%r13, %rdx
	jne	.L94
	movq	$0, 8(%rax)
	movq	%rax, %r13
	jmp	.L74
.L77:
	testq	%rsi, %rsi
	jne	.L74
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %rsi
	movl	$2, %edx
	leaq	.LC6(%rip), %rcx
	call	create_string
	movq	%rax, (%rsi)
	movq	$0, 8(%rsi)
	movq	%rsi, %r13
	jmp	.L74
.L76:
	cmpb	$0, 48(%rsp)
	je	.L74
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, 40(%rsp)
	leaq	48(%rsp), %rcx
	movq	%r14, %rdx
	call	create_string
	movq	40(%rsp), %rdx
	movq	%rax, (%rdx)
	movq	$0, 8(%rdx)
	testq	%r13, %r13
	je	.L80
	movq	%rdx, 8(%r13)
.L80:
	testq	%rsi, %rsi
	je	.L95
	movq	40(%rsp), %r13
	jmp	.L74
.L95:
	movq	40(%rsp), %rsi
	movq	%rsi, %r13
	jmp	.L74
.L102:
	movq	%rsi, (%r12)
	testq	%r13, %r13
	je	.L82
	movq	0(%r13), %rdi
	movl	$46, %edx
	movq	%rdi, %rcx
	call	strrchr
	movq	%rax, %rbx
	cmpq	%rax, %rdi
	je	.L83
	testq	%rax, %rax
	je	.L83
	movq	%rax, %rdx
	subq	%rdi, %rdx
	movq	%rdi, %rcx
	call	create_string
	movq	%rax, 16(%r12)
	movq	%rbx, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	create_string
	movq	%rax, %r13
	jmp	.L84
.L83:
	movq	%rdi, 16(%r12)
	movl	$0, %r13d
.L84:
	movq	%r13, 8(%r12)
	testq	%rsi, %rsi
	je	.L85
	movq	%rsi, %rbx
	movl	$0, %edi
	movl	$0, %ebp
.L86:
	movq	(%rbx), %rcx
	call	strlen
	addq	%rax, %rbp
	movq	%rdi, %rax
	addq	$1, %rdi
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L86
	addq	%rbp, %rax
	cmpq	$1, %rdi
	cmova	%rax, %rbp
	leaq	1(%rbp), %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string
	movq	%rax, %rbx
	movb	$0, (%rax)
	movl	$1, %eax
	leaq	.LC2(%rip), %rbp
	movl	$0, %edi
	jmp	.L89
.L82:
	movq	$0, 16(%r12)
	jmp	.L84
.L88:
	movq	(%rsi), %rdx
	movq	%rbx, %rcx
	call	strcat
	movq	8(%rsi), %rsi
	movl	%edi, %eax
	testq	%rsi, %rsi
	je	.L90
.L89:
	testb	%al, %al
	jne	.L88
	movq	(%rsi), %rcx
	movq	%rbp, %rdx
	call	strcmp
	testl	%eax, %eax
	je	.L88
	cmpb	$0, (%rbx)
	je	.L88
	movq	%rbx, %rcx
	call	strlen
	cmpb	$47, -1(%rbx,%rax)
	je	.L88
	movw	$47, (%rbx,%rax)
	jmp	.L88
.L85:
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	call	create_string
	movq	%rax, %rbx
	movb	$0, (%rax)
.L90:
	movq	%rbx, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	create_string
	movq	%rax, 24(%r12)
	addq	$312, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L91:
	movq	%rdi, %rdx
	movl	$0, %esi
.L71:
	movq	%rdx, %rbx
	movq	%rsi, %r13
	leaq	48(%rsp), %r15
	jmp	.L81
	.seh_endproc
	.globl	create_file
	.def	create_file;	.scl	2;	.type	32;	.endef
	.seh_proc	create_file
create_file:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
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
	.seh_endproc
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
