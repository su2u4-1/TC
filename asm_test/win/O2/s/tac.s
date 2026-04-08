	.file	"tac.c"
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "[Warning] Unsupported type for size lookup: %s\12\0"
	.text
	.p2align 4
	.def	get_type_size;	.scl	3;	.type	32;	.endef
get_type_size:
	xorl	%eax, %eax
	testq	%rcx, %rcx
	je	.L10
	movq	.refptr.name_int(%rip), %rax
	cmpq	%rcx, (%rax)
	je	.L11
	movq	.refptr.name_float(%rip), %rax
	cmpq	%rcx, (%rax)
	je	.L11
	movq	.refptr.name_string(%rip), %rax
	cmpq	%rcx, (%rax)
	je	.L11
	movq	.refptr.name_bool(%rip), %rdx
	movl	$1, %eax
	cmpq	%rcx, (%rdx)
	je	.L10
	movq	.refptr.name_void(%rip), %rdx
	cmpq	%rcx, (%rdx)
	je	.L10
	movl	32(%rcx), %eax
	testl	%eax, %eax
	jne	.L4
	movq	24(%rcx), %rax
	movq	24(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	ret
	.p2align 4,,10
	.p2align 3
.L11:
	movl	$8, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	pushq	%rbx
	subq	$32, %rsp
	movq	8(%rcx), %rbx
	call	__getreent
	leaq	.LC0(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	call	fprintf
	addq	$32, %rsp
	movl	$8, %eax
	popq	%rbx
	ret
	.section .rdata,"dr"
.LC1:
	.ascii "\0"
.LC2:
	.ascii "$%d-error\0"
.LC3:
	.ascii "$%c%zu\0"
	.text
	.p2align 4
	.def	create_var;	.scl	3;	.type	32;	.endef
create_var:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movl	%r8d, %r12d
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	movq	%r9, %rsi
	pushq	%rbx
	subq	$40, %rsp
	testq	%rcx, %rcx
	je	.L16
	movl	32(%rdx), %ecx
	xorl	%r14d, %r14d
	testl	%ecx, %ecx
	jne	.L17
	movq	24(%rdx), %rax
	movq	24(%r9), %r14
	movq	%rax, 24(%r9)
.L17:
	movq	8(%rsi), %rax
	testq	%rax, %rax
	je	.L23
	movq	24(%rax), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L21
.L27:
	movq	8(%rsi), %rax
	testq	%rax, %rax
	je	.L23
	movq	16(%rax), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L69
.L23:
	cmpq	$0, 24(%rsi)
	movq	(%rsi), %rax
	je	.L20
	movq	(%rax), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L64
.L67:
	movq	(%rsi), %rax
.L20:
	movq	16(%rax), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L65
	movq	(%rsi), %rax
	movq	16(%rax), %rcx
	call	list_copy
	movq	%rax, %r13
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L40:
	cmpq	(%rbx), %rdi
	je	.L25
.L39:
	movq	%r13, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L40
.L65:
	movl	32(%rbp), %eax
	testl	%eax, %eax
	jne	.L16
	movq	%r14, 24(%rsi)
.L16:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rdi, (%rax)
	movq	%rax, %rbx
	leal	-97(%r12), %eax
	cmpl	$21, %eax
	ja	.L43
	leaq	.L45(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L45:
	.long	.L50-.L45
	.long	.L49-.L45
	.long	.L43-.L45
	.long	.L43-.L45
	.long	.L43-.L45
	.long	.L48-.L45
	.long	.L43-.L45
	.long	.L43-.L45
	.long	.L43-.L45
	.long	.L43-.L45
	.long	.L43-.L45
	.long	.L43-.L45
	.long	.L43-.L45
	.long	.L43-.L45
	.long	.L43-.L45
	.long	.L47-.L45
	.long	.L43-.L45
	.long	.L43-.L45
	.long	.L43-.L45
	.long	.L46-.L45
	.long	.L43-.L45
	.long	.L44-.L45
	.text
	.p2align 4,,10
	.p2align 3
.L21:
	movq	8(%rsi), %rax
	movq	24(%rax), %rcx
	call	list_copy
	movq	%rax, %r13
	.p2align 4,,10
	.p2align 3
.L24:
	movq	%r13, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L27
	cmpq	(%rbx), %rdi
	jne	.L24
.L25:
	movl	32(%rbp), %edx
	testl	%edx, %edx
	jne	.L14
	movq	%r14, 24(%rsi)
.L14:
	addq	$40, %rsp
	movq	%rbx, %rax
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
.L43:
	movl	$32, %edx
	leaq	.LC1(%rip), %rcx
	call	create_string
	movl	%r12d, %r8d
	leaq	.LC2(%rip), %rdx
	movq	%rax, 8(%rbx)
	movq	%rax, %rcx
	call	sprintf
	movq	%rbp, 16(%rbx)
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L64:
	movq	(%rsi), %rax
	movq	(%rax), %rcx
	call	list_copy
	movq	%rax, %r13
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L37:
	movq	24(%rsi), %rax
	movq	(%rax), %rax
	cmpq	%rax, 8(%rbx)
	je	.L70
.L33:
	movq	%r13, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L37
	jmp	.L67
	.p2align 4,,10
	.p2align 3
.L69:
	movq	8(%rsi), %rax
	movq	16(%rax), %rcx
	call	list_copy
	movq	%rax, %r13
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L29:
	cmpq	(%rbx), %rdi
	je	.L25
.L28:
	movq	%r13, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L29
	jmp	.L23
.L44:
	movq	64(%rsi), %rdi
	leaq	1(%rdi), %rax
	movq	%rax, 64(%rsi)
	.p2align 4,,10
	.p2align 3
.L52:
	leaq	.LC1(%rip), %rcx
	movl	$32, %edx
	call	create_string
	movq	%rax, 8(%rbx)
	movq	%rax, %rcx
	cmpq	$-1, %rdi
	je	.L71
	movq	%rdi, %r9
	movl	%r12d, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L54:
	andl	$-3, %r12d
	movq	%rbp, 16(%rbx)
	cmpl	$116, %r12d
	jne	.L14
	movq	8(%rsi), %rax
	movq	%rbx, %rdx
	movq	24(%rax), %rcx
	call	list_append
	jmp	.L14
.L46:
	movq	72(%rsi), %rdi
	leaq	1(%rdi), %rax
	movq	%rax, 72(%rsi)
	jmp	.L52
.L47:
	movq	56(%rsi), %rdi
	leaq	1(%rdi), %rax
	movq	%rax, 56(%rsi)
	jmp	.L52
.L48:
	movq	88(%rsi), %rdi
	leaq	1(%rdi), %rax
	movq	%rax, 88(%rsi)
	jmp	.L52
.L49:
	movq	80(%rsi), %rdi
	leaq	1(%rdi), %rax
	movq	%rax, 80(%rsi)
	jmp	.L52
.L50:
	movq	48(%rsi), %rdi
	leaq	1(%rdi), %rax
	movq	%rax, 48(%rsi)
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L70:
	movq	(%rbx), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L33
	movq	(%rbx), %rcx
	call	list_copy
	movq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L35:
	movq	%r15, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L33
	movq	(%rax), %rbx
	cmpq	(%rbx), %rdi
	jne	.L35
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L71:
	movl	%r12d, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L54
	.p2align 4
	.def	load_rvalue.part.0;	.scl	3;	.type	32;	.endef
load_rvalue.part.0:
	pushq	%rbp
	movl	$116, %r8d
	movq	%rsp, %rbp
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	movq	%rdi, %r9
	pushq	%rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	movq	8(%rcx), %rdx
	xorl	%ecx, %ecx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rsi
	call	alloc_memory
	movq	%rsi, %xmm0
	movl	$32, %ecx
	movhps	16(%rsi), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movq	%r12, 8(%rax)
	movq	%rax, %rdx
	movq	%rbx, (%rax)
	movl	$23, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rdi), %rax
	movq	8(%rax), %rcx
	call	list_append
	leaq	-32(%rbp), %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "[Warning] Unsupported variable access with NULL base\12\0"
	.align 8
.LC5:
	.ascii "[Warning] Failed to generate variable access for base\12\0"
	.align 8
.LC6:
	.ascii "[Warning] Attempting to access attribute of non-object type: %s\12\0"
	.align 8
.LC7:
	.ascii "[Warning] Attribute '%s' not found in type '%s'\12\0"
	.align 8
.LC8:
	.ascii "[Warning] Attempting to access function '%s' as attribute of type '%s'\12\0"
	.align 8
.LC9:
	.ascii "[Warning] Symbol '%s' in type '%s' is not an attribute\12\0"
.LC10:
	.ascii "arr\0"
	.align 8
.LC11:
	.ascii "[Warning] Attempting to index non-array type: %s\12\0"
	.align 8
.LC12:
	.ascii "[Warning] Failed to generate variable access for index\12\0"
	.align 8
.LC13:
	.ascii "[Warning] Attempting to call non-function, kind: %u, type name: %s\12\0"
	.align 8
.LC14:
	.ascii "[Warning] Unsupported variable access type for tac_variable_access: %u\12\0"
	.section	.text.unlikely,"x"
.LCOLDB15:
	.text
.LHOTB15:
	.p2align 4
	.globl	tac_variable_access
	.def	tac_variable_access;	.scl	2;	.type	32;	.endef
tac_variable_access:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	andq	$-16, %rsp
	subq	$64, %rsp
	movl	16(%rcx), %ecx
	testl	%ecx, %ecx
	jne	.L75
	movq	8(%rsi), %rcx
	testq	%rcx, %rcx
	je	.L75
	movl	32(%rcx), %eax
	leal	-1(%rax), %edx
	cmpl	$1, %edx
	jbe	.L126
	testl	%eax, %eax
	je	.L127
	movq	(%rcx), %rdx
	movq	%rbx, %r9
	movl	$118, %r8d
.L125:
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movq	%rbx, %xmm0
	movhps	16(%rbx), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rdi
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L75:
	movq	(%rsi), %rcx
	testq	%rcx, %rcx
	je	.L128
	movq	%rbx, %rdx
	call	tac_variable_access
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L83
	cmpb	$0, 20(%rax)
	jne	.L129
.L82:
	movl	16(%rsi), %edi
	cmpl	$2, %edi
	je	.L130
	cmpl	$3, %edi
	je	.L131
	cmpl	$1, %edi
	jne	.L96
	movl	16(%r12), %edi
	testl	%edi, %edi
	je	.L132
	leal	-7(%rdi), %eax
	cmpl	$1, %eax
	jbe	.L99
	movq	8(%r12), %rax
.L98:
	movq	8(%rax), %rbx
	call	__getreent
	movl	%edi, %r8d
	leaq	.LC13(%rip), %rdx
	xorl	%edi, %edi
	movq	24(%rax), %rcx
	movq	%rbx, %r9
	call	fprintf
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L130:
	movq	8(%r12), %rax
	movl	32(%rax), %edx
	leal	-1(%rdx), %ecx
	cmpl	$1, %ecx
	jbe	.L133
	movq	24(%rax), %rcx
	testl	%edx, %edx
	jne	.L86
	movq	16(%rcx), %rcx
.L86:
	movq	8(%rsi), %rax
	movq	8(%rax), %rdx
	call	search_name_use_strcmp
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L134
	movl	32(%rax), %eax
	cmpl	$1, %eax
	je	.L135
	cmpl	$2, %eax
	je	.L136
	cmpl	$5, %eax
	jne	.L137
	movq	(%rdi), %rdx
	movq	%rbx, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %r13
	call	alloc_memory
	movq	%r13, %xmm0
	movq	%rbx, %r9
	movl	$97, %r8d
	movhps	16(%r13), %xmm0
	movb	$0, 20(%rax)
	movq	%rax, %rdi
	movups	%xmm0, (%rax)
	movq	8(%rsi), %rcx
	movl	$0, 16(%rax)
	movq	(%rcx), %rdx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %r13
	call	alloc_memory
	movq	%r13, %xmm0
	movl	$32, %ecx
	movhps	16(%r13), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rsi
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movq	%r12, 8(%rax)
	movq	%rax, %rdx
	movl	$15, 24(%rax)
	movq	%rdi, (%rax)
	movq	%rsi, 16(%rax)
	movb	$1, 20(%rdi)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L74:
	leaq	-56(%rbp), %rsp
	movq	%rdi, %rax
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
.L127:
	movq	%rbx, %r9
	movl	$118, %r8d
	movq	%rcx, %rdx
	jmp	.L125
	.p2align 4,,10
	.p2align 3
.L129:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L82
	.p2align 4,,10
	.p2align 3
.L83:
	call	__getreent
	movl	$54, %r8d
	movl	$1, %edx
	xorl	%edi, %edi
	movq	24(%rax), %r9
	leaq	.LC5(%rip), %rcx
	call	fwrite
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L132:
	movq	8(%r12), %rax
	movl	32(%rax), %edx
	testl	%edx, %edx
	jne	.L98
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	movq	8(%rax), %rcx
	movq	(%rdx), %rdx
	call	make_method_name
	movq	%rax, %rdx
	movq	8(%r12), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rcx
	call	search_name_use_strcmp
	movq	%rbx, %r9
	movl	$102, %r8d
	movq	(%rax), %rdx
	movq	%rax, %rcx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rdi
	call	alloc_memory
	movq	%rdi, %xmm0
	movhps	16(%rdi), %xmm0
	movl	$8, 16(%rax)
	movq	%rax, %r12
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
.L99:
	call	create_list
	cmpl	$8, 16(%r12)
	movq	%rax, 56(%rsp)
	je	.L100
.L102:
	xorl	%r13d, %r13d
.L101:
	movq	8(%rsi), %rcx
	call	list_copy
	movq	.refptr.name_int(%rip), %r15
	movq	%rax, 48(%rsp)
	jmp	.L105
	.p2align 4,,10
	.p2align 3
.L107:
	movq	8(%rsi), %rcx
	addq	$1, %r13
	call	get_type_size
	movl	$24, %ecx
	movq	%rax, %rdi
	call	alloc_memory
	movl	$32, %ecx
	movl	$1, 16(%rax)
	movq	%rax, %r14
	movq	%rdi, (%rax)
	movq	(%r15), %rax
	movb	$0, 20(%r14)
	movq	%rax, 8(%r14)
	call	alloc_memory
	movq	56(%rsp), %rcx
	movl	$17, 24(%rax)
	movq	%rax, %rdx
	movq	%r14, (%rax)
	movq	%rsi, 8(%rax)
	movq	$0, 16(%rax)
	call	list_append
.L105:
	movq	48(%rsp), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L109
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L106
	cmpb	$0, 20(%rax)
	je	.L107
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rsi
	jmp	.L107
	.p2align 4,,10
	.p2align 3
.L131:
	movq	8(%r12), %rax
	leaq	.LC10(%rip), %rdx
	movq	8(%rax), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L138
	movq	8(%rsi), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L95
	cmpb	$0, 20(%rax)
	jne	.L139
.L94:
	movq	.refptr.name_int(%rip), %rax
	movq	%rbx, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	movq	(%rax), %rdx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rsi
	call	alloc_memory
	movq	%rsi, %xmm0
	movl	$32, %ecx
	movhps	16(%rsi), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rdi
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movq	%r12, 8(%rax)
	movq	%rax, %rdx
	movq	%rdi, (%rax)
	movq	%r13, 16(%rax)
	movl	$16, 24(%rax)
	movb	$1, 20(%rdi)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L110:
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L109:
	movq	56(%rsp), %rcx
	call	list_pop
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L110
	movq	8(%r12), %rdx
	movq	%rbx, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rsi
	call	alloc_memory
	movq	%rsi, %xmm0
	movl	$24, %ecx
	movhps	16(%rsi), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rdi
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movl	$32, %ecx
	movq	%r13, (%rax)
	movq	%rax, %rsi
	movl	$1, 16(%rax)
	movq	.refptr.name_int(%rip), %rax
	movb	$0, 20(%rsi)
	movq	(%rax), %rax
	movq	%rax, 8(%rsi)
	call	alloc_memory
	movq	%r12, 8(%rax)
	movq	%rax, %rdx
	movq	%rdi, (%rax)
	movq	%rsi, 16(%rax)
	movl	$22, 24(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L137:
	movq	8(%r12), %rax
	movq	8(%rax), %rdi
	movq	8(%rsi), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movq	%rdi, %r9
	leaq	.LC9(%rip), %rdx
	xorl	%edi, %edi
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	call	fprintf
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L128:
	call	__getreent
	movl	$53, %r8d
	movl	$1, %edx
	xorl	%edi, %edi
	movq	24(%rax), %r9
	leaq	.LC4(%rip), %rcx
	call	fwrite
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L126:
	movq	(%rcx), %rdx
	movq	%rbx, %r9
	movl	$102, %r8d
.L124:
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movq	%rbx, %xmm0
	movhps	16(%rbx), %xmm0
	movl	$7, 16(%rax)
	movq	%rax, %rdi
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L96:
	call	__getreent
	movl	%edi, %r8d
	leaq	.LC14(%rip), %rdx
	xorl	%edi, %edi
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L138:
	movq	(%r12), %rax
	xorl	%edi, %edi
	movq	(%rax), %rax
	movq	8(%rax), %rbx
	call	__getreent
	leaq	.LC11(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	call	fprintf
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L135:
	movq	8(%r12), %rax
	movq	8(%rax), %r12
	movq	8(%rsi), %rax
	movq	8(%rax), %rsi
	call	__getreent
	movq	%r12, %r9
	leaq	.LC8(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rsi, %r8
	call	fprintf
	movq	(%rdi), %rdx
	movq	%rbx, %r9
	movq	%rdi, %rcx
	movl	$102, %r8d
	jmp	.L124
	.p2align 4,,10
	.p2align 3
.L139:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L94
.L95:
	call	__getreent
	movl	$55, %r8d
	movl	$1, %edx
	xorl	%edi, %edi
	movq	24(%rax), %r9
	leaq	.LC12(%rip), %rcx
	call	fwrite
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L136:
	movq	(%rdi), %rdx
	movq	%rbx, %r9
	movq	%rdi, %rcx
	movl	$102, %r8d
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movq	%rbx, %xmm0
	movhps	16(%rbx), %xmm0
	movl	$8, 16(%rax)
	movq	%rax, %rdi
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L100:
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax
	movq	(%rax), %rdx
	movq	8(%r12), %rax
	movq	8(%rax), %rcx
	call	make_method_name
	movq	%rax, %rdx
	movq	(%r12), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L102
	movq	(%rsi), %rax
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$8, %ecx
	movq	(%rax), %rax
	movq	%rax, 32(%rsp)
	call	create_primary
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_expression
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L103
	cmpb	$0, 20(%rax)
	jne	.L140
.L104:
	movq	8(%r14), %rcx
	call	get_type_size
	movl	$24, %ecx
	movq	%rax, %r15
	call	alloc_memory
	movl	$32, %ecx
	movq	%r15, (%rax)
	movq	%rax, %r13
	movl	$1, 16(%rax)
	movq	.refptr.name_int(%rip), %rax
	movb	$0, 20(%r13)
	movq	(%rax), %rax
	movq	%rax, 8(%r13)
	call	alloc_memory
	movq	56(%rsp), %rcx
	movq	%r13, (%rax)
	movq	%rax, %rdx
	movl	$1, %r13d
	movl	$17, 24(%rax)
	movq	%r14, 8(%rax)
	movq	$0, 16(%rax)
	call	list_append
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L133:
	movq	8(%rax), %rbx
	xorl	%edi, %edi
	call	__getreent
	leaq	.LC6(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	call	fprintf
	jmp	.L74
.L134:
	movq	8(%r12), %rax
	movq	8(%rax), %rdi
	movq	8(%rsi), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movq	%rdi, %r9
	leaq	.LC7(%rip), %rdx
	xorl	%edi, %edi
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	call	fprintf
	jmp	.L74
.L140:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r14
	jmp	.L104
	.section	.text.unlikely,"x"
	.def	tac_variable_access.cold;	.scl	3;	.type	32;	.endef
tac_variable_access.cold:
.L106:
	movq	8, %rax
	ud2
.L103:
	movq	8, %rax
	ud2
	.text
	.section	.text.unlikely,"x"
.LCOLDE15:
	.text
.LHOTE15:
	.section .rdata,"dr"
	.align 8
.LC17:
	.ascii "[Warning] Unsupported type for negation: %s\12\0"
	.align 8
.LC18:
	.ascii "[Warning] Unsupported primary type for tac_primary: %d\12\0"
	.section	.text.unlikely,"x"
.LCOLDB19:
	.text
.LHOTB19:
	.p2align 4
	.globl	tac_primary
	.def	tac_primary;	.scl	2;	.type	32;	.endef
tac_primary:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$32, %rsp
	movl	8(%rcx), %ebx
	movaps	%xmm6, 32(%rsp)
	cmpl	$8, %ebx
	ja	.L142
	leaq	.L144(%rip), %r8
	movq	%rdx, %rsi
	movslq	(%r8,%rbx,4), %rax
	addq	%r8, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L144:
	.long	.L152-.L144
	.long	.L151-.L144
	.long	.L150-.L144
	.long	.L149-.L144
	.long	.L148-.L144
	.long	.L147-.L144
	.long	.L146-.L144
	.long	.L145-.L144
	.long	.L143-.L144
	.text
	.p2align 4,,10
	.p2align 3
.L145:
	movq	(%rcx), %rcx
	call	tac_primary
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L155
	cmpb	$0, 20(%rax)
	jne	.L165
.L156:
	movq	8(%rdi), %rdx
	movq	%rsi, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %r12
	call	alloc_memory
	movq	%r12, %xmm0
	movhps	16(%r12), %xmm0
	movq	.refptr.name_int(%rip), %r12
	movb	$0, 20(%rax)
	movq	%rax, %rbx
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movq	8(%rdi), %rax
	cmpq	(%r12), %rax
	je	.L166
	movq	.refptr.name_float(%rip), %r13
	cmpq	0(%r13), %rax
	je	.L167
	movq	8(%rax), %rbx
	call	__getreent
	leaq	.LC17(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	xorl	%ebx, %ebx
	call	fprintf
	jmp	.L141
	.p2align 4,,10
	.p2align 3
.L143:
	movq	(%rcx), %rcx
	movaps	32(%rsp), %xmm6
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	jmp	tac_variable_access
	.p2align 4,,10
	.p2align 3
.L152:
	movq	(%rcx), %rcx
	movl	$10, %r8d
	xorl	%edx, %edx
	call	strtoll
	movl	$24, %ecx
	movq	%rax, %rsi
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rax, %rbx
	movl	$1, 16(%rax)
	movq	.refptr.name_int(%rip), %rax
	movq	(%rax), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
.L141:
	movaps	32(%rsp), %xmm6
	leaq	-40(%rbp), %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L151:
	movq	(%rcx), %rcx
	xorl	%edx, %edx
	call	strtod
	movl	$24, %ecx
	movapd	%xmm0, %xmm6
	call	alloc_memory
	movsd	%xmm6, (%rax)
	movq	%rax, %rbx
	movl	$2, 16(%rax)
	movq	.refptr.name_float(%rip), %rax
	movq	(%rax), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	jmp	.L141
	.p2align 4,,10
	.p2align 3
.L150:
	movq	(%rcx), %xmm6
	movl	$24, %ecx
	call	alloc_memory
	movl	$3, 16(%rax)
	movq	%rax, %rbx
	movdqa	%xmm6, %xmm0
	movq	.refptr.name_string(%rip), %rax
	movhps	(%rax), %xmm0
	movb	$0, 20(%rbx)
	movups	%xmm0, (%rbx)
	jmp	.L141
	.p2align 4,,10
	.p2align 3
.L149:
	movl	$24, %ecx
	call	alloc_memory
	movb	$1, (%rax)
	movq	%rax, %rbx
	movl	$4, 16(%rax)
	movq	.refptr.name_bool(%rip), %rax
	movq	(%rax), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	jmp	.L141
	.p2align 4,,10
	.p2align 3
.L148:
	movl	$24, %ecx
	call	alloc_memory
	movb	$0, (%rax)
	movq	%rax, %rbx
	movl	$4, 16(%rax)
	movq	.refptr.name_bool(%rip), %rax
	movq	(%rax), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	jmp	.L141
	.p2align 4,,10
	.p2align 3
.L147:
	movq	(%rcx), %rcx
	movaps	32(%rsp), %xmm6
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	jmp	tac_expression
	.p2align 4,,10
	.p2align 3
.L146:
	movq	(%rcx), %rcx
	call	tac_primary
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L154
	cmpb	$0, 20(%rax)
	jne	.L168
.L154:
	movq	.refptr.name_bool(%rip), %rax
	movq	%rsi, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	movq	(%rax), %rdx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rdi
	call	alloc_memory
	movq	%rdi, %xmm0
	movl	$32, %ecx
	movhps	16(%rdi), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movq	%r12, 8(%rax)
	movq	%rax, %rdx
	movq	%rbx, (%rax)
	movl	$13, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L141
.L142:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC18(%rip), %rdx
	xorl	%ebx, %ebx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L141
	.p2align 4,,10
	.p2align 3
.L167:
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movl	$2, 16(%rax)
	movq	%rax, %r12
	movq	.LC16(%rip), %rax
	movb	$0, 20(%r12)
	movq	%rax, (%r12)
	movq	0(%r13), %rax
	movq	%rax, 8(%r12)
	call	alloc_memory
	movl	$2, 24(%rax)
	movq	%rax, %rdx
	movq	%rbx, (%rax)
	movq	%r12, 8(%rax)
	movq	%rdi, 16(%rax)
.L158:
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L141
	.p2align 4,,10
	.p2align 3
.L165:
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rdi
	jmp	.L156
	.p2align 4,,10
	.p2align 3
.L168:
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r12
	jmp	.L154
	.p2align 4,,10
	.p2align 3
.L166:
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movl	$1, 16(%rax)
	movq	%rax, %r13
	movq	$0, (%rax)
	movq	(%r12), %rax
	movb	$0, 20(%r13)
	movq	%rax, 8(%r13)
	call	alloc_memory
	movl	$1, 24(%rax)
	movq	%rax, %rdx
	movq	%rbx, (%rax)
	movq	%r13, 8(%rax)
	movq	%rdi, 16(%rax)
	jmp	.L158
	.section	.text.unlikely,"x"
	.def	tac_primary.cold;	.scl	3;	.type	32;	.endef
tac_primary.cold:
.L155:
	movq	8, %rax
	ud2
	.text
	.section	.text.unlikely,"x"
.LCOLDE19:
	.text
.LHOTE19:
	.section .rdata,"dr"
	.align 8
.LC20:
	.ascii "[Warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.p2align 4
	.globl	tac_expression
	.def	tac_expression;	.scl	2;	.type	32;	.endef
tac_expression:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	cmpl	$19, 24(%rcx)
	je	.L190
	movq	16(%rcx), %rcx
	call	tac_expression
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L171
	cmpb	$0, 20(%rax)
	jne	.L191
.L171:
	movl	24(%rbx), %eax
	movq	(%rbx), %rcx
	cmpl	$18, %eax
	ja	.L172
	leaq	CSWTCH.21(%rip), %rdx
	movl	(%rdx,%rax,4), %r13d
	movq	%rdi, %rdx
	call	tac_expression
	movq	%rax, %r12
	movl	24(%rbx), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L173
	cmpl	$14, %r13d
	jne	.L179
	movl	16(%r12), %eax
	testl	%eax, %eax
	jne	.L192
.L176:
	movl	$32, %ecx
	call	alloc_memory
	movl	$14, 24(%rax)
	movq	%rax, %rdx
	movq	%r12, (%rax)
	movq	%rsi, 8(%rax)
	movq	$0, 16(%rax)
	cmpb	$0, 20(%r12)
	jne	.L193
.L177:
	movq	16(%rdi), %rax
	movq	8(%rax), %rcx
	call	list_append
	leaq	-48(%rbp), %rsp
	movq	%rsi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L172:
	movq	%rdi, %rdx
	movl	$25, %r13d
	call	tac_expression
	movq	%rax, %r12
	movl	24(%rbx), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L173
.L179:
	movq	8(%r12), %rdx
	xorl	%ecx, %ecx
	movq	%rdi, %r9
	movl	$116, %r8d
	call	create_var
	movl	$24, %ecx
	movq	%rax, %r14
	call	alloc_memory
	movq	%r14, %xmm0
	movhps	16(%r14), %xmm0
	movb	$0, 20(%rax)
	movq	%rax, %rbx
	movq	%r12, %r14
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	cmpb	$0, 20(%r12)
	jne	.L194
.L175:
	movl	$32, %ecx
	call	alloc_memory
	movq	%r14, 8(%rax)
	movq	%rax, %rdx
	movq	%rsi, 16(%rax)
	movq	%rbx, %rsi
	movl	%r13d, 24(%rax)
	movq	%rbx, (%rax)
	movq	16(%rdi), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	16(%r12), %eax
	testl	%eax, %eax
	je	.L176
.L192:
	call	__getreent
	movl	$57, %r8d
	movl	$1, %edx
	leaq	.LC20(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L176
	.p2align 4,,10
	.p2align 3
.L173:
	movq	8(%r12), %rdx
	xorl	%ecx, %ecx
	movq	%rdi, %r9
	movl	$116, %r8d
	call	create_var
	movl	$24, %ecx
	movq	%rax, %r14
	call	alloc_memory
	movq	%r14, %xmm0
	movhps	16(%r14), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	cmpb	$0, 20(%r12)
	jne	.L195
.L178:
	movl	$32, %ecx
	call	alloc_memory
	movq	%rsi, 16(%rax)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	movl	%r13d, 24(%rax)
	movq	%rbx, (%rax)
	movq	%r12, 8(%rax)
	jmp	.L177
	.p2align 4,,10
	.p2align 3
.L190:
	movq	8(%rcx), %rcx
	leaq	-48(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	jmp	tac_primary
	.p2align 4,,10
	.p2align 3
.L193:
	movl	$32, %ecx
	call	alloc_memory
	movl	$24, 24(%rax)
	movq	%rax, %rdx
	movq	%r12, (%rax)
	movq	%rsi, 8(%rax)
	movq	$0, 16(%rax)
	jmp	.L177
	.p2align 4,,10
	.p2align 3
.L191:
	movq	%rdi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rsi
	jmp	.L171
	.p2align 4,,10
	.p2align 3
.L195:
	movq	%r12, %rcx
	movq	%rdi, %rdx
	call	load_rvalue.part.0
	movq	%rax, %r12
	jmp	.L178
	.p2align 4,,10
	.p2align 3
.L194:
	movq	%rdi, %rdx
	movq	%r12, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r14
	jmp	.L175
	.section .rdata,"dr"
	.align 8
.LC21:
	.ascii "Error: create_attribute received NULL table\12\0"
	.align 8
.LC22:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
	.text
	.p2align 4
	.globl	tac_variable
	.def	tac_variable;	.scl	2;	.type	32;	.endef
tac_variable:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	testb	%r8b, %r8b
	je	.L197
	movq	(%rdx), %rax
	movq	(%rax), %rcx
	call	list_pop_back
	movq	%rax, %rdi
	movq	(%rbx), %rax
	movq	%rdi, %rdx
	movq	(%rax), %rcx
	call	list_append
	movq	(%rsi), %r12
	movq	8(%rsi), %r13
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbx, %r9
	movl	$97, %r8d
	movq	%r12, %rdx
	movq	%r13, %rcx
	movq	%rax, %rsi
	call	create_var
	movq	%r12, %xmm1
	movq	$0, 16(%rsi)
	movq	%rax, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, (%rsi)
	testq	%rdi, %rdi
	jne	.L212
	call	__getreent
	movl	$44, %r8d
	movl	$1, %edx
	leaq	.LC21(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
.L199:
	call	__getreent
	movl	$63, %r8d
	movl	$1, %edx
	leaq	.LC22(%rip), %rcx
	movq	24(%rax), %r9
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L212:
	movq	16(%rdi), %rax
	movq	%r12, %rcx
	movq	%rax, 16(%rsi)
	call	get_type_size
	movq	(%rdi), %rcx
	addq	%rax, 16(%rdi)
	movq	%rsi, %rdx
	testq	%rcx, %rcx
	je	.L199
.L211:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	jmp	list_append
	.p2align 4,,10
	.p2align 3
.L197:
	movq	(%rcx), %rdx
	movq	8(%rcx), %rcx
	movq	%rbx, %r9
	movl	$118, %r8d
	call	create_var
	movq	16(%rsi), %rcx
	movq	%rax, %rdi
	testq	%rcx, %rcx
	je	.L201
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L202
	cmpb	$0, 20(%rax)
	jne	.L213
.L202:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rdi, %xmm0
	movl	$32, %ecx
	movhps	16(%rdi), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r12
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movq	%rsi, 8(%rax)
	movq	%rax, %rdx
	movl	$14, 24(%rax)
	movq	%r12, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	jmp	.L211
	.p2align 4,,10
	.p2align 3
.L201:
	movl	$24, %ecx
	call	alloc_memory
	movq	$0, (%rax)
	movq	%rax, %rsi
	movl	$1, 16(%rax)
	movq	.refptr.name_int(%rip), %rax
	movb	$0, 20(%rsi)
	movq	(%rax), %rax
	movq	%rax, 8(%rsi)
	jmp	.L202
	.p2align 4,,10
	.p2align 3
.L213:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rsi
	jmp	.L202
	.p2align 4
	.globl	tac_if
	.def	tac_if;	.scl	2;	.type	32;	.endef
tac_if:
	pushq	%r15
	movq	%rdx, %r9
	movl	$98, %r8d
	pushq	%r14
	movq	%rcx, %r14
	xorl	%ecx, %ecx
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	xorl	%edx, %edx
	subq	$72, %rsp
	call	create_var
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rbx, %r9
	movl	$98, %r8d
	movq	%rax, %rdi
	call	create_var
	movq	16(%r14), %rcx
	movq	%rax, %rsi
	call	list_is_empty
	testb	%al, %al
	je	.L217
	movq	24(%r14), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L246
.L217:
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	create_var
	movq	%rax, 56(%rsp)
.L216:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbx, %rdx
	movl	$6, 16(%rax)
	movq	%rax, %r13
	movq	$0, 8(%rax)
	movq	56(%rsp), %rax
	movb	$0, 20(%r13)
	movq	(%r14), %rcx
	movq	%rax, 0(%r13)
	call	tac_expression
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L218
	cmpb	$0, 20(%rax)
	jne	.L247
.L218:
	movl	$24, %ecx
	call	alloc_memory
	movl	$24, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %rbp
	movq	$0, 8(%rax)
	movq	%rsi, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movl	$32, %ecx
	movq	%rdi, (%rax)
	movq	%rax, %r12
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	%rax, %rdx
	movq	%r12, 8(%rax)
	movq	%rbp, 16(%rax)
	movl	$19, 24(%rax)
	movq	%r15, (%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movq	%rdi, (%rax)
	movq	%rax, %rbp
	call	create_list
	movq	%rbp, %rdx
	movq	%rax, 8(%rbp)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rbp, 16(%rbx)
	movq	8(%r14), %rcx
	call	list_copy
	movq	%rax, %rdi
	jmp	.L219
	.p2align 4,,10
	.p2align 3
.L220:
	movq	%rbx, %rdx
	call	tac_statement
.L219:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L220
	movl	$32, %ecx
	call	alloc_memory
	movq	$0, 8(%rax)
	movq	%rax, %rdx
	movl	$20, 24(%rax)
	movq	%r13, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	16(%r14), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L248
.L221:
	movq	24(%r14), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L249
.L229:
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %rsi
	movq	56(%rsp), %rax
	movq	%rax, (%rsi)
	call	create_list
	movq	%rsi, %rdx
	movq	%rax, 8(%rsi)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rsi, 16(%rbx)
	addq	$72, %rsp
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
.L246:
	movq	%rsi, 56(%rsp)
	jmp	.L216
	.p2align 4,,10
	.p2align 3
.L249:
	movl	$16, %ecx
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rax, %rdi
	call	create_list
	movq	%rdi, %rdx
	movq	%rax, 8(%rdi)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rdi, 16(%rbx)
	movq	24(%r14), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L230
	.p2align 4,,10
	.p2align 3
.L231:
	movq	%rbx, %rdx
	call	tac_statement
.L230:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L231
	movl	$32, %ecx
	call	alloc_memory
	movq	%r13, (%rax)
	movq	%rax, %rdx
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L229
	.p2align 4,,10
	.p2align 3
.L248:
	movq	16(%r14), %rcx
	call	list_copy
	movq	%rax, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L222:
	movq	40(%rsp), %rcx
	call	list_pop
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L221
	movl	$16, %ecx
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rax, %rdi
	call	create_list
	movq	%rdi, %rdx
	movq	%rax, 8(%rdi)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rdi, 16(%rbx)
	movq	%rbx, %r9
	xorl	%edx, %edx
	movl	$98, %r8d
	xorl	%ecx, %ecx
	call	create_var
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rax, %r12
	call	create_var
	movq	0(%rbp), %rcx
	movq	%rbx, %rdx
	movq	%rax, %rsi
	call	tac_expression
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L223
	cmpb	$0, 20(%rax)
	jne	.L250
.L223:
	movq	40(%rsp), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L251
.L225:
	movl	$24, %ecx
	call	alloc_memory
	movl	$24, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %r15
	movq	$0, 8(%rax)
	movq	%rsi, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movl	$32, %ecx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r12, (%rax)
	movb	$0, 20(%rax)
	movq	%rax, 48(%rsp)
	call	alloc_memory
	movq	48(%rsp), %r9
	movq	%rax, %rdx
	movq	%rdi, (%rax)
	movq	%r9, 8(%rax)
	movl	$19, 24(%rax)
	movq	%r15, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movq	%r12, (%rax)
	movq	%rax, %rdi
	call	create_list
	movq	%rdi, %rdx
	movq	%rax, 8(%rdi)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rdi, 16(%rbx)
	movq	8(%rbp), %rcx
	call	list_copy
	movq	%rax, %rdi
	jmp	.L226
	.p2align 4,,10
	.p2align 3
.L227:
	movq	%rbx, %rdx
	call	tac_statement
.L226:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L227
	movl	$32, %ecx
	call	alloc_memory
	movq	%r13, (%rax)
	movq	%rax, %rdx
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L222
	.p2align 4,,10
	.p2align 3
.L251:
	movq	24(%r14), %rcx
	call	list_is_empty
	testb	%al, %al
	cmovne	56(%rsp), %rsi
	jmp	.L225
	.p2align 4,,10
	.p2align 3
.L250:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rdi
	jmp	.L223
.L247:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r15
	jmp	.L218
	.section .rdata,"dr"
	.align 8
.LC23:
	.ascii "[Warning] 'break' statement used outside of loop\12\0"
	.align 8
.LC24:
	.ascii "[Warning] 'continue' statement used outside of loop\12\0"
	.align 8
.LC25:
	.ascii "[Warning] Unsupported statement type for tac_statement: %d\12\0"
	.text
	.p2align 4
	.globl	tac_statement
	.def	tac_statement;	.scl	2;	.type	32;	.endef
tac_statement:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movl	8(%rcx), %ebx
	cmpl	$7, %ebx
	ja	.L253
	movq	%rdx, %rdi
	leaq	.L255(%rip), %rdx
	movq	%rcx, %rsi
	movslq	(%rdx,%rbx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L255:
	.long	.L262-.L255
	.long	.L261-.L255
	.long	.L260-.L255
	.long	.L259-.L255
	.long	.L258-.L255
	.long	.L257-.L255
	.long	.L256-.L255
	.long	.L254-.L255
	.text
	.p2align 4,,10
	.p2align 3
.L256:
	movq	32(%rdi), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L265
	movq	32(%rdi), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	je	.L265
.L285:
	movl	$32, %ecx
	call	alloc_memory
	movl	$20, 24(%rax)
	movq	%rax, %rdx
	jmp	.L283
	.p2align 4,,10
	.p2align 3
.L254:
	movq	40(%rdi), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L266
	movq	40(%rdi), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L285
.L266:
	call	__getreent
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC24(%rip), %rcx
	movq	24(%rax), %r9
	jmp	.L284
	.p2align 4,,10
	.p2align 3
.L260:
	movq	(%rcx), %rcx
	addq	$32, %rsp
	movq	%rdi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	tac_if
	.p2align 4,,10
	.p2align 3
.L262:
	movq	(%rcx), %rcx
	movq	%rdi, %rdx
	call	tac_expression
	testq	%rax, %rax
	je	.L252
	cmpb	$0, 20(%rax)
	jne	.L286
.L252:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L261:
	movq	(%rcx), %rcx
	addq	$32, %rsp
	movq	%rdi, %rdx
	xorl	%r8d, %r8d
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	tac_variable
	.p2align 4,,10
	.p2align 3
.L258:
	movq	(%rcx), %rcx
	addq	$32, %rsp
	movq	%rdi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	tac_for
	.p2align 4,,10
	.p2align 3
.L257:
	movl	$24, %ecx
	call	alloc_memory
	movq	$0, (%rax)
	movq	%rax, %rbx
	movl	$5, 16(%rax)
	movq	.refptr.name_void(%rip), %rax
	movb	$0, 20(%rbx)
	movq	(%rsi), %rcx
	movq	(%rax), %rax
	movq	%rax, 8(%rbx)
	testq	%rcx, %rcx
	je	.L264
	movq	%rdi, %rdx
	call	tac_expression
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L264
	cmpb	$0, 20(%rax)
	jne	.L287
.L264:
	movl	$32, %ecx
	call	alloc_memory
	movl	$21, 24(%rax)
	movq	%rax, %rdx
.L283:
	movq	16(%rdi), %rax
	movq	%rbx, (%rdx)
	movq	$0, 8(%rdx)
	movq	$0, 16(%rdx)
	movq	8(%rax), %rcx
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	list_append
	.p2align 4,,10
	.p2align 3
.L259:
	movq	(%rcx), %rcx
	addq	$32, %rsp
	movq	%rdi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	tac_while
	.p2align 4,,10
	.p2align 3
.L265:
	call	__getreent
	movl	$49, %r8d
	movl	$1, %edx
	leaq	.LC23(%rip), %rcx
	movq	24(%rax), %r9
.L284:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	fwrite
.L253:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC25(%rip), %rdx
	movq	24(%rax), %rcx
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L287:
	movq	%rdi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rbx
	jmp	.L264
	.p2align 4,,10
	.p2align 3
.L286:
	addq	$32, %rsp
	movq	%rdi, %rdx
	movq	%rax, %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	load_rvalue.part.0
	.p2align 4
	.globl	tac_for
	.def	tac_for;	.scl	2;	.type	32;	.endef
tac_for:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$40, %rsp
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L289
	xorl	%r8d, %r8d
	call	tac_variable
.L289:
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rbx, %r9
	movl	$98, %r8d
	call	create_var
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rbx, %r9
	movl	$98, %r8d
	movq	%rax, %rbp
	call	create_var
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rbx, %r9
	movl	$98, %r8d
	movq	%rax, %r13
	call	create_var
	cmpq	$0, 8(%rdi)
	movl	$24, %ecx
	movq	%rax, %r12
	je	.L290
	call	alloc_memory
	movl	$32, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %rsi
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	%rax, %rdx
	movq	%rsi, (%rax)
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movq	%rbp, (%rax)
	movq	%rax, %rsi
	call	create_list
	movq	%rsi, %rdx
	movq	%rax, 8(%rsi)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rsi, 16(%rbx)
	movq	8(%rdi), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L291
	cmpb	$0, 20(%rax)
	jne	.L312
.L291:
	movl	$24, %ecx
	call	alloc_memory
	movl	$24, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %rsi
	movq	$0, 8(%rax)
	movq	%r12, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movl	$32, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %r14
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	%r14, 8(%rax)
	movq	%rax, %rdx
	movl	$19, 24(%rax)
	movq	%r15, (%rax)
	movq	%rsi, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L292:
	movl	$16, %ecx
	call	alloc_memory
	movq	%r13, (%rax)
	movq	%rax, %rsi
	call	create_list
	movq	%rsi, %rdx
	movq	%rax, 8(%rsi)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rsi, 16(%rbx)
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rbx, %r9
	movl	$98, %r8d
	call	create_var
	cmpq	$0, 16(%rdi)
	movl	$24, %ecx
	movq	%rax, %r14
	je	.L293
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r14, (%rax)
	call	list_append
.L294:
	movl	$24, %ecx
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	32(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r12, (%rax)
	call	list_append
	movq	24(%rdi), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L296
	.p2align 4,,10
	.p2align 3
.L297:
	movq	%rbx, %rdx
	call	tac_statement
.L296:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L297
	movq	40(%rbx), %rcx
	call	list_pop_back
	movq	32(%rbx), %rcx
	call	list_pop_back
	cmpq	$0, 16(%rdi)
	je	.L299
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %rsi
	movq	$0, 8(%rax)
	movq	%r14, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	%rax, %rdx
	movq	%rsi, (%rax)
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movq	%r14, (%rax)
	movq	%rax, %rsi
	call	create_list
	movq	%rsi, %rdx
	movq	%rax, 8(%rsi)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rsi, 16(%rbx)
	movq	16(%rdi), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	testq	%rax, %rax
	je	.L299
	cmpb	$0, 20(%rax)
	jne	.L313
.L299:
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %rsi
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	cmpq	$0, 8(%rdi)
	movl	$20, 24(%rax)
	movq	%rax, %rdx
	movq	%rsi, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	je	.L314
.L301:
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movq	%r12, (%rax)
	movq	%rax, %rsi
	call	create_list
	movq	%rsi, %rdx
	movq	%rax, 8(%rsi)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rsi, 16(%rbx)
	addq	$40, %rsp
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
.L293:
	cmpq	$0, 8(%rdi)
	je	.L295
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	call	list_append
	jmp	.L294
	.p2align 4,,10
	.p2align 3
.L290:
	call	alloc_memory
	movl	$32, %ecx
	movq	%r13, (%rax)
	movq	%rax, %rsi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rax, %rdx
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L292
	.p2align 4,,10
	.p2align 3
.L313:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	jmp	.L299
	.p2align 4,,10
	.p2align 3
.L314:
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %rsi
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movl	$20, 24(%rax)
	movq	%rax, %rdx
	movq	%rsi, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	jmp	.L301
	.p2align 4,,10
	.p2align 3
.L295:
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	call	list_append
	jmp	.L294
	.p2align 4,,10
	.p2align 3
.L312:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r15
	jmp	.L291
	.p2align 4
	.globl	tac_while
	.def	tac_while;	.scl	2;	.type	32;	.endef
tac_while:
	pushq	%r15
	movq	%rdx, %r9
	movl	$98, %r8d
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rcx, %rsi
	xorl	%ecx, %ecx
	pushq	%rbx
	movq	%rdx, %rbx
	xorl	%edx, %edx
	subq	$40, %rsp
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rbp
	call	alloc_memory
	movl	$32, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %rdi
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	%rax, %rdx
	movq	%rdi, (%rax)
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movq	%rbp, (%rax)
	movq	%rax, %rdi
	call	create_list
	movq	%rdi, %rdx
	movq	%rax, 8(%rdi)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rdi, 16(%rbx)
	movq	%rbx, %r9
	xorl	%edx, %edx
	movl	$98, %r8d
	xorl	%ecx, %ecx
	call	create_var
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rax, %r13
	call	create_var
	movq	(%rsi), %rcx
	movq	%rbx, %rdx
	movq	%rax, %rdi
	call	tac_expression
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L316
	cmpb	$0, 20(%rax)
	jne	.L323
.L316:
	movl	$24, %ecx
	call	alloc_memory
	movl	$24, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %r12
	movq	$0, 8(%rax)
	movq	%rdi, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movl	$32, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %r14
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	%rax, %rdx
	movq	%r14, 8(%rax)
	movq	%r12, 16(%rax)
	movl	$19, 24(%rax)
	movq	%r15, (%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movq	%r13, (%rax)
	movq	%rax, %r12
	call	create_list
	movq	%r12, %rdx
	movq	%rax, 8(%r12)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%r12, 16(%rbx)
	movl	$24, %ecx
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	call	list_append
	movl	$24, %ecx
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	32(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rdi, (%rax)
	call	list_append
	movq	8(%rsi), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L317
	.p2align 4,,10
	.p2align 3
.L318:
	movq	%rbx, %rdx
	call	tac_statement
.L317:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L318
	movq	40(%rbx), %rcx
	call	list_pop_back
	movq	32(%rbx), %rcx
	call	list_pop_back
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movq	%rbp, (%rax)
	movq	%rax, %rsi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	%rax, %rdx
	movq	%rsi, (%rax)
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movq	%rdi, (%rax)
	movq	%rax, %rsi
	call	create_list
	movq	%rsi, %rdx
	movq	%rax, 8(%rsi)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rsi, 16(%rbx)
	addq	$40, %rsp
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
.L323:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r15
	jmp	.L316
	.p2align 4
	.globl	tac_function
	.def	tac_function;	.scl	2;	.type	32;	.endef
tac_function:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r13
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$32, %rsp
	movaps	%xmm6, 32(%rsp)
	movdqu	(%rcx), %xmm6
	movl	$40, %ecx
	call	alloc_memory
	movups	%xmm6, (%rax)
	movq	%rax, %rsi
	call	create_list
	movq	%rax, 16(%rsi)
	call	create_list
	movq	%rax, 24(%rsi)
	call	create_list
	movq	%rsi, %rdx
	movq	%rax, 32(%rsi)
	movq	(%rbx), %rax
	movq	%rsi, 8(%rbx)
	movq	24(%rax), %rcx
	call	list_append
	movq	16(%r12), %rcx
	call	list_copy
	movq	%rax, %rdi
	jmp	.L325
	.p2align 4,,10
	.p2align 3
.L326:
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	movq	%rbx, %r9
	movl	$112, %r8d
	call	create_var
	movq	16(%rsi), %rcx
	movq	%rax, %rdx
	call	list_append
.L325:
	movq	%rdi, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L326
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	create_var
	movl	$16, %ecx
	movq	%rax, %r13
	call	alloc_memory
	movq	%r13, (%rax)
	movq	%rax, %rdi
	call	create_list
	movq	32(%rsi), %rcx
	movq	%rdi, %rdx
	movq	%rax, 8(%rdi)
	call	list_append
	movq	%rdi, 16(%rbx)
	movq	24(%r12), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L327
	.p2align 4,,10
	.p2align 3
.L328:
	movq	%rbx, %rdx
	call	tac_statement
.L327:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L328
	movq	$0, 8(%rbx)
	movaps	32(%rsp), %xmm6
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC26:
	.ascii "[Warning] Constructor '%s' does not start with 'self' initialization\12\0"
	.text
	.p2align 4
	.globl	tac_method
	.def	tac_method;	.scl	2;	.type	32;	.endef
tac_method:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$32, %rsp
	movaps	%xmm6, 32(%rsp)
	movdqu	(%rcx), %xmm6
	movl	$40, %ecx
	call	alloc_memory
	movups	%xmm6, (%rax)
	movq	%rax, %rsi
	call	create_list
	movq	%rax, 16(%rsi)
	call	create_list
	movq	%rax, 24(%rsi)
	call	create_list
	movq	%rsi, %rdx
	movq	%rax, 32(%rsi)
	movq	(%rbx), %rax
	movq	%rsi, 8(%rbx)
	movq	24(%rax), %rcx
	call	list_append
	movq	16(%r12), %rcx
	call	list_copy
	movq	%rax, %rdi
	jmp	.L331
	.p2align 4,,10
	.p2align 3
.L332:
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	movq	%rbx, %r9
	movl	$112, %r8d
	call	create_var
	movq	16(%rsi), %rcx
	movq	%rax, %rdx
	call	list_append
.L331:
	movq	%rdi, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L332
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	create_var
	movl	$16, %ecx
	movq	%rax, %r13
	call	alloc_memory
	movq	%r13, (%rax)
	movq	%rax, %rdi
	call	create_list
	movq	32(%rsi), %rcx
	movq	%rdi, %rdx
	movq	%rax, 8(%rdi)
	call	list_append
	movq	%rdi, 16(%rbx)
	movq	24(%r12), %rcx
	call	list_copy
	movq	%rax, %rsi
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax
	movq	(%rax), %rdx
	movq	24(%rbx), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rcx
	call	make_method_name
	movq	%rax, %rdx
	movq	(%r12), %rax
	movq	8(%rax), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L336
	jmp	.L339
	.p2align 4,,10
	.p2align 3
.L337:
	movq	%rbx, %rdx
	call	tac_statement
.L336:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L337
	movq	$0, 8(%rbx)
	movaps	32(%rsp), %xmm6
	leaq	-48(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L339:
	movq	%rsi, %rcx
	call	list_pop
	movl	8(%rax), %ecx
	testl	%ecx, %ecx
	jne	.L334
	movq	(%rax), %rax
	cmpl	$19, 24(%rax)
	jne	.L334
	movq	8(%rax), %rax
	cmpl	$8, 8(%rax)
	jne	.L334
	movq	(%rax), %rax
	movl	16(%rax), %edx
	testl	%edx, %edx
	je	.L335
.L334:
	movq	(%r12), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movaps	32(%rsp), %xmm6
	leaq	.LC26(%rip), %rdx
	movq	24(%rax), %rcx
	leaq	-48(%rbp), %rsp
	movq	%rbx, %r8
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	jmp	fprintf
.L335:
	movq	24(%rbx), %r14
	movl	$24, %ecx
	movq	8(%rax), %r13
	call	alloc_memory
	movq	%rbx, %r9
	movl	$118, %r8d
	movq	%rax, %r12
	movl	$1, 16(%rax)
	movq	24(%r14), %rax
	movq	%r13, %rcx
	movb	$0, 20(%r12)
	movq	0(%r13), %rdx
	movq	%rax, (%r12)
	movq	.refptr.name_int(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 8(%r12)
	call	create_var
	movl	$24, %ecx
	movq	%rax, %r14
	call	alloc_memory
	movq	%r14, %xmm0
	movl	$32, %ecx
	movhps	16(%r14), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r13
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movq	8(%rdi), %rcx
	movl	$18, 24(%rax)
	movq	%rax, %rdx
	movq	%r13, (%rax)
	movq	%r12, 8(%rax)
	movq	$0, 16(%rax)
	call	list_append
	jmp	.L336
	.section .rdata,"dr"
	.align 8
.LC27:
	.ascii "[Warning] Unsupported class member type for tac_class: %d\12\0"
	.text
	.p2align 4
	.globl	tac_class
	.def	tac_class;	.scl	2;	.type	32;	.endef
tac_class:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r12
	leaq	.LC27(%rip), %r12
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$32, %rsp
	movaps	%xmm6, 32(%rsp)
	movq	%rcx, 24(%rdx)
	movq	8(%rcx), %rcx
	call	list_copy
	movl	$24, %ecx
	movq	(%rbx), %xmm6
	movq	%rax, %rsi
	call	alloc_memory
	movq	%rax, %rbx
	call	create_list
	movq	$0, 16(%rbx)
	movq	%rbx, %rdx
	movq	%rax, %xmm0
	punpcklqdq	%xmm6, %xmm0
	movups	%xmm0, (%rbx)
	movq	(%rdi), %rax
	movq	(%rax), %rcx
	call	list_append
	.p2align 4,,10
	.p2align 3
.L341:
	movq	%rsi, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L349
.L346:
	movl	8(%rax), %ebx
	testl	%ebx, %ebx
	je	.L342
	cmpl	$1, %ebx
	je	.L343
	call	__getreent
	movl	%ebx, %r8d
	movq	%r12, %rdx
	movq	24(%rax), %rcx
	call	fprintf
	movq	%rsi, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L346
.L349:
	movq	$0, 24(%rdi)
	movaps	32(%rsp), %xmm6
	leaq	-32(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L343:
	movq	(%rax), %rcx
	movl	$1, %r8d
	movq	%rdi, %rdx
	call	tac_variable
	jmp	.L341
	.p2align 4,,10
	.p2align 3
.L342:
	movq	(%rax), %rcx
	movq	%rdi, %rdx
	call	tac_method
	jmp	.L341
	.section .rdata,"dr"
	.align 8
.LC28:
	.ascii "[Warning] Unsupported symbol kind for import: %d\12\0"
	.text
	.p2align 4
	.globl	tac_import
	.def	tac_import;	.scl	2;	.type	32;	.endef
tac_import:
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	(%rcx), %rcx
	movl	32(%rcx), %ebx
	cmpl	$3, %ebx
	je	.L356
	leal	-1(%rbx), %eax
	cmpl	$1, %eax
	jbe	.L357
	testl	%ebx, %ebx
	jne	.L353
	movq	24(%rcx), %rcx
	addq	$40, %rsp
	movq	%r8, %rdx
	popq	%rbx
	popq	%rsi
	jmp	tac_class
	.p2align 4,,10
	.p2align 3
.L353:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC28(%rip), %rdx
	movq	24(%rax), %rcx
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L357:
	movq	(%rcx), %rdx
	movq	%r8, %r9
	movl	$102, %r8d
.L355:
	call	create_var
	movq	16(%rsi), %rcx
	addq	$40, %rsp
	popq	%rbx
	movq	%rax, %rdx
	popq	%rsi
	jmp	list_append
	.p2align 4,,10
	.p2align 3
.L356:
	movq	%r8, %r9
	movq	(%rcx), %rdx
	movl	$118, %r8d
	jmp	.L355
	.section .rdata,"dr"
.LC29:
	.ascii "main\0"
	.text
	.p2align 4
	.globl	tac_code
	.def	tac_code;	.scl	2;	.type	32;	.endef
tac_code:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r13
	leaq	.LC29(%rip), %r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	movl	$32, %ecx
	andq	$-16, %rsp
	subq	$32, %rsp
	call	alloc_memory
	movq	%rax, %r12
	call	create_list
	movq	$0, 8(%r12)
	movq	%rax, (%r12)
	call	create_list
	movq	%rax, 16(%r12)
	call	create_list
	movl	$96, %ecx
	movq	%rax, 24(%r12)
	call	alloc_memory
	movq	%r12, (%rax)
	movq	%rax, %rsi
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	call	create_list
	movq	%rax, 32(%rsi)
	call	create_list
	pxor	%xmm0, %xmm0
	movq	(%rbx), %rcx
	movq	%rax, 40(%rsi)
	movups	%xmm0, 48(%rsi)
	movups	%xmm0, 64(%rsi)
	movups	%xmm0, 80(%rsi)
	call	list_copy
	movq	%rax, %rdi
	.p2align 4,,10
	.p2align 3
.L359:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L367
.L365:
	movl	8(%rbx), %eax
	cmpl	$1, %eax
	je	.L368
	cmpl	$2, %eax
	je	.L369
	testl	%eax, %eax
	jne	.L359
	movq	(%rbx), %rcx
	movq	%rsi, %r8
	movq	%r12, %rdx
	call	tac_import
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L365
.L367:
	leaq	-40(%rbp), %rsp
	movq	%r12, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L368:
	movq	(%rbx), %rcx
	movq	%rsi, %rdx
	call	tac_function
	movq	(%rbx), %rax
	movq	%r13, %rdx
	movq	(%rax), %rbx
	movq	8(%rbx), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L359
	movq	%rbx, 8(%r12)
	jmp	.L359
	.p2align 4,,10
	.p2align 3
.L369:
	movq	(%rbx), %rcx
	movq	%rsi, %rdx
	call	tac_class
	jmp	.L359
	.section .rdata,"dr"
	.align 32
CSWTCH.21:
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
	.align 8
.LC16:
	.long	0
	.long	-1074790400
	.ident	"GCC: (GNU) 13.2.0"
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	list_is_empty;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	make_method_name;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.def	strtoll;	.scl	2;	.type	32;	.endef
	.def	strtod;	.scl	2;	.type	32;	.endef
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.DEFAULT_CONSTRUCTOR_NAME, "dr"
	.globl	.refptr.DEFAULT_CONSTRUCTOR_NAME
	.linkonce	discard
.refptr.DEFAULT_CONSTRUCTOR_NAME:
	.quad	DEFAULT_CONSTRUCTOR_NAME
	.section	.rdata$.refptr.name_void, "dr"
	.globl	.refptr.name_void
	.linkonce	discard
.refptr.name_void:
	.quad	name_void
	.section	.rdata$.refptr.name_bool, "dr"
	.globl	.refptr.name_bool
	.linkonce	discard
.refptr.name_bool:
	.quad	name_bool
	.section	.rdata$.refptr.name_string, "dr"
	.globl	.refptr.name_string
	.linkonce	discard
.refptr.name_string:
	.quad	name_string
	.section	.rdata$.refptr.name_float, "dr"
	.globl	.refptr.name_float
	.linkonce	discard
.refptr.name_float:
	.quad	name_float
	.section	.rdata$.refptr.name_int, "dr"
	.globl	.refptr.name_int
	.linkonce	discard
.refptr.name_int:
	.quad	name_int
