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
	.globl	create_code_member
	.type	create_code_member, @function
create_code_member:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movl	%edi, %ebp
	movq	%rsi, %r12
	movq	%rdx, %r14
	movq	%rcx, %r13
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbx
	movl	%ebp, 8(%rax)
	testl	%ebp, %ebp
	jne	.L2
	testq	%r12, %r12
	je	.L2
	movq	%r12, (%rax)
.L1:
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
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
	testq	%r13, %r13
	je	.L5
	movq	%r13, (%rbx)
	jmp	.L1
.L5:
	movq	%r13, %rcx
	orq	%r14, %rcx
	orq	%r12, %rcx
	je	.L8
	movl	%ebp, %ecx
	leaq	.LC1(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L1
.L8:
	movq	stderr(%rip), %rcx
	movl	$44, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L1
	.size	create_code_member, .-create_code_member
	.globl	create_code
	.type	create_code, @function
create_code:
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	movl	$16, %edi
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
	.globl	create_import
	.type	create_import, @function
create_import:
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbx
	testq	%rdi, %rdi
	je	.L15
	movq	%rsi, %rbp
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
.L11:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.L15:
	movq	stderr(%rip), %rcx
	movl	$36, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%rbx, %rax
	jmp	.L11
	.size	create_import, .-create_import
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"Error creating function: name or return_type is NULL\n"
	.text
	.globl	create_function_use_ptr
	.type	create_function_use_ptr, @function
create_function_use_ptr:
	testq	%rsi, %rsi
	je	.L20
	movq	%rdi, %rax
	testq	%rdx, %rdx
	je	.L20
	movq	%rsi, (%rdi)
	movq	%rdx, 8(%rdi)
	movq	%rcx, 16(%rdi)
	movq	%r8, 24(%rdi)
	movq	%r9, 32(%rdi)
	ret
.L20:
	subq	$8, %rsp
	movq	stderr(%rip), %rcx
	movl	$53, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	addq	$8, %rsp
	ret
	.size	create_function_use_ptr, .-create_function_use_ptr
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"Error creating method: name or return_type is NULL\n"
	.text
	.globl	create_method_use_ptr
	.type	create_method_use_ptr, @function
create_method_use_ptr:
	testq	%rsi, %rsi
	je	.L28
	movq	%rdi, %rax
	testq	%rdx, %rdx
	je	.L28
	movq	%rsi, (%rdi)
	movq	%rdx, 8(%rdi)
	movq	%rcx, 16(%rdi)
	movq	%r8, 24(%rdi)
	movq	%r9, 32(%rdi)
	ret
.L28:
	subq	$8, %rsp
	movq	stderr(%rip), %rcx
	movl	$51, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	addq	$8, %rsp
	ret
	.size	create_method_use_ptr, .-create_method_use_ptr
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"Error creating class member: content is NULL\n"
	.align 8
.LC6:
	.string	"Error creating class member: unknown type %u\n"
	.text
	.globl	create_class_member
	.type	create_class_member, @function
create_class_member:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movl	%edi, %ebx
	movq	%rsi, %rbp
	movq	%rdx, %r12
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%ebx, 8(%rax)
	testl	%ebx, %ebx
	jne	.L33
	testq	%rbp, %rbp
	je	.L33
	movq	%rbp, (%rax)
.L32:
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
.L33:
	cmpl	$1, %ebx
	jne	.L35
	testq	%r12, %r12
	je	.L35
	movq	%r12, (%rax)
	jmp	.L32
.L35:
	orq	%rbp, %r12
	jne	.L36
	movq	stderr(%rip), %rcx
	movl	$45, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L32
.L36:
	movl	%ebx, %ecx
	leaq	.LC6(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L32
	.size	create_class_member, .-create_class_member
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"Error creating class: name is NULL\n"
	.text
	.globl	create_class_use_ptr
	.type	create_class_use_ptr, @function
create_class_use_ptr:
	pushq	%rbx
	movq	%rsi, %rbx
	testq	%rsi, %rsi
	je	.L42
	movq	%rsi, (%rdi)
	movq	%rdx, 8(%rdi)
	movq	%rcx, 16(%rdi)
	movq	%r8, 24(%rdi)
	movq	%rdi, %rax
.L38:
	popq	%rbx
	ret
.L42:
	movq	stderr(%rip), %rcx
	movl	$35, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%rbx, %rax
	jmp	.L38
	.size	create_class_use_ptr, .-create_class_use_ptr
	.section	.rodata.str1.8
	.align 8
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
	je	.L47
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	movq	%rdx, %r12
	testq	%rsi, %rsi
	je	.L47
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
	movq	%r12, 16(%rax)
.L43:
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
.L47:
	movq	stderr(%rip), %rcx
	movl	$46, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L43
	.size	create_variable, .-create_variable
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"Error creating statement: content is NULL\n"
	.align 8
.LC10:
	.string	"Error creating statement: unknown type %u\n"
	.text
	.globl	create_statement
	.type	create_statement, @function
create_statement:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movl	%edi, %ebx
	movq	%rsi, %r13
	movq	%rdx, %r14
	movq	%rcx, %r15
	movq	%r8, %rbp
	movq	%r9, %r12
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%ebx, 8(%rax)
	testl	%ebx, %ebx
	jne	.L50
	testq	%rbp, %rbp
	je	.L50
	movq	%rbp, (%rax)
.L49:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L50:
	cmpl	$1, %ebx
	jne	.L52
	testq	%r12, %r12
	je	.L52
	movq	%r12, (%rax)
	jmp	.L49
.L52:
	cmpl	$2, %ebx
	jne	.L53
	testq	%r13, %r13
	je	.L53
	movq	%r13, (%rax)
	jmp	.L49
.L53:
	cmpl	$3, %ebx
	jne	.L54
	testq	%r14, %r14
	je	.L54
	movq	%r14, (%rax)
	jmp	.L49
.L54:
	cmpl	$4, %ebx
	jne	.L55
	testq	%r15, %r15
	je	.L55
	movq	%r15, (%rax)
	jmp	.L49
.L55:
	cmpl	$5, %ebx
	je	.L60
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L57
	movq	$0, (%rax)
	jmp	.L49
.L60:
	movq	%rbp, (%rax)
	jmp	.L49
.L57:
	orq	%r14, %r15
	orq	%r15, %r13
	orq	%r13, %r12
	orq	%rbp, %r12
	je	.L61
	movl	%ebx, %ecx
	leaq	.LC10(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L49
.L61:
	movq	stderr(%rip), %rcx
	movl	$42, %edx
	movl	$1, %esi
	leaq	.LC9(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L49
	.size	create_statement, .-create_statement
	.section	.rodata.str1.8
	.align 8
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
	subq	$8, %rsp
	movq	%rdi, %rbx
	testq	%rdi, %rdi
	je	.L66
	movq	%rsi, %r12
	movq	%rdx, %rbp
	movq	%rcx, %r13
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%r12, 8(%rax)
	movq	%rbp, 16(%rax)
	movq	%r13, 24(%rax)
.L62:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L66:
	movq	stderr(%rip), %rcx
	movl	$47, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%rbx, %rax
	jmp	.L62
	.size	create_if, .-create_if
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"Error creating else-if statement: condition is NULL\n"
	.text
	.globl	create_else_if
	.type	create_else_if, @function
create_else_if:
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbx
	testq	%rdi, %rdi
	je	.L71
	movq	%rsi, %rbp
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
.L67:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.L71:
	movq	stderr(%rip), %rcx
	movl	$52, %edx
	movl	$1, %esi
	leaq	.LC12(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%rbx, %rax
	jmp	.L67
	.size	create_else_if, .-create_else_if
	.globl	create_for
	.type	create_for, @function
create_for:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %r13
	movq	%rsi, %r12
	movq	%rdx, %rbp
	movq	%rcx, %rbx
	movl	$32, %edi
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
	.globl	create_while
	.type	create_while, @function
create_while:
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	movl	$16, %edi
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
	.globl	create_expression
	.type	create_expression, @function
create_expression:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movl	%edi, %ebx
	movq	%rsi, %rbp
	movq	%rdx, %r13
	movq	%rcx, %r12
	cmpl	$19, %edi
	sete	%dl
	testq	%rcx, %rcx
	sete	%al
	cmpb	%al, %dl
	jne	.L77
	movq	%r13, %rax
	orq	%rsi, %rax
	je	.L95
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%ebx, 24(%rax)
	testq	%rbp, %rbp
	je	.L85
	movq	%rbp, (%rax)
.L86:
	movq	%r12, 16(%rax)
	jmp	.L76
.L77:
	testq	%rcx, %rcx
	leaq	.LC13(%rip), %rax
	leaq	.LC14(%rip), %rdx
	cmovne	%rdx, %rax
	testq	%r13, %r13
	movq	%rdx, %r9
	leaq	.LC13(%rip), %rdx
	cmove	%rdx, %r9
.L81:
	testq	%rbp, %rbp
	leaq	.LC14(%rip), %r8
	leaq	.LC13(%rip), %rdx
	cmove	%rdx, %r8
.L82:
	cmpl	$19, %ebx
	leaq	.LC14(%rip), %rcx
	leaq	.LC13(%rip), %rdx
	cmove	%rdx, %rcx
	subq	$8, %rsp
	pushq	%rax
	leaq	.LC15(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	addq	$16, %rsp
	movl	$0, %eax
.L76:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L85:
	testq	%r13, %r13
	je	.L87
	movq	%r13, 8(%rax)
	jmp	.L86
.L87:
	movq	stderr(%rip), %rcx
	movl	$65, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	%r13, %rax
	jmp	.L76
.L95:
	leaq	.LC14(%rip), %rax
	leaq	.LC13(%rip), %r9
	testq	%rcx, %rcx
	jne	.L81
	leaq	.LC13(%rip), %rax
	movq	%rax, %r9
	movq	%rax, %r8
	jmp	.L82
	.size	create_expression, .-create_expression
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"Error creating primary: value is NULL\n"
	.align 8
.LC18:
	.string	"Error creating primary: unknown type %u\n"
	.text
	.globl	create_primary
	.type	create_primary, @function
create_primary:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movl	%edi, %ebx
	movq	%rsi, %rbp
	movq	%rdx, %r12
	movq	%rcx, %r14
	movq	%r8, %r13
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%ebx, 8(%rax)
	cmpl	$4, %ebx
	ja	.L97
	testq	%rbp, %rbp
	je	.L97
	movq	%rbp, (%rax)
.L96:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L97:
	cmpl	$5, %ebx
	jne	.L99
	testq	%r12, %r12
	je	.L99
	movq	%r12, (%rax)
	jmp	.L96
.L99:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L100
	testq	%r14, %r14
	jne	.L104
.L100:
	cmpl	$8, %ebx
	jne	.L101
	testq	%r13, %r13
	je	.L101
	movq	%r13, (%rax)
	jmp	.L96
.L104:
	movq	%r14, (%rax)
	jmp	.L96
.L101:
	orq	%r14, %r13
	orq	%r13, %r12
	orq	%rbp, %r12
	jne	.L102
	movq	stderr(%rip), %rcx
	movl	$38, %edx
	movl	$1, %esi
	leaq	.LC17(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L96
.L102:
	movl	%ebx, %ecx
	leaq	.LC18(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L96
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
	.globl	create_variable_access
	.type	create_variable_access, @function
create_variable_access:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movl	%edi, %ebx
	movq	%rsi, %rbp
	testl	%edi, %edi
	sete	%r15b
	testq	%rsi, %rsi
	sete	%al
	cmpb	%r15b, %al
	jne	.L118
	movq	%rdx, %r12
	movq	%rcx, %r14
	movq	%r8, %r13
	movl	$24, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	%ebx, 16(%rax)
	movq	%rbp, (%rax)
	testq	%r12, %r12
	setne	%dl
	testb	%r15b, %r15b
	je	.L110
	testb	%dl, %dl
	je	.L110
	movq	%r12, 8(%rax)
	jmp	.L105
.L118:
	testl	%edi, %edi
	leaq	.LC14(%rip), %r8
	leaq	.LC13(%rip), %rax
	cmove	%rax, %r8
	testq	%rsi, %rsi
	leaq	.LC14(%rip), %rcx
	cmove	%rax, %rcx
	leaq	.LC19(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %eax
.L105:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L110:
	cmpl	$1, %ebx
	jne	.L111
	testq	%r13, %r13
	je	.L111
	movq	%r13, 8(%rax)
	jmp	.L105
.L111:
	cmpl	$3, %ebx
	jne	.L112
	testq	%r14, %r14
	je	.L112
	movq	%r14, 8(%rax)
	jmp	.L105
.L112:
	cmpl	$2, %ebx
	jne	.L113
	testb	%dl, %dl
	je	.L113
	movq	%r12, 8(%rax)
	jmp	.L105
.L113:
	orq	%r13, %r14
	orq	%r12, %r14
	je	.L119
	movl	%ebx, %ecx
	leaq	.LC21(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L105
.L119:
	movq	stderr(%rip), %rcx
	movl	$48, %edx
	movl	$1, %esi
	leaq	.LC20(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L105
	.size	create_variable_access, .-create_variable_access
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
