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
	pushq	%r12
	movq	%r9, %r12
	pushq	%rbp
	movq	%r8, %rbp
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	movl	%ecx, %esi
	movl	$16, %ecx
	pushq	%rbx
	subq	$32, %rsp
	call	alloc_memory
	movl	%esi, 8(%rax)
	movq	%rax, %rbx
	testl	%esi, %esi
	jne	.L2
	testq	%rdi, %rdi
	je	.L2
	movq	%rdi, (%rax)
.L1:
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L2:
	cmpl	$1, %esi
	jne	.L4
	testq	%rbp, %rbp
	je	.L4
	movq	%rbp, (%rbx)
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	cmpl	$2, %esi
	jne	.L5
	testq	%r12, %r12
	je	.L5
	movq	%r12, (%rbx)
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%r12, %r9
	orq	%rbp, %r9
	orq	%r9, %rdi
	je	.L27
	call	__getreent
	movl	%esi, %r8d
	leaq	.LC1(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L27:
	call	__getreent
	movl	$44, %r8d
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
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
	je	.L34
	movq	%rcx, %rbx
	movl	$16, %ecx
	movq	%rdx, %rsi
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
.L34:
	call	__getreent
	movl	$36, %r8d
	movl	$1, %edx
	leaq	.LC2(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L30
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
	je	.L39
	testq	%r8, %r8
	je	.L39
	movq	80(%rsp), %rax
	movq	%rdx, (%rcx)
	movq	%r8, 8(%rcx)
	movq	%rax, 24(%rcx)
	movq	88(%rsp), %rax
	movq	%r9, 16(%rcx)
	movq	%rax, 32(%rcx)
	movq	%rcx, %rax
.L35:
	addq	$40, %rsp
	ret
	.p2align 4,,10
	.p2align 3
.L39:
	call	__getreent
	movl	$53, %r8d
	movl	$1, %edx
	leaq	.LC3(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L35
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
	je	.L45
	testq	%r8, %r8
	je	.L45
	movq	80(%rsp), %rax
	movq	%rdx, (%rcx)
	movq	%r8, 8(%rcx)
	movq	%rax, 24(%rcx)
	movq	88(%rsp), %rax
	movq	%r9, 16(%rcx)
	movq	%rax, 32(%rcx)
	movq	%rcx, %rax
.L41:
	addq	$40, %rsp
	ret
	.p2align 4,,10
	.p2align 3
.L45:
	call	__getreent
	movl	$51, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L41
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
	jne	.L48
	testq	%rsi, %rsi
	je	.L48
	movq	%rsi, (%rax)
.L47:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L48:
	cmpl	$1, %ebx
	jne	.L50
	testq	%rdi, %rdi
	je	.L50
	movq	%rdi, (%rax)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L50:
	orq	%rdi, %rsi
	jne	.L52
	call	__getreent
	movl	$45, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L47
	.p2align 4,,10
	.p2align 3
.L52:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC6(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L47
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
	je	.L71
	movq	80(%rsp), %rax
	movq	%rdx, (%rcx)
	movq	%r8, 8(%rcx)
	movq	%r9, 16(%rcx)
	movq	%rax, 24(%rcx)
	movq	%rcx, %rax
.L67:
	addq	$40, %rsp
	ret
	.p2align 4,,10
	.p2align 3
.L71:
	call	__getreent
	movl	$35, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L67
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
	je	.L76
	movq	%rdx, %rsi
	testq	%rdx, %rdx
	je	.L76
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
.L76:
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
	jne	.L79
	testq	%r12, %r12
	je	.L79
.L121:
	movq	%r12, (%rax)
.L78:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L79:
	cmpl	$1, %ebx
	jne	.L81
	cmpq	$0, 120(%rsp)
	je	.L81
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
.L81:
	cmpl	$2, %ebx
	jne	.L83
	testq	%rsi, %rsi
	je	.L83
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
	cmpl	$3, %ebx
	jne	.L84
	testq	%rbp, %rbp
	je	.L84
	movq	%rbp, (%rax)
	jmp	.L78
	.p2align 4,,10
	.p2align 3
.L84:
	cmpl	$4, %ebx
	jne	.L85
	testq	%rdi, %rdi
	je	.L85
	movq	%rdi, (%rax)
	jmp	.L78
	.p2align 4,,10
	.p2align 3
.L85:
	cmpl	$5, %ebx
	je	.L121
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L87
	movq	$0, (%rax)
	jmp	.L78
.L87:
	orq	%rbp, %rdi
	movq	120(%rsp), %rax
	orq	%rdi, %rsi
	orq	%rsi, %rax
	orq	%r12, %rax
	je	.L122
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC10(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L78
.L122:
	call	__getreent
	movl	$42, %r8d
	movl	$1, %edx
	leaq	.LC9(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L78
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
	je	.L127
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
.L123:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L127:
	call	__getreent
	movl	$47, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L123
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
	je	.L132
	movq	%rcx, %rbx
	movl	$16, %ecx
	movq	%rdx, %rsi
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
.L128:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
	.p2align 3
.L132:
	call	__getreent
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC12(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L128
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
	jne	.L138
	movq	%r8, %rax
	orq	%rdi, %rax
	je	.L155
	movl	$32, %ecx
	call	alloc_memory
	movl	%ebx, 24(%rax)
	testq	%rdi, %rdi
	je	.L145
	movq	%rdi, (%rax)
.L146:
	movq	%rsi, 16(%rax)
.L137:
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L155:
	leaq	.LC13(%rip), %rbp
	testq	%r9, %r9
	je	.L149
	leaq	.LC14(%rip), %r12
	movq	%rbp, %rsi
	jmp	.L140
	.p2align 4,,10
	.p2align 3
.L138:
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
.L140:
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
	jmp	.L137
	.p2align 4,,10
	.p2align 3
.L149:
	movq	%rbp, %r12
	movq	%rbp, %rsi
	jmp	.L140
	.p2align 4,,10
	.p2align 3
.L145:
	testq	%rbp, %rbp
	je	.L147
	movq	%rbp, 8(%rax)
	jmp	.L146
.L147:
	call	__getreent
	movl	$65, %r8d
	movl	$1, %edx
	leaq	.LC16(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L137
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
	ja	.L157
	testq	%rsi, %rsi
	je	.L157
	movq	%rsi, (%rax)
.L156:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L157:
	cmpl	$5, %ebx
	jne	.L159
	testq	%rbp, %rbp
	je	.L159
	movq	%rbp, (%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L159:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	jbe	.L188
	cmpl	$8, %ebx
	jne	.L162
	cmpq	$0, 112(%rsp)
	je	.L162
	movq	112(%rsp), %rdi
.L187:
	movq	%rdi, (%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L188:
	testq	%rdi, %rdi
	jne	.L187
.L162:
	movq	112(%rsp), %rax
	movq	%rbp, %r8
	orq	%rdi, %rax
	orq	%rax, %r8
	orq	%r8, %rsi
	jne	.L163
	call	__getreent
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC17(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L156
	.p2align 4,,10
	.p2align 3
.L163:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC18(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L156
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
	jne	.L229
	movq	%r8, %rdi
	movl	$24, %ecx
	movq	%r9, %rbp
	call	alloc_memory
	testq	%rdi, %rdi
	movl	%ebx, 16(%rax)
	setne	%dl
	movq	%rsi, (%rax)
	testb	%r12b, %r12b
	je	.L194
	testb	%dl, %dl
	je	.L194
.L228:
	movq	%rdi, 8(%rax)
.L189:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L194:
	cmpl	$1, %ebx
	jne	.L196
	cmpq	$0, 112(%rsp)
	je	.L196
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
.L229:
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
	jmp	.L189
	.p2align 4,,10
	.p2align 3
.L196:
	cmpl	$3, %ebx
	jne	.L198
	testq	%rbp, %rbp
	je	.L198
	movq	%rbp, 8(%rax)
	jmp	.L189
	.p2align 4,,10
	.p2align 3
.L198:
	cmpl	$2, %ebx
	jne	.L199
	testb	%dl, %dl
	jne	.L228
.L199:
	movq	112(%rsp), %r9
	orq	%rbp, %r9
	orq	%r9, %rdi
	je	.L230
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC21(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L189
.L230:
	call	__getreent
	movl	$48, %r8d
	movl	$1, %edx
	leaq	.LC20(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L189
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
