	.file	"D:\\TC\\src\\file.c"
	.text
	.p2align 4
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
	.p2align 4
	.globl	absolute_path
	.def	absolute_path;	.scl	2;	.type	32;	.endef
absolute_path:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	subq	$40, %rsp
	call	strlen
	testq	%rax, %rax
	je	.L4
	movq	%rax, %rdi
	xorl	%ebx, %ebx
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L5:
	cmpq	$1, %rbx
	jbe	.L10
	leaq	1(%rbx), %rdx
	cmpb	$47, %cl
	je	.L11
.L20:
	movq	%rdx, %rbx
.L12:
	cmpq	%rdi, %rbx
	jnb	.L36
.L14:
	leaq	(%rsi,%rbx), %r10
	movzbl	(%r10), %ecx
	cmpb	$92, %cl
	jne	.L5
	movb	$47, (%r10)
	cmpq	$1, %rbx
	jbe	.L10
	leaq	1(%rbx), %rdx
.L11:
	leaq	-1(%rsi,%rbx), %rcx
	movzbl	(%rcx), %eax
	cmpb	$46, %al
	je	.L37
.L8:
	cmpb	$47, %al
	jne	.L20
	movq	%rdi, %r8
	addq	%rsi, %rdx
	movq	%r10, %rcx
	subq	$1, %rdi
	subq	%rbx, %r8
	call	memmove
	cmpq	%rdi, %rbx
	jb	.L14
	.p2align 4,,10
	.p2align 3
.L36:
	testq	%rdi, %rdi
	je	.L4
	cmpb	$47, (%rsi)
	je	.L25
.L15:
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	getcwd
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L25
	movq	%rax, %rcx
	call	strlen
	leaq	.LC0(%rip), %rcx
	leaq	2(%rdi,%rax), %rbp
	movq	%rbp, %rdx
	call	create_string
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rdi
	call	sprintf
	movq	%rbx, %rcx
	call	free
	addq	$40, %rsp
	movq	%rbp, %rdx
	movq	%rdi, %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	create_string
	.p2align 4,,10
	.p2align 3
.L37:
	cmpb	$47, -2(%rsi,%rbx)
	leaq	-2(%rbx), %rbp
	jne	.L20
	movq	%rdi, %r8
	addq	%rsi, %rdx
	subq	$2, %rdi
	subq	%rbx, %r8
	movq	%rbp, %rbx
	call	memmove
	.p2align 4,,10
	.p2align 3
.L10:
	testq	%rbx, %rbx
	jne	.L38
	movl	$1, %ebx
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L25:
	addq	$40, %rsp
	movq	%rsi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	xorl	%edi, %edi
	jmp	.L15
.L38:
	leaq	(%rsi,%rbx), %r10
	leaq	1(%rbx), %rdx
	cmpb	$47, (%r10)
	jne	.L20
	movzbl	-1(%rsi,%rbx), %eax
	jmp	.L8
	.p2align 4
	.globl	get_file_name
	.def	get_file_name;	.scl	2;	.type	32;	.endef
get_file_name:
	movq	16(%rcx), %rax
	ret
	.p2align 4
	.globl	get_file_extension
	.def	get_file_extension;	.scl	2;	.type	32;	.endef
get_file_extension:
	movq	8(%rcx), %rax
	ret
	.p2align 4
	.globl	get_file_dir
	.def	get_file_dir;	.scl	2;	.type	32;	.endef
get_file_dir:
	movq	(%rcx), %rdx
	testq	%rdx, %rdx
	je	.L68
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rdi
	xorl	%edi, %edi
	pushq	%rsi
	xorl	%esi, %esi
	pushq	%rbx
	subq	$40, %rsp
	movq	8(%rdx), %rbx
	testq	%rbx, %rbx
	je	.L41
	.p2align 4,,10
	.p2align 3
.L43:
	movq	(%rdx), %rcx
	addq	$1, %rdi
	call	strlen
	movq	%rbx, %rdx
	addq	%rax, %rsi
	movq	8(%rbx), %rax
	testq	%rax, %rax
	je	.L72
	movq	%rax, %rbx
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L72:
	testq	%rdi, %rdi
	je	.L41
	leaq	1(%rsi), %rax
	leaq	(%rsi,%rdi), %rdx
	cmpq	$1, %rdi
	cmove	%rax, %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string
	movb	$0, (%rax)
	movq	0(%rbp), %rbx
	movq	%rax, %rsi
	testq	%rbx, %rbx
	je	.L49
	cmpq	$0, 8(%rbx)
	je	.L49
.L71:
	movq	(%rbx), %rdi
.L51:
	movq	%rsi, %rcx
	call	strlen
	movq	%rdi, %rdx
	leaq	(%rsi,%rax), %rcx
	call	stpcpy
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L49
	cmpq	$0, 8(%rbx)
	je	.L49
	movq	(%rbx), %rdi
	cmpb	$47, (%rdi)
	je	.L73
.L54:
	cmpb	$0, (%rsi)
	je	.L51
	cmpb	$47, -1(%rax)
	je	.L51
	movl	$47, %edx
	movw	%dx, (%rax)
	jmp	.L71
	.p2align 4,,10
	.p2align 3
.L49:
	movq	%rsi, %rcx
	call	strlen
	addq	$40, %rsp
	movq	%rsi, %rcx
	popq	%rbx
	movq	%rax, %rdx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	create_string
	.p2align 4,,10
	.p2align 3
.L73:
	cmpb	$0, 1(%rdi)
	je	.L51
	jmp	.L54
.L41:
	addq	$40, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L68:
	xorl	%eax, %eax
	ret
	.p2align 4
	.globl	get_full_path
	.def	get_full_path;	.scl	2;	.type	32;	.endef
get_full_path:
	movq	24(%rcx), %rax
	ret
	.p2align 4
	.globl	change_file_extension
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
change_file_extension:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$40, %rsp
	movq	%rdx, 8(%rcx)
	call	get_file_dir
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L76
	movq	%rax, %rcx
	movq	%rbp, %r13
	leaq	.LC0(%rip), %r12
	call	strlen
	movq	16(%rbx), %rcx
	movq	%rax, %rdi
	call	strlen
	addq	%rdi, %rax
	leaq	1(%rax), %rdi
	testq	%rsi, %rsi
	je	.L94
.L86:
	movq	%rsi, %rcx
	call	strlen
	movq	%r12, %rcx
	leaq	1(%rdi,%rax), %rdx
	call	create_string
	movq	%rax, %rdi
	testq	%rbp, %rbp
	je	.L95
	cmpb	$0, 0(%r13)
	jne	.L96
.L79:
	movq	16(%rbx), %rdx
	movq	%rdi, %rcx
	call	strcpy
.L80:
	testq	%rsi, %rsi
	je	.L82
.L81:
	movq	%rsi, %rdx
	movq	%rdi, %rcx
	call	strcat
.L82:
	movq	%rdi, %rcx
	call	strlen
	movq	%rdi, %rcx
	movq	%rax, %rdx
	call	create_string
	movq	%rax, 24(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L94:
	leaq	2(%rax), %rdx
	movq	%r12, %rcx
	call	create_string
	cmpb	$0, 0(%r13)
	movq	%rax, %rdi
	je	.L79
.L96:
	movq	16(%rbx), %r9
	movq	%r13, %r8
	leaq	.LC1(%rip), %rdx
	movq	%rdi, %rcx
	call	sprintf
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L76:
	movq	16(%rbx), %rcx
	call	strlen
	testq	%rsi, %rsi
	je	.L85
	leaq	.LC0(%rip), %r12
	leaq	1(%rax), %rdi
	movq	%r12, %r13
	jmp	.L86
	.p2align 4,,10
	.p2align 3
.L85:
	leaq	2(%rax), %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string
	movq	16(%rbx), %rdx
	movq	%rax, %rcx
	movq	%rax, %rdi
	call	strcpy
	jmp	.L82
	.p2align 4,,10
	.p2align 3
.L95:
	movq	16(%rbx), %rdx
	movq	%rdi, %rcx
	call	strcpy
	jmp	.L81
	.section .rdata,"dr"
.LC2:
	.ascii "%s%s\0"
.LC3:
	.ascii "%s/%s%s\0"
	.text
	.p2align 4
	.globl	change_file_name
	.def	change_file_name;	.scl	2;	.type	32;	.endef
change_file_name:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	leaq	.LC0(%rip), %r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$48, %rsp
	movq	(%rcx), %rax
	movq	%rdx, 16(%rcx)
	testq	%rax, %rax
	je	.L99
	.p2align 4,,10
	.p2align 3
.L98:
	movq	%rax, %rdi
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L98
	movq	%rsi, %rcx
	movq	8(%rbx), %r13
	call	strlen
	movq	%rax, %rbp
	testq	%r13, %r13
	je	.L110
	movq	%r13, %rcx
	leaq	.LC0(%rip), %r12
	call	strlen
	addq	%rax, %rbp
.L100:
	leaq	1(%rbp), %rdx
	movq	%r12, %rcx
	call	create_string
	movq	%r13, %r9
	movq	%rsi, %r8
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rbp
	movq	%rax, %rcx
	call	sprintf
	movq	%rbp, %rcx
	call	strlen
	movq	%rbp, %rcx
	movq	%rax, %rdx
	call	create_string
	movq	%rax, (%rdi)
.L99:
	movq	%rbx, %rcx
	call	get_file_dir
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L102
	movq	%rax, %rcx
	movq	%rdi, %r14
	call	strlen
	movq	%rsi, %rcx
	movq	8(%rbx), %r13
	movq	%rax, %rbp
	call	strlen
	leaq	0(%rbp,%rax), %rdx
	leaq	1(%rdx), %rbp
	testq	%r13, %r13
	je	.L115
.L109:
	movq	%r13, %rcx
	call	strlen
	movq	%r12, %rcx
	leaq	1(%rbp,%rax), %rdx
	call	create_string
	movq	%rax, %rbp
	testq	%rdi, %rdi
	je	.L105
	cmpb	$0, (%r14)
	jne	.L116
.L105:
	movq	%r13, %r9
	movq	%rsi, %r8
	leaq	.LC2(%rip), %rdx
	movq	%rbp, %rcx
	call	sprintf
.L106:
	movq	%rbp, %rcx
	call	strlen
	movq	%rbp, %rcx
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
	.p2align 4,,10
	.p2align 3
.L115:
	addq	$2, %rdx
	movq	%r12, %rcx
	leaq	.LC0(%rip), %r13
	call	create_string
	cmpb	$0, (%r14)
	movq	%rax, %rbp
	je	.L105
.L116:
	movq	%r13, 32(%rsp)
	movq	%rsi, %r9
	movq	%r14, %r8
	movq	%rbp, %rcx
	leaq	.LC3(%rip), %rdx
	call	sprintf
	jmp	.L106
	.p2align 4,,10
	.p2align 3
.L110:
	leaq	.LC0(%rip), %r12
	movq	%r12, %r13
	jmp	.L100
	.p2align 4,,10
	.p2align 3
.L102:
	movq	%rsi, %rcx
	movq	8(%rbx), %r13
	leaq	.LC0(%rip), %r14
	call	strlen
	leaq	1(%rax), %rbp
	testq	%r13, %r13
	jne	.L109
	leaq	2(%rax), %rdx
	movq	%r12, %rcx
	leaq	.LC0(%rip), %r13
	call	create_string
	movq	%rax, %rbp
	jmp	.L105
	.section .rdata,"dr"
.LC4:
	.ascii "/\0"
.LC5:
	.ascii ".\0"
.LC6:
	.ascii "..\0"
	.text
	.p2align 4
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
	movq	%rcx, %rdi
	pushq	%rsi
	xorl	%esi, %esi
	pushq	%rbx
	xorl	%ebx, %ebx
	andq	$-16, %rsp
	subq	$304, %rsp
	movq	24(%rcx), %rcx
	call	strlen
	leaq	.LC0(%rip), %rcx
	leaq	1(%rax), %rdx
	movq	%rax, %r14
	call	create_string
	movq	24(%rdi), %rdx
	movq	%rax, %rcx
	movq	%rax, %r15
	call	strcpy
	testq	%r14, %r14
	je	.L118
	cmpb	$47, (%r15)
	je	.L184
.L118:
	movq	%rsi, %rax
	movq	%rbx, %r13
	leaq	48(%rsp), %r10
	jmp	.L134
	.p2align 4,,10
	.p2align 3
.L122:
	cmpq	%rsi, %r14
	jb	.L121
.L134:
	movq	%rsi, %rdx
	addq	$1, %rsi
	cmpq	%rdx, %r14
	je	.L185
	cmpb	$47, (%r15,%rdx)
	jne	.L122
	cmpq	%rdx, %rax
	jb	.L120
.L123:
	movq	%rsi, %rax
	jmp	.L122
	.p2align 4,,10
	.p2align 3
.L185:
	cmpq	%r14, %rax
	jb	.L120
.L121:
	movq	%rbx, (%rdi)
	testq	%r13, %r13
	je	.L135
	movq	0(%r13), %r13
	movl	$46, %edx
	movq	%r13, %rcx
	call	strrchr
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L135
	cmpq	%rax, %r13
	je	.L135
	movq	%rax, %rdx
	movq	%r13, %rcx
	subq	%r13, %rdx
	call	create_string
	movq	%rsi, %rcx
	movq	%rax, 16(%rdi)
	call	strlen
	movq	%rsi, %rcx
	movq	%rax, %rdx
	call	create_string
	movq	%rax, 8(%rdi)
	testq	%rbx, %rbx
	je	.L137
.L188:
	movq	%rbx, %rsi
	xorl	%r14d, %r14d
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L138:
	movq	(%rsi), %rcx
	addq	$1, %r14
	call	strlen
	movq	8(%rsi), %rsi
	addq	%rax, %r12
	testq	%rsi, %rsi
	jne	.L138
	leaq	1(%r12), %rax
	leaq	(%r12,%r14), %rdx
	cmpq	$1, %r14
	cmovbe	%rax, %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string
	movb	$0, (%rax)
	movq	(%rbx), %rsi
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L144:
	movq	%r12, %rcx
	call	strlen
	movq	%rsi, %rdx
	leaq	(%r12,%rax), %rcx
	call	stpcpy
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L140
	movq	(%rbx), %rsi
	cmpb	$47, (%rsi)
	je	.L186
.L147:
	cmpb	$0, (%r12)
	je	.L144
	cmpb	$47, -1(%rax)
	je	.L144
	movl	$47, %edx
	movw	%dx, (%rax)
	movq	(%rbx), %rsi
	jmp	.L144
	.p2align 4,,10
	.p2align 3
.L120:
	subq	%rax, %rdx
	movq	%r10, %rcx
	movq	%rdx, %r12
	leaq	(%r15,%rax), %rdx
	movq	%r12, %r8
	call	strncpy
	movb	$0, 48(%rsp,%r12)
	cmpw	$46, (%rax)
	movq	%rax, %r10
	je	.L123
	cmpw	$11822, (%rax)
	je	.L187
.L127:
	cmpb	$0, 48(%rsp)
	je	.L123
	movl	$16, %ecx
	movq	%r10, 40(%rsp)
	call	alloc_memory
	movq	40(%rsp), %rcx
	movq	%r12, %rdx
	movq	%rax, 32(%rsp)
	call	create_string
	movq	32(%rsp), %r8
	testq	%r13, %r13
	movq	40(%rsp), %r10
	movq	%rax, (%r8)
	movq	$0, 8(%r8)
	je	.L133
	movq	%r8, 8(%r13)
.L133:
	movq	%r8, %r13
	testq	%rbx, %rbx
	jne	.L123
	movq	%r8, %rbx
	movq	%r8, %r13
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L135:
	xorl	%eax, %eax
	movq	%r13, 16(%rdi)
	movq	%rax, 8(%rdi)
	testq	%rbx, %rbx
	jne	.L188
.L137:
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	call	create_string
	movb	$0, (%rax)
	movq	%rax, %r12
.L140:
	movq	%r12, %rcx
	call	strlen
	movq	%r12, %rcx
	movq	%rax, %rdx
	call	create_string
	movq	%rax, 24(%rdi)
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
	.p2align 4,,10
	.p2align 3
.L186:
	cmpb	$0, 1(%rsi)
	je	.L144
	jmp	.L147
	.p2align 4,,10
	.p2align 3
.L187:
	cmpb	$0, 2(%rax)
	jne	.L127
	testq	%r13, %r13
	je	.L130
	cmpq	%r13, %rbx
	je	.L130
	movq	0(%r13), %rax
	cmpb	$46, (%rax)
	je	.L189
.L150:
	movq	%rbx, %rax
	jmp	.L132
	.p2align 4,,10
	.p2align 3
.L151:
	movq	%rdx, %rax
.L132:
	testq	%rax, %rax
	je	.L123
	movq	8(%rax), %rdx
	cmpq	%r13, %rdx
	jne	.L151
	movq	$0, 8(%rax)
	movq	%rax, %r13
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L184:
	movl	$16, %ecx
	movl	$1, %esi
	call	alloc_memory
	movl	$1, %edx
	leaq	.LC4(%rip), %rcx
	movq	%rax, %rbx
	call	create_string
	movq	$0, 8(%rbx)
	movq	%rax, (%rbx)
	jmp	.L118
	.p2align 4,,10
	.p2align 3
.L130:
	testq	%rbx, %rbx
	jne	.L123
	movl	$16, %ecx
	movq	%r10, 40(%rsp)
	call	alloc_memory
	movl	$2, %edx
	leaq	.LC6(%rip), %rcx
	movq	%rax, %rbx
	call	create_string
	movq	%rbx, %r13
	movq	40(%rsp), %r10
	movq	$0, 8(%rbx)
	movq	%rax, (%rbx)
	jmp	.L123
.L189:
	cmpb	$46, 1(%rax)
	jne	.L150
	cmpb	$0, 2(%rax)
	jne	.L150
	movl	$16, %ecx
	movq	%r10, 40(%rsp)
	call	alloc_memory
	movl	$2, %edx
	leaq	.LC6(%rip), %rcx
	movq	%rax, %r12
	call	create_string
	movq	40(%rsp), %r10
	movq	$0, 8(%r12)
	movq	%rax, (%r12)
	movq	%r12, 8(%r13)
	movq	%r12, %r13
	jmp	.L123
	.p2align 4
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
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	stpcpy;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	strcat;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
