	.file	"D:\\TC\\src\\lib.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "import\0"
.LC1:
	.ascii "from\0"
.LC2:
	.ascii "func\0"
.LC3:
	.ascii "class\0"
.LC4:
	.ascii "method\0"
.LC5:
	.ascii "self\0"
.LC6:
	.ascii "if\0"
.LC7:
	.ascii "elif\0"
.LC8:
	.ascii "else\0"
.LC9:
	.ascii "while\0"
.LC10:
	.ascii "for\0"
.LC11:
	.ascii "true\0"
.LC12:
	.ascii "false\0"
.LC13:
	.ascii "return\0"
.LC14:
	.ascii "break\0"
.LC15:
	.ascii "continue\0"
.LC16:
	.ascii "int\0"
.LC17:
	.ascii "float\0"
.LC18:
	.ascii "string\0"
.LC19:
	.ascii "bool\0"
.LC20:
	.ascii "void\0"
.LC21:
	.ascii "var\0"
	.data
	.align 32
keywordStrings:
	.quad	.LC0
	.quad	.LC1
	.quad	.LC2
	.quad	.LC3
	.quad	.LC4
	.quad	.LC5
	.quad	.LC6
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
	.globl	keywordList
	.bss
	.align 32
keywordList:
	.space 176
	.section .rdata,"dr"
.LC22:
	.ascii "(\0"
.LC23:
	.ascii ")\0"
.LC24:
	.ascii "{\0"
.LC25:
	.ascii "}\0"
.LC26:
	.ascii ",\0"
.LC27:
	.ascii "!\0"
.LC28:
	.ascii ".\0"
.LC29:
	.ascii "[\0"
.LC30:
	.ascii "]\0"
.LC31:
	.ascii ";\0"
.LC32:
	.ascii "_\0"
.LC33:
	.ascii "+\0"
.LC34:
	.ascii "-\0"
.LC35:
	.ascii "*\0"
.LC36:
	.ascii "/\0"
.LC37:
	.ascii "%\0"
.LC38:
	.ascii "<\0"
.LC39:
	.ascii ">\0"
.LC40:
	.ascii "=\0"
.LC41:
	.ascii "==\0"
.LC42:
	.ascii "!=\0"
.LC43:
	.ascii "<=\0"
.LC44:
	.ascii ">=\0"
.LC45:
	.ascii "+=\0"
.LC46:
	.ascii "-=\0"
.LC47:
	.ascii "*=\0"
.LC48:
	.ascii "/=\0"
.LC49:
	.ascii "%=\0"
.LC50:
	.ascii "&&\0"
.LC51:
	.ascii "||\0"
	.data
	.align 32
symbolStrings:
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
	.globl	symbolList
	.bss
	.align 32
symbolList:
	.space 240
	.globl	struct_memory
	.align 8
struct_memory:
	.space 8
	.globl	string_memory
	.align 8
string_memory:
	.space 8
	.globl	initialized
initialized:
	.space 1
	.globl	all_string_list
	.align 8
all_string_list:
	.space 8
	.globl	IMPORT_KEYWORD
	.align 8
IMPORT_KEYWORD:
	.space 8
	.globl	FROM_KEYWORD
	.align 8
FROM_KEYWORD:
	.space 8
	.globl	FUNC_KEYWORD
	.align 8
FUNC_KEYWORD:
	.space 8
	.globl	CLASS_KEYWORD
	.align 8
CLASS_KEYWORD:
	.space 8
	.globl	METHOD_KEYWORD
	.align 8
METHOD_KEYWORD:
	.space 8
	.globl	SELF_KEYWORD
	.align 8
SELF_KEYWORD:
	.space 8
	.globl	IF_KEYWORD
	.align 8
IF_KEYWORD:
	.space 8
	.globl	ELIF_KEYWORD
	.align 8
ELIF_KEYWORD:
	.space 8
	.globl	ELSE_KEYWORD
	.align 8
ELSE_KEYWORD:
	.space 8
	.globl	WHILE_KEYWORD
	.align 8
WHILE_KEYWORD:
	.space 8
	.globl	FOR_KEYWORD
	.align 8
FOR_KEYWORD:
	.space 8
	.globl	TRUE_KEYWORD
	.align 8
TRUE_KEYWORD:
	.space 8
	.globl	FALSE_KEYWORD
	.align 8
FALSE_KEYWORD:
	.space 8
	.globl	RETURN_KEYWORD
	.align 8
RETURN_KEYWORD:
	.space 8
	.globl	BREAK_KEYWORD
	.align 8
BREAK_KEYWORD:
	.space 8
	.globl	CONTINUE_KEYWORD
	.align 8
CONTINUE_KEYWORD:
	.space 8
	.globl	INT_KEYWORD
	.align 8
INT_KEYWORD:
	.space 8
	.globl	FLOAT_KEYWORD
	.align 8
FLOAT_KEYWORD:
	.space 8
	.globl	STRING_KEYWORD
	.align 8
STRING_KEYWORD:
	.space 8
	.globl	BOOL_KEYWORD
	.align 8
BOOL_KEYWORD:
	.space 8
	.globl	VOID_KEYWORD
	.align 8
VOID_KEYWORD:
	.space 8
	.globl	VAR_KEYWORD
	.align 8
VAR_KEYWORD:
	.space 8
	.globl	L_PAREN_SYMBOL
	.align 8
L_PAREN_SYMBOL:
	.space 8
	.globl	R_PAREN_SYMBOL
	.align 8
R_PAREN_SYMBOL:
	.space 8
	.globl	L_BRACE_SYMBOL
	.align 8
L_BRACE_SYMBOL:
	.space 8
	.globl	R_BRACE_SYMBOL
	.align 8
R_BRACE_SYMBOL:
	.space 8
	.globl	COMMA_SYMBOL
	.align 8
COMMA_SYMBOL:
	.space 8
	.globl	NOT_SYMBOL
	.align 8
NOT_SYMBOL:
	.space 8
	.globl	DOT_SYMBOL
	.align 8
DOT_SYMBOL:
	.space 8
	.globl	L_BRACKET_SYMBOL
	.align 8
L_BRACKET_SYMBOL:
	.space 8
	.globl	R_BRACKET_SYMBOL
	.align 8
R_BRACKET_SYMBOL:
	.space 8
	.globl	SEMICOLON_SYMBOL
	.align 8
SEMICOLON_SYMBOL:
	.space 8
	.globl	UNDERLINE_SYMBOL
	.align 8
UNDERLINE_SYMBOL:
	.space 8
	.globl	ADD_SYMBOL
	.align 8
ADD_SYMBOL:
	.space 8
	.globl	SUB_SYMBOL
	.align 8
SUB_SYMBOL:
	.space 8
	.globl	MUL_SYMBOL
	.align 8
MUL_SYMBOL:
	.space 8
	.globl	DIV_SYMBOL
	.align 8
DIV_SYMBOL:
	.space 8
	.globl	MOD_SYMBOL
	.align 8
MOD_SYMBOL:
	.space 8
	.globl	LT_SYMBOL
	.align 8
LT_SYMBOL:
	.space 8
	.globl	GT_SYMBOL
	.align 8
GT_SYMBOL:
	.space 8
	.globl	ASSIGN_SYMBOL
	.align 8
ASSIGN_SYMBOL:
	.space 8
	.globl	EQ_SYMBOL
	.align 8
EQ_SYMBOL:
	.space 8
	.globl	NE_SYMBOL
	.align 8
NE_SYMBOL:
	.space 8
	.globl	LE_SYMBOL
	.align 8
LE_SYMBOL:
	.space 8
	.globl	GE_SYMBOL
	.align 8
GE_SYMBOL:
	.space 8
	.globl	ADD_ASSIGN_SYMBOL
	.align 8
ADD_ASSIGN_SYMBOL:
	.space 8
	.globl	SUB_ASSIGN_SYMBOL
	.align 8
SUB_ASSIGN_SYMBOL:
	.space 8
	.globl	MUL_ASSIGN_SYMBOL
	.align 8
MUL_ASSIGN_SYMBOL:
	.space 8
	.globl	DIV_ASSIGN_SYMBOL
	.align 8
DIV_ASSIGN_SYMBOL:
	.space 8
	.globl	MOD_ASSIGN_SYMBOL
	.align 8
MOD_ASSIGN_SYMBOL:
	.space 8
	.globl	AND_SYMBOL
	.align 8
AND_SYMBOL:
	.space 8
	.globl	OR_SYMBOL
	.align 8
OR_SYMBOL:
	.space 8
	.globl	name_void
	.align 8
name_void:
	.space 8
	.globl	name_int
	.align 8
name_int:
	.space 8
	.globl	name_float
	.align 8
name_float:
	.space 8
	.globl	name_string
	.align 8
name_string:
	.space 8
	.globl	name_bool
	.align 8
name_bool:
	.space 8
	.globl	builtin_scope
	.align 8
builtin_scope:
	.space 8
.lcomm struct_memory_used,8,8
.lcomm string_memory_used,8,8
.lcomm struct_memory_count,8,8
.lcomm string_memory_count,8,8
	.section .rdata,"dr"
	.align 8
.LC52:
	.ascii "Fatal: Cannot allocate memory\12\0"
	.text
	.def	increase_memory_size;	.scl	3;	.type	32;	.endef
increase_memory_size:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movl	%ecx, %eax
	movb	%al, 16(%rbp)
	movl	$32, %ecx
	call	malloc
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L2
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$30, %r8d
	movl	$1, %edx
	leaq	.LC52(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	string_memory(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L3
.L4:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	free
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
.L3:
	cmpq	$0, -8(%rbp)
	jne	.L4
	movb	$0, initialized(%rip)
	movl	$1, %ecx
	call	exit
.L2:
	movl	$1024, %ecx
	call	malloc
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, 24(%rax)
	movq	-16(%rbp), %rax
	movq	$1024, (%rax)
	movq	-16(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-16(%rbp), %rax
	movq	$0, 16(%rax)
	cmpb	$0, 16(%rbp)
	je	.L5
	movq	struct_memory(%rip), %rax
	movq	8(%rax), %rdx
	movq	struct_memory_used(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, struct_memory_used(%rip)
	movq	struct_memory(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-16(%rbp), %rax
	movq	%rax, struct_memory(%rip)
	movq	struct_memory_count(%rip), %rax
	addq	$1024, %rax
	movq	%rax, struct_memory_count(%rip)
	jmp	.L7
.L5:
	movq	string_memory(%rip), %rax
	movq	8(%rax), %rdx
	movq	string_memory_used(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, string_memory_used(%rip)
	movq	string_memory(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-16(%rbp), %rax
	movq	%rax, string_memory(%rip)
	movq	string_memory_count(%rip), %rax
	addq	$1024, %rax
	movq	%rax, string_memory_count(%rip)
.L7:
	nop
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC53:
	.ascii "Info: Allocate big memory block of size %zu bytes\12\0"
	.text
	.def	alloc_big_memory;	.scl	3;	.type	32;	.endef
alloc_big_memory:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	string_memory_count(%rip), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, string_memory_count(%rip)
	movq	string_memory_used(%rip), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, string_memory_used(%rip)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	malloc
	movq	%rax, -8(%rbp)
	call	__getreent
	movq	24(%rax), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, %r8
	leaq	.LC53(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	cmpq	$0, -8(%rbp)
	jne	.L9
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$30, %r8d
	movl	$1, %edx
	leaq	.LC52(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$1, %ecx
	call	exit
.L9:
	movq	-8(%rbp), %rax
	leave
	ret
	.def	create_string_check;	.scl	3;	.type	32;	.endef
create_string_check:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, %eax
	movb	%al, 32(%rbp)
	movzbl	initialized(%rip), %eax
	testb	%al, %al
	jne	.L12
	call	init
.L12:
	cmpq	$0, 16(%rbp)
	je	.L13
	cmpq	$0, 24(%rbp)
	jne	.L14
.L13:
	movl	$0, %eax
	jmp	.L15
.L14:
	cmpb	$0, 32(%rbp)
	je	.L16
	movq	all_string_list(%rip), %rax
	movq	%rax, -8(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L17
.L19:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, 24(%rbp)
	jne	.L18
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L18
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rcx
	movq	16(%rbp), %rdx
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncmp
	testl	%eax, %eax
	jne	.L18
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
.L18:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
.L17:
	cmpq	$0, -8(%rbp)
	jne	.L19
	cmpq	$0, -16(%rbp)
	je	.L16
	movq	-16(%rbp), %rax
	jmp	.L15
.L16:
	cmpq	$1022, 24(%rbp)
	jbe	.L20
	movq	24(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rcx
	call	alloc_big_memory
	movq	%rax, -24(%rbp)
	jmp	.L21
.L20:
	movq	string_memory(%rip), %rax
	movq	8(%rax), %rdx
	movq	24(%rbp), %rax
	addq	%rax, %rdx
	movq	string_memory(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jb	.L22
	movl	$0, %ecx
	call	increase_memory_size
.L22:
	movq	string_memory(%rip), %rax
	movq	24(%rax), %rdx
	movq	string_memory(%rip), %rax
	movq	8(%rax), %rax
	addq	%rdx, %rax
	movq	%rax, -24(%rbp)
	movq	string_memory(%rip), %rax
	movq	8(%rax), %rdx
	movq	24(%rbp), %rax
	addq	%rax, %rdx
	movq	string_memory(%rip), %rax
	addq	$1, %rdx
	movq	%rdx, 8(%rax)
.L21:
	movq	24(%rbp), %rcx
	movq	16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	movq	-24(%rbp), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-32(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	all_string_list(%rip), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-32(%rbp), %rax
	movq	%rax, all_string_list(%rip)
	movq	-24(%rbp), %rax
.L15:
	leave
	ret
	.globl	create_string
	.def	create_string;	.scl	2;	.type	32;	.endef
create_string:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	create_string_check
	leave
	ret
	.globl	init
	.def	init;	.scl	2;	.type	32;	.endef
init:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$56, %rsp
	movzbl	initialized(%rip), %eax
	testb	%al, %al
	jne	.L36
	movq	struct_memory(%rip), %rax
	testq	%rax, %rax
	jne	.L28
	movl	$32, %ecx
	call	malloc
	movq	%rax, struct_memory(%rip)
	movq	struct_memory(%rip), %rax
	testq	%rax, %rax
	jne	.L29
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$30, %r8d
	movl	$1, %edx
	leaq	.LC52(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movb	$0, initialized(%rip)
	movl	$1, %ecx
	call	exit
.L29:
	movq	struct_memory(%rip), %rbx
	movl	$1024, %ecx
	call	malloc
	movq	%rax, 24(%rbx)
	movq	struct_memory(%rip), %rax
	movq	$1024, (%rax)
	movq	struct_memory(%rip), %rax
	movq	$0, 8(%rax)
	movq	struct_memory(%rip), %rax
	movq	$0, 16(%rax)
	movq	$1024, struct_memory_count(%rip)
.L28:
	movq	string_memory(%rip), %rax
	testq	%rax, %rax
	jne	.L30
	movl	$32, %ecx
	call	malloc
	movq	%rax, string_memory(%rip)
	movq	string_memory(%rip), %rax
	testq	%rax, %rax
	jne	.L31
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$30, %r8d
	movl	$1, %edx
	leaq	.LC52(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movb	$0, initialized(%rip)
	movl	$1, %ecx
	call	exit
.L31:
	movq	string_memory(%rip), %rbx
	movl	$1024, %ecx
	call	malloc
	movq	%rax, 24(%rbx)
	movq	string_memory(%rip), %rax
	movq	$1024, (%rax)
	movq	string_memory(%rip), %rax
	movq	$0, 8(%rax)
	movq	string_memory(%rip), %rax
	movq	$0, 16(%rax)
	movq	$1024, string_memory_count(%rip)
.L30:
	movb	$1, initialized(%rip)
	movq	$0, -24(%rbp)
	jmp	.L32
.L33:
	movq	-24(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	keywordStrings(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	leaq	keywordStrings(%rip), %rax
	movq	(%rcx,%rax), %rax
	movl	$0, %r8d
	movq	%rax, %rcx
	call	create_string_check
	movq	-24(%rbp), %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	keywordList(%rip), %rdx
	movq	%rax, (%rcx,%rdx)
	addq	$1, -24(%rbp)
.L32:
	cmpq	$21, -24(%rbp)
	jbe	.L33
	movq	$0, -32(%rbp)
	jmp	.L34
.L35:
	movq	-32(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	symbolStrings(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	leaq	symbolStrings(%rip), %rax
	movq	(%rcx,%rax), %rax
	movl	$0, %r8d
	movq	%rax, %rcx
	call	create_string_check
	movq	-32(%rbp), %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	symbolList(%rip), %rdx
	movq	%rax, (%rcx,%rdx)
	addq	$1, -32(%rbp)
.L34:
	cmpq	$29, -32(%rbp)
	jbe	.L35
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
	jmp	.L25
.L36:
	nop
.L25:
	movq	-8(%rbp), %rbx
	leave
	ret
.lcomm memoryBlockCount,8,8
	.section .rdata,"dr"
	.align 8
.LC54:
	.ascii "struct_memory->used % ALIGN_SIZE == 0\0"
.LC55:
	.ascii "D:\\TC\\src\\lib.c\0"
	.text
	.globl	alloc_memory
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
alloc_memory:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movzbl	initialized(%rip), %eax
	testb	%al, %al
	jne	.L38
	call	init
.L38:
	movq	struct_memory(%rip), %rax
	movq	8(%rax), %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movq	struct_memory(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jb	.L39
	movl	$1, %ecx
	call	increase_memory_size
.L39:
	movq	16(%rbp), %rax
	addq	$7, %rax
	andq	$-8, %rax
	movq	%rax, 16(%rbp)
	movq	struct_memory(%rip), %rax
	movq	8(%rax), %rax
	andl	$7, %eax
	testq	%rax, %rax
	je	.L40
	leaq	.LC54(%rip), %r9
	leaq	__func__.0(%rip), %r8
	movl	$258, %edx
	leaq	.LC55(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L40:
	movq	struct_memory(%rip), %rax
	movq	24(%rax), %rdx
	movq	struct_memory(%rip), %rax
	movq	8(%rax), %rax
	andq	$-8, %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movq	struct_memory(%rip), %rax
	movq	8(%rax), %rcx
	movq	struct_memory(%rip), %rax
	movq	16(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rdx, 8(%rax)
	movq	memoryBlockCount(%rip), %rax
	addq	$1, %rax
	movq	%rax, memoryBlockCount(%rip)
	movq	-8(%rbp), %rax
	leave
	ret
	.globl	is_keyword
	.def	is_keyword;	.scl	2;	.type	32;	.endef
is_keyword:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movzbl	initialized(%rip), %eax
	testb	%al, %al
	jne	.L43
	call	init
.L43:
	movq	$0, -8(%rbp)
	jmp	.L44
.L47:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	keywordList(%rip), %rax
	movq	(%rdx,%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L45
	movl	$1, %eax
	jmp	.L46
.L45:
	addq	$1, -8(%rbp)
.L44:
	cmpq	$21, -8(%rbp)
	jbe	.L47
	movl	$0, %eax
.L46:
	leave
	ret
	.globl	string_equal
	.def	string_equal;	.scl	2;	.type	32;	.endef
string_equal:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	cmpq	24(%rbp), %rax
	sete	%al
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC56:
	.ascii "\0"
.LC57:
	.ascii "%zu/%zu bytes\0"
	.align 8
.LC58:
	.ascii "Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu\0"
	.text
	.globl	get_info
	.def	get_info;	.scl	2;	.type	32;	.endef
get_info:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$112, %rsp
	movq	$0, -8(%rbp)
	movq	all_string_list(%rip), %rax
	movq	%rax, -16(%rbp)
	jmp	.L51
.L52:
	addq	$1, -8(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -16(%rbp)
.L51:
	cmpq	$0, -16(%rbp)
	jne	.L52
	movl	$0, %r8d
	movl	$48, %edx
	leaq	.LC56(%rip), %rax
	movq	%rax, %rcx
	call	create_string_check
	movq	%rax, -24(%rbp)
	movq	struct_memory_count(%rip), %rcx
	movq	struct_memory(%rip), %rax
	movq	8(%rax), %rdx
	movq	struct_memory_used(%rip), %rax
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC57(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movl	$0, %r8d
	movl	$48, %edx
	leaq	.LC56(%rip), %rax
	movq	%rax, %rcx
	call	create_string_check
	movq	%rax, -32(%rbp)
	movq	string_memory_count(%rip), %rcx
	movq	string_memory(%rip), %rax
	movq	8(%rax), %rdx
	movq	string_memory_used(%rip), %rax
	addq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC57(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movl	$0, %r8d
	movl	$240, %edx
	leaq	.LC56(%rip), %rax
	movq	%rax, %rcx
	call	create_string_check
	movq	%rax, -40(%rbp)
	movq	memoryBlockCount(%rip), %rdx
	movq	-24(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rdx, 48(%rsp)
	movq	-8(%rbp), %rdx
	movq	%rdx, 40(%rsp)
	movq	-32(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movq	%rcx, %r9
	movl	$2, %r8d
	leaq	.LC58(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movq	-40(%rbp), %rax
	leave
	ret
	.section .rdata,"dr"
	.align 8
__func__.0:
	.ascii "alloc_memory\0"
	.ident	"GCC: (GNU) 13.2.0"
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	strncmp;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	__assert_func;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
