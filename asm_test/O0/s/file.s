	.file	"D:\\TC\\src\\file.c"
	.text
	.globl	get_cwd
	.def	get_cwd;	.scl	2;	.type	32;	.endef
	.seh_proc	get_cwd
get_cwd:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	$0, %edx
	movl	$0, %ecx
	call	getcwd
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	create_file
	.def	create_file;	.scl	2;	.type	32;	.endef
	.seh_proc	create_file
create_file:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
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
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "\0"
.LC1:
	.ascii "%s/%s\0"
	.text
	.globl	absolute_path
	.def	absolute_path;	.scl	2;	.type	32;	.endef
	.seh_proc	absolute_path
absolute_path:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
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
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	get_file_name
	.def	get_file_name;	.scl	2;	.type	32;	.endef
	.seh_proc	get_file_name
get_file_name:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	popq	%rbp
	ret
	.seh_endproc
	.globl	get_file_extension
	.def	get_file_extension;	.scl	2;	.type	32;	.endef
	.seh_proc	get_file_extension
get_file_extension:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC2:
	.ascii "/\0"
	.text
	.globl	get_file_dir
	.def	get_file_dir;	.scl	2;	.type	32;	.endef
	.seh_proc	get_file_dir
get_file_dir:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
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
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	get_full_path
	.def	get_full_path;	.scl	2;	.type	32;	.endef
	.seh_proc	get_full_path
get_full_path:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "%s\0"
	.text
	.globl	change_file_extension
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
	.seh_proc	change_file_extension
change_file_extension:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$88, %rsp
	.seh_stackalloc	88
	leaq	80(%rsp), %rbp
	.seh_setframe	%rbp, 80
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movq	32(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	32(%rbp), %rax
	movq	%rax, %rcx
	call	get_file_dir
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L33
	movq	-16(%rbp), %rax
	jmp	.L34
.L33:
	leaq	.LC0(%rip), %rax
.L34:
	movq	%rax, -24(%rbp)
	cmpq	$0, 40(%rbp)
	je	.L35
	movq	40(%rbp), %rax
	jmp	.L36
.L35:
	leaq	.LC0(%rip), %rax
.L36:
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rbx
	movq	32(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	strlen
	addq	%rbx, %rax
	addq	$1, %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, 40(%rbp)
	je	.L37
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	addq	%rax, -8(%rbp)
.L37:
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	%rax, -40(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L38
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L38
	movq	32(%rbp), %rax
	movq	16(%rax), %rcx
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	jmp	.L39
.L38:
	movq	32(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC3(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
.L39:
	cmpq	$0, 40(%rbp)
	je	.L40
	movq	40(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	strcat
.L40:
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	create_string
	movq	32(%rbp), %rdx
	movq	%rax, 24(%rdx)
	nop
	addq	$88, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC4:
	.ascii "%s%s\0"
.LC5:
	.ascii "%s/%s%s\0"
	.text
	.globl	change_file_name
	.def	change_file_name;	.scl	2;	.type	32;	.endef
	.seh_proc	change_file_name
change_file_name:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$136, %rsp
	.seh_stackalloc	136
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movq	32(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L42
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L43
.L48:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L44
	movq	32(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L45
	movq	32(%rbp), %rax
	movq	8(%rax), %rax
	jmp	.L46
.L45:
	leaq	.LC0(%rip), %rax
.L46:
	movq	%rax, -32(%rbp)
	movq	40(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, -16(%rbp)
	movq	32(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L47
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	addq	%rax, -16(%rbp)
.L47:
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rcx
	movq	40(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	create_string
	movq	-8(%rbp), %rdx
	movq	%rax, (%rdx)
	jmp	.L42
.L44:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
.L43:
	cmpq	$0, -8(%rbp)
	jne	.L48
.L42:
	movq	32(%rbp), %rax
	movq	%rax, %rcx
	call	get_file_dir
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	je	.L49
	movq	-48(%rbp), %rax
	jmp	.L50
.L49:
	leaq	.LC0(%rip), %rax
.L50:
	movq	%rax, -56(%rbp)
	movq	32(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L51
	movq	32(%rbp), %rax
	movq	8(%rax), %rax
	jmp	.L52
.L51:
	leaq	.LC0(%rip), %rax
.L52:
	movq	%rax, -64(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rbx
	movq	40(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	addq	%rbx, %rax
	addq	$1, %rax
	movq	%rax, -24(%rbp)
	movq	32(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L53
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	addq	%rax, -24(%rbp)
.L53:
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	%rax, -72(%rbp)
	cmpq	$0, -48(%rbp)
	je	.L54
	movq	-56(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L54
	movq	40(%rbp), %r8
	movq	-56(%rbp), %rcx
	movq	-72(%rbp), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movq	%r8, %r9
	movq	%rcx, %r8
	leaq	.LC5(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	jmp	.L55
.L54:
	movq	-64(%rbp), %rcx
	movq	40(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
.L55:
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	call	create_string
	movq	32(%rbp), %rdx
	movq	%rax, 24(%rdx)
	nop
	addq	$136, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC6:
	.ascii ".\0"
.LC7:
	.ascii "..\0"
	.text
	.globl	normalize_path
	.def	normalize_path;	.scl	2;	.type	32;	.endef
	.seh_proc	normalize_path
normalize_path:
	pushq	%rbp
	.seh_pushreg	%rbp
	subq	$448, %rsp
	.seh_stackalloc	448
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, 336(%rbp)
	movq	336(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, 240(%rbp)
	movq	240(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	%rax, 232(%rbp)
	movq	336(%rbp), %rax
	movq	24(%rax), %rdx
	movq	232(%rbp), %rax
	movq	%rax, %rcx
	call	strcpy
	movq	$0, 312(%rbp)
	movq	$0, 304(%rbp)
	movq	$0, 296(%rbp)
	cmpq	$0, 240(%rbp)
	je	.L57
	movq	232(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L57
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, 224(%rbp)
	movl	$1, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	224(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	224(%rbp), %rax
	movq	$0, 8(%rax)
	movq	224(%rbp), %rax
	movq	%rax, 312(%rbp)
	movq	224(%rbp), %rax
	movq	%rax, 304(%rbp)
	movq	$1, 296(%rbp)
.L57:
	movq	296(%rbp), %rax
	movq	%rax, 288(%rbp)
	jmp	.L58
.L72:
	movq	288(%rbp), %rax
	cmpq	240(%rbp), %rax
	je	.L59
	movq	232(%rbp), %rdx
	movq	288(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L60
.L59:
	movq	288(%rbp), %rax
	cmpq	%rax, 296(%rbp)
	jnb	.L61
	movq	288(%rbp), %rax
	subq	296(%rbp), %rax
	movq	%rax, 192(%rbp)
	movq	232(%rbp), %rdx
	movq	296(%rbp), %rax
	addq	%rax, %rdx
	movq	192(%rbp), %rcx
	leaq	-96(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	leaq	-96(%rbp), %rdx
	movq	192(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	leaq	-96(%rbp), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L61
	leaq	-96(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L63
	cmpq	$0, 304(%rbp)
	je	.L64
	movq	304(%rbp), %rax
	cmpq	312(%rbp), %rax
	je	.L64
	movq	304(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L65
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, 176(%rbp)
	movl	$2, %edx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	176(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	176(%rbp), %rax
	movq	$0, 8(%rax)
	movq	304(%rbp), %rax
	movq	176(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	176(%rbp), %rax
	movq	%rax, 304(%rbp)
	jmp	.L83
.L65:
	movq	312(%rbp), %rax
	movq	%rax, 280(%rbp)
	jmp	.L67
.L69:
	movq	280(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, 280(%rbp)
.L67:
	cmpq	$0, 280(%rbp)
	je	.L68
	movq	280(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, 304(%rbp)
	jne	.L69
.L68:
	cmpq	$0, 280(%rbp)
	je	.L83
	movq	280(%rbp), %rax
	movq	$0, 8(%rax)
	movq	280(%rbp), %rax
	movq	%rax, 304(%rbp)
	jmp	.L83
.L64:
	cmpq	$0, 312(%rbp)
	jne	.L61
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, 168(%rbp)
	movl	$2, %edx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	168(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	168(%rbp), %rax
	movq	$0, 8(%rax)
	movq	168(%rbp), %rax
	movq	%rax, 312(%rbp)
	movq	168(%rbp), %rax
	movq	%rax, 304(%rbp)
	jmp	.L61
.L63:
	leaq	-96(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L61
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, 184(%rbp)
	movq	192(%rbp), %rdx
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	create_string
	movq	184(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	184(%rbp), %rax
	movq	$0, 8(%rax)
	cmpq	$0, 304(%rbp)
	je	.L71
	movq	304(%rbp), %rax
	movq	184(%rbp), %rdx
	movq	%rdx, 8(%rax)
.L71:
	movq	184(%rbp), %rax
	movq	%rax, 304(%rbp)
	cmpq	$0, 312(%rbp)
	jne	.L61
	movq	184(%rbp), %rax
	movq	%rax, 312(%rbp)
	jmp	.L61
.L83:
	nop
.L61:
	movq	288(%rbp), %rax
	addq	$1, %rax
	movq	%rax, 296(%rbp)
.L60:
	addq	$1, 288(%rbp)
.L58:
	movq	288(%rbp), %rax
	cmpq	%rax, 240(%rbp)
	jnb	.L72
	movq	336(%rbp), %rax
	movq	312(%rbp), %rdx
	movq	%rdx, (%rax)
	cmpq	$0, 304(%rbp)
	je	.L73
	movq	304(%rbp), %rax
	movq	(%rax), %rax
	movl	$46, %edx
	movq	%rax, %rcx
	call	strrchr
	movq	%rax, 216(%rbp)
	cmpq	$0, 216(%rbp)
	je	.L74
	movq	304(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, 216(%rbp)
	je	.L74
	movq	304(%rbp), %rax
	movq	(%rax), %rax
	movq	216(%rbp), %rdx
	subq	%rax, %rdx
	movq	%rdx, 208(%rbp)
	movq	304(%rbp), %rax
	movq	(%rax), %rax
	movq	208(%rbp), %rdx
	movq	%rax, %rcx
	call	create_string
	movq	336(%rbp), %rdx
	movq	%rax, 16(%rdx)
	movq	216(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	216(%rbp), %rax
	movq	%rax, %rcx
	call	create_string
	movq	336(%rbp), %rdx
	movq	%rax, 8(%rdx)
	jmp	.L76
.L74:
	movq	304(%rbp), %rax
	movq	(%rax), %rdx
	movq	336(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	336(%rbp), %rax
	movq	$0, 8(%rax)
	jmp	.L76
.L73:
	movq	336(%rbp), %rax
	movq	$0, 16(%rax)
	movq	336(%rbp), %rax
	movq	$0, 8(%rax)
.L76:
	movq	$0, 272(%rbp)
	movq	312(%rbp), %rax
	movq	%rax, 264(%rbp)
	movq	$0, 256(%rbp)
	jmp	.L77
.L78:
	movq	264(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	strlen
	addq	%rax, 272(%rbp)
	addq	$1, 256(%rbp)
	movq	264(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, 264(%rbp)
.L77:
	cmpq	$0, 264(%rbp)
	jne	.L78
	cmpq	$1, 256(%rbp)
	jbe	.L79
	movq	256(%rbp), %rdx
	movq	272(%rbp), %rax
	addq	%rdx, %rax
	subq	$1, %rax
	movq	%rax, 272(%rbp)
.L79:
	movq	272(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	%rax, 200(%rbp)
	movq	200(%rbp), %rax
	movb	$0, (%rax)
	movq	312(%rbp), %rax
	movq	%rax, 264(%rbp)
	movb	$1, 255(%rbp)
	jmp	.L80
.L82:
	cmpb	$0, 255(%rbp)
	jne	.L81
	movq	264(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L81
	movq	200(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L81
	movq	200(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	leaq	-1(%rax), %rdx
	movq	200(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	je	.L81
	movq	200(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	200(%rbp), %rax
	addq	%rdx, %rax
	movw	$47, (%rax)
.L81:
	movq	264(%rbp), %rax
	movq	(%rax), %rdx
	movq	200(%rbp), %rax
	movq	%rax, %rcx
	call	strcat
	movb	$0, 255(%rbp)
	movq	264(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, 264(%rbp)
.L80:
	cmpq	$0, 264(%rbp)
	jne	.L82
	movq	200(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	200(%rbp), %rax
	movq	%rax, %rcx
	call	create_string
	movq	336(%rbp), %rdx
	movq	%rax, 24(%rdx)
	nop
	addq	$448, %rsp
	popq	%rbp
	ret
	.seh_endproc
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
