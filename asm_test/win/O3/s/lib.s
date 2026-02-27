	.file	"D:\\TC\\src\\lib.c"
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Fatal: Cannot allocate memory\12\0"
	.text
	.p2align 4
	.def	increase_memory_size;	.scl	3;	.type	32;	.endef
	.seh_proc	increase_memory_size
increase_memory_size:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movl	%ecx, %esi
	movl	$32, %ecx
	call	malloc
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L12
	movl	$1024, %ecx
	call	malloc
	movdqa	.LC1(%rip), %xmm0
	movq	$0, 16(%rbx)
	movq	%rax, 24(%rbx)
	movups	%xmm0, (%rbx)
	testb	%sil, %sil
	jne	.L13
	movq	string_memory(%rip), %rax
	addq	$1024, string_memory_count(%rip)
	movq	%rbx, string_memory(%rip)
	movq	8(%rax), %rdx
	addq	%rdx, string_memory_used(%rip)
	movq	%rax, 16(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
	.p2align 3
.L13:
	movq	struct_memory(%rip), %rax
	addq	$1024, struct_memory_count(%rip)
	movq	%rbx, struct_memory(%rip)
	movq	8(%rax), %rdx
	addq	%rdx, struct_memory_used(%rip)
	movq	%rax, 16(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L12:
	call	__getreent
	movl	$30, %r8d
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	movq	string_memory(%rip), %rbx
	testq	%rbx, %rbx
	je	.L3
.L4:
	movq	%rbx, %rsi
	movq	16(%rbx), %rbx
	movq	24(%rsi), %rcx
	call	free
	movq	%rsi, %rcx
	call	free
	testq	%rbx, %rbx
	jne	.L4
.L3:
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
	nop
	.seh_endproc
	.p2align 4
	.globl	init
	.def	init;	.scl	2;	.type	32;	.endef
	.seh_proc	init
init:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	cmpb	$0, initialized(%rip)
	jne	.L14
	cmpq	$0, struct_memory(%rip)
	je	.L31
	cmpq	$0, string_memory(%rip)
	je	.L32
.L18:
	leaq	keywordStrings(%rip), %rbx
	movl	$1, %edi
	movl	$6, %edx
	movb	$1, initialized(%rip)
	leaq	keywordList(%rip), %rsi
	leaq	176(%rbx), %rbp
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L20:
	testq	%rdx, %rdx
	je	.L21
.L33:
	call	create_string_check.part.0
	addq	$8, %rbx
	addq	$8, %rsi
	movzbl	initialized(%rip), %edi
	movq	%rax, -8(%rsi)
	cmpq	%rbx, %rbp
	je	.L23
.L22:
	movq	(%rbx), %rcx
	call	strlen
	movq	%rax, %rdx
.L25:
	movq	(%rbx), %rcx
	testb	%dil, %dil
	jne	.L20
	movq	%rcx, 40(%rsp)
	movq	%rdx, 32(%rsp)
	call	init
	movq	32(%rsp), %rdx
	movq	40(%rsp), %rcx
	testq	%rdx, %rdx
	jne	.L33
	.p2align 4,,10
	.p2align 3
.L21:
	addq	$8, %rbx
	movq	$0, (%rsi)
	movzbl	initialized(%rip), %edi
	addq	$8, %rsi
	cmpq	%rbp, %rbx
	jne	.L22
	.p2align 4,,10
	.p2align 3
.L23:
	leaq	symbolStrings(%rip), %rbx
	leaq	symbolList(%rip), %rsi
	movl	$1, %edx
	leaq	240(%rbx), %rdi
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L26:
	testq	%rdx, %rdx
	je	.L27
.L34:
	call	create_string_check.part.0
	addq	$8, %rbx
	addq	$8, %rsi
	movq	%rax, -8(%rsi)
	cmpq	%rbx, %rdi
	je	.L29
.L28:
	movq	(%rbx), %rcx
	call	strlen
	movq	%rax, %rdx
.L24:
	cmpb	$0, initialized(%rip)
	movq	(%rbx), %rcx
	jne	.L26
	movq	%rdx, 40(%rsp)
	movq	%rcx, 32(%rsp)
	call	init
	movq	40(%rsp), %rdx
	movq	32(%rsp), %rcx
	testq	%rdx, %rdx
	jne	.L34
	.p2align 4,,10
	.p2align 3
.L27:
	addq	$8, %rbx
	movq	$0, (%rsi)
	addq	$8, %rsi
	cmpq	%rbx, %rdi
	jne	.L28
	.p2align 4,,10
	.p2align 3
.L29:
	movq	keywordList(%rip), %rax
	movq	%rax, IMPORT_KEYWORD(%rip)
	movq	8+keywordList(%rip), %rax
	movq	%rax, FROM_KEYWORD(%rip)
	movq	16+keywordList(%rip), %rax
	movq	%rax, FUNC_KEYWORD(%rip)
	movq	24+keywordList(%rip), %rax
	movq	%rax, CLASS_KEYWORD(%rip)
	movq	32+keywordList(%rip), %rax
	movq	%rax, METHOD_KEYWORD(%rip)
	movq	40+keywordList(%rip), %rax
	movq	%rax, SELF_KEYWORD(%rip)
	movq	48+keywordList(%rip), %rax
	movq	%rax, IF_KEYWORD(%rip)
	movq	56+keywordList(%rip), %rax
	movq	%rax, ELIF_KEYWORD(%rip)
	movq	64+keywordList(%rip), %rax
	movq	%rax, ELSE_KEYWORD(%rip)
	movq	72+keywordList(%rip), %rax
	movq	%rax, WHILE_KEYWORD(%rip)
	movq	80+keywordList(%rip), %rax
	movq	%rax, FOR_KEYWORD(%rip)
	movq	88+keywordList(%rip), %rax
	movq	%rax, TRUE_KEYWORD(%rip)
	movq	96+keywordList(%rip), %rax
	movq	%rax, FALSE_KEYWORD(%rip)
	movq	104+keywordList(%rip), %rax
	movq	%rax, RETURN_KEYWORD(%rip)
	movq	112+keywordList(%rip), %rax
	movq	%rax, BREAK_KEYWORD(%rip)
	movq	120+keywordList(%rip), %rax
	movq	%rax, CONTINUE_KEYWORD(%rip)
	movq	128+keywordList(%rip), %rax
	movq	%rax, INT_KEYWORD(%rip)
	movq	136+keywordList(%rip), %rax
	movq	%rax, FLOAT_KEYWORD(%rip)
	movq	144+keywordList(%rip), %rax
	movq	%rax, STRING_KEYWORD(%rip)
	movq	152+keywordList(%rip), %rax
	movq	%rax, BOOL_KEYWORD(%rip)
	movq	160+keywordList(%rip), %rax
	movq	%rax, VOID_KEYWORD(%rip)
	movq	168+keywordList(%rip), %rax
	movq	%rax, VAR_KEYWORD(%rip)
	movq	symbolList(%rip), %rax
	movq	%rax, L_PAREN_SYMBOL(%rip)
	movq	8+symbolList(%rip), %rax
	movq	%rax, R_PAREN_SYMBOL(%rip)
	movq	16+symbolList(%rip), %rax
	movq	%rax, L_BRACE_SYMBOL(%rip)
	movq	24+symbolList(%rip), %rax
	movq	%rax, R_BRACE_SYMBOL(%rip)
	movq	32+symbolList(%rip), %rax
	movq	%rax, COMMA_SYMBOL(%rip)
	movq	40+symbolList(%rip), %rax
	movq	%rax, NOT_SYMBOL(%rip)
	movq	48+symbolList(%rip), %rax
	movq	%rax, DOT_SYMBOL(%rip)
	movq	56+symbolList(%rip), %rax
	movq	%rax, L_BRACKET_SYMBOL(%rip)
	movq	64+symbolList(%rip), %rax
	movq	%rax, R_BRACKET_SYMBOL(%rip)
	movq	72+symbolList(%rip), %rax
	movq	%rax, SEMICOLON_SYMBOL(%rip)
	movq	80+symbolList(%rip), %rax
	movq	%rax, UNDERLINE_SYMBOL(%rip)
	movq	88+symbolList(%rip), %rax
	movq	%rax, ADD_SYMBOL(%rip)
	movq	96+symbolList(%rip), %rax
	movq	%rax, SUB_SYMBOL(%rip)
	movq	104+symbolList(%rip), %rax
	movq	%rax, MUL_SYMBOL(%rip)
	movq	112+symbolList(%rip), %rax
	movq	%rax, DIV_SYMBOL(%rip)
	movq	120+symbolList(%rip), %rax
	movq	%rax, MOD_SYMBOL(%rip)
	movq	128+symbolList(%rip), %rax
	movq	%rax, LT_SYMBOL(%rip)
	movq	136+symbolList(%rip), %rax
	movq	%rax, GT_SYMBOL(%rip)
	movq	144+symbolList(%rip), %rax
	movq	%rax, ASSIGN_SYMBOL(%rip)
	movq	152+symbolList(%rip), %rax
	movq	%rax, EQ_SYMBOL(%rip)
	movq	160+symbolList(%rip), %rax
	movq	%rax, NE_SYMBOL(%rip)
	movq	168+symbolList(%rip), %rax
	movq	%rax, LE_SYMBOL(%rip)
	movq	176+symbolList(%rip), %rax
	movq	%rax, GE_SYMBOL(%rip)
	movq	184+symbolList(%rip), %rax
	movq	%rax, ADD_ASSIGN_SYMBOL(%rip)
	movq	192+symbolList(%rip), %rax
	movq	%rax, SUB_ASSIGN_SYMBOL(%rip)
	movq	200+symbolList(%rip), %rax
	movq	%rax, MUL_ASSIGN_SYMBOL(%rip)
	movq	208+symbolList(%rip), %rax
	movq	%rax, DIV_ASSIGN_SYMBOL(%rip)
	movq	216+symbolList(%rip), %rax
	movq	%rax, MOD_ASSIGN_SYMBOL(%rip)
	movq	224+symbolList(%rip), %rax
	movq	%rax, AND_SYMBOL(%rip)
	movq	232+symbolList(%rip), %rax
	movq	%rax, OR_SYMBOL(%rip)
.L14:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L31:
	movl	$32, %ecx
	call	malloc
	movq	%rax, struct_memory(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L30
	movl	$1024, %ecx
	call	malloc
	movdqa	.LC1(%rip), %xmm0
	cmpq	$0, string_memory(%rip)
	movq	$0, 16(%rbx)
	movq	%rax, 24(%rbx)
	movq	$1024, struct_memory_count(%rip)
	movups	%xmm0, (%rbx)
	jne	.L18
.L32:
	movl	$32, %ecx
	call	malloc
	movq	%rax, string_memory(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L30
	movl	$1024, %ecx
	call	malloc
	movdqa	.LC1(%rip), %xmm0
	movq	$0, 16(%rbx)
	movq	%rax, 24(%rbx)
	movq	$1024, string_memory_count(%rip)
	movups	%xmm0, (%rbx)
	jmp	.L18
.L30:
	call	__getreent
	movl	$30, %r8d
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
	nop
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC2:
	.ascii "Info: Allocate big memory block of size %zu bytes\12\0"
	.align 8
.LC3:
	.ascii "struct_memory->used % ALIGN_SIZE == 0\0"
.LC4:
	.ascii "D:\\TC\\src\\lib.c\0"
	.text
	.p2align 4
	.def	create_string_check.part.0;	.scl	3;	.type	32;	.endef
	.seh_proc	create_string_check.part.0
create_string_check.part.0:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rdi
	movq	%rdx, %rbx
	cmpq	$1022, %rdx
	ja	.L42
	movq	string_memory(%rip), %rdx
	movq	8(%rdx), %rcx
	leaq	(%rbx,%rcx), %rax
	cmpq	(%rdx), %rax
	jnb	.L43
.L38:
	leaq	1(%rcx,%rbx), %rax
	movq	24(%rdx), %rsi
	movq	%rax, 8(%rdx)
	addq	%rcx, %rsi
.L37:
	movq	%rbx, %r8
	movq	%rdi, %rdx
	movq	%rsi, %rcx
	call	strncpy
	movb	$0, (%rsi,%rbx)
	cmpb	$0, initialized(%rip)
	je	.L44
.L39:
	movq	struct_memory(%rip), %r8
	movq	8(%r8), %rdx
	leaq	24(%rdx), %rax
	cmpq	(%r8), %rax
	jnb	.L45
.L40:
	testb	$7, %dl
	jne	.L46
	addq	$1, memoryBlockCount(%rip)
	movq	all_string_list(%rip), %rax
	movq	%rdx, %rcx
	addq	$24, %rdx
	andq	$-8, %rcx
	addq	24(%r8), %rcx
	movq	%rdx, 8(%r8)
	movq	%rax, 16(%rcx)
	movq	%rsi, %rax
	movq	%rsi, (%rcx)
	movq	%rbx, 8(%rcx)
	movq	%rcx, all_string_list(%rip)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L43:
	xorl	%ecx, %ecx
	call	increase_memory_size
	movq	string_memory(%rip), %rdx
	movq	8(%rdx), %rcx
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L42:
	leaq	1(%rdx), %rbp
	addq	%rbp, string_memory_count(%rip)
	movq	%rbp, %rcx
	addq	%rbp, string_memory_used(%rip)
	call	malloc
	movq	%rax, %rsi
	call	__getreent
	movq	%rbp, %r8
	leaq	.LC2(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	testq	%rsi, %rsi
	jne	.L37
	call	__getreent
	movl	$30, %r8d
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	movl	$1, %ecx
	call	exit
	.p2align 4,,10
	.p2align 3
.L45:
	movl	$1, %ecx
	call	increase_memory_size
	movq	struct_memory(%rip), %r8
	movq	8(%r8), %rdx
	jmp	.L40
	.p2align 4,,10
	.p2align 3
.L44:
	call	init
	jmp	.L39
.L46:
	leaq	.LC3(%rip), %r9
	leaq	__func__.0(%rip), %r8
	movl	$258, %edx
	leaq	.LC4(%rip), %rcx
	call	__assert_func
	nop
	.seh_endproc
	.p2align 4
	.globl	create_string
	.def	create_string;	.scl	2;	.type	32;	.endef
	.seh_proc	create_string
create_string:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	cmpb	$0, initialized(%rip)
	movq	%rcx, %rbp
	movq	%rdx, %rsi
	je	.L62
.L48:
	testq	%rbp, %rbp
	je	.L53
	testq	%rsi, %rsi
	je	.L53
	movq	all_string_list(%rip), %rbx
	testq	%rbx, %rbx
	je	.L50
	xorl	%r12d, %r12d
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L51:
	movq	16(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L63
.L52:
	cmpq	8(%rbx), %rsi
	jne	.L51
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L51
	movq	%rsi, %r8
	movq	%rbp, %rdx
	movq	%rdi, %rcx
	call	strncmp
	movq	16(%rbx), %rbx
	testl	%eax, %eax
	cmove	%rdi, %r12
	testq	%rbx, %rbx
	jne	.L52
.L63:
	testq	%r12, %r12
	je	.L50
	movq	%r12, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L50:
	movq	%rsi, %rdx
	movq	%rbp, %rcx
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	create_string_check.part.0
	.p2align 4,,10
	.p2align 3
.L62:
	call	init
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L53:
	xorl	%r12d, %r12d
	movq	%r12, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.seh_endproc
	.p2align 4
	.globl	alloc_memory
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.seh_proc	alloc_memory
alloc_memory:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	cmpb	$0, initialized(%rip)
	movq	%rcx, %rbx
	je	.L68
.L65:
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %rcx
	leaq	(%rcx,%rbx), %rax
	cmpq	(%rdx), %rax
	jnb	.L69
.L66:
	addq	$7, %rbx
	andq	$-8, %rbx
	testb	$7, %cl
	jne	.L70
	addq	$1, memoryBlockCount(%rip)
	movq	%rcx, %rax
	addq	%rcx, %rbx
	andq	$-8, %rax
	addq	24(%rdx), %rax
	movq	%rbx, 8(%rdx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L68:
	call	init
	jmp	.L65
	.p2align 4,,10
	.p2align 3
.L69:
	movl	$1, %ecx
	call	increase_memory_size
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %rcx
	jmp	.L66
.L70:
	leaq	.LC3(%rip), %r9
	leaq	__func__.0(%rip), %r8
	movl	$258, %edx
	leaq	.LC4(%rip), %rcx
	call	__assert_func
	nop
	.seh_endproc
	.p2align 4
	.globl	is_keyword
	.def	is_keyword;	.scl	2;	.type	32;	.endef
	.seh_proc	is_keyword
is_keyword:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	cmpb	$0, initialized(%rip)
	movq	%rcx, %rbx
	je	.L77
.L72:
	leaq	keywordList(%rip), %rax
	leaq	176(%rax), %rdx
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L79:
	addq	$8, %rax
	cmpq	%rax, %rdx
	je	.L78
.L74:
	cmpq	%rbx, (%rax)
	jne	.L79
	movl	$1, %eax
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L78:
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L77:
	call	init
	jmp	.L72
	.seh_endproc
	.p2align 4
	.globl	string_equal
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.seh_proc	string_equal
string_equal:
	.seh_endprologue
	cmpq	%rcx, %rdx
	sete	%al
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC5:
	.ascii "\0"
.LC6:
	.ascii "%zu/%zu bytes\0"
	.align 8
.LC7:
	.ascii "Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu\0"
	.text
	.p2align 4
	.globl	get_info
	.def	get_info;	.scl	2;	.type	32;	.endef
	.seh_proc	get_info
get_info:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	all_string_list(%rip), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L82
	.p2align 4,,10
	.p2align 3
.L83:
	movq	16(%rax), %rax
	addq	$1, %rbx
	testq	%rax, %rax
	jne	.L83
.L82:
	cmpb	$0, initialized(%rip)
	je	.L89
.L84:
	leaq	.LC5(%rip), %rsi
	movl	$48, %edx
	leaq	.LC6(%rip), %r12
	movq	%rsi, %rcx
	call	create_string_check.part.0
	movq	struct_memory_count(%rip), %r9
	movq	struct_memory_used(%rip), %r8
	movq	%r12, %rdx
	movq	%rax, %rdi
	movq	struct_memory(%rip), %rax
	movq	%rdi, %rcx
	addq	8(%rax), %r8
	call	sprintf
	cmpb	$0, initialized(%rip)
	je	.L90
.L85:
	movl	$48, %edx
	movq	%rsi, %rcx
	call	create_string_check.part.0
	movq	string_memory_count(%rip), %r9
	movq	string_memory_used(%rip), %r8
	movq	%r12, %rdx
	movq	%rax, %rbp
	movq	string_memory(%rip), %rax
	movq	%rbp, %rcx
	addq	8(%rax), %r8
	call	sprintf
	cmpb	$0, initialized(%rip)
	je	.L91
.L86:
	movq	%rsi, %rcx
	movl	$240, %edx
	call	create_string_check.part.0
	movq	%rbx, 40(%rsp)
	movq	%rdi, %r9
	movl	$2, %r8d
	movq	%rax, %rsi
	movq	memoryBlockCount(%rip), %rax
	movq	%rbp, 32(%rsp)
	leaq	.LC7(%rip), %rdx
	movq	%rsi, %rcx
	movq	%rax, 48(%rsp)
	call	sprintf
	movq	%rsi, %rax
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L89:
	call	init
	jmp	.L84
	.p2align 4,,10
	.p2align 3
.L91:
	call	init
	jmp	.L86
	.p2align 4,,10
	.p2align 3
.L90:
	call	init
	jmp	.L85
	.seh_endproc
	.section .rdata,"dr"
	.align 8
__func__.0:
	.ascii "alloc_memory\0"
.lcomm memoryBlockCount,8,8
.lcomm string_memory_count,8,8
.lcomm struct_memory_count,8,8
.lcomm string_memory_used,8,8
.lcomm struct_memory_used,8,8
	.globl	builtin_scope
	.bss
	.align 8
builtin_scope:
	.space 8
	.globl	name_bool
	.align 8
name_bool:
	.space 8
	.globl	name_string
	.align 8
name_string:
	.space 8
	.globl	name_float
	.align 8
name_float:
	.space 8
	.globl	name_int
	.align 8
name_int:
	.space 8
	.globl	name_void
	.align 8
name_void:
	.space 8
	.globl	OR_SYMBOL
	.align 8
OR_SYMBOL:
	.space 8
	.globl	AND_SYMBOL
	.align 8
AND_SYMBOL:
	.space 8
	.globl	MOD_ASSIGN_SYMBOL
	.align 8
MOD_ASSIGN_SYMBOL:
	.space 8
	.globl	DIV_ASSIGN_SYMBOL
	.align 8
DIV_ASSIGN_SYMBOL:
	.space 8
	.globl	MUL_ASSIGN_SYMBOL
	.align 8
MUL_ASSIGN_SYMBOL:
	.space 8
	.globl	SUB_ASSIGN_SYMBOL
	.align 8
SUB_ASSIGN_SYMBOL:
	.space 8
	.globl	ADD_ASSIGN_SYMBOL
	.align 8
ADD_ASSIGN_SYMBOL:
	.space 8
	.globl	GE_SYMBOL
	.align 8
GE_SYMBOL:
	.space 8
	.globl	LE_SYMBOL
	.align 8
LE_SYMBOL:
	.space 8
	.globl	NE_SYMBOL
	.align 8
NE_SYMBOL:
	.space 8
	.globl	EQ_SYMBOL
	.align 8
EQ_SYMBOL:
	.space 8
	.globl	ASSIGN_SYMBOL
	.align 8
ASSIGN_SYMBOL:
	.space 8
	.globl	GT_SYMBOL
	.align 8
GT_SYMBOL:
	.space 8
	.globl	LT_SYMBOL
	.align 8
LT_SYMBOL:
	.space 8
	.globl	MOD_SYMBOL
	.align 8
MOD_SYMBOL:
	.space 8
	.globl	DIV_SYMBOL
	.align 8
DIV_SYMBOL:
	.space 8
	.globl	MUL_SYMBOL
	.align 8
MUL_SYMBOL:
	.space 8
	.globl	SUB_SYMBOL
	.align 8
SUB_SYMBOL:
	.space 8
	.globl	ADD_SYMBOL
	.align 8
ADD_SYMBOL:
	.space 8
	.globl	UNDERLINE_SYMBOL
	.align 8
UNDERLINE_SYMBOL:
	.space 8
	.globl	SEMICOLON_SYMBOL
	.align 8
SEMICOLON_SYMBOL:
	.space 8
	.globl	R_BRACKET_SYMBOL
	.align 8
R_BRACKET_SYMBOL:
	.space 8
	.globl	L_BRACKET_SYMBOL
	.align 8
L_BRACKET_SYMBOL:
	.space 8
	.globl	DOT_SYMBOL
	.align 8
DOT_SYMBOL:
	.space 8
	.globl	NOT_SYMBOL
	.align 8
NOT_SYMBOL:
	.space 8
	.globl	COMMA_SYMBOL
	.align 8
COMMA_SYMBOL:
	.space 8
	.globl	R_BRACE_SYMBOL
	.align 8
R_BRACE_SYMBOL:
	.space 8
	.globl	L_BRACE_SYMBOL
	.align 8
L_BRACE_SYMBOL:
	.space 8
	.globl	R_PAREN_SYMBOL
	.align 8
R_PAREN_SYMBOL:
	.space 8
	.globl	L_PAREN_SYMBOL
	.align 8
L_PAREN_SYMBOL:
	.space 8
	.globl	VAR_KEYWORD
	.align 8
VAR_KEYWORD:
	.space 8
	.globl	VOID_KEYWORD
	.align 8
VOID_KEYWORD:
	.space 8
	.globl	BOOL_KEYWORD
	.align 8
BOOL_KEYWORD:
	.space 8
	.globl	STRING_KEYWORD
	.align 8
STRING_KEYWORD:
	.space 8
	.globl	FLOAT_KEYWORD
	.align 8
FLOAT_KEYWORD:
	.space 8
	.globl	INT_KEYWORD
	.align 8
INT_KEYWORD:
	.space 8
	.globl	CONTINUE_KEYWORD
	.align 8
CONTINUE_KEYWORD:
	.space 8
	.globl	BREAK_KEYWORD
	.align 8
BREAK_KEYWORD:
	.space 8
	.globl	RETURN_KEYWORD
	.align 8
RETURN_KEYWORD:
	.space 8
	.globl	FALSE_KEYWORD
	.align 8
FALSE_KEYWORD:
	.space 8
	.globl	TRUE_KEYWORD
	.align 8
TRUE_KEYWORD:
	.space 8
	.globl	FOR_KEYWORD
	.align 8
FOR_KEYWORD:
	.space 8
	.globl	WHILE_KEYWORD
	.align 8
WHILE_KEYWORD:
	.space 8
	.globl	ELSE_KEYWORD
	.align 8
ELSE_KEYWORD:
	.space 8
	.globl	ELIF_KEYWORD
	.align 8
ELIF_KEYWORD:
	.space 8
	.globl	IF_KEYWORD
	.align 8
IF_KEYWORD:
	.space 8
	.globl	SELF_KEYWORD
	.align 8
SELF_KEYWORD:
	.space 8
	.globl	METHOD_KEYWORD
	.align 8
METHOD_KEYWORD:
	.space 8
	.globl	CLASS_KEYWORD
	.align 8
CLASS_KEYWORD:
	.space 8
	.globl	FUNC_KEYWORD
	.align 8
FUNC_KEYWORD:
	.space 8
	.globl	FROM_KEYWORD
	.align 8
FROM_KEYWORD:
	.space 8
	.globl	IMPORT_KEYWORD
	.align 8
IMPORT_KEYWORD:
	.space 8
	.globl	all_string_list
	.align 8
all_string_list:
	.space 8
	.globl	initialized
initialized:
	.space 1
	.globl	string_memory
	.align 8
string_memory:
	.space 8
	.globl	struct_memory
	.align 8
struct_memory:
	.space 8
	.globl	symbolList
	.align 32
symbolList:
	.space 240
	.section .rdata,"dr"
.LC8:
	.ascii "(\0"
.LC9:
	.ascii ")\0"
.LC10:
	.ascii "{\0"
.LC11:
	.ascii "}\0"
.LC12:
	.ascii ",\0"
.LC13:
	.ascii "!\0"
.LC14:
	.ascii ".\0"
.LC15:
	.ascii "[\0"
.LC16:
	.ascii "]\0"
.LC17:
	.ascii ";\0"
.LC18:
	.ascii "_\0"
.LC19:
	.ascii "+\0"
.LC20:
	.ascii "-\0"
.LC21:
	.ascii "*\0"
.LC22:
	.ascii "/\0"
.LC23:
	.ascii "%\0"
.LC24:
	.ascii "<\0"
.LC25:
	.ascii ">\0"
.LC26:
	.ascii "=\0"
.LC27:
	.ascii "==\0"
.LC28:
	.ascii "!=\0"
.LC29:
	.ascii "<=\0"
.LC30:
	.ascii ">=\0"
.LC31:
	.ascii "+=\0"
.LC32:
	.ascii "-=\0"
.LC33:
	.ascii "*=\0"
.LC34:
	.ascii "/=\0"
.LC35:
	.ascii "%=\0"
.LC36:
	.ascii "&&\0"
.LC37:
	.ascii "||\0"
	.align 32
symbolStrings:
	.quad	.LC8
	.quad	.LC9
	.quad	.LC10
	.quad	.LC11
	.quad	.LC12
	.quad	.LC13
	.quad	.LC14
	.quad	.LC15
	.quad	.LC16
	.quad	.LC17
	.quad	.LC18
	.quad	.LC19
	.quad	.LC20
	.quad	.LC21
	.quad	.LC22
	.quad	.LC23
	.quad	.LC24
	.quad	.LC25
	.quad	.LC26
	.quad	.LC27
	.quad	.LC28
	.quad	.LC29
	.quad	.LC30
	.quad	.LC31
	.quad	.LC32
	.quad	.LC33
	.quad	.LC34
	.quad	.LC35
	.quad	.LC36
	.quad	.LC37
	.globl	keywordList
	.bss
	.align 32
keywordList:
	.space 176
	.section .rdata,"dr"
.LC38:
	.ascii "import\0"
.LC39:
	.ascii "from\0"
.LC40:
	.ascii "func\0"
.LC41:
	.ascii "class\0"
.LC42:
	.ascii "method\0"
.LC43:
	.ascii "self\0"
.LC44:
	.ascii "if\0"
.LC45:
	.ascii "elif\0"
.LC46:
	.ascii "else\0"
.LC47:
	.ascii "while\0"
.LC48:
	.ascii "for\0"
.LC49:
	.ascii "true\0"
.LC50:
	.ascii "false\0"
.LC51:
	.ascii "return\0"
.LC52:
	.ascii "break\0"
.LC53:
	.ascii "continue\0"
.LC54:
	.ascii "int\0"
.LC55:
	.ascii "float\0"
.LC56:
	.ascii "string\0"
.LC57:
	.ascii "bool\0"
.LC58:
	.ascii "void\0"
.LC59:
	.ascii "var\0"
	.align 32
keywordStrings:
	.quad	.LC38
	.quad	.LC39
	.quad	.LC40
	.quad	.LC41
	.quad	.LC42
	.quad	.LC43
	.quad	.LC44
	.quad	.LC45
	.quad	.LC46
	.quad	.LC47
	.quad	.LC48
	.quad	.LC49
	.quad	.LC50
	.quad	.LC51
	.quad	.LC52
	.quad	.LC53
	.quad	.LC54
	.quad	.LC55
	.quad	.LC56
	.quad	.LC57
	.quad	.LC58
	.quad	.LC59
	.align 16
.LC1:
	.quad	1024
	.quad	0
	.ident	"GCC: (GNU) 13.2.0"
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	__assert_func;	.scl	2;	.type	32;	.endef
	.def	strncmp;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
