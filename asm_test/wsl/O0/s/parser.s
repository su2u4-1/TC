	.file	"codegen.c"
	.text
	.type	find_attribute_table, @function
find_attribute_table:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	jmp	.L2
.L4:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, -32(%rbp)
	jne	.L2
	movq	-16(%rbp), %rax
	jmp	.L3
.L2:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L4
	movl	$0, %eax
.L3:
	leave
	ret
	.size	find_attribute_table, .-find_attribute_table
	.type	create_attribute_table, @function
create_attribute_table:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	call	*create_list@GOTPCREL(%rip)
	movq	-8(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.size	create_attribute_table, .-create_attribute_table
	.section	.rodata
	.align 8
.LC0:
	.string	"[warning] Unsupported type for size lookup: %s\n"
	.text
	.type	get_type_size, @function
get_type_size:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L8
	movl	$0, %eax
	jmp	.L9
.L8:
	movq	name_int(%rip), %rax
	cmpq	%rax, -8(%rbp)
	je	.L10
	movq	name_float(%rip), %rax
	cmpq	%rax, -8(%rbp)
	je	.L10
	movq	name_string(%rip), %rax
	cmpq	%rax, -8(%rbp)
	jne	.L11
.L10:
	movl	$8, %eax
	jmp	.L9
.L11:
	movq	name_bool(%rip), %rax
	cmpq	%rax, -8(%rbp)
	je	.L12
	movq	name_void(%rip), %rax
	cmpq	%rax, -8(%rbp)
	jne	.L13
.L12:
	movl	$1, %eax
	jmp	.L9
.L13:
	movq	-8(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L14
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	24(%rax), %rax
	jmp	.L9
.L14:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC0(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movl	$8, %eax
.L9:
	leave
	ret
	.size	get_type_size, .-get_type_size
	.section	.rodata
	.align 8
.LC1:
	.string	"Error: create_attribute received NULL table or attributes list\n"
	.text
	.type	create_attribute, @function
create_attribute:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 16(%rax)
	cmpq	$0, -48(%rbp)
	jne	.L16
	movq	-40(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	get_type_size
	movq	-40(%rbp), %rdx
	movq	16(%rdx), %rdx
	addq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 16(%rax)
.L16:
	cmpq	$0, -40(%rbp)
	je	.L17
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L18
.L17:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$63, %edx
	movl	$1, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L19
.L18:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
.L19:
	movq	-8(%rbp), %rax
	leave
	ret
	.size	create_attribute, .-create_attribute
	.type	is_assignment_operator, @function
is_assignment_operator:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	cmpl	$13, -4(%rbp)
	je	.L22
	cmpl	$14, -4(%rbp)
	je	.L22
	cmpl	$15, -4(%rbp)
	je	.L22
	cmpl	$16, -4(%rbp)
	je	.L22
	cmpl	$17, -4(%rbp)
	je	.L22
	cmpl	$18, -4(%rbp)
	jne	.L23
.L22:
	movl	$1, %eax
	jmp	.L24
.L23:
	movl	$0, %eax
.L24:
	popq	%rbp
	ret
	.size	is_assignment_operator, .-is_assignment_operator
	.type	get_instruction_type, @function
get_instruction_type:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	cmpl	$18, -4(%rbp)
	ja	.L27
	movl	-4(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L29(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L29(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L29:
	.long	.L33-.L29
	.long	.L32-.L29
	.long	.L31-.L29
	.long	.L30-.L29
	.long	.L28-.L29
	.long	.L42-.L29
	.long	.L41-.L29
	.long	.L40-.L29
	.long	.L39-.L29
	.long	.L38-.L29
	.long	.L37-.L29
	.long	.L36-.L29
	.long	.L35-.L29
	.long	.L34-.L29
	.long	.L33-.L29
	.long	.L32-.L29
	.long	.L31-.L29
	.long	.L30-.L29
	.long	.L28-.L29
	.text
.L33:
	movl	$0, %eax
	jmp	.L43
.L32:
	movl	$1, %eax
	jmp	.L43
.L31:
	movl	$2, %eax
	jmp	.L43
.L30:
	movl	$3, %eax
	jmp	.L43
.L28:
	movl	$4, %eax
	jmp	.L43
.L34:
	movl	$14, %eax
	jmp	.L43
.L42:
	movl	$5, %eax
	jmp	.L43
.L41:
	movl	$6, %eax
	jmp	.L43
.L40:
	movl	$7, %eax
	jmp	.L43
.L39:
	movl	$8, %eax
	jmp	.L43
.L38:
	movl	$9, %eax
	jmp	.L43
.L37:
	movl	$10, %eax
	jmp	.L43
.L36:
	movl	$11, %eax
	jmp	.L43
.L35:
	movl	$12, %eax
	jmp	.L43
.L27:
	movl	$25, %eax
.L43:
	popq	%rbp
	ret
	.size	get_instruction_type, .-get_instruction_type
	.type	create_tac, @function
create_tac:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	call	*create_list@GOTPCREL(%rip)
	movq	-8(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	-8(%rbp), %rdx
	movq	%rax, 16(%rdx)
	call	*create_list@GOTPCREL(%rip)
	movq	-8(%rbp), %rdx
	movq	%rax, 24(%rdx)
	movq	-8(%rbp), %rax
	leave
	ret
	.size	create_tac, .-create_tac
	.type	create_tac_status, @function
create_tac_status:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$88, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	-8(%rbp), %rdx
	movq	%rax, 24(%rdx)
	call	*create_list@GOTPCREL(%rip)
	movq	-8(%rbp), %rdx
	movq	%rax, 32(%rdx)
	movq	-8(%rbp), %rax
	movq	$0, 40(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 48(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 56(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 64(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 72(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 80(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.size	create_tac_status, .-create_tac_status
	.type	create_subroutine, @function
create_subroutine:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	-8(%rbp), %rdx
	movq	%rax, 16(%rdx)
	call	*create_list@GOTPCREL(%rip)
	movq	-8(%rbp), %rdx
	movq	%rax, 24(%rdx)
	call	*create_list@GOTPCREL(%rip)
	movq	-8(%rbp), %rdx
	movq	%rax, 32(%rdx)
	movq	-8(%rbp), %rax
	leave
	ret
	.size	create_subroutine, .-create_subroutine
	.type	create_block, @function
create_block:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	-8(%rbp), %rdx
	movq	%rax, 8(%rdx)
	movq	-8(%rbp), %rax
	leave
	ret
	.size	create_block, .-create_block
	.section	.rodata
.LC2:
	.string	""
.LC3:
	.string	"$%d-error"
.LC4:
	.string	"$%c%zu"
	.text
	.type	create_var, @function
create_var:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movq	%rcx, -48(%rbp)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movl	-36(%rbp), %eax
	subl	$97, %eax
	cmpl	$21, %eax
	ja	.L53
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L55(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L55(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L55:
	.long	.L60-.L55
	.long	.L59-.L55
	.long	.L53-.L55
	.long	.L53-.L55
	.long	.L53-.L55
	.long	.L58-.L55
	.long	.L53-.L55
	.long	.L53-.L55
	.long	.L53-.L55
	.long	.L53-.L55
	.long	.L53-.L55
	.long	.L53-.L55
	.long	.L53-.L55
	.long	.L53-.L55
	.long	.L53-.L55
	.long	.L57-.L55
	.long	.L53-.L55
	.long	.L53-.L55
	.long	.L53-.L55
	.long	.L56-.L55
	.long	.L53-.L55
	.long	.L54-.L55
	.text
.L60:
	movq	-48(%rbp), %rax
	movq	40(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-48(%rbp), %rdx
	movq	%rcx, 40(%rdx)
	movq	%rax, -8(%rbp)
	jmp	.L61
.L57:
	movq	-48(%rbp), %rax
	movq	48(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-48(%rbp), %rdx
	movq	%rcx, 48(%rdx)
	movq	%rax, -8(%rbp)
	jmp	.L61
.L54:
	movq	-48(%rbp), %rax
	movq	56(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-48(%rbp), %rdx
	movq	%rcx, 56(%rdx)
	movq	%rax, -8(%rbp)
	jmp	.L61
.L56:
	movq	-48(%rbp), %rax
	movq	64(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-48(%rbp), %rdx
	movq	%rcx, 64(%rdx)
	movq	%rax, -8(%rbp)
	jmp	.L61
.L59:
	movq	-48(%rbp), %rax
	movq	72(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-48(%rbp), %rdx
	movq	%rcx, 72(%rdx)
	movq	%rax, -8(%rbp)
	jmp	.L61
.L58:
	movq	-48(%rbp), %rax
	movq	80(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-48(%rbp), %rdx
	movq	%rcx, 80(%rdx)
	movq	%rax, -8(%rbp)
	jmp	.L61
.L53:
	movq	$-1, -8(%rbp)
	nop
.L61:
	movl	$32, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	-16(%rbp), %rdx
	movq	%rax, 8(%rdx)
	cmpq	$-1, -8(%rbp)
	jne	.L62
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movl	-36(%rbp), %edx
	leaq	.LC3(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*sprintf@GOTPCREL(%rip)
	jmp	.L63
.L62:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	-36(%rbp), %edx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*sprintf@GOTPCREL(%rip)
.L63:
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-16(%rbp), %rax
	leave
	ret
	.size	create_var, .-create_var
	.type	create_instruction, @function
create_instruction:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	-20(%rbp), %edx
	movl	%edx, 24(%rax)
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.size	create_instruction, .-create_instruction
	.section	.rodata
	.align 8
.LC5:
	.string	"[warning] Unsupported argument type for create_arg: %d\n"
	.text
	.type	create_arg, @function
create_arg:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	-20(%rbp), %edx
	movl	%edx, 16(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	cmpl	$7, -20(%rbp)
	ja	.L68
	movl	-20(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L70(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L70(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L70:
	.long	.L77-.L70
	.long	.L76-.L70
	.long	.L75-.L70
	.long	.L74-.L70
	.long	.L73-.L70
	.long	.L72-.L70
	.long	.L71-.L70
	.long	.L69-.L70
	.text
.L77:
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L78
.L76:
	movq	-32(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	name_int(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L78
.L75:
	movq	-32(%rbp), %rax
	movsd	(%rax), %xmm0
	movq	-8(%rbp), %rax
	movsd	%xmm0, (%rax)
	movq	name_float(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L78
.L74:
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	name_string(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L78
.L73:
	movq	-32(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	movq	name_bool(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L78
.L72:
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	name_void(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L78
.L71:
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L78
.L69:
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L78
.L68:
	movq	stderr(%rip), %rax
	movl	-20(%rbp), %edx
	leaq	.LC5(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	nop
.L78:
	movq	-8(%rbp), %rax
	movb	$0, 20(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.size	create_arg, .-create_arg
	.type	load_rvalue, @function
load_rvalue:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L81
	movl	$0, %eax
	jmp	.L82
.L81:
	movq	-24(%rbp), %rax
	movzbl	20(%rax), %eax
	testb	%al, %al
	je	.L83
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$116, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	movl	$0, %ecx
	movq	%rax, %rsi
	movl	$23, %edi
	call	create_instruction
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	jmp	.L82
.L83:
	movq	-24(%rbp), %rax
.L82:
	leave
	ret
	.size	load_rvalue, .-load_rvalue
	.type	find_var_by_symbol, @function
find_var_by_symbol:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L85
	cmpq	$0, -32(%rbp)
	jne	.L86
.L85:
	movl	$0, %eax
	jmp	.L87
.L86:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L88
.L90:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L89
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, -32(%rbp)
	jne	.L89
	movq	-16(%rbp), %rax
	jmp	.L87
.L89:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
.L88:
	cmpq	$0, -8(%rbp)
	jne	.L90
	movl	$0, %eax
.L87:
	popq	%rbp
	ret
	.size	find_var_by_symbol, .-find_var_by_symbol
	.type	resolve_named_var, @function
resolve_named_var:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L92
	cmpq	$0, -32(%rbp)
	jne	.L93
.L92:
	movl	$0, %eax
	jmp	.L94
.L93:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L95
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	16(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	find_var_by_symbol
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L96
	movq	-8(%rbp), %rax
	jmp	.L94
.L96:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	find_var_by_symbol
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L95
	movq	-8(%rbp), %rax
	jmp	.L94
.L95:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	find_var_by_symbol
.L94:
	leave
	ret
	.size	resolve_named_var, .-resolve_named_var
	.type	find_self_parameter, @function
find_self_parameter:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L98
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L99
.L98:
	movl	$0, %eax
	jmp	.L100
.L99:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L101
.L103:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L102
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L102
	movq	SELF_KEYWORD(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L102
	movq	-16(%rbp), %rax
	jmp	.L100
.L102:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
.L101:
	cmpq	$0, -8(%rbp)
	jne	.L103
	movl	$0, %eax
.L100:
	leave
	ret
	.size	find_self_parameter, .-find_self_parameter
	.section	.rodata
.LC6:
	.string	"<unknown>"
	.align 8
.LC7:
	.string	"[warning] Attribute '%s' not found in class '%s', fallback index %zu\n"
.LC8:
	.string	"$a%zu"
	.text
	.type	create_attribute_ref_var, @function
create_attribute_ref_var:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.L105
	movl	$0, %eax
	jmp	.L106
.L105:
	movq	-56(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	find_attribute_table
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L107
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L108
.L107:
	movq	-64(%rbp), %rax
	movq	(%rax), %rsi
	movq	-72(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rcx
	movl	$97, %edx
	movq	%rax, %rdi
	call	create_var
	jmp	.L106
.L108:
	movq	$0, -8(%rbp)
	movb	$0, -9(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -32(%rbp)
	jmp	.L109
.L112:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, -64(%rbp)
	jne	.L110
	movb	$1, -9(%rbp)
	jmp	.L111
.L110:
	addq	$1, -8(%rbp)
.L109:
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L112
.L111:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-64(%rbp), %rax
	movq	(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, 16(%rax)
	movl	$32, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	-48(%rbp), %rdx
	movq	%rax, 8(%rdx)
	cmpb	$0, -9(%rbp)
	jne	.L113
	cmpq	$0, -56(%rbp)
	je	.L114
	movq	-56(%rbp), %rax
	movq	8(%rax), %rax
	jmp	.L115
.L114:
	leaq	.LC6(%rip), %rax
.L115:
	movq	-64(%rbp), %rdx
	movq	8(%rdx), %rdx
	movq	stderr(%rip), %rdi
	movq	-8(%rbp), %rcx
	movq	%rcx, %r8
	movq	%rax, %rcx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
.L113:
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	movq	-8(%rbp), %rdx
	leaq	.LC8(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*sprintf@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
.L106:
	leave
	ret
	.size	create_attribute_ref_var, .-create_attribute_ref_var
	.section	.rodata
	.align 8
.LC9:
	.string	"[warning] Invalid attribute access\n"
	.text
	.type	emit_attribute_access, @function
emit_attribute_access:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	cmpq	$0, -56(%rbp)
	je	.L117
	cmpq	$0, -64(%rbp)
	jne	.L118
.L117:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$35, %edx
	movl	$1, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L119
.L118:
	movq	-72(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L120
	movl	$0, %eax
	jmp	.L119
.L120:
	movq	$0, -8(%rbp)
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L121
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L121
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
.L121:
	movq	-72(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	create_attribute_ref_var
	movq	%rax, -24(%rbp)
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$116, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, %rcx
	movq	-16(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$15, %edi
	call	create_instruction
	movq	%rax, -40(%rbp)
	movq	-72(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movb	$1, 20(%rax)
	movq	-32(%rbp), %rax
.L119:
	leave
	ret
	.size	emit_attribute_access, .-emit_attribute_access
	.type	emit_param_instruction, @function
emit_param_instruction:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L126
	cmpq	$0, -32(%rbp)
	je	.L126
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	get_type_size
	movq	%rax, -16(%rbp)
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	create_arg
	movq	%rax, %rsi
	movq	-24(%rbp), %rax
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$17, %edi
	call	create_instruction
	movq	%rax, -8(%rbp)
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L122
.L126:
	nop
.L122:
	leave
	ret
	.size	emit_param_instruction, .-emit_param_instruction
	.section	.rodata
.LC10:
	.string	"main"
	.text
	.globl	codegen_code
	.type	codegen_code, @function
codegen_code:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	call	create_tac
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	create_tac_status
	movq	%rax, -16(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	jmp	.L128
.L132:
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$1, %eax
	jne	.L129
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_function
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	leaq	.LC10(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L128
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L128
.L129:
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$2, %eax
	jne	.L131
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_class
	jmp	.L128
.L131:
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	jne	.L128
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	codegen_import
.L128:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L132
	movq	-8(%rbp), %rax
	leave
	ret
	.size	codegen_code, .-codegen_code
	.section	.rodata
	.align 8
.LC11:
	.string	"[warning] Unsupported symbol kind for import: %d\n"
	.text
	.globl	codegen_import
	.type	codegen_import, @function
codegen_import:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$3, %eax
	jne	.L135
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rsi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$118, %edx
	movq	%rax, %rdi
	call	create_var
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L140
.L135:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$1, %eax
	je	.L137
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	jne	.L138
.L137:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rsi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$102, %edx
	movq	%rax, %rdi
	call	create_var
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L140
.L138:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L139
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	create_attribute_table
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L140
.L139:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC11(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
.L140:
	nop
	leave
	ret
	.size	codegen_import, .-codegen_import
	.globl	codegen_function
	.type	codegen_function, @function
codegen_function:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	-56(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	create_subroutine
	movq	%rax, -8(%rbp)
	movq	-64(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-56(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	jmp	.L142
.L143:
	movq	-24(%rbp), %rax
	movq	(%rax), %rsi
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$112, %edx
	movq	%rax, %rdi
	call	create_var
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
.L142:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L143
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, %rdi
	call	create_block
	movq	%rax, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-64(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-56(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	jmp	.L144
.L145:
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_statement
.L144:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L145
	movq	-64(%rbp), %rax
	movq	$0, 8(%rax)
	nop
	leave
	ret
	.size	codegen_function, .-codegen_function
	.globl	codegen_method
	.type	codegen_method, @function
codegen_method:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	-56(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	create_subroutine
	movq	%rax, -8(%rbp)
	movq	-64(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-56(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	jmp	.L147
.L148:
	movq	-24(%rbp), %rax
	movq	(%rax), %rsi
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$112, %edx
	movq	%rax, %rdi
	call	create_var
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
.L147:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L148
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, %rdi
	call	create_block
	movq	%rax, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-64(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-56(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	jmp	.L149
.L150:
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_statement
.L149:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L150
	movq	-64(%rbp), %rax
	movq	$0, 8(%rax)
	nop
	leave
	ret
	.size	codegen_method, .-codegen_method
	.section	.rodata
	.align 8
.LC12:
	.string	"[warning] Unsupported class member type for codegen_class: %d\n"
	.text
	.globl	codegen_class
	.type	codegen_class, @function
codegen_class:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	create_attribute_table
	movq	%rax, -16(%rbp)
	movq	-40(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L152
.L157:
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	je	.L153
	cmpl	$1, %eax
	je	.L154
	jmp	.L158
.L153:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_method
	jmp	.L152
.L154:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rcx
	movl	$97, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	codegen_variable
	jmp	.L152
.L158:
	movq	-24(%rbp), %rax
	movl	8(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC12(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	nop
.L152:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L157
	nop
	nop
	leave
	ret
	.size	codegen_class, .-codegen_class
	.section	.rodata
	.align 8
.LC13:
	.string	"[warning] Unsupported variable type for codegen_variable: %d\n"
	.text
	.globl	codegen_variable
	.type	codegen_variable, @function
codegen_variable:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rsi
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	-32(%rbp), %rcx
	movl	-36(%rbp), %edx
	movq	%rax, %rdi
	call	create_var
	movq	%rax, -8(%rbp)
	movl	-36(%rbp), %eax
	subl	$97, %eax
	cmpl	$21, %eax
	ja	.L160
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L162(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L162(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L162:
	.long	.L166-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L165-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L164-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L163-.L162
	.long	.L160-.L162
	.long	.L161-.L162
	.text
.L164:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	16(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L167
.L161:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L167
.L163:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L167
.L165:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L167
.L166:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	movq	(%rax), %rsi
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rdx
	movl	$0, %ecx
	movq	%rax, %rdi
	call	create_attribute
	jmp	.L167
.L160:
	movq	stderr(%rip), %rax
	movl	-36(%rbp), %edx
	leaq	.LC13(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	nop
.L167:
	nop
	leave
	ret
	.size	codegen_variable, .-codegen_variable
	.section	.rodata
	.align 8
.LC14:
	.string	"[warning] 'break' statement used outside of loop\n"
	.align 8
.LC15:
	.string	"[warning] 'continue' statement used outside of loop\n"
	.align 8
.LC16:
	.string	"[warning] Unsupported statement type for codegen_statement: %d\n"
	.text
	.globl	codegen_statement
	.type	codegen_statement, @function
codegen_statement:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	-56(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$7, %eax
	ja	.L169
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L171(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L171(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L171:
	.long	.L178-.L171
	.long	.L177-.L171
	.long	.L176-.L171
	.long	.L175-.L171
	.long	.L174-.L171
	.long	.L173-.L171
	.long	.L172-.L171
	.long	.L170-.L171
	.text
.L178:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_expression
	jmp	.L179
.L177:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	-64(%rbp), %rcx
	movl	$118, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	codegen_variable
	jmp	.L179
.L176:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_if
	jmp	.L179
.L175:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_while
	jmp	.L179
.L174:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_for
	jmp	.L179
.L173:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_expression
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$21, %edi
	call	create_instruction
	movq	%rax, -48(%rbp)
	movq	-64(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L179
.L172:
	movq	-64(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L180
	movq	-64(%rbp), %rax
	movq	24(%rax), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L180
	movq	-24(%rbp), %rax
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$20, %edi
	call	create_instruction
	movq	%rax, -32(%rbp)
	movq	-64(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L179
.L180:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$49, %edx
	movl	$1, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L179
.L170:
	movq	-64(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L181
	movq	-64(%rbp), %rax
	movq	32(%rax), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L181
	movq	-8(%rbp), %rax
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$20, %edi
	call	create_instruction
	movq	%rax, -16(%rbp)
	movq	-64(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L179
.L181:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$52, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L179
.L169:
	movq	-56(%rbp), %rax
	movl	8(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC16(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	nop
.L179:
	nop
	leave
	ret
	.size	codegen_statement, .-codegen_statement
	.globl	codegen_if
	.type	codegen_if, @function
codegen_if:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$184, %rsp
	movq	%rdi, -184(%rbp)
	movq	%rsi, -192(%rbp)
	movq	-192(%rbp), %rax
	movq	%rax, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, -40(%rbp)
	movq	-192(%rbp), %rax
	movq	%rax, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, -24(%rbp)
	movq	$0, -32(%rbp)
	movq	-184(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L183
	movq	-184(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L183
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	jmp	.L184
.L183:
	movq	-192(%rbp), %rax
	movq	%rax, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, -32(%rbp)
.L184:
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, -48(%rbp)
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	movq	-192(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_expression
	movq	%rax, -56(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rbx, %rcx
	movq	%rax, %rsi
	movl	$19, %edi
	call	create_instruction
	movq	%rax, -64(%rbp)
	movq	-192(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	create_block
	movq	%rax, -72(%rbp)
	movq	-192(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-192(%rbp), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-184(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -80(%rbp)
	jmp	.L185
.L186:
	movq	-192(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_statement
.L185:
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L186
	movq	-48(%rbp), %rax
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$20, %edi
	call	create_instruction
	movq	%rax, -96(%rbp)
	movq	-192(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-96(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-184(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L187
	movq	-184(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -104(%rbp)
	jmp	.L188
.L192:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	create_block
	movq	%rax, -120(%rbp)
	movq	-192(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-120(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-192(%rbp), %rax
	movq	-120(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-192(%rbp), %rax
	movq	%rax, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, -40(%rbp)
	movq	-192(%rbp), %rax
	movq	%rax, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, -24(%rbp)
	movq	-112(%rbp), %rax
	movq	(%rax), %rax
	movq	-192(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_expression
	movq	%rax, -56(%rbp)
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L189
	movq	-184(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L189
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
.L189:
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rbx, %rcx
	movq	%rax, %rsi
	movl	$19, %edi
	call	create_instruction
	movq	%rax, -64(%rbp)
	movq	-192(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	create_block
	movq	%rax, -72(%rbp)
	movq	-192(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-192(%rbp), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-112(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -128(%rbp)
	jmp	.L190
.L191:
	movq	-192(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_statement
.L190:
	movq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -136(%rbp)
	cmpq	$0, -136(%rbp)
	jne	.L191
	movq	-48(%rbp), %rax
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$20, %edi
	call	create_instruction
	movq	%rax, -96(%rbp)
	movq	-192(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-96(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
.L188:
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -112(%rbp)
	cmpq	$0, -112(%rbp)
	jne	.L192
.L187:
	movq	-184(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L193
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	create_block
	movq	%rax, -144(%rbp)
	movq	-192(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-144(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-192(%rbp), %rax
	movq	-144(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-184(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -152(%rbp)
	jmp	.L194
.L195:
	movq	-192(%rbp), %rdx
	movq	-160(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_statement
.L194:
	movq	-152(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -160(%rbp)
	cmpq	$0, -160(%rbp)
	jne	.L195
	movq	-48(%rbp), %rax
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$20, %edi
	call	create_instruction
	movq	%rax, -96(%rbp)
	movq	-192(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-96(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
.L193:
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	create_block
	movq	%rax, -168(%rbp)
	movq	-192(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-168(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-192(%rbp), %rax
	movq	-168(%rbp), %rdx
	movq	%rdx, 16(%rax)
	nop
	movq	-8(%rbp), %rbx
	leave
	ret
	.size	codegen_if, .-codegen_if
	.globl	codegen_for
	.type	codegen_for, @function
codegen_for:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$152, %rsp
	movq	%rdi, -152(%rbp)
	movq	%rsi, -160(%rbp)
	movq	-152(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L197
	movq	-152(%rbp), %rax
	movq	(%rax), %rax
	movq	-160(%rbp), %rcx
	movl	$118, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	codegen_variable
.L197:
	movq	-160(%rbp), %rax
	movq	%rax, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, -32(%rbp)
	movq	-160(%rbp), %rax
	movq	%rax, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, -40(%rbp)
	movq	-160(%rbp), %rax
	movq	%rax, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, -48(%rbp)
	movq	-152(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L198
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$20, %edi
	call	create_instruction
	movq	%rax, -64(%rbp)
	movq	-160(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	create_block
	movq	%rax, -72(%rbp)
	movq	-160(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-160(%rbp), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-152(%rbp), %rax
	movq	8(%rax), %rax
	movq	-160(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_expression
	movq	%rax, -80(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rdx
	movq	-80(%rbp), %rax
	movq	%rbx, %rcx
	movq	%rax, %rsi
	movl	$19, %edi
	call	create_instruction
	movq	%rax, -64(%rbp)
	movq	-160(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L199
.L198:
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$20, %edi
	call	create_instruction
	movq	%rax, -56(%rbp)
	movq	-160(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-56(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
.L199:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	create_block
	movq	%rax, -88(%rbp)
	movq	-160(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-88(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-160(%rbp), %rax
	movq	-88(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-160(%rbp), %rax
	movq	%rax, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, -96(%rbp)
	movq	-152(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L200
	movq	-96(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rdx
	movq	-160(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L201
.L200:
	movq	-152(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L202
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rdx
	movq	-160(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L201
.L202:
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rdx
	movq	-160(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
.L201:
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rdx
	movq	-160(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-152(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -104(%rbp)
	jmp	.L203
.L204:
	movq	-160(%rbp), %rdx
	movq	-112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_statement
.L203:
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -112(%rbp)
	cmpq	$0, -112(%rbp)
	jne	.L204
	movq	-160(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	-160(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	-152(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L205
	movq	-96(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$20, %edi
	call	create_instruction
	movq	%rax, -120(%rbp)
	movq	-160(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-120(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	create_block
	movq	%rax, -128(%rbp)
	movq	-160(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-128(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-160(%rbp), %rax
	movq	-128(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-152(%rbp), %rax
	movq	16(%rax), %rax
	movq	-160(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_expression
.L205:
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$20, %edi
	call	create_instruction
	movq	%rax, -24(%rbp)
	movq	-152(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L206
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$20, %edi
	call	create_instruction
	movq	%rax, -24(%rbp)
.L206:
	movq	-160(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	create_block
	movq	%rax, -136(%rbp)
	movq	-160(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-136(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-160(%rbp), %rax
	movq	-136(%rbp), %rdx
	movq	%rdx, 16(%rax)
	nop
	movq	-8(%rbp), %rbx
	leave
	ret
	.size	codegen_for, .-codegen_for
	.globl	codegen_while
	.type	codegen_while, @function
codegen_while:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$104, %rsp
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$20, %edi
	call	create_instruction
	movq	%rax, -32(%rbp)
	movq	-112(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	create_block
	movq	%rax, -40(%rbp)
	movq	-112(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-112(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-112(%rbp), %rax
	movq	%rax, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, -48(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, -56(%rbp)
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	-112(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_expression
	movq	%rax, -64(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rbx
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rbx, %rcx
	movq	%rax, %rsi
	movl	$19, %edi
	call	create_instruction
	movq	%rax, -32(%rbp)
	movq	-112(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	create_block
	movq	%rax, -72(%rbp)
	movq	-112(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-112(%rbp), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rdx
	movq	-112(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rdx
	movq	-112(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-104(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -80(%rbp)
	jmp	.L208
.L209:
	movq	-112(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_statement
.L208:
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L209
	movq	-112(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	-112(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$20, %edi
	call	create_instruction
	movq	%rax, -32(%rbp)
	movq	-112(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	create_block
	movq	%rax, -96(%rbp)
	movq	-112(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-96(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-112(%rbp), %rax
	movq	-96(%rbp), %rdx
	movq	%rdx, 16(%rax)
	nop
	movq	-8(%rbp), %rbx
	leave
	ret
	.size	codegen_while, .-codegen_while
	.section	.rodata
	.align 8
.LC17:
	.string	"[warning] Left-hand side of assignment is not a variable\n"
	.text
	.globl	codegen_expression
	.type	codegen_expression, @function
codegen_expression:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	-56(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$19, %eax
	jne	.L211
	movq	-56(%rbp), %rax
	movq	8(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_primary
	jmp	.L212
.L211:
	movq	-56(%rbp), %rax
	movq	16(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_expression
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	load_rvalue
	movq	%rax, -8(%rbp)
	movq	-56(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, %edi
	call	get_instruction_type
	movl	%eax, -20(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_expression
	movq	%rax, -32(%rbp)
	movq	-56(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, %edi
	call	is_assignment_operator
	testb	%al, %al
	je	.L213
	cmpl	$14, -20(%rbp)
	je	.L214
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$116, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, -48(%rbp)
	movq	-64(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	%rax, %rdi
	movq	-8(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movl	-20(%rbp), %eax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movl	%eax, %edi
	call	create_instruction
	movq	%rax, -16(%rbp)
	movq	-64(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, -8(%rbp)
.L214:
	movq	-32(%rbp), %rax
	movl	16(%rax), %eax
	testl	%eax, %eax
	je	.L215
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$57, %edx
	movl	$1, %esi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
.L215:
	movq	-8(%rbp), %rdx
	movq	-32(%rbp), %rax
	movl	$0, %ecx
	movq	%rax, %rsi
	movl	$14, %edi
	call	create_instruction
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movzbl	20(%rax), %eax
	testb	%al, %al
	je	.L216
	movq	-8(%rbp), %rdx
	movq	-32(%rbp), %rax
	movl	$0, %ecx
	movq	%rax, %rsi
	movl	$24, %edi
	call	create_instruction
	movq	%rax, -16(%rbp)
	jmp	.L216
.L213:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$116, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, -40(%rbp)
	movq	-64(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	load_rvalue
	movq	%rax, %rdi
	movq	-8(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movl	-20(%rbp), %eax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movl	%eax, %edi
	call	create_instruction
	movq	%rax, -16(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -8(%rbp)
.L216:
	movq	-64(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
.L212:
	leave
	ret
	.size	codegen_expression, .-codegen_expression
	.section	.rodata
	.align 8
.LC19:
	.string	"[warning] Unsupported type for negation: %s\n"
	.align 8
.LC20:
	.string	"[warning] Unsupported primary type for codegen_primary: %d\n"
	.text
	.globl	codegen_primary
	.type	codegen_primary, @function
codegen_primary:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$112, %rsp
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	-104(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$8, %eax
	ja	.L218
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L220(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L220(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L220:
	.long	.L228-.L220
	.long	.L227-.L220
	.long	.L226-.L220
	.long	.L225-.L220
	.long	.L224-.L220
	.long	.L223-.L220
	.long	.L222-.L220
	.long	.L221-.L220
	.long	.L219-.L220
	.text
.L228:
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movl	$10, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	*strtoll@GOTPCREL(%rip)
	movq	%rax, -56(%rbp)
	leaq	-56(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	create_arg
	jmp	.L229
.L227:
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*strtod@GOTPCREL(%rip)
	movq	%xmm0, %rax
	movq	%rax, -64(%rbp)
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	movl	$2, %edi
	call	create_arg
	jmp	.L229
.L226:
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$3, %edi
	call	create_arg
	jmp	.L229
.L225:
	movb	$1, -65(%rbp)
	leaq	-65(%rbp), %rax
	movq	%rax, %rsi
	movl	$4, %edi
	call	create_arg
	jmp	.L229
.L224:
	movb	$0, -66(%rbp)
	leaq	-66(%rbp), %rax
	movq	%rax, %rsi
	movl	$4, %edi
	call	create_arg
	jmp	.L229
.L223:
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	-112(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_expression
	jmp	.L229
.L222:
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	-112(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_primary
	movq	%rax, %rdx
	movq	-112(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	load_rvalue
	movq	%rax, -32(%rbp)
	movq	name_bool(%rip), %rax
	movq	-112(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$116, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rdx
	movq	-40(%rbp), %rax
	movl	$0, %ecx
	movq	%rax, %rsi
	movl	$13, %edi
	call	create_instruction
	movq	%rax, -48(%rbp)
	movq	-112(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	jmp	.L229
.L221:
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	-112(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_primary
	movq	%rax, %rdx
	movq	-112(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	load_rvalue
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	-112(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$116, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, -24(%rbp)
	movq	$0, -8(%rbp)
	movq	$0, -80(%rbp)
	movsd	.LC18(%rip), %xmm0
	movsd	%xmm0, -88(%rbp)
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	name_int(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L230
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	create_arg
	movq	%rax, %rsi
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movq	%rax, %rsi
	movl	$1, %edi
	call	create_instruction
	movq	%rax, -8(%rbp)
	jmp	.L231
.L230:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	name_float(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L232
	leaq	-88(%rbp), %rax
	movq	%rax, %rsi
	movl	$2, %edi
	call	create_arg
	movq	%rax, %rsi
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movq	%rax, %rsi
	movl	$2, %edi
	call	create_instruction
	movq	%rax, -8(%rbp)
	jmp	.L231
.L232:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC19(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L229
.L231:
	movq	-112(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	jmp	.L229
.L219:
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	-112(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_variable_access
	jmp	.L229
.L218:
	movq	-104(%rbp), %rax
	movl	8(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC20(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movl	$0, %eax
.L229:
	leave
	ret
	.size	codegen_primary, .-codegen_primary
	.section	.rodata
	.align 8
.LC21:
	.string	"[warning] Invalid variable access input\n"
	.align 8
.LC22:
	.string	"[warning] Variable access name is NULL\n"
	.align 8
.LC23:
	.string	"[warning] Unresolved variable access for '%s', creating fallback local\n"
	.align 8
.LC24:
	.string	"[warning] Invalid get-attribute access\n"
	.align 8
.LC25:
	.string	"[warning] Failed to generate object for get-attribute access\n"
	.align 8
.LC26:
	.string	"[warning] Invalid get-sequence access\n"
	.align 8
.LC27:
	.string	"[warning] Failed to generate sequence/index for get-sequence access\n"
	.align 8
.LC28:
	.string	"[warning] Invalid function call without callee\n"
	.align 8
.LC29:
	.string	"[warning] Failed to generate callee for function call\n"
	.align 8
.LC30:
	.string	"[warning] Unsupported callee in function call\n"
	.align 8
.LC31:
	.string	"[warning] Failed to generate function call argument\n"
	.align 8
.LC32:
	.string	"[warning] Unsupported variable access type for codegen_variable_access: %d\n"
	.text
	.globl	codegen_variable_access
	.type	codegen_variable_access, @function
codegen_variable_access:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$208, %rsp
	movq	%rdi, -200(%rbp)
	movq	%rsi, -208(%rbp)
	cmpq	$0, -200(%rbp)
	je	.L235
	cmpq	$0, -208(%rbp)
	jne	.L236
.L235:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$40, %edx
	movl	$1, %esi
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L237
.L236:
	movq	-200(%rbp), %rax
	movl	16(%rax), %eax
	testl	%eax, %eax
	jne	.L238
	movq	-200(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -168(%rbp)
	cmpq	$0, -168(%rbp)
	jne	.L239
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$39, %edx
	movl	$1, %esi
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L237
.L239:
	movq	-208(%rbp), %rdx
	movq	-168(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	resolve_named_var
	movq	%rax, -176(%rbp)
	cmpq	$0, -176(%rbp)
	je	.L240
	movq	-176(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	jmp	.L237
.L240:
	movq	-168(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$1, %eax
	je	.L241
	movq	-168(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	je	.L241
	movq	-168(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L242
.L241:
	movq	-168(%rbp), %rax
	movq	(%rax), %rsi
	movq	-208(%rbp), %rdx
	movq	-168(%rbp), %rax
	movq	%rdx, %rcx
	movl	$102, %edx
	movq	%rax, %rdi
	call	create_var
	movq	%rax, %rsi
	movl	$7, %edi
	call	create_arg
	jmp	.L237
.L242:
	movq	-208(%rbp), %rax
	movq	%rax, %rdi
	call	find_self_parameter
	movq	%rax, -184(%rbp)
	cmpq	$0, -184(%rbp)
	je	.L243
	movq	-184(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L243
	movq	-184(%rbp), %rax
	movq	16(%rax), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L243
	movq	-168(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-184(%rbp), %rax
	movq	16(%rax), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L243
	movq	-184(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, %rcx
	movq	-208(%rbp), %rdx
	movq	-168(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	emit_attribute_access
	jmp	.L237
.L243:
	movq	-168(%rbp), %rax
	movq	8(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC23(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movq	-168(%rbp), %rax
	movq	(%rax), %rsi
	movq	-208(%rbp), %rdx
	movq	-168(%rbp), %rax
	movq	%rdx, %rcx
	movl	$118, %edx
	movq	%rax, %rdi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	jmp	.L237
.L238:
	movq	-200(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$2, %eax
	jne	.L244
	movq	-200(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L245
	movq	-200(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L246
.L245:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$39, %edx
	movl	$1, %esi
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L237
.L246:
	movq	-200(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -152(%rbp)
	movq	-152(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	je	.L247
	movq	-152(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$1, %eax
	jne	.L248
.L247:
	movq	-152(%rbp), %rax
	movq	(%rax), %rsi
	movq	-208(%rbp), %rdx
	movq	-152(%rbp), %rax
	movq	%rdx, %rcx
	movl	$102, %edx
	movq	%rax, %rdi
	call	create_var
	movq	%rax, %rsi
	movl	$7, %edi
	call	create_arg
	jmp	.L237
.L248:
	movq	-200(%rbp), %rax
	movq	(%rax), %rax
	movq	-208(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_variable_access
	movq	%rax, -160(%rbp)
	cmpq	$0, -160(%rbp)
	jne	.L249
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$61, %edx
	movl	$1, %esi
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L237
.L249:
	movq	-208(%rbp), %rdx
	movq	-152(%rbp), %rcx
	movq	-160(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	emit_attribute_access
	jmp	.L237
.L244:
	movq	-200(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$3, %eax
	jne	.L250
	movq	-200(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L251
	movq	-200(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L252
.L251:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$38, %edx
	movl	$1, %esi
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L237
.L252:
	movq	-200(%rbp), %rax
	movq	(%rax), %rax
	movq	-208(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_variable_access
	movq	%rax, %rdx
	movq	-208(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	load_rvalue
	movq	%rax, -120(%rbp)
	movq	-200(%rbp), %rax
	movq	8(%rax), %rax
	movq	-208(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_expression
	movq	%rax, %rdx
	movq	-208(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	load_rvalue
	movq	%rax, -128(%rbp)
	cmpq	$0, -120(%rbp)
	je	.L253
	cmpq	$0, -128(%rbp)
	jne	.L254
.L253:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$68, %edx
	movl	$1, %esi
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L237
.L254:
	movq	name_int(%rip), %rax
	movq	%rax, -8(%rbp)
	movq	-120(%rbp), %rax
	movq	8(%rax), %rdx
	movq	name_float(%rip), %rax
	cmpq	%rax, %rdx
	je	.L255
	movq	-120(%rbp), %rax
	movq	8(%rax), %rdx
	movq	name_bool(%rip), %rax
	cmpq	%rax, %rdx
	je	.L255
	movq	-120(%rbp), %rax
	movq	8(%rax), %rdx
	movq	name_string(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L256
.L255:
	movq	-120(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
.L256:
	movq	-208(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rcx
	movl	$116, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, -136(%rbp)
	movq	-128(%rbp), %rcx
	movq	-120(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rax, %rsi
	movl	$16, %edi
	call	create_instruction
	movq	%rax, -144(%rbp)
	movq	-208(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-144(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-136(%rbp), %rax
	movb	$1, 20(%rax)
	movq	-136(%rbp), %rax
	jmp	.L237
.L250:
	movq	-200(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$1, %eax
	jne	.L257
	movq	-200(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L258
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$47, %edx
	movl	$1, %esi
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L237
.L258:
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movq	-200(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$2, %eax
	jne	.L260
	movq	-56(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L260
	movq	-56(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	je	.L261
	movq	-56(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$1, %eax
	jne	.L260
.L261:
	movq	-56(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L260
	movb	$0, -25(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movl	16(%rax), %eax
	testl	%eax, %eax
	jne	.L262
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L262
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L262
	movb	$1, -25(%rbp)
.L262:
	cmpb	$0, -25(%rbp)
	jne	.L260
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	-208(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_variable_access
	movq	%rax, %rdx
	movq	-208(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	load_rvalue
	movq	%rax, -24(%rbp)
.L260:
	cmpq	$0, -16(%rbp)
	jne	.L263
	movq	-208(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_variable_access
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.L264
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$54, %edx
	movl	$1, %esi
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L237
.L264:
	movq	-64(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$7, %eax
	jne	.L265
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L265
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L263
.L265:
	movq	-64(%rbp), %rax
	movl	16(%rax), %eax
	testl	%eax, %eax
	jne	.L263
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L263
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L263
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$1, %eax
	je	.L266
	movq	-72(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	jne	.L263
.L266:
	movq	-72(%rbp), %rax
	movq	%rax, -16(%rbp)
.L263:
	cmpq	$0, -16(%rbp)
	jne	.L267
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$46, %edx
	movl	$1, %esi
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L237
.L267:
	movq	$0, -40(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L268
	movq	-208(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	emit_param_instruction
	addq	$1, -40(%rbp)
.L268:
	movq	-200(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -80(%rbp)
	jmp	.L269
.L271:
	movq	-208(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	codegen_expression
	movq	%rax, %rdx
	movq	-208(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	load_rvalue
	movq	%rax, -112(%rbp)
	cmpq	$0, -112(%rbp)
	jne	.L270
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$52, %edx
	movl	$1, %esi
	leaq	.LC31(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L237
.L270:
	movq	-208(%rbp), %rdx
	movq	-112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	emit_param_instruction
	addq	$1, -40(%rbp)
.L269:
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L271
	movl	$0, %esi
	movl	$5, %edi
	call	create_arg
	movq	%rax, -48(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L272
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	name_void(%rip), %rax
	cmpq	%rax, %rdx
	je	.L272
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	-208(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$116, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, -48(%rbp)
.L272:
	movq	-40(%rbp), %rax
	movq	%rax, -192(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rsi
	movq	-208(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$102, %edx
	movq	%rax, %rdi
	call	create_var
	movq	%rax, %rsi
	movl	$7, %edi
	call	create_arg
	movq	%rax, -96(%rbp)
	leaq	-192(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	create_arg
	movq	%rax, %rcx
	movq	-96(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$22, %edi
	call	create_instruction
	movq	%rax, -104(%rbp)
	movq	-208(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-104(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	jmp	.L237
.L257:
	movq	-200(%rbp), %rax
	movl	16(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC32(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movl	$0, %eax
.L237:
	leave
	ret
	.size	codegen_variable_access, .-codegen_variable_access
	.section	.rodata
	.align 8
.LC18:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
