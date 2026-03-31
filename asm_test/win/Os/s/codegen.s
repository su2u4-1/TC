	.file	"D:\\TC\\temp\\codegen.c"
	.text
	.def	find_var_by_symbol;	.scl	3;	.type	32;	.endef
find_var_by_symbol:
	testq	%rcx, %rcx
	je	.L6
	testq	%rdx, %rdx
	je	.L6
.L4:
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L6
	movq	8(%rcx), %rax
	testq	%rax, %rax
	je	.L4
	cmpq	%rdx, (%rax)
	jne	.L4
	ret
.L6:
	xorl	%eax, %eax
.L1:
	ret
	.def	create_instruction;	.scl	3;	.type	32;	.endef
create_instruction:
	pushq	%rbp
	movl	%ecx, %ebp
	movl	$32, %ecx
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	movq	%r8, %rsi
	pushq	%rbx
	movq	%r9, %rbx
	subq	$40, %rsp
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
	movq	%rcx, %rdi
	movl	$40, %ecx
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	subq	$32, %rsp
	call	alloc_memory
	movq	%rdi, (%rax)
	movq	%rax, %rbx
	movq	%rsi, 8(%rax)
	call	create_list
	movq	%rax, 16(%rbx)
	call	create_list
	movq	%rax, 24(%rbx)
	call	create_list
	movq	%rax, 32(%rbx)
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.def	create_block;	.scl	3;	.type	32;	.endef
create_block:
	pushq	%rsi
	movq	%rcx, %rsi
	movl	$16, %ecx
	pushq	%rbx
	subq	$40, %rsp
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rax, %rbx
	call	create_list
	movq	%rax, 8(%rbx)
	addq	$40, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	ret
	.section .rdata,"dr"
.LC0:
	.ascii "[warning] Unsupported type for size lookup: %s\12\0"
	.text
	.def	get_type_size;	.scl	3;	.type	32;	.endef
get_type_size:
	xorl	%eax, %eax
	testq	%rcx, %rcx
	je	.L25
	movq	.refptr.name_int(%rip), %rax
	cmpq	%rcx, (%rax)
	je	.L26
	movq	.refptr.name_float(%rip), %rax
	cmpq	%rcx, (%rax)
	je	.L26
	movq	.refptr.name_string(%rip), %rax
	cmpq	%rcx, (%rax)
	je	.L26
	movq	.refptr.name_bool(%rip), %rdx
	movl	$1, %eax
	cmpq	%rcx, (%rdx)
	je	.L25
	movq	.refptr.name_void(%rip), %rdx
	cmpq	%rcx, (%rdx)
	je	.L25
	cmpl	$0, 32(%rcx)
	jne	.L20
	movq	24(%rcx), %rax
	movq	24(%rax), %rax
	ret
.L20:
	subq	$56, %rsp
	movq	8(%rcx), %r8
	movq	%r8, 40(%rsp)
	call	__getreent
	movq	40(%rsp), %r8
	leaq	.LC0(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	movl	$8, %eax
	addq	$56, %rsp
	ret
.L26:
	movl	$8, %eax
	ret
.L25:
	ret
	.def	create_arg;	.scl	3;	.type	32;	.endef
create_arg:
	pushq	%rsi
	movl	%ecx, %esi
	movl	$24, %ecx
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$40, %rsp
	call	alloc_memory
	xorl	%ecx, %ecx
	movl	%esi, 16(%rax)
	decl	%esi
	movq	%rcx, 8(%rax)
	cmpl	$6, %esi
	ja	.L30
	leaq	.L31(%rip), %rcx
	movslq	(%rcx,%rsi,4), %rdx
	addq	%rcx, %rdx
	jmp	*%rdx
	.section .rdata,"dr"
	.align 4
.L31:
	.long	.L37-.L31
	.long	.L36-.L31
	.long	.L35-.L31
	.long	.L34-.L31
	.long	.L33-.L31
	.long	.L32-.L31
	.long	.L30-.L31
	.text
.L37:
	movq	(%rbx), %rdx
	movq	%rdx, (%rax)
	movq	.refptr.name_int(%rip), %rdx
	jmp	.L41
.L36:
	movsd	(%rbx), %xmm0
	movq	.refptr.name_float(%rip), %rdx
	movsd	%xmm0, (%rax)
	jmp	.L41
.L35:
	movq	%rbx, (%rax)
	movq	.refptr.name_string(%rip), %rdx
	jmp	.L41
.L34:
	movb	(%rbx), %dl
	movb	%dl, (%rax)
	movq	.refptr.name_bool(%rip), %rdx
	jmp	.L41
.L33:
	xorl	%edx, %edx
	movq	%rdx, (%rax)
	movq	.refptr.name_void(%rip), %rdx
.L41:
	movq	(%rdx), %rdx
	jmp	.L40
.L32:
	movq	%rbx, (%rax)
	jmp	.L38
.L30:
	movq	%rbx, (%rax)
	movq	16(%rbx), %rdx
.L40:
	movq	%rdx, 8(%rax)
.L38:
	movb	$0, 20(%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
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
	movq	%rdx, %rbp
	pushq	%rdi
	pushq	%rsi
	movq	%r9, %rsi
	pushq	%rbx
	movq	%rcx, %rbx
	movl	$24, %ecx
	subq	$40, %rsp
	movl	%r8d, 96(%rsp)
	call	alloc_memory
	movl	96(%rsp), %r8d
	movq	%rbx, (%rax)
	movq	%rax, %rdi
	cmpl	$112, %r8d
	je	.L43
	ja	.L44
	cmpl	$98, %r8d
	je	.L45
	cmpl	$102, %r8d
	je	.L46
	cmpl	$97, %r8d
	je	.L47
	jmp	.L54
.L44:
	cmpl	$116, %r8d
	je	.L49
	cmpl	$118, %r8d
	je	.L50
.L54:
	orq	$-1, %rbx
	jmp	.L48
.L47:
	movq	40(%rsi), %rbx
	leaq	1(%rbx), %rax
	movq	%rax, 40(%rsi)
	jmp	.L48
.L43:
	movq	48(%rsi), %rbx
	leaq	1(%rbx), %rax
	movq	%rax, 48(%rsi)
	jmp	.L48
.L50:
	movq	56(%rsi), %rbx
	leaq	1(%rbx), %rax
	movq	%rax, 56(%rsi)
	jmp	.L48
.L49:
	movq	64(%rsi), %rbx
	leaq	1(%rbx), %rax
	movq	%rax, 64(%rsi)
	jmp	.L48
.L45:
	movq	72(%rsi), %rbx
	leaq	1(%rbx), %rax
	movq	%rax, 72(%rsi)
	jmp	.L48
.L46:
	movq	80(%rsi), %rbx
	leaq	1(%rbx), %rax
	movq	%rax, 80(%rsi)
.L48:
	leaq	.LC1(%rip), %rcx
	movl	$32, %edx
	movl	%r8d, 96(%rsp)
	call	create_string
	cmpq	$-1, %rbx
	movl	96(%rsp), %r8d
	movq	%rax, 8(%rdi)
	movq	%rax, %rcx
	jne	.L51
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L52
.L51:
	movq	%rbx, %r9
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L52:
	movq	%rbp, 16(%rdi)
	addq	$40, %rsp
	movq	%rdi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.def	emit_param_instruction;	.scl	3;	.type	32;	.endef
emit_param_instruction:
	testq	%rcx, %rcx
	je	.L58
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$48, %rsp
	testq	%rdx, %rdx
	je	.L55
	movq	%rcx, %r8
	movq	8(%rcx), %rcx
	movq	%r8, 64(%rsp)
	call	get_type_size
	leaq	40(%rsp), %rdx
	movl	$1, %ecx
	movq	%rax, 40(%rsp)
	call	create_arg
	movq	64(%rsp), %r8
	movl	$17, %ecx
	xorl	%r9d, %r9d
	movq	%rax, %rdx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L55:
	addq	$48, %rsp
	popq	%rbx
	ret
.L58:
	ret
	.def	load_rvalue;	.scl	3;	.type	32;	.endef
load_rvalue:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$32, %rsp
	testq	%rcx, %rcx
	je	.L62
	cmpb	$0, 20(%rcx)
	je	.L62
	movq	%rdx, %rdi
	movq	8(%rcx), %rdx
	movl	$116, %r8d
	xorl	%ecx, %ecx
	movq	%rdi, %r9
	call	create_var
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	call	create_arg
	movq	%rbx, %r8
	xorl	%r9d, %r9d
	movl	$23, %ecx
	movq	%rax, %rdx
	movq	%rax, %rsi
	call	create_instruction
	movq	%rsi, %rbx
	movq	%rax, %rdx
	movq	16(%rdi), %rax
	movq	8(%rax), %rcx
	call	list_append
.L62:
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.section .rdata,"dr"
.LC4:
	.ascii "<unknown>\0"
.LC5:
	.ascii "[warning] Invalid attribute access\12\0"
.LC6:
	.ascii "[warning] Attribute '%s' not found in class '%s', fallback index %zu\12\0"
.LC7:
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
	subq	$64, %rsp
	testq	%rcx, %rcx
	je	.L88
	movq	%rdx, %rsi
	testq	%rdx, %rdx
	jne	.L68
.L88:
	call	__getreent
	leaq	.LC5(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	jmp	.L70
.L68:
	movq	%r8, %rdx
	movq	%r8, %rdi
	call	load_rvalue
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L71
.L70:
	xorl	%esi, %esi
	jmp	.L67
.L71:
	movq	8(%rax), %rbp
	testq	%rbp, %rbp
	je	.L73
	cmpl	$0, 32(%rbp)
	je	.L73
	xorl	%ebp, %ebp
.L73:
	movq	(%rdi), %rax
	movq	(%rax), %rcx
	call	list_copy
	movq	%rax, %rbx
.L74:
	movq	%rbx, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L77
	cmpq	%rbp, 8(%rax)
	jne	.L74
	movq	(%rax), %rcx
	testq	%rcx, %rcx
	jne	.L78
.L77:
	movq	(%rsi), %rdx
	movq	%rdi, %r9
	movl	$97, %r8d
	movq	%rsi, %rcx
	call	create_var
	movq	%rax, %rbx
	jmp	.L79
.L78:
	call	list_copy
	xorl	%r13d, %r13d
	movq	%rax, %rbx
.L80:
	movq	%rbx, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L94
	cmpq	(%rax), %rsi
	je	.L86
	incq	%r13
	jmp	.L80
.L94:
	xorl	%r14d, %r14d
	jmp	.L81
.L86:
	movb	$1, %r14b
.L81:
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %edx
	leaq	.LC1(%rip), %rcx
	movq	%rsi, (%rax)
	movq	%rax, %rbx
	movq	(%rsi), %rax
	movq	%rax, 16(%rbx)
	call	create_string
	movq	%rax, 8(%rbx)
	testb	%r14b, %r14b
	jne	.L83
	leaq	.LC4(%rip), %r9
	testq	%rbp, %rbp
	je	.L84
	movq	8(%rbp), %r9
.L84:
	movq	8(%rsi), %r8
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	__getreent
	movq	56(%rsp), %r9
	movq	48(%rsp), %r8
	leaq	.LC6(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%r13, 32(%rsp)
	call	fprintf
.L83:
	movq	8(%rbx), %rcx
	movq	%r13, %r8
	leaq	.LC7(%rip), %rdx
	call	sprintf
.L79:
	movq	(%rsi), %rdx
	movq	%rdi, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	call	create_var
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	call	create_arg
	movq	%rbx, %rdx
	xorl	%ecx, %ecx
	movq	%rax, %rsi
	call	create_arg
	movq	%r12, %r8
	movq	%rsi, %rdx
	movl	$15, %ecx
	movq	%rax, %r9
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rdi), %rax
	movq	8(%rax), %rcx
	call	list_append
	movb	$1, 20(%rsi)
.L67:
	addq	$64, %rsp
	movq	%rsi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.section .rdata,"dr"
.LC8:
	.ascii "[warning] Unsupported symbol kind for import: %d\12\0"
	.text
	.globl	codegen_import
	.def	codegen_import;	.scl	2;	.type	32;	.endef
codegen_import:
	pushq	%rdi
	movq	%r8, %r9
	movq	%rdx, %rdi
	movl	$118, %r8d
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	(%rcx), %rsi
	movl	32(%rsi), %ebx
	cmpl	$3, %ebx
	je	.L100
	leal	-1(%rbx), %eax
	cmpl	$1, %eax
	ja	.L97
	movl	$102, %r8d
.L100:
	movq	(%rsi), %rdx
	movq	%rsi, %rcx
	call	create_var
	movq	16(%rdi), %rcx
	movq	%rax, %rdx
.L101:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	list_append
.L97:
	testl	%ebx, %ebx
	jne	.L98
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, %rbx
	call	create_list
	movq	%rsi, 8(%rbx)
	movq	(%rdi), %rcx
	movq	%rbx, %rdx
	movq	%rax, (%rbx)
	xorl	%eax, %eax
	movq	%rax, 16(%rbx)
	jmp	.L101
.L98:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC8(%rip), %rdx
	movq	24(%rax), %rcx
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	fprintf
	.section .rdata,"dr"
.LC9:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
.LC10:
	.ascii "[warning] Unsupported variable type for codegen_variable: %d\12\0"
	.text
	.globl	codegen_variable
	.def	codegen_variable;	.scl	2;	.type	32;	.endef
codegen_variable:
	pushq	%rbp
	movq	%rdx, %r9
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movl	%r8d, %ebx
	subq	$40, %rsp
	movq	(%rdi), %rdx
	movq	8(%rcx), %rcx
	call	create_var
	movq	%rax, %rdx
	cmpl	$112, %ebx
	je	.L103
	ja	.L104
	cmpl	$97, %ebx
	je	.L105
	cmpl	$102, %ebx
	jne	.L107
	movq	(%rsi), %rax
	jmp	.L113
.L104:
	cmpl	$116, %ebx
	je	.L109
	cmpl	$118, %ebx
	je	.L109
	jmp	.L107
.L103:
	movq	8(%rsi), %rax
	jmp	.L113
.L109:
	movq	8(%rsi), %rax
	movq	24(%rax), %rcx
.L112:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	list_append
.L113:
	movq	16(%rax), %rcx
	jmp	.L112
.L105:
	movq	(%rsi), %rax
	movq	(%rax), %rcx
	call	list_pop_back
	movq	%rax, %rbx
	movq	(%rsi), %rax
	movq	%rbx, %rdx
	movq	(%rax), %rcx
	call	list_append
	movq	(%rdi), %rbp
	movl	$24, %ecx
	movq	8(%rdi), %rdi
	call	alloc_memory
	movq	%rdi, (%rax)
	movq	%rax, %rsi
	movq	%rbp, %rcx
	movq	%rbp, 8(%rax)
	movq	16(%rbx), %rax
	movq	%rax, 16(%rsi)
	call	get_type_size
	movq	(%rbx), %rcx
	addq	%rax, 16(%rbx)
	movq	%rsi, %rdx
	testq	%rcx, %rcx
	jne	.L112
	call	__getreent
	leaq	.LC9(%rip), %rcx
	movq	24(%rax), %rdx
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	fputs
.L107:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC10(%rip), %rdx
	movq	24(%rax), %rcx
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	fprintf
	.section .rdata,"dr"
.LC11:
	.ascii "[warning] Invalid variable access input\12\0"
.LC12:
	.ascii "[warning] Variable access name is NULL\12\0"
.LC13:
	.ascii "[warning] Unresolved variable access for '%s', creating fallback local\12\0"
.LC14:
	.ascii "[warning] Invalid get-attribute access\12\0"
.LC15:
	.ascii "[warning] Failed to generate object for get-attribute access\12\0"
.LC16:
	.ascii "[warning] Invalid get-sequence access\12\0"
.LC17:
	.ascii "[warning] Failed to generate sequence/index for get-sequence access\12\0"
.LC18:
	.ascii "[warning] Invalid function call without callee\12\0"
.LC19:
	.ascii "[warning] Failed to generate callee for function call\12\0"
.LC20:
	.ascii "[warning] Unsupported callee in function call\12\0"
.LC21:
	.ascii "[warning] Failed to generate function call argument\12\0"
.LC22:
	.ascii "[warning] Unsupported variable access type for codegen_variable_access: %d\12\0"
	.text
	.globl	codegen_variable_access
	.def	codegen_variable_access;	.scl	2;	.type	32;	.endef
codegen_variable_access:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$72, %rsp
	testq	%rcx, %rcx
	je	.L160
	movq	%rdx, %rbx
	testq	%rdx, %rdx
	jne	.L115
.L160:
	call	__getreent
	leaq	.LC11(%rip), %rcx
	movq	24(%rax), %rdx
	jmp	.L203
.L115:
	movl	16(%rcx), %r8d
	movq	%rcx, %rsi
	testl	%r8d, %r8d
	jne	.L118
	movq	8(%rcx), %rsi
	testq	%rsi, %rsi
	jne	.L119
	call	__getreent
	leaq	.LC12(%rip), %rcx
	movq	24(%rax), %rdx
	jmp	.L203
.L119:
	movq	8(%rdx), %r8
	testq	%r8, %r8
	je	.L121
	movq	16(%r8), %rcx
	movq	%rsi, %rdx
	call	find_var_by_symbol
	testq	%rax, %rax
	jne	.L207
	movq	24(%r8), %rcx
	call	find_var_by_symbol
	testq	%rax, %rax
	jne	.L207
.L121:
	movq	(%rbx), %rax
	movq	%rsi, %rdx
	movq	16(%rax), %rcx
	call	find_var_by_symbol
	testq	%rax, %rax
	jne	.L207
	cmpl	$2, 32(%rsi)
	ja	.L124
.L206:
	movq	(%rsi), %rdx
	movq	%rsi, %rcx
	movq	%rbx, %r9
	movl	$102, %r8d
	call	create_var
	movl	$7, %ecx
	movq	%rax, %rdx
.L205:
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	create_arg
.L124:
	testq	%r8, %r8
	je	.L125
	movq	16(%r8), %rax
	movq	(%rax), %rbp
.L126:
	testq	%rbp, %rbp
	je	.L125
	movq	8(%rbp), %rdi
	testq	%rdi, %rdi
	jne	.L127
.L128:
	movq	0(%rbp), %rbp
	jmp	.L126
.L127:
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L128
	movq	8(%rax), %rcx
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L128
	movq	16(%rdi), %rax
	testq	%rax, %rax
	je	.L125
	cmpl	$0, 32(%rax)
	je	.L208
.L125:
	movq	8(%rsi), %r8
	movq	%r8, 40(%rsp)
	call	__getreent
	movq	40(%rsp), %r8
	leaq	.LC13(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	movq	(%rsi), %rdx
	movq	%rbx, %r9
	movq	%rsi, %rcx
	movl	$118, %r8d
	call	create_var
.L207:
	movq	%rax, %rdx
	xorl	%ecx, %ecx
	jmp	.L205
.L118:
	cmpl	$2, %r8d
	jne	.L131
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L132
	movq	8(%rsi), %rsi
	testq	%rsi, %rsi
	jne	.L133
.L132:
	call	__getreent
	leaq	.LC14(%rip), %rcx
	movq	24(%rax), %rdx
	jmp	.L203
.L133:
	movl	32(%rsi), %eax
	decl	%eax
	cmpl	$1, %eax
	jbe	.L206
	call	codegen_variable_access
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L135
	call	__getreent
	leaq	.LC15(%rip), %rcx
	movq	24(%rax), %rdx
	jmp	.L203
.L208:
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	cmpq	%rax, 24(%rsi)
	jne	.L125
	xorl	%ecx, %ecx
	movq	%rdi, %rdx
	call	create_arg
	movq	%rax, %rcx
.L135:
	addq	$72, %rsp
	movq	%rbx, %r8
	movq	%rsi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	emit_attribute_access
.L131:
	cmpl	$3, %r8d
	jne	.L136
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L137
	cmpq	$0, 8(%rsi)
	jne	.L138
.L137:
	call	__getreent
	leaq	.LC16(%rip), %rcx
	movq	24(%rax), %rdx
	jmp	.L203
.L138:
	call	codegen_variable_access
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	8(%rsi), %rcx
	movq	%rbx, %rdx
	movq	%rax, %rdi
	call	codegen_expression
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rax, %rbp
	testq	%rdi, %rdi
	je	.L161
	testq	%rax, %rax
	jne	.L139
.L161:
	call	__getreent
	leaq	.LC17(%rip), %rcx
	movq	24(%rax), %rdx
	jmp	.L203
.L139:
	movq	.refptr.name_int(%rip), %rax
	movq	.refptr.name_float(%rip), %rcx
	movq	8(%rdi), %rdx
	movq	(%rax), %rax
	cmpq	(%rcx), %rdx
	je	.L141
	movq	.refptr.name_bool(%rip), %rcx
	cmpq	(%rcx), %rdx
	je	.L141
	movq	.refptr.name_string(%rip), %rcx
	cmpq	(%rcx), %rdx
	je	.L141
	movq	%rax, %rdx
.L141:
	movq	%rbx, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	call	create_var
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	call	create_arg
	movq	%rbp, %r9
	movq	%rdi, %r8
	movl	$16, %ecx
	movq	%rax, %rdx
	movq	%rax, %rsi
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movb	$1, 20(%rsi)
	jmp	.L114
.L136:
	cmpl	$1, %r8d
	jne	.L142
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	jne	.L143
	call	__getreent
	leaq	.LC18(%rip), %rcx
	movq	24(%rax), %rdx
	jmp	.L203
.L143:
	cmpl	$2, 16(%rcx)
	jne	.L145
	movq	8(%rcx), %rdi
	testq	%rdi, %rdi
	je	.L145
	movl	32(%rdi), %eax
	decl	%eax
	cmpl	$1, %eax
	ja	.L145
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L159
	cmpl	$0, 16(%rcx)
	jne	.L147
	movq	8(%rcx), %rax
	testq	%rax, %rax
	je	.L147
	cmpl	$0, 32(%rax)
	je	.L159
.L147:
	movq	%rbx, %rdx
	call	codegen_variable_access
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L159
	movq	%rbx, %rdx
	movl	$1, %ebp
	call	emit_param_instruction
	jmp	.L149
.L145:
	movq	%rbx, %rdx
	call	codegen_variable_access
	testq	%rax, %rax
	jne	.L150
	call	__getreent
	leaq	.LC19(%rip), %rcx
	movq	24(%rax), %rdx
.L203:
	call	fputs
.L204:
	xorl	%esi, %esi
	jmp	.L114
.L150:
	movl	16(%rax), %edx
	cmpl	$7, %edx
	jne	.L152
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L153
	movq	(%rax), %rdi
	testq	%rdi, %rdi
	jne	.L159
	jmp	.L153
.L152:
	testl	%edx, %edx
	jne	.L153
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L153
	movq	(%rax), %rdi
	testq	%rdi, %rdi
	je	.L153
	movl	32(%rdi), %eax
	decl	%eax
	cmpl	$1, %eax
	jbe	.L159
.L153:
	call	__getreent
	leaq	.LC20(%rip), %rcx
	movq	24(%rax), %rdx
	jmp	.L203
.L159:
	xorl	%ebp, %ebp
.L149:
	movq	8(%rsi), %rcx
	call	list_copy
	movq	%rax, %rsi
.L154:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L209
	movq	%rbx, %rdx
	call	codegen_expression
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L155
	call	__getreent
	leaq	.LC21(%rip), %rcx
	movq	24(%rax), %rdx
	jmp	.L203
.L155:
	movq	%rbx, %rdx
	incq	%rbp
	call	emit_param_instruction
	jmp	.L154
.L209:
	xorl	%edx, %edx
	movl	$5, %ecx
	call	create_arg
	movq	(%rdi), %rdx
	movq	%rax, %rsi
	testq	%rdx, %rdx
	je	.L157
	movq	.refptr.name_void(%rip), %rax
	cmpq	(%rax), %rdx
	je	.L157
	movq	%rbx, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	call	create_var
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	call	create_arg
	movq	%rax, %rsi
.L157:
	movq	(%rdi), %rdx
	movq	%rbx, %r9
	movl	$102, %r8d
	movq	%rdi, %rcx
	movq	%rbp, 56(%rsp)
	call	create_var
	movl	$7, %ecx
	movq	%rax, %rdx
	call	create_arg
	leaq	56(%rsp), %rdx
	movl	$1, %ecx
	movq	%rax, 40(%rsp)
	call	create_arg
	movq	40(%rsp), %r8
	movq	%rsi, %rdx
	movl	$22, %ecx
	movq	%rax, %r9
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L114
.L142:
	movl	%r8d, 40(%rsp)
	call	__getreent
	movl	40(%rsp), %r8d
	leaq	.LC22(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L204
.L114:
	addq	$72, %rsp
	movq	%rsi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC24:
	.ascii "[warning] Unsupported type for negation: %s\12\0"
.LC25:
	.ascii "[warning] Unsupported primary type for codegen_primary: %d\12\0"
	.text
	.globl	codegen_primary
	.def	codegen_primary;	.scl	2;	.type	32;	.endef
codegen_primary:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$64, %rsp
	movl	8(%rcx), %r8d
	cmpl	$8, %r8d
	ja	.L211
	movq	%rdx, %rsi
	leaq	.L213(%rip), %rdx
	movslq	(%rdx,%r8,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L213:
	.long	.L221-.L213
	.long	.L220-.L213
	.long	.L219-.L213
	.long	.L218-.L213
	.long	.L217-.L213
	.long	.L216-.L213
	.long	.L215-.L213
	.long	.L214-.L213
	.long	.L212-.L213
	.text
.L221:
	movq	(%rcx), %rcx
	xorl	%edx, %edx
	movl	$10, %r8d
	call	strtoll
	leaq	56(%rsp), %rdx
	movl	$1, %ecx
	movq	%rax, 56(%rsp)
	jmp	.L230
.L220:
	movq	(%rcx), %rcx
	xorl	%edx, %edx
	call	strtod
	leaq	56(%rsp), %rdx
	movl	$2, %ecx
	movsd	%xmm0, 56(%rsp)
.L230:
	call	create_arg
	movq	%rax, %rbx
	jmp	.L210
.L219:
	movq	(%rcx), %rdx
	addq	$64, %rsp
	movl	$3, %ecx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	create_arg
.L218:
	movb	$1, 56(%rsp)
	jmp	.L231
.L217:
	movb	$0, 56(%rsp)
.L231:
	leaq	56(%rsp), %rdx
	movl	$4, %ecx
	jmp	.L230
.L216:
	movq	(%rcx), %rcx
	addq	$64, %rsp
	movq	%rsi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	codegen_expression
.L215:
	movq	(%rcx), %rcx
	movq	%rsi, %rdx
	call	codegen_primary
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rsi, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	movq	%rax, %rdi
	movq	.refptr.name_bool(%rip), %rax
	movq	(%rax), %rdx
	call	create_var
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	call	create_arg
	xorl	%r9d, %r9d
	movq	%rdi, %r8
	movl	$13, %ecx
	movq	%rax, %rbx
	movq	%rax, %rdx
	jmp	.L228
.L214:
	movq	(%rcx), %rcx
	movq	%rsi, %rdx
	call	codegen_primary
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rsi, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	movq	8(%rax), %rdx
	movq	%rax, %rdi
	call	create_var
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	call	create_arg
	movq	.refptr.name_int(%rip), %rdx
	movq	%rax, %rbx
	xorl	%eax, %eax
	movq	%rax, 48(%rsp)
	movq	.LC23(%rip), %rax
	movq	%rax, 56(%rsp)
	movq	8(%rdi), %rax
	cmpq	(%rdx), %rax
	jne	.L223
	leaq	48(%rsp), %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rdi, %r9
	movq	%rbx, %rdx
	movl	$1, %ecx
	movq	%rax, %r8
	jmp	.L228
.L223:
	movq	.refptr.name_float(%rip), %rdx
	cmpq	(%rdx), %rax
	jne	.L225
	leaq	56(%rsp), %rdx
	movl	$2, %ecx
	call	create_arg
	movq	%rdi, %r9
	movq	%rbx, %rdx
	movl	$2, %ecx
	movq	%rax, %r8
.L228:
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L210
.L225:
	movq	8(%rax), %r8
	movq	%r8, 40(%rsp)
	call	__getreent
	movq	40(%rsp), %r8
	leaq	.LC24(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L229
.L212:
	movq	(%rcx), %rcx
	addq	$64, %rsp
	movq	%rsi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	codegen_variable_access
.L211:
	movl	%r8d, 40(%rsp)
	call	__getreent
	movl	40(%rsp), %r8d
	leaq	.LC25(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L229:
	xorl	%ebx, %ebx
.L210:
	addq	$64, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.section .rdata,"dr"
.LC26:
	.ascii "[warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.globl	codegen_expression
	.def	codegen_expression;	.scl	2;	.type	32;	.endef
codegen_expression:
	pushq	%r12
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$32, %rsp
	cmpl	$19, 24(%rcx)
	jne	.L233
	movq	8(%rcx), %rcx
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	codegen_primary
.L233:
	movq	16(%rcx), %rcx
	movl	$25, %r12d
	call	codegen_expression
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rax, %rdi
	movl	24(%rbp), %eax
	cmpl	$18, %eax
	ja	.L234
	leaq	CSWTCH.22(%rip), %rdx
	movzbl	(%rdx,%rax), %r12d
.L234:
	movq	0(%rbp), %rcx
	movq	%rbx, %rdx
	call	codegen_expression
	movq	%rax, %rsi
	movl	24(%rbp), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L235
	cmpl	$14, %r12d
	je	.L236
	movq	8(%rsi), %rdx
	movq	%rbx, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	call	create_var
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	call	create_arg
	movq	%rbx, %rdx
	movq	%rsi, %rcx
	movq	%rax, %rbp
	call	load_rvalue
	movq	%rdi, %r9
	movq	%rbp, %rdx
	movl	%r12d, %ecx
	movq	%rax, %r8
	movq	%rbp, %rdi
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L236:
	cmpl	$0, 16(%rsi)
	je	.L237
	call	__getreent
	leaq	.LC26(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
.L237:
	xorl	%r9d, %r9d
	movq	%rsi, %rdx
	movq	%rdi, %r8
	movl	$14, %ecx
	call	create_instruction
	cmpb	$0, 20(%rsi)
	movq	%rax, %rdx
	je	.L238
	movq	%rsi, %rdx
	xorl	%r9d, %r9d
	movq	%rdi, %r8
	movl	$24, %ecx
	call	create_instruction
	movq	%rax, %rdx
	jmp	.L238
.L235:
	movq	8(%rsi), %rdx
	movq	%rbx, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	call	create_var
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	call	create_arg
	movq	%rbx, %rdx
	movq	%rsi, %rcx
	movq	%rax, %rbp
	call	load_rvalue
	movq	%rdi, %r9
	movq	%rbp, %rdx
	movl	%r12d, %ecx
	movq	%rax, %r8
	movq	%rbp, %rdi
	call	create_instruction
	movq	%rax, %rdx
.L238:
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	addq	$32, %rsp
	movq	%rdi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.globl	codegen_if
	.def	codegen_if;	.scl	2;	.type	32;	.endef
codegen_if:
	pushq	%r15
	movq	%rdx, %r9
	movl	$98, %r8d
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	movq	%rcx, %rdi
	xorl	%ecx, %ecx
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	xorl	%edx, %edx
	subq	$56, %rsp
	call	create_var
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rbx, %r9
	movl	$98, %r8d
	movq	%rax, %r12
	call	create_var
	movq	16(%rdi), %rcx
	movq	%rax, %rsi
	call	list_is_empty
	testb	%al, %al
	jne	.L245
.L247:
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	create_var
	movq	%rax, %rbp
	jmp	.L246
.L245:
	movq	24(%rdi), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L247
	movq	%rsi, %rbp
.L246:
	movq	%rbp, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	(%rdi), %rcx
	movq	%rbx, %rdx
	movq	%rax, 32(%rsp)
	call	codegen_expression
	movq	%rsi, %rdx
	movl	$6, %ecx
	movq	%rax, %r13
	call	create_arg
	movq	%r12, %rdx
	movl	$6, %ecx
	movq	%rax, 40(%rsp)
	call	create_arg
	movq	40(%rsp), %r9
	movq	%r13, %rdx
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%r12, %rcx
	call	create_block
	movq	%rax, %r12
	movq	8(%rbx), %rax
	movq	%r12, %rdx
	movq	32(%rax), %rcx
	call	list_append
	movq	%r12, 16(%rbx)
	movq	8(%rdi), %rcx
	call	list_copy
	movq	%rax, %r12
.L248:
	movq	%r12, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L268
	movq	%rbx, %rdx
	call	codegen_statement
	jmp	.L248
.L268:
	movq	32(%rsp), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	16(%rdi), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L250
	movq	16(%rdi), %rcx
	call	list_copy
	movq	%rax, %r13
.L251:
	movq	%r13, %rcx
	call	list_pop
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L250
	movq	%rsi, %rcx
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	%rsi, %rdx
	movq	32(%rax), %rcx
	call	list_append
	movq	%rsi, 16(%rbx)
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rbx, %r9
	movl	$98, %r8d
	call	create_var
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rbx, %r9
	movl	$98, %r8d
	movq	%rax, %r14
	call	create_var
	movq	(%r12), %rcx
	movq	%rbx, %rdx
	movq	%rax, %rsi
	call	codegen_expression
	movq	%r13, %rcx
	movq	%rax, %r15
	call	list_is_empty
	testb	%al, %al
	je	.L253
	movq	24(%rdi), %rcx
	call	list_is_empty
	testb	%al, %al
	cmovne	%rbp, %rsi
.L253:
	movq	%rsi, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%r14, %rdx
	movl	$6, %ecx
	movq	%rax, 40(%rsp)
	call	create_arg
	movq	40(%rsp), %r9
	movq	%r15, %rdx
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%r14, %rcx
	call	create_block
	movq	%rax, %r14
	movq	8(%rbx), %rax
	movq	%r14, %rdx
	movq	32(%rax), %rcx
	call	list_append
	movq	%r14, 16(%rbx)
	movq	8(%r12), %rcx
	call	list_copy
	movq	%rax, %r12
.L254:
	movq	%r12, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L269
	movq	%rbx, %rdx
	call	codegen_statement
	jmp	.L254
.L269:
	movq	32(%rsp), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L251
.L250:
	movq	24(%rdi), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L257
	movq	%rsi, %rcx
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	%rsi, %rdx
	movq	32(%rax), %rcx
	call	list_append
	movq	%rsi, 16(%rbx)
	movq	24(%rdi), %rcx
	call	list_copy
	movq	%rax, %rsi
.L258:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L270
	movq	%rbx, %rdx
	call	codegen_statement
	jmp	.L258
.L270:
	movq	32(%rsp), %rdx
	movl	$20, %ecx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L257:
	movq	%rbp, %rcx
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	%rsi, %rdx
	movq	32(%rax), %rcx
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
	.section .rdata,"dr"
.LC27:
	.ascii "[warning] 'break' statement used outside of loop\12\0"
.LC28:
	.ascii "[warning] 'continue' statement used outside of loop\12\0"
.LC29:
	.ascii "[warning] Unsupported statement type for codegen_statement: %d\12\0"
	.text
	.globl	codegen_statement
	.def	codegen_statement;	.scl	2;	.type	32;	.endef
codegen_statement:
	pushq	%rbx
	subq	$48, %rsp
	movl	8(%rcx), %r8d
	cmpl	$7, %r8d
	ja	.L272
	movq	%rdx, %rbx
	leaq	.L274(%rip), %rdx
	movslq	(%rdx,%r8,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L274:
	.long	.L281-.L274
	.long	.L280-.L274
	.long	.L279-.L274
	.long	.L278-.L274
	.long	.L277-.L274
	.long	.L276-.L274
	.long	.L275-.L274
	.long	.L273-.L274
	.text
.L281:
	movq	(%rcx), %rcx
	addq	$48, %rsp
	movq	%rbx, %rdx
	popq	%rbx
	jmp	codegen_expression
.L280:
	movq	(%rcx), %rcx
	addq	$48, %rsp
	movq	%rbx, %rdx
	movl	$118, %r8d
	popq	%rbx
	jmp	codegen_variable
.L279:
	movq	(%rcx), %rcx
	addq	$48, %rsp
	movq	%rbx, %rdx
	popq	%rbx
	jmp	codegen_if
.L278:
	movq	(%rcx), %rcx
	addq	$48, %rsp
	movq	%rbx, %rdx
	popq	%rbx
	jmp	codegen_while
.L277:
	movq	(%rcx), %rcx
	addq	$48, %rsp
	movq	%rbx, %rdx
	popq	%rbx
	jmp	codegen_for
.L276:
	movq	(%rcx), %rcx
	movq	%rbx, %rdx
	call	codegen_expression
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$21, %ecx
	movq	%rax, %rdx
	jmp	.L291
.L275:
	movq	24(%rbx), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L282
	movq	24(%rbx), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	testq	%rdx, %rdx
	je	.L282
.L293:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$20, %ecx
.L291:
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	addq	$48, %rsp
	popq	%rbx
	jmp	list_append
.L282:
	call	__getreent
	leaq	.LC27(%rip), %rcx
	movq	24(%rax), %rdx
	jmp	.L292
.L273:
	movq	32(%rbx), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L283
	movq	32(%rbx), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	testq	%rdx, %rdx
	jne	.L293
.L283:
	call	__getreent
	leaq	.LC28(%rip), %rcx
	movq	24(%rax), %rdx
.L292:
	addq	$48, %rsp
	popq	%rbx
	jmp	fputs
.L272:
	movl	%r8d, 44(%rsp)
	call	__getreent
	movl	44(%rsp), %r8d
	leaq	.LC29(%rip), %rdx
	movq	24(%rax), %rcx
	addq	$48, %rsp
	popq	%rbx
	jmp	fprintf
	.globl	codegen_for
	.def	codegen_for;	.scl	2;	.type	32;	.endef
codegen_for:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$48, %rsp
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L295
	movl	$118, %r8d
	call	codegen_variable
.L295:
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
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rbx, %r9
	movl	$98, %r8d
	movq	%rax, %rdi
	call	create_var
	cmpq	$0, 8(%rsi)
	movq	%rax, %r12
	je	.L296
	movq	%rbp, %rdx
	movl	$6, %ecx
	call	create_arg
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$20, %ecx
	movq	%rax, %rdx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%rbp, %rcx
	call	create_block
	movq	%rax, %r13
	movq	8(%rbx), %rax
	movq	%r13, %rdx
	movq	32(%rax), %rcx
	call	list_append
	movq	%r13, 16(%rbx)
	movq	8(%rsi), %rcx
	movq	%rbx, %rdx
	call	codegen_expression
	movq	%r12, %rdx
	movl	$6, %ecx
	movq	%rax, %r13
	call	create_arg
	movq	%rdi, %rdx
	movl	$6, %ecx
	movq	%rax, 40(%rsp)
	call	create_arg
	movq	40(%rsp), %r9
	movq	%r13, %rdx
	movl	$19, %ecx
	movq	%rax, %r8
	jmp	.L309
.L296:
	movq	%rdi, %rdx
	movl	$6, %ecx
	call	create_arg
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$20, %ecx
	movq	%rax, %rdx
.L309:
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%rdi, %rcx
	call	create_block
	movq	%rax, %r13
	movq	8(%rbx), %rax
	movq	%r13, %rdx
	movq	32(%rax), %rcx
	call	list_append
	movq	%r13, 16(%rbx)
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rbx, %r9
	movl	$98, %r8d
	call	create_var
	cmpq	$0, 16(%rsi)
	movq	%rax, %r13
	movq	%rax, %rdx
	jne	.L310
	cmpq	$0, 8(%rsi)
	movq	%rbp, %rdx
	jne	.L310
	movq	%rdi, %rdx
.L310:
	movl	$6, %ecx
	call	create_arg
	movq	32(%rbx), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	%r12, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	24(%rbx), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	24(%rsi), %rcx
	call	list_copy
	movq	%rax, %r14
.L301:
	movq	%r14, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L311
	movq	%rbx, %rdx
	call	codegen_statement
	jmp	.L301
.L311:
	movq	32(%rbx), %rcx
	call	list_pop_back
	movq	24(%rbx), %rcx
	call	list_pop_back
	cmpq	$0, 16(%rsi)
	je	.L303
	movq	%r13, %rdx
	movl	$6, %ecx
	call	create_arg
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$20, %ecx
	movq	%rax, %rdx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%r13, %rcx
	call	create_block
	movq	%rax, %r13
	movq	8(%rbx), %rax
	movq	%r13, %rdx
	movq	32(%rax), %rcx
	call	list_append
	movq	%r13, 16(%rbx)
	movq	16(%rsi), %rcx
	movq	%rbx, %rdx
	call	codegen_expression
.L303:
	movq	%rbp, %rdx
	movl	$6, %ecx
	call	create_arg
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$20, %ecx
	movq	%rax, %rdx
	call	create_instruction
	cmpq	$0, 8(%rsi)
	jne	.L304
	movq	%rdi, %rdx
	movl	$6, %ecx
	call	create_arg
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$20, %ecx
	movq	%rax, %rdx
	call	create_instruction
.L304:
	movq	16(%rbx), %rdx
	movq	8(%rdx), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	%r12, %rcx
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	%rsi, %rdx
	movq	32(%rax), %rcx
	call	list_append
	movq	%rsi, 16(%rbx)
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.globl	codegen_while
	.def	codegen_while;	.scl	2;	.type	32;	.endef
codegen_while:
	pushq	%r13
	movq	%rdx, %r9
	movl	$98, %r8d
	pushq	%r12
	pushq	%rbp
	movq	%rcx, %rbp
	xorl	%ecx, %ecx
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	xorl	%edx, %edx
	subq	$56, %rsp
	call	create_var
	movl	$6, %ecx
	movq	%rax, %rdx
	movq	%rax, %rsi
	call	create_arg
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$20, %ecx
	movq	%rax, %rdx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%rsi, %rcx
	call	create_block
	movq	%rax, %rdi
	movq	8(%rbx), %rax
	movq	%rdi, %rdx
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
	movq	%rax, %r12
	call	create_var
	movq	0(%rbp), %rcx
	movq	%rbx, %rdx
	movq	%rax, %rdi
	call	codegen_expression
	movq	%rdi, %rdx
	movl	$6, %ecx
	movq	%rax, %r13
	call	create_arg
	movq	%r12, %rdx
	movl	$6, %ecx
	movq	%rax, 40(%rsp)
	call	create_arg
	movq	40(%rsp), %r9
	movq	%r13, %rdx
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%r12, %rcx
	call	create_block
	movq	%rax, %r12
	movq	8(%rbx), %rax
	movq	%r12, %rdx
	movq	32(%rax), %rcx
	call	list_append
	movq	%r12, 16(%rbx)
	movq	%rsi, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	32(%rbx), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	%rdi, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	24(%rbx), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	8(%rbp), %rcx
	call	list_copy
	movq	%rax, %rbp
.L313:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L316
	movq	%rbx, %rdx
	call	codegen_statement
	jmp	.L313
.L316:
	movq	32(%rbx), %rcx
	call	list_pop_back
	movq	24(%rbx), %rcx
	call	list_pop_back
	movq	%rsi, %rdx
	movl	$6, %ecx
	call	create_arg
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$20, %ecx
	movq	%rax, %rdx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%rdi, %rcx
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	%rsi, %rdx
	movq	32(%rax), %rcx
	call	list_append
	movq	%rsi, 16(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.globl	codegen_function
	.def	codegen_function;	.scl	2;	.type	32;	.endef
codegen_function:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$40, %rsp
	movq	8(%rcx), %rdx
	movq	(%rcx), %rcx
	call	create_subroutine
	movq	%rax, 8(%rbx)
	movq	%rax, %rdi
	movq	(%rbx), %rax
	movq	%rdi, %rdx
	movq	24(%rax), %rcx
	call	list_append
	movq	16(%rsi), %rcx
	call	list_copy
	movq	%rax, %rbp
.L318:
	movq	%rbp, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L323
	movq	8(%rax), %rcx
	movq	(%rax), %rdx
	movq	%rbx, %r9
	movl	$112, %r8d
	call	create_var
	movq	16(%rdi), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L318
.L323:
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	create_var
	movq	%rax, %rcx
	call	create_block
	movq	32(%rdi), %rcx
	movq	%rax, %rbp
	movq	%rax, %rdx
	call	list_append
	movq	%rbp, 16(%rbx)
	movq	24(%rsi), %rcx
	call	list_copy
	movq	%rax, %rsi
.L320:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L324
	movq	%rbx, %rdx
	call	codegen_statement
	jmp	.L320
.L324:
	xorl	%eax, %eax
	movq	%rax, 8(%rbx)
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
	movq	%rcx, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$40, %rsp
	movq	8(%rcx), %rdx
	movq	(%rcx), %rcx
	call	create_subroutine
	movq	%rax, 8(%rbx)
	movq	%rax, %rdi
	movq	(%rbx), %rax
	movq	%rdi, %rdx
	movq	24(%rax), %rcx
	call	list_append
	movq	16(%rsi), %rcx
	call	list_copy
	movq	%rax, %rbp
.L326:
	movq	%rbp, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L331
	movq	8(%rax), %rcx
	movq	(%rax), %rdx
	movq	%rbx, %r9
	movl	$112, %r8d
	call	create_var
	movq	16(%rdi), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L326
.L331:
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	create_var
	movq	%rax, %rcx
	call	create_block
	movq	32(%rdi), %rcx
	movq	%rax, %rbp
	movq	%rax, %rdx
	call	list_append
	movq	%rbp, 16(%rbx)
	movq	24(%rsi), %rcx
	call	list_copy
	movq	%rax, %rsi
.L328:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L332
	movq	%rbx, %rdx
	call	codegen_statement
	jmp	.L328
.L332:
	xorl	%eax, %eax
	movq	%rax, 8(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC30:
	.ascii "[warning] Unsupported class member type for codegen_class: %d\12\0"
	.text
	.globl	codegen_class
	.def	codegen_class;	.scl	2;	.type	32;	.endef
codegen_class:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	subq	$48, %rsp
	movq	8(%rcx), %rcx
	call	list_copy
	movl	$24, %ecx
	movq	(%rdi), %r12
	movq	%rax, %rbp
	call	alloc_memory
	movq	%rax, %rbx
	call	create_list
	movq	%r12, 8(%rbx)
	movq	%rbx, %rdx
	movq	%rax, (%rbx)
	movq	24(%rdi), %rax
	movq	%rax, 16(%rbx)
	movq	(%rsi), %rax
	leaq	.LC30(%rip), %rbx
	movq	(%rax), %rcx
	call	list_append
.L334:
	movq	%rbp, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L342
	movl	8(%rax), %r8d
	testl	%r8d, %r8d
	je	.L335
	cmpl	$1, %r8d
	jne	.L343
	movq	(%rax), %rcx
	movl	$97, %r8d
	movq	%rsi, %rdx
	call	codegen_variable
	jmp	.L334
.L335:
	movq	(%rax), %rcx
	movq	%rsi, %rdx
	call	codegen_method
	jmp	.L334
.L343:
	movl	%r8d, 44(%rsp)
	call	__getreent
	movl	44(%rsp), %r8d
	movq	%rbx, %rdx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L334
.L342:
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.section .rdata,"dr"
.LC31:
	.ascii "main\0"
	.text
	.globl	codegen_code
	.def	codegen_code;	.scl	2;	.type	32;	.endef
codegen_code:
	pushq	%r12
	leaq	.LC31(%rip), %r12
	pushq	%rbp
	pushq	%rdi
	movq	%rcx, %rdi
	movl	$32, %ecx
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	call	alloc_memory
	movq	%rax, %rsi
	call	create_list
	movq	%rax, (%rsi)
	xorl	%eax, %eax
	movq	%rax, 8(%rsi)
	call	create_list
	movq	%rax, 16(%rsi)
	call	create_list
	movl	$88, %ecx
	movq	%rax, 24(%rsi)
	call	alloc_memory
	xorl	%edx, %edx
	movq	%rdx, 8(%rax)
	movq	%rax, %rbx
	movq	%rdx, 16(%rax)
	movq	%rsi, (%rax)
	call	create_list
	movq	%rax, 24(%rbx)
	call	create_list
	xorl	%ecx, %ecx
	movq	%rcx, 40(%rbx)
	movq	%rcx, 48(%rbx)
	movq	%rcx, 56(%rbx)
	movq	%rcx, 64(%rbx)
	movq	%rcx, 72(%rbx)
	movq	%rcx, 80(%rbx)
	movq	(%rdi), %rcx
	movq	%rax, 32(%rbx)
	call	list_copy
	movq	%rax, %rbp
.L345:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L353
	movl	8(%rdi), %eax
	cmpl	$1, %eax
	jne	.L346
	movq	(%rdi), %rcx
	movq	%rbx, %rdx
	call	codegen_function
	movq	(%rdi), %rax
	movq	%r12, %rdx
	movq	(%rax), %rdi
	movq	8(%rdi), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L345
	movq	%rdi, 8(%rsi)
	jmp	.L345
.L346:
	cmpl	$2, %eax
	jne	.L349
	movq	(%rdi), %rcx
	movq	%rbx, %rdx
	call	codegen_class
	jmp	.L345
.L349:
	testl	%eax, %eax
	jne	.L345
	movq	(%rdi), %rcx
	movq	%rbx, %r8
	movq	%rsi, %rdx
	call	codegen_import
	jmp	.L345
.L353:
	addq	$32, %rsp
	movq	%rsi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.section .rdata,"dr"
	.align 16
CSWTCH.22:
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
	.align 8
.LC23:
	.long	0
	.long	-1074790400
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
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
