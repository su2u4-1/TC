	.file	"D:\\TC\\src\\file.c"
	.text
	.p2align 4
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
	.p2align 4
	.globl	absolute_path
	.def	absolute_path;	.scl	2;	.type	32;	.endef
	.seh_proc	absolute_path
absolute_path:
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
	movq	%rcx, %rdi
	call	strlen
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L4
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
	cmpq	%rbp, %rbx
	jnb	.L35
.L14:
	leaq	(%rdi,%rbx), %rsi
	movzbl	(%rsi), %ecx
	cmpb	$92, %cl
	jne	.L5
	movb	$47, (%rsi)
	cmpq	$1, %rbx
	jbe	.L10
	leaq	1(%rbx), %rdx
.L11:
	leaq	-1(%rdi,%rbx), %rcx
	movzbl	(%rcx), %eax
	cmpb	$46, %al
	je	.L36
.L8:
	cmpb	$47, %al
	jne	.L20
	movq	%rbp, %r8
	addq	%rdi, %rdx
	movq	%rsi, %rcx
	subq	$1, %rbp
	subq	%rbx, %r8
	call	memmove
	cmpq	%rbp, %rbx
	jb	.L14
	.p2align 4,,10
	.p2align 3
.L35:
	testq	%rbp, %rbp
	je	.L4
	cmpb	$47, (%rdi)
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
	leaq	2(%rbp,%rax), %rbp
	movq	%rbp, %rdx
	call	create_string
	movq	%rdi, %r9
	movq	%rbx, %r8
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rsi
	call	sprintf
	movq	%rbx, %rcx
	call	free
	movq	%rbp, %rdx
	movq	%rsi, %rcx
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	create_string
	.p2align 4,,10
	.p2align 3
.L36:
	leaq	-2(%rbx), %r12
	leaq	(%rdi,%r12), %rsi
	cmpb	$47, (%rsi)
	jne	.L20
	movq	%rbp, %r8
	addq	%rdi, %rdx
	subq	$2, %rbp
	subq	%rbx, %r8
	movq	%r12, %rbx
	call	memmove
	.p2align 4,,10
	.p2align 3
.L10:
	testq	%rbx, %rbx
	jne	.L37
	movl	$1, %ebx
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L25:
	movq	%rdi, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	xorl	%ebp, %ebp
	jmp	.L15
.L37:
	cmpb	$47, (%rsi)
	leaq	1(%rbx), %rdx
	jne	.L20
	movzbl	-1(%rdi,%rbx), %eax
	jmp	.L8
	.seh_endproc
	.p2align 4
	.globl	get_file_name
	.def	get_file_name;	.scl	2;	.type	32;	.endef
	.seh_proc	get_file_name
get_file_name:
	.seh_endprologue
	movq	16(%rcx), %rax
	ret
	.seh_endproc
	.p2align 4
	.globl	get_file_extension
	.def	get_file_extension;	.scl	2;	.type	32;	.endef
	.seh_proc	get_file_extension
get_file_extension:
	.seh_endprologue
	movq	8(%rcx), %rax
	ret
	.seh_endproc
	.p2align 4
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
	movq	(%rcx), %rdx
	movq	%rcx, %rbp
	testq	%rdx, %rdx
	je	.L40
	movq	8(%rdx), %rbx
	xorl	%edi, %edi
	xorl	%esi, %esi
	testq	%rbx, %rbx
	je	.L40
	.p2align 4,,10
	.p2align 3
.L42:
	movq	(%rdx), %rcx
	addq	$1, %rdi
	call	strlen
	movq	%rbx, %rdx
	addq	%rax, %rsi
	movq	8(%rbx), %rax
	testq	%rax, %rax
	je	.L67
	movq	%rax, %rbx
	jmp	.L42
	.p2align 4,,10
	.p2align 3
.L67:
	testq	%rdi, %rdi
	je	.L40
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
	je	.L48
	cmpq	$0, 8(%rbx)
	je	.L48
.L66:
	movq	(%rbx), %rdi
.L50:
	movq	%rsi, %rcx
	call	strlen
	movq	%rdi, %rdx
	leaq	(%rsi,%rax), %rcx
	call	stpcpy
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L48
	cmpq	$0, 8(%rbx)
	je	.L48
	movq	(%rbx), %rdi
	cmpb	$47, (%rdi)
	je	.L68
.L53:
	cmpb	$0, (%rsi)
	je	.L50
	cmpb	$47, -1(%rax)
	je	.L50
	movl	$47, %edx
	movw	%dx, (%rax)
	jmp	.L66
	.p2align 4,,10
	.p2align 3
.L48:
	movq	%rsi, %rcx
	call	strlen
	movq	%rsi, %rcx
	movq	%rax, %rdx
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	create_string
	.p2align 4,,10
	.p2align 3
.L68:
	cmpb	$0, 1(%rdi)
	je	.L50
	jmp	.L53
.L40:
	xorl	%eax, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.p2align 4
	.globl	get_full_path
	.def	get_full_path;	.scl	2;	.type	32;	.endef
	.seh_proc	get_full_path
get_full_path:
	.seh_endprologue
	movq	24(%rcx), %rax
	ret
	.seh_endproc
	.p2align 4
	.globl	change_file_extension
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
	.seh_proc	change_file_extension
change_file_extension:
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
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rdx, 8(%rcx)
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	call	get_file_dir
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L71
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
	je	.L88
.L81:
	movq	%rsi, %rcx
	call	strlen
	movq	%r12, %rcx
	leaq	1(%rdi,%rax), %rdx
	call	create_string
	movq	%rax, %rdi
	testq	%rbp, %rbp
	je	.L89
	cmpb	$0, 0(%r13)
	jne	.L90
.L74:
	movq	16(%rbx), %rdx
	movq	%rdi, %rcx
	call	strcpy
.L75:
	testq	%rsi, %rsi
	je	.L77
.L76:
	movq	%rsi, %rdx
	movq	%rdi, %rcx
	call	strcat
.L77:
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
.L88:
	leaq	2(%rax), %rdx
	movq	%r12, %rcx
	call	create_string
	cmpb	$0, 0(%r13)
	movq	%rax, %rdi
	je	.L74
.L90:
	movq	16(%rbx), %r9
	movq	%r13, %r8
	leaq	.LC1(%rip), %rdx
	movq	%rdi, %rcx
	call	sprintf
	jmp	.L75
	.p2align 4,,10
	.p2align 3
.L71:
	movq	16(%rbx), %rcx
	call	strlen
	testq	%rsi, %rsi
	je	.L80
	leaq	.LC0(%rip), %r12
	leaq	1(%rax), %rdi
	movq	%r12, %r13
	jmp	.L81
	.p2align 4,,10
	.p2align 3
.L80:
	leaq	2(%rax), %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string
	movq	16(%rbx), %rdx
	movq	%rax, %rcx
	movq	%rax, %rdi
	call	strcpy
	jmp	.L77
	.p2align 4,,10
	.p2align 3
.L89:
	movq	16(%rbx), %rdx
	movq	%rdi, %rcx
	call	strcpy
	jmp	.L76
	.seh_endproc
	.section .rdata,"dr"
.LC2:
	.ascii "%s%s\0"
.LC3:
	.ascii "%s/%s%s\0"
	.text
	.p2align 4
	.globl	change_file_name
	.def	change_file_name;	.scl	2;	.type	32;	.endef
	.seh_proc	change_file_name
change_file_name:
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
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	leaq	.LC0(%rip), %r12
	movq	(%rcx), %rax
	movq	%rdx, 16(%rcx)
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	testq	%rax, %rax
	je	.L93
	.p2align 4,,10
	.p2align 3
.L92:
	movq	%rax, %rdi
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L92
	movq	%rsi, %rcx
	movq	8(%rbx), %r13
	call	strlen
	movq	%rax, %rbp
	testq	%r13, %r13
	je	.L104
	movq	%r13, %rcx
	leaq	.LC0(%rip), %r12
	call	strlen
	addq	%rax, %rbp
.L94:
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
.L93:
	movq	%rbx, %rcx
	call	get_file_dir
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L96
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
	je	.L108
.L103:
	movq	%r13, %rcx
	call	strlen
	movq	%r12, %rcx
	leaq	1(%rbp,%rax), %rdx
	call	create_string
	movq	%rax, %rbp
	testq	%rdi, %rdi
	je	.L99
	cmpb	$0, (%r14)
	jne	.L109
.L99:
	movq	%r13, %r9
	movq	%rsi, %r8
	leaq	.LC2(%rip), %rdx
	movq	%rbp, %rcx
	call	sprintf
.L100:
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
.L108:
	addq	$2, %rdx
	movq	%r12, %rcx
	leaq	.LC0(%rip), %r13
	call	create_string
	cmpb	$0, (%r14)
	movq	%rax, %rbp
	je	.L99
.L109:
	movq	%r13, 32(%rsp)
	movq	%rsi, %r9
	movq	%r14, %r8
	movq	%rbp, %rcx
	leaq	.LC3(%rip), %rdx
	call	sprintf
	jmp	.L100
	.p2align 4,,10
	.p2align 3
.L104:
	leaq	.LC0(%rip), %r12
	movq	%r12, %r13
	jmp	.L94
	.p2align 4,,10
	.p2align 3
.L96:
	movq	%rsi, %rcx
	movq	8(%rbx), %r13
	leaq	.LC0(%rip), %r14
	call	strlen
	leaq	1(%rax), %rbp
	testq	%r13, %r13
	jne	.L103
	leaq	2(%rax), %rdx
	movq	%r12, %rcx
	leaq	.LC0(%rip), %r13
	call	create_string
	movq	%rax, %rbp
	jmp	.L99
	.seh_endproc
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
	xorl	%esi, %esi
	xorl	%ebx, %ebx
	movq	%rcx, %rdi
	movq	24(%rcx), %rcx
	call	strlen
	leaq	.LC0(%rip), %rcx
	leaq	1(%rax), %rdx
	movq	%rax, %r13
	call	create_string
	movq	24(%rdi), %rdx
	movq	%rax, %rcx
	movq	%rax, %r14
	call	strcpy
	testq	%r13, %r13
	je	.L111
	cmpb	$47, (%r14)
	je	.L176
.L111:
	movq	%rsi, %rax
	movq	%rbx, %r15
	leaq	48(%rsp), %r12
	jmp	.L127
	.p2align 4,,10
	.p2align 3
.L115:
	cmpq	%rsi, %r13
	jb	.L114
.L127:
	movq	%rsi, %rdx
	addq	$1, %rsi
	cmpq	%rdx, %r13
	je	.L177
	cmpb	$47, (%r14,%rdx)
	jne	.L115
	cmpq	%rdx, %rax
	jb	.L113
.L116:
	movq	%rsi, %rax
	jmp	.L115
	.p2align 4,,10
	.p2align 3
.L177:
	cmpq	%r13, %rax
	jb	.L113
.L114:
	movq	%rbx, (%rdi)
	testq	%r15, %r15
	je	.L128
	movq	(%r15), %r15
	movl	$46, %edx
	movq	%r15, %rcx
	call	strrchr
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L128
	cmpq	%rax, %r15
	je	.L128
	movq	%rax, %rdx
	movq	%r15, %rcx
	subq	%r15, %rdx
	call	create_string
	movq	%rsi, %rcx
	movq	%rax, 16(%rdi)
	call	strlen
	movq	%rsi, %rcx
	movq	%rax, %rdx
	call	create_string
	movq	%rax, 8(%rdi)
	testq	%rbx, %rbx
	je	.L130
.L180:
	movq	%rbx, %rsi
	xorl	%r13d, %r13d
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L131:
	movq	(%rsi), %rcx
	addq	$1, %r13
	call	strlen
	movq	8(%rsi), %rsi
	addq	%rax, %rbp
	testq	%rsi, %rsi
	jne	.L131
	leaq	1(%rbp), %rax
	leaq	0(%rbp,%r13), %rdx
	cmpq	$1, %r13
	cmovbe	%rax, %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string
	movb	$0, (%rax)
	movq	(%rbx), %rsi
	movq	%rax, %rbp
	.p2align 4,,10
	.p2align 3
.L137:
	movq	%rbp, %rcx
	call	strlen
	movq	%rsi, %rdx
	leaq	0(%rbp,%rax), %rcx
	call	stpcpy
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L133
	movq	(%rbx), %rsi
	cmpb	$47, (%rsi)
	je	.L178
.L140:
	cmpb	$0, 0(%rbp)
	je	.L137
	cmpb	$47, -1(%rax)
	je	.L137
	movl	$47, %edx
	movw	%dx, (%rax)
	movq	(%rbx), %rsi
	jmp	.L137
	.p2align 4,,10
	.p2align 3
.L113:
	subq	%rax, %rdx
	movq	%r12, %rcx
	movq	%rdx, %rbp
	leaq	(%r14,%rax), %rdx
	movq	%rbp, %r8
	call	strncpy
	movb	$0, 48(%rsp,%rbp)
	cmpw	$46, (%r12)
	je	.L116
	cmpw	$11822, (%r12)
	je	.L179
.L120:
	cmpb	$0, 48(%rsp)
	je	.L116
	movl	$16, %ecx
	call	alloc_memory
	movq	%rbp, %rdx
	movq	%r12, %rcx
	movq	%rax, 40(%rsp)
	call	create_string
	movq	40(%rsp), %r8
	movq	%rax, (%r8)
	movq	$0, 8(%r8)
	testq	%r15, %r15
	je	.L126
	movq	%r8, 8(%r15)
.L126:
	movq	%r8, %r15
	testq	%rbx, %rbx
	jne	.L116
	movq	%r8, %rbx
	movq	%r8, %r15
	jmp	.L116
	.p2align 4,,10
	.p2align 3
.L128:
	xorl	%eax, %eax
	movq	%r15, 16(%rdi)
	movq	%rax, 8(%rdi)
	testq	%rbx, %rbx
	jne	.L180
.L130:
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	call	create_string
	movb	$0, (%rax)
	movq	%rax, %rbp
.L133:
	movq	%rbp, %rcx
	call	strlen
	movq	%rbp, %rcx
	movq	%rax, %rdx
	call	create_string
	movq	%rax, 24(%rdi)
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
	.p2align 4,,10
	.p2align 3
.L178:
	cmpb	$0, 1(%rsi)
	je	.L137
	jmp	.L140
	.p2align 4,,10
	.p2align 3
.L179:
	cmpb	$0, 2(%r12)
	jne	.L120
	testq	%r15, %r15
	je	.L123
	cmpq	%r15, %rbx
	je	.L123
	movq	(%r15), %rax
	cmpb	$46, (%rax)
	je	.L181
.L143:
	movq	%rbx, %rax
	jmp	.L125
	.p2align 4,,10
	.p2align 3
.L144:
	movq	%rdx, %rax
.L125:
	testq	%rax, %rax
	je	.L116
	movq	8(%rax), %rdx
	cmpq	%r15, %rdx
	jne	.L144
	movq	$0, 8(%rax)
	movq	%rax, %r15
	jmp	.L116
	.p2align 4,,10
	.p2align 3
.L176:
	movl	$16, %ecx
	movl	$1, %esi
	call	alloc_memory
	movl	$1, %edx
	leaq	.LC4(%rip), %rcx
	movq	%rax, %rbx
	call	create_string
	movq	$0, 8(%rbx)
	movq	%rax, (%rbx)
	jmp	.L111
	.p2align 4,,10
	.p2align 3
.L123:
	testq	%rbx, %rbx
	jne	.L116
	movl	$16, %ecx
	call	alloc_memory
	movl	$2, %edx
	leaq	.LC6(%rip), %rcx
	movq	%rax, %rbx
	call	create_string
	movq	%rbx, %r15
	movq	$0, 8(%rbx)
	movq	%rax, (%rbx)
	jmp	.L116
.L181:
	cmpb	$46, 1(%rax)
	jne	.L143
	cmpb	$0, 2(%rax)
	jne	.L143
	movl	$16, %ecx
	call	alloc_memory
	movl	$2, %edx
	leaq	.LC6(%rip), %rcx
	movq	%rax, %rbp
	call	create_string
	movq	$0, 8(%rbp)
	movq	%rax, 0(%rbp)
	movq	%rbp, 8(%r15)
	movq	%rbp, %r15
	jmp	.L116
	.seh_endproc
	.p2align 4
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
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	stpcpy;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	strcat;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
