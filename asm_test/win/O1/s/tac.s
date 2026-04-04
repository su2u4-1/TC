	.file	"tac.c"
	.text
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
	ja	.L8
	movl	%esi, %esi
	leaq	.L10(%rip), %rdx
	movslq	(%rdx,%rsi,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L10:
	.long	.L17-.L10
	.long	.L16-.L10
	.long	.L15-.L10
	.long	.L14-.L10
	.long	.L13-.L10
	.long	.L12-.L10
	.long	.L11-.L10
	.long	.L9-.L10
	.text
.L17:
	movq	%rdi, (%rbx)
	movq	16(%rdi), %rax
	movq	%rax, 8(%rbx)
.L18:
	movb	$0, 20(%rbx)
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L16:
	movq	(%rdi), %rax
	movq	%rax, (%rbx)
	movq	.refptr.name_int(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 8(%rbx)
	jmp	.L18
.L15:
	movsd	(%rdi), %xmm0
	movsd	%xmm0, (%rbx)
	movq	.refptr.name_float(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 8(%rbx)
	jmp	.L18
.L14:
	movq	%rdi, (%rbx)
	movq	.refptr.name_string(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 8(%rbx)
	jmp	.L18
.L13:
	movzbl	(%rdi), %eax
	movb	%al, (%rbx)
	movq	.refptr.name_bool(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 8(%rbx)
	jmp	.L18
.L12:
	movq	$0, (%rbx)
	movq	.refptr.name_void(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 8(%rbx)
	jmp	.L18
.L11:
	movq	%rdi, (%rbx)
	jmp	.L18
.L9:
	movq	%rdi, (%rbx)
	movq	16(%rdi), %rax
	movq	%rax, 8(%rbx)
	jmp	.L18
.L8:
	call	__getreent
	movq	24(%rax), %rcx
	movl	%esi, %r8d
	leaq	.LC0(%rip), %rdx
	call	fprintf
	jmp	.L18
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "[warning] Unsupported type for size lookup: %s\12\0"
	.text
	.def	get_type_size;	.scl	3;	.type	32;	.endef
get_type_size:
	movl	$0, %eax
	testq	%rcx, %rcx
	je	.L30
	movq	.refptr.name_int(%rip), %rax
	cmpq	%rcx, (%rax)
	je	.L24
	movq	.refptr.name_float(%rip), %rax
	cmpq	%rcx, (%rax)
	je	.L25
	movq	.refptr.name_string(%rip), %rax
	cmpq	%rcx, (%rax)
	je	.L26
	movl	$1, %eax
	movq	.refptr.name_bool(%rip), %rdx
	cmpq	%rcx, (%rdx)
	je	.L30
	movq	.refptr.name_void(%rip), %rdx
	cmpq	%rcx, (%rdx)
	je	.L30
	cmpl	$0, 32(%rcx)
	jne	.L22
	movq	24(%rcx), %rax
	movq	24(%rax), %rax
	ret
.L22:
	pushq	%rbx
	subq	$32, %rsp
	movq	8(%rcx), %rbx
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	leaq	.LC1(%rip), %rdx
	call	fprintf
	movl	$8, %eax
	addq	$32, %rsp
	popq	%rbx
	ret
.L24:
	movl	$8, %eax
	ret
.L25:
	movl	$8, %eax
	ret
.L26:
	movl	$8, %eax
	ret
.L30:
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rdi
	movq	%rdx, %r12
	movl	%r8d, %ebp
	movq	%r9, %rsi
	testq	%rcx, %rcx
	je	.L33
	movl	$0, %r13d
	cmpl	$0, 32(%rdx)
	jne	.L34
	movq	24(%r9), %r13
	movq	24(%rdx), %rax
	movq	%rax, 24(%r9)
.L34:
	movq	8(%rsi), %rax
	testq	%rax, %rax
	je	.L35
	movq	24(%rax), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L71
.L36:
	movq	8(%rsi), %rax
	testq	%rax, %rax
	je	.L35
	movq	16(%rax), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L72
.L35:
	cmpq	$0, 24(%rsi)
	je	.L42
	movq	(%rsi), %rax
	movq	(%rax), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L73
.L42:
	movq	(%rsi), %rax
	movq	16(%rax), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L49
	movq	(%rsi), %rax
	movq	16(%rax), %rcx
	call	list_copy
	movq	%rax, %r14
.L50:
	movq	%r14, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L49
	cmpq	(%rbx), %rdi
	jne	.L50
.L38:
	cmpl	$0, 32(%r12)
	je	.L65
	jmp	.L32
.L71:
	movq	8(%rsi), %rax
	movq	24(%rax), %rcx
	call	list_copy
	movq	%rax, %r14
.L37:
	movq	%r14, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L36
	cmpq	(%rbx), %rdi
	jne	.L37
	jmp	.L38
.L72:
	movq	8(%rsi), %rax
	movq	16(%rax), %rcx
	call	list_copy
	movq	%rax, %r14
.L40:
	movq	%r14, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L35
	cmpq	(%rbx), %rdi
	jne	.L40
	jmp	.L38
.L73:
	movq	(%rsi), %rax
	movq	(%rax), %rcx
	call	list_copy
	movq	%rax, %r14
.L44:
	movq	%r14, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L42
	movq	24(%rsi), %rax
	movq	(%rax), %rax
	cmpq	%rax, 8(%rbx)
	jne	.L44
	movq	(%rbx), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L44
	movq	(%rbx), %rcx
	call	list_copy
	movq	%rax, %r15
.L46:
	movq	%r15, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L44
	movq	(%rax), %rbx
	cmpq	(%rbx), %rdi
	jne	.L46
	jmp	.L38
.L67:
	movl	$0, %ebx
.L65:
	movq	%r13, 24(%rsi)
	testq	%rbx, %rbx
	jne	.L32
	jmp	.L33
.L53:
	movq	48(%rsi), %rdi
	leaq	1(%rdi), %rax
	movq	%rax, 48(%rsi)
.L54:
	movl	$32, %edx
	leaq	.LC2(%rip), %rcx
	call	create_string
	movq	%rax, %rcx
	movq	%rax, 8(%rbx)
	cmpq	$-1, %rdi
	je	.L63
	movq	%rdi, %r9
	movl	%ebp, %r8d
	leaq	.LC4(%rip), %rdx
	call	sprintf
.L61:
	movq	%r12, 16(%rbx)
	andl	$-3, %ebp
	cmpl	$116, %ebp
	je	.L74
.L32:
	movq	%rbx, %rax
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
.L55:
	movq	56(%rsi), %rdi
	leaq	1(%rdi), %rax
	movq	%rax, 56(%rsi)
	jmp	.L54
.L56:
	movq	64(%rsi), %rdi
	leaq	1(%rdi), %rax
	movq	%rax, 64(%rsi)
	jmp	.L54
.L57:
	movq	72(%rsi), %rdi
	leaq	1(%rdi), %rax
	movq	%rax, 72(%rsi)
	jmp	.L54
.L58:
	movq	80(%rsi), %rdi
	leaq	1(%rdi), %rax
	movq	%rax, 80(%rsi)
	jmp	.L54
.L59:
	movq	88(%rsi), %rdi
	leaq	1(%rdi), %rax
	movq	%rax, 88(%rsi)
	jmp	.L54
.L74:
	movq	8(%rsi), %rax
	movq	24(%rax), %rcx
	movq	%rbx, %rdx
	call	list_append
	jmp	.L32
.L62:
	movl	$32, %edx
	leaq	.LC2(%rip), %rcx
	call	create_string
	movq	%rax, %rcx
	movq	%rax, 8(%rbx)
.L63:
	movl	%ebp, %r8d
	leaq	.LC3(%rip), %rdx
	call	sprintf
	jmp	.L61
.L49:
	cmpl	$0, 32(%r12)
	je	.L67
.L33:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, %rbx
	movq	%rdi, (%rax)
	leal	-97(%rbp), %eax
	cmpl	$21, %eax
	ja	.L62
	movl	%eax, %eax
	leaq	.L64(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L64:
	.long	.L53-.L64
	.long	.L58-.L64
	.long	.L62-.L64
	.long	.L62-.L64
	.long	.L62-.L64
	.long	.L59-.L64
	.long	.L62-.L64
	.long	.L62-.L64
	.long	.L62-.L64
	.long	.L62-.L64
	.long	.L62-.L64
	.long	.L62-.L64
	.long	.L62-.L64
	.long	.L62-.L64
	.long	.L62-.L64
	.long	.L55-.L64
	.long	.L62-.L64
	.long	.L62-.L64
	.long	.L62-.L64
	.long	.L57-.L64
	.long	.L62-.L64
	.long	.L56-.L64
	.text
	.def	load_rvalue;	.scl	3;	.type	32;	.endef
load_rvalue:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbx
	testq	%rcx, %rcx
	je	.L76
	movq	%rdx, %rsi
	cmpb	$0, 20(%rcx)
	jne	.L78
.L76:
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L78:
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
	jmp	.L76
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "[warning] Unsupported symbol kind for import: %d\12\0"
	.text
	.globl	tac_import
	.def	tac_import;	.scl	2;	.type	32;	.endef
tac_import:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rdx, %rdi
	movq	(%rcx), %rsi
	movl	32(%rsi), %ebx
	cmpl	$3, %ebx
	je	.L85
	leal	-1(%rbx), %eax
	cmpl	$1, %eax
	jbe	.L86
	testl	%ebx, %ebx
	jne	.L83
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
.L79:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L85:
	movq	(%rsi), %rdx
	movq	%r8, %r9
	movl	$118, %r8d
	movq	%rsi, %rcx
	call	create_var
	movq	%rax, %rdx
	movq	16(%rdi), %rcx
	call	list_append
	jmp	.L79
.L86:
	movq	(%rsi), %rdx
	movq	%r8, %r9
	movl	$102, %r8d
	movq	%rsi, %rcx
	call	create_var
	movq	%rax, %rdx
	movq	16(%rdi), %rcx
	call	list_append
	jmp	.L79
.L83:
	call	__getreent
	movq	24(%rax), %rcx
	movl	%ebx, %r8d
	leaq	.LC5(%rip), %rdx
	call	fprintf
	jmp	.L79
	.section .rdata,"dr"
	.align 8
.LC6:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
	.align 8
.LC7:
	.ascii "[warning] Unsupported variable type for tac_variable: %d\12\0"
	.text
	.globl	tac_variable
	.def	tac_variable;	.scl	2;	.type	32;	.endef
tac_variable:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movl	%r8d, %esi
	leal	-97(%r8), %eax
	cmpl	$21, %eax
	ja	.L88
	movq	%rcx, %rdi
	movq	%rdx, %rbx
	movl	%eax, %eax
	leaq	.L90(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L90:
	.long	.L93-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L92-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L91-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L87-.L90
	.long	.L88-.L90
	.long	.L87-.L90
	.text
.L91:
	movq	(%rcx), %rdx
	movq	8(%rcx), %rcx
	movq	%rbx, %r9
	movl	$112, %r8d
	call	create_var
	movq	%rax, %rdx
	movq	8(%rbx), %rax
	movq	16(%rax), %rcx
	call	list_append
.L87:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L92:
	movq	(%rcx), %rdx
	movq	8(%rcx), %rcx
	movq	%rbx, %r9
	movl	$102, %r8d
	call	create_var
	movq	%rax, %rdx
	movq	(%rbx), %rax
	movq	16(%rax), %rcx
	call	list_append
	jmp	.L87
.L93:
	movq	(%rbx), %rax
	movq	(%rax), %rcx
	call	list_pop_back
	movq	%rax, %rsi
	movq	(%rbx), %rax
	movq	(%rax), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	(%rdi), %rbp
	movq	8(%rdi), %r12
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, %rdi
	movq	%rbx, %r9
	movl	$97, %r8d
	movq	%rbp, %rdx
	movq	%r12, %rcx
	call	create_var
	movq	%rax, (%rdi)
	movq	%rbp, 8(%rdi)
	movq	$0, 16(%rdi)
	movq	16(%rsi), %rax
	movq	%rax, 16(%rdi)
	movq	%rbp, %rcx
	call	get_type_size
	addq	%rax, 16(%rsi)
	movq	(%rsi), %rcx
	testq	%rcx, %rcx
	je	.L96
	movq	%rdi, %rdx
	call	list_append
	jmp	.L87
.L96:
	call	__getreent
	movq	24(%rax), %r9
	movl	$63, %r8d
	movl	$1, %edx
	leaq	.LC6(%rip), %rcx
	call	fwrite
	jmp	.L87
.L88:
	call	__getreent
	movq	24(%rax), %rcx
	movl	%esi, %r8d
	leaq	.LC7(%rip), %rdx
	call	fprintf
	jmp	.L87
	.section .rdata,"dr"
	.align 8
.LC8:
	.ascii "[warning] Unsupported variable access with NULL base\12\0"
	.align 8
.LC9:
	.ascii "[warning] Failed to generate variable access for base\12\0"
	.align 8
.LC10:
	.ascii "[warning] Attempting to access attribute of non-object type: %s\12\0"
	.align 8
.LC11:
	.ascii "[warning] Attribute '%s' not found in type '%s'\12\0"
	.align 8
.LC12:
	.ascii "[warning] Symbol '%s' in type '%s' is not an attribute\12\0"
	.align 8
.LC13:
	.ascii "[warning] Attempting to index non-array type: %s\12\0"
.LC14:
	.ascii "arr\0"
	.align 8
.LC15:
	.ascii "[warning] Failed to generate variable access for index\12\0"
	.align 8
.LC16:
	.ascii "[warning] Attempting to call non-function, kind: %u, type name: %s\12\0"
	.align 8
.LC17:
	.ascii "[warning] Unsupported variable access type for tac_variable_access: %u\12\0"
	.text
	.globl	tac_variable_access
	.def	tac_variable_access;	.scl	2;	.type	32;	.endef
tac_variable_access:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$48, %rsp
	movq	%rcx, %rdi
	movq	%rdx, %rbx
	cmpl	$0, 16(%rcx)
	jne	.L98
	movq	8(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L98
	movl	32(%rcx), %eax
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L99
	movq	(%rcx), %rdx
	movq	%rbx, %r9
	movl	$118, %r8d
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rsi
.L97:
	movq	%rsi, %rax
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L99:
	movq	(%rcx), %rdx
	movq	%rbx, %r9
	movl	$102, %r8d
	call	create_var
	movq	%rax, %rdx
	movl	$7, %ecx
	call	create_arg
	movq	%rax, %rsi
	jmp	.L97
.L98:
	movq	(%rdi), %rsi
	testq	%rsi, %rsi
	je	.L121
	movq	%rbx, %rdx
	movq	%rsi, %rcx
	call	tac_variable_access
	movq	%rax, %rcx
	movq	%rbx, %rdx
	call	load_rvalue
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L122
	movl	16(%rdi), %esi
	cmpl	$2, %esi
	je	.L123
	cmpl	$3, %esi
	je	.L124
	cmpl	$1, %esi
	jne	.L113
	movl	16(%rax), %esi
	testl	%esi, %esi
	jne	.L114
	movq	8(%rax), %rax
	cmpl	$0, 32(%rax)
	je	.L125
.L115:
	movq	8(%rbp), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rbx, %r9
	movl	%esi, %r8d
	leaq	.LC16(%rip), %rdx
	call	fprintf
	movl	$0, %esi
	jmp	.L97
.L121:
	call	__getreent
	movq	24(%rax), %r9
	movl	$53, %r8d
	movl	$1, %edx
	leaq	.LC8(%rip), %rcx
	call	fwrite
	jmp	.L97
.L122:
	call	__getreent
	movq	24(%rax), %r9
	movl	$54, %r8d
	movl	$1, %edx
	leaq	.LC9(%rip), %rcx
	call	fwrite
	movq	%rbp, %rsi
	jmp	.L97
.L123:
	movq	8(%rax), %rax
	movl	32(%rax), %edx
	leal	-1(%rdx), %ecx
	cmpl	$1, %ecx
	jbe	.L126
	movq	24(%rax), %rcx
	testl	%edx, %edx
	jne	.L105
	movq	16(%rcx), %rcx
.L105:
	movq	8(%rdi), %rax
	movq	8(%rax), %rdx
	call	search_name_use_strcmp
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L127
	movl	32(%rax), %eax
	leal	-1(%rax), %edx
	cmpl	$1, %edx
	jbe	.L128
	cmpl	$5, %eax
	jne	.L129
	movq	(%rsi), %rdx
	movq	%rbx, %r9
	movl	$116, %r8d
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rsi
	movq	8(%rdi), %rcx
	movq	(%rcx), %rdx
	movq	%rbx, %r9
	movl	$97, %r8d
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %r9
	movq	%rbp, %r8
	movq	%rsi, %rdx
	movl	$15, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movb	$1, 20(%rsi)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L97
.L126:
	movq	8(%rax), %rbx
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	leaq	.LC10(%rip), %rdx
	call	fprintf
	movl	$0, %esi
	jmp	.L97
.L127:
	movq	8(%rbp), %rax
	movq	8(%rax), %rbp
	movq	8(%rdi), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rbp, %r9
	movq	%rbx, %r8
	leaq	.LC11(%rip), %rdx
	call	fprintf
	jmp	.L97
.L128:
	movq	(%rsi), %rdx
	movq	%rbx, %r9
	movl	$102, %r8d
	movq	%rsi, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$7, %ecx
	call	create_arg
	movq	%rax, %rsi
	jmp	.L97
.L129:
	movq	8(%rbp), %rax
	movq	8(%rax), %rsi
	movq	8(%rdi), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC12(%rip), %rdx
	call	fprintf
	movl	$0, %esi
	jmp	.L97
.L124:
	movq	8(%rax), %rdx
	movl	32(%rdx), %eax
	subl	$3, %eax
	cmpl	$2, %eax
	ja	.L130
	movq	8(%rdx), %rsi
	leaq	.LC14(%rip), %rdx
	movq	%rsi, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L131
	movq	8(%rdi), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rcx
	movq	%rbx, %rdx
	call	load_rvalue
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L132
	movq	8(%rbp), %rax
	movq	(%rax), %rdx
	movq	%rbx, %r9
	movl	$116, %r8d
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rsi
	movq	%rdi, %r9
	movq	%rbp, %r8
	movq	%rax, %rdx
	movl	$16, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movb	$1, 20(%rsi)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L97
.L130:
	movq	8(%rdx), %rbx
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	leaq	.LC13(%rip), %rdx
	call	fprintf
	movl	$0, %esi
	jmp	.L97
.L131:
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rsi, %r8
	leaq	.LC13(%rip), %rdx
	call	fprintf
	movl	$0, %esi
	jmp	.L97
.L132:
	call	__getreent
	movq	24(%rax), %r9
	movl	$55, %r8d
	movl	$1, %edx
	leaq	.LC15(%rip), %rcx
	call	fwrite
	movq	%rdi, %rsi
	jmp	.L97
.L125:
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	movq	(%rdx), %rdx
	movq	8(%rax), %rcx
	call	make_method_name
	movq	%rax, %rdx
	movq	8(%rbp), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rcx
	call	search_name_use_strcmp
	movq	%rax, %rcx
	movq	(%rax), %rdx
	movq	%rbx, %r9
	movl	$102, %r8d
	call	create_var
	movq	%rax, %rdx
	movl	$7, %ecx
	call	create_arg
	movq	%rax, %rbp
.L114:
	movl	16(%rbp), %esi
	cmpl	$7, %esi
	jne	.L115
	movq	8(%rdi), %rcx
	call	list_copy
	movq	%rax, %rdi
	movq	$0, 32(%rsp)
	leaq	40(%rsp), %r12
	jmp	.L118
.L119:
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rsi
	movq	8(%rax), %rcx
	call	get_type_size
	movq	%rax, 40(%rsp)
	movq	%r12, %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rax, %rdx
	movl	$0, %r9d
	movq	%rsi, %r8
	movl	$17, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	addq	$1, 32(%rsp)
.L118:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L119
	movq	8(%rbp), %rdx
	movq	%rbx, %r9
	movl	$116, %r8d
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rsi
	leaq	32(%rsp), %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rax, %r9
	movq	%rbp, %r8
	movq	%rsi, %rdx
	movl	$22, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L97
.L113:
	call	__getreent
	movq	24(%rax), %rcx
	movl	%esi, %r8d
	leaq	.LC17(%rip), %rdx
	call	fprintf
	movl	$0, %esi
	jmp	.L97
	.section .rdata,"dr"
	.align 8
.LC19:
	.ascii "[warning] Unsupported type for negation: %s\12\0"
	.align 8
.LC20:
	.ascii "[warning] Unsupported primary type for tac_primary: %d\12\0"
	.text
	.globl	tac_primary
	.def	tac_primary;	.scl	2;	.type	32;	.endef
tac_primary:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$48, %rsp
	movl	8(%rcx), %ebx
	cmpl	$8, %ebx
	ja	.L134
	movq	%rdx, %rsi
	movl	%ebx, %ebx
	leaq	.L136(%rip), %r8
	movslq	(%r8,%rbx,4), %rax
	addq	%r8, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L136:
	.long	.L144-.L136
	.long	.L143-.L136
	.long	.L142-.L136
	.long	.L141-.L136
	.long	.L140-.L136
	.long	.L139-.L136
	.long	.L138-.L136
	.long	.L137-.L136
	.long	.L135-.L136
	.text
.L144:
	movq	(%rcx), %rcx
	movl	$10, %r8d
	movl	$0, %edx
	call	strtoll
	movq	%rax, 40(%rsp)
	leaq	40(%rsp), %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rax, %rbx
.L133:
	movq	%rbx, %rax
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L143:
	movq	(%rcx), %rcx
	movl	$0, %edx
	call	strtod
	movsd	%xmm0, 40(%rsp)
	leaq	40(%rsp), %rdx
	movl	$2, %ecx
	call	create_arg
	movq	%rax, %rbx
	jmp	.L133
.L142:
	movq	(%rcx), %rdx
	movl	$3, %ecx
	call	create_arg
	movq	%rax, %rbx
	jmp	.L133
.L141:
	movb	$1, 40(%rsp)
	leaq	40(%rsp), %rdx
	movl	$4, %ecx
	call	create_arg
	movq	%rax, %rbx
	jmp	.L133
.L140:
	movb	$0, 40(%rsp)
	leaq	40(%rsp), %rdx
	movl	$4, %ecx
	call	create_arg
	movq	%rax, %rbx
	jmp	.L133
.L139:
	movq	(%rcx), %rcx
	call	tac_expression
	movq	%rax, %rbx
	jmp	.L133
.L138:
	movq	(%rcx), %rcx
	call	tac_primary
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
	jmp	.L133
.L137:
	movq	(%rcx), %rcx
	call	tac_primary
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
	movq	.LC18(%rip), %rax
	movq	%rax, 40(%rsp)
	movq	8(%rdi), %rax
	movq	.refptr.name_int(%rip), %rdx
	cmpq	(%rdx), %rax
	je	.L151
	movq	.refptr.name_float(%rip), %rdx
	cmpq	(%rdx), %rax
	je	.L152
	movq	8(%rax), %rbx
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rbx, %r8
	leaq	.LC19(%rip), %rdx
	call	fprintf
	movl	$0, %ebx
	jmp	.L133
.L151:
	leaq	32(%rsp), %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rax, %r8
	movq	%rdi, %r9
	movq	%rbx, %rdx
	movl	$1, %ecx
	call	create_instruction
	movq	%rax, %rdx
	jmp	.L147
.L152:
	leaq	40(%rsp), %rdx
	movl	$2, %ecx
	call	create_arg
	movq	%rax, %r8
	movq	%rdi, %r9
	movq	%rbx, %rdx
	movl	$2, %ecx
	call	create_instruction
	movq	%rax, %rdx
.L147:
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L133
.L135:
	movq	(%rcx), %rcx
	call	tac_variable_access
	movq	%rax, %rbx
	jmp	.L133
.L134:
	call	__getreent
	movq	24(%rax), %rcx
	movl	%ebx, %r8d
	leaq	.LC20(%rip), %rdx
	call	fprintf
	movl	$0, %ebx
	jmp	.L133
	.section .rdata,"dr"
	.align 8
.LC21:
	.ascii "[warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.globl	tac_expression
	.def	tac_expression;	.scl	2;	.type	32;	.endef
tac_expression:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rsi
	movq	%rdx, %rbx
	cmpl	$19, 24(%rcx)
	je	.L181
	movq	16(%rcx), %rcx
	call	tac_expression
	movq	%rax, %rcx
	movq	%rbx, %rdx
	call	load_rvalue
	movq	%rax, %r12
	movl	24(%rsi), %ebp
	cmpl	$18, %ebp
	ja	.L156
	movl	%ebp, %eax
	leaq	.L158(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L158:
	.long	.L162-.L158
	.long	.L161-.L158
	.long	.L177-.L158
	.long	.L159-.L158
	.long	.L157-.L158
	.long	.L160-.L158
	.long	.L160-.L158
	.long	.L160-.L158
	.long	.L160-.L158
	.long	.L160-.L158
	.long	.L160-.L158
	.long	.L160-.L158
	.long	.L160-.L158
	.long	.L163-.L158
	.long	.L162-.L158
	.long	.L161-.L158
	.long	.L177-.L158
	.long	.L159-.L158
	.long	.L157-.L158
	.text
.L181:
	movq	8(%rcx), %rcx
	call	tac_primary
	movq	%rax, %rsi
	jmp	.L153
.L159:
	movl	$3, %ebp
.L160:
	movq	(%rsi), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rdi
	movl	24(%rsi), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	jbe	.L175
.L172:
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
	jmp	.L174
.L157:
	movl	$4, %ebp
	jmp	.L160
.L156:
	movl	$25, %ebp
	jmp	.L160
.L162:
	movq	(%rsi), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rdi
	movl	24(%rsi), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L178
	movl	$0, %ebp
.L175:
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
.L176:
	cmpl	$0, 16(%rdi)
	jne	.L182
.L173:
	movl	$0, %r9d
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movl	$14, %ecx
	call	create_instruction
	movq	%rax, %rdx
	cmpb	$0, 20(%rdi)
	jne	.L183
.L174:
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L153:
	movq	%rsi, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L182:
	call	__getreent
	movq	24(%rax), %r9
	movl	$57, %r8d
	movl	$1, %edx
	leaq	.LC21(%rip), %rcx
	call	fwrite
	jmp	.L173
.L183:
	movl	$0, %r9d
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movl	$24, %ecx
	call	create_instruction
	movq	%rax, %rdx
	jmp	.L174
.L178:
	movl	$0, %ebp
	jmp	.L172
.L161:
	movl	$1, %ebp
	jmp	.L160
.L177:
	movl	$2, %ebp
	jmp	.L160
.L163:
	movq	(%rsi), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rdi
	movl	24(%rsi), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L184
	movq	%r12, %rsi
	jmp	.L176
.L184:
	movl	$14, %ebp
	jmp	.L172
	.globl	tac_if
	.def	tac_if;	.scl	2;	.type	32;	.endef
tac_if:
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
	je	.L186
	movq	24(%r12), %rcx
	call	list_is_empty
	movq	%rsi, %r15
	testb	%al, %al
	jne	.L187
.L186:
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %r15
.L187:
	movq	%r15, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %r13
	movq	(%r12), %rcx
	movq	%rbx, %rdx
	call	tac_expression
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
	jmp	.L188
.L189:
	movq	%rbx, %rdx
	call	tac_statement
.L188:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L189
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
	je	.L202
.L190:
	movq	24(%r12), %rcx
	call	list_is_empty
	testb	%al, %al
	je	.L203
.L196:
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
.L202:
	movq	16(%r12), %rcx
	call	list_copy
	movq	%rax, %r14
	jmp	.L191
.L204:
	movq	24(%r12), %rcx
	call	list_is_empty
	testb	%al, %al
	cmovne	%r15, %rsi
	jmp	.L192
.L194:
	movq	%rbx, %rdx
	call	tac_statement
.L193:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L194
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%r13, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L191:
	movq	%r14, %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L190
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
	call	tac_expression
	movq	%rax, 40(%rsp)
	movq	%r14, %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L204
.L192:
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
	jmp	.L193
.L203:
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
	jmp	.L197
.L198:
	movq	%rbx, %rdx
	call	tac_statement
.L197:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L198
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%r13, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L196
	.section .rdata,"dr"
	.align 8
.LC22:
	.ascii "[warning] 'break' statement used outside of loop\12\0"
	.align 8
.LC23:
	.ascii "[warning] 'continue' statement used outside of loop\12\0"
	.align 8
.LC24:
	.ascii "[warning] Unsupported statement type for tac_statement: %d\12\0"
	.text
	.globl	tac_statement
	.def	tac_statement;	.scl	2;	.type	32;	.endef
tac_statement:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movl	8(%rcx), %ebx
	cmpl	$7, %ebx
	ja	.L206
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	movl	%ebx, %ebx
	leaq	.L208(%rip), %rdx
	movslq	(%rdx,%rbx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L208:
	.long	.L215-.L208
	.long	.L214-.L208
	.long	.L213-.L208
	.long	.L212-.L208
	.long	.L211-.L208
	.long	.L210-.L208
	.long	.L209-.L208
	.long	.L207-.L208
	.text
.L215:
	movq	(%rcx), %rcx
	movq	%rdi, %rdx
	call	tac_expression
.L205:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L214:
	movq	(%rcx), %rcx
	movl	$118, %r8d
	movq	%rdi, %rdx
	call	tac_variable
	jmp	.L205
.L213:
	movq	(%rcx), %rcx
	movq	%rdi, %rdx
	call	tac_if
	jmp	.L205
.L212:
	movq	(%rcx), %rcx
	movq	%rdi, %rdx
	call	tac_while
	jmp	.L205
.L211:
	movq	(%rcx), %rcx
	movq	%rdi, %rdx
	call	tac_for
	jmp	.L205
.L210:
	movl	$0, %edx
	movl	$5, %ecx
	call	create_arg
	movq	(%rsi), %rcx
	testq	%rcx, %rcx
	je	.L217
	movq	%rdi, %rdx
	call	tac_expression
.L217:
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$21, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rdi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L205
.L209:
	movq	32(%rdi), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L218
	movq	32(%rdi), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	testq	%rdx, %rdx
	je	.L218
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rdi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L205
.L218:
	call	__getreent
	movq	24(%rax), %r9
	movl	$49, %r8d
	movl	$1, %edx
	leaq	.LC22(%rip), %rcx
	call	fwrite
	jmp	.L205
.L207:
	movq	40(%rdi), %rcx
	call	list_is_empty
	testb	%al, %al
	jne	.L219
	movq	40(%rdi), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	testq	%rdx, %rdx
	je	.L219
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rdi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L205
.L219:
	call	__getreent
	movq	24(%rax), %r9
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC23(%rip), %rcx
	call	fwrite
	jmp	.L205
.L206:
	call	__getreent
	movq	24(%rax), %rcx
	movl	%ebx, %r8d
	leaq	.LC24(%rip), %rdx
	call	fprintf
	jmp	.L205
	.globl	tac_for
	.def	tac_for;	.scl	2;	.type	32;	.endef
tac_for:
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
	je	.L222
	movl	$118, %r8d
	call	tac_variable
.L222:
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
	je	.L223
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
	call	tac_expression
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
.L224:
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
	je	.L225
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	40(%rbx), %rcx
	call	list_append
.L226:
	movq	%r12, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	32(%rbx), %rcx
	call	list_append
	movq	24(%rdi), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L228
.L223:
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
	jmp	.L224
.L225:
	cmpq	$0, 8(%rdi)
	je	.L227
	movq	%rbp, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	40(%rbx), %rcx
	call	list_append
	jmp	.L226
.L227:
	movq	%r13, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	40(%rbx), %rcx
	call	list_append
	jmp	.L226
.L229:
	movq	%rbx, %rdx
	call	tac_statement
.L228:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L229
	movq	40(%rbx), %rcx
	call	list_pop_back
	movq	32(%rbx), %rcx
	call	list_pop_back
	cmpq	$0, 16(%rdi)
	je	.L230
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
	call	tac_expression
.L230:
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
	je	.L233
.L231:
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
.L233:
	movq	%r13, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	jmp	.L231
	.globl	tac_while
	.def	tac_while;	.scl	2;	.type	32;	.endef
tac_while:
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
	call	tac_expression
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
	movq	40(%rbx), %rcx
	call	list_append
	movq	%rbp, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	32(%rbx), %rcx
	call	list_append
	movq	8(%rsi), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L235
.L236:
	movq	%rbx, %rdx
	call	tac_statement
.L235:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L236
	movq	40(%rbx), %rcx
	call	list_pop_back
	movq	32(%rbx), %rcx
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
	.globl	tac_function
	.def	tac_function;	.scl	2;	.type	32;	.endef
tac_function:
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
	jmp	.L239
.L240:
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	movq	%rbx, %r9
	movl	$112, %r8d
	call	create_var
	movq	%rax, %rdx
	movq	16(%rsi), %rcx
	call	list_append
.L239:
	movq	%rdi, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L240
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
	jmp	.L241
.L242:
	movq	%rbx, %rdx
	call	tac_statement
.L241:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L242
	movq	$0, 8(%rbx)
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
	jmp	.L245
.L246:
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	movq	%rbx, %r9
	movl	$112, %r8d
	call	create_var
	movq	%rax, %rdx
	movq	16(%rsi), %rcx
	call	list_append
.L245:
	movq	%rdi, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L246
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
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax
	movq	(%rax), %rdx
	movq	24(%rbx), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rcx
	call	make_method_name
	movq	%rax, %rdx
	movq	0(%rbp), %rax
	movq	8(%rax), %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L251
.L247:
	movq	24(%rbp), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L248
.L251:
	movq	24(%rbx), %rax
	movq	(%rax), %rdx
	movq	%rbx, %r9
	movl	$116, %r8d
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rsi
	movq	24(%rbx), %rax
	leaq	24(%rax), %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rax, %r8
	movl	$0, %r9d
	movq	%rsi, %rdx
	movl	$18, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	8(%rdi), %rcx
	call	list_append
	jmp	.L247
.L249:
	movq	%rbx, %rdx
	call	tac_statement
.L248:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L249
	movq	$0, 8(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC25:
	.ascii "[warning] Unsupported class member type for tac_class: %d\12\0"
	.text
	.globl	tac_class
	.def	tac_class;	.scl	2;	.type	32;	.endef
tac_class:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbp
	movq	%rdx, %rdi
	movq	%rcx, 24(%rdx)
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
	leaq	.LC25(%rip), %rbp
	jmp	.L253
.L254:
	movq	(%rax), %rcx
	movq	%rdi, %rdx
	call	tac_method
.L253:
	movq	%rsi, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L261
	movl	8(%rax), %ebx
	testl	%ebx, %ebx
	je	.L254
	cmpl	$1, %ebx
	je	.L255
	call	__getreent
	movq	24(%rax), %rcx
	movl	%ebx, %r8d
	movq	%rbp, %rdx
	call	fprintf
	jmp	.L253
.L255:
	movq	(%rax), %rcx
	movl	$97, %r8d
	movq	%rdi, %rdx
	call	tac_variable
	jmp	.L253
.L261:
	movq	$0, 24(%rdi)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.section .rdata,"dr"
.LC26:
	.ascii "main\0"
	.text
	.globl	tac_code
	.def	tac_code;	.scl	2;	.type	32;	.endef
tac_code:
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
	movl	$96, %ecx
	call	alloc_memory
	movq	%rax, %rsi
	movq	%rbp, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	call	create_list
	movq	%rax, 32(%rsi)
	call	create_list
	movq	%rax, 40(%rsi)
	movq	$0, 48(%rsi)
	movq	$0, 56(%rsi)
	movq	$0, 64(%rsi)
	movq	$0, 72(%rsi)
	movq	$0, 80(%rsi)
	movq	$0, 88(%rsi)
	movq	(%rbx), %rcx
	call	list_copy
	movq	%rax, %rdi
	leaq	.LC26(%rip), %r12
	jmp	.L263
.L270:
	movq	(%rbx), %rcx
	movq	%rsi, %rdx
	call	tac_function
	movq	(%rbx), %rax
	movq	(%rax), %rbx
	movq	8(%rbx), %rcx
	movq	%r12, %rdx
	call	strcmp
	testl	%eax, %eax
	jne	.L263
	movq	%rbx, 8(%rbp)
	jmp	.L263
.L271:
	movq	(%rbx), %rcx
	movq	%rsi, %rdx
	call	tac_class
.L263:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L269
	movl	8(%rbx), %eax
	cmpl	$1, %eax
	je	.L270
	cmpl	$2, %eax
	je	.L271
	testl	%eax, %eax
	jne	.L263
	movq	(%rbx), %rcx
	movq	%rsi, %r8
	movq	%rbp, %rdx
	call	tac_import
	jmp	.L263
.L269:
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
.LC18:
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
	.def	fwrite;	.scl	2;	.type	32;	.endef
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
