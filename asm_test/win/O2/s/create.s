	.file	"create.c"
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
	.globl	create_function_use_ptr
	.def	create_function_use_ptr;	.scl	2;	.type	32;	.endef
create_function_use_ptr:
	subq	$40, %rsp
	testq	%rdx, %rdx
	je	.L41
	testq	%r8, %r8
	je	.L41
	movq	80(%rsp), %rax
	movq	%rdx, (%rcx)
	movq	%r8, 8(%rcx)
	movq	%rax, 24(%rcx)
	movq	88(%rsp), %rax
	movq	%r9, 16(%rcx)
	movq	%rax, 32(%rcx)
	movq	%rcx, %rax
.L37:
	addq	$40, %rsp
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
	xorl	%eax, %eax
	jmp	.L37
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
	.globl	create_method_use_ptr
	.def	create_method_use_ptr;	.scl	2;	.type	32;	.endef
create_method_use_ptr:
	subq	$40, %rsp
	testq	%rdx, %rdx
	je	.L53
	testq	%r8, %r8
	je	.L53
	movq	80(%rsp), %rax
	movq	%rdx, (%rcx)
	movq	%r8, 8(%rcx)
	movq	%rax, 24(%rcx)
	movq	88(%rsp), %rax
	movq	%r9, 16(%rcx)
	movq	%rax, 32(%rcx)
	movq	%rcx, %rax
.L49:
	addq	$40, %rsp
	ret
	.p2align 4,,10
	.p2align 3
.L53:
	call	__getreent
	movl	$51, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L49
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
	je	.L59
	movq	%rdx, %rsi
	testq	%rdx, %rdx
	je	.L59
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
.L59:
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
	jne	.L62
	testq	%rsi, %rsi
	je	.L62
	movq	%rsi, (%rax)
.L61:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L62:
	cmpl	$1, %ebx
	jne	.L64
	testq	%rdi, %rdi
	je	.L64
	movq	%rdi, (%rax)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L64:
	orq	%rdi, %rsi
	jne	.L66
	call	__getreent
	movl	$45, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L66:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC6(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L61
	.section .rdata,"dr"
	.align 8
.LC7:
	.ascii "Error creating class: name is NULL\12\0"
	.text
	.p2align 4
	.globl	create_class_use_ptr
	.def	create_class_use_ptr;	.scl	2;	.type	32;	.endef
create_class_use_ptr:
	subq	$40, %rsp
	testq	%rdx, %rdx
	je	.L85
	movq	80(%rsp), %rax
	movq	%rdx, (%rcx)
	movq	%r8, 8(%rcx)
	movq	%r9, 16(%rcx)
	movq	%rax, 24(%rcx)
	movq	%rcx, %rax
.L81:
	addq	$40, %rsp
	ret
	.p2align 4,,10
	.p2align 3
.L85:
	call	__getreent
	movl	$35, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L81
	.p2align 4
	.globl	create_class
	.def	create_class;	.scl	2;	.type	32;	.endef
create_class:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	testq	%rcx, %rcx
	je	.L90
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
.L86:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L90:
	call	__getreent
	movl	$35, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L86
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
	je	.L95
	movq	%rdx, %rsi
	testq	%rdx, %rdx
	je	.L95
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
.L95:
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
	pushq	%rbp
	movq	%r8, %rbp
	pushq	%rdi
	movq	%r9, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movl	%ecx, %ebx
	movl	$16, %ecx
	subq	$32, %rsp
	movq	112(%rsp), %r12
	call	alloc_memory
	movl	%ebx, 8(%rax)
	testl	%ebx, %ebx
	jne	.L98
	testq	%r12, %r12
	je	.L98
.L140:
	movq	%r12, (%rax)
.L97:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L98:
	cmpl	$1, %ebx
	jne	.L100
	cmpq	$0, 120(%rsp)
	je	.L100
	movq	120(%rsp), %rdi
	movq	%rdi, (%rax)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L100:
	cmpl	$2, %ebx
	jne	.L102
	testq	%rsi, %rsi
	je	.L102
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
.L102:
	cmpl	$3, %ebx
	jne	.L103
	testq	%rbp, %rbp
	je	.L103
	movq	%rbp, (%rax)
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L103:
	cmpl	$4, %ebx
	jne	.L104
	testq	%rdi, %rdi
	je	.L104
	movq	%rdi, (%rax)
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L104:
	cmpl	$5, %ebx
	je	.L140
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L106
	movq	$0, (%rax)
	jmp	.L97
.L106:
	orq	%rbp, %rdi
	movq	120(%rsp), %rax
	orq	%rdi, %rsi
	orq	%rsi, %rax
	orq	%r12, %rax
	je	.L141
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC10(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L97
.L141:
	call	__getreent
	movl	$42, %r8d
	movl	$1, %edx
	leaq	.LC9(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L97
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
	je	.L146
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
.L142:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L146:
	call	__getreent
	movl	$47, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L142
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
	je	.L151
	movq	%rcx, %rbx
	movl	$16, %ecx
	movq	%rdx, %rsi
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
.L147:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
	.p2align 3
.L151:
	call	__getreent
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC12(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L147
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
	.ascii "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\12\0"
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
	jne	.L157
	movq	%r8, %rax
	orq	%rdi, %rax
	je	.L174
	movl	$32, %ecx
	call	alloc_memory
	movl	%ebx, 24(%rax)
	testq	%rdi, %rdi
	je	.L164
	movq	%rdi, (%rax)
.L165:
	movq	%rsi, 16(%rax)
.L156:
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L174:
	leaq	.LC13(%rip), %rbp
	testq	%r9, %r9
	je	.L168
	leaq	.LC14(%rip), %r12
	movq	%rbp, %rsi
	jmp	.L159
	.p2align 4,,10
	.p2align 3
.L157:
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
.L159:
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
	jmp	.L156
	.p2align 4,,10
	.p2align 3
.L168:
	movq	%rbp, %r12
	movq	%rbp, %rsi
	jmp	.L159
	.p2align 4,,10
	.p2align 3
.L164:
	testq	%rbp, %rbp
	je	.L166
	movq	%rbp, 8(%rax)
	jmp	.L165
.L166:
	call	__getreent
	movl	$65, %r8d
	movl	$1, %edx
	leaq	.LC16(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L156
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
	ja	.L176
	testq	%rsi, %rsi
	je	.L176
	movq	%rsi, (%rax)
.L175:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L176:
	cmpl	$5, %ebx
	jne	.L178
	testq	%rbp, %rbp
	je	.L178
	movq	%rbp, (%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L178:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	jbe	.L207
	cmpl	$8, %ebx
	jne	.L181
	cmpq	$0, 112(%rsp)
	je	.L181
	movq	112(%rsp), %rdi
.L206:
	movq	%rdi, (%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L207:
	testq	%rdi, %rdi
	jne	.L206
.L181:
	movq	112(%rsp), %rax
	movq	%rbp, %r8
	orq	%rdi, %rax
	orq	%rax, %r8
	orq	%r8, %rsi
	jne	.L182
	call	__getreent
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC17(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L175
	.p2align 4,,10
	.p2align 3
.L182:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC18(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L175
	.section .rdata,"dr"
	.align 8
.LC19:
	.ascii "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\12\0"
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
	jne	.L248
	movq	%r8, %rdi
	movl	$24, %ecx
	movq	%r9, %rbp
	call	alloc_memory
	testq	%rdi, %rdi
	movl	%ebx, 16(%rax)
	setne	%dl
	movq	%rsi, (%rax)
	testb	%r12b, %r12b
	je	.L213
	testb	%dl, %dl
	je	.L213
.L247:
	movq	%rdi, 8(%rax)
.L208:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L213:
	cmpl	$1, %ebx
	jne	.L215
	cmpq	$0, 112(%rsp)
	je	.L215
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
.L248:
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
	jmp	.L208
	.p2align 4,,10
	.p2align 3
.L215:
	cmpl	$3, %ebx
	jne	.L217
	testq	%rbp, %rbp
	je	.L217
	movq	%rbp, 8(%rax)
	jmp	.L208
	.p2align 4,,10
	.p2align 3
.L217:
	cmpl	$2, %ebx
	jne	.L218
	testb	%dl, %dl
	jne	.L247
.L218:
	movq	112(%rsp), %r9
	orq	%rbp, %r9
	orq	%r9, %rdi
	je	.L249
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC21(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L208
.L249:
	call	__getreent
	movl	$48, %r8d
	movl	$1, %edx
	leaq	.LC20(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L208
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
