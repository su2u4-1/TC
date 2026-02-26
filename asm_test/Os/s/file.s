	.file	"D:\\TC\\src\\file.c"
	.text
	.globl	get_cwd
	.def	get_cwd;	.scl	2;	.type	32;	.endef
	.seh_proc	get_cwd
get_cwd:
	.seh_endprologue
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	jmp	getcwd
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
	xorl	%edx, %edx
	movq	%rax, %rsi
.L3:
	cmpq	%rsi, %rdx
	jnb	.L30
	leaq	(%rbx,%rdx), %rcx
	movb	(%rcx), %al
	cmpb	$92, %al
	jne	.L4
	movb	$47, (%rcx)
	cmpq	$1, %rdx
	jbe	.L9
.L10:
	leaq	-1(%rbx,%rdx), %rcx
	cmpb	$46, (%rcx)
	jne	.L11
	jmp	.L31
.L4:
	cmpq	$1, %rdx
	jbe	.L9
	cmpb	$47, %al
	jne	.L11
	jmp	.L10
.L31:
	cmpb	$47, -2(%rbx,%rdx)
	leaq	-2(%rdx), %rdi
	jne	.L11
	leaq	1(%rbx,%rdx), %rax
	movq	%rsi, %r8
	subq	$2, %rsi
	subq	%rdx, %r8
	movq	%rax, %rdx
	call	memmove
	movq	%rdi, %rdx
.L9:
	testq	%rdx, %rdx
	je	.L12
.L11:
	leaq	(%rbx,%rdx), %rcx
	cmpb	$47, (%rcx)
	jne	.L12
	cmpb	$47, -1(%rbx,%rdx)
	leaq	-1(%rdx), %rdi
	jne	.L12
	leaq	1(%rbx,%rdx), %rax
	movq	%rsi, %r8
	decq	%rsi
	subq	%rdx, %r8
	movq	%rax, %rdx
	call	memmove
	movq	%rdi, %rdx
.L12:
	incq	%rdx
	jmp	.L3
.L30:
	testq	%rsi, %rsi
	je	.L14
	cmpb	$47, (%rbx)
	je	.L15
.L14:
	call	get_cwd
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L15
	movq	%rax, %rcx
	call	strlen
	leaq	.LC0(%rip), %rcx
	leaq	2(%rsi,%rax), %rbp
	movq	%rbp, %rdx
	call	create_string
	movq	%rbx, %r9
	movq	%rdi, %r8
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rsi
	call	sprintf
	movq	%rdi, %rcx
	call	free
	movq	%rbp, %rdx
	movq	%rsi, %rcx
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	create_string
.L15:
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
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
	movq	(%rcx), %rax
	movq	%rcx, %rdi
	testq	%rax, %rax
	je	.L34
	xorl	%esi, %esi
	xorl	%ebx, %ebx
.L37:
	movq	8(%rax), %rbp
	testq	%rbp, %rbp
	je	.L36
	movq	(%rax), %rcx
	incq	%rsi
	call	strlen
	addq	%rax, %rbx
	movq	%rbp, %rax
	jmp	.L37
.L36:
	testq	%rsi, %rsi
	je	.L34
	cmpq	$1, %rsi
	je	.L38
	leaq	-1(%rbx,%rsi), %rbx
.L38:
	leaq	1(%rbx), %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string
	movb	$0, (%rax)
	movq	%rax, %rbx
	movq	(%rdi), %rsi
	movb	$1, %al
	leaq	.LC2(%rip), %rdi
.L39:
	testq	%rsi, %rsi
	je	.L54
	cmpq	$0, 8(%rsi)
	je	.L40
	testb	%al, %al
	jne	.L41
	movq	(%rsi), %rcx
	movq	%rdi, %rdx
	call	strcmp
	testl	%eax, %eax
	je	.L41
	cmpb	$0, (%rbx)
	je	.L41
	movq	%rbx, %rcx
	call	strlen
	cmpb	$47, -1(%rbx,%rax)
	je	.L41
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	strcat
.L41:
	movq	(%rsi), %rdx
	movq	%rbx, %rcx
	call	strcat
	xorl	%eax, %eax
.L40:
	movq	8(%rsi), %rsi
	jmp	.L39
.L54:
	movq	%rbx, %rcx
	call	strlen
	movq	%rbx, %rcx
	movq	%rax, %rdx
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	create_string
.L34:
	xorl	%eax, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
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
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	leaq	.LC0(%rip), %r13
	movq	%r13, %r12
	movq	%r13, %r14
	movq	%rdx, 8(%rcx)
	movq	%rdx, %rbx
	movq	%rcx, %rsi
	call	get_file_dir
	testq	%rax, %rax
	movq	%rax, %rbp
	cmovne	%rax, %r12
	testq	%rbx, %rbx
	cmovne	%rbx, %r14
	movq	%r12, %rcx
	call	strlen
	movq	16(%rsi), %rcx
	movq	%rax, %rdi
	call	strlen
	leaq	1(%rdi,%rax), %rdi
	testq	%rbx, %rbx
	je	.L59
	movq	%r14, %rcx
	call	strlen
	addq	%rax, %rdi
.L59:
	leaq	1(%rdi), %rdx
	movq	%r13, %rcx
	call	create_string
	testq	%rbp, %rbp
	movq	16(%rsi), %r9
	movq	%rax, %rdi
	je	.L60
	cmpb	$0, (%r12)
	je	.L60
	movq	%r12, %r8
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	jmp	.L61
.L60:
	movq	%r9, %rdx
	movq	%rdi, %rcx
	call	strcpy
.L61:
	testq	%rbx, %rbx
	je	.L62
	movq	%rbx, %rdx
	movq	%rdi, %rcx
	call	strcat
.L62:
	movq	%rdi, %rcx
	call	strlen
	movq	%rdi, %rcx
	movq	%rax, %rdx
	call	create_string
	movq	%rax, 24(%rsi)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
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
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	(%rcx), %rax
	movq	%rdx, 16(%rcx)
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	testq	%rax, %rax
	je	.L76
.L75:
	movq	%rax, %rbp
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L75
	movq	8(%rbx), %r14
	leaq	.LC0(%rip), %r13
	movq	%rsi, %rcx
	movq	%r13, %r12
	testq	%r14, %r14
	cmovne	%r14, %r12
	call	strlen
	movq	%rax, %rdi
	testq	%r14, %r14
	je	.L78
	movq	%r12, %rcx
	call	strlen
	addq	%rax, %rdi
.L78:
	leaq	1(%rdi), %rdx
	movq	%r13, %rcx
	call	create_string
	movq	%r12, %r9
	movq	%rsi, %r8
	leaq	.LC3(%rip), %rdx
	movq	%rax, %rdi
	movq	%rax, %rcx
	call	sprintf
	movq	%rdi, %rcx
	call	strlen
	movq	%rdi, %rcx
	movq	%rax, %rdx
	call	create_string
	movq	%rax, 0(%rbp)
.L76:
	movq	%rbx, %rcx
	leaq	.LC0(%rip), %r14
	call	get_file_dir
	movq	%r14, %r13
	movq	8(%rbx), %r15
	movq	%r14, %r12
	testq	%rax, %rax
	movq	%rax, %rbp
	cmovne	%rax, %r13
	testq	%r15, %r15
	cmovne	%r15, %r12
	movq	%r13, %rcx
	call	strlen
	movq	%rsi, %rcx
	movq	%rax, %rdi
	call	strlen
	leaq	1(%rdi,%rax), %rdi
	testq	%r15, %r15
	je	.L82
	movq	%r12, %rcx
	call	strlen
	addq	%rax, %rdi
.L82:
	leaq	1(%rdi), %rdx
	movq	%r14, %rcx
	call	create_string
	movq	%rax, %rdi
	testq	%rbp, %rbp
	je	.L83
	cmpb	$0, 0(%r13)
	je	.L83
	movq	%r12, 32(%rsp)
	movq	%rsi, %r9
	movq	%r13, %r8
	movq	%rax, %rcx
	leaq	.LC4(%rip), %rdx
	call	sprintf
	jmp	.L84
.L83:
	movq	%r12, %r9
	movq	%rsi, %r8
	leaq	.LC3(%rip), %rdx
	movq	%rdi, %rcx
	call	sprintf
.L84:
	movq	%rdi, %rcx
	call	strlen
	movq	%rdi, %rcx
	movq	%rax, %rdx
	call	create_string
	movq	%rax, 24(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
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
	movq	%rcx, %rsi
	movq	24(%rcx), %rcx
	call	strlen
	leaq	.LC0(%rip), %rcx
	leaq	1(%rax), %rdx
	movq	%rax, %rbp
	call	create_string
	movq	24(%rsi), %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	strcpy
	testq	%rbp, %rbp
	je	.L119
	cmpb	$47, (%r12)
	jne	.L119
	movl	$16, %ecx
	call	alloc_memory
	movl	$1, %edx
	leaq	.LC2(%rip), %rcx
	movq	%rax, %r15
	call	create_string
	xorl	%r9d, %r9d
	movl	$1, %edx
	movq	%rax, (%r15)
	movq	%r9, 8(%r15)
	jmp	.L99
.L119:
	xorl	%edx, %edx
	xorl	%r15d, %r15d
.L99:
	leaq	48(%rsp), %rax
	movq	%rdx, %rdi
	movq	%r15, %rbx
	movq	%rax, 40(%rsp)
.L100:
	cmpq	%rdi, %rbp
	jb	.L151
	cmpq	%rbp, %rdi
	je	.L101
	cmpb	$47, (%r12,%rdi)
	jne	.L102
.L101:
	cmpq	%rdi, %rdx
	jnb	.L103
	movq	%rdi, %r14
	movq	40(%rsp), %rcx
	subq	%rdx, %r14
	addq	%r12, %rdx
	movq	%r14, %r8
	call	strncpy
	movq	40(%rsp), %rcx
	leaq	.LC5(%rip), %rdx
	movb	$0, 48(%rsp,%r14)
	call	strcmp
	testl	%eax, %eax
	je	.L103
	leaq	.LC6(%rip), %r13
	movq	40(%rsp), %rcx
	movq	%r13, %rdx
	call	strcmp
	testl	%eax, %eax
	jne	.L105
	testq	%r15, %r15
	je	.L106
	cmpq	%r15, %rbx
	je	.L106
	movq	(%r15), %rcx
	movq	%r13, %rdx
	call	strcmp
	testl	%eax, %eax
	jne	.L120
	movl	$16, %ecx
	call	alloc_memory
	movl	$2, %edx
	movq	%r13, %rcx
	movq	%rax, %r14
	call	create_string
	xorl	%r8d, %r8d
	movq	%rax, (%r14)
	movq	%r8, 8(%r14)
	movq	%r14, 8(%r15)
	movq	%r14, %r15
	jmp	.L103
.L120:
	movq	%rbx, %rax
.L107:
	testq	%rax, %rax
	je	.L103
	movq	8(%rax), %rdx
	cmpq	%r15, %rdx
	je	.L152
	movq	%rdx, %rax
	jmp	.L107
.L152:
	xorl	%ecx, %ecx
	movq	%rax, %r15
	movq	%rcx, 8(%rax)
	jmp	.L103
.L106:
	testq	%rbx, %rbx
	jne	.L103
	movl	$16, %ecx
	call	alloc_memory
	movl	$2, %edx
	movq	%r13, %rcx
	movq	%rax, %rbx
	call	create_string
	xorl	%edx, %edx
	movq	%rax, (%rbx)
	movq	%rdx, 8(%rbx)
	jmp	.L150
.L105:
	cmpb	$0, 48(%rsp)
	je	.L103
	movl	$16, %ecx
	call	alloc_memory
	movq	40(%rsp), %rcx
	movq	%r14, %rdx
	movq	%rax, %r13
	call	create_string
	movq	%rax, 0(%r13)
	xorl	%eax, %eax
	movq	%rax, 8(%r13)
	testq	%r15, %r15
	je	.L108
	movq	%r13, 8(%r15)
.L108:
	movq	%r13, %r15
	testq	%rbx, %rbx
	jne	.L103
	movq	%r13, %rbx
.L150:
	movq	%rbx, %r15
.L103:
	leaq	1(%rdi), %rdx
.L102:
	incq	%rdi
	jmp	.L100
.L151:
	movq	%rbx, (%rsi)
	testq	%r15, %r15
	je	.L110
	movq	(%r15), %r15
	movl	$46, %edx
	movq	%r15, %rcx
	call	strrchr
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L110
	cmpq	%rax, %r15
	je	.L110
	movq	%rax, %rdx
	movq	%r15, %rcx
	subq	%r15, %rdx
	call	create_string
	movq	%rdi, %rcx
	movq	%rax, 16(%rsi)
	call	strlen
	movq	%rdi, %rcx
	movq	%rax, %rdx
	call	create_string
	jmp	.L111
.L110:
	movq	%r15, 16(%rsi)
	xorl	%eax, %eax
.L111:
	movq	%rax, 8(%rsi)
	movq	%rbx, %r12
	xorl	%ebp, %ebp
	xorl	%edi, %edi
.L112:
	testq	%r12, %r12
	je	.L153
	movq	(%r12), %rcx
	incq	%rbp
	call	strlen
	movq	8(%r12), %r12
	addq	%rax, %rdi
	jmp	.L112
.L153:
	cmpq	$1, %rbp
	jbe	.L114
	leaq	-1(%rdi,%rbp), %rdi
.L114:
	leaq	1(%rdi), %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string
	leaq	.LC2(%rip), %rbp
	movb	$0, (%rax)
	movq	%rax, %rdi
	movb	$1, %al
.L115:
	testq	%rbx, %rbx
	je	.L154
	testb	%al, %al
	jne	.L116
	movq	(%rbx), %rcx
	movq	%rbp, %rdx
	call	strcmp
	testl	%eax, %eax
	je	.L116
	cmpb	$0, (%rdi)
	je	.L116
	movq	%rdi, %rcx
	call	strlen
	cmpb	$47, -1(%rdi,%rax)
	je	.L116
	movq	%rbp, %rdx
	movq	%rdi, %rcx
	call	strcat
.L116:
	movq	(%rbx), %rdx
	movq	%rdi, %rcx
	call	strcat
	movq	8(%rbx), %rbx
	xorl	%eax, %eax
	jmp	.L115
.L154:
	movq	%rdi, %rcx
	call	strlen
	movq	%rdi, %rcx
	movq	%rax, %rdx
	call	create_string
	movq	%rax, 24(%rsi)
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
	movq	%rsi, %rcx
	movq	%rax, %rbx
	call	absolute_path
	movq	%rbx, %rcx
	movq	%rax, 24(%rbx)
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
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	strcat;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef
