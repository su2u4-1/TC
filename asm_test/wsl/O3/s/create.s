	.file	"create.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Error creating code member: content is NULL\n"
	.align 8
.LC1:
	.string	"Error creating code member: unknown type %u\n"
	.text
	.p2align 4
	.globl	create_code_member
	.type	create_code_member, @function
create_code_member:
	pushq	%r13
	movq	%rcx, %r13
	pushq	%r12
	movq	%rdx, %r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movl	%edi, %ebx
	movl	$16, %edi
	subq	$8, %rsp
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%ebx, 8(%rax)
	testl	%ebx, %ebx
	jne	.L2
	testq	%rbp, %rbp
	je	.L2
	movq	%rbp, (%rax)
.L1:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L2:
	cmpl	$1, %ebx
	jne	.L4
	testq	%r12, %r12
	je	.L4
	movq	%r12, (%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	cmpl	$2, %ebx
	jne	.L6
	testq	%r13, %r13
	je	.L6
	movq	%r13, (%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	movq	%r13, %rcx
	movq	stderr(%rip), %rdi
	orq	%r12, %rcx
	orq	%rcx, %rbp
	je	.L29
	movl	%ebx, %ecx
	leaq	.LC1(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L1
.L29:
	movq	%rdi, %rcx
	movl	$44, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L1
	.size	create_code_member, .-create_code_member
	.p2align 4
	.globl	create_code
	.type	create_code, @function
create_code:
	pushq	%rbp
	movq	%rdi, %rbp
	movl	$16, %edi
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$8, %rsp
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, (%rax)
	movq	%rbx, 8(%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.size	create_code, .-create_code
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"Error creating import: name is NULL\n"
	.text
	.p2align 4
	.globl	create_import
	.type	create_import, @function
create_import:
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	testq	%rdi, %rdi
	je	.L36
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
.L32:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L36:
	movq	stderr(%rip), %rcx
	movl	$36, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L32
	.size	create_import, .-create_import
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"Error creating function: name or return_type is NULL\n"
	.text
	.p2align 4
	.globl	create_function
	.type	create_function, @function
create_function:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	testq	%rdi, %rdi
	je	.L41
	movq	%rsi, %rbp
	testq	%rsi, %rsi
	je	.L41
	movq	%rdi, %rbx
	movq	%rdx, %r14
	movq	%rcx, %r13
	movq	%r8, %r12
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
	movq	%r14, 16(%rax)
	movq	%r13, 24(%rax)
	movq	%r12, 32(%rax)
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L41:
	movq	stderr(%rip), %rcx
	movl	$53, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	popq	%rbx
	xorl	%eax, %eax
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	create_function, .-create_function
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"Error creating method: name or return_type is NULL\n"
	.text
	.p2align 4
	.globl	create_method
	.type	create_method, @function
create_method:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	testq	%rdi, %rdi
	je	.L47
	movq	%rsi, %rbp
	testq	%rsi, %rsi
	je	.L47
	movq	%rdi, %rbx
	movq	%rdx, %r14
	movq	%rcx, %r13
	movq	%r8, %r12
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
	movq	%r14, 16(%rax)
	movq	%r13, 24(%rax)
	movq	%r12, 32(%rax)
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L47:
	movq	stderr(%rip), %rcx
	movl	$51, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	popq	%rbx
	xorl	%eax, %eax
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	create_method, .-create_method
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"Error creating class member: content is NULL\n"
	.align 8
.LC6:
	.string	"Error creating class member: unknown type %u\n"
	.text
	.p2align 4
	.globl	create_class_member
	.type	create_class_member, @function
create_class_member:
	pushq	%r12
	movq	%rdx, %r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movl	%edi, %ebx
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%ebx, 8(%rax)
	testl	%ebx, %ebx
	jne	.L50
	testq	%rbp, %rbp
	je	.L50
	movq	%rbp, (%rax)
.L49:
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L50:
	cmpl	$1, %ebx
	jne	.L52
	testq	%r12, %r12
	je	.L52
	movq	%r12, (%rax)
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L52:
	orq	%r12, %rbp
	movq	stderr(%rip), %rdi
	jne	.L54
	movq	%rdi, %rcx
	movl	$45, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L49
	.p2align 4,,10
	.p2align 3
.L54:
	movl	%ebx, %ecx
	leaq	.LC6(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L49
	.size	create_class_member, .-create_class_member
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"Error creating class: name is NULL\n"
	.text
	.p2align 4
	.globl	create_class
	.type	create_class, @function
create_class:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	testq	%rdi, %rdi
	je	.L73
	movq	%rdi, %rbx
	movq	%rsi, %r12
	movq	%rdx, %rbp
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%r12, 8(%rax)
	movq	%rbp, 16(%rax)
.L69:
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L73:
	movq	stderr(%rip), %rcx
	movl	$35, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L69
	.size	create_class, .-create_class
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"Error creating variable: type or name is NULL\n"
	.text
	.p2align 4
	.globl	create_variable
	.type	create_variable, @function
create_variable:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	testq	%rdi, %rdi
	je	.L78
	movq	%rsi, %rbp
	testq	%rsi, %rsi
	je	.L78
	movq	%rdi, %rbx
	movq	%rdx, %r12
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
	movq	%r12, 16(%rax)
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L78:
	movq	stderr(%rip), %rcx
	movl	$46, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	popq	%rbx
	xorl	%eax, %eax
	popq	%rbp
	popq	%r12
	ret
	.size	create_variable, .-create_variable
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"Error creating statement: content is NULL\n"
	.align 8
.LC10:
	.string	"Error creating statement: unknown type %u\n"
	.text
	.p2align 4
	.globl	create_statement
	.type	create_statement, @function
create_statement:
	pushq	%r15
	movq	%r8, %r15
	pushq	%r14
	movl	%edi, %r14d
	movl	$16, %edi
	pushq	%r13
	movq	%rcx, %r13
	pushq	%r12
	movq	%rdx, %r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movq	%r9, %rbx
	subq	$8, %rsp
	call	*alloc_memory@GOTPCREL(%rip)
	testq	%r15, %r15
	movl	%r14d, 8(%rax)
	setne	%dl
	testl	%r14d, %r14d
	jne	.L81
	testb	%dl, %dl
	je	.L81
.L129:
	movq	%r15, (%rax)
.L80:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L81:
	cmpl	$1, %r14d
	jne	.L83
	testq	%rbx, %rbx
	je	.L83
	movq	%rbx, (%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L83:
	cmpl	$2, %r14d
	jne	.L85
	testq	%rbp, %rbp
	je	.L85
	movq	%rbp, (%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L85:
	cmpl	$3, %r14d
	jne	.L86
	testq	%r12, %r12
	je	.L86
	movq	%r12, (%rax)
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L86:
	cmpl	$4, %r14d
	jne	.L87
	testq	%r13, %r13
	je	.L87
	movq	%r13, (%rax)
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L87:
	cmpl	$5, %r14d
	jne	.L88
	testb	%dl, %dl
	jne	.L129
.L88:
	leal	-6(%r14), %edx
	cmpl	$1, %edx
	ja	.L89
	movq	$0, (%rax)
	jmp	.L80
.L89:
	orq	%r12, %r13
	movq	stderr(%rip), %rdi
	orq	%r13, %rbp
	orq	%rbp, %rbx
	orq	%r15, %rbx
	je	.L130
	movl	%r14d, %ecx
	leaq	.LC10(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L80
.L130:
	movq	%rdi, %rcx
	movl	$42, %edx
	movl	$1, %esi
	leaq	.LC9(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L80
	.size	create_statement, .-create_statement
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"Error creating if statement: condition is NULL\n"
	.text
	.p2align 4
	.globl	create_if
	.type	create_if, @function
create_if:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	testq	%rdi, %rdi
	je	.L135
	movq	%rdi, %rbx
	movq	%rsi, %r13
	movq	%rdx, %r12
	movq	%rcx, %rbp
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%r13, 8(%rax)
	movq	%r12, 16(%rax)
	movq	%rbp, 24(%rax)
.L131:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L135:
	movq	stderr(%rip), %rcx
	movl	$47, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L131
	.size	create_if, .-create_if
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"Error creating else-if statement: condition is NULL\n"
	.text
	.p2align 4
	.globl	create_else_if
	.type	create_else_if, @function
create_else_if:
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	testq	%rdi, %rdi
	je	.L140
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
.L136:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L140:
	movq	stderr(%rip), %rcx
	movl	$52, %edx
	movl	$1, %esi
	leaq	.LC12(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L136
	.size	create_else_if, .-create_else_if
	.p2align 4
	.globl	create_for
	.type	create_for, @function
create_for:
	pushq	%r13
	movq	%rdi, %r13
	movl	$32, %edi
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$8, %rsp
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, (%rax)
	movq	%r12, 8(%rax)
	movq	%rbp, 16(%rax)
	movq	%rbx, 24(%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	create_for, .-create_for
	.p2align 4
	.globl	create_while
	.type	create_while, @function
create_while:
	pushq	%rbp
	movq	%rdi, %rbp
	movl	$16, %edi
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$8, %rsp
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, (%rax)
	movq	%rbx, 8(%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.size	create_while, .-create_while
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC13:
	.string	"true"
.LC14:
	.string	"false"
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	"Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n"
	.align 8
.LC16:
	.string	"Error creating expression: both expr_left and prim_left are NULL\n"
	.text
	.p2align 4
	.globl	create_expression
	.type	create_expression, @function
create_expression:
	pushq	%r13
	movq	%rdx, %r13
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rbx
	movl	%edi, %ebx
	subq	$8, %rsp
	cmpl	$19, %edi
	sete	%dl
	testq	%rcx, %rcx
	sete	%al
	cmpb	%al, %dl
	jne	.L146
	movq	%r13, %rax
	orq	%rsi, %rax
	je	.L163
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%ebx, 24(%rax)
	testq	%r12, %r12
	je	.L153
	movq	%r12, (%rax)
.L154:
	movq	%rbp, 16(%rax)
.L145:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L163:
	leaq	.LC13(%rip), %r9
	leaq	.LC14(%rip), %rdx
	movq	%r9, %r8
	testq	%rcx, %rcx
	je	.L164
.L148:
	cmpl	$19, %ebx
	leaq	.LC13(%rip), %rax
	leaq	.LC14(%rip), %rcx
	movq	stderr(%rip), %rdi
	cmove	%rax, %rcx
	subq	$8, %rsp
	movl	$2, %esi
	xorl	%eax, %eax
	pushq	%rdx
	leaq	.LC15(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	popq	%rax
	xorl	%eax, %eax
	popq	%rdx
	jmp	.L145
	.p2align 4,,10
	.p2align 3
.L146:
	leaq	.LC13(%rip), %rax
	leaq	.LC14(%rip), %r8
	testq	%rcx, %rcx
	movq	%rax, %rdx
	movq	%rax, %r9
	cmovne	%r8, %rdx
	testq	%r13, %r13
	cmovne	%r8, %r9
	testq	%rsi, %rsi
	cmove	%rax, %r8
	jmp	.L148
	.p2align 4,,10
	.p2align 3
.L164:
	movq	%r9, %rdx
	jmp	.L148
	.p2align 4,,10
	.p2align 3
.L153:
	testq	%r13, %r13
	je	.L155
	movq	%r13, 8(%rax)
	jmp	.L154
.L155:
	movq	stderr(%rip), %rcx
	movl	$65, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L145
	.size	create_expression, .-create_expression
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"Error creating primary: value is NULL\n"
	.align 8
.LC18:
	.string	"Error creating primary: unknown type %u\n"
	.text
	.p2align 4
	.globl	create_primary
	.type	create_primary, @function
create_primary:
	pushq	%r14
	movq	%rsi, %r14
	pushq	%r13
	movq	%rcx, %r13
	pushq	%r12
	movq	%r8, %r12
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rbx
	movl	%edi, %ebx
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%ebx, 8(%rax)
	cmpl	$4, %ebx
	ja	.L166
	testq	%r14, %r14
	je	.L166
	movq	%r14, (%rax)
.L165:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L166:
	cmpl	$5, %ebx
	jne	.L168
	testq	%rbp, %rbp
	je	.L168
	movq	%rbp, (%rax)
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L168:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	jbe	.L196
	cmpl	$8, %ebx
	jne	.L171
	testq	%r12, %r12
	je	.L171
	movq	%r12, (%rax)
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L196:
	testq	%r13, %r13
	je	.L171
	movq	%r13, (%rax)
	jmp	.L165
	.p2align 4,,10
	.p2align 3
.L171:
	orq	%r13, %r12
	movq	stderr(%rip), %rdi
	orq	%r12, %rbp
	orq	%r14, %rbp
	jne	.L172
	movq	%rdi, %rcx
	movl	$38, %edx
	movl	$1, %esi
	leaq	.LC17(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L165
	.p2align 4,,10
	.p2align 3
.L172:
	movl	%ebx, %ecx
	leaq	.LC18(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L165
	.size	create_primary, .-create_primary
	.section	.rodata.str1.8
	.align 8
.LC19:
	.string	"Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n"
	.align 8
.LC20:
	.string	"Error creating variable access: content is NULL\n"
	.align 8
.LC21:
	.string	"Error creating variable access: unknown type %u\n"
	.text
	.p2align 4
	.globl	create_variable_access
	.type	create_variable_access, @function
create_variable_access:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movl	%edi, %ebx
	subq	$8, %rsp
	testl	%edi, %edi
	sete	%al
	testq	%rsi, %rsi
	sete	%r15b
	cmpb	%al, %r15b
	jne	.L237
	movq	%rdx, %r12
	movq	%rcx, %r14
	movq	%r8, %r13
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	testq	%r12, %r12
	movl	%ebx, 16(%rax)
	setne	%dl
	movq	%rbp, (%rax)
	testb	%r15b, %r15b
	je	.L202
	testb	%dl, %dl
	je	.L202
.L236:
	movq	%r12, 8(%rax)
.L197:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L202:
	cmpl	$1, %ebx
	jne	.L204
	testq	%r13, %r13
	je	.L204
	movq	%r13, 8(%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L237:
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
	call	*__fprintf_chk@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L197
	.p2align 4,,10
	.p2align 3
.L204:
	cmpl	$3, %ebx
	jne	.L206
	testq	%r14, %r14
	je	.L206
	movq	%r14, 8(%rax)
	jmp	.L197
	.p2align 4,,10
	.p2align 3
.L206:
	cmpl	$2, %ebx
	jne	.L207
	testb	%dl, %dl
	jne	.L236
.L207:
	movq	%r14, %rcx
	movq	stderr(%rip), %rdi
	orq	%r13, %rcx
	orq	%r12, %rcx
	je	.L238
	movl	%ebx, %ecx
	leaq	.LC21(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L197
.L238:
	movq	%rdi, %rcx
	movl	$48, %edx
	movl	$1, %esi
	leaq	.LC20(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L197
	.size	create_variable_access, .-create_variable_access
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
