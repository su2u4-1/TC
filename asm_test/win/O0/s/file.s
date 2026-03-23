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
	movl	$0, %edx
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
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	create_string_not_check
	movq	%rax, 16(%rbp)
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
	cmpq	$2, -8(%rbp)
	jbe	.L11
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L11
	movq	16(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$96, %al
	jle	.L11
	movq	16(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$122, %al
	jg	.L11
	movq	16(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L11
	movq	16(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	subl	$32, %eax
	movl	%eax, %edx
	movq	16(%rbp), %rax
	movb	%dl, (%rax)
	movq	16(%rbp), %rax
	addq	$1, %rax
	movb	$58, (%rax)
	movq	16(%rbp), %rax
	jmp	.L12
.L11:
	cmpq	$1, -8(%rbp)
	jbe	.L13
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$64, %al
	jle	.L13
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$90, %al
	jg	.L13
	movq	16(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$58, %al
	jne	.L13
	movq	16(%rbp), %rax
	jmp	.L12
.L13:
	cmpq	$0, -8(%rbp)
	je	.L14
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L14
	movq	16(%rbp), %rax
	jmp	.L12
.L14:
	cmpq	$0, 24(%rbp)
	jne	.L15
	call	get_cwd
	movq	%rax, 24(%rbp)
.L15:
	cmpq	$0, 24(%rbp)
	jne	.L16
	movq	16(%rbp), %rax
	jmp	.L12
.L16:
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	-8(%rbp), %rdx
	addq	%rdx, %rax
	addq	$2, %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	create_string_not_check
	movq	%rax, -32(%rbp)
	movq	16(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	create_string
	movl	$0, %edx
	movq	%rax, %rcx
	call	absolute_path
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
	jne	.L22
	movl	$0, %eax
	jmp	.L23
.L22:
	movq	$0, -8(%rbp)
	movq	$0, -16(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	jmp	.L24
.L26:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L25
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	addq	%rax, -8(%rbp)
	addq	$1, -16(%rbp)
.L25:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
.L24:
	cmpq	$0, -24(%rbp)
	jne	.L26
	cmpq	$0, -16(%rbp)
	jne	.L27
	movl	$0, %eax
	jmp	.L23
.L27:
	cmpq	$1, -16(%rbp)
	jbe	.L28
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	subq	$1, %rax
	movq	%rax, -8(%rbp)
.L28:
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	create_string_not_check
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movb	$0, (%rax)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movb	$1, -25(%rbp)
	jmp	.L29
.L32:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L30
	cmpb	$0, -25(%rbp)
	jne	.L31
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L31
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L31
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	leaq	-1(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	je	.L31
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movw	$47, (%rax)
.L31:
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	strcat
	movb	$0, -25(%rbp)
.L30:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
.L29:
	cmpq	$0, -24(%rbp)
	jne	.L32
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	create_string
.L23:
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
	.ascii "%s/%s%s\0"
.LC4:
	.ascii "%s%s\0"
	.text
	.def	rebuild_full_path;	.scl	3;	.type	32;	.endef
rebuild_full_path:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$104, %rsp
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_file_dir
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L36
	movq	-32(%rbp), %rax
	jmp	.L37
.L36:
	leaq	.LC0(%rip), %rax
.L37:
	movq	%rax, -40(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L38
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	jmp	.L39
.L38:
	leaq	.LC0(%rip), %rax
.L39:
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
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L40
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	addq	%rax, -24(%rbp)
.L40:
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	create_string_not_check
	movq	%rax, -56(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L41
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L41
	movq	16(%rbp), %rax
	movq	16(%rax), %r8
	movq	-40(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movq	%r8, %r9
	movq	%rcx, %r8
	leaq	.LC3(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	jmp	.L42
.L41:
	movq	16(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-48(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
.L42:
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
	.globl	change_file_extension
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
change_file_extension:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	rebuild_full_path
	nop
	leave
	ret
	.globl	change_file_name
	.def	change_file_name;	.scl	2;	.type	32;	.endef
change_file_name:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L45
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L46
.L51:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L47
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L48
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	jmp	.L49
.L48:
	leaq	.LC0(%rip), %rax
.L49:
	movq	%rax, -24(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, -16(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L50
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	addq	%rax, -16(%rbp)
.L50:
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	create_string_not_check
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	create_string
	movq	-8(%rbp), %rdx
	movq	%rax, (%rdx)
	jmp	.L45
.L47:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
.L46:
	cmpq	$0, -8(%rbp)
	jne	.L51
.L45:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	rebuild_full_path
	nop
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "Warning: Path component too long, truncating to %zu characters\12\0"
.LC6:
	.ascii ".\0"
.LC7:
	.ascii "..\0"
	.text
	.def	normalize_path;	.scl	3;	.type	32;	.endef
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
	movq	%rax, 360(%rsp)
	movq	360(%rsp), %rax
	addq	$1, %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	create_string_not_check
	movq	%rax, 352(%rsp)
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	352(%rsp), %rax
	movq	%rax, %rcx
	call	strcpy
	movq	$0, 440(%rsp)
	movq	$0, 432(%rsp)
	movq	$0, 424(%rsp)
	cmpq	$0, 360(%rsp)
	je	.L53
	movq	352(%rsp), %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L53
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, 344(%rsp)
	movl	$1, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	344(%rsp), %rdx
	movq	%rax, (%rdx)
	movq	344(%rsp), %rax
	movq	$0, 8(%rax)
	movq	344(%rsp), %rax
	movq	%rax, 440(%rsp)
	movq	344(%rsp), %rax
	movq	%rax, 432(%rsp)
	movq	$1, 424(%rsp)
.L53:
	movq	424(%rsp), %rax
	movq	%rax, 416(%rsp)
	jmp	.L54
.L69:
	movq	416(%rsp), %rax
	cmpq	360(%rsp), %rax
	je	.L55
	movq	352(%rsp), %rdx
	movq	416(%rsp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L56
.L55:
	movq	416(%rsp), %rax
	cmpq	%rax, 424(%rsp)
	jnb	.L57
	movq	416(%rsp), %rax
	subq	424(%rsp), %rax
	movq	%rax, 408(%rsp)
	cmpq	$255, 408(%rsp)
	jbe	.L58
	movq	$255, 408(%rsp)
	call	__getreent
	movq	24(%rax), %rax
	movq	408(%rsp), %rdx
	movq	%rdx, %r8
	leaq	.LC5(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L58:
	movq	352(%rsp), %rdx
	movq	424(%rsp), %rax
	addq	%rax, %rdx
	movq	408(%rsp), %rcx
	leaq	32(%rsp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	leaq	32(%rsp), %rdx
	movq	408(%rsp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	leaq	32(%rsp), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L57
	leaq	32(%rsp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L60
	cmpq	$0, 432(%rsp)
	je	.L61
	movq	432(%rsp), %rax
	cmpq	440(%rsp), %rax
	je	.L61
	movq	432(%rsp), %rax
	movq	(%rax), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L62
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
	jmp	.L80
.L62:
	movq	440(%rsp), %rax
	movq	%rax, 400(%rsp)
	jmp	.L64
.L66:
	movq	400(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 400(%rsp)
.L64:
	cmpq	$0, 400(%rsp)
	je	.L65
	movq	400(%rsp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, 432(%rsp)
	jne	.L66
.L65:
	cmpq	$0, 400(%rsp)
	je	.L80
	movq	400(%rsp), %rax
	movq	$0, 8(%rax)
	movq	400(%rsp), %rax
	movq	%rax, 432(%rsp)
	jmp	.L80
.L61:
	cmpq	$0, 440(%rsp)
	jne	.L57
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
	jmp	.L57
.L60:
	leaq	32(%rsp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L57
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, 312(%rsp)
	movq	408(%rsp), %rdx
	leaq	32(%rsp), %rax
	movq	%rax, %rcx
	call	create_string
	movq	312(%rsp), %rdx
	movq	%rax, (%rdx)
	movq	312(%rsp), %rax
	movq	$0, 8(%rax)
	cmpq	$0, 432(%rsp)
	je	.L68
	movq	432(%rsp), %rax
	movq	312(%rsp), %rdx
	movq	%rdx, 8(%rax)
.L68:
	movq	312(%rsp), %rax
	movq	%rax, 432(%rsp)
	cmpq	$0, 440(%rsp)
	jne	.L57
	movq	312(%rsp), %rax
	movq	%rax, 440(%rsp)
	jmp	.L57
.L80:
	nop
.L57:
	movq	416(%rsp), %rax
	addq	$1, %rax
	movq	%rax, 424(%rsp)
.L56:
	addq	$1, 416(%rsp)
.L54:
	movq	416(%rsp), %rax
	cmpq	%rax, 360(%rsp)
	jnb	.L69
	movq	16(%rbp), %rax
	movq	440(%rsp), %rdx
	movq	%rdx, (%rax)
	cmpq	$0, 432(%rsp)
	je	.L70
	movq	432(%rsp), %rax
	movq	(%rax), %rax
	movl	$46, %edx
	movq	%rax, %rcx
	call	strrchr
	movq	%rax, 336(%rsp)
	cmpq	$0, 336(%rsp)
	je	.L71
	movq	432(%rsp), %rax
	movq	(%rax), %rax
	cmpq	%rax, 336(%rsp)
	je	.L71
	movq	432(%rsp), %rax
	movq	(%rax), %rax
	movq	336(%rsp), %rdx
	subq	%rax, %rdx
	movq	%rdx, 328(%rsp)
	movq	432(%rsp), %rax
	movq	(%rax), %rax
	movq	328(%rsp), %rdx
	movq	%rax, %rcx
	call	create_string
	movq	16(%rbp), %rdx
	movq	%rax, 16(%rdx)
	movq	336(%rsp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	336(%rsp), %rax
	movq	%rax, %rcx
	call	create_string
	movq	16(%rbp), %rdx
	movq	%rax, 8(%rdx)
	jmp	.L73
.L71:
	movq	432(%rsp), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	$0, 8(%rax)
	jmp	.L73
.L70:
	movq	16(%rbp), %rax
	movq	$0, 16(%rax)
	movq	16(%rbp), %rax
	movq	$0, 8(%rax)
.L73:
	movq	$0, 392(%rsp)
	movq	440(%rsp), %rax
	movq	%rax, 384(%rsp)
	movq	$0, 376(%rsp)
	jmp	.L74
.L75:
	movq	384(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	strlen
	addq	%rax, 392(%rsp)
	addq	$1, 376(%rsp)
	movq	384(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 384(%rsp)
.L74:
	cmpq	$0, 384(%rsp)
	jne	.L75
	cmpq	$1, 376(%rsp)
	jbe	.L76
	movq	376(%rsp), %rdx
	movq	392(%rsp), %rax
	addq	%rdx, %rax
	subq	$1, %rax
	movq	%rax, 392(%rsp)
.L76:
	movq	392(%rsp), %rax
	addq	$1, %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	create_string_not_check
	movq	%rax, 320(%rsp)
	movq	320(%rsp), %rax
	movb	$0, (%rax)
	movq	440(%rsp), %rax
	movq	%rax, 384(%rsp)
	movb	$1, 375(%rsp)
	jmp	.L77
.L79:
	cmpb	$0, 375(%rsp)
	jne	.L78
	movq	384(%rsp), %rax
	movq	(%rax), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L78
	movq	320(%rsp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L78
	movq	320(%rsp), %rax
	movq	%rax, %rcx
	call	strlen
	leaq	-1(%rax), %rdx
	movq	320(%rsp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	je	.L78
	movq	320(%rsp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	320(%rsp), %rax
	addq	%rdx, %rax
	movw	$47, (%rax)
.L78:
	movq	384(%rsp), %rax
	movq	(%rax), %rdx
	movq	320(%rsp), %rax
	movq	%rax, %rcx
	call	strcat
	movb	$0, 375(%rsp)
	movq	384(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 384(%rsp)
.L77:
	cmpq	$0, 384(%rsp)
	jne	.L79
	movq	320(%rsp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	320(%rsp), %rax
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
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	strcat;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef
