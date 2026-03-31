	.file	"D:\\TC\\temp\\codegen.c"
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "[warning] Unsupported type for size lookup: %s\12\0"
	.text
	.p2align 4
	.def	emit_param_instruction.part.0;	.scl	3;	.type	32;	.endef
emit_param_instruction.part.0:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	8(%rcx), %rax
	testq	%rax, %rax
	je	.L5
	movq	.refptr.name_int(%rip), %rbp
	cmpq	0(%rbp), %rax
	je	.L3
	movq	.refptr.name_float(%rip), %rdx
	cmpq	(%rdx), %rax
	je	.L3
	movq	.refptr.name_string(%rip), %rdx
	cmpq	(%rdx), %rax
	je	.L3
	movq	.refptr.name_bool(%rip), %rdx
	cmpq	(%rdx), %rax
	je	.L7
	movq	.refptr.name_void(%rip), %rdx
	cmpq	(%rdx), %rax
	je	.L7
	movl	32(%rax), %edx
	testl	%edx, %edx
	jne	.L4
	movq	24(%rax), %rax
	movq	24(%rax), %r12
.L2:
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movq	%r12, (%rax)
	movq	%rax, %rbx
	movl	$1, 16(%rax)
	movq	0(%rbp), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	call	alloc_memory
	movq	%rsi, 8(%rax)
	movq	%rax, %rdx
	movl	$17, 24(%rax)
	movq	%rbx, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rdi), %rax
	movq	8(%rax), %rcx
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	list_append
	.p2align 4,,10
	.p2align 3
.L7:
	movl	$1, %r12d
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L5:
	movq	.refptr.name_int(%rip), %rbp
	xorl	%r12d, %r12d
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L4:
	movq	8(%rax), %rbx
	call	__getreent
	leaq	.LC0(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	call	fprintf
.L3:
	movl	$8, %r12d
	jmp	.L2
	.section .rdata,"dr"
.LC1:
	.ascii "\0"
.LC2:
	.ascii "$%d-error\0"
.LC3:
	.ascii "$%c%zu\0"
	.text
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
	movq	64(%rdi), %rsi
	movl	$32, %edx
	leaq	.LC1(%rip), %rcx
	movq	$0, (%rax)
	movq	%rax, %rbx
	leaq	1(%rsi), %rax
	movq	%rax, 64(%rdi)
	call	create_string
	movq	%rax, 8(%rbx)
	movq	%rax, %rcx
	cmpq	$-1, %rsi
	je	.L14
	movq	%rsi, %r9
	movl	$116, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L12:
	movq	%r13, 16(%rbx)
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
.L14:
	movl	$116, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L12
	.section .rdata,"dr"
.LC4:
	.ascii "<unknown>\0"
	.align 8
.LC5:
	.ascii "[warning] Invalid attribute access\12\0"
	.align 8
.LC6:
	.ascii "[warning] Attribute '%s' not found in class '%s', fallback index %zu\12\0"
.LC7:
	.ascii "$a%zu\0"
	.text
	.p2align 4
	.def	emit_attribute_access;	.scl	3;	.type	32;	.endef
emit_attribute_access:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$64, %rsp
	testq	%rcx, %rcx
	je	.L40
	movq	%rdx, %rbx
	testq	%rdx, %rdx
	je	.L40
	cmpb	$0, 20(%rcx)
	movq	%rcx, %rdi
	movq	%r8, %r12
	jne	.L46
.L19:
	movq	8(%rdi), %rsi
	testq	%rsi, %rsi
	je	.L21
	movl	32(%rsi), %eax
	testl	%eax, %eax
	jne	.L47
.L21:
	movq	(%r12), %rax
	movq	(%rax), %rcx
	call	list_copy
	movq	%rax, %r13
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L24:
	cmpq	%rsi, 8(%rax)
	je	.L23
.L22:
	movq	%r13, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L24
.L25:
	movl	$24, %ecx
	movq	(%rbx), %rsi
	leaq	.LC1(%rip), %r15
	call	alloc_memory
	movq	40(%r12), %r13
	movq	%r15, %rcx
	movl	$32, %edx
	movq	%rbx, (%rax)
	movq	%rax, %r14
	leaq	1(%r13), %rax
	movq	%rax, 40(%r12)
	call	create_string
	movq	%rax, 8(%r14)
	movq	%rax, %rcx
	cmpq	$-1, %r13
	je	.L48
	movq	%r13, %r9
	movl	$97, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L28:
	movq	%rsi, 16(%r14)
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L23:
	movq	(%rax), %rcx
	testq	%rcx, %rcx
	je	.L25
	call	list_copy
	xorl	%r13d, %r13d
	movq	%rax, %r14
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L32:
	cmpq	(%rax), %rbx
	je	.L31
	addq	$1, %r13
.L30:
	movq	%r14, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L32
	movl	$24, %ecx
	leaq	.LC1(%rip), %r15
	call	alloc_memory
	movl	$32, %edx
	movq	%r15, %rcx
	movq	%rbx, (%rax)
	movq	%rax, %r14
	movq	(%rbx), %rax
	movq	%rax, 16(%r14)
	call	create_string
	movq	%rax, 8(%r14)
	testq	%rsi, %rsi
	je	.L49
	movq	8(%rsi), %rsi
.L37:
	movq	8(%rbx), %r8
	movq	%r8, 56(%rsp)
	call	__getreent
	movq	56(%rsp), %r8
	movq	%rsi, %r9
	leaq	.LC6(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%r13, 32(%rsp)
	call	fprintf
	movq	8(%r14), %rcx
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L47:
	xorl	%esi, %esi
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L31:
	movl	$24, %ecx
	leaq	.LC1(%rip), %r15
	call	alloc_memory
	movq	%r15, %rcx
	movl	$32, %edx
	movq	%rbx, (%rax)
	movq	%rax, %r14
	movq	(%rbx), %rax
	movq	%rax, 16(%r14)
	call	create_string
	movq	%rax, 8(%r14)
	movq	%rax, %rcx
.L38:
	movq	%r13, %r8
	leaq	.LC7(%rip), %rdx
	call	sprintf
.L29:
	movl	$24, %ecx
	movq	(%rbx), %rsi
	call	alloc_memory
	movq	64(%r12), %r13
	movq	%r15, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %rbx
	leaq	1(%r13), %rax
	movq	%rax, 64(%r12)
	call	create_string
	movq	%rax, 8(%rbx)
	movq	%rax, %rcx
	cmpq	$-1, %r13
	je	.L50
	movq	%r13, %r9
	movl	$116, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L35:
	movq	%rsi, 16(%rbx)
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbx, %xmm0
	movl	$24, %ecx
	movhps	16(%rbx), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rsi
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movq	%r14, %xmm0
	movl	$32, %ecx
	movhps	16(%r14), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movq	%rdi, 8(%rax)
	movq	%rax, %rdx
	movl	$15, 24(%rax)
	movq	%rsi, (%rax)
	movq	%rbx, 16(%rax)
	movq	16(%r12), %rax
	movq	8(%rax), %rcx
	call	list_append
	movb	$1, 20(%rsi)
.L15:
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
.L50:
	movl	$116, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L48:
	movl	$97, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L28
.L49:
	leaq	.LC4(%rip), %rsi
	jmp	.L37
	.p2align 4,,10
	.p2align 3
.L46:
	movq	%r8, %rdx
	call	load_rvalue.part.0
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L19
	xorl	%esi, %esi
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L40:
	call	__getreent
	movl	$35, %r8d
	movl	$1, %edx
	xorl	%esi, %esi
	movq	24(%rax), %r9
	leaq	.LC5(%rip), %rcx
	call	fwrite
	jmp	.L15
	.section .rdata,"dr"
	.align 8
.LC8:
	.ascii "[warning] Unsupported symbol kind for import: %d\12\0"
	.text
	.p2align 4
	.globl	codegen_import
	.def	codegen_import;	.scl	2;	.type	32;	.endef
codegen_import:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r13
	pushq	%r12
	movq	%rdx, %r12
	pushq	%rdi
	movq	%r8, %rdi
	pushq	%rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	movq	(%rcx), %rsi
	movl	32(%rsi), %ebx
	cmpl	$3, %ebx
	je	.L61
	leal	-1(%rbx), %eax
	cmpl	$1, %eax
	jbe	.L62
	testl	%ebx, %ebx
	jne	.L58
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, %rbx
	call	create_list
	movq	%rsi, %xmm1
	movq	$0, 16(%rbx)
	movq	%rax, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, (%rbx)
	movq	(%r12), %rcx
.L60:
	leaq	-40(%rbp), %rsp
	movq	%rbx, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	jmp	list_append
	.p2align 4,,10
	.p2align 3
.L58:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC8(%rip), %rdx
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
.L62:
	movl	$24, %ecx
	movq	(%rsi), %r13
	call	alloc_memory
	leaq	.LC1(%rip), %rcx
	movl	$32, %edx
	movq	%rsi, (%rax)
	movq	80(%rdi), %rsi
	movq	%rax, %rbx
	leaq	1(%rsi), %rax
	movq	%rax, 80(%rdi)
	call	create_string
	movq	%rax, 8(%rbx)
	movq	%rax, %rcx
	cmpq	$-1, %rsi
	je	.L63
	movq	%rsi, %r9
	movl	$102, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L57:
	movq	%r13, 16(%rbx)
	movq	16(%r12), %rcx
	jmp	.L60
	.p2align 4,,10
	.p2align 3
.L61:
	movl	$24, %ecx
	movq	(%rsi), %r13
	call	alloc_memory
	leaq	.LC1(%rip), %rcx
	movl	$32, %edx
	movq	%rsi, (%rax)
	movq	56(%rdi), %rsi
	movq	%rax, %rbx
	leaq	1(%rsi), %rax
	movq	%rax, 56(%rdi)
	call	create_string
	movq	%rax, 8(%rbx)
	movq	%rax, %rcx
	cmpq	$-1, %rsi
	je	.L64
	movq	%rsi, %r9
	movl	$118, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L63:
	movl	$102, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L64:
	movl	$118, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L57
	.section .rdata,"dr"
	.align 8
.LC9:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
	.align 8
.LC10:
	.ascii "[warning] Unsupported variable type for codegen_variable: %d\12\0"
	.text
	.p2align 4
	.globl	codegen_variable
	.def	codegen_variable;	.scl	2;	.type	32;	.endef
codegen_variable:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	movq	%rcx, %r13
	pushq	%r12
	movl	%r8d, %r12d
	pushq	%rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$32, %rsp
	movq	8(%rcx), %rdi
	movq	(%rcx), %r14
	movl	$24, %ecx
	movaps	%xmm6, 32(%rsp)
	call	alloc_memory
	movq	%rdi, (%rax)
	leal	-97(%r12), %edi
	movq	%rax, %rbx
	cmpl	$21, %edi
	ja	.L66
	leaq	.L68(%rip), %rdx
	movl	%edi, %eax
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L68:
	.long	.L73-.L68
	.long	.L72-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L71-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L70-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L69-.L68
	.long	.L66-.L68
	.long	.L67-.L68
	.text
	.p2align 4,,10
	.p2align 3
.L66:
	leaq	.LC1(%rip), %rcx
	movl	$32, %edx
	call	create_string
	movq	%rax, 8(%rbx)
	movq	%rax, %rcx
.L74:
	movl	%r12d, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L77:
	movq	%r14, 16(%rbx)
	cmpl	$21, %edi
	ja	.L78
	leaq	.L80(%rip), %rdx
	movslq	(%rdx,%rdi,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L80:
	.long	.L84-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L83-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L82-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L79-.L80
	.long	.L78-.L80
	.long	.L79-.L80
	.text
	.p2align 4,,10
	.p2align 3
.L78:
	call	__getreent
	movaps	32(%rsp), %xmm6
	movl	%r12d, %r8d
	leaq	.LC10(%rip), %rdx
	movq	24(%rax), %rcx
	leaq	-56(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L79:
	movq	8(%rsi), %rax
	movq	24(%rax), %rcx
.L99:
	movq	%rbx, %rdx
.L100:
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
	jmp	list_append
	.p2align 4,,10
	.p2align 3
.L82:
	movq	8(%rsi), %rax
	movq	16(%rax), %rcx
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L83:
	movq	(%rsi), %rax
	movq	16(%rax), %rcx
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L84:
	movq	(%rsi), %rax
	movq	(%rax), %rcx
	call	list_pop_back
	movq	%rax, %rdi
	movq	(%rsi), %rax
	movq	%rdi, %rdx
	movq	(%rax), %rcx
	call	list_append
	movdqu	0(%r13), %xmm0
	movl	$24, %ecx
	movdqa	%xmm0, %xmm6
	movq	%xmm0, %rbx
	shufpd	$1, %xmm0, %xmm6
	call	alloc_memory
	movq	%rax, %rsi
	movups	%xmm6, (%rax)
	movq	16(%rdi), %rax
	movq	%rax, 16(%rsi)
	testq	%rbx, %rbx
	je	.L85
	movq	.refptr.name_int(%rip), %rdx
	cmpq	%rbx, (%rdx)
	je	.L97
	movq	.refptr.name_float(%rip), %rdx
	cmpq	%rbx, (%rdx)
	je	.L97
	movq	.refptr.name_string(%rip), %rdx
	cmpq	%rbx, (%rdx)
	je	.L97
	movq	.refptr.name_bool(%rip), %rdx
	cmpq	%rbx, (%rdx)
	je	.L98
	movq	.refptr.name_void(%rip), %rdx
	cmpq	%rbx, (%rdx)
	je	.L98
	movl	32(%rbx), %edx
	testl	%edx, %edx
	jne	.L91
	movq	24(%rbx), %rdx
	addq	24(%rdx), %rax
.L85:
	movq	(%rdi), %rcx
	movq	%rax, 16(%rdi)
	movq	%rsi, %rdx
	testq	%rcx, %rcx
	jne	.L100
	call	__getreent
	movaps	32(%rsp), %xmm6
	movl	$63, %r8d
	movl	$1, %edx
	movq	24(%rax), %r9
	leaq	-56(%rbp), %rsp
	leaq	.LC9(%rip), %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L73:
	movq	40(%rsi), %r15
	leaq	1(%r15), %rax
	movq	%rax, 40(%rsi)
	.p2align 4,,10
	.p2align 3
.L75:
	leaq	.LC1(%rip), %rcx
	movl	$32, %edx
	call	create_string
	movq	%rax, 8(%rbx)
	movq	%rax, %rcx
	cmpq	$-1, %r15
	je	.L74
	movq	%r15, %r9
	movl	%r12d, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
	jmp	.L77
	.p2align 4,,10
	.p2align 3
.L72:
	movq	72(%rsi), %r15
	leaq	1(%r15), %rax
	movq	%rax, 72(%rsi)
	jmp	.L75
	.p2align 4,,10
	.p2align 3
.L71:
	movq	80(%rsi), %r15
	leaq	1(%r15), %rax
	movq	%rax, 80(%rsi)
	jmp	.L75
	.p2align 4,,10
	.p2align 3
.L70:
	movq	48(%rsi), %r15
	leaq	1(%r15), %rax
	movq	%rax, 48(%rsi)
	jmp	.L75
	.p2align 4,,10
	.p2align 3
.L69:
	movq	64(%rsi), %r15
	leaq	1(%r15), %rax
	movq	%rax, 64(%rsi)
	jmp	.L75
	.p2align 4,,10
	.p2align 3
.L67:
	movq	56(%rsi), %r15
	leaq	1(%r15), %rax
	movq	%rax, 56(%rsi)
	jmp	.L75
	.p2align 4,,10
	.p2align 3
.L91:
	movq	8(%rbx), %rbx
	call	__getreent
	leaq	.LC0(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	call	fprintf
	movq	16(%rdi), %rax
.L97:
	addq	$8, %rax
	jmp	.L85
	.p2align 4,,10
	.p2align 3
.L98:
	addq	$1, %rax
	jmp	.L85
	.section .rdata,"dr"
	.align 8
.LC11:
	.ascii "[warning] Invalid variable access input\12\0"
	.align 8
.LC12:
	.ascii "[warning] Variable access name is NULL\12\0"
	.align 8
.LC13:
	.ascii "[warning] Unresolved variable access for '%s', creating fallback local\12\0"
	.align 8
.LC14:
	.ascii "[warning] Invalid get-attribute access\12\0"
	.align 8
.LC15:
	.ascii "[warning] Failed to generate object for get-attribute access\12\0"
	.align 8
.LC16:
	.ascii "[warning] Invalid get-sequence access\12\0"
	.align 8
.LC17:
	.ascii "[warning] Failed to generate sequence/index for get-sequence access\12\0"
	.align 8
.LC18:
	.ascii "[warning] Invalid function call without callee\12\0"
	.align 8
.LC19:
	.ascii "[warning] Failed to generate callee for function call\12\0"
	.align 8
.LC20:
	.ascii "[warning] Unsupported callee in function call\12\0"
	.align 8
.LC21:
	.ascii "[warning] Failed to generate function call argument\12\0"
	.align 8
.LC22:
	.ascii "[warning] Unsupported variable access type for codegen_variable_access: %d\12\0"
	.text
	.p2align 4
	.globl	codegen_variable_access
	.def	codegen_variable_access;	.scl	2;	.type	32;	.endef
codegen_variable_access:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	testq	%rcx, %rcx
	je	.L175
	movq	%rdx, %rsi
	testq	%rdx, %rdx
	je	.L175
	movl	16(%rcx), %edi
	movq	%rcx, %rbx
	testl	%edi, %edi
	jne	.L105
	movq	8(%rcx), %r12
	testq	%r12, %r12
	je	.L261
	movq	8(%rdx), %rdx
	testq	%rdx, %rdx
	je	.L262
	movq	16(%rdx), %rcx
	testq	%rcx, %rcx
	je	.L112
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L112
	.p2align 4,,10
	.p2align 3
.L115:
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	je	.L113
	cmpq	(%rbx), %r12
	je	.L259
.L113:
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L115
.L112:
	movq	24(%rdx), %rax
	testq	%rax, %rax
	je	.L119
	.p2align 4,,10
	.p2align 3
.L116:
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L119
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	je	.L116
	cmpq	(%rbx), %r12
	jne	.L116
	.p2align 4,,10
	.p2align 3
.L259:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbx, %xmm0
	movhps	16(%rbx), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r13
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
.L101:
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
	cmpl	$2, %edi
	je	.L263
	cmpl	$3, %edi
	je	.L264
	cmpl	$1, %edi
	jne	.L152
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L265
	cmpl	$2, 16(%rcx)
	jne	.L154
	movq	8(%rcx), %r12
	testq	%r12, %r12
	je	.L154
	movl	32(%r12), %eax
	subl	$1, %eax
	cmpl	$1, %eax
	ja	.L154
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L174
	movl	16(%rcx), %edx
	testl	%edx, %edx
	jne	.L156
	movq	8(%rcx), %rax
	testq	%rax, %rax
	je	.L156
	movl	32(%rax), %eax
	testl	%eax, %eax
	je	.L174
.L156:
	movq	%rsi, %rdx
	call	codegen_variable_access
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L174
	cmpb	$0, 20(%rax)
	jne	.L266
.L157:
	movq	%rsi, %rdx
	movl	$1, %edi
	call	emit_param_instruction.part.0
.L158:
	movq	8(%rbx), %rcx
	call	list_copy
	movq	%rax, %rbx
	jmp	.L162
	.p2align 4,,10
	.p2align 3
.L164:
	movq	%rsi, %rdx
	addq	$1, %rdi
	call	emit_param_instruction.part.0
.L162:
	movq	%rbx, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L267
	movq	%rsi, %rdx
	call	codegen_expression
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L165
	cmpb	$0, 20(%rax)
	je	.L164
	movq	%rsi, %rdx
	call	load_rvalue.part.0
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L164
	.p2align 4,,10
	.p2align 3
.L165:
	call	__getreent
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC21(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L264:
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L143
	cmpq	$0, 8(%rbx)
	je	.L143
	call	codegen_variable_access
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L145
	cmpb	$0, 20(%rax)
	jne	.L268
.L145:
	movq	8(%rbx), %rcx
	movq	%rsi, %rdx
	call	codegen_expression
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L148
	cmpb	$0, 20(%rax)
	jne	.L269
.L147:
	testq	%rdi, %rdi
	je	.L148
	testq	%r12, %r12
	je	.L148
	movq	.refptr.name_int(%rip), %rax
	movq	8(%rdi), %r13
	movq	(%rax), %rdx
	movq	.refptr.name_float(%rip), %rax
	cmpq	(%rax), %r13
	je	.L149
	movq	.refptr.name_bool(%rip), %rax
	cmpq	(%rax), %r13
	je	.L149
	movq	.refptr.name_string(%rip), %rax
	cmpq	(%rax), %r13
	cmovne	%rdx, %r13
.L149:
	movl	$24, %ecx
	call	alloc_memory
	movq	64(%rsi), %r14
	movl	$32, %edx
	leaq	.LC1(%rip), %rcx
	movq	$0, (%rax)
	movq	%rax, %rbx
	leaq	1(%r14), %rax
	movq	%rax, 64(%rsi)
	call	create_string
	movq	%rax, 8(%rbx)
	movq	%rax, %rcx
	cmpq	$-1, %r14
	je	.L270
	movq	%r14, %r9
	movl	$116, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L151:
	movq	%r13, 16(%rbx)
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbx, %xmm0
	movl	$32, %ecx
	movhps	16(%rbx), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r13
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movq	%rdi, 8(%rax)
	movq	%rax, %rdx
	movl	$16, 24(%rax)
	movq	%r13, (%rax)
	movq	%r12, 16(%rax)
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	movb	$1, 20(%r13)
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L154:
	movq	%rsi, %rdx
	call	codegen_variable_access
	testq	%rax, %rax
	je	.L271
	movl	16(%rax), %edx
	cmpl	$7, %edx
	je	.L272
	testl	%edx, %edx
	jne	.L161
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L161
	movq	(%rax), %r12
	testq	%r12, %r12
	je	.L161
	movl	32(%r12), %eax
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L174
	.p2align 4,,10
	.p2align 3
.L161:
	call	__getreent
	movl	$46, %r8d
	movl	$1, %edx
	leaq	.LC20(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L263:
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L136
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L136
	movl	32(%rbx), %eax
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L273
	call	codegen_variable_access
	movq	%rsi, %r8
	movq	%rbx, %rdx
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L274
.L260:
	leaq	-56(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	emit_attribute_access
	.p2align 4,,10
	.p2align 3
.L262:
	movq	(%rsi), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L253
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L253
	.p2align 4,,10
	.p2align 3
.L125:
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	je	.L124
	cmpq	(%rbx), %r12
	je	.L259
.L124:
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L125
	cmpl	$2, 32(%r12)
	jbe	.L110
	testq	%rdx, %rdx
	je	.L111
	movq	16(%rdx), %rcx
.L118:
	movq	(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L111
	movq	.refptr.SELF_KEYWORD(%rip), %r13
	.p2align 4,,10
	.p2align 3
.L130:
	movq	8(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L131
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L131
	movq	0(%r13), %rdx
	movq	8(%rax), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L275
.L131:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L130
.L111:
	movq	8(%r12), %rbx
	call	__getreent
	leaq	.LC13(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	call	fprintf
	movl	$24, %ecx
	movq	(%r12), %r13
	call	alloc_memory
	movq	56(%rsi), %rdi
	movl	$32, %edx
	leaq	.LC1(%rip), %rcx
	movq	%r12, (%rax)
	movq	%rax, %rbx
	leaq	1(%rdi), %rax
	movq	%rax, 56(%rsi)
	call	create_string
	movq	%rax, 8(%rbx)
	movq	%rax, %rcx
	cmpq	$-1, %rdi
	je	.L276
	movq	%rdi, %r9
	movl	$118, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L134:
	movq	%r13, 16(%rbx)
	jmp	.L259
	.p2align 4,,10
	.p2align 3
.L275:
	movq	16(%rdi), %rax
	testq	%rax, %rax
	je	.L111
	movl	32(%rax), %ecx
	testl	%ecx, %ecx
	jne	.L111
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	cmpq	%rax, 24(%r12)
	jne	.L111
	movl	$24, %ecx
	call	alloc_memory
	movq	%rdi, %xmm0
	movq	%rsi, %r8
	movq	%r12, %rdx
	movhps	16(%rdi), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rcx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L260
	.p2align 4,,10
	.p2align 3
.L175:
	call	__getreent
	movl	$40, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
.L104:
	xorl	%r13d, %r13d
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L253:
	cmpl	$2, 32(%r12)
	ja	.L111
	.p2align 4,,10
	.p2align 3
.L110:
	movl	$24, %ecx
	movq	(%r12), %r13
	call	alloc_memory
	movq	80(%rsi), %rdi
	movl	$32, %edx
	leaq	.LC1(%rip), %rcx
	movq	%r12, (%rax)
	movq	%rax, %rbx
	leaq	1(%rdi), %rax
	movq	%rax, 80(%rsi)
	call	create_string
	movq	%rax, 8(%rbx)
	movq	%rax, %rcx
	cmpq	$-1, %rdi
	je	.L277
	movq	%rdi, %r9
	movl	$102, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L128:
	movq	%r13, 16(%rbx)
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbx, %xmm0
	movhps	16(%rbx), %xmm0
	movl	$7, 16(%rax)
	movq	%rax, %r13
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L119:
	movq	(%rsi), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L122
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L125
.L122:
	cmpl	$2, 32(%r12)
	ja	.L118
	jmp	.L110
	.p2align 4,,10
	.p2align 3
.L152:
	call	__getreent
	movl	%edi, %r8d
	leaq	.LC22(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L276:
	movl	$118, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L134
	.p2align 4,,10
	.p2align 3
.L270:
	movl	$116, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L151
	.p2align 4,,10
	.p2align 3
.L261:
	call	__getreent
	movl	$39, %r8d
	movl	$1, %edx
	leaq	.LC12(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L273:
	movl	$24, %ecx
	movq	(%rbx), %r12
	call	alloc_memory
	leaq	.LC1(%rip), %rcx
	movl	$32, %edx
	movq	%rbx, (%rax)
	movq	80(%rsi), %rbx
	movq	%rax, %rdi
	leaq	1(%rbx), %rax
	movq	%rax, 80(%rsi)
	call	create_string
	movq	%rax, 8(%rdi)
	movq	%rax, %rcx
	cmpq	$-1, %rbx
	je	.L278
	movq	%rbx, %r9
	movl	$102, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L140:
	movq	%r12, 16(%rdi)
	movl	$24, %ecx
	call	alloc_memory
	movq	%rdi, %xmm0
	movhps	16(%rdi), %xmm0
	movl	$7, 16(%rax)
	movq	%rax, %r13
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L272:
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L161
	movq	(%rax), %r12
	testq	%r12, %r12
	je	.L161
.L174:
	xorl	%edi, %edi
	jmp	.L158
	.p2align 4,,10
	.p2align 3
.L267:
	movl	$24, %ecx
	leaq	.LC1(%rip), %r15
	call	alloc_memory
	movq	$0, (%rax)
	movq	%rax, %r13
	movl	$5, 16(%rax)
	movq	.refptr.name_void(%rip), %rax
	movb	$0, 20(%r13)
	movq	(%r12), %r14
	movq	(%rax), %rax
	movq	%rax, 8(%r13)
	cmpq	%rax, %r14
	je	.L167
	testq	%r14, %r14
	je	.L167
	movl	$24, %ecx
	call	alloc_memory
	movq	64(%rsi), %r13
	movq	%r15, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %rbx
	leaq	1(%r13), %rax
	movq	%rax, 64(%rsi)
	call	create_string
	movq	%rax, 8(%rbx)
	movq	%rax, %rcx
	cmpq	$-1, %r13
	je	.L279
	movq	%r13, %r9
	movl	$116, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L169:
	movq	%r14, 16(%rbx)
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbx, %xmm0
	movhps	16(%rbx), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r13
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	movq	(%r12), %r14
.L167:
	movl	$24, %ecx
	call	alloc_memory
	movq	%r15, %rcx
	movl	$32, %edx
	movq	%r12, (%rax)
	movq	80(%rsi), %r12
	movq	%rax, %rbx
	leaq	1(%r12), %rax
	movq	%rax, 80(%rsi)
	call	create_string
	movq	%rax, 8(%rbx)
	movq	%rax, %rcx
	cmpq	$-1, %r12
	je	.L280
	movq	%r12, %r9
	movl	$102, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L171:
	movq	%r14, 16(%rbx)
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbx, %xmm0
	movl	$24, %ecx
	movhps	16(%rbx), %xmm0
	movl	$7, 16(%rax)
	movq	%rax, %r12
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movl	$32, %ecx
	movq	%rdi, (%rax)
	movq	%rax, %rbx
	movl	$1, 16(%rax)
	movq	.refptr.name_int(%rip), %rax
	movb	$0, 20(%rbx)
	movq	(%rax), %rax
	movq	%rax, 8(%rbx)
	call	alloc_memory
	movq	%r12, 8(%rax)
	movq	%rax, %rdx
	movq	%r13, (%rax)
	movq	%rbx, 16(%rax)
	movl	$22, 24(%rax)
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L277:
	movl	$102, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L128
.L143:
	call	__getreent
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC16(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L104
.L136:
	call	__getreent
	movl	$39, %r8d
	movl	$1, %edx
	leaq	.LC14(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L104
.L269:
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r12
	jmp	.L147
.L268:
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rdi
	jmp	.L145
.L274:
	call	__getreent
	movl	$61, %r8d
	movl	$1, %edx
	leaq	.LC15(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L104
.L265:
	call	__getreent
	movl	$47, %r8d
	movl	$1, %edx
	leaq	.LC18(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L104
.L148:
	call	__getreent
	movl	$68, %r8d
	movl	$1, %edx
	leaq	.LC17(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L104
.L278:
	movl	$102, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L140
.L280:
	movl	$102, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L171
.L271:
	call	__getreent
	movl	$54, %r8d
	movl	$1, %edx
	leaq	.LC19(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L104
.L279:
	movl	$116, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L169
.L266:
	movq	%rsi, %rdx
	call	load_rvalue.part.0
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L157
	xorl	%edi, %edi
	jmp	.L158
	.section .rdata,"dr"
	.align 8
.LC24:
	.ascii "[warning] Unsupported type for negation: %s\12\0"
	.align 8
.LC25:
	.ascii "[warning] Unsupported primary type for codegen_primary: %d\12\0"
	.section	.text.unlikely,"x"
.LCOLDB26:
	.text
.LHOTB26:
	.p2align 4
	.globl	codegen_primary
	.def	codegen_primary;	.scl	2;	.type	32;	.endef
codegen_primary:
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
	ja	.L282
	movq	%rdx, %rsi
	leaq	.L284(%rip), %rdx
	movslq	(%rdx,%rbx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L284:
	.long	.L292-.L284
	.long	.L291-.L284
	.long	.L290-.L284
	.long	.L289-.L284
	.long	.L288-.L284
	.long	.L287-.L284
	.long	.L286-.L284
	.long	.L285-.L284
	.long	.L283-.L284
	.text
	.p2align 4,,10
	.p2align 3
.L285:
	movq	(%rcx), %rcx
	movq	%rsi, %rdx
	call	codegen_primary
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L297
	cmpb	$0, 20(%rax)
	jne	.L309
.L298:
	movl	$24, %ecx
	movq	8(%r12), %r13
	call	alloc_memory
	movq	64(%rsi), %rbx
	movl	$32, %edx
	leaq	.LC1(%rip), %rcx
	movq	$0, (%rax)
	movq	%rax, %rdi
	leaq	1(%rbx), %rax
	movq	%rax, 64(%rsi)
	call	create_string
	movq	%rax, 8(%rdi)
	movq	%rax, %rcx
	cmpq	$-1, %rbx
	je	.L310
	movq	%rbx, %r9
	movl	$116, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L300:
	movq	%r13, 16(%rdi)
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
	je	.L311
	movq	.refptr.name_float(%rip), %r13
	cmpq	0(%r13), %rax
	je	.L312
	movq	8(%rax), %rbx
	call	__getreent
	leaq	.LC24(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	xorl	%ebx, %ebx
	call	fprintf
	jmp	.L281
	.p2align 4,,10
	.p2align 3
.L283:
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
	jmp	codegen_variable_access
	.p2align 4,,10
	.p2align 3
.L292:
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
.L281:
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
.L291:
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
	jmp	.L281
	.p2align 4,,10
	.p2align 3
.L290:
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
	jmp	.L281
	.p2align 4,,10
	.p2align 3
.L289:
	movl	$24, %ecx
	call	alloc_memory
	movb	$1, (%rax)
	movq	%rax, %rbx
	movl	$4, 16(%rax)
	movq	.refptr.name_bool(%rip), %rax
	movq	(%rax), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	jmp	.L281
	.p2align 4,,10
	.p2align 3
.L288:
	movl	$24, %ecx
	call	alloc_memory
	movb	$0, (%rax)
	movq	%rax, %rbx
	movl	$4, 16(%rax)
	movq	.refptr.name_bool(%rip), %rax
	movq	(%rax), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	jmp	.L281
	.p2align 4,,10
	.p2align 3
.L287:
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
	jmp	codegen_expression
	.p2align 4,,10
	.p2align 3
.L286:
	movq	(%rcx), %rcx
	movq	%rsi, %rdx
	call	codegen_primary
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L294
	cmpb	$0, 20(%rax)
	jne	.L313
.L294:
	movq	.refptr.name_bool(%rip), %rax
	movl	$24, %ecx
	movq	(%rax), %r13
	call	alloc_memory
	movq	64(%rsi), %rbx
	movl	$32, %edx
	leaq	.LC1(%rip), %rcx
	movq	$0, (%rax)
	movq	%rax, %rdi
	leaq	1(%rbx), %rax
	movq	%rax, 64(%rsi)
	call	create_string
	movq	%rax, 8(%rdi)
	movq	%rax, %rcx
	cmpq	$-1, %rbx
	je	.L314
	movq	%rbx, %r9
	movl	$116, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L296:
	movq	%r13, 16(%rdi)
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
	jmp	.L281
.L282:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC25(%rip), %rdx
	xorl	%ebx, %ebx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L281
	.p2align 4,,10
	.p2align 3
.L312:
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movl	$2, 16(%rax)
	movq	%rax, %rdi
	movq	.LC23(%rip), %rax
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
.L302:
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L281
	.p2align 4,,10
	.p2align 3
.L310:
	movl	$116, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L300
	.p2align 4,,10
	.p2align 3
.L314:
	movl	$116, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L296
	.p2align 4,,10
	.p2align 3
.L313:
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r12
	jmp	.L294
	.p2align 4,,10
	.p2align 3
.L309:
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r12
	jmp	.L298
	.p2align 4,,10
	.p2align 3
.L311:
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
	jmp	.L302
	.section	.text.unlikely,"x"
	.def	codegen_primary.cold;	.scl	3;	.type	32;	.endef
codegen_primary.cold:
.L297:
	movq	8, %rax
	ud2
	.text
	.section	.text.unlikely,"x"
.LCOLDE26:
	.text
.LHOTE26:
	.section .rdata,"dr"
	.align 8
.LC27:
	.ascii "[warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.p2align 4
	.globl	codegen_expression
	.def	codegen_expression;	.scl	2;	.type	32;	.endef
codegen_expression:
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
	je	.L340
	movq	16(%rcx), %rcx
	call	codegen_expression
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L317
	cmpb	$0, 20(%rax)
	jne	.L341
.L317:
	movl	24(%r12), %eax
	movq	(%r12), %rcx
	cmpl	$18, %eax
	ja	.L318
	leaq	CSWTCH.22(%rip), %rdx
	movl	(%rdx,%rax,4), %r13d
	movq	%rbx, %rdx
	call	codegen_expression
	movq	%rax, %rdi
	movl	24(%r12), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L319
	cmpl	$14, %r13d
	jne	.L329
	movl	16(%rdi), %eax
	testl	%eax, %eax
	jne	.L342
.L324:
	movl	$32, %ecx
	call	alloc_memory
	movl	$14, 24(%rax)
	movq	%rax, %rdx
	movq	%rdi, (%rax)
	movq	%rsi, 8(%rax)
	movq	$0, 16(%rax)
	cmpb	$0, 20(%rdi)
	jne	.L343
.L325:
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
.L318:
	movq	%rbx, %rdx
	movl	$25, %r13d
	call	codegen_expression
	movq	%rax, %rdi
	movl	24(%r12), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L319
.L329:
	movl	$24, %ecx
	movq	8(%rdi), %r12
	call	alloc_memory
	movq	64(%rbx), %r15
	movl	$32, %edx
	leaq	.LC1(%rip), %rcx
	movq	$0, (%rax)
	movq	%rax, %r14
	leaq	1(%r15), %rax
	movq	%rax, 64(%rbx)
	call	create_string
	movq	%rax, 8(%r14)
	movq	%rax, %rcx
	cmpq	$-1, %r15
	je	.L344
	movq	%r15, %r9
	movl	$116, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L322:
	movq	%r12, 16(%r14)
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
	jne	.L345
.L323:
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
	je	.L324
.L342:
	call	__getreent
	movl	$57, %r8d
	movl	$1, %edx
	leaq	.LC27(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L324
	.p2align 4,,10
	.p2align 3
.L319:
	movl	$24, %ecx
	movq	8(%rdi), %r12
	call	alloc_memory
	movq	64(%rbx), %r15
	movl	$32, %edx
	leaq	.LC1(%rip), %rcx
	movq	$0, (%rax)
	movq	%rax, %r14
	leaq	1(%r15), %rax
	movq	%rax, 64(%rbx)
	call	create_string
	movq	%rax, 8(%r14)
	movq	%rax, %rcx
	cmpq	$-1, %r15
	je	.L346
	movq	%r15, %r9
	movl	$116, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L327:
	movq	%r12, 16(%r14)
	movl	$24, %ecx
	call	alloc_memory
	movq	%r14, %xmm0
	movhps	16(%r14), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r12
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	cmpb	$0, 20(%rdi)
	jne	.L347
.L328:
	movl	$32, %ecx
	call	alloc_memory
	movq	%rsi, 16(%rax)
	movq	%rax, %rdx
	movq	%r12, %rsi
	movl	%r13d, 24(%rax)
	movq	%r12, (%rax)
	movq	%rdi, 8(%rax)
	jmp	.L325
	.p2align 4,,10
	.p2align 3
.L340:
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
	jmp	codegen_primary
	.p2align 4,,10
	.p2align 3
.L346:
	movl	$116, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L327
	.p2align 4,,10
	.p2align 3
.L344:
	movl	$116, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L322
	.p2align 4,,10
	.p2align 3
.L343:
	movl	$32, %ecx
	call	alloc_memory
	movl	$24, 24(%rax)
	movq	%rax, %rdx
	movq	%rdi, (%rax)
	movq	%rsi, 8(%rax)
	movq	$0, 16(%rax)
	jmp	.L325
	.p2align 4,,10
	.p2align 3
.L341:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rsi
	jmp	.L317
	.p2align 4,,10
	.p2align 3
.L347:
	movq	%rdi, %rcx
	movq	%rbx, %rdx
	call	load_rvalue.part.0
	movq	%rax, %rdi
	jmp	.L328
	.p2align 4,,10
	.p2align 3
.L345:
	movq	%rbx, %rdx
	movq	%rdi, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r14
	jmp	.L323
	.p2align 4
	.globl	codegen_if
	.def	codegen_if;	.scl	2;	.type	32;	.endef
codegen_if:
	pushq	%r15
	pushq	%r14
	leaq	.LC1(%rip), %r14
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
	movq	72(%rbx), %rsi
	movq	%r14, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %rdi
	leaq	1(%rsi), %rax
	movq	%rax, 72(%rbx)
	call	create_string
	movq	%rax, 8(%rdi)
	movq	%rax, %rcx
	cmpq	$-1, %rsi
	je	.L382
	movq	%rsi, %r9
	movl	$98, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L350:
	movq	$0, 16(%rdi)
	movl	$24, %ecx
	call	alloc_memory
	movq	72(%rbx), %rbp
	movq	%r14, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %rsi
	leaq	1(%rbp), %rax
	movq	%rax, 72(%rbx)
	call	create_string
	movq	%rax, 8(%rsi)
	movq	%rax, %rcx
	cmpq	$-1, %rbp
	je	.L383
	movq	%rbp, %r9
	movl	$98, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L352:
	movq	$0, 16(%rsi)
	movq	16(%r13), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L357
	movq	24(%r13), %rcx
	call	list_is_empty
	movq	%rsi, 56(%rsp)
	testb	%al, %al
	je	.L357
.L356:
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
	call	codegen_expression
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
	jmp	.L359
	.p2align 4,,10
	.p2align 3
.L360:
	movq	%rbx, %rdx
	call	codegen_statement
.L359:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L360
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
	je	.L384
.L361:
	movq	24(%r13), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L385
.L372:
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
.L357:
	movl	$24, %ecx
	call	alloc_memory
	movq	72(%rbx), %rbp
	movq	%r14, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %r15
	movq	%rax, 56(%rsp)
	leaq	1(%rbp), %rax
	movq	%rax, 72(%rbx)
	call	create_string
	movq	%rax, 8(%r15)
	movq	%rax, %rcx
	cmpq	$-1, %rbp
	je	.L386
	movq	%rbp, %r9
	movl	$98, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L358:
	movq	56(%rsp), %rax
	movq	$0, 16(%rax)
	jmp	.L356
	.p2align 4,,10
	.p2align 3
.L386:
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L358
	.p2align 4,,10
	.p2align 3
.L383:
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L352
	.p2align 4,,10
	.p2align 3
.L382:
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L350
	.p2align 4,,10
	.p2align 3
.L385:
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
	jmp	.L373
	.p2align 4,,10
	.p2align 3
.L374:
	movq	%rbx, %rdx
	call	codegen_statement
.L373:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L374
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
	jmp	.L372
	.p2align 4,,10
	.p2align 3
.L384:
	movq	16(%r13), %rcx
	call	list_copy
	movq	%rax, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L362:
	movq	32(%rsp), %rcx
	call	list_pop
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L361
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
	movq	72(%rbx), %rsi
	movq	%r14, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %rdi
	leaq	1(%rsi), %rax
	movq	%rax, 72(%rbx)
	call	create_string
	movq	%rax, 8(%rdi)
	movq	%rax, %rcx
	cmpq	$-1, %rsi
	je	.L387
	movq	%rsi, %r9
	movl	$98, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L364:
	movq	$0, 16(%rdi)
	movl	$24, %ecx
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
	je	.L388
	movq	%r15, %r9
	movl	$98, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L366:
	movq	$0, 16(%rsi)
	movq	0(%rbp), %rcx
	movq	%rbx, %rdx
	call	codegen_expression
	movq	32(%rsp), %rcx
	movq	%rax, 40(%rsp)
	call	list_is_empty
	testb	%al, %al
	jne	.L389
.L368:
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
	jmp	.L369
	.p2align 4,,10
	.p2align 3
.L370:
	movq	%rbx, %rdx
	call	codegen_statement
.L369:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L370
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
	jmp	.L362
	.p2align 4,,10
	.p2align 3
.L388:
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L366
	.p2align 4,,10
	.p2align 3
.L387:
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L364
	.p2align 4,,10
	.p2align 3
.L389:
	movq	24(%r13), %rcx
	call	list_is_empty
	testb	%al, %al
	cmovne	56(%rsp), %rsi
	jmp	.L368
	.section .rdata,"dr"
	.align 8
.LC28:
	.ascii "[warning] 'break' statement used outside of loop\12\0"
	.align 8
.LC29:
	.ascii "[warning] 'continue' statement used outside of loop\12\0"
	.align 8
.LC30:
	.ascii "[warning] Unsupported statement type for codegen_statement: %d\12\0"
	.text
	.p2align 4
	.globl	codegen_statement
	.def	codegen_statement;	.scl	2;	.type	32;	.endef
codegen_statement:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movl	8(%rcx), %ebx
	cmpl	$7, %ebx
	ja	.L391
	movq	%rdx, %rsi
	leaq	.L393(%rip), %rdx
	movslq	(%rdx,%rbx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L393:
	.long	.L400-.L393
	.long	.L399-.L393
	.long	.L398-.L393
	.long	.L397-.L393
	.long	.L396-.L393
	.long	.L395-.L393
	.long	.L394-.L393
	.long	.L392-.L393
	.text
	.p2align 4,,10
	.p2align 3
.L394:
	movq	24(%rsi), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L403
	movq	24(%rsi), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	je	.L403
.L415:
	movl	$32, %ecx
	call	alloc_memory
	movl	$20, 24(%rax)
	movq	%rax, %rdx
	jmp	.L413
	.p2align 4,,10
	.p2align 3
.L392:
	movq	32(%rsi), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L404
	movq	32(%rsi), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L415
.L404:
	call	__getreent
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC29(%rip), %rcx
	movq	24(%rax), %r9
	jmp	.L414
	.p2align 4,,10
	.p2align 3
.L398:
	movq	(%rcx), %rcx
	addq	$40, %rsp
	movq	%rsi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	codegen_if
	.p2align 4,,10
	.p2align 3
.L400:
	movq	(%rcx), %rcx
	addq	$40, %rsp
	movq	%rsi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	codegen_expression
	.p2align 4,,10
	.p2align 3
.L399:
	movq	(%rcx), %rax
	movl	$24, %ecx
	movq	8(%rax), %rdi
	movq	(%rax), %rbp
	call	alloc_memory
	leaq	.LC1(%rip), %rcx
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
	je	.L416
	movq	%rdi, %r9
	movl	$118, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L402:
	movq	8(%rsi), %rax
	movq	%rbp, 16(%rbx)
	movq	%rbx, %rdx
	movq	24(%rax), %rcx
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	list_append
	.p2align 4,,10
	.p2align 3
.L396:
	movq	(%rcx), %rcx
	addq	$40, %rsp
	movq	%rsi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	codegen_for
	.p2align 4,,10
	.p2align 3
.L395:
	movq	(%rcx), %rcx
	movq	%rsi, %rdx
	call	codegen_expression
	movl	$32, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movl	$21, 24(%rax)
	movq	%rax, %rdx
.L413:
	movq	16(%rsi), %rax
	movq	%rbx, (%rdx)
	movq	$0, 8(%rdx)
	movq	$0, 16(%rdx)
	movq	8(%rax), %rcx
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	list_append
	.p2align 4,,10
	.p2align 3
.L397:
	movq	(%rcx), %rcx
	addq	$40, %rsp
	movq	%rsi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	codegen_while
	.p2align 4,,10
	.p2align 3
.L403:
	call	__getreent
	movl	$49, %r8d
	movl	$1, %edx
	leaq	.LC28(%rip), %rcx
	movq	24(%rax), %r9
.L414:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	fwrite
.L391:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC30(%rip), %rdx
	movq	24(%rax), %rcx
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L416:
	movl	$118, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L402
	.p2align 4
	.globl	codegen_for
	.def	codegen_for;	.scl	2;	.type	32;	.endef
codegen_for:
	pushq	%r15
	leaq	.LC1(%rip), %r15
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
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L418
	movq	8(%rax), %r12
	movl	$24, %ecx
	movq	(%rax), %rbp
	call	alloc_memory
	movq	%r15, %rcx
	movl	$32, %edx
	movq	%r12, (%rax)
	movq	56(%rbx), %r12
	movq	%rax, %rsi
	leaq	1(%r12), %rax
	movq	%rax, 56(%rbx)
	call	create_string
	movq	%rax, 8(%rsi)
	movq	%rax, %rcx
	cmpq	$-1, %r12
	je	.L442
	movq	%r12, %r9
	movl	$118, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L420:
	movq	8(%rbx), %rax
	movq	%rbp, 16(%rsi)
	movq	%rsi, %rdx
	movq	24(%rax), %rcx
	call	list_append
.L418:
	movl	$24, %ecx
	call	alloc_memory
	movq	72(%rbx), %rsi
	movq	%r15, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %rbp
	leaq	1(%rsi), %rax
	movq	%rax, 72(%rbx)
	call	create_string
	movq	%rax, 8(%rbp)
	movq	%rax, %rcx
	cmpq	$-1, %rsi
	je	.L443
	movq	%rsi, %r9
	movl	$98, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L422:
	movq	$0, 16(%rbp)
	movl	$24, %ecx
	call	alloc_memory
	movq	72(%rbx), %rsi
	movq	%r15, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %r13
	leaq	1(%rsi), %rax
	movq	%rax, 72(%rbx)
	call	create_string
	movq	%rax, 8(%r13)
	movq	%rax, %rcx
	cmpq	$-1, %rsi
	je	.L444
	movq	%rsi, %r9
	movl	$98, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L424:
	movq	$0, 16(%r13)
	movl	$24, %ecx
	call	alloc_memory
	movq	72(%rbx), %rsi
	movq	%r15, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %r12
	leaq	1(%rsi), %rax
	movq	%rax, 72(%rbx)
	call	create_string
	movq	%rax, 8(%r12)
	movq	%rax, %rcx
	cmpq	$-1, %rsi
	je	.L445
	movq	%rsi, %r9
	movl	$98, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L426:
	cmpq	$0, 8(%rdi)
	movl	$24, %ecx
	movq	$0, 16(%r12)
	je	.L427
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
	call	codegen_expression
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
.L428:
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
	movq	72(%rbx), %rsi
	movq	%r15, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %r14
	leaq	1(%rsi), %rax
	movq	%rax, 72(%rbx)
	call	create_string
	movq	%rax, 8(%r14)
	movq	%rax, %rcx
	cmpq	$-1, %rsi
	je	.L446
	movq	%rsi, %r9
	movl	$98, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L430:
	cmpq	$0, 16(%rdi)
	movq	$0, 16(%r14)
	movl	$24, %ecx
	je	.L431
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	32(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r14, (%rax)
	call	list_append
.L432:
	movl	$24, %ecx
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	24(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r12, (%rax)
	call	list_append
	movq	24(%rdi), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L434
	.p2align 4,,10
	.p2align 3
.L435:
	movq	%rbx, %rdx
	call	codegen_statement
.L434:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L435
	movq	32(%rbx), %rcx
	call	list_pop_back
	movq	24(%rbx), %rcx
	call	list_pop_back
	cmpq	$0, 16(%rdi)
	je	.L436
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
	call	codegen_expression
.L436:
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
	je	.L447
.L437:
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
.L431:
	cmpq	$0, 8(%rdi)
	je	.L433
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	32(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	call	list_append
	jmp	.L432
	.p2align 4,,10
	.p2align 3
.L446:
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L430
	.p2align 4,,10
	.p2align 3
.L445:
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L426
	.p2align 4,,10
	.p2align 3
.L444:
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L424
	.p2align 4,,10
	.p2align 3
.L443:
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L422
	.p2align 4,,10
	.p2align 3
.L427:
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
	jmp	.L428
	.p2align 4,,10
	.p2align 3
.L442:
	movl	$118, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L420
	.p2align 4,,10
	.p2align 3
.L447:
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
	jmp	.L437
	.p2align 4,,10
	.p2align 3
.L433:
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	32(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	call	list_append
	jmp	.L432
	.p2align 4
	.globl	codegen_while
	.def	codegen_while;	.scl	2;	.type	32;	.endef
codegen_while:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	leaq	.LC1(%rip), %r13
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
	movq	72(%rbx), %rbp
	movq	%r13, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %rdi
	leaq	1(%rbp), %rax
	movq	%rax, 72(%rbx)
	call	create_string
	movq	%rax, 8(%rdi)
	movq	%rax, %rcx
	cmpq	$-1, %rbp
	je	.L458
	movq	%rbp, %r9
	movl	$98, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L450:
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
	movq	72(%rbx), %rbp
	movq	%r13, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %r12
	leaq	1(%rbp), %rax
	movq	%rax, 72(%rbx)
	call	create_string
	movq	%rax, 8(%r12)
	movq	%rax, %rcx
	cmpq	$-1, %rbp
	je	.L459
	movq	%rbp, %r9
	movl	$98, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L452:
	movq	$0, 16(%r12)
	movl	$24, %ecx
	call	alloc_memory
	movq	72(%rbx), %r14
	movq	%r13, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %rbp
	leaq	1(%r14), %rax
	movq	%rax, 72(%rbx)
	call	create_string
	movq	%rax, 8(%rbp)
	movq	%rax, %rcx
	cmpq	$-1, %r14
	je	.L460
	movq	%r14, %r9
	movl	$98, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L454:
	movq	$0, 16(%rbp)
	movq	(%rsi), %rcx
	movq	%rbx, %rdx
	call	codegen_expression
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
	movq	32(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rdi, (%rax)
	call	list_append
	movl	$24, %ecx
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	24(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	call	list_append
	movq	8(%rsi), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L455
	.p2align 4,,10
	.p2align 3
.L456:
	movq	%rbx, %rdx
	call	codegen_statement
.L455:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L456
	movq	32(%rbx), %rcx
	call	list_pop_back
	movq	24(%rbx), %rcx
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
.L458:
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L450
	.p2align 4,,10
	.p2align 3
.L460:
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L454
	.p2align 4,,10
	.p2align 3
.L459:
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L452
	.p2align 4
	.globl	codegen_function
	.def	codegen_function;	.scl	2;	.type	32;	.endef
codegen_function:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	leaq	.LC1(%rip), %r13
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
	movq	%rax, %r12
	jmp	.L462
	.p2align 4,,10
	.p2align 3
.L463:
	movq	%r15, %r9
	movl	$112, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L464:
	movq	%rdi, 16(%r14)
	movq	16(%rsi), %rcx
	movq	%r14, %rdx
	call	list_append
.L462:
	movq	%r12, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L471
	movq	8(%rax), %r15
	movl	$24, %ecx
	movq	(%rax), %rdi
	call	alloc_memory
	movq	%r13, %rcx
	movl	$32, %edx
	movq	%r15, (%rax)
	movq	48(%rbx), %r15
	movq	%rax, %r14
	leaq	1(%r15), %rax
	movq	%rax, 48(%rbx)
	call	create_string
	movq	%rax, 8(%r14)
	movq	%rax, %rcx
	cmpq	$-1, %r15
	jne	.L463
	movl	$112, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L464
	.p2align 4,,10
	.p2align 3
.L471:
	movl	$24, %ecx
	call	alloc_memory
	movq	72(%rbx), %rdi
	movq	%r13, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %r12
	leaq	1(%rdi), %rax
	movq	%rax, 72(%rbx)
	call	create_string
	movq	%rax, 8(%r12)
	movq	%rax, %rcx
	cmpq	$-1, %rdi
	je	.L472
	movq	%rdi, %r9
	movl	$98, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L467:
	movq	$0, 16(%r12)
	movl	$16, %ecx
	call	alloc_memory
	movq	%r12, (%rax)
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
	jmp	.L468
	.p2align 4,,10
	.p2align 3
.L469:
	movq	%rbx, %rdx
	call	codegen_statement
.L468:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L469
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
.L472:
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L467
	.p2align 4
	.globl	codegen_method
	.def	codegen_method;	.scl	2;	.type	32;	.endef
codegen_method:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	leaq	.LC1(%rip), %r13
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
	movq	%rax, %r12
	jmp	.L474
	.p2align 4,,10
	.p2align 3
.L475:
	movq	%r15, %r9
	movl	$112, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L476:
	movq	%rdi, 16(%r14)
	movq	16(%rsi), %rcx
	movq	%r14, %rdx
	call	list_append
.L474:
	movq	%r12, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L483
	movq	8(%rax), %r15
	movl	$24, %ecx
	movq	(%rax), %rdi
	call	alloc_memory
	movq	%r13, %rcx
	movl	$32, %edx
	movq	%r15, (%rax)
	movq	48(%rbx), %r15
	movq	%rax, %r14
	leaq	1(%r15), %rax
	movq	%rax, 48(%rbx)
	call	create_string
	movq	%rax, 8(%r14)
	movq	%rax, %rcx
	cmpq	$-1, %r15
	jne	.L475
	movl	$112, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L476
	.p2align 4,,10
	.p2align 3
.L483:
	movl	$24, %ecx
	call	alloc_memory
	movq	72(%rbx), %rdi
	movq	%r13, %rcx
	movl	$32, %edx
	movq	$0, (%rax)
	movq	%rax, %r12
	leaq	1(%rdi), %rax
	movq	%rax, 72(%rbx)
	call	create_string
	movq	%rax, 8(%r12)
	movq	%rax, %rcx
	cmpq	$-1, %rdi
	je	.L484
	movq	%rdi, %r9
	movl	$98, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L479:
	movq	$0, 16(%r12)
	movl	$16, %ecx
	call	alloc_memory
	movq	%r12, (%rax)
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
	jmp	.L480
	.p2align 4,,10
	.p2align 3
.L481:
	movq	%rbx, %rdx
	call	codegen_statement
.L480:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L481
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
.L484:
	movl	$98, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L479
	.section .rdata,"dr"
	.align 8
.LC31:
	.ascii "[warning] Unsupported class member type for codegen_class: %d\12\0"
	.text
	.p2align 4
	.globl	codegen_class
	.def	codegen_class;	.scl	2;	.type	32;	.endef
codegen_class:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	pushq	%rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$32, %rsp
	movq	8(%rcx), %rcx
	movaps	%xmm6, 32(%rsp)
	call	list_copy
	movl	$24, %ecx
	movq	(%r12), %xmm6
	movq	%rax, %rsi
	call	alloc_memory
	movq	%rax, %rbx
	call	create_list
	movq	%rbx, %rdx
	movq	%rax, %xmm0
	punpcklqdq	%xmm6, %xmm0
	movups	%xmm0, (%rbx)
	movq	24(%r12), %rax
	leaq	.LC31(%rip), %r12
	movq	%rax, 16(%rbx)
	movq	(%rdi), %rax
	movq	(%rax), %rcx
	call	list_append
	.p2align 4,,10
	.p2align 3
.L486:
	movq	%rsi, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L494
.L491:
	movl	8(%rax), %ebx
	testl	%ebx, %ebx
	je	.L487
	cmpl	$1, %ebx
	je	.L488
	call	__getreent
	movl	%ebx, %r8d
	movq	%r12, %rdx
	movq	24(%rax), %rcx
	call	fprintf
	movq	%rsi, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L491
.L494:
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
.L488:
	movq	(%rax), %rcx
	movl	$97, %r8d
	movq	%rdi, %rdx
	call	codegen_variable
	jmp	.L486
	.p2align 4,,10
	.p2align 3
.L487:
	movq	(%rax), %rcx
	movq	%rdi, %rdx
	call	codegen_method
	jmp	.L486
	.section .rdata,"dr"
.LC32:
	.ascii "main\0"
	.text
	.p2align 4
	.globl	codegen_code
	.def	codegen_code;	.scl	2;	.type	32;	.endef
codegen_code:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r13
	leaq	.LC32(%rip), %r13
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
	movl	$88, %ecx
	movq	%rax, 24(%r12)
	call	alloc_memory
	movq	%r12, (%rax)
	movq	%rax, %rsi
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	call	create_list
	movq	%rax, 24(%rsi)
	call	create_list
	pxor	%xmm0, %xmm0
	movq	(%rbx), %rcx
	movq	%rax, 32(%rsi)
	movups	%xmm0, 40(%rsi)
	movups	%xmm0, 56(%rsi)
	movups	%xmm0, 72(%rsi)
	call	list_copy
	movq	%rax, %rdi
	.p2align 4,,10
	.p2align 3
.L496:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L504
.L502:
	movl	8(%rbx), %eax
	cmpl	$1, %eax
	je	.L505
	cmpl	$2, %eax
	je	.L506
	testl	%eax, %eax
	jne	.L496
	movq	(%rbx), %rcx
	movq	%rsi, %r8
	movq	%r12, %rdx
	call	codegen_import
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L502
.L504:
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
.L505:
	movq	(%rbx), %rcx
	movq	%rsi, %rdx
	call	codegen_function
	movq	(%rbx), %rax
	movq	%r13, %rdx
	movq	(%rax), %rbx
	movq	8(%rbx), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L496
	movq	%rbx, 8(%r12)
	jmp	.L496
	.p2align 4,,10
	.p2align 3
.L506:
	movq	(%rbx), %rcx
	movq	%rsi, %rdx
	call	codegen_class
	jmp	.L496
	.section .rdata,"dr"
	.align 32
CSWTCH.22:
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
.LC23:
	.long	0
	.long	-1074790400
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	strtoll;	.scl	2;	.type	32;	.endef
	.def	strtod;	.scl	2;	.type	32;	.endef
	.def	list_is_empty;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.SELF_KEYWORD, "dr"
	.globl	.refptr.SELF_KEYWORD
	.linkonce	discard
.refptr.SELF_KEYWORD:
	.quad	SELF_KEYWORD
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
