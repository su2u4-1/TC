	.file	"create.c"
	.text
	.section	.rodata
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
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	-20(%rbp), %edx
	movl	%edx, 8(%rax)
	cmpl	$0, -20(%rbp)
	jne	.L2
	cmpq	$0, -32(%rbp)
	je	.L2
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L3
.L2:
	cmpl	$1, -20(%rbp)
	jne	.L4
	cmpq	$0, -40(%rbp)
	je	.L4
	movq	-8(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L3
.L4:
	cmpl	$2, -20(%rbp)
	jne	.L5
	cmpq	$0, -48(%rbp)
	je	.L5
	movq	-8(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L3
.L5:
	cmpq	$0, -32(%rbp)
	jne	.L6
	cmpq	$0, -40(%rbp)
	jne	.L6
	cmpq	$0, -48(%rbp)
	jne	.L6
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$44, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L7
.L6:
	movq	stderr(%rip), %rax
	movl	-20(%rbp), %edx
	leaq	.LC1(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
.L7:
	movl	$0, %eax
	jmp	.L8
.L3:
	movq	-8(%rbp), %rax
.L8:
	leave
	ret
	.size	create_code_member, .-create_code_member
	.globl	create_code
	.type	create_code, @function
create_code:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.size	create_code, .-create_code
	.section	.rodata
	.align 8
.LC2:
	.string	"Error creating import: name is NULL\n"
	.text
	.globl	create_import
	.type	create_import, @function
create_import:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L12
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$36, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L13
.L12:
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
.L13:
	leave
	ret
	.size	create_import, .-create_import
	.section	.rodata
	.align 8
.LC3:
	.string	"Error creating function: name or return_type is NULL\n"
	.text
	.globl	create_function
	.type	create_function, @function
create_function:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	%r8, -56(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L15
	cmpq	$0, -32(%rbp)
	jne	.L16
.L15:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$53, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L17
.L16:
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-16(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-16(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-16(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rbp), %rax
.L17:
	leave
	ret
	.size	create_function, .-create_function
	.section	.rodata
	.align 8
.LC4:
	.string	"Error creating method: name or return_type is NULL\n"
	.text
	.globl	create_method
	.type	create_method, @function
create_method:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	%r8, -56(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L19
	cmpq	$0, -32(%rbp)
	jne	.L20
.L19:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$51, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L21
.L20:
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-16(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-16(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-16(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rbp), %rax
.L21:
	leave
	ret
	.size	create_method, .-create_method
	.section	.rodata
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
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	-20(%rbp), %edx
	movl	%edx, 8(%rax)
	cmpl	$0, -20(%rbp)
	jne	.L23
	cmpq	$0, -32(%rbp)
	je	.L23
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L24
.L23:
	cmpl	$1, -20(%rbp)
	jne	.L25
	cmpq	$0, -40(%rbp)
	je	.L25
	movq	-16(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L24
.L25:
	cmpq	$0, -32(%rbp)
	jne	.L26
	cmpq	$0, -40(%rbp)
	jne	.L26
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$45, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L27
.L26:
	movq	stderr(%rip), %rax
	movl	-20(%rbp), %edx
	leaq	.LC6(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
.L27:
	movl	$0, %eax
	jmp	.L28
.L24:
	movq	-8(%rbp), %rax
.L28:
	leave
	ret
	.size	create_class_member, .-create_class_member
	.section	.rodata
	.align 8
.LC7:
	.string	"Error creating class: name is NULL\n"
	.text
	.globl	create_class
	.type	create_class, @function
create_class:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L30
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$35, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L31
.L30:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-16(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
.L31:
	leave
	ret
	.size	create_class, .-create_class
	.section	.rodata
	.align 8
.LC8:
	.string	"Error creating variable: type or name is NULL\n"
	.text
	.globl	create_variable
	.type	create_variable, @function
create_variable:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L33
	cmpq	$0, -32(%rbp)
	jne	.L34
.L33:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$46, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L35
.L34:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-16(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
.L35:
	leave
	ret
	.size	create_variable, .-create_variable
	.section	.rodata
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
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	%r8, -56(%rbp)
	movq	%r9, -64(%rbp)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	-20(%rbp), %edx
	movl	%edx, 8(%rax)
	cmpl	$0, -20(%rbp)
	jne	.L37
	cmpq	$0, -56(%rbp)
	je	.L37
	movq	-16(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L38
.L37:
	cmpl	$1, -20(%rbp)
	jne	.L39
	cmpq	$0, -64(%rbp)
	je	.L39
	movq	-16(%rbp), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L38
.L39:
	cmpl	$2, -20(%rbp)
	jne	.L40
	cmpq	$0, -32(%rbp)
	je	.L40
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L38
.L40:
	cmpl	$3, -20(%rbp)
	jne	.L41
	cmpq	$0, -40(%rbp)
	je	.L41
	movq	-16(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L38
.L41:
	cmpl	$4, -20(%rbp)
	jne	.L42
	cmpq	$0, -48(%rbp)
	je	.L42
	movq	-16(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L38
.L42:
	cmpl	$5, -20(%rbp)
	jne	.L43
	cmpq	$0, -56(%rbp)
	je	.L43
	movq	-16(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L38
.L43:
	cmpl	$6, -20(%rbp)
	je	.L44
	cmpl	$7, -20(%rbp)
	jne	.L45
.L44:
	movq	-16(%rbp), %rax
	movq	$0, (%rax)
	jmp	.L38
.L45:
	cmpq	$0, -32(%rbp)
	jne	.L46
	cmpq	$0, -40(%rbp)
	jne	.L46
	cmpq	$0, -48(%rbp)
	jne	.L46
	cmpq	$0, -56(%rbp)
	jne	.L46
	cmpq	$0, -64(%rbp)
	jne	.L46
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$42, %edx
	movl	$1, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L47
.L46:
	movq	stderr(%rip), %rax
	movl	-20(%rbp), %edx
	leaq	.LC10(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
.L47:
	movl	$0, %eax
	jmp	.L48
.L38:
	movq	-8(%rbp), %rax
.L48:
	leave
	ret
	.size	create_statement, .-create_statement
	.section	.rodata
	.align 8
.LC11:
	.string	"Error creating if statement: condition is NULL\n"
	.text
	.globl	create_if
	.type	create_if, @function
create_if:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L50
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$47, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L51
.L50:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-16(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-16(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-8(%rbp), %rax
.L51:
	leave
	ret
	.size	create_if, .-create_if
	.section	.rodata
	.align 8
.LC12:
	.string	"Error creating else-if statement: condition is NULL\n"
	.text
	.globl	create_else_if
	.type	create_else_if, @function
create_else_if:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L53
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$52, %edx
	movl	$1, %esi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L54
.L53:
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
.L54:
	leave
	ret
	.size	create_else_if, .-create_else_if
	.globl	create_for
	.type	create_for, @function
create_for:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-16(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-16(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.size	create_for, .-create_for
	.globl	create_while
	.type	create_while, @function
create_while:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.size	create_while, .-create_while
	.section	.rodata
.LC13:
	.string	"true"
.LC14:
	.string	"false"
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
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	cmpl	$19, -20(%rbp)
	sete	%dl
	cmpq	$0, -48(%rbp)
	sete	%al
	xorl	%edx, %eax
	testb	%al, %al
	jne	.L60
	cmpq	$0, -32(%rbp)
	jne	.L61
	cmpq	$0, -40(%rbp)
	jne	.L61
.L60:
	cmpq	$0, -48(%rbp)
	jne	.L62
	leaq	.LC13(%rip), %rsi
	jmp	.L63
.L62:
	leaq	.LC14(%rip), %rsi
.L63:
	cmpq	$0, -40(%rbp)
	jne	.L64
	leaq	.LC13(%rip), %rcx
	jmp	.L65
.L64:
	leaq	.LC14(%rip), %rcx
.L65:
	cmpq	$0, -32(%rbp)
	jne	.L66
	leaq	.LC13(%rip), %rdx
	jmp	.L67
.L66:
	leaq	.LC14(%rip), %rdx
.L67:
	cmpl	$19, -20(%rbp)
	jne	.L68
	leaq	.LC13(%rip), %rax
	jmp	.L69
.L68:
	leaq	.LC14(%rip), %rax
.L69:
	movq	stderr(%rip), %rdi
	movq	%rsi, %r9
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movq	%rax, %rdx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L70
.L61:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	-20(%rbp), %edx
	movl	%edx, 24(%rax)
	cmpq	$0, -32(%rbp)
	je	.L71
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L72
.L71:
	cmpq	$0, -40(%rbp)
	je	.L73
	movq	-16(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L72
.L73:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$65, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L70
.L72:
	movq	-16(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
.L70:
	leave
	ret
	.size	create_expression, .-create_expression
	.section	.rodata
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
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	%r8, -56(%rbp)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	-20(%rbp), %edx
	movl	%edx, 8(%rax)
	cmpl	$0, -20(%rbp)
	je	.L75
	cmpl	$1, -20(%rbp)
	je	.L75
	cmpl	$2, -20(%rbp)
	je	.L75
	cmpl	$3, -20(%rbp)
	je	.L75
	cmpl	$4, -20(%rbp)
	jne	.L76
.L75:
	cmpq	$0, -32(%rbp)
	je	.L76
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L77
.L76:
	cmpl	$5, -20(%rbp)
	jne	.L78
	cmpq	$0, -40(%rbp)
	je	.L78
	movq	-16(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L77
.L78:
	cmpl	$6, -20(%rbp)
	je	.L79
	cmpl	$7, -20(%rbp)
	jne	.L80
.L79:
	cmpq	$0, -48(%rbp)
	je	.L80
	movq	-16(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L77
.L80:
	cmpl	$8, -20(%rbp)
	jne	.L81
	cmpq	$0, -56(%rbp)
	je	.L81
	movq	-16(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L77
.L81:
	cmpq	$0, -32(%rbp)
	jne	.L82
	cmpq	$0, -40(%rbp)
	jne	.L82
	cmpq	$0, -48(%rbp)
	jne	.L82
	cmpq	$0, -56(%rbp)
	jne	.L82
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$38, %edx
	movl	$1, %esi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L83
.L82:
	movq	stderr(%rip), %rax
	movl	-20(%rbp), %edx
	leaq	.LC18(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
.L83:
	movl	$0, %eax
	jmp	.L84
.L77:
	movq	-8(%rbp), %rax
.L84:
	leave
	ret
	.size	create_primary, .-create_primary
	.section	.rodata
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
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	%r8, -56(%rbp)
	cmpq	$0, -32(%rbp)
	sete	%dl
	cmpl	$0, -20(%rbp)
	sete	%al
	xorl	%edx, %eax
	testb	%al, %al
	je	.L86
	cmpl	$0, -20(%rbp)
	jne	.L87
	leaq	.LC13(%rip), %rdx
	jmp	.L88
.L87:
	leaq	.LC14(%rip), %rdx
.L88:
	cmpq	$0, -32(%rbp)
	jne	.L89
	leaq	.LC13(%rip), %rax
	jmp	.L90
.L89:
	leaq	.LC14(%rip), %rax
.L90:
	movq	stderr(%rip), %rdi
	movq	%rdx, %rcx
	movq	%rax, %rdx
	leaq	.LC19(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L91
.L86:
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	-20(%rbp), %edx
	movl	%edx, 16(%rax)
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	cmpl	$0, -20(%rbp)
	jne	.L92
	cmpq	$0, -40(%rbp)
	je	.L92
	movq	-16(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L93
.L92:
	cmpl	$1, -20(%rbp)
	jne	.L94
	cmpq	$0, -56(%rbp)
	je	.L94
	movq	-16(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L93
.L94:
	cmpl	$3, -20(%rbp)
	jne	.L95
	cmpq	$0, -48(%rbp)
	je	.L95
	movq	-16(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L93
.L95:
	cmpl	$2, -20(%rbp)
	jne	.L96
	cmpq	$0, -40(%rbp)
	je	.L96
	movq	-16(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L93
.L96:
	cmpq	$0, -40(%rbp)
	jne	.L97
	cmpq	$0, -48(%rbp)
	jne	.L97
	cmpq	$0, -56(%rbp)
	jne	.L97
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$48, %edx
	movl	$1, %esi
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L98
.L97:
	movq	stderr(%rip), %rax
	movl	-20(%rbp), %edx
	leaq	.LC21(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
.L98:
	movl	$0, %eax
	jmp	.L91
.L93:
	movq	-8(%rbp), %rax
.L91:
	leave
	ret
	.size	create_variable_access, .-create_variable_access
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
