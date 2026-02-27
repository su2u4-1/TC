	.file	"D:\\TC\\src\\file.c"
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
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$40, %rsp
	call	strlen
	xorl	%edx, %edx
	movq	%rax, %rsi
.L3:
	cmpq	%rsi, %rdx
	jnb	.L31
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
	jmp	.L32
.L4:
	cmpq	$1, %rdx
	jbe	.L9
	cmpb	$47, %al
	jne	.L11
	jmp	.L10
.L32:
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
.L31:
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
	addq	$40, %rsp
	movq	%rbp, %rdx
	movq	%rsi, %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	create_string
.L15:
	addq	$40, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
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
	.section .rdata,"dr"
.LC2:
	.ascii "/\0"
	.text
	.globl	get_file_dir
	.def	get_file_dir;	.scl	2;	.type	32;	.endef
get_file_dir:
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L56
	pushq	%rbp
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	xorl	%esi, %esi
	pushq	%rbx
	xorl	%ebx, %ebx
	subq	$40, %rsp
.L38:
	movq	8(%rax), %rbp
	testq	%rbp, %rbp
	je	.L37
	movq	(%rax), %rcx
	incq	%rsi
	call	strlen
	addq	%rax, %rbx
	movq	%rbp, %rax
	jmp	.L38
.L37:
	testq	%rsi, %rsi
	je	.L35
	cmpq	$1, %rsi
	je	.L39
	leaq	-1(%rbx,%rsi), %rbx
.L39:
	leaq	1(%rbx), %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string
	movb	$0, (%rax)
	movq	%rax, %rbx
	movq	(%rdi), %rsi
	movb	$1, %al
	leaq	.LC2(%rip), %rdi
.L40:
	testq	%rsi, %rsi
	je	.L59
	cmpq	$0, 8(%rsi)
	je	.L41
	testb	%al, %al
	jne	.L42
	movq	(%rsi), %rcx
	movq	%rdi, %rdx
	call	strcmp
	testl	%eax, %eax
	je	.L42
	cmpb	$0, (%rbx)
	je	.L42
	movq	%rbx, %rcx
	call	strlen
	cmpb	$47, -1(%rbx,%rax)
	je	.L42
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	strcat
.L42:
	movq	(%rsi), %rdx
	movq	%rbx, %rcx
	call	strcat
	xorl	%eax, %eax
.L41:
	movq	8(%rsi), %rsi
	jmp	.L40
.L59:
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
.L35:
	addq	$40, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L56:
	xorl	%eax, %eax
	ret
	.globl	get_full_path
	.def	get_full_path;	.scl	2;	.type	32;	.endef
get_full_path:
	movq	24(%rcx), %rax
	ret
	.globl	change_file_extension
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
change_file_extension:
	pushq	%r14
	pushq	%r13
	leaq	.LC0(%rip), %r13
	pushq	%r12
	movq	%r13, %r12
	movq	%r13, %r14
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$32, %rsp
	movq	%rdx, 8(%rcx)
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
	je	.L64
	movq	%r14, %rcx
	call	strlen
	addq	%rax, %rdi
.L64:
	leaq	1(%rdi), %rdx
	movq	%r13, %rcx
	call	create_string
	testq	%rbp, %rbp
	movq	16(%rsi), %r9
	movq	%rax, %rdi
	je	.L65
	cmpb	$0, (%r12)
	je	.L65
	movq	%r12, %r8
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	jmp	.L66
.L65:
	movq	%r9, %rdx
	movq	%rdi, %rcx
	call	strcpy
.L66:
	testq	%rbx, %rbx
	je	.L67
	movq	%rbx, %rdx
	movq	%rdi, %rcx
	call	strcat
.L67:
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
	.section .rdata,"dr"
.LC3:
	.ascii "%s%s\0"
.LC4:
	.ascii "%s/%s%s\0"
	.text
	.globl	change_file_name
	.def	change_file_name;	.scl	2;	.type	32;	.endef
change_file_name:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$56, %rsp
	movq	(%rcx), %rax
	movq	%rdx, 16(%rcx)
	testq	%rax, %rax
	je	.L82
.L81:
	movq	%rax, %rbp
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L81
	movq	8(%rbx), %r14
	leaq	.LC0(%rip), %r13
	movq	%rsi, %rcx
	movq	%r13, %r12
	testq	%r14, %r14
	cmovne	%r14, %r12
	call	strlen
	movq	%rax, %rdi
	testq	%r14, %r14
	je	.L84
	movq	%r12, %rcx
	call	strlen
	addq	%rax, %rdi
.L84:
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
.L82:
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
	je	.L88
	movq	%r12, %rcx
	call	strlen
	addq	%rax, %rdi
.L88:
	leaq	1(%rdi), %rdx
	movq	%r14, %rcx
	call	create_string
	movq	%rax, %rdi
	testq	%rbp, %rbp
	je	.L89
	cmpb	$0, 0(%r13)
	je	.L89
	movq	%r12, 32(%rsp)
	movq	%rsi, %r9
	movq	%r13, %r8
	movq	%rax, %rcx
	leaq	.LC4(%rip), %rdx
	call	sprintf
	jmp	.L90
.L89:
	movq	%r12, %r9
	movq	%rsi, %r8
	leaq	.LC3(%rip), %rdx
	movq	%rdi, %rcx
	call	sprintf
.L90:
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
	.section .rdata,"dr"
.LC5:
	.ascii ".\0"
.LC6:
	.ascii "..\0"
	.text
	.globl	normalize_path
	.def	normalize_path;	.scl	2;	.type	32;	.endef
normalize_path:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	subq	$312, %rsp
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
	je	.L126
	cmpb	$47, (%r12)
	jne	.L126
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
	jmp	.L106
.L126:
	xorl	%edx, %edx
	xorl	%r15d, %r15d
.L106:
	leaq	48(%rsp), %rax
	movq	%rdx, %rdi
	movq	%r15, %rbx
	movq	%rax, 40(%rsp)
.L107:
	cmpq	%rdi, %rbp
	jb	.L159
	cmpq	%rbp, %rdi
	je	.L108
	cmpb	$47, (%r12,%rdi)
	jne	.L109
.L108:
	cmpq	%rdi, %rdx
	jnb	.L110
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
	je	.L110
	leaq	.LC6(%rip), %r13
	movq	40(%rsp), %rcx
	movq	%r13, %rdx
	call	strcmp
	testl	%eax, %eax
	jne	.L112
	testq	%r15, %r15
	je	.L113
	cmpq	%r15, %rbx
	je	.L113
	movq	(%r15), %rcx
	movq	%r13, %rdx
	call	strcmp
	testl	%eax, %eax
	jne	.L127
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
	jmp	.L110
.L127:
	movq	%rbx, %rax
.L114:
	testq	%rax, %rax
	je	.L110
	movq	8(%rax), %rdx
	cmpq	%r15, %rdx
	je	.L160
	movq	%rdx, %rax
	jmp	.L114
.L160:
	xorl	%ecx, %ecx
	movq	%rax, %r15
	movq	%rcx, 8(%rax)
	jmp	.L110
.L113:
	testq	%rbx, %rbx
	jne	.L110
	movl	$16, %ecx
	call	alloc_memory
	movl	$2, %edx
	movq	%r13, %rcx
	movq	%rax, %rbx
	call	create_string
	xorl	%edx, %edx
	movq	%rax, (%rbx)
	movq	%rdx, 8(%rbx)
	jmp	.L158
.L112:
	cmpb	$0, 48(%rsp)
	je	.L110
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
	je	.L115
	movq	%r13, 8(%r15)
.L115:
	movq	%r13, %r15
	testq	%rbx, %rbx
	jne	.L110
	movq	%r13, %rbx
.L158:
	movq	%rbx, %r15
.L110:
	leaq	1(%rdi), %rdx
.L109:
	incq	%rdi
	jmp	.L107
.L159:
	movq	%rbx, (%rsi)
	testq	%r15, %r15
	je	.L117
	movq	(%r15), %r15
	movl	$46, %edx
	movq	%r15, %rcx
	call	strrchr
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L117
	cmpq	%rax, %r15
	je	.L117
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
	jmp	.L118
.L117:
	movq	%r15, 16(%rsi)
	xorl	%eax, %eax
.L118:
	movq	%rax, 8(%rsi)
	movq	%rbx, %r12
	xorl	%ebp, %ebp
	xorl	%edi, %edi
.L119:
	testq	%r12, %r12
	je	.L161
	movq	(%r12), %rcx
	incq	%rbp
	call	strlen
	movq	8(%r12), %r12
	addq	%rax, %rdi
	jmp	.L119
.L161:
	cmpq	$1, %rbp
	jbe	.L121
	leaq	-1(%rdi,%rbp), %rdi
.L121:
	leaq	1(%rdi), %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string
	leaq	.LC2(%rip), %rbp
	movb	$0, (%rax)
	movq	%rax, %rdi
	movb	$1, %al
.L122:
	testq	%rbx, %rbx
	je	.L162
	testb	%al, %al
	jne	.L123
	movq	(%rbx), %rcx
	movq	%rbp, %rdx
	call	strcmp
	testl	%eax, %eax
	je	.L123
	cmpb	$0, (%rdi)
	je	.L123
	movq	%rdi, %rcx
	call	strlen
	cmpb	$47, -1(%rdi,%rax)
	je	.L123
	movq	%rbp, %rdx
	movq	%rdi, %rcx
	call	strcat
.L123:
	movq	(%rbx), %rdx
	movq	%rdi, %rcx
	call	strcat
	movq	8(%rbx), %rbx
	xorl	%eax, %eax
	jmp	.L122
.L162:
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
	.globl	create_file
	.def	create_file;	.scl	2;	.type	32;	.endef
create_file:
	pushq	%rsi
	movq	%rcx, %rsi
	movl	$32, %ecx
	pushq	%rbx
	subq	$40, %rsp
	call	alloc_memory
	movq	%rsi, %rcx
	movq	%rax, %rbx
	call	absolute_path
	movq	%rbx, %rcx
	movq	%rax, 24(%rbx)
	call	normalize_path
	addq	$40, %rsp
	movq	%rbx, %rax
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
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	strcat;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef
