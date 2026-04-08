	.file	"create.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Error creating code member: content is NULL\n"
.LC1:
	.string	"Error creating code member: unknown type %u\n"
	.text
	.globl	create_code_member
	.type	create_code_member, @function
create_code_member:
	pushq	%r14
	movq	%rdx, %r14
	pushq	%r13
	movq	%rsi, %r13
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rbp
	movl	%edi, %ebp
	movl	$16, %edi
	pushq	%rbx
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%ebp, 8(%rax)
	movq	%rax, %rbx
	testl	%ebp, %ebp
	jne	.L2
	testq	%r13, %r13
	je	.L2
	movq	%r13, (%rax)
	jmp	.L1
.L2:
	cmpl	$1, %ebp
	jne	.L4
	testq	%r14, %r14
	je	.L4
	movq	%r14, (%rbx)
	jmp	.L1
.L4:
	cmpl	$2, %ebp
	jne	.L5
	testq	%r12, %r12
	je	.L5
	movq	%r12, (%rbx)
	jmp	.L1
.L5:
	orq	%r14, %r12
	movq	stderr(%rip), %rdi
	orq	%r12, %r13
	jne	.L6
	movq	%rdi, %rsi
	leaq	.LC0(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	jmp	.L1
.L6:
	movl	%ebp, %ecx
	leaq	.LC1(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L1:
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	create_code_member, .-create_code_member
	.globl	create_code
	.type	create_code, @function
create_code:
	pushq	%rbp
	movq	%rdi, %rbp
	movl	$16, %edi
	pushq	%rbx
	movq	%rsi, %rbx
	pushq	%rax
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, (%rax)
	movq	%rbx, 8(%rax)
	popq	%rdx
	popq	%rbx
	popq	%rbp
	ret
	.size	create_code, .-create_code
	.section	.rodata.str1.1
.LC2:
	.string	"Error creating import: name is NULL\n"
	.text
	.globl	create_import
	.type	create_import, @function
create_import:
	pushq	%rbp
	pushq	%rbx
	pushq	%rcx
	testq	%rdi, %rdi
	jne	.L30
	movq	stderr(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L29
.L30:
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
.L29:
	popq	%rdx
	popq	%rbx
	popq	%rbp
	ret
	.size	create_import, .-create_import
	.section	.rodata.str1.1
.LC3:
	.string	"Error creating function: name or return_type is NULL\n"
	.text
	.globl	create_function_use_ptr
	.type	create_function_use_ptr, @function
create_function_use_ptr:
	testq	%rsi, %rsi
	je	.L37
	testq	%rdx, %rdx
	jne	.L34
.L37:
	leaq	.LC3(%rip), %rdi
	pushq	%rax
	movq	stderr(%rip), %rsi
	call	*fputs@GOTPCREL(%rip)
	xorl	%eax, %eax
	popq	%rdx
	ret
.L34:
	movq	%rsi, (%rdi)
	movq	%rdi, %rax
	movq	%rdx, 8(%rdi)
	movq	%rcx, 16(%rdi)
	movq	%r8, 24(%rdi)
	movq	%r9, 32(%rdi)
	ret
	.size	create_function_use_ptr, .-create_function_use_ptr
	.section	.rodata.str1.1
.LC4:
	.string	"Error creating method: name or return_type is NULL\n"
	.text
	.globl	create_method_use_ptr
	.type	create_method_use_ptr, @function
create_method_use_ptr:
	testq	%rsi, %rsi
	je	.L45
	testq	%rdx, %rdx
	jne	.L42
.L45:
	leaq	.LC4(%rip), %rdi
	pushq	%rax
	movq	stderr(%rip), %rsi
	call	*fputs@GOTPCREL(%rip)
	xorl	%eax, %eax
	popq	%rdx
	ret
.L42:
	movq	%rsi, (%rdi)
	movq	%rdi, %rax
	movq	%rdx, 8(%rdi)
	movq	%rcx, 16(%rdi)
	movq	%r8, 24(%rdi)
	movq	%r9, 32(%rdi)
	ret
	.size	create_method_use_ptr, .-create_method_use_ptr
	.section	.rodata.str1.1
.LC5:
	.string	"Error creating class member: content is NULL\n"
.LC6:
	.string	"Error creating class member: unknown type %u\n"
	.text
	.globl	create_class_member
	.type	create_class_member, @function
create_class_member:
	pushq	%r12
	movq	%rdx, %r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movl	%edi, %ebx
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%ebx, 8(%rax)
	testl	%ebx, %ebx
	jne	.L50
	testq	%rbp, %rbp
	je	.L50
	movq	%rbp, (%rax)
	jmp	.L49
.L50:
	cmpl	$1, %ebx
	jne	.L52
	testq	%r12, %r12
	je	.L52
	movq	%r12, (%rax)
	jmp	.L49
.L52:
	orq	%r12, %rbp
	movq	stderr(%rip), %rdi
	jne	.L54
	movq	%rdi, %rsi
	leaq	.LC5(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	jmp	.L55
.L54:
	movl	%ebx, %ecx
	leaq	.LC6(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L55:
	xorl	%eax, %eax
.L49:
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	create_class_member, .-create_class_member
	.section	.rodata.str1.1
.LC7:
	.string	"Error creating class: name is NULL\n"
	.text
	.globl	create_class_use_ptr
	.type	create_class_use_ptr, @function
create_class_use_ptr:
	pushq	%rbx
	movq	%rsi, %rbx
	testq	%rsi, %rsi
	jne	.L70
	movq	stderr(%rip), %rsi
	leaq	.LC7(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	jmp	.L71
.L70:
	movq	%rsi, (%rdi)
	movq	%rdi, %rbx
	movq	%rdx, 8(%rdi)
	movq	%rcx, 16(%rdi)
	movq	%r8, 24(%rdi)
.L71:
	movq	%rbx, %rax
	popq	%rbx
	ret
	.size	create_class_use_ptr, .-create_class_use_ptr
	.section	.rodata.str1.1
.LC8:
	.string	"Error creating variable: type or name is NULL\n"
	.text
	.globl	create_variable
	.type	create_variable, @function
create_variable:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	testq	%rdi, %rdi
	je	.L77
	movq	%rsi, %rbx
	testq	%rsi, %rsi
	jne	.L74
.L77:
	movq	stderr(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L73
.L74:
	movq	%rdi, %rbp
	movq	%rdx, %r12
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, (%rax)
	movq	%rbx, 8(%rax)
	movq	%r12, 16(%rax)
.L73:
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	create_variable, .-create_variable
	.section	.rodata.str1.1
.LC9:
	.string	"Error creating statement: content is NULL\n"
.LC10:
	.string	"Error creating statement: unknown type %u\n"
	.text
	.globl	create_statement
	.type	create_statement, @function
create_statement:
	pushq	%r15
	movq	%rdx, %r15
	pushq	%r14
	movq	%r8, %r14
	pushq	%r13
	movq	%rcx, %r13
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	movq	%r9, %rbp
	pushq	%rbx
	movl	%edi, %ebx
	movl	$16, %edi
	pushq	%r10
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%ebx, 8(%rax)
	testl	%ebx, %ebx
	jne	.L80
	testq	%r14, %r14
	jne	.L122
.L80:
	cmpl	$1, %ebx
	jne	.L82
	testq	%rbp, %rbp
	je	.L82
	movq	%rbp, (%rax)
	jmp	.L79
.L82:
	cmpl	$2, %ebx
	jne	.L84
	testq	%r12, %r12
	je	.L84
	movq	%r12, (%rax)
	jmp	.L79
.L84:
	cmpl	$3, %ebx
	jne	.L85
	testq	%r15, %r15
	je	.L85
	movq	%r15, (%rax)
	jmp	.L79
.L85:
	cmpl	$4, %ebx
	jne	.L86
	testq	%r13, %r13
	je	.L86
	movq	%r13, (%rax)
	jmp	.L79
.L86:
	cmpl	$5, %ebx
	jne	.L87
.L122:
	movq	%r14, (%rax)
	jmp	.L79
.L87:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L88
	xorl	%ecx, %ecx
	movq	%rcx, (%rax)
	jmp	.L79
.L88:
	orq	%r15, %r13
	movq	stderr(%rip), %rdi
	orq	%r13, %r12
	orq	%r12, %rbp
	orq	%r14, %rbp
	jne	.L89
	movq	%rdi, %rsi
	leaq	.LC9(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	jmp	.L90
.L89:
	movl	%ebx, %ecx
	leaq	.LC10(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L90:
	xorl	%eax, %eax
.L79:
	popq	%rdx
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	create_statement, .-create_statement
	.section	.rodata.str1.1
.LC11:
	.string	"Error creating if statement: condition is NULL\n"
	.text
	.globl	create_if
	.type	create_if, @function
create_if:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	pushq	%r8
	testq	%rdi, %rdi
	jne	.L124
	movq	stderr(%rip), %rsi
	leaq	.LC11(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L123
.L124:
	movq	%rdi, %rbx
	movq	%rsi, %r13
	movq	%rdx, %r12
	movq	%rcx, %rbp
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%r13, 8(%rax)
	movq	%r12, 16(%rax)
	movq	%rbp, 24(%rax)
.L123:
	popq	%rdx
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	create_if, .-create_if
	.section	.rodata.str1.1
.LC12:
	.string	"Error creating else-if statement: condition is NULL\n"
	.text
	.globl	create_else_if
	.type	create_else_if, @function
create_else_if:
	pushq	%rbp
	pushq	%rbx
	pushq	%rcx
	testq	%rdi, %rdi
	jne	.L128
	movq	stderr(%rip), %rsi
	leaq	.LC12(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L127
.L128:
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
.L127:
	popq	%rdx
	popq	%rbx
	popq	%rbp
	ret
	.size	create_else_if, .-create_else_if
	.globl	create_for
	.type	create_for, @function
create_for:
	pushq	%r13
	movq	%rdi, %r13
	movl	$32, %edi
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rbx
	movq	%rcx, %rbx
	pushq	%rax
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, (%rax)
	movq	%r12, 8(%rax)
	movq	%rbp, 16(%rax)
	movq	%rbx, 24(%rax)
	popq	%rdx
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	create_for, .-create_for
	.globl	create_while
	.type	create_while, @function
create_while:
	pushq	%rbp
	movq	%rdi, %rbp
	movl	$16, %edi
	pushq	%rbx
	movq	%rsi, %rbx
	pushq	%rax
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, (%rax)
	movq	%rbx, 8(%rax)
	popq	%rdx
	popq	%rbx
	popq	%rbp
	ret
	.size	create_while, .-create_while
	.section	.rodata.str1.1
.LC13:
	.string	"true"
.LC14:
	.string	"false"
.LC15:
	.string	"Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n"
.LC16:
	.string	"Error creating expression: both expr_left and prim_left are NULL\n"
	.text
	.globl	create_expression
	.type	create_expression, @function
create_expression:
	cmpl	$19, %edi
	pushq	%r13
	movl	%edi, %r13d
	pushq	%r12
	movq	%rdx, %r12
	sete	%dl
	testq	%rcx, %rcx
	sete	%al
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rbx
	movq	%rsi, %rbx
	pushq	%r9
	cmpb	%al, %dl
	jne	.L136
	movq	%r12, %rax
	orq	%rsi, %rax
	jne	.L153
	jmp	.L155
.L136:
	leaq	.LC14(%rip), %r9
	leaq	.LC13(%rip), %rdx
	testq	%rcx, %rcx
	movq	%r9, %rax
	cmove	%rdx, %rax
	testq	%r12, %r12
	cmove	%rdx, %r9
.L140:
	testq	%rbx, %rbx
	leaq	.LC14(%rip), %r8
	leaq	.LC13(%rip), %rdx
	cmove	%rdx, %r8
	jmp	.L141
.L155:
	leaq	.LC14(%rip), %rax
	leaq	.LC13(%rip), %r9
	testq	%rcx, %rcx
	jne	.L140
	leaq	.LC13(%rip), %rax
	movq	%rax, %r9
	movq	%rax, %r8
.L141:
	cmpl	$19, %r13d
	leaq	.LC13(%rip), %rdx
	leaq	.LC14(%rip), %rcx
	movq	stderr(%rip), %rdi
	cmove	%rdx, %rcx
	leaq	.LC15(%rip), %rdx
	pushq	%rsi
	movl	$2, %esi
	pushq	%rax
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	popq	%rdi
	popq	%r8
	jmp	.L143
.L153:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%r13d, 24(%rax)
	testq	%rbx, %rbx
	je	.L144
	movq	%rbx, (%rax)
	jmp	.L145
.L144:
	testq	%r12, %r12
	je	.L146
	movq	%r12, 8(%rax)
	jmp	.L145
.L146:
	movq	stderr(%rip), %rsi
	leaq	.LC16(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
.L143:
	xorl	%eax, %eax
	jmp	.L135
.L145:
	movq	%rbp, 16(%rax)
.L135:
	popq	%rdx
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	create_expression, .-create_expression
	.section	.rodata.str1.1
.LC17:
	.string	"Error creating primary: value is NULL\n"
.LC18:
	.string	"Error creating primary: unknown type %u\n"
	.text
	.globl	create_primary
	.type	create_primary, @function
create_primary:
	pushq	%r14
	movq	%rcx, %r14
	pushq	%r13
	movq	%rsi, %r13
	pushq	%r12
	movq	%r8, %r12
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rbx
	movl	%edi, %ebx
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%ebx, 8(%rax)
	cmpl	$4, %ebx
	ja	.L157
	testq	%r13, %r13
	je	.L157
	movq	%r13, (%rax)
	jmp	.L156
.L157:
	cmpl	$5, %ebx
	jne	.L159
	testq	%rbp, %rbp
	je	.L159
	movq	%rbp, (%rax)
	jmp	.L156
.L159:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L161
	testq	%r14, %r14
	je	.L161
	movq	%r14, (%rax)
	jmp	.L156
.L161:
	cmpl	$8, %ebx
	jne	.L162
	testq	%r12, %r12
	je	.L162
	movq	%r12, (%rax)
	jmp	.L156
.L162:
	orq	%r14, %r12
	movq	stderr(%rip), %rdi
	orq	%r12, %rbp
	orq	%r13, %rbp
	jne	.L163
	movq	%rdi, %rsi
	leaq	.LC17(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	jmp	.L164
.L163:
	movl	%ebx, %ecx
	leaq	.LC18(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L164:
	xorl	%eax, %eax
.L156:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	create_primary, .-create_primary
	.section	.rodata.str1.1
.LC19:
	.string	"Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n"
.LC20:
	.string	"Error creating variable access: content is NULL\n"
.LC21:
	.string	"Error creating variable access: unknown type %u\n"
	.text
	.globl	create_variable_access
	.type	create_variable_access, @function
create_variable_access:
	testl	%edi, %edi
	pushq	%r15
	sete	%al
	testq	%rsi, %rsi
	pushq	%r14
	movq	%rsi, %r14
	sete	%r15b
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movl	%edi, %ebx
	pushq	%r9
	cmpb	%al, %r15b
	je	.L191
	leaq	.LC13(%rip), %rax
	testl	%edi, %edi
	leaq	.LC14(%rip), %rcx
	movq	stderr(%rip), %rdi
	movq	%rax, %r8
	leaq	.LC19(%rip), %rdx
	cmovne	%rcx, %r8
	testq	%rsi, %rsi
	movl	$2, %esi
	cmove	%rax, %rcx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L194
.L191:
	movq	%rdx, %r12
	movq	%rcx, %rbp
	movq	%r8, %r13
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	testq	%r12, %r12
	movl	%ebx, 16(%rax)
	setne	%dl
	movq	%r14, (%rax)
	testb	%r15b, %r15b
	je	.L195
	testb	%dl, %dl
	jne	.L229
.L195:
	cmpl	$1, %ebx
	jne	.L197
	testq	%r13, %r13
	je	.L197
	movq	%r13, 8(%rax)
	jmp	.L190
.L197:
	cmpl	$3, %ebx
	jne	.L199
	testq	%rbp, %rbp
	je	.L199
	movq	%rbp, 8(%rax)
	jmp	.L190
.L199:
	cmpl	$2, %ebx
	jne	.L200
	testb	%dl, %dl
	je	.L200
.L229:
	movq	%r12, 8(%rax)
	jmp	.L190
.L200:
	orq	%r13, %rbp
	movq	stderr(%rip), %rdi
	orq	%r12, %rbp
	jne	.L201
	movq	%rdi, %rsi
	leaq	.LC20(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	jmp	.L194
.L201:
	movl	%ebx, %ecx
	leaq	.LC21(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L194:
	xorl	%eax, %eax
.L190:
	popq	%rdx
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	create_variable_access, .-create_variable_access
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
