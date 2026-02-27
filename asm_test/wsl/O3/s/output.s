	.file	"output.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Name pointer: \"NULL\"\n"
.LC1:
	.string	"name: \"%s\"\n"
.LC2:
	.string	"id: %zu\n"
.LC3:
	.string	"kind: \"type\"\n"
.LC4:
	.string	"kind: \"variable\"\n"
.LC5:
	.string	"type\n"
.LC6:
	.string	"kind: \"function\"\n"
.LC7:
	.string	"return_type\n"
.LC8:
	.string	"kind: \"method\"\n"
.LC9:
	.string	"kind: \"class\"\n"
.LC10:
	.string	"kind: \"attribute\"\n"
.LC11:
	.string	"kind: \"unknown_NameType\"\n"
	.text
	.p2align 4
	.type	output_name, @function
output_name:
.LFB81:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rcx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	testq	%rdi, %rdi
	je	.L2
	movq	%rdi, %r15
	addq	$1, %r14
	leaq	.L7(%rip), %r13
.L4:
	leaq	-1(%r14), %r12
	xorl	%edx, %edx
	movq	%rbp, %rcx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	call	indention@PLT
	movq	(%r15), %rcx
	movl	$2, %esi
	movq	%rbx, %rdi
	leaq	.LC1(%rip), %rdx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	xorl	%edx, %edx
	movq	%rbp, %rcx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	8(%r15), %rcx
	xorl	%eax, %eax
	movl	$2, %esi
	leaq	.LC2(%rip), %rdx
	movq	%rbx, %rdi
	call	__fprintf_chk@PLT
	cmpl	$5, 24(%r15)
	ja	.L5
	movl	24(%r15), %eax
	movq	%rbp, %rcx
	movslq	0(%r13,%rax,4), %rax
	addq	%r13, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L7:
	.long	.L12-.L7
	.long	.L11-.L7
	.long	.L10-.L7
	.long	.L9-.L7
	.long	.L8-.L7
	.long	.L6-.L7
	.text
	.p2align 4,,10
	.p2align 3
.L8:
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC9(%rip), %rdi
.L22:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	fwrite@PLT
	.p2align 4,,10
	.p2align 3
.L9:
	.cfi_restore_state
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rdi
.L20:
	call	fwrite@PLT
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	fwrite@PLT
	movq	16(%r15), %r15
.L13:
	leaq	1(%r14), %rax
	testq	%r15, %r15
	je	.L2
	movq	%rax, %r14
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L10:
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rdi
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L11:
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rdi
.L21:
	call	fwrite@PLT
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	fwrite@PLT
	movq	16(%r15), %r15
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L12:
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$13, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L6:
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$18, %edx
	movl	$1, %esi
	leaq	.LC10(%rip), %rdi
	jmp	.L21
.L5:
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$25, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rdi
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L2:
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	jmp	.L22
	.cfi_endproc
.LFE81:
	.size	output_name, .-output_name
	.section	.rodata.str1.1
.LC12:
	.string	"primary\n"
.LC13:
	.string	"type: \"integer\"\n"
.LC14:
	.string	"value: %s\n"
.LC15:
	.string	"type: \"float\"\n"
.LC16:
	.string	"type: \"string\"\n"
.LC17:
	.string	"value: \"%s\"\n"
.LC18:
	.string	"type: \"boolean\"\n"
.LC19:
	.string	"value: \"true\"\n"
.LC20:
	.string	"value: \"false\"\n"
.LC21:
	.string	"type: \"expression\"\n"
.LC22:
	.string	"value\n"
.LC23:
	.string	"type: \"!\"\n"
.LC24:
	.string	"type: \"-\"\n"
.LC25:
	.string	"type: \"variable\"\n"
.LC26:
	.string	"unknown_PrimaryType: %u\n"
.LC27:
	.string	"operator: \"%s\"\n"
.LC28:
	.string	"left\n"
.LC29:
	.string	"right\n"
.LC30:
	.string	"UNKNOWN_OPERATOR"
	.text
	.p2align 4
	.type	output_expression, @function
output_expression:
.LFB78:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	.L29(%rip), %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
.L38:
	movl	24(%r13), %edi
	cmpl	$19, %edi
	je	.L58
.L25:
	call	operator_to_string@PLT
	movq	%r12, %rcx
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movq	%rax, %r14
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%r14, %rcx
	testq	%r14, %r14
	je	.L59
.L53:
	leaq	.LC27(%rip), %rdx
	movq	%rbx, %rdi
	leaq	1(%rbp), %r14
	xorl	%eax, %eax
	movl	$2, %esi
	call	__fprintf_chk@PLT
	movq	%r12, %rcx
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC28(%rip), %rdi
	call	fwrite@PLT
	movq	0(%r13), %rdi
	movq	%r12, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_expression
	movq	%r12, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	leaq	.LC29(%rip), %rdi
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	call	fwrite@PLT
	movq	16(%r13), %r13
	movl	24(%r13), %edi
	cmpl	$19, %edi
	je	.L41
	movq	%r14, %rbp
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L59:
	leaq	.LC30(%rip), %rcx
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L58:
	movq	%rbp, %r14
.L41:
	movq	%r12, %rcx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	leaq	2(%r14), %rbp
	movl	$8, %edx
	movl	$1, %esi
	leaq	.LC12(%rip), %rdi
	call	fwrite@PLT
	movq	8(%r13), %r13
.L26:
	cmpl	$8, 8(%r13)
	leaq	-1(%rbp), %r14
	ja	.L27
	movl	8(%r13), %eax
	movq	%r12, %rcx
	xorl	%edx, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movslq	(%r15,%rax,4), %rax
	addq	%r15, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L29:
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
	.p2align 4,,10
	.p2align 3
.L30:
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC24(%rip), %rdi
.L54:
	call	fwrite@PLT
	movq	%r12, %rcx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	addq	$1, %rbp
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC22(%rip), %rdi
	call	fwrite@PLT
	movq	0(%r13), %r13
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L28:
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC25(%rip), %rdi
	call	fwrite@PLT
	movq	%r12, %rcx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movl	$1, %edx
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC22(%rip), %rdi
	call	fwrite@PLT
	movq	0(%r13), %rdi
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rcx
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	output_variable_access
	.p2align 4,,10
	.p2align 3
.L37:
	.cfi_restore_state
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC13(%rip), %rdi
.L55:
	call	fwrite@PLT
	movq	%r12, %rcx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	0(%r13), %rcx
	leaq	.LC14(%rip), %rdx
.L56:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbx, %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	__fprintf_chk@PLT
	.p2align 4,,10
	.p2align 3
.L36:
	.cfi_restore_state
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rdi
	jmp	.L55
	.p2align 4,,10
	.p2align 3
.L35:
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rdi
	call	fwrite@PLT
	movq	%r12, %rcx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	0(%r13), %rcx
	leaq	.LC17(%rip), %rdx
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L34:
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC18(%rip), %rdi
	call	fwrite@PLT
	movq	%r12, %rcx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC19(%rip), %rdi
.L57:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	fwrite@PLT
	.p2align 4,,10
	.p2align 3
.L33:
	.cfi_restore_state
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC18(%rip), %rdi
	call	fwrite@PLT
	movq	%r12, %rcx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC20(%rip), %rdi
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L32:
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$19, %edx
	movl	$1, %esi
	leaq	.LC21(%rip), %rdi
	call	fwrite@PLT
	movq	%r12, %rcx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC22(%rip), %rdi
	call	fwrite@PLT
	movq	0(%r13), %r13
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L31:
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC23(%rip), %rdi
	jmp	.L54
.L27:
	movq	%r12, %rcx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movl	$1, %edx
	call	indention@PLT
	movl	8(%r13), %ecx
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	movq	%rbx, %rdi
	leaq	.LC26(%rip), %rdx
	popq	%rbx
	.cfi_def_cfa_offset 48
	movl	$2, %esi
	popq	%rbp
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	__fprintf_chk@PLT
	.cfi_endproc
.LFE78:
	.size	output_expression, .-output_expression
	.section	.rodata.str1.1
.LC31:
	.string	"name\n"
.LC32:
	.string	"value: \"NULL\"\n"
	.text
	.p2align 4
	.type	output_variable, @function
output_variable:
.LFB72:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rdx, %r12
	xorl	%edx, %edx
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rcx, %rbp
	leaq	1(%r12), %r14
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rsi, %rbx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	fwrite@PLT
	movq	0(%r13), %rdi
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_name
	xorl	%edx, %edx
	movq	%rbp, %rcx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC31(%rip), %rdi
	call	fwrite@PLT
	movq	8(%r13), %rdi
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_name
	cmpq	$0, 16(%r13)
	movq	%rbp, %rcx
	movq	%r12, %rsi
	movl	$1, %edx
	movq	%rbx, %rdi
	je	.L61
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC22(%rip), %rdi
	call	fwrite@PLT
	movq	16(%r13), %rdi
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	output_expression
	.p2align 4,,10
	.p2align 3
.L61:
	.cfi_restore_state
	call	indention@PLT
	movq	%rbx, %rcx
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	movl	$14, %edx
	popq	%r12
	.cfi_def_cfa_offset 24
	movl	$1, %esi
	popq	%r13
	.cfi_def_cfa_offset 16
	leaq	.LC32(%rip), %rdi
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	fwrite@PLT
	.cfi_endproc
.LFE72:
	.size	output_variable, .-output_variable
	.section	.rodata.str1.1
.LC33:
	.string	"type: \"name\"\n"
.LC34:
	.string	"type: \"function_call\"\n"
.LC35:
	.string	"function\n"
.LC36:
	.string	"arguments\n"
.LC37:
	.string	"arguments[%d]\n"
.LC38:
	.string	"type: \"get sequence_element\"\n"
.LC39:
	.string	"sequence\n"
.LC40:
	.string	"index\n"
.LC41:
	.string	"type: \"get_attribute\"\n"
.LC42:
	.string	"object\n"
.LC43:
	.string	"attribute_name\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC44:
	.string	"unknown_VariableAccessType: %u\n"
	.text
	.p2align 4
	.type	output_variable_access, @function
output_variable_access:
.LFB80:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rcx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	16(%rdi), %eax
	cmpl	$2, %eax
	je	.L64
	ja	.L65
	testl	%eax, %eax
	je	.L78
	movq	8(%rdi), %rdi
	leaq	1(%r12), %r15
	call	list_copy@PLT
	movq	%rbp, %rcx
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$22, %edx
	movl	$1, %esi
	leaq	.LC34(%rip), %rdi
	call	fwrite@PLT
	movq	%rbp, %rcx
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC35(%rip), %rdi
	call	fwrite@PLT
	movq	0(%r13), %rdi
	movq	%rbp, %rcx
	movq	%r15, %rdx
	movq	%rbx, %rsi
	movl	$-1, %r13d
	call	output_variable_access
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC36(%rip), %rdi
	call	fwrite@PLT
	jmp	.L70
	.p2align 4,,10
	.p2align 3
.L71:
	movq	%rbp, %rcx
	xorl	%edx, %edx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	addl	$1, %r13d
	movl	$2, %esi
	xorl	%eax, %eax
	movl	%r13d, %ecx
	leaq	.LC37(%rip), %rdx
	movq	%rbx, %rdi
	call	__fprintf_chk@PLT
	leaq	2(%r12), %rdx
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	movq	%r14, %rdi
	call	output_expression
.L70:
	movq	8(%rsp), %rdi
	call	list_pop@PLT
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L71
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L65:
	.cfi_restore_state
	cmpl	$3, %eax
	jne	.L79
	movq	%r12, %rsi
	movq	%rbx, %rdi
	leaq	1(%r12), %r14
	xorl	%edx, %edx
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$29, %edx
	movl	$1, %esi
	leaq	.LC38(%rip), %rdi
	call	fwrite@PLT
	movq	%rbp, %rcx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	xorl	%edx, %edx
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC39(%rip), %rdi
	call	fwrite@PLT
	movq	0(%r13), %rdi
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_variable_access
	movq	%rbp, %rcx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movl	$1, %edx
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC40(%rip), %rdi
	call	fwrite@PLT
	movq	8(%r13), %rdi
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	output_expression
	.p2align 4,,10
	.p2align 3
.L64:
	.cfi_restore_state
	xorl	%edx, %edx
	movq	%r12, %rsi
	leaq	1(%r12), %r14
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$22, %edx
	movl	$1, %esi
	leaq	.LC41(%rip), %rdi
	call	fwrite@PLT
	movq	%rbp, %rcx
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC42(%rip), %rdi
	call	fwrite@PLT
	movq	0(%r13), %rdi
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	output_variable_access
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$15, %edx
	leaq	.LC43(%rip), %rdi
	movl	$1, %esi
	call	fwrite@PLT
	movq	8(%r13), %rdi
	movq	%rbp, %rcx
	movq	%r14, %rdx
.L77:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbx, %rsi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	output_name
	.p2align 4,,10
	.p2align 3
.L78:
	.cfi_restore_state
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$13, %edx
	movl	$1, %esi
	leaq	.LC33(%rip), %rdi
	call	fwrite@PLT
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$5, %edx
	leaq	.LC31(%rip), %rdi
	movl	$1, %esi
	call	fwrite@PLT
	movq	8(%r13), %rdi
	leaq	1(%r12), %rdx
	movq	%rbp, %rcx
	jmp	.L77
	.p2align 4,,10
	.p2align 3
.L79:
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movl	$1, %edx
	call	indention@PLT
	movl	16(%r13), %ecx
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	movq	%rbx, %rdi
	leaq	.LC44(%rip), %rdx
	popq	%rbx
	.cfi_def_cfa_offset 48
	movl	$2, %esi
	popq	%rbp
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	__fprintf_chk@PLT
	.cfi_endproc
.LFE80:
	.size	output_variable_access, .-output_variable_access
	.section	.rodata.str1.1
.LC45:
	.string	"if_statement\n"
.LC46:
	.string	"condition\n"
.LC47:
	.string	"body\n"
.LC48:
	.string	"else_if\n"
.LC49:
	.string	"else_body\n"
.LC50:
	.string	"for_statement\n"
.LC51:
	.string	"initializer\n"
.LC52:
	.string	"initializer: \"NULL\"\n"
.LC53:
	.string	"condition: \"NULL\"\n"
.LC54:
	.string	"increment\n"
.LC55:
	.string	"increment: \"NULL\"\n"
.LC56:
	.string	"while_statement\n"
	.section	.rodata.str1.8
	.align 8
.LC57:
	.string	"variable_declaration_statement\n"
	.section	.rodata.str1.1
.LC58:
	.string	"return_statement: \"NULL\"\n"
.LC59:
	.string	"return_statement\n"
.LC60:
	.string	"break_statement: \"NULL\"\n"
.LC61:
	.string	"continue_statement: \"NULL\"\n"
.LC62:
	.string	"expression_statement: \"NULL\"\n"
.LC63:
	.string	"expression_statement\n"
.LC64:
	.string	"unknown_StatementType: %u\n"
	.text
	.p2align 4
	.type	output_statement, @function
output_statement:
.LFB73:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rcx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	cmpl	$7, 8(%rdi)
	ja	.L81
	movl	8(%rdi), %eax
	leaq	.L83(%rip), %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	xorl	%edx, %edx
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L83:
	.long	.L90-.L83
	.long	.L89-.L83
	.long	.L88-.L83
	.long	.L87-.L83
	.long	.L86-.L83
	.long	.L85-.L83
	.long	.L84-.L83
	.long	.L82-.L83
	.text
	.p2align 4,,10
	.p2align 3
.L84:
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$24, %edx
	movl	$1, %esi
	leaq	.LC60(%rip), %rdi
.L114:
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	fwrite@PLT
	.p2align 4,,10
	.p2align 3
.L82:
	.cfi_restore_state
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$27, %edx
	movl	$1, %esi
	leaq	.LC61(%rip), %rdi
	jmp	.L114
	.p2align 4,,10
	.p2align 3
.L90:
	cmpq	$0, 0(%r13)
	je	.L116
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	.LC63(%rip), %rdi
.L115:
	call	fwrite@PLT
	movq	0(%r13), %rdi
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbp, %rcx
	leaq	1(%r12), %rdx
	movq	%rbx, %rsi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	output_expression
	.p2align 4,,10
	.p2align 3
.L89:
	.cfi_restore_state
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC57(%rip), %rdi
	call	fwrite@PLT
	movq	0(%r13), %rdi
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbp, %rcx
	leaq	1(%r12), %rdx
	movq	%rbx, %rsi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	output_variable
	.p2align 4,,10
	.p2align 3
.L88:
	.cfi_restore_state
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$13, %edx
	movl	$1, %esi
	leaq	.LC45(%rip), %rdi
	call	fwrite@PLT
	movq	0(%r13), %r14
	leaq	1(%r12), %rax
	leaq	2(%r12), %r13
	movq	%rax, 24(%rsp)
	movq	8(%r14), %rdi
	call	list_copy@PLT
	movq	16(%r14), %rdi
	movq	%rax, %r15
	call	list_copy@PLT
	movq	24(%r14), %rdi
	movq	%rax, 8(%rsp)
	call	list_copy@PLT
	movq	%rbp, %rcx
	xorl	%edx, %edx
	leaq	1(%r12), %rsi
	movq	%rbx, %rdi
	movq	%rax, 16(%rsp)
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC46(%rip), %rdi
	call	fwrite@PLT
	movq	(%r14), %rdi
	movq	%rbp, %rcx
	movq	%r13, %rdx
	movq	%rbx, %rsi
	call	output_expression
	movq	24(%rsp), %rsi
	movq	%rbp, %rcx
	xorl	%edx, %edx
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC47(%rip), %rdi
	call	fwrite@PLT
	jmp	.L91
	.p2align 4,,10
	.p2align 3
.L92:
	movq	%r13, %rdx
	movq	%rbx, %rsi
	call	output_statement
.L91:
	movq	%r15, %rdi
	call	list_pop@PLT
	movq	%rbp, %rcx
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L92
	movq	24(%rsp), %rsi
	xorl	%edx, %edx
	movq	%rbx, %rdi
	leaq	3(%r12), %r15
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$8, %edx
	movl	$1, %esi
	leaq	.LC48(%rip), %rdi
	call	fwrite@PLT
.L93:
	movq	8(%rsp), %rdi
	call	list_pop@PLT
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L117
	movq	8(%r14), %rdi
	call	list_copy@PLT
	xorl	%edx, %edx
	movq	%rbp, %rcx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	%rax, %r12
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC46(%rip), %rdi
	call	fwrite@PLT
	movq	(%r14), %rdi
	movq	%rbp, %rcx
	movq	%r15, %rdx
	movq	%rbx, %rsi
	call	output_expression
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	leaq	.LC47(%rip), %rdi
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	call	fwrite@PLT
	movq	%r12, %rdi
	call	list_pop@PLT
	testq	%rax, %rax
	je	.L93
.L95:
	movq	%rax, %rdi
	movq	%rbp, %rcx
	movq	%r15, %rdx
	movq	%rbx, %rsi
	call	output_statement
	movq	%r12, %rdi
	call	list_pop@PLT
	testq	%rax, %rax
	jne	.L95
	jmp	.L93
	.p2align 4,,10
	.p2align 3
.L87:
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC56(%rip), %rdi
	leaq	1(%r12), %r14
	addq	$2, %r12
	call	fwrite@PLT
	movq	0(%r13), %r15
	movq	8(%r15), %rdi
	call	list_copy@PLT
	movq	%rbp, %rcx
	xorl	%edx, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movq	%rax, %r13
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC46(%rip), %rdi
	call	fwrite@PLT
	movq	(%r15), %rdi
	movq	%rbp, %rcx
	movq	%r12, %rdx
	movq	%rbx, %rsi
	call	output_expression
	movq	%rbp, %rcx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movl	$1, %edx
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC47(%rip), %rdi
	call	fwrite@PLT
	jmp	.L109
	.p2align 4,,10
	.p2align 3
.L110:
	movq	%rbp, %rcx
	movq	%r12, %rdx
	movq	%rbx, %rsi
	call	output_statement
.L109:
	movq	%r13, %rdi
	call	list_pop@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L110
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L86:
	.cfi_restore_state
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC50(%rip), %rdi
	leaq	1(%r12), %r14
	call	fwrite@PLT
	movq	0(%r13), %r15
	movq	24(%r15), %rdi
	call	list_copy@PLT
	xorl	%edx, %edx
	cmpq	$0, (%r15)
	movq	%rbp, %rcx
	movq	%rax, %r13
	movq	%r14, %rsi
	movq	%rbx, %rdi
	je	.L100
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC51(%rip), %rdi
	call	fwrite@PLT
	movq	(%r15), %rdi
	leaq	2(%r12), %rdx
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	call	output_variable
.L101:
	xorl	%edx, %edx
	cmpq	$0, 8(%r15)
	movq	%rbp, %rcx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	je	.L102
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC46(%rip), %rdi
	call	fwrite@PLT
	movq	8(%r15), %rdi
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	leaq	2(%r12), %rdx
	call	output_expression
.L103:
	xorl	%edx, %edx
	cmpq	$0, 16(%r15)
	movq	%rbp, %rcx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	je	.L104
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC54(%rip), %rdi
	call	fwrite@PLT
	movq	16(%r15), %rdi
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	leaq	2(%r12), %rdx
	call	output_expression
.L105:
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	indention@PLT
	movq	%rbx, %rcx
	addq	$2, %r12
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC47(%rip), %rdi
	call	fwrite@PLT
	jmp	.L106
	.p2align 4,,10
	.p2align 3
.L107:
	movq	%rbp, %rcx
	movq	%r12, %rdx
	movq	%rbx, %rsi
	call	output_statement
.L106:
	movq	%r13, %rdi
	call	list_pop@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L107
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L85:
	.cfi_restore_state
	cmpq	$0, 0(%r13)
	je	.L118
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC59(%rip), %rdi
	jmp	.L115
.L81:
	movq	%r12, %rsi
	movq	%rbx, %rdi
	xorl	%edx, %edx
	call	indention@PLT
	movl	8(%r13), %ecx
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbx, %rdi
	leaq	.LC64(%rip), %rdx
	popq	%rbx
	.cfi_def_cfa_offset 48
	movl	$2, %esi
	popq	%rbp
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	__fprintf_chk@PLT
	.p2align 4,,10
	.p2align 3
.L117:
	.cfi_restore_state
	movq	24(%rsp), %rsi
	movq	%rbp, %rcx
	movq	%rbx, %rdi
	movl	$1, %edx
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC49(%rip), %rdi
	call	fwrite@PLT
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L98:
	movq	%rbp, %rcx
	movq	%r13, %rdx
	movq	%rbx, %rsi
	call	output_statement
.L97:
	movq	16(%rsp), %rdi
	call	list_pop@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L98
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L100:
	.cfi_restore_state
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	.LC52(%rip), %rdi
	call	fwrite@PLT
	jmp	.L101
.L104:
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$18, %edx
	movl	$1, %esi
	leaq	.LC55(%rip), %rdi
	call	fwrite@PLT
	jmp	.L105
.L102:
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$18, %edx
	movl	$1, %esi
	leaq	.LC53(%rip), %rdi
	call	fwrite@PLT
	jmp	.L103
.L116:
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$29, %edx
	movl	$1, %esi
	leaq	.LC62(%rip), %rdi
	jmp	.L114
.L118:
	call	indention@PLT
	movq	%rbx, %rcx
	movl	$25, %edx
	movl	$1, %esi
	leaq	.LC58(%rip), %rdi
	jmp	.L114
	.cfi_endproc
.LFE73:
	.size	output_statement, .-output_statement
	.section	.rodata.str1.1
.LC65:
	.string	"NULL"
.LC66:
	.string	"import\n"
.LC67:
	.string	"source: \"%s\"\n"
.LC68:
	.string	"parameters\n"
.LC69:
	.string	"parameters[%d]\n"
.LC70:
	.string	"class\n"
.LC71:
	.string	"members\n"
.LC72:
	.string	"method\n"
.LC73:
	.string	"variable\n"
.LC74:
	.string	"unknown_ClassMemberType: %u\n"
.LC75:
	.string	"unknown_CodeMemberType: %u\n"
	.text
	.p2align 4
	.globl	output_code
	.type	output_code, @function
output_code:
.LFB66:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdx, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rcx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	(%rdi), %rdi
	call	list_copy@PLT
	movq	%rax, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L120:
	movq	40(%rsp), %rdi
	call	list_pop@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L144
	movl	8(%rbx), %eax
	leaq	1(%r15), %rsi
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r13, %rdi
	cmpl	$1, %eax
	je	.L121
	cmpl	$2, %eax
	je	.L122
	testl	%eax, %eax
	jne	.L123
	call	indention@PLT
	leaq	2(%r15), %rbp
	movq	%r13, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC66(%rip), %rdi
	call	fwrite@PLT
	movq	(%rbx), %rbx
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	indention@PLT
	movq	%r13, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC31(%rip), %rdi
	call	fwrite@PLT
	movq	(%rbx), %rdi
	leaq	3(%r15), %rdx
	movq	%r14, %rcx
	movq	%r13, %rsi
	call	output_name
	movq	%r14, %rcx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	movl	$1, %edx
	call	indention@PLT
	movq	8(%rbx), %rcx
	movl	$2, %esi
	movq	%r13, %rdi
	leaq	.LC65(%rip), %rax
	leaq	.LC67(%rip), %rdx
	testq	%rcx, %rcx
	cmove	%rax, %rcx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	jmp	.L120
	.p2align 4,,10
	.p2align 3
.L121:
	call	indention@PLT
	leaq	2(%r15), %r12
	movq	%r13, %rcx
	leaq	3(%r15), %rbp
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC35(%rip), %rdi
	call	fwrite@PLT
	movq	(%rbx), %rbx
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%r13, %rdi
	movq	%r12, 8(%rsp)
	call	indention@PLT
	movq	%r13, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC31(%rip), %rdi
	call	fwrite@PLT
	movq	(%rbx), %rdi
	movq	%r14, %rcx
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	output_name
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	indention@PLT
	movq	%r13, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	fwrite@PLT
	movq	8(%rbx), %rdi
	movq	%r14, %rcx
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	output_name
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	indention@PLT
	movq	%r13, %rcx
	movl	$11, %edx
	movl	$1, %esi
	leaq	.LC68(%rip), %rdi
	call	fwrite@PLT
	movq	16(%rbx), %rdi
	call	list_copy@PLT
	movq	24(%rbx), %rdi
	movl	$-1, %ebx
	movq	%rax, (%rsp)
	call	list_copy@PLT
	movq	%rax, 16(%rsp)
	jmp	.L126
	.p2align 4,,10
	.p2align 3
.L127:
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	indention@PLT
	addl	$1, %ebx
	movl	$2, %esi
	movq	%r13, %rdi
	movl	%ebx, %ecx
	leaq	.LC69(%rip), %rdx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	leaq	4(%r15), %rdx
	movq	%r14, %rcx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	output_variable
.L126:
	movq	(%rsp), %rdi
	call	list_pop@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L127
	movq	8(%rsp), %rsi
	movq	%r14, %rcx
	movq	%r13, %rdi
	movl	$1, %edx
	movq	16(%rsp), %r12
	call	indention@PLT
	movq	%r13, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC47(%rip), %rdi
	call	fwrite@PLT
	jmp	.L128
	.p2align 4,,10
	.p2align 3
.L129:
	movq	%r14, %rcx
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	output_statement
.L128:
	movq	%r12, %rdi
	call	list_pop@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L129
	jmp	.L120
	.p2align 4,,10
	.p2align 3
.L123:
	call	indention@PLT
	movl	8(%rbx), %ecx
	movl	$2, %esi
	movq	%r13, %rdi
	leaq	.LC75(%rip), %rdx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	jmp	.L120
	.p2align 4,,10
	.p2align 3
.L122:
	call	indention@PLT
	leaq	2(%r15), %rbp
	movq	%r13, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC70(%rip), %rdi
	call	fwrite@PLT
	movq	(%rbx), %rbx
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	indention@PLT
	movq	%r13, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC31(%rip), %rdi
	call	fwrite@PLT
	leaq	3(%r15), %rax
	movq	(%rbx), %rdi
	movq	%r14, %rcx
	movq	%rax, %rdx
	movq	%r13, %rsi
	movq	%rax, 16(%rsp)
	call	output_name
	movq	%r14, %rcx
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	indention@PLT
	movq	%r13, %rcx
	movl	$8, %edx
	movl	$1, %esi
	leaq	.LC71(%rip), %rdi
	call	fwrite@PLT
	movq	8(%rbx), %rdi
	call	list_copy@PLT
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L130:
	movq	8(%rsp), %rdi
	call	list_pop@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L120
	movl	8(%rbx), %eax
	testl	%eax, %eax
	je	.L131
	cmpl	$1, %eax
	je	.L132
	movq	16(%rsp), %rsi
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r13, %rdi
	call	indention@PLT
	movl	8(%rbx), %ecx
	movl	$2, %esi
	movq	%r13, %rdi
	leaq	.LC74(%rip), %rdx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	jmp	.L130
	.p2align 4,,10
	.p2align 3
.L131:
	movq	16(%rsp), %rsi
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r13, %rdi
	leaq	5(%r15), %rbp
	call	indention@PLT
	movq	%r13, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC72(%rip), %rdi
	call	fwrite@PLT
	leaq	4(%r15), %rax
	movq	(%rbx), %rbx
	movq	%r14, %rcx
	movq	%rax, %rsi
	xorl	%edx, %edx
	movq	%r13, %rdi
	movq	%rax, %r12
	movq	%rax, 24(%rsp)
	call	indention@PLT
	movq	%r13, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC31(%rip), %rdi
	call	fwrite@PLT
	movq	(%rbx), %rdi
	movq	%r14, %rcx
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	output_name
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	indention@PLT
	movq	%r13, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	fwrite@PLT
	movq	8(%rbx), %rdi
	movq	%r14, %rcx
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	output_name
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	indention@PLT
	movq	%r13, %rcx
	movl	$11, %edx
	movl	$1, %esi
	leaq	.LC68(%rip), %rdi
	call	fwrite@PLT
	movq	16(%rbx), %rdi
	call	list_copy@PLT
	movq	24(%rbx), %rdi
	movl	$-1, %ebx
	movq	%rax, (%rsp)
	call	list_copy@PLT
	movq	%rax, 32(%rsp)
	jmp	.L134
	.p2align 4,,10
	.p2align 3
.L135:
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	indention@PLT
	addl	$1, %ebx
	movl	$2, %esi
	movq	%r13, %rdi
	movl	%ebx, %ecx
	leaq	.LC69(%rip), %rdx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	leaq	6(%r15), %rdx
	movq	%r14, %rcx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	output_variable
.L134:
	movq	(%rsp), %rdi
	call	list_pop@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L135
	movq	24(%rsp), %rsi
	movq	%r14, %rcx
	movq	%r13, %rdi
	movl	$1, %edx
	movq	32(%rsp), %r12
	call	indention@PLT
	movq	%r13, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC47(%rip), %rdi
	call	fwrite@PLT
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L137:
	movq	%r14, %rcx
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	output_statement
.L136:
	movq	%r12, %rdi
	call	list_pop@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L137
	jmp	.L130
	.p2align 4,,10
	.p2align 3
.L132:
	movq	16(%rsp), %rsi
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%r13, %rdi
	call	indention@PLT
	movq	%r13, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC73(%rip), %rdi
	call	fwrite@PLT
	movq	(%rbx), %rdi
	leaq	4(%r15), %rdx
	movq	%r14, %rcx
	movq	%r13, %rsi
	call	output_variable
	jmp	.L130
	.p2align 4,,10
	.p2align 3
.L144:
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE66:
	.size	output_code, .-output_code
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
