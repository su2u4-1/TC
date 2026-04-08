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
	pushq	%r12
	movq	%r8, %r12
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rdi
	movq	%r9, %rdi
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
	testq	%rbp, %rbp
	je	.L2
	movq	%rbp, (%rax)
	jmp	.L1
.L2:
	cmpl	$1, %esi
	jne	.L4
	testq	%r12, %r12
	je	.L4
	movq	%r12, (%rbx)
	jmp	.L1
.L4:
	cmpl	$2, %esi
	jne	.L5
	testq	%rdi, %rdi
	je	.L5
	movq	%rdi, (%rbx)
	jmp	.L1
.L5:
	orq	%r12, %rdi
	orq	%rdi, %rbp
	jne	.L6
	call	__getreent
	leaq	.LC0(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	jmp	.L1
.L6:
	call	__getreent
	movl	%esi, %r8d
	leaq	.LC1(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L1:
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
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
	jne	.L30
	call	__getreent
	leaq	.LC2(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L29
.L30:
	movq	%rcx, %rbx
	movl	$16, %ecx
	movq	%rdx, %rsi
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
.L29:
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
	je	.L37
	testq	%r8, %r8
	jne	.L34
.L37:
	call	__getreent
	leaq	.LC3(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L36
.L34:
	movq	%rdx, (%rcx)
	movq	80(%rsp), %rdx
	movq	%rcx, %rax
	movq	%r8, 8(%rcx)
	movq	%rdx, 24(%rcx)
	movq	88(%rsp), %rdx
	movq	%r9, 16(%rcx)
	movq	%rdx, 32(%rcx)
.L36:
	addq	$40, %rsp
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
	je	.L43
	testq	%r8, %r8
	jne	.L40
.L43:
	call	__getreent
	leaq	.LC4(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L42
.L40:
	movq	%rdx, (%rcx)
	movq	80(%rsp), %rdx
	movq	%rcx, %rax
	movq	%r8, 8(%rcx)
	movq	%rdx, 24(%rcx)
	movq	88(%rsp), %rdx
	movq	%r9, 16(%rcx)
	movq	%rdx, 32(%rcx)
.L42:
	addq	$40, %rsp
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
	jne	.L46
	testq	%rsi, %rsi
	je	.L46
	movq	%rsi, (%rax)
	jmp	.L45
.L46:
	cmpl	$1, %ebx
	jne	.L48
	testq	%rdi, %rdi
	je	.L48
	movq	%rdi, (%rax)
	jmp	.L45
.L48:
	orq	%rdi, %rsi
	jne	.L50
	call	__getreent
	leaq	.LC5(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	jmp	.L51
.L50:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC6(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L51:
	xorl	%eax, %eax
.L45:
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
	jne	.L66
	call	__getreent
	leaq	.LC7(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	jmp	.L67
.L66:
	movq	80(%rsp), %rax
	movq	%rdx, (%rcx)
	movq	%rcx, %rbx
	movq	%r8, 8(%rcx)
	movq	%r9, 16(%rcx)
	movq	%rax, 24(%rcx)
.L67:
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
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
	je	.L73
	movq	%rdx, %rbx
	testq	%rdx, %rdx
	jne	.L70
.L73:
	call	__getreent
	leaq	.LC8(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L69
.L70:
	movq	%rcx, %rsi
	movl	$24, %ecx
	movq	%r8, %rdi
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rbx, 8(%rax)
	movq	%rdi, 16(%rax)
.L69:
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
	jne	.L76
	testq	%r12, %r12
	jne	.L118
.L76:
	cmpl	$1, %ebx
	jne	.L78
	testq	%rbp, %rbp
	je	.L78
	movq	%rbp, (%rax)
	jmp	.L75
.L78:
	cmpl	$2, %ebx
	jne	.L80
	testq	%rsi, %rsi
	je	.L80
	movq	%rsi, (%rax)
	jmp	.L75
.L80:
	cmpl	$3, %ebx
	jne	.L81
	testq	%r13, %r13
	je	.L81
	movq	%r13, (%rax)
	jmp	.L75
.L81:
	cmpl	$4, %ebx
	jne	.L82
	testq	%rdi, %rdi
	je	.L82
	movq	%rdi, (%rax)
	jmp	.L75
.L82:
	cmpl	$5, %ebx
	jne	.L83
.L118:
	movq	%r12, (%rax)
	jmp	.L75
.L83:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L84
	xorl	%edx, %edx
	movq	%rdx, (%rax)
	jmp	.L75
.L84:
	orq	%r13, %rdi
	orq	%rdi, %rsi
	orq	%rsi, %rbp
	orq	%rbp, %r12
	jne	.L85
	call	__getreent
	leaq	.LC9(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	jmp	.L86
.L85:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC10(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L86:
	xorl	%eax, %eax
.L75:
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
	jne	.L120
	call	__getreent
	leaq	.LC11(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L119
.L120:
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
.L119:
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
	jne	.L124
	call	__getreent
	leaq	.LC12(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L123
.L124:
	movq	%rcx, %rbx
	movl	$16, %ecx
	movq	%rdx, %rsi
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
.L123:
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
	jne	.L132
	movq	%r8, %rax
	orq	%rsi, %rax
	jne	.L149
	jmp	.L151
.L132:
	leaq	.LC14(%rip), %rbx
	leaq	.LC13(%rip), %rax
	testq	%r9, %r9
	movq	%rbx, %rdi
	cmove	%rax, %rdi
	testq	%r8, %r8
	cmove	%rax, %rbx
.L136:
	testq	%rsi, %rsi
	leaq	.LC14(%rip), %r9
	leaq	.LC13(%rip), %rax
	cmove	%rax, %r9
	jmp	.L137
.L151:
	testq	%r9, %r9
	jne	.L152
	leaq	.LC13(%rip), %rdi
	movq	%rdi, %rbx
	movq	%rdi, %r9
.L137:
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
	jmp	.L139
.L149:
	movl	$32, %ecx
	call	alloc_memory
	movl	%r12d, 24(%rax)
	testq	%rsi, %rsi
	je	.L140
	movq	%rsi, (%rax)
	jmp	.L141
.L140:
	testq	%rbp, %rbp
	je	.L142
	movq	%rbp, 8(%rax)
	jmp	.L141
.L142:
	call	__getreent
	leaq	.LC16(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
.L139:
	xorl	%eax, %eax
	jmp	.L131
.L141:
	movq	%rdi, 16(%rax)
	jmp	.L131
.L152:
	leaq	.LC14(%rip), %rdi
	leaq	.LC13(%rip), %rbx
	jmp	.L136
.L131:
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
	ja	.L154
	testq	%rdi, %rdi
	je	.L154
	movq	%rdi, (%rax)
	jmp	.L153
.L154:
	cmpl	$5, %ebx
	jne	.L156
	testq	%rsi, %rsi
	je	.L156
	movq	%rsi, (%rax)
	jmp	.L153
.L156:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L158
	testq	%r12, %r12
	je	.L158
	movq	%r12, (%rax)
	jmp	.L153
.L158:
	cmpl	$8, %ebx
	jne	.L159
	testq	%rbp, %rbp
	je	.L159
	movq	%rbp, (%rax)
	jmp	.L153
.L159:
	orq	%r12, %rbp
	orq	%rbp, %rsi
	orq	%rdi, %rsi
	jne	.L160
	call	__getreent
	leaq	.LC17(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	jmp	.L161
.L160:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC18(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L161:
	xorl	%eax, %eax
.L153:
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
	je	.L188
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
	jmp	.L191
.L188:
	movq	%r8, %rdi
	movl	$24, %ecx
	movq	%r9, %rsi
	call	alloc_memory
	testq	%rdi, %rdi
	movl	%ebx, 16(%rax)
	setne	%dl
	movq	%rbp, (%rax)
	testb	%r13b, %r13b
	je	.L192
	testb	%dl, %dl
	jne	.L226
.L192:
	cmpl	$1, %ebx
	jne	.L194
	testq	%r12, %r12
	je	.L194
	movq	%r12, 8(%rax)
	jmp	.L187
.L194:
	cmpl	$3, %ebx
	jne	.L196
	testq	%rsi, %rsi
	je	.L196
	movq	%rsi, 8(%rax)
	jmp	.L187
.L196:
	cmpl	$2, %ebx
	jne	.L197
	testb	%dl, %dl
	je	.L197
.L226:
	movq	%rdi, 8(%rax)
	jmp	.L187
.L197:
	orq	%r12, %rsi
	orq	%rsi, %rdi
	jne	.L198
	call	__getreent
	leaq	.LC20(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	jmp	.L191
.L198:
	call	__getreent
	movl	%ebx, %r8d
	leaq	.LC21(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L191:
	xorl	%eax, %eax
.L187:
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
