	.file	"D:\\TC\\src\\lib.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Fatal: Cannot allocate memory\12\0"
	.text
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
	jne	.L2
	call	__getreent
	leaq	.LC0(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	movq	string_memory(%rip), %rbx
.L3:
	testq	%rbx, %rbx
	je	.L8
	movq	24(%rbx), %rcx
	movq	16(%rbx), %rsi
	call	free
	movq	%rbx, %rcx
	movq	%rsi, %rbx
	call	free
	jmp	.L3
.L8:
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
.L2:
	movl	$1024, %ecx
	call	malloc
	movq	$1024, (%rbx)
	movq	%rax, 24(%rbx)
	xorl	%eax, %eax
	movq	%rax, 8(%rbx)
	movq	%rax, 16(%rbx)
	testb	%sil, %sil
	je	.L5
	movq	struct_memory(%rip), %rax
	addq	$1024, struct_memory_count(%rip)
	movq	%rbx, struct_memory(%rip)
	movq	8(%rax), %rdx
	movq	%rax, 16(%rbx)
	addq	%rdx, struct_memory_used(%rip)
	jmp	.L1
.L5:
	movq	string_memory(%rip), %rax
	addq	$1024, string_memory_count(%rip)
	movq	%rbx, string_memory(%rip)
	movq	8(%rax), %rdx
	addq	%rdx, string_memory_used(%rip)
	movq	%rax, 16(%rbx)
.L1:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC1:
	.ascii "struct_memory->used % ALIGN_SIZE == 0\0"
.LC2:
	.ascii "D:\\TC\\src\\lib.c\0"
	.text
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
	jne	.L10
	call	init
.L10:
	movq	struct_memory(%rip), %rax
	movq	8(%rax), %rdx
	addq	%rbx, %rdx
	cmpq	(%rax), %rdx
	jb	.L11
	movl	$1, %ecx
	call	increase_memory_size
.L11:
	movq	struct_memory(%rip), %rcx
	addq	$7, %rbx
	andq	$-8, %rbx
	movq	8(%rcx), %rdx
	testb	$7, %dl
	je	.L12
	leaq	.LC1(%rip), %r9
	leaq	__func__.0(%rip), %r8
	movl	$258, %edx
	leaq	.LC2(%rip), %rcx
	call	__assert_func
.L12:
	incq	memoryBlockCount(%rip)
	movq	%rdx, %rax
	addq	%rbx, %rdx
	andq	$-8, %rax
	addq	24(%rcx), %rax
	movq	%rdx, 8(%rcx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "Info: Allocate big memory block of size %zu bytes\12\0"
	.text
	.def	create_string_check;	.scl	3;	.type	32;	.endef
	.seh_proc	create_string_check
create_string_check:
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
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	cmpb	$0, initialized(%rip)
	movq	%rcx, %rdi
	movq	%rdx, %rsi
	movl	%r8d, %ebx
	jne	.L14
	call	init
.L14:
	testq	%rdi, %rdi
	je	.L23
	testq	%rsi, %rsi
	je	.L23
	testb	%bl, %bl
	je	.L16
	movq	all_string_list(%rip), %rbp
	xorl	%ebx, %ebx
.L17:
	testq	%rbp, %rbp
	je	.L28
	cmpq	%rsi, 8(%rbp)
	jne	.L18
	movq	0(%rbp), %r12
	testq	%r12, %r12
	je	.L18
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%r12, %rcx
	call	strncmp
	testl	%eax, %eax
	cmove	%r12, %rbx
.L18:
	movq	16(%rbp), %rbp
	jmp	.L17
.L28:
	testq	%rbx, %rbx
	jne	.L13
.L16:
	cmpq	$1022, %rsi
	jbe	.L20
	leaq	1(%rsi), %r8
	addq	%r8, string_memory_count(%rip)
	movq	%r8, %rcx
	addq	%r8, string_memory_used(%rip)
	movq	%r8, 40(%rsp)
	call	malloc
	movq	%rax, %rbx
	call	__getreent
	movq	40(%rsp), %r8
	leaq	.LC3(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	testq	%rbx, %rbx
	jne	.L21
	call	__getreent
	leaq	.LC0(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	movl	$1, %ecx
	call	exit
.L20:
	movq	string_memory(%rip), %rax
	movq	8(%rax), %rdx
	addq	%rsi, %rdx
	cmpq	(%rax), %rdx
	jb	.L22
	xorl	%ecx, %ecx
	call	increase_memory_size
.L22:
	movq	string_memory(%rip), %rax
	movq	8(%rax), %rdx
	movq	24(%rax), %rbx
	addq	%rdx, %rbx
	leaq	1(%rdx,%rsi), %rdx
	movq	%rdx, 8(%rax)
.L21:
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
	jmp	.L13
.L23:
	xorl	%ebx, %ebx
.L13:
	movq	%rbx, %rax
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.seh_endproc
	.globl	create_string
	.def	create_string;	.scl	2;	.type	32;	.endef
	.seh_proc	create_string
create_string:
	.seh_endprologue
	movl	$1, %r8d
	jmp	create_string_check
	.seh_endproc
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
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	cmpb	$0, initialized(%rip)
	jne	.L30
	cmpq	$0, struct_memory(%rip)
	jne	.L32
	movl	$32, %ecx
	call	malloc
	movq	%rax, struct_memory(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L40
	movl	$1024, %ecx
	call	malloc
	xorl	%edx, %edx
	movq	$1024, (%rbx)
	movq	%rax, 24(%rbx)
	movq	%rdx, 8(%rbx)
	movq	%rdx, 16(%rbx)
	movq	$1024, struct_memory_count(%rip)
.L32:
	cmpq	$0, string_memory(%rip)
	jne	.L34
	movl	$32, %ecx
	call	malloc
	movq	%rax, string_memory(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L35
.L40:
	call	__getreent
	leaq	.LC0(%rip), %rcx
	movq	24(%rax), %rdx
	call	fputs
	movl	$1, %ecx
	movb	$0, initialized(%rip)
	call	exit
.L35:
	movl	$1024, %ecx
	call	malloc
	movq	$1024, (%rbx)
	movq	%rax, 24(%rbx)
	xorl	%eax, %eax
	movq	%rax, 8(%rbx)
	movq	%rax, 16(%rbx)
	movq	$1024, string_memory_count(%rip)
.L34:
	movb	$1, initialized(%rip)
	xorl	%ebx, %ebx
	leaq	keywordStrings(%rip), %rbp
	leaq	keywordList(%rip), %rdi
.L36:
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
	jne	.L36
	xorl	%ebx, %ebx
	leaq	symbolStrings(%rip), %rbp
	leaq	symbolList(%rip), %rdi
.L37:
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
	jne	.L37
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
.L30:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
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
	jne	.L42
	call	init
.L42:
	xorl	%eax, %eax
	leaq	keywordList(%rip), %rdx
.L44:
	cmpq	%rbx, (%rdx,%rax,8)
	je	.L45
	incq	%rax
	cmpq	$22, %rax
	jne	.L44
	xorl	%eax, %eax
	jmp	.L41
.L45:
	movb	$1, %al
.L41:
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
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
.LC4:
	.ascii "\0"
.LC5:
	.ascii "%zu/%zu bytes\0"
.LC6:
	.ascii "Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu\0"
	.text
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
	xorl	%ebp, %ebp
.L49:
	testq	%rax, %rax
	je	.L51
	movq	16(%rax), %rax
	incq	%rbp
	jmp	.L49
.L51:
	leaq	.LC4(%rip), %rbx
	xorl	%r8d, %r8d
	movl	$48, %edx
	movq	%rbx, %rcx
	leaq	.LC5(%rip), %r12
	call	create_string_check
	movq	struct_memory_count(%rip), %r9
	movq	%r12, %rdx
	movq	struct_memory_used(%rip), %r8
	movq	%rax, %rsi
	movq	struct_memory(%rip), %rax
	movq	%rsi, %rcx
	addq	8(%rax), %r8
	call	sprintf
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
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
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	movl	$240, %edx
	call	create_string_check
	movq	%rbp, 40(%rsp)
	movq	%rsi, %r9
	movl	$2, %r8d
	movq	%rax, %rbx
	movq	memoryBlockCount(%rip), %rax
	movq	%rdi, 32(%rsp)
	leaq	.LC6(%rip), %rdx
	movq	%rbx, %rcx
	movq	%rax, 48(%rsp)
	call	sprintf
	movq	%rbx, %rax
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
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
.LC7:
	.ascii "(\0"
.LC8:
	.ascii ")\0"
.LC9:
	.ascii "{\0"
.LC10:
	.ascii "}\0"
.LC11:
	.ascii ",\0"
.LC12:
	.ascii "!\0"
.LC13:
	.ascii ".\0"
.LC14:
	.ascii "[\0"
.LC15:
	.ascii "]\0"
.LC16:
	.ascii ";\0"
.LC17:
	.ascii "_\0"
.LC18:
	.ascii "+\0"
.LC19:
	.ascii "-\0"
.LC20:
	.ascii "*\0"
.LC21:
	.ascii "/\0"
.LC22:
	.ascii "%\0"
.LC23:
	.ascii "<\0"
.LC24:
	.ascii ">\0"
.LC25:
	.ascii "=\0"
.LC26:
	.ascii "==\0"
.LC27:
	.ascii "!=\0"
.LC28:
	.ascii "<=\0"
.LC29:
	.ascii ">=\0"
.LC30:
	.ascii "+=\0"
.LC31:
	.ascii "-=\0"
.LC32:
	.ascii "*=\0"
.LC33:
	.ascii "/=\0"
.LC34:
	.ascii "%=\0"
.LC35:
	.ascii "&&\0"
.LC36:
	.ascii "||\0"
	.align 32
symbolStrings:
	.quad	.LC7
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
	.globl	keywordList
	.bss
	.align 32
keywordList:
	.space 176
	.section .rdata,"dr"
.LC37:
	.ascii "import\0"
.LC38:
	.ascii "from\0"
.LC39:
	.ascii "func\0"
.LC40:
	.ascii "class\0"
.LC41:
	.ascii "method\0"
.LC42:
	.ascii "self\0"
.LC43:
	.ascii "if\0"
.LC44:
	.ascii "elif\0"
.LC45:
	.ascii "else\0"
.LC46:
	.ascii "while\0"
.LC47:
	.ascii "for\0"
.LC48:
	.ascii "true\0"
.LC49:
	.ascii "false\0"
.LC50:
	.ascii "return\0"
.LC51:
	.ascii "break\0"
.LC52:
	.ascii "continue\0"
.LC53:
	.ascii "int\0"
.LC54:
	.ascii "float\0"
.LC55:
	.ascii "string\0"
.LC56:
	.ascii "bool\0"
.LC57:
	.ascii "void\0"
.LC58:
	.ascii "var\0"
	.align 32
keywordStrings:
	.quad	.LC37
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
	.ident	"GCC: (GNU) 13.2.0"
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	__assert_func;	.scl	2;	.type	32;	.endef
	.def	strncmp;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
