	.file	"tac.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	""
.LC1:
	.string	"$%d-error"
.LC2:
	.string	"$%c%zu"
	.text
	.p2align 4
	.type	create_var, @function
create_var:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	movq	%rsi, %r13
	pushq	%r12
	movl	%edx, %r12d
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$24, %rsp
	testq	%rdi, %rdi
	je	.L3
	movl	32(%rsi), %ecx
	movq	$0, (%rsp)
	testl	%ecx, %ecx
	jne	.L4
	movq	24(%rbx), %rax
	movq	%rax, (%rsp)
	movq	24(%rsi), %rax
	movq	%rax, 24(%rbx)
.L4:
	movq	8(%rbx), %rax
	testq	%rax, %rax
	je	.L10
	movq	24(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L8
.L14:
	movq	8(%rbx), %rax
	testq	%rax, %rax
	je	.L10
	movq	16(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L58
.L10:
	cmpq	$0, 24(%rbx)
	movq	(%rbx), %rax
	je	.L7
	movq	(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L52
.L55:
	movq	(%rbx), %rax
.L7:
	movq	16(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L53
	movq	(%rbx), %rax
	movq	16(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r14
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L27:
	cmpq	(%r15), %rbp
	je	.L12
.L26:
	movq	%r14, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L27
.L53:
	movl	32(%r13), %eax
	testl	%eax, %eax
	jne	.L3
	movq	(%rsp), %rax
	movq	%rax, 24(%rbx)
.L3:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, (%rax)
	movq	%rax, %r15
	leal	-97(%r12), %eax
	cmpl	$21, %eax
	ja	.L30
	leaq	.L32(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L32:
	.long	.L37-.L32
	.long	.L36-.L32
	.long	.L30-.L32
	.long	.L30-.L32
	.long	.L30-.L32
	.long	.L35-.L32
	.long	.L30-.L32
	.long	.L30-.L32
	.long	.L30-.L32
	.long	.L30-.L32
	.long	.L30-.L32
	.long	.L30-.L32
	.long	.L30-.L32
	.long	.L30-.L32
	.long	.L30-.L32
	.long	.L34-.L32
	.long	.L30-.L32
	.long	.L30-.L32
	.long	.L30-.L32
	.long	.L33-.L32
	.long	.L30-.L32
	.long	.L31-.L32
	.text
	.p2align 4,,10
	.p2align 3
.L8:
	movq	8(%rbx), %rax
	movq	24(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r14
	.p2align 4,,10
	.p2align 3
.L11:
	movq	%r14, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L14
	cmpq	(%r15), %rbp
	jne	.L11
.L12:
	movl	32(%r13), %edx
	testl	%edx, %edx
	jne	.L1
	movq	(%rsp), %rax
	movq	%rax, 24(%rbx)
.L1:
	addq	$24, %rsp
	movq	%r15, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L30:
	leaq	.LC0(%rip), %rdi
	movl	$32, %esi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%r15)
	movq	%rax, %rdi
.L38:
	movl	%r12d, %r8d
	leaq	.LC1(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
.L41:
	andl	$-3, %r12d
	movq	%r13, 16(%r15)
	cmpl	$116, %r12d
	jne	.L1
	movq	8(%rbx), %rax
	movq	%r15, %rsi
	movq	24(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L52:
	movq	(%rbx), %rax
	movq	(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r14
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L24:
	movq	24(%rbx), %rax
	movq	(%rax), %rax
	cmpq	%rax, 8(%r15)
	je	.L59
.L20:
	movq	%r14, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L24
	jmp	.L55
	.p2align 4,,10
	.p2align 3
.L58:
	movq	8(%rbx), %rax
	movq	16(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r14
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L16:
	cmpq	(%r15), %rbp
	je	.L12
.L15:
	movq	%r14, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L16
	jmp	.L10
.L31:
	movq	64(%rbx), %rbp
	leaq	1(%rbp), %rax
	movq	%rax, 64(%rbx)
	.p2align 4,,10
	.p2align 3
.L39:
	leaq	.LC0(%rip), %rdi
	movl	$32, %esi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%r15)
	movq	%rax, %rdi
	cmpq	$-1, %rbp
	je	.L38
	movq	%rbp, %r9
	movl	%r12d, %r8d
	leaq	.LC2(%rip), %rcx
	xorl	%eax, %eax
	movq	$-1, %rdx
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L41
.L33:
	movq	72(%rbx), %rbp
	leaq	1(%rbp), %rax
	movq	%rax, 72(%rbx)
	jmp	.L39
.L34:
	movq	56(%rbx), %rbp
	leaq	1(%rbp), %rax
	movq	%rax, 56(%rbx)
	jmp	.L39
.L35:
	movq	88(%rbx), %rbp
	leaq	1(%rbp), %rax
	movq	%rax, 88(%rbx)
	jmp	.L39
.L36:
	movq	80(%rbx), %rbp
	leaq	1(%rbp), %rax
	movq	%rax, 80(%rbx)
	jmp	.L39
.L37:
	movq	48(%rbx), %rbp
	leaq	1(%rbp), %rax
	movq	%rax, 48(%rbx)
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L59:
	movq	(%r15), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L20
	movq	(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L22:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L20
	movq	(%rax), %r15
	cmpq	(%r15), %rbp
	jne	.L22
	jmp	.L12
	.size	create_var, .-create_var
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"[warning] Unsupported type for size lookup: %s\n"
	.text
	.p2align 4
	.type	get_type_size, @function
get_type_size:
	xorl	%eax, %eax
	testq	%rdi, %rdi
	je	.L69
	cmpq	%rdi, name_int(%rip)
	je	.L70
	cmpq	%rdi, name_float(%rip)
	je	.L70
	cmpq	%rdi, name_string(%rip)
	je	.L70
	cmpq	%rdi, name_bool(%rip)
	movl	$1, %eax
	je	.L69
	cmpq	%rdi, name_void(%rip)
	je	.L69
	movl	32(%rdi), %eax
	testl	%eax, %eax
	jne	.L63
	movq	24(%rdi), %rax
	movq	24(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L69:
	ret
	.p2align 4,,10
	.p2align 3
.L70:
	movl	$8, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L63:
	subq	$8, %rsp
	leaq	.LC3(%rip), %rdx
	movq	8(%rdi), %rcx
	xorl	%eax, %eax
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$8, %eax
	addq	$8, %rsp
	ret
	.size	get_type_size, .-get_type_size
	.p2align 4
	.type	load_rvalue, @function
load_rvalue:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	subq	$8, %rsp
	testq	%rdi, %rdi
	je	.L73
	cmpb	$0, 20(%rdi)
	jne	.L78
.L73:
	addq	$8, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L78:
	movq	%rsi, %rbp
	movq	8(%rdi), %rsi
	movl	$116, %edx
	xorl	%edi, %edi
	movq	%rbp, %rcx
	call	create_var
	movl	$24, %edi
	movq	%rax, %r13
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, %xmm0
	movl	$32, %edi
	movhps	16(%r13), %xmm0
	movq	%rax, %r12
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, 8(%rax)
	movq	%rax, %rsi
	movq	%r12, %rbx
	movq	%r12, (%rax)
	movl	$23, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	addq	$8, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	load_rvalue, .-load_rvalue
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"[warning] Unsupported symbol kind for import: %d\n"
	.text
	.p2align 4
	.globl	tac_import
	.type	tac_import, @function
tac_import:
	pushq	%r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movq	(%rdi), %rbx
	movl	32(%rbx), %ecx
	cmpl	$3, %ecx
	je	.L85
	leal	-1(%rcx), %eax
	cmpl	$1, %eax
	jbe	.L86
	testl	%ecx, %ecx
	jne	.L82
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r12
	call	*create_list@GOTPCREL(%rip)
	movq	%rbx, %xmm1
	movq	%r12, %rsi
	movq	$0, 16(%r12)
	movq	%rax, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, (%r12)
	popq	%rbx
	movq	0(%rbp), %rdi
	popq	%rbp
	popq	%r12
	jmp	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L82:
	popq	%rbx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbp
	leaq	.LC4(%rip), %rdx
	popq	%r12
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L86:
	movq	(%rbx), %rsi
	movq	%rdx, %rcx
	movl	$102, %edx
.L84:
	movq	%rbx, %rdi
	call	create_var
	popq	%rbx
	movq	16(%rbp), %rdi
	movq	%rax, %rsi
	popq	%rbp
	popq	%r12
	jmp	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L85:
	movq	%rdx, %rcx
	movq	(%rbx), %rsi
	movl	$118, %edx
	jmp	.L84
	.size	tac_import, .-tac_import
	.section	.rodata.str1.8
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
	leal	-97(%rdx), %eax
	pushq	%r14
	movl	%edx, %ecx
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	cmpl	$21, %eax
	ja	.L88
	leaq	.L90(%rip), %rdx
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L90:
	.long	.L93-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L92-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L91-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L87-.L90
	.long	.L88-.L90
	.long	.L87-.L90
	.text
	.p2align 4,,10
	.p2align 3
.L88:
	popq	%rbx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbp
	leaq	.LC6(%rip), %rdx
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L87:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L91:
	movq	(%rdi), %rsi
	movq	8(%rdi), %rdi
	movq	%rbx, %rcx
	movl	$112, %edx
	call	create_var
	movq	%rax, %rsi
	movq	8(%rbx), %rax
.L96:
	movq	16(%rax), %rdi
.L97:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L92:
	movq	(%rdi), %rsi
	movq	8(%rdi), %rdi
	movq	%rbx, %rcx
	movl	$102, %edx
	call	create_var
	movq	%rax, %rsi
	movq	(%rbx), %rax
	jmp	.L96
	.p2align 4,,10
	.p2align 3
.L93:
	movq	(%rsi), %rax
	movq	(%rax), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	(%rbx), %rax
	movq	%r12, %rsi
	movq	(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	0(%rbp), %r13
	movq	8(%rbp), %r14
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$97, %edx
	movq	%r13, %rsi
	movq	%r14, %rdi
	movq	%rax, %rbp
	call	create_var
	movq	%r13, %xmm1
	movq	%r13, %rdi
	movq	%rax, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, 0(%rbp)
	movq	16(%r12), %rax
	movq	%rax, 16(%rbp)
	call	get_type_size
	movq	(%r12), %rdi
	addq	%rax, 16(%r12)
	movq	%rbp, %rsi
	testq	%rdi, %rdi
	jne	.L97
	popq	%rbx
	movl	$63, %edx
	popq	%rbp
	movl	$1, %esi
	popq	%r12
	movq	stderr(%rip), %rcx
	leaq	.LC5(%rip), %rdi
	popq	%r13
	popq	%r14
	jmp	*fwrite@GOTPCREL(%rip)
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
	movl	16(%rdi), %ecx
	testl	%ecx, %ecx
	jne	.L99
	movq	8(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L99
	movl	32(%rdi), %eax
	movq	(%rdi), %rsi
	movq	%rbx, %rcx
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L100
	movl	$118, %edx
	call	create_var
	movl	$24, %edi
	movq	%rax, %rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, %xmm0
	movhps	16(%rbx), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r12
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
.L98:
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
.L99:
	movq	0(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L130
	movq	%rbx, %rsi
	call	tac_variable_access
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L131
	movl	16(%rbp), %ecx
	cmpl	$2, %ecx
	je	.L132
	cmpl	$3, %ecx
	je	.L133
	cmpl	$1, %ecx
	jne	.L115
	movl	16(%rax), %ecx
	testl	%ecx, %ecx
	je	.L134
	cmpl	$7, %ecx
	je	.L118
	movq	8(%rax), %rax
.L117:
	movq	8(%rax), %r8
	movq	stderr(%rip), %rdi
	leaq	.LC15(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
.L103:
	xorl	%r12d, %r12d
	jmp	.L98
	.p2align 4,,10
	.p2align 3
.L132:
	movq	8(%rax), %rax
	movl	32(%rax), %edx
	leal	-1(%rdx), %ecx
	cmpl	$1, %ecx
	jbe	.L135
	movq	24(%rax), %rdi
	testl	%edx, %edx
	jne	.L107
	movq	16(%rdi), %rdi
.L107:
	movq	8(%rbp), %rax
	movq	8(%rax), %rsi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L136
	movl	32(%rax), %edx
	leal	-1(%rdx), %ecx
	cmpl	$1, %ecx
	jbe	.L137
	cmpl	$5, %edx
	jne	.L138
	movq	(%rax), %rsi
	movq	%rbx, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	call	create_var
	movl	$24, %edi
	movq	%rax, %r14
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, %xmm0
	movq	%rbx, %rcx
	movl	$97, %edx
	movhps	16(%r14), %xmm0
	movb	$0, 20(%rax)
	movq	%rax, %r12
	movups	%xmm0, (%rax)
	movq	8(%rbp), %rdi
	movl	$0, 16(%rax)
	movq	(%rdi), %rsi
	call	create_var
	movl	$24, %edi
	movq	%rax, %r14
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, %xmm0
	movl	$32, %edi
	movhps	16(%r14), %xmm0
	movq	%rax, %rbp
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, 8(%rax)
	movq	%rax, %rsi
	movq	%r12, (%rax)
	movq	%rbp, 16(%rax)
	movl	$15, 24(%rax)
	movb	$1, 20(%r12)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L98
	.p2align 4,,10
	.p2align 3
.L134:
	movq	8(%rax), %rax
	movl	32(%rax), %edx
	testl	%edx, %edx
	jne	.L117
	movq	8(%rax), %rdi
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	8(%r13), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rdi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$102, %edx
	movq	(%rax), %rsi
	movq	%rax, %rdi
	call	create_var
	movl	$24, %edi
	movq	%rax, %r12
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r12, %xmm0
	movhps	16(%r12), %xmm0
	movl	$7, 16(%rax)
	movq	%rax, %r13
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
.L118:
	movq	8(%rbp), %rdi
	xorl	%ebp, %ebp
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	jmp	.L119
	.p2align 4,,10
	.p2align 3
.L120:
	movq	%rbx, %rsi
	addq	$1, %rbp
	call	tac_expression
	movq	8(%rax), %rdi
	movq	%rax, %r15
	call	get_type_size
	movl	$24, %edi
	movq	%rax, %r12
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
.L119:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L120
	movq	8(%r13), %rsi
	movq	%rbx, %rcx
	movl	$116, %edx
	call	create_var
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
	jmp	.L98
	.p2align 4,,10
	.p2align 3
.L100:
	movl	$102, %edx
.L129:
	call	create_var
	movl	$24, %edi
	movq	%rax, %rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, %xmm0
	movhps	16(%rbx), %xmm0
	movl	$7, 16(%rax)
	movq	%rax, %r12
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L98
	.p2align 4,,10
	.p2align 3
.L133:
	movq	8(%rax), %rax
	movq	8(%rax), %r12
	movl	32(%rax), %eax
	subl	$3, %eax
	cmpl	$2, %eax
	ja	.L128
	leaq	.LC13(%rip), %rsi
	movq	%r12, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L128
	movq	8(%rbp), %rdi
	movq	%rbx, %rsi
	call	tac_expression
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L139
	movq	8(%r13), %rax
	movq	%rbx, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	movq	(%rax), %rsi
	call	create_var
	movl	$24, %edi
	movq	%rax, %rbp
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, %xmm0
	movl	$32, %edi
	movhps	16(%rbp), %xmm0
	movq	%rax, %r12
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, 8(%rax)
	movq	%rax, %rsi
	movq	%r12, (%rax)
	movq	%r14, 16(%rax)
	movl	$16, 24(%rax)
	movb	$1, 20(%r12)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L98
	.p2align 4,,10
	.p2align 3
.L138:
	movq	8(%r13), %rax
	movq	8(%rbp), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movq	8(%rdx), %rcx
	movq	8(%rax), %r8
	leaq	.LC11(%rip), %rdx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L103
	.p2align 4,,10
	.p2align 3
.L130:
	movq	stderr(%rip), %rcx
	movl	$53, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L103
	.p2align 4,,10
	.p2align 3
.L115:
	movq	stderr(%rip), %rdi
	leaq	.LC16(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L103
	.p2align 4,,10
	.p2align 3
.L128:
	movq	stderr(%rip), %rdi
	movq	%r12, %rcx
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC12(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L103
	.p2align 4,,10
	.p2align 3
.L137:
	movq	(%rax), %rsi
	movq	%rbx, %rcx
	movl	$102, %edx
	movq	%rax, %rdi
	jmp	.L129
	.p2align 4,,10
	.p2align 3
.L131:
	movq	stderr(%rip), %rcx
	movl	$54, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L103
	.p2align 4,,10
	.p2align 3
.L139:
	movq	stderr(%rip), %rcx
	movl	$55, %edx
	movl	$1, %esi
	leaq	.LC14(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L103
	.p2align 4,,10
	.p2align 3
.L135:
	movq	8(%rax), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC9(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L103
.L136:
	movq	8(%r13), %rax
	movq	8(%rbp), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movq	8(%rdx), %rcx
	movq	8(%rax), %r8
	leaq	.LC10(%rip), %rdx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L103
	.size	tac_variable_access, .-tac_variable_access
	.section	.rodata.str1.8
	.align 8
.LC18:
	.string	"[warning] Unsupported type for negation: %s\n"
	.align 8
.LC19:
	.string	"[warning] Unsupported primary type for tac_primary: %d\n"
	.text
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
	ja	.L141
	leaq	.L143(%rip), %rdx
	movq	%rsi, %rbp
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L143:
	.long	.L151-.L143
	.long	.L150-.L143
	.long	.L149-.L143
	.long	.L148-.L143
	.long	.L147-.L143
	.long	.L146-.L143
	.long	.L145-.L143
	.long	.L144-.L143
	.long	.L142-.L143
	.text
	.p2align 4,,10
	.p2align 3
.L144:
	movq	(%rdi), %rdi
	call	tac_primary
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	xorl	%edi, %edi
	movq	%rbp, %rcx
	movl	$116, %edx
	movq	8(%rax), %rsi
	movq	%rax, %r13
	call	create_var
	movl	$24, %edi
	movq	%rax, %r12
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r12, %xmm0
	movhps	16(%r12), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	movq	8(%r13), %rax
	cmpq	name_int(%rip), %rax
	je	.L158
	cmpq	name_float(%rip), %rax
	je	.L159
	movq	8(%rax), %rcx
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	leaq	.LC18(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
.L160:
	addq	$24, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L142:
	movq	(%rdi), %rdi
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	tac_variable_access
	.p2align 4,,10
	.p2align 3
.L151:
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
.L140:
	addq	$24, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L150:
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
.L149:
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
.L148:
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
.L147:
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
.L146:
	movq	(%rdi), %rdi
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	tac_expression
	.p2align 4,,10
	.p2align 3
.L145:
	movq	(%rdi), %rdi
	call	tac_primary
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	%rbp, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	movq	name_bool(%rip), %rsi
	movq	%rax, %r13
	call	create_var
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
.L141:
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	leaq	.LC19(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L160
	.p2align 4,,10
	.p2align 3
.L159:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movl	$2, 16(%rax)
	movq	%rax, %r12
	movq	.LC17(%rip), %rax
	movb	$0, 20(%r12)
	movq	%rax, (%r12)
	movq	name_float(%rip), %rax
	movq	%rax, 8(%r12)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$2, 24(%rax)
	movq	%rax, %rsi
	movq	%rbx, (%rax)
	movq	%r12, 8(%rax)
	movq	%r13, 16(%rax)
.L154:
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L140
	.p2align 4,,10
	.p2align 3
.L158:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movl	$1, 16(%rax)
	movq	%rax, %r12
	movq	$0, (%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%r12)
	movq	%rax, 8(%r12)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$1, 24(%rax)
	movq	%rax, %rsi
	movq	%rbx, (%rax)
	movq	%r12, 8(%rax)
	movq	%r13, 16(%rax)
	jmp	.L154
	.size	tac_primary, .-tac_primary
	.section	.rodata.str1.8
	.align 8
.LC20:
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
	subq	$8, %rsp
	cmpl	$19, 24(%rdi)
	je	.L175
	movq	16(%rdi), %rdi
	call	tac_expression
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	%rax, %rbp
	movl	24(%r12), %eax
	cmpl	$18, %eax
	ja	.L163
	movq	(%r12), %rdi
	leaq	CSWTCH.43(%rip), %rdx
	movq	%rbx, %rsi
	movl	(%rdx,%rax,4), %r13d
	call	tac_expression
	movq	%rax, %r14
	movl	24(%r12), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L164
	cmpl	$14, %r13d
	jne	.L168
	movl	16(%r14), %eax
	testl	%eax, %eax
	jne	.L176
.L166:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$14, 24(%rax)
	movq	%rax, %rsi
	movq	%r14, (%rax)
	movq	%rbp, 8(%rax)
	movq	$0, 16(%rax)
	cmpb	$0, 20(%r14)
	jne	.L177
.L167:
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	addq	$8, %rsp
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
.L163:
	movq	(%r12), %rdi
	movq	%rbx, %rsi
	movl	$25, %r13d
	call	tac_expression
	movq	%rax, %r14
	movl	24(%r12), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L164
.L168:
	movq	8(%r14), %rsi
	movq	%rbx, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	call	create_var
	movl	$24, %edi
	movq	%rax, %r15
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r15, %xmm0
	movq	%rbx, %rsi
	movq	%r14, %rdi
	movhps	16(%r15), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r12
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	load_rvalue
	movl	$32, %edi
	movq	%rax, %r15
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r15, 8(%rax)
	movq	%rax, %rsi
	movq	%rbp, 16(%rax)
	movq	%r12, %rbp
	movl	%r13d, 24(%rax)
	movq	%r12, (%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	16(%r14), %eax
	testl	%eax, %eax
	je	.L166
.L176:
	movq	stderr(%rip), %rcx
	movl	$57, %edx
	movl	$1, %esi
	leaq	.LC20(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L166
	.p2align 4,,10
	.p2align 3
.L164:
	movq	8(%r14), %rsi
	movq	%rbx, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	call	create_var
	movl	$24, %edi
	movq	%rax, %r15
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r15, %xmm0
	movq	%rbx, %rsi
	movq	%r14, %rdi
	movhps	16(%r15), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r12
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	load_rvalue
	movl	$32, %edi
	movq	%rax, %r14
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, 16(%rax)
	movq	%rax, %rsi
	movq	%r12, %rbp
	movl	%r13d, 24(%rax)
	movq	%r12, (%rax)
	movq	%r14, 8(%rax)
	jmp	.L167
	.p2align 4,,10
	.p2align 3
.L175:
	movq	8(%rdi), %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	tac_primary
	.p2align 4,,10
	.p2align 3
.L177:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$24, 24(%rax)
	movq	%rax, %rsi
	movq	%r14, (%rax)
	movq	%rbp, 8(%rax)
	movq	$0, 16(%rax)
	jmp	.L167
	.size	tac_expression, .-tac_expression
	.p2align 4
	.globl	tac_if
	.type	tac_if, @function
tac_if:
	pushq	%r15
	movq	%rsi, %rcx
	movq	%rdi, %r15
	movl	$98, %edx
	pushq	%r14
	xorl	%edi, %edi
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	xorl	%esi, %esi
	subq	$56, %rsp
	call	create_var
	xorl	%edi, %edi
	xorl	%esi, %esi
	movq	%rbx, %rcx
	movl	$98, %edx
	movq	%rax, %r12
	call	create_var
	movq	16(%r15), %rdi
	movq	%rax, %rbp
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L181
	movq	24(%r15), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L202
.L181:
	movq	%rbx, %rcx
	movl	$98, %edx
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	create_var
	movq	%rax, 40(%rsp)
.L180:
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
	jmp	.L182
	.p2align 4,,10
	.p2align 3
.L183:
	movq	%rbx, %rsi
	call	tac_statement
.L182:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L183
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
	je	.L203
.L184:
	movq	24(%r15), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L204
.L191:
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
.L202:
	movq	%rbp, 40(%rsp)
	jmp	.L180
	.p2align 4,,10
	.p2align 3
.L204:
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
	jmp	.L192
	.p2align 4,,10
	.p2align 3
.L193:
	movq	%rbx, %rsi
	call	tac_statement
.L192:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L193
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
	jmp	.L191
	.p2align 4,,10
	.p2align 3
.L203:
	movq	16(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L185:
	movq	16(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L184
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
	xorl	%esi, %esi
	xorl	%edi, %edi
	movq	%rbx, %rcx
	movl	$98, %edx
	call	create_var
	xorl	%esi, %esi
	xorl	%edi, %edi
	movq	%rbx, %rcx
	movl	$98, %edx
	movq	%rax, 8(%rsp)
	call	create_var
	movq	(%r12), %rdi
	movq	%rbx, %rsi
	movq	%rax, %rbp
	call	tac_expression
	movq	16(%rsp), %rdi
	movq	%rax, 24(%rsp)
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L205
.L187:
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
	jmp	.L188
	.p2align 4,,10
	.p2align 3
.L189:
	movq	%rbx, %rsi
	call	tac_statement
.L188:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L189
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
	jmp	.L185
	.p2align 4,,10
	.p2align 3
.L205:
	movq	24(%r15), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	cmovne	40(%rsp), %rbp
	jmp	.L187
	.size	tac_if, .-tac_if
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"[warning] 'break' statement used outside of loop\n"
	.align 8
.LC22:
	.string	"[warning] 'continue' statement used outside of loop\n"
	.align 8
.LC23:
	.string	"[warning] Unsupported statement type for tac_statement: %d\n"
	.text
	.p2align 4
	.globl	tac_statement
	.type	tac_statement, @function
tac_statement:
	movl	8(%rdi), %ecx
	cmpl	$7, %ecx
	ja	.L207
	leaq	.L209(%rip), %rdx
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
.L209:
	.long	.L216-.L209
	.long	.L206-.L209
	.long	.L214-.L209
	.long	.L213-.L209
	.long	.L212-.L209
	.long	.L211-.L209
	.long	.L210-.L209
	.long	.L208-.L209
	.text
	.p2align 4,,10
	.p2align 3
.L210:
	movq	32(%rsi), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L218
	movq	32(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	je	.L218
.L233:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$20, 24(%rax)
	movq	%rax, %rsi
	movq	%rbx, (%rax)
	jmp	.L232
	.p2align 4,,10
	.p2align 3
.L208:
	movq	40(%rsi), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L219
	movq	40(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L233
.L219:
	popq	%rbx
	movl	$52, %edx
	popq	%rbp
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	leaq	.LC22(%rip), %rdi
	popq	%r12
	jmp	*fwrite@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L214:
	movq	(%rdi), %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	tac_if
	.p2align 4,,10
	.p2align 3
.L216:
	movq	(%rdi), %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	tac_expression
	.p2align 4,,10
	.p2align 3
.L206:
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L212:
	movq	(%rdi), %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	tac_for
	.p2align 4,,10
	.p2align 3
.L211:
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
	je	.L217
	movq	%rbp, %rsi
	call	tac_expression
	movq	%rax, %r12
.L217:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$21, 24(%rax)
	movq	%rax, %rsi
	movq	%r12, (%rax)
.L232:
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
.L213:
	movq	(%rdi), %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	tac_while
	.p2align 4,,10
	.p2align 3
.L218:
	popq	%rbx
	movl	$49, %edx
	popq	%rbp
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	leaq	.LC21(%rip), %rdi
	popq	%r12
	jmp	*fwrite@GOTPCREL(%rip)
.L207:
	movq	stderr(%rip), %rdi
	leaq	.LC23(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.size	tac_statement, .-tac_statement
	.p2align 4
	.globl	tac_for
	.type	tac_for, @function
tac_for:
	pushq	%r15
	movq	%rsi, %rcx
	movl	$98, %edx
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	xorl	%edi, %edi
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	xorl	%esi, %esi
	subq	$24, %rsp
	call	create_var
	xorl	%esi, %esi
	xorl	%edi, %edi
	movq	%rbx, %rcx
	movl	$98, %edx
	movq	%rax, %r13
	call	create_var
	xorl	%edi, %edi
	xorl	%esi, %esi
	movq	%rbx, %rcx
	movl	$98, %edx
	movq	%rax, %r15
	call	create_var
	cmpq	$0, 8(%r12)
	movl	$24, %edi
	movq	%rax, %r14
	je	.L235
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
.L236:
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
	xorl	%edi, %edi
	xorl	%esi, %esi
	movq	%rbx, %rcx
	movl	$98, %edx
	call	create_var
	cmpq	$0, 16(%r12)
	movl	$24, %edi
	movq	%rax, (%rsp)
	movq	%rax, %rbp
	je	.L237
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	40(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	call	*list_append@GOTPCREL(%rip)
.L238:
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
	jmp	.L240
	.p2align 4,,10
	.p2align 3
.L241:
	movq	%rbx, %rsi
	call	tac_statement
.L240:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L241
	movq	40(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	32(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	cmpq	$0, 16(%r12)
	je	.L242
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
.L242:
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
	je	.L245
.L243:
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
.L237:
	cmpq	$0, 8(%r12)
	je	.L239
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	40(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	call	*list_append@GOTPCREL(%rip)
	jmp	.L238
	.p2align 4,,10
	.p2align 3
.L235:
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
	jmp	.L236
	.p2align 4,,10
	.p2align 3
.L245:
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
	jmp	.L243
	.p2align 4,,10
	.p2align 3
.L239:
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	40(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r15, (%rax)
	call	*list_append@GOTPCREL(%rip)
	jmp	.L238
	.size	tac_for, .-tac_for
	.p2align 4
	.globl	tac_while
	.type	tac_while, @function
tac_while:
	pushq	%r15
	movq	%rsi, %rcx
	movl	$98, %edx
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rdi, %rbp
	xorl	%edi, %edi
	pushq	%rbx
	movq	%rsi, %rbx
	xorl	%esi, %esi
	subq	$24, %rsp
	call	create_var
	movl	$24, %edi
	movq	%rax, %r12
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %r13
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r12, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%r13, (%rax)
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
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
	movq	%rbx, %rcx
	xorl	%esi, %esi
	movl	$98, %edx
	xorl	%edi, %edi
	call	create_var
	movq	%rbx, %rcx
	movl	$98, %edx
	xorl	%esi, %esi
	xorl	%edi, %edi
	movq	%rax, %r14
	call	create_var
	movq	0(%rbp), %rdi
	movq	%rbx, %rsi
	movq	%rax, %r13
	call	tac_expression
	movl	$24, %edi
	movq	%rax, 8(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$24, %edi
	movq	%rax, %r15
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r14, (%rax)
	movb	$0, 20(%rax)
	movq	%rax, (%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	8(%rsp), %rcx
	movq	(%rsp), %rdx
	movq	%rax, %rsi
	movq	%r15, 16(%rax)
	movq	%rdx, 8(%rax)
	movq	%rcx, (%rax)
	movl	$19, 24(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r15
	movq	%r14, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%r15, %rsi
	movq	%rax, 8(%r15)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$24, %edi
	movq	%r15, 16(%rbx)
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
	movq	8(%rbp), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L247
	.p2align 4,,10
	.p2align 3
.L248:
	movq	%rbx, %rsi
	call	tac_statement
.L247:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L248
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
	pushq	%r14
	pushq	%r13
	movq	%rdi, %r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$16, %rsp
	movdqu	(%rdi), %xmm0
	movl	$40, %edi
	movaps	%xmm0, (%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm0
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
	movq	16(%r13), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L251
	.p2align 4,,10
	.p2align 3
.L252:
	movq	(%rax), %rsi
	movq	8(%rax), %rdi
	movq	%rbx, %rcx
	movl	$112, %edx
	call	create_var
	movq	16(%rbp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
.L251:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L252
	movq	%rbx, %rcx
	movl	$98, %edx
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	create_var
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
	movq	%r12, 16(%rbx)
	movq	24(%r13), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L253
	.p2align 4,,10
	.p2align 3
.L254:
	movq	%rbx, %rsi
	call	tac_statement
.L253:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L254
	movq	$0, 8(%rbx)
	addq	$16, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	tac_function, .-tac_function
	.p2align 4
	.globl	tac_method
	.type	tac_method, @function
tac_method:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	movq	%rdi, %r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$24, %rsp
	movdqu	(%rdi), %xmm0
	movl	$40, %edi
	movaps	%xmm0, (%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm0
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
	movq	16(%r13), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L257
	.p2align 4,,10
	.p2align 3
.L258:
	movq	(%rax), %rsi
	movq	8(%rax), %rdi
	movq	%rbx, %rcx
	movl	$112, %edx
	call	create_var
	movq	16(%rbp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
.L257:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L258
	movq	%rbx, %rcx
	movl	$98, %edx
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	create_var
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
	movq	0(%r13), %rax
	movq	8(%rax), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L263
.L259:
	movq	24(%r13), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L260
	.p2align 4,,10
	.p2align 3
.L261:
	movq	%rbx, %rsi
	call	tac_statement
.L260:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L261
	movq	$0, 8(%rbx)
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
.L263:
	movq	24(%rbx), %rax
	movq	%rbx, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	movq	(%rax), %rsi
	call	create_var
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
	jmp	.L259
	.size	tac_method, .-tac_method
	.section	.rodata.str1.8
	.align 8
.LC24:
	.string	"[warning] Unsupported class member type for tac_class: %d\n"
	.text
	.p2align 4
	.globl	tac_class
	.type	tac_class, @function
tac_class:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movq	%rdi, 24(%rsi)
	movq	8(%rdi), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	(%r12), %r14
	movl	$24, %edi
	movq	%rax, %rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r13
	call	*create_list@GOTPCREL(%rip)
	movq	%r14, %xmm1
	movq	%r13, %rsi
	movq	%rax, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, 0(%r13)
	movq	24(%r12), %rax
	leaq	.LC24(%rip), %r12
	movq	%rax, 16(%r13)
	movq	0(%rbp), %rax
	movq	(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L265:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L273
.L270:
	movl	8(%rax), %ecx
	testl	%ecx, %ecx
	je	.L266
	cmpl	$1, %ecx
	je	.L267
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	movq	%r12, %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L270
.L273:
	movq	$0, 24(%rbp)
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L267:
	movq	(%rax), %rdi
	movl	$97, %edx
	movq	%rbp, %rsi
	call	tac_variable
	jmp	.L265
	.p2align 4,,10
	.p2align 3
.L266:
	movq	(%rax), %rdi
	movq	%rbp, %rsi
	call	tac_method
	jmp	.L265
	.size	tac_class, .-tac_class
	.section	.rodata.str1.1
.LC25:
	.string	"main"
	.text
	.p2align 4
	.globl	tac_code
	.type	tac_code, @function
tac_code:
	pushq	%r14
	leaq	.LC25(%rip), %r14
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
.L275:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L283
	movl	8(%rbx), %eax
	cmpl	$1, %eax
	je	.L284
	cmpl	$2, %eax
	je	.L285
	testl	%eax, %eax
	jne	.L275
	movq	(%rbx), %rdi
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	tac_import
	jmp	.L275
	.p2align 4,,10
	.p2align 3
.L284:
	movq	(%rbx), %rdi
	movq	%rbp, %rsi
	call	tac_function
	movq	(%rbx), %rax
	movq	%r14, %rsi
	movq	(%rax), %rbx
	movq	8(%rbx), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L275
	movq	%rbx, 8(%r13)
	jmp	.L275
	.p2align 4,,10
	.p2align 3
.L285:
	movq	(%rbx), %rdi
	movq	%rbp, %rsi
	call	tac_class
	jmp	.L275
	.p2align 4,,10
	.p2align 3
.L283:
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
