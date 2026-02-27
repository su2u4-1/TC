	.file	"D:\\TC\\src\\output.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "import\12\0"
.LC1:
	.ascii "function\12\0"
.LC2:
	.ascii "class\12\0"
.LC3:
	.ascii "unknown_CodeMemberType: %u\12\0"
	.text
	.def	output_code_member;	.scl	3;	.type	32;	.endef
output_code_member:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
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
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_import
	jmp	.L6
.L5:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_function
	jmp	.L6
.L2:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_class
	jmp	.L6
.L3:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	-8(%rbp), %rax
	movl	8(%rax), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC3(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
.L6:
	nop
	leave
	ret
	.globl	output_code
	.def	output_code;	.scl	2;	.type	32;	.endef
output_code:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -8(%rbp)
	jmp	.L8
.L9:
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_code_member
.L8:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L9
	nop
	nop
	leave
	ret
	.section .rdata,"dr"
.LC4:
	.ascii "name\12\0"
.LC5:
	.ascii "NULL\0"
.LC6:
	.ascii "source: \"%s\"\12\0"
	.text
	.def	output_import;	.scl	3;	.type	32;	.endef
output_import:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
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
	movq	24(%rbp), %rcx
	movq	%rax, %r8
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	nop
	leave
	ret
	.section .rdata,"dr"
.LC7:
	.ascii "return_type\12\0"
.LC8:
	.ascii "parameters\12\0"
.LC9:
	.ascii "parameters[%d]\12\0"
.LC10:
	.ascii "body\12\0"
	.text
	.def	output_function;	.scl	3;	.type	32;	.endef
output_function:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -32(%rbp)
	movl	$-1, -4(%rbp)
	jmp	.L14
.L15:
	movq	32(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC9(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	32(%rbp), %rax
	leaq	2(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_variable
.L14:
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L15
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC10(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L16
.L17:
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_statement
.L16:
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L17
	nop
	nop
	leave
	ret
	.def	output_method;	.scl	3;	.type	32;	.endef
output_method:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -32(%rbp)
	movl	$-1, -4(%rbp)
	jmp	.L19
.L20:
	movq	32(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC9(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	32(%rbp), %rax
	leaq	2(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_variable
.L19:
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L20
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC10(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L21
.L22:
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_statement
.L21:
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L22
	nop
	nop
	leave
	ret
	.section .rdata,"dr"
.LC11:
	.ascii "method\12\0"
.LC12:
	.ascii "variable\12\0"
.LC13:
	.ascii "unknown_ClassMemberType: %u\12\0"
	.text
	.def	output_class_member;	.scl	3;	.type	32;	.endef
output_class_member:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	je	.L24
	cmpl	$1, %eax
	je	.L25
	jmp	.L28
.L24:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_method
	jmp	.L27
.L25:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC12(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_variable
	jmp	.L27
.L28:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	-8(%rbp), %rax
	movl	8(%rax), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC13(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
.L27:
	nop
	leave
	ret
	.section .rdata,"dr"
.LC14:
	.ascii "members\12\0"
	.text
	.def	output_class;	.scl	3;	.type	32;	.endef
output_class:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC14(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -16(%rbp)
	jmp	.L30
.L31:
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_class_member
.L30:
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L31
	nop
	nop
	leave
	ret
	.section .rdata,"dr"
.LC15:
	.ascii "type\12\0"
.LC16:
	.ascii "value\12\0"
.LC17:
	.ascii "value: \"NULL\"\12\0"
	.text
	.def	output_variable;	.scl	3;	.type	32;	.endef
output_variable:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L33
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC16(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
	jmp	.L35
.L33:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC17(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L35:
	nop
	leave
	ret
	.section .rdata,"dr"
.LC18:
	.ascii "if_statement\12\0"
.LC19:
	.ascii "for_statement\12\0"
.LC20:
	.ascii "while_statement\12\0"
	.align 8
.LC21:
	.ascii "variable_declaration_statement\12\0"
.LC22:
	.ascii "return_statement: \"NULL\"\12\0"
.LC23:
	.ascii "return_statement\12\0"
.LC24:
	.ascii "break_statement: \"NULL\"\12\0"
.LC25:
	.ascii "continue_statement: \"NULL\"\12\0"
.LC26:
	.ascii "expression_statement: \"NULL\"\12\0"
.LC27:
	.ascii "expression_statement\12\0"
.LC28:
	.ascii "unknown_StatementType: %u\12\0"
	.text
	.def	output_statement;	.scl	3;	.type	32;	.endef
output_statement:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
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
	.section .rdata,"dr"
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
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC18(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_if
	jmp	.L36
.L42:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC19(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_for
	jmp	.L36
.L43:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC20(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_while
	jmp	.L36
.L45:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC21(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_variable
	jmp	.L36
.L41:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L48
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$25, %r8d
	movl	$1, %edx
	leaq	.LC22(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L36
.L48:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC23(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
	jmp	.L36
.L40:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$24, %r8d
	movl	$1, %edx
	leaq	.LC24(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L36
.L38:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$27, %r8d
	movl	$1, %edx
	leaq	.LC25(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L36
.L46:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L49
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$29, %r8d
	movl	$1, %edx
	leaq	.LC26(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L36
.L49:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$21, %r8d
	movl	$1, %edx
	leaq	.LC27(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
	jmp	.L36
.L37:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	-8(%rbp), %rax
	movl	8(%rax), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC28(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
.L36:
	leave
	ret
	.section .rdata,"dr"
.LC29:
	.ascii "condition\12\0"
.LC30:
	.ascii "else_if\12\0"
.LC31:
	.ascii "else_body\12\0"
	.text
	.def	output_if;	.scl	3;	.type	32;	.endef
output_if:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -32(%rbp)
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC29(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC10(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L51
.L52:
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_statement
.L51:
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L52
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC30(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L53
.L54:
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_else_if
.L53:
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L54
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC31(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L55
.L56:
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_statement
.L55:
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L56
	nop
	nop
	leave
	ret
	.def	output_else_if;	.scl	3;	.type	32;	.endef
output_else_if:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -16(%rbp)
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC29(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC10(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L58
.L59:
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_statement
.L58:
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L59
	nop
	nop
	leave
	ret
	.section .rdata,"dr"
.LC32:
	.ascii "initializer\12\0"
.LC33:
	.ascii "initializer: \"NULL\"\12\0"
.LC34:
	.ascii "condition: \"NULL\"\12\0"
.LC35:
	.ascii "increment\12\0"
.LC36:
	.ascii "increment: \"NULL\"\12\0"
	.text
	.def	output_for;	.scl	3;	.type	32;	.endef
output_for:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L61
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC32(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_variable
	jmp	.L62
.L61:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$20, %r8d
	movl	$1, %edx
	leaq	.LC33(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L62:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L63
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC29(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
	jmp	.L64
.L63:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC34(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L64:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L65
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC35(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
	jmp	.L66
.L65:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC36(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L66:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC10(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L67
.L68:
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_statement
.L67:
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L68
	nop
	nop
	leave
	ret
	.def	output_while;	.scl	3;	.type	32;	.endef
output_while:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -16(%rbp)
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC29(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC10(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L70
.L71:
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_statement
.L70:
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L71
	nop
	nop
	leave
	ret
	.section .rdata,"dr"
.LC37:
	.ascii "primary\12\0"
.LC38:
	.ascii "UNKNOWN_OPERATOR\0"
.LC39:
	.ascii "operator: \"%s\"\12\0"
.LC40:
	.ascii "left\12\0"
.LC41:
	.ascii "right\12\0"
	.text
	.def	output_expression;	.scl	3;	.type	32;	.endef
output_expression:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$19, %eax
	jne	.L73
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC37(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_primary
	jmp	.L77
.L73:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, %ecx
	call	operator_to_string
	movq	%rax, -16(%rbp)
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	cmpq	$0, -16(%rbp)
	je	.L75
	movq	-16(%rbp), %rax
	jmp	.L76
.L75:
	leaq	.LC38(%rip), %rax
.L76:
	movq	24(%rbp), %rcx
	movq	%rax, %r8
	leaq	.LC39(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC40(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC41(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
.L77:
	nop
	leave
	ret
	.section .rdata,"dr"
.LC42:
	.ascii "type: \"integer\"\12\0"
.LC43:
	.ascii "value: %s\12\0"
.LC44:
	.ascii "type: \"float\"\12\0"
.LC45:
	.ascii "type: \"string\"\12\0"
.LC46:
	.ascii "value: \"%s\"\12\0"
.LC47:
	.ascii "type: \"boolean\"\12\0"
.LC48:
	.ascii "value: \"true\"\12\0"
.LC49:
	.ascii "value: \"false\"\12\0"
.LC50:
	.ascii "type: \"expression\"\12\0"
.LC51:
	.ascii "type: \"!\"\12\0"
.LC52:
	.ascii "type: \"-\"\12\0"
.LC53:
	.ascii "type: \"variable\"\12\0"
.LC54:
	.ascii "unknown_PrimaryType: %u\12\0"
	.text
	.def	output_primary;	.scl	3;	.type	32;	.endef
output_primary:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
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
	.section .rdata,"dr"
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
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC42(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC43(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L90
.L88:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC44(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC43(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L90
.L87:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC45(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC46(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L90
.L86:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC47(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC48(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L90
.L85:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC47(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC49(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L90
.L84:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$19, %r8d
	movl	$1, %edx
	leaq	.LC50(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC16(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
	jmp	.L90
.L83:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC51(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC16(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_primary
	jmp	.L90
.L82:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC52(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC16(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_primary
	jmp	.L90
.L80:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC53(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC16(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_variable_access
	jmp	.L90
.L79:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	-8(%rbp), %rax
	movl	8(%rax), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC54(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
.L90:
	nop
	leave
	ret
	.section .rdata,"dr"
.LC55:
	.ascii "type: \"name\"\12\0"
.LC56:
	.ascii "type: \"function_call\"\12\0"
.LC57:
	.ascii "arguments\12\0"
.LC58:
	.ascii "arguments[%d]\12\0"
.LC59:
	.ascii "type: \"get sequence_element\"\12\0"
.LC60:
	.ascii "sequence\12\0"
.LC61:
	.ascii "index\12\0"
.LC62:
	.ascii "type: \"get_attribute\"\12\0"
.LC63:
	.ascii "object\12\0"
.LC64:
	.ascii "attribute_name\12\0"
	.align 8
.LC65:
	.ascii "unknown_VariableAccessType: %u\12\0"
	.text
	.def	output_variable_access;	.scl	3;	.type	32;	.endef
output_variable_access:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
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
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC55(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	jmp	.L97
.L96:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -24(%rbp)
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$22, %r8d
	movl	$1, %edx
	leaq	.LC56(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_variable_access
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC57(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$-1, -4(%rbp)
	jmp	.L98
.L99:
	movq	32(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC58(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	32(%rbp), %rax
	leaq	2(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
.L98:
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L99
	jmp	.L97
.L92:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$29, %r8d
	movl	$1, %edx
	leaq	.LC59(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC60(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_variable_access
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC61(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
	jmp	.L97
.L94:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$22, %r8d
	movl	$1, %edx
	leaq	.LC62(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC63(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_variable_access
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC64(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	jmp	.L97
.L93:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	-16(%rbp), %rax
	movl	16(%rax), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC65(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
.L97:
	nop
	leave
	ret
	.section .rdata,"dr"
.LC66:
	.ascii "Name pointer: \"NULL\"\12\0"
.LC67:
	.ascii "name: \"%s\"\12\0"
.LC68:
	.ascii "id: %zu\12\0"
.LC69:
	.ascii "kind: \"type\"\12\0"
.LC70:
	.ascii "kind: \"variable\"\12\0"
.LC71:
	.ascii "kind: \"function\"\12\0"
.LC72:
	.ascii "kind: \"method\"\12\0"
.LC73:
	.ascii "kind: \"class\"\12\0"
.LC74:
	.ascii "kind: \"attribute\"\12\0"
.LC75:
	.ascii "kind: \"unknown_NameType\"\12\0"
	.text
	.def	output_name;	.scl	3;	.type	32;	.endef
output_name:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L101
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$21, %r8d
	movl	$1, %edx
	leaq	.LC66(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L100
.L101:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC67(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC68(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
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
	.section .rdata,"dr"
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
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC69(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L100
.L109:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC70(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	jmp	.L100
.L108:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC71(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	jmp	.L100
.L107:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC72(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	jmp	.L100
.L106:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC73(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L100
.L104:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC74(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	jmp	.L100
.L103:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$25, %r8d
	movl	$1, %edx
	leaq	.LC75(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	nop
.L100:
	leave
	ret
	.ident	"GCC: (GNU) 13.2.0"
	.def	indention;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
