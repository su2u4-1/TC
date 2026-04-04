	.file	"create.c"
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
	.globl	create_function_use_ptr
	.def	create_function_use_ptr;	.scl	2;	.type	32;	.endef
create_function_use_ptr:
	subq	$40, %rsp
	testq	%rdx, %rdx
	je	.L39
	testq	%r8, %r8
	jne	.L36
.L39:
	call	__getreent
	leaq	.LC3(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L38
.L36:
	movq	%rdx, (%rcx)
	movq	80(%rsp), %rdx
	movq	%rcx, %rax
	movq	%r8, 8(%rcx)
	movq	%rdx, 24(%rcx)
	movq	88(%rsp), %rdx
	movq	%r9, 16(%rcx)
	movq	%rdx, 32(%rcx)
.L38:
	addq	$40, %rsp
	ret
	.globl	create_function
	.def	create_function;	.scl	2;	.type	32;	.endef
create_function:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	testq	%rcx, %rcx
	je	.L45
	movq	%rdx, %rsi
	testq	%rdx, %rdx
	jne	.L42
.L45:
	call	__getreent
	leaq	.LC3(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L41
.L42:
	movq	%rcx, %rbx
	movl	$40, %ecx
	movq	%r8, %rdi
	movq	%r9, %rbp
	call	alloc_memory
	movq	%rbp, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	movq	%rax, %rcx
	movq	128(%rsp), %rax
	movq	%rbx, %rdx
	movq	%rax, 40(%rsp)
	call	create_function_use_ptr
.L41:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC4:
	.ascii "Error creating method: name or return_type is NULL\12\0"
	.text
	.globl	create_method_use_ptr
	.def	create_method_use_ptr;	.scl	2;	.type	32;	.endef
create_method_use_ptr:
	subq	$40, %rsp
	testq	%rdx, %rdx
	je	.L51
	testq	%r8, %r8
	jne	.L48
.L51:
	call	__getreent
	leaq	.LC4(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L50
.L48:
	movq	%rdx, (%rcx)
	movq	80(%rsp), %rdx
	movq	%rcx, %rax
	movq	%r8, 8(%rcx)
	movq	%rdx, 24(%rcx)
	movq	88(%rsp), %rdx
	movq	%r9, 16(%rcx)
	movq	%rdx, 32(%rcx)
.L50:
	addq	$40, %rsp
	ret
	.globl	create_method
	.def	create_method;	.scl	2;	.type	32;	.endef
create_method:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	testq	%rcx, %rcx
	je	.L57
	movq	%rdx, %rsi
	testq	%rdx, %rdx
	jne	.L54
.L57:
	call	__getreent
	leaq	.LC4(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L53
.L54:
	movq	%rcx, %rbx
	movl	$40, %ecx
	movq	%r8, %rdi
	movq	%r9, %rbp
	call	alloc_memory
	movq	%rbp, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	movq	%rax, %rcx
	movq	128(%rsp), %rax
	movq	%rbx, %rdx
	movq	%rax, 40(%rsp)
	call	create_method_use_ptr
.L53:
	addq	$56, %rsp
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
	jne	.L60
	testq	%rsi, %rsi
	je	.L60
	movq	%rsi, (%rax)
	jmp	.L59
.L60:
	cmpl	$1, %ebx
	jne	.L62
	testq	%rdi, %rdi
	je	.L62
	movq	%rdi, (%rax)
	jmp	.L59
.L62:
	orq	%rdi, %rsi
	jne	.L64
	call	__getreent
	leaq	.LC5(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	jmp	.L65
.L64:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC6(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L65:
	xorl	%eax, %eax
.L59:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.section .rdata,"dr"
.LC7:
	.ascii "Error creating class: name is NULL\12\0"
	.text
	.globl	create_class_use_ptr
	.def	create_class_use_ptr;	.scl	2;	.type	32;	.endef
create_class_use_ptr:
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$32, %rsp
	testq	%rdx, %rdx
	jne	.L80
	call	__getreent
	leaq	.LC7(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	jmp	.L81
.L80:
	movq	80(%rsp), %rax
	movq	%rdx, (%rcx)
	movq	%rcx, %rbx
	movq	%r8, 8(%rcx)
	movq	%r9, 16(%rcx)
	movq	%rax, 24(%rcx)
.L81:
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	ret
	.globl	create_class
	.def	create_class;	.scl	2;	.type	32;	.endef
create_class:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	testq	%rcx, %rcx
	jne	.L84
	call	__getreent
	leaq	.LC7(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L83
.L84:
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
.L83:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
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
	je	.L91
	movq	%rdx, %rbx
	testq	%rdx, %rdx
	jne	.L88
.L91:
	call	__getreent
	leaq	.LC8(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L87
.L88:
	movq	%rcx, %rsi
	movl	$24, %ecx
	movq	%r8, %rdi
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rbx, 8(%rax)
	movq	%rdi, 16(%rax)
.L87:
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
	movl	%ebx, 8(%rax)
	testl	%ebx, %ebx
	jne	.L94
	testq	%r12, %r12
	jne	.L136
.L94:
	cmpl	$1, %ebx
	jne	.L96
	testq	%rbp, %rbp
	je	.L96
	movq	%rbp, (%rax)
	jmp	.L93
.L96:
	cmpl	$2, %ebx
	jne	.L98
	testq	%rsi, %rsi
	je	.L98
	movq	%rsi, (%rax)
	jmp	.L93
.L98:
	cmpl	$3, %ebx
	jne	.L99
	testq	%r13, %r13
	je	.L99
	movq	%r13, (%rax)
	jmp	.L93
.L99:
	cmpl	$4, %ebx
	jne	.L100
	testq	%rdi, %rdi
	je	.L100
	movq	%rdi, (%rax)
	jmp	.L93
.L100:
	cmpl	$5, %ebx
	jne	.L101
.L136:
	movq	%r12, (%rax)
	jmp	.L93
.L101:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L102
	xorl	%edx, %edx
	movq	%rdx, (%rax)
	jmp	.L93
.L102:
	orq	%r13, %rdi
	orq	%rdi, %rsi
	orq	%rsi, %rbp
	orq	%rbp, %r12
	jne	.L103
	call	__getreent
	leaq	.LC9(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	jmp	.L104
.L103:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC10(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L104:
	xorl	%eax, %eax
.L93:
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
	jne	.L138
	call	__getreent
	leaq	.LC11(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L137
.L138:
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
.L137:
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
	jne	.L142
	call	__getreent
	leaq	.LC12(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L141
.L142:
	movq	%rcx, %rbx
	movl	$16, %ecx
	movq	%rdx, %rsi
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
.L141:
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
	.ascii "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\12\0"
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
	jne	.L150
	movq	%r8, %rax
	orq	%rsi, %rax
	jne	.L167
	jmp	.L169
.L150:
	leaq	.LC14(%rip), %rbx
	leaq	.LC13(%rip), %rax
	testq	%r9, %r9
	movq	%rbx, %rdi
	cmove	%rax, %rdi
	testq	%r8, %r8
	cmove	%rax, %rbx
.L154:
	testq	%rsi, %rsi
	leaq	.LC14(%rip), %r9
	leaq	.LC13(%rip), %rax
	cmove	%rax, %r9
	jmp	.L155
.L169:
	testq	%r9, %r9
	jne	.L170
	leaq	.LC13(%rip), %rdi
	movq	%rdi, %rbx
	movq	%rdi, %r9
.L155:
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
	jmp	.L157
.L167:
	movl	$32, %ecx
	call	alloc_memory
	movl	%r12d, 24(%rax)
	testq	%rsi, %rsi
	je	.L158
	movq	%rsi, (%rax)
	jmp	.L159
.L158:
	testq	%rbp, %rbp
	je	.L160
	movq	%rbp, 8(%rax)
	jmp	.L159
.L160:
	call	__getreent
	leaq	.LC16(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
.L157:
	xorl	%eax, %eax
	jmp	.L149
.L159:
	movq	%rdi, 16(%rax)
	jmp	.L149
.L170:
	leaq	.LC14(%rip), %rdi
	leaq	.LC13(%rip), %rbx
	jmp	.L154
.L149:
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
	ja	.L172
	testq	%rdi, %rdi
	je	.L172
	movq	%rdi, (%rax)
	jmp	.L171
.L172:
	cmpl	$5, %ebx
	jne	.L174
	testq	%rsi, %rsi
	je	.L174
	movq	%rsi, (%rax)
	jmp	.L171
.L174:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L176
	testq	%r12, %r12
	je	.L176
	movq	%r12, (%rax)
	jmp	.L171
.L176:
	cmpl	$8, %ebx
	jne	.L177
	testq	%rbp, %rbp
	je	.L177
	movq	%rbp, (%rax)
	jmp	.L171
.L177:
	orq	%r12, %rbp
	orq	%rbp, %rsi
	orq	%rdi, %rsi
	jne	.L178
	call	__getreent
	leaq	.LC17(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	jmp	.L179
.L178:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC18(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L179:
	xorl	%eax, %eax
.L171:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.section .rdata,"dr"
.LC19:
	.ascii "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\12\0"
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
	je	.L206
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
	jmp	.L209
.L206:
	movq	%r8, %rdi
	movl	$24, %ecx
	movq	%r9, %rsi
	call	alloc_memory
	testq	%rdi, %rdi
	movl	%ebx, 16(%rax)
	setne	%dl
	movq	%rbp, (%rax)
	testb	%r13b, %r13b
	je	.L210
	testb	%dl, %dl
	jne	.L244
.L210:
	cmpl	$1, %ebx
	jne	.L212
	testq	%r12, %r12
	je	.L212
	movq	%r12, 8(%rax)
	jmp	.L205
.L212:
	cmpl	$3, %ebx
	jne	.L214
	testq	%rsi, %rsi
	je	.L214
	movq	%rsi, 8(%rax)
	jmp	.L205
.L214:
	cmpl	$2, %ebx
	jne	.L215
	testb	%dl, %dl
	je	.L215
.L244:
	movq	%rdi, 8(%rax)
	jmp	.L205
.L215:
	orq	%r12, %rsi
	orq	%rsi, %rdi
	jne	.L216
	call	__getreent
	leaq	.LC20(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	jmp	.L209
.L216:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC21(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L209:
	xorl	%eax, %eax
.L205:
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
