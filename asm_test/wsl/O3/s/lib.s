	.file	"lib.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Fatal: Cannot allocate memory\n"
	.text
	.p2align 4
	.type	increase_memory_size, @function
increase_memory_size:
	pushq	%rbp
	movl	%edi, %ebp
	movl	$32, %edi
	pushq	%rbx
	subq	$8, %rsp
	call	*malloc@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L13
	movq	%rax, %rbx
	movl	$1024, %edi
	call	*malloc@GOTPCREL(%rip)
	movdqa	.LC1(%rip), %xmm0
	movq	$0, 16(%rbx)
	movq	%rax, 24(%rbx)
	movups	%xmm0, (%rbx)
	testb	%bpl, %bpl
	jne	.L14
	movq	string_memory(%rip), %rax
	addq	$1024, string_memory_count(%rip)
	movq	%rbx, string_memory(%rip)
	movq	8(%rax), %rdx
	movq	%rax, 16(%rbx)
	addq	%rdx, string_memory_used(%rip)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	movq	struct_memory(%rip), %rax
	addq	$1024, struct_memory_count(%rip)
	movq	%rbx, struct_memory(%rip)
	movq	8(%rax), %rdx
	movq	%rax, 16(%rbx)
	addq	%rdx, struct_memory_used(%rip)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.L13:
	movq	stderr(%rip), %rcx
	movl	$30, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	movq	string_memory(%rip), %rbx
	testq	%rbx, %rbx
	je	.L3
.L4:
	movq	%rbx, %rbp
	movq	16(%rbx), %rbx
	movq	24(%rbp), %rdi
	call	*free@GOTPCREL(%rip)
	movq	%rbp, %rdi
	call	*free@GOTPCREL(%rip)
	testq	%rbx, %rbx
	jne	.L4
.L3:
	movb	$0, initialized(%rip)
	movl	$1, %edi
	call	*exit@GOTPCREL(%rip)
	.size	increase_memory_size, .-increase_memory_size
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"init"
.LC3:
	.string	"$constructor"
	.text
	.p2align 4
	.type	init, @function
init:
	cmpb	$0, initialized(%rip)
	jne	.L34
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$24, %rsp
	cmpq	$0, struct_memory(%rip)
	je	.L39
.L17:
	cmpq	$0, string_memory(%rip)
	je	.L40
.L19:
	leaq	keywordStrings(%rip), %rbx
	movb	$1, initialized(%rip)
	movl	$6, %esi
	leaq	keywordList(%rip), %rbp
	leaq	176(%rbx), %r13
	movl	$1, %r12d
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L21:
	testq	%rsi, %rsi
	je	.L22
.L42:
	call	create_string_check.part.0
	movq	%rax, 0(%rbp)
.L38:
	addq	$8, %rbx
	movzbl	initialized(%rip), %r12d
	addq	$8, %rbp
	cmpq	%r13, %rbx
	je	.L41
	movq	(%rbx), %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rsi
.L26:
	movq	(%rbx), %rdi
	testb	%r12b, %r12b
	jne	.L21
	movq	%rdi, 8(%rsp)
	movq	%rsi, (%rsp)
	call	init
	movq	(%rsp), %rsi
	movq	8(%rsp), %rdi
	testq	%rsi, %rsi
	jne	.L42
	.p2align 4,,10
	.p2align 3
.L22:
	movq	$0, 0(%rbp)
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L41:
	leaq	symbolStrings(%rip), %rbx
	leaq	symbolList(%rip), %rbp
	movl	$1, %esi
	leaq	240(%rbx), %r12
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L27:
	testq	%rsi, %rsi
	je	.L28
.L43:
	call	create_string_check.part.0
	addq	$8, %rbx
	addq	$8, %rbp
	movq	%rax, -8(%rbp)
	cmpq	%r12, %rbx
	je	.L30
.L29:
	movq	(%rbx), %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rsi
.L25:
	cmpb	$0, initialized(%rip)
	movq	(%rbx), %rdi
	jne	.L27
	movq	%rsi, 8(%rsp)
	movq	%rdi, (%rsp)
	call	init
	movq	8(%rsp), %rsi
	movq	(%rsp), %rdi
	testq	%rsi, %rsi
	jne	.L43
	.p2align 4,,10
	.p2align 3
.L28:
	addq	$8, %rbx
	movq	$0, 0(%rbp)
	addq	$8, %rbp
	cmpq	%r12, %rbx
	jne	.L29
	.p2align 4,,10
	.p2align 3
.L30:
	cmpb	$0, initialized(%rip)
	je	.L44
.L31:
	movl	$4, %esi
	leaq	.LC2(%rip), %rdi
	call	create_string_check.part.0
	cmpb	$0, initialized(%rip)
	movq	%rax, DEFAULT_INIT_NAME(%rip)
	je	.L45
.L32:
	movl	$13, %esi
	leaq	.LC3(%rip), %rdi
	call	create_string_check.part.0
	movq	%rax, DEFAULT_CONSTRUCTOR_NAME(%rip)
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
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L45:
	call	init
	jmp	.L32
	.p2align 4,,10
	.p2align 3
.L44:
	call	init
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L34:
	ret
.L40:
	movl	$32, %edi
	call	*malloc@GOTPCREL(%rip)
	movq	%rax, string_memory(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L46
	movl	$1024, %edi
	call	*malloc@GOTPCREL(%rip)
	movdqa	.LC1(%rip), %xmm0
	movq	$0, 16(%rbx)
	movq	%rax, 24(%rbx)
	movq	$1024, string_memory_count(%rip)
	movups	%xmm0, (%rbx)
	jmp	.L19
.L39:
	movl	$32, %edi
	call	*malloc@GOTPCREL(%rip)
	movq	%rax, struct_memory(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L47
	movl	$1024, %edi
	call	*malloc@GOTPCREL(%rip)
	movdqa	.LC1(%rip), %xmm0
	movq	$0, 16(%rbx)
	movq	%rax, 24(%rbx)
	movq	$1024, struct_memory_count(%rip)
	movups	%xmm0, (%rbx)
	jmp	.L17
.L46:
	leaq	.LC0(%rip), %rdi
	movl	$30, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	*fwrite@GOTPCREL(%rip)
	movb	$0, initialized(%rip)
	movl	$1, %edi
	call	*exit@GOTPCREL(%rip)
.L47:
	leaq	.LC0(%rip), %rdi
	movl	$30, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	*fwrite@GOTPCREL(%rip)
	movb	$0, initialized(%rip)
	movl	$1, %edi
	call	*exit@GOTPCREL(%rip)
	.size	init, .-init
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"Info: Allocate big memory block of size %zu bytes\n"
	.section	.rodata.str1.1
.LC5:
	.string	"src/lib.c"
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"struct_memory->used % ALIGN_SIZE == 0"
	.text
	.p2align 4
	.type	create_string_check.part.0, @function
create_string_check.part.0:
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$8, %rsp
	cmpq	$1022, %rsi
	ja	.L56
	movq	string_memory(%rip), %rdx
	movq	8(%rdx), %rcx
	leaq	(%rsi,%rcx), %rax
	cmpq	(%rdx), %rax
	jnb	.L57
.L51:
	leaq	1(%rcx,%rbx), %rax
	movq	24(%rdx), %rbp
	movq	%rax, 8(%rdx)
	addq	%rcx, %rbp
.L50:
	movq	%rbx, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	*strncpy@GOTPCREL(%rip)
	movb	$0, 0(%rbp,%rbx)
	cmpb	$0, initialized(%rip)
	je	.L58
.L52:
	movq	struct_memory(%rip), %rsi
	movq	8(%rsi), %rdx
	leaq	24(%rdx), %rax
	cmpq	(%rsi), %rax
	jnb	.L59
.L53:
	testb	$7, %dl
	jne	.L60
	movq	all_string_list(%rip), %rax
	movq	%rdx, %rcx
	addq	$24, %rdx
	addq	$1, memoryBlockCount(%rip)
	andq	$-8, %rcx
	addq	24(%rsi), %rcx
	movq	%rdx, 8(%rsi)
	movq	%rbp, (%rcx)
	movq	%rax, 16(%rcx)
	movq	%rbp, %rax
	movq	%rbx, 8(%rcx)
	movq	%rcx, all_string_list(%rip)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L57:
	xorl	%edi, %edi
	call	increase_memory_size
	movq	string_memory(%rip), %rdx
	movq	8(%rdx), %rcx
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L56:
	leaq	1(%rsi), %r13
	addq	%r13, string_memory_count(%rip)
	addq	%r13, string_memory_used(%rip)
	movq	%r13, %rdi
	call	*malloc@GOTPCREL(%rip)
	movq	stderr(%rip), %rdi
	movq	%r13, %rcx
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rbp
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	testq	%rbp, %rbp
	jne	.L50
	leaq	.LC0(%rip), %rdi
	movl	$30, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	*fwrite@GOTPCREL(%rip)
	movl	$1, %edi
	call	*exit@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L59:
	movl	$1, %edi
	call	increase_memory_size
	movq	struct_memory(%rip), %rsi
	movq	8(%rsi), %rdx
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L58:
	call	init
	jmp	.L52
.L60:
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$263, %edx
	leaq	.LC5(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	call	*__assert_fail@GOTPCREL(%rip)
	.size	create_string_check.part.0, .-create_string_check.part.0
	.p2align 4
	.globl	create_string_not_check
	.type	create_string_not_check, @function
create_string_not_check:
	cmpb	$0, initialized(%rip)
	je	.L71
	testq	%rdi, %rdi
	je	.L66
	testq	%rsi, %rsi
	je	.L66
	jmp	create_string_check.part.0
	.p2align 4,,10
	.p2align 3
.L71:
	subq	$24, %rsp
	movq	%rsi, 8(%rsp)
	movq	%rdi, (%rsp)
	call	init
	movq	(%rsp), %rdi
	movq	8(%rsp), %rsi
	testq	%rdi, %rdi
	je	.L63
	testq	%rsi, %rsi
	je	.L63
	addq	$24, %rsp
	jmp	create_string_check.part.0
	.p2align 4,,10
	.p2align 3
.L66:
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L63:
	xorl	%eax, %eax
	addq	$24, %rsp
	ret
	.size	create_string_not_check, .-create_string_not_check
	.p2align 4
	.globl	create_string
	.type	create_string, @function
create_string:
	cmpb	$0, initialized(%rip)
	pushq	%r14
	pushq	%r13
	movq	%rdi, %r13
	pushq	%r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	je	.L88
.L73:
	testq	%r13, %r13
	je	.L78
	testq	%rbp, %rbp
	je	.L78
	movq	all_string_list(%rip), %rbx
	testq	%rbx, %rbx
	je	.L75
	xorl	%r14d, %r14d
	jmp	.L77
	.p2align 4,,10
	.p2align 3
.L76:
	movq	16(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L89
.L77:
	cmpq	8(%rbx), %rbp
	jne	.L76
	movq	(%rbx), %r12
	testq	%r12, %r12
	je	.L76
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	*strncmp@GOTPCREL(%rip)
	movq	16(%rbx), %rbx
	testl	%eax, %eax
	cmove	%r12, %r14
	testq	%rbx, %rbx
	jne	.L77
.L89:
	testq	%r14, %r14
	je	.L75
	popq	%rbx
	movq	%r14, %rax
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L75:
	popq	%rbx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	create_string_check.part.0
	.p2align 4,,10
	.p2align 3
.L88:
	call	init
	jmp	.L73
	.p2align 4,,10
	.p2align 3
.L78:
	xorl	%r14d, %r14d
	popq	%rbx
	popq	%rbp
	movq	%r14, %rax
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	create_string, .-create_string
	.p2align 4
	.globl	alloc_memory
	.type	alloc_memory, @function
alloc_memory:
	cmpb	$0, initialized(%rip)
	pushq	%rbx
	movq	%rdi, %rbx
	je	.L95
.L91:
	movq	struct_memory(%rip), %rdx
	addq	$7, %rbx
	andq	$-8, %rbx
	movq	8(%rdx), %rcx
	leaq	(%rcx,%rbx), %rax
	cmpq	(%rdx), %rax
	jnb	.L96
.L92:
	testb	$7, %cl
	jne	.L97
	addq	%rcx, %rbx
	movq	%rcx, %rax
	addq	$1, memoryBlockCount(%rip)
	movq	%rbx, 8(%rdx)
	andq	$-8, %rax
	popq	%rbx
	addq	24(%rdx), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L95:
	call	init
	jmp	.L91
	.p2align 4,,10
	.p2align 3
.L96:
	movl	$1, %edi
	call	increase_memory_size
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %rcx
	jmp	.L92
.L97:
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$263, %edx
	leaq	.LC5(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	call	*__assert_fail@GOTPCREL(%rip)
	.size	alloc_memory, .-alloc_memory
	.p2align 4
	.globl	is_keyword
	.type	is_keyword, @function
is_keyword:
	cmpb	$0, initialized(%rip)
	pushq	%rbx
	movq	%rdi, %rbx
	je	.L105
.L99:
	leaq	keywordList(%rip), %rax
	leaq	176(%rax), %rdx
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L107:
	addq	$8, %rax
	cmpq	%rax, %rdx
	je	.L106
.L101:
	cmpq	%rbx, (%rax)
	jne	.L107
	movl	$1, %eax
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L106:
	xorl	%eax, %eax
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L105:
	call	init
	jmp	.L99
	.size	is_keyword, .-is_keyword
	.p2align 4
	.globl	string_equal
	.type	string_equal, @function
string_equal:
	cmpq	%rdi, %rsi
	sete	%al
	ret
	.size	string_equal, .-string_equal
	.section	.rodata.str1.1
.LC7:
	.string	""
.LC8:
	.string	"%zu/%zu bytes"
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu"
	.text
	.p2align 4
	.globl	get_info
	.type	get_info, @function
get_info:
	movq	all_string_list(%rip), %rax
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L110
	.p2align 4,,10
	.p2align 3
.L111:
	movq	16(%rax), %rax
	addq	$1, %rbx
	testq	%rax, %rax
	jne	.L111
.L110:
	cmpb	$0, initialized(%rip)
	je	.L118
.L112:
	leaq	.LC7(%rip), %rbp
	movl	$48, %esi
	leaq	.LC8(%rip), %r14
	movq	%rbp, %rdi
	call	create_string_check.part.0
	movq	struct_memory_used(%rip), %r8
	movq	%r14, %rcx
	movq	struct_memory_count(%rip), %r9
	movq	%rax, %r12
	movq	struct_memory(%rip), %rax
	movq	$-1, %rdx
	movl	$2, %esi
	movq	%r12, %rdi
	addq	8(%rax), %r8
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	cmpb	$0, initialized(%rip)
	je	.L119
.L113:
	movl	$48, %esi
	movq	%rbp, %rdi
	call	create_string_check.part.0
	movq	string_memory_used(%rip), %r8
	movq	%r14, %rcx
	movq	string_memory_count(%rip), %r9
	movq	%rax, %r13
	movq	string_memory(%rip), %rax
	movq	$-1, %rdx
	movl	$2, %esi
	movq	%r13, %rdi
	addq	8(%rax), %r8
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	cmpb	$0, initialized(%rip)
	je	.L120
.L114:
	movq	%rbp, %rdi
	movl	$240, %esi
	call	create_string_check.part.0
	subq	$8, %rsp
	movq	%r12, %r9
	pushq	memoryBlockCount(%rip)
	pushq	%rbx
	movq	%rax, %rbp
	movq	%rax, %rdi
	movl	$3, %r8d
	pushq	%r13
	leaq	.LC9(%rip), %rcx
	movl	$2, %esi
	xorl	%eax, %eax
	movq	$-1, %rdx
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	%rbp, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L118:
	call	init
	jmp	.L112
	.p2align 4,,10
	.p2align 3
.L120:
	call	init
	jmp	.L114
	.p2align 4,,10
	.p2align 3
.L119:
	call	init
	jmp	.L113
	.size	get_info, .-get_info
	.p2align 4
	.globl	to_lower
	.type	to_lower, @function
to_lower:
	leal	-65(%rdi), %edx
	leal	32(%rdi), %eax
	cmpb	$26, %dl
	cmovnb	%edi, %eax
	ret
	.size	to_lower, .-to_lower
	.p2align 4
	.globl	to_upper
	.type	to_upper, @function
to_upper:
	leal	-97(%rdi), %edx
	leal	-32(%rdi), %eax
	cmpb	$26, %dl
	cmovnb	%edi, %eax
	ret
	.size	to_upper, .-to_upper
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 13
__PRETTY_FUNCTION__.0:
	.string	"alloc_memory"
	.local	memoryBlockCount
	.comm	memoryBlockCount,8,8
	.local	string_memory_count
	.comm	string_memory_count,8,8
	.local	struct_memory_count
	.comm	struct_memory_count,8,8
	.local	string_memory_used
	.comm	string_memory_used,8,8
	.local	struct_memory_used
	.comm	struct_memory_used,8,8
	.globl	builtin_scope
	.bss
	.align 8
	.type	builtin_scope, @object
	.size	builtin_scope, 8
builtin_scope:
	.zero	8
	.globl	name_bool
	.align 8
	.type	name_bool, @object
	.size	name_bool, 8
name_bool:
	.zero	8
	.globl	name_string
	.align 8
	.type	name_string, @object
	.size	name_string, 8
name_string:
	.zero	8
	.globl	name_float
	.align 8
	.type	name_float, @object
	.size	name_float, 8
name_float:
	.zero	8
	.globl	name_int
	.align 8
	.type	name_int, @object
	.size	name_int, 8
name_int:
	.zero	8
	.globl	name_void
	.align 8
	.type	name_void, @object
	.size	name_void, 8
name_void:
	.zero	8
	.globl	OR_SYMBOL
	.align 8
	.type	OR_SYMBOL, @object
	.size	OR_SYMBOL, 8
OR_SYMBOL:
	.zero	8
	.globl	AND_SYMBOL
	.align 8
	.type	AND_SYMBOL, @object
	.size	AND_SYMBOL, 8
AND_SYMBOL:
	.zero	8
	.globl	MOD_ASSIGN_SYMBOL
	.align 8
	.type	MOD_ASSIGN_SYMBOL, @object
	.size	MOD_ASSIGN_SYMBOL, 8
MOD_ASSIGN_SYMBOL:
	.zero	8
	.globl	DIV_ASSIGN_SYMBOL
	.align 8
	.type	DIV_ASSIGN_SYMBOL, @object
	.size	DIV_ASSIGN_SYMBOL, 8
DIV_ASSIGN_SYMBOL:
	.zero	8
	.globl	MUL_ASSIGN_SYMBOL
	.align 8
	.type	MUL_ASSIGN_SYMBOL, @object
	.size	MUL_ASSIGN_SYMBOL, 8
MUL_ASSIGN_SYMBOL:
	.zero	8
	.globl	SUB_ASSIGN_SYMBOL
	.align 8
	.type	SUB_ASSIGN_SYMBOL, @object
	.size	SUB_ASSIGN_SYMBOL, 8
SUB_ASSIGN_SYMBOL:
	.zero	8
	.globl	ADD_ASSIGN_SYMBOL
	.align 8
	.type	ADD_ASSIGN_SYMBOL, @object
	.size	ADD_ASSIGN_SYMBOL, 8
ADD_ASSIGN_SYMBOL:
	.zero	8
	.globl	GE_SYMBOL
	.align 8
	.type	GE_SYMBOL, @object
	.size	GE_SYMBOL, 8
GE_SYMBOL:
	.zero	8
	.globl	LE_SYMBOL
	.align 8
	.type	LE_SYMBOL, @object
	.size	LE_SYMBOL, 8
LE_SYMBOL:
	.zero	8
	.globl	NE_SYMBOL
	.align 8
	.type	NE_SYMBOL, @object
	.size	NE_SYMBOL, 8
NE_SYMBOL:
	.zero	8
	.globl	EQ_SYMBOL
	.align 8
	.type	EQ_SYMBOL, @object
	.size	EQ_SYMBOL, 8
EQ_SYMBOL:
	.zero	8
	.globl	ASSIGN_SYMBOL
	.align 8
	.type	ASSIGN_SYMBOL, @object
	.size	ASSIGN_SYMBOL, 8
ASSIGN_SYMBOL:
	.zero	8
	.globl	GT_SYMBOL
	.align 8
	.type	GT_SYMBOL, @object
	.size	GT_SYMBOL, 8
GT_SYMBOL:
	.zero	8
	.globl	LT_SYMBOL
	.align 8
	.type	LT_SYMBOL, @object
	.size	LT_SYMBOL, 8
LT_SYMBOL:
	.zero	8
	.globl	MOD_SYMBOL
	.align 8
	.type	MOD_SYMBOL, @object
	.size	MOD_SYMBOL, 8
MOD_SYMBOL:
	.zero	8
	.globl	DIV_SYMBOL
	.align 8
	.type	DIV_SYMBOL, @object
	.size	DIV_SYMBOL, 8
DIV_SYMBOL:
	.zero	8
	.globl	MUL_SYMBOL
	.align 8
	.type	MUL_SYMBOL, @object
	.size	MUL_SYMBOL, 8
MUL_SYMBOL:
	.zero	8
	.globl	SUB_SYMBOL
	.align 8
	.type	SUB_SYMBOL, @object
	.size	SUB_SYMBOL, 8
SUB_SYMBOL:
	.zero	8
	.globl	ADD_SYMBOL
	.align 8
	.type	ADD_SYMBOL, @object
	.size	ADD_SYMBOL, 8
ADD_SYMBOL:
	.zero	8
	.globl	UNDERLINE_SYMBOL
	.align 8
	.type	UNDERLINE_SYMBOL, @object
	.size	UNDERLINE_SYMBOL, 8
UNDERLINE_SYMBOL:
	.zero	8
	.globl	SEMICOLON_SYMBOL
	.align 8
	.type	SEMICOLON_SYMBOL, @object
	.size	SEMICOLON_SYMBOL, 8
SEMICOLON_SYMBOL:
	.zero	8
	.globl	R_BRACKET_SYMBOL
	.align 8
	.type	R_BRACKET_SYMBOL, @object
	.size	R_BRACKET_SYMBOL, 8
R_BRACKET_SYMBOL:
	.zero	8
	.globl	L_BRACKET_SYMBOL
	.align 8
	.type	L_BRACKET_SYMBOL, @object
	.size	L_BRACKET_SYMBOL, 8
L_BRACKET_SYMBOL:
	.zero	8
	.globl	DOT_SYMBOL
	.align 8
	.type	DOT_SYMBOL, @object
	.size	DOT_SYMBOL, 8
DOT_SYMBOL:
	.zero	8
	.globl	NOT_SYMBOL
	.align 8
	.type	NOT_SYMBOL, @object
	.size	NOT_SYMBOL, 8
NOT_SYMBOL:
	.zero	8
	.globl	COMMA_SYMBOL
	.align 8
	.type	COMMA_SYMBOL, @object
	.size	COMMA_SYMBOL, 8
COMMA_SYMBOL:
	.zero	8
	.globl	R_BRACE_SYMBOL
	.align 8
	.type	R_BRACE_SYMBOL, @object
	.size	R_BRACE_SYMBOL, 8
R_BRACE_SYMBOL:
	.zero	8
	.globl	L_BRACE_SYMBOL
	.align 8
	.type	L_BRACE_SYMBOL, @object
	.size	L_BRACE_SYMBOL, 8
L_BRACE_SYMBOL:
	.zero	8
	.globl	R_PAREN_SYMBOL
	.align 8
	.type	R_PAREN_SYMBOL, @object
	.size	R_PAREN_SYMBOL, 8
R_PAREN_SYMBOL:
	.zero	8
	.globl	L_PAREN_SYMBOL
	.align 8
	.type	L_PAREN_SYMBOL, @object
	.size	L_PAREN_SYMBOL, 8
L_PAREN_SYMBOL:
	.zero	8
	.globl	VAR_KEYWORD
	.align 8
	.type	VAR_KEYWORD, @object
	.size	VAR_KEYWORD, 8
VAR_KEYWORD:
	.zero	8
	.globl	VOID_KEYWORD
	.align 8
	.type	VOID_KEYWORD, @object
	.size	VOID_KEYWORD, 8
VOID_KEYWORD:
	.zero	8
	.globl	BOOL_KEYWORD
	.align 8
	.type	BOOL_KEYWORD, @object
	.size	BOOL_KEYWORD, 8
BOOL_KEYWORD:
	.zero	8
	.globl	STRING_KEYWORD
	.align 8
	.type	STRING_KEYWORD, @object
	.size	STRING_KEYWORD, 8
STRING_KEYWORD:
	.zero	8
	.globl	FLOAT_KEYWORD
	.align 8
	.type	FLOAT_KEYWORD, @object
	.size	FLOAT_KEYWORD, 8
FLOAT_KEYWORD:
	.zero	8
	.globl	INT_KEYWORD
	.align 8
	.type	INT_KEYWORD, @object
	.size	INT_KEYWORD, 8
INT_KEYWORD:
	.zero	8
	.globl	CONTINUE_KEYWORD
	.align 8
	.type	CONTINUE_KEYWORD, @object
	.size	CONTINUE_KEYWORD, 8
CONTINUE_KEYWORD:
	.zero	8
	.globl	BREAK_KEYWORD
	.align 8
	.type	BREAK_KEYWORD, @object
	.size	BREAK_KEYWORD, 8
BREAK_KEYWORD:
	.zero	8
	.globl	RETURN_KEYWORD
	.align 8
	.type	RETURN_KEYWORD, @object
	.size	RETURN_KEYWORD, 8
RETURN_KEYWORD:
	.zero	8
	.globl	FALSE_KEYWORD
	.align 8
	.type	FALSE_KEYWORD, @object
	.size	FALSE_KEYWORD, 8
FALSE_KEYWORD:
	.zero	8
	.globl	TRUE_KEYWORD
	.align 8
	.type	TRUE_KEYWORD, @object
	.size	TRUE_KEYWORD, 8
TRUE_KEYWORD:
	.zero	8
	.globl	FOR_KEYWORD
	.align 8
	.type	FOR_KEYWORD, @object
	.size	FOR_KEYWORD, 8
FOR_KEYWORD:
	.zero	8
	.globl	WHILE_KEYWORD
	.align 8
	.type	WHILE_KEYWORD, @object
	.size	WHILE_KEYWORD, 8
WHILE_KEYWORD:
	.zero	8
	.globl	ELSE_KEYWORD
	.align 8
	.type	ELSE_KEYWORD, @object
	.size	ELSE_KEYWORD, 8
ELSE_KEYWORD:
	.zero	8
	.globl	ELIF_KEYWORD
	.align 8
	.type	ELIF_KEYWORD, @object
	.size	ELIF_KEYWORD, 8
ELIF_KEYWORD:
	.zero	8
	.globl	IF_KEYWORD
	.align 8
	.type	IF_KEYWORD, @object
	.size	IF_KEYWORD, 8
IF_KEYWORD:
	.zero	8
	.globl	SELF_KEYWORD
	.align 8
	.type	SELF_KEYWORD, @object
	.size	SELF_KEYWORD, 8
SELF_KEYWORD:
	.zero	8
	.globl	METHOD_KEYWORD
	.align 8
	.type	METHOD_KEYWORD, @object
	.size	METHOD_KEYWORD, 8
METHOD_KEYWORD:
	.zero	8
	.globl	CLASS_KEYWORD
	.align 8
	.type	CLASS_KEYWORD, @object
	.size	CLASS_KEYWORD, 8
CLASS_KEYWORD:
	.zero	8
	.globl	FUNC_KEYWORD
	.align 8
	.type	FUNC_KEYWORD, @object
	.size	FUNC_KEYWORD, 8
FUNC_KEYWORD:
	.zero	8
	.globl	FROM_KEYWORD
	.align 8
	.type	FROM_KEYWORD, @object
	.size	FROM_KEYWORD, 8
FROM_KEYWORD:
	.zero	8
	.globl	IMPORT_KEYWORD
	.align 8
	.type	IMPORT_KEYWORD, @object
	.size	IMPORT_KEYWORD, 8
IMPORT_KEYWORD:
	.zero	8
	.globl	DEFAULT_CONSTRUCTOR_NAME
	.align 8
	.type	DEFAULT_CONSTRUCTOR_NAME, @object
	.size	DEFAULT_CONSTRUCTOR_NAME, 8
DEFAULT_CONSTRUCTOR_NAME:
	.zero	8
	.globl	DEFAULT_INIT_NAME
	.align 8
	.type	DEFAULT_INIT_NAME, @object
	.size	DEFAULT_INIT_NAME, 8
DEFAULT_INIT_NAME:
	.zero	8
	.globl	all_string_list
	.align 8
	.type	all_string_list, @object
	.size	all_string_list, 8
all_string_list:
	.zero	8
	.globl	initialized
	.type	initialized, @object
	.size	initialized, 1
initialized:
	.zero	1
	.globl	string_memory
	.align 8
	.type	string_memory, @object
	.size	string_memory, 8
string_memory:
	.zero	8
	.globl	struct_memory
	.align 8
	.type	struct_memory, @object
	.size	struct_memory, 8
struct_memory:
	.zero	8
	.globl	symbolList
	.align 32
	.type	symbolList, @object
	.size	symbolList, 240
symbolList:
	.zero	240
	.section	.rodata.str1.1
.LC10:
	.string	"("
.LC11:
	.string	")"
.LC12:
	.string	"{"
.LC13:
	.string	"}"
.LC14:
	.string	","
.LC15:
	.string	"!"
.LC16:
	.string	"."
.LC17:
	.string	"["
.LC18:
	.string	"]"
.LC19:
	.string	";"
.LC20:
	.string	"_"
.LC21:
	.string	"+"
.LC22:
	.string	"-"
.LC23:
	.string	"*"
.LC24:
	.string	"/"
.LC25:
	.string	"%"
.LC26:
	.string	"<"
.LC27:
	.string	">"
.LC28:
	.string	"="
.LC29:
	.string	"=="
.LC30:
	.string	"!="
.LC31:
	.string	"<="
.LC32:
	.string	">="
.LC33:
	.string	"+="
.LC34:
	.string	"-="
.LC35:
	.string	"*="
.LC36:
	.string	"/="
.LC37:
	.string	"%="
.LC38:
	.string	"&&"
.LC39:
	.string	"||"
	.section	.data.rel.ro.local,"aw"
	.align 32
	.type	symbolStrings, @object
	.size	symbolStrings, 240
symbolStrings:
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
	.quad	.LC38
	.quad	.LC39
	.globl	keywordList
	.bss
	.align 32
	.type	keywordList, @object
	.size	keywordList, 176
keywordList:
	.zero	176
	.section	.rodata.str1.1
.LC40:
	.string	"import"
.LC41:
	.string	"from"
.LC42:
	.string	"func"
.LC43:
	.string	"class"
.LC44:
	.string	"method"
.LC45:
	.string	"self"
.LC46:
	.string	"if"
.LC47:
	.string	"elif"
.LC48:
	.string	"else"
.LC49:
	.string	"while"
.LC50:
	.string	"for"
.LC51:
	.string	"true"
.LC52:
	.string	"false"
.LC53:
	.string	"return"
.LC54:
	.string	"break"
.LC55:
	.string	"continue"
.LC56:
	.string	"int"
.LC57:
	.string	"float"
.LC58:
	.string	"string"
.LC59:
	.string	"bool"
.LC60:
	.string	"void"
.LC61:
	.string	"var"
	.section	.data.rel.ro.local
	.align 32
	.type	keywordStrings, @object
	.size	keywordStrings, 176
keywordStrings:
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
	.quad	.LC60
	.quad	.LC61
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.quad	1024
	.quad	0
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
