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
	.string	"[Warning] Unsupported type for size lookup: %s\n"
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
	.type	load_rvalue.part.0, @function
load_rvalue.part.0:
	pushq	%r13
	movl	$116, %edx
	movq	%rdi, %r13
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	movq	%r12, %rcx
	pushq	%rbx
	subq	$8, %rsp
	movq	8(%rdi), %rsi
	xorl	%edi, %edi
	call	create_var
	movl	$24, %edi
	movq	%rax, %rbp
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, %xmm0
	movl	$32, %edi
	movhps	16(%rbp), %xmm0
	movq	%rax, %rbx
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, 8(%rax)
	movq	%rax, %rsi
	movq	%rbx, (%rax)
	movl	$23, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%r12), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	addq	$8, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	load_rvalue.part.0, .-load_rvalue.part.0
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"[Warning] Unsupported variable access with NULL base\n"
	.align 8
.LC5:
	.string	"[Warning] Failed to generate variable access for base\n"
	.align 8
.LC6:
	.string	"[Warning] Attempting to access attribute of non-object type: %s\n"
	.align 8
.LC7:
	.string	"[Warning] Attribute '%s' not found in type '%s'\n"
	.align 8
.LC8:
	.string	"[Warning] Attempting to access function '%s' as attribute of type '%s'\n"
	.align 8
.LC9:
	.string	"[Warning] Symbol '%s' in type '%s' is not an attribute\n"
	.section	.rodata.str1.1
.LC10:
	.string	"arr"
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"[Warning] Attempting to index non-array type: %s\n"
	.align 8
.LC12:
	.string	"[Warning] Failed to generate variable access for index\n"
	.align 8
.LC13:
	.string	"[Warning] Attempting to call non-function, kind: %u, type name: %s\n"
	.align 8
.LC14:
	.string	"[Warning] Unsupported variable access type for tac_variable_access: %u\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB15:
	.text
.LHOTB15:
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
	jne	.L75
	movq	8(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L75
	movl	32(%rdi), %eax
	leal	-1(%rax), %edx
	cmpl	$1, %edx
	jbe	.L127
	testl	%eax, %eax
	je	.L128
	movq	(%rdi), %rsi
	movq	%rbx, %rcx
	movl	$118, %edx
.L126:
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
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L75:
	movq	0(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L129
	movq	%rbx, %rsi
	call	tac_variable_access
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L83
	cmpb	$0, 20(%rax)
	jne	.L130
.L82:
	movl	16(%rbp), %ecx
	cmpl	$2, %ecx
	je	.L131
	cmpl	$3, %ecx
	je	.L132
	cmpl	$1, %ecx
	jne	.L96
	movl	16(%r13), %ecx
	testl	%ecx, %ecx
	je	.L133
	leal	-7(%rcx), %eax
	cmpl	$1, %eax
	jbe	.L99
	movq	8(%r13), %rax
.L98:
	movq	8(%rax), %r8
	movq	stderr(%rip), %rdi
	leaq	.LC13(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
.L80:
	xorl	%r12d, %r12d
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L131:
	movq	8(%r13), %rax
	movl	32(%rax), %edx
	leal	-1(%rdx), %ecx
	cmpl	$1, %ecx
	jbe	.L134
	movq	24(%rax), %rdi
	testl	%edx, %edx
	jne	.L86
	movq	16(%rdi), %rdi
.L86:
	movq	8(%rbp), %rax
	movq	8(%rax), %rsi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L135
	movl	32(%rax), %eax
	cmpl	$1, %eax
	je	.L136
	cmpl	$2, %eax
	je	.L137
	cmpl	$5, %eax
	jne	.L138
	movq	(%r12), %rsi
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
	movl	$0, 16(%rax)
	movq	%rax, %rbp
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$15, 24(%rax)
	movq	%rax, %rsi
.L124:
	movq	%r12, (%rsi)
	movq	%r13, 8(%rsi)
	movq	%rbp, 16(%rsi)
	movb	$1, 20(%r12)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L74:
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
.L128:
	movq	%rsi, %rcx
	movl	$118, %edx
	movq	%rdi, %rsi
	jmp	.L126
	.p2align 4,,10
	.p2align 3
.L130:
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L82
	.p2align 4,,10
	.p2align 3
.L83:
	movq	stderr(%rip), %rcx
	movl	$54, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L133:
	movq	8(%r13), %rax
	movl	32(%rax), %edx
	testl	%edx, %edx
	jne	.L98
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
	movl	$8, 16(%rax)
	movq	%rax, %r13
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
.L99:
	call	*create_list@GOTPCREL(%rip)
	cmpl	$8, 16(%r13)
	movq	%rax, (%rsp)
	je	.L100
.L102:
	xorl	%r14d, %r14d
.L101:
	movq	8(%rbp), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	jmp	.L105
	.p2align 4,,10
	.p2align 3
.L107:
	movq	8(%rbp), %rdi
	addq	$1, %r14
	call	get_type_size
	movl	$24, %edi
	movq	%rax, %r12
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movl	$1, 16(%rax)
	movq	%rax, %r15
	movq	%r12, (%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%r15)
	movq	%rax, 8(%r15)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$17, 24(%rax)
	movq	%rax, %rsi
	movq	%r15, (%rax)
	movq	%rbp, 8(%rax)
	movq	$0, 16(%rax)
	call	*list_append@GOTPCREL(%rip)
.L105:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L109
	movq	%rbx, %rsi
	call	tac_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L106
	cmpb	$0, 20(%rax)
	je	.L107
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %rbp
	jmp	.L107
	.p2align 4,,10
	.p2align 3
.L132:
	movq	8(%r13), %rax
	leaq	.LC10(%rip), %rsi
	movq	8(%rax), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L139
	movq	8(%rbp), %rdi
	movq	%rbx, %rsi
	call	tac_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L95
	cmpb	$0, 20(%rax)
	jne	.L140
.L94:
	movq	name_int(%rip), %rsi
	movq	%rbx, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	call	create_var
	movl	$24, %edi
	movq	%rax, %r14
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, %xmm0
	movl	$32, %edi
	movhps	16(%r14), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r12
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$16, 24(%rax)
	movq	%rax, %rsi
	jmp	.L124
	.p2align 4,,10
	.p2align 3
.L110:
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L109:
	movq	(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L110
	movq	8(%r13), %rsi
	movq	%rbx, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	call	create_var
	movl	$24, %edi
	movq	%rax, %rbp
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, %xmm0
	movl	$24, %edi
	movhps	16(%rbp), %xmm0
	movq	%rax, %r12
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%r14, (%rax)
	movq	%rax, %rbp
	movl	$1, 16(%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%rbp)
	movq	%rax, 8(%rbp)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, 8(%rax)
	movq	%rax, %rsi
	movq	%r12, (%rax)
	movq	%rbp, 16(%rax)
	movl	$22, 24(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L138:
	movq	8(%r13), %rax
	movq	8(%rbp), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movq	8(%rdx), %rcx
	movq	8(%rax), %r8
	leaq	.LC9(%rip), %rdx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L129:
	movq	stderr(%rip), %rcx
	movl	$53, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L127:
	movq	(%rdi), %rsi
	movq	%rbx, %rcx
	movl	$102, %edx
.L125:
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
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L96:
	movq	stderr(%rip), %rdi
	leaq	.LC14(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L139:
	movq	0(%r13), %rax
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	leaq	.LC11(%rip), %rdx
	movq	(%rax), %rax
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L136:
	movq	8(%r13), %rax
	movq	8(%rbp), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movq	8(%rdx), %rcx
	movq	8(%rax), %r8
	leaq	.LC8(%rip), %rdx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	(%r12), %rsi
	movq	%rbx, %rcx
	movq	%r12, %rdi
	movl	$102, %edx
	jmp	.L125
	.p2align 4,,10
	.p2align 3
.L140:
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L94
.L95:
	movq	stderr(%rip), %rcx
	movl	$55, %edx
	movl	$1, %esi
	leaq	.LC12(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L137:
	movq	(%r12), %rsi
	movq	%rbx, %rcx
	movq	%r12, %rdi
	movl	$102, %edx
	call	create_var
	movl	$24, %edi
	movq	%rax, %rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, %xmm0
	movhps	16(%rbx), %xmm0
	movl	$8, 16(%rax)
	movq	%rax, %r12
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L100:
	movq	8(%r13), %rax
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi
	movq	8(%rax), %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	0(%r13), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L102
	movq	0(%rbp), %rax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$8, %edi
	movq	(%rax), %r8
	call	*create_primary@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	movq	%rax, %rdx
	call	*create_expression@GOTPCREL(%rip)
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	tac_expression
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L103
	cmpb	$0, 20(%rax)
	jne	.L141
.L104:
	movq	8(%r15), %rdi
	call	get_type_size
	movl	$24, %edi
	movq	%rax, 8(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	8(%rsp), %rdx
	movl	$32, %edi
	movq	%rax, %r14
	movl	$1, 16(%rax)
	movq	%rdx, (%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%r14)
	movq	%rax, 8(%r14)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movq	%r14, (%rax)
	movq	%rax, %rsi
	movl	$1, %r14d
	movl	$17, 24(%rax)
	movq	%r15, 8(%rax)
	movq	$0, 16(%rax)
	call	*list_append@GOTPCREL(%rip)
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L134:
	movq	8(%rax), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC6(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L80
.L135:
	movq	8(%r13), %rax
	movq	8(%rbp), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movq	8(%rdx), %rcx
	movq	8(%rax), %r8
	leaq	.LC7(%rip), %rdx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L80
.L141:
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %r15
	jmp	.L104
	.section	.text.unlikely
	.type	tac_variable_access.cold, @function
tac_variable_access.cold:
.L106:
	movq	8, %rax
	ud2
.L103:
	movq	8, %rax
	ud2
	.text
	.size	tac_variable_access, .-tac_variable_access
	.section	.text.unlikely
	.size	tac_variable_access.cold, .-tac_variable_access.cold
.LCOLDE15:
	.text
.LHOTE15:
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"[Warning] Unsupported type for negation: %s\n"
	.align 8
.LC18:
	.string	"[Warning] Unsupported primary type for tac_primary: %d\n"
	.section	.text.unlikely
.LCOLDB19:
	.text
.LHOTB19:
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
	ja	.L143
	leaq	.L145(%rip), %rdx
	movq	%rsi, %rbp
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L145:
	.long	.L153-.L145
	.long	.L152-.L145
	.long	.L151-.L145
	.long	.L150-.L145
	.long	.L149-.L145
	.long	.L148-.L145
	.long	.L147-.L145
	.long	.L146-.L145
	.long	.L144-.L145
	.text
	.p2align 4,,10
	.p2align 3
.L146:
	movq	(%rdi), %rdi
	call	tac_primary
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L156
	cmpb	$0, 20(%rax)
	jne	.L166
.L157:
	movq	8(%r12), %rsi
	xorl	%edi, %edi
	movq	%rbp, %rcx
	movl	$116, %edx
	call	create_var
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
	je	.L167
	cmpq	name_float(%rip), %rax
	je	.L168
	movq	8(%rax), %rcx
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	leaq	.LC17(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
.L170:
	addq	$24, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L144:
	movq	(%rdi), %rdi
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	tac_variable_access
	.p2align 4,,10
	.p2align 3
.L153:
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
.L142:
	addq	$24, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L152:
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
.L151:
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
.L150:
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
.L149:
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
.L148:
	movq	(%rdi), %rdi
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	tac_expression
	.p2align 4,,10
	.p2align 3
.L147:
	movq	(%rdi), %rdi
	call	tac_primary
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L155
	cmpb	$0, 20(%rax)
	jne	.L169
.L155:
	movq	name_bool(%rip), %rsi
	movq	%rbp, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
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
.L143:
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	leaq	.LC18(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L170
	.p2align 4,,10
	.p2align 3
.L168:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movl	$2, 16(%rax)
	movq	%rax, %r13
	movq	.LC16(%rip), %rax
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
.L159:
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L142
	.p2align 4,,10
	.p2align 3
.L166:
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %r12
	jmp	.L157
	.p2align 4,,10
	.p2align 3
.L169:
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %r13
	jmp	.L155
	.p2align 4,,10
	.p2align 3
.L167:
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
	jmp	.L159
	.section	.text.unlikely
	.type	tac_primary.cold, @function
tac_primary.cold:
.L156:
	movq	8, %rax
	ud2
	.text
	.size	tac_primary, .-tac_primary
	.section	.text.unlikely
	.size	tac_primary.cold, .-tac_primary.cold
.LCOLDE19:
	.text
.LHOTE19:
	.section	.rodata.str1.8
	.align 8
.LC20:
	.string	"[Warning] Left-hand side of assignment is not a variable\n"
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
	movq	%rsi, %rbp
	pushq	%rbx
	subq	$8, %rsp
	cmpl	$19, 24(%rdi)
	je	.L192
	movq	16(%rdi), %rdi
	call	tac_expression
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L173
	cmpb	$0, 20(%rax)
	jne	.L193
.L173:
	movl	24(%r12), %eax
	movq	(%r12), %rdi
	cmpl	$18, %eax
	ja	.L174
	leaq	CSWTCH.47(%rip), %rdx
	movq	%rbp, %rsi
	movl	(%rdx,%rax,4), %r13d
	call	tac_expression
	movq	%rax, %r14
	movl	24(%r12), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L175
	cmpl	$14, %r13d
	jne	.L181
	movl	16(%r14), %eax
	testl	%eax, %eax
	jne	.L194
.L178:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$14, 24(%rax)
	movq	%rax, %rsi
	movq	%r14, (%rax)
	movq	%rbx, 8(%rax)
	movq	$0, 16(%rax)
	cmpb	$0, 20(%r14)
	jne	.L195
.L179:
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	addq	$8, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L174:
	movq	%rbp, %rsi
	movl	$25, %r13d
	call	tac_expression
	movq	%rax, %r14
	movl	24(%r12), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L175
.L181:
	movq	8(%r14), %rsi
	xorl	%edi, %edi
	movq	%rbp, %rcx
	movl	$116, %edx
	call	create_var
	movl	$24, %edi
	movq	%rax, %r15
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r15, %xmm0
	movhps	16(%r15), %xmm0
	movb	$0, 20(%rax)
	movq	%rax, %r12
	movq	%r14, %r15
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	cmpb	$0, 20(%r14)
	jne	.L196
.L177:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r15, 8(%rax)
	movq	%rax, %rsi
	movq	%rbx, 16(%rax)
	movq	%r12, %rbx
	movl	%r13d, 24(%rax)
	movq	%r12, (%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	16(%r14), %eax
	testl	%eax, %eax
	je	.L178
.L194:
	movq	stderr(%rip), %rcx
	movl	$57, %edx
	movl	$1, %esi
	leaq	.LC20(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L178
	.p2align 4,,10
	.p2align 3
.L175:
	movq	8(%r14), %rsi
	xorl	%edi, %edi
	movq	%rbp, %rcx
	movl	$116, %edx
	call	create_var
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
	jne	.L197
.L180:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, 16(%rax)
	movq	%rax, %rsi
	movq	%r12, %rbx
	movl	%r13d, 24(%rax)
	movq	%r12, (%rax)
	movq	%r14, 8(%rax)
	jmp	.L179
	.p2align 4,,10
	.p2align 3
.L192:
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
.L195:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$24, 24(%rax)
	movq	%rax, %rsi
	movq	%r14, (%rax)
	movq	%rbx, 8(%rax)
	movq	$0, 16(%rax)
	jmp	.L179
	.p2align 4,,10
	.p2align 3
.L193:
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %rbx
	jmp	.L173
	.p2align 4,,10
	.p2align 3
.L197:
	movq	%r14, %rdi
	movq	%rbp, %rsi
	call	load_rvalue.part.0
	movq	%rax, %r14
	jmp	.L180
	.p2align 4,,10
	.p2align 3
.L196:
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	load_rvalue.part.0
	movq	%rax, %r15
	jmp	.L177
	.size	tac_expression, .-tac_expression
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"Error: create_attribute received NULL table\n"
	.align 8
.LC22:
	.string	"Error: create_attribute received NULL table or attributes list\n"
	.text
	.p2align 4
	.globl	tac_variable
	.type	tac_variable, @function
tac_variable:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	movq	%rsi, %rbx
	testb	%dl, %dl
	je	.L199
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
	movq	$0, 16(%rbp)
	movq	%rax, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, 0(%rbp)
	testq	%r12, %r12
	jne	.L214
	movq	stderr(%rip), %rcx
	movl	$44, %edx
	movl	$1, %esi
	leaq	.LC21(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L201:
	popq	%rbx
	movl	$63, %edx
	popq	%rbp
	movl	$1, %esi
	popq	%r12
	movq	stderr(%rip), %rcx
	leaq	.LC22(%rip), %rdi
	popq	%r13
	popq	%r14
	jmp	*fwrite@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L214:
	movq	16(%r12), %rax
	movq	%r13, %rdi
	movq	%rax, 16(%rbp)
	call	get_type_size
	movq	(%r12), %rdi
	addq	%rax, 16(%r12)
	movq	%rbp, %rsi
	testq	%rdi, %rdi
	je	.L201
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L199:
	movq	(%rdi), %rsi
	movq	8(%rdi), %rdi
	movq	%rbx, %rcx
	movl	$118, %edx
	call	create_var
	movq	16(%rbp), %rdi
	movq	%rax, %r12
	testq	%rdi, %rdi
	je	.L203
	movq	%rbx, %rsi
	call	tac_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L204
	cmpb	$0, 20(%rax)
	jne	.L215
.L204:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r12, %xmm0
	movl	$32, %edi
	movhps	16(%r12), %xmm0
	movq	%rax, %r13
	movb	$0, 20(%rax)
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, 8(%rax)
	movq	%rax, %rsi
	movl	$14, 24(%rax)
	movq	%r13, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	popq	%rbx
	popq	%rbp
	movq	8(%rax), %rdi
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L203:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$1, 16(%rax)
	movq	%rax, %rbp
	movq	$0, (%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%rbp)
	movq	%rax, 8(%rbp)
	jmp	.L204
	.p2align 4,,10
	.p2align 3
.L215:
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %rbp
	jmp	.L204
	.size	tac_variable, .-tac_variable
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
	je	.L219
	movq	24(%r15), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L248
.L219:
	movq	%rbx, %rcx
	movl	$98, %edx
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	create_var
	movq	%rax, 40(%rsp)
.L218:
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
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L220
	cmpb	$0, 20(%rax)
	jne	.L249
.L220:
	movq	%rcx, 16(%rsp)
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
	jmp	.L221
	.p2align 4,,10
	.p2align 3
.L222:
	movq	%rbx, %rsi
	call	tac_statement
.L221:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L222
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
	je	.L250
.L223:
	movq	24(%r15), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L251
.L231:
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
.L248:
	movq	%rbp, 40(%rsp)
	jmp	.L218
	.p2align 4,,10
	.p2align 3
.L251:
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
	jmp	.L232
	.p2align 4,,10
	.p2align 3
.L233:
	movq	%rbx, %rsi
	call	tac_statement
.L232:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L233
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
	jmp	.L231
	.p2align 4,,10
	.p2align 3
.L250:
	movq	16(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L224:
	movq	16(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L223
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
	movq	%rbx, %rcx
	xorl	%esi, %esi
	movl	$98, %edx
	xorl	%edi, %edi
	call	create_var
	movq	%rbx, %rcx
	movl	$98, %edx
	xorl	%esi, %esi
	xorl	%edi, %edi
	movq	%rax, 8(%rsp)
	call	create_var
	movq	0(%r13), %rdi
	movq	%rbx, %rsi
	movq	%rax, %rbp
	call	tac_expression
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L225
	cmpb	$0, 20(%rax)
	jne	.L252
.L225:
	movq	16(%rsp), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L253
.L227:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$24, %edi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	movb	$0, 20(%rax)
	movq	%rax, 32(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rcx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	8(%rsp), %rax
	movb	$0, 20(%rcx)
	movq	%rax, (%rcx)
	movq	%rcx, 24(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	24(%rsp), %rcx
	movq	32(%rsp), %rdx
	movq	%rax, %rsi
	movq	%r12, (%rax)
	movq	%rcx, 8(%rax)
	movq	%rdx, 16(%rax)
	movl	$19, 24(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	8(%rsp), %rax
	movq	%rax, (%r12)
	call	*create_list@GOTPCREL(%rip)
	movq	%r12, %rsi
	movq	%rax, 8(%r12)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r12, 16(%rbx)
	movq	8(%r13), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L228
	.p2align 4,,10
	.p2align 3
.L229:
	movq	%rbx, %rsi
	call	tac_statement
.L228:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L229
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
	jmp	.L224
	.p2align 4,,10
	.p2align 3
.L253:
	movq	24(%r15), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	cmovne	40(%rsp), %rbp
	jmp	.L227
	.p2align 4,,10
	.p2align 3
.L252:
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %r12
	jmp	.L225
.L249:
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %rcx
	jmp	.L220
	.size	tac_if, .-tac_if
	.section	.rodata.str1.8
	.align 8
.LC23:
	.string	"[Warning] 'break' statement used outside of loop\n"
	.align 8
.LC24:
	.string	"[Warning] 'continue' statement used outside of loop\n"
	.align 8
.LC25:
	.string	"[Warning] Unsupported statement type for tac_statement: %d\n"
	.text
	.p2align 4
	.globl	tac_statement
	.type	tac_statement, @function
tac_statement:
	movl	8(%rdi), %ecx
	cmpl	$7, %ecx
	ja	.L255
	leaq	.L257(%rip), %rdx
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
.L257:
	.long	.L264-.L257
	.long	.L263-.L257
	.long	.L262-.L257
	.long	.L261-.L257
	.long	.L260-.L257
	.long	.L259-.L257
	.long	.L258-.L257
	.long	.L256-.L257
	.text
	.p2align 4,,10
	.p2align 3
.L258:
	movq	32(%rsi), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L267
	movq	32(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	je	.L267
.L288:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$20, 24(%rax)
	movq	%rax, %rsi
	movq	%rbx, (%rax)
	jmp	.L287
	.p2align 4,,10
	.p2align 3
.L256:
	movq	40(%rsi), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L268
	movq	40(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L288
.L268:
	popq	%rbx
	movl	$52, %edx
	popq	%rbp
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	leaq	.LC24(%rip), %rdi
	popq	%r12
	jmp	*fwrite@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L262:
	movq	(%rdi), %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	tac_if
	.p2align 4,,10
	.p2align 3
.L264:
	movq	(%rdi), %rdi
	call	tac_expression
	testq	%rax, %rax
	je	.L254
	cmpb	$0, 20(%rax)
	jne	.L289
.L254:
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L263:
	movq	(%rdi), %rdi
	popq	%rbx
	xorl	%edx, %edx
	popq	%rbp
	popq	%r12
	jmp	tac_variable
	.p2align 4,,10
	.p2align 3
.L260:
	movq	(%rdi), %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	tac_for
	.p2align 4,,10
	.p2align 3
.L259:
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
	je	.L266
	movq	%rbp, %rsi
	call	tac_expression
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L266
	cmpb	$0, 20(%rax)
	jne	.L290
.L266:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$21, 24(%rax)
	movq	%rax, %rsi
	movq	%r12, (%rax)
.L287:
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
.L261:
	movq	(%rdi), %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	tac_while
	.p2align 4,,10
	.p2align 3
.L267:
	popq	%rbx
	movl	$49, %edx
	popq	%rbp
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	leaq	.LC23(%rip), %rdi
	popq	%r12
	jmp	*fwrite@GOTPCREL(%rip)
.L255:
	movq	stderr(%rip), %rdi
	leaq	.LC25(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L290:
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %r12
	jmp	.L266
	.p2align 4,,10
	.p2align 3
.L289:
	popq	%rbx
	movq	%rbp, %rsi
	movq	%rax, %rdi
	popq	%rbp
	popq	%r12
	jmp	load_rvalue.part.0
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
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$24, %rsp
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L292
	xorl	%edx, %edx
	call	tac_variable
.L292:
	xorl	%esi, %esi
	xorl	%edi, %edi
	movq	%rbx, %rcx
	movl	$98, %edx
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
	je	.L293
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
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L294
	cmpb	$0, 20(%rax)
	jne	.L315
.L294:
	movq	%rcx, 8(%rsp)
	movl	$24, %edi
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
.L295:
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
	je	.L296
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	40(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	call	*list_append@GOTPCREL(%rip)
.L297:
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
	jmp	.L299
	.p2align 4,,10
	.p2align 3
.L300:
	movq	%rbx, %rsi
	call	tac_statement
.L299:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L300
	movq	40(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	32(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	cmpq	$0, 16(%r12)
	je	.L302
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
	testq	%rax, %rax
	je	.L302
	cmpb	$0, 20(%rax)
	jne	.L316
.L302:
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
	je	.L317
.L304:
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
.L296:
	cmpq	$0, 8(%r12)
	je	.L298
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	40(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	call	*list_append@GOTPCREL(%rip)
	jmp	.L297
	.p2align 4,,10
	.p2align 3
.L293:
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
	jmp	.L295
	.p2align 4,,10
	.p2align 3
.L316:
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	jmp	.L302
	.p2align 4,,10
	.p2align 3
.L317:
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
	jmp	.L304
	.p2align 4,,10
	.p2align 3
.L298:
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	40(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r15, (%rax)
	call	*list_append@GOTPCREL(%rip)
	jmp	.L297
	.p2align 4,,10
	.p2align 3
.L315:
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %rcx
	jmp	.L294
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
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L319
	cmpb	$0, 20(%rax)
	jne	.L326
.L319:
	movq	%rcx, 8(%rsp)
	movl	$24, %edi
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
	jmp	.L320
	.p2align 4,,10
	.p2align 3
.L321:
	movq	%rbx, %rsi
	call	tac_statement
.L320:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L321
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
	.p2align 4,,10
	.p2align 3
.L326:
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %rcx
	jmp	.L319
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
	jmp	.L328
	.p2align 4,,10
	.p2align 3
.L329:
	movq	(%rax), %rsi
	movq	8(%rax), %rdi
	movq	%rbx, %rcx
	movl	$112, %edx
	call	create_var
	movq	16(%rbp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
.L328:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L329
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
	jmp	.L330
	.p2align 4,,10
	.p2align 3
.L331:
	movq	%rbx, %rsi
	call	tac_statement
.L330:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L331
	movq	$0, 8(%rbx)
	addq	$16, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	tac_function, .-tac_function
	.section	.rodata.str1.8
	.align 8
.LC26:
	.string	"[Warning] Constructor '%s' does not start with 'self' initialization\n"
	.text
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
	jmp	.L334
	.p2align 4,,10
	.p2align 3
.L335:
	movq	(%rax), %rsi
	movq	8(%rax), %rdi
	movq	%rbx, %rcx
	movl	$112, %edx
	call	create_var
	movq	16(%rbp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
.L334:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L335
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
	movq	24(%r13), %rdi
	movq	%r12, 16(%rbx)
	call	*list_copy@GOTPCREL(%rip)
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi
	movq	%rax, %rbp
	movq	24(%rbx), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	0(%r13), %rax
	movq	8(%rax), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L339
	jmp	.L342
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
.L342:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movl	8(%rax), %ecx
	testl	%ecx, %ecx
	jne	.L337
	movq	(%rax), %rax
	cmpl	$19, 24(%rax)
	jne	.L337
	movq	8(%rax), %rax
	cmpl	$8, 8(%rax)
	jne	.L337
	movq	(%rax), %rax
	movl	16(%rax), %edx
	testl	%edx, %edx
	je	.L338
.L337:
	movq	0(%r13), %rax
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	leaq	.LC26(%rip), %rdx
	movq	8(%rax), %rcx
	addq	$24, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*__fprintf_chk@GOTPCREL(%rip)
.L338:
	movq	24(%rbx), %r15
	movq	8(%rax), %r14
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$118, %edx
	movq	%rax, %r13
	movl	$1, 16(%rax)
	movq	24(%r15), %rax
	movq	%r14, %rdi
	movb	$0, 20(%r13)
	movq	(%r14), %rsi
	movq	%rax, 0(%r13)
	movq	name_int(%rip), %rax
	movq	%rax, 8(%r13)
	call	create_var
	movl	$24, %edi
	movq	%rax, %r15
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r15, %xmm0
	movl	$32, %edi
	movhps	16(%r15), %xmm0
	movq	%rax, %r14
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	8(%r12), %rdi
	movl	$18, 24(%rax)
	movq	%rax, %rsi
	movq	%r14, (%rax)
	movq	%r13, 8(%rax)
	movq	$0, 16(%rax)
	call	*list_append@GOTPCREL(%rip)
	jmp	.L339
	.size	tac_method, .-tac_method
	.section	.rodata.str1.8
	.align 8
.LC27:
	.string	"[Warning] Unsupported class member type for tac_class: %d\n"
	.text
	.p2align 4
	.globl	tac_class
	.type	tac_class, @function
tac_class:
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, 24(%rsi)
	movq	8(%rdi), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	(%r12), %r13
	movl	$24, %edi
	movq	%rax, %rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r12
	call	*create_list@GOTPCREL(%rip)
	movq	%r13, %xmm1
	movq	%r12, %rsi
	movq	$0, 16(%r12)
	movq	%rax, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, (%r12)
	movq	0(%rbp), %rax
	leaq	.LC27(%rip), %r12
	movq	(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L344:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L352
.L349:
	movl	8(%rax), %ecx
	testl	%ecx, %ecx
	je	.L345
	cmpl	$1, %ecx
	je	.L346
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	movq	%r12, %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L349
.L352:
	movq	$0, 24(%rbp)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L346:
	movq	(%rax), %rdi
	movl	$1, %edx
	movq	%rbp, %rsi
	call	tac_variable
	jmp	.L344
	.p2align 4,,10
	.p2align 3
.L345:
	movq	(%rax), %rdi
	movq	%rbp, %rsi
	call	tac_method
	jmp	.L344
	.size	tac_class, .-tac_class
	.section	.rodata.str1.8
	.align 8
.LC28:
	.string	"[Warning] Unsupported symbol kind for import: %d\n"
	.text
	.p2align 4
	.globl	tac_import
	.type	tac_import, @function
tac_import:
	pushq	%rbx
	movq	(%rdi), %rdi
	movq	%rsi, %rbx
	movl	32(%rdi), %ecx
	cmpl	$3, %ecx
	je	.L359
	leal	-1(%rcx), %eax
	cmpl	$1, %eax
	jbe	.L360
	testl	%ecx, %ecx
	jne	.L356
	movq	24(%rdi), %rdi
	movq	%rdx, %rsi
	popq	%rbx
	jmp	tac_class
	.p2align 4,,10
	.p2align 3
.L356:
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbx
	leaq	.LC28(%rip), %rdx
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L360:
	movq	(%rdi), %rsi
	movq	%rdx, %rcx
	movl	$102, %edx
.L358:
	call	create_var
	movq	16(%rbx), %rdi
	popq	%rbx
	movq	%rax, %rsi
	jmp	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L359:
	movq	%rdx, %rcx
	movq	(%rdi), %rsi
	movl	$118, %edx
	jmp	.L358
	.size	tac_import, .-tac_import
	.section	.rodata.str1.1
.LC29:
	.string	"main"
	.text
	.p2align 4
	.globl	tac_code
	.type	tac_code, @function
tac_code:
	pushq	%r14
	leaq	.LC29(%rip), %r14
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
.L362:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L370
	movl	8(%rbx), %eax
	cmpl	$1, %eax
	je	.L371
	cmpl	$2, %eax
	je	.L372
	testl	%eax, %eax
	jne	.L362
	movq	(%rbx), %rdi
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	tac_import
	jmp	.L362
	.p2align 4,,10
	.p2align 3
.L371:
	movq	(%rbx), %rdi
	movq	%rbp, %rsi
	call	tac_function
	movq	(%rbx), %rax
	movq	%r14, %rsi
	movq	(%rax), %rbx
	movq	8(%rbx), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L362
	movq	%rbx, 8(%r13)
	jmp	.L362
	.p2align 4,,10
	.p2align 3
.L372:
	movq	(%rbx), %rdi
	movq	%rbp, %rsi
	call	tac_class
	jmp	.L362
	.p2align 4,,10
	.p2align 3
.L370:
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
	.type	CSWTCH.47, @object
	.size	CSWTCH.47, 76
CSWTCH.47:
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
.LC16:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
