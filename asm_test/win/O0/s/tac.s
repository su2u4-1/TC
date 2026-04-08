	.file	"tac.c"
	.text
	.def	create_attribute_table;	.scl	3;	.type	32;	.endef
create_attribute_table:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	call	create_list
	movq	-8(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "[Warning] Unsupported type for size lookup: %s\12\0"
	.text
	.def	get_type_size;	.scl	3;	.type	32;	.endef
get_type_size:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$56, %rsp
	movq	%rcx, 16(%rbp)
	movq	$8, -24(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L4
	movq	$0, -24(%rbp)
	jmp	.L5
.L4:
	movq	.refptr.name_int(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, 16(%rbp)
	je	.L6
	movq	.refptr.name_float(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, 16(%rbp)
	je	.L6
	movq	.refptr.name_string(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L7
.L6:
	movq	$8, -24(%rbp)
	jmp	.L5
.L7:
	movq	.refptr.name_bool(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, 16(%rbp)
	je	.L8
	movq	.refptr.name_void(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L9
.L8:
	movq	$1, -24(%rbp)
	jmp	.L5
.L9:
	movq	16(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L10
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	24(%rax), %rax
	movq	%rax, -24(%rbp)
	jmp	.L5
.L10:
	movq	16(%rbp), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movq	24(%rax), %rax
	movq	%rbx, %r8
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L5:
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rbx
	leave
	ret
	.def	is_assignment_operator;	.scl	3;	.type	32;	.endef
is_assignment_operator:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%ecx, 16(%rbp)
	cmpl	$13, 16(%rbp)
	je	.L13
	cmpl	$14, 16(%rbp)
	je	.L13
	cmpl	$15, 16(%rbp)
	je	.L13
	cmpl	$16, 16(%rbp)
	je	.L13
	cmpl	$17, 16(%rbp)
	je	.L13
	cmpl	$18, 16(%rbp)
	jne	.L14
.L13:
	movl	$1, %eax
	jmp	.L15
.L14:
	movl	$0, %eax
.L15:
	popq	%rbp
	ret
	.def	get_instruction_type;	.scl	3;	.type	32;	.endef
get_instruction_type:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%ecx, 16(%rbp)
	cmpl	$18, 16(%rbp)
	ja	.L18
	movl	16(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L20(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L20(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
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
	.def	create_tac;	.scl	3;	.type	32;	.endef
create_tac:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	call	create_list
	movq	-8(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	call	create_list
	movq	-8(%rbp), %rdx
	movq	%rax, 16(%rdx)
	call	create_list
	movq	-8(%rbp), %rdx
	movq	%rax, 24(%rdx)
	movq	-8(%rbp), %rax
	leave
	ret
	.def	create_tac_status;	.scl	3;	.type	32;	.endef
create_tac_status:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movl	$96, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	call	create_list
	movq	-8(%rbp), %rdx
	movq	%rax, 32(%rdx)
	call	create_list
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
	.def	create_subroutine;	.scl	3;	.type	32;	.endef
create_subroutine:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	call	create_list
	movq	-8(%rbp), %rdx
	movq	%rax, 16(%rdx)
	call	create_list
	movq	-8(%rbp), %rdx
	movq	%rax, 24(%rdx)
	call	create_list
	movq	-8(%rbp), %rdx
	movq	%rax, 32(%rdx)
	movq	-8(%rbp), %rax
	leave
	ret
	.def	create_block;	.scl	3;	.type	32;	.endef
create_block:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	call	create_list
	movq	-8(%rbp), %rdx
	movq	%rax, 8(%rdx)
	movq	-8(%rbp), %rax
	leave
	ret
	.def	search_var;	.scl	3;	.type	32;	.endef
search_var:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$112, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L44
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L44
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -8(%rbp)
	jmp	.L45
.L47:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L45
	movq	-16(%rbp), %rax
	jmp	.L46
.L45:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L47
.L44:
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L48
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L48
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -24(%rbp)
	jmp	.L49
.L50:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L49
	movq	-32(%rbp), %rax
	jmp	.L46
.L49:
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L50
.L48:
	movq	24(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L51
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L51
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -40(%rbp)
	jmp	.L53
.L57:
	movq	-48(%rbp), %rax
	movq	8(%rax), %rdx
	movq	24(%rbp), %rax
	movq	24(%rax), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L53
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L53
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -56(%rbp)
	jmp	.L55
.L56:
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L55
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	jmp	.L46
.L55:
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.L56
.L53:
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L57
.L51:
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L58
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -72(%rbp)
	jmp	.L59
.L60:
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L59
	movq	-80(%rbp), %rax
	jmp	.L46
.L59:
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	jne	.L60
.L58:
	movl	$0, %eax
.L46:
	leave
	ret
	.section .rdata,"dr"
.LC1:
	.ascii "\0"
.LC2:
	.ascii "$%d-error\0"
.LC3:
	.ascii "$%c%zu\0"
	.text
	.def	create_var;	.scl	3;	.type	32;	.endef
create_var:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movq	%r9, 40(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L62
	movq	$0, -8(%rbp)
	movq	24(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L63
	movq	40(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	24(%rbp), %rax
	movq	24(%rax), %rdx
	movq	40(%rbp), %rax
	movq	%rdx, 24(%rax)
.L63:
	movq	40(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	search_var
	movq	%rax, -24(%rbp)
	movq	24(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L64
	movq	40(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 24(%rax)
.L64:
	cmpq	$0, -24(%rbp)
	je	.L62
	movq	-24(%rbp), %rax
	jmp	.L65
.L62:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movl	32(%rbp), %eax
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
.L73:
	movq	40(%rbp), %rax
	movq	48(%rax), %rax
	leaq	1(%rax), %rcx
	movq	40(%rbp), %rdx
	movq	%rcx, 48(%rdx)
	movq	%rax, -16(%rbp)
	jmp	.L74
.L70:
	movq	40(%rbp), %rax
	movq	56(%rax), %rax
	leaq	1(%rax), %rcx
	movq	40(%rbp), %rdx
	movq	%rcx, 56(%rdx)
	movq	%rax, -16(%rbp)
	jmp	.L74
.L67:
	movq	40(%rbp), %rax
	movq	64(%rax), %rax
	leaq	1(%rax), %rcx
	movq	40(%rbp), %rdx
	movq	%rcx, 64(%rdx)
	movq	%rax, -16(%rbp)
	jmp	.L74
.L69:
	movq	40(%rbp), %rax
	movq	72(%rax), %rax
	leaq	1(%rax), %rcx
	movq	40(%rbp), %rdx
	movq	%rcx, 72(%rdx)
	movq	%rax, -16(%rbp)
	jmp	.L74
.L72:
	movq	40(%rbp), %rax
	movq	80(%rax), %rax
	leaq	1(%rax), %rcx
	movq	40(%rbp), %rdx
	movq	%rcx, 80(%rdx)
	movq	%rax, -16(%rbp)
	jmp	.L74
.L71:
	movq	40(%rbp), %rax
	movq	88(%rax), %rax
	leaq	1(%rax), %rcx
	movq	40(%rbp), %rdx
	movq	%rcx, 88(%rdx)
	movq	%rax, -16(%rbp)
	jmp	.L74
.L66:
	movq	$-1, -16(%rbp)
	nop
.L74:
	movl	$32, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	-32(%rbp), %rdx
	movq	%rax, 8(%rdx)
	cmpq	$-1, -16(%rbp)
	jne	.L75
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rbp), %edx
	movl	%edx, %r8d
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	jmp	.L76
.L75:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rcx
	movl	32(%rbp), %edx
	movq	%rcx, %r9
	movl	%edx, %r8d
	leaq	.LC3(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
.L76:
	movq	-32(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 16(%rax)
	cmpl	$116, 32(%rbp)
	je	.L77
	cmpl	$118, 32(%rbp)
	jne	.L78
.L77:
	movq	40(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
.L78:
	movq	-32(%rbp), %rax
.L65:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "Error: create_attribute received NULL table\12\0"
	.align 8
.LC5:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
	.text
	.def	create_attribute;	.scl	3;	.type	32;	.endef
create_attribute:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	48(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r9
	movl	$97, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	-8(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	cmpq	$0, 40(%rbp)
	jne	.L80
	cmpq	$0, 32(%rbp)
	je	.L80
	movq	32(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	get_type_size
	movq	32(%rbp), %rdx
	movq	16(%rdx), %rdx
	addq	%rax, %rdx
	movq	32(%rbp), %rax
	movq	%rdx, 16(%rax)
	jmp	.L81
.L80:
	cmpq	$0, 32(%rbp)
	jne	.L81
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$44, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L81:
	cmpq	$0, 32(%rbp)
	je	.L82
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L83
.L82:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$63, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L84
.L83:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
.L84:
	movq	-8(%rbp), %rax
	leave
	ret
	.def	create_instruction;	.scl	3;	.type	32;	.endef
create_instruction:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 24(%rax)
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC6:
	.ascii "[Warning] Unsupported argument type for create_arg: %d\12\0"
	.text
	.def	create_arg;	.scl	3;	.type	32;	.endef
create_arg:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 16(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	cmpl	$8, 16(%rbp)
	ja	.L89
	movl	16(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L91(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L91(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
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
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L99
.L97:
	movq	24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	.refptr.name_int(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L99
.L96:
	movq	24(%rbp), %rax
	movsd	(%rax), %xmm0
	movq	-8(%rbp), %rax
	movsd	%xmm0, (%rax)
	movq	.refptr.name_float(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L99
.L95:
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	.refptr.name_string(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L99
.L94:
	movq	24(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	movq	.refptr.name_bool(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L99
.L93:
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	.refptr.name_void(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L99
.L92:
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L99
.L90:
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L99
.L89:
	call	__getreent
	movq	24(%rax), %rax
	movl	16(%rbp), %edx
	movl	%edx, %r8d
	leaq	.LC6(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
.L99:
	movq	-8(%rbp), %rax
	movb	$0, 20(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.def	load_rvalue;	.scl	3;	.type	32;	.endef
load_rvalue:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L102
	movl	$0, %eax
	jmp	.L103
.L102:
	movq	16(%rbp), %rax
	movzbl	20(%rax), %eax
	testb	%al, %al
	je	.L104
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, %r9
	movl	$116, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movl	$0, %r9d
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$23, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	movq	-8(%rbp), %rax
	jmp	.L103
.L104:
	movq	16(%rbp), %rax
.L103:
	leave
	ret
	.section .rdata,"dr"
.LC7:
	.ascii "main\0"
	.text
	.globl	tac_code
	.def	tac_code;	.scl	2;	.type	32;	.endef
tac_code:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	call	create_tac
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	create_tac_status
	movq	%rax, -16(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
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
	movq	%rax, %rcx
	call	tac_function
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
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
	movq	%rax, %rcx
	call	tac_class
	jmp	.L106
.L109:
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	jne	.L106
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rdx
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	tac_import
.L106:
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L110
	movq	-8(%rbp), %rax
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC8:
	.ascii "[Warning] Unsupported symbol kind for import: %d\12\0"
	.text
	.globl	tac_import
	.def	tac_import;	.scl	2;	.type	32;	.endef
tac_import:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$3, %eax
	jne	.L113
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	32(%rbp), %rcx
	movq	%rcx, %r9
	movl	$118, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L118
.L113:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$1, %eax
	je	.L115
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	jne	.L116
.L115:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	32(%rbp), %rcx
	movq	%rcx, %r9
	movl	$102, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L118
.L116:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L117
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rax
	movq	32(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_class
	jmp	.L118
.L117:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %ebx
	call	__getreent
	movq	24(%rax), %rax
	movl	%ebx, %r8d
	leaq	.LC8(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L118:
	nop
	movq	-8(%rbp), %rbx
	leave
	ret
	.globl	tac_function
	.def	tac_function;	.scl	2;	.type	32;	.endef
tac_function:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	create_subroutine
	movq	%rax, -8(%rbp)
	movq	24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -16(%rbp)
	jmp	.L120
.L121:
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rcx
	movq	%rcx, %r9
	movl	$112, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_append
.L120:
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L121
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -40(%rbp)
	jmp	.L122
.L123:
	movq	24(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	tac_statement
.L122:
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L123
	movq	24(%rbp), %rax
	movq	$0, 8(%rax)
	nop
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC9:
	.ascii "[Warning] Constructor '%s' does not start with 'self' initialization\12\0"
	.text
	.globl	tac_method
	.def	tac_method;	.scl	2;	.type	32;	.endef
tac_method:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$104, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	create_subroutine
	movq	%rax, -24(%rbp)
	movq	24(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -32(%rbp)
	jmp	.L125
.L126:
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rcx
	movq	%rcx, %r9
	movl	$112, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_append
.L125:
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L126
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -48(%rbp)
	movq	-24(%rbp), %rax
	movq	32(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -56(%rbp)
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	movq	24(%rax), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	make_method_name
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L131
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
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
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movq	24(%rax), %rax
	movq	%rbx, %r8
	leaq	.LC9(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L124
.L129:
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -72(%rbp)
	movq	24(%rbp), %rax
	movq	24(%rax), %rax
	addq	$24, %rax
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rax, %rbx
	movq	-72(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rcx
	movq	-72(%rbp), %rax
	movq	%rcx, %r9
	movl	$118, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movl	$0, %r9d
	movq	%rbx, %r8
	movq	%rax, %rdx
	movl	$18, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L131
.L132:
	movq	24(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	tac_statement
.L131:
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	jne	.L132
	movq	24(%rbp), %rax
	movq	$0, 8(%rax)
.L124:
	movq	-8(%rbp), %rbx
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC10:
	.ascii "[Warning] Unsupported class member type for tac_class: %d\12\0"
	.text
	.globl	tac_class
	.def	tac_class;	.scl	2;	.type	32;	.endef
tac_class:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$72, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -24(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	create_attribute_table
	movq	%rax, -32(%rbp)
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	jmp	.L134
.L139:
	movq	-40(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	je	.L135
	cmpl	$1, %eax
	je	.L136
	jmp	.L140
.L135:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_method
	jmp	.L134
.L136:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movl	$1, %r8d
	movq	%rax, %rcx
	call	tac_variable
	jmp	.L134
.L140:
	movq	-40(%rbp), %rax
	movl	8(%rax), %ebx
	call	__getreent
	movq	24(%rax), %rax
	movl	%ebx, %r8d
	leaq	.LC10(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
.L134:
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L139
	movq	24(%rbp), %rax
	movq	$0, 24(%rax)
	nop
	movq	-8(%rbp), %rbx
	leave
	ret
	.globl	tac_variable
	.def	tac_variable;	.scl	2;	.type	32;	.endef
tac_variable:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, %eax
	movb	%al, 32(%rbp)
	movq	$0, -16(%rbp)
	cmpb	$0, 32(%rbp)
	je	.L142
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	list_pop_back
	movq	%rax, -24(%rbp)
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %r8
	movq	24(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %rcx
	call	create_attribute
	jmp	.L146
.L142:
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rcx
	movq	%rcx, %r9
	movl	$118, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, -16(%rbp)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L144
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -8(%rbp)
	jmp	.L145
.L144:
	movq	$0, -32(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rax, -8(%rbp)
.L145:
	movq	-16(%rbp), %rax
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	-8(%rbp), %rdx
	movl	$0, %r9d
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$14, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_append
.L146:
	nop
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC11:
	.ascii "[Warning] 'break' statement used outside of loop\12\0"
	.align 8
.LC12:
	.ascii "[Warning] 'continue' statement used outside of loop\12\0"
	.align 8
.LC13:
	.ascii "[Warning] Unsupported statement type for tac_statement: %d\12\0"
	.text
	.globl	tac_statement
	.def	tac_statement;	.scl	2;	.type	32;	.endef
tac_statement:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$88, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
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
	.section .rdata,"dr"
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
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	jmp	.L158
.L156:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movl	$0, %r8d
	movq	%rax, %rcx
	call	tac_variable
	jmp	.L158
.L155:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_if
	jmp	.L158
.L154:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_while
	jmp	.L158
.L153:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_for
	jmp	.L158
.L152:
	movl	$0, %edx
	movl	$5, %ecx
	call	create_arg
	movq	%rax, -24(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L159
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -24(%rbp)
.L159:
	movq	-24(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$21, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L158
.L151:
	movq	24(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L160
	movq	24(%rbp), %rax
	movq	32(%rax), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	je	.L160
	movq	-48(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, -56(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-56(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	jmp	.L158
.L160:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$49, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L158
.L149:
	movq	24(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L161
	movq	24(%rbp), %rax
	movq	40(%rax), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L161
	movq	-32(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, -40(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-40(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	jmp	.L158
.L161:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC12(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L158
.L148:
	movq	16(%rbp), %rax
	movl	8(%rax), %ebx
	call	__getreent
	movq	24(%rax), %rax
	movl	%ebx, %r8d
	leaq	.LC13(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
.L158:
	nop
	movq	-8(%rbp), %rbx
	leave
	ret
	.globl	tac_if
	.def	tac_if;	.scl	2;	.type	32;	.endef
tac_if:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$200, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, -40(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, -24(%rbp)
	movq	$0, -32(%rbp)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L163
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L163
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	jmp	.L164
.L163:
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, -32(%rbp)
.L164:
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, -48(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -56(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rbx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$19, %ecx
	call	create_instruction
	movq	%rax, -64(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -72(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-72(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -80(%rbp)
	jmp	.L165
.L166:
	movq	24(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rax, %rcx
	call	tac_statement
.L165:
	movq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L166
	movq	-48(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, -96(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-96(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L167
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -104(%rbp)
	jmp	.L168
.L172:
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -120(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-120(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-120(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, -40(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, -24(%rbp)
	movq	-112(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -56(%rbp)
	movq	-104(%rbp), %rax
	movq	%rax, %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L169
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L169
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
.L169:
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rbx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$19, %ecx
	call	create_instruction
	movq	%rax, -64(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -72(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-72(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-112(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -128(%rbp)
	jmp	.L170
.L171:
	movq	24(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rax, %rcx
	call	tac_statement
.L170:
	movq	-128(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -136(%rbp)
	cmpq	$0, -136(%rbp)
	jne	.L171
	movq	-48(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, -96(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-96(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
.L168:
	movq	-104(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -112(%rbp)
	cmpq	$0, -112(%rbp)
	jne	.L172
.L167:
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L173
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -144(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-144(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-144(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -152(%rbp)
	jmp	.L174
.L175:
	movq	24(%rbp), %rdx
	movq	-160(%rbp), %rax
	movq	%rax, %rcx
	call	tac_statement
.L174:
	movq	-152(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -160(%rbp)
	cmpq	$0, -160(%rbp)
	jne	.L175
	movq	-48(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, -96(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-96(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
.L173:
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -168(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-168(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-168(%rbp), %rdx
	movq	%rdx, 16(%rax)
	nop
	movq	-8(%rbp), %rbx
	leave
	ret
	.globl	tac_for
	.def	tac_for;	.scl	2;	.type	32;	.endef
tac_for:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$168, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L177
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movl	$0, %r8d
	movq	%rax, %rcx
	call	tac_variable
.L177:
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, -32(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, -40(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, -48(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L178
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, -64(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -72(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-72(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -80(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	-80(%rbp), %rax
	movq	%rbx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$19, %ecx
	call	create_instruction
	movq	%rax, -64(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	jmp	.L179
.L178:
	movq	-40(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, -56(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-56(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
.L179:
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -88(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-88(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-88(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, -96(%rbp)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L180
	movq	-96(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L181
.L180:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L182
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L181
.L182:
	movq	-40(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, %rcx
	call	list_append
.L181:
	movq	-48(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -104(%rbp)
	jmp	.L183
.L184:
	movq	24(%rbp), %rdx
	movq	-112(%rbp), %rax
	movq	%rax, %rcx
	call	tac_statement
.L183:
	movq	-104(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -112(%rbp)
	cmpq	$0, -112(%rbp)
	jne	.L184
	movq	24(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, %rcx
	call	list_pop_back
	movq	24(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rcx
	call	list_pop_back
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L185
	movq	-96(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, -120(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-120(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -128(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-128(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-128(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
.L185:
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, -24(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L186
	movq	-40(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, -24(%rbp)
.L186:
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -136(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-136(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-136(%rbp), %rdx
	movq	%rdx, 16(%rax)
	nop
	movq	-8(%rbp), %rbx
	leave
	ret
	.globl	tac_while
	.def	tac_while;	.scl	2;	.type	32;	.endef
tac_while:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$120, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, -32(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -40(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-40(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, -48(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, -56(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -64(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rbx
	movq	-48(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rbx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$19, %ecx
	call	create_instruction
	movq	%rax, -32(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -72(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-72(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	movq	-56(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -80(%rbp)
	jmp	.L188
.L189:
	movq	24(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rax, %rcx
	call	tac_statement
.L188:
	movq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L189
	movq	24(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, %rcx
	call	list_pop_back
	movq	24(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rcx
	call	list_pop_back
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, -32(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -96(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-96(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-96(%rbp), %rdx
	movq	%rdx, 16(%rax)
	nop
	movq	-8(%rbp), %rbx
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC14:
	.ascii "[Warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.globl	tac_expression
	.def	tac_expression;	.scl	2;	.type	32;	.endef
tac_expression:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$96, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$19, %eax
	jne	.L191
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_primary
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	jmp	.L192
.L191:
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, %ecx
	call	get_instruction_type
	movl	%eax, -20(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, -32(%rbp)
	movq	16(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, %ecx
	call	is_assignment_operator
	testb	%al, %al
	je	.L193
	cmpl	$14, -20(%rbp)
	je	.L194
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, %r9
	movl	$116, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, -48(%rbp)
	movq	24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rax, %rcx
	movq	-8(%rbp), %r8
	movq	-48(%rbp), %rdx
	movl	-20(%rbp), %eax
	movq	%r8, %r9
	movq	%rcx, %r8
	movl	%eax, %ecx
	call	create_instruction
	movq	%rax, -16(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-48(%rbp), %rax
	movq	%rax, -8(%rbp)
.L194:
	movq	-32(%rbp), %rax
	movl	16(%rax), %eax
	testl	%eax, %eax
	je	.L195
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$57, %r8d
	movl	$1, %edx
	leaq	.LC14(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L195:
	movq	-8(%rbp), %rdx
	movq	-32(%rbp), %rax
	movl	$0, %r9d
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$14, %ecx
	call	create_instruction
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movzbl	20(%rax), %eax
	testb	%al, %al
	je	.L196
	movq	-8(%rbp), %rdx
	movq	-32(%rbp), %rax
	movl	$0, %r9d
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$24, %ecx
	call	create_instruction
	movq	%rax, -16(%rbp)
	jmp	.L196
.L193:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, %r9
	movl	$116, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, -40(%rbp)
	movq	24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rax, %rcx
	movq	-8(%rbp), %r8
	movq	-40(%rbp), %rdx
	movl	-20(%rbp), %eax
	movq	%r8, %r9
	movq	%rcx, %r8
	movl	%eax, %ecx
	call	create_instruction
	movq	%rax, -16(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -8(%rbp)
.L196:
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-8(%rbp), %rax
.L192:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC16:
	.ascii "[Warning] Unsupported type for negation: %s\12\0"
	.align 8
.LC17:
	.ascii "[Warning] Unsupported primary type for tac_primary: %d\12\0"
	.text
	.globl	tac_primary
	.def	tac_primary;	.scl	2;	.type	32;	.endef
tac_primary:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$136, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
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
	.section .rdata,"dr"
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
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	$10, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	strtoll
	movq	%rax, -72(%rbp)
	leaq	-72(%rbp), %rax
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_arg
	jmp	.L209
.L207:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	strtod
	movq	%xmm0, %rax
	movq	%rax, -80(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdx
	movl	$2, %ecx
	call	create_arg
	jmp	.L209
.L206:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movl	$3, %ecx
	call	create_arg
	jmp	.L209
.L205:
	movb	$1, -81(%rbp)
	leaq	-81(%rbp), %rax
	movq	%rax, %rdx
	movl	$4, %ecx
	call	create_arg
	jmp	.L209
.L204:
	movb	$0, -82(%rbp)
	leaq	-82(%rbp), %rax
	movq	%rax, %rdx
	movl	$4, %ecx
	call	create_arg
	jmp	.L209
.L203:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_expression
	jmp	.L209
.L202:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_primary
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -48(%rbp)
	movq	.refptr.name_bool(%rip), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, %r9
	movl	$116, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, -56(%rbp)
	movq	-48(%rbp), %rdx
	movq	-56(%rbp), %rax
	movl	$0, %r9d
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$13, %ecx
	call	create_instruction
	movq	%rax, -64(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-56(%rbp), %rax
	jmp	.L209
.L201:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_primary
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, %r9
	movl	$116, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, -40(%rbp)
	movq	$0, -24(%rbp)
	movq	$0, -96(%rbp)
	movsd	.LC15(%rip), %xmm0
	movsd	%xmm0, -104(%rbp)
	movq	-32(%rbp), %rax
	movq	8(%rax), %rdx
	movq	.refptr.name_int(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L210
	leaq	-96(%rbp), %rax
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	-32(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_instruction
	movq	%rax, -24(%rbp)
	jmp	.L211
.L210:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rdx
	movq	.refptr.name_float(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L212
	leaq	-104(%rbp), %rax
	movq	%rax, %rdx
	movl	$2, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	-32(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$2, %ecx
	call	create_instruction
	movq	%rax, -24(%rbp)
	jmp	.L211
.L212:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movq	24(%rax), %rax
	movq	%rbx, %r8
	leaq	.LC16(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$0, %eax
	jmp	.L209
.L211:
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-40(%rbp), %rax
	jmp	.L209
.L199:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_variable_access
	jmp	.L209
.L198:
	movq	16(%rbp), %rax
	movl	8(%rax), %ebx
	call	__getreent
	movq	24(%rax), %rax
	movl	%ebx, %r8d
	leaq	.LC17(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$0, %eax
.L209:
	movq	-8(%rbp), %rbx
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC18:
	.ascii "[Warning] Unsupported variable access with NULL base\12\0"
	.align 8
.LC19:
	.ascii "[Warning] Failed to generate variable access for base\12\0"
	.align 8
.LC20:
	.ascii "[Warning] Attempting to access attribute of non-object type: %s\12\0"
	.align 8
.LC21:
	.ascii "[Warning] Attribute '%s' not found in type '%s'\12\0"
	.align 8
.LC22:
	.ascii "[Warning] Attempting to access function '%s' as attribute of type '%s'\12\0"
	.align 8
.LC23:
	.ascii "[Warning] Symbol '%s' in type '%s' is not an attribute\12\0"
.LC24:
	.ascii "arr\0"
	.align 8
.LC25:
	.ascii "[Warning] Attempting to index non-array type: %s\12\0"
	.align 8
.LC26:
	.ascii "[Warning] Failed to generate variable access for index\12\0"
	.align 8
.LC27:
	.ascii "[Warning] Attempting to call non-function, kind: %u, type name: %s\12\0"
	.align 8
.LC28:
	.ascii "[Warning] Unsupported variable access type for tac_variable_access: %u\12\0"
	.text
	.globl	tac_variable_access
	.def	tac_variable_access;	.scl	2;	.type	32;	.endef
tac_variable_access:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	pushq	%rbx
	subq	$224, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movl	16(%rax), %eax
	testl	%eax, %eax
	jne	.L215
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L215
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$1, %eax
	je	.L216
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	jne	.L217
.L216:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rcx
	movq	%rcx, %r9
	movl	$102, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$7, %ecx
	call	create_arg
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	jmp	.L218
.L217:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L219
	movq	16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rcx
	movq	%rcx, %r9
	movl	$118, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	jmp	.L218
.L219:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rcx
	movq	%rcx, %r9
	movl	$118, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	jmp	.L218
.L215:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L220
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$53, %r8d
	movl	$1, %edx
	leaq	.LC18(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L218
.L220:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_variable_access
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L221
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$54, %r8d
	movl	$1, %edx
	leaq	.LC19(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L218
.L221:
	movq	16(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$2, %eax
	jne	.L222
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$1, %eax
	je	.L223
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	jne	.L224
.L223:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movq	24(%rax), %rax
	movq	%rbx, %r8
	leaq	.LC20(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$0, %eax
	jmp	.L218
.L224:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L225
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	movq	%rax, -32(%rbp)
.L225:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	search_name_use_strcmp
	movq	%rax, -152(%rbp)
	cmpq	$0, -152(%rbp)
	jne	.L226
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rsi
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movq	24(%rax), %rax
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC21(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$0, %eax
	jmp	.L218
.L226:
	movq	-152(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$1, %eax
	jne	.L227
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rsi
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movq	24(%rax), %rax
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC22(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	-152(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rcx
	movq	-152(%rbp), %rax
	movq	%rcx, %r9
	movl	$102, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$7, %ecx
	call	create_arg
	jmp	.L218
.L227:
	movq	-152(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	jne	.L228
	movq	-152(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rcx
	movq	-152(%rbp), %rax
	movq	%rcx, %r9
	movl	$102, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$8, %ecx
	call	create_arg
	jmp	.L218
.L228:
	movq	-152(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$5, %eax
	je	.L229
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rsi
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movq	24(%rax), %rax
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC23(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$0, %eax
	jmp	.L218
.L229:
	movq	-152(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, %r9
	movl	$116, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, -160(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rcx
	movq	%rcx, %r9
	movl	$97, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	-24(%rbp), %rcx
	movq	-160(%rbp), %rax
	movq	%rdx, %r9
	movq	%rcx, %r8
	movq	%rax, %rdx
	movl	$15, %ecx
	call	create_instruction
	movq	%rax, -168(%rbp)
	movq	-160(%rbp), %rax
	movb	$1, 20(%rax)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-168(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-160(%rbp), %rax
	jmp	.L218
.L222:
	movq	16(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$3, %eax
	jne	.L230
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	leaq	.LC24(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L231
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movq	24(%rax), %rax
	movq	%rbx, %r8
	leaq	.LC25(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$0, %eax
	jmp	.L218
.L231:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -128(%rbp)
	cmpq	$0, -128(%rbp)
	jne	.L232
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$55, %r8d
	movl	$1, %edx
	leaq	.LC26(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L218
.L232:
	movq	.refptr.name_int(%rip), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, %r9
	movl	$116, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, -136(%rbp)
	movq	-128(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$16, %ecx
	call	create_instruction
	movq	%rax, -144(%rbp)
	movq	-136(%rbp), %rax
	movb	$1, 20(%rax)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-144(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-136(%rbp), %rax
	jmp	.L218
.L230:
	movq	16(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$1, %eax
	jne	.L233
	movq	-24(%rbp), %rax
	movl	16(%rax), %eax
	testl	%eax, %eax
	jne	.L234
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L234
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	make_method_name
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	search_name_use_strcmp
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rcx
	movq	-64(%rbp), %rax
	movq	%rcx, %r9
	movl	$102, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$8, %ecx
	call	create_arg
	movq	%rax, -24(%rbp)
.L234:
	movq	-24(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$8, %eax
	je	.L235
	movq	-24(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$7, %eax
	je	.L235
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rsi
	movq	-24(%rbp), %rax
	movl	16(%rax), %ebx
	call	__getreent
	movq	24(%rax), %rax
	movq	%rsi, %r9
	movl	%ebx, %r8d
	leaq	.LC27(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$0, %eax
	jmp	.L218
.L235:
	movq	$0, -176(%rbp)
	call	create_list
	movq	%rax, -72(%rbp)
	movq	-24(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$8, %eax
	jne	.L237
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	make_method_name
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L237
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$8, %ecx
	call	create_primary
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	tac_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	get_type_size
	movq	%rax, -184(%rbp)
	leaq	-184(%rbp), %rax
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_arg
	movq	-80(%rbp), %rdx
	movl	$0, %r9d
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$17, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	-176(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -176(%rbp)
.L237:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -88(%rbp)
	jmp	.L238
.L239:
	movq	24(%rbp), %rdx
	movq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -120(%rbp)
	movq	-120(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	get_type_size
	movq	%rax, -192(%rbp)
	leaq	-192(%rbp), %rax
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_arg
	movq	-120(%rbp), %rdx
	movl	$0, %r9d
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$17, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	-176(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -176(%rbp)
.L238:
	movq	-88(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -96(%rbp)
	cmpq	$0, -96(%rbp)
	jne	.L239
	jmp	.L240
.L241:
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-104(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
.L240:
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -104(%rbp)
	cmpq	$0, -104(%rbp)
	jne	.L241
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, %r9
	movl	$116, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, -112(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	-24(%rbp), %rcx
	movq	-112(%rbp), %rax
	movq	%rdx, %r9
	movq	%rcx, %r8
	movq	%rax, %rdx
	movl	$22, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	movq	-112(%rbp), %rax
	jmp	.L218
.L233:
	movq	16(%rbp), %rax
	movl	16(%rax), %ebx
	call	__getreent
	movq	24(%rax), %rax
	movl	%ebx, %r8d
	leaq	.LC28(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$0, %eax
.L218:
	addq	$224, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC15:
	.long	0
	.long	-1074790400
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	list_is_empty;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	make_method_name;	.scl	2;	.type	32;	.endef
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
	.def	strtoll;	.scl	2;	.type	32;	.endef
	.def	strtod;	.scl	2;	.type	32;	.endef
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	create_expression;	.scl	2;	.type	32;	.endef
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
