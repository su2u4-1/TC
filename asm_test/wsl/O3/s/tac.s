	.file	"tac.c"
	.text
	.p2align 4
	.type	search_var, @function
search_var:
	pushq	%r13
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	8(%rsi), %rax
	testq	%rax, %rax
	je	.L7
	movq	24(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L5
.L11:
	movq	8(%r12), %rax
	testq	%rax, %rax
	je	.L7
	movq	16(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L31
.L7:
	cmpq	$0, 24(%r12)
	movq	(%r12), %rax
	je	.L4
	movq	(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L27
.L29:
	movq	(%r12), %rax
.L4:
	movq	16(%rax), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L15
	movq	(%r12), %rax
	movq	16(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L23:
	cmpq	%rbp, (%rax)
	je	.L1
.L22:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L23
.L15:
	xorl	%eax, %eax
.L1:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L27:
	movq	(%r12), %rax
	movq	(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r13
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L21:
	movq	24(%r12), %rax
	movq	(%rax), %rax
	cmpq	%rax, 8(%rbx)
	je	.L32
.L17:
	movq	%r13, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L21
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L5:
	movq	8(%r12), %rax
	movq	24(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L10:
	cmpq	%rbp, (%rax)
	je	.L1
.L8:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L10
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L31:
	movq	8(%r12), %rax
	movq	16(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L13:
	cmpq	%rbp, (%rax)
	je	.L1
.L12:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L13
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L32:
	movq	(%rbx), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L17
	movq	(%rbx), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L20:
	movq	(%rax), %rax
	cmpq	%rbp, (%rax)
	je	.L1
.L19:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L20
	jmp	.L17
	.size	search_var, .-search_var
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	""
.LC1:
	.string	"$%d-error"
.LC2:
	.string	"$%c%zu"
	.text
	.p2align 4
	.type	create_var.part.0, @function
create_var.part.0:
	pushq	%r14
	movq	%rdi, %r14
	movl	$24, %edi
	pushq	%r13
	movq	%rsi, %r13
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rbp
	pushq	%rbx
	movl	%edx, %ebx
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, (%rax)
	movq	%rax, %rbp
	leal	-97(%rbx), %eax
	cmpl	$21, %eax
	ja	.L34
	leaq	.L36(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L36:
	.long	.L41-.L36
	.long	.L40-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L39-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L38-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L37-.L36
	.long	.L34-.L36
	.long	.L35-.L36
	.text
	.p2align 4,,10
	.p2align 3
.L34:
	leaq	.LC0(%rip), %rdi
	movl	$32, %esi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%rbp)
	movq	%rax, %rdi
.L42:
	movl	%ebx, %r8d
	andl	$-3, %ebx
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC1(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	%r13, 16(%rbp)
	cmpl	$116, %ebx
	je	.L48
.L33:
	popq	%rbx
	movq	%rbp, %rax
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L41:
	movq	48(%r12), %r14
	leaq	1(%r14), %rax
	movq	%rax, 48(%r12)
	.p2align 4,,10
	.p2align 3
.L43:
	leaq	.LC0(%rip), %rdi
	movl	$32, %esi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%rbp)
	movq	%rax, %rdi
	cmpq	$-1, %r14
	je	.L42
	movl	%ebx, %r8d
	andl	$-3, %ebx
	movq	%r14, %r9
	movq	$-1, %rdx
	leaq	.LC2(%rip), %rcx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	%r13, 16(%rbp)
	cmpl	$116, %ebx
	jne	.L33
.L48:
	movq	8(%r12), %rax
	movq	%rbp, %rsi
	movq	24(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	popq	%rbx
	movq	%rbp, %rax
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L40:
	movq	80(%r12), %r14
	leaq	1(%r14), %rax
	movq	%rax, 80(%r12)
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L39:
	movq	88(%r12), %r14
	leaq	1(%r14), %rax
	movq	%rax, 88(%r12)
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L38:
	movq	56(%r12), %r14
	leaq	1(%r14), %rax
	movq	%rax, 56(%r12)
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L37:
	movq	72(%r12), %r14
	leaq	1(%r14), %rax
	movq	%rax, 72(%r12)
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L35:
	movq	64(%r12), %r14
	leaq	1(%r14), %rax
	movq	%rax, 64(%r12)
	jmp	.L43
	.size	create_var.part.0, .-create_var.part.0
	.p2align 4
	.type	create_var.part.0.constprop.0, @function
create_var.part.0.constprop.0:
	pushq	%r12
	pushq	%rbp
	movq	%rdi, %rbp
	movl	$24, %edi
	pushq	%rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movq	80(%rbp), %r12
	movl	$32, %esi
	leaq	.LC0(%rip), %rdi
	movq	$0, (%rax)
	movq	%rax, %rbx
	leaq	1(%r12), %rax
	movq	%rax, 80(%rbp)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%rbx)
	movq	%rax, %rdi
	cmpq	$-1, %r12
	je	.L53
	movq	%r12, %r9
	movl	$98, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	$0, 16(%rbx)
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L53:
	movl	$98, %r8d
	leaq	.LC1(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	$0, 16(%rbx)
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	create_var.part.0.constprop.0, .-create_var.part.0.constprop.0
	.p2align 4
	.type	load_rvalue.part.0, @function
load_rvalue.part.0:
	pushq	%r14
	pushq	%r13
	movq	%rdi, %r13
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	pushq	%rbx
	movq	8(%rdi), %rbp
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	72(%r12), %r14
	movl	$32, %esi
	leaq	.LC0(%rip), %rdi
	movq	$0, (%rax)
	movq	%rax, %rbx
	leaq	1(%r14), %rax
	movq	%rax, 72(%r12)
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%rbx)
	movq	%rax, %rdi
	cmpq	$-1, %r14
	je	.L58
	movq	%r14, %r9
	movl	$116, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rcx
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
.L56:
	movq	8(%r12), %rax
	movq	%rbx, %rsi
	movq	%rbp, 16(%rbx)
	movq	24(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, %xmm0
	movl	$32, %edi
	movhps	16(%rbx), %xmm0
	movq	%rax, %rbp
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, 8(%rax)
	movq	%rax, %rsi
	movq	%rbp, (%rax)
	movl	$23, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%r12), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	popq	%rbx
	movq	%rbp, %rax
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L58:
	movl	$116, %r8d
	leaq	.LC1(%rip), %rcx
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__sprintf_chk@GOTPCREL(%rip)
	jmp	.L56
	.size	load_rvalue.part.0, .-load_rvalue.part.0
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"[Warning] Unsupported variable access with NULL base\n"
	.align 8
.LC4:
	.string	"[Warning] Failed to generate variable access for base\n"
	.align 8
.LC5:
	.string	"[Warning] Attempting to access attribute of non-object type: %s\n"
	.align 8
.LC6:
	.string	"[Warning] Attribute '%s' not found in type '%s'\n"
	.align 8
.LC7:
	.string	"[Warning] Attempting to access function '%s' as attribute of type '%s'\n"
	.align 8
.LC8:
	.string	"[Warning] Symbol '%s' in type '%s' is not an attribute\n"
	.section	.rodata.str1.1
.LC9:
	.string	"arr"
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"[Warning] Attempting to index non-array type: %s\n"
	.align 8
.LC11:
	.string	"[Warning] Failed to generate variable access for index\n"
	.align 8
.LC12:
	.string	"[Warning] Attempting to call non-function, kind: %u, type name: %s\n"
	.align 8
.LC13:
	.string	"[Warning] Unsupported type for size lookup: %s\n"
	.align 8
.LC14:
	.string	"[Warning] Unsupported variable access type for tac_variable_access: %u\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB15:
	.text
.LHOTB15:
	.p2align 4
	.globl	tac_variable_access
	.type	tac_variable_access, @function
tac_variable_access:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$24, %rsp
	movl	16(%rdi), %eax
	testl	%eax, %eax
	jne	.L60
	movq	8(%rdi), %r12
	testq	%r12, %r12
	je	.L60
	movl	32(%r12), %eax
	leal	-1(%rax), %edx
	cmpl	$1, %edx
	jbe	.L154
	testl	%eax, %eax
	je	.L155
	movq	(%r12), %r13
	xorl	%r14d, %r14d
	movl	32(%r13), %eax
	testl	%eax, %eax
	jne	.L69
	movq	24(%r13), %rax
	movq	24(%rsi), %r14
	movq	%rax, 24(%rsi)
.L69:
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	search_var
	movq	%rax, %rbp
	movl	32(%r13), %eax
	testl	%eax, %eax
	jne	.L70
	movq	%r14, 24(%rbx)
.L70:
	testq	%rbp, %rbp
	jne	.L71
	movq	%rbx, %rcx
	movl	$118, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	create_var.part.0
	movq	%rax, %rbp
.L71:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, %xmm0
	movhps	16(%rbp), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r12
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L59
	.p2align 4,,10
	.p2align 3
.L60:
	movq	0(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L156
	movq	%rbx, %rsi
	call	tac_variable_access
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L76
	cmpb	$0, 20(%rax)
	jne	.L157
.L75:
	movl	16(%rbp), %ecx
	cmpl	$2, %ecx
	je	.L158
	cmpl	$3, %ecx
	je	.L159
	cmpl	$1, %ecx
	jne	.L98
	movl	16(%r13), %ecx
	testl	%ecx, %ecx
	jne	.L99
	movq	8(%r13), %rax
	movl	32(%rax), %edi
	testl	%edi, %edi
	je	.L160
.L100:
	movq	8(%rax), %r8
	movq	stderr(%rip), %rdi
	leaq	.LC12(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
.L73:
	xorl	%r12d, %r12d
.L59:
	addq	$24, %rsp
	movq	%r12, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L158:
	movq	8(%r13), %rax
	movl	32(%rax), %edx
	leal	-1(%rdx), %ecx
	cmpl	$1, %ecx
	jbe	.L161
	movq	24(%rax), %rdi
	testl	%edx, %edx
	jne	.L79
	movq	16(%rdi), %rdi
.L79:
	movq	8(%rbp), %rax
	movq	8(%rax), %rsi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L162
	movl	32(%rax), %eax
	cmpl	$1, %eax
	je	.L163
	cmpl	$2, %eax
	je	.L164
	cmpl	$5, %eax
	jne	.L165
	movq	(%r12), %rsi
	movl	$116, %edx
	movq	%rbx, %rcx
	xorl	%edi, %edi
	call	create_var.part.0
	movl	$24, %edi
	movq	%rax, %r14
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, %xmm0
	xorl	%edx, %edx
	movhps	16(%r14), %xmm0
	movb	$0, 20(%rax)
	movq	%rax, %r12
	movups	%xmm0, (%rax)
	movq	8(%rbp), %r15
	movl	$0, 16(%rax)
	movq	(%r15), %r14
	movl	32(%r14), %r9d
	testl	%r9d, %r9d
	jne	.L90
	movq	24(%r14), %rax
	movq	24(%rbx), %rdx
	movq	%rax, 24(%rbx)
.L90:
	movq	%rbx, %rsi
	movq	%r15, %rdi
	movq	%rdx, (%rsp)
	call	search_var
	movl	32(%r14), %r8d
	movq	%rax, %rbp
	testl	%r8d, %r8d
	jne	.L91
	movq	(%rsp), %rdx
	movq	%rdx, 24(%rbx)
.L91:
	testq	%rbp, %rbp
	je	.L166
.L92:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, %xmm0
	movl	$32, %edi
	movhps	16(%rbp), %xmm0
	movq	%rax, %r14
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, 8(%rax)
	movq	%rax, %rsi
	movq	%r12, (%rax)
	movq	%r14, 16(%rax)
	movl	$15, 24(%rax)
	movb	$1, 20(%r12)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L59
	.p2align 4,,10
	.p2align 3
.L155:
	movq	24(%r12), %rax
	movq	24(%rsi), %r13
	movq	%r12, %rdi
	movq	%rax, 24(%rsi)
	call	search_var
	movq	%rax, %rbp
	movl	32(%r12), %eax
	testl	%eax, %eax
	jne	.L67
	movq	%r13, 24(%rbx)
.L67:
	testq	%rbp, %rbp
	jne	.L71
	movq	%rbx, %rcx
	movl	$118, %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	create_var.part.0
	movq	%rax, %rbp
	jmp	.L71
	.p2align 4,,10
	.p2align 3
.L157:
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L75
	.p2align 4,,10
	.p2align 3
.L76:
	movq	stderr(%rip), %rcx
	movl	$54, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L73
	.p2align 4,,10
	.p2align 3
.L159:
	movq	8(%r13), %rax
	leaq	.LC9(%rip), %rsi
	movq	8(%rax), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L167
	movq	8(%rbp), %rdi
	movq	%rbx, %rsi
	call	tac_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L97
	cmpb	$0, 20(%rax)
	jne	.L168
.L96:
	movq	name_int(%rip), %rsi
	movq	%rbx, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	call	create_var.part.0
	movl	$24, %edi
	movq	%rax, %r14
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, %xmm0
	movl	$32, %edi
	movhps	16(%r14), %xmm0
	movq	%rax, %r12
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, 8(%rax)
	movq	%rax, %rsi
	movq	%r12, (%rax)
	movq	%rbp, 16(%rax)
	movl	$16, 24(%rax)
	movb	$1, 20(%r12)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L59
	.p2align 4,,10
	.p2align 3
.L99:
	leal	-7(%rcx), %eax
	cmpl	$1, %eax
	jbe	.L104
	movq	8(%r13), %rax
	jmp	.L100
	.p2align 4,,10
	.p2align 3
.L160:
	movq	8(%rax), %rdi
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi
	xorl	%r15d, %r15d
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	8(%r13), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rdi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	(%rax), %r14
	movq	%rax, %r13
	movl	32(%r14), %esi
	testl	%esi, %esi
	jne	.L101
	movq	24(%r14), %rax
	movq	24(%rbx), %r15
	movq	%rax, 24(%rbx)
.L101:
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	search_var
	movl	32(%r14), %ecx
	movq	%rax, %r12
	testl	%ecx, %ecx
	jne	.L102
	movq	%r15, 24(%rbx)
.L102:
	testq	%r12, %r12
	jne	.L103
	movq	%rbx, %rcx
	movl	$102, %edx
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	create_var.part.0
	movq	%rax, %r12
.L103:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r12, %xmm0
	movhps	16(%r12), %xmm0
	movl	$8, 16(%rax)
	movq	%rax, %r13
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
.L104:
	call	*create_list@GOTPCREL(%rip)
	cmpl	$8, 16(%r13)
	movq	%rax, (%rsp)
	je	.L105
.L107:
	xorl	%r14d, %r14d
.L106:
	movq	8(%rbp), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	jmp	.L113
	.p2align 4,,10
	.p2align 3
.L115:
	movq	8(%rbp), %rax
	xorl	%r12d, %r12d
	testq	%rax, %rax
	je	.L116
	cmpq	name_int(%rip), %rax
	je	.L117
	cmpq	name_float(%rip), %rax
	je	.L117
	cmpq	name_string(%rip), %rax
	je	.L117
	cmpq	name_bool(%rip), %rax
	movl	$1, %r12d
	je	.L116
	cmpq	name_void(%rip), %rax
	je	.L116
	movl	32(%rax), %edx
	testl	%edx, %edx
	jne	.L118
	movq	24(%rax), %rax
	movq	24(%rax), %r12
.L116:
	movl	$24, %edi
	addq	$1, %r14
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movl	$1, 16(%rax)
	movq	%rax, %r15
	movq	%r12, (%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%r15)
	movq	%rax, 8(%r15)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$17, 24(%rax)
	movq	%rax, %rsi
	movq	%r15, (%rax)
	movq	%rbp, 8(%rax)
	movq	$0, 16(%rax)
	call	*list_append@GOTPCREL(%rip)
.L113:
	movq	8(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L120
	movq	%rbx, %rsi
	call	tac_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L114
	cmpb	$0, 20(%rax)
	je	.L115
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %rbp
	jmp	.L115
	.p2align 4,,10
	.p2align 3
.L121:
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L120:
	movq	(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L121
	movq	8(%r13), %rsi
	movq	%rbx, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	call	create_var.part.0
	movl	$24, %edi
	movq	%rax, %rbp
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, %xmm0
	movl	$24, %edi
	movhps	16(%rbp), %xmm0
	movq	%rax, %r12
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%r14, (%rax)
	movq	%rax, %rbp
	movl	$1, 16(%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%rbp)
	movq	%rax, 8(%rbp)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, 8(%rax)
	movq	%rax, %rsi
	movq	%r12, (%rax)
	movq	%rbp, 16(%rax)
	movl	$22, 24(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L59
	.p2align 4,,10
	.p2align 3
.L163:
	movq	8(%r13), %rax
	movq	8(%rbp), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movq	8(%rdx), %rcx
	movq	8(%rax), %r8
	leaq	.LC7(%rip), %rdx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L154:
	movq	(%r12), %r13
	xorl	%r14d, %r14d
	movl	32(%r13), %eax
	testl	%eax, %eax
	jne	.L82
	movq	24(%r13), %rax
	movq	24(%rbx), %r14
	movq	%rax, 24(%rbx)
.L82:
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	search_var
	movl	32(%r13), %r15d
	movq	%rax, %rbp
	testl	%r15d, %r15d
	jne	.L83
	movq	%r14, 24(%rbx)
.L83:
	testq	%rbp, %rbp
	je	.L169
.L84:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, %xmm0
	movhps	16(%rbp), %xmm0
	movl	$7, 16(%rax)
	movq	%rax, %r12
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L59
	.p2align 4,,10
	.p2align 3
.L165:
	movq	8(%r13), %rax
	movq	8(%rbp), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movq	8(%rdx), %rcx
	movq	8(%rax), %r8
	leaq	.LC8(%rip), %rdx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L73
	.p2align 4,,10
	.p2align 3
.L156:
	movq	stderr(%rip), %rcx
	movl	$53, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L73
	.p2align 4,,10
	.p2align 3
.L98:
	movq	stderr(%rip), %rdi
	leaq	.LC14(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L73
	.p2align 4,,10
	.p2align 3
.L169:
	movq	%rbx, %rcx
	movl	$102, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	create_var.part.0
	movq	%rax, %rbp
	jmp	.L84
	.p2align 4,,10
	.p2align 3
.L166:
	movq	%rbx, %rcx
	movl	$97, %edx
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	create_var.part.0
	movq	%rax, %rbp
	jmp	.L92
	.p2align 4,,10
	.p2align 3
.L118:
	movq	8(%rax), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC13(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L117:
	movl	$8, %r12d
	jmp	.L116
	.p2align 4,,10
	.p2align 3
.L167:
	movq	0(%r13), %rax
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	leaq	.LC10(%rip), %rdx
	movq	(%rax), %rax
	movq	8(%rax), %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L73
	.p2align 4,,10
	.p2align 3
.L168:
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L96
.L97:
	movq	stderr(%rip), %rcx
	movl	$55, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L73
	.p2align 4,,10
	.p2align 3
.L164:
	movq	(%r12), %r13
	xorl	%r14d, %r14d
	movl	32(%r13), %r11d
	testl	%r11d, %r11d
	jne	.L86
	movq	24(%r13), %rax
	movq	24(%rbx), %r14
	movq	%rax, 24(%rbx)
.L86:
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	search_var
	movl	32(%r13), %r10d
	movq	%rax, %rbp
	testl	%r10d, %r10d
	jne	.L87
	movq	%r14, 24(%rbx)
.L87:
	testq	%rbp, %rbp
	jne	.L88
	movq	%rbx, %rcx
	movl	$102, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	create_var.part.0
	movq	%rax, %rbp
.L88:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, %xmm0
	movhps	16(%rbp), %xmm0
	movl	$8, 16(%rax)
	movq	%rax, %r12
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L59
	.p2align 4,,10
	.p2align 3
.L105:
	movq	8(%r13), %rax
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi
	movq	8(%rax), %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	0(%r13), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L107
	movq	0(%rbp), %rax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$8, %edi
	movq	(%rax), %r8
	call	*create_primary@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$19, %edi
	movq	%rax, %rdx
	call	*create_expression@GOTPCREL(%rip)
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	tac_expression
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L108
	cmpb	$0, 20(%rax)
	jne	.L170
.L109:
	movq	8(%r15), %rax
	xorl	%edx, %edx
	testq	%rax, %rax
	je	.L110
	cmpq	name_int(%rip), %rax
	je	.L111
	cmpq	name_float(%rip), %rax
	je	.L111
	cmpq	name_string(%rip), %rax
	je	.L111
	cmpq	name_bool(%rip), %rax
	movl	$1, %edx
	je	.L110
	cmpq	name_void(%rip), %rax
	je	.L110
	cmpl	$0, 32(%rax)
	jne	.L112
	movq	24(%rax), %rax
	movq	24(%rax), %rdx
.L110:
	movq	%rdx, 8(%rsp)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	8(%rsp), %rdx
	movl	$32, %edi
	movq	%rax, %r14
	movl	$1, 16(%rax)
	movq	%rdx, (%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%r14)
	movq	%rax, 8(%r14)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movq	%r14, (%rax)
	movq	%rax, %rsi
	movl	$1, %r14d
	movl	$17, 24(%rax)
	movq	%r15, 8(%rax)
	movq	$0, 16(%rax)
	call	*list_append@GOTPCREL(%rip)
	jmp	.L106
	.p2align 4,,10
	.p2align 3
.L161:
	movq	8(%rax), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC5(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L73
.L162:
	movq	8(%r13), %rax
	movq	8(%rbp), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movq	8(%rdx), %rcx
	movq	8(%rax), %r8
	leaq	.LC6(%rip), %rdx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L73
.L170:
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %r15
	jmp	.L109
.L112:
	movq	8(%rax), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC13(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
.L111:
	movl	$8, %edx
	jmp	.L110
	.section	.text.unlikely
	.type	tac_variable_access.cold, @function
tac_variable_access.cold:
.L108:
	movq	8, %rax
	ud2
.L114:
	movq	8, %rax
	ud2
	.text
	.size	tac_variable_access, .-tac_variable_access
	.section	.text.unlikely
	.size	tac_variable_access.cold, .-tac_variable_access.cold
.LCOLDE15:
	.text
.LHOTE15:
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"[Warning] Unsupported type for negation: %s\n"
	.align 8
.LC18:
	.string	"[Warning] Unsupported primary type for tac_primary: %d\n"
	.section	.text.unlikely
.LCOLDB19:
	.text
.LHOTB19:
	.p2align 4
	.globl	tac_primary
	.type	tac_primary, @function
tac_primary:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$24, %rsp
	movl	8(%rdi), %ecx
	cmpl	$8, %ecx
	ja	.L172
	leaq	.L174(%rip), %rdx
	movq	%rsi, %rbp
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L174:
	.long	.L182-.L174
	.long	.L181-.L174
	.long	.L180-.L174
	.long	.L179-.L174
	.long	.L178-.L174
	.long	.L177-.L174
	.long	.L176-.L174
	.long	.L175-.L174
	.long	.L173-.L174
	.text
	.p2align 4,,10
	.p2align 3
.L175:
	movq	(%rdi), %rdi
	call	tac_primary
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L185
	cmpb	$0, 20(%rax)
	jne	.L195
.L186:
	movq	8(%r12), %rsi
	xorl	%edi, %edi
	movq	%rbp, %rcx
	movl	$116, %edx
	call	create_var.part.0
	movl	$24, %edi
	movq	%rax, %r13
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, %xmm0
	movhps	16(%r13), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	movq	8(%r12), %rax
	cmpq	name_int(%rip), %rax
	je	.L196
	cmpq	name_float(%rip), %rax
	je	.L197
	movq	8(%rax), %rcx
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	leaq	.LC17(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
.L199:
	addq	$24, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L173:
	movq	(%rdi), %rdi
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	tac_variable_access
	.p2align 4,,10
	.p2align 3
.L182:
	movq	(%rdi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	*strtoll@GOTPCREL(%rip)
	movl	$24, %edi
	movq	%rax, %rbp
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$1, 16(%rax)
	movq	%rax, %rbx
	movq	%rbp, (%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
.L171:
	addq	$24, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L181:
	movq	(%rdi), %rdi
	xorl	%esi, %esi
	call	*strtod@GOTPCREL(%rip)
	movl	$24, %edi
	movsd	%xmm0, 8(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movsd	8(%rsp), %xmm0
	movl	$2, 16(%rax)
	movq	%rax, %rbx
	movsd	%xmm0, (%rax)
	movq	name_float(%rip), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	addq	$24, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L180:
	movq	(%rdi), %xmm0
	movl	$24, %edi
	movq	%xmm0, 8(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	8(%rsp), %xmm0
	movl	$3, 16(%rax)
	movq	%rax, %rbx
	movhps	name_string(%rip), %xmm0
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	addq	$24, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L179:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$4, 16(%rax)
	movq	%rax, %rbx
	movb	$1, (%rax)
	movq	name_bool(%rip), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	addq	$24, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L178:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$4, 16(%rax)
	movq	%rax, %rbx
	movb	$0, (%rax)
	movq	name_bool(%rip), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	addq	$24, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L177:
	movq	(%rdi), %rdi
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	tac_expression
	.p2align 4,,10
	.p2align 3
.L176:
	movq	(%rdi), %rdi
	call	tac_primary
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L184
	cmpb	$0, 20(%rax)
	jne	.L198
.L184:
	movq	name_bool(%rip), %rsi
	movq	%rbp, %rcx
	movl	$116, %edx
	xorl	%edi, %edi
	call	create_var.part.0
	movl	$24, %edi
	movq	%rax, %r12
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r12, %xmm0
	movl	$32, %edi
	movhps	16(%r12), %xmm0
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	movl	$0, 16(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, 8(%rax)
	movq	%rax, %rsi
	movq	%rbx, (%rax)
	movl	$13, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	addq	$24, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L172:
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	leaq	.LC18(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L199
	.p2align 4,,10
	.p2align 3
.L197:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movl	$2, 16(%rax)
	movq	%rax, %r13
	movq	.LC16(%rip), %rax
	movb	$0, 20(%r13)
	movq	%rax, 0(%r13)
	movq	name_float(%rip), %rax
	movq	%rax, 8(%r13)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$2, 24(%rax)
	movq	%rax, %rsi
	movq	%rbx, (%rax)
	movq	%r13, 8(%rax)
	movq	%r12, 16(%rax)
.L188:
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L171
	.p2align 4,,10
	.p2align 3
.L195:
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %r12
	jmp	.L186
	.p2align 4,,10
	.p2align 3
.L198:
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %r13
	jmp	.L184
	.p2align 4,,10
	.p2align 3
.L196:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movl	$1, 16(%rax)
	movq	%rax, %r13
	movq	$0, (%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%r13)
	movq	%rax, 8(%r13)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$1, 24(%rax)
	movq	%rax, %rsi
	movq	%rbx, (%rax)
	movq	%r13, 8(%rax)
	movq	%r12, 16(%rax)
	jmp	.L188
	.section	.text.unlikely
	.type	tac_primary.cold, @function
tac_primary.cold:
.L185:
	movq	8, %rax
	ud2
	.text
	.size	tac_primary, .-tac_primary
	.section	.text.unlikely
	.size	tac_primary.cold, .-tac_primary.cold
.LCOLDE19:
	.text
.LHOTE19:
	.section	.rodata.str1.8
	.align 8
.LC20:
	.string	"[Warning] Left-hand side of assignment is not a variable\n"
	.text
	.p2align 4
	.globl	tac_expression
	.type	tac_expression, @function
tac_expression:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	subq	$8, %rsp
	cmpl	$19, 24(%rdi)
	je	.L221
	movq	16(%rdi), %rdi
	call	tac_expression
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L202
	cmpb	$0, 20(%rax)
	jne	.L222
.L202:
	movl	24(%r12), %eax
	movq	(%r12), %rdi
	cmpl	$18, %eax
	ja	.L203
	leaq	CSWTCH.47(%rip), %rdx
	movq	%rbp, %rsi
	movl	(%rdx,%rax,4), %r13d
	call	tac_expression
	movq	%rax, %r14
	movl	24(%r12), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L204
	cmpl	$14, %r13d
	jne	.L210
	movl	16(%r14), %eax
	testl	%eax, %eax
	jne	.L223
.L207:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$14, 24(%rax)
	movq	%rax, %rsi
	movq	%r14, (%rax)
	movq	%rbx, 8(%rax)
	movq	$0, 16(%rax)
	cmpb	$0, 20(%r14)
	jne	.L224
.L208:
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	addq	$8, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L203:
	movq	%rbp, %rsi
	movl	$25, %r13d
	call	tac_expression
	movq	%rax, %r14
	movl	24(%r12), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L204
.L210:
	movq	8(%r14), %rsi
	xorl	%edi, %edi
	movq	%rbp, %rcx
	movl	$116, %edx
	call	create_var.part.0
	movl	$24, %edi
	movq	%rax, %r15
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r15, %xmm0
	movhps	16(%r15), %xmm0
	movb	$0, 20(%rax)
	movq	%rax, %r12
	movq	%r14, %r15
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	cmpb	$0, 20(%r14)
	jne	.L225
.L206:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r15, 8(%rax)
	movq	%rax, %rsi
	movq	%rbx, 16(%rax)
	movq	%r12, %rbx
	movl	%r13d, 24(%rax)
	movq	%r12, (%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	16(%r14), %eax
	testl	%eax, %eax
	je	.L207
.L223:
	movq	stderr(%rip), %rcx
	movl	$57, %edx
	movl	$1, %esi
	leaq	.LC20(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
	.p2align 4,,10
	.p2align 3
.L204:
	movq	8(%r14), %rsi
	xorl	%edi, %edi
	movq	%rbp, %rcx
	movl	$116, %edx
	call	create_var.part.0
	movl	$24, %edi
	movq	%rax, %r15
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r15, %xmm0
	movhps	16(%r15), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r12
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	cmpb	$0, 20(%r14)
	jne	.L226
.L209:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, 16(%rax)
	movq	%rax, %rsi
	movq	%r12, %rbx
	movl	%r13d, 24(%rax)
	movq	%r12, (%rax)
	movq	%r14, 8(%rax)
	jmp	.L208
	.p2align 4,,10
	.p2align 3
.L221:
	movq	8(%rdi), %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	tac_primary
	.p2align 4,,10
	.p2align 3
.L224:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$24, 24(%rax)
	movq	%rax, %rsi
	movq	%r14, (%rax)
	movq	%rbx, 8(%rax)
	movq	$0, 16(%rax)
	jmp	.L208
	.p2align 4,,10
	.p2align 3
.L222:
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %rbx
	jmp	.L202
	.p2align 4,,10
	.p2align 3
.L226:
	movq	%r14, %rdi
	movq	%rbp, %rsi
	call	load_rvalue.part.0
	movq	%rax, %r14
	jmp	.L209
	.p2align 4,,10
	.p2align 3
.L225:
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	load_rvalue.part.0
	movq	%rax, %r15
	jmp	.L206
	.size	tac_expression, .-tac_expression
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"Error: create_attribute received NULL table\n"
	.align 8
.LC22:
	.string	"Error: create_attribute received NULL table or attributes list\n"
	.text
	.p2align 4
	.globl	tac_variable
	.type	tac_variable, @function
tac_variable:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$8, %rsp
	testb	%dl, %dl
	je	.L228
	movq	(%rsi), %rax
	movq	(%rax), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	%rax, %r14
	movq	(%rbx), %rax
	movq	%r14, %rsi
	movq	(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	8(%rbp), %r13
	movq	0(%rbp), %r12
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%r13, %r13
	je	.L275
	movl	32(%r12), %edi
	xorl	%r15d, %r15d
	testl	%edi, %edi
	jne	.L232
	movq	24(%r12), %rax
	movq	24(%rbx), %r15
	movq	%rax, 24(%rbx)
.L232:
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	search_var
	movl	32(%r12), %esi
	testl	%esi, %esi
	jne	.L233
	movq	%r15, 24(%rbx)
.L233:
	testq	%rax, %rax
	je	.L276
	movq	%rax, %xmm0
	movq	%r12, %xmm1
	movq	$0, 16(%rbp)
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, 0(%rbp)
	testq	%r14, %r14
	jne	.L254
.L231:
	movq	stderr(%rip), %rcx
	movl	$44, %edx
	movl	$1, %esi
	leaq	.LC21(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L243:
	movq	stderr(%rip), %rcx
	addq	$8, %rsp
	movl	$63, %edx
	movl	$1, %esi
	popq	%rbx
	leaq	.LC22(%rip), %rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*fwrite@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L228:
	movq	8(%rdi), %r14
	movq	(%rdi), %r13
	testq	%r14, %r14
	je	.L249
	movl	32(%r13), %edx
	xorl	%r15d, %r15d
	testl	%edx, %edx
	jne	.L247
	movq	24(%r13), %rax
	movq	24(%rsi), %r15
	movq	%rax, 24(%rsi)
.L247:
	movq	%rbx, %rsi
	movq	%r14, %rdi
	call	search_var
	movq	%rax, %r12
	movl	32(%r13), %eax
	testl	%eax, %eax
	jne	.L248
	movq	%r15, 24(%rbx)
.L248:
	testq	%r12, %r12
	je	.L249
	movq	16(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L250
.L278:
	movq	%rbx, %rsi
	call	tac_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L251
	cmpb	$0, 20(%rax)
	jne	.L277
.L251:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r12, %xmm0
	movl	$32, %edi
	movhps	16(%r12), %xmm0
	movq	%rax, %r13
	movb	$0, 20(%rax)
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, 8(%rax)
	movq	%rax, %rsi
	movl	$14, 24(%rax)
	movq	%r13, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
.L274:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L249:
	movq	%r14, %rdi
	movq	%rbx, %rcx
	movl	$118, %edx
	movq	%r13, %rsi
	call	create_var.part.0
	movq	16(%rbp), %rdi
	movq	%rax, %r12
	testq	%rdi, %rdi
	jne	.L278
.L250:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$1, 16(%rax)
	movq	%rax, %rbp
	movq	$0, (%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%rbp)
	movq	%rax, 8(%rbp)
	jmp	.L251
	.p2align 4,,10
	.p2align 3
.L275:
	movq	%rbx, %rcx
	movl	$97, %edx
	movq	%r12, %rsi
	xorl	%edi, %edi
	call	create_var.part.0
	movq	%r12, %xmm3
	movq	$0, 16(%rbp)
	movq	%rax, %xmm0
	punpcklqdq	%xmm3, %xmm0
	movups	%xmm0, 0(%rbp)
	testq	%r14, %r14
	je	.L231
	movq	16(%r14), %rax
	movq	%rax, 16(%rbp)
	testq	%r12, %r12
	je	.L236
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L276:
	movq	%rbx, %rcx
	movl	$97, %edx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	create_var.part.0
	movq	%r12, %xmm2
	movq	$0, 16(%rbp)
	movq	%rax, %xmm0
	punpcklqdq	%xmm2, %xmm0
	movups	%xmm0, 0(%rbp)
	testq	%r14, %r14
	je	.L231
.L254:
	movq	16(%r14), %rax
	movq	%rax, 16(%rbp)
.L252:
	cmpq	name_int(%rip), %r12
	je	.L272
	cmpq	name_float(%rip), %r12
	je	.L272
	cmpq	name_string(%rip), %r12
	je	.L272
	cmpq	name_bool(%rip), %r12
	je	.L273
	cmpq	name_void(%rip), %r12
	je	.L273
	movl	32(%r12), %ecx
	testl	%ecx, %ecx
	jne	.L242
	movq	24(%r12), %rdx
	addq	24(%rdx), %rax
	jmp	.L236
	.p2align 4,,10
	.p2align 3
.L277:
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %rbp
	jmp	.L251
.L242:
	movq	8(%r12), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC13(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	16(%r14), %rax
	.p2align 4,,10
	.p2align 3
.L272:
	addq	$8, %rax
.L236:
	movq	(%r14), %rdi
	movq	%rax, 16(%r14)
	movq	%rbp, %rsi
	testq	%rdi, %rdi
	jne	.L274
	jmp	.L243
	.p2align 4,,10
	.p2align 3
.L273:
	addq	$1, %rax
	jmp	.L236
	.size	tac_variable, .-tac_variable
	.p2align 4
	.globl	tac_if
	.type	tac_if, @function
tac_if:
	pushq	%r15
	movq	%rdi, %r15
	movq	%rsi, %rdi
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$56, %rsp
	call	create_var.part.0.constprop.0
	movq	%rbx, %rdi
	movq	%rax, %r12
	call	create_var.part.0.constprop.0
	movq	16(%r15), %rdi
	movq	%rax, %rbp
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L282
	movq	24(%r15), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L311
.L282:
	movq	%rbx, %rdi
	call	create_var.part.0.constprop.0
	movq	%rax, 40(%rsp)
.L281:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, %rsi
	movl	$6, 16(%rax)
	movq	%rax, %r14
	movq	$0, 8(%rax)
	movq	40(%rsp), %rax
	movb	$0, 20(%r14)
	movq	(%r15), %rdi
	movq	%rax, (%r14)
	call	tac_expression
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L283
	cmpb	$0, 20(%rax)
	jne	.L312
.L283:
	movq	%rcx, 16(%rsp)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$24, %edi
	movq	%rax, %r13
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%r12, (%rax)
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movb	$0, 20(%rax)
	movq	%rax, 8(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rdx
	movq	%rax, %rsi
	movq	%r13, 16(%rax)
	movq	%rdx, 8(%rax)
	movq	%rcx, (%rax)
	movl	$19, 24(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r13
	movq	%r12, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%r13, %rsi
	movq	%rax, 8(%r13)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r13, 16(%rbx)
	movq	8(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L284
	.p2align 4,,10
	.p2align 3
.L285:
	movq	%rbx, %rsi
	call	tac_statement
.L284:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L285
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	$0, 8(%rax)
	movq	%rax, %rsi
	movl	$20, 24(%rax)
	movq	%r14, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	16(%r15), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L313
.L286:
	movq	24(%r15), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L314
.L294:
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	40(%rsp), %rax
	movq	%rax, 0(%rbp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rbp, %rsi
	movq	%rax, 8(%rbp)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%rbp, 16(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L311:
	movq	%rbp, 40(%rsp)
	jmp	.L281
	.p2align 4,,10
	.p2align 3
.L314:
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	%rbp, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%r12, %rsi
	movq	%rax, 8(%r12)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r12, 16(%rbx)
	movq	24(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L295
	.p2align 4,,10
	.p2align 3
.L296:
	movq	%rbx, %rsi
	call	tac_statement
.L295:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L296
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, (%rax)
	movq	%rax, %rsi
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L294
	.p2align 4,,10
	.p2align 3
.L313:
	movq	16(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L287:
	movq	16(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L286
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	%rbp, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%r12, %rsi
	movq	%rax, 8(%r12)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r12, 16(%rbx)
	movq	%rbx, %rdi
	call	create_var.part.0.constprop.0
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	create_var.part.0.constprop.0
	movq	0(%r13), %rdi
	movq	%rbx, %rsi
	movq	%rax, %rbp
	call	tac_expression
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L288
	cmpb	$0, 20(%rax)
	jne	.L315
.L288:
	movq	16(%rsp), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L316
.L290:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$24, %edi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	movb	$0, 20(%rax)
	movq	%rax, 32(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rcx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	8(%rsp), %rax
	movb	$0, 20(%rcx)
	movq	%rax, (%rcx)
	movq	%rcx, 24(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	24(%rsp), %rcx
	movq	32(%rsp), %rdx
	movq	%rax, %rsi
	movq	%r12, (%rax)
	movq	%rcx, 8(%rax)
	movq	%rdx, 16(%rax)
	movl	$19, 24(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	8(%rsp), %rax
	movq	%rax, (%r12)
	call	*create_list@GOTPCREL(%rip)
	movq	%r12, %rsi
	movq	%rax, 8(%r12)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r12, 16(%rbx)
	movq	8(%r13), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L291
	.p2align 4,,10
	.p2align 3
.L292:
	movq	%rbx, %rsi
	call	tac_statement
.L291:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L292
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, (%rax)
	movq	%rax, %rsi
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L287
	.p2align 4,,10
	.p2align 3
.L316:
	movq	24(%r15), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	cmovne	40(%rsp), %rbp
	jmp	.L290
	.p2align 4,,10
	.p2align 3
.L315:
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %r12
	jmp	.L288
.L312:
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %rcx
	jmp	.L283
	.size	tac_if, .-tac_if
	.section	.rodata.str1.8
	.align 8
.LC23:
	.string	"[Warning] 'break' statement used outside of loop\n"
	.align 8
.LC24:
	.string	"[Warning] 'continue' statement used outside of loop\n"
	.align 8
.LC25:
	.string	"[Warning] Unsupported statement type for tac_statement: %d\n"
	.text
	.p2align 4
	.globl	tac_statement
	.type	tac_statement, @function
tac_statement:
	movl	8(%rdi), %ecx
	cmpl	$7, %ecx
	ja	.L318
	leaq	.L320(%rip), %rdx
	pushq	%r12
	movslq	(%rdx,%rcx,4), %rax
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movq	%rdi, %rbx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L320:
	.long	.L327-.L320
	.long	.L326-.L320
	.long	.L325-.L320
	.long	.L324-.L320
	.long	.L323-.L320
	.long	.L322-.L320
	.long	.L321-.L320
	.long	.L319-.L320
	.text
	.p2align 4,,10
	.p2align 3
.L321:
	movq	32(%rsi), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L330
	movq	32(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	je	.L330
.L351:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$20, 24(%rax)
	movq	%rax, %rsi
	movq	%rbx, (%rax)
	jmp	.L350
	.p2align 4,,10
	.p2align 3
.L319:
	movq	40(%rsi), %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L331
	movq	40(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L351
.L331:
	popq	%rbx
	movl	$52, %edx
	popq	%rbp
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	leaq	.LC24(%rip), %rdi
	popq	%r12
	jmp	*fwrite@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L325:
	movq	(%rdi), %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	tac_if
	.p2align 4,,10
	.p2align 3
.L327:
	movq	(%rdi), %rdi
	call	tac_expression
	testq	%rax, %rax
	je	.L317
	cmpb	$0, 20(%rax)
	jne	.L352
.L317:
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L326:
	movq	(%rdi), %rdi
	popq	%rbx
	xorl	%edx, %edx
	popq	%rbp
	popq	%r12
	jmp	tac_variable
	.p2align 4,,10
	.p2align 3
.L323:
	movq	(%rdi), %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	tac_for
	.p2align 4,,10
	.p2align 3
.L322:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r12
	movl	$5, 16(%rax)
	movq	$0, (%rax)
	movq	name_void(%rip), %rax
	movb	$0, 20(%r12)
	movq	(%rbx), %rdi
	movq	%rax, 8(%r12)
	testq	%rdi, %rdi
	je	.L329
	movq	%rbp, %rsi
	call	tac_expression
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L329
	cmpb	$0, 20(%rax)
	jne	.L353
.L329:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$21, 24(%rax)
	movq	%rax, %rsi
	movq	%r12, (%rax)
.L350:
	movq	16(%rbp), %rax
	movq	$0, 8(%rsi)
	movq	$0, 16(%rsi)
	popq	%rbx
	movq	8(%rax), %rdi
	popq	%rbp
	popq	%r12
	jmp	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L324:
	movq	(%rdi), %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	tac_while
	.p2align 4,,10
	.p2align 3
.L330:
	popq	%rbx
	movl	$49, %edx
	popq	%rbp
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	leaq	.LC23(%rip), %rdi
	popq	%r12
	jmp	*fwrite@GOTPCREL(%rip)
.L318:
	movq	stderr(%rip), %rdi
	leaq	.LC25(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L353:
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %r12
	jmp	.L329
	.p2align 4,,10
	.p2align 3
.L352:
	popq	%rbx
	movq	%rbp, %rsi
	movq	%rax, %rdi
	popq	%rbp
	popq	%r12
	jmp	load_rvalue.part.0
	.size	tac_statement, .-tac_statement
	.p2align 4
	.globl	tac_for
	.type	tac_for, @function
tac_for:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$24, %rsp
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L355
	xorl	%edx, %edx
	call	tac_variable
.L355:
	movq	%rbx, %rdi
	call	create_var.part.0.constprop.0
	movq	%rbx, %rdi
	movq	%rax, %r13
	call	create_var.part.0.constprop.0
	movq	%rbx, %rdi
	movq	%rax, %r15
	call	create_var.part.0.constprop.0
	cmpq	$0, 8(%r12)
	movl	$24, %edi
	movq	%rax, %r14
	je	.L356
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rbp
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbp, (%rax)
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%r13, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%rbp, %rsi
	movq	%rax, 8(%rbp)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%rbp, 16(%rbx)
	movq	8(%r12), %rdi
	movq	%rbx, %rsi
	call	tac_expression
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L357
	cmpb	$0, 20(%rax)
	jne	.L378
.L357:
	movq	%rcx, 8(%rsp)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$24, %edi
	movq	%rax, %rbp
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r14, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r15, (%rax)
	movb	$0, 20(%rax)
	movq	%rax, (%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	8(%rsp), %rcx
	movq	(%rsp), %rdx
	movl	$19, 24(%rax)
	movq	%rax, %rsi
	movq	%rdx, 8(%rax)
	movq	%rcx, (%rax)
	movq	%rbp, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
.L358:
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%r15, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%rbp, %rsi
	movq	%rax, 8(%rbp)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%rbp, 16(%rbx)
	movq	%rbx, %rdi
	call	create_var.part.0.constprop.0
	cmpq	$0, 16(%r12)
	movl	$24, %edi
	movq	%rax, (%rsp)
	movq	%rax, %rbp
	je	.L359
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	40(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rbp, (%rax)
	call	*list_append@GOTPCREL(%rip)
.L360:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	32(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r14, (%rax)
	call	*list_append@GOTPCREL(%rip)
	movq	24(%r12), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L362
	.p2align 4,,10
	.p2align 3
.L363:
	movq	%rbx, %rsi
	call	tac_statement
.L362:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L363
	movq	40(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	32(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	cmpq	$0, 16(%r12)
	je	.L365
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rbp
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	(%rsp), %rax
	movb	$0, 20(%rbp)
	movq	%rax, 0(%rbp)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbp, (%rax)
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	(%rsp), %rax
	movq	%rax, 0(%rbp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rbp, %rsi
	movq	%rax, 8(%rbp)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%rbp, 16(%rbx)
	movq	16(%r12), %rdi
	movq	%rbx, %rsi
	call	tac_expression
	testq	%rax, %rax
	je	.L365
	cmpb	$0, 20(%rax)
	jne	.L379
.L365:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rbp
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	cmpq	$0, 8(%r12)
	movl	$20, 24(%rax)
	movq	%rax, %rsi
	movq	%rbp, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	je	.L380
.L367:
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%r14, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%rbp, %rsi
	movq	%rax, 8(%rbp)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
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
	.p2align 4,,10
	.p2align 3
.L359:
	cmpq	$0, 8(%r12)
	je	.L361
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	40(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	call	*list_append@GOTPCREL(%rip)
	jmp	.L360
	.p2align 4,,10
	.p2align 3
.L356:
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rbp
	movq	%r15, (%rax)
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, (%rax)
	movq	%rax, %rsi
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L358
	.p2align 4,,10
	.p2align 3
.L379:
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	jmp	.L365
	.p2align 4,,10
	.p2align 3
.L380:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rbp
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r15, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$20, 24(%rax)
	movq	%rax, %rsi
	movq	%rbp, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	jmp	.L367
	.p2align 4,,10
	.p2align 3
.L361:
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	40(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r15, (%rax)
	call	*list_append@GOTPCREL(%rip)
	jmp	.L360
	.p2align 4,,10
	.p2align 3
.L378:
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %rcx
	jmp	.L357
	.size	tac_for, .-tac_for
	.p2align 4
	.globl	tac_while
	.type	tac_while, @function
tac_while:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rdi, %rbp
	movq	%rsi, %rdi
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$24, %rsp
	call	create_var.part.0.constprop.0
	movl	$24, %edi
	movq	%rax, %r12
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %r13
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r12, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%r13, (%rax)
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r13
	movq	%r12, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%r13, %rsi
	movq	%rax, 8(%r13)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	%r13, 16(%rbx)
	movq	%rbx, %rdi
	call	create_var.part.0.constprop.0
	movq	%rbx, %rdi
	movq	%rax, %r14
	call	create_var.part.0.constprop.0
	movq	0(%rbp), %rdi
	movq	%rbx, %rsi
	movq	%rax, %r13
	call	tac_expression
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L382
	cmpb	$0, 20(%rax)
	jne	.L389
.L382:
	movq	%rcx, 8(%rsp)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$24, %edi
	movq	%rax, %r15
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r14, (%rax)
	movb	$0, 20(%rax)
	movq	%rax, (%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	8(%rsp), %rcx
	movq	(%rsp), %rdx
	movq	%rax, %rsi
	movq	%r15, 16(%rax)
	movq	%rdx, 8(%rax)
	movq	%rcx, (%rax)
	movl	$19, 24(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r15
	movq	%r14, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%r15, %rsi
	movq	%rax, 8(%r15)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$24, %edi
	movq	%r15, 16(%rbx)
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	40(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r12, (%rax)
	call	*list_append@GOTPCREL(%rip)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 20(%rax)
	movq	%rax, %rsi
	movq	32(%rbx), %rdi
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	call	*list_append@GOTPCREL(%rip)
	movq	8(%rbp), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L383
	.p2align 4,,10
	.p2align 3
.L384:
	movq	%rbx, %rsi
	call	tac_statement
.L383:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L384
	movq	40(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movq	32(%rbx), %rdi
	call	*list_pop_back@GOTPCREL(%rip)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$32, %edi
	movq	%rax, %rbp
	movq	%r12, (%rax)
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movb	$0, 20(%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbp, (%rax)
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%r13, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%rbp, %rsi
	movq	%rax, 8(%rbp)
	movq	8(%rbx), %rax
	movq	32(%rax), %rdi
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
	.p2align 4,,10
	.p2align 3
.L389:
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	load_rvalue.part.0
	movq	%rax, %rcx
	jmp	.L382
	.size	tac_while, .-tac_while
	.p2align 4
	.globl	tac_function
	.type	tac_function, @function
tac_function:
	pushq	%r15
	movq	%rdi, %r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$40, %rsp
	movdqu	(%rdi), %xmm0
	movq	%rdi, 8(%rsp)
	movl	$40, %edi
	movaps	%xmm0, 16(%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	16(%rsp), %xmm0
	movq	%rax, %rbp
	movups	%xmm0, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 16(%rbp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 24(%rbp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rbp, %rsi
	movq	%rax, 32(%rbp)
	movq	(%rbx), %rax
	movq	%rbp, 8(%rbx)
	movq	24(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	16(%r15), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L391
	.p2align 4,,10
	.p2align 3
.L393:
	movq	16(%rbp), %rdi
	call	*list_append@GOTPCREL(%rip)
.L391:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L405
	movq	8(%rax), %r15
	movq	(%rax), %r14
	testq	%r15, %r15
	je	.L396
	movl	32(%r14), %edx
	xorl	%r13d, %r13d
	testl	%edx, %edx
	jne	.L394
	movq	24(%r14), %rax
	movq	24(%rbx), %r13
	movq	%rax, 24(%rbx)
.L394:
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	search_var
	movq	%rax, %rsi
	movl	32(%r14), %eax
	testl	%eax, %eax
	jne	.L395
	movq	%r13, 24(%rbx)
.L395:
	testq	%rsi, %rsi
	jne	.L393
.L396:
	movq	%r14, %rsi
	movq	%rbx, %rcx
	movl	$112, %edx
	movq	%r15, %rdi
	call	create_var.part.0
	movq	%rax, %rsi
	jmp	.L393
	.p2align 4,,10
	.p2align 3
.L405:
	movq	%rbx, %rdi
	call	create_var.part.0.constprop.0
	movl	$16, %edi
	movq	%rax, %r14
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r12
	movq	%r14, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	32(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rax, 8(%r12)
	call	*list_append@GOTPCREL(%rip)
	movq	8(%rsp), %rax
	movq	%r12, 16(%rbx)
	movq	24(%rax), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %rbp
	jmp	.L398
	.p2align 4,,10
	.p2align 3
.L399:
	movq	%rbx, %rsi
	call	tac_statement
.L398:
	movq	%rbp, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L399
	movq	$0, 8(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	tac_function, .-tac_function
	.section	.rodata.str1.8
	.align 8
.LC26:
	.string	"[Warning] Constructor '%s' does not start with 'self' initialization\n"
	.text
	.p2align 4
	.globl	tac_method
	.type	tac_method, @function
tac_method:
	pushq	%r15
	pushq	%r14
	movq	%rdi, %r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	subq	$24, %rsp
	movdqu	(%rdi), %xmm0
	movl	$40, %edi
	movaps	%xmm0, (%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movdqa	(%rsp), %xmm0
	movq	%rax, %r12
	movups	%xmm0, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 16(%r12)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 24(%r12)
	call	*create_list@GOTPCREL(%rip)
	movq	%r12, %rsi
	movq	%rax, 32(%r12)
	movq	0(%rbp), %rax
	movq	%r12, 8(%rbp)
	movq	24(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	16(%r14), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, (%rsp)
	jmp	.L407
	.p2align 4,,10
	.p2align 3
.L409:
	movq	16(%r12), %rdi
	call	*list_append@GOTPCREL(%rip)
.L407:
	movq	(%rsp), %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L427
	movq	(%rbx), %r15
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L412
	movl	32(%r15), %r8d
	xorl	%r13d, %r13d
	testl	%r8d, %r8d
	jne	.L410
	movq	24(%r15), %rax
	movq	24(%rbp), %r13
	movq	%rax, 24(%rbp)
.L410:
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	search_var
	movl	32(%r15), %edi
	movq	%rax, %rsi
	testl	%edi, %edi
	jne	.L411
	movq	%r13, 24(%rbp)
.L411:
	testq	%rsi, %rsi
	jne	.L409
.L412:
	movq	%r15, %rsi
	movq	%rbp, %rcx
	movl	$112, %edx
	movq	%rbx, %rdi
	call	create_var.part.0
	movq	%rax, %rsi
	jmp	.L409
	.p2align 4,,10
	.p2align 3
.L427:
	movq	%rbp, %rdi
	call	create_var.part.0.constprop.0
	movl	$16, %edi
	movq	%rax, %r15
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r13
	movq	%r15, (%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	32(%r12), %rdi
	movq	%r13, %rsi
	movq	%rax, 8(%r13)
	call	*list_append@GOTPCREL(%rip)
	movq	24(%r14), %rdi
	movq	%r13, 16(%rbp)
	call	*list_copy@GOTPCREL(%rip)
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi
	movq	%rax, %r12
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	(%r14), %rax
	movq	8(%rax), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L420
	jmp	.L428
	.p2align 4,,10
	.p2align 3
.L421:
	movq	%rbp, %rsi
	call	tac_statement
.L420:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L421
	movq	$0, 8(%rbp)
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L428:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movl	8(%rax), %esi
	testl	%esi, %esi
	jne	.L415
	movq	(%rax), %rax
	cmpl	$19, 24(%rax)
	jne	.L415
	movq	8(%rax), %rax
	cmpl	$8, 8(%rax)
	jne	.L415
	movq	(%rax), %rax
	movl	16(%rax), %ecx
	testl	%ecx, %ecx
	je	.L416
.L415:
	movq	(%r14), %rax
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	leaq	.LC26(%rip), %rdx
	movq	8(%rax), %rcx
	addq	$24, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*__fprintf_chk@GOTPCREL(%rip)
.L416:
	movq	24(%rbp), %rdx
	movq	8(%rax), %r15
	movl	$24, %edi
	movq	%rdx, (%rsp)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	(%rsp), %rdx
	movq	%rax, %r14
	movl	$1, 16(%rax)
	movq	24(%rdx), %rax
	movb	$0, 20(%r14)
	movq	(%r15), %r8
	movq	%rax, (%r14)
	movq	name_int(%rip), %rax
	movl	32(%r8), %edx
	movq	%rax, 8(%r14)
	testl	%edx, %edx
	jne	.L417
	movq	24(%r8), %rax
	movq	24(%rbp), %rbx
	movq	%rax, 24(%rbp)
.L417:
	movq	%rbp, %rsi
	movq	%r15, %rdi
	movq	%r8, (%rsp)
	call	search_var
	movq	(%rsp), %r8
	movq	%rax, %rdx
	movl	32(%r8), %eax
	testl	%eax, %eax
	jne	.L418
	movq	%rbx, 24(%rbp)
.L418:
	testq	%rdx, %rdx
	jne	.L419
	movl	$118, %edx
	movq	%rbp, %rcx
	movq	%r8, %rsi
	movq	%r15, %rdi
	call	create_var.part.0
	movq	%rax, %rdx
.L419:
	movq	%rdx, (%rsp)
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	(%rsp), %rdx
	movl	$32, %edi
	movq	%rax, %rbx
	movl	$0, 16(%rax)
	movq	%rdx, %xmm0
	movhps	16(%rdx), %xmm0
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	8(%r13), %rdi
	movl	$18, 24(%rax)
	movq	%rax, %rsi
	movq	%rbx, (%rax)
	movq	%r14, 8(%rax)
	movq	$0, 16(%rax)
	call	*list_append@GOTPCREL(%rip)
	jmp	.L420
	.size	tac_method, .-tac_method
	.section	.rodata.str1.8
	.align 8
.LC27:
	.string	"[Warning] Unsupported class member type for tac_class: %d\n"
	.text
	.p2align 4
	.globl	tac_class
	.type	tac_class, @function
tac_class:
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, 24(%rsi)
	movq	8(%rdi), %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	(%r12), %r13
	movl	$24, %edi
	movq	%rax, %rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r12
	call	*create_list@GOTPCREL(%rip)
	movq	%r13, %xmm1
	movq	%r12, %rsi
	movq	$0, 16(%r12)
	movq	%rax, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, (%r12)
	movq	0(%rbp), %rax
	leaq	.LC27(%rip), %r12
	movq	(%rax), %rdi
	call	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L430:
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L438
.L435:
	movl	8(%rax), %ecx
	testl	%ecx, %ecx
	je	.L431
	cmpl	$1, %ecx
	je	.L432
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	movq	%r12, %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	%rbx, %rdi
	call	*list_pop@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L435
.L438:
	movq	$0, 24(%rbp)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L432:
	movq	(%rax), %rdi
	movl	$1, %edx
	movq	%rbp, %rsi
	call	tac_variable
	jmp	.L430
	.p2align 4,,10
	.p2align 3
.L431:
	movq	(%rax), %rdi
	movq	%rbp, %rsi
	call	tac_method
	jmp	.L430
	.size	tac_class, .-tac_class
	.section	.rodata.str1.8
	.align 8
.LC28:
	.string	"[Warning] Unsupported symbol kind for import: %d\n"
	.text
	.p2align 4
	.globl	tac_import
	.type	tac_import, @function
tac_import:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	pushq	%rbx
	movq	(%rdi), %rbp
	movq	%rdx, %rbx
	movl	32(%rbp), %ecx
	cmpl	$3, %ecx
	je	.L452
	leal	-1(%rcx), %eax
	cmpl	$1, %eax
	jbe	.L453
	testl	%ecx, %ecx
	jne	.L448
	movq	24(%rbp), %rdi
	popq	%rbx
	movq	%rdx, %rsi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	tac_class
	.p2align 4,,10
	.p2align 3
.L448:
	popq	%rbx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbp
	leaq	.LC28(%rip), %rdx
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L453:
	movq	0(%rbp), %r13
	xorl	%r14d, %r14d
	movl	32(%r13), %edx
	testl	%edx, %edx
	je	.L454
.L445:
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	search_var
	movq	%rax, %rsi
	movl	32(%r13), %eax
	testl	%eax, %eax
	jne	.L446
	movq	%r14, 24(%rbx)
.L446:
	testq	%rsi, %rsi
	jne	.L447
	movq	%r13, %rsi
	movq	%rbx, %rcx
	movl	$102, %edx
	movq	%rbp, %rdi
	call	create_var.part.0
	movq	%rax, %rsi
.L447:
	popq	%rbx
	movq	16(%r12), %rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	*list_append@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L452:
	movq	0(%rbp), %r13
	xorl	%r14d, %r14d
	movl	32(%r13), %esi
	testl	%esi, %esi
	je	.L455
.L441:
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	search_var
	movl	32(%r13), %ecx
	movq	%rax, %rsi
	testl	%ecx, %ecx
	jne	.L442
	movq	%r14, 24(%rbx)
.L442:
	testq	%rsi, %rsi
	jne	.L447
	movq	%r13, %rsi
	movq	%rbx, %rcx
	movl	$118, %edx
	movq	%rbp, %rdi
	call	create_var.part.0
	movq	%rax, %rsi
	jmp	.L447
	.p2align 4,,10
	.p2align 3
.L454:
	movq	24(%r13), %rax
	movq	24(%rbx), %r14
	movq	%rax, 24(%rbx)
	jmp	.L445
	.p2align 4,,10
	.p2align 3
.L455:
	movq	24(%r13), %rax
	movq	24(%rdx), %r14
	movq	%rax, 24(%rdx)
	jmp	.L441
	.size	tac_import, .-tac_import
	.section	.rodata.str1.1
.LC29:
	.string	"main"
	.text
	.p2align 4
	.globl	tac_code
	.type	tac_code, @function
tac_code:
	pushq	%r14
	leaq	.LC29(%rip), %r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %r13
	call	*create_list@GOTPCREL(%rip)
	movq	$0, 8(%r13)
	movq	%rax, 0(%r13)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 16(%r13)
	call	*create_list@GOTPCREL(%rip)
	movl	$96, %edi
	movq	%rax, 24(%r13)
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%r13, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, 32(%rbp)
	call	*create_list@GOTPCREL(%rip)
	pxor	%xmm0, %xmm0
	movq	(%rbx), %rdi
	movq	%rax, 40(%rbp)
	movups	%xmm0, 48(%rbp)
	movups	%xmm0, 64(%rbp)
	movups	%xmm0, 80(%rbp)
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L457:
	movq	%r12, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L465
	movl	8(%rbx), %eax
	cmpl	$1, %eax
	je	.L466
	cmpl	$2, %eax
	je	.L467
	testl	%eax, %eax
	jne	.L457
	movq	(%rbx), %rdi
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	tac_import
	jmp	.L457
	.p2align 4,,10
	.p2align 3
.L466:
	movq	(%rbx), %rdi
	movq	%rbp, %rsi
	call	tac_function
	movq	(%rbx), %rax
	movq	%r14, %rsi
	movq	(%rax), %rbx
	movq	8(%rbx), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L457
	movq	%rbx, 8(%r13)
	jmp	.L457
	.p2align 4,,10
	.p2align 3
.L467:
	movq	(%rbx), %rdi
	movq	%rbp, %rsi
	call	tac_class
	jmp	.L457
	.p2align 4,,10
	.p2align 3
.L465:
	popq	%rbx
	movq	%r13, %rax
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	tac_code, .-tac_code
	.section	.rodata
	.align 32
	.type	CSWTCH.47, @object
	.size	CSWTCH.47, 76
CSWTCH.47:
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
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC16:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
