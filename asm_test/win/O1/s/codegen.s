	.file	"D:\\TC\\temp\\codegen.c"
	.text
	.def	find_var_by_symbol;	.scl	3;	.type	32;	.endef
find_var_by_symbol:
	testq	%rcx, %rcx
	je	.L5
	testq	%rdx, %rdx
	je	.L5
	movq	(%rcx), %rax
	testq	%rax, %rax
	jne	.L4
	ret
.L3:
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L8
.L4:
	movq	8(%rax), %rcx
	testq	%rcx, %rcx
	je	.L3
	cmpq	%rdx, (%rcx)
	jne	.L3
	movq	%rcx, %rax
.L1:
	ret
.L8:
	ret
.L5:
	movl	$0, %eax
	ret
	.def	create_instruction;	.scl	3;	.type	32;	.endef
create_instruction:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movl	%ecx, %ebp
	movq	%rdx, %rdi
	movq	%r8, %rsi
	movq	%r9, %rbx
	movl	$32, %ecx
	call	alloc_memory
	movl	%ebp, 24(%rax)
	movq	%rdi, (%rax)
	movq	%rsi, 8(%rax)
	movq	%rbx, 16(%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.def	create_subroutine;	.scl	3;	.type	32;	.endef
create_subroutine:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rdi
	movq	%rdx, %rsi
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, %rbx
	movq	%rdi, (%rax)
	movq	%rsi, 8(%rax)
	call	create_list
	movq	%rax, 16(%rbx)
	call	create_list
	movq	%rax, 24(%rbx)
	call	create_list
	movq	%rax, 32(%rbx)
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.def	create_block;	.scl	3;	.type	32;	.endef
create_block:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rsi
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %rbx
	movq	%rsi, (%rax)
	call	create_list
	movq	%rax, 8(%rbx)
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "[warning] Unsupported type for size lookup: %s\12\0"
	.text
	.def	get_type_size;	.scl	3;	.type	32;	.endef
get_type_size:
	testq	%rcx, %rcx
	je	.L18
	movq	.refptr.name_int(%rip), %rax
	cmpq	%rcx, (%rax)
	je	.L19
	movq	.refptr.name_float(%rip), %rax
	cmpq	%rcx, (%rax)
	je	.L20
	movq	.refptr.name_string(%rip), %rax
	cmpq	%rcx, (%rax)
	je	.L21
	movq	.refptr.name_bool(%rip), %rax
	cmpq	%rcx, (%rax)
	je	.L22
	movq	.refptr.name_void(%rip), %rax
	cmpq	%rcx, (%rax)
	je	.L23
	cmpl	$0, 32(%rcx)
	jne	.L17
	movq	24(%rcx), %rax
	movq	24(%rax), %rax
	ret
.L17:
	pushq	%rbx
	subq	$32, %rsp
	movq	8(%rcx), %rbx
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	leaq	.LC0(%rip), %rdx
	call	fprintf
	movl	$8, %eax
	addq	$32, %rsp
	popq	%rbx
	ret
.L18:
	movl	$0, %eax
	ret
.L19:
	movl	$8, %eax
	ret
.L20:
	movl	$8, %eax
	ret
.L21:
	movl	$8, %eax
	ret
.L22:
	movl	$1, %eax
	ret
.L23:
	movl	$1, %eax
	ret
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "[warning] Unsupported argument type for create_arg: %d\12\0"
	.text
	.def	create_arg;	.scl	3;	.type	32;	.endef
create_arg:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movl	%ecx, %esi
	movq	%rdx, %rdi
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, %rbx
	movl	%esi, 16(%rax)
	movq	$0, 8(%rax)
	cmpl	$7, %esi
	ja	.L28
	movl	%esi, %esi
	leaq	.L30(%rip), %rdx
	movslq	(%rdx,%rsi,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L30:
	.long	.L37-.L30
	.long	.L36-.L30
	.long	.L35-.L30
	.long	.L34-.L30
	.long	.L33-.L30
	.long	.L32-.L30
	.long	.L31-.L30
	.long	.L29-.L30
	.text
.L37:
	movq	%rdi, (%rbx)
	movq	16(%rdi), %rax
	movq	%rax, 8(%rbx)
.L38:
	movb	$0, 20(%rbx)
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L36:
	movq	(%rdi), %rax
	movq	%rax, (%rbx)
	movq	.refptr.name_int(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 8(%rbx)
	jmp	.L38
.L35:
	movsd	(%rdi), %xmm0
	movsd	%xmm0, (%rbx)
	movq	.refptr.name_float(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 8(%rbx)
	jmp	.L38
.L34:
	movq	%rdi, (%rbx)
	movq	.refptr.name_string(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 8(%rbx)
	jmp	.L38
.L33:
	movzbl	(%rdi), %eax
	movb	%al, (%rbx)
	movq	.refptr.name_bool(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 8(%rbx)
	jmp	.L38
.L32:
	movq	$0, (%rbx)
	movq	.refptr.name_void(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 8(%rbx)
	jmp	.L38
.L31:
	movq	%rdi, (%rbx)
	jmp	.L38
.L29:
	movq	%rdi, (%rbx)
	movq	16(%rdi), %rax
	movq	%rax, 8(%rbx)
	jmp	.L38
.L28:
	call	__getreent
	movq	24(%rax), %rcx
	movl	%esi, %r8d
	leaq	.LC1(%rip), %rdx
	call	fprintf
	jmp	.L38
	.def	emit_param_instruction;	.scl	3;	.type	32;	.endef
emit_param_instruction:
	testq	%rcx, %rcx
	je	.L43
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	testq	%rdx, %rdx
	je	.L40
	movq	8(%rcx), %rcx
	call	get_type_size
	movq	%rax, 40(%rsp)
	leaq	40(%rsp), %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rax, %rdx
	movl	$0, %r9d
	movq	%rbx, %r8
	movl	$17, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
.L40:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L43:
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
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %r12
	movq	%rdx, %rbp
	movl	%r8d, %esi
	movq	%r9, %rdi
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, %rbx
	movq	%r12, (%rax)
	leal	-97(%rsi), %eax
	cmpl	$21, %eax
	ja	.L57
	movl	%eax, %eax
	leaq	.L49(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L49:
	.long	.L54-.L49
	.long	.L53-.L49
	.long	.L57-.L49
	.long	.L57-.L49
	.long	.L57-.L49
	.long	.L52-.L49
	.long	.L57-.L49
	.long	.L57-.L49
	.long	.L57-.L49
	.long	.L57-.L49
	.long	.L57-.L49
	.long	.L57-.L49
	.long	.L57-.L49
	.long	.L57-.L49
	.long	.L57-.L49
	.long	.L51-.L49
	.long	.L57-.L49
	.long	.L57-.L49
	.long	.L57-.L49
	.long	.L50-.L49
	.long	.L57-.L49
	.long	.L48-.L49
	.text
.L54:
	movq	40(%rdi), %r12
	leaq	1(%r12), %rax
	movq	%rax, 40(%rdi)
	jmp	.L47
.L51:
	movq	48(%rdi), %r12
	leaq	1(%r12), %rax
	movq	%rax, 48(%rdi)
	jmp	.L47
.L48:
	movq	56(%rdi), %r12
	leaq	1(%r12), %rax
	movq	%rax, 56(%rdi)
	jmp	.L47
.L50:
	movq	64(%rdi), %r12
	leaq	1(%r12), %rax
	movq	%rax, 64(%rdi)
	jmp	.L47
.L53:
	movq	72(%rdi), %r12
	leaq	1(%r12), %rax
	movq	%rax, 72(%rdi)
	jmp	.L47
.L52:
	movq	80(%rdi), %r12
	leaq	1(%r12), %rax
	movq	%rax, 80(%rdi)
	jmp	.L47
.L57:
	movq	$-1, %r12
.L47:
	movl	$32, %edx
	leaq	.LC2(%rip), %rcx
	call	create_string
	movq	%rax, %rcx
	movq	%rax, 8(%rbx)
	cmpq	$-1, %r12
	je	.L59
	movq	%r12, %r9
	movl	%esi, %r8d
	leaq	.LC4(%rip), %rdx
	call	sprintf
.L56:
	movq	%rbp, 16(%rbx)
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L59:
	movl	%esi, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
	jmp	.L56
	.def	load_rvalue;	.scl	3;	.type	32;	.endef
load_rvalue:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbx
	testq	%rcx, %rcx
	je	.L61
	movq	%rdx, %rsi
	cmpb	$0, 20(%rcx)
	jne	.L63
.L61:
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L63:
	movq	8(%rcx), %rdx
	movq	%rsi, %r9
	movl	$116, %r8d
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rdi
	movl	$0, %r9d
	movq	%rbx, %r8
	movq	%rax, %rdx
	movl	$23, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%rdi, %rbx
	jmp	.L61
	.section .rdata,"dr"
.LC5:
	.ascii "<unknown>\0"
	.align 8
.LC6:
	.ascii "[warning] Invalid attribute access\12\0"
	.align 8
.LC7:
	.ascii "[warning] Attribute '%s' not found in class '%s', fallback index %zu\12\0"
.LC8:
	.ascii "$a%zu\0"
	.text
	.def	emit_attribute_access;	.scl	3;	.type	32;	.endef
emit_attribute_access:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$48, %rsp
	testq	%rcx, %rcx
	je	.L83
	movq	%rdx, %rbx
	movq	%r8, %rdi
	testq	%rdx, %rdx
	je	.L83
	movq	%r8, %rdx
	call	load_rvalue
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L82
	movq	8(%rax), %rsi
	testq	%rsi, %rsi
	je	.L68
	cmpl	$0, 32(%rsi)
	je	.L68
	movl	$0, %esi
.L68:
	movq	(%rdi), %rax
	movq	(%rax), %rcx
	call	list_copy
	movq	%rax, %r12
.L69:
	movq	%r12, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L80
	cmpq	8(%rax), %rsi
	jne	.L69
	movq	(%rax), %rcx
	testq	%rcx, %rcx
	je	.L80
	call	list_copy
	movq	%rax, %r13
	movl	$0, %r12d
.L73:
	movq	%r13, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L87
	cmpq	(%rax), %rbx
	je	.L74
	addq	$1, %r12
	jmp	.L73
.L83:
	call	__getreent
	movq	24(%rax), %r9
	movl	$35, %r8d
	movl	$1, %edx
	leaq	.LC6(%rip), %rcx
	call	fwrite
	movl	$0, %ebx
	jmp	.L64
.L80:
	movq	(%rbx), %rdx
	movq	%rdi, %r9
	movl	$97, %r8d
	movq	%rbx, %rcx
	call	create_var
	movq	%rax, %r13
	jmp	.L72
.L82:
	movq	%rax, %rbx
	jmp	.L64
.L74:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, %r13
	movq	%rbx, (%rax)
	movq	(%rbx), %rax
	movq	%rax, 16(%r13)
	movl	$32, %edx
	leaq	.LC2(%rip), %rcx
	call	create_string
	movq	%rax, 8(%r13)
	jmp	.L77
.L87:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, %r13
	movq	%rbx, (%rax)
	movq	(%rbx), %rax
	movq	%rax, 16(%r13)
	movl	$32, %edx
	leaq	.LC2(%rip), %rcx
	call	create_string
	movq	%rax, 8(%r13)
	testq	%rsi, %rsi
	je	.L88
	movq	8(%rsi), %rsi
.L79:
	movq	8(%rbx), %r14
	call	__getreent
	movq	24(%rax), %rcx
	movq	%r12, 32(%rsp)
	movq	%rsi, %r9
	movq	%r14, %r8
	leaq	.LC7(%rip), %rdx
	call	fprintf
.L77:
	movq	8(%r13), %rcx
	movq	%r12, %r8
	leaq	.LC8(%rip), %rdx
	call	sprintf
.L72:
	movq	(%rbx), %rdx
	movq	%rdi, %r9
	movl	$116, %r8d
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rbx
	movq	%r13, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %r9
	movq	%rbp, %r8
	movq	%rbx, %rdx
	movl	$15, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rdi), %rax
	movq	8(%rax), %rcx
	call	list_append
	movb	$1, 20(%rbx)
.L64:
	movq	%rbx, %rax
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L88:
	leaq	.LC5(%rip), %rsi
	jmp	.L79
	.section .rdata,"dr"
	.align 8
.LC9:
	.ascii "[warning] Unsupported symbol kind for import: %d\12\0"
	.text
	.globl	codegen_import
	.def	codegen_import;	.scl	2;	.type	32;	.endef
codegen_import:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rdx, %rdi
	movq	(%rcx), %rsi
	movl	32(%rsi), %ebx
	cmpl	$3, %ebx
	je	.L95
	leal	-1(%rbx), %eax
	cmpl	$1, %eax
	jbe	.L96
	testl	%ebx, %ebx
	jne	.L93
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, %rbx
	call	create_list
	movq	%rax, (%rbx)
	movq	%rsi, 8(%rbx)
	movq	$0, 16(%rbx)
	movq	(%rdi), %rcx
	movq	%rbx, %rdx
	call	list_append
.L89:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L95:
	movq	(%rsi), %rdx
	movq	%r8, %r9
	movl	$118, %r8d
	movq	%rsi, %rcx
	call	create_var
	movq	%rax, %rdx
	movq	16(%rdi), %rcx
	call	list_append
	jmp	.L89
.L96:
	movq	(%rsi), %rdx
	movq	%r8, %r9
	movl	$102, %r8d
	movq	%rsi, %rcx
	call	create_var
	movq	%rax, %rdx
	movq	16(%rdi), %rcx
	call	list_append
	jmp	.L89
.L93:
	call	__getreent
	movq	24(%rax), %rcx
	movl	%ebx, %r8d
	leaq	.LC9(%rip), %rdx
	call	fprintf
	jmp	.L89
	.section .rdata,"dr"
	.align 8
.LC10:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
	.align 8
.LC11:
	.ascii "[warning] Unsupported variable type for codegen_variable: %d\12\0"
	.text
	.globl	codegen_variable
	.def	codegen_variable;	.scl	2;	.type	32;	.endef
codegen_variable:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rdi
	movl	%r8d, %esi
	movq	(%rcx), %rdx
	movq	8(%rcx), %rcx
	movq	%rdi, %r9
	call	create_var
	movq	%rax, %rdx
	leal	-97(%rsi), %eax
	cmpl	$21, %eax
	ja	.L98
	movl	%eax, %eax
	leaq	.L100(%rip), %rcx
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L100:
	.long	.L104-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L103-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L102-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L101-.L100
	.long	.L98-.L100
	.long	.L99-.L100
	.text
.L102:
	movq	8(%rdi), %rax
	movq	16(%rax), %rcx
	call	list_append
.L97:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L99:
	movq	8(%rdi), %rax
	movq	24(%rax), %rcx
	call	list_append
	jmp	.L97
.L101:
	movq	8(%rdi), %rax
	movq	24(%rax), %rcx
	call	list_append
	jmp	.L97
.L103:
	movq	(%rdi), %rax
	movq	16(%rax), %rcx
	call	list_append
	jmp	.L97
.L104:
	movq	(%rdi), %rax
	movq	(%rax), %rcx
	call	list_pop_back
	movq	%rax, %rsi
	movq	(%rdi), %rax
	movq	(%rax), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	(%rbx), %rdi
	movq	8(%rbx), %rbp
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, %rbx
	movq	%rbp, (%rax)
	movq	%rdi, 8(%rax)
	movq	$0, 16(%rax)
	movq	16(%rsi), %rax
	movq	%rax, 16(%rbx)
	movq	%rdi, %rcx
	call	get_type_size
	addq	%rax, 16(%rsi)
	movq	(%rsi), %rcx
	testq	%rcx, %rcx
	je	.L108
	movq	%rbx, %rdx
	call	list_append
	jmp	.L97
.L108:
	call	__getreent
	movq	24(%rax), %r9
	movl	$63, %r8d
	movl	$1, %edx
	leaq	.LC10(%rip), %rcx
	call	fwrite
	jmp	.L97
.L98:
	call	__getreent
	movq	24(%rax), %rcx
	movl	%esi, %r8d
	leaq	.LC11(%rip), %rdx
	call	fprintf
	jmp	.L97
	.section .rdata,"dr"
	.align 8
.LC12:
	.ascii "[warning] Invalid variable access input\12\0"
	.align 8
.LC13:
	.ascii "[warning] Variable access name is NULL\12\0"
	.align 8
.LC14:
	.ascii "[warning] Unresolved variable access for '%s', creating fallback local\12\0"
	.align 8
.LC15:
	.ascii "[warning] Invalid get-attribute access\12\0"
	.align 8
.LC16:
	.ascii "[warning] Failed to generate object for get-attribute access\12\0"
	.align 8
.LC17:
	.ascii "[warning] Invalid get-sequence access\12\0"
	.align 8
.LC18:
	.ascii "[warning] Failed to generate sequence/index for get-sequence access\12\0"
	.align 8
.LC19:
	.ascii "[warning] Invalid function call without callee\12\0"
	.align 8
.LC20:
	.ascii "[warning] Failed to generate callee for function call\12\0"
	.align 8
.LC21:
	.ascii "[warning] Unsupported callee in function call\12\0"
	.align 8
.LC22:
	.ascii "[warning] Failed to generate function call argument\12\0"
	.align 8
.LC23:
	.ascii "[warning] Unsupported variable access type for codegen_variable_access: %d\12\0"
	.text
	.globl	codegen_variable_access
	.def	codegen_variable_access;	.scl	2;	.type	32;	.endef
codegen_variable_access:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$48, %rsp
	testq	%rcx, %rcx
	je	.L151
	movq	%rcx, %rdi
	movq	%rdx, %rsi
	testq	%rdx, %rdx
	je	.L151
	movl	16(%rcx), %ebx
	testl	%ebx, %ebx
	jne	.L113
	movq	8(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L155
	movq	8(%rdx), %rdi
	testq	%rdi, %rdi
	je	.L115
	movq	16(%rdi), %rcx
	movq	%rbx, %rdx
	call	find_var_by_symbol
	testq	%rax, %rax
	je	.L156
.L149:
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rbx
	jmp	.L109
.L151:
	call	__getreent
	movq	24(%rax), %r9
	movl	$40, %r8d
	movl	$1, %edx
	leaq	.LC12(%rip), %rcx
	call	fwrite
	movl	$0, %ebx
	jmp	.L109
.L155:
	call	__getreent
	movq	24(%rax), %r9
	movl	$39, %r8d
	movl	$1, %edx
	leaq	.LC13(%rip), %rcx
	call	fwrite
	jmp	.L109
.L156:
	movq	24(%rdi), %rcx
	movq	%rbx, %rdx
	call	find_var_by_symbol
	testq	%rax, %rax
	jne	.L149
.L115:
	movq	(%rsi), %rax
	movq	16(%rax), %rcx
	movq	%rbx, %rdx
	call	find_var_by_symbol
	testq	%rax, %rax
	jne	.L149
	cmpl	$2, 32(%rbx)
	jbe	.L157
	testq	%rdi, %rdi
	je	.L119
	movq	16(%rdi), %rax
	movq	(%rax), %rdi
	testq	%rdi, %rdi
	je	.L119
	movq	.refptr.SELF_KEYWORD(%rip), %r12
	jmp	.L122
.L157:
	movq	(%rbx), %rdx
	movq	%rsi, %r9
	movl	$102, %r8d
	movq	%rbx, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$7, %ecx
	call	create_arg
	movq	%rax, %rbx
	jmp	.L109
.L120:
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L119
.L122:
	movq	8(%rdi), %rbp
	testq	%rbp, %rbp
	je	.L120
	movq	0(%rbp), %rax
	testq	%rax, %rax
	je	.L120
	movq	(%r12), %rdx
	movq	8(%rax), %rcx
	call	string_equal
	testb	%al, %al
	je	.L120
	movq	16(%rbp), %rax
	testq	%rax, %rax
	je	.L119
	cmpl	$0, 32(%rax)
	jne	.L119
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	cmpq	%rax, 24(%rbx)
	je	.L158
.L119:
	movq	8(%rbx), %rdi
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rdi, %r8
	leaq	.LC14(%rip), %rdx
	call	fprintf
	movq	(%rbx), %rdx
	movq	%rsi, %r9
	movl	$118, %r8d
	movq	%rbx, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rbx
.L109:
	movq	%rbx, %rax
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L158:
	movq	%rbp, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rcx
	movq	%rsi, %r8
	movq	%rbx, %rdx
	call	emit_attribute_access
	movq	%rax, %rbx
	jmp	.L109
.L113:
	cmpl	$2, %ebx
	je	.L159
	cmpl	$3, %ebx
	je	.L160
	cmpl	$1, %ebx
	jne	.L134
	movq	(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L161
	cmpl	$2, 16(%rbx)
	jne	.L137
	movq	8(%rbx), %r12
	testq	%r12, %r12
	je	.L137
	movl	32(%r12), %eax
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L162
.L137:
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	codegen_variable_access
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L163
	movl	16(%rax), %eax
	cmpl	$7, %eax
	je	.L164
	testl	%eax, %eax
	jne	.L144
	movq	(%rbx), %rax
	testq	%rax, %rax
	je	.L144
	movq	(%rax), %r12
	testq	%r12, %r12
	je	.L144
	movl	32(%r12), %eax
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L138
.L144:
	call	__getreent
	movq	24(%rax), %r9
	movl	$46, %r8d
	movl	$1, %edx
	leaq	.LC21(%rip), %rcx
	call	fwrite
	movl	$0, %ebx
	jmp	.L109
.L159:
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L124
	movq	8(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L124
	movl	32(%rdi), %eax
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L165
	call	codegen_variable_access
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L166
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rax, %rcx
	call	emit_attribute_access
	movq	%rax, %rbx
	jmp	.L109
.L124:
	call	__getreent
	movq	24(%rax), %r9
	movl	$39, %r8d
	movl	$1, %edx
	leaq	.LC15(%rip), %rcx
	call	fwrite
	movl	$0, %ebx
	jmp	.L109
.L165:
	movq	(%rdi), %rdx
	movq	%rsi, %r9
	movl	$102, %r8d
	movq	%rdi, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$7, %ecx
	call	create_arg
	movq	%rax, %rbx
	jmp	.L109
.L166:
	call	__getreent
	movq	24(%rax), %r9
	movl	$61, %r8d
	movl	$1, %edx
	leaq	.LC16(%rip), %rcx
	call	fwrite
	jmp	.L109
.L160:
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L129
	cmpq	$0, 8(%rdi)
	je	.L129
	call	codegen_variable_access
	movq	%rax, %rcx
	movq	%rsi, %rdx
	call	load_rvalue
	movq	%rax, %rbp
	movq	8(%rdi), %rcx
	movq	%rsi, %rdx
	call	codegen_expression
	movq	%rax, %rcx
	movq	%rsi, %rdx
	call	load_rvalue
	movq	%rax, %rdi
	testq	%rbp, %rbp
	je	.L152
	testq	%rax, %rax
	je	.L152
	movq	.refptr.name_int(%rip), %rax
	movq	(%rax), %rcx
	movq	8(%rbp), %rax
	movq	.refptr.name_float(%rip), %rdx
	movq	(%rdx), %rdx
	cmpq	%rdx, %rax
	je	.L133
	movq	.refptr.name_bool(%rip), %rdx
	movq	(%rdx), %rdx
	cmpq	%rdx, %rax
	je	.L133
	movq	.refptr.name_string(%rip), %rdx
	movq	(%rdx), %rdx
	cmpq	%rdx, %rax
	cmovne	%rcx, %rdx
.L133:
	movq	%rsi, %r9
	movl	$116, %r8d
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rbx
	movq	%rdi, %r9
	movq	%rbp, %r8
	movq	%rax, %rdx
	movl	$16, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	movb	$1, 20(%rbx)
	jmp	.L109
.L129:
	call	__getreent
	movq	24(%rax), %r9
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC17(%rip), %rcx
	call	fwrite
	movl	$0, %ebx
	jmp	.L109
.L152:
	call	__getreent
	movq	24(%rax), %r9
	movl	$68, %r8d
	movl	$1, %edx
	leaq	.LC18(%rip), %rcx
	call	fwrite
	movl	$0, %ebx
	jmp	.L109
.L161:
	call	__getreent
	movq	24(%rax), %r9
	movl	$47, %r8d
	movl	$1, %edx
	leaq	.LC19(%rip), %rcx
	call	fwrite
	jmp	.L109
.L162:
	movq	(%rbx), %rcx
	testq	%rcx, %rcx
	je	.L138
	cmpl	$0, 16(%rcx)
	jne	.L139
	movq	8(%rcx), %rax
	testq	%rax, %rax
	je	.L139
	cmpl	$0, 32(%rax)
	je	.L138
.L139:
	movq	%rsi, %rdx
	call	codegen_variable_access
	movq	%rax, %rcx
	movq	%rsi, %rdx
	call	load_rvalue
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L167
	movq	%rsi, %rdx
	call	emit_param_instruction
	movl	$1, %ebp
.L141:
	movq	8(%rdi), %rcx
	call	list_copy
	movq	%rax, %rdi
.L145:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L168
	movq	%rsi, %rdx
	call	codegen_expression
	movq	%rax, %rcx
	movq	%rsi, %rdx
	call	load_rvalue
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L169
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	emit_param_instruction
	addq	$1, %rbp
	jmp	.L145
.L167:
	movl	$0, %ebp
	jmp	.L141
.L163:
	call	__getreent
	movq	24(%rax), %r9
	movl	$54, %r8d
	movl	$1, %edx
	leaq	.LC20(%rip), %rcx
	call	fwrite
	jmp	.L109
.L164:
	movq	(%rbx), %rax
	testq	%rax, %rax
	je	.L144
	movq	(%rax), %r12
	testq	%r12, %r12
	je	.L144
.L138:
	movl	$0, %ebp
	jmp	.L141
.L169:
	call	__getreent
	movq	24(%rax), %r9
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC22(%rip), %rcx
	call	fwrite
	jmp	.L109
.L168:
	movl	$0, %edx
	movl	$5, %ecx
	call	create_arg
	movq	%rax, %rbx
	movq	(%r12), %rdx
	testq	%rdx, %rdx
	je	.L148
	movq	.refptr.name_void(%rip), %rax
	cmpq	(%rax), %rdx
	je	.L148
	movq	%rsi, %r9
	movl	$116, %r8d
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rbx
.L148:
	movq	%rbp, 40(%rsp)
	movq	(%r12), %rdx
	movq	%rsi, %r9
	movl	$102, %r8d
	movq	%r12, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$7, %ecx
	call	create_arg
	movq	%rax, %rdi
	leaq	40(%rsp), %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rax, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	movl	$22, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L109
.L134:
	call	__getreent
	movq	24(%rax), %rcx
	movl	%ebx, %r8d
	leaq	.LC23(%rip), %rdx
	call	fprintf
	movl	$0, %ebx
	jmp	.L109
	.section .rdata,"dr"
	.align 8
.LC25:
	.ascii "[warning] Unsupported type for negation: %s\12\0"
	.align 8
.LC26:
	.ascii "[warning] Unsupported primary type for codegen_primary: %d\12\0"
	.text
	.globl	codegen_primary
	.def	codegen_primary;	.scl	2;	.type	32;	.endef
codegen_primary:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$48, %rsp
	movl	8(%rcx), %ebx
	cmpl	$8, %ebx
	ja	.L171
	movq	%rdx, %rsi
	movl	%ebx, %ebx
	leaq	.L173(%rip), %r8
	movslq	(%r8,%rbx,4), %rax
	addq	%r8, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L173:
	.long	.L181-.L173
	.long	.L180-.L173
	.long	.L179-.L173
	.long	.L178-.L173
	.long	.L177-.L173
	.long	.L176-.L173
	.long	.L175-.L173
	.long	.L174-.L173
	.long	.L172-.L173
	.text
.L181:
	movq	(%rcx), %rcx
	movl	$10, %r8d
	movl	$0, %edx
	call	strtoll
	movq	%rax, 40(%rsp)
	leaq	40(%rsp), %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rax, %rbx
.L170:
	movq	%rbx, %rax
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L180:
	movq	(%rcx), %rcx
	movl	$0, %edx
	call	strtod
	movsd	%xmm0, 40(%rsp)
	leaq	40(%rsp), %rdx
	movl	$2, %ecx
	call	create_arg
	movq	%rax, %rbx
	jmp	.L170
.L179:
	movq	(%rcx), %rdx
	movl	$3, %ecx
	call	create_arg
	movq	%rax, %rbx
	jmp	.L170
.L178:
	movb	$1, 40(%rsp)
	leaq	40(%rsp), %rdx
	movl	$4, %ecx
	call	create_arg
	movq	%rax, %rbx
	jmp	.L170
.L177:
	movb	$0, 40(%rsp)
	leaq	40(%rsp), %rdx
	movl	$4, %ecx
	call	create_arg
	movq	%rax, %rbx
	jmp	.L170
.L176:
	movq	(%rcx), %rcx
	call	codegen_expression
	movq	%rax, %rbx
	jmp	.L170
.L175:
	movq	(%rcx), %rcx
	call	codegen_primary
	movq	%rax, %rcx
	movq	%rsi, %rdx
	call	load_rvalue
	movq	%rax, %rdi
	movq	.refptr.name_bool(%rip), %rax
	movq	(%rax), %rdx
	movq	%rsi, %r9
	movl	$116, %r8d
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rbx
	movl	$0, %r9d
	movq	%rdi, %r8
	movq	%rax, %rdx
	movl	$13, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L170
.L174:
	movq	(%rcx), %rcx
	call	codegen_primary
	movq	%rax, %rcx
	movq	%rsi, %rdx
	call	load_rvalue
	movq	%rax, %rdi
	movq	8(%rax), %rdx
	movq	%rsi, %r9
	movl	$116, %r8d
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rbx
	movq	$0, 32(%rsp)
	movq	.LC24(%rip), %rax
	movq	%rax, 40(%rsp)
	movq	8(%rdi), %rax
	movq	.refptr.name_int(%rip), %rdx
	cmpq	(%rdx), %rax
	je	.L188
	movq	.refptr.name_float(%rip), %rdx
	cmpq	(%rdx), %rax
	je	.L189
	movq	8(%rax), %rbx
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	leaq	.LC25(%rip), %rdx
	call	fprintf
	movl	$0, %ebx
	jmp	.L170
.L188:
	leaq	32(%rsp), %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rax, %r8
	movq	%rdi, %r9
	movq	%rbx, %rdx
	movl	$1, %ecx
	call	create_instruction
	movq	%rax, %rdx
	jmp	.L184
.L189:
	leaq	40(%rsp), %rdx
	movl	$2, %ecx
	call	create_arg
	movq	%rax, %r8
	movq	%rdi, %r9
	movq	%rbx, %rdx
	movl	$2, %ecx
	call	create_instruction
	movq	%rax, %rdx
.L184:
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L170
.L172:
	movq	(%rcx), %rcx
	call	codegen_variable_access
	movq	%rax, %rbx
	jmp	.L170
.L171:
	call	__getreent
	movq	24(%rax), %rcx
	movl	%ebx, %r8d
	leaq	.LC26(%rip), %rdx
	call	fprintf
	movl	$0, %ebx
	jmp	.L170
	.section .rdata,"dr"
	.align 8
.LC27:
	.ascii "[warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.globl	codegen_expression
	.def	codegen_expression;	.scl	2;	.type	32;	.endef
codegen_expression:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rsi
	movq	%rdx, %rbx
	cmpl	$19, 24(%rcx)
	je	.L218
	movq	16(%rcx), %rcx
	call	codegen_expression
	movq	%rax, %rcx
	movq	%rbx, %rdx
	call	load_rvalue
	movq	%rax, %r12
	movl	24(%rsi), %ebp
	cmpl	$18, %ebp
	ja	.L193
	movl	%ebp, %eax
	leaq	.L195(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L195:
	.long	.L199-.L195
	.long	.L198-.L195
	.long	.L214-.L195
	.long	.L196-.L195
	.long	.L194-.L195
	.long	.L197-.L195
	.long	.L197-.L195
	.long	.L197-.L195
	.long	.L197-.L195
	.long	.L197-.L195
	.long	.L197-.L195
	.long	.L197-.L195
	.long	.L197-.L195
	.long	.L200-.L195
	.long	.L199-.L195
	.long	.L198-.L195
	.long	.L214-.L195
	.long	.L196-.L195
	.long	.L194-.L195
	.text
.L218:
	movq	8(%rcx), %rcx
	call	codegen_primary
	movq	%rax, %rsi
	jmp	.L190
.L196:
	movl	$3, %ebp
.L197:
	movq	(%rsi), %rcx
	movq	%rbx, %rdx
	call	codegen_expression
	movq	%rax, %rdi
	movl	24(%rsi), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	jbe	.L212
.L209:
	movq	8(%rdi), %rdx
	movq	%rbx, %r9
	movl	$116, %r8d
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rsi
	movq	%rbx, %rdx
	movq	%rdi, %rcx
	call	load_rvalue
	movq	%rax, %r8
	movq	%r12, %r9
	movq	%rsi, %rdx
	movl	%ebp, %ecx
	call	create_instruction
	movq	%rax, %rdx
	jmp	.L211
.L194:
	movl	$4, %ebp
	jmp	.L197
.L193:
	movl	$25, %ebp
	jmp	.L197
.L199:
	movq	(%rsi), %rcx
	movq	%rbx, %rdx
	call	codegen_expression
	movq	%rax, %rdi
	movl	24(%rsi), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L215
	movl	$0, %ebp
.L212:
	movq	8(%rdi), %rdx
	movq	%rbx, %r9
	movl	$116, %r8d
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rsi
	movq	%rbx, %rdx
	movq	%rdi, %rcx
	call	load_rvalue
	movq	%rax, %r8
	movq	%r12, %r9
	movq	%rsi, %rdx
	movl	%ebp, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L213:
	cmpl	$0, 16(%rdi)
	jne	.L219
.L210:
	movl	$0, %r9d
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movl	$14, %ecx
	call	create_instruction
	movq	%rax, %rdx
	cmpb	$0, 20(%rdi)
	jne	.L220
.L211:
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L190:
	movq	%rsi, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L219:
	call	__getreent
	movq	24(%rax), %r9
	movl	$57, %r8d
	movl	$1, %edx
	leaq	.LC27(%rip), %rcx
	call	fwrite
	jmp	.L210
.L220:
	movl	$0, %r9d
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movl	$24, %ecx
	call	create_instruction
	movq	%rax, %rdx
	jmp	.L211
.L215:
	movl	$0, %ebp
	jmp	.L209
.L198:
	movl	$1, %ebp
	jmp	.L197
.L214:
	movl	$2, %ebp
	jmp	.L197
.L200:
	movq	(%rsi), %rcx
	movq	%rbx, %rdx
	call	codegen_expression
	movq	%rax, %rdi
	movl	24(%rsi), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L221
	movq	%r12, %rsi
	jmp	.L213
.L221:
	movl	$14, %ebp
	jmp	.L209
	.globl	codegen_if
	.def	codegen_if;	.scl	2;	.type	32;	.endef
codegen_if:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	movq	%rcx, %r12
	movq	%rdx, %rbx
	movq	%rdx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdi
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rsi
	movq	16(%r12), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L223
	movq	24(%r12), %rcx
	call	list_is_empty
	movq	%rsi, %r15
	testb	%al, %al
	jne	.L224
.L223:
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %r15
.L224:
	movq	%r15, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %r13
	movq	(%r12), %rcx
	movq	%rbx, %rdx
	call	codegen_expression
	movq	%rax, %rbp
	movq	%rsi, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %r14
	movq	%rdi, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %r8
	movq	%r14, %r9
	movq	%rbp, %rdx
	movl	$19, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%rdi, %rcx
	call	create_block
	movq	%rax, %rdi
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	movq	%rdi, %rdx
	call	list_append
	movq	%rdi, 16(%rbx)
	movq	8(%r12), %rcx
	call	list_copy
	movq	%rax, %rdi
	jmp	.L225
.L226:
	movq	%rbx, %rdx
	call	codegen_statement
.L225:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L226
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%r13, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	16(%r12), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L239
.L227:
	movq	24(%r12), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L240
.L233:
	movq	%r15, %rcx
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	%rsi, 16(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L239:
	movq	16(%r12), %rcx
	call	list_copy
	movq	%rax, %r14
	jmp	.L228
.L241:
	movq	24(%r12), %rcx
	call	list_is_empty
	testb	%al, %al
	cmovne	%r15, %rsi
	jmp	.L229
.L231:
	movq	%rbx, %rdx
	call	codegen_statement
.L230:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L231
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%r13, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L228:
	movq	%r14, %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L227
	movq	%rsi, %rcx
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	%rsi, 16(%rbx)
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rbp
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rsi
	movq	(%rdi), %rcx
	movq	%rbx, %rdx
	call	codegen_expression
	movq	%rax, 40(%rsp)
	movq	%r14, %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L241
.L229:
	movq	%rsi, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, 32(%rsp)
	movq	%rbp, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %r8
	movq	32(%rsp), %r9
	movq	40(%rsp), %rdx
	movl	$19, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%rbp, %rcx
	call	create_block
	movq	%rax, %rbp
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	movq	%rbp, %rdx
	call	list_append
	movq	%rbp, 16(%rbx)
	movq	8(%rdi), %rcx
	call	list_copy
	movq	%rax, %rdi
	jmp	.L230
.L240:
	movq	%rsi, %rcx
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	%rsi, 16(%rbx)
	movq	24(%r12), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L234
.L235:
	movq	%rbx, %rdx
	call	codegen_statement
.L234:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L235
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%r13, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L233
	.section .rdata,"dr"
	.align 8
.LC28:
	.ascii "[warning] 'break' statement used outside of loop\12\0"
	.align 8
.LC29:
	.ascii "[warning] 'continue' statement used outside of loop\12\0"
	.align 8
.LC30:
	.ascii "[warning] Unsupported statement type for codegen_statement: %d\12\0"
	.text
	.globl	codegen_statement
	.def	codegen_statement;	.scl	2;	.type	32;	.endef
codegen_statement:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movl	8(%rcx), %ebx
	cmpl	$7, %ebx
	ja	.L243
	movq	%rdx, %rsi
	movl	%ebx, %ebx
	leaq	.L245(%rip), %rdx
	movslq	(%rdx,%rbx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L245:
	.long	.L252-.L245
	.long	.L251-.L245
	.long	.L250-.L245
	.long	.L249-.L245
	.long	.L248-.L245
	.long	.L247-.L245
	.long	.L246-.L245
	.long	.L244-.L245
	.text
.L252:
	movq	(%rcx), %rcx
	movq	%rsi, %rdx
	call	codegen_expression
.L242:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L251:
	movq	(%rcx), %rcx
	movl	$118, %r8d
	movq	%rsi, %rdx
	call	codegen_variable
	jmp	.L242
.L250:
	movq	(%rcx), %rcx
	movq	%rsi, %rdx
	call	codegen_if
	jmp	.L242
.L249:
	movq	(%rcx), %rcx
	movq	%rsi, %rdx
	call	codegen_while
	jmp	.L242
.L248:
	movq	(%rcx), %rcx
	movq	%rsi, %rdx
	call	codegen_for
	jmp	.L242
.L247:
	movq	(%rcx), %rcx
	movq	%rsi, %rdx
	call	codegen_expression
	movq	%rax, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$21, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L242
.L246:
	movq	24(%rsi), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L254
	movq	24(%rsi), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	testq	%rdx, %rdx
	je	.L254
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L242
.L254:
	call	__getreent
	movq	24(%rax), %r9
	movl	$49, %r8d
	movl	$1, %edx
	leaq	.LC28(%rip), %rcx
	call	fwrite
	jmp	.L242
.L244:
	movq	32(%rsi), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L255
	movq	32(%rsi), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	testq	%rdx, %rdx
	je	.L255
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L242
.L255:
	call	__getreent
	movq	24(%rax), %r9
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC29(%rip), %rcx
	call	fwrite
	jmp	.L242
.L243:
	call	__getreent
	movq	24(%rax), %rcx
	movl	%ebx, %r8d
	leaq	.LC30(%rip), %rdx
	call	fprintf
	jmp	.L242
	.globl	codegen_for
	.def	codegen_for;	.scl	2;	.type	32;	.endef
codegen_for:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rdi
	movq	%rdx, %rbx
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L258
	movl	$118, %r8d
	call	codegen_variable
.L258:
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rbp
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %r13
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %r12
	cmpq	$0, 8(%rdi)
	je	.L259
	movq	%rbp, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%rbp, %rcx
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	%rsi, 16(%rbx)
	movq	8(%rdi), %rcx
	movq	%rbx, %rdx
	call	codegen_expression
	movq	%rax, %rsi
	movq	%r12, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %r14
	movq	%r13, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %r8
	movq	%r14, %r9
	movq	%rsi, %rdx
	movl	$19, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L260:
	movq	%r13, %rcx
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	%rsi, 16(%rbx)
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %r14
	cmpq	$0, 16(%rdi)
	je	.L261
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	32(%rbx), %rcx
	call	list_append
.L262:
	movq	%r12, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	24(%rbx), %rcx
	call	list_append
	movq	24(%rdi), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L264
.L259:
	movq	%r13, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L260
.L261:
	cmpq	$0, 8(%rdi)
	je	.L263
	movq	%rbp, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	32(%rbx), %rcx
	call	list_append
	jmp	.L262
.L263:
	movq	%r13, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	32(%rbx), %rcx
	call	list_append
	jmp	.L262
.L265:
	movq	%rbx, %rdx
	call	codegen_statement
.L264:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L265
	movq	32(%rbx), %rcx
	call	list_pop_back
	movq	24(%rbx), %rcx
	call	list_pop_back
	cmpq	$0, 16(%rdi)
	je	.L266
	movq	%r14, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%r14, %rcx
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	%rsi, 16(%rbx)
	movq	16(%rdi), %rcx
	movq	%rbx, %rdx
	call	codegen_expression
.L266:
	movq	%rbp, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	cmpq	$0, 8(%rdi)
	je	.L269
.L267:
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%r12, %rcx
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	%rsi, 16(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L269:
	movq	%r13, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	jmp	.L267
	.globl	codegen_while
	.def	codegen_while;	.scl	2;	.type	32;	.endef
codegen_while:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rsi
	movq	%rdx, %rbx
	movq	%rdx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdi
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%rdi, %rcx
	call	create_block
	movq	%rax, %rbp
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	movq	%rbp, %rdx
	call	list_append
	movq	%rbp, 16(%rbx)
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %r12
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rbp
	movq	(%rsi), %rcx
	movq	%rbx, %rdx
	call	codegen_expression
	movq	%rax, %r13
	movq	%rbp, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %r14
	movq	%r12, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %r8
	movq	%r14, %r9
	movq	%r13, %rdx
	movl	$19, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%r12, %rcx
	call	create_block
	movq	%rax, %r12
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	movq	%r12, %rdx
	call	list_append
	movq	%r12, 16(%rbx)
	movq	%rdi, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	32(%rbx), %rcx
	call	list_append
	movq	%rbp, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	24(%rbx), %rcx
	call	list_append
	movq	8(%rsi), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L271
.L272:
	movq	%rbx, %rdx
	call	codegen_statement
.L271:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L272
	movq	32(%rbx), %rcx
	call	list_pop_back
	movq	24(%rbx), %rcx
	call	list_pop_back
	movq	%rdi, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%rbp, %rcx
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	%rsi, 16(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.globl	codegen_function
	.def	codegen_function;	.scl	2;	.type	32;	.endef
codegen_function:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rbp
	movq	%rdx, %rbx
	movq	8(%rcx), %rdx
	movq	(%rcx), %rcx
	call	create_subroutine
	movq	%rax, %rsi
	movq	%rax, 8(%rbx)
	movq	(%rbx), %rax
	movq	24(%rax), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	16(%rbp), %rcx
	call	list_copy
	movq	%rax, %rdi
	jmp	.L275
.L276:
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	movq	%rbx, %r9
	movl	$112, %r8d
	call	create_var
	movq	%rax, %rdx
	movq	16(%rsi), %rcx
	call	list_append
.L275:
	movq	%rdi, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L276
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rcx
	call	create_block
	movq	%rax, %rdi
	movq	32(%rsi), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	%rdi, 16(%rbx)
	movq	24(%rbp), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L277
.L278:
	movq	%rbx, %rdx
	call	codegen_statement
.L277:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L278
	movq	$0, 8(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.globl	codegen_method
	.def	codegen_method;	.scl	2;	.type	32;	.endef
codegen_method:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rbp
	movq	%rdx, %rbx
	movq	8(%rcx), %rdx
	movq	(%rcx), %rcx
	call	create_subroutine
	movq	%rax, %rsi
	movq	%rax, 8(%rbx)
	movq	(%rbx), %rax
	movq	24(%rax), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	16(%rbp), %rcx
	call	list_copy
	movq	%rax, %rdi
	jmp	.L281
.L282:
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	movq	%rbx, %r9
	movl	$112, %r8d
	call	create_var
	movq	%rax, %rdx
	movq	16(%rsi), %rcx
	call	list_append
.L281:
	movq	%rdi, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L282
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rcx
	call	create_block
	movq	%rax, %rdi
	movq	32(%rsi), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	%rdi, 16(%rbx)
	movq	24(%rbp), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L283
.L284:
	movq	%rbx, %rdx
	call	codegen_statement
.L283:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L284
	movq	$0, 8(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC31:
	.ascii "[warning] Unsupported class member type for codegen_class: %d\12\0"
	.text
	.globl	codegen_class
	.def	codegen_class;	.scl	2;	.type	32;	.endef
codegen_class:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbp
	movq	%rdx, %rdi
	movq	8(%rcx), %rcx
	call	list_copy
	movq	%rax, %rsi
	movq	0(%rbp), %r12
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, %rbx
	call	create_list
	movq	%rax, (%rbx)
	movq	%r12, 8(%rbx)
	movq	$0, 16(%rbx)
	movq	24(%rbp), %rax
	movq	%rax, 16(%rbx)
	movq	(%rdi), %rax
	movq	(%rax), %rcx
	movq	%rbx, %rdx
	call	list_append
	leaq	.LC31(%rip), %rbp
	jmp	.L287
.L288:
	movq	(%rax), %rcx
	movq	%rdi, %rdx
	call	codegen_method
.L287:
	movq	%rsi, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L295
	movl	8(%rax), %ebx
	testl	%ebx, %ebx
	je	.L288
	cmpl	$1, %ebx
	je	.L289
	call	__getreent
	movq	24(%rax), %rcx
	movl	%ebx, %r8d
	movq	%rbp, %rdx
	call	fprintf
	jmp	.L287
.L289:
	movq	(%rax), %rcx
	movl	$97, %r8d
	movq	%rdi, %rdx
	call	codegen_variable
	jmp	.L287
.L295:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.section .rdata,"dr"
.LC32:
	.ascii "main\0"
	.text
	.globl	codegen_code
	.def	codegen_code;	.scl	2;	.type	32;	.endef
codegen_code:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbx
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, %rbp
	call	create_list
	movq	%rax, 0(%rbp)
	movq	$0, 8(%rbp)
	call	create_list
	movq	%rax, 16(%rbp)
	call	create_list
	movq	%rax, 24(%rbp)
	movl	$88, %ecx
	call	alloc_memory
	movq	%rax, %rsi
	movq	%rbp, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	call	create_list
	movq	%rax, 24(%rsi)
	call	create_list
	movq	%rax, 32(%rsi)
	movq	$0, 40(%rsi)
	movq	$0, 48(%rsi)
	movq	$0, 56(%rsi)
	movq	$0, 64(%rsi)
	movq	$0, 72(%rsi)
	movq	$0, 80(%rsi)
	movq	(%rbx), %rcx
	call	list_copy
	movq	%rax, %rdi
	leaq	.LC32(%rip), %r12
	jmp	.L297
.L304:
	movq	(%rbx), %rcx
	movq	%rsi, %rdx
	call	codegen_function
	movq	(%rbx), %rax
	movq	(%rax), %rbx
	movq	8(%rbx), %rcx
	movq	%r12, %rdx
	call	strcmp
	testl	%eax, %eax
	jne	.L297
	movq	%rbx, 8(%rbp)
	jmp	.L297
.L305:
	movq	(%rbx), %rcx
	movq	%rsi, %rdx
	call	codegen_class
.L297:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L303
	movl	8(%rbx), %eax
	cmpl	$1, %eax
	je	.L304
	cmpl	$2, %eax
	je	.L305
	testl	%eax, %eax
	jne	.L297
	movq	(%rbx), %rcx
	movq	%rsi, %r8
	movq	%rbp, %rdx
	call	codegen_import
	jmp	.L297
.L303:
	movq	%rbp, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.section .rdata,"dr"
	.align 8
.LC24:
	.long	0
	.long	-1074790400
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	strtoll;	.scl	2;	.type	32;	.endef
	.def	strtod;	.scl	2;	.type	32;	.endef
	.def	list_is_empty;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
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
