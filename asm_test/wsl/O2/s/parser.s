	.file	"codegen.c"
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
	pushq	%r14
	movq	%rdi, %r14
	movl	$24, %edi
	pushq	%r13
	movq	%rcx, %r13
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	movl	%edx, %ebp
	pushq	%rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, (%rax)
	movq	%rax, %rbx
	leal	-97(%rbp), %eax
	cmpl	$21, %eax
	ja	.L2
	leaq	.L4(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L4:
	.long	.L9-.L4
	.long	.L8-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L7-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L6-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L5-.L4
	.long	.L2-.L4
	.long	.L3-.L4
	.text
	.p2align 4,,10
	.p2align 3
.L2:
	leaq	.LC0(%rip), %rdi
	movl	$32, %esi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%rbx)
	movq	%rax, %rdi
.L10:
	movl	%ebp, %r8d
	leaq	.LC1(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	%r12, 16(%rbx)
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	movq	40(%r13), %r14
	leaq	1(%r14), %rax
	movq	%rax, 40(%r13)
	.p2align 4,,10
	.p2align 3
.L11:
	leaq	.LC0(%rip), %rdi
	movl	$32, %esi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%rbx)
	movq	%rax, %rdi
	cmpq	$-1, %r14
	je	.L10
	movq	%r14, %r9
	movl	%ebp, %r8d
	leaq	.LC2(%rip), %rcx
	xorl	%eax, %eax
	movq	$-1, %rdx
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	%r12, 16(%rbx)
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L8:
	movq	72(%r13), %r14
	leaq	1(%r14), %rax
	movq	%rax, 72(%r13)
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L7:
	movq	80(%r13), %r14
	leaq	1(%r14), %rax
	movq	%rax, 80(%r13)
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L6:
	movq	48(%r13), %r14
	leaq	1(%r14), %rax
	movq	%rax, 48(%r13)
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L5:
	movq	64(%r13), %r14
	leaq	1(%r14), %rax
	movq	%rax, 64(%r13)
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L3:
	movq	56(%r13), %r14
	leaq	1(%r14), %rax
	movq	%rax, 56(%r13)
	jmp	.L11
	.size	create_var, .-create_var
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"[warning] Unsupported type for size lookup: %s\n"
	.text
	.p2align 4
	.type	get_type_size, @function
get_type_size:
	testq	%rdi, %rdi
	je	.L20
	cmpq	%rdi, name_int(%rip)
	je	.L24
	cmpq	%rdi, name_float(%rip)
	je	.L24
	cmpq	%rdi, name_string(%rip)
	je	.L24
	cmpq	%rdi, name_bool(%rip)
	je	.L22
	cmpq	%rdi, name_void(%rip)
	je	.L22
	movl	32(%rdi), %eax
	testl	%eax, %eax
	jne	.L19
	movq	24(%rdi), %rax
	movq	24(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L22:
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L20:
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L19:
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
	.p2align 4,,10
	.p2align 3
.L24:
	movl	$8, %eax
	ret
	.size	get_type_size, .-get_type_size
	.p2align 4
	.type	emit_param_instruction, @function
emit_param_instruction:
	testq	%rdi, %rdi
	je	.L30
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	subq	$8, %rsp
	testq	%rsi, %rsi
	je	.L27
	movq	%rdi, %rbx
	movq	8(%rdi), %rdi
	call	get_type_size
	movl	$24, %edi
	movq	%rax, %r13
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%r13, (%rax)
	movq	%rax, %r12
	movl	$1, 16(%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%r12)
	movq	%rax, 8(%r12)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, 8(%rax)
	movq	%rax, %rsi
	movl	$17, 24(%rax)
	movq	%r12, (%rax)
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
.L27:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L30:
	ret
	.size	emit_param_instruction, .-emit_param_instruction
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
	je	.L34
	cmpb	$0, 20(%rdi)
	jne	.L39
.L34:
	addq	$8, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L39:
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
	subq	$8, %rsp
	testq	%rdi, %rdi
	je	.L61
	movq	%rsi, %rbx
	testq	%rsi, %rsi
	je	.L61
	movq	%rdx, %rsi
	movq	%rdx, %r13
	call	load_rvalue
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L43
	movq	8(%rax), %rbp
	testq	%rbp, %rbp
	je	.L46
	movl	32(%rbp), %eax
	testl	%eax, %eax
	jne	.L67
.L46:
	movq	0(%r13), %rax
	movq	(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L47
	.p2align 4,,10
	.p2align 3
.L49:
	cmpq	%rbp, 8(%rax)
	je	.L48
.L47:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L49
.L50:
	movq	(%rbx), %rsi
	movq	%r13, %rcx
	movl	$97, %edx
	movq	%rbx, %rdi
	call	create_var
	movq	%rax, %r15
.L52:
	movq	(%rbx), %rsi
	movq	%r13, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	call	create_var
	movl	$24, %edi
	movq	%rax, %rbp
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, %xmm0
	movl	$24, %edi
	movhps	16(%rbp), %xmm0
	movq	%rax, %rbx
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r15, %xmm0
	movl	$32, %edi
	movhps	16(%r15), %xmm0
	movq	%rax, %rbp
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, 8(%rax)
	movq	%rax, %rsi
	movl	$15, 24(%rax)
	movq	%rbx, (%rax)
	movq	%rbp, 16(%rax)
	movq	16(%r13), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movb	$1, 20(%rbx)
.L40:
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
.L48:
	movq	(%rax), %rdi
	testq	%rdi, %rdi
	je	.L50
	call	*list_copy@GOTPCREL(%rip)
	xorl	%r12d, %r12d
	movq	%rax, %r15
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L55:
	cmpq	(%rax), %rbx
	je	.L54
	addq	$1, %r12
.L53:
	movq	%r15, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L55
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %esi
	leaq	.LC0(%rip), %rdi
	movq	%rbx, (%rax)
	movq	%rax, %r15
	movq	(%rbx), %rax
	movq	%rax, 16(%r15)
	call	*create_string@GOTPCREL(%rip)
	leaq	.LC4(%rip), %r8
	movq	%rax, 8(%r15)
	testq	%rbp, %rbp
	je	.L59
	movq	8(%rbp), %r8
.L59:
	movq	stderr(%rip), %rdi
	movq	8(%rbx), %rcx
	movq	%r12, %r9
	xorl	%eax, %eax
	leaq	.LC6(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	8(%r15), %rdi
.L57:
	movq	%r12, %r8
	leaq	.LC7(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L67:
	xorl	%ebp, %ebp
	jmp	.L46
	.p2align 4,,10
	.p2align 3
.L54:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	leaq	.LC0(%rip), %rdi
	movl	$32, %esi
	movq	%rbx, (%rax)
	movq	%rax, %r15
	movq	(%rbx), %rax
	movq	%rax, 16(%r15)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%r15)
	movq	%rax, %rdi
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L61:
	movq	stderr(%rip), %rcx
	movl	$35, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L43:
	xorl	%ebx, %ebx
	jmp	.L40
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
	pushq	%r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movq	(%rdi), %rbx
	movl	32(%rbx), %ecx
	cmpl	$3, %ecx
	je	.L74
	leal	-1(%rcx), %eax
	cmpl	$1, %eax
	jbe	.L75
	testl	%ecx, %ecx
	jne	.L71
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
.L71:
	popq	%rbx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbp
	leaq	.LC8(%rip), %rdx
	popq	%r12
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L75:
	movq	(%rbx), %rsi
	movq	%rdx, %rcx
	movl	$102, %edx
.L73:
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
.L74:
	movq	%rdx, %rcx
	movq	(%rbx), %rsi
	movl	$118, %edx
	jmp	.L73
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
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	movq	%rdi, %rbp
	movq	%r12, %rcx
	pushq	%rbx
	movl	%edx, %ebx
	subq	$32, %rsp
	movq	(%rdi), %rsi
	movq	8(%rdi), %rdi
	call	create_var
	movq	%rax, %rsi
	leal	-97(%rbx), %eax
	cmpl	$21, %eax
	ja	.L77
	leaq	.L79(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L79:
	.long	.L83-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L82-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L81-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L78-.L79
	.long	.L77-.L79
	.long	.L78-.L79
	.text
	.p2align 4,,10
	.p2align 3
.L78:
	movq	8(%r12), %rax
	movq	24(%rax), %rdi
.L86:
	addq	$32, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L77:
	movq	stderr(%rip), %rdi
	addq	$32, %rsp
	movl	%ebx, %ecx
	xorl	%eax, %eax
	popq	%rbx
	leaq	.LC10(%rip), %rdx
	popq	%rbp
	movl	$2, %esi
	popq	%r12
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L83:
	movq	(%r12), %rax
	movq	(%rax), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	(%r12), %rax
	movq	%rbx, %rsi
	movq	(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movdqu	0(%rbp), %xmm0
	movl	$24, %edi
	movdqa	%xmm0, %xmm1
	movaps	%xmm0, 16(%rsp)
	shufpd	$1, %xmm0, %xmm1
	movaps	%xmm1, (%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm1
	movdqa	16(%rsp), %xmm0
	movq	%rax, %rbp
	movups	%xmm1, (%rax)
	movq	16(%rbx), %rax
	movq	%xmm0, %rdi
	movq	%rax, 16(%rbp)
	call	get_type_size
	movq	(%rbx), %rdi
	addq	%rax, 16(%rbx)
	movq	%rbp, %rsi
	testq	%rdi, %rdi
	jne	.L86
	movq	stderr(%rip), %rcx
	addq	$32, %rsp
	movl	$63, %edx
	movl	$1, %esi
	popq	%rbx
	leaq	.LC9(%rip), %rdi
	popq	%rbp
	popq	%r12
	jmp	*fwrite@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L82:
	movq	(%r12), %rax
	movq	16(%rax), %rdi
	addq	$32, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L81:
	movq	8(%r12), %rax
	movq	16(%rax), %rdi
	addq	$32, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	*list_append@GOTPCREL(%rip)
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
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	testq	%rdi, %rdi
	je	.L145
	movq	%rsi, %rbp
	testq	%rsi, %rsi
	je	.L145
	movl	16(%rdi), %ecx
	movq	%rdi, %rbx
	testl	%ecx, %ecx
	jne	.L91
	movq	8(%rdi), %r13
	testq	%r13, %r13
	je	.L224
	movq	8(%rsi), %rdx
	testq	%rdx, %rdx
	je	.L225
	movq	16(%rdx), %rcx
	testq	%rcx, %rcx
	je	.L98
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L98
	.p2align 4,,10
	.p2align 3
.L101:
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	je	.L99
	cmpq	(%rbx), %r13
	je	.L221
.L99:
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L101
.L98:
	movq	24(%rdx), %rax
	testq	%rax, %rax
	je	.L105
	.p2align 4,,10
	.p2align 3
.L102:
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L105
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	je	.L102
	cmpq	(%rbx), %r13
	jne	.L102
	.p2align 4,,10
	.p2align 3
.L221:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, %xmm0
	movhps	16(%rbx), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r14
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
.L87:
	popq	%rbx
	movq	%r14, %rax
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L91:
	cmpl	$2, %ecx
	je	.L226
	cmpl	$3, %ecx
	je	.L227
	cmpl	$1, %ecx
	jne	.L128
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L228
	cmpl	$2, 16(%rdi)
	jne	.L130
	movq	8(%rdi), %r13
	testq	%r13, %r13
	je	.L130
	movl	32(%r13), %eax
	subl	$1, %eax
	cmpl	$1, %eax
	ja	.L130
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L144
	movl	16(%rdi), %edx
	testl	%edx, %edx
	jne	.L132
	movq	8(%rdi), %rax
	testq	%rax, %rax
	je	.L132
	movl	32(%rax), %eax
	testl	%eax, %eax
	je	.L144
.L132:
	movq	%rbp, %rsi
	call	codegen_variable_access
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L144
	movq	%rbp, %rsi
	movl	$1, %r12d
	call	emit_param_instruction
.L134:
	movq	8(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L138
	.p2align 4,,10
	.p2align 3
.L140:
	movq	%rbp, %rsi
	call	codegen_expression
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L229
	movq	%rbp, %rsi
	addq	$1, %r12
	call	emit_param_instruction
.L138:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L140
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r14
	movl	$5, 16(%rax)
	movq	$0, (%rax)
	movq	name_void(%rip), %rax
	movb	$0, 20(%r14)
	movq	0(%r13), %rsi
	movq	%rax, 8(%r14)
	testq	%rsi, %rsi
	je	.L141
	cmpq	%rax, %rsi
	je	.L141
	movq	%rbp, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	call	create_var
	movl	$24, %edi
	movq	%rax, %rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, %xmm0
	movhps	16(%rbx), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r14
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	movq	0(%r13), %rsi
.L141:
	movq	%rbp, %rcx
	movl	$102, %edx
	movq	%r13, %rdi
	call	create_var
	movl	$24, %edi
	movq	%rax, %rbx
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
	movq	%r14, (%rax)
	movq	%rbx, 16(%rax)
	movl	$22, 24(%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L87
	.p2align 4,,10
	.p2align 3
.L227:
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L123
	cmpq	$0, 8(%rbx)
	je	.L123
	call	codegen_variable_access
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	8(%rbx), %rdi
	movq	%rbp, %rsi
	movq	%rax, %r12
	call	codegen_expression
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	%rax, %r13
	testq	%r12, %r12
	je	.L146
	testq	%rax, %rax
	je	.L146
	movq	8(%r12), %rsi
	cmpq	name_float(%rip), %rsi
	movq	name_int(%rip), %rax
	je	.L127
	cmpq	name_bool(%rip), %rsi
	je	.L127
	cmpq	name_string(%rip), %rsi
	cmovne	%rax, %rsi
.L127:
	movq	%rbp, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	call	create_var
	movl	$24, %edi
	movq	%rax, %rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, %xmm0
	movl	$32, %edi
	movhps	16(%rbx), %xmm0
	movq	%rax, %r14
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r12, 8(%rax)
	movq	%rax, %rsi
	movl	$16, 24(%rax)
	movq	%r14, (%rax)
	movq	%r13, 16(%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movb	$1, 20(%r14)
	jmp	.L87
	.p2align 4,,10
	.p2align 3
.L130:
	movq	%rbp, %rsi
	call	codegen_variable_access
	testq	%rax, %rax
	je	.L230
	movl	16(%rax), %edx
	cmpl	$7, %edx
	je	.L231
	testl	%edx, %edx
	jne	.L137
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L137
	movq	(%rax), %r13
	testq	%r13, %r13
	je	.L137
	movl	32(%r13), %eax
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L144
	.p2align 4,,10
	.p2align 3
.L137:
	movq	stderr(%rip), %rcx
	movl	$46, %edx
	movl	$1, %esi
	leaq	.LC20(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L90
	.p2align 4,,10
	.p2align 3
.L226:
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L118
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L118
	movl	32(%rbx), %eax
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L232
	call	codegen_variable_access
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L233
.L223:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	emit_attribute_access
	.p2align 4,,10
	.p2align 3
.L225:
	movq	(%rsi), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L215
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L215
	.p2align 4,,10
	.p2align 3
.L111:
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	je	.L110
	cmpq	(%rbx), %r13
	je	.L221
.L110:
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L111
	cmpl	$2, 32(%r13)
	jbe	.L96
	testq	%rdx, %rdx
	je	.L97
	movq	16(%rdx), %rcx
.L104:
	movq	(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L97
	.p2align 4,,10
	.p2align 3
.L114:
	movq	8(%rbx), %r12
	testq	%r12, %r12
	je	.L115
	movq	(%r12), %rax
	testq	%rax, %rax
	je	.L115
	movq	8(%rax), %rdi
	movq	SELF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L234
.L115:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L114
.L97:
	movq	8(%r13), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC13(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	0(%r13), %rsi
	movq	%rbp, %rcx
	movq	%r13, %rdi
	movl	$118, %edx
	call	create_var
	movq	%rax, %rbx
	jmp	.L221
	.p2align 4,,10
	.p2align 3
.L234:
	movq	16(%r12), %rax
	testq	%rax, %rax
	je	.L97
	movl	32(%rax), %ecx
	testl	%ecx, %ecx
	jne	.L97
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	cmpq	%rax, 24(%r13)
	jne	.L97
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
	jmp	.L223
	.p2align 4,,10
	.p2align 3
.L145:
	movq	stderr(%rip), %rcx
	movl	$40, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L90:
	xorl	%r14d, %r14d
	jmp	.L87
	.p2align 4,,10
	.p2align 3
.L215:
	cmpl	$2, 32(%r13)
	ja	.L97
	.p2align 4,,10
	.p2align 3
.L96:
	movq	0(%r13), %rsi
	movq	%rbp, %rcx
	movl	$102, %edx
	movq	%r13, %rdi
.L222:
	call	create_var
	movl	$24, %edi
	movq	%rax, %rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, %xmm0
	movhps	16(%rbx), %xmm0
	movq	%rax, %r14
	movl	$7, 16(%rax)
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	movq	%r14, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L128:
	movq	stderr(%rip), %rdi
	leaq	.LC22(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L90
	.p2align 4,,10
	.p2align 3
.L229:
	movq	stderr(%rip), %rcx
	movl	$52, %edx
	movl	$1, %esi
	leaq	.LC21(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L90
	.p2align 4,,10
	.p2align 3
.L224:
	movq	stderr(%rip), %rcx
	movl	$39, %edx
	movl	$1, %esi
	leaq	.LC12(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L90
	.p2align 4,,10
	.p2align 3
.L232:
	movq	(%rbx), %rsi
	movq	%rbp, %rcx
	movl	$102, %edx
	movq	%rbx, %rdi
	jmp	.L222
	.p2align 4,,10
	.p2align 3
.L231:
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L137
	movq	(%rax), %r13
	testq	%r13, %r13
	je	.L137
.L144:
	xorl	%r12d, %r12d
	jmp	.L134
	.p2align 4,,10
	.p2align 3
.L105:
	movq	0(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L108
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L111
.L108:
	cmpl	$2, 32(%r13)
	ja	.L104
	jmp	.L96
.L123:
	movq	stderr(%rip), %rcx
	movl	$38, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L90
.L118:
	movq	stderr(%rip), %rcx
	movl	$39, %edx
	movl	$1, %esi
	leaq	.LC14(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L90
.L233:
	movq	stderr(%rip), %rcx
	movl	$61, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L90
.L228:
	movq	stderr(%rip), %rcx
	movl	$47, %edx
	movl	$1, %esi
	leaq	.LC18(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L90
.L146:
	movq	stderr(%rip), %rcx
	movl	$68, %edx
	movl	$1, %esi
	leaq	.LC17(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L90
.L230:
	movq	stderr(%rip), %rcx
	movl	$54, %edx
	movl	$1, %esi
	leaq	.LC19(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L90
	.size	codegen_variable_access, .-codegen_variable_access
	.section	.rodata.str1.8
	.align 8
.LC24:
	.string	"[warning] Unsupported type for negation: %s\n"
	.align 8
.LC25:
	.string	"[warning] Unsupported primary type for codegen_primary: %d\n"
	.text
	.p2align 4
	.globl	codegen_primary
	.type	codegen_primary, @function
codegen_primary:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$24, %rsp
	movl	8(%rdi), %ecx
	cmpl	$8, %ecx
	ja	.L236
	leaq	.L238(%rip), %rdx
	movq	%rsi, %rbp
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L238:
	.long	.L246-.L238
	.long	.L245-.L238
	.long	.L244-.L238
	.long	.L243-.L238
	.long	.L242-.L238
	.long	.L241-.L238
	.long	.L240-.L238
	.long	.L239-.L238
	.long	.L237-.L238
	.text
	.p2align 4,,10
	.p2align 3
.L239:
	movq	(%rdi), %rdi
	call	codegen_primary
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
	je	.L253
	cmpq	name_float(%rip), %rax
	je	.L254
	movq	8(%rax), %rcx
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	leaq	.LC24(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
.L255:
	addq	$24, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L237:
	movq	(%rdi), %rdi
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	codegen_variable_access
	.p2align 4,,10
	.p2align 3
.L246:
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
.L235:
	addq	$24, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L245:
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
.L244:
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
.L243:
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
.L242:
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
.L241:
	movq	(%rdi), %rdi
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	codegen_expression
	.p2align 4,,10
	.p2align 3
.L240:
	movq	(%rdi), %rdi
	call	codegen_primary
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
.L236:
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	leaq	.LC25(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L255
	.p2align 4,,10
	.p2align 3
.L254:
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
.L249:
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L235
	.p2align 4,,10
	.p2align 3
.L253:
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
	jmp	.L249
	.size	codegen_primary, .-codegen_primary
	.section	.rodata.str1.8
	.align 8
.LC26:
	.string	"[warning] Left-hand side of assignment is not a variable\n"
	.text
	.p2align 4
	.globl	codegen_expression
	.type	codegen_expression, @function
codegen_expression:
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
	je	.L270
	movq	16(%rdi), %rdi
	call	codegen_expression
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	%rax, %rbp
	movl	24(%r12), %eax
	cmpl	$18, %eax
	ja	.L258
	movq	(%r12), %rdi
	leaq	CSWTCH.51(%rip), %rdx
	movq	%rbx, %rsi
	movl	(%rdx,%rax,4), %r13d
	call	codegen_expression
	movq	%rax, %r14
	movl	24(%r12), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L259
	cmpl	$14, %r13d
	jne	.L263
	movl	16(%r14), %eax
	testl	%eax, %eax
	jne	.L271
.L261:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$14, 24(%rax)
	movq	%rax, %rsi
	movq	%r14, (%rax)
	movq	%rbp, 8(%rax)
	movq	$0, 16(%rax)
	cmpb	$0, 20(%r14)
	jne	.L272
.L262:
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
.L258:
	movq	(%r12), %rdi
	movq	%rbx, %rsi
	movl	$25, %r13d
	call	codegen_expression
	movq	%rax, %r14
	movl	24(%r12), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L259
.L263:
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
	je	.L261
.L271:
	movq	stderr(%rip), %rcx
	movl	$57, %edx
	movl	$1, %esi
	leaq	.LC26(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L261
	.p2align 4,,10
	.p2align 3
.L259:
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
	jmp	.L262
	.p2align 4,,10
	.p2align 3
.L270:
	movq	8(%rdi), %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	codegen_primary
	.p2align 4,,10
	.p2align 3
.L272:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$24, 24(%rax)
	movq	%rax, %rsi
	movq	%r14, (%rax)
	movq	%rbp, 8(%rax)
	movq	$0, 16(%rax)
	jmp	.L262
	.size	codegen_expression, .-codegen_expression
	.p2align 4
	.globl	codegen_if
	.type	codegen_if, @function
codegen_if:
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
	je	.L276
	movq	24(%r15), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L297
.L276:
	movq	%rbx, %rcx
	movl	$98, %edx
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	create_var
	movq	%rax, 40(%rsp)
.L275:
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
	call	codegen_expression
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
	jmp	.L277
	.p2align 4,,10
	.p2align 3
.L278:
	movq	%rbx, %rsi
	call	codegen_statement
.L277:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L278
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
	je	.L298
.L279:
	movq	24(%r15), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L299
.L286:
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
.L297:
	movq	%rbp, 40(%rsp)
	jmp	.L275
	.p2align 4,,10
	.p2align 3
.L299:
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
	jmp	.L287
	.p2align 4,,10
	.p2align 3
.L288:
	movq	%rbx, %rsi
	call	codegen_statement
.L287:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L288
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
	jmp	.L286
	.p2align 4,,10
	.p2align 3
.L298:
	movq	16(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L280:
	movq	16(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L279
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
	call	codegen_expression
	movq	16(%rsp), %rdi
	movq	%rax, 24(%rsp)
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L300
.L282:
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
	jmp	.L283
	.p2align 4,,10
	.p2align 3
.L284:
	movq	%rbx, %rsi
	call	codegen_statement
.L283:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L284
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
	jmp	.L280
	.p2align 4,,10
	.p2align 3
.L300:
	movq	24(%r15), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	cmovne	40(%rsp), %rbp
	jmp	.L282
	.size	codegen_if, .-codegen_if
	.section	.rodata.str1.8
	.align 8
.LC27:
	.string	"[warning] 'break' statement used outside of loop\n"
	.align 8
.LC28:
	.string	"[warning] 'continue' statement used outside of loop\n"
	.align 8
.LC29:
	.string	"[warning] Unsupported statement type for codegen_statement: %d\n"
	.text
	.p2align 4
	.globl	codegen_statement
	.type	codegen_statement, @function
codegen_statement:
	movl	8(%rdi), %ecx
	cmpl	$7, %ecx
	ja	.L302
	pushq	%rbp
	leaq	.L304(%rip), %rdx
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$8, %rsp
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L304:
	.long	.L311-.L304
	.long	.L310-.L304
	.long	.L309-.L304
	.long	.L308-.L304
	.long	.L307-.L304
	.long	.L306-.L304
	.long	.L305-.L304
	.long	.L303-.L304
	.text
	.p2align 4,,10
	.p2align 3
.L305:
	movq	24(%rsi), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L312
	movq	24(%rbx), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbp
	testq	%rbp, %rbp
	je	.L312
.L324:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$20, 24(%rax)
	movq	%rax, %rsi
	jmp	.L323
	.p2align 4,,10
	.p2align 3
.L303:
	movq	32(%rsi), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L313
	movq	32(%rbx), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbp
	testq	%rbp, %rbp
	jne	.L324
.L313:
	movq	stderr(%rip), %rcx
	addq	$8, %rsp
	movl	$52, %edx
	movl	$1, %esi
	popq	%rbx
	leaq	.LC28(%rip), %rdi
	popq	%rbp
	jmp	*fwrite@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L309:
	movq	(%rdi), %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	jmp	codegen_if
	.p2align 4,,10
	.p2align 3
.L311:
	movq	(%rdi), %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	jmp	codegen_expression
	.p2align 4,,10
	.p2align 3
.L310:
	movq	(%rdi), %rax
	movq	%rbx, %rcx
	movl	$118, %edx
	movq	(%rax), %rsi
	movq	8(%rax), %rdi
	call	create_var
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	24(%rax), %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	jmp	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L307:
	movq	(%rdi), %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	jmp	codegen_for
	.p2align 4,,10
	.p2align 3
.L306:
	movq	(%rdi), %rdi
	call	codegen_expression
	movl	$32, %edi
	movq	%rax, %rbp
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$21, 24(%rax)
	movq	%rax, %rsi
.L323:
	movq	16(%rbx), %rax
	movq	%rbp, (%rsi)
	movq	$0, 8(%rsi)
	movq	$0, 16(%rsi)
	movq	8(%rax), %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	jmp	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L308:
	movq	(%rdi), %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	jmp	codegen_while
	.p2align 4,,10
	.p2align 3
.L312:
	movq	stderr(%rip), %rcx
	addq	$8, %rsp
	movl	$49, %edx
	movl	$1, %esi
	popq	%rbx
	leaq	.LC27(%rip), %rdi
	popq	%rbp
	jmp	*fwrite@GOTPCREL(%rip)
.L302:
	movq	stderr(%rip), %rdi
	leaq	.LC29(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	jmp	*__fprintf_chk@GOTPCREL(%rip)
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
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$24, %rsp
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L326
	movq	(%rax), %rsi
	movq	8(%rax), %rdi
	movq	%rbx, %rcx
	movl	$118, %edx
	call	create_var
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	24(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L326:
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
	je	.L327
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
	call	codegen_expression
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
.L328:
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
	je	.L329
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	32(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	call	*list_append@GOTPCREL(%rip)
.L330:
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
	jmp	.L332
	.p2align 4,,10
	.p2align 3
.L333:
	movq	%rbx, %rsi
	call	codegen_statement
.L332:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L333
	movq	32(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	24(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	cmpq	$0, 16(%r12)
	je	.L334
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
	call	codegen_expression
.L334:
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
	je	.L340
.L335:
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
.L329:
	cmpq	$0, 8(%r12)
	je	.L331
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	32(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	call	*list_append@GOTPCREL(%rip)
	jmp	.L330
	.p2align 4,,10
	.p2align 3
.L327:
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
	jmp	.L328
	.p2align 4,,10
	.p2align 3
.L340:
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
	jmp	.L335
	.p2align 4,,10
	.p2align 3
.L331:
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	32(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r15, (%rax)
	call	*list_append@GOTPCREL(%rip)
	jmp	.L330
	.size	codegen_for, .-codegen_for
	.p2align 4
	.globl	codegen_while
	.type	codegen_while, @function
codegen_while:
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
	jmp	.L342
	.p2align 4,,10
	.p2align 3
.L343:
	movq	%rbx, %rsi
	call	codegen_statement
.L342:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L343
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
	.size	codegen_while, .-codegen_while
	.p2align 4
	.globl	codegen_function
	.type	codegen_function, @function
codegen_function:
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
	jmp	.L346
	.p2align 4,,10
	.p2align 3
.L347:
	movq	(%rax), %rsi
	movq	8(%rax), %rdi
	movq	%rbx, %rcx
	movl	$112, %edx
	call	create_var
	movq	16(%rbp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
.L346:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L347
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
	jmp	.L348
	.p2align 4,,10
	.p2align 3
.L349:
	movq	%rbx, %rsi
	call	codegen_statement
.L348:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L349
	movq	$0, 8(%rbx)
	addq	$16, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	codegen_function, .-codegen_function
	.p2align 4
	.globl	codegen_method
	.type	codegen_method, @function
codegen_method:
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
	jmp	.L352
	.p2align 4,,10
	.p2align 3
.L353:
	movq	(%rax), %rsi
	movq	8(%rax), %rdi
	movq	%rbx, %rcx
	movl	$112, %edx
	call	create_var
	movq	16(%rbp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
.L352:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L353
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
	jmp	.L354
	.p2align 4,,10
	.p2align 3
.L355:
	movq	%rbx, %rsi
	call	codegen_statement
.L354:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L355
	movq	$0, 8(%rbx)
	addq	$16, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	codegen_method, .-codegen_method
	.section	.rodata.str1.8
	.align 8
.LC30:
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
	leaq	.LC30(%rip), %r12
	movq	(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L358:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L366
.L363:
	movl	8(%rax), %ecx
	testl	%ecx, %ecx
	je	.L359
	cmpl	$1, %ecx
	je	.L360
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	movq	%r12, %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L363
.L366:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L360:
	movq	(%rax), %rdi
	movl	$97, %edx
	movq	%rbp, %rsi
	call	codegen_variable
	jmp	.L358
	.p2align 4,,10
	.p2align 3
.L359:
	movq	(%rax), %rdi
	movq	%rbp, %rsi
	call	codegen_method
	jmp	.L358
	.size	codegen_class, .-codegen_class
	.section	.rodata.str1.1
.LC31:
	.string	"main"
	.text
	.p2align 4
	.globl	codegen_code
	.type	codegen_code, @function
codegen_code:
	pushq	%r14
	leaq	.LC31(%rip), %r14
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
.L368:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L376
	movl	8(%rbx), %eax
	cmpl	$1, %eax
	je	.L377
	cmpl	$2, %eax
	je	.L378
	testl	%eax, %eax
	jne	.L368
	movq	(%rbx), %rdi
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	codegen_import
	jmp	.L368
	.p2align 4,,10
	.p2align 3
.L377:
	movq	(%rbx), %rdi
	movq	%rbp, %rsi
	call	codegen_function
	movq	(%rbx), %rax
	movq	%r14, %rsi
	movq	(%rax), %rbx
	movq	8(%rbx), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L368
	movq	%rbx, 8(%r13)
	jmp	.L368
	.p2align 4,,10
	.p2align 3
.L378:
	movq	(%rbx), %rdi
	movq	%rbp, %rsi
	call	codegen_class
	jmp	.L368
	.p2align 4,,10
	.p2align 3
.L376:
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
