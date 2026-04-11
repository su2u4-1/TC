	.file	"all.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "\342\224\202   \0"
.LC1:
	.ascii "    \0"
.LC2:
	.ascii "\342\224\224\342\224\200\342\224\200 \0"
.LC3:
	.ascii "\342\224\234\342\224\200\342\224\200 \0"
	.text
	.p2align 4
	.def	indention;	.scl	3;	.type	32;	.endef
indention:
	pushq	%r14
	movl	$1, %eax
	movl	%r8d, %r14d
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rdi
	movq	%r9, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	shrq	$3, %rdx
	pushq	%rbx
	movl	%esi, %ecx
	addq	%r9, %rdx
	andl	$7, %ecx
	sall	%cl, %eax
	subq	$32, %rsp
	movzbl	(%rdx), %r8d
	testb	%r14b, %r14b
	jne	.L2
	orl	%eax, %r8d
	movb	%r8b, (%rdx)
	cmpq	$1, %rsi
	jbe	.L14
.L3:
	movl	$1, %ebx
	leaq	.LC1(%rip), %r13
	leaq	.LC0(%rip), %r12
	.p2align 4,,10
	.p2align 3
.L8:
	movq	%rbx, %rax
	movl	%ebx, %ecx
	movq	%r12, %rdx
	shrq	$3, %rax
	andl	$7, %ecx
	movsbl	(%rdi,%rax), %eax
	sarl	%cl, %eax
	movq	%rbp, %rcx
	testb	$1, %al
	cmove	%r13, %rdx
	addq	$1, %rbx
	call	fprintf
	cmpq	%rbx, %rsi
	jne	.L8
	testb	%r14b, %r14b
	je	.L4
.L6:
	leaq	.LC2(%rip), %rdx
.L9:
	addq	$32, %rsp
	movq	%rbp, %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L2:
	notl	%eax
	andl	%r8d, %eax
	movb	%al, (%rdx)
	cmpq	$1, %rsi
	ja	.L3
	testq	%rsi, %rsi
	jne	.L6
.L1:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L14:
	testq	%rsi, %rsi
	je	.L1
	.p2align 4,,10
	.p2align 3
.L4:
	leaq	.LC3(%rip), %rdx
	jmp	.L9
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "[Warning] Unsupported type for size lookup: %s\12\0"
	.text
	.p2align 4
	.def	get_type_size;	.scl	3;	.type	32;	.endef
get_type_size:
	xorl	%eax, %eax
	testq	%rcx, %rcx
	je	.L24
	cmpq	%rcx, name_int(%rip)
	je	.L25
	cmpq	%rcx, name_float(%rip)
	je	.L25
	cmpq	%rcx, name_string(%rip)
	je	.L25
	cmpq	%rcx, name_bool(%rip)
	movl	$1, %eax
	je	.L24
	cmpq	%rcx, name_void(%rip)
	je	.L24
	movl	32(%rcx), %eax
	testl	%eax, %eax
	jne	.L18
	movq	24(%rcx), %rax
	movq	24(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L24:
	ret
	.p2align 4,,10
	.p2align 3
.L25:
	movl	$8, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L18:
	pushq	%rbx
	subq	$32, %rsp
	movq	8(%rcx), %rbx
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC4(%rip), %rdx
	movq	%rbx, %r8
	movq	%rax, %rcx
	call	fprintf
	addq	$32, %rsp
	movl	$8, %eax
	popq	%rbx
	ret
	.section .rdata,"dr"
.LC5:
	.ascii "Name: \"NULL\"\12\0"
.LC6:
	.ascii "name: \"%s\"\12\0"
.LC7:
	.ascii "id: %zu\12\0"
.LC8:
	.ascii "kind: \"type\"\12\0"
.LC9:
	.ascii "kind: \"variable\"\12\0"
.LC10:
	.ascii "type\12\0"
.LC11:
	.ascii "kind: \"function\"\12\0"
.LC12:
	.ascii "return_type\12\0"
.LC13:
	.ascii "kind: \"method\"\12\0"
.LC14:
	.ascii "kind: \"class\"\12\0"
.LC15:
	.ascii "kind: \"attribute\"\12\0"
.LC16:
	.ascii "kind: \"parameter\"\12\0"
.LC17:
	.ascii "kind: \"unknown_NameType\"\12\0"
	.text
	.p2align 4
	.def	output_name;	.scl	3;	.type	32;	.endef
output_name:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%r8, %r12
	pushq	%rbp
	pushq	%rdi
	movq	%r9, %rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$40, %rsp
	testq	%rcx, %rcx
	je	.L28
	movq	%rcx, %rsi
	addq	$1, %r12
	leaq	.LC6(%rip), %r15
	leaq	.LC7(%rip), %r14
	leaq	.L33(%rip), %r13
.L30:
	leaq	-1(%r12), %rbp
	movq	%rdi, %r9
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	movq	%rbp, %rdx
	call	indention
	movq	8(%rsi), %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	fprintf
	xorl	%r8d, %r8d
	movq	%rdi, %r9
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	16(%rsi), %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	fprintf
	cmpl	$6, 32(%rsi)
	ja	.L31
	movl	32(%rsi), %eax
	movq	%rdi, %r9
	movslq	0(%r13,%rax,4), %rax
	addq	%r13, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L33:
	.long	.L39-.L33
	.long	.L38-.L33
	.long	.L37-.L33
	.long	.L36-.L33
	.long	.L35-.L33
	.long	.L34-.L33
	.long	.L32-.L33
	.text
	.p2align 4,,10
	.p2align 3
.L34:
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC15(%rip), %rcx
.L47:
	call	fwrite
	movq	%rdi, %r9
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC10(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rsi
.L40:
	leaq	1(%r12), %rax
	testq	%rsi, %rsi
	je	.L28
	movq	%rax, %r12
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L35:
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC16(%rip), %rcx
	jmp	.L47
	.p2align 4,,10
	.p2align 3
.L36:
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC9(%rip), %rcx
	jmp	.L47
	.p2align 4,,10
	.p2align 3
.L37:
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC13(%rip), %rcx
.L48:
	call	fwrite
	movq	%rdi, %r9
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC12(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rsi
	jmp	.L40
	.p2align 4,,10
	.p2align 3
.L38:
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rcx
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L39:
	movl	$1, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC14(%rip), %rcx
.L49:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L32:
	movl	$1, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC8(%rip), %rcx
	jmp	.L49
.L31:
	movq	%rdi, %r9
	movl	$1, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$25, %r8d
	movl	$1, %edx
	leaq	.LC17(%rip), %rcx
	jmp	.L49
	.p2align 4,,10
	.p2align 3
.L28:
	movq	%rdi, %r9
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rcx
	jmp	.L49
	.section .rdata,"dr"
	.align 8
.LC18:
	.ascii "Fatal: Cannot allocate memory\12\0"
	.text
	.p2align 4
	.def	increase_memory_size;	.scl	3;	.type	32;	.endef
increase_memory_size:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	movl	%ecx, %esi
	movl	$32, %ecx
	pushq	%rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	call	malloc
	testq	%rax, %rax
	je	.L61
	movl	$1024, %ecx
	movq	%rax, %rbx
	call	malloc
	movdqu	.LC19(%rip), %xmm0
	movq	$0, 16(%rbx)
	movq	%rax, 24(%rbx)
	movups	%xmm0, (%rbx)
	testb	%sil, %sil
	jne	.L62
	movq	string_memory(%rip), %rax
	addq	$1024, string_memory_count(%rip)
	movq	%rbx, string_memory(%rip)
	movq	8(%rax), %rdx
	movq	%rax, 16(%rbx)
	addq	%rdx, string_memory_used(%rip)
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L62:
	movq	struct_memory(%rip), %rax
	addq	$1024, struct_memory_count(%rip)
	movq	%rbx, struct_memory(%rip)
	movq	8(%rax), %rdx
	movq	%rax, 16(%rbx)
	addq	%rdx, struct_memory_used(%rip)
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
.L61:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$30, %r8d
	movl	$1, %edx
	leaq	.LC18(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	movq	string_memory(%rip), %rbx
	testq	%rbx, %rbx
	je	.L52
.L53:
	movq	%rbx, %rsi
	movq	16(%rbx), %rbx
	movq	24(%rsi), %rcx
	call	free
	movq	%rsi, %rcx
	call	free
	testq	%rbx, %rbx
	jne	.L53
.L52:
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
	.section .rdata,"dr"
.LC20:
	.ascii "Var: \"NULL\"\12\0"
.LC21:
	.ascii "NULL\11%s\12\0"
.LC22:
	.ascii "%s\11%s(%s)\12\0"
.LC23:
	.ascii "%s\11%s\12\0"
	.text
	.p2align 4
	.def	output_var;	.scl	3;	.type	32;	.endef
output_var:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	leaq	0(,%r8,4), %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$56, %rsp
	testq	%rcx, %rcx
	je	.L78
	xorl	%edi, %edi
	cmpq	$0, 16(%rcx)
	movq	%rcx, %rbp
	je	.L67
	cmpq	$0, (%rcx)
	je	.L68
	.p2align 4,,10
	.p2align 3
.L69:
	movq	%rbx, %rdx
	movl	$32, %ecx
	addq	$1, %rdi
	call	putc
	cmpq	%rsi, %rdi
	jb	.L69
	movq	16(%rbp), %rax
	movq	%rbx, %rcx
	leaq	.LC22(%rip), %rdx
	movq	8(%rax), %r8
	movq	0(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, 32(%rsp)
	movq	8(%rbp), %r9
	call	fprintf
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L67:
	movq	%rbx, %rdx
	movl	$32, %ecx
	addq	$1, %rdi
	call	putc
	cmpq	%rsi, %rdi
	jb	.L67
	movq	8(%rbp), %r8
	addq	$56, %rsp
	movq	%rbx, %rcx
	leaq	.LC21(%rip), %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L68:
	movq	%rbx, %rdx
	movl	$32, %ecx
	addq	$1, %rdi
	call	putc
	cmpq	%rsi, %rdi
	jb	.L68
	movq	16(%rbp), %rax
	movq	8(%rbp), %r9
	movq	%rbx, %rcx
	leaq	.LC23(%rip), %rdx
	movq	8(%rax), %r8
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L78:
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L65:
	movq	%rbx, %rdx
	movl	$32, %ecx
	addq	$1, %rdi
	call	putc
	cmpq	%rsi, %rdi
	jb	.L65
	addq	$56, %rsp
	movq	%rbx, %r9
	movl	$12, %r8d
	movl	$1, %edx
	popq	%rbx
	leaq	.LC20(%rip), %rcx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	fwrite
	.section .rdata,"dr"
.LC24:
	.ascii "true\0"
.LC25:
	.ascii "false\0"
.LC26:
	.ascii "\"NULL\"\0"
.LC27:
	.ascii "%s(%s)\0"
.LC28:
	.ascii "%lld\0"
.LC29:
	.ascii "%f\0"
.LC30:
	.ascii "\"%s\"\0"
.LC31:
	.ascii "void\0"
.LC32:
	.ascii "NONE\0"
.LC33:
	.ascii "unknown_ArgType: %u\0"
	.text
	.p2align 4
	.def	output_arg;	.scl	3;	.type	32;	.endef
output_arg:
	movq	%rdx, %r10
	testq	%rcx, %rcx
	je	.L98
	movl	16(%rcx), %r8d
	cmpl	$9, %r8d
	ja	.L81
	leaq	.L83(%rip), %rdx
	movslq	(%rdx,%r8,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L83:
	.long	.L84-.L83
	.long	.L90-.L83
	.long	.L89-.L83
	.long	.L88-.L83
	.long	.L87-.L83
	.long	.L86-.L83
	.long	.L85-.L83
	.long	.L84-.L83
	.long	.L84-.L83
	.long	.L82-.L83
	.text
	.p2align 4,,10
	.p2align 3
.L84:
	movq	(%rcx), %rax
	movq	(%rax), %rdx
	movq	8(%rax), %r8
	testq	%rdx, %rdx
	je	.L94
	movq	8(%rdx), %r9
	movq	%r10, %rcx
	leaq	.LC27(%rip), %rdx
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L90:
	movq	(%rcx), %r8
	leaq	.LC28(%rip), %rdx
	movq	%r10, %rcx
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L87:
	cmpb	$0, (%rcx)
	leaq	.LC24(%rip), %rax
	leaq	.LC25(%rip), %rcx
	movq	%r10, %rdx
	cmovne	%rax, %rcx
	jmp	fputs
	.p2align 4,,10
	.p2align 3
.L86:
	movq	%r10, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC31(%rip), %rcx
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L85:
	movq	(%rcx), %rax
	movq	%r10, %rdx
	movq	8(%rax), %rcx
	jmp	fputs
	.p2align 4,,10
	.p2align 3
.L82:
	movq	%r10, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC32(%rip), %rcx
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L89:
	movq	(%rcx), %r8
	leaq	.LC29(%rip), %rdx
	movq	%r10, %rcx
	movq	%r8, %xmm2
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L88:
	movq	(%rcx), %r8
	leaq	.LC30(%rip), %rdx
	movq	%r10, %rcx
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L98:
	movq	%rdx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC26(%rip), %rcx
	jmp	fwrite
.L81:
	leaq	.LC33(%rip), %rdx
	movq	%r10, %rcx
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L94:
	movq	%r10, %rdx
	movq	%r8, %rcx
	jmp	fputs
	.p2align 4
	.def	string_to_operator;	.scl	3;	.type	32;	.endef
string_to_operator:
	cmpq	%rcx, 144+symbolList(%rip)
	je	.L101
	cmpq	%rcx, 184+symbolList(%rip)
	je	.L102
	cmpq	%rcx, 192+symbolList(%rip)
	je	.L103
	cmpq	%rcx, 200+symbolList(%rip)
	je	.L104
	cmpq	%rcx, 208+symbolList(%rip)
	je	.L105
	cmpq	%rcx, 216+symbolList(%rip)
	je	.L106
	cmpq	224+symbolList(%rip), %rcx
	je	.L107
	cmpq	232+symbolList(%rip), %rcx
	je	.L108
	cmpq	152+symbolList(%rip), %rcx
	je	.L109
	cmpq	160+symbolList(%rip), %rcx
	je	.L110
	cmpq	128+symbolList(%rip), %rcx
	je	.L111
	cmpq	136+symbolList(%rip), %rcx
	je	.L112
	cmpq	168+symbolList(%rip), %rcx
	je	.L113
	cmpq	176+symbolList(%rip), %rcx
	je	.L114
	cmpq	88+symbolList(%rip), %rcx
	je	.L115
	cmpq	96+symbolList(%rip), %rcx
	je	.L116
	cmpq	104+symbolList(%rip), %rcx
	je	.L117
	cmpq	112+symbolList(%rip), %rcx
	je	.L118
	cmpq	120+symbolList(%rip), %rcx
	movl	$4, %edx
	movl	$19, %eax
	cmove	%edx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L107:
	movl	$11, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L101:
	movl	$13, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L102:
	movl	$14, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L103:
	movl	$15, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L104:
	movl	$16, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L105:
	movl	$17, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L106:
	movl	$18, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L115:
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L108:
	movl	$12, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L109:
	movl	$5, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L110:
	movl	$6, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L111:
	movl	$7, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L112:
	movl	$8, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L116:
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L113:
	movl	$9, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L114:
	movl	$10, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L117:
	movl	$2, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L118:
	movl	$3, %eax
	ret
	.p2align 4
	.def	create_memory_block.part.0;	.scl	3;	.type	32;	.endef
create_memory_block.part.0:
	subq	$40, %rsp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$30, %r8d
	movl	$1, %edx
	leaq	.LC18(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
	.p2align 4
	.def	get_current_char.isra.0;	.scl	3;	.type	32;	.endef
get_current_char.isra.0:
	movq	16(%rcx), %rax
	cmpq	24(%rcx), %rax
	jnb	.L122
	addq	$1, %rax
	addq	$1, 40(%rcx)
	movq	%rax, 16(%rcx)
.L122:
	ret
	.section .rdata,"dr"
.LC34:
	.ascii "init\0"
.LC35:
	.ascii "$constructor\0"
	.text
	.p2align 4
	.def	init.part.0;	.scl	3;	.type	32;	.endef
init.part.0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	cmpq	$0, struct_memory(%rip)
	je	.L137
	cmpq	$0, string_memory(%rip)
	je	.L138
.L127:
	leaq	keywordStrings(%rip), %rbx
	movb	$1, initialized(%rip)
	movl	$6, %edx
	leaq	keywordList(%rip), %rsi
	leaq	176(%rbx), %rdi
	jmp	.L131
	.p2align 4,,10
	.p2align 3
.L129:
	movq	(%rbx), %rcx
	call	strlen
	movq	%rax, %rdx
.L131:
	movq	(%rbx), %rcx
	xorl	%r8d, %r8d
	addq	$8, %rbx
	addq	$8, %rsi
	call	create_string_check
	movq	%rax, -8(%rsi)
	cmpq	%rdi, %rbx
	jne	.L129
	leaq	symbolStrings(%rip), %rbx
	leaq	symbolList(%rip), %rsi
	movl	$1, %edx
	leaq	240(%rbx), %rdi
	jmp	.L130
	.p2align 4,,10
	.p2align 3
.L139:
	movq	(%rbx), %rcx
	call	strlen
	movq	%rax, %rdx
.L130:
	movq	(%rbx), %rcx
	xorl	%r8d, %r8d
	addq	$8, %rbx
	addq	$8, %rsi
	call	create_string_check
	movq	%rax, -8(%rsi)
	cmpq	%rdi, %rbx
	jne	.L139
	xorl	%r8d, %r8d
	movl	$4, %edx
	leaq	.LC34(%rip), %rcx
	call	create_string_check
	xorl	%r8d, %r8d
	movl	$13, %edx
	leaq	.LC35(%rip), %rcx
	movq	%rax, DEFAULT_INIT_NAME(%rip)
	call	create_string_check
	movq	%rax, DEFAULT_CONSTRUCTOR_NAME(%rip)
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L137:
	movl	$32, %ecx
	call	malloc
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L128
	movl	$1024, %ecx
	call	malloc
	movdqu	.LC19(%rip), %xmm0
	cmpq	$0, string_memory(%rip)
	movq	$0, 16(%rbx)
	movq	%rax, 24(%rbx)
	movq	%rbx, struct_memory(%rip)
	movq	$1024, struct_memory_count(%rip)
	movups	%xmm0, (%rbx)
	jne	.L127
.L138:
	movl	$32, %ecx
	call	malloc
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L128
	movl	$1024, %ecx
	call	malloc
	movdqu	.LC19(%rip), %xmm0
	movq	$0, 16(%rbx)
	movq	%rax, 24(%rbx)
	movq	%rbx, string_memory(%rip)
	movq	$1024, string_memory_count(%rip)
	movups	%xmm0, (%rbx)
	jmp	.L127
.L128:
	call	create_memory_block.part.0
	.section .rdata,"dr"
	.align 8
.LC36:
	.ascii "Fatal: Memory allocation is not aligned, used: %zu bytes\12\0"
	.text
	.p2align 4
	.def	alloc_memory;	.scl	3;	.type	32;	.endef
alloc_memory:
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$40, %rsp
	cmpb	$0, initialized(%rip)
	je	.L145
.L141:
	movq	struct_memory(%rip), %rdx
	addq	$7, %rbx
	andq	$-8, %rbx
	movq	8(%rdx), %rsi
	leaq	(%rsi,%rbx), %rax
	cmpq	(%rdx), %rax
	jnb	.L146
.L142:
	testb	$7, %sil
	jne	.L147
	addq	%rsi, %rbx
	movq	%rsi, %rax
	addq	$1, memoryBlockCount(%rip)
	movq	%rbx, 8(%rdx)
	andq	$-8, %rax
	addq	24(%rdx), %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
	.p2align 3
.L145:
	call	init.part.0
	jmp	.L141
	.p2align 4,,10
	.p2align 3
.L146:
	movl	$1, %ecx
	call	increase_memory_size
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %rsi
	jmp	.L142
.L147:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, %r8
	leaq	.LC36(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
	.section .rdata,"dr"
	.align 8
.LC37:
	.ascii "Info: Allocate big memory block of size %zu bytes\12\0"
	.text
	.p2align 4
	.def	create_string_check;	.scl	3;	.type	32;	.endef
create_string_check:
	pushq	%r12
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movl	%r8d, %ebx
	subq	$32, %rsp
	cmpb	$0, initialized(%rip)
	je	.L167
.L149:
	testq	%rbp, %rbp
	je	.L157
	testq	%rsi, %rsi
	je	.L157
	testb	%bl, %bl
	je	.L151
	movq	all_string_list(%rip), %rbx
	testq	%rbx, %rbx
	je	.L151
	xorl	%edi, %edi
	jmp	.L153
	.p2align 4,,10
	.p2align 3
.L152:
	movq	16(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L168
.L153:
	cmpq	%rsi, 8(%rbx)
	jne	.L152
	movq	(%rbx), %r12
	testq	%r12, %r12
	je	.L152
	movq	%rsi, %r8
	movq	%rbp, %rdx
	movq	%r12, %rcx
	call	strncmp
	movq	16(%rbx), %rbx
	testl	%eax, %eax
	cmove	%r12, %rdi
	testq	%rbx, %rbx
	jne	.L153
.L168:
	testq	%rdi, %rdi
	jne	.L148
.L151:
	cmpq	$1022, %rsi
	ja	.L169
	movq	string_memory(%rip), %rax
	movq	8(%rax), %rdx
	leaq	(%rdx,%rsi), %rcx
	cmpq	(%rax), %rcx
	jnb	.L170
.L156:
	movq	24(%rax), %rdi
	addq	%rdx, %rdi
	leaq	1(%rdx,%rsi), %rdx
	movq	%rdx, 8(%rax)
.L155:
	movq	%rbp, %rdx
	movq	%rsi, %r8
	movq	%rdi, %rcx
	call	strncpy
	movb	$0, (%rdi,%rsi)
	movl	$24, %ecx
	call	alloc_memory
	movq	all_string_list(%rip), %rdx
	movq	%rdi, (%rax)
	movq	%rsi, 8(%rax)
	movq	%rdx, 16(%rax)
	movq	%rax, all_string_list(%rip)
.L148:
	addq	$32, %rsp
	movq	%rdi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L167:
	call	init.part.0
	jmp	.L149
	.p2align 4,,10
	.p2align 3
.L169:
	leaq	1(%rsi), %rbx
	addq	%rbx, string_memory_count(%rip)
	movq	%rbx, %rcx
	addq	%rbx, string_memory_used(%rip)
	call	malloc
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %r12
	movq	%rax, %rdi
	call	*%r12
	movq	%rbx, %r8
	leaq	.LC37(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	testq	%rdi, %rdi
	jne	.L155
	movl	$2, %ecx
	call	*%r12
	leaq	.LC18(%rip), %rcx
	movl	$30, %r8d
	movl	$1, %edx
	movq	%rax, %r9
	call	fwrite
	movl	$1, %ecx
	call	exit
	.p2align 4,,10
	.p2align 3
.L157:
	addq	$32, %rsp
	xorl	%edi, %edi
	popq	%rbx
	movq	%rdi, %rax
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L170:
	xorl	%ecx, %ecx
	call	increase_memory_size
	movq	string_memory(%rip), %rax
	movq	8(%rax), %rdx
	jmp	.L156
	.section .rdata,"dr"
.LC38:
	.ascii "\0"
.LC39:
	.ascii "%s/%s\0"
	.text
	.p2align 4
	.def	absolute_path;	.scl	3;	.type	32;	.endef
absolute_path:
	pushq	%r13
	pushq	%r12
	leaq	.LC38(%rip), %r12
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$40, %rsp
	.p2align 4,,10
	.p2align 3
.L191:
	movq	%rbx, %rcx
	call	strlen
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	xorl	%ebx, %ebx
	movq	%rax, %rdx
	call	create_string_check
	movq	%rax, %rcx
	movq	%rax, %rsi
	call	strlen
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L172
	jmp	.L189
	.p2align 4,,10
	.p2align 3
.L174:
	cmpq	$1, %rbx
	jbe	.L179
	leaq	1(%rbx), %rdx
	cmpb	$47, %cl
	je	.L180
.L196:
	movq	%rdx, %rbx
.L181:
	cmpq	%rdi, %rbx
	jnb	.L212
.L172:
	leaq	(%rsi,%rbx), %r10
	movzbl	(%r10), %ecx
	cmpb	$92, %cl
	jne	.L174
	movb	$47, (%r10)
	cmpq	$1, %rbx
	jbe	.L179
	leaq	1(%rbx), %rdx
.L180:
	leaq	-1(%rsi,%rbx), %rcx
	movzbl	(%rcx), %eax
	cmpb	$46, %al
	je	.L213
.L177:
	cmpb	$47, %al
	jne	.L196
	movq	%rdi, %r8
	addq	%rsi, %rdx
	movq	%r10, %rcx
	subq	$1, %rdi
	subq	%rbx, %r8
	call	memmove
	cmpq	%rdi, %rbx
	jb	.L172
	.p2align 4,,10
	.p2align 3
.L212:
	cmpq	$2, %rdi
	jbe	.L183
	movzbl	(%rsi), %eax
	cmpb	$47, %al
	je	.L214
	subl	$65, %eax
	cmpb	$25, %al
	ja	.L173
.L192:
	cmpb	$58, 1(%rsi)
	je	.L171
.L173:
	testq	%rbp, %rbp
	je	.L215
.L190:
	movq	%rbp, %rcx
	call	strlen
	xorl	%r8d, %r8d
	movq	%r12, %rcx
	leaq	2(%rdi,%rax), %rdi
	movq	%rdi, %rdx
	call	create_string_check
	movq	%rbp, %r8
	movq	%rsi, %r9
	xorl	%ebp, %ebp
	movq	%rax, %rbx
	leaq	.LC39(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movq	%rbx, %rcx
	movl	$1, %r8d
	movq	%rdi, %rdx
	call	create_string_check
	movq	%rax, %rbx
	jmp	.L191
	.p2align 4,,10
	.p2align 3
.L213:
	cmpb	$47, -2(%rsi,%rbx)
	leaq	-2(%rbx), %r13
	jne	.L196
	movq	%rdi, %r8
	addq	%rsi, %rdx
	subq	$2, %rdi
	subq	%rbx, %r8
	movq	%r13, %rbx
	call	memmove
	.p2align 4,,10
	.p2align 3
.L179:
	testq	%rbx, %rbx
	jne	.L216
	movl	$1, %ebx
	jmp	.L181
	.p2align 4,,10
	.p2align 3
.L183:
	je	.L217
	testq	%rdi, %rdi
	jne	.L218
.L189:
	xorl	%edi, %edi
	testq	%rbp, %rbp
	jne	.L190
.L215:
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	getcwd
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L190
.L171:
	addq	$40, %rsp
	movq	%rsi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L218:
	movzbl	(%rsi), %eax
.L187:
	cmpb	$47, %al
	jne	.L173
	jmp	.L171
	.p2align 4,,10
	.p2align 3
.L214:
	movzbl	1(%rsi), %eax
	leal	-97(%rax), %edx
	cmpb	$25, %dl
	ja	.L171
	cmpb	$47, 2(%rsi)
	jne	.L171
	subl	$32, %eax
	movb	$58, 1(%rsi)
	movb	%al, (%rsi)
	jmp	.L171
	.p2align 4,,10
	.p2align 3
.L217:
	movzbl	(%rsi), %eax
	leal	-65(%rax), %edx
	cmpb	$25, %dl
	jbe	.L192
	jmp	.L187
.L216:
	leaq	(%rsi,%rbx), %r10
	leaq	1(%rbx), %rdx
	cmpb	$47, (%r10)
	jne	.L196
	movzbl	-1(%rsi,%rbx), %eax
	jmp	.L177
	.section .rdata,"dr"
.LC40:
	.ascii "%zu/%zu bytes\0"
	.align 8
.LC41:
	.ascii "Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu\0"
	.text
	.p2align 4
	.def	get_info;	.scl	3;	.type	32;	.endef
get_info:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	xorl	%ebx, %ebx
	subq	$64, %rsp
	movq	all_string_list(%rip), %rax
	testq	%rax, %rax
	je	.L220
	.p2align 4,,10
	.p2align 3
.L221:
	movq	16(%rax), %rax
	addq	$1, %rbx
	testq	%rax, %rax
	jne	.L221
.L220:
	leaq	.LC38(%rip), %rsi
	xorl	%r8d, %r8d
	movl	$48, %edx
	movq	%rsi, %rcx
	leaq	.LC40(%rip), %r12
	call	create_string_check
	movq	struct_memory_count(%rip), %r9
	movq	%r12, %rdx
	movq	struct_memory_used(%rip), %r8
	movq	%rax, %rdi
	movq	struct_memory(%rip), %rax
	movq	%rdi, %rcx
	addq	8(%rax), %r8
	call	sprintf
	movq	%rsi, %rcx
	xorl	%r8d, %r8d
	movl	$48, %edx
	call	create_string_check
	movq	string_memory_count(%rip), %r9
	movq	%r12, %rdx
	movq	string_memory_used(%rip), %r8
	movq	%rax, %rbp
	movq	string_memory(%rip), %rax
	movq	%rbp, %rcx
	addq	8(%rax), %r8
	call	sprintf
	movq	%rsi, %rcx
	xorl	%r8d, %r8d
	movl	$240, %edx
	call	create_string_check
	movq	%rbx, 40(%rsp)
	movq	%rdi, %r9
	movl	$2, %r8d
	movq	%rax, %rsi
	movq	memoryBlockCount(%rip), %rax
	movq	%rbp, 32(%rsp)
	leaq	.LC41(%rip), %rdx
	movq	%rsi, %rcx
	movq	%rax, 48(%rsp)
	call	sprintf
	addq	$64, %rsp
	movq	%rsi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4
	.def	get_file_dir;	.scl	3;	.type	32;	.endef
get_file_dir:
	movq	(%rcx), %rdx
	testq	%rdx, %rdx
	je	.L252
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rdi
	xorl	%edi, %edi
	pushq	%rsi
	xorl	%esi, %esi
	pushq	%rbx
	subq	$56, %rsp
	movq	8(%rdx), %rbx
	testq	%rbx, %rbx
	je	.L225
	.p2align 4,,10
	.p2align 3
.L227:
	movq	(%rdx), %rcx
	addq	$1, %rdi
	call	strlen
	movq	%rbx, %rdx
	addq	%rax, %rsi
	movq	8(%rbx), %rax
	testq	%rax, %rax
	je	.L256
	movq	%rax, %rbx
	jmp	.L227
	.p2align 4,,10
	.p2align 3
.L256:
	testq	%rdi, %rdi
	je	.L225
	leaq	1(%rsi), %rax
	cmpq	$1, %rdi
	leaq	(%rsi,%rdi), %rdx
	cmove	%rax, %rdx
	leaq	.LC38(%rip), %rcx
	xorl	%r8d, %r8d
	call	create_string_check
	movb	$0, (%rax)
	movq	0(%rbp), %rbx
	movq	%rax, %rsi
	testq	%rbx, %rbx
	je	.L233
	cmpq	$0, 8(%rbx)
	je	.L233
.L255:
	movq	(%rbx), %rdx
.L235:
	movq	%rsi, %rcx
	call	strcat
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L233
	cmpq	$0, 8(%rbx)
	je	.L233
	movq	(%rbx), %rdx
	cmpb	$47, (%rdx)
	je	.L257
.L238:
	cmpb	$0, (%rsi)
	je	.L235
	movq	%rsi, %rcx
	movq	%rdx, 40(%rsp)
	call	strlen
	movq	40(%rsp), %rdx
	cmpb	$47, -1(%rsi,%rax)
	je	.L235
	movl	$47, %edx
	movw	%dx, (%rsi,%rax)
	jmp	.L255
	.p2align 4,,10
	.p2align 3
.L233:
	movq	%rsi, %rcx
	call	strlen
	addq	$56, %rsp
	movq	%rsi, %rcx
	movl	$1, %r8d
	popq	%rbx
	movq	%rax, %rdx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	create_string_check
	.p2align 4,,10
	.p2align 3
.L257:
	cmpb	$0, 1(%rdx)
	je	.L235
	jmp	.L238
.L225:
	addq	$56, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L252:
	xorl	%eax, %eax
	ret
	.section .rdata,"dr"
.LC42:
	.ascii "%s/%s%s\0"
.LC43:
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
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L272
	movq	%rax, %rcx
	movq	8(%rbx), %rbp
	call	strlen
	movq	16(%rbx), %rcx
	movq	%rax, %rsi
	call	strlen
	addq	%rax, %rsi
	testq	%rbp, %rbp
	je	.L266
	addq	$1, %rsi
	movq	%rdi, %r13
	leaq	.LC38(%rip), %r12
.L267:
	movq	%rbp, %rcx
	call	strlen
	xorl	%r8d, %r8d
	movq	%r12, %rcx
	leaq	1(%rsi,%rax), %rdx
	call	create_string_check
	movq	%rax, %rsi
	testq	%rdi, %rdi
	je	.L261
.L263:
	cmpb	$0, 0(%r13)
	jne	.L273
.L261:
	movq	16(%rbx), %r8
	movq	%rbp, %r9
	leaq	.LC43(%rip), %rdx
	movq	%rsi, %rcx
	call	sprintf
.L262:
	movq	%rsi, %rcx
	call	strlen
	movq	%rsi, %rcx
	movl	$1, %r8d
	movq	%rax, %rdx
	call	create_string_check
	movq	%rax, 24(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L266:
	leaq	.LC38(%rip), %rbp
	leaq	2(%rsi), %rdx
	xorl	%r8d, %r8d
	movq	%rdi, %r13
	movq	%rbp, %rcx
	call	create_string_check
	movq	%rax, %rsi
	jmp	.L263
.L272:
	movq	8(%rbx), %rbp
	movq	16(%rbx), %rcx
	call	strlen
	testq	%rbp, %rbp
	je	.L274
	leaq	.LC38(%rip), %r12
	leaq	1(%rax), %rsi
	movq	%r12, %r13
	jmp	.L267
.L273:
	movq	%rbp, 32(%rsp)
	movq	16(%rbx), %r9
	movq	%r13, %r8
	movq	%rsi, %rcx
	leaq	.LC42(%rip), %rdx
	call	sprintf
	jmp	.L262
.L274:
	leaq	.LC38(%rip), %rbp
	leaq	2(%rax), %rdx
	xorl	%r8d, %r8d
	movq	%rbp, %rcx
	call	create_string_check
	movq	%rax, %rsi
	jmp	.L261
	.p2align 4
	.def	read_source.constprop.0;	.scl	3;	.type	32;	.endef
read_source.constprop.0:
	pushq	%rdi
	movl	$2, %r8d
	movq	%rcx, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	xorl	%edx, %edx
	pushq	%rbx
	subq	$32, %rsp
	call	fseek
	movq	%rdi, %rcx
	call	ftell
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rdi, %rcx
	cltq
	movq	%rax, (%rsi)
	call	fseek
	movq	(%rsi), %rax
	xorl	%r8d, %r8d
	leaq	.LC38(%rip), %rcx
	leaq	1(%rax), %rdx
	call	create_string_check
	movq	(%rsi), %r8
	movq	%rdi, %r9
	movl	$1, %edx
	movq	%rax, %rcx
	movq	%rax, %rbx
	call	fread
	movb	$0, (%rbx,%rax)
	movq	%rax, (%rsi)
	testq	%rax, %rax
	je	.L275
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L278:
	movzbl	(%rbx,%rax), %edx
	andl	$-5, %edx
	cmpb	$9, %dl
	jne	.L277
	movb	$32, (%rbx,%rax)
.L277:
	addq	$1, %rax
	cmpq	(%rsi), %rax
	jb	.L278
.L275:
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.section .rdata,"dr"
	.align 8
.LC44:
	.ascii "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\12\0"
	.align 8
.LC45:
	.ascii "Error creating variable access: content is NULL\12\0"
	.align 8
.LC46:
	.ascii "Error creating variable access: unknown type %u\12\0"
	.text
	.p2align 4
	.def	create_variable_access;	.scl	3;	.type	32;	.endef
create_variable_access:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movl	%ecx, %ebx
	subq	$32, %rsp
	testl	%ecx, %ecx
	sete	%al
	testq	%rdx, %rdx
	sete	%r12b
	cmpb	%al, %r12b
	jne	.L324
	movq	%r8, %rdi
	movl	$24, %ecx
	movq	%r9, %rbp
	call	alloc_memory
	testq	%rdi, %rdi
	movl	%ebx, 16(%rax)
	setne	%dl
	movq	%rsi, (%rax)
	testb	%r12b, %r12b
	je	.L289
	testb	%dl, %dl
	je	.L289
.L323:
	movq	%rdi, 8(%rax)
.L284:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L289:
	cmpl	$1, %ebx
	jne	.L291
	cmpq	$0, 112(%rsp)
	je	.L291
	movq	112(%rsp), %rsi
	movq	%rsi, 8(%rax)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L324:
	leaq	.LC24(%rip), %rax
	leaq	.LC25(%rip), %r8
	testl	%ecx, %ecx
	movl	$2, %ecx
	movq	%rax, %rdi
	cmovne	%r8, %rdi
	testq	%rdx, %rdx
	cmovne	%r8, %rax
	movq	%rax, %rbx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, %r9
	movq	%rbx, %r8
	leaq	.LC44(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L284
	.p2align 4,,10
	.p2align 3
.L291:
	cmpl	$3, %ebx
	jne	.L293
	testq	%rbp, %rbp
	je	.L293
	movq	%rbp, 8(%rax)
	jmp	.L284
	.p2align 4,,10
	.p2align 3
.L293:
	cmpl	$2, %ebx
	jne	.L294
	testb	%dl, %dl
	jne	.L323
.L294:
	movq	112(%rsp), %r9
	movl	$2, %ecx
	orq	%rbp, %r9
	orq	%r9, %rdi
	je	.L325
	call	*__imp___acrt_iob_func(%rip)
	movl	%ebx, %r8d
	leaq	.LC46(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L284
.L325:
	call	*__imp___acrt_iob_func(%rip)
	movl	$48, %r8d
	movl	$1, %edx
	leaq	.LC45(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L284
	.section .rdata,"dr"
	.align 8
.LC47:
	.ascii "Error creating primary: value is NULL\12\0"
	.align 8
.LC48:
	.ascii "Error creating primary: unknown type %u\12\0"
	.text
	.p2align 4
	.def	create_primary;	.scl	3;	.type	32;	.endef
create_primary:
	pushq	%rbp
	movq	%r8, %rbp
	pushq	%rdi
	movq	%r9, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movl	%ecx, %ebx
	movl	$16, %ecx
	subq	$40, %rsp
	call	alloc_memory
	movl	%ebx, 8(%rax)
	cmpl	$4, %ebx
	ja	.L327
	testq	%rsi, %rsi
	je	.L327
	movq	%rsi, (%rax)
.L326:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L327:
	cmpl	$5, %ebx
	jne	.L329
	testq	%rbp, %rbp
	je	.L329
	movq	%rbp, (%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L329:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	jbe	.L358
	cmpl	$8, %ebx
	jne	.L332
	cmpq	$0, 112(%rsp)
	je	.L332
	movq	112(%rsp), %rdi
.L357:
	movq	%rdi, (%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L358:
	testq	%rdi, %rdi
	jne	.L357
.L332:
	movq	112(%rsp), %rax
	movq	%rbp, %r8
	movl	$2, %ecx
	orq	%rdi, %rax
	orq	%rax, %r8
	orq	%r8, %rsi
	jne	.L333
	call	*__imp___acrt_iob_func(%rip)
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC47(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L326
	.p2align 4,,10
	.p2align 3
.L333:
	call	*__imp___acrt_iob_func(%rip)
	movl	%ebx, %r8d
	leaq	.LC48(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L326
	.section .rdata,"dr"
	.align 8
.LC49:
	.ascii "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\12\0"
	.align 8
.LC50:
	.ascii "Error creating expression: both expr_left and prim_left are NULL\12\0"
	.text
	.p2align 4
	.def	create_expression;	.scl	3;	.type	32;	.endef
create_expression:
	pushq	%r12
	pushq	%rbp
	movq	%r8, %rbp
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	movq	%r9, %rsi
	pushq	%rbx
	movl	%ecx, %ebx
	subq	$48, %rsp
	cmpl	$19, %ecx
	sete	%dl
	testq	%r9, %r9
	sete	%al
	cmpb	%al, %dl
	jne	.L360
	movq	%r8, %rax
	orq	%rdi, %rax
	je	.L377
	movl	$32, %ecx
	call	alloc_memory
	movl	%ebx, 24(%rax)
	testq	%rdi, %rdi
	je	.L367
	movq	%rdi, (%rax)
.L368:
	movq	%rsi, 16(%rax)
.L359:
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L377:
	leaq	.LC24(%rip), %rbp
	testq	%r9, %r9
	je	.L371
	leaq	.LC25(%rip), %r12
	movq	%rbp, %rsi
	jmp	.L362
	.p2align 4,,10
	.p2align 3
.L360:
	leaq	.LC24(%rip), %rax
	leaq	.LC25(%rip), %r9
	testq	%rsi, %rsi
	movq	%rax, %r12
	movq	%rax, %rbp
	cmovne	%r9, %r12
	testq	%r8, %r8
	cmovne	%r9, %rbp
	testq	%rdi, %rdi
	cmovne	%r9, %rax
	movq	%rax, %rsi
.L362:
	cmpl	$19, %ebx
	leaq	.LC24(%rip), %rax
	leaq	.LC25(%rip), %rbx
	movl	$2, %ecx
	cmove	%rax, %rbx
	call	*__imp___acrt_iob_func(%rip)
	movq	%r12, 40(%rsp)
	movq	%rsi, %r9
	leaq	.LC49(%rip), %rdx
	movq	%rbp, 32(%rsp)
	movq	%rax, %rcx
	movq	%rbx, %r8
	call	fprintf
	xorl	%eax, %eax
	jmp	.L359
	.p2align 4,,10
	.p2align 3
.L371:
	movq	%rbp, %r12
	movq	%rbp, %rsi
	jmp	.L362
	.p2align 4,,10
	.p2align 3
.L367:
	testq	%rbp, %rbp
	je	.L369
	movq	%rbp, 8(%rax)
	jmp	.L368
.L369:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$65, %r8d
	movl	$1, %edx
	leaq	.LC50(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L359
	.section .rdata,"dr"
	.align 8
.LC51:
	.ascii "Error creating statement: content is NULL\12\0"
	.align 8
.LC52:
	.ascii "Error creating statement: unknown type %u\12\0"
	.text
	.p2align 4
	.def	create_statement;	.scl	3;	.type	32;	.endef
create_statement:
	pushq	%r12
	pushq	%rbp
	movq	%r8, %rbp
	pushq	%rdi
	movq	%r9, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movl	%ecx, %ebx
	movl	$16, %ecx
	subq	$32, %rsp
	movq	112(%rsp), %r12
	call	alloc_memory
	movl	%ebx, 8(%rax)
	testl	%ebx, %ebx
	jne	.L379
	testq	%r12, %r12
	je	.L379
.L421:
	movq	%r12, (%rax)
.L378:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L379:
	cmpl	$1, %ebx
	jne	.L381
	cmpq	$0, 120(%rsp)
	je	.L381
	movq	120(%rsp), %rdi
	movq	%rdi, (%rax)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L381:
	cmpl	$2, %ebx
	jne	.L383
	testq	%rsi, %rsi
	je	.L383
	movq	%rsi, (%rax)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L383:
	cmpl	$3, %ebx
	jne	.L384
	testq	%rbp, %rbp
	je	.L384
	movq	%rbp, (%rax)
	jmp	.L378
	.p2align 4,,10
	.p2align 3
.L384:
	cmpl	$4, %ebx
	jne	.L385
	testq	%rdi, %rdi
	je	.L385
	movq	%rdi, (%rax)
	jmp	.L378
	.p2align 4,,10
	.p2align 3
.L385:
	cmpl	$5, %ebx
	je	.L421
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L387
	movq	$0, (%rax)
	jmp	.L378
.L387:
	orq	%rbp, %rdi
	movq	120(%rsp), %rax
	movl	$2, %ecx
	orq	%rdi, %rsi
	orq	%rsi, %rax
	orq	%r12, %rax
	je	.L422
	call	*__imp___acrt_iob_func(%rip)
	movl	%ebx, %r8d
	leaq	.LC52(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L378
.L422:
	call	*__imp___acrt_iob_func(%rip)
	movl	$42, %r8d
	movl	$1, %edx
	leaq	.LC51(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L378
	.section .rdata,"dr"
	.align 8
.LC53:
	.ascii "Error creating class member: content is NULL\12\0"
	.align 8
.LC54:
	.ascii "Error creating class member: unknown type %u\12\0"
	.text
	.p2align 4
	.def	create_class_member;	.scl	3;	.type	32;	.endef
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
	testb	$1, %bl
	jne	.L424
	testq	%rsi, %rsi
	je	.L424
	movq	%rsi, (%rax)
.L423:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L424:
	testq	%rdi, %rdi
	je	.L426
	testb	$1, %bl
	je	.L426
	movq	%rdi, (%rax)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L426:
	orq	%rsi, %rdi
	movl	$2, %ecx
	jne	.L428
	call	*__imp___acrt_iob_func(%rip)
	movl	$45, %r8d
	movl	$1, %edx
	leaq	.LC53(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L423
	.p2align 4,,10
	.p2align 3
.L428:
	call	*__imp___acrt_iob_func(%rip)
	movl	%ebx, %r8d
	leaq	.LC54(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L423
	.section .rdata,"dr"
	.align 8
.LC55:
	.ascii "Error creating code member: content is NULL\12\0"
	.align 8
.LC56:
	.ascii "Error creating code member: unknown type %u\12\0"
	.text
	.p2align 4
	.def	create_code_member;	.scl	3;	.type	32;	.endef
create_code_member:
	pushq	%r12
	movq	%r9, %r12
	pushq	%rbp
	movq	%r8, %rbp
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	movl	%ecx, %esi
	movl	$16, %ecx
	pushq	%rbx
	subq	$32, %rsp
	call	alloc_memory
	movl	%esi, 8(%rax)
	movq	%rax, %rbx
	testl	%esi, %esi
	jne	.L444
	testq	%rdi, %rdi
	je	.L444
	movq	%rdi, (%rax)
.L443:
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L444:
	cmpl	$1, %esi
	jne	.L446
	testq	%rbp, %rbp
	je	.L446
	movq	%rbp, (%rbx)
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L446:
	cmpl	$2, %esi
	jne	.L447
	testq	%r12, %r12
	je	.L447
	movq	%r12, (%rbx)
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L447:
	movq	%r12, %r9
	movl	$2, %ecx
	orq	%rbp, %r9
	orq	%r9, %rdi
	je	.L468
	call	*__imp___acrt_iob_func(%rip)
	movl	%esi, %r8d
	leaq	.LC56(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L468:
	call	*__imp___acrt_iob_func(%rip)
	movl	$44, %r8d
	movl	$1, %edx
	leaq	.LC55(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L443
	.section .rdata,"dr"
	.align 8
.LC57:
	.ascii "Error: list_append received NULL list\12\0"
	.text
	.p2align 4
	.def	list_append;	.scl	3;	.type	32;	.endef
list_append:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	testq	%rcx, %rcx
	je	.L474
	movq	%rcx, %rbx
	movl	$16, %ecx
	movq	%rdx, %rsi
	call	alloc_memory
	cmpq	$0, (%rbx)
	movq	$0, (%rax)
	movq	%rsi, 8(%rax)
	je	.L475
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rbx)
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L475:
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm0
	movups	%xmm0, (%rbx)
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L474:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	-16(%rbp), %rsp
	movl	$38, %r8d
	movl	$1, %edx
	popq	%rbx
	movq	%rax, %r9
	leaq	.LC57(%rip), %rcx
	popq	%rsi
	popq	%rbp
	jmp	fwrite
	.p2align 4
	.def	create_subroutine;	.scl	3;	.type	32;	.endef
create_subroutine:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	movq	%rcx, %rdi
	movl	$40, %ecx
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$32, %rsp
	movups	%xmm6, 32(%rsp)
	pxor	%xmm6, %xmm6
	call	alloc_memory
	movl	$16, %ecx
	movq	%rdi, (%rax)
	movq	%rax, %rbx
	movq	%rsi, 8(%rax)
	call	alloc_memory
	movl	$16, %ecx
	movups	%xmm6, (%rax)
	movq	%rax, 16(%rbx)
	call	alloc_memory
	movl	$16, %ecx
	movups	%xmm6, (%rax)
	movq	%rax, 24(%rbx)
	call	alloc_memory
	movups	%xmm6, (%rax)
	movq	%rax, 32(%rbx)
	movups	32(%rsp), %xmm6
	leaq	-24(%rbp), %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC58:
	.ascii "/\0"
	.align 8
.LC59:
	.ascii "Warning: Path component too long, truncating to %zu characters\12\0"
.LC60:
	.ascii ".\0"
.LC61:
	.ascii "..\0"
	.text
	.p2align 4
	.def	normalize_path;	.scl	3;	.type	32;	.endef
normalize_path:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rdi
	pushq	%rsi
	xorl	%esi, %esi
	pushq	%rbx
	xorl	%ebx, %ebx
	andq	$-16, %rsp
	subq	$304, %rsp
	movq	24(%rcx), %rcx
	call	strlen
	xorl	%r8d, %r8d
	leaq	.LC38(%rip), %rcx
	leaq	1(%rax), %rdx
	movq	%rax, %rdi
	call	create_string_check
	movq	24(%r12), %rdx
	movq	%rax, %rcx
	movq	%rax, %r14
	call	strcpy
	testq	%rdi, %rdi
	je	.L479
	cmpb	$47, (%r14)
	je	.L546
.L479:
	leaq	48(%rsp), %rax
	movq	%rsi, %r15
	movq	%rbx, %r13
	movq	%rax, 32(%rsp)
	jmp	.L496
	.p2align 4,,10
	.p2align 3
.L483:
	cmpq	%rsi, %rdi
	jb	.L482
.L496:
	movq	%rsi, %r8
	addq	$1, %rsi
	cmpq	%r8, %rdi
	je	.L547
	cmpb	$47, (%r14,%r8)
	jne	.L483
	cmpq	%r8, %r15
	jnb	.L484
.L481:
	movq	%r8, %r11
	subq	%r15, %r11
	cmpq	$255, %r11
	ja	.L548
.L485:
	leaq	(%r14,%r15), %rdx
	movq	32(%rsp), %r15
	movq	%r11, %r8
	movq	%r11, 40(%rsp)
	movq	%r15, %rcx
	call	strncpy
	movq	40(%rsp), %r11
	movb	$0, 48(%rsp,%r11)
	cmpw	$46, (%r15)
	je	.L484
	cmpw	$11822, (%r15)
	je	.L549
.L489:
	cmpb	$0, 48(%rsp)
	jne	.L550
	.p2align 4,,10
	.p2align 3
.L484:
	movq	%rsi, %r15
	jmp	.L483
	.p2align 4,,10
	.p2align 3
.L547:
	cmpq	%rdi, %r15
	jb	.L481
.L482:
	movq	%rbx, (%r12)
	testq	%r13, %r13
	je	.L497
	movq	0(%r13), %r13
	movl	$46, %edx
	movq	%r13, %rcx
	call	strrchr
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L497
	cmpq	%rax, %r13
	je	.L497
	movq	%rax, %rdx
	movl	$1, %r8d
	movq	%r13, %rcx
	subq	%r13, %rdx
	call	create_string_check
	movq	%rsi, %rcx
	movq	%rax, 16(%r12)
	call	strlen
	movl	$1, %r8d
	movq	%rsi, %rcx
	movq	%rax, %rdx
	call	create_string_check
	movq	%rax, 8(%r12)
	testq	%rbx, %rbx
	je	.L499
.L552:
	movq	%rbx, %rsi
	xorl	%r14d, %r14d
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L500:
	movq	(%rsi), %rcx
	addq	$1, %r14
	call	strlen
	movq	8(%rsi), %rsi
	addq	%rax, %rdi
	testq	%rsi, %rsi
	jne	.L500
	cmpq	$1, %r14
	leaq	1(%rdi), %rax
	leaq	(%rdi,%r14), %rdx
	cmovbe	%rax, %rdx
	leaq	.LC38(%rip), %rcx
	xorl	%r8d, %r8d
	call	create_string_check
	movb	$0, (%rax)
	movq	(%rbx), %rdx
	movq	%rax, %rsi
	.p2align 4,,10
	.p2align 3
.L506:
	movq	%rsi, %rcx
	call	strcat
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L502
	movq	(%rbx), %rdx
	cmpb	$47, (%rdx)
	je	.L551
.L509:
	cmpb	$0, (%rsi)
	je	.L506
	movq	%rsi, %rcx
	movq	%rdx, 40(%rsp)
	call	strlen
	movq	40(%rsp), %rdx
	cmpb	$47, -1(%rsi,%rax)
	je	.L506
	movl	$47, %edx
	movw	%dx, (%rsi,%rax)
	movq	(%rbx), %rdx
	jmp	.L506
	.p2align 4,,10
	.p2align 3
.L548:
	movq	%r11, 40(%rsp)
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	40(%rsp), %r8
	leaq	.LC59(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$255, %r11d
	jmp	.L485
	.p2align 4,,10
	.p2align 3
.L497:
	xorl	%eax, %eax
	movq	%r13, 16(%r12)
	movq	%rax, 8(%r12)
	testq	%rbx, %rbx
	jne	.L552
.L499:
	xorl	%r8d, %r8d
	movl	$1, %edx
	leaq	.LC38(%rip), %rcx
	call	create_string_check
	movb	$0, (%rax)
	movq	%rax, %rsi
.L502:
	movq	%rsi, %rcx
	call	strlen
	movq	%rsi, %rcx
	movl	$1, %r8d
	movq	%rax, %rdx
	call	create_string_check
	movq	%rax, 24(%r12)
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
	.p2align 4,,10
	.p2align 3
.L551:
	cmpb	$0, 1(%rdx)
	je	.L506
	jmp	.L509
	.p2align 4,,10
	.p2align 3
.L549:
	movq	32(%rsp), %rax
	cmpb	$0, 2(%rax)
	jne	.L489
	testq	%r13, %r13
	je	.L492
	cmpq	%r13, %rbx
	je	.L492
	movq	0(%r13), %rax
	cmpb	$46, (%rax)
	je	.L553
.L512:
	movq	%rbx, %rax
	jmp	.L494
	.p2align 4,,10
	.p2align 3
.L513:
	movq	%rdx, %rax
.L494:
	testq	%rax, %rax
	je	.L484
	movq	8(%rax), %rdx
	cmpq	%r13, %rdx
	jne	.L513
	movq	$0, 8(%rax)
	movq	%rax, %r13
	jmp	.L484
	.p2align 4,,10
	.p2align 3
.L546:
	movl	$16, %ecx
	movl	$1, %esi
	call	alloc_memory
	movl	$1, %r8d
	movl	$1, %edx
	leaq	.LC58(%rip), %rcx
	movq	%rax, %rbx
	call	create_string_check
	movq	$0, 8(%rbx)
	movq	%rax, (%rbx)
	jmp	.L479
	.p2align 4,,10
	.p2align 3
.L492:
	testq	%rbx, %rbx
	jne	.L484
	movl	$16, %ecx
	call	alloc_memory
	movl	$1, %r8d
	movl	$2, %edx
	leaq	.LC61(%rip), %rcx
	movq	%rax, %rbx
	call	create_string_check
	movq	%rbx, %r13
	movq	$0, 8(%rbx)
	movq	%rax, (%rbx)
	jmp	.L484
	.p2align 4,,10
	.p2align 3
.L550:
	movl	$16, %ecx
	movq	%r11, 40(%rsp)
	call	alloc_memory
	movq	40(%rsp), %rdx
	movq	32(%rsp), %rcx
	movl	$1, %r8d
	movq	%rax, %r15
	call	create_string_check
	movq	$0, 8(%r15)
	movq	%rax, (%r15)
	testq	%r13, %r13
	je	.L495
	movq	%r15, 8(%r13)
.L495:
	movq	%r15, %r13
	testq	%rbx, %rbx
	jne	.L484
	movq	%r15, %rbx
	movq	%r15, %r13
	jmp	.L484
	.p2align 4,,10
	.p2align 3
.L553:
	cmpb	$46, 1(%rax)
	jne	.L512
	cmpb	$0, 2(%rax)
	jne	.L512
	movl	$16, %ecx
	call	alloc_memory
	movl	$1, %r8d
	movl	$2, %edx
	leaq	.LC61(%rip), %rcx
	movq	%rax, %r15
	call	create_string_check
	movq	$0, 8(%r15)
	movq	%rax, (%r15)
	movq	%r15, 8(%r13)
	movq	%r15, %r13
	jmp	.L484
	.section .rdata,"dr"
	.align 8
.LC62:
	.ascii "[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\12\0"
	.align 8
.LC63:
	.ascii "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\12\0"
	.text
	.p2align 4
	.def	create_symbol;	.scl	3;	.type	32;	.endef
create_symbol:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%r8, %r12
	pushq	%rbp
	movq	%r9, %rbp
	pushq	%rdi
	movl	%edx, %edi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$56, %rsp
	cmpl	$2, %edx
	je	.L555
	jbe	.L589
	movq	%r9, %r13
	testq	%r9, %r9
	je	.L590
.L559:
	movq	%r13, %rcx
.L567:
	movq	8(%rcx), %rax
	jmp	.L588
	.p2align 4,,10
	.p2align 3
.L591:
	movq	8(%rax), %rdx
	cmpq	8(%rdx), %rbx
	je	.L565
.L588:
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L591
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	jne	.L567
	.p2align 4,,10
	.p2align 3
.L574:
	movl	$40, %ecx
	call	alloc_memory
	movq	8(%r13), %rcx
	movq	%rax, %rsi
	movq	%rbx, 8(%rax)
	movq	id_counter.0(%rip), %rax
	movl	%edi, 32(%rsi)
	movq	%rsi, %rdx
	addq	$1, %rax
	movq	%r12, (%rsi)
	movq	%rax, id_counter.0(%rip)
	movq	%rax, 16(%rsi)
	movq	%rbp, 24(%rsi)
	call	list_append
.L554:
	addq	$56, %rsp
	movq	%rsi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L589:
	cmpl	$1, %edx
	jne	.L592
	movq	32(%r9), %rax
	movq	(%rax), %r13
	testq	%r13, %r13
	jne	.L559
	movl	$40, %ecx
	call	alloc_memory
	movq	%rbx, 8(%rax)
	movq	%rax, %rsi
	movq	id_counter.0(%rip), %rax
	movl	$1, 32(%rsi)
	leaq	1(%rax), %r13
	movq	%r13, id_counter.0(%rip)
	movq	%r13, 16(%rsi)
	movq	%r12, (%rsi)
	movq	%rbp, 24(%rsi)
	jmp	.L575
	.p2align 4,,10
	.p2align 3
.L565:
	movq	id_counter.0(%rip), %rax
	movq	16(%rdx), %r15
	movl	$2, %ecx
	movl	32(%rdx), %r14d
	leaq	1(%rax), %rsi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 40(%rsp)
	movl	%r14d, %r9d
	movq	%rbx, %r8
	movq	%r15, 32(%rsp)
	movq	%rax, %rcx
	leaq	.LC63(%rip), %rdx
	call	fprintf
	jmp	.L574
	.p2align 4,,10
	.p2align 3
.L555:
	movq	32(%r9), %rax
	movq	(%rax), %r13
	testq	%r13, %r13
	jne	.L559
	movl	$40, %ecx
	call	alloc_memory
	movq	%rbx, 8(%rax)
	movq	%rax, %rsi
	movq	id_counter.0(%rip), %rax
	movl	$2, 32(%rsi)
	leaq	1(%rax), %r13
	movq	%r13, id_counter.0(%rip)
	movq	%r13, 16(%rsi)
	movq	%r12, (%rsi)
	movq	%rbp, 24(%rsi)
	jmp	.L575
	.p2align 4,,10
	.p2align 3
.L592:
	movq	16(%r9), %rax
	movq	(%rax), %r13
	testq	%r13, %r13
	jne	.L559
	movl	$40, %ecx
	call	alloc_memory
	movq	%rbx, 8(%rax)
	movq	%rax, %rsi
	movq	id_counter.0(%rip), %rax
	movl	$0, 32(%rsi)
	leaq	1(%rax), %r13
	movq	%r13, id_counter.0(%rip)
	movq	%r13, 16(%rsi)
	movq	%r12, (%rsi)
	movq	%rbp, 24(%rsi)
.L575:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%r13, 32(%rsp)
	movl	%edi, %r9d
	movq	%rbx, %r8
	movq	%rax, %rcx
	leaq	.LC62(%rip), %rdx
	call	fprintf
	jmp	.L554
.L590:
	movl	$40, %ecx
	call	alloc_memory
	movq	%rbx, 8(%rax)
	movq	%rax, %rsi
	movq	id_counter.0(%rip), %rax
	movl	%edi, 32(%rsi)
	leaq	1(%rax), %r13
	movq	%r12, (%rsi)
	movq	%r13, id_counter.0(%rip)
	movq	%r13, 16(%rsi)
	movq	$0, 24(%rsi)
	jmp	.L575
	.section .rdata,"dr"
.LC64:
	.ascii "type: \"name\"\12\0"
.LC65:
	.ascii "name\12\0"
.LC66:
	.ascii "type: \"function_call\"\12\0"
.LC67:
	.ascii "function\12\0"
.LC68:
	.ascii "arguments\12\0"
.LC69:
	.ascii "arguments[%d]\12\0"
.LC70:
	.ascii "type: \"get sequence_element\"\12\0"
.LC71:
	.ascii "sequence\12\0"
.LC72:
	.ascii "index\12\0"
.LC73:
	.ascii "type: \"get_attribute\"\12\0"
.LC74:
	.ascii "object\12\0"
.LC75:
	.ascii "attribute_name\12\0"
	.align 8
.LC76:
	.ascii "unknown_VariableAccessType: %u\12\0"
	.text
	.p2align 4
	.def	output_variable_access;	.scl	3;	.type	32;	.endef
output_variable_access:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rdi
	movq	%r8, %rdi
	pushq	%rsi
	movq	%r9, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	andq	$-16, %rsp
	subq	$48, %rsp
	movl	16(%rcx), %eax
	cmpl	$2, %eax
	je	.L594
	ja	.L595
	testl	%eax, %eax
	je	.L613
	movq	8(%rcx), %r14
	leaq	1(%r8), %r13
	testq	%r14, %r14
	je	.L600
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movups	%xmm0, (%rax)
	movdqu	(%r14), %xmm1
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%rax, %r15
	leaq	.LC69(%rip), %r14
	movups	%xmm1, (%rax)
	call	indention
	movq	%rbx, %r9
	movl	$22, %r8d
	movl	$1, %edx
	leaq	.LC66(%rip), %rcx
	call	fwrite
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC67(%rip), %rcx
	call	fwrite
	movq	(%r12), %rcx
	movq	%rsi, %r9
	movq	%r13, %r8
	movq	%rbx, %rdx
	movl	$-1, %r12d
	call	output_variable_access
	movq	%rsi, %r9
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC68(%rip), %rcx
	call	fwrite
	leaq	2(%rdi), %rax
	movq	%rax, 40(%rsp)
	jmp	.L601
	.p2align 4,,10
	.p2align 3
.L604:
	movq	8(%rax), %rdi
	testq	%rdi, %rdi
	je	.L593
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	addl	$1, %r12d
	movq	%r14, %rdx
	movq	%rbx, %rcx
	movl	%r12d, %r8d
	call	fprintf
	movq	40(%rsp), %r8
	movq	%rsi, %r9
	movq	%rbx, %rdx
	movq	%rdi, %rcx
	call	output_expression
.L601:
	movq	(%r15), %rax
	testq	%rax, %rax
	je	.L593
	movq	(%rax), %rdx
	movq	%rdx, (%r15)
	testq	%rdx, %rdx
	jne	.L604
	movq	$0, 8(%r15)
	jmp	.L604
	.p2align 4,,10
	.p2align 3
.L595:
	cmpl	$3, %eax
	jne	.L614
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	leaq	1(%rdi), %r13
	xorl	%r8d, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$29, %r8d
	movl	$1, %edx
	leaq	.LC70(%rip), %rcx
	call	fwrite
	movq	%rsi, %r9
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC71(%rip), %rcx
	call	fwrite
	movq	(%r12), %rcx
	movq	%rsi, %r9
	movq	%r13, %r8
	movq	%rbx, %rdx
	call	output_variable_access
	movq	%rsi, %r9
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC72(%rip), %rcx
	call	fwrite
	movq	8(%r12), %rcx
	movq	%rsi, %r9
	movq	%r13, %r8
	leaq	-56(%rbp), %rsp
	movq	%rbx, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	output_expression
	.p2align 4,,10
	.p2align 3
.L594:
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	leaq	1(%rdi), %r13
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$22, %r8d
	movl	$1, %edx
	leaq	.LC73(%rip), %rcx
	call	fwrite
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC74(%rip), %rcx
	call	fwrite
	movq	(%r12), %rcx
	movq	%rsi, %r9
	movq	%r13, %r8
	movq	%rbx, %rdx
	call	output_variable_access
	movq	%rsi, %r9
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$15, %r8d
	leaq	.LC75(%rip), %rcx
	movl	$1, %edx
	call	fwrite
	movq	8(%r12), %rcx
	movq	%rsi, %r9
	movq	%r13, %r8
.L612:
	leaq	-56(%rbp), %rsp
	movq	%rbx, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	output_name
	.p2align 4,,10
	.p2align 3
.L613:
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC64(%rip), %rcx
	call	fwrite
	movq	%rsi, %r9
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	leaq	.LC65(%rip), %rcx
	movl	$1, %edx
	call	fwrite
	movq	8(%r12), %rcx
	movq	%rsi, %r9
	leaq	1(%rdi), %r8
	jmp	.L612
	.p2align 4,,10
	.p2align 3
.L614:
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movl	16(%r12), %r8d
	leaq	-56(%rbp), %rsp
	movq	%rbx, %rcx
	leaq	.LC76(%rip), %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L593:
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
	.p2align 4,,10
	.p2align 3
.L600:
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$22, %r8d
	movl	$1, %edx
	leaq	.LC66(%rip), %rcx
	call	fwrite
	movq	%rsi, %r9
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC67(%rip), %rcx
	call	fwrite
	movq	(%r12), %rcx
	movq	%rsi, %r9
	movq	%r13, %r8
	movq	%rbx, %rdx
	call	output_variable_access
	movq	%rsi, %r9
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	leaq	-56(%rbp), %rsp
	movq	%rbx, %r9
	movl	$10, %r8d
	popq	%rbx
	movl	$1, %edx
	leaq	.LC68(%rip), %rcx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	fwrite
	.section .rdata,"dr"
.LC77:
	.ascii "UNKNOWN_OPERATOR\0"
.LC78:
	.ascii "primary\12\0"
.LC79:
	.ascii "type: \"integer\"\12\0"
.LC80:
	.ascii "value: %s\12\0"
.LC81:
	.ascii "type: \"float\"\12\0"
.LC82:
	.ascii "type: \"string\"\12\0"
.LC83:
	.ascii "value: \"%s\"\12\0"
.LC84:
	.ascii "type: \"boolean\"\12\0"
.LC85:
	.ascii "value: \"true\"\12\0"
.LC86:
	.ascii "value: \"false\"\12\0"
.LC87:
	.ascii "type: \"expression\"\12\0"
.LC88:
	.ascii "value\12\0"
.LC89:
	.ascii "type: \"!\"\12\0"
.LC90:
	.ascii "type: \"-\"\12\0"
.LC91:
	.ascii "type: \"variable\"\12\0"
.LC92:
	.ascii "unknown_PrimaryType: %u\12\0"
.LC93:
	.ascii "operator: \"%s\"\12\0"
.LC94:
	.ascii "left\12\0"
.LC95:
	.ascii "right\12\0"
	.text
	.p2align 4
	.def	output_expression;	.scl	3;	.type	32;	.endef
output_expression:
	pushq	%r15
	leaq	.L620(%rip), %r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rdi
	movq	%r9, %rdi
	pushq	%rsi
	movq	%r8, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$40, %rsp
.L629:
	movl	24(%rbp), %eax
	leaq	.LC94(%rip), %r14
	leaq	.L633(%rip), %r12
	cmpl	$19, %eax
	je	.L669
.L616:
	cmpl	$18, %eax
	ja	.L631
	movslq	(%r12,%rax,4), %rax
	addq	%r12, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L633:
	.long	.L651-.L633
	.long	.L650-.L633
	.long	.L649-.L633
	.long	.L648-.L633
	.long	.L647-.L633
	.long	.L646-.L633
	.long	.L645-.L633
	.long	.L644-.L633
	.long	.L643-.L633
	.long	.L642-.L633
	.long	.L641-.L633
	.long	.L640-.L633
	.long	.L639-.L633
	.long	.L638-.L633
	.long	.L637-.L633
	.long	.L636-.L633
	.long	.L635-.L633
	.long	.L634-.L633
	.long	.L632-.L633
	.text
	.p2align 4,,10
	.p2align 3
.L634:
	movq	208+symbolList(%rip), %r13
	.p2align 4,,10
	.p2align 3
.L653:
	xorl	%r8d, %r8d
	movq	%rdi, %r9
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	indention
	testq	%r13, %r13
	je	.L654
.L652:
	movq	%r13, %r8
	leaq	.LC93(%rip), %rdx
	leaq	1(%rsi), %r13
	movq	%rbx, %rcx
	call	fprintf
	movq	%rdi, %r9
	xorl	%r8d, %r8d
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$1, %edx
	movq	%r14, %rcx
	movl	$5, %r8d
	call	fwrite
	movq	0(%rbp), %rcx
	movq	%rdi, %r9
	movq	%r13, %r8
	movq	%rbx, %rdx
	call	output_expression
	movq	%rdi, %r9
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC95(%rip), %rcx
	call	fwrite
	movq	16(%rbp), %rbp
	movl	24(%rbp), %eax
	cmpl	$19, %eax
	je	.L655
	movq	%r13, %rsi
	jmp	.L616
	.p2align 4,,10
	.p2align 3
.L635:
	movq	200+symbolList(%rip), %r13
	jmp	.L653
	.p2align 4,,10
	.p2align 3
.L636:
	movq	192+symbolList(%rip), %r13
	jmp	.L653
	.p2align 4,,10
	.p2align 3
.L637:
	movq	184+symbolList(%rip), %r13
	jmp	.L653
	.p2align 4,,10
	.p2align 3
.L638:
	movq	144+symbolList(%rip), %r13
	jmp	.L653
	.p2align 4,,10
	.p2align 3
.L639:
	movq	232+symbolList(%rip), %r13
	jmp	.L653
	.p2align 4,,10
	.p2align 3
.L640:
	movq	224+symbolList(%rip), %r13
	jmp	.L653
	.p2align 4,,10
	.p2align 3
.L641:
	movq	176+symbolList(%rip), %r13
	jmp	.L653
	.p2align 4,,10
	.p2align 3
.L642:
	movq	168+symbolList(%rip), %r13
	jmp	.L653
	.p2align 4,,10
	.p2align 3
.L643:
	movq	136+symbolList(%rip), %r13
	jmp	.L653
	.p2align 4,,10
	.p2align 3
.L644:
	movq	128+symbolList(%rip), %r13
	jmp	.L653
	.p2align 4,,10
	.p2align 3
.L645:
	movq	160+symbolList(%rip), %r13
	jmp	.L653
	.p2align 4,,10
	.p2align 3
.L646:
	movq	152+symbolList(%rip), %r13
	jmp	.L653
	.p2align 4,,10
	.p2align 3
.L647:
	movq	120+symbolList(%rip), %r13
	jmp	.L653
	.p2align 4,,10
	.p2align 3
.L648:
	movq	112+symbolList(%rip), %r13
	jmp	.L653
	.p2align 4,,10
	.p2align 3
.L649:
	movq	104+symbolList(%rip), %r13
	jmp	.L653
	.p2align 4,,10
	.p2align 3
.L650:
	movq	96+symbolList(%rip), %r13
	jmp	.L653
	.p2align 4,,10
	.p2align 3
.L651:
	movq	88+symbolList(%rip), %r13
	jmp	.L653
	.p2align 4,,10
	.p2align 3
.L632:
	movq	216+symbolList(%rip), %r13
	jmp	.L653
	.p2align 4,,10
	.p2align 3
.L669:
	movq	%rsi, %r13
.L655:
	movq	%rdi, %r9
	movl	$1, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	leaq	2(%r13), %rsi
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC78(%rip), %rcx
	call	fwrite
	movq	8(%rbp), %rbp
.L617:
	cmpl	$8, 8(%rbp)
	leaq	-1(%rsi), %r12
	ja	.L618
	movl	8(%rbp), %eax
	movq	%rdi, %r9
	xorl	%r8d, %r8d
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movslq	(%r15,%rax,4), %rax
	addq	%r15, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L620:
	.long	.L628-.L620
	.long	.L627-.L620
	.long	.L626-.L620
	.long	.L625-.L620
	.long	.L624-.L620
	.long	.L623-.L620
	.long	.L622-.L620
	.long	.L621-.L620
	.long	.L619-.L620
	.text
.L631:
	movq	%rdi, %r9
	xorl	%r8d, %r8d
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	indention
	.p2align 4,,10
	.p2align 3
.L654:
	leaq	.LC77(%rip), %r13
	jmp	.L652
	.p2align 4,,10
	.p2align 3
.L621:
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC90(%rip), %rcx
.L665:
	call	fwrite
	movq	%rdi, %r9
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	addq	$1, %rsi
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC88(%rip), %rcx
	call	fwrite
	movq	0(%rbp), %rbp
	jmp	.L617
	.p2align 4,,10
	.p2align 3
.L622:
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC89(%rip), %rcx
	jmp	.L665
	.p2align 4,,10
	.p2align 3
.L623:
	call	indention
	movq	%rbx, %r9
	movl	$19, %r8d
	movl	$1, %edx
	leaq	.LC87(%rip), %rcx
	call	fwrite
	movq	%rdi, %r9
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC88(%rip), %rcx
	call	fwrite
	movq	0(%rbp), %rbp
	jmp	.L629
	.p2align 4,,10
	.p2align 3
.L624:
	call	indention
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC84(%rip), %rcx
	call	fwrite
	movq	%rdi, %r9
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC86(%rip), %rcx
.L668:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L625:
	call	indention
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC84(%rip), %rcx
	call	fwrite
	movq	%rdi, %r9
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC85(%rip), %rcx
	jmp	.L668
	.p2align 4,,10
	.p2align 3
.L626:
	call	indention
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC82(%rip), %rcx
	call	fwrite
	movq	%r12, %rdx
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	0(%rbp), %r8
	leaq	.LC83(%rip), %rdx
.L667:
	addq	$40, %rsp
	movq	%rbx, %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L627:
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC81(%rip), %rcx
.L666:
	call	fwrite
	movq	%r12, %rdx
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	0(%rbp), %r8
	leaq	.LC80(%rip), %rdx
	jmp	.L667
	.p2align 4,,10
	.p2align 3
.L628:
	call	indention
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC79(%rip), %rcx
	jmp	.L666
	.p2align 4,,10
	.p2align 3
.L619:
	call	indention
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC91(%rip), %rcx
	call	fwrite
	movq	%rdi, %r9
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC88(%rip), %rcx
	call	fwrite
	movq	0(%rbp), %rcx
	addq	$40, %rsp
	movq	%rdi, %r9
	movq	%rsi, %r8
	movq	%rbx, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	output_variable_access
.L618:
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movq	%rdi, %r9
	movl	$1, %r8d
	call	indention
	movl	8(%rbp), %r8d
	addq	$40, %rsp
	movq	%rbx, %rcx
	leaq	.LC92(%rip), %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fprintf
	.section .rdata,"dr"
.LC96:
	.ascii "value: \"NULL\"\12\0"
	.text
	.p2align 4
	.def	output_variable;	.scl	3;	.type	32;	.endef
output_variable:
	pushq	%r12
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rdi
	movq	%r8, %rdi
	xorl	%r8d, %r8d
	pushq	%rsi
	movq	%r9, %rsi
	leaq	1(%rdi), %r12
	pushq	%rbx
	movq	%rdx, %rbx
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	subq	$32, %rsp
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC10(%rip), %rcx
	call	fwrite
	movq	0(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_name
	xorl	%r8d, %r8d
	movq	%rsi, %r9
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC65(%rip), %rcx
	call	fwrite
	movq	8(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_name
	cmpq	$0, 16(%rbp)
	movq	%rsi, %r9
	movq	%rdi, %rdx
	movl	$1, %r8d
	movq	%rbx, %rcx
	je	.L671
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC88(%rip), %rcx
	call	fwrite
	movq	16(%rbp), %rcx
	addq	$32, %rsp
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	output_expression
	.p2align 4,,10
	.p2align 3
.L671:
	call	indention
	addq	$32, %rsp
	movq	%rbx, %r9
	movl	$14, %r8d
	popq	%rbx
	movl	$1, %edx
	leaq	.LC96(%rip), %rcx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	fwrite
	.section .rdata,"dr"
.LC97:
	.ascii "if_statement\12\0"
.LC98:
	.ascii "condition\12\0"
.LC99:
	.ascii "body\12\0"
.LC100:
	.ascii "else_if\12\0"
.LC101:
	.ascii "else_body\12\0"
.LC102:
	.ascii "for_statement\12\0"
.LC103:
	.ascii "initializer\12\0"
.LC104:
	.ascii "initializer: \"NULL\"\12\0"
.LC105:
	.ascii "condition: \"NULL\"\12\0"
.LC106:
	.ascii "increment\12\0"
.LC107:
	.ascii "increment: \"NULL\"\12\0"
.LC108:
	.ascii "while_statement\12\0"
	.align 8
.LC109:
	.ascii "variable_declaration_statement\12\0"
.LC110:
	.ascii "return_statement: \"NULL\"\12\0"
.LC111:
	.ascii "return_statement\12\0"
.LC112:
	.ascii "break_statement: \"NULL\"\12\0"
.LC113:
	.ascii "continue_statement: \"NULL\"\12\0"
.LC114:
	.ascii "expression_statement: \"NULL\"\12\0"
.LC115:
	.ascii "expression_statement\12\0"
.LC116:
	.ascii "unknown_StatementType: %u\12\0"
	.text
	.p2align 4
	.def	output_statement;	.scl	3;	.type	32;	.endef
output_statement:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rdi
	movq	%r8, %rdi
	pushq	%rsi
	movq	%r9, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$64, %rsp
	cmpl	$7, 8(%rcx)
	movups	%xmm6, 64(%rsp)
	ja	.L674
	movl	8(%rcx), %eax
	leaq	.L676(%rip), %rdx
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	movq	%rdi, %rdx
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L676:
	.long	.L683-.L676
	.long	.L682-.L676
	.long	.L681-.L676
	.long	.L680-.L676
	.long	.L679-.L676
	.long	.L678-.L676
	.long	.L677-.L676
	.long	.L675-.L676
	.text
	.p2align 4,,10
	.p2align 3
.L677:
	call	indention
	movq	%rbx, %r9
	movl	$24, %r8d
	movl	$1, %edx
	leaq	.LC112(%rip), %rcx
.L755:
	movups	64(%rsp), %xmm6
	leaq	-56(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L675:
	call	indention
	movq	%rbx, %r9
	movl	$27, %r8d
	movl	$1, %edx
	leaq	.LC113(%rip), %rcx
	jmp	.L755
	.p2align 4,,10
	.p2align 3
.L683:
	cmpq	$0, (%r12)
	je	.L757
	call	indention
	movq	%rbx, %r9
	movl	$21, %r8d
	movl	$1, %edx
	leaq	.LC115(%rip), %rcx
.L756:
	call	fwrite
	movq	(%r12), %rcx
	movq	%rsi, %r9
	leaq	1(%rdi), %r8
	movups	64(%rsp), %xmm6
	leaq	-56(%rbp), %rsp
	movq	%rbx, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	output_expression
	.p2align 4,,10
	.p2align 3
.L682:
	call	indention
	movq	%rbx, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC109(%rip), %rcx
	call	fwrite
	movq	(%r12), %rcx
	movq	%rsi, %r9
	leaq	1(%rdi), %r8
	movups	64(%rsp), %xmm6
	leaq	-56(%rbp), %rsp
	movq	%rbx, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	output_variable
	.p2align 4,,10
	.p2align 3
.L681:
	call	indention
	movq	%rbx, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC97(%rip), %rcx
	call	fwrite
	movq	(%r12), %r13
	leaq	1(%rdi), %rax
	movq	%rax, 32(%rsp)
	movq	8(%r13), %r12
	testq	%r12, %r12
	je	.L722
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%r12), %xmm3
	movq	%rax, %r15
	movups	%xmm3, (%rax)
.L684:
	movq	16(%r13), %r12
	testq	%r12, %r12
	je	.L723
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%r12), %xmm4
	movq	%rax, %r14
	movups	%xmm4, (%rax)
.L685:
	movq	24(%r13), %r12
	testq	%r12, %r12
	je	.L724
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%r12), %xmm5
	movq	%rax, 40(%rsp)
	movups	%xmm5, 48(%rsp)
	movups	%xmm5, (%rax)
.L686:
	movq	32(%rsp), %rdx
	xorl	%r8d, %r8d
	movq	%rsi, %r9
	movq	%rbx, %rcx
	leaq	2(%rdi), %r12
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC98(%rip), %rcx
	call	fwrite
	movq	0(%r13), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_expression
	movq	32(%rsp), %rdx
	xorl	%r8d, %r8d
	movq	%rsi, %r9
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC99(%rip), %rcx
	call	fwrite
	testq	%r15, %r15
	jne	.L687
	jmp	.L690
	.p2align 4,,10
	.p2align 3
.L691:
	movq	8(%rax), %rcx
	testq	%rcx, %rcx
	je	.L690
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_statement
.L687:
	movq	(%r15), %rax
	testq	%rax, %rax
	je	.L690
	movq	(%rax), %rdx
	movq	%rdx, (%r15)
	testq	%rdx, %rdx
	jne	.L691
	movq	$0, 8(%r15)
	jmp	.L691
	.p2align 4,,10
	.p2align 3
.L680:
	call	indention
	movq	%rbx, %r9
	leaq	1(%rdi), %r13
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC108(%rip), %rcx
	addq	$2, %rdi
	call	fwrite
	movq	(%r12), %r14
	movq	8(%r14), %r15
	testq	%r15, %r15
	je	.L716
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movups	%xmm0, (%rax)
	movdqu	(%r15), %xmm2
	movq	%r13, %rdx
	movq	%rbx, %rcx
	movq	%rax, %r12
	movups	%xmm2, (%rax)
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC98(%rip), %rcx
	call	fwrite
	movq	(%r14), %rcx
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	output_expression
	movq	%rsi, %r9
	movq	%r13, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC99(%rip), %rcx
	call	fwrite
	jmp	.L717
	.p2align 4,,10
	.p2align 3
.L718:
	movq	8(%rax), %rcx
	testq	%rcx, %rcx
	je	.L673
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	output_statement
.L717:
	movq	(%r12), %rax
	testq	%rax, %rax
	je	.L673
	movq	(%rax), %rdx
	movq	%rdx, (%r12)
	testq	%rdx, %rdx
	jne	.L718
	movq	$0, 8(%r12)
	jmp	.L718
	.p2align 4,,10
	.p2align 3
.L679:
	call	indention
	movq	%rbx, %r9
	leaq	1(%rdi), %r14
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC102(%rip), %rcx
	call	fwrite
	movq	(%r12), %r13
	movq	24(%r13), %r15
	testq	%r15, %r15
	je	.L725
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%r15), %xmm4
	movq	%rax, %r12
	movups	%xmm4, (%rax)
.L706:
	xorl	%r8d, %r8d
	cmpq	$0, 0(%r13)
	movq	%rsi, %r9
	movq	%r14, %rdx
	movq	%rbx, %rcx
	je	.L707
	call	indention
	movq	%rbx, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC103(%rip), %rcx
	call	fwrite
	movq	0(%r13), %rcx
	movq	%rsi, %r9
	leaq	2(%rdi), %r8
	movq	%rbx, %rdx
	call	output_variable
.L708:
	xorl	%r8d, %r8d
	cmpq	$0, 8(%r13)
	movq	%rsi, %r9
	movq	%r14, %rdx
	movq	%rbx, %rcx
	je	.L709
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC98(%rip), %rcx
	call	fwrite
	movq	8(%r13), %rcx
	movq	%rsi, %r9
	leaq	2(%rdi), %r8
	movq	%rbx, %rdx
	call	output_expression
.L710:
	xorl	%r8d, %r8d
	cmpq	$0, 16(%r13)
	movq	%rsi, %r9
	movq	%r14, %rdx
	movq	%rbx, %rcx
	je	.L711
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC106(%rip), %rcx
	call	fwrite
	movq	16(%r13), %rcx
	movq	%rsi, %r9
	leaq	2(%rdi), %r8
	movq	%rbx, %rdx
	call	output_expression
.L712:
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC99(%rip), %rcx
	call	fwrite
	testq	%r12, %r12
	je	.L673
	addq	$2, %rdi
	jmp	.L713
	.p2align 4,,10
	.p2align 3
.L714:
	movq	8(%rax), %rcx
	testq	%rcx, %rcx
	je	.L673
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	output_statement
.L713:
	movq	(%r12), %rax
	testq	%rax, %rax
	je	.L673
	movq	(%rax), %rdx
	movq	%rdx, (%r12)
	testq	%rdx, %rdx
	jne	.L714
	movq	$0, 8(%r12)
	jmp	.L714
	.p2align 4,,10
	.p2align 3
.L678:
	cmpq	$0, (%r12)
	je	.L758
	call	indention
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC111(%rip), %rcx
	jmp	.L756
	.p2align 4,,10
	.p2align 3
.L673:
	movups	64(%rsp), %xmm6
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
	.p2align 4,,10
	.p2align 3
.L690:
	movq	32(%rsp), %rdx
	xorl	%r8d, %r8d
	movq	%rsi, %r9
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC100(%rip), %rcx
	call	fwrite
	testq	%r14, %r14
	je	.L688
	addq	$3, %rdi
	pxor	%xmm6, %xmm6
	.p2align 4,,10
	.p2align 3
.L689:
	movq	(%r14), %rax
	testq	%rax, %rax
	je	.L688
	movq	(%rax), %rdx
	movq	%rdx, (%r14)
	testq	%rdx, %rdx
	je	.L759
.L701:
	movq	8(%rax), %r15
	testq	%r15, %r15
	je	.L688
	movq	8(%r15), %rdx
	testq	%rdx, %rdx
	movq	%rdx, 48(%rsp)
	je	.L695
	movl	$16, %ecx
	call	alloc_memory
	movq	48(%rsp), %rdx
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movups	%xmm6, (%rax)
	movq	%rbx, %rcx
	movq	%rax, %r13
	movdqu	(%rdx), %xmm1
	movq	%r12, %rdx
	movups	%xmm1, (%rax)
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC98(%rip), %rcx
	call	fwrite
	movq	(%r15), %rcx
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	output_expression
	movq	%rsi, %r9
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC99(%rip), %rcx
	call	fwrite
	jmp	.L696
	.p2align 4,,10
	.p2align 3
.L699:
	movq	8(%rax), %rcx
	testq	%rcx, %rcx
	je	.L689
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	output_statement
.L696:
	movq	0(%r13), %rax
	testq	%rax, %rax
	je	.L689
	movq	(%rax), %rdx
	movq	%rdx, 0(%r13)
	testq	%rdx, %rdx
	jne	.L699
	movq	$0, 8(%r13)
	jmp	.L699
	.p2align 4,,10
	.p2align 3
.L759:
	movq	$0, 8(%r14)
	jmp	.L701
	.p2align 4,,10
	.p2align 3
.L688:
	movq	32(%rsp), %rdx
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC101(%rip), %rcx
	call	fwrite
	cmpq	$0, 40(%rsp)
	jne	.L694
	jmp	.L673
	.p2align 4,,10
	.p2align 3
.L704:
	movq	8(%rax), %rcx
	testq	%rcx, %rcx
	je	.L673
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_statement
.L694:
	movq	40(%rsp), %rdi
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L673
	movq	(%rax), %rdx
	movq	%rdx, (%rdi)
	testq	%rdx, %rdx
	jne	.L704
	movq	$0, 8(%rdi)
	jmp	.L704
.L674:
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	call	indention
	movl	8(%r12), %r8d
	movq	%rbx, %rcx
	movups	64(%rsp), %xmm6
	leaq	-56(%rbp), %rsp
	leaq	.LC116(%rip), %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L695:
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC98(%rip), %rcx
	call	fwrite
	movq	(%r15), %rcx
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	output_expression
	movq	%rsi, %r9
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC99(%rip), %rcx
	call	fwrite
	jmp	.L689
.L707:
	call	indention
	movq	%rbx, %r9
	movl	$20, %r8d
	movl	$1, %edx
	leaq	.LC104(%rip), %rcx
	call	fwrite
	jmp	.L708
.L711:
	call	indention
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC107(%rip), %rcx
	call	fwrite
	jmp	.L712
.L709:
	call	indention
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC105(%rip), %rcx
	call	fwrite
	jmp	.L710
.L757:
	call	indention
	movq	%rbx, %r9
	movl	$29, %r8d
	movl	$1, %edx
	leaq	.LC114(%rip), %rcx
	jmp	.L755
.L758:
	call	indention
	movq	%rbx, %r9
	movl	$25, %r8d
	movl	$1, %edx
	leaq	.LC110(%rip), %rcx
	jmp	.L755
.L725:
	xorl	%r12d, %r12d
	jmp	.L706
.L724:
	movq	$0, 40(%rsp)
	jmp	.L686
.L723:
	xorl	%r14d, %r14d
	jmp	.L685
.L722:
	xorl	%r15d, %r15d
	jmp	.L684
.L716:
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC98(%rip), %rcx
	call	fwrite
	movq	(%r14), %rcx
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	output_expression
	movq	%rsi, %r9
	movq	%r13, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC99(%rip), %rcx
	jmp	.L755
	.section .rdata,"dr"
.LC117:
	.ascii "$%d-error\0"
.LC118:
	.ascii "$%c%zu\0"
	.text
	.p2align 4
	.def	create_var;	.scl	3;	.type	32;	.endef
create_var:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	movl	%r8d, %r13d
	pushq	%r12
	movq	%rdx, %r12
	pushq	%rdi
	movq	%r9, %rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	testq	%rcx, %rcx
	je	.L762
	movl	32(%rdx), %ecx
	xorl	%r14d, %r14d
	testl	%ecx, %ecx
	je	.L860
.L763:
	movq	8(%rdi), %rax
	testq	%rax, %rax
	je	.L769
	movq	24(%rax), %rbx
	testq	%rbx, %rbx
	je	.L767
	cmpq	$0, (%rbx)
	je	.L767
	cmpq	$0, 8(%rbx)
	je	.L767
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%rbx), %xmm2
	movq	%xmm2, %rdx
	movups	%xmm2, (%rax)
	testq	%rdx, %rdx
	je	.L771
	.p2align 4,,10
	.p2align 3
.L768:
	movq	%rdx, %rcx
	movq	(%rdx), %rdx
	movq	%rdx, (%rax)
	testq	%rdx, %rdx
	je	.L770
	movq	8(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L771
	cmpq	(%rbx), %rsi
	jne	.L768
	.p2align 4,,10
	.p2align 3
.L772:
	movl	32(%r12), %eax
	testl	%eax, %eax
	jne	.L760
	movq	%r14, 24(%rdi)
.L760:
	leaq	-56(%rbp), %rsp
	movq	%rbx, %rax
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
.L770:
	movq	8(%rcx), %rbx
	movq	$0, 8(%rax)
	testq	%rbx, %rbx
	je	.L771
	cmpq	(%rbx), %rsi
	je	.L772
.L771:
	movq	8(%rdi), %rax
	testq	%rax, %rax
	je	.L769
.L767:
	movq	16(%rax), %rbx
	testq	%rbx, %rbx
	je	.L769
	cmpq	$0, (%rbx)
	je	.L769
	cmpq	$0, 8(%rbx)
	je	.L769
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%rbx), %xmm3
	movq	%xmm3, %rdx
	movups	%xmm3, (%rax)
	testq	%rdx, %rdx
	je	.L769
	movq	%rdx, %rcx
	movq	(%rdx), %rdx
	movq	%rdx, (%rax)
	testq	%rdx, %rdx
	je	.L773
.L861:
	movq	8(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L769
	cmpq	(%rbx), %rsi
	je	.L772
	movq	%rdx, %rcx
	movq	(%rdx), %rdx
	movq	%rdx, (%rax)
	testq	%rdx, %rdx
	jne	.L861
.L773:
	movq	8(%rcx), %rbx
	movq	$0, 8(%rax)
	testq	%rbx, %rbx
	je	.L769
	cmpq	(%rbx), %rsi
	je	.L772
.L769:
	cmpq	$0, 24(%rdi)
	movq	(%rdi), %rax
	je	.L766
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	je	.L766
	cmpq	$0, (%rbx)
	je	.L766
	cmpq	$0, 8(%rbx)
	je	.L766
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%rbx), %xmm4
	movq	%rax, %r15
	movq	%xmm4, %rdx
	movups	%xmm4, (%rax)
	testq	%rdx, %rdx
	jne	.L775
	jmp	.L852
	.p2align 4,,10
	.p2align 3
.L776:
	testq	%rax, %rax
	je	.L852
	movq	%rax, %rdx
.L775:
	movq	(%rdx), %rax
	movq	%rax, (%r15)
	testq	%rax, %rax
	je	.L862
.L782:
	movq	8(%rdx), %rdx
	testq	%rdx, %rdx
	je	.L852
	movq	24(%rdi), %rcx
	movq	(%rcx), %rcx
	cmpq	%rcx, 8(%rdx)
	jne	.L776
	movq	(%rdx), %rbx
	testq	%rbx, %rbx
	je	.L776
	cmpq	$0, (%rbx)
	je	.L776
	cmpq	$0, 8(%rbx)
	je	.L776
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%rbx), %xmm5
	movq	%xmm5, %rdx
	movups	%xmm5, (%rax)
	testq	%rdx, %rdx
	je	.L780
	movq	%rdx, %rcx
	movq	(%rdx), %rdx
	movq	%rdx, (%rax)
	testq	%rdx, %rdx
	je	.L779
.L863:
	movq	8(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L780
	movq	(%rcx), %rbx
	cmpq	%rsi, (%rbx)
	je	.L772
	movq	%rdx, %rcx
	movq	(%rdx), %rdx
	movq	%rdx, (%rax)
	testq	%rdx, %rdx
	jne	.L863
.L779:
	movq	$0, 8(%rax)
	movq	8(%rcx), %rax
	testq	%rax, %rax
	je	.L780
	movq	(%rax), %rbx
	cmpq	(%rbx), %rsi
	je	.L772
.L780:
	movq	(%r15), %rax
	jmp	.L776
	.p2align 4,,10
	.p2align 3
.L852:
	movq	(%rdi), %rax
.L766:
	movq	16(%rax), %rbx
	testq	%rbx, %rbx
	je	.L791
	cmpq	$0, (%rbx)
	je	.L791
	cmpq	$0, 8(%rbx)
	je	.L791
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%rbx), %xmm1
	movq	%xmm1, %rdx
	movups	%xmm1, (%rax)
	testq	%rdx, %rdx
	je	.L791
	movq	%rdx, %rcx
	movq	(%rdx), %rdx
	movq	%rdx, (%rax)
	testq	%rdx, %rdx
	je	.L790
.L864:
	movq	8(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L791
	cmpq	(%rbx), %rsi
	je	.L772
	movq	%rdx, %rcx
	movq	(%rdx), %rdx
	movq	%rdx, (%rax)
	testq	%rdx, %rdx
	jne	.L864
.L790:
	movq	8(%rcx), %rbx
	movq	$0, 8(%rax)
	testq	%rbx, %rbx
	je	.L791
	cmpq	(%rbx), %rsi
	je	.L772
.L791:
	movl	32(%r12), %edx
	testl	%edx, %edx
	jne	.L762
	movq	%r14, 24(%rdi)
.L762:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rax, %rbx
	leal	-97(%r13), %eax
	cmpl	$21, %eax
	ja	.L794
	leaq	.L796(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L796:
	.long	.L801-.L796
	.long	.L800-.L796
	.long	.L794-.L796
	.long	.L794-.L796
	.long	.L794-.L796
	.long	.L799-.L796
	.long	.L794-.L796
	.long	.L794-.L796
	.long	.L794-.L796
	.long	.L794-.L796
	.long	.L794-.L796
	.long	.L794-.L796
	.long	.L794-.L796
	.long	.L794-.L796
	.long	.L794-.L796
	.long	.L798-.L796
	.long	.L794-.L796
	.long	.L794-.L796
	.long	.L794-.L796
	.long	.L797-.L796
	.long	.L794-.L796
	.long	.L795-.L796
	.text
	.p2align 4,,10
	.p2align 3
.L860:
	movq	24(%rdx), %rax
	movq	24(%r9), %r14
	movq	%rax, 24(%r9)
	jmp	.L763
	.p2align 4,,10
	.p2align 3
.L794:
	movl	$1, %r8d
	movl	$32, %edx
	leaq	.LC38(%rip), %rcx
	call	create_string_check
	movl	%r13d, %r8d
	leaq	.LC117(%rip), %rdx
	movq	%rax, 8(%rbx)
	movq	%rax, %rcx
	call	sprintf
	movq	%r12, 16(%rbx)
	jmp	.L760
.L801:
	movq	48(%rdi), %rsi
	leaq	1(%rsi), %rax
	movq	%rax, 48(%rdi)
	.p2align 4,,10
	.p2align 3
.L803:
	leaq	.LC38(%rip), %rcx
	movl	$1, %r8d
	movl	$32, %edx
	call	create_string_check
	movq	%rax, 8(%rbx)
	movq	%rax, %rcx
	cmpq	$-1, %rsi
	je	.L865
	movq	%rsi, %r9
	movl	%r13d, %r8d
	leaq	.LC118(%rip), %rdx
	call	sprintf
.L805:
	andl	$-3, %r13d
	movq	%r12, 16(%rbx)
	cmpl	$116, %r13d
	jne	.L760
	movq	8(%rdi), %rax
	movq	%rbx, %rdx
	movq	24(%rax), %rcx
	call	list_append
	jmp	.L760
.L797:
	movq	72(%rdi), %rsi
	leaq	1(%rsi), %rax
	movq	%rax, 72(%rdi)
	jmp	.L803
.L795:
	movq	64(%rdi), %rsi
	leaq	1(%rsi), %rax
	movq	%rax, 64(%rdi)
	jmp	.L803
.L799:
	movq	88(%rdi), %rsi
	leaq	1(%rsi), %rax
	movq	%rax, 88(%rdi)
	jmp	.L803
.L800:
	movq	80(%rdi), %rsi
	leaq	1(%rsi), %rax
	movq	%rax, 80(%rdi)
	jmp	.L803
.L798:
	movq	56(%rdi), %rsi
	leaq	1(%rsi), %rax
	movq	%rax, 56(%rdi)
	jmp	.L803
	.p2align 4,,10
	.p2align 3
.L862:
	movq	$0, 8(%r15)
	jmp	.L782
	.p2align 4,,10
	.p2align 3
.L865:
	movl	%r13d, %r8d
	leaq	.LC117(%rip), %rdx
	call	sprintf
	jmp	.L805
	.p2align 4
	.def	load_rvalue.part.0;	.scl	3;	.type	32;	.endef
load_rvalue.part.0:
	pushq	%rbp
	movl	$116, %r8d
	movq	%rsp, %rbp
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	movq	%rdi, %r9
	pushq	%rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	movq	8(%rcx), %rdx
	xorl	%ecx, %ecx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rsi
	call	alloc_memory
	movq	%rsi, %xmm0
	movl	$32, %ecx
	movhps	16(%rsi), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movq	%r12, 8(%rax)
	movq	%rax, %rdx
	movq	%rbx, (%rax)
	movl	$23, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rdi), %rax
	movq	8(%rax), %rcx
	call	list_append
	leaq	-32(%rbp), %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC119:
	.ascii "[Warning] Unsupported variable access with NULL base\12\0"
	.align 8
.LC120:
	.ascii "[Warning] Failed to generate variable access for base\12\0"
	.align 8
.LC121:
	.ascii "[Warning] Attempting to access attribute of non-object type: %s\12\0"
	.align 8
.LC122:
	.ascii "[Warning] Attribute '%s' not found in type '%s'\12\0"
	.align 8
.LC123:
	.ascii "[Warning] Attempting to access function '%s' as attribute of type '%s'\12\0"
	.align 8
.LC124:
	.ascii "[Warning] Symbol '%s' in type '%s' is not an attribute\12\0"
.LC125:
	.ascii "arr\0"
	.align 8
.LC126:
	.ascii "[Warning] Attempting to index non-array type: %s\12\0"
	.align 8
.LC127:
	.ascii "[Warning] Failed to generate variable access for index\12\0"
.LC128:
	.ascii "%s.%s\0"
	.align 8
.LC129:
	.ascii "[Warning] Attempting to call non-function, kind: %u, type name: %s\12\0"
	.align 8
.LC130:
	.ascii "[Warning] Unsupported variable access type for tac_variable_access: %u\12\0"
	.section	.text.unlikely,"x"
.LCOLDB131:
	.text
.LHOTB131:
	.p2align 4
	.def	tac_variable_access;	.scl	3;	.type	32;	.endef
tac_variable_access:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$64, %rsp
	movl	16(%rcx), %ecx
	testl	%ecx, %ecx
	jne	.L869
	movq	8(%rdi), %rcx
	testq	%rcx, %rcx
	je	.L869
	movl	32(%rcx), %eax
	leal	-1(%rax), %edx
	cmpl	$1, %edx
	jbe	.L962
	testl	%eax, %eax
	je	.L963
	movq	(%rcx), %rdx
	movq	%rsi, %r9
	movl	$118, %r8d
.L961:
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rsi
	call	alloc_memory
	movq	%rsi, %xmm0
	movhps	16(%rsi), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L868
	.p2align 4,,10
	.p2align 3
.L869:
	movq	(%rdi), %rcx
	testq	%rcx, %rcx
	je	.L964
	movq	%rsi, %rdx
	call	tac_variable_access
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L877
	cmpb	$0, 20(%rax)
	jne	.L965
.L876:
	movl	16(%rdi), %ebx
	cmpl	$2, %ebx
	je	.L966
	cmpl	$3, %ebx
	je	.L967
	cmpl	$1, %ebx
	jne	.L893
	movl	16(%r12), %ebx
	testl	%ebx, %ebx
	je	.L968
	leal	-7(%rbx), %eax
	cmpl	$1, %eax
	jbe	.L901
	movq	8(%r12), %rax
.L895:
	movq	8(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	%ebx, %r8d
	leaq	.LC129(%rip), %rdx
	xorl	%ebx, %ebx
	movq	%rax, %rcx
	movq	%rsi, %r9
	call	fprintf
	jmp	.L868
	.p2align 4,,10
	.p2align 3
.L966:
	movq	8(%r12), %rax
	movq	%rax, 56(%rsp)
	movl	32(%rax), %eax
	leal	-1(%rax), %edx
	cmpl	$1, %edx
	jbe	.L969
	movq	56(%rsp), %rbx
	movq	24(%rbx), %r14
	testl	%eax, %eax
	jne	.L880
	movq	16(%r14), %r14
.L880:
	movq	8(%rdi), %rax
	movq	8(%rax), %r13
	testq	%r14, %r14
	je	.L881
.L885:
	movq	8(%r14), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L884
	jmp	.L882
	.p2align 4,,10
	.p2align 3
.L970:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L882
.L884:
	movq	8(%rbx), %r15
	movq	%r13, %rdx
	movq	8(%r15), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L970
	movl	32(%r15), %eax
	cmpl	$1, %eax
	je	.L971
	cmpl	$2, %eax
	je	.L972
	cmpl	$5, %eax
	jne	.L973
	movq	(%r15), %rdx
	movq	%rsi, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %r13
	call	alloc_memory
	movq	%r13, %xmm0
	movq	%rsi, %r9
	movl	$97, %r8d
	movhps	16(%r13), %xmm0
	movb	$0, 20(%rax)
	movq	%rax, %rbx
	movups	%xmm0, (%rax)
	movq	8(%rdi), %rcx
	movl	$0, 16(%rax)
	movq	(%rcx), %rdx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %r13
	call	alloc_memory
	movq	%r13, %xmm0
	movl	$32, %ecx
	movhps	16(%r13), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rdi
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movl	$15, 24(%rax)
	movq	%rax, %rdx
.L959:
	movq	%rbx, (%rdx)
	movq	%r12, 8(%rdx)
	movq	%rdi, 16(%rdx)
	movb	$1, 20(%rbx)
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
.L868:
	leaq	-56(%rbp), %rsp
	movq	%rbx, %rax
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
.L963:
	movq	%rsi, %r9
	movl	$118, %r8d
	movq	%rcx, %rdx
	jmp	.L961
	.p2align 4,,10
	.p2align 3
.L965:
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L876
	.p2align 4,,10
	.p2align 3
.L877:
	movl	$2, %ecx
	xorl	%ebx, %ebx
	call	*__imp___acrt_iob_func(%rip)
	movl	$54, %r8d
	movl	$1, %edx
	leaq	.LC120(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L868
	.p2align 4,,10
	.p2align 3
.L968:
	movq	8(%r12), %rax
	movl	32(%rax), %edx
	testl	%edx, %edx
	jne	.L895
	movq	8(%rax), %r15
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %r14
	movq	%r15, %rcx
	call	strlen
	movq	%r14, %rcx
	movq	%rax, %rbx
	call	strlen
	movl	$1, %r8d
	leaq	.LC38(%rip), %rcx
	leaq	2(%rbx,%rax), %rdx
	call	create_string_check
	movq	%r14, %r9
	movq	%r15, %r8
	leaq	.LC128(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	sprintf
	movq	8(%r12), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %r14
	testq	%r14, %r14
	je	.L896
.L900:
	movq	8(%r14), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L899
	jmp	.L897
	.p2align 4,,10
	.p2align 3
.L974:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L897
.L899:
	movq	8(%rbx), %r12
	movq	%r13, %rdx
	movq	8(%r12), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L974
	movq	(%r12), %rdx
	movq	%r12, %rcx
	movq	%rsi, %r9
	movl	$102, %r8d
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movq	%rbx, %xmm0
	movhps	16(%rbx), %xmm0
	movl	$8, 16(%rax)
	movq	%rax, %r12
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
.L901:
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	cmpl	$8, 16(%r12)
	movq	%rax, %r14
	movups	%xmm0, (%rax)
	je	.L902
.L904:
	movq	$0, 56(%rsp)
.L903:
	movq	8(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L958
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%rbx), %xmm1
	movq	%rax, %rdi
	movups	%xmm1, (%rax)
	movq	%xmm1, %rax
	jmp	.L908
	.p2align 4,,10
	.p2align 3
.L913:
	movq	8(%rax), %rcx
	testq	%rcx, %rcx
	je	.L958
	movq	%rsi, %rdx
	call	tac_expression
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L909
	cmpb	$0, 20(%rax)
	jne	.L975
.L910:
	movq	8(%rbx), %rcx
	call	get_type_size
	movl	$24, %ecx
	movq	%rax, %r13
	call	alloc_memory
	movl	$32, %ecx
	movl	$1, 16(%rax)
	movq	%rax, %r15
	movq	%r13, (%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%r15)
	movq	%rax, 8(%r15)
	call	alloc_memory
	movq	%r14, %rcx
	movl	$17, 24(%rax)
	movq	%rax, %rdx
	movq	%r15, (%rax)
	movq	%rbx, 8(%rax)
	movq	$0, 16(%rax)
	call	list_append
	addq	$1, 56(%rsp)
	movq	(%rdi), %rax
.L908:
	testq	%rax, %rax
	je	.L958
	movq	(%rax), %rdx
	movq	%rdx, (%rdi)
	testq	%rdx, %rdx
	jne	.L913
	movq	$0, 8(%rdi)
	jmp	.L913
	.p2align 4,,10
	.p2align 3
.L882:
	movq	(%r14), %r14
	testq	%r14, %r14
	jne	.L885
.L881:
	movq	56(%rsp), %rax
	movl	$2, %ecx
	movq	8(%rax), %rbx
	call	*__imp___acrt_iob_func(%rip)
	movq	%r13, %r8
	leaq	.LC122(%rip), %rdx
	movq	%rbx, %r9
	movq	%rax, %rcx
	xorl	%ebx, %ebx
	call	fprintf
	jmp	.L868
	.p2align 4,,10
	.p2align 3
.L967:
	movq	8(%r12), %rax
	leaq	.LC125(%rip), %rdx
	movq	8(%rax), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L976
	movq	8(%rdi), %rcx
	movq	%rsi, %rdx
	call	tac_expression
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L892
	cmpb	$0, 20(%rax)
	jne	.L977
.L891:
	movq	name_int(%rip), %rdx
	movq	%rsi, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %r13
	call	alloc_memory
	movq	%r13, %xmm0
	movl	$32, %ecx
	movhps	16(%r13), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movl	$16, 24(%rax)
	movq	%rax, %rdx
	jmp	.L959
	.p2align 4,,10
	.p2align 3
.L978:
	movq	$0, 8(%r14)
.L917:
	movq	8(%rax), %rdx
	testq	%rdx, %rdx
	je	.L916
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
.L958:
	movq	(%r14), %rax
	testq	%rax, %rax
	je	.L916
	movq	(%rax), %rdx
	movq	%rdx, (%r14)
	testq	%rdx, %rdx
	jne	.L917
	jmp	.L978
	.p2align 4,,10
	.p2align 3
.L975:
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rbx
	jmp	.L910
	.p2align 4,,10
	.p2align 3
.L916:
	movq	8(%r12), %rdx
	movq	%rsi, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rdi
	call	alloc_memory
	movq	%rdi, %xmm0
	movl	$24, %ecx
	movhps	16(%rdi), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movl	$32, %ecx
	movq	%rax, %rdi
	movl	$1, 16(%rax)
	movq	56(%rsp), %rax
	movb	$0, 20(%rdi)
	movq	%rax, (%rdi)
	movq	name_int(%rip), %rax
	movq	%rax, 8(%rdi)
	call	alloc_memory
	movq	%r12, 8(%rax)
	movq	%rax, %rdx
	movq	%rbx, (%rax)
	movq	%rdi, 16(%rax)
	movl	$22, 24(%rax)
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L868
	.p2align 4,,10
	.p2align 3
.L973:
	movq	56(%rsp), %rax
	movl	$2, %ecx
	movq	8(%rax), %rbx
	call	*__imp___acrt_iob_func(%rip)
	movq	%r13, %r8
	leaq	.LC124(%rip), %rdx
	movq	%rbx, %r9
	movq	%rax, %rcx
	xorl	%ebx, %ebx
	call	fprintf
	jmp	.L868
	.p2align 4,,10
	.p2align 3
.L964:
	movl	$2, %ecx
	xorl	%ebx, %ebx
	call	*__imp___acrt_iob_func(%rip)
	movl	$53, %r8d
	movl	$1, %edx
	leaq	.LC119(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L868
	.p2align 4,,10
	.p2align 3
.L962:
	movq	(%rcx), %rdx
	movq	%rsi, %r9
	movl	$102, %r8d
.L960:
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rsi
	call	alloc_memory
	movq	%rsi, %xmm0
	movhps	16(%rsi), %xmm0
	movl	$7, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L868
	.p2align 4,,10
	.p2align 3
.L893:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	%ebx, %r8d
	leaq	.LC130(%rip), %rdx
	xorl	%ebx, %ebx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L868
	.p2align 4,,10
	.p2align 3
.L897:
	movq	(%r14), %r14
	testq	%r14, %r14
	jne	.L900
	jmp	.L896
	.p2align 4,,10
	.p2align 3
.L976:
	movq	(%r12), %rax
	movl	$2, %ecx
	movq	(%rax), %rax
	movq	8(%rax), %rbx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC126(%rip), %rdx
	movq	%rbx, %r8
	movq	%rax, %rcx
	xorl	%ebx, %ebx
	call	fprintf
	jmp	.L868
.L971:
	movq	56(%rsp), %rax
	movl	$2, %ecx
	movq	8(%rax), %rbx
	call	*__imp___acrt_iob_func(%rip)
	movq	%r13, %r8
	leaq	.LC123(%rip), %rdx
	movq	%rax, %rcx
	movq	%rbx, %r9
	call	fprintf
	movq	(%r15), %rdx
	movq	%rsi, %r9
	movq	%r15, %rcx
	movl	$102, %r8d
	jmp	.L960
.L977:
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L891
.L892:
	movl	$2, %ecx
	xorl	%ebx, %ebx
	call	*__imp___acrt_iob_func(%rip)
	movl	$55, %r8d
	movl	$1, %edx
	leaq	.LC127(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L868
.L972:
	movq	(%r15), %rdx
	movq	%rsi, %r9
	movl	$102, %r8d
	movq	%r15, %rcx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rsi
	call	alloc_memory
	movq	%rsi, %xmm0
	movhps	16(%rsi), %xmm0
	movl	$8, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L868
.L902:
	movq	8(%r12), %rax
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %r13
	movq	8(%rax), %r15
	movq	%r15, %rcx
	call	strlen
	movq	%r13, %rcx
	movq	%rax, %rbx
	call	strlen
	movl	$1, %r8d
	leaq	.LC38(%rip), %rcx
	leaq	2(%rbx,%rax), %rdx
	call	create_string_check
	leaq	.LC128(%rip), %rdx
	movq	%r13, %r9
	movq	%r15, %r8
	movq	%rax, %rcx
	movq	%rax, %rbx
	call	sprintf
	movq	(%r12), %rax
	movq	%rbx, %rdx
	movq	(%rax), %rax
	movq	8(%rax), %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L904
	movq	(%rdi), %rax
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$8, %ecx
	movq	(%rax), %rax
	movq	%rax, 32(%rsp)
	call	create_primary
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_expression
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L905
	cmpb	$0, 20(%rax)
	jne	.L979
.L906:
	movq	8(%rbx), %rcx
	call	get_type_size
	movl	$24, %ecx
	movq	%rax, %r15
	call	alloc_memory
	movl	$32, %ecx
	movl	$1, 16(%rax)
	movq	%rax, %r13
	movq	%r15, (%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%r13)
	movq	%rax, 8(%r13)
	call	alloc_memory
	movq	%r14, %rcx
	movl	$17, 24(%rax)
	movq	%rax, %rdx
	movq	%r13, (%rax)
	movq	%rbx, 8(%rax)
	movq	$0, 16(%rax)
	call	list_append
	movq	$1, 56(%rsp)
	jmp	.L903
.L969:
	movq	56(%rsp), %rax
	movl	$2, %ecx
	movq	8(%rax), %rbx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC121(%rip), %rdx
	movq	%rbx, %r8
	movq	%rax, %rcx
	xorl	%ebx, %ebx
	call	fprintf
	jmp	.L868
.L979:
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rbx
	jmp	.L906
	.section	.text.unlikely,"x"
	.def	tac_variable_access.cold;	.scl	3;	.type	32;	.endef
tac_variable_access.cold:
.L909:
	movq	8, %rax
	ud2
.L905:
	movq	8, %rax
	ud2
.L896:
	movq	0, %rax
	ud2
	.text
	.section	.text.unlikely,"x"
.LCOLDE131:
	.text
.LHOTE131:
	.section .rdata,"dr"
	.align 8
.LC133:
	.ascii "[Warning] Unsupported type for negation: %s\12\0"
	.align 8
.LC134:
	.ascii "[Warning] Unsupported primary type for tac_primary: %d\12\0"
	.section	.text.unlikely,"x"
.LCOLDB135:
	.text
.LHOTB135:
	.p2align 4
	.def	tac_primary.isra.0;	.scl	3;	.type	32;	.endef
tac_primary.isra.0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$48, %rsp
	movups	%xmm6, 48(%rsp)
	cmpl	$8, %edx
	ja	.L981
	movq	%rcx, %rsi
	movl	%edx, %ebx
	leaq	.L983(%rip), %rcx
	movq	%r8, %rdi
	movslq	(%rcx,%rbx,4), %rax
	addq	%rcx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L983:
	.long	.L991-.L983
	.long	.L990-.L983
	.long	.L989-.L983
	.long	.L988-.L983
	.long	.L987-.L983
	.long	.L986-.L983
	.long	.L985-.L983
	.long	.L984-.L983
	.long	.L982-.L983
	.text
	.p2align 4,,10
	.p2align 3
.L984:
	movl	8(%rsi), %edx
	movq	(%rsi), %rcx
	call	tac_primary.isra.0
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L994
	cmpb	$0, 20(%rax)
	jne	.L1004
.L995:
	movq	8(%rsi), %rdx
	xorl	%ecx, %ecx
	movq	%rdi, %r9
	movl	$116, %r8d
	call	create_var
	movl	$24, %ecx
	movq	%rax, %r12
	call	alloc_memory
	movq	%r12, %xmm0
	movhps	16(%r12), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	movq	8(%rsi), %rax
	cmpq	name_int(%rip), %rax
	je	.L1005
	cmpq	name_float(%rip), %rax
	je	.L1006
	movq	8(%rax), %rbx
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC133(%rip), %rdx
	movq	%rbx, %r8
	movq	%rax, %rcx
	xorl	%ebx, %ebx
	call	fprintf
	jmp	.L980
	.p2align 4,,10
	.p2align 3
.L982:
	movups	48(%rsp), %xmm6
	leaq	-32(%rbp), %rsp
	movq	%rsi, %rcx
	movq	%r8, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%rbp
	jmp	tac_variable_access
	.p2align 4,,10
	.p2align 3
.L991:
	movq	%rsi, %rcx
	movl	$10, %r8d
	xorl	%edx, %edx
	call	strtoll
	movl	$24, %ecx
	movq	%rax, %rsi
	call	alloc_memory
	movl	$1, 16(%rax)
	movq	%rax, %rbx
	movq	%rsi, (%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
.L980:
	movups	48(%rsp), %xmm6
	leaq	-32(%rbp), %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L990:
	xorl	%edx, %edx
	movq	%rsi, %rcx
	call	strtod
	movl	$24, %ecx
	movapd	%xmm0, %xmm6
	call	alloc_memory
	movl	$2, 16(%rax)
	movq	%rax, %rbx
	movsd	%xmm6, (%rax)
	movq	name_float(%rip), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	jmp	.L980
	.p2align 4,,10
	.p2align 3
.L989:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rsi, %xmm0
	movhps	name_string(%rip), %xmm0
	movl	$3, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L980
	.p2align 4,,10
	.p2align 3
.L988:
	movl	$24, %ecx
	call	alloc_memory
	movl	$4, 16(%rax)
	movq	%rax, %rbx
	movb	$1, (%rax)
	movq	name_bool(%rip), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	jmp	.L980
	.p2align 4,,10
	.p2align 3
.L987:
	movl	$24, %ecx
	call	alloc_memory
	movl	$4, 16(%rax)
	movq	%rax, %rbx
	movb	$0, (%rax)
	movq	name_bool(%rip), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	jmp	.L980
	.p2align 4,,10
	.p2align 3
.L986:
	movups	48(%rsp), %xmm6
	leaq	-32(%rbp), %rsp
	movq	%rsi, %rcx
	movq	%r8, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%rbp
	jmp	tac_expression
	.p2align 4,,10
	.p2align 3
.L985:
	movl	8(%rsi), %edx
	movq	(%rsi), %rcx
	call	tac_primary.isra.0
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L993
	cmpb	$0, 20(%rax)
	jne	.L1007
.L993:
	movq	name_bool(%rip), %rdx
	movq	%rdi, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rsi
	call	alloc_memory
	movq	%rsi, %xmm0
	movl	$32, %ecx
	movhps	16(%rsi), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movq	%r12, 8(%rax)
	movq	%rax, %rdx
	movq	%rbx, (%rax)
	movl	$13, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rdi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L980
.L981:
	movl	%edx, 44(%rsp)
	movl	$2, %ecx
	xorl	%ebx, %ebx
	call	*__imp___acrt_iob_func(%rip)
	movl	44(%rsp), %r8d
	leaq	.LC134(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L980
	.p2align 4,,10
	.p2align 3
.L1006:
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movl	$2, 16(%rax)
	movq	%rax, %r12
	movq	.LC132(%rip), %rax
	movb	$0, 20(%r12)
	movq	%rax, (%r12)
	movq	name_float(%rip), %rax
	movq	%rax, 8(%r12)
	call	alloc_memory
	movl	$2, 24(%rax)
	movq	%rax, %rdx
	movq	%rbx, (%rax)
	movq	%r12, 8(%rax)
	movq	%rsi, 16(%rax)
.L997:
	movq	16(%rdi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L980
	.p2align 4,,10
	.p2align 3
.L1004:
	movq	%rdi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rsi
	jmp	.L995
	.p2align 4,,10
	.p2align 3
.L1007:
	movq	%rdi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r12
	jmp	.L993
	.p2align 4,,10
	.p2align 3
.L1005:
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movl	$1, 16(%rax)
	movq	%rax, %r12
	movq	$0, (%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%r12)
	movq	%rax, 8(%r12)
	call	alloc_memory
	movl	$1, 24(%rax)
	movq	%rax, %rdx
	movq	%rbx, (%rax)
	movq	%r12, 8(%rax)
	movq	%rsi, 16(%rax)
	jmp	.L997
	.section	.text.unlikely,"x"
	.def	tac_primary.isra.0.cold;	.scl	3;	.type	32;	.endef
tac_primary.isra.0.cold:
.L994:
	movq	8, %rax
	ud2
	.text
	.section	.text.unlikely,"x"
.LCOLDE135:
	.text
.LHOTE135:
	.section .rdata,"dr"
	.align 8
.LC136:
	.ascii "[Warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.p2align 4
	.def	tac_expression;	.scl	3;	.type	32;	.endef
tac_expression:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	cmpl	$19, 24(%rcx)
	je	.L1029
	movq	16(%rcx), %rcx
	call	tac_expression
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L1010
	cmpb	$0, 20(%rax)
	jne	.L1030
.L1010:
	movl	24(%rbx), %eax
	movq	(%rbx), %rcx
	cmpl	$18, %eax
	ja	.L1011
	leaq	CSWTCH.123(%rip), %rdx
	movl	(%rdx,%rax,4), %r13d
	movq	%rdi, %rdx
	call	tac_expression
	movq	%rax, %r12
	movl	24(%rbx), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L1012
	cmpl	$14, %r13d
	jne	.L1018
	movl	16(%r12), %eax
	testl	%eax, %eax
	jne	.L1031
.L1015:
	movl	$32, %ecx
	call	alloc_memory
	movl	$14, 24(%rax)
	movq	%rax, %rdx
	movq	%r12, (%rax)
	movq	%rsi, 8(%rax)
	movq	$0, 16(%rax)
	cmpb	$0, 20(%r12)
	jne	.L1032
.L1016:
	movq	16(%rdi), %rax
	movq	8(%rax), %rcx
	call	list_append
	leaq	-48(%rbp), %rsp
	movq	%rsi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L1011:
	movq	%rdi, %rdx
	movl	$25, %r13d
	call	tac_expression
	movq	%rax, %r12
	movl	24(%rbx), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L1012
.L1018:
	movq	8(%r12), %rdx
	xorl	%ecx, %ecx
	movq	%rdi, %r9
	movl	$116, %r8d
	call	create_var
	movl	$24, %ecx
	movq	%rax, %r14
	call	alloc_memory
	movq	%r14, %xmm0
	movhps	16(%r14), %xmm0
	movb	$0, 20(%rax)
	movq	%rax, %rbx
	movq	%r12, %r14
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	cmpb	$0, 20(%r12)
	jne	.L1033
.L1014:
	movl	$32, %ecx
	call	alloc_memory
	movq	%r14, 8(%rax)
	movq	%rax, %rdx
	movq	%rsi, 16(%rax)
	movq	%rbx, %rsi
	movl	%r13d, 24(%rax)
	movq	%rbx, (%rax)
	movq	16(%rdi), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	16(%r12), %eax
	testl	%eax, %eax
	je	.L1015
.L1031:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$57, %r8d
	movl	$1, %edx
	leaq	.LC136(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L1015
	.p2align 4,,10
	.p2align 3
.L1012:
	movq	8(%r12), %rdx
	xorl	%ecx, %ecx
	movq	%rdi, %r9
	movl	$116, %r8d
	call	create_var
	movl	$24, %ecx
	movq	%rax, %r14
	call	alloc_memory
	movq	%r14, %xmm0
	movhps	16(%r14), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	cmpb	$0, 20(%r12)
	jne	.L1034
.L1017:
	movl	$32, %ecx
	call	alloc_memory
	movq	%rsi, 16(%rax)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	movl	%r13d, 24(%rax)
	movq	%rbx, (%rax)
	movq	%r12, 8(%rax)
	jmp	.L1016
	.p2align 4,,10
	.p2align 3
.L1029:
	movq	8(%rcx), %rax
	movq	%rdi, %r8
	movl	8(%rax), %edx
	movq	(%rax), %rcx
	leaq	-48(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	jmp	tac_primary.isra.0
	.p2align 4,,10
	.p2align 3
.L1032:
	movl	$32, %ecx
	call	alloc_memory
	movl	$24, 24(%rax)
	movq	%rax, %rdx
	movq	%r12, (%rax)
	movq	%rsi, 8(%rax)
	movq	$0, 16(%rax)
	jmp	.L1016
	.p2align 4,,10
	.p2align 3
.L1030:
	movq	%rdi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rsi
	jmp	.L1010
	.p2align 4,,10
	.p2align 3
.L1034:
	movq	%r12, %rcx
	movq	%rdi, %rdx
	call	load_rvalue.part.0
	movq	%rax, %r12
	jmp	.L1017
	.p2align 4,,10
	.p2align 3
.L1033:
	movq	%rdi, %rdx
	movq	%r12, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r14
	jmp	.L1014
	.section .rdata,"dr"
	.align 8
.LC137:
	.ascii "Error: create_attribute received NULL table\12\0"
	.align 8
.LC138:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
	.text
	.p2align 4
	.def	tac_variable;	.scl	3;	.type	32;	.endef
tac_variable:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movq	%rcx, %rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	testb	%r8b, %r8b
	je	.L1036
	movq	(%rdx), %rax
	movq	(%rax), %r8
	testq	%r8, %r8
	je	.L1037
	movq	(%r8), %rax
	testq	%rax, %rax
	je	.L1037
	movq	8(%r8), %rdx
	cmpq	%rdx, %rax
	je	.L1064
	.p2align 4,,10
	.p2align 3
.L1038:
	movq	%rax, %rcx
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L1038
	movq	8(%rdx), %rdi
	movq	$0, (%rcx)
.L1039:
	movq	%rcx, 8(%r8)
	movq	%rdi, %rdx
	movq	%r8, %rcx
	call	list_append
	movq	(%rbx), %r12
	movq	8(%rbx), %r13
	movl	$24, %ecx
	call	alloc_memory
	movq	%rsi, %r9
	movl	$97, %r8d
	movq	%r12, %rdx
	movq	%r13, %rcx
	movq	%rax, %rbx
	call	create_var
	movq	%r12, %xmm1
	movq	$0, 16(%rbx)
	movq	%rax, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, (%rbx)
	testq	%rdi, %rdi
	jne	.L1065
.L1040:
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rbx
	call	*%rbx
	movl	$44, %r8d
	movl	$1, %edx
	leaq	.LC137(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
.L1041:
	movl	$2, %ecx
	call	*%rbx
	leaq	-40(%rbp), %rsp
	movl	$63, %r8d
	movl	$1, %edx
	popq	%rbx
	movq	%rax, %r9
	leaq	.LC138(%rip), %rcx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L1036:
	movq	(%rcx), %rdx
	movq	8(%rcx), %rcx
	movq	%rsi, %r9
	movl	$118, %r8d
	call	create_var
	movq	16(%rbx), %rcx
	movq	%rax, %rdi
	testq	%rcx, %rcx
	je	.L1043
	movq	%rsi, %rdx
	call	tac_expression
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L1044
	cmpb	$0, 20(%rax)
	jne	.L1066
.L1044:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rdi, %xmm0
	movl	$32, %ecx
	movhps	16(%rdi), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r12
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movq	%rbx, 8(%rax)
	movq	%rax, %rdx
	movl	$14, 24(%rax)
	movq	%r12, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
.L1063:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	jmp	list_append
	.p2align 4,,10
	.p2align 3
.L1065:
	movq	16(%rdi), %rax
	movq	%r12, %rcx
	movq	%rax, 16(%rbx)
	call	get_type_size
	movq	(%rdi), %rcx
	movq	%rbx, %rdx
	addq	%rax, 16(%rdi)
	movq	__imp___acrt_iob_func(%rip), %rbx
	testq	%rcx, %rcx
	jne	.L1063
	jmp	.L1041
	.p2align 4,,10
	.p2align 3
.L1043:
	movl	$24, %ecx
	call	alloc_memory
	movl	$1, 16(%rax)
	movq	%rax, %rbx
	movq	$0, (%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	jmp	.L1044
	.p2align 4,,10
	.p2align 3
.L1037:
	movq	%r8, %rcx
	xorl	%edx, %edx
	call	list_append
	movq	(%rbx), %rdi
	movq	8(%rbx), %r12
	movl	$24, %ecx
	call	alloc_memory
	movq	%rsi, %r9
	movl	$97, %r8d
	movq	%rdi, %rdx
	movq	%r12, %rcx
	movq	%rax, %rbx
	call	create_var
	movq	%rdi, %xmm2
	movq	$0, 16(%rbx)
	movq	%rax, %xmm0
	punpcklqdq	%xmm2, %xmm0
	movups	%xmm0, (%rbx)
	jmp	.L1040
	.p2align 4,,10
	.p2align 3
.L1064:
	movq	8(%rax), %rdi
	xorl	%ecx, %ecx
	movq	$0, (%r8)
	jmp	.L1039
	.p2align 4,,10
	.p2align 3
.L1066:
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rbx
	jmp	.L1044
	.section .rdata,"dr"
	.align 8
.LC139:
	.ascii "[Warning] 'break' statement used outside of loop\12\0"
	.align 8
.LC140:
	.ascii "[Warning] 'continue' statement used outside of loop\12\0"
	.align 8
.LC141:
	.ascii "[Warning] Unsupported statement type for tac_statement: %d\12\0"
	.text
	.p2align 4
	.def	tac_statement;	.scl	3;	.type	32;	.endef
tac_statement:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$64, %rsp
	movl	8(%rcx), %esi
	movups	%xmm6, 64(%rsp)
	cmpl	$7, %esi
	ja	.L1068
	movq	%rdx, %rbx
	leaq	.L1070(%rip), %rdx
	movq	%rcx, %rdi
	movslq	(%rdx,%rsi,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L1070:
	.long	.L1077-.L1070
	.long	.L1076-.L1070
	.long	.L1075-.L1070
	.long	.L1074-.L1070
	.long	.L1073-.L1070
	.long	.L1072-.L1070
	.long	.L1071-.L1070
	.long	.L1069-.L1070
	.text
	.p2align 4,,10
	.p2align 3
.L1071:
	movq	32(%rbx), %rax
	testq	%rax, %rax
	je	.L1141
	cmpq	$0, (%rax)
	je	.L1141
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1141
	movq	8(%rax), %rsi
	testq	%rsi, %rsi
	jne	.L1260
.L1141:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$49, %r8d
	movl	$1, %edx
	leaq	.LC139(%rip), %rcx
	movq	%rax, %r9
.L1259:
	movups	64(%rsp), %xmm6
	leaq	-56(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L1069:
	movq	40(%rbx), %rax
	testq	%rax, %rax
	je	.L1142
	cmpq	$0, (%rax)
	je	.L1142
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1142
	movq	8(%rax), %rsi
	testq	%rsi, %rsi
	je	.L1142
.L1260:
	movl	$32, %ecx
	call	alloc_memory
	movl	$20, 24(%rax)
	movq	%rax, %rdx
	jmp	.L1258
	.p2align 4,,10
	.p2align 3
.L1075:
	movq	(%rcx), %r15
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	create_var
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rax, %rdi
	call	create_var
	movq	%rax, %rsi
	movq	16(%r15), %rax
	testq	%rax, %rax
	je	.L1079
	cmpq	$0, (%rax)
	je	.L1079
	cmpq	$0, 8(%rax)
	je	.L1079
.L1080:
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	create_var
	movq	%rax, 48(%rsp)
.L1081:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbx, %rdx
	movl	$6, 16(%rax)
	movq	%rax, %r12
	movq	$0, 8(%rax)
	movq	48(%rsp), %rax
	movb	$0, 20(%r12)
	movq	(%r15), %rcx
	movq	%rax, (%r12)
	call	tac_expression
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L1082
	cmpb	$0, 20(%rax)
	jne	.L1261
.L1082:
	movl	$24, %ecx
	pxor	%xmm6, %xmm6
	call	alloc_memory
	movl	$24, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %r13
	movq	$0, 8(%rax)
	movq	%rsi, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movl	$32, %ecx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rdi, (%rax)
	movb	$0, 20(%rax)
	movq	%rax, 56(%rsp)
	call	alloc_memory
	movq	56(%rsp), %r8
	movq	%rax, %rdx
	movq	%r13, 16(%rax)
	movq	%r8, 8(%rax)
	movl	$19, 24(%rax)
	movq	%r14, (%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movl	$16, %ecx
	movq	%rdi, (%rax)
	movq	%rax, %r13
	call	alloc_memory
	movq	%r13, %rdx
	movups	%xmm6, (%rax)
	movq	%rax, 8(%r13)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%r13, 16(%rbx)
	movq	8(%r15), %r13
	testq	%r13, %r13
	je	.L1087
	movl	$16, %ecx
	call	alloc_memory
	movups	%xmm6, (%rax)
	movdqu	0(%r13), %xmm2
	movq	%rax, %rdi
	movups	%xmm2, (%rax)
	movq	%xmm2, %rdx
	jmp	.L1086
	.p2align 4,,10
	.p2align 3
.L1088:
	movq	8(%rdx), %rcx
	testq	%rcx, %rcx
	je	.L1087
	movq	%rbx, %rdx
	call	tac_statement
	movq	(%rdi), %rdx
.L1086:
	testq	%rdx, %rdx
	je	.L1087
	movq	(%rdx), %rcx
	movq	%rcx, (%rdi)
	testq	%rcx, %rcx
	jne	.L1088
	movq	$0, 8(%rdi)
	jmp	.L1088
	.p2align 4,,10
	.p2align 3
.L1077:
	movq	(%rcx), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	testq	%rax, %rax
	je	.L1067
	cmpb	$0, 20(%rax)
	jne	.L1262
.L1067:
	movups	64(%rsp), %xmm6
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
	.p2align 4,,10
	.p2align 3
.L1076:
	movq	(%rcx), %rcx
	movups	64(%rsp), %xmm6
	leaq	-56(%rbp), %rsp
	movq	%rbx, %rdx
	xorl	%r8d, %r8d
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	tac_variable
	.p2align 4,,10
	.p2align 3
.L1073:
	movq	(%rcx), %rsi
	movq	(%rsi), %rcx
	testq	%rcx, %rcx
	je	.L1119
	xorl	%r8d, %r8d
	movq	%rbx, %rdx
	call	tac_variable
.L1119:
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rbx, %r9
	movl	$98, %r8d
	call	create_var
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rbx, %r9
	movl	$98, %r8d
	movq	%rax, %rdi
	call	create_var
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rbx, %r9
	movl	$98, %r8d
	movq	%rax, %r13
	call	create_var
	cmpq	$0, 8(%rsi)
	movl	$24, %ecx
	movq	%rax, %r12
	je	.L1120
	call	alloc_memory
	movl	$32, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %r14
	movq	$0, 8(%rax)
	movq	%rdi, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	%rax, %rdx
	movq	%r14, (%rax)
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movl	$16, %ecx
	movq	%rdi, (%rax)
	movq	%rax, %r14
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movq	%r14, %rdx
	movups	%xmm0, (%rax)
	movq	%rax, 8(%r14)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%r14, 16(%rbx)
	movq	8(%rsi), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L1121
	cmpb	$0, 20(%rax)
	jne	.L1263
.L1121:
	movl	$24, %ecx
	movq	%r8, 56(%rsp)
	call	alloc_memory
	movl	$24, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %r14
	movq	$0, 8(%rax)
	movq	%r12, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movl	$32, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %r15
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	56(%rsp), %r8
	movq	%r15, 8(%rax)
	movq	%rax, %rdx
	movl	$19, 24(%rax)
	movq	%r8, (%rax)
	movq	%r14, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L1122:
	movl	$16, %ecx
	call	alloc_memory
	movl	$16, %ecx
	movq	%r13, (%rax)
	movq	%rax, %r14
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movq	%r14, %rdx
	movups	%xmm0, (%rax)
	movq	%rax, 8(%r14)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%r14, 16(%rbx)
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rbx, %r9
	movl	$98, %r8d
	call	create_var
	cmpq	$0, 16(%rsi)
	movl	$24, %ecx
	movq	%rax, %r14
	je	.L1123
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r14, (%rax)
	call	list_append
.L1124:
	movl	$24, %ecx
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	32(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r12, (%rax)
	call	list_append
	movq	24(%rsi), %rdx
	testq	%rdx, %rdx
	je	.L1130
	movl	$16, %ecx
	movq	%rdx, 56(%rsp)
	call	alloc_memory
	movq	56(%rsp), %rdx
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, %r15
	movdqu	(%rdx), %xmm4
	movups	%xmm4, (%rax)
	movq	%xmm4, %rdx
	jmp	.L1129
	.p2align 4,,10
	.p2align 3
.L1131:
	movq	8(%rdx), %rcx
	testq	%rcx, %rcx
	je	.L1130
	movq	%rbx, %rdx
	call	tac_statement
	movq	(%r15), %rdx
.L1129:
	testq	%rdx, %rdx
	je	.L1130
	movq	(%rdx), %rcx
	movq	%rcx, (%r15)
	testq	%rcx, %rcx
	jne	.L1131
	movq	$0, 8(%r15)
	jmp	.L1131
	.p2align 4,,10
	.p2align 3
.L1072:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, %rsi
	movl	$5, 16(%rax)
	movq	$0, (%rax)
	movq	name_void(%rip), %rax
	movb	$0, 20(%rsi)
	movq	(%rdi), %rcx
	movq	%rax, 8(%rsi)
	testq	%rcx, %rcx
	je	.L1140
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L1140
	cmpb	$0, 20(%rax)
	jne	.L1264
.L1140:
	movl	$32, %ecx
	call	alloc_memory
	movl	$21, 24(%rax)
	movq	%rax, %rdx
.L1258:
	movq	16(%rbx), %rax
	movq	%rsi, (%rdx)
	movq	$0, 8(%rdx)
	movq	$0, 16(%rdx)
	movq	8(%rax), %rcx
	movups	64(%rsp), %xmm6
	leaq	-56(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	list_append
	.p2align 4,,10
	.p2align 3
.L1074:
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	movq	(%rcx), %r12
	xorl	%ecx, %ecx
	call	create_var
	movl	$24, %ecx
	movq	%rax, %rsi
	call	alloc_memory
	movl	$32, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %rdi
	movq	$0, 8(%rax)
	movq	%rsi, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	%rax, %rdx
	movq	%rdi, (%rax)
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movl	$16, %ecx
	movq	%rsi, (%rax)
	movq	%rax, %rdi
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movq	%rdi, %rdx
	movups	%xmm0, (%rax)
	movq	%rax, 8(%rdi)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rdi, 16(%rbx)
	movq	%rbx, %r9
	xorl	%edx, %edx
	movl	$98, %r8d
	xorl	%ecx, %ecx
	call	create_var
	movl	$98, %r8d
	movq	%rbx, %r9
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rax, %r13
	call	create_var
	movq	(%r12), %rcx
	movq	%rbx, %rdx
	movq	%rax, %rdi
	call	tac_expression
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L1108
	cmpb	$0, 20(%rax)
	jne	.L1265
.L1108:
	movl	$24, %ecx
	movq	%r8, 56(%rsp)
	pxor	%xmm6, %xmm6
	call	alloc_memory
	movl	$24, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %r14
	movq	$0, 8(%rax)
	movq	%rdi, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movl	$32, %ecx
	movq	%r13, (%rax)
	movq	%rax, %r15
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	56(%rsp), %r8
	movq	%rax, %rdx
	movq	%r15, 8(%rax)
	movq	%r8, (%rax)
	movq	%r14, 16(%rax)
	movl	$19, 24(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movl	$16, %ecx
	movq	%r13, (%rax)
	movq	%rax, %r14
	call	alloc_memory
	movq	%r14, %rdx
	movups	%xmm6, (%rax)
	movq	%rax, 8(%r14)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%r14, 16(%rbx)
	movl	$24, %ecx
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rsi, (%rax)
	call	list_append
	movl	$24, %ecx
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	32(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rdi, (%rax)
	call	list_append
	movq	8(%r12), %r13
	testq	%r13, %r13
	je	.L1113
	movl	$16, %ecx
	call	alloc_memory
	movups	%xmm6, (%rax)
	movdqu	0(%r13), %xmm3
	movq	%rax, %r12
	movups	%xmm3, (%rax)
	movq	%xmm3, %rdx
	jmp	.L1112
	.p2align 4,,10
	.p2align 3
.L1114:
	movq	8(%rdx), %rcx
	testq	%rcx, %rcx
	je	.L1113
	movq	%rbx, %rdx
	call	tac_statement
	movq	(%r12), %rdx
.L1112:
	testq	%rdx, %rdx
	je	.L1113
	movq	(%rdx), %rcx
	movq	%rcx, (%r12)
	testq	%rcx, %rcx
	jne	.L1114
	movq	$0, 8(%r12)
	jmp	.L1114
	.p2align 4,,10
	.p2align 3
.L1142:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC140(%rip), %rcx
	movq	%rax, %r9
	jmp	.L1259
	.p2align 4,,10
	.p2align 3
.L1079:
	movq	24(%r15), %rax
	movq	%rsi, 48(%rsp)
	testq	%rax, %rax
	je	.L1081
	cmpq	$0, (%rax)
	je	.L1081
	cmpq	$0, 8(%rax)
	jne	.L1080
	jmp	.L1081
	.p2align 4,,10
	.p2align 3
.L1087:
	movl	$32, %ecx
	call	alloc_memory
	movq	$0, 8(%rax)
	movq	%rax, %rdx
	movl	$20, 24(%rax)
	movq	%r12, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	16(%r15), %rdi
	testq	%rdi, %rdi
	je	.L1085
	cmpq	$0, (%rdi)
	je	.L1085
	cmpq	$0, 8(%rdi)
	je	.L1085
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%rdi), %xmm5
	movq	%rax, %r13
	movups	%xmm5, (%rax)
	movq	%xmm5, %rax
	testq	%rax, %rax
	je	.L1085
	movdqa	%xmm0, %xmm6
	.p2align 4,,10
	.p2align 3
.L1091:
	movq	(%rax), %rdx
	movq	%rdx, 0(%r13)
	testq	%rdx, %rdx
	je	.L1266
.L1100:
	movq	8(%rax), %r14
	testq	%r14, %r14
	je	.L1085
	movl	$16, %ecx
	call	alloc_memory
	movl	$16, %ecx
	movq	%rsi, (%rax)
	movq	%rax, %rdi
	call	alloc_memory
	movq	%rdi, %rdx
	movups	%xmm6, (%rax)
	movq	%rax, 8(%rdi)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rdi, 16(%rbx)
	movq	%rbx, %r9
	xorl	%edx, %edx
	movl	$98, %r8d
	xorl	%ecx, %ecx
	call	create_var
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rax, 56(%rsp)
	call	create_var
	movq	(%r14), %rcx
	movq	%rbx, %rdx
	movq	%rax, %rsi
	call	tac_expression
	movq	%rax, %r9
	testq	%rax, %rax
	je	.L1092
	cmpb	$0, 20(%rax)
	jne	.L1267
.L1092:
	cmpq	$0, 0(%r13)
	je	.L1093
	cmpq	$0, 8(%r13)
	je	.L1093
.L1094:
	movl	$24, %ecx
	movq	%r9, 32(%rsp)
	call	alloc_memory
	movl	$24, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %rdi
	movq	$0, 8(%rax)
	movq	%rsi, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movl	$32, %ecx
	movq	%rax, %r10
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	56(%rsp), %rax
	movb	$0, 20(%r10)
	movq	%rax, (%r10)
	movq	%r10, 40(%rsp)
	call	alloc_memory
	movq	32(%rsp), %r9
	movq	40(%rsp), %r10
	movq	%rax, %rdx
	movq	%rdi, 16(%rax)
	movq	%r10, 8(%rax)
	movq	%r9, (%rax)
	movl	$19, 24(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movl	$16, %ecx
	movq	%rax, %rdi
	movq	56(%rsp), %rax
	movq	%rax, (%rdi)
	call	alloc_memory
	movq	%rdi, %rdx
	movups	%xmm6, (%rax)
	movq	%rax, 8(%rdi)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	8(%r14), %r14
	movq	%rdi, 16(%rbx)
	testq	%r14, %r14
	je	.L1097
	movl	$16, %ecx
	call	alloc_memory
	movups	%xmm6, (%rax)
	movdqu	(%r14), %xmm1
	movq	%rax, %rdi
	movups	%xmm1, (%rax)
	movq	%xmm1, %rdx
	jmp	.L1096
	.p2align 4,,10
	.p2align 3
.L1098:
	movq	8(%rdx), %rcx
	testq	%rcx, %rcx
	je	.L1097
	movq	%rbx, %rdx
	call	tac_statement
	movq	(%rdi), %rdx
.L1096:
	testq	%rdx, %rdx
	je	.L1097
	movq	(%rdx), %rcx
	movq	%rcx, (%rdi)
	testq	%rcx, %rcx
	jne	.L1098
	movq	$0, 8(%rdi)
	jmp	.L1098
	.p2align 4,,10
	.p2align 3
.L1097:
	movl	$32, %ecx
	call	alloc_memory
	movq	$0, 8(%rax)
	movq	%rax, %rdx
	movl	$20, 24(%rax)
	movq	%r12, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	0(%r13), %rax
	testq	%rax, %rax
	jne	.L1091
	.p2align 4,,10
	.p2align 3
.L1085:
	movq	24(%r15), %rax
	testq	%rax, %rax
	je	.L1102
	cmpq	$0, (%rax)
	je	.L1102
	cmpq	$0, 8(%rax)
	je	.L1102
	movl	$16, %ecx
	pxor	%xmm6, %xmm6
	call	alloc_memory
	movl	$16, %ecx
	movq	%rsi, (%rax)
	movq	%rax, %rdi
	call	alloc_memory
	movq	%rdi, %rdx
	movups	%xmm6, (%rax)
	movq	%rax, 8(%rdi)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rdi, 16(%rbx)
	movq	24(%r15), %rdi
	testq	%rdi, %rdi
	je	.L1105
	movl	$16, %ecx
	call	alloc_memory
	movups	%xmm6, (%rax)
	movdqu	(%rdi), %xmm5
	movq	%rax, %rsi
	movups	%xmm5, (%rax)
	movq	%xmm5, %rdx
	jmp	.L1104
	.p2align 4,,10
	.p2align 3
.L1106:
	movq	8(%rdx), %rcx
	testq	%rcx, %rcx
	je	.L1105
	movq	%rbx, %rdx
	call	tac_statement
	movq	(%rsi), %rdx
.L1104:
	testq	%rdx, %rdx
	je	.L1105
	movq	(%rdx), %rcx
	movq	%rcx, (%rsi)
	testq	%rcx, %rcx
	jne	.L1106
	movq	$0, 8(%rsi)
	jmp	.L1106
	.p2align 4,,10
	.p2align 3
.L1105:
	movl	$32, %ecx
	call	alloc_memory
	movq	$0, 8(%rax)
	movq	%rax, %rdx
	movl	$20, 24(%rax)
	movq	%r12, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L1102:
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %rsi
	movq	48(%rsp), %rax
	movq	%rax, (%rsi)
.L1257:
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movq	%rsi, %rdx
	movups	%xmm0, (%rax)
	movq	%rax, 8(%rsi)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%rsi, 16(%rbx)
	jmp	.L1067
.L1068:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movups	64(%rsp), %xmm6
	leaq	-56(%rbp), %rsp
	movl	%esi, %r8d
	popq	%rbx
	movq	%rax, %rcx
	leaq	.LC141(%rip), %rdx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L1113:
	movq	40(%rbx), %r8
	testq	%r8, %r8
	je	.L1110
	movq	(%r8), %rax
	testq	%rax, %rax
	je	.L1110
	movq	8(%r8), %rdx
	cmpq	%rdx, %rax
	je	.L1268
	.p2align 4,,10
	.p2align 3
.L1116:
	movq	%rax, %rcx
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L1116
	movq	$0, (%rcx)
	movq	%rcx, 8(%r8)
.L1110:
	movq	32(%rbx), %r8
	testq	%r8, %r8
	je	.L1117
	movq	(%r8), %rax
	testq	%rax, %rax
	je	.L1117
	movq	8(%r8), %rdx
	cmpq	%rdx, %rax
	je	.L1269
	.p2align 4,,10
	.p2align 3
.L1118:
	movq	%rax, %rcx
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L1118
	movq	$0, (%rcx)
	movq	%rcx, 8(%r8)
.L1117:
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movq	%rsi, (%rax)
	movq	%rax, %r12
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	$0, 8(%rax)
	movq	%rax, %rdx
	movl	$20, 24(%rax)
	movq	%r12, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movq	%rdi, (%rax)
	movq	%rax, %rsi
	jmp	.L1257
	.p2align 4,,10
	.p2align 3
.L1130:
	movq	40(%rbx), %r8
	testq	%r8, %r8
	je	.L1127
	movq	(%r8), %rax
	testq	%rax, %rax
	je	.L1127
	movq	8(%r8), %rdx
	cmpq	%rdx, %rax
	je	.L1270
	.p2align 4,,10
	.p2align 3
.L1133:
	movq	%rax, %rcx
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L1133
	movq	$0, (%rcx)
	movq	%rcx, 8(%r8)
.L1127:
	movq	32(%rbx), %r8
	testq	%r8, %r8
	je	.L1134
	movq	(%r8), %rax
	testq	%rax, %rax
	je	.L1134
	movq	8(%r8), %rdx
	cmpq	%rdx, %rax
	je	.L1271
	.p2align 4,,10
	.p2align 3
.L1135:
	movq	%rax, %rcx
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L1135
	movq	$0, (%rcx)
	movq	%rcx, 8(%r8)
.L1134:
	cmpq	$0, 16(%rsi)
	je	.L1137
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %r15
	movq	$0, 8(%rax)
	movq	%r14, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	%rax, %rdx
	movq	%r15, (%rax)
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movl	$16, %ecx
	movq	%r14, (%rax)
	movq	%rax, %r15
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movq	%r15, %rdx
	movups	%xmm0, (%rax)
	movq	%rax, 8(%r15)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%r15, 16(%rbx)
	movq	16(%rsi), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	testq	%rax, %rax
	je	.L1137
	cmpb	$0, 20(%rax)
	jne	.L1272
.L1137:
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %r14
	movq	$0, 8(%rax)
	movq	%rdi, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	cmpq	$0, 8(%rsi)
	movl	$20, 24(%rax)
	movq	%rax, %rdx
	movq	%r14, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	je	.L1273
.L1139:
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movq	%r12, (%rax)
	movq	%rax, %rsi
	jmp	.L1257
	.p2align 4,,10
	.p2align 3
.L1123:
	cmpq	$0, 8(%rsi)
	je	.L1125
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rdi, (%rax)
	call	list_append
	jmp	.L1124
.L1125:
	call	alloc_memory
	movb	$0, 20(%rax)
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	call	list_append
	jmp	.L1124
.L1272:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	jmp	.L1137
.L1264:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rsi
	jmp	.L1140
	.p2align 4,,10
	.p2align 3
.L1093:
	movq	24(%r15), %rax
	testq	%rax, %rax
	je	.L1147
	cmpq	$0, (%rax)
	je	.L1147
	cmpq	$0, 8(%rax)
	cmove	48(%rsp), %rsi
	jmp	.L1094
	.p2align 4,,10
	.p2align 3
.L1147:
	movq	48(%rsp), %rsi
	jmp	.L1094
	.p2align 4,,10
	.p2align 3
.L1266:
	movq	$0, 8(%r13)
	jmp	.L1100
	.p2align 4,,10
	.p2align 3
.L1267:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r9
	jmp	.L1092
	.p2align 4,,10
	.p2align 3
.L1120:
	call	alloc_memory
	movl	$32, %ecx
	movq	%r13, (%rax)
	movq	%rax, %r14
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movq	%r14, (%rax)
	movq	%rax, %rdx
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L1122
.L1261:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r14
	jmp	.L1082
.L1265:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r8
	jmp	.L1108
.L1262:
	movups	64(%rsp), %xmm6
	leaq	-56(%rbp), %rsp
	movq	%rbx, %rdx
	movq	%rax, %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	load_rvalue.part.0
.L1273:
	movl	$24, %ecx
	call	alloc_memory
	movl	$32, %ecx
	movl	$6, 16(%rax)
	movq	%rax, %rsi
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory
	movl	$20, 24(%rax)
	movq	%rax, %rdx
	movq	%rsi, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	jmp	.L1139
.L1271:
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%r8)
	jmp	.L1134
.L1268:
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%r8)
	jmp	.L1110
.L1270:
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%r8)
	jmp	.L1127
.L1269:
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%r8)
	jmp	.L1117
.L1263:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r8
	jmp	.L1121
	.section .rdata,"dr"
	.align 8
.LC142:
	.ascii "[Warning] Constructor '%s' does not start with 'self' initialization\12\0"
	.align 8
.LC143:
	.ascii "[Warning] Unsupported class member type for tac_class: %d\12\0"
	.section	.text.unlikely,"x"
.LCOLDB144:
	.text
.LHOTB144:
	.p2align 4
	.def	tac_class;	.scl	3;	.type	32;	.endef
tac_class:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$32, %rsp
	andq	$-16, %rsp
	subq	$48, %rsp
	movq	8(%rcx), %r12
	movups	%xmm6, 48(%rsp)
	movups	%xmm7, 64(%rsp)
	movq	%rcx, 24(%rdx)
	testq	%r12, %r12
	je	.L1275
	movl	$16, %ecx
	pxor	%xmm6, %xmm6
	call	alloc_memory
	movl	$24, %ecx
	movq	(%rsi), %xmm7
	movups	%xmm6, (%rax)
	movdqu	(%r12), %xmm3
	movq	%rax, %rdi
	movups	%xmm3, (%rax)
	call	alloc_memory
	movl	$16, %ecx
	movq	%rax, %rsi
	call	alloc_memory
	movq	%rsi, %rdx
	movq	%rax, %xmm0
	movups	%xmm6, (%rax)
	punpcklqdq	%xmm7, %xmm0
	movq	$0, 16(%rsi)
	movups	%xmm0, (%rsi)
	movq	(%rbx), %rax
	movq	(%rax), %rcx
	call	list_append
	.p2align 4,,10
	.p2align 3
.L1276:
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L1277
.L1321:
	movq	(%rax), %rdx
	movq	%rdx, (%rdi)
	testq	%rdx, %rdx
	je	.L1320
.L1299:
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1277
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1278
	cmpl	$1, %esi
	je	.L1279
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	%esi, %r8d
	leaq	.LC143(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	(%rdi), %rax
	testq	%rax, %rax
	jne	.L1321
.L1277:
	movq	$0, 24(%rbx)
	movups	48(%rsp), %xmm6
	movups	64(%rsp), %xmm7
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
	.p2align 4,,10
	.p2align 3
.L1279:
	movq	(%rax), %rcx
	movl	$1, %r8d
	movq	%rbx, %rdx
	call	tac_variable
	jmp	.L1276
	.p2align 4,,10
	.p2align 3
.L1278:
	movq	(%rax), %r13
	movq	8(%r13), %rdx
	movq	0(%r13), %rcx
	call	create_subroutine
	movq	%rax, 8(%rbx)
	movq	%rax, %rsi
	movq	(%rbx), %rax
	movq	%rsi, %rdx
	movq	24(%rax), %rcx
	call	list_append
	movq	16(%r13), %r14
	testq	%r14, %r14
	je	.L1285
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%r14), %xmm1
	movq	%rax, %r12
	movups	%xmm1, (%rax)
	movq	%xmm1, %rax
	jmp	.L1284
	.p2align 4,,10
	.p2align 3
.L1286:
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1285
.L1287:
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	movq	%rbx, %r9
	movl	$112, %r8d
	call	create_var
	movq	16(%rsi), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	(%r12), %rax
.L1284:
	testq	%rax, %rax
	je	.L1285
	movq	(%rax), %rdx
	movq	%rdx, (%r12)
	testq	%rdx, %rdx
	jne	.L1286
	movq	$0, 8(%r12)
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L1287
	.p2align 4,,10
	.p2align 3
.L1285:
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	create_var
	movl	$16, %ecx
	pxor	%xmm6, %xmm6
	movq	%rax, %r14
	call	alloc_memory
	movl	$16, %ecx
	movq	%r14, (%rax)
	movq	%rax, %r12
	call	alloc_memory
	movq	32(%rsi), %rcx
	movq	%r12, %rdx
	movups	%xmm6, (%rax)
	movq	%rax, 8(%r12)
	call	list_append
	movq	24(%r13), %rsi
	movq	%r12, 16(%rbx)
	testq	%rsi, %rsi
	je	.L1322
	movl	$16, %ecx
	call	alloc_memory
	movups	%xmm6, (%rax)
	movdqu	(%rsi), %xmm2
	movq	%rax, %r14
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi
	movups	%xmm2, (%rax)
	movq	24(%rbx), %rax
	movq	(%rax), %rax
	movq	8(%rax), %r11
	movq	%r11, %rcx
	movq	%r11, 40(%rsp)
	call	strlen
	movq	%rsi, %rcx
	movq	%rax, %r15
	call	strlen
	movl	$1, %r8d
	leaq	.LC38(%rip), %rcx
	leaq	2(%r15,%rax), %rdx
	call	create_string_check
	movq	40(%rsp), %r8
	movq	%rsi, %r9
	leaq	.LC128(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %r15
	call	sprintf
	movq	0(%r13), %rax
	movq	%r15, %rdx
	movq	8(%rax), %rsi
	movq	%rsi, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L1294
	jmp	.L1323
	.p2align 4,,10
	.p2align 3
.L1296:
	movq	8(%rax), %rcx
	testq	%rcx, %rcx
	je	.L1295
.L1297:
	movq	%rbx, %rdx
	call	tac_statement
.L1294:
	movq	(%r14), %rax
	testq	%rax, %rax
	je	.L1295
	movq	(%rax), %rdx
	movq	%rdx, (%r14)
	testq	%rdx, %rdx
	jne	.L1296
	movq	8(%rax), %rcx
	movq	$0, 8(%r14)
	testq	%rcx, %rcx
	jne	.L1297
	.p2align 4,,10
	.p2align 3
.L1295:
	movq	$0, 8(%rbx)
	jmp	.L1276
	.p2align 4,,10
	.p2align 3
.L1320:
	movq	$0, 8(%rdi)
	jmp	.L1299
	.p2align 4,,10
	.p2align 3
.L1323:
	movq	(%r14), %rax
	testq	%rax, %rax
	je	.L1289
	movq	(%rax), %rdx
	movq	%rdx, (%r14)
	testq	%rdx, %rdx
	je	.L1324
.L1290:
	movq	8(%rax), %rax
	movl	8(%rax), %ecx
	testl	%ecx, %ecx
	jne	.L1291
	movq	(%rax), %rax
	cmpl	$19, 24(%rax)
	je	.L1325
.L1291:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, %r8
	leaq	.LC142(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L1276
	.p2align 4,,10
	.p2align 3
.L1325:
	movq	8(%rax), %rax
	cmpl	$8, 8(%rax)
	jne	.L1291
	movq	(%rax), %rax
	movl	16(%rax), %edx
	testl	%edx, %edx
	jne	.L1291
	movq	24(%rbx), %rdx
	movl	$24, %ecx
	movq	8(%rax), %r13
	movq	%rdx, 40(%rsp)
	call	alloc_memory
	movq	40(%rsp), %rdx
	movq	%rbx, %r9
	movq	%r13, %rcx
	movq	%rax, %rsi
	movl	$1, 16(%rax)
	movl	$118, %r8d
	movq	24(%rdx), %rax
	movb	$0, 20(%rsi)
	movq	0(%r13), %rdx
	movq	%rax, (%rsi)
	movq	name_int(%rip), %rax
	movq	%rax, 8(%rsi)
	call	create_var
	movl	$24, %ecx
	movq	%rax, 40(%rsp)
	call	alloc_memory
	movq	40(%rsp), %rdx
	movl	$32, %ecx
	movl	$0, 16(%rax)
	movq	%rax, %r13
	movq	%rdx, %xmm0
	movhps	16(%rdx), %xmm0
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory
	movq	8(%r12), %rcx
	movl	$18, 24(%rax)
	movq	%rax, %rdx
	movq	%r13, (%rax)
	movq	%rsi, 8(%rax)
	movq	$0, 16(%rax)
	call	list_append
	jmp	.L1294
	.p2align 4,,10
	.p2align 3
.L1322:
	movq	24(%rbx), %rax
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi
	movq	(%rax), %rax
	movq	8(%rax), %r10
	movq	%r10, %rcx
	movq	%r10, 40(%rsp)
	call	strlen
	movq	%rsi, %rcx
	movq	%rax, %r12
	call	strlen
	movl	$1, %r8d
	leaq	.LC38(%rip), %rcx
	leaq	2(%r12,%rax), %rdx
	call	create_string_check
	movq	40(%rsp), %r8
	leaq	.LC128(%rip), %rdx
	movq	%rsi, %r9
	movq	%rax, %rcx
	movq	%rax, %r12
	call	sprintf
	movq	0(%r13), %rax
	movq	%r12, %rdx
	movq	8(%rax), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L1295
	jmp	.L1289
	.p2align 4,,10
	.p2align 3
.L1324:
	movq	$0, 8(%r14)
	jmp	.L1290
.L1275:
	movq	(%rcx), %xmm6
	movl	$24, %ecx
	call	alloc_memory
	movl	$16, %ecx
	movq	%rax, %rsi
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movq	%rsi, %rdx
	movups	%xmm0, (%rax)
	movq	%rax, %xmm0
	punpcklqdq	%xmm6, %xmm0
	movq	$0, 16(%rsi)
	movups	%xmm0, (%rsi)
	movq	(%rbx), %rax
	movq	(%rax), %rcx
	call	list_append
	jmp	.L1277
	.section	.text.unlikely,"x"
	.def	tac_class.cold;	.scl	3;	.type	32;	.endef
tac_class.cold:
.L1289:
	movl	8, %eax
	ud2
	.text
	.section	.text.unlikely,"x"
.LCOLDE144:
	.text
.LHOTE144:
	.section .rdata,"dr"
	.align 8
.LC145:
	.ascii "[Lexer Error] at %s:%zu:%zu: Unterminated string literal\12\0"
.LC146:
	.ascii "\0\0"
	.align 8
.LC147:
	.ascii "[Lexer Error] at %s:%zu:%zu: Unterminated comment\12\0"
	.align 8
.LC148:
	.ascii "[Lexer Error] at %s:%zu:%zu: Unexpected character\12\0"
	.text
	.p2align 4
	.def	next_token;	.scl	3;	.type	32;	.endef
next_token:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	movl	%edx, %r14d
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$48, %rsp
	movq	16(%rcx), %r12
	movq	24(%rcx), %rdx
	movq	40(%rcx), %r13
	movups	%xmm6, 48(%rsp)
	cmpq	%rdx, %r12
	jnb	.L1327
	leaq	1(%r13), %rdi
	leaq	1(%r12), %rsi
	movq	%rdi, 40(%rcx)
	movq	8(%rcx), %rcx
	movq	%rsi, 16(%rbx)
	leaq	(%rcx,%r12), %r9
	movzbl	(%r9), %eax
	cmpb	$32, %al
	ja	.L1328
	leaq	.L1330(%rip), %r10
	movzbl	%al, %r8d
	movslq	(%r10,%r8,4), %r8
	addq	%r10, %r8
	jmp	*%r8
	.section .rdata,"dr"
	.align 4
.L1330:
	.long	.L1419-.L1330
	.long	.L1328-.L1330
	.long	.L1328-.L1330
	.long	.L1328-.L1330
	.long	.L1328-.L1330
	.long	.L1328-.L1330
	.long	.L1328-.L1330
	.long	.L1328-.L1330
	.long	.L1328-.L1330
	.long	.L1525-.L1330
	.long	.L1331-.L1330
	.long	.L1328-.L1330
	.long	.L1328-.L1330
	.long	.L1525-.L1330
	.long	.L1328-.L1330
	.long	.L1328-.L1330
	.long	.L1328-.L1330
	.long	.L1328-.L1330
	.long	.L1328-.L1330
	.long	.L1328-.L1330
	.long	.L1328-.L1330
	.long	.L1328-.L1330
	.long	.L1328-.L1330
	.long	.L1328-.L1330
	.long	.L1328-.L1330
	.long	.L1328-.L1330
	.long	.L1328-.L1330
	.long	.L1328-.L1330
	.long	.L1328-.L1330
	.long	.L1328-.L1330
	.long	.L1328-.L1330
	.long	.L1328-.L1330
	.long	.L1525-.L1330
	.text
	.p2align 4,,10
	.p2align 3
.L1419:
	movq	%rdi, %r13
	.p2align 4,,10
	.p2align 3
.L1327:
	movq	32(%rbx), %xmm6
	movq	%r13, %xmm1
	movl	$32, %ecx
	punpcklqdq	%xmm1, %xmm6
	call	alloc_memory
	movl	$0, 24(%rax)
	movq	$0, (%rax)
	movups	%xmm6, 8(%rax)
.L1326:
	movups	48(%rsp), %xmm6
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
	.p2align 4,,10
	.p2align 3
.L1331:
	addq	$1, 32(%rbx)
	movq	$0, 40(%rbx)
.L1525:
	movups	48(%rsp), %xmm6
	leaq	-56(%rbp), %rsp
	movsbl	%r14b, %edx
	movq	%rbx, %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	next_token
	.p2align 4,,10
	.p2align 3
.L1328:
	cmpb	$90, %al
	jg	.L1333
	cmpb	$64, %al
	jg	.L1334
	cmpb	$34, %al
	je	.L1335
	leal	-48(%rax), %r8d
	cmpb	$9, %r8b
	jbe	.L1337
	jmp	.L1528
	.p2align 4,,10
	.p2align 3
.L1530:
	addq	$1, %rsi
	addq	$1, %rdi
	movq	%rdi, 40(%rbx)
	movq	%rsi, 16(%rbx)
	movzbl	-1(%rcx,%rsi), %eax
.L1337:
	leal	-48(%rax), %r8d
	cmpb	$9, %r8b
	ja	.L1529
	cmpq	%rdx, %rsi
	jb	.L1530
	movl	$2, %r14d
.L1348:
	leaq	-1(%rsi), %rdx
	subq	$1, %rdi
	movq	%r13, %xmm2
	movq	%r9, %rcx
	movq	%rdx, 16(%rbx)
	movq	32(%rbx), %xmm6
	subq	%r12, %rdx
	movl	$1, %r8d
	movq	%rdi, 40(%rbx)
	punpcklqdq	%xmm2, %xmm6
	call	create_string_check
	movl	$32, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movl	%r14d, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L1326
	.p2align 4,,10
	.p2align 3
.L1333:
	cmpb	$95, %al
	jne	.L1531
.L1334:
	movabsq	$288230372997595135, %r8
	jmp	.L1339
	.p2align 4,,10
	.p2align 3
.L1533:
	addq	$1, %rsi
	addq	$1, %rdi
	movq	%rdi, 40(%rbx)
	movq	%rsi, 16(%rbx)
	movzbl	-1(%rcx,%rsi), %eax
.L1339:
	cmpb	$57, %al
	jle	.L1532
	subl	$65, %eax
	cmpb	$57, %al
	ja	.L1340
	btq	%rax, %r8
	jnc	.L1340
.L1342:
	cmpq	%rdx, %rsi
	jb	.L1533
.L1340:
	leaq	-1(%rsi), %rdx
	subq	$1, %rdi
	movl	$1, %r8d
	movq	%r9, %rcx
	movq	%rdx, 16(%rbx)
	subq	%r12, %rdx
	movq	%rdi, 40(%rbx)
	call	create_string_check
	cmpb	$0, initialized(%rip)
	movq	%rax, %rsi
	je	.L1534
.L1344:
	leaq	keywordList(%rip), %rax
	leaq	176(%rax), %rdx
	jmp	.L1346
	.p2align 4,,10
	.p2align 3
.L1536:
	addq	$8, %rax
	cmpq	%rdx, %rax
	je	.L1535
.L1346:
	cmpq	(%rax), %rsi
	jne	.L1536
	movq	32(%rbx), %xmm6
	movq	%r13, %xmm5
	movl	$32, %ecx
	punpcklqdq	%xmm5, %xmm6
	call	alloc_memory
	movl	$6, 24(%rax)
	movq	%rsi, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L1326
	.p2align 4,,10
	.p2align 3
.L1531:
	leal	-97(%rax), %r8d
	cmpb	$25, %r8b
	jbe	.L1334
	cmpq	%rdx, %rsi
	jnb	.L1537
	movzbl	1(%rcx,%r12), %r9d
	xorl	%r10d, %r10d
.L1368:
	cmpb	$61, %r9b
	sete	%cl
	movl	%ecx, %edx
	cmpb	$61, %al
	jne	.L1411
	testb	%cl, %cl
	je	.L1411
	movq	32(%rbx), %xmm6
	leaq	2(%r13), %rax
	addq	$2, %r12
	movq	%r13, %xmm0
	movq	%rax, 40(%rbx)
	movq	%r12, 16(%rbx)
	movq	152+symbolList(%rip), %rbx
	punpcklqdq	%xmm0, %xmm6
.L1524:
	movl	$32, %ecx
	call	alloc_memory
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L1326
	.p2align 4,,10
	.p2align 3
.L1335:
	xorl	%edi, %edi
	cmpq	%rdx, %rsi
	jnb	.L1352
	leaq	2(%r13), %rax
	movq	%rax, 40(%rbx)
	leaq	2(%r12), %rax
	movq	%rax, 16(%rbx)
	movzbl	1(%rcx,%r12), %edi
.L1352:
	movabsq	$-17179870210, %r9
	jmp	.L1353
	.p2align 4,,10
	.p2align 3
.L1539:
	leaq	1(%rax), %r8
	addq	$1, 40(%rbx)
	movq	%r8, 16(%rbx)
	movzbl	(%rcx,%rax), %edi
.L1353:
	cmpb	$34, %dil
	jbe	.L1538
.L1355:
	movq	16(%rbx), %rax
	cmpq	%rdx, %rax
	jb	.L1539
	xorl	%edi, %edi
.L1354:
	movq	32(%rbx), %r12
	cmpb	$34, %dil
	je	.L1356
	movq	(%rbx), %r14
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	leaq	1(%r12), %r9
	leaq	.LC145(%rip), %rdx
	movq	%rax, %rcx
	movq	%r14, %r8
	call	fprintf
	cmpb	$10, %dil
	je	.L1357
	movq	32(%rbx), %r12
.L1356:
	movq	16(%rbx), %rdx
	movq	%r12, %xmm6
	movq	%r13, %xmm3
	movl	$1, %r8d
	punpcklqdq	%xmm3, %xmm6
	leaq	.LC146(%rip), %rcx
	subq	%rsi, %rdx
	cmpq	$1, %rdx
	je	.L1522
	movq	8(%rbx), %rcx
	subq	$1, %rdx
	movl	$1, %r8d
	addq	%rsi, %rcx
.L1522:
	call	create_string_check
	movl	$32, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movl	$4, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L1326
	.p2align 4,,10
	.p2align 3
.L1534:
	call	init.part.0
	jmp	.L1344
	.p2align 4,,10
	.p2align 3
.L1538:
	btq	%rdi, %r9
	jc	.L1355
	jmp	.L1354
	.p2align 4,,10
	.p2align 3
.L1535:
	movq	32(%rbx), %xmm6
	movq	%r13, %xmm4
	movl	$32, %ecx
	punpcklqdq	%xmm4, %xmm6
	call	alloc_memory
	movl	$1, 24(%rax)
	movq	%rsi, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L1326
.L1528:
	cmpb	$47, %al
	sete	%r8b
	movl	%r8d, %r10d
	cmpq	%rdx, %rsi
	jnb	.L1417
	movzbl	1(%rcx,%r12), %r9d
	cmpb	$47, %r9b
	jne	.L1363
	testb	%r8b, %r8b
	je	.L1363
	movl	$47, %eax
	jmp	.L1361
	.p2align 4,,10
	.p2align 3
.L1540:
	addq	$1, %rsi
	addq	$1, %rdi
	movq	%rdi, 40(%rbx)
	movq	%rsi, 16(%rbx)
	movzbl	-1(%rcx,%rsi), %eax
.L1361:
	cmpb	$10, %al
	je	.L1364
	testb	%al, %al
	je	.L1364
	cmpq	%rdx, %rsi
	jb	.L1540
.L1364:
	leaq	-1(%rsi), %rdx
	subq	$1, %rdi
	movq	%rdx, 16(%rbx)
	movq	%rdi, 40(%rbx)
	testb	%r14b, %r14b
	jne	.L1525
	movq	32(%rbx), %xmm6
	addq	$2, %r12
	movq	%r13, %xmm0
	subq	%r12, %rdx
	addq	%r12, %rcx
	punpcklqdq	%xmm0, %xmm6
.L1523:
	movl	$1, %r8d
	call	create_string_check
	movl	$32, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movl	$7, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L1326
.L1529:
	movl	$2, %r14d
	cmpq	%rdx, %rsi
	jnb	.L1348
	cmpb	$46, %al
	jne	.L1348
	leaq	(%rcx,%rsi), %r8
	movzbl	(%r8), %eax
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L1348
	addq	$1, %rdi
	addq	$1, %rsi
	movq	%rdi, 40(%rbx)
	movq	%rsi, 16(%rbx)
	movzbl	(%r8), %eax
	jmp	.L1350
	.p2align 4,,10
	.p2align 3
.L1541:
	addq	$1, %rsi
	addq	$1, %rdi
	movq	%rdi, 40(%rbx)
	movq	%rsi, 16(%rbx)
	movzbl	-1(%rcx,%rsi), %eax
.L1350:
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L1424
	cmpq	%rdx, %rsi
	jb	.L1541
.L1424:
	movl	$3, %r14d
	jmp	.L1348
.L1537:
	xorl	%r10d, %r10d
.L1417:
	xorl	%edx, %edx
	xorl	%r9d, %r9d
.L1360:
	cmpb	$43, %al
	jne	.L1382
	testb	%dl, %dl
	jne	.L1542
.L1382:
	cmpb	$45, %al
	jne	.L1383
	testb	%dl, %dl
	jne	.L1543
.L1383:
	cmpb	$42, %al
	jne	.L1384
	testb	%dl, %dl
	jne	.L1544
.L1385:
	cmpb	$37, %al
	jne	.L1386
	testb	%dl, %dl
	jne	.L1545
.L1386:
	cmpb	$38, %al
	jne	.L1387
	cmpb	$38, %r9b
	je	.L1546
.L1387:
	cmpb	$124, %al
	jne	.L1388
	cmpb	$124, %r9b
	je	.L1547
.L1388:
	movq	32(%rbx), %rsi
	movq	%r13, %xmm0
	subl	$33, %eax
	movq	%rsi, %xmm6
	punpcklqdq	%xmm0, %xmm6
	cmpb	$92, %al
	ja	.L1389
	leaq	.L1391(%rip), %rdx
	movzbl	%al, %eax
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L1391:
	.long	.L1408-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1407-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1406-.L1391
	.long	.L1405-.L1391
	.long	.L1404-.L1391
	.long	.L1403-.L1391
	.long	.L1402-.L1391
	.long	.L1401-.L1391
	.long	.L1400-.L1391
	.long	.L1399-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1398-.L1391
	.long	.L1397-.L1391
	.long	.L1396-.L1391
	.long	.L1395-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1394-.L1391
	.long	.L1389-.L1391
	.long	.L1393-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1389-.L1391
	.long	.L1392-.L1391
	.long	.L1389-.L1391
	.long	.L1390-.L1391
	.text
.L1389:
	movq	(%rbx), %rbx
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	leaq	.LC148(%rip), %rdx
	leaq	1(%rsi), %r9
	movq	%rax, %rcx
	movq	%rbx, %r8
	call	fprintf
	movl	$32, %ecx
	call	alloc_memory
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	pxor	%xmm0, %xmm0
	movl	%edx, 24(%rax)
	movq	%rcx, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L1326
	.p2align 4,,10
	.p2align 3
.L1357:
	movq	32(%rbx), %rax
	movq	$0, 40(%rbx)
	leaq	1(%rax), %r12
	movq	%r12, 32(%rbx)
	jmp	.L1356
.L1363:
	cmpb	$42, %r9b
	jne	.L1368
	testb	%r8b, %r8b
	je	.L1368
	leaq	2(%r12), %rsi
	movl	$42, %eax
	movl	$47, %r8d
	.p2align 4,,10
	.p2align 3
.L1369:
	cmpb	$42, %r8b
	jne	.L1487
	cmpb	$47, %al
	je	.L1548
.L1487:
	movq	16(%rbx), %rax
	cmpq	%rdx, %rax
	jnb	.L1370
	leaq	1(%rax), %r9
	addq	$1, 40(%rbx)
	movq	%r9, 16(%rbx)
	movzbl	(%rcx,%rax), %r8d
	cmpq	%rdx, %r9
	jnb	.L1549
	movzbl	1(%rcx,%rax), %eax
	cmpb	$10, %r8b
	jne	.L1374
	addq	$1, 32(%rbx)
	movq	$0, 40(%rbx)
	testb	%al, %al
	jne	.L1487
	jmp	.L1521
	.p2align 4,,10
	.p2align 3
.L1374:
	testb	%al, %al
	je	.L1372
	testb	%r8b, %r8b
	jne	.L1369
	movq	32(%rbx), %rax
	addq	$3, %r12
	movl	$2, %ecx
	movq	(%rbx), %r15
	leaq	1(%rax), %rdi
	call	*__imp___acrt_iob_func(%rip)
	movq	%r12, 32(%rsp)
	movq	%rdi, %r9
	movq	%rax, %rcx
.L1527:
	movq	%r15, %r8
	leaq	.LC147(%rip), %rdx
	call	fprintf
	testb	%r14b, %r14b
	jne	.L1525
	movq	32(%rbx), %xmm6
	movq	16(%rbx), %rdx
	movq	%r13, %xmm0
	movq	8(%rbx), %rcx
	punpcklqdq	%xmm0, %xmm6
	subq	%rsi, %rdx
	addq	%rsi, %rcx
	jmp	.L1523
	.p2align 4,,10
	.p2align 3
.L1549:
	cmpb	$10, %r8b
	jne	.L1372
	movq	32(%rbx), %rax
	movq	$0, 40(%rbx)
	leaq	1(%rax), %rdi
	movq	%rdi, 32(%rbx)
.L1373:
	movl	$2, %ecx
	movq	(%rbx), %r15
	addq	$3, %r12
	call	*__imp___acrt_iob_func(%rip)
	movq	%r12, 32(%rsp)
	leaq	1(%rdi), %r9
	movq	%rax, %rcx
	jmp	.L1527
.L1548:
	movq	16(%rbx), %rax
	cmpq	%rdx, %rax
	jnb	.L1415
	addq	$1, %rax
	addq	$1, 40(%rbx)
	movq	%rax, 16(%rbx)
.L1415:
	testb	%r14b, %r14b
	jne	.L1525
	movq	16(%rbx), %rdx
	movq	32(%rbx), %xmm6
	movq	%r13, %xmm0
	addq	%rsi, %rcx
	subq	$2, %rdx
	punpcklqdq	%xmm0, %xmm6
	subq	%rsi, %rdx
	jmp	.L1523
.L1372:
	testb	%r8b, %r8b
	jne	.L1521
.L1370:
	subq	$1, 16(%rbx)
	subq	$1, 40(%rbx)
.L1521:
	movq	32(%rbx), %rdi
	jmp	.L1373
.L1384:
	testb	%dl, %dl
	je	.L1385
	testb	%r10b, %r10b
	je	.L1385
	movq	%rbx, %rcx
	call	get_current_char.isra.0
	movq	40(%rbx), %rax
	movq	32(%rbx), %xmm6
	movq	208+symbolList(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm6
	jmp	.L1524
.L1542:
	movq	%rbx, %rcx
	call	get_current_char.isra.0
	movq	40(%rbx), %rax
	movq	32(%rbx), %xmm6
	movq	184+symbolList(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm6
	jmp	.L1524
.L1544:
	movq	%rbx, %rcx
	call	get_current_char.isra.0
	movq	40(%rbx), %rax
	movq	32(%rbx), %xmm6
	movq	200+symbolList(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm6
	jmp	.L1524
.L1543:
	movq	%rbx, %rcx
	call	get_current_char.isra.0
	movq	40(%rbx), %rax
	movq	32(%rbx), %xmm6
	movq	192+symbolList(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm6
	jmp	.L1524
.L1545:
	movq	%rbx, %rcx
	call	get_current_char.isra.0
	movq	40(%rbx), %rax
	movq	32(%rbx), %xmm6
	movq	216+symbolList(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm6
	jmp	.L1524
.L1546:
	movq	%rbx, %rcx
	call	get_current_char.isra.0
	movq	40(%rbx), %rax
	movq	32(%rbx), %xmm6
	movq	224+symbolList(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm6
	jmp	.L1524
.L1547:
	movq	%rbx, %rcx
	call	get_current_char.isra.0
	movq	40(%rbx), %rax
	movq	32(%rbx), %xmm6
	movq	232+symbolList(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm6
	jmp	.L1524
.L1532:
	cmpb	$47, %al
	jg	.L1342
	jmp	.L1340
.L1411:
	cmpb	$33, %al
	jne	.L1381
	testb	%cl, %cl
	jne	.L1550
.L1381:
	cmpb	$60, %al
	jne	.L1414
	testb	%cl, %cl
	je	.L1414
	movq	32(%rbx), %xmm6
	leaq	2(%r13), %rax
	addq	$2, %r12
	movq	%r13, %xmm0
	movq	%rax, 40(%rbx)
	movq	%r12, 16(%rbx)
	punpcklqdq	%xmm0, %xmm6
	movq	168+symbolList(%rip), %rbx
	jmp	.L1524
.L1550:
	movq	32(%rbx), %xmm6
	leaq	2(%r13), %rax
	addq	$2, %r12
	movq	%r13, %xmm0
	movq	%rax, 40(%rbx)
	movq	%r12, 16(%rbx)
	punpcklqdq	%xmm0, %xmm6
	movq	160+symbolList(%rip), %rbx
	jmp	.L1524
.L1414:
	cmpb	$62, %al
	jne	.L1360
	testb	%cl, %cl
	je	.L1360
	movq	%rbx, %rcx
	call	get_current_char.isra.0
	movq	40(%rbx), %rax
	movq	32(%rbx), %xmm6
	movq	176+symbolList(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm6
	jmp	.L1524
.L1390:
	movq	24+symbolList(%rip), %rbx
	jmp	.L1524
.L1392:
	movq	16+symbolList(%rip), %rbx
	jmp	.L1524
.L1393:
	movq	64+symbolList(%rip), %rbx
	jmp	.L1524
.L1394:
	movq	56+symbolList(%rip), %rbx
	jmp	.L1524
.L1395:
	movq	136+symbolList(%rip), %rbx
	jmp	.L1524
.L1396:
	movq	144+symbolList(%rip), %rbx
	jmp	.L1524
.L1397:
	movq	128+symbolList(%rip), %rbx
	jmp	.L1524
.L1398:
	movq	72+symbolList(%rip), %rbx
	jmp	.L1524
.L1399:
	movq	112+symbolList(%rip), %rbx
	jmp	.L1524
.L1400:
	movq	48+symbolList(%rip), %rbx
	jmp	.L1524
.L1401:
	movq	96+symbolList(%rip), %rbx
	jmp	.L1524
.L1402:
	movq	32+symbolList(%rip), %rbx
	jmp	.L1524
.L1403:
	movq	88+symbolList(%rip), %rbx
	jmp	.L1524
.L1404:
	movq	104+symbolList(%rip), %rbx
	jmp	.L1524
.L1405:
	movq	8+symbolList(%rip), %rbx
	jmp	.L1524
.L1406:
	movq	symbolList(%rip), %rbx
	jmp	.L1524
.L1407:
	movq	120+symbolList(%rip), %rbx
	jmp	.L1524
.L1408:
	movq	40+symbolList(%rip), %rbx
	jmp	.L1524
	.section .rdata,"dr"
	.align 8
.LC149:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse parenthesized expression\12\0"
	.align 8
.LC150:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after expression\12\0"
	.align 8
.LC151:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '!'\12\0"
	.align 8
.LC152:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '-'\12\0"
	.align 8
.LC153:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot call undefined variable\12\0"
	.align 8
.LC154:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot call non-function variable\12\0"
	.align 8
.LC155:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function call argument\12\0"
	.align 8
.LC156:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function call argument\12\0"
	.align 8
.LC157:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse sequence index\12\0"
	.align 8
.LC158:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ']' after sequence index\12\0"
	.align 8
.LC159:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot access attribute without a valid scope\12\0"
	.align 8
.LC160:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected attribute name after '.'\12\0"
	.align 8
.LC161:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown attribute name\12\0"
	.align 8
.LC162:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse variable access\12\0"
	.align 8
.LC163:
	.ascii "[Parser Error] at %s:%zu:%zu: Unexpected token in primary expression\12\0"
	.text
	.p2align 4
	.def	parse_primary;	.scl	3;	.type	32;	.endef
parse_primary:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$80, %rsp
	movq	80(%rcx), %rdi
	movups	%xmm6, 80(%rsp)
	movl	24(%rdi), %eax
	movq	%rdx, 24(%rbp)
	cmpl	$2, %eax
	je	.L1701
	cmpl	$3, %eax
	je	.L1702
	cmpl	$4, %eax
	je	.L1703
	movq	%rcx, %rsi
	movq	%r8, %r12
	cmpl	$6, %eax
	je	.L1704
	cmpl	$5, %eax
	je	.L1558
	cmpl	$1, %eax
	je	.L1705
.L1559:
	movq	16(%rdi), %rax
	movq	8(%rdi), %rbx
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	(%r12), %rax
	addq	$1, %rbx
	movq	24(%rax), %rdi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC163(%rip), %rdx
	movq	%rax, %rcx
	movq	%rdi, %r8
	call	fprintf
	xorl	%eax, %eax
	jmp	.L1551
	.p2align 4,,10
	.p2align 3
.L1702:
	movq	(%rdi), %rdx
	xorl	%r11d, %r11d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$1, %ecx
.L1553:
	movq	%r11, 32(%rsp)
	call	create_primary
.L1551:
	movups	80(%rsp), %xmm6
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
	.p2align 4,,10
	.p2align 3
.L1701:
	movq	(%rdi), %rdx
	xorl	%r11d, %r11d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	jmp	.L1553
	.p2align 4,,10
	.p2align 3
.L1704:
	movq	(%rdi), %rcx
	movq	88+keywordList(%rip), %rdx
	cmpq	%rdx, %rcx
	je	.L1638
	movq	96+keywordList(%rip), %rdx
	cmpq	%rdx, %rcx
	je	.L1706
	cmpq	40+keywordList(%rip), %rcx
	jne	.L1559
	cmpb	$0, 9(%r8)
	je	.L1559
.L1560:
	cmpq	$0, 24(%rbp)
	je	.L1643
	movq	24(%rbp), %rdx
.L1578:
	movq	8(%rdx), %rax
	jmp	.L1698
	.p2align 4,,10
	.p2align 3
.L1707:
	movq	8(%rax), %rbx
	cmpq	8(%rbx), %rcx
	je	.L1575
.L1698:
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L1707
	movq	(%rdx), %rdx
	testq	%rdx, %rdx
	jne	.L1578
.L1643:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L1575:
	movq	$0, 32(%rsp)
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rbx, %r8
	call	create_variable_access
	movq	%rax, %r11
	movq	48(%rsi), %rax
	testq	%rax, %rax
	je	.L1708
.L1579:
	cmpl	$5, 24(%rax)
	jne	.L1580
	xorl	%r13d, %r13d
	movq	%rdi, 56(%rsp)
	xorl	%r15d, %r15d
	movq	%r13, %rdi
	movq	%r11, %r13
	.p2align 4,,10
	.p2align 3
.L1636:
	testq	%rbx, %rbx
	je	.L1581
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	cmove	%rbx, %rdi
.L1581:
	testq	%r15, %r15
	jne	.L1582
	testq	%rdi, %rdi
	je	.L1582
	movl	32(%rdi), %r10d
	testl	%r10d, %r10d
	jne	.L1582
	movq	24(%rdi), %rdx
	movq	16(%rdx), %r15
.L1582:
	leaq	symbolList(%rip), %rdx
	movq	(%rax), %rax
	cmpq	(%rdx), %rax
	je	.L1709
	cmpq	56+symbolList(%rip), %rax
	je	.L1710
	cmpq	48+symbolList(%rip), %rax
	jne	.L1694
	movq	48(%rsi), %rax
	testq	%rax, %rax
	je	.L1620
	movq	%rax, 80(%rsi)
	movq	56(%rsi), %rax
	movdqu	64(%rsi), %xmm2
	movq	$0, 48(%rsi)
	movq	%rax, 16(%rsi)
	movups	%xmm2, 32(%rsi)
.L1621:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	next_token
	movq	%rax, 80(%rsi)
	movq	%rax, %r10
.L1622:
	testq	%r15, %r15
	je	.L1711
	cmpl	$1, 24(%r10)
	jne	.L1624
	movq	(%r10), %r9
	movq	%r15, %rdx
.L1625:
	movq	8(%rdx), %rax
	jmp	.L1699
	.p2align 4,,10
	.p2align 3
.L1712:
	movq	8(%rax), %rbx
	cmpq	%r9, 8(%rbx)
	je	.L1627
.L1699:
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L1712
	movq	(%rdx), %rdx
	testq	%rdx, %rdx
	jne	.L1625
	testq	%rdi, %rdi
	je	.L1631
	movl	32(%rdi), %edx
	testl	%edx, %edx
	je	.L1700
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L1631
	movl	32(%rdi), %eax
	testl	%eax, %eax
	je	.L1700
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L1631:
	movq	%rdi, %rcx
	movq	%r10, 64(%rsp)
	movq	%r9, 72(%rsp)
	call	strlen
	movq	72(%rsp), %rcx
	movq	%rax, %rbx
	call	strlen
	movl	$1, %r8d
	leaq	.LC38(%rip), %rcx
	leaq	2(%rbx,%rax), %rdx
	call	create_string_check
	movq	72(%rsp), %r9
	movq	%rdi, %r8
	leaq	.LC128(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %r14
	call	sprintf
	movq	64(%rsp), %r10
	movq	%r10, 72(%rsp)
.L1634:
	movq	8(%r15), %rax
	movq	(%rax), %rdi
	testq	%rdi, %rdi
	jne	.L1633
	jmp	.L1632
	.p2align 4,,10
	.p2align 3
.L1713:
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L1632
.L1633:
	movq	8(%rdi), %rbx
	movq	%r14, %rdx
	movq	8(%rbx), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L1713
.L1627:
	movq	%r13, %rdx
	xorl	%r9d, %r9d
	movq	%rbx, %r8
	movl	$2, %ecx
	movq	$0, 32(%rsp)
	xorl	%r15d, %r15d
	xorl	%edi, %edi
	call	create_variable_access
	movq	%rax, %r13
.L1610:
	movq	48(%rsi), %rax
	testq	%rax, %rax
	je	.L1714
.L1635:
	cmpl	$5, 24(%rax)
	je	.L1636
.L1694:
	movq	56(%rsp), %rdi
	movq	%r13, %r11
.L1580:
	testq	%r11, %r11
	je	.L1715
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$8, %ecx
	jmp	.L1553
	.p2align 4,,10
	.p2align 3
.L1703:
	movq	(%rdi), %rdx
	xorl	%r11d, %r11d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ecx
	jmp	.L1553
.L1558:
	movq	(%rdi), %rax
	cmpq	symbolList(%rip), %rax
	je	.L1716
	cmpq	40+symbolList(%rip), %rax
	je	.L1717
	cmpq	96+symbolList(%rip), %rax
	jne	.L1559
	movq	48(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L1573
	movq	56(%rcx), %rax
	movdqu	64(%rcx), %xmm6
	movq	%rbx, 80(%rcx)
	movq	$0, 48(%rcx)
	movq	%rax, 16(%rcx)
	movups	%xmm6, 32(%rcx)
.L1574:
	movq	24(%rbp), %rdx
	movq	%r12, %r8
	movq	%rsi, %rcx
	call	parse_primary
	movq	%rax, %r9
	testq	%rax, %rax
	je	.L1718
	xorl	%r11d, %r11d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$7, %ecx
	jmp	.L1553
	.p2align 4,,10
	.p2align 3
.L1620:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	next_token
	movq	48(%rsi), %r10
	movq	%rax, 80(%rsi)
	testq	%r10, %r10
	je	.L1621
	movq	56(%rsi), %rax
	movdqu	64(%rsi), %xmm3
	movq	%r10, 80(%rsi)
	movq	$0, 48(%rsi)
	movq	%rax, 16(%rsi)
	movups	%xmm3, 32(%rsi)
	jmp	.L1622
	.p2align 4,,10
	.p2align 3
.L1632:
	movq	(%r15), %r15
	testq	%r15, %r15
	jne	.L1634
	movq	72(%rsp), %r10
	movl	$2, %ecx
	movq	56(%rsp), %rdi
	movq	__imp___acrt_iob_func(%rip), %rbx
	movq	16(%r10), %rax
	movq	8(%r10), %r13
	leaq	1(%rax), %rsi
	movq	(%r12), %rax
	addq	$1, %r13
	movq	24(%rax), %r14
	call	*%rbx
	movq	%rsi, 32(%rsp)
	movq	%r13, %r9
	leaq	.LC161(%rip), %rdx
	movq	%rax, %rcx
	movq	%r14, %r8
	call	fprintf
.L1608:
	movq	16(%rdi), %rax
	movq	8(%rdi), %rsi
	movl	$2, %ecx
	leaq	1(%rax), %r13
	movq	(%r12), %rax
	addq	$1, %rsi
	movq	24(%rax), %rdi
	call	*%rbx
	movq	%r13, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC162(%rip), %rdx
	movq	%rax, %rcx
	movq	%rdi, %r8
	call	fprintf
	xorl	%eax, %eax
	jmp	.L1551
	.p2align 4,,10
	.p2align 3
.L1714:
	movl	$1, %edx
	movq	%rsi, %rcx
	movq	16(%rsi), %r14
	movdqu	32(%rsi), %xmm6
	call	next_token
	movdqu	16(%rsi), %xmm0
	movdqu	32(%rsi), %xmm4
	movq	40(%rsi), %rdx
	movq	%rax, 80(%rsi)
	punpcklqdq	%xmm4, %xmm0
	movq	%r14, 16(%rsi)
	movq	%rdx, 72(%rsi)
	movq	%rax, 48(%rsi)
	movups	%xmm0, 56(%rsi)
	movups	%xmm6, 32(%rsi)
	jmp	.L1635
	.p2align 4,,10
	.p2align 3
.L1710:
	movq	48(%rsi), %rax
	testq	%rax, %rax
	je	.L1612
	movq	%rax, 80(%rsi)
	movq	56(%rsi), %rax
	movdqu	64(%rsi), %xmm5
	movq	$0, 48(%rsi)
	movq	%rax, 16(%rsi)
	movups	%xmm5, 32(%rsi)
.L1613:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	next_token
	movq	%rax, 80(%rsi)
	movq	%rax, %r9
.L1614:
	movq	24(%rbp), %rdx
	movq	%r12, %r8
	movq	%rsi, %rcx
	movq	%r9, 72(%rsp)
	call	parse_expression
	movq	72(%rsp), %r9
	testq	%rax, %rax
	movq	%rax, %r14
	je	.L1719
.L1615:
	movq	48(%rsi), %rax
	testq	%rax, %rax
	je	.L1616
	movq	56(%rsi), %rdx
	movdqu	64(%rsi), %xmm5
	movq	%rax, 80(%rsi)
	movq	$0, 48(%rsi)
	movq	%rdx, 16(%rsi)
	movups	%xmm5, 32(%rsi)
.L1617:
	cmpl	$5, 24(%rax)
	jne	.L1618
	movq	64+symbolList(%rip), %rdx
	cmpq	%rdx, (%rax)
	jne	.L1618
	movq	%r13, %rdx
	movq	%r14, %r9
	xorl	%r8d, %r8d
	movl	$3, %ecx
	movq	$0, 32(%rsp)
	call	create_variable_access
	movq	%rax, %r13
	jmp	.L1610
	.p2align 4,,10
	.p2align 3
.L1700:
	movq	8(%rdi), %rdi
	jmp	.L1631
.L1612:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	next_token
	movq	48(%rsi), %r9
	movq	%rax, 80(%rsi)
	testq	%r9, %r9
	je	.L1613
	movq	56(%rsi), %rax
	movdqu	64(%rsi), %xmm5
	movq	%r9, 80(%rsi)
	movq	$0, 48(%rsi)
	movq	%rax, 16(%rsi)
	movups	%xmm5, 32(%rsi)
	jmp	.L1614
.L1709:
	movq	48(%rsi), %rdi
	testq	%rdi, %rdi
	je	.L1584
	movq	56(%rsi), %rax
	movdqu	64(%rsi), %xmm4
	movq	%rdi, 80(%rsi)
	movq	$0, 48(%rsi)
	movq	%rax, 16(%rsi)
	movups	%xmm4, 32(%rsi)
.L1585:
	testq	%rbx, %rbx
	je	.L1720
	movl	32(%rbx), %eax
	testl	%eax, %eax
	je	.L1721
.L1588:
	subl	$1, %eax
	cmpl	$1, %eax
	ja	.L1722
.L1587:
	movq	48(%rsi), %rdi
	testq	%rdi, %rdi
	je	.L1597
	movq	56(%rsi), %rax
	movdqu	64(%rsi), %xmm6
	movq	%rdi, 80(%rsi)
	movq	$0, 48(%rsi)
	movq	%rax, 16(%rsi)
	movups	%xmm6, 32(%rsi)
.L1598:
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movq	%rbx, 64(%rsp)
	movq	24(%rbp), %r14
	movq	%r13, 48(%rsp)
	movq	%rax, %r15
	movups	%xmm0, (%rax)
	movl	24(%rdi), %eax
.L1599:
	cmpl	$5, %eax
	je	.L1607
	.p2align 4,,10
	.p2align 3
.L1609:
	movq	%r12, %r8
	movq	%r14, %rdx
	movq	%rsi, %rcx
	call	parse_expression
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L1723
.L1600:
	movq	%rbx, %rdx
	movq	%r15, %rcx
	call	list_append
	movq	48(%rsi), %rdi
	testq	%rdi, %rdi
	je	.L1601
	movq	56(%rsi), %rax
	movdqu	64(%rsi), %xmm1
	movq	%rdi, 80(%rsi)
	movq	$0, 48(%rsi)
	movq	%rax, 16(%rsi)
	movups	%xmm1, 32(%rsi)
.L1602:
	cmpl	$5, 24(%rdi)
	je	.L1724
.L1603:
	movq	%rdi, %r13
	movq	__imp___acrt_iob_func(%rip), %rbx
	movq	56(%rsp), %rdi
	movl	$2, %ecx
	movq	16(%r13), %rax
	movq	8(%r13), %rsi
	leaq	1(%rax), %r14
	movq	(%r12), %rax
	addq	$1, %rsi
	movq	24(%rax), %r13
	call	*%rbx
	movq	%r14, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC156(%rip), %rdx
	movq	%rax, %rcx
	movq	%r13, %r8
	call	fprintf
	jmp	.L1608
	.p2align 4,,10
	.p2align 3
.L1724:
	movq	(%rdi), %rax
	cmpq	32+symbolList(%rip), %rax
	je	.L1725
	cmpq	8+symbolList(%rip), %rax
	jne	.L1603
.L1607:
	movq	8+symbolList(%rip), %rax
	cmpq	%rax, (%rdi)
	jne	.L1609
	movq	48(%rsp), %r13
	movq	%r15, 32(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	64(%rsp), %rbx
	movl	$1, %ecx
	movq	%r13, %rdx
	call	create_variable_access
	movq	(%rbx), %rbx
	movq	%rax, %r13
	movl	32(%rbx), %ecx
	testl	%ecx, %ecx
	jne	.L1645
	movq	24(%rbx), %rax
	xorl	%edi, %edi
	movq	16(%rax), %r15
	jmp	.L1610
	.p2align 4,,10
	.p2align 3
.L1601:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	next_token
	movq	%rax, 80(%rsi)
	movq	%rax, %rdi
	jmp	.L1602
	.p2align 4,,10
	.p2align 3
.L1723:
	movq	16(%rdi), %rax
	movq	8(%rdi), %rdi
	movl	$2, %ecx
	leaq	1(%rax), %r13
	movq	(%r12), %rax
	addq	$1, %rdi
	movq	24(%rax), %r8
	movq	%r8, 72(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%r13, 32(%rsp)
	movq	%rdi, %r9
	movq	72(%rsp), %r8
	movq	%rax, %rcx
	leaq	.LC155(%rip), %rdx
	call	fprintf
	jmp	.L1600
.L1638:
	xorl	%r11d, %r11d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$3, %ecx
	jmp	.L1553
.L1705:
	movq	(%rdi), %rcx
	jmp	.L1560
.L1725:
	movq	48(%rsi), %rdi
	testq	%rdi, %rdi
	je	.L1605
	movq	56(%rsi), %rax
	movdqu	64(%rsi), %xmm4
	movq	%rdi, 80(%rsi)
	movq	$0, 48(%rsi)
	movq	%rax, 16(%rsi)
	movl	24(%rdi), %eax
	movups	%xmm4, 32(%rsi)
	jmp	.L1599
.L1706:
	xorl	%r11d, %r11d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$4, %ecx
	jmp	.L1553
.L1616:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	next_token
	movq	%rax, 80(%rsi)
	jmp	.L1617
.L1708:
	movl	$1, %edx
	movq	%rsi, %rcx
	movq	%r11, 72(%rsp)
	movq	16(%rsi), %r13
	movdqu	32(%rsi), %xmm6
	call	next_token
	movdqu	16(%rsi), %xmm0
	movdqu	32(%rsi), %xmm4
	movq	%r13, 16(%rsi)
	movq	40(%rsi), %rdx
	movq	72(%rsp), %r11
	movq	%rax, 80(%rsi)
	punpcklqdq	%xmm4, %xmm0
	movq	%rax, 48(%rsi)
	movq	%rdx, 72(%rsi)
	movups	%xmm0, 56(%rsi)
	movups	%xmm6, 32(%rsi)
	jmp	.L1579
.L1719:
	movq	16(%r9), %rax
	movq	8(%r9), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rdx
	movq	(%r12), %rax
	addq	$1, %r9
	movq	%rdx, 48(%rsp)
	movq	24(%rax), %r8
	movq	%r9, 64(%rsp)
	movq	%r8, 72(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	48(%rsp), %rdx
	movq	64(%rsp), %r9
	movq	72(%rsp), %r8
	movq	%rax, %rcx
	movq	%rdx, 32(%rsp)
	leaq	.LC157(%rip), %rdx
	call	fprintf
	jmp	.L1615
.L1716:
	movq	48(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L1562
	movq	56(%rcx), %rax
	movdqu	64(%rcx), %xmm5
	movq	%rbx, 80(%rcx)
	movq	$0, 48(%rcx)
	movq	%rax, 16(%rcx)
	movups	%xmm5, 32(%rcx)
.L1563:
	movq	24(%rbp), %rdx
	movq	%r12, %r8
	movq	%rsi, %rcx
	call	parse_expression
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L1726
	movq	48(%rsi), %rax
	testq	%rax, %rax
	je	.L1566
	movq	56(%rsi), %rdx
	movdqu	64(%rsi), %xmm6
	movq	%rax, 80(%rsi)
	movq	$0, 48(%rsi)
	movq	%rdx, 16(%rsi)
	movups	%xmm6, 32(%rsi)
.L1567:
	movl	24(%rax), %ecx
	cmpl	$5, %ecx
	jne	.L1568
	movq	8+symbolList(%rip), %rdx
	cmpq	%rdx, (%rax)
	jne	.L1568
	xorl	%r11d, %r11d
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	jmp	.L1553
.L1717:
	movq	48(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L1571
	movq	56(%rcx), %rax
	movdqu	64(%rcx), %xmm5
	movq	%rbx, 80(%rcx)
	movq	$0, 48(%rcx)
	movq	%rax, 16(%rcx)
	movups	%xmm5, 32(%rcx)
.L1572:
	movq	24(%rbp), %rdx
	movq	%r12, %r8
	movq	%rsi, %rcx
	call	parse_primary
	movq	%rax, %r9
	testq	%rax, %rax
	je	.L1727
	xorl	%r11d, %r11d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$6, %ecx
	jmp	.L1553
.L1584:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	next_token
	movq	%rax, 80(%rsi)
	movq	%rax, %rdi
	jmp	.L1585
.L1597:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	next_token
	movq	%rax, 80(%rsi)
	movq	%rax, %rdi
	jmp	.L1598
.L1722:
	movq	16(%rdi), %rax
	movq	8(%rdi), %r14
	movl	$2, %ecx
	leaq	1(%rax), %r15
	movq	(%r12), %rax
	addq	$1, %r14
	movq	24(%rax), %rdi
	call	*__imp___acrt_iob_func(%rip)
	movq	%r15, 32(%rsp)
	movq	%r14, %r9
	leaq	.LC154(%rip), %rdx
	movq	%rax, %rcx
	movq	%rdi, %r8
	call	fprintf
	jmp	.L1587
.L1721:
	movq	8(%rbx), %r11
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %r15
	movq	%r11, %rcx
	movq	%r11, 72(%rsp)
	call	strlen
	movq	%r15, %rcx
	movq	%rax, %r14
	call	strlen
	movl	$1, %r8d
	leaq	.LC38(%rip), %rcx
	leaq	2(%r14,%rax), %rdx
	call	create_string_check
	movq	72(%rsp), %r8
	leaq	.LC128(%rip), %rdx
	movq	%r15, %r9
	movq	%rax, %rcx
	movq	%rax, %r14
	call	sprintf
	movq	24(%rbx), %rax
	movq	16(%rax), %rdx
	testq	%rdx, %rdx
	je	.L1589
	movq	%rsi, 16(%rbp)
	movq	%rdx, %rbx
.L1593:
	movq	8(%rbx), %rax
	movq	(%rax), %r15
	testq	%r15, %r15
	jne	.L1592
	jmp	.L1590
	.p2align 4,,10
	.p2align 3
.L1728:
	movq	(%r15), %r15
	testq	%r15, %r15
	je	.L1590
.L1592:
	movq	8(%r15), %rsi
	movq	%r14, %rdx
	movq	8(%rsi), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L1728
	movq	%rsi, %rbx
	movq	16(%rbp), %rsi
	movq	%r13, %rdx
	xorl	%r9d, %r9d
	movq	$0, 32(%rsp)
	movq	%rbx, %r8
	movl	$2, %ecx
	call	create_variable_access
	movq	%rax, %r13
	movl	32(%rbx), %eax
	jmp	.L1588
.L1590:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1593
	xorl	%r9d, %r9d
	movq	16(%rbp), %rsi
	movq	%r13, %rdx
	xorl	%r8d, %r8d
	movq	%r9, 32(%rsp)
	movl	$2, %ecx
	xorl	%r9d, %r9d
	call	create_variable_access
	movq	%rax, %r13
	jmp	.L1587
	.p2align 4,,10
	.p2align 3
.L1711:
	movq	16(%r10), %rax
	movq	8(%r10), %r13
	movl	$2, %ecx
	movq	56(%rsp), %rdi
	movq	__imp___acrt_iob_func(%rip), %rbx
	leaq	1(%rax), %rsi
	movq	(%r12), %rax
	addq	$1, %r13
	movq	24(%rax), %r14
	call	*%rbx
	movq	%rsi, 32(%rsp)
	movq	%r13, %r9
	leaq	.LC159(%rip), %rdx
	movq	%rax, %rcx
	movq	%r14, %r8
	call	fprintf
	jmp	.L1608
.L1605:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	next_token
	movq	%rax, 80(%rsi)
	movq	%rax, %rdi
	movl	24(%rax), %eax
	jmp	.L1599
.L1624:
	movq	16(%r10), %rax
	movq	8(%r10), %r13
	movl	$2, %ecx
	movq	56(%rsp), %rdi
	movq	__imp___acrt_iob_func(%rip), %rbx
	leaq	1(%rax), %rsi
	movq	(%r12), %rax
	addq	$1, %r13
	movq	24(%rax), %r14
	call	*%rbx
	movq	%rsi, 32(%rsp)
	movq	%r13, %r9
	leaq	.LC160(%rip), %rdx
	movq	%rax, %rcx
	movq	%r14, %r8
	call	fprintf
	jmp	.L1608
.L1720:
	movq	16(%rdi), %rax
	movq	8(%rdi), %r14
	movl	$2, %ecx
	leaq	1(%rax), %r15
	movq	(%r12), %rax
	addq	$1, %r14
	movq	24(%rax), %rdi
	call	*__imp___acrt_iob_func(%rip)
	movq	%r15, 32(%rsp)
	movq	%r14, %r9
	leaq	.LC153(%rip), %rdx
	movq	%rax, %rcx
	movq	%rdi, %r8
	call	fprintf
	jmp	.L1587
.L1568:
	movq	16(%rax), %rdx
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	(%r12), %rax
	leaq	1(%rdx), %rsi
	addq	$1, %rbx
	movq	24(%rax), %rdi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC150(%rip), %rdx
	movq	%rax, %rcx
	movq	%rdi, %r8
	call	fprintf
	xorl	%eax, %eax
	jmp	.L1551
.L1566:
	movl	$1, %edx
	movq	%rsi, %rcx
	movq	%r8, 72(%rsp)
	call	next_token
	movq	72(%rsp), %r8
	movq	%rax, 80(%rsi)
	jmp	.L1567
.L1562:
	movl	$1, %edx
	call	next_token
	movq	%rax, 80(%rsi)
	movq	%rax, %rbx
	jmp	.L1563
.L1571:
	movl	$1, %edx
	call	next_token
	movq	%rax, 80(%rsi)
	movq	%rax, %rbx
	jmp	.L1572
.L1645:
	xorl	%r15d, %r15d
	xorl	%edi, %edi
	jmp	.L1610
.L1573:
	movl	$1, %edx
	call	next_token
	movq	%rax, 80(%rsi)
	movq	%rax, %rbx
	jmp	.L1574
.L1618:
	movq	16(%rax), %rdx
	movq	8(%rax), %r13
	movl	$2, %ecx
	movq	(%r12), %rax
	movq	56(%rsp), %rdi
	leaq	1(%rdx), %rsi
	movq	__imp___acrt_iob_func(%rip), %rbx
	addq	$1, %r13
	movq	24(%rax), %r14
	call	*%rbx
	movq	%rsi, 32(%rsp)
	movq	%r13, %r9
	leaq	.LC158(%rip), %rdx
	movq	%rax, %rcx
	movq	%r14, %r8
	call	fprintf
	jmp	.L1608
.L1726:
	movq	16(%rbx), %rax
	movq	8(%rbx), %rbx
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	(%r12), %rax
	addq	$1, %rbx
	movq	24(%rax), %rdi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC149(%rip), %rdx
	movq	%rax, %rcx
	movq	%rdi, %r8
	call	fprintf
	xorl	%eax, %eax
	jmp	.L1551
.L1589:
	xorl	%r8d, %r8d
	movq	%r13, %rdx
	xorl	%r9d, %r9d
	movl	$2, %ecx
	movq	%r8, 32(%rsp)
	xorl	%r8d, %r8d
	xorl	%ebx, %ebx
	call	create_variable_access
	movq	%rax, %r13
	jmp	.L1587
.L1727:
	movq	16(%rbx), %rax
	movq	8(%rbx), %rbx
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	(%r12), %rax
	addq	$1, %rbx
	movq	24(%rax), %rdi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC151(%rip), %rdx
	movq	%rax, %rcx
	movq	%rdi, %r8
	call	fprintf
	xorl	%eax, %eax
	jmp	.L1551
.L1718:
	movq	16(%rbx), %rax
	movq	8(%rbx), %rbx
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	(%r12), %rax
	addq	$1, %rbx
	movq	24(%rax), %rdi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC152(%rip), %rdx
	movq	%rax, %rcx
	movq	%rdi, %r8
	call	fprintf
	xorl	%eax, %eax
	jmp	.L1551
.L1715:
	movq	__imp___acrt_iob_func(%rip), %rbx
	jmp	.L1608
	.section .rdata,"dr"
	.align 8
.LC164:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse right operand\12\0"
	.text
	.p2align 4
	.def	parse_expr_prec;	.scl	3;	.type	32;	.endef
parse_expr_prec:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	movq	%rcx, %r15
	pushq	%r14
	movq	%r9, %r14
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$64, %rsp
	movq	48(%rcx), %rax
	movups	%xmm6, 64(%rsp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	testq	%rax, %rax
	je	.L1754
.L1730:
	cmpl	$5, 24(%rax)
	jne	.L1747
	leaq	CSWTCH.116(%rip), %r13
.L1744:
	movq	(%rax), %rcx
	xorl	%edi, %edi
	call	string_to_operator
	movl	%eax, %ebx
	cmpl	$18, %eax
	ja	.L1732
	movl	%eax, %eax
	movl	0(%r13,%rax,4), %edi
.L1732:
	cmpl	$19, %ebx
	je	.L1747
	cmpl	%edi, 32(%rbp)
	jg	.L1747
	movq	48(%r15), %rax
	testq	%rax, %rax
	je	.L1733
	movq	%rax, 80(%r15)
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm2
	movq	$0, 48(%r15)
	movq	%rax, 16(%r15)
	movups	%xmm2, 32(%r15)
.L1734:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 80(%r15)
	movq	%rax, %rsi
.L1735:
	movq	48(%rbp), %r8
	movq	%r14, %rdx
	movq	%r15, %rcx
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L1755
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %rsi
	movq	48(%r15), %rax
	testq	%rax, %rax
	je	.L1756
	.p2align 4,,10
	.p2align 3
.L1738:
	cmpl	$5, 24(%rax)
	jne	.L1739
	movq	(%rax), %rcx
	call	string_to_operator
	cmpl	$18, %eax
	jbe	.L1757
.L1739:
	movq	24(%rbp), %rdx
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movl	%ebx, %ecx
	call	create_expression
	movq	%rax, 24(%rbp)
	movq	48(%r15), %rax
	testq	%rax, %rax
	je	.L1758
.L1743:
	cmpl	$5, 24(%rax)
	je	.L1744
.L1747:
	movq	24(%rbp), %rax
.L1729:
	movups	64(%rsp), %xmm6
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
	.p2align 4,,10
	.p2align 3
.L1757:
	movl	%eax, %eax
	movl	0(%r13,%rax,4), %r8d
	cmpl	%r8d, %edi
	jge	.L1739
	movq	48(%rbp), %rax
	movq	%rsi, %rdx
	movq	%r14, %r9
	movq	%r15, %rcx
	movq	%rax, 32(%rsp)
	call	parse_expr_prec
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L1737
	movq	48(%r15), %rax
	testq	%rax, %rax
	jne	.L1738
	movl	$1, %edx
	movq	%r15, %rcx
	movq	16(%r15), %r12
	movdqu	32(%r15), %xmm6
	call	next_token
	movdqu	16(%r15), %xmm0
	movdqu	32(%r15), %xmm1
	movq	40(%r15), %rdx
	movq	%rax, 80(%r15)
	punpcklqdq	%xmm1, %xmm0
	movq	%r12, 16(%r15)
	movq	%rdx, 72(%r15)
	movq	%rax, 48(%r15)
	movups	%xmm0, 56(%r15)
	movups	%xmm6, 32(%r15)
	jmp	.L1738
	.p2align 4,,10
	.p2align 3
.L1733:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	movq	48(%r15), %rsi
	movq	%rax, 80(%r15)
	testq	%rsi, %rsi
	je	.L1734
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm3
	movq	%rsi, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rax, 16(%r15)
	movups	%xmm3, 32(%r15)
	jmp	.L1735
	.p2align 4,,10
	.p2align 3
.L1756:
	movq	16(%r15), %r8
	movl	$1, %edx
	movq	%r15, %rcx
	movdqu	32(%r15), %xmm6
	movq	%r8, 56(%rsp)
	call	next_token
	movdqu	16(%r15), %xmm0
	movdqu	32(%r15), %xmm4
	movq	40(%r15), %rdx
	movq	56(%rsp), %r8
	movq	%rax, 80(%r15)
	punpcklqdq	%xmm4, %xmm0
	movq	%rax, 48(%r15)
	movq	%rdx, 72(%r15)
	movq	%r8, 16(%r15)
	movups	%xmm0, 56(%r15)
	movups	%xmm6, 32(%r15)
	jmp	.L1738
	.p2align 4,,10
	.p2align 3
.L1758:
	movl	$1, %edx
	movq	%r15, %rcx
	movq	16(%r15), %rbx
	movdqu	32(%r15), %xmm6
	call	next_token
	movdqu	16(%r15), %xmm0
	movdqu	32(%r15), %xmm5
	movq	40(%r15), %rdx
	movq	%rax, 80(%r15)
	punpcklqdq	%xmm5, %xmm0
	movq	%rbx, 16(%r15)
	movq	%rdx, 72(%r15)
	movq	%rax, 48(%r15)
	movups	%xmm0, 56(%r15)
	movups	%xmm6, 32(%r15)
	jmp	.L1743
	.p2align 4,,10
	.p2align 3
.L1754:
	movl	$1, %edx
	movq	16(%rcx), %rbx
	movdqu	32(%rcx), %xmm6
	call	next_token
	movdqu	16(%r15), %xmm0
	movdqu	32(%r15), %xmm5
	movq	40(%r15), %rdx
	movq	%rax, 80(%r15)
	punpcklqdq	%xmm5, %xmm0
	movq	%rbx, 16(%r15)
	movq	%rdx, 72(%r15)
	movq	%rax, 48(%r15)
	movups	%xmm0, 56(%r15)
	movups	%xmm6, 32(%r15)
	jmp	.L1730
	.p2align 4,,10
	.p2align 3
.L1755:
	movq	16(%rsi), %rax
	movq	8(%rsi), %rbx
	movl	$2, %ecx
	leaq	1(%rax), %rdi
	movq	48(%rbp), %rax
	addq	$1, %rbx
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC164(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
.L1737:
	xorl	%eax, %eax
	jmp	.L1729
	.section .rdata,"dr"
	.align 8
.LC165:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse expression primary\12\0"
	.text
	.p2align 4
	.def	parse_expression;	.scl	3;	.type	32;	.endef
parse_expression:
	pushq	%rbp
	movq	%r8, %rbp
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	subq	$56, %rsp
	call	parse_primary
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L1763
	xorl	%r9d, %r9d
	movq	%rax, %r8
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rbp, 32(%rsp)
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movq	%rdi, %rcx
	call	parse_expr_prec
	movq	%rax, %rbx
.L1759:
	addq	$56, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L1763:
	movq	80(%rdi), %rax
	movl	$2, %ecx
	movq	16(%rax), %rdi
	movq	8(%rax), %rsi
	movq	0(%rbp), %rax
	addq	$1, %rdi
	addq	$1, %rsi
	movq	24(%rax), %rbp
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC165(%rip), %rdx
	movq	%rax, %rcx
	movq	%rbp, %r8
	call	fprintf
	jmp	.L1759
	.section .rdata,"dr"
	.align 8
.LC166:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected variable type\12\0"
	.align 8
.LC167:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected a type for variable declaration\12\0"
	.align 8
.LC168:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown variable type\12\0"
	.align 8
.LC169:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected variable name\12\0"
	.align 8
.LC170:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse variable initializer\12\0"
	.align 8
.LC171:
	.ascii "Error creating variable: type or name is NULL\12\0"
	.text
	.p2align 4
	.def	parse_variable;	.scl	3;	.type	32;	.endef
parse_variable:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	movq	%r8, %r13
	pushq	%r12
	movq	%rdx, %r12
	pushq	%rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$64, %rsp
	movq	80(%rcx), %r8
	movups	%xmm6, 64(%rsp)
	movl	24(%r8), %eax
	cmpl	$1, %eax
	je	.L1765
	cmpl	$6, %eax
	jne	.L1766
	movq	(%r8), %rax
	movq	128+keywordList(%rip), %rcx
	cmpq	%rcx, %rax
	je	.L1767
	movq	136+keywordList(%rip), %rcx
	cmpq	%rcx, %rax
	je	.L1767
	movq	144+keywordList(%rip), %rcx
	cmpq	%rcx, %rax
	je	.L1767
	movq	152+keywordList(%rip), %rcx
	cmpq	%rcx, %rax
	je	.L1767
	movq	160+keywordList(%rip), %rcx
	cmpq	%rcx, %rax
	je	.L1767
.L1766:
	movq	16(%r8), %rax
	movq	8(%r8), %rbx
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	0(%r13), %rax
	addq	$1, %rbx
	movq	24(%rax), %rdi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC166(%rip), %rdx
	movq	%rax, %rcx
	movq	%rdi, %r8
	call	fprintf
	xorl	%eax, %eax
	jmp	.L1764
	.p2align 4,,10
	.p2align 3
.L1765:
	movq	(%r8), %rcx
.L1767:
	testq	%r12, %r12
	je	.L1769
	movq	%r12, %rdx
.L1773:
	movq	8(%rdx), %rax
	jmp	.L1811
	.p2align 4,,10
	.p2align 3
.L1812:
	movq	8(%rax), %rbx
	cmpq	%rcx, 8(%rbx)
	je	.L1771
.L1811:
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L1812
	movq	(%rdx), %rdx
	testq	%rdx, %rdx
	jne	.L1773
.L1769:
	movq	16(%r8), %rax
	movq	8(%r8), %rbx
	movl	$2, %ecx
	leaq	1(%rax), %rdi
	movq	0(%r13), %rax
	addq	$1, %rbx
	movq	24(%rax), %r14
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC168(%rip), %rdx
	movq	%r14, %r8
	movq	%rax, %rcx
	movl	$1, %r14d
	xorl	%ebx, %ebx
	call	fprintf
	movq	48(%rsi), %rdi
	testq	%rdi, %rdi
	jne	.L1813
.L1775:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	next_token
	movq	%rax, 80(%rsi)
	movq	%rax, %rdi
	jmp	.L1776
	.p2align 4,,10
	.p2align 3
.L1771:
	movl	32(%rbx), %eax
	cmpl	$6, %eax
	je	.L1790
	testl	%eax, %eax
	je	.L1790
	movq	16(%r8), %rax
	movq	8(%r8), %rdi
	movl	$2, %ecx
	leaq	1(%rax), %r15
	movq	0(%r13), %rax
	addq	$1, %rdi
	movq	24(%rax), %r14
	call	*__imp___acrt_iob_func(%rip)
	movq	%r15, 32(%rsp)
	movq	%rdi, %r9
	leaq	.LC167(%rip), %rdx
	movq	%rax, %rcx
	movq	%r14, %r8
	call	fprintf
.L1790:
	movq	48(%rsi), %rdi
	xorl	%r14d, %r14d
	testq	%rdi, %rdi
	je	.L1775
.L1813:
	movq	56(%rsi), %rax
	movdqu	64(%rsi), %xmm1
	movq	%rdi, 80(%rsi)
	movq	$0, 48(%rsi)
	movq	%rax, 16(%rsi)
	movups	%xmm1, 32(%rsi)
.L1776:
	cmpl	$1, 24(%rdi)
	je	.L1777
	movq	16(%rdi), %rax
	movl	$2, %ecx
	leaq	1(%rax), %r15
	movq	8(%rdi), %rax
	leaq	1(%rax), %r9
	movq	0(%r13), %rax
	movq	%r9, 48(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%r15, 32(%rsp)
	movq	48(%rsp), %r9
	leaq	.LC169(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
.L1777:
	cmpb	$0, 10(%r13)
	movl	$3, %edx
	je	.L1778
	cmpb	$1, 9(%r13)
	sbbl	%edx, %edx
	andl	$2, %edx
	addl	$3, %edx
.L1778:
	movq	(%rdi), %rcx
	movq	%r12, %r9
	movq	%rbx, %r8
	call	create_symbol
	movq	%rax, %rdi
	movq	48(%rsi), %rax
	testq	%rax, %rax
	je	.L1814
.L1779:
	xorl	%r15d, %r15d
	cmpl	$5, 24(%rax)
	je	.L1815
.L1780:
	testq	%rdi, %rdi
	je	.L1795
	testb	%r14b, %r14b
	jne	.L1795
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rdi, 8(%rax)
	movq	%r15, 16(%rax)
.L1764:
	movups	64(%rsp), %xmm6
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
	.p2align 4,,10
	.p2align 3
.L1815:
	movq	144+symbolList(%rip), %rdx
	cmpq	%rdx, (%rax)
	jne	.L1780
	movq	48(%rsi), %rax
	testq	%rax, %rax
	je	.L1781
	movq	%rax, 80(%rsi)
	movq	56(%rsi), %rax
	movdqu	64(%rsi), %xmm3
	movq	$0, 48(%rsi)
	movq	%rax, 16(%rsi)
	movups	%xmm3, 32(%rsi)
.L1782:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	next_token
	movq	%rax, 80(%rsi)
	movq	%rax, %r9
.L1783:
	movq	%r13, %r8
	movq	%r12, %rdx
	movq	%rsi, %rcx
	movq	%r9, 56(%rsp)
	call	parse_expression
	movq	56(%rsp), %r9
	testq	%rax, %rax
	movq	%rax, %r15
	jne	.L1780
	movq	16(%r9), %rax
	movq	8(%r9), %rsi
	movl	$2, %ecx
	leaq	1(%rax), %r12
	movq	0(%r13), %rax
	addq	$1, %rsi
	movq	24(%rax), %r13
	call	*__imp___acrt_iob_func(%rip)
	movq	%r12, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC170(%rip), %rdx
	movq	%rax, %rcx
	movq	%r13, %r8
	call	fprintf
	jmp	.L1780
	.p2align 4,,10
	.p2align 3
.L1814:
	movl	$1, %edx
	movq	%rsi, %rcx
	movq	16(%rsi), %r15
	movdqu	32(%rsi), %xmm6
	call	next_token
	movdqu	16(%rsi), %xmm0
	movdqu	32(%rsi), %xmm2
	movq	40(%rsi), %rdx
	movq	%rax, 80(%rsi)
	punpcklqdq	%xmm2, %xmm0
	movq	%r15, 16(%rsi)
	movq	%rdx, 72(%rsi)
	movq	%rax, 48(%rsi)
	movups	%xmm0, 56(%rsi)
	movups	%xmm6, 32(%rsi)
	jmp	.L1779
	.p2align 4,,10
	.p2align 3
.L1795:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$46, %r8d
	movl	$1, %edx
	leaq	.LC171(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L1764
.L1781:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	next_token
	movq	48(%rsi), %r9
	movq	%rax, 80(%rsi)
	testq	%r9, %r9
	je	.L1782
	movq	56(%rsi), %rax
	movdqu	64(%rsi), %xmm4
	movq	%r9, 80(%rsi)
	movq	$0, 48(%rsi)
	movq	%rax, 16(%rsi)
	movups	%xmm4, 32(%rsi)
	jmp	.L1783
	.section .rdata,"dr"
	.align 8
.LC172:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'if'\12\0"
	.align 8
.LC173:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse if condition\12\0"
	.align 8
.LC174:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after if condition\12\0"
	.align 8
.LC175:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start if body\12\0"
	.align 8
.LC176:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse if body statement\12\0"
	.align 8
.LC177:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'elif'\12\0"
	.align 8
.LC178:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse else-if condition\12\0"
	.align 8
.LC179:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after else-if condition\12\0"
	.align 8
.LC180:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start else-if body\12\0"
	.align 8
.LC181:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse else-if body statement\12\0"
	.align 8
.LC182:
	.ascii "Error creating else-if statement: condition is NULL\12\0"
	.align 8
.LC183:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start else body\12\0"
	.align 8
.LC184:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse else body statement\12\0"
	.align 8
.LC185:
	.ascii "Error creating if statement: condition is NULL\12\0"
	.align 8
.LC186:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'for'\12\0"
	.align 8
.LC187:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop initializer\12\0"
	.align 8
.LC188:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop initializer\12\0"
	.align 8
.LC189:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop condition\12\0"
	.align 8
.LC190:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop condition\12\0"
	.align 8
.LC191:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop increment\12\0"
	.align 8
.LC192:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after for loop increment\12\0"
	.align 8
.LC193:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start for loop body\12\0"
	.align 8
.LC194:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop body statement\12\0"
	.align 8
.LC195:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'while'\12\0"
	.align 8
.LC196:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse while condition\12\0"
	.align 8
.LC197:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after while condition\12\0"
	.align 8
.LC198:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start while body\12\0"
	.align 8
.LC199:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse while body statement\12\0"
	.align 8
.LC200:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot use 'break' outside of a loop\12\0"
	.align 8
.LC201:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot use 'continue' outside of a loop\12\0"
	.align 8
.LC202:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse statement\12\0"
	.align 8
.LC203:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after statement\12\0"
	.text
	.p2align 4
	.def	parse_statement;	.scl	3;	.type	32;	.endef
parse_statement:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	movq	%rdx, %r14
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	movq	%r8, %rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$96, %rsp
	movq	80(%rcx), %rdx
	movups	%xmm6, 96(%rsp)
	cmpl	$6, 24(%rdx)
	jne	.L1817
	movq	(%rdx), %rax
	cmpq	48+keywordList(%rip), %rax
	je	.L1990
	cmpq	80+keywordList(%rip), %rax
	je	.L1991
	cmpq	72+keywordList(%rip), %rax
	je	.L1992
	cmpq	168+keywordList(%rip), %rax
	je	.L1993
	cmpq	104+keywordList(%rip), %rax
	je	.L1994
	cmpq	112+keywordList(%rip), %rax
	je	.L1995
	cmpq	120+keywordList(%rip), %rax
	jne	.L1817
	cmpb	$0, 11(%r8)
	je	.L1996
	movl	$16, %ecx
	call	alloc_memory
	movl	$7, 8(%rax)
	movq	%rax, %rdi
	movq	$0, (%rax)
	jmp	.L1964
	.p2align 4,,10
	.p2align 3
.L1817:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	$0, 40(%rsp)
	xorl	%ecx, %ecx
	movq	%rax, 32(%rsp)
	call	create_statement
	movq	%rax, %rdi
.L1959:
	testq	%rdi, %rdi
	je	.L1997
.L1964:
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L1971
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm1
	movq	%rax, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rdx, 16(%rbx)
	movups	%xmm1, 32(%rbx)
.L1972:
	cmpl	$5, 24(%rax)
	jne	.L1973
	movq	72+symbolList(%rip), %rcx
	cmpq	%rcx, (%rax)
	je	.L1816
.L1973:
	movq	16(%rax), %rcx
	movq	8(%rax), %rbx
	movq	(%rsi), %rax
	leaq	1(%rcx), %r12
	movl	$2, %ecx
	addq	$1, %rbx
	movq	24(%rax), %rsi
	call	*__imp___acrt_iob_func(%rip)
	movq	%r12, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC203(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
.L1816:
	movups	96(%rsp), %xmm6
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
.L1971:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L1972
	.p2align 4,,10
	.p2align 3
.L1995:
	cmpb	$0, 11(%r8)
	je	.L1998
	movl	$16, %ecx
	call	alloc_memory
	movl	$6, 8(%rax)
	movq	%rax, %rdi
	movq	$0, (%rax)
	jmp	.L1964
	.p2align 4,,10
	.p2align 3
.L1990:
	movq	48(%rcx), %rax
	testq	%rax, %rax
	je	.L1819
	movq	56(%rcx), %rdx
	movdqu	64(%rcx), %xmm6
	movq	%rax, 80(%rcx)
	movq	$0, 48(%rcx)
	movq	%rdx, 16(%rcx)
	movups	%xmm6, 32(%rcx)
.L1820:
	cmpl	$5, 24(%rax)
	jne	.L1821
	movq	symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1821
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L1824
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm5
	movq	%rdi, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm5, 32(%rbx)
.L1825:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, 56(%rsp)
	testq	%rax, %rax
	je	.L1999
.L1826:
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L1827
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm4
	movq	%rax, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rdx, 16(%rbx)
	movups	%xmm4, 32(%rbx)
.L1828:
	cmpl	$5, 24(%rax)
	jne	.L1829
	movq	8+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1829
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L1832
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm6
	movq	%rax, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rdx, 16(%rbx)
	movups	%xmm6, 32(%rbx)
.L1833:
	cmpl	$5, 24(%rax)
	jne	.L1834
	movq	16+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1834
	movl	$16, %ecx
	call	alloc_memory
	movq	48(%rbx), %r15
	pxor	%xmm0, %xmm0
	movq	%rax, %r13
	movups	%xmm0, (%rax)
	testq	%r15, %r15
	je	.L1840
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm3
	movq	%r15, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm3, 32(%rbx)
	.p2align 4,,10
	.p2align 3
.L1837:
	cmpl	$5, 24(%r15)
	jne	.L1842
.L2002:
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, (%r15)
	je	.L2000
.L1842:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L2001
.L1839:
	movq	%rdi, %rdx
	movq	%r13, %rcx
	call	list_append
	movq	48(%rbx), %r15
	testq	%r15, %r15
	je	.L1840
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm4
	movq	%r15, 80(%rbx)
	cmpl	$5, 24(%r15)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm4, 32(%rbx)
	je	.L2002
	jmp	.L1842
	.p2align 4,,10
	.p2align 3
.L1997:
	movq	80(%rbx), %rax
	movq	16(%rax), %rcx
	movq	8(%rax), %r12
	movq	(%rsi), %rax
	leaq	1(%rcx), %r13
	movl	$2, %ecx
	addq	$1, %r12
	movq	24(%rax), %r14
	call	*__imp___acrt_iob_func(%rip)
	movq	%r13, 32(%rsp)
	movq	%r12, %r9
	leaq	.LC202(%rip), %rdx
	movq	%rax, %rcx
	movq	%r14, %r8
	call	fprintf
	jmp	.L1964
	.p2align 4,,10
	.p2align 3
.L1993:
	movq	48(%rcx), %rax
	testq	%rax, %rax
	je	.L1957
	movq	%rax, 80(%rcx)
	movq	56(%rcx), %rax
	movdqu	64(%rcx), %xmm3
	movq	$0, 48(%rcx)
	movq	%rax, 16(%rcx)
	movups	%xmm3, 32(%rcx)
.L1958:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_variable
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, 40(%rsp)
	movl	$1, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rdi
	jmp	.L1959
	.p2align 4,,10
	.p2align 3
.L1994:
	movq	48(%rcx), %rax
	testq	%rax, %rax
	je	.L1961
	movq	56(%rcx), %rdx
	movdqu	64(%rcx), %xmm5
	movq	%rax, 80(%rcx)
	movq	$0, 48(%rcx)
	movq	%rdx, 16(%rcx)
	movups	%xmm5, 32(%rcx)
.L1962:
	cmpl	$5, 24(%rax)
	jne	.L1963
	movq	72+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	je	.L2003
.L1963:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movl	$16, %ecx
	movq	%rax, %r12
	call	alloc_memory
	movl	$5, 8(%rax)
	movq	%rax, %rdi
	movq	%r12, (%rax)
	jmp	.L1964
	.p2align 4,,10
	.p2align 3
.L1957:
	movl	$1, %edx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L1958
	.p2align 4,,10
	.p2align 3
.L1961:
	movl	$1, %edx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L1962
	.p2align 4,,10
	.p2align 3
.L1819:
	movl	$1, %edx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L1820
	.p2align 4,,10
	.p2align 3
.L1991:
	movq	48(%rcx), %rax
	testq	%rax, %rax
	je	.L1890
	movq	56(%rcx), %rdx
	movdqu	64(%rcx), %xmm5
	movq	%rax, 80(%rcx)
	movq	$0, 48(%rcx)
	movq	%rdx, 16(%rcx)
	movups	%xmm5, 32(%rcx)
.L1891:
	cmpl	$5, 24(%rax)
	jne	.L1892
	movq	symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1892
	movq	48(%rbx), %r12
	testq	%r12, %r12
	je	.L1895
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm6
	movq	%r12, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm6, 32(%rbx)
.L1896:
	cmpl	$5, 24(%r12)
	jne	.L1897
	movq	72+symbolList(%rip), %rax
	cmpq	%rax, (%r12)
	je	.L1975
.L1897:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_variable
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L2004
.L1899:
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L1900
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm4
	movq	%rax, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rdx, 16(%rbx)
	movups	%xmm4, 32(%rbx)
.L1901:
	cmpl	$5, 24(%rax)
	jne	.L1902
	movq	(%rax), %rcx
	cmpq	%rcx, 72+symbolList(%rip)
	je	.L1898
.L1902:
	movq	16(%rax), %rdi
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	(%rsi), %rax
	addq	$1, %rdi
	addq	$1, %rbx
	movq	24(%rax), %rsi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC188(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
.L1894:
	xorl	%r9d, %r9d
.L1903:
	movq	$0, 40(%rsp)
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$4, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rdi
	jmp	.L1816
	.p2align 4,,10
	.p2align 3
.L1992:
	movq	48(%rcx), %rax
	testq	%rax, %rax
	je	.L1932
	movq	56(%rcx), %rdx
	movdqu	64(%rcx), %xmm4
	movq	%rax, 80(%rcx)
	movq	$0, 48(%rcx)
	movq	%rdx, 16(%rcx)
	movups	%xmm4, 32(%rcx)
.L1933:
	cmpl	$5, 24(%rax)
	jne	.L1934
	movq	symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1934
	movq	48(%rbx), %r12
	testq	%r12, %r12
	je	.L1937
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm0
	movq	%r12, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm0, 32(%rbx)
.L1938:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L2005
.L1939:
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L1940
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm5
	movq	%rax, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rdx, 16(%rbx)
	movups	%xmm5, 32(%rbx)
.L1941:
	cmpl	$5, 24(%rax)
	jne	.L1942
	movq	8+symbolList(%rip), %rcx
	cmpq	%rcx, (%rax)
	jne	.L1942
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L1945
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm6
	movq	%rax, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rdx, 16(%rbx)
	movups	%xmm6, 32(%rbx)
.L1946:
	cmpl	$5, 24(%rax)
	jne	.L1947
	movq	16+symbolList(%rip), %rcx
	cmpq	%rcx, (%rax)
	jne	.L1947
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, %r12
	movb	$1, 11(%rsi)
	movq	48(%rbx), %r13
	testq	%r13, %r13
	je	.L1953
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm4
	movq	%r13, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm4, 32(%rbx)
	.p2align 4,,10
	.p2align 3
.L1950:
	cmpl	$5, 24(%r13)
	jne	.L1955
.L2008:
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, 0(%r13)
	je	.L2006
.L1955:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L2007
.L1952:
	movq	%r15, %rdx
	movq	%r12, %rcx
	call	list_append
	movq	48(%rbx), %r13
	testq	%r13, %r13
	je	.L1953
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm0
	movq	%r13, 80(%rbx)
	cmpl	$5, 24(%r13)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm0, 32(%rbx)
	je	.L2008
	jmp	.L1955
	.p2align 4,,10
	.p2align 3
.L1821:
	movq	16(%rax), %rdi
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	(%rsi), %rax
	addq	$1, %rdi
	addq	$1, %rbx
	movq	24(%rax), %rsi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC172(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
.L1823:
	xorl	%edx, %edx
.L1831:
	movq	$0, 40(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rdi
	jmp	.L1816
	.p2align 4,,10
	.p2align 3
.L1892:
	movq	16(%rax), %rdi
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	(%rsi), %rax
	addq	$1, %rdi
	addq	$1, %rbx
	movq	24(%rax), %rsi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC186(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L1894
	.p2align 4,,10
	.p2align 3
.L1934:
	movq	16(%rax), %rdi
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	(%rsi), %rax
	addq	$1, %rdi
	addq	$1, %rbx
	movq	24(%rax), %rsi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC195(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
.L1936:
	xorl	%r8d, %r8d
.L1944:
	movq	$0, 40(%rsp)
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$3, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rdi
	jmp	.L1816
	.p2align 4,,10
	.p2align 3
.L1840:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %r15
	jmp	.L1837
	.p2align 4,,10
	.p2align 3
.L1953:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %r13
	jmp	.L1950
	.p2align 4,,10
	.p2align 3
.L1996:
	movq	16(%rdx), %rax
	movq	8(%rdx), %rbx
	movl	$2, %ecx
	leaq	1(%rax), %rdi
	movq	(%r8), %rax
	addq	$1, %rbx
	movq	24(%rax), %rsi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	xorl	%edi, %edi
	movq	%rax, %rcx
	movq	%rsi, %r8
	leaq	.LC201(%rip), %rdx
	call	fprintf
	jmp	.L1816
	.p2align 4,,10
	.p2align 3
.L1998:
	movq	16(%rdx), %rax
	movq	8(%rdx), %rbx
	movl	$2, %ecx
	leaq	1(%rax), %rdi
	movq	(%r8), %rax
	addq	$1, %rbx
	movq	24(%rax), %rsi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	xorl	%edi, %edi
	movq	%rax, %rcx
	movq	%rsi, %r8
	leaq	.LC200(%rip), %rdx
	call	fprintf
	jmp	.L1816
	.p2align 4,,10
	.p2align 3
.L1890:
	movl	$1, %edx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L1891
	.p2align 4,,10
	.p2align 3
.L1829:
	movq	16(%rax), %rdi
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	(%rsi), %rax
	addq	$1, %rdi
	addq	$1, %rbx
	movq	24(%rax), %rsi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC174(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L1823
	.p2align 4,,10
	.p2align 3
.L1932:
	movl	$1, %edx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L1933
	.p2align 4,,10
	.p2align 3
.L2001:
	movq	16(%r15), %rax
	movq	8(%r15), %r12
	movl	$2, %ecx
	leaq	1(%rax), %rdx
	movq	(%rsi), %rax
	addq	$1, %r12
	movq	%rdx, 88(%rsp)
	movq	24(%rax), %r15
	call	*__imp___acrt_iob_func(%rip)
	movq	88(%rsp), %rdx
	movq	%r12, %r9
	movq	%rax, %rcx
	movq	%r15, %r8
	movq	%rdx, 32(%rsp)
	leaq	.LC176(%rip), %rdx
	call	fprintf
	jmp	.L1839
.L1942:
	movq	16(%rax), %rdi
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	(%rsi), %rax
	addq	$1, %rdi
	addq	$1, %rbx
	movq	24(%rax), %rsi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC197(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L1936
.L2007:
	movq	16(%r13), %rax
	movl	$2, %ecx
	movq	8(%r13), %r13
	leaq	1(%rax), %rdx
	movq	(%rsi), %rax
	addq	$1, %r13
	movq	%rdx, 80(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 88(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	80(%rsp), %rdx
	movq	88(%rsp), %r8
	movq	%r13, %r9
	movq	%rax, %rcx
	movq	%rdx, 32(%rsp)
	leaq	.LC199(%rip), %rdx
	call	fprintf
	jmp	.L1952
.L1975:
	xorl	%edi, %edi
.L1898:
	movq	48(%rbx), %r13
	testq	%r13, %r13
	je	.L1904
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm5
	movq	%r13, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm5, 32(%rbx)
.L1905:
	cmpl	$5, 24(%r13)
	jne	.L1906
	movq	72+symbolList(%rip), %rax
	cmpq	%rax, 0(%r13)
	je	.L1976
.L1906:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L2009
.L1908:
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L1909
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm3
	movq	%rax, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rdx, 16(%rbx)
	movups	%xmm3, 32(%rbx)
.L1910:
	cmpl	$5, 24(%rax)
	jne	.L1911
	movq	(%rax), %rcx
	cmpq	%rcx, 72+symbolList(%rip)
	je	.L1907
.L1911:
	movq	16(%rax), %rdi
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	(%rsi), %rax
	addq	$1, %rdi
	addq	$1, %rbx
	movq	24(%rax), %rsi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC190(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L1894
.L1824:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %rdi
	jmp	.L1825
.L1827:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L1828
.L1895:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %r12
	jmp	.L1896
.L1834:
	movq	16(%rax), %rdi
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	(%rsi), %rax
	addq	$1, %rdi
	addq	$1, %rbx
	movq	24(%rax), %rsi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC175(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L1823
.L1937:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %r12
	jmp	.L1938
.L1940:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L1941
.L1900:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L1901
.L1947:
	movq	16(%rax), %rdi
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	(%rsi), %rax
	addq	$1, %rdi
	addq	$1, %rbx
	movq	24(%rax), %rsi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC198(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L1936
.L1999:
	movq	16(%rdi), %rax
	movq	8(%rdi), %rdi
	movl	$2, %ecx
	leaq	1(%rax), %r13
	movq	(%rsi), %rax
	addq	$1, %rdi
	movq	24(%rax), %r12
	call	*__imp___acrt_iob_func(%rip)
	movq	%r13, 32(%rsp)
	movq	%rdi, %r9
	leaq	.LC173(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	jmp	.L1826
.L2000:
	movl	$16, %ecx
	pxor	%xmm6, %xmm6
	call	alloc_memory
	movl	$16, %ecx
	movups	%xmm6, (%rax)
	movq	%rax, 64(%rsp)
	call	alloc_memory
	movq	%rax, 48(%rsp)
	movups	%xmm6, (%rax)
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L1989
	.p2align 4,,10
	.p2align 3
.L1870:
	cmpl	$6, 24(%rax)
	jne	.L1871
	movq	(%rax), %rax
	cmpq	56+keywordList(%rip), %rax
	jne	.L2010
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L1845
	movq	%rax, 80(%rbx)
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm3
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm3, 32(%rbx)
.L1846:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
.L1847:
	cmpl	$5, 24(%rax)
	jne	.L1848
	movq	symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1848
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L1850
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm3
	movq	%rdi, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm3, 32(%rbx)
.L1851:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L2011
.L1852:
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L1853
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm6
	movq	%rax, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rdx, 16(%rbx)
	movups	%xmm6, 32(%rbx)
.L1854:
	cmpl	$5, 24(%rax)
	jne	.L1855
	movq	8+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1855
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L1857
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm0
	movq	%rax, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rdx, 16(%rbx)
	movups	%xmm0, 32(%rbx)
.L1858:
	cmpl	$5, 24(%rax)
	jne	.L1859
	movq	16+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1859
	movl	$16, %ecx
	call	alloc_memory
	movq	48(%rbx), %rdi
	pxor	%xmm0, %xmm0
	movq	%rax, %r12
	movups	%xmm0, (%rax)
	testq	%rdi, %rdi
	je	.L1865
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm3
	movq	%rdi, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm3, 32(%rbx)
	.p2align 4,,10
	.p2align 3
.L1862:
	cmpl	$5, 24(%rdi)
	jne	.L1867
.L2014:
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, (%rdi)
	je	.L2012
.L1867:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r10
	testq	%rax, %rax
	je	.L2013
.L1864:
	movq	%r10, %rdx
	movq	%r12, %rcx
	call	list_append
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L1865
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm2
	movq	%rdi, 80(%rbx)
	cmpl	$5, 24(%rdi)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm2, 32(%rbx)
	je	.L2014
	jmp	.L1867
	.p2align 4,,10
	.p2align 3
.L1865:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %rdi
	jmp	.L1862
	.p2align 4,,10
	.p2align 3
.L2013:
	movq	%rax, 72(%rsp)
	movq	16(%rdi), %rax
	movl	$2, %ecx
	movq	8(%rdi), %rdi
	leaq	1(%rax), %rdx
	movq	(%rsi), %rax
	movq	%rdx, 80(%rsp)
	addq	$1, %rdi
	movq	24(%rax), %r8
	movq	%r8, 88(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	80(%rsp), %rdx
	movq	88(%rsp), %r8
	movq	%rdi, %r9
	movq	%rax, %rcx
	movq	%rdx, 32(%rsp)
	leaq	.LC181(%rip), %rdx
	call	fprintf
	movq	72(%rsp), %r10
	jmp	.L1864
	.p2align 4,,10
	.p2align 3
.L2012:
	testq	%r15, %r15
	je	.L2015
	movl	$16, %ecx
	call	alloc_memory
	movq	%r15, (%rax)
	movq	%rax, %rdx
	movq	%r12, 8(%rax)
.L1869:
	movq	64(%rsp), %rcx
	call	list_append
	movq	48(%rbx), %rax
	testq	%rax, %rax
	jne	.L1870
.L1989:
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	16(%rbx), %rdi
	movdqu	32(%rbx), %xmm6
	call	next_token
	movdqu	16(%rbx), %xmm0
	movdqu	32(%rbx), %xmm3
	movq	40(%rbx), %rdx
	movq	%rax, 80(%rbx)
	punpcklqdq	%xmm3, %xmm0
	movq	%rdi, 16(%rbx)
	movq	%rdx, 72(%rbx)
	movq	%rax, 48(%rbx)
	movups	%xmm0, 56(%rbx)
	movups	%xmm6, 32(%rbx)
	jmp	.L1870
.L1845:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L1846
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm6
	movq	%rax, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rdx, 16(%rbx)
	movups	%xmm6, 32(%rbx)
	jmp	.L1847
.L1850:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %rdi
	jmp	.L1851
.L1853:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L1854
.L1857:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L1858
.L2011:
	movq	16(%rdi), %rax
	movq	8(%rdi), %rdi
	movl	$2, %ecx
	leaq	1(%rax), %r12
	movq	(%rsi), %rax
	addq	$1, %rdi
	movq	24(%rax), %r8
	movq	%r8, 88(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%r12, 32(%rsp)
	movq	%rdi, %r9
	movq	88(%rsp), %r8
	movq	%rax, %rcx
	leaq	.LC178(%rip), %rdx
	call	fprintf
	jmp	.L1852
.L1976:
	xorl	%r12d, %r12d
.L1907:
	movq	48(%rbx), %r13
	testq	%r13, %r13
	je	.L1912
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm5
	movq	%r13, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm5, 32(%rbx)
.L1913:
	cmpl	$5, 24(%r13)
	jne	.L1914
	movq	8+symbolList(%rip), %rax
	cmpq	%rax, 0(%r13)
	je	.L1977
.L1914:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, 88(%rsp)
	testq	%rax, %rax
	je	.L2016
.L1916:
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L1917
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm6
	movq	%rax, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rdx, 16(%rbx)
	movups	%xmm6, 32(%rbx)
.L1918:
	cmpl	$5, 24(%rax)
	jne	.L1919
	movq	8+symbolList(%rip), %rcx
	cmpq	%rcx, (%rax)
	je	.L1915
.L1919:
	movq	16(%rax), %rdi
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	(%rsi), %rax
	addq	$1, %rdi
	addq	$1, %rbx
	movq	24(%rax), %rsi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC192(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L1894
.L2006:
	movb	$0, 11(%rsi)
	movl	$16, %ecx
	call	alloc_memory
	movq	%rdi, (%rax)
	movq	%rax, %r8
	movq	%r12, 8(%rax)
	jmp	.L1944
.L2005:
	movq	16(%r12), %rax
	movq	8(%r12), %r12
	movl	$2, %ecx
	leaq	1(%rax), %r15
	movq	(%rsi), %rax
	addq	$1, %r12
	movq	24(%rax), %r13
	call	*__imp___acrt_iob_func(%rip)
	movq	%r15, 32(%rsp)
	movq	%r12, %r9
	leaq	.LC196(%rip), %rdx
	movq	%rax, %rcx
	movq	%r13, %r8
	call	fprintf
	jmp	.L1939
.L2004:
	movq	16(%r12), %rax
	movq	8(%r12), %r12
	movl	$2, %ecx
	leaq	1(%rax), %r15
	movq	(%rsi), %rax
	addq	$1, %r12
	movq	24(%rax), %r13
	call	*__imp___acrt_iob_func(%rip)
	movq	%r15, 32(%rsp)
	movq	%r12, %r9
	leaq	.LC187(%rip), %rdx
	movq	%rax, %rcx
	movq	%r13, %r8
	call	fprintf
	jmp	.L1899
.L2003:
	movl	$16, %ecx
	call	alloc_memory
	movl	$5, 8(%rax)
	movq	%rax, %rdi
	movq	$0, (%rax)
	jmp	.L1816
.L1832:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L1833
.L1904:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %r13
	jmp	.L1905
.L1945:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L1946
.L1909:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L1910
.L2015:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$1, %edx
	movl	$52, %r8d
	leaq	.LC182(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	xorl	%edx, %edx
	jmp	.L1869
.L1977:
	xorl	%ecx, %ecx
	movq	%rcx, 88(%rsp)
.L1915:
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L1920
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm5
	movq	%rax, 80(%rbx)
	movq	%rdx, 16(%rbx)
	xorl	%edx, %edx
	movq	%rdx, 48(%rbx)
	movups	%xmm5, 32(%rbx)
.L1921:
	cmpl	$5, 24(%rax)
	jne	.L1922
	movq	16+symbolList(%rip), %rcx
	cmpq	%rcx, (%rax)
	jne	.L1922
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, %r13
	movb	$1, 11(%rsi)
	movq	48(%rbx), %r15
	testq	%r15, %r15
	je	.L1928
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm6
	movq	%r15, 80(%rbx)
	movq	%rax, 16(%rbx)
	xorl	%eax, %eax
	movq	%rax, 48(%rbx)
	movups	%xmm6, 32(%rbx)
.L1925:
	cmpl	$5, 24(%r15)
	jne	.L1930
.L2019:
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, (%r15)
	je	.L2017
.L1930:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r10
	testq	%rax, %rax
	je	.L2018
.L1927:
	movq	%r10, %rdx
	movq	%r13, %rcx
	call	list_append
	movq	48(%rbx), %r15
	testq	%r15, %r15
	je	.L1928
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm4
	movq	%r15, 80(%rbx)
	cmpl	$5, 24(%r15)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm4, 32(%rbx)
	je	.L2019
	jmp	.L1930
.L1928:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %r15
	jmp	.L1925
.L2018:
	movq	%rax, 64(%rsp)
	movq	16(%r15), %rax
	movl	$2, %ecx
	movq	8(%r15), %r15
	leaq	1(%rax), %rdx
	movq	(%rsi), %rax
	movq	%rdx, 72(%rsp)
	addq	$1, %r15
	movq	24(%rax), %r8
	movq	%r8, 80(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	72(%rsp), %rdx
	movq	80(%rsp), %r8
	movq	%r15, %r9
	movq	%rax, %rcx
	movq	%rdx, 32(%rsp)
	leaq	.LC194(%rip), %rdx
	call	fprintf
	movq	64(%rsp), %r10
	jmp	.L1927
.L2009:
	movq	16(%r13), %rax
	movq	8(%r13), %r13
	movl	$2, %ecx
	leaq	1(%rax), %r15
	movq	(%rsi), %rax
	addq	$1, %r13
	movq	24(%rax), %r8
	movq	%r8, 88(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%r15, 32(%rsp)
	movq	%r13, %r9
	movq	88(%rsp), %r8
	movq	%rax, %rcx
	leaq	.LC189(%rip), %rdx
	call	fprintf
	jmp	.L1908
.L1912:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %r13
	jmp	.L1913
.L1848:
	movq	16(%rax), %rdi
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	(%rsi), %rax
	addq	$1, %rdi
	addq	$1, %rbx
	movq	24(%rax), %rsi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC177(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L1823
.L1859:
	movq	16(%rax), %rdi
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	(%rsi), %rax
	addq	$1, %rdi
	addq	$1, %rbx
	movq	24(%rax), %rsi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC180(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L1823
.L1855:
	movq	16(%rax), %rdi
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	(%rsi), %rax
	addq	$1, %rdi
	addq	$1, %rbx
	movq	24(%rax), %rsi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC179(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L1823
.L1871:
	cmpq	$0, 56(%rsp)
	je	.L2020
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, %rdx
	movq	56(%rsp), %rax
	movq	%r13, 8(%rdx)
	movq	%rax, (%rdx)
	movq	64(%rsp), %rax
	movq	%rax, 16(%rdx)
	movq	48(%rsp), %rax
	movq	%rax, 24(%rdx)
	jmp	.L1831
.L1922:
	movq	16(%rax), %rdi
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	(%rsi), %rax
	addq	$1, %rdi
	addq	$1, %rbx
	movq	24(%rax), %rsi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC193(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L1894
.L1917:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L1918
.L2017:
	movb	$0, 11(%rsi)
	movl	$32, %ecx
	call	alloc_memory
	movq	%rdi, (%rax)
	movq	%rax, %r9
	movq	%r12, 8(%rax)
	movq	88(%rsp), %rax
	movq	%r13, 24(%r9)
	movq	%rax, 16(%r9)
	jmp	.L1903
.L2010:
	cmpq	64+keywordList(%rip), %rax
	jne	.L1871
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L1876
	movq	%rax, 80(%rbx)
	movq	56(%rbx), %rax
	xorl	%r11d, %r11d
	movdqu	64(%rbx), %xmm5
	movq	%r11, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm5, 32(%rbx)
.L1877:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
.L1878:
	cmpl	$5, 24(%rax)
	jne	.L1879
	movq	16+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1879
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L1881
	movq	56(%rbx), %rax
	xorl	%r9d, %r9d
	movdqu	64(%rbx), %xmm3
	movq	%rdi, 80(%rbx)
	movq	%r9, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm3, 32(%rbx)
.L1883:
	leaq	.LC184(%rip), %r12
.L1882:
	cmpl	$5, 24(%rdi)
	jne	.L1887
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, (%rdi)
	je	.L1871
.L1887:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L2021
.L1884:
	movq	48(%rsp), %rcx
	movq	%r15, %rdx
	call	list_append
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L1885
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm4
	xorl	%r8d, %r8d
	movq	%rdi, 80(%rbx)
	movq	%r8, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm4, 32(%rbx)
	jmp	.L1882
.L2016:
	movq	16(%r13), %rax
	movq	8(%r13), %r13
	movl	$2, %ecx
	leaq	1(%rax), %r15
	movq	(%rsi), %rax
	addq	$1, %r13
	movq	24(%rax), %r8
	movq	%r8, 80(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%r15, 32(%rsp)
	movq	%r13, %r9
	movq	80(%rsp), %r8
	movq	%rax, %rcx
	leaq	.LC191(%rip), %rdx
	call	fprintf
	jmp	.L1916
.L1920:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L1921
.L1885:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %rdi
	jmp	.L1882
.L2021:
	movq	16(%rdi), %rax
	movl	$2, %ecx
	movq	8(%rdi), %rdi
	leaq	1(%rax), %rdx
	movq	(%rsi), %rax
	addq	$1, %rdi
	movq	%rdx, 80(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 88(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	80(%rsp), %rdx
	movq	88(%rsp), %r8
	movq	%rdi, %r9
	movq	%rax, %rcx
	movq	%rdx, 32(%rsp)
	movq	%r12, %rdx
	call	fprintf
	jmp	.L1884
.L1879:
	movq	16(%rax), %rdi
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	(%rsi), %rax
	addq	$1, %rdi
	addq	$1, %rbx
	movq	24(%rax), %rsi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC183(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L1823
.L1876:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L1877
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm6
	xorl	%r10d, %r10d
	movq	%rax, 80(%rbx)
	movq	%r10, 48(%rbx)
	movq	%rdx, 16(%rbx)
	movups	%xmm6, 32(%rbx)
	jmp	.L1878
.L2020:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$47, %r8d
	movl	$1, %edx
	leaq	.LC185(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L1823
.L1881:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %rdi
	jmp	.L1883
	.section .rdata,"dr"
	.align 8
.LC204:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected identifier after 'import'\12\0"
	.align 8
.LC205:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected string literal after 'from'\12\0"
	.align 8
.LC206:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' at end of import statement\12\0"
.LC207:
	.ascii "%s.tc\0"
.LC208:
	.ascii "D:/TC/std/\0"
.LC209:
	.ascii "r\0"
	.align 8
.LC210:
	.ascii "Error opening library file for import: %s\12\0"
	.align 8
.LC211:
	.ascii "Info: Starting parsing lib file for import: %s\12\0"
	.align 8
.LC212:
	.ascii "Info: Finished parsing lib file for import: %s\12\0"
	.align 8
.LC213:
	.ascii "Error parsing library file for import: %s\12\0"
	.align 8
.LC214:
	.ascii "Error: Imported symbol '%s' was not found in %s\12\0"
	.align 8
.LC215:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to import module\12\0"
	.align 8
.LC216:
	.ascii "Error creating import: name is NULL\12\0"
	.align 8
.LC217:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse import statement\12\0"
	.align 8
.LC218:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected function return type after 'func'\12\0"
	.align 8
.LC219:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected function name after return type\12\0"
	.align 8
.LC220:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after function name\12\0"
	.align 8
.LC221:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function parameter\12\0"
	.align 8
.LC222:
	.ascii "[Parser Error] at %s:%zu:%zu: Function parameters cannot have default values\12\0"
	.align 8
.LC223:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function parameter\12\0"
	.align 8
.LC224:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start function body\12\0"
	.align 8
.LC225:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function body statement\12\0"
	.align 8
.LC226:
	.ascii "[Parser Error] at %s:%zu:%zu: Unreachable code after return statement\12\0"
	.align 8
.LC227:
	.ascii "[Parser Error] at %s:%zu:%zu: Function missing return statement\12\0"
	.align 8
.LC228:
	.ascii "Error creating function: name or return_type is NULL\12\0"
	.align 8
.LC229:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function declaration\12\0"
	.align 8
.LC230:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected class name after 'class'\12\0"
	.align 8
.LC231:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start class body\12\0"
	.align 8
.LC232:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected method return type after 'method'\12\0"
	.align 8
.LC233:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected method name after return type\12\0"
	.align 8
.LC234:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after method name\12\0"
	.align 8
.LC235:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected 'self' as first parameter of method\12\0"
	.align 8
.LC236:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after method parameter\12\0"
	.align 8
.LC237:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse method parameter\12\0"
	.align 8
.LC238:
	.ascii "[Parser Error] at %s:%zu:%zu: Method parameters cannot have default values\12\0"
	.align 8
.LC239:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start method body\12\0"
	.align 8
.LC241:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse method body statement\12\0"
	.align 8
.LC242:
	.ascii "[Parser Error] at %s:%zu:%zu: Method missing return statement\12\0"
	.align 8
.LC243:
	.ascii "Error creating method: name or return_type is NULL\12\0"
	.align 8
.LC244:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse class method\12\0"
	.align 8
.LC245:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse class variable\12\0"
	.align 8
.LC246:
	.ascii "[Parser Error] at %s:%zu:%zu: Unsupported type for class variable\12\0"
	.align 8
.LC247:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after class variable declaration\12\0"
	.align 8
.LC248:
	.ascii "[Parser Error] at %s:%zu:%zu: Unexpected token in class member\12\0"
	.align 8
.LC249:
	.ascii "[Parser Error] at %s:%zu:%zu: Constructor name conflicts with existing member\12\0"
.LC250:
	.ascii "0\0"
	.align 8
.LC251:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse class declaration\12\0"
	.align 8
.LC252:
	.ascii "[Parser Error] at %s:%zu:%zu: Unexpected token in code member\12\0"
	.align 8
.LC253:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown function return type\12\0"
	.align 8
.LC254:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown return type for method\12\0"
	.text
	.p2align 4
	.def	parse_code;	.scl	3;	.type	32;	.endef
parse_code:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	movq	%rcx, %r14
	pushq	%r13
	movq	%r8, %r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$192, %rsp
	cmpq	$0, builtin_scope(%rip)
	movups	%xmm6, 192(%rsp)
	je	.L2347
.L2023:
	movl	$16, %ecx
	testq	%rbx, %rbx
	pxor	%xmm6, %xmm6
	cmove	builtin_scope(%rip), %rbx
	call	alloc_memory
	movl	$16, %ecx
	movups	%xmm6, (%rax)
	movq	%rax, 160(%rsp)
	call	alloc_memory
	movl	$16, %ecx
	movq	%rbx, (%rax)
	movq	%rax, %rdi
	movq	%rax, 168(%rsp)
	call	alloc_memory
	movq	48(%r14), %rbx
	movups	%xmm6, (%rax)
	movq	%rax, 8(%rdi)
	testq	%rbx, %rbx
	je	.L2235
	movq	56(%r14), %rax
	movdqu	64(%r14), %xmm5
	movq	%rbx, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rax, 16(%r14)
	movups	%xmm5, 32(%r14)
.L2237:
	movl	24(%rbx), %eax
	testl	%eax, %eax
	je	.L2027
.L2238:
	cmpl	$6, %eax
	je	.L2348
.L2028:
	movq	16(%rbx), %rax
	movq	8(%rbx), %rbx
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	0(%r13), %rax
	addq	$1, %rbx
	movq	24(%rax), %rdi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC252(%rip), %rdx
	movq	%rax, %rcx
	movq	%rdi, %r8
	call	fprintf
.L2057:
	movq	48(%r14), %rbx
	testq	%rbx, %rbx
	je	.L2235
	movq	56(%r14), %rax
	movdqu	64(%r14), %xmm1
	movq	%rbx, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rax, 16(%r14)
	movl	24(%rbx), %eax
	movups	%xmm1, 32(%r14)
	testl	%eax, %eax
	jne	.L2238
.L2027:
	movl	$16, %ecx
	call	alloc_memory
	movq	160(%rsp), %rsi
	movq	168(%rsp), %rdi
	movq	%rsi, (%rax)
	movq	%rdi, 8(%rax)
	movups	192(%rsp), %xmm6
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
	.p2align 4,,10
	.p2align 3
.L2348:
	movq	(%rbx), %rax
	cmpq	keywordList(%rip), %rax
	je	.L2349
	cmpq	16+keywordList(%rip), %rax
	je	.L2350
	cmpq	24+keywordList(%rip), %rax
	jne	.L2028
	movl	$16, %ecx
	call	alloc_memory
	movl	$16, %ecx
	movq	%rax, %rsi
	movq	%rax, 152(%rsp)
	movq	168(%rsp), %rax
	movq	%rax, (%rsi)
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, 8(%rsi)
	movq	48(%r14), %rsi
	testq	%rsi, %rsi
	je	.L2111
	movq	56(%r14), %rax
	movdqu	64(%r14), %xmm3
	movq	%rsi, 80(%r14)
	cmpl	$1, 24(%rsi)
	movq	$0, 48(%r14)
	movq	%rax, 16(%r14)
	movups	%xmm3, 32(%r14)
	jne	.L2351
.L2113:
	movl	$32, %ecx
	call	alloc_memory
	movq	(%rsi), %rcx
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, %r9
	movq	%rax, 136(%rsp)
	movq	152(%rsp), %rax
	movq	%rax, 16(%r9)
	call	create_symbol
	movq	%rax, 144(%rsp)
	movq	48(%r14), %rax
	testq	%rax, %rax
	je	.L2115
	movq	56(%r14), %rdx
	movdqu	64(%r14), %xmm5
	movq	%rax, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rdx, 16(%r14)
	movups	%xmm5, 32(%r14)
.L2116:
	cmpl	$5, 24(%rax)
	jne	.L2117
	movq	16+symbolList(%rip), %rsi
	cmpq	%rsi, (%rax)
	jne	.L2117
	movl	$16, %ecx
	call	alloc_memory
	movq	48(%r14), %r12
	pxor	%xmm0, %xmm0
	movq	%rax, 128(%rsp)
	movups	%xmm0, (%rax)
	testq	%r12, %r12
	je	.L2119
	movq	56(%r14), %rax
	movdqu	64(%r14), %xmm4
	movq	%r12, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rax, 16(%r14)
	movups	%xmm4, 32(%r14)
.L2121:
	movq	$0, 80(%rsp)
	leaq	.LC38(%rip), %rax
	movq	%rax, 120(%rsp)
	.p2align 4,,10
	.p2align 3
.L2120:
	movl	24(%r12), %eax
	cmpl	$5, %eax
	je	.L2352
.L2203:
	cmpl	$6, %eax
	jne	.L2122
	movq	(%r12), %rax
	cmpq	32+keywordList(%rip), %rax
	je	.L2353
	cmpq	168+keywordList(%rip), %rax
	je	.L2354
.L2122:
	movq	16(%r12), %rax
	movq	8(%r12), %rbx
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	0(%r13), %rax
	addq	$1, %rbx
	movq	24(%rax), %rdi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC248(%rip), %rdx
	movq	%rax, %rcx
	movq	%rdi, %r8
	call	fprintf
.L2200:
	movq	48(%r14), %r12
	testq	%r12, %r12
	je	.L2201
	movq	56(%r14), %rax
	movdqu	64(%r14), %xmm2
	movq	%r12, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rax, 16(%r14)
	movl	24(%r12), %eax
	movups	%xmm2, 32(%r14)
	cmpl	$5, %eax
	jne	.L2203
.L2352:
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, (%r12)
	jne	.L2122
	movq	144(%rsp), %rax
	movq	DEFAULT_INIT_NAME(%rip), %rbx
	movq	8(%rax), %rdi
	movq	%rdi, %rcx
	call	strlen
	movq	%rbx, %rcx
	movq	%rax, %rsi
	call	strlen
	movq	120(%rsp), %rcx
	movl	$1, %r8d
	leaq	2(%rsi,%rax), %rdx
	call	create_string_check
	movq	%rbx, %r9
	movq	%rdi, %r8
	leaq	.LC128(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rsi
	call	sprintf
	movq	152(%rsp), %r15
.L2207:
	movq	8(%r15), %rax
	movq	(%rax), %rdi
	testq	%rdi, %rdi
	jne	.L2206
	jmp	.L2204
	.p2align 4,,10
	.p2align 3
.L2355:
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L2204
.L2206:
	movq	8(%rdi), %rbx
	movq	%rsi, %rdx
	movq	8(%rbx), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L2355
.L2205:
	cmpl	$2, 32(%rbx)
	je	.L2212
	movq	16(%r12), %rax
	movq	8(%r12), %rsi
	movl	$2, %ecx
	leaq	1(%rax), %r15
	movq	0(%r13), %rax
	addq	$1, %rsi
	movq	24(%rax), %rdi
	call	*__imp___acrt_iob_func(%rip)
	movq	%r15, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC249(%rip), %rdx
	movq	%rax, %rcx
	movq	%rdi, %r8
	call	fprintf
.L2212:
	movq	144(%rsp), %r15
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi
	pxor	%xmm6, %xmm6
	movq	8(%r15), %rdi
	movq	%rdi, %rcx
	call	strlen
	movq	%rsi, %rcx
	movq	%rax, %r12
	call	strlen
	movq	120(%rsp), %rcx
	movl	$1, %r8d
	leaq	2(%r12,%rax), %rdx
	call	create_string_check
	movq	%rsi, %r9
	movq	%rdi, %r8
	leaq	.LC128(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	sprintf
	movl	$40, %ecx
	call	alloc_memory
	movl	$16, %ecx
	movq	%rax, %rdi
	call	alloc_memory
	movl	$16, %ecx
	movq	%rax, %rsi
	movq	152(%rsp), %rax
	movq	%rax, (%rsi)
	call	alloc_memory
	movq	%r15, %r8
	movq	%rdi, %r9
	movl	$2, %edx
	movups	%xmm6, (%rax)
	movq	%r12, %rcx
	movq	%rax, 8(%rsi)
	movq	%rsi, 32(%rdi)
	call	create_symbol
	movl	$16, %ecx
	movq	%rax, 88(%rsp)
	call	alloc_memory
	movq	32(%rdi), %r9
	movq	%r15, %r8
	movq	40+keywordList(%rip), %rcx
	movups	%xmm6, (%rax)
	movl	$3, %edx
	movq	%rax, %rsi
	call	create_symbol
	movq	%rax, 120(%rsp)
	movq	24(%rbx), %rax
	movq	16(%rax), %r15
	testq	%r15, %r15
	je	.L2213
	movl	$16, %ecx
	call	alloc_memory
	movq	40+keywordList(%rip), %rcx
	movups	%xmm6, (%rax)
	movdqu	(%r15), %xmm5
	movq	%rax, %r12
	movups	%xmm5, (%rax)
.L2217:
	movq	(%r12), %rax
	testq	%rax, %rax
	je	.L2213
.L2357:
	movq	(%rax), %rdx
	movq	%rdx, (%r12)
	testq	%rdx, %rdx
	je	.L2219
.L2346:
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L2213
	movq	8(%rax), %rdx
	cmpq	8(%rdx), %rcx
	je	.L2217
	movq	(%rax), %r15
	movq	%rdx, %xmm3
	movq	%r15, %xmm6
	punpcklqdq	%xmm3, %xmm6
	testq	%r15, %r15
	je	.L2356
	movl	$24, %ecx
	call	alloc_memory
	movq	$0, 16(%rax)
	movq	%rax, %r15
	movups	%xmm6, (%rax)
.L2216:
	movq	%rsi, %rcx
	movq	%r15, %rdx
	call	list_append
	movq	(%r12), %rax
	movq	40+keywordList(%rip), %rcx
	testq	%rax, %rax
	jne	.L2357
.L2213:
	movl	$16, %ecx
	pxor	%xmm6, %xmm6
	call	alloc_memory
	movl	$16, %ecx
	movups	%xmm6, (%rax)
	movq	%rax, %r12
	movq	%rax, 112(%rsp)
	call	alloc_memory
	movq	120(%rsp), %r8
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movups	%xmm6, (%rax)
	movq	%rax, %r15
	movq	128(%rsp), %rax
	xorl	%ecx, %ecx
	movdqu	(%rax), %xmm5
	movups	%xmm5, (%r15)
	movq	$0, 32(%rsp)
	movups	%xmm5, 96(%rsp)
	call	create_variable_access
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	movl	$8, %ecx
	call	create_primary
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_expression
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	movq	$0, 40(%rsp)
	xorl	%r8d, %r8d
	movq	%rax, 32(%rsp)
	call	create_statement
	movq	%r12, %rcx
	movq	%rax, %rdx
	call	list_append
.L2218:
	movq	(%r15), %rax
	testq	%rax, %rax
	je	.L2227
	.p2align 4,,10
	.p2align 3
.L2223:
	movq	%rax, %rdx
	movq	(%rax), %rax
	movq	%rax, (%r15)
	testq	%rax, %rax
	je	.L2226
	movq	8(%rdx), %r12
	testq	%r12, %r12
	je	.L2227
	cmpl	$1, 8(%r12)
	jne	.L2223
.L2228:
	movq	(%r12), %rax
	movq	120(%rsp), %r8
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	8(%rax), %rax
	movq	$0, 32(%rsp)
	movq	%rax, 96(%rsp)
	call	create_variable_access
	movq	96(%rsp), %r8
	xorl	%r9d, %r9d
	movq	$0, 32(%rsp)
	movq	%rax, %rdx
	movl	$2, %ecx
	call	create_variable_access
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	movl	$8, %ecx
	call	create_primary
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_expression
	movq	%rax, %r10
	movq	(%r12), %rax
	movq	16(%rax), %r9
	testq	%r9, %r9
	je	.L2358
.L2222:
	movq	%r10, %rdx
	xorl	%r8d, %r8d
	movl	$13, %ecx
	call	create_expression
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	movq	$0, 40(%rsp)
	xorl	%r8d, %r8d
	movq	%rax, 32(%rsp)
	call	create_statement
	movq	112(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L2218
	.p2align 4,,10
	.p2align 3
.L2235:
	movl	$1, %edx
	movq	%r14, %rcx
	call	next_token
	movq	%rax, 80(%r14)
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L2237
	jmp	.L2027
	.p2align 4,,10
	.p2align 3
.L2117:
	movq	16(%rax), %rsi
	movq	8(%rax), %rdi
	movl	$2, %ecx
	movq	0(%r13), %rax
	leaq	1(%rsi), %r15
	movq	__imp___acrt_iob_func(%rip), %rsi
	addq	$1, %rdi
	movq	24(%rax), %r12
	call	*%rsi
	movq	%r15, 32(%rsp)
	movq	%rdi, %r9
	leaq	.LC231(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
.L2114:
	movq	16(%rbx), %rax
	movq	8(%rbx), %rbx
	movl	$2, %ecx
	leaq	1(%rax), %rdi
	movq	0(%r13), %rax
	addq	$1, %rbx
	movq	24(%rax), %r12
	call	*%rsi
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC251(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	movq	$0, 136(%rsp)
.L2234:
	movq	136(%rsp), %r9
	xorl	%edx, %edx
	xorl	%r8d, %r8d
	movl	$2, %ecx
	call	create_code_member
	movq	160(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L2057
	.p2align 4,,10
	.p2align 3
.L2349:
	movq	48(%r14), %rax
	testq	%rax, %rax
	je	.L2030
	movq	56(%r14), %rdx
	movdqu	64(%r14), %xmm5
	movq	%rax, 80(%r14)
	cmpl	$1, 24(%rax)
	movq	$0, 48(%r14)
	movq	%rdx, 16(%r14)
	movups	%xmm5, 32(%r14)
	je	.L2359
.L2031:
	movq	16(%rax), %rdi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rsi
	leaq	1(%rdi), %r15
	movq	8(%rax), %rdi
	movq	0(%r13), %rax
	movq	24(%rax), %r12
	addq	$1, %rdi
	call	*%rsi
	movq	%r15, 32(%rsp)
	movq	%rdi, %r9
	leaq	.LC204(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
.L2034:
	movq	16(%rbx), %rax
	movq	8(%rbx), %rbx
	movl	$2, %ecx
	leaq	1(%rax), %rdi
	movq	0(%r13), %rax
	addq	$1, %rbx
	movq	24(%rax), %r12
	call	*%rsi
	movq	%rdi, 32(%rsp)
	leaq	.LC217(%rip), %rdx
	movq	%rbx, %r9
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	xorl	%edx, %edx
.L2056:
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	call	create_code_member
	movq	160(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L2057
	.p2align 4,,10
	.p2align 3
.L2350:
	movl	$16, %ecx
	call	alloc_memory
	movl	$16, %ecx
	movq	%rax, %rsi
	movq	168(%rsp), %rax
	movq	%rax, (%rsi)
	call	alloc_memory
	movq	48(%r14), %rcx
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, 8(%rsi)
	testq	%rcx, %rcx
	je	.L2059
	movq	56(%r14), %rax
	movdqu	64(%r14), %xmm4
	movq	%rcx, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rax, 16(%r14)
	movups	%xmm4, 32(%r14)
.L2060:
	movl	24(%rcx), %eax
	cmpl	$1, %eax
	je	.L2061
	cmpl	$6, %eax
	jne	.L2062
	movq	(%rcx), %rax
	movq	128+keywordList(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2063
	movq	136+keywordList(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2063
	movq	144+keywordList(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2063
	movq	152+keywordList(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2063
	movq	160+keywordList(%rip), %rdx
	cmpq	%rdx, %rax
	jne	.L2062
	.p2align 4,,10
	.p2align 3
.L2063:
	movq	168(%rsp), %r8
.L2068:
	movq	8(%r8), %rax
	jmp	.L2340
	.p2align 4,,10
	.p2align 3
.L2360:
	movq	8(%rax), %r15
	cmpq	%rdx, 8(%r15)
	je	.L2066
.L2340:
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L2360
	movq	(%r8), %r8
	testq	%r8, %r8
	jne	.L2068
	movq	16(%rcx), %rax
	movq	8(%rcx), %rdi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rsi
	leaq	1(%rax), %r15
	movq	0(%r13), %rax
	addq	$1, %rdi
	movq	24(%rax), %r12
	call	*%rsi
	movq	%r15, 32(%rsp)
	movq	%rdi, %r9
	leaq	.LC253(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	jmp	.L2064
	.p2align 4,,10
	.p2align 3
.L2066:
	movq	48(%r14), %r12
	testq	%r12, %r12
	je	.L2361
	movq	56(%r14), %rax
	movdqu	64(%r14), %xmm3
	movq	%r12, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rax, 16(%r14)
	movups	%xmm3, 32(%r14)
.L2070:
	cmpl	$1, 24(%r12)
	jne	.L2362
	movl	$40, %ecx
	call	alloc_memory
	movq	(%r12), %rcx
	movq	%r15, %r8
	movl	$1, %edx
	movq	%rsi, 32(%rax)
	movq	%rax, %r9
	movq	%rax, %rdi
	call	create_symbol
	movq	%rax, 144(%rsp)
	movq	48(%r14), %rax
	testq	%rax, %rax
	je	.L2072
	movq	56(%r14), %rdx
	movdqu	64(%r14), %xmm0
	movq	%rax, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rdx, 16(%r14)
	movups	%xmm0, 32(%r14)
.L2073:
	cmpl	$5, 24(%rax)
	jne	.L2074
	movq	symbolList(%rip), %rdx
	cmpq	%rdx, (%rax)
	jne	.L2074
	movq	48(%r14), %r12
	testq	%r12, %r12
	je	.L2076
	movq	56(%r14), %rax
	movdqu	64(%r14), %xmm3
	movq	%r12, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rax, 16(%r14)
	movups	%xmm3, 32(%r14)
.L2077:
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movq	%rdi, 136(%rsp)
	movq	%r15, 128(%rsp)
	movq	%rax, 152(%rsp)
	movups	%xmm0, (%rax)
	movl	24(%r12), %eax
.L2078:
	cmpl	$5, %eax
	je	.L2088
	.p2align 4,,10
	.p2align 3
.L2089:
	movq	%r13, %r8
	movq	%rsi, %rdx
	movq	%r14, %rcx
	call	parse_variable
	testq	%rax, %rax
	je	.L2363
	cmpq	$0, 16(%rax)
	je	.L2081
	movq	16(%r12), %rax
	movq	8(%r12), %r12
	movl	$2, %ecx
	leaq	1(%rax), %r15
	movq	0(%r13), %rax
	addq	$1, %r12
	movq	24(%rax), %rdi
	call	*__imp___acrt_iob_func(%rip)
	movq	%r15, 32(%rsp)
	movq	%r12, %r9
	leaq	.LC222(%rip), %rdx
	movq	%rax, %rcx
	movq	%rdi, %r8
	call	fprintf
.L2080:
	movq	48(%r14), %r12
	testq	%r12, %r12
	je	.L2082
	movq	56(%r14), %rax
	movdqu	64(%r14), %xmm4
	movq	%r12, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rax, 16(%r14)
	movups	%xmm4, 32(%r14)
.L2083:
	cmpl	$5, 24(%r12)
	je	.L2364
.L2084:
	movq	16(%r12), %rax
	movq	8(%r12), %rdi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rsi
	leaq	1(%rax), %r15
	movq	0(%r13), %rax
	addq	$1, %rdi
	movq	24(%rax), %r12
	call	*%rsi
	movq	%r15, 32(%rsp)
	movq	%rdi, %r9
	leaq	.LC223(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	.p2align 4,,10
	.p2align 3
.L2064:
	movq	16(%rbx), %rax
	movq	8(%rbx), %rbx
	movl	$2, %ecx
	leaq	1(%rax), %rdi
	movq	0(%r13), %rax
	addq	$1, %rbx
	movq	24(%rax), %r12
	call	*%rsi
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	xorl	%edi, %edi
	movq	%rax, %rcx
	movq	%r12, %r8
	leaq	.LC229(%rip), %rdx
	call	fprintf
.L2110:
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	movq	%rdi, %r8
	movl	$1, %ecx
	call	create_code_member
	movq	160(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L2057
	.p2align 4,,10
	.p2align 3
.L2111:
	movl	$1, %edx
	movq	%r14, %rcx
	call	next_token
	movq	%rax, %rsi
	movq	%rax, 80(%r14)
	cmpl	$1, 24(%rsi)
	je	.L2113
.L2351:
	movq	16(%rsi), %rax
	movq	8(%rsi), %rdi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rsi
	leaq	1(%rax), %r15
	movq	0(%r13), %rax
	addq	$1, %rdi
	movq	24(%rax), %r12
	call	*%rsi
	movq	%r15, 32(%rsp)
	movq	%rdi, %r9
	leaq	.LC230(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	jmp	.L2114
.L2072:
	movl	$1, %edx
	movq	%r14, %rcx
	call	next_token
	movq	%rax, 80(%r14)
	jmp	.L2073
.L2062:
	movq	16(%rcx), %rax
	movq	8(%rcx), %rdi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rsi
	leaq	1(%rax), %r15
	movq	0(%r13), %rax
	addq	$1, %rdi
	movq	24(%rax), %r12
	call	*%rsi
	movq	%r15, 32(%rsp)
	movq	%rdi, %r9
	leaq	.LC218(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	jmp	.L2064
	.p2align 4,,10
	.p2align 3
.L2201:
	movl	$1, %edx
	movq	%r14, %rcx
	call	next_token
	movq	%rax, 80(%r14)
	movq	%rax, %r12
	jmp	.L2120
	.p2align 4,,10
	.p2align 3
.L2226:
	movq	8(%rdx), %r12
	movq	$0, 8(%r15)
	testq	%r12, %r12
	je	.L2227
	cmpl	$1, 8(%r12)
	je	.L2228
.L2227:
	movl	$16, %ecx
	pxor	%xmm6, %xmm6
	call	alloc_memory
	movq	120(%rsp), %r8
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movups	%xmm6, (%rax)
	xorl	%ecx, %ecx
	movq	%rax, %r12
	movq	$0, 32(%rsp)
	call	create_variable_access
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	movl	$8, %ecx
	call	create_primary
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_expression
	movq	%r12, %rcx
	movq	%rax, %rdx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	movups	%xmm6, (%rax)
	movq	%rax, %r15
	movdqu	(%rsi), %xmm3
	movq	(%rsi), %rax
	movups	%xmm3, (%r15)
	testq	%rax, %rax
	jne	.L2225
	jmp	.L2224
	.p2align 4,,10
	.p2align 3
.L2231:
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L2224
	movq	8(%rax), %r8
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	$0, 32(%rsp)
	call	create_variable_access
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	movl	$8, %ecx
	call	create_primary
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_expression
	movq	%r12, %rcx
	movq	%rax, %rdx
	call	list_append
	movq	(%r15), %rax
	testq	%rax, %rax
	je	.L2224
.L2225:
	movq	(%rax), %rdx
	movq	%rdx, (%r15)
	testq	%rdx, %rdx
	jne	.L2231
	movq	$0, 8(%r15)
	jmp	.L2231
	.p2align 4,,10
	.p2align 3
.L2364:
	movq	(%r12), %rax
	cmpq	32+symbolList(%rip), %rax
	je	.L2365
	cmpq	8+symbolList(%rip), %rax
	jne	.L2084
.L2088:
	movq	8+symbolList(%rip), %rax
	cmpq	%rax, (%r12)
	jne	.L2089
	movq	48(%r14), %rax
	movq	136(%rsp), %rdi
	movq	128(%rsp), %r15
	testq	%rax, %rax
	je	.L2090
	movq	56(%r14), %rdx
	movdqu	64(%r14), %xmm4
	movq	%rax, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rdx, 16(%r14)
	movups	%xmm4, 32(%r14)
.L2091:
	cmpl	$5, 24(%rax)
	jne	.L2092
	movq	16+symbolList(%rip), %rdx
	cmpq	%rdx, (%rax)
	jne	.L2092
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movb	$1, 8(%r13)
	movq	48(%r14), %r9
	movq	%rax, 136(%rsp)
	testq	%r9, %r9
	je	.L2094
	movq	56(%r14), %rax
	movdqu	64(%r14), %xmm5
	movq	%r9, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rax, 16(%r14)
	movups	%xmm5, 32(%r14)
.L2096:
	movq	%rbx, 96(%rsp)
	xorl	%r12d, %r12d
	movq	%r9, %rbx
.L2095:
	cmpl	$5, 24(%rbx)
	jne	.L2103
.L2369:
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, (%rbx)
	je	.L2366
.L2103:
	movq	%r13, %r8
	movq	%rsi, %rdx
	movq	%r14, %rcx
	call	parse_statement
	movq	%rax, %r10
	testq	%rax, %rax
	je	.L2367
	testb	%r12b, %r12b
	jne	.L2368
.L2099:
	cmpl	$5, 8(%r10)
	movl	$1, %eax
	cmove	%eax, %r12d
.L2100:
	movq	136(%rsp), %rcx
	movq	%r10, %rdx
	call	list_append
	movq	48(%r14), %rbx
	testq	%rbx, %rbx
	je	.L2101
	movq	56(%r14), %rax
	movdqu	64(%r14), %xmm0
	movq	%rbx, 80(%r14)
	cmpl	$5, 24(%rbx)
	movq	$0, 48(%r14)
	movq	%rax, 16(%r14)
	movups	%xmm0, 32(%r14)
	je	.L2369
	jmp	.L2103
	.p2align 4,,10
	.p2align 3
.L2219:
	movq	$0, 8(%r12)
	jmp	.L2346
	.p2align 4,,10
	.p2align 3
.L2354:
	movq	48(%r14), %rsi
	testq	%rsi, %rsi
	je	.L2186
	movq	56(%r14), %rax
	movdqu	64(%r14), %xmm4
	movq	%rsi, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rax, 16(%r14)
	movups	%xmm4, 32(%r14)
.L2187:
	movb	$1, 10(%r13)
	movq	152(%rsp), %rdx
	movq	%r13, %r8
	movq	%r14, %rcx
	call	parse_variable
	movb	$0, 10(%r13)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L2370
.L2188:
	movq	%rbx, %r8
	xorl	%edx, %edx
	movl	$1, %ecx
	call	create_class_member
	movq	128(%rsp), %rcx
	movq	%rax, %rbx
	movq	%rax, %rdx
	call	list_append
	cmpl	$1, 8(%rbx)
	je	.L2371
.L2192:
	movq	48(%r14), %rax
	testq	%rax, %rax
	je	.L2196
.L2385:
	movq	56(%r14), %rdx
	movdqu	64(%r14), %xmm3
	movq	%rax, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rdx, 16(%r14)
	movups	%xmm3, 32(%r14)
.L2197:
	cmpl	$5, 24(%rax)
	jne	.L2198
	movq	72+symbolList(%rip), %rsi
	cmpq	%rsi, (%rax)
	je	.L2200
.L2198:
	movq	16(%rax), %rdi
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	0(%r13), %rax
	leaq	1(%rdi), %rsi
	addq	$1, %rbx
	movq	24(%rax), %rdi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC247(%rip), %rdx
	movq	%rax, %rcx
	movq	%rdi, %r8
	call	fprintf
	jmp	.L2200
	.p2align 4,,10
	.p2align 3
.L2082:
	movl	$1, %edx
	movq	%r14, %rcx
	call	next_token
	movq	%rax, 80(%r14)
	movq	%rax, %r12
	jmp	.L2083
	.p2align 4,,10
	.p2align 3
.L2353:
	movl	$16, %ecx
	call	alloc_memory
	movl	$16, %ecx
	movq	%rax, %rbx
	movq	152(%rsp), %rax
	movq	%rax, (%rbx)
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movq	%rbx, %r9
	movl	$3, %edx
	movups	%xmm0, (%rax)
	movq	144(%rsp), %r8
	movq	40+keywordList(%rip), %rcx
	movq	%rax, 8(%rbx)
	call	create_symbol
	movq	48(%r14), %r8
	movq	%rax, %rdi
	testq	%r8, %r8
	je	.L2124
	movq	56(%r14), %rax
	movdqu	64(%r14), %xmm5
	movq	%r8, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rax, 16(%r14)
	movups	%xmm5, 32(%r14)
.L2125:
	movl	24(%r8), %eax
	cmpl	$1, %eax
	je	.L2126
	cmpl	$6, %eax
	jne	.L2127
	movq	(%r8), %rax
	movq	128+keywordList(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2128
	movq	136+keywordList(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2128
	movq	144+keywordList(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2128
	movq	152+keywordList(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2128
	movq	160+keywordList(%rip), %rdx
	cmpq	%rdx, %rax
	jne	.L2127
	.p2align 4,,10
	.p2align 3
.L2128:
	movq	152(%rsp), %rcx
.L2133:
	movq	8(%rcx), %rax
	jmp	.L2341
	.p2align 4,,10
	.p2align 3
.L2372:
	movq	8(%rax), %r10
	cmpq	8(%r10), %rdx
	je	.L2131
.L2341:
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L2372
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	jne	.L2133
	movq	16(%r8), %rax
	movq	8(%r8), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rbx
	leaq	1(%rax), %r15
	movq	0(%r13), %rax
	addq	$1, %rsi
	movq	24(%rax), %rdi
	call	*%rbx
	movq	%r15, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC254(%rip), %rdx
	movq	%rax, %rcx
	movq	%rdi, %r8
	call	fprintf
	jmp	.L2129
	.p2align 4,,10
	.p2align 3
.L2081:
	movq	152(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L2080
	.p2align 4,,10
	.p2align 3
.L2131:
	movq	48(%r14), %r15
	testq	%r15, %r15
	je	.L2373
	movq	56(%r14), %rax
	movdqu	64(%r14), %xmm3
	movq	%r15, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rax, 16(%r14)
	movups	%xmm3, 32(%r14)
.L2135:
	cmpl	$1, 24(%r15)
	jne	.L2374
	movl	$40, %ecx
	movq	%r10, 72(%rsp)
	call	alloc_memory
	movq	(%r15), %r15
	movq	%rax, 96(%rsp)
	movq	%rax, %rsi
	movq	%rbx, 32(%rax)
	movq	144(%rsp), %rax
	movq	8(%rax), %r11
	movq	%r11, %rcx
	movq	%r11, 88(%rsp)
	call	strlen
	movq	%r15, %rcx
	movq	%rax, 112(%rsp)
	call	strlen
	movq	112(%rsp), %rdx
	movq	120(%rsp), %rcx
	movl	$1, %r8d
	leaq	2(%rdx,%rax), %rdx
	call	create_string_check
	movq	88(%rsp), %r8
	movq	%r15, %r9
	leaq	.LC128(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, 88(%rsp)
	call	sprintf
	movq	72(%rsp), %r10
	movq	88(%rsp), %rcx
	movq	%rsi, %r9
	movl	$2, %edx
	movq	%r10, %r8
	movq	%r10, 112(%rsp)
	call	create_symbol
	movq	112(%rsp), %r10
	movq	%rax, 72(%rsp)
	movq	48(%r14), %rax
	testq	%rax, %rax
	je	.L2137
	movq	56(%r14), %rdx
	movdqu	64(%r14), %xmm5
	movq	%rax, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rdx, 16(%r14)
	movups	%xmm5, 32(%r14)
.L2138:
	cmpl	$5, 24(%rax)
	jne	.L2139
	movq	symbolList(%rip), %rsi
	cmpq	%rsi, (%rax)
	jne	.L2139
	movq	48(%r14), %rax
	testq	%rax, %rax
	je	.L2141
	movq	56(%r14), %rdx
	movdqu	64(%r14), %xmm3
	movq	%rax, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rdx, 16(%r14)
	movups	%xmm3, 32(%r14)
.L2142:
	cmpl	$6, 24(%rax)
	jne	.L2143
	movq	40+keywordList(%rip), %rsi
	cmpq	%rsi, (%rax)
	je	.L2144
.L2143:
	movq	16(%rax), %rsi
	movq	8(%rax), %r15
	movq	%r10, 64(%rsp)
	movl	$2, %ecx
	movq	0(%r13), %rax
	leaq	1(%rsi), %rdx
	addq	$1, %r15
	movq	24(%rax), %r8
	movq	%rdx, 88(%rsp)
	movq	%r8, 112(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	88(%rsp), %rdx
	movq	112(%rsp), %r8
	movq	%r15, %r9
	movq	%rax, %rcx
	movq	%rdx, 32(%rsp)
	leaq	.LC235(%rip), %rdx
	call	fprintf
	movq	64(%rsp), %r10
.L2144:
	movq	48(%r14), %r15
	testq	%r15, %r15
	je	.L2145
	movq	56(%r14), %rax
	movdqu	64(%r14), %xmm0
	movq	%r15, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rax, 16(%r14)
	movups	%xmm0, 32(%r14)
.L2146:
	movl	$16, %ecx
	movq	%r10, 112(%rsp)
	call	alloc_memory
	pxor	%xmm0, %xmm0
	testq	%rdi, %rdi
	movq	112(%rsp), %r10
	movq	%rax, 88(%rsp)
	movups	%xmm0, (%rax)
	je	.L2375
	movl	$24, %ecx
	movq	%r10, 112(%rsp)
	call	alloc_memory
	movq	112(%rsp), %r10
	movq	%rax, %rdx
	movq	144(%rsp), %rax
	movq	%rdi, 8(%rdx)
	movq	%rax, (%rdx)
	movq	$0, 16(%rdx)
.L2148:
	movq	88(%rsp), %rcx
	movq	%r10, 112(%rsp)
	call	list_append
	cmpl	$5, 24(%r15)
	movq	112(%rsp), %r10
	je	.L2376
	.p2align 4,,10
	.p2align 3
.L2149:
	movq	16(%r15), %rax
	movq	8(%r15), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rbx
	leaq	1(%rax), %rdi
	movq	0(%r13), %rax
	addq	$1, %rsi
	movq	24(%rax), %r15
	call	*%rbx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC236(%rip), %rdx
	movq	%rax, %rcx
	movq	%r15, %r8
	call	fprintf
	jmp	.L2129
	.p2align 4,,10
	.p2align 3
.L2363:
	movq	16(%r12), %rax
	movq	8(%r12), %r12
	movl	$2, %ecx
	leaq	1(%rax), %r15
	movq	0(%r13), %rax
	addq	$1, %r12
	movq	24(%rax), %rdi
	call	*__imp___acrt_iob_func(%rip)
	movq	%r15, 32(%rsp)
	movq	%r12, %r9
	leaq	.LC221(%rip), %rdx
	movq	%rax, %rcx
	movq	%rdi, %r8
	call	fprintf
	jmp	.L2080
	.p2align 4,,10
	.p2align 3
.L2224:
	movq	$0, 32(%rsp)
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rbx, %r8
	call	create_variable_access
	movq	%r12, 32(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_variable_access
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	movl	$8, %ecx
	call	create_primary
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_expression
	movl	$16, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movq	112(%rsp), %rcx
	movl	$5, 8(%rax)
	movq	%rax, %rdx
	movq	%rbx, (%rax)
	call	list_append
	cmpq	$0, 88(%rsp)
	je	.L2377
	movq	88(%rsp), %rax
	movq	%rsi, 16(%rdi)
	movq	%rax, (%rdi)
	movq	144(%rsp), %rax
	movq	%rax, 8(%rdi)
	movq	112(%rsp), %rax
	movq	%rax, 24(%rdi)
.L2233:
	movq	%rdi, %rdx
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	call	create_class_member
	movq	128(%rsp), %rdi
	movq	%rax, %rdx
	movq	%rdi, %rcx
	call	list_append
	movq	136(%rsp), %rax
	movq	144(%rsp), %rsi
	movq	%rdi, 8(%rax)
	movq	152(%rsp), %rdi
	movq	%rsi, (%rax)
	movq	%rdi, 16(%rax)
	movq	80(%rsp), %rdi
	movq	%rdi, 24(%rax)
	jmp	.L2234
	.p2align 4,,10
	.p2align 3
.L2356:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$46, %r8d
	movl	$1, %edx
	leaq	.LC171(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L2216
	.p2align 4,,10
	.p2align 3
.L2204:
	movq	(%r15), %r15
	testq	%r15, %r15
	jne	.L2207
	movl	$40, %ecx
	pxor	%xmm6, %xmm6
	call	alloc_memory
	movl	$16, %ecx
	movq	%rax, %rdi
	call	alloc_memory
	movl	$16, %ecx
	movq	%rax, %rbx
	movq	152(%rsp), %rax
	movq	%rax, (%rbx)
	call	alloc_memory
	movq	%rdi, %r9
	movl	$2, %edx
	movq	%rsi, %rcx
	movups	%xmm6, (%rax)
	movq	144(%rsp), %r8
	movq	%rax, 8(%rbx)
	movq	%rbx, 32(%rdi)
	call	create_symbol
	movl	$16, %ecx
	movq	%rax, %rbx
	call	alloc_memory
	movq	32(%rdi), %r9
	movl	$3, %edx
	movq	144(%rsp), %r8
	movq	40+keywordList(%rip), %rcx
	movups	%xmm6, (%rax)
	movq	%rax, %r15
	call	create_symbol
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L2378
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, %rdx
	movq	144(%rsp), %rax
	movq	%rsi, 8(%rdx)
	movq	%rax, (%rdx)
	movq	$0, 16(%rdx)
.L2209:
	movq	%r15, %rcx
	call	list_append
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	xorl	%r9d, %r9d
	movq	%rsi, %r8
	movups	%xmm0, (%rax)
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	$0, 32(%rsp)
	movq	%rax, 112(%rsp)
	call	create_variable_access
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	movl	$8, %ecx
	call	create_primary
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_expression
	movl	$16, %ecx
	movq	%rax, %rsi
	call	alloc_memory
	movq	112(%rsp), %rcx
	movl	$5, 8(%rax)
	movq	%rax, %rdx
	movq	%rsi, (%rax)
	call	list_append
	testq	%rbx, %rbx
	je	.L2379
	movq	144(%rsp), %rax
	movq	%rbx, (%rdi)
	movq	%r15, 16(%rdi)
	movq	%rax, 8(%rdi)
	movq	112(%rsp), %rax
	movq	%rax, 24(%rdi)
.L2211:
	movq	%rdi, %rdx
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	call	create_class_member
	movq	128(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L2205
	.p2align 4,,10
	.p2align 3
.L2347:
	movl	$16, %ecx
	call	alloc_memory
	movl	$16, %ecx
	movq	$0, (%rax)
	movq	%rax, %rsi
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movups	%xmm0, (%rax)
	movq	160+keywordList(%rip), %rcx
	movl	$6, %edx
	movq	%rax, 8(%rsi)
	movq	%rsi, builtin_scope(%rip)
	call	create_symbol
	movq	builtin_scope(%rip), %r9
	xorl	%r8d, %r8d
	movq	128+keywordList(%rip), %rcx
	movl	$6, %edx
	movq	%rax, name_void(%rip)
	call	create_symbol
	movq	builtin_scope(%rip), %r9
	xorl	%r8d, %r8d
	movq	136+keywordList(%rip), %rcx
	movl	$6, %edx
	movq	%rax, name_int(%rip)
	call	create_symbol
	movq	builtin_scope(%rip), %r9
	xorl	%r8d, %r8d
	movq	144+keywordList(%rip), %rcx
	movl	$6, %edx
	movq	%rax, name_float(%rip)
	call	create_symbol
	movq	builtin_scope(%rip), %r9
	xorl	%r8d, %r8d
	movq	152+keywordList(%rip), %rcx
	movl	$6, %edx
	movq	%rax, name_string(%rip)
	call	create_symbol
	movq	%rax, name_bool(%rip)
	jmp	.L2023
	.p2align 4,,10
	.p2align 3
.L2030:
	movl	$1, %edx
	movq	%r14, %rcx
	call	next_token
	cmpl	$1, 24(%rax)
	movq	%rax, 80(%r14)
	jne	.L2031
	movq	48(%r14), %r10
	movq	(%rax), %rdi
	testq	%r10, %r10
	je	.L2035
	movq	56(%r14), %rax
	movdqu	64(%r14), %xmm0
	movq	%r10, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rax, 16(%r14)
	movups	%xmm0, 32(%r14)
.L2036:
	movq	$0, 144(%rsp)
	movl	24(%r10), %eax
	cmpl	$6, %eax
	je	.L2380
.L2037:
	movq	0(%r13), %rcx
	cmpl	$5, %eax
	jne	.L2038
	movq	72+symbolList(%rip), %rax
	cmpq	%rax, (%r10)
	jne	.L2038
	cmpq	$0, 144(%rsp)
	movq	%r10, 136(%rsp)
	je	.L2381
	call	get_file_dir
	movq	144(%rsp), %rcx
	movq	%rax, %rdx
	call	absolute_path
	movq	136(%rsp), %r10
	movq	%rax, 152(%rsp)
.L2046:
	movq	152(%rsp), %rcx
	leaq	.LC209(%rip), %rdx
	movq	%r10, 136(%rsp)
	call	fopen
	movq	136(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, %r12
	je	.L2382
	movq	%r10, 120(%rsp)
	movq	__imp___acrt_iob_func(%rip), %rsi
	movl	$2, %ecx
	call	*%rsi
	movq	152(%rsp), %r15
	leaq	.LC211(%rip), %rdx
	movq	%rax, %rcx
	movq	%r15, %r8
	call	fprintf
	leaq	184(%rsp), %rdx
	movq	%r12, %rcx
	movq	$0, 184(%rsp)
	call	read_source.constprop.0
	movq	%r12, %rcx
	movq	%rax, 128(%rsp)
	call	fclose
	movl	$32, %ecx
	call	alloc_memory
	xorl	%edx, %edx
	movq	%r15, %rcx
	movq	%r15, 152(%rsp)
	movq	%rax, %r12
	call	absolute_path
	movq	%r12, %rcx
	movq	%rax, 24(%r12)
	call	normalize_path
	movl	$16, %ecx
	call	alloc_memory
	xorl	%r8d, %r8d
	movl	$88, %ecx
	movq	builtin_scope(%rip), %rdx
	movw	%r8w, 8(%rax)
	movq	%rax, %r15
	movq	%r12, (%rax)
	movq	184(%rsp), %r12
	movb	$0, 11(%rax)
	movq	%rdx, 136(%rsp)
	call	alloc_memory
	movq	128(%rsp), %r9
	pxor	%xmm0, %xmm0
	movq	%r15, %r8
	movups	%xmm0, 56(%rax)
	movq	%rax, %rcx
	movq	136(%rsp), %rdx
	movq	%r9, 8(%rax)
	movq	%r12, 24(%rax)
	movq	$0, 16(%rax)
	movq	$0, 32(%rax)
	movq	$0, 40(%rax)
	movq	$0, 48(%rax)
	movq	$0, 72(%rax)
	movq	$0, 80(%rax)
	movq	152(%rsp), %rax
	movq	%rax, (%rcx)
	call	parse_code
	movl	$2, %ecx
	movq	%rax, %r12
	call	*%rsi
	movq	152(%rsp), %r8
	leaq	.LC212(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	testq	%r12, %r12
	movq	120(%rsp), %r10
	je	.L2383
	movq	8(%r12), %rdx
	testq	%rdx, %rdx
	je	.L2050
	movq	%rsi, 128(%rsp)
	movq	%r10, %r15
	movq	%rbx, 136(%rsp)
	movq	%rdx, %rbx
.L2054:
	movq	8(%rbx), %rax
	movq	(%rax), %r12
	testq	%r12, %r12
	jne	.L2053
	jmp	.L2051
	.p2align 4,,10
	.p2align 3
.L2384:
	movq	(%r12), %r12
	testq	%r12, %r12
	je	.L2051
.L2053:
	movq	8(%r12), %rsi
	movq	%rdi, %rdx
	movq	8(%rsi), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L2384
	movq	168(%rsp), %rax
	movq	%rsi, %rdx
	movq	%rsi, %r15
	movq	8(%rax), %rcx
	call	list_append
.L2055:
	movl	$16, %ecx
	call	alloc_memory
	movq	%r15, (%rax)
	movq	%rax, %rdx
	movq	144(%rsp), %rax
	movq	%rax, 8(%rdx)
	jmp	.L2056
	.p2align 4,,10
	.p2align 3
.L2380:
	movq	8+keywordList(%rip), %rax
	cmpq	%rax, (%r10)
	je	.L2317
	movq	0(%r13), %rcx
.L2038:
	movq	16(%r10), %rax
	movq	8(%r10), %rdi
	movq	24(%rcx), %r12
	movq	__imp___acrt_iob_func(%rip), %rsi
	movl	$2, %ecx
	leaq	1(%rax), %r15
	addq	$1, %rdi
	call	*%rsi
	movq	%r15, 32(%rsp)
	movq	%rdi, %r9
	movq	%r12, %r8
	movq	%rax, %rcx
	leaq	.LC206(%rip), %rdx
	call	fprintf
	jmp	.L2034
	.p2align 4,,10
	.p2align 3
.L2074:
	movq	16(%rax), %rsi
	movq	8(%rax), %rdi
	movl	$2, %ecx
	movq	0(%r13), %rax
	leaq	1(%rsi), %r15
	movq	__imp___acrt_iob_func(%rip), %rsi
	addq	$1, %rdi
	movq	24(%rax), %r12
	call	*%rsi
	movq	%r15, 32(%rsp)
	movq	%rdi, %r9
	leaq	.LC220(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	jmp	.L2064
	.p2align 4,,10
	.p2align 3
.L2371:
	movq	(%rbx), %rax
	movq	(%rax), %rax
	cmpq	name_int(%rip), %rax
	je	.L2342
	cmpq	name_float(%rip), %rax
	je	.L2342
	cmpq	name_string(%rip), %rax
	je	.L2342
	cmpq	name_bool(%rip), %rax
	je	.L2193
	cmpq	name_void(%rip), %rax
	je	.L2193
	movl	32(%rax), %eax
	testl	%eax, %eax
	je	.L2342
	movq	16(%rsi), %rax
	movq	8(%rsi), %rbx
	movl	$2, %ecx
	leaq	1(%rax), %rdi
	movq	0(%r13), %rax
	addq	$1, %rbx
	movq	24(%rax), %rsi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC246(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L2192
	.p2align 4,,10
	.p2align 3
.L2342:
	movq	48(%r14), %rax
	addq	$8, 80(%rsp)
	testq	%rax, %rax
	jne	.L2385
.L2196:
	movl	$1, %edx
	movq	%r14, %rcx
	call	next_token
	movq	%rax, 80(%r14)
	jmp	.L2197
	.p2align 4,,10
	.p2align 3
.L2115:
	movl	$1, %edx
	movq	%r14, %rcx
	call	next_token
	movq	%rax, 80(%r14)
	jmp	.L2116
	.p2align 4,,10
	.p2align 3
.L2059:
	movq	%r14, %rcx
	movl	$1, %edx
	call	next_token
	movq	%rax, 80(%r14)
	movq	%rax, %rcx
	jmp	.L2060
	.p2align 4,,10
	.p2align 3
.L2186:
	movl	$1, %edx
	movq	%r14, %rcx
	call	next_token
	movq	%rax, 80(%r14)
	movq	%rax, %rsi
	jmp	.L2187
	.p2align 4,,10
	.p2align 3
.L2051:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2054
	movq	136(%rsp), %rbx
	movq	128(%rsp), %rsi
	movq	%r15, %r10
.L2050:
	movq	%r10, 136(%rsp)
	movl	$2, %ecx
	call	*%rsi
	movq	152(%rsp), %r9
	movq	%rdi, %r8
	leaq	.LC214(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	136(%rsp), %r10
.L2048:
	movq	16(%r10), %rax
	movq	8(%r10), %r12
	movl	$2, %ecx
	leaq	1(%rax), %r15
	movq	0(%r13), %rax
	addq	$1, %r12
	movq	24(%rax), %r8
	movq	%r8, 152(%rsp)
	call	*%rsi
	movq	%r15, 32(%rsp)
	movq	%r12, %r9
	movq	152(%rsp), %r8
	movq	%rax, %rcx
	leaq	.LC215(%rip), %rdx
	call	fprintf
	movq	168(%rsp), %r9
	movl	$3, %edx
	movq	%rdi, %rcx
	movq	name_void(%rip), %r8
	call	create_symbol
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L2055
	movl	$2, %ecx
	call	*%rsi
	movl	$36, %r8d
	movl	$1, %edx
	leaq	.LC216(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L2034
	.p2align 4,,10
	.p2align 3
.L2359:
	movq	(%rax), %rdi
.L2035:
	movl	$1, %edx
	movq	%r14, %rcx
	call	next_token
	movq	%rax, 80(%r14)
	movq	%rax, %r10
	jmp	.L2036
	.p2align 4,,10
	.p2align 3
.L2362:
	movq	16(%r12), %rax
	movq	8(%r12), %rdi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rsi
	leaq	1(%rax), %r15
	movq	0(%r13), %rax
	addq	$1, %rdi
	movq	24(%rax), %r12
	call	*%rsi
	movq	%r15, 32(%rsp)
	movq	%rdi, %r9
	leaq	.LC219(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	jmp	.L2064
	.p2align 4,,10
	.p2align 3
.L2361:
	movl	$1, %edx
	movq	%r14, %rcx
	call	next_token
	movq	%rax, 80(%r14)
	movq	%rax, %r12
	jmp	.L2070
	.p2align 4,,10
	.p2align 3
.L2061:
	movq	(%rcx), %rdx
	jmp	.L2063
.L2139:
	movq	16(%rax), %rdi
	movq	8(%rax), %rsi
	movl	$2, %ecx
	movq	0(%r13), %rax
	movq	__imp___acrt_iob_func(%rip), %rbx
	leaq	1(%rdi), %r15
	addq	$1, %rsi
	movq	24(%rax), %rdi
	call	*%rbx
	movq	%r15, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC234(%rip), %rdx
	movq	%rax, %rcx
	movq	%rdi, %r8
	call	fprintf
.L2129:
	movq	16(%r12), %rax
	movq	8(%r12), %rsi
	movl	$2, %ecx
	leaq	1(%rax), %rdi
	movq	0(%r13), %rax
	addq	$1, %rsi
	movq	24(%rax), %r12
	call	*%rbx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC244(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	movq	$0, 96(%rsp)
.L2184:
	movq	96(%rsp), %rdx
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	call	create_class_member
	movq	128(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L2200
.L2124:
	movl	$1, %edx
	movq	%r14, %rcx
	call	next_token
	movq	%rax, 80(%r14)
	movq	%rax, %r8
	jmp	.L2125
.L2370:
	movq	16(%rsi), %rax
	movl	$2, %ecx
	leaq	1(%rax), %r15
	movq	8(%rsi), %rax
	leaq	1(%rax), %rdi
	movq	0(%r13), %rax
	movq	24(%rax), %r12
	call	*__imp___acrt_iob_func(%rip)
	movq	%r15, 32(%rsp)
	movq	%rdi, %r9
	leaq	.LC245(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	jmp	.L2188
.L2365:
	movq	48(%r14), %r12
	testq	%r12, %r12
	je	.L2086
	movq	56(%r14), %rax
	movdqu	64(%r14), %xmm4
	movq	%r12, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rax, 16(%r14)
	movl	24(%r12), %eax
	movups	%xmm4, 32(%r14)
	jmp	.L2078
.L2374:
	movq	16(%r15), %rax
	movq	8(%r15), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rbx
	leaq	1(%rax), %rdi
	movq	0(%r13), %rax
	addq	$1, %rsi
	movq	24(%rax), %r15
	call	*%rbx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC233(%rip), %rdx
	movq	%rax, %rcx
	movq	%r15, %r8
	call	fprintf
	jmp	.L2129
.L2373:
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r10, 112(%rsp)
	call	next_token
	movq	112(%rsp), %r10
	movq	%rax, 80(%r14)
	movq	%rax, %r15
	jmp	.L2135
.L2126:
	movq	(%r8), %rdx
	jmp	.L2128
.L2119:
	movl	$1, %edx
	movq	%r14, %rcx
	call	next_token
	movq	%rax, 80(%r14)
	movq	%rax, %r12
	jmp	.L2121
.L2127:
	movq	16(%r8), %rax
	movq	8(%r8), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rbx
	leaq	1(%rax), %r15
	movq	0(%r13), %rax
	addq	$1, %rsi
	movq	24(%rax), %rdi
	call	*%rbx
	movq	%r15, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC232(%rip), %rdx
	movq	%rax, %rcx
	movq	%rdi, %r8
	call	fprintf
	jmp	.L2129
.L2086:
	movl	$1, %edx
	movq	%r14, %rcx
	call	next_token
	movq	%rax, 80(%r14)
	movq	%rax, %r12
	movl	24(%rax), %eax
	jmp	.L2078
.L2141:
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r10, 112(%rsp)
	call	next_token
	movq	112(%rsp), %r10
	movq	%rax, 80(%r14)
	jmp	.L2142
.L2101:
	movl	$1, %edx
	movq	%r14, %rcx
	call	next_token
	movq	%rax, 80(%r14)
	movq	%rax, %rbx
	jmp	.L2095
.L2137:
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r10, 112(%rsp)
	call	next_token
	movq	112(%rsp), %r10
	movq	%rax, 80(%r14)
	jmp	.L2138
.L2381:
	movq	%rdi, %rcx
	call	strlen
	xorl	%r8d, %r8d
	leaq	4(%rax), %rdx
	leaq	.LC38(%rip), %rax
	movq	%rax, %rcx
	call	create_string_check
	movq	%rdi, %r8
	leaq	.LC207(%rip), %rdx
	movq	%rax, %rsi
	movq	%rax, %rcx
	call	sprintf
	leaq	.LC208(%rip), %rdx
	movq	%rsi, %rcx
	call	absolute_path
	movq	136(%rsp), %r10
	movq	%rax, 152(%rsp)
	jmp	.L2046
.L2368:
	movq	%rax, 112(%rsp)
	movq	16(%rbx), %rax
	movl	$2, %ecx
	movq	8(%rbx), %r9
	leaq	1(%rax), %rdx
	movq	0(%r13), %rax
	addq	$1, %r9
	movq	%rdx, 120(%rsp)
	movq	%r9, 128(%rsp)
	movq	24(%rax), %rbx
	call	*__imp___acrt_iob_func(%rip)
	movq	120(%rsp), %rdx
	movq	128(%rsp), %r9
	movq	%rax, %rcx
	movq	%rbx, %r8
	movq	%rdx, 32(%rsp)
	leaq	.LC226(%rip), %rdx
	call	fprintf
	movq	112(%rsp), %r10
	jmp	.L2099
.L2358:
	movl	$1, %r8d
	movl	$2, %edx
	movq	%r10, 96(%rsp)
	leaq	.LC250(%rip), %rcx
	call	create_string_check
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movq	$0, 32(%rsp)
	movq	%rax, %rdx
	call	create_primary
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_expression
	movq	96(%rsp), %r10
	movq	%rax, %r9
	jmp	.L2222
.L2076:
	movl	$1, %edx
	movq	%r14, %rcx
	call	next_token
	movq	%rax, 80(%r14)
	movq	%rax, %r12
	jmp	.L2077
.L2367:
	movq	%rax, 112(%rsp)
	movq	16(%rbx), %rax
	movl	$2, %ecx
	movq	8(%rbx), %r9
	leaq	1(%rax), %rdx
	movq	0(%r13), %rax
	addq	$1, %r9
	movq	%rdx, 120(%rsp)
	movq	%r9, 128(%rsp)
	movq	24(%rax), %rbx
	call	*__imp___acrt_iob_func(%rip)
	movq	120(%rsp), %rdx
	movq	128(%rsp), %r9
	movq	%rax, %rcx
	movq	%rbx, %r8
	movq	%rdx, 32(%rsp)
	leaq	.LC225(%rip), %rdx
	call	fprintf
	movq	112(%rsp), %r10
	jmp	.L2100
.L2193:
	addq	$1, 80(%rsp)
	jmp	.L2192
.L2376:
	movq	%r12, 112(%rsp)
	movq	__imp___acrt_iob_func(%rip), %rdi
	movq	%r10, 64(%rsp)
	.p2align 4,,10
	.p2align 3
.L2150:
	movq	(%r15), %rax
	cmpq	8+symbolList(%rip), %rax
	je	.L2386
	cmpq	%rax, 32+symbolList(%rip)
	jne	.L2151
	movq	48(%r14), %r15
	testq	%r15, %r15
	je	.L2152
	movq	56(%r14), %rax
	movdqu	64(%r14), %xmm5
	movq	%r15, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rax, 16(%r14)
	movups	%xmm5, 32(%r14)
.L2153:
	movq	%r13, %r8
	movq	%rbx, %rdx
	movq	%r14, %rcx
	call	parse_variable
	testq	%rax, %rax
	je	.L2387
	cmpq	$0, 16(%rax)
	je	.L2159
	movq	16(%r15), %rax
	movq	8(%r15), %r15
	movl	$2, %ecx
	leaq	1(%rax), %r12
	movq	0(%r13), %rax
	addq	$1, %r15
	movq	24(%rax), %rsi
	call	*%rdi
	movq	%r12, 32(%rsp)
	movq	%r15, %r9
	leaq	.LC238(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
.L2158:
	movq	48(%r14), %r15
	testq	%r15, %r15
	je	.L2160
	movq	56(%r14), %rax
	movdqu	64(%r14), %xmm4
	movq	%r15, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rax, 16(%r14)
	movups	%xmm4, 32(%r14)
.L2161:
	cmpl	$5, 24(%r15)
	je	.L2150
	movq	112(%rsp), %r12
	jmp	.L2149
	.p2align 4,,10
	.p2align 3
.L2152:
	movl	$1, %edx
	movq	%r14, %rcx
	call	next_token
	movq	%rax, 80(%r14)
	movq	%rax, %r15
	jmp	.L2153
	.p2align 4,,10
	.p2align 3
.L2160:
	movl	$1, %edx
	movq	%r14, %rcx
	call	next_token
	movq	%rax, 80(%r14)
	movq	%rax, %r15
	jmp	.L2161
	.p2align 4,,10
	.p2align 3
.L2159:
	movq	88(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L2158
	.p2align 4,,10
	.p2align 3
.L2387:
	movq	16(%r15), %rax
	movq	8(%r15), %r15
	movl	$2, %ecx
	leaq	1(%rax), %r12
	movq	0(%r13), %rax
	addq	$1, %r15
	movq	24(%rax), %rsi
	call	*%rdi
	movq	%r12, 32(%rsp)
	movq	%r15, %r9
	leaq	.LC237(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L2158
.L2151:
	cmpq	8+symbolList(%rip), %rax
	movq	112(%rsp), %r12
	movq	64(%rsp), %r10
	jne	.L2149
.L2164:
	movq	48(%r14), %rax
	testq	%rax, %rax
	je	.L2388
	movq	56(%r14), %rdx
	movdqu	64(%r14), %xmm4
	movq	%rax, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rdx, 16(%r14)
	movups	%xmm4, 32(%r14)
.L2165:
	cmpl	$5, 24(%rax)
	jne	.L2166
	movq	16+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L2166
	movl	$16, %ecx
	movq	%r10, 64(%rsp)
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movl	$257, %ecx
	movq	64(%rsp), %r10
	movups	%xmm0, (%rax)
	movw	%cx, 8(%r13)
	movq	48(%r14), %r9
	movq	%rax, 112(%rsp)
	testq	%r9, %r9
	je	.L2168
	movq	56(%r14), %rax
	movdqu	64(%r14), %xmm3
	movq	%r9, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rax, 16(%r14)
	movups	%xmm3, 32(%r14)
.L2170:
	xorl	%edi, %edi
	movq	%r9, %rsi
	movq	%r10, %r15
	.p2align 4,,10
	.p2align 3
.L2169:
	cmpl	$5, 24(%rsi)
	jne	.L2177
.L2392:
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, (%rsi)
	je	.L2389
.L2177:
	movq	%r13, %r8
	movq	%rbx, %rdx
	movq	%r14, %rcx
	call	parse_statement
	movq	%rax, %r10
	testq	%rax, %rax
	je	.L2390
	testb	%dil, %dil
	jne	.L2391
.L2173:
	cmpl	$5, 8(%r10)
	movl	$1, %eax
	cmove	%eax, %edi
.L2174:
	movq	112(%rsp), %rcx
	movq	%r10, %rdx
	call	list_append
	movq	48(%r14), %rsi
	testq	%rsi, %rsi
	je	.L2175
	movq	56(%r14), %rax
	movdqu	64(%r14), %xmm4
	movq	%rsi, 80(%r14)
	cmpl	$5, 24(%rsi)
	movq	$0, 48(%r14)
	movq	%rax, 16(%r14)
	movups	%xmm4, 32(%r14)
	je	.L2392
	jmp	.L2177
.L2175:
	movl	$1, %edx
	movq	%r14, %rcx
	call	next_token
	movq	%rax, 80(%r14)
	movq	%rax, %rsi
	jmp	.L2169
.L2391:
	movq	%rax, 48(%rsp)
	movq	16(%rsi), %rax
	movl	$2, %ecx
	movq	8(%rsi), %rsi
	leaq	1(%rax), %rdx
	movq	0(%r13), %rax
	movq	%rdx, 56(%rsp)
	addq	$1, %rsi
	movq	24(%rax), %r8
	movq	%r8, 64(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	56(%rsp), %rdx
	movq	64(%rsp), %r8
	movq	%rsi, %r9
	movq	%rax, %rcx
	movq	%rdx, 32(%rsp)
	leaq	.LC226(%rip), %rdx
	call	fprintf
	movq	48(%rsp), %r10
	jmp	.L2173
.L2390:
	movq	%rax, 48(%rsp)
	movq	16(%rsi), %rax
	movl	$2, %ecx
	movq	8(%rsi), %rsi
	leaq	1(%rax), %rdx
	movq	0(%r13), %rax
	movq	%rdx, 56(%rsp)
	addq	$1, %rsi
	movq	24(%rax), %r8
	movq	%r8, 64(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	56(%rsp), %rdx
	movq	64(%rsp), %r8
	movq	%rsi, %r9
	movq	%rax, %rcx
	movq	%rdx, 32(%rsp)
	leaq	.LC241(%rip), %rdx
	call	fprintf
	movq	48(%rsp), %r10
	jmp	.L2174
.L2166:
	movq	16(%rax), %rdi
	movq	8(%rax), %rsi
	movl	$2, %ecx
	movq	0(%r13), %rax
	movq	__imp___acrt_iob_func(%rip), %rbx
	leaq	1(%rdi), %r15
	addq	$1, %rsi
	movq	24(%rax), %rdi
	call	*%rbx
	movq	%r15, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC239(%rip), %rdx
	movq	%rax, %rcx
	movq	%rdi, %r8
	call	fprintf
	jmp	.L2129
.L2317:
	movq	48(%r14), %rax
	testq	%rax, %rax
	je	.L2039
	movq	56(%r14), %rdx
	movdqu	64(%r14), %xmm5
	movq	%rax, 80(%r14)
	cmpl	$4, 24(%rax)
	movq	$0, 48(%r14)
	movq	%rdx, 16(%r14)
	movups	%xmm5, 32(%r14)
	je	.L2393
.L2040:
	movq	16(%rax), %rdi
	movq	__imp___acrt_iob_func(%rip), %rsi
	movl	$2, %ecx
	leaq	1(%rdi), %r15
	movq	8(%rax), %rdi
	movq	0(%r13), %rax
	movq	24(%rax), %r12
	addq	$1, %rdi
	call	*%rsi
	movq	%r15, 32(%rsp)
	movq	%rdi, %r9
	leaq	.LC205(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	jmp	.L2034
.L2377:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$51, %r8d
	movl	$1, %edx
	leaq	.LC243(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L2233
.L2145:
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r10, 112(%rsp)
	call	next_token
	movq	112(%rsp), %r10
	movq	%rax, 80(%r14)
	movq	%rax, %r15
	jmp	.L2146
.L2389:
	xorl	%edx, %edx
	movq	%r15, %r10
	movw	%dx, 8(%r13)
	testb	%dil, %dil
	jne	.L2179
	cmpq	%r15, name_void(%rip)
	je	.L2181
	movq	16(%rsi), %rax
	movq	%r15, 64(%rsp)
	movl	$2, %ecx
	movq	8(%rsi), %rdi
	leaq	1(%rax), %r15
	movq	0(%r13), %rax
	addq	$1, %rdi
	movq	24(%rax), %rsi
	call	*__imp___acrt_iob_func(%rip)
	movq	%r15, 32(%rsp)
	movq	%rdi, %r9
	leaq	.LC242(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	movq	64(%rsp), %r10
	cmpq	%r10, name_void(%rip)
	je	.L2181
.L2179:
	cmpq	$0, 72(%rsp)
	je	.L2394
	movq	96(%rsp), %rax
	movq	72(%rsp), %rdi
	movq	%rdi, (%rax)
	movq	88(%rsp), %rdi
	movq	%r10, 8(%rax)
	movq	%rdi, 16(%rax)
	movq	112(%rsp), %rdi
	movq	%rbx, 32(%rax)
	movq	%rdi, 24(%rax)
	jmp	.L2184
.L2092:
	movq	16(%rax), %rdi
	movq	__imp___acrt_iob_func(%rip), %rsi
	movl	$2, %ecx
	leaq	1(%rdi), %r15
	movq	8(%rax), %rdi
	movq	0(%r13), %rax
	movq	24(%rax), %r12
	addq	$1, %rdi
	call	*%rsi
	movq	%r15, 32(%rsp)
	movq	%rdi, %r9
	leaq	.LC224(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	jmp	.L2064
.L2388:
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r10, 112(%rsp)
	call	next_token
	movq	112(%rsp), %r10
	movq	%rax, 80(%r14)
	jmp	.L2165
.L2382:
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rsi
	call	*%rsi
	movq	152(%rsp), %r8
	leaq	.LC210(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	136(%rsp), %r10
	jmp	.L2048
.L2375:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$1, %edx
	movl	$46, %r8d
	leaq	.LC171(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	movq	112(%rsp), %r10
	xorl	%edx, %edx
	jmp	.L2148
.L2383:
	movq	%r10, 136(%rsp)
	movl	$2, %ecx
	call	*%rsi
	movq	152(%rsp), %r8
	leaq	.LC213(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	136(%rsp), %r10
	jmp	.L2048
.L2366:
	movq	%rbx, %r9
	movb	$0, 8(%r13)
	movq	96(%rsp), %rbx
	testb	%r12b, %r12b
	jne	.L2105
	cmpq	%r15, name_void(%rip)
	je	.L2107
	movq	16(%r9), %rax
	movq	8(%r9), %r12
	movl	$2, %ecx
	leaq	1(%rax), %rdx
	movq	0(%r13), %rax
	addq	$1, %r12
	movq	%rdx, 120(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 128(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	120(%rsp), %rdx
	movq	128(%rsp), %r8
	movq	%r12, %r9
	movq	%rax, %rcx
	movq	%rdx, 32(%rsp)
	leaq	.LC227(%rip), %rdx
	call	fprintf
	cmpq	%r15, name_void(%rip)
	je	.L2107
.L2105:
	cmpq	$0, 144(%rsp)
	je	.L2395
	movq	144(%rsp), %rax
	movq	%r15, 8(%rdi)
	movq	%rsi, 32(%rdi)
	movq	%rax, (%rdi)
	movq	152(%rsp), %rax
	movq	%rax, 16(%rdi)
	movq	136(%rsp), %rax
	movq	%rax, 24(%rdi)
	jmp	.L2110
.L2386:
	movq	112(%rsp), %r12
	movq	64(%rsp), %r10
	jmp	.L2164
.L2090:
	movl	$1, %edx
	movq	%r14, %rcx
	call	next_token
	movq	%rax, 80(%r14)
	jmp	.L2091
.L2039:
	movl	$1, %edx
	movq	%r14, %rcx
	call	next_token
	cmpl	$4, 24(%rax)
	movq	%rax, 80(%r14)
	jne	.L2040
	movq	(%rax), %rax
	movq	48(%r14), %r10
	movq	%rax, 144(%rsp)
	testq	%r10, %r10
	je	.L2043
	movq	56(%r14), %rax
	movdqu	64(%r14), %xmm3
	movq	%r10, 80(%r14)
	movq	$0, 48(%r14)
	movq	%rax, 16(%r14)
	movl	24(%r10), %eax
	movups	%xmm3, 32(%r14)
	jmp	.L2037
.L2378:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$1, %edx
	movl	$46, %r8d
	leaq	.LC171(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	xorl	%edx, %edx
	jmp	.L2209
.L2393:
	movq	(%rax), %rax
	movq	%rax, 144(%rsp)
.L2043:
	movl	$1, %edx
	movq	%r14, %rcx
	call	next_token
	movq	%rax, 80(%r14)
	movq	%rax, %r10
	movl	24(%rax), %eax
	jmp	.L2037
.L2168:
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r10, 64(%rsp)
	call	next_token
	movq	64(%rsp), %r10
	movq	%rax, 80(%r14)
	movq	%rax, %r9
	jmp	.L2170
.L2181:
	movl	$16, %ecx
	movq	%r10, 64(%rsp)
	call	alloc_memory
	movq	112(%rsp), %rcx
	movl	$5, 8(%rax)
	movq	%rax, %rdx
	movq	$0, (%rax)
	call	list_append
	movq	64(%rsp), %r10
	jmp	.L2179
.L2379:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$51, %r8d
	movl	$1, %edx
	leaq	.LC243(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L2211
.L2094:
	movl	$1, %edx
	movq	%r14, %rcx
	call	next_token
	movq	%rax, 80(%r14)
	movq	%rax, %r9
	jmp	.L2096
.L2107:
	movl	$16, %ecx
	call	alloc_memory
	movq	136(%rsp), %rcx
	movl	$5, 8(%rax)
	movq	%rax, %rdx
	movq	$0, (%rax)
	call	list_append
	jmp	.L2105
.L2394:
	movq	__imp___acrt_iob_func(%rip), %rbx
	movl	$2, %ecx
	call	*%rbx
	movl	$51, %r8d
	movl	$1, %edx
	leaq	.LC243(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L2129
.L2395:
	movq	__imp___acrt_iob_func(%rip), %rsi
	movl	$2, %ecx
	call	*%rsi
	movl	$53, %r8d
	movl	$1, %edx
	leaq	.LC228(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L2064
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC256:
	.ascii "NULL\0"
.LC257:
	.ascii "Usage: %s <filename>\12\0"
.LC258:
	.ascii "Error opening file: %s\12\0"
.LC259:
	.ascii ".token\0"
.LC260:
	.ascii "w\0"
.LC261:
	.ascii "\12info by lib:\12    %s\12\0"
	.align 8
.LC262:
	.ascii "Token(Type: EOF,         Line: %zu, Column: %zu)\12\0"
	.align 8
.LC263:
	.ascii "Token(Type: identifier,  Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC264:
	.ascii "Token(Type: integer,     Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC265:
	.ascii "Token(Type: float,       Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC266:
	.ascii "Token(Type: string,      Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC267:
	.ascii "Token(Type: symbol,      Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC268:
	.ascii "Token(Type: keyword,     Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC269:
	.ascii "Token(Type: comment,     Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC270:
	.ascii "\\0\0"
.LC271:
	.ascii "\\n\0"
.LC272:
	.ascii "\\t\0"
.LC273:
	.ascii "\\r\0"
.LC274:
	.ascii "'\12\0"
.LC275:
	.ascii ".ast\0"
.LC276:
	.ascii ".tc\0"
.LC277:
	.ascii ".tac\0"
.LC278:
	.ascii "import\12\0"
.LC279:
	.ascii "source: \"%s\"\12\0"
.LC280:
	.ascii "parameters\12\0"
.LC281:
	.ascii "parameters[%d]\12\0"
.LC282:
	.ascii "class\12\0"
.LC283:
	.ascii "members\12\0"
.LC284:
	.ascii "method\12\0"
.LC285:
	.ascii "variable\12\0"
.LC286:
	.ascii "unknown_ClassMemberType: %u\12\0"
.LC287:
	.ascii "unknown_CodeMemberType: %u\12\0"
.LC288:
	.ascii "TAC {\12\0"
.LC289:
	.ascii "main\0"
	.align 8
.LC290:
	.ascii "[Warning] Unsupported symbol kind for import: %d\12\0"
.LC291:
	.ascii "designs: []\12\0"
.LC292:
	.ascii "designs: [\12\0"
.LC293:
	.ascii "NULL \0"
.LC294:
	.ascii "%s \0"
.LC295:
	.ascii "%zu \0"
.LC296:
	.ascii "{}\12\0"
.LC297:
	.ascii "{\12\0"
.LC298:
	.ascii "NULL\11\0"
.LC299:
	.ascii "%s\11\0"
.LC300:
	.ascii "%s(%s) \0"
.LC301:
	.ascii "%zu\12\0"
.LC302:
	.ascii "}\12\0"
.LC303:
	.ascii "]\12\0"
.LC304:
	.ascii "entry_point: \"NULL\"\12\0"
.LC305:
	.ascii "entry_point: %s\12\0"
.LC306:
	.ascii "global: []\12\0"
.LC307:
	.ascii "global: [\12\0"
.LC308:
	.ascii "subroutines: []\12\0"
.LC309:
	.ascii "subroutines: [\12\0"
.LC310:
	.ascii "NULL {\12\0"
.LC311:
	.ascii "%s {\12\0"
.LC312:
	.ascii "return_type: \"NULL\"\12\0"
.LC313:
	.ascii "return_type: %s\12\0"
.LC314:
	.ascii "parameters: []\12\0"
.LC315:
	.ascii "parameters: [\12\0"
.LC316:
	.ascii "local: []\12\0"
.LC317:
	.ascii "local: [\12\0"
.LC318:
	.ascii "instructions: []\12\0"
.LC319:
	.ascii "instructions: [\12\0"
.LC320:
	.ascii "add\11\0"
.LC321:
	.ascii "sub\11\0"
.LC322:
	.ascii "mul\11\0"
.LC323:
	.ascii "div\11\0"
.LC324:
	.ascii "mod\11\0"
.LC325:
	.ascii "eq \11\0"
.LC326:
	.ascii "ne \11\0"
.LC327:
	.ascii "lt \11\0"
.LC328:
	.ascii "gt \11\0"
.LC329:
	.ascii "le \11\0"
.LC330:
	.ascii "ge \11\0"
.LC331:
	.ascii "and\11\0"
.LC332:
	.ascii "or \11\0"
.LC333:
	.ascii "not\11\0"
.LC334:
	.ascii "assign\11\0"
.LC335:
	.ascii "get_attr\11\0"
.LC336:
	.ascii "get_elem\11\0"
.LC337:
	.ascii "param\11\0"
.LC338:
	.ascii "alloc\11\0"
.LC339:
	.ascii "jmp_c\11\0"
.LC340:
	.ascii "jmp\11\0"
.LC341:
	.ascii "ret\11\0"
.LC342:
	.ascii "call\11\0"
.LC343:
	.ascii "load\11\0"
.LC344:
	.ascii "store\11\0"
.LC345:
	.ascii "INST_NONE\12\0"
.LC346:
	.ascii "unknown_InstructionType: %u\12\0"
	.section	.text.unlikely,"x"
.LCOLDB347:
	.section	.text.startup,"x"
.LHOTB347:
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
main:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	movl	%ecx, %esi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$144, %rsp
	movups	%xmm6, 144(%rsp)
	call	__main
	cmpl	$1, %esi
	jle	.L2964
	cmpb	$0, initialized(%rip)
	jne	.L2399
	call	init.part.0
.L2399:
	movq	8(%rbx), %rsi
	movl	$32, %ecx
	call	alloc_memory
	xorl	%edx, %edx
	movq	%rsi, %rcx
	movq	%rax, %rbx
	call	absolute_path
	movq	%rbx, %rcx
	movq	%rax, 24(%rbx)
	call	normalize_path
	movq	24(%rbx), %rdi
	leaq	.LC209(%rip), %rdx
	movq	$0, 104(%rsp)
	movq	%rdi, %rcx
	call	fopen
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L2965
	leaq	104(%rsp), %rdx
	movq	%rax, %rcx
	movq	%rdi, %xmm6
	call	read_source.constprop.0
	movq	%rsi, %rcx
	movq	%rax, %xmm3
	punpcklqdq	%xmm3, %xmm6
	call	fclose
	movq	104(%rsp), %rsi
	movl	$88, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movl	$1, %r8d
	movl	$6, %edx
	movq	%rsi, 24(%rax)
	leaq	.LC259(%rip), %rcx
	movq	%rax, %r15
	movq	$0, 16(%rax)
	movq	$0, 32(%rax)
	movq	$0, 40(%rax)
	movq	$0, 48(%rax)
	movq	$0, 72(%rax)
	movq	$0, 80(%rax)
	movups	%xmm0, 56(%rax)
	movups	%xmm6, (%rax)
	call	create_string_check
	movq	%rbx, %rcx
	movq	%rax, 8(%rbx)
	call	rebuild_full_path
	movq	24(%rbx), %rsi
	leaq	.LC260(%rip), %rdx
	movq	%rsi, %rcx
	call	fopen
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L2966
	movq	48(%r15), %rdi
	testq	%rdi, %rdi
	je	.L2404
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm5
	movq	%rdi, 80(%r15)
	movq	%rax, 16(%r15)
	xorl	%eax, %eax
	movq	%rax, 48(%r15)
	movups	%xmm5, 32(%r15)
.L2405:
	movq	%rbx, 80(%rsp)
	leaq	.LC273(%rip), %r14
	.p2align 4,,10
	.p2align 3
.L2427:
	cmpl	$7, 24(%rdi)
	ja	.L2407
	movl	24(%rdi), %eax
	leaq	.L2409(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	movq	16(%rdi), %rdx
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L2409:
	.long	.L2416-.L2409
	.long	.L2415-.L2409
	.long	.L2414-.L2409
	.long	.L2413-.L2409
	.long	.L2412-.L2409
	.long	.L2411-.L2409
	.long	.L2410-.L2409
	.long	.L2408-.L2409
	.section	.text.startup,"x"
.L2410:
	movq	8(%rdi), %rax
	leaq	1(%rdx), %r9
	movq	%r12, %rcx
	leaq	.LC268(%rip), %rdx
	leaq	1(%rax), %r8
	call	fprintf
	.p2align 4,,10
	.p2align 3
.L2407:
	xorl	%esi, %esi
	leaq	.LC270(%rip), %r13
	jmp	.L2418
	.p2align 4,,10
	.p2align 3
.L2419:
	cmpb	$10, %cl
	je	.L2967
	cmpb	$9, %cl
	je	.L2968
	cmpb	$13, %cl
	je	.L2969
	movq	%r12, %rdx
	call	fputc
.L2420:
	addq	$1, %rsi
.L2418:
	movq	(%rdi), %rbx
	movq	%rbx, %rcx
	call	strlen
	cmpq	%rax, %rsi
	jnb	.L2970
	movsbl	(%rbx,%rsi), %ecx
	testb	%cl, %cl
	jne	.L2419
	movq	%r12, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%r13, %rcx
	call	fwrite
	jmp	.L2420
.L2412:
	movq	8(%rdi), %rax
	leaq	1(%rdx), %r9
	movq	%r12, %rcx
	leaq	.LC266(%rip), %rdx
	leaq	1(%rax), %r8
	call	fprintf
	jmp	.L2407
.L2413:
	movq	8(%rdi), %rax
	leaq	1(%rdx), %r9
	movq	%r12, %rcx
	leaq	.LC265(%rip), %rdx
	leaq	1(%rax), %r8
	call	fprintf
	jmp	.L2407
.L2411:
	movq	8(%rdi), %rax
	leaq	1(%rdx), %r9
	movq	%r12, %rcx
	leaq	.LC267(%rip), %rdx
	leaq	1(%rax), %r8
	call	fprintf
	jmp	.L2407
.L2414:
	movq	8(%rdi), %rax
	leaq	1(%rdx), %r9
	movq	%r12, %rcx
	leaq	.LC264(%rip), %rdx
	leaq	1(%rax), %r8
	call	fprintf
	jmp	.L2407
.L2415:
	movq	8(%rdi), %rax
	leaq	1(%rdx), %r9
	movq	%r12, %rcx
	leaq	.LC263(%rip), %rdx
	leaq	1(%rax), %r8
	call	fprintf
	jmp	.L2407
.L2416:
	movq	8(%rdi), %rax
	leaq	1(%rdx), %r9
	movq	%r12, %rcx
	leaq	.LC262(%rip), %rdx
	leaq	1(%rax), %r8
	call	fprintf
	movl	24(%rdi), %eax
	testl	%eax, %eax
	je	.L2944
	.p2align 4,,10
	.p2align 3
.L2974:
	movq	48(%r15), %rdi
	testq	%rdi, %rdi
	je	.L2425
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm1
	movq	%rdi, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rax, 16(%r15)
	movups	%xmm1, 32(%r15)
	jmp	.L2427
.L2408:
	movq	8(%rdi), %rax
	leaq	1(%rdx), %r9
	movq	%r12, %rcx
	leaq	.LC269(%rip), %rdx
	leaq	1(%rax), %r8
	call	fprintf
	jmp	.L2407
.L2966:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, %r8
	leaq	.LC258(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L2403:
	movq	$0, 16(%r15)
	pxor	%xmm6, %xmm6
	movl	$16, %ecx
	xorl	%r14d, %r14d
	movq	$0, 48(%r15)
	movq	$0, 72(%r15)
	movq	$0, 80(%r15)
	movups	%xmm6, 32(%r15)
	movups	%xmm6, 56(%r15)
	call	alloc_memory
	movq	builtin_scope(%rip), %rdx
	movq	%r15, %rcx
	movw	%r14w, 8(%rax)
	movq	%rax, %r8
	movb	$0, 11(%rax)
	movq	%rbx, (%rax)
	call	parse_code
	movl	$1, %r8d
	movl	$4, %edx
	leaq	.LC275(%rip), %rcx
	movq	%rax, %rdi
	call	create_string_check
	movq	%rbx, %rcx
	movq	%rax, 8(%rbx)
	call	rebuild_full_path
	movl	$1, %r8d
	movl	$3, %edx
	leaq	.LC276(%rip), %rcx
	movq	24(%rbx), %rsi
	call	create_string_check
	movq	%rbx, %rcx
	movq	%rax, 8(%rbx)
	call	rebuild_full_path
	leaq	.LC260(%rip), %rdx
	movq	%rsi, %rcx
	call	fopen
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L2971
	movq	(%rdi), %rsi
	testq	%rsi, %rsi
	je	.L2502
	movl	$16, %ecx
	call	alloc_memory
	movq	%rdi, 40(%rsp)
	movups	%xmm6, (%rax)
	movdqu	(%rsi), %xmm0
	leaq	.LC1(%rip), %rsi
	movq	%rax, 64(%rsp)
	movq	%rbx, 32(%rsp)
	movups	%xmm0, 80(%rsp)
	movups	%xmm0, (%rax)
	.p2align 4,,10
	.p2align 3
.L2434:
	movq	64(%rsp), %rdi
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L2950
	movq	(%rax), %rdx
	movq	%rdx, (%rdi)
	testq	%rdx, %rdx
	je	.L2972
.L2503:
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	je	.L2950
	movzbl	112(%rsp), %eax
	movl	8(%rbx), %edx
	movq	%r14, %r9
	movl	$10, %r8d
	orl	$2, %eax
	movb	%al, 112(%rsp)
	cmpl	$1, %edx
	je	.L2435
	cmpl	$2, %edx
	je	.L2436
	testl	%edx, %edx
	movl	$1, %edx
	jne	.L2437
	leaq	.LC3(%rip), %r15
	leaq	.LC0(%rip), %rdi
	movq	%r15, %rcx
	call	fwrite
	movq	%r14, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC278(%rip), %rcx
	call	fwrite
	movzbl	112(%rsp), %eax
	movq	(%rbx), %rbx
	movq	%r14, %rcx
	movl	%eax, %edx
	orl	$4, %edx
	testb	$2, %al
	movb	%dl, 112(%rsp)
	movq	%rdi, %rdx
	cmove	%rsi, %rdx
	call	fprintf
	movq	%r14, %r9
	movl	$1, %edx
	movq	%r15, %rcx
	movl	$10, %r8d
	call	fwrite
	movq	%r14, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC65(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rcx
	leaq	112(%rsp), %r9
	movq	%r14, %rdx
	movl	$3, %r8d
	call	output_name
	movzbl	112(%rsp), %eax
	movq	%r14, %rcx
	movl	%eax, %edx
	andl	$-5, %edx
	testb	$2, %al
	cmove	%rsi, %rdi
	movb	%dl, 112(%rsp)
	movq	%rdi, %rdx
	call	fprintf
	movl	$10, %r8d
	movq	%r14, %r9
	movl	$1, %edx
	leaq	.LC2(%rip), %rcx
	call	fwrite
	movq	8(%rbx), %r8
	testq	%r8, %r8
	je	.L2973
.L2440:
	leaq	.LC279(%rip), %rdx
	movq	%r14, %rcx
	call	fprintf
	jmp	.L2434
	.p2align 4,,10
	.p2align 3
.L2969:
	movq	%r12, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%r14, %rcx
	call	fwrite
	jmp	.L2420
	.p2align 4,,10
	.p2align 3
.L2967:
	movq	%r12, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC271(%rip), %rcx
	call	fwrite
	jmp	.L2420
	.p2align 4,,10
	.p2align 3
.L2970:
	movq	%r12, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC274(%rip), %rcx
	call	fwrite
	movl	24(%rdi), %eax
	testl	%eax, %eax
	jne	.L2974
.L2944:
	movq	80(%rsp), %rbx
.L2406:
	call	get_info
	movq	%r12, %rcx
	leaq	.LC261(%rip), %rdx
	movq	%rax, %r8
	call	fprintf
	movq	%r12, %rcx
	call	fclose
	jmp	.L2403
	.p2align 4,,10
	.p2align 3
.L2968:
	movq	%r12, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC272(%rip), %rcx
	call	fwrite
	jmp	.L2420
	.p2align 4,,10
	.p2align 3
.L2425:
	xorl	%edx, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 80(%r15)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L2427
	jmp	.L2944
.L2950:
	movq	40(%rsp), %rdi
	movq	32(%rsp), %rbx
.L2502:
	call	get_info
	movq	%r14, %rcx
	leaq	.LC261(%rip), %rdx
	movq	%rax, %r8
	call	fprintf
	movq	%r14, %rcx
	call	fclose
.L2432:
	movl	$1, %r8d
	movl	$4, %edx
	leaq	.LC277(%rip), %rcx
	call	create_string_check
	movq	%rbx, %rcx
	movq	%rax, 8(%rbx)
	call	rebuild_full_path
	movl	$1, %r8d
	movl	$3, %edx
	leaq	.LC276(%rip), %rcx
	movq	24(%rbx), %rsi
	call	create_string_check
	movq	%rbx, %rcx
	movq	%rax, 8(%rbx)
	call	rebuild_full_path
	leaq	.LC260(%rip), %rdx
	movq	%rsi, %rcx
	call	fopen
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L2975
	movl	$32, %ecx
	pxor	%xmm6, %xmm6
	xorl	%r12d, %r12d
	call	alloc_memory
	movl	$16, %ecx
	movq	%rax, %r13
	call	alloc_memory
	xorl	%r11d, %r11d
	movl	$16, %ecx
	movups	%xmm6, (%rax)
	movq	%r11, 8(%r13)
	movq	%rax, 0(%r13)
	call	alloc_memory
	movl	$16, %ecx
	movups	%xmm6, (%rax)
	movq	%rax, 16(%r13)
	call	alloc_memory
	movl	$96, %ecx
	movups	%xmm6, (%rax)
	movq	%rax, 24(%r13)
	call	alloc_memory
	movl	$16, %ecx
	movq	%r13, (%rax)
	movq	%rax, %rsi
	movq	%r12, 8(%rax)
	movq	%r12, 16(%rax)
	call	alloc_memory
	movl	$16, %ecx
	movups	%xmm6, (%rax)
	movq	%rax, 32(%rsi)
	call	alloc_memory
	movq	(%rdi), %rdi
	movups	%xmm6, (%rax)
	movq	%rax, 40(%rsi)
	movups	%xmm6, 48(%rsi)
	movups	%xmm6, 64(%rsi)
	movups	%xmm6, 80(%rsi)
	testq	%rdi, %rdi
	je	.L2528
	movl	$16, %ecx
	call	alloc_memory
	movq	%rbx, 72(%rsp)
	movups	%xmm6, (%rax)
	movdqu	(%rdi), %xmm4
	movq	%rax, %r14
	pxor	%xmm6, %xmm6
	movups	%xmm4, (%rax)
	movq	%xmm4, %rax
	.p2align 4,,10
	.p2align 3
.L2509:
	testq	%rax, %rax
	je	.L2951
	movq	(%rax), %rdx
	movq	%rdx, (%r14)
	testq	%rdx, %rdx
	je	.L2976
.L2529:
	movq	8(%rax), %rdi
	testq	%rdi, %rdi
	je	.L2951
	movl	8(%rdi), %ecx
	cmpl	$1, %ecx
	je	.L2977
	cmpl	$2, %ecx
	je	.L2978
	movq	%rdx, %rax
	testl	%ecx, %ecx
	jne	.L2509
	movq	(%rdi), %rax
	movq	%rsi, %r9
	movl	$118, %r8d
	movq	(%rax), %rcx
	movl	32(%rcx), %edi
	cmpl	$3, %edi
	je	.L2963
	leal	-1(%rdi), %eax
	cmpl	$1, %eax
	jbe	.L2979
	testl	%edi, %edi
	jne	.L2527
	movq	24(%rcx), %rcx
	movq	%rsi, %rdx
	call	tac_class
	movq	(%r14), %rax
	jmp	.L2509
.L2951:
	movq	72(%rsp), %rbx
.L2528:
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC288(%rip), %rcx
	call	fwrite
	movq	0(%r13), %rax
	testq	%rax, %rax
	je	.L2980
	cmpq	$0, (%rax)
	movl	$4, %esi
	je	.L2532
	cmpq	$0, 8(%rax)
	je	.L2532
	.p2align 4,,10
	.p2align 3
.L2531:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2531
	movq	%rbx, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC292(%rip), %rcx
	leaq	.LC302(%rip), %rdi
	call	fwrite
	movq	0(%r13), %rax
	movq	%rdi, 80(%rsp)
	testq	%rax, %rax
	je	.L2534
	leaq	.LC294(%rip), %r15
	leaq	.LC299(%rip), %r14
	.p2align 4,,10
	.p2align 3
.L2535:
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L2534
	movq	(%rdx), %rcx
	movq	%rcx, (%rax)
	testq	%rcx, %rcx
	je	.L2981
.L2558:
	movq	8(%rdx), %r12
	testq	%r12, %r12
	je	.L2534
	cmpq	$0, 8(%r12)
	movl	$8, %esi
	je	.L2537
	.p2align 4,,10
	.p2align 3
.L2536:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2536
	movq	8(%r12), %rax
	movq	%r15, %rdx
	movq	%rbx, %rcx
	movq	8(%rax), %r8
	call	fprintf
.L2538:
	movq	16(%r12), %r8
	leaq	.LC295(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	movq	(%r12), %rax
	testq	%rax, %rax
	je	.L2539
	cmpq	$0, (%rax)
	je	.L2539
	cmpq	$0, 8(%rax)
	je	.L2539
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC297(%rip), %rcx
	call	fwrite
	movq	(%r12), %rax
	testq	%rax, %rax
	je	.L2542
	.p2align 4,,10
	.p2align 3
.L2543:
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L2542
	movq	(%rdx), %rcx
	movq	%rcx, (%rax)
	testq	%rcx, %rcx
	je	.L2982
.L2553:
	movq	8(%rdx), %rdi
	testq	%rdi, %rdi
	je	.L2542
	cmpq	$0, 8(%rdi)
	movl	$12, %esi
	je	.L2545
	.p2align 4,,10
	.p2align 3
.L2544:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2544
	movq	8(%rdi), %rax
	movq	%r14, %rdx
	movq	%rbx, %rcx
	movq	8(%rax), %r8
	call	fprintf
.L2546:
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L2983
	movq	(%rax), %rdx
	movq	8(%rax), %r8
	testq	%rdx, %rdx
	je	.L2549
	movq	8(%rdx), %r9
	movq	%rbx, %rcx
	leaq	.LC300(%rip), %rdx
	call	fprintf
.L2548:
	movq	16(%rdi), %r8
	leaq	.LC301(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	movq	(%r12), %rax
	testq	%rax, %rax
	jne	.L2543
.L2542:
	movl	$8, %esi
	.p2align 4,,10
	.p2align 3
.L2552:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2552
	movq	80(%rsp), %rcx
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	call	fwrite
.L2541:
	movq	0(%r13), %rax
	testq	%rax, %rax
	jne	.L2535
.L2534:
	movl	$4, %esi
	.p2align 4,,10
	.p2align 3
.L2557:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2557
	leaq	.LC303(%rip), %r10
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%r10, %rcx
	call	fwrite
	jmp	.L2533
	.p2align 4,,10
	.p2align 3
.L2980:
	movl	$4, %esi
.L2532:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2532
	movq	%rbx, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC291(%rip), %rcx
	call	fwrite
	leaq	.LC302(%rip), %rax
	movq	%rax, 80(%rsp)
.L2533:
	cmpq	$0, 8(%r13)
	movl	$4, %esi
	je	.L2561
	.p2align 4,,10
	.p2align 3
.L2560:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2560
	movq	8(%r13), %rax
	leaq	.LC305(%rip), %rdx
	movq	%rbx, %rcx
	movq	8(%rax), %r8
	call	fprintf
.L2562:
	movq	16(%r13), %rax
	movl	$4, %esi
	testq	%rax, %rax
	je	.L2565
	cmpq	$0, (%rax)
	je	.L2565
	cmpq	$0, 8(%rax)
	je	.L2565
	.p2align 4,,10
	.p2align 3
.L2564:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2564
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC307(%rip), %rcx
	call	fwrite
	movq	16(%r13), %rax
	testq	%rax, %rax
	jne	.L2568
	jmp	.L2567
	.p2align 4,,10
	.p2align 3
.L2572:
	movq	8(%rdx), %rcx
	testq	%rcx, %rcx
	je	.L2567
	movl	$2, %r8d
	movq	%rbx, %rdx
	call	output_var
	movq	16(%r13), %rax
	testq	%rax, %rax
	je	.L2567
.L2568:
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L2567
	movq	(%rdx), %rcx
	movq	%rcx, (%rax)
	testq	%rcx, %rcx
	jne	.L2572
	xorl	%r8d, %r8d
	movq	%r8, 8(%rax)
	jmp	.L2572
	.p2align 4,,10
	.p2align 3
.L2561:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2561
	movq	%rbx, %r9
	movl	$20, %r8d
	movl	$1, %edx
	leaq	.LC304(%rip), %rcx
	call	fwrite
	jmp	.L2562
	.p2align 4,,10
	.p2align 3
.L2565:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2565
	movq	%rbx, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC306(%rip), %rcx
	call	fwrite
.L2566:
	movq	24(%r13), %rax
	movl	$4, %esi
	testq	%rax, %rax
	je	.L2576
	cmpq	$0, (%rax)
	je	.L2576
	cmpq	$0, 8(%rax)
	je	.L2576
	.p2align 4,,10
	.p2align 3
.L2575:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2575
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC309(%rip), %rcx
	call	fwrite
	movq	24(%r13), %rax
	leaq	.LC303(%rip), %r10
	testq	%rax, %rax
	je	.L2577
	movq	%r13, 72(%rsp)
	leaq	.L2623(%rip), %r14
	movq	%r10, 64(%rsp)
	.p2align 4,,10
	.p2align 3
.L2578:
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L2959
	movq	(%rdx), %rcx
	movq	%rcx, (%rax)
	testq	%rcx, %rcx
	je	.L2984
.L2668:
	movq	8(%rdx), %rdi
	testq	%rdi, %rdi
	je	.L2959
	cmpq	$0, (%rdi)
	movl	$8, %esi
	je	.L2580
	.p2align 4,,10
	.p2align 3
.L2579:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2579
	movq	(%rdi), %rax
	leaq	.LC311(%rip), %rdx
	movq	%rbx, %rcx
	movq	8(%rax), %r8
	call	fprintf
.L2581:
	cmpq	$0, 8(%rdi)
	movl	$12, %esi
	je	.L2583
	.p2align 4,,10
	.p2align 3
.L2582:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2582
	movq	8(%rdi), %rax
	leaq	.LC313(%rip), %rdx
	movq	%rbx, %rcx
	movq	8(%rax), %r8
	call	fprintf
.L2584:
	movq	16(%rdi), %rax
	movl	$12, %esi
	testq	%rax, %rax
	je	.L2587
	cmpq	$0, (%rax)
	je	.L2587
	cmpq	$0, 8(%rax)
	je	.L2587
	.p2align 4,,10
	.p2align 3
.L2586:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2586
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC315(%rip), %rcx
	call	fwrite
	movq	16(%rdi), %rax
	testq	%rax, %rax
	jne	.L2590
	jmp	.L2589
	.p2align 4,,10
	.p2align 3
.L2594:
	movq	8(%rdx), %rcx
	testq	%rcx, %rcx
	je	.L2589
	movl	$4, %r8d
	movq	%rbx, %rdx
	call	output_var
	movq	16(%rdi), %rax
	testq	%rax, %rax
	je	.L2589
.L2590:
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L2589
	movq	(%rdx), %rcx
	movq	%rcx, (%rax)
	testq	%rcx, %rcx
	jne	.L2594
	movq	$0, 8(%rax)
	jmp	.L2594
	.p2align 4,,10
	.p2align 3
.L2576:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2576
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC308(%rip), %rcx
	call	fwrite
.L2670:
	movq	80(%rsp), %rcx
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	call	fwrite
	call	get_info
	movq	%rbx, %rcx
	leaq	.LC261(%rip), %rdx
	movq	%rax, %r8
	call	fprintf
	movq	%rbx, %rcx
	call	fclose
.L2401:
	xorl	%eax, %eax
.L2396:
	movups	144(%rsp), %xmm6
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
	.p2align 4,,10
	.p2align 3
.L2580:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2580
	movq	%rbx, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC310(%rip), %rcx
	call	fwrite
	jmp	.L2581
	.p2align 4,,10
	.p2align 3
.L2583:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2583
	movq	%rbx, %r9
	movl	$20, %r8d
	movl	$1, %edx
	leaq	.LC312(%rip), %rcx
	call	fwrite
	jmp	.L2584
	.p2align 4,,10
	.p2align 3
.L2587:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2587
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC314(%rip), %rcx
	call	fwrite
.L2588:
	movq	24(%rdi), %rax
	movl	$12, %esi
	testq	%rax, %rax
	je	.L2598
	cmpq	$0, (%rax)
	je	.L2598
	cmpq	$0, 8(%rax)
	je	.L2598
	.p2align 4,,10
	.p2align 3
.L2597:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2597
	movq	%rbx, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC317(%rip), %rcx
	call	fwrite
	movq	24(%rdi), %rax
	testq	%rax, %rax
	jne	.L2601
	jmp	.L2600
	.p2align 4,,10
	.p2align 3
.L2605:
	movq	8(%rdx), %rcx
	testq	%rcx, %rcx
	je	.L2600
	movl	$4, %r8d
	movq	%rbx, %rdx
	call	output_var
	movq	24(%rdi), %rax
	testq	%rax, %rax
	je	.L2600
.L2601:
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L2600
	movq	(%rdx), %rcx
	movq	%rcx, (%rax)
	testq	%rcx, %rcx
	jne	.L2605
	movq	$0, 8(%rax)
	jmp	.L2605
	.p2align 4,,10
	.p2align 3
.L2598:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2598
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC316(%rip), %rcx
	call	fwrite
.L2599:
	movq	32(%rdi), %rax
	movl	$12, %esi
	testq	%rax, %rax
	je	.L2609
	cmpq	$0, (%rax)
	je	.L2609
	cmpq	$0, 8(%rax)
	je	.L2609
	.p2align 4,,10
	.p2align 3
.L2608:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2608
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC319(%rip), %rcx
	call	fwrite
	movq	32(%rdi), %rax
	testq	%rax, %rax
	je	.L2611
	.p2align 4,,10
	.p2align 3
.L2612:
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L2611
	movq	(%rdx), %rcx
	movq	%rcx, (%rax)
	testq	%rcx, %rcx
	je	.L2985
.L2662:
	movq	8(%rdx), %r12
	testq	%r12, %r12
	je	.L2611
	cmpq	$0, (%r12)
	movl	$16, %esi
	je	.L2614
	.p2align 4,,10
	.p2align 3
.L2613:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2613
	movq	(%r12), %rax
	leaq	.LC294(%rip), %rdx
	movq	%rbx, %rcx
	movq	8(%rax), %r8
	call	fprintf
.L2615:
	movq	8(%r12), %rax
	testq	%rax, %rax
	je	.L2616
	cmpq	$0, (%rax)
	je	.L2616
	cmpq	$0, 8(%rax)
	je	.L2616
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC297(%rip), %rcx
	call	fwrite
	movq	8(%r12), %rax
	testq	%rax, %rax
	je	.L2619
	movl	$1, %r13d
	.p2align 4,,10
	.p2align 3
.L2620:
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L2619
	movq	(%rdx), %rcx
	movq	%rcx, (%rax)
	testq	%rcx, %rcx
	je	.L2986
.L2657:
	movq	8(%rdx), %rsi
	testq	%rsi, %rsi
	je	.L2619
	cmpl	$25, 24(%rsi)
	ja	.L2722
	movl	24(%rsi), %eax
	movslq	(%r14,%rax,4), %rax
	addq	%r14, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L2623:
	.long	.L2723-.L2623
	.long	.L2724-.L2623
	.long	.L2725-.L2623
	.long	.L2726-.L2623
	.long	.L2727-.L2623
	.long	.L2728-.L2623
	.long	.L2729-.L2623
	.long	.L2730-.L2623
	.long	.L2731-.L2623
	.long	.L2732-.L2623
	.long	.L2733-.L2623
	.long	.L2734-.L2623
	.long	.L2735-.L2623
	.long	.L2736-.L2623
	.long	.L2737-.L2623
	.long	.L2738-.L2623
	.long	.L2739-.L2623
	.long	.L2740-.L2623
	.long	.L2741-.L2623
	.long	.L2742-.L2623
	.long	.L2743-.L2623
	.long	.L2744-.L2623
	.long	.L2745-.L2623
	.long	.L2746-.L2623
	.long	.L2747-.L2623
	.long	.L2748-.L2623
	.section	.text.startup,"x"
	.p2align 4,,10
	.p2align 3
.L2609:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2609
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC318(%rip), %rcx
	call	fwrite
.L2610:
	movl	$8, %esi
	.p2align 4,,10
	.p2align 3
.L2664:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2664
	movq	80(%rsp), %rcx
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	call	fwrite
	movq	72(%rsp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	jne	.L2578
.L2959:
	movq	64(%rsp), %r10
.L2577:
	movl	$4, %esi
	movq	%r10, %rdi
	.p2align 4,,10
	.p2align 3
.L2667:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2667
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%rdi, %rcx
	call	fwrite
	jmp	.L2670
	.p2align 4,,10
	.p2align 3
.L2614:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2614
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC293(%rip), %rcx
	call	fwrite
	jmp	.L2615
.L2747:
	movl	$20, %r15d
	.p2align 4,,10
	.p2align 3
.L2624:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2624
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC344(%rip), %rcx
	call	fwrite
	jmp	.L2649
.L2746:
	movl	$20, %r15d
	.p2align 4,,10
	.p2align 3
.L2625:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2625
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC343(%rip), %rcx
	call	fwrite
	jmp	.L2649
.L2734:
	movl	$20, %r15d
	.p2align 4,,10
	.p2align 3
.L2637:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2637
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC331(%rip), %rcx
	call	fwrite
	jmp	.L2649
.L2742:
	movl	$20, %r15d
	.p2align 4,,10
	.p2align 3
.L2629:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2629
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC339(%rip), %rcx
	call	fwrite
	jmp	.L2649
.L2726:
	movl	$20, %r15d
	.p2align 4,,10
	.p2align 3
.L2645:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2645
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC323(%rip), %rcx
	call	fwrite
	jmp	.L2649
.L2744:
	movl	$20, %r15d
	.p2align 4,,10
	.p2align 3
.L2627:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2627
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC341(%rip), %rcx
	call	fwrite
	jmp	.L2649
.L2730:
	movl	$20, %r15d
	.p2align 4,,10
	.p2align 3
.L2641:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2641
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC327(%rip), %rcx
	call	fwrite
	jmp	.L2649
.L2738:
	movl	$20, %r15d
	.p2align 4,,10
	.p2align 3
.L2633:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2633
	movq	%rbx, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC335(%rip), %rcx
	call	fwrite
	jmp	.L2649
.L2748:
	movl	$20, %esi
	.p2align 4,,10
	.p2align 3
.L2622:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2622
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC345(%rip), %rcx
	call	fwrite
	jmp	.L2650
.L2745:
	movl	$20, %r15d
	.p2align 4,,10
	.p2align 3
.L2626:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2626
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC342(%rip), %rcx
	call	fwrite
	jmp	.L2649
.L2732:
	movl	$20, %r15d
	.p2align 4,,10
	.p2align 3
.L2639:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2639
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC329(%rip), %rcx
	call	fwrite
	jmp	.L2649
.L2740:
	movl	$20, %r15d
	.p2align 4,,10
	.p2align 3
.L2631:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2631
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC337(%rip), %rcx
	call	fwrite
	jmp	.L2649
.L2724:
	movl	$20, %r15d
	.p2align 4,,10
	.p2align 3
.L2647:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2647
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC321(%rip), %rcx
	call	fwrite
	jmp	.L2649
.L2743:
	movl	$20, %r15d
	.p2align 4,,10
	.p2align 3
.L2628:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2628
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC340(%rip), %rcx
	call	fwrite
	jmp	.L2649
.L2728:
	movl	$20, %r15d
	.p2align 4,,10
	.p2align 3
.L2643:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2643
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC325(%rip), %rcx
	call	fwrite
	jmp	.L2649
.L2736:
	movl	$20, %r15d
	.p2align 4,,10
	.p2align 3
.L2635:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2635
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC333(%rip), %rcx
	call	fwrite
	jmp	.L2649
.L2725:
	movl	$20, %r15d
	.p2align 4,,10
	.p2align 3
.L2646:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2646
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC322(%rip), %rcx
	call	fwrite
	jmp	.L2649
.L2741:
	movl	$20, %r15d
	.p2align 4,,10
	.p2align 3
.L2630:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2630
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC338(%rip), %rcx
	call	fwrite
	jmp	.L2649
.L2733:
	movl	$20, %r15d
	.p2align 4,,10
	.p2align 3
.L2638:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2638
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC330(%rip), %rcx
	call	fwrite
	jmp	.L2649
.L2737:
	movl	$20, %r15d
	.p2align 4,,10
	.p2align 3
.L2634:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2634
	movq	%rbx, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC334(%rip), %rcx
	call	fwrite
	jmp	.L2649
.L2723:
	movl	$20, %r15d
	.p2align 4,,10
	.p2align 3
.L2648:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2648
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC320(%rip), %rcx
	call	fwrite
	jmp	.L2649
.L2739:
	movl	$20, %r15d
	.p2align 4,,10
	.p2align 3
.L2632:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2632
	movq	%rbx, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC336(%rip), %rcx
	call	fwrite
	jmp	.L2649
.L2729:
	movl	$20, %r15d
	.p2align 4,,10
	.p2align 3
.L2642:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2642
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC326(%rip), %rcx
	call	fwrite
	jmp	.L2649
.L2735:
	movl	$20, %r15d
	.p2align 4,,10
	.p2align 3
.L2636:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2636
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC332(%rip), %rcx
	call	fwrite
	jmp	.L2649
.L2731:
	movl	$20, %r15d
	.p2align 4,,10
	.p2align 3
.L2640:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2640
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC328(%rip), %rcx
	call	fwrite
	jmp	.L2649
.L2727:
	movl	$20, %r15d
	.p2align 4,,10
	.p2align 3
.L2644:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2644
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC324(%rip), %rcx
	call	fwrite
	.p2align 4,,10
	.p2align 3
.L2649:
	movq	(%rsi), %rcx
	movq	%rbx, %rdx
	call	output_arg
	movl	24(%rsi), %ecx
	cmpl	$24, %ecx
	ja	.L2650
	movq	%r13, %rax
	salq	%cl, %rax
	testl	$4825087, %eax
	jne	.L2651
	testl	$25583616, %eax
	jne	.L2652
	testl	$3145728, %eax
	je	.L2650
.L2653:
	movq	%rbx, %rdx
	movl	$10, %ecx
	call	fputc
.L2650:
	movq	8(%r12), %rax
	testq	%rax, %rax
	jne	.L2620
.L2619:
	movl	$16, %esi
	.p2align 4,,10
	.p2align 3
.L2656:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2656
	movq	80(%rsp), %rcx
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	call	fwrite
.L2618:
	movq	32(%rdi), %rax
	testq	%rax, %rax
	jne	.L2612
.L2611:
	movl	$12, %esi
	.p2align 4,,10
	.p2align 3
.L2661:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2661
	movq	64(%rsp), %rcx
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	call	fwrite
	jmp	.L2610
	.p2align 4,,10
	.p2align 3
.L2537:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2537
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC293(%rip), %rcx
	call	fwrite
	jmp	.L2538
	.p2align 4,,10
	.p2align 3
.L2545:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2545
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC298(%rip), %rcx
	call	fwrite
	jmp	.L2546
	.p2align 4,,10
	.p2align 3
.L2986:
	movq	$0, 8(%rax)
	jmp	.L2657
	.p2align 4,,10
	.p2align 3
.L2616:
	movq	%rbx, %r9
	movl	$3, %r8d
	movl	$1, %edx
	leaq	.LC296(%rip), %rcx
	call	fwrite
	jmp	.L2618
	.p2align 4,,10
	.p2align 3
.L2976:
	movq	$0, 8(%r14)
	jmp	.L2529
	.p2align 4,,10
	.p2align 3
.L2652:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	fputc
	movq	8(%rsi), %rcx
	movq	%rbx, %rdx
	call	output_arg
	jmp	.L2653
	.p2align 4,,10
	.p2align 3
.L2651:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	fputc
	movq	8(%rsi), %rcx
	movq	%rbx, %rdx
	call	output_arg
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	fputc
	movq	16(%rsi), %rcx
	movq	%rbx, %rdx
	call	output_arg
	jmp	.L2653
	.p2align 4,,10
	.p2align 3
.L2977:
	movq	(%rdi), %r15
	movq	8(%r15), %rdx
	movq	(%r15), %rcx
	call	create_subroutine
	movq	%rax, 8(%rsi)
	movq	%rax, %r12
	movq	(%rsi), %rax
	movq	%r12, %rdx
	movq	24(%rax), %rcx
	call	list_append
	movq	16(%r15), %rdx
	testq	%rdx, %rdx
	je	.L2515
	movl	$16, %ecx
	movq	%rdx, 80(%rsp)
	call	alloc_memory
	movq	80(%rsp), %rdx
	movups	%xmm6, (%rax)
	movq	%rax, %rbx
	movdqu	(%rdx), %xmm4
	movups	%xmm4, (%rax)
	movq	%xmm4, %rax
	jmp	.L2514
	.p2align 4,,10
	.p2align 3
.L2516:
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L2515
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	movq	%rsi, %r9
	movl	$112, %r8d
	call	create_var
	movq	16(%r12), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	(%rbx), %rax
.L2514:
	testq	%rax, %rax
	je	.L2515
	movq	(%rax), %rdx
	movq	%rdx, (%rbx)
	testq	%rdx, %rdx
	jne	.L2516
	movq	$0, 8(%rbx)
	jmp	.L2516
	.p2align 4,,10
	.p2align 3
.L2515:
	movq	%rsi, %r9
	xorl	%edx, %edx
	movl	$98, %r8d
	xorl	%ecx, %ecx
	call	create_var
	movl	$16, %ecx
	movq	%rax, 80(%rsp)
	call	alloc_memory
	movq	80(%rsp), %r8
	movl	$16, %ecx
	movq	%rax, %rbx
	movq	%r8, (%rax)
	call	alloc_memory
	movq	32(%r12), %rcx
	movq	%rbx, %rdx
	movups	%xmm6, (%rax)
	movq	%rax, 8(%rbx)
	call	list_append
	movq	24(%r15), %r15
	movq	%rbx, 16(%rsi)
	testq	%r15, %r15
	je	.L2512
	movl	$16, %ecx
	call	alloc_memory
	movups	%xmm6, (%rax)
	movdqu	(%r15), %xmm5
	movq	%rax, %r12
	movups	%xmm5, (%rax)
	movq	%xmm5, %rdx
	jmp	.L2520
	.p2align 4,,10
	.p2align 3
.L2521:
	movq	8(%rdx), %rcx
	testq	%rcx, %rcx
	je	.L2512
	movq	%rsi, %rdx
	call	tac_statement
	movq	(%r12), %rdx
.L2520:
	testq	%rdx, %rdx
	je	.L2512
	movq	(%rdx), %rcx
	movq	%rcx, (%r12)
	testq	%rcx, %rcx
	jne	.L2521
	movq	$0, 8(%r12)
	jmp	.L2521
	.p2align 4,,10
	.p2align 3
.L2512:
	movq	(%rdi), %rax
	movq	$0, 8(%rsi)
	leaq	.LC289(%rip), %rdx
	movq	(%rax), %rdi
	movq	8(%rdi), %rcx
	call	strcmp
	movl	%eax, %edx
	movq	(%r14), %rax
	testl	%edx, %edx
	jne	.L2509
	movq	%rdi, 8(%r13)
	jmp	.L2509
	.p2align 4,,10
	.p2align 3
.L2985:
	movq	$0, 8(%rax)
	jmp	.L2662
.L2982:
	xorl	%r10d, %r10d
	movq	%r10, 8(%rax)
	jmp	.L2553
.L2978:
	movq	(%rdi), %rcx
	movq	%rsi, %rdx
	call	tac_class
	movq	(%r14), %rax
	jmp	.L2509
.L2539:
	movq	%rbx, %r9
	movl	$3, %r8d
	movl	$1, %edx
	leaq	.LC296(%rip), %rcx
	call	fwrite
	jmp	.L2541
.L2589:
	movl	$12, %esi
	.p2align 4,,10
	.p2align 3
.L2593:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2593
	movq	64(%rsp), %rcx
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	call	fwrite
	jmp	.L2588
.L2600:
	movl	$12, %esi
	.p2align 4,,10
	.p2align 3
.L2604:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2604
	movq	64(%rsp), %rcx
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	call	fwrite
	jmp	.L2599
.L2549:
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L2548
.L2972:
	xorl	%r13d, %r13d
	movq	%r13, 8(%rdi)
	jmp	.L2503
.L2979:
	movl	$102, %r8d
.L2963:
	movq	(%rcx), %rdx
	call	create_var
	movq	16(%r13), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	(%r14), %rax
	jmp	.L2509
.L2437:
	leaq	.LC3(%rip), %rcx
	call	fwrite
	movl	8(%rbx), %r8d
	leaq	.LC287(%rip), %rdx
	movq	%r14, %rcx
	call	fprintf
	jmp	.L2434
.L2983:
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC293(%rip), %rcx
	call	fwrite
	jmp	.L2548
.L2436:
	leaq	.LC3(%rip), %r15
	movl	$1, %edx
	movq	%r15, %rcx
	movq	%r15, 72(%rsp)
	call	fwrite
	movq	%r14, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC282(%rip), %rcx
	call	fwrite
	movzbl	112(%rsp), %eax
	movq	(%rbx), %rdi
	movq	%r14, %rcx
	leaq	.LC0(%rip), %rbx
	movl	%eax, %edx
	orl	$4, %edx
	testb	$2, %al
	movb	%dl, 112(%rsp)
	movq	%rbx, %rdx
	cmove	%rsi, %rdx
	call	fprintf
	movq	%r14, %r9
	movl	$1, %edx
	movq	%r15, %rcx
	movl	$10, %r8d
	call	fwrite
	movq	%r14, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC65(%rip), %rcx
	call	fwrite
	leaq	112(%rsp), %rax
	movq	(%rdi), %rcx
	movq	%r14, %rdx
	movq	%rax, %r9
	movl	$3, %r8d
	movq	%rax, 80(%rsp)
	call	output_name
	movzbl	112(%rsp), %eax
	movq	%r14, %rcx
	movl	%eax, %edx
	andl	$-5, %edx
	testb	$2, %al
	movb	%dl, 112(%rsp)
	movq	%rbx, %rdx
	cmove	%rsi, %rdx
	call	fprintf
	movq	%r14, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC2(%rip), %rcx
	call	fwrite
	movq	%r14, %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC283(%rip), %rcx
	call	fwrite
	movq	8(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L2434
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%rdi), %xmm2
	movq	%rax, %r12
	movups	%xmm2, (%rax)
	.p2align 4,,10
	.p2align 3
.L2461:
	movq	(%r12), %rax
	testq	%rax, %rax
	je	.L2434
	movq	(%rax), %rdx
	movq	%rdx, (%r12)
	testq	%rdx, %rdx
	je	.L2987
.L2500:
	movq	8(%rax), %rdi
	testq	%rdi, %rdi
	je	.L2434
	movzbl	112(%rsp), %eax
	movl	8(%rdi), %edx
	movl	%eax, %ecx
	andl	$2, %eax
	orl	$8, %ecx
	testl	%edx, %edx
	je	.L2462
	cmpl	$1, %edx
	je	.L2463
	testb	%al, %al
	movq	%rbx, %rdx
	movb	%cl, 112(%rsp)
	movq	%r14, %rcx
	cmove	%rsi, %rdx
	call	fprintf
	testb	$4, 112(%rsp)
	movq	%rbx, %rdx
	movq	%r14, %rcx
	cmove	%rsi, %rdx
	call	fprintf
	movq	72(%rsp), %rcx
	movq	%r14, %r9
	movl	$10, %r8d
	movl	$1, %edx
	call	fwrite
	movl	8(%rdi), %r8d
	leaq	.LC286(%rip), %rdx
	movq	%r14, %rcx
	call	fprintf
	movq	(%r12), %rax
	testq	%rax, %rax
	je	.L2434
	movq	(%rax), %rdx
	movq	%rdx, (%r12)
	testq	%rdx, %rdx
	jne	.L2500
.L2987:
	movq	$0, 8(%r12)
	jmp	.L2500
	.p2align 4,,10
	.p2align 3
.L2462:
	testb	%al, %al
	movq	%rbx, %rdx
	movb	%cl, 112(%rsp)
	movq	%r14, %rcx
	cmove	%rsi, %rdx
	movl	$1, %r13d
	call	fprintf
	testb	$4, 112(%rsp)
	movq	%rbx, %rdx
	movq	%r14, %rcx
	cmove	%rsi, %rdx
	call	fprintf
	movq	72(%rsp), %rcx
	movq	%r14, %r9
	movl	$10, %r8d
	movl	$1, %edx
	call	fwrite
	movq	%r14, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC284(%rip), %rcx
	call	fwrite
	movzbl	112(%rsp), %eax
	movq	(%rdi), %rdi
	orl	$16, %eax
	movb	%al, 112(%rsp)
	jmp	.L2469
	.p2align 4,,10
	.p2align 3
.L2988:
	movzbl	112(%rsp), %eax
.L2469:
	movsbl	%al, %eax
	movq	%rsi, %rdx
	movq	%r14, %rcx
	btl	%r13d, %eax
	cmovc	%rbx, %rdx
	addq	$1, %r13
	call	fprintf
	cmpq	$4, %r13
	jne	.L2988
	movq	72(%rsp), %rcx
	movq	%r14, %r9
	movl	$1, %edx
	movl	$10, %r8d
	movl	$1, %r13d
	call	fwrite
	movq	%r14, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC65(%rip), %rcx
	call	fwrite
	movq	(%rdi), %rcx
	movq	80(%rsp), %r9
	movq	%r14, %rdx
	movl	$5, %r8d
	call	output_name
	movzbl	112(%rsp), %eax
	orl	$16, %eax
	movb	%al, 112(%rsp)
	jmp	.L2472
	.p2align 4,,10
	.p2align 3
.L2989:
	movzbl	112(%rsp), %eax
.L2472:
	movsbl	%al, %eax
	movq	%rsi, %rdx
	movq	%r14, %rcx
	btl	%r13d, %eax
	cmovc	%rbx, %rdx
	addq	$1, %r13
	call	fprintf
	cmpq	$4, %r13
	jne	.L2989
	movq	72(%rsp), %rcx
	movq	%r14, %r9
	movl	$1, %edx
	movl	$10, %r8d
	movl	$1, %r13d
	call	fwrite
	movq	%r14, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC12(%rip), %rcx
	call	fwrite
	movq	8(%rdi), %rcx
	movq	80(%rsp), %r9
	movq	%r14, %rdx
	movl	$5, %r8d
	call	output_name
	movzbl	112(%rsp), %eax
	orl	$16, %eax
	movb	%al, 112(%rsp)
	jmp	.L2475
	.p2align 4,,10
	.p2align 3
.L2990:
	movzbl	112(%rsp), %eax
.L2475:
	movsbl	%al, %eax
	movq	%rsi, %rdx
	movq	%r14, %rcx
	btl	%r13d, %eax
	cmovc	%rbx, %rdx
	addq	$1, %r13
	call	fprintf
	cmpq	$4, %r13
	jne	.L2990
	movq	72(%rsp), %rcx
	movq	%r14, %r9
	movl	$10, %r8d
	movl	$1, %edx
	call	fwrite
	movq	%r14, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC280(%rip), %rcx
	call	fwrite
	movq	16(%rdi), %r15
	testq	%r15, %r15
	je	.L2476
	movl	$16, %ecx
	pxor	%xmm6, %xmm6
	call	alloc_memory
	movups	%xmm6, (%rax)
	movdqu	(%r15), %xmm2
	movq	24(%rdi), %r15
	movq	%rax, %r13
	movups	%xmm2, (%rax)
	testq	%r15, %r15
	je	.L2477
	movl	$16, %ecx
	call	alloc_memory
	movups	%xmm6, (%rax)
	movdqu	(%r15), %xmm3
	movq	%rax, %r15
	movups	%xmm3, (%rax)
.L2477:
	movq	0(%r13), %rax
	movq	%r15, 56(%rsp)
	movl	$-1, %edi
	movq	%r12, 48(%rsp)
	testq	%rax, %rax
	je	.L2991
	.p2align 4,,10
	.p2align 3
.L2932:
	movq	(%rax), %rdx
	movq	%rdx, 0(%r13)
	testq	%rdx, %rdx
	je	.L2992
.L2486:
	movq	8(%rax), %r15
	movzbl	112(%rsp), %eax
	testq	%r15, %r15
	je	.L2993
	orl	$32, %eax
	movl	$1, %r12d
	movb	%al, 112(%rsp)
	jmp	.L2484
	.p2align 4,,10
	.p2align 3
.L2994:
	movzbl	112(%rsp), %eax
.L2484:
	movsbl	%al, %eax
	movq	%rsi, %rdx
	movq	%r14, %rcx
	btl	%r12d, %eax
	cmovc	%rbx, %rdx
	addq	$1, %r12
	call	fprintf
	cmpq	$5, %r12
	jne	.L2994
	movq	72(%rsp), %rcx
	movq	%r14, %r9
	movl	$1, %edx
	addl	$1, %edi
	movl	$10, %r8d
	call	fwrite
	movl	%edi, %r8d
	leaq	.LC281(%rip), %rdx
	movq	%r14, %rcx
	call	fprintf
	movq	80(%rsp), %r9
	movq	%r14, %rdx
	movq	%r15, %rcx
	movl	$6, %r8d
	call	output_variable
	movq	0(%r13), %rax
	testq	%rax, %rax
	jne	.L2932
.L2991:
	movq	56(%rsp), %r15
	movq	48(%rsp), %r12
.L2962:
	movzbl	112(%rsp), %eax
.L2479:
	andl	$-17, %eax
	movl	$1, %edi
	movb	%al, 112(%rsp)
	jmp	.L2490
	.p2align 4,,10
	.p2align 3
.L2995:
	movzbl	112(%rsp), %eax
.L2490:
	movsbl	%al, %eax
	movq	%rsi, %rdx
	movq	%r14, %rcx
	btl	%edi, %eax
	cmovc	%rbx, %rdx
	addq	$1, %rdi
	call	fprintf
	cmpq	$4, %rdi
	jne	.L2995
	movq	%r14, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC2(%rip), %rcx
	call	fwrite
	movq	%r14, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC99(%rip), %rcx
	call	fwrite
	movq	80(%rsp), %rdi
	testq	%r15, %r15
	jne	.L2491
	jmp	.L2461
	.p2align 4,,10
	.p2align 3
.L2494:
	movq	8(%rax), %rcx
	testq	%rcx, %rcx
	je	.L2461
	movq	%rdi, %r9
	movl	$5, %r8d
	movq	%r14, %rdx
	call	output_statement
.L2491:
	movq	(%r15), %rax
	testq	%rax, %rax
	je	.L2461
	movq	(%rax), %rdx
	movq	%rdx, (%r15)
	testq	%rdx, %rdx
	jne	.L2494
	movq	$0, 8(%r15)
	jmp	.L2494
	.p2align 4,,10
	.p2align 3
.L2992:
	movq	$0, 8(%r13)
	jmp	.L2486
	.p2align 4,,10
	.p2align 3
.L2463:
	testb	%al, %al
	movq	%rbx, %rdx
	movb	%cl, 112(%rsp)
	movq	%r14, %rcx
	cmove	%rsi, %rdx
	call	fprintf
	testb	$4, 112(%rsp)
	movq	%rbx, %rdx
	movq	%r14, %rcx
	cmove	%rsi, %rdx
	call	fprintf
	movq	72(%rsp), %rcx
	movq	%r14, %r9
	movl	$10, %r8d
	movl	$1, %edx
	call	fwrite
	movq	%r14, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC285(%rip), %rcx
	call	fwrite
	movq	(%rdi), %rcx
	movq	80(%rsp), %r9
	movq	%r14, %rdx
	movl	$4, %r8d
	call	output_variable
	jmp	.L2461
.L2435:
	leaq	.LC3(%rip), %r15
	movl	$1, %edx
	leaq	112(%rsp), %r13
	movq	%r15, %rcx
	movq	%r15, 72(%rsp)
	leaq	.LC0(%rip), %rdi
	call	fwrite
	movq	%r14, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC67(%rip), %rcx
	call	fwrite
	movzbl	112(%rsp), %eax
	movq	(%rbx), %rbx
	movq	%r14, %rcx
	movl	%eax, %edx
	orl	$4, %edx
	testb	$2, %al
	movb	%dl, 112(%rsp)
	movq	%rdi, %rdx
	cmove	%rsi, %rdx
	call	fprintf
	movq	%r14, %r9
	movl	$1, %edx
	movq	%r15, %rcx
	movl	$10, %r8d
	call	fwrite
	movq	%r14, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC65(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rcx
	movq	%r13, %r9
	movq	%r14, %rdx
	movl	$3, %r8d
	movq	%r13, 80(%rsp)
	call	output_name
	movzbl	112(%rsp), %eax
	movq	%r14, %rcx
	movl	%eax, %edx
	orl	$4, %edx
	testb	$2, %al
	movb	%dl, 112(%rsp)
	movq	%rdi, %rdx
	cmove	%rsi, %rdx
	call	fprintf
	movq	%r14, %r9
	movl	$1, %edx
	movq	%r15, %rcx
	movl	$10, %r8d
	call	fwrite
	movq	%r14, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC12(%rip), %rcx
	call	fwrite
	movq	8(%rbx), %rcx
	movq	%r13, %r9
	movq	%r14, %rdx
	movl	$3, %r8d
	call	output_name
	movzbl	112(%rsp), %eax
	movq	%r14, %rcx
	movl	%eax, %edx
	orl	$4, %edx
	testb	$2, %al
	movb	%dl, 112(%rsp)
	movq	%rdi, %rdx
	cmove	%rsi, %rdx
	call	fprintf
	movq	%r14, %r9
	movl	$1, %edx
	movq	%r15, %rcx
	movl	$10, %r8d
	call	fwrite
	movq	%r14, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC280(%rip), %rcx
	call	fwrite
	movq	16(%rbx), %r12
	testq	%r12, %r12
	je	.L2445
	movl	$16, %ecx
	pxor	%xmm6, %xmm6
	call	alloc_memory
	movq	24(%rbx), %r13
	movups	%xmm6, (%rax)
	movdqu	(%r12), %xmm2
	movq	%rax, %r15
	movups	%xmm2, (%rax)
	testq	%r13, %r13
	je	.L2675
	movl	$16, %ecx
	call	alloc_memory
	movups	%xmm6, (%rax)
	movdqu	0(%r13), %xmm5
	movq	%rax, %r13
	movups	%xmm5, (%rax)
.L2675:
	movq	%r13, 56(%rsp)
	orl	$-1, %ebx
	movq	%r15, %r13
	leaq	.LC0(%rip), %r12
	movq	72(%rsp), %r15
	jmp	.L2447
	.p2align 4,,10
	.p2align 3
.L2451:
	movq	8(%rax), %rdi
	movzbl	112(%rsp), %eax
	movl	%eax, %edx
	andl	$2, %edx
	testq	%rdi, %rdi
	je	.L2996
	orl	$8, %eax
	testb	%dl, %dl
	movq	%r12, %rdx
	movq	%r14, %rcx
	cmove	%rsi, %rdx
	movb	%al, 112(%rsp)
	call	fprintf
	testb	$4, 112(%rsp)
	movq	%r12, %rdx
	movq	%r14, %rcx
	cmove	%rsi, %rdx
	addl	$1, %ebx
	call	fprintf
	movq	%r14, %r9
	movl	$1, %edx
	movq	%r15, %rcx
	movl	$10, %r8d
	call	fwrite
	movl	%ebx, %r8d
	leaq	.LC281(%rip), %rdx
	movq	%r14, %rcx
	call	fprintf
	movq	80(%rsp), %r9
	movq	%r14, %rdx
	movq	%rdi, %rcx
	movl	$4, %r8d
	call	output_variable
.L2447:
	movq	0(%r13), %rax
	testq	%rax, %rax
	je	.L2997
	movq	(%rax), %rdx
	movq	%rdx, 0(%r13)
	testq	%rdx, %rdx
	jne	.L2451
	movq	$0, 8(%r13)
	jmp	.L2451
.L2984:
	xorl	%ecx, %ecx
	movq	%rcx, 8(%rax)
	jmp	.L2668
.L2981:
	xorl	%r9d, %r9d
	movq	%r9, 8(%rax)
	jmp	.L2558
.L2527:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	%edi, %r8d
	leaq	.LC290(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	(%r14), %rax
	jmp	.L2509
.L2997:
	movq	56(%rsp), %r13
	movzbl	112(%rsp), %eax
.L2450:
	movl	%eax, %edx
	andl	$-5, %edx
	testb	$2, %al
	movb	%dl, 112(%rsp)
	leaq	.LC0(%rip), %rdx
	cmove	%rsi, %rdx
.L2453:
	movq	%r14, %rcx
	call	fprintf
	movq	%r14, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC2(%rip), %rcx
	call	fwrite
	movq	%r14, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC99(%rip), %rcx
	call	fwrite
	movq	80(%rsp), %rbx
	testq	%r13, %r13
	jne	.L2455
	jmp	.L2434
	.p2align 4,,10
	.p2align 3
.L2457:
	movq	8(%rax), %rcx
	testq	%rcx, %rcx
	je	.L2434
	movq	%rbx, %r9
	movl	$3, %r8d
	movq	%r14, %rdx
	call	output_statement
.L2455:
	movq	0(%r13), %rax
	testq	%rax, %rax
	je	.L2434
	movq	(%rax), %rdx
	movq	%rdx, 0(%r13)
	testq	%rdx, %rdx
	jne	.L2457
	movq	$0, 8(%r13)
	jmp	.L2457
.L2975:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, %r8
	leaq	.LC258(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L2401
.L2567:
	movl	$4, %esi
	.p2align 4,,10
	.p2align 3
.L2571:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L2571
	leaq	.LC303(%rip), %r10
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%r10, %rcx
	call	fwrite
	jmp	.L2566
.L2965:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, %r8
	leaq	.LC258(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L2401
.L2964:
	movq	(%rbx), %rbx
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC257(%rip), %rdx
	movq	%rax, %rcx
	movq	%rbx, %r8
	call	fprintf
	movl	$1, %eax
	jmp	.L2396
.L2404:
	xorl	%edx, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 80(%r15)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L2405
	jmp	.L2406
.L2476:
	movq	24(%rdi), %r15
	testq	%r15, %r15
	je	.L2962
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%r15), %xmm0
	movq	%rax, %r15
	movups	%xmm0, (%rax)
	movzbl	112(%rsp), %eax
	jmp	.L2479
.L2973:
	leaq	.LC256(%rip), %r8
	jmp	.L2440
.L2971:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, %r8
	leaq	.LC258(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L2432
.L2445:
	movq	24(%rbx), %r13
	testq	%r13, %r13
	je	.L2998
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	0(%r13), %xmm4
	movq	%rax, %rbx
	movups	%xmm4, (%rax)
	movzbl	112(%rsp), %eax
	movl	%eax, %edx
	andl	$-5, %edx
	movb	%dl, 112(%rsp)
	testb	$2, %al
	jne	.L2674
	movq	%rbx, %r13
.L2961:
	leaq	.LC1(%rip), %rdx
	jmp	.L2453
.L2993:
	movq	56(%rsp), %r15
	movq	48(%rsp), %r12
	jmp	.L2479
.L2998:
	movzbl	112(%rsp), %eax
	movl	%eax, %edx
	andl	$-5, %edx
	movb	%dl, 112(%rsp)
	testb	$2, %al
	je	.L2961
	movq	%r14, %r9
	movq	%rdi, %rcx
	movl	$6, %r8d
	movl	$1, %edx
	call	fwrite
	movq	%r14, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC2(%rip), %rcx
	call	fwrite
	movq	%r14, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC99(%rip), %rcx
	call	fwrite
	jmp	.L2434
.L2674:
	movq	%r14, %r9
	movl	$6, %r8d
	movq	%rdi, %rcx
	movq	%rbx, %r13
	movl	$1, %edx
	call	fwrite
	movq	%r14, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC2(%rip), %rcx
	call	fwrite
	movq	%r14, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC99(%rip), %rcx
	call	fwrite
	movq	80(%rsp), %rbx
	jmp	.L2455
.L2996:
	movq	56(%rsp), %r13
	jmp	.L2450
	.section	.text.unlikely,"x"
	.def	main.cold;	.scl	3;	.type	32;	.endef
main.cold:
.L2722:
	movl	$20, %r15d
.L2621:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %r15
	jne	.L2621
	movl	24(%rsi), %r8d
	leaq	.LC346(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L2650
	.section	.text.startup,"x"
	.section	.text.unlikely,"x"
.LCOLDE347:
	.section	.text.startup,"x"
.LHOTE347:
	.section .rdata,"dr"
	.align 32
CSWTCH.123:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.long	8
	.long	9
	.long	10
	.long	11
	.long	12
	.long	14
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.align 32
CSWTCH.116:
	.long	4
	.long	4
	.long	5
	.long	5
	.long	5
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	2
	.long	2
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
.lcomm id_counter.0,8,8
.lcomm builtin_scope,8,8
.lcomm name_void,8,8
.lcomm name_string,8,8
.lcomm name_int,8,8
.lcomm name_float,8,8
.lcomm name_bool,8,8
.lcomm all_string_list,8,8
.lcomm symbolList,240,32
.lcomm keywordList,176,32
.lcomm DEFAULT_INIT_NAME,8,8
.lcomm DEFAULT_CONSTRUCTOR_NAME,8,8
.lcomm struct_memory_used,8,8
.lcomm struct_memory_count,8,8
.lcomm string_memory_used,8,8
.lcomm string_memory_count,8,8
.lcomm memoryBlockCount,8,8
.lcomm struct_memory,8,8
.lcomm string_memory,8,8
.LC348:
	.ascii "(\0"
.LC349:
	.ascii ")\0"
.LC350:
	.ascii "{\0"
.LC351:
	.ascii "}\0"
.LC352:
	.ascii ",\0"
.LC353:
	.ascii "!\0"
.LC354:
	.ascii "[\0"
.LC355:
	.ascii "]\0"
.LC356:
	.ascii ";\0"
.LC357:
	.ascii "_\0"
.LC358:
	.ascii "+\0"
.LC359:
	.ascii "-\0"
.LC360:
	.ascii "*\0"
.LC361:
	.ascii "%\0"
.LC362:
	.ascii "<\0"
.LC363:
	.ascii ">\0"
.LC364:
	.ascii "=\0"
.LC365:
	.ascii "==\0"
.LC366:
	.ascii "!=\0"
.LC367:
	.ascii "<=\0"
.LC368:
	.ascii ">=\0"
.LC369:
	.ascii "+=\0"
.LC370:
	.ascii "-=\0"
.LC371:
	.ascii "*=\0"
.LC372:
	.ascii "/=\0"
.LC373:
	.ascii "%=\0"
.LC374:
	.ascii "&&\0"
.LC375:
	.ascii "||\0"
	.align 32
symbolStrings:
	.quad	.LC348
	.quad	.LC349
	.quad	.LC350
	.quad	.LC351
	.quad	.LC352
	.quad	.LC353
	.quad	.LC60
	.quad	.LC354
	.quad	.LC355
	.quad	.LC356
	.quad	.LC357
	.quad	.LC358
	.quad	.LC359
	.quad	.LC360
	.quad	.LC58
	.quad	.LC361
	.quad	.LC362
	.quad	.LC363
	.quad	.LC364
	.quad	.LC365
	.quad	.LC366
	.quad	.LC367
	.quad	.LC368
	.quad	.LC369
	.quad	.LC370
	.quad	.LC371
	.quad	.LC372
	.quad	.LC373
	.quad	.LC374
	.quad	.LC375
.LC376:
	.ascii "import\0"
.LC377:
	.ascii "from\0"
.LC378:
	.ascii "func\0"
.LC379:
	.ascii "class\0"
.LC380:
	.ascii "method\0"
.LC381:
	.ascii "self\0"
.LC382:
	.ascii "if\0"
.LC383:
	.ascii "elif\0"
.LC384:
	.ascii "else\0"
.LC385:
	.ascii "while\0"
.LC386:
	.ascii "for\0"
.LC387:
	.ascii "return\0"
.LC388:
	.ascii "break\0"
.LC389:
	.ascii "continue\0"
.LC390:
	.ascii "int\0"
.LC391:
	.ascii "float\0"
.LC392:
	.ascii "string\0"
.LC393:
	.ascii "bool\0"
.LC394:
	.ascii "var\0"
	.align 32
keywordStrings:
	.quad	.LC376
	.quad	.LC377
	.quad	.LC378
	.quad	.LC379
	.quad	.LC380
	.quad	.LC381
	.quad	.LC382
	.quad	.LC383
	.quad	.LC384
	.quad	.LC385
	.quad	.LC386
	.quad	.LC24
	.quad	.LC25
	.quad	.LC387
	.quad	.LC388
	.quad	.LC389
	.quad	.LC390
	.quad	.LC391
	.quad	.LC392
	.quad	.LC393
	.quad	.LC31
	.quad	.LC394
.lcomm initialized,1,1
	.align 16
.LC19:
	.quad	1024
	.quad	0
	.align 8
.LC132:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Rev6, Built by MSYS2 project) 13.2.0"
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	putc;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	strncmp;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	getcwd;	.scl	2;	.type	32;	.endef
	.def	strcat;	.scl	2;	.type	32;	.endef
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	ftell;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	strtoll;	.scl	2;	.type	32;	.endef
	.def	strtod;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
