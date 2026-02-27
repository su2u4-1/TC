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
	movq	%rdx, %rsi
	movq	%r8, %rdi
	movq	%r9, %rbp
	movl	$16, %ecx
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
.L2:
	cmpl	$1, %ebx
	jne	.L4
	testq	%rdi, %rdi
	je	.L4
	movq	%rdi, (%rax)
	jmp	.L1
.L4:
	cmpl	$2, %ebx
	jne	.L5
	testq	%rbp, %rbp
	je	.L5
	movq	%rbp, (%rax)
	jmp	.L1
.L5:
	movq	%rbp, %r9
	orq	%rdi, %r9
	orq	%rsi, %r9
	je	.L7
	call	__getreent
	movq	24(%rax), %rcx
	movl	%ebx, %r8d
	leaq	.LC1(%rip), %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1
.L7:
	call	__getreent
	movq	24(%rax), %r9
	movl	$44, %r8d
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L1
	.seh_endproc
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
	movq	%rdx, %rbx
	movl	$16, %ecx
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
	je	.L12
	movl	$16, %ecx
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
.L9:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L12:
	call	__getreent
	movq	24(%rax), %r9
	movl	$36, %r8d
	movl	$1, %edx
	leaq	.LC2(%rip), %rcx
	call	fwrite
	movq	%rbx, %rax
	jmp	.L9
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC3:
	.ascii "Error creating function: name or return_type is NULL\12\0"
	.text
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
	je	.L17
	testq	%rdx, %rdx
	je	.L17
	movl	$40, %ecx
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
	movq	%rbp, 16(%rax)
	movq	%rdi, 24(%rax)
	movq	112(%rsp), %rdx
	movq	%rdx, 32(%rax)
.L13:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L17:
	call	__getreent
	movq	24(%rax), %r9
	movl	$53, %r8d
	movl	$1, %edx
	leaq	.LC3(%rip), %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L13
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "Error creating method: name or return_type is NULL\12\0"
	.text
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
	je	.L22
	testq	%rdx, %rdx
	je	.L22
	movl	$40, %ecx
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
	movq	%rbp, 16(%rax)
	movq	%rdi, 24(%rax)
	movq	112(%rsp), %rdx
	movq	%rdx, 32(%rax)
.L18:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L22:
	call	__getreent
	movq	24(%rax), %r9
	movl	$51, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L18
	.seh_endproc
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
	movq	%rdx, %rsi
	movq	%r8, %rdi
	movl	$16, %ecx
	call	alloc_memory
	movl	%ebx, 8(%rax)
	testl	%ebx, %ebx
	jne	.L24
	testq	%rsi, %rsi
	je	.L24
	movq	%rsi, (%rax)
.L23:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L24:
	cmpl	$1, %ebx
	jne	.L26
	testq	%rdi, %rdi
	je	.L26
	movq	%rdi, (%rax)
	jmp	.L23
.L26:
	orq	%rsi, %rdi
	jne	.L27
	call	__getreent
	movq	24(%rax), %r9
	movl	$45, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L23
.L27:
	call	__getreent
	movq	24(%rax), %rcx
	movl	%ebx, %r8d
	leaq	.LC6(%rip), %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L23
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC7:
	.ascii "Error creating class: name is NULL\12\0"
	.text
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
	je	.L31
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rdi, 8(%rax)
	movq	%rsi, 16(%rax)
.L28:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L31:
	call	__getreent
	movq	24(%rax), %r9
	movl	$35, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rcx
	call	fwrite
	movq	%rbx, %rax
	jmp	.L28
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC8:
	.ascii "Error creating variable: type or name is NULL\12\0"
	.text
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
	je	.L36
	testq	%rdx, %rdx
	je	.L36
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
	movq	%rdi, 16(%rax)
.L32:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L36:
	call	__getreent
	movq	24(%rax), %r9
	movl	$46, %r8d
	movl	$1, %edx
	leaq	.LC8(%rip), %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L32
	.seh_endproc
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
	movl	%ecx, %ebx
	movq	%rdx, %rsi
	movq	%r8, %r12
	movq	%r9, %rdi
	movq	112(%rsp), %rbp
	movl	$16, %ecx
	call	alloc_memory
	movl	%ebx, 8(%rax)
	testq	%rbp, %rbp
	setne	%dl
	testl	%ebx, %ebx
	jne	.L38
	testb	%dl, %dl
	je	.L38
	movq	%rbp, (%rax)
.L37:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L38:
	cmpl	$1, %ebx
	jne	.L40
	cmpq	$0, 120(%rsp)
	je	.L40
	movq	120(%rsp), %rdi
	movq	%rdi, (%rax)
	jmp	.L37
.L40:
	cmpl	$2, %ebx
	jne	.L41
	testq	%rsi, %rsi
	je	.L41
	movq	%rsi, (%rax)
	jmp	.L37
.L41:
	cmpl	$3, %ebx
	jne	.L42
	testq	%r12, %r12
	je	.L42
	movq	%r12, (%rax)
	jmp	.L37
.L42:
	cmpl	$4, %ebx
	jne	.L43
	testq	%rdi, %rdi
	je	.L43
	movq	%rdi, (%rax)
	jmp	.L37
.L43:
	cmpl	$5, %ebx
	jne	.L44
	testb	%dl, %dl
	je	.L44
	movq	%rbp, (%rax)
	jmp	.L37
.L44:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L45
	movq	$0, (%rax)
	jmp	.L37
.L45:
	orq	%r12, %rdi
	orq	%rdi, %rsi
	movq	%rsi, %rax
	orq	120(%rsp), %rax
	orq	%rbp, %rax
	je	.L47
	call	__getreent
	movq	24(%rax), %rcx
	movl	%ebx, %r8d
	leaq	.LC10(%rip), %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L37
.L47:
	call	__getreent
	movq	24(%rax), %r9
	movl	$42, %r8d
	movl	$1, %edx
	leaq	.LC9(%rip), %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L37
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC11:
	.ascii "Error creating if statement: condition is NULL\12\0"
	.text
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
	je	.L51
	movl	$32, %ecx
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
	movq	%rdi, 16(%rax)
	movq	%rsi, 24(%rax)
.L48:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L51:
	call	__getreent
	movq	24(%rax), %r9
	movl	$47, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rcx
	call	fwrite
	movq	%rbx, %rax
	jmp	.L48
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC12:
	.ascii "Error creating else-if statement: condition is NULL\12\0"
	.text
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
	je	.L55
	movl	$16, %ecx
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
.L52:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L55:
	call	__getreent
	movq	24(%rax), %r9
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC12(%rip), %rcx
	call	fwrite
	movq	%rbx, %rax
	jmp	.L52
	.seh_endproc
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
	movq	%rdx, %rdi
	movq	%r8, %rsi
	movq	%r9, %rbx
	movl	$32, %ecx
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
	movq	%rdx, %rbx
	movl	$16, %ecx
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
	.globl	create_expression
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.seh_proc	create_expression
create_expression:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movl	%ecx, %ebx
	movq	%rdx, %rsi
	movq	%r8, %rbp
	movq	%r9, %rdi
	cmpl	$19, %ecx
	sete	%dl
	testq	%r9, %r9
	sete	%al
	cmpb	%al, %dl
	jne	.L59
	movq	%r8, %rax
	orq	%rsi, %rax
	je	.L76
	movl	$32, %ecx
	call	alloc_memory
	movl	%ebx, 24(%rax)
	testq	%rsi, %rsi
	je	.L67
	movq	%rsi, (%rax)
.L68:
	movq	%rdi, 16(%rax)
	jmp	.L58
.L59:
	testq	%r9, %r9
	leaq	.LC13(%rip), %rdi
	leaq	.LC14(%rip), %rax
	cmovne	%rax, %rdi
	testq	%r8, %r8
	movq	%rax, %rbp
	leaq	.LC13(%rip), %rax
	cmove	%rax, %rbp
.L63:
	testq	%rsi, %rsi
	leaq	.LC14(%rip), %rsi
	leaq	.LC13(%rip), %rax
	cmove	%rax, %rsi
.L64:
	cmpl	$19, %ebx
	leaq	.LC14(%rip), %rbx
	leaq	.LC13(%rip), %rax
	cmove	%rax, %rbx
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rdi, 40(%rsp)
	movq	%rbp, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC15(%rip), %rdx
	call	fprintf
	movl	$0, %eax
.L58:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L74:
	leaq	.LC13(%rip), %rdi
	movq	%rdi, %rbp
	movq	%rdi, %rsi
	jmp	.L64
.L67:
	testq	%rbp, %rbp
	je	.L69
	movq	%rbp, 8(%rax)
	jmp	.L68
.L69:
	call	__getreent
	movq	24(%rax), %r9
	movl	$65, %r8d
	movl	$1, %edx
	leaq	.LC16(%rip), %rcx
	call	fwrite
	movq	%rbp, %rax
	jmp	.L58
.L76:
	testq	%r9, %r9
	je	.L74
	leaq	.LC14(%rip), %rdi
	leaq	.LC13(%rip), %rbp
	jmp	.L63
	.seh_endproc
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
	movq	%rdx, %rsi
	movq	%r8, %rbp
	movq	%r9, %rdi
	movl	$16, %ecx
	call	alloc_memory
	movl	%ebx, 8(%rax)
	cmpl	$4, %ebx
	ja	.L78
	testq	%rsi, %rsi
	je	.L78
	movq	%rsi, (%rax)
.L77:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L78:
	cmpl	$5, %ebx
	jne	.L80
	testq	%rbp, %rbp
	je	.L80
	movq	%rbp, (%rax)
	jmp	.L77
.L80:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L81
	testq	%rdi, %rdi
	jne	.L84
.L81:
	cmpl	$8, %ebx
	jne	.L82
	cmpq	$0, 112(%rsp)
	je	.L82
	movq	112(%rsp), %rdi
	movq	%rdi, (%rax)
	jmp	.L77
.L84:
	movq	%rdi, (%rax)
	jmp	.L77
.L82:
	movq	%rdi, %rax
	orq	112(%rsp), %rax
	movq	%rbp, %r8
	orq	%rax, %r8
	orq	%rsi, %r8
	jne	.L83
	call	__getreent
	movq	24(%rax), %r9
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC17(%rip), %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L77
.L83:
	call	__getreent
	movq	24(%rax), %rcx
	movl	%ebx, %r8d
	leaq	.LC18(%rip), %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L77
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
	.ascii "Error creating variable access: unknown type %u\12\0"
	.text
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
	movl	%ecx, %ebx
	movq	%rdx, %rsi
	movq	%r8, %rbp
	movq	%r9, %rdi
	testl	%ecx, %ecx
	sete	%r12b
	testq	%rdx, %rdx
	sete	%al
	cmpb	%r12b, %al
	jne	.L97
	movl	$24, %ecx
	call	alloc_memory
	movl	%ebx, 16(%rax)
	movq	%rsi, (%rax)
	testq	%rbp, %rbp
	setne	%dl
	testb	%r12b, %r12b
	je	.L90
	testb	%dl, %dl
	je	.L90
	movq	%rbp, 8(%rax)
	jmp	.L85
.L97:
	testl	%ecx, %ecx
	leaq	.LC14(%rip), %rdi
	leaq	.LC13(%rip), %rax
	cmove	%rax, %rdi
	testq	%rdx, %rdx
	leaq	.LC14(%rip), %rbx
	cmove	%rax, %rbx
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rdi, %r9
	movq	%rbx, %r8
	leaq	.LC19(%rip), %rdx
	call	fprintf
	movl	$0, %eax
.L85:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L90:
	cmpl	$1, %ebx
	jne	.L91
	cmpq	$0, 112(%rsp)
	je	.L91
	movq	112(%rsp), %rdi
	movq	%rdi, 8(%rax)
	jmp	.L85
.L91:
	cmpl	$3, %ebx
	jne	.L92
	testq	%rdi, %rdi
	je	.L92
	movq	%rdi, 8(%rax)
	jmp	.L85
.L92:
	cmpl	$2, %ebx
	jne	.L93
	testb	%dl, %dl
	je	.L93
	movq	%rbp, 8(%rax)
	jmp	.L85
.L93:
	orq	112(%rsp), %rdi
	movq	%rdi, %r9
	orq	%rbp, %r9
	je	.L98
	call	__getreent
	movq	24(%rax), %rcx
	movl	%ebx, %r8d
	leaq	.LC21(%rip), %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L85
.L98:
	call	__getreent
	movq	24(%rax), %r9
	movl	$48, %r8d
	movl	$1, %edx
	leaq	.LC20(%rip), %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L85
	.seh_endproc
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
