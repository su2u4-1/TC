	.file	"codegen.c"
	.text
	.type	find_var_by_symbol, @function
find_var_by_symbol:
	testq	%rdi, %rdi
	je	.L5
	testq	%rsi, %rsi
	je	.L5
	movq	(%rdi), %rax
	testq	%rax, %rax
	jne	.L4
	ret
.L3:
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L8
.L4:
	movq	8(%rax), %rdx
	testq	%rdx, %rdx
	je	.L3
	cmpq	%rsi, (%rdx)
	jne	.L3
	movq	%rdx, %rax
.L1:
	ret
.L8:
	ret
.L5:
	movl	$0, %eax
	ret
	.size	find_var_by_symbol, .-find_var_by_symbol
	.type	create_instruction, @function
create_instruction:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movl	%edi, %r13d
	movq	%rsi, %r12
	movq	%rdx, %rbp
	movq	%rcx, %rbx
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%r13d, 24(%rax)
	movq	%r12, (%rax)
	movq	%rbp, 8(%rax)
	movq	%rbx, 16(%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	create_instruction, .-create_instruction
	.type	create_subroutine, @function
create_subroutine:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %r12
	movq	%rsi, %rbp
	movl	$40, %edi
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
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbp
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%rbp, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 8(%rbx)
	movq	%rbx, %rax
	addq	$8, %rsp
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
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %r13
	movq	%rsi, %r12
	movl	%edx, %ebp
	movq	%rcx, %r14
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%r13, (%rax)
	leal	-97(%rbp), %eax
	cmpl	$21, %eax
	ja	.L26
	movl	%eax, %eax
	leaq	.L18(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L18:
	.long	.L23-.L18
	.long	.L22-.L18
	.long	.L26-.L18
	.long	.L26-.L18
	.long	.L26-.L18
	.long	.L21-.L18
	.long	.L26-.L18
	.long	.L26-.L18
	.long	.L26-.L18
	.long	.L26-.L18
	.long	.L26-.L18
	.long	.L26-.L18
	.long	.L26-.L18
	.long	.L26-.L18
	.long	.L26-.L18
	.long	.L20-.L18
	.long	.L26-.L18
	.long	.L26-.L18
	.long	.L26-.L18
	.long	.L19-.L18
	.long	.L26-.L18
	.long	.L17-.L18
	.text
.L23:
	movq	40(%r14), %r13
	leaq	1(%r13), %rax
	movq	%rax, 40(%r14)
	jmp	.L16
.L20:
	movq	48(%r14), %r13
	leaq	1(%r13), %rax
	movq	%rax, 48(%r14)
	jmp	.L16
.L17:
	movq	56(%r14), %r13
	leaq	1(%r13), %rax
	movq	%rax, 56(%r14)
	jmp	.L16
.L19:
	movq	64(%r14), %r13
	leaq	1(%r13), %rax
	movq	%rax, 64(%r14)
	jmp	.L16
.L22:
	movq	72(%r14), %r13
	leaq	1(%r13), %rax
	movq	%rax, 72(%r14)
	jmp	.L16
.L21:
	movq	80(%r14), %r13
	leaq	1(%r13), %rax
	movq	%rax, 80(%r14)
	jmp	.L16
.L26:
	movq	$-1, %r13
.L16:
	movl	$32, %esi
	leaq	.LC0(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rdi
	movq	%rax, 8(%rbx)
	cmpq	$-1, %r13
	je	.L28
	movq	%r13, %r9
	movl	%ebp, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	movl	$0, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
.L25:
	movq	%r12, 16(%rbx)
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L28:
	movl	%ebp, %r8d
	leaq	.LC1(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	movl	$0, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L25
	.size	create_var, .-create_var
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"[warning] Unsupported type for size lookup: %s\n"
	.text
	.type	get_type_size, @function
get_type_size:
	testq	%rdi, %rdi
	je	.L32
	cmpq	%rdi, name_int(%rip)
	je	.L33
	cmpq	%rdi, name_float(%rip)
	je	.L34
	cmpq	%rdi, name_string(%rip)
	je	.L35
	cmpq	%rdi, name_bool(%rip)
	je	.L36
	cmpq	%rdi, name_void(%rip)
	je	.L37
	cmpl	$0, 32(%rdi)
	jne	.L31
	movq	24(%rdi), %rax
	movq	24(%rax), %rax
	ret
.L31:
	subq	$8, %rsp
	movq	8(%rdi), %rcx
	leaq	.LC3(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$8, %eax
	addq	$8, %rsp
	ret
.L32:
	movl	$0, %eax
	ret
.L33:
	movl	$8, %eax
	ret
.L34:
	movl	$8, %eax
	ret
.L35:
	movl	$8, %eax
	ret
.L36:
	movl	$1, %eax
	ret
.L37:
	movl	$1, %eax
	ret
	.size	get_type_size, .-get_type_size
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"[warning] Unsupported argument type for create_arg: %d\n"
	.text
	.type	create_arg, @function
create_arg:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movl	%edi, %ebp
	movq	%rsi, %r12
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbx
	movl	%ebp, 16(%rax)
	movq	$0, 8(%rax)
	cmpl	$7, %ebp
	ja	.L42
	movl	%ebp, %ebp
	leaq	.L44(%rip), %rdx
	movslq	(%rdx,%rbp,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L44:
	.long	.L51-.L44
	.long	.L50-.L44
	.long	.L49-.L44
	.long	.L48-.L44
	.long	.L47-.L44
	.long	.L46-.L44
	.long	.L45-.L44
	.long	.L43-.L44
	.text
.L51:
	movq	%r12, (%rbx)
	movq	16(%r12), %rax
	movq	%rax, 8(%rbx)
.L52:
	movb	$0, 20(%rbx)
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
.L50:
	movq	(%r12), %rax
	movq	%rax, (%rbx)
	movq	name_int(%rip), %rax
	movq	%rax, 8(%rbx)
	jmp	.L52
.L49:
	movsd	(%r12), %xmm0
	movsd	%xmm0, (%rbx)
	movq	name_float(%rip), %rax
	movq	%rax, 8(%rbx)
	jmp	.L52
.L48:
	movq	%r12, (%rbx)
	movq	name_string(%rip), %rax
	movq	%rax, 8(%rbx)
	jmp	.L52
.L47:
	movzbl	(%r12), %eax
	movb	%al, (%rbx)
	movq	name_bool(%rip), %rax
	movq	%rax, 8(%rbx)
	jmp	.L52
.L46:
	movq	$0, (%rbx)
	movq	name_void(%rip), %rax
	movq	%rax, 8(%rbx)
	jmp	.L52
.L45:
	movq	%r12, (%rbx)
	jmp	.L52
.L43:
	movq	%r12, (%rbx)
	movq	16(%r12), %rax
	movq	%rax, 8(%rbx)
	jmp	.L52
.L42:
	movl	%ebp, %ecx
	leaq	.LC4(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L52
	.size	create_arg, .-create_arg
	.type	emit_param_instruction, @function
emit_param_instruction:
	testq	%rdi, %rdi
	je	.L57
	pushq	%rbp
	pushq	%rbx
	subq	$24, %rsp
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	testq	%rsi, %rsi
	je	.L54
	movq	8(%rdi), %rdi
	call	get_type_size
	movq	%rax, 8(%rsp)
	leaq	8(%rsp), %rsi
	movl	$1, %edi
	call	create_arg
	movq	%rax, %rsi
	movl	$0, %ecx
	movq	%rbx, %rdx
	movl	$17, %edi
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
	movq	%rsi, %rbp
	cmpb	$0, 20(%rdi)
	jne	.L63
.L61:
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
.L63:
	movq	8(%rdi), %rsi
	movq	%rbp, %rcx
	movl	$116, %edx
	movl	$0, %edi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, %r12
	movl	$0, %ecx
	movq	%rbx, %rdx
	movq	%rax, %rsi
	movl	$23, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r12, %rbx
	jmp	.L61
	.size	load_rvalue, .-load_rvalue
	.section	.rodata.str1.1
.LC5:
	.string	"<unknown>"
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"[warning] Invalid attribute access\n"
	.align 8
.LC7:
	.string	"[warning] Attribute '%s' not found in class '%s', fallback index %zu\n"
	.section	.rodata.str1.1
.LC8:
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
	subq	$8, %rsp
	testq	%rdi, %rdi
	je	.L83
	movq	%rsi, %rbx
	movq	%rdx, %r13
	testq	%rsi, %rsi
	je	.L83
	movq	%rdx, %rsi
	call	load_rvalue
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L82
	movq	8(%rax), %rbp
	testq	%rbp, %rbp
	je	.L68
	cmpl	$0, 32(%rbp)
	je	.L68
	movl	$0, %ebp
.L68:
	movq	0(%r13), %rax
	movq	(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
.L69:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L80
	cmpq	8(%rax), %rbp
	jne	.L69
	movq	(%rax), %rdi
	testq	%rdi, %rdi
	je	.L80
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r15
	movl	$0, %r12d
.L73:
	movq	%r15, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L87
	cmpq	(%rax), %rbx
	je	.L74
	addq	$1, %r12
	jmp	.L73
.L83:
	movq	stderr(%rip), %rcx
	movl	$35, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %ebx
	jmp	.L64
.L80:
	movq	(%rbx), %rsi
	movq	%r13, %rcx
	movl	$97, %edx
	movq	%rbx, %rdi
	call	create_var
	movq	%rax, %r15
	jmp	.L72
.L82:
	movq	%rax, %rbx
	jmp	.L64
.L74:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r15
	movq	%rbx, (%rax)
	movq	(%rbx), %rax
	movq	%rax, 16(%r15)
	movl	$32, %esi
	leaq	.LC0(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%r15)
	jmp	.L77
.L87:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r15
	movq	%rbx, (%rax)
	movq	(%rbx), %rax
	movq	%rax, 16(%r15)
	movl	$32, %esi
	leaq	.LC0(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%r15)
	leaq	.LC5(%rip), %r8
	testq	%rbp, %rbp
	je	.L79
	movq	8(%rbp), %r8
.L79:
	movq	8(%rbx), %rcx
	movq	%r12, %r9
	leaq	.LC7(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L77:
	movq	8(%r15), %rdi
	movq	%r12, %r8
	leaq	.LC8(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	movl	$0, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
.L72:
	movq	(%rbx), %rsi
	movq	%r13, %rcx
	movl	$116, %edx
	movl	$0, %edi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, %rbx
	movq	%r15, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	movl	$15, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%r13), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movb	$1, 20(%rbx)
.L64:
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	emit_attribute_access, .-emit_attribute_access
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"[warning] Unsupported symbol kind for import: %d\n"
	.text
	.globl	codegen_import
	.type	codegen_import, @function
codegen_import:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	movq	(%rdi), %rbp
	movl	32(%rbp), %ecx
	cmpl	$3, %ecx
	je	.L94
	leal	-1(%rcx), %eax
	cmpl	$1, %eax
	jbe	.L95
	testl	%ecx, %ecx
	jne	.L92
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r12
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, (%r12)
	movq	%rbp, 8(%r12)
	movq	$0, 16(%r12)
	movq	(%rbx), %rdi
	movq	%r12, %rsi
	call	*list_append@GOTPCREL(%rip)
.L88:
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
.L94:
	movq	0(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$118, %edx
	movq	%rbp, %rdi
	call	create_var
	movq	%rax, %rsi
	movq	16(%rbx), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L88
.L95:
	movq	0(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$102, %edx
	movq	%rbp, %rdi
	call	create_var
	movq	%rax, %rsi
	movq	16(%rbx), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L88
.L92:
	leaq	.LC9(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L88
	.size	codegen_import, .-codegen_import
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"Error: create_attribute received NULL table or attributes list\n"
	.align 8
.LC11:
	.string	"[warning] Unsupported variable type for codegen_variable: %d\n"
	.text
	.globl	codegen_variable
	.type	codegen_variable, @function
codegen_variable:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbx
	movq	%rsi, %r12
	movl	%edx, %ebp
	movq	(%rdi), %rsi
	movq	8(%rdi), %rdi
	movq	%r12, %rcx
	call	create_var
	movq	%rax, %rsi
	leal	-97(%rbp), %eax
	cmpl	$21, %eax
	ja	.L97
	movl	%eax, %eax
	leaq	.L99(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L99:
	.long	.L103-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L102-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L101-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L100-.L99
	.long	.L97-.L99
	.long	.L98-.L99
	.text
.L101:
	movq	8(%r12), %rax
	movq	16(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L96:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L98:
	movq	8(%r12), %rax
	movq	24(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L96
.L100:
	movq	8(%r12), %rax
	movq	24(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L96
.L102:
	movq	(%r12), %rax
	movq	16(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L96
.L103:
	movq	(%r12), %rax
	movq	(%rax), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	(%r12), %rax
	movq	(%rax), %rdi
	movq	%rbp, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	(%rbx), %r12
	movq	8(%rbx), %r13
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%r13, (%rax)
	movq	%r12, 8(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbp), %rax
	movq	%rax, 16(%rbx)
	movq	%r12, %rdi
	call	get_type_size
	addq	%rax, 16(%rbp)
	movq	0(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L107
	movq	%rbx, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L96
.L107:
	movq	stderr(%rip), %rcx
	movl	$63, %edx
	movl	$1, %esi
	leaq	.LC10(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L96
.L97:
	movl	%ebp, %ecx
	leaq	.LC11(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L96
	.size	codegen_variable, .-codegen_variable
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"[warning] Invalid variable access input\n"
	.align 8
.LC13:
	.string	"[warning] Variable access name is NULL\n"
	.align 8
.LC14:
	.string	"[warning] Unresolved variable access for '%s', creating fallback local\n"
	.align 8
.LC15:
	.string	"[warning] Invalid get-attribute access\n"
	.align 8
.LC16:
	.string	"[warning] Failed to generate object for get-attribute access\n"
	.align 8
.LC17:
	.string	"[warning] Invalid get-sequence access\n"
	.align 8
.LC18:
	.string	"[warning] Failed to generate sequence/index for get-sequence access\n"
	.align 8
.LC19:
	.string	"[warning] Invalid function call without callee\n"
	.align 8
.LC20:
	.string	"[warning] Failed to generate callee for function call\n"
	.align 8
.LC21:
	.string	"[warning] Unsupported callee in function call\n"
	.align 8
.LC22:
	.string	"[warning] Failed to generate function call argument\n"
	.align 8
.LC23:
	.string	"[warning] Unsupported variable access type for codegen_variable_access: %d\n"
	.text
	.globl	codegen_variable_access
	.type	codegen_variable_access, @function
codegen_variable_access:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$16, %rsp
	testq	%rdi, %rdi
	je	.L150
	movq	%rdi, %r12
	movq	%rsi, %rbp
	testq	%rsi, %rsi
	je	.L150
	movl	16(%rdi), %ecx
	testl	%ecx, %ecx
	jne	.L112
	movq	8(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L154
	movq	8(%rsi), %r12
	testq	%r12, %r12
	je	.L114
	movq	16(%r12), %rdi
	movq	%rbx, %rsi
	call	find_var_by_symbol
	testq	%rax, %rax
	je	.L155
.L148:
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, %rbx
	jmp	.L108
.L150:
	movq	stderr(%rip), %rcx
	movl	$40, %edx
	movl	$1, %esi
	leaq	.LC12(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %ebx
	jmp	.L108
.L154:
	movq	stderr(%rip), %rcx
	movl	$39, %edx
	movl	$1, %esi
	leaq	.LC13(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L108
.L155:
	movq	24(%r12), %rdi
	movq	%rbx, %rsi
	call	find_var_by_symbol
	testq	%rax, %rax
	jne	.L148
.L114:
	movq	0(%rbp), %rax
	movq	16(%rax), %rdi
	movq	%rbx, %rsi
	call	find_var_by_symbol
	testq	%rax, %rax
	jne	.L148
	cmpl	$2, 32(%rbx)
	jbe	.L156
	testq	%r12, %r12
	je	.L118
	movq	16(%r12), %rax
	movq	(%rax), %r12
	testq	%r12, %r12
	jne	.L121
	jmp	.L118
.L156:
	movq	(%rbx), %rsi
	movq	%rbp, %rcx
	movl	$102, %edx
	movq	%rbx, %rdi
	call	create_var
	movq	%rax, %rsi
	movl	$7, %edi
	call	create_arg
	movq	%rax, %rbx
	jmp	.L108
.L119:
	movq	(%r12), %r12
	testq	%r12, %r12
	je	.L118
.L121:
	movq	8(%r12), %r13
	testq	%r13, %r13
	je	.L119
	movq	0(%r13), %rax
	testq	%rax, %rax
	je	.L119
	movq	8(%rax), %rdi
	movq	SELF_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L119
	movq	16(%r13), %rax
	testq	%rax, %rax
	je	.L118
	cmpl	$0, 32(%rax)
	jne	.L118
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	cmpq	%rax, 24(%rbx)
	je	.L157
.L118:
	movq	8(%rbx), %rcx
	leaq	.LC14(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	(%rbx), %rsi
	movq	%rbp, %rcx
	movl	$118, %edx
	movq	%rbx, %rdi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, %rbx
.L108:
	movq	%rbx, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L157:
	movq	%r13, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, %rdi
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	call	emit_attribute_access
	movq	%rax, %rbx
	jmp	.L108
.L112:
	cmpl	$2, %ecx
	je	.L158
	cmpl	$3, %ecx
	je	.L159
	cmpl	$1, %ecx
	jne	.L133
	movq	(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L160
	cmpl	$2, 16(%rbx)
	jne	.L136
	movq	8(%rbx), %r14
	testq	%r14, %r14
	je	.L136
	movl	32(%r14), %eax
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L161
.L136:
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	codegen_variable_access
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L162
	movl	16(%rax), %eax
	cmpl	$7, %eax
	je	.L163
	testl	%eax, %eax
	jne	.L143
	movq	(%rbx), %rax
	testq	%rax, %rax
	je	.L143
	movq	(%rax), %r14
	testq	%r14, %r14
	je	.L143
	movl	32(%r14), %eax
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L137
.L143:
	movq	stderr(%rip), %rcx
	movl	$46, %edx
	movl	$1, %esi
	leaq	.LC21(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %ebx
	jmp	.L108
.L158:
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L123
	movq	8(%r12), %r12
	testq	%r12, %r12
	je	.L123
	movl	32(%r12), %eax
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L164
	call	codegen_variable_access
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L165
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rax, %rdi
	call	emit_attribute_access
	movq	%rax, %rbx
	jmp	.L108
.L123:
	movq	stderr(%rip), %rcx
	movl	$39, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %ebx
	jmp	.L108
.L164:
	movq	(%r12), %rsi
	movq	%rbp, %rcx
	movl	$102, %edx
	movq	%r12, %rdi
	call	create_var
	movq	%rax, %rsi
	movl	$7, %edi
	call	create_arg
	movq	%rax, %rbx
	jmp	.L108
.L165:
	movq	stderr(%rip), %rcx
	movl	$61, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L108
.L159:
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L128
	cmpq	$0, 8(%r12)
	je	.L128
	call	codegen_variable_access
	movq	%rax, %rdi
	movq	%rbp, %rsi
	call	load_rvalue
	movq	%rax, %r13
	movq	8(%r12), %rdi
	movq	%rbp, %rsi
	call	codegen_expression
	movq	%rax, %rdi
	movq	%rbp, %rsi
	call	load_rvalue
	movq	%rax, %r12
	testq	%r13, %r13
	je	.L151
	testq	%rax, %rax
	je	.L151
	movq	name_int(%rip), %rdx
	movq	8(%r13), %rax
	movq	name_float(%rip), %rsi
	cmpq	%rsi, %rax
	je	.L132
	movq	name_bool(%rip), %rsi
	cmpq	%rsi, %rax
	je	.L132
	movq	name_string(%rip), %rsi
	cmpq	%rsi, %rax
	cmovne	%rdx, %rsi
.L132:
	movq	%rbp, %rcx
	movl	$116, %edx
	movl	$0, %edi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, %rbx
	movq	%r12, %rcx
	movq	%r13, %rdx
	movq	%rax, %rsi
	movl	$16, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movb	$1, 20(%rbx)
	jmp	.L108
.L128:
	movq	stderr(%rip), %rcx
	movl	$38, %edx
	movl	$1, %esi
	leaq	.LC17(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %ebx
	jmp	.L108
.L151:
	movq	stderr(%rip), %rcx
	movl	$68, %edx
	movl	$1, %esi
	leaq	.LC18(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %ebx
	jmp	.L108
.L160:
	movq	stderr(%rip), %rcx
	movl	$47, %edx
	movl	$1, %esi
	leaq	.LC19(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L108
.L161:
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L137
	cmpl	$0, 16(%rdi)
	jne	.L138
	movq	8(%rdi), %rax
	testq	%rax, %rax
	je	.L138
	cmpl	$0, 32(%rax)
	je	.L137
.L138:
	movq	%rbp, %rsi
	call	codegen_variable_access
	movq	%rax, %rdi
	movq	%rbp, %rsi
	call	load_rvalue
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L166
	movq	%rbp, %rsi
	call	emit_param_instruction
	movl	$1, %r13d
.L140:
	movq	8(%r12), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
.L144:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L167
	movq	%rbp, %rsi
	call	codegen_expression
	movq	%rax, %rdi
	movq	%rbp, %rsi
	call	load_rvalue
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L168
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	emit_param_instruction
	addq	$1, %r13
	jmp	.L144
.L166:
	movl	$0, %r13d
	jmp	.L140
.L162:
	movq	stderr(%rip), %rcx
	movl	$54, %edx
	movl	$1, %esi
	leaq	.LC20(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L108
.L163:
	movq	(%rbx), %rax
	testq	%rax, %rax
	je	.L143
	movq	(%rax), %r14
	testq	%r14, %r14
	je	.L143
.L137:
	movl	$0, %r13d
	jmp	.L140
.L168:
	movq	stderr(%rip), %rcx
	movl	$52, %edx
	movl	$1, %esi
	leaq	.LC22(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L108
.L167:
	movl	$0, %esi
	movl	$5, %edi
	call	create_arg
	movq	%rax, %rbx
	movq	(%r14), %rsi
	testq	%rsi, %rsi
	je	.L147
	cmpq	name_void(%rip), %rsi
	je	.L147
	movq	%rbp, %rcx
	movl	$116, %edx
	movl	$0, %edi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, %rbx
.L147:
	movq	%r13, 8(%rsp)
	movq	(%r14), %rsi
	movq	%rbp, %rcx
	movl	$102, %edx
	movq	%r14, %rdi
	call	create_var
	movq	%rax, %rsi
	movl	$7, %edi
	call	create_arg
	movq	%rax, %r12
	leaq	8(%rsp), %rsi
	movl	$1, %edi
	call	create_arg
	movq	%rax, %rcx
	movq	%r12, %rdx
	movq	%rbx, %rsi
	movl	$22, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L108
.L133:
	leaq	.LC23(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %ebx
	jmp	.L108
	.size	codegen_variable_access, .-codegen_variable_access
	.section	.rodata.str1.8
	.align 8
.LC25:
	.string	"[warning] Unsupported type for negation: %s\n"
	.align 8
.LC26:
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
	ja	.L170
	movq	%rsi, %rbx
	movl	%ecx, %ecx
	leaq	.L172(%rip), %rdx
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L172:
	.long	.L180-.L172
	.long	.L179-.L172
	.long	.L178-.L172
	.long	.L177-.L172
	.long	.L176-.L172
	.long	.L175-.L172
	.long	.L174-.L172
	.long	.L173-.L172
	.long	.L171-.L172
	.text
.L180:
	movq	(%rdi), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	*strtoll@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	leaq	8(%rsp), %rsi
	movl	$1, %edi
	call	create_arg
	movq	%rax, %rbp
.L169:
	movq	%rbp, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
.L179:
	movq	(%rdi), %rdi
	movl	$0, %esi
	call	*strtod@GOTPCREL(%rip)
	movsd	%xmm0, 8(%rsp)
	leaq	8(%rsp), %rsi
	movl	$2, %edi
	call	create_arg
	movq	%rax, %rbp
	jmp	.L169
.L178:
	movq	(%rdi), %rsi
	movl	$3, %edi
	call	create_arg
	movq	%rax, %rbp
	jmp	.L169
.L177:
	movb	$1, 8(%rsp)
	leaq	8(%rsp), %rsi
	movl	$4, %edi
	call	create_arg
	movq	%rax, %rbp
	jmp	.L169
.L176:
	movb	$0, 8(%rsp)
	leaq	8(%rsp), %rsi
	movl	$4, %edi
	call	create_arg
	movq	%rax, %rbp
	jmp	.L169
.L175:
	movq	(%rdi), %rdi
	call	codegen_expression
	movq	%rax, %rbp
	jmp	.L169
.L174:
	movq	(%rdi), %rdi
	call	codegen_primary
	movq	%rax, %rdi
	movq	%rbx, %rsi
	call	load_rvalue
	movq	%rax, %r12
	movq	%rbx, %rcx
	movl	$116, %edx
	movq	name_bool(%rip), %rsi
	movl	$0, %edi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, %rbp
	movl	$0, %ecx
	movq	%r12, %rdx
	movq	%rax, %rsi
	movl	$13, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L169
.L173:
	movq	(%rdi), %rdi
	call	codegen_primary
	movq	%rax, %rdi
	movq	%rbx, %rsi
	call	load_rvalue
	movq	%rax, %r12
	movq	8(%rax), %rsi
	movq	%rbx, %rcx
	movl	$116, %edx
	movl	$0, %edi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, %rbp
	movq	$0, (%rsp)
	movq	.LC24(%rip), %rax
	movq	%rax, 8(%rsp)
	movq	8(%r12), %rax
	cmpq	name_int(%rip), %rax
	je	.L187
	cmpq	name_float(%rip), %rax
	je	.L188
	movq	8(%rax), %rcx
	leaq	.LC25(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %ebp
	jmp	.L169
.L187:
	movq	%rsp, %rsi
	movl	$1, %edi
	call	create_arg
	movq	%rax, %rdx
	movq	%r12, %rcx
	movq	%rbp, %rsi
	movl	$1, %edi
	call	create_instruction
	movq	%rax, %rsi
	jmp	.L183
.L188:
	leaq	8(%rsp), %rsi
	movl	$2, %edi
	call	create_arg
	movq	%rax, %rdx
	movq	%r12, %rcx
	movq	%rbp, %rsi
	movl	$2, %edi
	call	create_instruction
	movq	%rax, %rsi
.L183:
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L169
.L171:
	movq	(%rdi), %rdi
	call	codegen_variable_access
	movq	%rax, %rbp
	jmp	.L169
.L170:
	leaq	.LC26(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %ebp
	jmp	.L169
	.size	codegen_primary, .-codegen_primary
	.section	.rodata.str1.8
	.align 8
.LC27:
	.string	"[warning] Left-hand side of assignment is not a variable\n"
	.text
	.globl	codegen_expression
	.type	codegen_expression, @function
codegen_expression:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	cmpl	$19, 24(%rdi)
	je	.L217
	movq	16(%rdi), %rdi
	call	codegen_expression
	movq	%rax, %rdi
	movq	%rbx, %rsi
	call	load_rvalue
	movq	%rax, %r14
	movl	24(%rbp), %r13d
	cmpl	$18, %r13d
	ja	.L192
	movl	%r13d, %eax
	leaq	.L194(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L194:
	.long	.L198-.L194
	.long	.L197-.L194
	.long	.L213-.L194
	.long	.L195-.L194
	.long	.L193-.L194
	.long	.L196-.L194
	.long	.L196-.L194
	.long	.L196-.L194
	.long	.L196-.L194
	.long	.L196-.L194
	.long	.L196-.L194
	.long	.L196-.L194
	.long	.L196-.L194
	.long	.L199-.L194
	.long	.L198-.L194
	.long	.L197-.L194
	.long	.L213-.L194
	.long	.L195-.L194
	.long	.L193-.L194
	.text
.L217:
	movq	8(%rdi), %rdi
	call	codegen_primary
	movq	%rax, %rbp
	jmp	.L189
.L195:
	movl	$3, %r13d
.L196:
	movq	0(%rbp), %rdi
	movq	%rbx, %rsi
	call	codegen_expression
	movq	%rax, %r12
	movl	24(%rbp), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	jbe	.L211
.L208:
	movq	8(%r12), %rsi
	movq	%rbx, %rcx
	movl	$116, %edx
	movl	$0, %edi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, %rbp
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	load_rvalue
	movq	%rax, %rdx
	movq	%r14, %rcx
	movq	%rbp, %rsi
	movl	%r13d, %edi
	call	create_instruction
	movq	%rax, %rsi
	jmp	.L210
.L193:
	movl	$4, %r13d
	jmp	.L196
.L192:
	movl	$25, %r13d
	jmp	.L196
.L198:
	movq	0(%rbp), %rdi
	movq	%rbx, %rsi
	call	codegen_expression
	movq	%rax, %r12
	movl	24(%rbp), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L214
	movl	$0, %r13d
.L211:
	movq	8(%r12), %rsi
	movq	%rbx, %rcx
	movl	$116, %edx
	movl	$0, %edi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, %rbp
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	load_rvalue
	movq	%rax, %rdx
	movq	%r14, %rcx
	movq	%rbp, %rsi
	movl	%r13d, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L212:
	cmpl	$0, 16(%r12)
	jne	.L218
.L209:
	movl	$0, %ecx
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movl	$14, %edi
	call	create_instruction
	movq	%rax, %rsi
	cmpb	$0, 20(%r12)
	jne	.L219
.L210:
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L189:
	movq	%rbp, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L218:
	movq	stderr(%rip), %rcx
	movl	$57, %edx
	movl	$1, %esi
	leaq	.LC27(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L209
.L219:
	movl	$0, %ecx
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movl	$24, %edi
	call	create_instruction
	movq	%rax, %rsi
	jmp	.L210
.L214:
	movl	$0, %r13d
	jmp	.L208
.L197:
	movl	$1, %r13d
	jmp	.L196
.L213:
	movl	$2, %r13d
	jmp	.L196
.L199:
	movq	0(%rbp), %rdi
	movq	%rbx, %rsi
	call	codegen_expression
	movq	%rax, %r12
	movl	24(%rbp), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L220
	movq	%r14, %rbp
	jmp	.L212
.L220:
	movl	$14, %r13d
	jmp	.L208
	.size	codegen_expression, .-codegen_expression
	.globl	codegen_if
	.type	codegen_if, @function
codegen_if:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$40, %rsp
	movq	%rdi, %r14
	movq	%rsi, %rbx
	movq	%rsi, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, %r12
	movq	%rbx, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, %rbp
	movq	16(%r14), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L222
	movq	24(%r14), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	movq	%rbp, 24(%rsp)
	testb	%al, %al
	jne	.L223
.L222:
	movq	%rbx, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, 24(%rsp)
.L223:
	movq	24(%rsp), %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, 16(%rsp)
	movq	(%r14), %rdi
	movq	%rbx, %rsi
	call	codegen_expression
	movq	%rax, %r15
	movq	%rbp, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %r13
	movq	%r12, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rdx
	movq	%r13, %rcx
	movq	%r15, %rsi
	movl	$19, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r12, %rdi
	call	create_block
	movq	%rax, %r12
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	movq	%r12, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	%r12, 16(%rbx)
	movq	8(%r14), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L224
.L225:
	movq	%rbx, %rsi
	call	codegen_statement
.L224:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L225
	movl	$0, %ecx
	movl	$0, %edx
	movq	16(%rsp), %rsi
	movl	$20, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	16(%r14), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L238
.L226:
	movq	24(%r14), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L239
.L232:
	movq	24(%rsp), %rdi
	call	create_block
	movq	%rax, %rbp
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	movq	%rbp, %rsi
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
.L238:
	movq	16(%r14), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r15
	jmp	.L227
.L240:
	movq	24(%r14), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	cmovne	24(%rsp), %rbp
	jmp	.L228
.L230:
	movq	%rbx, %rsi
	call	codegen_statement
.L229:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L230
	movl	$0, %ecx
	movl	$0, %edx
	movq	16(%rsp), %rsi
	movl	$20, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L227:
	movq	%r15, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L226
	movq	%rbp, %rdi
	call	create_block
	movq	%rax, %rbp
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	movq	%rbp, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	%rbp, 16(%rbx)
	movq	%rbx, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, %r13
	movq	%rbx, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, %rbp
	movq	(%r12), %rdi
	movq	%rbx, %rsi
	call	codegen_expression
	movq	%rax, 8(%rsp)
	movq	%r15, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L240
.L228:
	movq	%rbp, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, (%rsp)
	movq	%r13, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rdx
	movq	(%rsp), %rcx
	movq	8(%rsp), %rsi
	movl	$19, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r13, %rdi
	call	create_block
	movq	%rax, %r13
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	movq	%r13, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	%r13, 16(%rbx)
	movq	8(%r12), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L229
.L239:
	movq	%rbp, %rdi
	call	create_block
	movq	%rax, %rbp
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	movq	%rbp, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	%rbp, 16(%rbx)
	movq	24(%r14), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L233
.L234:
	movq	%rbx, %rsi
	call	codegen_statement
.L233:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L234
	movl	$0, %ecx
	movl	$0, %edx
	movq	16(%rsp), %rsi
	movl	$20, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L232
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
	.globl	codegen_statement
	.type	codegen_statement, @function
codegen_statement:
	pushq	%rbx
	movl	8(%rdi), %ecx
	cmpl	$7, %ecx
	ja	.L242
	movq	%rsi, %rbx
	movl	%ecx, %ecx
	leaq	.L244(%rip), %rdx
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L244:
	.long	.L251-.L244
	.long	.L250-.L244
	.long	.L249-.L244
	.long	.L248-.L244
	.long	.L247-.L244
	.long	.L246-.L244
	.long	.L245-.L244
	.long	.L243-.L244
	.text
.L251:
	movq	(%rdi), %rdi
	call	codegen_expression
.L241:
	popq	%rbx
	ret
.L250:
	movq	(%rdi), %rdi
	movl	$118, %edx
	call	codegen_variable
	jmp	.L241
.L249:
	movq	(%rdi), %rdi
	call	codegen_if
	jmp	.L241
.L248:
	movq	(%rdi), %rdi
	call	codegen_while
	jmp	.L241
.L247:
	movq	(%rdi), %rdi
	call	codegen_for
	jmp	.L241
.L246:
	movq	(%rdi), %rdi
	call	codegen_expression
	movq	%rax, %rsi
	movl	$0, %ecx
	movl	$0, %edx
	movl	$21, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L241
.L245:
	movq	24(%rsi), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L253
	movq	24(%rbx), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rsi
	testq	%rsi, %rsi
	je	.L253
	movl	$0, %ecx
	movl	$0, %edx
	movl	$20, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L241
.L253:
	movq	stderr(%rip), %rcx
	movl	$49, %edx
	movl	$1, %esi
	leaq	.LC28(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L241
.L243:
	movq	32(%rsi), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L254
	movq	32(%rbx), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rsi
	testq	%rsi, %rsi
	je	.L254
	movl	$0, %ecx
	movl	$0, %edx
	movl	$20, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L241
.L254:
	movq	stderr(%rip), %rcx
	movl	$52, %edx
	movl	$1, %esi
	leaq	.LC29(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L241
.L242:
	leaq	.LC30(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L241
	.size	codegen_statement, .-codegen_statement
	.globl	codegen_for
	.type	codegen_for, @function
codegen_for:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$24, %rsp
	movq	%rdi, %r12
	movq	%rsi, %rbx
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L257
	movl	$118, %edx
	call	codegen_variable
.L257:
	movq	%rbx, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, %r13
	movq	%rbx, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, %r15
	movq	%rbx, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, %r14
	cmpq	$0, 8(%r12)
	je	.L258
	movq	%r13, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rsi
	movl	$0, %ecx
	movl	$0, %edx
	movl	$20, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r13, %rdi
	call	create_block
	movq	%rax, %rbp
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	movq	%rbp, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	%rbp, 16(%rbx)
	movq	8(%r12), %rdi
	movq	%rbx, %rsi
	call	codegen_expression
	movq	%rax, 8(%rsp)
	movq	%r14, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rbp
	movq	%r15, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rdx
	movq	%rbp, %rcx
	movq	8(%rsp), %rsi
	movl	$19, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L259:
	movq	%r15, %rdi
	call	create_block
	movq	%rax, %rbp
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	movq	%rbp, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	%rbp, 16(%rbx)
	movq	%rbx, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, 8(%rsp)
	cmpq	$0, 16(%r12)
	je	.L260
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rsi
	movq	32(%rbx), %rdi
	call	*list_append@GOTPCREL(%rip)
.L261:
	movq	%r14, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rsi
	movq	24(%rbx), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	24(%r12), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L263
.L258:
	movq	%r15, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rsi
	movl	$0, %ecx
	movl	$0, %edx
	movl	$20, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L259
.L260:
	cmpq	$0, 8(%r12)
	je	.L262
	movq	%r13, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rsi
	movq	32(%rbx), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L261
.L262:
	movq	%r15, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rsi
	movq	32(%rbx), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L261
.L264:
	movq	%rbx, %rsi
	call	codegen_statement
.L263:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L264
	movq	32(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	24(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	cmpq	$0, 16(%r12)
	je	.L265
	movq	8(%rsp), %rbp
	movq	%rbp, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rsi
	movl	$0, %ecx
	movl	$0, %edx
	movl	$20, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%rbp, %rdi
	call	create_block
	movq	%rax, %rbp
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	movq	%rbp, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	%rbp, 16(%rbx)
	movq	16(%r12), %rdi
	movq	%rbx, %rsi
	call	codegen_expression
.L265:
	movq	%r13, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rsi
	movl	$0, %ecx
	movl	$0, %edx
	movl	$20, %edi
	call	create_instruction
	movq	%rax, %rsi
	cmpq	$0, 8(%r12)
	je	.L268
.L266:
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r14, %rdi
	call	create_block
	movq	%rax, %rbp
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	movq	%rbp, %rsi
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
.L268:
	movq	%r15, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rsi
	movl	$0, %ecx
	movl	$0, %edx
	movl	$20, %edi
	call	create_instruction
	movq	%rax, %rsi
	jmp	.L266
	.size	codegen_for, .-codegen_for
	.globl	codegen_while
	.type	codegen_while, @function
codegen_while:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$24, %rsp
	movq	%rdi, %r13
	movq	%rsi, %rbx
	movq	%rsi, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, %rbp
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rsi
	movl	$0, %ecx
	movl	$0, %edx
	movl	$20, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%rbp, %rdi
	call	create_block
	movq	%rax, %r12
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	movq	%r12, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	%r12, 16(%rbx)
	movq	%rbx, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, %r14
	movq	%rbx, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, %r12
	movq	0(%r13), %rdi
	movq	%rbx, %rsi
	call	codegen_expression
	movq	%rax, 8(%rsp)
	movq	%r12, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %r15
	movq	%r14, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rdx
	movq	%r15, %rcx
	movq	8(%rsp), %rsi
	movl	$19, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r14, %rdi
	call	create_block
	movq	%rax, %r14
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	movq	%r14, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	%r14, 16(%rbx)
	movq	%rbp, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rsi
	movq	32(%rbx), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r12, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rsi
	movq	24(%rbx), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	8(%r13), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r13
	jmp	.L270
.L271:
	movq	%rbx, %rsi
	call	codegen_statement
.L270:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L271
	movq	32(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	24(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	%rbp, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rsi
	movl	$0, %ecx
	movl	$0, %edx
	movl	$20, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r12, %rdi
	call	create_block
	movq	%rax, %rbp
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	movq	%rbp, %rsi
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
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %r13
	movq	%rsi, %rbx
	movq	8(%rdi), %rsi
	movq	(%rdi), %rdi
	call	create_subroutine
	movq	%rax, %rbp
	movq	%rax, 8(%rbx)
	movq	(%rbx), %rax
	movq	24(%rax), %rdi
	movq	%rbp, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	16(%r13), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L274
.L275:
	movq	(%rax), %rsi
	movq	8(%rax), %rdi
	movq	%rbx, %rcx
	movl	$112, %edx
	call	create_var
	movq	%rax, %rsi
	movq	16(%rbp), %rdi
	call	*list_append@GOTPCREL(%rip)
.L274:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L275
	movq	%rbx, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, %rdi
	call	create_block
	movq	%rax, %r12
	movq	32(%rbp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	%r12, 16(%rbx)
	movq	24(%r13), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L276
.L277:
	movq	%rbx, %rsi
	call	codegen_statement
.L276:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L277
	movq	$0, 8(%rbx)
	addq	$8, %rsp
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
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %r13
	movq	%rsi, %rbx
	movq	8(%rdi), %rsi
	movq	(%rdi), %rdi
	call	create_subroutine
	movq	%rax, %rbp
	movq	%rax, 8(%rbx)
	movq	(%rbx), %rax
	movq	24(%rax), %rdi
	movq	%rbp, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	16(%r13), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L280
.L281:
	movq	(%rax), %rsi
	movq	8(%rax), %rdi
	movq	%rbx, %rcx
	movl	$112, %edx
	call	create_var
	movq	%rax, %rsi
	movq	16(%rbp), %rdi
	call	*list_append@GOTPCREL(%rip)
.L280:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L281
	movq	%rbx, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, %rdi
	call	create_block
	movq	%rax, %r12
	movq	32(%rbp), %rdi
	movq	%rax, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	%r12, 16(%rbx)
	movq	24(%r13), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L282
.L283:
	movq	%rbx, %rsi
	call	codegen_statement
.L282:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L283
	movq	$0, 8(%rbx)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	codegen_method, .-codegen_method
	.section	.rodata.str1.8
	.align 8
.LC31:
	.string	"[warning] Unsupported class member type for codegen_class: %d\n"
	.text
	.globl	codegen_class
	.type	codegen_class, @function
codegen_class:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %r13
	movq	%rsi, %rbp
	movq	8(%rdi), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	0(%r13), %r14
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r12
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, (%r12)
	movq	%r14, 8(%r12)
	movq	$0, 16(%r12)
	movq	24(%r13), %rax
	movq	%rax, 16(%r12)
	movq	0(%rbp), %rax
	movq	(%rax), %rdi
	movq	%r12, %rsi
	call	*list_append@GOTPCREL(%rip)
	leaq	.LC31(%rip), %r12
	jmp	.L286
.L287:
	movq	(%rax), %rdi
	movq	%rbp, %rsi
	call	codegen_method
.L286:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L294
	movl	8(%rax), %ecx
	testl	%ecx, %ecx
	je	.L287
	cmpl	$1, %ecx
	je	.L288
	movq	%r12, %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L286
.L288:
	movq	(%rax), %rdi
	movl	$97, %edx
	movq	%rbp, %rsi
	call	codegen_variable
	jmp	.L286
.L294:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	codegen_class, .-codegen_class
	.section	.rodata.str1.1
.LC32:
	.string	"main"
	.text
	.globl	codegen_code
	.type	codegen_code, @function
codegen_code:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r13
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 0(%r13)
	movq	$0, 8(%r13)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 16(%r13)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 24(%r13)
	movl	$88, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%r13, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 24(%rbp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 32(%rbp)
	movq	$0, 40(%rbp)
	movq	$0, 48(%rbp)
	movq	$0, 56(%rbp)
	movq	$0, 64(%rbp)
	movq	$0, 72(%rbp)
	movq	$0, 80(%rbp)
	movq	(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
	leaq	.LC32(%rip), %r14
	jmp	.L296
.L303:
	movq	(%rbx), %rdi
	movq	%rbp, %rsi
	call	codegen_function
	movq	(%rbx), %rax
	movq	(%rax), %rbx
	movq	8(%rbx), %rdi
	movq	%r14, %rsi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L296
	movq	%rbx, 8(%r13)
	jmp	.L296
.L304:
	movq	(%rbx), %rdi
	movq	%rbp, %rsi
	call	codegen_class
.L296:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L302
	movl	8(%rbx), %eax
	cmpl	$1, %eax
	je	.L303
	cmpl	$2, %eax
	je	.L304
	testl	%eax, %eax
	jne	.L296
	movq	(%rbx), %rdi
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	codegen_import
	jmp	.L296
.L302:
	movq	%r13, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	codegen_code, .-codegen_code
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC24:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
