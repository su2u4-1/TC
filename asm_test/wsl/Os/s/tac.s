	.file	"tac.c"
	.text
	.type	create_instruction, @function
create_instruction:
	pushq	%r13
	movl	%edi, %r13d
	movl	$32, %edi
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rbx
	movq	%rcx, %rbx
	pushq	%rax
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%r13d, 24(%rax)
	movq	%r12, (%rax)
	movq	%rbp, 8(%rax)
	movq	%rbx, 16(%rax)
	popq	%rdx
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	create_instruction, .-create_instruction
	.type	create_subroutine, @function
create_subroutine:
	pushq	%r12
	movq	%rdi, %r12
	movl	$40, %edi
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%r12, (%rax)
	movq	%rbp, 8(%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 16(%rbx)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 24(%rbx)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 32(%rbx)
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	create_subroutine, .-create_subroutine
	.type	create_block, @function
create_block:
	pushq	%rbp
	movq	%rdi, %rbp
	movl	$16, %edi
	pushq	%rbx
	pushq	%rax
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%rbp, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 8(%rbx)
	movq	%rbx, %rax
	popq	%rdx
	popq	%rbx
	popq	%rbp
	ret
	.size	create_block, .-create_block
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	""
.LC1:
	.string	"$%d-error"
.LC2:
	.string	"$%c%zu"
	.text
	.type	create_var, @function
create_var:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	movq	%rsi, %r13
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	movl	%edx, %ebp
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$24, %rsp
	testq	%rdi, %rdi
	jne	.L8
.L41:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r12, (%rax)
	movq	%rax, %r15
	cmpl	$112, %ebp
	je	.L9
	ja	.L10
	cmpl	$98, %ebp
	je	.L11
	cmpl	$102, %ebp
	je	.L12
	cmpl	$97, %ebp
	je	.L13
	jmp	.L50
.L10:
	cmpl	$116, %ebp
	je	.L15
	cmpl	$118, %ebp
	je	.L16
.L50:
	orq	$-1, %r9
	jmp	.L14
.L8:
	xorl	%eax, %eax
	cmpl	$0, 32(%rsi)
	movq	%rax, (%rsp)
	jne	.L17
	movq	24(%rcx), %rax
	movq	%rax, (%rsp)
	movq	24(%rsi), %rax
	movq	%rax, 24(%rcx)
.L17:
	movq	8(%rbx), %rax
	testq	%rax, %rax
	jne	.L18
.L21:
	movq	8(%rbx), %rax
	testq	%rax, %rax
	jne	.L19
	jmp	.L20
.L18:
	movq	24(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L21
	movq	8(%rbx), %rax
	movq	24(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r14
.L22:
	movq	%r14, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L21
	cmpq	(%r15), %r12
	jne	.L22
	jmp	.L23
.L19:
	movq	16(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L20
	movq	8(%rbx), %rax
	movq	16(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r14
.L27:
	movq	%r14, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L28
.L20:
	cmpq	$0, 24(%rbx)
	movq	(%rbx), %rax
	jne	.L25
	jmp	.L26
.L28:
	cmpq	(%r15), %r12
	jne	.L27
	jmp	.L23
.L25:
	movq	(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L26
	movq	(%rbx), %rax
	movq	(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
.L32:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L36
.L26:
	movq	(%rbx), %rax
	movq	16(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L29
	jmp	.L30
.L36:
	movq	24(%rbx), %rax
	movq	(%rax), %rax
	cmpq	%rax, 8(%r14)
	jne	.L32
	movq	(%r14), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L32
	movq	(%r14), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r14
.L34:
	movq	%r14, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L32
	movq	(%rax), %r15
	cmpq	(%r15), %r12
	jne	.L34
	jmp	.L23
.L29:
	movq	(%rbx), %rax
	movq	16(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r14
.L37:
	movq	%r14, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L38
.L30:
	xorl	%r15d, %r15d
	jmp	.L23
.L38:
	cmpq	(%r15), %r12
	jne	.L37
.L23:
	cmpl	$0, 32(%r13)
	jne	.L39
	movq	(%rsp), %rax
	movq	%rax, 24(%rbx)
.L39:
	testq	%r15, %r15
	jne	.L7
	jmp	.L41
.L13:
	movq	48(%rbx), %r9
	leaq	1(%r9), %rax
	movq	%rax, 48(%rbx)
	jmp	.L14
.L9:
	movq	56(%rbx), %r9
	leaq	1(%r9), %rax
	movq	%rax, 56(%rbx)
	jmp	.L14
.L16:
	movq	64(%rbx), %r9
	leaq	1(%r9), %rax
	movq	%rax, 64(%rbx)
	jmp	.L14
.L15:
	movq	72(%rbx), %r9
	leaq	1(%r9), %rax
	movq	%rax, 72(%rbx)
	jmp	.L14
.L11:
	movq	80(%rbx), %r9
	leaq	1(%r9), %rax
	movq	%rax, 80(%rbx)
	jmp	.L14
.L12:
	movq	88(%rbx), %r9
	leaq	1(%r9), %rax
	movq	%rax, 88(%rbx)
.L14:
	movq	%r9, (%rsp)
	leaq	.LC0(%rip), %rdi
	movl	$32, %esi
	call	*create_string@GOTPCREL(%rip)
	movq	(%rsp), %r9
	movl	%ebp, %r8d
	movq	%rax, 8(%r15)
	movq	%rax, %rdi
	cmpq	$-1, %r9
	jne	.L42
	leaq	.LC1(%rip), %rcx
	orq	$-1, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L43
.L42:
	leaq	.LC2(%rip), %rcx
	orq	$-1, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
.L43:
	andl	$-3, %ebp
	movq	%r13, 16(%r15)
	cmpl	$116, %ebp
	jne	.L7
	movq	8(%rbx), %rax
	movq	%r15, %rsi
	movq	24(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L7:
	addq	$24, %rsp
	movq	%r15, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	create_var, .-create_var
	.section	.rodata.str1.1
.LC3:
	.string	"[Warning] Unsupported type for size lookup: %s\n"
	.text
	.type	get_type_size, @function
get_type_size:
	xorl	%eax, %eax
	testq	%rdi, %rdi
	je	.L60
	cmpq	%rdi, name_int(%rip)
	je	.L61
	cmpq	%rdi, name_float(%rip)
	je	.L61
	cmpq	%rdi, name_string(%rip)
	je	.L61
	cmpq	%rdi, name_bool(%rip)
	movl	$1, %eax
	je	.L60
	cmpq	%rdi, name_void(%rip)
	je	.L60
	cmpl	$0, 32(%rdi)
	jne	.L55
	movq	24(%rdi), %rax
	movq	24(%rax), %rax
	ret
.L55:
	leaq	.LC3(%rip), %rdx
	movl	$2, %esi
	pushq	%rax
	xorl	%eax, %eax
	movq	8(%rdi), %rcx
	movq	stderr(%rip), %rdi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$8, %eax
	popq	%rdx
	ret
.L61:
	movl	$8, %eax
	ret
.L60:
	ret
	.size	get_type_size, .-get_type_size
	.type	create_arg, @function
create_arg:
	pushq	%rbp
	movl	%edi, %ebp
	movl	$24, %edi
	pushq	%rbx
	movq	%rsi, %rbx
	pushq	%r8
	call	*alloc_memory@GOTPCREL(%rip)
	xorl	%r9d, %r9d
	movl	%ebp, 16(%rax)
	decl	%ebp
	movq	%r9, 8(%rax)
	cmpl	$7, %ebp
	ja	.L65
	leaq	.L66(%rip), %rcx
	movslq	(%rcx,%rbp,4), %rdx
	addq	%rcx, %rdx
	jmp	*%rdx
	.section	.rodata
	.align 4
	.align 4
.L66:
	.long	.L72-.L66
	.long	.L71-.L66
	.long	.L70-.L66
	.long	.L69-.L66
	.long	.L68-.L66
	.long	.L67-.L66
	.long	.L65-.L66
	.long	.L65-.L66
	.text
.L72:
	movq	(%rbx), %rdx
	movq	%rdx, (%rax)
	movq	name_int(%rip), %rdx
	jmp	.L75
.L71:
	movsd	(%rbx), %xmm0
	movq	name_float(%rip), %rdx
	movsd	%xmm0, (%rax)
	jmp	.L75
.L70:
	movq	%rbx, (%rax)
	movq	name_string(%rip), %rdx
	jmp	.L75
.L69:
	movb	(%rbx), %dl
	movb	%dl, (%rax)
	movq	name_bool(%rip), %rdx
	jmp	.L75
.L68:
	xorl	%ecx, %ecx
	movq	name_void(%rip), %rdx
	movq	%rcx, (%rax)
	jmp	.L75
.L67:
	movq	%rbx, (%rax)
	jmp	.L73
.L65:
	movq	%rbx, (%rax)
	movq	16(%rbx), %rdx
.L75:
	movq	%rdx, 8(%rax)
.L73:
	movb	$0, 20(%rax)
	popq	%rdx
	popq	%rbx
	popq	%rbp
	ret
	.size	create_arg, .-create_arg
	.type	load_rvalue, @function
load_rvalue:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	testq	%rdi, %rdi
	je	.L77
	cmpb	$0, 20(%rdi)
	je	.L77
	movq	%rsi, %r12
	movq	8(%rdi), %rsi
	movl	$116, %edx
	xorl	%edi, %edi
	movq	%r12, %rcx
	call	create_var
	xorl	%edi, %edi
	movq	%rax, %rsi
	call	create_arg
	movq	%rbx, %rdx
	xorl	%ecx, %ecx
	movl	$23, %edi
	movq	%rax, %rsi
	movq	%rax, %rbp
	call	create_instruction
	movq	%rbp, %rbx
	movq	%rax, %rsi
	movq	16(%r12), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L77:
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	load_rvalue, .-load_rvalue
	.section	.rodata.str1.1
.LC4:
	.string	"[Warning] Unsupported variable access with NULL base\n"
.LC5:
	.string	"[Warning] Failed to generate variable access for base\n"
.LC6:
	.string	"[Warning] Attempting to access attribute of non-object type: %s\n"
.LC7:
	.string	"[Warning] Attribute '%s' not found in type '%s'\n"
.LC8:
	.string	"[Warning] Attempting to access function '%s' as attribute of type '%s'\n"
.LC9:
	.string	"[Warning] Symbol '%s' in type '%s' is not an attribute\n"
.LC10:
	.string	"arr"
.LC11:
	.string	"[Warning] Attempting to index non-array type: %s\n"
.LC12:
	.string	"[Warning] Failed to generate variable access for index\n"
.LC13:
	.string	"[Warning] Attempting to call non-function, kind: %u, type name: %s\n"
.LC14:
	.string	"[Warning] Unsupported variable access type for tac_variable_access: %u\n"
	.text
	.globl	tac_variable_access
	.type	tac_variable_access, @function
tac_variable_access:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	movq	%rdi, %r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$24, %rsp
	cmpl	$0, 16(%rdi)
	jne	.L83
	movq	8(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L83
	movl	32(%rdi), %eax
	movq	%rsi, %rcx
	leal	-1(%rax), %edx
	cmpl	$1, %edx
	ja	.L84
	movq	(%rdi), %rsi
	movl	$102, %edx
	jmp	.L124
.L84:
	movl	$118, %edx
	movq	%rdi, %rsi
	testl	%eax, %eax
	je	.L125
	movq	(%rdi), %rsi
.L125:
	call	create_var
	xorl	%edi, %edi
	movq	%rax, %rsi
	jmp	.L123
.L83:
	movq	0(%r13), %rdi
	testq	%rdi, %rdi
	jne	.L86
	movq	stderr(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	jmp	.L118
.L86:
	movq	%rbx, %rsi
	call	tac_variable_access
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L88
	movq	stderr(%rip), %rsi
	leaq	.LC5(%rip), %rdi
.L118:
	call	*fputs@GOTPCREL(%rip)
	jmp	.L122
.L88:
	movl	16(%r13), %ecx
	cmpl	$2, %ecx
	jne	.L90
	movq	8(%rax), %rax
	movl	32(%rax), %edx
	leal	-1(%rdx), %ecx
	cmpl	$1, %ecx
	ja	.L91
	movq	8(%rax), %rcx
	leaq	.LC6(%rip), %rdx
	jmp	.L119
.L91:
	movq	24(%rax), %rdi
	testl	%edx, %edx
	jne	.L92
	movq	16(%rdi), %rdi
.L92:
	movq	8(%r13), %rax
	movq	8(%rax), %rsi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L93
	movq	8(%r13), %rdx
	movq	8(%rbp), %rax
	movq	8(%rdx), %rcx
	movq	8(%rax), %r8
	leaq	.LC7(%rip), %rdx
	jmp	.L120
.L93:
	movl	32(%rax), %eax
	cmpl	$1, %eax
	jne	.L94
	movq	8(%rbp), %rax
	movq	8(%r13), %rdx
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
.L124:
	call	create_var
	movl	$7, %edi
	movq	%rax, %rsi
	jmp	.L123
.L94:
	cmpl	$2, %eax
	jne	.L95
	movq	(%r12), %rsi
	movq	%r12, %rdi
	movq	%rbx, %rcx
	movl	$102, %edx
	call	create_var
	movl	$8, %edi
	movq	%rax, %rsi
.L123:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	create_arg
.L95:
	cmpl	$5, %eax
	je	.L96
	movq	8(%rbp), %rax
	movq	8(%r13), %rdx
	movq	8(%rax), %r8
	movq	8(%rdx), %rcx
	leaq	.LC9(%rip), %rdx
.L120:
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L122
.L96:
	movq	(%r12), %rsi
	movq	%rbx, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	call	create_var
	xorl	%edi, %edi
	movq	%rax, %rsi
	call	create_arg
	movq	8(%r13), %rdi
	movq	%rbx, %rcx
	movl	$97, %edx
	movq	%rax, %r12
	movq	(%rdi), %rsi
	call	create_var
	xorl	%edi, %edi
	movq	%rax, %rsi
	call	create_arg
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movl	$15, %edi
	movq	%rax, %rcx
	jmp	.L126
.L90:
	cmpl	$3, %ecx
	jne	.L97
	movq	8(%rax), %rax
	leaq	.LC10(%rip), %rsi
	movq	8(%rax), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L98
	movq	0(%rbp), %rax
	leaq	.LC11(%rip), %rdx
	movq	(%rax), %rax
	movq	8(%rax), %rcx
.L119:
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L122
.L98:
	movq	8(%r13), %rdi
	movq	%rbx, %rsi
	call	tac_expression
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	stderr(%rip), %rsi
	leaq	.LC12(%rip), %rdi
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L118
	movq	name_int(%rip), %rsi
	movq	%rbx, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	call	create_var
	xorl	%edi, %edi
	movq	%rax, %rsi
	call	create_arg
	movq	%r13, %rcx
	movq	%rbp, %rdx
	movl	$16, %edi
	movq	%rax, %r12
	movq	%rax, %rsi
.L126:
	call	create_instruction
	movb	$1, 20(%r12)
	movq	%rax, %rsi
	jmp	.L121
.L97:
	cmpl	$1, %ecx
	jne	.L100
	cmpl	$0, 16(%rax)
	jne	.L101
	movq	8(%rax), %rax
	cmpl	$0, 32(%rax)
	jne	.L101
	movq	8(%rax), %rdi
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	8(%rbp), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rdi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$102, %edx
	movq	(%rax), %rsi
	movq	%rax, %rdi
	call	create_var
	movl	$8, %edi
	movq	%rax, %rsi
	call	create_arg
	movq	%rax, %rbp
.L101:
	movl	16(%rbp), %ecx
	leal	-7(%rcx), %eax
	cmpl	$1, %eax
	jbe	.L102
	movq	8(%rbp), %rax
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	leaq	.LC13(%rip), %rdx
	movq	8(%rax), %r8
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L122:
	xorl	%r12d, %r12d
	jmp	.L82
.L102:
	xorl	%eax, %eax
	movq	%rax, (%rsp)
	call	*create_list@GOTPCREL(%rip)
	cmpl	$8, 16(%rbp)
	movq	%rax, %r12
	jne	.L105
	movq	8(%rbp), %rax
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi
	movq	8(%rax), %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	0(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L105
	movq	0(%r13), %rax
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
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	8(%rax), %rdi
	movq	%rax, %r14
	call	get_type_size
	leaq	8(%rsp), %rsi
	movl	$1, %edi
	movq	%rax, 8(%rsp)
	call	create_arg
	xorl	%ecx, %ecx
	movq	%r14, %rdx
	movl	$17, %edi
	movq	%rax, %rsi
	call	create_instruction
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	incq	(%rsp)
.L105:
	movq	8(%r13), %rdi
	leaq	8(%rsp), %r14
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r13
.L107:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L109
	movq	%rbx, %rsi
	call	tac_expression
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	8(%rax), %rdi
	movq	%rax, %r15
	call	get_type_size
	movq	%r14, %rsi
	movl	$1, %edi
	movq	%rax, 8(%rsp)
	call	create_arg
	xorl	%ecx, %ecx
	movq	%r15, %rdx
	movl	$17, %edi
	movq	%rax, %rsi
	call	create_instruction
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	incq	(%rsp)
	jmp	.L107
.L109:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L127
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L109
.L127:
	movq	8(%rbp), %rsi
	movq	%rbx, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	call	create_var
	xorl	%edi, %edi
	movq	%rax, %rsi
	call	create_arg
	movq	%rsp, %rsi
	movl	$1, %edi
	movq	%rax, %r12
	call	create_arg
	movq	%r12, %rsi
	movq	%rbp, %rdx
	movl	$22, %edi
	movq	%rax, %rcx
	call	create_instruction
	movq	%rax, %rsi
.L121:
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L82
.L100:
	movq	stderr(%rip), %rdi
	leaq	.LC14(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L122
.L82:
	addq	$24, %rsp
	movq	%r12, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	tac_variable_access, .-tac_variable_access
	.section	.rodata.str1.1
.LC16:
	.string	"[Warning] Unsupported type for negation: %s\n"
.LC17:
	.string	"[Warning] Unsupported primary type for tac_primary: %d\n"
	.text
	.globl	tac_primary
	.type	tac_primary, @function
tac_primary:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$16, %rsp
	movl	8(%rdi), %ecx
	cmpl	$8, %ecx
	ja	.L129
	leaq	.L131(%rip), %rdx
	movq	%rsi, %rbp
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L131:
	.long	.L139-.L131
	.long	.L138-.L131
	.long	.L137-.L131
	.long	.L136-.L131
	.long	.L135-.L131
	.long	.L134-.L131
	.long	.L133-.L131
	.long	.L132-.L131
	.long	.L130-.L131
	.text
.L139:
	movq	(%rdi), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	*strtoll@GOTPCREL(%rip)
	leaq	8(%rsp), %rsi
	movl	$1, %edi
	movq	%rax, 8(%rsp)
	jmp	.L148
.L138:
	movq	(%rdi), %rdi
	xorl	%esi, %esi
	call	*strtod@GOTPCREL(%rip)
	leaq	8(%rsp), %rsi
	movl	$2, %edi
	movsd	%xmm0, 8(%rsp)
.L148:
	call	create_arg
	movq	%rax, %rbx
	jmp	.L128
.L137:
	movq	(%rdi), %rsi
	addq	$16, %rsp
	movl	$3, %edi
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	create_arg
.L136:
	movb	$1, 8(%rsp)
	jmp	.L149
.L135:
	movb	$0, 8(%rsp)
.L149:
	leaq	8(%rsp), %rsi
	movl	$4, %edi
	jmp	.L148
.L134:
	movq	(%rdi), %rdi
	addq	$16, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	tac_expression
.L133:
	movq	(%rdi), %rdi
	call	tac_primary
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	%rbp, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	movq	name_bool(%rip), %rsi
	movq	%rax, %r12
	call	create_var
	xorl	%edi, %edi
	movq	%rax, %rsi
	call	create_arg
	xorl	%ecx, %ecx
	movq	%r12, %rdx
	movl	$13, %edi
	movq	%rax, %rbx
	movq	%rax, %rsi
	jmp	.L146
.L132:
	movq	(%rdi), %rdi
	call	tac_primary
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	xorl	%edi, %edi
	movq	%rbp, %rcx
	movl	$116, %edx
	movq	8(%rax), %rsi
	movq	%rax, %r12
	call	create_var
	xorl	%edi, %edi
	movq	%rax, %rsi
	call	create_arg
	xorl	%r10d, %r10d
	movq	%rax, %rbx
	movq	.LC15(%rip), %rax
	movq	%r10, (%rsp)
	movq	%rax, 8(%rsp)
	movq	8(%r12), %rax
	cmpq	name_int(%rip), %rax
	jne	.L141
	movq	%rsp, %rsi
	movl	$1, %edi
	call	create_arg
	movq	%r12, %rcx
	movq	%rbx, %rsi
	movl	$1, %edi
	movq	%rax, %rdx
	jmp	.L146
.L141:
	cmpq	name_float(%rip), %rax
	jne	.L143
	leaq	8(%rsp), %rsi
	movl	$2, %edi
	call	create_arg
	movq	%r12, %rcx
	movq	%rbx, %rsi
	movl	$2, %edi
	movq	%rax, %rdx
.L146:
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L128
.L143:
	movq	8(%rax), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC16(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L147
.L130:
	movq	(%rdi), %rdi
	addq	$16, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	tac_variable_access
.L129:
	movq	stderr(%rip), %rdi
	leaq	.LC17(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L147:
	xorl	%ebx, %ebx
.L128:
	addq	$16, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	tac_primary, .-tac_primary
	.section	.rodata.str1.1
.LC18:
	.string	"[Warning] Left-hand side of assignment is not a variable\n"
	.text
	.globl	tac_expression
	.type	tac_expression, @function
tac_expression:
	pushq	%r14
	pushq	%r13
	movq	%rdi, %r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	cmpl	$19, 24(%rdi)
	movq	%rsi, %rbx
	jne	.L151
	movq	8(%rdi), %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	tac_primary
.L151:
	movq	16(%rdi), %rdi
	movl	$25, %r14d
	call	tac_expression
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	%rax, %r12
	movl	24(%r13), %eax
	cmpl	$18, %eax
	ja	.L152
	leaq	CSWTCH.47(%rip), %rdx
	movzbl	(%rdx,%rax), %r14d
.L152:
	movq	0(%r13), %rdi
	movq	%rbx, %rsi
	call	tac_expression
	movq	%rax, %rbp
	movl	24(%r13), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L153
	cmpl	$14, %r14d
	je	.L154
	movq	8(%rbp), %rsi
	movq	%rbx, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	call	create_var
	xorl	%edi, %edi
	movq	%rax, %rsi
	call	create_arg
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	movq	%rax, %r13
	call	load_rvalue
	movq	%r12, %rcx
	movq	%r13, %rsi
	movl	%r14d, %edi
	movq	%rax, %rdx
	movq	%r13, %r12
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L154:
	cmpl	$0, 16(%rbp)
	je	.L155
	movq	stderr(%rip), %rsi
	leaq	.LC18(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L155:
	xorl	%ecx, %ecx
	movq	%rbp, %rsi
	movq	%r12, %rdx
	movl	$14, %edi
	call	create_instruction
	cmpb	$0, 20(%rbp)
	movq	%rax, %rsi
	je	.L156
	movq	%rbp, %rsi
	xorl	%ecx, %ecx
	movq	%r12, %rdx
	movl	$24, %edi
	call	create_instruction
	movq	%rax, %rsi
	jmp	.L156
.L153:
	movq	8(%rbp), %rsi
	movq	%rbx, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	call	create_var
	xorl	%edi, %edi
	movq	%rax, %rsi
	call	create_arg
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	movq	%rax, %r13
	call	load_rvalue
	movq	%r12, %rcx
	movq	%r13, %rsi
	movl	%r14d, %edi
	movq	%rax, %rdx
	movq	%r13, %r12
	call	create_instruction
	movq	%rax, %rsi
.L156:
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	popq	%rbx
	movq	%r12, %rax
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	tac_expression, .-tac_expression
	.section	.rodata.str1.1
.LC19:
	.string	"Error: create_attribute received NULL table\n"
.LC20:
	.string	"Error: create_attribute received NULL table or attributes list\n"
	.text
	.globl	tac_variable
	.type	tac_variable, @function
tac_variable:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$16, %rsp
	testb	%dl, %dl
	je	.L163
	movq	(%rsi), %rax
	movq	(%rax), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	(%rbx), %rax
	movq	%rbp, %rsi
	movq	(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	(%r12), %r13
	movq	8(%r12), %r14
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, %rcx
	movl	$97, %edx
	movq	%r13, %rsi
	movq	%r14, %rdi
	movq	%rax, %r12
	call	create_var
	xorl	%r10d, %r10d
	movq	%r13, 8(%r12)
	movq	%rax, (%r12)
	movq	%r10, 16(%r12)
	testq	%rbp, %rbp
	je	.L164
	movq	16(%rbp), %rax
	movq	%r13, %rdi
	movq	%rax, 16(%r12)
	call	get_type_size
	movq	0(%rbp), %rdi
	addq	%rax, 16(%rbp)
	movq	%r12, %rsi
	testq	%rdi, %rdi
	jne	.L175
	jmp	.L165
.L164:
	movq	stderr(%rip), %rsi
	leaq	.LC19(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L165:
	movq	stderr(%rip), %rsi
	addq	$16, %rsp
	leaq	.LC20(%rip), %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	*fputs@GOTPCREL(%rip)
.L163:
	movq	8(%rdi), %rdi
	movq	%rsi, %rcx
	movq	(%r12), %rsi
	movl	$118, %edx
	call	create_var
	movq	16(%r12), %rdi
	movq	%rax, %r13
	testq	%rdi, %rdi
	je	.L167
	movq	%rbx, %rsi
	call	tac_expression
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	jmp	.L174
.L167:
	xorl	%ecx, %ecx
	leaq	8(%rsp), %rsi
	movl	$1, %edi
	movq	%rcx, 8(%rsp)
	call	create_arg
.L174:
	movq	%r13, %rsi
	xorl	%edi, %edi
	movq	%rax, %rbp
	call	create_arg
	movl	$14, %edi
	xorl	%ecx, %ecx
	movq	%rbp, %rdx
	movq	%rax, %rsi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
.L175:
	addq	$16, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	*list_append@GOTPCREL(%rip)
	.size	tac_variable, .-tac_variable
	.globl	tac_if
	.type	tac_if, @function
tac_if:
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
	subq	$40, %rsp
	call	create_var
	xorl	%edi, %edi
	xorl	%esi, %esi
	movq	%rbx, %rcx
	movl	$98, %edx
	movq	%rax, %r14
	call	create_var
	movq	16(%r12), %rdi
	movq	%rax, %rbp
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L177
.L179:
	movq	%rbx, %rcx
	movl	$98, %edx
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	create_var
	movq	%rax, %r13
	jmp	.L178
.L177:
	movq	24(%r12), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L179
	movq	%rbp, %r13
.L178:
	movq	%r13, %rsi
	movl	$6, %edi
	call	create_arg
	movq	(%r12), %rdi
	movq	%rbx, %rsi
	movq	%rax, (%rsp)
	call	tac_expression
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	%rbp, %rsi
	movl	$6, %edi
	movq	%rax, %r15
	call	create_arg
	movq	%r14, %rsi
	movl	$6, %edi
	movq	%rax, 8(%rsp)
	call	create_arg
	movq	8(%rsp), %rcx
	movq	%r15, %rsi
	movl	$19, %edi
	movq	%rax, %rdx
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r14, %rdi
	call	create_block
	movq	%rax, %r14
	movq	8(%rbx), %rax
	movq	%r14, %rsi
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r14, 16(%rbx)
	movq	8(%r12), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r14
.L180:
	movq	%r14, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L200
	movq	%rbx, %rsi
	call	tac_statement
	jmp	.L180
.L200:
	movq	(%rsp), %rsi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$20, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	16(%r12), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L182
	movq	16(%r12), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
.L183:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L182
	movq	%rbp, %rdi
	call	create_block
	movq	%rax, %rbp
	movq	8(%rbx), %rax
	movq	%rbp, %rsi
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%rbp, 16(%rbx)
	xorl	%esi, %esi
	xorl	%edi, %edi
	movq	%rbx, %rcx
	movl	$98, %edx
	call	create_var
	movq	%rbx, %rcx
	movl	$98, %edx
	xorl	%esi, %esi
	xorl	%edi, %edi
	movq	%rax, 16(%rsp)
	call	create_var
	movq	(%r14), %rdi
	movq	%rbx, %rsi
	movq	%rax, %rbp
	call	tac_expression
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	8(%rsp), %rdi
	movq	%rax, %r15
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L185
	movq	24(%r12), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	cmovne	%r13, %rbp
.L185:
	movq	%rbp, %rsi
	movl	$6, %edi
	call	create_arg
	movq	16(%rsp), %rsi
	movl	$6, %edi
	movq	%rax, 24(%rsp)
	call	create_arg
	movq	24(%rsp), %rcx
	movq	%r15, %rsi
	movl	$19, %edi
	movq	%rax, %rdx
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	16(%rsp), %rdi
	call	create_block
	movq	%rax, %r15
	movq	8(%rbx), %rax
	movq	%r15, %rsi
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	8(%r14), %rdi
	movq	%r15, 16(%rbx)
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r14
.L186:
	movq	%r14, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L201
	movq	%rbx, %rsi
	call	tac_statement
	jmp	.L186
.L201:
	movq	(%rsp), %rsi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$20, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L183
.L182:
	movq	24(%r12), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L189
	movq	%rbp, %rdi
	call	create_block
	movq	%rax, %rbp
	movq	8(%rbx), %rax
	movq	%rbp, %rsi
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%rbp, 16(%rbx)
	movq	24(%r12), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
.L190:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L202
	movq	%rbx, %rsi
	call	tac_statement
	jmp	.L190
.L202:
	movq	(%rsp), %rsi
	movl	$20, %edi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L189:
	movq	%r13, %rdi
	call	create_block
	movq	%rax, %rbp
	movq	8(%rbx), %rax
	movq	%rbp, %rsi
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
	.size	tac_if, .-tac_if
	.section	.rodata.str1.1
.LC21:
	.string	"[Warning] 'break' statement used outside of loop\n"
.LC22:
	.string	"[Warning] 'continue' statement used outside of loop\n"
.LC23:
	.string	"[Warning] Unsupported statement type for tac_statement: %d\n"
	.text
	.globl	tac_statement
	.type	tac_statement, @function
tac_statement:
	movl	8(%rdi), %ecx
	cmpl	$7, %ecx
	ja	.L204
	leaq	.L206(%rip), %rdx
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	pushq	%rbx
	movslq	(%rdx,%rcx,4), %rax
	movq	%rsi, %rbx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L206:
	.long	.L213-.L206
	.long	.L212-.L206
	.long	.L211-.L206
	.long	.L210-.L206
	.long	.L209-.L206
	.long	.L208-.L206
	.long	.L207-.L206
	.long	.L205-.L206
	.text
.L213:
	movq	(%rdi), %rdi
	call	tac_expression
	popq	%r11
	movq	%rbx, %rsi
	popq	%rbx
	movq	%rax, %rdi
	popq	%rbp
	jmp	load_rvalue
.L212:
	movq	(%rdi), %rdi
	xorl	%edx, %edx
	popq	%r10
	popq	%rbx
	popq	%rbp
	jmp	tac_variable
.L211:
	movq	(%rdi), %rdi
	popq	%r9
	popq	%rbx
	popq	%rbp
	jmp	tac_if
.L210:
	movq	(%rdi), %rdi
	popq	%r8
	popq	%rbx
	popq	%rbp
	jmp	tac_while
.L209:
	movq	(%rdi), %rdi
	popq	%rcx
	popq	%rbx
	popq	%rbp
	jmp	tac_for
.L208:
	movl	$5, %edi
	xorl	%esi, %esi
	call	create_arg
	movq	0(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L214
	movq	%rbx, %rsi
	call	tac_expression
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue
.L214:
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rax, %rsi
	movl	$21, %edi
	jmp	.L229
.L207:
	movq	32(%rsi), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L215
	movq	32(%rbx), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rsi
	testq	%rsi, %rsi
	je	.L215
.L231:
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$20, %edi
.L229:
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	popq	%rdx
	popq	%rbx
	popq	%rbp
	jmp	*list_append@GOTPCREL(%rip)
.L215:
	movq	stderr(%rip), %rsi
	leaq	.LC21(%rip), %rdi
	jmp	.L230
.L205:
	movq	40(%rsi), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L216
	movq	40(%rbx), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rsi
	testq	%rsi, %rsi
	jne	.L231
.L216:
	movq	stderr(%rip), %rsi
	leaq	.LC22(%rip), %rdi
.L230:
	popq	%rax
	popq	%rbx
	popq	%rbp
	jmp	*fputs@GOTPCREL(%rip)
.L204:
	movq	stderr(%rip), %rdi
	leaq	.LC23(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.size	tac_statement, .-tac_statement
	.globl	tac_for
	.type	tac_for, @function
tac_for:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$24, %rsp
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L233
	xorl	%edx, %edx
	call	tac_variable
.L233:
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
	xorl	%esi, %esi
	xorl	%edi, %edi
	movq	%rbx, %rcx
	movl	$98, %edx
	movq	%rax, %r12
	call	create_var
	cmpq	$0, 8(%rbp)
	movq	%rax, 8(%rsp)
	je	.L234
	movq	%r13, %rsi
	movl	$6, %edi
	call	create_arg
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$20, %edi
	movq	%rax, %rsi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r13, %rdi
	call	create_block
	movq	%rax, %r14
	movq	8(%rbx), %rax
	movq	%r14, %rsi
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r14, 16(%rbx)
	movq	8(%rbp), %rdi
	movq	%rbx, %rsi
	call	tac_expression
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	8(%rsp), %rsi
	movl	$6, %edi
	movq	%rax, %r14
	call	create_arg
	movq	%r12, %rsi
	movl	$6, %edi
	movq	%rax, %r15
	call	create_arg
	movq	%r15, %rcx
	movq	%r14, %rsi
	movl	$19, %edi
	movq	%rax, %rdx
	jmp	.L247
.L234:
	movq	%r12, %rsi
	movl	$6, %edi
	call	create_arg
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$20, %edi
	movq	%rax, %rsi
.L247:
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r12, %rdi
	call	create_block
	movq	%rax, %r14
	movq	8(%rbx), %rax
	movq	%r14, %rsi
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r14, 16(%rbx)
	xorl	%esi, %esi
	xorl	%edi, %edi
	movq	%rbx, %rcx
	movl	$98, %edx
	call	create_var
	cmpq	$0, 16(%rbp)
	movq	%rax, %r14
	movq	%rax, %rsi
	jne	.L248
	cmpq	$0, 8(%rbp)
	movq	%r13, %rsi
	jne	.L248
	movq	%r12, %rsi
.L248:
	movl	$6, %edi
	call	create_arg
	movq	40(%rbx), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movl	$6, %edi
	call	create_arg
	movq	32(%rbx), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	24(%rbp), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r15
.L239:
	movq	%r15, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L249
	movq	%rbx, %rsi
	call	tac_statement
	jmp	.L239
.L249:
	movq	40(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	32(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	cmpq	$0, 16(%rbp)
	je	.L241
	movq	%r14, %rsi
	movl	$6, %edi
	call	create_arg
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$20, %edi
	movq	%rax, %rsi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r14, %rdi
	call	create_block
	movq	%rax, %r14
	movq	8(%rbx), %rax
	movq	%r14, %rsi
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r14, 16(%rbx)
	movq	16(%rbp), %rdi
	movq	%rbx, %rsi
	call	tac_expression
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue
.L241:
	movq	%r13, %rsi
	movl	$6, %edi
	call	create_arg
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$20, %edi
	movq	%rax, %rsi
	call	create_instruction
	cmpq	$0, 8(%rbp)
	jne	.L242
	movq	%r12, %rsi
	movl	$6, %edi
	call	create_arg
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$20, %edi
	movq	%rax, %rsi
	call	create_instruction
.L242:
	movq	16(%rbx), %rdx
	movq	%rax, %rsi
	movq	8(%rdx), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	call	create_block
	movq	%rax, %rbp
	movq	8(%rbx), %rax
	movq	%rbp, %rsi
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
	.size	tac_for, .-tac_for
	.globl	tac_while
	.type	tac_while, @function
tac_while:
	pushq	%r15
	movq	%rsi, %rcx
	movl	$98, %edx
	pushq	%r14
	pushq	%r13
	movq	%rdi, %r13
	xorl	%edi, %edi
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	xorl	%esi, %esi
	subq	$24, %rsp
	call	create_var
	movl	$6, %edi
	movq	%rax, %rsi
	movq	%rax, %rbp
	call	create_arg
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$20, %edi
	movq	%rax, %rsi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%rbp, %rdi
	call	create_block
	movq	%rax, %r12
	movq	8(%rbx), %rax
	movq	%r12, %rsi
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
	movq	%rax, %r14
	call	create_var
	movq	0(%r13), %rdi
	movq	%rbx, %rsi
	movq	%rax, %r12
	call	tac_expression
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	%r12, %rsi
	movl	$6, %edi
	movq	%rax, %r15
	call	create_arg
	movq	%r14, %rsi
	movl	$6, %edi
	movq	%rax, 8(%rsp)
	call	create_arg
	movq	8(%rsp), %rcx
	movq	%r15, %rsi
	movl	$19, %edi
	movq	%rax, %rdx
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r14, %rdi
	call	create_block
	movq	%rax, %r14
	movq	8(%rbx), %rax
	movq	%r14, %rsi
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r14, 16(%rbx)
	movq	%rbp, %rsi
	movl	$6, %edi
	call	create_arg
	movq	40(%rbx), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	%r12, %rsi
	movl	$6, %edi
	call	create_arg
	movq	32(%rbx), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	8(%r13), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r13
.L251:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L254
	movq	%rbx, %rsi
	call	tac_statement
	jmp	.L251
.L254:
	movq	40(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	32(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	%rbp, %rsi
	movl	$6, %edi
	call	create_arg
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$20, %edi
	movq	%rax, %rsi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r12, %rdi
	call	create_block
	movq	%rax, %rbp
	movq	8(%rbx), %rax
	movq	%rbp, %rsi
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
	.globl	tac_function
	.type	tac_function, @function
tac_function:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	movq	%rsi, %rbx
	pushq	%rcx
	movq	8(%rdi), %rsi
	movq	(%rdi), %rdi
	call	create_subroutine
	movq	%rax, 8(%rbx)
	movq	%rax, %r12
	movq	(%rbx), %rax
	movq	%r12, %rsi
	movq	24(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	16(%rbp), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r13
.L256:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L261
	movq	8(%rax), %rdi
	movq	(%rax), %rsi
	movq	%rbx, %rcx
	movl	$112, %edx
	call	create_var
	movq	16(%r12), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L256
.L261:
	movq	%rbx, %rcx
	movl	$98, %edx
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	create_var
	movq	%rax, %rdi
	call	create_block
	movq	32(%r12), %rdi
	movq	%rax, %r13
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	24(%rbp), %rdi
	movq	%r13, 16(%rbx)
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
.L258:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L262
	movq	%rbx, %rsi
	call	tac_statement
	jmp	.L258
.L262:
	xorl	%eax, %eax
	movq	%rax, 8(%rbx)
	popq	%rdx
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	tac_function, .-tac_function
	.section	.rodata.str1.1
.LC24:
	.string	"[Warning] Constructor '%s' does not start with 'self' initialization\n"
	.text
	.globl	tac_method
	.type	tac_method, @function
tac_method:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	movq	%rsi, %rbx
	movq	8(%rdi), %rsi
	movq	(%rdi), %rdi
	call	create_subroutine
	movq	%rax, 8(%rbx)
	movq	%rax, %r12
	movq	(%rbx), %rax
	movq	%r12, %rsi
	movq	24(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	16(%rbp), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r13
.L264:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L272
	movq	8(%rax), %rdi
	movq	(%rax), %rsi
	movq	%rbx, %rcx
	movl	$112, %edx
	call	create_var
	movq	16(%r12), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L264
.L272:
	movq	%rbx, %rcx
	movl	$98, %edx
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	create_var
	movq	%rax, %rdi
	call	create_block
	movq	32(%r12), %rdi
	movq	%rax, %r13
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	24(%rbp), %rdi
	movq	%r13, 16(%rbx)
	call	*list_copy@GOTPCREL(%rip)
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi
	movq	%rax, %r12
	movq	24(%rbx), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	0(%rbp), %rax
	movq	8(%rax), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L269
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	cmpl	$0, 8(%rax)
	jne	.L267
	movq	(%rax), %rax
	cmpl	$19, 24(%rax)
	jne	.L267
	movq	8(%rax), %rax
	cmpl	$8, 8(%rax)
	jne	.L267
	movq	(%rax), %rax
	cmpl	$0, 16(%rax)
	je	.L268
.L267:
	movq	0(%rbp), %rax
	popq	%rbx
	leaq	.LC24(%rip), %rdx
	movl	$2, %esi
	popq	%rbp
	movq	stderr(%rip), %rdi
	popq	%r12
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	popq	%r13
	popq	%r14
	jmp	*__fprintf_chk@GOTPCREL(%rip)
.L268:
	movq	8(%rax), %r14
	movq	24(%rbx), %rax
	movl	$1, %edi
	leaq	24(%rax), %rsi
	call	create_arg
	movq	(%r14), %rsi
	movq	%rbx, %rcx
	movl	$118, %edx
	movq	%r14, %rdi
	movq	%rax, %rbp
	call	create_var
	xorl	%edi, %edi
	movq	%rax, %rsi
	call	create_arg
	movl	$18, %edi
	xorl	%ecx, %ecx
	movq	%rbp, %rdx
	movq	%rax, %rsi
	call	create_instruction
	movq	8(%r13), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
.L269:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L273
	movq	%rbx, %rsi
	call	tac_statement
	jmp	.L269
.L273:
	xorl	%eax, %eax
	movq	%rax, 8(%rbx)
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	tac_method, .-tac_method
	.section	.rodata.str1.1
.LC25:
	.string	"[Warning] Unsupported class member type for tac_class: %d\n"
	.text
	.globl	tac_class
	.type	tac_class, @function
tac_class:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	movq	%rsi, %rbx
	pushq	%rcx
	movq	%rdi, 24(%rsi)
	movq	8(%rdi), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	0(%rbp), %r13
	movl	$24, %edi
	movq	%rax, %r12
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	call	*create_list@GOTPCREL(%rip)
	xorl	%esi, %esi
	movq	%r13, 8(%rbp)
	movq	%rax, 0(%rbp)
	movq	(%rbx), %rax
	movq	%rsi, 16(%rbp)
	movq	%rbp, %rsi
	leaq	.LC25(%rip), %rbp
	movq	(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L275:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L283
	movl	8(%rax), %ecx
	testl	%ecx, %ecx
	je	.L276
	cmpl	$1, %ecx
	jne	.L284
	movq	(%rax), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	tac_variable
	jmp	.L275
.L276:
	movq	(%rax), %rdi
	movq	%rbx, %rsi
	call	tac_method
	jmp	.L275
.L284:
	movq	stderr(%rip), %rdi
	movq	%rbp, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L275
.L283:
	xorl	%eax, %eax
	movq	%rax, 24(%rbx)
	popq	%rdx
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	tac_class, .-tac_class
	.section	.rodata.str1.1
.LC26:
	.string	"[Warning] Unsupported symbol kind for import: %d\n"
	.text
	.globl	tac_import
	.type	tac_import, @function
tac_import:
	pushq	%rbx
	movq	(%rdi), %rdi
	movq	%rdx, %rcx
	movq	%rsi, %rbx
	movl	$118, %edx
	movl	32(%rdi), %eax
	cmpl	$3, %eax
	je	.L290
	leal	-1(%rax), %edx
	cmpl	$1, %edx
	ja	.L287
	movl	$102, %edx
.L290:
	movq	(%rdi), %rsi
	call	create_var
	movq	16(%rbx), %rdi
	popq	%rbx
	movq	%rax, %rsi
	jmp	*list_append@GOTPCREL(%rip)
.L287:
	testl	%eax, %eax
	jne	.L288
	movq	24(%rdi), %rdi
	movq	%rcx, %rsi
	popq	%rbx
	jmp	tac_class
.L288:
	movl	%eax, %ecx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC26(%rip), %rdx
	popq	%rbx
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.size	tac_import, .-tac_import
	.section	.rodata.str1.1
.LC27:
	.string	"main"
	.text
	.globl	tac_code
	.type	tac_code, @function
tac_code:
	pushq	%r14
	leaq	.LC27(%rip), %r14
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	movl	$32, %edi
	pushq	%rbp
	pushq	%rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 0(%rbp)
	xorl	%eax, %eax
	movq	%rax, 8(%rbp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 16(%rbp)
	call	*create_list@GOTPCREL(%rip)
	movl	$96, %edi
	movq	%rax, 24(%rbp)
	call	*alloc_memory@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	%rax, %rbx
	movq	%rdx, 8(%rax)
	movq	%rdx, 16(%rax)
	movq	%rbp, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 32(%rbx)
	call	*create_list@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	movq	(%r12), %rdi
	movq	%rax, 40(%rbx)
	movq	%rcx, 48(%rbx)
	movq	%rcx, 56(%rbx)
	movq	%rcx, 64(%rbx)
	movq	%rcx, 72(%rbx)
	movq	%rcx, 80(%rbx)
	movq	%rcx, 88(%rbx)
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r13
.L292:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L300
	movl	8(%r12), %eax
	cmpl	$1, %eax
	jne	.L293
	movq	(%r12), %rdi
	movq	%rbx, %rsi
	call	tac_function
	movq	(%r12), %rax
	movq	%r14, %rsi
	movq	(%rax), %r12
	movq	8(%r12), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L292
	movq	%r12, 8(%rbp)
	jmp	.L292
.L293:
	cmpl	$2, %eax
	jne	.L296
	movq	(%r12), %rdi
	movq	%rbx, %rsi
	call	tac_class
	jmp	.L292
.L296:
	testl	%eax, %eax
	jne	.L292
	movq	(%r12), %rdi
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	call	tac_import
	jmp	.L292
.L300:
	popq	%rbx
	movq	%rbp, %rax
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	tac_code, .-tac_code
	.section	.rodata
	.align 16
	.type	CSWTCH.47, @object
	.size	CSWTCH.47, 19
CSWTCH.47:
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	14
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC15:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
