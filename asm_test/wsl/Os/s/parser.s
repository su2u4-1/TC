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
	.string	"[warning] Unsupported type for size lookup: %s\n"
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
	cmpl	$6, %ebp
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
	.string	"[warning] Unsupported symbol kind for import: %d\n"
	.text
	.globl	tac_import
	.type	tac_import, @function
tac_import:
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	pushq	%rbx
	movq	(%rdi), %rbp
	movl	32(%rbp), %ecx
	cmpl	$3, %ecx
	jne	.L83
	movq	%rdx, %rcx
	movl	$118, %edx
	jmp	.L87
.L83:
	leal	-1(%rcx), %eax
	cmpl	$1, %eax
	ja	.L84
	movq	%rdx, %rcx
	movl	$102, %edx
.L87:
	movq	0(%rbp), %rsi
	movq	%rbp, %rdi
	call	create_var
	movq	16(%r12), %rdi
	movq	%rax, %rsi
.L88:
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	*list_append@GOTPCREL(%rip)
.L84:
	testl	%ecx, %ecx
	jne	.L85
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbx
	call	*create_list@GOTPCREL(%rip)
	movq	%rbp, 8(%rbx)
	movq	(%r12), %rdi
	movq	%rbx, %rsi
	movq	%rax, (%rbx)
	xorl	%eax, %eax
	movq	%rax, 16(%rbx)
	jmp	.L88
.L85:
	popq	%rbx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbp
	leaq	.LC4(%rip), %rdx
	popq	%r12
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.size	tac_import, .-tac_import
	.section	.rodata.str1.1
.LC5:
	.string	"Error: create_attribute received NULL table or attributes list\n"
.LC6:
	.string	"[warning] Unsupported variable type for tac_variable: %d\n"
	.text
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
	cmpl	$112, %edx
	je	.L90
	movl	%edx, %ecx
	ja	.L91
	cmpl	$97, %edx
	je	.L92
	cmpl	$102, %edx
	jne	.L94
	movq	%rsi, %rcx
	movq	8(%rdi), %rdi
	movq	0(%rbp), %rsi
	movl	$102, %edx
	call	create_var
	movq	%rax, %rsi
	movq	(%rbx), %rax
	jmp	.L98
.L91:
	movl	%edx, %eax
	andl	$-3, %eax
	cmpl	$116, %eax
	jne	.L94
	jmp	.L100
.L90:
	movq	%rsi, %rcx
	movq	8(%rdi), %rdi
	movq	0(%rbp), %rsi
	movl	$112, %edx
	call	create_var
	movq	%rax, %rsi
	movq	8(%rbx), %rax
.L98:
	movq	16(%rax), %rdi
.L99:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	*list_append@GOTPCREL(%rip)
.L92:
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
	movq	%r13, 8(%rbp)
	movq	%r13, %rdi
	movq	%rax, 0(%rbp)
	movq	16(%r12), %rax
	movq	%rax, 16(%rbp)
	call	get_type_size
	movq	(%r12), %rdi
	addq	%rax, 16(%r12)
	movq	%rbp, %rsi
	testq	%rdi, %rdi
	jne	.L99
	popq	%rbx
	movq	stderr(%rip), %rsi
	leaq	.LC5(%rip), %rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	*fputs@GOTPCREL(%rip)
.L94:
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
.L100:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	tac_variable, .-tac_variable
	.section	.rodata.str1.1
.LC7:
	.string	"[warning] Unsupported variable access with NULL base\n"
.LC8:
	.string	"[warning] Failed to generate variable access for base\n"
.LC9:
	.string	"[warning] Attempting to access attribute of non-object type: %s\n"
.LC10:
	.string	"[warning] Attribute '%s' not found in type '%s'\n"
.LC11:
	.string	"[warning] Symbol '%s' in type '%s' is not an attribute\n"
.LC12:
	.string	"[warning] Attempting to index non-array type: %s\n"
.LC13:
	.string	"arr"
.LC14:
	.string	"[warning] Failed to generate variable access for index\n"
.LC15:
	.string	"[warning] Attempting to call non-function, kind: %u, type name: %s\n"
.LC16:
	.string	"[warning] Unsupported variable access type for tac_variable_access: %u\n"
	.text
	.globl	tac_variable_access
	.type	tac_variable_access, @function
tac_variable_access:
	pushq	%r14
	pushq	%r13
	movq	%rdi, %r13
	pushq	%r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	subq	$32, %rsp
	cmpl	$0, 16(%rdi)
	jne	.L102
	movq	8(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L102
	movl	32(%rdi), %eax
	movq	(%rdi), %rsi
	movq	%rbp, %rcx
	decl	%eax
	cmpl	$1, %eax
	jbe	.L103
	movl	$118, %edx
	call	create_var
	xorl	%edi, %edi
	movq	%rax, %rsi
	jmp	.L134
.L103:
	movl	$102, %edx
	jmp	.L135
.L102:
	movq	0(%r13), %rdi
	testq	%rdi, %rdi
	jne	.L104
	movq	stderr(%rip), %rsi
	leaq	.LC7(%rip), %rdi
	jmp	.L128
.L104:
	movq	%rbp, %rsi
	call	tac_variable_access
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L106
	movq	stderr(%rip), %rsi
	leaq	.LC8(%rip), %rdi
.L128:
	call	*fputs@GOTPCREL(%rip)
	jmp	.L133
.L106:
	movl	16(%r13), %ecx
	cmpl	$2, %ecx
	jne	.L108
	movq	8(%rax), %rax
	movl	32(%rax), %edx
	leal	-1(%rdx), %ecx
	cmpl	$1, %ecx
	ja	.L109
	movq	8(%rax), %rcx
	leaq	.LC9(%rip), %rdx
	jmp	.L129
.L109:
	movq	24(%rax), %rdi
	testl	%edx, %edx
	jne	.L110
	movq	16(%rdi), %rdi
.L110:
	movq	8(%r13), %rax
	movq	8(%rax), %rsi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L111
	movq	8(%r13), %rdx
	movq	8(%rbx), %rax
	movq	8(%rdx), %rcx
	movq	8(%rax), %r8
	leaq	.LC10(%rip), %rdx
	jmp	.L130
.L111:
	movl	32(%rax), %eax
	leal	-1(%rax), %edx
	cmpl	$1, %edx
	ja	.L112
	movq	(%rdi), %rsi
	movq	%rbp, %rcx
	movl	$102, %edx
.L135:
	call	create_var
	movl	$7, %edi
	movq	%rax, %rsi
.L134:
	addq	$32, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	create_arg
.L112:
	cmpl	$5, %eax
	je	.L113
	movq	8(%rbx), %rax
	movq	8(%r13), %rdx
	movq	8(%rax), %r8
	movq	8(%rdx), %rcx
	leaq	.LC11(%rip), %rdx
.L130:
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L133
.L113:
	movq	(%rdi), %rsi
	movq	%rbp, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	call	create_var
	xorl	%edi, %edi
	movq	%rax, %rsi
	call	create_arg
	movq	8(%r13), %rdi
	movq	%rbp, %rcx
	movl	$97, %edx
	movq	%rax, %r12
	movq	(%rdi), %rsi
	call	create_var
	xorl	%edi, %edi
	movq	%rax, %rsi
	call	create_arg
	movq	%rbx, %rdx
	movq	%r12, %rsi
	movl	$15, %edi
	movq	%rax, %rcx
	jmp	.L136
.L108:
	cmpl	$3, %ecx
	jne	.L114
	movq	8(%rax), %rax
	movq	8(%rax), %rcx
	movl	32(%rax), %eax
	subl	$3, %eax
	cmpl	$2, %eax
	ja	.L131
	movq	%rcx, 8(%rsp)
	movq	%rcx, %rdi
	leaq	.LC13(%rip), %rsi
	call	*strcmp@GOTPCREL(%rip)
	movq	8(%rsp), %rcx
	testl	%eax, %eax
	je	.L116
.L131:
	leaq	.LC12(%rip), %rdx
.L129:
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L133
.L116:
	movq	8(%r13), %rdi
	movq	%rbp, %rsi
	call	tac_expression
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	stderr(%rip), %rsi
	leaq	.LC14(%rip), %rdi
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L128
	movq	8(%rbx), %rax
	movq	%rbp, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	movq	(%rax), %rsi
	call	create_var
	xorl	%edi, %edi
	movq	%rax, %rsi
	call	create_arg
	movq	%r13, %rcx
	movq	%rbx, %rdx
	movl	$16, %edi
	movq	%rax, %r12
	movq	%rax, %rsi
.L136:
	call	create_instruction
	movb	$1, 20(%r12)
	movq	%rax, %rsi
	jmp	.L132
.L114:
	cmpl	$1, %ecx
	jne	.L118
	cmpl	$0, 16(%rax)
	jne	.L119
	movq	8(%rax), %rax
	cmpl	$0, 32(%rax)
	jne	.L119
	movq	8(%rax), %rdi
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rdi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	%rbp, %rcx
	movl	$102, %edx
	movq	(%rax), %rsi
	movq	%rax, %rdi
	call	create_var
	movl	$7, %edi
	movq	%rax, %rsi
	call	create_arg
	movq	%rax, %rbx
.L119:
	movl	16(%rbx), %ecx
	cmpl	$7, %ecx
	je	.L120
	movq	8(%rbx), %rax
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	leaq	.LC15(%rip), %rdx
	movq	8(%rax), %r8
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L133:
	xorl	%r12d, %r12d
	jmp	.L101
.L120:
	movq	8(%r13), %rdi
	leaq	24(%rsp), %r13
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
	xorl	%eax, %eax
	movq	%rax, 16(%rsp)
.L122:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L137
	movq	%rbp, %rsi
	call	tac_expression
	movq	8(%rax), %rdi
	movq	%rax, %r14
	call	get_type_size
	movq	%r13, %rsi
	movl	$1, %edi
	movq	%rax, 24(%rsp)
	call	create_arg
	xorl	%ecx, %ecx
	movq	%r14, %rdx
	movl	$17, %edi
	movq	%rax, %rsi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	incq	16(%rsp)
	jmp	.L122
.L137:
	movq	8(%rbx), %rsi
	movq	%rbp, %rcx
	movl	$116, %edx
	call	create_var
	xorl	%edi, %edi
	movq	%rax, %rsi
	call	create_arg
	leaq	16(%rsp), %rsi
	movl	$1, %edi
	movq	%rax, %r12
	call	create_arg
	movq	%r12, %rsi
	movq	%rbx, %rdx
	movl	$22, %edi
	movq	%rax, %rcx
	call	create_instruction
	movq	%rax, %rsi
.L132:
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L101
.L118:
	movq	stderr(%rip), %rdi
	leaq	.LC16(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L133
.L101:
	addq	$32, %rsp
	movq	%r12, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	tac_variable_access, .-tac_variable_access
	.section	.rodata.str1.1
.LC18:
	.string	"[warning] Unsupported type for negation: %s\n"
.LC19:
	.string	"[warning] Unsupported primary type for tac_primary: %d\n"
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
	ja	.L139
	leaq	.L141(%rip), %rdx
	movq	%rsi, %rbp
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L141:
	.long	.L149-.L141
	.long	.L148-.L141
	.long	.L147-.L141
	.long	.L146-.L141
	.long	.L145-.L141
	.long	.L144-.L141
	.long	.L143-.L141
	.long	.L142-.L141
	.long	.L140-.L141
	.text
.L149:
	movq	(%rdi), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	*strtoll@GOTPCREL(%rip)
	leaq	8(%rsp), %rsi
	movl	$1, %edi
	movq	%rax, 8(%rsp)
	jmp	.L158
.L148:
	movq	(%rdi), %rdi
	xorl	%esi, %esi
	call	*strtod@GOTPCREL(%rip)
	leaq	8(%rsp), %rsi
	movl	$2, %edi
	movsd	%xmm0, 8(%rsp)
.L158:
	call	create_arg
	movq	%rax, %rbx
	jmp	.L138
.L147:
	movq	(%rdi), %rsi
	addq	$16, %rsp
	movl	$3, %edi
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	create_arg
.L146:
	movb	$1, 8(%rsp)
	jmp	.L159
.L145:
	movb	$0, 8(%rsp)
.L159:
	leaq	8(%rsp), %rsi
	movl	$4, %edi
	jmp	.L158
.L144:
	movq	(%rdi), %rdi
	addq	$16, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	tac_expression
.L143:
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
	jmp	.L156
.L142:
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
	movq	.LC17(%rip), %rax
	movq	%r10, (%rsp)
	movq	%rax, 8(%rsp)
	movq	8(%r12), %rax
	cmpq	name_int(%rip), %rax
	jne	.L151
	movq	%rsp, %rsi
	movl	$1, %edi
	call	create_arg
	movq	%r12, %rcx
	movq	%rbx, %rsi
	movl	$1, %edi
	movq	%rax, %rdx
	jmp	.L156
.L151:
	cmpq	name_float(%rip), %rax
	jne	.L153
	leaq	8(%rsp), %rsi
	movl	$2, %edi
	call	create_arg
	movq	%r12, %rcx
	movq	%rbx, %rsi
	movl	$2, %edi
	movq	%rax, %rdx
.L156:
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L138
.L153:
	movq	8(%rax), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC18(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L157
.L140:
	movq	(%rdi), %rdi
	addq	$16, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	tac_variable_access
.L139:
	movq	stderr(%rip), %rdi
	leaq	.LC19(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L157:
	xorl	%ebx, %ebx
.L138:
	addq	$16, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	tac_primary, .-tac_primary
	.section	.rodata.str1.1
.LC20:
	.string	"[warning] Left-hand side of assignment is not a variable\n"
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
	jne	.L161
	movq	8(%rdi), %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	tac_primary
.L161:
	movq	16(%rdi), %rdi
	movl	$25, %r14d
	call	tac_expression
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	%rax, %r12
	movl	24(%r13), %eax
	cmpl	$18, %eax
	ja	.L162
	leaq	CSWTCH.43(%rip), %rdx
	movzbl	(%rdx,%rax), %r14d
.L162:
	movq	0(%r13), %rdi
	movq	%rbx, %rsi
	call	tac_expression
	movq	%rax, %rbp
	movl	24(%r13), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L163
	cmpl	$14, %r14d
	je	.L164
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
.L164:
	cmpl	$0, 16(%rbp)
	je	.L165
	movq	stderr(%rip), %rsi
	leaq	.LC20(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L165:
	xorl	%ecx, %ecx
	movq	%rbp, %rsi
	movq	%r12, %rdx
	movl	$14, %edi
	call	create_instruction
	cmpb	$0, 20(%rbp)
	movq	%rax, %rsi
	je	.L166
	movq	%rbp, %rsi
	xorl	%ecx, %ecx
	movq	%r12, %rdx
	movl	$24, %edi
	call	create_instruction
	movq	%rax, %rsi
	jmp	.L166
.L163:
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
.L166:
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
	jne	.L173
.L175:
	movq	%rbx, %rcx
	movl	$98, %edx
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	create_var
	movq	%rax, %r13
	jmp	.L174
.L173:
	movq	24(%r12), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L175
	movq	%rbp, %r13
.L174:
	movq	%r13, %rsi
	movl	$6, %edi
	call	create_arg
	movq	(%r12), %rdi
	movq	%rbx, %rsi
	movq	%rax, (%rsp)
	call	tac_expression
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
.L176:
	movq	%r14, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L196
	movq	%rbx, %rsi
	call	tac_statement
	jmp	.L176
.L196:
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
	jne	.L178
	movq	16(%r12), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
.L179:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L178
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
	xorl	%esi, %esi
	xorl	%edi, %edi
	movq	%rbx, %rcx
	movl	$98, %edx
	movq	%rax, 16(%rsp)
	call	create_var
	movq	(%r14), %rdi
	movq	%rbx, %rsi
	movq	%rax, %rbp
	call	tac_expression
	movq	8(%rsp), %rdi
	movq	%rax, %r15
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L181
	movq	24(%r12), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	cmovne	%r13, %rbp
.L181:
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
.L182:
	movq	%r14, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L197
	movq	%rbx, %rsi
	call	tac_statement
	jmp	.L182
.L197:
	movq	(%rsp), %rsi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$20, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L179
.L178:
	movq	24(%r12), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L185
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
.L186:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L198
	movq	%rbx, %rsi
	call	tac_statement
	jmp	.L186
.L198:
	movq	(%rsp), %rsi
	movl	$20, %edi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L185:
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
	.string	"[warning] 'break' statement used outside of loop\n"
.LC22:
	.string	"[warning] 'continue' statement used outside of loop\n"
.LC23:
	.string	"[warning] Unsupported statement type for tac_statement: %d\n"
	.text
	.globl	tac_statement
	.type	tac_statement, @function
tac_statement:
	movl	8(%rdi), %ecx
	cmpl	$7, %ecx
	ja	.L200
	leaq	.L202(%rip), %rdx
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
.L202:
	.long	.L209-.L202
	.long	.L199-.L202
	.long	.L207-.L202
	.long	.L206-.L202
	.long	.L205-.L202
	.long	.L204-.L202
	.long	.L203-.L202
	.long	.L201-.L202
	.text
.L209:
	movq	(%rdi), %rdi
	popq	%r11
	popq	%rbx
	popq	%rbp
	jmp	tac_expression
.L207:
	movq	(%rdi), %rdi
	popq	%r10
	popq	%rbx
	popq	%rbp
	jmp	tac_if
.L206:
	movq	(%rdi), %rdi
	popq	%r9
	popq	%rbx
	popq	%rbp
	jmp	tac_while
.L205:
	movq	(%rdi), %rdi
	popq	%r8
	popq	%rbx
	popq	%rbp
	jmp	tac_for
.L204:
	movl	$5, %edi
	xorl	%esi, %esi
	call	create_arg
	movq	0(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L210
	movq	%rbx, %rsi
	call	tac_expression
.L210:
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rax, %rsi
	movl	$21, %edi
	jmp	.L225
.L203:
	movq	32(%rsi), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L211
	movq	32(%rbx), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rsi
	testq	%rsi, %rsi
	je	.L211
.L227:
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$20, %edi
.L225:
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	popq	%rcx
	popq	%rbx
	popq	%rbp
	jmp	*list_append@GOTPCREL(%rip)
.L211:
	movq	stderr(%rip), %rsi
	leaq	.LC21(%rip), %rdi
	jmp	.L226
.L201:
	movq	40(%rsi), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L212
	movq	40(%rbx), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rsi
	testq	%rsi, %rsi
	jne	.L227
.L212:
	movq	stderr(%rip), %rsi
	leaq	.LC22(%rip), %rdi
.L226:
	popq	%rdx
	popq	%rbx
	popq	%rbp
	jmp	*fputs@GOTPCREL(%rip)
.L200:
	movq	stderr(%rip), %rdi
	leaq	.LC23(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	jmp	*__fprintf_chk@GOTPCREL(%rip)
.L199:
	popq	%rax
	popq	%rbx
	popq	%rbp
	ret
	.size	tac_statement, .-tac_statement
	.globl	tac_for
	.type	tac_for, @function
tac_for:
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
	je	.L229
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
	jmp	.L239
.L229:
	movq	%r12, %rsi
	movl	$6, %edi
	call	create_arg
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$20, %edi
	movq	%rax, %rsi
.L239:
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
	jne	.L240
	cmpq	$0, 8(%rbp)
	movq	%r13, %rsi
	jne	.L240
	movq	%r12, %rsi
.L240:
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
.L234:
	movq	%r15, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L241
	movq	%rbx, %rsi
	call	tac_statement
	jmp	.L234
.L241:
	movq	40(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	32(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	cmpq	$0, 16(%rbp)
	je	.L236
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
.L236:
	movq	%r13, %rsi
	movl	$6, %edi
	call	create_arg
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$20, %edi
	movq	%rax, %rsi
	call	create_instruction
	cmpq	$0, 8(%rbp)
	jne	.L237
	movq	%r12, %rsi
	movl	$6, %edi
	call	create_arg
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$20, %edi
	movq	%rax, %rsi
	call	create_instruction
.L237:
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
.L243:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L246
	movq	%rbx, %rsi
	call	tac_statement
	jmp	.L243
.L246:
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
.L248:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L253
	movq	8(%rax), %rdi
	movq	(%rax), %rsi
	movq	%rbx, %rcx
	movl	$112, %edx
	call	create_var
	movq	16(%r12), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L248
.L253:
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
.L250:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L254
	movq	%rbx, %rsi
	call	tac_statement
	jmp	.L250
.L254:
	xorl	%eax, %eax
	movq	%rax, 8(%rbx)
	popq	%rdx
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	tac_function, .-tac_function
	.globl	tac_method
	.type	tac_method, @function
tac_method:
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
	je	.L262
	movq	8(%rax), %rdi
	movq	(%rax), %rsi
	movq	%rbx, %rcx
	movl	$112, %edx
	call	create_var
	movq	16(%r12), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L256
.L262:
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
	movq	24(%rbx), %rax
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi
	movq	%r13, 16(%rbx)
	movq	(%rax), %rax
	movq	8(%rax), %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	0(%rbp), %rax
	movq	8(%rax), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L258
	movq	24(%rbx), %rax
	movq	%rbx, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	movq	(%rax), %rsi
	call	create_var
	xorl	%edi, %edi
	movq	%rax, %rsi
	call	create_arg
	movl	$1, %edi
	movq	%rax, %r12
	movq	24(%rbx), %rax
	leaq	24(%rax), %rsi
	call	create_arg
	movq	%r12, %rsi
	movl	$18, %edi
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	call	create_instruction
	movq	8(%r13), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
.L258:
	movq	24(%rbp), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
.L259:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L263
	movq	%rbx, %rsi
	call	tac_statement
	jmp	.L259
.L263:
	xorl	%eax, %eax
	movq	%rax, 8(%rbx)
	popq	%rdx
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	tac_method, .-tac_method
	.section	.rodata.str1.1
.LC24:
	.string	"[warning] Unsupported class member type for tac_class: %d\n"
	.text
	.globl	tac_class
	.type	tac_class, @function
tac_class:
	pushq	%r14
	pushq	%r13
	movq	%rdi, %r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	movq	%rdi, 24(%rsi)
	movq	8(%rdi), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movl	$24, %edi
	movq	0(%r13), %r14
	movq	%rax, %r12
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	call	*create_list@GOTPCREL(%rip)
	movq	%r14, 8(%rbp)
	movq	%rbp, %rsi
	movq	%rax, 0(%rbp)
	movq	24(%r13), %rax
	movq	%rax, 16(%rbp)
	movq	(%rbx), %rax
	leaq	.LC24(%rip), %rbp
	movq	(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L265:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L273
	movl	8(%rax), %ecx
	testl	%ecx, %ecx
	je	.L266
	cmpl	$1, %ecx
	jne	.L274
	movq	(%rax), %rdi
	movl	$97, %edx
	movq	%rbx, %rsi
	call	tac_variable
	jmp	.L265
.L266:
	movq	(%rax), %rdi
	movq	%rbx, %rsi
	call	tac_method
	jmp	.L265
.L274:
	movq	stderr(%rip), %rdi
	movq	%rbp, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L265
.L273:
	xorl	%eax, %eax
	movq	%rax, 24(%rbx)
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	tac_class, .-tac_class
	.section	.rodata.str1.1
.LC25:
	.string	"main"
	.text
	.globl	tac_code
	.type	tac_code, @function
tac_code:
	pushq	%r14
	leaq	.LC25(%rip), %r14
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
.L276:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L284
	movl	8(%r12), %eax
	cmpl	$1, %eax
	jne	.L277
	movq	(%r12), %rdi
	movq	%rbx, %rsi
	call	tac_function
	movq	(%r12), %rax
	movq	%r14, %rsi
	movq	(%rax), %r12
	movq	8(%r12), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L276
	movq	%r12, 8(%rbp)
	jmp	.L276
.L277:
	cmpl	$2, %eax
	jne	.L280
	movq	(%r12), %rdi
	movq	%rbx, %rsi
	call	tac_class
	jmp	.L276
.L280:
	testl	%eax, %eax
	jne	.L276
	movq	(%r12), %rdi
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	call	tac_import
	jmp	.L276
.L284:
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
	.type	CSWTCH.43, @object
	.size	CSWTCH.43, 19
CSWTCH.43:
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
.LC17:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
