	.file	"tac.c"
	.text
	.p2align 4
	.def	search_var;	.scl	3;	.type	32;	.endef
search_var:
	pushq	%rbp
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	8(%rdx), %rax
	testq	%rax, %rax
	je	.L7
	movq	24(%rax), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L5
.L11:
	movq	8(%rsi), %rax
	testq	%rax, %rax
	je	.L7
	movq	16(%rax), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L31
.L7:
	cmpq	$0, 24(%rsi)
	movq	(%rsi), %rax
	je	.L4
	movq	(%rax), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L27
.L29:
	movq	(%rsi), %rax
.L4:
	movq	16(%rax), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L15
	movq	(%rsi), %rax
	movq	16(%rax), %rcx
	call	list_copy
	movq	%rax, %rbx
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L23:
	cmpq	%rdi, (%rax)
	je	.L1
.L22:
	movq	%rbx, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L23
.L15:
	xorl	%eax, %eax
.L1:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L27:
	movq	(%rsi), %rax
	movq	(%rax), %rcx
	call	list_copy
	movq	%rax, %rbp
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L21:
	movq	24(%rsi), %rax
	movq	(%rax), %rax
	cmpq	%rax, 8(%rbx)
	je	.L32
.L17:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L21
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L5:
	movq	8(%rsi), %rax
	movq	24(%rax), %rcx
	call	list_copy
	movq	%rax, %rbx
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L10:
	cmpq	%rdi, (%rax)
	je	.L1
.L8:
	movq	%rbx, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L10
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L31:
	movq	8(%rsi), %rax
	movq	16(%rax), %rcx
	call	list_copy
	movq	%rax, %rbx
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L13:
	cmpq	%rdi, (%rax)
	je	.L1
.L12:
	movq	%rbx, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L13
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L32:
	movq	(%rbx), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L17
	movq	(%rbx), %rcx
	call	list_copy
	movq	%rax, %rbx
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L20:
	movq	(%rax), %rax
	cmpq	%rdi, (%rax)
	je	.L1
.L19:
	movq	%rbx, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L20
	jmp	.L17
	.section .rdata,"dr"
.LC0:
	.ascii "\0"
.LC1:
	.ascii "$%d-error\0"
.LC2:
	.ascii "$%c%zu\0"
	.text
	.p2align 4
	.def	create_var;	.scl	3;	.type	32;	.endef
create_var:
	pushq	%r13
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rbp
	movl	%r8d, %ebp
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	movq	%r9, %rsi
	pushq	%rbx
	subq	$40, %rsp
	testq	%rcx, %rcx
	je	.L46
	movl	32(%rdx), %edx
	xorl	%r13d, %r13d
	testl	%edx, %edx
	jne	.L43
	movq	24(%rdi), %rax
	movq	24(%r9), %r13
	movq	%rax, 24(%r9)
.L43:
	movq	%rsi, %rdx
	movq	%r12, %rcx
	call	search_var
	movq	%rax, %rbx
	movl	32(%rdi), %eax
	testl	%eax, %eax
	jne	.L44
	movq	%r13, 24(%rsi)
.L44:
	testq	%rbx, %rbx
	je	.L46
.L33:
	addq	$40, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L46:
	movl	$24, %ecx
	call	alloc_memory
	movq	%r12, (%rax)
	movq	%rax, %rbx
	leal	-97(%rbp), %eax
	cmpl	$21, %eax
	ja	.L35
	leaq	.L37(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L37:
	.long	.L42-.L37
	.long	.L41-.L37
	.long	.L35-.L37
	.long	.L35-.L37
	.long	.L35-.L37
	.long	.L40-.L37
	.long	.L35-.L37
	.long	.L35-.L37
	.long	.L35-.L37
	.long	.L35-.L37
	.long	.L35-.L37
	.long	.L35-.L37
	.long	.L35-.L37
	.long	.L35-.L37
	.long	.L35-.L37
	.long	.L39-.L37
	.long	.L35-.L37
	.long	.L35-.L37
	.long	.L35-.L37
	.long	.L38-.L37
	.long	.L35-.L37
	.long	.L36-.L37
	.text
	.p2align 4,,10
	.p2align 3
.L35:
	movl	$32, %edx
	leaq	.LC0(%rip), %rcx
	call	create_string
	movl	%ebp, %r8d
	leaq	.LC1(%rip), %rdx
	movq	%rax, 8(%rbx)
	movq	%rax, %rcx
	call	sprintf
	movq	%rdi, 16(%rbx)
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L36:
	movq	64(%rsi), %r12
	leaq	1(%r12), %rax
	movq	%rax, 64(%rsi)
	.p2align 4,,10
	.p2align 3
.L48:
	leaq	.LC0(%rip), %rcx
	movl	$32, %edx
	call	create_string
	movq	%rax, 8(%rbx)
	movq	%rax, %rcx
	cmpq	$-1, %r12
	je	.L53
	movq	%r12, %r9
	movl	%ebp, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L50:
	andl	$-3, %ebp
	movq	%rdi, 16(%rbx)
	cmpl	$116, %ebp
	jne	.L33
	movq	8(%rsi), %rax
	movq	%rbx, %rdx
	movq	24(%rax), %rcx
	call	list_append
	addq	$40, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L38:
	movq	72(%rsi), %r12
	leaq	1(%r12), %rax
	movq	%rax, 72(%rsi)
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L39:
	movq	56(%rsi), %r12
	leaq	1(%r12), %rax
	movq	%rax, 56(%rsi)
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L40:
	movq	88(%rsi), %r12
	leaq	1(%r12), %rax
	movq	%rax, 88(%rsi)
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L41:
	movq	80(%rsi), %r12
	leaq	1(%r12), %rax
	movq	%rax, 80(%rsi)
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L42:
	movq	48(%rsi), %r12
	leaq	1(%r12), %rax
	movq	%rax, 48(%rsi)
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L53:
	movl	%ebp, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L50
	.p2align 4
	.def	load_rvalue.part.0;	.scl	3;	.type	32;	.endef
load_rvalue.part.0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r13
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	movq	8(%rcx), %r13
	movl	$24, %ecx
	call	alloc_memory
	movq	72(%rdi), %rsi
	movl	$32, %edx
	leaq	.LC0(%rip), %rcx
	movq	$0, (%rax)
	movq	%rax, %rbx
	leaq	1(%rsi), %rax
	movq	%rax, 72(%rdi)
	call	create_string
	movq	%rax, 8(%rbx)
	movq	%rax, %rcx
	cmpq	$-1, %rsi
	je	.L58
	movq	%rsi, %r9
	movl	$116, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L56:
	movq	8(%rdi), %rax
	movq	%r13, 16(%rbx)
	movq	%rbx, %rdx
	movq	24(%rax), %rcx
	call	list_append
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbx, %xmm0
	movl	$32, %ecx
	movhps	16(%rbx), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rsi
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movq	%r12, 8(%rax)
	movq	%rax, %rdx
	movq	%rsi, (%rax)
	movl	$23, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rdi), %rax
	movq	8(%rax), %rcx
	call	list_append
	leaq	-40(%rbp), %rsp
	movq	%rsi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L58:
	movl	$116, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L56
	.section .rdata,"dr"
	.align 8
.LC3:
	.ascii "[Warning] Unsupported variable access with NULL base\12\0"
	.align 8
.LC4:
	.ascii "[Warning] Failed to generate variable access for base\12\0"
	.align 8
.LC5:
	.ascii "[Warning] Attempting to access attribute of non-object type: %s\12\0"
	.align 8
.LC6:
	.ascii "[Warning] Attribute '%s' not found in type '%s'\12\0"
	.align 8
.LC7:
	.ascii "[Warning] Attempting to access function '%s' as attribute of type '%s'\12\0"
	.align 8
.LC8:
	.ascii "[Warning] Symbol '%s' in type '%s' is not an attribute\12\0"
.LC9:
	.ascii "arr\0"
	.align 8
.LC10:
	.ascii "[Warning] Attempting to index non-array type: %s\12\0"
	.align 8
.LC11:
	.ascii "[Warning] Failed to generate variable access for index\12\0"
	.align 8
.LC12:
	.ascii "[Warning] Attempting to call non-function, kind: %u, type name: %s\12\0"
	.align 8
.LC13:
	.ascii "[Warning] Unsupported type for size lookup: %s\12\0"
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
	movq	%rcx, %r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	andq	$-16, %rsp
	subq	$64, %rsp
	movl	16(%rcx), %r8d
	testl	%r8d, %r8d
	jne	.L60
	movq	8(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L60
	movl	32(%rcx), %eax
	leal	-1(%rax), %edx
	cmpl	$1, %edx
	jbe	.L130
	testl	%eax, %eax
	je	.L131
	movq	(%rcx), %rdx
	movq	%rbx, %r9
	movl	$118, %r8d
.L129:
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
.L59:
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
.L60:
	movq	0(%r13), %rcx
	testq	%rcx, %rcx
	je	.L132
	movq	%rbx, %rdx
	call	tac_variable_access
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L68
	cmpb	$0, 20(%rax)
	jne	.L133
.L67:
	movl	16(%r13), %edi
	cmpl	$2, %edi
	je	.L134
	cmpl	$3, %edi
	je	.L135
	cmpl	$1, %edi
	jne	.L85
	movl	16(%rsi), %edi
	testl	%edi, %edi
	jne	.L86
	movq	8(%rsi), %rax
	movl	32(%rax), %ecx
	testl	%ecx, %ecx
	je	.L136
.L87:
	movq	8(%rax), %rbx
	call	__getreent
	movl	%edi, %r8d
	leaq	.LC12(%rip), %rdx
	xorl	%edi, %edi
	movq	24(%rax), %rcx
	movq	%rbx, %r9
	call	fprintf
	jmp	.L59
	.p2align 4,,10
	.p2align 3
.L134:
	movq	8(%rsi), %rax
	movl	32(%rax), %edx
	leal	-1(%rdx), %ecx
	cmpl	$1, %ecx
	jbe	.L137
	movq	24(%rax), %rcx
	testl	%edx, %edx
	jne	.L71
	movq	16(%rcx), %rcx
.L71:
	movq	8(%r13), %rax
	movq	8(%rax), %rdx
	call	search_name_use_strcmp
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L138
	movl	32(%rax), %eax
	cmpl	$1, %eax
	je	.L139
	cmpl	$2, %eax
	je	.L140
	cmpl	$5, %eax
	jne	.L141
	movl	$24, %ecx
	movq	(%rdi), %rdi
	call	alloc_memory
	movq	72(%rbx), %r14
	movl	$32, %edx
	leaq	.LC0(%rip), %rcx
	movq	$0, (%rax)
	movq	%rax, %r12
	leaq	1(%r14), %rax
	movq	%rax, 72(%rbx)
	call	create_string
	movq	%rax, 8(%r12)
	movq	%rax, %rcx
	cmpq	$-1, %r14
	je	.L142
	movq	%r14, %r9
	movl	$116, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L77:
	movq	8(%rbx), %rax
	movq	%rdi, 16(%r12)
	movq	%r12, %rdx
	movq	24(%rax), %rcx
	call	list_append
	movl	$24, %ecx
	call	alloc_memory
	movq	%r12, %xmm0
	movq	%rbx, %r9
	movl	$97, %r8d
	movhps	16(%r12), %xmm0
	movb	$0, 20(%rax)
	movq	%rax, %rdi
	movups	%xmm0, (%rax)
	movq	8(%r13), %rcx
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
	movq	%rax, %r12
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movl	$15, 24(%rax)
	movq	%rax, %rdx
	jmp	.L127
	.p2align 4,,10
	.p2align 3
.L131:
	movq	%rbx, %r9
	movl	$118, %r8d
	movq	%rcx, %rdx
	jmp	.L129
	.p2align 4,,10
	.p2align 3
.L133:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L67
	.p2align 4,,10
	.p2align 3
.L68:
	call	__getreent
	movl	$54, %r8d
	movl	$1, %edx
	xorl	%edi, %edi
	movq	24(%rax), %r9
	leaq	.LC4(%rip), %rcx
	call	fwrite
	jmp	.L59
	.p2align 4,,10
	.p2align 3
.L135:
	movq	8(%rsi), %rax
	leaq	.LC9(%rip), %rdx
	movq	8(%rax), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L143
	movq	8(%r13), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L82
	cmpb	$0, 20(%rax)
	jne	.L144
.L81:
	movq	.refptr.name_int(%rip), %rax
	movl	$24, %ecx
	movq	(%rax), %rdi
	call	alloc_memory
	movq	72(%rbx), %r14
	movl	$32, %edx
	leaq	.LC0(%rip), %rcx
	movq	$0, (%rax)
	movq	%rax, %r13
	leaq	1(%r14), %rax
	movq	%rax, 72(%rbx)
	call	create_string
	movq	%rax, 8(%r13)
	movq	%rax, %rcx
	cmpq	$-1, %r14
	je	.L145
	movq	%r14, %r9
	movl	$116, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L84:
	movq	8(%rbx), %rax
	movq	%rdi, 16(%r13)
	movq	%r13, %rdx
	movq	24(%rax), %rcx
	call	list_append
	movl	$24, %ecx
	call	alloc_memory
	movq	%r13, %xmm0
	movl	$32, %ecx
	movhps	16(%r13), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rdi
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movl	$16, 24(%rax)
	movq	%rax, %rdx
.L127:
	movq	%rdi, (%rdx)
	movq	%rsi, 8(%rdx)
	movq	%r12, 16(%rdx)
	movb	$1, 20(%rdi)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L59
	.p2align 4,,10
	.p2align 3
.L86:
	leal	-7(%rdi), %eax
	cmpl	$1, %eax
	jbe	.L88
	movq	8(%rsi), %rax
	jmp	.L87
	.p2align 4,,10
	.p2align 3
.L136:
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	movq	8(%rax), %rcx
	movq	(%rdx), %rdx
	call	make_method_name
	movq	%rax, %rdx
	movq	8(%rsi), %rax
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
	movq	%rax, %rsi
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
.L88:
	call	create_list
	cmpl	$8, 16(%rsi)
	movq	%rax, 56(%rsp)
	je	.L89
.L91:
	xorl	%r12d, %r12d
.L90:
	movq	8(%r13), %rcx
	call	list_copy
	movq	%rax, 48(%rsp)
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L147:
	movq	.refptr.name_int(%rip), %r15
	cmpq	(%r15), %rax
	je	.L101
	movq	.refptr.name_float(%rip), %rdi
	cmpq	(%rdi), %rax
	je	.L101
	movq	.refptr.name_string(%rip), %rdx
	cmpq	(%rdx), %rax
	je	.L101
	movq	.refptr.name_bool(%rip), %rdx
	movl	$1, %r13d
	cmpq	(%rdx), %rax
	je	.L100
	movq	.refptr.name_void(%rip), %rdx
	cmpq	(%rdx), %rax
	je	.L100
	movl	32(%rax), %edx
	testl	%edx, %edx
	jne	.L102
	movq	24(%rax), %rax
	movq	24(%rax), %r13
.L100:
	movl	$24, %ecx
	addq	$1, %r12
	call	alloc_memory
	movl	$32, %ecx
	movl	$1, 16(%rax)
	movq	%rax, %rdi
	movq	%r13, (%rax)
	movq	(%r15), %rax
	movb	$0, 20(%rdi)
	movq	%rax, 8(%rdi)
	call	alloc_memory
	movq	56(%rsp), %rcx
	movl	$17, 24(%rax)
	movq	%rax, %rdx
	movq	%rdi, (%rax)
	movq	%r14, 8(%rax)
	movq	$0, 16(%rax)
	call	list_append
.L97:
	movq	48(%rsp), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L104
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L98
	cmpb	$0, 20(%rax)
	jne	.L146
.L99:
	movq	8(%r14), %rax
	testq	%rax, %rax
	jne	.L147
	movq	.refptr.name_int(%rip), %r15
	xorl	%r13d, %r13d
	jmp	.L100
	.p2align 4,,10
	.p2align 3
.L105:
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L104:
	movq	56(%rsp), %rcx
	call	list_pop
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L105
	movl	$24, %ecx
	movq	8(%rsi), %rdi
	call	alloc_memory
	movq	72(%rbx), %r14
	movl	$32, %edx
	leaq	.LC0(%rip), %rcx
	movq	$0, (%rax)
	movq	%rax, %r13
	leaq	1(%r14), %rax
	movq	%rax, 72(%rbx)
	call	create_string
	movq	%rax, 8(%r13)
	movq	%rax, %rcx
	cmpq	$-1, %r14
	je	.L148
	movq	%r14, %r9
	movl	$116, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L107:
	movq	8(%rbx), %rax
	movq	%rdi, 16(%r13)
	movq	%r13, %rdx
	movq	24(%rax), %rcx
	call	list_append
	movl	$24, %ecx
	call	alloc_memory
	movq	%r13, %xmm0
	movl	$24, %ecx
	movhps	16(%r13), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rdi
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movl	$32, %ecx
	movq	%r12, (%rax)
	movq	%rax, %r13
	movl	$1, 16(%rax)
	movq	.refptr.name_int(%rip), %rax
	movb	$0, 20(%r13)
	movq	(%rax), %rax
	movq	%rax, 8(%r13)
	call	alloc_memory
	movq	%rsi, 8(%rax)
	movq	%rax, %rdx
	movq	%rdi, (%rax)
	movq	%r13, 16(%rax)
	movl	$22, 24(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L59
	.p2align 4,,10
	.p2align 3
.L146:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r14
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L141:
	movq	8(%rsi), %rax
	xorl	%edi, %edi
	movq	8(%rax), %rsi
	movq	8(%r13), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movq	%rsi, %r9
	leaq	.LC8(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	call	fprintf
	jmp	.L59
	.p2align 4,,10
	.p2align 3
.L132:
	call	__getreent
	movl	$53, %r8d
	movl	$1, %edx
	xorl	%edi, %edi
	movq	24(%rax), %r9
	leaq	.LC3(%rip), %rcx
	call	fwrite
	jmp	.L59
	.p2align 4,,10
	.p2align 3
.L130:
	movq	(%rcx), %rdx
	movq	%rbx, %r9
	movl	$102, %r8d
.L128:
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
	jmp	.L59
	.p2align 4,,10
	.p2align 3
.L85:
	call	__getreent
	movl	%edi, %r8d
	leaq	.LC14(%rip), %rdx
	xorl	%edi, %edi
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L59
	.p2align 4,,10
	.p2align 3
.L142:
	movl	$116, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L77
	.p2align 4,,10
	.p2align 3
.L145:
	movl	$116, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L84
	.p2align 4,,10
	.p2align 3
.L148:
	movl	$116, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L107
	.p2align 4,,10
	.p2align 3
.L102:
	movq	8(%rax), %r13
	call	__getreent
	leaq	.LC13(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%r13, %r8
	call	fprintf
	.p2align 4,,10
	.p2align 3
.L101:
	movl	$8, %r13d
	jmp	.L100
	.p2align 4,,10
	.p2align 3
.L143:
	movq	(%rsi), %rax
	xorl	%edi, %edi
	movq	(%rax), %rax
	movq	8(%rax), %rbx
	call	__getreent
	leaq	.LC10(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	call	fprintf
	jmp	.L59
	.p2align 4,,10
	.p2align 3
.L139:
	movq	8(%rsi), %rax
	movq	8(%rax), %r12
	movq	8(%r13), %rax
	movq	8(%rax), %rsi
	call	__getreent
	movq	%r12, %r9
	leaq	.LC7(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rsi, %r8
	call	fprintf
	movq	(%rdi), %rdx
	movq	%rbx, %r9
	movq	%rdi, %rcx
	movl	$102, %r8d
	jmp	.L128
	.p2align 4,,10
	.p2align 3
.L144:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L81
.L82:
	call	__getreent
	movl	$55, %r8d
	movl	$1, %edx
	xorl	%edi, %edi
	movq	24(%rax), %r9
	leaq	.LC11(%rip), %rcx
	call	fwrite
	jmp	.L59
	.p2align 4,,10
	.p2align 3
.L140:
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
	jmp	.L59
	.p2align 4,,10
	.p2align 3
.L89:
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax
	movq	(%rax), %rdx
	movq	8(%rsi), %rax
	movq	8(%rax), %rcx
	call	make_method_name
	movq	%rax, %rdx
	movq	(%rsi), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L91
	movq	0(%r13), %rax
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
	je	.L92
	cmpb	$0, 20(%rax)
	jne	.L149
.L93:
	movq	8(%r14), %rax
	testq	%rax, %rax
	je	.L108
	movq	.refptr.name_int(%rip), %r15
	cmpq	(%r15), %rax
	je	.L95
	movq	.refptr.name_float(%rip), %rdx
	cmpq	(%rdx), %rax
	je	.L95
	movq	.refptr.name_string(%rip), %rdx
	cmpq	(%rdx), %rax
	je	.L95
	movq	.refptr.name_bool(%rip), %rdx
	movl	$1, %edi
	cmpq	(%rdx), %rax
	je	.L94
	movq	.refptr.name_void(%rip), %rdx
	cmpq	(%rdx), %rax
	je	.L94
	cmpl	$0, 32(%rax)
	jne	.L96
	movq	24(%rax), %rax
	movq	24(%rax), %rdi
.L94:
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movq	%rax, %r12
	movl	$1, 16(%rax)
	movq	%rdi, (%rax)
	movq	(%r15), %rax
	movb	$0, 20(%r12)
	movq	%rax, 8(%r12)
	call	alloc_memory
	movq	56(%rsp), %rcx
	movq	%r12, (%rax)
	movq	%rax, %rdx
	movl	$1, %r12d
	movl	$17, 24(%rax)
	movq	%r14, 8(%rax)
	movq	$0, 16(%rax)
	call	list_append
	jmp	.L90
	.p2align 4,,10
	.p2align 3
.L137:
	movq	8(%rax), %rbx
	xorl	%edi, %edi
	call	__getreent
	leaq	.LC5(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	call	fprintf
	jmp	.L59
.L138:
	movq	8(%rsi), %rax
	xorl	%edi, %edi
	movq	8(%rax), %rsi
	movq	8(%r13), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movq	%rsi, %r9
	leaq	.LC6(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	call	fprintf
	jmp	.L59
.L108:
	movq	.refptr.name_int(%rip), %r15
	xorl	%edi, %edi
	jmp	.L94
.L149:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r14
	jmp	.L93
.L96:
	movq	8(%rax), %r12
	call	__getreent
	leaq	.LC13(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%r12, %r8
	call	fprintf
.L95:
	movl	$8, %edi
	jmp	.L94
	.section	.text.unlikely,"x"
	.def	tac_variable_access.cold;	.scl	3;	.type	32;	.endef
tac_variable_access.cold:
.L92:
	movq	8, %rax
	ud2
.L98:
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
	ja	.L151
	movq	%rdx, %rsi
	leaq	.L153(%rip), %rdx
	movslq	(%rdx,%rbx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L153:
	.long	.L161-.L153
	.long	.L160-.L153
	.long	.L159-.L153
	.long	.L158-.L153
	.long	.L157-.L153
	.long	.L156-.L153
	.long	.L155-.L153
	.long	.L154-.L153
	.long	.L152-.L153
	.text
	.p2align 4,,10
	.p2align 3
.L154:
	movq	(%rcx), %rcx
	movq	%rsi, %rdx
	call	tac_primary
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L166
	cmpb	$0, 20(%rax)
	jne	.L178
.L167:
	movl	$24, %ecx
	movq	8(%r12), %r13
	call	alloc_memory
	movq	72(%rsi), %rbx
	movl	$32, %edx
	leaq	.LC0(%rip), %rcx
	movq	$0, (%rax)
	movq	%rax, %rdi
	leaq	1(%rbx), %rax
	movq	%rax, 72(%rsi)
	call	create_string
	movq	%rax, 8(%rdi)
	movq	%rax, %rcx
	cmpq	$-1, %rbx
	je	.L179
	movq	%rbx, %r9
	movl	$116, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L169:
	movq	8(%rsi), %rax
	movq	%r13, 16(%rdi)
	movq	%rdi, %rdx
	movq	24(%rax), %rcx
	call	list_append
	movl	$24, %ecx
	call	alloc_memory
	movq	%rdi, %xmm0
	movhps	16(%rdi), %xmm0
	movq	.refptr.name_int(%rip), %rdi
	movb	$0, 20(%rax)
	movq	%rax, %rbx
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movq	8(%r12), %rax
	cmpq	(%rdi), %rax
	je	.L180
	movq	.refptr.name_float(%rip), %r13
	cmpq	0(%r13), %rax
	je	.L181
	movq	8(%rax), %rbx
	call	__getreent
	leaq	.LC17(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	xorl	%ebx, %ebx
	call	fprintf
	jmp	.L150
	.p2align 4,,10
	.p2align 3
.L152:
	movq	(%rcx), %rcx
	movaps	32(%rsp), %xmm6
	leaq	-40(%rbp), %rsp
	movq	%rsi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	jmp	tac_variable_access
	.p2align 4,,10
	.p2align 3
.L161:
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
.L150:
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
.L160:
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
	jmp	.L150
	.p2align 4,,10
	.p2align 3
.L159:
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
	jmp	.L150
	.p2align 4,,10
	.p2align 3
.L158:
	movl	$24, %ecx
	call	alloc_memory
	movb	$1, (%rax)
	movq	%rax, %rbx
	movl	$4, 16(%rax)
	movq	.refptr.name_bool(%rip), %rax
	movq	(%rax), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	jmp	.L150
	.p2align 4,,10
	.p2align 3
.L157:
	movl	$24, %ecx
	call	alloc_memory
	movb	$0, (%rax)
	movq	%rax, %rbx
	movl	$4, 16(%rax)
	movq	.refptr.name_bool(%rip), %rax
	movq	(%rax), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	jmp	.L150
	.p2align 4,,10
	.p2align 3
.L156:
	movq	(%rcx), %rcx
	movaps	32(%rsp), %xmm6
	leaq	-40(%rbp), %rsp
	movq	%rsi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	jmp	tac_expression
	.p2align 4,,10
	.p2align 3
.L155:
	movq	(%rcx), %rcx
	movq	%rsi, %rdx
	call	tac_primary
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L163
	cmpb	$0, 20(%rax)
	jne	.L182
.L163:
	movq	.refptr.name_bool(%rip), %rax
	movl	$24, %ecx
	movq	(%rax), %r13
	call	alloc_memory
	movq	72(%rsi), %rbx
	movl	$32, %edx
	leaq	.LC0(%rip), %rcx
	movq	$0, (%rax)
	movq	%rax, %rdi
	leaq	1(%rbx), %rax
	movq	%rax, 72(%rsi)
	call	create_string
	movq	%rax, 8(%rdi)
	movq	%rax, %rcx
	cmpq	$-1, %rbx
	je	.L183
	movq	%rbx, %r9
	movl	$116, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L165:
	movq	8(%rsi), %rax
	movq	%r13, 16(%rdi)
	movq	%rdi, %rdx
	movq	24(%rax), %rcx
	call	list_append
	movl	$24, %ecx
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
	jmp	.L150
.L151:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC18(%rip), %rdx
	xorl	%ebx, %ebx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L150
	.p2align 4,,10
	.p2align 3
.L181:
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movl	$2, 16(%rax)
	movq	%rax, %rdi
	movq	.LC16(%rip), %rax
	movb	$0, 20(%rdi)
	movq	%rax, (%rdi)
	movq	0(%r13), %rax
	movq	%rax, 8(%rdi)
	call	alloc_memory
	movl	$2, 24(%rax)
	movq	%rax, %rdx
	movq	%rbx, (%rax)
	movq	%rdi, 8(%rax)
	movq	%r12, 16(%rax)
.L171:
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L150
	.p2align 4,,10
	.p2align 3
.L179:
	movl	$116, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L169
	.p2align 4,,10
	.p2align 3
.L183:
	movl	$116, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L165
	.p2align 4,,10
	.p2align 3
.L182:
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r12
	jmp	.L163
	.p2align 4,,10
	.p2align 3
.L178:
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r12
	jmp	.L167
	.p2align 4,,10
	.p2align 3
.L180:
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movl	$1, 16(%rax)
	movq	%rax, %r13
	movq	$0, (%rax)
	movq	(%rdi), %rax
	movb	$0, 20(%r13)
	movq	%rax, 8(%r13)
	call	alloc_memory
	movl	$1, 24(%rax)
	movq	%rax, %rdx
	movq	%rbx, (%rax)
	movq	%r13, 8(%rax)
	movq	%r12, 16(%rax)
	jmp	.L171
	.section	.text.unlikely,"x"
	.def	tac_primary.cold;	.scl	3;	.type	32;	.endef
tac_primary.cold:
.L166:
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	cmpl	$19, 24(%rcx)
	je	.L209
	movq	16(%rcx), %rcx
	call	tac_expression
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L186
	cmpb	$0, 20(%rax)
	jne	.L210
.L186:
	movl	24(%r12), %eax
	movq	(%r12), %rcx
	cmpl	$18, %eax
	ja	.L187
	leaq	CSWTCH.21(%rip), %rdx
	movl	(%rdx,%rax,4), %r13d
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rdi
	movl	24(%r12), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L188
	cmpl	$14, %r13d
	jne	.L198
	movl	16(%rdi), %eax
	testl	%eax, %eax
	jne	.L211
.L193:
	movl	$32, %ecx
	call	alloc_memory
	movl	$14, 24(%rax)
	movq	%rax, %rdx
	movq	%rdi, (%rax)
	movq	%rsi, 8(%rax)
	movq	$0, 16(%rax)
	cmpb	$0, 20(%rdi)
	jne	.L212
.L194:
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	leaq	-56(%rbp), %rsp
	movq	%rsi, %rax
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
.L187:
	movq	%rbx, %rdx
	movl	$25, %r13d
	call	tac_expression
	movq	%rax, %rdi
	movl	24(%r12), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L188
.L198:
	movl	$24, %ecx
	movq	8(%rdi), %r12
	call	alloc_memory
	movq	72(%rbx), %r15
	movl	$32, %edx
	leaq	.LC0(%rip), %rcx
	movq	$0, (%rax)
	movq	%rax, %r14
	leaq	1(%r15), %rax
	movq	%rax, 72(%rbx)
	call	create_string
	movq	%rax, 8(%r14)
	movq	%rax, %rcx
	cmpq	$-1, %r15
	je	.L213
	movq	%r15, %r9
	movl	$116, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L191:
	movq	8(%rbx), %rax
	movq	%r12, 16(%r14)
	movq	%r14, %rdx
	movq	24(%rax), %rcx
	call	list_append
	movl	$24, %ecx
	call	alloc_memory
	movq	%r14, %xmm0
	movhps	16(%r14), %xmm0
	movb	$0, 20(%rax)
	movq	%rax, %r12
	movq	%rdi, %r14
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	cmpb	$0, 20(%rdi)
	jne	.L214
.L192:
	movl	$32, %ecx
	call	alloc_memory
	movq	%r14, 8(%rax)
	movq	%rax, %rdx
	movq	%rsi, 16(%rax)
	movq	%r12, %rsi
	movl	%r13d, 24(%rax)
	movq	%r12, (%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	16(%rdi), %eax
	testl	%eax, %eax
	je	.L193
.L211:
	call	__getreent
	movl	$57, %r8d
	movl	$1, %edx
	leaq	.LC20(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L193
	.p2align 4,,10
	.p2align 3
.L188:
	movl	$24, %ecx
	movq	8(%rdi), %r12
	call	alloc_memory
	movq	72(%rbx), %r15
	movl	$32, %edx
	leaq	.LC0(%rip), %rcx
	movq	$0, (%rax)
	movq	%rax, %r14
	leaq	1(%r15), %rax
	movq	%rax, 72(%rbx)
	call	create_string
	movq	%rax, 8(%r14)
	movq	%rax, %rcx
	cmpq	$-1, %r15
	je	.L215
	movq	%r15, %r9
	movl	$116, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L196:
	movq	8(%rbx), %rax
	movq	%r12, 16(%r14)
	movq	%r14, %rdx
	movq	24(%rax), %rcx
	call	list_append
	movl	$24, %ecx
	call	alloc_memory
	movq	%r14, %xmm0
	movhps	16(%r14), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r12
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	cmpb	$0, 20(%rdi)
	jne	.L216
.L197:
	movl	$32, %ecx
	call	alloc_memory
	movq	%rsi, 16(%rax)
	movq	%rax, %rdx
	movq	%r12, %rsi
	movl	%r13d, 24(%rax)
	movq	%r12, (%rax)
	movq	%rdi, 8(%rax)
	jmp	.L194
	.p2align 4,,10
	.p2align 3
.L209:
	movq	8(%rcx), %rcx
	leaq	-56(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	tac_primary
	.p2align 4,,10
	.p2align 3
.L215:
	movl	$116, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L196
	.p2align 4,,10
	.p2align 3
.L213:
	movl	$116, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L191
	.p2align 4,,10
	.p2align 3
.L212:
	movl	$32, %ecx
	call	alloc_memory
	movl	$24, 24(%rax)
	movq	%rax, %rdx
	movq	%rdi, (%rax)
	movq	%rsi, 8(%rax)
	movq	$0, 16(%rax)
	jmp	.L194
	.p2align 4,,10
	.p2align 3
.L210:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rsi
	jmp	.L186
	.p2align 4,,10
	.p2align 3
.L216:
	movq	%rdi, %rcx
	movq	%rbx, %rdx
	call	load_rvalue.part.0
	movq	%rax, %rdi
	jmp	.L197
	.p2align 4,,10
	.p2align 3
.L214:
	movq	%rbx, %rdx
	movq	%rdi, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r14
	jmp	.L192
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
	je	.L218
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
	jne	.L245
	call	__getreent
	movl	$44, %r8d
	movl	$1, %edx
	leaq	.LC21(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
.L227:
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
.L218:
	movq	(%rcx), %rdx
	movq	8(%rcx), %rcx
	movq	%rbx, %r9
	movl	$118, %r8d
	call	create_var
	movq	16(%rsi), %rcx
	movq	%rax, %rdi
	testq	%rcx, %rcx
	je	.L229
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L230
	cmpb	$0, 20(%rax)
	jne	.L246
.L230:
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
.L244:
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
.L245:
	movq	16(%rdi), %rax
	movq	%rax, 16(%rsi)
	testq	%r12, %r12
	je	.L220
	movq	.refptr.name_int(%rip), %rdx
	cmpq	(%rdx), %r12
	je	.L242
	movq	.refptr.name_float(%rip), %rdx
	cmpq	(%rdx), %r12
	je	.L242
	movq	.refptr.name_string(%rip), %rdx
	cmpq	(%rdx), %r12
	je	.L242
	movq	.refptr.name_bool(%rip), %rdx
	cmpq	(%rdx), %r12
	je	.L243
	movq	.refptr.name_void(%rip), %rdx
	cmpq	(%rdx), %r12
	je	.L243
	movl	32(%r12), %edx
	testl	%edx, %edx
	jne	.L226
	movq	24(%r12), %rdx
	addq	24(%rdx), %rax
	.p2align 4,,10
	.p2align 3
.L220:
	movq	(%rdi), %rcx
	movq	%rax, 16(%rdi)
	movq	%rsi, %rdx
	testq	%rcx, %rcx
	jne	.L244
	jmp	.L227
	.p2align 4,,10
	.p2align 3
.L229:
	movl	$24, %ecx
	call	alloc_memory
	movq	$0, (%rax)
	movq	%rax, %rsi
	movl	$1, 16(%rax)
	movq	.refptr.name_int(%rip), %rax
	movb	$0, 20(%rsi)
	movq	(%rax), %rax
	movq	%rax, 8(%rsi)
	jmp	.L230
	.p2align 4,,10
	.p2align 3
.L246:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rsi
	jmp	.L230
.L226:
	movq	8(%r12), %rbx
	call	__getreent
	leaq	.LC13(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	call	fprintf
	movq	16(%rdi), %rax
	.p2align 4,,10
	.p2align 3
.L242:
	addq	$8, %rax
	jmp	.L220
	.p2align 4,,10
	.p2align 3
.L243:
	addq	$1, %rax
	jmp	.L220
	.p2align 4
	.globl	tac_if
	.def	tac_if;	.scl	2;	.type	32;	.endef
tac_if:
	pushq	%r15
	leaq	.LC0(%rip), %r15
	pushq	%r14
	movq	%rcx, %r14
	movl	$24, %ecx
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$72, %rsp
	call	alloc_memory
	movq	80(%rbx), %rsi
	movq	%r15, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %rdi
	leaq	1(%rsi), %rax
	movq	%rax, 80(%rbx)
	call	create_string
	movq	%rax, 8(%rdi)
	movq	%rax, %rcx
	cmpq	$-1, %rsi
	je	.L289
	movq	%rsi, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L249:
	movq	$0, 16(%rdi)
	movl	$24, %ecx
	call	alloc_memory
	movq	80(%rbx), %rbp
	movq	%r15, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %rsi
	leaq	1(%rbp), %rax
	movq	%rax, 80(%rbx)
	call	create_string
	movq	%rax, 8(%rsi)
	movq	%rax, %rcx
	cmpq	$-1, %rbp
	je	.L290
	movq	%rbp, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L251:
	movq	$0, 16(%rsi)
	movq	16(%r14), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L256
	movq	24(%r14), %rcx
	call	list_is_empty
	movq	%rsi, 56(%rsp)
	testb	%al, %al
	je	.L256
.L255:
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
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L258
	cmpb	$0, 20(%rax)
	jne	.L291
.L258:
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
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movb	$0, 20(%rax)
	movq	%rax, 32(%rsp)
	call	alloc_memory
	movq	32(%rsp), %r8
	movq	%rax, %rdx
	movq	%rbp, 16(%rax)
	movq	%r8, 8(%rax)
	movl	$19, 24(%rax)
	movq	%r12, (%rax)
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
	jmp	.L259
	.p2align 4,,10
	.p2align 3
.L260:
	movq	%rbx, %rdx
	call	tac_statement
.L259:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L260
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
	je	.L292
.L261:
	movq	24(%r14), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L293
.L273:
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
.L256:
	movl	$24, %ecx
	call	alloc_memory
	movq	80(%rbx), %rbp
	movq	%r15, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %r13
	movq	%rax, 56(%rsp)
	leaq	1(%rbp), %rax
	movq	%rax, 80(%rbx)
	call	create_string
	movq	%rax, 8(%r13)
	movq	%rax, %rcx
	cmpq	$-1, %rbp
	je	.L294
	movq	%rbp, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L257:
	movq	56(%rsp), %rax
	movq	$0, 16(%rax)
	jmp	.L255
	.p2align 4,,10
	.p2align 3
.L294:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L257
	.p2align 4,,10
	.p2align 3
.L290:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L251
	.p2align 4,,10
	.p2align 3
.L289:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L249
	.p2align 4,,10
	.p2align 3
.L293:
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
	jmp	.L274
	.p2align 4,,10
	.p2align 3
.L275:
	movq	%rbx, %rdx
	call	tac_statement
.L274:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L275
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
	jmp	.L273
	.p2align 4,,10
	.p2align 3
.L292:
	movq	16(%r14), %rcx
	call	list_copy
	movq	%rax, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L262:
	movq	32(%rsp), %rcx
	call	list_pop
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L261
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
	movl	$24, %ecx
	call	alloc_memory
	movq	80(%rbx), %rsi
	movq	%r15, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %rdi
	leaq	1(%rsi), %rax
	movq	%rax, 80(%rbx)
	call	create_string
	movq	%rax, 8(%rdi)
	movq	%rax, %rcx
	cmpq	$-1, %rsi
	je	.L295
	movq	%rsi, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L264:
	movq	$0, 16(%rdi)
	movl	$24, %ecx
	call	alloc_memory
	movq	80(%rbx), %rbp
	movq	%r15, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %rsi
	leaq	1(%rbp), %rax
	movq	%rax, 80(%rbx)
	call	create_string
	movq	%rax, 8(%rsi)
	movq	%rax, %rcx
	cmpq	$-1, %rbp
	je	.L296
	movq	%rbp, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L266:
	movq	$0, 16(%rsi)
	movq	(%r12), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L267
	cmpb	$0, 20(%rax)
	jne	.L297
.L267:
	movq	32(%rsp), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L298
.L269:
	movl	$24, %ecx
	call	alloc_memory
	movl	$24, %ecx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rsi, (%rax)
	movb	$0, 20(%rax)
	movq	%rax, 48(%rsp)
	call	alloc_memory
	movl	$32, %ecx
	movq	%rdi, (%rax)
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movb	$0, 20(%rax)
	movq	%rax, 40(%rsp)
	call	alloc_memory
	movq	40(%rsp), %r9
	movq	48(%rsp), %r8
	movq	%rax, %rdx
	movq	%rbp, (%rax)
	movq	%r9, 8(%rax)
	movq	%r8, 16(%rax)
	movl	$19, 24(%rax)
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
	movq	8(%r12), %rcx
	call	list_copy
	movq	%rax, %rdi
	jmp	.L270
	.p2align 4,,10
	.p2align 3
.L271:
	movq	%rbx, %rdx
	call	tac_statement
.L270:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L271
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
	jmp	.L262
	.p2align 4,,10
	.p2align 3
.L296:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L266
	.p2align 4,,10
	.p2align 3
.L295:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L264
	.p2align 4,,10
	.p2align 3
.L298:
	movq	24(%r14), %rcx
	call	list_is_empty
	testb	%al, %al
	cmovne	56(%rsp), %rsi
	jmp	.L269
	.p2align 4,,10
	.p2align 3
.L297:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rbp
	jmp	.L267
.L291:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r12
	jmp	.L258
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
	ja	.L300
	movq	%rdx, %rdi
	leaq	.L302(%rip), %rdx
	movq	%rcx, %rsi
	movslq	(%rdx,%rbx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L302:
	.long	.L309-.L302
	.long	.L308-.L302
	.long	.L307-.L302
	.long	.L306-.L302
	.long	.L305-.L302
	.long	.L304-.L302
	.long	.L303-.L302
	.long	.L301-.L302
	.text
	.p2align 4,,10
	.p2align 3
.L303:
	movq	32(%rdi), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L312
	movq	32(%rdi), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	je	.L312
.L332:
	movl	$32, %ecx
	call	alloc_memory
	movl	$20, 24(%rax)
	movq	%rax, %rdx
	jmp	.L330
	.p2align 4,,10
	.p2align 3
.L301:
	movq	40(%rdi), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L313
	movq	40(%rdi), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L332
.L313:
	call	__getreent
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC24(%rip), %rcx
	movq	24(%rax), %r9
	jmp	.L331
	.p2align 4,,10
	.p2align 3
.L307:
	movq	(%rcx), %rcx
	addq	$32, %rsp
	movq	%rdi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	tac_if
	.p2align 4,,10
	.p2align 3
.L309:
	movq	(%rcx), %rcx
	movq	%rdi, %rdx
	call	tac_expression
	testq	%rax, %rax
	je	.L299
	cmpb	$0, 20(%rax)
	jne	.L333
.L299:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L308:
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
.L305:
	movq	(%rcx), %rcx
	addq	$32, %rsp
	movq	%rdi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	tac_for
	.p2align 4,,10
	.p2align 3
.L304:
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
	je	.L311
	movq	%rdi, %rdx
	call	tac_expression
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L311
	cmpb	$0, 20(%rax)
	jne	.L334
.L311:
	movl	$32, %ecx
	call	alloc_memory
	movl	$21, 24(%rax)
	movq	%rax, %rdx
.L330:
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
.L306:
	movq	(%rcx), %rcx
	addq	$32, %rsp
	movq	%rdi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	tac_while
	.p2align 4,,10
	.p2align 3
.L312:
	call	__getreent
	movl	$49, %r8d
	movl	$1, %edx
	leaq	.LC23(%rip), %rcx
	movq	24(%rax), %r9
.L331:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	fwrite
.L300:
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
.L334:
	movq	%rdi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rbx
	jmp	.L311
	.p2align 4,,10
	.p2align 3
.L333:
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
	subq	$56, %rsp
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L336
	xorl	%r8d, %r8d
	call	tac_variable
.L336:
	movl	$24, %ecx
	leaq	.LC0(%rip), %r15
	call	alloc_memory
	movq	80(%rbx), %rsi
	movq	%r15, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %rbp
	leaq	1(%rsi), %rax
	movq	%rax, 80(%rbx)
	call	create_string
	movq	%rax, 8(%rbp)
	movq	%rax, %rcx
	cmpq	$-1, %rsi
	je	.L367
	movq	%rsi, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L338:
	movq	$0, 16(%rbp)
	movl	$24, %ecx
	call	alloc_memory
	movq	80(%rbx), %rsi
	movq	%r15, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %r13
	leaq	1(%rsi), %rax
	movq	%rax, 80(%rbx)
	call	create_string
	movq	%rax, 8(%r13)
	movq	%rax, %rcx
	cmpq	$-1, %rsi
	je	.L368
	movq	%rsi, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L340:
	movq	$0, 16(%r13)
	movl	$24, %ecx
	call	alloc_memory
	movq	80(%rbx), %rsi
	movq	%r15, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %r12
	leaq	1(%rsi), %rax
	movq	%rax, 80(%rbx)
	call	create_string
	movq	%rax, 8(%r12)
	movq	%rax, %rcx
	cmpq	$-1, %rsi
	je	.L369
	movq	%rsi, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L342:
	cmpq	$0, 8(%rdi)
	movl	$24, %ecx
	movq	$0, 16(%r12)
	je	.L343
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
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L344
	cmpb	$0, 20(%rax)
	jne	.L370
.L344:
	movl	$24, %ecx
	movq	%r8, 40(%rsp)
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
	movq	40(%rsp), %r8
	movq	%r14, 8(%rax)
	movq	%rax, %rdx
	movl	$19, 24(%rax)
	movq	%r8, (%rax)
	movq	%rsi, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L345:
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
	movl	$24, %ecx
	call	alloc_memory
	movq	80(%rbx), %rsi
	movq	%r15, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %r14
	leaq	1(%rsi), %rax
	movq	%rax, 80(%rbx)
	call	create_string
	movq	%rax, 8(%r14)
	movq	%rax, %rcx
	cmpq	$-1, %rsi
	je	.L371
	movq	%rsi, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L347:
	cmpq	$0, 16(%rdi)
	movq	$0, 16(%r14)
	movl	$24, %ecx
	je	.L348
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r14, (%rax)
	call	list_append
.L349:
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
	jmp	.L351
	.p2align 4,,10
	.p2align 3
.L352:
	movq	%rbx, %rdx
	call	tac_statement
.L351:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L352
	movq	40(%rbx), %rcx
	call	list_pop_back
	movq	32(%rbx), %rcx
	call	list_pop_back
	cmpq	$0, 16(%rdi)
	je	.L354
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
	je	.L354
	cmpb	$0, 20(%rax)
	jne	.L372
.L354:
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
	je	.L373
.L356:
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
	.p2align 4,,10
	.p2align 3
.L348:
	cmpq	$0, 8(%rdi)
	je	.L350
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	call	list_append
	jmp	.L349
	.p2align 4,,10
	.p2align 3
.L371:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L347
	.p2align 4,,10
	.p2align 3
.L369:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L342
	.p2align 4,,10
	.p2align 3
.L368:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L340
	.p2align 4,,10
	.p2align 3
.L367:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L338
	.p2align 4,,10
	.p2align 3
.L343:
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
	jmp	.L345
	.p2align 4,,10
	.p2align 3
.L372:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	jmp	.L354
	.p2align 4,,10
	.p2align 3
.L373:
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
	jmp	.L356
	.p2align 4,,10
	.p2align 3
.L350:
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	call	list_append
	jmp	.L349
	.p2align 4,,10
	.p2align 3
.L370:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r8
	jmp	.L344
	.p2align 4
	.globl	tac_while
	.def	tac_while;	.scl	2;	.type	32;	.endef
tac_while:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	leaq	.LC0(%rip), %r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rcx, %rsi
	movl	$24, %ecx
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$40, %rsp
	call	alloc_memory
	movq	80(%rbx), %rbp
	movq	%r13, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %rdi
	leaq	1(%rbp), %rax
	movq	%rax, 80(%rbx)
	call	create_string
	movq	%rax, 8(%rdi)
	movq	%rax, %rcx
	cmpq	$-1, %rbp
	je	.L388
	movq	%rbp, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L376:
	movq	$0, 16(%rdi)
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %rbp
	movq	$0, 8(%rax)
	movq	%rdi, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	%rax, %rdx
	movq	%rbp, (%rax)
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
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
	movl	$24, %ecx
	call	alloc_memory
	movq	80(%rbx), %rbp
	movq	%r13, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %r12
	leaq	1(%rbp), %rax
	movq	%rax, 80(%rbx)
	call	create_string
	movq	%rax, 8(%r12)
	movq	%rax, %rcx
	cmpq	$-1, %rbp
	je	.L389
	movq	%rbp, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L378:
	movq	$0, 16(%r12)
	movl	$24, %ecx
	call	alloc_memory
	movq	80(%rbx), %r14
	movq	%r13, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %rbp
	leaq	1(%r14), %rax
	movq	%rax, 80(%rbx)
	call	create_string
	movq	%rax, 8(%rbp)
	movq	%rax, %rcx
	cmpq	$-1, %r14
	je	.L390
	movq	%r14, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L380:
	movq	$0, 16(%rbp)
	movq	(%rsi), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L381
	cmpb	$0, 20(%rax)
	jne	.L391
.L381:
	movl	$24, %ecx
	call	alloc_memory
	movl	$24, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %r13
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movl	$32, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %r14
	movq	$0, 8(%rax)
	movq	%r12, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	%rax, %rdx
	movq	%r14, 8(%rax)
	movq	%r13, 16(%rax)
	movl	$19, 24(%rax)
	movq	%r15, (%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movq	%r12, (%rax)
	movq	%rax, %r13
	call	create_list
	movq	%r13, %rdx
	movq	%rax, 8(%r13)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%r13, 16(%rbx)
	movl	$24, %ecx
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rdi, (%rax)
	call	list_append
	movl	$24, %ecx
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	32(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	call	list_append
	movq	8(%rsi), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L382
	.p2align 4,,10
	.p2align 3
.L383:
	movq	%rbx, %rdx
	call	tac_statement
.L382:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L383
	movq	40(%rbx), %rcx
	call	list_pop_back
	movq	32(%rbx), %rcx
	call	list_pop_back
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movq	%rdi, (%rax)
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
	movq	%rbp, (%rax)
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
.L388:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L376
	.p2align 4,,10
	.p2align 3
.L390:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L380
	.p2align 4,,10
	.p2align 3
.L389:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L378
	.p2align 4,,10
	.p2align 3
.L391:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r15
	jmp	.L381
	.p2align 4
	.globl	tac_function
	.def	tac_function;	.scl	2;	.type	32;	.endef
tac_function:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$32, %rsp
	movaps	%xmm6, 32(%rsp)
	movdqu	(%rcx), %xmm6
	movq	%rcx, 16(%rbp)
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
	movq	16(%rbp), %rax
	movq	16(%rax), %rcx
	call	list_copy
	movq	%rax, %rdi
	jmp	.L393
	.p2align 4,,10
	.p2align 3
.L399:
	movq	16(%rsi), %rcx
	movq	%r15, %rdx
	call	list_append
.L393:
	movq	%rdi, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L410
	movq	8(%rax), %r13
	movq	(%rax), %r14
	testq	%r13, %r13
	je	.L400
	movl	32(%r14), %edx
	xorl	%r12d, %r12d
	testl	%edx, %edx
	jne	.L397
	movq	24(%r14), %rax
	movq	24(%rbx), %r12
	movq	%rax, 24(%rbx)
.L397:
	movq	%rbx, %rdx
	movq	%r13, %rcx
	call	search_var
	movq	%rax, %r15
	movl	32(%r14), %eax
	testl	%eax, %eax
	jne	.L398
	movq	%r12, 24(%rbx)
.L398:
	testq	%r15, %r15
	jne	.L399
.L400:
	movl	$24, %ecx
	call	alloc_memory
	leaq	.LC0(%rip), %rcx
	movl	$32, %edx
	movq	%r13, (%rax)
	movq	56(%rbx), %r13
	movq	%rax, %r15
	leaq	1(%r13), %rax
	movq	%rax, 56(%rbx)
	call	create_string
	movq	%rax, 8(%r15)
	movq	%rax, %rcx
	cmpq	$-1, %r13
	je	.L411
	movq	%r13, %r9
	movl	$112, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L401:
	movq	%r14, 16(%r15)
	jmp	.L399
	.p2align 4,,10
	.p2align 3
.L411:
	movl	$112, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L401
	.p2align 4,,10
	.p2align 3
.L410:
	movl	$24, %ecx
	call	alloc_memory
	movq	80(%rbx), %rdi
	movl	$32, %edx
	leaq	.LC0(%rip), %rcx
	movq	$0, (%rax)
	movq	%rax, %r14
	leaq	1(%rdi), %rax
	movq	%rax, 80(%rbx)
	call	create_string
	movq	%rax, 8(%r14)
	movq	%rax, %rcx
	cmpq	$-1, %rdi
	je	.L412
	movq	%rdi, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L404:
	movq	$0, 16(%r14)
	movl	$16, %ecx
	call	alloc_memory
	movq	%r14, (%rax)
	movq	%rax, %rdi
	call	create_list
	movq	32(%rsi), %rcx
	movq	%rdi, %rdx
	movq	%rax, 8(%rdi)
	call	list_append
	movq	16(%rbp), %rax
	movq	%rdi, 16(%rbx)
	movq	24(%rax), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L405
	.p2align 4,,10
	.p2align 3
.L406:
	movq	%rbx, %rdx
	call	tac_statement
.L405:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L406
	movq	$0, 8(%rbx)
	movaps	32(%rsp), %xmm6
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
.L412:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L404
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
	pushq	%r15
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
	subq	$48, %rsp
	movaps	%xmm6, 48(%rsp)
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
	movq	%rax, 40(%rsp)
	jmp	.L414
	.p2align 4,,10
	.p2align 3
.L420:
	movq	16(%rsi), %rcx
	movq	%r15, %rdx
	call	list_append
.L414:
	movq	40(%rsp), %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L434
	movq	8(%rax), %r13
	movq	(%rax), %r14
	testq	%r13, %r13
	je	.L421
	movl	32(%r14), %r9d
	xorl	%edi, %edi
	testl	%r9d, %r9d
	jne	.L418
	movq	24(%r14), %rax
	movq	24(%rbx), %rdi
	movq	%rax, 24(%rbx)
.L418:
	movq	%rbx, %rdx
	movq	%r13, %rcx
	call	search_var
	movl	32(%r14), %r8d
	movq	%rax, %r15
	testl	%r8d, %r8d
	jne	.L419
	movq	%rdi, 24(%rbx)
.L419:
	testq	%r15, %r15
	jne	.L420
.L421:
	movl	$24, %ecx
	call	alloc_memory
	leaq	.LC0(%rip), %rcx
	movl	$32, %edx
	movq	%r13, (%rax)
	movq	56(%rbx), %r13
	movq	%rax, %r15
	leaq	1(%r13), %rax
	movq	%rax, 56(%rbx)
	call	create_string
	movq	%rax, 8(%r15)
	movq	%rax, %rcx
	cmpq	$-1, %r13
	je	.L435
	movq	%r13, %r9
	movl	$112, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L422:
	movq	%r14, 16(%r15)
	jmp	.L420
	.p2align 4,,10
	.p2align 3
.L435:
	movl	$112, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L422
	.p2align 4,,10
	.p2align 3
.L434:
	movl	$24, %ecx
	call	alloc_memory
	movq	80(%rbx), %rdi
	movl	$32, %edx
	leaq	.LC0(%rip), %rcx
	movq	$0, (%rax)
	movq	%rax, %r14
	leaq	1(%rdi), %rax
	movq	%rax, 80(%rbx)
	call	create_string
	movq	%rax, 8(%r14)
	movq	%rax, %rcx
	cmpq	$-1, %rdi
	je	.L436
	movq	%rdi, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L425:
	movq	$0, 16(%r14)
	movl	$16, %ecx
	call	alloc_memory
	movq	%r14, (%rax)
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
	jne	.L429
	jmp	.L437
	.p2align 4,,10
	.p2align 3
.L430:
	movq	%rbx, %rdx
	call	tac_statement
.L429:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L430
	movq	$0, 8(%rbx)
	movaps	48(%rsp), %xmm6
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
.L436:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L425
	.p2align 4,,10
	.p2align 3
.L437:
	movq	%rsi, %rcx
	call	list_pop
	movl	8(%rax), %ecx
	testl	%ecx, %ecx
	jne	.L427
	movq	(%rax), %rax
	cmpl	$19, 24(%rax)
	jne	.L427
	movq	8(%rax), %rax
	cmpl	$8, 8(%rax)
	jne	.L427
	movq	(%rax), %rax
	movl	16(%rax), %edx
	testl	%edx, %edx
	je	.L428
.L427:
	movq	(%r12), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movaps	48(%rsp), %xmm6
	leaq	.LC26(%rip), %rdx
	movq	24(%rax), %rcx
	leaq	-56(%rbp), %rsp
	movq	%rbx, %r8
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	fprintf
.L428:
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
	jmp	.L429
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
.L439:
	movq	%rsi, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L447
.L444:
	movl	8(%rax), %ebx
	testl	%ebx, %ebx
	je	.L440
	cmpl	$1, %ebx
	je	.L441
	call	__getreent
	movl	%ebx, %r8d
	movq	%r12, %rdx
	movq	24(%rax), %rcx
	call	fprintf
	movq	%rsi, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L444
.L447:
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
.L441:
	movq	(%rax), %rcx
	movl	$1, %r8d
	movq	%rdi, %rdx
	call	tac_variable
	jmp	.L439
	.p2align 4,,10
	.p2align 3
.L440:
	movq	(%rax), %rcx
	movq	%rdi, %rdx
	call	tac_method
	jmp	.L439
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
	je	.L454
	leal	-1(%rbx), %eax
	cmpl	$1, %eax
	jbe	.L455
	testl	%ebx, %ebx
	jne	.L451
	movq	24(%rcx), %rcx
	addq	$40, %rsp
	movq	%r8, %rdx
	popq	%rbx
	popq	%rsi
	jmp	tac_class
	.p2align 4,,10
	.p2align 3
.L451:
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
.L455:
	movq	(%rcx), %rdx
	movq	%r8, %r9
	movl	$102, %r8d
.L453:
	call	create_var
	movq	16(%rsi), %rcx
	addq	$40, %rsp
	popq	%rbx
	movq	%rax, %rdx
	popq	%rsi
	jmp	list_append
	.p2align 4,,10
	.p2align 3
.L454:
	movq	%r8, %r9
	movq	(%rcx), %rdx
	movl	$118, %r8d
	jmp	.L453
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
.L457:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L465
.L463:
	movl	8(%rbx), %eax
	cmpl	$1, %eax
	je	.L466
	cmpl	$2, %eax
	je	.L467
	testl	%eax, %eax
	jne	.L457
	movq	(%rbx), %rcx
	movq	%rsi, %r8
	movq	%r12, %rdx
	call	tac_import
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L463
.L465:
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
.L466:
	movq	(%rbx), %rcx
	movq	%rsi, %rdx
	call	tac_function
	movq	(%rbx), %rax
	movq	%r13, %rdx
	movq	(%rax), %rbx
	movq	8(%rbx), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L457
	movq	%rbx, 8(%r12)
	jmp	.L457
	.p2align 4,,10
	.p2align 3
.L467:
	movq	(%rbx), %rcx
	movq	%rsi, %rdx
	call	tac_class
	jmp	.L457
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
	.def	list_is_empty;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	make_method_name;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.def	strtoll;	.scl	2;	.type	32;	.endef
	.def	strtod;	.scl	2;	.type	32;	.endef
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
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
	.section	.rdata$.refptr.DEFAULT_CONSTRUCTOR_NAME, "dr"
	.globl	.refptr.DEFAULT_CONSTRUCTOR_NAME
	.linkonce	discard
.refptr.DEFAULT_CONSTRUCTOR_NAME:
	.quad	DEFAULT_CONSTRUCTOR_NAME
	.section	.rdata$.refptr.name_int, "dr"
	.globl	.refptr.name_int
	.linkonce	discard
.refptr.name_int:
	.quad	name_int
