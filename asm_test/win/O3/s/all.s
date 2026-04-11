	.file	"all.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "true\0"
.LC1:
	.ascii "false\0"
.LC2:
	.ascii "\"NULL\"\0"
.LC3:
	.ascii "%s(%s)\0"
.LC4:
	.ascii "%lld\0"
.LC5:
	.ascii "%f\0"
.LC6:
	.ascii "\"%s\"\0"
.LC7:
	.ascii "void\0"
.LC8:
	.ascii "NONE\0"
.LC9:
	.ascii "unknown_ArgType: %u\0"
	.text
	.p2align 4
	.def	output_arg;	.scl	3;	.type	32;	.endef
output_arg:
	movq	%rdx, %r10
	testq	%rcx, %rcx
	je	.L21
	movl	16(%rcx), %r8d
	cmpl	$9, %r8d
	ja	.L3
	leaq	.L5(%rip), %rdx
	movslq	(%rdx,%r8,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L5:
	.long	.L6-.L5
	.long	.L12-.L5
	.long	.L11-.L5
	.long	.L10-.L5
	.long	.L9-.L5
	.long	.L8-.L5
	.long	.L7-.L5
	.long	.L6-.L5
	.long	.L6-.L5
	.long	.L4-.L5
	.text
	.p2align 4,,10
	.p2align 3
.L6:
	movq	(%rcx), %rax
	movq	(%rax), %rdx
	movq	8(%rax), %r8
	testq	%rdx, %rdx
	je	.L16
	movq	8(%rdx), %r9
	movq	%r10, %rcx
	leaq	.LC3(%rip), %rdx
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L12:
	movq	(%rcx), %r8
	leaq	.LC4(%rip), %rdx
	movq	%r10, %rcx
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L9:
	cmpb	$0, (%rcx)
	leaq	.LC0(%rip), %rax
	leaq	.LC1(%rip), %rcx
	movq	%r10, %rdx
	cmovne	%rax, %rcx
	jmp	fputs
	.p2align 4,,10
	.p2align 3
.L8:
	movq	%r10, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rcx
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L7:
	movq	(%rcx), %rax
	movq	%r10, %rdx
	movq	8(%rax), %rcx
	jmp	fputs
	.p2align 4,,10
	.p2align 3
.L4:
	movq	%r10, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC8(%rip), %rcx
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L11:
	movq	(%rcx), %r8
	leaq	.LC5(%rip), %rdx
	movq	%r10, %rcx
	movq	%r8, %xmm2
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L10:
	movq	(%rcx), %r8
	leaq	.LC6(%rip), %rdx
	movq	%r10, %rcx
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L21:
	movq	%rdx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC2(%rip), %rcx
	jmp	fwrite
.L3:
	leaq	.LC9(%rip), %rdx
	movq	%r10, %rcx
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L16:
	movq	%r10, %rdx
	movq	%r8, %rcx
	jmp	fputs
	.section .rdata,"dr"
	.align 8
.LC10:
	.ascii "Fatal: Cannot allocate memory\12\0"
	.text
	.p2align 4
	.def	create_memory_block.part.0;	.scl	3;	.type	32;	.endef
create_memory_block.part.0:
	subq	$40, %rsp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$30, %r8d
	movl	$1, %edx
	leaq	.LC10(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
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
	je	.L35
	movl	$1024, %ecx
	movq	%rax, %rbx
	call	malloc
	movdqu	.LC11(%rip), %xmm0
	movq	$0, 16(%rbx)
	movq	%rax, 24(%rbx)
	movups	%xmm0, (%rbx)
	testb	%sil, %sil
	jne	.L36
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
.L36:
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
.L35:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$30, %r8d
	movl	$1, %edx
	leaq	.LC10(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	movq	string_memory(%rip), %rbx
	testq	%rbx, %rbx
	je	.L26
.L27:
	movq	%rbx, %rsi
	movq	16(%rbx), %rbx
	movq	24(%rsi), %rcx
	call	free
	movq	%rsi, %rcx
	call	free
	testq	%rbx, %rbx
	jne	.L27
.L26:
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
	.section .rdata,"dr"
.LC12:
	.ascii "Var: \"NULL\"\12\0"
.LC13:
	.ascii "NULL\11%s\12\0"
.LC14:
	.ascii "%s\11%s(%s)\12\0"
.LC15:
	.ascii "%s\11%s\12\0"
	.text
	.p2align 4
	.def	output_var.constprop.1;	.scl	3;	.type	32;	.endef
output_var.constprop.1:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$48, %rsp
	testq	%rcx, %rcx
	je	.L52
	cmpq	$0, 16(%rcx)
	movq	%rcx, %rdi
	movl	$16, %esi
	je	.L41
	cmpq	$0, (%rcx)
	je	.L42
	.p2align 4,,10
	.p2align 3
.L43:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L43
	movq	16(%rdi), %rax
	movq	%rbx, %rcx
	leaq	.LC14(%rip), %rdx
	movq	8(%rax), %r8
	movq	(%rdi), %rax
	movq	8(%rax), %rax
	movq	%rax, 32(%rsp)
	movq	8(%rdi), %r9
	call	fprintf
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L41:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L41
	movq	8(%rdi), %r8
	addq	$48, %rsp
	movq	%rbx, %rcx
	leaq	.LC13(%rip), %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L42:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L42
	movq	16(%rdi), %rax
	movq	8(%rdi), %r9
	movq	%rbx, %rcx
	leaq	.LC15(%rip), %rdx
	movq	8(%rax), %r8
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L52:
	movl	$16, %esi
	.p2align 4,,10
	.p2align 3
.L39:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L39
	addq	$48, %rsp
	movq	%rbx, %r9
	movl	$12, %r8d
	movl	$1, %edx
	popq	%rbx
	leaq	.LC12(%rip), %rcx
	popq	%rsi
	popq	%rdi
	jmp	fwrite
	.section .rdata,"dr"
.LC16:
	.ascii "TAC: \"NULL\"\12\0"
.LC17:
	.ascii "TAC {\12\0"
.LC18:
	.ascii "designs: []\12\0"
.LC19:
	.ascii "designs: [\12\0"
.LC20:
	.ascii "NULL \0"
.LC21:
	.ascii "%s \0"
.LC22:
	.ascii "%zu \0"
.LC23:
	.ascii "{}\12\0"
.LC24:
	.ascii "{\12\0"
.LC25:
	.ascii "NULL\11\0"
.LC26:
	.ascii "%s\11\0"
.LC27:
	.ascii "%s(%s) \0"
.LC28:
	.ascii "%zu\12\0"
.LC29:
	.ascii "}\12\0"
.LC30:
	.ascii "]\12\0"
.LC31:
	.ascii "entry_point: \"NULL\"\12\0"
.LC32:
	.ascii "entry_point: %s\12\0"
.LC33:
	.ascii "global: []\12\0"
.LC34:
	.ascii "global: [\12\0"
.LC35:
	.ascii "subroutines: []\12\0"
.LC36:
	.ascii "subroutines: [\12\0"
.LC37:
	.ascii "NULL {\12\0"
.LC38:
	.ascii "%s {\12\0"
.LC39:
	.ascii "return_type: \"NULL\"\12\0"
.LC40:
	.ascii "return_type: %s\12\0"
.LC41:
	.ascii "parameters: []\12\0"
.LC42:
	.ascii "parameters: [\12\0"
.LC43:
	.ascii "local: []\12\0"
.LC44:
	.ascii "local: [\12\0"
.LC45:
	.ascii "instructions: []\12\0"
.LC46:
	.ascii "instructions: [\12\0"
.LC47:
	.ascii "add\11\0"
.LC48:
	.ascii "sub\11\0"
.LC49:
	.ascii "mul\11\0"
.LC50:
	.ascii "div\11\0"
.LC51:
	.ascii "mod\11\0"
.LC52:
	.ascii "eq \11\0"
.LC53:
	.ascii "ne \11\0"
.LC54:
	.ascii "lt \11\0"
.LC55:
	.ascii "gt \11\0"
.LC56:
	.ascii "le \11\0"
.LC57:
	.ascii "ge \11\0"
.LC58:
	.ascii "and\11\0"
.LC59:
	.ascii "or \11\0"
.LC60:
	.ascii "not\11\0"
.LC61:
	.ascii "assign\11\0"
.LC62:
	.ascii "get_attr\11\0"
.LC63:
	.ascii "get_elem\11\0"
.LC64:
	.ascii "param\11\0"
.LC65:
	.ascii "alloc\11\0"
.LC66:
	.ascii "jmp_c\11\0"
.LC67:
	.ascii "jmp\11\0"
.LC68:
	.ascii "ret\11\0"
.LC69:
	.ascii "call\11\0"
.LC70:
	.ascii "load\11\0"
.LC71:
	.ascii "store\11\0"
.LC72:
	.ascii "INST_NONE\12\0"
.LC73:
	.ascii "unknown_InstructionType: %u\12\0"
	.section	.text.unlikely,"x"
.LCOLDB74:
	.text
.LHOTB74:
	.p2align 4
	.def	output_TAC.constprop.0;	.scl	3;	.type	32;	.endef
output_TAC.constprop.0:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$72, %rsp
	testq	%rcx, %rcx
	je	.L398
	movq	%rcx, %r12
	movq	%rdx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC17(%rip), %rcx
	movl	$4, %esi
	call	fwrite
	movq	(%r12), %rax
	testq	%rax, %rax
	je	.L57
	cmpq	$0, (%rax)
	je	.L57
	cmpq	$0, 8(%rax)
	je	.L57
	.p2align 4,,10
	.p2align 3
.L56:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L56
	movq	%rbx, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC19(%rip), %rcx
	leaq	.LC29(%rip), %r15
	call	fwrite
	movq	(%r12), %rax
	testq	%rax, %rax
	je	.L59
	leaq	.LC21(%rip), %r14
	leaq	.LC26(%rip), %r13
	.p2align 4,,10
	.p2align 3
.L60:
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L59
	movq	(%rdx), %rcx
	movq	%rcx, (%rax)
	testq	%rcx, %rcx
	je	.L399
.L82:
	movq	8(%rdx), %rbp
	testq	%rbp, %rbp
	je	.L59
	cmpq	$0, 8(%rbp)
	movl	$8, %esi
	je	.L62
	.p2align 4,,10
	.p2align 3
.L61:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L61
	movq	8(%rbp), %rax
	movq	%r14, %rdx
	movq	%rbx, %rcx
	movq	8(%rax), %r8
	call	fprintf
.L63:
	movq	16(%rbp), %r8
	leaq	.LC22(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	movq	0(%rbp), %rax
	testq	%rax, %rax
	je	.L64
	cmpq	$0, (%rax)
	je	.L64
	cmpq	$0, 8(%rax)
	je	.L64
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC24(%rip), %rcx
	call	fwrite
	movq	0(%rbp), %rax
	testq	%rax, %rax
	je	.L67
	.p2align 4,,10
	.p2align 3
.L68:
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L67
	movq	(%rdx), %rcx
	movq	%rcx, (%rax)
	testq	%rcx, %rcx
	je	.L400
.L77:
	movq	8(%rdx), %rdi
	testq	%rdi, %rdi
	je	.L67
	cmpq	$0, 8(%rdi)
	movl	$12, %esi
	je	.L70
	.p2align 4,,10
	.p2align 3
.L69:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L69
	movq	8(%rdi), %rax
	movq	%r13, %rdx
	movq	%rbx, %rcx
	movq	8(%rax), %r8
	call	fprintf
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L401
.L72:
	movq	(%rax), %rdx
	movq	8(%rax), %r8
	testq	%rdx, %rdx
	je	.L74
	movq	8(%rdx), %r9
	movq	%rbx, %rcx
	leaq	.LC27(%rip), %rdx
	call	fprintf
.L73:
	movq	16(%rdi), %r8
	leaq	.LC28(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	movq	0(%rbp), %rax
	testq	%rax, %rax
	jne	.L68
.L67:
	movl	$8, %esi
	.p2align 4,,10
	.p2align 3
.L75:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L75
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%r15, %rcx
	call	fwrite
.L66:
	movq	(%r12), %rax
	testq	%rax, %rax
	jne	.L60
.L59:
	movl	$4, %esi
	.p2align 4,,10
	.p2align 3
.L81:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L81
	leaq	.LC30(%rip), %rax
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%rax, %rcx
	call	fwrite
	jmp	.L58
	.p2align 4,,10
	.p2align 3
.L57:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L57
	movq	%rbx, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC18(%rip), %rcx
	leaq	.LC29(%rip), %r15
	call	fwrite
.L58:
	cmpq	$0, 8(%r12)
	movl	$4, %esi
	je	.L85
	.p2align 4,,10
	.p2align 3
.L84:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L84
	movq	8(%r12), %rax
	leaq	.LC32(%rip), %rdx
	movq	%rbx, %rcx
	movq	8(%rax), %r8
	call	fprintf
.L86:
	movq	16(%r12), %rax
	movl	$4, %esi
	testq	%rax, %rax
	je	.L89
	cmpq	$0, (%rax)
	je	.L89
	cmpq	$0, 8(%rax)
	je	.L89
	.p2align 4,,10
	.p2align 3
.L88:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L88
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC34(%rip), %rcx
	call	fwrite
	movq	16(%r12), %rax
	testq	%rax, %rax
	je	.L91
	leaq	.LC15(%rip), %r14
	leaq	.LC14(%rip), %rbp
	leaq	.LC13(%rip), %r13
	.p2align 4,,10
	.p2align 3
.L92:
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L91
	movq	(%rdx), %rcx
	movq	%rcx, (%rax)
	testq	%rcx, %rcx
	je	.L402
.L101:
	movq	8(%rdx), %rdi
	testq	%rdi, %rdi
	je	.L91
	cmpq	$0, 16(%rdi)
	movl	$8, %esi
	je	.L94
	cmpq	$0, (%rdi)
	je	.L96
	.p2align 4,,10
	.p2align 3
.L97:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L97
	movq	16(%rdi), %rax
	movq	8(%rdi), %r9
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movq	8(%rax), %r8
	movq	(%rdi), %rax
	movq	8(%rax), %rax
	movq	%rax, 32(%rsp)
	call	fprintf
.L95:
	movq	16(%r12), %rax
	testq	%rax, %rax
	jne	.L92
.L91:
	movl	$4, %esi
	.p2align 4,,10
	.p2align 3
.L100:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L100
	leaq	.LC30(%rip), %rax
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%rax, %rcx
	call	fwrite
	jmp	.L90
	.p2align 4,,10
	.p2align 3
.L85:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L85
	movq	%rbx, %r9
	movl	$20, %r8d
	movl	$1, %edx
	leaq	.LC31(%rip), %rcx
	call	fwrite
	jmp	.L86
	.p2align 4,,10
	.p2align 3
.L89:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L89
	movq	%rbx, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC33(%rip), %rcx
	call	fwrite
.L90:
	movq	24(%r12), %rax
	movl	$4, %esi
	testq	%rax, %rax
	je	.L105
	cmpq	$0, (%rax)
	je	.L105
	cmpq	$0, 8(%rax)
	je	.L105
	.p2align 4,,10
	.p2align 3
.L104:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L104
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC36(%rip), %rcx
	leaq	.LC30(%rip), %rdi
	call	fwrite
	movq	24(%r12), %rax
	movq	%rdi, 56(%rsp)
	leaq	.L152(%rip), %r13
	testq	%rax, %rax
	je	.L106
	.p2align 4,,10
	.p2align 3
.L107:
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L106
	movq	(%rdx), %rcx
	movq	%rcx, (%rax)
	testq	%rcx, %rcx
	je	.L403
.L197:
	movq	8(%rdx), %rdi
	testq	%rdi, %rdi
	je	.L106
	cmpq	$0, (%rdi)
	movl	$8, %esi
	je	.L109
	.p2align 4,,10
	.p2align 3
.L108:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L108
	movq	(%rdi), %rax
	leaq	.LC38(%rip), %rdx
	movq	%rbx, %rcx
	movq	8(%rax), %r8
	call	fprintf
.L110:
	cmpq	$0, 8(%rdi)
	movl	$12, %esi
	je	.L112
	.p2align 4,,10
	.p2align 3
.L111:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L111
	movq	8(%rdi), %rax
	leaq	.LC40(%rip), %rdx
	movq	%rbx, %rcx
	movq	8(%rax), %r8
	call	fprintf
.L113:
	movq	16(%rdi), %rax
	movl	$12, %esi
	testq	%rax, %rax
	je	.L116
	cmpq	$0, (%rax)
	je	.L116
	cmpq	$0, 8(%rax)
	je	.L116
	.p2align 4,,10
	.p2align 3
.L115:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L115
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC42(%rip), %rcx
	call	fwrite
	movq	16(%rdi), %rax
	testq	%rax, %rax
	jne	.L119
	jmp	.L118
	.p2align 4,,10
	.p2align 3
.L123:
	movq	8(%rdx), %rcx
	testq	%rcx, %rcx
	je	.L118
	movq	%rbx, %rdx
	call	output_var.constprop.1
	movq	16(%rdi), %rax
	testq	%rax, %rax
	je	.L118
.L119:
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L118
	movq	(%rdx), %rcx
	movq	%rcx, (%rax)
	testq	%rcx, %rcx
	jne	.L123
	movq	$0, 8(%rax)
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L105:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L105
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC35(%rip), %rcx
	call	fwrite
.L199:
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%r15, %rcx
.L397:
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fwrite
.L398:
	movq	%rdx, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC16(%rip), %rcx
	jmp	.L397
	.p2align 4,,10
	.p2align 3
.L62:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L62
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC20(%rip), %rcx
	call	fwrite
	jmp	.L63
	.p2align 4,,10
	.p2align 3
.L70:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L70
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC25(%rip), %rcx
	call	fwrite
	movq	(%rdi), %rax
	testq	%rax, %rax
	jne	.L72
.L401:
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC20(%rip), %rcx
	call	fwrite
	jmp	.L73
	.p2align 4,,10
	.p2align 3
.L109:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L109
	movq	%rbx, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC37(%rip), %rcx
	call	fwrite
	jmp	.L110
	.p2align 4,,10
	.p2align 3
.L112:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L112
	movq	%rbx, %r9
	movl	$20, %r8d
	movl	$1, %edx
	leaq	.LC39(%rip), %rcx
	call	fwrite
	jmp	.L113
	.p2align 4,,10
	.p2align 3
.L116:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L116
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC41(%rip), %rcx
	call	fwrite
.L117:
	movq	24(%rdi), %rax
	movl	$12, %esi
	testq	%rax, %rax
	je	.L127
	cmpq	$0, (%rax)
	je	.L127
	cmpq	$0, 8(%rax)
	je	.L127
	.p2align 4,,10
	.p2align 3
.L126:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L126
	movq	%rbx, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC44(%rip), %rcx
	call	fwrite
	movq	24(%rdi), %rax
	testq	%rax, %rax
	jne	.L130
	jmp	.L129
	.p2align 4,,10
	.p2align 3
.L134:
	movq	8(%rdx), %rcx
	testq	%rcx, %rcx
	je	.L129
	movq	%rbx, %rdx
	call	output_var.constprop.1
	movq	24(%rdi), %rax
	testq	%rax, %rax
	je	.L129
.L130:
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L129
	movq	(%rdx), %rcx
	movq	%rcx, (%rax)
	testq	%rcx, %rcx
	jne	.L134
	movq	$0, 8(%rax)
	jmp	.L134
	.p2align 4,,10
	.p2align 3
.L127:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L127
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC43(%rip), %rcx
	call	fwrite
.L128:
	movq	32(%rdi), %rax
	movl	$12, %esi
	testq	%rax, %rax
	je	.L138
	cmpq	$0, (%rax)
	je	.L138
	cmpq	$0, 8(%rax)
	je	.L138
	.p2align 4,,10
	.p2align 3
.L137:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L137
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC46(%rip), %rcx
	call	fwrite
	movq	32(%rdi), %rax
	testq	%rax, %rax
	je	.L140
	.p2align 4,,10
	.p2align 3
.L141:
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L140
	movq	(%rdx), %rcx
	movq	%rcx, (%rax)
	testq	%rcx, %rcx
	je	.L404
.L191:
	movq	8(%rdx), %rbp
	testq	%rbp, %rbp
	je	.L140
	cmpq	$0, 0(%rbp)
	movl	$16, %esi
	je	.L143
	.p2align 4,,10
	.p2align 3
.L142:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L142
	movq	0(%rbp), %rax
	leaq	.LC21(%rip), %rdx
	movq	%rbx, %rcx
	movq	8(%rax), %r8
	call	fprintf
	movq	8(%rbp), %rax
	testq	%rax, %rax
	je	.L145
.L406:
	cmpq	$0, (%rax)
	je	.L145
	cmpq	$0, 8(%rax)
	je	.L145
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC24(%rip), %rcx
	call	fwrite
	movq	8(%rbp), %rax
	testq	%rax, %rax
	je	.L148
	movl	$1, %r14d
	.p2align 4,,10
	.p2align 3
.L149:
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L148
	movq	(%rdx), %rcx
	movq	%rcx, (%rax)
	testq	%rcx, %rcx
	je	.L405
.L186:
	movq	8(%rdx), %rsi
	testq	%rsi, %rsi
	je	.L148
	cmpl	$25, 24(%rsi)
	ja	.L225
	movl	24(%rsi), %eax
	movslq	0(%r13,%rax,4), %rax
	addq	%r13, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L152:
	.long	.L226-.L152
	.long	.L227-.L152
	.long	.L228-.L152
	.long	.L229-.L152
	.long	.L230-.L152
	.long	.L231-.L152
	.long	.L232-.L152
	.long	.L233-.L152
	.long	.L234-.L152
	.long	.L235-.L152
	.long	.L236-.L152
	.long	.L237-.L152
	.long	.L238-.L152
	.long	.L239-.L152
	.long	.L240-.L152
	.long	.L241-.L152
	.long	.L242-.L152
	.long	.L243-.L152
	.long	.L244-.L152
	.long	.L245-.L152
	.long	.L246-.L152
	.long	.L247-.L152
	.long	.L248-.L152
	.long	.L249-.L152
	.long	.L250-.L152
	.long	.L251-.L152
	.text
	.p2align 4,,10
	.p2align 3
.L138:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L138
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC45(%rip), %rcx
	call	fwrite
.L139:
	movl	$8, %esi
	.p2align 4,,10
	.p2align 3
.L193:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L193
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%r15, %rcx
	call	fwrite
	movq	24(%r12), %rax
	testq	%rax, %rax
	jne	.L107
.L106:
	movl	$4, %esi
	.p2align 4,,10
	.p2align 3
.L196:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L196
	movq	56(%rsp), %rcx
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	call	fwrite
	jmp	.L199
	.p2align 4,,10
	.p2align 3
.L143:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L143
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC20(%rip), %rcx
	call	fwrite
	movq	8(%rbp), %rax
	testq	%rax, %rax
	jne	.L406
	.p2align 4,,10
	.p2align 3
.L145:
	movq	%rbx, %r9
	movl	$3, %r8d
	movl	$1, %edx
	leaq	.LC23(%rip), %rcx
	call	fwrite
	movq	32(%rdi), %rax
	testq	%rax, %rax
	jne	.L141
.L140:
	movl	$12, %esi
	.p2align 4,,10
	.p2align 3
.L190:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L190
	movq	56(%rsp), %rcx
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	call	fwrite
	jmp	.L139
.L249:
	movq	$20, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L154:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 48(%rsp)
	jne	.L154
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC70(%rip), %rcx
	call	fwrite
	jmp	.L178
.L248:
	movq	$20, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L155:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 48(%rsp)
	jne	.L155
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC69(%rip), %rcx
	call	fwrite
	jmp	.L178
.L247:
	movq	$20, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L156:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 48(%rsp)
	jne	.L156
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC68(%rip), %rcx
	call	fwrite
	jmp	.L178
.L246:
	movq	$20, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L157:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 48(%rsp)
	jne	.L157
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC67(%rip), %rcx
	call	fwrite
	jmp	.L178
.L245:
	movq	$20, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L158:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 48(%rsp)
	jne	.L158
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC66(%rip), %rcx
	call	fwrite
	jmp	.L178
.L241:
	movq	$20, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L162:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 48(%rsp)
	jne	.L162
	movq	%rbx, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC62(%rip), %rcx
	call	fwrite
	jmp	.L178
.L243:
	movq	$20, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L160:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 48(%rsp)
	jne	.L160
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC64(%rip), %rcx
	call	fwrite
	jmp	.L178
.L239:
	movq	$20, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L164:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 48(%rsp)
	jne	.L164
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC60(%rip), %rcx
	call	fwrite
	jmp	.L178
.L244:
	movq	$20, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L159:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 48(%rsp)
	jne	.L159
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC65(%rip), %rcx
	call	fwrite
	jmp	.L178
.L240:
	movq	$20, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L163:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 48(%rsp)
	jne	.L163
	movq	%rbx, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC61(%rip), %rcx
	call	fwrite
	jmp	.L178
.L242:
	movq	$20, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L161:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 48(%rsp)
	jne	.L161
	movq	%rbx, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC63(%rip), %rcx
	call	fwrite
	jmp	.L178
.L238:
	movq	$20, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L165:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 48(%rsp)
	jne	.L165
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC59(%rip), %rcx
	call	fwrite
	jmp	.L178
.L250:
	movq	$20, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L153:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 48(%rsp)
	jne	.L153
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC71(%rip), %rcx
	call	fwrite
	jmp	.L178
.L237:
	movq	$20, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L166:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 48(%rsp)
	jne	.L166
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC58(%rip), %rcx
	call	fwrite
	jmp	.L178
.L229:
	movq	$20, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L174:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 48(%rsp)
	jne	.L174
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC50(%rip), %rcx
	call	fwrite
	jmp	.L178
.L233:
	movq	$20, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L170:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 48(%rsp)
	jne	.L170
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC54(%rip), %rcx
	call	fwrite
	jmp	.L178
.L251:
	movl	$20, %esi
	.p2align 4,,10
	.p2align 3
.L151:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L151
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC72(%rip), %rcx
	call	fwrite
	jmp	.L179
.L235:
	movq	$20, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L168:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 48(%rsp)
	jne	.L168
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC56(%rip), %rcx
	call	fwrite
	jmp	.L178
.L227:
	movq	$20, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L176:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 48(%rsp)
	jne	.L176
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC48(%rip), %rcx
	call	fwrite
	jmp	.L178
.L231:
	movq	$20, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L172:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 48(%rsp)
	jne	.L172
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC52(%rip), %rcx
	call	fwrite
	jmp	.L178
.L228:
	movq	$20, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L175:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 48(%rsp)
	jne	.L175
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC49(%rip), %rcx
	call	fwrite
	jmp	.L178
.L236:
	movq	$20, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L167:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 48(%rsp)
	jne	.L167
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC57(%rip), %rcx
	call	fwrite
	jmp	.L178
.L226:
	movq	$20, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L177:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 48(%rsp)
	jne	.L177
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC47(%rip), %rcx
	call	fwrite
	jmp	.L178
.L232:
	movq	$20, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L171:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 48(%rsp)
	jne	.L171
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC53(%rip), %rcx
	call	fwrite
	jmp	.L178
.L234:
	movq	$20, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L169:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 48(%rsp)
	jne	.L169
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC55(%rip), %rcx
	call	fwrite
	jmp	.L178
.L230:
	movq	$20, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L173:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 48(%rsp)
	jne	.L173
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC51(%rip), %rcx
	call	fwrite
	.p2align 4,,10
	.p2align 3
.L178:
	movq	(%rsi), %rcx
	movq	%rbx, %rdx
	call	output_arg
	movl	24(%rsi), %ecx
	cmpl	$24, %ecx
	ja	.L179
	movq	%r14, %rax
	salq	%cl, %rax
	testl	$4825087, %eax
	jne	.L180
	testl	$25583616, %eax
	jne	.L181
	testl	$3145728, %eax
	je	.L179
.L182:
	movq	%rbx, %rdx
	movl	$10, %ecx
	call	fputc
.L179:
	movq	8(%rbp), %rax
	testq	%rax, %rax
	jne	.L149
.L148:
	movl	$16, %esi
	.p2align 4,,10
	.p2align 3
.L185:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L185
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%r15, %rcx
	call	fwrite
	movq	32(%rdi), %rax
	testq	%rax, %rax
	jne	.L141
	jmp	.L140
	.p2align 4,,10
	.p2align 3
.L94:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L94
	movq	8(%rdi), %r8
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L95
	.p2align 4,,10
	.p2align 3
.L96:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L96
	movq	16(%rdi), %rax
	movq	8(%rdi), %r9
	movq	%r14, %rdx
	movq	%rbx, %rcx
	movq	8(%rax), %r8
	call	fprintf
	jmp	.L95
	.p2align 4,,10
	.p2align 3
.L405:
	movq	$0, 8(%rax)
	jmp	.L186
	.p2align 4,,10
	.p2align 3
.L181:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	fputc
	movq	8(%rsi), %rcx
	movq	%rbx, %rdx
	call	output_arg
	jmp	.L182
	.p2align 4,,10
	.p2align 3
.L180:
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
	jmp	.L182
	.p2align 4,,10
	.p2align 3
.L404:
	movq	$0, 8(%rax)
	jmp	.L191
	.p2align 4,,10
	.p2align 3
.L400:
	movq	$0, 8(%rax)
	jmp	.L77
	.p2align 4,,10
	.p2align 3
.L64:
	movq	%rbx, %r9
	movl	$3, %r8d
	movl	$1, %edx
	leaq	.LC23(%rip), %rcx
	call	fwrite
	jmp	.L66
	.p2align 4,,10
	.p2align 3
.L129:
	movl	$12, %esi
	.p2align 4,,10
	.p2align 3
.L133:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L133
	movq	56(%rsp), %rcx
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	call	fwrite
	jmp	.L128
	.p2align 4,,10
	.p2align 3
.L118:
	movl	$12, %esi
	.p2align 4,,10
	.p2align 3
.L122:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L122
	movq	56(%rsp), %rcx
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	call	fwrite
	jmp	.L117
	.p2align 4,,10
	.p2align 3
.L74:
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L73
.L399:
	xorl	%r9d, %r9d
	movq	%r9, 8(%rax)
	jmp	.L82
.L402:
	xorl	%r8d, %r8d
	movq	%r8, 8(%rax)
	jmp	.L101
.L403:
	xorl	%ecx, %ecx
	movq	%rcx, 8(%rax)
	jmp	.L197
	.section	.text.unlikely,"x"
	.def	output_TAC.constprop.0.cold;	.scl	3;	.type	32;	.endef
output_TAC.constprop.0.cold:
.L225:
	movl	$20, %r8d
.L150:
	movq	%rbx, %rdx
	movl	$32, %ecx
	movq	%r8, 48(%rsp)
	call	putc
	movq	48(%rsp), %r8
	subq	$1, %r8
	jne	.L150
	movl	24(%rsi), %r8d
	leaq	.LC73(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L179
	.text
	.section	.text.unlikely,"x"
.LCOLDE74:
	.text
.LHOTE74:
	.section .rdata,"dr"
.LC75:
	.ascii "\342\224\202   \0"
.LC76:
	.ascii "    \0"
.LC77:
	.ascii "\342\224\224\342\224\200\342\224\200 \0"
	.text
	.p2align 4
	.def	indention.constprop.7;	.scl	3;	.type	32;	.endef
indention.constprop.7:
	pushq	%r13
	movl	$1, %eax
	pushq	%r12
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rdx, %rsi
	shrq	$3, %rdx
	pushq	%rbx
	movl	%esi, %ecx
	andl	$7, %ecx
	sall	%cl, %eax
	subq	$40, %rsp
	notl	%eax
	andb	%al, (%r8,%rdx)
	cmpq	$1, %rsi
	jbe	.L408
	movq	%r8, %rdi
	movl	$1, %ebx
	leaq	.LC76(%rip), %r13
	leaq	.LC75(%rip), %r12
	.p2align 4,,10
	.p2align 3
.L412:
	movq	%rbx, %rax
	movq	%rbp, %r9
	shrq	$3, %rax
	movsbl	(%rdi,%rax), %edx
	movl	%ebx, %eax
	andl	$7, %eax
	btl	%eax, %edx
	jnc	.L409
	movl	$6, %r8d
	movl	$1, %edx
	movq	%r12, %rcx
	addq	$1, %rbx
	call	fwrite
	cmpq	%rbx, %rsi
	jne	.L412
.L411:
	addq	$40, %rsp
	movq	%rbp, %r9
	movl	$10, %r8d
	movl	$1, %edx
	popq	%rbx
	leaq	.LC77(%rip), %rcx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L409:
	movl	$4, %r8d
	movl	$1, %edx
	movq	%r13, %rcx
	addq	$1, %rbx
	call	fwrite
	cmpq	%rbx, %rsi
	jne	.L412
	jmp	.L411
	.p2align 4,,10
	.p2align 3
.L408:
	testq	%rsi, %rsi
	jne	.L411
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.section .rdata,"dr"
.LC78:
	.ascii "\342\224\234\342\224\200\342\224\200 \0"
	.text
	.p2align 4
	.def	indention.constprop.6;	.scl	3;	.type	32;	.endef
indention.constprop.6:
	pushq	%r13
	movl	$1, %eax
	pushq	%r12
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rdx, %rsi
	shrq	$3, %rdx
	pushq	%rbx
	movl	%esi, %ecx
	andl	$7, %ecx
	sall	%cl, %eax
	subq	$40, %rsp
	orb	%al, (%r8,%rdx)
	cmpq	$1, %rsi
	jbe	.L416
	movq	%r8, %rdi
	movl	$1, %ebx
	leaq	.LC76(%rip), %r13
	leaq	.LC75(%rip), %r12
	.p2align 4,,10
	.p2align 3
.L420:
	movq	%rbx, %rax
	movq	%rbp, %r9
	shrq	$3, %rax
	movsbl	(%rdi,%rax), %edx
	movl	%ebx, %eax
	andl	$7, %eax
	btl	%eax, %edx
	jnc	.L417
	movl	$6, %r8d
	movl	$1, %edx
	movq	%r12, %rcx
	addq	$1, %rbx
	call	fwrite
	cmpq	%rbx, %rsi
	jne	.L420
.L419:
	addq	$40, %rsp
	movq	%rbp, %r9
	movl	$10, %r8d
	movl	$1, %edx
	popq	%rbx
	leaq	.LC78(%rip), %rcx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L417:
	movl	$4, %r8d
	movl	$1, %edx
	movq	%r13, %rcx
	addq	$1, %rbx
	call	fwrite
	cmpq	%rbx, %rsi
	jne	.L420
	jmp	.L419
	.p2align 4,,10
	.p2align 3
.L416:
	testq	%rsi, %rsi
	jne	.L419
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.section .rdata,"dr"
.LC79:
	.ascii "Name: \"NULL\"\12\0"
.LC80:
	.ascii "name: \"%s\"\12\0"
.LC81:
	.ascii "id: %zu\12\0"
.LC82:
	.ascii "kind: \"type\"\12\0"
.LC83:
	.ascii "kind: \"variable\"\12\0"
.LC84:
	.ascii "type\12\0"
.LC85:
	.ascii "kind: \"function\"\12\0"
.LC86:
	.ascii "return_type\12\0"
.LC87:
	.ascii "kind: \"method\"\12\0"
.LC88:
	.ascii "kind: \"class\"\12\0"
.LC89:
	.ascii "kind: \"attribute\"\12\0"
.LC90:
	.ascii "kind: \"parameter\"\12\0"
.LC91:
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
	je	.L424
	movq	%rcx, %rsi
	addq	$1, %r12
	leaq	.LC80(%rip), %r15
	leaq	.LC81(%rip), %r14
	leaq	.L429(%rip), %r13
.L426:
	leaq	-1(%r12), %rbp
	movq	%rdi, %r8
	movq	%rbx, %rcx
	movq	%rbp, %rdx
	call	indention.constprop.6
	movq	8(%rsi), %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	fprintf
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.6
	movq	16(%rsi), %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	fprintf
	cmpl	$6, 32(%rsi)
	ja	.L427
	movl	32(%rsi), %eax
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movslq	0(%r13,%rax,4), %rax
	addq	%r13, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L429:
	.long	.L435-.L429
	.long	.L434-.L429
	.long	.L433-.L429
	.long	.L432-.L429
	.long	.L431-.L429
	.long	.L430-.L429
	.long	.L428-.L429
	.text
	.p2align 4,,10
	.p2align 3
.L430:
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC89(%rip), %rcx
.L443:
	call	fwrite
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.7
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC84(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rsi
.L436:
	leaq	1(%r12), %rax
	testq	%rsi, %rsi
	je	.L424
	movq	%rax, %r12
	jmp	.L426
	.p2align 4,,10
	.p2align 3
.L431:
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC90(%rip), %rcx
	jmp	.L443
	.p2align 4,,10
	.p2align 3
.L432:
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC83(%rip), %rcx
	jmp	.L443
	.p2align 4,,10
	.p2align 3
.L433:
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC87(%rip), %rcx
.L444:
	call	fwrite
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.7
	movq	%rbx, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC86(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rsi
	jmp	.L436
	.p2align 4,,10
	.p2align 3
.L434:
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC85(%rip), %rcx
	jmp	.L444
	.p2align 4,,10
	.p2align 3
.L435:
	call	indention.constprop.7
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC88(%rip), %rcx
.L445:
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
.L428:
	call	indention.constprop.7
	movq	%rbx, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC82(%rip), %rcx
	jmp	.L445
.L427:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.7
	movq	%rbx, %r9
	movl	$25, %r8d
	movl	$1, %edx
	leaq	.LC91(%rip), %rcx
	jmp	.L445
	.p2align 4,,10
	.p2align 3
.L424:
	movq	%rdi, %r8
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.7
	movq	%rbx, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC79(%rip), %rcx
	jmp	.L445
	.section .rdata,"dr"
	.align 8
.LC92:
	.ascii "Info: Allocate big memory block of size %zu bytes\12\0"
	.align 8
.LC93:
	.ascii "Fatal: Memory allocation is not aligned, used: %zu bytes\12\0"
	.text
	.p2align 4
	.def	create_string_check.part.0;	.scl	3;	.type	32;	.endef
create_string_check.part.0:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$48, %rsp
	cmpq	$1022, %rdx
	ja	.L454
	movq	string_memory(%rip), %rdx
	movq	8(%rdx), %rcx
	leaq	(%rbx,%rcx), %rax
	cmpq	(%rdx), %rax
	jnb	.L455
.L449:
	leaq	1(%rcx,%rbx), %rax
	movq	24(%rdx), %rsi
	movq	%rax, 8(%rdx)
	addq	%rcx, %rsi
.L448:
	movq	%rbx, %r8
	movq	%rdi, %rdx
	movq	%rsi, %rcx
	call	memcpy
	cmpb	$0, initialized(%rip)
	movb	$0, (%rsi,%rbx)
	je	.L456
.L450:
	movq	struct_memory(%rip), %rcx
	movq	8(%rcx), %r8
	leaq	24(%r8), %rax
	cmpq	(%rcx), %rax
	jnb	.L457
.L451:
	testb	$7, %r8b
	jne	.L458
	movq	all_string_list(%rip), %rax
	movq	%r8, %rdx
	addq	$24, %r8
	addq	$1, memoryBlockCount(%rip)
	andq	$-8, %rdx
	addq	24(%rcx), %rdx
	movq	%r8, 8(%rcx)
	movq	%rdx, all_string_list(%rip)
	movq	%rax, 16(%rdx)
	movq	%rsi, %rax
	movq	%rsi, (%rdx)
	movq	%rbx, 8(%rdx)
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L455:
	xorl	%ecx, %ecx
	call	increase_memory_size
	movq	string_memory(%rip), %rdx
	movq	8(%rdx), %rcx
	jmp	.L449
	.p2align 4,,10
	.p2align 3
.L454:
	leaq	1(%rdx), %rbp
	addq	%rbp, string_memory_count(%rip)
	movq	%rbp, %rcx
	addq	%rbp, string_memory_used(%rip)
	call	malloc
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %r12
	movq	%rax, %rsi
	call	*%r12
	movq	%rbp, %r8
	leaq	.LC92(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	testq	%rsi, %rsi
	jne	.L448
	movl	$2, %ecx
	call	*%r12
	leaq	.LC10(%rip), %rcx
	movl	$30, %r8d
	movl	$1, %edx
	movq	%rax, %r9
	call	fwrite
	movl	$1, %ecx
	call	exit
	.p2align 4,,10
	.p2align 3
.L457:
	movl	$1, %ecx
	call	increase_memory_size
	movq	struct_memory(%rip), %rcx
	movq	8(%rcx), %r8
	jmp	.L451
	.p2align 4,,10
	.p2align 3
.L456:
	call	init.part.0
	jmp	.L450
.L458:
	movq	%r8, 40(%rsp)
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	40(%rsp), %r8
	leaq	.LC93(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
	.p2align 4
	.def	create_string_check.constprop.1;	.scl	3;	.type	32;	.endef
create_string_check.constprop.1:
	cmpb	$0, initialized(%rip)
	je	.L469
	testq	%rcx, %rcx
	je	.L464
	testq	%rdx, %rdx
	je	.L464
	jmp	create_string_check.part.0
	.p2align 4,,10
	.p2align 3
.L469:
	subq	$56, %rsp
	movq	%rdx, 40(%rsp)
	movq	%rcx, 32(%rsp)
	call	init.part.0
	movq	32(%rsp), %rcx
	movq	40(%rsp), %rdx
	testq	%rcx, %rcx
	je	.L461
	testq	%rdx, %rdx
	je	.L461
	addq	$56, %rsp
	jmp	create_string_check.part.0
	.p2align 4,,10
	.p2align 3
.L464:
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L461:
	xorl	%eax, %eax
	addq	$56, %rsp
	ret
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
	je	.L487
.L471:
	cmpq	$0, string_memory(%rip)
	je	.L488
.L473:
	leaq	keywordStrings(%rip), %rbx
	movb	$1, initialized(%rip)
	movl	$6, %edx
	leaq	keywordList(%rip), %rsi
	leaq	176(%rbx), %rdi
	jmp	.L477
	.p2align 4,,10
	.p2align 3
.L475:
	movq	(%rbx), %rcx
	call	strlen
	movq	%rax, %rdx
.L477:
	movq	(%rbx), %rcx
	addq	$8, %rbx
	addq	$8, %rsi
	call	create_string_check.constprop.1
	movq	%rax, -8(%rsi)
	cmpq	%rdi, %rbx
	jne	.L475
	leaq	symbolStrings(%rip), %rbx
	leaq	symbolList(%rip), %rsi
	movl	$1, %edx
	leaq	240(%rbx), %rdi
	jmp	.L476
	.p2align 4,,10
	.p2align 3
.L489:
	movq	(%rbx), %rcx
	call	strlen
	movq	%rax, %rdx
.L476:
	movq	(%rbx), %rcx
	addq	$8, %rbx
	addq	$8, %rsi
	call	create_string_check.constprop.1
	movq	%rax, -8(%rsi)
	cmpq	%rbx, %rdi
	jne	.L489
	cmpb	$0, initialized(%rip)
	je	.L490
.L479:
	movq	string_memory(%rip), %rdx
	movq	8(%rdx), %rax
	leaq	4(%rax), %rcx
	cmpq	(%rdx), %rcx
	jnb	.L491
.L480:
	movq	24(%rdx), %rbx
	addq	%rax, %rbx
	addq	$5, %rax
	movq	%rax, 8(%rdx)
	movl	$1953066601, (%rbx)
	movb	$0, 4(%rbx)
	call	alloc_memory.constprop.2
	movq	all_string_list(%rip), %rdx
	cmpb	$0, initialized(%rip)
	movq	%rbx, DEFAULT_INIT_NAME(%rip)
	movq	%rbx, (%rax)
	movq	$4, 8(%rax)
	movq	%rdx, 16(%rax)
	movq	%rax, all_string_list(%rip)
	je	.L492
.L481:
	movq	string_memory(%rip), %rdx
	movq	8(%rdx), %rax
	leaq	13(%rax), %rcx
	cmpq	(%rdx), %rcx
	jnb	.L493
.L482:
	movq	24(%rdx), %rbx
	addq	%rax, %rbx
	addq	$14, %rax
	movq	%rax, 8(%rdx)
	movabsq	$8462954688905437988, %rax
	movq	%rax, (%rbx)
	movabsq	$32210693020545652, %rax
	movq	%rax, 5(%rbx)
	movb	$0, 13(%rbx)
	call	alloc_memory.constprop.2
	movq	all_string_list(%rip), %rdx
	movq	%rbx, DEFAULT_CONSTRUCTOR_NAME(%rip)
	movq	%rbx, (%rax)
	movq	$13, 8(%rax)
	movq	%rdx, 16(%rax)
	movq	%rax, all_string_list(%rip)
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L490:
	call	init.part.0
	jmp	.L479
	.p2align 4,,10
	.p2align 3
.L492:
	call	init.part.0
	jmp	.L481
	.p2align 4,,10
	.p2align 3
.L491:
	xorl	%ecx, %ecx
	call	increase_memory_size
	movq	string_memory(%rip), %rdx
	movq	8(%rdx), %rax
	jmp	.L480
	.p2align 4,,10
	.p2align 3
.L493:
	xorl	%ecx, %ecx
	call	increase_memory_size
	movq	string_memory(%rip), %rdx
	movq	8(%rdx), %rax
	jmp	.L482
.L488:
	movl	$32, %ecx
	call	malloc
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L474
	movl	$1024, %ecx
	call	malloc
	movdqu	.LC11(%rip), %xmm0
	movq	$0, 16(%rbx)
	movq	%rax, 24(%rbx)
	movq	%rbx, string_memory(%rip)
	movq	$1024, string_memory_count(%rip)
	movups	%xmm0, (%rbx)
	jmp	.L473
.L487:
	movl	$32, %ecx
	call	malloc
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L474
	movl	$1024, %ecx
	call	malloc
	movdqu	.LC11(%rip), %xmm0
	movq	$0, 16(%rbx)
	movq	%rax, 24(%rbx)
	movq	%rbx, struct_memory(%rip)
	movq	$1024, struct_memory_count(%rip)
	movups	%xmm0, (%rbx)
	jmp	.L471
.L474:
	call	create_memory_block.part.0
	.p2align 4
	.def	alloc_memory;	.scl	3;	.type	32;	.endef
alloc_memory:
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$40, %rsp
	cmpb	$0, initialized(%rip)
	je	.L499
.L495:
	movq	struct_memory(%rip), %rdx
	addq	$7, %rbx
	andq	$-8, %rbx
	movq	8(%rdx), %rsi
	leaq	(%rsi,%rbx), %rax
	cmpq	(%rdx), %rax
	jnb	.L500
.L496:
	testb	$7, %sil
	jne	.L501
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
.L499:
	call	init.part.0
	jmp	.L495
	.p2align 4,,10
	.p2align 3
.L500:
	movl	$1, %ecx
	call	increase_memory_size
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %rsi
	jmp	.L496
.L501:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, %r8
	leaq	.LC93(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
	.p2align 4
	.def	alloc_memory.constprop.0;	.scl	3;	.type	32;	.endef
alloc_memory.constprop.0:
	subq	$56, %rsp
	cmpb	$0, initialized(%rip)
	je	.L507
.L503:
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %r8
	leaq	16(%r8), %rax
	cmpq	(%rdx), %rax
	jnb	.L508
.L504:
	testb	$7, %r8b
	jne	.L509
	movq	%r8, %rax
	addq	$16, %r8
	addq	$1, memoryBlockCount(%rip)
	movq	%r8, 8(%rdx)
	andq	$-8, %rax
	addq	24(%rdx), %rax
	addq	$56, %rsp
	ret
	.p2align 4,,10
	.p2align 3
.L507:
	call	init.part.0
	jmp	.L503
	.p2align 4,,10
	.p2align 3
.L508:
	movl	$1, %ecx
	call	increase_memory_size
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %r8
	jmp	.L504
.L509:
	movq	%r8, 40(%rsp)
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	40(%rsp), %r8
	leaq	.LC93(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
	.section .rdata,"dr"
.LC94:
	.ascii "type: \"name\"\12\0"
.LC95:
	.ascii "name\12\0"
.LC96:
	.ascii "type: \"function_call\"\12\0"
.LC97:
	.ascii "function\12\0"
.LC98:
	.ascii "arguments\12\0"
.LC99:
	.ascii "arguments[%d]\12\0"
.LC100:
	.ascii "type: \"get sequence_element\"\12\0"
.LC101:
	.ascii "sequence\12\0"
.LC102:
	.ascii "index\12\0"
.LC103:
	.ascii "type: \"get_attribute\"\12\0"
.LC104:
	.ascii "object\12\0"
.LC105:
	.ascii "attribute_name\12\0"
	.align 8
.LC106:
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
	je	.L511
	ja	.L512
	testl	%eax, %eax
	je	.L530
	movq	8(%rcx), %r15
	leaq	1(%r8), %r14
	testq	%r15, %r15
	je	.L517
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movups	%xmm0, (%rax)
	movdqu	(%r15), %xmm1
	movq	%rbx, %rcx
	movq	%rax, %r13
	leaq	.LC99(%rip), %r15
	movups	%xmm1, (%rax)
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$22, %r8d
	movl	$1, %edx
	leaq	.LC96(%rip), %rcx
	call	fwrite
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC97(%rip), %rcx
	call	fwrite
	movq	(%r12), %rcx
	movq	%rsi, %r9
	movq	%r14, %r8
	movq	%rbx, %rdx
	movl	$-1, %r12d
	call	output_variable_access
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.7
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC98(%rip), %rcx
	call	fwrite
	leaq	2(%rdi), %rax
	movq	%rax, 40(%rsp)
	jmp	.L518
	.p2align 4,,10
	.p2align 3
.L521:
	movq	8(%rax), %rdi
	testq	%rdi, %rdi
	je	.L510
.L522:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	addl	$1, %r12d
	call	indention.constprop.6
	movl	%r12d, %r8d
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	fprintf
	movq	40(%rsp), %r8
	movq	%rsi, %r9
	movq	%rbx, %rdx
	movq	%rdi, %rcx
	call	output_expression
.L518:
	movq	0(%r13), %rax
	testq	%rax, %rax
	je	.L510
	movq	(%rax), %rdx
	movq	%rdx, 0(%r13)
	testq	%rdx, %rdx
	jne	.L521
	movq	8(%rax), %rdi
	movq	$0, 8(%r13)
	testq	%rdi, %rdi
	jne	.L522
.L510:
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
.L512:
	cmpl	$3, %eax
	jne	.L531
	movq	%r9, %r8
	movq	%rdi, %rdx
	leaq	1(%rdi), %r13
	movq	%rbx, %rcx
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$29, %r8d
	movl	$1, %edx
	leaq	.LC100(%rip), %rcx
	call	fwrite
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC101(%rip), %rcx
	call	fwrite
	movq	(%r12), %rcx
	movq	%rsi, %r9
	movq	%r13, %r8
	movq	%rbx, %rdx
	call	output_variable_access
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.7
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC102(%rip), %rcx
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
.L531:
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%r9, %r8
	call	indention.constprop.7
	movl	16(%r12), %r8d
	leaq	-56(%rbp), %rsp
	movq	%rbx, %rcx
	leaq	.LC106(%rip), %rdx
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
.L511:
	movq	%r9, %r8
	movq	%rdi, %rdx
	leaq	1(%rdi), %r13
	movq	%rbx, %rcx
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$22, %r8d
	movl	$1, %edx
	leaq	.LC103(%rip), %rcx
	call	fwrite
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC104(%rip), %rcx
	call	fwrite
	movq	(%r12), %rcx
	movq	%rsi, %r9
	movq	%r13, %r8
	movq	%rbx, %rdx
	call	output_variable_access
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.7
	movq	%rbx, %r9
	movl	$15, %r8d
	leaq	.LC105(%rip), %rcx
	movl	$1, %edx
	call	fwrite
	movq	8(%r12), %rcx
	movq	%rsi, %r9
	movq	%r13, %r8
.L529:
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
.L530:
	movq	%r9, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC94(%rip), %rcx
	call	fwrite
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.7
	movq	%rbx, %r9
	movl	$5, %r8d
	leaq	.LC95(%rip), %rcx
	movl	$1, %edx
	call	fwrite
	movq	8(%r12), %rcx
	movq	%rsi, %r9
	leaq	1(%rdi), %r8
	jmp	.L529
	.p2align 4,,10
	.p2align 3
.L517:
	movq	%r9, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$22, %r8d
	movl	$1, %edx
	leaq	.LC96(%rip), %rcx
	call	fwrite
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC97(%rip), %rcx
	call	fwrite
	movq	(%r12), %rcx
	movq	%rsi, %r9
	movq	%r14, %r8
	movq	%rbx, %rdx
	call	output_variable_access
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.7
	leaq	-56(%rbp), %rsp
	movq	%rbx, %r9
	movl	$10, %r8d
	popq	%rbx
	movl	$1, %edx
	leaq	.LC98(%rip), %rcx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	fwrite
	.section .rdata,"dr"
.LC107:
	.ascii "UNKNOWN_OPERATOR\0"
.LC108:
	.ascii "primary\12\0"
.LC109:
	.ascii "type: \"integer\"\12\0"
.LC110:
	.ascii "value: %s\12\0"
.LC111:
	.ascii "type: \"float\"\12\0"
.LC112:
	.ascii "type: \"string\"\12\0"
.LC113:
	.ascii "value: \"%s\"\12\0"
.LC114:
	.ascii "type: \"boolean\"\12\0"
.LC115:
	.ascii "value: \"true\"\12\0"
.LC116:
	.ascii "value: \"false\"\12\0"
.LC117:
	.ascii "type: \"expression\"\12\0"
.LC118:
	.ascii "value\12\0"
.LC119:
	.ascii "type: \"!\"\12\0"
.LC120:
	.ascii "type: \"-\"\12\0"
.LC121:
	.ascii "type: \"variable\"\12\0"
.LC122:
	.ascii "unknown_PrimaryType: %u\12\0"
.LC123:
	.ascii "operator: \"%s\"\12\0"
.LC124:
	.ascii "left\12\0"
.LC125:
	.ascii "right\12\0"
	.text
	.p2align 4
	.def	output_expression;	.scl	3;	.type	32;	.endef
output_expression:
	pushq	%r15
	leaq	.L537(%rip), %r15
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
.L546:
	movl	24(%rbp), %eax
	leaq	.LC124(%rip), %r14
	leaq	.L550(%rip), %r12
	cmpl	$19, %eax
	je	.L586
.L533:
	cmpl	$18, %eax
	ja	.L548
	movslq	(%r12,%rax,4), %rax
	addq	%r12, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L550:
	.long	.L568-.L550
	.long	.L567-.L550
	.long	.L566-.L550
	.long	.L565-.L550
	.long	.L564-.L550
	.long	.L563-.L550
	.long	.L562-.L550
	.long	.L561-.L550
	.long	.L560-.L550
	.long	.L559-.L550
	.long	.L558-.L550
	.long	.L557-.L550
	.long	.L556-.L550
	.long	.L555-.L550
	.long	.L554-.L550
	.long	.L553-.L550
	.long	.L552-.L550
	.long	.L551-.L550
	.long	.L549-.L550
	.text
	.p2align 4,,10
	.p2align 3
.L551:
	movq	208+symbolList(%rip), %r13
	.p2align 4,,10
	.p2align 3
.L570:
	movq	%rdi, %r8
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.6
	testq	%r13, %r13
	je	.L571
.L569:
	movq	%r13, %r8
	leaq	.LC123(%rip), %rdx
	leaq	1(%rsi), %r13
	movq	%rbx, %rcx
	call	fprintf
	movq	%rdi, %r8
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.6
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
	movq	%rdi, %r8
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.7
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC125(%rip), %rcx
	call	fwrite
	movq	16(%rbp), %rbp
	movl	24(%rbp), %eax
	cmpl	$19, %eax
	je	.L572
	movq	%r13, %rsi
	jmp	.L533
	.p2align 4,,10
	.p2align 3
.L552:
	movq	200+symbolList(%rip), %r13
	jmp	.L570
	.p2align 4,,10
	.p2align 3
.L553:
	movq	192+symbolList(%rip), %r13
	jmp	.L570
	.p2align 4,,10
	.p2align 3
.L554:
	movq	184+symbolList(%rip), %r13
	jmp	.L570
	.p2align 4,,10
	.p2align 3
.L555:
	movq	144+symbolList(%rip), %r13
	jmp	.L570
	.p2align 4,,10
	.p2align 3
.L556:
	movq	232+symbolList(%rip), %r13
	jmp	.L570
	.p2align 4,,10
	.p2align 3
.L557:
	movq	224+symbolList(%rip), %r13
	jmp	.L570
	.p2align 4,,10
	.p2align 3
.L558:
	movq	176+symbolList(%rip), %r13
	jmp	.L570
	.p2align 4,,10
	.p2align 3
.L559:
	movq	168+symbolList(%rip), %r13
	jmp	.L570
	.p2align 4,,10
	.p2align 3
.L560:
	movq	136+symbolList(%rip), %r13
	jmp	.L570
	.p2align 4,,10
	.p2align 3
.L561:
	movq	128+symbolList(%rip), %r13
	jmp	.L570
	.p2align 4,,10
	.p2align 3
.L562:
	movq	160+symbolList(%rip), %r13
	jmp	.L570
	.p2align 4,,10
	.p2align 3
.L563:
	movq	152+symbolList(%rip), %r13
	jmp	.L570
	.p2align 4,,10
	.p2align 3
.L564:
	movq	120+symbolList(%rip), %r13
	jmp	.L570
	.p2align 4,,10
	.p2align 3
.L565:
	movq	112+symbolList(%rip), %r13
	jmp	.L570
	.p2align 4,,10
	.p2align 3
.L566:
	movq	104+symbolList(%rip), %r13
	jmp	.L570
	.p2align 4,,10
	.p2align 3
.L567:
	movq	96+symbolList(%rip), %r13
	jmp	.L570
	.p2align 4,,10
	.p2align 3
.L568:
	movq	88+symbolList(%rip), %r13
	jmp	.L570
	.p2align 4,,10
	.p2align 3
.L549:
	movq	216+symbolList(%rip), %r13
	jmp	.L570
	.p2align 4,,10
	.p2align 3
.L586:
	movq	%rsi, %r13
.L572:
	movq	%rdi, %r8
	movq	%r13, %rdx
	leaq	2(%r13), %rsi
	movq	%rbx, %rcx
	call	indention.constprop.7
	movq	%rbx, %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC108(%rip), %rcx
	call	fwrite
	movq	8(%rbp), %rbp
.L534:
	cmpl	$8, 8(%rbp)
	leaq	-1(%rsi), %r12
	ja	.L535
	movl	8(%rbp), %eax
	movq	%rdi, %r8
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movslq	(%r15,%rax,4), %rax
	addq	%r15, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L537:
	.long	.L545-.L537
	.long	.L544-.L537
	.long	.L543-.L537
	.long	.L542-.L537
	.long	.L541-.L537
	.long	.L540-.L537
	.long	.L539-.L537
	.long	.L538-.L537
	.long	.L536-.L537
	.text
.L548:
	movq	%rdi, %r8
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.6
	.p2align 4,,10
	.p2align 3
.L571:
	leaq	.LC107(%rip), %r13
	jmp	.L569
	.p2align 4,,10
	.p2align 3
.L538:
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC120(%rip), %rcx
.L582:
	call	fwrite
	movq	%rdi, %r8
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.7
	movq	%rbx, %r9
	addq	$1, %rsi
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC118(%rip), %rcx
	call	fwrite
	movq	0(%rbp), %rbp
	jmp	.L534
	.p2align 4,,10
	.p2align 3
.L539:
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC119(%rip), %rcx
	jmp	.L582
	.p2align 4,,10
	.p2align 3
.L540:
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$19, %r8d
	movl	$1, %edx
	leaq	.LC117(%rip), %rcx
	call	fwrite
	movq	%rdi, %r8
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.7
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC118(%rip), %rcx
	call	fwrite
	movq	0(%rbp), %rbp
	jmp	.L546
	.p2align 4,,10
	.p2align 3
.L541:
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC114(%rip), %rcx
	call	fwrite
	movq	%rdi, %r8
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.7
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC116(%rip), %rcx
.L585:
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
.L542:
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC114(%rip), %rcx
	call	fwrite
	movq	%rdi, %r8
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.7
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC115(%rip), %rcx
	jmp	.L585
	.p2align 4,,10
	.p2align 3
.L543:
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC112(%rip), %rcx
	call	fwrite
	movq	%rdi, %r8
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.7
	movq	0(%rbp), %r8
	leaq	.LC113(%rip), %rdx
.L584:
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
.L544:
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC111(%rip), %rcx
.L583:
	call	fwrite
	movq	%rdi, %r8
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.7
	movq	0(%rbp), %r8
	leaq	.LC110(%rip), %rdx
	jmp	.L584
	.p2align 4,,10
	.p2align 3
.L545:
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC109(%rip), %rcx
	jmp	.L583
	.p2align 4,,10
	.p2align 3
.L536:
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC121(%rip), %rcx
	call	fwrite
	movq	%rdi, %r8
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.7
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC118(%rip), %rcx
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
.L535:
	movq	%rdi, %r8
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.7
	movl	8(%rbp), %r8d
	addq	$40, %rsp
	movq	%rbx, %rcx
	leaq	.LC122(%rip), %rdx
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
.LC126:
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
	movq	%r9, %r8
	pushq	%rsi
	movq	%r9, %rsi
	leaq	1(%rdi), %r12
	pushq	%rbx
	movq	%rdx, %rbx
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	subq	$32, %rsp
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC84(%rip), %rcx
	call	fwrite
	movq	0(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_name
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC95(%rip), %rcx
	call	fwrite
	movq	8(%rbp), %rcx
	movq	%r12, %r8
	movq	%rbx, %rdx
	movq	%rsi, %r9
	call	output_name
	cmpq	$0, 16(%rbp)
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	je	.L588
	call	indention.constprop.7
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC118(%rip), %rcx
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
.L588:
	call	indention.constprop.7
	addq	$32, %rsp
	movq	%rbx, %r9
	movl	$14, %r8d
	popq	%rbx
	movl	$1, %edx
	leaq	.LC126(%rip), %rcx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	fwrite
	.p2align 4
	.def	output_variable.constprop.0;	.scl	3;	.type	32;	.endef
output_variable.constprop.0:
	pushq	%r14
	pushq	%r13
	leaq	.LC76(%rip), %r13
	pushq	%r12
	leaq	.LC75(%rip), %r12
	pushq	%rbp
	movl	$1, %ebp
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	movq	%r8, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$32, %rsp
	movzbl	(%r8), %eax
	orl	$16, %eax
	movb	%al, (%r8)
	jmp	.L594
	.p2align 4,,10
	.p2align 3
.L621:
	movl	$6, %r8d
	movl	$1, %edx
	movq	%r12, %rcx
	addq	$1, %rbp
	call	fwrite
	cmpq	$4, %rbp
	je	.L593
.L592:
	movzbl	(%rsi), %eax
.L594:
	movsbl	%al, %eax
	movq	%rbx, %r9
	btl	%ebp, %eax
	jc	.L621
	movl	$4, %r8d
	movl	$1, %edx
	movq	%r13, %rcx
	addq	$1, %rbp
	call	fwrite
	cmpq	$4, %rbp
	jne	.L592
.L593:
	leaq	.LC78(%rip), %r13
	movq	%rbx, %r9
	movl	$1, %edx
	movl	$10, %r8d
	movq	%r13, %rcx
	movl	$1, %r14d
	leaq	.LC76(%rip), %r12
	call	fwrite
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC84(%rip), %rcx
	leaq	.LC75(%rip), %rbp
	call	fwrite
	movq	(%rdi), %rcx
	movq	%rsi, %r9
	movq	%rbx, %rdx
	movl	$5, %r8d
	call	output_name
	movzbl	(%rsi), %eax
	orl	$16, %eax
	movb	%al, (%rsi)
	jmp	.L598
	.p2align 4,,10
	.p2align 3
.L622:
	movl	$6, %r8d
	movl	$1, %edx
	movq	%rbp, %rcx
	addq	$1, %r14
	call	fwrite
	cmpq	$4, %r14
	je	.L597
.L596:
	movzbl	(%rsi), %eax
.L598:
	movsbl	%al, %eax
	movq	%rbx, %r9
	btl	%r14d, %eax
	jc	.L622
	movl	$4, %r8d
	movl	$1, %edx
	movq	%r12, %rcx
	addq	$1, %r14
	call	fwrite
	cmpq	$4, %r14
	jne	.L596
.L597:
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	movq	%r13, %rcx
	call	fwrite
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC95(%rip), %rcx
	call	fwrite
	movq	8(%rdi), %rcx
	movq	%rsi, %r9
	movq	%rbx, %rdx
	movl	$5, %r8d
	call	output_name
	cmpq	$0, 16(%rdi)
	movzbl	(%rsi), %eax
	je	.L599
	andl	$-17, %eax
	movl	$1, %ebp
	leaq	.LC76(%rip), %r13
	movb	%al, (%rsi)
	leaq	.LC75(%rip), %r12
	jmp	.L603
	.p2align 4,,10
	.p2align 3
.L623:
	movl	$6, %r8d
	movl	$1, %edx
	movq	%r12, %rcx
	addq	$1, %rbp
	call	fwrite
	cmpq	$4, %rbp
	je	.L602
.L601:
	movzbl	(%rsi), %eax
.L603:
	movsbl	%al, %eax
	movq	%rbx, %r9
	btl	%ebp, %eax
	jc	.L623
	movl	$4, %r8d
	movl	$1, %edx
	movq	%r13, %rcx
	addq	$1, %rbp
	call	fwrite
	cmpq	$4, %rbp
	jne	.L601
.L602:
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC77(%rip), %rcx
	call	fwrite
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC118(%rip), %rcx
	call	fwrite
	movq	16(%rdi), %rcx
	addq	$32, %rsp
	movq	%rsi, %r9
	movq	%rbx, %rdx
	movl	$5, %r8d
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	output_expression
	.p2align 4,,10
	.p2align 3
.L599:
	andl	$-17, %eax
	movl	$1, %edi
	leaq	.LC76(%rip), %r12
	movb	%al, (%rsi)
	leaq	.LC75(%rip), %rbp
	jmp	.L607
	.p2align 4,,10
	.p2align 3
.L624:
	movl	$6, %r8d
	movl	$1, %edx
	movq	%rbp, %rcx
	addq	$1, %rdi
	call	fwrite
	cmpq	$4, %rdi
	je	.L606
.L605:
	movzbl	(%rsi), %eax
.L607:
	movsbl	%al, %eax
	movq	%rbx, %r9
	btl	%edi, %eax
	jc	.L624
	movl	$4, %r8d
	movl	$1, %edx
	movq	%r12, %rcx
	addq	$1, %rdi
	call	fwrite
	cmpq	$4, %rdi
	jne	.L605
.L606:
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC77(%rip), %rcx
	call	fwrite
	addq	$32, %rsp
	movq	%rbx, %r9
	movl	$14, %r8d
	popq	%rbx
	movl	$1, %edx
	leaq	.LC126(%rip), %rcx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	fwrite
	.p2align 4
	.def	output_variable.constprop.1;	.scl	3;	.type	32;	.endef
output_variable.constprop.1:
	pushq	%r14
	pushq	%r13
	leaq	.LC76(%rip), %r13
	pushq	%r12
	leaq	.LC75(%rip), %r12
	pushq	%rbp
	movl	$1, %ebp
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	movq	%r8, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$32, %rsp
	movzbl	(%r8), %eax
	orl	$64, %eax
	movb	%al, (%r8)
	jmp	.L629
	.p2align 4,,10
	.p2align 3
.L656:
	movl	$6, %r8d
	movl	$1, %edx
	movq	%r12, %rcx
	addq	$1, %rbp
	call	fwrite
	cmpq	$6, %rbp
	je	.L628
.L627:
	movzbl	(%rsi), %eax
.L629:
	movsbl	%al, %eax
	movq	%rbx, %r9
	btl	%ebp, %eax
	jc	.L656
	movl	$4, %r8d
	movl	$1, %edx
	movq	%r13, %rcx
	addq	$1, %rbp
	call	fwrite
	cmpq	$6, %rbp
	jne	.L627
.L628:
	leaq	.LC78(%rip), %r13
	movq	%rbx, %r9
	movl	$1, %edx
	movl	$10, %r8d
	movq	%r13, %rcx
	movl	$1, %r14d
	leaq	.LC76(%rip), %r12
	call	fwrite
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC84(%rip), %rcx
	leaq	.LC75(%rip), %rbp
	call	fwrite
	movq	(%rdi), %rcx
	movq	%rsi, %r9
	movq	%rbx, %rdx
	movl	$7, %r8d
	call	output_name
	movzbl	(%rsi), %eax
	orl	$64, %eax
	movb	%al, (%rsi)
	jmp	.L633
	.p2align 4,,10
	.p2align 3
.L657:
	movl	$6, %r8d
	movl	$1, %edx
	movq	%rbp, %rcx
	addq	$1, %r14
	call	fwrite
	cmpq	$6, %r14
	je	.L632
.L631:
	movzbl	(%rsi), %eax
.L633:
	movsbl	%al, %eax
	movq	%rbx, %r9
	btl	%r14d, %eax
	jc	.L657
	movl	$4, %r8d
	movl	$1, %edx
	movq	%r12, %rcx
	addq	$1, %r14
	call	fwrite
	cmpq	$6, %r14
	jne	.L631
.L632:
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	movq	%r13, %rcx
	call	fwrite
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC95(%rip), %rcx
	call	fwrite
	movq	8(%rdi), %rcx
	movq	%rsi, %r9
	movq	%rbx, %rdx
	movl	$7, %r8d
	call	output_name
	cmpq	$0, 16(%rdi)
	movzbl	(%rsi), %eax
	je	.L634
	andl	$-65, %eax
	movl	$1, %ebp
	leaq	.LC76(%rip), %r13
	movb	%al, (%rsi)
	leaq	.LC75(%rip), %r12
	jmp	.L638
	.p2align 4,,10
	.p2align 3
.L658:
	movl	$6, %r8d
	movl	$1, %edx
	movq	%r12, %rcx
	addq	$1, %rbp
	call	fwrite
	cmpq	$6, %rbp
	je	.L637
.L636:
	movzbl	(%rsi), %eax
.L638:
	movsbl	%al, %eax
	movq	%rbx, %r9
	btl	%ebp, %eax
	jc	.L658
	movl	$4, %r8d
	movl	$1, %edx
	movq	%r13, %rcx
	addq	$1, %rbp
	call	fwrite
	cmpq	$6, %rbp
	jne	.L636
.L637:
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC77(%rip), %rcx
	call	fwrite
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC118(%rip), %rcx
	call	fwrite
	movq	16(%rdi), %rcx
	addq	$32, %rsp
	movq	%rsi, %r9
	movq	%rbx, %rdx
	movl	$7, %r8d
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	output_expression
	.p2align 4,,10
	.p2align 3
.L634:
	andl	$-65, %eax
	movl	$1, %edi
	leaq	.LC76(%rip), %r12
	movb	%al, (%rsi)
	leaq	.LC75(%rip), %rbp
	jmp	.L642
	.p2align 4,,10
	.p2align 3
.L659:
	movl	$6, %r8d
	movl	$1, %edx
	movq	%rbp, %rcx
	addq	$1, %rdi
	call	fwrite
	cmpq	$6, %rdi
	je	.L641
.L640:
	movzbl	(%rsi), %eax
.L642:
	movsbl	%al, %eax
	movq	%rbx, %r9
	btl	%edi, %eax
	jc	.L659
	movl	$4, %r8d
	movl	$1, %edx
	movq	%r12, %rcx
	addq	$1, %rdi
	call	fwrite
	cmpq	$6, %rdi
	jne	.L640
.L641:
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC77(%rip), %rcx
	call	fwrite
	addq	$32, %rsp
	movq	%rbx, %r9
	movl	$14, %r8d
	popq	%rbx
	movl	$1, %edx
	leaq	.LC126(%rip), %rcx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	fwrite
	.p2align 4
	.def	search_var;	.scl	3;	.type	32;	.endef
search_var:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movq	%rcx, %rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	movq	8(%rdx), %rax
	testq	%rax, %rax
	je	.L666
	movq	24(%rax), %rdi
	testq	%rdi, %rdi
	je	.L664
	cmpq	$0, (%rdi)
	je	.L664
	cmpq	$0, 8(%rdi)
	je	.L664
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%rdi), %xmm2
	movq	%rax, %rcx
	movq	%xmm2, %rdx
	movups	%xmm2, (%rax)
	testq	%rdx, %rdx
	je	.L668
	movq	%rdx, %rax
	movq	(%rdx), %rdx
	movq	%rdx, (%rcx)
	testq	%rdx, %rdx
	je	.L667
.L735:
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L668
	cmpq	%rbx, (%rax)
	je	.L660
	movq	%rdx, %rax
	movq	(%rdx), %rdx
	movq	%rdx, (%rcx)
	testq	%rdx, %rdx
	jne	.L735
.L667:
	movq	8(%rax), %rax
	movq	$0, 8(%rcx)
	testq	%rax, %rax
	je	.L668
	cmpq	(%rax), %rbx
	je	.L660
.L668:
	movq	8(%rsi), %rax
	testq	%rax, %rax
	je	.L666
.L664:
	movq	16(%rax), %rdi
	testq	%rdi, %rdi
	je	.L666
	cmpq	$0, (%rdi)
	je	.L666
	cmpq	$0, 8(%rdi)
	je	.L666
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%rdi), %xmm3
	movq	%rax, %rcx
	movq	%xmm3, %rdx
	movups	%xmm3, (%rax)
	testq	%rdx, %rdx
	je	.L666
	movq	%rdx, %rax
	movq	(%rdx), %rdx
	movq	%rdx, (%rcx)
	testq	%rdx, %rdx
	je	.L670
.L736:
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L666
	cmpq	(%rax), %rbx
	je	.L660
	movq	%rdx, %rax
	movq	(%rdx), %rdx
	movq	%rdx, (%rcx)
	testq	%rdx, %rdx
	jne	.L736
.L670:
	movq	8(%rax), %rax
	movq	$0, 8(%rcx)
	testq	%rax, %rax
	je	.L666
	cmpq	(%rax), %rbx
	je	.L660
.L666:
	cmpq	$0, 24(%rsi)
	movq	(%rsi), %rax
	je	.L663
	movq	(%rax), %r12
	testq	%r12, %r12
	je	.L663
	cmpq	$0, (%r12)
	je	.L663
	cmpq	$0, 8(%r12)
	je	.L663
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%r12), %xmm4
	movq	%rax, %rdi
	movq	%xmm4, %rdx
	movups	%xmm4, (%rax)
	testq	%rdx, %rdx
	jne	.L672
	jmp	.L731
	.p2align 4,,10
	.p2align 3
.L679:
	movq	8(%rdx), %rdx
	testq	%rdx, %rdx
	je	.L731
	movq	24(%rsi), %rcx
	movq	(%rcx), %rcx
	cmpq	%rcx, 8(%rdx)
	je	.L737
.L673:
	testq	%rax, %rax
	je	.L731
	movq	%rax, %rdx
.L672:
	movq	(%rdx), %rax
	movq	%rax, (%rdi)
	testq	%rax, %rax
	jne	.L679
	movq	$0, 8(%rdi)
	jmp	.L679
	.p2align 4,,10
	.p2align 3
.L731:
	movq	(%rsi), %rax
	.p2align 4,,10
	.p2align 3
.L663:
	movq	16(%rax), %rsi
	testq	%rsi, %rsi
	je	.L682
	cmpq	$0, (%rsi)
	je	.L682
	cmpq	$0, 8(%rsi)
	je	.L682
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%rsi), %xmm1
	movq	%rax, %rcx
	movq	%xmm1, %rdx
	movups	%xmm1, (%rax)
	testq	%rdx, %rdx
	je	.L682
	movq	%rdx, %rax
	movq	(%rdx), %rdx
	movq	%rdx, (%rcx)
	testq	%rdx, %rdx
	je	.L683
.L738:
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L682
	cmpq	(%rax), %rbx
	je	.L660
	movq	%rdx, %rax
	movq	(%rdx), %rdx
	movq	%rdx, (%rcx)
	testq	%rdx, %rdx
	jne	.L738
.L683:
	movq	8(%rax), %rax
	movq	$0, 8(%rcx)
	testq	%rax, %rax
	je	.L682
	cmpq	(%rax), %rbx
	je	.L660
.L682:
	xorl	%eax, %eax
.L660:
	leaq	-32(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L737:
	movq	(%rdx), %r12
	testq	%r12, %r12
	je	.L673
	cmpq	$0, (%r12)
	je	.L673
	cmpq	$0, 8(%r12)
	je	.L673
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%r12), %xmm5
	movq	%rax, %rcx
	movq	%xmm5, %rdx
	movups	%xmm5, (%rax)
	testq	%rdx, %rdx
	je	.L677
	.p2align 4,,10
	.p2align 3
.L675:
	movq	%rdx, %rax
	movq	(%rdx), %rdx
	movq	%rdx, (%rcx)
	testq	%rdx, %rdx
	je	.L676
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L677
	movq	(%rax), %rax
	cmpq	(%rax), %rbx
	jne	.L675
	jmp	.L660
	.p2align 4,,10
	.p2align 3
.L676:
	movq	8(%rax), %rax
	movq	$0, 8(%rcx)
	testq	%rax, %rax
	je	.L677
	movq	(%rax), %rax
	cmpq	%rbx, (%rax)
	je	.L660
.L677:
	movq	(%rdi), %rax
	jmp	.L673
	.p2align 4
	.def	alloc_memory.constprop.1;	.scl	3;	.type	32;	.endef
alloc_memory.constprop.1:
	subq	$56, %rsp
	cmpb	$0, initialized(%rip)
	je	.L744
.L740:
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %r8
	leaq	32(%r8), %rax
	cmpq	(%rdx), %rax
	jnb	.L745
.L741:
	testb	$7, %r8b
	jne	.L746
	movq	%r8, %rax
	addq	$32, %r8
	addq	$1, memoryBlockCount(%rip)
	movq	%r8, 8(%rdx)
	andq	$-8, %rax
	addq	24(%rdx), %rax
	addq	$56, %rsp
	ret
	.p2align 4,,10
	.p2align 3
.L744:
	call	init.part.0
	jmp	.L740
	.p2align 4,,10
	.p2align 3
.L745:
	movl	$1, %ecx
	call	increase_memory_size
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %r8
	jmp	.L741
.L746:
	movq	%r8, 40(%rsp)
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	40(%rsp), %r8
	leaq	.LC93(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
	.section .rdata,"dr"
	.align 8
.LC127:
	.ascii "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\12\0"
	.align 8
.LC128:
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
	jne	.L748
	movq	%r8, %rax
	orq	%rdi, %rax
	je	.L765
	call	alloc_memory.constprop.1
	movl	%ebx, 24(%rax)
	testq	%rdi, %rdi
	je	.L755
	movq	%rdi, (%rax)
.L756:
	movq	%rsi, 16(%rax)
.L747:
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L765:
	leaq	.LC0(%rip), %rbp
	testq	%r9, %r9
	je	.L759
	leaq	.LC1(%rip), %r12
	movq	%rbp, %rsi
	jmp	.L750
	.p2align 4,,10
	.p2align 3
.L748:
	leaq	.LC0(%rip), %rax
	leaq	.LC1(%rip), %r9
	testq	%rsi, %rsi
	movq	%rax, %r12
	movq	%rax, %rbp
	cmovne	%r9, %r12
	testq	%r8, %r8
	cmovne	%r9, %rbp
	testq	%rdi, %rdi
	cmovne	%r9, %rax
	movq	%rax, %rsi
.L750:
	cmpl	$19, %ebx
	leaq	.LC0(%rip), %rax
	leaq	.LC1(%rip), %rbx
	movl	$2, %ecx
	cmove	%rax, %rbx
	call	*__imp___acrt_iob_func(%rip)
	movq	%r12, 40(%rsp)
	movq	%rsi, %r9
	leaq	.LC127(%rip), %rdx
	movq	%rbp, 32(%rsp)
	movq	%rax, %rcx
	movq	%rbx, %r8
	call	fprintf
	xorl	%eax, %eax
	jmp	.L747
	.p2align 4,,10
	.p2align 3
.L759:
	movq	%rbp, %r12
	movq	%rbp, %rsi
	jmp	.L750
	.p2align 4,,10
	.p2align 3
.L755:
	testq	%rbp, %rbp
	je	.L757
	movq	%rbp, 8(%rax)
	jmp	.L756
.L757:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$65, %r8d
	movl	$1, %edx
	leaq	.LC128(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L747
	.p2align 4
	.def	alloc_memory.constprop.2;	.scl	3;	.type	32;	.endef
alloc_memory.constprop.2:
	subq	$56, %rsp
	cmpb	$0, initialized(%rip)
	je	.L771
.L767:
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %r8
	leaq	24(%r8), %rax
	cmpq	(%rdx), %rax
	jnb	.L772
.L768:
	testb	$7, %r8b
	jne	.L773
	movq	%r8, %rax
	addq	$24, %r8
	addq	$1, memoryBlockCount(%rip)
	movq	%r8, 8(%rdx)
	andq	$-8, %rax
	addq	24(%rdx), %rax
	addq	$56, %rsp
	ret
	.p2align 4,,10
	.p2align 3
.L771:
	call	init.part.0
	jmp	.L767
	.p2align 4,,10
	.p2align 3
.L772:
	movl	$1, %ecx
	call	increase_memory_size
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %r8
	jmp	.L768
.L773:
	movq	%r8, 40(%rsp)
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	40(%rsp), %r8
	leaq	.LC93(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
	.p2align 4
	.def	create_string_check.constprop.0;	.scl	3;	.type	32;	.endef
create_string_check.constprop.0:
	pushq	%r12
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	subq	$32, %rsp
	cmpb	$0, initialized(%rip)
	je	.L790
.L775:
	testq	%rbp, %rbp
	je	.L780
	testq	%rsi, %rsi
	je	.L780
	movq	all_string_list(%rip), %rbx
	testq	%rbx, %rbx
	je	.L777
	xorl	%r12d, %r12d
	jmp	.L779
	.p2align 4,,10
	.p2align 3
.L778:
	movq	16(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L791
.L779:
	cmpq	8(%rbx), %rsi
	jne	.L778
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L778
	movq	%rsi, %r8
	movq	%rbp, %rdx
	movq	%rdi, %rcx
	call	strncmp
	movq	16(%rbx), %rbx
	testl	%eax, %eax
	cmove	%rdi, %r12
	testq	%rbx, %rbx
	jne	.L779
.L791:
	testq	%r12, %r12
	je	.L777
	addq	$32, %rsp
	movq	%r12, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L777:
	addq	$32, %rsp
	movq	%rsi, %rdx
	movq	%rbp, %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	create_string_check.part.0
	.p2align 4,,10
	.p2align 3
.L790:
	call	init.part.0
	jmp	.L775
	.p2align 4,,10
	.p2align 3
.L780:
	addq	$32, %rsp
	xorl	%r12d, %r12d
	popq	%rbx
	movq	%r12, %rax
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.section .rdata,"dr"
	.align 8
.LC129:
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
	subq	$48, %rsp
	testq	%rcx, %rcx
	je	.L800
	cmpb	$0, initialized(%rip)
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	je	.L801
.L794:
	movq	struct_memory(%rip), %rcx
	movq	8(%rcx), %r8
	leaq	16(%r8), %rax
	cmpq	(%rcx), %rax
	jnb	.L802
.L795:
	testb	$7, %r8b
	jne	.L803
	movq	%r8, %rax
	addq	$1, memoryBlockCount(%rip)
	addq	$16, %r8
	andq	$-8, %rax
	addq	24(%rcx), %rax
	cmpq	$0, (%rbx)
	movq	%r8, 8(%rcx)
	movq	$0, (%rax)
	movq	%rsi, 8(%rax)
	je	.L804
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
.L801:
	call	init.part.0
	jmp	.L794
	.p2align 4,,10
	.p2align 3
.L802:
	movl	$1, %ecx
	call	increase_memory_size
	movq	struct_memory(%rip), %rcx
	movq	8(%rcx), %r8
	jmp	.L795
	.p2align 4,,10
	.p2align 3
.L804:
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
.L800:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	-16(%rbp), %rsp
	movl	$38, %r8d
	movl	$1, %edx
	popq	%rbx
	movq	%rax, %r9
	leaq	.LC129(%rip), %rcx
	popq	%rsi
	popq	%rbp
	jmp	fwrite
.L803:
	movq	%r8, 40(%rsp)
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	40(%rsp), %r8
	leaq	.LC93(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
	.section .rdata,"dr"
	.align 8
.LC130:
	.ascii "[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\12\0"
	.align 8
.LC131:
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
	je	.L806
	jbe	.L840
	movq	%r9, %r13
	testq	%r9, %r9
	je	.L841
.L810:
	movq	%r13, %rcx
.L818:
	movq	8(%rcx), %rax
	jmp	.L839
	.p2align 4,,10
	.p2align 3
.L842:
	movq	8(%rax), %rdx
	cmpq	8(%rdx), %rbx
	je	.L816
.L839:
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L842
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	jne	.L818
	.p2align 4,,10
	.p2align 3
.L825:
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
.L805:
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
.L840:
	cmpl	$1, %edx
	jne	.L843
	movq	32(%r9), %rax
	movq	(%rax), %r13
	testq	%r13, %r13
	jne	.L810
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
	jmp	.L826
	.p2align 4,,10
	.p2align 3
.L816:
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
	leaq	.LC131(%rip), %rdx
	call	fprintf
	jmp	.L825
	.p2align 4,,10
	.p2align 3
.L806:
	movq	32(%r9), %rax
	movq	(%rax), %r13
	testq	%r13, %r13
	jne	.L810
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
	jmp	.L826
	.p2align 4,,10
	.p2align 3
.L843:
	movq	16(%r9), %rax
	movq	(%rax), %r13
	testq	%r13, %r13
	jne	.L810
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
.L826:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%r13, 32(%rsp)
	movl	%edi, %r9d
	movq	%rbx, %r8
	movq	%rax, %rcx
	leaq	.LC130(%rip), %rdx
	call	fprintf
	jmp	.L805
.L841:
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
	jmp	.L826
	.section .rdata,"dr"
.LC132:
	.ascii "\0"
.LC133:
	.ascii "$%d-error\0"
.LC134:
	.ascii "$%c%zu\0"
	.text
	.p2align 4
	.def	create_var.part.0.constprop.0;	.scl	3;	.type	32;	.endef
create_var.part.0.constprop.0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	call	alloc_memory.constprop.2
	movq	80(%rbx), %rdi
	cmpb	$0, initialized(%rip)
	movq	$0, (%rax)
	movq	%rax, %rsi
	leaq	1(%rdi), %rax
	movq	%rax, 80(%rbx)
	je	.L862
.L845:
	movq	all_string_list(%rip), %rax
	testq	%rax, %rax
	je	.L846
	xorl	%ebx, %ebx
	jmp	.L848
	.p2align 4,,10
	.p2align 3
.L847:
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L863
.L848:
	cmpq	$32, 8(%rax)
	jne	.L847
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L847
	movq	16(%rax), %rax
	cmpb	$0, (%rdx)
	cmove	%rdx, %rbx
	testq	%rax, %rax
	jne	.L848
.L863:
	testq	%rbx, %rbx
	je	.L846
	movq	%rbx, 8(%rsi)
	cmpq	$-1, %rdi
	je	.L864
.L851:
	movq	%rdi, %r9
	movl	$98, %r8d
	leaq	.LC134(%rip), %rdx
	movq	%rbx, %rcx
	call	sprintf
.L852:
	movq	$0, 16(%rsi)
	leaq	-24(%rbp), %rsp
	movq	%rsi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L846:
	movq	string_memory(%rip), %rdx
	movq	8(%rdx), %rax
	leaq	32(%rax), %rcx
	cmpq	(%rdx), %rcx
	jnb	.L865
.L850:
	movq	24(%rdx), %rbx
	movdqu	.LC132(%rip), %xmm0
	movdqu	16+.LC132(%rip), %xmm1
	addq	%rax, %rbx
	addq	$33, %rax
	movq	%rax, 8(%rdx)
	movb	$0, 32(%rbx)
	movups	%xmm0, (%rbx)
	movups	%xmm1, 16(%rbx)
	call	alloc_memory.constprop.2
	movq	all_string_list(%rip), %rdx
	movq	%rbx, (%rax)
	movq	$32, 8(%rax)
	movq	%rdx, 16(%rax)
	movq	%rax, all_string_list(%rip)
	movq	%rbx, 8(%rsi)
	cmpq	$-1, %rdi
	jne	.L851
.L864:
	movl	$98, %r8d
	leaq	.LC133(%rip), %rdx
	movq	%rbx, %rcx
	call	sprintf
	jmp	.L852
	.p2align 4,,10
	.p2align 3
.L862:
	call	init.part.0
	jmp	.L845
	.p2align 4,,10
	.p2align 3
.L865:
	xorl	%ecx, %ecx
	call	increase_memory_size
	movq	string_memory(%rip), %rdx
	movq	8(%rdx), %rax
	jmp	.L850
	.p2align 4
	.def	create_var.part.0.constprop.1;	.scl	3;	.type	32;	.endef
create_var.part.0.constprop.1:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r13
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	call	alloc_memory.constprop.2
	movq	72(%rdi), %r13
	cmpb	$0, initialized(%rip)
	movq	$0, (%rax)
	movq	%rax, %rsi
	leaq	1(%r13), %rax
	movq	%rax, 72(%rdi)
	je	.L884
.L867:
	movq	all_string_list(%rip), %rax
	testq	%rax, %rax
	je	.L868
	xorl	%ebx, %ebx
	jmp	.L870
	.p2align 4,,10
	.p2align 3
.L869:
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L885
.L870:
	cmpq	$32, 8(%rax)
	jne	.L869
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L869
	movq	16(%rax), %rax
	cmpb	$0, (%rdx)
	cmove	%rdx, %rbx
	testq	%rax, %rax
	jne	.L870
.L885:
	testq	%rbx, %rbx
	je	.L868
	movq	%rbx, 8(%rsi)
	cmpq	$-1, %r13
	je	.L886
.L873:
	movq	%r13, %r9
	movl	$116, %r8d
	leaq	.LC134(%rip), %rdx
	movq	%rbx, %rcx
	call	sprintf
.L874:
	movq	8(%rdi), %rax
	movq	%r12, 16(%rsi)
	movq	%rsi, %rdx
	movq	24(%rax), %rcx
	call	list_append
	leaq	-40(%rbp), %rsp
	movq	%rsi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L868:
	movq	string_memory(%rip), %rdx
	movq	8(%rdx), %rax
	leaq	32(%rax), %rcx
	cmpq	(%rdx), %rcx
	jnb	.L887
.L872:
	movq	24(%rdx), %rbx
	movdqu	.LC132(%rip), %xmm0
	movdqu	16+.LC132(%rip), %xmm1
	addq	%rax, %rbx
	addq	$33, %rax
	movq	%rax, 8(%rdx)
	movb	$0, 32(%rbx)
	movups	%xmm0, (%rbx)
	movups	%xmm1, 16(%rbx)
	call	alloc_memory.constprop.2
	movq	all_string_list(%rip), %rdx
	movq	%rbx, (%rax)
	movq	$32, 8(%rax)
	movq	%rdx, 16(%rax)
	movq	%rax, all_string_list(%rip)
	movq	%rbx, 8(%rsi)
	cmpq	$-1, %r13
	jne	.L873
.L886:
	movl	$116, %r8d
	leaq	.LC133(%rip), %rdx
	movq	%rbx, %rcx
	call	sprintf
	jmp	.L874
	.p2align 4,,10
	.p2align 3
.L884:
	call	init.part.0
	jmp	.L867
	.p2align 4,,10
	.p2align 3
.L887:
	xorl	%ecx, %ecx
	call	increase_memory_size
	movq	string_memory(%rip), %rdx
	movq	8(%rdx), %rax
	jmp	.L872
	.p2align 4
	.def	load_rvalue.part.0;	.scl	3;	.type	32;	.endef
load_rvalue.part.0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	movq	8(%rcx), %r13
	call	alloc_memory.constprop.2
	movq	72(%rdi), %r14
	cmpb	$0, initialized(%rip)
	movq	$0, (%rax)
	movq	%rax, %rbx
	leaq	1(%r14), %rax
	movq	%rax, 72(%rdi)
	je	.L909
.L889:
	movq	all_string_list(%rip), %rax
	testq	%rax, %rax
	je	.L890
	xorl	%esi, %esi
	jmp	.L892
	.p2align 4,,10
	.p2align 3
.L891:
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L910
.L892:
	cmpq	$32, 8(%rax)
	jne	.L891
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L891
	movq	16(%rax), %rax
	cmpb	$0, (%rdx)
	cmove	%rdx, %rsi
	testq	%rax, %rax
	jne	.L892
.L910:
	testq	%rsi, %rsi
	je	.L890
	movq	%rsi, 8(%rbx)
	cmpq	$-1, %r14
	je	.L911
.L895:
	movq	%r14, %r9
	movl	$116, %r8d
	leaq	.LC134(%rip), %rdx
	movq	%rsi, %rcx
	call	sprintf
.L896:
	movq	8(%rdi), %rax
	movq	%r13, 16(%rbx)
	movq	%rbx, %rdx
	movq	24(%rax), %rcx
	call	list_append
	call	alloc_memory.constprop.2
	movq	%rbx, %xmm0
	movhps	16(%rbx), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rsi
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory.constprop.1
	movq	%r12, 8(%rax)
	movq	%rax, %rbx
	movl	$23, 24(%rax)
	movq	%rsi, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rdi), %rax
	movq	8(%rax), %rdi
	testq	%rdi, %rdi
	je	.L912
	call	alloc_memory.constprop.0
	cmpq	$0, (%rdi)
	movq	$0, (%rax)
	movq	%rbx, 8(%rax)
	je	.L913
	movq	8(%rdi), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rdi)
.L888:
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
.L890:
	movq	string_memory(%rip), %rdx
	movq	8(%rdx), %rax
	leaq	32(%rax), %rcx
	cmpq	(%rdx), %rcx
	jnb	.L914
.L894:
	movq	24(%rdx), %rsi
	movdqu	.LC132(%rip), %xmm1
	movdqu	16+.LC132(%rip), %xmm2
	addq	%rax, %rsi
	addq	$33, %rax
	movq	%rax, 8(%rdx)
	movb	$0, 32(%rsi)
	movups	%xmm1, (%rsi)
	movups	%xmm2, 16(%rsi)
	call	alloc_memory.constprop.2
	movq	all_string_list(%rip), %rdx
	movq	%rsi, (%rax)
	movq	$32, 8(%rax)
	movq	%rdx, 16(%rax)
	movq	%rax, all_string_list(%rip)
	movq	%rsi, 8(%rbx)
	cmpq	$-1, %r14
	jne	.L895
.L911:
	movl	$116, %r8d
	leaq	.LC133(%rip), %rdx
	movq	%rsi, %rcx
	call	sprintf
	jmp	.L896
	.p2align 4,,10
	.p2align 3
.L909:
	call	init.part.0
	jmp	.L889
	.p2align 4,,10
	.p2align 3
.L913:
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm0
	movups	%xmm0, (%rdi)
	jmp	.L888
	.p2align 4,,10
	.p2align 3
.L912:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC129(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L888
	.p2align 4,,10
	.p2align 3
.L914:
	xorl	%ecx, %ecx
	call	increase_memory_size
	movq	string_memory(%rip), %rdx
	movq	8(%rdx), %rax
	jmp	.L894
	.p2align 4
	.def	create_block;	.scl	3;	.type	32;	.endef
create_block:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$48, %rsp
	cmpb	$0, initialized(%rip)
	je	.L924
.L916:
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %r8
	leaq	16(%r8), %rax
	cmpq	(%rdx), %rax
	jnb	.L925
.L917:
	testb	$7, %r8b
	jne	.L923
	movq	%r8, %rbx
	addq	$1, memoryBlockCount(%rip)
	addq	$16, %r8
	andq	$-8, %rbx
	addq	24(%rdx), %rbx
	cmpb	$0, initialized(%rip)
	movq	%r8, 8(%rdx)
	movq	%rsi, (%rbx)
	je	.L926
.L919:
	leaq	16(%r8), %rax
	cmpq	(%rdx), %rax
	jnb	.L927
.L920:
	testb	$7, %r8b
	jne	.L923
	movq	%r8, %rax
	pxor	%xmm0, %xmm0
	addq	$16, %r8
	addq	$1, memoryBlockCount(%rip)
	andq	$-8, %rax
	addq	24(%rdx), %rax
	movq	%r8, 8(%rdx)
	movups	%xmm0, (%rax)
	movq	%rax, 8(%rbx)
	leaq	-16(%rbp), %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L924:
	call	init.part.0
	jmp	.L916
	.p2align 4,,10
	.p2align 3
.L925:
	movl	$1, %ecx
	call	increase_memory_size
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %r8
	jmp	.L917
	.p2align 4,,10
	.p2align 3
.L927:
	movl	$1, %ecx
	call	increase_memory_size
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %r8
	jmp	.L920
	.p2align 4,,10
	.p2align 3
.L926:
	call	init.part.0
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %r8
	jmp	.L919
.L923:
	movq	%r8, 40(%rsp)
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	40(%rsp), %r8
	leaq	.LC93(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
	.section .rdata,"dr"
	.align 8
.LC135:
	.ascii "Error creating primary: value is NULL\12\0"
	.align 8
.LC136:
	.ascii "Error creating primary: unknown type %u\12\0"
	.text
	.p2align 4
	.def	create_primary;	.scl	3;	.type	32;	.endef
create_primary:
	pushq	%r12
	movq	%r8, %r12
	pushq	%rbp
	movq	%r9, %rbp
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	movl	%ecx, %esi
	pushq	%rbx
	subq	$32, %rsp
	cmpb	$0, initialized(%rip)
	je	.L963
.L929:
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %rbx
	leaq	16(%rbx), %rax
	cmpq	(%rdx), %rax
	jnb	.L964
.L930:
	testb	$7, %bl
	jne	.L965
	movq	%rbx, %rax
	addq	$16, %rbx
	addq	$1, memoryBlockCount(%rip)
	andq	$-8, %rax
	addq	24(%rdx), %rax
	movq	%rbx, 8(%rdx)
	movl	%esi, 8(%rax)
	cmpl	$4, %esi
	ja	.L932
	testq	%rdi, %rdi
	je	.L932
.L962:
	movq	%rdi, (%rax)
.L928:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L932:
	cmpl	$5, %esi
	jne	.L934
	testq	%r12, %r12
	je	.L934
	movq	%r12, (%rax)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L964:
	movl	$1, %ecx
	call	increase_memory_size
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %rbx
	jmp	.L930
	.p2align 4,,10
	.p2align 3
.L963:
	call	init.part.0
	jmp	.L929
	.p2align 4,,10
	.p2align 3
.L934:
	leal	-6(%rsi), %edx
	cmpl	$1, %edx
	jbe	.L966
	cmpl	$8, %esi
	jne	.L937
	cmpq	$0, 112(%rsp)
	je	.L937
	movq	112(%rsp), %rdi
	jmp	.L962
	.p2align 4,,10
	.p2align 3
.L966:
	testq	%rbp, %rbp
	je	.L937
	movq	%rbp, (%rax)
	jmp	.L928
	.p2align 4,,10
	.p2align 3
.L937:
	orq	112(%rsp), %rbp
	movq	%r12, %r8
	movl	$2, %ecx
	orq	%rbp, %r8
	orq	%rdi, %r8
	jne	.L938
	call	*__imp___acrt_iob_func(%rip)
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC135(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L928
	.p2align 4,,10
	.p2align 3
.L938:
	call	*__imp___acrt_iob_func(%rip)
	movl	%esi, %r8d
	leaq	.LC136(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L928
.L965:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, %r8
	leaq	.LC93(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
	.p2align 4
	.def	create_var;	.scl	3;	.type	32;	.endef
create_var:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%r13
	movq	%rdx, %r13
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rdi
	movl	%r8d, %edi
	pushq	%rsi
	movq	%r9, %rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	testq	%rcx, %rcx
	je	.L980
	movl	32(%rdx), %edx
	xorl	%r14d, %r14d
	testl	%edx, %edx
	jne	.L977
	movq	24(%r13), %rax
	movq	24(%r9), %r14
	movq	%rax, 24(%r9)
.L977:
	movq	%rsi, %rdx
	movq	%r12, %rcx
	call	search_var
	movq	%rax, %rbx
	movl	32(%r13), %eax
	testl	%eax, %eax
	jne	.L978
	movq	%r14, 24(%rsi)
.L978:
	testq	%rbx, %rbx
	je	.L980
.L967:
	leaq	-48(%rbp), %rsp
	movq	%rbx, %rax
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
.L980:
	call	alloc_memory.constprop.2
	movq	%r12, (%rax)
	movq	%rax, %rbx
	leal	-97(%rdi), %eax
	cmpl	$21, %eax
	ja	.L990
	leaq	.L971(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L971:
	.long	.L976-.L971
	.long	.L975-.L971
	.long	.L990-.L971
	.long	.L990-.L971
	.long	.L990-.L971
	.long	.L974-.L971
	.long	.L990-.L971
	.long	.L990-.L971
	.long	.L990-.L971
	.long	.L990-.L971
	.long	.L990-.L971
	.long	.L990-.L971
	.long	.L990-.L971
	.long	.L990-.L971
	.long	.L990-.L971
	.long	.L973-.L971
	.long	.L990-.L971
	.long	.L990-.L971
	.long	.L990-.L971
	.long	.L972-.L971
	.long	.L990-.L971
	.long	.L970-.L971
	.text
	.p2align 4,,10
	.p2align 3
.L990:
	movq	$-1, %r14
.L969:
	cmpb	$0, initialized(%rip)
	je	.L1001
.L981:
	movq	all_string_list(%rip), %rax
	testq	%rax, %rax
	je	.L982
	xorl	%r12d, %r12d
	jmp	.L984
	.p2align 4,,10
	.p2align 3
.L983:
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L1002
.L984:
	cmpq	$32, 8(%rax)
	jne	.L983
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L983
	movq	16(%rax), %rax
	cmpb	$0, (%rdx)
	cmove	%rdx, %r12
	testq	%rax, %rax
	jne	.L984
.L1002:
	testq	%r12, %r12
	je	.L982
	movq	%r12, 8(%rbx)
	cmpq	$-1, %r14
	je	.L1003
.L987:
	movq	%r14, %r9
	movl	%edi, %r8d
	leaq	.LC134(%rip), %rdx
	movq	%r12, %rcx
	call	sprintf
.L988:
	andl	$-3, %edi
	movq	%r13, 16(%rbx)
	cmpl	$116, %edi
	jne	.L967
	movq	8(%rsi), %rax
	movq	%rbx, %rdx
	movq	24(%rax), %rcx
	call	list_append
	jmp	.L967
	.p2align 4,,10
	.p2align 3
.L982:
	movq	string_memory(%rip), %rdx
	movq	8(%rdx), %rax
	leaq	32(%rax), %rcx
	cmpq	(%rdx), %rcx
	jnb	.L1004
.L986:
	movq	24(%rdx), %r12
	movdqu	.LC132(%rip), %xmm0
	movdqu	16+.LC132(%rip), %xmm1
	addq	%rax, %r12
	addq	$33, %rax
	movq	%rax, 8(%rdx)
	movb	$0, 32(%r12)
	movups	%xmm0, (%r12)
	movups	%xmm1, 16(%r12)
	call	alloc_memory.constprop.2
	movq	all_string_list(%rip), %rdx
	movq	%r12, (%rax)
	movq	$32, 8(%rax)
	movq	%rdx, 16(%rax)
	movq	%rax, all_string_list(%rip)
	movq	%r12, 8(%rbx)
	cmpq	$-1, %r14
	jne	.L987
.L1003:
	movl	%edi, %r8d
	leaq	.LC133(%rip), %rdx
	movq	%r12, %rcx
	call	sprintf
	jmp	.L988
	.p2align 4,,10
	.p2align 3
.L1004:
	xorl	%ecx, %ecx
	call	increase_memory_size
	movq	string_memory(%rip), %rdx
	movq	8(%rdx), %rax
	jmp	.L986
.L976:
	movq	48(%rsi), %r14
	leaq	1(%r14), %rax
	movq	%rax, 48(%rsi)
	jmp	.L969
.L974:
	movq	88(%rsi), %r14
	leaq	1(%r14), %rax
	movq	%rax, 88(%rsi)
	jmp	.L969
.L975:
	movq	80(%rsi), %r14
	leaq	1(%r14), %rax
	movq	%rax, 80(%rsi)
	jmp	.L969
.L970:
	movq	64(%rsi), %r14
	leaq	1(%r14), %rax
	movq	%rax, 64(%rsi)
	jmp	.L969
.L972:
	movq	72(%rsi), %r14
	leaq	1(%r14), %rax
	movq	%rax, 72(%rsi)
	jmp	.L969
.L973:
	movq	56(%rsi), %r14
	leaq	1(%r14), %rax
	movq	%rax, 56(%rsi)
	jmp	.L969
	.p2align 4,,10
	.p2align 3
.L1001:
	call	init.part.0
	jmp	.L981
	.section .rdata,"dr"
	.align 8
.LC137:
	.ascii "Error creating statement: content is NULL\12\0"
	.align 8
.LC138:
	.ascii "Error creating statement: unknown type %u\12\0"
	.text
	.p2align 4
	.def	create_statement;	.scl	3;	.type	32;	.endef
create_statement:
	pushq	%r13
	movl	%ecx, %r13d
	pushq	%r12
	pushq	%rbp
	movq	%r9, %rbp
	pushq	%rdi
	movq	%r8, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	subq	$40, %rsp
	cmpb	$0, initialized(%rip)
	movq	128(%rsp), %r12
	je	.L1051
.L1006:
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %rbx
	leaq	16(%rbx), %rax
	cmpq	(%rdx), %rax
	jnb	.L1052
.L1007:
	testb	$7, %bl
	jne	.L1053
	movq	%rbx, %rax
	addq	$16, %rbx
	addq	$1, memoryBlockCount(%rip)
	andq	$-8, %rax
	addq	24(%rdx), %rax
	movq	%rbx, 8(%rdx)
	movl	%r13d, 8(%rax)
	testl	%r13d, %r13d
	jne	.L1009
	testq	%r12, %r12
	je	.L1009
.L1050:
	movq	%r12, (%rax)
.L1005:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L1009:
	cmpl	$1, %r13d
	jne	.L1011
	cmpq	$0, 136(%rsp)
	je	.L1011
	movq	136(%rsp), %rdi
	movq	%rdi, (%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L1052:
	movl	$1, %ecx
	call	increase_memory_size
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %rbx
	jmp	.L1007
	.p2align 4,,10
	.p2align 3
.L1051:
	call	init.part.0
	jmp	.L1006
	.p2align 4,,10
	.p2align 3
.L1011:
	cmpl	$2, %r13d
	jne	.L1013
	testq	%rsi, %rsi
	je	.L1013
	movq	%rsi, (%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L1013:
	cmpl	$3, %r13d
	jne	.L1014
	testq	%rdi, %rdi
	je	.L1014
	movq	%rdi, (%rax)
	jmp	.L1005
	.p2align 4,,10
	.p2align 3
.L1014:
	cmpl	$4, %r13d
	jne	.L1015
	testq	%rbp, %rbp
	je	.L1015
	movq	%rbp, (%rax)
	jmp	.L1005
	.p2align 4,,10
	.p2align 3
.L1015:
	cmpl	$5, %r13d
	je	.L1050
	orq	%rbp, %rdi
	movq	136(%rsp), %rax
	movl	$2, %ecx
	orq	%rdi, %rsi
	orq	%rsi, %rax
	orq	%r12, %rax
	je	.L1054
	call	*__imp___acrt_iob_func(%rip)
	movl	%r13d, %r8d
	leaq	.LC138(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L1005
.L1053:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, %r8
	leaq	.LC93(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
.L1054:
	call	*__imp___acrt_iob_func(%rip)
	movl	$42, %r8d
	movl	$1, %edx
	leaq	.LC137(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L1005
	.p2align 4
	.def	create_expression.constprop.0;	.scl	3;	.type	32;	.endef
create_expression.constprop.0:
	pushq	%rbx
	subq	$64, %rsp
	testq	%rcx, %rcx
	je	.L1062
	cmpb	$0, initialized(%rip)
	movq	%rcx, %rbx
	je	.L1063
.L1058:
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %r8
	leaq	32(%r8), %rax
	cmpq	(%rdx), %rax
	jnb	.L1064
.L1059:
	testb	$7, %r8b
	jne	.L1065
	movq	%r8, %rax
	addq	$32, %r8
	addq	$1, memoryBlockCount(%rip)
	andq	$-8, %rax
	addq	24(%rdx), %rax
	movq	%r8, 8(%rdx)
	movl	$19, 24(%rax)
	movq	%rbx, 8(%rax)
	movq	$0, 16(%rax)
	addq	$64, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L1062:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC0(%rip), %r8
	leaq	.LC127(%rip), %rdx
	movq	%r8, 40(%rsp)
	movq	%rax, %rcx
	movq	%r8, %r9
	movq	%r8, 32(%rsp)
	call	fprintf
	addq	$64, %rsp
	xorl	%eax, %eax
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L1063:
	call	init.part.0
	jmp	.L1058
	.p2align 4,,10
	.p2align 3
.L1064:
	movl	$1, %ecx
	call	increase_memory_size
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %r8
	jmp	.L1059
.L1065:
	movq	%r8, 56(%rsp)
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	56(%rsp), %r8
	leaq	.LC93(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
	.section .rdata,"dr"
	.align 8
.LC139:
	.ascii "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\12\0"
	.align 8
.LC140:
	.ascii "Error creating variable access: content is NULL\12\0"
	.align 8
.LC141:
	.ascii "Error creating variable access: unknown type %u\12\0"
	.text
	.p2align 4
	.def	create_variable_access;	.scl	3;	.type	32;	.endef
create_variable_access:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movl	%ecx, %ebx
	subq	$40, %rsp
	testl	%ecx, %ecx
	sete	%r12b
	testq	%rdx, %rdx
	sete	%al
	cmpb	%r12b, %al
	jne	.L1109
	cmpb	$0, initialized(%rip)
	movq	%r8, %r13
	movq	%r9, %rbp
	je	.L1110
.L1071:
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %rdi
	leaq	24(%rdi), %rax
	cmpq	(%rdx), %rax
	jnb	.L1111
.L1072:
	testb	$7, %dil
	jne	.L1112
	movq	%rdi, %rax
	addq	$1, memoryBlockCount(%rip)
	addq	$24, %rdi
	andq	$-8, %rax
	addq	24(%rdx), %rax
	testq	%r13, %r13
	movq	%rdi, 8(%rdx)
	movl	%ebx, 16(%rax)
	setne	%dl
	movq	%rsi, (%rax)
	testb	%r12b, %r12b
	je	.L1074
	testb	%dl, %dl
	je	.L1074
.L1108:
	movq	%r13, 8(%rax)
.L1066:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L1074:
	cmpl	$1, %ebx
	jne	.L1076
	cmpq	$0, 128(%rsp)
	je	.L1076
	movq	128(%rsp), %rsi
	movq	%rsi, 8(%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L1109:
	leaq	.LC0(%rip), %rax
	leaq	.LC1(%rip), %r8
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
	leaq	.LC139(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L1066
	.p2align 4,,10
	.p2align 3
.L1110:
	call	init.part.0
	jmp	.L1071
	.p2align 4,,10
	.p2align 3
.L1111:
	movl	$1, %ecx
	call	increase_memory_size
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %rdi
	jmp	.L1072
	.p2align 4,,10
	.p2align 3
.L1076:
	cmpl	$3, %ebx
	jne	.L1078
	testq	%rbp, %rbp
	je	.L1078
	movq	%rbp, 8(%rax)
	jmp	.L1066
	.p2align 4,,10
	.p2align 3
.L1078:
	cmpl	$2, %ebx
	jne	.L1079
	testb	%dl, %dl
	jne	.L1108
.L1079:
	movq	128(%rsp), %r9
	movl	$2, %ecx
	orq	%rbp, %r9
	orq	%r9, %r13
	je	.L1113
	call	*__imp___acrt_iob_func(%rip)
	movl	%ebx, %r8d
	leaq	.LC141(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L1066
.L1113:
	call	*__imp___acrt_iob_func(%rip)
	movl	$48, %r8d
	movl	$1, %edx
	leaq	.LC140(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L1066
.L1112:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, %r8
	leaq	.LC93(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
	.section .rdata,"dr"
.LC142:
	.ascii "%zu/%zu bytes\0"
	.align 8
.LC143:
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
	je	.L1115
	.p2align 4,,10
	.p2align 3
.L1116:
	movq	16(%rax), %rax
	addq	$1, %rbx
	testq	%rax, %rax
	jne	.L1116
.L1115:
	leaq	.LC132(%rip), %rsi
	movl	$48, %edx
	leaq	.LC142(%rip), %r12
	movq	%rsi, %rcx
	call	create_string_check.constprop.1
	movq	struct_memory_count(%rip), %r9
	movq	%r12, %rdx
	movq	struct_memory_used(%rip), %r8
	movq	%rax, %rdi
	movq	struct_memory(%rip), %rax
	movq	%rdi, %rcx
	addq	8(%rax), %r8
	call	sprintf
	movq	%rsi, %rcx
	movl	$48, %edx
	call	create_string_check.constprop.1
	movq	string_memory_count(%rip), %r9
	movq	%r12, %rdx
	movq	string_memory_used(%rip), %r8
	movq	%rax, %rbp
	movq	string_memory(%rip), %rax
	movq	%rbp, %rcx
	addq	8(%rax), %r8
	call	sprintf
	movq	%rsi, %rcx
	movl	$240, %edx
	call	create_string_check.constprop.1
	movq	%rbx, 40(%rsp)
	movq	%rdi, %r9
	movl	$2, %r8d
	movq	%rax, %rsi
	movq	memoryBlockCount(%rip), %rax
	movq	%rbp, 32(%rsp)
	leaq	.LC143(%rip), %rdx
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
	.section .rdata,"dr"
.LC144:
	.ascii "%s/%s\0"
	.text
	.p2align 4
	.def	absolute_path;	.scl	3;	.type	32;	.endef
absolute_path:
	pushq	%r14
	pushq	%r13
	leaq	.LC132(%rip), %r13
	pushq	%r12
	movq	%rdx, %r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$32, %rsp
	.p2align 4,,10
	.p2align 3
.L1142:
	movq	%rbx, %rcx
	call	strlen
	movq	%rbx, %rcx
	xorl	%ebx, %ebx
	movq	%rax, %rdx
	call	create_string_check.constprop.1
	movq	%rax, %rcx
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L1121
	jmp	.L1138
	.p2align 4,,10
	.p2align 3
.L1123:
	cmpq	$1, %rbx
	jbe	.L1128
	leaq	1(%rbx), %rdx
	cmpb	$47, %cl
	je	.L1129
.L1147:
	movq	%rdx, %rbx
.L1130:
	cmpq	%rbp, %rbx
	jnb	.L1164
.L1121:
	leaq	(%rdi,%rbx), %rsi
	movzbl	(%rsi), %ecx
	cmpb	$92, %cl
	jne	.L1123
	movb	$47, (%rsi)
	cmpq	$1, %rbx
	jbe	.L1128
	leaq	1(%rbx), %rdx
.L1129:
	leaq	-1(%rdi,%rbx), %rcx
	movzbl	(%rcx), %eax
	cmpb	$46, %al
	je	.L1165
.L1126:
	cmpb	$47, %al
	jne	.L1147
	movq	%rbp, %r8
	addq	%rdi, %rdx
	movq	%rsi, %rcx
	subq	$1, %rbp
	subq	%rbx, %r8
	call	memmove
	cmpq	%rbp, %rbx
	jb	.L1121
	.p2align 4,,10
	.p2align 3
.L1164:
	cmpq	$2, %rbp
	jbe	.L1132
	movzbl	(%rdi), %eax
	cmpb	$47, %al
	je	.L1166
	subl	$65, %eax
	cmpb	$25, %al
	ja	.L1122
.L1143:
	cmpb	$58, 1(%rdi)
	je	.L1120
.L1122:
	testq	%r12, %r12
	je	.L1167
.L1139:
	movq	%r12, %rcx
	call	strlen
	cmpb	$0, initialized(%rip)
	leaq	2(%rbp,%rax), %rsi
	je	.L1168
	testq	%rsi, %rsi
	je	.L1148
.L1172:
	movq	%rsi, %rdx
	movq	%r13, %rcx
	call	create_string_check.part.0
	movq	%rax, %rbx
.L1141:
	movq	%r12, %r8
	movq	%rbx, %rcx
	movq	%rdi, %r9
	xorl	%r12d, %r12d
	leaq	.LC144(%rip), %rdx
	call	sprintf
	movq	%rbx, %rcx
	movq	%rsi, %rdx
	call	create_string_check.constprop.0
	movq	%rax, %rbx
	jmp	.L1142
	.p2align 4,,10
	.p2align 3
.L1165:
	leaq	-2(%rbx), %r14
	leaq	(%rdi,%r14), %rsi
	cmpb	$47, (%rsi)
	jne	.L1147
	movq	%rbp, %r8
	addq	%rdi, %rdx
	subq	$2, %rbp
	subq	%rbx, %r8
	movq	%r14, %rbx
	call	memmove
	.p2align 4,,10
	.p2align 3
.L1128:
	testq	%rbx, %rbx
	jne	.L1169
	movl	$1, %ebx
	jmp	.L1130
	.p2align 4,,10
	.p2align 3
.L1132:
	je	.L1170
	testq	%rbp, %rbp
	jne	.L1171
.L1138:
	xorl	%ebp, %ebp
	testq	%r12, %r12
	jne	.L1139
.L1167:
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	getcwd
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L1139
.L1120:
	addq	$32, %rsp
	movq	%rdi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L1171:
	movzbl	(%rdi), %eax
.L1136:
	cmpb	$47, %al
	jne	.L1122
	jmp	.L1120
	.p2align 4,,10
	.p2align 3
.L1168:
	call	init.part.0
	testq	%rsi, %rsi
	jne	.L1172
.L1148:
	xorl	%ebx, %ebx
	jmp	.L1141
	.p2align 4,,10
	.p2align 3
.L1166:
	movzbl	1(%rdi), %eax
	leal	-97(%rax), %edx
	cmpb	$25, %dl
	ja	.L1120
	cmpb	$47, 2(%rdi)
	jne	.L1120
	subl	$32, %eax
	movb	$58, 1(%rdi)
	movb	%al, (%rdi)
	jmp	.L1120
	.p2align 4,,10
	.p2align 3
.L1170:
	movzbl	(%rdi), %eax
	leal	-65(%rax), %edx
	cmpb	$25, %dl
	jbe	.L1143
	jmp	.L1136
.L1169:
	cmpb	$47, (%rsi)
	leaq	1(%rbx), %rdx
	jne	.L1147
	movzbl	-1(%rdi,%rbx), %eax
	jmp	.L1126
	.section .rdata,"dr"
.LC145:
	.ascii "%s.%s\0"
	.text
	.p2align 4
	.def	make_method_name;	.scl	3;	.type	32;	.endef
make_method_name:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	movq	%rdx, %r13
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	call	strlen
	movq	%r13, %rcx
	movq	%rax, %rbx
	call	strlen
	cmpb	$0, initialized(%rip)
	leaq	2(%rbx,%rax), %rsi
	je	.L1188
.L1174:
	movq	all_string_list(%rip), %rbx
	testq	%rbx, %rbx
	je	.L1175
	xorl	%edi, %edi
	movl	$1, %r14d
	cmpq	$0, %rsi
	cmovbe	%rsi, %r14
	leaq	.LC132(%rip), %r15
	jmp	.L1177
	.p2align 4,,10
	.p2align 3
.L1176:
	movq	16(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L1189
.L1177:
	cmpq	8(%rbx), %rsi
	jne	.L1176
	movq	(%rbx), %rbp
	testq	%rbp, %rbp
	je	.L1176
	movq	%r14, %r8
	movq	%r15, %rdx
	movq	%rbp, %rcx
	call	strncmp
	movq	16(%rbx), %rbx
	testl	%eax, %eax
	cmove	%rbp, %rdi
	testq	%rbx, %rbx
	jne	.L1177
.L1189:
	testq	%rdi, %rdi
	je	.L1175
.L1178:
	movq	%r13, %r9
	movq	%r12, %r8
	leaq	.LC145(%rip), %rdx
	movq	%rdi, %rcx
	call	sprintf
	addq	$40, %rsp
	movq	%rdi, %rax
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
.L1175:
	movq	%rsi, %rdx
	leaq	.LC132(%rip), %rcx
	call	create_string_check.part.0
	movq	%rax, %rdi
	jmp	.L1178
	.p2align 4,,10
	.p2align 3
.L1188:
	call	init.part.0
	jmp	.L1174
	.section .rdata,"dr"
	.align 8
.LC146:
	.ascii "[Warning] Unsupported variable access with NULL base\12\0"
	.align 8
.LC147:
	.ascii "[Warning] Failed to generate variable access for base\12\0"
	.align 8
.LC148:
	.ascii "[Warning] Attempting to access attribute of non-object type: %s\12\0"
	.align 8
.LC149:
	.ascii "[Warning] Attribute '%s' not found in type '%s'\12\0"
	.align 8
.LC150:
	.ascii "[Warning] Attempting to access function '%s' as attribute of type '%s'\12\0"
	.align 8
.LC151:
	.ascii "[Warning] Symbol '%s' in type '%s' is not an attribute\12\0"
.LC152:
	.ascii "arr\0"
	.align 8
.LC153:
	.ascii "[Warning] Attempting to index non-array type: %s\12\0"
	.align 8
.LC154:
	.ascii "[Warning] Failed to generate variable access for index\12\0"
	.align 8
.LC155:
	.ascii "[Warning] Attempting to call non-function, kind: %u, type name: %s\12\0"
	.align 8
.LC156:
	.ascii "[Warning] Unsupported type for size lookup: %s\12\0"
	.align 8
.LC157:
	.ascii "[Warning] Unsupported variable access type for tac_variable_access: %u\12\0"
	.section	.text.unlikely,"x"
.LCOLDB158:
	.text
.LHOTB158:
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
	movq	%rdx, %rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$64, %rsp
	movl	16(%rcx), %r8d
	testl	%r8d, %r8d
	jne	.L1191
	movq	8(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L1191
	movl	32(%rcx), %eax
	leal	-1(%rax), %edx
	cmpl	$1, %edx
	jbe	.L1301
	testl	%eax, %eax
	je	.L1302
	movq	(%rcx), %rdx
	movq	%rdi, %r9
	movl	$118, %r8d
.L1300:
	call	create_var
	movq	%rax, %rsi
	call	alloc_memory.constprop.2
	movq	%rsi, %xmm0
	movhps	16(%rsi), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L1190
	.p2align 4,,10
	.p2align 3
.L1191:
	movq	(%rsi), %rcx
	testq	%rcx, %rcx
	je	.L1303
	movq	%rdi, %rdx
	call	tac_variable_access
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L1199
	cmpb	$0, 20(%rax)
	jne	.L1304
.L1198:
	movl	16(%rsi), %ebx
	cmpl	$2, %ebx
	je	.L1305
	cmpl	$3, %ebx
	je	.L1306
	cmpl	$1, %ebx
	jne	.L1215
	movl	16(%r12), %ebx
	testl	%ebx, %ebx
	jne	.L1216
	movq	8(%r12), %rax
	movl	32(%rax), %ecx
	testl	%ecx, %ecx
	je	.L1307
.L1217:
	movq	8(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	%ebx, %r8d
	leaq	.LC155(%rip), %rdx
	xorl	%ebx, %ebx
	movq	%rax, %rcx
	movq	%rsi, %r9
	call	fprintf
	jmp	.L1190
	.p2align 4,,10
	.p2align 3
.L1305:
	movq	8(%r12), %rax
	movq	%rax, 56(%rsp)
	movl	32(%rax), %eax
	leal	-1(%rax), %edx
	cmpl	$1, %edx
	jbe	.L1308
	movq	56(%rsp), %rbx
	movq	24(%rbx), %r14
	testl	%eax, %eax
	jne	.L1202
	movq	16(%r14), %r14
.L1202:
	movq	8(%rsi), %rax
	movq	8(%rax), %r13
	testq	%r14, %r14
	je	.L1203
.L1207:
	movq	8(%r14), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L1206
	jmp	.L1204
	.p2align 4,,10
	.p2align 3
.L1309:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L1204
.L1206:
	movq	8(%rbx), %r15
	movq	%r13, %rdx
	movq	8(%r15), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L1309
	movl	32(%r15), %eax
	cmpl	$1, %eax
	je	.L1310
	cmpl	$2, %eax
	je	.L1311
	cmpl	$5, %eax
	jne	.L1312
	movq	(%r15), %rcx
	movq	%rdi, %rdx
	call	create_var.part.0.constprop.1
	movq	%rax, %r13
	call	alloc_memory.constprop.2
	movq	%r13, %xmm0
	movq	%rdi, %r9
	movl	$97, %r8d
	movhps	16(%r13), %xmm0
	movb	$0, 20(%rax)
	movq	%rax, %rbx
	movups	%xmm0, (%rax)
	movq	8(%rsi), %rcx
	movl	$0, 16(%rax)
	movq	(%rcx), %rdx
	call	create_var
	movq	%rax, %r13
	call	alloc_memory.constprop.2
	movq	%r13, %xmm0
	movhps	16(%r13), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rsi
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory.constprop.1
	movl	$15, 24(%rax)
	movq	%rax, %rdx
.L1298:
	movq	%rbx, (%rdx)
	movq	%r12, 8(%rdx)
	movq	%rsi, 16(%rdx)
	movb	$1, 20(%rbx)
	movq	16(%rdi), %rax
	movq	8(%rax), %rcx
	call	list_append
.L1190:
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
.L1302:
	movq	%rdi, %r9
	movl	$118, %r8d
	movq	%rcx, %rdx
	jmp	.L1300
	.p2align 4,,10
	.p2align 3
.L1304:
	movq	%rdi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L1198
	.p2align 4,,10
	.p2align 3
.L1199:
	movl	$2, %ecx
	xorl	%ebx, %ebx
	call	*__imp___acrt_iob_func(%rip)
	movl	$54, %r8d
	movl	$1, %edx
	leaq	.LC147(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L1190
	.p2align 4,,10
	.p2align 3
.L1204:
	movq	(%r14), %r14
	testq	%r14, %r14
	jne	.L1207
.L1203:
	movq	56(%rsp), %rax
	movl	$2, %ecx
	movq	8(%rax), %rbx
	call	*__imp___acrt_iob_func(%rip)
	movq	%r13, %r8
	leaq	.LC149(%rip), %rdx
	movq	%rbx, %r9
	movq	%rax, %rcx
	xorl	%ebx, %ebx
	call	fprintf
	jmp	.L1190
	.p2align 4,,10
	.p2align 3
.L1306:
	movq	8(%r12), %rax
	leaq	.LC152(%rip), %rdx
	movq	8(%rax), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L1313
	movq	8(%rsi), %rcx
	movq	%rdi, %rdx
	call	tac_expression
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L1214
	cmpb	$0, 20(%rax)
	jne	.L1314
.L1213:
	movq	name_int(%rip), %rcx
	movq	%rdi, %rdx
	call	create_var.part.0.constprop.1
	movq	%rax, %r13
	call	alloc_memory.constprop.2
	movq	%r13, %xmm0
	movhps	16(%r13), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory.constprop.1
	movl	$16, 24(%rax)
	movq	%rax, %rdx
	jmp	.L1298
	.p2align 4,,10
	.p2align 3
.L1216:
	leal	-7(%rbx), %eax
	cmpl	$1, %eax
	jbe	.L1223
	movq	8(%r12), %rax
	jmp	.L1217
	.p2align 4,,10
	.p2align 3
.L1307:
	movq	8(%rax), %rcx
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	call	make_method_name
	movq	%rax, %r13
	movq	8(%r12), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %r14
	testq	%r14, %r14
	je	.L1218
.L1222:
	movq	8(%r14), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L1221
	jmp	.L1219
	.p2align 4,,10
	.p2align 3
.L1315:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L1219
.L1221:
	movq	8(%rbx), %r12
	movq	%r13, %rdx
	movq	8(%r12), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L1315
	movq	(%r12), %rdx
	movq	%r12, %rcx
	movq	%rdi, %r9
	movl	$102, %r8d
	call	create_var
	movq	%rax, %rbx
	call	alloc_memory.constprop.2
	movq	%rbx, %xmm0
	movhps	16(%rbx), %xmm0
	movl	$8, 16(%rax)
	movq	%rax, %r12
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
.L1223:
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	cmpl	$8, 16(%r12)
	movq	%rax, %rbx
	movups	%xmm0, (%rax)
	je	.L1224
.L1226:
	movq	$0, 56(%rsp)
.L1225:
	movq	8(%rsi), %r14
	testq	%r14, %r14
	je	.L1297
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%r14), %xmm1
	movq	%rax, %rsi
	movups	%xmm1, (%rax)
	movq	%xmm1, %rax
	jmp	.L1236
	.p2align 4,,10
	.p2align 3
.L1244:
	movq	8(%rax), %rcx
	testq	%rcx, %rcx
	je	.L1297
	movq	%rdi, %rdx
	call	tac_expression
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L1237
	cmpb	$0, 20(%rax)
	jne	.L1316
.L1238:
	movq	8(%r15), %rax
	xorl	%r13d, %r13d
	testq	%rax, %rax
	je	.L1239
	cmpq	name_int(%rip), %rax
	je	.L1240
	cmpq	name_float(%rip), %rax
	je	.L1240
	cmpq	name_string(%rip), %rax
	je	.L1240
	cmpq	name_bool(%rip), %rax
	movl	$1, %r13d
	je	.L1239
	cmpq	name_void(%rip), %rax
	je	.L1239
	movl	32(%rax), %edx
	testl	%edx, %edx
	jne	.L1241
	movq	24(%rax), %rax
	movq	24(%rax), %r13
.L1239:
	call	alloc_memory.constprop.2
	movl	$1, 16(%rax)
	movq	%rax, %r14
	movq	%r13, (%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%r14)
	movq	%rax, 8(%r14)
	call	alloc_memory.constprop.1
	movq	%rbx, %rcx
	movl	$17, 24(%rax)
	movq	%rax, %rdx
	movq	%r14, (%rax)
	movq	%r15, 8(%rax)
	movq	$0, 16(%rax)
	call	list_append
	addq	$1, 56(%rsp)
	movq	(%rsi), %rax
.L1236:
	testq	%rax, %rax
	je	.L1297
	movq	(%rax), %rdx
	movq	%rdx, (%rsi)
	testq	%rdx, %rdx
	jne	.L1244
	movq	$0, 8(%rsi)
	jmp	.L1244
	.p2align 4,,10
	.p2align 3
.L1317:
	movq	$0, 8(%rbx)
.L1248:
	movq	8(%rax), %rdx
	testq	%rdx, %rdx
	je	.L1247
	movq	16(%rdi), %rax
	movq	8(%rax), %rcx
	call	list_append
.L1297:
	movq	(%rbx), %rax
	testq	%rax, %rax
	je	.L1247
	movq	(%rax), %rdx
	movq	%rdx, (%rbx)
	testq	%rdx, %rdx
	jne	.L1248
	jmp	.L1317
	.p2align 4,,10
	.p2align 3
.L1316:
	movq	%rdi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r15
	jmp	.L1238
	.p2align 4,,10
	.p2align 3
.L1247:
	movq	8(%r12), %rcx
	movq	%rdi, %rdx
	call	create_var.part.0.constprop.1
	movq	%rax, %rsi
	call	alloc_memory.constprop.2
	movq	%rsi, %xmm0
	movhps	16(%rsi), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory.constprop.2
	movq	%rax, %rsi
	movl	$1, 16(%rax)
	movq	56(%rsp), %rax
	movb	$0, 20(%rsi)
	movq	%rax, (%rsi)
	movq	name_int(%rip), %rax
	movq	%rax, 8(%rsi)
	call	alloc_memory.constprop.1
	movq	%r12, 8(%rax)
	movq	%rax, %rdx
	movq	%rbx, (%rax)
	movq	%rsi, 16(%rax)
	movl	$22, 24(%rax)
	movq	16(%rdi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L1190
	.p2align 4,,10
	.p2align 3
.L1312:
	movq	56(%rsp), %rax
	movl	$2, %ecx
	movq	8(%rax), %rbx
	call	*__imp___acrt_iob_func(%rip)
	movq	%r13, %r8
	leaq	.LC151(%rip), %rdx
	movq	%rbx, %r9
	movq	%rax, %rcx
	xorl	%ebx, %ebx
	call	fprintf
	jmp	.L1190
	.p2align 4,,10
	.p2align 3
.L1303:
	movl	$2, %ecx
	xorl	%ebx, %ebx
	call	*__imp___acrt_iob_func(%rip)
	movl	$53, %r8d
	movl	$1, %edx
	leaq	.LC146(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L1190
	.p2align 4,,10
	.p2align 3
.L1301:
	movq	(%rcx), %rdx
	movq	%rdi, %r9
	movl	$102, %r8d
.L1299:
	call	create_var
	movq	%rax, %rsi
	call	alloc_memory.constprop.2
	movq	%rsi, %xmm0
	movhps	16(%rsi), %xmm0
	movl	$7, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L1190
	.p2align 4,,10
	.p2align 3
.L1215:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	%ebx, %r8d
	leaq	.LC157(%rip), %rdx
	xorl	%ebx, %ebx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L1190
	.p2align 4,,10
	.p2align 3
.L1219:
	movq	(%r14), %r14
	testq	%r14, %r14
	jne	.L1222
	jmp	.L1218
	.p2align 4,,10
	.p2align 3
.L1241:
	movq	8(%rax), %r14
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC156(%rip), %rdx
	movq	%rax, %rcx
	movq	%r14, %r8
	call	fprintf
	.p2align 4,,10
	.p2align 3
.L1240:
	movl	$8, %r13d
	jmp	.L1239
.L1313:
	movq	(%r12), %rax
	movl	$2, %ecx
	movq	(%rax), %rax
	movq	8(%rax), %rbx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC153(%rip), %rdx
	movq	%rbx, %r8
	movq	%rax, %rcx
	xorl	%ebx, %ebx
	call	fprintf
	jmp	.L1190
.L1310:
	movq	56(%rsp), %rax
	movl	$2, %ecx
	movq	8(%rax), %rbx
	call	*__imp___acrt_iob_func(%rip)
	movq	%r13, %r8
	leaq	.LC150(%rip), %rdx
	movq	%rax, %rcx
	movq	%rbx, %r9
	call	fprintf
	movq	(%r15), %rdx
	movq	%rdi, %r9
	movq	%r15, %rcx
	movl	$102, %r8d
	jmp	.L1299
.L1314:
	movq	%rdi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L1213
.L1214:
	movl	$2, %ecx
	xorl	%ebx, %ebx
	call	*__imp___acrt_iob_func(%rip)
	movl	$55, %r8d
	movl	$1, %edx
	leaq	.LC154(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L1190
.L1311:
	movq	(%r15), %rdx
	movq	%rdi, %r9
	movl	$102, %r8d
	movq	%r15, %rcx
	call	create_var
	movq	%rax, %rsi
	call	alloc_memory.constprop.2
	movq	%rsi, %xmm0
	movhps	16(%rsi), %xmm0
	movl	$8, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L1190
.L1224:
	movq	8(%r12), %rax
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	movq	8(%rax), %rcx
	call	make_method_name
	movq	%rax, %rdx
	movq	(%r12), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L1226
	movq	(%rsi), %rax
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$8, %ecx
	movq	(%rax), %rax
	movq	%rax, 32(%rsp)
	call	create_primary
	movq	%rax, %rcx
	call	create_expression.constprop.0
	movq	%rdi, %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L1237
	cmpb	$0, 20(%rax)
	jne	.L1318
.L1228:
	movq	8(%r13), %rax
	xorl	%edx, %edx
	testq	%rax, %rax
	je	.L1229
	cmpq	name_int(%rip), %rax
	je	.L1230
	cmpq	name_float(%rip), %rax
	je	.L1230
	cmpq	name_string(%rip), %rax
	je	.L1230
	cmpq	name_bool(%rip), %rax
	movl	$1, %edx
	je	.L1229
	cmpq	name_void(%rip), %rax
	je	.L1229
	cmpl	$0, 32(%rax)
	jne	.L1231
	movq	24(%rax), %rax
	movq	24(%rax), %rdx
.L1229:
	cmpb	$0, initialized(%rip)
	je	.L1319
.L1232:
	movq	struct_memory(%rip), %rax
	movq	8(%rax), %r14
	leaq	24(%r14), %rcx
	cmpq	(%rax), %rcx
	jnb	.L1320
.L1233:
	testb	$7, %r14b
	jne	.L1321
	movq	%r14, %r15
	addq	$24, %r14
	addq	$1, memoryBlockCount(%rip)
	movq	%r14, 8(%rax)
	andq	$-8, %r15
	addq	24(%rax), %r15
	movq	name_int(%rip), %rax
	movq	%rdx, (%r15)
	movl	$1, 16(%r15)
	movq	%rax, 8(%r15)
	movb	$0, 20(%r15)
	call	alloc_memory.constprop.1
	movq	%rbx, %rcx
	movl	$17, 24(%rax)
	movq	%rax, %rdx
	movq	%r15, (%rax)
	movq	%r13, 8(%rax)
	movq	$0, 16(%rax)
	call	list_append
	movq	$1, 56(%rsp)
	jmp	.L1225
.L1308:
	movq	56(%rsp), %rax
	movl	$2, %ecx
	movq	8(%rax), %rbx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC148(%rip), %rdx
	movq	%rbx, %r8
	movq	%rax, %rcx
	xorl	%ebx, %ebx
	call	fprintf
	jmp	.L1190
.L1320:
	movl	$1, %ecx
	movq	%rdx, 56(%rsp)
	call	increase_memory_size
	movq	struct_memory(%rip), %rax
	movq	56(%rsp), %rdx
	movq	8(%rax), %r14
	jmp	.L1233
.L1319:
	movq	%rdx, 56(%rsp)
	call	init.part.0
	movq	56(%rsp), %rdx
	jmp	.L1232
.L1318:
	movq	%rdi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r13
	jmp	.L1228
.L1231:
	movq	8(%rax), %r14
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC156(%rip), %rdx
	movq	%rax, %rcx
	movq	%r14, %r8
	call	fprintf
.L1230:
	movl	$8, %edx
	jmp	.L1229
.L1321:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%r14, %r8
	leaq	.LC93(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
	.section	.text.unlikely,"x"
	.def	tac_variable_access.cold;	.scl	3;	.type	32;	.endef
tac_variable_access.cold:
.L1237:
	movq	8, %rax
	ud2
.L1218:
	movq	0, %rax
	ud2
	.text
	.section	.text.unlikely,"x"
.LCOLDE158:
	.text
.LHOTE158:
	.section .rdata,"dr"
	.align 8
.LC160:
	.ascii "[Warning] Unsupported type for negation: %s\12\0"
	.align 8
.LC161:
	.ascii "[Warning] Unsupported primary type for tac_primary: %d\12\0"
	.section	.text.unlikely,"x"
.LCOLDB162:
	.text
.LHOTB162:
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
	ja	.L1323
	movq	%rcx, %rsi
	movl	%edx, %ebx
	leaq	.L1325(%rip), %rcx
	movq	%r8, %rdi
	movslq	(%rcx,%rbx,4), %rax
	addq	%rcx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L1325:
	.long	.L1333-.L1325
	.long	.L1332-.L1325
	.long	.L1331-.L1325
	.long	.L1330-.L1325
	.long	.L1329-.L1325
	.long	.L1328-.L1325
	.long	.L1327-.L1325
	.long	.L1326-.L1325
	.long	.L1324-.L1325
	.text
	.p2align 4,,10
	.p2align 3
.L1326:
	movl	8(%rsi), %edx
	movq	(%rsi), %rcx
	call	tac_primary.isra.0
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L1336
	cmpb	$0, 20(%rax)
	jne	.L1346
.L1337:
	movq	8(%rsi), %rcx
	movq	%rdi, %rdx
	call	create_var.part.0.constprop.1
	movq	%rax, %r12
	call	alloc_memory.constprop.2
	movq	%r12, %xmm0
	movhps	16(%r12), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	movq	8(%rsi), %rax
	cmpq	name_int(%rip), %rax
	je	.L1347
	cmpq	name_float(%rip), %rax
	je	.L1348
	movq	8(%rax), %rbx
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC160(%rip), %rdx
	movq	%rbx, %r8
	movq	%rax, %rcx
	xorl	%ebx, %ebx
	call	fprintf
	jmp	.L1322
	.p2align 4,,10
	.p2align 3
.L1324:
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
.L1333:
	movq	%rsi, %rcx
	movl	$10, %r8d
	xorl	%edx, %edx
	call	strtoll
	movq	%rax, %rsi
	call	alloc_memory.constprop.2
	movl	$1, 16(%rax)
	movq	%rax, %rbx
	movq	%rsi, (%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
.L1322:
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
.L1332:
	xorl	%edx, %edx
	movq	%rsi, %rcx
	call	strtod
	movapd	%xmm0, %xmm6
	call	alloc_memory.constprop.2
	movl	$2, 16(%rax)
	movq	%rax, %rbx
	movsd	%xmm6, (%rax)
	movq	name_float(%rip), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	jmp	.L1322
	.p2align 4,,10
	.p2align 3
.L1331:
	call	alloc_memory.constprop.2
	movq	%rsi, %xmm0
	movhps	name_string(%rip), %xmm0
	movl	$3, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	jmp	.L1322
	.p2align 4,,10
	.p2align 3
.L1330:
	call	alloc_memory.constprop.2
	movl	$4, 16(%rax)
	movq	%rax, %rbx
	movb	$1, (%rax)
	movq	name_bool(%rip), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	jmp	.L1322
	.p2align 4,,10
	.p2align 3
.L1329:
	call	alloc_memory.constprop.2
	movl	$4, 16(%rax)
	movq	%rax, %rbx
	movb	$0, (%rax)
	movq	name_bool(%rip), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	jmp	.L1322
	.p2align 4,,10
	.p2align 3
.L1328:
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
.L1327:
	movl	8(%rsi), %edx
	movq	(%rsi), %rcx
	call	tac_primary.isra.0
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L1335
	cmpb	$0, 20(%rax)
	jne	.L1349
.L1335:
	movq	name_bool(%rip), %rcx
	movq	%rdi, %rdx
	call	create_var.part.0.constprop.1
	movq	%rax, %rsi
	call	alloc_memory.constprop.2
	movq	%rsi, %xmm0
	movhps	16(%rsi), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory.constprop.1
	movq	%r12, 8(%rax)
	movq	%rax, %rdx
	movq	%rbx, (%rax)
	movl	$13, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rdi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L1322
.L1323:
	movl	%edx, 44(%rsp)
	movl	$2, %ecx
	xorl	%ebx, %ebx
	call	*__imp___acrt_iob_func(%rip)
	movl	44(%rsp), %r8d
	leaq	.LC161(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L1322
	.p2align 4,,10
	.p2align 3
.L1348:
	call	alloc_memory.constprop.2
	movl	$2, 16(%rax)
	movq	%rax, %r12
	movq	.LC159(%rip), %rax
	movb	$0, 20(%r12)
	movq	%rax, (%r12)
	movq	name_float(%rip), %rax
	movq	%rax, 8(%r12)
	call	alloc_memory.constprop.1
	movl	$2, 24(%rax)
	movq	%rax, %rdx
	movq	%rbx, (%rax)
	movq	%r12, 8(%rax)
	movq	%rsi, 16(%rax)
.L1339:
	movq	16(%rdi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L1322
	.p2align 4,,10
	.p2align 3
.L1346:
	movq	%rdi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rsi
	jmp	.L1337
	.p2align 4,,10
	.p2align 3
.L1349:
	movq	%rdi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r12
	jmp	.L1335
	.p2align 4,,10
	.p2align 3
.L1347:
	call	alloc_memory.constprop.2
	movl	$1, 16(%rax)
	movq	%rax, %r12
	movq	$0, (%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%r12)
	movq	%rax, 8(%r12)
	call	alloc_memory.constprop.1
	movl	$1, 24(%rax)
	movq	%rax, %rdx
	movq	%rbx, (%rax)
	movq	%r12, 8(%rax)
	movq	%rsi, 16(%rax)
	jmp	.L1339
	.section	.text.unlikely,"x"
	.def	tac_primary.isra.0.cold;	.scl	3;	.type	32;	.endef
tac_primary.isra.0.cold:
.L1336:
	movq	8, %rax
	ud2
	.text
	.section	.text.unlikely,"x"
.LCOLDE162:
	.text
.LHOTE162:
	.section .rdata,"dr"
	.align 8
.LC163:
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
	je	.L1371
	movq	16(%rcx), %rcx
	call	tac_expression
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L1352
	cmpb	$0, 20(%rax)
	jne	.L1372
.L1352:
	movl	24(%rbx), %eax
	movq	(%rbx), %rcx
	cmpl	$18, %eax
	ja	.L1353
	leaq	CSWTCH.123(%rip), %rdx
	movl	(%rdx,%rax,4), %r13d
	movq	%rdi, %rdx
	call	tac_expression
	movq	%rax, %r12
	movl	24(%rbx), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L1354
	cmpl	$14, %r13d
	jne	.L1360
	movl	16(%r12), %eax
	testl	%eax, %eax
	jne	.L1373
.L1357:
	call	alloc_memory.constprop.1
	movl	$14, 24(%rax)
	movq	%rax, %rdx
	movq	%r12, (%rax)
	movq	%rsi, 8(%rax)
	movq	$0, 16(%rax)
	cmpb	$0, 20(%r12)
	jne	.L1374
.L1358:
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
.L1353:
	movq	%rdi, %rdx
	movl	$25, %r13d
	call	tac_expression
	movq	%rax, %r12
	movl	24(%rbx), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L1354
.L1360:
	movq	8(%r12), %rcx
	movq	%rdi, %rdx
	call	create_var.part.0.constprop.1
	movq	%rax, %r14
	call	alloc_memory.constprop.2
	movq	%r14, %xmm0
	movhps	16(%r14), %xmm0
	movb	$0, 20(%rax)
	movq	%rax, %rbx
	movq	%r12, %r14
	movl	$0, 16(%rax)
	movups	%xmm0, (%rax)
	cmpb	$0, 20(%r12)
	jne	.L1375
.L1356:
	call	alloc_memory.constprop.1
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
	je	.L1357
.L1373:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$57, %r8d
	movl	$1, %edx
	leaq	.LC163(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L1357
	.p2align 4,,10
	.p2align 3
.L1354:
	movq	8(%r12), %rcx
	movq	%rdi, %rdx
	call	create_var.part.0.constprop.1
	movq	%rax, %r14
	call	alloc_memory.constprop.2
	movq	%r14, %xmm0
	movhps	16(%r14), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %rbx
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	cmpb	$0, 20(%r12)
	jne	.L1376
.L1359:
	call	alloc_memory.constprop.1
	movq	%rsi, 16(%rax)
	movq	%rax, %rdx
	movq	%rbx, %rsi
	movl	%r13d, 24(%rax)
	movq	%rbx, (%rax)
	movq	%r12, 8(%rax)
	jmp	.L1358
	.p2align 4,,10
	.p2align 3
.L1371:
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
.L1374:
	call	alloc_memory.constprop.1
	movl	$24, 24(%rax)
	movq	%rax, %rdx
	movq	%r12, (%rax)
	movq	%rsi, 8(%rax)
	movq	$0, 16(%rax)
	jmp	.L1358
	.p2align 4,,10
	.p2align 3
.L1372:
	movq	%rdi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rsi
	jmp	.L1352
	.p2align 4,,10
	.p2align 3
.L1376:
	movq	%r12, %rcx
	movq	%rdi, %rdx
	call	load_rvalue.part.0
	movq	%rax, %r12
	jmp	.L1359
	.p2align 4,,10
	.p2align 3
.L1375:
	movq	%rdi, %rdx
	movq	%r12, %rcx
	call	load_rvalue.part.0
	movq	%rax, %r14
	jmp	.L1356
	.section .rdata,"dr"
	.align 8
.LC164:
	.ascii "Error: create_attribute received NULL table\12\0"
	.align 8
.LC165:
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
	je	.L1378
	movq	(%rdx), %rax
	movq	(%rax), %r8
	testq	%r8, %r8
	je	.L1379
	movq	(%r8), %rax
	testq	%rax, %rax
	je	.L1379
	movq	8(%r8), %rdx
	cmpq	%rdx, %rax
	je	.L1418
	.p2align 4,,10
	.p2align 3
.L1380:
	movq	%rax, %rcx
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L1380
	movq	8(%rdx), %rdi
	movq	$0, (%rcx)
.L1381:
	movq	%rcx, 8(%r8)
	movq	%rdi, %rdx
	movq	%r8, %rcx
	call	list_append
	movq	(%rbx), %r12
	movq	8(%rbx), %r13
	call	alloc_memory.constprop.2
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
	jne	.L1419
.L1382:
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rbx
	call	*%rbx
	movl	$44, %r8d
	movl	$1, %edx
	leaq	.LC164(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
.L1390:
	movl	$2, %ecx
	call	*%rbx
	leaq	-40(%rbp), %rsp
	movl	$63, %r8d
	movl	$1, %edx
	popq	%rbx
	movq	%rax, %r9
	leaq	.LC165(%rip), %rcx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L1378:
	movq	(%rcx), %rdx
	movq	8(%rcx), %rcx
	movq	%rsi, %r9
	movl	$118, %r8d
	call	create_var
	movq	16(%rbx), %rcx
	movq	%rax, %rdi
	testq	%rcx, %rcx
	je	.L1392
	movq	%rsi, %rdx
	call	tac_expression
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L1393
	cmpb	$0, 20(%rax)
	jne	.L1420
.L1393:
	call	alloc_memory.constprop.2
	movq	%rdi, %xmm0
	movhps	16(%rdi), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r12
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory.constprop.1
	movq	%rbx, 8(%rax)
	movq	%rax, %rdx
	movl	$14, 24(%rax)
	movq	%r12, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
.L1417:
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
.L1419:
	movq	16(%rdi), %rax
	movq	%rax, 16(%rbx)
	testq	%r12, %r12
	je	.L1383
	cmpq	name_int(%rip), %r12
	je	.L1415
	cmpq	name_float(%rip), %r12
	je	.L1415
	cmpq	name_string(%rip), %r12
	je	.L1415
	cmpq	name_bool(%rip), %r12
	je	.L1416
	cmpq	name_void(%rip), %r12
	je	.L1416
	movl	32(%r12), %edx
	testl	%edx, %edx
	jne	.L1389
	movq	24(%r12), %rdx
	addq	24(%rdx), %rax
	.p2align 4,,10
	.p2align 3
.L1383:
	movq	(%rdi), %rcx
	movq	%rbx, %rdx
	movq	%rax, 16(%rdi)
	movq	__imp___acrt_iob_func(%rip), %rbx
	testq	%rcx, %rcx
	jne	.L1417
	jmp	.L1390
	.p2align 4,,10
	.p2align 3
.L1418:
	movq	8(%rax), %rdi
	xorl	%ecx, %ecx
	movq	$0, (%r8)
	jmp	.L1381
	.p2align 4,,10
	.p2align 3
.L1379:
	movq	%r8, %rcx
	xorl	%edx, %edx
	call	list_append
	movq	(%rbx), %rdi
	movq	8(%rbx), %r12
	call	alloc_memory.constprop.2
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
	jmp	.L1382
	.p2align 4,,10
	.p2align 3
.L1392:
	call	alloc_memory.constprop.2
	movl	$1, 16(%rax)
	movq	%rax, %rbx
	movq	$0, (%rax)
	movq	name_int(%rip), %rax
	movb	$0, 20(%rbx)
	movq	%rax, 8(%rbx)
	jmp	.L1393
.L1389:
	movq	8(%r12), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC156(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	movq	16(%rdi), %rax
	.p2align 4,,10
	.p2align 3
.L1415:
	addq	$8, %rax
	jmp	.L1383
	.p2align 4,,10
	.p2align 3
.L1420:
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rbx
	jmp	.L1393
	.p2align 4,,10
	.p2align 3
.L1416:
	addq	$1, %rax
	jmp	.L1383
	.section .rdata,"dr"
	.align 8
.LC166:
	.ascii "[Warning] 'break' statement used outside of loop\12\0"
	.align 8
.LC167:
	.ascii "[Warning] 'continue' statement used outside of loop\12\0"
	.align 8
.LC168:
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
	ja	.L1422
	movq	%rdx, %rbx
	leaq	.L1424(%rip), %rdx
	movslq	(%rdx,%rsi,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L1424:
	.long	.L1431-.L1424
	.long	.L1430-.L1424
	.long	.L1429-.L1424
	.long	.L1428-.L1424
	.long	.L1427-.L1424
	.long	.L1426-.L1424
	.long	.L1425-.L1424
	.long	.L1423-.L1424
	.text
	.p2align 4,,10
	.p2align 3
.L1425:
	movq	32(%rbx), %rax
	testq	%rax, %rax
	je	.L1495
	cmpq	$0, (%rax)
	je	.L1495
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1495
	movq	8(%rax), %rsi
	testq	%rsi, %rsi
	jne	.L1615
.L1495:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$49, %r8d
	movl	$1, %edx
	leaq	.LC166(%rip), %rcx
	movq	%rax, %r9
.L1614:
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
.L1423:
	movq	40(%rbx), %rax
	testq	%rax, %rax
	je	.L1496
	cmpq	$0, (%rax)
	je	.L1496
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1496
	movq	8(%rax), %rsi
	testq	%rsi, %rsi
	je	.L1496
.L1615:
	call	alloc_memory.constprop.1
	movl	$20, 24(%rax)
	movq	%rax, %rdx
	jmp	.L1613
	.p2align 4,,10
	.p2align 3
.L1429:
	movq	(%rcx), %r14
	movq	%rbx, %rcx
	call	create_var.part.0.constprop.0
	movq	%rbx, %rcx
	movq	%rax, %r12
	call	create_var.part.0.constprop.0
	movq	%rax, %rsi
	movq	16(%r14), %rax
	testq	%rax, %rax
	je	.L1433
	cmpq	$0, (%rax)
	je	.L1433
	cmpq	$0, 8(%rax)
	je	.L1433
.L1434:
	movq	%rbx, %rcx
	call	create_var.part.0.constprop.0
	movq	%rax, 48(%rsp)
.L1435:
	call	alloc_memory.constprop.2
	movq	%rbx, %rdx
	movl	$6, 16(%rax)
	movq	%rax, %rdi
	movq	$0, 8(%rax)
	movq	48(%rsp), %rax
	movb	$0, 20(%rdi)
	movq	(%r14), %rcx
	movq	%rax, (%rdi)
	call	tac_expression
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L1436
	cmpb	$0, 20(%rax)
	jne	.L1616
.L1436:
	movq	%rcx, 56(%rsp)
	pxor	%xmm6, %xmm6
	call	alloc_memory.constprop.2
	movl	$6, 16(%rax)
	movq	%rax, %r13
	movq	$0, 8(%rax)
	movq	%rsi, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory.constprop.2
	movl	$6, 16(%rax)
	movq	%rax, %r15
	movq	$0, 8(%rax)
	movq	%r12, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory.constprop.1
	movq	56(%rsp), %rcx
	movq	%rax, %rdx
	movq	%r15, 8(%rax)
	movq	%rcx, (%rax)
	movq	%r13, 16(%rax)
	movl	$19, 24(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	call	alloc_memory.constprop.0
	movq	%r12, (%rax)
	movq	%rax, %r13
	call	alloc_memory.constprop.0
	movq	%r13, %rdx
	movups	%xmm6, (%rax)
	movq	%rax, 8(%r13)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%r13, 16(%rbx)
	movq	8(%r14), %r13
	testq	%r13, %r13
	je	.L1441
	call	alloc_memory.constprop.0
	movups	%xmm6, (%rax)
	movdqu	0(%r13), %xmm2
	movq	%rax, %r12
	movups	%xmm2, (%rax)
	movq	%xmm2, %rdx
	jmp	.L1440
	.p2align 4,,10
	.p2align 3
.L1442:
	movq	8(%rdx), %rcx
	testq	%rcx, %rcx
	je	.L1441
.L1443:
	movq	%rbx, %rdx
	call	tac_statement
	movq	(%r12), %rdx
.L1440:
	testq	%rdx, %rdx
	je	.L1441
	movq	(%rdx), %rax
	movq	%rax, (%r12)
	testq	%rax, %rax
	jne	.L1442
	movq	$0, 8(%r12)
	movq	8(%rdx), %rcx
	testq	%rcx, %rcx
	jne	.L1443
	.p2align 4,,10
	.p2align 3
.L1441:
	call	alloc_memory.constprop.1
	movq	$0, 8(%rax)
	movq	%rax, %rdx
	movl	$20, 24(%rax)
	movq	%rdi, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	16(%r14), %r12
	testq	%r12, %r12
	je	.L1439
	cmpq	$0, (%r12)
	je	.L1439
	cmpq	$0, 8(%r12)
	je	.L1439
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%r12), %xmm5
	movq	%rax, %r13
	movups	%xmm5, (%rax)
	movq	%xmm5, %rax
	testq	%rax, %rax
	je	.L1439
	movdqa	%xmm0, %xmm6
	.p2align 4,,10
	.p2align 3
.L1445:
	movq	(%rax), %rdx
	movq	%rdx, 0(%r13)
	testq	%rdx, %rdx
	je	.L1617
.L1454:
	movq	8(%rax), %r15
	testq	%r15, %r15
	je	.L1439
	call	alloc_memory.constprop.0
	movq	%rsi, (%rax)
	movq	%rax, %r12
	call	alloc_memory.constprop.0
	movq	%r12, %rdx
	movups	%xmm6, (%rax)
	movq	%rax, 8(%r12)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%r12, 16(%rbx)
	movq	%rbx, %rcx
	call	create_var.part.0.constprop.0
	movq	%rbx, %rcx
	movq	%rax, 56(%rsp)
	call	create_var.part.0.constprop.0
	movq	(%r15), %rcx
	movq	%rbx, %rdx
	movq	%rax, %rsi
	call	tac_expression
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L1446
	cmpb	$0, 20(%rax)
	jne	.L1618
.L1446:
	cmpq	$0, 0(%r13)
	je	.L1447
	cmpq	$0, 8(%r13)
	je	.L1447
.L1448:
	movq	%rcx, 32(%rsp)
	call	alloc_memory.constprop.2
	movl	$6, 16(%rax)
	movq	%rax, %r12
	movq	$0, 8(%rax)
	movq	%rsi, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory.constprop.2
	movq	%rax, %r9
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	56(%rsp), %rax
	movb	$0, 20(%r9)
	movq	%rax, (%r9)
	movq	%r9, 40(%rsp)
	call	alloc_memory.constprop.1
	movq	40(%rsp), %r9
	movq	32(%rsp), %rcx
	movq	%rax, %rdx
	movq	%r12, 16(%rax)
	movq	%r9, 8(%rax)
	movq	%rcx, (%rax)
	movl	$19, 24(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	call	alloc_memory.constprop.0
	movq	%rax, %r12
	movq	56(%rsp), %rax
	movq	%rax, (%r12)
	call	alloc_memory.constprop.0
	movq	%r12, %rdx
	movups	%xmm6, (%rax)
	movq	%rax, 8(%r12)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	8(%r15), %r15
	movq	%r12, 16(%rbx)
	testq	%r15, %r15
	je	.L1451
	call	alloc_memory.constprop.0
	movups	%xmm6, (%rax)
	movdqu	(%r15), %xmm1
	movq	%rax, %r12
	movups	%xmm1, (%rax)
	movq	%xmm1, %rdx
	jmp	.L1450
	.p2align 4,,10
	.p2align 3
.L1452:
	movq	8(%rdx), %rcx
	testq	%rcx, %rcx
	je	.L1451
.L1453:
	movq	%rbx, %rdx
	call	tac_statement
	movq	(%r12), %rdx
.L1450:
	testq	%rdx, %rdx
	je	.L1451
	movq	(%rdx), %rax
	movq	%rax, (%r12)
	testq	%rax, %rax
	jne	.L1452
	movq	$0, 8(%r12)
	movq	8(%rdx), %rcx
	testq	%rcx, %rcx
	jne	.L1453
	.p2align 4,,10
	.p2align 3
.L1451:
	call	alloc_memory.constprop.1
	movq	$0, 8(%rax)
	movq	%rax, %rdx
	movl	$20, 24(%rax)
	movq	%rdi, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	0(%r13), %rax
	testq	%rax, %rax
	jne	.L1445
	.p2align 4,,10
	.p2align 3
.L1439:
	movq	24(%r14), %rax
	testq	%rax, %rax
	je	.L1456
	cmpq	$0, (%rax)
	je	.L1456
	cmpq	$0, 8(%rax)
	je	.L1456
	call	alloc_memory.constprop.0
	pxor	%xmm6, %xmm6
	movq	%rsi, (%rax)
	movq	%rax, %r12
	call	alloc_memory.constprop.0
	movq	%r12, %rdx
	movups	%xmm6, (%rax)
	movq	%rax, 8(%r12)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%r12, 16(%rbx)
	movq	24(%r14), %r12
	testq	%r12, %r12
	je	.L1459
	call	alloc_memory.constprop.0
	movups	%xmm6, (%rax)
	movdqu	(%r12), %xmm5
	movq	%rax, %rsi
	movups	%xmm5, (%rax)
	movq	%xmm5, %rdx
	jmp	.L1458
	.p2align 4,,10
	.p2align 3
.L1460:
	movq	8(%rdx), %rcx
	testq	%rcx, %rcx
	je	.L1459
.L1461:
	movq	%rbx, %rdx
	call	tac_statement
	movq	(%rsi), %rdx
.L1458:
	testq	%rdx, %rdx
	je	.L1459
	movq	(%rdx), %rax
	movq	%rax, (%rsi)
	testq	%rax, %rax
	jne	.L1460
	movq	8(%rdx), %rcx
	movq	$0, 8(%rsi)
	testq	%rcx, %rcx
	jne	.L1461
	.p2align 4,,10
	.p2align 3
.L1459:
	call	alloc_memory.constprop.1
	movq	$0, 8(%rax)
	movq	%rax, %rdx
	movl	$20, 24(%rax)
	movq	%rdi, (%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L1456:
	call	alloc_memory.constprop.0
	movq	%rax, %rsi
	movq	48(%rsp), %rax
	movq	%rax, (%rsi)
.L1612:
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, 8(%rsi)
.L1611:
	movq	8(%rbx), %rax
	movq	%rsi, %rdx
	movq	32(%rax), %rcx
	call	list_append
	movq	%rsi, 16(%rbx)
	jmp	.L1421
	.p2align 4,,10
	.p2align 3
.L1431:
	movq	(%rcx), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	testq	%rax, %rax
	je	.L1421
	cmpb	$0, 20(%rax)
	jne	.L1619
.L1421:
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
.L1430:
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
.L1427:
	movq	(%rcx), %rsi
	movq	(%rsi), %rcx
	testq	%rcx, %rcx
	je	.L1473
	xorl	%r8d, %r8d
	movq	%rbx, %rdx
	call	tac_variable
.L1473:
	movq	%rbx, %rcx
	call	create_var.part.0.constprop.0
	movq	%rbx, %rcx
	movq	%rax, %rdi
	call	create_var.part.0.constprop.0
	movq	%rbx, %rcx
	movq	%rax, %r13
	call	create_var.part.0.constprop.0
	cmpq	$0, 8(%rsi)
	movq	%rax, %r12
	je	.L1474
	call	alloc_memory.constprop.2
	movl	$6, 16(%rax)
	movq	%rax, %r14
	movq	$0, 8(%rax)
	movq	%rdi, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory.constprop.1
	movq	%rax, %rdx
	movq	%r14, (%rax)
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	call	alloc_memory.constprop.0
	movq	%rdi, (%rax)
	movq	%rax, %r14
	call	alloc_memory.constprop.0
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
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L1475
	cmpb	$0, 20(%rax)
	jne	.L1620
.L1475:
	movq	%rcx, 56(%rsp)
	call	alloc_memory.constprop.2
	movl	$6, 16(%rax)
	movq	%rax, %r14
	movq	$0, 8(%rax)
	movq	%r12, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory.constprop.2
	movl	$6, 16(%rax)
	movq	%rax, %r15
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory.constprop.1
	movq	56(%rsp), %rcx
	movq	%r15, 8(%rax)
	movq	%rax, %rdx
	movq	%rcx, (%rax)
	movl	$19, 24(%rax)
	movq	%r14, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L1476:
	call	alloc_memory.constprop.0
	movq	%r13, (%rax)
	movq	%rax, %r14
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movq	%r14, %rdx
	movups	%xmm0, (%rax)
	movq	%rax, 8(%r14)
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	call	list_append
	movq	%r14, 16(%rbx)
	movq	%rbx, %rcx
	call	create_var.part.0.constprop.0
	cmpq	$0, 16(%rsi)
	movq	%rax, %r14
	je	.L1477
	call	alloc_memory.constprop.2
	movb	$0, 20(%rax)
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r14, (%rax)
	call	list_append
.L1478:
	call	alloc_memory.constprop.2
	movb	$0, 20(%rax)
	movq	32(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r12, (%rax)
	call	list_append
	movq	24(%rsi), %rdx
	testq	%rdx, %rdx
	je	.L1484
	movq	%rdx, 56(%rsp)
	call	alloc_memory.constprop.0
	movq	56(%rsp), %rdx
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, %r15
	movdqu	(%rdx), %xmm4
	movups	%xmm4, (%rax)
	movq	%xmm4, %rdx
	jmp	.L1483
	.p2align 4,,10
	.p2align 3
.L1485:
	movq	8(%rdx), %rcx
	testq	%rcx, %rcx
	je	.L1484
.L1486:
	movq	%rbx, %rdx
	call	tac_statement
	movq	(%r15), %rdx
.L1483:
	testq	%rdx, %rdx
	je	.L1484
	movq	(%rdx), %rax
	movq	%rax, (%r15)
	testq	%rax, %rax
	jne	.L1485
	movq	8(%rdx), %rcx
	movq	$0, 8(%r15)
	testq	%rcx, %rcx
	jne	.L1486
	.p2align 4,,10
	.p2align 3
.L1484:
	movq	40(%rbx), %r8
	testq	%r8, %r8
	je	.L1481
	movq	(%r8), %rax
	testq	%rax, %rax
	je	.L1481
	movq	8(%r8), %rdx
	cmpq	%rdx, %rax
	je	.L1621
	.p2align 4,,10
	.p2align 3
.L1487:
	movq	%rax, %rcx
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L1487
	movq	$0, (%rcx)
	movq	%rcx, 8(%r8)
.L1481:
	movq	32(%rbx), %r8
	testq	%r8, %r8
	je	.L1488
	movq	(%r8), %rax
	testq	%rax, %rax
	je	.L1488
	movq	8(%r8), %rdx
	cmpq	%rdx, %rax
	je	.L1622
	.p2align 4,,10
	.p2align 3
.L1489:
	movq	%rax, %rcx
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L1489
	movq	$0, (%rcx)
	movq	%rcx, 8(%r8)
.L1488:
	cmpq	$0, 16(%rsi)
	je	.L1491
	call	alloc_memory.constprop.2
	movl	$6, 16(%rax)
	movq	%rax, %r15
	movq	$0, 8(%rax)
	movq	%r14, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory.constprop.1
	movq	%rax, %rdx
	movq	%r15, (%rax)
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	call	alloc_memory.constprop.0
	movq	%r14, (%rax)
	movq	%rax, %r15
	call	alloc_memory.constprop.0
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
	je	.L1491
	cmpb	$0, 20(%rax)
	jne	.L1623
.L1491:
	call	alloc_memory.constprop.2
	movl	$6, 16(%rax)
	movq	%rax, %r14
	movq	$0, 8(%rax)
	movq	%rdi, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory.constprop.1
	cmpq	$0, 8(%rsi)
	movl	$20, 24(%rax)
	movq	%rax, %rdx
	movq	%r14, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	je	.L1624
.L1493:
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	call	alloc_memory.constprop.0
	movq	%r12, (%rax)
	movq	%rax, %rsi
	jmp	.L1612
	.p2align 4,,10
	.p2align 3
.L1426:
	movq	%rcx, 56(%rsp)
	call	alloc_memory.constprop.2
	movq	56(%rsp), %rcx
	movq	%rax, %rsi
	movl	$5, 16(%rax)
	movq	$0, (%rax)
	movq	name_void(%rip), %rax
	movb	$0, 20(%rsi)
	movq	(%rcx), %rcx
	movq	%rax, 8(%rsi)
	testq	%rcx, %rcx
	je	.L1494
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L1494
	cmpb	$0, 20(%rax)
	jne	.L1625
.L1494:
	call	alloc_memory.constprop.1
	movl	$21, 24(%rax)
	movq	%rax, %rdx
.L1613:
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
.L1428:
	movq	(%rcx), %rsi
	movq	%rbx, %rcx
	call	create_var.part.0.constprop.0
	movq	%rax, %rdi
	call	alloc_memory.constprop.2
	movl	$6, 16(%rax)
	movq	%rax, %r12
	movq	$0, 8(%rax)
	movq	%rdi, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory.constprop.1
	movq	%rax, %rdx
	movq	%r12, (%rax)
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%rdi, %rcx
	call	create_block
	movq	%rax, %r12
	movq	8(%rbx), %rax
	movq	%r12, %rdx
	movq	32(%rax), %rcx
	call	list_append
	movq	%r12, 16(%rbx)
	movq	%rbx, %rcx
	call	create_var.part.0.constprop.0
	movq	%rbx, %rcx
	movq	%rax, %r13
	call	create_var.part.0.constprop.0
	movq	(%rsi), %rcx
	movq	%rbx, %rdx
	movq	%rax, %r12
	call	tac_expression
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L1462
	cmpb	$0, 20(%rax)
	jne	.L1626
.L1462:
	movq	%rcx, 56(%rsp)
	call	alloc_memory.constprop.2
	movl	$6, 16(%rax)
	movq	%rax, %r14
	movq	$0, 8(%rax)
	movq	%r12, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory.constprop.2
	movq	%r13, (%rax)
	movq	%rax, %r15
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movb	$0, 20(%rax)
	call	alloc_memory.constprop.1
	movq	56(%rsp), %rcx
	movq	%rax, %rdx
	movq	%r15, 8(%rax)
	movq	%rcx, (%rax)
	movl	$19, 24(%rax)
	movq	%r14, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%r13, %rcx
	call	create_block
	movq	%rax, %r13
	movq	8(%rbx), %rax
	movq	%r13, %rdx
	movq	32(%rax), %rcx
	call	list_append
	movq	%r13, 16(%rbx)
	call	alloc_memory.constprop.2
	movb	$0, 20(%rax)
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rdi, (%rax)
	call	list_append
	call	alloc_memory.constprop.2
	movb	$0, 20(%rax)
	movq	32(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r12, (%rax)
	call	list_append
	movq	8(%rsi), %r13
	testq	%r13, %r13
	je	.L1467
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	0(%r13), %xmm3
	movq	%rax, %rsi
	movups	%xmm3, (%rax)
	movq	%xmm3, %rdx
	jmp	.L1466
	.p2align 4,,10
	.p2align 3
.L1468:
	movq	8(%rdx), %rcx
	testq	%rcx, %rcx
	je	.L1467
.L1469:
	movq	%rbx, %rdx
	call	tac_statement
	movq	(%rsi), %rdx
.L1466:
	testq	%rdx, %rdx
	je	.L1467
	movq	(%rdx), %rax
	movq	%rax, (%rsi)
	testq	%rax, %rax
	jne	.L1468
	movq	8(%rdx), %rcx
	movq	$0, 8(%rsi)
	testq	%rcx, %rcx
	jne	.L1469
	.p2align 4,,10
	.p2align 3
.L1467:
	movq	40(%rbx), %r8
	testq	%r8, %r8
	je	.L1464
	movq	(%r8), %rax
	testq	%rax, %rax
	je	.L1464
	movq	8(%r8), %rdx
	cmpq	%rdx, %rax
	je	.L1627
	.p2align 4,,10
	.p2align 3
.L1470:
	movq	%rax, %rcx
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L1470
	movq	$0, (%rcx)
	movq	%rcx, 8(%r8)
.L1464:
	movq	32(%rbx), %r8
	testq	%r8, %r8
	je	.L1471
	movq	(%r8), %rax
	testq	%rax, %rax
	je	.L1471
	movq	8(%r8), %rdx
	cmpq	%rdx, %rax
	je	.L1628
	.p2align 4,,10
	.p2align 3
.L1472:
	movq	%rax, %rcx
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L1472
	movq	$0, (%rcx)
	movq	%rcx, 8(%r8)
.L1471:
	call	alloc_memory.constprop.2
	movl	$6, 16(%rax)
	movq	%rax, %rsi
	movq	$0, 8(%rax)
	movq	%rdi, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory.constprop.1
	movq	%rsi, (%rax)
	movq	%rax, %rdx
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%r12, %rcx
	call	create_block
	movq	%rax, %rsi
	jmp	.L1611
	.p2align 4,,10
	.p2align 3
.L1496:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC167(%rip), %rcx
	movq	%rax, %r9
	jmp	.L1614
	.p2align 4,,10
	.p2align 3
.L1433:
	movq	24(%r14), %rax
	movq	%rsi, 48(%rsp)
	testq	%rax, %rax
	je	.L1435
	cmpq	$0, (%rax)
	je	.L1435
	cmpq	$0, 8(%rax)
	jne	.L1434
	jmp	.L1435
	.p2align 4,,10
	.p2align 3
.L1422:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movups	64(%rsp), %xmm6
	leaq	-56(%rbp), %rsp
	movl	%esi, %r8d
	popq	%rbx
	movq	%rax, %rcx
	leaq	.LC168(%rip), %rdx
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
.L1477:
	cmpq	$0, 8(%rsi)
	je	.L1479
	call	alloc_memory.constprop.2
	movb	$0, 20(%rax)
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%rdi, (%rax)
	call	list_append
	jmp	.L1478
	.p2align 4,,10
	.p2align 3
.L1479:
	call	alloc_memory.constprop.2
	movb	$0, 20(%rax)
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	call	list_append
	jmp	.L1478
	.p2align 4,,10
	.p2align 3
.L1623:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	jmp	.L1491
	.p2align 4,,10
	.p2align 3
.L1625:
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue.part.0
	movq	%rax, %rsi
	jmp	.L1494
	.p2align 4,,10
	.p2align 3
.L1447:
	movq	24(%r14), %rax
	testq	%rax, %rax
	je	.L1501
	cmpq	$0, (%rax)
	je	.L1501
	cmpq	$0, 8(%rax)
	cmove	48(%rsp), %rsi
	jmp	.L1448
	.p2align 4,,10
	.p2align 3
.L1617:
	movq	$0, 8(%r13)
	jmp	.L1454
	.p2align 4,,10
	.p2align 3
.L1501:
	movq	48(%rsp), %rsi
	jmp	.L1448
	.p2align 4,,10
	.p2align 3
.L1618:
	movq	%rbx, %rdx
	call	load_rvalue.part.0
	movq	%rax, %rcx
	jmp	.L1446
	.p2align 4,,10
	.p2align 3
.L1474:
	call	alloc_memory.constprop.2
	movq	%r13, (%rax)
	movq	%rax, %r14
	movl	$6, 16(%rax)
	movq	$0, 8(%rax)
	movb	$0, 20(%rax)
	call	alloc_memory.constprop.1
	movq	%r14, (%rax)
	movq	%rax, %rdx
	movq	$0, 8(%rax)
	movl	$20, 24(%rax)
	movq	$0, 16(%rax)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L1476
	.p2align 4,,10
	.p2align 3
.L1619:
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
	.p2align 4,,10
	.p2align 3
.L1616:
	movq	%rbx, %rdx
	call	load_rvalue.part.0
	movq	%rax, %rcx
	jmp	.L1436
	.p2align 4,,10
	.p2align 3
.L1626:
	movq	%rbx, %rdx
	call	load_rvalue.part.0
	movq	%rax, %rcx
	jmp	.L1462
	.p2align 4,,10
	.p2align 3
.L1624:
	call	alloc_memory.constprop.2
	movl	$6, 16(%rax)
	movq	%rax, %rsi
	movq	$0, 8(%rax)
	movq	%r13, (%rax)
	movb	$0, 20(%rax)
	call	alloc_memory.constprop.1
	movl	$20, 24(%rax)
	movq	%rax, %rdx
	movq	%rsi, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	jmp	.L1493
	.p2align 4,,10
	.p2align 3
.L1622:
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%r8)
	jmp	.L1488
	.p2align 4,,10
	.p2align 3
.L1627:
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%r8)
	jmp	.L1464
	.p2align 4,,10
	.p2align 3
.L1621:
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%r8)
	jmp	.L1481
	.p2align 4,,10
	.p2align 3
.L1628:
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%r8)
	jmp	.L1471
	.p2align 4,,10
	.p2align 3
.L1620:
	movq	%rbx, %rdx
	call	load_rvalue.part.0
	movq	%rax, %rcx
	jmp	.L1475
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
	cmpb	$0, initialized(%rip)
	leaq	1(%rax), %rbx
	je	.L1640
	testq	%rbx, %rbx
	je	.L1636
.L1641:
	movq	%rbx, %rdx
	leaq	.LC132(%rip), %rcx
	call	create_string_check.part.0
	movq	%rax, %rbx
.L1631:
	movq	(%rsi), %r8
	movl	$1, %edx
	movq	%rdi, %r9
	movq	%rbx, %rcx
	call	fread
	xorl	%edx, %edx
	movb	$0, (%rbx,%rax)
	movq	%rax, (%rsi)
	testq	%rax, %rax
	je	.L1629
	.p2align 4,,10
	.p2align 3
.L1632:
	movzbl	(%rbx,%rdx), %ecx
	andl	$-5, %ecx
	cmpb	$9, %cl
	jne	.L1633
	movb	$32, (%rbx,%rdx)
	movq	(%rsi), %rax
	addq	$1, %rdx
	cmpq	%rax, %rdx
	jb	.L1632
.L1629:
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L1633:
	addq	$1, %rdx
	cmpq	%rax, %rdx
	jb	.L1632
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L1640:
	call	init.part.0
	testq	%rbx, %rbx
	jne	.L1641
.L1636:
	xorl	%ebx, %ebx
	jmp	.L1631
	.section .rdata,"dr"
	.align 8
.LC169:
	.ascii "[Warning] Constructor '%s' does not start with 'self' initialization\12\0"
	.align 8
.LC170:
	.ascii "[Warning] Unsupported class member type for tac_class: %d\12\0"
	.section	.text.unlikely,"x"
.LCOLDB171:
	.text
.LHOTB171:
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
	subq	$80, %rsp
	movq	8(%rcx), %rdi
	movups	%xmm6, 80(%rsp)
	movups	%xmm7, 96(%rsp)
	movq	%rcx, 24(%rdx)
	testq	%rdi, %rdi
	je	.L1643
	call	alloc_memory.constprop.0
	pxor	%xmm6, %xmm6
	movq	(%rsi), %xmm7
	movups	%xmm6, (%rax)
	movdqu	(%rdi), %xmm5
	movq	%rax, 72(%rsp)
	movups	%xmm5, (%rax)
	movups	%xmm5, 48(%rsp)
	call	alloc_memory.constprop.2
	movq	%rax, %rsi
	call	alloc_memory.constprop.0
	movq	%rsi, %rdx
	movq	%rax, %xmm0
	movups	%xmm6, (%rax)
	punpcklqdq	%xmm7, %xmm0
	movq	$0, 16(%rsi)
	movups	%xmm0, (%rsi)
	movq	(%rbx), %rax
	movq	(%rax), %rcx
	call	list_append
.L1644:
	movq	72(%rsp), %rdi
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L1645
.L1734:
	movq	(%rax), %rdx
	movq	%rdx, (%rdi)
	testq	%rdx, %rdx
	je	.L1733
.L1690:
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1645
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1646
	cmpl	$1, %esi
	je	.L1647
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	%esi, %r8d
	leaq	.LC170(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	72(%rsp), %rdi
	movq	(%rdi), %rax
	testq	%rax, %rax
	jne	.L1734
.L1645:
	movq	$0, 24(%rbx)
	movups	80(%rsp), %xmm6
	movups	96(%rsp), %xmm7
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
.L1647:
	movq	(%rax), %rcx
	movl	$1, %r8d
	movq	%rbx, %rdx
	call	tac_variable
	jmp	.L1644
	.p2align 4,,10
	.p2align 3
.L1646:
	movq	(%rax), %r12
	movl	$40, %ecx
	movdqu	(%r12), %xmm6
	call	alloc_memory
	movups	%xmm6, (%rax)
	movq	%rax, %r13
	pxor	%xmm6, %xmm6
	call	alloc_memory.constprop.0
	movups	%xmm6, (%rax)
	movq	%rax, 16(%r13)
	call	alloc_memory.constprop.0
	movups	%xmm6, (%rax)
	movq	%rax, 24(%r13)
	call	alloc_memory.constprop.0
	movq	%r13, %rdx
	movups	%xmm6, (%rax)
	movq	%rax, 32(%r13)
	movq	(%rbx), %rax
	movq	%r13, 8(%rbx)
	movq	24(%rax), %rcx
	call	list_append
	movq	16(%r12), %rsi
	testq	%rsi, %rsi
	je	.L1670
	call	alloc_memory.constprop.0
	movq	%r12, 48(%rsp)
	movups	%xmm6, (%rax)
	movdqu	(%rsi), %xmm3
	movq	%rax, %r15
	movups	%xmm3, (%rax)
	movq	%xmm3, %rax
	jmp	.L1652
	.p2align 4,,10
	.p2align 3
.L1658:
	movq	16(%r13), %rdi
	testq	%rdi, %rdi
	je	.L1735
.L1667:
	call	alloc_memory.constprop.0
	cmpq	$0, (%rdi)
	movq	$0, (%rax)
	movq	%rsi, 8(%rax)
	je	.L1736
	movq	8(%rdi), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rdi)
.L1668:
	movq	(%r15), %rax
.L1652:
	testq	%rax, %rax
	je	.L1728
	movq	(%rax), %rdx
	movq	%rdx, (%r15)
	testq	%rdx, %rdx
	je	.L1737
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1728
.L1672:
	movq	8(%rax), %r14
	movq	(%rax), %rdi
	testq	%r14, %r14
	je	.L1659
	movl	32(%rdi), %r9d
	xorl	%r12d, %r12d
	testl	%r9d, %r9d
	jne	.L1656
	movq	24(%rdi), %rax
	movq	24(%rbx), %r12
	movq	%rax, 24(%rbx)
.L1656:
	movq	%rbx, %rdx
	movq	%r14, %rcx
	call	search_var
	movl	32(%rdi), %r8d
	movq	%rax, %rsi
	testl	%r8d, %r8d
	jne	.L1657
	movq	%r12, 24(%rbx)
.L1657:
	testq	%rsi, %rsi
	jne	.L1658
.L1659:
	call	alloc_memory.constprop.2
	movq	56(%rbx), %r12
	cmpb	$0, initialized(%rip)
	movq	%r14, (%rax)
	movq	%rax, %rsi
	leaq	1(%r12), %rax
	movq	%rax, 56(%rbx)
	je	.L1738
.L1655:
	movq	all_string_list(%rip), %rax
	testq	%rax, %rax
	je	.L1660
	xorl	%r14d, %r14d
	jmp	.L1662
	.p2align 4,,10
	.p2align 3
.L1661:
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L1739
.L1662:
	cmpq	$32, 8(%rax)
	jne	.L1661
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L1661
	movq	16(%rax), %rax
	cmpb	$0, (%rdx)
	cmove	%rdx, %r14
	testq	%rax, %rax
	jne	.L1662
.L1739:
	testq	%r14, %r14
	je	.L1660
	movq	%r14, 8(%rsi)
	cmpq	$-1, %r12
	je	.L1740
.L1665:
	movq	%r12, %r9
	movl	$112, %r8d
	leaq	.LC134(%rip), %rdx
	movq	%r14, %rcx
	call	sprintf
.L1666:
	movq	%rdi, 16(%rsi)
	movq	16(%r13), %rdi
	testq	%rdi, %rdi
	jne	.L1667
.L1735:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC129(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L1668
	.p2align 4,,10
	.p2align 3
.L1737:
	movq	8(%rax), %rax
	movq	$0, 8(%r15)
	testq	%rax, %rax
	jne	.L1672
	.p2align 4,,10
	.p2align 3
.L1728:
	movq	48(%rsp), %r12
.L1670:
	movq	%rbx, %rcx
	pxor	%xmm6, %xmm6
	call	create_var.part.0.constprop.0
	movq	%rax, %rsi
	call	alloc_memory.constprop.0
	movq	%rsi, (%rax)
	movq	%rax, %rdi
	call	alloc_memory.constprop.0
	movq	32(%r13), %rcx
	movq	%rdi, %rdx
	movups	%xmm6, (%rax)
	movq	%rax, 8(%rdi)
	call	list_append
	movq	24(%r12), %r13
	movq	%rdi, 16(%rbx)
	testq	%r13, %r13
	je	.L1741
	call	alloc_memory.constprop.0
	movups	%xmm6, (%rax)
	movdqu	0(%r13), %xmm4
	movq	%rax, %rsi
	movups	%xmm4, (%rax)
.L1650:
	movq	24(%rbx), %rax
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %r15
	movq	(%rax), %rax
	movq	%r15, 64(%rsp)
	movq	8(%rax), %r14
	movq	%r14, %rcx
	call	strlen
	movq	%r15, %rcx
	movq	%rax, %r13
	call	strlen
	cmpb	$0, initialized(%rip)
	leaq	2(%r13,%rax), %r13
	je	.L1742
.L1673:
	movq	all_string_list(%rip), %r9
	testq	%r9, %r9
	je	.L1674
	xorl	%r15d, %r15d
	movl	$1, %eax
	cmpq	$0, %r13
	movq	%rsi, 40(%rsp)
	cmovbe	%r13, %rax
	movq	%rdi, 32(%rsp)
	movq	%r13, %rsi
	movq	%r15, %rdi
	movq	%rbx, %r13
	movq	%r9, %rbx
	movq	%rax, 48(%rsp)
	jmp	.L1676
	.p2align 4,,10
	.p2align 3
.L1675:
	movq	16(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L1743
.L1676:
	cmpq	8(%rbx), %rsi
	jne	.L1675
	movq	(%rbx), %r15
	testq	%r15, %r15
	je	.L1675
	movq	48(%rsp), %r8
	leaq	.LC132(%rip), %rdx
	movq	%r15, %rcx
	call	strncmp
	movq	16(%rbx), %rbx
	testl	%eax, %eax
	cmove	%r15, %rdi
	testq	%rbx, %rbx
	jne	.L1676
.L1743:
	movq	%rdi, %r15
	movq	%r13, %rbx
	movq	32(%rsp), %rdi
	movq	%rsi, %r13
	movq	40(%rsp), %rsi
	testq	%r15, %r15
	je	.L1674
.L1677:
	movq	64(%rsp), %r9
	leaq	.LC145(%rip), %rdx
	movq	%r15, %rcx
	movq	%r14, %r8
	call	sprintf
	movq	(%r12), %rax
	movq	%r15, %rdx
	movq	8(%rax), %r12
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L1678
	testq	%rsi, %rsi
	je	.L1679
	movq	(%rsi), %rax
	testq	%rax, %rax
	je	.L1679
	movq	(%rax), %rdx
	movq	%rdx, (%rsi)
	testq	%rdx, %rdx
	je	.L1744
	movq	8(%rax), %rax
	movl	8(%rax), %ecx
	testl	%ecx, %ecx
	jne	.L1681
.L1747:
	movq	(%rax), %rax
	cmpl	$19, 24(%rax)
	je	.L1745
.L1681:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%r12, %r8
	leaq	.LC169(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L1644
	.p2align 4,,10
	.p2align 3
.L1736:
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm0
	movups	%xmm0, (%rdi)
	jmp	.L1668
	.p2align 4,,10
	.p2align 3
.L1733:
	movq	$0, 8(%rdi)
	jmp	.L1690
	.p2align 4,,10
	.p2align 3
.L1660:
	movq	string_memory(%rip), %rdx
	movq	8(%rdx), %rax
	leaq	32(%rax), %rcx
	cmpq	(%rdx), %rcx
	jnb	.L1746
.L1664:
	movq	24(%rdx), %r14
	movdqu	.LC132(%rip), %xmm1
	movdqu	16+.LC132(%rip), %xmm2
	addq	%rax, %r14
	addq	$33, %rax
	movq	%rax, 8(%rdx)
	movb	$0, 32(%r14)
	movups	%xmm1, (%r14)
	movups	%xmm2, 16(%r14)
	call	alloc_memory.constprop.2
	movq	all_string_list(%rip), %rdx
	movq	%r14, (%rax)
	movq	$32, 8(%rax)
	movq	%rdx, 16(%rax)
	movq	%rax, all_string_list(%rip)
	movq	%r14, 8(%rsi)
	cmpq	$-1, %r12
	jne	.L1665
.L1740:
	movl	$112, %r8d
	leaq	.LC133(%rip), %rdx
	movq	%r14, %rcx
	call	sprintf
	jmp	.L1666
	.p2align 4,,10
	.p2align 3
.L1738:
	call	init.part.0
	jmp	.L1655
	.p2align 4,,10
	.p2align 3
.L1678:
	testq	%rsi, %rsi
	jne	.L1685
	jmp	.L1686
	.p2align 4,,10
	.p2align 3
.L1687:
	movq	8(%rax), %rcx
	testq	%rcx, %rcx
	je	.L1686
.L1688:
	movq	%rbx, %rdx
	call	tac_statement
.L1685:
	movq	(%rsi), %rax
	testq	%rax, %rax
	je	.L1686
	movq	(%rax), %rdx
	movq	%rdx, (%rsi)
	testq	%rdx, %rdx
	jne	.L1687
	movq	8(%rax), %rcx
	movq	$0, 8(%rsi)
	testq	%rcx, %rcx
	jne	.L1688
	.p2align 4,,10
	.p2align 3
.L1686:
	movq	$0, 8(%rbx)
	jmp	.L1644
	.p2align 4,,10
	.p2align 3
.L1674:
	movq	%r13, %rdx
	leaq	.LC132(%rip), %rcx
	call	create_string_check.part.0
	movq	%rax, %r15
	jmp	.L1677
	.p2align 4,,10
	.p2align 3
.L1745:
	movq	8(%rax), %rax
	cmpl	$8, 8(%rax)
	jne	.L1681
	movq	(%rax), %rax
	movl	16(%rax), %edx
	testl	%edx, %edx
	jne	.L1681
	movq	24(%rbx), %r14
	movq	8(%rax), %r13
	call	alloc_memory.constprop.2
	movq	%rbx, %r9
	movl	$118, %r8d
	movq	%rax, %r12
	movl	$1, 16(%rax)
	movq	24(%r14), %rax
	movq	%r13, %rcx
	movb	$0, 20(%r12)
	movq	0(%r13), %rdx
	movq	%rax, (%r12)
	movq	name_int(%rip), %rax
	movq	%rax, 8(%r12)
	call	create_var
	movq	%rax, %r14
	call	alloc_memory.constprop.2
	movq	%r14, %xmm0
	movhps	16(%r14), %xmm0
	movl	$0, 16(%rax)
	movq	%rax, %r13
	movb	$0, 20(%rax)
	movups	%xmm0, (%rax)
	call	alloc_memory.constprop.1
	movq	8(%rdi), %rcx
	movl	$18, 24(%rax)
	movq	%rax, %rdx
	movq	%r13, (%rax)
	movq	%r12, 8(%rax)
	movq	$0, 16(%rax)
	call	list_append
	jmp	.L1685
	.p2align 4,,10
	.p2align 3
.L1742:
	call	init.part.0
	jmp	.L1673
	.p2align 4,,10
	.p2align 3
.L1746:
	xorl	%ecx, %ecx
	call	increase_memory_size
	movq	string_memory(%rip), %rdx
	movq	8(%rdx), %rax
	jmp	.L1664
.L1741:
	xorl	%esi, %esi
	jmp	.L1650
.L1744:
	movq	8(%rax), %rax
	movq	$0, 8(%rsi)
	movl	8(%rax), %ecx
	testl	%ecx, %ecx
	je	.L1747
	jmp	.L1681
.L1643:
	movq	(%rcx), %xmm6
	call	alloc_memory.constprop.2
	movq	%rax, %rsi
	call	alloc_memory.constprop.0
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
	jmp	.L1645
	.section	.text.unlikely,"x"
	.def	tac_class.cold;	.scl	3;	.type	32;	.endef
tac_class.cold:
.L1679:
	movl	8, %eax
	ud2
	.text
	.section	.text.unlikely,"x"
.LCOLDE171:
	.text
.LHOTE171:
	.section	.text.unlikely,"x"
.LCOLDB172:
	.text
.LHOTB172:
	.p2align 4
	.def	get_file_dir;	.scl	3;	.type	32;	.endef
get_file_dir:
	movq	(%rcx), %rdx
	testq	%rdx, %rdx
	je	.L1777
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
	je	.L1748
	.p2align 4,,10
	.p2align 3
.L1750:
	movq	(%rdx), %rcx
	addq	$1, %rdi
	call	strlen
	movq	%rbx, %rdx
	addq	%rax, %rsi
	movq	8(%rbx), %rax
	testq	%rax, %rax
	je	.L1781
	movq	%rax, %rbx
	jmp	.L1750
	.p2align 4,,10
	.p2align 3
.L1781:
	testq	%rdi, %rdi
	je	.L1748
	leaq	1(%rsi), %rax
	addq	%rdi, %rsi
	cmpq	$1, %rdi
	cmove	%rax, %rsi
	cmpb	$0, initialized(%rip)
	je	.L1782
.L1755:
	testq	%rsi, %rsi
	je	.L1756
	movq	%rsi, %rdx
	leaq	.LC132(%rip), %rcx
	call	create_string_check.part.0
	movb	$0, (%rax)
	movq	0(%rbp), %rbx
	movq	%rax, %rsi
	testq	%rbx, %rbx
	je	.L1758
	cmpq	$0, 8(%rbx)
	je	.L1758
.L1780:
	movq	(%rbx), %rdx
.L1760:
	movq	%rsi, %rcx
	call	strcat
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L1758
	cmpq	$0, 8(%rbx)
	je	.L1758
	movq	(%rbx), %rdx
	cmpb	$47, (%rdx)
	je	.L1783
.L1763:
	cmpb	$0, (%rsi)
	je	.L1760
	movq	%rsi, %rcx
	movq	%rdx, 40(%rsp)
	call	strlen
	movq	40(%rsp), %rdx
	cmpb	$47, -1(%rsi,%rax)
	je	.L1760
	movl	$47, %edx
	movw	%dx, (%rsi,%rax)
	jmp	.L1780
	.p2align 4,,10
	.p2align 3
.L1758:
	movq	%rsi, %rcx
	call	strlen
	addq	$56, %rsp
	movq	%rsi, %rcx
	popq	%rbx
	movq	%rax, %rdx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	create_string_check.constprop.0
	.p2align 4,,10
	.p2align 3
.L1783:
	cmpb	$0, 1(%rdx)
	je	.L1760
	jmp	.L1763
	.p2align 4,,10
	.p2align 3
.L1782:
	call	init.part.0
	jmp	.L1755
.L1748:
	addq	$56, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L1777:
	xorl	%eax, %eax
	ret
	.section	.text.unlikely,"x"
	.def	get_file_dir.cold;	.scl	3;	.type	32;	.endef
get_file_dir.cold:
.L1756:
	movb	$0, 0
	ud2
	.text
	.section	.text.unlikely,"x"
.LCOLDE172:
	.text
.LHOTE172:
	.section .rdata,"dr"
.LC173:
	.ascii "%s/%s%s\0"
.LC174:
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
	je	.L1798
	movq	%rax, %rcx
	movq	8(%rbx), %rbp
	call	strlen
	movq	16(%rbx), %rcx
	movq	%rax, %rsi
	call	strlen
	addq	%rax, %rsi
	testq	%rbp, %rbp
	je	.L1792
	addq	$1, %rsi
	movq	%rdi, %r12
	leaq	.LC132(%rip), %r13
.L1793:
	movq	%rbp, %rcx
	call	strlen
	movq	%r13, %rcx
	leaq	1(%rsi,%rax), %rdx
	call	create_string_check.constprop.1
	movq	%rax, %rsi
	testq	%rdi, %rdi
	je	.L1787
.L1789:
	cmpb	$0, (%r12)
	jne	.L1799
.L1787:
	movq	16(%rbx), %r8
	movq	%rbp, %r9
	leaq	.LC174(%rip), %rdx
	movq	%rsi, %rcx
	call	sprintf
.L1788:
	movq	%rsi, %rcx
	call	strlen
	movq	%rsi, %rcx
	movq	%rax, %rdx
	call	create_string_check.constprop.0
	movq	%rax, 24(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L1792:
	leaq	.LC132(%rip), %rbp
	leaq	2(%rsi), %rdx
	movq	%rdi, %r12
	movq	%rbp, %rcx
	call	create_string_check.constprop.1
	movq	%rax, %rsi
	jmp	.L1789
.L1798:
	movq	8(%rbx), %rbp
	movq	16(%rbx), %rcx
	call	strlen
	testq	%rbp, %rbp
	je	.L1800
	leaq	.LC132(%rip), %r13
	leaq	1(%rax), %rsi
	movq	%r13, %r12
	jmp	.L1793
.L1799:
	movq	%rbp, 32(%rsp)
	movq	16(%rbx), %r9
	movq	%r12, %r8
	movq	%rsi, %rcx
	leaq	.LC173(%rip), %rdx
	call	sprintf
	jmp	.L1788
.L1800:
	leaq	.LC132(%rip), %rbp
	leaq	2(%rax), %rdx
	movq	%rbp, %rcx
	call	create_string_check.constprop.1
	movq	%rax, %rsi
	jmp	.L1787
	.section .rdata,"dr"
.LC175:
	.ascii "condition\12\0"
.LC176:
	.ascii "body\12\0"
.LC177:
	.ascii "if_statement\12\0"
.LC178:
	.ascii "for_statement\12\0"
.LC179:
	.ascii "while_statement\12\0"
	.align 8
.LC180:
	.ascii "variable_declaration_statement\12\0"
.LC181:
	.ascii "return_statement: \"NULL\"\12\0"
.LC182:
	.ascii "return_statement\12\0"
.LC183:
	.ascii "break_statement: \"NULL\"\12\0"
.LC184:
	.ascii "continue_statement: \"NULL\"\12\0"
.LC185:
	.ascii "expression_statement: \"NULL\"\12\0"
.LC186:
	.ascii "expression_statement\12\0"
.LC187:
	.ascii "unknown_StatementType: %u\12\0"
	.text
	.p2align 4
	.def	output_while;	.scl	3;	.type	32;	.endef
output_while:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	leaq	1(%r8), %r13
	pushq	%r12
	movq	%r8, %r12
	pushq	%rdi
	movq	%r9, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movq	%rcx, %rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	movq	8(%rcx), %r15
	testq	%r15, %r15
	je	.L1802
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movq	%rdi, %r8
	movq	%r12, %rdx
	movups	%xmm0, (%rax)
	movdqu	(%r15), %xmm1
	movq	%rsi, %rcx
	movq	%rax, %r14
	leaq	.L1807(%rip), %r15
	movups	%xmm1, (%rax)
	call	indention.constprop.6
	movq	%rsi, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC175(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rcx
	movq	%rdi, %r9
	movq	%r13, %r8
	movq	%rsi, %rdx
	call	output_expression
	movq	%rdi, %r8
	movq	%r12, %rdx
	movq	%rsi, %rcx
	call	indention.constprop.7
	movq	%rsi, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC176(%rip), %rcx
	call	fwrite
	.p2align 4,,10
	.p2align 3
.L1803:
	movq	(%r14), %rax
	testq	%rax, %rax
	je	.L1801
	movq	(%rax), %rdx
	movq	%rdx, (%r14)
	testq	%rdx, %rdx
	je	.L1826
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	je	.L1801
.L1820:
	cmpl	$7, 8(%rbx)
	ja	.L1805
	movl	8(%rbx), %eax
	movq	%rdi, %r8
	movq	%r13, %rdx
	movq	%rsi, %rcx
	movslq	(%r15,%rax,4), %rax
	addq	%r15, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L1807:
	.long	.L1814-.L1807
	.long	.L1813-.L1807
	.long	.L1812-.L1807
	.long	.L1811-.L1807
	.long	.L1810-.L1807
	.long	.L1809-.L1807
	.long	.L1808-.L1807
	.long	.L1806-.L1807
	.text
	.p2align 4,,10
	.p2align 3
.L1826:
	movq	8(%rax), %rbx
	movq	$0, 8(%r14)
	testq	%rbx, %rbx
	jne	.L1820
.L1801:
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
.L1808:
	call	indention.constprop.6
	movq	%rsi, %r9
	movl	$24, %r8d
	movl	$1, %edx
	leaq	.LC183(%rip), %rcx
	call	fwrite
	jmp	.L1803
	.p2align 4,,10
	.p2align 3
.L1809:
	cmpq	$0, (%rbx)
	je	.L1827
	call	indention.constprop.6
	movq	%rsi, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC182(%rip), %rcx
.L1825:
	call	fwrite
	movq	(%rbx), %rcx
	movq	%rdi, %r9
	leaq	2(%r12), %r8
	movq	%rsi, %rdx
	call	output_expression
	jmp	.L1803
	.p2align 4,,10
	.p2align 3
.L1810:
	call	indention.constprop.6
	movq	%rsi, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC178(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rcx
	movq	%rdi, %r9
	leaq	2(%r12), %r8
	movq	%rsi, %rdx
	call	output_for
	jmp	.L1803
	.p2align 4,,10
	.p2align 3
.L1811:
	call	indention.constprop.6
	movq	%rsi, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC179(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rcx
	movq	%rdi, %r9
	leaq	2(%r12), %r8
	movq	%rsi, %rdx
	call	output_while
	jmp	.L1803
	.p2align 4,,10
	.p2align 3
.L1812:
	call	indention.constprop.6
	movq	%rsi, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC177(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rcx
	movq	%rdi, %r9
	leaq	2(%r12), %r8
	movq	%rsi, %rdx
	call	output_if
	jmp	.L1803
	.p2align 4,,10
	.p2align 3
.L1813:
	call	indention.constprop.6
	movq	%rsi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC180(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rcx
	movq	%rdi, %r9
	leaq	2(%r12), %r8
	movq	%rsi, %rdx
	call	output_variable
	jmp	.L1803
	.p2align 4,,10
	.p2align 3
.L1814:
	cmpq	$0, (%rbx)
	je	.L1828
	call	indention.constprop.6
	movq	%rsi, %r9
	movl	$21, %r8d
	movl	$1, %edx
	leaq	.LC186(%rip), %rcx
	jmp	.L1825
	.p2align 4,,10
	.p2align 3
.L1806:
	call	indention.constprop.6
	movq	%rsi, %r9
	movl	$27, %r8d
	movl	$1, %edx
	leaq	.LC184(%rip), %rcx
	call	fwrite
	jmp	.L1803
.L1805:
	movq	%rdi, %r8
	movq	%r13, %rdx
	movq	%rsi, %rcx
	call	indention.constprop.6
	movl	8(%rbx), %r8d
	leaq	.LC187(%rip), %rdx
	movq	%rsi, %rcx
	call	fprintf
	jmp	.L1803
	.p2align 4,,10
	.p2align 3
.L1827:
	call	indention.constprop.6
	movq	%rsi, %r9
	movl	$25, %r8d
	movl	$1, %edx
	leaq	.LC181(%rip), %rcx
	call	fwrite
	jmp	.L1803
	.p2align 4,,10
	.p2align 3
.L1828:
	call	indention.constprop.6
	movq	%rsi, %r9
	movl	$29, %r8d
	movl	$1, %edx
	leaq	.LC185(%rip), %rcx
	call	fwrite
	jmp	.L1803
	.p2align 4,,10
	.p2align 3
.L1802:
	movq	%r9, %r8
	movq	%r12, %rdx
	movq	%rsi, %rcx
	call	indention.constprop.6
	movq	%rsi, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC175(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rcx
	movq	%rdi, %r9
	movq	%r13, %r8
	movq	%rsi, %rdx
	call	output_expression
	movq	%rdi, %r8
	movq	%r12, %rdx
	movq	%rsi, %rcx
	call	indention.constprop.7
	leaq	-56(%rbp), %rsp
	movq	%rsi, %r9
	movl	$5, %r8d
	popq	%rbx
	movl	$1, %edx
	leaq	.LC176(%rip), %rcx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	fwrite
	.p2align 4
	.def	output_statement;	.scl	3;	.type	32;	.endef
output_statement:
	pushq	%rbp
	movq	%r9, %rbp
	pushq	%rdi
	movq	%r8, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$40, %rsp
	cmpl	$7, 8(%rcx)
	ja	.L1830
	movl	8(%rcx), %eax
	leaq	.L1832(%rip), %rdx
	movq	%r9, %r8
	movq	%rsi, %rcx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	movq	%rdi, %rdx
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L1832:
	.long	.L1839-.L1832
	.long	.L1838-.L1832
	.long	.L1837-.L1832
	.long	.L1836-.L1832
	.long	.L1835-.L1832
	.long	.L1834-.L1832
	.long	.L1833-.L1832
	.long	.L1831-.L1832
	.text
	.p2align 4,,10
	.p2align 3
.L1833:
	call	indention.constprop.6
	movq	%rsi, %r9
	movl	$24, %r8d
	movl	$1, %edx
	leaq	.LC183(%rip), %rcx
.L1843:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L1831:
	call	indention.constprop.6
	addq	$40, %rsp
	movq	%rsi, %r9
	movl	$27, %r8d
	popq	%rbx
	movl	$1, %edx
	leaq	.LC184(%rip), %rcx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	fwrite
	.p2align 4,,10
	.p2align 3
.L1839:
	cmpq	$0, (%rbx)
	je	.L1845
	call	indention.constprop.6
	movq	%rsi, %r9
	movl	$21, %r8d
	movl	$1, %edx
	leaq	.LC186(%rip), %rcx
.L1844:
	call	fwrite
	movq	(%rbx), %rcx
	addq	$40, %rsp
	movq	%rbp, %r9
	popq	%rbx
	leaq	1(%rdi), %r8
	movq	%rsi, %rdx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	output_expression
	.p2align 4,,10
	.p2align 3
.L1838:
	call	indention.constprop.6
	movq	%rsi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC180(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rcx
	addq	$40, %rsp
	movq	%rbp, %r9
	popq	%rbx
	leaq	1(%rdi), %r8
	movq	%rsi, %rdx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	output_variable
	.p2align 4,,10
	.p2align 3
.L1837:
	call	indention.constprop.6
	movq	%rsi, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC177(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rcx
	addq	$40, %rsp
	movq	%rbp, %r9
	popq	%rbx
	leaq	1(%rdi), %r8
	movq	%rsi, %rdx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	output_if
	.p2align 4,,10
	.p2align 3
.L1836:
	call	indention.constprop.6
	movq	%rsi, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC179(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rcx
	addq	$40, %rsp
	movq	%rbp, %r9
	popq	%rbx
	leaq	1(%rdi), %r8
	movq	%rsi, %rdx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	output_while
	.p2align 4,,10
	.p2align 3
.L1835:
	call	indention.constprop.6
	movq	%rsi, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC178(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rcx
	addq	$40, %rsp
	movq	%rbp, %r9
	popq	%rbx
	leaq	1(%rdi), %r8
	movq	%rsi, %rdx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	output_for
	.p2align 4,,10
	.p2align 3
.L1834:
	cmpq	$0, (%rbx)
	je	.L1846
	call	indention.constprop.6
	movq	%rsi, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC182(%rip), %rcx
	jmp	.L1844
.L1830:
	movq	%rdi, %rdx
	movq	%rsi, %rcx
	movq	%r9, %r8
	call	indention.constprop.6
	movl	8(%rbx), %r8d
	addq	$40, %rsp
	movq	%rsi, %rcx
	popq	%rbx
	leaq	.LC187(%rip), %rdx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L1845:
	call	indention.constprop.6
	movq	%rsi, %r9
	movl	$29, %r8d
	movl	$1, %edx
	leaq	.LC185(%rip), %rcx
	jmp	.L1843
	.p2align 4,,10
	.p2align 3
.L1846:
	call	indention.constprop.6
	movq	%rsi, %r9
	movl	$25, %r8d
	movl	$1, %edx
	leaq	.LC181(%rip), %rcx
	jmp	.L1843
	.section .rdata,"dr"
.LC188:
	.ascii "initializer\12\0"
.LC189:
	.ascii "initializer: \"NULL\"\12\0"
.LC190:
	.ascii "condition: \"NULL\"\12\0"
.LC191:
	.ascii "increment\12\0"
.LC192:
	.ascii "increment: \"NULL\"\12\0"
	.text
	.p2align 4
	.def	output_for;	.scl	3;	.type	32;	.endef
output_for:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%r13
	movq	%rcx, %r13
	pushq	%r12
	movq	%r9, %r12
	pushq	%rdi
	movq	%r8, %rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	movq	24(%rcx), %r14
	testq	%r14, %r14
	je	.L1859
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%r14), %xmm1
	movq	%rax, %rsi
	movups	%xmm1, (%rax)
.L1848:
	cmpq	$0, 0(%r13)
	movq	%r12, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	je	.L1849
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC188(%rip), %rcx
	call	fwrite
	movq	0(%r13), %rcx
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	movq	%r12, %r9
	call	output_variable
	cmpq	$0, 8(%r13)
	movq	%r12, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	je	.L1851
.L1865:
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC175(%rip), %rcx
	call	fwrite
	movq	8(%r13), %rcx
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	movq	%r12, %r9
	call	output_expression
	cmpq	$0, 16(%r13)
	movq	%r12, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	je	.L1853
.L1866:
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC191(%rip), %rcx
	call	fwrite
	movq	16(%r13), %rcx
	movq	%r12, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_expression
.L1854:
	movq	%rdi, %rdx
	movq	%r12, %r8
	movq	%rbx, %rcx
	addq	$1, %rdi
	call	indention.constprop.7
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC176(%rip), %rcx
	call	fwrite
	testq	%rsi, %rsi
	jne	.L1855
	jmp	.L1847
	.p2align 4,,10
	.p2align 3
.L1857:
	movq	8(%rax), %rcx
	testq	%rcx, %rcx
	je	.L1847
.L1858:
	movq	%r12, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	output_statement
.L1855:
	movq	(%rsi), %rax
	testq	%rax, %rax
	je	.L1847
	movq	(%rax), %rdx
	movq	%rdx, (%rsi)
	testq	%rdx, %rdx
	jne	.L1857
	movq	8(%rax), %rcx
	movq	$0, 8(%rsi)
	testq	%rcx, %rcx
	jne	.L1858
.L1847:
	leaq	-48(%rbp), %rsp
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
.L1849:
	call	indention.constprop.6
	movl	$20, %r8d
	movl	$1, %edx
	movq	%rbx, %r9
	leaq	.LC189(%rip), %rcx
	call	fwrite
	cmpq	$0, 8(%r13)
	movq	%r12, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	jne	.L1865
.L1851:
	call	indention.constprop.6
	movl	$18, %r8d
	movl	$1, %edx
	movq	%rbx, %r9
	leaq	.LC190(%rip), %rcx
	call	fwrite
	cmpq	$0, 16(%r13)
	movq	%r12, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	jne	.L1866
.L1853:
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC192(%rip), %rcx
	call	fwrite
	jmp	.L1854
	.p2align 4,,10
	.p2align 3
.L1859:
	xorl	%esi, %esi
	jmp	.L1848
	.section .rdata,"dr"
.LC193:
	.ascii "else_if\12\0"
.LC194:
	.ascii "else_body\12\0"
	.text
	.p2align 4
	.def	output_if;	.scl	3;	.type	32;	.endef
output_if:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	movq	%rcx, %r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	movq	%r9, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$64, %rsp
	movq	8(%rcx), %r12
	movups	%xmm6, 64(%rsp)
	movq	%r8, 32(%rbp)
	testq	%r12, %r12
	je	.L1889
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%r12), %xmm2
	movq	16(%r13), %r12
	movq	%rax, %rdi
	movups	%xmm2, (%rax)
	testq	%r12, %r12
	je	.L1890
.L1914:
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%r12), %xmm3
	movq	%rax, %r14
	movups	%xmm3, (%rax)
.L1869:
	movq	24(%r13), %r12
	testq	%r12, %r12
	je	.L1891
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%r12), %xmm4
	movq	%rax, 40(%rsp)
	movups	%xmm4, 48(%rsp)
	movups	%xmm4, (%rax)
.L1870:
	movq	32(%rbp), %rdx
	movq	%rsi, %r8
	movq	%rbx, %rcx
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC175(%rip), %rcx
	call	fwrite
	movq	32(%rbp), %rax
	movq	0(%r13), %rcx
	movq	%rsi, %r9
	movq	%rbx, %rdx
	leaq	1(%rax), %r12
	movq	%r12, %r8
	call	output_expression
	movq	32(%rbp), %rdx
	movq	%rsi, %r8
	movq	%rbx, %rcx
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC176(%rip), %rcx
	call	fwrite
	testq	%rdi, %rdi
	jne	.L1871
	jmp	.L1874
	.p2align 4,,10
	.p2align 3
.L1875:
	movq	8(%rax), %rcx
	testq	%rcx, %rcx
	je	.L1874
.L1876:
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_statement
.L1871:
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L1874
	movq	(%rax), %rdx
	movq	%rdx, (%rdi)
	testq	%rdx, %rdx
	jne	.L1875
	movq	8(%rax), %rcx
	movq	$0, 8(%rdi)
	testq	%rcx, %rcx
	jne	.L1876
	.p2align 4,,10
	.p2align 3
.L1874:
	movq	32(%rbp), %rdx
	movq	%rsi, %r8
	movq	%rbx, %rcx
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC193(%rip), %rcx
	call	fwrite
	testq	%r14, %r14
	je	.L1872
	movq	32(%rbp), %rax
	pxor	%xmm6, %xmm6
	leaq	2(%rax), %rdi
.L1873:
	movq	(%r14), %rax
	testq	%rax, %rax
	je	.L1872
.L1913:
	movq	(%rax), %rdx
	movq	%rdx, (%r14)
	testq	%rdx, %rdx
	je	.L1912
.L1885:
	movq	8(%rax), %r15
	testq	%r15, %r15
	je	.L1872
	movq	8(%r15), %rdx
	testq	%rdx, %rdx
	movq	%rdx, 48(%rsp)
	je	.L1879
	call	alloc_memory.constprop.0
	movq	48(%rsp), %rdx
	movq	%rsi, %r8
	movq	%rbx, %rcx
	movups	%xmm6, (%rax)
	movq	%rax, %r13
	movdqu	(%rdx), %xmm1
	movq	%r12, %rdx
	movups	%xmm1, (%rax)
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC175(%rip), %rcx
	call	fwrite
	movq	(%r15), %rcx
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	output_expression
	movq	%rsi, %r8
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.7
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC176(%rip), %rcx
	call	fwrite
	jmp	.L1880
	.p2align 4,,10
	.p2align 3
.L1883:
	movq	8(%rax), %rcx
	testq	%rcx, %rcx
	je	.L1873
.L1884:
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	output_statement
.L1880:
	movq	0(%r13), %rax
	testq	%rax, %rax
	je	.L1873
	movq	(%rax), %rdx
	movq	%rdx, 0(%r13)
	testq	%rdx, %rdx
	jne	.L1883
	movq	8(%rax), %rcx
	movq	$0, 8(%r13)
	testq	%rcx, %rcx
	jne	.L1884
	movq	(%r14), %rax
	testq	%rax, %rax
	jne	.L1913
	.p2align 4,,10
	.p2align 3
.L1872:
	movq	32(%rbp), %rdx
	movq	%rsi, %r8
	movq	%rbx, %rcx
	call	indention.constprop.7
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC194(%rip), %rcx
	call	fwrite
	cmpq	$0, 40(%rsp)
	jne	.L1878
	jmp	.L1867
	.p2align 4,,10
	.p2align 3
.L1887:
	movq	8(%rax), %rcx
	testq	%rcx, %rcx
	je	.L1867
.L1888:
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_statement
.L1878:
	movq	40(%rsp), %rdi
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L1867
	movq	(%rax), %rdx
	movq	%rdx, (%rdi)
	testq	%rdx, %rdx
	jne	.L1887
	movq	8(%rax), %rcx
	movq	$0, 8(%rdi)
	testq	%rcx, %rcx
	jne	.L1888
.L1867:
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
.L1912:
	movq	$0, 8(%r14)
	jmp	.L1885
	.p2align 4,,10
	.p2align 3
.L1879:
	movq	%rsi, %r8
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.6
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC175(%rip), %rcx
	call	fwrite
	movq	(%r15), %rcx
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	output_expression
	movq	%rsi, %r8
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	indention.constprop.7
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC176(%rip), %rcx
	call	fwrite
	jmp	.L1873
.L1891:
	movq	$0, 40(%rsp)
	jmp	.L1870
.L1889:
	movq	16(%r13), %r12
	xorl	%edi, %edi
	testq	%r12, %r12
	jne	.L1914
.L1890:
	xorl	%r14d, %r14d
	jmp	.L1869
	.section .rdata,"dr"
.LC195:
	.ascii "/\0"
	.align 8
.LC196:
	.ascii "Warning: Path component too long, truncating to %zu characters\12\0"
.LC197:
	.ascii ".\0"
.LC198:
	.ascii "..\0"
	.section	.text.unlikely,"x"
.LCOLDB199:
	.text
.LHOTB199:
	.p2align 4
	.def	normalize_path;	.scl	3;	.type	32;	.endef
normalize_path:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	movq	%rcx, %r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$320, %rsp
	movq	24(%rcx), %rcx
	call	strlen
	cmpb	$0, initialized(%rip)
	movq	%rax, %r12
	leaq	1(%rax), %rbx
	je	.L2047
.L1916:
	movq	%rbx, %rdx
	leaq	.LC132(%rip), %rcx
	xorl	%edi, %edi
	xorl	%r15d, %r15d
	call	create_string_check.part.0
	movq	24(%r13), %rdx
	movq	%rax, %rcx
	movq	%rax, %r14
	call	strcpy
	testq	%r12, %r12
	je	.L1917
	cmpb	$47, (%r14)
	je	.L2048
.L1917:
	leaq	64(%rsp), %rax
	movq	%r13, 16(%rbp)
	movq	%rdi, %r10
	movq	%r14, %r13
	movq	%r15, %rbx
	movq	%r12, %r14
	movq	%rax, %r12
	jmp	.L1956
	.p2align 4,,10
	.p2align 3
.L1926:
	cmpq	%rdi, %r14
	jb	.L2046
.L1956:
	movq	%rdi, %rdx
	addq	$1, %rdi
	cmpq	%r14, %rdx
	je	.L2049
	cmpb	$47, 0(%r13,%rdx)
	jne	.L1926
	cmpq	%rdx, %r10
	jnb	.L1927
.L1924:
	movq	%rdx, %rsi
	subq	%r10, %rsi
	cmpq	$255, %rsi
	ja	.L2050
.L1928:
	leaq	0(%r13,%r10), %rdx
	movq	%rsi, %r8
	movq	%r12, %rcx
	call	strncpy
	movb	$0, 64(%rsp,%rsi)
	cmpw	$46, (%r12)
	je	.L1927
	cmpw	$11822, (%r12)
	je	.L2051
.L1932:
	cmpb	$0, 64(%rsp)
	jne	.L2052
	.p2align 4,,10
	.p2align 3
.L1927:
	movq	%rdi, %r10
	jmp	.L1926
	.p2align 4,,10
	.p2align 3
.L2049:
	cmpq	%r14, %r10
	jb	.L1924
.L2046:
	movq	16(%rbp), %r13
	movq	%rbx, 0(%r13)
	testq	%r15, %r15
	je	.L1957
	movq	(%r15), %r15
	movl	$46, %edx
	movq	%r15, %rcx
	call	strrchr
	movq	%rax, %rsi
	cmpq	%rax, %r15
	je	.L1957
	testq	%rax, %rax
	je	.L1957
	movq	%rax, %rdx
	movq	%r15, %rcx
	subq	%r15, %rdx
	call	create_string_check.constprop.0
	movq	%rsi, %rcx
	movq	%rax, 16(%r13)
	call	strlen
	movq	%rsi, %rcx
	movq	%rax, %rdx
	call	create_string_check.constprop.0
.L1958:
	movq	%rax, 8(%r13)
	movzbl	initialized(%rip), %r14d
	testq	%rbx, %rbx
	je	.L1959
	movq	%rbx, %rsi
	xorl	%r12d, %r12d
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L1960:
	movq	(%rsi), %rcx
	addq	$1, %r12
	call	strlen
	movq	8(%rsi), %rsi
	addq	%rax, %rdi
	testq	%rsi, %rsi
	jne	.L1960
	leaq	1(%rdi), %rax
	addq	%r12, %rdi
	cmpq	$1, %r12
	cmovbe	%rax, %rdi
	testb	%r14b, %r14b
	je	.L2053
.L1965:
	testq	%rdi, %rdi
	je	.L2054
	movq	%rdi, %rdx
	leaq	.LC132(%rip), %rcx
	call	create_string_check.part.0
	movb	$0, (%rax)
	movq	(%rbx), %rdx
	movq	%rax, %rsi
	.p2align 4,,10
	.p2align 3
.L1968:
	movq	%rsi, %rcx
	call	strcat
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L1970
	movq	(%rbx), %rdx
	cmpb	$47, (%rdx)
	je	.L2055
.L1972:
	cmpb	$0, (%rsi)
	je	.L1968
	movq	%rsi, %rcx
	movq	%rdx, 56(%rsp)
	call	strlen
	movq	56(%rsp), %rdx
	cmpb	$47, -1(%rsi,%rax)
	je	.L1968
	movl	$47, %edx
	movw	%dx, (%rsi,%rax)
	movq	(%rbx), %rdx
	jmp	.L1968
	.p2align 4,,10
	.p2align 3
.L2050:
	movq	%r10, 56(%rsp)
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, %r8
	leaq	.LC196(%rip), %rdx
	movl	$255, %esi
	movq	%rax, %rcx
	call	fprintf
	movq	56(%rsp), %r10
	jmp	.L1928
	.p2align 4,,10
	.p2align 3
.L1957:
	movq	%r15, 16(%r13)
	xorl	%eax, %eax
	jmp	.L1958
	.p2align 4,,10
	.p2align 3
.L2055:
	cmpb	$0, 1(%rdx)
	je	.L1968
	jmp	.L1972
	.p2align 4,,10
	.p2align 3
.L1959:
	testb	%r14b, %r14b
	je	.L2056
.L1962:
	movl	$1, %edx
	leaq	.LC132(%rip), %rcx
	call	create_string_check.part.0
	movb	$0, (%rax)
	movq	%rax, %rsi
.L1970:
	movq	%rsi, %rcx
	call	strlen
	movq	%rsi, %rcx
	movq	%rax, %rdx
	call	create_string_check.constprop.0
	movq	%rax, 24(%r13)
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
.L2051:
	cmpb	$0, 2(%r12)
	jne	.L1932
	testq	%r15, %r15
	je	.L1935
	cmpq	%rbx, %r15
	je	.L1935
	movq	(%r15), %rax
	cmpb	$46, (%rax)
	je	.L2057
.L1977:
	movq	%rbx, %rax
	jmp	.L1937
	.p2align 4,,10
	.p2align 3
.L1979:
	movq	%rdx, %rax
.L1937:
	testq	%rax, %rax
	je	.L1927
	movq	8(%rax), %rdx
	cmpq	%r15, %rdx
	jne	.L1979
	movq	$0, 8(%rax)
	movq	%rax, %r15
	jmp	.L1927
	.p2align 4,,10
	.p2align 3
.L2047:
	call	init.part.0
	jmp	.L1916
	.p2align 4,,10
	.p2align 3
.L2053:
	call	init.part.0
	jmp	.L1965
	.p2align 4,,10
	.p2align 3
.L2048:
	call	alloc_memory.constprop.0
	cmpb	$0, initialized(%rip)
	movq	%rax, %r15
	je	.L2058
.L1918:
	movq	all_string_list(%rip), %rdx
	testq	%rdx, %rdx
	je	.L1919
	xorl	%eax, %eax
	jmp	.L1921
	.p2align 4,,10
	.p2align 3
.L1920:
	movq	16(%rdx), %rdx
	testq	%rdx, %rdx
	je	.L2059
.L1921:
	cmpq	$1, 8(%rdx)
	jne	.L1920
	movq	(%rdx), %rcx
	testq	%rcx, %rcx
	je	.L1920
	cmpb	$47, (%rcx)
	cmove	%rcx, %rax
	jmp	.L1920
	.p2align 4,,10
	.p2align 3
.L1935:
	testq	%rbx, %rbx
	jne	.L1927
	call	alloc_memory.constprop.0
	cmpb	$0, initialized(%rip)
	movq	%rax, %r15
	je	.L2060
.L1944:
	movq	all_string_list(%rip), %rax
	testq	%rax, %rax
	jne	.L1948
	jmp	.L1945
	.p2align 4,,10
	.p2align 3
.L1946:
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L2061
.L1948:
	cmpq	$2, 8(%rax)
	jne	.L1946
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L1946
	cmpb	$46, (%rdx)
	jne	.L1946
	cmpb	$46, 1(%rdx)
	cmove	%rdx, %rbx
	jmp	.L1946
	.p2align 4,,10
	.p2align 3
.L2052:
	call	alloc_memory.constprop.0
	cmpb	$0, initialized(%rip)
	movq	%rax, %r8
	je	.L2062
.L1950:
	movq	all_string_list(%rip), %r10
	testq	%r10, %r10
	je	.L1951
	xorl	%r11d, %r11d
	movq	%rbx, 56(%rsp)
	movq	%rdi, 48(%rsp)
	movq	%r11, %rbx
	movq	%r10, %rdi
	movq	%r8, 40(%rsp)
	movq	%r13, 32(%rsp)
	jmp	.L1953
	.p2align 4,,10
	.p2align 3
.L1952:
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L2063
.L1953:
	cmpq	8(%rdi), %rsi
	jne	.L1952
	movq	(%rdi), %r13
	testq	%r13, %r13
	je	.L1952
	movq	%rsi, %r8
	movq	%r12, %rdx
	movq	%r13, %rcx
	call	strncmp
	movq	16(%rdi), %rdi
	testl	%eax, %eax
	cmove	%r13, %rbx
	testq	%rdi, %rdi
	jne	.L1953
.L2063:
	movq	%rbx, %r11
	movq	48(%rsp), %rdi
	movq	56(%rsp), %rbx
	movq	40(%rsp), %r8
	movq	32(%rsp), %r13
	testq	%r11, %r11
	je	.L1951
.L1954:
	movq	%r11, (%r8)
	movq	$0, 8(%r8)
	testq	%r15, %r15
	je	.L1955
	movq	%r8, 8(%r15)
.L1955:
	movq	%r8, %r15
	testq	%rbx, %rbx
	jne	.L1927
	movq	%r8, %rbx
	movq	%r8, %r15
	jmp	.L1927
	.p2align 4,,10
	.p2align 3
.L2057:
	cmpb	$46, 1(%rax)
	jne	.L1977
	cmpb	$0, 2(%rax)
	jne	.L1977
	call	alloc_memory.constprop.0
	cmpb	$0, initialized(%rip)
	movq	%rax, %rsi
	je	.L2064
.L1938:
	movq	all_string_list(%rip), %rdx
	testq	%rdx, %rdx
	je	.L1939
	xorl	%eax, %eax
	jmp	.L1942
	.p2align 4,,10
	.p2align 3
.L1940:
	movq	16(%rdx), %rdx
	testq	%rdx, %rdx
	je	.L2065
.L1942:
	cmpq	$2, 8(%rdx)
	jne	.L1940
	movq	(%rdx), %rcx
	testq	%rcx, %rcx
	je	.L1940
	cmpb	$46, (%rcx)
	jne	.L1940
	movq	16(%rdx), %rdx
	cmpb	$46, 1(%rcx)
	cmove	%rcx, %rax
	testq	%rdx, %rdx
	jne	.L1942
	.p2align 4,,10
	.p2align 3
.L2065:
	testq	%rax, %rax
	je	.L1939
.L1943:
	movq	%rax, (%rsi)
	movq	$0, 8(%rsi)
	movq	%rsi, 8(%r15)
	movq	%rsi, %r15
	jmp	.L1927
.L2059:
	testq	%rax, %rax
	je	.L1919
.L1922:
	movq	%rax, (%r15)
	movl	$1, %edi
	movq	$0, 8(%r15)
	jmp	.L1917
.L1951:
	movq	%rsi, %rdx
	movq	%r12, %rcx
	movq	%r8, 56(%rsp)
	call	create_string_check.part.0
	movq	56(%rsp), %r8
	movq	%rax, %r11
	jmp	.L1954
.L2062:
	movq	%rax, 56(%rsp)
	call	init.part.0
	movq	56(%rsp), %r8
	jmp	.L1950
.L1939:
	movl	$2, %edx
	leaq	.LC198(%rip), %rcx
	call	create_string_check.part.0
	jmp	.L1943
.L1919:
	movl	$1, %edx
	leaq	.LC195(%rip), %rcx
	call	create_string_check.part.0
	jmp	.L1922
.L2064:
	call	init.part.0
	jmp	.L1938
.L2056:
	call	init.part.0
	jmp	.L1962
.L2058:
	call	init.part.0
	jmp	.L1918
.L2061:
	testq	%rbx, %rbx
	je	.L1945
.L1949:
	movq	%rbx, (%r15)
	movq	%r15, %rbx
	movq	$0, 8(%r15)
	jmp	.L1927
.L1945:
	movl	$2, %edx
	leaq	.LC198(%rip), %rcx
	call	create_string_check.part.0
	movq	%rax, %rbx
	jmp	.L1949
.L2060:
	call	init.part.0
	jmp	.L1944
.L2054:
	jmp	.L1966
	.section	.text.unlikely,"x"
	.def	normalize_path.cold;	.scl	3;	.type	32;	.endef
normalize_path.cold:
.L1966:
	movb	$0, 0
	ud2
	.text
	.section	.text.unlikely,"x"
.LCOLDE199:
	.text
.LHOTE199:
	.section .rdata,"dr"
	.align 8
.LC200:
	.ascii "[Lexer Error] at %s:%zu:%zu: Unterminated string literal\12\0"
.LC201:
	.ascii "\0\0"
	.align 8
.LC202:
	.ascii "[Lexer Error] at %s:%zu:%zu: Unterminated comment\12\0"
	.align 8
.LC203:
	.ascii "[Lexer Error] at %s:%zu:%zu: Unexpected character\12\0"
	.text
	.p2align 4
	.def	next_token;	.scl	3;	.type	32;	.endef
next_token:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	movl	%edx, %r13d
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$48, %rsp
	andq	$-16, %rsp
	subq	$48, %rsp
	movq	16(%rcx), %r14
	movq	24(%rcx), %rdx
	movq	40(%rcx), %r12
	movups	%xmm6, 48(%rsp)
	movups	%xmm7, 64(%rsp)
	movups	%xmm8, 80(%rsp)
	cmpq	%rdx, %r14
	jnb	.L2067
	leaq	1(%r12), %rsi
	leaq	1(%r14), %rdi
	movq	%rsi, 40(%rcx)
	movq	8(%rcx), %rcx
	movq	%rdi, 16(%rbx)
	leaq	(%rcx,%r14), %r9
	movzbl	(%r9), %eax
	cmpb	$32, %al
	ja	.L2068
	leaq	.L2070(%rip), %r10
	movzbl	%al, %r8d
	movslq	(%r10,%r8,4), %r8
	addq	%r10, %r8
	jmp	*%r8
	.section .rdata,"dr"
	.align 4
.L2070:
	.long	.L2173-.L2070
	.long	.L2068-.L2070
	.long	.L2068-.L2070
	.long	.L2068-.L2070
	.long	.L2068-.L2070
	.long	.L2068-.L2070
	.long	.L2068-.L2070
	.long	.L2068-.L2070
	.long	.L2068-.L2070
	.long	.L2288-.L2070
	.long	.L2071-.L2070
	.long	.L2068-.L2070
	.long	.L2068-.L2070
	.long	.L2288-.L2070
	.long	.L2068-.L2070
	.long	.L2068-.L2070
	.long	.L2068-.L2070
	.long	.L2068-.L2070
	.long	.L2068-.L2070
	.long	.L2068-.L2070
	.long	.L2068-.L2070
	.long	.L2068-.L2070
	.long	.L2068-.L2070
	.long	.L2068-.L2070
	.long	.L2068-.L2070
	.long	.L2068-.L2070
	.long	.L2068-.L2070
	.long	.L2068-.L2070
	.long	.L2068-.L2070
	.long	.L2068-.L2070
	.long	.L2068-.L2070
	.long	.L2068-.L2070
	.long	.L2288-.L2070
	.text
	.p2align 4,,10
	.p2align 3
.L2173:
	movq	%rsi, %r12
	.p2align 4,,10
	.p2align 3
.L2067:
	movq	32(%rbx), %xmm6
	movq	%r12, %xmm1
	punpcklqdq	%xmm1, %xmm6
	call	alloc_memory.constprop.1
	movl	$0, 24(%rax)
	movq	$0, (%rax)
	movups	%xmm6, 8(%rax)
.L2066:
	movups	48(%rsp), %xmm6
	movups	64(%rsp), %xmm7
	movups	80(%rsp), %xmm8
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
.L2071:
	addq	$1, 32(%rbx)
	movq	$0, 40(%rbx)
.L2288:
	movups	48(%rsp), %xmm6
	movups	64(%rsp), %xmm7
	movsbl	%r13b, %edx
	movq	%rbx, %rcx
	movups	80(%rsp), %xmm8
	leaq	-56(%rbp), %rsp
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
.L2068:
	cmpb	$90, %al
	jg	.L2073
	cmpb	$64, %al
	jg	.L2074
	cmpb	$34, %al
	je	.L2075
	leal	-48(%rax), %r8d
	cmpb	$9, %r8b
	ja	.L2076
	leaq	(%rdx,%r12), %r11
	subq	%r14, %r11
	jmp	.L2077
	.p2align 4,,10
	.p2align 3
.L2291:
	leal	-48(%rax), %r10d
	leaq	1(%rdi), %r8
	cmpb	$9, %r10b
	ja	.L2090
	addq	$1, %rsi
	movq	%r8, 16(%rbx)
	movq	%r8, %rdi
	movq	%rsi, 40(%rbx)
	movzbl	-1(%rcx,%r8), %eax
.L2077:
	cmpq	%rsi, %r11
	jne	.L2291
	leal	-48(%rax), %r8d
	cmpb	$9, %r8b
	ja	.L2090
.L2177:
	movl	$2, %r13d
.L2091:
	leaq	-1(%rdi), %rdx
	subq	$1, %rsi
	movq	%r12, %xmm2
	movq	%r9, %rcx
	movq	%rdx, 16(%rbx)
	movq	32(%rbx), %xmm6
	subq	%r14, %rdx
	movq	%rsi, 40(%rbx)
	punpcklqdq	%xmm2, %xmm6
	call	create_string_check.constprop.0
	movq	%rax, %rbx
	call	alloc_memory.constprop.1
	movl	%r13d, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L2066
	.p2align 4,,10
	.p2align 3
.L2073:
	cmpb	$95, %al
	jne	.L2292
.L2074:
	movabsq	$288230372997595135, %r8
	addq	%r12, %rdx
	subq	%r14, %rdx
	jmp	.L2079
	.p2align 4,,10
	.p2align 3
.L2294:
	cmpb	$57, %al
	jle	.L2293
	subl	$65, %eax
	cmpb	$57, %al
	ja	.L2080
	btq	%rax, %r8
	jnc	.L2080
.L2082:
	addq	$1, %rdi
	addq	$1, %rsi
	movq	%rsi, 40(%rbx)
	movq	%rdi, 16(%rbx)
	movzbl	-1(%rcx,%rdi), %eax
.L2079:
	cmpq	%rsi, %rdx
	jne	.L2294
.L2080:
	subq	$1, %rsi
	leaq	-1(%rdi), %rdx
	movq	%r9, %rcx
	movq	%rdx, 16(%rbx)
	subq	%r14, %rdx
	movq	%rsi, 40(%rbx)
	call	create_string_check.constprop.0
	cmpb	$0, initialized(%rip)
	movq	%rax, %rsi
	je	.L2295
.L2084:
	leaq	keywordList(%rip), %rax
	leaq	176(%rax), %rdx
	jmp	.L2086
	.p2align 4,,10
	.p2align 3
.L2297:
	addq	$8, %rax
	cmpq	%rdx, %rax
	je	.L2296
.L2086:
	cmpq	(%rax), %rsi
	jne	.L2297
	movq	32(%rbx), %xmm6
	movq	%r12, %xmm4
	punpcklqdq	%xmm4, %xmm6
	call	alloc_memory.constprop.1
	movl	$6, 24(%rax)
	movq	%rsi, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L2066
	.p2align 4,,10
	.p2align 3
.L2293:
	cmpb	$47, %al
	jg	.L2082
	jmp	.L2080
	.p2align 4,,10
	.p2align 3
.L2075:
	xorl	%r13d, %r13d
	cmpq	%rdx, %rdi
	jnb	.L2094
	leaq	2(%r12), %rax
	movq	%rax, 40(%rbx)
	leaq	2(%r14), %rax
	movq	%rax, 16(%rbx)
	movzbl	1(%rcx,%r14), %r13d
.L2094:
	movabsq	$-17179870210, %r9
	jmp	.L2095
	.p2align 4,,10
	.p2align 3
.L2299:
	leaq	1(%rax), %r8
	addq	$1, 40(%rbx)
	movq	%r8, 16(%rbx)
	movzbl	(%rcx,%rax), %r13d
.L2095:
	cmpb	$34, %r13b
	jbe	.L2298
.L2097:
	movq	16(%rbx), %rax
	cmpq	%rdx, %rax
	jb	.L2299
	xorl	%r13d, %r13d
.L2096:
	movq	32(%rbx), %rsi
	cmpb	$34, %r13b
	je	.L2098
	movq	(%rbx), %r14
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	leaq	1(%rsi), %r9
	leaq	.LC200(%rip), %rdx
	movq	%rax, %rcx
	movq	%r14, %r8
	call	fprintf
	cmpb	$10, %r13b
	je	.L2099
	movq	32(%rbx), %rsi
.L2098:
	movq	16(%rbx), %rdx
	movq	%rsi, %xmm6
	movq	%r12, %xmm3
	punpcklqdq	%xmm3, %xmm6
	subq	%rdi, %rdx
	cmpq	$1, %rdx
	je	.L2300
	addq	8(%rbx), %rdi
	subq	$1, %rdx
	movq	%rdi, %rcx
	call	create_string_check.constprop.0
.L2286:
	movq	%rax, %rbx
.L2105:
	call	alloc_memory.constprop.1
	movl	$4, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L2066
	.p2align 4,,10
	.p2align 3
.L2292:
	leal	-97(%rax), %r8d
	cmpb	$25, %r8b
	jbe	.L2074
	cmpq	%rdx, %rdi
	jnb	.L2301
	movzbl	1(%rcx,%r14), %r9d
	xorl	%r10d, %r10d
.L2114:
	movq	32(%rbx), %xmm6
	movq	%r12, %xmm7
	cmpb	$61, %r9b
	sete	%r8b
	movdqa	%xmm6, %xmm8
	movl	%r8d, %ecx
	punpcklqdq	%xmm7, %xmm8
	movdqa	%xmm8, %xmm7
	cmpb	$61, %al
	jne	.L2165
	testb	%r8b, %r8b
	je	.L2165
	addq	$2, %r12
	addq	$2, %r14
	movq	%r12, 40(%rbx)
	movq	%r14, 16(%rbx)
	movq	152+symbolList(%rip), %rbx
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm8, 8(%rax)
	jmp	.L2066
	.p2align 4,,10
	.p2align 3
.L2295:
	call	init.part.0
	jmp	.L2084
	.p2align 4,,10
	.p2align 3
.L2298:
	btq	%r13, %r9
	jc	.L2097
	jmp	.L2096
	.p2align 4,,10
	.p2align 3
.L2296:
	movq	32(%rbx), %xmm6
	movq	%r12, %xmm5
	punpcklqdq	%xmm5, %xmm6
	call	alloc_memory.constprop.1
	movl	$1, 24(%rax)
	movq	%rsi, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L2066
.L2076:
	cmpb	$47, %al
	sete	%r8b
	movl	%r8d, %r10d
	cmpq	%rdx, %rdi
	jnb	.L2171
	movzbl	1(%rcx,%r14), %r9d
	cmpb	$47, %r9b
	jne	.L2108
	testb	%r8b, %r8b
	je	.L2108
	addq	%r12, %rdx
	movl	$47, %r8d
	subq	%r14, %rdx
	jmp	.L2109
	.p2align 4,,10
	.p2align 3
.L2302:
	leaq	1(%rsi), %r9
	leaq	1(%rdi), %rax
	testb	%r8b, %r8b
	je	.L2110
	cmpb	$10, %r8b
	je	.L2110
	movq	%r9, 40(%rbx)
	movq	%rax, %rdi
	movq	%r9, %rsi
	movq	%rax, 16(%rbx)
	movzbl	-1(%rcx,%rax), %r8d
.L2109:
	cmpq	%rdx, %rsi
	jne	.L2302
.L2110:
	leaq	-1(%rdi), %rdx
	subq	$1, %rsi
	movq	%rdx, 16(%rbx)
	movq	%rsi, 40(%rbx)
	testb	%r13b, %r13b
	jne	.L2288
	movq	32(%rbx), %xmm6
	addq	$2, %r14
	movq	%r12, %xmm0
	subq	%r14, %rdx
	addq	%r14, %rcx
	punpcklqdq	%xmm0, %xmm6
.L2287:
	call	create_string_check.constprop.0
	movq	%rax, %rbx
	call	alloc_memory.constprop.1
	movl	$7, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L2066
.L2300:
	cmpb	$0, initialized(%rip)
	je	.L2303
.L2101:
	movq	all_string_list(%rip), %rax
	testq	%rax, %rax
	je	.L2102
	xorl	%ebx, %ebx
	jmp	.L2104
	.p2align 4,,10
	.p2align 3
.L2103:
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L2304
.L2104:
	cmpq	$1, 8(%rax)
	jne	.L2103
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L2103
	cmpb	$0, (%rdx)
	cmove	%rdx, %rbx
	jmp	.L2103
.L2304:
	testq	%rbx, %rbx
	jne	.L2105
.L2102:
	movl	$1, %edx
	leaq	.LC201(%rip), %rcx
	call	create_string_check.part.0
	jmp	.L2286
.L2099:
	movq	32(%rbx), %rax
	movq	$0, 40(%rbx)
	leaq	1(%rax), %rsi
	movq	%rsi, 32(%rbx)
	jmp	.L2098
.L2301:
	xorl	%r10d, %r10d
.L2171:
	movq	32(%rbx), %xmm6
	movq	%r12, %xmm0
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	movdqa	%xmm6, %xmm7
	punpcklqdq	%xmm0, %xmm7
.L2107:
	cmpb	$43, %al
	jne	.L2129
	testb	%cl, %cl
	je	.L2129
	cmpq	%rdx, %rdi
	jnb	.L2130
	addq	$2, %r12
	addq	$2, %r14
	movq	%r12, 40(%rbx)
	movq	%r14, 16(%rbx)
.L2130:
	movq	40(%rbx), %rax
	movq	184+symbolList(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm6
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L2066
.L2303:
	call	init.part.0
	jmp	.L2101
.L2129:
	cmpb	$45, %al
	jne	.L2131
	testb	%cl, %cl
	je	.L2131
	cmpq	%rdx, %rdi
	jnb	.L2132
	addq	$2, %r12
	addq	$2, %r14
	movq	%r12, 40(%rbx)
	movq	%r14, 16(%rbx)
.L2132:
	movq	40(%rbx), %rax
	movq	192+symbolList(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm6
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L2066
.L2108:
	cmpb	$42, %r9b
	jne	.L2114
	testb	%r8b, %r8b
	je	.L2114
	leaq	2(%r14), %rsi
	movl	$42, %r8d
	movl	$47, %eax
	.p2align 4,,10
	.p2align 3
.L2115:
	cmpb	$42, %al
	jne	.L2248
	cmpb	$47, %r8b
	je	.L2305
.L2248:
	cmpq	%rdi, %rdx
	je	.L2116
	addq	$1, %rdi
	addq	$1, 40(%rbx)
	movq	%rdi, 16(%rbx)
	movzbl	-1(%rcx,%rdi), %eax
	cmpq	%rdx, %rdi
	jnb	.L2306
	movzbl	(%rcx,%rdi), %r8d
	cmpb	$10, %al
	jne	.L2120
	addq	$1, 32(%rbx)
	movq	$0, 40(%rbx)
	testb	%r8b, %r8b
	jne	.L2248
	jmp	.L2285
	.p2align 4,,10
	.p2align 3
.L2120:
	testb	%r8b, %r8b
	je	.L2118
	testb	%al, %al
	jne	.L2115
	movq	32(%rbx), %rax
	addq	$3, %r14
	movl	$2, %ecx
	movq	(%rbx), %r15
	leaq	1(%rax), %rdi
	call	*__imp___acrt_iob_func(%rip)
	movq	%r14, 32(%rsp)
	movq	%rdi, %r9
	movq	%rax, %rcx
.L2290:
	movq	%r15, %r8
	leaq	.LC202(%rip), %rdx
	call	fprintf
	testb	%r13b, %r13b
	jne	.L2288
	movq	32(%rbx), %xmm6
	movq	16(%rbx), %rdx
	movq	%r12, %xmm0
	movq	8(%rbx), %rcx
	punpcklqdq	%xmm0, %xmm6
	subq	%rsi, %rdx
	addq	%rsi, %rcx
	jmp	.L2287
	.p2align 4,,10
	.p2align 3
.L2306:
	cmpb	$10, %al
	jne	.L2118
	movq	32(%rbx), %rax
	movq	$0, 40(%rbx)
	leaq	1(%rax), %rdi
	movq	%rdi, 32(%rbx)
.L2119:
	movl	$2, %ecx
	movq	(%rbx), %r15
	addq	$3, %r14
	call	*__imp___acrt_iob_func(%rip)
	movq	%r14, 32(%rsp)
	leaq	1(%rdi), %r9
	movq	%rax, %rcx
	jmp	.L2290
.L2305:
	movq	16(%rbx), %rax
	cmpq	%rdx, %rax
	jnb	.L2169
	addq	$1, %rax
	addq	$1, 40(%rbx)
	movq	%rax, 16(%rbx)
.L2169:
	testb	%r13b, %r13b
	jne	.L2288
	movq	32(%rbx), %xmm6
	movq	%r12, %xmm0
	subq	%rsi, %rax
	addq	%rsi, %rcx
	leaq	-2(%rax), %rdx
	punpcklqdq	%xmm0, %xmm6
	jmp	.L2287
.L2118:
	testb	%al, %al
	jne	.L2285
.L2116:
	subq	$1, 16(%rbx)
	subq	$1, 40(%rbx)
.L2285:
	movq	32(%rbx), %rdi
	jmp	.L2119
.L2131:
	cmpb	$42, %al
	jne	.L2133
	testb	%cl, %cl
	je	.L2135
	cmpq	%rdx, %rdi
	jnb	.L2134
	addq	$2, %r12
	addq	$2, %r14
	movq	%r12, 40(%rbx)
	movq	%r14, 16(%rbx)
.L2134:
	movq	40(%rbx), %rax
	movq	200+symbolList(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm6
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L2066
.L2135:
	cmpb	$37, %al
	jne	.L2137
	testb	%cl, %cl
	je	.L2137
	cmpq	%rdx, %rdi
	jnb	.L2138
	addq	$2, %r12
	addq	$2, %r14
	movq	%r12, 40(%rbx)
	movq	%r14, 16(%rbx)
.L2138:
	movq	40(%rbx), %rax
	movq	216+symbolList(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm6
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L2066
.L2137:
	cmpb	$38, %al
	jne	.L2139
	cmpb	$38, %r9b
	jne	.L2139
	cmpq	%rdx, %rdi
	jnb	.L2140
	addq	$2, %r12
	addq	$2, %r14
	movq	%r12, 40(%rbx)
	movq	%r14, 16(%rbx)
.L2140:
	movq	40(%rbx), %rax
	movq	224+symbolList(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm6
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L2066
.L2133:
	testb	%cl, %cl
	je	.L2135
	testb	%r10b, %r10b
	je	.L2135
	cmpq	%rdx, %rdi
	jnb	.L2136
	addq	$2, %r12
	addq	$2, %r14
	movq	%r12, 40(%rbx)
	movq	%r14, 16(%rbx)
.L2136:
	movq	40(%rbx), %rax
	movq	208+symbolList(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm6
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L2066
.L2139:
	cmpb	$124, %al
	jne	.L2141
	cmpb	$124, %r9b
	jne	.L2141
	cmpq	%rdx, %rdi
	jnb	.L2142
	addq	$2, %r12
	addq	$2, %r14
	movq	%r12, 40(%rbx)
	movq	%r14, 16(%rbx)
.L2142:
	movq	40(%rbx), %rax
	movq	232+symbolList(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm6
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L2066
.L2141:
	subl	$33, %eax
	cmpb	$92, %al
	ja	.L2143
	leaq	.L2145(%rip), %rdx
	movzbl	%al, %eax
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L2145:
	.long	.L2162-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2161-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2160-.L2145
	.long	.L2159-.L2145
	.long	.L2158-.L2145
	.long	.L2157-.L2145
	.long	.L2156-.L2145
	.long	.L2155-.L2145
	.long	.L2154-.L2145
	.long	.L2153-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2152-.L2145
	.long	.L2151-.L2145
	.long	.L2150-.L2145
	.long	.L2149-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2148-.L2145
	.long	.L2143-.L2145
	.long	.L2147-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2143-.L2145
	.long	.L2146-.L2145
	.long	.L2143-.L2145
	.long	.L2144-.L2145
	.text
.L2090:
	cmpq	%rdx, %rdi
	jnb	.L2177
	cmpb	$46, %al
	jne	.L2177
	leaq	(%rcx,%rdi), %r8
	movzbl	(%r8), %eax
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L2177
	leaq	1(%rsi), %r10
	leaq	1(%rdi), %r11
	addq	%rsi, %rdx
	movq	%r10, 40(%rbx)
	subq	%rdi, %rdx
	movq	%r10, %rsi
	movq	%r11, %rdi
	movq	%r11, 16(%rbx)
	movzbl	(%r8), %eax
	jmp	.L2092
	.p2align 4,,10
	.p2align 3
.L2307:
	subl	$48, %eax
	leaq	1(%rdi), %r8
	cmpb	$9, %al
	ja	.L2178
	addq	$1, %rsi
	movq	%r8, 16(%rbx)
	movq	%r8, %rdi
	movq	%rsi, 40(%rbx)
	movzbl	-1(%rcx,%r8), %eax
.L2092:
	cmpq	%rsi, %rdx
	jne	.L2307
.L2178:
	movl	$3, %r13d
	jmp	.L2091
.L2144:
	movq	24+symbolList(%rip), %rbx
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm7, 8(%rax)
	jmp	.L2066
.L2146:
	movq	16+symbolList(%rip), %rbx
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm7, 8(%rax)
	jmp	.L2066
.L2147:
	movq	64+symbolList(%rip), %rbx
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm7, 8(%rax)
	jmp	.L2066
.L2148:
	movq	56+symbolList(%rip), %rbx
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm7, 8(%rax)
	jmp	.L2066
.L2149:
	movq	136+symbolList(%rip), %rbx
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm7, 8(%rax)
	jmp	.L2066
.L2150:
	movq	144+symbolList(%rip), %rbx
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm7, 8(%rax)
	jmp	.L2066
.L2151:
	movq	128+symbolList(%rip), %rbx
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm7, 8(%rax)
	jmp	.L2066
.L2152:
	movq	72+symbolList(%rip), %rbx
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm7, 8(%rax)
	jmp	.L2066
.L2153:
	movq	112+symbolList(%rip), %rbx
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm7, 8(%rax)
	jmp	.L2066
.L2154:
	movq	48+symbolList(%rip), %rbx
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm7, 8(%rax)
	jmp	.L2066
.L2155:
	movq	96+symbolList(%rip), %rbx
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm7, 8(%rax)
	jmp	.L2066
.L2156:
	movq	32+symbolList(%rip), %rbx
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm7, 8(%rax)
	jmp	.L2066
.L2157:
	movq	88+symbolList(%rip), %rbx
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm7, 8(%rax)
	jmp	.L2066
.L2158:
	movq	104+symbolList(%rip), %rbx
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm7, 8(%rax)
	jmp	.L2066
.L2159:
	movq	8+symbolList(%rip), %rbx
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm7, 8(%rax)
	jmp	.L2066
.L2160:
	movq	symbolList(%rip), %rbx
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm7, 8(%rax)
	jmp	.L2066
.L2161:
	movq	120+symbolList(%rip), %rbx
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm7, 8(%rax)
	jmp	.L2066
.L2162:
	movq	40+symbolList(%rip), %rbx
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm7, 8(%rax)
	jmp	.L2066
.L2143:
	movq	(%rbx), %rbx
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	leaq	.LC203(%rip), %rdx
	movq	%rax, %rcx
	movq	%xmm6, %rax
	movq	%rbx, %r8
	leaq	1(%rax), %r9
	call	fprintf
	call	alloc_memory.constprop.1
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	pxor	%xmm0, %xmm0
	movl	%edx, 24(%rax)
	movq	%rcx, (%rax)
	movups	%xmm0, 8(%rax)
	jmp	.L2066
.L2165:
	cmpb	$33, %al
	jne	.L2127
	testb	%r8b, %r8b
	jne	.L2308
.L2127:
	cmpb	$60, %al
	jne	.L2168
	testb	%r8b, %r8b
	je	.L2168
	addq	$2, %r12
	addq	$2, %r14
	movq	%r12, 40(%rbx)
	movq	%r14, 16(%rbx)
	movq	168+symbolList(%rip), %rbx
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm8, 8(%rax)
	jmp	.L2066
.L2308:
	addq	$2, %r12
	addq	$2, %r14
	movq	%r12, 40(%rbx)
	movq	%r14, 16(%rbx)
	movq	160+symbolList(%rip), %rbx
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm8, 8(%rax)
	jmp	.L2066
.L2168:
	cmpb	$62, %al
	jne	.L2107
	testb	%r8b, %r8b
	je	.L2107
	cmpq	%rdx, %rdi
	jnb	.L2128
	addq	$2, %r12
	addq	$2, %r14
	movq	%r12, 40(%rbx)
	movq	%r14, 16(%rbx)
.L2128:
	movq	40(%rbx), %rax
	movq	176+symbolList(%rip), %rbx
	subq	$2, %rax
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm6
	call	alloc_memory.constprop.1
	movl	$5, 24(%rax)
	movq	%rbx, (%rax)
	movups	%xmm6, 8(%rax)
	jmp	.L2066
	.section .rdata,"dr"
	.align 8
.LC204:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse parenthesized expression\12\0"
	.align 8
.LC205:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after expression\12\0"
	.align 8
.LC206:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '!'\12\0"
	.align 8
.LC207:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '-'\12\0"
	.align 8
.LC208:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot call undefined variable\12\0"
	.align 8
.LC209:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot call non-function variable\12\0"
	.align 8
.LC210:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function call argument\12\0"
	.align 8
.LC211:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function call argument\12\0"
	.align 8
.LC212:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse sequence index\12\0"
	.align 8
.LC213:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ']' after sequence index\12\0"
	.align 8
.LC214:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot access attribute without a valid scope\12\0"
	.align 8
.LC215:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected attribute name after '.'\12\0"
	.align 8
.LC216:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown attribute name\12\0"
	.align 8
.LC217:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse variable access\12\0"
	.align 8
.LC218:
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
	je	.L2489
	cmpl	$3, %eax
	je	.L2490
	cmpl	$4, %eax
	je	.L2491
	movq	%rcx, %rsi
	movq	%r8, %rbx
	cmpl	$6, %eax
	je	.L2492
	cmpl	$5, %eax
	je	.L2316
	cmpl	$1, %eax
	je	.L2493
.L2317:
	movq	16(%rdi), %rax
	movq	8(%rdi), %rsi
	movl	$2, %ecx
	leaq	1(%rax), %r12
	movq	(%rbx), %rax
	addq	$1, %rsi
	movq	24(%rax), %rbx
	call	*__imp___acrt_iob_func(%rip)
	movq	%r12, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC218(%rip), %rdx
	movq	%rax, %rcx
	movq	%rbx, %r8
	call	fprintf
	xorl	%eax, %eax
	jmp	.L2309
	.p2align 4,,10
	.p2align 3
.L2490:
	movl	$-5, 64(%rsp)
	movq	(%rdi), %r13
	xorl	%r12d, %r12d
	xorl	%esi, %esi
	movl	$1, %edi
	xorl	%r15d, %r15d
	movl	$1, %r14d
	movq	$0, 72(%rsp)
	movq	$0, 56(%rsp)
.L2311:
	cmpb	$0, initialized(%rip)
	je	.L2494
.L2399:
	movq	struct_memory(%rip), %rcx
	movq	8(%rcx), %rbx
	leaq	16(%rbx), %rax
	cmpq	(%rcx), %rax
	jnb	.L2495
.L2400:
	testb	$7, %bl
	jne	.L2496
	movq	%rbx, %rax
	addq	$16, %rbx
	addq	$1, memoryBlockCount(%rip)
	andq	$-8, %rax
	addq	24(%rcx), %rax
	movq	%rbx, 8(%rcx)
	movl	%r14d, 8(%rax)
	testq	%r13, %r13
	je	.L2402
	testb	%dil, %dil
	je	.L2402
	movq	%r13, (%rax)
.L2309:
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
.L2402:
	testq	%r15, %r15
	je	.L2404
	testb	%sil, %sil
	je	.L2404
	movq	%r15, (%rax)
	jmp	.L2309
	.p2align 4,,10
	.p2align 3
.L2489:
	xorl	%r12d, %r12d
	xorl	%esi, %esi
	xorl	%r15d, %r15d
	xorl	%r14d, %r14d
	cmpb	$0, initialized(%rip)
	movq	(%rdi), %r13
	movl	$-6, 64(%rsp)
	movl	$1, %edi
	movq	$0, 72(%rsp)
	movq	$0, 56(%rsp)
	jne	.L2399
.L2494:
	call	init.part.0
	jmp	.L2399
	.p2align 4,,10
	.p2align 3
.L2495:
	movl	$1, %ecx
	call	increase_memory_size
	movq	struct_memory(%rip), %rcx
	movq	8(%rcx), %rbx
	jmp	.L2400
	.p2align 4,,10
	.p2align 3
.L2404:
	cmpl	$1, 64(%rsp)
	jbe	.L2497
	movq	72(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L2406
	testb	%r12b, %r12b
	je	.L2406
.L2488:
	movq	%rdi, (%rax)
	jmp	.L2309
	.p2align 4,,10
	.p2align 3
.L2492:
	movq	(%rdi), %rcx
	movq	88+keywordList(%rip), %r13
	cmpq	%r13, %rcx
	je	.L2409
	movq	96+keywordList(%rip), %r13
	cmpq	%r13, %rcx
	je	.L2498
	cmpq	40+keywordList(%rip), %rcx
	jne	.L2317
	cmpb	$0, 9(%r8)
	je	.L2317
.L2318:
	cmpq	$0, 24(%rbp)
	je	.L2414
	movq	24(%rbp), %rdx
.L2336:
	movq	8(%rdx), %rax
	jmp	.L2485
	.p2align 4,,10
	.p2align 3
.L2499:
	movq	8(%rax), %r12
	cmpq	%rcx, 8(%r12)
	je	.L2333
.L2485:
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L2499
	movq	(%rdx), %rdx
	testq	%rdx, %rdx
	jne	.L2336
.L2414:
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L2333:
	movq	$0, 32(%rsp)
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%r12, %r8
	call	create_variable_access
	movq	%rax, 72(%rsp)
	movq	48(%rsi), %rax
	testq	%rax, %rax
	je	.L2500
.L2337:
	cmpl	$5, 24(%rax)
	jne	.L2338
	xorl	%r14d, %r14d
	xorl	%r13d, %r13d
	.p2align 4,,10
	.p2align 3
.L2398:
	testq	%r12, %r12
	je	.L2339
	movq	(%r12), %r14
	testq	%r14, %r14
	cmove	%r12, %r14
.L2339:
	testq	%r13, %r13
	jne	.L2340
	testq	%r14, %r14
	je	.L2340
	movl	32(%r14), %r9d
	testl	%r9d, %r9d
	jne	.L2340
	movq	24(%r14), %rdx
	movq	16(%rdx), %r13
.L2340:
	leaq	symbolList(%rip), %rdx
	movq	(%rax), %rax
	cmpq	(%rdx), %rax
	je	.L2501
	cmpq	56+symbolList(%rip), %rax
	jne	.L2371
	movq	48(%rsi), %rax
	testq	%rax, %rax
	je	.L2372
	movq	%rax, 80(%rsi)
	movq	56(%rsi), %rax
	movdqu	64(%rsi), %xmm2
	movq	$0, 48(%rsi)
	movq	%rax, 16(%rsi)
	movups	%xmm2, 32(%rsi)
.L2373:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	next_token
	movq	%rax, 80(%rsi)
	movq	%rax, %r9
.L2374:
	movq	24(%rbp), %rdx
	movq	%rbx, %r8
	movq	%rsi, %rcx
	movq	%r9, 64(%rsp)
	call	parse_expression
	movq	64(%rsp), %r9
	testq	%rax, %rax
	movq	%rax, %r15
	je	.L2502
.L2375:
	movq	48(%rsi), %rax
	testq	%rax, %rax
	je	.L2376
	movq	56(%rsi), %rdx
	movdqu	64(%rsi), %xmm4
	movq	%rax, 80(%rsi)
	movq	$0, 48(%rsi)
	movq	%rdx, 16(%rsi)
	movups	%xmm4, 32(%rsi)
.L2377:
	cmpl	$5, 24(%rax)
	jne	.L2378
	movq	64+symbolList(%rip), %rdx
	cmpq	%rdx, (%rax)
	jne	.L2378
	movq	72(%rsp), %rdx
	movq	%r15, %r9
	xorl	%r8d, %r8d
	movl	$3, %ecx
	movq	$0, 32(%rsp)
	call	create_variable_access
	movq	%rax, 72(%rsp)
.L2370:
	movq	48(%rsi), %rax
	testq	%rax, %rax
	je	.L2503
	cmpl	$5, 24(%rax)
	je	.L2398
.L2338:
	cmpq	$0, 72(%rsp)
	je	.L2504
	movl	$2, 64(%rsp)
	xorl	%esi, %esi
	xorl	%edi, %edi
	xorl	%r15d, %r15d
	movl	$1, %r12d
	xorl	%r13d, %r13d
	movl	$8, %r14d
	movq	$0, 56(%rsp)
	jmp	.L2311
	.p2align 4,,10
	.p2align 3
.L2497:
	movq	56(%rsp), %rdi
	testq	%rdi, %rdi
	jne	.L2488
.L2406:
	movq	72(%rsp), %r12
	movq	56(%rsp), %rax
	movl	$2, %ecx
	orq	%rax, %r12
	orq	%r12, %r15
	orq	%r13, %r15
	jne	.L2407
	call	*__imp___acrt_iob_func(%rip)
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC135(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L2309
	.p2align 4,,10
	.p2align 3
.L2491:
	movq	(%rdi), %r13
	movl	$-4, 64(%rsp)
	xorl	%r12d, %r12d
	xorl	%esi, %esi
	movl	$1, %edi
	xorl	%r15d, %r15d
	movl	$2, %r14d
	movq	$0, 72(%rsp)
	movq	$0, 56(%rsp)
	jmp	.L2311
	.p2align 4,,10
	.p2align 3
.L2316:
	movq	(%rdi), %rax
	cmpq	symbolList(%rip), %rax
	je	.L2505
	cmpq	40+symbolList(%rip), %rax
	je	.L2506
	cmpq	96+symbolList(%rip), %rax
	jne	.L2317
	movq	48(%rcx), %r12
	testq	%r12, %r12
	je	.L2331
	movq	56(%rcx), %rax
	movdqu	64(%rcx), %xmm4
	movq	%r12, 80(%rcx)
	movq	$0, 48(%rcx)
	movq	%rax, 16(%rcx)
	movups	%xmm4, 32(%rcx)
.L2332:
	movq	24(%rbp), %rdx
	movq	%rbx, %r8
	movq	%rsi, %rcx
	call	parse_primary
	movq	%rax, 56(%rsp)
	testq	%rax, %rax
	je	.L2507
	movl	$1, 64(%rsp)
	xorl	%r12d, %r12d
	xorl	%esi, %esi
	xorl	%edi, %edi
	movq	$0, 72(%rsp)
	xorl	%r15d, %r15d
	xorl	%r13d, %r13d
	movl	$7, %r14d
	jmp	.L2311
	.p2align 4,,10
	.p2align 3
.L2371:
	cmpq	48+symbolList(%rip), %rax
	jne	.L2338
	movq	48(%rsi), %rax
	testq	%rax, %rax
	je	.L2380
	movq	%rax, 80(%rsi)
	movq	56(%rsi), %rax
	movdqu	64(%rsi), %xmm5
	movq	$0, 48(%rsi)
	movq	%rax, 16(%rsi)
	movups	%xmm5, 32(%rsi)
.L2381:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	next_token
	movq	%rax, 64(%rsp)
	movq	%rax, 80(%rsi)
.L2382:
	movq	64(%rsp), %rax
	testq	%r13, %r13
	je	.L2508
	cmpl	$1, 24(%rax)
	jne	.L2384
	movq	(%rax), %rdx
	movq	%r13, %rcx
.L2385:
	movq	8(%rcx), %rax
	jmp	.L2486
	.p2align 4,,10
	.p2align 3
.L2509:
	movq	8(%rax), %r12
	cmpq	%rdx, 8(%r12)
	je	.L2387
.L2486:
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L2509
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	jne	.L2385
	testq	%r14, %r14
	je	.L2391
	movl	32(%r14), %ecx
	testl	%ecx, %ecx
	je	.L2487
	movq	(%r14), %r14
	testq	%r14, %r14
	je	.L2391
	movl	32(%r14), %eax
	testl	%eax, %eax
	je	.L2487
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L2391:
	movq	%r14, %rcx
	call	make_method_name
	movq	%rax, %r14
.L2394:
	movq	8(%r13), %rax
	movq	(%rax), %r15
	testq	%r15, %r15
	jne	.L2393
	jmp	.L2392
	.p2align 4,,10
	.p2align 3
.L2510:
	movq	(%r15), %r15
	testq	%r15, %r15
	je	.L2392
.L2393:
	movq	8(%r15), %r12
	movq	%r14, %rdx
	movq	8(%r12), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L2510
.L2387:
	movq	72(%rsp), %rdx
	xorl	%r9d, %r9d
	movq	%r12, %r8
	movl	$2, %ecx
	movq	$0, 32(%rsp)
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	call	create_variable_access
	movq	%rax, 72(%rsp)
	jmp	.L2370
	.p2align 4,,10
	.p2align 3
.L2372:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	next_token
	movq	48(%rsi), %r9
	movq	%rax, 80(%rsi)
	testq	%r9, %r9
	je	.L2373
	movq	56(%rsi), %rax
	movdqu	64(%rsi), %xmm3
	movq	%r9, 80(%rsi)
	movq	$0, 48(%rsi)
	movq	%rax, 16(%rsi)
	movups	%xmm3, 32(%rsi)
	jmp	.L2374
	.p2align 4,,10
	.p2align 3
.L2380:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	next_token
	movq	%rax, 80(%rsi)
	movq	48(%rsi), %rax
	movq	%rax, 64(%rsp)
	testq	%rax, %rax
	je	.L2381
	movq	%rax, 80(%rsi)
	movdqu	64(%rsi), %xmm5
	movq	56(%rsi), %rax
	movq	$0, 48(%rsi)
	movups	%xmm5, 32(%rsi)
	movq	%rax, 16(%rsi)
	jmp	.L2382
	.p2align 4,,10
	.p2align 3
.L2503:
	movl	$1, %edx
	movq	%rsi, %rcx
	movq	16(%rsi), %r15
	movdqu	32(%rsi), %xmm6
	call	next_token
	movdqu	16(%rsi), %xmm0
	movdqu	32(%rsi), %xmm2
	movq	40(%rsi), %rdx
	cmpl	$5, 24(%rax)
	movq	%rax, 80(%rsi)
	punpcklqdq	%xmm2, %xmm0
	movq	%r15, 16(%rsi)
	movq	%rdx, 72(%rsi)
	movq	%rax, 48(%rsi)
	movups	%xmm0, 56(%rsi)
	movups	%xmm6, 32(%rsi)
	je	.L2398
	jmp	.L2338
	.p2align 4,,10
	.p2align 3
.L2392:
	movq	0(%r13), %r13
	testq	%r13, %r13
	jne	.L2394
	movq	64(%rsp), %rax
	movq	__imp___acrt_iob_func(%rip), %r13
	movl	$2, %ecx
	movq	16(%rax), %rdx
	movq	8(%rax), %rsi
	movq	(%rbx), %rax
	leaq	1(%rdx), %r12
	movq	%rdx, 72(%rsp)
	addq	$1, %rsi
	movq	24(%rax), %r14
	call	*%r13
	movq	%r12, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC216(%rip), %rdx
	movq	%rax, %rcx
	movq	%r14, %r8
	call	fprintf
	jmp	.L2368
	.p2align 4,,10
	.p2align 3
.L2501:
	movq	48(%rsi), %r13
	testq	%r13, %r13
	je	.L2342
	movq	56(%rsi), %rax
	movdqu	64(%rsi), %xmm3
	movq	%r13, 80(%rsi)
	movq	$0, 48(%rsi)
	movq	%rax, 16(%rsi)
	movups	%xmm3, 32(%rsi)
.L2343:
	testq	%r12, %r12
	je	.L2511
	movl	32(%r12), %eax
	testl	%eax, %eax
	je	.L2512
.L2346:
	subl	$1, %eax
	cmpl	$1, %eax
	ja	.L2513
.L2345:
	movq	48(%rsi), %r15
	testq	%r15, %r15
	je	.L2355
	movq	56(%rsi), %rax
	movdqu	64(%rsi), %xmm4
	movq	%r15, 80(%rsi)
	movq	$0, 48(%rsi)
	movq	%rax, 16(%rsi)
	movups	%xmm4, 32(%rsi)
.L2356:
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movq	%rax, %r13
	movups	%xmm0, (%rax)
	movl	24(%r15), %eax
.L2357:
	cmpl	$5, %eax
	je	.L2367
.L2369:
	movq	24(%rbp), %rdx
	movq	%rbx, %r8
	movq	%rsi, %rcx
	call	parse_expression
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L2514
.L2358:
	call	alloc_memory.constprop.0
	cmpq	$0, 0(%r13)
	movq	$0, (%rax)
	movq	%r14, 8(%rax)
	je	.L2515
	movq	8(%r13), %rdx
	movq	%rax, (%rdx)
.L2360:
	movq	48(%rsi), %r15
	movq	%rax, 8(%r13)
	testq	%r15, %r15
	je	.L2361
	movq	56(%rsi), %rax
	movdqu	64(%rsi), %xmm1
	movq	%r15, 80(%rsi)
	movq	$0, 48(%rsi)
	movq	%rax, 16(%rsi)
	movups	%xmm1, 32(%rsi)
.L2362:
	cmpl	$5, 24(%r15)
	je	.L2516
.L2363:
	movq	16(%r15), %rax
	movq	8(%r15), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %r13
	leaq	1(%rax), %r12
	movq	(%rbx), %rax
	addq	$1, %rsi
	movq	24(%rax), %r14
	call	*%r13
	movq	%r12, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC211(%rip), %rdx
	movq	%rax, %rcx
	movq	%r14, %r8
	call	fprintf
.L2368:
	movq	16(%rdi), %rax
	movq	8(%rdi), %rsi
	movl	$2, %ecx
	leaq	1(%rax), %r12
	movq	(%rbx), %rax
	addq	$1, %rsi
	movq	24(%rax), %rbx
	call	*%r13
	movq	%r12, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC217(%rip), %rdx
	movq	%rax, %rcx
	movq	%rbx, %r8
	call	fprintf
	xorl	%eax, %eax
	jmp	.L2309
	.p2align 4,,10
	.p2align 3
.L2376:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	next_token
	movq	%rax, 80(%rsi)
	jmp	.L2377
.L2506:
	movq	48(%rcx), %r12
	testq	%r12, %r12
	je	.L2329
	movq	56(%rcx), %rax
	movdqu	64(%rcx), %xmm6
	movq	%r12, 80(%rcx)
	movq	$0, 48(%rcx)
	movq	%rax, 16(%rcx)
	movups	%xmm6, 32(%rcx)
.L2330:
	movq	24(%rbp), %rdx
	movq	%rbx, %r8
	movq	%rsi, %rcx
	call	parse_primary
	movq	%rax, 56(%rsp)
	testq	%rax, %rax
	je	.L2517
	movl	$0, 64(%rsp)
	xorl	%r12d, %r12d
	xorl	%esi, %esi
	xorl	%edi, %edi
	movq	$0, 72(%rsp)
	xorl	%r15d, %r15d
	xorl	%r13d, %r13d
	movl	$6, %r14d
	jmp	.L2311
.L2500:
	movl	$1, %edx
	movq	%rsi, %rcx
	movq	16(%rsi), %r13
	movdqu	32(%rsi), %xmm6
	call	next_token
	movdqu	16(%rsi), %xmm0
	movdqu	32(%rsi), %xmm3
	movq	40(%rsi), %rdx
	movq	%rax, 80(%rsi)
	punpcklqdq	%xmm3, %xmm0
	movq	%r13, 16(%rsi)
	movq	%rdx, 72(%rsi)
	movq	%rax, 48(%rsi)
	movups	%xmm0, 56(%rsi)
	movups	%xmm6, 32(%rsi)
	jmp	.L2337
.L2342:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	next_token
	movq	%rax, 80(%rsi)
	movq	%rax, %r13
	jmp	.L2343
	.p2align 4,,10
	.p2align 3
.L2516:
	movq	(%r15), %rax
	cmpq	32+symbolList(%rip), %rax
	je	.L2518
	cmpq	8+symbolList(%rip), %rax
	jne	.L2363
.L2367:
	movq	8+symbolList(%rip), %rax
	cmpq	%rax, (%r15)
	jne	.L2369
	movq	%r13, 32(%rsp)
	movq	72(%rsp), %rdx
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	movl	$1, %ecx
	call	create_variable_access
	movq	(%r12), %r12
	movq	%rax, 72(%rsp)
	movl	32(%r12), %r8d
	testl	%r8d, %r8d
	jne	.L2416
	movq	24(%r12), %rax
	xorl	%r14d, %r14d
	movq	16(%rax), %r13
	jmp	.L2370
	.p2align 4,,10
	.p2align 3
.L2361:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	next_token
	movq	%rax, 80(%rsi)
	movq	%rax, %r15
	jmp	.L2362
	.p2align 4,,10
	.p2align 3
.L2515:
	movq	%rax, 0(%r13)
	jmp	.L2360
	.p2align 4,,10
	.p2align 3
.L2514:
	movq	16(%r15), %rax
	movq	8(%r15), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rdx
	movq	(%rbx), %rax
	addq	$1, %r9
	movq	%rdx, 56(%rsp)
	movq	%r9, 64(%rsp)
	movq	24(%rax), %r15
	call	*__imp___acrt_iob_func(%rip)
	movq	56(%rsp), %rdx
	movq	64(%rsp), %r9
	movq	%rax, %rcx
	movq	%r15, %r8
	movq	%rdx, 32(%rsp)
	leaq	.LC210(%rip), %rdx
	call	fprintf
	jmp	.L2358
	.p2align 4,,10
	.p2align 3
.L2518:
	movq	48(%rsi), %r15
	testq	%r15, %r15
	je	.L2365
	movq	56(%rsi), %rax
	movdqu	64(%rsi), %xmm6
	movq	%r15, 80(%rsi)
	movq	$0, 48(%rsi)
	movq	%rax, 16(%rsi)
	movl	24(%r15), %eax
	movups	%xmm6, 32(%rsi)
	jmp	.L2357
	.p2align 4,,10
	.p2align 3
.L2487:
	movq	8(%r14), %r14
	jmp	.L2391
	.p2align 4,,10
	.p2align 3
.L2502:
	movq	16(%r9), %rax
	movq	8(%r9), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rdx
	movq	(%rbx), %rax
	addq	$1, %r9
	movq	%rdx, 48(%rsp)
	movq	24(%rax), %r8
	movq	%r9, 56(%rsp)
	movq	%r8, 64(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	48(%rsp), %rdx
	movq	56(%rsp), %r9
	movq	64(%rsp), %r8
	movq	%rax, %rcx
	movq	%rdx, 32(%rsp)
	leaq	.LC212(%rip), %rdx
	call	fprintf
	jmp	.L2375
	.p2align 4,,10
	.p2align 3
.L2409:
	movl	$-3, 64(%rsp)
	xorl	%r12d, %r12d
	xorl	%esi, %esi
	xorl	%r15d, %r15d
	movq	$0, 72(%rsp)
	movl	$1, %edi
	movl	$3, %r14d
	movq	$0, 56(%rsp)
	jmp	.L2311
	.p2align 4,,10
	.p2align 3
.L2498:
	movl	$-2, 64(%rsp)
	xorl	%r12d, %r12d
	xorl	%esi, %esi
	xorl	%r15d, %r15d
	movq	$0, 72(%rsp)
	movl	$1, %edi
	movl	$4, %r14d
	movq	$0, 56(%rsp)
	jmp	.L2311
	.p2align 4,,10
	.p2align 3
.L2493:
	movq	(%rdi), %rcx
	jmp	.L2318
.L2505:
	movq	48(%rcx), %rdi
	testq	%rdi, %rdi
	je	.L2320
	movq	56(%rcx), %rax
	movdqu	64(%rcx), %xmm6
	movq	%rdi, 80(%rcx)
	movq	$0, 48(%rcx)
	movq	%rax, 16(%rcx)
	movups	%xmm6, 32(%rcx)
.L2321:
	movq	24(%rbp), %rdx
	movq	%rbx, %r8
	movq	%rsi, %rcx
	call	parse_expression
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L2519
	movq	48(%rsi), %rax
	testq	%rax, %rax
	je	.L2324
	movq	56(%rsi), %rdx
	movdqu	64(%rsi), %xmm4
	movq	%rax, 80(%rsi)
	movq	$0, 48(%rsi)
	movq	%rdx, 16(%rsi)
	movups	%xmm4, 32(%rsi)
.L2325:
	movl	24(%rax), %r14d
	cmpl	$5, %r14d
	jne	.L2326
	movq	8+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L2326
	movl	$-1, 64(%rsp)
	xorl	%r12d, %r12d
	xorl	%edi, %edi
	xorl	%r13d, %r13d
	movq	$0, 72(%rsp)
	movl	$1, %esi
	movq	$0, 56(%rsp)
	jmp	.L2311
.L2407:
	call	*__imp___acrt_iob_func(%rip)
	movl	%r14d, %r8d
	leaq	.LC136(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	xorl	%eax, %eax
	jmp	.L2309
.L2365:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	next_token
	movq	%rax, 80(%rsi)
	movq	%rax, %r15
	movl	24(%rax), %eax
	jmp	.L2357
.L2355:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	next_token
	movq	%rax, 80(%rsi)
	movq	%rax, %r15
	jmp	.L2356
.L2513:
	movq	16(%r13), %rax
	movq	8(%r13), %r13
	movl	$2, %ecx
	leaq	1(%rax), %r15
	movq	(%rbx), %rax
	addq	$1, %r13
	movq	24(%rax), %r14
	call	*__imp___acrt_iob_func(%rip)
	movq	%r15, 32(%rsp)
	movq	%r13, %r9
	leaq	.LC209(%rip), %rdx
	movq	%rax, %rcx
	movq	%r14, %r8
	call	fprintf
	jmp	.L2345
.L2512:
	movq	8(%r12), %rcx
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	call	make_method_name
	movq	%rax, %r14
	movq	24(%r12), %rax
	movq	16(%rax), %rax
	movq	%rax, 64(%rsp)
	testq	%rax, %rax
	je	.L2482
.L2351:
	movq	64(%rsp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %r15
	testq	%r15, %r15
	jne	.L2350
	jmp	.L2348
	.p2align 4,,10
	.p2align 3
.L2520:
	movq	(%r15), %r15
	testq	%r15, %r15
	je	.L2348
.L2350:
	movq	8(%r15), %r12
	movq	%r14, %rdx
	movq	8(%r12), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L2520
	movq	72(%rsp), %rdx
	xorl	%r9d, %r9d
	movq	%r12, %r8
	movl	$2, %ecx
	movq	$0, 32(%rsp)
	call	create_variable_access
	movq	%rax, 72(%rsp)
	movl	32(%r12), %eax
	jmp	.L2346
.L2348:
	movq	64(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 64(%rsp)
	testq	%rax, %rax
	jne	.L2351
.L2482:
	movq	72(%rsp), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ecx
	movq	$0, 32(%rsp)
	xorl	%r12d, %r12d
	call	create_variable_access
	movq	%rax, 72(%rsp)
	jmp	.L2345
.L2326:
	movq	16(%rax), %rdi
	movq	8(%rax), %rsi
	movl	$2, %ecx
	movq	(%rbx), %rax
	addq	$1, %rdi
	addq	$1, %rsi
	movq	24(%rax), %rbx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC205(%rip), %rdx
	movq	%rax, %rcx
	movq	%rbx, %r8
	call	fprintf
	xorl	%eax, %eax
	jmp	.L2309
.L2511:
	movq	16(%r13), %rax
	movq	8(%r13), %r13
	movl	$2, %ecx
	leaq	1(%rax), %r15
	movq	(%rbx), %rax
	addq	$1, %r13
	movq	24(%rax), %r14
	call	*__imp___acrt_iob_func(%rip)
	movq	%r15, 32(%rsp)
	movq	%r13, %r9
	leaq	.LC208(%rip), %rdx
	movq	%rax, %rcx
	movq	%r14, %r8
	call	fprintf
	jmp	.L2345
.L2378:
	movq	16(%rax), %rdx
	movq	8(%rax), %rsi
	movl	$2, %ecx
	movq	(%rbx), %rax
	movq	__imp___acrt_iob_func(%rip), %r13
	leaq	1(%rdx), %r12
	addq	$1, %rsi
	movq	24(%rax), %r14
	call	*%r13
	movq	%r12, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC213(%rip), %rdx
	movq	%rax, %rcx
	movq	%r14, %r8
	call	fprintf
	jmp	.L2368
.L2320:
	movl	$1, %edx
	call	next_token
	movq	%rax, 80(%rsi)
	movq	%rax, %rdi
	jmp	.L2321
.L2324:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	next_token
	movq	%rax, 80(%rsi)
	jmp	.L2325
.L2329:
	movl	$1, %edx
	call	next_token
	movq	%rax, 80(%rsi)
	movq	%rax, %r12
	jmp	.L2330
.L2416:
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	jmp	.L2370
.L2331:
	movl	$1, %edx
	call	next_token
	movq	%rax, 80(%rsi)
	movq	%rax, %r12
	jmp	.L2332
.L2384:
	movq	16(%rax), %rdx
	movq	8(%rax), %rsi
	movl	$2, %ecx
	movq	(%rbx), %rax
	movq	__imp___acrt_iob_func(%rip), %r13
	leaq	1(%rdx), %r12
	movq	%rdx, 72(%rsp)
	addq	$1, %rsi
	movq	24(%rax), %r14
	call	*%r13
	movq	%r12, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC215(%rip), %rdx
	movq	%rax, %rcx
	movq	%r14, %r8
	call	fprintf
	jmp	.L2368
.L2508:
	movq	16(%rax), %rdx
	movq	8(%rax), %rsi
	movl	$2, %ecx
	movq	(%rbx), %rax
	movq	__imp___acrt_iob_func(%rip), %r13
	leaq	1(%rdx), %r12
	movq	%rdx, 72(%rsp)
	addq	$1, %rsi
	movq	24(%rax), %r14
	call	*%r13
	movq	%r12, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC214(%rip), %rdx
	movq	%rax, %rcx
	movq	%r14, %r8
	call	fprintf
	jmp	.L2368
.L2519:
	movq	16(%rdi), %rax
	movq	8(%rdi), %rsi
	movl	$2, %ecx
	leaq	1(%rax), %r12
	movq	(%rbx), %rax
	addq	$1, %rsi
	movq	24(%rax), %rbx
	call	*__imp___acrt_iob_func(%rip)
	movq	%r12, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC204(%rip), %rdx
	movq	%rax, %rcx
	movq	%rbx, %r8
	call	fprintf
	xorl	%eax, %eax
	jmp	.L2309
.L2517:
	movq	16(%r12), %rax
	movq	8(%r12), %rsi
	movl	$2, %ecx
	leaq	1(%rax), %rdi
	movq	(%rbx), %rax
	addq	$1, %rsi
	movq	24(%rax), %rbx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC206(%rip), %rdx
	movq	%rax, %rcx
	movq	%rbx, %r8
	call	fprintf
	xorl	%eax, %eax
	jmp	.L2309
.L2507:
	movq	16(%r12), %rax
	movq	8(%r12), %rsi
	movl	$2, %ecx
	leaq	1(%rax), %rdi
	movq	(%rbx), %rax
	addq	$1, %rsi
	movq	24(%rax), %rbx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC207(%rip), %rdx
	movq	%rax, %rcx
	movq	%rbx, %r8
	call	fprintf
	xorl	%eax, %eax
	jmp	.L2309
.L2496:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, %r8
	leaq	.LC93(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
.L2504:
	movq	__imp___acrt_iob_func(%rip), %r13
	jmp	.L2368
	.section .rdata,"dr"
	.align 8
.LC219:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse right operand\12\0"
	.text
	.p2align 4
	.def	parse_expr_prec;	.scl	3;	.type	32;	.endef
parse_expr_prec:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%r9, %r12
	pushq	%rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$16, %rsp
	andq	$-16, %rsp
	subq	$64, %rsp
	movq	48(%rcx), %rax
	movups	%xmm6, 64(%rsp)
	movl	%r8d, 32(%rbp)
	testq	%rax, %rax
	je	.L2582
.L2581:
	cmpl	$5, 24(%rax)
	jne	.L2563
	movq	(%rax), %rax
	cmpq	144+symbolList(%rip), %rax
	je	.L2544
	cmpq	184+symbolList(%rip), %rax
	je	.L2545
	cmpq	192+symbolList(%rip), %rax
	je	.L2546
	cmpq	200+symbolList(%rip), %rax
	je	.L2547
	cmpq	208+symbolList(%rip), %rax
	je	.L2548
	cmpq	216+symbolList(%rip), %rax
	je	.L2549
	cmpq	224+symbolList(%rip), %rax
	je	.L2550
	cmpq	232+symbolList(%rip), %rax
	je	.L2551
	cmpq	152+symbolList(%rip), %rax
	je	.L2552
	cmpq	160+symbolList(%rip), %rax
	je	.L2553
	cmpq	128+symbolList(%rip), %rax
	je	.L2554
	cmpq	136+symbolList(%rip), %rax
	je	.L2555
	cmpq	168+symbolList(%rip), %rax
	je	.L2556
	cmpq	176+symbolList(%rip), %rax
	je	.L2557
	cmpq	88+symbolList(%rip), %rax
	je	.L2558
	cmpq	96+symbolList(%rip), %rax
	je	.L2559
	cmpq	104+symbolList(%rip), %rax
	je	.L2560
	cmpq	112+symbolList(%rip), %rax
	je	.L2561
	cmpq	120+symbolList(%rip), %rax
	je	.L2562
.L2563:
	movq	%rsi, %rax
.L2521:
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
.L2544:
	movl	$1, %edi
	movl	$13, %r15d
	.p2align 4,,10
	.p2align 3
.L2524:
	cmpl	%edi, 32(%rbp)
	jg	.L2563
.L2525:
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L2526
	movq	%rax, 80(%rbx)
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm2
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm2, 32(%rbx)
.L2527:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %r13
.L2528:
	movq	48(%rbp), %r8
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	parse_primary
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L2583
	call	alloc_memory.constprop.1
	movl	$19, 24(%rax)
	movq	%rax, %r13
	movq	%r14, 8(%rax)
	movq	$0, 16(%rax)
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L2584
	.p2align 4,,10
	.p2align 3
.L2580:
	cmpl	$5, 24(%rax)
	jne	.L2532
	movq	(%rax), %rax
	cmpq	144+symbolList(%rip), %rax
	je	.L2532
	cmpq	184+symbolList(%rip), %rax
	je	.L2532
	cmpq	192+symbolList(%rip), %rax
	je	.L2532
	cmpq	200+symbolList(%rip), %rax
	je	.L2532
	cmpq	208+symbolList(%rip), %rax
	je	.L2532
	cmpq	216+symbolList(%rip), %rax
	je	.L2532
	cmpq	224+symbolList(%rip), %rax
	je	.L2565
	cmpq	232+symbolList(%rip), %rax
	je	.L2565
	cmpq	152+symbolList(%rip), %rax
	je	.L2571
	cmpq	160+symbolList(%rip), %rax
	je	.L2571
	cmpq	128+symbolList(%rip), %rax
	je	.L2571
	cmpq	136+symbolList(%rip), %rax
	je	.L2571
	cmpq	168+symbolList(%rip), %rax
	je	.L2571
	cmpq	176+symbolList(%rip), %rax
	je	.L2571
	cmpq	88+symbolList(%rip), %rax
	je	.L2573
	cmpq	96+symbolList(%rip), %rax
	je	.L2573
	cmpq	104+symbolList(%rip), %rax
	je	.L2575
	cmpq	112+symbolList(%rip), %rax
	je	.L2575
	cmpq	120+symbolList(%rip), %rax
	je	.L2575
	.p2align 4,,10
	.p2align 3
.L2532:
	movq	%rsi, %rdx
	movq	%r13, %r9
	xorl	%r8d, %r8d
	movl	%r15d, %ecx
	call	create_expression
	movq	%rax, %rsi
	movq	48(%rbx), %rax
	testq	%rax, %rax
	jne	.L2581
.L2582:
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	16(%rbx), %rdi
	movdqu	32(%rbx), %xmm6
	call	next_token
	movdqu	16(%rbx), %xmm0
	movdqu	32(%rbx), %xmm5
	movq	40(%rbx), %rdx
	movq	%rax, 80(%rbx)
	punpcklqdq	%xmm5, %xmm0
	movq	%rdi, 16(%rbx)
	movq	%rdx, 72(%rbx)
	movq	%rax, 48(%rbx)
	movups	%xmm0, 56(%rbx)
	movups	%xmm6, 32(%rbx)
	jmp	.L2581
	.p2align 4,,10
	.p2align 3
.L2571:
	movl	$3, %r8d
.L2533:
	cmpl	%r8d, %edi
	jge	.L2532
	movq	48(%rbp), %rax
	movq	%r13, %rdx
	movq	%r12, %r9
	movq	%rbx, %rcx
	movq	%rax, 32(%rsp)
	call	parse_expr_prec
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L2530
	movq	48(%rbx), %rax
	testq	%rax, %rax
	jne	.L2580
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	16(%rbx), %r14
	movdqu	32(%rbx), %xmm6
	call	next_token
	movdqu	16(%rbx), %xmm0
	movdqu	32(%rbx), %xmm1
	movq	40(%rbx), %rdx
	movq	%rax, 80(%rbx)
	punpcklqdq	%xmm1, %xmm0
	movq	%r14, 16(%rbx)
	movq	%rdx, 72(%rbx)
	movq	%rax, 48(%rbx)
	movups	%xmm0, 56(%rbx)
	movups	%xmm6, 32(%rbx)
	jmp	.L2580
	.p2align 4,,10
	.p2align 3
.L2526:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	48(%rbx), %r13
	movq	%rax, 80(%rbx)
	testq	%r13, %r13
	je	.L2527
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm3
	movq	%r13, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm3, 32(%rbx)
	jmp	.L2528
	.p2align 4,,10
	.p2align 3
.L2565:
	movl	$2, %r8d
	jmp	.L2533
	.p2align 4,,10
	.p2align 3
.L2573:
	movl	$4, %r8d
	jmp	.L2533
	.p2align 4,,10
	.p2align 3
.L2584:
	movq	16(%rbx), %r8
	movl	$1, %edx
	movq	%rbx, %rcx
	movdqu	32(%rbx), %xmm6
	movq	%r8, 56(%rsp)
	call	next_token
	movdqu	16(%rbx), %xmm0
	movdqu	32(%rbx), %xmm4
	movq	40(%rbx), %rdx
	movq	56(%rsp), %r8
	movq	%rax, 80(%rbx)
	punpcklqdq	%xmm4, %xmm0
	movq	%rax, 48(%rbx)
	movq	%rdx, 72(%rbx)
	movq	%r8, 16(%rbx)
	movups	%xmm0, 56(%rbx)
	movups	%xmm6, 32(%rbx)
	jmp	.L2580
	.p2align 4,,10
	.p2align 3
.L2575:
	movl	$5, %r8d
	jmp	.L2533
	.p2align 4,,10
	.p2align 3
.L2545:
	movl	$1, %edi
	movl	$14, %r15d
	jmp	.L2524
.L2562:
	movl	$4, %r15d
	movl	$5, %edi
	jmp	.L2525
.L2557:
	movl	$3, %edi
	movl	$10, %r15d
	jmp	.L2524
	.p2align 4,,10
	.p2align 3
.L2546:
	movl	$1, %edi
	movl	$15, %r15d
	jmp	.L2524
	.p2align 4,,10
	.p2align 3
.L2547:
	movl	$1, %edi
	movl	$16, %r15d
	jmp	.L2524
	.p2align 4,,10
	.p2align 3
.L2548:
	movl	$1, %edi
	movl	$17, %r15d
	jmp	.L2524
	.p2align 4,,10
	.p2align 3
.L2549:
	movl	$1, %edi
	movl	$18, %r15d
	jmp	.L2524
	.p2align 4,,10
	.p2align 3
.L2550:
	movl	$2, %edi
	movl	$11, %r15d
	jmp	.L2524
	.p2align 4,,10
	.p2align 3
.L2583:
	movq	16(%r13), %rax
	movq	8(%r13), %rbx
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	48(%rbp), %rax
	addq	$1, %rbx
	movq	(%rax), %rax
	movq	24(%rax), %rdi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC219(%rip), %rdx
	movq	%rax, %rcx
	movq	%rdi, %r8
	call	fprintf
.L2530:
	xorl	%eax, %eax
	jmp	.L2521
	.p2align 4,,10
	.p2align 3
.L2551:
	movl	$2, %edi
	movl	$12, %r15d
	jmp	.L2524
.L2552:
	movl	$5, %r15d
	movl	$3, %edi
	jmp	.L2524
.L2553:
	movl	$3, %edi
	movl	$6, %r15d
	jmp	.L2524
.L2558:
	movl	$4, %edi
	xorl	%r15d, %r15d
	jmp	.L2524
.L2554:
	movl	$3, %edi
	movl	$7, %r15d
	jmp	.L2524
.L2555:
	movl	$3, %edi
	movl	$8, %r15d
	jmp	.L2524
.L2559:
	movl	$4, %edi
	movl	$1, %r15d
	jmp	.L2524
.L2556:
	movl	$3, %edi
	movl	$9, %r15d
	jmp	.L2524
.L2560:
	movl	$2, %r15d
	movl	$5, %edi
	jmp	.L2525
.L2561:
	movl	$3, %r15d
	movl	$5, %edi
	jmp	.L2525
	.section .rdata,"dr"
	.align 8
.LC220:
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
	je	.L2589
	call	alloc_memory.constprop.1
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rcx
	movq	%rbx, 8(%rax)
	movq	%rax, %rdx
	movl	$19, 24(%rax)
	movq	$0, 16(%rax)
	movq	%rbp, 32(%rsp)
	call	parse_expr_prec
	movq	%rax, %rbx
.L2585:
	addq	$56, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L2589:
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
	leaq	.LC220(%rip), %rdx
	movq	%rax, %rcx
	movq	%rbp, %r8
	call	fprintf
	jmp	.L2585
	.section .rdata,"dr"
	.align 8
.LC221:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected variable type\12\0"
	.align 8
.LC222:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected a type for variable declaration\12\0"
	.align 8
.LC223:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown variable type\12\0"
	.align 8
.LC224:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected variable name\12\0"
	.align 8
.LC225:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse variable initializer\12\0"
	.align 8
.LC226:
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
	je	.L2591
	cmpl	$6, %eax
	jne	.L2592
	movq	(%r8), %rax
	movq	128+keywordList(%rip), %rcx
	cmpq	%rcx, %rax
	je	.L2593
	movq	136+keywordList(%rip), %rcx
	cmpq	%rcx, %rax
	je	.L2593
	movq	144+keywordList(%rip), %rcx
	cmpq	%rcx, %rax
	je	.L2593
	movq	152+keywordList(%rip), %rcx
	cmpq	%rcx, %rax
	je	.L2593
	movq	160+keywordList(%rip), %rcx
	cmpq	%rcx, %rax
	jne	.L2592
	.p2align 4,,10
	.p2align 3
.L2593:
	testq	%r12, %r12
	je	.L2595
	movq	%r12, %rdx
.L2599:
	movq	8(%rdx), %rax
	jmp	.L2631
	.p2align 4,,10
	.p2align 3
.L2632:
	movq	8(%rax), %rbx
	cmpq	%rcx, 8(%rbx)
	je	.L2597
.L2631:
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L2632
	movq	(%rdx), %rdx
	testq	%rdx, %rdx
	jne	.L2599
.L2595:
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
	leaq	.LC223(%rip), %rdx
	movq	%r14, %r8
	movq	%rax, %rcx
	movl	$1, %r14d
	xorl	%ebx, %ebx
	call	fprintf
	movq	48(%rsi), %rdi
	testq	%rdi, %rdi
	jne	.L2633
.L2601:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	next_token
	movq	%rax, 80(%rsi)
	movq	%rax, %rdi
	jmp	.L2602
	.p2align 4,,10
	.p2align 3
.L2597:
	movl	32(%rbx), %eax
	cmpl	$6, %eax
	je	.L2613
	testl	%eax, %eax
	je	.L2613
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
	leaq	.LC222(%rip), %rdx
	movq	%rax, %rcx
	movq	%r14, %r8
	call	fprintf
.L2613:
	movq	48(%rsi), %rdi
	xorl	%r14d, %r14d
	testq	%rdi, %rdi
	je	.L2601
.L2633:
	movq	56(%rsi), %rax
	movdqu	64(%rsi), %xmm1
	movq	%rdi, 80(%rsi)
	movq	$0, 48(%rsi)
	movq	%rax, 16(%rsi)
	movups	%xmm1, 32(%rsi)
.L2602:
	cmpl	$1, 24(%rdi)
	je	.L2603
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
	leaq	.LC224(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
.L2603:
	cmpb	$0, 10(%r13)
	movl	$3, %edx
	je	.L2604
	cmpb	$1, 9(%r13)
	sbbl	%edx, %edx
	andl	$2, %edx
	addl	$3, %edx
.L2604:
	movq	(%rdi), %rcx
	movq	%r12, %r9
	movq	%rbx, %r8
	call	create_symbol
	movq	%rax, %rdi
	movq	48(%rsi), %rax
	testq	%rax, %rax
	je	.L2634
.L2605:
	xorl	%r15d, %r15d
	cmpl	$5, 24(%rax)
	je	.L2635
.L2606:
	testq	%rdi, %rdi
	je	.L2618
	testb	%r14b, %r14b
	jne	.L2618
	call	alloc_memory.constprop.2
	movq	%rbx, (%rax)
	movq	%rdi, 8(%rax)
	movq	%r15, 16(%rax)
.L2590:
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
.L2591:
	movq	(%r8), %rcx
	jmp	.L2593
	.p2align 4,,10
	.p2align 3
.L2635:
	movq	144+symbolList(%rip), %rdx
	cmpq	%rdx, (%rax)
	jne	.L2606
	movq	%rax, 80(%rsi)
	movq	56(%rsi), %rax
	movl	$1, %edx
	movq	%rsi, %rcx
	movdqu	64(%rsi), %xmm3
	movq	$0, 48(%rsi)
	movq	%rax, 16(%rsi)
	movups	%xmm3, 32(%rsi)
	call	next_token
	movq	%r13, %r8
	movq	%r12, %rdx
	movq	%rsi, %rcx
	movq	%rax, 80(%rsi)
	movq	%rax, 56(%rsp)
	call	parse_expression
	movq	56(%rsp), %r9
	testq	%rax, %rax
	movq	%rax, %r15
	jne	.L2606
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
	leaq	.LC225(%rip), %rdx
	movq	%rax, %rcx
	movq	%r13, %r8
	call	fprintf
	jmp	.L2606
	.p2align 4,,10
	.p2align 3
.L2634:
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
	jmp	.L2605
	.p2align 4,,10
	.p2align 3
.L2592:
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
	leaq	.LC221(%rip), %rdx
	movq	%rax, %rcx
	movq	%rdi, %r8
	call	fprintf
	xorl	%eax, %eax
	jmp	.L2590
	.p2align 4,,10
	.p2align 3
.L2618:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$46, %r8d
	movl	$1, %edx
	leaq	.LC226(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	xorl	%eax, %eax
	jmp	.L2590
	.section .rdata,"dr"
	.align 8
.LC227:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'if'\12\0"
	.align 8
.LC228:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse if condition\12\0"
	.align 8
.LC229:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after if condition\12\0"
	.align 8
.LC230:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start if body\12\0"
	.align 8
.LC231:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse if body statement\12\0"
	.align 8
.LC232:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'elif'\12\0"
	.align 8
.LC233:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse else-if condition\12\0"
	.align 8
.LC234:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after else-if condition\12\0"
	.align 8
.LC235:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start else-if body\12\0"
	.align 8
.LC236:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse else-if body statement\12\0"
	.align 8
.LC237:
	.ascii "Error creating else-if statement: condition is NULL\12\0"
	.align 8
.LC238:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start else body\12\0"
	.align 8
.LC239:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse else body statement\12\0"
	.align 8
.LC240:
	.ascii "Error creating if statement: condition is NULL\12\0"
	.align 8
.LC241:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'for'\12\0"
	.align 8
.LC242:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop initializer\12\0"
	.align 8
.LC243:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop initializer\12\0"
	.align 8
.LC244:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop condition\12\0"
	.align 8
.LC245:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop condition\12\0"
	.align 8
.LC246:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop increment\12\0"
	.align 8
.LC247:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after for loop increment\12\0"
	.align 8
.LC248:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start for loop body\12\0"
	.align 8
.LC249:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop body statement\12\0"
	.align 8
.LC250:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'while'\12\0"
	.align 8
.LC251:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse while condition\12\0"
	.align 8
.LC252:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after while condition\12\0"
	.align 8
.LC253:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start while body\12\0"
	.align 8
.LC254:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse while body statement\12\0"
	.align 8
.LC255:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot use 'break' outside of a loop\12\0"
	.align 8
.LC256:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot use 'continue' outside of a loop\12\0"
	.align 8
.LC257:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse statement\12\0"
	.align 8
.LC258:
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
	jne	.L2637
	movq	(%rdx), %rax
	cmpq	48+keywordList(%rip), %rax
	je	.L2817
	cmpq	80+keywordList(%rip), %rax
	je	.L2818
	cmpq	72+keywordList(%rip), %rax
	je	.L2819
	cmpq	168+keywordList(%rip), %rax
	je	.L2820
	cmpq	104+keywordList(%rip), %rax
	je	.L2821
	cmpq	112+keywordList(%rip), %rax
	je	.L2822
	cmpq	120+keywordList(%rip), %rax
	jne	.L2637
	cmpb	$0, 11(%r8)
	je	.L2823
	call	alloc_memory.constprop.0
	movl	$7, 8(%rax)
	movq	%rax, %rdi
	movq	$0, (%rax)
	jmp	.L2790
	.p2align 4,,10
	.p2align 3
.L2637:
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
.L2782:
	testq	%rdi, %rdi
	je	.L2824
.L2790:
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L2794
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm1
	movq	%rax, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rdx, 16(%rbx)
	movups	%xmm1, 32(%rbx)
.L2795:
	cmpl	$5, 24(%rax)
	jne	.L2796
	movq	72+symbolList(%rip), %rcx
	cmpq	%rcx, (%rax)
	je	.L2636
.L2796:
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
	leaq	.LC258(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
.L2636:
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
.L2794:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L2795
	.p2align 4,,10
	.p2align 3
.L2822:
	cmpb	$0, 11(%r8)
	je	.L2825
	call	alloc_memory.constprop.0
	movl	$6, 8(%rax)
	movq	%rax, %rdi
	movq	$0, (%rax)
	jmp	.L2790
	.p2align 4,,10
	.p2align 3
.L2817:
	movq	48(%rcx), %rax
	testq	%rax, %rax
	je	.L2639
	movq	56(%rcx), %rdx
	movdqu	64(%rcx), %xmm0
	movq	%rax, 80(%rcx)
	movq	$0, 48(%rcx)
	movq	%rdx, 16(%rcx)
	movups	%xmm0, 32(%rcx)
.L2640:
	cmpl	$5, 24(%rax)
	jne	.L2641
	movq	symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L2641
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L2644
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm6
	movq	%rdi, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm6, 32(%rbx)
.L2645:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, 64(%rsp)
	testq	%rax, %rax
	je	.L2826
.L2646:
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L2647
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm4
	movq	%rax, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rdx, 16(%rbx)
	movups	%xmm4, 32(%rbx)
.L2648:
	cmpl	$5, 24(%rax)
	jne	.L2649
	movq	8+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L2649
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L2652
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm6
	movq	%rax, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rdx, 16(%rbx)
	movups	%xmm6, 32(%rbx)
.L2653:
	cmpl	$5, 24(%rax)
	jne	.L2654
	movq	16+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L2654
	call	alloc_memory.constprop.0
	movq	48(%rbx), %r15
	pxor	%xmm0, %xmm0
	movq	%rax, %r13
	movups	%xmm0, (%rax)
	testq	%r15, %r15
	je	.L2660
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm0
	movq	%r15, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm0, 32(%rbx)
	.p2align 4,,10
	.p2align 3
.L2657:
	cmpl	$5, 24(%r15)
	jne	.L2662
.L2829:
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, (%r15)
	je	.L2827
.L2662:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L2828
.L2659:
	movq	%rdi, %rdx
	movq	%r13, %rcx
	call	list_append
	movq	48(%rbx), %r15
	testq	%r15, %r15
	je	.L2660
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm3
	movq	%r15, 80(%rbx)
	cmpl	$5, 24(%r15)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm3, 32(%rbx)
	je	.L2829
	jmp	.L2662
	.p2align 4,,10
	.p2align 3
.L2824:
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
	leaq	.LC257(%rip), %rdx
	movq	%rax, %rcx
	movq	%r14, %r8
	call	fprintf
	jmp	.L2790
	.p2align 4,,10
	.p2align 3
.L2821:
	movq	48(%rcx), %rax
	testq	%rax, %rax
	je	.L2784
	movq	56(%rcx), %rdx
	movdqu	64(%rcx), %xmm4
	movq	%rax, 80(%rcx)
	movq	$0, 48(%rcx)
	movq	%rdx, 16(%rcx)
	movups	%xmm4, 32(%rcx)
.L2785:
	cmpl	$5, 24(%rax)
	jne	.L2786
	movq	72+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L2786
	call	alloc_memory.constprop.0
	movl	$5, 8(%rax)
	movq	%rax, %rdi
	movq	$0, (%rax)
	jmp	.L2636
	.p2align 4,,10
	.p2align 3
.L2786:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	$0, 40(%rsp)
	movl	$5, %ecx
	movq	%rax, 32(%rsp)
	call	create_statement
	movq	%rax, %rdi
	jmp	.L2782
	.p2align 4,,10
	.p2align 3
.L2820:
	movq	48(%rcx), %rax
	testq	%rax, %rax
	je	.L2780
	movq	%rax, 80(%rcx)
	movq	56(%rcx), %rax
	movdqu	64(%rcx), %xmm6
	movq	$0, 48(%rcx)
	movq	%rax, 16(%rcx)
	movups	%xmm6, 32(%rcx)
.L2781:
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
	jmp	.L2782
	.p2align 4,,10
	.p2align 3
.L2780:
	movl	$1, %edx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L2781
	.p2align 4,,10
	.p2align 3
.L2639:
	movl	$1, %edx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L2640
	.p2align 4,,10
	.p2align 3
.L2818:
	movq	48(%rcx), %rax
	testq	%rax, %rax
	je	.L2713
	movq	56(%rcx), %rdx
	movdqu	64(%rcx), %xmm5
	movq	%rax, 80(%rcx)
	movq	$0, 48(%rcx)
	movq	%rdx, 16(%rcx)
	movups	%xmm5, 32(%rcx)
.L2714:
	cmpl	$5, 24(%rax)
	jne	.L2715
	movq	symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L2715
	movq	48(%rbx), %r12
	testq	%r12, %r12
	je	.L2718
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm5
	movq	%r12, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm5, 32(%rbx)
.L2719:
	cmpl	$5, 24(%r12)
	jne	.L2720
	movq	72+symbolList(%rip), %rax
	cmpq	%rax, (%r12)
	je	.L2798
.L2720:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_variable
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L2830
.L2722:
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L2723
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm5
	movq	%rax, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rdx, 16(%rbx)
	movups	%xmm5, 32(%rbx)
.L2724:
	cmpl	$5, 24(%rax)
	jne	.L2725
	movq	72+symbolList(%rip), %rcx
	cmpq	%rcx, (%rax)
	jne	.L2725
.L2721:
	movq	48(%rbx), %r13
	testq	%r13, %r13
	je	.L2727
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm3
	movq	%r13, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm3, 32(%rbx)
.L2728:
	cmpl	$5, 24(%r13)
	jne	.L2729
	movq	72+symbolList(%rip), %rax
	cmpq	%rax, 0(%r13)
	je	.L2799
.L2729:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L2831
.L2731:
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L2732
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm6
	movq	%rax, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rdx, 16(%rbx)
	movups	%xmm6, 32(%rbx)
.L2733:
	cmpl	$5, 24(%rax)
	jne	.L2734
	movq	(%rax), %rcx
	cmpq	%rcx, 72+symbolList(%rip)
	jne	.L2734
.L2730:
	movq	48(%rbx), %r13
	testq	%r13, %r13
	je	.L2735
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm3
	movq	%r13, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm3, 32(%rbx)
.L2736:
	cmpl	$5, 24(%r13)
	jne	.L2737
	movq	8+symbolList(%rip), %rax
	cmpq	%rax, 0(%r13)
	je	.L2800
.L2737:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, 64(%rsp)
	testq	%rax, %rax
	je	.L2832
.L2739:
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L2740
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm5
	movq	%rax, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rdx, 16(%rbx)
	movups	%xmm5, 32(%rbx)
.L2741:
	cmpl	$5, 24(%rax)
	jne	.L2742
	movq	(%rax), %rcx
	cmpq	%rcx, 8+symbolList(%rip)
	jne	.L2742
.L2738:
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L2743
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm3
	movq	%rax, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rdx, 16(%rbx)
	movups	%xmm3, 32(%rbx)
.L2744:
	cmpl	$5, 24(%rax)
	jne	.L2745
	movq	16+symbolList(%rip), %rcx
	cmpq	%rcx, (%rax)
	jne	.L2745
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, %r13
	movb	$1, 11(%rsi)
	movq	48(%rbx), %r15
	testq	%r15, %r15
	je	.L2751
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm5
	movq	%r15, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm5, 32(%rbx)
	.p2align 4,,10
	.p2align 3
.L2748:
	cmpl	$5, 24(%r15)
	jne	.L2753
.L2835:
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, (%r15)
	je	.L2833
.L2753:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r10
	testq	%rax, %rax
	je	.L2834
.L2750:
	movq	%r10, %rdx
	movq	%r13, %rcx
	call	list_append
	movq	48(%rbx), %r15
	testq	%r15, %r15
	je	.L2751
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm3
	movq	%r15, 80(%rbx)
	cmpl	$5, 24(%r15)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm3, 32(%rbx)
	je	.L2835
	jmp	.L2753
	.p2align 4,,10
	.p2align 3
.L2819:
	movq	48(%rcx), %rax
	testq	%rax, %rax
	je	.L2755
	movq	56(%rcx), %rdx
	movdqu	64(%rcx), %xmm0
	movq	%rax, 80(%rcx)
	movq	$0, 48(%rcx)
	movq	%rdx, 16(%rcx)
	movups	%xmm0, 32(%rcx)
.L2756:
	cmpl	$5, 24(%rax)
	jne	.L2757
	movq	symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L2757
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L2760
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm0
	movq	%rdi, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm0, 32(%rbx)
.L2761:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L2836
.L2762:
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L2763
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm3
	movq	%rax, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rdx, 16(%rbx)
	movups	%xmm3, 32(%rbx)
.L2764:
	cmpl	$5, 24(%rax)
	jne	.L2765
	movq	8+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L2765
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L2768
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm4
	movq	%rax, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rdx, 16(%rbx)
	movups	%xmm4, 32(%rbx)
.L2769:
	cmpl	$5, 24(%rax)
	jne	.L2770
	movq	16+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L2770
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, %rdi
	movb	$1, 11(%rsi)
	movq	48(%rbx), %r13
	testq	%r13, %r13
	je	.L2776
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm0
	movq	%r13, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm0, 32(%rbx)
	.p2align 4,,10
	.p2align 3
.L2773:
	cmpl	$5, 24(%r13)
	jne	.L2778
.L2839:
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, 0(%r13)
	je	.L2837
.L2778:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L2838
.L2775:
	movq	%r15, %rdx
	movq	%rdi, %rcx
	call	list_append
	movq	48(%rbx), %r13
	testq	%r13, %r13
	je	.L2776
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm5
	movq	%r13, 80(%rbx)
	cmpl	$5, 24(%r13)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm5, 32(%rbx)
	je	.L2839
	jmp	.L2778
	.p2align 4,,10
	.p2align 3
.L2660:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %r15
	jmp	.L2657
	.p2align 4,,10
	.p2align 3
.L2776:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %r13
	jmp	.L2773
	.p2align 4,,10
	.p2align 3
.L2784:
	movl	$1, %edx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L2785
	.p2align 4,,10
	.p2align 3
.L2641:
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
	leaq	.LC227(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
.L2643:
	xorl	%edx, %edx
.L2651:
	movq	$0, 40(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rdi
	jmp	.L2636
	.p2align 4,,10
	.p2align 3
.L2715:
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
	leaq	.LC241(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
.L2717:
	xorl	%r9d, %r9d
.L2726:
	movq	$0, 40(%rsp)
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$4, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rdi
	jmp	.L2636
	.p2align 4,,10
	.p2align 3
.L2828:
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
	leaq	.LC231(%rip), %rdx
	call	fprintf
	jmp	.L2659
	.p2align 4,,10
	.p2align 3
.L2757:
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
	leaq	.LC250(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
.L2759:
	xorl	%r8d, %r8d
.L2767:
	movq	$0, 40(%rsp)
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$3, %ecx
	movq	$0, 32(%rsp)
	call	create_statement
	movq	%rax, %rdi
	jmp	.L2636
	.p2align 4,,10
	.p2align 3
.L2838:
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
	leaq	.LC254(%rip), %rdx
	call	fprintf
	jmp	.L2775
	.p2align 4,,10
	.p2align 3
.L2713:
	movl	$1, %edx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L2714
	.p2align 4,,10
	.p2align 3
.L2649:
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
	leaq	.LC229(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L2643
	.p2align 4,,10
	.p2align 3
.L2823:
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
	leaq	.LC256(%rip), %rdx
	call	fprintf
	jmp	.L2636
	.p2align 4,,10
	.p2align 3
.L2755:
	movl	$1, %edx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L2756
	.p2align 4,,10
	.p2align 3
.L2825:
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
	leaq	.LC255(%rip), %rdx
	call	fprintf
	jmp	.L2636
	.p2align 4,,10
	.p2align 3
.L2725:
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
	leaq	.LC243(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L2717
	.p2align 4,,10
	.p2align 3
.L2765:
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
	leaq	.LC252(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L2759
.L2751:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %r15
	jmp	.L2748
.L2654:
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
	leaq	.LC230(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L2643
.L2644:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %rdi
	jmp	.L2645
.L2647:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L2648
.L2770:
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
	leaq	.LC253(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L2759
.L2718:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %r12
	jmp	.L2719
.L2763:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L2764
.L2760:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %rdi
	jmp	.L2761
.L2827:
	call	alloc_memory.constprop.0
	pxor	%xmm6, %xmm6
	movups	%xmm6, (%rax)
	movq	%rax, 72(%rsp)
	call	alloc_memory.constprop.0
	movq	%rax, 56(%rsp)
	movups	%xmm6, (%rax)
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L2840
.L2663:
	movq	%r13, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L2693:
	cmpl	$6, 24(%rax)
	jne	.L2812
	movq	(%rax), %rax
	cmpq	56+keywordList(%rip), %rax
	jne	.L2841
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L2665
	movq	%rax, 80(%rbx)
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm4
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm4, 32(%rbx)
.L2666:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
.L2667:
	cmpl	$5, 24(%rax)
	jne	.L2668
	movq	symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L2668
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L2670
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm3
	movq	%rdi, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm3, 32(%rbx)
.L2671:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L2842
.L2672:
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L2673
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm4
	movq	%rax, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rdx, 16(%rbx)
	movups	%xmm4, 32(%rbx)
.L2674:
	cmpl	$5, 24(%rax)
	jne	.L2675
	movq	8+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L2675
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L2677
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm5
	movq	%rax, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rdx, 16(%rbx)
	movups	%xmm5, 32(%rbx)
.L2678:
	cmpl	$5, 24(%rax)
	jne	.L2679
	movq	16+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L2679
	call	alloc_memory.constprop.0
	movq	48(%rbx), %rdi
	pxor	%xmm0, %xmm0
	movq	%rax, %r12
	movups	%xmm0, (%rax)
	testq	%rdi, %rdi
	je	.L2681
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm6
	movq	%rdi, 80(%rbx)
	movq	%rdi, %r13
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm6, 32(%rbx)
	.p2align 4,,10
	.p2align 3
.L2682:
	cmpl	$5, 24(%r13)
	jne	.L2689
.L2846:
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, 0(%r13)
	je	.L2843
.L2689:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L2844
.L2684:
	call	alloc_memory.constprop.0
	cmpq	$0, (%r12)
	movq	$0, (%rax)
	movq	%rdi, 8(%rax)
	je	.L2845
	movq	8(%r12), %rdx
	movq	%rax, (%rdx)
.L2686:
	movq	48(%rbx), %r13
	movq	%rax, 8(%r12)
	testq	%r13, %r13
	je	.L2687
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm2
	movq	%r13, 80(%rbx)
	cmpl	$5, 24(%r13)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm2, 32(%rbx)
	je	.L2846
	jmp	.L2689
	.p2align 4,,10
	.p2align 3
.L2687:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %r13
	jmp	.L2682
	.p2align 4,,10
	.p2align 3
.L2845:
	movq	%rax, (%r12)
	jmp	.L2686
	.p2align 4,,10
	.p2align 3
.L2844:
	movq	16(%r13), %rax
	movq	8(%r13), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rdx
	movq	(%rsi), %rax
	addq	$1, %r9
	movq	%rdx, 80(%rsp)
	movq	%r9, 88(%rsp)
	movq	24(%rax), %r13
	call	*__imp___acrt_iob_func(%rip)
	movq	80(%rsp), %rdx
	movq	88(%rsp), %r9
	movq	%rax, %rcx
	movq	%r13, %r8
	movq	%rdx, 32(%rsp)
	leaq	.LC236(%rip), %rdx
	call	fprintf
	jmp	.L2684
	.p2align 4,,10
	.p2align 3
.L2843:
	testq	%r15, %r15
	je	.L2847
	call	alloc_memory.constprop.0
	movq	%r15, (%rax)
	movq	%rax, %rdx
	movq	%r12, 8(%rax)
.L2816:
	movq	72(%rsp), %rcx
	call	list_append
	movq	48(%rbx), %rax
	testq	%rax, %rax
	jne	.L2693
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	16(%rbx), %rdi
	movdqu	32(%rbx), %xmm6
	call	next_token
	movdqu	16(%rbx), %xmm0
	movdqu	32(%rbx), %xmm4
	movq	40(%rbx), %rdx
	movq	%rax, 80(%rbx)
	punpcklqdq	%xmm4, %xmm0
	movq	%rdi, 16(%rbx)
	movq	%rdx, 72(%rbx)
	movq	%rax, 48(%rbx)
	movups	%xmm0, 56(%rbx)
	movups	%xmm6, 32(%rbx)
	jmp	.L2693
	.p2align 4,,10
	.p2align 3
.L2665:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L2666
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm6
	movq	%rax, 80(%rbx)
	movq	$0, 48(%rbx)
	movq	%rdx, 16(%rbx)
	movups	%xmm6, 32(%rbx)
	jmp	.L2667
	.p2align 4,,10
	.p2align 3
.L2673:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L2674
	.p2align 4,,10
	.p2align 3
.L2670:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %rdi
	jmp	.L2671
	.p2align 4,,10
	.p2align 3
.L2677:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L2678
	.p2align 4,,10
	.p2align 3
.L2681:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %r13
	jmp	.L2682
.L2842:
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
	leaq	.LC233(%rip), %rdx
	call	fprintf
	jmp	.L2672
.L2723:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L2724
.L2734:
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
	leaq	.LC245(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L2717
.L2834:
	movq	%rax, 72(%rsp)
	movq	16(%r15), %rax
	movl	$2, %ecx
	movq	8(%r15), %r15
	leaq	1(%rax), %rdx
	movq	(%rsi), %rax
	movq	%rdx, 80(%rsp)
	addq	$1, %r15
	movq	24(%rax), %r8
	movq	%r8, 88(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	80(%rsp), %rdx
	movq	88(%rsp), %r8
	movq	%r15, %r9
	movq	%rax, %rcx
	movq	%rdx, 32(%rsp)
	leaq	.LC249(%rip), %rdx
	call	fprintf
	movq	72(%rsp), %r10
	jmp	.L2750
.L2837:
	movb	$0, 11(%rsi)
	call	alloc_memory.constprop.0
	movq	%r12, (%rax)
	movq	%rax, %r8
	movq	%rdi, 8(%rax)
	jmp	.L2767
.L2826:
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
	leaq	.LC228(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	jmp	.L2646
.L2652:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L2653
.L2727:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %r13
	jmp	.L2728
.L2836:
	movq	16(%rdi), %rax
	movq	8(%rdi), %rdi
	movl	$2, %ecx
	leaq	1(%rax), %r15
	movq	(%rsi), %rax
	addq	$1, %rdi
	movq	24(%rax), %r13
	call	*__imp___acrt_iob_func(%rip)
	movq	%r15, 32(%rsp)
	movq	%rdi, %r9
	leaq	.LC251(%rip), %rdx
	movq	%rax, %rcx
	movq	%r13, %r8
	call	fprintf
	jmp	.L2762
.L2798:
	xorl	%edi, %edi
	jmp	.L2721
.L2768:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L2769
.L2830:
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
	leaq	.LC242(%rip), %rdx
	movq	%rax, %rcx
	movq	%r13, %r8
	call	fprintf
	jmp	.L2722
.L2732:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L2733
.L2742:
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
	leaq	.LC247(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L2717
.L2847:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$1, %edx
	movl	$52, %r8d
	leaq	.LC237(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	xorl	%edx, %edx
	jmp	.L2816
.L2745:
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
	leaq	.LC248(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L2717
.L2735:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %r13
	jmp	.L2736
.L2799:
	xorl	%r12d, %r12d
	jmp	.L2730
.L2831:
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
	leaq	.LC244(%rip), %rdx
	call	fprintf
	jmp	.L2731
.L2740:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L2741
.L2840:
	movl	$1, %edx
	movq	%rbx, %rcx
	movq	16(%rbx), %rdi
	movdqu	32(%rbx), %xmm6
	call	next_token
	movdqu	16(%rbx), %xmm0
	movdqu	32(%rbx), %xmm5
	movq	40(%rbx), %rdx
	movq	%rax, 80(%rbx)
	punpcklqdq	%xmm5, %xmm0
	movq	%rdi, 16(%rbx)
	movq	%rdx, 72(%rbx)
	movq	%rax, 48(%rbx)
	movups	%xmm0, 56(%rbx)
	movups	%xmm6, 32(%rbx)
	jmp	.L2663
.L2833:
	movb	$0, 11(%rsi)
	call	alloc_memory.constprop.1
	movq	%rdi, (%rax)
	movq	%rax, %r9
	movq	%r12, 8(%rax)
	movq	64(%rsp), %rax
	movq	%r13, 24(%r9)
	movq	%rax, 16(%r9)
	jmp	.L2726
.L2668:
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
	leaq	.LC232(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L2643
.L2675:
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
	leaq	.LC234(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L2643
.L2679:
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
	leaq	.LC235(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L2643
.L2743:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L2744
.L2832:
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
	leaq	.LC246(%rip), %rdx
	call	fprintf
	jmp	.L2739
.L2800:
	movq	$0, 64(%rsp)
	jmp	.L2738
.L2841:
	cmpq	64+keywordList(%rip), %rax
	movq	48(%rsp), %r13
	je	.L2848
.L2694:
	cmpq	$0, 64(%rsp)
	je	.L2849
	call	alloc_memory.constprop.1
	movq	%rax, %rdx
	movq	64(%rsp), %rax
	movq	%r13, 8(%rdx)
	movq	%rax, (%rdx)
	movq	72(%rsp), %rax
	movq	%rax, 16(%rdx)
	movq	56(%rsp), %rax
	movq	%rax, 24(%rdx)
	jmp	.L2651
.L2812:
	movq	48(%rsp), %r13
	jmp	.L2694
.L2848:
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L2699
	movq	%rax, 80(%rbx)
	movq	56(%rbx), %rax
	xorl	%ecx, %ecx
	movdqu	64(%rbx), %xmm5
	movq	%rcx, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm5, 32(%rbx)
.L2700:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
.L2701:
	cmpl	$5, 24(%rax)
	jne	.L2702
	movq	16+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L2702
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L2704
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm3
	movq	%rdi, 80(%rbx)
	movq	%rax, 16(%rbx)
	xorl	%eax, %eax
	movq	%rax, 48(%rbx)
	movups	%xmm3, 32(%rbx)
.L2706:
	leaq	.LC239(%rip), %r12
.L2705:
	cmpl	$5, 24(%rdi)
	jne	.L2710
.L2851:
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, (%rdi)
	je	.L2694
.L2710:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L2850
.L2707:
	movq	56(%rsp), %rcx
	movq	%r15, %rdx
	call	list_append
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L2708
	movq	56(%rbx), %rax
	movdqu	64(%rbx), %xmm4
	movq	%rdi, 80(%rbx)
	cmpl	$5, 24(%rdi)
	movq	$0, 48(%rbx)
	movq	%rax, 16(%rbx)
	movups	%xmm4, 32(%rbx)
	je	.L2851
	jmp	.L2710
.L2708:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %rdi
	jmp	.L2705
.L2850:
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
	jmp	.L2707
.L2699:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L2700
	movq	56(%rbx), %rdx
	movdqu	64(%rbx), %xmm6
	movq	%rax, 80(%rbx)
	movq	%rdx, 16(%rbx)
	xorl	%edx, %edx
	movq	%rdx, 48(%rbx)
	movups	%xmm6, 32(%rbx)
	jmp	.L2701
.L2849:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$47, %r8d
	movl	$1, %edx
	leaq	.LC240(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L2643
.L2702:
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
	leaq	.LC238(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
	jmp	.L2643
.L2704:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	next_token
	movq	%rax, 80(%rbx)
	movq	%rax, %rdi
	jmp	.L2706
	.section .rdata,"dr"
	.align 8
.LC259:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected identifier after 'import'\12\0"
	.align 8
.LC260:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected string literal after 'from'\12\0"
	.align 8
.LC261:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' at end of import statement\12\0"
.LC262:
	.ascii "%s.tc\0"
.LC263:
	.ascii "D:/TC/std/\0"
.LC264:
	.ascii "r\0"
	.align 8
.LC265:
	.ascii "Error opening library file for import: %s\12\0"
	.align 8
.LC266:
	.ascii "Info: Starting parsing lib file for import: %s\12\0"
	.align 8
.LC267:
	.ascii "Info: Finished parsing lib file for import: %s\12\0"
	.align 8
.LC268:
	.ascii "Error parsing library file for import: %s\12\0"
	.align 8
.LC269:
	.ascii "Error: Imported symbol '%s' was not found in %s\12\0"
	.align 8
.LC270:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to import module\12\0"
	.align 8
.LC271:
	.ascii "Error creating import: name is NULL\12\0"
	.align 8
.LC272:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse import statement\12\0"
	.align 8
.LC273:
	.ascii "Error creating code member: content is NULL\12\0"
	.align 8
.LC274:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected function return type after 'func'\12\0"
	.align 8
.LC275:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected function name after return type\12\0"
	.align 8
.LC276:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after function name\12\0"
	.align 8
.LC277:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function parameter\12\0"
	.align 8
.LC278:
	.ascii "[Parser Error] at %s:%zu:%zu: Function parameters cannot have default values\12\0"
	.align 8
.LC279:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function parameter\12\0"
	.align 8
.LC280:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start function body\12\0"
	.align 8
.LC281:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function body statement\12\0"
	.align 8
.LC282:
	.ascii "[Parser Error] at %s:%zu:%zu: Unreachable code after return statement\12\0"
	.align 8
.LC283:
	.ascii "[Parser Error] at %s:%zu:%zu: Function missing return statement\12\0"
	.align 8
.LC284:
	.ascii "Error creating function: name or return_type is NULL\12\0"
	.align 8
.LC285:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function declaration\12\0"
	.align 8
.LC286:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected class name after 'class'\12\0"
	.align 8
.LC287:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start class body\12\0"
	.align 8
.LC288:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected method return type after 'method'\12\0"
	.align 8
.LC289:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected method name after return type\12\0"
	.align 8
.LC290:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after method name\12\0"
	.align 8
.LC291:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected 'self' as first parameter of method\12\0"
	.align 8
.LC292:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after method parameter\12\0"
	.align 8
.LC293:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse method parameter\12\0"
	.align 8
.LC294:
	.ascii "[Parser Error] at %s:%zu:%zu: Method parameters cannot have default values\12\0"
	.align 8
.LC295:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start method body\12\0"
	.align 8
.LC297:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse method body statement\12\0"
	.align 8
.LC298:
	.ascii "[Parser Error] at %s:%zu:%zu: Method missing return statement\12\0"
	.align 8
.LC299:
	.ascii "Error creating method: name or return_type is NULL\12\0"
	.align 8
.LC300:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse class method\12\0"
	.align 8
.LC301:
	.ascii "Error creating class member: content is NULL\12\0"
	.align 8
.LC302:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse class variable\12\0"
	.align 8
.LC303:
	.ascii "[Parser Error] at %s:%zu:%zu: Unsupported type for class variable\12\0"
	.align 8
.LC304:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after class variable declaration\12\0"
	.align 8
.LC305:
	.ascii "[Parser Error] at %s:%zu:%zu: Unexpected token in class member\12\0"
	.align 8
.LC306:
	.ascii "[Parser Error] at %s:%zu:%zu: Constructor name conflicts with existing member\12\0"
.LC307:
	.ascii "0\0"
	.align 8
.LC308:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse class declaration\12\0"
	.align 8
.LC309:
	.ascii "[Parser Error] at %s:%zu:%zu: Unexpected token in code member\12\0"
	.align 8
.LC310:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown function return type\12\0"
	.align 8
.LC311:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown return type for method\12\0"
	.section	.text.unlikely,"x"
.LCOLDB313:
	.text
.LHOTB313:
	.p2align 4
	.def	parse_code;	.scl	3;	.type	32;	.endef
parse_code:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	movq	%rcx, %r15
	pushq	%r14
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
	je	.L3202
.L2853:
	testq	%rbx, %rbx
	pxor	%xmm6, %xmm6
	cmove	builtin_scope(%rip), %rbx
	call	alloc_memory.constprop.0
	movups	%xmm6, (%rax)
	movq	%rax, 152(%rsp)
	call	alloc_memory.constprop.0
	movq	%rbx, (%rax)
	movq	%rax, %rdi
	movq	%rax, 160(%rsp)
	call	alloc_memory.constprop.0
	movq	48(%r15), %r11
	movups	%xmm6, (%rax)
	movq	%rax, 8(%rdi)
	testq	%r11, %r11
	je	.L2855
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm4
	movq	%r11, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rax, 16(%r15)
	movups	%xmm4, 32(%r15)
.L2856:
	movq	%r11, 168(%rsp)
.L3081:
	movq	168(%rsp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	je	.L2857
.L3082:
	cmpl	$6, %eax
	je	.L3203
.L2858:
	movq	168(%rsp), %rax
	movl	$2, %ecx
	movq	16(%rax), %rdi
	movq	8(%rax), %rbx
	movq	0(%r13), %rax
	leaq	1(%rdi), %rsi
	movq	%rdi, 168(%rsp)
	addq	$1, %rbx
	movq	24(%rax), %rdi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC309(%rip), %rdx
	movq	%rax, %rcx
	movq	%rdi, %r8
	call	fprintf
.L2888:
	movq	48(%r15), %rax
	movq	%rax, 168(%rsp)
	testq	%rax, %rax
	je	.L3079
	movq	%rax, 80(%r15)
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm1
	movq	$0, 48(%r15)
	movq	%rax, 16(%r15)
	movq	168(%rsp), %rax
	movups	%xmm1, 32(%r15)
	movl	24(%rax), %eax
	testl	%eax, %eax
	jne	.L3082
.L2857:
	call	alloc_memory.constprop.0
	movq	152(%rsp), %rdi
	movq	%rdi, (%rax)
	movq	160(%rsp), %rdi
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
.L3203:
	movq	168(%rsp), %rax
	movq	(%rax), %rax
	cmpq	keywordList(%rip), %rax
	je	.L3204
	cmpq	16+keywordList(%rip), %rax
	je	.L3205
	cmpq	24+keywordList(%rip), %rax
	jne	.L2858
	call	alloc_memory.constprop.0
	movq	%rax, %rsi
	movq	%rax, 144(%rsp)
	movq	160(%rsp), %rax
	movq	%rax, (%rsi)
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, 8(%rsi)
	movq	48(%r15), %rsi
	testq	%rsi, %rsi
	je	.L2942
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm4
	movq	%rsi, 80(%r15)
	cmpl	$1, 24(%rsi)
	movq	$0, 48(%r15)
	movq	%rax, 16(%r15)
	movups	%xmm4, 32(%r15)
	jne	.L3206
.L2944:
	call	alloc_memory.constprop.1
	movq	(%rsi), %rcx
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, %rdi
	movq	144(%rsp), %rax
	movq	%rdi, %r9
	movq	%rax, 16(%rdi)
	call	create_symbol
	movq	%rax, 136(%rsp)
	movq	48(%r15), %rax
	testq	%rax, %rax
	je	.L2946
	movq	56(%r15), %rdx
	movdqu	64(%r15), %xmm4
	movq	%rax, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rdx, 16(%r15)
	movups	%xmm4, 32(%r15)
.L2947:
	cmpl	$5, 24(%rax)
	jne	.L2948
	movq	16+symbolList(%rip), %rsi
	cmpq	%rsi, (%rax)
	jne	.L2948
	call	alloc_memory.constprop.0
	movq	48(%r15), %r14
	pxor	%xmm0, %xmm0
	movq	%rax, 128(%rsp)
	movups	%xmm0, (%rax)
	testq	%r14, %r14
	je	.L2950
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm3
	movq	%r14, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rax, 16(%r15)
	movups	%xmm3, 32(%r15)
.L2952:
	movq	$0, 112(%rsp)
	.p2align 4,,10
	.p2align 3
.L2951:
	movl	24(%r14), %eax
	cmpl	$5, %eax
	je	.L3207
.L3034:
	cmpl	$6, %eax
	jne	.L2953
	movq	(%r14), %rax
	cmpq	32+keywordList(%rip), %rax
	je	.L3208
	cmpq	168+keywordList(%rip), %rax
	je	.L3209
.L2953:
	movq	16(%r14), %rax
	movq	8(%r14), %rbx
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	0(%r13), %rax
	addq	$1, %rbx
	movq	24(%rax), %r12
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC305(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
.L3031:
	movq	48(%r15), %r14
	testq	%r14, %r14
	je	.L3032
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm2
	movq	%r14, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rax, 16(%r15)
	movl	24(%r14), %eax
	movups	%xmm2, 32(%r15)
	cmpl	$5, %eax
	jne	.L3034
.L3207:
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, (%r14)
	jne	.L2953
	movq	136(%rsp), %rax
	movq	DEFAULT_INIT_NAME(%rip), %rdx
	movq	8(%rax), %rcx
	call	make_method_name
	movq	144(%rsp), %rdx
	movq	%rdi, 168(%rsp)
	movq	%rax, %rsi
	movq	%rdx, %rdi
.L3038:
	movq	8(%rdi), %rax
	movq	(%rax), %r12
	testq	%r12, %r12
	jne	.L3037
	jmp	.L3035
	.p2align 4,,10
	.p2align 3
.L3210:
	movq	(%r12), %r12
	testq	%r12, %r12
	je	.L3035
.L3037:
	movq	8(%r12), %rbx
	movq	%rsi, %rdx
	movq	8(%rbx), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L3210
	movq	168(%rsp), %rdi
.L3036:
	cmpl	$2, 32(%rbx)
	je	.L3049
	movq	16(%r14), %rax
	movq	8(%r14), %rsi
	movl	$2, %ecx
	leaq	1(%rax), %r12
	movq	0(%r13), %rax
	addq	$1, %rsi
	movq	24(%rax), %r14
	call	*__imp___acrt_iob_func(%rip)
	movq	%r12, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC306(%rip), %rdx
	movq	%rax, %rcx
	movq	%r14, %r8
	call	fprintf
.L3049:
	movq	136(%rsp), %r12
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	pxor	%xmm6, %xmm6
	movq	8(%r12), %rcx
	call	make_method_name
	movl	$40, %ecx
	movq	%rax, %rsi
	call	alloc_memory
	movq	%rax, %r14
	movq	%rax, 120(%rsp)
	call	alloc_memory.constprop.0
	movq	%rax, %r12
	movq	144(%rsp), %rax
	movq	%rax, (%r12)
	call	alloc_memory.constprop.0
	movq	%rsi, %rcx
	movq	%r14, %r9
	movl	$2, %edx
	movups	%xmm6, (%rax)
	movq	%rax, 8(%r12)
	movq	%r12, 32(%r14)
	movq	136(%rsp), %r12
	movq	%r12, %r8
	call	create_symbol
	movq	%rax, 80(%rsp)
	call	alloc_memory.constprop.0
	movq	32(%r14), %r9
	movq	%r12, %r8
	movq	40+keywordList(%rip), %rcx
	movups	%xmm6, (%rax)
	movl	$3, %edx
	movq	%rax, 168(%rsp)
	call	create_symbol
	movq	%rax, 96(%rsp)
	movq	24(%rbx), %rax
	movq	16(%rax), %rsi
	testq	%rsi, %rsi
	je	.L3050
	call	alloc_memory.constprop.0
	movq	40+keywordList(%rip), %rcx
	movups	%xmm6, (%rax)
	movdqu	(%rsi), %xmm0
	movq	%rax, %r12
	movups	%xmm0, (%rax)
.L3055:
	movq	(%r12), %rax
	testq	%rax, %rax
	je	.L3050
.L3213:
	movq	(%rax), %rdx
	movq	%rdx, (%r12)
	testq	%rdx, %rdx
	je	.L3211
.L3054:
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L3050
	movq	8(%rax), %rdx
	cmpq	8(%rdx), %rcx
	je	.L3055
	movq	(%rax), %rsi
	movq	%rdx, %xmm5
	movq	%rsi, %xmm6
	punpcklqdq	%xmm5, %xmm6
	testq	%rsi, %rsi
	je	.L3212
	call	alloc_memory.constprop.2
	movq	$0, 16(%rax)
	movq	%rax, %rsi
	movups	%xmm6, (%rax)
.L3053:
	movq	168(%rsp), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	(%r12), %rax
	movq	40+keywordList(%rip), %rcx
	testq	%rax, %rax
	jne	.L3213
.L3050:
	call	alloc_memory.constprop.0
	pxor	%xmm6, %xmm6
	movups	%xmm6, (%rax)
	movq	%rax, %rsi
	movq	%rax, 88(%rsp)
	call	alloc_memory.constprop.0
	movq	96(%rsp), %r8
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movups	%xmm6, (%rax)
	movq	%rax, %r14
	movq	128(%rsp), %rax
	xorl	%ecx, %ecx
	movdqu	(%rax), %xmm4
	movups	%xmm4, (%r14)
	movq	$0, 32(%rsp)
	movups	%xmm4, 64(%rsp)
	call	create_variable_access
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	movl	$8, %ecx
	call	create_primary
	movq	%rax, %rcx
	call	create_expression.constprop.0
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	movq	$0, 40(%rsp)
	xorl	%r8d, %r8d
	movq	%rax, 32(%rsp)
	call	create_statement
	movq	%rsi, %rcx
	movq	%rax, %rdx
	call	list_append
.L3057:
	movq	(%r14), %rax
	testq	%rax, %rax
	je	.L3069
	.p2align 4,,10
	.p2align 3
.L3065:
	movq	%rax, %rdx
	movq	(%rax), %rax
	movq	%rax, (%r14)
	testq	%rax, %rax
	je	.L3068
	movq	8(%rdx), %rsi
	testq	%rsi, %rsi
	je	.L3069
	cmpl	$1, 8(%rsi)
	jne	.L3065
.L3070:
	movq	(%rsi), %rax
	movq	96(%rsp), %r8
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	8(%rax), %r12
	movq	$0, 32(%rsp)
	call	create_variable_access
	movq	%r12, %r8
	xorl	%r9d, %r9d
	movl	$2, %ecx
	movq	$0, 32(%rsp)
	movq	%rax, %rdx
	call	create_variable_access
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	movl	$8, %ecx
	call	create_primary
	movq	%rax, %rcx
	call	create_expression.constprop.0
	movq	%rax, %r12
	movq	(%rsi), %rax
	movq	16(%rax), %rsi
	testq	%rsi, %rsi
	je	.L3214
.L3058:
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%r12, %rdx
	movl	$13, %ecx
	call	create_expression
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	movq	$0, 40(%rsp)
	xorl	%r8d, %r8d
	movq	%rax, 32(%rsp)
	call	create_statement
	movq	88(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L3057
	.p2align 4,,10
	.p2align 3
.L3079:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 168(%rsp)
	movq	%rax, 80(%r15)
	testq	%rax, %rax
	jne	.L3081
	jmp	.L2857
	.p2align 4,,10
	.p2align 3
.L2948:
	movq	16(%rax), %rdi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rsi
	leaq	1(%rdi), %rbx
	movq	8(%rax), %rdi
	movq	0(%r13), %rax
	movq	24(%rax), %r12
	addq	$1, %rdi
	call	*%rsi
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	leaq	.LC287(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
.L2945:
	movq	168(%rsp), %rax
	movl	$2, %ecx
	movq	16(%rax), %rdi
	movq	8(%rax), %rbx
	movq	0(%r13), %rax
	movq	%rdi, 168(%rsp)
	addq	$1, %rdi
	addq	$1, %rbx
	movq	24(%rax), %r12
	call	*%rsi
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC308(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	call	alloc_memory.constprop.0
	movl	$2, 8(%rax)
	movq	%rax, %rbx
.L3201:
	movl	$2, %ecx
	call	*%rsi
	movl	$44, %r8d
	movl	$1, %edx
	leaq	.LC273(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	.p2align 4,,10
	.p2align 3
.L3078:
	movq	152(%rsp), %rcx
	movq	%rbx, %rdx
	call	list_append
	jmp	.L2888
	.p2align 4,,10
	.p2align 3
.L3204:
	movq	48(%r15), %rax
	testq	%rax, %rax
	je	.L2860
	movq	56(%r15), %rdx
	movdqu	64(%r15), %xmm3
	movq	%rax, 80(%r15)
	cmpl	$1, 24(%rax)
	movq	$0, 48(%r15)
	movq	%rdx, 16(%r15)
	movups	%xmm3, 32(%r15)
	je	.L3215
.L2861:
	movq	16(%rax), %rdi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rsi
	leaq	1(%rdi), %rbx
	movq	8(%rax), %rdi
	movq	0(%r13), %rax
	movq	24(%rax), %r12
	addq	$1, %rdi
	call	*%rsi
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	leaq	.LC259(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
.L2864:
	movq	168(%rsp), %rax
	movl	$2, %ecx
	movq	16(%rax), %rdi
	movq	8(%rax), %rbx
	movq	0(%r13), %rax
	movq	%rdi, 168(%rsp)
	addq	$1, %rdi
	addq	$1, %rbx
	movq	24(%rax), %r12
	call	*%rsi
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC272(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	call	alloc_memory.constprop.0
	movl	$0, 8(%rax)
	movq	%rax, %rbx
	jmp	.L3201
	.p2align 4,,10
	.p2align 3
.L3205:
	call	alloc_memory.constprop.0
	movq	%rax, %rdi
	movq	160(%rsp), %rax
	movq	%rax, (%rdi)
	call	alloc_memory.constprop.0
	movq	48(%r15), %rcx
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, 8(%rdi)
	testq	%rcx, %rcx
	je	.L2890
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm5
	movq	%rcx, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rax, 16(%r15)
	movups	%xmm5, 32(%r15)
.L2891:
	movl	24(%rcx), %eax
	cmpl	$1, %eax
	je	.L2892
	cmpl	$6, %eax
	jne	.L2893
	movq	(%rcx), %rax
	movq	128+keywordList(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2894
	movq	136+keywordList(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2894
	movq	144+keywordList(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2894
	movq	152+keywordList(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2894
	movq	160+keywordList(%rip), %rdx
	cmpq	%rdx, %rax
	jne	.L2893
	.p2align 4,,10
	.p2align 3
.L2894:
	movq	160(%rsp), %r8
.L2899:
	movq	8(%r8), %rax
	jmp	.L3196
	.p2align 4,,10
	.p2align 3
.L3216:
	movq	8(%rax), %rsi
	cmpq	%rdx, 8(%rsi)
	je	.L2897
.L3196:
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L3216
	movq	(%r8), %r8
	testq	%r8, %r8
	jne	.L2899
	movq	16(%rcx), %rax
	movq	8(%rcx), %rdi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rsi
	leaq	1(%rax), %rbx
	movq	0(%r13), %rax
	addq	$1, %rdi
	movq	24(%rax), %r12
	call	*%rsi
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	leaq	.LC310(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	jmp	.L2895
	.p2align 4,,10
	.p2align 3
.L2897:
	movq	48(%r15), %r12
	testq	%r12, %r12
	je	.L3217
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm0
	movq	%r12, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rax, 16(%r15)
	movups	%xmm0, 32(%r15)
.L2901:
	cmpl	$1, 24(%r12)
	jne	.L3218
	movl	$40, %ecx
	call	alloc_memory
	movq	(%r12), %rcx
	movq	%rsi, %r8
	movl	$1, %edx
	movq	%rdi, 32(%rax)
	movq	%rax, %r9
	movq	%rax, 144(%rsp)
	call	create_symbol
	movq	144(%rsp), %r11
	movq	%rax, 136(%rsp)
	movq	48(%r15), %rax
	testq	%rax, %rax
	je	.L2903
	movq	56(%r15), %rdx
	movdqu	64(%r15), %xmm3
	movq	%rax, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rdx, 16(%r15)
	movups	%xmm3, 32(%r15)
.L2904:
	cmpl	$5, 24(%rax)
	jne	.L2905
	movq	symbolList(%rip), %rbx
	cmpq	%rbx, (%rax)
	jne	.L2905
	movq	48(%r15), %r12
	testq	%r12, %r12
	je	.L2907
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm0
	movq	%r12, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rax, 16(%r15)
	movups	%xmm0, 32(%r15)
.L2908:
	movq	%r11, 128(%rsp)
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movq	%rax, 144(%rsp)
	movups	%xmm0, (%rax)
	movl	24(%r12), %eax
.L2909:
	cmpl	$5, %eax
	je	.L2919
.L2920:
	movq	%r13, %r8
	movq	%rdi, %rdx
	movq	%r15, %rcx
	call	parse_variable
	testq	%rax, %rax
	je	.L3219
	cmpq	$0, 16(%rax)
	je	.L2912
	movq	16(%r12), %rax
	movq	8(%r12), %r12
	movl	$2, %ecx
	leaq	1(%rax), %rbx
	movq	0(%r13), %rax
	addq	$1, %r12
	movq	24(%rax), %r14
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	%r12, %r9
	leaq	.LC278(%rip), %rdx
	movq	%rax, %rcx
	movq	%r14, %r8
	call	fprintf
.L2911:
	movq	48(%r15), %r12
	testq	%r12, %r12
	je	.L2913
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm3
	movq	%r12, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rax, 16(%r15)
	movups	%xmm3, 32(%r15)
.L2914:
	cmpl	$5, 24(%r12)
	je	.L3220
.L2915:
	movq	16(%r12), %rax
	movq	8(%r12), %rdi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rsi
	leaq	1(%rax), %rbx
	movq	0(%r13), %rax
	addq	$1, %rdi
	movq	24(%rax), %r12
	call	*%rsi
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	leaq	.LC279(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
.L2895:
	movq	168(%rsp), %rax
	movl	$2, %ecx
	movq	16(%rax), %rdi
	movq	8(%rax), %rbx
	movq	0(%r13), %rax
	movq	%rdi, 168(%rsp)
	addq	$1, %rdi
	addq	$1, %rbx
	movq	24(%rax), %r12
	call	*%rsi
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC285(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	call	alloc_memory.constprop.0
	movl	$1, 8(%rax)
	movq	%rax, %rbx
	jmp	.L3201
	.p2align 4,,10
	.p2align 3
.L2855:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 80(%r15)
	movq	%rax, %r11
	testq	%rax, %rax
	jne	.L2856
	jmp	.L2857
	.p2align 4,,10
	.p2align 3
.L2942:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, %rsi
	movq	%rax, 80(%r15)
	cmpl	$1, 24(%rsi)
	je	.L2944
.L3206:
	movq	16(%rsi), %rax
	movq	8(%rsi), %rdi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rsi
	leaq	1(%rax), %rbx
	movq	0(%r13), %rax
	addq	$1, %rdi
	movq	24(%rax), %r12
	call	*%rsi
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	leaq	.LC286(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	jmp	.L2945
.L2903:
	movl	$1, %edx
	movq	%r15, %rcx
	movq	%r11, 144(%rsp)
	call	next_token
	movq	144(%rsp), %r11
	movq	%rax, 80(%r15)
	jmp	.L2904
.L2893:
	movq	16(%rcx), %rax
	movq	8(%rcx), %rdi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rsi
	leaq	1(%rax), %rbx
	movq	0(%r13), %rax
	addq	$1, %rdi
	movq	24(%rax), %r12
	call	*%rsi
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	leaq	.LC274(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	jmp	.L2895
	.p2align 4,,10
	.p2align 3
.L3032:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 80(%r15)
	movq	%rax, %r14
	jmp	.L2951
	.p2align 4,,10
	.p2align 3
.L3220:
	movq	(%r12), %rax
	cmpq	32+symbolList(%rip), %rax
	je	.L3221
	cmpq	8+symbolList(%rip), %rax
	jne	.L2915
.L2919:
	movq	8+symbolList(%rip), %rax
	cmpq	%rax, (%r12)
	jne	.L2920
	movq	48(%r15), %rax
	movq	128(%rsp), %r11
	testq	%rax, %rax
	je	.L2921
	movq	56(%r15), %rdx
	movdqu	64(%r15), %xmm0
	movq	%rax, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rdx, 16(%r15)
	movups	%xmm0, 32(%r15)
.L2922:
	cmpl	$5, 24(%rax)
	jne	.L2923
	movq	16+symbolList(%rip), %rbx
	cmpq	%rbx, (%rax)
	jne	.L2923
	movq	%r11, 128(%rsp)
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movq	128(%rsp), %r11
	movups	%xmm0, (%rax)
	movq	%rax, %r10
	movb	$1, 8(%r13)
	movq	48(%r15), %rbx
	testq	%rbx, %rbx
	je	.L2925
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm5
	movq	%rbx, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rax, 16(%r15)
	movups	%xmm5, 32(%r15)
.L2927:
	movb	$0, 128(%rsp)
	movq	%rbx, %r12
	movq	%r10, %r14
	movq	%r11, %rbx
.L2926:
	cmpl	$5, 24(%r12)
	jne	.L2934
.L3225:
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, (%r12)
	je	.L3222
.L2934:
	movq	%r13, %r8
	movq	%rdi, %rdx
	movq	%r15, %rcx
	call	parse_statement
	movq	%rax, %r10
	testq	%rax, %rax
	je	.L3223
	cmpb	$0, 128(%rsp)
	jne	.L3224
.L2930:
	movzbl	128(%rsp), %edx
	cmpl	$5, 8(%r10)
	movl	$1, %eax
	cmove	%eax, %edx
	movb	%dl, 128(%rsp)
.L2931:
	movq	%r10, %rdx
	movq	%r14, %rcx
	call	list_append
	movq	48(%r15), %r12
	testq	%r12, %r12
	je	.L2932
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm4
	movq	%r12, 80(%r15)
	cmpl	$5, 24(%r12)
	movq	$0, 48(%r15)
	movq	%rax, 16(%r15)
	movups	%xmm4, 32(%r15)
	je	.L3225
	jmp	.L2934
	.p2align 4,,10
	.p2align 3
.L3209:
	movq	48(%r15), %r14
	testq	%r14, %r14
	je	.L3017
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm3
	movq	%r14, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rax, 16(%r15)
	movups	%xmm3, 32(%r15)
.L3018:
	movb	$1, 10(%r13)
	movq	144(%rsp), %rdx
	movq	%r13, %r8
	movq	%r15, %rcx
	call	parse_variable
	movb	$0, 10(%r13)
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L3169
	call	alloc_memory.constprop.0
	movq	128(%rsp), %rcx
	movl	$1, 8(%rax)
	movq	%rax, %rbx
	movq	%rax, %rdx
	movq	%rsi, (%rax)
	call	list_append
	cmpl	$1, 8(%rbx)
	je	.L3226
.L3023:
	movq	48(%r15), %rax
	testq	%rax, %rax
	je	.L3027
	movq	56(%r15), %rdx
	movdqu	64(%r15), %xmm5
	movq	%rax, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rdx, 16(%r15)
	movups	%xmm5, 32(%r15)
.L3028:
	cmpl	$5, 24(%rax)
	jne	.L3029
	movq	72+symbolList(%rip), %rsi
	cmpq	%rsi, (%rax)
	je	.L3031
.L3029:
	movq	16(%rax), %rsi
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	0(%r13), %rax
	addq	$1, %rsi
	addq	$1, %rbx
	movq	24(%rax), %r12
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC304(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	jmp	.L3031
	.p2align 4,,10
	.p2align 3
.L2913:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 80(%r15)
	movq	%rax, %r12
	jmp	.L2914
	.p2align 4,,10
	.p2align 3
.L3068:
	movq	8(%rdx), %rsi
	movq	$0, 8(%r14)
	testq	%rsi, %rsi
	je	.L3069
	cmpl	$1, 8(%rsi)
	je	.L3070
.L3069:
	call	alloc_memory.constprop.0
	pxor	%xmm6, %xmm6
	movq	96(%rsp), %r8
	xorl	%edx, %edx
	movups	%xmm6, (%rax)
	xorl	%r9d, %r9d
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
	movq	%rax, %rcx
	call	create_expression.constprop.0
	movq	%r12, %rcx
	movq	%rax, %rdx
	call	list_append
	call	alloc_memory.constprop.0
	movups	%xmm6, (%rax)
	movq	%rax, %rsi
	movq	168(%rsp), %rax
	movdqu	(%rax), %xmm0
	movq	%xmm0, %rax
	movups	%xmm0, 96(%rsp)
	movups	%xmm0, (%rsi)
	testq	%rax, %rax
	jne	.L3067
	jmp	.L3066
	.p2align 4,,10
	.p2align 3
.L3075:
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L3066
	movq	8(%rax), %r8
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movq	$0, 32(%rsp)
	call	create_variable_access
	movq	%rax, %r14
	call	alloc_memory.constprop.0
	movl	$8, 8(%rax)
	movq	%rax, %rcx
	testq	%r14, %r14
	je	.L3073
	movq	%r14, (%rax)
.L3200:
	call	create_expression.constprop.0
	movq	%r12, %rcx
	movq	%rax, %rdx
	call	list_append
	movq	(%rsi), %rax
	testq	%rax, %rax
	je	.L3066
.L3067:
	movq	(%rax), %rdx
	movq	%rdx, (%rsi)
	testq	%rdx, %rdx
	jne	.L3075
	movq	$0, 8(%rsi)
	jmp	.L3075
	.p2align 4,,10
	.p2align 3
.L2912:
	movq	144(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L2911
	.p2align 4,,10
	.p2align 3
.L3219:
	movq	16(%r12), %rax
	movq	8(%r12), %r12
	movl	$2, %ecx
	leaq	1(%rax), %rbx
	movq	0(%r13), %rax
	addq	$1, %r12
	movq	24(%rax), %r14
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	%r12, %r9
	leaq	.LC277(%rip), %rdx
	movq	%rax, %rcx
	movq	%r14, %r8
	call	fprintf
	jmp	.L2911
	.p2align 4,,10
	.p2align 3
.L3208:
	call	alloc_memory.constprop.0
	movq	%rax, %rsi
	movq	%rax, 168(%rsp)
	movq	144(%rsp), %rax
	movq	%rax, (%rsi)
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movq	%rsi, %r9
	movl	$3, %edx
	movups	%xmm0, (%rax)
	movq	40+keywordList(%rip), %rcx
	movq	136(%rsp), %r8
	movq	%rax, 8(%rsi)
	call	create_symbol
	movq	48(%r15), %rcx
	movq	%rax, %r12
	testq	%rcx, %rcx
	je	.L2955
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm4
	movq	%rcx, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rax, 16(%r15)
	movups	%xmm4, 32(%r15)
.L2956:
	movl	24(%rcx), %eax
	cmpl	$1, %eax
	je	.L2957
	cmpl	$6, %eax
	jne	.L2958
	movq	(%rcx), %rax
	movq	128+keywordList(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2959
	movq	136+keywordList(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2959
	movq	144+keywordList(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2959
	movq	152+keywordList(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2959
	movq	160+keywordList(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2959
.L2958:
	movq	16(%rcx), %rax
	movq	8(%rcx), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rbx
	leaq	1(%rax), %r12
	movq	0(%r13), %rax
	addq	$1, %rsi
	movq	24(%rax), %r8
	movq	%r8, 168(%rsp)
	call	*%rbx
	movq	%r12, 32(%rsp)
	movq	%rsi, %r9
	movq	168(%rsp), %r8
	movq	%rax, %rcx
	leaq	.LC288(%rip), %rdx
	call	fprintf
	jmp	.L2960
	.p2align 4,,10
	.p2align 3
.L2957:
	movq	(%rcx), %rdx
.L2959:
	movq	144(%rsp), %r8
.L2964:
	movq	8(%r8), %rax
	jmp	.L3197
	.p2align 4,,10
	.p2align 3
.L3227:
	movq	8(%rax), %rbx
	cmpq	%rdx, 8(%rbx)
	je	.L2962
.L3197:
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L3227
	movq	(%r8), %r8
	testq	%r8, %r8
	jne	.L2964
	movq	16(%rcx), %rax
	movq	8(%rcx), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rbx
	leaq	1(%rax), %r12
	movq	0(%r13), %rax
	addq	$1, %rsi
	movq	24(%rax), %r8
	movq	%r8, 168(%rsp)
	call	*%rbx
	movq	%r12, 32(%rsp)
	movq	%rsi, %r9
	movq	168(%rsp), %r8
	movq	%rax, %rcx
	leaq	.LC311(%rip), %rdx
	call	fprintf
	jmp	.L2960
	.p2align 4,,10
	.p2align 3
.L3226:
	movq	(%rbx), %rax
	movq	(%rax), %rax
	cmpq	name_int(%rip), %rax
	je	.L3198
	cmpq	name_float(%rip), %rax
	je	.L3198
	cmpq	name_string(%rip), %rax
	je	.L3198
	cmpq	name_bool(%rip), %rax
	je	.L3024
	cmpq	name_void(%rip), %rax
	je	.L3024
	movl	32(%rax), %eax
	testl	%eax, %eax
	je	.L3198
	movq	16(%r14), %rax
	movq	8(%r14), %rbx
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	0(%r13), %rax
	addq	$1, %rbx
	movq	24(%rax), %r12
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC303(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	jmp	.L3023
	.p2align 4,,10
	.p2align 3
.L2962:
	movq	48(%r15), %rsi
	testq	%rsi, %rsi
	je	.L3228
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm5
	movq	%rsi, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rax, 16(%r15)
	movups	%xmm5, 32(%r15)
.L2966:
	cmpl	$1, 24(%rsi)
	jne	.L3229
	movl	$40, %ecx
	call	alloc_memory
	movq	168(%rsp), %rdx
	movq	%rax, 88(%rsp)
	movq	%rdx, 32(%rax)
	movq	(%rsi), %rdx
	movq	136(%rsp), %rsi
	movq	8(%rsi), %rcx
	call	make_method_name
	movq	88(%rsp), %r9
	movq	%rbx, %r8
	movl	$2, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, 80(%rsp)
	movq	48(%r15), %rax
	testq	%rax, %rax
	je	.L2968
	movq	56(%r15), %rdx
	movdqu	64(%r15), %xmm5
	movq	%rax, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rdx, 16(%r15)
	movups	%xmm5, 32(%r15)
.L2969:
	cmpl	$5, 24(%rax)
	jne	.L2970
	movq	symbolList(%rip), %rsi
	cmpq	%rsi, (%rax)
	jne	.L2970
	movq	48(%r15), %rax
	testq	%rax, %rax
	je	.L2972
	movq	56(%r15), %rdx
	movdqu	64(%r15), %xmm3
	movq	%rax, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rdx, 16(%r15)
	movups	%xmm3, 32(%r15)
.L2973:
	cmpl	$6, 24(%rax)
	jne	.L2974
	movq	40+keywordList(%rip), %rsi
	cmpq	%rsi, (%rax)
	je	.L2975
.L2974:
	movq	16(%rax), %rsi
	movl	$2, %ecx
	leaq	1(%rsi), %rdx
	movq	8(%rax), %rsi
	movq	0(%r13), %rax
	movq	%rdx, 96(%rsp)
	movq	24(%rax), %r8
	addq	$1, %rsi
	movq	%r8, 120(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	96(%rsp), %rdx
	movq	120(%rsp), %r8
	movq	%rsi, %r9
	movq	%rax, %rcx
	movq	%rdx, 32(%rsp)
	leaq	.LC291(%rip), %rdx
	call	fprintf
.L2975:
	movq	48(%r15), %rsi
	testq	%rsi, %rsi
	je	.L2976
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm4
	movq	%rsi, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rax, 16(%r15)
	movups	%xmm4, 32(%r15)
.L2977:
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movq	%rax, 96(%rsp)
	movups	%xmm0, (%rax)
	testq	%r12, %r12
	je	.L3230
	call	alloc_memory.constprop.2
	movq	%rax, %rdx
	movq	136(%rsp), %rax
	movq	%r12, 8(%rdx)
	movq	%rax, (%rdx)
	movq	$0, 16(%rdx)
.L2979:
	movq	96(%rsp), %rcx
	call	list_append
	cmpl	$5, 24(%rsi)
	je	.L3231
	.p2align 4,,10
	.p2align 3
.L2980:
	movq	16(%rsi), %rax
	movq	8(%rsi), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rbx
	leaq	1(%rax), %r12
	movq	0(%r13), %rax
	addq	$1, %rsi
	movq	24(%rax), %r8
	movq	%r8, 168(%rsp)
	call	*%rbx
	movq	%r12, 32(%rsp)
	movq	%rsi, %r9
	movq	168(%rsp), %r8
	movq	%rax, %rcx
	leaq	.LC292(%rip), %rdx
	call	fprintf
	.p2align 4,,10
	.p2align 3
.L2960:
	movq	16(%r14), %rax
	movq	8(%r14), %rsi
	movl	$2, %ecx
	leaq	1(%rax), %r12
	movq	0(%r13), %rax
	addq	$1, %rsi
	movq	24(%rax), %r14
	call	*%rbx
	movq	%r12, 32(%rsp)
	movq	%rsi, %r9
	leaq	.LC300(%rip), %rdx
	movq	%r14, %r8
	movq	%rax, %rcx
	call	fprintf
	call	alloc_memory.constprop.0
	movl	$2, %ecx
	movl	$0, 8(%rax)
	call	*%rbx
	movl	$1, %edx
	movl	$45, %r8d
	leaq	.LC301(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L3015:
	movq	128(%rsp), %rcx
	call	list_append
	jmp	.L3031
	.p2align 4,,10
	.p2align 3
.L3211:
	movq	$0, 8(%r12)
	jmp	.L3054
	.p2align 4,,10
	.p2align 3
.L3017:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 80(%r15)
	movq	%rax, %r14
	jmp	.L3018
	.p2align 4,,10
	.p2align 3
.L3027:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 80(%r15)
	jmp	.L3028
	.p2align 4,,10
	.p2align 3
.L3066:
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
	movq	%rax, %rcx
	call	create_expression.constprop.0
	movq	%rax, %rbx
	call	alloc_memory.constprop.0
	movq	88(%rsp), %rcx
	movl	$5, 8(%rax)
	movq	%rax, %rdx
	movq	%rbx, (%rax)
	call	list_append
	cmpq	$0, 80(%rsp)
	je	.L3232
	movq	120(%rsp), %rax
	movq	80(%rsp), %rsi
	movq	%rsi, (%rax)
	movq	136(%rsp), %rsi
	movq	%rsi, 8(%rax)
	movq	168(%rsp), %rsi
	movq	%rsi, 16(%rax)
	movq	88(%rsp), %rsi
	movq	%rsi, 24(%rax)
	call	alloc_memory.constprop.0
	movl	$0, 8(%rax)
	movq	%rax, %rdx
.L3077:
	movq	120(%rsp), %rax
	movq	128(%rsp), %rsi
	movq	%rax, (%rdx)
	movq	%rsi, %rcx
	call	list_append
	movq	136(%rsp), %rax
	movq	%rsi, 8(%rdi)
	movq	%rax, (%rdi)
	movq	144(%rsp), %rax
	movq	%rax, 16(%rdi)
	movq	112(%rsp), %rax
	movq	%rax, 24(%rdi)
	call	alloc_memory.constprop.0
	movl	$2, 8(%rax)
	movq	%rax, %rbx
	movq	%rdi, (%rax)
	jmp	.L3078
	.p2align 4,,10
	.p2align 3
.L3198:
	addq	$8, 112(%rsp)
	jmp	.L3023
	.p2align 4,,10
	.p2align 3
.L3035:
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L3038
	movl	$40, %ecx
	movq	168(%rsp), %rdi
	call	alloc_memory
	cmpb	$0, initialized(%rip)
	movq	%rax, 168(%rsp)
	jne	.L3089
	call	init.part.0
.L3089:
	movq	struct_memory(%rip), %rax
	movq	8(%rax), %r12
	leaq	16(%r12), %rdx
	cmpq	(%rax), %rdx
	jnb	.L3233
.L3040:
	testb	$7, %r12b
	jne	.L3234
	movq	%r12, %rbx
	movq	144(%rsp), %rdx
	addq	$16, %r12
	addq	$1, memoryBlockCount(%rip)
	andq	$-8, %rbx
	addq	24(%rax), %rbx
	cmpb	$0, initialized(%rip)
	movq	%r12, 8(%rax)
	movq	%rdx, (%rbx)
	je	.L3235
.L3042:
	leaq	16(%r12), %rdx
	cmpq	(%rax), %rdx
	jnb	.L3236
.L3043:
	testb	$7, %r12b
	jne	.L3237
	movq	%r12, %rdx
	addq	$16, %r12
	pxor	%xmm6, %xmm6
	movq	%rsi, %rcx
	movq	%r12, 8(%rax)
	andq	$-8, %rdx
	addq	24(%rax), %rdx
	movq	168(%rsp), %rax
	movups	%xmm6, (%rdx)
	movq	136(%rsp), %r8
	movq	%rdx, 8(%rbx)
	movl	$2, %edx
	movq	%rbx, 32(%rax)
	movq	%rax, %r9
	addq	$1, memoryBlockCount(%rip)
	call	create_symbol
	movq	%rax, %rbx
	call	alloc_memory.constprop.0
	movq	136(%rsp), %r8
	movl	$3, %edx
	movq	40+keywordList(%rip), %rcx
	movups	%xmm6, (%rax)
	movq	%rax, %r12
	movq	168(%rsp), %rax
	movq	32(%rax), %r9
	call	create_symbol
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L3238
	call	alloc_memory.constprop.2
	movq	%rax, %rdx
	movq	136(%rsp), %rax
	movq	%rsi, 8(%rdx)
	movq	%rax, (%rdx)
	movq	$0, 16(%rdx)
.L3046:
	movq	%r12, %rcx
	call	list_append
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movups	%xmm0, (%rax)
	xorl	%ecx, %ecx
	movq	%rsi, %r8
	movq	$0, 32(%rsp)
	movq	%rax, 120(%rsp)
	call	create_variable_access
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	movl	$8, %ecx
	call	create_primary
	movq	%rax, %rcx
	call	create_expression.constprop.0
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	$0, 40(%rsp)
	movl	$5, %ecx
	movq	%rax, 32(%rsp)
	call	create_statement
	movq	120(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	testq	%rbx, %rbx
	je	.L3239
	movq	168(%rsp), %rax
	movq	136(%rsp), %rsi
	movq	%rsi, 8(%rax)
	movq	120(%rsp), %rsi
	movq	%rbx, (%rax)
	movq	%r12, 16(%rax)
	movq	%rsi, 24(%rax)
	call	alloc_memory.constprop.0
	movl	$0, 8(%rax)
	movq	%rax, %rdx
.L3048:
	movq	168(%rsp), %rax
	movq	128(%rsp), %rcx
	movq	%rax, (%rdx)
	call	list_append
	jmp	.L3036
	.p2align 4,,10
	.p2align 3
.L3221:
	movq	48(%r15), %r12
	testq	%r12, %r12
	je	.L2917
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm4
	movq	%r12, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rax, 16(%r15)
	movl	24(%r12), %eax
	movups	%xmm4, 32(%r15)
	jmp	.L2909
	.p2align 4,,10
	.p2align 3
.L3202:
	call	alloc_memory.constprop.0
	movq	$0, (%rax)
	movq	%rax, %rsi
	call	alloc_memory.constprop.0
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
	jmp	.L2853
	.p2align 4,,10
	.p2align 3
.L2892:
	movq	(%rcx), %rdx
	jmp	.L2894
	.p2align 4,,10
	.p2align 3
.L2860:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	cmpl	$1, 24(%rax)
	movq	%rax, 80(%r15)
	jne	.L2861
	movq	48(%r15), %r14
	movq	(%rax), %rdi
	testq	%r14, %r14
	je	.L2865
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm3
	movq	%r14, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rax, 16(%r15)
	movups	%xmm3, 32(%r15)
.L2866:
	movq	$0, 144(%rsp)
	movl	24(%r14), %eax
	cmpl	$6, %eax
	je	.L3240
.L2867:
	movq	0(%r13), %rcx
	cmpl	$5, %eax
	jne	.L2868
	movq	72+symbolList(%rip), %rax
	cmpq	%rax, (%r14)
	jne	.L2868
	cmpq	$0, 144(%rsp)
	je	.L3241
	call	get_file_dir
	movq	144(%rsp), %rcx
	movq	%rax, %rdx
	call	absolute_path
	movq	%rax, 136(%rsp)
	movq	%rax, %rcx
.L2877:
	leaq	.LC264(%rip), %rdx
	call	fopen
	movq	__imp___acrt_iob_func(%rip), %rsi
	movl	$2, %ecx
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L3242
	call	*%rsi
	movq	136(%rsp), %r12
	leaq	.LC266(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	leaq	184(%rsp), %rdx
	movq	%rbx, %rcx
	movq	$0, 184(%rsp)
	call	read_source.constprop.0
	movq	%rbx, %rcx
	movq	%rax, 120(%rsp)
	call	fclose
	call	alloc_memory.constprop.1
	xorl	%edx, %edx
	movq	%r12, %rcx
	movq	%r12, 136(%rsp)
	movq	%rax, %rbx
	call	absolute_path
	movq	%rbx, %rcx
	movq	%rax, 24(%rbx)
	call	normalize_path
	call	alloc_memory.constprop.0
	xorl	%r9d, %r9d
	movl	$88, %ecx
	movq	184(%rsp), %r12
	movw	%r9w, 8(%rax)
	movq	%rbx, (%rax)
	movq	builtin_scope(%rip), %rbx
	movb	$0, 11(%rax)
	movq	%rax, 128(%rsp)
	call	alloc_memory
	movq	120(%rsp), %r9
	pxor	%xmm0, %xmm0
	movq	%rbx, %rdx
	movq	%r12, 24(%rax)
	movq	136(%rsp), %r12
	movq	%rax, %rcx
	movq	%r9, 8(%rax)
	movq	128(%rsp), %r8
	movq	$0, 16(%rax)
	movq	$0, 32(%rax)
	movq	$0, 40(%rax)
	movq	$0, 48(%rax)
	movq	$0, 72(%rax)
	movq	$0, 80(%rax)
	movq	%r12, (%rax)
	movups	%xmm0, 56(%rax)
	call	parse_code
	movl	$2, %ecx
	movq	%rax, %rbx
	call	*%rsi
	movq	%r12, %r8
	leaq	.LC267(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	testq	%rbx, %rbx
	je	.L3243
	movq	8(%rbx), %rdx
	testq	%rdx, %rdx
	je	.L2881
	movq	%rsi, 128(%rsp)
	movq	%rdx, %rsi
.L2885:
	movq	8(%rsi), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L2884
	jmp	.L2882
	.p2align 4,,10
	.p2align 3
.L3244:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L2882
.L2884:
	movq	8(%rbx), %r12
	movq	%rdi, %rdx
	movq	8(%r12), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L3244
	movq	160(%rsp), %rax
	movq	%r12, %rdx
	movq	8(%rax), %rcx
	call	list_append
.L2886:
	call	alloc_memory.constprop.0
	movq	%r12, (%rax)
	movq	%rax, %rsi
	movq	144(%rsp), %rax
	movq	%rax, 8(%rsi)
	call	alloc_memory.constprop.0
	movl	$0, 8(%rax)
	movq	%rax, %rbx
	movq	%rsi, (%rax)
	jmp	.L3078
	.p2align 4,,10
	.p2align 3
.L3240:
	movq	8+keywordList(%rip), %rax
	cmpq	%rax, (%r14)
	je	.L3172
	movq	0(%r13), %rcx
.L2868:
	movq	16(%r14), %rax
	movq	8(%r14), %rdi
	movq	24(%rcx), %rbx
	movq	__imp___acrt_iob_func(%rip), %rsi
	movl	$2, %ecx
	leaq	1(%rax), %r12
	addq	$1, %rdi
	call	*%rsi
	movq	%r12, 32(%rsp)
	movq	%rdi, %r9
	movq	%rbx, %r8
	movq	%rax, %rcx
	leaq	.LC261(%rip), %rdx
	call	fprintf
	jmp	.L2864
	.p2align 4,,10
	.p2align 3
.L2946:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 80(%r15)
	jmp	.L2947
	.p2align 4,,10
	.p2align 3
.L2890:
	movq	%r15, %rcx
	movl	$1, %edx
	call	next_token
	movq	%rax, 80(%r15)
	movq	%rax, %rcx
	jmp	.L2891
	.p2align 4,,10
	.p2align 3
.L2882:
	movq	(%rsi), %rsi
	testq	%rsi, %rsi
	jne	.L2885
	movq	128(%rsp), %rsi
.L2881:
	movl	$2, %ecx
	call	*%rsi
	movq	136(%rsp), %r9
	movq	%rdi, %r8
	leaq	.LC269(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L2879:
	movq	16(%r14), %rax
	movl	$2, %ecx
	leaq	1(%rax), %r12
	movq	8(%r14), %rax
	leaq	1(%rax), %rbx
	movq	0(%r13), %rax
	movq	24(%rax), %r14
	call	*%rsi
	movq	%r12, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC270(%rip), %rdx
	movq	%rax, %rcx
	movq	%r14, %r8
	call	fprintf
	movq	160(%rsp), %r9
	movl	$3, %edx
	movq	%rdi, %rcx
	movq	name_void(%rip), %r8
	call	create_symbol
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L2886
	movl	$2, %ecx
	call	*%rsi
	movl	$36, %r8d
	movl	$1, %edx
	leaq	.LC271(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L2864
	.p2align 4,,10
	.p2align 3
.L3215:
	movq	(%rax), %rdi
.L2865:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 80(%r15)
	movq	%rax, %r14
	jmp	.L2866
	.p2align 4,,10
	.p2align 3
.L2905:
	movq	16(%rax), %rdi
	movq	__imp___acrt_iob_func(%rip), %rsi
	movl	$2, %ecx
	leaq	1(%rdi), %rbx
	movq	8(%rax), %rdi
	movq	0(%r13), %rax
	movq	24(%rax), %r12
	addq	$1, %rdi
	call	*%rsi
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	leaq	.LC276(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	jmp	.L2895
	.p2align 4,,10
	.p2align 3
.L3218:
	movq	16(%r12), %rax
	movq	8(%r12), %rdi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rsi
	leaq	1(%rax), %rbx
	movq	0(%r13), %rax
	addq	$1, %rdi
	movq	24(%rax), %r12
	call	*%rsi
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	leaq	.LC275(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	jmp	.L2895
	.p2align 4,,10
	.p2align 3
.L3217:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 80(%r15)
	movq	%rax, %r12
	jmp	.L2901
	.p2align 4,,10
	.p2align 3
.L3212:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$46, %r8d
	movl	$1, %edx
	leaq	.LC226(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L3053
.L2955:
	movq	%r15, %rcx
	movl	$1, %edx
	call	next_token
	movq	%rax, 80(%r15)
	movq	%rax, %rcx
	jmp	.L2956
.L2970:
	movq	16(%rax), %rsi
	movq	__imp___acrt_iob_func(%rip), %rbx
	movl	$2, %ecx
	leaq	1(%rsi), %r12
	movq	8(%rax), %rsi
	movq	0(%r13), %rax
	movq	24(%rax), %r8
	addq	$1, %rsi
	movq	%r8, 168(%rsp)
	call	*%rbx
	movq	%r12, 32(%rsp)
	movq	%rsi, %r9
	movq	168(%rsp), %r8
	movq	%rax, %rcx
	leaq	.LC290(%rip), %rdx
	call	fprintf
	jmp	.L2960
.L3229:
	movq	16(%rsi), %rax
	movq	8(%rsi), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rbx
	leaq	1(%rax), %r12
	movq	0(%r13), %rax
	addq	$1, %rsi
	movq	24(%rax), %r8
	movq	%r8, 168(%rsp)
	call	*%rbx
	movq	%r12, 32(%rsp)
	movq	%rsi, %r9
	movq	168(%rsp), %r8
	movq	%rax, %rcx
	leaq	.LC289(%rip), %rdx
	call	fprintf
	jmp	.L2960
.L3228:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 80(%r15)
	movq	%rax, %rsi
	jmp	.L2966
.L2950:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 80(%r15)
	movq	%rax, %r14
	jmp	.L2952
	.p2align 4,,10
	.p2align 3
.L3073:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC135(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	xorl	%ecx, %ecx
	jmp	.L3200
.L2917:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 80(%r15)
	movq	%rax, %r12
	movl	24(%rax), %eax
	jmp	.L2909
.L3241:
	movq	%rdi, %rcx
	call	strlen
	cmpb	$0, initialized(%rip)
	leaq	4(%rax), %rdx
	je	.L3245
.L2876:
	leaq	.LC132(%rip), %rcx
	call	create_string_check.part.0
	movq	%rdi, %r8
	leaq	.LC262(%rip), %rdx
	movq	%rax, %rsi
	movq	%rax, %rcx
	call	sprintf
	movq	%rsi, %rcx
	leaq	.LC263(%rip), %rdx
	call	absolute_path
	movq	%rax, 136(%rsp)
	movq	%rax, %rcx
	jmp	.L2877
.L3024:
	addq	$1, 112(%rsp)
	jmp	.L3023
.L3245:
	movq	%rdx, 136(%rsp)
	call	init.part.0
	movq	136(%rsp), %rdx
	jmp	.L2876
.L3214:
	cmpb	$0, initialized(%rip)
	je	.L3246
.L3059:
	movq	all_string_list(%rip), %rax
	testq	%rax, %rax
	jne	.L3063
	jmp	.L3060
	.p2align 4,,10
	.p2align 3
.L3061:
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L3247
.L3063:
	cmpq	$2, 8(%rax)
	jne	.L3061
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L3061
	cmpb	$48, (%rdx)
	jne	.L3061
	cmpb	$0, 1(%rdx)
	cmove	%rdx, %rsi
	jmp	.L3061
.L2932:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 80(%r15)
	movq	%rax, %r12
	jmp	.L2926
.L3224:
	movq	%rax, 96(%rsp)
	movq	16(%r12), %rax
	movl	$2, %ecx
	movq	8(%r12), %r9
	leaq	1(%rax), %rdx
	movq	0(%r13), %rax
	addq	$1, %r9
	movq	%rdx, 112(%rsp)
	movq	%r9, 120(%rsp)
	movq	24(%rax), %r12
	call	*__imp___acrt_iob_func(%rip)
	movq	112(%rsp), %rdx
	movq	120(%rsp), %r9
	movq	%rax, %rcx
	movq	%r12, %r8
	movq	%rdx, 32(%rsp)
	leaq	.LC282(%rip), %rdx
	call	fprintf
	movq	96(%rsp), %r10
	jmp	.L2930
.L2968:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 80(%r15)
	jmp	.L2969
.L2907:
	movl	$1, %edx
	movq	%r15, %rcx
	movq	%r11, 144(%rsp)
	call	next_token
	movq	144(%rsp), %r11
	movq	%rax, 80(%r15)
	movq	%rax, %r12
	jmp	.L2908
.L3172:
	movq	48(%r15), %rax
	testq	%rax, %rax
	je	.L2869
	movq	56(%r15), %rdx
	movdqu	64(%r15), %xmm5
	movq	%rax, 80(%r15)
	cmpl	$4, 24(%rax)
	movq	$0, 48(%r15)
	movq	%rdx, 16(%r15)
	movups	%xmm5, 32(%r15)
	je	.L3248
.L2870:
	movq	16(%rax), %rdi
	movq	__imp___acrt_iob_func(%rip), %rsi
	movl	$2, %ecx
	leaq	1(%rdi), %rbx
	movq	8(%rax), %rdi
	movq	0(%r13), %rax
	movq	24(%rax), %r12
	addq	$1, %rdi
	call	*%rsi
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	leaq	.LC260(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	jmp	.L2864
.L3223:
	movq	%rax, 96(%rsp)
	movq	16(%r12), %rax
	movl	$2, %ecx
	movq	8(%r12), %r9
	leaq	1(%rax), %rdx
	movq	0(%r13), %rax
	addq	$1, %r9
	movq	%rdx, 112(%rsp)
	movq	%r9, 120(%rsp)
	movq	24(%rax), %r12
	call	*__imp___acrt_iob_func(%rip)
	movq	112(%rsp), %rdx
	movq	120(%rsp), %r9
	movq	%rax, %rcx
	movq	%r12, %r8
	movq	%rdx, 32(%rsp)
	leaq	.LC281(%rip), %rdx
	call	fprintf
	movq	96(%rsp), %r10
	jmp	.L2931
.L3231:
	movq	%rbx, 64(%rsp)
	movq	__imp___acrt_iob_func(%rip), %r12
	movq	%rsi, %rax
	.p2align 4,,10
	.p2align 3
.L2981:
	movq	(%rax), %rdx
	cmpq	8+symbolList(%rip), %rdx
	je	.L3249
	cmpq	%rdx, 32+symbolList(%rip)
	jne	.L2982
	movq	48(%r15), %rbx
	testq	%rbx, %rbx
	je	.L2983
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm4
	movq	%rbx, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rax, 16(%r15)
	movups	%xmm4, 32(%r15)
.L2984:
	movq	168(%rsp), %rdx
	movq	%r13, %r8
	movq	%r15, %rcx
	call	parse_variable
	testq	%rax, %rax
	je	.L3250
	cmpq	$0, 16(%rax)
	je	.L2990
	movq	16(%rbx), %rax
	movq	8(%rbx), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	0(%r13), %rax
	addq	$1, %r9
	movq	%r9, 120(%rsp)
	movq	24(%rax), %rbx
	call	*%r12
	movq	%rsi, 32(%rsp)
	movq	120(%rsp), %r9
	leaq	.LC294(%rip), %rdx
	movq	%rax, %rcx
	movq	%rbx, %r8
	call	fprintf
.L2989:
	movq	48(%r15), %rax
	testq	%rax, %rax
	je	.L2991
	movq	56(%r15), %rdx
	movdqu	64(%r15), %xmm5
	movq	%rax, 80(%r15)
	cmpl	$5, 24(%rax)
	movq	$0, 48(%r15)
	movq	%rdx, 16(%r15)
	movups	%xmm5, 32(%r15)
	je	.L2981
.L3184:
	movq	%rax, %rsi
	jmp	.L2980
	.p2align 4,,10
	.p2align 3
.L2983:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 80(%r15)
	movq	%rax, %rbx
	jmp	.L2984
	.p2align 4,,10
	.p2align 3
.L2991:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	cmpl	$5, 24(%rax)
	movq	%rax, 80(%r15)
	jne	.L3184
	jmp	.L2981
	.p2align 4,,10
	.p2align 3
.L2990:
	movq	96(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L2989
	.p2align 4,,10
	.p2align 3
.L3250:
	movq	16(%rbx), %rax
	movq	8(%rbx), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	0(%r13), %rax
	addq	$1, %r9
	movq	%r9, 120(%rsp)
	movq	24(%rax), %rbx
	call	*%r12
	movq	%rsi, 32(%rsp)
	movq	120(%rsp), %r9
	leaq	.LC293(%rip), %rdx
	movq	%rax, %rcx
	movq	%rbx, %r8
	call	fprintf
	jmp	.L2989
.L2982:
	cmpq	8+symbolList(%rip), %rdx
	movq	64(%rsp), %rbx
	movq	%rax, %rsi
	jne	.L2980
.L2995:
	movq	48(%r15), %rax
	testq	%rax, %rax
	je	.L3251
	movq	56(%r15), %rdx
	movdqu	64(%r15), %xmm0
	movq	%rax, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rdx, 16(%r15)
	movups	%xmm0, 32(%r15)
.L2996:
	cmpl	$5, 24(%rax)
	jne	.L2997
	movq	16+symbolList(%rip), %rsi
	cmpq	%rsi, (%rax)
	jne	.L2997
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movl	$257, %ecx
	movups	%xmm0, (%rax)
	movw	%cx, 8(%r13)
	movq	48(%r15), %r12
	movq	%rax, 120(%rsp)
	testq	%r12, %r12
	je	.L2999
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm0
	movq	%r12, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rax, 16(%r15)
	movups	%xmm0, 32(%r15)
.L3001:
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L3000:
	cmpl	$5, 24(%r12)
	jne	.L3008
.L3255:
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, (%r12)
	je	.L3252
.L3008:
	movq	168(%rsp), %rdx
	movq	%r13, %r8
	movq	%r15, %rcx
	call	parse_statement
	movq	%rax, %r10
	testq	%rax, %rax
	je	.L3253
	testb	%sil, %sil
	jne	.L3254
.L3004:
	cmpl	$5, 8(%r10)
	movl	$1, %eax
	cmove	%eax, %esi
.L3005:
	movq	120(%rsp), %rcx
	movq	%r10, %rdx
	call	list_append
	movq	48(%r15), %r12
	testq	%r12, %r12
	je	.L3006
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm5
	movq	%r12, 80(%r15)
	cmpl	$5, 24(%r12)
	movq	$0, 48(%r15)
	movq	%rax, 16(%r15)
	movups	%xmm5, 32(%r15)
	je	.L3255
	jmp	.L3008
	.p2align 4,,10
	.p2align 3
.L3006:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 80(%r15)
	movq	%rax, %r12
	jmp	.L3000
	.p2align 4,,10
	.p2align 3
.L3254:
	movq	%rax, 48(%rsp)
	movq	16(%r12), %rax
	movl	$2, %ecx
	movq	8(%r12), %r12
	leaq	1(%rax), %rdx
	movq	0(%r13), %rax
	movq	%rdx, 56(%rsp)
	addq	$1, %r12
	movq	24(%rax), %r8
	movq	%r8, 64(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	56(%rsp), %rdx
	movq	64(%rsp), %r8
	movq	%r12, %r9
	movq	%rax, %rcx
	movq	%rdx, 32(%rsp)
	leaq	.LC282(%rip), %rdx
	call	fprintf
	movq	48(%rsp), %r10
	jmp	.L3004
.L3253:
	movq	%rax, 48(%rsp)
	movq	16(%r12), %rax
	movl	$2, %ecx
	movq	8(%r12), %r12
	leaq	1(%rax), %rdx
	movq	0(%r13), %rax
	movq	%rdx, 56(%rsp)
	addq	$1, %r12
	movq	24(%rax), %r8
	movq	%r8, 64(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	56(%rsp), %rdx
	movq	64(%rsp), %r8
	movq	%r12, %r9
	movq	%rax, %rcx
	movq	%rdx, 32(%rsp)
	leaq	.LC297(%rip), %rdx
	call	fprintf
	movq	48(%rsp), %r10
	jmp	.L3005
.L2997:
	movq	16(%rax), %rsi
	movq	__imp___acrt_iob_func(%rip), %rbx
	movl	$2, %ecx
	leaq	1(%rsi), %r12
	movq	8(%rax), %rsi
	movq	0(%r13), %rax
	movq	24(%rax), %r8
	addq	$1, %rsi
	movq	%r8, 168(%rsp)
	call	*%rbx
	movq	%r12, 32(%rsp)
	movq	%rsi, %r9
	movq	168(%rsp), %r8
	movq	%rax, %rcx
	leaq	.LC295(%rip), %rdx
	call	fprintf
	jmp	.L2960
.L2976:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 80(%r15)
	movq	%rax, %rsi
	jmp	.L2977
.L2972:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 80(%r15)
	jmp	.L2973
.L3252:
	xorl	%edx, %edx
	movw	%dx, 8(%r13)
	testb	%sil, %sil
	jne	.L3010
	cmpq	name_void(%rip), %rbx
	je	.L3012
	movq	16(%r12), %rax
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	8(%r12), %rax
	leaq	1(%rax), %r12
	movq	0(%r13), %rax
	movq	24(%rax), %r8
	movq	%r8, 64(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	%r12, %r9
	movq	64(%rsp), %r8
	movq	%rax, %rcx
	leaq	.LC298(%rip), %rdx
	call	fprintf
	cmpq	name_void(%rip), %rbx
	je	.L3012
.L3010:
	cmpq	$0, 80(%rsp)
	je	.L3256
	movq	88(%rsp), %rsi
	movq	80(%rsp), %rax
	movq	%rax, (%rsi)
	movq	96(%rsp), %rax
	movq	%rbx, 8(%rsi)
	movq	%rax, 16(%rsi)
	movq	120(%rsp), %rax
	movq	%rax, 24(%rsi)
	movq	168(%rsp), %rax
	movq	%rax, 32(%rsi)
	call	alloc_memory.constprop.0
	movl	$0, 8(%rax)
	movq	%rax, %rdx
	movq	%rsi, (%rax)
	jmp	.L3015
.L2923:
	movq	16(%rax), %rdi
	movq	__imp___acrt_iob_func(%rip), %rsi
	movl	$2, %ecx
	leaq	1(%rdi), %rbx
	movq	8(%rax), %rdi
	movq	0(%r13), %rax
	movq	24(%rax), %r12
	addq	$1, %rdi
	call	*%rsi
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	leaq	.LC280(%rip), %rdx
	movq	%rax, %rcx
	movq	%r12, %r8
	call	fprintf
	jmp	.L2895
.L3232:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$1, %edx
	movl	$51, %r8d
	leaq	.LC299(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	call	alloc_memory.constprop.0
	movl	$0, 8(%rax)
	movq	%rax, %rdx
	jmp	.L3077
.L3251:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 80(%r15)
	jmp	.L2996
.L3230:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$1, %edx
	movl	$46, %r8d
	leaq	.LC226(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	xorl	%edx, %edx
	jmp	.L2979
.L3249:
	movq	64(%rsp), %rbx
	jmp	.L2995
.L3242:
	call	*%rsi
	movq	136(%rsp), %r8
	leaq	.LC265(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L2879
.L3222:
	cmpb	$0, 128(%rsp)
	movq	%rbx, %r11
	movb	$0, 8(%r13)
	movq	%r12, %rbx
	movq	%r14, %r10
	jne	.L2936
	cmpq	name_void(%rip), %rsi
	je	.L2938
	movq	16(%r12), %rax
	movq	%r14, 120(%rsp)
	movl	$2, %ecx
	movq	%r11, 128(%rsp)
	leaq	1(%rax), %r12
	movq	8(%rbx), %rax
	leaq	1(%rax), %rbx
	movq	0(%r13), %rax
	movq	24(%rax), %r14
	call	*__imp___acrt_iob_func(%rip)
	movq	%r12, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC283(%rip), %rdx
	movq	%rax, %rcx
	movq	%r14, %r8
	call	fprintf
	cmpq	name_void(%rip), %rsi
	movq	120(%rsp), %r10
	movq	128(%rsp), %r11
	je	.L2938
.L2936:
	cmpq	$0, 136(%rsp)
	je	.L3257
	movq	136(%rsp), %rax
	movq	%rsi, 8(%r11)
	movq	%r10, 24(%r11)
	movq	%rax, (%r11)
	movq	144(%rsp), %rax
	movq	%rdi, 32(%r11)
	movq	%rax, 16(%r11)
	movq	%r11, 168(%rsp)
	call	alloc_memory.constprop.0
	movq	168(%rsp), %r11
	movl	$1, 8(%rax)
	movq	%rax, %rbx
	movq	%r11, (%rax)
	jmp	.L3078
.L3243:
	movl	$2, %ecx
	call	*%rsi
	movq	136(%rsp), %r8
	leaq	.LC268(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L2879
.L2869:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	cmpl	$4, 24(%rax)
	movq	%rax, 80(%r15)
	jne	.L2870
	movq	(%rax), %rax
	movq	48(%r15), %r14
	movq	%rax, 144(%rsp)
	testq	%r14, %r14
	je	.L2873
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm5
	movq	%r14, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rax, 16(%r15)
	movl	24(%r14), %eax
	movups	%xmm5, 32(%r15)
	jmp	.L2867
.L3236:
	movl	$1, %ecx
	call	increase_memory_size
	movq	struct_memory(%rip), %rax
	movq	8(%rax), %r12
	jmp	.L3043
.L3233:
	movl	$1, %ecx
	call	increase_memory_size
	movq	struct_memory(%rip), %rax
	movq	8(%rax), %r12
	jmp	.L3040
.L3235:
	call	init.part.0
	movq	struct_memory(%rip), %rax
	movq	8(%rax), %r12
	jmp	.L3042
.L3248:
	movq	(%rax), %rax
	movq	%rax, 144(%rsp)
.L2873:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 80(%r15)
	movq	%rax, %r14
	movl	24(%rax), %eax
	jmp	.L2867
.L2921:
	movl	$1, %edx
	movq	%r15, %rcx
	movq	%r11, 128(%rsp)
	call	next_token
	movq	128(%rsp), %r11
	movq	%rax, 80(%r15)
	jmp	.L2922
.L2999:
	movl	$1, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 80(%r15)
	movq	%rax, %r12
	jmp	.L3001
.L3247:
	testq	%rsi, %rsi
	je	.L3060
.L3064:
	movq	%rsi, %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movq	$0, 32(%rsp)
	call	create_primary
	movq	%rax, %rcx
	call	create_expression.constprop.0
	movq	%rax, %rsi
	jmp	.L3058
.L3012:
	call	alloc_memory.constprop.0
	movq	120(%rsp), %rcx
	movl	$5, 8(%rax)
	movq	%rax, %rdx
	movq	$0, (%rax)
	call	list_append
	jmp	.L3010
.L3238:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$1, %edx
	movl	$46, %r8d
	leaq	.LC226(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	xorl	%edx, %edx
	jmp	.L3046
.L2925:
	movl	$1, %edx
	movq	%r15, %rcx
	movq	%rax, 120(%rsp)
	movq	%r11, 128(%rsp)
	call	next_token
	movq	128(%rsp), %r11
	movq	120(%rsp), %r10
	movq	%rax, 80(%r15)
	movq	%rax, %rbx
	jmp	.L2927
.L2938:
	movq	%r10, 128(%rsp)
	movq	%r11, 120(%rsp)
	call	alloc_memory.constprop.0
	movq	128(%rsp), %rcx
	movl	$5, 8(%rax)
	movq	%rax, %rdx
	movq	$0, (%rax)
	call	list_append
	movq	128(%rsp), %r10
	movq	120(%rsp), %r11
	jmp	.L2936
.L3060:
	movl	$2, %edx
	leaq	.LC307(%rip), %rcx
	call	create_string_check.part.0
	movq	%rax, %rsi
	jmp	.L3064
.L3246:
	call	init.part.0
	jmp	.L3059
.L3239:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$1, %edx
	movl	$51, %r8d
	leaq	.LC299(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	call	alloc_memory.constprop.0
	movl	$0, 8(%rax)
	movq	%rax, %rdx
	jmp	.L3048
.L3256:
	movq	__imp___acrt_iob_func(%rip), %rbx
	movl	$2, %ecx
	call	*%rbx
	movl	$51, %r8d
	movl	$1, %edx
	leaq	.LC299(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L2960
.L3257:
	movq	__imp___acrt_iob_func(%rip), %rsi
	movl	$2, %ecx
	call	*%rsi
	movl	$53, %r8d
	movl	$1, %edx
	leaq	.LC284(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L2895
.L3234:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%r12, %r8
	leaq	.LC93(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
.L3237:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%r12, %r8
	leaq	.LC93(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
	.section	.text.unlikely,"x"
	.def	parse_code.cold;	.scl	3;	.type	32;	.endef
parse_code.cold:
.L3169:
	movq	16(%r14), %rax
	movq	8(%r14), %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rdi
	leaq	1(%rax), %rsi
	movq	0(%r13), %rax
	addq	$1, %rbx
	movq	24(%rax), %r12
	call	*%rdi
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	leaq	.LC302(%rip), %rdx
	movq	%r12, %r8
	movq	%rax, %rcx
	call	fprintf
	call	alloc_memory.constprop.0
	movl	$2, %ecx
	movl	$1, 8(%rax)
	call	*%rdi
	movl	$45, %r8d
	movl	$1, %edx
	leaq	.LC301(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	movq	128(%rsp), %rcx
	xorl	%edx, %edx
	call	list_append
	movl	8, %eax
	ud2
	.text
	.section	.text.unlikely,"x"
.LCOLDE313:
	.text
.LHOTE313:
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC314:
	.ascii "NULL\0"
.LC315:
	.ascii "Usage: %s <filename>\12\0"
.LC316:
	.ascii "Error opening file: %s\12\0"
.LC317:
	.ascii ".token\0"
.LC318:
	.ascii "w\0"
.LC319:
	.ascii "\12info by lib:\12    %s\12\0"
	.align 8
.LC320:
	.ascii "Token(Type: EOF,         Line: %zu, Column: %zu)\12\0"
	.align 8
.LC321:
	.ascii "Token(Type: identifier,  Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC322:
	.ascii "Token(Type: integer,     Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC323:
	.ascii "Token(Type: float,       Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC324:
	.ascii "Token(Type: string,      Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC325:
	.ascii "Token(Type: symbol,      Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC326:
	.ascii "Token(Type: keyword,     Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC327:
	.ascii "Token(Type: comment,     Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC328:
	.ascii "\\0\0"
.LC329:
	.ascii "\\n\0"
.LC330:
	.ascii "\\t\0"
.LC331:
	.ascii "\\r\0"
.LC332:
	.ascii "'\12\0"
.LC333:
	.ascii ".ast\0"
.LC334:
	.ascii ".tc\0"
.LC335:
	.ascii ".tac\0"
.LC336:
	.ascii "import\12\0"
.LC337:
	.ascii "source: \"%s\"\12\0"
.LC338:
	.ascii "parameters\12\0"
.LC339:
	.ascii "parameters[%d]\12\0"
.LC340:
	.ascii "class\12\0"
.LC341:
	.ascii "members\12\0"
.LC342:
	.ascii "method\12\0"
.LC343:
	.ascii "variable\12\0"
.LC344:
	.ascii "unknown_ClassMemberType: %u\12\0"
.LC345:
	.ascii "unknown_CodeMemberType: %u\12\0"
.LC346:
	.ascii "main\0"
	.align 8
.LC347:
	.ascii "[Warning] Unsupported symbol kind for import: %d\12\0"
	.section	.text.startup,"x"
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
	subq	$32, %rsp
	andq	$-16, %rsp
	subq	$144, %rsp
	movups	%xmm6, 144(%rsp)
	movups	%xmm7, 160(%rsp)
	call	__main
	cmpl	$1, %esi
	jle	.L3662
	cmpb	$0, initialized(%rip)
	jne	.L3261
	call	init.part.0
.L3261:
	movq	8(%rbx), %rsi
	call	alloc_memory.constprop.1
	xorl	%edx, %edx
	movq	%rsi, %rcx
	movq	%rax, %rbx
	call	absolute_path
	movq	%rbx, %rcx
	movq	%rax, 24(%rbx)
	call	normalize_path
	movq	24(%rbx), %rdi
	leaq	.LC264(%rip), %rdx
	movq	$0, 104(%rsp)
	movq	%rdi, %rcx
	call	fopen
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L3663
	leaq	104(%rsp), %rdx
	movq	%rax, %rcx
	movq	%rdi, %xmm6
	call	read_source.constprop.0
	movq	%rsi, %rcx
	movq	%rax, %xmm2
	punpcklqdq	%xmm2, %xmm6
	call	fclose
	movq	104(%rsp), %rsi
	movl	$88, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movl	$6, %edx
	leaq	.LC317(%rip), %rcx
	movq	%rsi, 24(%rax)
	movq	%rax, %r15
	movq	$0, 16(%rax)
	movq	$0, 32(%rax)
	movq	$0, 40(%rax)
	movq	$0, 48(%rax)
	movq	$0, 72(%rax)
	movq	$0, 80(%rax)
	movups	%xmm0, 56(%rax)
	movups	%xmm6, (%rax)
	call	create_string_check.constprop.0
	movq	%rbx, %rcx
	movq	%rax, 8(%rbx)
	call	rebuild_full_path
	movq	24(%rbx), %rsi
	leaq	.LC318(%rip), %rdx
	movq	%rsi, %rcx
	call	fopen
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L3664
	movq	48(%r15), %rdi
	testq	%rdi, %rdi
	je	.L3266
	movq	56(%r15), %rax
	xorl	%esi, %esi
	movdqu	64(%r15), %xmm3
	movq	%rdi, 80(%r15)
	movq	%rsi, 48(%r15)
	movq	%rax, 16(%r15)
	movups	%xmm3, 32(%r15)
.L3267:
	movq	%rbx, 80(%rsp)
	leaq	.LC331(%rip), %r14
	.p2align 4,,10
	.p2align 3
.L3289:
	cmpl	$7, 24(%rdi)
	ja	.L3269
	movl	24(%rdi), %eax
	leaq	.L3271(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	movq	16(%rdi), %rdx
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L3271:
	.long	.L3278-.L3271
	.long	.L3277-.L3271
	.long	.L3276-.L3271
	.long	.L3275-.L3271
	.long	.L3274-.L3271
	.long	.L3273-.L3271
	.long	.L3272-.L3271
	.long	.L3270-.L3271
	.section	.text.startup,"x"
.L3272:
	movq	8(%rdi), %rax
	leaq	1(%rdx), %r9
	movq	%r12, %rcx
	leaq	.LC326(%rip), %rdx
	leaq	1(%rax), %r8
	call	fprintf
	.p2align 4,,10
	.p2align 3
.L3269:
	xorl	%esi, %esi
	leaq	.LC328(%rip), %r13
	jmp	.L3280
	.p2align 4,,10
	.p2align 3
.L3281:
	cmpb	$10, %cl
	je	.L3665
	cmpb	$9, %cl
	je	.L3666
	cmpb	$13, %cl
	je	.L3667
	movq	%r12, %rdx
	call	fputc
.L3282:
	addq	$1, %rsi
.L3280:
	movq	(%rdi), %rbx
	movq	%rbx, %rcx
	call	strlen
	cmpq	%rax, %rsi
	jnb	.L3668
	movsbl	(%rbx,%rsi), %ecx
	testb	%cl, %cl
	jne	.L3281
	movq	%r12, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%r13, %rcx
	call	fwrite
	jmp	.L3282
.L3274:
	movq	8(%rdi), %rax
	leaq	1(%rdx), %r9
	movq	%r12, %rcx
	leaq	.LC324(%rip), %rdx
	leaq	1(%rax), %r8
	call	fprintf
	jmp	.L3269
.L3275:
	movq	8(%rdi), %rax
	leaq	1(%rdx), %r9
	movq	%r12, %rcx
	leaq	.LC323(%rip), %rdx
	leaq	1(%rax), %r8
	call	fprintf
	jmp	.L3269
.L3273:
	movq	8(%rdi), %rax
	leaq	1(%rdx), %r9
	movq	%r12, %rcx
	leaq	.LC325(%rip), %rdx
	leaq	1(%rax), %r8
	call	fprintf
	jmp	.L3269
.L3276:
	movq	8(%rdi), %rax
	leaq	1(%rdx), %r9
	movq	%r12, %rcx
	leaq	.LC322(%rip), %rdx
	leaq	1(%rax), %r8
	call	fprintf
	jmp	.L3269
.L3277:
	movq	8(%rdi), %rax
	leaq	1(%rdx), %r9
	movq	%r12, %rcx
	leaq	.LC321(%rip), %rdx
	leaq	1(%rax), %r8
	call	fprintf
	jmp	.L3269
.L3278:
	movq	8(%rdi), %rax
	leaq	1(%rdx), %r9
	movq	%r12, %rcx
	leaq	.LC320(%rip), %rdx
	leaq	1(%rax), %r8
	call	fprintf
	movl	24(%rdi), %ebx
	testl	%ebx, %ebx
	je	.L3646
	.p2align 4,,10
	.p2align 3
.L3672:
	movq	48(%r15), %rdi
	testq	%rdi, %rdi
	je	.L3287
	movq	56(%r15), %rax
	movdqu	64(%r15), %xmm1
	movq	%rdi, 80(%r15)
	movq	$0, 48(%r15)
	movq	%rax, 16(%r15)
	movups	%xmm1, 32(%r15)
	jmp	.L3289
.L3270:
	movq	8(%rdi), %rax
	leaq	1(%rdx), %r9
	movq	%r12, %rcx
	leaq	.LC327(%rip), %rdx
	leaq	1(%rax), %r8
	call	fprintf
	jmp	.L3269
.L3664:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, %r8
	leaq	.LC316(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L3265:
	movq	$0, 16(%r15)
	pxor	%xmm6, %xmm6
	movq	$0, 48(%r15)
	movq	$0, 72(%r15)
	movq	$0, 80(%r15)
	movups	%xmm6, 32(%r15)
	movups	%xmm6, 56(%r15)
	call	alloc_memory.constprop.0
	xorl	%r11d, %r11d
	movq	builtin_scope(%rip), %rdx
	movq	%r15, %rcx
	movw	%r11w, 8(%rax)
	movq	%rax, %r8
	movb	$0, 11(%rax)
	movq	%rbx, (%rax)
	call	parse_code
	movl	$4, %edx
	leaq	.LC333(%rip), %rcx
	movq	%rax, %r12
	call	create_string_check.constprop.0
	movq	%rbx, %rcx
	movq	%rax, 8(%rbx)
	call	rebuild_full_path
	movl	$3, %edx
	leaq	.LC334(%rip), %rcx
	movq	24(%rbx), %rsi
	call	create_string_check.constprop.0
	movq	%rbx, %rcx
	movq	%rax, 8(%rbx)
	call	rebuild_full_path
	leaq	.LC318(%rip), %rdx
	movq	%rsi, %rcx
	call	fopen
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L3669
	movq	(%r12), %rsi
	testq	%rsi, %rsi
	je	.L3457
	call	alloc_memory.constprop.0
	movq	%r12, 48(%rsp)
	movups	%xmm6, (%rax)
	movdqu	(%rsi), %xmm5
	movq	%rax, 72(%rsp)
	movq	%rbx, 40(%rsp)
	movups	%xmm5, 80(%rsp)
	movups	%xmm5, (%rax)
	.p2align 4,,10
	.p2align 3
.L3296:
	movq	72(%rsp), %rbx
	movq	(%rbx), %rax
	testq	%rax, %rax
	je	.L3653
	movq	(%rax), %rdx
	movq	%rdx, (%rbx)
	testq	%rdx, %rdx
	je	.L3670
.L3458:
	movq	8(%rax), %rsi
	testq	%rsi, %rsi
	je	.L3653
	movzbl	112(%rsp), %eax
	movl	8(%rsi), %edx
	movq	%rdi, %r9
	movl	$10, %r8d
	orl	$2, %eax
	movb	%al, 112(%rsp)
	cmpl	$1, %edx
	je	.L3297
	cmpl	$2, %edx
	je	.L3298
	testl	%edx, %edx
	movl	$1, %edx
	jne	.L3299
	leaq	.LC78(%rip), %rbx
	movq	%rbx, %rcx
	call	fwrite
	movq	%rdi, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC336(%rip), %rcx
	call	fwrite
	movzbl	112(%rsp), %eax
	movq	(%rsi), %r12
	movq	%rdi, %rcx
	leaq	.LC75(%rip), %rsi
	movl	%eax, %edx
	orl	$4, %edx
	testb	$2, %al
	movb	%dl, 112(%rsp)
	leaq	.LC76(%rip), %rdx
	cmovne	%rsi, %rdx
	call	fprintf
	movq	%rdi, %r9
	movl	$1, %edx
	movq	%rbx, %rcx
	movl	$10, %r8d
	call	fwrite
	movq	%rdi, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC95(%rip), %rcx
	call	fwrite
	movq	(%r12), %rcx
	leaq	112(%rsp), %r9
	movq	%rdi, %rdx
	movl	$3, %r8d
	call	output_name
	movzbl	112(%rsp), %eax
	movq	%rdi, %rcx
	movl	%eax, %edx
	andl	$-5, %edx
	testb	$2, %al
	movb	%dl, 112(%rsp)
	leaq	.LC76(%rip), %rdx
	cmovne	%rsi, %rdx
	call	fprintf
	movl	$10, %r8d
	movq	%rdi, %r9
	movl	$1, %edx
	leaq	.LC77(%rip), %rcx
	call	fwrite
	movq	8(%r12), %r8
	testq	%r8, %r8
	je	.L3671
.L3302:
	leaq	.LC337(%rip), %rdx
	movq	%rdi, %rcx
	call	fprintf
	jmp	.L3296
	.p2align 4,,10
	.p2align 3
.L3667:
	movq	%r12, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%r14, %rcx
	call	fwrite
	jmp	.L3282
	.p2align 4,,10
	.p2align 3
.L3665:
	movq	%r12, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC329(%rip), %rcx
	call	fwrite
	jmp	.L3282
	.p2align 4,,10
	.p2align 3
.L3668:
	movq	%r12, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC332(%rip), %rcx
	call	fwrite
	movl	24(%rdi), %ebx
	testl	%ebx, %ebx
	jne	.L3672
.L3646:
	movq	80(%rsp), %rbx
.L3268:
	call	get_info
	movq	%r12, %rcx
	leaq	.LC319(%rip), %rdx
	movq	%rax, %r8
	call	fprintf
	movq	%r12, %rcx
	call	fclose
	jmp	.L3265
	.p2align 4,,10
	.p2align 3
.L3666:
	movq	%r12, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC330(%rip), %rcx
	call	fwrite
	jmp	.L3282
	.p2align 4,,10
	.p2align 3
.L3287:
	xorl	%edx, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 80(%r15)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L3289
	jmp	.L3646
.L3653:
	movq	48(%rsp), %r12
	movq	40(%rsp), %rbx
.L3457:
	call	get_info
	movq	%rdi, %rcx
	leaq	.LC319(%rip), %rdx
	movq	%rax, %r8
	call	fprintf
	movq	%rdi, %rcx
	call	fclose
.L3294:
	movl	$4, %edx
	leaq	.LC335(%rip), %rcx
	call	create_string_check.constprop.0
	movq	%rbx, %rcx
	movq	%rax, 8(%rbx)
	call	rebuild_full_path
	movl	$3, %edx
	leaq	.LC334(%rip), %rcx
	movq	24(%rbx), %rsi
	call	create_string_check.constprop.0
	movq	%rbx, %rcx
	movq	%rax, 8(%rbx)
	call	rebuild_full_path
	leaq	.LC318(%rip), %rdx
	movq	%rsi, %rcx
	call	fopen
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L3673
	call	alloc_memory.constprop.1
	pxor	%xmm6, %xmm6
	xorl	%edi, %edi
	xorl	%r13d, %r13d
	movq	%rax, %rsi
	call	alloc_memory.constprop.0
	movups	%xmm6, (%rax)
	movq	%rdi, 8(%rsi)
	movq	%rax, (%rsi)
	call	alloc_memory.constprop.0
	movups	%xmm6, (%rax)
	movq	%rax, 16(%rsi)
	call	alloc_memory.constprop.0
	movl	$96, %ecx
	movups	%xmm6, (%rax)
	movq	%rax, 24(%rsi)
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rax, %rbx
	movq	%r13, 8(%rax)
	movq	%r13, 16(%rax)
	call	alloc_memory.constprop.0
	movups	%xmm6, (%rax)
	movq	%rax, 32(%rbx)
	call	alloc_memory.constprop.0
	movq	(%r12), %rdi
	movups	%xmm6, (%rax)
	movq	%rax, 40(%rbx)
	movups	%xmm6, 48(%rbx)
	movups	%xmm6, 64(%rbx)
	movups	%xmm6, 80(%rbx)
	testq	%rdi, %rdi
	je	.L3498
	call	alloc_memory.constprop.0
	movups	%xmm6, (%rax)
	movdqu	(%rdi), %xmm3
	movq	%rax, %r13
	pxor	%xmm6, %xmm6
	movups	%xmm3, (%rax)
	movq	%xmm3, %rax
	.p2align 4,,10
	.p2align 3
.L3462:
	testq	%rax, %rax
	je	.L3498
	movq	(%rax), %rdx
	movq	%rdx, 0(%r13)
	testq	%rdx, %rdx
	je	.L3674
.L3499:
	movq	8(%rax), %rdi
	testq	%rdi, %rdi
	je	.L3498
	movl	8(%rdi), %ecx
	cmpl	$1, %ecx
	je	.L3675
	cmpl	$2, %ecx
	je	.L3676
	movq	%rdx, %rax
	testl	%ecx, %ecx
	jne	.L3462
	movq	(%rdi), %rax
	movq	(%rax), %rcx
	movl	32(%rcx), %edi
	cmpl	$3, %edi
	je	.L3677
	leal	-1(%rdi), %eax
	cmpl	$1, %eax
	jbe	.L3678
	testl	%edi, %edi
	jne	.L3497
	movq	24(%rcx), %rcx
	movq	%rbx, %rdx
	call	tac_class
	movq	0(%r13), %rax
	jmp	.L3462
.L3674:
	xorl	%ecx, %ecx
	movq	%rcx, 8(%r13)
	jmp	.L3499
.L3498:
	movq	%r15, %rdx
	movq	%rsi, %rcx
	call	output_TAC.constprop.0
	call	get_info
	movq	%r15, %rcx
	leaq	.LC319(%rip), %rdx
	movq	%rax, %r8
	call	fprintf
	movq	%r15, %rcx
	call	fclose
.L3263:
	xorl	%eax, %eax
.L3258:
	movups	144(%rsp), %xmm6
	movups	160(%rsp), %xmm7
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
.L3675:
	movq	(%rdi), %r12
	movl	$40, %ecx
	movdqu	(%r12), %xmm7
	movq	%r12, 80(%rsp)
	call	alloc_memory
	movups	%xmm7, (%rax)
	movq	%rax, %r14
	call	alloc_memory.constprop.0
	movups	%xmm6, (%rax)
	movq	%rax, 16(%r14)
	call	alloc_memory.constprop.0
	movups	%xmm6, (%rax)
	movq	%rax, 24(%r14)
	call	alloc_memory.constprop.0
	movq	%r14, %rdx
	movups	%xmm6, (%rax)
	movq	%rax, 32(%r14)
	movq	(%rbx), %rax
	movq	%r14, 8(%rbx)
	movq	24(%rax), %rcx
	call	list_append
	movq	16(%r12), %rdx
	testq	%rdx, %rdx
	je	.L3485
	movq	%rdx, 72(%rsp)
	call	alloc_memory.constprop.0
	movq	72(%rsp), %rdx
	movq	%r15, 56(%rsp)
	movups	%xmm6, (%rax)
	movq	%rax, %r12
	movdqu	(%rdx), %xmm4
	movq	%r13, 48(%rsp)
	movq	%rdi, 40(%rsp)
	movq	%rsi, 32(%rsp)
	movups	%xmm4, (%rax)
.L3467:
	movq	(%r12), %rax
	testq	%rax, %rax
	je	.L3654
.L3682:
	movq	(%rax), %rdx
	movq	%rdx, (%r12)
	testq	%rdx, %rdx
	je	.L3679
.L3486:
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L3654
	movq	8(%rax), %rdi
	movq	(%rax), %r15
	testq	%rdi, %rdi
	je	.L3474
	movl	32(%r15), %esi
	xorl	%r13d, %r13d
	testl	%esi, %esi
	jne	.L3471
	movq	24(%r15), %rax
	movq	24(%rbx), %r13
	movq	%rax, 24(%rbx)
.L3471:
	movq	%rbx, %rdx
	movq	%rdi, %rcx
	call	search_var
	movl	32(%r15), %r11d
	movq	%rax, %rsi
	testl	%r11d, %r11d
	jne	.L3472
	movq	%r13, 24(%rbx)
.L3472:
	testq	%rsi, %rsi
	je	.L3474
	movq	16(%r14), %r15
	testq	%r15, %r15
	je	.L3680
.L3482:
	call	alloc_memory.constprop.0
	cmpq	$0, (%r15)
	movq	$0, (%rax)
	movq	%rsi, 8(%rax)
	je	.L3681
	movq	8(%r15), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%r15)
	movq	(%r12), %rax
	testq	%rax, %rax
	jne	.L3682
.L3654:
	movq	56(%rsp), %r15
	movq	48(%rsp), %r13
	movq	40(%rsp), %rdi
	movq	32(%rsp), %rsi
.L3485:
	movq	%rbx, %rcx
	call	create_var.part.0.constprop.0
	movq	%rax, 72(%rsp)
	call	alloc_memory.constprop.0
	movq	72(%rsp), %rdx
	movq	%rax, %r12
	movq	%rdx, (%rax)
	call	alloc_memory.constprop.0
	movq	32(%r14), %rcx
	movq	%r12, %rdx
	movups	%xmm6, (%rax)
	movq	%rax, 8(%r12)
	call	list_append
	movq	80(%rsp), %rax
	movq	%r12, 16(%rbx)
	movq	24(%rax), %r14
	testq	%r14, %r14
	je	.L3465
	call	alloc_memory.constprop.0
	movups	%xmm6, (%rax)
	movdqu	(%r14), %xmm5
	movq	%rax, %r12
	movups	%xmm5, (%rax)
	jmp	.L3490
	.p2align 4,,10
	.p2align 3
.L3491:
	movq	8(%rax), %rcx
	testq	%rcx, %rcx
	je	.L3465
.L3492:
	movq	%rbx, %rdx
	call	tac_statement
.L3490:
	movq	(%r12), %rax
	testq	%rax, %rax
	je	.L3465
	movq	(%rax), %rdx
	movq	%rdx, (%r12)
	testq	%rdx, %rdx
	jne	.L3491
	movq	8(%rax), %rcx
	xorl	%r8d, %r8d
	movq	%r8, 8(%r12)
	testq	%rcx, %rcx
	jne	.L3492
.L3465:
	movq	(%rdi), %rax
	xorl	%r9d, %r9d
	leaq	.LC346(%rip), %rdx
	movq	%r9, 8(%rbx)
	movq	(%rax), %rdi
	movq	8(%rdi), %rcx
	call	strcmp
	movl	%eax, %edx
	movq	0(%r13), %rax
	testl	%edx, %edx
	jne	.L3462
	movq	%rdi, 8(%rsi)
	jmp	.L3462
	.p2align 4,,10
	.p2align 3
.L3474:
	call	alloc_memory.constprop.2
	movq	56(%rbx), %r9
	cmpb	$0, initialized(%rip)
	movq	%rdi, (%rax)
	movq	%rax, %rsi
	leaq	1(%r9), %rax
	movq	%rax, 56(%rbx)
	je	.L3683
.L3470:
	movq	all_string_list(%rip), %rax
	testq	%rax, %rax
	je	.L3475
	xorl	%ecx, %ecx
	jmp	.L3477
	.p2align 4,,10
	.p2align 3
.L3476:
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L3684
.L3477:
	cmpq	$32, 8(%rax)
	jne	.L3476
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L3476
	movq	16(%rax), %rax
	cmpb	$0, (%rdx)
	cmove	%rdx, %rcx
	testq	%rax, %rax
	jne	.L3477
.L3684:
	testq	%rcx, %rcx
	je	.L3475
.L3478:
	movq	%rcx, 8(%rsi)
	movl	$112, %r8d
	cmpq	$-1, %r9
	je	.L3685
	leaq	.LC134(%rip), %rdx
	call	sprintf
.L3481:
	movq	%r15, 16(%rsi)
	movq	16(%r14), %r15
	testq	%r15, %r15
	jne	.L3482
.L3680:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC129(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L3467
.L3679:
	xorl	%r10d, %r10d
	movq	%r10, 8(%r12)
	jmp	.L3486
.L3681:
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm0
	movups	%xmm0, (%r15)
	jmp	.L3467
.L3475:
	movq	string_memory(%rip), %rax
	movq	8(%rax), %rdi
	leaq	32(%rdi), %rdx
	cmpq	(%rax), %rdx
	jnb	.L3686
.L3479:
	movq	8(%rax), %rdx
	movq	24(%rax), %rcx
	movq	%r9, 64(%rsp)
	movdqu	.LC132(%rip), %xmm5
	movdqu	16+.LC132(%rip), %xmm4
	addq	%rdx, %rcx
	addq	$33, %rdx
	movq	%rdx, 8(%rax)
	movb	$0, 32(%rcx)
	movups	%xmm5, (%rcx)
	movups	%xmm4, 16(%rcx)
	movq	%rcx, 72(%rsp)
	call	alloc_memory.constprop.2
	movq	72(%rsp), %rcx
	movq	64(%rsp), %r9
	movq	all_string_list(%rip), %rdx
	movq	$32, 8(%rax)
	movq	%rcx, (%rax)
	movq	%rdx, 16(%rax)
	movq	%rax, all_string_list(%rip)
	jmp	.L3478
.L3685:
	leaq	.LC133(%rip), %rdx
	call	sprintf
	jmp	.L3481
.L3676:
	movq	(%rdi), %rcx
	movq	%rbx, %rdx
	call	tac_class
	movq	0(%r13), %rax
	jmp	.L3462
.L3683:
	movq	%r9, 72(%rsp)
	call	init.part.0
	movq	72(%rsp), %r9
	jmp	.L3470
.L3670:
	xorl	%r14d, %r14d
	movq	%r14, 8(%rbx)
	jmp	.L3458
.L3673:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, %r8
	leaq	.LC316(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L3263
.L3299:
	leaq	.LC78(%rip), %rcx
	call	fwrite
	movl	8(%rsi), %r8d
	leaq	.LC345(%rip), %rdx
	movq	%rdi, %rcx
	call	fprintf
	jmp	.L3296
.L3298:
	leaq	.LC78(%rip), %rbx
	movl	$1, %edx
	leaq	112(%rsp), %r14
	movq	%rbx, %rcx
	leaq	.LC75(%rip), %r12
	call	fwrite
	movq	%rdi, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC340(%rip), %rcx
	call	fwrite
	movzbl	112(%rsp), %eax
	movq	(%rsi), %rsi
	movq	%rdi, %rcx
	movl	%eax, %edx
	orl	$4, %edx
	testb	$2, %al
	movb	%dl, 112(%rsp)
	leaq	.LC76(%rip), %rdx
	cmovne	%r12, %rdx
	call	fprintf
	movq	%rdi, %r9
	movl	$1, %edx
	movq	%rbx, %rcx
	movl	$10, %r8d
	call	fwrite
	movq	%rdi, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC95(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rcx
	movq	%r14, %r9
	movq	%rdi, %rdx
	movl	$3, %r8d
	call	output_name
	movzbl	112(%rsp), %eax
	movq	%rdi, %rcx
	movl	%eax, %edx
	andl	$-5, %edx
	testb	$2, %al
	movb	%dl, 112(%rsp)
	leaq	.LC76(%rip), %rdx
	cmovne	%r12, %rdx
	call	fprintf
	movq	%rdi, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC77(%rip), %rcx
	call	fwrite
	movq	%rdi, %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC341(%rip), %rcx
	call	fwrite
	movq	8(%rsi), %rsi
	testq	%rsi, %rsi
	je	.L3296
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%rsi), %xmm3
	movq	%rax, %r15
	movups	%xmm3, 80(%rsp)
	movq	%r14, 80(%rsp)
	movups	%xmm3, (%rax)
	.p2align 4,,10
	.p2align 3
.L3359:
	movq	(%r15), %rax
	testq	%rax, %rax
	je	.L3296
	movq	(%rax), %rdx
	movq	%rdx, (%r15)
	testq	%rdx, %rdx
	je	.L3687
.L3455:
	movq	8(%rax), %rsi
	testq	%rsi, %rsi
	je	.L3296
	movzbl	112(%rsp), %eax
	movl	8(%rsi), %edx
	movl	%eax, %ecx
	andl	$2, %eax
	orl	$8, %ecx
	testl	%edx, %edx
	je	.L3360
	subl	$1, %edx
	je	.L3361
	leaq	.LC75(%rip), %r12
	testb	%al, %al
	leaq	.LC76(%rip), %rdx
	movb	%cl, 112(%rsp)
	cmovne	%r12, %rdx
	movq	%rdi, %rcx
	call	fprintf
	testb	$4, 112(%rsp)
	leaq	.LC76(%rip), %rdx
	movq	%rdi, %rcx
	cmovne	%r12, %rdx
	call	fprintf
	movq	%rbx, %rcx
	movq	%rdi, %r9
	movl	$1, %edx
	movl	$10, %r8d
	call	fwrite
	movl	8(%rsi), %r8d
	leaq	.LC344(%rip), %rdx
	movq	%rdi, %rcx
	call	fprintf
	jmp	.L3359
.L3360:
	testb	%al, %al
	leaq	.LC75(%rip), %r12
	leaq	.LC76(%rip), %rdx
	movb	%cl, 112(%rsp)
	cmovne	%r12, %rdx
	movq	%rdi, %rcx
	call	fprintf
	testb	$4, 112(%rsp)
	leaq	.LC76(%rip), %rdx
	movq	%rdi, %rcx
	cmovne	%r12, %rdx
	call	fprintf
	movq	%rdi, %r9
	movl	$1, %edx
	movq	%rbx, %rcx
	movl	$10, %r8d
	call	fwrite
	movq	%rdi, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC342(%rip), %rcx
	call	fwrite
	movq	(%rsi), %r13
	orb	$16, 112(%rsp)
	movl	$1, %esi
	.p2align 4,,10
	.p2align 3
.L3368:
	movsbl	112(%rsp), %eax
	movq	%rdi, %r9
	btl	%esi, %eax
	jnc	.L3365
	movl	$6, %r8d
	movl	$1, %edx
	movq	%r12, %rcx
	addq	$1, %rsi
	call	fwrite
	cmpq	$4, %rsi
	jne	.L3368
.L3367:
	movq	%rdi, %r9
	movl	$1, %edx
	movq	%rbx, %rcx
	movl	$1, %esi
	movl	$10, %r8d
	leaq	.LC75(%rip), %r12
	call	fwrite
	movq	%rdi, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC95(%rip), %rcx
	call	fwrite
	movq	80(%rsp), %r9
	movq	0(%r13), %rcx
	movq	%rdi, %rdx
	movl	$5, %r8d
	call	output_name
	orb	$16, 112(%rsp)
	.p2align 4,,10
	.p2align 3
.L3372:
	movsbl	112(%rsp), %eax
	movq	%rdi, %r9
	btl	%esi, %eax
	jnc	.L3369
	movl	$6, %r8d
	movl	$1, %edx
	movq	%r12, %rcx
	addq	$1, %rsi
	call	fwrite
	cmpq	$4, %rsi
	jne	.L3372
.L3371:
	movq	%rdi, %r9
	movl	$1, %edx
	movq	%rbx, %rcx
	movl	$1, %esi
	movl	$10, %r8d
	leaq	.LC75(%rip), %r12
	call	fwrite
	movq	%rdi, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC86(%rip), %rcx
	call	fwrite
	movq	8(%r13), %rcx
	movq	80(%rsp), %r9
	movq	%rdi, %rdx
	movl	$5, %r8d
	call	output_name
	orb	$16, 112(%rsp)
	.p2align 4,,10
	.p2align 3
.L3376:
	movsbl	112(%rsp), %eax
	movq	%rdi, %r9
	btl	%esi, %eax
	jnc	.L3373
	movl	$6, %r8d
	movl	$1, %edx
	movq	%r12, %rcx
	addq	$1, %rsi
	call	fwrite
	cmpq	$4, %rsi
	jne	.L3376
.L3375:
	movq	%rdi, %r9
	movl	$10, %r8d
	movl	$1, %edx
	movq	%rbx, %rcx
	call	fwrite
	movq	%rdi, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC338(%rip), %rcx
	call	fwrite
	movq	16(%r13), %rsi
	testq	%rsi, %rsi
	je	.L3377
	call	alloc_memory.constprop.0
	pxor	%xmm6, %xmm6
	movq	24(%r13), %rdx
	movups	%xmm6, (%rax)
	movdqu	(%rsi), %xmm7
	movq	%rax, %r12
	movups	%xmm7, (%rax)
	testq	%rdx, %rdx
	je	.L3504
	movq	%rdx, 64(%rsp)
	call	alloc_memory.constprop.0
	movq	64(%rsp), %rdx
	movups	%xmm6, (%rax)
	movdqu	(%rdx), %xmm7
	movq	%rax, %rdx
	movups	%xmm7, (%rax)
.L3504:
	movq	%r15, 64(%rsp)
	orl	$-1, %r13d
	leaq	.LC75(%rip), %rsi
	movq	%rdx, 56(%rsp)
	.p2align 4,,10
	.p2align 3
.L3379:
	movq	(%r12), %rax
	testq	%rax, %rax
	je	.L3659
	movq	(%rax), %rdx
	movq	%rdx, (%r12)
	testq	%rdx, %rdx
	je	.L3688
.L3386:
	movq	8(%rax), %r14
	movzbl	112(%rsp), %eax
	testq	%r14, %r14
	je	.L3659
	orl	$32, %eax
	movl	$1, %r15d
	movb	%al, 112(%rsp)
	jmp	.L3383
	.p2align 4,,10
	.p2align 3
.L3689:
	movl	$6, %r8d
	movl	$1, %edx
	movq	%rsi, %rcx
	addq	$1, %r15
	call	fwrite
	cmpq	$5, %r15
	je	.L3382
.L3381:
	movzbl	112(%rsp), %eax
.L3383:
	movsbl	%al, %eax
	movq	%rdi, %r9
	btl	%r15d, %eax
	jc	.L3689
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC76(%rip), %rcx
	addq	$1, %r15
	call	fwrite
	cmpq	$5, %r15
	jne	.L3381
.L3382:
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$10, %r8d
	addl	$1, %r13d
	movl	$1, %edx
	call	fwrite
	movl	%r13d, %r8d
	movq	%rdi, %rcx
	leaq	.LC339(%rip), %rdx
	call	fprintf
	movq	80(%rsp), %r8
	movq	%rdi, %rdx
	movq	%r14, %rcx
	call	output_variable.constprop.1
	jmp	.L3379
	.p2align 4,,10
	.p2align 3
.L3373:
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC76(%rip), %rcx
	addq	$1, %rsi
	call	fwrite
	cmpq	$4, %rsi
	jne	.L3376
	jmp	.L3375
	.p2align 4,,10
	.p2align 3
.L3369:
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC76(%rip), %rcx
	addq	$1, %rsi
	call	fwrite
	cmpq	$4, %rsi
	jne	.L3372
	jmp	.L3371
	.p2align 4,,10
	.p2align 3
.L3365:
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC76(%rip), %rcx
	addq	$1, %rsi
	call	fwrite
	cmpq	$4, %rsi
	jne	.L3368
	jmp	.L3367
.L3688:
	xorl	%r8d, %r8d
	movq	%r8, 8(%r12)
	jmp	.L3386
.L3361:
	leaq	.LC75(%rip), %r12
	testb	%al, %al
	leaq	.LC76(%rip), %rdx
	movb	%cl, 112(%rsp)
	cmovne	%r12, %rdx
	movq	%rdi, %rcx
	call	fprintf
	testb	$4, 112(%rsp)
	leaq	.LC76(%rip), %rdx
	movq	%rdi, %rcx
	cmovne	%r12, %rdx
	call	fprintf
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$1, %edx
	movl	$10, %r8d
	call	fwrite
	movq	%rdi, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC343(%rip), %rcx
	call	fwrite
	movq	80(%rsp), %r8
	movq	(%rsi), %rcx
	movq	%rdi, %rdx
	call	output_variable.constprop.0
	jmp	.L3359
.L3687:
	xorl	%edx, %edx
	movq	%rdx, 8(%r15)
	jmp	.L3455
.L3297:
	leaq	.LC78(%rip), %rbx
	movl	$1, %edx
	leaq	112(%rsp), %r14
	movq	%rbx, %rcx
	leaq	.LC75(%rip), %r12
	call	fwrite
	movq	%rdi, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC97(%rip), %rcx
	call	fwrite
	movzbl	112(%rsp), %eax
	movq	(%rsi), %rsi
	movq	%rdi, %rcx
	movl	%eax, %edx
	orl	$4, %edx
	testb	$2, %al
	movb	%dl, 112(%rsp)
	leaq	.LC76(%rip), %rdx
	cmovne	%r12, %rdx
	call	fprintf
	movq	%rdi, %r9
	movl	$1, %edx
	movq	%rbx, %rcx
	movl	$10, %r8d
	call	fwrite
	movq	%rdi, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC95(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rcx
	movq	%r14, %r9
	movq	%rdi, %rdx
	movl	$3, %r8d
	call	output_name
	movzbl	112(%rsp), %eax
	movq	%rdi, %rcx
	movl	%eax, %edx
	orl	$4, %edx
	testb	$2, %al
	movb	%dl, 112(%rsp)
	leaq	.LC76(%rip), %rdx
	cmovne	%r12, %rdx
	call	fprintf
	movq	%rdi, %r9
	movl	$1, %edx
	movq	%rbx, %rcx
	movl	$10, %r8d
	call	fwrite
	movq	%rdi, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC86(%rip), %rcx
	call	fwrite
	movq	8(%rsi), %rcx
	movq	%r14, %r9
	movq	%rdi, %rdx
	movl	$3, %r8d
	call	output_name
	movzbl	112(%rsp), %eax
	movq	%rdi, %rcx
	movl	%eax, %edx
	orl	$4, %edx
	testb	$2, %al
	movb	%dl, 112(%rsp)
	leaq	.LC76(%rip), %rdx
	cmovne	%r12, %rdx
	call	fprintf
	movq	%rdi, %r9
	movl	$1, %edx
	movq	%rbx, %rcx
	movl	$10, %r8d
	call	fwrite
	movq	%rdi, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC338(%rip), %rcx
	call	fwrite
	movq	16(%rsi), %r13
	testq	%r13, %r13
	je	.L3307
	call	alloc_memory.constprop.0
	pxor	%xmm6, %xmm6
	movq	24(%rsi), %rsi
	movups	%xmm6, (%rax)
	movdqu	0(%r13), %xmm2
	movq	%rax, %r15
	movups	%xmm2, (%rax)
	testq	%rsi, %rsi
	je	.L3507
	call	alloc_memory.constprop.0
	movups	%xmm6, (%rax)
	movdqu	(%rsi), %xmm7
	movq	%rax, %rsi
	movups	%xmm7, (%rax)
.L3507:
	movq	%rsi, 80(%rsp)
	orl	$-1, %r12d
	leaq	.LC75(%rip), %r13
	movq	%r15, %rsi
	jmp	.L3309
	.p2align 4,,10
	.p2align 3
.L3315:
	movq	8(%rax), %r15
	movzbl	112(%rsp), %eax
	movl	%eax, %edx
	andl	$2, %edx
	testq	%r15, %r15
	je	.L3690
	orl	$8, %eax
	testb	%dl, %dl
	leaq	.LC76(%rip), %rdx
	movq	%rdi, %rcx
	cmovne	%r13, %rdx
	movb	%al, 112(%rsp)
	call	fprintf
	testb	$4, 112(%rsp)
	leaq	.LC76(%rip), %rdx
	movq	%rdi, %rcx
	cmovne	%r13, %rdx
	addl	$1, %r12d
	call	fprintf
	movq	%rdi, %r9
	movl	$1, %edx
	movq	%rbx, %rcx
	movl	$10, %r8d
	call	fwrite
	movl	%r12d, %r8d
	leaq	.LC339(%rip), %rdx
	movq	%rdi, %rcx
	call	fprintf
	movq	%r14, %r8
	movq	%rdi, %rdx
	movq	%r15, %rcx
	call	output_variable.constprop.0
.L3309:
	movq	(%rsi), %rax
	testq	%rax, %rax
	je	.L3691
	movq	(%rax), %rdx
	movq	%rdx, (%rsi)
	testq	%rdx, %rdx
	jne	.L3315
	xorl	%r10d, %r10d
	movq	%r10, 8(%rsi)
	jmp	.L3315
.L3663:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, %r8
	leaq	.LC316(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L3263
.L3662:
	movq	(%rbx), %rbx
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC315(%rip), %rdx
	movq	%rax, %rcx
	movq	%rbx, %r8
	call	fprintf
	movl	$1, %eax
	jmp	.L3258
.L3266:
	xorl	%edx, %edx
	movq	%r15, %rcx
	call	next_token
	movq	%rax, 80(%r15)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L3267
	jmp	.L3268
.L3659:
	movq	64(%rsp), %r15
	movq	56(%rsp), %rdx
.L3505:
	movq	%rdx, %r12
.L3385:
	andb	$-17, 112(%rsp)
	movl	$1, %esi
	leaq	.LC75(%rip), %r13
	.p2align 4,,10
	.p2align 3
.L3392:
	movsbl	112(%rsp), %eax
	movq	%rdi, %r9
	btl	%esi, %eax
	jnc	.L3389
	movl	$6, %r8d
	movl	$1, %edx
	movq	%r13, %rcx
	addq	$1, %rsi
	call	fwrite
	cmpq	$4, %rsi
	jne	.L3392
.L3391:
	movq	%rdi, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC77(%rip), %rcx
	call	fwrite
	movq	%rdi, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC176(%rip), %rcx
	call	fwrite
	testq	%r12, %r12
	je	.L3359
	.p2align 4,,10
	.p2align 3
.L3393:
	movq	(%r12), %rax
	testq	%rax, %rax
	je	.L3359
	movq	(%rax), %rdx
	movq	%rdx, (%r12)
	testq	%rdx, %rdx
	je	.L3692
.L3449:
	movq	8(%rax), %rsi
	testq	%rsi, %rsi
	je	.L3359
	movzbl	112(%rsp), %edx
	orl	$32, %edx
	cmpl	$7, 8(%rsi)
	ja	.L3395
	movl	8(%rsi), %eax
	leaq	.L3397(%rip), %rcx
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L3397:
	.long	.L3404-.L3397
	.long	.L3403-.L3397
	.long	.L3402-.L3397
	.long	.L3401-.L3397
	.long	.L3400-.L3397
	.long	.L3399-.L3397
	.long	.L3398-.L3397
	.long	.L3396-.L3397
	.section	.text.startup,"x"
.L3398:
	movb	%dl, 112(%rsp)
	movl	$1, %esi
	leaq	.LC76(%rip), %r14
	leaq	.LC75(%rip), %r13
	.p2align 4,,10
	.p2align 3
.L3432:
	movsbl	112(%rsp), %eax
	movq	%rdi, %r9
	btl	%esi, %eax
	jnc	.L3429
	movl	$6, %r8d
	movl	$1, %edx
	movq	%r13, %rcx
	addq	$1, %rsi
	call	fwrite
	cmpq	$5, %rsi
	jne	.L3432
.L3431:
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$10, %r8d
	movl	$1, %edx
	call	fwrite
	movq	%rdi, %r9
	movl	$24, %r8d
	movl	$1, %edx
	leaq	.LC183(%rip), %rcx
	call	fwrite
	jmp	.L3393
.L3399:
	cmpq	$0, (%rsi)
	movl	$1, %r13d
	movb	%dl, 112(%rsp)
	leaq	.LC76(%rip), %r14
	je	.L3693
	.p2align 4,,10
	.p2align 3
.L3428:
	movsbl	112(%rsp), %eax
	movq	%rdi, %r9
	btl	%r13d, %eax
	jnc	.L3425
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC75(%rip), %rcx
	addq	$1, %r13
	call	fwrite
	cmpq	$5, %r13
	jne	.L3428
.L3427:
	movq	%rdi, %r9
	movl	$10, %r8d
	movl	$1, %edx
	movq	%rbx, %rcx
	call	fwrite
	movq	%rdi, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC182(%rip), %rcx
.L3660:
	call	fwrite
	movq	80(%rsp), %r9
	movq	(%rsi), %rcx
	movq	%rdi, %rdx
	movl	$6, %r8d
	call	output_expression
	jmp	.L3393
.L3400:
	movb	%dl, 112(%rsp)
	movl	$1, %r13d
	leaq	.LC76(%rip), %r14
	.p2align 4,,10
	.p2align 3
.L3413:
	movsbl	112(%rsp), %eax
	movq	%rdi, %r9
	btl	%r13d, %eax
	jnc	.L3410
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC75(%rip), %rcx
	addq	$1, %r13
	call	fwrite
	cmpq	$5, %r13
	jne	.L3413
.L3412:
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$10, %r8d
	movl	$1, %edx
	call	fwrite
	movq	%rdi, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC178(%rip), %rcx
	call	fwrite
	movq	80(%rsp), %r9
	movq	(%rsi), %rcx
	movq	%rdi, %rdx
	movl	$6, %r8d
	call	output_for
	jmp	.L3393
.L3401:
	movb	%dl, 112(%rsp)
	movl	$1, %r13d
	leaq	.LC76(%rip), %r14
	.p2align 4,,10
	.p2align 3
.L3417:
	movsbl	112(%rsp), %eax
	movq	%rdi, %r9
	btl	%r13d, %eax
	jnc	.L3414
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC75(%rip), %rcx
	addq	$1, %r13
	call	fwrite
	cmpq	$5, %r13
	jne	.L3417
.L3416:
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$10, %r8d
	movl	$1, %edx
	call	fwrite
	movq	%rdi, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC179(%rip), %rcx
	call	fwrite
	movq	80(%rsp), %r9
	movq	(%rsi), %rcx
	movq	%rdi, %rdx
	movl	$6, %r8d
	call	output_while
	jmp	.L3393
.L3402:
	movb	%dl, 112(%rsp)
	movl	$1, %r13d
	leaq	.LC76(%rip), %r14
	.p2align 4,,10
	.p2align 3
.L3408:
	movsbl	112(%rsp), %eax
	movq	%rdi, %r9
	btl	%r13d, %eax
	jnc	.L3405
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC75(%rip), %rcx
	addq	$1, %r13
	call	fwrite
	cmpq	$5, %r13
	jne	.L3408
.L3407:
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$10, %r8d
	movl	$1, %edx
	call	fwrite
	movq	%rdi, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC177(%rip), %rcx
	call	fwrite
	movq	80(%rsp), %r9
	movq	(%rsi), %rcx
	movq	%rdi, %rdx
	movl	$6, %r8d
	call	output_if
	jmp	.L3393
.L3396:
	movb	%dl, 112(%rsp)
	movl	$1, %esi
	leaq	.LC76(%rip), %r14
	leaq	.LC75(%rip), %r13
	.p2align 4,,10
	.p2align 3
.L3436:
	movsbl	112(%rsp), %eax
	movq	%rdi, %r9
	btl	%esi, %eax
	jnc	.L3433
	movl	$6, %r8d
	movl	$1, %edx
	movq	%r13, %rcx
	addq	$1, %rsi
	call	fwrite
	cmpq	$5, %rsi
	jne	.L3436
.L3435:
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$10, %r8d
	movl	$1, %edx
	call	fwrite
	movq	%rdi, %r9
	movl	$27, %r8d
	movl	$1, %edx
	leaq	.LC184(%rip), %rcx
	call	fwrite
	jmp	.L3393
.L3403:
	movb	%dl, 112(%rsp)
	movl	$1, %r13d
	leaq	.LC76(%rip), %r14
	.p2align 4,,10
	.p2align 3
.L3421:
	movsbl	112(%rsp), %eax
	movq	%rdi, %r9
	btl	%r13d, %eax
	jnc	.L3418
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC75(%rip), %rcx
	addq	$1, %r13
	call	fwrite
	cmpq	$5, %r13
	jne	.L3421
.L3420:
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$10, %r8d
	movl	$1, %edx
	call	fwrite
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC180(%rip), %rcx
	call	fwrite
	movq	80(%rsp), %r8
	movq	(%rsi), %rcx
	movq	%rdi, %rdx
	call	output_variable.constprop.1
	jmp	.L3393
.L3404:
	cmpq	$0, (%rsi)
	movl	$1, %r13d
	movb	%dl, 112(%rsp)
	leaq	.LC76(%rip), %r14
	je	.L3694
	.p2align 4,,10
	.p2align 3
.L3443:
	movsbl	112(%rsp), %eax
	movq	%rdi, %r9
	btl	%r13d, %eax
	jnc	.L3440
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC75(%rip), %rcx
	addq	$1, %r13
	call	fwrite
	cmpq	$5, %r13
	jne	.L3443
.L3442:
	movq	%rdi, %r9
	movl	$10, %r8d
	movl	$1, %edx
	movq	%rbx, %rcx
	call	fwrite
	movq	%rdi, %r9
	movl	$21, %r8d
	movl	$1, %edx
	leaq	.LC186(%rip), %rcx
	jmp	.L3660
	.p2align 4,,10
	.p2align 3
.L3389:
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC76(%rip), %rcx
	addq	$1, %rsi
	call	fwrite
	cmpq	$4, %rsi
	jne	.L3392
	jmp	.L3391
.L3433:
	movl	$4, %r8d
	movl	$1, %edx
	movq	%r14, %rcx
	addq	$1, %rsi
	call	fwrite
	cmpq	$5, %rsi
	jne	.L3436
	jmp	.L3435
.L3405:
	movl	$4, %r8d
	movl	$1, %edx
	movq	%r14, %rcx
	addq	$1, %r13
	call	fwrite
	cmpq	$5, %r13
	jne	.L3408
	jmp	.L3407
.L3410:
	movl	$4, %r8d
	movl	$1, %edx
	movq	%r14, %rcx
	addq	$1, %r13
	call	fwrite
	cmpq	$5, %r13
	jne	.L3413
	jmp	.L3412
.L3414:
	movl	$4, %r8d
	movl	$1, %edx
	movq	%r14, %rcx
	addq	$1, %r13
	call	fwrite
	cmpq	$5, %r13
	jne	.L3417
	jmp	.L3416
.L3418:
	movl	$4, %r8d
	movl	$1, %edx
	movq	%r14, %rcx
	addq	$1, %r13
	call	fwrite
	cmpq	$5, %r13
	jne	.L3421
	jmp	.L3420
.L3429:
	movl	$4, %r8d
	movl	$1, %edx
	movq	%r14, %rcx
	addq	$1, %rsi
	call	fwrite
	cmpq	$5, %rsi
	jne	.L3432
	jmp	.L3431
.L3425:
	movl	$4, %r8d
	movl	$1, %edx
	movq	%r14, %rcx
	addq	$1, %r13
	call	fwrite
	cmpq	$5, %r13
	jne	.L3428
	jmp	.L3427
.L3440:
	movl	$4, %r8d
	movl	$1, %edx
	movq	%r14, %rcx
	addq	$1, %r13
	call	fwrite
	cmpq	$5, %r13
	jne	.L3443
	jmp	.L3442
.L3692:
	xorl	%ecx, %ecx
	movq	%rcx, 8(%r12)
	jmp	.L3449
.L3497:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	%edi, %r8d
	leaq	.LC347(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	0(%r13), %rax
	jmp	.L3462
.L3686:
	xorl	%ecx, %ecx
	movq	%r9, 72(%rsp)
	call	increase_memory_size
	movq	string_memory(%rip), %rax
	movq	72(%rsp), %r9
	jmp	.L3479
.L3395:
	movb	%dl, 112(%rsp)
	movl	$1, %r13d
	leaq	.LC76(%rip), %r14
	.p2align 4,,10
	.p2align 3
.L3447:
	movsbl	112(%rsp), %eax
	movq	%rdi, %r9
	btl	%r13d, %eax
	jnc	.L3444
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC75(%rip), %rcx
	addq	$1, %r13
	call	fwrite
	cmpq	$5, %r13
	jne	.L3447
.L3446:
	movq	%rbx, %rcx
	movq	%rdi, %r9
	movl	$10, %r8d
	movl	$1, %edx
	call	fwrite
	movl	8(%rsi), %r8d
	leaq	.LC187(%rip), %rdx
	movq	%rdi, %rcx
	call	fprintf
	jmp	.L3393
.L3444:
	movl	$4, %r8d
	movl	$1, %edx
	movq	%r14, %rcx
	addq	$1, %r13
	call	fwrite
	cmpq	$5, %r13
	jne	.L3447
	jmp	.L3446
.L3678:
	movq	%rbx, %r9
	movl	$102, %r8d
.L3661:
	movq	(%rcx), %rdx
	call	create_var
	movq	16(%rsi), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	0(%r13), %rax
	jmp	.L3462
.L3677:
	movq	%rbx, %r9
	movl	$118, %r8d
	jmp	.L3661
.L3669:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, %r8
	leaq	.LC316(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L3294
.L3691:
	movq	80(%rsp), %rsi
	movzbl	112(%rsp), %eax
.L3508:
	movl	%eax, %edx
	andl	$-5, %edx
	testb	$2, %al
	leaq	.LC76(%rip), %rax
	movb	%dl, 112(%rsp)
	leaq	.LC75(%rip), %rdx
	cmove	%rax, %rdx
.L3314:
	movq	%rdi, %rcx
	leaq	.L3321(%rip), %r13
	call	fprintf
	movq	%rdi, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC77(%rip), %rcx
	call	fwrite
	movq	%rdi, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC176(%rip), %rcx
	call	fwrite
	testq	%rsi, %rsi
	je	.L3296
	.p2align 4,,10
	.p2align 3
.L3318:
	movq	(%rsi), %rax
	testq	%rax, %rax
	je	.L3296
	movq	(%rax), %rdx
	movq	%rdx, (%rsi)
	testq	%rdx, %rdx
	je	.L3695
.L3355:
	movq	8(%rax), %r12
	testq	%r12, %r12
	je	.L3296
	movzbl	112(%rsp), %eax
	movl	%eax, %ecx
	andl	$2, %eax
	orl	$8, %ecx
	cmpl	$7, 8(%r12)
	movl	%eax, %edx
	ja	.L3319
	movl	8(%r12), %eax
	movslq	0(%r13,%rax,4), %rax
	addq	%r13, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L3321:
	.long	.L3328-.L3321
	.long	.L3327-.L3321
	.long	.L3326-.L3321
	.long	.L3325-.L3321
	.long	.L3324-.L3321
	.long	.L3323-.L3321
	.long	.L3322-.L3321
	.long	.L3320-.L3321
	.section	.text.startup,"x"
.L3322:
	leaq	.LC75(%rip), %r15
	testb	%dl, %dl
	leaq	.LC76(%rip), %r12
	movb	%cl, 112(%rsp)
	movq	%r15, %rdx
	movq	%rdi, %rcx
	cmove	%r12, %rdx
	call	fprintf
	testb	$4, 112(%rsp)
	movq	%r15, %rdx
	movq	%rdi, %rcx
	cmove	%r12, %rdx
	call	fprintf
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$1, %edx
	movl	$10, %r8d
	call	fwrite
	movq	%rdi, %r9
	movl	$24, %r8d
	movl	$1, %edx
	leaq	.LC183(%rip), %rcx
	call	fwrite
	jmp	.L3318
.L3323:
	cmpq	$0, (%r12)
	movb	%cl, 112(%rsp)
	je	.L3696
	leaq	.LC75(%rip), %r8
	testb	%dl, %dl
	leaq	.LC76(%rip), %r15
	movq	%rdi, %rcx
	movq	%r8, %rdx
	cmove	%r15, %rdx
	call	fprintf
	leaq	.LC75(%rip), %r8
	testb	$4, 112(%rsp)
	movq	%rdi, %rcx
	movq	%r8, %rdx
	cmove	%r15, %rdx
	call	fprintf
	movq	%rdi, %r9
	movl	$1, %edx
	movq	%rbx, %rcx
	movl	$10, %r8d
	call	fwrite
	movq	%rdi, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC182(%rip), %rcx
.L3658:
	call	fwrite
	movq	(%r12), %rcx
	movq	%r14, %r9
	movq	%rdi, %rdx
	movl	$4, %r8d
	call	output_expression
	jmp	.L3318
.L3324:
	leaq	.LC75(%rip), %r8
	testb	%dl, %dl
	leaq	.LC76(%rip), %r15
	movb	%cl, 112(%rsp)
	movq	%r8, %rdx
	movq	%rdi, %rcx
	cmove	%r15, %rdx
	call	fprintf
	leaq	.LC75(%rip), %r8
	testb	$4, 112(%rsp)
	movq	%rdi, %rcx
	movq	%r8, %rdx
	cmove	%r15, %rdx
	call	fprintf
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$1, %edx
	movl	$10, %r8d
	call	fwrite
	movq	%rdi, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC178(%rip), %rcx
	call	fwrite
	movq	(%r12), %rcx
	movq	%r14, %r9
	movq	%rdi, %rdx
	movl	$4, %r8d
	call	output_for
	jmp	.L3318
.L3325:
	leaq	.LC75(%rip), %r8
	testb	%dl, %dl
	leaq	.LC76(%rip), %r15
	movb	%cl, 112(%rsp)
	movq	%r8, %rdx
	movq	%rdi, %rcx
	cmove	%r15, %rdx
	call	fprintf
	leaq	.LC75(%rip), %r8
	testb	$4, 112(%rsp)
	movq	%rdi, %rcx
	movq	%r8, %rdx
	cmove	%r15, %rdx
	call	fprintf
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$1, %edx
	movl	$10, %r8d
	call	fwrite
	movq	%rdi, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC179(%rip), %rcx
	call	fwrite
	movq	(%r12), %rcx
	movq	%r14, %r9
	movq	%rdi, %rdx
	movl	$4, %r8d
	call	output_while
	jmp	.L3318
.L3326:
	leaq	.LC75(%rip), %r8
	testb	%dl, %dl
	leaq	.LC76(%rip), %r15
	movb	%cl, 112(%rsp)
	movq	%r8, %rdx
	movq	%rdi, %rcx
	cmove	%r15, %rdx
	call	fprintf
	leaq	.LC75(%rip), %r8
	testb	$4, 112(%rsp)
	movq	%rdi, %rcx
	movq	%r8, %rdx
	cmove	%r15, %rdx
	call	fprintf
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$1, %edx
	movl	$10, %r8d
	call	fwrite
	movq	%rdi, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC177(%rip), %rcx
	call	fwrite
	movq	(%r12), %rcx
	movq	%r14, %r9
	movq	%rdi, %rdx
	movl	$4, %r8d
	call	output_if
	jmp	.L3318
.L3327:
	leaq	.LC75(%rip), %r8
	testb	%dl, %dl
	leaq	.LC76(%rip), %r15
	movb	%cl, 112(%rsp)
	movq	%r8, %rdx
	movq	%rdi, %rcx
	cmove	%r15, %rdx
	call	fprintf
	leaq	.LC75(%rip), %r8
	testb	$4, 112(%rsp)
	movq	%rdi, %rcx
	movq	%r8, %rdx
	cmove	%r15, %rdx
	call	fprintf
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$1, %edx
	movl	$10, %r8d
	call	fwrite
	movq	%rdi, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC180(%rip), %rcx
	call	fwrite
	movq	(%r12), %rcx
	movq	%r14, %r8
	movq	%rdi, %rdx
	call	output_variable.constprop.0
	jmp	.L3318
.L3328:
	cmpq	$0, (%r12)
	movb	%cl, 112(%rsp)
	je	.L3697
	leaq	.LC75(%rip), %r8
	testb	%dl, %dl
	leaq	.LC76(%rip), %r15
	movq	%rdi, %rcx
	movq	%r8, %rdx
	cmove	%r15, %rdx
	call	fprintf
	leaq	.LC75(%rip), %r8
	testb	$4, 112(%rsp)
	movq	%rdi, %rcx
	movq	%r8, %rdx
	cmove	%r15, %rdx
	call	fprintf
	movq	%rdi, %r9
	movl	$1, %edx
	movq	%rbx, %rcx
	movl	$10, %r8d
	call	fwrite
	movq	%rdi, %r9
	movl	$21, %r8d
	movl	$1, %edx
	leaq	.LC186(%rip), %rcx
	jmp	.L3658
.L3320:
	leaq	.LC75(%rip), %r15
	testb	%dl, %dl
	leaq	.LC76(%rip), %r12
	movb	%cl, 112(%rsp)
	movq	%r15, %rdx
	movq	%rdi, %rcx
	cmove	%r12, %rdx
	call	fprintf
	testb	$4, 112(%rsp)
	movq	%r15, %rdx
	movq	%rdi, %rcx
	cmove	%r12, %rdx
	call	fprintf
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$1, %edx
	movl	$10, %r8d
	call	fwrite
	movq	%rdi, %r9
	movl	$27, %r8d
	movl	$1, %edx
	leaq	.LC184(%rip), %rcx
	call	fwrite
	jmp	.L3318
.L3695:
	xorl	%r9d, %r9d
	movq	%r9, 8(%rsi)
	jmp	.L3355
.L3319:
	leaq	.LC75(%rip), %r8
	leaq	.LC76(%rip), %r15
	testb	%al, %al
	movb	%cl, 112(%rsp)
	movq	%r8, %rdx
	movq	%rdi, %rcx
	cmove	%r15, %rdx
	call	fprintf
	leaq	.LC75(%rip), %r8
	testb	$4, 112(%rsp)
	movq	%rdi, %rcx
	movq	%r8, %rdx
	cmove	%r15, %rdx
	call	fprintf
	movq	%rbx, %rcx
	movq	%rdi, %r9
	movl	$1, %edx
	movl	$10, %r8d
	call	fwrite
	movl	8(%r12), %r8d
	leaq	.LC187(%rip), %rdx
	movq	%rdi, %rcx
	call	fprintf
	jmp	.L3318
.L3671:
	leaq	.LC314(%rip), %r8
	jmp	.L3302
.L3377:
	movq	24(%r13), %r12
	testq	%r12, %r12
	je	.L3385
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%r12), %xmm2
	movq	%rax, %rdx
	movups	%xmm2, (%rax)
	jmp	.L3505
.L3690:
	movq	80(%rsp), %rsi
	jmp	.L3508
.L3307:
	movq	24(%rsi), %rsi
	testq	%rsi, %rsi
	je	.L3698
	call	alloc_memory.constprop.0
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%rsi), %xmm3
	movq	%rax, %rsi
	movups	%xmm3, (%rax)
	movzbl	112(%rsp), %eax
	jmp	.L3508
.L3694:
	movl	$1, %esi
	leaq	.LC76(%rip), %r14
	leaq	.LC75(%rip), %r13
.L3439:
	movsbl	112(%rsp), %eax
	movq	%r14, %rdx
	movq	%rdi, %rcx
	btl	%esi, %eax
	cmovc	%r13, %rdx
	addq	$1, %rsi
	call	fprintf
	cmpq	$5, %rsi
	jne	.L3439
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$10, %r8d
	movl	$1, %edx
	call	fwrite
	movq	%rdi, %r9
	movl	$29, %r8d
	movl	$1, %edx
	leaq	.LC185(%rip), %rcx
	call	fwrite
	jmp	.L3393
.L3693:
	movl	$1, %esi
	leaq	.LC76(%rip), %r14
	leaq	.LC75(%rip), %r13
.L3424:
	movsbl	112(%rsp), %eax
	movq	%r14, %rdx
	movq	%rdi, %rcx
	btl	%esi, %eax
	cmovc	%r13, %rdx
	addq	$1, %rsi
	call	fprintf
	cmpq	$5, %rsi
	jne	.L3424
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$10, %r8d
	movl	$1, %edx
	call	fwrite
	movq	%rdi, %r9
	movl	$25, %r8d
	movl	$1, %edx
	leaq	.LC181(%rip), %rcx
	call	fwrite
	jmp	.L3393
.L3697:
	leaq	.LC75(%rip), %r15
	testb	%dl, %dl
	leaq	.LC76(%rip), %r12
	movq	%rdi, %rcx
	movq	%r15, %rdx
	cmove	%r12, %rdx
	call	fprintf
	testb	$4, 112(%rsp)
	movq	%r15, %rdx
	movq	%rdi, %rcx
	cmove	%r12, %rdx
	call	fprintf
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$1, %edx
	movl	$10, %r8d
	call	fwrite
	movq	%rdi, %r9
	movl	$29, %r8d
	movl	$1, %edx
	leaq	.LC185(%rip), %rcx
	call	fwrite
	jmp	.L3318
.L3696:
	leaq	.LC75(%rip), %r15
	testb	%dl, %dl
	leaq	.LC76(%rip), %r12
	movq	%rdi, %rcx
	movq	%r15, %rdx
	cmove	%r12, %rdx
	call	fprintf
	testb	$4, 112(%rsp)
	movq	%r15, %rdx
	movq	%rdi, %rcx
	cmove	%r12, %rdx
	call	fprintf
	movq	%rdi, %r9
	movq	%rbx, %rcx
	movl	$1, %edx
	movl	$10, %r8d
	call	fwrite
	movq	%rdi, %r9
	movl	$25, %r8d
	movl	$1, %edx
	leaq	.LC181(%rip), %rcx
	call	fwrite
	jmp	.L3318
.L3698:
	movzbl	112(%rsp), %eax
	movl	%eax, %edx
	andl	$-5, %edx
	movb	%dl, 112(%rsp)
	leaq	.LC76(%rip), %rdx
	testb	$2, %al
	je	.L3314
	movq	%rdi, %r9
	movq	%r12, %rcx
	movl	$6, %r8d
	movl	$1, %edx
	call	fwrite
	movq	%rdi, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC77(%rip), %rcx
	call	fwrite
	movq	%rdi, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC176(%rip), %rcx
	call	fwrite
	jmp	.L3296
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
	.quad	.LC197
	.quad	.LC354
	.quad	.LC355
	.quad	.LC356
	.quad	.LC357
	.quad	.LC358
	.quad	.LC359
	.quad	.LC360
	.quad	.LC195
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
	.quad	.LC0
	.quad	.LC1
	.quad	.LC387
	.quad	.LC388
	.quad	.LC389
	.quad	.LC390
	.quad	.LC391
	.quad	.LC392
	.quad	.LC393
	.quad	.LC7
	.quad	.LC394
.lcomm initialized,1,1
	.align 16
.LC11:
	.quad	1024
	.quad	0
	.align 8
.LC159:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Rev6, Built by MSYS2 project) 13.2.0"
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	putc;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
	.def	memcpy;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	strncmp;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	getcwd;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	strtoll;	.scl	2;	.type	32;	.endef
	.def	strtod;	.scl	2;	.type	32;	.endef
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	ftell;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	strcat;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
