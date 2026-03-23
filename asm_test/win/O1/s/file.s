	.file	"D:\\TC\\src\\file.c"
	.text
	.globl	get_cwd
	.def	get_cwd;	.scl	2;	.type	32;	.endef
get_cwd:
	subq	$40, %rsp
	movl	$0, %edx
	movl	$0, %ecx
	call	getcwd
	addq	$40, %rsp
	ret
	.section .rdata,"dr"
.LC0:
	.ascii "\0"
.LC1:
	.ascii "%s/%s\0"
	.text
	.globl	absolute_path
	.def	absolute_path;	.scl	2;	.type	32;	.endef
absolute_path:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rdi
	call	strlen
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	create_string_not_check
	movq	%rax, %rbx
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L4
	movl	$0, %edx
	jmp	.L11
.L27:
	movb	$47, (%rcx)
	cmpq	$1, %rdx
	jbe	.L24
.L6:
	leaq	-1(%rbx,%rdx), %rcx
	cmpb	$46, (%rcx)
	je	.L25
.L10:
	leaq	(%rbx,%rdx), %rcx
	cmpb	$47, (%rcx)
	jne	.L9
.L19:
	leaq	-1(%rdx), %rbp
	cmpb	$47, -1(%rbx,%rdx)
	jne	.L9
	leaq	1(%rbx,%rdx), %rax
	movq	%rsi, %r8
	subq	%rdx, %r8
	movq	%rax, %rdx
	call	memmove
	subq	$1, %rsi
	movq	%rbp, %rdx
	jmp	.L9
.L25:
	leaq	-2(%rdx), %rbp
	cmpb	$47, -2(%rbx,%rdx)
	jne	.L10
	leaq	1(%rbx,%rdx), %rax
	movq	%rsi, %r8
	subq	%rdx, %r8
	movq	%rax, %rdx
	call	memmove
	subq	$2, %rsi
	movq	%rbp, %rdx
.L8:
	testq	%rdx, %rdx
	jne	.L10
.L9:
	addq	$1, %rdx
	cmpq	%rsi, %rdx
	jnb	.L26
.L11:
	leaq	(%rbx,%rdx), %rcx
	movzbl	(%rcx), %eax
	cmpb	$92, %al
	je	.L27
	cmpq	$1, %rdx
	jbe	.L8
	cmpb	$47, %al
	jne	.L9
	jmp	.L6
.L26:
	cmpq	$2, %rsi
	jbe	.L12
	cmpb	$47, (%rbx)
	je	.L28
	movzbl	(%rbx), %eax
	subl	$65, %eax
	cmpb	$25, %al
	ja	.L4
.L18:
	cmpb	$58, 1(%rbx)
	jne	.L4
	jmp	.L3
.L28:
	movzbl	1(%rbx), %eax
	leal	-97(%rax), %edx
	cmpb	$25, %dl
	ja	.L14
	cmpb	$47, 2(%rbx)
	je	.L29
.L14:
	cmpb	$47, (%rbx)
	je	.L3
	jmp	.L4
.L29:
	subl	$32, %eax
	movb	%al, (%rbx)
	movb	$58, 1(%rbx)
	jmp	.L3
.L12:
	je	.L30
	testq	%rsi, %rsi
	jne	.L14
.L4:
	testq	%rdi, %rdi
	je	.L31
.L17:
	movq	%rdi, %rcx
	call	strlen
	leaq	2(%rsi,%rax), %rbp
	movq	%rbp, %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string_not_check
	movq	%rax, %rsi
	movq	%rbx, %r9
	movq	%rdi, %r8
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movq	%rbp, %rdx
	movq	%rsi, %rcx
	call	create_string
	movq	%rax, %rcx
	movl	$0, %edx
	call	absolute_path
	movq	%rax, %rbx
.L3:
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L30:
	movzbl	(%rbx), %eax
	subl	$65, %eax
	cmpb	$25, %al
	jbe	.L18
	jmp	.L14
.L31:
	movl	$0, %edx
	movl	$0, %ecx
	call	getcwd
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L17
	jmp	.L3
.L24:
	testq	%rdx, %rdx
	je	.L9
	leaq	(%rbx,%rdx), %rcx
	jmp	.L19
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
	.globl	create_file
	.def	create_file;	.scl	2;	.type	32;	.endef
create_file:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$304, %rsp
	movq	%rcx, %rbx
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, %r14
	movl	$0, %edx
	movq	%rbx, %rcx
	call	absolute_path
	movq	%rax, %rcx
	movq	%rax, 24(%r14)
	call	strlen
	movq	%rax, %rdi
	leaq	1(%rax), %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string_not_check
	movq	%rax, %r13
	movq	24(%r14), %rdx
	movq	%rax, %rcx
	call	strcpy
	testq	%rdi, %rdi
	je	.L54
	movl	$0, %ebx
	movq	$0, 40(%rsp)
	cmpb	$47, 0(%r13)
	jne	.L33
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %rsi
	movq	%rax, 40(%rsp)
	movl	$1, %edx
	leaq	.LC2(%rip), %rcx
	call	create_string
	movq	%rax, (%rsi)
	movq	$0, 8(%rsi)
	movl	$1, %ebx
	jmp	.L33
.L67:
	call	__getreent
	movq	24(%rax), %rcx
	movl	$255, %r8d
	leaq	.LC3(%rip), %rdx
	call	fprintf
	movl	$255, %r15d
	jmp	.L37
.L56:
	movq	%rsi, %rax
	jmp	.L41
.L57:
	movq	%rdx, %rax
.L41:
	testq	%rax, %rax
	je	.L36
	movq	8(%rax), %rdx
	movq	40(%rsp), %rcx
	cmpq	%rcx, %rdx
	jne	.L57
	movq	$0, 8(%rax)
	movq	%rax, 40(%rsp)
	jmp	.L36
.L40:
	testq	%rsi, %rsi
	jne	.L36
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %rsi
	movl	$2, %edx
	leaq	.LC5(%rip), %rcx
	call	create_string
	movq	%rax, (%rsi)
	movq	$0, 8(%rsi)
	movq	%rsi, 40(%rsp)
	jmp	.L36
.L39:
	cmpb	$0, 48(%rsp)
	jne	.L65
.L36:
	leaq	1(%rbx), %r12
.L35:
	leaq	1(%rbx), %rax
	cmpq	%rbx, %rdi
	je	.L66
	movq	%rax, %rbx
.L44:
	cmpq	%rbx, %rdi
	je	.L34
	cmpb	$47, 0(%r13,%rbx)
	jne	.L35
.L34:
	cmpq	%rbx, %r12
	jnb	.L36
	movq	%rbx, %r15
	subq	%r12, %r15
	cmpq	$255, %r15
	ja	.L67
.L37:
	leaq	0(%r13,%r12), %rdx
	movq	%r15, %r8
	movq	32(%rsp), %r12
	movq	%r12, %rcx
	call	strncpy
	movb	$0, 48(%rsp,%r15)
	leaq	.LC4(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L36
	leaq	.LC5(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L39
	movq	40(%rsp), %r15
	testq	%r15, %r15
	je	.L40
	cmpq	%rsi, %r15
	je	.L40
	movq	(%r15), %rcx
	leaq	.LC5(%rip), %rdx
	call	strcmp
	testl	%eax, %eax
	jne	.L56
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %r12
	movl	$2, %edx
	leaq	.LC5(%rip), %rcx
	call	create_string
	movq	%rax, (%r12)
	movq	$0, 8(%r12)
	movq	%r12, 8(%r15)
	movq	%r12, 40(%rsp)
	jmp	.L36
.L65:
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %r12
	leaq	48(%rsp), %rcx
	movq	%r15, %rdx
	call	create_string
	movq	%rax, (%r12)
	movq	$0, 8(%r12)
	movq	40(%rsp), %rax
	testq	%rax, %rax
	je	.L43
	movq	%r12, 8(%rax)
.L43:
	testq	%rsi, %rsi
	je	.L58
	movq	%r12, 40(%rsp)
	jmp	.L36
.L58:
	movq	%r12, 40(%rsp)
	movq	%r12, %rsi
	jmp	.L36
.L66:
	movq	%rsi, (%r14)
	movq	40(%rsp), %rax
	testq	%rax, %rax
	je	.L45
	movq	(%rax), %rdi
	movl	$46, %edx
	movq	%rdi, %rcx
	call	strrchr
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L46
	cmpq	%rax, %rdi
	je	.L46
	movq	%rax, %rdx
	subq	%rdi, %rdx
	movq	%rdi, %rcx
	call	create_string
	movq	%rax, 16(%r14)
	movq	%rbx, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	create_string
	movq	%rax, 40(%rsp)
	jmp	.L47
.L46:
	movq	%rdi, 16(%r14)
	movq	$0, 40(%rsp)
.L47:
	movq	40(%rsp), %rax
	movq	%rax, 8(%r14)
	testq	%rsi, %rsi
	je	.L48
	movq	%rsi, %rbx
	movl	$0, %edi
	movl	$0, %r12d
.L49:
	movq	(%rbx), %rcx
	call	strlen
	addq	%rax, %r12
	movq	%rdi, %rax
	addq	$1, %rdi
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L49
	addq	%r12, %rax
	cmpq	$1, %rdi
	cmova	%rax, %r12
	leaq	1(%r12), %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string_not_check
	movq	%rax, %rbx
	movb	$0, (%rax)
	movl	$1, %eax
	leaq	.LC2(%rip), %r12
	movl	$0, %edi
	jmp	.L52
.L45:
	movq	$0, 16(%r14)
	jmp	.L47
.L51:
	movq	(%rsi), %rdx
	movq	%rbx, %rcx
	call	strcat
	movq	8(%rsi), %rsi
	movl	%edi, %eax
	testq	%rsi, %rsi
	je	.L53
.L52:
	testb	%al, %al
	jne	.L51
	movq	(%rsi), %rcx
	movq	%r12, %rdx
	call	strcmp
	testl	%eax, %eax
	je	.L51
	cmpb	$0, (%rbx)
	je	.L51
	movq	%rbx, %rcx
	call	strlen
	cmpb	$47, -1(%rbx,%rax)
	je	.L51
	movw	$47, (%rbx,%rax)
	jmp	.L51
.L48:
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	call	create_string_not_check
	movq	%rax, %rbx
	movb	$0, (%rax)
.L53:
	movq	%rbx, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	create_string
	movq	%rax, 24(%r14)
	movq	%r14, %rax
	leaq	-56(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.L54:
	movq	%rdi, %rbx
	movq	$0, 40(%rsp)
.L33:
	movq	40(%rsp), %rsi
	movq	%rbx, %r12
	leaq	48(%rsp), %rax
	movq	%rax, 32(%rsp)
	jmp	.L44
	.globl	get_file_name
	.def	get_file_name;	.scl	2;	.type	32;	.endef
get_file_name:
	movq	16(%rcx), %rax
	ret
	.globl	get_file_extension
	.def	get_file_extension;	.scl	2;	.type	32;	.endef
get_file_extension:
	movq	8(%rcx), %rax
	ret
	.globl	get_file_dir
	.def	get_file_dir;	.scl	2;	.type	32;	.endef
get_file_dir:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L78
	movq	%rcx, %rbp
	movl	$0, %edi
	movl	$0, %esi
	jmp	.L73
.L81:
	movq	(%rax), %rcx
	call	strlen
	addq	%rax, %rsi
	addq	$1, %rdi
	movq	%rbx, %rax
.L73:
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L81
	testq	%rdi, %rdi
	je	.L70
	leaq	-1(%rsi,%rdi), %rax
	cmpq	$1, %rdi
	cmova	%rax, %rsi
	leaq	1(%rsi), %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string_not_check
	movq	%rax, %rsi
	movb	$0, (%rax)
	movq	0(%rbp), %rbx
	testq	%rbx, %rbx
	je	.L75
	movl	$1, %eax
	leaq	.LC2(%rip), %rbp
	movl	$0, %edi
	jmp	.L77
.L76:
	movq	(%rbx), %rdx
	movq	%rsi, %rcx
	call	strcat
	movq	8(%rbx), %rbx
	movl	%edi, %eax
	testq	%rbx, %rbx
	je	.L75
.L77:
	cmpq	$0, 8(%rbx)
	je	.L75
	testb	%al, %al
	jne	.L76
	movq	(%rbx), %rcx
	movq	%rbp, %rdx
	call	strcmp
	testl	%eax, %eax
	je	.L76
	cmpb	$0, (%rsi)
	je	.L76
	movq	%rsi, %rcx
	call	strlen
	cmpb	$47, -1(%rsi,%rax)
	je	.L76
	movw	$47, (%rsi,%rax)
	jmp	.L76
.L75:
	movq	%rsi, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	%rsi, %rcx
	call	create_string
	movq	%rax, %rbx
.L70:
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L78:
	movq	%rax, %rbx
	jmp	.L70
	.section .rdata,"dr"
.LC6:
	.ascii "%s/%s%s\0"
.LC7:
	.ascii "%s%s\0"
	.text
	.def	rebuild_full_path;	.scl	3;	.type	32;	.endef
rebuild_full_path:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$48, %rsp
	movq	%rcx, %rbx
	call	get_file_dir
	movq	%rax, %rsi
	testq	%rax, %rax
	leaq	.LC0(%rip), %rbp
	cmovne	%rax, %rbp
	movq	8(%rbx), %r12
	testq	%r12, %r12
	je	.L93
	movq	%rbp, %rcx
	call	strlen
	movq	%rax, %rdi
	movq	16(%rbx), %rcx
	call	strlen
	leaq	1(%rdi,%rax), %rdi
	movq	%r12, %rcx
	call	strlen
	leaq	(%rax,%rdi), %rdx
.L88:
	addq	$1, %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string_not_check
	movq	%rax, %rdi
	testq	%rsi, %rsi
	je	.L86
	cmpb	$0, 0(%rbp)
	jne	.L94
.L86:
	movq	%r12, %r9
	movq	16(%rbx), %r8
	leaq	.LC7(%rip), %rdx
	movq	%rdi, %rcx
	call	sprintf
.L87:
	movq	%rdi, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	%rdi, %rcx
	call	create_string
	movq	%rax, 24(%rbx)
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L94:
	movq	%r12, 32(%rsp)
	movq	16(%rbx), %r9
	movq	%rbp, %r8
	leaq	.LC6(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	jmp	.L87
.L93:
	movq	%rbp, %rcx
	call	strlen
	movq	%rax, %rdi
	movq	16(%rbx), %rcx
	call	strlen
	leaq	1(%rdi,%rax), %rdx
	leaq	.LC0(%rip), %r12
	jmp	.L88
	.globl	get_full_path
	.def	get_full_path;	.scl	2;	.type	32;	.endef
get_full_path:
	movq	24(%rcx), %rax
	ret
	.globl	change_file_extension
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
change_file_extension:
	subq	$40, %rsp
	movq	%rdx, 8(%rcx)
	call	rebuild_full_path
	addq	$40, %rsp
	ret
	.globl	change_file_name
	.def	change_file_name;	.scl	2;	.type	32;	.endef
change_file_name:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	movq	%rdx, 16(%rcx)
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L100
.L99:
	movq	%rax, %rbx
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L99
	movq	8(%rsi), %r12
	testq	%r12, %r12
	je	.L109
	movq	%rdi, %rcx
	call	strlen
	movq	%rax, %rbp
	movq	%r12, %rcx
	call	strlen
	leaq	(%rax,%rbp), %rdx
.L104:
	addq	$1, %rdx
	leaq	.LC0(%rip), %rcx
	call	create_string_not_check
	movq	%rax, %rbp
	movq	%r12, %r9
	movq	%rdi, %r8
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movq	%rbp, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	%rbp, %rcx
	call	create_string
	movq	%rax, (%rbx)
.L100:
	movq	%rsi, %rcx
	call	rebuild_full_path
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L109:
	movq	%rdi, %rcx
	call	strlen
	movq	%rax, %rdx
	leaq	.LC0(%rip), %r12
	jmp	.L104
	.ident	"GCC: (GNU) 13.2.0"
	.def	getcwd;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef
	.def	strcat;	.scl	2;	.type	32;	.endef
