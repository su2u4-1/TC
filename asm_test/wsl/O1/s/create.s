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
	.globl	create_code_member
	.type	create_code_member, @function
create_code_member:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movl	%edi, %ebx
	movq	%rsi, %rbp
	movq	%rdx, %r12
	movq	%rcx, %r13
	movl	$16, %edi
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
.L2:
	cmpl	$1, %ebx
	jne	.L4
	testq	%r12, %r12
	je	.L4
	movq	%r12, (%rax)
	jmp	.L1
.L4:
	cmpl	$2, %ebx
	jne	.L5
	testq	%r13, %r13
	je	.L5
	movq	%r13, (%rax)
	jmp	.L1
.L5:
	movq	%r13, %rcx
	orq	%r12, %rcx
	orq	%rbp, %rcx
	je	.L8
	movl	%ebx, %ecx
	leaq	.LC1(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L1
.L8:
	movq	stderr(%rip), %rcx
	movl	$44, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L1
	.size	create_code_member, .-create_code_member
	.globl	create_code
	.type	create_code, @function
create_code:
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	movl	$16, %edi
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
	.globl	create_import
	.type	create_import, @function
create_import:
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbx
	testq	%rdi, %rdi
	je	.L15
	movq	%rsi, %rbp
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
.L11:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.L15:
	movq	stderr(%rip), %rcx
	movl	$36, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%rbx, %rax
	jmp	.L11
	.size	create_import, .-create_import
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"Error creating function: name or return_type is NULL\n"
	.text
	.globl	create_function
	.type	create_function, @function
create_function:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	testq	%rdi, %rdi
	je	.L20
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	movq	%rdx, %r14
	movq	%rcx, %r13
	movq	%r8, %r12
	testq	%rsi, %rsi
	je	.L20
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
	movq	%r14, 16(%rax)
	movq	%r13, 24(%rax)
	movq	%r12, 32(%rax)
.L16:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L20:
	movq	stderr(%rip), %rcx
	movl	$53, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L16
	.size	create_function, .-create_function
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"Error creating method: name or return_type is NULL\n"
	.text
	.globl	create_method
	.type	create_method, @function
create_method:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	testq	%rdi, %rdi
	je	.L26
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	movq	%rdx, %r14
	movq	%rcx, %r13
	movq	%r8, %r12
	testq	%rsi, %rsi
	je	.L26
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
	movq	%r14, 16(%rax)
	movq	%r13, 24(%rax)
	movq	%r12, 32(%rax)
.L22:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L26:
	movq	stderr(%rip), %rcx
	movl	$51, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L22
	.size	create_method, .-create_method
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"Error creating class member: content is NULL\n"
	.align 8
.LC6:
	.string	"Error creating class member: unknown type %u\n"
	.text
	.globl	create_class_member
	.type	create_class_member, @function
create_class_member:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movl	%edi, %ebx
	movq	%rsi, %rbp
	movq	%rdx, %r12
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%ebx, 8(%rax)
	testl	%ebx, %ebx
	jne	.L29
	testq	%rbp, %rbp
	je	.L29
	movq	%rbp, (%rax)
.L28:
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
.L29:
	cmpl	$1, %ebx
	jne	.L31
	testq	%r12, %r12
	je	.L31
	movq	%r12, (%rax)
	jmp	.L28
.L31:
	orq	%rbp, %r12
	jne	.L32
	movq	stderr(%rip), %rcx
	movl	$45, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L28
.L32:
	movl	%ebx, %ecx
	leaq	.LC6(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L28
	.size	create_class_member, .-create_class_member
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"Error creating class: name is NULL\n"
	.text
	.globl	create_class
	.type	create_class, @function
create_class:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	testq	%rdi, %rdi
	je	.L38
	movq	%rsi, %r12
	movq	%rdx, %rbp
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%r12, 8(%rax)
	movq	%rbp, 16(%rax)
.L34:
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
.L38:
	movq	stderr(%rip), %rcx
	movl	$35, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%rbx, %rax
	jmp	.L34
	.size	create_class, .-create_class
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"Error creating variable: type or name is NULL\n"
	.text
	.globl	create_variable
	.type	create_variable, @function
create_variable:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	testq	%rdi, %rdi
	je	.L43
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	movq	%rdx, %r12
	testq	%rsi, %rsi
	je	.L43
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
	movq	%r12, 16(%rax)
.L39:
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
.L43:
	movq	stderr(%rip), %rcx
	movl	$46, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L39
	.size	create_variable, .-create_variable
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"Error creating statement: content is NULL\n"
	.align 8
.LC10:
	.string	"Error creating statement: unknown type %u\n"
	.text
	.globl	create_statement
	.type	create_statement, @function
create_statement:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movl	%edi, %ebx
	movq	%rsi, %r13
	movq	%rdx, %r14
	movq	%rcx, %r15
	movq	%r8, %rbp
	movq	%r9, %r12
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%ebx, 8(%rax)
	testq	%rbp, %rbp
	setne	%dl
	testl	%ebx, %ebx
	jne	.L46
	testb	%dl, %dl
	je	.L46
	movq	%rbp, (%rax)
.L45:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L46:
	cmpl	$1, %ebx
	jne	.L48
	testq	%r12, %r12
	je	.L48
	movq	%r12, (%rax)
	jmp	.L45
.L48:
	cmpl	$2, %ebx
	jne	.L49
	testq	%r13, %r13
	je	.L49
	movq	%r13, (%rax)
	jmp	.L45
.L49:
	cmpl	$3, %ebx
	jne	.L50
	testq	%r14, %r14
	je	.L50
	movq	%r14, (%rax)
	jmp	.L45
.L50:
	cmpl	$4, %ebx
	jne	.L51
	testq	%r15, %r15
	je	.L51
	movq	%r15, (%rax)
	jmp	.L45
.L51:
	cmpl	$5, %ebx
	jne	.L52
	testb	%dl, %dl
	je	.L52
	movq	%rbp, (%rax)
	jmp	.L45
.L52:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L53
	movq	$0, (%rax)
	jmp	.L45
.L53:
	orq	%r14, %r15
	orq	%r15, %r13
	orq	%r13, %r12
	orq	%rbp, %r12
	je	.L56
	movl	%ebx, %ecx
	leaq	.LC10(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L45
.L56:
	movq	stderr(%rip), %rcx
	movl	$42, %edx
	movl	$1, %esi
	leaq	.LC9(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L45
	.size	create_statement, .-create_statement
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"Error creating if statement: condition is NULL\n"
	.text
	.globl	create_if
	.type	create_if, @function
create_if:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbx
	testq	%rdi, %rdi
	je	.L61
	movq	%rsi, %r12
	movq	%rdx, %rbp
	movq	%rcx, %r13
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%r12, 8(%rax)
	movq	%rbp, 16(%rax)
	movq	%r13, 24(%rax)
.L57:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L61:
	movq	stderr(%rip), %rcx
	movl	$47, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%rbx, %rax
	jmp	.L57
	.size	create_if, .-create_if
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"Error creating else-if statement: condition is NULL\n"
	.text
	.globl	create_else_if
	.type	create_else_if, @function
create_else_if:
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbx
	testq	%rdi, %rdi
	je	.L66
	movq	%rsi, %rbp
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
.L62:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.L66:
	movq	stderr(%rip), %rcx
	movl	$52, %edx
	movl	$1, %esi
	leaq	.LC12(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%rbx, %rax
	jmp	.L62
	.size	create_else_if, .-create_else_if
	.globl	create_for
	.type	create_for, @function
create_for:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %r13
	movq	%rsi, %r12
	movq	%rdx, %rbp
	movq	%rcx, %rbx
	movl	$32, %edi
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
	.globl	create_while
	.type	create_while, @function
create_while:
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	movl	$16, %edi
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
	.globl	create_expression
	.type	create_expression, @function
create_expression:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movl	%edi, %ebx
	movq	%rsi, %rbp
	movq	%rdx, %r13
	movq	%rcx, %r12
	cmpl	$19, %edi
	sete	%dl
	testq	%rcx, %rcx
	sete	%al
	cmpb	%al, %dl
	jne	.L72
	movq	%r13, %rax
	orq	%rsi, %rax
	je	.L90
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%ebx, 24(%rax)
	testq	%rbp, %rbp
	je	.L80
	movq	%rbp, (%rax)
.L81:
	movq	%r12, 16(%rax)
	jmp	.L71
.L72:
	testq	%rcx, %rcx
	leaq	.LC13(%rip), %rax
	leaq	.LC14(%rip), %rdx
	cmovne	%rdx, %rax
	testq	%r13, %r13
	movq	%rdx, %r9
	leaq	.LC13(%rip), %rdx
	cmove	%rdx, %r9
.L76:
	testq	%rbp, %rbp
	leaq	.LC14(%rip), %r8
	leaq	.LC13(%rip), %rdx
	cmove	%rdx, %r8
.L77:
	cmpl	$19, %ebx
	leaq	.LC14(%rip), %rcx
	leaq	.LC13(%rip), %rdx
	cmove	%rdx, %rcx
	subq	$8, %rsp
	pushq	%rax
	leaq	.LC15(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	addq	$16, %rsp
	movl	$0, %eax
.L71:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L80:
	testq	%r13, %r13
	je	.L82
	movq	%r13, 8(%rax)
	jmp	.L81
.L82:
	movq	stderr(%rip), %rcx
	movl	$65, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, %rax
	jmp	.L71
.L90:
	leaq	.LC14(%rip), %rax
	leaq	.LC13(%rip), %r9
	testq	%rcx, %rcx
	jne	.L76
	leaq	.LC13(%rip), %rax
	movq	%rax, %r9
	movq	%rax, %r8
	jmp	.L77
	.size	create_expression, .-create_expression
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"Error creating primary: value is NULL\n"
	.align 8
.LC18:
	.string	"Error creating primary: unknown type %u\n"
	.text
	.globl	create_primary
	.type	create_primary, @function
create_primary:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movl	%edi, %ebx
	movq	%rsi, %rbp
	movq	%rdx, %r12
	movq	%rcx, %r14
	movq	%r8, %r13
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%ebx, 8(%rax)
	cmpl	$4, %ebx
	ja	.L92
	testq	%rbp, %rbp
	je	.L92
	movq	%rbp, (%rax)
.L91:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L92:
	cmpl	$5, %ebx
	jne	.L94
	testq	%r12, %r12
	je	.L94
	movq	%r12, (%rax)
	jmp	.L91
.L94:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L95
	testq	%r14, %r14
	jne	.L99
.L95:
	cmpl	$8, %ebx
	jne	.L96
	testq	%r13, %r13
	je	.L96
	movq	%r13, (%rax)
	jmp	.L91
.L99:
	movq	%r14, (%rax)
	jmp	.L91
.L96:
	orq	%r14, %r13
	orq	%r13, %r12
	orq	%rbp, %r12
	jne	.L97
	movq	stderr(%rip), %rcx
	movl	$38, %edx
	movl	$1, %esi
	leaq	.LC17(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L91
.L97:
	movl	%ebx, %ecx
	leaq	.LC18(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L91
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
	.globl	create_variable_access
	.type	create_variable_access, @function
create_variable_access:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movl	%edi, %ebx
	movq	%rsi, %rbp
	testl	%edi, %edi
	sete	%r15b
	testq	%rsi, %rsi
	sete	%al
	cmpb	%r15b, %al
	jne	.L113
	movq	%rdx, %r12
	movq	%rcx, %r14
	movq	%r8, %r13
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%ebx, 16(%rax)
	movq	%rbp, (%rax)
	testq	%r12, %r12
	setne	%dl
	testb	%r15b, %r15b
	je	.L105
	testb	%dl, %dl
	je	.L105
	movq	%r12, 8(%rax)
	jmp	.L100
.L113:
	testl	%edi, %edi
	leaq	.LC14(%rip), %r8
	leaq	.LC13(%rip), %rax
	cmove	%rax, %r8
	testq	%rsi, %rsi
	leaq	.LC14(%rip), %rcx
	cmove	%rax, %rcx
	leaq	.LC19(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %eax
.L100:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L105:
	cmpl	$1, %ebx
	jne	.L106
	testq	%r13, %r13
	je	.L106
	movq	%r13, 8(%rax)
	jmp	.L100
.L106:
	cmpl	$3, %ebx
	jne	.L107
	testq	%r14, %r14
	je	.L107
	movq	%r14, 8(%rax)
	jmp	.L100
.L107:
	cmpl	$2, %ebx
	jne	.L108
	testb	%dl, %dl
	je	.L108
	movq	%r12, 8(%rax)
	jmp	.L100
.L108:
	orq	%r13, %r14
	orq	%r12, %r14
	je	.L114
	movl	%ebx, %ecx
	leaq	.LC21(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L100
.L114:
	movq	stderr(%rip), %rcx
	movl	$48, %edx
	movl	$1, %esi
	leaq	.LC20(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L100
	.size	create_variable_access, .-create_variable_access
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
