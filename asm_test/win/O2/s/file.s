	.file	"D:\\TC\\src\\file.c"
	.text
	.p2align 4
	.globl	get_cwd
	.def	get_cwd;	.scl	2;	.type	32;	.endef
get_cwd:
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	jmp	getcwd
	.section .rdata,"dr"
.LC0:
	.ascii "\0"
.LC1:
	.ascii "%s/%s\0"
	.text
	.p2align 4
	.globl	absolute_path
	.def	absolute_path;	.scl	2;	.type	32;	.endef
absolute_path:
	pushq	%r13
	pushq	%r12
	leaq	.LC0(%rip), %r12
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$40, %rsp
	.p2align 4,,10
	.p2align 3
.L23:
	movq	%rbx, %rcx
	call	strlen
	movq	%rbx, %rcx
	xorl	%ebx, %ebx
	movq	%rax, %rdx
	call	create_string_not_check
	movq	%rax, %rcx
	movq	%rax, %rsi
	call	strlen
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L4
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L6:
	cmpq	$1, %rbx
	jbe	.L11
	leaq	1(%rbx), %rdx
	cmpb	$47, %cl
	je	.L12
.L28:
	movq	%rdx, %rbx
.L13:
	cmpq	%rdi, %rbx
	jnb	.L44
.L4:
	leaq	(%rsi,%rbx), %r10
	movzbl	(%r10), %ecx
	cmpb	$92, %cl
	jne	.L6
	movb	$47, (%r10)
	cmpq	$1, %rbx
	jbe	.L11
	leaq	1(%rbx), %rdx
.L12:
	leaq	-1(%rsi,%rbx), %rcx
	movzbl	(%rcx), %eax
	cmpb	$46, %al
	je	.L45
.L9:
	cmpb	$47, %al
	jne	.L28
	movq	%rdi, %r8
	addq	%rsi, %rdx
	movq	%r10, %rcx
	subq	$1, %rdi
	subq	%rbx, %r8
	call	memmove
	cmpq	%rdi, %rbx
	jb	.L4
	.p2align 4,,10
	.p2align 3
.L44:
	cmpq	$2, %rdi
	jbe	.L15
	movzbl	(%rsi), %eax
	cmpb	$47, %al
	je	.L46
	subl	$65, %eax
	cmpb	$25, %al
	ja	.L5
.L24:
	cmpb	$58, 1(%rsi)
	je	.L3
.L5:
	testq	%rbp, %rbp
	je	.L47
.L22:
	movq	%rbp, %rcx
	call	strlen
	movq	%r12, %rcx
	leaq	2(%rdi,%rax), %rdi
	movq	%rdi, %rdx
	call	create_string_not_check
	movq	%rbp, %r8
	movq	%rsi, %r9
	xorl	%ebp, %ebp
	movq	%rax, %rbx
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	call	create_string
	movq	%rax, %rbx
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L45:
	cmpb	$47, -2(%rsi,%rbx)
	leaq	-2(%rbx), %r13
	jne	.L28
	movq	%rdi, %r8
	addq	%rsi, %rdx
	subq	$2, %rdi
	subq	%rbx, %r8
	movq	%r13, %rbx
	call	memmove
	.p2align 4,,10
	.p2align 3
.L11:
	testq	%rbx, %rbx
	jne	.L48
	movl	$1, %ebx
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L15:
	je	.L49
	testq	%rdi, %rdi
	jne	.L50
.L21:
	xorl	%edi, %edi
	testq	%rbp, %rbp
	jne	.L22
.L47:
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	getcwd
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L22
.L3:
	addq	$40, %rsp
	movq	%rsi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L50:
	movzbl	(%rsi), %eax
.L19:
	cmpb	$47, %al
	jne	.L5
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L46:
	movzbl	1(%rsi), %eax
	leal	-97(%rax), %edx
	cmpb	$25, %dl
	ja	.L3
	cmpb	$47, 2(%rsi)
	jne	.L3
	subl	$32, %eax
	movb	$58, 1(%rsi)
	movb	%al, (%rsi)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L49:
	movzbl	(%rsi), %eax
	leal	-65(%rax), %edx
	cmpb	$25, %dl
	jbe	.L24
	jmp	.L19
.L48:
	leaq	(%rsi,%rbx), %r10
	leaq	1(%rbx), %rdx
	cmpb	$47, (%r10)
	jne	.L28
	movzbl	-1(%rsi,%rbx), %eax
	jmp	.L9
	.section .rdata,"dr"
.LC2:
	.ascii "/\0"
	.align 8
.LC3:
	.ascii "Warning: Path component too long, truncating to %zu characters\12\0"
.LC4:
	.ascii ".\0"
.LC5:
	.ascii "..\0"
	.text
	.p2align 4
	.globl	create_file
	.def	create_file;	.scl	2;	.type	32;	.endef
create_file:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	xorl	%r13d, %r13d
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	xorl	%esi, %esi
	pushq	%rbx
	movq	%rcx, %rbx
	movl	$32, %ecx
	andq	$-16, %rsp
	subq	$304, %rsp
	call	alloc_memory
	xorl	%edx, %edx
	movq	%rbx, %rcx
	movq	%rax, %rdi
	call	absolute_path
	movq	%rax, 24(%rdi)
	movq	%rax, %rcx
	call	strlen
	leaq	.LC0(%rip), %rcx
	leaq	1(%rax), %rdx
	movq	%rax, %r12
	call	create_string_not_check
	movq	24(%rdi), %rdx
	movq	%rax, %rcx
	movq	%rax, %r14
	call	strcpy
	testq	%r12, %r12
	je	.L52
	cmpb	$47, (%r14)
	je	.L119
.L52:
	leaq	48(%rsp), %rax
	movq	%r13, %rbx
	movq	%rsi, %r15
	movq	%rax, 32(%rsp)
	jmp	.L69
	.p2align 4,,10
	.p2align 3
.L56:
	cmpq	%rsi, %r12
	jb	.L55
.L69:
	movq	%rsi, %rdx
	addq	$1, %rsi
	cmpq	%rdx, %r12
	je	.L120
	cmpb	$47, (%r14,%rdx)
	jne	.L56
	cmpq	%rdx, %r15
	jnb	.L57
.L54:
	subq	%r15, %rdx
	movq	%rdx, %r8
	cmpq	$255, %rdx
	ja	.L121
.L58:
	leaq	(%r14,%r15), %rdx
	movq	32(%rsp), %r15
	movq	%r8, 40(%rsp)
	movq	%r15, %rcx
	call	strncpy
	movq	40(%rsp), %r8
	movb	$0, 48(%rsp,%r8)
	cmpw	$46, (%r15)
	je	.L57
	cmpw	$11822, (%r15)
	je	.L122
.L62:
	cmpb	$0, 48(%rsp)
	jne	.L123
	.p2align 4,,10
	.p2align 3
.L57:
	movq	%rsi, %r15
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L120:
	cmpq	%r12, %r15
	jb	.L54
.L55:
	movq	%rbx, (%rdi)
	testq	%r13, %r13
	je	.L70
	movq	0(%r13), %r13
	movl	$46, %edx
	movq	%r13, %rcx
	call	strrchr
	movq	%rax, %rsi
	cmpq	%rax, %r13
	je	.L70
	testq	%rax, %rax
	je	.L70
	movq	%rax, %rdx
	movq	%r13, %rcx
	subq	%r13, %rdx
	call	create_string
	movq	%rsi, %rcx
	movq	%rax, 16(%rdi)
	call	strlen
	movq	%rsi, %rcx
	movq	%rax, %rdx
	call	create_string
	movq	%rax, 8(%rdi)
	testq	%rbx, %rbx
	je	.L72
.L125:
	movq	%rbx, %rsi
	xorl	%r14d, %r14d
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L73:
	movq	(%rsi), %rcx
	addq	$1, %r14
	call	strlen
	movq	8(%rsi), %rsi
	addq	%rax, %r12
	testq	%rsi, %rsi
	jne	.L73
	leaq	1(%r12), %rax
	leaq	(%r12,%r14), %rdx
	cmpq	$1, %r14
	cmovbe	%rax, %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string_not_check
	movb	$0, (%rax)
	movq	(%rbx), %rsi
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L79:
	movq	%r12, %rcx
	call	strlen
	movq	%rsi, %rdx
	leaq	(%r12,%rax), %rcx
	call	stpcpy
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L75
	movq	(%rbx), %rsi
	cmpb	$47, (%rsi)
	je	.L124
.L82:
	cmpb	$0, (%r12)
	je	.L79
	cmpb	$47, -1(%rax)
	je	.L79
	movl	$47, %edx
	movw	%dx, (%rax)
	movq	(%rbx), %rsi
	jmp	.L79
	.p2align 4,,10
	.p2align 3
.L121:
	call	__getreent
	movl	$255, %r8d
	leaq	.LC3(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	movl	$255, %r8d
	jmp	.L58
	.p2align 4,,10
	.p2align 3
.L70:
	xorl	%eax, %eax
	movq	%r13, 16(%rdi)
	movq	%rax, 8(%rdi)
	testq	%rbx, %rbx
	jne	.L125
.L72:
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	call	create_string_not_check
	movb	$0, (%rax)
	movq	%rax, %r12
.L75:
	movq	%r12, %rcx
	call	strlen
	movq	%r12, %rcx
	movq	%rax, %rdx
	call	create_string
	movq	%rax, 24(%rdi)
	leaq	-56(%rbp), %rsp
	movq	%rdi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L124:
	cmpb	$0, 1(%rsi)
	je	.L79
	jmp	.L82
	.p2align 4,,10
	.p2align 3
.L122:
	movq	32(%rsp), %rax
	cmpb	$0, 2(%rax)
	jne	.L62
	testq	%r13, %r13
	je	.L65
	cmpq	%rbx, %r13
	je	.L65
	movq	0(%r13), %rax
	cmpb	$46, (%rax)
	je	.L126
.L85:
	movq	%rbx, %rax
	jmp	.L67
	.p2align 4,,10
	.p2align 3
.L86:
	movq	%rdx, %rax
.L67:
	testq	%rax, %rax
	je	.L57
	movq	8(%rax), %rdx
	cmpq	%r13, %rdx
	jne	.L86
	movq	$0, 8(%rax)
	movq	%rax, %r13
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L119:
	movl	$16, %ecx
	movl	$1, %esi
	call	alloc_memory
	movl	$1, %edx
	leaq	.LC2(%rip), %rcx
	movq	%rax, %r13
	call	create_string
	movq	$0, 8(%r13)
	movq	%rax, 0(%r13)
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L65:
	testq	%rbx, %rbx
	jne	.L57
	movl	$16, %ecx
	call	alloc_memory
	movl	$2, %edx
	leaq	.LC5(%rip), %rcx
	movq	%rax, %rbx
	call	create_string
	movq	%rbx, %r13
	movq	$0, 8(%rbx)
	movq	%rax, (%rbx)
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L123:
	movl	$16, %ecx
	movq	%r8, 40(%rsp)
	call	alloc_memory
	movq	40(%rsp), %rdx
	movq	32(%rsp), %rcx
	movq	%rax, %r15
	call	create_string
	movq	$0, 8(%r15)
	movq	%rax, (%r15)
	testq	%r13, %r13
	je	.L68
	movq	%r15, 8(%r13)
.L68:
	movq	%r15, %r13
	testq	%rbx, %rbx
	jne	.L57
	movq	%r15, %rbx
	movq	%r15, %r13
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L126:
	cmpb	$46, 1(%rax)
	jne	.L85
	cmpb	$0, 2(%rax)
	jne	.L85
	movl	$16, %ecx
	call	alloc_memory
	movl	$2, %edx
	leaq	.LC5(%rip), %rcx
	movq	%rax, %r15
	call	create_string
	movq	$0, 8(%r15)
	movq	%rax, (%r15)
	movq	%r15, 8(%r13)
	movq	%r15, %r13
	jmp	.L57
	.p2align 4
	.globl	get_file_name
	.def	get_file_name;	.scl	2;	.type	32;	.endef
get_file_name:
	movq	16(%rcx), %rax
	ret
	.p2align 4
	.globl	get_file_extension
	.def	get_file_extension;	.scl	2;	.type	32;	.endef
get_file_extension:
	movq	8(%rcx), %rax
	ret
	.p2align 4
	.globl	get_file_dir
	.def	get_file_dir;	.scl	2;	.type	32;	.endef
get_file_dir:
	movq	(%rcx), %rdx
	testq	%rdx, %rdx
	je	.L156
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rdi
	xorl	%edi, %edi
	pushq	%rsi
	xorl	%esi, %esi
	pushq	%rbx
	subq	$40, %rsp
	movq	8(%rdx), %rbx
	testq	%rbx, %rbx
	je	.L129
	.p2align 4,,10
	.p2align 3
.L131:
	movq	(%rdx), %rcx
	addq	$1, %rdi
	call	strlen
	movq	%rbx, %rdx
	addq	%rax, %rsi
	movq	8(%rbx), %rax
	testq	%rax, %rax
	je	.L160
	movq	%rax, %rbx
	jmp	.L131
	.p2align 4,,10
	.p2align 3
.L160:
	testq	%rdi, %rdi
	je	.L129
	leaq	1(%rsi), %rax
	leaq	(%rsi,%rdi), %rdx
	cmpq	$1, %rdi
	cmove	%rax, %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string_not_check
	movb	$0, (%rax)
	movq	0(%rbp), %rbx
	movq	%rax, %rsi
	testq	%rbx, %rbx
	je	.L137
	cmpq	$0, 8(%rbx)
	je	.L137
.L159:
	movq	(%rbx), %rdi
.L139:
	movq	%rsi, %rcx
	call	strlen
	movq	%rdi, %rdx
	leaq	(%rsi,%rax), %rcx
	call	stpcpy
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L137
	cmpq	$0, 8(%rbx)
	je	.L137
	movq	(%rbx), %rdi
	cmpb	$47, (%rdi)
	je	.L161
.L142:
	cmpb	$0, (%rsi)
	je	.L139
	cmpb	$47, -1(%rax)
	je	.L139
	movl	$47, %edx
	movw	%dx, (%rax)
	jmp	.L159
	.p2align 4,,10
	.p2align 3
.L137:
	movq	%rsi, %rcx
	call	strlen
	addq	$40, %rsp
	movq	%rsi, %rcx
	popq	%rbx
	movq	%rax, %rdx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	create_string
	.p2align 4,,10
	.p2align 3
.L161:
	cmpb	$0, 1(%rdi)
	je	.L139
	jmp	.L142
.L129:
	addq	$40, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L156:
	xorl	%eax, %eax
	ret
	.section .rdata,"dr"
.LC6:
	.ascii "%s/%s%s\0"
.LC7:
	.ascii "%s%s\0"
	.text
	.p2align 4
	.def	rebuild_full_path;	.scl	3;	.type	32;	.endef
rebuild_full_path:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$56, %rsp
	call	get_file_dir
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L163
	movq	%rax, %rcx
	movq	%rsi, %r13
	leaq	.LC0(%rip), %r12
	call	strlen
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rbp
	movq	%rax, %rdi
	call	strlen
	addq	%rdi, %rax
	leaq	1(%rax), %rdi
	testq	%rbp, %rbp
	je	.L174
.L170:
	movq	%rbp, %rcx
	call	strlen
	movq	%r12, %rcx
	leaq	1(%rdi,%rax), %rdx
	call	create_string_not_check
	movq	%rax, %rdi
	testq	%rsi, %rsi
	je	.L166
	cmpb	$0, 0(%r13)
	jne	.L175
.L166:
	movq	16(%rbx), %r8
	movq	%rbp, %r9
	leaq	.LC7(%rip), %rdx
	movq	%rdi, %rcx
	call	sprintf
.L167:
	movq	%rdi, %rcx
	call	strlen
	movq	%rdi, %rcx
	movq	%rax, %rdx
	call	create_string
	movq	%rax, 24(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L174:
	leaq	2(%rax), %rdx
	movq	%r12, %rcx
	movq	%r12, %rbp
	call	create_string_not_check
	cmpb	$0, 0(%r13)
	movq	%rax, %rdi
	je	.L166
.L175:
	movq	%rbp, 32(%rsp)
	movq	16(%rbx), %r9
	movq	%r13, %r8
	movq	%rdi, %rcx
	leaq	.LC6(%rip), %rdx
	call	sprintf
	jmp	.L167
	.p2align 4,,10
	.p2align 3
.L163:
	movq	8(%rbx), %rbp
	movq	16(%rbx), %rcx
	call	strlen
	testq	%rbp, %rbp
	je	.L169
	leaq	.LC0(%rip), %r12
	leaq	1(%rax), %rdi
	movq	%r12, %r13
	jmp	.L170
	.p2align 4,,10
	.p2align 3
.L169:
	leaq	.LC0(%rip), %rbp
	leaq	2(%rax), %rdx
	movq	%rbp, %rcx
	call	create_string_not_check
	movq	%rax, %rdi
	jmp	.L166
	.p2align 4
	.globl	get_full_path
	.def	get_full_path;	.scl	2;	.type	32;	.endef
get_full_path:
	movq	24(%rcx), %rax
	ret
	.p2align 4
	.globl	change_file_extension
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
change_file_extension:
	movq	%rdx, 8(%rcx)
	jmp	rebuild_full_path
	.p2align 4
	.globl	change_file_name
	.def	change_file_name;	.scl	2;	.type	32;	.endef
change_file_name:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	(%rcx), %rax
	movq	%rdx, 16(%rcx)
	testq	%rax, %rax
	je	.L180
	.p2align 4,,10
	.p2align 3
.L179:
	movq	%rax, %rbx
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L179
	movq	%rdi, %rcx
	movq	8(%rsi), %r12
	call	strlen
	movq	%rax, %rbp
	testq	%r12, %r12
	je	.L183
	movq	%r12, %rcx
	call	strlen
	leaq	.LC0(%rip), %rcx
	addq	%rax, %rbp
.L181:
	leaq	1(%rbp), %rdx
	call	create_string_not_check
	movq	%r12, %r9
	movq	%rdi, %r8
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rbp
	movq	%rax, %rcx
	call	sprintf
	movq	%rbp, %rcx
	call	strlen
	movq	%rbp, %rcx
	movq	%rax, %rdx
	call	create_string
	movq	%rax, (%rbx)
.L180:
	addq	$32, %rsp
	movq	%rsi, %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	rebuild_full_path
	.p2align 4,,10
	.p2align 3
.L183:
	leaq	.LC0(%rip), %rcx
	movq	%rcx, %r12
	jmp	.L181
	.ident	"GCC: (GNU) 13.2.0"
	.def	getcwd;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	stpcpy;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
