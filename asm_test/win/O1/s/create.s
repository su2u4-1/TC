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
	.globl	create_code_member
	.def	create_code_member;	.scl	2;	.type	32;	.endef
create_code_member:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
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
	je	.L8
	call	__getreent
	movq	24(%rax), %rcx
	movl	%ebx, %r8d
	leaq	.LC1(%rip), %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1
.L8:
	call	__getreent
	movq	24(%rax), %r9
	movl	$44, %r8d
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L1
	.globl	create_code
	.def	create_code;	.scl	2;	.type	32;	.endef
create_code:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
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
	.section .rdata,"dr"
	.align 8
.LC2:
	.ascii "Error creating import: name is NULL\12\0"
	.text
	.globl	create_import
	.def	create_import;	.scl	2;	.type	32;	.endef
create_import:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rbx
	testq	%rcx, %rcx
	je	.L15
	movq	%rdx, %rsi
	movl	$16, %ecx
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
.L11:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L15:
	call	__getreent
	movq	24(%rax), %r9
	movl	$36, %r8d
	movl	$1, %edx
	leaq	.LC2(%rip), %rcx
	call	fwrite
	movq	%rbx, %rax
	jmp	.L11
	.section .rdata,"dr"
	.align 8
.LC3:
	.ascii "Error creating function: name or return_type is NULL\12\0"
	.text
	.globl	create_function_use_ptr
	.def	create_function_use_ptr;	.scl	2;	.type	32;	.endef
create_function_use_ptr:
	subq	$40, %rsp
	testq	%rdx, %rdx
	je	.L20
	testq	%r8, %r8
	je	.L20
	movq	%rdx, (%rcx)
	movq	%r8, 8(%rcx)
	movq	%r9, 16(%rcx)
	movq	80(%rsp), %rax
	movq	%rax, 24(%rcx)
	movq	88(%rsp), %rax
	movq	%rax, 32(%rcx)
	movq	%rcx, %rax
.L16:
	addq	$40, %rsp
	ret
.L20:
	call	__getreent
	movq	24(%rax), %r9
	movl	$53, %r8d
	movl	$1, %edx
	leaq	.LC3(%rip), %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L16
	.globl	create_function
	.def	create_function;	.scl	2;	.type	32;	.endef
create_function:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	testq	%rcx, %rcx
	je	.L26
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	movq	%r8, %rdi
	movq	%r9, %rbp
	testq	%rdx, %rdx
	je	.L26
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, %rcx
	movq	128(%rsp), %rax
	movq	%rax, 40(%rsp)
	movq	%rbp, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	movq	%rbx, %rdx
	call	create_function_use_ptr
.L22:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L26:
	call	__getreent
	movq	24(%rax), %r9
	movl	$53, %r8d
	movl	$1, %edx
	leaq	.LC3(%rip), %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L22
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "Error creating method: name or return_type is NULL\12\0"
	.text
	.globl	create_method_use_ptr
	.def	create_method_use_ptr;	.scl	2;	.type	32;	.endef
create_method_use_ptr:
	subq	$40, %rsp
	testq	%rdx, %rdx
	je	.L32
	testq	%r8, %r8
	je	.L32
	movq	%rdx, (%rcx)
	movq	%r8, 8(%rcx)
	movq	%r9, 16(%rcx)
	movq	80(%rsp), %rax
	movq	%rax, 24(%rcx)
	movq	88(%rsp), %rax
	movq	%rax, 32(%rcx)
	movq	%rcx, %rax
.L28:
	addq	$40, %rsp
	ret
.L32:
	call	__getreent
	movq	24(%rax), %r9
	movl	$51, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L28
	.globl	create_method
	.def	create_method;	.scl	2;	.type	32;	.endef
create_method:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	testq	%rcx, %rcx
	je	.L38
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	movq	%r8, %rdi
	movq	%r9, %rbp
	testq	%rdx, %rdx
	je	.L38
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, %rcx
	movq	128(%rsp), %rax
	movq	%rax, 40(%rsp)
	movq	%rbp, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	movq	%rbx, %rdx
	call	create_method_use_ptr
.L34:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L38:
	call	__getreent
	movq	24(%rax), %r9
	movl	$51, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L34
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
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movl	%ecx, %ebx
	movq	%rdx, %rsi
	movq	%r8, %rdi
	movl	$16, %ecx
	call	alloc_memory
	movl	%ebx, 8(%rax)
	testl	%ebx, %ebx
	jne	.L41
	testq	%rsi, %rsi
	je	.L41
	movq	%rsi, (%rax)
.L40:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L41:
	cmpl	$1, %ebx
	jne	.L43
	testq	%rdi, %rdi
	je	.L43
	movq	%rdi, (%rax)
	jmp	.L40
.L43:
	orq	%rsi, %rdi
	jne	.L44
	call	__getreent
	movq	24(%rax), %r9
	movl	$45, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L40
.L44:
	call	__getreent
	movq	24(%rax), %rcx
	movl	%ebx, %r8d
	leaq	.LC6(%rip), %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L40
	.section .rdata,"dr"
	.align 8
.LC7:
	.ascii "Error creating class: name is NULL\12\0"
	.text
	.globl	create_class_use_ptr
	.def	create_class_use_ptr;	.scl	2;	.type	32;	.endef
create_class_use_ptr:
	pushq	%rbx
	subq	$32, %rsp
	movq	%rdx, %rbx
	testq	%rdx, %rdx
	je	.L50
	movq	%rdx, (%rcx)
	movq	%r8, 8(%rcx)
	movq	%r9, 16(%rcx)
	movq	80(%rsp), %rax
	movq	%rax, 24(%rcx)
	movq	%rcx, %rax
.L46:
	addq	$32, %rsp
	popq	%rbx
	ret
.L50:
	call	__getreent
	movq	24(%rax), %r9
	movl	$35, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rcx
	call	fwrite
	movq	%rbx, %rax
	jmp	.L46
	.globl	create_class
	.def	create_class;	.scl	2;	.type	32;	.endef
create_class:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	movq	%rcx, %rbx
	testq	%rcx, %rcx
	je	.L55
	movq	%rdx, %rsi
	movq	%r8, %rdi
	movq	%r9, %rbp
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, %rcx
	movq	%rbp, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	movq	%rbx, %rdx
	call	create_class_use_ptr
.L51:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L55:
	call	__getreent
	movq	24(%rax), %r9
	movl	$35, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rcx
	call	fwrite
	movq	%rbx, %rax
	jmp	.L51
	.section .rdata,"dr"
	.align 8
.LC8:
	.ascii "Error creating variable: type or name is NULL\12\0"
	.text
	.globl	create_variable
	.def	create_variable;	.scl	2;	.type	32;	.endef
create_variable:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	testq	%rcx, %rcx
	je	.L60
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	movq	%r8, %rdi
	testq	%rdx, %rdx
	je	.L60
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
	movq	%rdi, 16(%rax)
.L56:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L60:
	call	__getreent
	movq	24(%rax), %r9
	movl	$46, %r8d
	movl	$1, %edx
	leaq	.LC8(%rip), %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L56
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
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movl	%ecx, %ebx
	movq	%rdx, %rsi
	movq	%r8, %rbp
	movq	%r9, %rdi
	movq	112(%rsp), %r12
	movl	$16, %ecx
	call	alloc_memory
	movl	%ebx, 8(%rax)
	testl	%ebx, %ebx
	jne	.L63
	testq	%r12, %r12
	je	.L63
	movq	%r12, (%rax)
.L62:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L63:
	cmpl	$1, %ebx
	jne	.L65
	cmpq	$0, 120(%rsp)
	je	.L65
	movq	120(%rsp), %rdi
	movq	%rdi, (%rax)
	jmp	.L62
.L65:
	cmpl	$2, %ebx
	jne	.L66
	testq	%rsi, %rsi
	je	.L66
	movq	%rsi, (%rax)
	jmp	.L62
.L66:
	cmpl	$3, %ebx
	jne	.L67
	testq	%rbp, %rbp
	je	.L67
	movq	%rbp, (%rax)
	jmp	.L62
.L67:
	cmpl	$4, %ebx
	jne	.L68
	testq	%rdi, %rdi
	je	.L68
	movq	%rdi, (%rax)
	jmp	.L62
.L68:
	cmpl	$5, %ebx
	je	.L73
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L70
	movq	$0, (%rax)
	jmp	.L62
.L73:
	movq	%r12, (%rax)
	jmp	.L62
.L70:
	orq	%rbp, %rdi
	orq	%rdi, %rsi
	movq	%rsi, %rax
	orq	120(%rsp), %rax
	orq	%r12, %rax
	je	.L74
	call	__getreent
	movq	24(%rax), %rcx
	movl	%ebx, %r8d
	leaq	.LC10(%rip), %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L62
.L74:
	call	__getreent
	movq	24(%rax), %r9
	movl	$42, %r8d
	movl	$1, %edx
	leaq	.LC9(%rip), %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L62
	.section .rdata,"dr"
	.align 8
.LC11:
	.ascii "Error creating if statement: condition is NULL\12\0"
	.text
	.globl	create_if
	.def	create_if;	.scl	2;	.type	32;	.endef
create_if:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rbx
	testq	%rcx, %rcx
	je	.L79
	movq	%rdx, %rbp
	movq	%r8, %rdi
	movq	%r9, %rsi
	movl	$32, %ecx
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
	movq	%rdi, 16(%rax)
	movq	%rsi, 24(%rax)
.L75:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L79:
	call	__getreent
	movq	24(%rax), %r9
	movl	$47, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rcx
	call	fwrite
	movq	%rbx, %rax
	jmp	.L75
	.section .rdata,"dr"
	.align 8
.LC12:
	.ascii "Error creating else-if statement: condition is NULL\12\0"
	.text
	.globl	create_else_if
	.def	create_else_if;	.scl	2;	.type	32;	.endef
create_else_if:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rbx
	testq	%rcx, %rcx
	je	.L84
	movq	%rdx, %rsi
	movl	$16, %ecx
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
.L80:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L84:
	call	__getreent
	movq	24(%rax), %r9
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC12(%rip), %rcx
	call	fwrite
	movq	%rbx, %rax
	jmp	.L80
	.globl	create_for
	.def	create_for;	.scl	2;	.type	32;	.endef
create_for:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
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
	.globl	create_while
	.def	create_while;	.scl	2;	.type	32;	.endef
create_while:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
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
	.globl	create_expression
	.def	create_expression;	.scl	2;	.type	32;	.endef
create_expression:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	movl	%ecx, %ebx
	movq	%rdx, %rsi
	movq	%r8, %rbp
	movq	%r9, %rdi
	cmpl	$19, %ecx
	sete	%dl
	testq	%r9, %r9
	sete	%al
	cmpb	%al, %dl
	jne	.L90
	movq	%r8, %rax
	orq	%rsi, %rax
	je	.L108
	movl	$32, %ecx
	call	alloc_memory
	movl	%ebx, 24(%rax)
	testq	%rsi, %rsi
	je	.L98
	movq	%rsi, (%rax)
.L99:
	movq	%rdi, 16(%rax)
	jmp	.L89
.L90:
	testq	%r9, %r9
	leaq	.LC13(%rip), %rdi
	leaq	.LC14(%rip), %rax
	cmovne	%rax, %rdi
	testq	%r8, %r8
	movq	%rax, %rbp
	leaq	.LC13(%rip), %rax
	cmove	%rax, %rbp
.L94:
	testq	%rsi, %rsi
	leaq	.LC14(%rip), %rsi
	leaq	.LC13(%rip), %rax
	cmove	%rax, %rsi
.L95:
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
.L89:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L105:
	leaq	.LC13(%rip), %rdi
	movq	%rdi, %rbp
	movq	%rdi, %rsi
	jmp	.L95
.L98:
	testq	%rbp, %rbp
	je	.L100
	movq	%rbp, 8(%rax)
	jmp	.L99
.L100:
	call	__getreent
	movq	24(%rax), %r9
	movl	$65, %r8d
	movl	$1, %edx
	leaq	.LC16(%rip), %rcx
	call	fwrite
	movq	%rbp, %rax
	jmp	.L89
.L108:
	testq	%r9, %r9
	je	.L105
	leaq	.LC14(%rip), %rdi
	leaq	.LC13(%rip), %rbp
	jmp	.L94
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
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movl	%ecx, %ebx
	movq	%rdx, %rsi
	movq	%r8, %rbp
	movq	%r9, %rdi
	movl	$16, %ecx
	call	alloc_memory
	movl	%ebx, 8(%rax)
	cmpl	$4, %ebx
	ja	.L110
	testq	%rsi, %rsi
	je	.L110
	movq	%rsi, (%rax)
.L109:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L110:
	cmpl	$5, %ebx
	jne	.L112
	testq	%rbp, %rbp
	je	.L112
	movq	%rbp, (%rax)
	jmp	.L109
.L112:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L113
	testq	%rdi, %rdi
	jne	.L117
.L113:
	cmpl	$8, %ebx
	jne	.L114
	cmpq	$0, 112(%rsp)
	je	.L114
	movq	112(%rsp), %rdi
	movq	%rdi, (%rax)
	jmp	.L109
.L117:
	movq	%rdi, (%rax)
	jmp	.L109
.L114:
	movq	%rdi, %rax
	orq	112(%rsp), %rax
	movq	%rbp, %r8
	orq	%rax, %r8
	orq	%rsi, %r8
	jne	.L115
	call	__getreent
	movq	24(%rax), %r9
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC17(%rip), %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L109
.L115:
	call	__getreent
	movq	24(%rax), %rcx
	movl	%ebx, %r8d
	leaq	.LC18(%rip), %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L109
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
	.globl	create_variable_access
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
create_variable_access:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movl	%ecx, %ebx
	movq	%rdx, %rsi
	testl	%ecx, %ecx
	sete	%r12b
	testq	%rdx, %rdx
	sete	%al
	cmpb	%r12b, %al
	jne	.L131
	movq	%r8, %rbp
	movq	%r9, %rdi
	movl	$24, %ecx
	call	alloc_memory
	movl	%ebx, 16(%rax)
	movq	%rsi, (%rax)
	testq	%rbp, %rbp
	setne	%dl
	testb	%r12b, %r12b
	je	.L123
	testb	%dl, %dl
	je	.L123
	movq	%rbp, 8(%rax)
	jmp	.L118
.L131:
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
.L118:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L123:
	cmpl	$1, %ebx
	jne	.L124
	cmpq	$0, 112(%rsp)
	je	.L124
	movq	112(%rsp), %rdi
	movq	%rdi, 8(%rax)
	jmp	.L118
.L124:
	cmpl	$3, %ebx
	jne	.L125
	testq	%rdi, %rdi
	je	.L125
	movq	%rdi, 8(%rax)
	jmp	.L118
.L125:
	cmpl	$2, %ebx
	jne	.L126
	testb	%dl, %dl
	je	.L126
	movq	%rbp, 8(%rax)
	jmp	.L118
.L126:
	orq	112(%rsp), %rdi
	movq	%rdi, %r9
	orq	%rbp, %r9
	je	.L132
	call	__getreent
	movq	24(%rax), %rcx
	movl	%ebx, %r8d
	leaq	.LC21(%rip), %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L118
.L132:
	call	__getreent
	movq	24(%rax), %r9
	movl	$48, %r8d
	movl	$1, %edx
	leaq	.LC20(%rip), %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L118
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
