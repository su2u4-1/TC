	.file	"D:\\TC\\src\\lib.c"
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
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
	je	.L13
	movl	$1024, %ecx
	movq	%rax, %rbx
	call	malloc
	movdqa	.LC1(%rip), %xmm0
	movq	$0, 16(%rbx)
	movq	%rax, 24(%rbx)
	movups	%xmm0, (%rbx)
	testb	%sil, %sil
	jne	.L14
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
.L14:
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
.L13:
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
	.section .rdata,"dr"
	.align 8
.LC2:
	.ascii "struct_memory->used % ALIGN_SIZE == 0\0"
.LC3:
	.ascii "D:\\TC\\src\\lib.c\0"
	.text
	.p2align 4
	.globl	alloc_memory
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
alloc_memory:
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$32, %rsp
	cmpb	$0, initialized(%rip)
	je	.L20
.L16:
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %rcx
	leaq	(%rcx,%rbx), %rax
	cmpq	(%rdx), %rax
	jnb	.L21
.L17:
	addq	$7, %rbx
	andq	$-8, %rbx
	testb	$7, %cl
	jne	.L22
	addq	%rcx, %rbx
	movq	%rcx, %rax
	addq	$1, memoryBlockCount(%rip)
	movq	%rbx, 8(%rdx)
	andq	$-8, %rax
	addq	24(%rdx), %rax
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L20:
	call	init.part.0
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L21:
	movl	$1, %ecx
	call	increase_memory_size
	movq	struct_memory(%rip), %rdx
	movq	8(%rdx), %rcx
	jmp	.L17
.L22:
	leaq	.LC2(%rip), %r9
	leaq	__func__.0(%rip), %r8
	movl	$258, %edx
	leaq	.LC3(%rip), %rcx
	call	__assert_func
	.section .rdata,"dr"
	.align 8
.LC4:
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
	je	.L42
.L24:
	testq	%rbp, %rbp
	je	.L32
	testq	%rsi, %rsi
	je	.L32
	testb	%bl, %bl
	je	.L26
	movq	all_string_list(%rip), %rbx
	testq	%rbx, %rbx
	je	.L26
	xorl	%edi, %edi
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L27:
	movq	16(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L43
.L28:
	cmpq	%rsi, 8(%rbx)
	jne	.L27
	movq	(%rbx), %r12
	testq	%r12, %r12
	je	.L27
	movq	%rsi, %r8
	movq	%rbp, %rdx
	movq	%r12, %rcx
	call	strncmp
	movq	16(%rbx), %rbx
	testl	%eax, %eax
	cmove	%r12, %rdi
	testq	%rbx, %rbx
	jne	.L28
.L43:
	testq	%rdi, %rdi
	jne	.L23
.L26:
	cmpq	$1022, %rsi
	ja	.L44
	movq	string_memory(%rip), %rax
	movq	8(%rax), %rdx
	leaq	(%rdx,%rsi), %rcx
	cmpq	(%rax), %rcx
	jnb	.L45
.L31:
	movq	24(%rax), %rdi
	addq	%rdx, %rdi
	leaq	1(%rdx,%rsi), %rdx
	movq	%rdx, 8(%rax)
.L30:
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
.L23:
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
.L42:
	call	init.part.0
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L44:
	leaq	1(%rsi), %rbx
	addq	%rbx, string_memory_count(%rip)
	movq	%rbx, %rcx
	addq	%rbx, string_memory_used(%rip)
	call	malloc
	movq	%rax, %rdi
	call	__getreent
	movq	%rbx, %r8
	leaq	.LC4(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	testq	%rdi, %rdi
	jne	.L30
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
.L32:
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
.L45:
	xorl	%ecx, %ecx
	call	increase_memory_size
	movq	string_memory(%rip), %rax
	movq	8(%rax), %rdx
	jmp	.L31
	.p2align 4
	.globl	create_string
	.def	create_string;	.scl	2;	.type	32;	.endef
create_string:
	movl	$1, %r8d
	jmp	create_string_check
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
	je	.L58
	cmpq	$0, string_memory(%rip)
	je	.L59
.L50:
	leaq	keywordStrings(%rip), %rbx
	movb	$1, initialized(%rip)
	movl	$6, %edx
	leaq	keywordList(%rip), %rsi
	leaq	176(%rbx), %rdi
	jmp	.L54
	.p2align 4,,10
	.p2align 3
.L52:
	movq	(%rbx), %rcx
	call	strlen
	movq	%rax, %rdx
.L54:
	movq	(%rbx), %rcx
	xorl	%r8d, %r8d
	addq	$8, %rbx
	addq	$8, %rsi
	call	create_string_check
	movq	%rax, -8(%rsi)
	cmpq	%rdi, %rbx
	jne	.L52
	leaq	symbolStrings(%rip), %rbx
	leaq	symbolList(%rip), %rsi
	movl	$1, %edx
	leaq	240(%rbx), %rdi
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L60:
	movq	(%rbx), %rcx
	call	strlen
	movq	%rax, %rdx
.L53:
	movq	(%rbx), %rcx
	xorl	%r8d, %r8d
	addq	$8, %rbx
	addq	$8, %rsi
	call	create_string_check
	movq	%rax, -8(%rsi)
	cmpq	%rdi, %rbx
	jne	.L60
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
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L58:
	movl	$32, %ecx
	call	malloc
	movq	%rax, struct_memory(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L57
	movl	$1024, %ecx
	call	malloc
	movdqa	.LC1(%rip), %xmm0
	cmpq	$0, string_memory(%rip)
	movq	$0, 16(%rbx)
	movq	%rax, 24(%rbx)
	movq	$1024, struct_memory_count(%rip)
	movups	%xmm0, (%rbx)
	jne	.L50
.L59:
	movl	$32, %ecx
	call	malloc
	movq	%rax, string_memory(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L57
	movl	$1024, %ecx
	call	malloc
	movdqa	.LC1(%rip), %xmm0
	movq	$0, 16(%rbx)
	movq	%rax, 24(%rbx)
	movq	$1024, string_memory_count(%rip)
	movups	%xmm0, (%rbx)
	jmp	.L50
.L57:
	call	__getreent
	movl	$30, %r8d
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
	.p2align 4
	.globl	init
	.def	init;	.scl	2;	.type	32;	.endef
init:
	cmpb	$0, initialized(%rip)
	jne	.L61
	jmp	init.part.0
	.p2align 4,,10
	.p2align 3
.L61:
	ret
	.p2align 4
	.globl	is_keyword
	.def	is_keyword;	.scl	2;	.type	32;	.endef
is_keyword:
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$32, %rsp
	cmpb	$0, initialized(%rip)
	je	.L70
.L64:
	leaq	keywordList(%rip), %rax
	leaq	176(%rax), %rdx
	jmp	.L66
	.p2align 4,,10
	.p2align 3
.L72:
	addq	$8, %rax
	cmpq	%rax, %rdx
	je	.L71
.L66:
	cmpq	%rbx, (%rax)
	jne	.L72
	addq	$32, %rsp
	movl	$1, %eax
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L71:
	addq	$32, %rsp
	xorl	%eax, %eax
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L70:
	call	init.part.0
	jmp	.L64
	.p2align 4
	.globl	string_equal
	.def	string_equal;	.scl	2;	.type	32;	.endef
string_equal:
	cmpq	%rcx, %rdx
	sete	%al
	ret
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
	je	.L75
	.p2align 4,,10
	.p2align 3
.L76:
	movq	16(%rax), %rax
	addq	$1, %rbx
	testq	%rax, %rax
	jne	.L76
.L75:
	leaq	.LC5(%rip), %rsi
	xorl	%r8d, %r8d
	movl	$48, %edx
	movq	%rsi, %rcx
	leaq	.LC6(%rip), %r12
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
	leaq	.LC7(%rip), %rdx
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
	.def	__assert_func;	.scl	2;	.type	32;	.endef
	.def	strncmp;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
