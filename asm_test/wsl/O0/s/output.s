	.file	"output.c"
	.text
	.section	.rodata
.LC0:
	.string	"import\n"
.LC1:
	.string	"function\n"
.LC2:
	.string	"class\n"
.LC3:
	.string	"unknown_CodeMemberType: %u\n"
	.text
	.type	output_code_member, @function
output_code_member:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$2, %eax
	je	.L2
	cmpl	$2, %eax
	ja	.L3
	testl	%eax, %eax
	je	.L4
	cmpl	$1, %eax
	je	.L5
	jmp	.L3
.L4:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_import
	jmp	.L6
.L5:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_function
	jmp	.L6
.L2:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_class
	jmp	.L6
.L3:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movl	8(%rax), %edx
	movq	-16(%rbp), %rax
	leaq	.LC3(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	nop
.L6:
	nop
	leave
	ret
	.size	output_code_member, .-output_code_member
	.globl	output_code
	.type	output_code, @function
output_code:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	jmp	.L8
.L9:
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_code_member
.L8:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L9
	nop
	nop
	leave
	ret
	.size	output_code, .-output_code
	.section	.rodata
.LC4:
	.string	"name\n"
.LC5:
	.string	"NULL"
.LC6:
	.string	"source: \"%s\"\n"
	.text
	.type	output_import, @function
output_import:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_name
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L11
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	jmp	.L12
.L11:
	leaq	.LC5(%rip), %rax
.L12:
	movq	-16(%rbp), %rcx
	movq	%rax, %rdx
	leaq	.LC6(%rip), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	nop
	leave
	ret
	.size	output_import, .-output_import
	.section	.rodata
.LC7:
	.string	"return_type\n"
.LC8:
	.string	"parameters\n"
.LC9:
	.string	"parameters[%d]\n"
.LC10:
	.string	"body\n"
	.text
	.type	output_function, @function
output_function:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movq	%rcx, -80(%rbp)
	movq	-80(%rbp), %rdx
	movq	-72(%rbp), %rsi
	movq	-64(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	-80(%rbp), %rdx
	movq	-64(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_name
	movq	-80(%rbp), %rdx
	movq	-72(%rbp), %rsi
	movq	-64(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-56(%rbp), %rax
	movq	8(%rax), %rax
	movq	-80(%rbp), %rdx
	movq	-64(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_name
	movq	-80(%rbp), %rdx
	movq	-72(%rbp), %rsi
	movq	-64(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	movl	$11, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-56(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	movq	-56(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	movl	$-1, -4(%rbp)
	jmp	.L14
.L15:
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rsi
	movq	-80(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %edx
	movq	-64(%rbp), %rax
	leaq	.LC9(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movq	-72(%rbp), %rax
	leaq	2(%rax), %rdi
	movq	-80(%rbp), %rdx
	movq	-64(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_variable
.L14:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L15
	movq	-80(%rbp), %rdx
	movq	-72(%rbp), %rsi
	movq	-64(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L16
.L17:
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-80(%rbp), %rdx
	movq	-64(%rbp), %rsi
	movq	-40(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_statement
.L16:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L17
	nop
	nop
	leave
	ret
	.size	output_function, .-output_function
	.type	output_method, @function
output_method:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movq	%rcx, -80(%rbp)
	movq	-80(%rbp), %rdx
	movq	-72(%rbp), %rsi
	movq	-64(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	-80(%rbp), %rdx
	movq	-64(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_name
	movq	-80(%rbp), %rdx
	movq	-72(%rbp), %rsi
	movq	-64(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-56(%rbp), %rax
	movq	8(%rax), %rax
	movq	-80(%rbp), %rdx
	movq	-64(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_name
	movq	-80(%rbp), %rdx
	movq	-72(%rbp), %rsi
	movq	-64(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	movl	$11, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-56(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	movq	-56(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	movl	$-1, -4(%rbp)
	jmp	.L19
.L20:
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rsi
	movq	-80(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %edx
	movq	-64(%rbp), %rax
	leaq	.LC9(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movq	-72(%rbp), %rax
	leaq	2(%rax), %rdi
	movq	-80(%rbp), %rdx
	movq	-64(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_variable
.L19:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L20
	movq	-80(%rbp), %rdx
	movq	-72(%rbp), %rsi
	movq	-64(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L21
.L22:
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-80(%rbp), %rdx
	movq	-64(%rbp), %rsi
	movq	-40(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_statement
.L21:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L22
	nop
	nop
	leave
	ret
	.size	output_method, .-output_method
	.section	.rodata
.LC11:
	.string	"method\n"
.LC12:
	.string	"variable\n"
.LC13:
	.string	"unknown_ClassMemberType: %u\n"
	.text
	.type	output_class_member, @function
output_class_member:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	je	.L24
	cmpl	$1, %eax
	je	.L25
	jmp	.L28
.L24:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_method
	jmp	.L27
.L25:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_variable
	jmp	.L27
.L28:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movl	8(%rax), %edx
	movq	-16(%rbp), %rax
	leaq	.LC13(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	nop
.L27:
	nop
	leave
	ret
	.size	output_class_member, .-output_class_member
	.section	.rodata
.LC14:
	.string	"members\n"
	.text
	.type	output_class, @function
output_class:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_name
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$8, %edx
	movl	$1, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	jmp	.L30
.L31:
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_class_member
.L30:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L31
	nop
	nop
	leave
	ret
	.size	output_class, .-output_class
	.section	.rodata
.LC15:
	.string	"type\n"
.LC16:
	.string	"value\n"
.LC17:
	.string	"value: \"NULL\"\n"
	.text
	.type	output_variable, @function
output_variable:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_name
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_name
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L33
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_expression
	jmp	.L35
.L33:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
.L35:
	nop
	leave
	ret
	.size	output_variable, .-output_variable
	.section	.rodata
.LC18:
	.string	"if_statement\n"
.LC19:
	.string	"for_statement\n"
.LC20:
	.string	"while_statement\n"
	.align 8
.LC21:
	.string	"variable_declaration_statement\n"
.LC22:
	.string	"return_statement: \"NULL\"\n"
.LC23:
	.string	"return_statement\n"
.LC24:
	.string	"break_statement: \"NULL\"\n"
.LC25:
	.string	"continue_statement: \"NULL\"\n"
.LC26:
	.string	"expression_statement: \"NULL\"\n"
.LC27:
	.string	"expression_statement\n"
.LC28:
	.string	"unknown_StatementType: %u\n"
	.text
	.type	output_statement, @function
output_statement:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$7, %eax
	ja	.L37
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L39(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L39(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L39:
	.long	.L46-.L39
	.long	.L45-.L39
	.long	.L44-.L39
	.long	.L43-.L39
	.long	.L42-.L39
	.long	.L41-.L39
	.long	.L40-.L39
	.long	.L38-.L39
	.text
.L44:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$13, %edx
	movl	$1, %esi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_if
	jmp	.L36
.L42:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_for
	jmp	.L36
.L43:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_while
	jmp	.L36
.L45:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_variable
	jmp	.L36
.L41:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L48
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$25, %edx
	movl	$1, %esi
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L36
.L48:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_expression
	jmp	.L36
.L40:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$24, %edx
	movl	$1, %esi
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L36
.L38:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$27, %edx
	movl	$1, %esi
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L36
.L46:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L49
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$29, %edx
	movl	$1, %esi
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L36
.L49:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_expression
	jmp	.L36
.L37:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movl	8(%rax), %edx
	movq	-16(%rbp), %rax
	leaq	.LC28(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	nop
.L36:
	leave
	ret
	.size	output_statement, .-output_statement
	.section	.rodata
.LC29:
	.string	"condition\n"
.LC30:
	.string	"else_if\n"
.LC31:
	.string	"else_body\n"
	.text
	.type	output_if, @function
output_if:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movq	%rcx, -80(%rbp)
	movq	-56(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-56(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	movq	-56(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	movq	-80(%rbp), %rdx
	movq	-72(%rbp), %rsi
	movq	-64(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	-80(%rbp), %rdx
	movq	-64(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_expression
	movq	-80(%rbp), %rdx
	movq	-72(%rbp), %rsi
	movq	-64(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L51
.L52:
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-80(%rbp), %rdx
	movq	-64(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_statement
.L51:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L52
	movq	-80(%rbp), %rdx
	movq	-72(%rbp), %rsi
	movq	-64(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	movl	$8, %edx
	movl	$1, %esi
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L53
.L54:
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-80(%rbp), %rdx
	movq	-64(%rbp), %rsi
	movq	-40(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_else_if
.L53:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L54
	movq	-80(%rbp), %rdx
	movq	-72(%rbp), %rsi
	movq	-64(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC31(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L55
.L56:
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-80(%rbp), %rdx
	movq	-64(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_statement
.L55:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L56
	nop
	nop
	leave
	ret
	.size	output_if, .-output_if
	.type	output_else_if, @function
output_else_if:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_expression
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L58
.L59:
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_statement
.L58:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L59
	nop
	nop
	leave
	ret
	.size	output_else_if, .-output_else_if
	.section	.rodata
.LC32:
	.string	"initializer\n"
.LC33:
	.string	"initializer: \"NULL\"\n"
.LC34:
	.string	"condition: \"NULL\"\n"
.LC35:
	.string	"increment\n"
.LC36:
	.string	"increment: \"NULL\"\n"
	.text
	.type	output_for, @function
output_for:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L61
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_variable
	jmp	.L62
.L61:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
.L62:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L63
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_expression
	jmp	.L64
.L63:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$18, %edx
	movl	$1, %esi
	leaq	.LC34(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
.L64:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L65
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC35(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_expression
	jmp	.L66
.L65:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$18, %edx
	movl	$1, %esi
	leaq	.LC36(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
.L66:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L67
.L68:
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_statement
.L67:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L68
	nop
	nop
	leave
	ret
	.size	output_for, .-output_for
	.type	output_while, @function
output_while:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_expression
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L70
.L71:
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_statement
.L70:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L71
	nop
	nop
	leave
	ret
	.size	output_while, .-output_while
	.section	.rodata
.LC37:
	.string	"primary\n"
.LC38:
	.string	"UNKNOWN_OPERATOR"
.LC39:
	.string	"operator: \"%s\"\n"
.LC40:
	.string	"left\n"
.LC41:
	.string	"right\n"
	.text
	.type	output_expression, @function
output_expression:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$19, %eax
	jne	.L73
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$8, %edx
	movl	$1, %esi
	leaq	.LC37(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_primary
	jmp	.L77
.L73:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, %edi
	call	*operator_to_string@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	cmpq	$0, -8(%rbp)
	je	.L75
	movq	-8(%rbp), %rax
	jmp	.L76
.L75:
	leaq	.LC38(%rip), %rax
.L76:
	movq	-32(%rbp), %rcx
	movq	%rax, %rdx
	leaq	.LC39(%rip), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC40(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_expression
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC41(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_expression
.L77:
	nop
	leave
	ret
	.size	output_expression, .-output_expression
	.section	.rodata
.LC42:
	.string	"type: \"integer\"\n"
.LC43:
	.string	"value: %s\n"
.LC44:
	.string	"type: \"float\"\n"
.LC45:
	.string	"type: \"string\"\n"
.LC46:
	.string	"value: \"%s\"\n"
.LC47:
	.string	"type: \"boolean\"\n"
.LC48:
	.string	"value: \"true\"\n"
.LC49:
	.string	"value: \"false\"\n"
.LC50:
	.string	"type: \"expression\"\n"
.LC51:
	.string	"type: \"!\"\n"
.LC52:
	.string	"type: \"-\"\n"
.LC53:
	.string	"type: \"variable\"\n"
.LC54:
	.string	"unknown_PrimaryType: %u\n"
	.text
	.type	output_primary, @function
output_primary:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$8, %eax
	ja	.L79
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L81(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L81(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L81:
	.long	.L89-.L81
	.long	.L88-.L81
	.long	.L87-.L81
	.long	.L86-.L81
	.long	.L85-.L81
	.long	.L84-.L81
	.long	.L83-.L81
	.long	.L82-.L81
	.long	.L80-.L81
	.text
.L89:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC42(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	leaq	.LC43(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L90
.L88:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC44(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	leaq	.LC43(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L90
.L87:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC45(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	leaq	.LC46(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L90
.L86:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC47(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC48(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L90
.L85:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC47(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC49(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L90
.L84:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$19, %edx
	movl	$1, %esi
	leaq	.LC50(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_expression
	jmp	.L90
.L83:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC51(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_primary
	jmp	.L90
.L82:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC52(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_primary
	jmp	.L90
.L80:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC53(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_variable_access
	jmp	.L90
.L79:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movl	8(%rax), %edx
	movq	-16(%rbp), %rax
	leaq	.LC54(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	nop
.L90:
	nop
	leave
	ret
	.size	output_primary, .-output_primary
	.section	.rodata
.LC55:
	.string	"type: \"name\"\n"
.LC56:
	.string	"type: \"function_call\"\n"
.LC57:
	.string	"arguments\n"
.LC58:
	.string	"arguments[%d]\n"
.LC59:
	.string	"type: \"get sequence_element\"\n"
.LC60:
	.string	"sequence\n"
.LC61:
	.string	"index\n"
.LC62:
	.string	"type: \"get_attribute\"\n"
.LC63:
	.string	"object\n"
.LC64:
	.string	"attribute_name\n"
	.align 8
.LC65:
	.string	"unknown_VariableAccessType: %u\n"
	.text
	.type	output_variable_access, @function
output_variable_access:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%rcx, -64(%rbp)
	movq	-40(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$3, %eax
	je	.L92
	cmpl	$3, %eax
	ja	.L93
	cmpl	$2, %eax
	je	.L94
	cmpl	$2, %eax
	ja	.L93
	testl	%eax, %eax
	je	.L95
	cmpl	$1, %eax
	je	.L96
	jmp	.L93
.L95:
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$13, %edx
	movl	$1, %esi
	leaq	.LC55(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_name
	jmp	.L97
.L96:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$22, %edx
	movl	$1, %esi
	leaq	.LC56(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_variable_access
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC57(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$-1, -4(%rbp)
	jmp	.L98
.L99:
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rsi
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %edx
	movq	-48(%rbp), %rax
	leaq	.LC58(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movq	-56(%rbp), %rax
	leaq	2(%rax), %rdi
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	-24(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_expression
.L98:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L99
	jmp	.L97
.L92:
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$29, %edx
	movl	$1, %esi
	leaq	.LC59(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC60(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_variable_access
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC61(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_expression
	jmp	.L97
.L94:
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$22, %edx
	movl	$1, %esi
	leaq	.LC62(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC63(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_variable_access
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC64(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_name
	jmp	.L97
.L93:
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	movl	16(%rax), %edx
	movq	-48(%rbp), %rax
	leaq	.LC65(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	nop
.L97:
	nop
	leave
	ret
	.size	output_variable_access, .-output_variable_access
	.section	.rodata
.LC66:
	.string	"Name: \"NULL\"\n"
.LC67:
	.string	"name: \"%s\"\n"
.LC68:
	.string	"id: %zu\n"
.LC69:
	.string	"kind: \"type\"\n"
.LC70:
	.string	"kind: \"variable\"\n"
.LC71:
	.string	"kind: \"function\"\n"
.LC72:
	.string	"kind: \"method\"\n"
.LC73:
	.string	"kind: \"class\"\n"
.LC74:
	.string	"kind: \"attribute\"\n"
.LC75:
	.string	"kind: \"parameter\"\n"
.LC76:
	.string	"kind: \"unknown_NameType\"\n"
	.text
	.type	output_name, @function
output_name:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L101
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$13, %edx
	movl	$1, %esi
	leaq	.LC66(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L100
.L101:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-16(%rbp), %rax
	leaq	.LC67(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-16(%rbp), %rax
	leaq	.LC68(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$6, %eax
	ja	.L103
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L105(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L105(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L105:
	.long	.L111-.L105
	.long	.L110-.L105
	.long	.L109-.L105
	.long	.L108-.L105
	.long	.L107-.L105
	.long	.L106-.L105
	.long	.L104-.L105
	.text
.L104:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$13, %edx
	movl	$1, %esi
	leaq	.LC69(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L100
.L108:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC70(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_name
	jmp	.L100
.L110:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC71(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_name
	jmp	.L100
.L109:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC72(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_name
	jmp	.L100
.L111:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC73(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L100
.L106:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$18, %edx
	movl	$1, %esi
	leaq	.LC74(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_name
	jmp	.L100
.L107:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$18, %edx
	movl	$1, %esi
	leaq	.LC75(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_name
	jmp	.L100
.L103:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$25, %edx
	movl	$1, %esi
	leaq	.LC76(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	nop
.L100:
	leave
	ret
	.size	output_name, .-output_name
	.section	.rodata
.LC77:
	.string	"TAC: \"NULL\"\n"
.LC78:
	.string	"TAC {\n"
.LC79:
	.string	"designs: []\n"
.LC80:
	.string	"designs: [\n"
.LC81:
	.string	"]\n"
.LC82:
	.string	"entry_point: \"NULL\"\n"
.LC83:
	.string	"entry_point: %s\n"
.LC84:
	.string	"global: []\n"
.LC85:
	.string	"global: [\n"
.LC86:
	.string	"subroutines: []\n"
.LC87:
	.string	"subroutines: [\n"
.LC88:
	.string	"}\n"
	.text
	.globl	output_TAC
	.type	output_TAC, @function
output_TAC:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L113
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC77(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L112
.L113:
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC78(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L115
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC79(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L116
.L115:
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$11, %edx
	movl	$1, %esi
	leaq	.LC80(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L117
.L118:
	movq	-56(%rbp), %rax
	leaq	2(%rax), %rdx
	movq	-48(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	output_attribute_table
.L117:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L118
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC81(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
.L116:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L119
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	.LC82(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L120
.L119:
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	movq	-48(%rbp), %rax
	leaq	.LC83(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
.L120:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L121
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$11, %edx
	movl	$1, %esi
	leaq	.LC84(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L122
.L121:
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC85(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L123
.L124:
	movq	-56(%rbp), %rax
	leaq	2(%rax), %rdx
	movq	-48(%rbp), %rcx
	movq	-16(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	output_var
.L123:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L124
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC81(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
.L122:
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L125
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC86(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L126
.L125:
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC87(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L127
.L128:
	movq	-56(%rbp), %rax
	leaq	2(%rax), %rdx
	movq	-48(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	output_subroutine
.L127:
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L128
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC81(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
.L126:
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC88(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
.L112:
	leave
	ret
	.size	output_TAC, .-output_TAC
	.section	.rodata
.LC89:
	.string	"Subroutine: \"NULL\"\n"
.LC90:
	.string	"NULL {\n"
.LC91:
	.string	"%s {\n"
.LC92:
	.string	"return_type: \"NULL\"\n"
.LC93:
	.string	"return_type: %s\n"
.LC94:
	.string	"parameters: []\n"
.LC95:
	.string	"parameters: [\n"
.LC96:
	.string	"local: []\n"
.LC97:
	.string	"local: [\n"
.LC98:
	.string	"instructions: []\n"
.LC99:
	.string	"instructions: [\n"
	.text
	.type	output_subroutine, @function
output_subroutine:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L130
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$19, %edx
	movl	$1, %esi
	leaq	.LC89(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L129
.L130:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L132
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC90(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L133
.L132:
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movq	-48(%rbp), %rax
	leaq	.LC91(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
.L133:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L134
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	.LC92(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L135
.L134:
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	movq	-48(%rbp), %rax
	leaq	.LC93(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
.L135:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L136
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC94(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L137
.L136:
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC95(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L138
.L139:
	movq	-56(%rbp), %rax
	leaq	2(%rax), %rdx
	movq	-48(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	output_var
.L138:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L139
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC81(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
.L137:
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L140
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC96(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L141
.L140:
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC97(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L142
.L143:
	movq	-56(%rbp), %rax
	leaq	2(%rax), %rdx
	movq	-48(%rbp), %rcx
	movq	-16(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	output_var
.L142:
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L143
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC81(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
.L141:
	movq	-40(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L144
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC98(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L145
.L144:
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC99(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L146
.L147:
	movq	-56(%rbp), %rax
	leaq	2(%rax), %rdx
	movq	-48(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	output_block
.L146:
	movq	-40(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L147
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC81(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
.L145:
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC88(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
.L129:
	leave
	ret
	.size	output_subroutine, .-output_subroutine
	.section	.rodata
.LC100:
	.string	"Var: \"NULL\"\n"
.LC101:
	.string	"NULL\t%s\n"
.LC102:
	.string	"%s\t%s\n"
	.text
	.type	output_var, @function
output_var:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L149
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC100(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L148
.L149:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L151
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-16(%rbp), %rax
	leaq	.LC101(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L148
.L151:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rcx
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rdx
	movq	-16(%rbp), %rax
	leaq	.LC102(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
.L148:
	leave
	ret
	.size	output_var, .-output_var
	.section	.rodata
.LC103:
	.string	"Block: \"NULL\"\n"
.LC104:
	.string	"NULL "
.LC105:
	.string	"%s "
.LC106:
	.string	"{}\n"
.LC107:
	.string	"{\n"
	.text
	.type	output_block, @function
output_block:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L153
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC103(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L152
.L153:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L155
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC104(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L156
.L155:
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movq	-32(%rbp), %rax
	leaq	.LC105(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
.L156:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L157
	movq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	.LC106(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L152
.L157:
	movq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC107(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L158
.L159:
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-32(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	output_instruction
.L158:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L159
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC88(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
.L152:
	leave
	ret
	.size	output_block, .-output_block
	.section	.rodata
.LC108:
	.string	"\"NULL\""
.LC109:
	.string	"%lld"
.LC110:
	.string	"%f"
.LC111:
	.string	"true"
.LC112:
	.string	"false"
.LC113:
	.string	"void"
.LC114:
	.string	"NONE"
.LC115:
	.string	"unknown_ArgType: %u"
	.text
	.type	output_arg, @function
output_arg:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L161
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC108(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L160
.L161:
	movq	-8(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$8, %eax
	ja	.L163
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L165(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L165(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L165:
	.long	.L173-.L165
	.long	.L172-.L165
	.long	.L171-.L165
	.long	.L170-.L165
	.long	.L169-.L165
	.long	.L168-.L165
	.long	.L167-.L165
	.long	.L166-.L165
	.long	.L164-.L165
	.text
.L173:
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*fputs@GOTPCREL(%rip)
	jmp	.L160
.L172:
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	leaq	.LC109(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L160
.L171:
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %xmm0
	leaq	.LC110(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L160
.L170:
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*fputs@GOTPCREL(%rip)
	jmp	.L160
.L169:
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L174
	leaq	.LC111(%rip), %rax
	jmp	.L175
.L174:
	leaq	.LC112(%rip), %rax
.L175:
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*fputs@GOTPCREL(%rip)
	jmp	.L160
.L168:
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC113(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L160
.L167:
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*fputs@GOTPCREL(%rip)
	jmp	.L160
.L166:
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*fputs@GOTPCREL(%rip)
	jmp	.L160
.L164:
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC114(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L160
.L163:
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movl	16(%rax), %edx
	movq	-16(%rbp), %rax
	leaq	.LC115(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	nop
.L160:
	leave
	ret
	.size	output_arg, .-output_arg
	.section	.rodata
.LC116:
	.string	"Instruction: \"NULL\"\n"
.LC117:
	.string	"add\t"
.LC118:
	.string	"sub\t"
.LC119:
	.string	"mul\t"
.LC120:
	.string	"div\t"
.LC121:
	.string	"mod\t"
.LC122:
	.string	"eq \t"
.LC123:
	.string	"ne \t"
.LC124:
	.string	"lt \t"
.LC125:
	.string	"gt \t"
.LC126:
	.string	"le \t"
.LC127:
	.string	"ge \t"
.LC128:
	.string	"and\t"
.LC129:
	.string	"or \t"
.LC130:
	.string	"not\t"
.LC131:
	.string	"assign\t"
.LC132:
	.string	"get_attr\t"
.LC133:
	.string	"get_elem\t"
.LC134:
	.string	"param\t"
.LC135:
	.string	"alloc\t"
.LC136:
	.string	"jmp_c\t"
.LC137:
	.string	"jmp\t"
.LC138:
	.string	"ret\t"
.LC139:
	.string	"call\t"
.LC140:
	.string	"load\t"
.LC141:
	.string	"store\t"
.LC142:
	.string	"INST_NONE\n"
.LC143:
	.string	"unknown_InstructionType: %u\n"
	.text
	.type	output_instruction, @function
output_instruction:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L177
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	.LC116(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L176
.L177:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$25, %eax
	ja	.L179
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L181(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L181(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L181:
	.long	.L206-.L181
	.long	.L205-.L181
	.long	.L204-.L181
	.long	.L203-.L181
	.long	.L202-.L181
	.long	.L201-.L181
	.long	.L200-.L181
	.long	.L199-.L181
	.long	.L198-.L181
	.long	.L197-.L181
	.long	.L196-.L181
	.long	.L195-.L181
	.long	.L194-.L181
	.long	.L193-.L181
	.long	.L192-.L181
	.long	.L191-.L181
	.long	.L190-.L181
	.long	.L189-.L181
	.long	.L188-.L181
	.long	.L187-.L181
	.long	.L186-.L181
	.long	.L185-.L181
	.long	.L184-.L181
	.long	.L183-.L181
	.long	.L182-.L181
	.long	.L180-.L181
	.text
.L206:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC117(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
.L205:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC118(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
.L204:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC119(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
.L203:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC120(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
.L202:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC121(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
.L201:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC122(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
.L200:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC123(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
.L199:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC124(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
.L198:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC125(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
.L197:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC126(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
.L196:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC127(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
.L195:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC128(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
.L194:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC129(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
.L193:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC130(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
.L192:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC131(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
.L191:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC132(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
.L190:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC133(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
.L189:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC134(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
.L188:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC135(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
.L187:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC136(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
.L186:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC137(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
.L185:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC138(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
.L184:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC139(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
.L183:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC140(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
.L182:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC141(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L207
.L180:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC142(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L176
.L179:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movl	24(%rax), %edx
	movq	-16(%rbp), %rax
	leaq	.LC143(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L176
.L207:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	output_arg
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$24, %eax
	seta	%dl
	testb	%dl, %dl
	jne	.L213
	movl	$1, %edx
	movl	%eax, %ecx
	salq	%cl, %rdx
	movq	%rdx, %rax
	movq	%rax, %rdx
	andl	$4825087, %edx
	testq	%rdx, %rdx
	setne	%dl
	testb	%dl, %dl
	jne	.L209
	movq	%rax, %rdx
	andl	$25583616, %edx
	testq	%rdx, %rdx
	setne	%dl
	testb	%dl, %dl
	jne	.L210
	andl	$3145728, %eax
	testq	%rax, %rax
	setne	%al
	testb	%al, %al
	jne	.L214
	jmp	.L213
.L209:
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$32, %edi
	call	*fputc@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	output_arg
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$32, %edi
	call	*fputc@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	output_arg
	jmp	.L212
.L210:
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$32, %edi
	call	*fputc@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	output_arg
	jmp	.L212
.L214:
	nop
.L212:
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	*fputc@GOTPCREL(%rip)
	jmp	.L176
.L213:
	nop
.L176:
	leave
	ret
	.size	output_instruction, .-output_instruction
	.section	.rodata
.LC144:
	.string	"AttributeTable: \"NULL\"\n"
.LC145:
	.string	"%zu "
	.text
	.type	output_attribute_table, @function
output_attribute_table:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L216
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$23, %edx
	movl	$1, %esi
	leaq	.LC144(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L215
.L216:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L218
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC104(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L219
.L218:
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	movq	-32(%rbp), %rax
	leaq	.LC105(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
.L219:
	movq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-32(%rbp), %rax
	leaq	.LC145(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*list_is_empty@GOTPCREL(%rip)
	testb	%al, %al
	je	.L220
	movq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	.LC106(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L215
.L220:
	movq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC107(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L221
.L222:
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-32(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	output_attribute
.L221:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L222
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC88(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
.L215:
	leave
	ret
	.size	output_attribute_table, .-output_attribute_table
	.section	.rodata
.LC146:
	.string	"Attribute: \"NULL\"\n"
.LC147:
	.string	"NULL\t"
.LC148:
	.string	"%s\t"
.LC149:
	.string	"%zu\n"
	.text
	.type	output_attribute, @function
output_attribute:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L224
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$18, %edx
	movl	$1, %esi
	leaq	.LC146(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L223
.L224:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L226
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC147(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L227
.L226:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	movq	-16(%rbp), %rax
	leaq	.LC148(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
.L227:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L228
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC104(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L229
.L228:
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movq	-16(%rbp), %rax
	leaq	.LC105(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
.L229:
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	*indention_tac@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-16(%rbp), %rax
	leaq	.LC149(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
.L223:
	leave
	ret
	.size	output_attribute, .-output_attribute
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
