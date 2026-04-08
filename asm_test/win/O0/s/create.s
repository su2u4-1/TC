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
	jmp	.L3
.L6:
	call	__getreent
	movq	24(%rax), %rax
	movl	16(%rbp), %edx
	movl	%edx, %r8d
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L3:
	movq	-8(%rbp), %rax
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
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
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
	jne	.L11
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$36, %r8d
	movl	$1, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L12
.L11:
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
.L12:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC3:
	.ascii "Error creating function: name or return_type is NULL\12\0"
	.text
	.globl	create_function_use_ptr
	.def	create_function_use_ptr;	.scl	2;	.type	32;	.endef
create_function_use_ptr:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	cmpq	$0, 24(%rbp)
	je	.L14
	cmpq	$0, 32(%rbp)
	jne	.L15
.L14:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$53, %r8d
	movl	$1, %edx
	leaq	.LC3(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L16
.L15:
	movq	16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	48(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	16(%rbp), %rax
	movq	56(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	16(%rbp), %rax
.L16:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "Error creating method: name or return_type is NULL\12\0"
	.text
	.globl	create_method_use_ptr
	.def	create_method_use_ptr;	.scl	2;	.type	32;	.endef
create_method_use_ptr:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	cmpq	$0, 24(%rbp)
	je	.L18
	cmpq	$0, 32(%rbp)
	jne	.L19
.L18:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$51, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L20
.L19:
	movq	16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	48(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	16(%rbp), %rax
	movq	56(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	16(%rbp), %rax
.L20:
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
	movl	16(%rbp), %edx
	movl	%edx, 8(%rax)
	cmpl	$0, 16(%rbp)
	jne	.L22
	cmpq	$0, 24(%rbp)
	je	.L22
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L23
.L22:
	cmpl	$1, 16(%rbp)
	jne	.L24
	cmpq	$0, 32(%rbp)
	je	.L24
	movq	-8(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L23
.L24:
	cmpq	$0, 24(%rbp)
	jne	.L25
	cmpq	$0, 32(%rbp)
	jne	.L25
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$45, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L26
.L25:
	call	__getreent
	movq	24(%rax), %rax
	movl	16(%rbp), %edx
	movl	%edx, %r8d
	leaq	.LC6(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L26:
	movl	$0, %eax
	jmp	.L27
.L23:
	movq	-8(%rbp), %rax
.L27:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC7:
	.ascii "Error creating class: name is NULL\12\0"
	.text
	.globl	create_class_use_ptr
	.def	create_class_use_ptr;	.scl	2;	.type	32;	.endef
create_class_use_ptr:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	cmpq	$0, 24(%rbp)
	jne	.L29
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$35, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L30
.L29:
	movq	16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	48(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	16(%rbp), %rax
.L30:
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
	je	.L32
	cmpq	$0, 24(%rbp)
	jne	.L33
.L32:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$46, %r8d
	movl	$1, %edx
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L34
.L33:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
.L34:
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
	movl	16(%rbp), %edx
	movl	%edx, 8(%rax)
	cmpl	$0, 16(%rbp)
	jne	.L36
	cmpq	$0, 48(%rbp)
	je	.L36
	movq	-8(%rbp), %rax
	movq	48(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L37
.L36:
	cmpl	$1, 16(%rbp)
	jne	.L38
	cmpq	$0, 56(%rbp)
	je	.L38
	movq	-8(%rbp), %rax
	movq	56(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L37
.L38:
	cmpl	$2, 16(%rbp)
	jne	.L39
	cmpq	$0, 24(%rbp)
	je	.L39
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L37
.L39:
	cmpl	$3, 16(%rbp)
	jne	.L40
	cmpq	$0, 32(%rbp)
	je	.L40
	movq	-8(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L37
.L40:
	cmpl	$4, 16(%rbp)
	jne	.L41
	cmpq	$0, 40(%rbp)
	je	.L41
	movq	-8(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L37
.L41:
	cmpl	$5, 16(%rbp)
	jne	.L42
	movq	-8(%rbp), %rax
	movq	48(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L37
.L42:
	cmpl	$6, 16(%rbp)
	je	.L43
	cmpl	$7, 16(%rbp)
	jne	.L44
.L43:
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	jmp	.L37
.L44:
	cmpq	$0, 24(%rbp)
	jne	.L45
	cmpq	$0, 32(%rbp)
	jne	.L45
	cmpq	$0, 40(%rbp)
	jne	.L45
	cmpq	$0, 48(%rbp)
	jne	.L45
	cmpq	$0, 56(%rbp)
	jne	.L45
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$42, %r8d
	movl	$1, %edx
	leaq	.LC9(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L46
.L45:
	call	__getreent
	movq	24(%rax), %rax
	movl	16(%rbp), %edx
	movl	%edx, %r8d
	leaq	.LC10(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L46:
	movl	$0, %eax
	jmp	.L47
.L37:
	movq	-8(%rbp), %rax
.L47:
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
	jne	.L49
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$47, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L50
.L49:
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-8(%rbp), %rax
.L50:
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
	jne	.L52
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC12(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L53
.L52:
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
.L53:
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
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
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
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
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
	.ascii "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\12\0"
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
	jne	.L59
	cmpq	$0, 24(%rbp)
	jne	.L60
	cmpq	$0, 32(%rbp)
	jne	.L60
.L59:
	cmpq	$0, 40(%rbp)
	jne	.L61
	leaq	.LC13(%rip), %rsi
	jmp	.L62
.L61:
	leaq	.LC14(%rip), %rsi
.L62:
	cmpq	$0, 32(%rbp)
	jne	.L63
	leaq	.LC13(%rip), %rbx
	jmp	.L64
.L63:
	leaq	.LC14(%rip), %rbx
.L64:
	cmpq	$0, 24(%rbp)
	jne	.L65
	leaq	.LC13(%rip), %r12
	jmp	.L66
.L65:
	leaq	.LC14(%rip), %r12
.L66:
	cmpl	$19, 16(%rbp)
	jne	.L67
	leaq	.LC13(%rip), %rdi
	jmp	.L68
.L67:
	leaq	.LC14(%rip), %rdi
.L68:
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
	jmp	.L69
.L60:
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 24(%rax)
	cmpq	$0, 24(%rbp)
	je	.L70
	movq	-40(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L71
.L70:
	cmpq	$0, 32(%rbp)
	je	.L72
	movq	-40(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L71
.L72:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$65, %r8d
	movl	$1, %edx
	leaq	.LC16(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L69
.L71:
	movq	-40(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-40(%rbp), %rax
.L69:
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
	movl	16(%rbp), %edx
	movl	%edx, 8(%rax)
	cmpl	$0, 16(%rbp)
	je	.L74
	cmpl	$1, 16(%rbp)
	je	.L74
	cmpl	$2, 16(%rbp)
	je	.L74
	cmpl	$3, 16(%rbp)
	je	.L74
	cmpl	$4, 16(%rbp)
	jne	.L75
.L74:
	cmpq	$0, 24(%rbp)
	je	.L75
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L76
.L75:
	cmpl	$5, 16(%rbp)
	jne	.L77
	cmpq	$0, 32(%rbp)
	je	.L77
	movq	-8(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L76
.L77:
	cmpl	$6, 16(%rbp)
	je	.L78
	cmpl	$7, 16(%rbp)
	jne	.L79
.L78:
	cmpq	$0, 40(%rbp)
	je	.L79
	movq	-8(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L76
.L79:
	cmpl	$8, 16(%rbp)
	jne	.L80
	cmpq	$0, 48(%rbp)
	je	.L80
	movq	-8(%rbp), %rax
	movq	48(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L76
.L80:
	cmpq	$0, 24(%rbp)
	jne	.L81
	cmpq	$0, 32(%rbp)
	jne	.L81
	cmpq	$0, 40(%rbp)
	jne	.L81
	cmpq	$0, 48(%rbp)
	jne	.L81
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC17(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L82
.L81:
	call	__getreent
	movq	24(%rax), %rax
	movl	16(%rbp), %edx
	movl	%edx, %r8d
	leaq	.LC18(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L82:
	movl	$0, %eax
	jmp	.L83
.L76:
	movq	-8(%rbp), %rax
.L83:
	leave
	ret
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
	je	.L85
	cmpl	$0, 16(%rbp)
	jne	.L86
	leaq	.LC13(%rip), %rsi
	jmp	.L87
.L86:
	leaq	.LC14(%rip), %rsi
.L87:
	cmpq	$0, 24(%rbp)
	jne	.L88
	leaq	.LC13(%rip), %rbx
	jmp	.L89
.L88:
	leaq	.LC14(%rip), %rbx
.L89:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC19(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$0, %eax
	jmp	.L90
.L85:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 16(%rax)
	movq	-24(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	cmpl	$0, 16(%rbp)
	jne	.L91
	cmpq	$0, 32(%rbp)
	je	.L91
	movq	-24(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L92
.L91:
	cmpl	$1, 16(%rbp)
	jne	.L93
	cmpq	$0, 48(%rbp)
	je	.L93
	movq	-24(%rbp), %rax
	movq	48(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L92
.L93:
	cmpl	$3, 16(%rbp)
	jne	.L94
	cmpq	$0, 40(%rbp)
	je	.L94
	movq	-24(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L92
.L94:
	cmpl	$2, 16(%rbp)
	jne	.L95
	cmpq	$0, 32(%rbp)
	je	.L95
	movq	-24(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L92
.L95:
	cmpq	$0, 32(%rbp)
	jne	.L96
	cmpq	$0, 40(%rbp)
	jne	.L96
	cmpq	$0, 48(%rbp)
	jne	.L96
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$48, %r8d
	movl	$1, %edx
	leaq	.LC20(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L97
.L96:
	call	__getreent
	movq	24(%rax), %rax
	movl	16(%rbp), %edx
	movl	%edx, %r8d
	leaq	.LC21(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L97:
	movl	$0, %eax
	jmp	.L90
.L92:
	movq	-24(%rbp), %rax
.L90:
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
