	.file	"create.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Error creating code member: content is NULL\n"
.LC1:
	.string	"Error creating code member: unknown type %u\n"
	.text
	.globl	create_code_member
	.type	create_code_member, @function
create_code_member:
.LFB50:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rcx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	%edi, %ebx
	movl	$16, %edi
	pushq	%r8
	.cfi_def_cfa_offset 48
	call	alloc_memory@PLT
	movl	%ebx, 8(%rax)
	testl	%ebx, %ebx
	jne	.L2
	testq	%r12, %r12
	je	.L2
	movq	%r12, (%rax)
	jmp	.L1
.L2:
	cmpl	$1, %ebx
	jne	.L4
	testq	%r13, %r13
	je	.L4
	movq	%r13, (%rax)
	jmp	.L1
.L4:
	cmpl	$2, %ebx
	jne	.L6
	testq	%rbp, %rbp
	je	.L6
	movq	%rbp, (%rax)
	jmp	.L1
.L6:
	orq	%r13, %rbp
	movq	stderr(%rip), %rdi
	orq	%rbp, %r12
	jne	.L7
	movq	%rdi, %rsi
	leaq	.LC0(%rip), %rdi
	call	fputs@PLT
	jmp	.L8
.L7:
	movl	%ebx, %ecx
	leaq	.LC1(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
.L8:
	xorl	%eax, %eax
.L1:
	popq	%rdx
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE50:
	.size	create_code_member, .-create_code_member
	.globl	create_code
	.type	create_code, @function
create_code:
.LFB51:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	movl	$16, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbx
	pushq	%rax
	.cfi_def_cfa_offset 32
	call	alloc_memory@PLT
	movq	%rbp, (%rax)
	movq	%rbx, 8(%rax)
	popq	%rdx
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE51:
	.size	create_code, .-create_code
	.section	.rodata.str1.1
.LC2:
	.string	"Error creating import: name is NULL\n"
	.text
	.globl	create_import
	.type	create_import, @function
create_import:
.LFB52:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	pushq	%rcx
	.cfi_def_cfa_offset 32
	testq	%rdi, %rdi
	jne	.L32
	movq	stderr(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	fputs@PLT
	xorl	%eax, %eax
	jmp	.L31
.L32:
	movq	%rdi, %rbx
	movl	$16, %edi
	movq	%rsi, %rbp
	call	alloc_memory@PLT
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
.L31:
	popq	%rdx
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE52:
	.size	create_import, .-create_import
	.section	.rodata.str1.1
.LC3:
	.string	"Error creating function: name or return_type is NULL\n"
	.text
	.globl	create_function
	.type	create_function, @function
create_function:
.LFB53:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	testq	%rdi, %rdi
	je	.L39
	movq	%rsi, %rbx
	testq	%rsi, %rsi
	jne	.L36
.L39:
	movq	stderr(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	fputs@PLT
	xorl	%eax, %eax
	jmp	.L35
.L36:
	movq	%rdi, %rbp
	movl	$40, %edi
	movq	%rdx, %r14
	movq	%rcx, %r13
	movq	%r8, %r12
	call	alloc_memory@PLT
	movq	%rbp, (%rax)
	movq	%rbx, 8(%rax)
	movq	%r14, 16(%rax)
	movq	%r13, 24(%rax)
	movq	%r12, 32(%rax)
.L35:
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE53:
	.size	create_function, .-create_function
	.section	.rodata.str1.1
.LC4:
	.string	"Error creating method: name or return_type is NULL\n"
	.text
	.globl	create_method
	.type	create_method, @function
create_method:
.LFB54:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	testq	%rdi, %rdi
	je	.L45
	movq	%rsi, %rbx
	testq	%rsi, %rsi
	jne	.L42
.L45:
	movq	stderr(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	call	fputs@PLT
	xorl	%eax, %eax
	jmp	.L41
.L42:
	movq	%rdi, %rbp
	movl	$40, %edi
	movq	%rdx, %r14
	movq	%rcx, %r13
	movq	%r8, %r12
	call	alloc_memory@PLT
	movq	%rbp, (%rax)
	movq	%rbx, 8(%rax)
	movq	%r14, 16(%rax)
	movq	%r13, 24(%rax)
	movq	%r12, 32(%rax)
.L41:
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE54:
	.size	create_method, .-create_method
	.section	.rodata.str1.1
.LC5:
	.string	"Error creating class member: content is NULL\n"
.LC6:
	.string	"Error creating class member: unknown type %u\n"
	.text
	.globl	create_class_member
	.type	create_class_member, @function
create_class_member:
.LFB55:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%edi, %ebx
	movl	$16, %edi
	call	alloc_memory@PLT
	movl	%ebx, 8(%rax)
	testl	%ebx, %ebx
	jne	.L48
	testq	%rbp, %rbp
	je	.L48
	movq	%rbp, (%rax)
	jmp	.L47
.L48:
	cmpl	$1, %ebx
	jne	.L50
	testq	%r12, %r12
	je	.L50
	movq	%r12, (%rax)
	jmp	.L47
.L50:
	orq	%r12, %rbp
	movq	stderr(%rip), %rdi
	jne	.L52
	movq	%rdi, %rsi
	leaq	.LC5(%rip), %rdi
	call	fputs@PLT
	jmp	.L53
.L52:
	movl	%ebx, %ecx
	leaq	.LC6(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
.L53:
	xorl	%eax, %eax
.L47:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE55:
	.size	create_class_member, .-create_class_member
	.section	.rodata.str1.1
.LC7:
	.string	"Error creating class: name is NULL\n"
	.text
	.globl	create_class
	.type	create_class, @function
create_class:
.LFB56:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	testq	%rdi, %rdi
	jne	.L68
	movq	stderr(%rip), %rsi
	leaq	.LC7(%rip), %rdi
	call	fputs@PLT
	xorl	%eax, %eax
	jmp	.L67
.L68:
	movq	%rdi, %rbx
	movl	$24, %edi
	movq	%rsi, %r12
	movq	%rdx, %rbp
	call	alloc_memory@PLT
	movq	%rbx, (%rax)
	movq	%r12, 8(%rax)
	movq	%rbp, 16(%rax)
.L67:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE56:
	.size	create_class, .-create_class
	.section	.rodata.str1.1
.LC8:
	.string	"Error creating variable: type or name is NULL\n"
	.text
	.globl	create_variable
	.type	create_variable, @function
create_variable:
.LFB57:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	testq	%rdi, %rdi
	je	.L75
	movq	%rsi, %rbx
	testq	%rsi, %rsi
	jne	.L72
.L75:
	movq	stderr(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	fputs@PLT
	xorl	%eax, %eax
	jmp	.L71
.L72:
	movq	%rdi, %rbp
	movl	$24, %edi
	movq	%rdx, %r12
	call	alloc_memory@PLT
	movq	%rbp, (%rax)
	movq	%rbx, 8(%rax)
	movq	%r12, 16(%rax)
.L71:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE57:
	.size	create_variable, .-create_variable
	.section	.rodata.str1.1
.LC9:
	.string	"Error creating statement: content is NULL\n"
.LC10:
	.string	"Error creating statement: unknown type %u\n"
	.text
	.globl	create_statement
	.type	create_statement, @function
create_statement:
.LFB58:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdx, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%r8, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%r9, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edi, %ebx
	movl	$16, %edi
	pushq	%r10
	.cfi_def_cfa_offset 64
	call	alloc_memory@PLT
	testq	%r14, %r14
	movl	%ebx, 8(%rax)
	setne	%dl
	testl	%ebx, %ebx
	jne	.L78
	testb	%dl, %dl
	jne	.L126
.L78:
	cmpl	$1, %ebx
	jne	.L80
	testq	%rbp, %rbp
	je	.L80
	movq	%rbp, (%rax)
	jmp	.L77
.L80:
	cmpl	$2, %ebx
	jne	.L82
	testq	%r12, %r12
	je	.L82
	movq	%r12, (%rax)
	jmp	.L77
.L82:
	cmpl	$3, %ebx
	jne	.L83
	testq	%r15, %r15
	je	.L83
	movq	%r15, (%rax)
	jmp	.L77
.L83:
	cmpl	$4, %ebx
	jne	.L84
	testq	%r13, %r13
	je	.L84
	movq	%r13, (%rax)
	jmp	.L77
.L84:
	cmpl	$5, %ebx
	jne	.L85
	testb	%dl, %dl
	je	.L85
.L126:
	movq	%r14, (%rax)
	jmp	.L77
.L85:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L86
	xorl	%ecx, %ecx
	movq	%rcx, (%rax)
	jmp	.L77
.L86:
	orq	%r15, %r13
	movq	stderr(%rip), %rdi
	orq	%r13, %r12
	orq	%r12, %rbp
	orq	%r14, %rbp
	jne	.L87
	movq	%rdi, %rsi
	leaq	.LC9(%rip), %rdi
	call	fputs@PLT
	jmp	.L88
.L87:
	movl	%ebx, %ecx
	leaq	.LC10(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
.L88:
	xorl	%eax, %eax
.L77:
	popq	%rdx
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
.LFE58:
	.size	create_statement, .-create_statement
	.section	.rodata.str1.1
.LC11:
	.string	"Error creating if statement: condition is NULL\n"
	.text
	.globl	create_if
	.type	create_if, @function
create_if:
.LFB59:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	pushq	%r8
	.cfi_def_cfa_offset 48
	testq	%rdi, %rdi
	jne	.L128
	movq	stderr(%rip), %rsi
	leaq	.LC11(%rip), %rdi
	call	fputs@PLT
	xorl	%eax, %eax
	jmp	.L127
.L128:
	movq	%rdi, %rbx
	movl	$32, %edi
	movq	%rsi, %r13
	movq	%rdx, %r12
	movq	%rcx, %rbp
	call	alloc_memory@PLT
	movq	%rbx, (%rax)
	movq	%r13, 8(%rax)
	movq	%r12, 16(%rax)
	movq	%rbp, 24(%rax)
.L127:
	popq	%rdx
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE59:
	.size	create_if, .-create_if
	.section	.rodata.str1.1
.LC12:
	.string	"Error creating else-if statement: condition is NULL\n"
	.text
	.globl	create_else_if
	.type	create_else_if, @function
create_else_if:
.LFB60:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	pushq	%rcx
	.cfi_def_cfa_offset 32
	testq	%rdi, %rdi
	jne	.L132
	movq	stderr(%rip), %rsi
	leaq	.LC12(%rip), %rdi
	call	fputs@PLT
	xorl	%eax, %eax
	jmp	.L131
.L132:
	movq	%rdi, %rbx
	movl	$16, %edi
	movq	%rsi, %rbp
	call	alloc_memory@PLT
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
.L131:
	popq	%rdx
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE60:
	.size	create_else_if, .-create_else_if
	.globl	create_for
	.type	create_for, @function
create_for:
.LFB61:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rdi, %r13
	movl	$32, %edi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rcx, %rbx
	pushq	%rax
	.cfi_def_cfa_offset 48
	call	alloc_memory@PLT
	movq	%r13, (%rax)
	movq	%r12, 8(%rax)
	movq	%rbp, 16(%rax)
	movq	%rbx, 24(%rax)
	popq	%rdx
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE61:
	.size	create_for, .-create_for
	.globl	create_while
	.type	create_while, @function
create_while:
.LFB62:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	movl	$16, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbx
	pushq	%rax
	.cfi_def_cfa_offset 32
	call	alloc_memory@PLT
	movq	%rbp, (%rax)
	movq	%rbx, 8(%rax)
	popq	%rdx
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE62:
	.size	create_while, .-create_while
	.section	.rodata.str1.1
.LC13:
	.string	"true"
.LC14:
	.string	"false"
.LC15:
	.string	"Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n"
.LC16:
	.string	"Error creating expression: both expr_left and prim_left are NULL\n"
	.text
	.globl	create_expression
	.type	create_expression, @function
create_expression:
.LFB63:
	.cfi_startproc
	endbr64
	cmpl	$19, %edi
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	%edi, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdx, %r12
	sete	%dl
	testq	%rcx, %rcx
	sete	%al
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rcx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rsi, %rbx
	pushq	%r9
	.cfi_def_cfa_offset 48
	cmpb	%al, %dl
	jne	.L140
	movq	%r12, %rax
	orq	%rsi, %rax
	jne	.L157
	jmp	.L159
.L140:
	leaq	.LC14(%rip), %r9
	leaq	.LC13(%rip), %rdx
	testq	%rcx, %rcx
	movq	%r9, %rax
	cmove	%rdx, %rax
	testq	%r12, %r12
	cmove	%rdx, %r9
.L144:
	testq	%rbx, %rbx
	leaq	.LC14(%rip), %r8
	leaq	.LC13(%rip), %rdx
	cmove	%rdx, %r8
	jmp	.L145
.L159:
	leaq	.LC14(%rip), %rax
	leaq	.LC13(%rip), %r9
	testq	%rcx, %rcx
	jne	.L144
	leaq	.LC13(%rip), %rax
	movq	%rax, %r9
	movq	%rax, %r8
.L145:
	cmpl	$19, %r13d
	leaq	.LC13(%rip), %rdx
	pushq	%rsi
	.cfi_def_cfa_offset 56
	leaq	.LC14(%rip), %rcx
	pushq	%rax
	.cfi_def_cfa_offset 64
	cmove	%rdx, %rcx
	movl	$2, %esi
	xorl	%eax, %eax
	movq	stderr(%rip), %rdi
	leaq	.LC15(%rip), %rdx
	call	__fprintf_chk@PLT
	popq	%rdi
	.cfi_def_cfa_offset 56
	popq	%r8
	.cfi_def_cfa_offset 48
	jmp	.L147
.L157:
	movl	$32, %edi
	call	alloc_memory@PLT
	movl	%r13d, 24(%rax)
	testq	%rbx, %rbx
	je	.L148
	movq	%rbx, (%rax)
	jmp	.L149
.L148:
	testq	%r12, %r12
	je	.L150
	movq	%r12, 8(%rax)
	jmp	.L149
.L150:
	movq	stderr(%rip), %rsi
	leaq	.LC16(%rip), %rdi
	call	fputs@PLT
.L147:
	xorl	%eax, %eax
	jmp	.L139
.L149:
	movq	%rbp, 16(%rax)
.L139:
	popq	%rdx
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE63:
	.size	create_expression, .-create_expression
	.section	.rodata.str1.1
.LC17:
	.string	"Error creating primary: value is NULL\n"
.LC18:
	.string	"Error creating primary: unknown type %u\n"
	.text
	.globl	create_primary
	.type	create_primary, @function
create_primary:
.LFB64:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rcx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%r8, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	%edi, %ebx
	movl	$16, %edi
	call	alloc_memory@PLT
	movl	%ebx, 8(%rax)
	cmpl	$4, %ebx
	ja	.L161
	testq	%r13, %r13
	je	.L161
	movq	%r13, (%rax)
	jmp	.L160
.L161:
	cmpl	$5, %ebx
	jne	.L163
	testq	%rbp, %rbp
	je	.L163
	movq	%rbp, (%rax)
	jmp	.L160
.L163:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L165
	testq	%r14, %r14
	je	.L165
	movq	%r14, (%rax)
	jmp	.L160
.L165:
	cmpl	$8, %ebx
	jne	.L166
	testq	%r12, %r12
	je	.L166
	movq	%r12, (%rax)
	jmp	.L160
.L166:
	orq	%r14, %r12
	movq	stderr(%rip), %rdi
	orq	%r12, %rbp
	orq	%r13, %rbp
	jne	.L167
	movq	%rdi, %rsi
	leaq	.LC17(%rip), %rdi
	call	fputs@PLT
	jmp	.L168
.L167:
	movl	%ebx, %ecx
	leaq	.LC18(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
.L168:
	xorl	%eax, %eax
.L160:
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE64:
	.size	create_primary, .-create_primary
	.section	.rodata.str1.1
.LC19:
	.string	"Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n"
.LC20:
	.string	"Error creating variable access: content is NULL\n"
.LC21:
	.string	"Error creating variable access: unknown type %u\n"
	.text
	.globl	create_variable_access
	.type	create_variable_access, @function
create_variable_access:
.LFB65:
	.cfi_startproc
	endbr64
	testl	%edi, %edi
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	sete	%al
	testq	%rsi, %rsi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14
	sete	%r15b
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edi, %ebx
	pushq	%r9
	.cfi_def_cfa_offset 64
	cmpb	%al, %r15b
	je	.L195
	leaq	.LC13(%rip), %rax
	testl	%edi, %edi
	leaq	.LC14(%rip), %rcx
	movq	stderr(%rip), %rdi
	movq	%rax, %r8
	leaq	.LC19(%rip), %rdx
	cmovne	%rcx, %r8
	testq	%rsi, %rsi
	movl	$2, %esi
	cmove	%rax, %rcx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	jmp	.L198
.L195:
	movq	%rdx, %r12
	movl	$24, %edi
	movq	%rcx, %rbp
	movq	%r8, %r13
	call	alloc_memory@PLT
	testq	%r12, %r12
	movl	%ebx, 16(%rax)
	setne	%dl
	movq	%r14, (%rax)
	testb	%r15b, %r15b
	je	.L199
	testb	%dl, %dl
	jne	.L233
.L199:
	cmpl	$1, %ebx
	jne	.L201
	testq	%r13, %r13
	je	.L201
	movq	%r13, 8(%rax)
	jmp	.L194
.L201:
	cmpl	$3, %ebx
	jne	.L203
	testq	%rbp, %rbp
	je	.L203
	movq	%rbp, 8(%rax)
	jmp	.L194
.L203:
	cmpl	$2, %ebx
	jne	.L204
	testb	%dl, %dl
	je	.L204
.L233:
	movq	%r12, 8(%rax)
	jmp	.L194
.L204:
	orq	%r13, %rbp
	movq	stderr(%rip), %rdi
	orq	%r12, %rbp
	jne	.L205
	movq	%rdi, %rsi
	leaq	.LC20(%rip), %rdi
	call	fputs@PLT
	jmp	.L198
.L205:
	movl	%ebx, %ecx
	leaq	.LC21(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
.L198:
	xorl	%eax, %eax
.L194:
	popq	%rdx
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
.LFE65:
	.size	create_variable_access, .-create_variable_access
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
