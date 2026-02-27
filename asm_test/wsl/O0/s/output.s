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
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
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
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_import
	jmp	.L6
.L5:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_function
	jmp	.L6
.L2:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_class
	jmp	.L6
.L3:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movl	8(%rax), %edx
	movq	-32(%rbp), %rax
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
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	-24(%rbp), %rax
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
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
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
	movq	-32(%rbp), %rcx
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
	movq	-56(%rbp), %rax
	movq	%rax, -16(%rbp)
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
	movq	-16(%rbp), %rax
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
	movq	-16(%rbp), %rax
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
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -32(%rbp)
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
	movq	-40(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_variable
.L14:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
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
	movq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_statement
.L16:
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
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
	movq	-56(%rbp), %rax
	movq	%rax, -16(%rbp)
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
	movq	-16(%rbp), %rax
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
	movq	-16(%rbp), %rax
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
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -32(%rbp)
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
	movq	-40(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_variable
.L19:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
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
	movq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_statement
.L21:
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
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
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	je	.L24
	cmpl	$1, %eax
	je	.L25
	jmp	.L28
.L24:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_method
	jmp	.L27
.L25:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_variable
	jmp	.L27
.L28:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movl	8(%rax), %edx
	movq	-32(%rbp), %rax
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
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%rcx, -64(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
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
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_name
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$8, %edx
	movl	$1, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	jmp	.L30
.L31:
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	-24(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_class_member
.L30:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
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
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	-24(%rbp), %rax
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
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
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
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_name
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L33
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
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_expression
	jmp	.L35
.L33:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
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
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
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
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$13, %edx
	movl	$1, %esi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_if
	jmp	.L36
.L42:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_for
	jmp	.L36
.L43:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_while
	jmp	.L36
.L45:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
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
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$25, %edx
	movl	$1, %esi
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L36
.L48:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_expression
	jmp	.L36
.L40:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$24, %edx
	movl	$1, %esi
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L36
.L38:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
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
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$29, %edx
	movl	$1, %esi
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L36
.L49:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_expression
	jmp	.L36
.L37:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movl	8(%rax), %edx
	movq	-32(%rbp), %rax
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
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -32(%rbp)
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
	movq	-8(%rbp), %rax
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
	movq	-40(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_statement
.L51:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
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
	movq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_else_if
.L53:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
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
	movq	-40(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_statement
.L55:
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
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
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%rcx, -64(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
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
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_expression
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
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L58
.L59:
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	-24(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_statement
.L58:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
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
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%rcx, -64(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L61
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_variable
	jmp	.L62
.L61:
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
.L62:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L63
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_expression
	jmp	.L64
.L63:
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$18, %edx
	movl	$1, %esi
	leaq	.LC34(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
.L64:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L65
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC35(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_expression
	jmp	.L66
.L65:
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$18, %edx
	movl	$1, %esi
	leaq	.LC36(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
.L66:
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
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L67
.L68:
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	-24(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_statement
.L67:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
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
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%rcx, -64(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
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
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_expression
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
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L70
.L71:
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	-24(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_statement
.L70:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
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
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
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
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_primary
	jmp	.L77
.L73:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, %edi
	call	*operator_to_string@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	cmpq	$0, -16(%rbp)
	je	.L75
	movq	-16(%rbp), %rax
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
	movq	-8(%rbp), %rax
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
	movq	-8(%rbp), %rax
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
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
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
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC42(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-32(%rbp), %rax
	leaq	.LC43(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L90
.L88:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC44(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-32(%rbp), %rax
	leaq	.LC43(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L90
.L87:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC45(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-32(%rbp), %rax
	leaq	.LC46(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L90
.L86:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC47(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC48(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L90
.L85:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC47(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC49(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L90
.L84:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$19, %edx
	movl	$1, %esi
	leaq	.LC50(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
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
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_expression
	jmp	.L90
.L83:
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
	leaq	.LC51(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
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
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_primary
	jmp	.L90
.L82:
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
	leaq	.LC52(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
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
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_primary
	jmp	.L90
.L80:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC53(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
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
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_variable_access
	jmp	.L90
.L79:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movl	8(%rax), %edx
	movq	-32(%rbp), %rax
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
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
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
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_name
	jmp	.L97
.L96:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
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
	movq	-16(%rbp), %rax
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
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_expression
.L98:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
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
	movq	-16(%rbp), %rax
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
	movq	-16(%rbp), %rax
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
	movq	-16(%rbp), %rax
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
	movq	-16(%rbp), %rax
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
	movq	-16(%rbp), %rax
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
	.string	"Name pointer: \"NULL\"\n"
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
	.string	"kind: \"unknown_NameType\"\n"
	.text
	.type	output_name, @function
output_name:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L101
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	.LC66(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L100
.L101:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-32(%rbp), %rax
	leaq	.LC67(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-32(%rbp), %rax
	leaq	.LC68(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
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
	.long	.L110-.L105
	.long	.L109-.L105
	.long	.L108-.L105
	.long	.L107-.L105
	.long	.L106-.L105
	.long	.L104-.L105
	.text
.L110:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$13, %edx
	movl	$1, %esi
	leaq	.LC69(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L100
.L109:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC70(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
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
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_name
	jmp	.L100
.L108:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC71(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_name
	jmp	.L100
.L107:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC72(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_name
	jmp	.L100
.L106:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC73(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L100
.L104:
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
	leaq	.LC74(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
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
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	output_name
	jmp	.L100
.L103:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	*indention@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$25, %edx
	movl	$1, %esi
	leaq	.LC75(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	nop
.L100:
	leave
	ret
	.size	output_name, .-output_name
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
