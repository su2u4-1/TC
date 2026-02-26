	.file	"D:\\TC\\src\\create.c"
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Error creating code member: content is NULL\12\0"
	.align 8
.LC1:
	.ascii "Error creating code member: unknown type %d\12\0"
	.text
	.p2align 4
	.globl	create_code_member
	.def	create_code_member;	.scl	2;	.type	32;	.endef
	.seh_proc	create_code_member
create_code_member:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movl	%ecx, %ebx
	movl	$16, %ecx
	movq	%rdx, %rsi
	movq	%r8, %rdi
	movq	%r9, %rbp
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
	je	.L28
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC1(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L1
.L28:
	call	__getreent
	movl	$44, %r8d
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L1
	.seh_endproc
	.p2align 4
	.globl	create_code
	.def	create_code;	.scl	2;	.type	32;	.endef
	.seh_proc	create_code
create_code:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rsi
	movl	$16, %ecx
	movq	%rdx, %rbx
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rbx, 8(%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC2:
	.ascii "Error creating import: name is NULL\12\0"
	.text
	.p2align 4
	.globl	create_import
	.def	create_import;	.scl	2;	.type	32;	.endef
	.seh_proc	create_import
create_import:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	testq	%rcx, %rcx
	je	.L33
	movl	$16, %ecx
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
.L30:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
	.p2align 3
.L33:
	call	__getreent
	movl	$36, %r8d
	movl	$1, %edx
	leaq	.LC2(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L30
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC3:
	.ascii "Error creating function: name or return_type is NULL\12\0"
	.text
	.p2align 4
	.globl	create_function
	.def	create_function;	.scl	2;	.type	32;	.endef
	.seh_proc	create_function
create_function:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	movq	%r8, %rbp
	movq	%r9, %rdi
	testq	%rcx, %rcx
	je	.L38
	testq	%rdx, %rdx
	je	.L38
	movl	$40, %ecx
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
.L38:
	call	__getreent
	movl	$53, %r8d
	movl	$1, %edx
	leaq	.LC3(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "Error creating method: name or return_type is NULL\12\0"
	.text
	.p2align 4
	.globl	create_method
	.def	create_method;	.scl	2;	.type	32;	.endef
	.seh_proc	create_method
create_method:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	movq	%r8, %rbp
	movq	%r9, %rdi
	testq	%rcx, %rcx
	je	.L43
	testq	%rdx, %rdx
	je	.L43
	movl	$40, %ecx
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
.L43:
	call	__getreent
	movl	$51, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "Error creating class member: content is NULL\12\0"
	.align 8
.LC6:
	.ascii "Error creating class member: unknown type %d\12\0"
	.text
	.p2align 4
	.globl	create_class_member
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.seh_proc	create_class_member
create_class_member:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, %ebx
	movl	$16, %ecx
	movq	%rdx, %rsi
	movq	%r8, %rdi
	call	alloc_memory
	movl	%ebx, 8(%rax)
	testl	%ebx, %ebx
	jne	.L45
	testq	%rsi, %rsi
	je	.L45
	movq	%rsi, (%rax)
.L44:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L45:
	cmpl	$1, %ebx
	jne	.L47
	testq	%rdi, %rdi
	je	.L47
	movq	%rdi, (%rax)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L47:
	orq	%rdi, %rsi
	jne	.L49
	call	__getreent
	movl	$45, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L44
	.p2align 4,,10
	.p2align 3
.L49:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC6(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L44
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC7:
	.ascii "Error creating class: name is NULL\12\0"
	.text
	.p2align 4
	.globl	create_class
	.def	create_class;	.scl	2;	.type	32;	.endef
	.seh_proc	create_class
create_class:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%rdx, %rdi
	movq	%r8, %rsi
	testq	%rcx, %rcx
	je	.L66
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rdi, 8(%rax)
	movq	%rsi, 16(%rax)
.L63:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L66:
	call	__getreent
	movl	$35, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L63
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC8:
	.ascii "Error creating variable: type or name is NULL\12\0"
	.text
	.p2align 4
	.globl	create_variable
	.def	create_variable;	.scl	2;	.type	32;	.endef
	.seh_proc	create_variable
create_variable:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	movq	%r8, %rdi
	testq	%rcx, %rcx
	je	.L71
	testq	%rdx, %rdx
	je	.L71
	movl	$24, %ecx
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
.L71:
	call	__getreent
	movl	$46, %r8d
	movl	$1, %edx
	leaq	.LC8(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC9:
	.ascii "Error creating statement: content is NULL\12\0"
	.align 8
.LC10:
	.ascii "Error creating statement: unknown type %d\12\0"
	.text
	.p2align 4
	.globl	create_statement
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.seh_proc	create_statement
create_statement:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	112(%rsp), %rdi
	movl	%ecx, %ebx
	movl	$16, %ecx
	movq	%rdx, %rbp
	movq	%r8, %r12
	movq	%r9, %rsi
	call	alloc_memory
	testq	%rdi, %rdi
	movl	%ebx, 8(%rax)
	setne	%dl
	testl	%ebx, %ebx
	jne	.L73
	testb	%dl, %dl
	je	.L73
.L120:
	movq	%rdi, (%rax)
.L72:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L73:
	cmpl	$1, %ebx
	jne	.L75
	cmpq	$0, 120(%rsp)
	je	.L75
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
.L75:
	cmpl	$2, %ebx
	jne	.L77
	testq	%rbp, %rbp
	je	.L77
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
.L77:
	cmpl	$3, %ebx
	jne	.L78
	testq	%r12, %r12
	je	.L78
	movq	%r12, (%rax)
	jmp	.L72
	.p2align 4,,10
	.p2align 3
.L78:
	cmpl	$4, %ebx
	jne	.L79
	testq	%rsi, %rsi
	je	.L79
	movq	%rsi, (%rax)
	jmp	.L72
	.p2align 4,,10
	.p2align 3
.L79:
	cmpl	$5, %ebx
	jne	.L80
	testb	%dl, %dl
	jne	.L120
.L80:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L81
	movq	$0, (%rax)
	jmp	.L72
.L81:
	orq	%r12, %rsi
	movq	120(%rsp), %rax
	movq	%rbp, %rdx
	orq	%rsi, %rdx
	orq	%rdx, %rax
	orq	%rdi, %rax
	je	.L121
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC10(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L72
.L121:
	call	__getreent
	movl	$42, %r8d
	movl	$1, %edx
	leaq	.LC9(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L72
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC11:
	.ascii "Error creating if statement: condition is NULL\12\0"
	.text
	.p2align 4
	.globl	create_if
	.def	create_if;	.scl	2;	.type	32;	.endef
	.seh_proc	create_if
create_if:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%r8, %rdi
	movq	%r9, %rsi
	testq	%rcx, %rcx
	je	.L125
	movl	$32, %ecx
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
	movq	%rdi, 16(%rax)
	movq	%rsi, 24(%rax)
.L122:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L125:
	call	__getreent
	movl	$47, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L122
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC12:
	.ascii "Error creating else-if statement: condition is NULL\12\0"
	.text
	.p2align 4
	.globl	create_else_if
	.def	create_else_if;	.scl	2;	.type	32;	.endef
	.seh_proc	create_else_if
create_else_if:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	testq	%rcx, %rcx
	je	.L129
	movl	$16, %ecx
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
.L126:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
	.p2align 3
.L129:
	call	__getreent
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC12(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L126
	.seh_endproc
	.p2align 4
	.globl	create_for
	.def	create_for;	.scl	2;	.type	32;	.endef
	.seh_proc	create_for
create_for:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rbp
	movl	$32, %ecx
	movq	%rdx, %rdi
	movq	%r8, %rsi
	movq	%r9, %rbx
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
	.seh_endproc
	.p2align 4
	.globl	create_while
	.def	create_while;	.scl	2;	.type	32;	.endef
	.seh_proc	create_while
create_while:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rsi
	movl	$16, %ecx
	movq	%rdx, %rbx
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rbx, 8(%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
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
	.seh_proc	create_expression
create_expression:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	cmpl	$19, %ecx
	movq	%rdx, %rdi
	movl	%ecx, %ebx
	movq	%r8, %rbp
	sete	%dl
	testq	%r9, %r9
	movq	%r9, %rsi
	sete	%al
	cmpb	%al, %dl
	jne	.L133
	movq	%r8, %rax
	orq	%rdi, %rax
	je	.L149
	movl	$32, %ecx
	call	alloc_memory
	movl	%ebx, 24(%rax)
	testq	%rdi, %rdi
	je	.L140
	movq	%rdi, (%rax)
.L141:
	movq	%rsi, 16(%rax)
.L132:
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L149:
	leaq	.LC13(%rip), %rbp
	testq	%r9, %r9
	je	.L144
	leaq	.LC14(%rip), %r12
	movq	%rbp, %rsi
	jmp	.L135
	.p2align 4,,10
	.p2align 3
.L133:
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
.L135:
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
	jmp	.L132
	.p2align 4,,10
	.p2align 3
.L144:
	movq	%rbp, %r12
	movq	%rbp, %rsi
	jmp	.L135
	.p2align 4,,10
	.p2align 3
.L140:
	testq	%rbp, %rbp
	je	.L142
	movq	%rbp, 8(%rax)
	jmp	.L141
.L142:
	call	__getreent
	movl	$65, %r8d
	movl	$1, %edx
	leaq	.LC16(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L132
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC17:
	.ascii "Error creating primary: value is NULL\12\0"
	.align 8
.LC18:
	.ascii "Error creating primary: unknown type %d\12\0"
	.text
	.p2align 4
	.globl	create_primary
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.seh_proc	create_primary
create_primary:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movl	%ecx, %ebx
	movl	$16, %ecx
	movq	%rdx, %rsi
	movq	%r8, %rbp
	movq	%r9, %rdi
	call	alloc_memory
	movl	%ebx, 8(%rax)
	cmpl	$4, %ebx
	ja	.L151
	testq	%rsi, %rsi
	je	.L151
	movq	%rsi, (%rax)
.L150:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L151:
	cmpl	$5, %ebx
	jne	.L153
	testq	%rbp, %rbp
	je	.L153
	movq	%rbp, (%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L153:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	jbe	.L181
	cmpl	$8, %ebx
	jne	.L156
	cmpq	$0, 112(%rsp)
	je	.L156
	movq	112(%rsp), %rdi
.L180:
	movq	%rdi, (%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L181:
	testq	%rdi, %rdi
	jne	.L180
.L156:
	movq	112(%rsp), %rax
	movq	%rbp, %r8
	orq	%rdi, %rax
	orq	%rax, %r8
	orq	%r8, %rsi
	jne	.L157
	call	__getreent
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC17(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L150
	.p2align 4,,10
	.p2align 3
.L157:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC18(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L150
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC19:
	.ascii "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\12\0"
	.align 8
.LC20:
	.ascii "Error creating variable access: content is NULL\12\0"
	.align 8
.LC21:
	.ascii "Error creating variable access: unknown type %d\12\0"
	.text
	.p2align 4
	.globl	create_variable_access
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
	.seh_proc	create_variable_access
create_variable_access:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	testl	%ecx, %ecx
	movl	%ecx, %ebx
	movq	%rdx, %rsi
	movq	%r8, %rdi
	sete	%al
	testq	%rdx, %rdx
	movq	%r9, %rbp
	sete	%r12b
	cmpb	%al, %r12b
	jne	.L221
	movl	$24, %ecx
	call	alloc_memory
	testq	%rdi, %rdi
	movl	%ebx, 16(%rax)
	setne	%dl
	movq	%rsi, (%rax)
	testb	%r12b, %r12b
	je	.L187
	testb	%dl, %dl
	je	.L187
.L220:
	movq	%rdi, 8(%rax)
.L182:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L187:
	cmpl	$1, %ebx
	jne	.L189
	cmpq	$0, 112(%rsp)
	je	.L189
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
.L221:
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
	jmp	.L182
	.p2align 4,,10
	.p2align 3
.L189:
	cmpl	$3, %ebx
	jne	.L191
	testq	%rbp, %rbp
	je	.L191
	movq	%rbp, 8(%rax)
	jmp	.L182
	.p2align 4,,10
	.p2align 3
.L191:
	cmpl	$2, %ebx
	jne	.L192
	testb	%dl, %dl
	jne	.L220
.L192:
	movq	112(%rsp), %r9
	orq	%rbp, %r9
	orq	%r9, %rdi
	je	.L222
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC21(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L182
.L222:
	call	__getreent
	movl	$48, %r8d
	movl	$1, %edx
	leaq	.LC20(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L182
	.seh_endproc
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
