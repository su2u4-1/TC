	.file	"D:\\TC\\temp\\codegen.c"
	.text
	.def	find_attribute_table;	.scl	3;	.type	32;	.endef
find_attribute_table:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -8(%rbp)
	jmp	.L2
.L4:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, 24(%rbp)
	jne	.L2
	movq	-16(%rbp), %rax
	jmp	.L3
.L2:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L4
	movl	$0, %eax
.L3:
	leave
	ret
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
	.ascii "[warning] Unsupported type for size lookup: %s\12\0"
	.text
	.def	get_type_size;	.scl	3;	.type	32;	.endef
get_type_size:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L8
	movl	$0, %eax
	jmp	.L9
.L8:
	movq	.refptr.name_int(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, 16(%rbp)
	je	.L10
	movq	.refptr.name_float(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, 16(%rbp)
	je	.L10
	movq	.refptr.name_string(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L11
.L10:
	movl	$8, %eax
	jmp	.L9
.L11:
	movq	.refptr.name_bool(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, 16(%rbp)
	je	.L12
	movq	.refptr.name_void(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L13
.L12:
	movl	$1, %eax
	jmp	.L9
.L13:
	movq	16(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L14
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	24(%rax), %rax
	jmp	.L9
.L14:
	movq	16(%rbp), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movq	24(%rax), %rax
	movq	%rbx, %r8
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$8, %eax
.L9:
	movq	-8(%rbp), %rbx
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC1:
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
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	cmpq	$0, 40(%rbp)
	jne	.L16
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
.L16:
	cmpq	$0, 32(%rbp)
	je	.L17
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L18
.L17:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$63, %r8d
	movl	$1, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L19
.L18:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
.L19:
	movq	-8(%rbp), %rax
	leave
	ret
	.def	is_assignment_operator;	.scl	3;	.type	32;	.endef
is_assignment_operator:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%ecx, 16(%rbp)
	cmpl	$13, 16(%rbp)
	je	.L22
	cmpl	$14, 16(%rbp)
	je	.L22
	cmpl	$15, 16(%rbp)
	je	.L22
	cmpl	$16, 16(%rbp)
	je	.L22
	cmpl	$17, 16(%rbp)
	je	.L22
	cmpl	$18, 16(%rbp)
	jne	.L23
.L22:
	movl	$1, %eax
	jmp	.L24
.L23:
	movl	$0, %eax
.L24:
	popq	%rbp
	ret
	.def	get_instruction_type;	.scl	3;	.type	32;	.endef
get_instruction_type:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%ecx, 16(%rbp)
	cmpl	$18, 16(%rbp)
	ja	.L27
	movl	16(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L29(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L29(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
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
	movl	$88, %ecx
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
	movq	%rax, 24(%rdx)
	call	create_list
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
	.section .rdata,"dr"
.LC2:
	.ascii "\0"
.LC3:
	.ascii "$%d-error\0"
.LC4:
	.ascii "$%c%zu\0"
	.text
	.def	create_var;	.scl	3;	.type	32;	.endef
create_var:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movq	%r9, 40(%rbp)
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movl	32(%rbp), %eax
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
	.section .rdata,"dr"
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
	movq	40(%rbp), %rax
	movq	40(%rax), %rax
	leaq	1(%rax), %rcx
	movq	40(%rbp), %rdx
	movq	%rcx, 40(%rdx)
	movq	%rax, -8(%rbp)
	jmp	.L61
.L57:
	movq	40(%rbp), %rax
	movq	48(%rax), %rax
	leaq	1(%rax), %rcx
	movq	40(%rbp), %rdx
	movq	%rcx, 48(%rdx)
	movq	%rax, -8(%rbp)
	jmp	.L61
.L54:
	movq	40(%rbp), %rax
	movq	56(%rax), %rax
	leaq	1(%rax), %rcx
	movq	40(%rbp), %rdx
	movq	%rcx, 56(%rdx)
	movq	%rax, -8(%rbp)
	jmp	.L61
.L56:
	movq	40(%rbp), %rax
	movq	64(%rax), %rax
	leaq	1(%rax), %rcx
	movq	40(%rbp), %rdx
	movq	%rcx, 64(%rdx)
	movq	%rax, -8(%rbp)
	jmp	.L61
.L59:
	movq	40(%rbp), %rax
	movq	72(%rax), %rax
	leaq	1(%rax), %rcx
	movq	40(%rbp), %rdx
	movq	%rcx, 72(%rdx)
	movq	%rax, -8(%rbp)
	jmp	.L61
.L58:
	movq	40(%rbp), %rax
	movq	80(%rax), %rax
	leaq	1(%rax), %rcx
	movq	40(%rbp), %rdx
	movq	%rcx, 80(%rdx)
	movq	%rax, -8(%rbp)
	jmp	.L61
.L53:
	movq	$-1, -8(%rbp)
	nop
.L61:
	movl	$32, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	-16(%rbp), %rdx
	movq	%rax, 8(%rdx)
	cmpq	$-1, -8(%rbp)
	jne	.L62
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rbp), %edx
	movl	%edx, %r8d
	leaq	.LC3(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	jmp	.L63
.L62:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	32(%rbp), %edx
	movq	%rcx, %r9
	movl	%edx, %r8d
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
.L63:
	movq	-16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-16(%rbp), %rax
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
.LC5:
	.ascii "[warning] Unsupported argument type for create_arg: %d\12\0"
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
	cmpl	$7, 16(%rbp)
	ja	.L68
	movl	16(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L70(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L70(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
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
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L78
.L76:
	movq	24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	.refptr.name_int(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L78
.L75:
	movq	24(%rbp), %rax
	movsd	(%rax), %xmm0
	movq	-8(%rbp), %rax
	movsd	%xmm0, (%rax)
	movq	.refptr.name_float(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L78
.L74:
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	.refptr.name_string(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L78
.L73:
	movq	24(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	movq	.refptr.name_bool(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L78
.L72:
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	.refptr.name_void(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L78
.L71:
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L78
.L69:
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L78
.L68:
	call	__getreent
	movq	24(%rax), %rax
	movl	16(%rbp), %edx
	movl	%edx, %r8d
	leaq	.LC5(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
.L78:
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
	jne	.L81
	movl	$0, %eax
	jmp	.L82
.L81:
	movq	16(%rbp), %rax
	movzbl	20(%rax), %eax
	testb	%al, %al
	je	.L83
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
	jmp	.L82
.L83:
	movq	16(%rbp), %rax
.L82:
	leave
	ret
	.def	find_var_by_symbol;	.scl	3;	.type	32;	.endef
find_var_by_symbol:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L85
	cmpq	$0, 24(%rbp)
	jne	.L86
.L85:
	movl	$0, %eax
	jmp	.L87
.L86:
	movq	16(%rbp), %rax
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
	cmpq	%rax, 24(%rbp)
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
	leave
	ret
	.def	resolve_named_var;	.scl	3;	.type	32;	.endef
resolve_named_var:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L92
	cmpq	$0, 24(%rbp)
	jne	.L93
.L92:
	movl	$0, %eax
	jmp	.L94
.L93:
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L95
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	16(%rax), %rax
	movq	16(%rbp), %rdx
	movq	%rax, %rcx
	call	find_var_by_symbol
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L96
	movq	-8(%rbp), %rax
	jmp	.L94
.L96:
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	16(%rbp), %rdx
	movq	%rax, %rcx
	call	find_var_by_symbol
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L95
	movq	-8(%rbp), %rax
	jmp	.L94
.L95:
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	16(%rbp), %rdx
	movq	%rax, %rcx
	call	find_var_by_symbol
.L94:
	leave
	ret
	.def	find_self_parameter;	.scl	3;	.type	32;	.endef
find_self_parameter:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L98
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L99
.L98:
	movl	$0, %eax
	jmp	.L100
.L99:
	movq	16(%rbp), %rax
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
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
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
	.section .rdata,"dr"
.LC6:
	.ascii "<unknown>\0"
	.align 8
.LC7:
	.ascii "[warning] Attribute '%s' not found in class '%s', fallback index %zu\12\0"
.LC8:
	.ascii "$a%zu\0"
	.text
	.def	create_attribute_ref_var;	.scl	3;	.type	32;	.endef
create_attribute_ref_var:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	pushq	%rbx
	subq	$96, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	cmpq	$0, 24(%rbp)
	jne	.L105
	movl	$0, %eax
	jmp	.L106
.L105:
	movq	16(%rbp), %rdx
	movq	32(%rbp), %rax
	movq	%rax, %rcx
	call	find_attribute_table
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	je	.L107
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L108
.L107:
	movq	24(%rbp), %rax
	movq	(%rax), %rdx
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$97, %r8d
	movq	%rax, %rcx
	call	create_var
	jmp	.L106
.L108:
	movq	$0, -24(%rbp)
	movb	$0, -25(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -48(%rbp)
	jmp	.L109
.L112:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, 24(%rbp)
	jne	.L110
	movb	$1, -25(%rbp)
	jmp	.L111
.L110:
	addq	$1, -24(%rbp)
.L109:
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L112
.L111:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, 16(%rax)
	movl	$32, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	-64(%rbp), %rdx
	movq	%rax, 8(%rdx)
	cmpb	$0, -25(%rbp)
	jne	.L113
	cmpq	$0, 16(%rbp)
	je	.L114
	movq	16(%rbp), %rax
	movq	8(%rax), %rbx
	jmp	.L115
.L114:
	leaq	.LC6(%rip), %rbx
.L115:
	movq	24(%rbp), %rax
	movq	8(%rax), %rsi
	call	__getreent
	movq	24(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movq	%rbx, %r9
	movq	%rsi, %r8
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L113:
	movq	-64(%rbp), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %r8
	leaq	.LC8(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movq	-64(%rbp), %rax
.L106:
	addq	$96, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC9:
	.ascii "[warning] Invalid attribute access\12\0"
	.text
	.def	emit_attribute_access;	.scl	3;	.type	32;	.endef
emit_attribute_access:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L117
	cmpq	$0, 24(%rbp)
	jne	.L118
.L117:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$35, %r8d
	movl	$1, %edx
	leaq	.LC9(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L119
.L118:
	movq	32(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
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
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	create_attribute_ref_var
	movq	%rax, -24(%rbp)
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, %r9
	movl	$116, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	-16(%rbp), %rcx
	movq	-32(%rbp), %rax
	movq	%rdx, %r9
	movq	%rcx, %r8
	movq	%rax, %rdx
	movl	$15, %ecx
	call	create_instruction
	movq	%rax, -40(%rbp)
	movq	32(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-40(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-32(%rbp), %rax
	movb	$1, 20(%rax)
	movq	-32(%rbp), %rax
.L119:
	leave
	ret
	.def	emit_param_instruction;	.scl	3;	.type	32;	.endef
emit_param_instruction:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L126
	cmpq	$0, 24(%rbp)
	je	.L126
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	get_type_size
	movq	%rax, -16(%rbp)
	leaq	-16(%rbp), %rax
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_arg
	movq	16(%rbp), %rdx
	movl	$0, %r9d
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$17, %ecx
	call	create_instruction
	movq	%rax, -8(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	jmp	.L122
.L126:
	nop
.L122:
	leave
	ret
	.section .rdata,"dr"
.LC10:
	.ascii "main\0"
	.text
	.globl	codegen_code
	.def	codegen_code;	.scl	2;	.type	32;	.endef
codegen_code:
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
	jmp	.L128
.L132:
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$1, %eax
	jne	.L129
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rax, %rcx
	call	codegen_function
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	leaq	.LC10(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
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
	movq	%rax, %rcx
	call	codegen_class
	jmp	.L128
.L131:
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	jne	.L128
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rdx
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	codegen_import
.L128:
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L132
	movq	-8(%rbp), %rax
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC11:
	.ascii "[warning] Unsupported symbol kind for import: %d\12\0"
	.text
	.globl	codegen_import
	.def	codegen_import;	.scl	2;	.type	32;	.endef
codegen_import:
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
	jne	.L135
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
	jmp	.L140
.L135:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$1, %eax
	je	.L137
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	jne	.L138
.L137:
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
	jmp	.L140
.L138:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L139
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	create_attribute_table
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L140
.L139:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %ebx
	call	__getreent
	movq	24(%rax), %rax
	movl	%ebx, %r8d
	leaq	.LC11(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L140:
	nop
	movq	-8(%rbp), %rbx
	leave
	ret
	.globl	codegen_function
	.def	codegen_function;	.scl	2;	.type	32;	.endef
codegen_function:
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
	jmp	.L142
.L143:
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
.L142:
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L143
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
	jmp	.L144
.L145:
	movq	24(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	codegen_statement
.L144:
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L145
	movq	24(%rbp), %rax
	movq	$0, 8(%rax)
	nop
	leave
	ret
	.globl	codegen_method
	.def	codegen_method;	.scl	2;	.type	32;	.endef
codegen_method:
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
	jmp	.L147
.L148:
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
.L147:
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L148
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
	jmp	.L149
.L150:
	movq	24(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	codegen_statement
.L149:
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L150
	movq	24(%rbp), %rax
	movq	$0, 8(%rax)
	nop
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC12:
	.ascii "[warning] Unsupported class member type for codegen_class: %d\12\0"
	.text
	.globl	codegen_class
	.def	codegen_class;	.scl	2;	.type	32;	.endef
codegen_class:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$72, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
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
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	jmp	.L152
.L157:
	movq	-40(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	je	.L153
	cmpl	$1, %eax
	je	.L154
	jmp	.L158
.L153:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	codegen_method
	jmp	.L152
.L154:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movl	$97, %r8d
	movq	%rax, %rcx
	call	codegen_variable
	jmp	.L152
.L158:
	movq	-40(%rbp), %rax
	movl	8(%rax), %ebx
	call	__getreent
	movq	24(%rax), %rax
	movl	%ebx, %r8d
	leaq	.LC12(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
.L152:
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L157
	nop
	nop
	movq	-8(%rbp), %rbx
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC13:
	.ascii "[warning] Unsupported variable type for codegen_variable: %d\12\0"
	.text
	.globl	codegen_variable
	.def	codegen_variable;	.scl	2;	.type	32;	.endef
codegen_variable:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %r8
	movl	32(%rbp), %ecx
	movq	%r8, %r9
	movl	%ecx, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, -8(%rbp)
	movl	32(%rbp), %eax
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
	.section .rdata,"dr"
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
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	16(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	jmp	.L167
.L161:
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	jmp	.L167
.L163:
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	jmp	.L167
.L165:
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	jmp	.L167
.L166:
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	list_pop_back
	movq	%rax, -16(%rbp)
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rcx
	movl	$0, %r9d
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	create_attribute
	jmp	.L167
.L160:
	call	__getreent
	movq	24(%rax), %rax
	movl	32(%rbp), %edx
	movl	%edx, %r8d
	leaq	.LC13(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
.L167:
	nop
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC14:
	.ascii "[warning] 'break' statement used outside of loop\12\0"
	.align 8
.LC15:
	.ascii "[warning] 'continue' statement used outside of loop\12\0"
	.align 8
.LC16:
	.ascii "[warning] Unsupported statement type for codegen_statement: %d\12\0"
	.text
	.globl	codegen_statement
	.def	codegen_statement;	.scl	2;	.type	32;	.endef
codegen_statement:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$88, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
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
	.section .rdata,"dr"
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
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	codegen_expression
	jmp	.L179
.L177:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movl	$118, %r8d
	movq	%rax, %rcx
	call	codegen_variable
	jmp	.L179
.L176:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	codegen_if
	jmp	.L179
.L175:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	codegen_while
	jmp	.L179
.L174:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	codegen_for
	jmp	.L179
.L173:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	codegen_expression
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$21, %ecx
	call	create_instruction
	movq	%rax, -64(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	jmp	.L179
.L172:
	movq	24(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L180
	movq	24(%rbp), %rax
	movq	24(%rax), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	je	.L180
	movq	-40(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, -48(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	jmp	.L179
.L180:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$49, %r8d
	movl	$1, %edx
	leaq	.LC14(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L179
.L170:
	movq	24(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L181
	movq	24(%rbp), %rax
	movq	32(%rax), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L181
	movq	-24(%rbp), %rax
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
	jmp	.L179
.L181:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L179
.L169:
	movq	16(%rbp), %rax
	movl	8(%rax), %ebx
	call	__getreent
	movq	24(%rax), %rax
	movl	%ebx, %r8d
	leaq	.LC16(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
.L179:
	nop
	movq	-8(%rbp), %rbx
	leave
	ret
	.globl	codegen_if
	.def	codegen_if;	.scl	2;	.type	32;	.endef
codegen_if:
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
	je	.L183
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L183
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	jmp	.L184
.L183:
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, -32(%rbp)
.L184:
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, -48(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	codegen_expression
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
	jmp	.L185
.L186:
	movq	24(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rax, %rcx
	call	codegen_statement
.L185:
	movq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L186
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
	jne	.L187
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -104(%rbp)
	jmp	.L188
.L192:
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
	call	codegen_expression
	movq	%rax, -56(%rbp)
	movq	-104(%rbp), %rax
	movq	%rax, %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L189
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L189
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
.L189:
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
	jmp	.L190
.L191:
	movq	24(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rax, %rcx
	call	codegen_statement
.L190:
	movq	-128(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -136(%rbp)
	cmpq	$0, -136(%rbp)
	jne	.L191
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
.L188:
	movq	-104(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -112(%rbp)
	cmpq	$0, -112(%rbp)
	jne	.L192
.L187:
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L193
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
	jmp	.L194
.L195:
	movq	24(%rbp), %rdx
	movq	-160(%rbp), %rax
	movq	%rax, %rcx
	call	codegen_statement
.L194:
	movq	-152(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -160(%rbp)
	cmpq	$0, -160(%rbp)
	jne	.L195
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
.L193:
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
	.globl	codegen_for
	.def	codegen_for;	.scl	2;	.type	32;	.endef
codegen_for:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$168, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L197
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movl	$118, %r8d
	movq	%rax, %rcx
	call	codegen_variable
.L197:
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
	je	.L198
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
	call	codegen_expression
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
	jmp	.L199
.L198:
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
.L199:
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
	je	.L200
	movq	-96(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L201
.L200:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L202
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L201
.L202:
	movq	-40(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rcx
	call	list_append
.L201:
	movq	-48(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -104(%rbp)
	jmp	.L203
.L204:
	movq	24(%rbp), %rdx
	movq	-112(%rbp), %rax
	movq	%rax, %rcx
	call	codegen_statement
.L203:
	movq	-104(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -112(%rbp)
	cmpq	$0, -112(%rbp)
	jne	.L204
	movq	24(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rcx
	call	list_pop_back
	movq	24(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_pop_back
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L205
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
	call	codegen_expression
.L205:
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
	jne	.L206
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
.L206:
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
	.globl	codegen_while
	.def	codegen_while;	.scl	2;	.type	32;	.endef
codegen_while:
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
	call	codegen_expression
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
	movq	32(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	movq	-56(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -80(%rbp)
	jmp	.L208
.L209:
	movq	24(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rax, %rcx
	call	codegen_statement
.L208:
	movq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L209
	movq	24(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rcx
	call	list_pop_back
	movq	24(%rbp), %rax
	movq	24(%rax), %rax
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
.LC17:
	.ascii "[warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.globl	codegen_expression
	.def	codegen_expression;	.scl	2;	.type	32;	.endef
codegen_expression:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$19, %eax
	jne	.L211
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	codegen_primary
	jmp	.L212
.L211:
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	codegen_expression
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
	call	codegen_expression
	movq	%rax, -32(%rbp)
	movq	16(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, %ecx
	call	is_assignment_operator
	testb	%al, %al
	je	.L213
	cmpl	$14, -20(%rbp)
	je	.L214
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
.L214:
	movq	-32(%rbp), %rax
	movl	16(%rax), %eax
	testl	%eax, %eax
	je	.L215
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$57, %r8d
	movl	$1, %edx
	leaq	.LC17(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L215:
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
	je	.L216
	movq	-8(%rbp), %rdx
	movq	-32(%rbp), %rax
	movl	$0, %r9d
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$24, %ecx
	call	create_instruction
	movq	%rax, -16(%rbp)
	jmp	.L216
.L213:
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
.L216:
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-8(%rbp), %rax
.L212:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC19:
	.ascii "[warning] Unsupported type for negation: %s\12\0"
	.align 8
.LC20:
	.ascii "[warning] Unsupported primary type for codegen_primary: %d\12\0"
	.text
	.globl	codegen_primary
	.def	codegen_primary;	.scl	2;	.type	32;	.endef
codegen_primary:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$136, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
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
	.section .rdata,"dr"
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
	jmp	.L229
.L227:
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
	jmp	.L229
.L226:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movl	$3, %ecx
	call	create_arg
	jmp	.L229
.L225:
	movb	$1, -81(%rbp)
	leaq	-81(%rbp), %rax
	movq	%rax, %rdx
	movl	$4, %ecx
	call	create_arg
	jmp	.L229
.L224:
	movb	$0, -82(%rbp)
	leaq	-82(%rbp), %rax
	movq	%rax, %rdx
	movl	$4, %ecx
	call	create_arg
	jmp	.L229
.L223:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	codegen_expression
	jmp	.L229
.L222:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	codegen_primary
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
	jmp	.L229
.L221:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	codegen_primary
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
	movsd	.LC18(%rip), %xmm0
	movsd	%xmm0, -104(%rbp)
	movq	-32(%rbp), %rax
	movq	8(%rax), %rdx
	movq	.refptr.name_int(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L230
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
	jmp	.L231
.L230:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rdx
	movq	.refptr.name_float(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L232
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
	jmp	.L231
.L232:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movq	24(%rax), %rax
	movq	%rbx, %r8
	leaq	.LC19(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$0, %eax
	jmp	.L229
.L231:
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-40(%rbp), %rax
	jmp	.L229
.L219:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	codegen_variable_access
	jmp	.L229
.L218:
	movq	16(%rbp), %rax
	movl	8(%rax), %ebx
	call	__getreent
	movq	24(%rax), %rax
	movl	%ebx, %r8d
	leaq	.LC20(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$0, %eax
.L229:
	movq	-8(%rbp), %rbx
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC21:
	.ascii "[warning] Invalid variable access input\12\0"
	.align 8
.LC22:
	.ascii "[warning] Variable access name is NULL\12\0"
	.align 8
.LC23:
	.ascii "[warning] Unresolved variable access for '%s', creating fallback local\12\0"
	.align 8
.LC24:
	.ascii "[warning] Invalid get-attribute access\12\0"
	.align 8
.LC25:
	.ascii "[warning] Failed to generate object for get-attribute access\12\0"
	.align 8
.LC26:
	.ascii "[warning] Invalid get-sequence access\12\0"
	.align 8
.LC27:
	.ascii "[warning] Failed to generate sequence/index for get-sequence access\12\0"
	.align 8
.LC28:
	.ascii "[warning] Invalid function call without callee\12\0"
	.align 8
.LC29:
	.ascii "[warning] Failed to generate callee for function call\12\0"
	.align 8
.LC30:
	.ascii "[warning] Unsupported callee in function call\12\0"
	.align 8
.LC31:
	.ascii "[warning] Failed to generate function call argument\12\0"
	.align 8
.LC32:
	.ascii "[warning] Unsupported variable access type for codegen_variable_access: %d\12\0"
	.text
	.globl	codegen_variable_access
	.def	codegen_variable_access;	.scl	2;	.type	32;	.endef
codegen_variable_access:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$232, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L235
	cmpq	$0, 24(%rbp)
	jne	.L236
.L235:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$40, %r8d
	movl	$1, %edx
	leaq	.LC21(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L237
.L236:
	movq	16(%rbp), %rax
	movl	16(%rax), %eax
	testl	%eax, %eax
	jne	.L238
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -184(%rbp)
	cmpq	$0, -184(%rbp)
	jne	.L239
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$39, %r8d
	movl	$1, %edx
	leaq	.LC22(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L237
.L239:
	movq	24(%rbp), %rdx
	movq	-184(%rbp), %rax
	movq	%rax, %rcx
	call	resolve_named_var
	movq	%rax, -192(%rbp)
	cmpq	$0, -192(%rbp)
	je	.L240
	movq	-192(%rbp), %rax
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	jmp	.L237
.L240:
	movq	-184(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$1, %eax
	je	.L241
	movq	-184(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	je	.L241
	movq	-184(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L242
.L241:
	movq	-184(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rcx
	movq	-184(%rbp), %rax
	movq	%rcx, %r9
	movl	$102, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$7, %ecx
	call	create_arg
	jmp	.L237
.L242:
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	find_self_parameter
	movq	%rax, -200(%rbp)
	cmpq	$0, -200(%rbp)
	je	.L243
	movq	-200(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L243
	movq	-200(%rbp), %rax
	movq	16(%rax), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L243
	movq	-184(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-200(%rbp), %rax
	movq	16(%rax), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L243
	movq	-200(%rbp), %rax
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rcx
	movq	24(%rbp), %rdx
	movq	-184(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	call	emit_attribute_access
	jmp	.L237
.L243:
	movq	-184(%rbp), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movq	24(%rax), %rax
	movq	%rbx, %r8
	leaq	.LC23(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	-184(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rcx
	movq	-184(%rbp), %rax
	movq	%rcx, %r9
	movl	$118, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	jmp	.L237
.L238:
	movq	16(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$2, %eax
	jne	.L244
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L245
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L246
.L245:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$39, %r8d
	movl	$1, %edx
	leaq	.LC24(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L237
.L246:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -168(%rbp)
	movq	-168(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	je	.L247
	movq	-168(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$1, %eax
	jne	.L248
.L247:
	movq	-168(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rcx
	movq	-168(%rbp), %rax
	movq	%rcx, %r9
	movl	$102, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$7, %ecx
	call	create_arg
	jmp	.L237
.L248:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	codegen_variable_access
	movq	%rax, -176(%rbp)
	cmpq	$0, -176(%rbp)
	jne	.L249
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$61, %r8d
	movl	$1, %edx
	leaq	.LC25(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L237
.L249:
	movq	24(%rbp), %rcx
	movq	-168(%rbp), %rdx
	movq	-176(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	emit_attribute_access
	jmp	.L237
.L244:
	movq	16(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$3, %eax
	jne	.L250
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L251
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L252
.L251:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC26(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L237
.L252:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	codegen_variable_access
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -136(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	codegen_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -144(%rbp)
	cmpq	$0, -136(%rbp)
	je	.L253
	cmpq	$0, -144(%rbp)
	jne	.L254
.L253:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$68, %r8d
	movl	$1, %edx
	leaq	.LC27(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L237
.L254:
	movq	.refptr.name_int(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-136(%rbp), %rax
	movq	8(%rax), %rdx
	movq	.refptr.name_float(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	je	.L255
	movq	-136(%rbp), %rax
	movq	8(%rax), %rdx
	movq	.refptr.name_bool(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	je	.L255
	movq	-136(%rbp), %rax
	movq	8(%rax), %rdx
	movq	.refptr.name_string(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L256
.L255:
	movq	-136(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
.L256:
	movq	24(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %r9
	movl	$116, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, -152(%rbp)
	movq	-144(%rbp), %rcx
	movq	-136(%rbp), %rdx
	movq	-152(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$16, %ecx
	call	create_instruction
	movq	%rax, -160(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-160(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-152(%rbp), %rax
	movb	$1, 20(%rax)
	movq	-152(%rbp), %rax
	jmp	.L237
.L250:
	movq	16(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$1, %eax
	jne	.L257
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L258
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$47, %r8d
	movl	$1, %edx
	leaq	.LC28(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L237
.L258:
	movq	$0, -32(%rbp)
	movq	$0, -40(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$2, %eax
	jne	.L260
	movq	-72(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L260
	movq	-72(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	je	.L261
	movq	-72(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$1, %eax
	jne	.L260
.L261:
	movq	-72(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L260
	movb	$0, -41(%rbp)
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movl	16(%rax), %eax
	testl	%eax, %eax
	jne	.L262
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L262
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L262
	movb	$1, -41(%rbp)
.L262:
	cmpb	$0, -41(%rbp)
	jne	.L260
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	codegen_variable_access
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -40(%rbp)
.L260:
	cmpq	$0, -32(%rbp)
	jne	.L263
	movq	24(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	call	codegen_variable_access
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	jne	.L264
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$54, %r8d
	movl	$1, %edx
	leaq	.LC29(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L237
.L264:
	movq	-80(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$7, %eax
	jne	.L265
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L265
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	jmp	.L263
.L265:
	movq	-80(%rbp), %rax
	movl	16(%rax), %eax
	testl	%eax, %eax
	jne	.L263
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L263
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L263
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$1, %eax
	je	.L266
	movq	-88(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	jne	.L263
.L266:
	movq	-88(%rbp), %rax
	movq	%rax, -32(%rbp)
.L263:
	cmpq	$0, -32(%rbp)
	jne	.L267
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$46, %r8d
	movl	$1, %edx
	leaq	.LC30(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L237
.L267:
	movq	$0, -56(%rbp)
	cmpq	$0, -40(%rbp)
	je	.L268
	movq	24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	emit_param_instruction
	addq	$1, -56(%rbp)
.L268:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -96(%rbp)
	jmp	.L269
.L271:
	movq	24(%rbp), %rdx
	movq	-104(%rbp), %rax
	movq	%rax, %rcx
	call	codegen_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -128(%rbp)
	cmpq	$0, -128(%rbp)
	jne	.L270
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC31(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L237
.L270:
	movq	24(%rbp), %rdx
	movq	-128(%rbp), %rax
	movq	%rax, %rcx
	call	emit_param_instruction
	addq	$1, -56(%rbp)
.L269:
	movq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -104(%rbp)
	cmpq	$0, -104(%rbp)
	jne	.L271
	movl	$0, %edx
	movl	$5, %ecx
	call	create_arg
	movq	%rax, -64(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L272
	movq	-32(%rbp), %rax
	movq	(%rax), %rdx
	movq	.refptr.name_void(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	je	.L272
	movq	-32(%rbp), %rax
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
	movq	%rax, -64(%rbp)
.L272:
	movq	-56(%rbp), %rax
	movq	%rax, -208(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rcx
	movq	-32(%rbp), %rax
	movq	%rcx, %r9
	movl	$102, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$7, %ecx
	call	create_arg
	movq	%rax, -112(%rbp)
	leaq	-208(%rbp), %rax
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	-112(%rbp), %rcx
	movq	-64(%rbp), %rax
	movq	%rdx, %r9
	movq	%rcx, %r8
	movq	%rax, %rdx
	movl	$22, %ecx
	call	create_instruction
	movq	%rax, -120(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-120(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-64(%rbp), %rax
	jmp	.L237
.L257:
	movq	16(%rbp), %rax
	movl	16(%rax), %ebx
	call	__getreent
	movq	24(%rax), %rax
	movl	%ebx, %r8d
	leaq	.LC32(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$0, %eax
.L237:
	movq	-8(%rbp), %rbx
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC18:
	.long	0
	.long	-1074790400
	.ident	"GCC: (GNU) 13.2.0"
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
	.def	list_is_empty;	.scl	2;	.type	32;	.endef
	.def	strtoll;	.scl	2;	.type	32;	.endef
	.def	strtod;	.scl	2;	.type	32;	.endef
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
