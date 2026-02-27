	.file	"lib.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Fatal: Cannot allocate memory\n"
	.text
	.type	increase_memory_size, @function
increase_memory_size:
	pushq	%rbp
	movl	%edi, %ebp
	movl	$32, %edi
	pushq	%rbx
	pushq	%rcx
	call	*malloc@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L2
	movq	stderr(%rip), %rsi
	leaq	.LC0(%rip), %rdi
	call	*fputs@GOTPCREL(%rip)
	movq	string_memory(%rip), %rbx
.L3:
	testq	%rbx, %rbx
	je	.L9
	movq	16(%rbx), %rbp
	movq	24(%rbx), %rdi
	call	*free@GOTPCREL(%rip)
	movq	%rbx, %rdi
	call	*free@GOTPCREL(%rip)
	movq	%rbp, %rbx
	jmp	.L3
.L9:
	movb	$0, initialized(%rip)
	movl	$1, %edi
	call	*exit@GOTPCREL(%rip)
.L2:
	movq	%rax, %rbx
	movl	$1024, %edi
	call	*malloc@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	$1024, (%rbx)
	movq	%rax, 24(%rbx)
	movq	%rdx, 8(%rbx)
	movq	%rdx, 16(%rbx)
	testb	%bpl, %bpl
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
	popq	%rax
	popq	%rbx
	popq	%rbp
	ret
	.size	increase_memory_size, .-increase_memory_size
	.section	.rodata.str1.1
.LC1:
	.string	"src/lib.c"
.LC2:
	.string	"struct_memory->used % ALIGN_SIZE == 0"
	.text
	.globl	alloc_memory
	.type	alloc_memory, @function
alloc_memory:
	cmpb	$0, initialized(%rip)
	pushq	%rbx
	movq	%rdi, %rbx
	jne	.L11
	call	init
.L11:
	movq	struct_memory(%rip), %rax
	movq	8(%rax), %rdx
	addq	%rbx, %rdx
	cmpq	(%rax), %rdx
	jb	.L12
	movl	$1, %edi
	call	increase_memory_size
.L12:
	movq	struct_memory(%rip), %rcx
	addq	$7, %rbx
	andq	$-8, %rbx
	movq	8(%rcx), %rdx
	testb	$7, %dl
	je	.L13
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$258, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	*__assert_fail@GOTPCREL(%rip)
.L13:
	movq	%rdx, %rax
	addq	%rbx, %rdx
	incq	memoryBlockCount(%rip)
	movq	%rdx, 8(%rcx)
	andq	$-8, %rax
	popq	%rbx
	addq	24(%rcx), %rax
	ret
	.size	alloc_memory, .-alloc_memory
	.section	.rodata.str1.1
.LC3:
	.string	"Info: Allocate big memory block of size %zu bytes\n"
	.text
	.type	create_string_check, @function
create_string_check:
	cmpb	$0, initialized(%rip)
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movl	%edx, %ebx
	jne	.L16
	call	init
.L16:
	testq	%r12, %r12
	je	.L25
	testq	%rbp, %rbp
	je	.L25
	testb	%bl, %bl
	je	.L18
	movq	all_string_list(%rip), %r13
	xorl	%ebx, %ebx
.L19:
	testq	%r13, %r13
	je	.L31
	cmpq	%rbp, 8(%r13)
	jne	.L20
	movq	0(%r13), %r14
	testq	%r14, %r14
	je	.L20
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%r14, %rdi
	call	*strncmp@GOTPCREL(%rip)
	testl	%eax, %eax
	cmove	%r14, %rbx
.L20:
	movq	16(%r13), %r13
	jmp	.L19
.L31:
	testq	%rbx, %rbx
	jne	.L15
.L18:
	cmpq	$1022, %rbp
	jbe	.L22
	leaq	1(%rbp), %r13
	addq	%r13, string_memory_count(%rip)
	addq	%r13, string_memory_used(%rip)
	movq	%r13, %rdi
	call	*malloc@GOTPCREL(%rip)
	movq	stderr(%rip), %rdi
	movq	%r13, %rcx
	leaq	.LC3(%rip), %rdx
	movq	%rax, %rbx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	testq	%rbx, %rbx
	jne	.L23
	leaq	.LC0(%rip), %rdi
	movq	stderr(%rip), %rsi
	call	*fputs@GOTPCREL(%rip)
	movl	$1, %edi
	call	*exit@GOTPCREL(%rip)
.L22:
	movq	string_memory(%rip), %rax
	movq	8(%rax), %rdx
	addq	%rbp, %rdx
	cmpq	(%rax), %rdx
	jb	.L24
	xorl	%edi, %edi
	call	increase_memory_size
.L24:
	movq	string_memory(%rip), %rax
	movq	8(%rax), %rdx
	movq	24(%rax), %rbx
	addq	%rdx, %rbx
	leaq	1(%rdx,%rbp), %rdx
	movq	%rdx, 8(%rax)
.L23:
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*strncpy@GOTPCREL(%rip)
	movb	$0, (%rbx,%rbp)
	movl	$24, %edi
	call	alloc_memory
	movq	all_string_list(%rip), %rdx
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
	movq	%rdx, 16(%rax)
	movq	%rax, all_string_list(%rip)
	jmp	.L15
.L25:
	xorl	%ebx, %ebx
.L15:
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	create_string_check, .-create_string_check
	.globl	create_string
	.type	create_string, @function
create_string:
	movl	$1, %edx
	jmp	create_string_check
	.size	create_string, .-create_string
	.globl	init
	.type	init, @function
init:
	cmpb	$0, initialized(%rip)
	jne	.L44
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	pushq	%rsi
	cmpq	$0, struct_memory(%rip)
	jne	.L35
	movl	$32, %edi
	call	*malloc@GOTPCREL(%rip)
	movq	%rax, struct_memory(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L36
	leaq	.LC0(%rip), %rdi
	movq	stderr(%rip), %rsi
	call	*fputs@GOTPCREL(%rip)
	movb	$0, initialized(%rip)
	movl	$1, %edi
	call	*exit@GOTPCREL(%rip)
.L36:
	movl	$1024, %edi
	call	*malloc@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	movq	$1024, (%rbx)
	movq	%rax, 24(%rbx)
	movq	%rcx, 8(%rbx)
	movq	%rcx, 16(%rbx)
	movq	$1024, struct_memory_count(%rip)
.L35:
	cmpq	$0, string_memory(%rip)
	jne	.L37
	movl	$32, %edi
	call	*malloc@GOTPCREL(%rip)
	movq	%rax, string_memory(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L38
	leaq	.LC0(%rip), %rdi
	movq	stderr(%rip), %rsi
	call	*fputs@GOTPCREL(%rip)
	movb	$0, initialized(%rip)
	movl	$1, %edi
	call	*exit@GOTPCREL(%rip)
.L38:
	movl	$1024, %edi
	call	*malloc@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	$1024, (%rbx)
	movq	%rax, 24(%rbx)
	movq	%rdx, 8(%rbx)
	movq	%rdx, 16(%rbx)
	movq	$1024, string_memory_count(%rip)
.L37:
	movb	$1, initialized(%rip)
	leaq	keywordStrings(%rip), %rbx
	leaq	keywordList(%rip), %rbp
	leaq	176(%rbx), %r13
.L39:
	movq	(%rbx), %r12
	addq	$8, %rbx
	addq	$8, %rbp
	movq	%r12, %rdi
	call	*strlen@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	create_string_check
	movq	%rax, -8(%rbp)
	cmpq	%r13, %rbx
	jne	.L39
	leaq	symbolStrings(%rip), %rbx
	leaq	symbolList(%rip), %rbp
	leaq	240(%rbx), %r13
.L40:
	movq	(%rbx), %r12
	addq	$8, %rbx
	addq	$8, %rbp
	movq	%r12, %rdi
	call	*strlen@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	create_string_check
	movq	%rax, -8(%rbp)
	cmpq	%r13, %rbx
	jne	.L40
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
	popq	%rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L44:
	ret
	.size	init, .-init
	.globl	is_keyword
	.type	is_keyword, @function
is_keyword:
	cmpb	$0, initialized(%rip)
	pushq	%rbx
	movq	%rdi, %rbx
	jne	.L48
	call	init
.L48:
	xorl	%eax, %eax
	leaq	keywordList(%rip), %rdx
.L50:
	cmpq	%rbx, (%rdx,%rax,8)
	je	.L51
	incq	%rax
	cmpq	$22, %rax
	jne	.L50
	xorl	%eax, %eax
	jmp	.L47
.L51:
	movb	$1, %al
.L47:
	popq	%rbx
	ret
	.size	is_keyword, .-is_keyword
	.globl	string_equal
	.type	string_equal, @function
string_equal:
	cmpq	%rdi, %rsi
	sete	%al
	ret
	.size	string_equal, .-string_equal
	.section	.rodata.str1.1
.LC4:
	.string	""
.LC5:
	.string	"%zu/%zu bytes"
.LC6:
	.string	"Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu"
	.text
	.globl	get_info
	.type	get_info, @function
get_info:
	pushq	%r14
	movq	all_string_list(%rip), %rax
	pushq	%r13
	xorl	%r13d, %r13d
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
.L56:
	testq	%rax, %rax
	je	.L59
	movq	16(%rax), %rax
	incq	%r13
	jmp	.L56
.L59:
	leaq	.LC4(%rip), %rbx
	xorl	%edx, %edx
	movl	$48, %esi
	movq	%rbx, %rdi
	leaq	.LC5(%rip), %r14
	call	create_string_check
	movq	%r14, %rcx
	movq	struct_memory_count(%rip), %r9
	movq	struct_memory_used(%rip), %r8
	movq	%rax, %rbp
	movq	struct_memory(%rip), %rax
	orq	$-1, %rdx
	movl	$2, %esi
	movq	%rbp, %rdi
	addq	8(%rax), %r8
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	%rbx, %rdi
	xorl	%edx, %edx
	movl	$48, %esi
	call	create_string_check
	movq	%r14, %rcx
	movq	string_memory_count(%rip), %r9
	movq	string_memory_used(%rip), %r8
	movq	%rax, %r12
	movq	string_memory(%rip), %rax
	orq	$-1, %rdx
	movl	$2, %esi
	movq	%r12, %rdi
	addq	8(%rax), %r8
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	%rbx, %rdi
	xorl	%edx, %edx
	movl	$240, %esi
	call	create_string_check
	movq	%rbp, %r9
	movl	$3, %r8d
	leaq	.LC6(%rip), %rcx
	movq	%rax, %rbx
	pushq	%rax
	orq	$-1, %rdx
	movl	$2, %esi
	pushq	memoryBlockCount(%rip)
	movq	%rbx, %rdi
	xorl	%eax, %eax
	pushq	%r13
	pushq	%r12
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	get_info, .-get_info
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
.LC7:
	.string	"("
.LC8:
	.string	")"
.LC9:
	.string	"{"
.LC10:
	.string	"}"
.LC11:
	.string	","
.LC12:
	.string	"!"
.LC13:
	.string	"."
.LC14:
	.string	"["
.LC15:
	.string	"]"
.LC16:
	.string	";"
.LC17:
	.string	"_"
.LC18:
	.string	"+"
.LC19:
	.string	"-"
.LC20:
	.string	"*"
.LC21:
	.string	"/"
.LC22:
	.string	"%"
.LC23:
	.string	"<"
.LC24:
	.string	">"
.LC25:
	.string	"="
.LC26:
	.string	"=="
.LC27:
	.string	"!="
.LC28:
	.string	"<="
.LC29:
	.string	">="
.LC30:
	.string	"+="
.LC31:
	.string	"-="
.LC32:
	.string	"*="
.LC33:
	.string	"/="
.LC34:
	.string	"%="
.LC35:
	.string	"&&"
.LC36:
	.string	"||"
	.section	.data.rel.ro.local,"aw"
	.align 32
	.type	symbolStrings, @object
	.size	symbolStrings, 240
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
	.type	keywordList, @object
	.size	keywordList, 176
keywordList:
	.zero	176
	.section	.rodata.str1.1
.LC37:
	.string	"import"
.LC38:
	.string	"from"
.LC39:
	.string	"func"
.LC40:
	.string	"class"
.LC41:
	.string	"method"
.LC42:
	.string	"self"
.LC43:
	.string	"if"
.LC44:
	.string	"elif"
.LC45:
	.string	"else"
.LC46:
	.string	"while"
.LC47:
	.string	"for"
.LC48:
	.string	"true"
.LC49:
	.string	"false"
.LC50:
	.string	"return"
.LC51:
	.string	"break"
.LC52:
	.string	"continue"
.LC53:
	.string	"int"
.LC54:
	.string	"float"
.LC55:
	.string	"string"
.LC56:
	.string	"bool"
.LC57:
	.string	"void"
.LC58:
	.string	"var"
	.section	.data.rel.ro.local
	.align 32
	.type	keywordStrings, @object
	.size	keywordStrings, 176
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
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
