	.file	"D:\\TC\\src\\create.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Error creating code member: content is NULL\12\0"
.LC1:
	.ascii "Error creating code member: unknown type %u\12\0"
	.text
	.globl	create_code_member
	.def	create_code_member;	.scl	2;	.type	32;	.endef
create_code_member:
	pushq	%rbp
	movq	%r8, %rbp
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	movq	%r9, %rsi
	pushq	%rbx
	movl	%ecx, %ebx
	movl	$16, %ecx
	subq	$40, %rsp
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
.LC2:
	.ascii "Error creating import: name is NULL\12\0"
	.text
	.globl	create_import
	.def	create_import;	.scl	2;	.type	32;	.endef
create_import:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	testq	%rcx, %rcx
	jne	.L32
	call	__getreent
	leaq	.LC2(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L31
.L32:
	movq	%rcx, %rbx
	movl	$16, %ecx
	movq	%rdx, %rsi
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
.L31:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.section .rdata,"dr"
.LC3:
	.ascii "Error creating function: name or return_type is NULL\12\0"
	.text
	.globl	create_function
	.def	create_function;	.scl	2;	.type	32;	.endef
create_function:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	testq	%rcx, %rcx
	je	.L39
	movq	%rdx, %rbx
	testq	%rdx, %rdx
	jne	.L36
.L39:
	call	__getreent
	leaq	.LC3(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L35
.L36:
	movq	%rcx, %rsi
	movl	$40, %ecx
	movq	%r8, %rbp
	movq	%r9, %rdi
	call	alloc_memory
	movq	112(%rsp), %rdx
	movq	%rsi, (%rax)
	movq	%rbx, 8(%rax)
	movq	%rbp, 16(%rax)
	movq	%rdi, 24(%rax)
	movq	%rdx, 32(%rax)
.L35:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC4:
	.ascii "Error creating method: name or return_type is NULL\12\0"
	.text
	.globl	create_method
	.def	create_method;	.scl	2;	.type	32;	.endef
create_method:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	testq	%rcx, %rcx
	je	.L45
	movq	%rdx, %rbx
	testq	%rdx, %rdx
	jne	.L42
.L45:
	call	__getreent
	leaq	.LC4(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L41
.L42:
	movq	%rcx, %rsi
	movl	$40, %ecx
	movq	%r8, %rbp
	movq	%r9, %rdi
	call	alloc_memory
	movq	112(%rsp), %rdx
	movq	%rsi, (%rax)
	movq	%rbx, 8(%rax)
	movq	%rbp, 16(%rax)
	movq	%rdi, 24(%rax)
	movq	%rdx, 32(%rax)
.L41:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC5:
	.ascii "Error creating class member: content is NULL\12\0"
.LC6:
	.ascii "Error creating class member: unknown type %u\12\0"
	.text
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
	jmp	.L47
.L48:
	cmpl	$1, %ebx
	jne	.L50
	testq	%rdi, %rdi
	je	.L50
	movq	%rdi, (%rax)
	jmp	.L47
.L50:
	orq	%rdi, %rsi
	jne	.L52
	call	__getreent
	leaq	.LC5(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	jmp	.L53
.L52:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC6(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L53:
	xorl	%eax, %eax
.L47:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.section .rdata,"dr"
.LC7:
	.ascii "Error creating class: name is NULL\12\0"
	.text
	.globl	create_class
	.def	create_class;	.scl	2;	.type	32;	.endef
create_class:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	testq	%rcx, %rcx
	jne	.L68
	call	__getreent
	leaq	.LC7(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L67
.L68:
	movq	%rcx, %rbx
	movl	$24, %ecx
	movq	%rdx, %rdi
	movq	%r8, %rsi
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rdi, 8(%rax)
	movq	%rsi, 16(%rax)
.L67:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.section .rdata,"dr"
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
	je	.L75
	movq	%rdx, %rbx
	testq	%rdx, %rdx
	jne	.L72
.L75:
	call	__getreent
	leaq	.LC8(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L71
.L72:
	movq	%rcx, %rsi
	movl	$24, %ecx
	movq	%r8, %rdi
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rbx, 8(%rax)
	movq	%rdi, 16(%rax)
.L71:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.section .rdata,"dr"
.LC9:
	.ascii "Error creating statement: content is NULL\12\0"
.LC10:
	.ascii "Error creating statement: unknown type %u\12\0"
	.text
	.globl	create_statement
	.def	create_statement;	.scl	2;	.type	32;	.endef
create_statement:
	pushq	%r13
	movq	%r8, %r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	movq	%r9, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movl	%ecx, %ebx
	movl	$16, %ecx
	subq	$40, %rsp
	movq	128(%rsp), %r12
	movq	136(%rsp), %rbp
	call	alloc_memory
	testq	%r12, %r12
	movl	%ebx, 8(%rax)
	setne	%dl
	testl	%ebx, %ebx
	jne	.L78
	testb	%dl, %dl
	jne	.L126
.L78:
	cmpl	$1, %ebx
	jne	.L80
	testq	%rbp, %rbp
	je	.L80
	movq	%rbp, (%rax)
	jmp	.L77
.L80:
	cmpl	$2, %ebx
	jne	.L82
	testq	%rsi, %rsi
	je	.L82
	movq	%rsi, (%rax)
	jmp	.L77
.L82:
	cmpl	$3, %ebx
	jne	.L83
	testq	%r13, %r13
	je	.L83
	movq	%r13, (%rax)
	jmp	.L77
.L83:
	cmpl	$4, %ebx
	jne	.L84
	testq	%rdi, %rdi
	je	.L84
	movq	%rdi, (%rax)
	jmp	.L77
.L84:
	cmpl	$5, %ebx
	jne	.L85
	testb	%dl, %dl
	je	.L85
.L126:
	movq	%r12, (%rax)
	jmp	.L77
.L85:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L86
	xorl	%edx, %edx
	movq	%rdx, (%rax)
	jmp	.L77
.L86:
	orq	%r13, %rdi
	orq	%rdi, %rsi
	orq	%rsi, %rbp
	orq	%rbp, %r12
	jne	.L87
	call	__getreent
	leaq	.LC9(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	jmp	.L88
.L87:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC10(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L88:
	xorl	%eax, %eax
.L77:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.section .rdata,"dr"
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
	testq	%rcx, %rcx
	jne	.L128
	call	__getreent
	leaq	.LC11(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L127
.L128:
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
.L127:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC12:
	.ascii "Error creating else-if statement: condition is NULL\12\0"
	.text
	.globl	create_else_if
	.def	create_else_if;	.scl	2;	.type	32;	.endef
create_else_if:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	testq	%rcx, %rcx
	jne	.L132
	call	__getreent
	leaq	.LC12(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L131
.L132:
	movq	%rcx, %rbx
	movl	$16, %ecx
	movq	%rdx, %rsi
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
.L131:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
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
.LC15:
	.ascii "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\12\0"
.LC16:
	.ascii "Error creating expression: both expr_left and prim_left are NULL\12\0"
	.text
	.globl	create_expression
	.def	create_expression;	.scl	2;	.type	32;	.endef
create_expression:
	pushq	%r12
	movl	%ecx, %r12d
	pushq	%rbp
	movq	%r8, %rbp
	pushq	%rdi
	movq	%r9, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	subq	$64, %rsp
	cmpl	$19, %ecx
	sete	%dl
	testq	%r9, %r9
	sete	%al
	cmpb	%al, %dl
	jne	.L140
	movq	%r8, %rax
	orq	%rsi, %rax
	jne	.L157
	jmp	.L159
.L140:
	leaq	.LC14(%rip), %rbx
	leaq	.LC13(%rip), %rax
	testq	%r9, %r9
	movq	%rbx, %rdi
	cmove	%rax, %rdi
	testq	%r8, %r8
	cmove	%rax, %rbx
.L144:
	testq	%rsi, %rsi
	leaq	.LC14(%rip), %r9
	leaq	.LC13(%rip), %rax
	cmove	%rax, %r9
	jmp	.L145
.L159:
	testq	%r9, %r9
	jne	.L160
	leaq	.LC13(%rip), %rdi
	movq	%rdi, %rbx
	movq	%rdi, %r9
.L145:
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
	jmp	.L147
.L157:
	movl	$32, %ecx
	call	alloc_memory
	movl	%r12d, 24(%rax)
	testq	%rsi, %rsi
	je	.L148
	movq	%rsi, (%rax)
	jmp	.L149
.L148:
	testq	%rbp, %rbp
	je	.L150
	movq	%rbp, 8(%rax)
	jmp	.L149
.L150:
	call	__getreent
	leaq	.LC16(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
.L147:
	xorl	%eax, %eax
	jmp	.L139
.L149:
	movq	%rdi, 16(%rax)
	jmp	.L139
.L160:
	leaq	.LC14(%rip), %rdi
	leaq	.LC13(%rip), %rbx
	jmp	.L144
.L139:
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.section .rdata,"dr"
.LC17:
	.ascii "Error creating primary: value is NULL\12\0"
.LC18:
	.ascii "Error creating primary: unknown type %u\12\0"
	.text
	.globl	create_primary
	.def	create_primary;	.scl	2;	.type	32;	.endef
create_primary:
	pushq	%r12
	movq	%r9, %r12
	pushq	%rbp
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	movq	%r8, %rsi
	pushq	%rbx
	movl	%ecx, %ebx
	movl	$16, %ecx
	subq	$32, %rsp
	movq	112(%rsp), %rbp
	call	alloc_memory
	movl	%ebx, 8(%rax)
	cmpl	$4, %ebx
	ja	.L162
	testq	%rdi, %rdi
	je	.L162
	movq	%rdi, (%rax)
	jmp	.L161
.L162:
	cmpl	$5, %ebx
	jne	.L164
	testq	%rsi, %rsi
	je	.L164
	movq	%rsi, (%rax)
	jmp	.L161
.L164:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L166
	testq	%r12, %r12
	je	.L166
	movq	%r12, (%rax)
	jmp	.L161
.L166:
	cmpl	$8, %ebx
	jne	.L167
	testq	%rbp, %rbp
	je	.L167
	movq	%rbp, (%rax)
	jmp	.L161
.L167:
	orq	%r12, %rbp
	orq	%rbp, %rsi
	orq	%rdi, %rsi
	jne	.L168
	call	__getreent
	leaq	.LC17(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	jmp	.L169
.L168:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC18(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L169:
	xorl	%eax, %eax
.L161:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.section .rdata,"dr"
.LC19:
	.ascii "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\12\0"
.LC20:
	.ascii "Error creating variable access: content is NULL\12\0"
.LC21:
	.ascii "Error creating variable access: unknown type %u\12\0"
	.text
	.globl	create_variable_access
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
create_variable_access:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movl	%ecx, %ebx
	subq	$56, %rsp
	testl	%ecx, %ecx
	sete	%al
	testq	%rdx, %rdx
	movq	144(%rsp), %r12
	sete	%r13b
	cmpb	%al, %r13b
	je	.L196
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
	jmp	.L199
.L196:
	movq	%r8, %rdi
	movl	$24, %ecx
	movq	%r9, %rsi
	call	alloc_memory
	testq	%rdi, %rdi
	movl	%ebx, 16(%rax)
	setne	%dl
	movq	%rbp, (%rax)
	testb	%r13b, %r13b
	je	.L200
	testb	%dl, %dl
	jne	.L234
.L200:
	cmpl	$1, %ebx
	jne	.L202
	testq	%r12, %r12
	je	.L202
	movq	%r12, 8(%rax)
	jmp	.L195
.L202:
	cmpl	$3, %ebx
	jne	.L204
	testq	%rsi, %rsi
	je	.L204
	movq	%rsi, 8(%rax)
	jmp	.L195
.L204:
	cmpl	$2, %ebx
	jne	.L205
	testb	%dl, %dl
	je	.L205
.L234:
	movq	%rdi, 8(%rax)
	jmp	.L195
.L205:
	orq	%r12, %rsi
	orq	%rsi, %rdi
	jne	.L206
	call	__getreent
	leaq	.LC20(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	jmp	.L199
.L206:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC21(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L199:
	xorl	%eax, %eax
.L195:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
