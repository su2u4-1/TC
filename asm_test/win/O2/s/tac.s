	.file	"tac.c"
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "[warning] Unsupported type for size lookup: %s\12\0"
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
	.def	load_rvalue;	.scl	3;	.type	32;	.endef
load_rvalue:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	testq	%rcx, %rcx
	je	.L73
	cmpb	$0, 20(%rcx)
	jne	.L78
.L73:
	leaq	-32(%rbp), %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L78:
	movq	%rdx, %rsi
	movq	8(%rcx), %rdx
	movl	$116, %r8d
	xorl	%ecx, %ecx
	movq	%rsi, %r9
	call	create_var
	movl	$24, %ecx
	movq	%rax, %r12
	call	alloc_memory
	movq	%r12, %xmm0
	movl	$32, %ecx
	movhps	16(%r12), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rdi
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movq	%rbx, 8(%rax)
	movq	%rax, %rdx
	movq	%rdi, %rbx
	movq	%rdi, (%rax)
	movl	$23, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rsi), %rax
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
	.ascii "[warning] Unsupported symbol kind for import: %d\12\0"
	.text
	.p2align 4
	.globl	tac_import
	.def	tac_import;	.scl	2;	.type	32;	.endef
tac_import:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	movq	(%rcx), %rsi
	movl	32(%rsi), %ebx
	cmpl	$3, %ebx
	je	.L86
	leal	-1(%rbx), %eax
	cmpl	$1, %eax
	jbe	.L87
	testl	%ebx, %ebx
	jne	.L82
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, %rbx
	call	create_list
	movq	%rsi, %xmm1
	movq	$0, 16(%rbx)
	movq	%rbx, %rdx
	movq	%rax, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, (%rbx)
	movq	(%rdi), %rcx
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	list_append
	.p2align 4,,10
	.p2align 3
.L82:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC4(%rip), %rdx
	movq	24(%rax), %rcx
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L87:
	movq	(%rsi), %rdx
	movq	%r8, %r9
	movl	$102, %r8d
.L84:
	movq	%rsi, %rcx
	call	create_var
	movq	16(%rdi), %rcx
	leaq	-24(%rbp), %rsp
	popq	%rbx
	movq	%rax, %rdx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	list_append
	.p2align 4,,10
	.p2align 3
.L86:
	movq	%r8, %r9
	movq	(%rsi), %rdx
	movl	$118, %r8d
	jmp	.L84
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
	.align 8
.LC6:
	.ascii "[warning] Unsupported variable type for tac_variable: %d\12\0"
	.text
	.p2align 4
	.globl	tac_variable
	.def	tac_variable;	.scl	2;	.type	32;	.endef
tac_variable:
	pushq	%rbp
	leal	-97(%r8), %eax
	movq	%rsp, %rbp
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$48, %rsp
	cmpl	$21, %eax
	ja	.L89
	movq	%rdx, %rbx
	leaq	.L91(%rip), %rdx
	movq	%rcx, %rdi
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L91:
	.long	.L94-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L93-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L92-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L88-.L91
	.long	.L89-.L91
	.long	.L88-.L91
	.text
	.p2align 4,,10
	.p2align 3
.L89:
	movl	%r8d, 44(%rsp)
	call	__getreent
	movl	44(%rsp), %r8d
	leaq	.LC6(%rip), %rdx
	movq	24(%rax), %rcx
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L88:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L92:
	movq	(%rcx), %rdx
	movq	8(%rcx), %rcx
	movq	%rbx, %r9
	movl	$112, %r8d
	call	create_var
	movq	%rax, %rdx
	movq	8(%rbx), %rax
.L97:
	movq	16(%rax), %rcx
.L98:
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
.L93:
	movq	(%rcx), %rdx
	movq	8(%rcx), %rcx
	movq	%rbx, %r9
	movl	$102, %r8d
	call	create_var
	movq	%rax, %rdx
	movq	(%rbx), %rax
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L94:
	movq	(%rbx), %rax
	movq	(%rax), %rcx
	call	list_pop_back
	movq	%rax, %rsi
	movq	(%rbx), %rax
	movq	%rsi, %rdx
	movq	(%rax), %rcx
	call	list_append
	movq	(%rdi), %r12
	movq	8(%rdi), %r13
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbx, %r9
	movl	$97, %r8d
	movq	%r12, %rdx
	movq	%r13, %rcx
	movq	%rax, %rdi
	call	create_var
	movq	%r12, %xmm1
	movq	%r12, %rcx
	movq	%rax, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, (%rdi)
	movq	16(%rsi), %rax
	movq	%rax, 16(%rdi)
	call	get_type_size
	movq	(%rsi), %rcx
	addq	%rax, 16(%rsi)
	movq	%rdi, %rdx
	testq	%rcx, %rcx
	jne	.L98
	call	__getreent
	movl	$63, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rcx
	movq	24(%rax), %r9
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	jmp	fwrite
	.section .rdata,"dr"
	.align 8
.LC7:
	.ascii "[warning] Unsupported variable access with NULL base\12\0"
	.align 8
.LC8:
	.ascii "[warning] Failed to generate variable access for base\12\0"
	.align 8
.LC9:
	.ascii "[warning] Attempting to access attribute of non-object type: %s\12\0"
	.align 8
.LC10:
	.ascii "[warning] Attribute '%s' not found in type '%s'\12\0"
	.align 8
.LC11:
	.ascii "[warning] Symbol '%s' in type '%s' is not an attribute\12\0"
	.align 8
.LC12:
	.ascii "[warning] Attempting to index non-array type: %s\12\0"
.LC13:
	.ascii "arr\0"
	.align 8
.LC14:
	.ascii "[warning] Failed to generate variable access for index\12\0"
	.align 8
.LC15:
	.ascii "[warning] Attempting to call non-function, kind: %u, type name: %s\12\0"
	.align 8
.LC16:
	.ascii "[warning] Unsupported variable access type for tac_variable_access: %u\12\0"
	.text
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
	subq	$48, %rsp
	movl	16(%rcx), %ecx
	testl	%ecx, %ecx
	jne	.L100
	movq	8(%rsi), %rcx
	testq	%rcx, %rcx
	je	.L100
	movl	32(%rcx), %eax
	movq	(%rcx), %rdx
	movq	%rbx, %r9
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L101
	movl	$118, %r8d
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
.L99:
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
.L100:
	movq	(%rsi), %rcx
	testq	%rcx, %rcx
	je	.L131
	movq	%rbx, %rdx
	call	tac_variable_access
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L132
	movl	16(%rsi), %edi
	cmpl	$2, %edi
	je	.L133
	cmpl	$3, %edi
	je	.L134
	cmpl	$1, %edi
	jne	.L116
	movl	16(%rax), %edi
	testl	%edi, %edi
	je	.L135
	cmpl	$7, %edi
	je	.L119
	movq	8(%rax), %rax
.L118:
	movq	8(%rax), %rbx
	call	__getreent
	movl	%edi, %r8d
	leaq	.LC15(%rip), %rdx
	xorl	%edi, %edi
	movq	24(%rax), %rcx
	movq	%rbx, %r9
	call	fprintf
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L133:
	movq	8(%rax), %rax
	movl	32(%rax), %edx
	leal	-1(%rdx), %ecx
	cmpl	$1, %ecx
	jbe	.L136
	movq	24(%rax), %rcx
	testl	%edx, %edx
	jne	.L108
	movq	16(%rcx), %rcx
.L108:
	movq	8(%rsi), %rax
	movq	8(%rax), %rdx
	call	search_name_use_strcmp
	testq	%rax, %rax
	je	.L137
	movl	32(%rax), %edx
	leal	-1(%rdx), %ecx
	cmpl	$1, %ecx
	jbe	.L138
	cmpl	$5, %edx
	jne	.L139
	movq	(%rax), %rdx
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
	movq	%rdi, (%rax)
	movq	%rsi, 16(%rax)
	movl	$15, 24(%rax)
	movb	$1, 20(%rdi)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L135:
	movq	8(%rax), %rax
	movl	32(%rax), %edx
	testl	%edx, %edx
	jne	.L118
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
	movl	$7, 16(%rax)
	movq	%rax, %r12
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
.L119:
	movq	8(%rsi), %rcx
	xorl	%esi, %esi
	call	list_copy
	movq	.refptr.name_int(%rip), %r13
	movq	%rax, 40(%rsp)
	jmp	.L120
	.p2align 4,,10
	.p2align 3
.L121:
	movq	%rbx, %rdx
	addq	$1, %rsi
	call	tac_expression
	movq	8(%rax), %rcx
	movq	%rax, %r15
	call	get_type_size
	movl	$24, %ecx
	movq	%rax, %rdi
	call	alloc_memory
	movl	$32, %ecx
	movl	$1, 16(%rax)
	movq	%rax, %r14
	movq	%rdi, (%rax)
	movq	0(%r13), %rax
	movb	$0, 20(%r14)
	movq	%rax, 8(%r14)
	call	alloc_memory
	movq	%r15, 8(%rax)
	movq	%rax, %rdx
	movl	$17, 24(%rax)
	movq	%r14, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L120:
	movq	40(%rsp), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L121
	movq	8(%r12), %rdx
	movq	%rbx, %r9
	movl	$116, %r8d
	call	create_var
	movl	$24, %ecx
	movq	%rax, %r14
	call	alloc_memory
	movq	%r14, %xmm0
	movl	$24, %ecx
	movhps	16(%r14), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rdi
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movl	$32, %ecx
	movq	%rsi, (%rax)
	movq	%rax, %r14
	movl	$1, 16(%rax)
	movq	0(%r13), %rax
	movb	$0, 20(%r14)
	movq	%rax, 8(%r14)
	call	alloc_memory
	movq	%r12, 8(%rax)
	movq	%rax, %rdx
	movq	%rdi, (%rax)
	movq	%r14, 16(%rax)
	movl	$22, 24(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L101:
	movl	$102, %r8d
.L130:
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
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L134:
	movq	8(%rax), %rax
	movq	8(%rax), %rdi
	movl	32(%rax), %eax
	subl	$3, %eax
	cmpl	$2, %eax
	ja	.L129
	leaq	.LC13(%rip), %rdx
	movq	%rdi, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L129
	movq	8(%rsi), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L140
	movq	8(%r12), %rax
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
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L139:
	movq	8(%r12), %rax
	movq	8(%rax), %rdi
	movq	8(%rsi), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movq	%rdi, %r9
	leaq	.LC11(%rip), %rdx
	xorl	%edi, %edi
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	call	fprintf
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L131:
	call	__getreent
	movl	$53, %r8d
	movl	$1, %edx
	xorl	%edi, %edi
	movq	24(%rax), %r9
	leaq	.LC7(%rip), %rcx
	call	fwrite
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L116:
	call	__getreent
	movl	%edi, %r8d
	leaq	.LC16(%rip), %rdx
	xorl	%edi, %edi
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L129:
	call	__getreent
	movq	%rdi, %r8
	leaq	.LC12(%rip), %rdx
	xorl	%edi, %edi
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L138:
	movq	(%rax), %rdx
	movq	%rbx, %r9
	movl	$102, %r8d
	movq	%rax, %rcx
	jmp	.L130
	.p2align 4,,10
	.p2align 3
.L132:
	call	__getreent
	movl	$54, %r8d
	movl	$1, %edx
	xorl	%edi, %edi
	movq	24(%rax), %r9
	leaq	.LC8(%rip), %rcx
	call	fwrite
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L140:
	call	__getreent
	movl	$55, %r8d
	movl	$1, %edx
	xorl	%edi, %edi
	movq	24(%rax), %r9
	leaq	.LC14(%rip), %rcx
	call	fwrite
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L136:
	movq	8(%rax), %rbx
	xorl	%edi, %edi
	call	__getreent
	leaq	.LC9(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	call	fprintf
	jmp	.L99
.L137:
	movq	8(%r12), %rax
	movq	8(%rax), %rdi
	movq	8(%rsi), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movq	%rdi, %r9
	leaq	.LC10(%rip), %rdx
	xorl	%edi, %edi
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	call	fprintf
	jmp	.L99
	.section .rdata,"dr"
	.align 8
.LC18:
	.ascii "[warning] Unsupported type for negation: %s\12\0"
	.align 8
.LC19:
	.ascii "[warning] Unsupported primary type for tac_primary: %d\12\0"
	.text
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
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rsi, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	movq	8(%rax), %rdx
	movq	%rax, %r12
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rdi
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
	je	.L159
	movq	.refptr.name_float(%rip), %r13
	cmpq	0(%r13), %rax
	je	.L160
	movq	8(%rax), %rbx
	call	__getreent
	leaq	.LC18(%rip), %rdx
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
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rsi, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	movq	%rax, %r12
	movq	.refptr.name_bool(%rip), %rax
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
	leaq	.LC19(%rip), %rdx
	xorl	%ebx, %ebx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L141
	.p2align 4,,10
	.p2align 3
.L160:
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movl	$2, 16(%rax)
	movq	%rax, %rdi
	movq	.LC17(%rip), %rax
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
.L155:
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L141
	.p2align 4,,10
	.p2align 3
.L159:
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
	jmp	.L155
	.section .rdata,"dr"
	.align 8
.LC20:
	.ascii "[warning] Left-hand side of assignment is not a variable\12\0"
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
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	cmpl	$19, 24(%rcx)
	je	.L175
	movq	16(%rcx), %rcx
	call	tac_expression
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rax, %rdi
	movl	24(%rsi), %eax
	cmpl	$18, %eax
	ja	.L163
	leaq	CSWTCH.18(%rip), %rdx
	movq	(%rsi), %rcx
	movl	(%rdx,%rax,4), %r13d
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %r12
	movl	24(%rsi), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L164
	cmpl	$14, %r13d
	jne	.L168
	movl	16(%r12), %eax
	testl	%eax, %eax
	jne	.L176
.L166:
	movl	$32, %ecx
	call	alloc_memory
	movl	$14, 24(%rax)
	movq	%rax, %rdx
	movq	%r12, (%rax)
	movq	%rdi, 8(%rax)
	movq	$0, 16(%rax)
	cmpb	$0, 20(%r12)
	jne	.L177
.L167:
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	leaq	-48(%rbp), %rsp
	movq	%rdi, %rax
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
.L163:
	movq	(%rsi), %rcx
	movq	%rbx, %rdx
	movl	$25, %r13d
	call	tac_expression
	movq	%rax, %r12
	movl	24(%rsi), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L164
.L168:
	movq	8(%r12), %rdx
	movq	%rbx, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %r14
	call	alloc_memory
	movq	%r14, %xmm0
	movq	%rbx, %rdx
	movq	%r12, %rcx
	movhps	16(%r14), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rsi
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	load_rvalue
	movl	$32, %ecx
	movq	%rax, %r14
	call	alloc_memory
	movq	%r14, 8(%rax)
	movq	%rax, %rdx
	movq	%rdi, 16(%rax)
	movq	%rsi, %rdi
	movl	%r13d, 24(%rax)
	movq	%rsi, (%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	16(%r12), %eax
	testl	%eax, %eax
	je	.L166
.L176:
	call	__getreent
	movl	$57, %r8d
	movl	$1, %edx
	leaq	.LC20(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L166
	.p2align 4,,10
	.p2align 3
.L164:
	movq	8(%r12), %rdx
	movq	%rbx, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %r14
	call	alloc_memory
	movq	%r14, %xmm0
	movq	%rbx, %rdx
	movq	%r12, %rcx
	movhps	16(%r14), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rsi
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	load_rvalue
	movl	$32, %ecx
	movq	%rax, %r12
	call	alloc_memory
	movq	%rdi, 16(%rax)
	movq	%rax, %rdx
	movq	%rsi, %rdi
	movl	%r13d, 24(%rax)
	movq	%rsi, (%rax)
	movq	%r12, 8(%rax)
	jmp	.L167
	.p2align 4,,10
	.p2align 3
.L175:
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
.L177:
	movl	$32, %ecx
	call	alloc_memory
	movl	$24, 24(%rax)
	movq	%rax, %rdx
	movq	%r12, (%rax)
	movq	%rdi, 8(%rax)
	movq	$0, 16(%rax)
	jmp	.L167
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
	je	.L181
	movq	24(%r14), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L202
.L181:
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	create_var
	movq	%rax, 56(%rsp)
.L180:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbx, %rdx
	movl	$6, 16(%rax)
	movq	%rax, %r12
	movq	$0, 8(%rax)
	movq	56(%rsp), %rax
	movb	$0, 20(%r12)
	movq	(%r14), %rcx
	movq	%rax, (%r12)
	call	tac_expression
	movl	$24, %ecx
	movq	%rax, %r15
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
	movq	%rax, %r13
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	%rax, %rdx
	movq	%r13, 8(%rax)
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
	jmp	.L182
	.p2align 4,,10
	.p2align 3
.L183:
	movq	%rbx, %rdx
	call	tac_statement
.L182:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L183
	movl	$32, %ecx
	call	alloc_memory
	movq	$0, 8(%rax)
	movq	%rax, %rdx
	movl	$20, 24(%rax)
	movq	%r12, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	16(%r14), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L203
.L184:
	movq	24(%r14), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L204
.L191:
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
.L202:
	movq	%rsi, 56(%rsp)
	jmp	.L180
	.p2align 4,,10
	.p2align 3
.L204:
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
	jmp	.L192
	.p2align 4,,10
	.p2align 3
.L193:
	movq	%rbx, %rdx
	call	tac_statement
.L192:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L193
	movl	$32, %ecx
	call	alloc_memory
	movq	%r12, (%rax)
	movq	%rax, %rdx
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L191
	.p2align 4,,10
	.p2align 3
.L203:
	movq	16(%r14), %rcx
	call	list_copy
	movq	%rax, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L185:
	movq	40(%rsp), %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L184
	movl	$16, %ecx
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rax, %rbp
	call	create_list
	movq	%rbp, %rdx
	movq	%rax, 8(%rbp)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rbp, 16(%rbx)
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
	movq	(%rdi), %rcx
	movq	%rbx, %rdx
	movq	%rax, %rsi
	call	tac_expression
	movq	40(%rsp), %rcx
	movq	%rax, %r13
	call	list_is_empty
	testb	%al, %al
	jne	.L205
.L187:
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
	movq	%rbp, (%rax)
	movb	$0, 20(%rax)
	movq	%rax, 48(%rsp)
	call	alloc_memory
	movq	48(%rsp), %r9
	movq	%rax, %rdx
	movq	%r13, (%rax)
	movq	%r9, 8(%rax)
	movl	$19, 24(%rax)
	movq	%r15, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movq	%rbp, (%rax)
	movq	%rax, %r13
	call	create_list
	movq	%r13, %rdx
	movq	%rax, 8(%r13)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%r13, 16(%rbx)
	movq	8(%rdi), %rcx
	call	list_copy
	movq	%rax, %rdi
	jmp	.L188
	.p2align 4,,10
	.p2align 3
.L189:
	movq	%rbx, %rdx
	call	tac_statement
.L188:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L189
	movl	$32, %ecx
	call	alloc_memory
	movq	%r12, (%rax)
	movq	%rax, %rdx
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L185
	.p2align 4,,10
	.p2align 3
.L205:
	movq	24(%r14), %rcx
	call	list_is_empty
	testb	%al, %al
	cmovne	56(%rsp), %rsi
	jmp	.L187
	.section .rdata,"dr"
	.align 8
.LC21:
	.ascii "[warning] 'break' statement used outside of loop\12\0"
	.align 8
.LC22:
	.ascii "[warning] 'continue' statement used outside of loop\12\0"
	.align 8
.LC23:
	.ascii "[warning] Unsupported statement type for tac_statement: %d\12\0"
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
	ja	.L207
	movq	%rdx, %rdi
	leaq	.L209(%rip), %rdx
	movq	%rcx, %rsi
	movslq	(%rdx,%rbx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
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
	movq	32(%rdi), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L218
	movq	32(%rdi), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	je	.L218
.L232:
	movl	$32, %ecx
	call	alloc_memory
	movl	$20, 24(%rax)
	movq	%rax, %rdx
	jmp	.L230
	.p2align 4,,10
	.p2align 3
.L208:
	movq	40(%rdi), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L219
	movq	40(%rdi), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L232
.L219:
	call	__getreent
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC22(%rip), %rcx
	movq	24(%rax), %r9
	jmp	.L231
	.p2align 4,,10
	.p2align 3
.L214:
	movq	(%rcx), %rcx
	addq	$32, %rsp
	movq	%rdi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	tac_if
	.p2align 4,,10
	.p2align 3
.L216:
	movq	(%rcx), %rcx
	addq	$32, %rsp
	movq	%rdi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	tac_expression
	.p2align 4,,10
	.p2align 3
.L206:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L212:
	movq	(%rcx), %rcx
	addq	$32, %rsp
	movq	%rdi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	tac_for
	.p2align 4,,10
	.p2align 3
.L211:
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
	je	.L217
	movq	%rdi, %rdx
	call	tac_expression
	movq	%rax, %rbx
.L217:
	movl	$32, %ecx
	call	alloc_memory
	movl	$21, 24(%rax)
	movq	%rax, %rdx
.L230:
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
.L213:
	movq	(%rcx), %rcx
	addq	$32, %rsp
	movq	%rdi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	tac_while
	.p2align 4,,10
	.p2align 3
.L218:
	call	__getreent
	movl	$49, %r8d
	movl	$1, %edx
	leaq	.LC21(%rip), %rcx
	movq	24(%rax), %r9
.L231:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	fwrite
.L207:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC23(%rip), %rdx
	movq	24(%rax), %rcx
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	fprintf
	.p2align 4
	.globl	tac_for
	.def	tac_for;	.scl	2;	.type	32;	.endef
tac_for:
	pushq	%r15
	movq	%rdx, %r9
	movl	$98, %r8d
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	movq	%rcx, %rdi
	xorl	%ecx, %ecx
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	xorl	%edx, %edx
	subq	$40, %rsp
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
	je	.L234
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
	movl	$24, %ecx
	movq	%rax, %r15
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
.L235:
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
	je	.L236
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r14, (%rax)
	call	list_append
.L237:
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
	jmp	.L239
	.p2align 4,,10
	.p2align 3
.L240:
	movq	%rbx, %rdx
	call	tac_statement
.L239:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L240
	movq	40(%rbx), %rcx
	call	list_pop_back
	movq	32(%rbx), %rcx
	call	list_pop_back
	cmpq	$0, 16(%rdi)
	je	.L241
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
.L241:
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
	je	.L244
.L242:
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
.L236:
	cmpq	$0, 8(%rdi)
	je	.L238
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	call	list_append
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L234:
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
	jmp	.L235
	.p2align 4,,10
	.p2align 3
.L244:
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
	jmp	.L242
	.p2align 4,,10
	.p2align 3
.L238:
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	call	list_append
	jmp	.L237
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
	movl	$24, %ecx
	movq	%rax, %r15
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
	jmp	.L246
	.p2align 4,,10
	.p2align 3
.L247:
	movq	%rbx, %rdx
	call	tac_statement
.L246:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L247
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
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L251:
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	movq	%rbx, %r9
	movl	$112, %r8d
	call	create_var
	movq	16(%rsi), %rcx
	movq	%rax, %rdx
	call	list_append
.L250:
	movq	%rdi, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L251
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
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L253:
	movq	%rbx, %rdx
	call	tac_statement
.L252:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L253
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
	jmp	.L256
	.p2align 4,,10
	.p2align 3
.L257:
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	movq	%rbx, %r9
	movl	$112, %r8d
	call	create_var
	movq	16(%rsi), %rcx
	movq	%rax, %rdx
	call	list_append
.L256:
	movq	%rdi, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L257
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
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax
	movq	%rdi, 16(%rbx)
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
	je	.L262
.L258:
	movq	24(%r12), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L259
	.p2align 4,,10
	.p2align 3
.L260:
	movq	%rbx, %rdx
	call	tac_statement
.L259:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L260
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
.L262:
	movq	24(%rbx), %rax
	movq	%rbx, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	movq	(%rax), %rdx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rsi
	call	alloc_memory
	movq	%rsi, %xmm0
	movl	$24, %ecx
	movhps	16(%rsi), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r13
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	movq	24(%rbx), %r14
	call	alloc_memory
	movl	$32, %ecx
	movq	%rax, %rsi
	movl	$1, 16(%rax)
	movq	24(%r14), %rax
	movb	$0, 20(%rsi)
	movq	%rax, (%rsi)
	movq	.refptr.name_int(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 8(%rsi)
	call	alloc_memory
	movq	8(%rdi), %rcx
	movl	$18, 24(%rax)
	movq	%rax, %rdx
	movq	%r13, (%rax)
	movq	%rsi, 8(%rax)
	movq	$0, 16(%rax)
	call	list_append
	jmp	.L258
	.section .rdata,"dr"
	.align 8
.LC24:
	.ascii "[warning] Unsupported class member type for tac_class: %d\12\0"
	.text
	.p2align 4
	.globl	tac_class
	.def	tac_class;	.scl	2;	.type	32;	.endef
tac_class:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r12
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
	movq	%rax, %r12
	call	create_list
	movq	%r12, %rdx
	movq	%rax, %xmm0
	punpcklqdq	%xmm6, %xmm0
	movups	%xmm0, (%r12)
	movq	24(%rbx), %rax
	movq	%rax, 16(%r12)
	movq	(%rdi), %rax
	leaq	.LC24(%rip), %r12
	movq	(%rax), %rcx
	call	list_append
	.p2align 4,,10
	.p2align 3
.L264:
	movq	%rsi, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L272
.L269:
	movl	8(%rax), %ebx
	testl	%ebx, %ebx
	je	.L265
	cmpl	$1, %ebx
	je	.L266
	call	__getreent
	movl	%ebx, %r8d
	movq	%r12, %rdx
	movq	24(%rax), %rcx
	call	fprintf
	movq	%rsi, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L269
.L272:
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
.L266:
	movq	(%rax), %rcx
	movl	$97, %r8d
	movq	%rdi, %rdx
	call	tac_variable
	jmp	.L264
	.p2align 4,,10
	.p2align 3
.L265:
	movq	(%rax), %rcx
	movq	%rdi, %rdx
	call	tac_method
	jmp	.L264
	.section .rdata,"dr"
.LC25:
	.ascii "main\0"
	.text
	.p2align 4
	.globl	tac_code
	.def	tac_code;	.scl	2;	.type	32;	.endef
tac_code:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r13
	leaq	.LC25(%rip), %r13
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
.L274:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L282
.L280:
	movl	8(%rbx), %eax
	cmpl	$1, %eax
	je	.L283
	cmpl	$2, %eax
	je	.L284
	testl	%eax, %eax
	jne	.L274
	movq	(%rbx), %rcx
	movq	%rsi, %r8
	movq	%r12, %rdx
	call	tac_import
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L280
.L282:
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
.L283:
	movq	(%rbx), %rcx
	movq	%rsi, %rdx
	call	tac_function
	movq	(%rbx), %rax
	movq	%r13, %rdx
	movq	(%rax), %rbx
	movq	8(%rbx), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L274
	movq	%rbx, 8(%r12)
	jmp	.L274
	.p2align 4,,10
	.p2align 3
.L284:
	movq	(%rbx), %rcx
	movq	%rsi, %rdx
	call	tac_class
	jmp	.L274
	.section .rdata,"dr"
	.align 32
CSWTCH.18:
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
.LC17:
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
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
	.def	make_method_name;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	strtoll;	.scl	2;	.type	32;	.endef
	.def	strtod;	.scl	2;	.type	32;	.endef
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
