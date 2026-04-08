	.file	"tac.c"
	.text
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
	.string	"[Warning] Unsupported type for size lookup: %s\n"
	.text
	.type	get_type_size, @function
get_type_size:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	$8, -8(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L4
	movq	$0, -8(%rbp)
	jmp	.L5
.L4:
	movq	name_int(%rip), %rax
	cmpq	%rax, -24(%rbp)
	je	.L6
	movq	name_float(%rip), %rax
	cmpq	%rax, -24(%rbp)
	je	.L6
	movq	name_string(%rip), %rax
	cmpq	%rax, -24(%rbp)
	jne	.L7
.L6:
	movq	$8, -8(%rbp)
	jmp	.L5
.L7:
	movq	name_bool(%rip), %rax
	cmpq	%rax, -24(%rbp)
	je	.L8
	movq	name_void(%rip), %rax
	cmpq	%rax, -24(%rbp)
	jne	.L9
.L8:
	movq	$1, -8(%rbp)
	jmp	.L5
.L9:
	movq	-24(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L10
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	movq	24(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L5
.L10:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC0(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
.L5:
	movq	-8(%rbp), %rax
	leave
	ret
	.size	get_type_size, .-get_type_size
	.type	is_assignment_operator, @function
is_assignment_operator:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	cmpl	$13, -4(%rbp)
	je	.L13
	cmpl	$14, -4(%rbp)
	je	.L13
	cmpl	$15, -4(%rbp)
	je	.L13
	cmpl	$16, -4(%rbp)
	je	.L13
	cmpl	$17, -4(%rbp)
	je	.L13
	cmpl	$18, -4(%rbp)
	jne	.L14
.L13:
	movl	$1, %eax
	jmp	.L15
.L14:
	movl	$0, %eax
.L15:
	popq	%rbp
	ret
	.size	is_assignment_operator, .-is_assignment_operator
	.type	get_instruction_type, @function
get_instruction_type:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	cmpl	$18, -4(%rbp)
	ja	.L18
	movl	-4(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L20(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L20(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L20:
	.long	.L24-.L20
	.long	.L23-.L20
	.long	.L22-.L20
	.long	.L21-.L20
	.long	.L19-.L20
	.long	.L33-.L20
	.long	.L32-.L20
	.long	.L31-.L20
	.long	.L30-.L20
	.long	.L29-.L20
	.long	.L28-.L20
	.long	.L27-.L20
	.long	.L26-.L20
	.long	.L25-.L20
	.long	.L24-.L20
	.long	.L23-.L20
	.long	.L22-.L20
	.long	.L21-.L20
	.long	.L19-.L20
	.text
.L24:
	movl	$0, %eax
	jmp	.L34
.L23:
	movl	$1, %eax
	jmp	.L34
.L22:
	movl	$2, %eax
	jmp	.L34
.L21:
	movl	$3, %eax
	jmp	.L34
.L19:
	movl	$4, %eax
	jmp	.L34
.L25:
	movl	$14, %eax
	jmp	.L34
.L33:
	movl	$5, %eax
	jmp	.L34
.L32:
	movl	$6, %eax
	jmp	.L34
.L31:
	movl	$7, %eax
	jmp	.L34
.L30:
	movl	$8, %eax
	jmp	.L34
.L29:
	movl	$9, %eax
	jmp	.L34
.L28:
	movl	$10, %eax
	jmp	.L34
.L27:
	movl	$11, %eax
	jmp	.L34
.L26:
	movl	$12, %eax
	jmp	.L34
.L18:
	movl	$25, %eax
.L34:
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
	movl	$96, %edi
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
	movq	%rax, 32(%rdx)
	call	*create_list@GOTPCREL(%rip)
	movq	-8(%rbp), %rdx
	movq	%rax, 40(%rdx)
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
	movq	$0, 88(%rax)
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
	.type	search_var, @function
search_var:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$96, %rsp
	movq	%rdi, -88(%rbp)
	movq	%rsi, -96(%rbp)
	movq	-96(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L44
	movq	-96(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L44
	movq	-96(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	jmp	.L45
.L47:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, -88(%rbp)
	jne	.L45
	movq	-16(%rbp), %rax
	jmp	.L46
.L45:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L47
.L44:
	movq	-96(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L48
	movq	-96(%rbp), %rax
	movq	8(%rax), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L48
	movq	-96(%rbp), %rax
	movq	8(%rax), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	jmp	.L49
.L50:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, -88(%rbp)
	jne	.L49
	movq	-32(%rbp), %rax
	jmp	.L46
.L49:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L50
.L48:
	movq	-96(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L51
	movq	-96(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L51
	movq	-96(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	jmp	.L53
.L57:
	movq	-48(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-96(%rbp), %rax
	movq	24(%rax), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L53
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L53
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -56(%rbp)
	jmp	.L55
.L56:
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	cmpq	%rax, -88(%rbp)
	jne	.L55
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	jmp	.L46
.L55:
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.L56
.L53:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L57
.L51:
	movq	-96(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L58
	movq	-96(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -72(%rbp)
	jmp	.L59
.L60:
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, -88(%rbp)
	jne	.L59
	movq	-80(%rbp), %rax
	jmp	.L46
.L59:
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	jne	.L60
.L58:
	movl	$0, %eax
.L46:
	leave
	ret
	.size	search_var, .-search_var
	.section	.rodata
.LC1:
	.string	""
.LC2:
	.string	"$%d-error"
.LC3:
	.string	"$%c%zu"
	.text
	.type	create_var, @function
create_var:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -52(%rbp)
	movq	%rcx, -64(%rbp)
	cmpq	$0, -40(%rbp)
	je	.L62
	movq	$0, -8(%rbp)
	movq	-48(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L63
	movq	-64(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-48(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, 24(%rax)
.L63:
	movq	-64(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	search_var
	movq	%rax, -24(%rbp)
	movq	-48(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L64
	movq	-64(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 24(%rax)
.L64:
	cmpq	$0, -24(%rbp)
	je	.L62
	movq	-24(%rbp), %rax
	jmp	.L65
.L62:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, (%rax)
	movl	-52(%rbp), %eax
	subl	$97, %eax
	cmpl	$21, %eax
	ja	.L66
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L68(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L68(%rip), %rdx
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
.L73:
	movq	-64(%rbp), %rax
	movq	48(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-64(%rbp), %rdx
	movq	%rcx, 48(%rdx)
	movq	%rax, -16(%rbp)
	jmp	.L74
.L70:
	movq	-64(%rbp), %rax
	movq	56(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-64(%rbp), %rdx
	movq	%rcx, 56(%rdx)
	movq	%rax, -16(%rbp)
	jmp	.L74
.L67:
	movq	-64(%rbp), %rax
	movq	64(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-64(%rbp), %rdx
	movq	%rcx, 64(%rdx)
	movq	%rax, -16(%rbp)
	jmp	.L74
.L69:
	movq	-64(%rbp), %rax
	movq	72(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-64(%rbp), %rdx
	movq	%rcx, 72(%rdx)
	movq	%rax, -16(%rbp)
	jmp	.L74
.L72:
	movq	-64(%rbp), %rax
	movq	80(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-64(%rbp), %rdx
	movq	%rcx, 80(%rdx)
	movq	%rax, -16(%rbp)
	jmp	.L74
.L71:
	movq	-64(%rbp), %rax
	movq	88(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-64(%rbp), %rdx
	movq	%rcx, 88(%rdx)
	movq	%rax, -16(%rbp)
	jmp	.L74
.L66:
	movq	$-1, -16(%rbp)
	nop
.L74:
	movl	$32, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	-32(%rbp), %rdx
	movq	%rax, 8(%rdx)
	cmpq	$-1, -16(%rbp)
	jne	.L75
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movl	-52(%rbp), %edx
	leaq	.LC2(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*sprintf@GOTPCREL(%rip)
	jmp	.L76
.L75:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rcx
	movl	-52(%rbp), %edx
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*sprintf@GOTPCREL(%rip)
.L76:
	movq	-32(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 16(%rax)
	cmpl	$116, -52(%rbp)
	je	.L77
	cmpl	$118, -52(%rbp)
	jne	.L78
.L77:
	movq	-64(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
.L78:
	movq	-32(%rbp), %rax
.L65:
	leave
	ret
	.size	create_var, .-create_var
	.section	.rodata
	.align 8
.LC4:
	.string	"Error: create_attribute received NULL table\n"
	.align 8
.LC5:
	.string	"Error: create_attribute received NULL table or attributes list\n"
	.text
	.type	create_attribute, @function
create_attribute:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	%r8, -56(%rbp)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-56(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rax
	movq	%rdx, %rcx
	movl	$97, %edx
	movq	%rax, %rdi
	call	create_var
	movq	-8(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 16(%rax)
	cmpq	$0, -48(%rbp)
	jne	.L80
	cmpq	$0, -40(%rbp)
	je	.L80
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
	jmp	.L81
.L80:
	cmpq	$0, -40(%rbp)
	jne	.L81
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$44, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
.L81:
	cmpq	$0, -40(%rbp)
	je	.L82
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L83
.L82:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$63, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L84
.L83:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
.L84:
	movq	-8(%rbp), %rax
	leave
	ret
	.size	create_attribute, .-create_attribute
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
.LC6:
	.string	"[Warning] Unsupported argument type for create_arg: %d\n"
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
	cmpl	$8, -20(%rbp)
	ja	.L89
	movl	-20(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L91(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L91(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L91:
	.long	.L98-.L91
	.long	.L97-.L91
	.long	.L96-.L91
	.long	.L95-.L91
	.long	.L94-.L91
	.long	.L93-.L91
	.long	.L92-.L91
	.long	.L90-.L91
	.long	.L90-.L91
	.text
.L98:
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L99
.L97:
	movq	-32(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	name_int(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L99
.L96:
	movq	-32(%rbp), %rax
	movsd	(%rax), %xmm0
	movq	-8(%rbp), %rax
	movsd	%xmm0, (%rax)
	movq	name_float(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L99
.L95:
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	name_string(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L99
.L94:
	movq	-32(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	movq	name_bool(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L99
.L93:
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	name_void(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L99
.L92:
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L99
.L90:
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L99
.L89:
	movq	stderr(%rip), %rax
	movl	-20(%rbp), %edx
	leaq	.LC6(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	nop
.L99:
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
	jne	.L102
	movl	$0, %eax
	jmp	.L103
.L102:
	movq	-24(%rbp), %rax
	movzbl	20(%rax), %eax
	testb	%al, %al
	je	.L104
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
	jmp	.L103
.L104:
	movq	-24(%rbp), %rax
.L103:
	leave
	ret
	.size	load_rvalue, .-load_rvalue
	.section	.rodata
.LC7:
	.string	"main"
	.text
	.globl	tac_code
	.type	tac_code, @function
tac_code:
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
	jmp	.L106
.L110:
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$1, %eax
	jne	.L107
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_function
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L106
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L106
.L107:
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$2, %eax
	jne	.L109
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_class
	jmp	.L106
.L109:
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	jne	.L106
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	tac_import
.L106:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L110
	movq	-8(%rbp), %rax
	leave
	ret
	.size	tac_code, .-tac_code
	.section	.rodata
	.align 8
.LC8:
	.string	"[Warning] Unsupported symbol kind for import: %d\n"
	.text
	.globl	tac_import
	.type	tac_import, @function
tac_import:
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
	jne	.L113
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
	jmp	.L118
.L113:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$1, %eax
	je	.L115
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	jne	.L116
.L115:
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
	jmp	.L118
.L116:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L117
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_class
	jmp	.L118
.L117:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC8(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
.L118:
	nop
	leave
	ret
	.size	tac_import, .-tac_import
	.globl	tac_function
	.type	tac_function, @function
tac_function:
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
	jmp	.L120
.L121:
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
.L120:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L121
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
	jmp	.L122
.L123:
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_statement
.L122:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L123
	movq	-64(%rbp), %rax
	movq	$0, 8(%rax)
	nop
	leave
	ret
	.size	tac_function, .-tac_function
	.section	.rodata
	.align 8
.LC9:
	.string	"[Warning] Constructor '%s' does not start with 'self' initialization\n"
	.text
	.globl	tac_method
	.type	tac_method, @function
tac_method:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$88, %rsp
	movq	%rdi, -88(%rbp)
	movq	%rsi, -96(%rbp)
	movq	-88(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-88(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	create_subroutine
	movq	%rax, -24(%rbp)
	movq	-96(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-96(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-88(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -32(%rbp)
	jmp	.L125
.L126:
	movq	-40(%rbp), %rax
	movq	(%rax), %rsi
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	-96(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$112, %edx
	movq	%rax, %rdi
	call	create_var
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
.L125:
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L126
	movq	-96(%rbp), %rax
	movq	%rax, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, %rdi
	call	create_block
	movq	%rax, -48(%rbp)
	movq	-24(%rbp), %rax
	movq	32(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-96(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-88(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -56(%rbp)
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	movq	-96(%rbp), %rax
	movq	24(%rax), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L131
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	jne	.L128
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movl	24(%rax), %eax
	cmpl	$19, %eax
	jne	.L128
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movl	8(%rax), %eax
	cmpl	$8, %eax
	jne	.L128
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rax
	movl	16(%rax), %eax
	testl	%eax, %eax
	je	.L129
.L128:
	movq	-88(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC9(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L124
.L129:
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -72(%rbp)
	movq	-96(%rbp), %rax
	movq	24(%rax), %rax
	addq	$24, %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	create_arg
	movq	%rax, %rbx
	movq	-72(%rbp), %rax
	movq	(%rax), %rsi
	movq	-96(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rcx
	movl	$118, %edx
	movq	%rax, %rdi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movl	$0, %ecx
	movq	%rbx, %rdx
	movq	%rax, %rsi
	movl	$18, %edi
	call	create_instruction
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L131
.L132:
	movq	-96(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_statement
.L131:
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	jne	.L132
	movq	-96(%rbp), %rax
	movq	$0, 8(%rax)
.L124:
	movq	-8(%rbp), %rbx
	leave
	ret
	.size	tac_method, .-tac_method
	.section	.rodata
	.align 8
.LC10:
	.string	"[Warning] Unsupported class member type for tac_class: %d\n"
	.text
	.globl	tac_class
	.type	tac_class, @function
tac_class:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 24(%rax)
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
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L134
.L139:
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	je	.L135
	cmpl	$1, %eax
	je	.L136
	jmp	.L140
.L135:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_method
	jmp	.L134
.L136:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	tac_variable
	jmp	.L134
.L140:
	movq	-24(%rbp), %rax
	movl	8(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC10(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	nop
.L134:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L139
	movq	-48(%rbp), %rax
	movq	$0, 24(%rax)
	nop
	leave
	ret
	.size	tac_class, .-tac_class
	.globl	tac_variable
	.type	tac_variable, @function
tac_variable:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, %eax
	movb	%al, -52(%rbp)
	movq	$0, -16(%rbp)
	cmpb	$0, -52(%rbp)
	je	.L142
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	movq	(%rax), %rsi
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	-48(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	%rcx, %r8
	movl	$0, %ecx
	movq	%rax, %rdi
	call	create_attribute
	jmp	.L146
.L142:
	movq	-40(%rbp), %rax
	movq	(%rax), %rsi
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$118, %edx
	movq	%rax, %rdi
	call	create_var
	movq	%rax, -16(%rbp)
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L144
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_expression
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	load_rvalue
	movq	%rax, -8(%rbp)
	jmp	.L145
.L144:
	movq	$0, -32(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	create_arg
	movq	%rax, -8(%rbp)
.L145:
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, %rsi
	movq	-8(%rbp), %rax
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$14, %edi
	call	create_instruction
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
.L146:
	nop
	leave
	ret
	.size	tac_variable, .-tac_variable
	.section	.rodata
	.align 8
.LC11:
	.string	"[Warning] 'break' statement used outside of loop\n"
	.align 8
.LC12:
	.string	"[Warning] 'continue' statement used outside of loop\n"
	.align 8
.LC13:
	.string	"[Warning] Unsupported statement type for tac_statement: %d\n"
	.text
	.globl	tac_statement
	.type	tac_statement, @function
tac_statement:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	-56(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$7, %eax
	ja	.L148
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L150(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L150(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L150:
	.long	.L157-.L150
	.long	.L156-.L150
	.long	.L155-.L150
	.long	.L154-.L150
	.long	.L153-.L150
	.long	.L152-.L150
	.long	.L151-.L150
	.long	.L149-.L150
	.text
.L157:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_expression
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	load_rvalue
	jmp	.L158
.L156:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	-64(%rbp), %rcx
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	tac_variable
	jmp	.L158
.L155:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_if
	jmp	.L158
.L154:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_while
	jmp	.L158
.L153:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_for
	jmp	.L158
.L152:
	movl	$0, %esi
	movl	$5, %edi
	call	create_arg
	movq	%rax, -8(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L159
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_expression
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	load_rvalue
	movq	%rax, -8(%rbp)
.L159:
	movq	-8(%rbp), %rax
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$21, %edi
	call	create_instruction
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L158
.L151:
	movq	-64(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L160
	movq	-64(%rbp), %rax
	movq	32(%rax), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L160
	movq	-32(%rbp), %rax
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$20, %edi
	call	create_instruction
	movq	%rax, -40(%rbp)
	movq	-64(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L158
.L160:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$49, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L158
.L149:
	movq	-64(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L161
	movq	-64(%rbp), %rax
	movq	40(%rax), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L161
	movq	-16(%rbp), %rax
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$20, %edi
	call	create_instruction
	movq	%rax, -24(%rbp)
	movq	-64(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L158
.L161:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$52, %edx
	movl	$1, %esi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L158
.L148:
	movq	-56(%rbp), %rax
	movl	8(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC13(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	nop
.L158:
	nop
	leave
	ret
	.size	tac_statement, .-tac_statement
	.globl	tac_if
	.type	tac_if, @function
tac_if:
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
	je	.L163
	movq	-184(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L163
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	jmp	.L164
.L163:
	movq	-192(%rbp), %rax
	movq	%rax, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, -32(%rbp)
.L164:
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
	call	tac_expression
	movq	%rax, %rdx
	movq	-192(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	load_rvalue
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
	jmp	.L165
.L166:
	movq	-192(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_statement
.L165:
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L166
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
	jne	.L167
	movq	-184(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -104(%rbp)
	jmp	.L168
.L172:
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
	call	tac_expression
	movq	%rax, %rdx
	movq	-192(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	load_rvalue
	movq	%rax, -56(%rbp)
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L169
	movq	-184(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L169
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
.L169:
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
	jmp	.L170
.L171:
	movq	-192(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_statement
.L170:
	movq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -136(%rbp)
	cmpq	$0, -136(%rbp)
	jne	.L171
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
.L168:
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -112(%rbp)
	cmpq	$0, -112(%rbp)
	jne	.L172
.L167:
	movq	-184(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L173
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
	jmp	.L174
.L175:
	movq	-192(%rbp), %rdx
	movq	-160(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_statement
.L174:
	movq	-152(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -160(%rbp)
	cmpq	$0, -160(%rbp)
	jne	.L175
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
.L173:
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
	.size	tac_if, .-tac_if
	.globl	tac_for
	.type	tac_for, @function
tac_for:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$152, %rsp
	movq	%rdi, -152(%rbp)
	movq	%rsi, -160(%rbp)
	movq	-152(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L177
	movq	-152(%rbp), %rax
	movq	(%rax), %rax
	movq	-160(%rbp), %rcx
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	tac_variable
.L177:
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
	je	.L178
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
	call	tac_expression
	movq	%rax, %rdx
	movq	-160(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	load_rvalue
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
	jmp	.L179
.L178:
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
.L179:
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
	je	.L180
	movq	-96(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rdx
	movq	-160(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L181
.L180:
	movq	-152(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L182
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rdx
	movq	-160(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L181
.L182:
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rdx
	movq	-160(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
.L181:
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rdx
	movq	-160(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-152(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -104(%rbp)
	jmp	.L183
.L184:
	movq	-160(%rbp), %rdx
	movq	-112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_statement
.L183:
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -112(%rbp)
	cmpq	$0, -112(%rbp)
	jne	.L184
	movq	-160(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	-160(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	-152(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L185
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
	call	tac_expression
	movq	%rax, %rdx
	movq	-160(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	load_rvalue
.L185:
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
	jne	.L186
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
.L186:
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
	.size	tac_for, .-tac_for
	.globl	tac_while
	.type	tac_while, @function
tac_while:
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
	call	tac_expression
	movq	%rax, %rdx
	movq	-112(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	load_rvalue
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
	movq	40(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rdx
	movq	-112(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-104(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -80(%rbp)
	jmp	.L188
.L189:
	movq	-112(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_statement
.L188:
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L189
	movq	-112(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	-112(%rbp), %rax
	movq	32(%rax), %rax
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
	.size	tac_while, .-tac_while
	.section	.rodata
	.align 8
.LC14:
	.string	"[Warning] Left-hand side of assignment is not a variable\n"
	.text
	.globl	tac_expression
	.type	tac_expression, @function
tac_expression:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	-72(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$19, %eax
	jne	.L191
	movq	-72(%rbp), %rax
	movq	8(%rax), %rax
	movq	-80(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_primary
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	jmp	.L192
.L191:
	movq	-72(%rbp), %rax
	movq	16(%rax), %rax
	movq	-80(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_expression
	movq	%rax, %rdx
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	load_rvalue
	movq	%rax, -8(%rbp)
	movq	-72(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, %edi
	call	get_instruction_type
	movl	%eax, -20(%rbp)
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	-80(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_expression
	movq	%rax, -32(%rbp)
	movq	-72(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, %edi
	call	is_assignment_operator
	testb	%al, %al
	je	.L193
	cmpl	$14, -20(%rbp)
	je	.L194
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	-80(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$116, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, -48(%rbp)
	movq	-80(%rbp), %rdx
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
	movq	-80(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, -8(%rbp)
.L194:
	movq	-32(%rbp), %rax
	movl	16(%rax), %eax
	testl	%eax, %eax
	je	.L195
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$57, %edx
	movl	$1, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
.L195:
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
	je	.L196
	movq	-8(%rbp), %rdx
	movq	-32(%rbp), %rax
	movl	$0, %ecx
	movq	%rax, %rsi
	movl	$24, %edi
	call	create_instruction
	movq	%rax, -16(%rbp)
	jmp	.L196
.L193:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	-80(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$116, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, -40(%rbp)
	movq	-80(%rbp), %rdx
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
.L196:
	movq	-80(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
.L192:
	leave
	ret
	.size	tac_expression, .-tac_expression
	.section	.rodata
	.align 8
.LC16:
	.string	"[Warning] Unsupported type for negation: %s\n"
	.align 8
.LC17:
	.string	"[Warning] Unsupported primary type for tac_primary: %d\n"
	.text
	.globl	tac_primary
	.type	tac_primary, @function
tac_primary:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$112, %rsp
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	-104(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$8, %eax
	ja	.L198
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L200(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L200(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L200:
	.long	.L208-.L200
	.long	.L207-.L200
	.long	.L206-.L200
	.long	.L205-.L200
	.long	.L204-.L200
	.long	.L203-.L200
	.long	.L202-.L200
	.long	.L201-.L200
	.long	.L199-.L200
	.text
.L208:
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
	jmp	.L209
.L207:
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
	jmp	.L209
.L206:
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$3, %edi
	call	create_arg
	jmp	.L209
.L205:
	movb	$1, -65(%rbp)
	leaq	-65(%rbp), %rax
	movq	%rax, %rsi
	movl	$4, %edi
	call	create_arg
	jmp	.L209
.L204:
	movb	$0, -66(%rbp)
	leaq	-66(%rbp), %rax
	movq	%rax, %rsi
	movl	$4, %edi
	call	create_arg
	jmp	.L209
.L203:
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	-112(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_expression
	jmp	.L209
.L202:
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	-112(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_primary
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
	jmp	.L209
.L201:
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	-112(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_primary
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
	movsd	.LC15(%rip), %xmm0
	movsd	%xmm0, -88(%rbp)
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	name_int(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L210
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
	jmp	.L211
.L210:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	name_float(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L212
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
	jmp	.L211
.L212:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC16(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L209
.L211:
	movq	-112(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	jmp	.L209
.L199:
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	-112(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_variable_access
	jmp	.L209
.L198:
	movq	-104(%rbp), %rax
	movl	8(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC17(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movl	$0, %eax
.L209:
	leave
	ret
	.size	tac_primary, .-tac_primary
	.section	.rodata
	.align 8
.LC18:
	.string	"[Warning] Unsupported variable access with NULL base\n"
	.align 8
.LC19:
	.string	"[Warning] Failed to generate variable access for base\n"
	.align 8
.LC20:
	.string	"[Warning] Attempting to access attribute of non-object type: %s\n"
	.align 8
.LC21:
	.string	"[Warning] Attribute '%s' not found in type '%s'\n"
	.align 8
.LC22:
	.string	"[Warning] Attempting to access function '%s' as attribute of type '%s'\n"
	.align 8
.LC23:
	.string	"[Warning] Symbol '%s' in type '%s' is not an attribute\n"
.LC24:
	.string	"arr"
	.align 8
.LC25:
	.string	"[Warning] Attempting to index non-array type: %s\n"
	.align 8
.LC26:
	.string	"[Warning] Failed to generate variable access for index\n"
	.align 8
.LC27:
	.string	"[Warning] Attempting to call non-function, kind: %u, type name: %s\n"
	.align 8
.LC28:
	.string	"[Warning] Unsupported variable access type for tac_variable_access: %u\n"
	.text
	.globl	tac_variable_access
	.type	tac_variable_access, @function
tac_variable_access:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$192, %rsp
	movq	%rdi, -184(%rbp)
	movq	%rsi, -192(%rbp)
	movq	-184(%rbp), %rax
	movl	16(%rax), %eax
	testl	%eax, %eax
	jne	.L215
	movq	-184(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L215
	movq	-184(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$1, %eax
	je	.L216
	movq	-184(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	jne	.L217
.L216:
	movq	-184(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rsi
	movq	-184(%rbp), %rax
	movq	8(%rax), %rax
	movq	-192(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$102, %edx
	movq	%rax, %rdi
	call	create_var
	movq	%rax, %rsi
	movl	$7, %edi
	call	create_arg
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	jmp	.L218
.L217:
	movq	-184(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L219
	movq	-184(%rbp), %rax
	movq	8(%rax), %rsi
	movq	-184(%rbp), %rax
	movq	8(%rax), %rax
	movq	-192(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$118, %edx
	movq	%rax, %rdi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	jmp	.L218
.L219:
	movq	-184(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rsi
	movq	-184(%rbp), %rax
	movq	8(%rax), %rax
	movq	-192(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$118, %edx
	movq	%rax, %rdi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	jmp	.L218
.L215:
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L220
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$53, %edx
	movl	$1, %esi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L218
.L220:
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	movq	-192(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_variable_access
	movq	%rax, %rdx
	movq	-192(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	load_rvalue
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L221
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$54, %edx
	movl	$1, %esi
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L218
.L221:
	movq	-184(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$2, %eax
	jne	.L222
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$1, %eax
	je	.L223
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	jne	.L224
.L223:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC20(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L218
.L224:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L225
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	movq	%rax, -16(%rbp)
.L225:
	movq	-184(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	%rax, -136(%rbp)
	cmpq	$0, -136(%rbp)
	jne	.L226
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rcx
	movq	-184(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC21(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L218
.L226:
	movq	-136(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$1, %eax
	jne	.L227
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rcx
	movq	-184(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC22(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movq	-136(%rbp), %rax
	movq	(%rax), %rsi
	movq	-192(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rdx, %rcx
	movl	$102, %edx
	movq	%rax, %rdi
	call	create_var
	movq	%rax, %rsi
	movl	$7, %edi
	call	create_arg
	jmp	.L218
.L227:
	movq	-136(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	jne	.L228
	movq	-136(%rbp), %rax
	movq	(%rax), %rsi
	movq	-192(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rdx, %rcx
	movl	$102, %edx
	movq	%rax, %rdi
	call	create_var
	movq	%rax, %rsi
	movl	$8, %edi
	call	create_arg
	jmp	.L218
.L228:
	movq	-136(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$5, %eax
	je	.L229
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rcx
	movq	-184(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC23(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L218
.L229:
	movq	-136(%rbp), %rax
	movq	(%rax), %rax
	movq	-192(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$116, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, -144(%rbp)
	movq	-184(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rsi
	movq	-184(%rbp), %rax
	movq	8(%rax), %rax
	movq	-192(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$97, %edx
	movq	%rax, %rdi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, %rcx
	movq	-8(%rbp), %rdx
	movq	-144(%rbp), %rax
	movq	%rax, %rsi
	movl	$15, %edi
	call	create_instruction
	movq	%rax, -152(%rbp)
	movq	-144(%rbp), %rax
	movb	$1, 20(%rax)
	movq	-192(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-152(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-144(%rbp), %rax
	jmp	.L218
.L222:
	movq	-184(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$3, %eax
	jne	.L230
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	leaq	.LC24(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L231
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC25(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L218
.L231:
	movq	-184(%rbp), %rax
	movq	8(%rax), %rax
	movq	-192(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_expression
	movq	%rax, %rdx
	movq	-192(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	load_rvalue
	movq	%rax, -112(%rbp)
	cmpq	$0, -112(%rbp)
	jne	.L232
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$55, %edx
	movl	$1, %esi
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L218
.L232:
	movq	name_int(%rip), %rax
	movq	-192(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$116, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, -120(%rbp)
	movq	-112(%rbp), %rcx
	movq	-8(%rbp), %rdx
	movq	-120(%rbp), %rax
	movq	%rax, %rsi
	movl	$16, %edi
	call	create_instruction
	movq	%rax, -128(%rbp)
	movq	-120(%rbp), %rax
	movb	$1, 20(%rax)
	movq	-192(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-128(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-120(%rbp), %rax
	jmp	.L218
.L230:
	movq	-184(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$1, %eax
	jne	.L233
	movq	-8(%rbp), %rax
	movl	16(%rax), %eax
	testl	%eax, %eax
	jne	.L234
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L234
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	(%rax), %rsi
	movq	-192(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$102, %edx
	movq	%rax, %rdi
	call	create_var
	movq	%rax, %rsi
	movl	$8, %edi
	call	create_arg
	movq	%rax, -8(%rbp)
.L234:
	movq	-8(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$8, %eax
	je	.L235
	movq	-8(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$7, %eax
	je	.L235
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rcx
	movq	-8(%rbp), %rax
	movl	16(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC27(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L218
.L235:
	movq	$0, -160(%rbp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, -56(%rbp)
	movq	-8(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$8, %eax
	jne	.L237
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L237
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$8, %edi
	call	*create_primary@GOTPCREL(%rip)
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-192(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	tac_expression
	movq	%rax, %rdx
	movq	-192(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	load_rvalue
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	get_type_size
	movq	%rax, -168(%rbp)
	leaq	-168(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	create_arg
	movq	%rax, %rsi
	movq	-64(%rbp), %rax
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$17, %edi
	call	create_instruction
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-160(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -160(%rbp)
.L237:
	movq	-184(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -72(%rbp)
	jmp	.L238
.L239:
	movq	-192(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tac_expression
	movq	%rax, %rdx
	movq	-192(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	load_rvalue
	movq	%rax, -104(%rbp)
	movq	-104(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	get_type_size
	movq	%rax, -176(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	create_arg
	movq	%rax, %rsi
	movq	-104(%rbp), %rax
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$17, %edi
	call	create_instruction
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-160(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -160(%rbp)
.L238:
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	jne	.L239
	jmp	.L240
.L241:
	movq	-192(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-88(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
.L240:
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L241
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	-192(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$116, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, -96(%rbp)
	leaq	-160(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	create_arg
	movq	%rax, %rcx
	movq	-8(%rbp), %rdx
	movq	-96(%rbp), %rax
	movq	%rax, %rsi
	movl	$22, %edi
	call	create_instruction
	movq	%rax, %rdx
	movq	-192(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-96(%rbp), %rax
	jmp	.L218
.L233:
	movq	-184(%rbp), %rax
	movl	16(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC28(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movl	$0, %eax
.L218:
	leave
	ret
	.size	tac_variable_access, .-tac_variable_access
	.section	.rodata
	.align 8
.LC15:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
