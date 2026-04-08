	.file	"file.c"
	.text
	.globl	get_cwd
	.def	get_cwd;	.scl	2;	.type	32;	.endef
get_cwd:
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	jmp	getcwd
	.section .rdata,"dr"
.LC0:
	.ascii "\0"
.LC1:
	.ascii "%s/%s\0"
	.text
	.globl	absolute_path
	.def	absolute_path;	.scl	2;	.type	32;	.endef
absolute_path:
	pushq	%r13
	pushq	%r12
	leaq	.LC0(%rip), %r12
	pushq	%rbp
	leaq	.LC1(%rip), %rbp
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
.L22:
	movq	%rcx, 96(%rsp)
	call	strlen
	movq	96(%rsp), %rcx
	movq	%rax, %rdx
	call	create_string_not_check
	movq	%rax, %rcx
	movq	%rax, %rbx
	call	strlen
	movq	%rax, %rsi
	xorl	%eax, %eax
.L3:
	cmpq	%rsi, %rax
	jnb	.L38
	leaq	(%rbx,%rax), %rcx
	movb	(%rcx), %dl
	cmpb	$92, %dl
	jne	.L4
	movb	$47, (%rcx)
	cmpq	$1, %rax
	jbe	.L9
.L10:
	leaq	-1(%rbx,%rax), %rcx
	cmpb	$46, (%rcx)
	jne	.L11
	jmp	.L39
.L4:
	cmpq	$1, %rax
	jbe	.L9
	cmpb	$47, %dl
	jne	.L11
	jmp	.L10
.L39:
	cmpb	$47, -2(%rbx,%rax)
	leaq	-2(%rax), %r13
	jne	.L11
	movq	%rsi, %r8
	leaq	1(%rbx,%rax), %rdx
	subq	$2, %rsi
	subq	%rax, %r8
	call	memmove
	movq	%r13, %rax
.L9:
	testq	%rax, %rax
	je	.L12
.L11:
	leaq	(%rbx,%rax), %rcx
	cmpb	$47, (%rcx)
	jne	.L12
	cmpb	$47, -1(%rbx,%rax)
	leaq	-1(%rax), %r13
	jne	.L12
	movq	%rsi, %r8
	leaq	1(%rbx,%rax), %rdx
	decq	%rsi
	subq	%rax, %r8
	call	memmove
	movq	%r13, %rax
.L12:
	incq	%rax
	jmp	.L3
.L38:
	cmpq	$2, %rsi
	jbe	.L14
	cmpb	$47, (%rbx)
	jne	.L15
	movsbl	1(%rbx), %ecx
	leal	-97(%rcx), %eax
	cmpb	$25, %al
	ja	.L2
	cmpb	$47, 2(%rbx)
	jne	.L2
	call	to_upper
	movb	$58, 1(%rbx)
	movb	%al, (%rbx)
	jmp	.L2
.L14:
	jne	.L17
.L15:
	movb	(%rbx), %al
	subl	$65, %eax
	cmpb	$25, %al
	ja	.L18
	cmpb	$58, 1(%rbx)
	jmp	.L36
.L17:
	testq	%rsi, %rsi
	je	.L19
.L18:
	cmpb	$47, (%rbx)
.L36:
	je	.L2
.L19:
	testq	%rdi, %rdi
	jne	.L21
	call	get_cwd
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L2
.L21:
	movq	%rdi, %rcx
	call	strlen
	movq	%r12, %rcx
	leaq	2(%rsi,%rax), %r13
	movq	%r13, %rdx
	call	create_string_not_check
	movq	%rdi, %r8
	movq	%rbx, %r9
	movq	%rbp, %rdx
	movq	%rax, %rsi
	movq	%rax, %rcx
	xorl	%edi, %edi
	call	sprintf
	movq	%rsi, %rcx
	movq	%r13, %rdx
	call	create_string
	movq	%rax, %rcx
	jmp	.L22
.L2:
	addq	$40, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.section .rdata,"dr"
.LC2:
	.ascii "/\0"
.LC3:
	.ascii "Warning: Path component too long, truncating to %zu characters\12\0"
.LC4:
	.ascii ".\0"
.LC5:
	.ascii "..\0"
	.text
	.globl	create_file
	.def	create_file;	.scl	2;	.type	32;	.endef
create_file:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	movl	$32, %ecx
	subq	$312, %rsp
	call	alloc_memory
	xorl	%edx, %edx
	movq	%rbx, %rcx
	movq	%rax, %rsi
	call	absolute_path
	movq	%rax, 24(%rsi)
	movq	%rax, %rcx
	call	strlen
	leaq	.LC0(%rip), %rcx
	leaq	1(%rax), %rdx
	movq	%rax, %r13
	call	create_string_not_check
	movq	24(%rsi), %rdx
	movq	%rax, %rcx
	movq	%rax, %rbp
	call	strcpy
	testq	%r13, %r13
	je	.L62
	cmpb	$47, 0(%rbp)
	jne	.L62
	movl	$16, %ecx
	movl	$1, %r14d
	call	alloc_memory
	movl	$1, %edx
	leaq	.LC2(%rip), %rcx
	movq	%rax, %r15
	call	create_string
	xorl	%r9d, %r9d
	movq	%rax, (%r15)
	movq	%r9, 8(%r15)
	jmp	.L41
.L62:
	xorl	%r14d, %r14d
	xorl	%r15d, %r15d
.L41:
	leaq	48(%rsp), %rax
	movq	%r14, %rdi
	movq	%r15, %rbx
	movq	%rax, 40(%rsp)
.L42:
	cmpq	%rdi, %r13
	jb	.L95
	je	.L43
	cmpb	$47, 0(%rbp,%rdi)
	jne	.L44
.L43:
	cmpq	%rdi, %r14
	jnb	.L45
	movq	%rdi, %r12
	subq	%r14, %r12
	cmpq	$255, %r12
	jbe	.L46
	call	__getreent
	movq	%r12, %r8
	leaq	.LC3(%rip), %rdx
	movl	$255, %r12d
	movq	24(%rax), %rcx
	call	fprintf
.L46:
	movq	40(%rsp), %rcx
	leaq	0(%rbp,%r14), %rdx
	movq	%r12, %r8
	call	strncpy
	movq	40(%rsp), %rcx
	leaq	.LC4(%rip), %rdx
	movb	$0, 48(%rsp,%r12)
	call	strcmp
	testl	%eax, %eax
	je	.L45
	leaq	.LC5(%rip), %r14
	movq	40(%rsp), %rcx
	movq	%r14, %rdx
	call	strcmp
	testl	%eax, %eax
	jne	.L48
	testq	%r15, %r15
	je	.L49
	cmpq	%rbx, %r15
	je	.L49
	movq	(%r15), %rcx
	movq	%r14, %rdx
	call	strcmp
	testl	%eax, %eax
	jne	.L63
	movl	$16, %ecx
	call	alloc_memory
	movl	$2, %edx
	movq	%r14, %rcx
	movq	%rax, %r12
	call	create_string
	xorl	%r8d, %r8d
	movq	%rax, (%r12)
	movq	%r8, 8(%r12)
	movq	%r12, 8(%r15)
	movq	%r12, %r15
	jmp	.L45
.L63:
	movq	%rbx, %rax
.L50:
	testq	%rax, %rax
	je	.L45
	movq	8(%rax), %rdx
	cmpq	%rdx, %r15
	je	.L96
	movq	%rdx, %rax
	jmp	.L50
.L96:
	xorl	%ecx, %ecx
	movq	%rax, %r15
	movq	%rcx, 8(%rax)
	jmp	.L45
.L49:
	testq	%rbx, %rbx
	jne	.L45
	movl	$16, %ecx
	call	alloc_memory
	movl	$2, %edx
	movq	%r14, %rcx
	movq	%rax, %rbx
	call	create_string
	xorl	%edx, %edx
	movq	%rax, (%rbx)
	movq	%rdx, 8(%rbx)
	jmp	.L94
.L48:
	cmpb	$0, 48(%rsp)
	je	.L45
	movl	$16, %ecx
	call	alloc_memory
	movq	40(%rsp), %rcx
	movq	%r12, %rdx
	movq	%rax, %r14
	call	create_string
	movq	%rax, (%r14)
	xorl	%eax, %eax
	movq	%rax, 8(%r14)
	testq	%r15, %r15
	je	.L51
	movq	%r14, 8(%r15)
.L51:
	movq	%r14, %r15
	testq	%rbx, %rbx
	jne	.L45
	movq	%r14, %rbx
.L94:
	movq	%rbx, %r15
.L45:
	leaq	1(%rdi), %r14
.L44:
	incq	%rdi
	jmp	.L42
.L95:
	movq	%rbx, (%rsi)
	testq	%r15, %r15
	je	.L53
	movq	(%r15), %r15
	movl	$46, %edx
	movq	%r15, %rcx
	call	strrchr
	movq	%rax, %rdi
	cmpq	%rax, %r15
	je	.L53
	testq	%rax, %rax
	je	.L53
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
	jmp	.L54
.L53:
	movq	%r15, 16(%rsi)
	xorl	%eax, %eax
.L54:
	movq	%rax, 8(%rsi)
	movq	%rbx, %r12
	xorl	%ebp, %ebp
	xorl	%edi, %edi
.L55:
	testq	%r12, %r12
	je	.L97
	movq	(%r12), %rcx
	incq	%rbp
	call	strlen
	movq	8(%r12), %r12
	addq	%rax, %rdi
	jmp	.L55
.L97:
	cmpq	$1, %rbp
	jbe	.L57
	leaq	-1(%rdi,%rbp), %rdi
.L57:
	leaq	1(%rdi), %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string_not_check
	leaq	.LC2(%rip), %rbp
	movb	$0, (%rax)
	movq	%rax, %rdi
	movb	$1, %al
.L58:
	testq	%rbx, %rbx
	je	.L98
	testb	%al, %al
	jne	.L59
	movq	(%rbx), %rcx
	movq	%rbp, %rdx
	call	strcmp
	testl	%eax, %eax
	je	.L59
	cmpb	$0, (%rdi)
	je	.L59
	movq	%rdi, %rcx
	call	strlen
	cmpb	$47, -1(%rdi,%rax)
	je	.L59
	movq	%rbp, %rdx
	movq	%rdi, %rcx
	call	strcat
.L59:
	movq	(%rbx), %rdx
	movq	%rdi, %rcx
	call	strcat
	movq	8(%rbx), %rbx
	xorl	%eax, %eax
	jmp	.L58
.L98:
	movq	%rdi, %rcx
	call	strlen
	movq	%rdi, %rcx
	movq	%rax, %rdx
	call	create_string
	movq	%rax, 24(%rsi)
	addq	$312, %rsp
	movq	%rsi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
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
	.globl	get_file_dir
	.def	get_file_dir;	.scl	2;	.type	32;	.endef
get_file_dir:
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L122
	pushq	%rbp
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	xorl	%esi, %esi
	pushq	%rbx
	xorl	%ebx, %ebx
	subq	$40, %rsp
.L104:
	movq	8(%rax), %rbp
	testq	%rbp, %rbp
	je	.L103
	movq	(%rax), %rcx
	incq	%rsi
	call	strlen
	addq	%rax, %rbx
	movq	%rbp, %rax
	jmp	.L104
.L103:
	testq	%rsi, %rsi
	je	.L101
	cmpq	$1, %rsi
	je	.L105
	leaq	-1(%rbx,%rsi), %rbx
.L105:
	leaq	1(%rbx), %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string_not_check
	movb	$0, (%rax)
	movq	%rax, %rbx
	movq	(%rdi), %rsi
	movb	$1, %al
	leaq	.LC2(%rip), %rdi
.L106:
	testq	%rsi, %rsi
	je	.L125
	cmpq	$0, 8(%rsi)
	je	.L107
	testb	%al, %al
	jne	.L108
	movq	(%rsi), %rcx
	movq	%rdi, %rdx
	call	strcmp
	testl	%eax, %eax
	je	.L108
	cmpb	$0, (%rbx)
	je	.L108
	movq	%rbx, %rcx
	call	strlen
	cmpb	$47, -1(%rbx,%rax)
	je	.L108
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	strcat
.L108:
	movq	(%rsi), %rdx
	movq	%rbx, %rcx
	call	strcat
	xorl	%eax, %eax
.L107:
	movq	8(%rsi), %rsi
	jmp	.L106
.L125:
	movq	%rbx, %rcx
	call	strlen
	addq	$40, %rsp
	movq	%rbx, %rcx
	movq	%rax, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	create_string
.L101:
	addq	$40, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L122:
	xorl	%eax, %eax
	ret
	.section .rdata,"dr"
.LC6:
	.ascii "%s/%s%s\0"
.LC7:
	.ascii "%s%s\0"
	.text
	.def	rebuild_full_path;	.scl	3;	.type	32;	.endef
rebuild_full_path:
	pushq	%r14
	pushq	%r13
	leaq	.LC0(%rip), %r13
	pushq	%r12
	movq	%r13, %r12
	pushq	%rbp
	movq	%r13, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$48, %rsp
	call	get_file_dir
	movq	8(%rbx), %r14
	testq	%rax, %rax
	movq	%rax, %rdi
	cmovne	%rax, %r12
	testq	%r14, %r14
	cmovne	%r14, %rbp
	movq	%r12, %rcx
	call	strlen
	movq	16(%rbx), %rcx
	movq	%rax, %rsi
	call	strlen
	leaq	1(%rsi,%rax), %rsi
	testq	%r14, %r14
	je	.L129
	movq	%rbp, %rcx
	call	strlen
	addq	%rax, %rsi
.L129:
	leaq	1(%rsi), %rdx
	movq	%r13, %rcx
	call	create_string_not_check
	testq	%rdi, %rdi
	movq	16(%rbx), %r8
	movq	%rax, %rsi
	je	.L130
	cmpb	$0, (%r12)
	je	.L130
	movq	%rbp, 32(%rsp)
	movq	%r8, %r9
	leaq	.LC6(%rip), %rdx
	movq	%r12, %r8
	movq	%rax, %rcx
	call	sprintf
	jmp	.L131
.L130:
	movq	%rbp, %r9
	leaq	.LC7(%rip), %rdx
	movq	%rsi, %rcx
	call	sprintf
.L131:
	movq	%rsi, %rcx
	call	strlen
	movq	%rsi, %rcx
	movq	%rax, %rdx
	call	create_string
	movq	%rax, 24(%rbx)
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.globl	get_full_path
	.def	get_full_path;	.scl	2;	.type	32;	.endef
get_full_path:
	movq	24(%rcx), %rax
	ret
	.globl	change_file_extension
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
change_file_extension:
	movq	%rdx, 8(%rcx)
	jmp	rebuild_full_path
	.globl	change_file_name
	.def	change_file_name;	.scl	2;	.type	32;	.endef
change_file_name:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	(%rcx), %rax
	movq	%rdx, 16(%rcx)
	testq	%rax, %rax
	je	.L145
.L144:
	movq	%rax, %rbp
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L144
	movq	8(%rsi), %r14
	leaq	.LC0(%rip), %r13
	movq	%rdi, %rcx
	movq	%r13, %r12
	testq	%r14, %r14
	cmovne	%r14, %r12
	call	strlen
	movq	%rax, %rbx
	testq	%r14, %r14
	je	.L147
	movq	%r12, %rcx
	call	strlen
	addq	%rax, %rbx
.L147:
	leaq	1(%rbx), %rdx
	movq	%r13, %rcx
	call	create_string_not_check
	movq	%r12, %r9
	movq	%rdi, %r8
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rbx
	movq	%rax, %rcx
	call	sprintf
	movq	%rbx, %rcx
	call	strlen
	movq	%rbx, %rcx
	movq	%rax, %rdx
	call	create_string
	movq	%rax, 0(%rbp)
.L145:
	addq	$32, %rsp
	movq	%rsi, %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	rebuild_full_path
	.ident	"GCC: (GNU) 13.2.0"
	.def	getcwd;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	to_upper;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef
	.def	strcat;	.scl	2;	.type	32;	.endef
