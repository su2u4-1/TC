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
	.p2align 4
	.globl	create_code_member
	.def	create_code_member;	.scl	2;	.type	32;	.endef
create_code_member:
	pushq	%rbp
	movq	%r9, %rbp
	pushq	%rdi
	movq	%r8, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movl	%ecx, %ebx
	movl	$16, %ecx
	subq	$40, %rsp
	call	alloc_memory
	movl	%ebx, 8(%rax)
	testl	%ebx, %ebx
	jne	.L2
	testq	%rsi, %rsi
	je	.L2
	movq	%rsi, (%rax)
.L1:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L2:
	cmpl	$1, %ebx
	jne	.L4
	testq	%rdi, %rdi
	je	.L4
	movq	%rdi, (%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	cmpl	$2, %ebx
	jne	.L6
	testq	%rbp, %rbp
	je	.L6
	movq	%rbp, (%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	movq	%rbp, %r9
	orq	%rdi, %r9
	orq	%r9, %rsi
	je	.L29
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC1(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L1
.L29:
	call	__getreent
	movl	$44, %r8d
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L1
	.p2align 4
	.globl	create_code
	.def	create_code;	.scl	2;	.type	32;	.endef
create_code:
	pushq	%rsi
	movq	%rcx, %rsi
	movl	$16, %ecx
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$40, %rsp
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rbx, 8(%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.section .rdata,"dr"
	.align 8
.LC2:
	.ascii "Error creating import: name is NULL\12\0"
	.text
	.p2align 4
	.globl	create_import
	.def	create_import;	.scl	2;	.type	32;	.endef
create_import:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	testq	%rcx, %rcx
	je	.L36
	movq	%rcx, %rbx
	movl	$16, %ecx
	movq	%rdx, %rsi
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
.L32:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
	.p2align 3
.L36:
	call	__getreent
	movl	$36, %r8d
	movl	$1, %edx
	leaq	.LC2(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L32
	.section .rdata,"dr"
	.align 8
.LC3:
	.ascii "Error creating function: name or return_type is NULL\12\0"
	.text
	.p2align 4
	.globl	create_function
	.def	create_function;	.scl	2;	.type	32;	.endef
create_function:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	testq	%rcx, %rcx
	je	.L41
	movq	%rdx, %rsi
	testq	%rdx, %rdx
	je	.L41
	movq	%rcx, %rbx
	movl	$40, %ecx
	movq	%r8, %rbp
	movq	%r9, %rdi
	call	alloc_memory
	movq	112(%rsp), %rdx
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
	movq	%rbp, 16(%rax)
	movq	%rdi, 24(%rax)
	movq	%rdx, 32(%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L41:
	call	__getreent
	movl	$53, %r8d
	movl	$1, %edx
	leaq	.LC3(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	addq	$40, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "Error creating method: name or return_type is NULL\12\0"
	.text
	.p2align 4
	.globl	create_method
	.def	create_method;	.scl	2;	.type	32;	.endef
create_method:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	testq	%rcx, %rcx
	je	.L47
	movq	%rdx, %rsi
	testq	%rdx, %rdx
	je	.L47
	movq	%rcx, %rbx
	movl	$40, %ecx
	movq	%r8, %rbp
	movq	%r9, %rdi
	call	alloc_memory
	movq	112(%rsp), %rdx
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
	movq	%rbp, 16(%rax)
	movq	%rdi, 24(%rax)
	movq	%rdx, 32(%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L47:
	call	__getreent
	movl	$51, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	addq	$40, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "Error creating class member: content is NULL\12\0"
	.align 8
.LC6:
	.ascii "Error creating class member: unknown type %u\12\0"
	.text
	.p2align 4
	.globl	create_class_member
	.def	create_class_member;	.scl	2;	.type	32;	.endef
create_class_member:
	pushq	%rdi
	movq	%r8, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movl	%ecx, %ebx
	movl	$16, %ecx
	subq	$32, %rsp
	call	alloc_memory
	movl	%ebx, 8(%rax)
	testl	%ebx, %ebx
	jne	.L50
	testq	%rsi, %rsi
	je	.L50
	movq	%rsi, (%rax)
.L49:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L50:
	cmpl	$1, %ebx
	jne	.L52
	testq	%rdi, %rdi
	je	.L52
	movq	%rdi, (%rax)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L52:
	orq	%rdi, %rsi
	jne	.L54
	call	__getreent
	movl	$45, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L49
	.p2align 4,,10
	.p2align 3
.L54:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC6(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L49
	.section .rdata,"dr"
	.align 8
.LC7:
	.ascii "Error creating class: name is NULL\12\0"
	.text
	.p2align 4
	.globl	create_class
	.def	create_class;	.scl	2;	.type	32;	.endef
create_class:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	testq	%rcx, %rcx
	je	.L73
	movq	%rcx, %rbx
	movl	$24, %ecx
	movq	%rdx, %rdi
	movq	%r8, %rsi
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rdi, 8(%rax)
	movq	%rsi, 16(%rax)
.L69:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L73:
	call	__getreent
	movl	$35, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L69
	.section .rdata,"dr"
	.align 8
.LC8:
	.ascii "Error creating variable: type or name is NULL\12\0"
	.text
	.p2align 4
	.globl	create_variable
	.def	create_variable;	.scl	2;	.type	32;	.endef
create_variable:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	testq	%rcx, %rcx
	je	.L78
	movq	%rdx, %rsi
	testq	%rdx, %rdx
	je	.L78
	movq	%rcx, %rbx
	movl	$24, %ecx
	movq	%r8, %rdi
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
	movq	%rdi, 16(%rax)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L78:
	call	__getreent
	movl	$46, %r8d
	movl	$1, %edx
	leaq	.LC8(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	addq	$32, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.section .rdata,"dr"
	.align 8
.LC9:
	.ascii "Error creating statement: content is NULL\12\0"
	.align 8
.LC10:
	.ascii "Error creating statement: unknown type %u\12\0"
	.text
	.p2align 4
	.globl	create_statement
	.def	create_statement;	.scl	2;	.type	32;	.endef
create_statement:
	pushq	%r12
	movq	%r8, %r12
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rdi
	pushq	%rsi
	movq	%r9, %rsi
	pushq	%rbx
	movl	%ecx, %ebx
	movl	$16, %ecx
	subq	$32, %rsp
	movq	112(%rsp), %rdi
	call	alloc_memory
	testq	%rdi, %rdi
	movl	%ebx, 8(%rax)
	setne	%dl
	testl	%ebx, %ebx
	jne	.L81
	testb	%dl, %dl
	je	.L81
.L129:
	movq	%rdi, (%rax)
.L80:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L81:
	cmpl	$1, %ebx
	jne	.L83
	cmpq	$0, 120(%rsp)
	je	.L83
	movq	120(%rsp), %rsi
	movq	%rsi, (%rax)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L83:
	cmpl	$2, %ebx
	jne	.L85
	testq	%rbp, %rbp
	je	.L85
	movq	%rbp, (%rax)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L85:
	cmpl	$3, %ebx
	jne	.L86
	testq	%r12, %r12
	je	.L86
	movq	%r12, (%rax)
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L86:
	cmpl	$4, %ebx
	jne	.L87
	testq	%rsi, %rsi
	je	.L87
	movq	%rsi, (%rax)
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L87:
	cmpl	$5, %ebx
	jne	.L88
	testb	%dl, %dl
	jne	.L129
.L88:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L89
	movq	$0, (%rax)
	jmp	.L80
.L89:
	orq	%r12, %rsi
	movq	120(%rsp), %rax
	movq	%rbp, %rdx
	orq	%rsi, %rdx
	orq	%rdx, %rax
	orq	%rdi, %rax
	je	.L130
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC10(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L80
.L130:
	call	__getreent
	movl	$42, %r8d
	movl	$1, %edx
	leaq	.LC9(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L80
	.section .rdata,"dr"
	.align 8
.LC11:
	.ascii "Error creating if statement: condition is NULL\12\0"
	.text
	.p2align 4
	.globl	create_if
	.def	create_if;	.scl	2;	.type	32;	.endef
create_if:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	testq	%rcx, %rcx
	je	.L135
	movq	%rcx, %rbx
	movl	$32, %ecx
	movq	%rdx, %rbp
	movq	%r8, %rdi
	movq	%r9, %rsi
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
	movq	%rdi, 16(%rax)
	movq	%rsi, 24(%rax)
.L131:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L135:
	call	__getreent
	movl	$47, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L131
	.section .rdata,"dr"
	.align 8
.LC12:
	.ascii "Error creating else-if statement: condition is NULL\12\0"
	.text
	.p2align 4
	.globl	create_else_if
	.def	create_else_if;	.scl	2;	.type	32;	.endef
create_else_if:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	testq	%rcx, %rcx
	je	.L140
	movq	%rcx, %rbx
	movl	$16, %ecx
	movq	%rdx, %rsi
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
.L136:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
	.p2align 3
.L140:
	call	__getreent
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC12(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L136
	.p2align 4
	.globl	create_for
	.def	create_for;	.scl	2;	.type	32;	.endef
create_for:
	pushq	%rbp
	movq	%rcx, %rbp
	movl	$32, %ecx
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	movq	%r8, %rsi
	pushq	%rbx
	movq	%r9, %rbx
	subq	$40, %rsp
	call	alloc_memory
	movq	%rbp, (%rax)
	movq	%rdi, 8(%rax)
	movq	%rsi, 16(%rax)
	movq	%rbx, 24(%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4
	.globl	create_while
	.def	create_while;	.scl	2;	.type	32;	.endef
create_while:
	pushq	%rsi
	movq	%rcx, %rsi
	movl	$16, %ecx
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$40, %rsp
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rbx, 8(%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
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
	.p2align 4
	.globl	create_expression
	.def	create_expression;	.scl	2;	.type	32;	.endef
create_expression:
	pushq	%r12
	pushq	%rbp
	movq	%r8, %rbp
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	movq	%r9, %rsi
	pushq	%rbx
	movl	%ecx, %ebx
	subq	$48, %rsp
	cmpl	$19, %ecx
	sete	%dl
	testq	%r9, %r9
	sete	%al
	cmpb	%al, %dl
	jne	.L146
	movq	%r8, %rax
	orq	%rdi, %rax
	je	.L163
	movl	$32, %ecx
	call	alloc_memory
	movl	%ebx, 24(%rax)
	testq	%rdi, %rdi
	je	.L153
	movq	%rdi, (%rax)
.L154:
	movq	%rsi, 16(%rax)
.L145:
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L163:
	leaq	.LC13(%rip), %rbp
	testq	%r9, %r9
	je	.L157
	leaq	.LC14(%rip), %r12
	movq	%rbp, %rsi
	jmp	.L148
	.p2align 4,,10
	.p2align 3
.L146:
	leaq	.LC13(%rip), %rax
	leaq	.LC14(%rip), %r9
	testq	%rsi, %rsi
	movq	%rax, %r12
	movq	%rax, %rbp
	cmovne	%r9, %r12
	testq	%r8, %r8
	cmovne	%r9, %rbp
	testq	%rdi, %rdi
	cmovne	%r9, %rax
	movq	%rax, %rsi
.L148:
	cmpl	$19, %ebx
	leaq	.LC13(%rip), %rax
	leaq	.LC14(%rip), %rbx
	cmove	%rax, %rbx
	call	__getreent
	movq	%rsi, %r9
	leaq	.LC15(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%r12, 40(%rsp)
	movq	%rbx, %r8
	movq	%rbp, 32(%rsp)
	call	fprintf
	xorl	%eax, %eax
	jmp	.L145
	.p2align 4,,10
	.p2align 3
.L157:
	movq	%rbp, %r12
	movq	%rbp, %rsi
	jmp	.L148
	.p2align 4,,10
	.p2align 3
.L153:
	testq	%rbp, %rbp
	je	.L155
	movq	%rbp, 8(%rax)
	jmp	.L154
.L155:
	call	__getreent
	movl	$65, %r8d
	movl	$1, %edx
	leaq	.LC16(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L145
	.section .rdata,"dr"
	.align 8
.LC17:
	.ascii "Error creating primary: value is NULL\12\0"
	.align 8
.LC18:
	.ascii "Error creating primary: unknown type %u\12\0"
	.text
	.p2align 4
	.globl	create_primary
	.def	create_primary;	.scl	2;	.type	32;	.endef
create_primary:
	pushq	%rbp
	movq	%r8, %rbp
	pushq	%rdi
	movq	%r9, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movl	%ecx, %ebx
	movl	$16, %ecx
	subq	$40, %rsp
	call	alloc_memory
	movl	%ebx, 8(%rax)
	cmpl	$4, %ebx
	ja	.L165
	testq	%rsi, %rsi
	je	.L165
	movq	%rsi, (%rax)
.L164:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L165:
	cmpl	$5, %ebx
	jne	.L167
	testq	%rbp, %rbp
	je	.L167
	movq	%rbp, (%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L167:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	jbe	.L196
	cmpl	$8, %ebx
	jne	.L170
	cmpq	$0, 112(%rsp)
	je	.L170
	movq	112(%rsp), %rdi
.L195:
	movq	%rdi, (%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L196:
	testq	%rdi, %rdi
	jne	.L195
.L170:
	movq	112(%rsp), %rax
	movq	%rbp, %r8
	orq	%rdi, %rax
	orq	%rax, %r8
	orq	%r8, %rsi
	jne	.L171
	call	__getreent
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC17(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L164
	.p2align 4,,10
	.p2align 3
.L171:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC18(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L164
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
	.p2align 4
	.globl	create_variable_access
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
create_variable_access:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movl	%ecx, %ebx
	subq	$32, %rsp
	testl	%ecx, %ecx
	sete	%al
	testq	%rdx, %rdx
	sete	%r12b
	cmpb	%al, %r12b
	jne	.L237
	movq	%r8, %rdi
	movl	$24, %ecx
	movq	%r9, %rbp
	call	alloc_memory
	testq	%rdi, %rdi
	movl	%ebx, 16(%rax)
	setne	%dl
	movq	%rsi, (%rax)
	testb	%r12b, %r12b
	je	.L202
	testb	%dl, %dl
	je	.L202
.L236:
	movq	%rdi, 8(%rax)
.L197:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L202:
	cmpl	$1, %ebx
	jne	.L204
	cmpq	$0, 112(%rsp)
	je	.L204
	movq	112(%rsp), %rsi
	movq	%rsi, 8(%rax)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L237:
	leaq	.LC13(%rip), %rax
	leaq	.LC14(%rip), %r8
	testl	%ecx, %ecx
	movq	%rax, %rdi
	cmovne	%r8, %rdi
	testq	%rdx, %rdx
	cmovne	%r8, %rax
	movq	%rax, %rbx
	call	__getreent
	movq	%rdi, %r9
	movq	%rbx, %r8
	leaq	.LC19(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L197
	.p2align 4,,10
	.p2align 3
.L204:
	cmpl	$3, %ebx
	jne	.L206
	testq	%rbp, %rbp
	je	.L206
	movq	%rbp, 8(%rax)
	jmp	.L197
	.p2align 4,,10
	.p2align 3
.L206:
	cmpl	$2, %ebx
	jne	.L207
	testb	%dl, %dl
	jne	.L236
.L207:
	movq	112(%rsp), %r9
	orq	%rbp, %r9
	orq	%r9, %rdi
	je	.L238
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC21(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L197
.L238:
	call	__getreent
	movl	$48, %r8d
	movl	$1, %edx
	leaq	.LC20(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L197
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
