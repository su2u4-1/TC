	.file	"tac.c"
	.text
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
	ja	.L9
	leaq	.L10(%rip), %rcx
	movslq	(%rcx,%rsi,4), %rdx
	addq	%rcx, %rdx
	jmp	*%rdx
	.section .rdata,"dr"
	.align 4
.L10:
	.long	.L16-.L10
	.long	.L15-.L10
	.long	.L14-.L10
	.long	.L13-.L10
	.long	.L12-.L10
	.long	.L11-.L10
	.long	.L9-.L10
	.text
.L16:
	movq	(%rbx), %rdx
	movq	%rdx, (%rax)
	movq	.refptr.name_int(%rip), %rdx
	jmp	.L20
.L15:
	movsd	(%rbx), %xmm0
	movq	.refptr.name_float(%rip), %rdx
	movsd	%xmm0, (%rax)
	jmp	.L20
.L14:
	movq	%rbx, (%rax)
	movq	.refptr.name_string(%rip), %rdx
	jmp	.L20
.L13:
	movb	(%rbx), %dl
	movb	%dl, (%rax)
	movq	.refptr.name_bool(%rip), %rdx
	jmp	.L20
.L12:
	xorl	%edx, %edx
	movq	%rdx, (%rax)
	movq	.refptr.name_void(%rip), %rdx
.L20:
	movq	(%rdx), %rdx
	jmp	.L19
.L11:
	movq	%rbx, (%rax)
	jmp	.L17
.L9:
	movq	%rbx, (%rax)
	movq	16(%rbx), %rdx
.L19:
	movq	%rdx, 8(%rax)
.L17:
	movb	$0, 20(%rax)
	addq	$40, %rsp
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
	je	.L30
	movq	.refptr.name_int(%rip), %rax
	cmpq	%rcx, (%rax)
	je	.L31
	movq	.refptr.name_float(%rip), %rax
	cmpq	%rcx, (%rax)
	je	.L31
	movq	.refptr.name_string(%rip), %rax
	cmpq	%rcx, (%rax)
	je	.L31
	movq	.refptr.name_bool(%rip), %rdx
	movl	$1, %eax
	cmpq	%rcx, (%rdx)
	je	.L30
	movq	.refptr.name_void(%rip), %rdx
	cmpq	%rcx, (%rdx)
	je	.L30
	cmpl	$0, 32(%rcx)
	jne	.L25
	movq	24(%rcx), %rax
	movq	24(%rax), %rax
	ret
.L25:
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
.L31:
	movl	$8, %eax
	ret
.L30:
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rdx, %r12
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rdi
	movl	%r8d, %edi
	pushq	%rsi
	pushq	%rbx
	movq	%r9, %rbx
	subq	$56, %rsp
	testq	%rcx, %rcx
	jne	.L34
.L67:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbp, (%rax)
	movq	%rax, %rsi
	cmpl	$112, %edi
	je	.L35
	ja	.L36
	cmpl	$98, %edi
	je	.L37
	cmpl	$102, %edi
	je	.L38
	cmpl	$97, %edi
	je	.L39
	jmp	.L76
.L36:
	cmpl	$116, %edi
	je	.L41
	cmpl	$118, %edi
	je	.L42
.L76:
	orq	$-1, %r9
	jmp	.L40
.L34:
	xorl	%r14d, %r14d
	cmpl	$0, 32(%rdx)
	jne	.L43
	movq	24(%rdx), %rax
	movq	24(%r9), %r14
	movq	%rax, 24(%r9)
.L43:
	movq	8(%rbx), %rax
	testq	%rax, %rax
	jne	.L44
.L47:
	movq	8(%rbx), %rax
	testq	%rax, %rax
	jne	.L45
	jmp	.L46
.L44:
	movq	24(%rax), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L47
	movq	8(%rbx), %rax
	movq	24(%rax), %rcx
	call	list_copy
	movq	%rax, %r13
.L48:
	movq	%r13, %rcx
	call	list_pop
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L47
	cmpq	(%rsi), %rbp
	jne	.L48
	jmp	.L49
.L45:
	movq	16(%rax), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L46
	movq	8(%rbx), %rax
	movq	16(%rax), %rcx
	call	list_copy
	movq	%rax, %r13
.L53:
	movq	%r13, %rcx
	call	list_pop
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L54
.L46:
	cmpq	$0, 24(%rbx)
	movq	(%rbx), %rax
	jne	.L51
	jmp	.L52
.L54:
	cmpq	(%rsi), %rbp
	jne	.L53
	jmp	.L49
.L51:
	movq	(%rax), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L52
	movq	(%rbx), %rax
	movq	(%rax), %rcx
	call	list_copy
	movq	%rax, %r13
.L58:
	movq	%r13, %rcx
	call	list_pop
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L62
.L52:
	movq	(%rbx), %rax
	movq	16(%rax), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L55
	jmp	.L56
.L62:
	movq	24(%rbx), %rax
	movq	(%rax), %rax
	cmpq	%rax, 8(%rsi)
	jne	.L58
	movq	(%rsi), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L58
	movq	(%rsi), %rcx
	call	list_copy
	movq	%rax, %r15
.L60:
	movq	%r15, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L58
	movq	(%rax), %rsi
	cmpq	(%rsi), %rbp
	jne	.L60
	jmp	.L49
.L55:
	movq	(%rbx), %rax
	movq	16(%rax), %rcx
	call	list_copy
	movq	%rax, %r13
.L63:
	movq	%r13, %rcx
	call	list_pop
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L64
.L56:
	xorl	%esi, %esi
	jmp	.L49
.L64:
	cmpq	(%rsi), %rbp
	jne	.L63
.L49:
	cmpl	$0, 32(%r12)
	jne	.L65
	movq	%r14, 24(%rbx)
.L65:
	testq	%rsi, %rsi
	jne	.L33
	jmp	.L67
.L39:
	movq	48(%rbx), %r9
	leaq	1(%r9), %rax
	movq	%rax, 48(%rbx)
	jmp	.L40
.L35:
	movq	56(%rbx), %r9
	leaq	1(%r9), %rax
	movq	%rax, 56(%rbx)
	jmp	.L40
.L42:
	movq	64(%rbx), %r9
	leaq	1(%r9), %rax
	movq	%rax, 64(%rbx)
	jmp	.L40
.L41:
	movq	72(%rbx), %r9
	leaq	1(%r9), %rax
	movq	%rax, 72(%rbx)
	jmp	.L40
.L37:
	movq	80(%rbx), %r9
	leaq	1(%r9), %rax
	movq	%rax, 80(%rbx)
	jmp	.L40
.L38:
	movq	88(%rbx), %r9
	leaq	1(%r9), %rax
	movq	%rax, 88(%rbx)
.L40:
	leaq	.LC1(%rip), %rcx
	movl	$32, %edx
	movq	%r9, 40(%rsp)
	call	create_string
	movq	40(%rsp), %r9
	movl	%edi, %r8d
	movq	%rax, 8(%rsi)
	movq	%rax, %rcx
	cmpq	$-1, %r9
	jne	.L68
	leaq	.LC2(%rip), %rdx
	call	sprintf
	jmp	.L69
.L68:
	leaq	.LC3(%rip), %rdx
	call	sprintf
.L69:
	andl	$-3, %edi
	movq	%r12, 16(%rsi)
	cmpl	$116, %edi
	jne	.L33
	movq	8(%rbx), %rax
	movq	%rsi, %rdx
	movq	24(%rax), %rcx
	call	list_append
.L33:
	addq	$56, %rsp
	movq	%rsi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.def	load_rvalue;	.scl	3;	.type	32;	.endef
load_rvalue:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$32, %rsp
	testq	%rcx, %rcx
	je	.L78
	cmpb	$0, 20(%rcx)
	je	.L78
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
.L78:
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.section .rdata,"dr"
.LC4:
	.ascii "[warning] Unsupported symbol kind for import: %d\12\0"
	.text
	.globl	tac_import
	.def	tac_import;	.scl	2;	.type	32;	.endef
tac_import:
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
	je	.L88
	leal	-1(%rbx), %eax
	cmpl	$1, %eax
	ja	.L85
	movl	$102, %r8d
.L88:
	movq	(%rsi), %rdx
	movq	%rsi, %rcx
	call	create_var
	movq	16(%rdi), %rcx
	movq	%rax, %rdx
.L89:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	list_append
.L85:
	testl	%ebx, %ebx
	jne	.L86
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
	jmp	.L89
.L86:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC4(%rip), %rdx
	movq	24(%rax), %rcx
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	fprintf
	.section .rdata,"dr"
.LC5:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
.LC6:
	.ascii "[warning] Unsupported variable type for tac_variable: %d\12\0"
	.text
	.globl	tac_variable
	.def	tac_variable;	.scl	2;	.type	32;	.endef
tac_variable:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$48, %rsp
	cmpl	$112, %r8d
	je	.L91
	ja	.L92
	cmpl	$97, %r8d
	je	.L93
	cmpl	$102, %r8d
	jne	.L95
	movq	%rdx, %r9
	movq	8(%rcx), %rcx
	movq	(%rsi), %rdx
	movl	$102, %r8d
	call	create_var
	movq	%rax, %rdx
	movq	(%rbx), %rax
	jmp	.L99
.L92:
	movl	%r8d, %eax
	andl	$-3, %eax
	cmpl	$116, %eax
	jne	.L95
	jmp	.L101
.L91:
	movq	%rdx, %r9
	movq	8(%rcx), %rcx
	movq	(%rsi), %rdx
	movl	$112, %r8d
	call	create_var
	movq	%rax, %rdx
	movq	8(%rbx), %rax
.L99:
	movq	16(%rax), %rcx
.L100:
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	list_append
.L93:
	movq	(%rdx), %rax
	movq	(%rax), %rcx
	call	list_pop_back
	movq	%rax, %rdi
	movq	(%rbx), %rax
	movq	%rdi, %rdx
	movq	(%rax), %rcx
	call	list_append
	movq	(%rsi), %rbp
	movq	8(%rsi), %r12
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbx, %r9
	movl	$97, %r8d
	movq	%rbp, %rdx
	movq	%r12, %rcx
	movq	%rax, %rsi
	call	create_var
	movq	%rbp, 8(%rsi)
	movq	%rbp, %rcx
	movq	%rax, (%rsi)
	movq	16(%rdi), %rax
	movq	%rax, 16(%rsi)
	call	get_type_size
	movq	(%rdi), %rcx
	addq	%rax, 16(%rdi)
	movq	%rsi, %rdx
	testq	%rcx, %rcx
	jne	.L100
	call	__getreent
	leaq	.LC5(%rip), %rcx
	movq	24(%rax), %rdx
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	fputs
.L95:
	movl	%r8d, 44(%rsp)
	call	__getreent
	movl	44(%rsp), %r8d
	leaq	.LC6(%rip), %rdx
	movq	24(%rax), %rcx
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	fprintf
.L101:
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.section .rdata,"dr"
.LC7:
	.ascii "[warning] Unsupported variable access with NULL base\12\0"
.LC8:
	.ascii "[warning] Failed to generate variable access for base\12\0"
.LC9:
	.ascii "[warning] Attempting to access attribute of non-object type: %s\12\0"
.LC10:
	.ascii "[warning] Attribute '%s' not found in type '%s'\12\0"
.LC11:
	.ascii "[warning] Symbol '%s' in type '%s' is not an attribute\12\0"
.LC12:
	.ascii "[warning] Attempting to index non-array type: %s\12\0"
.LC13:
	.ascii "arr\0"
.LC14:
	.ascii "[warning] Failed to generate variable access for index\12\0"
.LC15:
	.ascii "[warning] Attempting to call non-function, kind: %u, type name: %s\12\0"
.LC16:
	.ascii "[warning] Unsupported variable access type for tac_variable_access: %u\12\0"
	.text
	.globl	tac_variable_access
	.def	tac_variable_access;	.scl	2;	.type	32;	.endef
tac_variable_access:
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	subq	$72, %rsp
	cmpl	$0, 16(%rcx)
	jne	.L103
	movq	8(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L103
	movl	32(%rcx), %eax
	movq	(%rcx), %rdx
	movq	%rsi, %r9
	decl	%eax
	cmpl	$1, %eax
	jbe	.L104
	movl	$118, %r8d
	call	create_var
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	jmp	.L135
.L104:
	movl	$102, %r8d
	jmp	.L136
.L103:
	movq	0(%rbp), %rcx
	testq	%rcx, %rcx
	jne	.L105
	call	__getreent
	leaq	.LC7(%rip), %rcx
	movq	24(%rax), %rdx
	jmp	.L129
.L105:
	movq	%rsi, %rdx
	call	tac_variable_access
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L107
	call	__getreent
	leaq	.LC8(%rip), %rcx
	movq	24(%rax), %rdx
.L129:
	call	fputs
	jmp	.L134
.L107:
	movl	16(%rbp), %r8d
	cmpl	$2, %r8d
	jne	.L109
	movq	8(%rax), %rax
	movl	32(%rax), %edx
	leal	-1(%rdx), %ecx
	cmpl	$1, %ecx
	ja	.L110
	movq	8(%rax), %r8
	movq	%r8, 32(%rsp)
	call	__getreent
	movq	32(%rsp), %r8
	leaq	.LC9(%rip), %rdx
	movq	24(%rax), %rcx
	jmp	.L130
.L110:
	movq	24(%rax), %rcx
	testl	%edx, %edx
	jne	.L111
	movq	16(%rcx), %rcx
.L111:
	movq	8(%rbp), %rax
	movq	8(%rax), %rdx
	call	search_name_use_strcmp
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L112
	movq	8(%rbx), %rax
	movq	8(%rax), %r9
	movq	8(%rbp), %rax
	movq	8(%rax), %r8
	movq	%r9, 40(%rsp)
	movq	%r8, 32(%rsp)
	call	__getreent
	movq	40(%rsp), %r9
	movq	32(%rsp), %r8
	leaq	.LC10(%rip), %rdx
	movq	24(%rax), %rcx
	jmp	.L131
.L112:
	movl	32(%rax), %eax
	leal	-1(%rax), %edx
	cmpl	$1, %edx
	ja	.L113
	movq	(%rcx), %rdx
	movq	%rsi, %r9
	movl	$102, %r8d
.L136:
	call	create_var
	movl	$7, %ecx
	movq	%rax, %rdx
.L135:
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	create_arg
.L113:
	cmpl	$5, %eax
	je	.L114
	movq	8(%rbx), %rax
	movq	8(%rax), %r9
	movq	8(%rbp), %rax
	movq	8(%rax), %r8
	movq	%r9, 40(%rsp)
	movq	%r8, 32(%rsp)
	call	__getreent
	movq	40(%rsp), %r9
	movq	32(%rsp), %r8
	leaq	.LC11(%rip), %rdx
	movq	24(%rax), %rcx
.L131:
	call	fprintf
	jmp	.L134
.L114:
	movq	(%rcx), %rdx
	movq	%rsi, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	call	create_var
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	call	create_arg
	movq	8(%rbp), %rcx
	movq	%rsi, %r9
	movl	$97, %r8d
	movq	%rax, %rdi
	movq	(%rcx), %rdx
	call	create_var
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	call	create_arg
	movq	%rbx, %r8
	movq	%rdi, %rdx
	movl	$15, %ecx
	movq	%rax, %r9
	jmp	.L137
.L109:
	cmpl	$3, %r8d
	jne	.L115
	movq	8(%rax), %rax
	movq	8(%rax), %rdi
	movl	32(%rax), %eax
	subl	$3, %eax
	cmpl	$2, %eax
	ja	.L132
	leaq	.LC13(%rip), %rdx
	movq	%rdi, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L117
.L132:
	call	__getreent
	movq	%rdi, %r8
	leaq	.LC12(%rip), %rdx
	movq	24(%rax), %rcx
.L130:
	call	fprintf
	jmp	.L134
.L117:
	movq	8(%rbp), %rcx
	movq	%rsi, %rdx
	call	tac_expression
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L118
	call	__getreent
	leaq	.LC14(%rip), %rcx
	movq	24(%rax), %rdx
	jmp	.L129
.L118:
	movq	8(%rbx), %rax
	movq	%rsi, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	movq	(%rax), %rdx
	call	create_var
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	call	create_arg
	movq	%rbp, %r9
	movq	%rbx, %r8
	movl	$16, %ecx
	movq	%rax, %rdi
	movq	%rax, %rdx
.L137:
	call	create_instruction
	movb	$1, 20(%rdi)
	movq	%rax, %rdx
	jmp	.L133
.L115:
	cmpl	$1, %r8d
	jne	.L119
	cmpl	$0, 16(%rax)
	jne	.L120
	movq	8(%rax), %rax
	cmpl	$0, 32(%rax)
	jne	.L120
	movq	8(%rax), %rcx
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax
	movq	(%rax), %rdx
	call	make_method_name
	movq	%rax, %rdx
	movq	8(%rbx), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rcx
	call	search_name_use_strcmp
	movq	%rsi, %r9
	movl	$102, %r8d
	movq	(%rax), %rdx
	movq	%rax, %rcx
	call	create_var
	movl	$7, %ecx
	movq	%rax, %rdx
	call	create_arg
	movq	%rax, %rbx
.L120:
	movl	16(%rbx), %r8d
	cmpl	$7, %r8d
	movl	%r8d, 40(%rsp)
	je	.L121
	movq	8(%rbx), %rax
	movq	8(%rax), %r9
	movq	%r9, 32(%rsp)
	call	__getreent
	movq	32(%rsp), %r9
	movl	40(%rsp), %r8d
	leaq	.LC15(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L134:
	xorl	%edi, %edi
	jmp	.L102
.L121:
	movq	8(%rbp), %rcx
	leaq	56(%rsp), %rbp
	call	list_copy
	movq	%rax, %rdi
	xorl	%eax, %eax
	movq	%rax, 48(%rsp)
.L123:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L138
	movq	%rsi, %rdx
	call	tac_expression
	movq	8(%rax), %rcx
	movq	%rax, 32(%rsp)
	call	get_type_size
	movq	%rbp, %rdx
	movl	$1, %ecx
	movq	%rax, 56(%rsp)
	call	create_arg
	movq	32(%rsp), %r8
	xorl	%r9d, %r9d
	movl	$17, %ecx
	movq	%rax, %rdx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	incq	48(%rsp)
	jmp	.L123
.L138:
	movq	8(%rbx), %rdx
	movq	%rsi, %r9
	movl	$116, %r8d
	call	create_var
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	call	create_arg
	leaq	48(%rsp), %rdx
	movl	$1, %ecx
	movq	%rax, %rdi
	call	create_arg
	movq	%rdi, %rdx
	movq	%rbx, %r8
	movl	$22, %ecx
	movq	%rax, %r9
	call	create_instruction
	movq	%rax, %rdx
.L133:
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L102
.L119:
	movl	%r8d, 32(%rsp)
	call	__getreent
	movl	32(%rsp), %r8d
	leaq	.LC16(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L134
.L102:
	addq	$72, %rsp
	movq	%rdi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC18:
	.ascii "[warning] Unsupported type for negation: %s\12\0"
.LC19:
	.ascii "[warning] Unsupported primary type for tac_primary: %d\12\0"
	.text
	.globl	tac_primary
	.def	tac_primary;	.scl	2;	.type	32;	.endef
tac_primary:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$64, %rsp
	movl	8(%rcx), %r8d
	cmpl	$8, %r8d
	ja	.L140
	movq	%rdx, %rsi
	leaq	.L142(%rip), %rdx
	movslq	(%rdx,%r8,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L142:
	.long	.L150-.L142
	.long	.L149-.L142
	.long	.L148-.L142
	.long	.L147-.L142
	.long	.L146-.L142
	.long	.L145-.L142
	.long	.L144-.L142
	.long	.L143-.L142
	.long	.L141-.L142
	.text
.L150:
	movq	(%rcx), %rcx
	xorl	%edx, %edx
	movl	$10, %r8d
	call	strtoll
	leaq	56(%rsp), %rdx
	movl	$1, %ecx
	movq	%rax, 56(%rsp)
	jmp	.L159
.L149:
	movq	(%rcx), %rcx
	xorl	%edx, %edx
	call	strtod
	leaq	56(%rsp), %rdx
	movl	$2, %ecx
	movsd	%xmm0, 56(%rsp)
.L159:
	call	create_arg
	movq	%rax, %rbx
	jmp	.L139
.L148:
	movq	(%rcx), %rdx
	addq	$64, %rsp
	movl	$3, %ecx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	create_arg
.L147:
	movb	$1, 56(%rsp)
	jmp	.L160
.L146:
	movb	$0, 56(%rsp)
.L160:
	leaq	56(%rsp), %rdx
	movl	$4, %ecx
	jmp	.L159
.L145:
	movq	(%rcx), %rcx
	addq	$64, %rsp
	movq	%rsi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	tac_expression
.L144:
	movq	(%rcx), %rcx
	movq	%rsi, %rdx
	call	tac_primary
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
	jmp	.L157
.L143:
	movq	(%rcx), %rcx
	movq	%rsi, %rdx
	call	tac_primary
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
	movq	.LC17(%rip), %rax
	movq	%rax, 56(%rsp)
	movq	8(%rdi), %rax
	cmpq	(%rdx), %rax
	jne	.L152
	leaq	48(%rsp), %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rdi, %r9
	movq	%rbx, %rdx
	movl	$1, %ecx
	movq	%rax, %r8
	jmp	.L157
.L152:
	movq	.refptr.name_float(%rip), %rdx
	cmpq	(%rdx), %rax
	jne	.L154
	leaq	56(%rsp), %rdx
	movl	$2, %ecx
	call	create_arg
	movq	%rdi, %r9
	movq	%rbx, %rdx
	movl	$2, %ecx
	movq	%rax, %r8
.L157:
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L139
.L154:
	movq	8(%rax), %r8
	movq	%r8, 40(%rsp)
	call	__getreent
	movq	40(%rsp), %r8
	leaq	.LC18(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L158
.L141:
	movq	(%rcx), %rcx
	addq	$64, %rsp
	movq	%rsi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	tac_variable_access
.L140:
	movl	%r8d, 40(%rsp)
	call	__getreent
	movl	40(%rsp), %r8d
	leaq	.LC19(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L158:
	xorl	%ebx, %ebx
.L139:
	addq	$64, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.section .rdata,"dr"
.LC20:
	.ascii "[warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.globl	tac_expression
	.def	tac_expression;	.scl	2;	.type	32;	.endef
tac_expression:
	pushq	%r12
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$32, %rsp
	cmpl	$19, 24(%rcx)
	jne	.L162
	movq	8(%rcx), %rcx
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	tac_primary
.L162:
	movq	16(%rcx), %rcx
	movl	$25, %r12d
	call	tac_expression
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rax, %rdi
	movl	24(%rbp), %eax
	cmpl	$18, %eax
	ja	.L163
	leaq	CSWTCH.18(%rip), %rdx
	movzbl	(%rdx,%rax), %r12d
.L163:
	movq	0(%rbp), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rsi
	movl	24(%rbp), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L164
	cmpl	$14, %r12d
	je	.L165
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
.L165:
	cmpl	$0, 16(%rsi)
	je	.L166
	call	__getreent
	leaq	.LC20(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
.L166:
	xorl	%r9d, %r9d
	movq	%rsi, %rdx
	movq	%rdi, %r8
	movl	$14, %ecx
	call	create_instruction
	cmpb	$0, 20(%rsi)
	movq	%rax, %rdx
	je	.L167
	movq	%rsi, %rdx
	xorl	%r9d, %r9d
	movq	%rdi, %r8
	movl	$24, %ecx
	call	create_instruction
	movq	%rax, %rdx
	jmp	.L167
.L164:
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
.L167:
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
	.globl	tac_if
	.def	tac_if;	.scl	2;	.type	32;	.endef
tac_if:
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
	jne	.L174
.L176:
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	create_var
	movq	%rax, %rbp
	jmp	.L175
.L174:
	movq	24(%rdi), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L176
	movq	%rsi, %rbp
.L175:
	movq	%rbp, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	(%rdi), %rcx
	movq	%rbx, %rdx
	movq	%rax, 32(%rsp)
	call	tac_expression
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
.L177:
	movq	%r12, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L197
	movq	%rbx, %rdx
	call	tac_statement
	jmp	.L177
.L197:
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
	jne	.L179
	movq	16(%rdi), %rcx
	call	list_copy
	movq	%rax, %r13
.L180:
	movq	%r13, %rcx
	call	list_pop
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L179
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
	call	tac_expression
	movq	%r13, %rcx
	movq	%rax, %r15
	call	list_is_empty
	testb	%al, %al
	je	.L182
	movq	24(%rdi), %rcx
	call	list_is_empty
	testb	%al, %al
	cmovne	%rbp, %rsi
.L182:
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
.L183:
	movq	%r12, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L198
	movq	%rbx, %rdx
	call	tac_statement
	jmp	.L183
.L198:
	movq	32(%rsp), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L180
.L179:
	movq	24(%rdi), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L186
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
.L187:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L199
	movq	%rbx, %rdx
	call	tac_statement
	jmp	.L187
.L199:
	movq	32(%rsp), %rdx
	movl	$20, %ecx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L186:
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
.LC21:
	.ascii "[warning] 'break' statement used outside of loop\12\0"
.LC22:
	.ascii "[warning] 'continue' statement used outside of loop\12\0"
.LC23:
	.ascii "[warning] Unsupported statement type for tac_statement: %d\12\0"
	.text
	.globl	tac_statement
	.def	tac_statement;	.scl	2;	.type	32;	.endef
tac_statement:
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	movl	8(%rcx), %r8d
	cmpl	$7, %r8d
	ja	.L201
	movq	%rdx, %rbx
	leaq	.L203(%rip), %rdx
	movq	%rcx, %rsi
	movslq	(%rdx,%r8,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L203:
	.long	.L210-.L203
	.long	.L200-.L203
	.long	.L208-.L203
	.long	.L207-.L203
	.long	.L206-.L203
	.long	.L205-.L203
	.long	.L204-.L203
	.long	.L202-.L203
	.text
.L210:
	movq	(%rcx), %rcx
	addq	$56, %rsp
	movq	%rbx, %rdx
	popq	%rbx
	popq	%rsi
	jmp	tac_expression
.L208:
	movq	(%rcx), %rcx
	addq	$56, %rsp
	movq	%rbx, %rdx
	popq	%rbx
	popq	%rsi
	jmp	tac_if
.L207:
	movq	(%rcx), %rcx
	addq	$56, %rsp
	movq	%rbx, %rdx
	popq	%rbx
	popq	%rsi
	jmp	tac_while
.L206:
	movq	(%rcx), %rcx
	addq	$56, %rsp
	movq	%rbx, %rdx
	popq	%rbx
	popq	%rsi
	jmp	tac_for
.L205:
	movl	$5, %ecx
	xorl	%edx, %edx
	call	create_arg
	movq	(%rsi), %rcx
	testq	%rcx, %rcx
	je	.L211
	movq	%rbx, %rdx
	call	tac_expression
.L211:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movl	$21, %ecx
	jmp	.L224
.L204:
	movq	32(%rbx), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L212
	movq	32(%rbx), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	testq	%rdx, %rdx
	je	.L212
.L226:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$20, %ecx
.L224:
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	jmp	list_append
.L212:
	call	__getreent
	leaq	.LC21(%rip), %rcx
	movq	24(%rax), %rdx
	jmp	.L225
.L202:
	movq	40(%rbx), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L213
	movq	40(%rbx), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	testq	%rdx, %rdx
	jne	.L226
.L213:
	call	__getreent
	leaq	.LC22(%rip), %rcx
	movq	24(%rax), %rdx
.L225:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	jmp	fputs
.L201:
	movl	%r8d, 44(%rsp)
	call	__getreent
	movl	44(%rsp), %r8d
	leaq	.LC23(%rip), %rdx
	movq	24(%rax), %rcx
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	jmp	fprintf
.L200:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.globl	tac_for
	.def	tac_for;	.scl	2;	.type	32;	.endef
tac_for:
	pushq	%r14
	movq	%rdx, %r9
	movl	$98, %r8d
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
	subq	$48, %rsp
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
	je	.L228
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
	call	tac_expression
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
	jmp	.L238
.L228:
	movq	%rdi, %rdx
	movl	$6, %ecx
	call	create_arg
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$20, %ecx
	movq	%rax, %rdx
.L238:
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
	jne	.L239
	cmpq	$0, 8(%rsi)
	movq	%rbp, %rdx
	jne	.L239
	movq	%rdi, %rdx
.L239:
	movl	$6, %ecx
	call	create_arg
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	%r12, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	32(%rbx), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	24(%rsi), %rcx
	call	list_copy
	movq	%rax, %r14
.L233:
	movq	%r14, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L240
	movq	%rbx, %rdx
	call	tac_statement
	jmp	.L233
.L240:
	movq	40(%rbx), %rcx
	call	list_pop_back
	movq	32(%rbx), %rcx
	call	list_pop_back
	cmpq	$0, 16(%rsi)
	je	.L235
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
	call	tac_expression
.L235:
	movq	%rbp, %rdx
	movl	$6, %ecx
	call	create_arg
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$20, %ecx
	movq	%rax, %rdx
	call	create_instruction
	cmpq	$0, 8(%rsi)
	jne	.L236
	movq	%rdi, %rdx
	movl	$6, %ecx
	call	create_arg
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$20, %ecx
	movq	%rax, %rdx
	call	create_instruction
.L236:
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
	.globl	tac_while
	.def	tac_while;	.scl	2;	.type	32;	.endef
tac_while:
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
	call	tac_expression
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
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	%rdi, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	32(%rbx), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	8(%rbp), %rcx
	call	list_copy
	movq	%rax, %rbp
.L242:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L245
	movq	%rbx, %rdx
	call	tac_statement
	jmp	.L242
.L245:
	movq	40(%rbx), %rcx
	call	list_pop_back
	movq	32(%rbx), %rcx
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
	.globl	tac_function
	.def	tac_function;	.scl	2;	.type	32;	.endef
tac_function:
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
.L247:
	movq	%rbp, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L252
	movq	8(%rax), %rcx
	movq	(%rax), %rdx
	movq	%rbx, %r9
	movl	$112, %r8d
	call	create_var
	movq	16(%rdi), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L247
.L252:
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
.L249:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L253
	movq	%rbx, %rdx
	call	tac_statement
	jmp	.L249
.L253:
	xorl	%eax, %eax
	movq	%rax, 8(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.globl	tac_method
	.def	tac_method;	.scl	2;	.type	32;	.endef
tac_method:
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
.L255:
	movq	%rbp, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L261
	movq	8(%rax), %rcx
	movq	(%rax), %rdx
	movq	%rbx, %r9
	movl	$112, %r8d
	call	create_var
	movq	16(%rdi), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L255
.L261:
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	create_var
	movq	%rax, %rcx
	call	create_block
	movq	32(%rdi), %rcx
	movq	%rax, %rdx
	movq	%rax, %rbp
	call	list_append
	movq	24(%rbx), %rax
	movq	%rbp, 16(%rbx)
	movq	(%rax), %rax
	movq	8(%rax), %rcx
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax
	movq	(%rax), %rdx
	call	make_method_name
	movq	%rax, %rdx
	movq	(%rsi), %rax
	movq	8(%rax), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L257
	movq	24(%rbx), %rax
	movq	%rbx, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	movq	(%rax), %rdx
	call	create_var
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	call	create_arg
	movl	$1, %ecx
	movq	%rax, %rdi
	movq	24(%rbx), %rax
	leaq	24(%rax), %rdx
	call	create_arg
	movq	%rdi, %rdx
	movl	$18, %ecx
	xorl	%r9d, %r9d
	movq	%rax, %r8
	call	create_instruction
	movq	8(%rbp), %rcx
	movq	%rax, %rdx
	call	list_append
.L257:
	movq	24(%rsi), %rcx
	call	list_copy
	movq	%rax, %rsi
.L258:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L262
	movq	%rbx, %rdx
	call	tac_statement
	jmp	.L258
.L262:
	xorl	%eax, %eax
	movq	%rax, 8(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC24:
	.ascii "[warning] Unsupported class member type for tac_class: %d\12\0"
	.text
	.globl	tac_class
	.def	tac_class;	.scl	2;	.type	32;	.endef
tac_class:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$48, %rsp
	movq	%rcx, 24(%rdx)
	movq	8(%rcx), %rcx
	call	list_copy
	movl	$24, %ecx
	movq	(%rdi), %r12
	movq	%rax, %rbp
	call	alloc_memory
	movq	%rax, %rsi
	call	create_list
	movq	%r12, 8(%rsi)
	movq	%rsi, %rdx
	movq	%rax, (%rsi)
	movq	24(%rdi), %rax
	movq	%rax, 16(%rsi)
	movq	(%rbx), %rax
	leaq	.LC24(%rip), %rsi
	movq	(%rax), %rcx
	call	list_append
.L264:
	movq	%rbp, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L272
	movl	8(%rax), %r8d
	testl	%r8d, %r8d
	je	.L265
	cmpl	$1, %r8d
	jne	.L273
	movq	(%rax), %rcx
	movl	$97, %r8d
	movq	%rbx, %rdx
	call	tac_variable
	jmp	.L264
.L265:
	movq	(%rax), %rcx
	movq	%rbx, %rdx
	call	tac_method
	jmp	.L264
.L273:
	movl	%r8d, 44(%rsp)
	call	__getreent
	movl	44(%rsp), %r8d
	movq	%rsi, %rdx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L264
.L272:
	xorl	%eax, %eax
	movq	%rax, 24(%rbx)
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.section .rdata,"dr"
.LC25:
	.ascii "main\0"
	.text
	.globl	tac_code
	.def	tac_code;	.scl	2;	.type	32;	.endef
tac_code:
	pushq	%r12
	leaq	.LC25(%rip), %r12
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
	movl	$96, %ecx
	movq	%rax, 24(%rsi)
	call	alloc_memory
	xorl	%edx, %edx
	movq	%rdx, 8(%rax)
	movq	%rax, %rbx
	movq	%rdx, 16(%rax)
	movq	%rsi, (%rax)
	call	create_list
	movq	%rax, 32(%rbx)
	call	create_list
	xorl	%ecx, %ecx
	movq	%rcx, 48(%rbx)
	movq	%rcx, 56(%rbx)
	movq	%rcx, 64(%rbx)
	movq	%rcx, 72(%rbx)
	movq	%rcx, 80(%rbx)
	movq	%rcx, 88(%rbx)
	movq	(%rdi), %rcx
	movq	%rax, 40(%rbx)
	call	list_copy
	movq	%rax, %rbp
.L275:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L283
	movl	8(%rdi), %eax
	cmpl	$1, %eax
	jne	.L276
	movq	(%rdi), %rcx
	movq	%rbx, %rdx
	call	tac_function
	movq	(%rdi), %rax
	movq	%r12, %rdx
	movq	(%rax), %rdi
	movq	8(%rdi), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L275
	movq	%rdi, 8(%rsi)
	jmp	.L275
.L276:
	cmpl	$2, %eax
	jne	.L279
	movq	(%rdi), %rcx
	movq	%rbx, %rdx
	call	tac_class
	jmp	.L275
.L279:
	testl	%eax, %eax
	jne	.L275
	movq	(%rdi), %rcx
	movq	%rbx, %r8
	movq	%rsi, %rdx
	call	tac_import
	jmp	.L275
.L283:
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
CSWTCH.18:
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
.LC17:
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
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	make_method_name;	.scl	2;	.type	32;	.endef
	.def	strtoll;	.scl	2;	.type	32;	.endef
	.def	strtod;	.scl	2;	.type	32;	.endef
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
