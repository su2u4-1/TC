	.file	"D:\\TC\\src\\create.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Error creating code member: content is NULL\12\0"
.LC1:
	.ascii "Error creating code member: unknown type %d\12\0"
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
	movl	$16, %ecx
	movq	%rdx, %rdi
	movq	%r8, %rbp
	movq	%r9, %rsi
	call	alloc_memory
	movl	%ebx, 8(%rax)
	testl	%ebx, %ebx
	jne	.L2
	testq	%rdi, %rdi
	je	.L2
	movq	%rdi, (%rax)
	jmp	.L1
.L2:
	cmpl	$1, %ebx
	jne	.L4
	testq	%rbp, %rbp
	je	.L4
	movq	%rbp, (%rax)
	jmp	.L1
.L4:
	cmpl	$2, %ebx
	jne	.L6
	testq	%rsi, %rsi
	je	.L6
	movq	%rsi, (%rax)
	jmp	.L1
.L6:
	orq	%rbp, %rsi
	orq	%rsi, %rdi
	jne	.L7
	call	__getreent
	leaq	.LC0(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	jmp	.L8
.L7:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC1(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L8:
	xorl	%eax, %eax
.L1:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
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
	jne	.L30
	call	__getreent
	leaq	.LC2(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L29
.L30:
	movl	$16, %ecx
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
.L29:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.section .rdata,"dr"
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
	movq	%rcx, %rsi
	movq	%rdx, %rbx
	movq	%r8, %rbp
	movq	%r9, %rdi
	testq	%rcx, %rcx
	je	.L36
	testq	%rdx, %rdx
	jne	.L33
.L36:
	call	__getreent
	leaq	.LC3(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L32
.L33:
	movl	$40, %ecx
	call	alloc_memory
	movq	112(%rsp), %rdx
	movq	%rsi, (%rax)
	movq	%rbx, 8(%rax)
	movq	%rbp, 16(%rax)
	movq	%rdi, 24(%rax)
	movq	%rdx, 32(%rax)
.L32:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
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
	movq	%rcx, %rsi
	movq	%rdx, %rbx
	movq	%r8, %rbp
	movq	%r9, %rdi
	testq	%rcx, %rcx
	je	.L41
	testq	%rdx, %rdx
	jne	.L38
.L41:
	call	__getreent
	leaq	.LC4(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L37
.L38:
	movl	$40, %ecx
	call	alloc_memory
	movq	112(%rsp), %rdx
	movq	%rsi, (%rax)
	movq	%rbx, 8(%rax)
	movq	%rbp, 16(%rax)
	movq	%rdi, 24(%rax)
	movq	%rdx, 32(%rax)
.L37:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC5:
	.ascii "Error creating class member: content is NULL\12\0"
.LC6:
	.ascii "Error creating class member: unknown type %d\12\0"
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
	movl	$16, %ecx
	movq	%rdx, %rsi
	movq	%r8, %rdi
	call	alloc_memory
	movl	%ebx, 8(%rax)
	testl	%ebx, %ebx
	jne	.L43
	testq	%rsi, %rsi
	je	.L43
	movq	%rsi, (%rax)
	jmp	.L42
.L43:
	cmpl	$1, %ebx
	jne	.L45
	testq	%rdi, %rdi
	je	.L45
	movq	%rdi, (%rax)
	jmp	.L42
.L45:
	orq	%rdi, %rsi
	jne	.L47
	call	__getreent
	leaq	.LC5(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	jmp	.L48
.L47:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC6(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L48:
	xorl	%eax, %eax
.L42:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.section .rdata,"dr"
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
	jne	.L62
	call	__getreent
	leaq	.LC7(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L61
.L62:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rdi, 8(%rax)
	movq	%rsi, 16(%rax)
.L61:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.section .rdata,"dr"
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
	movq	%rcx, %rsi
	movq	%rdx, %rbx
	movq	%r8, %rdi
	testq	%rcx, %rcx
	je	.L68
	testq	%rdx, %rdx
	jne	.L65
.L68:
	call	__getreent
	leaq	.LC8(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L64
.L65:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rbx, 8(%rax)
	movq	%rdi, 16(%rax)
.L64:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC9:
	.ascii "Error creating statement: content is NULL\12\0"
.LC10:
	.ascii "Error creating statement: unknown type %d\12\0"
	.text
	.globl	create_statement
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.seh_proc	create_statement
create_statement:
	pushq	%r13
	.seh_pushreg	%r13
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
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	128(%rsp), %r12
	movq	136(%rsp), %rbp
	movl	%ecx, %ebx
	movl	$16, %ecx
	movq	%rdx, %rsi
	movq	%r8, %r13
	movq	%r9, %rdi
	call	alloc_memory
	testq	%r12, %r12
	movl	%ebx, 8(%rax)
	setne	%dl
	testl	%ebx, %ebx
	jne	.L70
	testb	%dl, %dl
	jne	.L117
.L70:
	cmpl	$1, %ebx
	jne	.L72
	testq	%rbp, %rbp
	je	.L72
	movq	%rbp, (%rax)
	jmp	.L69
.L72:
	cmpl	$2, %ebx
	jne	.L74
	testq	%rsi, %rsi
	je	.L74
	movq	%rsi, (%rax)
	jmp	.L69
.L74:
	cmpl	$3, %ebx
	jne	.L75
	testq	%r13, %r13
	je	.L75
	movq	%r13, (%rax)
	jmp	.L69
.L75:
	cmpl	$4, %ebx
	jne	.L76
	testq	%rdi, %rdi
	je	.L76
	movq	%rdi, (%rax)
	jmp	.L69
.L76:
	cmpl	$5, %ebx
	jne	.L77
	testb	%dl, %dl
	je	.L77
.L117:
	movq	%r12, (%rax)
	jmp	.L69
.L77:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L78
	xorl	%edx, %edx
	movq	%rdx, (%rax)
	jmp	.L69
.L78:
	orq	%r13, %rdi
	orq	%rdi, %rsi
	orq	%rsi, %rbp
	orq	%rbp, %r12
	jne	.L79
	call	__getreent
	leaq	.LC9(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	jmp	.L80
.L79:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC10(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L80:
	xorl	%eax, %eax
.L69:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.seh_endproc
	.section .rdata,"dr"
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
	jne	.L119
	call	__getreent
	leaq	.LC11(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L118
.L119:
	movl	$32, %ecx
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
	movq	%rdi, 16(%rax)
	movq	%rsi, 24(%rax)
.L118:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
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
	jne	.L122
	call	__getreent
	leaq	.LC12(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L121
.L122:
	movl	$16, %ecx
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
.L121:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
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
.LC15:
	.ascii "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\12\0"
.LC16:
	.ascii "Error creating expression: both expr_left and prim_left are NULL\12\0"
	.text
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
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	cmpl	$19, %ecx
	movq	%rdx, %rsi
	movl	%ecx, %r12d
	movq	%r8, %rbp
	sete	%dl
	testq	%r9, %r9
	movq	%r9, %rdi
	sete	%al
	cmpb	%al, %dl
	jne	.L127
	movq	%r8, %rax
	orq	%rsi, %rax
	jne	.L144
	jmp	.L145
.L127:
	leaq	.LC14(%rip), %rbx
	leaq	.LC13(%rip), %rax
	testq	%r9, %r9
	movq	%rbx, %rdi
	cmove	%rax, %rdi
	testq	%r8, %r8
	cmove	%rax, %rbx
.L131:
	testq	%rsi, %rsi
	leaq	.LC14(%rip), %r9
	leaq	.LC13(%rip), %rax
	cmove	%rax, %r9
	jmp	.L132
.L145:
	testq	%r9, %r9
	jne	.L146
	leaq	.LC13(%rip), %rdi
	movq	%rdi, %rbx
	movq	%rdi, %r9
.L132:
	cmpl	$19, %r12d
	leaq	.LC13(%rip), %rax
	movq	%r9, 56(%rsp)
	leaq	.LC14(%rip), %r8
	cmove	%rax, %r8
	movq	%r8, 48(%rsp)
	call	__getreent
	movq	56(%rsp), %r9
	movq	48(%rsp), %r8
	leaq	.LC15(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rdi, 40(%rsp)
	movq	%rbx, 32(%rsp)
	call	fprintf
	jmp	.L134
.L144:
	movl	$32, %ecx
	call	alloc_memory
	movl	%r12d, 24(%rax)
	testq	%rsi, %rsi
	je	.L135
	movq	%rsi, (%rax)
	jmp	.L136
.L135:
	testq	%rbp, %rbp
	je	.L137
	movq	%rbp, 8(%rax)
	jmp	.L136
.L137:
	call	__getreent
	leaq	.LC16(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
.L134:
	xorl	%eax, %eax
	jmp	.L126
.L136:
	movq	%rdi, 16(%rax)
	jmp	.L126
.L146:
	leaq	.LC14(%rip), %rdi
	leaq	.LC13(%rip), %rbx
	jmp	.L131
.L126:
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC17:
	.ascii "Error creating primary: value is NULL\12\0"
.LC18:
	.ascii "Error creating primary: unknown type %d\12\0"
	.text
	.globl	create_primary
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.seh_proc	create_primary
create_primary:
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
	movq	112(%rsp), %rbp
	movl	%ecx, %ebx
	movl	$16, %ecx
	movq	%rdx, %rdi
	movq	%r8, %rsi
	movq	%r9, %r12
	call	alloc_memory
	movl	%ebx, 8(%rax)
	cmpl	$4, %ebx
	ja	.L148
	testq	%rdi, %rdi
	je	.L148
	movq	%rdi, (%rax)
	jmp	.L147
.L148:
	cmpl	$5, %ebx
	jne	.L150
	testq	%rsi, %rsi
	je	.L150
	movq	%rsi, (%rax)
	jmp	.L147
.L150:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L152
	testq	%r12, %r12
	je	.L152
	movq	%r12, (%rax)
	jmp	.L147
.L152:
	cmpl	$8, %ebx
	jne	.L153
	testq	%rbp, %rbp
	je	.L153
	movq	%rbp, (%rax)
	jmp	.L147
.L153:
	orq	%r12, %rbp
	orq	%rbp, %rsi
	orq	%rdi, %rsi
	jne	.L154
	call	__getreent
	leaq	.LC17(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	jmp	.L155
.L154:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC18(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L155:
	xorl	%eax, %eax
.L147:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC19:
	.ascii "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\12\0"
.LC20:
	.ascii "Error creating variable access: content is NULL\12\0"
.LC21:
	.ascii "Error creating variable access: unknown type %d\12\0"
	.text
	.globl	create_variable_access
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
	.seh_proc	create_variable_access
create_variable_access:
	pushq	%r13
	.seh_pushreg	%r13
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
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	144(%rsp), %r12
	testl	%ecx, %ecx
	movl	%ecx, %ebx
	movq	%rdx, %rbp
	movq	%r8, %rdi
	sete	%al
	testq	%rdx, %rdx
	movq	%r9, %rsi
	sete	%r13b
	cmpb	%al, %r13b
	je	.L181
	leaq	.LC13(%rip), %rax
	testl	%ecx, %ecx
	leaq	.LC14(%rip), %r8
	movq	%rax, %r9
	cmovne	%r8, %r9
	testq	%rdx, %rdx
	cmove	%rax, %r8
	movq	%r9, 40(%rsp)
	movq	%r8, 32(%rsp)
	call	__getreent
	movq	40(%rsp), %r9
	movq	32(%rsp), %r8
	leaq	.LC19(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L184
.L181:
	movl	$24, %ecx
	call	alloc_memory
	testq	%rdi, %rdi
	movl	%ebx, 16(%rax)
	setne	%dl
	movq	%rbp, (%rax)
	testb	%r13b, %r13b
	je	.L185
	testb	%dl, %dl
	jne	.L218
.L185:
	cmpl	$1, %ebx
	jne	.L187
	testq	%r12, %r12
	je	.L187
	movq	%r12, 8(%rax)
	jmp	.L180
.L187:
	cmpl	$3, %ebx
	jne	.L189
	testq	%rsi, %rsi
	je	.L189
	movq	%rsi, 8(%rax)
	jmp	.L180
.L189:
	cmpl	$2, %ebx
	jne	.L190
	testb	%dl, %dl
	je	.L190
.L218:
	movq	%rdi, 8(%rax)
	jmp	.L180
.L190:
	orq	%r12, %rsi
	orq	%rsi, %rdi
	jne	.L191
	call	__getreent
	leaq	.LC20(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	jmp	.L184
.L191:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC21(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L184:
	xorl	%eax, %eax
.L180:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
