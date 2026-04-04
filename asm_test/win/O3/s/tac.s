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
	.def	create_var.constprop.0;	.scl	3;	.type	32;	.endef
create_var.constprop.0:
	pushq	%r12
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	movq	%r8, %rsi
	pushq	%rbx
	subq	$32, %rsp
	testq	%rcx, %rcx
	je	.L40
	movl	32(%rdx), %edx
	xorl	%r12d, %r12d
	testl	%edx, %edx
	jne	.L37
	movq	24(%rbp), %rax
	movq	24(%r8), %r12
	movq	%rax, 24(%r8)
.L37:
	movq	%rsi, %rdx
	movq	%rdi, %rcx
	call	search_var
	movq	%rax, %rbx
	movl	32(%rbp), %eax
	testl	%eax, %eax
	jne	.L38
	movq	%r12, 24(%rsi)
.L38:
	testq	%rbx, %rbx
	je	.L40
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L40:
	movl	$24, %ecx
	call	alloc_memory
	leaq	.LC0(%rip), %rcx
	movl	$32, %edx
	movq	%rdi, (%rax)
	movq	56(%rsi), %rdi
	movq	%rax, %rbx
	leaq	1(%rdi), %rax
	movq	%rax, 56(%rsi)
	call	create_string
	movq	%rax, 8(%rbx)
	movq	%rax, %rcx
	cmpq	$-1, %rdi
	je	.L45
	movq	%rdi, %r9
	movl	$112, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L41:
	movq	%rbp, 16(%rbx)
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L45:
	movl	$112, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L41
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
	je	.L59
	movl	32(%rdx), %edx
	xorl	%r13d, %r13d
	testl	%edx, %edx
	jne	.L56
	movq	24(%rdi), %rax
	movq	24(%r9), %r13
	movq	%rax, 24(%r9)
.L56:
	movq	%rsi, %rdx
	movq	%r12, %rcx
	call	search_var
	movq	%rax, %rbx
	movl	32(%rdi), %eax
	testl	%eax, %eax
	jne	.L57
	movq	%r13, 24(%rsi)
.L57:
	testq	%rbx, %rbx
	je	.L59
.L46:
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
.L59:
	movl	$24, %ecx
	call	alloc_memory
	movq	%r12, (%rax)
	movq	%rax, %rbx
	leal	-97(%rbp), %eax
	cmpl	$21, %eax
	ja	.L48
	leaq	.L50(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L50:
	.long	.L55-.L50
	.long	.L54-.L50
	.long	.L48-.L50
	.long	.L48-.L50
	.long	.L48-.L50
	.long	.L53-.L50
	.long	.L48-.L50
	.long	.L48-.L50
	.long	.L48-.L50
	.long	.L48-.L50
	.long	.L48-.L50
	.long	.L48-.L50
	.long	.L48-.L50
	.long	.L48-.L50
	.long	.L48-.L50
	.long	.L52-.L50
	.long	.L48-.L50
	.long	.L48-.L50
	.long	.L48-.L50
	.long	.L51-.L50
	.long	.L48-.L50
	.long	.L49-.L50
	.text
	.p2align 4,,10
	.p2align 3
.L48:
	movl	$32, %edx
	leaq	.LC0(%rip), %rcx
	call	create_string
	movl	%ebp, %r8d
	leaq	.LC1(%rip), %rdx
	movq	%rax, 8(%rbx)
	movq	%rax, %rcx
	call	sprintf
	movq	%rdi, 16(%rbx)
	jmp	.L46
	.p2align 4,,10
	.p2align 3
.L49:
	movq	64(%rsi), %r12
	leaq	1(%r12), %rax
	movq	%rax, 64(%rsi)
	.p2align 4,,10
	.p2align 3
.L61:
	leaq	.LC0(%rip), %rcx
	movl	$32, %edx
	call	create_string
	movq	%rax, 8(%rbx)
	movq	%rax, %rcx
	cmpq	$-1, %r12
	je	.L66
	movq	%r12, %r9
	movl	%ebp, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L63:
	andl	$-3, %ebp
	movq	%rdi, 16(%rbx)
	cmpl	$116, %ebp
	jne	.L46
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
.L51:
	movq	72(%rsi), %r12
	leaq	1(%r12), %rax
	movq	%rax, 72(%rsi)
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L52:
	movq	56(%rsi), %r12
	leaq	1(%r12), %rax
	movq	%rax, 56(%rsi)
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L53:
	movq	88(%rsi), %r12
	leaq	1(%r12), %rax
	movq	%rax, 88(%rsi)
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L54:
	movq	80(%rsi), %r12
	leaq	1(%r12), %rax
	movq	%rax, 80(%rsi)
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L55:
	movq	48(%rsi), %r12
	leaq	1(%r12), %rax
	movq	%rax, 48(%rsi)
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L66:
	movl	%ebp, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L63
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
	je	.L71
	movq	%rsi, %r9
	movl	$116, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L69:
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
.L71:
	movl	$116, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L69
	.section .rdata,"dr"
	.align 8
.LC3:
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
	je	.L79
	leal	-1(%rbx), %eax
	cmpl	$1, %eax
	jbe	.L80
	testl	%ebx, %ebx
	jne	.L75
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
.L75:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC3(%rip), %rdx
	movq	24(%rax), %rcx
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L80:
	movq	(%rsi), %rdx
	movq	%r8, %r9
	movl	$102, %r8d
.L77:
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
.L79:
	movq	%r8, %r9
	movq	(%rsi), %rdx
	movl	$118, %r8d
	jmp	.L77
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "[warning] Unsupported type for size lookup: %s\12\0"
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
	ja	.L82
	movq	%rdx, %rbx
	leaq	.L84(%rip), %rdx
	movq	%rcx, %rdi
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L84:
	.long	.L87-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L86-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L85-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L81-.L84
	.long	.L82-.L84
	.long	.L81-.L84
	.text
	.p2align 4,,10
	.p2align 3
.L82:
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
.L81:
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
.L85:
	movq	(%rcx), %rdx
	movq	8(%rcx), %rcx
	movq	%rbx, %r8
	call	create_var.constprop.0
	movq	%rax, %rdx
	movq	8(%rbx), %rax
.L102:
	movq	16(%rax), %rcx
.L103:
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
.L86:
	movq	(%rcx), %rdx
	movq	8(%rcx), %rcx
	movq	%rbx, %r9
	movl	$102, %r8d
	call	create_var
	movq	%rax, %rdx
	movq	(%rbx), %rax
	jmp	.L102
	.p2align 4,,10
	.p2align 3
.L87:
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
	movq	%rax, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, (%rdi)
	movq	16(%rsi), %rax
	movq	%rax, 16(%rdi)
	testq	%r12, %r12
	je	.L88
	movq	.refptr.name_int(%rip), %rdx
	cmpq	(%rdx), %r12
	je	.L100
	movq	.refptr.name_float(%rip), %rdx
	cmpq	(%rdx), %r12
	je	.L100
	movq	.refptr.name_string(%rip), %rdx
	cmpq	(%rdx), %r12
	je	.L100
	movq	.refptr.name_bool(%rip), %rdx
	cmpq	(%rdx), %r12
	je	.L101
	movq	.refptr.name_void(%rip), %rdx
	cmpq	(%rdx), %r12
	je	.L101
	movl	32(%r12), %edx
	testl	%edx, %edx
	jne	.L94
	movq	24(%r12), %rdx
	addq	24(%rdx), %rax
	.p2align 4,,10
	.p2align 3
.L88:
	movq	(%rsi), %rcx
	movq	%rax, 16(%rsi)
	movq	%rdi, %rdx
	testq	%rcx, %rcx
	jne	.L103
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
.L94:
	movq	8(%r12), %rbx
	call	__getreent
	leaq	.LC4(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	call	fprintf
	movq	16(%rsi), %rax
	.p2align 4,,10
	.p2align 3
.L100:
	addq	$8, %rax
	jmp	.L88
	.p2align 4,,10
	.p2align 3
.L101:
	addq	$1, %rax
	jmp	.L88
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
	movq	%rcx, %rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	andq	$-16, %rsp
	subq	$48, %rsp
	movl	16(%rcx), %r8d
	testl	%r8d, %r8d
	jne	.L105
	movq	8(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L105
	movl	32(%rcx), %eax
	movq	(%rcx), %rdx
	movq	%rbx, %r9
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L106
	movl	$118, %r8d
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movq	%rbx, %xmm0
	movhps	16(%rbx), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r13
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
.L104:
	leaq	-56(%rbp), %rsp
	movq	%r13, %rax
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
.L105:
	movq	(%rdi), %rcx
	testq	%rcx, %rcx
	je	.L159
	movq	%rbx, %rdx
	call	tac_variable_access
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L112
	cmpb	$0, 20(%rax)
	jne	.L160
.L111:
	movl	16(%rdi), %r12d
	cmpl	$2, %r12d
	je	.L161
	cmpl	$3, %r12d
	je	.L162
	cmpl	$1, %r12d
	jne	.L129
	movl	16(%rsi), %r12d
	testl	%r12d, %r12d
	jne	.L130
	movq	8(%rsi), %rax
	movl	32(%rax), %ecx
	testl	%ecx, %ecx
	je	.L163
.L131:
	movq	8(%rax), %rbx
	call	__getreent
	movl	%r12d, %r8d
	leaq	.LC15(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, %r9
	call	fprintf
.L109:
	xorl	%r13d, %r13d
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L161:
	movq	8(%rsi), %rax
	movl	32(%rax), %edx
	leal	-1(%rdx), %ecx
	cmpl	$1, %ecx
	jbe	.L164
	movq	24(%rax), %rcx
	testl	%edx, %edx
	jne	.L115
	movq	16(%rcx), %rcx
.L115:
	movq	8(%rdi), %rax
	movq	8(%rax), %rdx
	call	search_name_use_strcmp
	testq	%rax, %rax
	je	.L165
	movl	32(%rax), %edx
	leal	-1(%rdx), %ecx
	cmpl	$1, %ecx
	jbe	.L166
	cmpl	$5, %edx
	jne	.L167
	movl	$24, %ecx
	movq	(%rax), %r13
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
	je	.L168
	movq	%r14, %r9
	movl	$116, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L120:
	movq	8(%rbx), %rax
	movq	%r13, 16(%r12)
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
	movq	%rax, %r13
	movups	%xmm0, (%rax)
	movq	8(%rdi), %rcx
	movl	$0, 16(%rax)
	movq	(%rcx), %rdx
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
	movq	%rsi, 8(%rax)
	movq	%rax, %rdx
	movq	%r13, (%rax)
	movq	%rdi, 16(%rax)
	movl	$15, 24(%rax)
	movb	$1, 20(%r13)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L160:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L111
	.p2align 4,,10
	.p2align 3
.L112:
	call	__getreent
	movl	$54, %r8d
	movl	$1, %edx
	leaq	.LC8(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L109
	.p2align 4,,10
	.p2align 3
.L106:
	movl	$102, %r8d
.L158:
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movq	%rbx, %xmm0
	movhps	16(%rbx), %xmm0
	movl	$7, 16(%rax)
	movq	%rax, %r13
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L162:
	movq	8(%rsi), %rax
	movq	8(%rax), %r12
	movl	32(%rax), %eax
	subl	$3, %eax
	cmpl	$2, %eax
	ja	.L157
	leaq	.LC13(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L157
	movq	8(%rdi), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L126
	cmpb	$0, 20(%rax)
	jne	.L169
.L125:
	movq	8(%rsi), %rax
	movl	$24, %ecx
	movq	(%rax), %r13
	call	alloc_memory
	movq	72(%rbx), %r14
	movl	$32, %edx
	leaq	.LC0(%rip), %rcx
	movq	$0, (%rax)
	movq	%rax, %rdi
	leaq	1(%r14), %rax
	movq	%rax, 72(%rbx)
	call	create_string
	movq	%rax, 8(%rdi)
	movq	%rax, %rcx
	cmpq	$-1, %r14
	je	.L170
	movq	%r14, %r9
	movl	$116, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L128:
	movq	8(%rbx), %rax
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
	movq	%rax, %r13
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movq	%rsi, 8(%rax)
	movq	%rax, %rdx
	movq	%r13, (%rax)
	movq	%r12, 16(%rax)
	movl	$16, 24(%rax)
	movb	$1, 20(%r13)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L130:
	cmpl	$7, %r12d
	je	.L132
	movq	8(%rsi), %rax
	jmp	.L131
	.p2align 4,,10
	.p2align 3
.L163:
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
	movq	%rax, %r12
	call	alloc_memory
	movq	%r12, %xmm0
	movhps	16(%r12), %xmm0
	movl	$7, 16(%rax)
	movq	%rax, %rsi
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
.L132:
	movq	8(%rdi), %rcx
	xorl	%edi, %edi
	call	list_copy
	movq	.refptr.name_int(%rip), %r12
	movq	%rax, 40(%rsp)
	jmp	.L133
	.p2align 4,,10
	.p2align 3
.L172:
	movq	.refptr.name_float(%rip), %rdx
	cmpq	(%rdx), %rax
	je	.L135
	movq	.refptr.name_string(%rip), %rdx
	cmpq	(%rdx), %rax
	je	.L135
	movq	.refptr.name_bool(%rip), %rdx
	movl	$1, %r13d
	cmpq	(%rdx), %rax
	je	.L134
	movq	.refptr.name_void(%rip), %rcx
	cmpq	(%rcx), %rax
	je	.L134
	movl	32(%rax), %edx
	testl	%edx, %edx
	jne	.L136
	movq	24(%rax), %rax
	movq	24(%rax), %r13
.L134:
	movl	$24, %ecx
	addq	$1, %rdi
	call	alloc_memory
	movl	$32, %ecx
	movl	$1, 16(%rax)
	movq	%rax, %r14
	movq	%r13, (%rax)
	movq	(%r12), %rax
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
.L133:
	movq	40(%rsp), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L171
	movq	%rbx, %rdx
	xorl	%r13d, %r13d
	call	tac_expression
	movq	%rax, %r15
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L134
	cmpq	(%r12), %rax
	jne	.L172
.L135:
	movl	$8, %r13d
	jmp	.L134
	.p2align 4,,10
	.p2align 3
.L171:
	movl	$24, %ecx
	movq	8(%rsi), %r13
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
	je	.L173
	movq	%r15, %r9
	movl	$116, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L139:
	movq	8(%rbx), %rax
	movq	%r13, 16(%r14)
	movq	%r14, %rdx
	movq	24(%rax), %rcx
	call	list_append
	movl	$24, %ecx
	call	alloc_memory
	movq	%r14, %xmm0
	movl	$24, %ecx
	movhps	16(%r14), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r13
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movl	$32, %ecx
	movq	%rdi, (%rax)
	movq	%rax, %r14
	movl	$1, 16(%rax)
	movq	(%r12), %rax
	movb	$0, 20(%r14)
	movq	%rax, 8(%r14)
	call	alloc_memory
	movq	%rsi, 8(%rax)
	movq	%rax, %rdx
	movq	%r13, (%rax)
	movq	%r14, 16(%rax)
	movl	$22, 24(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L167:
	movq	8(%rsi), %rax
	movq	8(%rax), %rsi
	movq	8(%rdi), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movq	%rsi, %r9
	leaq	.LC11(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	call	fprintf
	jmp	.L109
	.p2align 4,,10
	.p2align 3
.L159:
	call	__getreent
	movl	$53, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L109
	.p2align 4,,10
	.p2align 3
.L129:
	call	__getreent
	movl	%r12d, %r8d
	leaq	.LC16(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L109
	.p2align 4,,10
	.p2align 3
.L173:
	movl	$116, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L139
	.p2align 4,,10
	.p2align 3
.L157:
	call	__getreent
	movq	%r12, %r8
	leaq	.LC12(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L109
	.p2align 4,,10
	.p2align 3
.L170:
	movl	$116, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L128
	.p2align 4,,10
	.p2align 3
.L168:
	movl	$116, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L120
	.p2align 4,,10
	.p2align 3
.L166:
	movq	(%rax), %rdx
	movq	%rbx, %r9
	movl	$102, %r8d
	movq	%rax, %rcx
	jmp	.L158
	.p2align 4,,10
	.p2align 3
.L136:
	movq	8(%rax), %r13
	call	__getreent
	leaq	.LC4(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%r13, %r8
	call	fprintf
	jmp	.L135
	.p2align 4,,10
	.p2align 3
.L169:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L125
.L126:
	call	__getreent
	movl	$55, %r8d
	movl	$1, %edx
	leaq	.LC14(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L109
	.p2align 4,,10
	.p2align 3
.L164:
	movq	8(%rax), %rbx
	call	__getreent
	leaq	.LC9(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	call	fprintf
	jmp	.L109
.L165:
	movq	8(%rsi), %rax
	movq	8(%rax), %rsi
	movq	8(%rdi), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movq	%rsi, %r9
	leaq	.LC10(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	call	fprintf
	jmp	.L109
	.section .rdata,"dr"
	.align 8
.LC18:
	.ascii "[warning] Unsupported type for negation: %s\12\0"
	.align 8
.LC19:
	.ascii "[warning] Unsupported primary type for tac_primary: %d\12\0"
	.section	.text.unlikely,"x"
.LCOLDB20:
	.text
.LHOTB20:
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
	ja	.L175
	movq	%rdx, %rsi
	leaq	.L177(%rip), %rdx
	movslq	(%rdx,%rbx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L177:
	.long	.L185-.L177
	.long	.L184-.L177
	.long	.L183-.L177
	.long	.L182-.L177
	.long	.L181-.L177
	.long	.L180-.L177
	.long	.L179-.L177
	.long	.L178-.L177
	.long	.L176-.L177
	.text
	.p2align 4,,10
	.p2align 3
.L178:
	movq	(%rcx), %rcx
	movq	%rsi, %rdx
	call	tac_primary
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L190
	cmpb	$0, 20(%rax)
	jne	.L202
.L191:
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
	je	.L203
	movq	%rbx, %r9
	movl	$116, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L193:
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
	je	.L204
	movq	.refptr.name_float(%rip), %r13
	cmpq	0(%r13), %rax
	je	.L205
	movq	8(%rax), %rbx
	call	__getreent
	leaq	.LC18(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	xorl	%ebx, %ebx
	call	fprintf
	jmp	.L174
	.p2align 4,,10
	.p2align 3
.L176:
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
.L185:
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
.L174:
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
.L184:
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
	jmp	.L174
	.p2align 4,,10
	.p2align 3
.L183:
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
	jmp	.L174
	.p2align 4,,10
	.p2align 3
.L182:
	movl	$24, %ecx
	call	alloc_memory
	movb	$1, (%rax)
	movq	%rax, %rbx
	movl	$4, 16(%rax)
	movq	.refptr.name_bool(%rip), %rax
	movq	(%rax), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	jmp	.L174
	.p2align 4,,10
	.p2align 3
.L181:
	movl	$24, %ecx
	call	alloc_memory
	movb	$0, (%rax)
	movq	%rax, %rbx
	movl	$4, 16(%rax)
	movq	.refptr.name_bool(%rip), %rax
	movq	(%rax), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	jmp	.L174
	.p2align 4,,10
	.p2align 3
.L180:
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
.L179:
	movq	(%rcx), %rcx
	movq	%rsi, %rdx
	call	tac_primary
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L187
	cmpb	$0, 20(%rax)
	jne	.L206
.L187:
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
	je	.L207
	movq	%rbx, %r9
	movl	$116, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L189:
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
	jmp	.L174
.L175:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC19(%rip), %rdx
	xorl	%ebx, %ebx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L174
	.p2align 4,,10
	.p2align 3
.L205:
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
.L195:
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L174
	.p2align 4,,10
	.p2align 3
.L203:
	movl	$116, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L193
	.p2align 4,,10
	.p2align 3
.L207:
	movl	$116, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L189
	.p2align 4,,10
	.p2align 3
.L206:
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r12
	jmp	.L187
	.p2align 4,,10
	.p2align 3
.L202:
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r12
	jmp	.L191
	.p2align 4,,10
	.p2align 3
.L204:
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
	jmp	.L195
	.section	.text.unlikely,"x"
	.def	tac_primary.cold;	.scl	3;	.type	32;	.endef
tac_primary.cold:
.L190:
	movq	8, %rax
	ud2
	.text
	.section	.text.unlikely,"x"
.LCOLDE20:
	.text
.LHOTE20:
	.section .rdata,"dr"
	.align 8
.LC21:
	.ascii "[warning] Left-hand side of assignment is not a variable\12\0"
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
	je	.L233
	movq	16(%rcx), %rcx
	call	tac_expression
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L210
	cmpb	$0, 20(%rax)
	jne	.L234
.L210:
	movl	24(%r12), %eax
	movq	(%r12), %rcx
	cmpl	$18, %eax
	ja	.L211
	leaq	CSWTCH.18(%rip), %rdx
	movl	(%rdx,%rax,4), %r13d
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rdi
	movl	24(%r12), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L212
	cmpl	$14, %r13d
	jne	.L222
	movl	16(%rdi), %eax
	testl	%eax, %eax
	jne	.L235
.L217:
	movl	$32, %ecx
	call	alloc_memory
	movl	$14, 24(%rax)
	movq	%rax, %rdx
	movq	%rdi, (%rax)
	movq	%rsi, 8(%rax)
	movq	$0, 16(%rax)
	cmpb	$0, 20(%rdi)
	jne	.L236
.L218:
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
.L211:
	movq	%rbx, %rdx
	movl	$25, %r13d
	call	tac_expression
	movq	%rax, %rdi
	movl	24(%r12), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L212
.L222:
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
	je	.L237
	movq	%r15, %r9
	movl	$116, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L215:
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
	jne	.L238
.L216:
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
	je	.L217
.L235:
	call	__getreent
	movl	$57, %r8d
	movl	$1, %edx
	leaq	.LC21(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L217
	.p2align 4,,10
	.p2align 3
.L212:
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
	je	.L239
	movq	%r15, %r9
	movl	$116, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L220:
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
	jne	.L240
.L221:
	movl	$32, %ecx
	call	alloc_memory
	movq	%rsi, 16(%rax)
	movq	%rax, %rdx
	movq	%r12, %rsi
	movl	%r13d, 24(%rax)
	movq	%r12, (%rax)
	movq	%rdi, 8(%rax)
	jmp	.L218
	.p2align 4,,10
	.p2align 3
.L233:
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
.L239:
	movl	$116, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L220
	.p2align 4,,10
	.p2align 3
.L237:
	movl	$116, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L215
	.p2align 4,,10
	.p2align 3
.L236:
	movl	$32, %ecx
	call	alloc_memory
	movl	$24, 24(%rax)
	movq	%rax, %rdx
	movq	%rdi, (%rax)
	movq	%rsi, 8(%rax)
	movq	$0, 16(%rax)
	jmp	.L218
	.p2align 4,,10
	.p2align 3
.L234:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rsi
	jmp	.L210
	.p2align 4,,10
	.p2align 3
.L240:
	movq	%rdi, %rcx
	movq	%rbx, %rdx
	call	load_rvalue.part.0
	movq	%rax, %rdi
	jmp	.L221
	.p2align 4,,10
	.p2align 3
.L238:
	movq	%rbx, %rdx
	movq	%rdi, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r14
	jmp	.L216
	.p2align 4
	.globl	tac_if
	.def	tac_if;	.scl	2;	.type	32;	.endef
tac_if:
	pushq	%r15
	pushq	%r14
	leaq	.LC0(%rip), %r14
	pushq	%r13
	movq	%rcx, %r13
	movl	$24, %ecx
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$72, %rsp
	call	alloc_memory
	movq	80(%rbx), %rsi
	movq	%r14, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %rdi
	leaq	1(%rsi), %rax
	movq	%rax, 80(%rbx)
	call	create_string
	movq	%rax, 8(%rdi)
	movq	%rax, %rcx
	cmpq	$-1, %rsi
	je	.L275
	movq	%rsi, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L243:
	movq	$0, 16(%rdi)
	movl	$24, %ecx
	call	alloc_memory
	movq	80(%rbx), %rbp
	movq	%r14, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %rsi
	leaq	1(%rbp), %rax
	movq	%rax, 80(%rbx)
	call	create_string
	movq	%rax, 8(%rsi)
	movq	%rax, %rcx
	cmpq	$-1, %rbp
	je	.L276
	movq	%rbp, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L245:
	movq	$0, 16(%rsi)
	movq	16(%r13), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L250
	movq	24(%r13), %rcx
	call	list_is_empty
	movq	%rsi, 56(%rsp)
	testb	%al, %al
	je	.L250
.L249:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbx, %rdx
	movl	$6, 16(%rax)
	movq	%rax, %r12
	movq	$0, 8(%rax)
	movq	56(%rsp), %rax
	movb	$0, 20(%r12)
	movq	0(%r13), %rcx
	movq	%rax, (%r12)
	call	tac_expression
	movl	$24, %ecx
	movq	%rax, 40(%rsp)
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
	movq	40(%rsp), %r9
	movq	32(%rsp), %r8
	movq	%rax, %rdx
	movq	%rbp, 16(%rax)
	movq	%r8, 8(%rax)
	movq	%r9, (%rax)
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
	movq	8(%r13), %rcx
	call	list_copy
	movq	%rax, %rdi
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L253:
	movq	%rbx, %rdx
	call	tac_statement
.L252:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L253
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
	movq	16(%r13), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L277
.L254:
	movq	24(%r13), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L278
.L265:
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
.L250:
	movl	$24, %ecx
	call	alloc_memory
	movq	80(%rbx), %rbp
	movq	%r14, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %r15
	movq	%rax, 56(%rsp)
	leaq	1(%rbp), %rax
	movq	%rax, 80(%rbx)
	call	create_string
	movq	%rax, 8(%r15)
	movq	%rax, %rcx
	cmpq	$-1, %rbp
	je	.L279
	movq	%rbp, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L251:
	movq	56(%rsp), %rax
	movq	$0, 16(%rax)
	jmp	.L249
	.p2align 4,,10
	.p2align 3
.L279:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L251
	.p2align 4,,10
	.p2align 3
.L276:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L245
	.p2align 4,,10
	.p2align 3
.L275:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L243
	.p2align 4,,10
	.p2align 3
.L278:
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
	movq	24(%r13), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L266
	.p2align 4,,10
	.p2align 3
.L267:
	movq	%rbx, %rdx
	call	tac_statement
.L266:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L267
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
	jmp	.L265
	.p2align 4,,10
	.p2align 3
.L277:
	movq	16(%r13), %rcx
	call	list_copy
	movq	%rax, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L255:
	movq	32(%rsp), %rcx
	call	list_pop
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L254
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
	movq	%r14, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %rdi
	leaq	1(%rsi), %rax
	movq	%rax, 80(%rbx)
	call	create_string
	movq	%rax, 8(%rdi)
	movq	%rax, %rcx
	cmpq	$-1, %rsi
	je	.L280
	movq	%rsi, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L257:
	movq	$0, 16(%rdi)
	movl	$24, %ecx
	call	alloc_memory
	movq	80(%rbx), %r15
	movq	%r14, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %rsi
	leaq	1(%r15), %rax
	movq	%rax, 80(%rbx)
	call	create_string
	movq	%rax, 8(%rsi)
	movq	%rax, %rcx
	cmpq	$-1, %r15
	je	.L281
	movq	%r15, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L259:
	movq	$0, 16(%rsi)
	movq	0(%rbp), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	32(%rsp), %rcx
	movq	%rax, 40(%rsp)
	call	list_is_empty
	testb	%al, %al
	jne	.L282
.L261:
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
	movq	%rdi, (%rax)
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movb	$0, 20(%rax)
	movq	%rax, 48(%rsp)
	call	alloc_memory
	movq	48(%rsp), %r9
	movq	%rax, %rdx
	movl	$19, 24(%rax)
	movq	40(%rsp), %rax
	movq	%r9, 8(%rdx)
	movq	%rax, (%rdx)
	movq	16(%rbx), %rax
	movq	%r15, 16(%rdx)
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movq	%rdi, (%rax)
	movq	%rax, %r15
	call	create_list
	movq	%r15, %rdx
	movq	%rax, 8(%r15)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%r15, 16(%rbx)
	movq	8(%rbp), %rcx
	call	list_copy
	movq	%rax, %rdi
	jmp	.L262
	.p2align 4,,10
	.p2align 3
.L263:
	movq	%rbx, %rdx
	call	tac_statement
.L262:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L263
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
	jmp	.L255
	.p2align 4,,10
	.p2align 3
.L281:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L259
	.p2align 4,,10
	.p2align 3
.L280:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L257
	.p2align 4,,10
	.p2align 3
.L282:
	movq	24(%r13), %rcx
	call	list_is_empty
	testb	%al, %al
	cmovne	56(%rsp), %rsi
	jmp	.L261
	.section .rdata,"dr"
	.align 8
.LC22:
	.ascii "[warning] 'break' statement used outside of loop\12\0"
	.align 8
.LC23:
	.ascii "[warning] 'continue' statement used outside of loop\12\0"
	.align 8
.LC24:
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
	ja	.L284
	movq	%rdx, %rdi
	leaq	.L286(%rip), %rdx
	movq	%rcx, %rsi
	movslq	(%rdx,%rbx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L286:
	.long	.L293-.L286
	.long	.L283-.L286
	.long	.L291-.L286
	.long	.L290-.L286
	.long	.L289-.L286
	.long	.L288-.L286
	.long	.L287-.L286
	.long	.L285-.L286
	.text
	.p2align 4,,10
	.p2align 3
.L287:
	movq	32(%rdi), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L295
	movq	32(%rdi), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	je	.L295
.L309:
	movl	$32, %ecx
	call	alloc_memory
	movl	$20, 24(%rax)
	movq	%rax, %rdx
	jmp	.L307
	.p2align 4,,10
	.p2align 3
.L285:
	movq	40(%rdi), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L296
	movq	40(%rdi), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L309
.L296:
	call	__getreent
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC23(%rip), %rcx
	movq	24(%rax), %r9
	jmp	.L308
	.p2align 4,,10
	.p2align 3
.L291:
	movq	(%rcx), %rcx
	addq	$32, %rsp
	movq	%rdi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	tac_if
	.p2align 4,,10
	.p2align 3
.L293:
	movq	(%rcx), %rcx
	addq	$32, %rsp
	movq	%rdi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	tac_expression
	.p2align 4,,10
	.p2align 3
.L283:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L289:
	movq	(%rcx), %rcx
	addq	$32, %rsp
	movq	%rdi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	tac_for
	.p2align 4,,10
	.p2align 3
.L288:
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
	je	.L294
	movq	%rdi, %rdx
	call	tac_expression
	movq	%rax, %rbx
.L294:
	movl	$32, %ecx
	call	alloc_memory
	movl	$21, 24(%rax)
	movq	%rax, %rdx
.L307:
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
.L290:
	movq	(%rcx), %rcx
	addq	$32, %rsp
	movq	%rdi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	tac_while
	.p2align 4,,10
	.p2align 3
.L295:
	call	__getreent
	movl	$49, %r8d
	movl	$1, %edx
	leaq	.LC22(%rip), %rcx
	movq	24(%rax), %r9
.L308:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	fwrite
.L284:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC24(%rip), %rdx
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
	leaq	.LC0(%rip), %r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	movq	%rcx, %rdi
	movl	$24, %ecx
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$56, %rsp
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
	je	.L329
	movq	%rsi, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L312:
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
	je	.L330
	movq	%rsi, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L314:
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
	je	.L331
	movq	%rsi, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L316:
	cmpq	$0, 8(%rdi)
	movl	$24, %ecx
	movq	$0, 16(%r12)
	je	.L317
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
	movq	%rax, 40(%rsp)
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
.L318:
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
	je	.L332
	movq	%rsi, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L320:
	cmpq	$0, 16(%rdi)
	movq	$0, 16(%r14)
	movl	$24, %ecx
	je	.L321
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r14, (%rax)
	call	list_append
.L322:
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
	jmp	.L324
	.p2align 4,,10
	.p2align 3
.L325:
	movq	%rbx, %rdx
	call	tac_statement
.L324:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L325
	movq	40(%rbx), %rcx
	call	list_pop_back
	movq	32(%rbx), %rcx
	call	list_pop_back
	cmpq	$0, 16(%rdi)
	je	.L326
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
.L326:
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
	je	.L333
.L327:
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
.L321:
	cmpq	$0, 8(%rdi)
	je	.L323
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	call	list_append
	jmp	.L322
	.p2align 4,,10
	.p2align 3
.L332:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L320
	.p2align 4,,10
	.p2align 3
.L331:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L316
	.p2align 4,,10
	.p2align 3
.L330:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L314
	.p2align 4,,10
	.p2align 3
.L329:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L312
	.p2align 4,,10
	.p2align 3
.L317:
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
	jmp	.L318
	.p2align 4,,10
	.p2align 3
.L333:
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
	jmp	.L327
	.p2align 4,,10
	.p2align 3
.L323:
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	call	list_append
	jmp	.L322
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
	je	.L344
	movq	%rbp, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L336:
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
	je	.L345
	movq	%rbp, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L338:
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
	je	.L346
	movq	%r14, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L340:
	movq	$0, 16(%rbp)
	movq	(%rsi), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movl	$24, %ecx
	movq	%rax, %r15
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
	jmp	.L341
	.p2align 4,,10
	.p2align 3
.L342:
	movq	%rbx, %rdx
	call	tac_statement
.L341:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L342
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
.L344:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L336
	.p2align 4,,10
	.p2align 3
.L346:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L340
	.p2align 4,,10
	.p2align 3
.L345:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L338
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
	jmp	.L348
	.p2align 4,,10
	.p2align 3
.L354:
	movq	16(%rsi), %rcx
	movq	%r15, %rdx
	call	list_append
.L348:
	movq	%rdi, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L365
	movq	8(%rax), %r13
	movq	(%rax), %r14
	testq	%r13, %r13
	je	.L355
	movl	32(%r14), %edx
	xorl	%r12d, %r12d
	testl	%edx, %edx
	jne	.L352
	movq	24(%r14), %rax
	movq	24(%rbx), %r12
	movq	%rax, 24(%rbx)
.L352:
	movq	%rbx, %rdx
	movq	%r13, %rcx
	call	search_var
	movq	%rax, %r15
	movl	32(%r14), %eax
	testl	%eax, %eax
	jne	.L353
	movq	%r12, 24(%rbx)
.L353:
	testq	%r15, %r15
	jne	.L354
.L355:
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
	je	.L366
	movq	%r13, %r9
	movl	$112, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L356:
	movq	%r14, 16(%r15)
	jmp	.L354
	.p2align 4,,10
	.p2align 3
.L366:
	movl	$112, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L356
	.p2align 4,,10
	.p2align 3
.L365:
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
	je	.L367
	movq	%rdi, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L359:
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
	jmp	.L360
	.p2align 4,,10
	.p2align 3
.L361:
	movq	%rbx, %rdx
	call	tac_statement
.L360:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L361
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
.L367:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L359
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
	jmp	.L369
	.p2align 4,,10
	.p2align 3
.L370:
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	movq	%rbx, %r8
	call	create_var.constprop.0
	movq	16(%rsi), %rcx
	movq	%rax, %rdx
	call	list_append
.L369:
	movq	%rdi, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L370
	movl	$24, %ecx
	leaq	.LC0(%rip), %r14
	call	alloc_memory
	movq	80(%rbx), %rdi
	movq	%r14, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %r13
	leaq	1(%rdi), %rax
	movq	%rax, 80(%rbx)
	call	create_string
	movq	%rax, 8(%r13)
	movq	%rax, %rcx
	cmpq	$-1, %rdi
	je	.L379
	movq	%rdi, %r9
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L372:
	movq	$0, 16(%r13)
	movl	$16, %ecx
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
	je	.L380
.L373:
	movq	24(%r12), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L376
	.p2align 4,,10
	.p2align 3
.L377:
	movq	%rbx, %rdx
	call	tac_statement
.L376:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L377
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
.L379:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L372
	.p2align 4,,10
	.p2align 3
.L380:
	movq	24(%rbx), %rax
	movl	$24, %ecx
	movq	(%rax), %r13
	call	alloc_memory
	movq	72(%rbx), %r15
	movq	%r14, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %rsi
	leaq	1(%r15), %rax
	movq	%rax, 72(%rbx)
	call	create_string
	movq	%rax, 8(%rsi)
	movq	%rax, %rcx
	cmpq	$-1, %r15
	je	.L381
	movq	%r15, %r9
	movl	$116, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L375:
	movq	8(%rbx), %rax
	movq	%r13, 16(%rsi)
	movq	%rsi, %rdx
	movq	24(%rax), %rcx
	call	list_append
	movl	$24, %ecx
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
	jmp	.L373
	.p2align 4,,10
	.p2align 3
.L381:
	movl	$116, %r8d
	leaq	.LC1(%rip), %rdx
	call	sprintf
	jmp	.L375
	.section .rdata,"dr"
	.align 8
.LC25:
	.ascii "[warning] Unsupported class member type for tac_class: %d\12\0"
	.text
	.p2align 4
	.globl	tac_class
	.def	tac_class;	.scl	2;	.type	32;	.endef
tac_class:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$32, %rsp
	movaps	%xmm6, 32(%rsp)
	movq	%rcx, 24(%rdx)
	movq	8(%rcx), %rcx
	call	list_copy
	movl	$24, %ecx
	movq	(%rdi), %xmm6
	movq	%rax, %rsi
	call	alloc_memory
	movq	%rax, %r12
	call	create_list
	movq	%r12, %rdx
	movq	%rax, %xmm0
	punpcklqdq	%xmm6, %xmm0
	movups	%xmm0, (%r12)
	movq	24(%rdi), %rax
	movq	%rax, 16(%r12)
	movq	(%rbx), %rax
	movq	(%rax), %rcx
	call	list_append
	movq	.refptr.name_int(%rip), %rdi
	.p2align 4,,10
	.p2align 3
.L383:
	movq	%rsi, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L404
.L396:
	movl	8(%rax), %r14d
	testl	%r14d, %r14d
	je	.L384
	cmpl	$1, %r14d
	je	.L385
	call	__getreent
	movl	%r14d, %r8d
	leaq	.LC25(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	movq	%rsi, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L396
.L404:
	movq	$0, 24(%rbx)
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
.L385:
	movq	(%rax), %r15
	movq	(%rbx), %rax
	movq	(%rax), %rcx
	call	list_pop_back
	movq	%rax, %r14
	movq	(%rbx), %rax
	movq	%r14, %rdx
	movq	(%rax), %rcx
	call	list_append
	movq	(%r15), %r12
	movq	8(%r15), %r15
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbx, %r9
	movl	$97, %r8d
	movq	%r12, %rdx
	movq	%r15, %rcx
	movq	%rax, %r13
	call	create_var
	movq	%r12, %xmm1
	movq	%rax, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, 0(%r13)
	movq	16(%r14), %rax
	movq	%rax, 16(%r13)
	testq	%r12, %r12
	je	.L388
	cmpq	(%rdi), %r12
	je	.L402
	movq	.refptr.name_float(%rip), %rdx
	cmpq	(%rdx), %r12
	je	.L402
	movq	.refptr.name_string(%rip), %rdx
	cmpq	(%rdx), %r12
	je	.L402
	movq	.refptr.name_bool(%rip), %rcx
	cmpq	(%rcx), %r12
	je	.L403
	movq	.refptr.name_void(%rip), %rcx
	cmpq	(%rcx), %r12
	je	.L403
	movl	32(%r12), %edx
	testl	%edx, %edx
	jne	.L394
	movq	24(%r12), %rdx
	movq	(%r14), %rcx
	addq	24(%rdx), %rax
	movq	%rax, 16(%r14)
	testq	%rcx, %rcx
	jne	.L395
	.p2align 4,,10
	.p2align 3
.L405:
	call	__getreent
	movl	$63, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L383
	.p2align 4,,10
	.p2align 3
.L403:
	addq	$1, %rax
.L388:
	movq	(%r14), %rcx
	movq	%rax, 16(%r14)
	testq	%rcx, %rcx
	je	.L405
.L395:
	movq	%r13, %rdx
	call	list_append
	jmp	.L383
	.p2align 4,,10
	.p2align 3
.L384:
	movq	(%rax), %rcx
	movq	%rbx, %rdx
	call	tac_method
	jmp	.L383
	.p2align 4,,10
	.p2align 3
.L394:
	movq	8(%r12), %r15
	call	__getreent
	leaq	.LC4(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%r15, %r8
	call	fprintf
	movq	16(%r14), %rax
	.p2align 4,,10
	.p2align 3
.L402:
	addq	$8, %rax
	jmp	.L388
	.section .rdata,"dr"
.LC26:
	.ascii "main\0"
	.text
	.p2align 4
	.globl	tac_code
	.def	tac_code;	.scl	2;	.type	32;	.endef
tac_code:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r13
	leaq	.LC26(%rip), %r13
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
.L407:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L415
.L413:
	movl	8(%rbx), %eax
	cmpl	$1, %eax
	je	.L416
	cmpl	$2, %eax
	je	.L417
	testl	%eax, %eax
	jne	.L407
	movq	(%rbx), %rcx
	movq	%rsi, %r8
	movq	%r12, %rdx
	call	tac_import
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L413
.L415:
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
.L416:
	movq	(%rbx), %rcx
	movq	%rsi, %rdx
	call	tac_function
	movq	(%rbx), %rax
	movq	%r13, %rdx
	movq	(%rax), %rbx
	movq	8(%rbx), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L407
	movq	%rbx, 8(%r12)
	jmp	.L407
	.p2align 4,,10
	.p2align 3
.L417:
	movq	(%rbx), %rcx
	movq	%rsi, %rdx
	call	tac_class
	jmp	.L407
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
	.def	list_is_empty;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	make_method_name;	.scl	2;	.type	32;	.endef
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
