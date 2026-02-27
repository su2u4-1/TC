	.file	"lib.c"
	.text
	.section	.rodata
.LC0:
	.string	"import"
.LC1:
	.string	"from"
.LC2:
	.string	"func"
.LC3:
	.string	"class"
.LC4:
	.string	"method"
.LC5:
	.string	"self"
.LC6:
	.string	"if"
.LC7:
	.string	"elif"
.LC8:
	.string	"else"
.LC9:
	.string	"while"
.LC10:
	.string	"for"
.LC11:
	.string	"true"
.LC12:
	.string	"false"
.LC13:
	.string	"return"
.LC14:
	.string	"break"
.LC15:
	.string	"continue"
.LC16:
	.string	"int"
.LC17:
	.string	"float"
.LC18:
	.string	"string"
.LC19:
	.string	"bool"
.LC20:
	.string	"void"
.LC21:
	.string	"var"
	.section	.data.rel.local,"aw"
	.align 32
	.type	keywordStrings, @object
	.size	keywordStrings, 176
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
	.type	keywordList, @object
	.size	keywordList, 176
keywordList:
	.zero	176
	.section	.rodata
.LC22:
	.string	"("
.LC23:
	.string	")"
.LC24:
	.string	"{"
.LC25:
	.string	"}"
.LC26:
	.string	","
.LC27:
	.string	"!"
.LC28:
	.string	"."
.LC29:
	.string	"["
.LC30:
	.string	"]"
.LC31:
	.string	";"
.LC32:
	.string	"_"
.LC33:
	.string	"+"
.LC34:
	.string	"-"
.LC35:
	.string	"*"
.LC36:
	.string	"/"
.LC37:
	.string	"%"
.LC38:
	.string	"<"
.LC39:
	.string	">"
.LC40:
	.string	"="
.LC41:
	.string	"=="
.LC42:
	.string	"!="
.LC43:
	.string	"<="
.LC44:
	.string	">="
.LC45:
	.string	"+="
.LC46:
	.string	"-="
.LC47:
	.string	"*="
.LC48:
	.string	"/="
.LC49:
	.string	"%="
.LC50:
	.string	"&&"
.LC51:
	.string	"||"
	.section	.data.rel.local
	.align 32
	.type	symbolStrings, @object
	.size	symbolStrings, 240
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
	.type	symbolList, @object
	.size	symbolList, 240
symbolList:
	.zero	240
	.globl	struct_memory
	.align 8
	.type	struct_memory, @object
	.size	struct_memory, 8
struct_memory:
	.zero	8
	.globl	string_memory
	.align 8
	.type	string_memory, @object
	.size	string_memory, 8
string_memory:
	.zero	8
	.globl	initialized
	.type	initialized, @object
	.size	initialized, 1
initialized:
	.zero	1
	.globl	all_string_list
	.align 8
	.type	all_string_list, @object
	.size	all_string_list, 8
all_string_list:
	.zero	8
	.globl	IMPORT_KEYWORD
	.align 8
	.type	IMPORT_KEYWORD, @object
	.size	IMPORT_KEYWORD, 8
IMPORT_KEYWORD:
	.zero	8
	.globl	FROM_KEYWORD
	.align 8
	.type	FROM_KEYWORD, @object
	.size	FROM_KEYWORD, 8
FROM_KEYWORD:
	.zero	8
	.globl	FUNC_KEYWORD
	.align 8
	.type	FUNC_KEYWORD, @object
	.size	FUNC_KEYWORD, 8
FUNC_KEYWORD:
	.zero	8
	.globl	CLASS_KEYWORD
	.align 8
	.type	CLASS_KEYWORD, @object
	.size	CLASS_KEYWORD, 8
CLASS_KEYWORD:
	.zero	8
	.globl	METHOD_KEYWORD
	.align 8
	.type	METHOD_KEYWORD, @object
	.size	METHOD_KEYWORD, 8
METHOD_KEYWORD:
	.zero	8
	.globl	SELF_KEYWORD
	.align 8
	.type	SELF_KEYWORD, @object
	.size	SELF_KEYWORD, 8
SELF_KEYWORD:
	.zero	8
	.globl	IF_KEYWORD
	.align 8
	.type	IF_KEYWORD, @object
	.size	IF_KEYWORD, 8
IF_KEYWORD:
	.zero	8
	.globl	ELIF_KEYWORD
	.align 8
	.type	ELIF_KEYWORD, @object
	.size	ELIF_KEYWORD, 8
ELIF_KEYWORD:
	.zero	8
	.globl	ELSE_KEYWORD
	.align 8
	.type	ELSE_KEYWORD, @object
	.size	ELSE_KEYWORD, 8
ELSE_KEYWORD:
	.zero	8
	.globl	WHILE_KEYWORD
	.align 8
	.type	WHILE_KEYWORD, @object
	.size	WHILE_KEYWORD, 8
WHILE_KEYWORD:
	.zero	8
	.globl	FOR_KEYWORD
	.align 8
	.type	FOR_KEYWORD, @object
	.size	FOR_KEYWORD, 8
FOR_KEYWORD:
	.zero	8
	.globl	TRUE_KEYWORD
	.align 8
	.type	TRUE_KEYWORD, @object
	.size	TRUE_KEYWORD, 8
TRUE_KEYWORD:
	.zero	8
	.globl	FALSE_KEYWORD
	.align 8
	.type	FALSE_KEYWORD, @object
	.size	FALSE_KEYWORD, 8
FALSE_KEYWORD:
	.zero	8
	.globl	RETURN_KEYWORD
	.align 8
	.type	RETURN_KEYWORD, @object
	.size	RETURN_KEYWORD, 8
RETURN_KEYWORD:
	.zero	8
	.globl	BREAK_KEYWORD
	.align 8
	.type	BREAK_KEYWORD, @object
	.size	BREAK_KEYWORD, 8
BREAK_KEYWORD:
	.zero	8
	.globl	CONTINUE_KEYWORD
	.align 8
	.type	CONTINUE_KEYWORD, @object
	.size	CONTINUE_KEYWORD, 8
CONTINUE_KEYWORD:
	.zero	8
	.globl	INT_KEYWORD
	.align 8
	.type	INT_KEYWORD, @object
	.size	INT_KEYWORD, 8
INT_KEYWORD:
	.zero	8
	.globl	FLOAT_KEYWORD
	.align 8
	.type	FLOAT_KEYWORD, @object
	.size	FLOAT_KEYWORD, 8
FLOAT_KEYWORD:
	.zero	8
	.globl	STRING_KEYWORD
	.align 8
	.type	STRING_KEYWORD, @object
	.size	STRING_KEYWORD, 8
STRING_KEYWORD:
	.zero	8
	.globl	BOOL_KEYWORD
	.align 8
	.type	BOOL_KEYWORD, @object
	.size	BOOL_KEYWORD, 8
BOOL_KEYWORD:
	.zero	8
	.globl	VOID_KEYWORD
	.align 8
	.type	VOID_KEYWORD, @object
	.size	VOID_KEYWORD, 8
VOID_KEYWORD:
	.zero	8
	.globl	VAR_KEYWORD
	.align 8
	.type	VAR_KEYWORD, @object
	.size	VAR_KEYWORD, 8
VAR_KEYWORD:
	.zero	8
	.globl	L_PAREN_SYMBOL
	.align 8
	.type	L_PAREN_SYMBOL, @object
	.size	L_PAREN_SYMBOL, 8
L_PAREN_SYMBOL:
	.zero	8
	.globl	R_PAREN_SYMBOL
	.align 8
	.type	R_PAREN_SYMBOL, @object
	.size	R_PAREN_SYMBOL, 8
R_PAREN_SYMBOL:
	.zero	8
	.globl	L_BRACE_SYMBOL
	.align 8
	.type	L_BRACE_SYMBOL, @object
	.size	L_BRACE_SYMBOL, 8
L_BRACE_SYMBOL:
	.zero	8
	.globl	R_BRACE_SYMBOL
	.align 8
	.type	R_BRACE_SYMBOL, @object
	.size	R_BRACE_SYMBOL, 8
R_BRACE_SYMBOL:
	.zero	8
	.globl	COMMA_SYMBOL
	.align 8
	.type	COMMA_SYMBOL, @object
	.size	COMMA_SYMBOL, 8
COMMA_SYMBOL:
	.zero	8
	.globl	NOT_SYMBOL
	.align 8
	.type	NOT_SYMBOL, @object
	.size	NOT_SYMBOL, 8
NOT_SYMBOL:
	.zero	8
	.globl	DOT_SYMBOL
	.align 8
	.type	DOT_SYMBOL, @object
	.size	DOT_SYMBOL, 8
DOT_SYMBOL:
	.zero	8
	.globl	L_BRACKET_SYMBOL
	.align 8
	.type	L_BRACKET_SYMBOL, @object
	.size	L_BRACKET_SYMBOL, 8
L_BRACKET_SYMBOL:
	.zero	8
	.globl	R_BRACKET_SYMBOL
	.align 8
	.type	R_BRACKET_SYMBOL, @object
	.size	R_BRACKET_SYMBOL, 8
R_BRACKET_SYMBOL:
	.zero	8
	.globl	SEMICOLON_SYMBOL
	.align 8
	.type	SEMICOLON_SYMBOL, @object
	.size	SEMICOLON_SYMBOL, 8
SEMICOLON_SYMBOL:
	.zero	8
	.globl	UNDERLINE_SYMBOL
	.align 8
	.type	UNDERLINE_SYMBOL, @object
	.size	UNDERLINE_SYMBOL, 8
UNDERLINE_SYMBOL:
	.zero	8
	.globl	ADD_SYMBOL
	.align 8
	.type	ADD_SYMBOL, @object
	.size	ADD_SYMBOL, 8
ADD_SYMBOL:
	.zero	8
	.globl	SUB_SYMBOL
	.align 8
	.type	SUB_SYMBOL, @object
	.size	SUB_SYMBOL, 8
SUB_SYMBOL:
	.zero	8
	.globl	MUL_SYMBOL
	.align 8
	.type	MUL_SYMBOL, @object
	.size	MUL_SYMBOL, 8
MUL_SYMBOL:
	.zero	8
	.globl	DIV_SYMBOL
	.align 8
	.type	DIV_SYMBOL, @object
	.size	DIV_SYMBOL, 8
DIV_SYMBOL:
	.zero	8
	.globl	MOD_SYMBOL
	.align 8
	.type	MOD_SYMBOL, @object
	.size	MOD_SYMBOL, 8
MOD_SYMBOL:
	.zero	8
	.globl	LT_SYMBOL
	.align 8
	.type	LT_SYMBOL, @object
	.size	LT_SYMBOL, 8
LT_SYMBOL:
	.zero	8
	.globl	GT_SYMBOL
	.align 8
	.type	GT_SYMBOL, @object
	.size	GT_SYMBOL, 8
GT_SYMBOL:
	.zero	8
	.globl	ASSIGN_SYMBOL
	.align 8
	.type	ASSIGN_SYMBOL, @object
	.size	ASSIGN_SYMBOL, 8
ASSIGN_SYMBOL:
	.zero	8
	.globl	EQ_SYMBOL
	.align 8
	.type	EQ_SYMBOL, @object
	.size	EQ_SYMBOL, 8
EQ_SYMBOL:
	.zero	8
	.globl	NE_SYMBOL
	.align 8
	.type	NE_SYMBOL, @object
	.size	NE_SYMBOL, 8
NE_SYMBOL:
	.zero	8
	.globl	LE_SYMBOL
	.align 8
	.type	LE_SYMBOL, @object
	.size	LE_SYMBOL, 8
LE_SYMBOL:
	.zero	8
	.globl	GE_SYMBOL
	.align 8
	.type	GE_SYMBOL, @object
	.size	GE_SYMBOL, 8
GE_SYMBOL:
	.zero	8
	.globl	ADD_ASSIGN_SYMBOL
	.align 8
	.type	ADD_ASSIGN_SYMBOL, @object
	.size	ADD_ASSIGN_SYMBOL, 8
ADD_ASSIGN_SYMBOL:
	.zero	8
	.globl	SUB_ASSIGN_SYMBOL
	.align 8
	.type	SUB_ASSIGN_SYMBOL, @object
	.size	SUB_ASSIGN_SYMBOL, 8
SUB_ASSIGN_SYMBOL:
	.zero	8
	.globl	MUL_ASSIGN_SYMBOL
	.align 8
	.type	MUL_ASSIGN_SYMBOL, @object
	.size	MUL_ASSIGN_SYMBOL, 8
MUL_ASSIGN_SYMBOL:
	.zero	8
	.globl	DIV_ASSIGN_SYMBOL
	.align 8
	.type	DIV_ASSIGN_SYMBOL, @object
	.size	DIV_ASSIGN_SYMBOL, 8
DIV_ASSIGN_SYMBOL:
	.zero	8
	.globl	MOD_ASSIGN_SYMBOL
	.align 8
	.type	MOD_ASSIGN_SYMBOL, @object
	.size	MOD_ASSIGN_SYMBOL, 8
MOD_ASSIGN_SYMBOL:
	.zero	8
	.globl	AND_SYMBOL
	.align 8
	.type	AND_SYMBOL, @object
	.size	AND_SYMBOL, 8
AND_SYMBOL:
	.zero	8
	.globl	OR_SYMBOL
	.align 8
	.type	OR_SYMBOL, @object
	.size	OR_SYMBOL, 8
OR_SYMBOL:
	.zero	8
	.globl	name_void
	.align 8
	.type	name_void, @object
	.size	name_void, 8
name_void:
	.zero	8
	.globl	name_int
	.align 8
	.type	name_int, @object
	.size	name_int, 8
name_int:
	.zero	8
	.globl	name_float
	.align 8
	.type	name_float, @object
	.size	name_float, 8
name_float:
	.zero	8
	.globl	name_string
	.align 8
	.type	name_string, @object
	.size	name_string, 8
name_string:
	.zero	8
	.globl	name_bool
	.align 8
	.type	name_bool, @object
	.size	name_bool, 8
name_bool:
	.zero	8
	.globl	builtin_scope
	.align 8
	.type	builtin_scope, @object
	.size	builtin_scope, 8
builtin_scope:
	.zero	8
	.local	struct_memory_used
	.comm	struct_memory_used,8,8
	.local	string_memory_used
	.comm	string_memory_used,8,8
	.local	struct_memory_count
	.comm	struct_memory_count,8,8
	.local	string_memory_count
	.comm	string_memory_count,8,8
	.section	.rodata
	.align 8
.LC52:
	.string	"Fatal: Cannot allocate memory\n"
	.text
	.type	increase_memory_size, @function
increase_memory_size:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, %eax
	movb	%al, -36(%rbp)
	movl	$32, %edi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L2
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$30, %edx
	movl	$1, %esi
	leaq	.LC52(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movq	string_memory(%rip), %rax
	movq	%rax, -24(%rbp)
	jmp	.L3
.L4:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
.L3:
	cmpq	$0, -24(%rbp)
	jne	.L4
	movb	$0, initialized(%rip)
	movl	$1, %edi
	call	exit@PLT
.L2:
	movl	$1024, %edi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, 24(%rax)
	movq	-16(%rbp), %rax
	movq	$1024, (%rax)
	movq	-16(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-16(%rbp), %rax
	movq	$0, 16(%rax)
	cmpb	$0, -36(%rbp)
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
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	increase_memory_size, .-increase_memory_size
	.section	.rodata
	.align 8
.LC53:
	.string	"Info: Allocate big memory block of size %zu bytes\n"
	.text
	.type	alloc_big_memory, @function
alloc_big_memory:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	string_memory_count(%rip), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, string_memory_count(%rip)
	movq	string_memory_used(%rip), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, string_memory_used(%rip)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	stderr(%rip), %rax
	movq	-24(%rbp), %rdx
	leaq	.LC53(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	cmpq	$0, -8(%rbp)
	jne	.L9
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$30, %edx
	movl	$1, %esi
	leaq	.LC52(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$1, %edi
	call	exit@PLT
.L9:
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	alloc_big_memory, .-alloc_big_memory
	.type	create_string_check, @function
create_string_check:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, %eax
	movb	%al, -52(%rbp)
	movzbl	initialized(%rip), %eax
	testb	%al, %al
	jne	.L12
	call	init
.L12:
	cmpq	$0, -40(%rbp)
	je	.L13
	cmpq	$0, -48(%rbp)
	jne	.L14
.L13:
	movl	$0, %eax
	jmp	.L15
.L14:
	cmpb	$0, -52(%rbp)
	je	.L16
	movq	all_string_list(%rip), %rax
	movq	%rax, -32(%rbp)
	movq	$0, -24(%rbp)
	jmp	.L17
.L19:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, -48(%rbp)
	jne	.L18
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L18
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	jne	.L18
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
.L18:
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -32(%rbp)
.L17:
	cmpq	$0, -32(%rbp)
	jne	.L19
	cmpq	$0, -24(%rbp)
	je	.L16
	movq	-24(%rbp), %rax
	jmp	.L15
.L16:
	cmpq	$1022, -48(%rbp)
	jbe	.L20
	movq	-48(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdi
	call	alloc_big_memory
	movq	%rax, -16(%rbp)
	jmp	.L21
.L20:
	movq	string_memory(%rip), %rax
	movq	8(%rax), %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movq	string_memory(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jb	.L22
	movl	$0, %edi
	call	increase_memory_size
.L22:
	movq	string_memory(%rip), %rax
	movq	24(%rax), %rdx
	movq	string_memory(%rip), %rax
	movq	8(%rax), %rax
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	movq	string_memory(%rip), %rax
	movq	8(%rax), %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movq	string_memory(%rip), %rax
	addq	$1, %rdx
	movq	%rdx, 8(%rax)
.L21:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rcx
	movq	-16(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	movq	-16(%rbp), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movl	$24, %edi
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	all_string_list(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movq	%rax, all_string_list(%rip)
	movq	-16(%rbp), %rax
.L15:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	create_string_check, .-create_string_check
	.globl	create_string
	.type	create_string, @function
create_string:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movl	$1, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	create_string_check
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	create_string, .-create_string
	.globl	init
	.type	init, @function
init:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movzbl	initialized(%rip), %eax
	testb	%al, %al
	jne	.L36
	movq	struct_memory(%rip), %rax
	testq	%rax, %rax
	jne	.L28
	movl	$32, %edi
	call	malloc@PLT
	movq	%rax, struct_memory(%rip)
	movq	struct_memory(%rip), %rax
	testq	%rax, %rax
	jne	.L29
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$30, %edx
	movl	$1, %esi
	leaq	.LC52(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movb	$0, initialized(%rip)
	movl	$1, %edi
	call	exit@PLT
.L29:
	movq	struct_memory(%rip), %rbx
	movl	$1024, %edi
	call	malloc@PLT
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
	movl	$32, %edi
	call	malloc@PLT
	movq	%rax, string_memory(%rip)
	movq	string_memory(%rip), %rax
	testq	%rax, %rax
	jne	.L31
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$30, %edx
	movl	$1, %esi
	leaq	.LC52(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movb	$0, initialized(%rip)
	movl	$1, %edi
	call	exit@PLT
.L31:
	movq	string_memory(%rip), %rbx
	movl	$1024, %edi
	call	malloc@PLT
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
	movq	$0, -32(%rbp)
	jmp	.L32
.L33:
	movq	-32(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	keywordStrings(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rcx
	movq	-32(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	keywordStrings(%rip), %rax
	movq	(%rdx,%rax), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	create_string_check
	movq	-32(%rbp), %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	keywordList(%rip), %rdx
	movq	%rax, (%rcx,%rdx)
	addq	$1, -32(%rbp)
.L32:
	cmpq	$21, -32(%rbp)
	jbe	.L33
	movq	$0, -24(%rbp)
	jmp	.L34
.L35:
	movq	-24(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	symbolStrings(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	symbolStrings(%rip), %rax
	movq	(%rdx,%rax), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	create_string_check
	movq	-24(%rbp), %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	symbolList(%rip), %rdx
	movq	%rax, (%rcx,%rdx)
	addq	$1, -24(%rbp)
.L34:
	cmpq	$29, -24(%rbp)
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
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	init, .-init
	.local	memoryBlockCount
	.comm	memoryBlockCount,8,8
	.section	.rodata
.LC54:
	.string	"src/lib.c"
	.align 8
.LC55:
	.string	"struct_memory->used % ALIGN_SIZE == 0"
	.text
	.globl	alloc_memory
	.type	alloc_memory, @function
alloc_memory:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movzbl	initialized(%rip), %eax
	testb	%al, %al
	jne	.L38
	call	init
.L38:
	movq	struct_memory(%rip), %rax
	movq	8(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movq	struct_memory(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jb	.L39
	movl	$1, %edi
	call	increase_memory_size
.L39:
	movq	-24(%rbp), %rax
	addq	$7, %rax
	andq	$-8, %rax
	movq	%rax, -24(%rbp)
	movq	struct_memory(%rip), %rax
	movq	8(%rax), %rax
	andl	$7, %eax
	testq	%rax, %rax
	je	.L40
	leaq	__PRETTY_FUNCTION__.0(%rip), %rax
	movq	%rax, %rcx
	movl	$258, %edx
	leaq	.LC54(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC55(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
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
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rdx, 8(%rax)
	movq	memoryBlockCount(%rip), %rax
	addq	$1, %rax
	movq	%rax, memoryBlockCount(%rip)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	alloc_memory, .-alloc_memory
	.globl	is_keyword
	.type	is_keyword, @function
is_keyword:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
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
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
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
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	is_keyword, .-is_keyword
	.globl	string_equal
	.type	string_equal, @function
string_equal:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	sete	%al
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	string_equal, .-string_equal
	.section	.rodata
.LC56:
	.string	""
.LC57:
	.string	"%zu/%zu bytes"
	.align 8
.LC58:
	.string	"Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu"
	.text
	.globl	get_info
	.type	get_info, @function
get_info:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	$0, -40(%rbp)
	movq	all_string_list(%rip), %rax
	movq	%rax, -32(%rbp)
	jmp	.L51
.L52:
	addq	$1, -40(%rbp)
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -32(%rbp)
.L51:
	cmpq	$0, -32(%rbp)
	jne	.L52
	movl	$0, %edx
	movl	$48, %esi
	leaq	.LC56(%rip), %rax
	movq	%rax, %rdi
	call	create_string_check
	movq	%rax, -24(%rbp)
	movq	struct_memory_count(%rip), %rdx
	movq	struct_memory(%rip), %rax
	movq	8(%rax), %rcx
	movq	struct_memory_used(%rip), %rax
	leaq	(%rcx,%rax), %rsi
	movq	-24(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	leaq	.LC57(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	movl	$0, %edx
	movl	$48, %esi
	leaq	.LC56(%rip), %rax
	movq	%rax, %rdi
	call	create_string_check
	movq	%rax, -16(%rbp)
	movq	string_memory_count(%rip), %rdx
	movq	string_memory(%rip), %rax
	movq	8(%rax), %rcx
	movq	string_memory_used(%rip), %rax
	leaq	(%rcx,%rax), %rsi
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	leaq	.LC57(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	movl	$0, %edx
	movl	$240, %esi
	leaq	.LC56(%rip), %rax
	movq	%rax, %rdi
	call	create_string_check
	movq	%rax, -8(%rbp)
	movq	memoryBlockCount(%rip), %rcx
	movq	-40(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	subq	$8, %rsp
	pushq	%rcx
	movq	%rdi, %r9
	movq	%rsi, %r8
	movq	%rdx, %rcx
	movl	$3, %edx
	leaq	.LC58(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	addq	$16, %rsp
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	get_info, .-get_info
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 13
__PRETTY_FUNCTION__.0:
	.string	"alloc_memory"
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
