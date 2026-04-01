	.file	"codegen.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"[warning] Unsupported type for size lookup: %s\n"
	.text
	.p2align 4
	.type	emit_param_instruction.part.0, @function
emit_param_instruction.part.0:
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	8(%rdi), %rax
	testq	%rax, %rax
	je	.L5
	cmpq	name_int(%rip), %rax
	je	.L3
	cmpq	name_float(%rip), %rax
	je	.L3
	cmpq	name_string(%rip), %rax
	je	.L3
	cmpq	name_bool(%rip), %rax
	je	.L7
	cmpq	name_void(%rip), %rax
	je	.L7
	movl	32(%rax), %edx
	testl	%edx, %edx
	jne	.L4
	movq	24(%rax), %rax
	movq	24(%rax), %r13
.L2:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%r13, (%rax)
	movq	%rax, %rbx
	movl	$1, 16(%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r12, 8(%rax)
	movq	%rax, %rsi
	movl	$17, 24(%rax)
	movq	%rbx, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L7:
	movl	$1, %r13d
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L5:
	xorl	%r13d, %r13d
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L4:
	movq	8(%rax), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC0(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
.L3:
	movl	$8, %r13d
	jmp	.L2
	.size	emit_param_instruction.part.0, .-emit_param_instruction.part.0
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	""
.LC2:
	.string	"$%d-error"
.LC3:
	.string	"$%c%zu"
	.text
	.p2align 4
	.type	load_rvalue.part.0, @function
load_rvalue.part.0:
	pushq	%r14
	pushq	%r13
	movq	%rdi, %r13
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	pushq	%rbx
	movq	8(%rdi), %rbp
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	64(%r12), %r14
	movl	$32, %esi
	leaq	.LC1(%rip), %rdi
	movq	$0, (%rax)
	movq	%rax, %rbx
	leaq	1(%r14), %rax
	movq	%rax, 64(%r12)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%rbx)
	movq	%rax, %rdi
	cmpq	$-1, %r14
	je	.L14
	movq	%r14, %r9
	movl	$116, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L12:
	movq	%rbp, 16(%rbx)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, %xmm0
	movl	$32, %edi
	movhps	16(%rbx), %xmm0
	movq	%rax, %rbp
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, 8(%rax)
	movq	%rax, %rsi
	movq	%rbp, (%rax)
	movl	$23, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%r12), %rax
	movq	8(%rax), %rdi
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
.L14:
	movl	$116, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L12
	.size	load_rvalue.part.0, .-load_rvalue.part.0
	.section	.rodata.str1.1
.LC4:
	.string	"<unknown>"
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"[warning] Invalid attribute access\n"
	.align 8
.LC6:
	.string	"[warning] Attribute '%s' not found in class '%s', fallback index %zu\n"
	.section	.rodata.str1.1
.LC7:
	.string	"$a%zu"
	.text
	.p2align 4
	.type	emit_attribute_access, @function
emit_attribute_access:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$24, %rsp
	testq	%rdi, %rdi
	je	.L40
	movq	%rsi, %rbx
	testq	%rsi, %rsi
	je	.L40
	cmpb	$0, 20(%rdi)
	movq	%rdi, %r14
	movq	%rdx, %r15
	jne	.L46
.L19:
	movq	8(%r14), %rbp
	testq	%rbp, %rbp
	je	.L21
	movl	32(%rbp), %eax
	testl	%eax, %eax
	jne	.L47
.L21:
	movq	(%r15), %rax
	movq	(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L24:
	cmpq	%rbp, 8(%rax)
	je	.L23
.L22:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L24
.L25:
	movl	$24, %edi
	movq	(%rbx), %rbp
	call	*alloc_memory@GOTPCREL(%rip)
	movq	40(%r15), %r12
	movl	$32, %esi
	movq	%rbx, (%rax)
	movq	%rax, %r13
	leaq	1(%r12), %rax
	movq	%rax, 40(%r15)
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movq	%rax, 8(%rsp)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%r13)
	movq	%rax, %rdi
	cmpq	$-1, %r12
	je	.L48
	movq	%r12, %r9
	movl	$97, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L28:
	movq	%rbp, 16(%r13)
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L23:
	movq	(%rax), %rdi
	testq	%rdi, %rdi
	je	.L25
	call	*list_copy@GOTPCREL(%rip)
	xorl	%r12d, %r12d
	movq	%rax, %r13
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L32:
	cmpq	(%rax), %rbx
	je	.L31
	addq	$1, %r12
.L30:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L32
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %esi
	movq	%rbx, (%rax)
	movq	%rax, %r13
	movq	(%rbx), %rax
	movq	%rax, 16(%r13)
	leaq	.LC1(%rip), %rax
	movq	%rax, 8(%rsp)
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	leaq	.LC4(%rip), %r8
	movq	%rax, 8(%r13)
	testq	%rbp, %rbp
	je	.L37
	movq	8(%rbp), %r8
.L37:
	movq	stderr(%rip), %rdi
	movq	8(%rbx), %rcx
	movq	%r12, %r9
	xorl	%eax, %eax
	leaq	.LC6(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	8(%r13), %rdi
.L38:
	movq	%r12, %r8
	leaq	.LC7(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
.L29:
	movq	(%rbx), %rbp
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	64(%r15), %r12
	movq	8(%rsp), %rdi
	movl	$32, %esi
	movq	$0, (%rax)
	movq	%rax, %rbx
	leaq	1(%r12), %rax
	movq	%rax, 64(%r15)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%rbx)
	movq	%rax, %rdi
	cmpq	$-1, %r12
	je	.L49
	movq	%r12, %r9
	movl	$116, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L35:
	movq	%rbp, 16(%rbx)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, %xmm0
	movl	$24, %edi
	movhps	16(%rbx), %xmm0
	movq	%rax, %rbp
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, %xmm0
	movl	$32, %edi
	movhps	16(%r13), %xmm0
	movq	%rax, %rbx
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, 8(%rax)
	movq	%rax, %rsi
	movl	$15, 24(%rax)
	movq	%rbp, (%rax)
	movq	%rbx, 16(%rax)
	movq	16(%r15), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movb	$1, 20(%rbp)
.L15:
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
.L47:
	xorl	%ebp, %ebp
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L49:
	movl	$116, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L31:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %esi
	movq	%rbx, (%rax)
	movq	%rax, %r13
	movq	(%rbx), %rax
	movq	%rax, 16(%r13)
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movq	%rax, 8(%rsp)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%r13)
	movq	%rax, %rdi
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L48:
	movl	$97, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L46:
	movq	%rdx, %rsi
	call	load_rvalue.part.0
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L19
	xorl	%ebp, %ebp
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L40:
	movq	stderr(%rip), %rcx
	movl	$35, %edx
	movl	$1, %esi
	xorl	%ebp, %ebp
	leaq	.LC5(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L15
	.size	emit_attribute_access, .-emit_attribute_access
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"[warning] Unsupported symbol kind for import: %d\n"
	.text
	.p2align 4
	.globl	codegen_import
	.type	codegen_import, @function
codegen_import:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rbx
	movq	(%rdi), %rbx
	movl	32(%rbx), %ecx
	cmpl	$3, %ecx
	je	.L62
	leal	-1(%rcx), %eax
	cmpl	$1, %eax
	jbe	.L63
	testl	%ecx, %ecx
	jne	.L57
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	call	*create_list@GOTPCREL(%rip)
	movq	%rbx, %xmm1
	movq	$0, 16(%rbp)
	movq	%rbp, %rsi
	movq	%rax, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, 0(%rbp)
	popq	%rbx
	movq	(%r12), %rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L57:
	popq	%rbx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbp
	leaq	.LC8(%rip), %rdx
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L63:
	movq	(%rbx), %r14
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	leaq	.LC1(%rip), %rdi
	movl	$32, %esi
	movq	%rbx, (%rax)
	movq	80(%rbp), %rbx
	movq	%rax, %r13
	leaq	1(%rbx), %rax
	movq	%rax, 80(%rbp)
	call	*create_string@GOTPCREL(%rip)
	movq	%rbx, %r9
	movl	$102, %r8d
	movq	%rax, 8(%r13)
	movq	%rax, %rdi
	cmpq	$-1, %rbx
	je	.L64
.L60:
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
.L56:
	movq	%r14, 16(%r13)
	movq	16(%r12), %rdi
	movq	%r13, %rsi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L62:
	movq	(%rbx), %r14
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	leaq	.LC1(%rip), %rdi
	movl	$32, %esi
	movq	%rbx, (%rax)
	movq	56(%rbp), %rbx
	movq	%rax, %r13
	leaq	1(%rbx), %rax
	movq	%rax, 56(%rbp)
	call	*create_string@GOTPCREL(%rip)
	movl	$118, %r8d
	movq	%rax, 8(%r13)
	movq	%rax, %rdi
	cmpq	$-1, %rbx
	je	.L61
	movq	%rbx, %r9
	movl	$118, %r8d
	jmp	.L60
	.p2align 4,,10
	.p2align 3
.L64:
	movl	$102, %r8d
.L61:
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L56
	.size	codegen_import, .-codegen_import
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"Error: create_attribute received NULL table or attributes list\n"
	.align 8
.LC10:
	.string	"[warning] Unsupported variable type for codegen_variable: %d\n"
	.text
	.p2align 4
	.globl	codegen_variable
	.type	codegen_variable, @function
codegen_variable:
	pushq	%r15
	pushq	%r14
	movq	%rdi, %r14
	pushq	%r13
	movl	%edx, %r13d
	pushq	%r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	subq	$24, %rsp
	movq	8(%rdi), %r12
	movq	(%rdi), %r15
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r12, (%rax)
	leal	-97(%r13), %r12d
	movq	%rax, %rbx
	cmpl	$21, %r12d
	ja	.L66
	leaq	.L68(%rip), %rdx
	movl	%r12d, %eax
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
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
	leaq	.LC1(%rip), %rdi
	movl	$32, %esi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%rbx)
	movq	%rax, %rdi
.L74:
	movl	%r13d, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
.L77:
	movq	%r15, 16(%rbx)
	cmpl	$21, %r12d
	ja	.L78
	leaq	.L80(%rip), %rdx
	movslq	(%rdx,%r12,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
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
	movq	stderr(%rip), %rdi
	addq	$24, %rsp
	movl	%r13d, %ecx
	xorl	%eax, %eax
	popq	%rbx
	leaq	.LC10(%rip), %rdx
	popq	%rbp
	movl	$2, %esi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L79:
	movq	8(%rbp), %rax
	movq	24(%rax), %rdi
.L99:
	movq	%rbx, %rsi
.L100:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L82:
	movq	8(%rbp), %rax
	movq	16(%rax), %rdi
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L83:
	movq	0(%rbp), %rax
	movq	16(%rax), %rdi
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L84:
	movq	0(%rbp), %rax
	movq	(%rax), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	0(%rbp), %rax
	movq	%r12, %rsi
	movq	(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movdqu	(%r14), %xmm0
	movl	$24, %edi
	movdqa	%xmm0, %xmm1
	movq	%xmm0, %rbx
	shufpd	$1, %xmm0, %xmm1
	movaps	%xmm1, (%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm1
	movq	%rax, %rbp
	movups	%xmm1, (%rax)
	movq	16(%r12), %rax
	movq	%rax, 16(%rbp)
	testq	%rbx, %rbx
	je	.L85
	cmpq	name_int(%rip), %rbx
	je	.L97
	cmpq	name_float(%rip), %rbx
	je	.L97
	cmpq	name_string(%rip), %rbx
	je	.L97
	cmpq	name_bool(%rip), %rbx
	je	.L98
	cmpq	name_void(%rip), %rbx
	je	.L98
	movl	32(%rbx), %edx
	testl	%edx, %edx
	jne	.L91
	movq	24(%rbx), %rdx
	addq	24(%rdx), %rax
.L85:
	movq	(%r12), %rdi
	movq	%rax, 16(%r12)
	movq	%rbp, %rsi
	testq	%rdi, %rdi
	jne	.L100
	movq	stderr(%rip), %rcx
	addq	$24, %rsp
	movl	$63, %edx
	movl	$1, %esi
	popq	%rbx
	leaq	.LC9(%rip), %rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*fwrite@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L73:
	movq	40(%rbp), %r9
	leaq	1(%r9), %rax
	movq	%rax, 40(%rbp)
	.p2align 4,,10
	.p2align 3
.L75:
	movq	%r9, (%rsp)
	leaq	.LC1(%rip), %rdi
	movl	$32, %esi
	call	*create_string@GOTPCREL(%rip)
	movq	(%rsp), %r9
	movq	%rax, 8(%rbx)
	movq	%rax, %rdi
	cmpq	$-1, %r9
	je	.L74
	movl	%r13d, %r8d
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L77
	.p2align 4,,10
	.p2align 3
.L72:
	movq	72(%rbp), %r9
	leaq	1(%r9), %rax
	movq	%rax, 72(%rbp)
	jmp	.L75
	.p2align 4,,10
	.p2align 3
.L71:
	movq	80(%rbp), %r9
	leaq	1(%r9), %rax
	movq	%rax, 80(%rbp)
	jmp	.L75
	.p2align 4,,10
	.p2align 3
.L70:
	movq	48(%rbp), %r9
	leaq	1(%r9), %rax
	movq	%rax, 48(%rbp)
	jmp	.L75
	.p2align 4,,10
	.p2align 3
.L69:
	movq	64(%rbp), %r9
	leaq	1(%r9), %rax
	movq	%rax, 64(%rbp)
	jmp	.L75
	.p2align 4,,10
	.p2align 3
.L67:
	movq	56(%rbp), %r9
	leaq	1(%r9), %rax
	movq	%rax, 56(%rbp)
	jmp	.L75
	.p2align 4,,10
	.p2align 3
.L91:
	movq	8(%rbx), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC0(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	16(%r12), %rax
.L97:
	addq	$8, %rax
	jmp	.L85
	.p2align 4,,10
	.p2align 3
.L98:
	addq	$1, %rax
	jmp	.L85
	.size	codegen_variable, .-codegen_variable
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"[warning] Invalid variable access input\n"
	.align 8
.LC12:
	.string	"[warning] Variable access name is NULL\n"
	.align 8
.LC13:
	.string	"[warning] Unresolved variable access for '%s', creating fallback local\n"
	.align 8
.LC14:
	.string	"[warning] Invalid get-attribute access\n"
	.align 8
.LC15:
	.string	"[warning] Failed to generate object for get-attribute access\n"
	.align 8
.LC16:
	.string	"[warning] Invalid get-sequence access\n"
	.align 8
.LC17:
	.string	"[warning] Failed to generate sequence/index for get-sequence access\n"
	.align 8
.LC18:
	.string	"[warning] Invalid function call without callee\n"
	.align 8
.LC19:
	.string	"[warning] Failed to generate callee for function call\n"
	.align 8
.LC20:
	.string	"[warning] Unsupported callee in function call\n"
	.align 8
.LC21:
	.string	"[warning] Failed to generate function call argument\n"
	.align 8
.LC22:
	.string	"[warning] Unsupported variable access type for codegen_variable_access: %d\n"
	.text
	.p2align 4
	.globl	codegen_variable_access
	.type	codegen_variable_access, @function
codegen_variable_access:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	testq	%rdi, %rdi
	je	.L175
	movq	%rsi, %rbp
	testq	%rsi, %rsi
	je	.L175
	movl	16(%rdi), %ecx
	movq	%rdi, %rbx
	testl	%ecx, %ecx
	jne	.L105
	movq	8(%rdi), %r13
	testq	%r13, %r13
	je	.L261
	movq	8(%rsi), %rdx
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
	cmpq	(%rbx), %r13
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
	cmpq	(%rbx), %r13
	jne	.L116
	.p2align 4,,10
	.p2align 3
.L259:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, %xmm0
	movhps	16(%rbx), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r15
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
.L101:
	addq	$8, %rsp
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
.L105:
	cmpl	$2, %ecx
	je	.L263
	cmpl	$3, %ecx
	je	.L264
	cmpl	$1, %ecx
	jne	.L152
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L265
	cmpl	$2, 16(%rdi)
	jne	.L154
	movq	8(%rdi), %r13
	testq	%r13, %r13
	je	.L154
	movl	32(%r13), %eax
	subl	$1, %eax
	cmpl	$1, %eax
	ja	.L154
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L174
	movl	16(%rdi), %edx
	testl	%edx, %edx
	jne	.L156
	movq	8(%rdi), %rax
	testq	%rax, %rax
	je	.L156
	movl	32(%rax), %eax
	testl	%eax, %eax
	je	.L174
.L156:
	movq	%rbp, %rsi
	call	codegen_variable_access
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L174
	cmpb	$0, 20(%rax)
	jne	.L266
.L157:
	movq	%rbp, %rsi
	movl	$1, %r12d
	call	emit_param_instruction.part.0
.L158:
	movq	8(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L162
	.p2align 4,,10
	.p2align 3
.L164:
	movq	%rbp, %rsi
	addq	$1, %r12
	call	emit_param_instruction.part.0
.L162:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L267
	movq	%rbp, %rsi
	call	codegen_expression
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L165
	cmpb	$0, 20(%rax)
	je	.L164
	movq	%rbp, %rsi
	call	load_rvalue.part.0
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L164
	.p2align 4,,10
	.p2align 3
.L165:
	movq	stderr(%rip), %rcx
	movl	$52, %edx
	movl	$1, %esi
	leaq	.LC21(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L264:
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L143
	cmpq	$0, 8(%rbx)
	je	.L143
	call	codegen_variable_access
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L145
	cmpb	$0, 20(%rax)
	jne	.L268
.L145:
	movq	8(%rbx), %rdi
	movq	%rbp, %rsi
	call	codegen_expression
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L148
	cmpb	$0, 20(%rax)
	jne	.L269
.L147:
	testq	%r12, %r12
	je	.L148
	testq	%r13, %r13
	je	.L148
	movq	8(%r12), %r14
	cmpq	name_float(%rip), %r14
	movq	name_int(%rip), %rax
	je	.L149
	cmpq	name_bool(%rip), %r14
	je	.L149
	cmpq	name_string(%rip), %r14
	cmovne	%rax, %r14
.L149:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	64(%rbp), %r15
	movl	$32, %esi
	leaq	.LC1(%rip), %rdi
	movq	$0, (%rax)
	movq	%rax, %rbx
	leaq	1(%r15), %rax
	movq	%rax, 64(%rbp)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%rbx)
	movq	%rax, %rdi
	cmpq	$-1, %r15
	je	.L270
	movq	%r15, %r9
	movl	$116, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L151:
	movl	$24, %edi
	movq	%r14, 16(%rbx)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, %xmm0
	movl	$32, %edi
	movhps	16(%rbx), %xmm0
	movq	%rax, %r15
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r12, 8(%rax)
	movq	%rax, %rsi
	movl	$16, 24(%rax)
	movq	%r15, (%rax)
	movq	%r13, 16(%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movb	$1, 20(%r15)
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L154:
	movq	%rbp, %rsi
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
	movq	(%rax), %r13
	testq	%r13, %r13
	je	.L161
	movl	32(%r13), %eax
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L174
	.p2align 4,,10
	.p2align 3
.L161:
	movq	stderr(%rip), %rcx
	movl	$46, %edx
	movl	$1, %esi
	leaq	.LC20(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L263:
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L136
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L136
	movl	32(%rbx), %eax
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L273
	call	codegen_variable_access
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L274
.L260:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
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
	cmpq	(%rbx), %r13
	je	.L259
.L124:
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L125
	cmpl	$2, 32(%r13)
	jbe	.L110
	testq	%rdx, %rdx
	je	.L111
	movq	16(%rdx), %rcx
.L118:
	movq	(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L111
	.p2align 4,,10
	.p2align 3
.L130:
	movq	8(%rbx), %r12
	testq	%r12, %r12
	je	.L131
	movq	(%r12), %rax
	testq	%rax, %rax
	je	.L131
	movq	8(%rax), %rdi
	movq	SELF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L275
.L131:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L130
.L111:
	movq	8(%r13), %rcx
	leaq	.LC13(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	movq	stderr(%rip), %rdi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	0(%r13), %r12
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	leaq	.LC1(%rip), %rdi
	movl	$32, %esi
	movq	%r13, (%rax)
	movq	56(%rbp), %r13
	movq	%rax, %rbx
	leaq	1(%r13), %rax
	movq	%rax, 56(%rbp)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%rbx)
	movq	%rax, %rdi
	cmpq	$-1, %r13
	je	.L276
	movq	%r13, %r9
	movl	$118, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L134:
	movq	%r12, 16(%rbx)
	jmp	.L259
	.p2align 4,,10
	.p2align 3
.L275:
	movq	16(%r12), %rax
	testq	%rax, %rax
	je	.L111
	movl	32(%rax), %ecx
	testl	%ecx, %ecx
	jne	.L111
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	cmpq	%rax, 24(%r13)
	jne	.L111
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r12, %xmm0
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movhps	16(%r12), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rdi
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L260
	.p2align 4,,10
	.p2align 3
.L175:
	movq	stderr(%rip), %rcx
	movl	$40, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L104:
	xorl	%r15d, %r15d
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L253:
	cmpl	$2, 32(%r13)
	ja	.L111
	.p2align 4,,10
	.p2align 3
.L110:
	movq	0(%r13), %r12
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	leaq	.LC1(%rip), %rdi
	movl	$32, %esi
	movq	%r13, (%rax)
	movq	80(%rbp), %r13
	movq	%rax, %rbx
	leaq	1(%r13), %rax
	movq	%rax, 80(%rbp)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%rbx)
	movq	%rax, %rdi
	cmpq	$-1, %r13
	je	.L277
	movq	%r13, %r9
	movl	$102, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L128:
	movq	%r12, 16(%rbx)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, %xmm0
	movhps	16(%rbx), %xmm0
	movl	$7, 16(%rax)
	movq	%rax, %r15
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L119:
	movq	0(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L122
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L125
.L122:
	cmpl	$2, 32(%r13)
	ja	.L118
	jmp	.L110
	.p2align 4,,10
	.p2align 3
.L152:
	movq	stderr(%rip), %rdi
	leaq	.LC22(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L276:
	movl	$118, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L134
	.p2align 4,,10
	.p2align 3
.L270:
	movl	$116, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L151
	.p2align 4,,10
	.p2align 3
.L261:
	movq	stderr(%rip), %rcx
	movl	$39, %edx
	movl	$1, %esi
	leaq	.LC12(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L273:
	movq	(%rbx), %r13
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	leaq	.LC1(%rip), %rdi
	movl	$32, %esi
	movq	%rbx, (%rax)
	movq	80(%rbp), %rbx
	movq	%rax, %r12
	leaq	1(%rbx), %rax
	movq	%rax, 80(%rbp)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%r12)
	movq	%rax, %rdi
	cmpq	$-1, %rbx
	je	.L278
	movq	%rbx, %r9
	movl	$102, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L140:
	movq	%r13, 16(%r12)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r12, %xmm0
	movhps	16(%r12), %xmm0
	movl	$7, 16(%rax)
	movq	%rax, %r15
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L272:
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L161
	movq	(%rax), %r13
	testq	%r13, %r13
	je	.L161
.L174:
	xorl	%r12d, %r12d
	jmp	.L158
	.p2align 4,,10
	.p2align 3
.L267:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r15
	movl	$5, 16(%rax)
	movq	$0, (%rax)
	movq	name_void(%rip), %rax
	movb	$0, 20(%r15)
	movq	0(%r13), %r14
	movq	%rax, 8(%r15)
	cmpq	%rax, %r14
	je	.L167
	testq	%r14, %r14
	je	.L167
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	64(%rbp), %r15
	movl	$32, %esi
	leaq	.LC1(%rip), %rdi
	movq	$0, (%rax)
	movq	%rax, %rbx
	leaq	1(%r15), %rax
	movq	%rax, 64(%rbp)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%rbx)
	movq	%rax, %rdi
	cmpq	$-1, %r15
	je	.L279
	movq	%r15, %r9
	movl	$116, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L169:
	movq	%r14, 16(%rbx)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, %xmm0
	movhps	16(%rbx), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r15
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	movq	0(%r13), %r14
.L167:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	leaq	.LC1(%rip), %rdi
	movl	$32, %esi
	movq	%r13, (%rax)
	movq	80(%rbp), %r13
	movq	%rax, %rbx
	leaq	1(%r13), %rax
	movq	%rax, 80(%rbp)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%rbx)
	movq	%rax, %rdi
	cmpq	$-1, %r13
	je	.L280
	movq	%r13, %r9
	movl	$102, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L171:
	movq	%r14, 16(%rbx)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, %xmm0
	movl	$24, %edi
	movhps	16(%rbx), %xmm0
	movq	%rax, %r13
	movl	$7, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%r12, (%rax)
	movq	%rax, %rbx
	movl	$1, 16(%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, 8(%rax)
	movq	%rax, %rsi
	movq	%r15, (%rax)
	movq	%rbx, 16(%rax)
	movl	$22, 24(%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L277:
	movl	$102, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L128
.L143:
	movq	stderr(%rip), %rcx
	movl	$38, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L104
.L136:
	movq	stderr(%rip), %rcx
	movl	$39, %edx
	movl	$1, %esi
	leaq	.LC14(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L104
.L269:
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %r13
	jmp	.L147
.L268:
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %r12
	jmp	.L145
.L274:
	movq	stderr(%rip), %rcx
	movl	$61, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L104
.L265:
	movq	stderr(%rip), %rcx
	movl	$47, %edx
	movl	$1, %esi
	leaq	.LC18(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L104
.L148:
	movq	stderr(%rip), %rcx
	movl	$68, %edx
	movl	$1, %esi
	leaq	.LC17(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L104
.L278:
	movl	$102, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L140
.L280:
	movl	$102, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L171
.L271:
	movq	stderr(%rip), %rcx
	movl	$54, %edx
	movl	$1, %esi
	leaq	.LC19(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L104
.L279:
	movl	$116, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L169
.L266:
	movq	%rbp, %rsi
	call	load_rvalue.part.0
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L157
	jmp	.L174
	.size	codegen_variable_access, .-codegen_variable_access
	.section	.rodata.str1.8
	.align 8
.LC24:
	.string	"[warning] Unsupported type for negation: %s\n"
	.align 8
.LC25:
	.string	"[warning] Unsupported primary type for codegen_primary: %d\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB26:
	.text
.LHOTB26:
	.p2align 4
	.globl	codegen_primary
	.type	codegen_primary, @function
codegen_primary:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$16, %rsp
	movl	8(%rdi), %ecx
	cmpl	$8, %ecx
	ja	.L282
	leaq	.L284(%rip), %rdx
	movq	%rsi, %rbp
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
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
	movq	(%rdi), %rdi
	call	codegen_primary
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L297
	cmpb	$0, 20(%rax)
	jne	.L309
.L298:
	movl	$24, %edi
	movq	8(%r13), %rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movq	64(%rbp), %r14
	movl	$32, %esi
	leaq	.LC1(%rip), %rdi
	movq	$0, (%rax)
	movq	%rax, %r12
	leaq	1(%r14), %rax
	movq	%rax, 64(%rbp)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%r12)
	movq	%rax, %rdi
	cmpq	$-1, %r14
	je	.L310
	movq	%r14, %r9
	movl	$116, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L300:
	movq	%rbx, 16(%r12)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r12, %xmm0
	movhps	16(%r12), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	movq	8(%r13), %rax
	cmpq	name_int(%rip), %rax
	je	.L311
	cmpq	name_float(%rip), %rax
	je	.L312
	movq	8(%rax), %rcx
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	leaq	.LC24(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
.L315:
	addq	$16, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L283:
	movq	(%rdi), %rdi
	addq	$16, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	codegen_variable_access
	.p2align 4,,10
	.p2align 3
.L292:
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
.L281:
	addq	$16, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L291:
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
	addq	$16, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L290:
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
	addq	$16, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L289:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$4, 16(%rax)
	movq	%rax, %rbx
	movb	$1, (%rax)
	movq	name_bool(%rip), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	addq	$16, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L288:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$4, 16(%rax)
	movq	%rax, %rbx
	movb	$0, (%rax)
	movq	name_bool(%rip), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	addq	$16, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L287:
	movq	(%rdi), %rdi
	addq	$16, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	codegen_expression
	.p2align 4,,10
	.p2align 3
.L286:
	movq	(%rdi), %rdi
	call	codegen_primary
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L294
	cmpb	$0, 20(%rax)
	jne	.L313
.L294:
	movl	$24, %edi
	movq	name_bool(%rip), %rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movq	64(%rbp), %r14
	movl	$32, %esi
	leaq	.LC1(%rip), %rdi
	movq	$0, (%rax)
	movq	%rax, %r12
	leaq	1(%r14), %rax
	movq	%rax, 64(%rbp)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%r12)
	movq	%rax, %rdi
	cmpq	$-1, %r14
	je	.L314
	movq	%r14, %r9
	movl	$116, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L296:
	movq	%rbx, 16(%r12)
	movl	$24, %edi
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
	addq	$16, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L282:
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	leaq	.LC25(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L315
	.p2align 4,,10
	.p2align 3
.L312:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movl	$2, 16(%rax)
	movq	%rax, %r12
	movq	.LC23(%rip), %rax
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
.L302:
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L281
	.p2align 4,,10
	.p2align 3
.L310:
	movl	$116, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L300
	.p2align 4,,10
	.p2align 3
.L314:
	movl	$116, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L296
	.p2align 4,,10
	.p2align 3
.L313:
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %r13
	jmp	.L294
	.p2align 4,,10
	.p2align 3
.L309:
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %r13
	jmp	.L298
	.p2align 4,,10
	.p2align 3
.L311:
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
	jmp	.L302
	.section	.text.unlikely
	.type	codegen_primary.cold, @function
codegen_primary.cold:
.L297:
	movq	8, %rax
	ud2
	.text
	.size	codegen_primary, .-codegen_primary
	.section	.text.unlikely
	.size	codegen_primary.cold, .-codegen_primary.cold
.LCOLDE26:
	.text
.LHOTE26:
	.section	.rodata.str1.8
	.align 8
.LC27:
	.string	"[warning] Left-hand side of assignment is not a variable\n"
	.text
	.p2align 4
	.globl	codegen_expression
	.type	codegen_expression, @function
codegen_expression:
	pushq	%r15
	pushq	%r14
	movq	%rdi, %r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$24, %rsp
	cmpl	$19, 24(%rdi)
	je	.L341
	movq	16(%rdi), %rdi
	call	codegen_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L318
	cmpb	$0, 20(%rax)
	jne	.L342
.L318:
	movl	24(%r14), %eax
	movq	(%r14), %rdi
	cmpl	$18, %eax
	ja	.L319
	leaq	CSWTCH.51(%rip), %rdx
	movq	%rbx, %rsi
	movl	(%rdx,%rax,4), %r13d
	call	codegen_expression
	movq	%rax, %r12
	movl	24(%r14), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L320
	cmpl	$14, %r13d
	jne	.L330
	movl	16(%r12), %eax
	testl	%eax, %eax
	jne	.L343
.L325:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$14, 24(%rax)
	movq	%rax, %rsi
	movq	%r12, (%rax)
	movq	%rbp, 8(%rax)
	movq	$0, 16(%rax)
	cmpb	$0, 20(%r12)
	jne	.L344
.L326:
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
.L319:
	movq	%rbx, %rsi
	movl	$25, %r13d
	call	codegen_expression
	movq	%rax, %r12
	movl	24(%r14), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L320
.L330:
	movl	$24, %edi
	movq	8(%r12), %r15
	call	*alloc_memory@GOTPCREL(%rip)
	movq	64(%rbx), %r9
	movl	$32, %esi
	leaq	.LC1(%rip), %rdi
	movq	$0, (%rax)
	movq	%rax, %r14
	leaq	1(%r9), %rax
	movq	%r9, 8(%rsp)
	movq	%rax, 64(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movq	8(%rsp), %r9
	movl	$116, %r8d
	movq	%rax, 8(%r14)
	movq	%rax, %rdi
	cmpq	$-1, %r9
	je	.L345
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
.L323:
	movq	%r15, 16(%r14)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, %xmm0
	movhps	16(%r14), %xmm0
	movb	$0, 20(%rax)
	movq	%rax, %r15
	movq	%r12, %r14
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	cmpb	$0, 20(%r12)
	jne	.L346
.L324:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, 8(%rax)
	movq	%rax, %rsi
	movq	%rbp, 16(%rax)
	movq	%r15, %rbp
	movl	%r13d, 24(%rax)
	movq	%r15, (%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	16(%r12), %eax
	testl	%eax, %eax
	je	.L325
.L343:
	movq	stderr(%rip), %rcx
	movl	$57, %edx
	movl	$1, %esi
	leaq	.LC27(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L325
	.p2align 4,,10
	.p2align 3
.L320:
	movl	$24, %edi
	movq	8(%r12), %r15
	call	*alloc_memory@GOTPCREL(%rip)
	movq	64(%rbx), %r9
	movl	$32, %esi
	leaq	.LC1(%rip), %rdi
	movq	$0, (%rax)
	movq	%rax, %r14
	leaq	1(%r9), %rax
	movq	%r9, 8(%rsp)
	movq	%rax, 64(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movq	8(%rsp), %r9
	movl	$116, %r8d
	movq	%rax, 8(%r14)
	movq	%rax, %rdi
	cmpq	$-1, %r9
	je	.L347
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
.L328:
	movq	%r15, 16(%r14)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, %xmm0
	movhps	16(%r14), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r15
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	cmpb	$0, 20(%r12)
	jne	.L348
.L329:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, 16(%rax)
	movq	%rax, %rsi
	movq	%r15, %rbp
	movl	%r13d, 24(%rax)
	movq	%r15, (%rax)
	movq	%r12, 8(%rax)
	jmp	.L326
	.p2align 4,,10
	.p2align 3
.L341:
	movq	8(%rdi), %rdi
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	codegen_primary
	.p2align 4,,10
	.p2align 3
.L347:
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L328
	.p2align 4,,10
	.p2align 3
.L345:
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L323
	.p2align 4,,10
	.p2align 3
.L344:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$24, 24(%rax)
	movq	%rax, %rsi
	movq	%r12, (%rax)
	movq	%rbp, 8(%rax)
	movq	$0, 16(%rax)
	jmp	.L326
	.p2align 4,,10
	.p2align 3
.L342:
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %rbp
	jmp	.L318
	.p2align 4,,10
	.p2align 3
.L348:
	movq	%r12, %rdi
	movq	%rbx, %rsi
	call	load_rvalue.part.0
	movq	%rax, %r12
	jmp	.L329
	.p2align 4,,10
	.p2align 3
.L346:
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	load_rvalue.part.0
	movq	%rax, %r14
	jmp	.L324
	.size	codegen_expression, .-codegen_expression
	.p2align 4
	.globl	codegen_if
	.type	codegen_if, @function
codegen_if:
	pushq	%r15
	movq	%rdi, %r15
	movl	$24, %edi
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$56, %rsp
	call	*alloc_memory@GOTPCREL(%rip)
	movq	72(%rbx), %rbp
	movl	$32, %esi
	leaq	.LC1(%rip), %rdi
	movq	$0, (%rax)
	movq	%rax, %r12
	leaq	1(%rbp), %rax
	movq	%rax, 72(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%r12)
	movq	%rax, %rdi
	cmpq	$-1, %rbp
	je	.L383
	movq	%rbp, %r9
	movl	$98, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L351:
	movq	$0, 16(%r12)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	72(%rbx), %r13
	movl	$32, %esi
	leaq	.LC1(%rip), %rdi
	movq	$0, (%rax)
	movq	%rax, %rbp
	leaq	1(%r13), %rax
	movq	%rax, 72(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%rbp)
	movq	%rax, %rdi
	cmpq	$-1, %r13
	je	.L384
	movq	%r13, %r9
	movl	$98, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L353:
	movq	$0, 16(%rbp)
	movq	16(%r15), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L358
	movq	24(%r15), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	movq	%rbp, 32(%rsp)
	testb	%al, %al
	je	.L358
.L357:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	32(%rsp), %rdx
	movq	%rbx, %rsi
	movb	$0, 20(%rax)
	movq	(%r15), %rdi
	movq	%rdx, (%rax)
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rax, 24(%rsp)
	call	codegen_expression
	movl	$24, %edi
	movq	%rax, 8(%rsp)
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
	movq	%rax, %r14
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	8(%rsp), %rdx
	movq	%rax, %rsi
	movq	%r14, 8(%rax)
	movq	%rdx, (%rax)
	movq	%r13, 16(%rax)
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
	jmp	.L360
	.p2align 4,,10
	.p2align 3
.L361:
	movq	%rbx, %rsi
	call	codegen_statement
.L360:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L361
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$20, 24(%rax)
	movq	%rax, %rsi
	movq	24(%rsp), %rax
	movq	$0, 8(%rsi)
	movq	%rax, (%rsi)
	movq	16(%rbx), %rax
	movq	$0, 16(%rsi)
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	16(%r15), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L385
.L362:
	movq	24(%r15), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L386
.L373:
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	32(%rsp), %rax
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
.L358:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	72(%rbx), %r13
	movl	$32, %esi
	leaq	.LC1(%rip), %rdi
	movq	$0, (%rax)
	movq	%rax, %r14
	movq	%rax, 32(%rsp)
	leaq	1(%r13), %rax
	movq	%rax, 72(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%r14)
	movq	%rax, %rdi
	cmpq	$-1, %r13
	je	.L387
	movq	%r13, %r9
	movl	$98, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L359:
	movq	32(%rsp), %rax
	movq	$0, 16(%rax)
	jmp	.L357
	.p2align 4,,10
	.p2align 3
.L387:
	movl	$98, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L359
	.p2align 4,,10
	.p2align 3
.L384:
	movl	$98, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L353
	.p2align 4,,10
	.p2align 3
.L383:
	movl	$98, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L351
	.p2align 4,,10
	.p2align 3
.L386:
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
	jmp	.L374
	.p2align 4,,10
	.p2align 3
.L375:
	movq	%rbx, %rsi
	call	codegen_statement
.L374:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L375
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rsi
	movl	$20, 24(%rax)
	movq	24(%rsp), %rax
	movq	$0, 8(%rsi)
	movq	%rax, (%rsi)
	movq	16(%rbx), %rax
	movq	$0, 16(%rsi)
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L373
	.p2align 4,,10
	.p2align 3
.L385:
	movq	16(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%r15, 40(%rsp)
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L363:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L388
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
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	72(%rbx), %rbp
	movl	$32, %esi
	leaq	.LC1(%rip), %rdi
	movq	$0, (%rax)
	movq	%rax, %r12
	leaq	1(%rbp), %rax
	movq	%rax, 72(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%r12)
	movq	%rax, %rdi
	cmpq	$-1, %rbp
	je	.L389
	movq	%rbp, %r9
	movl	$98, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L365:
	movq	$0, 16(%r12)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	72(%rbx), %r14
	movl	$32, %esi
	leaq	.LC1(%rip), %rdi
	movq	$0, (%rax)
	movq	%rax, %rbp
	leaq	1(%r14), %rax
	movq	%rax, 72(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%rbp)
	movq	%rax, %rdi
	cmpq	$-1, %r14
	je	.L390
	movq	%r14, %r9
	movl	$98, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L367:
	movq	$0, 16(%rbp)
	movq	0(%r13), %rdi
	movq	%rbx, %rsi
	call	codegen_expression
	movq	8(%rsp), %rdi
	movq	%rax, %r14
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L391
.L369:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$24, %edi
	movq	%rax, %r15
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
	movq	%rax, 16(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	movq	%rax, %rsi
	movq	%r14, (%rax)
	movq	%rcx, 8(%rax)
	movl	$19, 24(%rax)
	movq	%r15, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r14
	movq	%r12, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%r14, %rsi
	movq	%rax, 8(%r14)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r14, 16(%rbx)
	movq	8(%r13), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L370
	.p2align 4,,10
	.p2align 3
.L371:
	movq	%rbx, %rsi
	call	codegen_statement
.L370:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L371
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rsi
	movl	$20, 24(%rax)
	movq	24(%rsp), %rax
	movq	$0, 8(%rsi)
	movq	%rax, (%rsi)
	movq	16(%rbx), %rax
	movq	$0, 16(%rsi)
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L363
	.p2align 4,,10
	.p2align 3
.L390:
	movl	$98, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L367
	.p2align 4,,10
	.p2align 3
.L389:
	movl	$98, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L365
	.p2align 4,,10
	.p2align 3
.L391:
	movq	40(%rsp), %rax
	movq	24(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	cmovne	32(%rsp), %rbp
	jmp	.L369
	.p2align 4,,10
	.p2align 3
.L388:
	movq	40(%rsp), %r15
	jmp	.L362
	.size	codegen_if, .-codegen_if
	.section	.rodata.str1.8
	.align 8
.LC28:
	.string	"[warning] 'break' statement used outside of loop\n"
	.align 8
.LC29:
	.string	"[warning] 'continue' statement used outside of loop\n"
	.align 8
.LC30:
	.string	"[warning] Unsupported statement type for codegen_statement: %d\n"
	.text
	.p2align 4
	.globl	codegen_statement
	.type	codegen_statement, @function
codegen_statement:
	movl	8(%rdi), %ecx
	cmpl	$7, %ecx
	ja	.L393
	pushq	%r13
	leaq	.L395(%rip), %rdx
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$8, %rsp
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L395:
	.long	.L402-.L395
	.long	.L401-.L395
	.long	.L400-.L395
	.long	.L399-.L395
	.long	.L398-.L395
	.long	.L397-.L395
	.long	.L396-.L395
	.long	.L394-.L395
	.text
	.p2align 4,,10
	.p2align 3
.L396:
	movq	24(%rsi), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L405
	movq	24(%rbx), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbp
	testq	%rbp, %rbp
	je	.L405
.L419:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$20, 24(%rax)
	movq	%rax, %rsi
	jmp	.L417
	.p2align 4,,10
	.p2align 3
.L394:
	movq	32(%rsi), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L406
	movq	32(%rbx), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbp
	testq	%rbp, %rbp
	jne	.L419
.L406:
	movq	stderr(%rip), %rcx
	movl	$52, %edx
	movl	$1, %esi
	leaq	.LC29(%rip), %rdi
	jmp	.L418
	.p2align 4,,10
	.p2align 3
.L400:
	movq	(%rdi), %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	codegen_if
	.p2align 4,,10
	.p2align 3
.L402:
	movq	(%rdi), %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	codegen_expression
	.p2align 4,,10
	.p2align 3
.L401:
	movq	(%rdi), %rax
	movl	$24, %edi
	movq	8(%rax), %r12
	movq	(%rax), %r13
	call	*alloc_memory@GOTPCREL(%rip)
	leaq	.LC1(%rip), %rdi
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
	je	.L420
	movq	%r12, %r9
	movl	$118, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L404:
	movq	8(%rbx), %rax
	movq	%r13, 16(%rbp)
	movq	%rbp, %rsi
	movq	24(%rax), %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L398:
	movq	(%rdi), %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	codegen_for
	.p2align 4,,10
	.p2align 3
.L397:
	movq	(%rdi), %rdi
	call	codegen_expression
	movl	$32, %edi
	movq	%rax, %rbp
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$21, 24(%rax)
	movq	%rax, %rsi
.L417:
	movq	16(%rbx), %rax
	movq	%rbp, (%rsi)
	movq	$0, 8(%rsi)
	movq	$0, 16(%rsi)
	movq	8(%rax), %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L399:
	movq	(%rdi), %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	codegen_while
	.p2align 4,,10
	.p2align 3
.L405:
	movq	stderr(%rip), %rcx
	movl	$49, %edx
	movl	$1, %esi
	leaq	.LC28(%rip), %rdi
.L418:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	*fwrite@GOTPCREL(%rip)
.L393:
	movq	stderr(%rip), %rdi
	leaq	.LC30(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L420:
	movl	$118, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L404
	.size	codegen_statement, .-codegen_statement
	.p2align 4
	.globl	codegen_for
	.type	codegen_for, @function
codegen_for:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	leaq	.LC1(%rip), %rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$40, %rsp
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L422
	movq	8(%rax), %r15
	movl	$24, %edi
	movq	(%rax), %r14
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, %rdi
	movl	$32, %esi
	movq	%r15, (%rax)
	movq	56(%rbx), %r15
	movq	%rax, %r13
	leaq	1(%r15), %rax
	movq	%rax, 56(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%r13)
	movq	%rax, %rdi
	cmpq	$-1, %r15
	je	.L446
	movq	%r15, %r9
	movl	$118, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L424:
	movq	8(%rbx), %rax
	movq	%r14, 16(%r13)
	movq	%r13, %rsi
	movq	24(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L422:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	72(%rbx), %r14
	movq	%rbp, %rdi
	movl	$32, %esi
	movq	$0, (%rax)
	movq	%rax, %r13
	leaq	1(%r14), %rax
	movq	%rax, 72(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%r13)
	movq	%rax, %rdi
	cmpq	$-1, %r14
	je	.L447
	movq	%r14, %r9
	movl	$98, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L426:
	movl	$24, %edi
	movq	$0, 16(%r13)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	72(%rbx), %r14
	movq	%rbp, %rdi
	movl	$32, %esi
	movq	$0, (%rax)
	movq	%rax, %r15
	leaq	1(%r14), %rax
	movq	%rax, 72(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%r15)
	movq	%rax, %rdi
	cmpq	$-1, %r14
	je	.L448
	movq	%r14, %r9
	movl	$98, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L428:
	movl	$24, %edi
	movq	$0, 16(%r15)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	72(%rbx), %r9
	movq	%rbp, %rdi
	movl	$32, %esi
	movq	$0, (%rax)
	movq	%rax, %r14
	leaq	1(%r9), %rax
	movq	%r9, 8(%rsp)
	movq	%rax, 72(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movq	8(%rsp), %r9
	movl	$98, %r8d
	movq	%rax, 8(%r14)
	movq	%rax, %rdi
	cmpq	$-1, %r9
	je	.L449
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
.L430:
	cmpq	$0, 8(%r12)
	movq	$0, 16(%r14)
	movl	$24, %edi
	je	.L431
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	movb	$0, 20(%rax)
	movq	%rax, 8(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	8(%rsp), %rdx
	movq	%rax, %rsi
	movq	$0, 8(%rax)
	movq	%rdx, (%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, (%rax)
	movq	%rax, 8(%rsp)
	call	*create_list@GOTPCREL(%rip)
	movq	8(%rsp), %rdx
	movq	%rax, 8(%rdx)
	movq	8(%rbx), %rax
	movq	%rdx, %rsi
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	8(%rsp), %rdx
	movq	8(%r12), %rdi
	movq	%rbx, %rsi
	movq	%rdx, 16(%rbx)
	call	codegen_expression
	movl	$24, %edi
	movq	%rax, 24(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$24, %edi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r14, (%rax)
	movb	$0, 20(%rax)
	movq	%rax, 16(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r15, (%rax)
	movb	$0, 20(%rax)
	movq	%rax, 8(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	24(%rsp), %r8
	movq	8(%rsp), %rcx
	movq	16(%rsp), %rdx
	movl	$19, 24(%rax)
	movq	%rax, %rsi
	movq	%rcx, 8(%rax)
	movq	%r8, (%rax)
	movq	%rdx, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L432:
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r15, (%rax)
	movq	%rax, 8(%rsp)
	call	*create_list@GOTPCREL(%rip)
	movq	8(%rsp), %rdx
	movq	%rax, 8(%rdx)
	movq	8(%rbx), %rax
	movq	%rdx, %rsi
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	8(%rsp), %rdx
	movl	$24, %edi
	movq	%rdx, 16(%rbx)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	72(%rbx), %r9
	movq	%rbp, %rdi
	movl	$32, %esi
	movq	$0, (%rax)
	movq	%rax, 8(%rsp)
	leaq	1(%r9), %rax
	movq	%r9, 16(%rsp)
	movq	%rax, 72(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movq	16(%rsp), %r9
	movl	$98, %r8d
	movq	%rax, %rdi
	movq	8(%rsp), %rax
	movq	%rdi, 8(%rax)
	cmpq	$-1, %r9
	je	.L450
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
.L434:
	movq	8(%rsp), %rbp
	cmpq	$0, 16(%r12)
	movl	$24, %edi
	movq	$0, 16(%rbp)
	je	.L435
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	32(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	call	*list_append@GOTPCREL(%rip)
.L436:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	24(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r14, (%rax)
	call	*list_append@GOTPCREL(%rip)
	movq	24(%r12), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L438
	.p2align 4,,10
	.p2align 3
.L439:
	movq	%rbx, %rsi
	call	codegen_statement
.L438:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L439
	movq	32(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	24(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	cmpq	$0, 16(%r12)
	je	.L440
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rbp
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	8(%rsp), %rax
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
	movq	8(%rsp), %rax
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
	call	codegen_expression
.L440:
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
	je	.L451
.L441:
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
.L435:
	cmpq	$0, 8(%r12)
	je	.L437
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	32(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	call	*list_append@GOTPCREL(%rip)
	jmp	.L436
	.p2align 4,,10
	.p2align 3
.L450:
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L434
	.p2align 4,,10
	.p2align 3
.L449:
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L430
	.p2align 4,,10
	.p2align 3
.L448:
	movl	$98, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L428
	.p2align 4,,10
	.p2align 3
.L447:
	movl	$98, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L426
	.p2align 4,,10
	.p2align 3
.L431:
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r15, (%rax)
	movq	%rax, 8(%rsp)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	8(%rsp), %rdx
	movq	$0, 8(%rax)
	movq	%rax, %rsi
	movq	%rdx, (%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L432
	.p2align 4,,10
	.p2align 3
.L446:
	movl	$118, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L424
	.p2align 4,,10
	.p2align 3
.L451:
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
	jmp	.L441
	.p2align 4,,10
	.p2align 3
.L437:
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	32(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r15, (%rax)
	call	*list_append@GOTPCREL(%rip)
	jmp	.L436
	.size	codegen_for, .-codegen_for
	.p2align 4
	.globl	codegen_while
	.type	codegen_while, @function
codegen_while:
	pushq	%r15
	leaq	.LC1(%rip), %r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rdi, %rbp
	movl	$24, %edi
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$24, %rsp
	call	*alloc_memory@GOTPCREL(%rip)
	movq	72(%rbx), %r13
	movq	%r15, %rdi
	movl	$32, %esi
	movq	$0, (%rax)
	movq	%rax, %r12
	leaq	1(%r13), %rax
	movq	%rax, 72(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%r12)
	movq	%rax, %rdi
	cmpq	$-1, %r13
	je	.L462
	movq	%r13, %r9
	movl	$98, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L454:
	movq	$0, 16(%r12)
	movl	$24, %edi
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
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	72(%rbx), %r13
	movq	%r15, %rdi
	movl	$32, %esi
	movq	$0, (%rax)
	movq	%rax, %r14
	leaq	1(%r13), %rax
	movq	%rax, 72(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%r14)
	movq	%rax, %rdi
	cmpq	$-1, %r13
	je	.L463
	movq	%r13, %r9
	movl	$98, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L456:
	movl	$24, %edi
	movq	$0, 16(%r14)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	72(%rbx), %r9
	movq	%r15, %rdi
	movl	$32, %esi
	movq	$0, (%rax)
	movq	%rax, %r13
	leaq	1(%r9), %rax
	movq	%r9, (%rsp)
	movq	%rax, 72(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movq	(%rsp), %r9
	movl	$98, %r8d
	movq	%rax, 8(%r13)
	movq	%rax, %rdi
	cmpq	$-1, %r9
	je	.L464
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
.L458:
	movq	$0, 16(%r13)
	movq	0(%rbp), %rdi
	movq	%rbx, %rsi
	call	codegen_expression
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
	movq	32(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r12, (%rax)
	call	*list_append@GOTPCREL(%rip)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	24(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	call	*list_append@GOTPCREL(%rip)
	movq	8(%rbp), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L459
	.p2align 4,,10
	.p2align 3
.L460:
	movq	%rbx, %rsi
	call	codegen_statement
.L459:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L460
	movq	32(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	24(%rbx), %rdi
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
.L462:
	movl	$98, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L454
	.p2align 4,,10
	.p2align 3
.L464:
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L458
	.p2align 4,,10
	.p2align 3
.L463:
	movl	$98, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L456
	.size	codegen_while, .-codegen_while
	.p2align 4
	.globl	codegen_function
	.type	codegen_function, @function
codegen_function:
	pushq	%r15
	movq	%rdi, %r15
	pushq	%r14
	pushq	%r13
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
	movq	16(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%r15, (%rsp)
	movq	%rax, %r13
	jmp	.L466
	.p2align 4,,10
	.p2align 3
.L467:
	movq	%r15, %r9
	movl	$112, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L468:
	movq	%r14, 16(%r12)
	movq	16(%rbp), %rdi
	movq	%r12, %rsi
	call	*list_append@GOTPCREL(%rip)
.L466:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L475
	movq	8(%rax), %r15
	movl	$24, %edi
	movq	(%rax), %r14
	call	*alloc_memory@GOTPCREL(%rip)
	leaq	.LC1(%rip), %rdi
	movl	$32, %esi
	movq	%r15, (%rax)
	movq	48(%rbx), %r15
	movq	%rax, %r12
	leaq	1(%r15), %rax
	movq	%rax, 48(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%r12)
	movq	%rax, %rdi
	cmpq	$-1, %r15
	jne	.L467
	movl	$112, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L468
	.p2align 4,,10
	.p2align 3
.L475:
	movl	$24, %edi
	movq	(%rsp), %r15
	call	*alloc_memory@GOTPCREL(%rip)
	movq	72(%rbx), %r12
	movl	$32, %esi
	leaq	.LC1(%rip), %rdi
	movq	$0, (%rax)
	movq	%rax, %r13
	leaq	1(%r12), %rax
	movq	%rax, 72(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%r13)
	movq	%rax, %rdi
	cmpq	$-1, %r12
	je	.L476
	movq	%r12, %r9
	movl	$98, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L471:
	movl	$16, %edi
	movq	$0, 16(%r13)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	%r13, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	32(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rax, 8(%r12)
	call	*list_append@GOTPCREL(%rip)
	movq	%r12, 16(%rbx)
	movq	24(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L472
	.p2align 4,,10
	.p2align 3
.L473:
	movq	%rbx, %rsi
	call	codegen_statement
.L472:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L473
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
.L476:
	movl	$98, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L471
	.size	codegen_function, .-codegen_function
	.p2align 4
	.globl	codegen_method
	.type	codegen_method, @function
codegen_method:
	pushq	%r15
	movq	%rdi, %r15
	pushq	%r14
	pushq	%r13
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
	movq	16(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%r15, (%rsp)
	movq	%rax, %r13
	jmp	.L478
	.p2align 4,,10
	.p2align 3
.L479:
	movq	%r15, %r9
	movl	$112, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L480:
	movq	%r14, 16(%r12)
	movq	16(%rbp), %rdi
	movq	%r12, %rsi
	call	*list_append@GOTPCREL(%rip)
.L478:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L487
	movq	8(%rax), %r15
	movl	$24, %edi
	movq	(%rax), %r14
	call	*alloc_memory@GOTPCREL(%rip)
	leaq	.LC1(%rip), %rdi
	movl	$32, %esi
	movq	%r15, (%rax)
	movq	48(%rbx), %r15
	movq	%rax, %r12
	leaq	1(%r15), %rax
	movq	%rax, 48(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%r12)
	movq	%rax, %rdi
	cmpq	$-1, %r15
	jne	.L479
	movl	$112, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L480
	.p2align 4,,10
	.p2align 3
.L487:
	movl	$24, %edi
	movq	(%rsp), %r15
	call	*alloc_memory@GOTPCREL(%rip)
	movq	72(%rbx), %r12
	movl	$32, %esi
	leaq	.LC1(%rip), %rdi
	movq	$0, (%rax)
	movq	%rax, %r13
	leaq	1(%r12), %rax
	movq	%rax, 72(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%r13)
	movq	%rax, %rdi
	cmpq	$-1, %r12
	je	.L488
	movq	%r12, %r9
	movl	$98, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L483:
	movl	$16, %edi
	movq	$0, 16(%r13)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	%r13, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	32(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rax, 8(%r12)
	call	*list_append@GOTPCREL(%rip)
	movq	%r12, 16(%rbx)
	movq	24(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L484
	.p2align 4,,10
	.p2align 3
.L485:
	movq	%rbx, %rsi
	call	codegen_statement
.L484:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L485
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
.L488:
	movl	$98, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L483
	.size	codegen_method, .-codegen_method
	.section	.rodata.str1.8
	.align 8
.LC31:
	.string	"[warning] Unsupported class member type for codegen_class: %d\n"
	.text
	.p2align 4
	.globl	codegen_class
	.type	codegen_class, @function
codegen_class:
	pushq	%r14
	pushq	%r13
	movq	%rdi, %r13
	pushq	%r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movq	8(%rdi), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movl	$24, %edi
	movq	0(%r13), %r14
	movq	%rax, %rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r12
	call	*create_list@GOTPCREL(%rip)
	movq	%r14, %xmm1
	movq	%r12, %rsi
	movq	%rax, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, (%r12)
	movq	24(%r13), %rax
	movq	%rax, 16(%r12)
	movq	0(%rbp), %rax
	leaq	.LC31(%rip), %r12
	movq	(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L490:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L498
.L495:
	movl	8(%rax), %ecx
	testl	%ecx, %ecx
	je	.L491
	cmpl	$1, %ecx
	je	.L492
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	movq	%r12, %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L495
.L498:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L492:
	movq	(%rax), %rdi
	movl	$97, %edx
	movq	%rbp, %rsi
	call	codegen_variable
	jmp	.L490
	.p2align 4,,10
	.p2align 3
.L491:
	movq	(%rax), %rdi
	movq	%rbp, %rsi
	call	codegen_method
	jmp	.L490
	.size	codegen_class, .-codegen_class
	.section	.rodata.str1.1
.LC32:
	.string	"main"
	.text
	.p2align 4
	.globl	codegen_code
	.type	codegen_code, @function
codegen_code:
	pushq	%r14
	leaq	.LC32(%rip), %r14
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
	movl	$88, %edi
	movq	%rax, 24(%r13)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%r13, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 24(%rbp)
	call	*create_list@GOTPCREL(%rip)
	pxor	%xmm0, %xmm0
	movq	(%rbx), %rdi
	movq	%rax, 32(%rbp)
	movups	%xmm0, 40(%rbp)
	movups	%xmm0, 56(%rbp)
	movups	%xmm0, 72(%rbp)
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L500:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L508
	movl	8(%rbx), %eax
	cmpl	$1, %eax
	je	.L509
	cmpl	$2, %eax
	je	.L510
	testl	%eax, %eax
	jne	.L500
	movq	(%rbx), %rdi
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	codegen_import
	jmp	.L500
	.p2align 4,,10
	.p2align 3
.L509:
	movq	(%rbx), %rdi
	movq	%rbp, %rsi
	call	codegen_function
	movq	(%rbx), %rax
	movq	%r14, %rsi
	movq	(%rax), %rbx
	movq	8(%rbx), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L500
	movq	%rbx, 8(%r13)
	jmp	.L500
	.p2align 4,,10
	.p2align 3
.L510:
	movq	(%rbx), %rdi
	movq	%rbp, %rsi
	call	codegen_class
	jmp	.L500
	.p2align 4,,10
	.p2align 3
.L508:
	popq	%rbx
	movq	%r13, %rax
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	codegen_code, .-codegen_code
	.section	.rodata
	.align 32
	.type	CSWTCH.51, @object
	.size	CSWTCH.51, 76
CSWTCH.51:
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
.LC23:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
