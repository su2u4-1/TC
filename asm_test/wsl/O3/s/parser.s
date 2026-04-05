	.file	"tac.c"
	.text
	.p2align 4
	.type	search_var, @function
search_var:
	pushq	%r13
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	8(%rsi), %rax
	testq	%rax, %rax
	je	.L7
	movq	24(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L5
.L11:
	movq	8(%r12), %rax
	testq	%rax, %rax
	je	.L7
	movq	16(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L31
.L7:
	cmpq	$0, 24(%r12)
	movq	(%r12), %rax
	je	.L4
	movq	(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L27
.L29:
	movq	(%r12), %rax
.L4:
	movq	16(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L15
	movq	(%r12), %rax
	movq	16(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L23:
	cmpq	%rbp, (%rax)
	je	.L1
.L22:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L23
.L15:
	xorl	%eax, %eax
.L1:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L27:
	movq	(%r12), %rax
	movq	(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r13
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L21:
	movq	24(%r12), %rax
	movq	(%rax), %rax
	cmpq	%rax, 8(%rbx)
	je	.L32
.L17:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L21
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L5:
	movq	8(%r12), %rax
	movq	24(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L10:
	cmpq	%rbp, (%rax)
	je	.L1
.L8:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L10
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L31:
	movq	8(%r12), %rax
	movq	16(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L13:
	cmpq	%rbp, (%rax)
	je	.L1
.L12:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L13
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L32:
	movq	(%rbx), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L17
	movq	(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L20:
	movq	(%rax), %rax
	cmpq	%rbp, (%rax)
	je	.L1
.L19:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L20
	jmp	.L17
	.size	search_var, .-search_var
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	""
.LC1:
	.string	"$%d-error"
.LC2:
	.string	"$%c%zu"
	.text
	.p2align 4
	.type	create_var.part.0, @function
create_var.part.0:
	pushq	%r14
	movq	%rdi, %r14
	movl	$24, %edi
	pushq	%r13
	movq	%rsi, %r13
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rbp
	pushq	%rbx
	movl	%edx, %ebx
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, (%rax)
	movq	%rax, %rbp
	leal	-97(%rbx), %eax
	cmpl	$21, %eax
	ja	.L34
	leaq	.L36(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L36:
	.long	.L41-.L36
	.long	.L40-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L39-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L38-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L37-.L36
	.long	.L34-.L36
	.long	.L35-.L36
	.text
	.p2align 4,,10
	.p2align 3
.L34:
	leaq	.LC0(%rip), %rdi
	movl	$32, %esi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%rbp)
	movq	%rax, %rdi
.L42:
	movl	%ebx, %r8d
	andl	$-3, %ebx
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC1(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	%r13, 16(%rbp)
	cmpl	$116, %ebx
	je	.L48
.L33:
	popq	%rbx
	movq	%rbp, %rax
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L41:
	movq	48(%r12), %r14
	leaq	1(%r14), %rax
	movq	%rax, 48(%r12)
	.p2align 4,,10
	.p2align 3
.L43:
	leaq	.LC0(%rip), %rdi
	movl	$32, %esi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%rbp)
	movq	%rax, %rdi
	cmpq	$-1, %r14
	je	.L42
	movl	%ebx, %r8d
	andl	$-3, %ebx
	movq	%r14, %r9
	movq	$-1, %rdx
	leaq	.LC2(%rip), %rcx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	%r13, 16(%rbp)
	cmpl	$116, %ebx
	jne	.L33
.L48:
	movq	8(%r12), %rax
	movq	%rbp, %rsi
	movq	24(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	popq	%rbx
	movq	%rbp, %rax
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L40:
	movq	80(%r12), %r14
	leaq	1(%r14), %rax
	movq	%rax, 80(%r12)
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L39:
	movq	88(%r12), %r14
	leaq	1(%r14), %rax
	movq	%rax, 88(%r12)
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L38:
	movq	56(%r12), %r14
	leaq	1(%r14), %rax
	movq	%rax, 56(%r12)
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L37:
	movq	72(%r12), %r14
	leaq	1(%r14), %rax
	movq	%rax, 72(%r12)
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L35:
	movq	64(%r12), %r14
	leaq	1(%r14), %rax
	movq	%rax, 64(%r12)
	jmp	.L43
	.size	create_var.part.0, .-create_var.part.0
	.p2align 4
	.type	create_var.part.0.constprop.0, @function
create_var.part.0.constprop.0:
	pushq	%r12
	pushq	%rbp
	movq	%rdi, %rbp
	movl	$24, %edi
	pushq	%rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movq	80(%rbp), %r12
	movl	$32, %esi
	leaq	.LC0(%rip), %rdi
	movq	$0, (%rax)
	movq	%rax, %rbx
	leaq	1(%r12), %rax
	movq	%rax, 80(%rbp)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%rbx)
	movq	%rax, %rdi
	cmpq	$-1, %r12
	je	.L53
	movq	%r12, %r9
	movl	$98, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	$0, 16(%rbx)
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L53:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	$0, 16(%rbx)
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	create_var.part.0.constprop.0, .-create_var.part.0.constprop.0
	.p2align 4
	.type	create_var.part.0.constprop.1, @function
create_var.part.0.constprop.1:
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	movl	$24, %edi
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	subq	$8, %rsp
	call	*alloc_memory@GOTPCREL(%rip)
	movq	72(%rbp), %r13
	movl	$32, %esi
	leaq	.LC0(%rip), %rdi
	movq	$0, (%rax)
	movq	%rax, %rbx
	leaq	1(%r13), %rax
	movq	%rax, 72(%rbp)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%rbx)
	movq	%rax, %rdi
	cmpq	$-1, %r13
	je	.L58
	movq	%r13, %r9
	movl	$116, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L56:
	movq	8(%rbp), %rax
	movq	%r12, 16(%rbx)
	movq	%rbx, %rsi
	movq	24(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	addq	$8, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L58:
	movl	$116, %r8d
	leaq	.LC1(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L56
	.size	create_var.part.0.constprop.1, .-create_var.part.0.constprop.1
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"[warning] Unsupported symbol kind for import: %d\n"
	.text
	.p2align 4
	.globl	tac_import
	.type	tac_import, @function
tac_import:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	pushq	%rbx
	movq	(%rdi), %rbp
	movq	%rdx, %rbx
	movl	32(%rbp), %ecx
	cmpl	$3, %ecx
	je	.L73
	leal	-1(%rcx), %eax
	cmpl	$1, %eax
	jbe	.L74
	testl	%ecx, %ecx
	jne	.L68
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbx
	call	*create_list@GOTPCREL(%rip)
	movq	%rbp, %xmm1
	movq	$0, 16(%rbx)
	movq	%rbx, %rsi
	movq	%rax, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, (%rbx)
	popq	%rbx
	movq	(%r12), %rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L68:
	popq	%rbx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbp
	leaq	.LC3(%rip), %rdx
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L74:
	movq	0(%rbp), %r13
	xorl	%r14d, %r14d
	movl	32(%r13), %edx
	testl	%edx, %edx
	je	.L75
.L65:
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	search_var
	movq	%rax, %rsi
	movl	32(%r13), %eax
	testl	%eax, %eax
	jne	.L66
	movq	%r14, 24(%rbx)
.L66:
	testq	%rsi, %rsi
	jne	.L67
	movq	%r13, %rsi
	movq	%rbx, %rcx
	movl	$102, %edx
	movq	%rbp, %rdi
	call	create_var.part.0
	movq	%rax, %rsi
.L67:
	popq	%rbx
	movq	16(%r12), %rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L73:
	movq	0(%rbp), %r13
	xorl	%r14d, %r14d
	movl	32(%r13), %esi
	testl	%esi, %esi
	je	.L76
.L61:
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	search_var
	movl	32(%r13), %ecx
	movq	%rax, %rsi
	testl	%ecx, %ecx
	jne	.L62
	movq	%r14, 24(%rbx)
.L62:
	testq	%rsi, %rsi
	jne	.L67
	movq	%r13, %rsi
	movq	%rbx, %rcx
	movl	$118, %edx
	movq	%rbp, %rdi
	call	create_var.part.0
	movq	%rax, %rsi
	jmp	.L67
	.p2align 4,,10
	.p2align 3
.L75:
	movq	24(%r13), %rax
	movq	24(%rbx), %r14
	movq	%rax, 24(%rbx)
	jmp	.L65
	.p2align 4,,10
	.p2align 3
.L76:
	movq	24(%r13), %rax
	movq	24(%rdx), %r14
	movq	%rax, 24(%rdx)
	jmp	.L61
	.size	tac_import, .-tac_import
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"[warning] Unsupported type for size lookup: %s\n"
	.align 8
.LC5:
	.string	"Error: create_attribute received NULL table or attributes list\n"
	.align 8
.LC6:
	.string	"[warning] Unsupported variable type for tac_variable: %d\n"
	.text
	.p2align 4
	.globl	tac_variable
	.type	tac_variable, @function
tac_variable:
	pushq	%r15
	leal	-97(%rdx), %eax
	movl	%edx, %ecx
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	cmpl	$21, %eax
	ja	.L78
	leaq	.L80(%rip), %rdx
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L80:
	.long	.L83-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L82-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L81-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L77-.L80
	.long	.L78-.L80
	.long	.L77-.L80
	.text
	.p2align 4,,10
	.p2align 3
.L78:
	movq	stderr(%rip), %rdi
	addq	$8, %rsp
	leaq	.LC6(%rip), %rdx
	xorl	%eax, %eax
	popq	%rbx
	movl	$2, %esi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L77:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L81:
	movq	8(%rdi), %r12
	movq	(%rdi), %r13
	testq	%r12, %r12
	je	.L90
	movl	32(%r13), %r10d
	xorl	%r14d, %r14d
	testl	%r10d, %r10d
	jne	.L87
	movq	24(%r13), %rax
	movq	24(%rsi), %r14
	movq	%rax, 24(%rsi)
.L87:
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	search_var
	movl	32(%r13), %r9d
	movq	%rax, %rbp
	testl	%r9d, %r9d
	jne	.L88
	movq	%r14, 24(%rbx)
.L88:
	testq	%rbp, %rbp
	je	.L90
.L89:
	movq	8(%rbx), %rax
	movq	%rbp, %rsi
	movq	16(%rax), %rdi
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L82:
	movq	8(%rdi), %rbp
	movq	(%rdi), %r12
	testq	%rbp, %rbp
	je	.L96
	movl	32(%r12), %r8d
	xorl	%r13d, %r13d
	testl	%r8d, %r8d
	jne	.L94
	movq	24(%r12), %rax
	movq	24(%rsi), %r13
	movq	%rax, 24(%rsi)
.L94:
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	search_var
	movl	32(%r12), %edi
	movq	%rax, %rsi
	testl	%edi, %edi
	jne	.L95
	movq	%r13, 24(%rbx)
.L95:
	testq	%rsi, %rsi
	je	.L96
.L93:
	movq	(%rbx), %rax
	movq	16(%rax), %rdi
.L123:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L83:
	movq	(%rsi), %rax
	movq	(%rax), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	%rax, %r13
	movq	(%rbx), %rax
	movq	%r13, %rsi
	movq	(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	8(%rbp), %r14
	movq	0(%rbp), %r12
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%r14, %r14
	je	.L97
	movl	32(%r12), %esi
	xorl	%r15d, %r15d
	testl	%esi, %esi
	jne	.L98
	movq	24(%r12), %rax
	movq	24(%rbx), %r15
	movq	%rax, 24(%rbx)
.L98:
	movq	%rbx, %rsi
	movq	%r14, %rdi
	call	search_var
	movl	32(%r12), %ecx
	testl	%ecx, %ecx
	jne	.L99
	movq	%r15, 24(%rbx)
.L99:
	testq	%rax, %rax
	je	.L100
	movq	%rax, %xmm0
	movq	%r12, %xmm1
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, 0(%rbp)
	movq	16(%r13), %rax
	movq	%rax, 16(%rbp)
.L101:
	cmpq	name_int(%rip), %r12
	je	.L121
	cmpq	name_float(%rip), %r12
	je	.L121
	cmpq	name_string(%rip), %r12
	je	.L121
	cmpq	name_bool(%rip), %r12
	je	.L122
	cmpq	name_void(%rip), %r12
	je	.L122
	movl	32(%r12), %edx
	testl	%edx, %edx
	jne	.L108
	movq	24(%r12), %rdx
	addq	24(%rdx), %rax
	jmp	.L102
	.p2align 4,,10
	.p2align 3
.L96:
	movq	%r12, %rsi
	movq	%rbx, %rcx
	movl	$102, %edx
	movq	%rbp, %rdi
	call	create_var.part.0
	movq	%rax, %rsi
	jmp	.L93
	.p2align 4,,10
	.p2align 3
.L90:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	leaq	.LC0(%rip), %rdi
	movl	$32, %esi
	movq	%r12, (%rax)
	movq	56(%rbx), %r12
	movq	%rax, %rbp
	leaq	1(%r12), %rax
	movq	%rax, 56(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%rbp)
	movq	%rax, %rdi
	cmpq	$-1, %r12
	je	.L124
	movq	%r12, %r9
	movl	$112, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L91:
	movq	%r13, 16(%rbp)
	jmp	.L89
	.p2align 4,,10
	.p2align 3
.L97:
	movq	%rbx, %rcx
	movl	$97, %edx
	movq	%r12, %rsi
	xorl	%edi, %edi
	call	create_var.part.0
	movq	%r12, %xmm2
	movq	%rax, %xmm0
	punpcklqdq	%xmm2, %xmm0
	movups	%xmm0, 0(%rbp)
	movq	16(%r13), %rax
	movq	%rax, 16(%rbp)
	testq	%r12, %r12
	jne	.L101
.L102:
	movq	0(%r13), %rdi
	movq	%rax, 16(%r13)
	movq	%rbp, %rsi
	testq	%rdi, %rdi
	jne	.L123
	movq	stderr(%rip), %rcx
	addq	$8, %rsp
	movl	$63, %edx
	movl	$1, %esi
	popq	%rbx
	leaq	.LC5(%rip), %rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*fwrite@GOTPCREL(%rip)
.L108:
	movq	8(%r12), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC4(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	16(%r13), %rax
	.p2align 4,,10
	.p2align 3
.L121:
	addq	$8, %rax
	jmp	.L102
	.p2align 4,,10
	.p2align 3
.L122:
	addq	$1, %rax
	jmp	.L102
	.p2align 4,,10
	.p2align 3
.L100:
	movq	%rbx, %rcx
	movl	$97, %edx
	movq	%r12, %rsi
	movq	%r14, %rdi
	call	create_var.part.0
	movq	%r12, %xmm3
	movq	%rax, %xmm0
	punpcklqdq	%xmm3, %xmm0
	movups	%xmm0, 0(%rbp)
	movq	16(%r13), %rax
	movq	%rax, 16(%rbp)
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L124:
	movl	$112, %r8d
	leaq	.LC1(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L91
	.size	tac_variable, .-tac_variable
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"[warning] Unsupported variable access with NULL base\n"
	.align 8
.LC8:
	.string	"[warning] Failed to generate variable access for base\n"
	.align 8
.LC9:
	.string	"[warning] Attempting to access attribute of non-object type: %s\n"
	.align 8
.LC10:
	.string	"[warning] Attribute '%s' not found in type '%s'\n"
	.align 8
.LC11:
	.string	"[warning] Symbol '%s' in type '%s' is not an attribute\n"
	.align 8
.LC12:
	.string	"[warning] Attempting to index non-array type: %s\n"
	.section	.rodata.str1.1
.LC13:
	.string	"arr"
	.section	.rodata.str1.8
	.align 8
.LC14:
	.string	"[warning] Failed to generate variable access for index\n"
	.align 8
.LC15:
	.string	"[warning] Attempting to call non-function, kind: %u, type name: %s\n"
	.align 8
.LC16:
	.string	"[warning] Unsupported variable access type for tac_variable_access: %u\n"
	.text
	.p2align 4
	.globl	tac_variable_access
	.type	tac_variable_access, @function
tac_variable_access:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$24, %rsp
	movl	16(%rdi), %eax
	testl	%eax, %eax
	jne	.L126
	movq	8(%rdi), %r12
	testq	%r12, %r12
	je	.L126
	movl	32(%r12), %eax
	movq	(%r12), %r13
	xorl	%r14d, %r14d
	subl	$1, %eax
	movl	32(%r13), %edx
	cmpl	$1, %eax
	jbe	.L127
	testl	%edx, %edx
	je	.L189
.L128:
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	search_var
	movl	32(%r13), %r15d
	movq	%rax, %rbp
	testl	%r15d, %r15d
	jne	.L129
	movq	%r14, 24(%rbx)
.L129:
	testq	%rbp, %rbp
	jne	.L130
	movq	%rbx, %rcx
	movl	$118, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	create_var.part.0
	movq	%rax, %rbp
.L130:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, %xmm0
	movhps	16(%rbp), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r12
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L125
	.p2align 4,,10
	.p2align 3
.L126:
	movq	0(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L190
	movq	%rbx, %rsi
	call	tac_variable_access
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L137
	cmpb	$0, 20(%rax)
	jne	.L191
	movl	16(%rbp), %ecx
	cmpl	$2, %ecx
	je	.L192
.L139:
	cmpl	$3, %ecx
	je	.L193
	cmpl	$1, %ecx
	jne	.L156
	movl	16(%r13), %ecx
	testl	%ecx, %ecx
	jne	.L157
	movq	8(%r13), %rax
	movl	32(%rax), %edi
	testl	%edi, %edi
	je	.L194
.L158:
	movq	8(%rax), %r8
	movq	stderr(%rip), %rdi
	leaq	.LC15(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
.L136:
	xorl	%r12d, %r12d
.L125:
	addq	$24, %rsp
	movq	%r12, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L192:
	movq	8(%r13), %rax
	movl	32(%rax), %edx
	leal	-1(%rdx), %ecx
	cmpl	$1, %ecx
	jbe	.L195
	movq	24(%rax), %rdi
	testl	%edx, %edx
	jne	.L141
	movq	16(%rdi), %rdi
.L141:
	movq	8(%rbp), %rax
	movq	8(%rax), %rsi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L196
	movl	32(%rax), %eax
	leal	-1(%rax), %edx
	cmpl	$1, %edx
	jbe	.L197
	cmpl	$5, %eax
	jne	.L198
	movq	(%r12), %rdi
	movq	%rbx, %rsi
	call	create_var.part.0.constprop.1
	movl	$24, %edi
	movq	%rax, %r14
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, %xmm0
	xorl	%edx, %edx
	movhps	16(%r14), %xmm0
	movb	$0, 20(%rax)
	movq	%rax, %r12
	movups	%xmm0, (%rax)
	movq	8(%rbp), %r15
	movl	$0, 16(%rax)
	movq	(%r15), %r14
	movl	32(%r14), %r9d
	testl	%r9d, %r9d
	jne	.L148
	movq	24(%r14), %rax
	movq	24(%rbx), %rdx
	movq	%rax, 24(%rbx)
.L148:
	movq	%rbx, %rsi
	movq	%r15, %rdi
	movq	%rdx, 8(%rsp)
	call	search_var
	movl	32(%r14), %r8d
	movq	%rax, %rbp
	testl	%r8d, %r8d
	jne	.L149
	movq	8(%rsp), %rdx
	movq	%rdx, 24(%rbx)
.L149:
	testq	%rbp, %rbp
	je	.L199
.L150:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, %xmm0
	movl	$32, %edi
	movhps	16(%rbp), %xmm0
	movq	%rax, %r14
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, 8(%rax)
	movq	%rax, %rsi
	movq	%r12, (%rax)
	movq	%r14, 16(%rax)
	movl	$15, 24(%rax)
	movb	$1, 20(%r12)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L125
	.p2align 4,,10
	.p2align 3
.L191:
	movq	8(%rax), %rdi
	movq	%rbx, %rsi
	call	create_var.part.0.constprop.1
	movl	$24, %edi
	movq	%rax, %r14
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, %xmm0
	movl	$32, %edi
	movhps	16(%r14), %xmm0
	movq	%rax, %r12
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, 8(%rax)
	movq	%rax, %rsi
	movq	%r12, %r13
	movl	$23, 24(%rax)
	movq	%r12, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	16(%rbp), %ecx
	cmpl	$2, %ecx
	jne	.L139
	jmp	.L192
	.p2align 4,,10
	.p2align 3
.L189:
	movq	24(%r13), %rax
	movq	24(%rsi), %r14
	movq	%rax, 24(%rsi)
	jmp	.L128
	.p2align 4,,10
	.p2align 3
.L127:
	testl	%edx, %edx
	jne	.L144
.L188:
	movq	24(%r13), %rax
	movq	24(%rbx), %r14
	movq	%rax, 24(%rbx)
.L144:
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	search_var
	movl	32(%r13), %r10d
	movq	%rax, %rbp
	testl	%r10d, %r10d
	jne	.L145
	movq	%r14, 24(%rbx)
.L145:
	testq	%rbp, %rbp
	jne	.L146
	movq	%rbx, %rcx
	movl	$102, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	create_var.part.0
	movq	%rax, %rbp
.L146:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, %xmm0
	movhps	16(%rbp), %xmm0
	movl	$7, 16(%rax)
	movq	%rax, %r12
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L125
	.p2align 4,,10
	.p2align 3
.L193:
	movq	8(%r13), %rax
	movq	8(%rax), %r12
	movl	32(%rax), %eax
	subl	$3, %eax
	cmpl	$2, %eax
	ja	.L184
	leaq	.LC13(%rip), %rsi
	movq	%r12, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L184
	movq	8(%rbp), %rdi
	movq	%rbx, %rsi
	call	tac_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L154
	cmpb	$0, 20(%rax)
	jne	.L200
.L155:
	movq	8(%r13), %rax
	movq	%rbx, %rsi
	movq	(%rax), %rdi
	call	create_var.part.0.constprop.1
	movl	$24, %edi
	movq	%rax, %r14
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, %xmm0
	movl	$32, %edi
	movhps	16(%r14), %xmm0
	movq	%rax, %r12
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, 8(%rax)
	movq	%rax, %rsi
	movq	%r12, (%rax)
	movq	%rbp, 16(%rax)
	movl	$16, 24(%rax)
	movb	$1, 20(%r12)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L125
	.p2align 4,,10
	.p2align 3
.L157:
	cmpl	$7, %ecx
	je	.L162
	movq	8(%r13), %rax
	jmp	.L158
	.p2align 4,,10
	.p2align 3
.L194:
	movq	8(%rax), %rdi
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi
	xorl	%r15d, %r15d
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	8(%r13), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rdi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	(%rax), %r14
	movq	%rax, %r13
	movl	32(%r14), %esi
	testl	%esi, %esi
	jne	.L159
	movq	24(%r14), %rax
	movq	24(%rbx), %r15
	movq	%rax, 24(%rbx)
.L159:
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	search_var
	movl	32(%r14), %ecx
	movq	%rax, %r12
	testl	%ecx, %ecx
	jne	.L160
	movq	%r15, 24(%rbx)
.L160:
	testq	%r12, %r12
	jne	.L161
	movq	%rbx, %rcx
	movl	$102, %edx
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	create_var.part.0
	movq	%rax, %r12
.L161:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r12, %xmm0
	movhps	16(%r12), %xmm0
	movl	$7, 16(%rax)
	movq	%rax, %r13
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
.L162:
	movq	8(%rbp), %rdi
	xorl	%ebp, %ebp
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	jmp	.L163
	.p2align 4,,10
	.p2align 3
.L202:
	cmpq	name_float(%rip), %rax
	je	.L165
	cmpq	name_string(%rip), %rax
	je	.L165
	cmpq	name_bool(%rip), %rax
	movl	$1, %r12d
	je	.L164
	cmpq	name_void(%rip), %rax
	je	.L164
	movl	32(%rax), %edx
	testl	%edx, %edx
	jne	.L166
	movq	24(%rax), %rax
	movq	24(%rax), %r12
.L164:
	movl	$24, %edi
	addq	$1, %rbp
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movl	$1, 16(%rax)
	movq	%rax, %r14
	movq	%r12, (%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%r14)
	movq	%rax, 8(%r14)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r15, 8(%rax)
	movq	%rax, %rsi
	movl	$17, 24(%rax)
	movq	%r14, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L163:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L201
	movq	%rbx, %rsi
	xorl	%r12d, %r12d
	call	tac_expression
	movq	%rax, %r15
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L164
	cmpq	name_int(%rip), %rax
	jne	.L202
.L165:
	movl	$8, %r12d
	jmp	.L164
	.p2align 4,,10
	.p2align 3
.L201:
	movq	8(%r13), %rdi
	movq	%rbx, %rsi
	call	create_var.part.0.constprop.1
	movl	$24, %edi
	movq	%rax, %r14
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, %xmm0
	movl	$24, %edi
	movhps	16(%r14), %xmm0
	movq	%rax, %r12
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rbp, (%rax)
	movq	%rax, %r14
	movl	$1, 16(%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%r14)
	movq	%rax, 8(%r14)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, 8(%rax)
	movq	%rax, %rsi
	movq	%r12, (%rax)
	movq	%r14, 16(%rax)
	movl	$22, 24(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L125
	.p2align 4,,10
	.p2align 3
.L198:
	movq	8(%r13), %rax
	movq	8(%rbp), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movq	8(%rdx), %rcx
	movq	8(%rax), %r8
	leaq	.LC11(%rip), %rdx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L137:
	movq	stderr(%rip), %rcx
	movl	$54, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L190:
	movq	stderr(%rip), %rcx
	movl	$53, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L156:
	movq	stderr(%rip), %rdi
	leaq	.LC16(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L199:
	movq	%rbx, %rcx
	movl	$97, %edx
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	create_var.part.0
	movq	%rax, %rbp
	jmp	.L150
	.p2align 4,,10
	.p2align 3
.L184:
	movq	stderr(%rip), %rdi
	movq	%r12, %rcx
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC12(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L197:
	movq	(%r12), %r13
	xorl	%r14d, %r14d
	movl	32(%r13), %r11d
	testl	%r11d, %r11d
	jne	.L144
	jmp	.L188
	.p2align 4,,10
	.p2align 3
.L166:
	movq	8(%rax), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC4(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L165
	.p2align 4,,10
	.p2align 3
.L200:
	movq	8(%rax), %rdi
	movq	%rbx, %rsi
	call	create_var.part.0.constprop.1
	movl	$24, %edi
	movq	%rax, %r14
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, %xmm0
	movl	$32, %edi
	movhps	16(%r14), %xmm0
	movq	%rax, %r12
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, 8(%rax)
	movq	%rax, %rsi
	movq	%r12, %rbp
	movl	$23, 24(%rax)
	movq	%r12, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L155
	.p2align 4,,10
	.p2align 3
.L195:
	movq	8(%rax), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC9(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L136
.L154:
	movq	stderr(%rip), %rcx
	movl	$55, %edx
	movl	$1, %esi
	leaq	.LC14(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L136
.L196:
	movq	8(%r13), %rax
	movq	8(%rbp), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movq	8(%rdx), %rcx
	movq	8(%rax), %r8
	leaq	.LC10(%rip), %rdx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L136
	.size	tac_variable_access, .-tac_variable_access
	.section	.rodata.str1.8
	.align 8
.LC18:
	.string	"[warning] Unsupported type for negation: %s\n"
	.align 8
.LC19:
	.string	"[warning] Unsupported primary type for tac_primary: %d\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB20:
	.text
.LHOTB20:
	.p2align 4
	.globl	tac_primary
	.type	tac_primary, @function
tac_primary:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$24, %rsp
	movl	8(%rdi), %ecx
	cmpl	$8, %ecx
	ja	.L204
	leaq	.L206(%rip), %rdx
	movq	%rsi, %rbp
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L206:
	.long	.L214-.L206
	.long	.L213-.L206
	.long	.L212-.L206
	.long	.L211-.L206
	.long	.L210-.L206
	.long	.L209-.L206
	.long	.L208-.L206
	.long	.L207-.L206
	.long	.L205-.L206
	.text
	.p2align 4,,10
	.p2align 3
.L207:
	movq	(%rdi), %rdi
	call	tac_primary
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L217
	cmpb	$0, 20(%rax)
	jne	.L227
.L218:
	movq	8(%r12), %rdi
	movq	%rbp, %rsi
	call	create_var.part.0.constprop.1
	movl	$24, %edi
	movq	%rax, %r13
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, %xmm0
	movhps	16(%r13), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	movq	8(%r12), %rax
	cmpq	name_int(%rip), %rax
	je	.L228
	cmpq	name_float(%rip), %rax
	je	.L229
	movq	8(%rax), %rcx
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	leaq	.LC18(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
.L231:
	addq	$24, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L205:
	movq	(%rdi), %rdi
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	tac_variable_access
	.p2align 4,,10
	.p2align 3
.L214:
	movq	(%rdi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	*strtoll@GOTPCREL(%rip)
	movl	$24, %edi
	movq	%rax, %rbp
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$1, 16(%rax)
	movq	%rax, %rbx
	movq	%rbp, (%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
.L203:
	addq	$24, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L213:
	movq	(%rdi), %rdi
	xorl	%esi, %esi
	call	*strtod@GOTPCREL(%rip)
	movl	$24, %edi
	movsd	%xmm0, 8(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movsd	8(%rsp), %xmm0
	movl	$2, 16(%rax)
	movq	%rax, %rbx
	movsd	%xmm0, (%rax)
	movq	name_float(%rip), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	addq	$24, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L212:
	movq	(%rdi), %xmm0
	movl	$24, %edi
	movq	%xmm0, 8(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	8(%rsp), %xmm0
	movl	$3, 16(%rax)
	movq	%rax, %rbx
	movhps	name_string(%rip), %xmm0
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	addq	$24, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L211:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$4, 16(%rax)
	movq	%rax, %rbx
	movb	$1, (%rax)
	movq	name_bool(%rip), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	addq	$24, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L210:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$4, 16(%rax)
	movq	%rax, %rbx
	movb	$0, (%rax)
	movq	name_bool(%rip), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	addq	$24, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L209:
	movq	(%rdi), %rdi
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	tac_expression
	.p2align 4,,10
	.p2align 3
.L208:
	movq	(%rdi), %rdi
	call	tac_primary
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L216
	cmpb	$0, 20(%rax)
	jne	.L230
.L216:
	movq	name_bool(%rip), %rdi
	movq	%rbp, %rsi
	call	create_var.part.0.constprop.1
	movl	$24, %edi
	movq	%rax, %r12
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r12, %xmm0
	movl	$32, %edi
	movhps	16(%r12), %xmm0
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	movl	$0, 16(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, 8(%rax)
	movq	%rax, %rsi
	movq	%rbx, (%rax)
	movl	$13, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	addq	$24, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L204:
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	leaq	.LC19(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L231
	.p2align 4,,10
	.p2align 3
.L229:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movl	$2, 16(%rax)
	movq	%rax, %r13
	movq	.LC17(%rip), %rax
	movb	$0, 20(%r13)
	movq	%rax, 0(%r13)
	movq	name_float(%rip), %rax
	movq	%rax, 8(%r13)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$2, 24(%rax)
	movq	%rax, %rsi
	movq	%rbx, (%rax)
	movq	%r13, 8(%rax)
	movq	%r12, 16(%rax)
.L220:
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L203
	.p2align 4,,10
	.p2align 3
.L227:
	movq	8(%rax), %rdi
	movq	%rbp, %rsi
	call	create_var.part.0.constprop.1
	movl	$24, %edi
	movq	%rax, %r13
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, %xmm0
	movl	$32, %edi
	movhps	16(%r13), %xmm0
	movq	%rax, %rbx
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r12, 8(%rax)
	movq	%rax, %rsi
	movq	%rbx, %r12
	movl	$23, 24(%rax)
	movq	%rbx, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L218
	.p2align 4,,10
	.p2align 3
.L230:
	movq	8(%rax), %rdi
	movq	%rbp, %rsi
	call	create_var.part.0.constprop.1
	movl	$24, %edi
	movq	%rax, %r12
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r12, %xmm0
	movl	$32, %edi
	movhps	16(%r12), %xmm0
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	movl	$0, 16(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, 8(%rax)
	movq	%rax, %rsi
	movq	%rbx, %r13
	movl	$23, 24(%rax)
	movq	%rbx, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L216
	.p2align 4,,10
	.p2align 3
.L228:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movl	$1, 16(%rax)
	movq	%rax, %r13
	movq	$0, (%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%r13)
	movq	%rax, 8(%r13)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$1, 24(%rax)
	movq	%rax, %rsi
	movq	%rbx, (%rax)
	movq	%r13, 8(%rax)
	movq	%r12, 16(%rax)
	jmp	.L220
	.section	.text.unlikely
	.type	tac_primary.cold, @function
tac_primary.cold:
.L217:
	movq	8, %rax
	ud2
	.text
	.size	tac_primary, .-tac_primary
	.section	.text.unlikely
	.size	tac_primary.cold, .-tac_primary.cold
.LCOLDE20:
	.text
.LHOTE20:
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"[warning] Left-hand side of assignment is not a variable\n"
	.text
	.p2align 4
	.globl	tac_expression
	.type	tac_expression, @function
tac_expression:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$24, %rsp
	cmpl	$19, 24(%rdi)
	je	.L253
	movq	16(%rdi), %rdi
	call	tac_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L234
	cmpb	$0, 20(%rax)
	jne	.L254
.L234:
	movl	24(%r12), %eax
	movq	(%r12), %rdi
	cmpl	$18, %eax
	ja	.L235
	leaq	CSWTCH.43(%rip), %rdx
	movq	%rbx, %rsi
	movl	(%rdx,%rax,4), %r13d
	call	tac_expression
	movq	%rax, %r14
	movl	24(%r12), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L236
	cmpl	$14, %r13d
	jne	.L242
	movl	16(%r14), %eax
	testl	%eax, %eax
	jne	.L255
.L239:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$14, 24(%rax)
	movq	%rax, %rsi
	movq	%r14, (%rax)
	movq	%rbp, 8(%rax)
	movq	$0, 16(%rax)
	cmpb	$0, 20(%r14)
	jne	.L256
.L240:
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	addq	$24, %rsp
	movq	%rbp, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L235:
	movq	%rbx, %rsi
	movl	$25, %r13d
	call	tac_expression
	movq	%rax, %r14
	movl	24(%r12), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L236
.L242:
	movq	8(%r14), %rdi
	movq	%rbx, %rsi
	call	create_var.part.0.constprop.1
	movl	$24, %edi
	movq	%rax, %r12
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r12, %xmm0
	movhps	16(%r12), %xmm0
	movb	$0, 20(%rax)
	movq	%rax, %r15
	movq	%r14, %r12
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	cmpb	$0, 20(%r14)
	jne	.L257
.L238:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r12, 8(%rax)
	movq	%rax, %rsi
	movq	%rbp, 16(%rax)
	movq	%r15, %rbp
	movl	%r13d, 24(%rax)
	movq	%r15, (%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	16(%r14), %eax
	testl	%eax, %eax
	je	.L239
.L255:
	movq	stderr(%rip), %rcx
	movl	$57, %edx
	movl	$1, %esi
	leaq	.LC21(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L239
	.p2align 4,,10
	.p2align 3
.L236:
	movq	8(%r14), %rdi
	movq	%rbx, %rsi
	call	create_var.part.0.constprop.1
	movl	$24, %edi
	movq	%rax, %r15
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r15, %xmm0
	movhps	16(%r15), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r12
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	cmpb	$0, 20(%r14)
	jne	.L258
.L241:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, 16(%rax)
	movq	%rax, %rsi
	movq	%r12, %rbp
	movl	%r13d, 24(%rax)
	movq	%r12, (%rax)
	movq	%r14, 8(%rax)
	jmp	.L240
	.p2align 4,,10
	.p2align 3
.L253:
	movq	8(%rdi), %rdi
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	tac_primary
	.p2align 4,,10
	.p2align 3
.L256:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$24, 24(%rax)
	movq	%rax, %rsi
	movq	%r14, (%rax)
	movq	%rbp, 8(%rax)
	movq	$0, 16(%rax)
	jmp	.L240
	.p2align 4,,10
	.p2align 3
.L254:
	movq	8(%rax), %rdi
	movq	%rbx, %rsi
	call	create_var.part.0.constprop.1
	movl	$24, %edi
	movq	%rax, %r14
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, %xmm0
	movl	$32, %edi
	movhps	16(%r14), %xmm0
	movq	%rax, %r13
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, 8(%rax)
	movq	%rax, %rsi
	movq	%r13, %rbp
	movl	$23, 24(%rax)
	movq	%r13, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L234
	.p2align 4,,10
	.p2align 3
.L258:
	movq	8(%r14), %rdi
	movq	%rbx, %rsi
	call	create_var.part.0.constprop.1
	movl	$24, %edi
	movq	%rax, 8(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	8(%rsp), %rdx
	movl	$32, %edi
	movq	%rax, %r15
	movl	$0, 16(%rax)
	movq	%rdx, %xmm0
	movhps	16(%rdx), %xmm0
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, 8(%rax)
	movq	%rax, %rsi
	movq	%r15, %r14
	movl	$23, 24(%rax)
	movq	%r15, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L241
	.p2align 4,,10
	.p2align 3
.L257:
	movq	8(%r14), %rdi
	movq	%rbx, %rsi
	call	create_var.part.0.constprop.1
	movl	$24, %edi
	movq	%rax, 8(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	8(%rsp), %rdx
	movl	$32, %edi
	movq	%rax, %r12
	movl	$0, 16(%rax)
	movq	%rdx, %xmm0
	movhps	16(%rdx), %xmm0
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, 8(%rax)
	movq	%rax, %rsi
	movq	%r12, (%rax)
	movl	$23, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L238
	.size	tac_expression, .-tac_expression
	.p2align 4
	.globl	tac_if
	.type	tac_if, @function
tac_if:
	pushq	%r15
	movq	%rdi, %r15
	movq	%rsi, %rdi
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$56, %rsp
	call	create_var.part.0.constprop.0
	movq	%rbx, %rdi
	movq	%rax, %r12
	call	create_var.part.0.constprop.0
	movq	16(%r15), %rdi
	movq	%rax, %rbp
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L262
	movq	24(%r15), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L283
.L262:
	movq	%rbx, %rdi
	call	create_var.part.0.constprop.0
	movq	%rax, 40(%rsp)
.L261:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, %rsi
	movl	$6, 16(%rax)
	movq	%rax, %r14
	movq	$0, 8(%rax)
	movq	40(%rsp), %rax
	movb	$0, 20(%r14)
	movq	(%r15), %rdi
	movq	%rax, (%r14)
	call	tac_expression
	movl	$24, %edi
	movq	%rax, 16(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$24, %edi
	movq	%rax, %r13
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%r12, (%rax)
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movb	$0, 20(%rax)
	movq	%rax, 8(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rdx
	movq	%rax, %rsi
	movq	%r13, 16(%rax)
	movq	%rdx, 8(%rax)
	movq	%rcx, (%rax)
	movl	$19, 24(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r13
	movq	%r12, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%r13, %rsi
	movq	%rax, 8(%r13)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r13, 16(%rbx)
	movq	8(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L263
	.p2align 4,,10
	.p2align 3
.L264:
	movq	%rbx, %rsi
	call	tac_statement
.L263:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L264
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	$0, 8(%rax)
	movq	%rax, %rsi
	movl	$20, 24(%rax)
	movq	%r14, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	16(%r15), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L284
.L265:
	movq	24(%r15), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L285
.L272:
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	40(%rsp), %rax
	movq	%rax, 0(%rbp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rbp, %rsi
	movq	%rax, 8(%rbp)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%rbp, 16(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L283:
	movq	%rbp, 40(%rsp)
	jmp	.L261
	.p2align 4,,10
	.p2align 3
.L285:
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	%rbp, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%r12, %rsi
	movq	%rax, 8(%r12)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r12, 16(%rbx)
	movq	24(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L273
	.p2align 4,,10
	.p2align 3
.L274:
	movq	%rbx, %rsi
	call	tac_statement
.L273:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L274
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, (%rax)
	movq	%rax, %rsi
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L272
	.p2align 4,,10
	.p2align 3
.L284:
	movq	16(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L266:
	movq	16(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L265
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r13
	movq	%rbp, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%r13, %rsi
	movq	%rax, 8(%r13)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r13, 16(%rbx)
	movq	%rbx, %rdi
	call	create_var.part.0.constprop.0
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	create_var.part.0.constprop.0
	movq	(%r12), %rdi
	movq	%rbx, %rsi
	movq	%rax, %rbp
	call	tac_expression
	movq	16(%rsp), %rdi
	movq	%rax, 24(%rsp)
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L286
.L268:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$24, %edi
	movq	%rax, %r13
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rcx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	8(%rsp), %rax
	movb	$0, 20(%rcx)
	movq	%rax, (%rcx)
	movq	%rcx, 32(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	24(%rsp), %rdx
	movq	32(%rsp), %rcx
	movq	%rax, %rsi
	movq	%r13, 16(%rax)
	movq	%rcx, 8(%rax)
	movq	%rdx, (%rax)
	movl	$19, 24(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r13
	movq	8(%rsp), %rax
	movq	%rax, 0(%r13)
	call	*create_list@GOTPCREL(%rip)
	movq	%r13, %rsi
	movq	%rax, 8(%r13)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	8(%r12), %rdi
	movq	%r13, 16(%rbx)
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L269
	.p2align 4,,10
	.p2align 3
.L270:
	movq	%rbx, %rsi
	call	tac_statement
.L269:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L270
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, (%rax)
	movq	%rax, %rsi
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L266
	.p2align 4,,10
	.p2align 3
.L286:
	movq	24(%r15), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	cmovne	40(%rsp), %rbp
	jmp	.L268
	.size	tac_if, .-tac_if
	.section	.rodata.str1.8
	.align 8
.LC22:
	.string	"[warning] 'break' statement used outside of loop\n"
	.align 8
.LC23:
	.string	"[warning] 'continue' statement used outside of loop\n"
	.align 8
.LC24:
	.string	"[warning] Unsupported statement type for tac_statement: %d\n"
	.text
	.p2align 4
	.globl	tac_statement
	.type	tac_statement, @function
tac_statement:
	movl	8(%rdi), %ecx
	cmpl	$7, %ecx
	ja	.L288
	leaq	.L290(%rip), %rdx
	pushq	%r12
	movslq	(%rdx,%rcx,4), %rax
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movq	%rdi, %rbx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L290:
	.long	.L297-.L290
	.long	.L287-.L290
	.long	.L295-.L290
	.long	.L294-.L290
	.long	.L293-.L290
	.long	.L292-.L290
	.long	.L291-.L290
	.long	.L289-.L290
	.text
	.p2align 4,,10
	.p2align 3
.L291:
	movq	32(%rsi), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L299
	movq	32(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	je	.L299
.L314:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$20, 24(%rax)
	movq	%rax, %rsi
	movq	%rbx, (%rax)
	jmp	.L313
	.p2align 4,,10
	.p2align 3
.L289:
	movq	40(%rsi), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L300
	movq	40(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L314
.L300:
	popq	%rbx
	movl	$52, %edx
	popq	%rbp
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	leaq	.LC23(%rip), %rdi
	popq	%r12
	jmp	*fwrite@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L295:
	movq	(%rdi), %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	tac_if
	.p2align 4,,10
	.p2align 3
.L297:
	movq	(%rdi), %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	tac_expression
	.p2align 4,,10
	.p2align 3
.L287:
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L293:
	movq	(%rdi), %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	tac_for
	.p2align 4,,10
	.p2align 3
.L292:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r12
	movl	$5, 16(%rax)
	movq	$0, (%rax)
	movq	name_void(%rip), %rax
	movb	$0, 20(%r12)
	movq	(%rbx), %rdi
	movq	%rax, 8(%r12)
	testq	%rdi, %rdi
	je	.L298
	movq	%rbp, %rsi
	call	tac_expression
	movq	%rax, %r12
.L298:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$21, 24(%rax)
	movq	%rax, %rsi
	movq	%r12, (%rax)
.L313:
	movq	16(%rbp), %rax
	movq	$0, 8(%rsi)
	movq	$0, 16(%rsi)
	popq	%rbx
	movq	8(%rax), %rdi
	popq	%rbp
	popq	%r12
	jmp	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L294:
	movq	(%rdi), %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	tac_while
	.p2align 4,,10
	.p2align 3
.L299:
	popq	%rbx
	movl	$49, %edx
	popq	%rbp
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	leaq	.LC22(%rip), %rdi
	popq	%r12
	jmp	*fwrite@GOTPCREL(%rip)
.L288:
	movq	stderr(%rip), %rdi
	leaq	.LC24(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.size	tac_statement, .-tac_statement
	.p2align 4
	.globl	tac_for
	.type	tac_for, @function
tac_for:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	movq	%rsi, %rdi
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$24, %rsp
	call	create_var.part.0.constprop.0
	movq	%rbx, %rdi
	movq	%rax, %r13
	call	create_var.part.0.constprop.0
	movq	%rbx, %rdi
	movq	%rax, %r15
	call	create_var.part.0.constprop.0
	cmpq	$0, 8(%r12)
	movl	$24, %edi
	movq	%rax, %r14
	je	.L316
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rbp
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbp, (%rax)
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%r13, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%rbp, %rsi
	movq	%rax, 8(%rbp)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%rbp, 16(%rbx)
	movq	8(%r12), %rdi
	movq	%rbx, %rsi
	call	tac_expression
	movl	$24, %edi
	movq	%rax, 8(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$24, %edi
	movq	%rax, %rbp
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r14, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r15, (%rax)
	movb	$0, 20(%rax)
	movq	%rax, (%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	8(%rsp), %rcx
	movq	(%rsp), %rdx
	movl	$19, 24(%rax)
	movq	%rax, %rsi
	movq	%rdx, 8(%rax)
	movq	%rcx, (%rax)
	movq	%rbp, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L317:
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%r15, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%rbp, %rsi
	movq	%rax, 8(%rbp)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%rbp, 16(%rbx)
	movq	%rbx, %rdi
	call	create_var.part.0.constprop.0
	cmpq	$0, 16(%r12)
	movl	$24, %edi
	movq	%rax, (%rsp)
	movq	%rax, %rbp
	je	.L318
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	40(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	call	*list_append@GOTPCREL(%rip)
.L319:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	32(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r14, (%rax)
	call	*list_append@GOTPCREL(%rip)
	movq	24(%r12), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L321
	.p2align 4,,10
	.p2align 3
.L322:
	movq	%rbx, %rsi
	call	tac_statement
.L321:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L322
	movq	40(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	32(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	cmpq	$0, 16(%r12)
	je	.L323
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rbp
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	(%rsp), %rax
	movb	$0, 20(%rbp)
	movq	%rax, 0(%rbp)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbp, (%rax)
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	(%rsp), %rax
	movq	%rax, 0(%rbp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rbp, %rsi
	movq	%rax, 8(%rbp)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%rbp, 16(%rbx)
	movq	16(%r12), %rdi
	movq	%rbx, %rsi
	call	tac_expression
.L323:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rbp
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	cmpq	$0, 8(%r12)
	movl	$20, 24(%rax)
	movq	%rax, %rsi
	movq	%rbp, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	je	.L326
.L324:
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%r14, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%rbp, %rsi
	movq	%rax, 8(%rbp)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%rbp, 16(%rbx)
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L318:
	cmpq	$0, 8(%r12)
	je	.L320
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	40(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	call	*list_append@GOTPCREL(%rip)
	jmp	.L319
	.p2align 4,,10
	.p2align 3
.L316:
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rbp
	movq	%r15, (%rax)
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, (%rax)
	movq	%rax, %rsi
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L317
	.p2align 4,,10
	.p2align 3
.L326:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rbp
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r15, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$20, 24(%rax)
	movq	%rax, %rsi
	movq	%rbp, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	jmp	.L324
	.p2align 4,,10
	.p2align 3
.L320:
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	40(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r15, (%rax)
	call	*list_append@GOTPCREL(%rip)
	jmp	.L319
	.size	tac_for, .-tac_for
	.p2align 4
	.globl	tac_while
	.type	tac_while, @function
tac_while:
	pushq	%r15
	movq	%rdi, %r15
	movq	%rsi, %rdi
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$24, %rsp
	call	create_var.part.0.constprop.0
	movl	$24, %edi
	movq	%rax, %r12
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rbp
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r12, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbp, (%rax)
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%r12, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%rbp, %rsi
	movq	%rax, 8(%rbp)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%rbp, 16(%rbx)
	movq	%rbx, %rdi
	call	create_var.part.0.constprop.0
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	create_var.part.0.constprop.0
	movq	(%r15), %rdi
	movq	%rbx, %rsi
	movq	%rax, %r13
	call	tac_expression
	movl	$24, %edi
	movq	%rax, 8(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$24, %edi
	movq	%rax, %r14
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rbp, (%rax)
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movb	$0, 20(%rax)
	movq	%rax, (%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	8(%rsp), %rcx
	movq	(%rsp), %rdx
	movq	%rax, %rsi
	movq	%r14, 16(%rax)
	movq	%rdx, 8(%rax)
	movq	%rcx, (%rax)
	movl	$19, 24(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r14
	movq	%rbp, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%r14, %rsi
	movq	%rax, 8(%r14)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$24, %edi
	movq	%r14, 16(%rbx)
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	40(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r12, (%rax)
	call	*list_append@GOTPCREL(%rip)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	32(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	call	*list_append@GOTPCREL(%rip)
	movq	8(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L328
	.p2align 4,,10
	.p2align 3
.L329:
	movq	%rbx, %rsi
	call	tac_statement
.L328:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L329
	movq	40(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	32(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rbp
	movq	%r12, (%rax)
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbp, (%rax)
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%r13, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%rbp, %rsi
	movq	%rax, 8(%rbp)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%rbp, 16(%rbx)
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	tac_while, .-tac_while
	.p2align 4
	.globl	tac_function
	.type	tac_function, @function
tac_function:
	pushq	%r15
	movq	%rdi, %r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$40, %rsp
	movdqu	(%rdi), %xmm0
	movq	%rdi, 8(%rsp)
	movl	$40, %edi
	movaps	%xmm0, 16(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	16(%rsp), %xmm0
	movq	%rax, %rbp
	movups	%xmm0, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 16(%rbp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 24(%rbp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rbp, %rsi
	movq	%rax, 32(%rbp)
	movq	(%rbx), %rax
	movq	%rbp, 8(%rbx)
	movq	24(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	16(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L332
	.p2align 4,,10
	.p2align 3
.L334:
	movq	16(%rbp), %rdi
	call	*list_append@GOTPCREL(%rip)
.L332:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L346
	movq	8(%rax), %r15
	movq	(%rax), %r14
	testq	%r15, %r15
	je	.L337
	movl	32(%r14), %edx
	xorl	%r13d, %r13d
	testl	%edx, %edx
	jne	.L335
	movq	24(%r14), %rax
	movq	24(%rbx), %r13
	movq	%rax, 24(%rbx)
.L335:
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	search_var
	movq	%rax, %rsi
	movl	32(%r14), %eax
	testl	%eax, %eax
	jne	.L336
	movq	%r13, 24(%rbx)
.L336:
	testq	%rsi, %rsi
	jne	.L334
.L337:
	movq	%r14, %rsi
	movq	%rbx, %rcx
	movl	$112, %edx
	movq	%r15, %rdi
	call	create_var.part.0
	movq	%rax, %rsi
	jmp	.L334
	.p2align 4,,10
	.p2align 3
.L346:
	movq	%rbx, %rdi
	call	create_var.part.0.constprop.0
	movl	$16, %edi
	movq	%rax, %r14
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	%r14, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	32(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rax, 8(%r12)
	call	*list_append@GOTPCREL(%rip)
	movq	8(%rsp), %rax
	movq	%r12, 16(%rbx)
	movq	24(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L339
	.p2align 4,,10
	.p2align 3
.L340:
	movq	%rbx, %rsi
	call	tac_statement
.L339:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L340
	movq	$0, 8(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	tac_function, .-tac_function
	.p2align 4
	.globl	tac_method
	.type	tac_method, @function
tac_method:
	pushq	%r15
	movq	%rdi, %r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$40, %rsp
	movdqu	(%rdi), %xmm0
	movq	%rdi, 8(%rsp)
	movl	$40, %edi
	movaps	%xmm0, 16(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	16(%rsp), %xmm0
	movq	%rax, %rbp
	movups	%xmm0, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 16(%rbp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 24(%rbp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rbp, %rsi
	movq	%rax, 32(%rbp)
	movq	(%rbx), %rax
	movq	%rbp, 8(%rbx)
	movq	24(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	16(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L348
	.p2align 4,,10
	.p2align 3
.L350:
	movq	16(%rbp), %rdi
	call	*list_append@GOTPCREL(%rip)
.L348:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L363
	movq	8(%rax), %r15
	movq	(%rax), %r14
	testq	%r15, %r15
	je	.L353
	movl	32(%r14), %edx
	xorl	%r13d, %r13d
	testl	%edx, %edx
	jne	.L351
	movq	24(%r14), %rax
	movq	24(%rbx), %r13
	movq	%rax, 24(%rbx)
.L351:
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	search_var
	movq	%rax, %rsi
	movl	32(%r14), %eax
	testl	%eax, %eax
	jne	.L352
	movq	%r13, 24(%rbx)
.L352:
	testq	%rsi, %rsi
	jne	.L350
.L353:
	movq	%r14, %rsi
	movq	%rbx, %rcx
	movl	$112, %edx
	movq	%r15, %rdi
	call	create_var.part.0
	movq	%rax, %rsi
	jmp	.L350
	.p2align 4,,10
	.p2align 3
.L363:
	movq	%rbx, %rdi
	call	create_var.part.0.constprop.0
	movl	$16, %edi
	movq	%rax, %r14
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	%r14, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	32(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rax, 8(%r12)
	call	*list_append@GOTPCREL(%rip)
	movq	24(%rbx), %rax
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi
	movq	%r12, 16(%rbx)
	movq	(%rax), %rax
	movq	8(%rax), %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L364
.L355:
	movq	8(%rsp), %rax
	movq	24(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L356
	.p2align 4,,10
	.p2align 3
.L357:
	movq	%rbx, %rsi
	call	tac_statement
.L356:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L357
	movq	$0, 8(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L364:
	movq	24(%rbx), %rax
	movq	%rbx, %rsi
	movq	(%rax), %rdi
	call	create_var.part.0.constprop.1
	movl	$24, %edi
	movq	%rax, %rbp
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, %xmm0
	movl	$24, %edi
	movhps	16(%rbp), %xmm0
	movb	$0, 20(%rax)
	movq	%rax, %r14
	movups	%xmm0, (%rax)
	movq	24(%rbx), %r15
	movl	$0, 16(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rbp
	movl	$1, 16(%rax)
	movq	24(%r15), %rax
	movb	$0, 20(%rbp)
	movq	%rax, 0(%rbp)
	movq	name_int(%rip), %rax
	movq	%rax, 8(%rbp)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	8(%r12), %rdi
	movl	$18, 24(%rax)
	movq	%rax, %rsi
	movq	%r14, (%rax)
	movq	%rbp, 8(%rax)
	movq	$0, 16(%rax)
	call	*list_append@GOTPCREL(%rip)
	jmp	.L355
	.size	tac_method, .-tac_method
	.section	.rodata.str1.8
	.align 8
.LC25:
	.string	"[warning] Unsupported class member type for tac_class: %d\n"
	.text
	.p2align 4
	.globl	tac_class
	.type	tac_class, @function
tac_class:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$24, %rsp
	movq	%rdi, 24(%rsi)
	movq	8(%rdi), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movl	$24, %edi
	movq	0(%rbp), %r14
	movq	%rax, %r12
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r13
	call	*create_list@GOTPCREL(%rip)
	movq	%r14, %xmm2
	movq	%r13, %rsi
	movq	%rax, %xmm0
	punpcklqdq	%xmm2, %xmm0
	movups	%xmm0, 0(%r13)
	movq	24(%rbp), %rax
	movq	%rax, 16(%r13)
	movq	(%rbx), %rax
	movq	(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L366:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L394
.L384:
	movl	8(%rax), %ecx
	testl	%ecx, %ecx
	je	.L367
	cmpl	$1, %ecx
	je	.L368
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	movl	$2, %esi
	leaq	.LC25(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L384
.L394:
	movq	$0, 24(%rbx)
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L368:
	movq	(%rax), %r13
	movq	(%rbx), %rax
	movq	(%rax), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	(%rbx), %rax
	movq	%rbp, %rsi
	movq	(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	0(%r13), %r14
	movq	8(%r13), %r13
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r15
	testq	%r13, %r13
	je	.L371
	movq	$0, 8(%rsp)
	movl	32(%r14), %esi
	testl	%esi, %esi
	jne	.L372
	movq	24(%rbx), %rax
	movq	%rax, 8(%rsp)
	movq	24(%r14), %rax
	movq	%rax, 24(%rbx)
.L372:
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	search_var
	movl	32(%r14), %ecx
	testl	%ecx, %ecx
	jne	.L373
	movq	8(%rsp), %rdx
	movq	%rdx, 24(%rbx)
.L373:
	testq	%rax, %rax
	je	.L374
	movq	%rax, %xmm0
	movq	%r14, %xmm1
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, (%r15)
	movq	16(%rbp), %rax
	movq	%rax, 16(%r15)
.L375:
	cmpq	name_int(%rip), %r14
	je	.L392
	cmpq	name_float(%rip), %r14
	je	.L392
	cmpq	name_string(%rip), %r14
	je	.L392
	cmpq	name_bool(%rip), %r14
	je	.L393
	cmpq	name_void(%rip), %r14
	je	.L393
	movl	32(%r14), %edx
	testl	%edx, %edx
	jne	.L382
	movq	24(%r14), %rdx
	movq	0(%rbp), %rdi
	addq	24(%rdx), %rax
	movq	%rax, 16(%rbp)
	testq	%rdi, %rdi
	jne	.L383
	.p2align 4,,10
	.p2align 3
.L395:
	movq	stderr(%rip), %rcx
	movl	$63, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L366
	.p2align 4,,10
	.p2align 3
.L393:
	addq	$1, %rax
.L376:
	movq	0(%rbp), %rdi
	movq	%rax, 16(%rbp)
	testq	%rdi, %rdi
	je	.L395
.L383:
	movq	%r15, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L366
	.p2align 4,,10
	.p2align 3
.L367:
	movq	(%rax), %rdi
	movq	%rbx, %rsi
	call	tac_method
	jmp	.L366
	.p2align 4,,10
	.p2align 3
.L382:
	movq	8(%r14), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC4(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	16(%rbp), %rax
	.p2align 4,,10
	.p2align 3
.L392:
	addq	$8, %rax
	jmp	.L376
	.p2align 4,,10
	.p2align 3
.L371:
	movq	%rbx, %rcx
	movl	$97, %edx
	movq	%r14, %rsi
	xorl	%edi, %edi
	call	create_var.part.0
	movq	%r14, %xmm3
	movq	%rax, %xmm0
	punpcklqdq	%xmm3, %xmm0
	movups	%xmm0, (%r15)
	movq	16(%rbp), %rax
	movq	%rax, 16(%r15)
	testq	%r14, %r14
	je	.L376
	jmp	.L375
	.p2align 4,,10
	.p2align 3
.L374:
	movq	%rbx, %rcx
	movl	$97, %edx
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	create_var.part.0
	movq	%r14, %xmm4
	movq	%rax, %xmm0
	punpcklqdq	%xmm4, %xmm0
	movups	%xmm0, (%r15)
	movq	16(%rbp), %rax
	movq	%rax, 16(%r15)
	jmp	.L375
	.size	tac_class, .-tac_class
	.section	.rodata.str1.1
.LC26:
	.string	"main"
	.text
	.p2align 4
	.globl	tac_code
	.type	tac_code, @function
tac_code:
	pushq	%r14
	leaq	.LC26(%rip), %r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r13
	call	*create_list@GOTPCREL(%rip)
	movq	$0, 8(%r13)
	movq	%rax, 0(%r13)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 16(%r13)
	call	*create_list@GOTPCREL(%rip)
	movl	$96, %edi
	movq	%rax, 24(%r13)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%r13, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 32(%rbp)
	call	*create_list@GOTPCREL(%rip)
	pxor	%xmm0, %xmm0
	movq	(%rbx), %rdi
	movq	%rax, 40(%rbp)
	movups	%xmm0, 48(%rbp)
	movups	%xmm0, 64(%rbp)
	movups	%xmm0, 80(%rbp)
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L397:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L405
	movl	8(%rbx), %eax
	cmpl	$1, %eax
	je	.L406
	cmpl	$2, %eax
	je	.L407
	testl	%eax, %eax
	jne	.L397
	movq	(%rbx), %rdi
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	tac_import
	jmp	.L397
	.p2align 4,,10
	.p2align 3
.L406:
	movq	(%rbx), %rdi
	movq	%rbp, %rsi
	call	tac_function
	movq	(%rbx), %rax
	movq	%r14, %rsi
	movq	(%rax), %rbx
	movq	8(%rbx), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L397
	movq	%rbx, 8(%r13)
	jmp	.L397
	.p2align 4,,10
	.p2align 3
.L407:
	movq	(%rbx), %rdi
	movq	%rbp, %rsi
	call	tac_class
	jmp	.L397
	.p2align 4,,10
	.p2align 3
.L405:
	popq	%rbx
	movq	%r13, %rax
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	tac_code, .-tac_code
	.section	.rodata
	.align 32
	.type	CSWTCH.43, @object
	.size	CSWTCH.43, 76
CSWTCH.43:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.long	8
	.long	9
	.long	10
	.long	11
	.long	12
	.long	14
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC17:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
