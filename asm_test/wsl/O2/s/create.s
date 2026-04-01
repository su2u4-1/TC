	.file	"create.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Error creating code member: content is NULL\n"
	.align 8
.LC1:
	.string	"Error creating code member: unknown type %u\n"
	.text
	.p2align 4
	.globl	create_code_member
	.type	create_code_member, @function
create_code_member:
	pushq	%r13
	movq	%rcx, %r13
	pushq	%r12
	movq	%rdx, %r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movl	%edi, %ebx
	movl	$16, %edi
	subq	$8, %rsp
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%ebx, 8(%rax)
	testl	%ebx, %ebx
	jne	.L2
	testq	%rbp, %rbp
	je	.L2
	movq	%rbp, (%rax)
.L1:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L2:
	cmpl	$1, %ebx
	jne	.L4
	testq	%r12, %r12
	je	.L4
	movq	%r12, (%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	cmpl	$2, %ebx
	jne	.L6
	testq	%r13, %r13
	je	.L6
	movq	%r13, (%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	movq	%r13, %rcx
	movq	stderr(%rip), %rdi
	orq	%r12, %rcx
	orq	%rcx, %rbp
	je	.L29
	movl	%ebx, %ecx
	leaq	.LC1(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L1
.L29:
	movq	%rdi, %rcx
	movl	$44, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L1
	.size	create_code_member, .-create_code_member
	.p2align 4
	.globl	create_code
	.type	create_code, @function
create_code:
	pushq	%rbp
	movq	%rdi, %rbp
	movl	$16, %edi
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$8, %rsp
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, (%rax)
	movq	%rbx, 8(%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.size	create_code, .-create_code
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"Error creating import: name is NULL\n"
	.text
	.p2align 4
	.globl	create_import
	.type	create_import, @function
create_import:
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	testq	%rdi, %rdi
	je	.L36
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
.L32:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L36:
	movq	stderr(%rip), %rcx
	movl	$36, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L32
	.size	create_import, .-create_import
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"Error creating function: name or return_type is NULL\n"
	.text
	.p2align 4
	.globl	create_function_use_ptr
	.type	create_function_use_ptr, @function
create_function_use_ptr:
	testq	%rsi, %rsi
	je	.L41
	testq	%rdx, %rdx
	je	.L41
	movq	%rsi, (%rdi)
	movq	%rdi, %rax
	movq	%rdx, 8(%rdi)
	movq	%rcx, 16(%rdi)
	movq	%r8, 24(%rdi)
	movq	%r9, 32(%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L41:
	subq	$8, %rsp
	movl	$53, %edx
	movq	stderr(%rip), %rcx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	xorl	%eax, %eax
	addq	$8, %rsp
	ret
	.size	create_function_use_ptr, .-create_function_use_ptr
	.p2align 4
	.globl	create_function
	.type	create_function, @function
create_function:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	testq	%rdi, %rdi
	je	.L49
	movq	%rsi, %rbp
	testq	%rsi, %rsi
	je	.L49
	movq	%rdi, %rbx
	movq	%rdx, %r14
	movq	%rcx, %r13
	movq	%r8, %r12
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
	movq	%r14, 16(%rax)
	movq	%r13, 24(%rax)
	movq	%r12, 32(%rax)
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L49:
	movq	stderr(%rip), %rcx
	movl	$53, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	popq	%rbx
	xorl	%eax, %eax
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	create_function, .-create_function
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"Error creating method: name or return_type is NULL\n"
	.text
	.p2align 4
	.globl	create_method_use_ptr
	.type	create_method_use_ptr, @function
create_method_use_ptr:
	testq	%rsi, %rsi
	je	.L55
	testq	%rdx, %rdx
	je	.L55
	movq	%rsi, (%rdi)
	movq	%rdi, %rax
	movq	%rdx, 8(%rdi)
	movq	%rcx, 16(%rdi)
	movq	%r8, 24(%rdi)
	movq	%r9, 32(%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L55:
	subq	$8, %rsp
	movl	$51, %edx
	movq	stderr(%rip), %rcx
	movl	$1, %esi
	leaq	.LC4(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	xorl	%eax, %eax
	addq	$8, %rsp
	ret
	.size	create_method_use_ptr, .-create_method_use_ptr
	.p2align 4
	.globl	create_method
	.type	create_method, @function
create_method:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	testq	%rdi, %rdi
	je	.L63
	movq	%rsi, %rbp
	testq	%rsi, %rsi
	je	.L63
	movq	%rdi, %rbx
	movq	%rdx, %r14
	movq	%rcx, %r13
	movq	%r8, %r12
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
	movq	%r14, 16(%rax)
	movq	%r13, 24(%rax)
	movq	%r12, 32(%rax)
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L63:
	movq	stderr(%rip), %rcx
	movl	$51, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	popq	%rbx
	xorl	%eax, %eax
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	create_method, .-create_method
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"Error creating class member: content is NULL\n"
	.align 8
.LC6:
	.string	"Error creating class member: unknown type %u\n"
	.text
	.p2align 4
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
	jne	.L66
	testq	%rbp, %rbp
	je	.L66
	movq	%rbp, (%rax)
.L65:
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L66:
	cmpl	$1, %ebx
	jne	.L68
	testq	%r12, %r12
	je	.L68
	movq	%r12, (%rax)
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L68:
	orq	%r12, %rbp
	movq	stderr(%rip), %rdi
	jne	.L70
	movq	%rdi, %rcx
	movl	$45, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L65
	.p2align 4,,10
	.p2align 3
.L70:
	movl	%ebx, %ecx
	leaq	.LC6(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L65
	.size	create_class_member, .-create_class_member
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"Error creating class: name is NULL\n"
	.text
	.p2align 4
	.globl	create_class_use_ptr
	.type	create_class_use_ptr, @function
create_class_use_ptr:
	testq	%rsi, %rsi
	je	.L92
	movq	%rsi, (%rdi)
	movq	%rdi, %rax
	movq	%rdx, 8(%rdi)
	movq	%rcx, 16(%rdi)
	movq	%r8, 24(%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L92:
	subq	$8, %rsp
	movl	$35, %edx
	movq	stderr(%rip), %rcx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	xorl	%eax, %eax
	addq	$8, %rsp
	ret
	.size	create_class_use_ptr, .-create_class_use_ptr
	.p2align 4
	.globl	create_class
	.type	create_class, @function
create_class:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	testq	%rdi, %rdi
	je	.L97
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
.L93:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L97:
	movq	stderr(%rip), %rcx
	movl	$35, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L93
	.size	create_class, .-create_class
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"Error creating variable: type or name is NULL\n"
	.text
	.p2align 4
	.globl	create_variable
	.type	create_variable, @function
create_variable:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	testq	%rdi, %rdi
	je	.L102
	movq	%rsi, %rbp
	testq	%rsi, %rsi
	je	.L102
	movq	%rdi, %rbx
	movq	%rdx, %r12
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
	movq	%r12, 16(%rax)
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L102:
	movq	stderr(%rip), %rcx
	movl	$46, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	popq	%rbx
	xorl	%eax, %eax
	popq	%rbp
	popq	%r12
	ret
	.size	create_variable, .-create_variable
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"Error creating statement: content is NULL\n"
	.align 8
.LC10:
	.string	"Error creating statement: unknown type %u\n"
	.text
	.p2align 4
	.globl	create_statement
	.type	create_statement, @function
create_statement:
	pushq	%r15
	movq	%r8, %r15
	pushq	%r14
	movl	%edi, %r14d
	movl	$16, %edi
	pushq	%r13
	movq	%rcx, %r13
	pushq	%r12
	movq	%rdx, %r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movq	%r9, %rbx
	subq	$8, %rsp
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%r14d, 8(%rax)
	testl	%r14d, %r14d
	jne	.L105
	testq	%r15, %r15
	je	.L105
.L147:
	movq	%r15, (%rax)
.L104:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L105:
	cmpl	$1, %r14d
	jne	.L107
	testq	%rbx, %rbx
	je	.L107
	movq	%rbx, (%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L107:
	cmpl	$2, %r14d
	jne	.L109
	testq	%rbp, %rbp
	je	.L109
	movq	%rbp, (%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L109:
	cmpl	$3, %r14d
	jne	.L110
	testq	%r12, %r12
	je	.L110
	movq	%r12, (%rax)
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L110:
	cmpl	$4, %r14d
	jne	.L111
	testq	%r13, %r13
	je	.L111
	movq	%r13, (%rax)
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L111:
	cmpl	$5, %r14d
	je	.L147
	leal	-6(%r14), %edx
	cmpl	$1, %edx
	ja	.L113
	movq	$0, (%rax)
	jmp	.L104
.L113:
	orq	%r12, %r13
	movq	stderr(%rip), %rdi
	orq	%r13, %rbp
	orq	%rbp, %rbx
	orq	%r15, %rbx
	je	.L148
	movl	%r14d, %ecx
	leaq	.LC10(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L104
.L148:
	movq	%rdi, %rcx
	movl	$42, %edx
	movl	$1, %esi
	leaq	.LC9(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L104
	.size	create_statement, .-create_statement
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"Error creating if statement: condition is NULL\n"
	.text
	.p2align 4
	.globl	create_if
	.type	create_if, @function
create_if:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	testq	%rdi, %rdi
	je	.L153
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
.L149:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L153:
	movq	stderr(%rip), %rcx
	movl	$47, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L149
	.size	create_if, .-create_if
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"Error creating else-if statement: condition is NULL\n"
	.text
	.p2align 4
	.globl	create_else_if
	.type	create_else_if, @function
create_else_if:
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	testq	%rdi, %rdi
	je	.L158
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
.L154:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L158:
	movq	stderr(%rip), %rcx
	movl	$52, %edx
	movl	$1, %esi
	leaq	.LC12(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L154
	.size	create_else_if, .-create_else_if
	.p2align 4
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
	subq	$8, %rsp
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r13, (%rax)
	movq	%r12, 8(%rax)
	movq	%rbp, 16(%rax)
	movq	%rbx, 24(%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	create_for, .-create_for
	.p2align 4
	.globl	create_while
	.type	create_while, @function
create_while:
	pushq	%rbp
	movq	%rdi, %rbp
	movl	$16, %edi
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$8, %rsp
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, (%rax)
	movq	%rbx, 8(%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.size	create_while, .-create_while
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC13:
	.string	"true"
.LC14:
	.string	"false"
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	"Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n"
	.align 8
.LC16:
	.string	"Error creating expression: both expr_left and prim_left are NULL\n"
	.text
	.p2align 4
	.globl	create_expression
	.type	create_expression, @function
create_expression:
	pushq	%r13
	movq	%rdx, %r13
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rbx
	movl	%edi, %ebx
	subq	$8, %rsp
	cmpl	$19, %edi
	sete	%dl
	testq	%rcx, %rcx
	sete	%al
	cmpb	%al, %dl
	jne	.L164
	movq	%r13, %rax
	orq	%rsi, %rax
	je	.L181
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%ebx, 24(%rax)
	testq	%r12, %r12
	je	.L171
	movq	%r12, (%rax)
.L172:
	movq	%rbp, 16(%rax)
.L163:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L181:
	leaq	.LC13(%rip), %r9
	leaq	.LC14(%rip), %rdx
	movq	%r9, %r8
	testq	%rcx, %rcx
	je	.L182
.L166:
	cmpl	$19, %ebx
	leaq	.LC13(%rip), %rax
	leaq	.LC14(%rip), %rcx
	movq	stderr(%rip), %rdi
	cmove	%rax, %rcx
	subq	$8, %rsp
	movl	$2, %esi
	xorl	%eax, %eax
	pushq	%rdx
	leaq	.LC15(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	popq	%rax
	xorl	%eax, %eax
	popq	%rdx
	jmp	.L163
	.p2align 4,,10
	.p2align 3
.L164:
	leaq	.LC13(%rip), %rax
	leaq	.LC14(%rip), %r8
	testq	%rcx, %rcx
	movq	%rax, %rdx
	movq	%rax, %r9
	cmovne	%r8, %rdx
	testq	%r13, %r13
	cmovne	%r8, %r9
	testq	%rsi, %rsi
	cmove	%rax, %r8
	jmp	.L166
	.p2align 4,,10
	.p2align 3
.L182:
	movq	%r9, %rdx
	jmp	.L166
	.p2align 4,,10
	.p2align 3
.L171:
	testq	%r13, %r13
	je	.L173
	movq	%r13, 8(%rax)
	jmp	.L172
.L173:
	movq	stderr(%rip), %rcx
	movl	$65, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L163
	.size	create_expression, .-create_expression
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"Error creating primary: value is NULL\n"
	.align 8
.LC18:
	.string	"Error creating primary: unknown type %u\n"
	.text
	.p2align 4
	.globl	create_primary
	.type	create_primary, @function
create_primary:
	pushq	%r14
	movq	%rsi, %r14
	pushq	%r13
	movq	%rcx, %r13
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
	ja	.L184
	testq	%r14, %r14
	je	.L184
	movq	%r14, (%rax)
.L183:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L184:
	cmpl	$5, %ebx
	jne	.L186
	testq	%rbp, %rbp
	je	.L186
	movq	%rbp, (%rax)
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L186:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	jbe	.L214
	cmpl	$8, %ebx
	jne	.L189
	testq	%r12, %r12
	je	.L189
	movq	%r12, (%rax)
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L214:
	testq	%r13, %r13
	je	.L189
	movq	%r13, (%rax)
	jmp	.L183
	.p2align 4,,10
	.p2align 3
.L189:
	orq	%r13, %r12
	movq	stderr(%rip), %rdi
	orq	%r12, %rbp
	orq	%r14, %rbp
	jne	.L190
	movq	%rdi, %rcx
	movl	$38, %edx
	movl	$1, %esi
	leaq	.LC17(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L183
	.p2align 4,,10
	.p2align 3
.L190:
	movl	%ebx, %ecx
	leaq	.LC18(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L183
	.size	create_primary, .-create_primary
	.section	.rodata.str1.8
	.align 8
.LC19:
	.string	"Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n"
	.align 8
.LC20:
	.string	"Error creating variable access: content is NULL\n"
	.align 8
.LC21:
	.string	"Error creating variable access: unknown type %u\n"
	.text
	.p2align 4
	.globl	create_variable_access
	.type	create_variable_access, @function
create_variable_access:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movl	%edi, %ebx
	subq	$8, %rsp
	testl	%edi, %edi
	sete	%al
	testq	%rsi, %rsi
	sete	%r15b
	cmpb	%al, %r15b
	jne	.L255
	movq	%rdx, %r12
	movq	%rcx, %r14
	movq	%r8, %r13
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	testq	%r12, %r12
	movl	%ebx, 16(%rax)
	setne	%dl
	movq	%rbp, (%rax)
	testb	%r15b, %r15b
	je	.L220
	testb	%dl, %dl
	je	.L220
.L254:
	movq	%r12, 8(%rax)
.L215:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L220:
	cmpl	$1, %ebx
	jne	.L222
	testq	%r13, %r13
	je	.L222
	movq	%r13, 8(%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L255:
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
	xorl	%eax, %eax
	jmp	.L215
	.p2align 4,,10
	.p2align 3
.L222:
	cmpl	$3, %ebx
	jne	.L224
	testq	%r14, %r14
	je	.L224
	movq	%r14, 8(%rax)
	jmp	.L215
	.p2align 4,,10
	.p2align 3
.L224:
	cmpl	$2, %ebx
	jne	.L225
	testb	%dl, %dl
	jne	.L254
.L225:
	movq	%r14, %rcx
	movq	stderr(%rip), %rdi
	orq	%r13, %rcx
	orq	%r12, %rcx
	je	.L256
	movl	%ebx, %ecx
	leaq	.LC21(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L215
.L256:
	movq	%rdi, %rcx
	movl	$48, %edx
	movl	$1, %esi
	leaq	.LC20(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	xorl	%eax, %eax
	jmp	.L215
	.size	create_variable_access, .-create_variable_access
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
