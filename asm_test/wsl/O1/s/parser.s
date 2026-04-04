	.file	"tac.c"
	.text
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$24, %rsp
	movq	%rdi, %r12
	movq	%rsi, %r14
	movl	%edx, %r13d
	movq	%rcx, %rbp
	testq	%rdi, %rdi
	je	.L8
	movq	$0, (%rsp)
	cmpl	$0, 32(%rsi)
	jne	.L9
	movq	24(%rcx), %rax
	movq	%rax, (%rsp)
	movq	24(%rsi), %rax
	movq	%rax, 24(%rcx)
.L9:
	movq	8(%rbp), %rax
	testq	%rax, %rax
	je	.L10
	movq	24(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L46
.L11:
	movq	8(%rbp), %rax
	testq	%rax, %rax
	je	.L10
	movq	16(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L47
.L10:
	cmpq	$0, 24(%rbp)
	je	.L17
	movq	0(%rbp), %rax
	movq	(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L48
.L17:
	movq	0(%rbp), %rax
	movq	16(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L24
	movq	0(%rbp), %rax
	movq	16(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r15
.L25:
	movq	%r15, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L24
	cmpq	(%rbx), %r12
	jne	.L25
.L13:
	cmpl	$0, 32(%r14)
	je	.L40
	jmp	.L7
.L46:
	movq	8(%rbp), %rax
	movq	24(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r15
.L12:
	movq	%r15, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L11
	cmpq	(%rbx), %r12
	jne	.L12
	jmp	.L13
.L47:
	movq	8(%rbp), %rax
	movq	16(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r15
.L15:
	movq	%r15, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L10
	cmpq	(%rbx), %r12
	jne	.L15
	jmp	.L13
.L48:
	movq	0(%rbp), %rax
	movq	(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r15
.L19:
	movq	%r15, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L17
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, 8(%rbx)
	jne	.L19
	movq	(%rbx), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L19
	movq	(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
.L21:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L19
	movq	(%rax), %rbx
	cmpq	(%rbx), %r12
	jne	.L21
	jmp	.L13
.L42:
	movl	$0, %ebx
.L40:
	movq	(%rsp), %rax
	movq	%rax, 24(%rbp)
	testq	%rbx, %rbx
	jne	.L7
	jmp	.L8
.L28:
	movq	48(%rbp), %r12
	leaq	1(%r12), %rax
	movq	%rax, 48(%rbp)
.L29:
	movl	$32, %esi
	leaq	.LC0(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rdi
	movq	%rax, 8(%rbx)
	cmpq	$-1, %r12
	je	.L38
	movq	%r12, %r9
	movl	%r13d, %r8d
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	movl	$0, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
.L36:
	movq	%r14, 16(%rbx)
	andl	$-3, %r13d
	cmpl	$116, %r13d
	je	.L49
.L7:
	movq	%rbx, %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L30:
	movq	56(%rbp), %r12
	leaq	1(%r12), %rax
	movq	%rax, 56(%rbp)
	jmp	.L29
.L31:
	movq	64(%rbp), %r12
	leaq	1(%r12), %rax
	movq	%rax, 64(%rbp)
	jmp	.L29
.L32:
	movq	72(%rbp), %r12
	leaq	1(%r12), %rax
	movq	%rax, 72(%rbp)
	jmp	.L29
.L33:
	movq	80(%rbp), %r12
	leaq	1(%r12), %rax
	movq	%rax, 80(%rbp)
	jmp	.L29
.L34:
	movq	88(%rbp), %r12
	leaq	1(%r12), %rax
	movq	%rax, 88(%rbp)
	jmp	.L29
.L49:
	movq	8(%rbp), %rax
	movq	24(%rax), %rdi
	movq	%rbx, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L7
.L37:
	movl	$32, %esi
	leaq	.LC0(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rdi
	movq	%rax, 8(%rbx)
.L38:
	movl	%r13d, %r8d
	leaq	.LC1(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	movl	$0, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L36
.L24:
	cmpl	$0, 32(%r14)
	je	.L42
.L8:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%r12, (%rax)
	leal	-97(%r13), %eax
	cmpl	$21, %eax
	ja	.L37
	movl	%eax, %eax
	leaq	.L39(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L39:
	.long	.L28-.L39
	.long	.L33-.L39
	.long	.L37-.L39
	.long	.L37-.L39
	.long	.L37-.L39
	.long	.L34-.L39
	.long	.L37-.L39
	.long	.L37-.L39
	.long	.L37-.L39
	.long	.L37-.L39
	.long	.L37-.L39
	.long	.L37-.L39
	.long	.L37-.L39
	.long	.L37-.L39
	.long	.L37-.L39
	.long	.L30-.L39
	.long	.L37-.L39
	.long	.L37-.L39
	.long	.L37-.L39
	.long	.L32-.L39
	.long	.L37-.L39
	.long	.L31-.L39
	.text
	.size	create_var, .-create_var
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"[warning] Unsupported type for size lookup: %s\n"
	.text
	.type	get_type_size, @function
get_type_size:
	movl	$0, %eax
	testq	%rdi, %rdi
	je	.L60
	cmpq	%rdi, name_int(%rip)
	je	.L54
	cmpq	%rdi, name_float(%rip)
	je	.L55
	cmpq	%rdi, name_string(%rip)
	je	.L56
	movl	$1, %eax
	cmpq	%rdi, name_bool(%rip)
	je	.L60
	cmpq	%rdi, name_void(%rip)
	je	.L60
	cmpl	$0, 32(%rdi)
	jne	.L52
	movq	24(%rdi), %rax
	movq	24(%rax), %rax
	ret
.L52:
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
.L54:
	movl	$8, %eax
	ret
.L55:
	movl	$8, %eax
	ret
.L56:
	movl	$8, %eax
	ret
.L60:
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
	ja	.L63
	movl	%ebp, %ebp
	leaq	.L65(%rip), %rdx
	movslq	(%rdx,%rbp,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L65:
	.long	.L72-.L65
	.long	.L71-.L65
	.long	.L70-.L65
	.long	.L69-.L65
	.long	.L68-.L65
	.long	.L67-.L65
	.long	.L66-.L65
	.long	.L64-.L65
	.text
.L72:
	movq	%r12, (%rbx)
	movq	16(%r12), %rax
	movq	%rax, 8(%rbx)
.L73:
	movb	$0, 20(%rbx)
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
.L71:
	movq	(%r12), %rax
	movq	%rax, (%rbx)
	movq	name_int(%rip), %rax
	movq	%rax, 8(%rbx)
	jmp	.L73
.L70:
	movsd	(%r12), %xmm0
	movsd	%xmm0, (%rbx)
	movq	name_float(%rip), %rax
	movq	%rax, 8(%rbx)
	jmp	.L73
.L69:
	movq	%r12, (%rbx)
	movq	name_string(%rip), %rax
	movq	%rax, 8(%rbx)
	jmp	.L73
.L68:
	movzbl	(%r12), %eax
	movb	%al, (%rbx)
	movq	name_bool(%rip), %rax
	movq	%rax, 8(%rbx)
	jmp	.L73
.L67:
	movq	$0, (%rbx)
	movq	name_void(%rip), %rax
	movq	%rax, 8(%rbx)
	jmp	.L73
.L66:
	movq	%r12, (%rbx)
	jmp	.L73
.L64:
	movq	%r12, (%rbx)
	movq	16(%r12), %rax
	movq	%rax, 8(%rbx)
	jmp	.L73
.L63:
	movl	%ebp, %ecx
	leaq	.LC4(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L73
	.size	create_arg, .-create_arg
	.type	load_rvalue, @function
load_rvalue:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	testq	%rdi, %rdi
	je	.L76
	movq	%rsi, %rbp
	cmpb	$0, 20(%rdi)
	jne	.L78
.L76:
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
.L78:
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
	jmp	.L76
	.size	load_rvalue, .-load_rvalue
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"[warning] Unsupported symbol kind for import: %d\n"
	.text
	.globl	tac_import
	.type	tac_import, @function
tac_import:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	movq	(%rdi), %rbp
	movl	32(%rbp), %ecx
	cmpl	$3, %ecx
	je	.L85
	leal	-1(%rcx), %eax
	cmpl	$1, %eax
	jbe	.L86
	testl	%ecx, %ecx
	jne	.L83
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
.L79:
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
.L85:
	movq	0(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$118, %edx
	movq	%rbp, %rdi
	call	create_var
	movq	%rax, %rsi
	movq	16(%rbx), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L79
.L86:
	movq	0(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$102, %edx
	movq	%rbp, %rdi
	call	create_var
	movq	%rax, %rsi
	movq	16(%rbx), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L79
.L83:
	leaq	.LC5(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L79
	.size	tac_import, .-tac_import
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"Error: create_attribute received NULL table or attributes list\n"
	.align 8
.LC7:
	.string	"[warning] Unsupported variable type for tac_variable: %d\n"
	.text
	.globl	tac_variable
	.type	tac_variable, @function
tac_variable:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movl	%edx, %ecx
	leal	-97(%rdx), %eax
	cmpl	$21, %eax
	ja	.L88
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	movl	%eax, %eax
	leaq	.L90(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
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
	movq	(%rdi), %rsi
	movq	8(%rdi), %rdi
	movq	%rbx, %rcx
	movl	$112, %edx
	call	create_var
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	16(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L87:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L92:
	movq	(%rdi), %rsi
	movq	8(%rdi), %rdi
	movq	%rbx, %rcx
	movl	$102, %edx
	call	create_var
	movq	%rax, %rsi
	movq	(%rbx), %rax
	movq	16(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L87
.L93:
	movq	(%rsi), %rax
	movq	(%rax), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	(%rbx), %rax
	movq	(%rax), %rdi
	movq	%r12, %rsi
	call	*list_append@GOTPCREL(%rip)
	movq	0(%rbp), %r13
	movq	8(%rbp), %r14
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%rbx, %rcx
	movl	$97, %edx
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	create_var
	movq	%rax, 0(%rbp)
	movq	%r13, 8(%rbp)
	movq	$0, 16(%rbp)
	movq	16(%r12), %rax
	movq	%rax, 16(%rbp)
	movq	%r13, %rdi
	call	get_type_size
	addq	%rax, 16(%r12)
	movq	(%r12), %rdi
	testq	%rdi, %rdi
	je	.L96
	movq	%rbp, %rsi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L87
.L96:
	movq	stderr(%rip), %rcx
	movl	$63, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L87
.L88:
	leaq	.LC7(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L87
	.size	tac_variable, .-tac_variable
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"[warning] Unsupported variable access with NULL base\n"
	.align 8
.LC9:
	.string	"[warning] Failed to generate variable access for base\n"
	.align 8
.LC10:
	.string	"[warning] Attempting to access attribute of non-object type: %s\n"
	.align 8
.LC11:
	.string	"[warning] Attribute '%s' not found in type '%s'\n"
	.align 8
.LC12:
	.string	"[warning] Symbol '%s' in type '%s' is not an attribute\n"
	.align 8
.LC13:
	.string	"[warning] Attempting to index non-array type: %s\n"
	.section	.rodata.str1.1
.LC14:
	.string	"arr"
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	"[warning] Failed to generate variable access for index\n"
	.align 8
.LC16:
	.string	"[warning] Attempting to call non-function, kind: %u, type name: %s\n"
	.align 8
.LC17:
	.string	"[warning] Unsupported variable access type for tac_variable_access: %u\n"
	.text
	.globl	tac_variable_access
	.type	tac_variable_access, @function
tac_variable_access:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$16, %rsp
	movq	%rdi, %r12
	movq	%rsi, %rbx
	cmpl	$0, 16(%rdi)
	jne	.L98
	movq	8(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L98
	movl	32(%rdi), %eax
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L99
	movq	(%rdi), %rsi
	movq	%rbx, %rcx
	movl	$118, %edx
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, %rbp
.L97:
	movq	%rbp, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L99:
	movq	(%rdi), %rsi
	movq	%rbx, %rcx
	movl	$102, %edx
	call	create_var
	movq	%rax, %rsi
	movl	$7, %edi
	call	create_arg
	movq	%rax, %rbp
	jmp	.L97
.L98:
	movq	(%r12), %rbp
	testq	%rbp, %rbp
	je	.L121
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	tac_variable_access
	movq	%rax, %rdi
	movq	%rbx, %rsi
	call	load_rvalue
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L122
	movl	16(%r12), %ecx
	cmpl	$2, %ecx
	je	.L123
	cmpl	$3, %ecx
	je	.L124
	cmpl	$1, %ecx
	jne	.L113
	movl	16(%rax), %ecx
	testl	%ecx, %ecx
	jne	.L114
	movq	8(%rax), %rax
	cmpl	$0, 32(%rax)
	je	.L125
.L115:
	movq	8(%r13), %rax
	movq	8(%rax), %r8
	leaq	.LC16(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %ebp
	jmp	.L97
.L121:
	movq	stderr(%rip), %rcx
	movl	$53, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L97
.L122:
	movq	stderr(%rip), %rcx
	movl	$54, %edx
	movl	$1, %esi
	leaq	.LC9(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, %rbp
	jmp	.L97
.L123:
	movq	8(%rax), %rax
	movl	32(%rax), %edx
	leal	-1(%rdx), %ecx
	cmpl	$1, %ecx
	jbe	.L126
	movq	24(%rax), %rdi
	testl	%edx, %edx
	jne	.L105
	movq	16(%rdi), %rdi
.L105:
	movq	8(%r12), %rax
	movq	8(%rax), %rsi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L127
	movl	32(%rax), %eax
	leal	-1(%rax), %edx
	cmpl	$1, %edx
	jbe	.L128
	cmpl	$5, %eax
	jne	.L129
	movq	0(%rbp), %rsi
	movq	%rbx, %rcx
	movl	$116, %edx
	movl	$0, %edi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, %rbp
	movq	8(%r12), %rdi
	movq	(%rdi), %rsi
	movq	%rbx, %rcx
	movl	$97, %edx
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, %rcx
	movq	%r13, %rdx
	movq	%rbp, %rsi
	movl	$15, %edi
	call	create_instruction
	movq	%rax, %rsi
	movb	$1, 20(%rbp)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L97
.L126:
	movq	8(%rax), %rcx
	leaq	.LC10(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %ebp
	jmp	.L97
.L127:
	movq	8(%r13), %rax
	movq	8(%r12), %rdx
	movq	8(%rdx), %rcx
	movq	8(%rax), %r8
	leaq	.LC11(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L97
.L128:
	movq	0(%rbp), %rsi
	movq	%rbx, %rcx
	movl	$102, %edx
	movq	%rbp, %rdi
	call	create_var
	movq	%rax, %rsi
	movl	$7, %edi
	call	create_arg
	movq	%rax, %rbp
	jmp	.L97
.L129:
	movq	8(%r13), %rax
	movq	8(%r12), %rdx
	movq	8(%rdx), %rcx
	movq	8(%rax), %r8
	leaq	.LC12(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %ebp
	jmp	.L97
.L124:
	movq	8(%rax), %rdx
	movl	32(%rdx), %eax
	subl	$3, %eax
	cmpl	$2, %eax
	ja	.L130
	movq	8(%rdx), %rbp
	leaq	.LC14(%rip), %rsi
	movq	%rbp, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L131
	movq	8(%r12), %rdi
	movq	%rbx, %rsi
	call	tac_expression
	movq	%rax, %rdi
	movq	%rbx, %rsi
	call	load_rvalue
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L132
	movq	8(%r13), %rax
	movq	(%rax), %rsi
	movq	%rbx, %rcx
	movl	$116, %edx
	movl	$0, %edi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, %rbp
	movq	%r12, %rcx
	movq	%r13, %rdx
	movq	%rax, %rsi
	movl	$16, %edi
	call	create_instruction
	movq	%rax, %rsi
	movb	$1, 20(%rbp)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L97
.L130:
	movq	8(%rdx), %rcx
	leaq	.LC13(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %ebp
	jmp	.L97
.L131:
	movq	%rbp, %rcx
	leaq	.LC13(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %ebp
	jmp	.L97
.L132:
	movq	stderr(%rip), %rcx
	movl	$55, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r12, %rbp
	jmp	.L97
.L125:
	movq	8(%rax), %rdi
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	8(%r13), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rdi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	%rax, %rdi
	movq	(%rax), %rsi
	movq	%rbx, %rcx
	movl	$102, %edx
	call	create_var
	movq	%rax, %rsi
	movl	$7, %edi
	call	create_arg
	movq	%rax, %r13
.L114:
	movl	16(%r13), %ecx
	cmpl	$7, %ecx
	jne	.L115
	movq	8(%r12), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	$0, (%rsp)
	leaq	8(%rsp), %r12
	jmp	.L118
.L119:
	movq	%rbx, %rsi
	call	tac_expression
	movq	%rax, %r14
	movq	8(%rax), %rdi
	call	get_type_size
	movq	%rax, 8(%rsp)
	movq	%r12, %rsi
	movl	$1, %edi
	call	create_arg
	movq	%rax, %rsi
	movl	$0, %ecx
	movq	%r14, %rdx
	movl	$17, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	addq	$1, (%rsp)
.L118:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L119
	movq	8(%r13), %rsi
	movq	%rbx, %rcx
	movl	$116, %edx
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, %rbp
	movq	%rsp, %rsi
	movl	$1, %edi
	call	create_arg
	movq	%rax, %rcx
	movq	%r13, %rdx
	movq	%rbp, %rsi
	movl	$22, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L97
.L113:
	leaq	.LC17(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %ebp
	jmp	.L97
	.size	tac_variable_access, .-tac_variable_access
	.section	.rodata.str1.8
	.align 8
.LC19:
	.string	"[warning] Unsupported type for negation: %s\n"
	.align 8
.LC20:
	.string	"[warning] Unsupported primary type for tac_primary: %d\n"
	.text
	.globl	tac_primary
	.type	tac_primary, @function
tac_primary:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$16, %rsp
	movl	8(%rdi), %ecx
	cmpl	$8, %ecx
	ja	.L134
	movq	%rsi, %rbx
	movl	%ecx, %ecx
	leaq	.L136(%rip), %rdx
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
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
	movq	(%rdi), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	*strtoll@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	leaq	8(%rsp), %rsi
	movl	$1, %edi
	call	create_arg
	movq	%rax, %rbp
.L133:
	movq	%rbp, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
.L143:
	movq	(%rdi), %rdi
	movl	$0, %esi
	call	*strtod@GOTPCREL(%rip)
	movsd	%xmm0, 8(%rsp)
	leaq	8(%rsp), %rsi
	movl	$2, %edi
	call	create_arg
	movq	%rax, %rbp
	jmp	.L133
.L142:
	movq	(%rdi), %rsi
	movl	$3, %edi
	call	create_arg
	movq	%rax, %rbp
	jmp	.L133
.L141:
	movb	$1, 8(%rsp)
	leaq	8(%rsp), %rsi
	movl	$4, %edi
	call	create_arg
	movq	%rax, %rbp
	jmp	.L133
.L140:
	movb	$0, 8(%rsp)
	leaq	8(%rsp), %rsi
	movl	$4, %edi
	call	create_arg
	movq	%rax, %rbp
	jmp	.L133
.L139:
	movq	(%rdi), %rdi
	call	tac_expression
	movq	%rax, %rbp
	jmp	.L133
.L138:
	movq	(%rdi), %rdi
	call	tac_primary
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
	jmp	.L133
.L137:
	movq	(%rdi), %rdi
	call	tac_primary
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
	movq	.LC18(%rip), %rax
	movq	%rax, 8(%rsp)
	movq	8(%r12), %rax
	cmpq	name_int(%rip), %rax
	je	.L151
	cmpq	name_float(%rip), %rax
	je	.L152
	movq	8(%rax), %rcx
	leaq	.LC19(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %ebp
	jmp	.L133
.L151:
	movq	%rsp, %rsi
	movl	$1, %edi
	call	create_arg
	movq	%rax, %rdx
	movq	%r12, %rcx
	movq	%rbp, %rsi
	movl	$1, %edi
	call	create_instruction
	movq	%rax, %rsi
	jmp	.L147
.L152:
	leaq	8(%rsp), %rsi
	movl	$2, %edi
	call	create_arg
	movq	%rax, %rdx
	movq	%r12, %rcx
	movq	%rbp, %rsi
	movl	$2, %edi
	call	create_instruction
	movq	%rax, %rsi
.L147:
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L133
.L135:
	movq	(%rdi), %rdi
	call	tac_variable_access
	movq	%rax, %rbp
	jmp	.L133
.L134:
	leaq	.LC20(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %ebp
	jmp	.L133
	.size	tac_primary, .-tac_primary
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"[warning] Left-hand side of assignment is not a variable\n"
	.text
	.globl	tac_expression
	.type	tac_expression, @function
tac_expression:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	cmpl	$19, 24(%rdi)
	je	.L181
	movq	16(%rdi), %rdi
	call	tac_expression
	movq	%rax, %rdi
	movq	%rbx, %rsi
	call	load_rvalue
	movq	%rax, %r14
	movl	24(%rbp), %r13d
	cmpl	$18, %r13d
	ja	.L156
	movl	%r13d, %eax
	leaq	.L158(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
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
	movq	8(%rdi), %rdi
	call	tac_primary
	movq	%rax, %rbp
	jmp	.L153
.L159:
	movl	$3, %r13d
.L160:
	movq	0(%rbp), %rdi
	movq	%rbx, %rsi
	call	tac_expression
	movq	%rax, %r12
	movl	24(%rbp), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	jbe	.L175
.L172:
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
	jmp	.L174
.L157:
	movl	$4, %r13d
	jmp	.L160
.L156:
	movl	$25, %r13d
	jmp	.L160
.L162:
	movq	0(%rbp), %rdi
	movq	%rbx, %rsi
	call	tac_expression
	movq	%rax, %r12
	movl	24(%rbp), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L178
	movl	$0, %r13d
.L175:
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
.L176:
	cmpl	$0, 16(%r12)
	jne	.L182
.L173:
	movl	$0, %ecx
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movl	$14, %edi
	call	create_instruction
	movq	%rax, %rsi
	cmpb	$0, 20(%r12)
	jne	.L183
.L174:
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L153:
	movq	%rbp, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L182:
	movq	stderr(%rip), %rcx
	movl	$57, %edx
	movl	$1, %esi
	leaq	.LC21(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L173
.L183:
	movl	$0, %ecx
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movl	$24, %edi
	call	create_instruction
	movq	%rax, %rsi
	jmp	.L174
.L178:
	movl	$0, %r13d
	jmp	.L172
.L161:
	movl	$1, %r13d
	jmp	.L160
.L177:
	movl	$2, %r13d
	jmp	.L160
.L163:
	movq	0(%rbp), %rdi
	movq	%rbx, %rsi
	call	tac_expression
	movq	%rax, %r12
	movl	24(%rbp), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L184
	movq	%r14, %rbp
	jmp	.L176
.L184:
	movl	$14, %r13d
	jmp	.L172
	.size	tac_expression, .-tac_expression
	.globl	tac_if
	.type	tac_if, @function
tac_if:
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
	je	.L186
	movq	24(%r14), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	movq	%rbp, 24(%rsp)
	testb	%al, %al
	jne	.L187
.L186:
	movq	%rbx, %rcx
	movl	$98, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_var
	movq	%rax, 24(%rsp)
.L187:
	movq	24(%rsp), %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, 16(%rsp)
	movq	(%r14), %rdi
	movq	%rbx, %rsi
	call	tac_expression
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
	jmp	.L188
.L189:
	movq	%rbx, %rsi
	call	tac_statement
.L188:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L189
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
	je	.L202
.L190:
	movq	24(%r14), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L203
.L196:
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
.L202:
	movq	16(%r14), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r15
	jmp	.L191
.L204:
	movq	24(%r14), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	cmovne	24(%rsp), %rbp
	jmp	.L192
.L194:
	movq	%rbx, %rsi
	call	tac_statement
.L193:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L194
	movl	$0, %ecx
	movl	$0, %edx
	movq	16(%rsp), %rsi
	movl	$20, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L191:
	movq	%r15, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L190
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
	call	tac_expression
	movq	%rax, 8(%rsp)
	movq	%r15, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L204
.L192:
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
	jmp	.L193
.L203:
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
	jmp	.L197
.L198:
	movq	%rbx, %rsi
	call	tac_statement
.L197:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L198
	movl	$0, %ecx
	movl	$0, %edx
	movq	16(%rsp), %rsi
	movl	$20, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L196
	.size	tac_if, .-tac_if
	.section	.rodata.str1.8
	.align 8
.LC22:
	.string	"[warning] 'break' statement used outside of loop\n"
	.align 8
.LC23:
	.string	"[warning] 'continue' statement used outside of loop\n"
	.align 8
.LC24:
	.string	"[warning] Unsupported statement type for tac_statement: %d\n"
	.text
	.globl	tac_statement
	.type	tac_statement, @function
tac_statement:
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movl	8(%rdi), %ecx
	cmpl	$7, %ecx
	ja	.L206
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	movl	%ecx, %ecx
	leaq	.L208(%rip), %rdx
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
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
	movq	(%rdi), %rdi
	call	tac_expression
.L205:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.L214:
	movq	(%rdi), %rdi
	movl	$118, %edx
	call	tac_variable
	jmp	.L205
.L213:
	movq	(%rdi), %rdi
	call	tac_if
	jmp	.L205
.L212:
	movq	(%rdi), %rdi
	call	tac_while
	jmp	.L205
.L211:
	movq	(%rdi), %rdi
	call	tac_for
	jmp	.L205
.L210:
	movl	$0, %esi
	movl	$5, %edi
	call	create_arg
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L217
	movq	%rbp, %rsi
	call	tac_expression
.L217:
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$21, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L205
.L209:
	movq	32(%rsi), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L218
	movq	32(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rsi
	testq	%rsi, %rsi
	je	.L218
	movl	$0, %ecx
	movl	$0, %edx
	movl	$20, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L205
.L218:
	movq	stderr(%rip), %rcx
	movl	$49, %edx
	movl	$1, %esi
	leaq	.LC22(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L205
.L207:
	movq	40(%rsi), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L219
	movq	40(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rsi
	testq	%rsi, %rsi
	je	.L219
	movl	$0, %ecx
	movl	$0, %edx
	movl	$20, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L205
.L219:
	movq	stderr(%rip), %rcx
	movl	$52, %edx
	movl	$1, %esi
	leaq	.LC23(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L205
.L206:
	leaq	.LC24(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L205
	.size	tac_statement, .-tac_statement
	.globl	tac_for
	.type	tac_for, @function
tac_for:
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
	je	.L222
	movl	$118, %edx
	call	tac_variable
.L222:
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
	je	.L223
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
	call	tac_expression
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
.L224:
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
	je	.L225
	movq	%rax, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rsi
	movq	40(%rbx), %rdi
	call	*list_append@GOTPCREL(%rip)
.L226:
	movq	%r14, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rsi
	movq	32(%rbx), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	24(%r12), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L228
.L223:
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
	jmp	.L224
.L225:
	cmpq	$0, 8(%r12)
	je	.L227
	movq	%r13, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rsi
	movq	40(%rbx), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L226
.L227:
	movq	%r15, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rsi
	movq	40(%rbx), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L226
.L229:
	movq	%rbx, %rsi
	call	tac_statement
.L228:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L229
	movq	40(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	32(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	cmpq	$0, 16(%r12)
	je	.L230
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
	call	tac_expression
.L230:
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
	je	.L233
.L231:
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
.L233:
	movq	%r15, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rsi
	movl	$0, %ecx
	movl	$0, %edx
	movl	$20, %edi
	call	create_instruction
	movq	%rax, %rsi
	jmp	.L231
	.size	tac_for, .-tac_for
	.globl	tac_while
	.type	tac_while, @function
tac_while:
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
	call	tac_expression
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
	movq	40(%rbx), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r12, %rsi
	movl	$6, %edi
	call	create_arg
	movq	%rax, %rsi
	movq	32(%rbx), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	8(%r13), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r13
	jmp	.L235
.L236:
	movq	%rbx, %rsi
	call	tac_statement
.L235:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L236
	movq	40(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	32(%rbx), %rdi
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
	.size	tac_while, .-tac_while
	.globl	tac_function
	.type	tac_function, @function
tac_function:
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
	jmp	.L239
.L240:
	movq	(%rax), %rsi
	movq	8(%rax), %rdi
	movq	%rbx, %rcx
	movl	$112, %edx
	call	create_var
	movq	%rax, %rsi
	movq	16(%rbp), %rdi
	call	*list_append@GOTPCREL(%rip)
.L239:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L240
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
	jmp	.L241
.L242:
	movq	%rbx, %rsi
	call	tac_statement
.L241:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L242
	movq	$0, 8(%rbx)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	tac_function, .-tac_function
	.globl	tac_method
	.type	tac_method, @function
tac_method:
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
	jmp	.L245
.L246:
	movq	(%rax), %rsi
	movq	8(%rax), %rdi
	movq	%rbx, %rcx
	movl	$112, %edx
	call	create_var
	movq	%rax, %rsi
	movq	16(%rbp), %rdi
	call	*list_append@GOTPCREL(%rip)
.L245:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L246
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
	movq	24(%rbx), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdi
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	0(%r13), %rax
	movq	8(%rax), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L251
.L247:
	movq	24(%r13), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L248
.L251:
	movq	24(%rbx), %rax
	movq	(%rax), %rsi
	movq	%rbx, %rcx
	movl	$116, %edx
	movl	$0, %edi
	call	create_var
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_arg
	movq	%rax, %rbp
	movq	24(%rbx), %rax
	leaq	24(%rax), %rsi
	movl	$1, %edi
	call	create_arg
	movq	%rax, %rdx
	movl	$0, %ecx
	movq	%rbp, %rsi
	movl	$18, %edi
	call	create_instruction
	movq	%rax, %rsi
	movq	8(%r12), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L247
.L249:
	movq	%rbx, %rsi
	call	tac_statement
.L248:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L249
	movq	$0, 8(%rbx)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	tac_method, .-tac_method
	.section	.rodata.str1.8
	.align 8
.LC25:
	.string	"[warning] Unsupported class member type for tac_class: %d\n"
	.text
	.globl	tac_class
	.type	tac_class, @function
tac_class:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %r13
	movq	%rsi, %rbp
	movq	%rdi, 24(%rsi)
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
	leaq	.LC25(%rip), %r12
	jmp	.L253
.L254:
	movq	(%rax), %rdi
	movq	%rbp, %rsi
	call	tac_method
.L253:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L261
	movl	8(%rax), %ecx
	testl	%ecx, %ecx
	je	.L254
	cmpl	$1, %ecx
	je	.L255
	movq	%r12, %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L253
.L255:
	movq	(%rax), %rdi
	movl	$97, %edx
	movq	%rbp, %rsi
	call	tac_variable
	jmp	.L253
.L261:
	movq	$0, 24(%rbp)
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	tac_class, .-tac_class
	.section	.rodata.str1.1
.LC26:
	.string	"main"
	.text
	.globl	tac_code
	.type	tac_code, @function
tac_code:
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
	movl	$96, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%r13, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 32(%rbp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 40(%rbp)
	movq	$0, 48(%rbp)
	movq	$0, 56(%rbp)
	movq	$0, 64(%rbp)
	movq	$0, 72(%rbp)
	movq	$0, 80(%rbp)
	movq	$0, 88(%rbp)
	movq	(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
	leaq	.LC26(%rip), %r14
	jmp	.L263
.L270:
	movq	(%rbx), %rdi
	movq	%rbp, %rsi
	call	tac_function
	movq	(%rbx), %rax
	movq	(%rax), %rbx
	movq	8(%rbx), %rdi
	movq	%r14, %rsi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L263
	movq	%rbx, 8(%r13)
	jmp	.L263
.L271:
	movq	(%rbx), %rdi
	movq	%rbp, %rsi
	call	tac_class
.L263:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
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
	movq	(%rbx), %rdi
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	tac_import
	jmp	.L263
.L269:
	movq	%r13, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	tac_code, .-tac_code
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC18:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
