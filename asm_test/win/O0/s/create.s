	.file	"D:\\TC\\src\\create.c"
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Error creating code member: content is NULL\12\0"
	.align 8
.LC1:
	.ascii "Error creating code member: unknown type %u\12\0"
	.text
	.globl	create_code_member
	.def	create_code_member;	.scl	2;	.type	32;	.endef
create_code_member:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 8(%rax)
	cmpl	$0, 16(%rbp)
	jne	.L2
	cmpq	$0, 24(%rbp)
	je	.L2
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L3
.L2:
	cmpl	$1, 16(%rbp)
	jne	.L4
	cmpq	$0, 32(%rbp)
	je	.L4
	movq	-8(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L3
.L4:
	cmpl	$2, 16(%rbp)
	jne	.L5
	cmpq	$0, 40(%rbp)
	je	.L5
	movq	-8(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L3
.L5:
	cmpq	$0, 24(%rbp)
	jne	.L6
	cmpq	$0, 32(%rbp)
	jne	.L6
	cmpq	$0, 40(%rbp)
	jne	.L6
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$44, %r8d
	movl	$1, %edx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L7
.L6:
	call	__getreent
	movq	24(%rax), %rax
	movl	16(%rbp), %edx
	movl	%edx, %r8d
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L7:
	movl	$0, %eax
	jmp	.L8
.L3:
	movq	-8(%rbp), %rax
.L8:
	leave
	ret
	.globl	create_code
	.def	create_code;	.scl	2;	.type	32;	.endef
create_code:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC2:
	.ascii "Error creating import: name is NULL\12\0"
	.text
	.globl	create_import
	.def	create_import;	.scl	2;	.type	32;	.endef
create_import:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L12
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$36, %r8d
	movl	$1, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L13
.L12:
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
.L13:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC3:
	.ascii "Error creating function: name or return_type is NULL\12\0"
	.text
	.globl	create_function
	.def	create_function;	.scl	2;	.type	32;	.endef
create_function:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L15
	cmpq	$0, 24(%rbp)
	jne	.L16
.L15:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$53, %r8d
	movl	$1, %edx
	leaq	.LC3(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L17
.L16:
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-16(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-16(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-16(%rbp), %rax
	movq	48(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rbp), %rax
.L17:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "Error creating method: name or return_type is NULL\12\0"
	.text
	.globl	create_method
	.def	create_method;	.scl	2;	.type	32;	.endef
create_method:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L19
	cmpq	$0, 24(%rbp)
	jne	.L20
.L19:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$51, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L21
.L20:
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-16(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-16(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-16(%rbp), %rax
	movq	48(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rbp), %rax
.L21:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "Error creating class member: content is NULL\12\0"
	.align 8
.LC6:
	.ascii "Error creating class member: unknown type %u\12\0"
	.text
	.globl	create_class_member
	.def	create_class_member;	.scl	2;	.type	32;	.endef
create_class_member:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 8(%rax)
	cmpl	$0, 16(%rbp)
	jne	.L23
	cmpq	$0, 24(%rbp)
	je	.L23
	movq	-16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L24
.L23:
	cmpl	$1, 16(%rbp)
	jne	.L25
	cmpq	$0, 32(%rbp)
	je	.L25
	movq	-16(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L24
.L25:
	cmpq	$0, 24(%rbp)
	jne	.L26
	cmpq	$0, 32(%rbp)
	jne	.L26
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$45, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L27
.L26:
	call	__getreent
	movq	24(%rax), %rax
	movl	16(%rbp), %edx
	movl	%edx, %r8d
	leaq	.LC6(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L27:
	movl	$0, %eax
	jmp	.L28
.L24:
	movq	-8(%rbp), %rax
.L28:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC7:
	.ascii "Error creating class: name is NULL\12\0"
	.text
	.globl	create_class
	.def	create_class;	.scl	2;	.type	32;	.endef
create_class:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L30
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$35, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L31
.L30:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-16(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
.L31:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC8:
	.ascii "Error creating variable: type or name is NULL\12\0"
	.text
	.globl	create_variable
	.def	create_variable;	.scl	2;	.type	32;	.endef
create_variable:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L33
	cmpq	$0, 24(%rbp)
	jne	.L34
.L33:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$46, %r8d
	movl	$1, %edx
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L35
.L34:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-16(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
.L35:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC9:
	.ascii "Error creating statement: content is NULL\12\0"
	.align 8
.LC10:
	.ascii "Error creating statement: unknown type %u\12\0"
	.text
	.globl	create_statement
	.def	create_statement;	.scl	2;	.type	32;	.endef
create_statement:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 8(%rax)
	cmpl	$0, 16(%rbp)
	jne	.L37
	cmpq	$0, 48(%rbp)
	je	.L37
	movq	-16(%rbp), %rax
	movq	48(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L38
.L37:
	cmpl	$1, 16(%rbp)
	jne	.L39
	cmpq	$0, 56(%rbp)
	je	.L39
	movq	-16(%rbp), %rax
	movq	56(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L38
.L39:
	cmpl	$2, 16(%rbp)
	jne	.L40
	cmpq	$0, 24(%rbp)
	je	.L40
	movq	-16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L38
.L40:
	cmpl	$3, 16(%rbp)
	jne	.L41
	cmpq	$0, 32(%rbp)
	je	.L41
	movq	-16(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L38
.L41:
	cmpl	$4, 16(%rbp)
	jne	.L42
	cmpq	$0, 40(%rbp)
	je	.L42
	movq	-16(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L38
.L42:
	cmpl	$5, 16(%rbp)
	jne	.L43
	cmpq	$0, 48(%rbp)
	je	.L43
	movq	-16(%rbp), %rax
	movq	48(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L38
.L43:
	cmpl	$6, 16(%rbp)
	je	.L44
	cmpl	$7, 16(%rbp)
	jne	.L45
.L44:
	movq	-16(%rbp), %rax
	movq	$0, (%rax)
	jmp	.L38
.L45:
	cmpq	$0, 24(%rbp)
	jne	.L46
	cmpq	$0, 32(%rbp)
	jne	.L46
	cmpq	$0, 40(%rbp)
	jne	.L46
	cmpq	$0, 48(%rbp)
	jne	.L46
	cmpq	$0, 56(%rbp)
	jne	.L46
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$42, %r8d
	movl	$1, %edx
	leaq	.LC9(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L47
.L46:
	call	__getreent
	movq	24(%rax), %rax
	movl	16(%rbp), %edx
	movl	%edx, %r8d
	leaq	.LC10(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L47:
	movl	$0, %eax
	jmp	.L48
.L38:
	movq	-8(%rbp), %rax
.L48:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC11:
	.ascii "Error creating if statement: condition is NULL\12\0"
	.text
	.globl	create_if
	.def	create_if;	.scl	2;	.type	32;	.endef
create_if:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L50
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$47, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L51
.L50:
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-16(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-16(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-8(%rbp), %rax
.L51:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC12:
	.ascii "Error creating else-if statement: condition is NULL\12\0"
	.text
	.globl	create_else_if
	.def	create_else_if;	.scl	2;	.type	32;	.endef
create_else_if:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L53
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC12(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L54
.L53:
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
.L54:
	leave
	ret
	.globl	create_for
	.def	create_for;	.scl	2;	.type	32;	.endef
create_for:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-16(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-16(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.globl	create_while
	.def	create_while;	.scl	2;	.type	32;	.endef
create_while:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.section .rdata,"dr"
.LC13:
	.ascii "true\0"
.LC14:
	.ascii "false\0"
	.align 8
.LC15:
	.ascii "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\12\0"
	.align 8
.LC16:
	.ascii "Error creating expression: both expr_left and prim_left are NULL\12\0"
	.text
	.globl	create_expression
	.def	create_expression;	.scl	2;	.type	32;	.endef
create_expression:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$64, %rsp
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	cmpl	$19, 16(%rbp)
	sete	%dl
	cmpq	$0, 40(%rbp)
	sete	%al
	xorl	%edx, %eax
	testb	%al, %al
	jne	.L60
	cmpq	$0, 24(%rbp)
	jne	.L61
	cmpq	$0, 32(%rbp)
	jne	.L61
.L60:
	cmpq	$0, 40(%rbp)
	jne	.L62
	leaq	.LC13(%rip), %rsi
	jmp	.L63
.L62:
	leaq	.LC14(%rip), %rsi
.L63:
	cmpq	$0, 32(%rbp)
	jne	.L64
	leaq	.LC13(%rip), %rbx
	jmp	.L65
.L64:
	leaq	.LC14(%rip), %rbx
.L65:
	cmpq	$0, 24(%rbp)
	jne	.L66
	leaq	.LC13(%rip), %r12
	jmp	.L67
.L66:
	leaq	.LC14(%rip), %r12
.L67:
	cmpl	$19, 16(%rbp)
	jne	.L68
	leaq	.LC13(%rip), %rdi
	jmp	.L69
.L68:
	leaq	.LC14(%rip), %rdi
.L69:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rsi, 40(%rsp)
	movq	%rbx, 32(%rsp)
	movq	%r12, %r9
	movq	%rdi, %r8
	leaq	.LC15(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$0, %eax
	jmp	.L70
.L61:
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 24(%rax)
	cmpq	$0, 24(%rbp)
	je	.L71
	movq	-48(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L72
.L71:
	cmpq	$0, 32(%rbp)
	je	.L73
	movq	-48(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L72
.L73:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$65, %r8d
	movl	$1, %edx
	leaq	.LC16(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L70
.L72:
	movq	-48(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-40(%rbp), %rax
.L70:
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC17:
	.ascii "Error creating primary: value is NULL\12\0"
	.align 8
.LC18:
	.ascii "Error creating primary: unknown type %u\12\0"
	.text
	.globl	create_primary
	.def	create_primary;	.scl	2;	.type	32;	.endef
create_primary:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 8(%rax)
	cmpl	$0, 16(%rbp)
	je	.L75
	cmpl	$1, 16(%rbp)
	je	.L75
	cmpl	$2, 16(%rbp)
	je	.L75
	cmpl	$3, 16(%rbp)
	je	.L75
	cmpl	$4, 16(%rbp)
	jne	.L76
.L75:
	cmpq	$0, 24(%rbp)
	je	.L76
	movq	-16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L77
.L76:
	cmpl	$5, 16(%rbp)
	jne	.L78
	cmpq	$0, 32(%rbp)
	je	.L78
	movq	-16(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L77
.L78:
	cmpl	$6, 16(%rbp)
	je	.L79
	cmpl	$7, 16(%rbp)
	jne	.L80
.L79:
	cmpq	$0, 40(%rbp)
	je	.L80
	movq	-16(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L77
.L80:
	cmpl	$8, 16(%rbp)
	jne	.L81
	cmpq	$0, 48(%rbp)
	je	.L81
	movq	-16(%rbp), %rax
	movq	48(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L77
.L81:
	cmpq	$0, 24(%rbp)
	jne	.L82
	cmpq	$0, 32(%rbp)
	jne	.L82
	cmpq	$0, 40(%rbp)
	jne	.L82
	cmpq	$0, 48(%rbp)
	jne	.L82
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC17(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L83
.L82:
	call	__getreent
	movq	24(%rax), %rax
	movl	16(%rbp), %edx
	movl	%edx, %r8d
	leaq	.LC18(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L83:
	movl	$0, %eax
	jmp	.L84
.L77:
	movq	-8(%rbp), %rax
.L84:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC19:
	.ascii "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\12\0"
	.align 8
.LC20:
	.ascii "Error creating variable access: content is NULL\12\0"
	.align 8
.LC21:
	.ascii "Error creating variable access: unknown type %u\12\0"
	.text
	.globl	create_variable_access
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
create_variable_access:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	pushq	%rbx
	subq	$48, %rsp
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	cmpq	$0, 24(%rbp)
	sete	%dl
	cmpl	$0, 16(%rbp)
	sete	%al
	xorl	%edx, %eax
	testb	%al, %al
	je	.L86
	cmpl	$0, 16(%rbp)
	jne	.L87
	leaq	.LC13(%rip), %rsi
	jmp	.L88
.L87:
	leaq	.LC14(%rip), %rsi
.L88:
	cmpq	$0, 24(%rbp)
	jne	.L89
	leaq	.LC13(%rip), %rbx
	jmp	.L90
.L89:
	leaq	.LC14(%rip), %rbx
.L90:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC19(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$0, %eax
	jmp	.L91
.L86:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 16(%rax)
	movq	-32(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	cmpl	$0, 16(%rbp)
	jne	.L92
	cmpq	$0, 32(%rbp)
	je	.L92
	movq	-32(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L93
.L92:
	cmpl	$1, 16(%rbp)
	jne	.L94
	cmpq	$0, 48(%rbp)
	je	.L94
	movq	-32(%rbp), %rax
	movq	48(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L93
.L94:
	cmpl	$3, 16(%rbp)
	jne	.L95
	cmpq	$0, 40(%rbp)
	je	.L95
	movq	-32(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L93
.L95:
	cmpl	$2, 16(%rbp)
	jne	.L96
	cmpq	$0, 32(%rbp)
	je	.L96
	movq	-32(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L93
.L96:
	cmpq	$0, 32(%rbp)
	jne	.L97
	cmpq	$0, 40(%rbp)
	jne	.L97
	cmpq	$0, 48(%rbp)
	jne	.L97
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$48, %r8d
	movl	$1, %edx
	leaq	.LC20(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L98
.L97:
	call	__getreent
	movq	24(%rax), %rax
	movl	16(%rbp), %edx
	movl	%edx, %r8d
	leaq	.LC21(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L98:
	movl	$0, %eax
	jmp	.L91
.L93:
	movq	-24(%rbp), %rax
.L91:
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
