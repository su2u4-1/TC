	.file	"D:\\TC\\src\\file.c"
	.text
	.globl	get_cwd
	.def	get_cwd;	.scl	2;	.type	32;	.endef
get_cwd:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movl	$0, %edx
	movl	$0, %ecx
	call	getcwd
	leave
	ret
	.globl	create_file
	.def	create_file;	.scl	2;	.type	32;	.endef
create_file:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	absolute_path
	movq	-8(%rbp), %rdx
	movq	%rax, 24(%rdx)
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	normalize_path
	movq	-8(%rbp), %rax
	leave
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
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, -8(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L6
.L10:
	movq	16(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$92, %al
	jne	.L7
	movq	16(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movb	$47, (%rax)
.L7:
	cmpq	$1, -16(%rbp)
	jbe	.L8
	movq	16(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L8
	movq	-16(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$46, %al
	jne	.L8
	movq	-16(%rbp), %rax
	leaq	-2(%rax), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L8
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	movq	%rax, %rcx
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movq	-16(%rbp), %rax
	leaq	-1(%rax), %r8
	movq	16(%rbp), %rax
	addq	%r8, %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	memmove
	subq	$2, -8(%rbp)
	subq	$2, -16(%rbp)
.L8:
	cmpq	$0, -16(%rbp)
	je	.L9
	movq	16(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L9
	movq	-16(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L9
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	movq	%rax, %r8
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movq	16(%rbp), %rcx
	movq	-16(%rbp), %rax
	addq	%rcx, %rax
	movq	%rax, %rcx
	call	memmove
	subq	$1, -8(%rbp)
	subq	$1, -16(%rbp)
.L9:
	addq	$1, -16(%rbp)
.L6:
	movq	-16(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jb	.L10
	cmpq	$0, -8(%rbp)
	je	.L11
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L11
	movq	16(%rbp), %rax
	jmp	.L12
.L11:
	call	get_cwd
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L13
	movq	16(%rbp), %rax
	jmp	.L12
.L13:
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	-8(%rbp), %rdx
	addq	%rdx, %rax
	addq	$2, %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	%rax, -40(%rbp)
	movq	16(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-32(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	create_string
.L12:
	leave
	ret
	.globl	get_file_name
	.def	get_file_name;	.scl	2;	.type	32;	.endef
get_file_name:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	popq	%rbp
	ret
	.globl	get_file_extension
	.def	get_file_extension;	.scl	2;	.type	32;	.endef
get_file_extension:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC2:
	.ascii "/\0"
	.text
	.globl	get_file_dir
	.def	get_file_dir;	.scl	2;	.type	32;	.endef
get_file_dir:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L19
	movl	$0, %eax
	jmp	.L20
.L19:
	movq	$0, -8(%rbp)
	movq	$0, -16(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	jmp	.L21
.L23:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L22
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	addq	%rax, -8(%rbp)
	addq	$1, -16(%rbp)
.L22:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
.L21:
	cmpq	$0, -24(%rbp)
	jne	.L23
	cmpq	$0, -16(%rbp)
	jne	.L24
	movl	$0, %eax
	jmp	.L20
.L24:
	cmpq	$1, -16(%rbp)
	jbe	.L25
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	subq	$1, %rax
	movq	%rax, -8(%rbp)
.L25:
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movb	$0, (%rax)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movb	$1, -25(%rbp)
	jmp	.L26
.L29:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L27
	cmpb	$0, -25(%rbp)
	jne	.L28
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L28
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L28
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	leaq	-1(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	je	.L28
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movw	$47, (%rax)
.L28:
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	strcat
	movb	$0, -25(%rbp)
.L27:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
.L26:
	cmpq	$0, -24(%rbp)
	jne	.L29
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	create_string
.L20:
	leave
	ret
	.globl	get_full_path
	.def	get_full_path;	.scl	2;	.type	32;	.endef
get_full_path:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC3:
	.ascii "%s\0"
	.text
	.globl	change_file_extension
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
change_file_extension:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$88, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_file_dir
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L33
	movq	-32(%rbp), %rax
	jmp	.L34
.L33:
	leaq	.LC0(%rip), %rax
.L34:
	movq	%rax, -40(%rbp)
	cmpq	$0, 24(%rbp)
	je	.L35
	movq	24(%rbp), %rax
	jmp	.L36
.L35:
	leaq	.LC0(%rip), %rax
.L36:
	movq	%rax, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rbx
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	strlen
	addq	%rbx, %rax
	addq	$1, %rax
	movq	%rax, -24(%rbp)
	cmpq	$0, 24(%rbp)
	je	.L37
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	addq	%rax, -24(%rbp)
.L37:
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	%rax, -56(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L38
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L38
	movq	16(%rbp), %rax
	movq	16(%rax), %rcx
	movq	-40(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	jmp	.L39
.L38:
	movq	16(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC3(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
.L39:
	cmpq	$0, 24(%rbp)
	je	.L40
	movq	24(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	strcat
.L40:
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	create_string
	movq	16(%rbp), %rdx
	movq	%rax, 24(%rdx)
	nop
	movq	-8(%rbp), %rbx
	leave
	ret
	.section .rdata,"dr"
.LC4:
	.ascii "%s%s\0"
.LC5:
	.ascii "%s/%s%s\0"
	.text
	.globl	change_file_name
	.def	change_file_name;	.scl	2;	.type	32;	.endef
change_file_name:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$136, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L42
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	jmp	.L43
.L48:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L44
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L45
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	jmp	.L46
.L45:
	leaq	.LC0(%rip), %rax
.L46:
	movq	%rax, -48(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, -32(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L47
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	addq	%rax, -32(%rbp)
.L47:
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	%rax, -56(%rbp)
	movq	-48(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	create_string
	movq	-24(%rbp), %rdx
	movq	%rax, (%rdx)
	jmp	.L42
.L44:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
.L43:
	cmpq	$0, -24(%rbp)
	jne	.L48
.L42:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_file_dir
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	je	.L49
	movq	-64(%rbp), %rax
	jmp	.L50
.L49:
	leaq	.LC0(%rip), %rax
.L50:
	movq	%rax, -72(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L51
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	jmp	.L52
.L51:
	leaq	.LC0(%rip), %rax
.L52:
	movq	%rax, -80(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rbx
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	addq	%rbx, %rax
	addq	$1, %rax
	movq	%rax, -40(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L53
	movq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	addq	%rax, -40(%rbp)
.L53:
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	%rax, -88(%rbp)
	cmpq	$0, -64(%rbp)
	je	.L54
	movq	-72(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L54
	movq	24(%rbp), %r8
	movq	-72(%rbp), %rcx
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movq	%r8, %r9
	movq	%rcx, %r8
	leaq	.LC5(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	jmp	.L55
.L54:
	movq	-80(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
.L55:
	movq	-88(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	movq	%rax, %rcx
	call	create_string
	movq	16(%rbp), %rdx
	movq	%rax, 24(%rdx)
	nop
	movq	-8(%rbp), %rbx
	leave
	ret
	.section .rdata,"dr"
.LC6:
	.ascii ".\0"
.LC7:
	.ascii "..\0"
	.text
	.globl	normalize_path
	.def	normalize_path;	.scl	2;	.type	32;	.endef
normalize_path:
	pushq	%rbp
	movq	%rsp, %rbp
	andq	$-16, %rsp
	subq	$448, %rsp
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, 368(%rsp)
	movq	368(%rsp), %rax
	addq	$1, %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	%rax, 360(%rsp)
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	360(%rsp), %rax
	movq	%rax, %rcx
	call	strcpy
	movq	$0, 440(%rsp)
	movq	$0, 432(%rsp)
	movq	$0, 424(%rsp)
	cmpq	$0, 368(%rsp)
	je	.L57
	movq	360(%rsp), %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L57
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, 352(%rsp)
	movl	$1, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	352(%rsp), %rdx
	movq	%rax, (%rdx)
	movq	352(%rsp), %rax
	movq	$0, 8(%rax)
	movq	352(%rsp), %rax
	movq	%rax, 440(%rsp)
	movq	352(%rsp), %rax
	movq	%rax, 432(%rsp)
	movq	$1, 424(%rsp)
.L57:
	movq	424(%rsp), %rax
	movq	%rax, 416(%rsp)
	jmp	.L58
.L72:
	movq	416(%rsp), %rax
	cmpq	368(%rsp), %rax
	je	.L59
	movq	360(%rsp), %rdx
	movq	416(%rsp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L60
.L59:
	movq	416(%rsp), %rax
	cmpq	%rax, 424(%rsp)
	jnb	.L61
	movq	416(%rsp), %rax
	subq	424(%rsp), %rax
	movq	%rax, 320(%rsp)
	movq	360(%rsp), %rdx
	movq	424(%rsp), %rax
	addq	%rax, %rdx
	movq	320(%rsp), %rcx
	leaq	32(%rsp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	leaq	32(%rsp), %rdx
	movq	320(%rsp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	leaq	32(%rsp), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L61
	leaq	32(%rsp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L63
	cmpq	$0, 432(%rsp)
	je	.L64
	movq	432(%rsp), %rax
	cmpq	440(%rsp), %rax
	je	.L64
	movq	432(%rsp), %rax
	movq	(%rax), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L65
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, 304(%rsp)
	movl	$2, %edx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	304(%rsp), %rdx
	movq	%rax, (%rdx)
	movq	304(%rsp), %rax
	movq	$0, 8(%rax)
	movq	432(%rsp), %rax
	movq	304(%rsp), %rdx
	movq	%rdx, 8(%rax)
	movq	304(%rsp), %rax
	movq	%rax, 432(%rsp)
	jmp	.L83
.L65:
	movq	440(%rsp), %rax
	movq	%rax, 408(%rsp)
	jmp	.L67
.L69:
	movq	408(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 408(%rsp)
.L67:
	cmpq	$0, 408(%rsp)
	je	.L68
	movq	408(%rsp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, 432(%rsp)
	jne	.L69
.L68:
	cmpq	$0, 408(%rsp)
	je	.L83
	movq	408(%rsp), %rax
	movq	$0, 8(%rax)
	movq	408(%rsp), %rax
	movq	%rax, 432(%rsp)
	jmp	.L83
.L64:
	cmpq	$0, 440(%rsp)
	jne	.L61
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, 296(%rsp)
	movl	$2, %edx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	296(%rsp), %rdx
	movq	%rax, (%rdx)
	movq	296(%rsp), %rax
	movq	$0, 8(%rax)
	movq	296(%rsp), %rax
	movq	%rax, 440(%rsp)
	movq	296(%rsp), %rax
	movq	%rax, 432(%rsp)
	jmp	.L61
.L63:
	leaq	32(%rsp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L61
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, 312(%rsp)
	movq	320(%rsp), %rdx
	leaq	32(%rsp), %rax
	movq	%rax, %rcx
	call	create_string
	movq	312(%rsp), %rdx
	movq	%rax, (%rdx)
	movq	312(%rsp), %rax
	movq	$0, 8(%rax)
	cmpq	$0, 432(%rsp)
	je	.L71
	movq	432(%rsp), %rax
	movq	312(%rsp), %rdx
	movq	%rdx, 8(%rax)
.L71:
	movq	312(%rsp), %rax
	movq	%rax, 432(%rsp)
	cmpq	$0, 440(%rsp)
	jne	.L61
	movq	312(%rsp), %rax
	movq	%rax, 440(%rsp)
	jmp	.L61
.L83:
	nop
.L61:
	movq	416(%rsp), %rax
	addq	$1, %rax
	movq	%rax, 424(%rsp)
.L60:
	addq	$1, 416(%rsp)
.L58:
	movq	416(%rsp), %rax
	cmpq	%rax, 368(%rsp)
	jnb	.L72
	movq	16(%rbp), %rax
	movq	440(%rsp), %rdx
	movq	%rdx, (%rax)
	cmpq	$0, 432(%rsp)
	je	.L73
	movq	432(%rsp), %rax
	movq	(%rax), %rax
	movl	$46, %edx
	movq	%rax, %rcx
	call	strrchr
	movq	%rax, 344(%rsp)
	cmpq	$0, 344(%rsp)
	je	.L74
	movq	432(%rsp), %rax
	movq	(%rax), %rax
	cmpq	%rax, 344(%rsp)
	je	.L74
	movq	432(%rsp), %rax
	movq	(%rax), %rax
	movq	344(%rsp), %rdx
	subq	%rax, %rdx
	movq	%rdx, 336(%rsp)
	movq	432(%rsp), %rax
	movq	(%rax), %rax
	movq	336(%rsp), %rdx
	movq	%rax, %rcx
	call	create_string
	movq	16(%rbp), %rdx
	movq	%rax, 16(%rdx)
	movq	344(%rsp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	344(%rsp), %rax
	movq	%rax, %rcx
	call	create_string
	movq	16(%rbp), %rdx
	movq	%rax, 8(%rdx)
	jmp	.L76
.L74:
	movq	432(%rsp), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	$0, 8(%rax)
	jmp	.L76
.L73:
	movq	16(%rbp), %rax
	movq	$0, 16(%rax)
	movq	16(%rbp), %rax
	movq	$0, 8(%rax)
.L76:
	movq	$0, 400(%rsp)
	movq	440(%rsp), %rax
	movq	%rax, 392(%rsp)
	movq	$0, 384(%rsp)
	jmp	.L77
.L78:
	movq	392(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	strlen
	addq	%rax, 400(%rsp)
	addq	$1, 384(%rsp)
	movq	392(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 392(%rsp)
.L77:
	cmpq	$0, 392(%rsp)
	jne	.L78
	cmpq	$1, 384(%rsp)
	jbe	.L79
	movq	384(%rsp), %rdx
	movq	400(%rsp), %rax
	addq	%rdx, %rax
	subq	$1, %rax
	movq	%rax, 400(%rsp)
.L79:
	movq	400(%rsp), %rax
	addq	$1, %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	%rax, 328(%rsp)
	movq	328(%rsp), %rax
	movb	$0, (%rax)
	movq	440(%rsp), %rax
	movq	%rax, 392(%rsp)
	movb	$1, 383(%rsp)
	jmp	.L80
.L82:
	cmpb	$0, 383(%rsp)
	jne	.L81
	movq	392(%rsp), %rax
	movq	(%rax), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L81
	movq	328(%rsp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L81
	movq	328(%rsp), %rax
	movq	%rax, %rcx
	call	strlen
	leaq	-1(%rax), %rdx
	movq	328(%rsp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	je	.L81
	movq	328(%rsp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	328(%rsp), %rax
	addq	%rdx, %rax
	movw	$47, (%rax)
.L81:
	movq	392(%rsp), %rax
	movq	(%rax), %rdx
	movq	328(%rsp), %rax
	movq	%rax, %rcx
	call	strcat
	movb	$0, 383(%rsp)
	movq	392(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 392(%rsp)
.L80:
	cmpq	$0, 392(%rsp)
	jne	.L82
	movq	328(%rsp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	328(%rsp), %rax
	movq	%rax, %rcx
	call	create_string
	movq	16(%rbp), %rdx
	movq	%rax, 24(%rdx)
	nop
	leave
	ret
	.ident	"GCC: (GNU) 13.2.0"
	.def	getcwd;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	strcat;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef
