	.file	"all.c"
	.text
	.def	list_pop;	.scl	3;	.type	32;	.endef
list_pop:
	testq	%rcx, %rcx
	je	.L4
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L1
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	testq	%rdx, %rdx
	je	.L5
.L3:
	movq	8(%rax), %rax
	ret
.L5:
	movq	$0, 8(%rcx)
	jmp	.L3
.L4:
	movq	%rcx, %rax
.L1:
	ret
	.def	list_pop_back;	.scl	3;	.type	32;	.endef
list_pop_back:
	testq	%rcx, %rcx
	je	.L9
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L6
	movq	8(%rcx), %rdx
	cmpq	%rdx, %rax
	je	.L12
.L8:
	movq	%rax, %r8
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L8
	movq	8(%rdx), %rax
	movq	$0, (%r8)
	movq	%r8, 8(%rcx)
	ret
.L12:
	movq	8(%rax), %rax
	movq	$0, (%rcx)
	movq	$0, 8(%rcx)
	ret
.L9:
	movq	%rcx, %rax
.L6:
	ret
	.def	search_name;	.scl	3;	.type	32;	.endef
search_name:
	testq	%rcx, %rcx
	je	.L18
.L17:
	movq	8(%rcx), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L15
.L16:
	movq	8(%rax), %r8
	cmpq	%rdx, 8(%r8)
	je	.L13
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L16
.L15:
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	jne	.L17
	movq	%rcx, %r8
	jmp	.L13
.L18:
	movq	%rcx, %r8
.L13:
	movq	%r8, %rax
	ret
	.def	string_to_operator;	.scl	3;	.type	32;	.endef
string_to_operator:
	cmpq	%rcx, 144+symbolList(%rip)
	je	.L23
	cmpq	%rcx, 184+symbolList(%rip)
	je	.L24
	cmpq	%rcx, 192+symbolList(%rip)
	je	.L25
	cmpq	%rcx, 200+symbolList(%rip)
	je	.L26
	cmpq	%rcx, 208+symbolList(%rip)
	je	.L27
	cmpq	%rcx, 216+symbolList(%rip)
	je	.L28
	cmpq	%rcx, 224+symbolList(%rip)
	je	.L29
	cmpq	%rcx, 232+symbolList(%rip)
	je	.L30
	cmpq	%rcx, 152+symbolList(%rip)
	je	.L31
	cmpq	%rcx, 160+symbolList(%rip)
	je	.L32
	cmpq	%rcx, 128+symbolList(%rip)
	je	.L33
	cmpq	%rcx, 136+symbolList(%rip)
	je	.L34
	cmpq	%rcx, 168+symbolList(%rip)
	je	.L35
	cmpq	%rcx, 176+symbolList(%rip)
	je	.L36
	cmpq	%rcx, 88+symbolList(%rip)
	je	.L37
	cmpq	%rcx, 96+symbolList(%rip)
	je	.L38
	cmpq	%rcx, 104+symbolList(%rip)
	je	.L39
	cmpq	%rcx, 112+symbolList(%rip)
	je	.L40
	cmpq	%rcx, 120+symbolList(%rip)
	movl	$19, %eax
	movl	$4, %edx
	cmove	%edx, %eax
	ret
.L23:
	movl	$13, %eax
	ret
.L24:
	movl	$14, %eax
	ret
.L25:
	movl	$15, %eax
	ret
.L26:
	movl	$16, %eax
	ret
.L27:
	movl	$17, %eax
	ret
.L28:
	movl	$18, %eax
	ret
.L29:
	movl	$11, %eax
	ret
.L30:
	movl	$12, %eax
	ret
.L31:
	movl	$5, %eax
	ret
.L32:
	movl	$6, %eax
	ret
.L33:
	movl	$7, %eax
	ret
.L34:
	movl	$8, %eax
	ret
.L35:
	movl	$9, %eax
	ret
.L36:
	movl	$10, %eax
	ret
.L37:
	movl	$0, %eax
	ret
.L38:
	movl	$1, %eax
	ret
.L39:
	movl	$2, %eax
	ret
.L40:
	movl	$3, %eax
	ret
	.def	operator_precedence;	.scl	3;	.type	32;	.endef
operator_precedence:
	cmpl	$18, %ecx
	ja	.L43
	movl	%ecx, %ecx
	leaq	.L45(%rip), %rdx
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L45:
	.long	.L49-.L45
	.long	.L49-.L45
	.long	.L48-.L45
	.long	.L48-.L45
	.long	.L48-.L45
	.long	.L47-.L45
	.long	.L47-.L45
	.long	.L47-.L45
	.long	.L47-.L45
	.long	.L47-.L45
	.long	.L47-.L45
	.long	.L50-.L45
	.long	.L50-.L45
	.long	.L44-.L45
	.long	.L44-.L45
	.long	.L44-.L45
	.long	.L44-.L45
	.long	.L44-.L45
	.long	.L44-.L45
	.text
.L44:
	movl	$1, %eax
	ret
.L47:
	movl	$3, %eax
	ret
.L49:
	movl	$4, %eax
	ret
.L48:
	movl	$5, %eax
	ret
.L43:
	movl	$0, %eax
	ret
.L50:
	movl	$2, %eax
	ret
	.def	get_current_char;	.scl	3;	.type	32;	.endef
get_current_char:
	movq	16(%rcx), %rax
	movl	$0, %edx
	cmpq	24(%rcx), %rax
	jnb	.L51
	addq	$1, 40(%rcx)
	movq	8(%rcx), %rdx
	leaq	1(%rax), %r8
	movq	%r8, 16(%rcx)
	movzbl	(%rdx,%rax), %edx
.L51:
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
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbp
	movq	%rdx, %rsi
	movl	%r8d, %r14d
	movq	%r9, %rdi
	testb	%r8b, %r8b
	jne	.L55
	shrq	$3, %rdx
	movl	%esi, %ecx
	andl	$7, %ecx
	movl	$1, %eax
	sall	%cl, %eax
	orb	(%r9,%rdx), %al
.L56:
	movq	%rsi, %rdx
	shrq	$3, %rdx
	movb	%al, (%rdi,%rdx)
	cmpq	$1, %rsi
	jbe	.L57
	movl	$1, %ebx
	leaq	.LC1(%rip), %r13
	leaq	.LC0(%rip), %r12
.L59:
	movq	%rbx, %rax
	shrq	$3, %rax
	movsbl	(%rdi,%rax), %eax
	movl	%ebx, %ecx
	andl	$7, %ecx
	sarl	%cl, %eax
	testb	$1, %al
	movq	%r12, %rdx
	cmove	%r13, %rdx
	movq	%rbp, %rcx
	call	fprintf
	addq	$1, %rbx
	cmpq	%rbx, %rsi
	jne	.L59
.L60:
	testb	%r14b, %r14b
	leaq	.LC3(%rip), %rdx
	leaq	.LC2(%rip), %rax
	cmovne	%rax, %rdx
	movq	%rbp, %rcx
	call	fprintf
	jmp	.L54
.L55:
	shrq	$3, %rdx
	movl	%esi, %ecx
	andl	$7, %ecx
	movl	$1, %eax
	sall	%cl, %eax
	notl	%eax
	andb	(%r9,%rdx), %al
	jmp	.L56
.L57:
	testq	%rsi, %rsi
	jne	.L60
.L54:
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
	.align 8
.LC4:
	.ascii "[Warning] Unsupported type for size lookup: %s\12\0"
	.text
	.def	get_type_size;	.scl	3;	.type	32;	.endef
get_type_size:
	movl	$0, %eax
	testq	%rcx, %rcx
	je	.L77
	cmpq	%rcx, name_int(%rip)
	je	.L71
	cmpq	%rcx, name_float(%rip)
	je	.L72
	cmpq	%rcx, name_string(%rip)
	je	.L73
	movl	$1, %eax
	cmpq	%rcx, name_bool(%rip)
	je	.L77
	cmpq	%rcx, name_void(%rip)
	je	.L77
	cmpl	$0, 32(%rcx)
	jne	.L69
	movq	24(%rcx), %rax
	movq	24(%rax), %rax
	ret
.L69:
	pushq	%rbx
	subq	$32, %rsp
	movq	8(%rcx), %rbx
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rbx, %r8
	leaq	.LC4(%rip), %rdx
	call	fprintf
	movl	$8, %eax
	addq	$32, %rsp
	popq	%rbx
	ret
.L71:
	movl	$8, %eax
	ret
.L72:
	movl	$8, %eax
	ret
.L73:
	movl	$8, %eax
	ret
.L77:
	ret
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "Error creating method: name or return_type is NULL\12\0"
	.text
	.def	create_method_use_ptr;	.scl	3;	.type	32;	.endef
create_method_use_ptr:
	subq	$40, %rsp
	testq	%rdx, %rdx
	je	.L83
	testq	%r8, %r8
	je	.L83
	movq	%rdx, (%rcx)
	movq	%r8, 8(%rcx)
	movq	%r9, 16(%rcx)
	movq	80(%rsp), %rax
	movq	%rax, 24(%rcx)
	movq	88(%rsp), %rax
	movq	%rax, 32(%rcx)
	movq	%rcx, %rax
.L79:
	addq	$40, %rsp
	ret
.L83:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %r9
	movl	$51, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L79
	.section .rdata,"dr"
.LC6:
	.ascii "Name: \"NULL\"\12\0"
.LC7:
	.ascii "name: \"%s\"\12\0"
.LC8:
	.ascii "id: %zu\12\0"
.LC9:
	.ascii "kind: \"type\"\12\0"
.LC10:
	.ascii "kind: \"variable\"\12\0"
.LC11:
	.ascii "type\12\0"
.LC12:
	.ascii "kind: \"function\"\12\0"
.LC13:
	.ascii "return_type\12\0"
.LC14:
	.ascii "kind: \"method\"\12\0"
.LC15:
	.ascii "kind: \"class\"\12\0"
.LC16:
	.ascii "kind: \"attribute\"\12\0"
.LC17:
	.ascii "kind: \"parameter\"\12\0"
.LC18:
	.ascii "kind: \"unknown_NameType\"\12\0"
	.text
	.def	output_name;	.scl	3;	.type	32;	.endef
output_name:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rdx, %rbx
	movq	%r8, %rdi
	movq	%r9, %rbp
	testq	%rcx, %rcx
	je	.L98
	movq	%rcx, %rsi
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	8(%rsi), %r8
	leaq	.LC7(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	movq	%rbp, %r9
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	16(%rsi), %r8
	leaq	.LC8(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	cmpl	$6, 32(%rsi)
	ja	.L88
	movl	32(%rsi), %eax
	leaq	.L90(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L90:
	.long	.L96-.L90
	.long	.L95-.L90
	.long	.L94-.L90
	.long	.L93-.L90
	.long	.L92-.L90
	.long	.L91-.L90
	.long	.L89-.L90
	.text
.L98:
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC6(%rip), %rcx
	call	fwrite
.L85:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L89:
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC9(%rip), %rcx
	call	fwrite
	jmp	.L85
.L93:
	movq	%rbp, %r9
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC10(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rcx
	movq	%rbp, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_name
	jmp	.L85
.L95:
	movq	%rbp, %r9
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC12(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC13(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rcx
	movq	%rbp, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_name
	jmp	.L85
.L94:
	movq	%rbp, %r9
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC14(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC13(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rcx
	movq	%rbp, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_name
	jmp	.L85
.L96:
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC15(%rip), %rcx
	call	fwrite
	jmp	.L85
.L91:
	movq	%rbp, %r9
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC16(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rcx
	movq	%rbp, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_name
	jmp	.L85
.L92:
	movq	%rbp, %r9
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC17(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rcx
	movq	%rbp, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_name
	jmp	.L85
.L88:
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$25, %r8d
	movl	$1, %edx
	leaq	.LC18(%rip), %rcx
	call	fwrite
	jmp	.L85
	.section .rdata,"dr"
	.align 8
.LC19:
	.ascii "Fatal: Cannot allocate memory\12\0"
	.text
	.def	create_memory_block;	.scl	3;	.type	32;	.endef
create_memory_block:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rsi
	movl	$32, %ecx
	call	malloc
	testq	%rax, %rax
	je	.L102
	movq	%rax, %rbx
	movq	%rsi, %rcx
	call	malloc
	movq	%rax, 24(%rbx)
	movq	%rsi, (%rbx)
	movq	$0, 8(%rbx)
	movq	$0, 16(%rbx)
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L102:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %r9
	movl	$30, %r8d
	movl	$1, %edx
	leaq	.LC19(%rip), %rcx
	call	fwrite
	movb	$0, initialized(%rip)
	movl	$1, %ecx
	call	exit
	.def	increase_memory_size;	.scl	3;	.type	32;	.endef
increase_memory_size:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movl	%ecx, %esi
	movl	$32, %ecx
	call	malloc
	testq	%rax, %rax
	je	.L111
	movq	%rax, %rbx
	movl	$1024, %ecx
	call	malloc
	movq	%rax, 24(%rbx)
	movq	$1024, (%rbx)
	movq	$0, 8(%rbx)
	movq	$0, 16(%rbx)
	testb	%sil, %sil
	je	.L107
	movq	struct_memory(%rip), %rax
	movq	8(%rax), %rdx
	addq	%rdx, struct_memory_used(%rip)
	movq	%rax, 16(%rbx)
	movq	%rbx, struct_memory(%rip)
	addq	$1024, struct_memory_count(%rip)
.L103:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L111:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %r9
	movl	$30, %r8d
	movl	$1, %edx
	leaq	.LC19(%rip), %rcx
	call	fwrite
	movq	string_memory(%rip), %rbx
	testq	%rbx, %rbx
	je	.L105
.L106:
	movq	%rbx, %rsi
	movq	16(%rbx), %rbx
	movq	24(%rsi), %rcx
	call	free
	movq	%rsi, %rcx
	call	free
	testq	%rbx, %rbx
	jne	.L106
.L105:
	movb	$0, initialized(%rip)
	movl	$1, %ecx
	call	exit
.L107:
	movq	string_memory(%rip), %rax
	movq	8(%rax), %rdx
	addq	%rdx, string_memory_used(%rip)
	movq	%rax, 16(%rbx)
	movq	%rbx, string_memory(%rip)
	addq	$1024, string_memory_count(%rip)
	jmp	.L103
	.section .rdata,"dr"
	.align 8
.LC20:
	.ascii "Fatal: Memory allocation is not aligned, used: %zu bytes\12\0"
	.text
	.def	alloc_memory;	.scl	3;	.type	32;	.endef
alloc_memory:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rbx
	cmpb	$0, initialized(%rip)
	je	.L117
.L113:
	addq	$7, %rbx
	andq	$-8, %rbx
	movq	struct_memory(%rip), %rax
	movq	%rbx, %rdx
	addq	8(%rax), %rdx
	cmpq	(%rax), %rdx
	jnb	.L118
.L114:
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %rsi
	testb	$7, %sil
	jne	.L119
	movq	%rsi, %rax
	andq	$-8, %rax
	addq	24(%rdx), %rax
	addq	%rbx, %rsi
	movq	%rsi, 8(%rdx)
	addq	$1, memoryBlockCount(%rip)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L117:
	call	init
	jmp	.L113
.L118:
	movl	$1, %ecx
	call	increase_memory_size
	jmp	.L114
.L119:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, %r8
	leaq	.LC20(%rip), %rdx
	call	fprintf
	movb	$0, initialized(%rip)
	movl	$1, %ecx
	call	exit
	.section .rdata,"dr"
	.align 8
.LC21:
	.ascii "Info: Allocate big memory block of size %zu bytes\12\0"
	.text
	.def	create_string_check;	.scl	3;	.type	32;	.endef
create_string_check:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbp
	movq	%rdx, %rsi
	movl	%r8d, %ebx
	cmpb	$0, initialized(%rip)
	je	.L133
.L121:
	testq	%rbp, %rbp
	je	.L129
	testq	%rsi, %rsi
	je	.L129
	testb	%bl, %bl
	je	.L123
	movq	all_string_list(%rip), %rbx
	testq	%rbx, %rbx
	je	.L123
	movl	$0, %edi
	jmp	.L125
.L133:
	call	init
	jmp	.L121
.L124:
	movq	16(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L134
.L125:
	cmpq	%rsi, 8(%rbx)
	jne	.L124
	movq	(%rbx), %r12
	testq	%r12, %r12
	je	.L124
	movq	%rsi, %r8
	movq	%rbp, %rdx
	movq	%r12, %rcx
	call	strncmp
	testl	%eax, %eax
	cmove	%r12, %rdi
	jmp	.L124
.L134:
	testq	%rdi, %rdi
	jne	.L120
.L123:
	cmpq	$1022, %rsi
	ja	.L135
	movq	string_memory(%rip), %rax
	movq	%rsi, %rdx
	addq	8(%rax), %rdx
	cmpq	(%rax), %rdx
	jnb	.L136
.L128:
	movq	string_memory(%rip), %rax
	movq	8(%rax), %rdx
	movq	%rdx, %rdi
	addq	24(%rax), %rdi
	leaq	1(%rdx,%rsi), %rdx
	movq	%rdx, 8(%rax)
.L127:
	movq	%rsi, %r8
	movq	%rbp, %rdx
	movq	%rdi, %rcx
	call	strncpy
	movb	$0, (%rdi,%rsi)
	movl	$24, %ecx
	call	alloc_memory
	movq	%rdi, (%rax)
	movq	%rsi, 8(%rax)
	movq	all_string_list(%rip), %rdx
	movq	%rdx, 16(%rax)
	movq	%rax, all_string_list(%rip)
.L120:
	movq	%rdi, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L135:
	leaq	1(%rsi), %rbx
	addq	%rbx, string_memory_count(%rip)
	addq	%rbx, string_memory_used(%rip)
	movq	%rbx, %rcx
	call	malloc
	movq	%rax, %rdi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rbx, %r8
	leaq	.LC21(%rip), %rdx
	call	fprintf
	testq	%rdi, %rdi
	jne	.L127
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %r9
	movl	$30, %r8d
	movl	$1, %edx
	leaq	.LC19(%rip), %rcx
	call	fwrite
	movl	$1, %ecx
	call	exit
.L136:
	movl	$0, %ecx
	call	increase_memory_size
	jmp	.L128
.L129:
	movl	$0, %edi
	jmp	.L120
	.section .rdata,"dr"
.LC22:
	.ascii "init\0"
.LC23:
	.ascii "$constructor\0"
	.text
	.def	init;	.scl	3;	.type	32;	.endef
init:
	cmpb	$0, initialized(%rip)
	jne	.L146
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	cmpq	$0, struct_memory(%rip)
	je	.L149
.L139:
	cmpq	$0, string_memory(%rip)
	je	.L150
.L140:
	movb	$1, initialized(%rip)
	movl	$0, %ebx
	leaq	keywordStrings(%rip), %rbp
	leaq	keywordList(%rip), %rdi
.L141:
	movq	0(%rbp,%rbx,8), %rsi
	movq	%rsi, %rcx
	call	strlen
	movq	%rax, %rdx
	movl	$0, %r8d
	movq	%rsi, %rcx
	call	create_string_check
	movq	%rax, (%rdi,%rbx,8)
	addq	$1, %rbx
	cmpq	$22, %rbx
	jne	.L141
	movl	$0, %ebx
	leaq	symbolStrings(%rip), %rbp
	leaq	symbolList(%rip), %rdi
.L142:
	movq	0(%rbp,%rbx,8), %rsi
	movq	%rsi, %rcx
	call	strlen
	movq	%rax, %rdx
	movl	$0, %r8d
	movq	%rsi, %rcx
	call	create_string_check
	movq	%rax, (%rdi,%rbx,8)
	addq	$1, %rbx
	cmpq	$30, %rbx
	jne	.L142
	movl	$0, %r8d
	movl	$4, %edx
	leaq	.LC22(%rip), %rcx
	call	create_string_check
	movq	%rax, DEFAULT_INIT_NAME(%rip)
	movl	$0, %r8d
	movl	$13, %edx
	leaq	.LC23(%rip), %rcx
	call	create_string_check
	movq	%rax, DEFAULT_CONSTRUCTOR_NAME(%rip)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L149:
	movl	$1024, %ecx
	call	create_memory_block
	movq	%rax, struct_memory(%rip)
	movq	$1024, struct_memory_count(%rip)
	jmp	.L139
.L150:
	movl	$1024, %ecx
	call	create_memory_block
	movq	%rax, string_memory(%rip)
	movq	$1024, string_memory_count(%rip)
	jmp	.L140
.L146:
	ret
	.def	create_lexer;	.scl	3;	.type	32;	.endef
create_lexer:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rdi
	movq	%rdx, %rsi
	movq	%r8, %rbx
	movl	$88, %ecx
	call	alloc_memory
	movq	%rdi, 8(%rax)
	movq	$0, 16(%rax)
	movq	%rsi, 24(%rax)
	movq	$0, 32(%rax)
	movq	$0, 40(%rax)
	movq	$0, 48(%rax)
	movq	$0, 56(%rax)
	movq	$0, 64(%rax)
	movq	$0, 72(%rax)
	movq	$0, 80(%rax)
	movq	%rbx, (%rax)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.def	create_token;	.scl	3;	.type	32;	.endef
create_token:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movl	%ecx, %ebp
	movq	%rdx, %rdi
	movq	%r8, %rsi
	movq	%r9, %rbx
	movl	$32, %ecx
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
	movq	$0, (%rax)
	movq	$0, 8(%rax)
	addq	$40, %rsp
	ret
	.def	list_copy;	.scl	3;	.type	32;	.endef
list_copy:
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbx
	testq	%rcx, %rcx
	je	.L159
	call	create_list
	movq	(%rbx), %rdx
	movq	%rdx, (%rax)
	movq	8(%rbx), %rdx
	movq	%rdx, 8(%rax)
.L157:
	addq	$32, %rsp
	popq	%rbx
	ret
.L159:
	movq	%rcx, %rax
	jmp	.L157
	.section .rdata,"dr"
.LC24:
	.ascii "type: \"name\"\12\0"
.LC25:
	.ascii "name\12\0"
.LC26:
	.ascii "type: \"function_call\"\12\0"
.LC27:
	.ascii "function\12\0"
.LC28:
	.ascii "arguments\12\0"
.LC29:
	.ascii "arguments[%d]\12\0"
.LC30:
	.ascii "type: \"get sequence_element\"\12\0"
.LC31:
	.ascii "sequence\12\0"
.LC32:
	.ascii "index\12\0"
.LC33:
	.ascii "type: \"get_attribute\"\12\0"
.LC34:
	.ascii "object\12\0"
.LC35:
	.ascii "attribute_name\12\0"
	.align 8
.LC36:
	.ascii "unknown_VariableAccessType: %u\12\0"
	.text
	.def	output_variable_access;	.scl	3;	.type	32;	.endef
output_variable_access:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rdi
	movq	%rdx, %rbx
	movq	%r8, %rbp
	movq	%r9, %rsi
	movl	16(%rcx), %eax
	cmpl	$2, %eax
	je	.L162
	ja	.L163
	testl	%eax, %eax
	je	.L174
	movq	8(%rcx), %rcx
	call	list_copy
	movq	%rax, %r13
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$22, %r8d
	movl	$1, %edx
	leaq	.LC26(%rip), %rcx
	call	fwrite
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC27(%rip), %rcx
	call	fwrite
	leaq	1(%rbp), %r14
	movq	(%rdi), %rcx
	movq	%rsi, %r9
	movq	%r14, %r8
	movq	%rbx, %rdx
	call	output_variable_access
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC28(%rip), %rcx
	call	fwrite
	movl	$-1, %r12d
	leaq	.LC29(%rip), %r15
	addq	$2, %rbp
	jmp	.L169
.L163:
	cmpl	$3, %eax
	jne	.L175
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$29, %r8d
	movl	$1, %edx
	leaq	.LC30(%rip), %rcx
	call	fwrite
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC31(%rip), %rcx
	call	fwrite
	leaq	1(%rbp), %r12
	movq	(%rdi), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_variable_access
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC32(%rip), %rcx
	call	fwrite
	movq	8(%rdi), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_expression
	jmp	.L161
.L174:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC24(%rip), %rcx
	call	fwrite
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC25(%rip), %rcx
	call	fwrite
	movq	8(%rdi), %rcx
	movq	%rsi, %r9
	leaq	1(%rbp), %r8
	movq	%rbx, %rdx
	call	output_name
.L161:
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
.L170:
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	indention
	addl	$1, %r12d
	movl	%r12d, %r8d
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	fprintf
	movq	%rsi, %r9
	movq	%rbp, %r8
	movq	%rbx, %rdx
	movq	%rdi, %rcx
	call	output_expression
.L169:
	movq	%r13, %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L170
	jmp	.L161
.L162:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$22, %r8d
	movl	$1, %edx
	leaq	.LC33(%rip), %rcx
	call	fwrite
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC34(%rip), %rcx
	call	fwrite
	leaq	1(%rbp), %r12
	movq	(%rdi), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_variable_access
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC35(%rip), %rcx
	call	fwrite
	movq	8(%rdi), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_name
	jmp	.L161
.L175:
	movl	$1, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movl	16(%rdi), %r8d
	leaq	.LC36(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L161
	.section .rdata,"dr"
.LC37:
	.ascii "type: \"integer\"\12\0"
.LC38:
	.ascii "value: %s\12\0"
.LC39:
	.ascii "type: \"float\"\12\0"
.LC40:
	.ascii "type: \"string\"\12\0"
.LC41:
	.ascii "value: \"%s\"\12\0"
.LC42:
	.ascii "type: \"boolean\"\12\0"
.LC43:
	.ascii "value: \"true\"\12\0"
.LC44:
	.ascii "value: \"false\"\12\0"
.LC45:
	.ascii "type: \"expression\"\12\0"
.LC46:
	.ascii "value\12\0"
.LC47:
	.ascii "type: \"!\"\12\0"
.LC48:
	.ascii "type: \"-\"\12\0"
.LC49:
	.ascii "type: \"variable\"\12\0"
.LC50:
	.ascii "unknown_PrimaryType: %u\12\0"
	.text
	.def	output_primary;	.scl	3;	.type	32;	.endef
output_primary:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rsi
	movq	%rdx, %rbx
	movq	%r8, %rdi
	movq	%r9, %rbp
	cmpl	$8, 8(%rcx)
	ja	.L177
	movl	8(%rcx), %eax
	leaq	.L179(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L179:
	.long	.L187-.L179
	.long	.L186-.L179
	.long	.L185-.L179
	.long	.L184-.L179
	.long	.L183-.L179
	.long	.L182-.L179
	.long	.L181-.L179
	.long	.L180-.L179
	.long	.L178-.L179
	.text
.L187:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC37(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	(%rsi), %r8
	leaq	.LC38(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
.L176:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L186:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC39(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	(%rsi), %r8
	leaq	.LC38(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L176
.L185:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC40(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	(%rsi), %r8
	leaq	.LC41(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L176
.L184:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC42(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC43(%rip), %rcx
	call	fwrite
	jmp	.L176
.L183:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC42(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC44(%rip), %rcx
	call	fwrite
	jmp	.L176
.L182:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$19, %r8d
	movl	$1, %edx
	leaq	.LC45(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC46(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rcx
	movq	%rbp, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_expression
	jmp	.L176
.L181:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC47(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC46(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rcx
	movq	%rbp, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_primary
	jmp	.L176
.L180:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC48(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC46(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rcx
	movq	%rbp, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_primary
	jmp	.L176
.L178:
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC49(%rip), %rcx
	call	fwrite
	movq	%rbp, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC46(%rip), %rcx
	call	fwrite
	movq	(%rsi), %rcx
	movq	%rbp, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_variable_access
	jmp	.L176
.L177:
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movl	8(%rsi), %r8d
	leaq	.LC50(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L176
	.section .rdata,"dr"
.LC51:
	.ascii "UNKNOWN_OPERATOR\0"
.LC52:
	.ascii "primary\12\0"
.LC53:
	.ascii "operator: \"%s\"\12\0"
.LC54:
	.ascii "left\12\0"
.LC55:
	.ascii "right\12\0"
	.text
	.def	output_expression;	.scl	3;	.type	32;	.endef
output_expression:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbp
	movq	%rdx, %rbx
	movq	%r8, %rdi
	movq	%r9, %rsi
	movl	24(%rcx), %eax
	cmpl	$19, %eax
	je	.L218
	cmpl	$18, %eax
	ja	.L215
	movl	%eax, %eax
	leaq	.L195(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L195:
	.long	.L213-.L195
	.long	.L212-.L195
	.long	.L211-.L195
	.long	.L210-.L195
	.long	.L209-.L195
	.long	.L208-.L195
	.long	.L207-.L195
	.long	.L206-.L195
	.long	.L205-.L195
	.long	.L204-.L195
	.long	.L203-.L195
	.long	.L202-.L195
	.long	.L201-.L195
	.long	.L200-.L195
	.long	.L199-.L195
	.long	.L198-.L195
	.long	.L197-.L195
	.long	.L196-.L195
	.long	.L194-.L195
	.text
.L218:
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC52(%rip), %rcx
	call	fwrite
	movq	8(%rbp), %rcx
	movq	%rsi, %r9
	leaq	1(%rdi), %r8
	movq	%rbx, %rdx
	call	output_primary
	jmp	.L190
.L200:
	movq	144+symbolList(%rip), %r12
.L193:
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	testq	%r12, %r12
	leaq	.LC51(%rip), %r8
	cmovne	%r12, %r8
	leaq	.LC53(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC54(%rip), %rcx
	call	fwrite
	leaq	1(%rdi), %r12
	movq	0(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_expression
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC55(%rip), %rcx
	call	fwrite
	movq	16(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_expression
.L190:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L199:
	movq	184+symbolList(%rip), %r12
	jmp	.L193
.L198:
	movq	192+symbolList(%rip), %r12
	jmp	.L193
.L197:
	movq	200+symbolList(%rip), %r12
	jmp	.L193
.L196:
	movq	208+symbolList(%rip), %r12
	jmp	.L193
.L194:
	movq	216+symbolList(%rip), %r12
	jmp	.L193
.L202:
	movq	224+symbolList(%rip), %r12
	jmp	.L193
.L201:
	movq	232+symbolList(%rip), %r12
	jmp	.L193
.L208:
	movq	152+symbolList(%rip), %r12
	jmp	.L193
.L207:
	movq	160+symbolList(%rip), %r12
	jmp	.L193
.L206:
	movq	128+symbolList(%rip), %r12
	jmp	.L193
.L205:
	movq	136+symbolList(%rip), %r12
	jmp	.L193
.L204:
	movq	168+symbolList(%rip), %r12
	jmp	.L193
.L203:
	movq	176+symbolList(%rip), %r12
	jmp	.L193
.L213:
	movq	88+symbolList(%rip), %r12
	jmp	.L193
.L212:
	movq	96+symbolList(%rip), %r12
	jmp	.L193
.L211:
	movq	104+symbolList(%rip), %r12
	jmp	.L193
.L210:
	movq	112+symbolList(%rip), %r12
	jmp	.L193
.L209:
	movq	120+symbolList(%rip), %r12
	jmp	.L193
.L215:
	movl	$0, %r12d
	jmp	.L193
	.section .rdata,"dr"
.LC56:
	.ascii "value: \"NULL\"\12\0"
	.text
	.def	output_variable;	.scl	3;	.type	32;	.endef
output_variable:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbp
	movq	%rdx, %rbx
	movq	%r8, %rdi
	movq	%r9, %rsi
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC11(%rip), %rcx
	call	fwrite
	leaq	1(%rdi), %r12
	movq	0(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_name
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC25(%rip), %rcx
	call	fwrite
	movq	8(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_name
	cmpq	$0, 16(%rbp)
	je	.L220
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC46(%rip), %rcx
	call	fwrite
	movq	16(%rbp), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	call	output_expression
.L219:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L220:
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC56(%rip), %rcx
	call	fwrite
	jmp	.L219
	.section .rdata,"dr"
.LC57:
	.ascii "if_statement\12\0"
.LC58:
	.ascii "condition\12\0"
.LC59:
	.ascii "body\12\0"
.LC60:
	.ascii "else_if\12\0"
.LC61:
	.ascii "else_body\12\0"
.LC62:
	.ascii "for_statement\12\0"
.LC63:
	.ascii "initializer\12\0"
.LC64:
	.ascii "initializer: \"NULL\"\12\0"
.LC65:
	.ascii "condition: \"NULL\"\12\0"
.LC66:
	.ascii "increment\12\0"
.LC67:
	.ascii "increment: \"NULL\"\12\0"
.LC68:
	.ascii "while_statement\12\0"
	.align 8
.LC69:
	.ascii "variable_declaration_statement\12\0"
.LC70:
	.ascii "return_statement: \"NULL\"\12\0"
.LC71:
	.ascii "return_statement\12\0"
.LC72:
	.ascii "break_statement: \"NULL\"\12\0"
.LC73:
	.ascii "continue_statement: \"NULL\"\12\0"
.LC74:
	.ascii "expression_statement: \"NULL\"\12\0"
.LC75:
	.ascii "expression_statement\12\0"
.LC76:
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
	pushq	%rbx
	subq	$56, %rsp
	movq	%rcx, %rdi
	movq	%rdx, %rbx
	movq	%r8, %rbp
	movq	%r9, %rsi
	cmpl	$7, 8(%rcx)
	ja	.L224
	movl	8(%rcx), %eax
	leaq	.L226(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L226:
	.long	.L233-.L226
	.long	.L232-.L226
	.long	.L231-.L226
	.long	.L230-.L226
	.long	.L229-.L226
	.long	.L228-.L226
	.long	.L227-.L226
	.long	.L225-.L226
	.text
.L231:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC57(%rip), %rcx
	call	fwrite
	leaq	1(%rbp), %r15
	movq	%r15, 40(%rsp)
	movq	(%rdi), %r12
	movq	8(%r12), %rcx
	call	list_copy
	movq	%rax, %rdi
	movq	16(%r12), %rcx
	call	list_copy
	movq	%rax, %r14
	movq	24(%r12), %rcx
	call	list_copy
	movq	%rax, 32(%rsp)
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC58(%rip), %rcx
	call	fwrite
	leaq	2(%rbp), %r13
	movq	(%r12), %rcx
	movq	%rsi, %r9
	movq	%r13, %r8
	movq	%rbx, %rdx
	call	output_expression
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC59(%rip), %rcx
	call	fwrite
.L234:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L256
	movq	%rsi, %r9
	movq	%r13, %r8
	movq	%rbx, %rdx
	call	output_statement
	jmp	.L234
.L256:
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	40(%rsp), %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC60(%rip), %rcx
	call	fwrite
	leaq	.LC58(%rip), %r15
	addq	$3, %rbp
.L236:
	movq	%r14, %rcx
	call	list_pop
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L257
	movq	8(%r12), %rcx
	call	list_copy
	movq	%rax, %rdi
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	movq	%r15, %rcx
	call	fwrite
	movq	(%r12), %rcx
	movq	%rsi, %r9
	movq	%rbp, %r8
	movq	%rbx, %rdx
	call	output_expression
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC59(%rip), %rcx
	call	fwrite
.L237:
	movq	%rdi, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L236
	movq	%rsi, %r9
	movq	%rbp, %r8
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	output_statement
	jmp	.L237
.L257:
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	40(%rsp), %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC61(%rip), %rcx
	call	fwrite
.L240:
	movq	32(%rsp), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L223
	movq	%rsi, %r9
	movq	%r13, %r8
	movq	%rbx, %rdx
	call	output_statement
	jmp	.L240
.L229:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC62(%rip), %rcx
	call	fwrite
	leaq	1(%rbp), %r13
	movq	(%rdi), %r12
	movq	24(%r12), %rcx
	call	list_copy
	movq	%rax, %rdi
	cmpq	$0, (%r12)
	je	.L243
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC63(%rip), %rcx
	call	fwrite
	movq	(%r12), %rcx
	movq	%rsi, %r9
	leaq	2(%rbp), %r8
	movq	%rbx, %rdx
	call	output_variable
.L244:
	cmpq	$0, 8(%r12)
	je	.L245
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC58(%rip), %rcx
	call	fwrite
	movq	8(%r12), %rcx
	movq	%rsi, %r9
	leaq	2(%rbp), %r8
	movq	%rbx, %rdx
	call	output_expression
.L246:
	cmpq	$0, 16(%r12)
	je	.L247
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC66(%rip), %rcx
	call	fwrite
	movq	16(%r12), %rcx
	movq	%rsi, %r9
	leaq	2(%rbp), %r8
	movq	%rbx, %rdx
	call	output_expression
.L248:
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC59(%rip), %rcx
	call	fwrite
	addq	$2, %rbp
.L249:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L223
	movq	%rsi, %r9
	movq	%rbp, %r8
	movq	%rbx, %rdx
	call	output_statement
	jmp	.L249
.L243:
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$20, %r8d
	movl	$1, %edx
	leaq	.LC64(%rip), %rcx
	call	fwrite
	jmp	.L244
.L245:
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC65(%rip), %rcx
	call	fwrite
	jmp	.L246
.L247:
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r13, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC67(%rip), %rcx
	call	fwrite
	jmp	.L248
.L230:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC68(%rip), %rcx
	call	fwrite
	leaq	1(%rbp), %r12
	movq	(%rdi), %r13
	movq	8(%r13), %rcx
	call	list_copy
	movq	%rax, %rdi
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC58(%rip), %rcx
	call	fwrite
	addq	$2, %rbp
	movq	0(%r13), %rcx
	movq	%rsi, %r9
	movq	%rbp, %r8
	movq	%rbx, %rdx
	call	output_expression
	movq	%rsi, %r9
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC59(%rip), %rcx
	call	fwrite
.L251:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L223
	movq	%rsi, %r9
	movq	%rbp, %r8
	movq	%rbx, %rdx
	call	output_statement
	jmp	.L251
.L232:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC69(%rip), %rcx
	call	fwrite
	movq	(%rdi), %rcx
	movq	%rsi, %r9
	leaq	1(%rbp), %r8
	movq	%rbx, %rdx
	call	output_variable
.L223:
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
.L228:
	cmpq	$0, (%rcx)
	je	.L258
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC71(%rip), %rcx
	call	fwrite
	movq	(%rdi), %rcx
	movq	%rsi, %r9
	leaq	1(%rbp), %r8
	movq	%rbx, %rdx
	call	output_expression
	jmp	.L223
.L258:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$25, %r8d
	movl	$1, %edx
	leaq	.LC70(%rip), %rcx
	call	fwrite
	jmp	.L223
.L227:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$24, %r8d
	movl	$1, %edx
	leaq	.LC72(%rip), %rcx
	call	fwrite
	jmp	.L223
.L225:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$27, %r8d
	movl	$1, %edx
	leaq	.LC73(%rip), %rcx
	call	fwrite
	jmp	.L223
.L233:
	cmpq	$0, (%rcx)
	je	.L259
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$21, %r8d
	movl	$1, %edx
	leaq	.LC75(%rip), %rcx
	call	fwrite
	movq	(%rdi), %rcx
	movq	%rsi, %r9
	leaq	1(%rbp), %r8
	movq	%rbx, %rdx
	call	output_expression
	jmp	.L223
.L259:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movq	%rbx, %r9
	movl	$29, %r8d
	movl	$1, %edx
	leaq	.LC74(%rip), %rcx
	call	fwrite
	jmp	.L223
.L224:
	movl	$0, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	indention
	movl	8(%rdi), %r8d
	leaq	.LC76(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L223
	.def	create_symbol_table;	.scl	3;	.type	32;	.endef
create_symbol_table:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rsi
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %rbx
	movq	%rsi, (%rax)
	call	create_list
	movq	%rax, 8(%rbx)
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.section .rdata,"dr"
.LC77:
	.ascii "true\0"
.LC78:
	.ascii "false\0"
	.align 8
.LC79:
	.ascii "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\12\0"
	.align 8
.LC80:
	.ascii "Error creating variable access: content is NULL\12\0"
	.align 8
.LC81:
	.ascii "Error creating variable access: unknown type %u\12\0"
	.text
	.def	create_variable_access;	.scl	3;	.type	32;	.endef
create_variable_access:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movl	%ecx, %ebx
	movq	%rdx, %rsi
	testl	%ecx, %ecx
	sete	%r12b
	testq	%rdx, %rdx
	sete	%al
	cmpb	%r12b, %al
	jne	.L275
	movq	%r8, %rbp
	movq	%r9, %rdi
	movl	$24, %ecx
	call	alloc_memory
	movl	%ebx, 16(%rax)
	movq	%rsi, (%rax)
	testq	%rbp, %rbp
	setne	%dl
	testb	%r12b, %r12b
	je	.L267
	testb	%dl, %dl
	je	.L267
	movq	%rbp, 8(%rax)
	jmp	.L262
.L275:
	testl	%ecx, %ecx
	leaq	.LC78(%rip), %rdi
	leaq	.LC77(%rip), %rax
	cmove	%rax, %rdi
	testq	%rdx, %rdx
	leaq	.LC78(%rip), %rbx
	cmove	%rax, %rbx
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, %r9
	movq	%rbx, %r8
	leaq	.LC79(%rip), %rdx
	call	fprintf
	movl	$0, %eax
.L262:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L267:
	cmpl	$1, %ebx
	jne	.L268
	cmpq	$0, 112(%rsp)
	je	.L268
	movq	112(%rsp), %rdi
	movq	%rdi, 8(%rax)
	jmp	.L262
.L268:
	cmpl	$3, %ebx
	jne	.L269
	testq	%rdi, %rdi
	je	.L269
	movq	%rdi, 8(%rax)
	jmp	.L262
.L269:
	cmpl	$2, %ebx
	jne	.L270
	testb	%dl, %dl
	je	.L270
	movq	%rbp, 8(%rax)
	jmp	.L262
.L270:
	orq	112(%rsp), %rdi
	movq	%rdi, %r9
	orq	%rbp, %r9
	je	.L276
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movl	%ebx, %r8d
	leaq	.LC81(%rip), %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L262
.L276:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %r9
	movl	$48, %r8d
	movl	$1, %edx
	leaq	.LC80(%rip), %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L262
	.section .rdata,"dr"
	.align 8
.LC82:
	.ascii "Error creating primary: value is NULL\12\0"
	.align 8
.LC83:
	.ascii "Error creating primary: unknown type %u\12\0"
	.text
	.def	create_primary;	.scl	3;	.type	32;	.endef
create_primary:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movl	%ecx, %ebx
	movq	%rdx, %rsi
	movq	%r8, %rbp
	movq	%r9, %rdi
	movl	$16, %ecx
	call	alloc_memory
	movl	%ebx, 8(%rax)
	cmpl	$4, %ebx
	ja	.L278
	testq	%rsi, %rsi
	je	.L278
	movq	%rsi, (%rax)
.L277:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L278:
	cmpl	$5, %ebx
	jne	.L280
	testq	%rbp, %rbp
	je	.L280
	movq	%rbp, (%rax)
	jmp	.L277
.L280:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L281
	testq	%rdi, %rdi
	jne	.L285
.L281:
	cmpl	$8, %ebx
	jne	.L282
	cmpq	$0, 112(%rsp)
	je	.L282
	movq	112(%rsp), %rdi
	movq	%rdi, (%rax)
	jmp	.L277
.L285:
	movq	%rdi, (%rax)
	jmp	.L277
.L282:
	movq	%rdi, %rax
	orq	112(%rsp), %rax
	movq	%rbp, %r8
	orq	%rax, %r8
	orq	%rsi, %r8
	jne	.L283
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %r9
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC82(%rip), %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L277
.L283:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movl	%ebx, %r8d
	leaq	.LC83(%rip), %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L277
	.section .rdata,"dr"
	.align 8
.LC84:
	.ascii "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\12\0"
	.align 8
.LC85:
	.ascii "Error creating expression: both expr_left and prim_left are NULL\12\0"
	.text
	.def	create_expression;	.scl	3;	.type	32;	.endef
create_expression:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	movl	%ecx, %ebx
	movq	%rdx, %rsi
	movq	%r8, %rbp
	movq	%r9, %rdi
	cmpl	$19, %ecx
	sete	%dl
	testq	%r9, %r9
	sete	%al
	cmpb	%al, %dl
	jne	.L287
	movq	%r8, %rax
	orq	%rsi, %rax
	je	.L305
	movl	$32, %ecx
	call	alloc_memory
	movl	%ebx, 24(%rax)
	testq	%rsi, %rsi
	je	.L295
	movq	%rsi, (%rax)
.L296:
	movq	%rdi, 16(%rax)
	jmp	.L286
.L287:
	testq	%r9, %r9
	leaq	.LC77(%rip), %rdi
	leaq	.LC78(%rip), %rax
	cmovne	%rax, %rdi
	testq	%r8, %r8
	movq	%rax, %rbp
	leaq	.LC77(%rip), %rax
	cmove	%rax, %rbp
.L291:
	testq	%rsi, %rsi
	leaq	.LC78(%rip), %rsi
	leaq	.LC77(%rip), %rax
	cmove	%rax, %rsi
.L292:
	cmpl	$19, %ebx
	leaq	.LC78(%rip), %rbx
	leaq	.LC77(%rip), %rax
	cmove	%rax, %rbx
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 40(%rsp)
	movq	%rbp, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC84(%rip), %rdx
	call	fprintf
	movl	$0, %eax
.L286:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L302:
	leaq	.LC77(%rip), %rdi
	movq	%rdi, %rbp
	movq	%rdi, %rsi
	jmp	.L292
.L295:
	testq	%rbp, %rbp
	je	.L297
	movq	%rbp, 8(%rax)
	jmp	.L296
.L297:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %r9
	movl	$65, %r8d
	movl	$1, %edx
	leaq	.LC85(%rip), %rcx
	call	fwrite
	movq	%rbp, %rax
	jmp	.L286
.L305:
	testq	%r9, %r9
	je	.L302
	leaq	.LC78(%rip), %rdi
	leaq	.LC77(%rip), %rbp
	jmp	.L291
	.section .rdata,"dr"
	.align 8
.LC86:
	.ascii "Error creating variable: type or name is NULL\12\0"
	.text
	.def	create_variable;	.scl	3;	.type	32;	.endef
create_variable:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	testq	%rcx, %rcx
	je	.L310
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	movq	%r8, %rdi
	testq	%rdx, %rdx
	je	.L310
	movl	$24, %ecx
	call	alloc_memory
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
	movq	%rdi, 16(%rax)
.L306:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L310:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %r9
	movl	$46, %r8d
	movl	$1, %edx
	leaq	.LC86(%rip), %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L306
	.section .rdata,"dr"
	.align 8
.LC87:
	.ascii "Error creating statement: content is NULL\12\0"
	.align 8
.LC88:
	.ascii "Error creating statement: unknown type %u\12\0"
	.text
	.def	create_statement;	.scl	3;	.type	32;	.endef
create_statement:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movl	%ecx, %ebx
	movq	%rdx, %rsi
	movq	%r8, %rbp
	movq	%r9, %rdi
	movq	112(%rsp), %r12
	movl	$16, %ecx
	call	alloc_memory
	movl	%ebx, 8(%rax)
	testl	%ebx, %ebx
	jne	.L313
	testq	%r12, %r12
	je	.L313
	movq	%r12, (%rax)
.L312:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L313:
	cmpl	$1, %ebx
	jne	.L315
	cmpq	$0, 120(%rsp)
	je	.L315
	movq	120(%rsp), %rdi
	movq	%rdi, (%rax)
	jmp	.L312
.L315:
	cmpl	$2, %ebx
	jne	.L316
	testq	%rsi, %rsi
	je	.L316
	movq	%rsi, (%rax)
	jmp	.L312
.L316:
	cmpl	$3, %ebx
	jne	.L317
	testq	%rbp, %rbp
	je	.L317
	movq	%rbp, (%rax)
	jmp	.L312
.L317:
	cmpl	$4, %ebx
	jne	.L318
	testq	%rdi, %rdi
	je	.L318
	movq	%rdi, (%rax)
	jmp	.L312
.L318:
	cmpl	$5, %ebx
	je	.L323
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	ja	.L320
	movq	$0, (%rax)
	jmp	.L312
.L323:
	movq	%r12, (%rax)
	jmp	.L312
.L320:
	orq	%rbp, %rdi
	orq	%rdi, %rsi
	movq	%rsi, %rax
	orq	120(%rsp), %rax
	orq	%r12, %rax
	je	.L324
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movl	%ebx, %r8d
	leaq	.LC88(%rip), %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L312
.L324:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %r9
	movl	$42, %r8d
	movl	$1, %edx
	leaq	.LC87(%rip), %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L312
	.section .rdata,"dr"
	.align 8
.LC89:
	.ascii "Error creating class member: content is NULL\12\0"
	.align 8
.LC90:
	.ascii "Error creating class member: unknown type %u\12\0"
	.text
	.def	create_class_member;	.scl	3;	.type	32;	.endef
create_class_member:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movl	%ecx, %ebx
	movq	%rdx, %rsi
	movq	%r8, %rdi
	movl	$16, %ecx
	call	alloc_memory
	movl	%ebx, 8(%rax)
	testl	%ebx, %ebx
	jne	.L326
	testq	%rsi, %rsi
	je	.L326
	movq	%rsi, (%rax)
.L325:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L326:
	cmpl	$1, %ebx
	jne	.L328
	testq	%rdi, %rdi
	je	.L328
	movq	%rdi, (%rax)
	jmp	.L325
.L328:
	orq	%rsi, %rdi
	jne	.L329
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %r9
	movl	$45, %r8d
	movl	$1, %edx
	leaq	.LC89(%rip), %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L325
.L329:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movl	%ebx, %r8d
	leaq	.LC90(%rip), %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L325
	.section .rdata,"dr"
	.align 8
.LC91:
	.ascii "Error creating code member: content is NULL\12\0"
	.align 8
.LC92:
	.ascii "Error creating code member: unknown type %u\12\0"
	.text
	.def	create_code_member;	.scl	3;	.type	32;	.endef
create_code_member:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movl	%ecx, %esi
	movq	%rdx, %rdi
	movq	%r8, %r12
	movq	%r9, %rbp
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %rbx
	movl	%esi, 8(%rax)
	testl	%esi, %esi
	jne	.L332
	testq	%rdi, %rdi
	je	.L332
	movq	%rdi, (%rax)
.L331:
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L332:
	cmpl	$1, %esi
	jne	.L334
	testq	%r12, %r12
	je	.L334
	movq	%r12, (%rbx)
	jmp	.L331
.L334:
	cmpl	$2, %esi
	jne	.L335
	testq	%rbp, %rbp
	je	.L335
	movq	%rbp, (%rbx)
	jmp	.L331
.L335:
	movq	%rbp, %r9
	orq	%r12, %r9
	orq	%rdi, %r9
	je	.L338
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movl	%esi, %r8d
	leaq	.LC92(%rip), %rdx
	call	fprintf
	jmp	.L331
.L338:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %r9
	movl	$44, %r8d
	movl	$1, %edx
	leaq	.LC91(%rip), %rcx
	call	fwrite
	jmp	.L331
	.section .rdata,"dr"
	.align 8
.LC93:
	.ascii "Error: list_append received NULL list\12\0"
	.text
	.def	list_append;	.scl	3;	.type	32;	.endef
list_append:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	testq	%rcx, %rcx
	je	.L344
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	movl	$16, %ecx
	call	alloc_memory
	movq	$0, (%rax)
	movq	%rsi, 8(%rax)
	cmpq	$0, (%rbx)
	je	.L345
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rbx)
.L339:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L344:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %r9
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC93(%rip), %rcx
	call	fwrite
	jmp	.L339
.L345:
	movq	%rax, (%rbx)
	movq	%rax, 8(%rbx)
	jmp	.L339
	.section .rdata,"dr"
	.align 8
.LC94:
	.ascii "[Warning] Creating symbol with unknown SymbolType: %u\12\0"
	.align 8
.LC95:
	.ascii "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\12\0"
	.align 8
.LC96:
	.ascii "[Warning] Creating symbol with unknown SymbolType for ast_node assignment: %u\12\0"
	.align 8
.LC97:
	.ascii "[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\12\0"
	.text
	.def	create_symbol;	.scl	3;	.type	32;	.endef
create_symbol:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	movq	%rcx, %rdi
	movl	%edx, %ebx
	movq	%r8, %r12
	movq	%r9, %rbp
	cmpl	$2, %edx
	je	.L347
	ja	.L348
	testl	%edx, %edx
	je	.L367
	movq	32(%r9), %rax
	movq	(%rax), %r13
	jmp	.L352
.L348:
	leal	-3(%rdx), %eax
	movq	%r9, %r13
	cmpl	$3, %eax
	jbe	.L352
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movl	%ebx, %r8d
	leaq	.LC94(%rip), %rdx
	call	fprintf
	movl	$0, %r13d
	jmp	.L352
.L367:
	movq	16(%r9), %rax
	movq	(%rax), %r13
.L352:
	movq	%rdi, %rdx
	movq	%r13, %rcx
	call	search_name
	testq	%rax, %rax
	je	.L353
	movq	id_counter.0(%rip), %rdx
	leaq	1(%rdx), %rsi
	movq	16(%rax), %r14
	movl	32(%rax), %r15d
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, 40(%rsp)
	movq	%r14, 32(%rsp)
	movl	%r15d, %r9d
	movq	%rdi, %r8
	leaq	.LC95(%rip), %rdx
	call	fprintf
.L353:
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, %rsi
	movq	%rdi, 8(%rax)
	movq	id_counter.0(%rip), %rax
	addq	$1, %rax
	movq	%rax, id_counter.0(%rip)
	movq	%rax, 16(%rsi)
	movl	%ebx, 32(%rsi)
	movq	%r12, (%rsi)
	cmpl	$2, %ebx
	je	.L354
	ja	.L355
	testl	%ebx, %ebx
	je	.L368
	movq	%rbp, 24(%rsi)
	jmp	.L360
.L347:
	movq	32(%r9), %rax
	movq	(%rax), %r13
	jmp	.L352
.L355:
	leal	-3(%rbx), %eax
	cmpl	$3, %eax
	ja	.L369
	movq	%rbp, 24(%rsi)
	jmp	.L360
.L368:
	movq	%rbp, 24(%rsi)
.L360:
	testq	%r13, %r13
	je	.L370
	movq	8(%r13), %rcx
	movq	%rsi, %rdx
	call	list_append
.L346:
	movq	%rsi, %rax
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
.L354:
	movq	%rbp, 24(%rsi)
	jmp	.L360
.L369:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movl	%ebx, %r8d
	leaq	.LC96(%rip), %rdx
	call	fprintf
	jmp	.L360
.L370:
	movq	16(%rsi), %rbp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rbp, 32(%rsp)
	movl	%ebx, %r9d
	movq	%rdi, %r8
	leaq	.LC97(%rip), %rdx
	call	fprintf
	jmp	.L346
	.def	create_subroutine;	.scl	3;	.type	32;	.endef
create_subroutine:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rdi
	movq	%rdx, %rsi
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, %rbx
	movq	%rdi, (%rax)
	movq	%rsi, 8(%rax)
	call	create_list
	movq	%rax, 16(%rbx)
	call	create_list
	movq	%rax, 24(%rbx)
	call	create_list
	movq	%rax, 32(%rbx)
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.def	create_block;	.scl	3;	.type	32;	.endef
create_block:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rsi
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %rbx
	movq	%rsi, (%rax)
	call	create_list
	movq	%rax, 8(%rbx)
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.section .rdata,"dr"
	.align 8
.LC98:
	.ascii "[Warning] Unsupported argument type for create_arg: %d\12\0"
	.text
	.def	create_arg;	.scl	3;	.type	32;	.endef
create_arg:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movl	%ecx, %esi
	movq	%rdx, %rdi
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, %rbx
	movl	%esi, 16(%rax)
	movq	$0, 8(%rax)
	cmpl	$8, %esi
	ja	.L376
	movl	%esi, %esi
	leaq	.L378(%rip), %rdx
	movslq	(%rdx,%rsi,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L378:
	.long	.L385-.L378
	.long	.L384-.L378
	.long	.L383-.L378
	.long	.L382-.L378
	.long	.L381-.L378
	.long	.L380-.L378
	.long	.L379-.L378
	.long	.L377-.L378
	.long	.L377-.L378
	.text
.L385:
	movq	%rdi, (%rbx)
	movq	16(%rdi), %rax
	movq	%rax, 8(%rbx)
.L386:
	movb	$0, 20(%rbx)
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L384:
	movq	(%rdi), %rax
	movq	%rax, (%rbx)
	movq	name_int(%rip), %rax
	movq	%rax, 8(%rbx)
	jmp	.L386
.L383:
	movsd	(%rdi), %xmm0
	movsd	%xmm0, (%rbx)
	movq	name_float(%rip), %rax
	movq	%rax, 8(%rbx)
	jmp	.L386
.L382:
	movq	%rdi, (%rbx)
	movq	name_string(%rip), %rax
	movq	%rax, 8(%rbx)
	jmp	.L386
.L381:
	movzbl	(%rdi), %eax
	movb	%al, (%rbx)
	movq	name_bool(%rip), %rax
	movq	%rax, 8(%rbx)
	jmp	.L386
.L380:
	movq	$0, (%rbx)
	movq	name_void(%rip), %rax
	movq	%rax, 8(%rbx)
	jmp	.L386
.L379:
	movq	%rdi, (%rbx)
	jmp	.L386
.L377:
	movq	%rdi, (%rbx)
	movq	16(%rdi), %rax
	movq	%rax, 8(%rbx)
	jmp	.L386
.L376:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movl	%esi, %r8d
	leaq	.LC98(%rip), %rdx
	call	fprintf
	jmp	.L386
	.def	create_instruction;	.scl	3;	.type	32;	.endef
create_instruction:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movl	%ecx, %ebp
	movq	%rdx, %rdi
	movq	%r8, %rsi
	movq	%r9, %rbx
	movl	$32, %ecx
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
.LC99:
	.ascii "\0"
.LC100:
	.ascii "%s/%s\0"
	.text
	.def	absolute_path;	.scl	3;	.type	32;	.endef
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
	movl	$0, %r8d
	movq	%rbx, %rcx
	call	create_string_check
	movq	%rax, %rbx
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L391
	movl	$0, %edx
	jmp	.L398
.L414:
	movb	$47, (%rcx)
	cmpq	$1, %rdx
	jbe	.L411
.L393:
	leaq	-1(%rbx,%rdx), %rcx
	cmpb	$46, (%rcx)
	je	.L412
.L397:
	leaq	(%rbx,%rdx), %rcx
	cmpb	$47, (%rcx)
	jne	.L396
.L406:
	leaq	-1(%rdx), %rbp
	cmpb	$47, -1(%rbx,%rdx)
	jne	.L396
	leaq	1(%rbx,%rdx), %rax
	movq	%rsi, %r8
	subq	%rdx, %r8
	movq	%rax, %rdx
	call	memmove
	subq	$1, %rsi
	movq	%rbp, %rdx
	jmp	.L396
.L412:
	leaq	-2(%rdx), %rbp
	cmpb	$47, -2(%rbx,%rdx)
	jne	.L397
	leaq	1(%rbx,%rdx), %rax
	movq	%rsi, %r8
	subq	%rdx, %r8
	movq	%rax, %rdx
	call	memmove
	subq	$2, %rsi
	movq	%rbp, %rdx
.L395:
	testq	%rdx, %rdx
	jne	.L397
.L396:
	addq	$1, %rdx
	cmpq	%rsi, %rdx
	jnb	.L413
.L398:
	leaq	(%rbx,%rdx), %rcx
	movzbl	(%rcx), %eax
	cmpb	$92, %al
	je	.L414
	cmpq	$1, %rdx
	jbe	.L395
	cmpb	$47, %al
	jne	.L396
	jmp	.L393
.L413:
	cmpq	$2, %rsi
	jbe	.L399
	cmpb	$47, (%rbx)
	je	.L415
	movzbl	(%rbx), %eax
	subl	$65, %eax
	cmpb	$25, %al
	ja	.L391
.L405:
	cmpb	$58, 1(%rbx)
	jne	.L391
	jmp	.L390
.L415:
	movzbl	1(%rbx), %eax
	leal	-97(%rax), %edx
	cmpb	$25, %dl
	ja	.L401
	cmpb	$47, 2(%rbx)
	je	.L416
.L401:
	cmpb	$47, (%rbx)
	je	.L390
	jmp	.L391
.L416:
	subl	$32, %eax
	movb	%al, (%rbx)
	movb	$58, 1(%rbx)
	jmp	.L390
.L399:
	je	.L417
	testq	%rsi, %rsi
	jne	.L401
.L391:
	testq	%rdi, %rdi
	je	.L418
.L404:
	movq	%rdi, %rcx
	call	strlen
	leaq	2(%rsi,%rax), %rbp
	movl	$0, %r8d
	movq	%rbp, %rdx
	leaq	.LC99(%rip), %rcx
	call	create_string_check
	movq	%rax, %rsi
	movq	%rbx, %r9
	movq	%rdi, %r8
	leaq	.LC100(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movl	$1, %r8d
	movq	%rbp, %rdx
	movq	%rsi, %rcx
	call	create_string_check
	movq	%rax, %rcx
	movl	$0, %edx
	call	absolute_path
	movq	%rax, %rbx
.L390:
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L417:
	movzbl	(%rbx), %eax
	subl	$65, %eax
	cmpb	$25, %al
	jbe	.L405
	jmp	.L401
.L418:
	movl	$0, %edx
	movl	$0, %ecx
	call	getcwd
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L404
	jmp	.L390
.L411:
	testq	%rdx, %rdx
	je	.L396
	leaq	(%rbx,%rdx), %rcx
	jmp	.L406
	.section .rdata,"dr"
.LC101:
	.ascii "%zu/%zu bytes\0"
	.align 8
.LC102:
	.ascii "Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu\0"
	.text
	.def	get_info;	.scl	3;	.type	32;	.endef
get_info:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$64, %rsp
	movq	all_string_list(%rip), %rax
	testq	%rax, %rax
	je	.L422
	movl	$0, %ebx
.L421:
	addq	$1, %rbx
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L421
.L420:
	movl	$0, %r8d
	movl	$48, %edx
	leaq	.LC99(%rip), %rsi
	movq	%rsi, %rcx
	call	create_string_check
	movq	%rax, %rdi
	movq	struct_memory_count(%rip), %r9
	movq	struct_memory(%rip), %rax
	movq	struct_memory_used(%rip), %r8
	addq	8(%rax), %r8
	leaq	.LC101(%rip), %r12
	movq	%r12, %rdx
	movq	%rdi, %rcx
	call	sprintf
	movl	$0, %r8d
	movl	$48, %edx
	movq	%rsi, %rcx
	call	create_string_check
	movq	%rax, %rbp
	movq	string_memory_count(%rip), %r9
	movq	string_memory(%rip), %rax
	movq	string_memory_used(%rip), %r8
	addq	8(%rax), %r8
	movq	%r12, %rdx
	movq	%rbp, %rcx
	call	sprintf
	movl	$0, %r8d
	movl	$240, %edx
	movq	%rsi, %rcx
	call	create_string_check
	movq	%rax, %rsi
	movq	memoryBlockCount(%rip), %rax
	movq	%rax, 48(%rsp)
	movq	%rbx, 40(%rsp)
	movq	%rbp, 32(%rsp)
	movq	%rdi, %r9
	movl	$2, %r8d
	leaq	.LC102(%rip), %rdx
	movq	%rsi, %rcx
	call	sprintf
	movq	%rsi, %rax
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L422:
	movl	$0, %ebx
	jmp	.L420
	.section .rdata,"dr"
.LC103:
	.ascii "%s.%s\0"
	.text
	.def	make_method_name;	.scl	3;	.type	32;	.endef
make_method_name:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	call	strlen
	movq	%rax, %rbx
	movq	%rdi, %rcx
	call	strlen
	leaq	2(%rbx,%rax), %rdx
	movl	$1, %r8d
	leaq	.LC99(%rip), %rcx
	call	create_string_check
	movq	%rax, %rbx
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC103(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.section .rdata,"dr"
.LC104:
	.ascii "$%d-error\0"
.LC105:
	.ascii "$%c%zu\0"
	.text
	.def	create_var;	.scl	3;	.type	32;	.endef
create_var:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rsi
	movq	%rdx, %r12
	movl	%r8d, %ebp
	movq	%r9, %rdi
	testq	%rcx, %rcx
	je	.L428
	movl	$0, %r14d
	cmpl	$0, 32(%rdx)
	jne	.L429
	movq	24(%r9), %r14
	movq	24(%rdx), %rax
	movq	%rax, 24(%r9)
.L429:
	movq	8(%rdi), %rax
	testq	%rax, %rax
	je	.L430
	movq	24(%rax), %rcx
	testq	%rcx, %rcx
	je	.L431
	cmpq	$0, (%rcx)
	je	.L431
	cmpq	$0, 8(%rcx)
	je	.L431
	call	list_copy
	movq	%rax, %r13
.L432:
	movq	%r13, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L463
	cmpq	(%rbx), %rsi
	jne	.L432
	jmp	.L433
.L463:
	movq	8(%rdi), %rax
	testq	%rax, %rax
	je	.L430
.L431:
	movq	16(%rax), %rcx
	testq	%rcx, %rcx
	je	.L430
	cmpq	$0, (%rcx)
	je	.L430
	cmpq	$0, 8(%rcx)
	je	.L430
	call	list_copy
	movq	%rax, %r13
.L435:
	movq	%r13, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L430
	cmpq	(%rbx), %rsi
	jne	.L435
	jmp	.L433
.L430:
	cmpq	$0, 24(%rdi)
	je	.L437
	movq	(%rdi), %rax
	movq	(%rax), %rcx
	testq	%rcx, %rcx
	je	.L437
	cmpq	$0, (%rcx)
	je	.L437
	cmpq	$0, 8(%rcx)
	je	.L437
	call	list_copy
	movq	%rax, %r13
.L438:
	movq	%r13, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L437
	movq	24(%rdi), %rdx
	movq	(%rdx), %rdx
	cmpq	%rdx, 8(%rax)
	jne	.L438
	movq	(%rax), %rcx
	testq	%rcx, %rcx
	je	.L438
	cmpq	$0, (%rcx)
	je	.L438
	cmpq	$0, 8(%rcx)
	je	.L438
	call	list_copy
	movq	%rax, %r15
.L440:
	movq	%r15, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L438
	movq	(%rax), %rbx
	cmpq	(%rbx), %rsi
	jne	.L440
	jmp	.L433
.L437:
	movq	(%rdi), %rax
	movq	16(%rax), %rcx
	testq	%rcx, %rcx
	je	.L443
	cmpq	$0, (%rcx)
	je	.L443
	cmpq	$0, 8(%rcx)
	je	.L443
	call	list_copy
	movq	%rax, %r13
.L444:
	movq	%r13, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L443
	cmpq	(%rbx), %rsi
	jne	.L444
.L433:
	cmpl	$0, 32(%r12)
	je	.L459
	jmp	.L427
.L461:
	movl	$0, %ebx
.L459:
	movq	%r14, 24(%rdi)
	testq	%rbx, %rbx
	jne	.L427
	jmp	.L428
.L447:
	movq	48(%rdi), %rsi
	leaq	1(%rsi), %rax
	movq	%rax, 48(%rdi)
.L448:
	movl	$1, %r8d
	movl	$32, %edx
	leaq	.LC99(%rip), %rcx
	call	create_string_check
	movq	%rax, %rcx
	movq	%rax, 8(%rbx)
	cmpq	$-1, %rsi
	je	.L457
	movq	%rsi, %r9
	movl	%ebp, %r8d
	leaq	.LC105(%rip), %rdx
	call	sprintf
.L455:
	movq	%r12, 16(%rbx)
	andl	$-3, %ebp
	cmpl	$116, %ebp
	je	.L464
.L427:
	movq	%rbx, %rax
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
.L449:
	movq	56(%rdi), %rsi
	leaq	1(%rsi), %rax
	movq	%rax, 56(%rdi)
	jmp	.L448
.L450:
	movq	64(%rdi), %rsi
	leaq	1(%rsi), %rax
	movq	%rax, 64(%rdi)
	jmp	.L448
.L451:
	movq	72(%rdi), %rsi
	leaq	1(%rsi), %rax
	movq	%rax, 72(%rdi)
	jmp	.L448
.L452:
	movq	80(%rdi), %rsi
	leaq	1(%rsi), %rax
	movq	%rax, 80(%rdi)
	jmp	.L448
.L453:
	movq	88(%rdi), %rsi
	leaq	1(%rsi), %rax
	movq	%rax, 88(%rdi)
	jmp	.L448
.L464:
	movq	8(%rdi), %rax
	movq	24(%rax), %rcx
	movq	%rbx, %rdx
	call	list_append
	jmp	.L427
.L456:
	movl	$1, %r8d
	movl	$32, %edx
	leaq	.LC99(%rip), %rcx
	call	create_string_check
	movq	%rax, %rcx
	movq	%rax, 8(%rbx)
.L457:
	movl	%ebp, %r8d
	leaq	.LC104(%rip), %rdx
	call	sprintf
	jmp	.L455
.L443:
	cmpl	$0, 32(%r12)
	je	.L461
.L428:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, %rbx
	movq	%rsi, (%rax)
	leal	-97(%rbp), %eax
	cmpl	$21, %eax
	ja	.L456
	movl	%eax, %eax
	leaq	.L458(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L458:
	.long	.L447-.L458
	.long	.L452-.L458
	.long	.L456-.L458
	.long	.L456-.L458
	.long	.L456-.L458
	.long	.L453-.L458
	.long	.L456-.L458
	.long	.L456-.L458
	.long	.L456-.L458
	.long	.L456-.L458
	.long	.L456-.L458
	.long	.L456-.L458
	.long	.L456-.L458
	.long	.L456-.L458
	.long	.L456-.L458
	.long	.L449-.L458
	.long	.L456-.L458
	.long	.L456-.L458
	.long	.L456-.L458
	.long	.L451-.L458
	.long	.L456-.L458
	.long	.L450-.L458
	.text
	.def	load_rvalue;	.scl	3;	.type	32;	.endef
load_rvalue:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbx
	testq	%rcx, %rcx
	je	.L466
	movq	%rdx, %rsi
	cmpb	$0, 20(%rcx)
	jne	.L468
.L466:
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L468:
	movq	8(%rcx), %rdx
	movq	%rsi, %r9
	movl	$116, %r8d
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rdi
	movl	$0, %r9d
	movq	%rbx, %r8
	movq	%rax, %rdx
	movl	$23, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%rdi, %rbx
	jmp	.L466
	.def	search_name_use_strcmp;	.scl	3;	.type	32;	.endef
search_name_use_strcmp:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rbp
	movq	%rdx, %rdi
	testq	%rcx, %rcx
	je	.L474
.L473:
	movq	8(%rbp), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	je	.L471
.L472:
	movq	8(%rbx), %rsi
	movq	8(%rsi), %rcx
	movq	%rdi, %rdx
	call	strcmp
	testl	%eax, %eax
	je	.L469
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L472
.L471:
	movq	0(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L473
	movq	%rbp, %rsi
	jmp	.L469
.L474:
	movq	%rcx, %rsi
.L469:
	movq	%rsi, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC106:
	.ascii "/\0"
	.align 8
.LC107:
	.ascii "Warning: Path component too long, truncating to %zu characters\12\0"
.LC108:
	.ascii ".\0"
.LC109:
	.ascii "..\0"
	.text
	.def	create_file;	.scl	3;	.type	32;	.endef
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
	movl	$0, %r8d
	leaq	.LC99(%rip), %rcx
	call	create_string_check
	movq	%rax, %r13
	movq	24(%r14), %rdx
	movq	%rax, %rcx
	call	strcpy
	testq	%rdi, %rdi
	je	.L500
	movl	$0, %ebx
	movq	$0, 40(%rsp)
	cmpb	$47, 0(%r13)
	jne	.L479
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %rsi
	movq	%rax, 40(%rsp)
	movl	$1, %r8d
	movl	$1, %edx
	leaq	.LC106(%rip), %rcx
	call	create_string_check
	movq	%rax, (%rsi)
	movq	$0, 8(%rsi)
	movl	$1, %ebx
	jmp	.L479
.L513:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%r15, %r8
	leaq	.LC107(%rip), %rdx
	call	fprintf
	movl	$255, %r15d
	jmp	.L483
.L502:
	movq	%rsi, %rax
	jmp	.L487
.L503:
	movq	%rdx, %rax
.L487:
	testq	%rax, %rax
	je	.L482
	movq	8(%rax), %rdx
	movq	40(%rsp), %rcx
	cmpq	%rcx, %rdx
	jne	.L503
	movq	$0, 8(%rax)
	movq	%rax, 40(%rsp)
	jmp	.L482
.L486:
	testq	%rsi, %rsi
	jne	.L482
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %rsi
	movl	$1, %r8d
	movl	$2, %edx
	leaq	.LC109(%rip), %rcx
	call	create_string_check
	movq	%rax, (%rsi)
	movq	$0, 8(%rsi)
	movq	%rsi, 40(%rsp)
	jmp	.L482
.L485:
	cmpb	$0, 48(%rsp)
	jne	.L511
.L482:
	leaq	1(%rbx), %r12
.L481:
	leaq	1(%rbx), %rax
	cmpq	%rbx, %rdi
	je	.L512
	movq	%rax, %rbx
.L490:
	cmpq	%rbx, %rdi
	je	.L480
	cmpb	$47, 0(%r13,%rbx)
	jne	.L481
.L480:
	cmpq	%rbx, %r12
	jnb	.L482
	movq	%rbx, %r15
	subq	%r12, %r15
	cmpq	$255, %r15
	ja	.L513
.L483:
	leaq	0(%r13,%r12), %rdx
	movq	%r15, %r8
	movq	32(%rsp), %r12
	movq	%r12, %rcx
	call	strncpy
	movb	$0, 48(%rsp,%r15)
	leaq	.LC108(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L482
	leaq	.LC109(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L485
	movq	40(%rsp), %r15
	testq	%r15, %r15
	je	.L486
	cmpq	%rsi, %r15
	je	.L486
	movq	(%r15), %rcx
	leaq	.LC109(%rip), %rdx
	call	strcmp
	testl	%eax, %eax
	jne	.L502
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %r12
	movl	$1, %r8d
	movl	$2, %edx
	leaq	.LC109(%rip), %rcx
	call	create_string_check
	movq	%rax, (%r12)
	movq	$0, 8(%r12)
	movq	%r12, 8(%r15)
	movq	%r12, 40(%rsp)
	jmp	.L482
.L511:
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %r12
	leaq	48(%rsp), %rcx
	movl	$1, %r8d
	movq	%r15, %rdx
	call	create_string_check
	movq	%rax, (%r12)
	movq	$0, 8(%r12)
	movq	40(%rsp), %rax
	testq	%rax, %rax
	je	.L489
	movq	%r12, 8(%rax)
.L489:
	testq	%rsi, %rsi
	je	.L504
	movq	%r12, 40(%rsp)
	jmp	.L482
.L504:
	movq	%r12, 40(%rsp)
	movq	%r12, %rsi
	jmp	.L482
.L512:
	movq	%rsi, (%r14)
	movq	40(%rsp), %rax
	testq	%rax, %rax
	je	.L491
	movq	(%rax), %rdi
	movl	$46, %edx
	movq	%rdi, %rcx
	call	strrchr
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L492
	cmpq	%rax, %rdi
	je	.L492
	movq	%rax, %rdx
	subq	%rdi, %rdx
	movl	$1, %r8d
	movq	%rdi, %rcx
	call	create_string_check
	movq	%rax, 16(%r14)
	movq	%rbx, %rcx
	call	strlen
	movq	%rax, %rdx
	movl	$1, %r8d
	movq	%rbx, %rcx
	call	create_string_check
	movq	%rax, 40(%rsp)
	jmp	.L493
.L492:
	movq	%rdi, 16(%r14)
	movq	$0, 40(%rsp)
.L493:
	movq	40(%rsp), %rax
	movq	%rax, 8(%r14)
	testq	%rsi, %rsi
	je	.L494
	movq	%rsi, %rbx
	movl	$0, %edi
	movl	$0, %r12d
.L495:
	movq	(%rbx), %rcx
	call	strlen
	addq	%rax, %r12
	movq	%rdi, %rax
	addq	$1, %rdi
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L495
	addq	%r12, %rax
	cmpq	$1, %rdi
	cmova	%rax, %r12
	leaq	1(%r12), %rdx
	movl	$0, %r8d
	leaq	.LC99(%rip), %rcx
	call	create_string_check
	movq	%rax, %rbx
	movb	$0, (%rax)
	movl	$1, %eax
	leaq	.LC106(%rip), %r12
	movl	$0, %edi
	jmp	.L498
.L491:
	movq	$0, 16(%r14)
	jmp	.L493
.L497:
	movq	(%rsi), %rdx
	movq	%rbx, %rcx
	call	strcat
	movq	8(%rsi), %rsi
	movl	%edi, %eax
	testq	%rsi, %rsi
	je	.L499
.L498:
	testb	%al, %al
	jne	.L497
	movq	(%rsi), %rcx
	movq	%r12, %rdx
	call	strcmp
	testl	%eax, %eax
	je	.L497
	cmpb	$0, (%rbx)
	je	.L497
	movq	%rbx, %rcx
	call	strlen
	cmpb	$47, -1(%rbx,%rax)
	je	.L497
	movw	$47, (%rbx,%rax)
	jmp	.L497
.L494:
	movl	$0, %r8d
	movl	$1, %edx
	leaq	.LC99(%rip), %rcx
	call	create_string_check
	movq	%rax, %rbx
	movb	$0, (%rax)
.L499:
	movq	%rbx, %rcx
	call	strlen
	movq	%rax, %rdx
	movl	$1, %r8d
	movq	%rbx, %rcx
	call	create_string_check
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
.L500:
	movq	%rdi, %rbx
	movq	$0, 40(%rsp)
.L479:
	movq	40(%rsp), %rsi
	movq	%rbx, %r12
	leaq	48(%rsp), %rax
	movq	%rax, 32(%rsp)
	jmp	.L490
	.def	get_file_dir;	.scl	3;	.type	32;	.endef
get_file_dir:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L522
	movq	%rcx, %rbp
	movl	$0, %edi
	movl	$0, %esi
	jmp	.L517
.L525:
	movq	(%rax), %rcx
	call	strlen
	addq	%rax, %rsi
	addq	$1, %rdi
	movq	%rbx, %rax
.L517:
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L525
	testq	%rdi, %rdi
	je	.L514
	leaq	-1(%rsi,%rdi), %rax
	cmpq	$1, %rdi
	cmova	%rax, %rsi
	leaq	1(%rsi), %rdx
	movl	$0, %r8d
	leaq	.LC99(%rip), %rcx
	call	create_string_check
	movq	%rax, %rsi
	movb	$0, (%rax)
	movq	0(%rbp), %rbx
	testq	%rbx, %rbx
	je	.L519
	movl	$1, %eax
	leaq	.LC106(%rip), %rbp
	movl	$0, %edi
	jmp	.L521
.L520:
	movq	(%rbx), %rdx
	movq	%rsi, %rcx
	call	strcat
	movq	8(%rbx), %rbx
	movl	%edi, %eax
	testq	%rbx, %rbx
	je	.L519
.L521:
	cmpq	$0, 8(%rbx)
	je	.L519
	testb	%al, %al
	jne	.L520
	movq	(%rbx), %rcx
	movq	%rbp, %rdx
	call	strcmp
	testl	%eax, %eax
	je	.L520
	cmpb	$0, (%rsi)
	je	.L520
	movq	%rsi, %rcx
	call	strlen
	cmpb	$47, -1(%rsi,%rax)
	je	.L520
	movw	$47, (%rsi,%rax)
	jmp	.L520
.L519:
	movq	%rsi, %rcx
	call	strlen
	movq	%rax, %rdx
	movl	$1, %r8d
	movq	%rsi, %rcx
	call	create_string_check
	movq	%rax, %rbx
.L514:
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L522:
	movq	%rax, %rbx
	jmp	.L514
	.section .rdata,"dr"
.LC110:
	.ascii "%s/%s%s\0"
.LC111:
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
	leaq	.LC99(%rip), %rbp
	cmovne	%rax, %rbp
	movq	8(%rbx), %r12
	testq	%r12, %r12
	je	.L537
	movq	%rbp, %rcx
	call	strlen
	movq	%rax, %rdi
	movq	16(%rbx), %rcx
	call	strlen
	leaq	1(%rdi,%rax), %rdi
	movq	%r12, %rcx
	call	strlen
	leaq	(%rax,%rdi), %rdx
.L532:
	addq	$1, %rdx
	movl	$0, %r8d
	leaq	.LC99(%rip), %rcx
	call	create_string_check
	movq	%rax, %rdi
	testq	%rsi, %rsi
	je	.L530
	cmpb	$0, 0(%rbp)
	jne	.L538
.L530:
	movq	%r12, %r9
	movq	16(%rbx), %r8
	leaq	.LC111(%rip), %rdx
	movq	%rdi, %rcx
	call	sprintf
.L531:
	movq	%rdi, %rcx
	call	strlen
	movq	%rax, %rdx
	movl	$1, %r8d
	movq	%rdi, %rcx
	call	create_string_check
	movq	%rax, 24(%rbx)
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L538:
	movq	%r12, 32(%rsp)
	movq	16(%rbx), %r9
	movq	%rbp, %r8
	leaq	.LC110(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	jmp	.L531
.L537:
	movq	%rbp, %rcx
	call	strlen
	movq	%rax, %rdi
	movq	16(%rbx), %rcx
	call	strlen
	leaq	1(%rdi,%rax), %rdx
	leaq	.LC99(%rip), %r12
	jmp	.L532
	.def	read_source;	.scl	3;	.type	32;	.endef
read_source:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rdi
	movq	%rdx, %rsi
	movl	$2, %r8d
	movl	$0, %edx
	call	fseek
	movq	%rdi, %rcx
	call	ftell
	cltq
	movq	%rax, (%rsi)
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rdi, %rcx
	call	fseek
	movq	(%rsi), %rax
	leaq	1(%rax), %rdx
	movl	$0, %r8d
	leaq	.LC99(%rip), %rcx
	call	create_string_check
	movq	%rax, %rbx
	movq	%rdi, %r9
	movq	(%rsi), %r8
	movl	$1, %edx
	movq	%rax, %rcx
	call	fread
	movb	$0, (%rbx,%rax)
	movq	%rax, (%rsi)
	testq	%rax, %rax
	je	.L539
	movl	$0, %eax
	jmp	.L542
.L541:
	addq	$1, %rax
	cmpq	(%rsi), %rax
	jnb	.L539
.L542:
	movzbl	(%rbx,%rax), %edx
	andl	$-5, %edx
	cmpb	$9, %dl
	jne	.L541
	movb	$32, (%rbx,%rax)
	jmp	.L541
.L539:
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.section .rdata,"dr"
	.align 8
.LC113:
	.ascii "[Warning] Unsupported type for negation: %s\12\0"
	.align 8
.LC114:
	.ascii "[Warning] Unsupported primary type for tac_primary: %d\12\0"
	.text
	.def	tac_primary;	.scl	3;	.type	32;	.endef
tac_primary:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$48, %rsp
	movl	8(%rcx), %ebx
	cmpl	$8, %ebx
	ja	.L546
	movq	%rdx, %rsi
	movl	%ebx, %ebx
	leaq	.L548(%rip), %r8
	movslq	(%r8,%rbx,4), %rax
	addq	%r8, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L548:
	.long	.L556-.L548
	.long	.L555-.L548
	.long	.L554-.L548
	.long	.L553-.L548
	.long	.L552-.L548
	.long	.L551-.L548
	.long	.L550-.L548
	.long	.L549-.L548
	.long	.L547-.L548
	.text
.L556:
	movq	(%rcx), %rcx
	movl	$10, %r8d
	movl	$0, %edx
	call	strtoll
	movq	%rax, 40(%rsp)
	leaq	40(%rsp), %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rax, %rbx
.L545:
	movq	%rbx, %rax
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L555:
	movq	(%rcx), %rcx
	movl	$0, %edx
	call	strtod
	movsd	%xmm0, 40(%rsp)
	leaq	40(%rsp), %rdx
	movl	$2, %ecx
	call	create_arg
	movq	%rax, %rbx
	jmp	.L545
.L554:
	movq	(%rcx), %rdx
	movl	$3, %ecx
	call	create_arg
	movq	%rax, %rbx
	jmp	.L545
.L553:
	movb	$1, 40(%rsp)
	leaq	40(%rsp), %rdx
	movl	$4, %ecx
	call	create_arg
	movq	%rax, %rbx
	jmp	.L545
.L552:
	movb	$0, 40(%rsp)
	leaq	40(%rsp), %rdx
	movl	$4, %ecx
	call	create_arg
	movq	%rax, %rbx
	jmp	.L545
.L551:
	movq	(%rcx), %rcx
	call	tac_expression
	movq	%rax, %rbx
	jmp	.L545
.L550:
	movq	(%rcx), %rcx
	call	tac_primary
	movq	%rax, %rcx
	movq	%rsi, %rdx
	call	load_rvalue
	movq	%rax, %rdi
	movq	%rsi, %r9
	movl	$116, %r8d
	movq	name_bool(%rip), %rdx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rbx
	movl	$0, %r9d
	movq	%rdi, %r8
	movq	%rax, %rdx
	movl	$13, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L545
.L549:
	movq	(%rcx), %rcx
	call	tac_primary
	movq	%rax, %rcx
	movq	%rsi, %rdx
	call	load_rvalue
	movq	%rax, %rdi
	movq	8(%rax), %rdx
	movq	%rsi, %r9
	movl	$116, %r8d
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rbx
	movq	$0, 32(%rsp)
	movq	.LC112(%rip), %rax
	movq	%rax, 40(%rsp)
	movq	8(%rdi), %rax
	cmpq	name_int(%rip), %rax
	je	.L563
	cmpq	name_float(%rip), %rax
	je	.L564
	movq	8(%rax), %rbx
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rbx, %r8
	leaq	.LC113(%rip), %rdx
	call	fprintf
	movl	$0, %ebx
	jmp	.L545
.L563:
	leaq	32(%rsp), %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rax, %r8
	movq	%rdi, %r9
	movq	%rbx, %rdx
	movl	$1, %ecx
	call	create_instruction
	movq	%rax, %rdx
	jmp	.L559
.L564:
	leaq	40(%rsp), %rdx
	movl	$2, %ecx
	call	create_arg
	movq	%rax, %r8
	movq	%rdi, %r9
	movq	%rbx, %rdx
	movl	$2, %ecx
	call	create_instruction
	movq	%rax, %rdx
.L559:
	movq	16(%rsi), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L545
.L547:
	movq	(%rcx), %rcx
	call	tac_variable_access
	movq	%rax, %rbx
	jmp	.L545
.L546:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movl	%ebx, %r8d
	leaq	.LC114(%rip), %rdx
	call	fprintf
	movl	$0, %ebx
	jmp	.L545
	.section .rdata,"dr"
	.align 8
.LC115:
	.ascii "[Warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.def	tac_expression;	.scl	3;	.type	32;	.endef
tac_expression:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rsi
	movq	%rdx, %rbx
	cmpl	$19, 24(%rcx)
	je	.L593
	movq	16(%rcx), %rcx
	call	tac_expression
	movq	%rax, %rcx
	movq	%rbx, %rdx
	call	load_rvalue
	movq	%rax, %r12
	movl	24(%rsi), %ebp
	cmpl	$18, %ebp
	ja	.L568
	movl	%ebp, %eax
	leaq	.L570(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L570:
	.long	.L574-.L570
	.long	.L573-.L570
	.long	.L589-.L570
	.long	.L571-.L570
	.long	.L569-.L570
	.long	.L572-.L570
	.long	.L572-.L570
	.long	.L572-.L570
	.long	.L572-.L570
	.long	.L572-.L570
	.long	.L572-.L570
	.long	.L572-.L570
	.long	.L572-.L570
	.long	.L575-.L570
	.long	.L574-.L570
	.long	.L573-.L570
	.long	.L589-.L570
	.long	.L571-.L570
	.long	.L569-.L570
	.text
.L593:
	movq	8(%rcx), %rcx
	call	tac_primary
	movq	%rax, %rsi
	jmp	.L565
.L571:
	movl	$3, %ebp
.L572:
	movq	(%rsi), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rdi
	movl	24(%rsi), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	jbe	.L587
.L584:
	movq	8(%rdi), %rdx
	movq	%rbx, %r9
	movl	$116, %r8d
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rsi
	movq	%rbx, %rdx
	movq	%rdi, %rcx
	call	load_rvalue
	movq	%rax, %r8
	movq	%r12, %r9
	movq	%rsi, %rdx
	movl	%ebp, %ecx
	call	create_instruction
	movq	%rax, %rdx
	jmp	.L586
.L569:
	movl	$4, %ebp
	jmp	.L572
.L568:
	movl	$25, %ebp
	jmp	.L572
.L574:
	movq	(%rsi), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rdi
	movl	24(%rsi), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L590
	movl	$0, %ebp
.L587:
	movq	8(%rdi), %rdx
	movq	%rbx, %r9
	movl	$116, %r8d
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rsi
	movq	%rbx, %rdx
	movq	%rdi, %rcx
	call	load_rvalue
	movq	%rax, %r8
	movq	%r12, %r9
	movq	%rsi, %rdx
	movl	%ebp, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L588:
	cmpl	$0, 16(%rdi)
	jne	.L594
.L585:
	movl	$0, %r9d
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movl	$14, %ecx
	call	create_instruction
	movq	%rax, %rdx
	cmpb	$0, 20(%rdi)
	jne	.L595
.L586:
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L565:
	movq	%rsi, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L594:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %r9
	movl	$57, %r8d
	movl	$1, %edx
	leaq	.LC115(%rip), %rcx
	call	fwrite
	jmp	.L585
.L595:
	movl	$0, %r9d
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movl	$24, %ecx
	call	create_instruction
	movq	%rax, %rdx
	jmp	.L586
.L590:
	movl	$0, %ebp
	jmp	.L584
.L573:
	movl	$1, %ebp
	jmp	.L572
.L589:
	movl	$2, %ebp
	jmp	.L572
.L575:
	movq	(%rsi), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rdi
	movl	24(%rsi), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L596
	movq	%r12, %rsi
	jmp	.L588
.L596:
	movl	$14, %ebp
	jmp	.L584
	.section .rdata,"dr"
	.align 8
.LC116:
	.ascii "Error: create_attribute received NULL table\12\0"
	.align 8
.LC117:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
	.text
	.def	tac_variable;	.scl	3;	.type	32;	.endef
tac_variable:
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$48, %rsp
	movq	%rcx, %rsi
	movq	%rdx, %rbx
	testb	%r8b, %r8b
	je	.L598
	movq	(%rdx), %rax
	movq	(%rax), %rcx
	call	list_pop_back
	movq	%rax, %rdi
	movq	(%rbx), %rax
	movq	(%rax), %rcx
	movq	%rdi, %rdx
	call	list_append
	movq	(%rsi), %r12
	movq	8(%rsi), %rbp
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, %rsi
	movq	%rbx, %r9
	movl	$97, %r8d
	movq	%r12, %rdx
	movq	%rbp, %rcx
	call	create_var
	movq	%rax, (%rsi)
	movq	%r12, 8(%rsi)
	movq	$0, 16(%rsi)
	testq	%rdi, %rdi
	jne	.L607
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %r9
	movl	$44, %r8d
	movl	$1, %edx
	leaq	.LC116(%rip), %rcx
	call	fwrite
.L600:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %r9
	movl	$63, %r8d
	movl	$1, %edx
	leaq	.LC117(%rip), %rcx
	call	fwrite
	jmp	.L597
.L607:
	movq	16(%rdi), %rax
	movq	%rax, 16(%rsi)
	movq	%r12, %rcx
	call	get_type_size
	addq	%rax, 16(%rdi)
	movq	(%rdi), %rcx
	testq	%rcx, %rcx
	je	.L600
	movq	%rsi, %rdx
	call	list_append
	jmp	.L597
.L598:
	movq	(%rcx), %rdx
	movq	8(%rcx), %rcx
	movq	%rbx, %r9
	movl	$118, %r8d
	call	create_var
	movq	%rax, %rdi
	movq	16(%rsi), %rcx
	testq	%rcx, %rcx
	je	.L603
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rcx
	movq	%rbx, %rdx
	call	load_rvalue
	movq	%rax, %rsi
.L604:
	movq	%rdi, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rdx
	movl	$0, %r9d
	movq	%rsi, %r8
	movl	$14, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L597:
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L603:
	movq	$0, 40(%rsp)
	leaq	40(%rsp), %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rax, %rsi
	jmp	.L604
	.section .rdata,"dr"
	.align 8
.LC118:
	.ascii "[Warning] 'break' statement used outside of loop\12\0"
	.align 8
.LC119:
	.ascii "[Warning] 'continue' statement used outside of loop\12\0"
	.align 8
.LC120:
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
	movl	8(%rcx), %esi
	cmpl	$7, %esi
	ja	.L609
	movq	%rcx, %rdi
	movq	%rdx, %rbx
	movl	%esi, %esi
	leaq	.L611(%rip), %rdx
	movslq	(%rdx,%rsi,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L611:
	.long	.L618-.L611
	.long	.L617-.L611
	.long	.L616-.L611
	.long	.L615-.L611
	.long	.L614-.L611
	.long	.L613-.L611
	.long	.L612-.L611
	.long	.L610-.L611
	.text
.L618:
	movq	(%rcx), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rcx
	movq	%rbx, %rdx
	call	load_rvalue
.L608:
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
.L617:
	movq	(%rcx), %rcx
	movl	$0, %r8d
	movq	%rbx, %rdx
	call	tac_variable
	jmp	.L608
.L616:
	movq	(%rcx), %r12
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdi
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rsi
	movq	16(%r12), %rax
	testq	%rax, %rax
	je	.L620
	cmpq	$0, (%rax)
	je	.L620
	cmpq	$0, 8(%rax)
	je	.L620
.L621:
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %r14
.L622:
	movq	%r14, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %r15
	movq	(%r12), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rcx
	movq	%rbx, %rdx
	call	load_rvalue
	movq	%rax, %rbp
	movq	%rsi, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %r13
	movq	%rdi, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %r8
	movq	%r13, %r9
	movq	%rbp, %rdx
	movl	$19, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%rdi, %rcx
	call	create_block
	movq	%rax, %rdi
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	movq	%rdi, %rdx
	call	list_append
	movq	%rdi, 16(%rbx)
	movq	8(%r12), %rcx
	call	list_copy
	movq	%rax, %rdi
.L623:
	movq	%rdi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L657
	movq	%rbx, %rdx
	call	tac_statement
	jmp	.L623
.L620:
	movq	24(%r12), %rax
	movq	%rsi, %r14
	testq	%rax, %rax
	je	.L622
	cmpq	$0, (%rax)
	je	.L622
	cmpq	$0, 8(%rax)
	jne	.L621
	jmp	.L622
.L657:
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%r15, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	16(%r12), %rcx
	testq	%rcx, %rcx
	je	.L625
	cmpq	$0, (%rcx)
	je	.L625
	cmpq	$0, 8(%rcx)
	je	.L625
	call	list_copy
	movq	%rax, %r13
	jmp	.L626
.L627:
	movq	24(%r12), %rax
	testq	%rax, %rax
	je	.L653
	cmpq	$0, (%rax)
	je	.L654
	cmpq	$0, 8(%rax)
	cmove	%r14, %rsi
	jmp	.L628
.L653:
	movq	%r14, %rsi
	jmp	.L628
.L654:
	movq	%r14, %rsi
	jmp	.L628
.L658:
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%r15, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L626:
	movq	%r13, %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L625
	movq	%rsi, %rcx
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	%rsi, 16(%rbx)
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rbp
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rsi
	movq	(%rdi), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rcx
	movq	%rbx, %rdx
	call	load_rvalue
	movq	%rax, 32(%rsp)
	testq	%r13, %r13
	je	.L627
	cmpq	$0, 0(%r13)
	je	.L627
	cmpq	$0, 8(%r13)
	je	.L627
.L628:
	movq	%rsi, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, 40(%rsp)
	movq	%rbp, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %r8
	movq	40(%rsp), %r9
	movq	32(%rsp), %rdx
	movl	$19, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%rbp, %rcx
	call	create_block
	movq	%rax, %rbp
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	movq	%rbp, %rdx
	call	list_append
	movq	%rbp, 16(%rbx)
	movq	8(%rdi), %rcx
	call	list_copy
	movq	%rax, %rdi
.L629:
	movq	%rdi, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L658
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	tac_statement
	jmp	.L629
.L625:
	movq	24(%r12), %rax
	testq	%rax, %rax
	je	.L632
	cmpq	$0, (%rax)
	je	.L632
	cmpq	$0, 8(%rax)
	je	.L632
	movq	%rsi, %rcx
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	%rsi, 16(%rbx)
	movq	24(%r12), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L633
.L634:
	movq	%rbx, %rdx
	call	tac_statement
.L633:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L634
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%r15, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L632:
	movq	%r14, %rcx
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	%rsi, 16(%rbx)
	jmp	.L608
.L615:
	movq	(%rcx), %r12
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdi
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%rdi, %rcx
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	%rsi, 16(%rbx)
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rsi
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rbp
	movq	(%r12), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rcx
	movq	%rbx, %rdx
	call	load_rvalue
	movq	%rax, %r13
	movq	%rbp, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %r14
	movq	%rsi, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %r8
	movq	%r14, %r9
	movq	%r13, %rdx
	movl	$19, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%rsi, %rcx
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	%rsi, 16(%rbx)
	movq	%rdi, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	40(%rbx), %rcx
	call	list_append
	movq	%rbp, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	32(%rbx), %rcx
	call	list_append
	movq	8(%r12), %rcx
	call	list_copy
	movq	%rax, %rsi
.L635:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L659
	movq	%rbx, %rdx
	call	tac_statement
	jmp	.L635
.L659:
	movq	40(%rbx), %rcx
	call	list_pop_back
	movq	32(%rbx), %rcx
	call	list_pop_back
	movq	%rdi, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%rbp, %rcx
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	%rsi, 16(%rbx)
	jmp	.L608
.L614:
	movq	(%rcx), %rdi
	movq	(%rdi), %rcx
	testq	%rcx, %rcx
	je	.L637
	movl	$0, %r8d
	movq	%rbx, %rdx
	call	tac_variable
.L637:
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rbp
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %r13
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %r12
	cmpq	$0, 8(%rdi)
	je	.L638
	movq	%rbp, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%rbp, %rcx
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	%rsi, 16(%rbx)
	movq	8(%rdi), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rcx
	movq	%rbx, %rdx
	call	load_rvalue
	movq	%rax, %rsi
	movq	%r12, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %r14
	movq	%r13, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %r8
	movq	%r14, %r9
	movq	%rsi, %rdx
	movl	$19, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L639:
	movq	%r13, %rcx
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	%rsi, 16(%rbx)
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %r14
	cmpq	$0, 16(%rdi)
	je	.L640
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	40(%rbx), %rcx
	call	list_append
.L641:
	movq	%r12, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	32(%rbx), %rcx
	call	list_append
	movq	24(%rdi), %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L643
.L638:
	movq	%r13, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L639
.L640:
	cmpq	$0, 8(%rdi)
	je	.L642
	movq	%rbp, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	40(%rbx), %rcx
	call	list_append
	jmp	.L641
.L642:
	movq	%r13, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	40(%rbx), %rcx
	call	list_append
	jmp	.L641
.L644:
	movq	%rbx, %rdx
	call	tac_statement
.L643:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L644
	movq	40(%rbx), %rcx
	call	list_pop_back
	movq	32(%rbx), %rcx
	call	list_pop_back
	cmpq	$0, 16(%rdi)
	je	.L645
	movq	%r14, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%r14, %rcx
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	%rsi, 16(%rbx)
	movq	16(%rdi), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rcx
	movq	%rbx, %rdx
	call	load_rvalue
.L645:
	movq	%rbp, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	cmpq	$0, 8(%rdi)
	je	.L660
.L646:
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	movq	%r12, %rcx
	call	create_block
	movq	%rax, %rsi
	movq	8(%rbx), %rax
	movq	32(%rax), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	%rsi, 16(%rbx)
	jmp	.L608
.L660:
	movq	%r13, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	jmp	.L646
.L613:
	movl	$0, %edx
	movl	$5, %ecx
	call	create_arg
	movq	(%rdi), %rcx
	testq	%rcx, %rcx
	je	.L647
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rcx
	movq	%rbx, %rdx
	call	load_rvalue
.L647:
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$21, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L608
.L612:
	movq	32(%rbx), %rax
	testq	%rax, %rax
	je	.L648
	cmpq	$0, (%rax)
	je	.L648
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L648
	movq	8(%rax), %rdx
	testq	%rdx, %rdx
	je	.L648
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L608
.L648:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %r9
	movl	$49, %r8d
	movl	$1, %edx
	leaq	.LC118(%rip), %rcx
	call	fwrite
	jmp	.L608
.L610:
	movq	40(%rbx), %rax
	testq	%rax, %rax
	je	.L649
	cmpq	$0, (%rax)
	je	.L649
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L649
	movq	8(%rax), %rdx
	testq	%rdx, %rdx
	je	.L649
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L608
.L649:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %r9
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC119(%rip), %rcx
	call	fwrite
	jmp	.L608
.L609:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movl	%esi, %r8d
	leaq	.LC120(%rip), %rdx
	call	fprintf
	jmp	.L608
	.section .rdata,"dr"
	.align 8
.LC121:
	.ascii "[Warning] Constructor '%s' does not start with 'self' initialization\12\0"
	.align 8
.LC122:
	.ascii "[Warning] Unsupported class member type for tac_class: %d\12\0"
	.text
	.def	tac_class;	.scl	3;	.type	32;	.endef
tac_class:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rsi
	movq	%rdx, %rbx
	movq	%rcx, 24(%rdx)
	movq	8(%rcx), %rcx
	call	list_copy
	movq	%rax, %r12
	movq	(%rsi), %rdi
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, %rsi
	call	create_list
	movq	%rax, (%rsi)
	movq	%rdi, 8(%rsi)
	movq	$0, 16(%rsi)
	movq	(%rbx), %rax
	movq	(%rax), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	__imp___acrt_iob_func(%rip), %r14
	leaq	.LC122(%rip), %r13
	jmp	.L662
.L663:
	movq	(%rax), %rbp
	movq	8(%rbp), %rdx
	movq	0(%rbp), %rcx
	call	create_subroutine
	movq	%rax, %rsi
	movq	%rax, 8(%rbx)
	movq	(%rbx), %rax
	movq	24(%rax), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	16(%rbp), %rcx
	call	list_copy
	movq	%rax, %rdi
	jmp	.L666
.L667:
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	movq	%rbx, %r9
	movl	$112, %r8d
	call	create_var
	movq	%rax, %rdx
	movq	16(%rsi), %rcx
	call	list_append
.L666:
	movq	%rdi, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L667
	movq	%rbx, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rcx
	call	create_block
	movq	%rax, %rdi
	movq	32(%rsi), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	%rdi, 16(%rbx)
	movq	24(%rbp), %rcx
	call	list_copy
	movq	%rax, %rsi
	movq	24(%rbx), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rcx
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	call	make_method_name
	movq	%rax, %rdx
	movq	0(%rbp), %rax
	movq	8(%rax), %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L677
.L672:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L678
	movq	%rbx, %rdx
	call	tac_statement
	jmp	.L672
.L677:
	movq	%rsi, %rcx
	call	list_pop
	cmpl	$0, 8(%rax)
	jne	.L669
	movq	(%rax), %rax
	cmpl	$19, 24(%rax)
	jne	.L669
	movq	8(%rax), %rax
	cmpl	$8, 8(%rax)
	jne	.L669
	movq	(%rax), %rax
	cmpl	$0, 16(%rax)
	je	.L670
.L669:
	movq	0(%rbp), %rax
	movq	8(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, %r8
	leaq	.LC121(%rip), %rdx
	call	fprintf
	jmp	.L662
.L670:
	movq	8(%rax), %r15
	movq	24(%rbx), %rax
	leaq	24(%rax), %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rax, %rbp
	movq	(%r15), %rdx
	movq	%rbx, %r9
	movl	$118, %r8d
	movq	%r15, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rdx
	movl	$0, %r9d
	movq	%rbp, %r8
	movl	$18, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	8(%rdi), %rcx
	call	list_append
	jmp	.L672
.L678:
	movq	$0, 8(%rbx)
	jmp	.L662
.L664:
	movq	(%rax), %rcx
	movl	$1, %r8d
	movq	%rbx, %rdx
	call	tac_variable
.L662:
	movq	%r12, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L679
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L663
	cmpl	$1, %esi
	je	.L664
	movl	$2, %ecx
	call	*%r14
	movq	%rax, %rcx
	movl	%esi, %r8d
	movq	%r13, %rdx
	call	fprintf
	jmp	.L662
.L679:
	movq	$0, 24(%rbx)
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
	.align 8
.LC123:
	.ascii "[Warning] Unsupported variable access with NULL base\12\0"
	.align 8
.LC124:
	.ascii "[Warning] Failed to generate variable access for base\12\0"
	.align 8
.LC125:
	.ascii "[Warning] Attempting to access attribute of non-object type: %s\12\0"
	.align 8
.LC126:
	.ascii "[Warning] Attribute '%s' not found in type '%s'\12\0"
	.align 8
.LC127:
	.ascii "[Warning] Attempting to access function '%s' as attribute of type '%s'\12\0"
	.align 8
.LC128:
	.ascii "[Warning] Symbol '%s' in type '%s' is not an attribute\12\0"
.LC129:
	.ascii "arr\0"
	.align 8
.LC130:
	.ascii "[Warning] Attempting to index non-array type: %s\12\0"
	.align 8
.LC131:
	.ascii "[Warning] Failed to generate variable access for index\12\0"
	.align 8
.LC132:
	.ascii "[Warning] Attempting to call non-function, kind: %u, type name: %s\12\0"
	.align 8
.LC133:
	.ascii "[Warning] Unsupported variable access type for tac_variable_access: %u\12\0"
	.text
	.def	tac_variable_access;	.scl	3;	.type	32;	.endef
tac_variable_access:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$72, %rsp
	movq	%rcx, %rdi
	movq	%rdx, %rbx
	cmpl	$0, 16(%rcx)
	jne	.L681
	movq	8(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L681
	movl	32(%rcx), %eax
	leal	-1(%rax), %edx
	cmpl	$1, %edx
	jbe	.L708
	testl	%eax, %eax
	jne	.L684
	movq	%rbx, %r9
	movl	$118, %r8d
	movq	%rcx, %rdx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rsi
.L680:
	movq	%rsi, %rax
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L708:
	movq	(%rcx), %rdx
	movq	%rbx, %r9
	movl	$102, %r8d
	call	create_var
	movq	%rax, %rdx
	movl	$7, %ecx
	call	create_arg
	movq	%rax, %rsi
	jmp	.L680
.L684:
	movq	(%rcx), %rdx
	movq	%rbx, %r9
	movl	$118, %r8d
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rsi
	jmp	.L680
.L681:
	movq	(%rdi), %rsi
	testq	%rsi, %rsi
	je	.L709
	movq	%rbx, %rdx
	movq	%rsi, %rcx
	call	tac_variable_access
	movq	%rax, %rcx
	movq	%rbx, %rdx
	call	load_rvalue
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L710
	movl	16(%rdi), %esi
	cmpl	$2, %esi
	je	.L711
	cmpl	$3, %esi
	je	.L712
	cmpl	$1, %esi
	jne	.L697
	movl	16(%rax), %esi
	testl	%esi, %esi
	jne	.L698
	movq	8(%rax), %rax
	cmpl	$0, 32(%rax)
	je	.L713
.L699:
	movq	8(%rbp), %rax
	movq	8(%rax), %rbx
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rbx, %r9
	movl	%esi, %r8d
	leaq	.LC132(%rip), %rdx
	call	fprintf
	movl	$0, %esi
	jmp	.L680
.L709:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %r9
	movl	$53, %r8d
	movl	$1, %edx
	leaq	.LC123(%rip), %rcx
	call	fwrite
	jmp	.L680
.L710:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %r9
	movl	$54, %r8d
	movl	$1, %edx
	leaq	.LC124(%rip), %rcx
	call	fwrite
	movq	%rbp, %rsi
	jmp	.L680
.L711:
	movq	8(%rax), %r12
	movl	32(%r12), %eax
	leal	-1(%rax), %edx
	cmpl	$1, %edx
	jbe	.L714
	movq	24(%r12), %rcx
	testl	%eax, %eax
	jne	.L689
	movq	16(%rcx), %rcx
.L689:
	movq	8(%rdi), %rax
	movq	8(%rax), %r13
	movq	%r13, %rdx
	call	search_name_use_strcmp
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L715
	movl	32(%rax), %eax
	cmpl	$1, %eax
	je	.L716
	cmpl	$2, %eax
	je	.L717
	cmpl	$5, %eax
	jne	.L718
	movq	(%rsi), %rdx
	movq	%rbx, %r9
	movl	$116, %r8d
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rsi
	movq	8(%rdi), %rcx
	movq	(%rcx), %rdx
	movq	%rbx, %r9
	movl	$97, %r8d
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %r9
	movq	%rbp, %r8
	movq	%rsi, %rdx
	movl	$15, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movb	$1, 20(%rsi)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L680
.L714:
	movq	8(%r12), %rbx
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rbx, %r8
	leaq	.LC125(%rip), %rdx
	call	fprintf
	movl	$0, %esi
	jmp	.L680
.L715:
	movq	8(%r12), %rbx
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rbx, %r9
	movq	%r13, %r8
	leaq	.LC126(%rip), %rdx
	call	fprintf
	jmp	.L680
.L716:
	movq	8(%r12), %rdi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, %r9
	movq	%r13, %r8
	leaq	.LC127(%rip), %rdx
	call	fprintf
	movq	(%rsi), %rdx
	movq	%rbx, %r9
	movl	$102, %r8d
	movq	%rsi, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$7, %ecx
	call	create_arg
	movq	%rax, %rsi
	jmp	.L680
.L717:
	movq	(%rsi), %rdx
	movq	%rbx, %r9
	movl	$102, %r8d
	movq	%rsi, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$8, %ecx
	call	create_arg
	movq	%rax, %rsi
	jmp	.L680
.L718:
	movq	8(%r12), %rbx
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rbx, %r9
	movq	%r13, %r8
	leaq	.LC128(%rip), %rdx
	call	fprintf
	movl	$0, %esi
	jmp	.L680
.L712:
	movq	8(%rax), %rax
	movq	8(%rax), %rcx
	leaq	.LC129(%rip), %rdx
	call	strcmp
	testl	%eax, %eax
	jne	.L719
	movq	8(%rdi), %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rcx
	movq	%rbx, %rdx
	call	load_rvalue
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L720
	movq	%rbx, %r9
	movl	$116, %r8d
	movq	name_int(%rip), %rdx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rsi
	movq	%rdi, %r9
	movq	%rbp, %r8
	movq	%rax, %rdx
	movl	$16, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movb	$1, 20(%rsi)
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L680
.L719:
	movq	0(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rbx
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rbx, %r8
	leaq	.LC130(%rip), %rdx
	call	fprintf
	movl	$0, %esi
	jmp	.L680
.L720:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %r9
	movl	$55, %r8d
	movl	$1, %edx
	leaq	.LC131(%rip), %rcx
	call	fwrite
	movq	%rdi, %rsi
	jmp	.L680
.L713:
	movq	8(%rax), %rcx
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	call	make_method_name
	movq	%rax, %rdx
	movq	8(%rbp), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rcx
	call	search_name_use_strcmp
	movq	%rax, %rcx
	movq	(%rax), %rdx
	movq	%rbx, %r9
	movl	$102, %r8d
	call	create_var
	movq	%rax, %rdx
	movl	$8, %ecx
	call	create_arg
	movq	%rax, %rbp
.L698:
	movl	16(%rbp), %esi
	leal	-7(%rsi), %eax
	cmpl	$1, %eax
	ja	.L699
	movq	$0, 48(%rsp)
	call	create_list
	movq	%rax, %rsi
	cmpl	$8, 16(%rbp)
	je	.L721
.L702:
	movq	8(%rdi), %rcx
	call	list_copy
	movq	%rax, %r12
	leaq	56(%rsp), %r13
	jmp	.L703
.L721:
	movq	8(%rbp), %rax
	movq	8(%rax), %rcx
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	call	make_method_name
	movq	%rax, %rdx
	movq	0(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L702
	movq	(%rdi), %rax
	movq	(%rax), %rax
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$8, %ecx
	call	create_primary
	movq	%rax, %r8
	movl	$0, %r9d
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %rcx
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rcx
	movq	%rbx, %rdx
	call	load_rvalue
	movq	%rax, %r12
	movq	8(%rax), %rcx
	call	get_type_size
	movq	%rax, 56(%rsp)
	leaq	56(%rsp), %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rax, %rdx
	movl	$0, %r9d
	movq	%r12, %r8
	movl	$17, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	%rsi, %rcx
	call	list_append
	addq	$1, 48(%rsp)
	jmp	.L702
.L704:
	movq	%rbx, %rdx
	call	tac_expression
	movq	%rax, %rcx
	movq	%rbx, %rdx
	call	load_rvalue
	movq	%rax, %rdi
	movq	8(%rax), %rcx
	call	get_type_size
	movq	%rax, 56(%rsp)
	movq	%r13, %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rax, %rdx
	movl	$0, %r9d
	movq	%rdi, %r8
	movl	$17, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	%rsi, %rcx
	call	list_append
	addq	$1, 48(%rsp)
.L703:
	movq	%r12, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L704
	jmp	.L705
.L706:
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
.L705:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L706
	movq	8(%rbp), %rdx
	movq	%rbx, %r9
	movl	$116, %r8d
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rsi
	leaq	48(%rsp), %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rax, %r9
	movq	%rbp, %r8
	movq	%rsi, %rdx
	movl	$22, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	16(%rbx), %rax
	movq	8(%rax), %rcx
	call	list_append
	jmp	.L680
.L697:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movl	%esi, %r8d
	leaq	.LC133(%rip), %rdx
	call	fprintf
	movl	$0, %esi
	jmp	.L680
	.section .rdata,"dr"
.LC134:
	.ascii "Var: \"NULL\"\12\0"
.LC135:
	.ascii "NULL\11%s\12\0"
.LC136:
	.ascii "%s\11%s(%s)\12\0"
.LC137:
	.ascii "%s\11%s\12\0"
	.text
	.def	output_var;	.scl	3;	.type	32;	.endef
output_var:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	movq	%rdx, %rsi
	testq	%rcx, %rcx
	je	.L742
	movq	%rcx, %rbp
	cmpq	$0, 16(%rcx)
	je	.L743
	cmpq	$0, (%rcx)
	je	.L744
	movq	%r8, %rbx
	salq	$2, %rbx
	je	.L733
	movl	$0, %edi
.L734:
	movq	%rsi, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, %rdi
	cmpq	%rbx, %rdi
	jne	.L734
.L733:
	movq	16(%rbp), %rax
	movq	8(%rax), %r8
	movq	0(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, 32(%rsp)
	movq	8(%rbp), %r9
	leaq	.LC136(%rip), %rdx
	movq	%rsi, %rcx
	call	fprintf
.L722:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L742:
	movq	%r8, %rbx
	salq	$2, %rbx
	je	.L724
	movl	$0, %edi
.L725:
	movq	%rsi, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, %rdi
	cmpq	%rbx, %rdi
	jne	.L725
.L724:
	movq	%rsi, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC134(%rip), %rcx
	call	fwrite
	jmp	.L722
.L743:
	movq	%r8, %rbx
	salq	$2, %rbx
	je	.L728
	movl	$0, %edi
.L729:
	movq	%rsi, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, %rdi
	cmpq	%rbx, %rdi
	jne	.L729
.L728:
	movq	8(%rbp), %r8
	leaq	.LC135(%rip), %rdx
	movq	%rsi, %rcx
	call	fprintf
	jmp	.L722
.L744:
	movl	$0, %edi
	movq	%r8, %rbx
	salq	$2, %rbx
	je	.L732
.L731:
	movq	%rsi, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, %rdi
	cmpq	%rbx, %rdi
	jne	.L731
.L732:
	movq	16(%rbp), %rax
	movq	8(%rbp), %r9
	movq	8(%rax), %r8
	leaq	.LC137(%rip), %rdx
	movq	%rsi, %rcx
	call	fprintf
	jmp	.L722
	.section .rdata,"dr"
.LC138:
	.ascii "\"NULL\"\0"
.LC139:
	.ascii "%s(%s)\0"
.LC140:
	.ascii "%lld\0"
.LC141:
	.ascii "%f\0"
.LC142:
	.ascii "\"%s\"\0"
.LC143:
	.ascii "void\0"
.LC144:
	.ascii "NONE\0"
.LC145:
	.ascii "unknown_ArgType: %u\0"
	.text
	.def	output_arg;	.scl	3;	.type	32;	.endef
output_arg:
	subq	$40, %rsp
	movq	%rdx, %r10
	testq	%rcx, %rcx
	je	.L764
	movl	16(%rcx), %r8d
	cmpl	$9, %r8d
	ja	.L748
	movl	%r8d, %r8d
	leaq	.L750(%rip), %rdx
	movslq	(%rdx,%r8,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L750:
	.long	.L758-.L750
	.long	.L757-.L750
	.long	.L756-.L750
	.long	.L755-.L750
	.long	.L754-.L750
	.long	.L753-.L750
	.long	.L752-.L750
	.long	.L751-.L750
	.long	.L751-.L750
	.long	.L749-.L750
	.text
.L764:
	movq	%rdx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC138(%rip), %rcx
	call	fwrite
.L745:
	addq	$40, %rsp
	ret
.L758:
	movq	(%rcx), %rax
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L759
	movq	8(%rdx), %r9
	movq	8(%rax), %r8
	leaq	.LC139(%rip), %rdx
	movq	%r10, %rcx
	call	fprintf
	jmp	.L745
.L759:
	movq	8(%rax), %rcx
	movq	%r10, %rdx
	call	fputs
	jmp	.L745
.L757:
	movq	(%rcx), %r8
	leaq	.LC140(%rip), %rdx
	movq	%r10, %rcx
	call	fprintf
	jmp	.L745
.L756:
	movq	(%rcx), %r8
	movq	%r8, %xmm2
	leaq	.LC141(%rip), %rdx
	movq	%r10, %rcx
	call	fprintf
	jmp	.L745
.L755:
	movq	(%rcx), %r8
	leaq	.LC142(%rip), %rdx
	movq	%r10, %rcx
	call	fprintf
	jmp	.L745
.L754:
	cmpb	$0, (%rcx)
	leaq	.LC78(%rip), %rcx
	leaq	.LC77(%rip), %rax
	cmovne	%rax, %rcx
	movq	%r10, %rdx
	call	fputs
	jmp	.L745
.L753:
	movq	%r10, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC143(%rip), %rcx
	call	fwrite
	jmp	.L745
.L752:
	movq	(%rcx), %rax
	movq	8(%rax), %rcx
	movq	%r10, %rdx
	call	fputs
	jmp	.L745
.L751:
	movq	(%rcx), %rax
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.L761
	movq	8(%rdx), %r9
	movq	8(%rax), %r8
	leaq	.LC139(%rip), %rdx
	movq	%r10, %rcx
	call	fprintf
	jmp	.L745
.L761:
	movq	8(%rax), %rcx
	movq	%r10, %rdx
	call	fputs
	jmp	.L745
.L749:
	movq	%r10, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC144(%rip), %rcx
	call	fwrite
	jmp	.L745
.L748:
	leaq	.LC145(%rip), %rdx
	movq	%r10, %rcx
	call	fprintf
	jmp	.L745
	.section .rdata,"dr"
	.align 8
.LC146:
	.ascii "[Lexer Error] at %s:%zu:%zu: Unterminated string literal\12\0"
.LC147:
	.ascii "\0\0"
	.align 8
.LC148:
	.ascii "[Lexer Error] at %s:%zu:%zu: Unterminated comment\12\0"
	.align 8
.LC149:
	.ascii "[Lexer Error] at %s:%zu:%zu: Unexpected character\12\0"
	.text
	.def	next_token;	.scl	3;	.type	32;	.endef
next_token:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$48, %rsp
	movq	%rcx, %rbx
	movl	%edx, %esi
	call	get_current_char
	cmpb	$32, %al
	ja	.L766
	movzbl	%al, %edx
	leaq	.L768(%rip), %rcx
	movslq	(%rcx,%rdx,4), %rdx
	addq	%rcx, %rdx
	jmp	*%rdx
	.section .rdata,"dr"
	.align 4
.L768:
	.long	.L770-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L767-.L768
	.long	.L769-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L767-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L767-.L768
	.text
.L770:
	movq	40(%rbx), %r9
	movq	32(%rbx), %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	create_token
.L765:
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L767:
	movsbl	%sil, %edx
	movq	%rbx, %rcx
	call	next_token
	jmp	.L765
.L769:
	addq	$1, 32(%rbx)
	movq	$0, 40(%rbx)
	movsbl	%sil, %edx
	movq	%rbx, %rcx
	call	next_token
	jmp	.L765
.L766:
	cmpb	$57, %al
	jg	.L772
	cmpb	$47, %al
	jg	.L773
	cmpb	$34, %al
	jne	.L866
	movq	16(%rbx), %rbp
	movq	40(%rbx), %rax
	leaq	-1(%rax), %r12
	movq	%rbx, %rcx
	call	get_current_char
	movl	%eax, %esi
	cmpb	$34, %al
	ja	.L791
	movabsq	$17179870209, %rax
	btq	%rsi, %rax
	jc	.L792
.L791:
	movabsq	$17179870209, %rdi
.L858:
	movq	%rbx, %rcx
	call	get_current_char
	movl	%eax, %esi
	cmpb	$34, %al
	ja	.L858
	btq	%rsi, %rdi
	jnc	.L858
.L792:
	cmpb	$34, %sil
	jne	.L867
.L794:
	movq	16(%rbx), %rdx
	subq	%rbp, %rdx
	cmpq	$1, %rdx
	je	.L868
	movq	32(%rbx), %rsi
	subq	$1, %rdx
	movq	%rbp, %rcx
	addq	8(%rbx), %rcx
	movl	$1, %r8d
	call	create_string_check
	movq	%rax, %rdx
	movq	%r12, %r9
	movq	%rsi, %r8
	movl	$4, %ecx
	call	create_token
	jmp	.L765
.L772:
	leal	-65(%rax), %edx
	cmpb	$57, %dl
	ja	.L777
	movabsq	$288230372997595135, %rcx
	btq	%rdx, %rcx
	jnc	.L777
	movq	16(%rbx), %r12
	leaq	-1(%r12), %rbp
	movq	40(%rbx), %rdi
	subq	$1, %rdi
	movabsq	$288230372997595135, %rsi
	jmp	.L779
.L869:
	cmpb	$47, %al
	jle	.L782
.L781:
	movq	%rbx, %rcx
	call	get_current_char
.L779:
	cmpb	$57, %al
	jle	.L869
	subl	$65, %eax
	cmpb	$57, %al
	ja	.L782
	btq	%rax, %rsi
	jc	.L781
.L782:
	movq	16(%rbx), %rdx
	leaq	-1(%rdx), %rax
	movq	%rax, 16(%rbx)
	subq	$1, 40(%rbx)
	subq	%r12, %rdx
	movq	%rbp, %rcx
	addq	8(%rbx), %rcx
	movl	$1, %r8d
	call	create_string_check
	movq	%rax, %rsi
	cmpb	$0, initialized(%rip)
	je	.L870
.L784:
	leaq	keywordList(%rip), %rax
	leaq	176(%rax), %rdx
.L786:
	cmpq	(%rax), %rsi
	je	.L785
	addq	$8, %rax
	cmpq	%rdx, %rax
	jne	.L786
	movq	%rdi, %r9
	movq	32(%rbx), %r8
	movq	%rsi, %rdx
	movl	$1, %ecx
	call	create_token
	jmp	.L765
.L870:
	call	init
	jmp	.L784
.L773:
	movq	16(%rbx), %rbp
	leaq	-1(%rbp), %rdi
	movq	40(%rbx), %rax
	leaq	-1(%rax), %rsi
.L788:
	movq	%rbx, %rcx
	call	get_current_char
	leal	-48(%rax), %edx
	cmpb	$9, %dl
	jbe	.L788
	movq	16(%rbx), %rdx
	movl	$2, %r12d
	cmpq	24(%rbx), %rdx
	jnb	.L789
	cmpb	$46, %al
	je	.L871
.L789:
	movq	16(%rbx), %rdx
	leaq	-1(%rdx), %rax
	movq	%rax, 16(%rbx)
	subq	$1, 40(%rbx)
	movq	32(%rbx), %r13
	subq	%rbp, %rdx
	addq	8(%rbx), %rdi
	movq	%rdi, %rcx
	movl	$1, %r8d
	call	create_string_check
	movq	%rax, %rdx
	movq	%rsi, %r9
	movq	%r13, %r8
	movl	%r12d, %ecx
	call	create_token
	jmp	.L765
.L871:
	movq	8(%rbx), %rax
	movzbl	(%rax,%rdx), %eax
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L789
	movq	%rbx, %rcx
	call	get_current_char
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L850
.L790:
	movq	%rbx, %rcx
	call	get_current_char
	subl	$48, %eax
	cmpb	$9, %al
	jbe	.L790
	movl	$3, %r12d
	jmp	.L789
.L850:
	movl	$3, %r12d
	jmp	.L789
.L867:
	movq	32(%rbx), %rax
	leaq	1(%rax), %rdi
	movq	(%rbx), %r13
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rbp, 32(%rsp)
	movq	%rdi, %r9
	movq	%r13, %r8
	leaq	.LC146(%rip), %rdx
	call	fprintf
	cmpb	$10, %sil
	jne	.L794
	addq	$1, 32(%rbx)
	movq	$0, 40(%rbx)
	jmp	.L794
.L868:
	movq	32(%rbx), %rbx
	movl	$1, %r8d
	leaq	.LC147(%rip), %rcx
	call	create_string_check
	movq	%rax, %rdx
	movq	%r12, %r9
	movq	%rbx, %r8
	movl	$4, %ecx
	call	create_token
	jmp	.L765
.L866:
	movq	16(%rbx), %rdi
	movq	24(%rbx), %rbp
	cmpq	%rbp, %rdi
	jnb	.L796
	movq	8(%rbx), %r12
	movzbl	(%r12,%rdi), %edx
	cmpb	$47, %al
	sete	%cl
	cmpb	$47, %dl
	jne	.L797
	testb	%cl, %cl
	je	.L797
	movq	40(%rbx), %rbp
.L798:
	movq	%rbx, %rcx
	call	get_current_char
	cmpb	$10, %al
	je	.L852
	testb	%al, %al
	jne	.L798
.L852:
	movq	16(%rbx), %rax
	leaq	-1(%rax), %rdx
	movq	%rdx, 16(%rbx)
	subq	$1, 40(%rbx)
	testb	%sil, %sil
	je	.L800
	movsbl	%sil, %edx
	movq	%rbx, %rcx
	call	next_token
	jmp	.L765
.L800:
	addq	$1, %rdi
	movq	32(%rbx), %rbx
	subq	%rdi, %rdx
	leaq	(%r12,%rdi), %rcx
	movl	$1, %r8d
	call	create_string_check
	movq	%rax, %rdx
	leaq	-1(%rbp), %r9
	movq	%rbx, %r8
	movl	$7, %ecx
	call	create_token
	jmp	.L765
.L807:
	movq	%rbx, %rcx
	call	get_current_char
	movq	16(%rbx), %rdx
	cmpq	%rbp, %rdx
	jnb	.L803
	movq	8(%rbx), %rcx
	movzbl	(%rcx,%rdx), %edx
	cmpb	$10, %al
	je	.L841
.L804:
	testb	%dl, %dl
	je	.L805
	testb	%al, %al
	je	.L872
.L802:
	cmpb	$42, %al
	jne	.L807
	cmpb	$47, %dl
	jne	.L807
	movq	%rbx, %rcx
	call	get_current_char
	testb	%sil, %sil
	jne	.L844
	movq	32(%rbx), %rsi
	movq	16(%rbx), %rax
	leaq	-2(%rax), %rdx
	subq	%r14, %rdx
	movq	%r14, %rcx
	addq	8(%rbx), %rcx
	movl	$1, %r8d
	call	create_string_check
	movq	%rax, %rdx
	movq	%r13, %r9
	movq	%rsi, %r8
	movl	$7, %ecx
	call	create_token
	jmp	.L765
.L872:
	movq	32(%rbx), %rax
	leaq	1(%rax), %rbp
	movq	(%rbx), %r12
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	addq	$2, %rdi
	movq	%rdi, 32(%rsp)
	movq	%rbp, %r9
	movq	%r12, %r8
	leaq	.LC148(%rip), %rdx
	call	fprintf
	testb	%sil, %sil
	je	.L806
	movsbl	%sil, %edx
	movq	%rbx, %rcx
	call	next_token
	jmp	.L765
.L806:
	movq	32(%rbx), %rsi
	movq	16(%rbx), %rdx
	subq	%r14, %rdx
	movq	%r14, %rcx
	addq	8(%rbx), %rcx
	movl	$1, %r8d
	call	create_string_check
	movq	%rax, %rdx
	movq	%r13, %r9
	movq	%rsi, %r8
	movl	$7, %ecx
	call	create_token
	jmp	.L765
.L873:
	subq	$1, 16(%rbx)
	subq	$1, 40(%rbx)
	jmp	.L843
.L809:
	movq	32(%rbx), %rsi
	movq	16(%rbx), %rdx
	subq	%r14, %rdx
	movq	%r14, %rcx
	addq	8(%rbx), %rcx
	movl	$1, %r8d
	call	create_string_check
	movq	%rax, %rdx
	movq	%r13, %r9
	movq	%rsi, %r8
	movl	$7, %ecx
	call	create_token
	jmp	.L765
.L844:
	movsbl	%sil, %edx
	movq	%rbx, %rcx
	call	next_token
	jmp	.L765
.L875:
	movq	%rbx, %rcx
	call	get_current_char
	movq	40(%rbx), %rax
	leaq	-2(%rax), %r9
	movq	32(%rbx), %r8
	movq	152+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L876:
	movq	%rbx, %rcx
	call	get_current_char
	movq	40(%rbx), %rax
	leaq	-2(%rax), %r9
	movq	32(%rbx), %r8
	movq	160+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L877:
	movq	%rbx, %rcx
	call	get_current_char
	movq	40(%rbx), %rax
	leaq	-2(%rax), %r9
	movq	32(%rbx), %r8
	movq	168+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L878:
	movq	%rbx, %rcx
	call	get_current_char
	movq	40(%rbx), %rax
	leaq	-2(%rax), %r9
	movq	32(%rbx), %r8
	movq	176+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L879:
	movq	%rbx, %rcx
	call	get_current_char
	movq	40(%rbx), %rax
	leaq	-2(%rax), %r9
	movq	32(%rbx), %r8
	movq	184+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L880:
	movq	%rbx, %rcx
	call	get_current_char
	movq	40(%rbx), %rax
	leaq	-2(%rax), %r9
	movq	32(%rbx), %r8
	movq	192+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L881:
	movq	%rbx, %rcx
	call	get_current_char
	movq	40(%rbx), %rax
	leaq	-2(%rax), %r9
	movq	32(%rbx), %r8
	movq	200+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L882:
	movq	%rbx, %rcx
	call	get_current_char
	movq	40(%rbx), %rax
	leaq	-2(%rax), %r9
	movq	32(%rbx), %r8
	movq	208+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L883:
	movq	%rbx, %rcx
	call	get_current_char
	movq	40(%rbx), %rax
	leaq	-2(%rax), %r9
	movq	32(%rbx), %r8
	movq	216+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L884:
	movq	%rbx, %rcx
	call	get_current_char
	movq	40(%rbx), %rax
	leaq	-2(%rax), %r9
	movq	32(%rbx), %r8
	movq	224+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L885:
	movq	%rbx, %rcx
	call	get_current_char
	movq	40(%rbx), %rax
	leaq	-2(%rax), %r9
	movq	32(%rbx), %r8
	movq	232+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L838:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	32(%rbx), %r8
	movq	symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L837:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	32(%rbx), %r8
	movq	8+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L824:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	32(%rbx), %r8
	movq	16+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L822:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	32(%rbx), %r8
	movq	24+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L834:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	32(%rbx), %r8
	movq	32+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L840:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	32(%rbx), %r8
	movq	40+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L832:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	32(%rbx), %r8
	movq	48+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L826:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	32(%rbx), %r8
	movq	56+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L825:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	32(%rbx), %r8
	movq	64+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L830:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	32(%rbx), %r8
	movq	72+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L835:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	32(%rbx), %r8
	movq	88+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L833:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	32(%rbx), %r8
	movq	96+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L836:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	32(%rbx), %r8
	movq	104+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L831:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	32(%rbx), %r8
	movq	112+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L839:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	32(%rbx), %r8
	movq	120+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L829:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	32(%rbx), %r8
	movq	128+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L827:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	32(%rbx), %r8
	movq	136+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L828:
	movq	40(%rbx), %rax
	leaq	-1(%rax), %r9
	movq	32(%rbx), %r8
	movq	144+symbolList(%rip), %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L765
.L821:
	movq	40(%rbx), %rdi
	movq	32(%rbx), %rax
	leaq	1(%rax), %rsi
	movq	(%rbx), %rbx
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC149(%rip), %rdx
	call	fprintf
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_token
	jmp	.L765
.L803:
	cmpb	$10, %al
	jne	.L805
	movl	%r12d, %edx
.L841:
	addq	$1, 32(%rbx)
	movq	$0, 40(%rbx)
	jmp	.L804
.L805:
	testb	%al, %al
	je	.L873
.L843:
	movq	32(%rbx), %rax
	leaq	1(%rax), %rbp
	movq	(%rbx), %r12
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	addq	$2, %rdi
	movq	%rdi, 32(%rsp)
	movq	%rbp, %r9
	movq	%r12, %r8
	leaq	.LC148(%rip), %rdx
	call	fprintf
	testb	%sil, %sil
	je	.L809
	movsbl	%sil, %edx
	movq	%rbx, %rcx
	call	next_token
	jmp	.L765
.L874:
	movq	8(%rbx), %rdx
	movzbl	(%rdx,%rdi), %edx
	cmpb	$47, %al
	sete	%cl
.L797:
	cmpb	$42, %dl
	jne	.L801
	testb	%cl, %cl
	je	.L801
	leaq	1(%rdi), %r14
	movq	40(%rbx), %rax
	leaq	-1(%rax), %r13
	movl	$47, %eax
	movl	$0, %r12d
	jmp	.L802
.L777:
	movq	16(%rbx), %rdi
	movq	24(%rbx), %rbp
	cmpq	%rbp, %rdi
	jb	.L874
.L796:
	cmpb	$47, %al
	sete	%cl
	movl	$0, %edx
.L801:
	cmpb	$61, %dl
	sete	%r8b
	cmpb	$61, %al
	jne	.L810
	testb	%r8b, %r8b
	jne	.L875
.L810:
	cmpb	$33, %al
	jne	.L811
	testb	%r8b, %r8b
	jne	.L876
.L811:
	cmpb	$60, %al
	jne	.L812
	testb	%r8b, %r8b
	jne	.L877
.L812:
	cmpb	$62, %al
	jne	.L813
	testb	%r8b, %r8b
	jne	.L878
.L813:
	cmpb	$43, %al
	jne	.L814
	testb	%r8b, %r8b
	jne	.L879
.L814:
	cmpb	$45, %al
	jne	.L815
	testb	%r8b, %r8b
	jne	.L880
.L815:
	cmpb	$42, %al
	jne	.L816
	testb	%r8b, %r8b
	jne	.L881
.L816:
	testb	%r8b, %r8b
	je	.L817
	testb	%cl, %cl
	jne	.L882
.L817:
	cmpb	$37, %al
	jne	.L818
	testb	%r8b, %r8b
	jne	.L883
.L818:
	cmpb	$38, %al
	jne	.L819
	cmpb	$38, %dl
	je	.L884
.L819:
	cmpb	$124, %al
	jne	.L820
	cmpb	$124, %dl
	je	.L885
.L820:
	subl	$33, %eax
	cmpb	$92, %al
	ja	.L821
	movzbl	%al, %eax
	leaq	.L823(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L823:
	.long	.L840-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L839-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L838-.L823
	.long	.L837-.L823
	.long	.L836-.L823
	.long	.L835-.L823
	.long	.L834-.L823
	.long	.L833-.L823
	.long	.L832-.L823
	.long	.L831-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L830-.L823
	.long	.L829-.L823
	.long	.L828-.L823
	.long	.L827-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L826-.L823
	.long	.L821-.L823
	.long	.L825-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L824-.L823
	.long	.L821-.L823
	.long	.L822-.L823
	.text
.L785:
	movq	%rdi, %r9
	movq	32(%rbx), %r8
	movq	%rsi, %rdx
	movl	$6, %ecx
	call	create_token
	jmp	.L765
	.def	get_next_token;	.scl	3;	.type	32;	.endef
get_next_token:
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbx
	movq	48(%rcx), %rax
	testq	%rax, %rax
	je	.L887
	movq	%rax, 80(%rcx)
	movq	56(%rcx), %rdx
	movq	%rdx, 16(%rcx)
	movq	64(%rcx), %rdx
	movq	%rdx, 32(%rcx)
	movq	72(%rcx), %rdx
	movq	%rdx, 40(%rcx)
	movq	$0, 48(%rcx)
.L886:
	addq	$32, %rsp
	popq	%rbx
	ret
.L887:
	movsbl	%dl, %edx
	call	next_token
	movq	%rax, 80(%rbx)
	jmp	.L886
	.def	peek_next_token;	.scl	3;	.type	32;	.endef
peek_next_token:
	movq	48(%rcx), %rax
	testq	%rax, %rax
	je	.L896
	ret
.L896:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rbx
	movq	16(%rcx), %rbp
	movq	32(%rcx), %rdi
	movq	40(%rcx), %rsi
	movsbl	%dl, %edx
	call	get_next_token
	movq	16(%rbx), %rdx
	movq	%rdx, 56(%rbx)
	movq	32(%rbx), %rdx
	movq	%rdx, 64(%rbx)
	movq	40(%rbx), %rdx
	movq	%rdx, 72(%rbx)
	movq	%rbp, 16(%rbx)
	movq	%rdi, 32(%rbx)
	movq	%rsi, 40(%rbx)
	movq	%rax, 48(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC150:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse right operand\12\0"
	.text
	.def	parse_expr_prec;	.scl	3;	.type	32;	.endef
parse_expr_prec:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	movq	%rcx, %rdi
	movq	%rdx, %r13
	movl	%r8d, %r15d
	movq	%r9, %r14
	movl	$1, %edx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	je	.L902
	movq	%r13, %rsi
	jmp	.L897
.L910:
	movq	16(%rbx), %rax
	leaq	1(%rax), %rdi
	movq	8(%rbx), %rbx
	addq	$1, %rbx
	movq	160(%rsp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rbp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rbp, %r8
	leaq	.LC150(%rip), %rdx
	call	fprintf
	jmp	.L897
.L908:
	movl	$1, %edx
	movq	%rdi, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	jne	.L900
.L901:
	movq	(%rax), %rcx
	call	string_to_operator
	movl	%eax, %ebx
	movl	%eax, %ecx
	call	operator_precedence
	cmpl	$19, %ebx
	je	.L900
	cmpl	%eax, %ebp
	jge	.L900
	movq	160(%rsp), %rdx
	movq	%rdx, 32(%rsp)
	movq	%r14, %r9
	movl	%eax, %r8d
	movq	%rsi, %rdx
	movq	%rdi, %rcx
	call	parse_expr_prec
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L908
	jmp	.L897
.L900:
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%r13, %rdx
	movl	%r12d, %ecx
	call	create_expression
	movq	%rax, %r13
	movl	$1, %edx
	movq	%rdi, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	jne	.L909
.L902:
	movq	(%rax), %rcx
	call	string_to_operator
	movl	%eax, %r12d
	movl	%eax, %ecx
	call	operator_precedence
	movl	%eax, %ebp
	cmpl	$19, %r12d
	je	.L904
	cmpl	%r15d, %eax
	jl	.L904
	movl	$1, %edx
	movq	%rdi, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rdi, %rcx
	call	get_next_token
	movq	%rax, %rbx
	movq	160(%rsp), %r8
	movq	%r14, %rdx
	movq	%rdi, %rcx
	call	parse_primary
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L910
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %rsi
	movl	$1, %edx
	movq	%rdi, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	je	.L901
	jmp	.L900
.L909:
	movq	%r13, %rsi
	jmp	.L897
.L904:
	movq	%r13, %rsi
.L897:
	movq	%rsi, %rax
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
	.section .rdata,"dr"
	.align 8
.LC151:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse expression primary\12\0"
	.text
	.def	parse_expression;	.scl	3;	.type	32;	.endef
parse_expression:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	movq	%rcx, %rdi
	movq	%rdx, %rsi
	movq	%r8, %rbp
	call	parse_primary
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L915
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %rdx
	movq	%rbp, 32(%rsp)
	movq	%rsi, %r9
	movl	$0, %r8d
	movq	%rdi, %rcx
	call	parse_expr_prec
	movq	%rax, %rbx
.L911:
	movq	%rbx, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L915:
	movq	80(%rdi), %rax
	movq	16(%rax), %rdi
	addq	$1, %rdi
	movq	8(%rax), %rsi
	addq	$1, %rsi
	movq	0(%rbp), %rax
	movq	24(%rax), %rbp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbp, %r8
	leaq	.LC151(%rip), %rdx
	call	fprintf
	jmp	.L911
	.section .rdata,"dr"
	.align 8
.LC152:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse parenthesized expression\12\0"
	.align 8
.LC153:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after expression\12\0"
	.align 8
.LC154:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '!'\12\0"
	.align 8
.LC155:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '-'\12\0"
	.align 8
.LC156:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot call undefined variable\12\0"
	.align 8
.LC157:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot call non-function variable\12\0"
	.align 8
.LC158:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function call argument\12\0"
	.align 8
.LC159:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function call argument\12\0"
	.align 8
.LC160:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse sequence index\12\0"
	.align 8
.LC161:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ']' after sequence index\12\0"
	.align 8
.LC162:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot access attribute without a valid scope\12\0"
	.align 8
.LC163:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected attribute name after '.'\12\0"
	.align 8
.LC164:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown attribute name\12\0"
	.align 8
.LC165:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse variable access\12\0"
	.align 8
.LC166:
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
	movq	%rdx, 168(%rsp)
	movq	%r8, 176(%rsp)
	movq	80(%rcx), %rdi
	movl	24(%rdi), %eax
	cmpl	$2, %eax
	je	.L970
	movq	%rcx, %rbx
	cmpl	$3, %eax
	je	.L971
	cmpl	$4, %eax
	je	.L972
	cmpl	$6, %eax
	je	.L973
	cmpl	$5, %eax
	je	.L974
	cmpl	$1, %eax
	je	.L930
.L929:
	movq	16(%rdi), %rax
	leaq	1(%rax), %rsi
	movq	8(%rdi), %rbx
	addq	$1, %rbx
	movq	176(%rsp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rdi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rdi, %r8
	leaq	.LC166(%rip), %rdx
	call	fprintf
	movl	$0, %esi
	jmp	.L916
.L970:
	movq	(%rdi), %rdx
	movl	$0, %r15d
	movl	$0, %ebx
	movl	$0, %esi
	movl	$0, %ecx
.L918:
	movq	%r15, 32(%rsp)
	movq	%rbx, %r9
	movq	%rsi, %r8
	call	create_primary
	movq	%rax, %rsi
.L916:
	movq	%rsi, %rax
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
.L971:
	movq	(%rdi), %rdx
	movl	$0, %r15d
	movl	$0, %ebx
	movl	$0, %esi
	movl	$1, %ecx
	jmp	.L918
.L972:
	movq	(%rdi), %rdx
	movl	$0, %r15d
	movl	$0, %ebx
	movl	$0, %esi
	movl	$2, %ecx
	jmp	.L918
.L973:
	movq	(%rdi), %rax
	movq	88+keywordList(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L957
	movq	96+keywordList(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L975
	movq	40+keywordList(%rip), %rax
	cmpq	%rax, (%rdi)
	jne	.L929
	movq	176(%rsp), %rax
	cmpb	$0, 9(%rax)
	je	.L929
.L930:
	movq	(%rdi), %rdx
	movq	168(%rsp), %rcx
	call	search_name
	movq	%rax, %rsi
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	create_variable_access
	movq	%rax, %r15
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	jne	.L931
	movl	$0, %ebp
	movl	$0, %r12d
	movq	%rdi, 72(%rsp)
	movq	168(%rsp), %rdi
	jmp	.L955
.L974:
	movq	(%rdi), %rax
	cmpq	symbolList(%rip), %rax
	je	.L976
	cmpq	40+symbolList(%rip), %rax
	je	.L977
	cmpq	96+symbolList(%rip), %rax
	jne	.L929
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rsi
	movq	176(%rsp), %r8
	movq	168(%rsp), %rdx
	movq	%rbx, %rcx
	call	parse_primary
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L978
	movl	$0, %r15d
	movl	$0, %esi
	movl	$0, %edx
	movl	$7, %ecx
	jmp	.L918
.L976:
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rdi
	movq	176(%rsp), %r8
	movq	168(%rsp), %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L979
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	24(%rax), %ecx
	cmpl	$5, %ecx
	jne	.L927
	movq	8+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L927
	movl	$0, %r15d
	movl	$0, %ebx
	movl	$0, %edx
	jmp	.L918
.L979:
	movq	16(%rdi), %rax
	leaq	1(%rax), %rbp
	movq	8(%rdi), %rbx
	addq	$1, %rbx
	movq	176(%rsp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rdi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rbp, 32(%rsp)
	movq	%rbx, %r9
	movq	%rdi, %r8
	leaq	.LC152(%rip), %rdx
	call	fprintf
	jmp	.L916
.L927:
	movq	16(%rax), %rdi
	leaq	1(%rdi), %rsi
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	176(%rsp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rdi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rdi, %r8
	leaq	.LC153(%rip), %rdx
	call	fprintf
	movl	$0, %esi
	jmp	.L916
.L977:
	movl	$1, %edx
	call	get_next_token
	movq	%rax, %rsi
	movq	176(%rsp), %r8
	movq	168(%rsp), %rdx
	movq	%rbx, %rcx
	call	parse_primary
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L980
	movl	$0, %r15d
	movl	$0, %esi
	movl	$0, %edx
	movl	$6, %ecx
	jmp	.L918
.L980:
	movq	16(%rsi), %rax
	leaq	1(%rax), %rdi
	movq	8(%rsi), %rsi
	addq	$1, %rsi
	movq	176(%rsp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rbp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbp, %r8
	leaq	.LC154(%rip), %rdx
	call	fprintf
	movq	%rbx, %rsi
	jmp	.L916
.L978:
	movq	16(%rsi), %rax
	leaq	1(%rax), %rdi
	movq	8(%rsi), %rsi
	addq	$1, %rsi
	movq	176(%rsp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rbp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbp, %r8
	leaq	.LC155(%rip), %rdx
	call	fprintf
	movq	%rbx, %rsi
	jmp	.L916
.L933:
	movq	(%rax), %rax
	cmpq	symbolList(%rip), %rax
	je	.L981
	cmpq	56+symbolList(%rip), %rax
	je	.L982
	cmpq	48+symbolList(%rip), %rax
	jne	.L968
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r14
	testq	%r12, %r12
	je	.L983
	cmpl	$1, 24(%rax)
	jne	.L984
	movq	(%rax), %r13
	movq	%r13, %rdx
	movq	%r12, %rcx
	call	search_name
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L985
.L952:
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rsi, %r8
	movq	%r15, %rdx
	movl	$2, %ecx
	call	create_variable_access
	movq	%rax, %r15
	movl	$0, %r12d
	movl	$0, %ebp
.L945:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	cmpl	$5, 24(%rax)
	jne	.L986
.L955:
	testq	%rsi, %rsi
	je	.L932
	movq	(%rsi), %rbp
	testq	%rbp, %rbp
	cmove	%rsi, %rbp
.L932:
	testq	%r12, %r12
	jne	.L933
	testq	%rbp, %rbp
	je	.L933
	cmpl	$0, 32(%rbp)
	jne	.L933
	movq	24(%rbp), %rdx
	movq	16(%rdx), %r12
	jmp	.L933
.L981:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
	testq	%rsi, %rsi
	je	.L987
	cmpl	$0, 32(%rsi)
	je	.L988
.L937:
	movl	32(%rsi), %eax
	subl	$1, %eax
	cmpl	$1, %eax
	ja	.L989
.L936:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
	call	create_list
	movq	%rax, %r14
	leaq	symbolList(%rip), %r13
	jmp	.L938
.L987:
	movq	16(%rax), %rax
	leaq	1(%rax), %r12
	movq	8(%rbp), %rbp
	addq	$1, %rbp
	movq	176(%rsp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %r13
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%r12, 32(%rsp)
	movq	%rbp, %r9
	movq	%r13, %r8
	leaq	.LC156(%rip), %rdx
	call	fprintf
	jmp	.L936
.L988:
	movq	8(%rsi), %rcx
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	call	make_method_name
	movq	%rax, %rdx
	movq	24(%rsi), %rax
	movq	16(%rax), %rcx
	call	search_name_use_strcmp
	movq	%rax, %rsi
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %r8
	movq	%r15, %rdx
	movl	$2, %ecx
	call	create_variable_access
	movq	%rax, %r15
	testq	%rsi, %rsi
	jne	.L937
	jmp	.L936
.L989:
	movq	16(%rbp), %rax
	leaq	1(%rax), %r12
	movq	8(%rbp), %rbp
	addq	$1, %rbp
	movq	176(%rsp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %r13
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%r12, 32(%rsp)
	movq	%rbp, %r9
	movq	%r13, %r8
	leaq	.LC157(%rip), %rdx
	call	fprintf
	jmp	.L936
.L992:
	movq	16(%rbp), %rax
	addq	$1, %rax
	movq	%rax, 56(%rsp)
	movq	8(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 64(%rsp)
	movq	176(%rsp), %rdx
	movq	(%rdx), %rax
	movq	24(%rax), %rbp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	56(%rsp), %rax
	movq	%rax, 32(%rsp)
	movq	64(%rsp), %r9
	movq	%rbp, %r8
	leaq	.LC158(%rip), %rdx
	call	fprintf
	jmp	.L939
.L993:
	movq	(%rax), %rax
	cmpq	32(%r13), %rax
	je	.L990
	cmpq	8(%r13), %rax
	jne	.L940
.L938:
	cmpl	$5, 24(%rbp)
	jne	.L944
	movq	8(%r13), %rax
	cmpq	%rax, 0(%rbp)
	je	.L991
.L944:
	movq	176(%rsp), %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L992
.L939:
	movq	%r12, %rdx
	movq	%r14, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	je	.L993
.L940:
	movq	72(%rsp), %rdi
	movq	16(%rbp), %rax
	leaq	1(%rax), %rsi
	movq	8(%rbp), %rbx
	addq	$1, %rbx
	movq	176(%rsp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rbp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rbp, %r8
	leaq	.LC159(%rip), %rdx
	call	fprintf
.L956:
	movq	16(%rdi), %rax
	leaq	1(%rax), %rsi
	movq	8(%rdi), %rbx
	addq	$1, %rbx
	movq	176(%rsp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rdi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rdi, %r8
	leaq	.LC165(%rip), %rdx
	call	fprintf
	movl	$0, %esi
	jmp	.L916
.L990:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
	jmp	.L938
.L991:
	movq	%r14, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%r15, %rdx
	movl	$1, %ecx
	call	create_variable_access
	movq	%rax, %r15
	movq	(%rsi), %rsi
	cmpl	$0, 32(%rsi)
	jne	.L963
	movq	24(%rsi), %rax
	movq	16(%rax), %r12
	movl	$0, %ebp
	jmp	.L945
.L982:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r14
	movq	176(%rsp), %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L994
.L947:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L948
	movq	64+symbolList(%rip), %rcx
	cmpq	%rcx, (%rax)
	jne	.L948
	movq	$0, 32(%rsp)
	movq	%r13, %r9
	movl	$0, %r8d
	movq	%r15, %rdx
	movl	$3, %ecx
	call	create_variable_access
	movq	%rax, %r15
	jmp	.L945
.L994:
	movq	16(%r14), %rax
	addq	$1, %rax
	movq	%rax, 56(%rsp)
	movq	8(%r14), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 64(%rsp)
	movq	176(%rsp), %rdx
	movq	(%rdx), %rax
	movq	24(%rax), %r14
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	56(%rsp), %rax
	movq	%rax, 32(%rsp)
	movq	64(%rsp), %r9
	movq	%r14, %r8
	leaq	.LC160(%rip), %rdx
	call	fprintf
	jmp	.L947
.L948:
	movq	72(%rsp), %rdi
	movq	16(%rax), %rbx
	leaq	1(%rbx), %rsi
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	176(%rsp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rbp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rbp, %r8
	leaq	.LC161(%rip), %rdx
	call	fprintf
	jmp	.L956
.L983:
	movq	72(%rsp), %rdi
	movq	16(%rax), %rax
	leaq	1(%rax), %rsi
	movq	8(%r14), %rbx
	addq	$1, %rbx
	movq	176(%rsp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rbp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rbp, %r8
	leaq	.LC162(%rip), %rdx
	call	fprintf
	jmp	.L956
.L984:
	movq	72(%rsp), %rdi
	movq	16(%rax), %rax
	leaq	1(%rax), %rsi
	movq	8(%r14), %rbx
	addq	$1, %rbx
	movq	176(%rsp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rbp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rbp, %r8
	leaq	.LC163(%rip), %rdx
	call	fprintf
	jmp	.L956
.L985:
	testq	%rbp, %rbp
	je	.L953
	cmpl	$0, 32(%rbp)
	jne	.L954
	movq	8(%rbp), %rbp
.L953:
	movq	%r13, %rdx
	movq	%rbp, %rcx
	call	make_method_name
	movq	%rax, %rdx
	movq	%r12, %rcx
	call	search_name_use_strcmp
	movq	%rax, %rsi
	testq	%rax, %rax
	jne	.L952
	movq	72(%rsp), %rdi
	movq	16(%r14), %rax
	leaq	1(%rax), %rsi
	movq	8(%r14), %rbx
	addq	$1, %rbx
	movq	176(%rsp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rbp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rbp, %r8
	leaq	.LC164(%rip), %rdx
	call	fprintf
	jmp	.L956
.L954:
	movq	0(%rbp), %rbp
	testq	%rbp, %rbp
	je	.L953
	cmpl	$0, 32(%rbp)
	jne	.L964
	movq	8(%rbp), %rbp
	jmp	.L953
.L964:
	movq	%rax, %rbp
	jmp	.L953
.L963:
	movl	$0, %r12d
	movl	$0, %ebp
	jmp	.L945
.L986:
	movq	72(%rsp), %rdi
.L931:
	testq	%r15, %r15
	je	.L956
	movl	$0, %ebx
	movl	$0, %esi
	movl	$0, %edx
	movl	$8, %ecx
	jmp	.L918
.L968:
	movq	72(%rsp), %rdi
	jmp	.L931
.L957:
	movl	$0, %r15d
	movl	$0, %ebx
	movl	$0, %esi
	movl	$3, %ecx
	jmp	.L918
.L975:
	movl	$0, %r15d
	movl	$0, %ebx
	movl	$0, %esi
	movl	$4, %ecx
	jmp	.L918
	.section .rdata,"dr"
	.align 8
.LC167:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected variable type\12\0"
	.align 8
.LC168:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected a type for variable declaration\12\0"
	.align 8
.LC169:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown variable type\12\0"
	.align 8
.LC170:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected variable name\12\0"
	.align 8
.LC171:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse variable initializer\12\0"
	.text
	.def	parse_variable;	.scl	3;	.type	32;	.endef
parse_variable:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %r12
	movq	%r8, %rdi
	movq	80(%rcx), %rbp
	movl	24(%rbp), %eax
	cmpl	$1, %eax
	je	.L996
	cmpl	$6, %eax
	jne	.L997
	movq	0(%rbp), %rax
	cmpq	128+keywordList(%rip), %rax
	je	.L996
	cmpq	136+keywordList(%rip), %rax
	je	.L996
	cmpq	144+keywordList(%rip), %rax
	je	.L996
	cmpq	152+keywordList(%rip), %rax
	je	.L996
	cmpq	160+keywordList(%rip), %rax
	jne	.L997
.L996:
	movq	0(%rbp), %rdx
	movq	%r12, %rcx
	call	search_name
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L999
	movl	32(%rax), %eax
	cmpl	$6, %eax
	je	.L1000
	testl	%eax, %eax
	jne	.L1009
.L1000:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
	cmpl	$1, 24(%rax)
	jne	.L1010
.L1001:
	movl	$3, %edx
	cmpb	$0, 10(%rdi)
	je	.L1002
	cmpb	$1, 9(%rdi)
	sbbl	%edx, %edx
	andl	$2, %edx
	addl	$3, %edx
.L1002:
	movq	0(%rbp), %rcx
	movq	%r12, %r9
	movq	%rsi, %r8
	call	create_symbol
	movq	%rax, %rbp
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	movl	$0, %r13d
	cmpl	$5, 24(%rax)
	je	.L1011
.L1003:
	movq	%r13, %r8
	movq	%rbp, %rdx
	movq	%rsi, %rcx
	call	create_variable
.L995:
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
.L997:
	movq	16(%rbp), %rax
	leaq	1(%rax), %rsi
	movq	8(%rbp), %rbx
	addq	$1, %rbx
	movq	(%rdi), %rax
	movq	24(%rax), %rdi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rdi, %r8
	leaq	.LC167(%rip), %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L995
.L1009:
	movq	16(%rbp), %rax
	leaq	1(%rax), %r13
	movq	8(%rbp), %rbp
	addq	$1, %rbp
	movq	(%rdi), %rax
	movq	24(%rax), %r14
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%r13, 32(%rsp)
	movq	%rbp, %r9
	movq	%r14, %r8
	leaq	.LC168(%rip), %rdx
	call	fprintf
	jmp	.L1000
.L999:
	movq	16(%rbp), %rax
	leaq	1(%rax), %r13
	movq	8(%rbp), %rbp
	addq	$1, %rbp
	movq	(%rdi), %rax
	movq	24(%rax), %r14
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%r13, 32(%rsp)
	movq	%rbp, %r9
	movq	%r14, %r8
	leaq	.LC169(%rip), %rdx
	call	fprintf
	jmp	.L1000
.L1010:
	movq	16(%rax), %rax
	leaq	1(%rax), %r14
	movq	8(%rbp), %rax
	leaq	1(%rax), %r13
	movq	(%rdi), %rax
	movq	24(%rax), %r15
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%r14, 32(%rsp)
	movq	%r13, %r9
	movq	%r15, %r8
	leaq	.LC170(%rip), %rdx
	call	fprintf
	jmp	.L1001
.L1011:
	movq	144+symbolList(%rip), %rcx
	cmpq	%rcx, (%rax)
	jne	.L1003
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r14
	movq	%rdi, %r8
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L1003
	movq	16(%r14), %rax
	leaq	1(%rax), %rbx
	movq	8(%r14), %r12
	addq	$1, %r12
	movq	(%rdi), %rax
	movq	24(%rax), %rdi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%r12, %r9
	movq	%rdi, %r8
	leaq	.LC171(%rip), %rdx
	call	fprintf
	jmp	.L1003
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
	.def	parse_statement;	.scl	3;	.type	32;	.endef
parse_statement:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$104, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %r15
	movq	%r8, %rsi
	movq	80(%rcx), %rdx
	cmpl	$6, 24(%rdx)
	jne	.L1013
	movq	(%rdx), %rax
	cmpq	48+keywordList(%rip), %rax
	je	.L1101
	cmpq	80+keywordList(%rip), %rax
	je	.L1102
	cmpq	72+keywordList(%rip), %rax
	je	.L1103
	cmpq	168+keywordList(%rip), %rax
	je	.L1104
	cmpq	104+keywordList(%rip), %rax
	je	.L1105
	cmpq	112+keywordList(%rip), %rax
	je	.L1106
	cmpq	120+keywordList(%rip), %rax
	je	.L1107
	movq	%r15, %rdx
	call	parse_expression
	movq	$0, 40(%rsp)
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_statement
	movq	%rax, %rdi
	jmp	.L1083
.L1101:
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1015
	movq	symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1015
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rdi
	movq	%rsi, %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L1108
.L1018:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1019
	movq	8+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1019
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1021
	movq	16+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1021
	call	create_list
	movq	%rax, %r12
	movq	%rax, 88(%rsp)
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
	leaq	symbolList(%rip), %r13
	movq	%r14, 56(%rsp)
	jmp	.L1023
.L1015:
	movq	16(%rax), %rdi
	addq	$1, %rdi
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	(%rsi), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rsi, %r8
	leaq	.LC172(%rip), %rdx
	call	fprintf
	movl	$0, %edx
.L1017:
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$2, %ecx
	call	create_statement
	movq	%rax, %rdi
	jmp	.L1012
.L1108:
	movq	16(%rdi), %rax
	leaq	1(%rax), %rbp
	movq	8(%rdi), %rdi
	addq	$1, %rdi
	movq	(%rsi), %rax
	movq	24(%rax), %r12
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rbp, 32(%rsp)
	movq	%rdi, %r9
	movq	%r12, %r8
	leaq	.LC173(%rip), %rdx
	call	fprintf
	jmp	.L1018
.L1019:
	movq	16(%rax), %rdi
	addq	$1, %rdi
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	(%rsi), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rsi, %r8
	leaq	.LC174(%rip), %rdx
	call	fprintf
	movl	$0, %edx
	jmp	.L1017
.L1021:
	movq	16(%rax), %rdi
	addq	$1, %rdi
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	(%rsi), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rsi, %r8
	leaq	.LC175(%rip), %rdx
	call	fprintf
	movl	$0, %edx
	jmp	.L1017
.L1025:
	movq	%rsi, %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L1109
.L1024:
	movq	%rdi, %rdx
	movq	%r12, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L1023:
	cmpl	$5, 24(%rbp)
	jne	.L1025
	movq	24(%r13), %rax
	cmpq	%rax, 0(%rbp)
	jne	.L1025
	movq	56(%rsp), %r14
	call	create_list
	movq	%rax, 64(%rsp)
	call	create_list
	movq	%rax, 72(%rsp)
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	cmpl	$6, 24(%rax)
	jne	.L1027
	movq	%r14, 80(%rsp)
	jmp	.L1026
.L1109:
	movq	16(%rbp), %rax
	leaq	1(%rax), %r14
	movq	8(%rbp), %rax
	addq	$1, %rax
	movq	%rax, 48(%rsp)
	movq	(%rsi), %rax
	movq	24(%rax), %rbp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%r14, 32(%rsp)
	movq	48(%rsp), %r9
	movq	%rbp, %r8
	leaq	.LC176(%rip), %rdx
	call	fprintf
	jmp	.L1024
.L1028:
	movq	16(%rax), %rdi
	addq	$1, %rdi
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	(%rsi), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rsi, %r8
	leaq	.LC177(%rip), %rdx
	call	fprintf
	movl	$0, %edx
	jmp	.L1017
.L1113:
	movq	16(%rdi), %rax
	leaq	1(%rax), %rbp
	movq	8(%rdi), %rdi
	addq	$1, %rdi
	movq	(%rsi), %rax
	movq	24(%rax), %r12
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rbp, 32(%rsp)
	movq	%rdi, %r9
	movq	%r12, %r8
	leaq	.LC178(%rip), %rdx
	call	fprintf
	jmp	.L1030
.L1031:
	movq	16(%rax), %rdi
	addq	$1, %rdi
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	(%rsi), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rsi, %r8
	leaq	.LC179(%rip), %rdx
	call	fprintf
	movl	$0, %edx
	jmp	.L1017
.L1033:
	movq	16(%rax), %rdi
	addq	$1, %rdi
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	(%rsi), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rsi, %r8
	leaq	.LC180(%rip), %rdx
	call	fprintf
	movl	$0, %edx
	jmp	.L1017
.L1037:
	movq	%rsi, %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L1110
.L1036:
	movq	%rdi, %rdx
	movq	%rbp, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
.L1035:
	cmpl	$5, 24(%r12)
	jne	.L1037
	movq	24(%r14), %rax
	cmpq	%rax, (%r12)
	jne	.L1037
	movq	56(%rsp), %r13
	testq	%r13, %r13
	je	.L1111
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %rdx
	movq	%r13, (%rax)
	movq	%rbp, 8(%rax)
.L1039:
	movq	64(%rsp), %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	peek_next_token
	cmpl	$6, 24(%rax)
	jne	.L1098
.L1026:
	movq	56+keywordList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1112
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1028
	movq	symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1028
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rdi
	movq	%rsi, %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L1113
.L1030:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1031
	movq	8+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1031
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1033
	movq	16+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1033
	call	create_list
	movq	%rax, %rbp
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
	leaq	symbolList(%rip), %r14
	movq	%r13, 56(%rsp)
	jmp	.L1035
.L1110:
	movq	16(%r12), %rax
	leaq	1(%rax), %r13
	movq	8(%r12), %rax
	addq	$1, %rax
	movq	%rax, 48(%rsp)
	movq	(%rsi), %rax
	movq	24(%rax), %r12
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%r13, 32(%rsp)
	movq	48(%rsp), %r9
	movq	%r12, %r8
	leaq	.LC181(%rip), %rdx
	call	fprintf
	jmp	.L1036
.L1111:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %r9
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC182(%rip), %rcx
	call	fwrite
	movq	%r13, %rdx
	jmp	.L1039
.L1042:
	movq	16(%rax), %rdi
	addq	$1, %rdi
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	(%rsi), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rsi, %r8
	leaq	.LC183(%rip), %rdx
	call	fprintf
	movl	$0, %edx
	jmp	.L1017
.L1046:
	movq	%rsi, %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L1114
.L1045:
	movq	%rdi, %rdx
	movq	72(%rsp), %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r13
.L1044:
	cmpl	$5, 24(%r13)
	jne	.L1046
	movq	24(%r12), %rax
	cmpq	%rax, 0(%r13)
	jne	.L1046
	jmp	.L1027
.L1114:
	movq	16(%r13), %rax
	leaq	1(%rax), %rbp
	movq	8(%r13), %rax
	addq	$1, %rax
	movq	%rax, 48(%rsp)
	movq	(%rsi), %rax
	movq	24(%rax), %r13
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rbp, 32(%rsp)
	movq	48(%rsp), %r9
	movq	%r13, %r8
	leaq	.LC184(%rip), %rdx
	call	fprintf
	jmp	.L1045
.L1098:
	movq	80(%rsp), %r14
.L1027:
	testq	%r14, %r14
	je	.L1115
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, %rdx
	movq	%r14, (%rax)
	movq	88(%rsp), %rax
	movq	%rax, 8(%rdx)
	movq	64(%rsp), %rax
	movq	%rax, 16(%rdx)
	movq	72(%rsp), %rax
	movq	%rax, 24(%rdx)
	jmp	.L1017
.L1115:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %r9
	movl	$47, %r8d
	movl	$1, %edx
	leaq	.LC185(%rip), %rcx
	call	fwrite
	movq	%r14, %rdx
	jmp	.L1017
.L1102:
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1050
	movq	symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1050
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L1053
	movq	72+symbolList(%rip), %rax
	cmpq	%rax, 0(%rbp)
	je	.L1093
.L1053:
	movq	%rsi, %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	parse_variable
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L1116
.L1055:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1056
	movq	72+symbolList(%rip), %rcx
	cmpq	%rcx, (%rax)
	je	.L1054
.L1056:
	movq	16(%rax), %rdi
	addq	$1, %rdi
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	(%rsi), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rsi, %r8
	leaq	.LC188(%rip), %rdx
	call	fprintf
	movl	$0, %r9d
	jmp	.L1052
.L1050:
	movq	16(%rax), %rdi
	addq	$1, %rdi
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	(%rsi), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rsi, %r8
	leaq	.LC186(%rip), %rdx
	call	fprintf
	movl	$0, %r9d
.L1052:
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r8d
	movl	$0, %edx
	movl	$4, %ecx
	call	create_statement
	movq	%rax, %rdi
	jmp	.L1012
.L1116:
	movq	16(%rbp), %rax
	leaq	1(%rax), %r12
	movq	8(%rbp), %rbp
	addq	$1, %rbp
	movq	(%rsi), %rax
	movq	24(%rax), %r13
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%r12, 32(%rsp)
	movq	%rbp, %r9
	movq	%r13, %r8
	leaq	.LC187(%rip), %rdx
	call	fprintf
	jmp	.L1055
.L1093:
	movl	$0, %edi
.L1054:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
	cmpl	$5, 24(%rax)
	jne	.L1057
	movq	72+symbolList(%rip), %rax
	cmpq	%rax, 0(%rbp)
	je	.L1094
.L1057:
	movq	%rsi, %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L1117
.L1059:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1060
	movq	72+symbolList(%rip), %rcx
	cmpq	%rcx, (%rax)
	je	.L1058
.L1060:
	movq	16(%rax), %rdi
	addq	$1, %rdi
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	(%rsi), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rsi, %r8
	leaq	.LC190(%rip), %rdx
	call	fprintf
	movl	$0, %r9d
	jmp	.L1052
.L1117:
	movq	16(%rbp), %rax
	leaq	1(%rax), %r12
	movq	8(%rbp), %rbp
	addq	$1, %rbp
	movq	(%rsi), %rax
	movq	24(%rax), %r14
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%r12, 32(%rsp)
	movq	%rbp, %r9
	movq	%r14, %r8
	leaq	.LC189(%rip), %rdx
	call	fprintf
	jmp	.L1059
.L1094:
	movl	$0, %r13d
.L1058:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r12
	cmpl	$5, 24(%rax)
	jne	.L1061
	movq	8+symbolList(%rip), %rax
	cmpq	%rax, (%r12)
	je	.L1095
.L1061:
	movq	%rsi, %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, 48(%rsp)
	testq	%rax, %rax
	je	.L1118
.L1063:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1064
	movq	8+symbolList(%rip), %rcx
	cmpq	%rcx, (%rax)
	je	.L1062
.L1064:
	movq	16(%rax), %rdi
	addq	$1, %rdi
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	(%rsi), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rsi, %r8
	leaq	.LC192(%rip), %rdx
	call	fprintf
	movl	$0, %r9d
	jmp	.L1052
.L1118:
	movq	16(%r12), %rax
	leaq	1(%rax), %rbp
	movq	8(%r12), %rax
	leaq	1(%rax), %r14
	movq	(%rsi), %rax
	movq	24(%rax), %r12
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rbp, 32(%rsp)
	movq	%r14, %r9
	movq	%r12, %r8
	leaq	.LC191(%rip), %rdx
	call	fprintf
	jmp	.L1063
.L1095:
	movq	$0, 48(%rsp)
.L1062:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1065
	movq	16+symbolList(%rip), %rcx
	cmpq	%rcx, (%rax)
	jne	.L1065
	call	create_list
	movq	%rax, %r14
	movb	$1, 11(%rsi)
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
	jmp	.L1067
.L1065:
	movq	16(%rax), %rdi
	addq	$1, %rdi
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	(%rsi), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rsi, %r8
	leaq	.LC193(%rip), %rdx
	call	fprintf
	movl	$0, %r9d
	jmp	.L1052
.L1069:
	movq	%rsi, %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L1119
.L1068:
	movq	%r12, %rdx
	movq	%r14, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rbp
.L1067:
	cmpl	$5, 24(%rbp)
	jne	.L1069
	leaq	symbolList(%rip), %rax
	movq	24(%rax), %rax
	cmpq	%rax, 0(%rbp)
	jne	.L1069
	movb	$0, 11(%rsi)
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, %r9
	movq	%rdi, (%rax)
	movq	%r13, 8(%rax)
	movq	48(%rsp), %rax
	movq	%rax, 16(%r9)
	movq	%r14, 24(%r9)
	jmp	.L1052
.L1119:
	movq	16(%rbp), %rax
	addq	$1, %rax
	movq	%rax, 56(%rsp)
	movq	8(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 64(%rsp)
	movq	(%rsi), %rax
	movq	24(%rax), %rbp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	56(%rsp), %rax
	movq	%rax, 32(%rsp)
	movq	64(%rsp), %r9
	movq	%rbp, %r8
	leaq	.LC194(%rip), %rdx
	call	fprintf
	jmp	.L1068
.L1103:
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1071
	movq	symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1071
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rdi
	movq	%rsi, %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L1120
.L1074:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1075
	movq	8+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1075
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1077
	movq	16+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1077
	call	create_list
	movq	%rax, %r13
	movb	$1, 11(%rsi)
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rdi
	leaq	symbolList(%rip), %r14
	movq	%r12, 56(%rsp)
	jmp	.L1079
.L1071:
	movq	16(%rax), %rdi
	addq	$1, %rdi
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	(%rsi), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rsi, %r8
	leaq	.LC195(%rip), %rdx
	call	fprintf
	movl	$0, %r8d
.L1073:
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %edx
	movl	$3, %ecx
	call	create_statement
	movq	%rax, %rdi
	jmp	.L1012
.L1120:
	movq	16(%rdi), %rax
	leaq	1(%rax), %rbp
	movq	8(%rdi), %rdi
	addq	$1, %rdi
	movq	(%rsi), %rax
	movq	24(%rax), %r13
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rbp, 32(%rsp)
	movq	%rdi, %r9
	movq	%r13, %r8
	leaq	.LC196(%rip), %rdx
	call	fprintf
	jmp	.L1074
.L1075:
	movq	16(%rax), %rdi
	addq	$1, %rdi
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	(%rsi), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rsi, %r8
	leaq	.LC197(%rip), %rdx
	call	fprintf
	movl	$0, %r8d
	jmp	.L1073
.L1077:
	movq	16(%rax), %rdi
	addq	$1, %rdi
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	(%rsi), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rsi, %r8
	leaq	.LC198(%rip), %rdx
	call	fprintf
	movl	$0, %r8d
	jmp	.L1073
.L1081:
	movq	%rsi, %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	parse_statement
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L1121
.L1080:
	movq	%rbp, %rdx
	movq	%r13, %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %rdi
.L1079:
	cmpl	$5, 24(%rdi)
	jne	.L1081
	movq	24(%r14), %rax
	cmpq	%rax, (%rdi)
	jne	.L1081
	movq	56(%rsp), %r12
	movb	$0, 11(%rsi)
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %r8
	movq	%r12, (%rax)
	movq	%r13, 8(%rax)
	jmp	.L1073
.L1121:
	movq	16(%rdi), %rax
	leaq	1(%rax), %r12
	movq	8(%rdi), %rax
	addq	$1, %rax
	movq	%rax, 48(%rsp)
	movq	(%rsi), %rax
	movq	24(%rax), %rdi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%r12, 32(%rsp)
	movq	48(%rsp), %r9
	movq	%rdi, %r8
	leaq	.LC199(%rip), %rdx
	call	fprintf
	jmp	.L1080
.L1104:
	movl	$1, %edx
	call	get_next_token
	movq	%rsi, %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	parse_variable
	movq	%rax, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$1, %ecx
	call	create_statement
	movq	%rax, %rdi
	jmp	.L1083
.L1105:
	movl	$1, %edx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1085
	movq	72+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	je	.L1122
.L1085:
	movq	%rsi, %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	parse_expression
	movq	$0, 40(%rsp)
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$5, %ecx
	call	create_statement
	movq	%rax, %rdi
	jmp	.L1083
.L1122:
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$5, %ecx
	call	create_statement
	movq	%rax, %rdi
	jmp	.L1012
.L1106:
	cmpb	$0, 11(%r8)
	je	.L1123
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$6, %ecx
	call	create_statement
	movq	%rax, %rdi
	jmp	.L1083
.L1123:
	movq	16(%rdx), %rax
	leaq	1(%rax), %rdi
	movq	8(%rdx), %rbx
	addq	$1, %rbx
	movq	(%r8), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rsi, %r8
	leaq	.LC200(%rip), %rdx
	call	fprintf
	movl	$0, %edi
	jmp	.L1012
.L1107:
	cmpb	$0, 11(%r8)
	je	.L1124
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$7, %ecx
	call	create_statement
	movq	%rax, %rdi
	jmp	.L1083
.L1124:
	movq	16(%rdx), %rax
	leaq	1(%rax), %rdi
	movq	8(%rdx), %rbx
	addq	$1, %rbx
	movq	(%r8), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rsi, %r8
	leaq	.LC201(%rip), %rdx
	call	fprintf
	movl	$0, %edi
	jmp	.L1012
.L1013:
	movq	%r15, %rdx
	call	parse_expression
	movq	$0, 40(%rsp)
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_statement
	movq	%rax, %rdi
.L1083:
	testq	%rdi, %rdi
	je	.L1125
.L1090:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1091
	movq	72+symbolList(%rip), %rbx
	cmpq	%rbx, (%rax)
	je	.L1012
.L1091:
	movq	16(%rax), %rbx
	leaq	1(%rbx), %rbp
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	(%rsi), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rbp, 32(%rsp)
	movq	%rbx, %r9
	movq	%rsi, %r8
	leaq	.LC203(%rip), %rdx
	call	fprintf
.L1012:
	movq	%rdi, %rax
	addq	$104, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L1125:
	movq	80(%rbx), %rax
	movq	16(%rax), %rcx
	leaq	1(%rcx), %r12
	movq	8(%rax), %rbp
	addq	$1, %rbp
	movq	(%rsi), %rax
	movq	24(%rax), %r13
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%r12, 32(%rsp)
	movq	%rbp, %r9
	movq	%r13, %r8
	leaq	.LC202(%rip), %rdx
	call	fprintf
	jmp	.L1090
.L1112:
	movq	80(%rsp), %r14
	movq	64+keywordList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1027
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1042
	movq	16+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1042
	movl	$1, %edx
	movq	%rbx, %rcx
	call	get_next_token
	movq	%rax, %r13
	leaq	symbolList(%rip), %r12
	jmp	.L1044
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
	.ascii "Error creating import: name is NULL\12\0"
	.align 8
.LC216:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected function return type after 'func'\12\0"
	.align 8
.LC217:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown function return type\12\0"
	.align 8
.LC218:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected function name after return type\12\0"
	.align 8
.LC219:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after function name\12\0"
	.align 8
.LC220:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function parameter\12\0"
	.align 8
.LC221:
	.ascii "[Parser Error] at %s:%zu:%zu: Function parameters cannot have default values\12\0"
	.align 8
.LC222:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function parameter\12\0"
	.align 8
.LC223:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start function body\12\0"
	.align 8
.LC224:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function body statement\12\0"
	.align 8
.LC225:
	.ascii "[Parser Error] at %s:%zu:%zu: Unreachable code after return statement\12\0"
	.align 8
.LC226:
	.ascii "[Parser Error] at %s:%zu:%zu: Function missing return statement\12\0"
	.align 8
.LC227:
	.ascii "Error creating function: name or return_type is NULL\12\0"
	.align 8
.LC228:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected class name after 'class'\12\0"
	.align 8
.LC229:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start class body\12\0"
	.align 8
.LC230:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected method return type after 'method'\12\0"
	.align 8
.LC231:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown return type for method\12\0"
	.align 8
.LC232:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected method name after return type\12\0"
	.align 8
.LC233:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after method name\12\0"
	.align 8
.LC234:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected 'self' as first parameter of method\12\0"
	.align 8
.LC235:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after method parameter\12\0"
	.align 8
.LC236:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse method parameter\12\0"
	.align 8
.LC237:
	.ascii "[Parser Error] at %s:%zu:%zu: Method parameters cannot have default values\12\0"
	.align 8
.LC238:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start method body\12\0"
	.align 8
.LC239:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse method body statement\12\0"
	.align 8
.LC240:
	.ascii "[Parser Error] at %s:%zu:%zu: Method missing return statement\12\0"
	.align 8
.LC241:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse class method\12\0"
	.align 8
.LC242:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse class variable\12\0"
	.align 8
.LC243:
	.ascii "[Parser Error] at %s:%zu:%zu: Unsupported type for class variable\12\0"
	.align 8
.LC244:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after class variable declaration\12\0"
	.align 8
.LC245:
	.ascii "[Parser Error] at %s:%zu:%zu: Unexpected token in class member\12\0"
	.align 8
.LC246:
	.ascii "[Parser Error] at %s:%zu:%zu: Constructor name conflicts with existing member\12\0"
.LC247:
	.ascii "0\0"
	.align 8
.LC248:
	.ascii "[Parser Error] at %s:%zu:%zu: Unexpected token in code member\12\0"
	.align 8
.LC249:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse import statement\12\0"
	.align 8
.LC250:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to import module\12\0"
	.align 8
.LC251:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function declaration\12\0"
	.align 8
.LC252:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse class declaration\12\0"
	.text
	.def	parse_code;	.scl	3;	.type	32;	.endef
parse_code:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$200, %rsp
	movq	%rcx, %r12
	movq	%rdx, %rbx
	movq	%r8, %r14
	cmpq	$0, builtin_scope(%rip)
	je	.L1245
.L1127:
	testq	%rbx, %rbx
	cmove	builtin_scope(%rip), %rbx
	call	create_list
	movq	%rax, 72(%rsp)
	movq	%rbx, %rcx
	call	create_symbol_table
	movq	%rax, 64(%rsp)
	movl	$1, %edx
	movq	%r12, %rcx
	call	get_next_token
	movq	%rax, 56(%rsp)
	movq	__imp___acrt_iob_func(%rip), %r13
	movq	%r14, %r15
	movq	%r12, %r14
	testq	%rax, %rax
	jne	.L1129
.L1130:
	movl	$16, %ecx
	call	alloc_memory
	movq	72(%rsp), %rsi
	movq	%rsi, (%rax)
	movq	64(%rsp), %rsi
	movq	%rsi, 8(%rax)
	addq	$200, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L1245:
	movl	$0, %ecx
	call	create_symbol_table
	movq	%rax, %r9
	movq	%rax, builtin_scope(%rip)
	movl	$0, %r8d
	movl	$6, %edx
	movq	160+keywordList(%rip), %rcx
	call	create_symbol
	movq	%rax, name_void(%rip)
	movq	builtin_scope(%rip), %r9
	movl	$0, %r8d
	movl	$6, %edx
	movq	128+keywordList(%rip), %rcx
	call	create_symbol
	movq	%rax, name_int(%rip)
	movq	builtin_scope(%rip), %r9
	movl	$0, %r8d
	movl	$6, %edx
	movq	136+keywordList(%rip), %rcx
	call	create_symbol
	movq	%rax, name_float(%rip)
	movq	builtin_scope(%rip), %r9
	movl	$0, %r8d
	movl	$6, %edx
	movq	144+keywordList(%rip), %rcx
	call	create_symbol
	movq	%rax, name_string(%rip)
	movq	builtin_scope(%rip), %r9
	movl	$0, %r8d
	movl	$6, %edx
	movq	152+keywordList(%rip), %rcx
	call	create_symbol
	movq	%rax, name_bool(%rip)
	jmp	.L1127
.L1261:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	cmpl	$1, 24(%rax)
	jne	.L1246
	movq	(%rax), %r12
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rsi
	movq	$0, 80(%rsp)
	cmpl	$6, 24(%rax)
	je	.L1247
.L1135:
	cmpl	$5, 24(%rsi)
	jne	.L1136
	movq	72+symbolList(%rip), %rax
	cmpq	%rax, (%rsi)
	jne	.L1136
	movq	(%r15), %rcx
	cmpq	$0, 80(%rsp)
	je	.L1248
	call	get_file_dir
	movq	%rax, %rdx
	movq	80(%rsp), %rcx
	call	absolute_path
	movq	%rax, %rdi
.L1140:
	leaq	.LC209(%rip), %rdx
	movq	%rdi, %rcx
	call	fopen
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L1249
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	movq	%rax, 96(%rsp)
	call	*%rax
	movq	%rax, %rcx
	movq	%rdi, %r8
	leaq	.LC211(%rip), %rdx
	call	fprintf
	movq	$0, 184(%rsp)
	leaq	184(%rsp), %rdx
	movq	%rbp, %rcx
	call	read_source
	movq	%rax, 88(%rsp)
	movq	%rbp, %rcx
	call	fclose
	movq	%rdi, %rcx
	call	create_file
	movq	%rax, %rbx
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %rbp
	movb	$0, 8(%rax)
	movb	$0, 9(%rax)
	movb	$0, 11(%rax)
	movq	%rbx, (%rax)
	movq	builtin_scope(%rip), %rbx
	movq	%rdi, %r8
	movq	184(%rsp), %rdx
	movq	88(%rsp), %rcx
	call	create_lexer
	movq	%rax, %rcx
	movq	%rbp, %r8
	movq	%rbx, %rdx
	call	parse_code
	movq	%rax, %rbp
	movl	$2, %ecx
	movq	96(%rsp), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rdi, %r8
	leaq	.LC212(%rip), %rdx
	call	fprintf
	testq	%rbp, %rbp
	je	.L1250
	movq	8(%rbp), %rcx
	movq	%r12, %rdx
	call	search_name_use_strcmp
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L1144
	movq	64(%rsp), %rax
	movq	8(%rax), %rcx
	movq	%rbp, %rdx
	call	list_append
.L1145:
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %rdx
	movq	%rbp, (%rax)
	movq	80(%rsp), %rax
	movq	%rax, 8(%rdx)
.L1230:
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	call	create_code_member
	movq	%rax, %rdx
	movq	72(%rsp), %rcx
	call	list_append
	jmp	.L1146
.L1246:
	movq	16(%rax), %rsi
	leaq	1(%rsi), %rdi
	movq	8(%rax), %rsi
	addq	$1, %rsi
	movq	(%r15), %rax
	movq	24(%rax), %rbp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbp, %r8
	leaq	.LC204(%rip), %rdx
	call	fprintf
	jmp	.L1134
.L1247:
	movq	8+keywordList(%rip), %rax
	cmpq	%rax, (%rsi)
	je	.L1251
.L1136:
	movq	16(%rsi), %rax
	leaq	1(%rax), %rdi
	movq	8(%rsi), %rsi
	addq	$1, %rsi
	movq	(%r15), %rax
	movq	24(%rax), %rbp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbp, %r8
	leaq	.LC206(%rip), %rdx
	call	fprintf
.L1134:
	movq	56(%rsp), %rax
	movq	16(%rax), %rbx
	movq	%rbx, 56(%rsp)
	movq	%rbx, %rsi
	addq	$1, %rsi
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	(%r15), %rax
	movq	24(%rax), %rdi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rdi, %r8
	leaq	.LC249(%rip), %rdx
	call	fprintf
	movl	$0, %edx
	jmp	.L1230
.L1251:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	cmpl	$4, 24(%rax)
	jne	.L1252
	movq	(%rax), %rax
	movq	%rax, 80(%rsp)
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rsi
	jmp	.L1135
.L1252:
	movq	16(%rax), %rbx
	leaq	1(%rbx), %rdi
	movq	8(%rax), %rsi
	addq	$1, %rsi
	movq	(%r15), %rax
	movq	24(%rax), %rbp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbp, %r8
	leaq	.LC205(%rip), %rdx
	call	fprintf
	jmp	.L1134
.L1248:
	movq	%r12, %rcx
	call	strlen
	leaq	4(%rax), %rdx
	movl	$0, %r8d
	leaq	.LC99(%rip), %rcx
	call	create_string_check
	movq	%rax, %rdi
	movq	%r12, %r8
	leaq	.LC207(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	leaq	.LC208(%rip), %rdx
	movq	%rdi, %rcx
	call	absolute_path
	movq	%rax, %rdi
	jmp	.L1140
.L1249:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, %r8
	leaq	.LC210(%rip), %rdx
	call	fprintf
	jmp	.L1142
.L1250:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, %r8
	leaq	.LC213(%rip), %rdx
	call	fprintf
	jmp	.L1142
.L1144:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, %r9
	movq	%r12, %r8
	leaq	.LC214(%rip), %rdx
	call	fprintf
.L1142:
	movq	16(%rsi), %rax
	leaq	1(%rax), %rdi
	movq	8(%rsi), %rsi
	addq	$1, %rsi
	movq	(%r15), %rax
	movq	24(%rax), %rbp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbp, %r8
	leaq	.LC250(%rip), %rdx
	call	fprintf
	movq	64(%rsp), %r9
	movq	name_void(%rip), %r8
	movl	$3, %edx
	movq	%r12, %rcx
	call	create_symbol
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L1145
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %r9
	movl	$36, %r8d
	movl	$1, %edx
	leaq	.LC215(%rip), %rcx
	call	fwrite
	jmp	.L1134
.L1149:
	movq	16(%rsi), %rax
	leaq	1(%rax), %rdi
	movq	8(%rsi), %rsi
	addq	$1, %rsi
	movq	(%r15), %rax
	movq	24(%rax), %rbp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbp, %r8
	leaq	.LC216(%rip), %rdx
	call	fprintf
	jmp	.L1150
.L1262:
	movq	16(%rsi), %rax
	leaq	1(%rax), %rdi
	movq	8(%rsi), %rsi
	addq	$1, %rsi
	movq	(%r15), %rax
	movq	24(%rax), %rbp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbp, %r8
	leaq	.LC217(%rip), %rdx
	call	fprintf
	jmp	.L1150
.L1263:
	movq	16(%rax), %rax
	leaq	1(%rax), %rdi
	movq	8(%rsi), %rsi
	addq	$1, %rsi
	movq	(%r15), %rax
	movq	24(%rax), %rbp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbp, %r8
	leaq	.LC218(%rip), %rdx
	call	fprintf
	jmp	.L1150
.L1153:
	movq	16(%rax), %rsi
	leaq	1(%rsi), %rdi
	movq	8(%rax), %rsi
	addq	$1, %rsi
	movq	(%r15), %rax
	movq	24(%rax), %rbp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbp, %r8
	leaq	.LC219(%rip), %rdx
	call	fprintf
.L1150:
	movq	56(%rsp), %rax
	movq	16(%rax), %rdi
	movq	%rdi, 56(%rsp)
	leaq	1(%rdi), %rsi
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	(%r15), %rax
	movq	24(%rax), %rdi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rdi, %r8
	leaq	.LC251(%rip), %rdx
	call	fprintf
	movq	$0, 80(%rsp)
.L1232:
	movl	$0, %r9d
	movq	80(%rsp), %r8
	movl	$0, %edx
	movl	$1, %ecx
	call	create_code_member
	movq	%rax, %rdx
	movq	72(%rsp), %rcx
	call	list_append
	jmp	.L1146
.L1255:
	movq	16(%rsi), %rax
	leaq	1(%rax), %rdi
	movq	8(%rsi), %rbx
	addq	$1, %rbx
	movq	(%r15), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rsi, %r8
	leaq	.LC220(%rip), %rdx
	call	fprintf
	jmp	.L1157
.L1158:
	movq	%rax, %rdx
	movq	88(%rsp), %rcx
	call	list_append
	jmp	.L1157
.L1256:
	movq	(%rax), %rax
	cmpq	32(%rbp), %rax
	je	.L1253
	cmpq	8(%rbp), %rax
	jne	.L1159
.L1155:
	cmpl	$5, 24(%rsi)
	jne	.L1162
	movq	8(%rbp), %rax
	cmpq	%rax, (%rsi)
	je	.L1254
.L1162:
	movq	%r15, %r8
	movq	%r12, %rdx
	movq	%r14, %rcx
	call	parse_variable
	testq	%rax, %rax
	je	.L1255
	cmpq	$0, 16(%rax)
	je	.L1158
	movq	16(%rsi), %rax
	leaq	1(%rax), %rdi
	movq	8(%rsi), %rbx
	addq	$1, %rbx
	movq	(%r15), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rsi, %r8
	leaq	.LC221(%rip), %rdx
	call	fprintf
.L1157:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$5, 24(%rax)
	je	.L1256
.L1159:
	movq	16(%rsi), %rax
	leaq	1(%rax), %rdi
	movq	8(%rsi), %rsi
	addq	$1, %rsi
	movq	(%r15), %rax
	movq	24(%rax), %rbp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbp, %r8
	leaq	.LC222(%rip), %rdx
	call	fprintf
	jmp	.L1150
.L1253:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rsi
	jmp	.L1155
.L1254:
	movq	104(%rsp), %rdi
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1163
	movq	16+symbolList(%rip), %rsi
	cmpq	%rsi, (%rax)
	jne	.L1163
	call	create_list
	movq	%rax, 104(%rsp)
	movb	$1, 8(%r15)
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rsi
	movl	$0, %ebp
	movq	%rdi, 120(%rsp)
	jmp	.L1165
.L1163:
	movq	16(%rax), %rsi
	leaq	1(%rsi), %rdi
	movq	8(%rax), %rsi
	addq	$1, %rsi
	movq	(%r15), %rax
	movq	24(%rax), %rbp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbp, %r8
	leaq	.LC223(%rip), %rdx
	call	fprintf
	jmp	.L1150
.L1169:
	movq	%r15, %r8
	movq	%r12, %rdx
	movq	%r14, %rcx
	call	parse_statement
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L1257
	testb	%bpl, %bpl
	jne	.L1258
.L1168:
	cmpl	$5, 8(%rbx)
	movl	$1, %eax
	cmove	%eax, %ebp
.L1167:
	movq	%rbx, %rdx
	movq	104(%rsp), %rcx
	call	list_append
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rsi
.L1165:
	cmpl	$5, 24(%rsi)
	jne	.L1169
	leaq	symbolList(%rip), %rax
	movq	24(%rax), %rax
	cmpq	%rax, (%rsi)
	jne	.L1169
	movq	120(%rsp), %rdi
	movb	$0, 8(%r15)
	testb	%bpl, %bpl
	jne	.L1170
	cmpq	name_void(%rip), %rdi
	je	.L1171
	movq	16(%rsi), %rax
	leaq	1(%rax), %rbp
	movq	8(%rsi), %rax
	leaq	1(%rax), %rbx
	movq	(%r15), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rbp, 32(%rsp)
	movq	%rbx, %r9
	movq	%rsi, %r8
	leaq	.LC226(%rip), %rdx
	call	fprintf
	cmpq	name_void(%rip), %rdi
	je	.L1171
.L1170:
	cmpq	$0, 96(%rsp)
	je	.L1259
	movq	80(%rsp), %rax
	movq	96(%rsp), %rbx
	movq	%rbx, (%rax)
	movq	%rdi, 8(%rax)
	movq	88(%rsp), %rsi
	movq	%rsi, 16(%rax)
	movq	104(%rsp), %rdi
	movq	%rdi, 24(%rax)
	movq	%r12, 32(%rax)
	jmp	.L1232
.L1257:
	movq	16(%rsi), %rax
	leaq	1(%rax), %rdi
	movq	8(%rsi), %rsi
	leaq	1(%rsi), %rax
	movq	%rax, 112(%rsp)
	movq	(%r15), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	112(%rsp), %r9
	movq	%rsi, %r8
	leaq	.LC224(%rip), %rdx
	call	fprintf
	jmp	.L1167
.L1258:
	movq	16(%rsi), %rax
	leaq	1(%rax), %rdi
	movq	8(%rsi), %rsi
	leaq	1(%rsi), %rax
	movq	%rax, 112(%rsp)
	movq	(%r15), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	112(%rsp), %r9
	movq	%rsi, %r8
	leaq	.LC225(%rip), %rdx
	call	fprintf
	jmp	.L1168
.L1171:
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$5, %ecx
	call	create_statement
	movq	%rax, %rdx
	movq	104(%rsp), %rcx
	call	list_append
	jmp	.L1170
.L1259:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %r9
	movl	$53, %r8d
	movl	$1, %edx
	leaq	.LC227(%rip), %rcx
	call	fwrite
	jmp	.L1150
.L1147:
	cmpq	24+keywordList(%rip), %rax
	je	.L1260
.L1131:
	movq	56(%rsp), %rax
	movq	16(%rax), %rdi
	movq	%rdi, 56(%rsp)
	leaq	1(%rdi), %rsi
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	(%r15), %rax
	movq	24(%rax), %rdi
	movl	$2, %ecx
	call	*%r13
	movq	%rax, %rcx
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rdi, %r8
	leaq	.LC248(%rip), %rdx
	call	fprintf
.L1146:
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, 56(%rsp)
	testq	%rax, %rax
	je	.L1130
.L1129:
	movq	56(%rsp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	je	.L1130
	cmpl	$6, %eax
	jne	.L1131
	movq	56(%rsp), %rax
	movq	(%rax), %rax
	cmpq	keywordList(%rip), %rax
	je	.L1261
	cmpq	16+keywordList(%rip), %rax
	jne	.L1147
	movq	64(%rsp), %rcx
	call	create_symbol_table
	movq	%rax, %r12
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rsi
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L1148
	cmpl	$6, %eax
	jne	.L1149
	movq	(%rsi), %rax
	cmpq	128+keywordList(%rip), %rax
	je	.L1148
	cmpq	136+keywordList(%rip), %rax
	je	.L1148
	cmpq	144+keywordList(%rip), %rax
	je	.L1148
	cmpq	152+keywordList(%rip), %rax
	je	.L1148
	cmpq	160+keywordList(%rip), %rax
	jne	.L1149
.L1148:
	movq	(%rsi), %rdx
	movq	64(%rsp), %rcx
	call	search_name
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L1262
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$1, 24(%rax)
	jne	.L1263
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, %r9
	movq	%rax, 80(%rsp)
	movq	%r12, 32(%rax)
	movq	(%rsi), %rcx
	movq	%rdi, %r8
	movl	$1, %edx
	call	create_symbol
	movq	%rax, 96(%rsp)
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1153
	movq	symbolList(%rip), %rsi
	cmpq	%rsi, (%rax)
	jne	.L1153
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rsi
	call	create_list
	movq	%rax, 88(%rsp)
	leaq	symbolList(%rip), %rbp
	movq	%rdi, 104(%rsp)
	jmp	.L1155
.L1260:
	movq	64(%rsp), %rcx
	call	create_symbol_table
	movq	%rax, 80(%rsp)
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$1, 24(%rax)
	jne	.L1264
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, %r9
	movq	%rax, 104(%rsp)
	movq	80(%rsp), %rax
	movq	%rax, 16(%r9)
	movq	(%rsi), %rcx
	movl	$0, %r8d
	movl	$0, %edx
	call	create_symbol
	movq	%rax, 96(%rsp)
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1175
	movq	16+symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1175
	call	create_list
	movq	%rax, 112(%rsp)
	movl	$1, %edx
	movq	%r14, %rcx
	call	get_next_token
	movq	%rax, 56(%rsp)
	movq	$0, 136(%rsp)
	movq	__imp___acrt_iob_func(%rip), %r12
	movq	%r14, %rbp
	jmp	.L1177
.L1264:
	movq	16(%rax), %rax
	leaq	1(%rax), %rdi
	movq	8(%rsi), %rsi
	addq	$1, %rsi
	movq	(%r15), %rax
	movq	24(%rax), %rbp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbp, %r8
	leaq	.LC228(%rip), %rdx
	call	fprintf
	jmp	.L1174
.L1175:
	movq	16(%rax), %rdi
	addq	$1, %rdi
	movq	8(%rax), %rsi
	addq	$1, %rsi
	movq	(%r15), %rax
	movq	24(%rax), %rbp
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbp, %r8
	leaq	.LC229(%rip), %rdx
	call	fprintf
.L1174:
	movq	56(%rsp), %rax
	movq	16(%rax), %rbx
	movq	%rbx, 56(%rsp)
	movq	%rbx, %rsi
	addq	$1, %rsi
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	(%r15), %rax
	movq	24(%rax), %rdi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rdi, %r8
	leaq	.LC252(%rip), %rdx
	call	fprintf
	movq	$0, 104(%rsp)
	jmp	.L1233
.L1181:
	movq	16(%rsi), %rax
	leaq	1(%rax), %rdi
	movq	8(%rsi), %rsi
	addq	$1, %rsi
	movq	(%r15), %rax
	movq	24(%rax), %rbx
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC230(%rip), %rdx
	call	fprintf
	jmp	.L1234
.L1271:
	movq	16(%rsi), %rax
	leaq	1(%rax), %rdi
	movq	8(%rsi), %rsi
	addq	$1, %rsi
	movq	(%r15), %rax
	movq	24(%rax), %rbx
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC231(%rip), %rdx
	call	fprintf
	jmp	.L1234
.L1272:
	movq	16(%rax), %rax
	leaq	1(%rax), %rdi
	movq	8(%rsi), %rsi
	addq	$1, %rsi
	movq	(%r15), %rax
	movq	24(%rax), %rbx
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC232(%rip), %rdx
	call	fprintf
	jmp	.L1234
.L1185:
	movq	16(%rax), %rdi
	addq	$1, %rdi
	movq	8(%rax), %rsi
	addq	$1, %rsi
	movq	(%r15), %rax
	movq	24(%rax), %rbx
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC233(%rip), %rdx
	call	fprintf
.L1234:
	movq	56(%rsp), %rax
	movq	16(%rax), %rsi
	movq	%rsi, 56(%rsp)
	leaq	1(%rsi), %rsi
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	(%r15), %rax
	movq	24(%rax), %rdi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rdi, %r8
	leaq	.LC241(%rip), %rdx
	call	fprintf
	movl	$0, %edx
	jmp	.L1207
.L1193:
	movq	16(%rsi), %rax
	leaq	1(%rax), %rdi
	movq	8(%rsi), %rsi
	addq	$1, %rsi
	movq	(%r15), %rax
	movq	24(%rax), %rbx
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC235(%rip), %rdx
	call	fprintf
	jmp	.L1234
.L1265:
	movq	16(%rbx), %rax
	leaq	1(%rax), %rsi
	movq	8(%rbx), %rbx
	addq	$1, %rbx
	movq	(%r15), %rax
	movq	24(%rax), %rdi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rdi, %r8
	leaq	.LC236(%rip), %rdx
	call	fprintf
	jmp	.L1195
.L1196:
	movq	%rax, %rdx
	movq	144(%rsp), %rcx
	call	list_append
	jmp	.L1195
.L1266:
	movq	8(%r14), %rdi
	cmpq	%rdi, (%rsi)
	je	.L1194
	movq	32(%r14), %rdi
	cmpq	%rdi, (%rsi)
	jne	.L1190
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rbx
	movq	%r15, %r8
	movq	88(%rsp), %rdx
	movq	%rbp, %rcx
	call	parse_variable
	testq	%rax, %rax
	je	.L1265
	cmpq	$0, 16(%rax)
	je	.L1196
	movq	16(%rbx), %rax
	leaq	1(%rax), %rsi
	movq	8(%rbx), %rbx
	addq	$1, %rbx
	movq	(%r15), %rax
	movq	24(%rax), %rdi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rdi, %r8
	leaq	.LC237(%rip), %rdx
	call	fprintf
.L1195:
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rsi
.L1189:
	movl	24(%rsi), %eax
	cmpl	$5, %eax
	je	.L1266
.L1190:
	cmpl	$5, %eax
	jne	.L1193
	movq	8+symbolList(%rip), %rax
	cmpq	%rax, (%rsi)
	jne	.L1193
.L1194:
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1198
	movq	16+symbolList(%rip), %rbx
	cmpq	%rbx, (%rax)
	jne	.L1198
	call	create_list
	movq	%rax, 128(%rsp)
	movb	$1, 8(%r15)
	movb	$1, 9(%r15)
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rdi
	movl	$0, %r14d
	jmp	.L1200
.L1198:
	movq	16(%rax), %rdi
	addq	$1, %rdi
	movq	8(%rax), %rsi
	addq	$1, %rsi
	movq	(%r15), %rax
	movq	24(%rax), %rbx
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC238(%rip), %rdx
	call	fprintf
	jmp	.L1234
.L1204:
	movq	%r15, %r8
	movq	88(%rsp), %rdx
	movq	%rbp, %rcx
	call	parse_statement
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L1267
	testb	%r14b, %r14b
	jne	.L1268
.L1203:
	cmpl	$5, 8(%rbx)
	movl	$1, %eax
	cmove	%eax, %r14d
.L1202:
	movq	%rbx, %rdx
	movq	128(%rsp), %rcx
	call	list_append
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rdi
.L1200:
	cmpl	$5, 24(%rdi)
	jne	.L1204
	leaq	symbolList(%rip), %rax
	movq	24(%rax), %rax
	cmpq	%rax, (%rdi)
	jne	.L1204
	movb	$0, 8(%r15)
	movb	$0, 9(%r15)
	testb	%r14b, %r14b
	jne	.L1205
	movq	120(%rsp), %r14
	cmpq	name_void(%rip), %r14
	je	.L1206
	movq	16(%rdi), %rax
	leaq	1(%rax), %rsi
	movq	8(%rdi), %rax
	leaq	1(%rax), %rbx
	movq	(%r15), %rax
	movq	24(%rax), %rdi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rdi, %r8
	leaq	.LC240(%rip), %rdx
	call	fprintf
	cmpq	name_void(%rip), %r14
	je	.L1206
.L1205:
	movq	88(%rsp), %rax
	movq	%rax, 40(%rsp)
	movq	128(%rsp), %rax
	movq	%rax, 32(%rsp)
	movq	144(%rsp), %r9
	movq	120(%rsp), %r8
	movq	160(%rsp), %rdx
	movq	152(%rsp), %rcx
	call	create_method_use_ptr
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L1234
.L1207:
	movl	$0, %r8d
	movl	$0, %ecx
	call	create_class_member
	movq	%rax, %rdx
	movq	112(%rsp), %rcx
	call	list_append
	jmp	.L1208
.L1267:
	movq	16(%rdi), %rax
	addq	$1, %rax
	movq	%rax, 168(%rsp)
	movq	8(%rdi), %rsi
	addq	$1, %rsi
	movq	(%r15), %rax
	movq	24(%rax), %rdi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	168(%rsp), %rax
	movq	%rax, 32(%rsp)
	movq	%rsi, %r9
	movq	%rdi, %r8
	leaq	.LC239(%rip), %rdx
	call	fprintf
	jmp	.L1202
.L1268:
	movq	16(%rdi), %rax
	addq	$1, %rax
	movq	%rax, 168(%rsp)
	movq	8(%rdi), %rsi
	addq	$1, %rsi
	movq	(%r15), %rax
	movq	24(%rax), %rdi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	168(%rsp), %rax
	movq	%rax, 32(%rsp)
	movq	%rsi, %r9
	movq	%rdi, %r8
	leaq	.LC225(%rip), %rdx
	call	fprintf
	jmp	.L1203
.L1206:
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$5, %ecx
	call	create_statement
	movq	%rax, %rdx
	movq	128(%rsp), %rcx
	call	list_append
	jmp	.L1205
.L1179:
	cmpq	168+keywordList(%rip), %rax
	je	.L1269
.L1178:
	movq	56(%rsp), %rax
	movq	16(%rax), %rsi
	movq	%rsi, 56(%rsp)
	leaq	1(%rsi), %rsi
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	(%r15), %rax
	movq	24(%rax), %rdi
	movl	$2, %ecx
	call	*%r12
	movq	%rax, %rcx
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rdi, %r8
	leaq	.LC245(%rip), %rdx
	call	fprintf
.L1208:
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, 56(%rsp)
.L1177:
	movq	56(%rsp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	je	.L1270
	cmpl	$6, %eax
	jne	.L1178
	movq	56(%rsp), %rax
	movq	(%rax), %rax
	cmpq	32+keywordList(%rip), %rax
	jne	.L1179
	movq	80(%rsp), %rcx
	call	create_symbol_table
	movq	%rax, 88(%rsp)
	movq	%rax, %r9
	movq	96(%rsp), %r8
	movl	$3, %edx
	movq	40+keywordList(%rip), %rcx
	call	create_symbol
	movq	%rax, %r14
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rsi
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L1180
	cmpl	$6, %eax
	jne	.L1181
	movq	(%rsi), %rax
	cmpq	128+keywordList(%rip), %rax
	je	.L1180
	cmpq	136+keywordList(%rip), %rax
	je	.L1180
	cmpq	144+keywordList(%rip), %rax
	je	.L1180
	cmpq	152+keywordList(%rip), %rax
	je	.L1180
	cmpq	160+keywordList(%rip), %rax
	jne	.L1181
.L1180:
	movq	(%rsi), %rdx
	movq	80(%rsp), %rcx
	call	search_name
	movq	%rax, 120(%rsp)
	testq	%rax, %rax
	je	.L1271
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rsi
	cmpl	$1, 24(%rax)
	jne	.L1272
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, %rdi
	movq	%rax, 152(%rsp)
	movq	88(%rsp), %rax
	movq	%rax, 32(%rdi)
	movq	(%rsi), %rdx
	movq	96(%rsp), %rax
	movq	8(%rax), %rcx
	call	make_method_name
	movq	%rax, %rcx
	movq	%rdi, %r9
	movq	120(%rsp), %r8
	movl	$2, %edx
	call	create_symbol
	movq	%rax, 160(%rsp)
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1185
	movq	symbolList(%rip), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1185
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	cmpl	$6, 24(%rax)
	jne	.L1187
	movq	40+keywordList(%rip), %rsi
	cmpq	%rsi, (%rax)
	je	.L1188
.L1187:
	movq	16(%rax), %rdi
	addq	$1, %rdi
	movq	8(%rax), %rsi
	leaq	1(%rsi), %rbx
	movq	(%r15), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rsi, %r8
	leaq	.LC234(%rip), %rdx
	call	fprintf
.L1188:
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %rsi
	call	create_list
	movq	%rax, %rdi
	movq	%rax, 144(%rsp)
	movl	$0, %r8d
	movq	%r14, %rdx
	movq	96(%rsp), %rcx
	call	create_variable
	movq	%rax, %rdx
	movq	%rdi, %rcx
	call	list_append
	leaq	symbolList(%rip), %r14
	jmp	.L1189
.L1269:
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	movq	%rax, %r14
	movb	$1, 10(%r15)
	movq	%r15, %r8
	movq	80(%rsp), %rdx
	movq	%rbp, %rcx
	call	parse_variable
	movq	%rax, %rbx
	movb	$0, 10(%r15)
	testq	%rax, %rax
	je	.L1273
.L1209:
	movq	%rbx, %r8
	movl	$0, %edx
	movl	$1, %ecx
	call	create_class_member
	movq	%rax, %rbx
	movq	%rax, %rdx
	movq	112(%rsp), %rcx
	call	list_append
	cmpl	$1, 8(%rbx)
	je	.L1274
.L1210:
	movl	$1, %edx
	movq	%rbp, %rcx
	call	get_next_token
	cmpl	$5, 24(%rax)
	jne	.L1216
	leaq	symbolList(%rip), %rsi
	movq	72(%rsi), %rsi
	cmpq	%rsi, (%rax)
	je	.L1208
.L1216:
	movq	16(%rax), %rdi
	leaq	1(%rdi), %rsi
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	(%r15), %rax
	movq	24(%rax), %rdi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rdi, %r8
	leaq	.LC244(%rip), %rdx
	call	fprintf
	jmp	.L1208
.L1273:
	movq	16(%r14), %rax
	leaq	1(%rax), %rdi
	movq	8(%r14), %rax
	addq	$1, %rax
	movq	%rax, 56(%rsp)
	movq	(%r15), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, 32(%rsp)
	movq	56(%rsp), %r9
	movq	%rsi, %r8
	leaq	.LC242(%rip), %rdx
	call	fprintf
	jmp	.L1209
.L1274:
	movq	(%rbx), %rax
	movq	(%rax), %rax
	cmpq	name_int(%rip), %rax
	je	.L1211
	cmpq	name_float(%rip), %rax
	je	.L1211
	cmpq	name_string(%rip), %rax
	je	.L1211
	cmpq	name_bool(%rip), %rax
	je	.L1213
	cmpq	name_void(%rip), %rax
	je	.L1213
	cmpl	$0, 32(%rax)
	jne	.L1215
	addq	$8, 136(%rsp)
	jmp	.L1210
.L1211:
	addq	$8, 136(%rsp)
	jmp	.L1210
.L1213:
	addq	$1, 136(%rsp)
	jmp	.L1210
.L1215:
	movq	16(%r14), %rax
	leaq	1(%rax), %rsi
	movq	8(%r14), %rbx
	addq	$1, %rbx
	movq	(%r15), %rax
	movq	24(%rax), %rdi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rdi, %r8
	leaq	.LC243(%rip), %rdx
	call	fprintf
	jmp	.L1210
.L1270:
	movq	56(%rsp), %rax
	leaq	symbolList(%rip), %rsi
	movq	24(%rsi), %rdi
	cmpq	%rdi, (%rax)
	jne	.L1178
	movq	%rbp, %r14
	movq	96(%rsp), %rax
	movq	8(%rax), %rcx
	movq	DEFAULT_INIT_NAME(%rip), %rdx
	call	make_method_name
	movq	%rax, %rbx
	movq	%rax, %rdx
	movq	80(%rsp), %rcx
	call	search_name_use_strcmp
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L1275
.L1218:
	cmpl	$2, 32(%r12)
	jne	.L1276
.L1219:
	movq	96(%rsp), %rbp
	movq	8(%rbp), %rcx
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	call	make_method_name
	movq	%rax, %rbx
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, %rsi
	movq	%rax, 88(%rsp)
	movq	80(%rsp), %rcx
	call	create_symbol_table
	movq	%rax, 32(%rsi)
	movq	%rsi, %r9
	movq	%rbp, %r8
	movl	$2, %edx
	movq	%rbx, %rcx
	call	create_symbol
	movq	%rax, 120(%rsp)
	call	create_list
	movq	%rax, %rdi
	movq	32(%rsi), %r9
	movq	%rbp, %r8
	movl	$3, %edx
	movq	40+keywordList(%rip), %rcx
	call	create_symbol
	movq	%rax, %rbp
	movq	24(%r12), %rax
	movq	16(%rax), %rcx
	call	list_copy
	movq	%rax, %rbx
	leaq	keywordList(%rip), %rsi
.L1221:
	movq	%rbx, %rcx
	call	list_pop
	testq	%rax, %rax
	je	.L1277
	movq	8(%rax), %rdx
	movq	40(%rsi), %rcx
	cmpq	%rcx, 8(%rdx)
	je	.L1221
	movq	(%rax), %rcx
	movl	$0, %r8d
	call	create_variable
	movq	%rax, %rdx
	movq	%rdi, %rcx
	call	list_append
	jmp	.L1221
.L1275:
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, %rsi
	movq	80(%rsp), %rcx
	call	create_symbol_table
	movq	%rax, 32(%rsi)
	movq	%rsi, %r9
	movq	96(%rsp), %rbp
	movq	%rbp, %r8
	movl	$2, %edx
	movq	%rbx, %rcx
	call	create_symbol
	movq	%rax, %r12
	call	create_list
	movq	%rax, %rdi
	movq	32(%rsi), %r9
	movq	%rbp, %rbx
	movq	%rbp, %r8
	movl	$3, %edx
	movq	40+keywordList(%rip), %rcx
	call	create_symbol
	movq	%rax, %rbp
	movl	$0, %r8d
	movq	%rax, %rdx
	movq	%rbx, 96(%rsp)
	movq	%rbx, %rcx
	call	create_variable
	movq	%rax, %rdx
	movq	%rdi, %rcx
	call	list_append
	call	create_list
	movq	%rax, %rbx
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rbp, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	create_variable_access
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$8, %ecx
	call	create_primary
	movq	%rax, %r8
	movl	$0, %r9d
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	$0, 40(%rsp)
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$5, %ecx
	call	create_statement
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	list_append
	movq	32(%rsi), %rax
	movq	%rax, 40(%rsp)
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	96(%rsp), %r8
	movq	%r12, %rdx
	movq	%rsi, %rcx
	call	create_method_use_ptr
	movl	$0, %r8d
	movq	%rsi, %rdx
	movl	$0, %ecx
	call	create_class_member
	movq	%rax, %rdx
	movq	112(%rsp), %rcx
	call	list_append
	jmp	.L1218
.L1276:
	movq	56(%rsp), %rax
	movq	16(%rax), %rbx
	movq	%rbx, 56(%rsp)
	movq	%rbx, %rsi
	addq	$1, %rsi
	movq	8(%rax), %rbx
	addq	$1, %rbx
	movq	(%r15), %rax
	movq	24(%rax), %rdi
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rdi, %r8
	leaq	.LC246(%rip), %rdx
	call	fprintf
	jmp	.L1219
.L1277:
	call	create_list
	movq	%rax, %rbx
	movq	%rax, 56(%rsp)
	movq	112(%rsp), %rcx
	call	list_copy
	movq	%rax, %rsi
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rbp, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	create_variable_access
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$8, %ecx
	call	create_primary
	movq	%rax, %r8
	movl	$0, %r9d
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	$0, 40(%rsp)
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_statement
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	list_append
.L1224:
	movq	%rsi, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L1278
	cmpl	$1, 8(%rbx)
	jne	.L1224
	movq	(%rbx), %rax
	movq	8(%rax), %rax
	movq	%rax, 128(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rbp, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	create_variable_access
	movq	%rax, %rdx
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	128(%rsp), %r8
	movl	$2, %ecx
	call	create_variable_access
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$8, %ecx
	call	create_primary
	movq	%rax, %r8
	movl	$0, %r9d
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, 128(%rsp)
	movq	(%rbx), %rax
	movq	16(%rax), %r9
	testq	%r9, %r9
	je	.L1279
.L1225:
	movl	$0, %r8d
	movq	128(%rsp), %rdx
	movl	$13, %ecx
	call	create_expression
	movq	$0, 40(%rsp)
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_statement
	movq	%rax, %rdx
	movq	56(%rsp), %rcx
	call	list_append
	jmp	.L1224
.L1279:
	movl	$1, %r8d
	movl	$2, %edx
	leaq	.LC247(%rip), %rcx
	call	create_string_check
	movq	%rax, %rdx
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	call	create_primary
	movq	%rax, %r8
	movl	$0, %r9d
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %r9
	jmp	.L1225
.L1278:
	call	create_list
	movq	%rax, %rbx
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rbp, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	create_variable_access
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$8, %ecx
	call	create_primary
	movq	%rax, %r8
	movl	$0, %r9d
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	list_append
	movq	%rdi, %rcx
	call	list_copy
	movq	%rax, %rsi
	jmp	.L1227
.L1228:
	movq	8(%rax), %r8
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_variable_access
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$8, %ecx
	call	create_primary
	movq	%rax, %r8
	movl	$0, %r9d
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	list_append
.L1227:
	movq	%rsi, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L1228
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%r12, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	create_variable_access
	movq	%rax, %rdx
	movq	%rbx, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$1, %ecx
	call	create_variable_access
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$8, %ecx
	call	create_primary
	movq	%rax, %r8
	movl	$0, %r9d
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	$0, 40(%rsp)
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$5, %ecx
	call	create_statement
	movq	%rax, %rdx
	movq	56(%rsp), %rbx
	movq	%rbx, %rcx
	call	list_append
	movq	88(%rsp), %rsi
	movq	32(%rsi), %rax
	movq	%rax, 40(%rsp)
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	96(%rsp), %rbx
	movq	%rbx, %r8
	movq	120(%rsp), %rdx
	movq	%rsi, %rcx
	call	create_method_use_ptr
	movl	$0, %r8d
	movq	%rsi, %rdx
	movl	$0, %ecx
	call	create_class_member
	movq	%rax, %rdx
	movq	112(%rsp), %rsi
	movq	%rsi, %rcx
	call	list_append
	movq	104(%rsp), %rax
	movq	%rbx, (%rax)
	movq	%rsi, 8(%rax)
	movq	80(%rsp), %rdi
	movq	%rdi, 16(%rax)
	movq	136(%rsp), %rdi
	movq	%rdi, 24(%rax)
.L1233:
	movq	104(%rsp), %r9
	movl	$0, %r8d
	movl	$0, %edx
	movl	$2, %ecx
	call	create_code_member
	movq	%rax, %rdx
	movq	72(%rsp), %rcx
	call	list_append
	jmp	.L1146
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC253:
	.ascii "NULL\0"
.LC254:
	.ascii "Usage: %s <filename>\12\0"
.LC255:
	.ascii "Error opening file: %s\12\0"
.LC256:
	.ascii ".token\0"
.LC257:
	.ascii "w\0"
	.align 8
.LC258:
	.ascii "Token(Type: EOF,         Line: %zu, Column: %zu)\12\0"
	.align 8
.LC259:
	.ascii "Token(Type: identifier,  Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC260:
	.ascii "Token(Type: integer,     Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC261:
	.ascii "Token(Type: float,       Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC262:
	.ascii "Token(Type: string,      Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC263:
	.ascii "Token(Type: symbol,      Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC264:
	.ascii "Token(Type: keyword,     Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC265:
	.ascii "Token(Type: comment,     Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC266:
	.ascii "\\0\0"
.LC267:
	.ascii "\\n\0"
.LC268:
	.ascii "\\t\0"
.LC269:
	.ascii "\\r\0"
.LC270:
	.ascii "'\12\0"
.LC271:
	.ascii "\12info by lib:\12    %s\12\0"
.LC272:
	.ascii ".ast\0"
.LC273:
	.ascii ".tc\0"
.LC274:
	.ascii "import\12\0"
.LC275:
	.ascii "source: \"%s\"\12\0"
.LC276:
	.ascii "parameters\12\0"
.LC277:
	.ascii "parameters[%d]\12\0"
.LC278:
	.ascii "class\12\0"
.LC279:
	.ascii "members\12\0"
.LC280:
	.ascii "method\12\0"
.LC281:
	.ascii "variable\12\0"
.LC282:
	.ascii "unknown_ClassMemberType: %u\12\0"
.LC283:
	.ascii "unknown_CodeMemberType: %u\12\0"
.LC284:
	.ascii ".tac\0"
.LC285:
	.ascii "main\0"
	.align 8
.LC286:
	.ascii "[Warning] Unsupported symbol kind for import: %d\12\0"
.LC287:
	.ascii "TAC {\12\0"
.LC288:
	.ascii "designs: []\12\0"
.LC289:
	.ascii "designs: [\12\0"
.LC290:
	.ascii "NULL \0"
.LC291:
	.ascii "%s \0"
.LC292:
	.ascii "%zu \0"
.LC293:
	.ascii "{}\12\0"
.LC294:
	.ascii "{\12\0"
.LC295:
	.ascii "NULL\11\0"
.LC296:
	.ascii "%s\11\0"
.LC297:
	.ascii "%s(%s) \0"
.LC298:
	.ascii "%zu\12\0"
.LC299:
	.ascii "}\12\0"
.LC300:
	.ascii "]\12\0"
.LC301:
	.ascii "entry_point: \"NULL\"\12\0"
.LC302:
	.ascii "entry_point: %s\12\0"
.LC303:
	.ascii "global: []\12\0"
.LC304:
	.ascii "global: [\12\0"
.LC305:
	.ascii "subroutines: []\12\0"
.LC306:
	.ascii "subroutines: [\12\0"
.LC307:
	.ascii "NULL {\12\0"
.LC308:
	.ascii "%s {\12\0"
.LC309:
	.ascii "return_type: \"NULL\"\12\0"
.LC310:
	.ascii "return_type: %s\12\0"
.LC311:
	.ascii "parameters: []\12\0"
.LC312:
	.ascii "parameters: [\12\0"
.LC313:
	.ascii "local: []\12\0"
.LC314:
	.ascii "local: [\12\0"
.LC315:
	.ascii "instructions: []\12\0"
.LC316:
	.ascii "instructions: [\12\0"
.LC317:
	.ascii "add\11\0"
.LC318:
	.ascii "sub\11\0"
.LC319:
	.ascii "mul\11\0"
.LC320:
	.ascii "div\11\0"
.LC321:
	.ascii "mod\11\0"
.LC322:
	.ascii "eq \11\0"
.LC323:
	.ascii "ne \11\0"
.LC324:
	.ascii "lt \11\0"
.LC325:
	.ascii "gt \11\0"
.LC326:
	.ascii "le \11\0"
.LC327:
	.ascii "ge \11\0"
.LC328:
	.ascii "and\11\0"
.LC329:
	.ascii "or \11\0"
.LC330:
	.ascii "not\11\0"
.LC331:
	.ascii "assign\11\0"
.LC332:
	.ascii "get_attr\11\0"
.LC333:
	.ascii "get_elem\11\0"
.LC334:
	.ascii "param\11\0"
.LC335:
	.ascii "alloc\11\0"
.LC336:
	.ascii "jmp_c\11\0"
.LC337:
	.ascii "jmp\11\0"
.LC338:
	.ascii "ret\11\0"
.LC339:
	.ascii "call\11\0"
.LC340:
	.ascii "load\11\0"
.LC341:
	.ascii "store\11\0"
.LC342:
	.ascii "INST_NONE\12\0"
.LC343:
	.ascii "unknown_InstructionType: %u\12\0"
	.text
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
	pushq	%rbx
	andq	$-16, %rsp
	subq	$112, %rsp
	movl	%ecx, %ebx
	movq	%rdx, %rsi
	call	__main
	cmpl	$1, %ebx
	jle	.L1583
	call	init
	movq	8(%rsi), %rcx
	call	create_file
	movq	%rax, %rbx
	movq	24(%rax), %r12
	movq	$0, 72(%rsp)
	leaq	.LC209(%rip), %rdx
	movq	%r12, %rcx
	call	fopen
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L1584
	leaq	72(%rsp), %rdx
	movq	%rax, %rcx
	call	read_source
	movq	%rax, %rdi
	movq	%rsi, %rcx
	call	fclose
	movq	%r12, %r8
	movq	72(%rsp), %rdx
	movq	%rdi, %rcx
	call	create_lexer
	movq	%rax, %r13
	movl	$1, %r8d
	movl	$6, %edx
	leaq	.LC256(%rip), %rcx
	call	create_string_check
	movq	%rax, 8(%rbx)
	movq	%rbx, %rcx
	call	rebuild_full_path
	movq	24(%rbx), %rsi
	leaq	.LC257(%rip), %rdx
	movq	%rsi, %rcx
	call	fopen
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L1585
	movl	$0, %edx
	movq	%r13, %rcx
	call	get_next_token
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L1286
	leaq	.LC269(%rip), %r14
	movq	%rbx, 56(%rsp)
	jmp	.L1305
.L1583:
	movq	(%rsi), %rbx
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rbx, %r8
	leaq	.LC254(%rip), %rdx
	call	fprintf
	movl	$1, %eax
	jmp	.L1280
.L1584:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%r12, %r8
	leaq	.LC255(%rip), %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1280
.L1585:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, %r8
	leaq	.LC255(%rip), %rdx
	call	fprintf
	jmp	.L1285
.L1296:
	movq	16(%r15), %rdx
	movq	8(%r15), %rax
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC258(%rip), %rdx
	movq	%rdi, %rcx
	call	fprintf
	jmp	.L1297
.L1295:
	movq	16(%r15), %rdx
	movq	8(%r15), %rax
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC259(%rip), %rdx
	movq	%rdi, %rcx
	call	fprintf
.L1287:
	movl	$0, %ebx
	leaq	.LC266(%rip), %r12
	jmp	.L1298
.L1294:
	movq	16(%r15), %rdx
	movq	8(%r15), %rax
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC260(%rip), %rdx
	movq	%rdi, %rcx
	call	fprintf
	jmp	.L1287
.L1293:
	movq	16(%r15), %rdx
	movq	8(%r15), %rax
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC261(%rip), %rdx
	movq	%rdi, %rcx
	call	fprintf
	jmp	.L1287
.L1292:
	movq	16(%r15), %rdx
	movq	8(%r15), %rax
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC262(%rip), %rdx
	movq	%rdi, %rcx
	call	fprintf
	jmp	.L1287
.L1291:
	movq	16(%r15), %rdx
	movq	8(%r15), %rax
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC263(%rip), %rdx
	movq	%rdi, %rcx
	call	fprintf
	jmp	.L1287
.L1290:
	movq	16(%r15), %rdx
	movq	8(%r15), %rax
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC264(%rip), %rdx
	movq	%rdi, %rcx
	call	fprintf
	jmp	.L1287
.L1288:
	movq	16(%r15), %rdx
	movq	8(%r15), %rax
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC265(%rip), %rdx
	movq	%rdi, %rcx
	call	fprintf
	jmp	.L1287
.L1587:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%r12, %rcx
	call	fwrite
.L1300:
	addq	$1, %rbx
.L1298:
	movq	(%r15), %rsi
	movq	%rsi, %rcx
	call	strlen
	cmpq	%rax, %rbx
	jnb	.L1586
	movzbl	(%rsi,%rbx), %ecx
	testb	%cl, %cl
	je	.L1587
	cmpb	$10, %cl
	je	.L1588
	cmpb	$9, %cl
	je	.L1589
	cmpb	$13, %cl
	je	.L1590
	movsbl	%cl, %ecx
	movq	%rdi, %rdx
	call	fputc
	jmp	.L1300
.L1588:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC267(%rip), %rcx
	call	fwrite
	jmp	.L1300
.L1589:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC268(%rip), %rcx
	call	fwrite
	jmp	.L1300
.L1590:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	movq	%r14, %rcx
	call	fwrite
	jmp	.L1300
.L1586:
	movq	%rdi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC270(%rip), %rcx
	call	fwrite
.L1297:
	cmpl	$0, 24(%r15)
	je	.L1577
	movl	$0, %edx
	movq	%r13, %rcx
	call	get_next_token
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L1591
.L1305:
	cmpl	$7, 24(%r15)
	ja	.L1287
	movl	24(%r15), %eax
	leaq	.L1289(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L1289:
	.long	.L1296-.L1289
	.long	.L1295-.L1289
	.long	.L1294-.L1289
	.long	.L1293-.L1289
	.long	.L1292-.L1289
	.long	.L1291-.L1289
	.long	.L1290-.L1289
	.long	.L1288-.L1289
	.text
.L1591:
	movq	56(%rsp), %rbx
	jmp	.L1286
.L1577:
	movq	56(%rsp), %rbx
.L1286:
	call	get_info
	movq	%rax, %r8
	leaq	.LC271(%rip), %rdx
	movq	%rdi, %rcx
	call	fprintf
	movq	%rdi, %rcx
	call	fclose
.L1285:
	movq	$0, 16(%r13)
	movq	$0, 32(%r13)
	movq	$0, 40(%r13)
	movq	$0, 48(%r13)
	movq	$0, 56(%r13)
	movq	$0, 64(%r13)
	movq	$0, 72(%r13)
	movq	$0, 80(%r13)
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %r8
	movb	$0, 8(%rax)
	movb	$0, 9(%rax)
	movb	$0, 11(%rax)
	movq	%rbx, (%rax)
	movq	builtin_scope(%rip), %rdx
	movq	%r13, %rcx
	call	parse_code
	movq	%rax, %r13
	movl	$1, %r8d
	movl	$4, %edx
	leaq	.LC272(%rip), %rcx
	call	create_string_check
	movq	%rax, 8(%rbx)
	movq	%rbx, %rcx
	call	rebuild_full_path
	movq	24(%rbx), %rdi
	movl	$1, %r8d
	movl	$3, %edx
	leaq	.LC273(%rip), %rcx
	call	create_string_check
	movq	%rax, 8(%rbx)
	movq	%rbx, %rcx
	call	rebuild_full_path
	leaq	.LC257(%rip), %rdx
	movq	%rdi, %rcx
	call	fopen
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L1592
	movq	0(%r13), %rcx
	call	list_copy
	movq	%rax, 56(%rsp)
	movq	%rbx, 48(%rsp)
	movq	%r13, 40(%rsp)
	jmp	.L1308
.L1592:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rdi, %r8
	leaq	.LC255(%rip), %rdx
	call	fprintf
	jmp	.L1307
.L1312:
	leaq	.LC275(%rip), %rdx
	movq	%rsi, %rcx
	call	fprintf
.L1308:
	movq	56(%rsp), %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L1593
	movl	8(%rbx), %eax
	cmpl	$1, %eax
	je	.L1309
	cmpl	$2, %eax
	je	.L1310
	testl	%eax, %eax
	jne	.L1311
	leaq	80(%rsp), %rdi
	movq	%rdi, %r9
	movl	$0, %r8d
	movl	$1, %edx
	movq	%rsi, %rcx
	call	indention
	movq	%rsi, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC274(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rbx
	movq	%rdi, %r9
	movl	$0, %r8d
	movl	$2, %edx
	movq	%rsi, %rcx
	call	indention
	movq	%rsi, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC25(%rip), %rcx
	call	fwrite
	movq	%rdi, %r9
	movl	$3, %r8d
	movq	%rsi, %rdx
	movq	(%rbx), %rcx
	call	output_name
	movq	%rdi, %r9
	movl	$1, %r8d
	movl	$2, %edx
	movq	%rsi, %rcx
	call	indention
	movq	8(%rbx), %r8
	testq	%r8, %r8
	jne	.L1312
	leaq	.LC253(%rip), %r8
	jmp	.L1312
.L1309:
	leaq	80(%rsp), %rdi
	movq	%rdi, %r9
	movl	$0, %r8d
	movl	$1, %edx
	movq	%rsi, %rcx
	call	indention
	movq	%rsi, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC27(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rbx
	movq	%rdi, %r9
	movl	$0, %r8d
	movl	$2, %edx
	movq	%rsi, %rcx
	call	indention
	movq	%rsi, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC25(%rip), %rcx
	call	fwrite
	movq	%rdi, %r9
	movl	$3, %r8d
	movq	%rsi, %rdx
	movq	(%rbx), %rcx
	call	output_name
	movq	%rdi, %r9
	movl	$0, %r8d
	movl	$2, %edx
	movq	%rsi, %rcx
	call	indention
	movq	%rsi, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC13(%rip), %rcx
	call	fwrite
	movq	8(%rbx), %rcx
	movq	%rdi, %r9
	movl	$3, %r8d
	movq	%rsi, %rdx
	call	output_name
	movq	%rdi, %r9
	movl	$0, %r8d
	movl	$2, %edx
	movq	%rsi, %rcx
	call	indention
	movq	%rsi, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC276(%rip), %rcx
	call	fwrite
	movq	16(%rbx), %rcx
	call	list_copy
	movq	%rax, %r15
	movq	24(%rbx), %rcx
	call	list_copy
	movq	%rax, %r14
	movl	$-1, %edi
	leaq	80(%rsp), %r12
	jmp	.L1314
.L1315:
	movq	%r12, %r9
	movl	$0, %r8d
	movl	$3, %edx
	movq	%rsi, %rcx
	call	indention
	addl	$1, %edi
	movl	%edi, %r8d
	leaq	.LC277(%rip), %rdx
	movq	%rsi, %rcx
	call	fprintf
	movq	%r12, %r9
	movl	$4, %r8d
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	output_variable
.L1314:
	movq	%r15, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L1315
	leaq	80(%rsp), %r9
	movl	$1, %r8d
	movl	$2, %edx
	movq	%rsi, %rcx
	call	indention
	movq	%rsi, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC59(%rip), %rcx
	call	fwrite
	leaq	80(%rsp), %rbx
	jmp	.L1316
.L1317:
	movq	%rbx, %r9
	movl	$3, %r8d
	movq	%rsi, %rdx
	call	output_statement
.L1316:
	movq	%r14, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L1317
	jmp	.L1308
.L1310:
	leaq	80(%rsp), %rdi
	movq	%rdi, %r9
	movl	$0, %r8d
	movl	$1, %edx
	movq	%rsi, %rcx
	call	indention
	movq	%rsi, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC278(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rbx
	movq	%rdi, %r9
	movl	$0, %r8d
	movl	$2, %edx
	movq	%rsi, %rcx
	call	indention
	movq	%rsi, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC25(%rip), %rcx
	call	fwrite
	movq	%rdi, %r9
	movl	$3, %r8d
	movq	%rsi, %rdx
	movq	(%rbx), %rcx
	call	output_name
	movq	%rdi, %r9
	movl	$1, %r8d
	movl	$2, %edx
	movq	%rsi, %rcx
	call	indention
	movq	%rsi, %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC279(%rip), %rcx
	call	fwrite
	movq	8(%rbx), %rcx
	call	list_copy
	movq	%rax, %r13
	jmp	.L1318
.L1319:
	leaq	80(%rsp), %rdi
	movq	%rdi, %r9
	movl	$0, %r8d
	movl	$3, %edx
	movq	%rsi, %rcx
	call	indention
	movq	%rsi, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC280(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rbx
	movq	%rdi, %r9
	movl	$0, %r8d
	movl	$4, %edx
	movq	%rsi, %rcx
	call	indention
	movq	%rsi, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC25(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rcx
	movq	%rdi, %r9
	movl	$5, %r8d
	movq	%rsi, %rdx
	call	output_name
	movq	%rdi, %r9
	movl	$0, %r8d
	movl	$4, %edx
	movq	%rsi, %rcx
	call	indention
	movq	%rsi, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC13(%rip), %rcx
	call	fwrite
	movq	8(%rbx), %rcx
	movq	%rdi, %r9
	movl	$5, %r8d
	movq	%rsi, %rdx
	call	output_name
	movq	%rdi, %r9
	movl	$0, %r8d
	movl	$4, %edx
	movq	%rsi, %rcx
	call	indention
	movq	%rsi, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC276(%rip), %rcx
	call	fwrite
	movq	16(%rbx), %rcx
	call	list_copy
	movq	%rax, %r15
	movq	24(%rbx), %rcx
	call	list_copy
	movq	%rax, %r12
	movl	$-1, %edi
	leaq	80(%rsp), %r14
.L1322:
	movq	%r15, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L1594
	movq	%r14, %r9
	movl	$0, %r8d
	movl	$5, %edx
	movq	%rsi, %rcx
	call	indention
	addl	$1, %edi
	movl	%edi, %r8d
	leaq	.LC277(%rip), %rdx
	movq	%rsi, %rcx
	call	fprintf
	movq	%r14, %r9
	movl	$6, %r8d
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	output_variable
	jmp	.L1322
.L1594:
	leaq	80(%rsp), %r9
	movl	$1, %r8d
	movl	$4, %edx
	movq	%rsi, %rcx
	call	indention
	movq	%rsi, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC59(%rip), %rcx
	call	fwrite
	leaq	80(%rsp), %rbx
.L1324:
	movq	%r12, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L1318
	movq	%rbx, %r9
	movl	$5, %r8d
	movq	%rsi, %rdx
	call	output_statement
	jmp	.L1324
.L1320:
	leaq	80(%rsp), %rdi
	movq	%rdi, %r9
	movl	$0, %r8d
	movl	$3, %edx
	movq	%rsi, %rcx
	call	indention
	movq	%rsi, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC281(%rip), %rcx
	call	fwrite
	movq	(%rbx), %rcx
	movq	%rdi, %r9
	movl	$4, %r8d
	movq	%rsi, %rdx
	call	output_variable
.L1318:
	movq	%r13, %rcx
	call	list_pop
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L1308
	movl	8(%rbx), %eax
	testl	%eax, %eax
	je	.L1319
	cmpl	$1, %eax
	je	.L1320
	leaq	80(%rsp), %r9
	movl	$0, %r8d
	movl	$3, %edx
	movq	%rsi, %rcx
	call	indention
	movl	8(%rbx), %r8d
	leaq	.LC282(%rip), %rdx
	movq	%rsi, %rcx
	call	fprintf
	jmp	.L1318
.L1311:
	leaq	80(%rsp), %r9
	movl	$0, %r8d
	movl	$1, %edx
	movq	%rsi, %rcx
	call	indention
	movl	8(%rbx), %r8d
	leaq	.LC283(%rip), %rdx
	movq	%rsi, %rcx
	call	fprintf
	jmp	.L1308
.L1593:
	movq	48(%rsp), %rbx
	movq	40(%rsp), %r13
	call	get_info
	movq	%rax, %r8
	leaq	.LC271(%rip), %rdx
	movq	%rsi, %rcx
	call	fprintf
	movq	%rsi, %rcx
	call	fclose
.L1307:
	movl	$1, %r8d
	movl	$4, %edx
	leaq	.LC284(%rip), %rcx
	call	create_string_check
	movq	%rax, 8(%rbx)
	movq	%rbx, %rcx
	call	rebuild_full_path
	movq	24(%rbx), %rsi
	movl	$1, %r8d
	movl	$3, %edx
	leaq	.LC273(%rip), %rcx
	call	create_string_check
	movq	%rax, 8(%rbx)
	movq	%rbx, %rcx
	call	rebuild_full_path
	leaq	.LC257(%rip), %rdx
	movq	%rsi, %rcx
	call	fopen
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L1595
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, %r12
	call	create_list
	movq	%rax, (%r12)
	movq	$0, 8(%r12)
	call	create_list
	movq	%rax, 16(%r12)
	call	create_list
	movq	%rax, 24(%r12)
	movl	$96, %ecx
	call	alloc_memory
	movq	%rax, %rsi
	movq	%r12, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	call	create_list
	movq	%rax, 32(%rsi)
	call	create_list
	movq	%rax, 40(%rsi)
	movq	$0, 48(%rsi)
	movq	$0, 56(%rsi)
	movq	$0, 64(%rsi)
	movq	$0, 72(%rsi)
	movq	$0, 80(%rsi)
	movq	$0, 88(%rsi)
	movq	0(%r13), %rcx
	call	list_copy
	movq	%rax, 56(%rsp)
	jmp	.L1331
.L1595:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, %r8
	leaq	.LC255(%rip), %rdx
	call	fprintf
	jmp	.L1330
.L1597:
	movq	(%rdi), %r15
	movq	8(%r15), %rdx
	movq	(%r15), %rcx
	call	create_subroutine
	movq	%rax, %r13
	movq	%rax, 8(%rsi)
	movq	(%rsi), %rax
	movq	24(%rax), %rcx
	movq	%r13, %rdx
	call	list_append
	movq	16(%r15), %rcx
	call	list_copy
	movq	%rax, %r14
	jmp	.L1333
.L1334:
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	movq	%rsi, %r9
	movl	$112, %r8d
	call	create_var
	movq	%rax, %rdx
	movq	16(%r13), %rcx
	call	list_append
.L1333:
	movq	%r14, %rcx
	call	list_pop
	testq	%rax, %rax
	jne	.L1334
	movq	%rsi, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rcx
	call	create_block
	movq	%rax, %r14
	movq	32(%r13), %rcx
	movq	%rax, %rdx
	call	list_append
	movq	%r14, 16(%rsi)
	movq	24(%r15), %rcx
	call	list_copy
	movq	%rax, %r13
	jmp	.L1335
.L1336:
	movq	%rsi, %rdx
	call	tac_statement
.L1335:
	movq	%r13, %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L1336
	movq	$0, 8(%rsi)
	movq	(%rdi), %rax
	movq	(%rax), %rdi
	movq	8(%rdi), %rcx
	leaq	.LC285(%rip), %rdx
	call	strcmp
	testl	%eax, %eax
	jne	.L1331
	movq	%rdi, 8(%r12)
	jmp	.L1331
.L1598:
	movq	%rsi, %rdx
	movq	(%rdi), %rcx
	call	tac_class
.L1331:
	movq	56(%rsp), %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L1596
	movl	8(%rdi), %eax
	cmpl	$1, %eax
	je	.L1597
	cmpl	$2, %eax
	je	.L1598
	testl	%eax, %eax
	jne	.L1331
	movq	(%rdi), %rax
	movq	(%rax), %rcx
	movl	32(%rcx), %edi
	cmpl	$3, %edi
	je	.L1599
	leal	-1(%rdi), %eax
	cmpl	$1, %eax
	jbe	.L1600
	testl	%edi, %edi
	jne	.L1341
	movq	24(%rcx), %rcx
	movq	%rsi, %rdx
	call	tac_class
	jmp	.L1331
.L1599:
	movq	%rsi, %r9
	movl	$118, %r8d
	movq	(%rcx), %rdx
	call	create_var
	movq	%rax, %rdx
	movq	16(%r12), %rcx
	call	list_append
	jmp	.L1331
.L1600:
	movq	%rsi, %r9
	movl	$102, %r8d
	movq	(%rcx), %rdx
	call	create_var
	movq	%rax, %rdx
	movq	16(%r12), %rcx
	call	list_append
	jmp	.L1331
.L1341:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movl	%edi, %r8d
	leaq	.LC286(%rip), %rdx
	call	fprintf
	jmp	.L1331
.L1596:
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC287(%rip), %rcx
	call	fwrite
	movq	(%r12), %rax
	testq	%rax, %rax
	je	.L1452
	cmpq	$0, (%rax)
	je	.L1453
	movl	$4, %esi
	cmpq	$0, 8(%rax)
	je	.L1345
.L1344:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1344
	movq	%rbx, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC289(%rip), %rcx
	call	fwrite
	leaq	.LC291(%rip), %r15
	leaq	.LC296(%rip), %r14
	jmp	.L1347
.L1452:
	movl	$4, %esi
.L1345:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1345
	movq	%rbx, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC288(%rip), %rcx
	call	fwrite
.L1346:
	movl	$4, %esi
	cmpq	$0, 8(%r12)
	je	.L1366
.L1365:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1365
	movq	8(%r12), %rax
	movq	8(%rax), %r8
	leaq	.LC302(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
.L1367:
	movq	16(%r12), %rax
	testq	%rax, %rax
	je	.L1458
	cmpq	$0, (%rax)
	je	.L1459
	movl	$4, %esi
	cmpq	$0, 8(%rax)
	je	.L1370
.L1369:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1369
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC304(%rip), %rcx
	call	fwrite
	jmp	.L1372
.L1453:
	movl	$4, %esi
	jmp	.L1345
.L1349:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1349
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC290(%rip), %rcx
	call	fwrite
	jmp	.L1350
.L1351:
	movq	%rbx, %r9
	movl	$3, %r8d
	movl	$1, %edx
	leaq	.LC293(%rip), %rcx
	call	fwrite
.L1347:
	movq	(%r12), %rcx
	call	list_pop
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L1601
	movl	$8, %esi
	cmpq	$0, 8(%r13)
	je	.L1349
.L1348:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1348
	movq	8(%r13), %rax
	movq	8(%rax), %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	fprintf
.L1350:
	movq	16(%r13), %r8
	leaq	.LC292(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	movq	0(%r13), %rax
	testq	%rax, %rax
	je	.L1351
	cmpq	$0, (%rax)
	je	.L1351
	cmpq	$0, 8(%rax)
	je	.L1351
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC294(%rip), %rcx
	call	fwrite
	jmp	.L1354
.L1356:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1356
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC295(%rip), %rcx
	call	fwrite
	jmp	.L1357
.L1603:
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC290(%rip), %rcx
	call	fwrite
	jmp	.L1359
.L1604:
	movq	8(%rdx), %r9
	movq	8(%rax), %r8
	leaq	.LC297(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
.L1359:
	movq	16(%rdi), %r8
	leaq	.LC298(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
.L1354:
	movq	0(%r13), %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L1602
	movl	$12, %esi
	cmpq	$0, 8(%rdi)
	je	.L1356
.L1355:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1355
	movq	8(%rdi), %rax
	movq	8(%rax), %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	fprintf
.L1357:
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L1603
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	jne	.L1604
	movq	8(%rax), %r8
	movq	%r15, %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L1359
.L1602:
	movl	$8, %esi
.L1362:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1362
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC299(%rip), %rcx
	call	fwrite
	jmp	.L1347
.L1601:
	movl	$4, %esi
.L1364:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1364
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC300(%rip), %rcx
	call	fwrite
	jmp	.L1346
.L1366:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1366
	movq	%rbx, %r9
	movl	$20, %r8d
	movl	$1, %edx
	leaq	.LC301(%rip), %rcx
	call	fwrite
	jmp	.L1367
.L1458:
	movl	$4, %esi
.L1370:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1370
	movq	%rbx, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC303(%rip), %rcx
	call	fwrite
.L1371:
	movq	24(%r12), %rax
	testq	%rax, %rax
	je	.L1461
	cmpq	$0, (%rax)
	je	.L1462
	movl	$4, %esi
	cmpq	$0, 8(%rax)
	je	.L1377
.L1376:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1376
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC306(%rip), %rcx
	call	fwrite
	leaq	.L1413(%rip), %r14
	jmp	.L1378
.L1459:
	movl	$4, %esi
	jmp	.L1370
.L1373:
	movl	$2, %r8d
	movq	%rbx, %rdx
	call	output_var
.L1372:
	movq	16(%r12), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L1373
	movl	$4, %esi
.L1374:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1374
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC300(%rip), %rcx
	call	fwrite
	jmp	.L1371
.L1461:
	movl	$4, %esi
.L1377:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1377
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC305(%rip), %rcx
	call	fwrite
.L1451:
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC299(%rip), %rcx
	call	fwrite
	call	get_info
	movq	%rax, %r8
	leaq	.LC271(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	movq	%rbx, %rcx
	call	fclose
.L1330:
	movl	$0, %eax
.L1280:
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
.L1462:
	movl	$4, %esi
	jmp	.L1377
.L1380:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1380
	movq	%rbx, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC307(%rip), %rcx
	call	fwrite
	jmp	.L1381
.L1383:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1383
	movq	%rbx, %r9
	movl	$20, %r8d
	movl	$1, %edx
	leaq	.LC309(%rip), %rcx
	call	fwrite
	jmp	.L1384
.L1466:
	movl	$12, %esi
.L1387:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1387
	movq	%rbx, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC311(%rip), %rcx
	call	fwrite
.L1388:
	movq	24(%r13), %rax
	testq	%rax, %rax
	je	.L1469
	cmpq	$0, (%rax)
	je	.L1470
	movl	$12, %esi
	cmpq	$0, 8(%rax)
	je	.L1394
.L1393:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1393
	movq	%rbx, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC314(%rip), %rcx
	call	fwrite
.L1396:
	movq	24(%r13), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L1605
	movl	$4, %r8d
	movq	%rbx, %rdx
	call	output_var
	jmp	.L1396
.L1467:
	movl	$12, %esi
	jmp	.L1387
.L1390:
	movl	$4, %r8d
	movq	%rbx, %rdx
	call	output_var
.L1389:
	movq	16(%r13), %rcx
	call	list_pop
	movq	%rax, %rcx
	testq	%rax, %rax
	jne	.L1390
	movl	$12, %esi
.L1391:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1391
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC300(%rip), %rcx
	call	fwrite
	jmp	.L1388
.L1469:
	movl	$12, %esi
.L1394:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1394
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC313(%rip), %rcx
	call	fwrite
.L1395:
	movq	32(%r13), %rax
	testq	%rax, %rax
	je	.L1472
	cmpq	$0, (%rax)
	je	.L1473
	movl	$12, %esi
	cmpq	$0, 8(%rax)
	je	.L1401
.L1400:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1400
	movq	%rbx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC316(%rip), %rcx
	call	fwrite
	jmp	.L1403
.L1470:
	movl	$12, %esi
	jmp	.L1394
.L1605:
	movl	$12, %esi
.L1398:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1398
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC300(%rip), %rcx
	call	fwrite
	jmp	.L1395
.L1472:
	movl	$12, %esi
.L1401:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1401
	movq	%rbx, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC315(%rip), %rcx
	call	fwrite
.L1402:
	movl	$8, %esi
.L1448:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1448
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC299(%rip), %rcx
	call	fwrite
.L1378:
	movq	24(%r12), %rcx
	call	list_pop
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L1606
	movl	$8, %esi
	cmpq	$0, 0(%r13)
	je	.L1380
.L1379:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1379
	movq	0(%r13), %rax
	movq	8(%rax), %r8
	leaq	.LC308(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
.L1381:
	movl	$12, %esi
	cmpq	$0, 8(%r13)
	je	.L1383
.L1382:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1382
	movq	8(%r13), %rax
	movq	8(%rax), %r8
	leaq	.LC310(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
.L1384:
	movq	16(%r13), %rax
	testq	%rax, %rax
	je	.L1466
	cmpq	$0, (%rax)
	je	.L1467
	movl	$12, %esi
	cmpq	$0, 8(%rax)
	je	.L1387
.L1386:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1386
	movq	%rbx, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC312(%rip), %rcx
	call	fwrite
	jmp	.L1389
.L1473:
	movl	$12, %esi
	jmp	.L1401
.L1405:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1405
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC290(%rip), %rcx
	call	fwrite
	jmp	.L1406
.L1407:
	movq	%rbx, %r9
	movl	$3, %r8d
	movl	$1, %edx
	leaq	.LC293(%rip), %rcx
	call	fwrite
.L1403:
	movq	32(%r13), %rcx
	call	list_pop
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L1607
	movl	$16, %esi
	cmpq	$0, (%rdi)
	je	.L1405
.L1404:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1404
	movq	(%rdi), %rax
	movq	8(%rax), %r8
	leaq	.LC291(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
.L1406:
	movq	8(%rdi), %rax
	testq	%rax, %rax
	je	.L1407
	cmpq	$0, (%rax)
	je	.L1407
	cmpq	$0, 8(%rax)
	je	.L1407
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC294(%rip), %rcx
	call	fwrite
	movl	$1, %r15d
	jmp	.L1410
.L1477:
	movq	$20, 56(%rsp)
.L1438:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1438
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC317(%rip), %rcx
	call	fwrite
.L1439:
	movq	(%rsi), %rcx
	movq	%rbx, %rdx
	call	output_arg
	movl	24(%rsi), %ecx
	cmpl	$24, %ecx
	ja	.L1410
	movq	%r15, %rax
	salq	%cl, %rax
	testl	$4825087, %eax
	jne	.L1441
	testl	$25583616, %eax
	jne	.L1442
	testl	$3145728, %eax
	jne	.L1443
	jmp	.L1410
.L1478:
	movq	$20, 56(%rsp)
.L1437:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1437
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC318(%rip), %rcx
	call	fwrite
	jmp	.L1439
.L1479:
	movq	$20, 56(%rsp)
.L1436:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1436
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC319(%rip), %rcx
	call	fwrite
	jmp	.L1439
.L1480:
	movq	$20, 56(%rsp)
.L1435:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1435
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC320(%rip), %rcx
	call	fwrite
	jmp	.L1439
.L1481:
	movq	$20, 56(%rsp)
.L1434:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1434
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC321(%rip), %rcx
	call	fwrite
	jmp	.L1439
.L1482:
	movq	$20, 56(%rsp)
.L1433:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1433
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC322(%rip), %rcx
	call	fwrite
	jmp	.L1439
.L1483:
	movq	$20, 56(%rsp)
.L1432:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1432
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC323(%rip), %rcx
	call	fwrite
	jmp	.L1439
.L1484:
	movq	$20, 56(%rsp)
.L1431:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1431
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC324(%rip), %rcx
	call	fwrite
	jmp	.L1439
.L1485:
	movq	$20, 56(%rsp)
.L1430:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1430
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC325(%rip), %rcx
	call	fwrite
	jmp	.L1439
.L1486:
	movq	$20, 56(%rsp)
.L1429:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1429
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC326(%rip), %rcx
	call	fwrite
	jmp	.L1439
.L1487:
	movq	$20, 56(%rsp)
.L1428:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1428
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC327(%rip), %rcx
	call	fwrite
	jmp	.L1439
.L1488:
	movq	$20, 56(%rsp)
.L1427:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1427
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC328(%rip), %rcx
	call	fwrite
	jmp	.L1439
.L1489:
	movq	$20, 56(%rsp)
.L1426:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1426
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC329(%rip), %rcx
	call	fwrite
	jmp	.L1439
.L1490:
	movq	$20, 56(%rsp)
.L1425:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1425
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC330(%rip), %rcx
	call	fwrite
	jmp	.L1439
.L1491:
	movq	$20, 56(%rsp)
.L1424:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1424
	movq	%rbx, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC331(%rip), %rcx
	call	fwrite
	jmp	.L1439
.L1492:
	movq	$20, 56(%rsp)
.L1423:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1423
	movq	%rbx, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC332(%rip), %rcx
	call	fwrite
	jmp	.L1439
.L1493:
	movq	$20, 56(%rsp)
.L1422:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1422
	movq	%rbx, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC333(%rip), %rcx
	call	fwrite
	jmp	.L1439
.L1494:
	movq	$20, 56(%rsp)
.L1421:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1421
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC334(%rip), %rcx
	call	fwrite
	jmp	.L1439
.L1495:
	movq	$20, 56(%rsp)
.L1420:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1420
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC335(%rip), %rcx
	call	fwrite
	jmp	.L1439
.L1496:
	movq	$20, 56(%rsp)
.L1419:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1419
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC336(%rip), %rcx
	call	fwrite
	jmp	.L1439
.L1497:
	movq	$20, 56(%rsp)
.L1418:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1418
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC337(%rip), %rcx
	call	fwrite
	jmp	.L1439
.L1498:
	movq	$20, 56(%rsp)
.L1417:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1417
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC338(%rip), %rcx
	call	fwrite
	jmp	.L1439
.L1499:
	movq	$20, 56(%rsp)
.L1416:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1416
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC339(%rip), %rcx
	call	fwrite
	jmp	.L1439
.L1500:
	movq	$20, 56(%rsp)
.L1415:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1415
	movq	%rbx, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC340(%rip), %rcx
	call	fwrite
	jmp	.L1439
.L1501:
	movq	$20, 56(%rsp)
.L1414:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1414
	movq	%rbx, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC341(%rip), %rcx
	call	fwrite
	jmp	.L1439
.L1502:
	movl	$20, %esi
.L1412:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1412
	movq	%rbx, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC342(%rip), %rcx
	call	fwrite
	jmp	.L1410
.L1476:
	movq	$20, 56(%rsp)
.L1411:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, 56(%rsp)
	jne	.L1411
	movl	24(%rsi), %r8d
	leaq	.LC343(%rip), %rdx
	movq	%rbx, %rcx
	call	fprintf
	jmp	.L1410
.L1441:
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
.L1443:
	movq	%rbx, %rdx
	movl	$10, %ecx
	call	fputc
.L1410:
	movq	8(%rdi), %rcx
	call	list_pop
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L1608
	cmpl	$25, 24(%rsi)
	ja	.L1476
	movl	24(%rsi), %eax
	movslq	(%r14,%rax,4), %rax
	addq	%r14, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L1413:
	.long	.L1477-.L1413
	.long	.L1478-.L1413
	.long	.L1479-.L1413
	.long	.L1480-.L1413
	.long	.L1481-.L1413
	.long	.L1482-.L1413
	.long	.L1483-.L1413
	.long	.L1484-.L1413
	.long	.L1485-.L1413
	.long	.L1486-.L1413
	.long	.L1487-.L1413
	.long	.L1488-.L1413
	.long	.L1489-.L1413
	.long	.L1490-.L1413
	.long	.L1491-.L1413
	.long	.L1492-.L1413
	.long	.L1493-.L1413
	.long	.L1494-.L1413
	.long	.L1495-.L1413
	.long	.L1496-.L1413
	.long	.L1497-.L1413
	.long	.L1498-.L1413
	.long	.L1499-.L1413
	.long	.L1500-.L1413
	.long	.L1501-.L1413
	.long	.L1502-.L1413
	.text
.L1442:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	fputc
	movq	8(%rsi), %rcx
	movq	%rbx, %rdx
	call	output_arg
	jmp	.L1443
.L1608:
	movl	$16, %esi
.L1445:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1445
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC299(%rip), %rcx
	call	fwrite
	jmp	.L1403
.L1607:
	movl	$12, %esi
.L1447:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1447
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC300(%rip), %rcx
	call	fwrite
	jmp	.L1402
.L1606:
	movl	$4, %esi
.L1450:
	movq	%rbx, %rdx
	movl	$32, %ecx
	call	putc
	subq	$1, %rsi
	jne	.L1450
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC300(%rip), %rcx
	call	fwrite
	jmp	.L1451
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
	.section .rdata,"dr"
.LC344:
	.ascii "(\0"
.LC345:
	.ascii ")\0"
.LC346:
	.ascii "{\0"
.LC347:
	.ascii "}\0"
.LC348:
	.ascii ",\0"
.LC349:
	.ascii "!\0"
.LC350:
	.ascii "[\0"
.LC351:
	.ascii "]\0"
.LC352:
	.ascii ";\0"
.LC353:
	.ascii "_\0"
.LC354:
	.ascii "+\0"
.LC355:
	.ascii "-\0"
.LC356:
	.ascii "*\0"
.LC357:
	.ascii "%\0"
.LC358:
	.ascii "<\0"
.LC359:
	.ascii ">\0"
.LC360:
	.ascii "=\0"
.LC361:
	.ascii "==\0"
.LC362:
	.ascii "!=\0"
.LC363:
	.ascii "<=\0"
.LC364:
	.ascii ">=\0"
.LC365:
	.ascii "+=\0"
.LC366:
	.ascii "-=\0"
.LC367:
	.ascii "*=\0"
.LC368:
	.ascii "/=\0"
.LC369:
	.ascii "%=\0"
.LC370:
	.ascii "&&\0"
.LC371:
	.ascii "||\0"
	.align 32
symbolStrings:
	.quad	.LC344
	.quad	.LC345
	.quad	.LC346
	.quad	.LC347
	.quad	.LC348
	.quad	.LC349
	.quad	.LC108
	.quad	.LC350
	.quad	.LC351
	.quad	.LC352
	.quad	.LC353
	.quad	.LC354
	.quad	.LC355
	.quad	.LC356
	.quad	.LC106
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
	.quad	.LC369
	.quad	.LC370
	.quad	.LC371
.LC372:
	.ascii "import\0"
.LC373:
	.ascii "from\0"
.LC374:
	.ascii "func\0"
.LC375:
	.ascii "class\0"
.LC376:
	.ascii "method\0"
.LC377:
	.ascii "self\0"
.LC378:
	.ascii "if\0"
.LC379:
	.ascii "elif\0"
.LC380:
	.ascii "else\0"
.LC381:
	.ascii "while\0"
.LC382:
	.ascii "for\0"
.LC383:
	.ascii "return\0"
.LC384:
	.ascii "break\0"
.LC385:
	.ascii "continue\0"
.LC386:
	.ascii "int\0"
.LC387:
	.ascii "float\0"
.LC388:
	.ascii "string\0"
.LC389:
	.ascii "bool\0"
.LC390:
	.ascii "var\0"
	.align 32
keywordStrings:
	.quad	.LC372
	.quad	.LC373
	.quad	.LC374
	.quad	.LC375
	.quad	.LC376
	.quad	.LC377
	.quad	.LC378
	.quad	.LC379
	.quad	.LC380
	.quad	.LC381
	.quad	.LC382
	.quad	.LC77
	.quad	.LC78
	.quad	.LC383
	.quad	.LC384
	.quad	.LC385
	.quad	.LC386
	.quad	.LC387
	.quad	.LC388
	.quad	.LC389
	.quad	.LC143
	.quad	.LC390
.lcomm initialized,1,1
	.align 8
.LC112:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Rev6, Built by MSYS2 project) 13.2.0"
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	strncmp;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	getcwd;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef
	.def	strcat;	.scl	2;	.type	32;	.endef
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	ftell;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	strtoll;	.scl	2;	.type	32;	.endef
	.def	strtod;	.scl	2;	.type	32;	.endef
	.def	putc;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
