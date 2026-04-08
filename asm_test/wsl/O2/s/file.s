	.file	"file.c"
	.text
	.p2align 4
	.globl	get_cwd
	.type	get_cwd, @function
get_cwd:
	xorl	%esi, %esi
	xorl	%edi, %edi
	jmp	*getcwd@GOTPCREL(%rip)
	.size	get_cwd, .-get_cwd
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	""
.LC1:
	.string	"%s/%s"
	.text
	.p2align 4
	.globl	absolute_path
	.type	absolute_path, @function
absolute_path:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	leaq	.LC0(%rip), %r13
	pushq	%r12
	leaq	.LC1(%rip), %r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movq	%rdi, %rbx
	subq	$24, %rsp
	.p2align 4,,10
	.p2align 3
.L21:
	movq	%rbx, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rbx, %rdi
	xorl	%ebx, %ebx
	movq	%rax, %rsi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%rax, %r14
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L4
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L6:
	cmpq	$1, %rbx
	jbe	.L11
	leaq	1(%rbx), %rsi
	cmpb	$47, %dl
	je	.L12
.L25:
	movq	%rsi, %rbx
.L13:
	cmpq	%r15, %rbx
	jnb	.L38
.L4:
	leaq	(%r14,%rbx), %rdi
	movzbl	(%rdi), %edx
	cmpb	$92, %dl
	jne	.L6
	movb	$47, (%rdi)
	cmpq	$1, %rbx
	jbe	.L11
	leaq	1(%rbx), %rsi
.L12:
	leaq	-1(%r14,%rbx), %rcx
	movzbl	(%rcx), %eax
	cmpb	$46, %al
	je	.L39
.L9:
	cmpb	$47, %al
	jne	.L25
	movq	%r15, %rdx
	subq	$1, %r15
	addq	%r14, %rsi
	subq	%rbx, %rdx
	call	*memmove@GOTPCREL(%rip)
	cmpq	%r15, %rbx
	jb	.L4
	.p2align 4,,10
	.p2align 3
.L38:
	cmpq	$1, %r15
	jbe	.L15
	movzbl	(%r14), %eax
	leal	-65(%rax), %edx
	cmpb	$25, %dl
	jbe	.L40
.L16:
	cmpb	$47, %al
	je	.L3
.L5:
	testq	%rbp, %rbp
	je	.L41
.L19:
	movq	%rbp, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%r13, %rdi
	leaq	2(%r15,%rax), %r15
	movq	%r15, %rsi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%rbp, %r8
	movq	%r14, %r9
	movq	%r12, %rcx
	movq	%rax, %rbx
	movq	%rax, %rdi
	movq	$-1, %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	xorl	%ebp, %ebp
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%r15, %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rbx
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L39:
	cmpb	$47, -2(%r14,%rbx)
	leaq	-2(%rbx), %r8
	jne	.L25
	movq	%r15, %rdx
	movq	%r8, 8(%rsp)
	addq	%r14, %rsi
	movq	%rcx, %rdi
	subq	%rbx, %rdx
	subq	$2, %r15
	call	*memmove@GOTPCREL(%rip)
	movq	8(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L11:
	testq	%rbx, %rbx
	jne	.L42
	movl	$1, %ebx
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L15:
	testq	%r15, %r15
	jne	.L43
.L17:
	xorl	%r15d, %r15d
	testq	%rbp, %rbp
	jne	.L19
.L41:
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	*getcwd@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L19
.L3:
	addq	$24, %rsp
	movq	%r14, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L43:
	movzbl	(%r14), %eax
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L40:
	cmpb	$58, 1(%r14)
	jne	.L5
	movsbl	%al, %edi
	call	*to_lower@GOTPCREL(%rip)
	leaq	1(%r14), %rsi
	movq	%r15, %rdx
	movq	%r14, %rdi
	call	*memmove@GOTPCREL(%rip)
	movb	$47, (%r14)
	movb	$47, 2(%r14)
	jmp	.L3
.L42:
	leaq	(%r14,%rbx), %rdi
	leaq	1(%rbx), %rsi
	cmpb	$47, (%rdi)
	jne	.L25
	movzbl	-1(%r14,%rbx), %eax
	jmp	.L9
	.size	absolute_path, .-absolute_path
	.section	.rodata.str1.1
.LC2:
	.string	"/"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"Warning: Path component too long, truncating to %zu characters\n"
	.section	.rodata.str1.1
.LC4:
	.string	"."
.LC5:
	.string	".."
	.text
	.p2align 4
	.globl	create_file
	.type	create_file, @function
create_file:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	xorl	%r13d, %r13d
	pushq	%r12
	pushq	%rbp
	xorl	%ebp, %ebp
	pushq	%rbx
	movq	%rdi, %rbx
	movl	$32, %edi
	subq	$296, %rsp
	call	*alloc_memory@GOTPCREL(%rip)
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movq	%rax, %r12
	call	absolute_path
	movq	%rax, %rdi
	movq	%rax, 24(%r12)
	call	*strlen@GOTPCREL(%rip)
	leaq	.LC0(%rip), %rdi
	leaq	1(%rax), %rsi
	movq	%rax, %r15
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	24(%r12), %rsi
	movq	%rax, %r14
	movq	%rax, %rdi
	call	*strcpy@GOTPCREL(%rip)
	testq	%r15, %r15
	je	.L45
	cmpb	$47, (%r14)
	je	.L112
.L45:
	leaq	32(%rsp), %rax
	movq	%r13, %rbx
	movq	%rbp, %r8
	movq	%rax, 8(%rsp)
	jmp	.L62
	.p2align 4,,10
	.p2align 3
.L49:
	cmpq	%rbp, %r15
	jb	.L48
.L62:
	movq	%rbp, %rax
	addq	$1, %rbp
	cmpq	%rax, %r15
	je	.L113
	cmpb	$47, (%r14,%rax)
	jne	.L49
	cmpq	%rax, %r8
	jnb	.L50
.L47:
	subq	%r8, %rax
	movq	%rax, %rcx
	cmpq	$255, %rax
	ja	.L114
.L51:
	movq	%rcx, 16(%rsp)
	movq	%rcx, %rdx
	movq	8(%rsp), %rdi
	leaq	(%r14,%r8), %rsi
	call	*strncpy@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rax
	movb	$0, 32(%rsp,%rcx)
	cmpw	$46, (%rax)
	je	.L50
	cmpw	$11822, (%rax)
	je	.L115
.L55:
	cmpb	$0, 32(%rsp)
	jne	.L116
	.p2align 4,,10
	.p2align 3
.L50:
	movq	%rbp, %r8
	jmp	.L49
	.p2align 4,,10
	.p2align 3
.L113:
	cmpq	%r15, %r8
	jb	.L47
.L48:
	movq	%rbx, (%r12)
	testq	%r13, %r13
	je	.L63
	movq	0(%r13), %r13
	movl	$46, %esi
	movq	%r13, %rdi
	call	*strrchr@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L63
	cmpq	%rax, %r13
	je	.L63
	movq	%rax, %rsi
	movq	%r13, %rdi
	subq	%r13, %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	%rbp, %rdi
	movq	%rax, 16(%r12)
	call	*strlen@GOTPCREL(%rip)
	movq	%rbp, %rdi
	movq	%rax, %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 8(%r12)
	testq	%rbx, %rbx
	je	.L65
.L118:
	movq	%rbx, %rbp
	xorl	%r15d, %r15d
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L66:
	movq	0(%rbp), %rdi
	addq	$1, %r15
	call	*strlen@GOTPCREL(%rip)
	movq	8(%rbp), %rbp
	addq	%rax, %r14
	testq	%rbp, %rbp
	jne	.L66
	leaq	1(%r14), %rax
	cmpq	$1, %r15
	leaq	(%r14,%r15), %rsi
	cmovbe	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	movb	$0, (%rax)
	movq	(%rbx), %rbp
	movq	%rax, %r13
	.p2align 4,,10
	.p2align 3
.L72:
	movq	%r13, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rbp, %rsi
	leaq	0(%r13,%rax), %rdi
	call	*stpcpy@GOTPCREL(%rip)
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L68
	movq	(%rbx), %rbp
	cmpb	$47, 0(%rbp)
	je	.L117
.L75:
	cmpb	$0, 0(%r13)
	je	.L72
	cmpb	$47, -1(%rax)
	je	.L72
	movl	$47, %edx
	movw	%dx, (%rax)
	movq	(%rbx), %rbp
	jmp	.L72
	.p2align 4,,10
	.p2align 3
.L114:
	movq	%r8, 16(%rsp)
	movq	stderr(%rip), %rdi
	leaq	.LC3(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	16(%rsp), %r8
	movl	$255, %ecx
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L63:
	xorl	%eax, %eax
	movq	%r13, 16(%r12)
	movq	%rax, 8(%r12)
	testq	%rbx, %rbx
	jne	.L118
.L65:
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	movb	$0, (%rax)
	movq	%rax, %r13
.L68:
	movq	%r13, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%r13, %rdi
	movq	%rax, %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 24(%r12)
	addq	$296, %rsp
	movq	%r12, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L117:
	cmpb	$0, 1(%rbp)
	je	.L72
	jmp	.L75
	.p2align 4,,10
	.p2align 3
.L115:
	cmpb	$0, 2(%rax)
	jne	.L55
	testq	%r13, %r13
	je	.L58
	cmpq	%rbx, %r13
	je	.L58
	movq	0(%r13), %rax
	cmpb	$46, (%rax)
	je	.L119
.L78:
	movq	%rbx, %rax
	jmp	.L60
	.p2align 4,,10
	.p2align 3
.L79:
	movq	%rdx, %rax
.L60:
	testq	%rax, %rax
	je	.L50
	movq	8(%rax), %rdx
	cmpq	%r13, %rdx
	jne	.L79
	movq	$0, 8(%rax)
	movq	%rax, %r13
	jmp	.L50
	.p2align 4,,10
	.p2align 3
.L112:
	movl	$16, %edi
	movl	$1, %ebp
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$1, %esi
	leaq	.LC2(%rip), %rdi
	movq	%rax, %r13
	call	*create_string@GOTPCREL(%rip)
	movq	$0, 8(%r13)
	movq	%rax, 0(%r13)
	jmp	.L45
	.p2align 4,,10
	.p2align 3
.L58:
	testq	%rbx, %rbx
	jne	.L50
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$2, %esi
	leaq	.LC5(%rip), %rdi
	movq	%rax, %rbx
	call	*create_string@GOTPCREL(%rip)
	movq	%rbx, %r13
	movq	$0, 8(%rbx)
	movq	%rax, (%rbx)
	jmp	.L50
	.p2align 4,,10
	.p2align 3
.L116:
	movq	%rcx, 24(%rsp)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	24(%rsp), %rsi
	movq	8(%rsp), %rdi
	movq	%rax, 16(%rsp)
	call	*create_string@GOTPCREL(%rip)
	movq	16(%rsp), %rdx
	movq	%rax, (%rdx)
	movq	$0, 8(%rdx)
	testq	%r13, %r13
	je	.L61
	movq	%rdx, 8(%r13)
.L61:
	movq	%rdx, %r13
	testq	%rbx, %rbx
	jne	.L50
	movq	%rdx, %rbx
	movq	%rdx, %r13
	jmp	.L50
	.p2align 4,,10
	.p2align 3
.L119:
	cmpb	$46, 1(%rax)
	jne	.L78
	cmpb	$0, 2(%rax)
	jne	.L78
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$2, %esi
	leaq	.LC5(%rip), %rdi
	movq	%rax, 16(%rsp)
	call	*create_string@GOTPCREL(%rip)
	movq	16(%rsp), %rdx
	movq	%rax, (%rdx)
	movq	$0, 8(%rdx)
	movq	%rdx, 8(%r13)
	movq	%rdx, %r13
	jmp	.L50
	.size	create_file, .-create_file
	.p2align 4
	.globl	get_file_name
	.type	get_file_name, @function
get_file_name:
	movq	16(%rdi), %rax
	ret
	.size	get_file_name, .-get_file_name
	.p2align 4
	.globl	get_file_extension
	.type	get_file_extension, @function
get_file_extension:
	movq	8(%rdi), %rax
	ret
	.size	get_file_extension, .-get_file_extension
	.p2align 4
	.globl	get_file_dir
	.type	get_file_dir, @function
get_file_dir:
	movq	(%rdi), %rdx
	testq	%rdx, %rdx
	je	.L149
	pushq	%r13
	xorl	%r13d, %r13d
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	xorl	%ebp, %ebp
	pushq	%rbx
	subq	$8, %rsp
	movq	8(%rdx), %rbx
	testq	%rbx, %rbx
	je	.L122
	.p2align 4,,10
	.p2align 3
.L124:
	movq	(%rdx), %rdi
	addq	$1, %r13
	call	*strlen@GOTPCREL(%rip)
	movq	%rbx, %rdx
	addq	%rax, %rbp
	movq	8(%rbx), %rax
	testq	%rax, %rax
	je	.L153
	movq	%rax, %rbx
	jmp	.L124
	.p2align 4,,10
	.p2align 3
.L153:
	testq	%r13, %r13
	je	.L122
	leaq	1(%rbp), %rax
	leaq	0(%rbp,%r13), %rsi
	cmpq	$1, %r13
	cmove	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	movb	$0, (%rax)
	movq	(%r12), %rbx
	movq	%rax, %rbp
	testq	%rbx, %rbx
	je	.L130
	cmpq	$0, 8(%rbx)
	je	.L130
.L152:
	movq	(%rbx), %r12
.L132:
	movq	%rbp, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%r12, %rsi
	leaq	0(%rbp,%rax), %rdi
	call	*stpcpy@GOTPCREL(%rip)
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L130
	cmpq	$0, 8(%rbx)
	je	.L130
	movq	(%rbx), %r12
	cmpb	$47, (%r12)
	je	.L154
.L135:
	cmpb	$0, 0(%rbp)
	je	.L132
	cmpb	$47, -1(%rax)
	je	.L132
	movl	$47, %ecx
	movw	%cx, (%rax)
	jmp	.L152
	.p2align 4,,10
	.p2align 3
.L130:
	movq	%rbp, %rdi
	call	*strlen@GOTPCREL(%rip)
	addq	$8, %rsp
	movq	%rbp, %rdi
	popq	%rbx
	movq	%rax, %rsi
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	*create_string@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L154:
	cmpb	$0, 1(%r12)
	je	.L132
	jmp	.L135
.L122:
	popq	%rdx
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L149:
	xorl	%eax, %eax
	ret
	.size	get_file_dir, .-get_file_dir
	.section	.rodata.str1.1
.LC6:
	.string	"%s/%s%s"
.LC7:
	.string	"%s%s"
	.text
	.p2align 4
	.type	rebuild_full_path, @function
rebuild_full_path:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	subq	$8, %rsp
	call	get_file_dir
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L156
	movq	%rax, %rdi
	movq	%rbp, %r15
	leaq	.LC0(%rip), %r14
	call	*strlen@GOTPCREL(%rip)
	movq	16(%rbx), %rdi
	movq	8(%rbx), %r13
	movq	%rax, %r12
	call	*strlen@GOTPCREL(%rip)
	addq	%r12, %rax
	leaq	1(%rax), %r12
	testq	%r13, %r13
	je	.L167
.L163:
	movq	%r13, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%r14, %rdi
	leaq	1(%r12,%rax), %rsi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rbp, %rbp
	je	.L159
	cmpb	$0, (%r15)
	jne	.L168
.L159:
	movq	16(%rbx), %r8
	movq	%r13, %r9
	leaq	.LC7(%rip), %rcx
	xorl	%eax, %eax
	movq	$-1, %rdx
	movl	$2, %esi
	movq	%r12, %rdi
	call	*__sprintf_chk@GOTPCREL(%rip)
.L160:
	movq	%r12, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, 24(%rbx)
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
.L167:
	leaq	2(%rax), %rsi
	movq	%r14, %rdi
	movq	%r14, %r13
	call	*create_string_not_check@GOTPCREL(%rip)
	cmpb	$0, (%r15)
	movq	%rax, %r12
	je	.L159
.L168:
	subq	$8, %rsp
	movq	$-1, %rdx
	movq	%r15, %r8
	xorl	%eax, %eax
	pushq	%r13
	movl	$2, %esi
	movq	16(%rbx), %r9
	movq	%r12, %rdi
	leaq	.LC6(%rip), %rcx
	call	*__sprintf_chk@GOTPCREL(%rip)
	popq	%rax
	popq	%rdx
	jmp	.L160
	.p2align 4,,10
	.p2align 3
.L156:
	movq	8(%rbx), %r13
	movq	16(%rbx), %rdi
	call	*strlen@GOTPCREL(%rip)
	testq	%r13, %r13
	je	.L162
	leaq	.LC0(%rip), %r14
	leaq	1(%rax), %r12
	movq	%r14, %r15
	jmp	.L163
	.p2align 4,,10
	.p2align 3
.L162:
	leaq	.LC0(%rip), %r13
	leaq	2(%rax), %rsi
	movq	%r13, %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%rax, %r12
	jmp	.L159
	.size	rebuild_full_path, .-rebuild_full_path
	.p2align 4
	.globl	get_full_path
	.type	get_full_path, @function
get_full_path:
	movq	24(%rdi), %rax
	ret
	.size	get_full_path, .-get_full_path
	.p2align 4
	.globl	change_file_extension
	.type	change_file_extension, @function
change_file_extension:
	movq	%rsi, 8(%rdi)
	jmp	rebuild_full_path
	.size	change_file_extension, .-change_file_extension
	.p2align 4
	.globl	change_file_name
	.type	change_file_name, @function
change_file_name:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	movq	(%rdi), %rax
	movq	%rsi, 16(%rdi)
	testq	%rax, %rax
	je	.L173
	.p2align 4,,10
	.p2align 3
.L172:
	movq	%rax, %rbx
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L172
	movq	8(%rbp), %r14
	movq	%r12, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%r14, %r14
	je	.L176
	movq	%r14, %rdi
	call	*strlen@GOTPCREL(%rip)
	leaq	.LC0(%rip), %rdi
	addq	%rax, %r13
.L174:
	leaq	1(%r13), %rsi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%r14, %r9
	movq	%r12, %r8
	movl	$2, %esi
	movq	%rax, %r13
	leaq	.LC7(%rip), %rcx
	movq	$-1, %rdx
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	%r13, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%r13, %rdi
	movq	%rax, %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, (%rbx)
.L173:
	popq	%rbx
	movq	%rbp, %rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	rebuild_full_path
	.p2align 4,,10
	.p2align 3
.L176:
	leaq	.LC0(%rip), %rdi
	movq	%rdi, %r14
	jmp	.L174
	.size	change_file_name, .-change_file_name
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
