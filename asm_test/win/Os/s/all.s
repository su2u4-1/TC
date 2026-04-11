	.file	"all.c"
	.text
	.def	list_pop;	.scl	3;	.type	32;	.endef
list_pop:
	xorl	%eax, %eax
	testq	%rcx, %rcx
	je	.L1
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L1
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	testq	%rdx, %rdx
	jne	.L3
	xorl	%edx, %edx
	movq	%rdx, 8(%rcx)
.L3:
	movq	8(%rax), %rax
.L1:
	ret
	.def	list_pop_back;	.scl	3;	.type	32;	.endef
list_pop_back:
	xorl	%eax, %eax
	testq	%rcx, %rcx
	je	.L9
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L9
	movq	8(%rcx), %r8
	cmpq	%r8, %rax
	jne	.L11
	xorl	%r9d, %r9d
	movq	8(%rax), %rax
	movq	%r9, (%rcx)
	movq	%r9, 8(%rcx)
	ret
.L11:
	movq	%rax, %rdx
	movq	(%rax), %rax
	cmpq	%rax, %r8
	jne	.L11
	xorl	%r8d, %r8d
	movq	8(%rax), %rax
	movq	%r8, (%rdx)
	movq	%rdx, 8(%rcx)
.L9:
	ret
	.def	search_name;	.scl	3;	.type	32;	.endef
search_name:
.L19:
	testq	%rcx, %rcx
	je	.L25
	movq	8(%rcx), %rax
.L24:
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L26
	movq	8(%rax), %r8
	cmpq	%rdx, 8(%r8)
	jne	.L24
	jmp	.L18
.L26:
	movq	(%rcx), %rcx
	jmp	.L19
.L25:
	xorl	%r8d, %r8d
.L18:
	movq	%r8, %rax
	ret
	.def	get_current_char;	.scl	3;	.type	32;	.endef
get_current_char:
	movq	16(%rcx), %rax
	xorl	%edx, %edx
	cmpq	24(%rcx), %rax
	jnb	.L27
	movq	8(%rcx), %rdx
	leaq	1(%rax), %r8
	incq	40(%rcx)
	movq	%r8, 16(%rcx)
	movb	(%rdx,%rax), %dl
.L27:
	movl	%edx, %eax
	ret
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
	.def	indention;	.scl	3;	.type	32;	.endef
indention:
	pushq	%r14
	movl	$1, %eax
	pushq	%r13
	pushq	%r12
	movq	%r9, %r12
	pushq	%rbp
	movl	%r8d, %ebp
	movq	%rdx, %r8
	pushq	%rdi
	shrq	$3, %r8
	movq	%rcx, %rdi
	pushq	%rsi
	addq	%r9, %r8
	pushq	%rbx
	movq	%rdx, %rbx
	movl	%ebx, %ecx
	andl	$7, %ecx
	subq	$32, %rsp
	sall	%cl, %eax
	movb	(%r8), %dl
	testb	%bpl, %bpl
	jne	.L31
	orl	%eax, %edx
	jmp	.L32
.L31:
	notl	%eax
	andl	%eax, %edx
.L32:
	movb	%dl, (%r8)
	movl	$1, %esi
	leaq	.LC1(%rip), %r13
	leaq	.LC0(%rip), %r14
.L33:
	cmpq	%rbx, %rsi
	jnb	.L41
	movq	%rsi, %rax
	movl	%esi, %ecx
	movq	%r14, %rdx
	shrq	$3, %rax
	andl	$7, %ecx
	movsbl	(%r12,%rax), %eax
	sarl	%cl, %eax
	movq	%rdi, %rcx
	testb	$1, %al
	cmove	%r13, %rdx
	incq	%rsi
	call	fprintf
	jmp	.L33
.L41:
	testq	%rbx, %rbx
	je	.L30
	testb	%bpl, %bpl
	leaq	.LC3(%rip), %rdx
	leaq	.LC2(%rip), %rax
	movq	%rdi, %rcx
	cmovne	%rax, %rdx
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	fprintf
.L30:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.section .rdata,"dr"
.LC4:
	.ascii "[Warning] Unsupported type for size lookup: %s\12\0"
	.text
	.def	get_type_size;	.scl	3;	.type	32;	.endef
get_type_size:
	xorl	%eax, %eax
	testq	%rcx, %rcx
	je	.L50
	cmpq	%rcx, name_int(%rip)
	je	.L51
	cmpq	%rcx, name_float(%rip)
	je	.L51
	cmpq	%rcx, name_string(%rip)
	je	.L51
	cmpq	%rcx, name_bool(%rip)
	movl	$1, %eax
	je	.L50
	cmpq	%rcx, name_void(%rip)
	je	.L50
	cmpl	$0, 32(%rcx)
	jne	.L45
	movq	24(%rcx), %rax
	movq	24(%rax), %rax
	ret
.L45:
	subq	$56, %rsp
	movq	8(%rcx), %r8
	movl	$2, %ecx
	movq	%r8, 40(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	40(%rsp), %r8
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$8, %eax
	addq	$56, %rsp
	ret
.L51:
	movl	$8, %eax
	ret
.L50:
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
	.def	output_name;	.scl	3;	.type	32;	.endef
output_name:
	pushq	%r15
	leaq	.LC7(%rip), %r15
	pushq	%r14
	leaq	.LC6(%rip), %r14
	pushq	%r13
	leaq	.L58(%rip), %r13
	pushq	%r12
	leaq	1(%r8), %r12
	pushq	%rbp
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	movq	%r9, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$40, %rsp
.L54:
	leaq	-1(%r12), %rbp
	movq	%rsi, %r9
	testq	%rdi, %rdi
	jne	.L55
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC5(%rip), %rcx
	jmp	.L70
.L55:
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	8(%rdi), %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	fprintf
	xorl	%r8d, %r8d
	movq	%rsi, %r9
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	16(%rdi), %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	fprintf
	cmpl	$6, 32(%rdi)
	ja	.L56
	movl	32(%rdi), %eax
	movq	%rsi, %r9
	movslq	0(%r13,%rax,4), %rax
	addq	%r13, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L58:
	.long	.L64-.L58
	.long	.L63-.L58
	.long	.L62-.L58
	.long	.L61-.L58
	.long	.L60-.L58
	.long	.L59-.L58
	.long	.L57-.L58
	.text
.L57:
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC8(%rip), %rcx
	jmp	.L70
.L61:
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC9(%rip), %rcx
	jmp	.L68
.L63:
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC11(%rip), %rcx
	jmp	.L69
.L62:
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC13(%rip), %rcx
.L69:
	call	fputs
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movq	%rsi, %r9
	movl	$1, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC12(%rip), %rcx
	jmp	.L67
.L64:
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC14(%rip), %rcx
	jmp	.L70
.L59:
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC15(%rip), %rcx
.L68:
	call	fputs
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movq	%rsi, %r9
	movl	$1, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC10(%rip), %rcx
.L67:
	call	fputs
	incq	%r12
	movq	(%rdi), %rdi
	jmp	.L54
.L60:
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC16(%rip), %rcx
	jmp	.L68
.L56:
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	movq	%rsi, %r9
	movl	$1, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC17(%rip), %rcx
.L70:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fputs
	.section .rdata,"dr"
.LC18:
	.ascii "true\0"
.LC19:
	.ascii "false\0"
.LC20:
	.ascii "\"NULL\"\0"
.LC21:
	.ascii "%s(%s)\0"
.LC22:
	.ascii "%lld\0"
.LC23:
	.ascii "%f\0"
.LC24:
	.ascii "\"%s\"\0"
.LC25:
	.ascii "void\0"
.LC26:
	.ascii "NONE\0"
.LC27:
	.ascii "unknown_ArgType: %u\0"
	.text
	.def	output_arg;	.scl	3;	.type	32;	.endef
output_arg:
	movq	%rcx, %rax
	movq	%rdx, %rcx
	testq	%rax, %rax
	jne	.L72
	leaq	.LC20(%rip), %rcx
	jmp	.L88
.L72:
	movl	16(%rax), %r8d
	cmpl	$9, %r8d
	ja	.L73
	leaq	.L75(%rip), %r9
	movslq	(%r9,%r8,4), %rdx
	addq	%r9, %rdx
	jmp	*%rdx
	.section .rdata,"dr"
	.align 4
.L75:
	.long	.L76-.L75
	.long	.L82-.L75
	.long	.L81-.L75
	.long	.L80-.L75
	.long	.L79-.L75
	.long	.L78-.L75
	.long	.L77-.L75
	.long	.L76-.L75
	.long	.L76-.L75
	.long	.L74-.L75
	.text
.L76:
	movq	(%rax), %rdx
	movq	(%rdx), %rax
	movq	8(%rdx), %r8
	testq	%rax, %rax
	jne	.L93
	movq	%rcx, %rdx
	movq	%r8, %rcx
.L88:
	jmp	fputs
.L82:
	movq	(%rax), %r8
	leaq	.LC22(%rip), %rdx
	jmp	.L90
.L81:
	movq	(%rax), %r8
	leaq	.LC23(%rip), %rdx
	movq	%r8, %xmm2
	jmp	fprintf
.L80:
	movq	(%rax), %r8
	leaq	.LC24(%rip), %rdx
.L90:
	jmp	fprintf
.L79:
	cmpb	$0, (%rax)
	leaq	.LC18(%rip), %rdx
	leaq	.LC19(%rip), %rax
	cmovne	%rdx, %rax
	jmp	.L91
.L78:
	movq	%rcx, %rdx
	leaq	.LC25(%rip), %rcx
	jmp	.L88
.L77:
	movq	(%rax), %rax
	movq	8(%rax), %rax
.L91:
	movq	%rcx, %rdx
	movq	%rax, %rcx
	jmp	.L88
.L93:
	movq	8(%rax), %r9
	leaq	.LC21(%rip), %rdx
	jmp	fprintf
.L74:
	movq	%rcx, %rdx
	leaq	.LC26(%rip), %rcx
	jmp	.L88
.L73:
	leaq	.LC27(%rip), %rdx
	jmp	fprintf
	.section .rdata,"dr"
.LC28:
	.ascii "Fatal: Cannot allocate memory\12\0"
	.text
	.def	increase_memory_size;	.scl	3;	.type	32;	.endef
increase_memory_size:
	pushq	%rsi
	movl	%ecx, %esi
	movl	$32, %ecx
	pushq	%rbx
	subq	$40, %rsp
	call	malloc
	testq	%rax, %rax
	jne	.L95
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC28(%rip), %rcx
	movq	%rax, %rdx
	call	fputs
	movq	string_memory(%rip), %rbx
.L96:
	testq	%rbx, %rbx
	je	.L101
	movq	24(%rbx), %rcx
	movq	16(%rbx), %rsi
	call	free
	movq	%rbx, %rcx
	movq	%rsi, %rbx
	call	free
	jmp	.L96
.L101:
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
.L95:
	movl	$1024, %ecx
	movq	%rax, %rbx
	call	malloc
	movq	$1024, (%rbx)
	movq	%rax, 24(%rbx)
	xorl	%eax, %eax
	movq	%rax, 8(%rbx)
	movq	%rax, 16(%rbx)
	testb	%sil, %sil
	je	.L98
	movq	struct_memory(%rip), %rax
	addq	$1024, struct_memory_count(%rip)
	movq	%rbx, struct_memory(%rip)
	movq	8(%rax), %rdx
	movq	%rax, 16(%rbx)
	addq	%rdx, struct_memory_used(%rip)
	jmp	.L94
.L98:
	movq	string_memory(%rip), %rax
	addq	$1024, string_memory_count(%rip)
	movq	%rbx, string_memory(%rip)
	movq	8(%rax), %rdx
	addq	%rdx, string_memory_used(%rip)
	movq	%rax, 16(%rbx)
.L94:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.def	search_name_use_strcmp;	.scl	3;	.type	32;	.endef
search_name_use_strcmp:
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$40, %rsp
.L103:
	testq	%rbx, %rbx
	je	.L112
	movq	8(%rbx), %rax
	movq	(%rax), %rsi
.L104:
	testq	%rsi, %rsi
	je	.L113
	movq	8(%rsi), %rdi
	movq	%rbp, %rdx
	movq	8(%rdi), %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L102
	movq	(%rsi), %rsi
	jmp	.L104
.L113:
	movq	(%rbx), %rbx
	jmp	.L103
.L112:
	xorl	%edi, %edi
.L102:
	addq	$40, %rsp
	movq	%rdi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC29:
	.ascii "Var: \"NULL\"\12\0"
.LC30:
	.ascii "NULL\11%s\12\0"
.LC31:
	.ascii "%s\11%s(%s)\12\0"
.LC32:
	.ascii "%s\11%s\12\0"
	.text
	.def	output_var;	.scl	3;	.type	32;	.endef
output_var:
	pushq	%rbp
	pushq	%rdi
	leaq	0(,%r8,4), %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$56, %rsp
	testq	%rcx, %rcx
	jne	.L115
.L116:
	movq	%rsi, %rdx
	movl	$32, %ecx
	incq	%rbx
	call	putc
	cmpq	%rdi, %rbx
	jb	.L116
	addq	$56, %rsp
	movq	%rsi, %rdx
	leaq	.LC29(%rip), %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	fputs
.L115:
	xorl	%ebp, %ebp
	cmpq	$0, 16(%rcx)
	jne	.L117
.L118:
	movq	%rsi, %rdx
	movl	$32, %ecx
	incq	%rbp
	call	putc
	cmpq	%rdi, %rbp
	jb	.L118
	movq	8(%rbx), %r8
	addq	$56, %rsp
	movq	%rsi, %rcx
	leaq	.LC30(%rip), %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	fprintf
.L117:
	cmpq	$0, (%rcx)
	je	.L119
.L120:
	movq	%rsi, %rdx
	movl	$32, %ecx
	incq	%rbp
	call	putc
	cmpq	%rdi, %rbp
	jb	.L120
	movq	16(%rbx), %rax
	movq	%rsi, %rcx
	leaq	.LC31(%rip), %rdx
	movq	8(%rax), %r8
	movq	(%rbx), %rax
	movq	8(%rax), %rax
	movq	%rax, 32(%rsp)
	movq	8(%rbx), %r9
	call	fprintf
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L119:
	movq	%rsi, %rdx
	movl	$32, %ecx
	incq	%rbp
	call	putc
	cmpq	%rdi, %rbp
	jb	.L119
	movq	16(%rbx), %rax
	movq	8(%rbx), %r9
	movq	%rsi, %rcx
	leaq	.LC32(%rip), %rdx
	movq	8(%rax), %r8
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	fprintf
	.def	string_to_operator;	.scl	3;	.type	32;	.endef
string_to_operator:
	cmpq	%rcx, 144+symbolList(%rip)
	movl	$13, %eax
	je	.L129
	cmpq	%rcx, 184+symbolList(%rip)
	movl	$14, %eax
	je	.L129
	cmpq	%rcx, 192+symbolList(%rip)
	movl	$15, %eax
	je	.L129
	cmpq	%rcx, 200+symbolList(%rip)
	movl	$16, %eax
	je	.L129
	cmpq	%rcx, 208+symbolList(%rip)
	movl	$17, %eax
	je	.L129
	cmpq	%rcx, 216+symbolList(%rip)
	movl	$18, %eax
	je	.L129
	cmpq	224+symbolList(%rip), %rcx
	movl	$11, %eax
	je	.L129
	cmpq	232+symbolList(%rip), %rcx
	movl	$12, %eax
	je	.L129
	cmpq	152+symbolList(%rip), %rcx
	movl	$5, %eax
	je	.L129
	cmpq	160+symbolList(%rip), %rcx
	movl	$6, %eax
	je	.L129
	cmpq	128+symbolList(%rip), %rcx
	movl	$7, %eax
	je	.L129
	cmpq	136+symbolList(%rip), %rcx
	movl	$8, %eax
	je	.L129
	cmpq	168+symbolList(%rip), %rcx
	movl	$9, %eax
	je	.L129
	cmpq	176+symbolList(%rip), %rcx
	movl	$10, %eax
	je	.L129
	xorl	%eax, %eax
	cmpq	88+symbolList(%rip), %rcx
	je	.L129
	cmpq	96+symbolList(%rip), %rcx
	movl	$1, %eax
	je	.L129
	cmpq	104+symbolList(%rip), %rcx
	movl	$2, %eax
	je	.L129
	cmpq	112+symbolList(%rip), %rcx
	movl	$3, %eax
	je	.L129
	cmpq	120+symbolList(%rip), %rcx
	movl	$19, %eax
	movl	$4, %edx
	cmove	%edx, %eax
.L129:
	ret
	.section .rdata,"dr"
.LC33:
	.ascii "Error creating method: name or return_type is NULL\12\0"
	.text
	.def	create_method_use_ptr;	.scl	3;	.type	32;	.endef
create_method_use_ptr:
	subq	$40, %rsp
	testq	%rdx, %rdx
	je	.L154
	testq	%r8, %r8
	jne	.L151
.L154:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC33(%rip), %rcx
	movq	%rax, %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L153
.L151:
	movq	%rdx, (%rcx)
	movq	80(%rsp), %rdx
	movq	%rcx, %rax
	movq	%r8, 8(%rcx)
	movq	%rdx, 24(%rcx)
	movq	88(%rsp), %rdx
	movq	%r9, 16(%rcx)
	movq	%rdx, 32(%rcx)
.L153:
	addq	$40, %rsp
	ret
	.def	create_memory_block.constprop.0;	.scl	3;	.type	32;	.endef
create_memory_block.constprop.0:
	pushq	%rbx
	movl	$32, %ecx
	subq	$32, %rsp
	call	malloc
	testq	%rax, %rax
	jne	.L157
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC28(%rip), %rcx
	movq	%rax, %rdx
	call	fputs
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
.L157:
	movl	$1024, %ecx
	movq	%rax, %rbx
	call	malloc
	movq	$1024, (%rbx)
	movq	%rax, 24(%rbx)
	xorl	%eax, %eax
	movq	%rax, 8(%rbx)
	movq	%rax, 16(%rbx)
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	ret
	.section .rdata,"dr"
.LC34:
	.ascii "init\0"
.LC35:
	.ascii "$constructor\0"
	.text
	.def	init;	.scl	3;	.type	32;	.endef
init:
	cmpb	$0, initialized(%rip)
	jne	.L168
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	cmpq	$0, struct_memory(%rip)
	jne	.L161
	call	create_memory_block.constprop.0
	movq	$1024, struct_memory_count(%rip)
	movq	%rax, struct_memory(%rip)
.L161:
	cmpq	$0, string_memory(%rip)
	jne	.L162
	call	create_memory_block.constprop.0
	movq	$1024, string_memory_count(%rip)
	movq	%rax, string_memory(%rip)
.L162:
	movb	$1, initialized(%rip)
	xorl	%ebx, %ebx
	leaq	keywordStrings(%rip), %rbp
	leaq	keywordList(%rip), %rdi
.L163:
	movq	0(%rbp,%rbx,8), %rsi
	movq	%rsi, %rcx
	call	strlen
	xorl	%r8d, %r8d
	movq	%rsi, %rcx
	movq	%rax, %rdx
	call	create_string_check
	movq	%rax, (%rdi,%rbx,8)
	incq	%rbx
	cmpq	$22, %rbx
	jne	.L163
	xorl	%ebx, %ebx
	leaq	symbolStrings(%rip), %rbp
	leaq	symbolList(%rip), %rdi
.L164:
	movq	0(%rbp,%rbx,8), %rsi
	movq	%rsi, %rcx
	call	strlen
	xorl	%r8d, %r8d
	movq	%rsi, %rcx
	movq	%rax, %rdx
	call	create_string_check
	movq	%rax, (%rdi,%rbx,8)
	incq	%rbx
	cmpq	$30, %rbx
	jne	.L164
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
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L168:
	ret
	.section .rdata,"dr"
.LC36:
	.ascii "Fatal: Memory allocation is not aligned, used: %zu bytes\12\0"
	.text
	.def	alloc_memory;	.scl	3;	.type	32;	.endef
alloc_memory:
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$48, %rsp
	cmpb	$0, initialized(%rip)
	jne	.L172
	call	init
.L172:
	movq	struct_memory(%rip), %rax
	addq	$7, %rbx
	andq	$-8, %rbx
	movq	8(%rax), %rdx
	addq	%rbx, %rdx
	cmpq	(%rax), %rdx
	jb	.L173
	movl	$1, %ecx
	call	increase_memory_size
.L173:
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %r8
	testl	$7, %r8d
	je	.L174
	movq	%r8, 40(%rsp)
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	40(%rsp), %r8
	leaq	.LC36(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
.L174:
	movq	%r8, %rax
	addq	%rbx, %r8
	incq	memoryBlockCount(%rip)
	movq	%r8, 8(%rdx)
	andq	$-8, %rax
	addq	24(%rdx), %rax
	addq	$48, %rsp
	popq	%rbx
	ret
	.section .rdata,"dr"
.LC37:
	.ascii "Info: Allocate big memory block of size %zu bytes\12\0"
	.text
	.def	create_string_check;	.scl	3;	.type	32;	.endef
create_string_check:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movl	%r8d, %ebx
	subq	$48, %rsp
	cmpb	$0, initialized(%rip)
	jne	.L177
	call	init
.L177:
	testq	%rdi, %rdi
	je	.L186
	testq	%rsi, %rsi
	je	.L186
	testb	%bl, %bl
	je	.L179
	movq	all_string_list(%rip), %rbp
	xorl	%ebx, %ebx
.L180:
	testq	%rbp, %rbp
	je	.L192
	cmpq	%rsi, 8(%rbp)
	jne	.L181
	movq	0(%rbp), %r12
	testq	%r12, %r12
	je	.L181
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%r12, %rcx
	call	strncmp
	testl	%eax, %eax
	cmove	%r12, %rbx
.L181:
	movq	16(%rbp), %rbp
	jmp	.L180
.L192:
	testq	%rbx, %rbx
	jne	.L176
.L179:
	cmpq	$1022, %rsi
	jbe	.L183
	leaq	1(%rsi), %r8
	addq	%r8, string_memory_count(%rip)
	movq	%r8, %rcx
	addq	%r8, string_memory_used(%rip)
	movq	%r8, 40(%rsp)
	call	malloc
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rbp
	movq	%rax, %rbx
	call	*%rbp
	movq	40(%rsp), %r8
	leaq	.LC37(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	testq	%rbx, %rbx
	jne	.L184
	movl	$2, %ecx
	call	*%rbp
	leaq	.LC28(%rip), %rcx
	movq	%rax, %rdx
	call	fputs
	movl	$1, %ecx
	call	exit
.L183:
	movq	string_memory(%rip), %rax
	movq	8(%rax), %rdx
	addq	%rsi, %rdx
	cmpq	(%rax), %rdx
	jb	.L185
	xorl	%ecx, %ecx
	call	increase_memory_size
.L185:
	movq	string_memory(%rip), %rax
	movq	8(%rax), %rdx
	movq	24(%rax), %rbx
	addq	%rdx, %rbx
	leaq	1(%rdx,%rsi), %rdx
	movq	%rdx, 8(%rax)
.L184:
	movq	%rdi, %rdx
	movq	%rsi, %r8
	movq	%rbx, %rcx
	call	strncpy
	movb	$0, (%rbx,%rsi)
	movl	$24, %ecx
	call	alloc_memory
	movq	all_string_list(%rip), %rdx
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
	movq	%rdx, 16(%rax)
	movq	%rax, all_string_list(%rip)
	jmp	.L176
.L186:
	xorl	%ebx, %ebx
.L176:
	addq	$48, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.section .rdata,"dr"
.LC38:
	.ascii "\0"
.LC39:
	.ascii "%s/%s\0"
	.text
	.def	absolute_path;	.scl	3;	.type	32;	.endef
absolute_path:
	pushq	%r13
	pushq	%r12
	leaq	.LC38(%rip), %r12
	pushq	%rbp
	leaq	.LC39(%rip), %rbp
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
.L213:
	movq	%rcx, 96(%rsp)
	call	strlen
	movq	96(%rsp), %rcx
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	call	create_string_check
	movq	%rax, %rcx
	movq	%rax, %rbx
	call	strlen
	movq	%rax, %rsi
	xorl	%eax, %eax
.L194:
	cmpq	%rsi, %rax
	jnb	.L228
	leaq	(%rbx,%rax), %rcx
	movb	(%rcx), %dl
	cmpb	$92, %dl
	jne	.L195
	movb	$47, (%rcx)
	cmpq	$1, %rax
	jbe	.L200
.L201:
	leaq	-1(%rbx,%rax), %rcx
	cmpb	$46, (%rcx)
	jne	.L202
	jmp	.L229
.L195:
	cmpq	$1, %rax
	jbe	.L200
	cmpb	$47, %dl
	jne	.L202
	jmp	.L201
.L229:
	cmpb	$47, -2(%rbx,%rax)
	leaq	-2(%rax), %r13
	jne	.L202
	movq	%rsi, %r8
	leaq	1(%rbx,%rax), %rdx
	subq	$2, %rsi
	subq	%rax, %r8
	call	memmove
	movq	%r13, %rax
.L200:
	testq	%rax, %rax
	je	.L203
.L202:
	leaq	(%rbx,%rax), %rcx
	cmpb	$47, (%rcx)
	jne	.L203
	cmpb	$47, -1(%rbx,%rax)
	leaq	-1(%rax), %r13
	jne	.L203
	movq	%rsi, %r8
	leaq	1(%rbx,%rax), %rdx
	decq	%rsi
	subq	%rax, %r8
	call	memmove
	movq	%r13, %rax
.L203:
	incq	%rax
	jmp	.L194
.L228:
	cmpq	$2, %rsi
	jbe	.L205
	cmpb	$47, (%rbx)
	jne	.L206
	movb	1(%rbx), %al
	leal	-97(%rax), %edx
	cmpb	$25, %dl
	ja	.L193
	cmpb	$47, 2(%rbx)
	jne	.L193
	subl	$32, %eax
	movb	$58, 1(%rbx)
	movb	%al, (%rbx)
	jmp	.L193
.L205:
	jne	.L208
.L206:
	movb	(%rbx), %al
	subl	$65, %eax
	cmpb	$25, %al
	ja	.L209
	cmpb	$58, 1(%rbx)
	jmp	.L227
.L208:
	testq	%rsi, %rsi
	je	.L210
.L209:
	cmpb	$47, (%rbx)
.L227:
	je	.L193
.L210:
	testq	%rdi, %rdi
	jne	.L212
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	getcwd
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L193
.L212:
	movq	%rdi, %rcx
	call	strlen
	xorl	%r8d, %r8d
	movq	%r12, %rcx
	leaq	2(%rsi,%rax), %r13
	movq	%r13, %rdx
	call	create_string_check
	movq	%rdi, %r8
	movq	%rbx, %r9
	movq	%rbp, %rdx
	movq	%rax, %rsi
	movq	%rax, %rcx
	xorl	%edi, %edi
	call	sprintf
	movq	%rsi, %rcx
	movl	$1, %r8d
	movq	%r13, %rdx
	call	create_string_check
	movq	%rax, %rcx
	jmp	.L213
.L193:
	addq	$40, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.section .rdata,"dr"
.LC40:
	.ascii "%zu/%zu bytes\0"
.LC41:
	.ascii "Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu\0"
	.text
	.def	get_info;	.scl	3;	.type	32;	.endef
get_info:
	pushq	%r12
	pushq	%rbp
	xorl	%ebp, %ebp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$64, %rsp
	movq	all_string_list(%rip), %rax
.L231:
	testq	%rax, %rax
	je	.L234
	movq	16(%rax), %rax
	incq	%rbp
	jmp	.L231
.L234:
	leaq	.LC38(%rip), %rbx
	xorl	%r8d, %r8d
	movl	$48, %edx
	movq	%rbx, %rcx
	leaq	.LC40(%rip), %r12
	call	create_string_check
	movq	struct_memory_count(%rip), %r9
	movq	%r12, %rdx
	movq	struct_memory_used(%rip), %r8
	movq	%rax, %rsi
	movq	struct_memory(%rip), %rax
	movq	%rsi, %rcx
	addq	8(%rax), %r8
	call	sprintf
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	movl	$48, %edx
	call	create_string_check
	movq	string_memory_count(%rip), %r9
	movq	%r12, %rdx
	movq	string_memory_used(%rip), %r8
	movq	%rax, %rdi
	movq	string_memory(%rip), %rax
	movq	%rdi, %rcx
	addq	8(%rax), %r8
	call	sprintf
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	movl	$240, %edx
	call	create_string_check
	movq	%rbp, 40(%rsp)
	movq	%rsi, %r9
	movl	$2, %r8d
	movq	%rax, %rbx
	movq	memoryBlockCount(%rip), %rax
	movq	%rdi, 32(%rsp)
	leaq	.LC41(%rip), %rdx
	movq	%rbx, %rcx
	movq	%rax, 48(%rsp)
	call	sprintf
	addq	$64, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.section .rdata,"dr"
.LC42:
	.ascii "%s.%s\0"
	.text
	.def	make_method_name;	.scl	3;	.type	32;	.endef
make_method_name:
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	subq	$32, %rsp
	call	strlen
	movq	%rdi, %rcx
	movq	%rax, %rbx
	call	strlen
	movl	$1, %r8d
	leaq	.LC38(%rip), %rcx
	leaq	2(%rbx,%rax), %rdx
	call	create_string_check
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC42(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rbx
	call	sprintf
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.section .rdata,"dr"
.LC43:
	.ascii "/\0"
	.text
	.def	get_file_dir;	.scl	3;	.type	32;	.endef
get_file_dir:
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L258
	pushq	%rbp
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	xorl	%esi, %esi
	pushq	%rbx
	xorl	%ebx, %ebx
	subq	$40, %rsp
.L240:
	movq	8(%rax), %rbp
	testq	%rbp, %rbp
	je	.L239
	movq	(%rax), %rcx
	incq	%rsi
	call	strlen
	addq	%rax, %rbx
	movq	%rbp, %rax
	jmp	.L240
.L239:
	testq	%rsi, %rsi
	je	.L237
	cmpq	$1, %rsi
	je	.L241
	leaq	-1(%rbx,%rsi), %rbx
.L241:
	leaq	1(%rbx), %rdx
	xorl	%r8d, %r8d
	leaq	.LC38(%rip), %rcx
	call	create_string_check
	movb	$0, (%rax)
	movq	%rax, %rbx
	movq	(%rdi), %rsi
	movb	$1, %al
	leaq	.LC43(%rip), %rdi
.L242:
	testq	%rsi, %rsi
	je	.L261
	cmpq	$0, 8(%rsi)
	je	.L243
	testb	%al, %al
	jne	.L244
	movq	(%rsi), %rcx
	movq	%rdi, %rdx
	call	strcmp
	testl	%eax, %eax
	je	.L244
	cmpb	$0, (%rbx)
	je	.L244
	movq	%rbx, %rcx
	call	strlen
	cmpb	$47, -1(%rbx,%rax)
	je	.L244
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	strcat
.L244:
	movq	(%rsi), %rdx
	movq	%rbx, %rcx
	call	strcat
	xorl	%eax, %eax
.L243:
	movq	8(%rsi), %rsi
	jmp	.L242
.L261:
	movq	%rbx, %rcx
	call	strlen
	addq	$40, %rsp
	movq	%rbx, %rcx
	movl	$1, %r8d
	popq	%rbx
	movq	%rax, %rdx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	create_string_check
.L237:
	addq	$40, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L258:
	xorl	%eax, %eax
	ret
	.section .rdata,"dr"
.LC44:
	.ascii "%s/%s%s\0"
.LC45:
	.ascii "%s%s\0"
	.text
	.def	rebuild_full_path;	.scl	3;	.type	32;	.endef
rebuild_full_path:
	pushq	%r14
	pushq	%r13
	leaq	.LC38(%rip), %r13
	pushq	%r12
	movq	%r13, %r12
	pushq	%rbp
	movq	%r13, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$48, %rsp
	call	get_file_dir
	movq	8(%rbx), %r14
	testq	%rax, %rax
	movq	%rax, %rdi
	cmovne	%rax, %r12
	testq	%r14, %r14
	cmovne	%r14, %rbp
	movq	%r12, %rcx
	call	strlen
	movq	16(%rbx), %rcx
	movq	%rax, %rsi
	call	strlen
	leaq	1(%rsi,%rax), %rsi
	testq	%r14, %r14
	je	.L265
	movq	%rbp, %rcx
	call	strlen
	addq	%rax, %rsi
.L265:
	xorl	%r8d, %r8d
	leaq	1(%rsi), %rdx
	movq	%r13, %rcx
	call	create_string_check
	testq	%rdi, %rdi
	movq	16(%rbx), %r8
	movq	%rax, %rsi
	je	.L266
	cmpb	$0, (%r12)
	je	.L266
	movq	%rbp, 32(%rsp)
	movq	%r8, %r9
	leaq	.LC44(%rip), %rdx
	movq	%r12, %r8
	movq	%rax, %rcx
	call	sprintf
	jmp	.L267
.L266:
	movq	%rbp, %r9
	leaq	.LC45(%rip), %rdx
	movq	%rsi, %rcx
	call	sprintf
.L267:
	movq	%rsi, %rcx
	call	strlen
	movq	%rsi, %rcx
	movl	$1, %r8d
	movq	%rax, %rdx
	call	create_string_check
	movq	%rax, 24(%rbx)
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
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
	xorl	%eax, %eax
.L278:
	cmpq	(%rsi), %rax
	jnb	.L282
	movb	(%rbx,%rax), %dl
	andl	$-5, %edx
	cmpb	$9, %dl
	jne	.L279
	movb	$32, (%rbx,%rax)
.L279:
	incq	%rax
	jmp	.L278
.L282:
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.def	create_lexer;	.scl	3;	.type	32;	.endef
create_lexer:
	pushq	%rdi
	movq	%rcx, %rdi
	movl	$88, %ecx
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movq	%r8, %rbx
	subq	$32, %rsp
	call	alloc_memory
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rdi, 8(%rax)
	movq	%rdx, 16(%rax)
	movq	%rsi, 24(%rax)
	movq	%rcx, 32(%rax)
	movq	%rcx, 40(%rax)
	movq	%rcx, 48(%rax)
	movq	%rcx, 56(%rax)
	movq	%rcx, 64(%rax)
	movq	%rcx, 72(%rax)
	movq	%rcx, 80(%rax)
	movq	%rbx, (%rax)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.def	create_token;	.scl	3;	.type	32;	.endef
create_token:
	pushq	%rbp
	movl	%ecx, %ebp
	movl	$32, %ecx
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	movq	%r8, %rsi
	pushq	%rbx
	movq	%r9, %rbx
	subq	$40, %rsp
	call	alloc_memory
	movl	%ebp, 24(%rax)
	movq	%rdi, (%rax)
	movq	%rsi, 8(%rax)
	movq	%rbx, 16(%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.def	create_list;	.scl	3;	.type	32;	.endef
create_list:
	subq	$40, %rsp
	movl	$16, %ecx
	call	alloc_memory
	xorl	%edx, %edx
	movq	%rdx, (%rax)
	movq	%rdx, 8(%rax)
	addq	$40, %rsp
	ret
	.def	list_copy;	.scl	3;	.type	32;	.endef
list_copy:
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$32, %rsp
	testq	%rcx, %rcx
	je	.L290
	call	create_list
	movq	(%rbx), %rdx
	movq	%rdx, (%rax)
	movq	8(%rbx), %rdx
	movq	%rax, %rbx
	movq	%rdx, 8(%rax)
.L290:
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	ret
	.section .rdata,"dr"
.LC46:
	.ascii "type: \"name\"\12\0"
.LC47:
	.ascii "name\12\0"
.LC48:
	.ascii "type: \"function_call\"\12\0"
.LC49:
	.ascii "function\12\0"
.LC50:
	.ascii "arguments\12\0"
.LC51:
	.ascii "arguments[%d]\12\0"
.LC52:
	.ascii "type: \"get sequence_element\"\12\0"
.LC53:
	.ascii "sequence\12\0"
.LC54:
	.ascii "index\12\0"
.LC55:
	.ascii "type: \"get_attribute\"\12\0"
.LC56:
	.ascii "object\12\0"
.LC57:
	.ascii "attribute_name\12\0"
.LC58:
	.ascii "unknown_VariableAccessType: %u\12\0"
	.text
	.def	output_variable_access;	.scl	3;	.type	32;	.endef
output_variable_access:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rdi
	movq	%r8, %rdi
	pushq	%rsi
	movq	%r9, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$40, %rsp
	movl	16(%rcx), %eax
	cmpl	$2, %eax
	je	.L296
	ja	.L297
	testl	%eax, %eax
	leaq	1(%r8), %r13
	jne	.L305
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC46(%rip), %rcx
	call	fputs
	movq	%rsi, %r9
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	leaq	.LC47(%rip), %rcx
	movq	%rbx, %rdx
	call	fputs
	movq	8(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r13, %r8
	jmp	.L309
.L297:
	cmpl	$3, %eax
	jne	.L310
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	leaq	1(%rdi), %r12
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC52(%rip), %rcx
	call	fputs
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC53(%rip), %rcx
	call	fputs
	movq	0(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_variable_access
	movq	%rsi, %r9
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC54(%rip), %rcx
	call	fputs
	movq	8(%rbp), %rcx
	addq	$40, %rsp
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	output_expression
.L305:
	movq	8(%rcx), %rcx
	leaq	.LC51(%rip), %r14
	call	list_copy
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%rax, %r12
	call	indention
	movq	%rbx, %rdx
	leaq	.LC48(%rip), %rcx
	call	fputs
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC49(%rip), %rcx
	call	fputs
	movq	0(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r13, %r8
	movq	%rbx, %rdx
	orl	$-1, %ebp
	call	output_variable_access
	movq	%rdi, %rdx
	movq	%rsi, %r9
	movq	%rbx, %rcx
	movl	$1, %r8d
	addq	$2, %rdi
	call	indention
	movq	%rbx, %rdx
	leaq	.LC50(%rip), %rcx
	call	fputs
.L302:
	movq	%r12, %rcx
	call	list_pop
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L311
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	incl	%ebp
	movq	%r14, %rdx
	movq	%rbx, %rcx
	movl	%ebp, %r8d
	call	fprintf
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	movq	%r15, %rcx
	call	output_expression
	jmp	.L302
.L296:
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	leaq	1(%rdi), %r12
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC55(%rip), %rcx
	call	fputs
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC56(%rip), %rcx
	call	fputs
	movq	0(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_variable_access
	movq	%rsi, %r9
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	leaq	.LC57(%rip), %rcx
	movq	%rbx, %rdx
	call	fputs
	movq	8(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
.L309:
	addq	$40, %rsp
	movq	%rbx, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	output_name
.L310:
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movl	16(%rbp), %r8d
	addq	$40, %rsp
	movq	%rbx, %rcx
	leaq	.LC58(%rip), %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fprintf
.L311:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.section .rdata,"dr"
.LC59:
	.ascii "UNKNOWN_OPERATOR\0"
.LC60:
	.ascii "primary\12\0"
.LC61:
	.ascii "type: \"integer\"\12\0"
.LC62:
	.ascii "value: %s\12\0"
.LC63:
	.ascii "type: \"float\"\12\0"
.LC64:
	.ascii "type: \"string\"\12\0"
.LC65:
	.ascii "value: \"%s\"\12\0"
.LC66:
	.ascii "type: \"boolean\"\12\0"
.LC67:
	.ascii "value: \"true\"\12\0"
.LC68:
	.ascii "value: \"false\"\12\0"
.LC69:
	.ascii "type: \"expression\"\12\0"
.LC70:
	.ascii "value\12\0"
.LC71:
	.ascii "type: \"!\"\12\0"
.LC72:
	.ascii "type: \"-\"\12\0"
.LC73:
	.ascii "type: \"variable\"\12\0"
.LC74:
	.ascii "unknown_PrimaryType: %u\12\0"
.LC75:
	.ascii "operator: \"%s\"\12\0"
.LC76:
	.ascii "left\12\0"
.LC77:
	.ascii "right\12\0"
	.text
	.def	output_expression;	.scl	3;	.type	32;	.endef
output_expression:
	pushq	%r15
	pushq	%r14
	leaq	.LC59(%rip), %r14
	pushq	%r13
	leaq	.L330(%rip), %r13
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rbp
	movq	%r8, %rbp
	pushq	%rdi
	pushq	%rsi
	movq	%r9, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$40, %rsp
.L350:
	movl	24(%r12), %eax
	cmpl	$19, %eax
	jne	.L313
	movq	%rbp, %rdx
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %rdx
	addq	$2, %rbp
	leaq	.LC60(%rip), %rcx
	call	fputs
	movq	8(%r12), %r12
	leaq	.L317(%rip), %r15
.L314:
	cmpl	$8, 8(%r12)
	leaq	-1(%rbp), %rdi
	ja	.L315
	movl	8(%r12), %eax
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movslq	(%r15,%rax,4), %rax
	addq	%r15, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L317:
	.long	.L325-.L317
	.long	.L324-.L317
	.long	.L323-.L317
	.long	.L322-.L317
	.long	.L321-.L317
	.long	.L320-.L317
	.long	.L319-.L317
	.long	.L318-.L317
	.long	.L316-.L317
	.text
.L325:
	call	indention
	movq	%rbx, %rdx
	leaq	.LC61(%rip), %rcx
	jmp	.L355
.L324:
	call	indention
	movq	%rbx, %rdx
	leaq	.LC63(%rip), %rcx
.L355:
	call	fputs
	movq	%rdi, %rdx
	movq	%rsi, %r9
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	(%r12), %r8
	leaq	.LC62(%rip), %rdx
.L356:
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
.L323:
	call	indention
	movq	%rbx, %rdx
	leaq	.LC64(%rip), %rcx
	call	fputs
	movq	%rdi, %rdx
	movq	%rsi, %r9
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	(%r12), %r8
	leaq	.LC65(%rip), %rdx
	jmp	.L356
.L322:
	call	indention
	movq	%rbx, %rdx
	leaq	.LC66(%rip), %rcx
	call	fputs
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%rsi, %r9
	movl	$1, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC67(%rip), %rcx
	jmp	.L357
.L321:
	call	indention
	movq	%rbx, %rdx
	leaq	.LC66(%rip), %rcx
	call	fputs
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%rsi, %r9
	movl	$1, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC68(%rip), %rcx
.L357:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fputs
.L320:
	call	indention
	movq	%rbx, %rdx
	leaq	.LC69(%rip), %rcx
	call	fputs
	movq	%rsi, %r9
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC70(%rip), %rcx
	call	fputs
	movq	(%r12), %r12
	jmp	.L350
.L319:
	call	indention
	movq	%rbx, %rdx
	leaq	.LC71(%rip), %rcx
	jmp	.L354
.L318:
	call	indention
	movq	%rbx, %rdx
	leaq	.LC72(%rip), %rcx
.L354:
	call	fputs
	movq	%rsi, %r9
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	incq	%rbp
	call	indention
	movq	%rbx, %rdx
	leaq	.LC70(%rip), %rcx
	call	fputs
	movq	(%r12), %r12
	jmp	.L314
.L316:
	call	indention
	movq	%rbx, %rdx
	leaq	.LC73(%rip), %rcx
	call	fputs
	movq	%rsi, %r9
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC70(%rip), %rcx
	call	fputs
	movq	(%r12), %rcx
	addq	$40, %rsp
	movq	%rsi, %r9
	movq	%rbp, %r8
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
.L315:
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	movq	%rsi, %r9
	movl	$1, %r8d
	call	indention
	movl	8(%r12), %r8d
	addq	$40, %rsp
	movq	%rbx, %rcx
	leaq	.LC74(%rip), %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fprintf
.L313:
	xorl	%edi, %edi
	cmpl	$18, %eax
	ja	.L328
	movslq	0(%r13,%rax,4), %rax
	addq	%r13, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L330:
	.long	.L348-.L330
	.long	.L347-.L330
	.long	.L346-.L330
	.long	.L345-.L330
	.long	.L344-.L330
	.long	.L343-.L330
	.long	.L342-.L330
	.long	.L341-.L330
	.long	.L340-.L330
	.long	.L339-.L330
	.long	.L338-.L330
	.long	.L337-.L330
	.long	.L336-.L330
	.long	.L335-.L330
	.long	.L334-.L330
	.long	.L333-.L330
	.long	.L332-.L330
	.long	.L331-.L330
	.long	.L329-.L330
	.text
.L335:
	movq	144+symbolList(%rip), %rdi
	jmp	.L328
.L334:
	movq	184+symbolList(%rip), %rdi
	jmp	.L328
.L333:
	movq	192+symbolList(%rip), %rdi
	jmp	.L328
.L332:
	movq	200+symbolList(%rip), %rdi
	jmp	.L328
.L331:
	movq	208+symbolList(%rip), %rdi
	jmp	.L328
.L329:
	movq	216+symbolList(%rip), %rdi
	jmp	.L328
.L337:
	movq	224+symbolList(%rip), %rdi
	jmp	.L328
.L336:
	movq	232+symbolList(%rip), %rdi
	jmp	.L328
.L343:
	movq	152+symbolList(%rip), %rdi
	jmp	.L328
.L342:
	movq	160+symbolList(%rip), %rdi
	jmp	.L328
.L341:
	movq	128+symbolList(%rip), %rdi
	jmp	.L328
.L340:
	movq	136+symbolList(%rip), %rdi
	jmp	.L328
.L339:
	movq	168+symbolList(%rip), %rdi
	jmp	.L328
.L338:
	movq	176+symbolList(%rip), %rdi
	jmp	.L328
.L348:
	movq	88+symbolList(%rip), %rdi
	jmp	.L328
.L347:
	movq	96+symbolList(%rip), %rdi
	jmp	.L328
.L346:
	movq	104+symbolList(%rip), %rdi
	jmp	.L328
.L345:
	movq	112+symbolList(%rip), %rdi
	jmp	.L328
.L344:
	movq	120+symbolList(%rip), %rdi
.L328:
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	testq	%rdi, %rdi
	leaq	.LC75(%rip), %rdx
	movq	%rbx, %rcx
	cmove	%r14, %rdi
	movq	%rdi, %r8
	leaq	1(%rbp), %rdi
	call	fprintf
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC76(%rip), %rcx
	call	fputs
	movq	(%r12), %rcx
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	output_expression
	movq	%rbp, %rdx
	movq	%rsi, %r9
	movq	%rbx, %rcx
	movl	$1, %r8d
	movq	%rdi, %rbp
	call	indention
	movq	%rbx, %rdx
	leaq	.LC77(%rip), %rcx
	call	fputs
	movq	16(%r12), %r12
	jmp	.L350
	.section .rdata,"dr"
.LC78:
	.ascii "value: \"NULL\"\12\0"
	.text
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
	movq	%rbx, %rdx
	leaq	.LC10(%rip), %rcx
	call	fputs
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
	movq	%rbx, %rdx
	leaq	.LC47(%rip), %rcx
	call	fputs
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
	je	.L359
	call	indention
	movq	%rbx, %rdx
	leaq	.LC70(%rip), %rcx
	call	fputs
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
.L359:
	call	indention
	addq	$32, %rsp
	movq	%rbx, %rdx
	leaq	.LC78(%rip), %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	fputs
	.section .rdata,"dr"
.LC79:
	.ascii "if_statement\12\0"
.LC80:
	.ascii "condition\12\0"
.LC81:
	.ascii "body\12\0"
.LC82:
	.ascii "else_if\12\0"
.LC83:
	.ascii "else_body\12\0"
.LC84:
	.ascii "for_statement\12\0"
.LC85:
	.ascii "initializer\12\0"
.LC86:
	.ascii "initializer: \"NULL\"\12\0"
.LC87:
	.ascii "condition: \"NULL\"\12\0"
.LC88:
	.ascii "increment\12\0"
.LC89:
	.ascii "increment: \"NULL\"\12\0"
.LC90:
	.ascii "while_statement\12\0"
.LC91:
	.ascii "variable_declaration_statement\12\0"
.LC92:
	.ascii "return_statement: \"NULL\"\12\0"
.LC93:
	.ascii "return_statement\12\0"
.LC94:
	.ascii "break_statement: \"NULL\"\12\0"
.LC95:
	.ascii "continue_statement: \"NULL\"\12\0"
.LC96:
	.ascii "expression_statement: \"NULL\"\12\0"
.LC97:
	.ascii "expression_statement\12\0"
.LC98:
	.ascii "unknown_StatementType: %u\12\0"
	.text
	.def	output_statement;	.scl	3;	.type	32;	.endef
output_statement:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	movq	%r8, %rbx
	subq	$72, %rsp
	cmpl	$7, 8(%rcx)
	movq	%rdx, 40(%rsp)
	movq	%r9, 48(%rsp)
	ja	.L362
	movl	8(%rcx), %eax
	leaq	.L364(%rip), %rdx
	movq	48(%rsp), %r9
	xorl	%r8d, %r8d
	movq	40(%rsp), %rcx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	movq	%rbx, %rdx
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L364:
	.long	.L371-.L364
	.long	.L370-.L364
	.long	.L369-.L364
	.long	.L368-.L364
	.long	.L367-.L364
	.long	.L366-.L364
	.long	.L365-.L364
	.long	.L363-.L364
	.text
.L369:
	call	indention
	movq	40(%rsp), %rdx
	leaq	1(%rbx), %rdi
	leaq	.LC79(%rip), %rcx
	leaq	.LC80(%rip), %r14
	call	fputs
	movq	(%rsi), %r15
	leaq	2(%rbx), %rsi
	movq	8(%r15), %rcx
	call	list_copy
	movq	16(%r15), %rcx
	movq	%rax, %r13
	call	list_copy
	movq	24(%r15), %rcx
	movq	%rax, %r12
	call	list_copy
	movq	48(%rsp), %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	40(%rsp), %rcx
	movq	%rax, %rbp
	call	indention
	movq	40(%rsp), %rdx
	movq	%r14, %rcx
	call	fputs
	movq	(%r15), %rcx
	movq	48(%rsp), %r9
	movq	%rsi, %r8
	movq	40(%rsp), %rdx
	leaq	.LC81(%rip), %r15
	call	output_expression
	movq	40(%rsp), %rcx
	movq	%rdi, %rdx
	xorl	%r8d, %r8d
	movq	48(%rsp), %r9
	call	indention
	movq	40(%rsp), %rdx
	movq	%r15, %rcx
	call	fputs
.L372:
	movq	%r13, %rcx
	call	list_pop
	movq	48(%rsp), %r9
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L397
	movq	40(%rsp), %rdx
	movq	%rsi, %r8
	call	output_statement
	jmp	.L372
.L397:
	movq	40(%rsp), %rcx
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC82(%rip), %rcx
	call	fputs
	leaq	3(%rbx), %rax
	movq	%rax, 56(%rsp)
.L374:
	movq	%r12, %rcx
	call	list_pop
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L398
	movq	8(%r13), %rcx
	call	list_copy
	movq	48(%rsp), %r9
	xorl	%r8d, %r8d
	movq	%rsi, %rdx
	movq	40(%rsp), %rcx
	movq	%rax, %rbx
	call	indention
	movq	40(%rsp), %rdx
	movq	%r14, %rcx
	call	fputs
	movq	48(%rsp), %r9
	movq	56(%rsp), %r8
	movq	40(%rsp), %rdx
	movq	0(%r13), %rcx
	call	output_expression
	movq	40(%rsp), %rcx
	movq	48(%rsp), %r9
	movq	%rsi, %rdx
	movl	$1, %r8d
	call	indention
	movq	40(%rsp), %rdx
	movq	%r15, %rcx
	call	fputs
.L375:
	movq	%rbx, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L374
	movq	48(%rsp), %r9
	movq	56(%rsp), %r8
	movq	40(%rsp), %rdx
	call	output_statement
	jmp	.L375
.L398:
	movq	40(%rsp), %rcx
	movq	48(%rsp), %r9
	movq	%rdi, %rdx
	movl	$1, %r8d
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC83(%rip), %rcx
	call	fputs
.L378:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L361
	movq	48(%rsp), %r9
	movq	40(%rsp), %rdx
	movq	%rsi, %r8
	call	output_statement
	jmp	.L378
.L367:
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC84(%rip), %rcx
	leaq	1(%rbx), %rdi
	call	fputs
	movq	(%rsi), %rsi
	movq	24(%rsi), %rcx
	call	list_copy
	xorl	%r8d, %r8d
	cmpq	$0, (%rsi)
	movq	%rdi, %rdx
	movq	48(%rsp), %r9
	movq	40(%rsp), %rcx
	movq	%rax, %rbp
	je	.L381
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC85(%rip), %rcx
	call	fputs
	movq	48(%rsp), %r9
	movq	(%rsi), %rcx
	leaq	2(%rbx), %r8
	movq	40(%rsp), %rdx
	call	output_variable
	jmp	.L382
.L381:
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC86(%rip), %rcx
	call	fputs
.L382:
	xorl	%r8d, %r8d
	cmpq	$0, 8(%rsi)
	movq	48(%rsp), %r9
	movq	%rdi, %rdx
	movq	40(%rsp), %rcx
	je	.L383
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC80(%rip), %rcx
	call	fputs
	movq	8(%rsi), %rcx
	movq	48(%rsp), %r9
	leaq	2(%rbx), %r8
	movq	40(%rsp), %rdx
	call	output_expression
	jmp	.L384
.L383:
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC87(%rip), %rcx
	call	fputs
.L384:
	xorl	%r8d, %r8d
	cmpq	$0, 16(%rsi)
	movq	48(%rsp), %r9
	movq	%rdi, %rdx
	movq	40(%rsp), %rcx
	je	.L385
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC88(%rip), %rcx
	call	fputs
	movq	16(%rsi), %rcx
	movq	48(%rsp), %r9
	leaq	2(%rbx), %r8
	movq	40(%rsp), %rdx
	call	output_expression
	jmp	.L386
.L385:
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC89(%rip), %rcx
	call	fputs
.L386:
	movq	48(%rsp), %r9
	movq	40(%rsp), %rcx
	movq	%rdi, %rdx
	addq	$2, %rbx
	movl	$1, %r8d
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC81(%rip), %rcx
	call	fputs
.L387:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L361
	movq	48(%rsp), %r9
	movq	40(%rsp), %rdx
	movq	%rbx, %r8
	call	output_statement
	jmp	.L387
.L368:
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC90(%rip), %rcx
	leaq	1(%rbx), %rdi
	addq	$2, %rbx
	call	fputs
	movq	(%rsi), %rbp
	movq	8(%rbp), %rcx
	call	list_copy
	movq	48(%rsp), %r9
	xorl	%r8d, %r8d
	movq	%rdi, %rdx
	movq	40(%rsp), %rcx
	movq	%rax, %rsi
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC80(%rip), %rcx
	call	fputs
	movq	48(%rsp), %r9
	movq	40(%rsp), %rdx
	movq	%rbx, %r8
	movq	0(%rbp), %rcx
	call	output_expression
	movq	40(%rsp), %rcx
	movq	48(%rsp), %r9
	movq	%rdi, %rdx
	movl	$1, %r8d
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC81(%rip), %rcx
	call	fputs
.L390:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L361
	movq	48(%rsp), %r9
	movq	40(%rsp), %rdx
	movq	%rbx, %r8
	call	output_statement
	jmp	.L390
.L370:
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC91(%rip), %rcx
	call	fputs
	movq	(%rsi), %rcx
	movq	48(%rsp), %r9
	leaq	1(%rbx), %r8
	movq	40(%rsp), %rdx
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	output_variable
.L366:
	cmpq	$0, (%rsi)
	jne	.L392
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC92(%rip), %rcx
	jmp	.L395
.L392:
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC93(%rip), %rcx
	jmp	.L396
.L365:
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC94(%rip), %rcx
.L395:
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fputs
.L363:
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC95(%rip), %rcx
	jmp	.L395
.L371:
	cmpq	$0, (%rsi)
	jne	.L393
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC96(%rip), %rcx
	jmp	.L395
.L393:
	call	indention
	movq	40(%rsp), %rdx
	leaq	.LC97(%rip), %rcx
.L396:
	call	fputs
	movq	(%rsi), %rcx
	movq	48(%rsp), %r9
	leaq	1(%rbx), %r8
	movq	40(%rsp), %rdx
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	output_expression
.L362:
	movq	40(%rsp), %rcx
	movq	48(%rsp), %r9
	movq	%rbx, %rdx
	xorl	%r8d, %r8d
	call	indention
	movl	8(%rsi), %r8d
	movq	40(%rsp), %rcx
	addq	$72, %rsp
	popq	%rbx
	leaq	.LC98(%rip), %rdx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fprintf
.L361:
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.def	create_symbol_table;	.scl	3;	.type	32;	.endef
create_symbol_table:
	pushq	%rsi
	movq	%rcx, %rsi
	movl	$16, %ecx
	pushq	%rbx
	subq	$40, %rsp
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rax, %rbx
	call	create_list
	movq	%rax, 8(%rbx)
	addq	$40, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	ret
	.section .rdata,"dr"
.LC99:
	.ascii "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\12\0"
.LC100:
	.ascii "Error creating variable access: content is NULL\12\0"
.LC101:
	.ascii "Error creating variable access: unknown type %u\12\0"
	.text
	.def	create_variable_access;	.scl	3;	.type	32;	.endef
create_variable_access:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movl	%ecx, %ebx
	subq	$56, %rsp
	testl	%ecx, %ecx
	sete	%al
	testq	%rdx, %rdx
	movq	144(%rsp), %r12
	sete	%r13b
	cmpb	%al, %r13b
	je	.L402
	leaq	.LC18(%rip), %rax
	testl	%ecx, %ecx
	leaq	.LC19(%rip), %r8
	movl	$2, %ecx
	movq	%rax, %r9
	cmovne	%r8, %r9
	testq	%rdx, %rdx
	cmove	%rax, %r8
	movq	%r9, 40(%rsp)
	movq	%r8, 32(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	40(%rsp), %r9
	movq	32(%rsp), %r8
	leaq	.LC99(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L405
.L402:
	movq	%r8, %rdi
	movl	$24, %ecx
	movq	%r9, %rsi
	call	alloc_memory
	testq	%rdi, %rdi
	movl	%ebx, 16(%rax)
	setne	%dl
	movq	%rbp, (%rax)
	testb	%r13b, %r13b
	je	.L406
	testb	%dl, %dl
	jne	.L440
.L406:
	cmpl	$1, %ebx
	jne	.L408
	testq	%r12, %r12
	je	.L408
	movq	%r12, 8(%rax)
	jmp	.L401
.L408:
	cmpl	$3, %ebx
	jne	.L410
	testq	%rsi, %rsi
	je	.L410
	movq	%rsi, 8(%rax)
	jmp	.L401
.L410:
	cmpl	$2, %ebx
	jne	.L411
	testb	%dl, %dl
	je	.L411
.L440:
	movq	%rdi, 8(%rax)
	jmp	.L401
.L411:
	orq	%r12, %rsi
	movq	__imp___acrt_iob_func(%rip), %rax
	movl	$2, %ecx
	orq	%rsi, %rdi
	jne	.L412
	call	*%rax
	leaq	.LC100(%rip), %rcx
	movq	%rax, %rdx
	call	fputs
	jmp	.L405
.L412:
	call	*%rax
	movl	%ebx, %r8d
	leaq	.LC101(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L405:
	xorl	%eax, %eax
.L401:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.section .rdata,"dr"
.LC102:
	.ascii "Error creating primary: value is NULL\12\0"
.LC103:
	.ascii "Error creating primary: unknown type %u\12\0"
	.text
	.def	create_primary;	.scl	3;	.type	32;	.endef
create_primary:
	pushq	%r12
	movq	%r9, %r12
	pushq	%rbp
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	movq	%r8, %rsi
	pushq	%rbx
	movl	%ecx, %ebx
	movl	$16, %ecx
	subq	$32, %rsp
	movq	112(%rsp), %rbp
	call	alloc_memory
	movl	%ebx, 8(%rax)
	cmpl	$4, %ebx
	ja	.L442
	testq	%rdi, %rdi
	je	.L442
	movq	%rdi, (%rax)
	jmp	.L441
.L442:
	cmpl	$5, %ebx
	jne	.L444
	testq	%rsi, %rsi
	je	.L444
	movq	%rsi, (%rax)
	jmp	.L441
.L444:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L446
	testq	%r12, %r12
	je	.L446
	movq	%r12, (%rax)
	jmp	.L441
.L446:
	cmpl	$8, %ebx
	jne	.L447
	testq	%rbp, %rbp
	je	.L447
	movq	%rbp, (%rax)
	jmp	.L441
.L447:
	orq	%r12, %rbp
	movq	__imp___acrt_iob_func(%rip), %rax
	movl	$2, %ecx
	orq	%rbp, %rsi
	orq	%rdi, %rsi
	jne	.L448
	call	*%rax
	leaq	.LC102(%rip), %rcx
	movq	%rax, %rdx
	call	fputs
	jmp	.L449
.L448:
	call	*%rax
	movl	%ebx, %r8d
	leaq	.LC103(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L449:
	xorl	%eax, %eax
.L441:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.section .rdata,"dr"
.LC104:
	.ascii "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\12\0"
.LC105:
	.ascii "Error creating expression: both expr_left and prim_left are NULL\12\0"
	.text
	.def	create_expression;	.scl	3;	.type	32;	.endef
create_expression:
	pushq	%r12
	movl	%ecx, %r12d
	pushq	%rbp
	movq	%r8, %rbp
	pushq	%rdi
	movq	%r9, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	subq	$64, %rsp
	cmpl	$19, %ecx
	sete	%dl
	testq	%r9, %r9
	sete	%al
	cmpb	%al, %dl
	jne	.L476
	movq	%r8, %rax
	orq	%rsi, %rax
	jne	.L493
	jmp	.L495
.L476:
	leaq	.LC19(%rip), %rbx
	leaq	.LC18(%rip), %rax
	testq	%r9, %r9
	movq	%rbx, %rdi
	cmove	%rax, %rdi
	testq	%r8, %r8
	cmove	%rax, %rbx
.L480:
	testq	%rsi, %rsi
	leaq	.LC19(%rip), %r9
	leaq	.LC18(%rip), %rax
	cmove	%rax, %r9
	jmp	.L481
.L495:
	testq	%r9, %r9
	jne	.L496
	leaq	.LC18(%rip), %rdi
	movq	%rdi, %rbx
	movq	%rdi, %r9
.L481:
	cmpl	$19, %r12d
	movq	%r9, 56(%rsp)
	movl	$2, %ecx
	leaq	.LC18(%rip), %rax
	leaq	.LC19(%rip), %r8
	cmove	%rax, %r8
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 40(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC104(%rip), %rdx
	movq	%rbx, 32(%rsp)
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
	jmp	.L483
.L493:
	movl	$32, %ecx
	call	alloc_memory
	movl	%r12d, 24(%rax)
	testq	%rsi, %rsi
	je	.L484
	movq	%rsi, (%rax)
	jmp	.L485
.L484:
	testq	%rbp, %rbp
	je	.L486
	movq	%rbp, 8(%rax)
	jmp	.L485
.L486:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC105(%rip), %rcx
	movq	%rax, %rdx
	call	fputs
.L483:
	xorl	%eax, %eax
	jmp	.L475
.L485:
	movq	%rdi, 16(%rax)
	jmp	.L475
.L496:
	leaq	.LC19(%rip), %rdi
	leaq	.LC18(%rip), %rbx
	jmp	.L480
.L475:
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.section .rdata,"dr"
.LC106:
	.ascii "Error creating variable: type or name is NULL\12\0"
	.text
	.def	create_variable;	.scl	3;	.type	32;	.endef
create_variable:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	testq	%rcx, %rcx
	je	.L501
	movq	%rdx, %rbx
	testq	%rdx, %rdx
	jne	.L498
.L501:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC106(%rip), %rcx
	movq	%rax, %rdx
	call	fputs
	xorl	%eax, %eax
	jmp	.L497
.L498:
	movq	%rcx, %rsi
	movl	$24, %ecx
	movq	%r8, %rdi
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rbx, 8(%rax)
	movq	%rdi, 16(%rax)
.L497:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.section .rdata,"dr"
.LC107:
	.ascii "Error creating statement: content is NULL\12\0"
.LC108:
	.ascii "Error creating statement: unknown type %u\12\0"
	.text
	.def	create_statement;	.scl	3;	.type	32;	.endef
create_statement:
	pushq	%r13
	movq	%r8, %r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	movq	%r9, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movl	%ecx, %ebx
	movl	$16, %ecx
	subq	$40, %rsp
	movq	128(%rsp), %r12
	movq	136(%rsp), %rbp
	call	alloc_memory
	movl	%ebx, 8(%rax)
	testl	%ebx, %ebx
	jne	.L504
	testq	%r12, %r12
	jne	.L546
.L504:
	cmpl	$1, %ebx
	jne	.L506
	testq	%rbp, %rbp
	je	.L506
	movq	%rbp, (%rax)
	jmp	.L503
.L506:
	cmpl	$2, %ebx
	jne	.L508
	testq	%rsi, %rsi
	je	.L508
	movq	%rsi, (%rax)
	jmp	.L503
.L508:
	cmpl	$3, %ebx
	jne	.L509
	testq	%r13, %r13
	je	.L509
	movq	%r13, (%rax)
	jmp	.L503
.L509:
	cmpl	$4, %ebx
	jne	.L510
	testq	%rdi, %rdi
	je	.L510
	movq	%rdi, (%rax)
	jmp	.L503
.L510:
	cmpl	$5, %ebx
	jne	.L511
.L546:
	movq	%r12, (%rax)
	jmp	.L503
.L511:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L512
	xorl	%edx, %edx
	movq	%rdx, (%rax)
	jmp	.L503
.L512:
	orq	%r13, %rdi
	movq	__imp___acrt_iob_func(%rip), %rax
	movl	$2, %ecx
	orq	%rdi, %rsi
	orq	%rsi, %rbp
	orq	%rbp, %r12
	jne	.L513
	call	*%rax
	leaq	.LC107(%rip), %rcx
	movq	%rax, %rdx
	call	fputs
	jmp	.L514
.L513:
	call	*%rax
	movl	%ebx, %r8d
	leaq	.LC108(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L514:
	xorl	%eax, %eax
.L503:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.section .rdata,"dr"
.LC109:
	.ascii "Error creating class member: content is NULL\12\0"
.LC110:
	.ascii "Error creating class member: unknown type %u\12\0"
	.text
	.def	create_class_member;	.scl	3;	.type	32;	.endef
create_class_member:
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	movq	%r8, %rsi
	pushq	%rbx
	movl	%ecx, %ebx
	movl	$16, %ecx
	subq	$32, %rsp
	call	alloc_memory
	movl	%ebx, 8(%rax)
	testb	$1, %bl
	jne	.L548
	testq	%rdi, %rdi
	je	.L548
	movq	%rdi, (%rax)
	jmp	.L547
.L548:
	testq	%rsi, %rsi
	je	.L550
	testb	$1, %bl
	je	.L550
	movq	%rsi, (%rax)
	jmp	.L547
.L550:
	orq	%rdi, %rsi
	movq	__imp___acrt_iob_func(%rip), %rax
	movl	$2, %ecx
	jne	.L552
	call	*%rax
	leaq	.LC109(%rip), %rcx
	movq	%rax, %rdx
	call	fputs
	jmp	.L553
.L552:
	call	*%rax
	movl	%ebx, %r8d
	leaq	.LC110(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L553:
	xorl	%eax, %eax
.L547:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.section .rdata,"dr"
.LC111:
	.ascii "Error creating code member: content is NULL\12\0"
.LC112:
	.ascii "Error creating code member: unknown type %u\12\0"
	.text
	.def	create_code_member;	.scl	3;	.type	32;	.endef
create_code_member:
	pushq	%r12
	movq	%r8, %r12
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rdi
	movq	%r9, %rdi
	pushq	%rsi
	movl	%ecx, %esi
	movl	$16, %ecx
	pushq	%rbx
	subq	$32, %rsp
	call	alloc_memory
	movl	%esi, 8(%rax)
	movq	%rax, %rbx
	testl	%esi, %esi
	jne	.L568
	testq	%rbp, %rbp
	je	.L568
	movq	%rbp, (%rax)
	jmp	.L567
.L568:
	cmpl	$1, %esi
	jne	.L570
	testq	%r12, %r12
	je	.L570
	movq	%r12, (%rbx)
	jmp	.L567
.L570:
	cmpl	$2, %esi
	jne	.L571
	testq	%rdi, %rdi
	je	.L571
	movq	%rdi, (%rbx)
	jmp	.L567
.L571:
	orq	%r12, %rdi
	movq	__imp___acrt_iob_func(%rip), %rax
	movl	$2, %ecx
	orq	%rdi, %rbp
	jne	.L572
	call	*%rax
	leaq	.LC111(%rip), %rcx
	movq	%rax, %rdx
	call	fputs
	jmp	.L567
.L572:
	call	*%rax
	movl	%esi, %r8d
	leaq	.LC112(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L567:
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.section .rdata,"dr"
.LC113:
	.ascii "Error: list_append received NULL list\12\0"
	.text
	.def	list_append;	.scl	3;	.type	32;	.endef
list_append:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	testq	%rcx, %rcx
	jne	.L593
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	addq	$40, %rsp
	leaq	.LC113(%rip), %rcx
	popq	%rbx
	movq	%rax, %rdx
	popq	%rsi
	jmp	fputs
.L593:
	movq	%rcx, %rbx
	movl	$16, %ecx
	movq	%rdx, %rsi
	call	alloc_memory
	xorl	%edx, %edx
	cmpq	$0, (%rbx)
	movq	%rdx, (%rax)
	movq	%rsi, 8(%rax)
	jne	.L594
	movq	%rax, (%rbx)
	jmp	.L597
.L594:
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
.L597:
	movq	%rax, 8(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.section .rdata,"dr"
.LC114:
	.ascii "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\12\0"
.LC115:
	.ascii "[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\12\0"
	.text
	.def	create_symbol;	.scl	3;	.type	32;	.endef
create_symbol:
	pushq	%r14
	movq	%r8, %r14
	pushq	%r13
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rbp
	pushq	%rdi
	movl	%edx, %edi
	pushq	%rsi
	movq	%r9, %rsi
	pushq	%rbx
	subq	$64, %rsp
	cmpl	$2, %edx
	je	.L599
	movq	%r9, %rbp
	ja	.L600
	cmpl	$1, %edx
	je	.L599
	movq	16(%r9), %rax
	jmp	.L616
.L599:
	movq	32(%rsi), %rax
.L616:
	movq	(%rax), %rbp
.L600:
	movq	%r12, %rdx
	movq	%rbp, %rcx
	call	search_name
	testq	%rax, %rax
	je	.L602
	movq	id_counter.0(%rip), %rdx
	movl	32(%rax), %r9d
	movl	$2, %ecx
	movq	16(%rax), %r13
	leaq	1(%rdx), %rbx
	movl	%r9d, 60(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 40(%rsp)
	movl	60(%rsp), %r9d
	movq	%r12, %r8
	movq	%r13, 32(%rsp)
	movq	%rax, %rcx
	leaq	.LC114(%rip), %rdx
	call	fprintf
.L602:
	movl	$40, %ecx
	call	alloc_memory
	movq	%r12, 8(%rax)
	movq	%rax, %rbx
	movq	id_counter.0(%rip), %rax
	movl	%edi, 32(%rbx)
	leaq	1(%rax), %r13
	movq	%r14, (%rbx)
	movq	%r13, id_counter.0(%rip)
	movq	%r13, 16(%rbx)
	movq	%rsi, 24(%rbx)
	testq	%rbp, %rbp
	jne	.L608
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%r13, 32(%rsp)
	movl	%edi, %r9d
	movq	%r12, %r8
	movq	%rax, %rcx
	leaq	.LC115(%rip), %rdx
	call	fprintf
	jmp	.L598
.L608:
	movq	8(%rbp), %rcx
	movq	%rbx, %rdx
	call	list_append
.L598:
	addq	$64, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.def	create_subroutine;	.scl	3;	.type	32;	.endef
create_subroutine:
	pushq	%rdi
	movq	%rcx, %rdi
	movl	$40, %ecx
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	subq	$32, %rsp
	call	alloc_memory
	movq	%rdi, (%rax)
	movq	%rax, %rbx
	movq	%rsi, 8(%rax)
	call	create_list
	movq	%rax, 16(%rbx)
	call	create_list
	movq	%rax, 24(%rbx)
	call	create_list
	movq	%rax, 32(%rbx)
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.def	create_block;	.scl	3;	.type	32;	.endef
create_block:
	pushq	%rsi
	movq	%rcx, %rsi
	movl	$16, %ecx
	pushq	%rbx
	subq	$40, %rsp
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rax, %rbx
	call	create_list
	movq	%rax, 8(%rbx)
	addq	$40, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	ret
	.def	create_arg;	.scl	3;	.type	32;	.endef
create_arg:
	pushq	%rsi
	movl	%ecx, %esi
	movl	$24, %ecx
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$40, %rsp
	call	alloc_memory
	xorl	%ecx, %ecx
	movl	%esi, 16(%rax)
	decl	%esi
	movq	%rcx, 8(%rax)
	cmpl	$7, %esi
	ja	.L623
	leaq	.L624(%rip), %rcx
	movslq	(%rcx,%rsi,4), %rdx
	addq	%rcx, %rdx
	jmp	*%rdx
	.section .rdata,"dr"
	.align 4
.L624:
	.long	.L630-.L624
	.long	.L629-.L624
	.long	.L628-.L624
	.long	.L627-.L624
	.long	.L626-.L624
	.long	.L625-.L624
	.long	.L623-.L624
	.long	.L623-.L624
	.text
.L630:
	movq	(%rbx), %rdx
	movq	%rdx, (%rax)
	movq	name_int(%rip), %rdx
	jmp	.L633
.L629:
	movsd	(%rbx), %xmm0
	movq	name_float(%rip), %rdx
	movsd	%xmm0, (%rax)
	jmp	.L633
.L628:
	movq	%rbx, (%rax)
	movq	name_string(%rip), %rdx
	jmp	.L633
.L627:
	movb	(%rbx), %dl
	movb	%dl, (%rax)
	movq	name_bool(%rip), %rdx
	jmp	.L633
.L626:
	xorl	%edx, %edx
	movq	%rdx, (%rax)
	movq	name_void(%rip), %rdx
	jmp	.L633
.L625:
	movq	%rbx, (%rax)
	jmp	.L631
.L623:
	movq	%rbx, (%rax)
	movq	16(%rbx), %rdx
.L633:
	movq	%rdx, 8(%rax)
.L631:
	movb	$0, 20(%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.def	create_instruction;	.scl	3;	.type	32;	.endef
create_instruction:
	pushq	%rbp
	movl	%ecx, %ebp
	movl	$32, %ecx
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	movq	%r8, %rsi
	pushq	%rbx
	movq	%r9, %rbx
	subq	$40, %rsp
	call	alloc_memory
	movl	%ebp, 24(%rax)
	movq	%rdi, (%rax)
	movq	%rsi, 8(%rax)
	movq	%rbx, 16(%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC116:
	.ascii "$%d-error\0"
.LC117:
	.ascii "$%c%zu\0"
	.text
	.def	create_var;	.scl	3;	.type	32;	.endef
create_var:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rdx, %r12
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rdi
	movl	%r8d, %edi
	pushq	%rsi
	movq	%r9, %rsi
	pushq	%rbx
	subq	$48, %rsp
	testq	%rcx, %rcx
	jne	.L637
.L670:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbp, (%rax)
	movq	%rax, %rbx
	cmpl	$112, %edi
	je	.L638
	ja	.L639
	cmpl	$98, %edi
	je	.L640
	cmpl	$102, %edi
	je	.L641
	cmpl	$97, %edi
	je	.L642
	jmp	.L689
.L639:
	cmpl	$116, %edi
	je	.L644
	cmpl	$118, %edi
	je	.L645
.L689:
	orq	$-1, %r9
	jmp	.L643
.L637:
	xorl	%r14d, %r14d
	cmpl	$0, 32(%rdx)
	jne	.L646
	movq	24(%rdx), %rax
	movq	24(%r9), %r14
	movq	%rax, 24(%r9)
.L646:
	movq	8(%rsi), %rax
	testq	%rax, %rax
	jne	.L647
.L650:
	movq	8(%rsi), %rax
	testq	%rax, %rax
	jne	.L648
	jmp	.L649
.L647:
	movq	24(%rax), %rcx
	testq	%rcx, %rcx
	je	.L650
	cmpq	$0, (%rcx)
	je	.L650
	cmpq	$0, 8(%rcx)
	je	.L650
	call	list_copy
	movq	%rax, %rcx
.L651:
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L650
	cmpq	(%rbx), %rbp
	jne	.L651
	jmp	.L652
.L648:
	movq	16(%rax), %rcx
	testq	%rcx, %rcx
	jne	.L690
.L649:
	cmpq	$0, 24(%rsi)
	movq	(%rsi), %rax
	jne	.L654
	jmp	.L655
.L690:
	cmpq	$0, (%rcx)
	je	.L649
	cmpq	$0, 8(%rcx)
	je	.L649
	call	list_copy
	movq	%rax, %rcx
.L656:
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L649
	cmpq	(%rbx), %rbp
	jne	.L656
	jmp	.L652
.L654:
	movq	(%rax), %rcx
	testq	%rcx, %rcx
	jne	.L691
.L655:
	movq	(%rsi), %rax
	movq	16(%rax), %rcx
	testq	%rcx, %rcx
	jne	.L658
	jmp	.L659
.L691:
	cmpq	$0, (%rcx)
	je	.L655
	cmpq	$0, 8(%rcx)
	je	.L655
	call	list_copy
	movq	%rax, %r13
.L660:
	movq	%r13, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L655
	movq	24(%rsi), %rdx
	movq	(%rdx), %rdx
	cmpq	%rdx, 8(%rax)
	jne	.L660
	movq	(%rax), %rcx
	testq	%rcx, %rcx
	je	.L660
	cmpq	$0, (%rcx)
	je	.L660
	cmpq	$0, 8(%rcx)
	je	.L660
	call	list_copy
	movq	%rax, %rcx
.L663:
	call	list_pop
	testq	%rax, %rax
	je	.L660
	movq	(%rax), %rbx
	cmpq	(%rbx), %rbp
	jne	.L663
	jmp	.L652
.L658:
	cmpq	$0, (%rcx)
	jne	.L692
.L659:
	xorl	%ebx, %ebx
	jmp	.L652
.L692:
	cmpq	$0, 8(%rcx)
	je	.L659
	call	list_copy
	movq	%rax, %rcx
.L666:
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L659
	cmpq	(%rbx), %rbp
	jne	.L666
.L652:
	cmpl	$0, 32(%r12)
	jne	.L668
	movq	%r14, 24(%rsi)
.L668:
	testq	%rbx, %rbx
	jne	.L636
	jmp	.L670
.L642:
	movq	48(%rsi), %r9
	leaq	1(%r9), %rax
	movq	%rax, 48(%rsi)
	jmp	.L643
.L638:
	movq	56(%rsi), %r9
	leaq	1(%r9), %rax
	movq	%rax, 56(%rsi)
	jmp	.L643
.L645:
	movq	64(%rsi), %r9
	leaq	1(%r9), %rax
	movq	%rax, 64(%rsi)
	jmp	.L643
.L644:
	movq	72(%rsi), %r9
	leaq	1(%r9), %rax
	movq	%rax, 72(%rsi)
	jmp	.L643
.L640:
	movq	80(%rsi), %r9
	leaq	1(%r9), %rax
	movq	%rax, 80(%rsi)
	jmp	.L643
.L641:
	movq	88(%rsi), %r9
	leaq	1(%r9), %rax
	movq	%rax, 88(%rsi)
.L643:
	movl	$1, %r8d
	movl	$32, %edx
	movq	%r9, 40(%rsp)
	leaq	.LC38(%rip), %rcx
	call	create_string_check
	movq	40(%rsp), %r9
	movl	%edi, %r8d
	movq	%rax, 8(%rbx)
	movq	%rax, %rcx
	cmpq	$-1, %r9
	jne	.L671
	leaq	.LC116(%rip), %rdx
	call	sprintf
	jmp	.L672
.L671:
	leaq	.LC117(%rip), %rdx
	call	sprintf
.L672:
	andl	$-3, %edi
	movq	%r12, 16(%rbx)
	cmpl	$116, %edi
	jne	.L636
	movq	8(%rsi), %rax
	movq	%rbx, %rdx
	movq	24(%rax), %rcx
	call	list_append
.L636:
	addq	$48, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.def	load_rvalue;	.scl	3;	.type	32;	.endef
load_rvalue:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$32, %rsp
	testq	%rcx, %rcx
	je	.L694
	cmpb	$0, 20(%rcx)
	je	.L694
	movq	%rdx, %rdi
	movq	8(%rcx), %rdx
	movl	$116, %r8d
	xorl	%ecx, %ecx
	movq	%rdi, %r9
	call	create_var
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	call	create_arg
	movq	%rbx, %r8
	xorl	%r9d, %r9d
	movl	$23, %ecx
	movq	%rax, %rdx
	movq	%rax, %rsi
	call	create_instruction
	movq	%rsi, %rbx
	movq	%rax, %rdx
	movq	16(%rdi), %rax
	movq	8(%rax), %rcx
	call	list_append
.L694:
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.section .rdata,"dr"
.LC118:
	.ascii "[Warning] Unsupported variable access with NULL base\12\0"
.LC119:
	.ascii "[Warning] Failed to generate variable access for base\12\0"
.LC120:
	.ascii "[Warning] Attempting to access attribute of non-object type: %s\12\0"
.LC121:
	.ascii "[Warning] Attribute '%s' not found in type '%s'\12\0"
.LC122:
	.ascii "[Warning] Attempting to access function '%s' as attribute of type '%s'\12\0"
.LC123:
	.ascii "[Warning] Symbol '%s' in type '%s' is not an attribute\12\0"
.LC124:
	.ascii "arr\0"
.LC125:
	.ascii "[Warning] Attempting to index non-array type: %s\12\0"
.LC126:
	.ascii "[Warning] Failed to generate variable access for index\12\0"
.LC127:
	.ascii "[Warning] Attempting to call non-function, kind: %u, type name: %s\12\0"
.LC128:
	.ascii "[Warning] Unsupported variable access type for tac_variable_access: %u\12\0"
	.text
	.def	tac_variable_access;	.scl	3;	.type	32;	.endef
tac_variable_access:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$88, %rsp
	cmpl	$0, 16(%rcx)
	jne	.L700
	movq	8(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L700
	movl	32(%rcx), %eax
	movq	%rbx, %r9
	leal	-1(%rax), %edx
	cmpl	$1, %edx
	ja	.L701
	movq	(%rcx), %rdx
	movl	$102, %r8d
	jmp	.L741
.L701:
	movl	$118, %r8d
	movq	%rcx, %rdx
	testl	%eax, %eax
	je	.L742
	movq	(%rcx), %rdx
.L742:
	call	create_var
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	jmp	.L740
.L700:
	movq	0(%rbp), %rcx
	testq	%rcx, %rcx
	jne	.L703
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC118(%rip), %rcx
	movq	%rax, %rdx
	jmp	.L735
.L703:
	movq	%rbx, %rdx
	call	tac_variable_access
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L705
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC119(%rip), %rcx
	movq	%rax, %rdx
.L735:
	call	fputs
	jmp	.L739
.L705:
	movl	16(%rbp), %r8d
	cmpl	$2, %r8d
	jne	.L707
	movq	8(%rax), %r12
	movl	32(%r12), %eax
	leal	-1(%rax), %edx
	cmpl	$1, %edx
	ja	.L708
	movq	8(%r12), %r8
	movl	$2, %ecx
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	48(%rsp), %r8
	leaq	.LC120(%rip), %rdx
	movq	%rax, %rcx
	jmp	.L736
.L708:
	movq	24(%r12), %rcx
	testl	%eax, %eax
	jne	.L709
	movq	16(%rcx), %rcx
.L709:
	movq	8(%rbp), %rax
	movq	8(%rax), %r13
	movq	%r13, %rdx
	call	search_name_use_strcmp
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L710
	movq	8(%r12), %r9
	movl	$2, %ecx
	movq	%r9, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	48(%rsp), %r9
	movq	%r13, %r8
	leaq	.LC121(%rip), %rdx
	movq	%rax, %rcx
	jmp	.L737
.L710:
	movl	32(%rax), %eax
	cmpl	$1, %eax
	jne	.L711
	movq	8(%r12), %r9
	movl	$2, %ecx
	movq	%r9, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	48(%rsp), %r9
	movq	%r13, %r8
	leaq	.LC122(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	(%rdi), %rdx
	movq	%rbx, %r9
	movq	%rdi, %rcx
	movl	$102, %r8d
.L741:
	call	create_var
	movl	$7, %ecx
	movq	%rax, %rdx
	jmp	.L740
.L711:
	cmpl	$2, %eax
	jne	.L712
	movq	(%rdi), %rdx
	movq	%rdi, %rcx
	movq	%rbx, %r9
	movl	$102, %r8d
	call	create_var
	movl	$8, %ecx
	movq	%rax, %rdx
.L740:
	addq	$88, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	jmp	create_arg
.L712:
	cmpl	$5, %eax
	je	.L713
	movq	8(%r12), %r9
	movl	$2, %ecx
	movq	%r9, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	48(%rsp), %r9
	movq	%r13, %r8
	leaq	.LC123(%rip), %rdx
	movq	%rax, %rcx
.L737:
	call	fprintf
	jmp	.L739
.L713:
	movq	(%rdi), %rdx
	movq	%rbx, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	call	create_var
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	call	create_arg
	movq	8(%rbp), %rcx
	movq	%rbx, %r9
	movl	$97, %r8d
	movq	%rax, %rdi
	movq	(%rcx), %rdx
	call	create_var
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	call	create_arg
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movl	$15, %ecx
	movq	%rax, %r9
	jmp	.L743
.L707:
	cmpl	$3, %r8d
	jne	.L714
	movq	8(%rax), %rax
	leaq	.LC124(%rip), %rdx
	movq	8(%rax), %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L715
	movq	(%rsi), %rax
	movl	$2, %ecx
	movq	(%rax), %rax
	movq	8(%rax), %r8
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	48(%rsp), %r8
	leaq	.LC125(%rip), %rdx
	movq	%rax, %rcx
.L736:
	call	fprintf
	jmp	.L739
.L715:
	movq	8(%rbp), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L716
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC126(%rip), %rcx
	movq	%rax, %rdx
	jmp	.L735
.L716:
	movq	name_int(%rip), %rdx
	movq	%rbx, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	call	create_var
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	call	create_arg
	movq	%rbp, %r9
	movq	%rsi, %r8
	movl	$16, %ecx
	movq	%rax, %rdi
	movq	%rax, %rdx
.L743:
	call	create_instruction
	movb	$1, 20(%rdi)
	movq	%rax, %rdx
	jmp	.L738
.L714:
	cmpl	$1, %r8d
	jne	.L717
	cmpl	$0, 16(%rax)
	jne	.L718
	movq	8(%rax), %rax
	cmpl	$0, 32(%rax)
	jne	.L718
	movq	8(%rax), %rcx
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	call	make_method_name
	movq	%rax, %rdx
	movq	8(%rsi), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rcx
	call	search_name_use_strcmp
	movq	%rbx, %r9
	movl	$102, %r8d
	movq	(%rax), %rdx
	movq	%rax, %rcx
	call	create_var
	movl	$8, %ecx
	movq	%rax, %rdx
	call	create_arg
	movq	%rax, %rsi
.L718:
	movl	16(%rsi), %r8d
	leal	-7(%r8), %eax
	movl	%r8d, 60(%rsp)
	cmpl	$1, %eax
	jbe	.L719
	movq	8(%rsi), %rax
	movl	$2, %ecx
	movq	8(%rax), %r9
	movq	%r9, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	48(%rsp), %r9
	movl	60(%rsp), %r8d
	leaq	.LC127(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L739:
	xorl	%edi, %edi
	jmp	.L699
.L719:
	xorl	%eax, %eax
	movq	%rax, 64(%rsp)
	call	create_list
	cmpl	$8, 16(%rsi)
	movq	%rax, %rdi
	jne	.L722
	movq	8(%rsi), %rax
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	movq	8(%rax), %rcx
	call	make_method_name
	movq	%rax, %rdx
	movq	(%rsi), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L722
	movq	0(%rbp), %rax
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
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	8(%rax), %rcx
	movq	%rax, 48(%rsp)
	call	get_type_size
	leaq	72(%rsp), %rdx
	movl	$1, %ecx
	movq	%rax, 72(%rsp)
	call	create_arg
	movq	48(%rsp), %r8
	xorl	%r9d, %r9d
	movl	$17, %ecx
	movq	%rax, %rdx
	call	create_instruction
	movq	%rdi, %rcx
	movq	%rax, %rdx
	call	list_append
	incq	64(%rsp)
.L722:
	movq	8(%rbp), %rcx
	leaq	72(%rsp), %r12
	call	list_copy
	movq	%rax, %rbp
.L724:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L726
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	8(%rax), %rcx
	movq	%rax, 48(%rsp)
	call	get_type_size
	movq	%r12, %rdx
	movl	$1, %ecx
	movq	%rax, 72(%rsp)
	call	create_arg
	movq	48(%rsp), %r8
	xorl	%r9d, %r9d
	movl	$17, %ecx
	movq	%rax, %rdx
	call	create_instruction
	movq	%rdi, %rcx
	movq	%rax, %rdx
	call	list_append
	incq	64(%rsp)
	jmp	.L724
.L726:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L744
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L726
.L744:
	movq	8(%rsi), %rdx
	movq	%rbx, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	call	create_var
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	call	create_arg
	leaq	64(%rsp), %rdx
	movl	$1, %ecx
	movq	%rax, %rdi
	call	create_arg
	movq	%rdi, %rdx
	movq	%rsi, %r8
	movl	$22, %ecx
	movq	%rax, %r9
	call	create_instruction
	movq	%rax, %rdx
.L738:
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L699
.L717:
	movl	%r8d, 48(%rsp)
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	48(%rsp), %r8d
	leaq	.LC128(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L739
.L699:
	addq	$88, %rsp
	movq	%rdi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.section .rdata,"dr"
.LC130:
	.ascii "[Warning] Unsupported type for negation: %s\12\0"
.LC131:
	.ascii "[Warning] Unsupported primary type for tac_primary: %d\12\0"
	.text
	.def	tac_primary;	.scl	3;	.type	32;	.endef
tac_primary:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$64, %rsp
	movl	8(%rcx), %r8d
	cmpl	$8, %r8d
	ja	.L746
	movq	%rdx, %rsi
	leaq	.L748(%rip), %rdx
	movslq	(%rdx,%r8,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L748:
	.long	.L756-.L748
	.long	.L755-.L748
	.long	.L754-.L748
	.long	.L753-.L748
	.long	.L752-.L748
	.long	.L751-.L748
	.long	.L750-.L748
	.long	.L749-.L748
	.long	.L747-.L748
	.text
.L756:
	movq	(%rcx), %rcx
	xorl	%edx, %edx
	movl	$10, %r8d
	call	strtoll
	leaq	56(%rsp), %rdx
	movl	$1, %ecx
	movq	%rax, 56(%rsp)
	jmp	.L765
.L755:
	movq	(%rcx), %rcx
	xorl	%edx, %edx
	call	strtod
	leaq	56(%rsp), %rdx
	movl	$2, %ecx
	movsd	%xmm0, 56(%rsp)
.L765:
	call	create_arg
	movq	%rax, %rbx
	jmp	.L745
.L754:
	movq	(%rcx), %rdx
	addq	$64, %rsp
	movl	$3, %ecx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	create_arg
.L753:
	movb	$1, 56(%rsp)
	jmp	.L766
.L752:
	movb	$0, 56(%rsp)
.L766:
	leaq	56(%rsp), %rdx
	movl	$4, %ecx
	jmp	.L765
.L751:
	movq	(%rcx), %rcx
	addq	$64, %rsp
	movq	%rsi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	tac_expression
.L750:
	movq	(%rcx), %rcx
	movq	%rsi, %rdx
	call	tac_primary
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rsi, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	movq	name_bool(%rip), %rdx
	movq	%rax, %rdi
	call	create_var
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	call	create_arg
	xorl	%r9d, %r9d
	movq	%rdi, %r8
	movl	$13, %ecx
	movq	%rax, %rbx
	movq	%rax, %rdx
	jmp	.L763
.L749:
	movq	(%rcx), %rcx
	movq	%rsi, %rdx
	call	tac_primary
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	xorl	%ecx, %ecx
	movq	%rsi, %r9
	movl	$116, %r8d
	movq	8(%rax), %rdx
	movq	%rax, %rdi
	call	create_var
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	call	create_arg
	movq	%rax, %rbx
	xorl	%eax, %eax
	movq	%rax, 48(%rsp)
	movq	.LC129(%rip), %rax
	movq	%rax, 56(%rsp)
	movq	8(%rdi), %rax
	cmpq	name_int(%rip), %rax
	jne	.L758
	leaq	48(%rsp), %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rdi, %r9
	movq	%rbx, %rdx
	movl	$1, %ecx
	movq	%rax, %r8
	jmp	.L763
.L758:
	cmpq	name_float(%rip), %rax
	jne	.L760
	leaq	56(%rsp), %rdx
	movl	$2, %ecx
	call	create_arg
	movq	%rdi, %r9
	movq	%rbx, %rdx
	movl	$2, %ecx
	movq	%rax, %r8
.L763:
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L745
.L760:
	movq	8(%rax), %r8
	movl	$2, %ecx
	movq	%r8, 40(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	40(%rsp), %r8
	leaq	.LC130(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L764
.L747:
	movq	(%rcx), %rcx
	addq	$64, %rsp
	movq	%rsi, %rdx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	tac_variable_access
.L746:
	movl	%r8d, 40(%rsp)
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	40(%rsp), %r8d
	leaq	.LC131(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L764:
	xorl	%ebx, %ebx
.L745:
	addq	$64, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.section .rdata,"dr"
.LC132:
	.ascii "[Warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.def	tac_expression;	.scl	3;	.type	32;	.endef
tac_expression:
	pushq	%r12
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$32, %rsp
	cmpl	$19, 24(%rcx)
	jne	.L768
	movq	8(%rcx), %rcx
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	tac_primary
.L768:
	movq	16(%rcx), %rcx
	movl	$25, %r12d
	call	tac_expression
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rax, %rdi
	movl	24(%rbp), %eax
	cmpl	$18, %eax
	ja	.L769
	leaq	CSWTCH.123(%rip), %rdx
	movzbl	(%rdx,%rax), %r12d
.L769:
	movq	0(%rbp), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rsi
	movl	24(%rbp), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L770
	cmpl	$14, %r12d
	je	.L771
	movq	8(%rsi), %rdx
	movq	%rbx, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	call	create_var
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	call	create_arg
	movq	%rbx, %rdx
	movq	%rsi, %rcx
	movq	%rax, %rbp
	call	load_rvalue
	movq	%rdi, %r9
	movq	%rbp, %rdx
	movl	%r12d, %ecx
	movq	%rax, %r8
	movq	%rbp, %rdi
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L771:
	cmpl	$0, 16(%rsi)
	je	.L772
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC132(%rip), %rcx
	movq	%rax, %rdx
	call	fputs
.L772:
	xorl	%r9d, %r9d
	movq	%rsi, %rdx
	movq	%rdi, %r8
	movl	$14, %ecx
	call	create_instruction
	cmpb	$0, 20(%rsi)
	movq	%rax, %rdx
	je	.L773
	movq	%rsi, %rdx
	xorl	%r9d, %r9d
	movq	%rdi, %r8
	movl	$24, %ecx
	call	create_instruction
	movq	%rax, %rdx
	jmp	.L773
.L770:
	movq	8(%rsi), %rdx
	movq	%rbx, %r9
	movl	$116, %r8d
	xorl	%ecx, %ecx
	call	create_var
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	call	create_arg
	movq	%rbx, %rdx
	movq	%rsi, %rcx
	movq	%rax, %rbp
	call	load_rvalue
	movq	%rdi, %r9
	movq	%rbp, %rdx
	movl	%r12d, %ecx
	movq	%rax, %r8
	movq	%rbp, %rdi
	call	create_instruction
	movq	%rax, %rdx
.L773:
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	addq	$32, %rsp
	movq	%rdi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.section .rdata,"dr"
.LC133:
	.ascii "Warning: Path component too long, truncating to %zu characters\12\0"
.LC134:
	.ascii ".\0"
.LC135:
	.ascii "..\0"
	.text
	.def	create_file;	.scl	3;	.type	32;	.endef
create_file:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	movl	$32, %ecx
	subq	$312, %rsp
	call	alloc_memory
	xorl	%edx, %edx
	movq	%rbx, %rcx
	movq	%rax, %rsi
	call	absolute_path
	movq	%rax, 24(%rsi)
	movq	%rax, %rcx
	call	strlen
	xorl	%r8d, %r8d
	leaq	.LC38(%rip), %rcx
	leaq	1(%rax), %rdx
	movq	%rax, %r13
	call	create_string_check
	movq	24(%rsi), %rdx
	movq	%rax, %rcx
	movq	%rax, %rbp
	call	strcpy
	testq	%r13, %r13
	je	.L801
	cmpb	$47, 0(%rbp)
	jne	.L801
	movl	$16, %ecx
	movl	$1, %r14d
	call	alloc_memory
	movl	$1, %r8d
	movl	$1, %edx
	leaq	.LC43(%rip), %rcx
	movq	%rax, %r15
	call	create_string_check
	xorl	%r9d, %r9d
	movq	%rax, (%r15)
	movq	%r9, 8(%r15)
	jmp	.L780
.L801:
	xorl	%r14d, %r14d
	xorl	%r15d, %r15d
.L780:
	leaq	48(%rsp), %rax
	movq	%r14, %rdi
	movq	%r15, %rbx
	movq	%rax, 40(%rsp)
.L781:
	cmpq	%rdi, %r13
	jb	.L834
	je	.L782
	cmpb	$47, 0(%rbp,%rdi)
	jne	.L783
.L782:
	cmpq	%rdi, %r14
	jnb	.L784
	movq	%rdi, %r12
	subq	%r14, %r12
	cmpq	$255, %r12
	jbe	.L785
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%r12, %r8
	leaq	.LC133(%rip), %rdx
	movl	$255, %r12d
	movq	%rax, %rcx
	call	fprintf
.L785:
	movq	40(%rsp), %rcx
	leaq	0(%rbp,%r14), %rdx
	movq	%r12, %r8
	call	strncpy
	movq	40(%rsp), %rcx
	leaq	.LC134(%rip), %rdx
	movb	$0, 48(%rsp,%r12)
	call	strcmp
	testl	%eax, %eax
	je	.L784
	leaq	.LC135(%rip), %r14
	movq	40(%rsp), %rcx
	movq	%r14, %rdx
	call	strcmp
	testl	%eax, %eax
	jne	.L787
	testq	%r15, %r15
	je	.L788
	cmpq	%rbx, %r15
	je	.L788
	movq	(%r15), %rcx
	movq	%r14, %rdx
	call	strcmp
	testl	%eax, %eax
	jne	.L802
	movl	$16, %ecx
	call	alloc_memory
	movl	$1, %r8d
	movl	$2, %edx
	movq	%r14, %rcx
	movq	%rax, %r12
	call	create_string_check
	xorl	%r8d, %r8d
	movq	%rax, (%r12)
	movq	%r8, 8(%r12)
	movq	%r12, 8(%r15)
	movq	%r12, %r15
	jmp	.L784
.L802:
	movq	%rbx, %rax
.L789:
	testq	%rax, %rax
	je	.L784
	movq	8(%rax), %rdx
	cmpq	%rdx, %r15
	je	.L835
	movq	%rdx, %rax
	jmp	.L789
.L835:
	xorl	%ecx, %ecx
	movq	%rax, %r15
	movq	%rcx, 8(%rax)
	jmp	.L784
.L788:
	testq	%rbx, %rbx
	jne	.L784
	movl	$16, %ecx
	call	alloc_memory
	movl	$2, %edx
	movl	$1, %r8d
	movq	%r14, %rcx
	movq	%rax, %rbx
	call	create_string_check
	xorl	%edx, %edx
	movq	%rax, (%rbx)
	movq	%rdx, 8(%rbx)
	jmp	.L833
.L787:
	cmpb	$0, 48(%rsp)
	je	.L784
	movl	$16, %ecx
	call	alloc_memory
	movq	40(%rsp), %rcx
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %r14
	call	create_string_check
	movq	%rax, (%r14)
	xorl	%eax, %eax
	movq	%rax, 8(%r14)
	testq	%r15, %r15
	je	.L790
	movq	%r14, 8(%r15)
.L790:
	movq	%r14, %r15
	testq	%rbx, %rbx
	jne	.L784
	movq	%r14, %rbx
.L833:
	movq	%rbx, %r15
.L784:
	leaq	1(%rdi), %r14
.L783:
	incq	%rdi
	jmp	.L781
.L834:
	movq	%rbx, (%rsi)
	testq	%r15, %r15
	je	.L792
	movq	(%r15), %r15
	movl	$46, %edx
	movq	%r15, %rcx
	call	strrchr
	movq	%rax, %rdi
	cmpq	%rax, %r15
	je	.L792
	testq	%rax, %rax
	je	.L792
	movq	%rax, %rdx
	movl	$1, %r8d
	movq	%r15, %rcx
	subq	%r15, %rdx
	call	create_string_check
	movq	%rdi, %rcx
	movq	%rax, 16(%rsi)
	call	strlen
	movl	$1, %r8d
	movq	%rdi, %rcx
	movq	%rax, %rdx
	call	create_string_check
	jmp	.L793
.L792:
	movq	%r15, 16(%rsi)
	xorl	%eax, %eax
.L793:
	movq	%rax, 8(%rsi)
	movq	%rbx, %r12
	xorl	%ebp, %ebp
	xorl	%edi, %edi
.L794:
	testq	%r12, %r12
	je	.L836
	movq	(%r12), %rcx
	incq	%rbp
	call	strlen
	movq	8(%r12), %r12
	addq	%rax, %rdi
	jmp	.L794
.L836:
	cmpq	$1, %rbp
	jbe	.L796
	leaq	-1(%rdi,%rbp), %rdi
.L796:
	leaq	1(%rdi), %rdx
	xorl	%r8d, %r8d
	leaq	.LC38(%rip), %rcx
	call	create_string_check
	leaq	.LC43(%rip), %rbp
	movb	$0, (%rax)
	movq	%rax, %rdi
	movb	$1, %al
.L797:
	testq	%rbx, %rbx
	je	.L837
	testb	%al, %al
	jne	.L798
	movq	(%rbx), %rcx
	movq	%rbp, %rdx
	call	strcmp
	testl	%eax, %eax
	je	.L798
	cmpb	$0, (%rdi)
	je	.L798
	movq	%rdi, %rcx
	call	strlen
	cmpb	$47, -1(%rdi,%rax)
	je	.L798
	movq	%rbp, %rdx
	movq	%rdi, %rcx
	call	strcat
.L798:
	movq	(%rbx), %rdx
	movq	%rdi, %rcx
	call	strcat
	movq	8(%rbx), %rbx
	xorl	%eax, %eax
	jmp	.L797
.L837:
	movq	%rdi, %rcx
	call	strlen
	movq	%rdi, %rcx
	movl	$1, %r8d
	movq	%rax, %rdx
	call	create_string_check
	movq	%rax, 24(%rsi)
	addq	$312, %rsp
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
	.section .rdata,"dr"
.LC136:
	.ascii "Error: create_attribute received NULL table\12\0"
.LC137:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
	.text
	.def	tac_variable;	.scl	3;	.type	32;	.endef
tac_variable:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$64, %rsp
	testb	%r8b, %r8b
	je	.L839
	movq	(%rdx), %rax
	movq	(%rax), %rcx
	call	list_pop_back
	movq	%rax, %rdx
	movq	%rax, %rsi
	call	list_append
	movq	(%rdi), %rbp
	movq	8(%rdi), %r12
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbx, %r9
	movl	$97, %r8d
	movq	%rbp, %rdx
	movq	%r12, %rcx
	movq	%rax, %rdi
	call	create_var
	xorl	%edx, %edx
	movq	%rbp, 8(%rdi)
	movq	%rax, (%rdi)
	movq	%rdx, 16(%rdi)
	testq	%rsi, %rsi
	je	.L840
	movq	16(%rsi), %rax
	movq	%rbp, %rcx
	movq	%rax, 16(%rdi)
	call	get_type_size
	movq	(%rsi), %rcx
	addq	%rax, 16(%rsi)
	movq	%rdi, %rdx
	testq	%rcx, %rcx
	jne	.L851
	jmp	.L841
.L840:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC136(%rip), %rcx
	movq	%rax, %rdx
	call	fputs
.L841:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	addq	$64, %rsp
	leaq	.LC137(%rip), %rcx
	popq	%rbx
	movq	%rax, %rdx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	fputs
.L839:
	movq	8(%rcx), %rcx
	movq	%rdx, %r9
	movq	(%rdi), %rdx
	movl	$118, %r8d
	call	create_var
	movq	16(%rdi), %rcx
	movq	%rax, %rsi
	testq	%rcx, %rcx
	je	.L843
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	jmp	.L850
.L843:
	xorl	%eax, %eax
	leaq	56(%rsp), %rdx
	movl	$1, %ecx
	movq	%rax, 56(%rsp)
	call	create_arg
.L850:
	movq	%rsi, %rdx
	xorl	%ecx, %ecx
	movq	%rax, 40(%rsp)
	call	create_arg
	movq	40(%rsp), %r8
	movl	$14, %ecx
	xorl	%r9d, %r9d
	movq	%rax, %rdx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
.L851:
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	list_append
	.section .rdata,"dr"
.LC138:
	.ascii "[Warning] 'break' statement used outside of loop\12\0"
.LC139:
	.ascii "[Warning] 'continue' statement used outside of loop\12\0"
.LC140:
	.ascii "[Warning] Unsupported statement type for tac_statement: %d\12\0"
	.text
	.def	tac_statement;	.scl	3;	.type	32;	.endef
tac_statement:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	movl	8(%rcx), %r8d
	cmpl	$7, %r8d
	ja	.L853
	movq	%rdx, %rbx
	leaq	.L855(%rip), %rdx
	movq	%rcx, %rsi
	movslq	(%rdx,%r8,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L855:
	.long	.L862-.L855
	.long	.L861-.L855
	.long	.L860-.L855
	.long	.L859-.L855
	.long	.L858-.L855
	.long	.L857-.L855
	.long	.L856-.L855
	.long	.L854-.L855
	.text
.L862:
	movq	(%rcx), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	addq	$56, %rsp
	movq	%rbx, %rdx
	movq	%rax, %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	load_rvalue
.L861:
	movq	(%rcx), %rcx
	addq	$56, %rsp
	movq	%rbx, %rdx
	xorl	%r8d, %r8d
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	tac_variable
.L860:
	movq	(%rcx), %rbp
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	create_var
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rax, %r12
	call	create_var
	movq	%rax, %rsi
	movq	16(%rbp), %rax
	testq	%rax, %rax
	je	.L863
	cmpq	$0, (%rax)
	je	.L863
	cmpq	$0, 8(%rax)
	jne	.L864
.L863:
	movq	24(%rbp), %rax
	movq	%rsi, %rdi
	testq	%rax, %rax
	je	.L865
	cmpq	$0, (%rax)
	je	.L865
	cmpq	$0, 8(%rax)
	je	.L865
.L864:
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	create_var
	movq	%rax, %rdi
.L865:
	movq	%rdi, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	0(%rbp), %rcx
	movq	%rbx, %rdx
	movq	%rax, 32(%rsp)
	call	tac_expression
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rsi, %rdx
	movl	$6, %ecx
	movq	%rax, %r13
	call	create_arg
	movq	%r12, %rdx
	movl	$6, %ecx
	movq	%rax, 40(%rsp)
	call	create_arg
	movq	40(%rsp), %r9
	movq	%r13, %rdx
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%r12, %rcx
	call	create_block
	movq	%rax, %r12
	movq	8(%rbx), %rax
	movq	%r12, %rdx
	movq	32(%rax), %rcx
	call	list_append
	movq	%r12, 16(%rbx)
	movq	8(%rbp), %rcx
	call	list_copy
	movq	%rax, %r12
.L866:
	movq	%r12, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L944
	movq	%rbx, %rdx
	call	tac_statement
	jmp	.L866
.L944:
	movq	32(%rsp), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	16(%rbp), %rcx
	testq	%rcx, %rcx
	je	.L868
	cmpq	$0, (%rcx)
	je	.L868
	cmpq	$0, 8(%rcx)
	je	.L868
	call	list_copy
	movq	%rax, %r12
.L869:
	movq	%r12, %rcx
	call	list_pop
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L868
	movq	%rsi, %rcx
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	%rsi, %rdx
	movq	32(%rax), %rcx
	call	list_append
	movq	%rsi, 16(%rbx)
	movq	%rbx, %r9
	xorl	%edx, %edx
	movl	$98, %r8d
	xorl	%ecx, %ecx
	call	create_var
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rax, %r14
	call	create_var
	movq	0(%r13), %rcx
	movq	%rbx, %rdx
	movq	%rax, %rsi
	call	tac_expression
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rax, %r15
	testq	%r12, %r12
	je	.L870
	cmpq	$0, (%r12)
	je	.L870
	cmpq	$0, 8(%r12)
	jne	.L871
.L870:
	movq	24(%rbp), %rax
	testq	%rax, %rax
	je	.L898
	cmpq	$0, (%rax)
	je	.L898
	cmpq	$0, 8(%rax)
	cmove	%rdi, %rsi
	jmp	.L871
.L898:
	movq	%rdi, %rsi
.L871:
	movq	%rsi, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%r14, %rdx
	movl	$6, %ecx
	movq	%rax, 40(%rsp)
	call	create_arg
	movq	40(%rsp), %r9
	movq	%r15, %rdx
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%r14, %rcx
	call	create_block
	movq	%rax, %r14
	movq	8(%rbx), %rax
	movq	%r14, %rdx
	movq	32(%rax), %rcx
	call	list_append
	movq	%r14, 16(%rbx)
	movq	8(%r13), %rcx
	call	list_copy
	movq	%rax, %r13
.L872:
	movq	%r13, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L945
	movq	%rbx, %rdx
	call	tac_statement
	jmp	.L872
.L945:
	movq	32(%rsp), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L869
.L868:
	movq	24(%rbp), %rax
	testq	%rax, %rax
	je	.L875
	cmpq	$0, (%rax)
	je	.L875
	cmpq	$0, 8(%rax)
	je	.L875
	movq	%rsi, %rcx
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	%rsi, %rdx
	movq	32(%rax), %rcx
	call	list_append
	movq	%rsi, 16(%rbx)
	movq	24(%rbp), %rcx
	call	list_copy
	movq	%rax, %rsi
.L876:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L946
	movq	%rbx, %rdx
	call	tac_statement
	jmp	.L876
.L946:
	movq	32(%rsp), %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
.L943:
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L875:
	movq	%rdi, %rcx
	jmp	.L939
.L859:
	movq	(%rcx), %r12
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	create_var
	movl	$6, %ecx
	movq	%rax, %rdx
	movq	%rax, %rsi
	call	create_arg
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$20, %ecx
	movq	%rax, %rdx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%rsi, %rcx
	call	create_block
	movq	%rax, %rdi
	movq	8(%rbx), %rax
	movq	%rdi, %rdx
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
	movq	%rax, %rbp
	call	create_var
	movq	(%r12), %rcx
	movq	%rbx, %rdx
	movq	%rax, %rdi
	call	tac_expression
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rdi, %rdx
	movl	$6, %ecx
	movq	%rax, %r13
	call	create_arg
	movq	%rbp, %rdx
	movl	$6, %ecx
	movq	%rax, 32(%rsp)
	call	create_arg
	movq	32(%rsp), %r9
	movq	%r13, %rdx
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%rbp, %rcx
	call	create_block
	movq	%rax, %rbp
	movq	8(%rbx), %rax
	movq	%rbp, %rdx
	movq	32(%rax), %rcx
	call	list_append
	movq	%rbp, 16(%rbx)
	movq	%rsi, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	%rdi, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	32(%rbx), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	8(%r12), %rcx
	call	list_copy
	movq	%rax, %rbp
.L879:
	movq	%rbp, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L947
	movq	%rbx, %rdx
	call	tac_statement
	jmp	.L879
.L947:
	movq	40(%rbx), %rcx
	call	list_pop_back
	movq	32(%rbx), %rcx
	call	list_pop_back
	movq	%rsi, %rdx
	movl	$6, %ecx
	call	create_arg
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	jmp	.L943
.L858:
	movq	(%rcx), %rsi
	movq	(%rsi), %rcx
	testq	%rcx, %rcx
	je	.L881
	xorl	%r8d, %r8d
	movq	%rbx, %rdx
	call	tac_variable
.L881:
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rbx, %r9
	movl	$98, %r8d
	call	create_var
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rbx, %r9
	movl	$98, %r8d
	movq	%rax, %rbp
	call	create_var
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rbx, %r9
	movl	$98, %r8d
	movq	%rax, %rdi
	call	create_var
	cmpq	$0, 8(%rsi)
	movq	%rax, %r12
	je	.L882
	movq	%rbp, %rdx
	movl	$6, %ecx
	call	create_arg
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$20, %ecx
	movq	%rax, %rdx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%rbp, %rcx
	call	create_block
	movq	%rax, %r13
	movq	8(%rbx), %rax
	movq	%r13, %rdx
	movq	32(%rax), %rcx
	call	list_append
	movq	%r13, 16(%rbx)
	movq	8(%rsi), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue
	movq	%r12, %rdx
	movl	$6, %ecx
	movq	%rax, %r13
	call	create_arg
	movq	%rdi, %rdx
	movl	$6, %ecx
	movq	%rax, 32(%rsp)
	call	create_arg
	movq	32(%rsp), %r9
	movq	%r13, %rdx
	movl	$19, %ecx
	movq	%rax, %r8
	jmp	.L937
.L882:
	movq	%rdi, %rdx
	movl	$6, %ecx
	call	create_arg
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$20, %ecx
	movq	%rax, %rdx
.L937:
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%rdi, %rcx
	call	create_block
	movq	%rax, %r13
	movq	8(%rbx), %rax
	movq	%r13, %rdx
	movq	32(%rax), %rcx
	call	list_append
	movq	%r13, 16(%rbx)
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rbx, %r9
	movl	$98, %r8d
	call	create_var
	cmpq	$0, 16(%rsi)
	movq	%rax, %r13
	movq	%rax, %rdx
	jne	.L938
	cmpq	$0, 8(%rsi)
	movq	%rbp, %rdx
	jne	.L938
	movq	%rdi, %rdx
.L938:
	movl	$6, %ecx
	call	create_arg
	movq	40(%rbx), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	%r12, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	32(%rbx), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	24(%rsi), %rcx
	call	list_copy
	movq	%rax, %r14
.L887:
	movq	%r14, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L948
	movq	%rbx, %rdx
	call	tac_statement
	jmp	.L887
.L948:
	movq	40(%rbx), %rcx
	call	list_pop_back
	movq	32(%rbx), %rcx
	call	list_pop_back
	cmpq	$0, 16(%rsi)
	je	.L889
	movq	%r13, %rdx
	movl	$6, %ecx
	call	create_arg
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$20, %ecx
	movq	%rax, %rdx
	call	create_instruction
	movq	%rax, %rdx
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
	movq	16(%rsi), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue
.L889:
	movq	%rbp, %rdx
	movl	$6, %ecx
	call	create_arg
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$20, %ecx
	movq	%rax, %rdx
	call	create_instruction
	cmpq	$0, 8(%rsi)
	jne	.L890
	movq	%rdi, %rdx
	movl	$6, %ecx
	call	create_arg
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$20, %ecx
	movq	%rax, %rdx
	call	create_instruction
.L890:
	movq	16(%rbx), %rdx
	movq	8(%rdx), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	%r12, %rcx
.L939:
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	%rsi, %rdx
	movq	32(%rax), %rcx
	call	list_append
	movq	%rsi, 16(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L857:
	movl	$5, %ecx
	xorl	%edx, %edx
	call	create_arg
	movq	(%rsi), %rcx
	testq	%rcx, %rcx
	je	.L891
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	load_rvalue
.L891:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movl	$21, %ecx
	jmp	.L940
.L856:
	movq	32(%rbx), %rax
	testq	%rax, %rax
	je	.L892
	cmpq	$0, (%rax)
	je	.L892
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L892
	movq	8(%rax), %rdx
	testq	%rdx, %rdx
	je	.L892
.L942:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$20, %ecx
.L940:
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	list_append
.L892:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC138(%rip), %rcx
	movq	%rax, %rdx
	jmp	.L941
.L854:
	movq	40(%rbx), %rax
	testq	%rax, %rax
	je	.L893
	cmpq	$0, (%rax)
	je	.L893
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L893
	movq	8(%rax), %rdx
	testq	%rdx, %rdx
	jne	.L942
.L893:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC139(%rip), %rcx
	movq	%rax, %rdx
.L941:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fputs
.L853:
	movl	%r8d, 32(%rsp)
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	32(%rsp), %r8d
	addq	$56, %rsp
	leaq	.LC140(%rip), %rdx
	popq	%rbx
	movq	%rax, %rcx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fprintf
	.section .rdata,"dr"
.LC141:
	.ascii "[Warning] Constructor '%s' does not start with 'self' initialization\12\0"
.LC142:
	.ascii "[Warning] Unsupported class member type for tac_class: %d\12\0"
	.text
	.def	tac_class;	.scl	3;	.type	32;	.endef
tac_class:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	leaq	.LC142(%rip), %r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$48, %rsp
	movq	%rcx, 24(%rdx)
	movq	8(%rcx), %rcx
	call	list_copy
	movl	$24, %ecx
	movq	(%rsi), %rdi
	movq	%rax, %rbp
	call	alloc_memory
	movq	%rax, %rsi
	call	create_list
	xorl	%ecx, %ecx
	movq	%rdi, 8(%rsi)
	movq	%rsi, %rdx
	movq	%rax, (%rsi)
	movq	(%rbx), %rax
	movq	%rcx, 16(%rsi)
	movq	(%rax), %rcx
	call	list_append
.L950:
	movq	%rbp, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L965
	movl	8(%rax), %r8d
	testl	%r8d, %r8d
	je	.L951
	cmpl	$1, %r8d
	jne	.L966
	movq	(%rax), %rcx
	movl	$1, %r8d
	movq	%rbx, %rdx
	call	tac_variable
	jmp	.L950
.L951:
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
	movq	16(%r13), %rcx
	call	list_copy
	movq	%rax, %rdi
.L954:
	movq	%rdi, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L967
	movq	8(%rax), %rcx
	movq	(%rax), %rdx
	movq	%rbx, %r9
	movl	$112, %r8d
	call	create_var
	movq	16(%rsi), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L954
.L967:
	movq	%rbx, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	create_var
	movq	%rax, %rcx
	call	create_block
	movq	32(%rsi), %rcx
	movq	%rax, %rdi
	movq	%rax, %rdx
	call	list_append
	movq	%rdi, 16(%rbx)
	movq	24(%r13), %rcx
	call	list_copy
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	movq	%rax, %rsi
	movq	24(%rbx), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rcx
	call	make_method_name
	movq	%rax, %rdx
	movq	0(%r13), %rax
	movq	8(%rax), %r13
	movq	%r13, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L960
	movq	%rsi, %rcx
	call	list_pop
	cmpl	$0, 8(%rax)
	jne	.L957
	movq	(%rax), %rax
	cmpl	$19, 24(%rax)
	jne	.L957
	movq	8(%rax), %rax
	cmpl	$8, 8(%rax)
	jne	.L957
	movq	(%rax), %rax
	cmpl	$0, 16(%rax)
	je	.L958
.L957:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%r13, %r8
	leaq	.LC141(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L950
.L958:
	movq	8(%rax), %r14
	movq	24(%rbx), %rax
	movl	$1, %ecx
	leaq	24(%rax), %rdx
	call	create_arg
	movq	(%r14), %rdx
	movq	%rbx, %r9
	movq	%r14, %rcx
	movl	$118, %r8d
	movq	%rax, %r13
	call	create_var
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	call	create_arg
	movl	$18, %ecx
	xorl	%r9d, %r9d
	movq	%r13, %r8
	movq	%rax, %rdx
	call	create_instruction
	movq	8(%rdi), %rcx
	movq	%rax, %rdx
	call	list_append
.L960:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L968
	movq	%rbx, %rdx
	call	tac_statement
	jmp	.L960
.L968:
	xorl	%edx, %edx
	movq	%rdx, 8(%rbx)
	jmp	.L950
.L966:
	movl	%r8d, 44(%rsp)
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	44(%rsp), %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L950
.L965:
	xorl	%eax, %eax
	movq	%rax, 24(%rbx)
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.section .rdata,"dr"
.LC143:
	.ascii "[Lexer Error] at %s:%zu:%zu: Unterminated string literal\12\0"
.LC144:
	.ascii "\0\0"
.LC145:
	.ascii "[Lexer Error] at %s:%zu:%zu: Unterminated comment\12\0"
.LC146:
	.ascii "[Lexer Error] at %s:%zu:%zu: Unexpected character\12\0"
	.text
	.def	next_token;	.scl	3;	.type	32;	.endef
next_token:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	movl	%edx, %edi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$64, %rsp
	call	get_current_char
	testb	%al, %al
	jne	.L970
	movq	40(%rcx), %r9
	movq	32(%rcx), %r8
	jmp	.L1152
.L970:
	movl	%eax, %edx
	andl	$-5, %edx
	cmpb	$9, %dl
	je	.L1047
	cmpb	$32, %al
	je	.L1047
	cmpb	$10, %al
	jne	.L973
	xorl	%r9d, %r9d
	incq	32(%rcx)
	movq	%r9, 40(%rcx)
	jmp	.L1047
.L973:
	movq	16(%rcx), %rsi
	cmpb	$57, %al
	jg	.L974
	cmpb	$47, %al
	jg	.L975
	cmpb	$34, %al
	jne	.L977
	movabsq	$-17179870210, %r9
	movq	40(%rcx), %rax
	leaq	-1(%rax), %rbp
	call	get_current_char
	movl	%eax, %edi
	jmp	.L993
.L974:
	leal	-65(%rax), %edx
	cmpb	$57, %dl
	ja	.L977
	movabsq	$288230372997595135, %r10
	btq	%rdx, %r10
	jnc	.L977
	movq	40(%rbx), %rdi
	leaq	-1(%rsi), %r9
	decq	%rdi
.L980:
	cmpb	$57, %al
	jg	.L981
	cmpb	$47, %al
	jle	.L983
.L982:
	movq	%rbx, %rcx
	call	get_current_char
	jmp	.L980
.L981:
	subl	$65, %eax
	cmpb	$57, %al
	ja	.L983
	btq	%rax, %r10
	jc	.L982
.L983:
	movq	16(%rbx), %rdx
	decq	40(%rbx)
	movl	$1, %r8d
	movq	8(%rbx), %rcx
	leaq	-1(%rdx), %rax
	subq	%rsi, %rdx
	movq	%rax, 16(%rbx)
	addq	%r9, %rcx
	call	create_string_check
	cmpb	$0, initialized(%rip)
	movq	%rax, %rdx
	jne	.L985
	movq	%rax, 48(%rsp)
	call	init
	movq	48(%rsp), %rdx
.L985:
	xorl	%eax, %eax
	leaq	keywordList(%rip), %rcx
.L987:
	cmpq	(%rcx,%rax,8), %rdx
	je	.L1051
	incq	%rax
	cmpq	$22, %rax
	jne	.L987
	xorl	%eax, %eax
	jmp	.L986
.L1051:
	movb	$1, %al
.L986:
	movq	32(%rbx), %r8
	movq	%rdi, %r9
	movl	$6, %ecx
	testb	%al, %al
	jne	.L1153
	movl	$1, %ecx
	jmp	.L1153
.L975:
	movq	40(%rcx), %rax
	leaq	-1(%rsi), %r10
	leaq	-1(%rax), %rdi
.L989:
	movq	%rbx, %rcx
	call	get_current_char
	leal	-48(%rax), %edx
	cmpb	$9, %dl
	jbe	.L989
	movq	16(%rbx), %rdx
	movq	8(%rbx), %r9
	movl	$2, %ebp
	cmpq	24(%rbx), %rdx
	jnb	.L990
	cmpb	$46, %al
	jne	.L990
	movb	(%r9,%rdx), %al
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L990
.L1151:
	call	get_current_char
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L1159
	movq	%rbx, %rcx
	jmp	.L1151
.L1159:
	movl	$3, %ebp
.L990:
	movq	16(%rbx), %rdx
	decq	40(%rbx)
	leaq	(%r9,%r10), %rcx
	movl	$1, %r8d
	leaq	-1(%rdx), %rax
	subq	%rsi, %rdx
	movq	%rax, 16(%rbx)
	movq	32(%rbx), %rbx
	call	create_string_check
	movq	%rdi, %r9
	movq	%rbx, %r8
	movl	%ebp, %ecx
	movq	%rax, %rdx
	jmp	.L1153
.L1161:
	btq	%rdi, %r9
	jnc	.L1160
.L994:
	movq	%rbx, %rcx
	call	get_current_char
	movl	%eax, %edi
.L993:
	cmpb	$34, %dil
	ja	.L994
	jmp	.L1161
.L1160:
	movq	32(%rbx), %r12
	cmpb	$34, %dil
	je	.L996
	movq	(%rbx), %r8
	movl	$2, %ecx
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	48(%rsp), %r8
	leaq	1(%r12), %r9
	movq	%rax, %rcx
	leaq	.LC143(%rip), %rdx
	call	fprintf
	cmpb	$10, %dil
	jne	.L996
	xorl	%r8d, %r8d
	incq	32(%rbx)
	movq	%r8, 40(%rbx)
.L996:
	movq	16(%rbx), %rdx
	movq	32(%rbx), %rdi
	movl	$1, %r8d
	leaq	.LC144(%rip), %rcx
	subq	%rsi, %rdx
	cmpq	$1, %rdx
	je	.L1155
	addq	8(%rbx), %rsi
	decq	%rdx
	movl	$1, %r8d
	movq	%rsi, %rcx
.L1155:
	call	create_string_check
	movq	%rbp, %r9
	movq	%rdi, %r8
	movl	$4, %ecx
	movq	%rax, %rdx
	jmp	.L1153
.L977:
	movq	24(%rbx), %r9
	xorl	%ecx, %ecx
	cmpq	%r9, %rsi
	jnb	.L999
	movq	8(%rbx), %rdx
	movb	(%rdx,%rsi), %cl
.L999:
	cmpb	$47, %al
	sete	%r8b
	cmpb	$47, %cl
	jne	.L1000
	testb	%r8b, %r8b
	je	.L1000
	movq	40(%rbx), %rbp
.L1001:
	movq	%rbx, %rcx
	call	get_current_char
	cmpb	$10, %al
	je	.L1058
	testb	%al, %al
	jne	.L1001
.L1058:
	movq	16(%rbx), %rax
	decq	40(%rbx)
	leaq	-1(%rax), %rdx
	movq	%rdx, 16(%rbx)
	testb	%dil, %dil
	jne	.L1047
	leaq	1(%rsi), %rcx
	movl	$1, %r8d
	movq	32(%rbx), %rsi
	subq	%rcx, %rdx
	addq	8(%rbx), %rcx
	call	create_string_check
	leaq	-1(%rbp), %r9
	movq	%rax, %rdx
	jmp	.L1156
.L1000:
	cmpb	$42, %cl
	jne	.L1004
	testb	%r8b, %r8b
	je	.L1004
	movq	40(%rbx), %rax
	leaq	1(%rsi), %rbp
	movb	$42, %dl
	leaq	-1(%rax), %r12
	movb	$47, %al
.L1005:
	cmpb	$42, %al
	je	.L1162
.L1010:
	movq	%rbx, %rcx
	call	get_current_char
	movq	16(%rbx), %rdx
	cmpq	%r9, %rdx
	jnb	.L1006
	movq	8(%rbx), %rcx
	movb	(%rcx,%rdx), %dl
	cmpb	$10, %al
	jne	.L1007
	jmp	.L1046
.L1006:
	cmpb	$10, %al
	jne	.L1008
	xorl	%edx, %edx
.L1046:
	xorl	%ecx, %ecx
	incq	32(%rbx)
	movq	%rcx, 40(%rbx)
.L1007:
	testb	%dl, %dl
	je	.L1008
	testb	%al, %al
	jne	.L1005
	jmp	.L1050
.L1162:
	cmpb	$47, %dl
	jne	.L1010
	jmp	.L1163
.L1008:
	testb	%al, %al
	jne	.L1050
	decq	16(%rbx)
	decq	40(%rbx)
.L1050:
	movq	32(%rbx), %rax
	movq	(%rbx), %r8
	addq	$2, %rsi
	movl	$2, %ecx
	leaq	1(%rax), %r9
	movq	%r8, 48(%rsp)
	movq	%r9, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC145(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
	testb	%dil, %dil
	jne	.L1047
	movq	32(%rbx), %rsi
	movq	16(%rbx), %rdx
	jmp	.L1157
.L1047:
	addq	$64, %rsp
	movsbl	%dil, %edx
	movq	%rbx, %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	next_token
.L1163:
	movq	%rbx, %rcx
	call	get_current_char
	testb	%dil, %dil
	jne	.L1047
	movq	16(%rbx), %rax
	movq	32(%rbx), %rsi
	leaq	-2(%rax), %rdx
.L1157:
	movq	8(%rbx), %rcx
	subq	%rbp, %rdx
	movl	$1, %r8d
	addq	%rbp, %rcx
	call	create_string_check
	movq	%r12, %r9
	movq	%rax, %rdx
.L1156:
	movq	%rsi, %r8
	movl	$7, %ecx
	jmp	.L1153
.L1004:
	cmpb	$61, %cl
	sete	%dl
	cmpb	$61, %al
	jne	.L1013
	testb	%dl, %dl
	je	.L1013
	movq	%rbx, %rcx
	call	get_current_char
	movq	40(%rbx), %rax
	movq	32(%rbx), %r8
	movq	152+symbolList(%rip), %rdx
	leaq	-2(%rax), %r9
	jmp	.L1154
.L1013:
	cmpb	$33, %al
	jne	.L1014
	testb	%dl, %dl
	je	.L1014
	movq	%rbx, %rcx
	call	get_current_char
	movq	40(%rbx), %rax
	movq	32(%rbx), %r8
	movq	160+symbolList(%rip), %rdx
	leaq	-2(%rax), %r9
	jmp	.L1154
.L1014:
	cmpb	$60, %al
	jne	.L1015
	testb	%dl, %dl
	je	.L1015
	movq	%rbx, %rcx
	call	get_current_char
	movq	40(%rbx), %rax
	movq	32(%rbx), %r8
	movq	168+symbolList(%rip), %rdx
	leaq	-2(%rax), %r9
	jmp	.L1154
.L1015:
	cmpb	$62, %al
	jne	.L1016
	testb	%dl, %dl
	je	.L1016
	movq	%rbx, %rcx
	call	get_current_char
	movq	40(%rbx), %rax
	movq	32(%rbx), %r8
	movq	176+symbolList(%rip), %rdx
	leaq	-2(%rax), %r9
	jmp	.L1154
.L1016:
	cmpb	$43, %al
	jne	.L1017
	testb	%dl, %dl
	je	.L1017
	movq	%rbx, %rcx
	call	get_current_char
	movq	40(%rbx), %rax
	movq	32(%rbx), %r8
	movq	184+symbolList(%rip), %rdx
	leaq	-2(%rax), %r9
	jmp	.L1154
.L1017:
	cmpb	$45, %al
	jne	.L1018
	testb	%dl, %dl
	je	.L1018
	movq	%rbx, %rcx
	call	get_current_char
	movq	40(%rbx), %rax
	movq	32(%rbx), %r8
	movq	192+symbolList(%rip), %rdx
	leaq	-2(%rax), %r9
	jmp	.L1154
.L1018:
	cmpb	$42, %al
	jne	.L1019
	testb	%dl, %dl
	je	.L1019
	movq	%rbx, %rcx
	call	get_current_char
	movq	40(%rbx), %rax
	movq	32(%rbx), %r8
	movq	200+symbolList(%rip), %rdx
	leaq	-2(%rax), %r9
	jmp	.L1154
.L1019:
	testb	%r8b, %r8b
	je	.L1020
	testb	%dl, %dl
	je	.L1020
	movq	%rbx, %rcx
	call	get_current_char
	movq	40(%rbx), %rax
	movq	32(%rbx), %r8
	movq	208+symbolList(%rip), %rdx
	leaq	-2(%rax), %r9
	jmp	.L1154
.L1020:
	cmpb	$37, %al
	jne	.L1021
	testb	%dl, %dl
	je	.L1021
	movq	%rbx, %rcx
	call	get_current_char
	movq	40(%rbx), %rax
	movq	32(%rbx), %r8
	movq	216+symbolList(%rip), %rdx
	leaq	-2(%rax), %r9
	jmp	.L1154
.L1021:
	cmpb	$38, %al
	jne	.L1022
	cmpb	$38, %cl
	jne	.L1022
	movq	%rbx, %rcx
	call	get_current_char
	movq	40(%rbx), %rax
	movq	32(%rbx), %r8
	movq	224+symbolList(%rip), %rdx
	leaq	-2(%rax), %r9
	jmp	.L1154
.L1022:
	cmpb	$124, %al
	jne	.L1023
	cmpb	$124, %cl
	jne	.L1023
	movq	%rbx, %rcx
	call	get_current_char
	movq	40(%rbx), %rax
	movq	32(%rbx), %r8
	movq	232+symbolList(%rip), %rdx
	leaq	-2(%rax), %r9
	jmp	.L1154
.L1023:
	movq	40(%rbx), %rsi
	movq	32(%rbx), %r8
	cmpb	$62, %al
	jg	.L1024
	cmpb	$32, %al
	jle	.L1025
	subl	$33, %eax
	cmpb	$29, %al
	ja	.L1025
	leaq	.L1027(%rip), %rdx
	movzbl	%al, %eax
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L1027:
	.long	.L1040-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1039-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1038-.L1027
	.long	.L1037-.L1027
	.long	.L1036-.L1027
	.long	.L1035-.L1027
	.long	.L1034-.L1027
	.long	.L1033-.L1027
	.long	.L1032-.L1027
	.long	.L1031-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1030-.L1027
	.long	.L1029-.L1027
	.long	.L1028-.L1027
	.long	.L1026-.L1027
	.text
.L1024:
	cmpb	$123, %al
	je	.L1041
	jg	.L1042
	cmpb	$91, %al
	je	.L1043
	cmpb	$93, %al
	jne	.L1025
	movq	64+symbolList(%rip), %rdx
	leaq	-1(%rsi), %r9
	jmp	.L1154
.L1042:
	cmpb	$125, %al
	jne	.L1025
	movq	24+symbolList(%rip), %rdx
	leaq	-1(%rsi), %r9
	jmp	.L1154
.L1038:
	movq	symbolList(%rip), %rdx
	leaq	-1(%rsi), %r9
	jmp	.L1154
.L1037:
	movq	8+symbolList(%rip), %rdx
	leaq	-1(%rsi), %r9
	jmp	.L1154
.L1041:
	movq	16+symbolList(%rip), %rdx
	leaq	-1(%rsi), %r9
	jmp	.L1154
.L1034:
	movq	32+symbolList(%rip), %rdx
	leaq	-1(%rsi), %r9
	jmp	.L1154
.L1040:
	movq	40+symbolList(%rip), %rdx
	leaq	-1(%rsi), %r9
	jmp	.L1154
.L1032:
	movq	48+symbolList(%rip), %rdx
	leaq	-1(%rsi), %r9
	jmp	.L1154
.L1043:
	movq	56+symbolList(%rip), %rdx
	leaq	-1(%rsi), %r9
	jmp	.L1154
.L1030:
	movq	72+symbolList(%rip), %rdx
	leaq	-1(%rsi), %r9
	jmp	.L1154
.L1035:
	movq	88+symbolList(%rip), %rdx
	leaq	-1(%rsi), %r9
	jmp	.L1154
.L1033:
	movq	96+symbolList(%rip), %rdx
	leaq	-1(%rsi), %r9
	jmp	.L1154
.L1036:
	movq	104+symbolList(%rip), %rdx
	leaq	-1(%rsi), %r9
	jmp	.L1154
.L1031:
	movq	112+symbolList(%rip), %rdx
	leaq	-1(%rsi), %r9
	jmp	.L1154
.L1039:
	movq	120+symbolList(%rip), %rdx
	leaq	-1(%rsi), %r9
	jmp	.L1154
.L1029:
	movq	128+symbolList(%rip), %rdx
	leaq	-1(%rsi), %r9
	jmp	.L1154
.L1026:
	movq	136+symbolList(%rip), %rdx
	leaq	-1(%rsi), %r9
	jmp	.L1154
.L1028:
	movq	144+symbolList(%rip), %rdx
	leaq	-1(%rsi), %r9
.L1154:
	movl	$5, %ecx
	jmp	.L1153
.L1025:
	movq	%r8, 48(%rsp)
	movq	(%rbx), %rbx
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	48(%rsp), %r8
	movq	%rsi, 32(%rsp)
	leaq	.LC146(%rip), %rdx
	movq	%rax, %rcx
	leaq	1(%r8), %r9
	movq	%rbx, %r8
	call	fprintf
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
.L1152:
	xorl	%edx, %edx
	xorl	%ecx, %ecx
.L1153:
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	create_token
	.def	get_next_token;	.scl	3;	.type	32;	.endef
get_next_token:
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$32, %rsp
	movq	48(%rcx), %rax
	testq	%rax, %rax
	je	.L1165
	movq	56(%rcx), %rdx
	movq	%rax, 80(%rcx)
	movq	%rdx, 16(%rcx)
	movq	64(%rcx), %rdx
	movq	%rdx, 32(%rcx)
	movq	72(%rcx), %rdx
	movq	%rdx, 40(%rcx)
	xorl	%edx, %edx
	movq	%rdx, 48(%rcx)
	jmp	.L1164
.L1165:
	movsbl	%dl, %edx
	call	next_token
	movq	%rax, 80(%rbx)
.L1164:
	addq	$32, %rsp
	popq	%rbx
	ret
	.def	peek_next_token.constprop.0;	.scl	3;	.type	32;	.endef
peek_next_token.constprop.0:
	movq	48(%rcx), %rax
	testq	%rax, %rax
	jne	.L1171
	pushq	%rbp
	movl	$1, %edx
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$40, %rsp
	movq	16(%rcx), %rbp
	movq	32(%rcx), %rdi
	movq	40(%rcx), %rsi
	call	get_next_token
	movq	16(%rbx), %rdx
	movq	%rbp, 16(%rbx)
	movq	%rax, 48(%rbx)
	movq	%rdx, 56(%rbx)
	movq	32(%rbx), %rdx
	movq	%rdi, 32(%rbx)
	movq	%rdx, 64(%rbx)
	movq	40(%rbx), %rdx
	movq	%rsi, 40(%rbx)
	movq	%rdx, 72(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L1171:
	ret
	.section .rdata,"dr"
.LC147:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse right operand\12\0"
	.text
	.def	parse_expr_prec;	.scl	3;	.type	32;	.endef
parse_expr_prec:
	pushq	%r15
	leaq	CSWTCH.116(%rip), %r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movl	%r8d, %r12d
	pushq	%rbp
	movq	%r9, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$72, %rsp
	movq	%rcx, 144(%rsp)
	movq	176(%rsp), %r13
	call	peek_next_token.constprop.0
.L1175:
	cmpl	$5, 24(%rax)
	jne	.L1174
	movq	(%rax), %rcx
	xorl	%r14d, %r14d
	call	string_to_operator
	movl	%eax, %edi
	cmpl	$18, %eax
	ja	.L1176
	movl	%eax, %eax
	movsbl	(%r15,%rax), %r14d
.L1176:
	cmpl	$19, %edi
	je	.L1174
	cmpl	%r14d, %r12d
	jg	.L1174
	movq	144(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	144(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	144(%rsp), %rcx
	movq	%r13, %r8
	movq	%rbp, %rdx
	movq	%rax, %rsi
	call	parse_primary
	movq	%rax, %r8
	testq	%rax, %rax
	jne	.L1178
	movq	16(%rsi), %rax
	movq	8(%rsi), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rbx
	movq	0(%r13), %rax
	incq	%r9
	movq	%r9, 56(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC147(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
	jmp	.L1179
.L1178:
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %rsi
.L1184:
	movq	144(%rsp), %rcx
	call	peek_next_token.constprop.0
	cmpl	$5, 24(%rax)
	jne	.L1186
	movq	(%rax), %rcx
	xorl	%r8d, %r8d
	call	string_to_operator
	cmpl	$18, %eax
	ja	.L1181
	movl	%eax, %edx
	movsbl	(%r15,%rdx), %r8d
.L1181:
	cmpl	$19, %eax
	je	.L1186
	cmpl	%r8d, %r14d
	jge	.L1186
	movq	%r13, 32(%rsp)
	movq	144(%rsp), %rcx
	movq	%rsi, %rdx
	movq	%rbp, %r9
	call	parse_expr_prec
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L1184
.L1179:
	xorl	%ebx, %ebx
	jmp	.L1174
.L1186:
	movq	%rbx, %rdx
	movl	%edi, %ecx
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	call	create_expression
	movq	144(%rsp), %rcx
	movq	%rax, %rbx
	call	peek_next_token.constprop.0
	jmp	.L1175
.L1174:
	addq	$72, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.section .rdata,"dr"
.LC148:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse expression primary\12\0"
	.text
	.def	parse_expression;	.scl	3;	.type	32;	.endef
parse_expression:
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rdi
	movq	%r8, %rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	subq	$72, %rsp
	call	parse_primary
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L1192
	movq	80(%rsi), %rax
	movl	$2, %ecx
	movq	16(%rax), %rsi
	movq	8(%rax), %r9
	movq	(%rdi), %rax
	incq	%r9
	incq	%rsi
	movq	24(%rax), %r8
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC148(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
	jmp	.L1191
.L1192:
	xorl	%r9d, %r9d
	movq	%rax, %r8
	xorl	%edx, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rdi, 32(%rsp)
	movq	%rbp, %r9
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	movq	%rsi, %rcx
	call	parse_expr_prec
	movq	%rax, %rbx
.L1191:
	addq	$72, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC149:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse parenthesized expression\12\0"
.LC150:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after expression\12\0"
.LC151:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '!'\12\0"
.LC152:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '-'\12\0"
.LC153:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot call undefined variable\12\0"
.LC154:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot call non-function variable\12\0"
.LC155:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function call argument\12\0"
.LC156:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function call argument\12\0"
.LC157:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse sequence index\12\0"
.LC158:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ']' after sequence index\12\0"
.LC159:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot access attribute without a valid scope\12\0"
.LC160:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected attribute name after '.'\12\0"
.LC161:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown attribute name\12\0"
.LC162:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse variable access\12\0"
.LC163:
	.ascii "[Parser Error] at %s:%zu:%zu: Unexpected token in primary expression\12\0"
	.text
	.def	parse_primary;	.scl	3;	.type	32;	.endef
parse_primary:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$88, %rsp
	movq	80(%rcx), %r12
	movq	%rcx, 160(%rsp)
	movl	24(%r12), %eax
	movq	%rdx, 168(%rsp)
	cmpl	$2, %eax
	jne	.L1196
	movq	(%r12), %rdx
	xorl	%esi, %esi
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	jmp	.L1197
.L1196:
	cmpl	$3, %eax
	jne	.L1198
	movq	(%r12), %rdx
	xorl	%esi, %esi
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$1, %ecx
	jmp	.L1197
.L1198:
	cmpl	$4, %eax
	jne	.L1199
	movq	(%r12), %rdx
	xorl	%esi, %esi
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ecx
	jmp	.L1197
.L1199:
	movq	%r8, %rdi
	cmpl	$6, %eax
	jne	.L1200
	movq	(%r12), %rax
	movq	88+keywordList(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L1239
	movq	96+keywordList(%rip), %rdx
	cmpq	%rdx, %rax
	jne	.L1269
	jmp	.L1276
.L1200:
	cmpl	$5, %eax
	jne	.L1202
	movq	(%r12), %rax
	cmpq	symbolList(%rip), %rax
	jne	.L1203
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rdi, %r8
	movq	%rax, %rbx
	call	parse_expression
	testq	%rax, %rax
	jne	.L1204
	movq	16(%rbx), %rax
	movq	8(%rbx), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	(%rdi), %rax
	incq	%r9
	movq	%r9, 64(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC149(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1271
.L1204:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, 56(%rsp)
	call	get_next_token
	movl	24(%rax), %ecx
	cmpl	$5, %ecx
	jne	.L1206
	movq	8+symbolList(%rip), %rsi
	cmpq	%rsi, (%rax)
	movq	56(%rsp), %r8
	je	.L1241
.L1206:
	movq	16(%rax), %rsi
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%rdi), %rax
	incq	%r9
	leaq	1(%rsi), %rbx
	movq	24(%rax), %r8
	movq	%r9, 64(%rsp)
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC150(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
.L1271:
	call	fprintf
	xorl	%eax, %eax
	jmp	.L1195
.L1203:
	cmpq	40+symbolList(%rip), %rax
	jne	.L1208
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rdi, %r8
	movq	%rax, %rbx
	call	parse_primary
	movq	%rax, %r9
	testq	%rax, %rax
	jne	.L1242
	movq	16(%rbx), %rax
	movq	8(%rbx), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	(%rdi), %rax
	incq	%r9
	movq	%r9, 64(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC151(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1271
.L1208:
	cmpq	96+symbolList(%rip), %rax
	jne	.L1209
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rdi, %r8
	movq	%rax, %rbx
	call	parse_primary
	movq	%rax, %r9
	testq	%rax, %rax
	jne	.L1243
	movq	16(%rbx), %rax
	movq	8(%rbx), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	(%rdi), %rax
	incq	%r9
	movq	%r9, 64(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC152(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1271
.L1269:
	cmpq	40+keywordList(%rip), %rax
	jne	.L1209
	cmpb	$0, 9(%r8)
	je	.L1209
.L1238:
	movq	(%r12), %rdx
	xorl	%r9d, %r9d
	xorl	%r13d, %r13d
	xorl	%ebp, %ebp
	movq	168(%rsp), %rcx
	xorl	%r15d, %r15d
	call	search_name
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rdx, 32(%rsp)
	movq	%rax, %r8
	xorl	%edx, %edx
	movq	%rax, %rbx
	call	create_variable_access
	movq	160(%rsp), %rcx
	movq	%rax, %rsi
	call	peek_next_token.constprop.0
.L1210:
	cmpl	$5, 24(%rax)
	jne	.L1231
	testq	%rbx, %rbx
	je	.L1211
	movq	(%rbx), %rbp
	testq	%rbp, %rbp
	cmove	%rbx, %rbp
.L1211:
	testq	%r13, %r13
	jne	.L1212
	testq	%rbp, %rbp
	je	.L1212
	cmpl	$0, 32(%rbp)
	jne	.L1212
	movq	24(%rbp), %rdx
	movq	16(%rdx), %r13
.L1212:
	movq	(%rax), %rax
	cmpq	symbolList(%rip), %rax
	jne	.L1213
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %r13
	testq	%rbx, %rbx
	jne	.L1214
	movq	16(%rax), %rax
	movq	8(%r13), %r9
	movl	$2, %ecx
	leaq	1(%rax), %r14
	movq	(%rdi), %rax
	incq	%r9
	movq	%r9, 64(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%r14, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC153(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1272
.L1214:
	cmpl	$0, 32(%rbx)
	jne	.L1216
	movq	8(%rbx), %rcx
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	call	make_method_name
	movq	%rax, %rdx
	movq	24(%rbx), %rax
	movq	16(%rax), %rcx
	call	search_name_use_strcmp
	movq	%rsi, %rdx
	xorl	%r9d, %r9d
	movl	$2, %ecx
	movq	%rax, %rbx
	xorl	%eax, %eax
	movq	%rax, 32(%rsp)
	movq	%rbx, %r8
	call	create_variable_access
	movq	%rax, %rsi
	testq	%rbx, %rbx
	je	.L1215
.L1216:
	movl	32(%rbx), %eax
	decl	%eax
	cmpl	$1, %eax
	jbe	.L1215
	movq	16(%r13), %rax
	movq	8(%r13), %r9
	movl	$2, %ecx
	leaq	1(%rax), %r14
	movq	(%rdi), %rax
	incq	%r9
	movq	%r9, 64(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%r14, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC154(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
.L1272:
	call	fprintf
.L1215:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rbp
	call	create_list
	movq	%rax, %r13
.L1219:
	cmpl	$5, 24(%rbp)
	je	.L1277
.L1225:
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rdi, %r8
	call	parse_expression
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L1220
	movq	16(%rbp), %rax
	movl	$2, %ecx
	leaq	1(%rax), %rdx
	movq	8(%rbp), %rax
	movq	%rdx, 72(%rsp)
	leaq	1(%rax), %r9
	movq	(%rdi), %rax
	movq	%r9, 64(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	72(%rsp), %rdx
	movq	64(%rsp), %r9
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	movq	%rdx, 32(%rsp)
	leaq	.LC155(%rip), %rdx
	call	fprintf
.L1220:
	movq	%r14, %rdx
	movq	%r13, %rcx
	call	list_append
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rbp
	jne	.L1221
	movq	(%rax), %rax
	cmpq	32+symbolList(%rip), %rax
	jne	.L1222
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rbp
	jmp	.L1219
.L1222:
	cmpq	8+symbolList(%rip), %rax
	je	.L1219
.L1221:
	movq	16(%rbp), %rax
	movq	8(%rbp), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rbx
	movq	(%rdi), %rax
	incq	%r9
	movq	%r9, 64(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC156(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1275
.L1277:
	movq	8+symbolList(%rip), %rax
	cmpq	%rax, 0(%rbp)
	jne	.L1225
	movq	%r13, 32(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rsi, %rdx
	movl	$1, %ecx
	call	create_variable_access
	movq	(%rbx), %rbx
	movq	%rax, %rsi
	cmpl	$0, 32(%rbx)
	jne	.L1245
	movq	24(%rbx), %rax
	movq	16(%rax), %r13
	jmp	.L1274
.L1213:
	cmpq	56+symbolList(%rip), %rax
	jne	.L1227
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	168(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	%rdi, %r8
	movq	%rax, 56(%rsp)
	call	parse_expression
	movq	56(%rsp), %r9
	testq	%rax, %rax
	movq	%rax, %r14
	jne	.L1228
	movq	16(%r9), %rax
	movl	$2, %ecx
	leaq	1(%rax), %rdx
	movq	8(%r9), %rax
	movq	%rdx, 72(%rsp)
	leaq	1(%rax), %r9
	movq	(%rdi), %rax
	movq	%r9, 64(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	72(%rsp), %rdx
	movq	64(%rsp), %r9
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	movq	%rdx, 32(%rsp)
	leaq	.LC157(%rip), %rdx
	call	fprintf
.L1228:
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1229
	movq	64+symbolList(%rip), %rdx
	cmpq	%rdx, (%rax)
	je	.L1230
.L1229:
	movq	16(%rax), %rsi
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%rdi), %rax
	incq	%r9
	leaq	1(%rsi), %rbx
	movq	24(%rax), %r8
	movq	%r9, 64(%rsp)
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC158(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
.L1275:
	call	fprintf
	jmp	.L1224
.L1230:
	movq	%r15, 32(%rsp)
	movq	%rsi, %rdx
	movq	%r14, %r9
	xorl	%r8d, %r8d
	movl	$3, %ecx
	call	create_variable_access
	movq	%rax, %rsi
	jmp	.L1226
.L1227:
	cmpq	48+symbolList(%rip), %rax
	jne	.L1231
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	160(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %r14
	testq	%r13, %r13
	jne	.L1232
	movq	16(%rax), %rax
	movq	8(%r14), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rbx
	movq	(%rdi), %rax
	incq	%r9
	movq	%r9, 64(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC159(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1275
.L1232:
	cmpl	$1, 24(%rax)
	je	.L1233
	movq	16(%rax), %rax
	movq	8(%r14), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rbx
	movq	(%rdi), %rax
	incq	%r9
	movq	%r9, 64(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC160(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1275
.L1233:
	movq	(%rax), %rdx
	movq	%r13, %rcx
	call	search_name
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L1234
	testq	%rbp, %rbp
	je	.L1235
	cmpl	$0, 32(%rbp)
	je	.L1273
	movq	0(%rbp), %rbp
	testq	%rbp, %rbp
	je	.L1235
	cmpl	$0, 32(%rbp)
	jne	.L1246
.L1273:
	movq	8(%rbp), %rbp
	jmp	.L1235
.L1246:
	xorl	%ebp, %ebp
.L1235:
	movq	%rbp, %rcx
	call	make_method_name
	movq	%r13, %rcx
	movq	%rax, %rdx
	call	search_name_use_strcmp
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L1234
	movq	16(%r14), %rax
	movq	8(%r14), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rbx
	movq	(%rdi), %rax
	incq	%r9
	movq	%r9, 64(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC161(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1275
.L1234:
	movq	%r15, 32(%rsp)
	movq	%rsi, %rdx
	xorl	%r9d, %r9d
	movq	%rbx, %r8
	movl	$2, %ecx
	call	create_variable_access
	movq	%rax, %rsi
.L1245:
	xorl	%r13d, %r13d
.L1274:
	xorl	%ebp, %ebp
.L1226:
	movq	160(%rsp), %rcx
	call	peek_next_token.constprop.0
	jmp	.L1210
.L1231:
	testq	%rsi, %rsi
	jne	.L1247
.L1224:
	movq	16(%r12), %rax
	movq	8(%r12), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rbx
	movq	(%rdi), %rax
	incq	%r9
	movq	%r9, 64(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC162(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1271
.L1202:
	decl	%eax
	je	.L1238
.L1209:
	movq	16(%r12), %rax
	movq	8(%r12), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rbx
	movq	(%rdi), %rax
	incq	%r9
	movq	%r9, 64(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC163(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1271
.L1239:
	xorl	%esi, %esi
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$3, %ecx
	jmp	.L1197
.L1276:
	xorl	%esi, %esi
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$4, %ecx
	jmp	.L1197
.L1241:
	xorl	%esi, %esi
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	jmp	.L1197
.L1242:
	xorl	%esi, %esi
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$6, %ecx
	jmp	.L1197
.L1243:
	xorl	%esi, %esi
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$7, %ecx
	jmp	.L1197
.L1247:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$8, %ecx
.L1197:
	movq	%rsi, 32(%rsp)
	call	create_primary
.L1195:
	addq	$88, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.section .rdata,"dr"
.LC164:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected variable type\12\0"
.LC165:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected a type for variable declaration\12\0"
.LC166:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown variable type\12\0"
.LC167:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected variable name\12\0"
.LC168:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse variable initializer\12\0"
	.text
	.def	parse_variable;	.scl	3;	.type	32;	.endef
parse_variable:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rdx, %r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	movq	%r8, %rbx
	subq	$64, %rsp
	movq	80(%rcx), %r10
	movl	24(%r10), %eax
	cmpl	$1, %eax
	je	.L1279
	cmpl	$6, %eax
	jne	.L1280
	movq	(%r10), %rax
	cmpq	128+keywordList(%rip), %rax
	je	.L1279
	cmpq	136+keywordList(%rip), %rax
	je	.L1279
	cmpq	144+keywordList(%rip), %rax
	je	.L1279
	cmpq	152+keywordList(%rip), %rax
	je	.L1279
	cmpq	160+keywordList(%rip), %rax
	jne	.L1280
.L1279:
	movq	(%r10), %rdx
	movq	%r12, %rcx
	call	search_name
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L1282
	movl	32(%rax), %eax
	cmpl	$6, %eax
	je	.L1283
	testl	%eax, %eax
	je	.L1283
	movq	16(%r10), %rax
	movq	8(%r10), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rbp
	movq	(%rbx), %rax
	incq	%r9
	movq	%r9, 56(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbp, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC165(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1303
.L1282:
	movq	16(%r10), %rax
	movq	8(%r10), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rbp
	movq	(%rbx), %rax
	incq	%r9
	movq	%r9, 56(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbp, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC166(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
.L1303:
	call	fprintf
.L1283:
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rbp
	je	.L1284
	movq	16(%rax), %rax
	movl	$2, %ecx
	leaq	1(%rax), %r13
	movq	8(%rbp), %rax
	leaq	1(%rax), %r9
	movq	(%rbx), %rax
	movq	%r9, 56(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%r13, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC167(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
.L1284:
	cmpb	$0, 10(%rbx)
	movl	$3, %edx
	je	.L1285
	cmpb	$1, 9(%rbx)
	sbbl	%edx, %edx
	andl	$2, %edx
	addl	$3, %edx
.L1285:
	movq	0(%rbp), %rcx
	movq	%r12, %r9
	movq	%rdi, %r8
	xorl	%ebp, %ebp
	call	create_symbol
	movq	%rsi, %rcx
	movq	%rax, %r14
	call	peek_next_token.constprop.0
	cmpl	$5, 24(%rax)
	jne	.L1286
	movq	144+symbolList(%rip), %rdx
	cmpq	%rdx, (%rax)
	jne	.L1286
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rbx, %r8
	movq	%r12, %rdx
	movq	%rsi, %rcx
	movq	%rax, %r13
	call	parse_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L1286
	movq	16(%r13), %rax
	movq	8(%r13), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	(%rbx), %rax
	incq	%r9
	movq	%r9, 56(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC168(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
.L1286:
	addq	$64, %rsp
	movq	%rbp, %r8
	movq	%r14, %rdx
	movq	%rdi, %rcx
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	create_variable
.L1280:
	movq	16(%r10), %rax
	movq	8(%r10), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	(%rbx), %rax
	incq	%r9
	movq	%r9, 56(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC164(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
	addq	$64, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.section .rdata,"dr"
.LC169:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'if'\12\0"
.LC170:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse if condition\12\0"
.LC171:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after if condition\12\0"
.LC172:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start if body\12\0"
.LC173:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse if body statement\12\0"
.LC174:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'elif'\12\0"
.LC175:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse else-if condition\12\0"
.LC176:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after else-if condition\12\0"
.LC177:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start else-if body\12\0"
.LC178:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse else-if body statement\12\0"
.LC179:
	.ascii "Error creating else-if statement: condition is NULL\12\0"
.LC180:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start else body\12\0"
.LC181:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse else body statement\12\0"
.LC182:
	.ascii "Error creating if statement: condition is NULL\12\0"
.LC183:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'for'\12\0"
.LC184:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop initializer\12\0"
.LC185:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop initializer\12\0"
.LC186:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop condition\12\0"
.LC187:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop condition\12\0"
.LC188:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop increment\12\0"
.LC189:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after for loop increment\12\0"
.LC190:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start for loop body\12\0"
.LC191:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop body statement\12\0"
.LC192:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'while'\12\0"
.LC193:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse while condition\12\0"
.LC194:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after while condition\12\0"
.LC195:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start while body\12\0"
.LC196:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse while body statement\12\0"
.LC197:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot use 'break' outside of a loop\12\0"
.LC198:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot use 'continue' outside of a loop\12\0"
.LC199:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse statement\12\0"
.LC200:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after statement\12\0"
	.text
	.def	parse_statement;	.scl	3;	.type	32;	.endef
parse_statement:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	movq	%r8, %rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$88, %rsp
	movq	%rdx, 168(%rsp)
	movq	80(%rcx), %rdx
	cmpl	$6, 24(%rdx)
	jne	.L1305
	movq	(%rdx), %rax
	cmpq	48+keywordList(%rip), %rax
	jne	.L1306
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1307
	movq	symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	je	.L1308
.L1307:
	movq	16(%rax), %rdi
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%rsi), %rax
	incq	%r9
	leaq	1(%rdi), %rbx
	movq	24(%rax), %r8
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC169(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1395
.L1308:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	168(%rsp), %rdx
	movq	%rsi, %r8
	movq	%rbx, %rcx
	movq	%rax, %rdi
	call	parse_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L1310
	movq	16(%rdi), %rax
	movq	8(%rdi), %r9
	movl	$2, %ecx
	leaq	1(%rax), %r12
	movq	(%rsi), %rax
	incq	%r9
	movq	%r9, 56(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%r12, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC170(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
.L1310:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1311
	movq	8+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	je	.L1312
.L1311:
	movq	16(%rax), %rdi
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%rsi), %rax
	incq	%r9
	leaq	1(%rdi), %rbx
	movq	24(%rax), %r8
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC171(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
.L1395:
	call	fprintf
.L1309:
	xorl	%edx, %edx
	jmp	.L1313
.L1312:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1314
	movq	16+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	je	.L1315
.L1314:
	movq	16(%rax), %rdi
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%rsi), %rax
	incq	%r9
	leaq	1(%rdi), %rbx
	movq	24(%rax), %r8
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC172(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1395
.L1315:
	call	create_list
	movl	$1, %edx
	movq	%rbx, %rcx
	leaq	.LC173(%rip), %r12
	movq	%rax, %r14
	call	get_next_token
	movq	%rax, %r15
.L1316:
	cmpl	$5, 24(%r15)
	je	.L1405
.L1318:
	movq	168(%rsp), %rdx
	movq	%rsi, %r8
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L1317
	movq	16(%r15), %rax
	movq	8(%r15), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rdi
	movq	(%rsi), %rax
	incq	%r9
	movq	%r9, 56(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	56(%rsp), %r9
	movq	%r12, %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
.L1317:
	movq	%r13, %rdx
	movq	%r14, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r15
	jmp	.L1316
.L1405:
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, (%r15)
	jne	.L1318
	call	create_list
	movq	%rax, %r13
	call	create_list
	movq	%rax, %r12
.L1397:
	movq	%rbx, %rcx
	call	peek_next_token.constprop.0
	cmpl	$6, 24(%rax)
	jne	.L1332
	movq	(%rax), %rax
	cmpq	56+keywordList(%rip), %rax
	jne	.L1406
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1320
	movq	symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	je	.L1321
.L1320:
	movq	16(%rax), %rdi
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%rsi), %rax
	incq	%r9
	leaq	1(%rdi), %rbx
	movq	24(%rax), %r8
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC174(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1395
.L1321:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	168(%rsp), %rdx
	movq	%rsi, %r8
	movq	%rbx, %rcx
	movq	%rax, %r15
	call	parse_expression
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L1322
	movq	16(%r15), %rax
	movq	8(%r15), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rdx
	movq	(%rsi), %rax
	incq	%r9
	movq	%rdx, 64(%rsp)
	movq	24(%rax), %r8
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	64(%rsp), %rdx
	movq	56(%rsp), %r9
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	movq	%rdx, 32(%rsp)
	leaq	.LC175(%rip), %rdx
	call	fprintf
.L1322:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1323
	movq	8+symbolList(%rip), %rdx
	cmpq	%rdx, (%rax)
	je	.L1324
.L1323:
	movq	16(%rax), %rdi
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%rsi), %rax
	incq	%r9
	leaq	1(%rdi), %rbx
	movq	24(%rax), %r8
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC176(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1395
.L1324:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1325
	movq	16+symbolList(%rip), %rdx
	cmpq	%rdx, (%rax)
	je	.L1326
.L1325:
	movq	16(%rax), %rdi
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%rsi), %rax
	incq	%r9
	leaq	1(%rdi), %rbx
	movq	24(%rax), %r8
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC177(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1395
.L1326:
	call	create_list
	movq	%rax, %r15
.L1396:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r9
	je	.L1407
.L1329:
	movq	168(%rsp), %rdx
	movq	%rsi, %r8
	movq	%rbx, %rcx
	movq	%r9, 48(%rsp)
	call	parse_statement
	movq	48(%rsp), %r9
	testq	%rax, %rax
	movq	%rax, %r10
	jne	.L1328
	movq	%rax, 72(%rsp)
	movq	16(%r9), %rax
	movl	$2, %ecx
	leaq	1(%rax), %rdx
	movq	8(%r9), %rax
	movq	%rdx, 64(%rsp)
	leaq	1(%rax), %r9
	movq	(%rsi), %rax
	movq	%r9, 56(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	64(%rsp), %rdx
	movq	56(%rsp), %r9
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	movq	%rdx, 32(%rsp)
	leaq	.LC178(%rip), %rdx
	call	fprintf
	movq	72(%rsp), %r10
.L1328:
	movq	%r10, %rdx
	movq	%r15, %rcx
	call	list_append
	jmp	.L1396
.L1407:
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, (%r9)
	jne	.L1329
	testq	%rdi, %rdi
	jne	.L1330
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC179(%rip), %rcx
	movq	%rax, %rdx
	call	fputs
	jmp	.L1331
.L1330:
	movl	$16, %ecx
	call	alloc_memory
	movq	%r15, 8(%rax)
	movq	%rdi, (%rax)
	movq	%rax, %rdi
.L1331:
	movq	%rdi, %rdx
	movq	%r13, %rcx
	call	list_append
	jmp	.L1397
.L1406:
	cmpq	64+keywordList(%rip), %rax
	je	.L1408
.L1332:
	testq	%rbp, %rbp
	jne	.L1393
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC182(%rip), %rcx
	movq	%rax, %rdx
	call	fputs
	jmp	.L1309
.L1408:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1337
	movq	16+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	je	.L1398
.L1337:
	movq	16(%rax), %rdi
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%rsi), %rax
	incq	%r9
	leaq	1(%rdi), %rbx
	movq	24(%rax), %r8
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC180(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1395
.L1409:
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, (%rdi)
	je	.L1332
.L1341:
	movq	168(%rsp), %rdx
	movq	%rsi, %r8
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L1340
	movq	16(%rdi), %rax
	movq	8(%rdi), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rdx
	movq	(%rsi), %rax
	incq	%r9
	movq	%rdx, 64(%rsp)
	movq	24(%rax), %r8
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	64(%rsp), %rdx
	movq	56(%rsp), %r9
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	movq	%rdx, 32(%rsp)
	leaq	.LC181(%rip), %rdx
	call	fprintf
.L1340:
	movq	%r15, %rdx
	movq	%r12, %rcx
	call	list_append
.L1398:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rdi
	je	.L1409
	jmp	.L1341
.L1393:
	movl	$32, %ecx
	call	alloc_memory
	movq	%rbp, (%rax)
	movq	%rax, %rdx
	movq	%r14, 8(%rax)
	movq	%r13, 16(%rax)
	movq	%r12, 24(%rax)
.L1313:
	xorl	%edi, %edi
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$2, %ecx
	movq	%rdi, 40(%rsp)
	movq	%rdi, 32(%rsp)
	jmp	.L1404
.L1306:
	cmpq	80+keywordList(%rip), %rax
	jne	.L1343
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1344
	movq	symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	je	.L1345
.L1344:
	movq	16(%rax), %rdi
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%rsi), %rax
	incq	%r9
	leaq	1(%rdi), %rbx
	movq	24(%rax), %r8
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC183(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1399
.L1345:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rdi
	jne	.L1347
	movq	72+symbolList(%rip), %rax
	cmpq	%rax, (%rdi)
	je	.L1389
.L1347:
	movq	168(%rsp), %rdx
	movq	%rsi, %r8
	movq	%rbx, %rcx
	call	parse_variable
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L1349
	movq	16(%rdi), %rax
	movq	8(%rdi), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rbp
	movq	(%rsi), %rax
	incq	%r9
	movq	%r9, 56(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbp, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC184(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
.L1349:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1350
	movq	72+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	je	.L1348
.L1350:
	movq	16(%rax), %rdi
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%rsi), %rax
	incq	%r9
	leaq	1(%rdi), %rbx
	movq	24(%rax), %r8
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC185(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
.L1399:
	call	fprintf
	xorl	%r9d, %r9d
	jmp	.L1351
.L1389:
	xorl	%r12d, %r12d
.L1348:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %rdi
	jne	.L1352
	movq	72+symbolList(%rip), %rax
	cmpq	%rax, (%rdi)
	je	.L1390
.L1352:
	movq	168(%rsp), %rdx
	movq	%rsi, %r8
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L1354
	movq	16(%rdi), %rax
	movq	8(%rdi), %r9
	movl	$2, %ecx
	leaq	1(%rax), %r13
	movq	(%rsi), %rax
	incq	%r9
	movq	%r9, 56(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%r13, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC186(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
.L1354:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1355
	movq	72+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	je	.L1353
.L1355:
	movq	16(%rax), %rdi
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%rsi), %rax
	incq	%r9
	leaq	1(%rdi), %rbx
	movq	24(%rax), %r8
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC187(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1399
.L1390:
	xorl	%ebp, %ebp
.L1353:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L1356
	movq	8+symbolList(%rip), %rax
	cmpq	%rax, 0(%r13)
	je	.L1391
.L1356:
	movq	168(%rsp), %rdx
	movq	%rsi, %r8
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L1358
	movq	16(%r13), %rax
	movq	8(%r13), %r9
	movl	$2, %ecx
	leaq	1(%rax), %r14
	movq	(%rsi), %rax
	incq	%r9
	movq	%r9, 56(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%r14, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC188(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
.L1358:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1359
	movq	8+symbolList(%rip), %rdx
	cmpq	%rdx, (%rax)
	je	.L1357
.L1359:
	movq	16(%rax), %rdi
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%rsi), %rax
	incq	%r9
	leaq	1(%rdi), %rbx
	movq	24(%rax), %r8
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC189(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1399
.L1391:
	xorl	%edi, %edi
.L1357:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1360
	movq	16+symbolList(%rip), %rdx
	cmpq	%rdx, (%rax)
	je	.L1361
.L1360:
	movq	16(%rax), %rdi
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%rsi), %rax
	incq	%r9
	leaq	1(%rdi), %rbx
	movq	24(%rax), %r8
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC190(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1399
.L1361:
	call	create_list
	movb	$1, 11(%rsi)
	movq	%rax, %r13
.L1400:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r14
	je	.L1410
.L1364:
	movq	168(%rsp), %rdx
	movq	%rsi, %r8
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L1363
	movq	16(%r14), %rax
	movq	8(%r14), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rdx
	movq	(%rsi), %rax
	incq	%r9
	movq	%rdx, 64(%rsp)
	movq	24(%rax), %r8
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	64(%rsp), %rdx
	movq	56(%rsp), %r9
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	movq	%rdx, 32(%rsp)
	leaq	.LC191(%rip), %rdx
	call	fprintf
.L1363:
	movq	%r15, %rdx
	movq	%r13, %rcx
	call	list_append
	jmp	.L1400
.L1410:
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, (%r14)
	jne	.L1364
	movb	$0, 11(%rsi)
	movl	$32, %ecx
	call	alloc_memory
	movq	%r12, (%rax)
	movq	%rax, %r9
	movq	%rbp, 8(%rax)
	movq	%rdi, 16(%rax)
	movq	%r13, 24(%rax)
.L1351:
	xorl	%esi, %esi
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$4, %ecx
	movq	%rsi, 40(%rsp)
	movq	%rsi, 32(%rsp)
.L1404:
	call	create_statement
	movq	%rax, %rdi
	jmp	.L1304
.L1343:
	cmpq	72+keywordList(%rip), %rax
	jne	.L1365
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1366
	movq	symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	je	.L1367
.L1366:
	movq	16(%rax), %rbx
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%rsi), %rax
	incq	%r9
	incq	%rbx
	movq	24(%rax), %r8
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC192(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1401
.L1367:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	168(%rsp), %rdx
	movq	%rsi, %r8
	movq	%rbx, %rcx
	movq	%rax, %rdi
	call	parse_expression
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L1369
	movq	16(%rdi), %rax
	movq	8(%rdi), %r9
	movl	$2, %ecx
	leaq	1(%rax), %r12
	movq	(%rsi), %rax
	incq	%r9
	movq	%r9, 56(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%r12, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC193(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
.L1369:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1370
	movq	8+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	je	.L1371
.L1370:
	movq	16(%rax), %rbx
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%rsi), %rax
	incq	%r9
	incq	%rbx
	movq	24(%rax), %r8
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC194(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
.L1401:
	call	fprintf
	xorl	%r8d, %r8d
	jmp	.L1372
.L1371:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1373
	movq	16+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	je	.L1374
.L1373:
	movq	16(%rax), %rbx
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%rsi), %rax
	incq	%r9
	incq	%rbx
	movq	24(%rax), %r8
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC195(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1401
.L1374:
	call	create_list
	movb	$1, 11(%rsi)
	movq	%rbx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	leaq	.LC196(%rip), %r13
	call	get_next_token
	movq	%rax, %r15
.L1375:
	cmpl	$5, 24(%r15)
	je	.L1411
.L1377:
	movq	168(%rsp), %rdx
	movq	%rsi, %r8
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.L1376
	movq	16(%r15), %rax
	movq	8(%r15), %r9
	movl	$2, %ecx
	leaq	1(%rax), %r12
	movq	(%rsi), %rax
	incq	%r9
	movq	%r9, 56(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%r12, 32(%rsp)
	movq	56(%rsp), %r9
	movq	%r13, %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
.L1376:
	movq	%r14, %rdx
	movq	%rdi, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r15
	jmp	.L1375
.L1411:
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, (%r15)
	jne	.L1377
	movb	$0, 11(%rsi)
	movl	$16, %ecx
	call	alloc_memory
	movq	%rbp, (%rax)
	movq	%rax, %r8
	movq	%rdi, 8(%rax)
.L1372:
	xorl	%ebx, %ebx
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$3, %ecx
	movq	%rbx, 40(%rsp)
	movq	%rbx, 32(%rsp)
	jmp	.L1404
.L1365:
	cmpq	168+keywordList(%rip), %rax
	jne	.L1378
	movl	$1, %edx
	call	get_next_token
	movq	168(%rsp), %rdx
	movq	%rsi, %r8
	movq	%rbx, %rcx
	call	parse_variable
	xorl	%r11d, %r11d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, 40(%rsp)
	xorl	%edx, %edx
	movl	$1, %ecx
	movq	%r11, 32(%rsp)
	jmp	.L1403
.L1378:
	cmpq	104+keywordList(%rip), %rax
	jne	.L1380
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1381
	movq	72+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1381
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%r10, 40(%rsp)
	movl	$5, %ecx
	movq	%r10, 32(%rsp)
	jmp	.L1404
.L1381:
	movq	168(%rsp), %rdx
	movq	%rsi, %r8
	movq	%rbx, %rcx
	call	parse_expression
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%r9, 40(%rsp)
	movl	$5, %ecx
	xorl	%r9d, %r9d
	movq	%rax, 32(%rsp)
	jmp	.L1403
.L1380:
	cmpq	112+keywordList(%rip), %rax
	jne	.L1382
	cmpb	$0, 11(%r8)
	jne	.L1383
	movq	16(%rdx), %rax
	movq	8(%rdx), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rbx
	movq	(%r8), %rax
	incq	%r9
	movq	%r9, 56(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC197(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1402
.L1383:
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$6, %ecx
	movq	%r8, 40(%rsp)
	movq	%r8, 32(%rsp)
	xorl	%r8d, %r8d
	jmp	.L1403
.L1382:
	cmpq	120+keywordList(%rip), %rax
	jne	.L1305
	cmpb	$0, 11(%r8)
	jne	.L1385
	movq	16(%rdx), %rax
	movq	8(%rdx), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rbx
	movq	(%r8), %rax
	incq	%r9
	movq	%r9, 56(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC198(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
.L1402:
	call	fprintf
	xorl	%edi, %edi
	jmp	.L1304
.L1385:
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rcx, 40(%rsp)
	movq	%rcx, 32(%rsp)
	movl	$7, %ecx
	jmp	.L1403
.L1305:
	movq	168(%rsp), %rdx
	movq	%rsi, %r8
	movq	%rbx, %rcx
	call	parse_expression
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, 32(%rsp)
	xorl	%ecx, %ecx
	movq	%rdx, 40(%rsp)
	xorl	%edx, %edx
.L1403:
	call	create_statement
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L1386
	movq	80(%rbx), %rax
	movl	$2, %ecx
	movq	16(%rax), %rdx
	movq	8(%rax), %r9
	movq	(%rsi), %rax
	leaq	1(%rdx), %rbp
	incq	%r9
	movq	24(%rax), %r8
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbp, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC199(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
.L1386:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1387
	movq	72+symbolList(%rip), %rbx
	cmpq	%rbx, (%rax)
	je	.L1304
.L1387:
	movq	16(%rax), %rbx
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%rsi), %rax
	incq	%r9
	incq	%rbx
	movq	24(%rax), %r8
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	56(%rsp), %r9
	leaq	.LC200(%rip), %rdx
	movq	48(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
.L1304:
	addq	$88, %rsp
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
	.section .rdata,"dr"
.LC201:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected identifier after 'import'\12\0"
.LC202:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected string literal after 'from'\12\0"
.LC203:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' at end of import statement\12\0"
.LC204:
	.ascii "%s.tc\0"
.LC205:
	.ascii "D:/TC/std/\0"
.LC206:
	.ascii "r\0"
.LC207:
	.ascii "Error opening library file for import: %s\12\0"
.LC208:
	.ascii "Info: Starting parsing lib file for import: %s\12\0"
.LC209:
	.ascii "Info: Finished parsing lib file for import: %s\12\0"
.LC210:
	.ascii "Error parsing library file for import: %s\12\0"
.LC211:
	.ascii "Error: Imported symbol '%s' was not found in %s\12\0"
.LC212:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to import module\12\0"
.LC213:
	.ascii "Error creating import: name is NULL\12\0"
.LC214:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse import statement\12\0"
.LC215:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected function return type after 'func'\12\0"
.LC216:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown function return type\12\0"
.LC217:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected function name after return type\12\0"
.LC218:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after function name\12\0"
.LC219:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function parameter\12\0"
.LC220:
	.ascii "[Parser Error] at %s:%zu:%zu: Function parameters cannot have default values\12\0"
.LC221:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function parameter\12\0"
.LC222:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start function body\12\0"
.LC223:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function body statement\12\0"
.LC224:
	.ascii "[Parser Error] at %s:%zu:%zu: Unreachable code after return statement\12\0"
.LC225:
	.ascii "[Parser Error] at %s:%zu:%zu: Function missing return statement\12\0"
.LC226:
	.ascii "Error creating function: name or return_type is NULL\12\0"
.LC227:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function declaration\12\0"
.LC228:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected class name after 'class'\12\0"
.LC229:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start class body\12\0"
.LC230:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected method return type after 'method'\12\0"
.LC231:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown return type for method\12\0"
.LC232:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected method name after return type\12\0"
.LC233:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after method name\12\0"
.LC234:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected 'self' as first parameter of method\12\0"
.LC235:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after method parameter\12\0"
.LC236:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse method parameter\12\0"
.LC237:
	.ascii "[Parser Error] at %s:%zu:%zu: Method parameters cannot have default values\12\0"
.LC238:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start method body\12\0"
.LC239:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse method body statement\12\0"
.LC240:
	.ascii "[Parser Error] at %s:%zu:%zu: Method missing return statement\12\0"
.LC241:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse class method\12\0"
.LC242:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse class variable\12\0"
.LC243:
	.ascii "[Parser Error] at %s:%zu:%zu: Unsupported type for class variable\12\0"
.LC244:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after class variable declaration\12\0"
.LC245:
	.ascii "[Parser Error] at %s:%zu:%zu: Unexpected token in class member\12\0"
.LC246:
	.ascii "[Parser Error] at %s:%zu:%zu: Constructor name conflicts with existing member\12\0"
.LC247:
	.ascii "0\0"
.LC248:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse class declaration\12\0"
.LC249:
	.ascii "[Parser Error] at %s:%zu:%zu: Unexpected token in code member\12\0"
	.text
	.def	parse_code;	.scl	3;	.type	32;	.endef
parse_code:
	pushq	%r15
	movq	%r8, %r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$184, %rsp
	cmpq	$0, builtin_scope(%rip)
	movq	%rcx, 256(%rsp)
	jne	.L1413
	xorl	%ecx, %ecx
	call	create_symbol_table
	movq	160+keywordList(%rip), %rcx
	xorl	%r8d, %r8d
	movl	$6, %edx
	movq	%rax, %r9
	movq	%rax, builtin_scope(%rip)
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
.L1413:
	testq	%rbx, %rbx
	jne	.L1414
	movq	builtin_scope(%rip), %rbx
.L1414:
	call	create_list
	movq	%rbx, %rcx
	movq	%rax, 96(%rsp)
	call	create_symbol_table
	movq	%rax, 72(%rsp)
.L1432:
	movq	256(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L1526
	movl	24(%rax), %eax
	testl	%eax, %eax
	je	.L1526
	cmpl	$6, %eax
	jne	.L1416
	movq	(%rbx), %rax
	cmpq	keywordList(%rip), %rax
	jne	.L1417
	movq	256(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	__imp___acrt_iob_func(%rip), %rbp
	cmpl	$1, 24(%rax)
	je	.L1418
	movq	16(%rax), %rdi
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%r15), %rax
	incq	%r9
	leaq	1(%rdi), %rsi
	movq	24(%rax), %r8
	movq	%r9, 64(%rsp)
	movq	%r8, 56(%rsp)
	call	*%rbp
	movq	%rsi, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC201(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1553
.L1418:
	movq	(%rax), %rax
	movq	256(%rsp), %rcx
	movl	$1, %edx
	xorl	%r14d, %r14d
	movq	%rax, 56(%rsp)
	call	get_next_token
	cmpl	$6, 24(%rax)
	movq	%rax, %rsi
	jne	.L1420
	movq	8+keywordList(%rip), %rax
	cmpq	%rax, (%rsi)
	jne	.L1420
	movq	256(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$4, 24(%rax)
	je	.L1421
	movq	16(%rax), %rdi
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%r15), %rax
	incq	%r9
	leaq	1(%rdi), %rsi
	movq	24(%rax), %r8
	movq	%r9, 64(%rsp)
	movq	%r8, 56(%rsp)
	call	*%rbp
	movq	%rsi, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC202(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
.L1553:
	call	fprintf
	jmp	.L1419
.L1421:
	movq	256(%rsp), %rcx
	movl	$1, %edx
	movq	(%rax), %r14
	call	get_next_token
	movq	%rax, %rsi
.L1420:
	cmpl	$5, 24(%rsi)
	movq	(%r15), %rcx
	jne	.L1422
	movq	72+symbolList(%rip), %rax
	cmpq	%rax, (%rsi)
	je	.L1423
.L1422:
	movq	8(%rsi), %r9
	movq	24(%rcx), %r8
	movl	$2, %ecx
	movq	16(%rsi), %rax
	incq	%r9
	movq	%r8, 56(%rsp)
	movq	%r9, 64(%rsp)
	leaq	1(%rax), %rdi
	call	*%rbp
	movq	%rdi, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC203(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1553
.L1423:
	testq	%r14, %r14
	jne	.L1424
	movq	56(%rsp), %rcx
	call	strlen
	xorl	%r8d, %r8d
	leaq	.LC38(%rip), %rcx
	leaq	4(%rax), %rdx
	call	create_string_check
	movq	56(%rsp), %r8
	leaq	.LC204(%rip), %rdx
	movq	%rax, %rdi
	movq	%rax, %rcx
	call	sprintf
	leaq	.LC205(%rip), %rdx
	movq	%rdi, %rcx
	jmp	.L1551
.L1424:
	call	get_file_dir
	movq	%r14, %rcx
	movq	%rax, %rdx
.L1551:
	call	absolute_path
	leaq	.LC206(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rdi
	call	fopen
	movl	$2, %ecx
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L1426
	call	*%rbp
	movq	%rdi, %r8
	leaq	.LC207(%rip), %rdx
	movq	%rax, %rcx
	jmp	.L1552
.L1426:
	call	*%rbp
	movq	%rdi, %r8
	leaq	.LC208(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	xorl	%r10d, %r10d
	leaq	168(%rsp), %rdx
	movq	%r13, %rcx
	movq	%r10, 168(%rsp)
	call	read_source.constprop.0
	movq	%r13, %rcx
	movq	%rax, 64(%rsp)
	call	fclose
	movq	%rdi, %rcx
	call	create_file
	movl	$16, %ecx
	movq	%rax, %r13
	call	alloc_memory
	movq	168(%rsp), %rdx
	movq	64(%rsp), %rcx
	movq	%rdi, %r8
	movq	%r13, (%rax)
	movq	builtin_scope(%rip), %r13
	movq	%rax, %r12
	movw	$0, 8(%rax)
	movb	$0, 11(%rax)
	call	create_lexer
	movq	%r13, %rdx
	movq	%r12, %r8
	movq	%rax, %rcx
	call	parse_code
	movl	$2, %ecx
	movq	%rax, %r13
	call	*%rbp
	movq	%rdi, %r8
	leaq	.LC209(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	testq	%r13, %r13
	jne	.L1428
	movl	$2, %ecx
	call	*%rbp
	movq	%rdi, %r8
	leaq	.LC210(%rip), %rdx
	movq	%rax, %rcx
.L1552:
	call	fprintf
	jmp	.L1427
.L1428:
	movq	8(%r13), %rcx
	movq	56(%rsp), %rdx
	call	search_name_use_strcmp
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L1429
	movq	72(%rsp), %rax
	movq	%r13, %rdx
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L1430
.L1429:
	movl	$2, %ecx
	call	*%rbp
	movq	56(%rsp), %r8
	movq	%rdi, %r9
	leaq	.LC211(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L1427:
	movq	16(%rsi), %rax
	movq	8(%rsi), %r9
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rsi
	leaq	1(%rax), %rdi
	movq	(%r15), %rax
	incq	%r9
	movq	%r9, 80(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 64(%rsp)
	call	*%rsi
	movq	%rdi, 32(%rsp)
	movq	80(%rsp), %r9
	leaq	.LC212(%rip), %rdx
	movq	64(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
	movq	72(%rsp), %r9
	movq	56(%rsp), %rcx
	movl	$3, %edx
	movq	name_void(%rip), %r8
	call	create_symbol
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L1430
	movl	$2, %ecx
	call	*%rsi
	leaq	.LC213(%rip), %rcx
	movq	%rax, %rdx
	call	fputs
	jmp	.L1419
.L1430:
	movl	$16, %ecx
	call	alloc_memory
	movq	%r13, (%rax)
	movq	%rax, %rdx
	movq	%r14, 8(%rax)
	jmp	.L1431
.L1419:
	movq	16(%rbx), %rax
	movq	8(%rbx), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	(%r15), %rax
	incq	%r9
	movq	%r9, 64(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC214(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
	xorl	%edx, %edx
.L1431:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	jmp	.L1562
.L1417:
	cmpq	16+keywordList(%rip), %rax
	jne	.L1433
	movq	72(%rsp), %rcx
	call	create_symbol_table
	movq	256(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, 56(%rsp)
	call	get_next_token
	movq	%rax, %r9
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L1434
	cmpl	$6, %eax
	jne	.L1435
	movq	(%r9), %rax
	cmpq	128+keywordList(%rip), %rax
	je	.L1434
	cmpq	136+keywordList(%rip), %rax
	je	.L1434
	cmpq	144+keywordList(%rip), %rax
	je	.L1434
	cmpq	152+keywordList(%rip), %rax
	je	.L1434
	cmpq	160+keywordList(%rip), %rax
	je	.L1434
.L1435:
	movq	16(%r9), %rax
	movq	8(%r9), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	(%r15), %rax
	incq	%r9
	movq	%r9, 64(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC215(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1555
.L1434:
	movq	(%r9), %rdx
	movq	72(%rsp), %rcx
	call	search_name
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L1437
	movq	16(%r9), %rax
	movq	8(%r9), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	(%r15), %rax
	incq	%r9
	movq	%r9, 64(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC216(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
.L1555:
	call	fprintf
	jmp	.L1436
.L1437:
	movq	256(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rbp
	je	.L1438
	movq	16(%rax), %rax
	movq	8(%rbp), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	(%r15), %rax
	incq	%r9
	movq	%r9, 64(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC217(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1555
.L1438:
	movl	$40, %ecx
	call	alloc_memory
	movq	0(%rbp), %rcx
	movq	%rdi, %r8
	movl	$1, %edx
	movq	%rax, %rsi
	movq	56(%rsp), %rax
	movq	%rsi, %r9
	movq	%rax, 32(%rsi)
	call	create_symbol
	movq	256(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, %r14
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1439
	movq	symbolList(%rip), %rdx
	cmpq	%rdx, (%rax)
	je	.L1440
.L1439:
	movq	16(%rax), %rdi
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%r15), %rax
	incq	%r9
	leaq	1(%rdi), %rsi
	movq	24(%rax), %r8
	movq	%r9, 64(%rsp)
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC218(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1555
.L1440:
	movq	256(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %r13
	call	create_list
	movq	__imp___acrt_iob_func(%rip), %r12
	movq	%rax, 64(%rsp)
.L1441:
	cmpl	$5, 24(%r13)
	je	.L1563
.L1448:
	movq	56(%rsp), %rdx
	movq	256(%rsp), %rcx
	movq	%r15, %r8
	call	parse_variable
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L1442
	movq	16(%r13), %rax
	movq	8(%r13), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rbp
	movq	(%r15), %rax
	incq	%r9
	movq	%r9, 88(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 80(%rsp)
	call	*%r12
	movq	%rbp, 32(%rsp)
	movq	88(%rsp), %r9
	leaq	.LC219(%rip), %rdx
	movq	80(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1554
.L1442:
	cmpq	$0, 16(%rax)
	je	.L1444
	movq	16(%r13), %rax
	movq	8(%r13), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rbp
	movq	(%r15), %rax
	incq	%r9
	movq	%r9, 88(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 80(%rsp)
	call	*%r12
	movq	%rbp, 32(%rsp)
	movq	88(%rsp), %r9
	leaq	.LC220(%rip), %rdx
	movq	80(%rsp), %r8
	movq	%rax, %rcx
.L1554:
	call	fprintf
	jmp	.L1443
.L1444:
	movq	64(%rsp), %rcx
	call	list_append
.L1443:
	movq	256(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	movq	%rax, %r13
	jne	.L1445
	movq	(%rax), %rax
	cmpq	32+symbolList(%rip), %rax
	jne	.L1446
	movq	256(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %r13
	jmp	.L1441
.L1446:
	cmpq	8+symbolList(%rip), %rax
	je	.L1441
.L1445:
	movq	16(%r13), %rax
	movq	8(%r13), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	(%r15), %rax
	incq	%r9
	movq	%r9, 64(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC221(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1555
.L1563:
	movq	8+symbolList(%rip), %rax
	cmpq	%rax, 0(%r13)
	jne	.L1448
	movq	256(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1449
	movq	16+symbolList(%rip), %rdx
	cmpq	%rdx, (%rax)
	je	.L1450
.L1449:
	movq	16(%rax), %rdi
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%r15), %rax
	incq	%r9
	leaq	1(%rdi), %rsi
	movq	24(%rax), %r8
	movq	%r9, 64(%rsp)
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC222(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1555
.L1450:
	call	create_list
	movb	$1, 8(%r15)
	movl	$1, %edx
	xorl	%r13d, %r13d
	movq	256(%rsp), %rcx
	movq	%rax, %rbp
	call	get_next_token
	movq	%rax, %r9
.L1451:
	cmpl	$5, 24(%r9)
	je	.L1564
.L1456:
	movq	56(%rsp), %rdx
	movq	256(%rsp), %rcx
	movq	%r15, %r8
	movq	%r9, 80(%rsp)
	call	parse_statement
	movq	80(%rsp), %r9
	testq	%rax, %rax
	movq	%rax, %r12
	jne	.L1452
	movq	16(%r9), %rax
	movq	8(%r9), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rdx
	movq	(%r15), %rax
	incq	%r9
	movq	%rdx, 104(%rsp)
	movq	24(%rax), %r8
	movq	%r9, 88(%rsp)
	movq	%r8, 80(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	104(%rsp), %rdx
	movq	88(%rsp), %r9
	movq	80(%rsp), %r8
	movq	%rax, %rcx
	movq	%rdx, 32(%rsp)
	leaq	.LC223(%rip), %rdx
	call	fprintf
	jmp	.L1455
.L1452:
	testb	%r13b, %r13b
	je	.L1454
	movq	16(%r9), %rax
	movq	8(%r9), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rdx
	movq	(%r15), %rax
	incq	%r9
	movq	%rdx, 104(%rsp)
	movq	24(%rax), %r8
	movq	%r9, 88(%rsp)
	movq	%r8, 80(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	104(%rsp), %rdx
	movq	88(%rsp), %r9
	movq	80(%rsp), %r8
	movq	%rax, %rcx
	movq	%rdx, 32(%rsp)
	leaq	.LC224(%rip), %rdx
	call	fprintf
.L1454:
	cmpl	$5, 8(%r12)
	movb	$1, %al
	cmove	%eax, %r13d
.L1455:
	movq	%r12, %rdx
	movq	%rbp, %rcx
	call	list_append
	movq	256(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %r9
	jmp	.L1451
.L1564:
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, (%r9)
	jne	.L1456
	movb	$0, 8(%r15)
	testb	%r13b, %r13b
	jne	.L1458
	cmpq	name_void(%rip), %rdi
	jne	.L1459
.L1460:
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	xorl	%r8d, %r8d
	movl	$5, %ecx
	movq	%r9, 40(%rsp)
	movq	%r9, 32(%rsp)
	xorl	%r9d, %r9d
	call	create_statement
	movq	%rbp, %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L1458
.L1459:
	movq	16(%r9), %rax
	movq	8(%r9), %r9
	movl	$2, %ecx
	leaq	1(%rax), %r12
	movq	(%r15), %rax
	incq	%r9
	movq	%r9, 88(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 80(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%r12, 32(%rsp)
	movq	88(%rsp), %r9
	leaq	.LC225(%rip), %rdx
	movq	80(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
	cmpq	name_void(%rip), %rdi
	je	.L1460
.L1458:
	testq	%r14, %r14
	jne	.L1462
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC226(%rip), %rcx
	movq	%rax, %rdx
	call	fputs
	jmp	.L1436
.L1462:
	movq	64(%rsp), %rax
	movq	%r14, (%rsi)
	movq	%rdi, 8(%rsi)
	movq	%rax, 16(%rsi)
	movq	56(%rsp), %rax
	movq	%rbp, 24(%rsi)
	movq	%rax, 32(%rsi)
	jmp	.L1463
.L1436:
	movq	16(%rbx), %rax
	movq	8(%rbx), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	(%r15), %rax
	incq	%r9
	movq	%r9, 64(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	xorl	%esi, %esi
	movq	64(%rsp), %r9
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	leaq	.LC227(%rip), %rdx
	call	fprintf
.L1463:
	xorl	%r9d, %r9d
	movq	%rsi, %r8
	xorl	%edx, %edx
	movl	$1, %ecx
.L1562:
	call	create_code_member
	movq	96(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L1432
.L1433:
	cmpq	24+keywordList(%rip), %rax
	jne	.L1416
	movq	72(%rsp), %rcx
	call	create_symbol_table
	movq	256(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, 56(%rsp)
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rsi
	je	.L1464
	movq	16(%rax), %rax
	movq	8(%rsi), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rdi
	movq	(%r15), %rax
	incq	%r9
	movq	%r9, 64(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC228(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1561
.L1464:
	movl	$32, %ecx
	call	alloc_memory
	movq	56(%rsp), %rdi
	movq	(%rsi), %rcx
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, %r9
	movq	%rax, 64(%rsp)
	movq	%rdi, 16(%rax)
	call	create_symbol
	movq	256(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, %r14
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1466
	movq	16+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	je	.L1467
.L1466:
	movq	16(%rax), %rdi
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%r15), %rax
	incq	%r9
	leaq	1(%rdi), %rsi
	movq	24(%rax), %r8
	movq	%r9, 64(%rsp)
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC229(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
.L1561:
	call	fprintf
	movq	16(%rbx), %rax
	movq	8(%rbx), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	(%r15), %rax
	incq	%r9
	movq	%r9, 64(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC248(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
	xorl	%eax, %eax
	movq	%rax, 64(%rsp)
	jmp	.L1525
.L1467:
	call	create_list
	movq	256(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, 80(%rsp)
	call	get_next_token
	xorl	%r8d, %r8d
	movq	%r8, 104(%rsp)
	movq	%rax, %rbx
.L1468:
	movl	24(%rbx), %eax
	cmpl	$5, %eax
	je	.L1565
	cmpl	$6, %eax
	jne	.L1469
	movq	(%rbx), %rax
	cmpq	32+keywordList(%rip), %rax
	jne	.L1470
	movq	56(%rsp), %rcx
	call	create_symbol_table
	movq	40+keywordList(%rip), %rcx
	movq	%r14, %r8
	movl	$3, %edx
	movq	%rax, %r9
	movq	%rax, 88(%rsp)
	call	create_symbol
	movq	256(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	get_next_token
	movq	%rax, %r9
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L1471
	cmpl	$6, %eax
	jne	.L1472
	movq	(%r9), %rax
	cmpq	128+keywordList(%rip), %rax
	je	.L1471
	cmpq	136+keywordList(%rip), %rax
	je	.L1471
	cmpq	144+keywordList(%rip), %rax
	je	.L1471
	cmpq	152+keywordList(%rip), %rax
	je	.L1471
	cmpq	160+keywordList(%rip), %rax
	je	.L1471
.L1472:
	movq	16(%r9), %rax
	movq	8(%r9), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	(%r15), %rax
	incq	%r9
	movq	%r9, 112(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 88(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	112(%rsp), %r9
	leaq	.LC230(%rip), %rdx
	movq	88(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1557
.L1471:
	movq	(%r9), %rdx
	movq	56(%rsp), %rcx
	call	search_name
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L1474
	movq	16(%r9), %rax
	movq	8(%r9), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	(%r15), %rax
	incq	%r9
	movq	%r9, 112(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 88(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	112(%rsp), %r9
	leaq	.LC231(%rip), %rdx
	movq	88(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1557
.L1474:
	movq	256(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$1, 24(%rax)
	movq	%rax, %rbp
	je	.L1475
	movq	16(%rax), %rax
	movq	8(%rbp), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	(%r15), %rax
	incq	%r9
	movq	%r9, 112(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 88(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	112(%rsp), %r9
	leaq	.LC232(%rip), %rdx
	movq	88(%rsp), %r8
	movq	%rax, %rcx
.L1557:
	call	fprintf
	jmp	.L1473
.L1475:
	movl	$40, %ecx
	call	alloc_memory
	movq	88(%rsp), %rdx
	movq	8(%r14), %rcx
	movq	%rax, 112(%rsp)
	movq	%rdx, 32(%rax)
	movq	0(%rbp), %rdx
	call	make_method_name
	movq	112(%rsp), %r9
	movq	%rsi, %r8
	movl	$2, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	256(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, 128(%rsp)
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1476
	movq	symbolList(%rip), %rdx
	cmpq	%rdx, (%rax)
	je	.L1477
.L1476:
	movq	16(%rax), %rdi
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%r15), %rax
	incq	%r9
	leaq	1(%rdi), %rsi
	movq	24(%rax), %r8
	movq	%r9, 112(%rsp)
	movq	%r8, 88(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	112(%rsp), %r9
	leaq	.LC233(%rip), %rdx
	movq	88(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1557
.L1477:
	movq	256(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$6, 24(%rax)
	jne	.L1478
	movq	40+keywordList(%rip), %rdx
	cmpq	%rdx, (%rax)
	je	.L1479
.L1478:
	movq	16(%rax), %rdx
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%r15), %rax
	leaq	1(%rdx), %rbp
	incq	%r9
	movq	24(%rax), %r8
	movq	%r9, 136(%rsp)
	movq	%r8, 120(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbp, 32(%rsp)
	movq	136(%rsp), %r9
	leaq	.LC234(%rip), %rdx
	movq	120(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
.L1479:
	movq	256(%rsp), %rcx
	movl	$1, %edx
	leaq	.LC237(%rip), %rbp
	call	get_next_token
	movq	%rax, %r12
	call	create_list
	movq	%rdi, %rdx
	xorl	%r8d, %r8d
	movq	%r14, %rcx
	movq	%rax, 120(%rsp)
	call	create_variable
	movq	120(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	__imp___acrt_iob_func(%rip), %rdi
.L1480:
	cmpl	$5, 24(%r12)
	je	.L1566
.L1481:
	movq	16(%r12), %rax
	movq	8(%r12), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	(%r15), %rax
	incq	%r9
	movq	%r9, 112(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 88(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	112(%rsp), %r9
	leaq	.LC235(%rip), %rdx
	movq	88(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1557
.L1566:
	movq	(%r12), %rax
	cmpq	8+symbolList(%rip), %rax
	je	.L1567
	cmpq	%rax, 32+symbolList(%rip)
	jne	.L1481
	movq	256(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	88(%rsp), %rdx
	movq	256(%rsp), %rcx
	movq	%r15, %r8
	movq	%rax, %r12
	call	parse_variable
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L1549
	movq	16(%r12), %rax
	movq	8(%r12), %r9
	movl	$2, %ecx
	leaq	1(%rax), %r13
	movq	(%r15), %rax
	incq	%r9
	movq	%r9, 144(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 136(%rsp)
	call	*%rdi
	movq	%r13, 32(%rsp)
	leaq	.LC236(%rip), %rdx
	movq	144(%rsp), %r9
	movq	136(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1556
.L1549:
	cmpq	$0, 16(%rax)
	je	.L1485
	movq	16(%r12), %rax
	movq	8(%r12), %r9
	movl	$2, %ecx
	leaq	1(%rax), %r13
	movq	(%r15), %rax
	incq	%r9
	movq	%r9, 144(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 136(%rsp)
	call	*%rdi
	movq	%r13, 32(%rsp)
	movq	144(%rsp), %r9
	movq	%rbp, %rdx
	movq	136(%rsp), %r8
	movq	%rax, %rcx
.L1556:
	call	fprintf
	jmp	.L1484
.L1485:
	movq	120(%rsp), %rcx
	call	list_append
.L1484:
	movq	256(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %r12
	jmp	.L1480
.L1567:
	movq	256(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1487
	movq	16+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	je	.L1488
.L1487:
	movq	16(%rax), %rdi
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%r15), %rax
	incq	%r9
	leaq	1(%rdi), %rsi
	movq	24(%rax), %r8
	movq	%r9, 112(%rsp)
	movq	%r8, 88(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	112(%rsp), %r9
	leaq	.LC238(%rip), %rdx
	movq	88(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1557
.L1488:
	call	create_list
	movw	$257, 8(%r15)
	movl	$1, %edx
	xorl	%r12d, %r12d
	movq	256(%rsp), %rcx
	movq	%rax, %rdi
	call	get_next_token
	movq	%rax, %r13
.L1489:
	cmpl	$5, 24(%r13)
	je	.L1568
.L1494:
	movq	88(%rsp), %rdx
	movq	256(%rsp), %rcx
	movq	%r15, %r8
	call	parse_statement
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L1490
	movq	16(%r13), %rax
	movq	8(%r13), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rdx
	movq	(%r15), %rax
	incq	%r9
	movq	%rdx, 152(%rsp)
	movq	24(%rax), %r8
	movq	%r9, 144(%rsp)
	movq	%r8, 136(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	152(%rsp), %rdx
	movq	144(%rsp), %r9
	movq	136(%rsp), %r8
	movq	%rax, %rcx
	movq	%rdx, 32(%rsp)
	leaq	.LC239(%rip), %rdx
	call	fprintf
	jmp	.L1493
.L1490:
	testb	%r12b, %r12b
	je	.L1492
	movq	16(%r13), %rax
	movq	8(%r13), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rdx
	movq	(%r15), %rax
	incq	%r9
	movq	%rdx, 152(%rsp)
	movq	24(%rax), %r8
	movq	%r9, 144(%rsp)
	movq	%r8, 136(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	152(%rsp), %rdx
	movq	144(%rsp), %r9
	movq	136(%rsp), %r8
	movq	%rax, %rcx
	movq	%rdx, 32(%rsp)
	leaq	.LC224(%rip), %rdx
	call	fprintf
.L1492:
	cmpl	$5, 8(%rbp)
	movb	$1, %al
	cmove	%eax, %r12d
.L1493:
	movq	%rbp, %rdx
	movq	%rdi, %rcx
	call	list_append
	movq	256(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %r13
	jmp	.L1489
.L1568:
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, 0(%r13)
	jne	.L1494
	movw	$0, 8(%r15)
	testb	%r12b, %r12b
	jne	.L1496
	cmpq	name_void(%rip), %rsi
	jne	.L1497
.L1498:
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rcx, 40(%rsp)
	movq	%rcx, 32(%rsp)
	movl	$5, %ecx
	call	create_statement
	movq	%rdi, %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L1496
.L1497:
	movq	16(%r13), %rax
	movq	8(%r13), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rbp
	movq	(%r15), %rax
	incq	%r9
	movq	%r9, 144(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 136(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbp, 32(%rsp)
	movq	144(%rsp), %r9
	leaq	.LC240(%rip), %rdx
	movq	136(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
	cmpq	name_void(%rip), %rsi
	je	.L1498
.L1496:
	movq	88(%rsp), %rax
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r8
	movq	128(%rsp), %rdx
	movq	120(%rsp), %r9
	movq	%rax, 40(%rsp)
	movq	112(%rsp), %rcx
	call	create_method_use_ptr
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L1500
.L1473:
	movq	16(%rbx), %rax
	movq	8(%rbx), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	(%r15), %rax
	incq	%r9
	movq	%r9, 112(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 88(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	112(%rsp), %r9
	leaq	.LC241(%rip), %rdx
	movq	88(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
	xorl	%edx, %edx
.L1500:
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	call	create_class_member
	movq	80(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L1512
.L1470:
	cmpq	168+keywordList(%rip), %rax
	jne	.L1469
	movq	256(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movb	$1, 10(%r15)
	movq	56(%rsp), %rdx
	movq	%r15, %r8
	movq	256(%rsp), %rcx
	movq	%rax, %rbx
	call	parse_variable
	movb	$0, 10(%r15)
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L1502
	movq	16(%rbx), %rax
	movl	$2, %ecx
	leaq	1(%rax), %rbp
	movq	8(%rbx), %rax
	leaq	1(%rax), %r9
	movq	(%r15), %rax
	movq	%r9, 88(%rsp)
	movq	24(%rax), %rsi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbp, 32(%rsp)
	movq	88(%rsp), %r9
	leaq	.LC242(%rip), %rdx
	movq	%rax, %rcx
	movq	%rsi, %r8
	call	fprintf
.L1502:
	xorl	%edx, %edx
	movq	%rdi, %r8
	movl	$1, %ecx
	call	create_class_member
	movq	80(%rsp), %rcx
	movq	%rax, %rsi
	movq	%rax, %rdx
	call	list_append
	cmpl	$1, 8(%rsi)
	jne	.L1506
	movq	(%rsi), %rax
	movq	(%rax), %rax
	cmpq	name_int(%rip), %rax
	je	.L1558
	cmpq	name_float(%rip), %rax
	je	.L1558
	cmpq	name_string(%rip), %rax
	je	.L1558
	cmpq	name_bool(%rip), %rax
	je	.L1507
	cmpq	name_void(%rip), %rax
	jne	.L1508
.L1507:
	incq	104(%rsp)
	jmp	.L1506
.L1508:
	cmpl	$0, 32(%rax)
	jne	.L1509
.L1558:
	addq	$8, 104(%rsp)
	jmp	.L1506
.L1509:
	movq	16(%rbx), %rax
	movq	8(%rbx), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	(%r15), %rax
	incq	%r9
	movq	%r9, 112(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 88(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	112(%rsp), %r9
	leaq	.LC243(%rip), %rdx
	movq	88(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
.L1506:
	movq	256(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1510
	movq	72+symbolList(%rip), %rbx
	cmpq	%rbx, (%rax)
	je	.L1512
.L1510:
	movq	16(%rax), %rbx
	movq	8(%rax), %r9
	movl	$2, %ecx
	movq	(%r15), %rax
	incq	%r9
	incq	%rbx
	movq	24(%rax), %r8
	movq	%r9, 112(%rsp)
	movq	%r8, 88(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, 32(%rsp)
	movq	112(%rsp), %r9
	leaq	.LC244(%rip), %rdx
	movq	88(%rsp), %r8
	movq	%rax, %rcx
	jmp	.L1559
.L1565:
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, (%rbx)
	je	.L1569
.L1469:
	movq	16(%rbx), %rax
	movq	8(%rbx), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	(%r15), %rax
	incq	%r9
	movq	%r9, 112(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 88(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	112(%rsp), %r9
	leaq	.LC245(%rip), %rdx
	movq	88(%rsp), %r8
	movq	%rax, %rcx
.L1559:
	call	fprintf
.L1512:
	movq	256(%rsp), %rcx
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rbx
	jmp	.L1468
.L1569:
	movq	8(%r14), %rcx
	movq	DEFAULT_INIT_NAME(%rip), %rdx
	call	make_method_name
	movq	56(%rsp), %rcx
	movq	%rax, %rdx
	movq	%rax, %rbp
	call	search_name_use_strcmp
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L1514
	movl	$40, %ecx
	call	alloc_memory
	movq	56(%rsp), %rcx
	movq	%rax, %rdi
	call	create_symbol_table
	movq	%rbp, %rcx
	movq	%rdi, %r9
	movq	%r14, %r8
	movq	%rax, 32(%rdi)
	movl	$2, %edx
	call	create_symbol
	movq	%rax, %rsi
	call	create_list
	movq	32(%rdi), %r9
	movq	%r14, %r8
	movq	40+keywordList(%rip), %rcx
	movl	$3, %edx
	movq	%rax, %rbp
	call	create_symbol
	xorl	%r8d, %r8d
	movq	%r14, %rcx
	movq	%rax, %rdx
	movq	%rax, %r13
	call	create_variable
	movq	%rbp, %rcx
	movq	%rax, %rdx
	call	list_append
	call	create_list
	xorl	%r9d, %r9d
	movq	%r13, %r8
	xorl	%edx, %edx
	movq	%rax, %r12
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	movq	%rax, 32(%rsp)
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
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rdx, 40(%rsp)
	movl	$5, %ecx
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	call	create_statement
	movq	%r12, %rcx
	movq	%rax, %rdx
	call	list_append
	movq	32(%rdi), %rax
	movq	%rbp, %r9
	movq	%r14, %r8
	movq	%r12, 32(%rsp)
	movq	%rsi, %rdx
	movq	%rdi, %rcx
	movq	%rax, 40(%rsp)
	call	create_method_use_ptr
	movq	%rdi, %rdx
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	call	create_class_member
	movq	80(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
.L1514:
	cmpl	$2, 32(%rsi)
	je	.L1515
	movq	16(%rbx), %rax
	movq	8(%rbx), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rdi
	movq	(%r15), %rax
	incq	%r9
	movq	%r9, 112(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 88(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rdi, 32(%rsp)
	movq	112(%rsp), %r9
	leaq	.LC246(%rip), %rdx
	movq	88(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
.L1515:
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	movq	8(%r14), %rcx
	call	make_method_name
	movl	$40, %ecx
	movq	%rax, %rdi
	call	alloc_memory
	movq	56(%rsp), %rcx
	movq	%rax, %rbx
	call	create_symbol_table
	movq	%rbx, %r9
	movq	%r14, %r8
	movl	$2, %edx
	movq	%rax, 32(%rbx)
	movq	%rdi, %rcx
	call	create_symbol
	movq	%rax, 112(%rsp)
	call	create_list
	movq	32(%rbx), %r9
	movq	%r14, %r8
	movq	40+keywordList(%rip), %rcx
	movl	$3, %edx
	movq	%rax, 88(%rsp)
	call	create_symbol
	movq	%rax, %r12
	movq	24(%rsi), %rax
	movq	16(%rax), %rcx
	call	list_copy
	movq	%rax, %rbp
.L1517:
	movq	%rbp, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L1570
	movq	8(%rax), %rdx
	movq	40+keywordList(%rip), %rdi
	cmpq	%rdi, 8(%rdx)
	je	.L1517
	movq	(%rax), %rcx
	xorl	%r8d, %r8d
	call	create_variable
	movq	88(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L1517
.L1570:
	call	create_list
	movq	80(%rsp), %rcx
	movq	%rax, %r13
	call	list_copy
	xorl	%r9d, %r9d
	movq	%r12, %r8
	xorl	%edx, %edx
	movq	%rax, 120(%rsp)
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	movq	%rax, 32(%rsp)
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
.L1560:
	call	create_expression
	xorl	%r11d, %r11d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%r11, 40(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, 32(%rsp)
	call	create_statement
	movq	%r13, %rcx
	movq	%rax, %rdx
	call	list_append
.L1520:
	movq	120(%rsp), %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L1571
	cmpl	$1, 8(%rdi)
	jne	.L1520
	movq	(%rdi), %rax
	xorl	%r9d, %r9d
	movq	%r12, %r8
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	8(%rax), %rbp
	xorl	%eax, %eax
	movq	%rax, 32(%rsp)
	call	create_variable_access
	movq	%rbp, %r8
	xorl	%r9d, %r9d
	movl	$2, %ecx
	movq	%rax, %rdx
	xorl	%eax, %eax
	movq	%rax, 32(%rsp)
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
	movq	%rax, %rbp
	movq	(%rdi), %rax
	movq	16(%rax), %r9
	testq	%r9, %r9
	jne	.L1521
	movl	$1, %r8d
	movl	$2, %edx
	leaq	.LC247(%rip), %rcx
	xorl	%edi, %edi
	call	create_string_check
	movq	%rdi, 32(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, %rdx
	xorl	%ecx, %ecx
	call	create_primary
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movl	$19, %ecx
	movq	%rax, %r8
	call	create_expression
	movq	%rax, %r9
.L1521:
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movl	$13, %ecx
	jmp	.L1560
.L1571:
	call	create_list
	xorl	%r10d, %r10d
	movq	%r12, %r8
	xorl	%r9d, %r9d
	movq	%r10, 32(%rsp)
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rax, %rbp
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
	movq	%rbp, %rcx
	movq	%rax, %rdx
	call	list_append
	movq	88(%rsp), %rcx
	call	list_copy
	movq	%rax, %r12
.L1523:
	movq	%r12, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L1572
	xorl	%r9d, %r9d
	movq	8(%rax), %r8
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%r9, 32(%rsp)
	xorl	%r9d, %r9d
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
	movq	%rbp, %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L1523
.L1572:
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	movq	%rsi, %r8
	xorl	%ecx, %ecx
	movq	%rdx, 32(%rsp)
	xorl	%edx, %edx
	call	create_variable_access
	movq	%rbp, 32(%rsp)
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
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rcx, 40(%rsp)
	xorl	%edx, %edx
	movl	$5, %ecx
	movq	%rax, 32(%rsp)
	call	create_statement
	movq	%r13, %rcx
	movq	%rax, %rdx
	call	list_append
	movq	32(%rbx), %rax
	movq	%rbx, %rcx
	movq	%r14, %r8
	movq	88(%rsp), %r9
	movq	112(%rsp), %rdx
	movq	%r13, 32(%rsp)
	movq	%rax, 40(%rsp)
	call	create_method_use_ptr
	movq	%rbx, %rdx
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	call	create_class_member
	movq	80(%rsp), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	64(%rsp), %rax
	movq	80(%rsp), %rbx
	movq	%rbx, 8(%rax)
	movq	56(%rsp), %rbx
	movq	%r14, (%rax)
	movq	%rbx, 16(%rax)
	movq	104(%rsp), %rbx
	movq	%rbx, 24(%rax)
.L1525:
	movq	64(%rsp), %r9
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$2, %ecx
	jmp	.L1562
.L1416:
	movq	16(%rbx), %rax
	movq	8(%rbx), %r9
	movl	$2, %ecx
	leaq	1(%rax), %rsi
	movq	(%r15), %rax
	incq	%r9
	movq	%r9, 64(%rsp)
	movq	24(%rax), %r8
	movq	%r8, 56(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, 32(%rsp)
	movq	64(%rsp), %r9
	leaq	.LC249(%rip), %rdx
	movq	56(%rsp), %r8
	movq	%rax, %rcx
	call	fprintf
	jmp	.L1432
.L1526:
	movl	$16, %ecx
	call	alloc_memory
	movq	96(%rsp), %rbx
	movq	%rbx, (%rax)
	movq	72(%rsp), %rbx
	movq	%rbx, 8(%rax)
	addq	$184, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC250:
	.ascii "NULL\0"
.LC251:
	.ascii "Usage: %s <filename>\12\0"
.LC252:
	.ascii "Error opening file: %s\12\0"
.LC253:
	.ascii ".token\0"
.LC254:
	.ascii "w\0"
.LC255:
	.ascii "Token(Type: EOF,         Line: %zu, Column: %zu)\12\0"
.LC256:
	.ascii "Token(Type: identifier,  Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC257:
	.ascii "Token(Type: integer,     Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC258:
	.ascii "Token(Type: float,       Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC259:
	.ascii "Token(Type: string,      Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC260:
	.ascii "Token(Type: symbol,      Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC261:
	.ascii "Token(Type: keyword,     Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC262:
	.ascii "Token(Type: comment,     Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC263:
	.ascii "\\0\0"
.LC264:
	.ascii "\\n\0"
.LC265:
	.ascii "\\t\0"
.LC266:
	.ascii "\\r\0"
.LC267:
	.ascii "'\12\0"
.LC268:
	.ascii "\12info by lib:\12    %s\12\0"
.LC269:
	.ascii ".ast\0"
.LC270:
	.ascii ".tc\0"
.LC271:
	.ascii ".tac\0"
.LC272:
	.ascii "import\12\0"
.LC273:
	.ascii "source: \"%s\"\12\0"
.LC274:
	.ascii "parameters\12\0"
.LC275:
	.ascii "parameters[%d]\12\0"
.LC276:
	.ascii "class\12\0"
.LC277:
	.ascii "members\12\0"
.LC278:
	.ascii "method\12\0"
.LC279:
	.ascii "variable\12\0"
.LC280:
	.ascii "unknown_ClassMemberType: %u\12\0"
.LC281:
	.ascii "unknown_CodeMemberType: %u\12\0"
.LC282:
	.ascii "main\0"
.LC283:
	.ascii "[Warning] Unsupported symbol kind for import: %d\12\0"
.LC284:
	.ascii "TAC {\12\0"
.LC285:
	.ascii "designs: []\12\0"
.LC286:
	.ascii "designs: [\12\0"
.LC287:
	.ascii "NULL \0"
.LC288:
	.ascii "%s \0"
.LC289:
	.ascii "%zu \0"
.LC290:
	.ascii "{}\12\0"
.LC291:
	.ascii "{\12\0"
.LC292:
	.ascii "NULL\11\0"
.LC293:
	.ascii "%s\11\0"
.LC294:
	.ascii "%s(%s) \0"
.LC295:
	.ascii "%zu\12\0"
.LC296:
	.ascii "}\12\0"
.LC297:
	.ascii "]\12\0"
.LC298:
	.ascii "entry_point: \"NULL\"\12\0"
.LC299:
	.ascii "entry_point: %s\12\0"
.LC300:
	.ascii "global: []\12\0"
.LC301:
	.ascii "global: [\12\0"
.LC302:
	.ascii "subroutines: []\12\0"
.LC303:
	.ascii "subroutines: [\12\0"
.LC304:
	.ascii "NULL {\12\0"
.LC305:
	.ascii "%s {\12\0"
.LC306:
	.ascii "return_type: \"NULL\"\12\0"
.LC307:
	.ascii "return_type: %s\12\0"
.LC308:
	.ascii "parameters: []\12\0"
.LC309:
	.ascii "parameters: [\12\0"
.LC310:
	.ascii "local: []\12\0"
.LC311:
	.ascii "local: [\12\0"
.LC312:
	.ascii "instructions: []\12\0"
.LC313:
	.ascii "instructions: [\12\0"
.LC314:
	.ascii "add\11\0"
.LC315:
	.ascii "sub\11\0"
.LC316:
	.ascii "mul\11\0"
.LC317:
	.ascii "div\11\0"
.LC318:
	.ascii "mod\11\0"
.LC319:
	.ascii "eq \11\0"
.LC320:
	.ascii "ne \11\0"
.LC321:
	.ascii "lt \11\0"
.LC322:
	.ascii "gt \11\0"
.LC323:
	.ascii "le \11\0"
.LC324:
	.ascii "ge \11\0"
.LC325:
	.ascii "and\11\0"
.LC326:
	.ascii "or \11\0"
.LC327:
	.ascii "not\11\0"
.LC328:
	.ascii "assign\11\0"
.LC329:
	.ascii "get_attr\11\0"
.LC330:
	.ascii "get_elem\11\0"
.LC331:
	.ascii "param\11\0"
.LC332:
	.ascii "alloc\11\0"
.LC333:
	.ascii "jmp_c\11\0"
.LC334:
	.ascii "jmp\11\0"
.LC335:
	.ascii "ret\11\0"
.LC336:
	.ascii "call\11\0"
.LC337:
	.ascii "load\11\0"
.LC338:
	.ascii "store\11\0"
.LC339:
	.ascii "INST_NONE\12\0"
.LC340:
	.ascii "unknown_InstructionType: %u\12\0"
	.section	.text.startup,"x"
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
main:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	movl	%ecx, %esi
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$120, %rsp
	call	__main
	decl	%esi
	jg	.L1574
	movq	(%rbx), %r8
	movl	$2, %ecx
	movq	%r8, 40(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	40(%rsp), %r8
	leaq	.LC251(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %eax
	jmp	.L1573
.L1574:
	call	init
	movq	8(%rbx), %rcx
	call	create_file
	xorl	%r10d, %r10d
	leaq	.LC206(%rip), %rdx
	movq	24(%rax), %rbp
	movq	%r10, 72(%rsp)
	movq	%rax, %rdi
	movq	%rbp, %rcx
	call	fopen
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L1576
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbp, %r8
	movq	%rax, %rcx
	jmp	.L1900
.L1576:
	leaq	72(%rsp), %rdx
	movq	%rax, %rcx
	call	read_source.constprop.0
	movq	%rbx, %rcx
	movq	%rax, %rsi
	call	fclose
	movq	72(%rsp), %rdx
	movq	%rbp, %r8
	movq	%rsi, %rcx
	call	create_lexer
	movl	$1, %r8d
	movl	$6, %edx
	leaq	.LC253(%rip), %rcx
	movq	%rax, %rsi
	call	create_string_check
	movq	%rdi, %rcx
	movq	%rax, 8(%rdi)
	call	rebuild_full_path
	movq	24(%rdi), %rbp
	leaq	.LC254(%rip), %rdx
	movq	%rbp, %rcx
	call	fopen
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L1578
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbp, %r8
	leaq	.LC252(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L1579
.L1578:
	xorl	%edx, %edx
	movq	%rsi, %rcx
	leaq	.LC264(%rip), %r14
	call	get_next_token
	movq	%rax, %rbp
.L1580:
	testq	%rbp, %rbp
	je	.L1601
	cmpl	$7, 24(%rbp)
	ja	.L1581
	movl	24(%rbp), %edx
	leaq	.L1583(%rip), %rax
	movslq	(%rax,%rdx,4), %rcx
	movq	16(%rbp), %rdx
	addq	%rax, %rcx
	movq	8(%rbp), %rax
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	jmp	*%rcx
	.section .rdata,"dr"
	.align 4
.L1583:
	.long	.L1590-.L1583
	.long	.L1589-.L1583
	.long	.L1588-.L1583
	.long	.L1587-.L1583
	.long	.L1586-.L1583
	.long	.L1585-.L1583
	.long	.L1584-.L1583
	.long	.L1582-.L1583
	.section	.text.startup,"x"
.L1590:
	leaq	.LC255(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L1591
.L1589:
	leaq	.LC256(%rip), %rdx
	jmp	.L1886
.L1588:
	leaq	.LC257(%rip), %rdx
	jmp	.L1886
.L1587:
	leaq	.LC258(%rip), %rdx
	jmp	.L1886
.L1586:
	leaq	.LC259(%rip), %rdx
	jmp	.L1886
.L1585:
	leaq	.LC260(%rip), %rdx
	jmp	.L1886
.L1584:
	leaq	.LC261(%rip), %rdx
	jmp	.L1886
.L1582:
	leaq	.LC262(%rip), %rdx
.L1886:
	movq	%rbx, %rcx
	call	fprintf
.L1581:
	xorl	%r12d, %r12d
	leaq	.LC263(%rip), %r15
.L1592:
	movq	0(%rbp), %r13
	movq	%r13, %rcx
	call	strlen
	cmpq	%rax, %r12
	jnb	.L1901
	movsbl	0(%r13,%r12), %ecx
	movq	%rbx, %rdx
	testb	%cl, %cl
	jne	.L1593
	movq	%r15, %rcx
	jmp	.L1887
.L1593:
	cmpb	$10, %cl
	jne	.L1595
	movq	%r14, %rcx
.L1887:
	call	fputs
	jmp	.L1594
.L1595:
	cmpb	$9, %cl
	jne	.L1596
	leaq	.LC265(%rip), %rcx
	jmp	.L1887
.L1596:
	cmpb	$13, %cl
	jne	.L1597
	leaq	.LC266(%rip), %rcx
	jmp	.L1887
.L1597:
	call	fputc
.L1594:
	incq	%r12
	jmp	.L1592
.L1901:
	movq	%rbx, %rdx
	leaq	.LC267(%rip), %rcx
	call	fputs
.L1591:
	cmpl	$0, 24(%rbp)
	jne	.L1599
.L1601:
	call	get_info
	movq	%rbx, %rcx
	leaq	.LC268(%rip), %rdx
	movq	%rax, %r8
	call	fprintf
	movq	%rbx, %rcx
	call	fclose
	jmp	.L1579
.L1599:
	xorl	%edx, %edx
	movq	%rsi, %rcx
	call	get_next_token
	movq	%rax, %rbp
	jmp	.L1580
.L1579:
	xorl	%r9d, %r9d
	movl	$16, %ecx
	movq	%r9, 16(%rsi)
	movq	%r9, 32(%rsi)
	movq	%r9, 40(%rsi)
	movq	%r9, 48(%rsi)
	movq	%r9, 56(%rsi)
	movq	%r9, 64(%rsi)
	movq	%r9, 72(%rsi)
	movq	%r9, 80(%rsi)
	call	alloc_memory
	movq	builtin_scope(%rip), %rdx
	movq	%rsi, %rcx
	movw	$0, 8(%rax)
	movq	%rax, %r8
	movb	$0, 11(%rax)
	movq	%rdi, (%rax)
	call	parse_code
	movl	$1, %r8d
	movl	$4, %edx
	leaq	.LC269(%rip), %rcx
	movq	%rax, %rbp
	call	create_string_check
	movq	%rdi, %rcx
	movq	%rax, 8(%rdi)
	call	rebuild_full_path
	movl	$1, %r8d
	movl	$3, %edx
	leaq	.LC270(%rip), %rcx
	movq	24(%rdi), %rsi
	call	create_string_check
	movq	%rdi, %rcx
	movq	%rax, 8(%rdi)
	call	rebuild_full_path
	leaq	.LC254(%rip), %rdx
	movq	%rsi, %rcx
	call	fopen
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L1882
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, %r8
	leaq	.LC252(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L1606:
	movl	$1, %r8d
	movl	$4, %edx
	leaq	.LC271(%rip), %rcx
	call	create_string_check
	movq	%rdi, %rcx
	movq	%rax, 8(%rdi)
	call	rebuild_full_path
	movl	$1, %r8d
	movl	$3, %edx
	leaq	.LC270(%rip), %rcx
	movq	24(%rdi), %rsi
	call	create_string_check
	movq	%rdi, %rcx
	movq	%rax, 8(%rdi)
	call	rebuild_full_path
	leaq	.LC254(%rip), %rdx
	movq	%rsi, %rcx
	call	fopen
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L1883
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, %r8
	movq	%rax, %rcx
	jmp	.L1900
.L1882:
	movq	0(%rbp), %rcx
	call	list_copy
	movq	%rax, 48(%rsp)
.L1607:
	movq	48(%rsp), %rcx
	call	list_pop
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L1902
	movl	8(%r12), %eax
	leaq	80(%rsp), %rsi
	movq	%rsi, 40(%rsp)
	cmpl	$1, %eax
	je	.L1608
	cmpl	$2, %eax
	je	.L1609
	testl	%eax, %eax
	jne	.L1610
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movl	$1, %edx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC272(%rip), %rcx
	call	fputs
	movq	40(%rsp), %r9
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	movq	(%r12), %r12
	movl	$2, %edx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC47(%rip), %rcx
	call	fputs
	movq	40(%rsp), %r9
	movq	(%r12), %rcx
	movq	%rbx, %rdx
	movl	$3, %r8d
	call	output_name
	movq	40(%rsp), %r9
	movl	$2, %edx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	8(%r12), %r8
	testq	%r8, %r8
	jne	.L1611
	leaq	.LC250(%rip), %r8
.L1611:
	leaq	.LC273(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L1607
.L1608:
	movq	40(%rsp), %r9
	xorl	%r8d, %r8d
	movl	$1, %edx
	movq	%rbx, %rcx
	orl	$-1, %r14d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC49(%rip), %rcx
	call	fputs
	movq	40(%rsp), %r9
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	movq	(%r12), %r12
	movl	$2, %edx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC47(%rip), %rcx
	call	fputs
	movq	(%r12), %rcx
	movq	40(%rsp), %r9
	movq	%rbx, %rdx
	movl	$3, %r8d
	call	output_name
	movq	40(%rsp), %r9
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	movl	$2, %edx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC12(%rip), %rcx
	call	fputs
	movq	8(%r12), %rcx
	movq	40(%rsp), %r9
	movq	%rbx, %rdx
	movl	$3, %r8d
	call	output_name
	movq	40(%rsp), %r9
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	movl	$2, %edx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC274(%rip), %rcx
	call	fputs
	movq	16(%r12), %rcx
	call	list_copy
	movq	24(%r12), %rcx
	movq	%rax, %r13
	call	list_copy
	movq	%rax, %r12
.L1613:
	movq	%r13, %rcx
	call	list_pop
	movq	40(%rsp), %r9
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L1903
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	movl	$3, %edx
	incl	%r14d
	call	indention
	movl	%r14d, %r8d
	movq	%rbx, %rcx
	leaq	.LC275(%rip), %rdx
	call	fprintf
	movq	40(%rsp), %r9
	movq	%rbx, %rdx
	movq	%r15, %rcx
	movl	$4, %r8d
	call	output_variable
	jmp	.L1613
.L1903:
	movl	$2, %edx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC81(%rip), %rcx
	call	fputs
.L1615:
	movq	%r12, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L1607
	movq	40(%rsp), %r9
	movl	$3, %r8d
	movq	%rbx, %rdx
	call	output_statement
	jmp	.L1615
.L1609:
	movq	40(%rsp), %r9
	xorl	%r8d, %r8d
	movl	$1, %edx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC276(%rip), %rcx
	call	fputs
	movq	40(%rsp), %r9
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	movq	(%r12), %r12
	movl	$2, %edx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC47(%rip), %rcx
	call	fputs
	movq	40(%rsp), %r9
	movq	(%r12), %rcx
	movq	%rbx, %rdx
	movl	$3, %r8d
	call	output_name
	movq	40(%rsp), %r9
	movl	$2, %edx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC277(%rip), %rcx
	call	fputs
	movq	8(%r12), %rcx
	call	list_copy
	movq	%rax, 56(%rsp)
.L1617:
	movq	56(%rsp), %rcx
	call	list_pop
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L1607
	movl	8(%r12), %eax
	testl	%eax, %eax
	je	.L1618
	decl	%eax
	jne	.L1904
	movq	40(%rsp), %r9
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	movl	$3, %edx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC279(%rip), %rcx
	call	fputs
	movq	40(%rsp), %r9
	movq	(%r12), %rcx
	movq	%rbx, %rdx
	movl	$4, %r8d
	call	output_variable
	jmp	.L1617
.L1618:
	movq	40(%rsp), %r9
	xorl	%r8d, %r8d
	movl	$3, %edx
	movq	%rbx, %rcx
	orl	$-1, %r15d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC278(%rip), %rcx
	call	fputs
	movq	40(%rsp), %r9
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	movq	(%r12), %r12
	movl	$4, %edx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC47(%rip), %rcx
	call	fputs
	movq	(%r12), %rcx
	movq	40(%rsp), %r9
	movq	%rbx, %rdx
	movl	$5, %r8d
	call	output_name
	movq	40(%rsp), %r9
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	movl	$4, %edx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC12(%rip), %rcx
	call	fputs
	movq	8(%r12), %rcx
	movq	40(%rsp), %r9
	movq	%rbx, %rdx
	movl	$5, %r8d
	call	output_name
	movq	40(%rsp), %r9
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	movl	$4, %edx
	call	indention
	movq	%rbx, %rdx
	leaq	.LC274(%rip), %rcx
	call	fputs
	movq	16(%r12), %rcx
	call	list_copy
	movq	24(%r12), %rcx
	leaq	80(%rsp), %r12
	movq	%rax, %r14
	call	list_copy
	movq	%rax, %r13
.L1621:
	movq	%r14, %rcx
	movq	%r12, %r9
	call	list_pop
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L1905
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	movl	$5, %edx
	incl	%r15d
	call	indention
	movl	%r15d, %r8d
	movq	%rbx, %rcx
	leaq	.LC275(%rip), %rdx
	call	fprintf
	movq	%r12, %r9
	movq	%rbx, %rdx
	movq	%rsi, %rcx
	movl	$6, %r8d
	call	output_variable
	jmp	.L1621
.L1905:
	movl	$4, %edx
	movq	%rbx, %rcx
	movl	$1, %r8d
	call	indention
	movq	%rbx, %rdx
	leaq	.LC81(%rip), %rcx
	call	fputs
.L1623:
	movq	%r13, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L1617
	movq	%r12, %r9
	movl	$5, %r8d
	movq	%rbx, %rdx
	call	output_statement
	jmp	.L1623
.L1904:
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	leaq	80(%rsp), %r9
	movl	$3, %edx
	call	indention
	movl	8(%r12), %r8d
	leaq	.LC280(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L1617
.L1610:
	movq	40(%rsp), %r9
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	movl	$1, %edx
	call	indention
	movl	8(%r12), %r8d
	leaq	.LC281(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L1607
.L1902:
	call	get_info
	movq	%rbx, %rcx
	leaq	.LC268(%rip), %rdx
	movq	%rax, %r8
	call	fprintf
	movq	%rbx, %rcx
	call	fclose
	jmp	.L1606
.L1900:
	leaq	.LC252(%rip), %rdx
	call	fprintf
	jmp	.L1577
.L1883:
	movl	$32, %ecx
	leaq	.LC282(%rip), %r15
	call	alloc_memory
	movq	%rax, %rdi
	call	create_list
	xorl	%edx, %edx
	movq	%rdx, 8(%rdi)
	movq	%rax, (%rdi)
	call	create_list
	movq	%rax, 16(%rdi)
	call	create_list
	movl	$96, %ecx
	movq	%rax, 24(%rdi)
	call	alloc_memory
	xorl	%ecx, %ecx
	movq	%rcx, 8(%rax)
	movq	%rax, %rsi
	movq	%rcx, 16(%rax)
	movq	%rdi, (%rax)
	call	create_list
	movq	%rax, 32(%rsi)
	call	create_list
	xorl	%r8d, %r8d
	movq	0(%rbp), %rcx
	movq	%rax, 40(%rsi)
	movq	%r8, 48(%rsi)
	movq	%r8, 56(%rsi)
	movq	%r8, 64(%rsi)
	movq	%r8, 72(%rsi)
	movq	%r8, 80(%rsi)
	movq	%r8, 88(%rsi)
	call	list_copy
	movq	%rax, 40(%rsp)
.L1630:
	movq	40(%rsp), %rcx
	call	list_pop
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L1906
	movl	8(%rbp), %eax
	cmpl	$1, %eax
	jne	.L1631
	movq	0(%rbp), %r13
	movq	8(%r13), %rdx
	movq	0(%r13), %rcx
	call	create_subroutine
	movq	%rax, 8(%rsi)
	movq	%rax, %r12
	movq	(%rsi), %rax
	movq	%r12, %rdx
	movq	24(%rax), %rcx
	call	list_append
	movq	16(%r13), %rcx
	call	list_copy
	movq	%rax, %r14
.L1632:
	movq	%r14, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L1907
	movq	8(%rax), %rcx
	movq	(%rax), %rdx
	movq	%rsi, %r9
	movl	$112, %r8d
	call	create_var
	movq	16(%r12), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L1632
.L1907:
	movq	%rsi, %r9
	movl	$98, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	create_var
	movq	%rax, %rcx
	call	create_block
	movq	32(%r12), %rcx
	movq	%rax, %r14
	movq	%rax, %rdx
	call	list_append
	movq	%r14, 16(%rsi)
	movq	24(%r13), %rcx
	call	list_copy
	movq	%rax, %r12
.L1634:
	movq	%r12, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L1908
	movq	%rsi, %rdx
	call	tac_statement
	jmp	.L1634
.L1908:
	xorl	%eax, %eax
	movq	%r15, %rdx
	movq	%rax, 8(%rsi)
	movq	0(%rbp), %rax
	movq	(%rax), %rbp
	movq	8(%rbp), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L1630
	movq	%rbp, 8(%rdi)
	jmp	.L1630
.L1631:
	cmpl	$2, %eax
	jne	.L1638
	movq	0(%rbp), %rcx
	movq	%rsi, %rdx
	jmp	.L1888
.L1638:
	testl	%eax, %eax
	jne	.L1630
	movq	0(%rbp), %rax
	movq	(%rax), %rcx
	movl	32(%rcx), %r8d
	cmpl	$3, %r8d
	jne	.L1640
	movq	%rsi, %r9
	movl	$118, %r8d
	jmp	.L1889
.L1640:
	leal	-1(%r8), %eax
	cmpl	$1, %eax
	ja	.L1641
	movq	%rsi, %r9
	movl	$102, %r8d
.L1889:
	movq	(%rcx), %rdx
	call	create_var
	movq	16(%rdi), %rcx
	movq	%rax, %rdx
	call	list_append
	jmp	.L1630
.L1641:
	testl	%r8d, %r8d
	jne	.L1642
	movq	24(%rcx), %rcx
	movq	%rsi, %rdx
.L1888:
	call	tac_class
	jmp	.L1630
.L1642:
	movl	%r8d, 48(%rsp)
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	48(%rsp), %r8d
	leaq	.LC283(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L1630
.L1906:
	movq	%rbx, %rdx
	leaq	.LC284(%rip), %rcx
	movl	$4, %esi
	call	fputs
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L1646
	cmpq	$0, (%rax)
	je	.L1646
	cmpq	$0, 8(%rax)
	jne	.L1645
.L1646:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rsi
	jne	.L1646
	movq	%rbx, %rdx
	leaq	.LC285(%rip), %rcx
	jmp	.L1891
.L1645:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rsi
	jne	.L1645
	movq	%rbx, %rdx
	leaq	.LC286(%rip), %rcx
	leaq	.LC288(%rip), %r12
	call	fputs
	leaq	.LC293(%rip), %r13
.L1648:
	movq	(%rdi), %rcx
	call	list_pop
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L1909
	cmpq	$0, 8(%rsi)
	movl	$8, %ebp
	jne	.L1649
.L1650:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rbp
	jne	.L1650
	movq	%rbx, %rdx
	leaq	.LC287(%rip), %rcx
	call	fputs
	jmp	.L1651
.L1649:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rbp
	jne	.L1649
	movq	8(%rsi), %rax
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movq	8(%rax), %r8
	call	fprintf
.L1651:
	movq	16(%rsi), %r8
	leaq	.LC289(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	movq	(%rsi), %rax
	testq	%rax, %rax
	je	.L1652
	cmpq	$0, (%rax)
	je	.L1652
	cmpq	$0, 8(%rax)
	jne	.L1653
.L1652:
	movq	%rbx, %rdx
	leaq	.LC290(%rip), %rcx
	jmp	.L1890
.L1653:
	movq	%rbx, %rdx
	leaq	.LC291(%rip), %rcx
	leaq	.LC292(%rip), %r14
	call	fputs
.L1655:
	movq	(%rsi), %rcx
	call	list_pop
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L1910
	cmpq	$0, 8(%rbp)
	movl	$12, %r15d
	jne	.L1656
.L1657:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r15
	jne	.L1657
	movq	%rbx, %rdx
	movq	%r14, %rcx
	call	fputs
	jmp	.L1658
.L1656:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r15
	jne	.L1656
	movq	8(%rbp), %rax
	movq	%r13, %rdx
	movq	%rbx, %rcx
	movq	8(%rax), %r8
	call	fprintf
.L1658:
	movq	0(%rbp), %rax
	testq	%rax, %rax
	jne	.L1659
	movq	%rbx, %rdx
	leaq	.LC287(%rip), %rcx
	call	fputs
	jmp	.L1660
.L1659:
	movq	(%rax), %rdx
	movq	8(%rax), %r8
	testq	%rdx, %rdx
	je	.L1661
	movq	8(%rdx), %r9
	movq	%rbx, %rcx
	leaq	.LC294(%rip), %rdx
	call	fprintf
	jmp	.L1660
.L1661:
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	fprintf
.L1660:
	movq	16(%rbp), %r8
	leaq	.LC295(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L1655
.L1910:
	movl	$8, %esi
.L1663:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rsi
	jne	.L1663
	movq	%rbx, %rdx
	leaq	.LC296(%rip), %rcx
.L1890:
	call	fputs
	jmp	.L1648
.L1909:
	movl	$4, %esi
.L1665:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rsi
	jne	.L1665
	movq	%rbx, %rdx
	leaq	.LC297(%rip), %rcx
.L1891:
	call	fputs
	cmpq	$0, 8(%rdi)
	movl	$4, %esi
	jne	.L1666
.L1667:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rsi
	jne	.L1667
	movq	%rbx, %rdx
	leaq	.LC298(%rip), %rcx
	call	fputs
	jmp	.L1668
.L1666:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rsi
	jne	.L1666
	movq	8(%rdi), %rax
	leaq	.LC299(%rip), %rdx
	movq	%rbx, %rcx
	movq	8(%rax), %r8
	call	fprintf
.L1668:
	movq	16(%rdi), %rax
	movl	$4, %esi
	testq	%rax, %rax
	je	.L1671
	cmpq	$0, (%rax)
	je	.L1671
	cmpq	$0, 8(%rax)
	jne	.L1670
.L1671:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rsi
	jne	.L1671
	movq	%rbx, %rdx
	leaq	.LC300(%rip), %rcx
	jmp	.L1892
.L1670:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rsi
	jne	.L1670
	movq	%rbx, %rdx
	leaq	.LC301(%rip), %rcx
	call	fputs
.L1673:
	movq	16(%rdi), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L1911
	movl	$2, %r8d
	movq	%rbx, %rdx
	call	output_var
	jmp	.L1673
.L1911:
	movl	$4, %esi
.L1675:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rsi
	jne	.L1675
	movq	%rbx, %rdx
	leaq	.LC297(%rip), %rcx
.L1892:
	call	fputs
	movq	24(%rdi), %rax
	movl	$4, %esi
	testq	%rax, %rax
	je	.L1678
	cmpq	$0, (%rax)
	je	.L1678
	cmpq	$0, 8(%rax)
	jne	.L1677
.L1678:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rsi
	jne	.L1678
	movq	%rbx, %rdx
	leaq	.LC302(%rip), %rcx
.L1893:
	call	fputs
	movq	%rbx, %rdx
	leaq	.LC296(%rip), %rcx
	call	fputs
	call	get_info
	movq	%rbx, %rcx
	leaq	.LC268(%rip), %rdx
	movq	%rax, %r8
	call	fprintf
	movq	%rbx, %rcx
	call	fclose
	jmp	.L1577
.L1677:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rsi
	jne	.L1677
	movq	%rbx, %rdx
	leaq	.LC303(%rip), %rcx
	leaq	.L1714(%rip), %r13
	call	fputs
.L1679:
	movq	24(%rdi), %rcx
	call	list_pop
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L1912
	cmpq	$0, (%rsi)
	movl	$8, %ebp
	jne	.L1680
.L1681:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rbp
	jne	.L1681
	movq	%rbx, %rdx
	leaq	.LC304(%rip), %rcx
	call	fputs
	jmp	.L1682
.L1680:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rbp
	jne	.L1680
	movq	(%rsi), %rax
	leaq	.LC305(%rip), %rdx
	movq	%rbx, %rcx
	movq	8(%rax), %r8
	call	fprintf
.L1682:
	cmpq	$0, 8(%rsi)
	movl	$12, %ebp
	jne	.L1683
.L1684:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rbp
	jne	.L1684
	movq	%rbx, %rdx
	leaq	.LC306(%rip), %rcx
	call	fputs
	jmp	.L1685
.L1683:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rbp
	jne	.L1683
	movq	8(%rsi), %rax
	leaq	.LC307(%rip), %rdx
	movq	%rbx, %rcx
	movq	8(%rax), %r8
	call	fprintf
.L1685:
	movq	16(%rsi), %rax
	movl	$12, %ebp
	testq	%rax, %rax
	je	.L1688
	cmpq	$0, (%rax)
	je	.L1688
	cmpq	$0, 8(%rax)
	jne	.L1687
.L1688:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rbp
	jne	.L1688
	movq	%rbx, %rdx
	leaq	.LC308(%rip), %rcx
	jmp	.L1894
.L1687:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rbp
	jne	.L1687
	movq	%rbx, %rdx
	leaq	.LC309(%rip), %rcx
	call	fputs
.L1690:
	movq	16(%rsi), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L1913
	movl	$4, %r8d
	movq	%rbx, %rdx
	call	output_var
	jmp	.L1690
.L1913:
	movl	$12, %ebp
.L1692:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rbp
	jne	.L1692
	movq	%rbx, %rdx
	leaq	.LC297(%rip), %rcx
.L1894:
	call	fputs
	movq	24(%rsi), %rax
	movl	$12, %ebp
	testq	%rax, %rax
	je	.L1695
	cmpq	$0, (%rax)
	je	.L1695
	cmpq	$0, 8(%rax)
	jne	.L1694
.L1695:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rbp
	jne	.L1695
	movq	%rbx, %rdx
	leaq	.LC310(%rip), %rcx
	jmp	.L1895
.L1694:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rbp
	jne	.L1694
	movq	%rbx, %rdx
	leaq	.LC311(%rip), %rcx
	call	fputs
.L1697:
	movq	24(%rsi), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L1914
	movl	$4, %r8d
	movq	%rbx, %rdx
	call	output_var
	jmp	.L1697
.L1914:
	movl	$12, %ebp
.L1699:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rbp
	jne	.L1699
	movq	%rbx, %rdx
	leaq	.LC297(%rip), %rcx
.L1895:
	call	fputs
	movq	32(%rsi), %rax
	testq	%rax, %rax
	je	.L1774
	cmpq	$0, (%rax)
	je	.L1774
	cmpq	$0, 8(%rax)
	movl	$12, %ebp
	jne	.L1701
.L1774:
	movl	$12, %esi
.L1702:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rsi
	jne	.L1702
	movq	%rbx, %rdx
	leaq	.LC312(%rip), %rcx
	jmp	.L1899
.L1701:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rbp
	jne	.L1701
	movq	%rbx, %rdx
	leaq	.LC313(%rip), %rcx
.L1898:
	call	fputs
	movq	32(%rsi), %rcx
	call	list_pop
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L1915
	cmpq	$0, (%r12)
	movl	$16, %ebp
	jne	.L1705
.L1706:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rbp
	jne	.L1706
	movq	%rbx, %rdx
	leaq	.LC287(%rip), %rcx
	call	fputs
	jmp	.L1707
.L1705:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rbp
	jne	.L1705
	movq	(%r12), %rax
	leaq	.LC288(%rip), %rdx
	movq	%rbx, %rcx
	movq	8(%rax), %r8
	call	fprintf
.L1707:
	movq	8(%r12), %rax
	testq	%rax, %rax
	je	.L1708
	cmpq	$0, (%rax)
	je	.L1708
	cmpq	$0, 8(%rax)
	jne	.L1709
.L1708:
	movq	%rbx, %rdx
	leaq	.LC290(%rip), %rcx
	jmp	.L1898
.L1709:
	movq	%rbx, %rdx
	leaq	.LC291(%rip), %rcx
	movl	$1, %r15d
	call	fputs
.L1711:
	movq	8(%r12), %rcx
	call	list_pop
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L1916
	cmpl	$25, 24(%rbp)
	ja	.L1777
	movl	24(%rbp), %eax
	movslq	0(%r13,%rax,4), %rax
	addq	%r13, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L1714:
	.long	.L1778-.L1714
	.long	.L1779-.L1714
	.long	.L1780-.L1714
	.long	.L1781-.L1714
	.long	.L1782-.L1714
	.long	.L1783-.L1714
	.long	.L1784-.L1714
	.long	.L1785-.L1714
	.long	.L1786-.L1714
	.long	.L1787-.L1714
	.long	.L1788-.L1714
	.long	.L1789-.L1714
	.long	.L1790-.L1714
	.long	.L1791-.L1714
	.long	.L1792-.L1714
	.long	.L1793-.L1714
	.long	.L1794-.L1714
	.long	.L1795-.L1714
	.long	.L1796-.L1714
	.long	.L1797-.L1714
	.long	.L1798-.L1714
	.long	.L1799-.L1714
	.long	.L1800-.L1714
	.long	.L1801-.L1714
	.long	.L1802-.L1714
	.long	.L1803-.L1714
	.section	.text.startup,"x"
.L1778:
	movl	$20, %r14d
.L1739:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1739
	movq	%rbx, %rdx
	leaq	.LC314(%rip), %rcx
	jmp	.L1896
.L1779:
	movl	$20, %r14d
.L1738:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1738
	movq	%rbx, %rdx
	leaq	.LC315(%rip), %rcx
	jmp	.L1896
.L1780:
	movl	$20, %r14d
.L1737:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1737
	movq	%rbx, %rdx
	leaq	.LC316(%rip), %rcx
	jmp	.L1896
.L1781:
	movl	$20, %r14d
.L1736:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1736
	movq	%rbx, %rdx
	leaq	.LC317(%rip), %rcx
	jmp	.L1896
.L1782:
	movl	$20, %r14d
.L1735:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1735
	movq	%rbx, %rdx
	leaq	.LC318(%rip), %rcx
	jmp	.L1896
.L1783:
	movl	$20, %r14d
.L1734:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1734
	movq	%rbx, %rdx
	leaq	.LC319(%rip), %rcx
	jmp	.L1896
.L1784:
	movl	$20, %r14d
.L1733:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1733
	movq	%rbx, %rdx
	leaq	.LC320(%rip), %rcx
	jmp	.L1896
.L1785:
	movl	$20, %r14d
.L1732:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1732
	movq	%rbx, %rdx
	leaq	.LC321(%rip), %rcx
	jmp	.L1896
.L1786:
	movl	$20, %r14d
.L1731:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1731
	movq	%rbx, %rdx
	leaq	.LC322(%rip), %rcx
	jmp	.L1896
.L1787:
	movl	$20, %r14d
.L1730:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1730
	movq	%rbx, %rdx
	leaq	.LC323(%rip), %rcx
	jmp	.L1896
.L1788:
	movl	$20, %r14d
.L1729:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1729
	movq	%rbx, %rdx
	leaq	.LC324(%rip), %rcx
	jmp	.L1896
.L1789:
	movl	$20, %r14d
.L1728:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1728
	movq	%rbx, %rdx
	leaq	.LC325(%rip), %rcx
	jmp	.L1896
.L1790:
	movl	$20, %r14d
.L1727:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1727
	movq	%rbx, %rdx
	leaq	.LC326(%rip), %rcx
	jmp	.L1896
.L1791:
	movl	$20, %r14d
.L1726:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1726
	movq	%rbx, %rdx
	leaq	.LC327(%rip), %rcx
	jmp	.L1896
.L1792:
	movl	$20, %r14d
.L1725:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1725
	movq	%rbx, %rdx
	leaq	.LC328(%rip), %rcx
	jmp	.L1896
.L1793:
	movl	$20, %r14d
.L1724:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1724
	movq	%rbx, %rdx
	leaq	.LC329(%rip), %rcx
	jmp	.L1896
.L1794:
	movl	$20, %r14d
.L1723:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1723
	movq	%rbx, %rdx
	leaq	.LC330(%rip), %rcx
	jmp	.L1896
.L1795:
	movl	$20, %r14d
.L1722:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1722
	movq	%rbx, %rdx
	leaq	.LC331(%rip), %rcx
	jmp	.L1896
.L1796:
	movl	$20, %r14d
.L1721:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1721
	movq	%rbx, %rdx
	leaq	.LC332(%rip), %rcx
	jmp	.L1896
.L1797:
	movl	$20, %r14d
.L1720:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1720
	movq	%rbx, %rdx
	leaq	.LC333(%rip), %rcx
	jmp	.L1896
.L1798:
	movl	$20, %r14d
.L1719:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1719
	movq	%rbx, %rdx
	leaq	.LC334(%rip), %rcx
	jmp	.L1896
.L1799:
	movl	$20, %r14d
.L1718:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1718
	movq	%rbx, %rdx
	leaq	.LC335(%rip), %rcx
	jmp	.L1896
.L1800:
	movl	$20, %r14d
.L1717:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1717
	movq	%rbx, %rdx
	leaq	.LC336(%rip), %rcx
	jmp	.L1896
.L1801:
	movl	$20, %r14d
.L1716:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1716
	movq	%rbx, %rdx
	leaq	.LC337(%rip), %rcx
	jmp	.L1896
.L1802:
	movl	$20, %r14d
.L1715:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1715
	movq	%rbx, %rdx
	leaq	.LC338(%rip), %rcx
.L1896:
	call	fputs
	movq	0(%rbp), %rcx
	movq	%rbx, %rdx
	call	output_arg
	movl	24(%rbp), %ecx
	cmpl	$24, %ecx
	jbe	.L1917
	jmp	.L1711
.L1803:
	movl	$20, %ebp
.L1713:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rbp
	jne	.L1713
	movq	%rbx, %rdx
	leaq	.LC339(%rip), %rcx
	call	fputs
	jmp	.L1711
.L1777:
	movl	$20, %r14d
.L1712:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%r14
	jne	.L1712
	movl	24(%rbp), %r8d
	leaq	.LC340(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L1711
.L1917:
	movq	%r15, %rax
	salq	%cl, %rax
	testl	$4825087, %eax
	jne	.L1742
	testl	$25583616, %eax
	jne	.L1743
	testl	$3145728, %eax
	jne	.L1744
	jmp	.L1711
.L1742:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	fputc
	movq	8(%rbp), %rcx
	movq	%rbx, %rdx
	call	output_arg
	movl	$32, %ecx
	movq	%rbx, %rdx
	call	fputc
	movq	16(%rbp), %rcx
	jmp	.L1897
.L1743:
	movl	$32, %ecx
	movq	%rbx, %rdx
	call	fputc
	movq	8(%rbp), %rcx
.L1897:
	movq	%rbx, %rdx
	call	output_arg
.L1744:
	movq	%rbx, %rdx
	movl	$10, %ecx
	call	fputc
	jmp	.L1711
.L1916:
	movl	$16, %ebp
.L1746:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rbp
	jne	.L1746
	movq	%rbx, %rdx
	leaq	.LC296(%rip), %rcx
	jmp	.L1898
.L1915:
	movl	$12, %esi
.L1748:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rsi
	jne	.L1748
	movq	%rbx, %rdx
	leaq	.LC297(%rip), %rcx
.L1899:
	call	fputs
	movl	$8, %esi
.L1749:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rsi
	jne	.L1749
	movq	%rbx, %rdx
	leaq	.LC296(%rip), %rcx
	call	fputs
	jmp	.L1679
.L1912:
	movl	$4, %esi
.L1751:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	decq	%rsi
	jne	.L1751
	movq	%rbx, %rdx
	leaq	.LC297(%rip), %rcx
	jmp	.L1893
.L1577:
	xorl	%eax, %eax
.L1573:
	addq	$120, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.section .rdata,"dr"
	.align 16
CSWTCH.123:
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	14
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.align 16
CSWTCH.116:
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	5
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	2
	.byte	2
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
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
.LC341:
	.ascii "(\0"
.LC342:
	.ascii ")\0"
.LC343:
	.ascii "{\0"
.LC344:
	.ascii "}\0"
.LC345:
	.ascii ",\0"
.LC346:
	.ascii "!\0"
.LC347:
	.ascii "[\0"
.LC348:
	.ascii "]\0"
.LC349:
	.ascii ";\0"
.LC350:
	.ascii "_\0"
.LC351:
	.ascii "+\0"
.LC352:
	.ascii "-\0"
.LC353:
	.ascii "*\0"
.LC354:
	.ascii "%\0"
.LC355:
	.ascii "<\0"
.LC356:
	.ascii ">\0"
.LC357:
	.ascii "=\0"
.LC358:
	.ascii "==\0"
.LC359:
	.ascii "!=\0"
.LC360:
	.ascii "<=\0"
.LC361:
	.ascii ">=\0"
.LC362:
	.ascii "+=\0"
.LC363:
	.ascii "-=\0"
.LC364:
	.ascii "*=\0"
.LC365:
	.ascii "/=\0"
.LC366:
	.ascii "%=\0"
.LC367:
	.ascii "&&\0"
.LC368:
	.ascii "||\0"
	.align 32
symbolStrings:
	.quad	.LC341
	.quad	.LC342
	.quad	.LC343
	.quad	.LC344
	.quad	.LC345
	.quad	.LC346
	.quad	.LC134
	.quad	.LC347
	.quad	.LC348
	.quad	.LC349
	.quad	.LC350
	.quad	.LC351
	.quad	.LC352
	.quad	.LC353
	.quad	.LC43
	.quad	.LC354
	.quad	.LC355
	.quad	.LC356
	.quad	.LC357
	.quad	.LC358
	.quad	.LC359
	.quad	.LC360
	.quad	.LC361
	.quad	.LC362
	.quad	.LC363
	.quad	.LC364
	.quad	.LC365
	.quad	.LC366
	.quad	.LC367
	.quad	.LC368
.LC369:
	.ascii "import\0"
.LC370:
	.ascii "from\0"
.LC371:
	.ascii "func\0"
.LC372:
	.ascii "class\0"
.LC373:
	.ascii "method\0"
.LC374:
	.ascii "self\0"
.LC375:
	.ascii "if\0"
.LC376:
	.ascii "elif\0"
.LC377:
	.ascii "else\0"
.LC378:
	.ascii "while\0"
.LC379:
	.ascii "for\0"
.LC380:
	.ascii "return\0"
.LC381:
	.ascii "break\0"
.LC382:
	.ascii "continue\0"
.LC383:
	.ascii "int\0"
.LC384:
	.ascii "float\0"
.LC385:
	.ascii "string\0"
.LC386:
	.ascii "bool\0"
.LC387:
	.ascii "var\0"
	.align 32
keywordStrings:
	.quad	.LC369
	.quad	.LC370
	.quad	.LC371
	.quad	.LC372
	.quad	.LC373
	.quad	.LC374
	.quad	.LC375
	.quad	.LC376
	.quad	.LC377
	.quad	.LC378
	.quad	.LC379
	.quad	.LC18
	.quad	.LC19
	.quad	.LC380
	.quad	.LC381
	.quad	.LC382
	.quad	.LC383
	.quad	.LC384
	.quad	.LC385
	.quad	.LC386
	.quad	.LC25
	.quad	.LC387
.lcomm initialized,1,1
	.align 8
.LC129:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Rev6, Built by MSYS2 project) 13.2.0"
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	putc;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	strncmp;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	getcwd;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	strcat;	.scl	2;	.type	32;	.endef
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	ftell;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	strtoll;	.scl	2;	.type	32;	.endef
	.def	strtod;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
