	.file	"D:\\TC\\temp\\codegen.c"
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "[warning] Unsupported type for size lookup: %s\12\0"
	.text
	.p2align 4
	.def	get_type_size;	.scl	3;	.type	32;	.endef
get_type_size:
	testq	%rcx, %rcx
	je	.L5
	movq	.refptr.name_int(%rip), %rax
	cmpq	%rcx, (%rax)
	je	.L9
	movq	.refptr.name_float(%rip), %rax
	cmpq	%rcx, (%rax)
	je	.L9
	movq	.refptr.name_string(%rip), %rax
	cmpq	%rcx, (%rax)
	je	.L9
	movq	.refptr.name_bool(%rip), %rax
	cmpq	%rcx, (%rax)
	je	.L7
	movq	.refptr.name_void(%rip), %rax
	cmpq	%rcx, (%rax)
	je	.L7
	movl	32(%rcx), %eax
	testl	%eax, %eax
	jne	.L4
	movq	24(%rcx), %rax
	movq	24(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L5:
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	pushq	%rbx
	subq	$32, %rsp
	movq	8(%rcx), %rbx
	call	__getreent
	leaq	.LC0(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	call	fprintf
	addq	$32, %rsp
	movl	$8, %eax
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	movl	$8, %eax
	ret
	.section .rdata,"dr"
.LC1:
	.ascii "\0"
.LC2:
	.ascii "$%d-error\0"
.LC3:
	.ascii "$%c%zu\0"
	.text
	.p2align 4
	.def	create_var;	.scl	3;	.type	32;	.endef
create_var:
	pushq	%r12
	movq	%rcx, %r12
	movl	$24, %ecx
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rdi
	movq	%r9, %rdi
	pushq	%rsi
	movl	%r8d, %esi
	pushq	%rbx
	subq	$32, %rsp
	call	alloc_memory
	movq	%r12, (%rax)
	movq	%rax, %rbx
	leal	-97(%rsi), %eax
	cmpl	$21, %eax
	ja	.L14
	leaq	.L16(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L16:
	.long	.L21-.L16
	.long	.L20-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L19-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L18-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L17-.L16
	.long	.L14-.L16
	.long	.L15-.L16
	.text
	.p2align 4,,10
	.p2align 3
.L14:
	leaq	.LC1(%rip), %rcx
	movl	$32, %edx
	call	create_string
	movq	%rax, 8(%rbx)
	movq	%rax, %rcx
.L22:
	movl	%esi, %r8d
	leaq	.LC2(%rip), %rdx
	call	sprintf
.L25:
	movq	%rbp, 16(%rbx)
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L21:
	movq	40(%rdi), %r12
	leaq	1(%r12), %rax
	movq	%rax, 40(%rdi)
	.p2align 4,,10
	.p2align 3
.L23:
	leaq	.LC1(%rip), %rcx
	movl	$32, %edx
	call	create_string
	movq	%rax, 8(%rbx)
	movq	%rax, %rcx
	cmpq	$-1, %r12
	je	.L22
	movq	%r12, %r9
	movl	%esi, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L20:
	movq	72(%rdi), %r12
	leaq	1(%r12), %rax
	movq	%rax, 72(%rdi)
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L19:
	movq	80(%rdi), %r12
	leaq	1(%r12), %rax
	movq	%rax, 80(%rdi)
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L18:
	movq	48(%rdi), %r12
	leaq	1(%r12), %rax
	movq	%rax, 48(%rdi)
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L17:
	movq	64(%rdi), %r12
	leaq	1(%r12), %rax
	movq	%rax, 64(%rdi)
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L15:
	movq	56(%rdi), %r12
	leaq	1(%r12), %rax
	movq	%rax, 56(%rdi)
	jmp	.L23
	.p2align 4
	.def	emit_param_instruction;	.scl	3;	.type	32;	.endef
emit_param_instruction:
	testq	%rcx, %rcx
	je	.L30
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	subq	$40, %rsp
	testq	%rdx, %rdx
	je	.L27
	movq	%rcx, %rbx
	movq	8(%rcx), %rcx
	call	get_type_size
	movl	$24, %ecx
	movq	%rax, %rbp
	call	alloc_memory
	movl	$32, %ecx
	movq	%rbp, (%rax)
	movq	%rax, %rdi
	movl	$1, 16(%rax)
	movq	.refptr.name_int(%rip), %rax
	movb	$0, 20(%rdi)
	movq	(%rax), %rax
	movq	%rax, 8(%rdi)
	call	alloc_memory
	movq	%rbx, 8(%rax)
	movq	%rax, %rdx
	movl	$17, 24(%rax)
	movq	%rdi, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	list_append
	.p2align 4,,10
	.p2align 3
.L27:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L30:
	ret
	.p2align 4
	.def	load_rvalue;	.scl	3;	.type	32;	.endef
load_rvalue:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	testq	%rcx, %rcx
	je	.L34
	cmpb	$0, 20(%rcx)
	jne	.L39
.L34:
	leaq	-32(%rbp), %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L39:
	movq	%rdx, %rsi
	movq	8(%rcx), %rdx
	movl	$116, %r8d
	xorl	%ecx, %ecx
	movq	%rsi, %r9
	call	create_var
	movl	$24, %ecx
	movq	%rax, %r12
	call	alloc_memory
	movq	%r12, %xmm0
	movl	$32, %ecx
	movhps	16(%r12), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rdi
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movq	%rbx, 8(%rax)
	movq	%rax, %rdx
	movq	%rdi, %rbx
	movq	%rdi, (%rax)
	movl	$23, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	leaq	-32(%rbp), %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC4:
	.ascii "<unknown>\0"
	.align 8
.LC5:
	.ascii "[warning] Invalid attribute access\12\0"
	.align 8
.LC6:
	.ascii "[warning] Attribute '%s' not found in class '%s', fallback index %zu\12\0"
.LC7:
	.ascii "$a%zu\0"
	.text
	.p2align 4
	.def	emit_attribute_access;	.scl	3;	.type	32;	.endef
emit_attribute_access:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$48, %rsp
	testq	%rcx, %rcx
	je	.L61
	movq	%rdx, %rbx
	testq	%rdx, %rdx
	je	.L61
	movq	%r8, %rdx
	movq	%r8, %rdi
	call	load_rvalue
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L43
	movq	8(%rax), %rsi
	testq	%rsi, %rsi
	je	.L46
	movl	32(%rsi), %eax
	testl	%eax, %eax
	jne	.L67
.L46:
	movq	(%rdi), %rax
	movq	(%rax), %rcx
	call	list_copy
	movq	%rax, %r13
	jmp	.L47
	.p2align 4,,10
	.p2align 3
.L49:
	cmpq	%rsi, 8(%rax)
	je	.L48
.L47:
	movq	%r13, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L49
.L50:
	movq	(%rbx), %rdx
	movq	%rdi, %r9
	movl	$97, %r8d
	movq	%rbx, %rcx
	call	create_var
	movq	%rax, %r14
.L52:
	movq	(%rbx), %rdx
	movq	%rdi, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rsi
	call	alloc_memory
	movq	%rsi, %xmm0
	movl	$24, %ecx
	movhps	16(%rsi), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movq	%r14, %xmm0
	movl	$32, %ecx
	movhps	16(%r14), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rsi
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movq	%r12, 8(%rax)
	movq	%rax, %rdx
	movl	$15, 24(%rax)
	movq	%rbx, (%rax)
	movq	%rsi, 16(%rax)
	movq	16(%rdi), %rax
	movq	8(%rax), %rcx
	call	list_append
	movb	$1, 20(%rbx)
.L40:
	leaq	-56(%rbp), %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L48:
	movq	(%rax), %rcx
	testq	%rcx, %rcx
	je	.L50
	call	list_copy
	xorl	%r13d, %r13d
	movq	%rax, %r14
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L55:
	cmpq	(%rax), %rbx
	je	.L54
	addq	$1, %r13
.L53:
	movq	%r14, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L55
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %edx
	leaq	.LC1(%rip), %rcx
	movq	%rbx, (%rax)
	movq	%rax, %r14
	movq	(%rbx), %rax
	movq	%rax, 16(%r14)
	call	create_string
	movq	%rax, 8(%r14)
	testq	%rsi, %rsi
	je	.L68
	movq	8(%rsi), %rsi
.L59:
	movq	8(%rbx), %r15
	call	__getreent
	movq	%rsi, %r9
	leaq	.LC6(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%r13, 32(%rsp)
	movq	%r15, %r8
	call	fprintf
	movq	8(%r14), %rcx
.L57:
	movq	%r13, %r8
	leaq	.LC7(%rip), %rdx
	call	sprintf
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L67:
	xorl	%esi, %esi
	jmp	.L46
	.p2align 4,,10
	.p2align 3
.L54:
	movl	$24, %ecx
	call	alloc_memory
	leaq	.LC1(%rip), %rcx
	movl	$32, %edx
	movq	%rbx, (%rax)
	movq	%rax, %r14
	movq	(%rbx), %rax
	movq	%rax, 16(%r14)
	call	create_string
	movq	%rax, 8(%r14)
	movq	%rax, %rcx
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L61:
	call	__getreent
	movl	$35, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
.L43:
	xorl	%ebx, %ebx
	jmp	.L40
.L68:
	leaq	.LC4(%rip), %rsi
	jmp	.L59
	.section .rdata,"dr"
	.align 8
.LC8:
	.ascii "[warning] Unsupported symbol kind for import: %d\12\0"
	.text
	.p2align 4
	.globl	codegen_import
	.def	codegen_import;	.scl	2;	.type	32;	.endef
codegen_import:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	movq	(%rcx), %rsi
	movl	32(%rsi), %ebx
	cmpl	$3, %ebx
	je	.L76
	leal	-1(%rbx), %eax
	cmpl	$1, %eax
	jbe	.L77
	testl	%ebx, %ebx
	jne	.L72
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, %rbx
	call	create_list
	movq	%rsi, %xmm1
	movq	$0, 16(%rbx)
	movq	%rbx, %rdx
	movq	%rax, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, (%rbx)
	movq	(%rdi), %rcx
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	list_append
	.p2align 4,,10
	.p2align 3
.L72:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC8(%rip), %rdx
	movq	24(%rax), %rcx
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L77:
	movq	(%rsi), %rdx
	movq	%r8, %r9
	movl	$102, %r8d
.L74:
	movq	%rsi, %rcx
	call	create_var
	movq	16(%rdi), %rcx
	leaq	-24(%rbp), %rsp
	popq	%rbx
	movq	%rax, %rdx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	list_append
	.p2align 4,,10
	.p2align 3
.L76:
	movq	%r8, %r9
	movq	(%rsi), %rdx
	movl	$118, %r8d
	jmp	.L74
	.section .rdata,"dr"
	.align 8
.LC9:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
	.align 8
.LC10:
	.ascii "[warning] Unsupported variable type for codegen_variable: %d\12\0"
	.text
	.p2align 4
	.globl	codegen_variable
	.def	codegen_variable;	.scl	2;	.type	32;	.endef
codegen_variable:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	movq	%rcx, %rsi
	movq	%rdi, %r9
	pushq	%rbx
	movl	%r8d, %ebx
	subq	$32, %rsp
	andq	$-16, %rsp
	subq	$32, %rsp
	movq	(%rcx), %rdx
	movq	8(%rcx), %rcx
	movaps	%xmm6, 32(%rsp)
	movaps	%xmm7, 48(%rsp)
	call	create_var
	movq	%rax, %rdx
	leal	-97(%rbx), %eax
	cmpl	$21, %eax
	ja	.L79
	leaq	.L81(%rip), %rcx
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L81:
	.long	.L85-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L84-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L83-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L80-.L81
	.long	.L79-.L81
	.long	.L80-.L81
	.text
	.p2align 4,,10
	.p2align 3
.L80:
	movq	8(%rdi), %rax
	movq	24(%rax), %rcx
.L88:
	movaps	32(%rsp), %xmm6
	movaps	48(%rsp), %xmm7
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	list_append
	.p2align 4,,10
	.p2align 3
.L79:
	call	__getreent
	movaps	32(%rsp), %xmm6
	movl	%ebx, %r8d
	movaps	48(%rsp), %xmm7
	movq	24(%rax), %rcx
	leaq	-24(%rbp), %rsp
	leaq	.LC10(%rip), %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L85:
	movq	(%rdi), %rax
	movq	(%rax), %rcx
	call	list_pop_back
	movq	%rax, %rbx
	movq	(%rdi), %rax
	movq	%rbx, %rdx
	movq	(%rax), %rcx
	call	list_append
	movdqu	(%rsi), %xmm6
	movl	$24, %ecx
	call	alloc_memory
	movdqa	%xmm6, %xmm7
	movq	%rax, %rsi
	movq	%xmm6, %rcx
	shufpd	$1, %xmm6, %xmm7
	movups	%xmm7, (%rax)
	movq	16(%rbx), %rax
	movq	%rax, 16(%rsi)
	call	get_type_size
	movq	(%rbx), %rcx
	addq	%rax, 16(%rbx)
	movq	%rsi, %rdx
	testq	%rcx, %rcx
	jne	.L88
	call	__getreent
	movaps	32(%rsp), %xmm6
	movaps	48(%rsp), %xmm7
	movl	$63, %r8d
	movq	24(%rax), %r9
	leaq	-24(%rbp), %rsp
	movl	$1, %edx
	leaq	.LC9(%rip), %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L84:
	movq	(%rdi), %rax
	movq	16(%rax), %rcx
	jmp	.L88
	.p2align 4,,10
	.p2align 3
.L83:
	movq	8(%rdi), %rax
	movq	16(%rax), %rcx
	jmp	.L88
	.section .rdata,"dr"
	.align 8
.LC11:
	.ascii "[warning] Invalid variable access input\12\0"
	.align 8
.LC12:
	.ascii "[warning] Variable access name is NULL\12\0"
	.align 8
.LC13:
	.ascii "[warning] Unresolved variable access for '%s', creating fallback local\12\0"
	.align 8
.LC14:
	.ascii "[warning] Invalid get-attribute access\12\0"
	.align 8
.LC15:
	.ascii "[warning] Failed to generate object for get-attribute access\12\0"
	.align 8
.LC16:
	.ascii "[warning] Invalid get-sequence access\12\0"
	.align 8
.LC17:
	.ascii "[warning] Failed to generate sequence/index for get-sequence access\12\0"
	.align 8
.LC18:
	.ascii "[warning] Invalid function call without callee\12\0"
	.align 8
.LC19:
	.ascii "[warning] Failed to generate callee for function call\12\0"
	.align 8
.LC20:
	.ascii "[warning] Unsupported callee in function call\12\0"
	.align 8
.LC21:
	.ascii "[warning] Failed to generate function call argument\12\0"
	.align 8
.LC22:
	.ascii "[warning] Unsupported variable access type for codegen_variable_access: %d\12\0"
	.text
	.p2align 4
	.globl	codegen_variable_access
	.def	codegen_variable_access;	.scl	2;	.type	32;	.endef
codegen_variable_access:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	testq	%rcx, %rcx
	je	.L147
	movq	%rdx, %rsi
	testq	%rdx, %rdx
	je	.L147
	movl	16(%rcx), %edi
	movq	%rcx, %rbx
	testl	%edi, %edi
	jne	.L93
	movq	8(%rcx), %r12
	testq	%r12, %r12
	je	.L226
	movq	8(%rdx), %rdx
	testq	%rdx, %rdx
	je	.L227
	movq	16(%rdx), %rcx
	testq	%rcx, %rcx
	je	.L100
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L100
	.p2align 4,,10
	.p2align 3
.L103:
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	je	.L101
	cmpq	(%rbx), %r12
	je	.L223
.L101:
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L103
.L100:
	movq	24(%rdx), %rax
	testq	%rax, %rax
	je	.L107
	.p2align 4,,10
	.p2align 3
.L104:
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L107
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	je	.L104
	cmpq	(%rbx), %r12
	jne	.L104
	.p2align 4,,10
	.p2align 3
.L223:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbx, %xmm0
	movhps	16(%rbx), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r13
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
.L89:
	leaq	-40(%rbp), %rsp
	movq	%r13, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L93:
	cmpl	$2, %edi
	je	.L228
	cmpl	$3, %edi
	je	.L229
	cmpl	$1, %edi
	jne	.L130
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L230
	cmpl	$2, 16(%rcx)
	jne	.L132
	movq	8(%rcx), %r12
	testq	%r12, %r12
	je	.L132
	movl	32(%r12), %eax
	subl	$1, %eax
	cmpl	$1, %eax
	ja	.L132
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L146
	movl	16(%rcx), %edx
	testl	%edx, %edx
	jne	.L134
	movq	8(%rcx), %rax
	testq	%rax, %rax
	je	.L134
	movl	32(%rax), %eax
	testl	%eax, %eax
	je	.L146
.L134:
	movq	%rsi, %rdx
	call	codegen_variable_access
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L146
	movq	%rsi, %rdx
	movl	$1, %edi
	call	emit_param_instruction
.L136:
	movq	8(%rbx), %rcx
	call	list_copy
	movq	%rax, %rbx
	jmp	.L140
	.p2align 4,,10
	.p2align 3
.L142:
	movq	%rsi, %rdx
	call	codegen_expression
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L231
	movq	%rsi, %rdx
	addq	$1, %rdi
	call	emit_param_instruction
.L140:
	movq	%rbx, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L142
	movl	$24, %ecx
	call	alloc_memory
	movq	$0, (%rax)
	movq	%rax, %r13
	movl	$5, 16(%rax)
	movq	.refptr.name_void(%rip), %rax
	movb	$0, 20(%r13)
	movq	(%r12), %rdx
	movq	(%rax), %rax
	movq	%rax, 8(%r13)
	testq	%rdx, %rdx
	je	.L143
	cmpq	%rax, %rdx
	je	.L143
	movq	%rsi, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movq	%rbx, %xmm0
	movhps	16(%rbx), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r13
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	movq	(%r12), %rdx
.L143:
	movq	%rsi, %r9
	movl	$102, %r8d
	movq	%r12, %rcx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movq	%rbx, %xmm0
	movl	$24, %ecx
	movhps	16(%rbx), %xmm0
	movl	$7, 16(%rax)
	movq	%rax, %r12
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movl	$32, %ecx
	movq	%rdi, (%rax)
	movq	%rax, %rbx
	movl	$1, 16(%rax)
	movq	.refptr.name_int(%rip), %rax
	movb	$0, 20(%rbx)
	movq	(%rax), %rax
	movq	%rax, 8(%rbx)
	call	alloc_memory
	movq	%r12, 8(%rax)
	movq	%rax, %rdx
	movq	%r13, (%rax)
	movq	%rbx, 16(%rax)
	movl	$22, 24(%rax)
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L89
	.p2align 4,,10
	.p2align 3
.L229:
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L125
	cmpq	$0, 8(%rbx)
	je	.L125
	call	codegen_variable_access
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	8(%rbx), %rcx
	movq	%rsi, %rdx
	movq	%rax, %rdi
	call	codegen_expression
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rax, %r12
	testq	%rdi, %rdi
	je	.L148
	testq	%rax, %rax
	je	.L148
	movq	.refptr.name_int(%rip), %rax
	movq	8(%rdi), %rdx
	movq	(%rax), %rcx
	movq	.refptr.name_float(%rip), %rax
	cmpq	(%rax), %rdx
	je	.L129
	movq	.refptr.name_bool(%rip), %rax
	cmpq	(%rax), %rdx
	je	.L129
	movq	.refptr.name_string(%rip), %rax
	cmpq	(%rax), %rdx
	cmovne	%rcx, %rdx
.L129:
	movq	%rsi, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movq	%rbx, %xmm0
	movl	$32, %ecx
	movhps	16(%rbx), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r13
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movq	%rdi, 8(%rax)
	movq	%rax, %rdx
	movl	$16, 24(%rax)
	movq	%r13, (%rax)
	movq	%r12, 16(%rax)
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	movb	$1, 20(%r13)
	jmp	.L89
	.p2align 4,,10
	.p2align 3
.L132:
	movq	%rsi, %rdx
	call	codegen_variable_access
	testq	%rax, %rax
	je	.L232
	movl	16(%rax), %edx
	cmpl	$7, %edx
	je	.L233
	testl	%edx, %edx
	jne	.L139
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L139
	movq	(%rax), %r12
	testq	%r12, %r12
	je	.L139
	movl	32(%r12), %eax
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L146
	.p2align 4,,10
	.p2align 3
.L139:
	call	__getreent
	movl	$46, %r8d
	movl	$1, %edx
	leaq	.LC20(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L92
	.p2align 4,,10
	.p2align 3
.L228:
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L120
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L120
	movl	32(%rbx), %eax
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L234
	call	codegen_variable_access
	movq	%rsi, %r8
	movq	%rbx, %rdx
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L235
.L225:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	jmp	emit_attribute_access
	.p2align 4,,10
	.p2align 3
.L227:
	movq	(%rsi), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L217
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L217
	.p2align 4,,10
	.p2align 3
.L113:
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	je	.L112
	cmpq	(%rbx), %r12
	je	.L223
.L112:
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L113
	cmpl	$2, 32(%r12)
	jbe	.L98
	testq	%rdx, %rdx
	je	.L99
	movq	16(%rdx), %rcx
.L106:
	movq	(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L99
	movq	.refptr.SELF_KEYWORD(%rip), %r13
	.p2align 4,,10
	.p2align 3
.L116:
	movq	8(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L117
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L117
	movq	0(%r13), %rdx
	movq	8(%rax), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L236
.L117:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L116
.L99:
	movq	8(%r12), %rbx
	call	__getreent
	leaq	.LC13(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	call	fprintf
	movq	(%r12), %rdx
	movq	%rsi, %r9
	movq	%r12, %rcx
	movl	$118, %r8d
	call	create_var
	movq	%rax, %rbx
	jmp	.L223
	.p2align 4,,10
	.p2align 3
.L236:
	movq	16(%rdi), %rax
	testq	%rax, %rax
	je	.L99
	movl	32(%rax), %ecx
	testl	%ecx, %ecx
	jne	.L99
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	cmpq	%rax, 24(%r12)
	jne	.L99
	movl	$24, %ecx
	call	alloc_memory
	movq	%rdi, %xmm0
	movq	%rsi, %r8
	movq	%r12, %rdx
	movhps	16(%rdi), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rcx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L225
	.p2align 4,,10
	.p2align 3
.L147:
	call	__getreent
	movl	$40, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
.L92:
	xorl	%r13d, %r13d
	jmp	.L89
	.p2align 4,,10
	.p2align 3
.L217:
	cmpl	$2, 32(%r12)
	ja	.L99
	.p2align 4,,10
	.p2align 3
.L98:
	movq	(%r12), %rdx
	movq	%rsi, %r9
	movl	$102, %r8d
	movq	%r12, %rcx
.L224:
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movq	%rbx, %xmm0
	movhps	16(%rbx), %xmm0
	movl	$7, 16(%rax)
	movq	%rax, %r13
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	leaq	-40(%rbp), %rsp
	movq	%r13, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L130:
	call	__getreent
	movl	%edi, %r8d
	leaq	.LC22(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L92
	.p2align 4,,10
	.p2align 3
.L231:
	call	__getreent
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC21(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L92
	.p2align 4,,10
	.p2align 3
.L226:
	call	__getreent
	movl	$39, %r8d
	movl	$1, %edx
	leaq	.LC12(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L92
	.p2align 4,,10
	.p2align 3
.L234:
	movq	(%rbx), %rdx
	movq	%rsi, %r9
	movl	$102, %r8d
	movq	%rbx, %rcx
	jmp	.L224
	.p2align 4,,10
	.p2align 3
.L233:
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L139
	movq	(%rax), %r12
	testq	%r12, %r12
	je	.L139
.L146:
	xorl	%edi, %edi
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L107:
	movq	(%rsi), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L110
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L113
.L110:
	cmpl	$2, 32(%r12)
	ja	.L106
	jmp	.L98
.L125:
	call	__getreent
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC16(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L92
.L120:
	call	__getreent
	movl	$39, %r8d
	movl	$1, %edx
	leaq	.LC14(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L92
.L235:
	call	__getreent
	movl	$61, %r8d
	movl	$1, %edx
	leaq	.LC15(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L92
.L230:
	call	__getreent
	movl	$47, %r8d
	movl	$1, %edx
	leaq	.LC18(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L92
.L148:
	call	__getreent
	movl	$68, %r8d
	movl	$1, %edx
	leaq	.LC17(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L92
.L232:
	call	__getreent
	movl	$54, %r8d
	movl	$1, %edx
	leaq	.LC19(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L92
	.section .rdata,"dr"
	.align 8
.LC24:
	.ascii "[warning] Unsupported type for negation: %s\12\0"
	.align 8
.LC25:
	.ascii "[warning] Unsupported primary type for codegen_primary: %d\12\0"
	.text
	.p2align 4
	.globl	codegen_primary
	.def	codegen_primary;	.scl	2;	.type	32;	.endef
codegen_primary:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$32, %rsp
	movl	8(%rcx), %ebx
	movaps	%xmm6, 32(%rsp)
	cmpl	$8, %ebx
	ja	.L238
	leaq	.L240(%rip), %r8
	movq	%rdx, %rsi
	movslq	(%r8,%rbx,4), %rax
	addq	%r8, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L240:
	.long	.L248-.L240
	.long	.L247-.L240
	.long	.L246-.L240
	.long	.L245-.L240
	.long	.L244-.L240
	.long	.L243-.L240
	.long	.L242-.L240
	.long	.L241-.L240
	.long	.L239-.L240
	.text
	.p2align 4,,10
	.p2align 3
.L241:
	movq	(%rcx), %rcx
	call	codegen_primary
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rsi, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	movq	8(%rax), %rdx
	movq	%rax, %r12
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rdi
	call	alloc_memory
	movq	%rdi, %xmm0
	movhps	16(%rdi), %xmm0
	movq	.refptr.name_int(%rip), %rdi
	movb	$0, 20(%rax)
	movq	%rax, %rbx
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movq	8(%r12), %rax
	cmpq	(%rdi), %rax
	je	.L255
	movq	.refptr.name_float(%rip), %r13
	cmpq	0(%r13), %rax
	je	.L256
	movq	8(%rax), %rbx
	call	__getreent
	leaq	.LC24(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	xorl	%ebx, %ebx
	call	fprintf
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L239:
	movq	(%rcx), %rcx
	movaps	32(%rsp), %xmm6
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	jmp	codegen_variable_access
	.p2align 4,,10
	.p2align 3
.L248:
	movq	(%rcx), %rcx
	movl	$10, %r8d
	xorl	%edx, %edx
	call	strtoll
	movl	$24, %ecx
	movq	%rax, %rsi
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rax, %rbx
	movl	$1, 16(%rax)
	movq	.refptr.name_int(%rip), %rax
	movq	(%rax), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
.L237:
	movaps	32(%rsp), %xmm6
	leaq	-40(%rbp), %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L247:
	movq	(%rcx), %rcx
	xorl	%edx, %edx
	call	strtod
	movl	$24, %ecx
	movapd	%xmm0, %xmm6
	call	alloc_memory
	movsd	%xmm6, (%rax)
	movq	%rax, %rbx
	movl	$2, 16(%rax)
	movq	.refptr.name_float(%rip), %rax
	movq	(%rax), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L246:
	movq	(%rcx), %xmm6
	movl	$24, %ecx
	call	alloc_memory
	movl	$3, 16(%rax)
	movq	%rax, %rbx
	movdqa	%xmm6, %xmm0
	movq	.refptr.name_string(%rip), %rax
	movhps	(%rax), %xmm0
	movb	$0, 20(%rbx)
	movups	%xmm0, (%rbx)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L245:
	movl	$24, %ecx
	call	alloc_memory
	movb	$1, (%rax)
	movq	%rax, %rbx
	movl	$4, 16(%rax)
	movq	.refptr.name_bool(%rip), %rax
	movq	(%rax), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L244:
	movl	$24, %ecx
	call	alloc_memory
	movb	$0, (%rax)
	movq	%rax, %rbx
	movl	$4, 16(%rax)
	movq	.refptr.name_bool(%rip), %rax
	movq	(%rax), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L243:
	movq	(%rcx), %rcx
	movaps	32(%rsp), %xmm6
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	jmp	codegen_expression
	.p2align 4,,10
	.p2align 3
.L242:
	movq	(%rcx), %rcx
	call	codegen_primary
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rsi, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	movq	%rax, %r12
	movq	.refptr.name_bool(%rip), %rax
	movq	(%rax), %rdx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rdi
	call	alloc_memory
	movq	%rdi, %xmm0
	movl	$32, %ecx
	movhps	16(%rdi), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movq	%r12, 8(%rax)
	movq	%rax, %rdx
	movq	%rbx, (%rax)
	movl	$13, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L237
.L238:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC25(%rip), %rdx
	xorl	%ebx, %ebx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L256:
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movl	$2, 16(%rax)
	movq	%rax, %rdi
	movq	.LC23(%rip), %rax
	movb	$0, 20(%rdi)
	movq	%rax, (%rdi)
	movq	0(%r13), %rax
	movq	%rax, 8(%rdi)
	call	alloc_memory
	movl	$2, 24(%rax)
	movq	%rax, %rdx
	movq	%rbx, (%rax)
	movq	%rdi, 8(%rax)
	movq	%r12, 16(%rax)
.L251:
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L255:
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movl	$1, 16(%rax)
	movq	%rax, %r13
	movq	$0, (%rax)
	movq	(%rdi), %rax
	movb	$0, 20(%r13)
	movq	%rax, 8(%r13)
	call	alloc_memory
	movl	$1, 24(%rax)
	movq	%rax, %rdx
	movq	%rbx, (%rax)
	movq	%r13, 8(%rax)
	movq	%r12, 16(%rax)
	jmp	.L251
	.section .rdata,"dr"
	.align 8
.LC26:
	.ascii "[warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.p2align 4
	.globl	codegen_expression
	.def	codegen_expression;	.scl	2;	.type	32;	.endef
codegen_expression:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	cmpl	$19, 24(%rcx)
	je	.L271
	movq	16(%rcx), %rcx
	call	codegen_expression
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rax, %rdi
	movl	24(%rsi), %eax
	cmpl	$18, %eax
	ja	.L259
	leaq	CSWTCH.22(%rip), %rdx
	movq	(%rsi), %rcx
	movl	(%rdx,%rax,4), %r13d
	movq	%rbx, %rdx
	call	codegen_expression
	movq	%rax, %r12
	movl	24(%rsi), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L260
	cmpl	$14, %r13d
	jne	.L264
	movl	16(%r12), %eax
	testl	%eax, %eax
	jne	.L272
.L262:
	movl	$32, %ecx
	call	alloc_memory
	movl	$14, 24(%rax)
	movq	%rax, %rdx
	movq	%r12, (%rax)
	movq	%rdi, 8(%rax)
	movq	$0, 16(%rax)
	cmpb	$0, 20(%r12)
	jne	.L273
.L263:
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	leaq	-48(%rbp), %rsp
	movq	%rdi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L259:
	movq	(%rsi), %rcx
	movq	%rbx, %rdx
	movl	$25, %r13d
	call	codegen_expression
	movq	%rax, %r12
	movl	24(%rsi), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L260
.L264:
	movq	8(%r12), %rdx
	movq	%rbx, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %r14
	call	alloc_memory
	movq	%r14, %xmm0
	movq	%rbx, %rdx
	movq	%r12, %rcx
	movhps	16(%r14), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rsi
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	load_rvalue
	movl	$32, %ecx
	movq	%rax, %r14
	call	alloc_memory
	movq	%r14, 8(%rax)
	movq	%rax, %rdx
	movq	%rdi, 16(%rax)
	movq	%rsi, %rdi
	movl	%r13d, 24(%rax)
	movq	%rsi, (%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	16(%r12), %eax
	testl	%eax, %eax
	je	.L262
.L272:
	call	__getreent
	movl	$57, %r8d
	movl	$1, %edx
	leaq	.LC26(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L262
	.p2align 4,,10
	.p2align 3
.L260:
	movq	8(%r12), %rdx
	movq	%rbx, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %r14
	call	alloc_memory
	movq	%r14, %xmm0
	movq	%rbx, %rdx
	movq	%r12, %rcx
	movhps	16(%r14), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rsi
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	load_rvalue
	movl	$32, %ecx
	movq	%rax, %r12
	call	alloc_memory
	movq	%rdi, 16(%rax)
	movq	%rax, %rdx
	movq	%rsi, %rdi
	movl	%r13d, 24(%rax)
	movq	%rsi, (%rax)
	movq	%r12, 8(%rax)
	jmp	.L263
	.p2align 4,,10
	.p2align 3
.L271:
	movq	8(%rcx), %rcx
	leaq	-48(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	jmp	codegen_primary
	.p2align 4,,10
	.p2align 3
.L273:
	movl	$32, %ecx
	call	alloc_memory
	movl	$24, 24(%rax)
	movq	%rax, %rdx
	movq	%r12, (%rax)
	movq	%rdi, 8(%rax)
	movq	$0, 16(%rax)
	jmp	.L263
	.p2align 4
	.globl	codegen_if
	.def	codegen_if;	.scl	2;	.type	32;	.endef
codegen_if:
	pushq	%r15
	movq	%rdx, %r9
	movl	$98, %r8d
	pushq	%r14
	movq	%rcx, %r14
	xorl	%ecx, %ecx
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	xorl	%edx, %edx
	subq	$72, %rsp
	call	create_var
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rbx, %r9
	movl	$98, %r8d
	movq	%rax, %rdi
	call	create_var
	movq	16(%r14), %rcx
	movq	%rax, %rsi
	call	list_is_empty
	testb	%al, %al
	je	.L277
	movq	24(%r14), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L298
.L277:
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	create_var
	movq	%rax, 56(%rsp)
.L276:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbx, %rdx
	movl	$6, 16(%rax)
	movq	%rax, %r12
	movq	$0, 8(%rax)
	movq	56(%rsp), %rax
	movb	$0, 20(%r12)
	movq	(%r14), %rcx
	movq	%rax, (%r12)
	call	codegen_expression
	movl	$24, %ecx
	movq	%rax, %r15
	call	alloc_memory
	movl	$24, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %rbp
	movq	$0, 8(%rax)
	movq	%rsi, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movl	$32, %ecx
	movq	%rdi, (%rax)
	movq	%rax, %r13
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	%rax, %rdx
	movq	%r13, 8(%rax)
	movq	%rbp, 16(%rax)
	movl	$19, 24(%rax)
	movq	%r15, (%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movq	%rdi, (%rax)
	movq	%rax, %rbp
	call	create_list
	movq	%rbp, %rdx
	movq	%rax, 8(%rbp)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rbp, 16(%rbx)
	movq	8(%r14), %rcx
	call	list_copy
	movq	%rax, %rdi
	jmp	.L278
	.p2align 4,,10
	.p2align 3
.L279:
	movq	%rbx, %rdx
	call	codegen_statement
.L278:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L279
	movl	$32, %ecx
	call	alloc_memory
	movq	$0, 8(%rax)
	movq	%rax, %rdx
	movl	$20, 24(%rax)
	movq	%r12, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	16(%r14), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L299
.L280:
	movq	24(%r14), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L300
.L287:
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %rsi
	movq	56(%rsp), %rax
	movq	%rax, (%rsi)
	call	create_list
	movq	%rsi, %rdx
	movq	%rax, 8(%rsi)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rsi, 16(%rbx)
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L298:
	movq	%rsi, 56(%rsp)
	jmp	.L276
	.p2align 4,,10
	.p2align 3
.L300:
	movl	$16, %ecx
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rax, %rdi
	call	create_list
	movq	%rdi, %rdx
	movq	%rax, 8(%rdi)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rdi, 16(%rbx)
	movq	24(%r14), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L288
	.p2align 4,,10
	.p2align 3
.L289:
	movq	%rbx, %rdx
	call	codegen_statement
.L288:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L289
	movl	$32, %ecx
	call	alloc_memory
	movq	%r12, (%rax)
	movq	%rax, %rdx
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L287
	.p2align 4,,10
	.p2align 3
.L299:
	movq	16(%r14), %rcx
	call	list_copy
	movq	%rax, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L281:
	movq	40(%rsp), %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L280
	movl	$16, %ecx
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rax, %rbp
	call	create_list
	movq	%rbp, %rdx
	movq	%rax, 8(%rbp)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rbp, 16(%rbx)
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rbx, %r9
	movl	$98, %r8d
	call	create_var
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rbx, %r9
	movl	$98, %r8d
	movq	%rax, %rbp
	call	create_var
	movq	(%rdi), %rcx
	movq	%rbx, %rdx
	movq	%rax, %rsi
	call	codegen_expression
	movq	40(%rsp), %rcx
	movq	%rax, %r13
	call	list_is_empty
	testb	%al, %al
	jne	.L301
.L283:
	movl	$24, %ecx
	call	alloc_memory
	movl	$24, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %r15
	movq	$0, 8(%rax)
	movq	%rsi, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movl	$32, %ecx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	movb	$0, 20(%rax)
	movq	%rax, 48(%rsp)
	call	alloc_memory
	movq	48(%rsp), %r9
	movq	%rax, %rdx
	movq	%r13, (%rax)
	movq	%r9, 8(%rax)
	movl	$19, 24(%rax)
	movq	%r15, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movq	%rbp, (%rax)
	movq	%rax, %r13
	call	create_list
	movq	%r13, %rdx
	movq	%rax, 8(%r13)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%r13, 16(%rbx)
	movq	8(%rdi), %rcx
	call	list_copy
	movq	%rax, %rdi
	jmp	.L284
	.p2align 4,,10
	.p2align 3
.L285:
	movq	%rbx, %rdx
	call	codegen_statement
.L284:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L285
	movl	$32, %ecx
	call	alloc_memory
	movq	%r12, (%rax)
	movq	%rax, %rdx
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L281
	.p2align 4,,10
	.p2align 3
.L301:
	movq	24(%r14), %rcx
	call	list_is_empty
	testb	%al, %al
	cmovne	56(%rsp), %rsi
	jmp	.L283
	.section .rdata,"dr"
	.align 8
.LC27:
	.ascii "[warning] 'break' statement used outside of loop\12\0"
	.align 8
.LC28:
	.ascii "[warning] 'continue' statement used outside of loop\12\0"
	.align 8
.LC29:
	.ascii "[warning] Unsupported statement type for codegen_statement: %d\12\0"
	.text
	.p2align 4
	.globl	codegen_statement
	.def	codegen_statement;	.scl	2;	.type	32;	.endef
codegen_statement:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movl	8(%rcx), %ebx
	cmpl	$7, %ebx
	ja	.L303
	movq	%rdx, %rsi
	leaq	.L305(%rip), %rdx
	movslq	(%rdx,%rbx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L305:
	.long	.L312-.L305
	.long	.L311-.L305
	.long	.L310-.L305
	.long	.L309-.L305
	.long	.L308-.L305
	.long	.L307-.L305
	.long	.L306-.L305
	.long	.L304-.L305
	.text
	.p2align 4,,10
	.p2align 3
.L306:
	movq	24(%rsi), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L313
	movq	24(%rsi), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	je	.L313
.L323:
	movl	$32, %ecx
	call	alloc_memory
	movl	$20, 24(%rax)
	movq	%rax, %rdx
	jmp	.L322
	.p2align 4,,10
	.p2align 3
.L304:
	movq	32(%rsi), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L314
	movq	32(%rsi), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L323
.L314:
	call	__getreent
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC28(%rip), %rcx
	movq	24(%rax), %r9
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L310:
	movq	(%rcx), %rcx
	addq	$40, %rsp
	movq	%rsi, %rdx
	popq	%rbx
	popq	%rsi
	jmp	codegen_if
	.p2align 4,,10
	.p2align 3
.L312:
	movq	(%rcx), %rcx
	addq	$40, %rsp
	movq	%rsi, %rdx
	popq	%rbx
	popq	%rsi
	jmp	codegen_expression
	.p2align 4,,10
	.p2align 3
.L311:
	movq	(%rcx), %rax
	movq	%rsi, %r9
	movl	$118, %r8d
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	call	create_var
	movq	%rax, %rdx
	movq	8(%rsi), %rax
	movq	24(%rax), %rcx
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	jmp	list_append
	.p2align 4,,10
	.p2align 3
.L308:
	movq	(%rcx), %rcx
	addq	$40, %rsp
	movq	%rsi, %rdx
	popq	%rbx
	popq	%rsi
	jmp	codegen_for
	.p2align 4,,10
	.p2align 3
.L307:
	movq	(%rcx), %rcx
	movq	%rsi, %rdx
	call	codegen_expression
	movl	$32, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movl	$21, 24(%rax)
	movq	%rax, %rdx
.L322:
	movq	16(%rsi), %rax
	movq	%rbx, (%rdx)
	movq	$0, 8(%rdx)
	movq	$0, 16(%rdx)
	movq	8(%rax), %rcx
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	jmp	list_append
	.p2align 4,,10
	.p2align 3
.L309:
	movq	(%rcx), %rcx
	addq	$40, %rsp
	movq	%rsi, %rdx
	popq	%rbx
	popq	%rsi
	jmp	codegen_while
	.p2align 4,,10
	.p2align 3
.L313:
	call	__getreent
	movl	$49, %r8d
	movl	$1, %edx
	leaq	.LC27(%rip), %rcx
	movq	24(%rax), %r9
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	jmp	fwrite
.L303:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC29(%rip), %rdx
	movq	24(%rax), %rcx
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	jmp	fprintf
	.p2align 4
	.globl	codegen_for
	.def	codegen_for;	.scl	2;	.type	32;	.endef
codegen_for:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$40, %rsp
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L325
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	movq	%rbx, %r9
	movl	$118, %r8d
	call	create_var
	movq	%rax, %rdx
	movq	8(%rbx), %rax
	movq	24(%rax), %rcx
	call	list_append
.L325:
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rbx, %r9
	movl	$98, %r8d
	call	create_var
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rbx, %r9
	movl	$98, %r8d
	movq	%rax, %rbp
	call	create_var
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rbx, %r9
	movl	$98, %r8d
	movq	%rax, %r13
	call	create_var
	cmpq	$0, 8(%rdi)
	movl	$24, %ecx
	movq	%rax, %r12
	je	.L326
	call	alloc_memory
	movl	$32, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %rsi
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	%rax, %rdx
	movq	%rsi, (%rax)
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movq	%rbp, (%rax)
	movq	%rax, %rsi
	call	create_list
	movq	%rsi, %rdx
	movq	%rax, 8(%rsi)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rsi, 16(%rbx)
	movq	8(%rdi), %rcx
	movq	%rbx, %rdx
	call	codegen_expression
	movl	$24, %ecx
	movq	%rax, %r15
	call	alloc_memory
	movl	$24, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %rsi
	movq	$0, 8(%rax)
	movq	%r12, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movl	$32, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %r14
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	%r14, 8(%rax)
	movq	%rax, %rdx
	movl	$19, 24(%rax)
	movq	%r15, (%rax)
	movq	%rsi, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L327:
	movl	$16, %ecx
	call	alloc_memory
	movq	%r13, (%rax)
	movq	%rax, %rsi
	call	create_list
	movq	%rsi, %rdx
	movq	%rax, 8(%rsi)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rsi, 16(%rbx)
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rbx, %r9
	movl	$98, %r8d
	call	create_var
	cmpq	$0, 16(%rdi)
	movl	$24, %ecx
	movq	%rax, %r14
	je	.L328
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	32(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r14, (%rax)
	call	list_append
.L329:
	movl	$24, %ecx
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	24(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r12, (%rax)
	call	list_append
	movq	24(%rdi), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L331
	.p2align 4,,10
	.p2align 3
.L332:
	movq	%rbx, %rdx
	call	codegen_statement
.L331:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L332
	movq	32(%rbx), %rcx
	call	list_pop_back
	movq	24(%rbx), %rcx
	call	list_pop_back
	cmpq	$0, 16(%rdi)
	je	.L333
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %rsi
	movq	$0, 8(%rax)
	movq	%r14, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	%rax, %rdx
	movq	%rsi, (%rax)
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movq	%r14, (%rax)
	movq	%rax, %rsi
	call	create_list
	movq	%rsi, %rdx
	movq	%rax, 8(%rsi)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rsi, 16(%rbx)
	movq	16(%rdi), %rcx
	movq	%rbx, %rdx
	call	codegen_expression
.L333:
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %rsi
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	cmpq	$0, 8(%rdi)
	movl	$20, 24(%rax)
	movq	%rax, %rdx
	movq	%rsi, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	je	.L339
.L334:
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movq	%r12, (%rax)
	movq	%rax, %rsi
	call	create_list
	movq	%rsi, %rdx
	movq	%rax, 8(%rsi)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rsi, 16(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L328:
	cmpq	$0, 8(%rdi)
	je	.L330
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	32(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	call	list_append
	jmp	.L329
	.p2align 4,,10
	.p2align 3
.L326:
	call	alloc_memory
	movl	$32, %ecx
	movq	%r13, (%rax)
	movq	%rax, %rsi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rax, %rdx
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L327
	.p2align 4,,10
	.p2align 3
.L339:
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %rsi
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movl	$20, 24(%rax)
	movq	%rax, %rdx
	movq	%rsi, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	jmp	.L334
	.p2align 4,,10
	.p2align 3
.L330:
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	32(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	call	list_append
	jmp	.L329
	.p2align 4
	.globl	codegen_while
	.def	codegen_while;	.scl	2;	.type	32;	.endef
codegen_while:
	pushq	%r15
	movq	%rdx, %r9
	movl	$98, %r8d
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rcx, %rsi
	xorl	%ecx, %ecx
	pushq	%rbx
	movq	%rdx, %rbx
	xorl	%edx, %edx
	subq	$40, %rsp
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rbp
	call	alloc_memory
	movl	$32, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %rdi
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	%rax, %rdx
	movq	%rdi, (%rax)
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movq	%rbp, (%rax)
	movq	%rax, %rdi
	call	create_list
	movq	%rdi, %rdx
	movq	%rax, 8(%rdi)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rdi, 16(%rbx)
	movq	%rbx, %r9
	xorl	%edx, %edx
	movl	$98, %r8d
	xorl	%ecx, %ecx
	call	create_var
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rax, %r13
	call	create_var
	movq	(%rsi), %rcx
	movq	%rbx, %rdx
	movq	%rax, %rdi
	call	codegen_expression
	movl	$24, %ecx
	movq	%rax, %r15
	call	alloc_memory
	movl	$24, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %r12
	movq	$0, 8(%rax)
	movq	%rdi, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movl	$32, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %r14
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	%rax, %rdx
	movq	%r14, 8(%rax)
	movq	%r12, 16(%rax)
	movl	$19, 24(%rax)
	movq	%r15, (%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movq	%r13, (%rax)
	movq	%rax, %r12
	call	create_list
	movq	%r12, %rdx
	movq	%rax, 8(%r12)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%r12, 16(%rbx)
	movl	$24, %ecx
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	32(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	call	list_append
	movl	$24, %ecx
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	24(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rdi, (%rax)
	call	list_append
	movq	8(%rsi), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L341
	.p2align 4,,10
	.p2align 3
.L342:
	movq	%rbx, %rdx
	call	codegen_statement
.L341:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L342
	movq	32(%rbx), %rcx
	call	list_pop_back
	movq	24(%rbx), %rcx
	call	list_pop_back
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movq	%rbp, (%rax)
	movq	%rax, %rsi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	%rax, %rdx
	movq	%rsi, (%rax)
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movq	%rdi, (%rax)
	movq	%rax, %rsi
	call	create_list
	movq	%rsi, %rdx
	movq	%rax, 8(%rsi)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rsi, 16(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4
	.globl	codegen_function
	.def	codegen_function;	.scl	2;	.type	32;	.endef
codegen_function:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r13
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$32, %rsp
	movaps	%xmm6, 32(%rsp)
	movdqu	(%rcx), %xmm6
	movl	$40, %ecx
	call	alloc_memory
	movups	%xmm6, (%rax)
	movq	%rax, %rsi
	call	create_list
	movq	%rax, 16(%rsi)
	call	create_list
	movq	%rax, 24(%rsi)
	call	create_list
	movq	%rsi, %rdx
	movq	%rax, 32(%rsi)
	movq	(%rbx), %rax
	movq	%rsi, 8(%rbx)
	movq	24(%rax), %rcx
	call	list_append
	movq	16(%r12), %rcx
	call	list_copy
	movq	%rax, %rdi
	jmp	.L345
	.p2align 4,,10
	.p2align 3
.L346:
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	movq	%rbx, %r9
	movl	$112, %r8d
	call	create_var
	movq	16(%rsi), %rcx
	movq	%rax, %rdx
	call	list_append
.L345:
	movq	%rdi, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L346
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	create_var
	movl	$16, %ecx
	movq	%rax, %r13
	call	alloc_memory
	movq	%r13, (%rax)
	movq	%rax, %rdi
	call	create_list
	movq	32(%rsi), %rcx
	movq	%rdi, %rdx
	movq	%rax, 8(%rdi)
	call	list_append
	movq	%rdi, 16(%rbx)
	movq	24(%r12), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L347
	.p2align 4,,10
	.p2align 3
.L348:
	movq	%rbx, %rdx
	call	codegen_statement
.L347:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L348
	movq	$0, 8(%rbx)
	movaps	32(%rsp), %xmm6
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	ret
	.p2align 4
	.globl	codegen_method
	.def	codegen_method;	.scl	2;	.type	32;	.endef
codegen_method:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r13
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$32, %rsp
	movaps	%xmm6, 32(%rsp)
	movdqu	(%rcx), %xmm6
	movl	$40, %ecx
	call	alloc_memory
	movups	%xmm6, (%rax)
	movq	%rax, %rsi
	call	create_list
	movq	%rax, 16(%rsi)
	call	create_list
	movq	%rax, 24(%rsi)
	call	create_list
	movq	%rsi, %rdx
	movq	%rax, 32(%rsi)
	movq	(%rbx), %rax
	movq	%rsi, 8(%rbx)
	movq	24(%rax), %rcx
	call	list_append
	movq	16(%r12), %rcx
	call	list_copy
	movq	%rax, %rdi
	jmp	.L351
	.p2align 4,,10
	.p2align 3
.L352:
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	movq	%rbx, %r9
	movl	$112, %r8d
	call	create_var
	movq	16(%rsi), %rcx
	movq	%rax, %rdx
	call	list_append
.L351:
	movq	%rdi, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L352
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	create_var
	movl	$16, %ecx
	movq	%rax, %r13
	call	alloc_memory
	movq	%r13, (%rax)
	movq	%rax, %rdi
	call	create_list
	movq	32(%rsi), %rcx
	movq	%rdi, %rdx
	movq	%rax, 8(%rdi)
	call	list_append
	movq	%rdi, 16(%rbx)
	movq	24(%r12), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L353
	.p2align 4,,10
	.p2align 3
.L354:
	movq	%rbx, %rdx
	call	codegen_statement
.L353:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L354
	movq	$0, 8(%rbx)
	movaps	32(%rsp), %xmm6
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC30:
	.ascii "[warning] Unsupported class member type for codegen_class: %d\12\0"
	.text
	.p2align 4
	.globl	codegen_class
	.def	codegen_class;	.scl	2;	.type	32;	.endef
codegen_class:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	pushq	%rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$32, %rsp
	movq	8(%rcx), %rcx
	movaps	%xmm6, 32(%rsp)
	call	list_copy
	movl	$24, %ecx
	movq	(%r12), %xmm6
	movq	%rax, %rsi
	call	alloc_memory
	movq	%rax, %rbx
	call	create_list
	movq	%rbx, %rdx
	movq	%rax, %xmm0
	punpcklqdq	%xmm6, %xmm0
	movups	%xmm0, (%rbx)
	movq	24(%r12), %rax
	leaq	.LC30(%rip), %r12
	movq	%rax, 16(%rbx)
	movq	(%rdi), %rax
	movq	(%rax), %rcx
	call	list_append
	.p2align 4,,10
	.p2align 3
.L357:
	movq	%rsi, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L365
.L362:
	movl	8(%rax), %ebx
	testl	%ebx, %ebx
	je	.L358
	cmpl	$1, %ebx
	je	.L359
	call	__getreent
	movl	%ebx, %r8d
	movq	%r12, %rdx
	movq	24(%rax), %rcx
	call	fprintf
	movq	%rsi, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L362
.L365:
	movaps	32(%rsp), %xmm6
	leaq	-32(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L359:
	movq	(%rax), %rcx
	movl	$97, %r8d
	movq	%rdi, %rdx
	call	codegen_variable
	jmp	.L357
	.p2align 4,,10
	.p2align 3
.L358:
	movq	(%rax), %rcx
	movq	%rdi, %rdx
	call	codegen_method
	jmp	.L357
	.section .rdata,"dr"
.LC31:
	.ascii "main\0"
	.text
	.p2align 4
	.globl	codegen_code
	.def	codegen_code;	.scl	2;	.type	32;	.endef
codegen_code:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r13
	leaq	.LC31(%rip), %r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	movl	$32, %ecx
	andq	$-16, %rsp
	subq	$32, %rsp
	call	alloc_memory
	movq	%rax, %r12
	call	create_list
	movq	$0, 8(%r12)
	movq	%rax, (%r12)
	call	create_list
	movq	%rax, 16(%r12)
	call	create_list
	movl	$88, %ecx
	movq	%rax, 24(%r12)
	call	alloc_memory
	movq	%r12, (%rax)
	movq	%rax, %rsi
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	call	create_list
	movq	%rax, 24(%rsi)
	call	create_list
	pxor	%xmm0, %xmm0
	movq	(%rbx), %rcx
	movq	%rax, 32(%rsi)
	movups	%xmm0, 40(%rsi)
	movups	%xmm0, 56(%rsi)
	movups	%xmm0, 72(%rsi)
	call	list_copy
	movq	%rax, %rdi
	.p2align 4,,10
	.p2align 3
.L367:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L375
.L373:
	movl	8(%rbx), %eax
	cmpl	$1, %eax
	je	.L376
	cmpl	$2, %eax
	je	.L377
	testl	%eax, %eax
	jne	.L367
	movq	(%rbx), %rcx
	movq	%rsi, %r8
	movq	%r12, %rdx
	call	codegen_import
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L373
.L375:
	leaq	-40(%rbp), %rsp
	movq	%r12, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L376:
	movq	(%rbx), %rcx
	movq	%rsi, %rdx
	call	codegen_function
	movq	(%rbx), %rax
	movq	%r13, %rdx
	movq	(%rax), %rbx
	movq	8(%rbx), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L367
	movq	%rbx, 8(%r12)
	jmp	.L367
	.p2align 4,,10
	.p2align 3
.L377:
	movq	(%rbx), %rcx
	movq	%rsi, %rdx
	call	codegen_class
	jmp	.L367
	.section .rdata,"dr"
	.align 32
CSWTCH.22:
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
	.align 8
.LC23:
	.long	0
	.long	-1074790400
	.ident	"GCC: (GNU) 13.2.0"
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
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
