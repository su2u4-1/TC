	.file	"codegen.c"
	.text
	.type	find_var_by_symbol, @function
find_var_by_symbol:
	testq	%rdi, %rdi
	je	.L6
	testq	%rsi, %rsi
	je	.L6
	movq	(%rdi), %rdx
.L3:
	testq	%rdx, %rdx
	je	.L6
	movq	8(%rdx), %rax
	testq	%rax, %rax
	je	.L4
	cmpq	%rsi, (%rax)
	je	.L1
.L4:
	movq	(%rdx), %rdx
	jmp	.L3
.L6:
	xorl	%eax, %eax
.L1:
	ret
	.size	find_var_by_symbol, .-find_var_by_symbol
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
	pushq	%r13
	movq	%rdi, %r13
	movl	$24, %edi
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$24, %rsp
	movl	%edx, (%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	(%rsp), %r8d
	movq	%r13, (%rax)
	movq	%rax, %rbp
	cmpl	$112, %r8d
	je	.L18
	ja	.L19
	cmpl	$98, %r8d
	je	.L20
	cmpl	$102, %r8d
	je	.L21
	cmpl	$97, %r8d
	je	.L22
	jmp	.L29
.L19:
	cmpl	$116, %r8d
	je	.L24
	cmpl	$118, %r8d
	je	.L25
.L29:
	orq	$-1, %r9
	jmp	.L23
.L22:
	movq	40(%rbx), %r9
	leaq	1(%r9), %rax
	movq	%rax, 40(%rbx)
	jmp	.L23
.L18:
	movq	48(%rbx), %r9
	leaq	1(%r9), %rax
	movq	%rax, 48(%rbx)
	jmp	.L23
.L25:
	movq	56(%rbx), %r9
	leaq	1(%r9), %rax
	movq	%rax, 56(%rbx)
	jmp	.L23
.L24:
	movq	64(%rbx), %r9
	leaq	1(%r9), %rax
	movq	%rax, 64(%rbx)
	jmp	.L23
.L20:
	movq	72(%rbx), %r9
	leaq	1(%r9), %rax
	movq	%rax, 72(%rbx)
	jmp	.L23
.L21:
	movq	80(%rbx), %r9
	leaq	1(%r9), %rax
	movq	%rax, 80(%rbx)
.L23:
	movq	%r9, (%rsp)
	leaq	.LC0(%rip), %rdi
	movl	$32, %esi
	movl	%r8d, 12(%rsp)
	call	*create_string@GOTPCREL(%rip)
	movq	(%rsp), %r9
	movl	12(%rsp), %r8d
	movq	%rax, 8(%rbp)
	movq	%rax, %rdi
	cmpq	$-1, %r9
	jne	.L26
	leaq	.LC1(%rip), %rcx
	orq	$-1, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L27
.L26:
	leaq	.LC2(%rip), %rcx
	orq	$-1, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
.L27:
	movq	%r12, 16(%rbp)
	addq	$24, %rsp
	movq	%rbp, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
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
	je	.L38
	cmpq	%rdi, name_int(%rip)
	je	.L39
	cmpq	%rdi, name_float(%rip)
	je	.L39
	cmpq	%rdi, name_string(%rip)
	je	.L39
	cmpq	%rdi, name_bool(%rip)
	movl	$1, %eax
	je	.L38
	cmpq	%rdi, name_void(%rip)
	je	.L38
	cmpl	$0, 32(%rdi)
	jne	.L33
	movq	24(%rdi), %rax
	movq	24(%rax), %rax
	ret
.L33:
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
.L39:
	movl	$8, %eax
	ret
.L38:
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
	ja	.L43
	leaq	.L44(%rip), %rcx
	movslq	(%rcx,%rbp,4), %rdx
	addq	%rcx, %rdx
	jmp	*%rdx
	.section	.rodata
	.align 4
	.align 4
.L44:
	.long	.L50-.L44
	.long	.L49-.L44
	.long	.L48-.L44
	.long	.L47-.L44
	.long	.L46-.L44
	.long	.L45-.L44
	.long	.L43-.L44
	.text
.L50:
	movq	(%rbx), %rdx
	movq	%rdx, (%rax)
	movq	name_int(%rip), %rdx
	jmp	.L53
.L49:
	movsd	(%rbx), %xmm0
	movq	name_float(%rip), %rdx
	movsd	%xmm0, (%rax)
	jmp	.L53
.L48:
	movq	%rbx, (%rax)
	movq	name_string(%rip), %rdx
	jmp	.L53
.L47:
	movb	(%rbx), %dl
	movb	%dl, (%rax)
	movq	name_bool(%rip), %rdx
	jmp	.L53
.L46:
	xorl	%ecx, %ecx
	movq	name_void(%rip), %rdx
	movq	%rcx, (%rax)
	jmp	.L53
.L45:
	movq	%rbx, (%rax)
	jmp	.L51
.L43:
	movq	%rbx, (%rax)
	movq	16(%rbx), %rdx
.L53:
	movq	%rdx, 8(%rax)
.L51:
	movb	$0, 20(%rax)
	popq	%rdx
	popq	%rbx
	popq	%rbp
	ret
	.size	create_arg, .-create_arg
	.type	emit_param_instruction, @function
emit_param_instruction:
	testq	%rdi, %rdi
	je	.L57
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	subq	$24, %rsp
	testq	%rsi, %rsi
	je	.L54
	movq	%rdi, %rbx
	movq	8(%rdi), %rdi
	call	get_type_size
	leaq	8(%rsp), %rsi
	movl	$1, %edi
	movq	%rax, 8(%rsp)
	call	create_arg
	movl	$17, %edi
	xorl	%ecx, %ecx
	movq	%rbx, %rdx
	movq	%rax, %rsi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L54:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	ret
.L57:
	ret
	.size	emit_param_instruction, .-emit_param_instruction
	.type	load_rvalue, @function
load_rvalue:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	testq	%rdi, %rdi
	je	.L61
	cmpb	$0, 20(%rdi)
	je	.L61
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
.L61:
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	load_rvalue, .-load_rvalue
	.section	.rodata.str1.1
.LC4:
	.string	"<unknown>"
.LC5:
	.string	"[warning] Invalid attribute access\n"
.LC6:
	.string	"[warning] Attribute '%s' not found in class '%s', fallback index %zu\n"
.LC7:
	.string	"$a%zu"
	.text
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
	je	.L87
	movq	%rsi, %rbp
	testq	%rsi, %rsi
	jne	.L67
.L87:
	movq	stderr(%rip), %rsi
	leaq	.LC5(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	jmp	.L69
.L67:
	movq	%rdx, %rsi
	movq	%rdx, %r12
	call	load_rvalue
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L70
.L69:
	xorl	%ebp, %ebp
	jmp	.L66
.L70:
	movq	8(%rax), %r13
	testq	%r13, %r13
	je	.L72
	cmpl	$0, 32(%r13)
	je	.L72
	xorl	%r13d, %r13d
.L72:
	movq	(%r12), %rax
	movq	(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbx
.L73:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L76
	cmpq	%r13, 8(%rax)
	jne	.L73
	movq	(%rax), %rdi
	testq	%rdi, %rdi
	jne	.L77
.L76:
	movq	0(%rbp), %rsi
	movq	%r12, %rcx
	movl	$97, %edx
	movq	%rbp, %rdi
	call	create_var
	movq	%rax, %rbx
	jmp	.L78
.L77:
	call	*list_copy@GOTPCREL(%rip)
	xorl	%r15d, %r15d
	movq	%rax, %rbx
.L79:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L93
	cmpq	(%rax), %rbp
	je	.L85
	incq	%r15
	jmp	.L79
.L93:
	xorl	%edx, %edx
	jmp	.L80
.L85:
	movb	$1, %dl
.L80:
	movb	%dl, 15(%rsp)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %esi
	leaq	.LC0(%rip), %rdi
	movq	%rbp, (%rax)
	movq	%rax, %rbx
	movq	0(%rbp), %rax
	movq	%rax, 16(%rbx)
	call	*create_string@GOTPCREL(%rip)
	movb	15(%rsp), %dl
	movq	%rax, 8(%rbx)
	testb	%dl, %dl
	jne	.L82
	leaq	.LC4(%rip), %r8
	testq	%r13, %r13
	je	.L83
	movq	8(%r13), %r8
.L83:
	movq	8(%rbp), %rcx
	movq	stderr(%rip), %rdi
	movq	%r15, %r9
	xorl	%eax, %eax
	leaq	.LC6(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
.L82:
	movq	8(%rbx), %rdi
	movq	%r15, %r8
	leaq	.LC7(%rip), %rcx
	xorl	%eax, %eax
	orq	$-1, %rdx
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
.L78:
	movq	0(%rbp), %rsi
	movq	%r12, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	call	create_var
	xorl	%edi, %edi
	movq	%rax, %rsi
	call	create_arg
	movq	%rbx, %rsi
	xorl	%edi, %edi
	movq	%rax, %rbp
	call	create_arg
	movq	%r14, %rdx
	movq	%rbp, %rsi
	movl	$15, %edi
	movq	%rax, %rcx
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%r12), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movb	$1, 20(%rbp)
.L66:
	addq	$24, %rsp
	movq	%rbp, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	emit_attribute_access, .-emit_attribute_access
	.section	.rodata.str1.1
.LC8:
	.string	"[warning] Unsupported symbol kind for import: %d\n"
	.text
	.globl	codegen_import
	.type	codegen_import, @function
codegen_import:
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	pushq	%rbx
	movq	(%rdi), %rbp
	movl	32(%rbp), %ecx
	cmpl	$3, %ecx
	jne	.L95
	movq	%rdx, %rcx
	movl	$118, %edx
	jmp	.L99
.L95:
	leal	-1(%rcx), %eax
	cmpl	$1, %eax
	ja	.L96
	movq	%rdx, %rcx
	movl	$102, %edx
.L99:
	movq	0(%rbp), %rsi
	movq	%rbp, %rdi
	call	create_var
	movq	16(%r12), %rdi
	movq	%rax, %rsi
.L100:
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	*list_append@GOTPCREL(%rip)
.L96:
	testl	%ecx, %ecx
	jne	.L97
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
	jmp	.L100
.L97:
	popq	%rbx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbp
	leaq	.LC8(%rip), %rdx
	popq	%r12
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.size	codegen_import, .-codegen_import
	.section	.rodata.str1.1
.LC9:
	.string	"Error: create_attribute received NULL table or attributes list\n"
.LC10:
	.string	"[warning] Unsupported variable type for codegen_variable: %d\n"
	.text
	.globl	codegen_variable
	.type	codegen_variable, @function
codegen_variable:
	pushq	%r13
	movq	%rsi, %rcx
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movl	%edx, %ebx
	pushq	%r11
	movq	(%r12), %rsi
	movq	8(%rdi), %rdi
	call	create_var
	movq	%rax, %rsi
	cmpl	$112, %ebx
	je	.L102
	ja	.L103
	cmpl	$97, %ebx
	je	.L104
	cmpl	$102, %ebx
	jne	.L106
	movq	0(%rbp), %rax
	jmp	.L112
.L103:
	cmpl	$116, %ebx
	je	.L108
	cmpl	$118, %ebx
	je	.L108
	jmp	.L106
.L102:
	movq	8(%rbp), %rax
	jmp	.L112
.L108:
	movq	8(%rbp), %rax
	movq	24(%rax), %rdi
.L111:
	popq	%r10
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	*list_append@GOTPCREL(%rip)
.L112:
	movq	16(%rax), %rdi
	jmp	.L111
.L104:
	movq	0(%rbp), %rax
	movq	(%rax), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	0(%rbp), %rax
	movq	%rbx, %rsi
	movq	(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	(%r12), %r13
	movq	8(%r12), %r12
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r12, (%rax)
	movq	%rax, %rbp
	movq	%r13, %rdi
	movq	%r13, 8(%rax)
	movq	16(%rbx), %rax
	movq	%rax, 16(%rbp)
	call	get_type_size
	movq	(%rbx), %rdi
	addq	%rax, 16(%rbx)
	movq	%rbp, %rsi
	testq	%rdi, %rdi
	jne	.L111
	movq	stderr(%rip), %rsi
	leaq	.LC9(%rip), %rdi
	popq	%r9
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	*fputs@GOTPCREL(%rip)
.L106:
	movq	stderr(%rip), %rdi
	movl	%ebx, %ecx
	popq	%r8
	movl	$2, %esi
	popq	%rbx
	leaq	.LC10(%rip), %rdx
	popq	%rbp
	xorl	%eax, %eax
	popq	%r12
	popq	%r13
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.size	codegen_variable, .-codegen_variable
	.section	.rodata.str1.1
.LC11:
	.string	"[warning] Invalid variable access input\n"
.LC12:
	.string	"[warning] Variable access name is NULL\n"
.LC13:
	.string	"[warning] Unresolved variable access for '%s', creating fallback local\n"
.LC14:
	.string	"[warning] Invalid get-attribute access\n"
.LC15:
	.string	"[warning] Failed to generate object for get-attribute access\n"
.LC16:
	.string	"[warning] Invalid get-sequence access\n"
.LC17:
	.string	"[warning] Failed to generate sequence/index for get-sequence access\n"
.LC18:
	.string	"[warning] Invalid function call without callee\n"
.LC19:
	.string	"[warning] Failed to generate callee for function call\n"
.LC20:
	.string	"[warning] Unsupported callee in function call\n"
.LC21:
	.string	"[warning] Failed to generate function call argument\n"
.LC22:
	.string	"[warning] Unsupported variable access type for codegen_variable_access: %d\n"
	.text
	.globl	codegen_variable_access
	.type	codegen_variable_access, @function
codegen_variable_access:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$24, %rsp
	testq	%rdi, %rdi
	je	.L159
	movq	%rsi, %rbx
	testq	%rsi, %rsi
	jne	.L114
.L159:
	movq	stderr(%rip), %rsi
	leaq	.LC11(%rip), %rdi
	jmp	.L202
.L114:
	movl	16(%rdi), %ecx
	movq	%rdi, %rbp
	testl	%ecx, %ecx
	jne	.L117
	movq	8(%rdi), %rbp
	movq	stderr(%rip), %rsi
	leaq	.LC12(%rip), %rdi
	testq	%rbp, %rbp
	je	.L202
	movq	8(%rbx), %rcx
	testq	%rcx, %rcx
	je	.L120
	movq	16(%rcx), %rdi
	movq	%rbp, %rsi
	call	find_var_by_symbol
	testq	%rax, %rax
	jne	.L206
	movq	24(%rcx), %rdi
	call	find_var_by_symbol
	testq	%rax, %rax
	jne	.L206
.L120:
	movq	(%rbx), %rax
	movq	%rbp, %rsi
	movq	16(%rax), %rdi
	call	find_var_by_symbol
	testq	%rax, %rax
	jne	.L206
	cmpl	$2, 32(%rbp)
	ja	.L123
.L205:
	movq	0(%rbp), %rsi
	movq	%rbp, %rdi
	movq	%rbx, %rcx
	movl	$102, %edx
	call	create_var
	movl	$7, %edi
	movq	%rax, %rsi
.L204:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	create_arg
.L123:
	testq	%rcx, %rcx
	je	.L124
	movq	16(%rcx), %rax
	movq	(%rax), %r13
.L125:
	testq	%r13, %r13
	je	.L124
	movq	8(%r13), %r12
	testq	%r12, %r12
	jne	.L126
.L127:
	movq	0(%r13), %r13
	jmp	.L125
.L126:
	movq	(%r12), %rax
	testq	%rax, %rax
	je	.L127
	movq	8(%rax), %rdi
	movq	SELF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L127
	movq	16(%r12), %rax
	testq	%rax, %rax
	je	.L124
	cmpl	$0, 32(%rax)
	je	.L207
.L124:
	movq	8(%rbp), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC13(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	0(%rbp), %rsi
	movq	%rbx, %rcx
	movq	%rbp, %rdi
	movl	$118, %edx
	call	create_var
.L206:
	movq	%rax, %rsi
	xorl	%edi, %edi
	jmp	.L204
.L117:
	cmpl	$2, %ecx
	jne	.L130
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L131
	movq	8(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L132
.L131:
	movq	stderr(%rip), %rsi
	leaq	.LC14(%rip), %rdi
	jmp	.L202
.L132:
	movl	32(%rbp), %eax
	decl	%eax
	cmpl	$1, %eax
	jbe	.L205
	call	codegen_variable_access
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L134
	movq	stderr(%rip), %rsi
	leaq	.LC15(%rip), %rdi
	jmp	.L202
.L207:
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	cmpq	%rax, 24(%rbp)
	jne	.L124
	xorl	%edi, %edi
	movq	%r12, %rsi
	call	create_arg
	movq	%rax, %rdi
.L134:
	addq	$24, %rsp
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	emit_attribute_access
.L130:
	cmpl	$3, %ecx
	jne	.L135
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L136
	cmpq	$0, 8(%rbp)
	jne	.L137
.L136:
	movq	stderr(%rip), %rsi
	leaq	.LC16(%rip), %rdi
	jmp	.L202
.L137:
	call	codegen_variable_access
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	8(%rbp), %rdi
	movq	%rbx, %rsi
	movq	%rax, %r12
	call	codegen_expression
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	%rax, %r13
	testq	%r12, %r12
	je	.L160
	testq	%rax, %rax
	jne	.L138
.L160:
	movq	stderr(%rip), %rsi
	leaq	.LC17(%rip), %rdi
	jmp	.L202
.L138:
	movq	8(%r12), %rsi
	cmpq	name_float(%rip), %rsi
	movq	name_int(%rip), %rax
	je	.L140
	cmpq	name_bool(%rip), %rsi
	je	.L140
	cmpq	name_string(%rip), %rsi
	je	.L140
	movq	%rax, %rsi
.L140:
	movq	%rbx, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	call	create_var
	xorl	%edi, %edi
	movq	%rax, %rsi
	call	create_arg
	movq	%r13, %rcx
	movq	%r12, %rdx
	movl	$16, %edi
	movq	%rax, %rsi
	movq	%rax, %rbp
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movb	$1, 20(%rbp)
	jmp	.L113
.L135:
	cmpl	$1, %ecx
	jne	.L141
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L142
	movq	stderr(%rip), %rsi
	leaq	.LC18(%rip), %rdi
	jmp	.L202
.L142:
	cmpl	$2, 16(%rdi)
	jne	.L144
	movq	8(%rdi), %r12
	testq	%r12, %r12
	je	.L144
	movl	32(%r12), %eax
	decl	%eax
	cmpl	$1, %eax
	ja	.L144
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L158
	cmpl	$0, 16(%rdi)
	jne	.L146
	movq	8(%rdi), %rax
	testq	%rax, %rax
	je	.L146
	cmpl	$0, 32(%rax)
	je	.L158
.L146:
	movq	%rbx, %rsi
	call	codegen_variable_access
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L158
	movq	%rbx, %rsi
	movl	$1, %r13d
	call	emit_param_instruction
	jmp	.L148
.L144:
	movq	%rbx, %rsi
	call	codegen_variable_access
	testq	%rax, %rax
	jne	.L149
	movq	stderr(%rip), %rsi
	leaq	.LC19(%rip), %rdi
.L202:
	call	*fputs@GOTPCREL(%rip)
.L203:
	xorl	%ebp, %ebp
	jmp	.L113
.L149:
	movl	16(%rax), %edx
	cmpl	$7, %edx
	jne	.L151
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L152
	movq	(%rax), %r12
	testq	%r12, %r12
	jne	.L158
	jmp	.L152
.L151:
	testl	%edx, %edx
	jne	.L152
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L152
	movq	(%rax), %r12
	testq	%r12, %r12
	je	.L152
	movl	32(%r12), %eax
	decl	%eax
	cmpl	$1, %eax
	jbe	.L158
.L152:
	movq	stderr(%rip), %rsi
	leaq	.LC20(%rip), %rdi
	jmp	.L202
.L158:
	xorl	%r13d, %r13d
.L148:
	movq	8(%rbp), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
.L153:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L208
	movq	%rbx, %rsi
	call	codegen_expression
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L154
	movq	stderr(%rip), %rsi
	leaq	.LC21(%rip), %rdi
	jmp	.L202
.L154:
	movq	%rbx, %rsi
	incq	%r13
	call	emit_param_instruction
	jmp	.L153
.L208:
	xorl	%esi, %esi
	movl	$5, %edi
	call	create_arg
	movq	(%r12), %rsi
	movq	%rax, %rbp
	testq	%rsi, %rsi
	je	.L156
	cmpq	name_void(%rip), %rsi
	je	.L156
	movq	%rbx, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	call	create_var
	xorl	%edi, %edi
	movq	%rax, %rsi
	call	create_arg
	movq	%rax, %rbp
.L156:
	movq	(%r12), %rsi
	movq	%rbx, %rcx
	movl	$102, %edx
	movq	%r12, %rdi
	movq	%r13, 8(%rsp)
	call	create_var
	movl	$7, %edi
	movq	%rax, %rsi
	call	create_arg
	leaq	8(%rsp), %rsi
	movl	$1, %edi
	movq	%rax, %r12
	call	create_arg
	movq	%rbp, %rsi
	movq	%r12, %rdx
	movl	$22, %edi
	movq	%rax, %rcx
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L113
.L141:
	movq	stderr(%rip), %rdi
	leaq	.LC22(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L203
.L113:
	addq	$24, %rsp
	movq	%rbp, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	codegen_variable_access, .-codegen_variable_access
	.section	.rodata.str1.1
.LC24:
	.string	"[warning] Unsupported type for negation: %s\n"
.LC25:
	.string	"[warning] Unsupported primary type for codegen_primary: %d\n"
	.text
	.globl	codegen_primary
	.type	codegen_primary, @function
codegen_primary:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$16, %rsp
	movl	8(%rdi), %ecx
	cmpl	$8, %ecx
	ja	.L210
	leaq	.L212(%rip), %rdx
	movq	%rsi, %rbp
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L212:
	.long	.L220-.L212
	.long	.L219-.L212
	.long	.L218-.L212
	.long	.L217-.L212
	.long	.L216-.L212
	.long	.L215-.L212
	.long	.L214-.L212
	.long	.L213-.L212
	.long	.L211-.L212
	.text
.L220:
	movq	(%rdi), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	*strtoll@GOTPCREL(%rip)
	leaq	8(%rsp), %rsi
	movl	$1, %edi
	movq	%rax, 8(%rsp)
	jmp	.L229
.L219:
	movq	(%rdi), %rdi
	xorl	%esi, %esi
	call	*strtod@GOTPCREL(%rip)
	leaq	8(%rsp), %rsi
	movl	$2, %edi
	movsd	%xmm0, 8(%rsp)
.L229:
	call	create_arg
	movq	%rax, %rbx
	jmp	.L209
.L218:
	movq	(%rdi), %rsi
	addq	$16, %rsp
	movl	$3, %edi
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	create_arg
.L217:
	movb	$1, 8(%rsp)
	jmp	.L230
.L216:
	movb	$0, 8(%rsp)
.L230:
	leaq	8(%rsp), %rsi
	movl	$4, %edi
	jmp	.L229
.L215:
	movq	(%rdi), %rdi
	addq	$16, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	codegen_expression
.L214:
	movq	(%rdi), %rdi
	call	codegen_primary
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
	jmp	.L227
.L213:
	movq	(%rdi), %rdi
	call	codegen_primary
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
	movq	.LC23(%rip), %rax
	movq	%r10, (%rsp)
	movq	%rax, 8(%rsp)
	movq	8(%r12), %rax
	cmpq	name_int(%rip), %rax
	jne	.L222
	movq	%rsp, %rsi
	movl	$1, %edi
	call	create_arg
	movq	%r12, %rcx
	movq	%rbx, %rsi
	movl	$1, %edi
	movq	%rax, %rdx
	jmp	.L227
.L222:
	cmpq	name_float(%rip), %rax
	jne	.L224
	leaq	8(%rsp), %rsi
	movl	$2, %edi
	call	create_arg
	movq	%r12, %rcx
	movq	%rbx, %rsi
	movl	$2, %edi
	movq	%rax, %rdx
.L227:
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L209
.L224:
	movq	8(%rax), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC24(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L228
.L211:
	movq	(%rdi), %rdi
	addq	$16, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	codegen_variable_access
.L210:
	movq	stderr(%rip), %rdi
	leaq	.LC25(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L228:
	xorl	%ebx, %ebx
.L209:
	addq	$16, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	codegen_primary, .-codegen_primary
	.section	.rodata.str1.1
.LC26:
	.string	"[warning] Left-hand side of assignment is not a variable\n"
	.text
	.globl	codegen_expression
	.type	codegen_expression, @function
codegen_expression:
	pushq	%r14
	pushq	%r13
	movq	%rdi, %r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	cmpl	$19, 24(%rdi)
	movq	%rsi, %rbx
	jne	.L232
	movq	8(%rdi), %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	codegen_primary
.L232:
	movq	16(%rdi), %rdi
	movl	$25, %r14d
	call	codegen_expression
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	%rax, %r12
	movl	24(%r13), %eax
	cmpl	$18, %eax
	ja	.L233
	leaq	CSWTCH.51(%rip), %rdx
	movzbl	(%rdx,%rax), %r14d
.L233:
	movq	0(%r13), %rdi
	movq	%rbx, %rsi
	call	codegen_expression
	movq	%rax, %rbp
	movl	24(%r13), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L234
	cmpl	$14, %r14d
	je	.L235
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
.L235:
	cmpl	$0, 16(%rbp)
	je	.L236
	movq	stderr(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L236:
	xorl	%ecx, %ecx
	movq	%rbp, %rsi
	movq	%r12, %rdx
	movl	$14, %edi
	call	create_instruction
	cmpb	$0, 20(%rbp)
	movq	%rax, %rsi
	je	.L237
	movq	%rbp, %rsi
	xorl	%ecx, %ecx
	movq	%r12, %rdx
	movl	$24, %edi
	call	create_instruction
	movq	%rax, %rsi
	jmp	.L237
.L234:
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
.L237:
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
	.size	codegen_expression, .-codegen_expression
	.globl	codegen_if
	.type	codegen_if, @function
codegen_if:
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
	jne	.L244
.L246:
	movq	%rbx, %rcx
	movl	$98, %edx
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	create_var
	movq	%rax, %r13
	jmp	.L245
.L244:
	movq	24(%r12), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L246
	movq	%rbp, %r13
.L245:
	movq	%r13, %rsi
	movl	$6, %edi
	call	create_arg
	movq	(%r12), %rdi
	movq	%rbx, %rsi
	movq	%rax, (%rsp)
	call	codegen_expression
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
.L247:
	movq	%r14, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L267
	movq	%rbx, %rsi
	call	codegen_statement
	jmp	.L247
.L267:
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
	jne	.L249
	movq	16(%r12), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
.L250:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L249
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
	call	codegen_expression
	movq	8(%rsp), %rdi
	movq	%rax, %r15
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L252
	movq	24(%r12), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	cmovne	%r13, %rbp
.L252:
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
.L253:
	movq	%r14, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L268
	movq	%rbx, %rsi
	call	codegen_statement
	jmp	.L253
.L268:
	movq	(%rsp), %rsi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$20, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L250
.L249:
	movq	24(%r12), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L256
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
.L257:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L269
	movq	%rbx, %rsi
	call	codegen_statement
	jmp	.L257
.L269:
	movq	(%rsp), %rsi
	movl	$20, %edi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L256:
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
	.size	codegen_if, .-codegen_if
	.section	.rodata.str1.1
.LC27:
	.string	"[warning] 'break' statement used outside of loop\n"
.LC28:
	.string	"[warning] 'continue' statement used outside of loop\n"
.LC29:
	.string	"[warning] Unsupported statement type for codegen_statement: %d\n"
	.text
	.globl	codegen_statement
	.type	codegen_statement, @function
codegen_statement:
	movl	8(%rdi), %ecx
	cmpl	$7, %ecx
	ja	.L271
	leaq	.L273(%rip), %rdx
	pushq	%rbx
	movq	%rsi, %rbx
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L273:
	.long	.L280-.L273
	.long	.L279-.L273
	.long	.L278-.L273
	.long	.L277-.L273
	.long	.L276-.L273
	.long	.L275-.L273
	.long	.L274-.L273
	.long	.L272-.L273
	.text
.L280:
	movq	(%rdi), %rdi
	popq	%rbx
	jmp	codegen_expression
.L279:
	movq	(%rdi), %rdi
	movl	$118, %edx
	popq	%rbx
	jmp	codegen_variable
.L278:
	movq	(%rdi), %rdi
	popq	%rbx
	jmp	codegen_if
.L277:
	movq	(%rdi), %rdi
	popq	%rbx
	jmp	codegen_while
.L276:
	movq	(%rdi), %rdi
	popq	%rbx
	jmp	codegen_for
.L275:
	movq	(%rdi), %rdi
	call	codegen_expression
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$21, %edi
	movq	%rax, %rsi
	jmp	.L292
.L274:
	movq	24(%rsi), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L281
	movq	24(%rbx), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rsi
	testq	%rsi, %rsi
	je	.L281
.L294:
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$20, %edi
.L292:
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	popq	%rbx
	movq	8(%rax), %rdi
	jmp	*list_append@GOTPCREL(%rip)
.L281:
	movq	stderr(%rip), %rsi
	leaq	.LC27(%rip), %rdi
	jmp	.L293
.L272:
	movq	32(%rsi), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L282
	movq	32(%rbx), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rsi
	testq	%rsi, %rsi
	jne	.L294
.L282:
	movq	stderr(%rip), %rsi
	leaq	.LC28(%rip), %rdi
.L293:
	popq	%rbx
	jmp	*fputs@GOTPCREL(%rip)
.L271:
	movq	stderr(%rip), %rdi
	leaq	.LC29(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.size	codegen_statement, .-codegen_statement
	.globl	codegen_for
	.type	codegen_for, @function
codegen_for:
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
	je	.L296
	movl	$118, %edx
	call	codegen_variable
.L296:
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
	je	.L297
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
	call	codegen_expression
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
	jmp	.L310
.L297:
	movq	%r12, %rsi
	movl	$6, %edi
	call	create_arg
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$20, %edi
	movq	%rax, %rsi
.L310:
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
	jne	.L311
	cmpq	$0, 8(%rbp)
	movq	%r13, %rsi
	jne	.L311
	movq	%r12, %rsi
.L311:
	movl	$6, %edi
	call	create_arg
	movq	32(%rbx), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movl	$6, %edi
	call	create_arg
	movq	24(%rbx), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	24(%rbp), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r15
.L302:
	movq	%r15, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L312
	movq	%rbx, %rsi
	call	codegen_statement
	jmp	.L302
.L312:
	movq	32(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	24(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	cmpq	$0, 16(%rbp)
	je	.L304
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
	call	codegen_expression
.L304:
	movq	%r13, %rsi
	movl	$6, %edi
	call	create_arg
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$20, %edi
	movq	%rax, %rsi
	call	create_instruction
	cmpq	$0, 8(%rbp)
	jne	.L305
	movq	%r12, %rsi
	movl	$6, %edi
	call	create_arg
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$20, %edi
	movq	%rax, %rsi
	call	create_instruction
.L305:
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
	.size	codegen_for, .-codegen_for
	.globl	codegen_while
	.type	codegen_while, @function
codegen_while:
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
	call	codegen_expression
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
	movq	32(%rbx), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	%r12, %rsi
	movl	$6, %edi
	call	create_arg
	movq	24(%rbx), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	8(%r13), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r13
.L314:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L317
	movq	%rbx, %rsi
	call	codegen_statement
	jmp	.L314
.L317:
	movq	32(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	24(%rbx), %rdi
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
	.size	codegen_while, .-codegen_while
	.globl	codegen_function
	.type	codegen_function, @function
codegen_function:
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
.L319:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L324
	movq	8(%rax), %rdi
	movq	(%rax), %rsi
	movq	%rbx, %rcx
	movl	$112, %edx
	call	create_var
	movq	16(%r12), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L319
.L324:
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
.L321:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L325
	movq	%rbx, %rsi
	call	codegen_statement
	jmp	.L321
.L325:
	xorl	%eax, %eax
	movq	%rax, 8(%rbx)
	popq	%rdx
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	codegen_function, .-codegen_function
	.globl	codegen_method
	.type	codegen_method, @function
codegen_method:
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
.L327:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L332
	movq	8(%rax), %rdi
	movq	(%rax), %rsi
	movq	%rbx, %rcx
	movl	$112, %edx
	call	create_var
	movq	16(%r12), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L327
.L332:
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
.L329:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L333
	movq	%rbx, %rsi
	call	codegen_statement
	jmp	.L329
.L333:
	xorl	%eax, %eax
	movq	%rax, 8(%rbx)
	popq	%rdx
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	codegen_method, .-codegen_method
	.section	.rodata.str1.1
.LC30:
	.string	"[warning] Unsupported class member type for codegen_class: %d\n"
	.text
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
	movq	%rax, %r12
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbx
	call	*create_list@GOTPCREL(%rip)
	movq	%r14, 8(%rbx)
	movq	%rbx, %rsi
	movq	%rax, (%rbx)
	movq	24(%r13), %rax
	movq	%rax, 16(%rbx)
	movq	0(%rbp), %rax
	leaq	.LC30(%rip), %rbx
	movq	(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L335:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L343
	movl	8(%rax), %ecx
	testl	%ecx, %ecx
	je	.L336
	cmpl	$1, %ecx
	jne	.L344
	movq	(%rax), %rdi
	movl	$97, %edx
	movq	%rbp, %rsi
	call	codegen_variable
	jmp	.L335
.L336:
	movq	(%rax), %rdi
	movq	%rbp, %rsi
	call	codegen_method
	jmp	.L335
.L344:
	movq	stderr(%rip), %rdi
	movq	%rbx, %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L335
.L343:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	codegen_class, .-codegen_class
	.section	.rodata.str1.1
.LC31:
	.string	"main"
	.text
	.globl	codegen_code
	.type	codegen_code, @function
codegen_code:
	pushq	%r14
	leaq	.LC31(%rip), %r14
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
	movl	$88, %edi
	movq	%rax, 24(%rbp)
	call	*alloc_memory@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	%rax, %rbx
	movq	%rdx, 8(%rax)
	movq	%rdx, 16(%rax)
	movq	%rbp, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 24(%rbx)
	call	*create_list@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	movq	(%r12), %rdi
	movq	%rax, 32(%rbx)
	movq	%rcx, 40(%rbx)
	movq	%rcx, 48(%rbx)
	movq	%rcx, 56(%rbx)
	movq	%rcx, 64(%rbx)
	movq	%rcx, 72(%rbx)
	movq	%rcx, 80(%rbx)
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r13
.L346:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L354
	movl	8(%r12), %eax
	cmpl	$1, %eax
	jne	.L347
	movq	(%r12), %rdi
	movq	%rbx, %rsi
	call	codegen_function
	movq	(%r12), %rax
	movq	%r14, %rsi
	movq	(%rax), %r12
	movq	8(%r12), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L346
	movq	%r12, 8(%rbp)
	jmp	.L346
.L347:
	cmpl	$2, %eax
	jne	.L350
	movq	(%r12), %rdi
	movq	%rbx, %rsi
	call	codegen_class
	jmp	.L346
.L350:
	testl	%eax, %eax
	jne	.L346
	movq	(%r12), %rdi
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	call	codegen_import
	jmp	.L346
.L354:
	popq	%rbx
	movq	%rbp, %rax
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	codegen_code, .-codegen_code
	.section	.rodata
	.align 16
	.type	CSWTCH.51, @object
	.size	CSWTCH.51, 19
CSWTCH.51:
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
.LC23:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
