	.file	"lib.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O0 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
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
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	;,
	movl	%edi, %eax	; for_struct, tmp99
	movb	%al, -36(%rbp)	; tmp100, for_struct
; src/lib.c:79:     MemoryBlock* new_block = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movl	$32, %edi	;,
	call	malloc@PLT	;
	movq	%rax, -16(%rbp)	; tmp101, new_block
; src/lib.c:80:     if (new_block == NULL) {
	cmpq	$0, -16(%rbp)	;, new_block
	jne	.L2	;,
; src/lib.c:81:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movq	stderr(%rip), %rax	; stderr, stderr.0_1
	movq	%rax, %rcx	; stderr.0_1,
	movl	$30, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC52(%rip), %rax	;, tmp102
	movq	%rax, %rdi	; tmp102,
	call	fwrite@PLT	;
; src/lib.c:82:         MemoryBlock* current = string_memory;
	movq	string_memory(%rip), %rax	; string_memory, tmp103
	movq	%rax, -24(%rbp)	; tmp103, current
; src/lib.c:83:         while (current != NULL) {
	jmp	.L3	;
.L4:
; src/lib.c:84:             MemoryBlock* next = current->next;
	movq	-24(%rbp), %rax	; current, tmp104
	movq	16(%rax), %rax	; current_18->next, tmp105
	movq	%rax, -8(%rbp)	; tmp105, next
; src/lib.c:85:             free(current->block);
	movq	-24(%rbp), %rax	; current, tmp106
	movq	24(%rax), %rax	; current_18->block, _2
; src/lib.c:85:             free(current->block);
	movq	%rax, %rdi	; _2,
	call	free@PLT	;
; src/lib.c:86:             free(current);
	movq	-24(%rbp), %rax	; current, tmp107
	movq	%rax, %rdi	; tmp107,
	call	free@PLT	;
; src/lib.c:87:             current = next;
	movq	-8(%rbp), %rax	; next, tmp108
	movq	%rax, -24(%rbp)	; tmp108, current
.L3:
; src/lib.c:83:         while (current != NULL) {
	cmpq	$0, -24(%rbp)	;, current
	jne	.L4	;,
; src/lib.c:89:         initialized = false;
	movb	$0, initialized(%rip)	;, initialized
; src/lib.c:90:         exit(1);
	movl	$1, %edi	;,
	call	exit@PLT	;
.L2:
; src/lib.c:92:     new_block->block = (pointer)malloc(defaultMemorySize);
	movl	$1024, %edi	;,
	call	malloc@PLT	;
	movq	%rax, %rdx	; tmp109, _3
; src/lib.c:92:     new_block->block = (pointer)malloc(defaultMemorySize);
	movq	-16(%rbp), %rax	; new_block, tmp110
	movq	%rdx, 24(%rax)	; _3, new_block_23->block
; src/lib.c:93:     new_block->size = defaultMemorySize;
	movq	-16(%rbp), %rax	; new_block, tmp111
	movq	$1024, (%rax)	;, new_block_23->size
; src/lib.c:94:     new_block->used = 0;
	movq	-16(%rbp), %rax	; new_block, tmp112
	movq	$0, 8(%rax)	;, new_block_23->used
; src/lib.c:95:     new_block->next = NULL;
	movq	-16(%rbp), %rax	; new_block, tmp113
	movq	$0, 16(%rax)	;, new_block_23->next
; src/lib.c:96:     if (for_struct) {
	cmpb	$0, -36(%rbp)	;, for_struct
	je	.L5	;,
; src/lib.c:97:         struct_memory_used += struct_memory->used;
	movq	struct_memory(%rip), %rax	; struct_memory, struct_memory.1_4
	movq	8(%rax), %rdx	; struct_memory.1_4->used, _5
; src/lib.c:97:         struct_memory_used += struct_memory->used;
	movq	struct_memory_used(%rip), %rax	; struct_memory_used, struct_memory_used.2_6
	addq	%rdx, %rax	; _5, _7
	movq	%rax, struct_memory_used(%rip)	; _7, struct_memory_used
; src/lib.c:98:         new_block->next = struct_memory;
	movq	struct_memory(%rip), %rdx	; struct_memory, struct_memory.3_8
	movq	-16(%rbp), %rax	; new_block, tmp114
	movq	%rdx, 16(%rax)	; struct_memory.3_8, new_block_23->next
; src/lib.c:99:         struct_memory = new_block;
	movq	-16(%rbp), %rax	; new_block, tmp115
	movq	%rax, struct_memory(%rip)	; tmp115, struct_memory
; src/lib.c:100:         struct_memory_count += defaultMemorySize;
	movq	struct_memory_count(%rip), %rax	; struct_memory_count, struct_memory_count.4_9
	addq	$1024, %rax	;, _10
	movq	%rax, struct_memory_count(%rip)	; _10, struct_memory_count
; src/lib.c:113: }
	jmp	.L7	;
.L5:
; src/lib.c:105:         string_memory_used += string_memory->used;
	movq	string_memory(%rip), %rax	; string_memory, string_memory.5_11
	movq	8(%rax), %rdx	; string_memory.5_11->used, _12
; src/lib.c:105:         string_memory_used += string_memory->used;
	movq	string_memory_used(%rip), %rax	; string_memory_used, string_memory_used.6_13
	addq	%rdx, %rax	; _12, _14
	movq	%rax, string_memory_used(%rip)	; _14, string_memory_used
; src/lib.c:106:         new_block->next = string_memory;
	movq	string_memory(%rip), %rdx	; string_memory, string_memory.7_15
	movq	-16(%rbp), %rax	; new_block, tmp116
	movq	%rdx, 16(%rax)	; string_memory.7_15, new_block_23->next
; src/lib.c:107:         string_memory = new_block;
	movq	-16(%rbp), %rax	; new_block, tmp117
	movq	%rax, string_memory(%rip)	; tmp117, string_memory
; src/lib.c:108:         string_memory_count += defaultMemorySize;
	movq	string_memory_count(%rip), %rax	; string_memory_count, string_memory_count.8_16
	addq	$1024, %rax	;, _17
	movq	%rax, string_memory_count(%rip)	; _17, string_memory_count
.L7:
; src/lib.c:113: }
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
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; size, size
; src/lib.c:116:     string_memory_count += size;
	movq	string_memory_count(%rip), %rdx	; string_memory_count, string_memory_count.9_1
	movq	-24(%rbp), %rax	; size, tmp90
	addq	%rdx, %rax	; string_memory_count.9_1, _2
	movq	%rax, string_memory_count(%rip)	; _2, string_memory_count
; src/lib.c:117:     string_memory_used += size;
	movq	string_memory_used(%rip), %rdx	; string_memory_used, string_memory_used.10_3
	movq	-24(%rbp), %rax	; size, tmp91
	addq	%rdx, %rax	; string_memory_used.10_3, _4
	movq	%rax, string_memory_used(%rip)	; _4, string_memory_used
; src/lib.c:118:     char* block = (char*)malloc(size);
	movq	-24(%rbp), %rax	; size, tmp92
	movq	%rax, %rdi	; tmp92,
	call	malloc@PLT	;
	movq	%rax, -8(%rbp)	; tmp93, block
; src/lib.c:119:     fprintf(stderr, "Info: Allocate big memory block of size %zu bytes\n", size);
	movq	stderr(%rip), %rax	; stderr, stderr.11_5
	movq	-24(%rbp), %rdx	; size, tmp94
	leaq	.LC53(%rip), %rcx	;, tmp95
	movq	%rcx, %rsi	; tmp95,
	movq	%rax, %rdi	; stderr.11_5,
	movl	$0, %eax	;,
	call	fprintf@PLT	;
; src/lib.c:120:     if (block == NULL) {
	cmpq	$0, -8(%rbp)	;, block
	jne	.L9	;,
; src/lib.c:121:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movq	stderr(%rip), %rax	; stderr, stderr.12_6
	movq	%rax, %rcx	; stderr.12_6,
	movl	$30, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC52(%rip), %rax	;, tmp96
	movq	%rax, %rdi	; tmp96,
	call	fwrite@PLT	;
; src/lib.c:122:         exit(1);
	movl	$1, %edi	;,
	call	exit@PLT	;
.L9:
; src/lib.c:124:     return block;
	movq	-8(%rbp), %rax	; block, _14
; src/lib.c:125: }
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
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$64, %rsp	;,
	movq	%rdi, -40(%rbp)	; data, data
	movq	%rsi, -48(%rbp)	; length, length
	movl	%edx, %eax	; check, tmp106
	movb	%al, -52(%rbp)	; tmp107, check
; src/lib.c:128:     if (!initialized) init();
	movzbl	initialized(%rip), %eax	; initialized, initialized.13_1
; src/lib.c:128:     if (!initialized) init();
	testb	%al, %al	; initialized.13_1
	jne	.L12	;,
; src/lib.c:128:     if (!initialized) init();
	call	init	;
.L12:
; src/lib.c:129:     if (data == NULL || length == 0) return 0;
	cmpq	$0, -40(%rbp)	;, data
	je	.L13	;,
; src/lib.c:129:     if (data == NULL || length == 0) return 0;
	cmpq	$0, -48(%rbp)	;, length
	jne	.L14	;,
.L13:
; src/lib.c:129:     if (data == NULL || length == 0) return 0;
	movl	$0, %eax	;, _27
; src/lib.c:129:     if (data == NULL || length == 0) return 0;
	jmp	.L15	;
.L14:
; src/lib.c:130:     if (check) {
	cmpb	$0, -52(%rbp)	;, check
	je	.L16	;,
; src/lib.c:131:         StringList* current = all_string_list;
	movq	all_string_list(%rip), %rax	; all_string_list, tmp108
	movq	%rax, -32(%rbp)	; tmp108, current
; src/lib.c:132:         string existing = NULL;
	movq	$0, -24(%rbp)	;, existing
; src/lib.c:133:         while (current != NULL) {
	jmp	.L17	;
.L19:
; src/lib.c:134:             if (current->length == length && current->str != 0 && strncmp(current->str, data, length) == 0)
	movq	-32(%rbp), %rax	; current, tmp109
	movq	8(%rax), %rax	; current_23->length, _2
; src/lib.c:134:             if (current->length == length && current->str != 0 && strncmp(current->str, data, length) == 0)
	cmpq	%rax, -48(%rbp)	; _2, length
	jne	.L18	;,
; src/lib.c:134:             if (current->length == length && current->str != 0 && strncmp(current->str, data, length) == 0)
	movq	-32(%rbp), %rax	; current, tmp110
	movq	(%rax), %rax	; current_23->str, _3
; src/lib.c:134:             if (current->length == length && current->str != 0 && strncmp(current->str, data, length) == 0)
	testq	%rax, %rax	; _3
	je	.L18	;,
; src/lib.c:134:             if (current->length == length && current->str != 0 && strncmp(current->str, data, length) == 0)
	movq	-32(%rbp), %rax	; current, tmp111
	movq	(%rax), %rax	; current_23->str, _4
; src/lib.c:134:             if (current->length == length && current->str != 0 && strncmp(current->str, data, length) == 0)
	movq	-48(%rbp), %rdx	; length, tmp112
	movq	-40(%rbp), %rcx	; data, tmp113
	movq	%rcx, %rsi	; tmp113,
	movq	%rax, %rdi	; _4,
	call	strncmp@PLT	;
; src/lib.c:134:             if (current->length == length && current->str != 0 && strncmp(current->str, data, length) == 0)
	testl	%eax, %eax	; _5
	jne	.L18	;,
; src/lib.c:135:                 existing = current->str;
	movq	-32(%rbp), %rax	; current, tmp114
	movq	(%rax), %rax	; current_23->str, tmp115
	movq	%rax, -24(%rbp)	; tmp115, existing
.L18:
; src/lib.c:136:             current = current->next;
	movq	-32(%rbp), %rax	; current, tmp116
	movq	16(%rax), %rax	; current_23->next, tmp117
	movq	%rax, -32(%rbp)	; tmp117, current
.L17:
; src/lib.c:133:         while (current != NULL) {
	cmpq	$0, -32(%rbp)	;, current
	jne	.L19	;,
; src/lib.c:138:         if (existing != NULL)
	cmpq	$0, -24(%rbp)	;, existing
	je	.L16	;,
; src/lib.c:139:             return existing;
	movq	-24(%rbp), %rax	; existing, _27
	jmp	.L15	;
.L16:
; src/lib.c:142:     if (length >= defaultMemorySize - 1)
	cmpq	$1022, -48(%rbp)	;, length
	jbe	.L20	;,
; src/lib.c:143:         str = alloc_big_memory(length + 1);
	movq	-48(%rbp), %rax	; length, tmp118
	addq	$1, %rax	;, _6
	movq	%rax, %rdi	; _6,
	call	alloc_big_memory	;
	movq	%rax, -16(%rbp)	; tmp119, str
	jmp	.L21	;
.L20:
; src/lib.c:145:         if (string_memory->used + length >= string_memory->size)
	movq	string_memory(%rip), %rax	; string_memory, string_memory.14_7
	movq	8(%rax), %rdx	; string_memory.14_7->used, _8
; src/lib.c:145:         if (string_memory->used + length >= string_memory->size)
	movq	-48(%rbp), %rax	; length, tmp120
	addq	%rax, %rdx	; tmp120, _9
; src/lib.c:145:         if (string_memory->used + length >= string_memory->size)
	movq	string_memory(%rip), %rax	; string_memory, string_memory.15_10
	movq	(%rax), %rax	; string_memory.15_10->size, _11
; src/lib.c:145:         if (string_memory->used + length >= string_memory->size)
	cmpq	%rax, %rdx	; _11, _9
	jb	.L22	;,
; src/lib.c:146:             increase_memory_size(false);
	movl	$0, %edi	;,
	call	increase_memory_size	;
.L22:
; src/lib.c:147:         str = &((char*)(string_memory->block))[string_memory->used];
	movq	string_memory(%rip), %rax	; string_memory, string_memory.16_12
	movq	24(%rax), %rdx	; string_memory.16_12->block, _13
; src/lib.c:147:         str = &((char*)(string_memory->block))[string_memory->used];
	movq	string_memory(%rip), %rax	; string_memory, string_memory.17_14
	movq	8(%rax), %rax	; string_memory.17_14->used, _15
; src/lib.c:147:         str = &((char*)(string_memory->block))[string_memory->used];
	addq	%rdx, %rax	; _13, tmp121
	movq	%rax, -16(%rbp)	; tmp121, str
; src/lib.c:148:         string_memory->used += length + 1;
	movq	string_memory(%rip), %rax	; string_memory, string_memory.18_16
	movq	8(%rax), %rdx	; string_memory.18_16->used, _17
; src/lib.c:148:         string_memory->used += length + 1;
	movq	-48(%rbp), %rax	; length, tmp122
	addq	%rax, %rdx	; tmp122, _18
; src/lib.c:148:         string_memory->used += length + 1;
	movq	string_memory(%rip), %rax	; string_memory, string_memory.19_19
; src/lib.c:148:         string_memory->used += length + 1;
	addq	$1, %rdx	;, _20
	movq	%rdx, 8(%rax)	; _20, string_memory.19_19->used
.L21:
; src/lib.c:150:     strncpy(str, data, length);
	movq	-48(%rbp), %rdx	; length, tmp123
	movq	-40(%rbp), %rcx	; data, tmp124
	movq	-16(%rbp), %rax	; str, tmp125
	movq	%rcx, %rsi	; tmp124,
	movq	%rax, %rdi	; tmp125,
	call	strncpy@PLT	;
; src/lib.c:151:     str[length] = '\0';
	movq	-16(%rbp), %rdx	; str, tmp126
	movq	-48(%rbp), %rax	; length, tmp127
	addq	%rdx, %rax	; tmp126, _21
; src/lib.c:151:     str[length] = '\0';
	movb	$0, (%rax)	;, *_21
; src/lib.c:152:     StringList* new_str = (StringList*)alloc_memory(sizeof(StringList));
	movl	$24, %edi	;,
	call	alloc_memory	;
	movq	%rax, -8(%rbp)	; tmp128, new_str
; src/lib.c:153:     new_str->str = str;
	movq	-8(%rbp), %rax	; new_str, tmp129
	movq	-16(%rbp), %rdx	; str, tmp130
	movq	%rdx, (%rax)	; tmp130, new_str_50->str
; src/lib.c:154:     new_str->length = length;
	movq	-8(%rbp), %rax	; new_str, tmp131
	movq	-48(%rbp), %rdx	; length, tmp132
	movq	%rdx, 8(%rax)	; tmp132, new_str_50->length
; src/lib.c:155:     new_str->next = all_string_list;
	movq	all_string_list(%rip), %rdx	; all_string_list, all_string_list.20_22
	movq	-8(%rbp), %rax	; new_str, tmp133
	movq	%rdx, 16(%rax)	; all_string_list.20_22, new_str_50->next
; src/lib.c:156:     all_string_list = new_str;
	movq	-8(%rbp), %rax	; new_str, tmp134
	movq	%rax, all_string_list(%rip)	; tmp134, all_string_list
; src/lib.c:157:     return str;
	movq	-16(%rbp), %rax	; str, _27
.L15:
; src/lib.c:158: }
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
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	;,
	movq	%rdi, -8(%rbp)	; data, data
	movq	%rsi, -16(%rbp)	; length, length
; src/lib.c:161:     return create_string_check(data, length, true);
	movq	-16(%rbp), %rcx	; length, tmp84
	movq	-8(%rbp), %rax	; data, tmp85
	movl	$1, %edx	;,
	movq	%rcx, %rsi	; tmp84,
	movq	%rax, %rdi	; tmp85,
	call	create_string_check	;
; src/lib.c:162: }
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
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	pushq	%rbx	;
	subq	$24, %rsp	;,
	.cfi_offset 3, -24
; src/lib.c:165:     if (initialized) return;
	movzbl	initialized(%rip), %eax	; initialized, initialized.21_1
; src/lib.c:165:     if (initialized) return;
	testb	%al, %al	; initialized.21_1
	jne	.L36	;,
; src/lib.c:166:     if (struct_memory == NULL) {
	movq	struct_memory(%rip), %rax	; struct_memory, struct_memory.22_2
; src/lib.c:166:     if (struct_memory == NULL) {
	testq	%rax, %rax	; struct_memory.22_2
	jne	.L28	;,
; src/lib.c:167:         struct_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movl	$32, %edi	;,
	call	malloc@PLT	;
; src/lib.c:167:         struct_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movq	%rax, struct_memory(%rip)	; _3, struct_memory
; src/lib.c:168:         if (struct_memory == NULL) {
	movq	struct_memory(%rip), %rax	; struct_memory, struct_memory.23_4
; src/lib.c:168:         if (struct_memory == NULL) {
	testq	%rax, %rax	; struct_memory.23_4
	jne	.L29	;,
; src/lib.c:169:             fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movq	stderr(%rip), %rax	; stderr, stderr.24_5
	movq	%rax, %rcx	; stderr.24_5,
	movl	$30, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC52(%rip), %rax	;, tmp162
	movq	%rax, %rdi	; tmp162,
	call	fwrite@PLT	;
; src/lib.c:170:             initialized = false;
	movb	$0, initialized(%rip)	;, initialized
; src/lib.c:171:             exit(1);
	movl	$1, %edi	;,
	call	exit@PLT	;
.L29:
; src/lib.c:173:         struct_memory->block = (size_t*)malloc(defaultMemorySize);
	movq	struct_memory(%rip), %rbx	; struct_memory, struct_memory.25_6
; src/lib.c:173:         struct_memory->block = (size_t*)malloc(defaultMemorySize);
	movl	$1024, %edi	;,
	call	malloc@PLT	;
; src/lib.c:173:         struct_memory->block = (size_t*)malloc(defaultMemorySize);
	movq	%rax, 24(%rbx)	; _7, struct_memory.25_6->block
; src/lib.c:174:         struct_memory->size = defaultMemorySize;
	movq	struct_memory(%rip), %rax	; struct_memory, struct_memory.26_8
; src/lib.c:174:         struct_memory->size = defaultMemorySize;
	movq	$1024, (%rax)	;, struct_memory.26_8->size
; src/lib.c:175:         struct_memory->used = 0;
	movq	struct_memory(%rip), %rax	; struct_memory, struct_memory.27_9
; src/lib.c:175:         struct_memory->used = 0;
	movq	$0, 8(%rax)	;, struct_memory.27_9->used
; src/lib.c:176:         struct_memory->next = NULL;
	movq	struct_memory(%rip), %rax	; struct_memory, struct_memory.28_10
; src/lib.c:176:         struct_memory->next = NULL;
	movq	$0, 16(%rax)	;, struct_memory.28_10->next
; src/lib.c:177:         struct_memory_count = defaultMemorySize;
	movq	$1024, struct_memory_count(%rip)	;, struct_memory_count
.L28:
; src/lib.c:179:     if (string_memory == NULL) {
	movq	string_memory(%rip), %rax	; string_memory, string_memory.29_11
; src/lib.c:179:     if (string_memory == NULL) {
	testq	%rax, %rax	; string_memory.29_11
	jne	.L30	;,
; src/lib.c:180:         string_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movl	$32, %edi	;,
	call	malloc@PLT	;
; src/lib.c:180:         string_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movq	%rax, string_memory(%rip)	; _12, string_memory
; src/lib.c:181:         if (string_memory == NULL) {
	movq	string_memory(%rip), %rax	; string_memory, string_memory.30_13
; src/lib.c:181:         if (string_memory == NULL) {
	testq	%rax, %rax	; string_memory.30_13
	jne	.L31	;,
; src/lib.c:182:             fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movq	stderr(%rip), %rax	; stderr, stderr.31_14
	movq	%rax, %rcx	; stderr.31_14,
	movl	$30, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC52(%rip), %rax	;, tmp165
	movq	%rax, %rdi	; tmp165,
	call	fwrite@PLT	;
; src/lib.c:183:             initialized = false;
	movb	$0, initialized(%rip)	;, initialized
; src/lib.c:184:             exit(1);
	movl	$1, %edi	;,
	call	exit@PLT	;
.L31:
; src/lib.c:186:         string_memory->block = (pointer)malloc(defaultMemorySize);
	movq	string_memory(%rip), %rbx	; string_memory, string_memory.32_15
; src/lib.c:186:         string_memory->block = (pointer)malloc(defaultMemorySize);
	movl	$1024, %edi	;,
	call	malloc@PLT	;
; src/lib.c:186:         string_memory->block = (pointer)malloc(defaultMemorySize);
	movq	%rax, 24(%rbx)	; _16, string_memory.32_15->block
; src/lib.c:187:         string_memory->size = defaultMemorySize;
	movq	string_memory(%rip), %rax	; string_memory, string_memory.33_17
; src/lib.c:187:         string_memory->size = defaultMemorySize;
	movq	$1024, (%rax)	;, string_memory.33_17->size
; src/lib.c:188:         string_memory->used = 0;
	movq	string_memory(%rip), %rax	; string_memory, string_memory.34_18
; src/lib.c:188:         string_memory->used = 0;
	movq	$0, 8(%rax)	;, string_memory.34_18->used
; src/lib.c:189:         string_memory->next = NULL;
	movq	string_memory(%rip), %rax	; string_memory, string_memory.35_19
; src/lib.c:189:         string_memory->next = NULL;
	movq	$0, 16(%rax)	;, string_memory.35_19->next
; src/lib.c:190:         string_memory_count = defaultMemorySize;
	movq	$1024, string_memory_count(%rip)	;, string_memory_count
.L30:
; src/lib.c:192:     initialized = true;
	movb	$1, initialized(%rip)	;, initialized
; src/lib.c:193:     for (size_t i = 0; i < keywordCount; ++i)
	movq	$0, -32(%rbp)	;, i
; src/lib.c:193:     for (size_t i = 0; i < keywordCount; ++i)
	jmp	.L32	;
.L33:
; src/lib.c:194:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), false);
	movq	-32(%rbp), %rax	; i, tmp167
	leaq	0(,%rax,8), %rdx	;, tmp168
	leaq	keywordStrings(%rip), %rax	;, tmp169
	movq	(%rdx,%rax), %rax	; keywordStrings[i_80], _20
	movq	%rax, %rdi	; _20,
	call	strlen@PLT	;
	movq	%rax, %rcx	;, _21
; src/lib.c:194:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), false);
	movq	-32(%rbp), %rax	; i, tmp170
	leaq	0(,%rax,8), %rdx	;, tmp171
	leaq	keywordStrings(%rip), %rax	;, tmp172
	movq	(%rdx,%rax), %rax	; keywordStrings[i_80], _22
	movl	$0, %edx	;,
	movq	%rcx, %rsi	; _21,
	movq	%rax, %rdi	; _22,
	call	create_string_check	;
; src/lib.c:194:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), false);
	movq	-32(%rbp), %rdx	; i, tmp173
	leaq	0(,%rdx,8), %rcx	;, tmp174
	leaq	keywordList(%rip), %rdx	;, tmp175
	movq	%rax, (%rcx,%rdx)	; _23, keywordList[i_80]
; src/lib.c:193:     for (size_t i = 0; i < keywordCount; ++i)
	addq	$1, -32(%rbp)	;, i
.L32:
; src/lib.c:193:     for (size_t i = 0; i < keywordCount; ++i)
	cmpq	$21, -32(%rbp)	;, i
	jbe	.L33	;,
; src/lib.c:195:     for (size_t i = 0; i < symbolCount; ++i)
	movq	$0, -24(%rbp)	;, i
; src/lib.c:195:     for (size_t i = 0; i < symbolCount; ++i)
	jmp	.L34	;
.L35:
; src/lib.c:196:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), false);
	movq	-24(%rbp), %rax	; i, tmp176
	leaq	0(,%rax,8), %rdx	;, tmp177
	leaq	symbolStrings(%rip), %rax	;, tmp178
	movq	(%rdx,%rax), %rax	; symbolStrings[i_81], _24
	movq	%rax, %rdi	; _24,
	call	strlen@PLT	;
	movq	%rax, %rcx	;, _25
; src/lib.c:196:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), false);
	movq	-24(%rbp), %rax	; i, tmp179
	leaq	0(,%rax,8), %rdx	;, tmp180
	leaq	symbolStrings(%rip), %rax	;, tmp181
	movq	(%rdx,%rax), %rax	; symbolStrings[i_81], _26
	movl	$0, %edx	;,
	movq	%rcx, %rsi	; _25,
	movq	%rax, %rdi	; _26,
	call	create_string_check	;
; src/lib.c:196:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), false);
	movq	-24(%rbp), %rdx	; i, tmp182
	leaq	0(,%rdx,8), %rcx	;, tmp183
	leaq	symbolList(%rip), %rdx	;, tmp184
	movq	%rax, (%rcx,%rdx)	; _27, symbolList[i_81]
; src/lib.c:195:     for (size_t i = 0; i < symbolCount; ++i)
	addq	$1, -24(%rbp)	;, i
.L34:
; src/lib.c:195:     for (size_t i = 0; i < symbolCount; ++i)
	cmpq	$29, -24(%rbp)	;, i
	jbe	.L35	;,
; src/lib.c:197:     IMPORT_KEYWORD = keywordList[0];
	movq	keywordList(%rip), %rax	; keywordList[0], _28
; src/lib.c:197:     IMPORT_KEYWORD = keywordList[0];
	movq	%rax, IMPORT_KEYWORD(%rip)	; _28, IMPORT_KEYWORD
; src/lib.c:198:     FROM_KEYWORD = keywordList[1];
	movq	8+keywordList(%rip), %rax	; keywordList[1], _29
; src/lib.c:198:     FROM_KEYWORD = keywordList[1];
	movq	%rax, FROM_KEYWORD(%rip)	; _29, FROM_KEYWORD
; src/lib.c:199:     FUNC_KEYWORD = keywordList[2];
	movq	16+keywordList(%rip), %rax	; keywordList[2], _30
; src/lib.c:199:     FUNC_KEYWORD = keywordList[2];
	movq	%rax, FUNC_KEYWORD(%rip)	; _30, FUNC_KEYWORD
; src/lib.c:200:     CLASS_KEYWORD = keywordList[3];
	movq	24+keywordList(%rip), %rax	; keywordList[3], _31
; src/lib.c:200:     CLASS_KEYWORD = keywordList[3];
	movq	%rax, CLASS_KEYWORD(%rip)	; _31, CLASS_KEYWORD
; src/lib.c:201:     METHOD_KEYWORD = keywordList[4];
	movq	32+keywordList(%rip), %rax	; keywordList[4], _32
; src/lib.c:201:     METHOD_KEYWORD = keywordList[4];
	movq	%rax, METHOD_KEYWORD(%rip)	; _32, METHOD_KEYWORD
; src/lib.c:202:     SELF_KEYWORD = keywordList[5];
	movq	40+keywordList(%rip), %rax	; keywordList[5], _33
; src/lib.c:202:     SELF_KEYWORD = keywordList[5];
	movq	%rax, SELF_KEYWORD(%rip)	; _33, SELF_KEYWORD
; src/lib.c:203:     IF_KEYWORD = keywordList[6];
	movq	48+keywordList(%rip), %rax	; keywordList[6], _34
; src/lib.c:203:     IF_KEYWORD = keywordList[6];
	movq	%rax, IF_KEYWORD(%rip)	; _34, IF_KEYWORD
; src/lib.c:204:     ELIF_KEYWORD = keywordList[7];
	movq	56+keywordList(%rip), %rax	; keywordList[7], _35
; src/lib.c:204:     ELIF_KEYWORD = keywordList[7];
	movq	%rax, ELIF_KEYWORD(%rip)	; _35, ELIF_KEYWORD
; src/lib.c:205:     ELSE_KEYWORD = keywordList[8];
	movq	64+keywordList(%rip), %rax	; keywordList[8], _36
; src/lib.c:205:     ELSE_KEYWORD = keywordList[8];
	movq	%rax, ELSE_KEYWORD(%rip)	; _36, ELSE_KEYWORD
; src/lib.c:206:     WHILE_KEYWORD = keywordList[9];
	movq	72+keywordList(%rip), %rax	; keywordList[9], _37
; src/lib.c:206:     WHILE_KEYWORD = keywordList[9];
	movq	%rax, WHILE_KEYWORD(%rip)	; _37, WHILE_KEYWORD
; src/lib.c:207:     FOR_KEYWORD = keywordList[10];
	movq	80+keywordList(%rip), %rax	; keywordList[10], _38
; src/lib.c:207:     FOR_KEYWORD = keywordList[10];
	movq	%rax, FOR_KEYWORD(%rip)	; _38, FOR_KEYWORD
; src/lib.c:208:     TRUE_KEYWORD = keywordList[11];
	movq	88+keywordList(%rip), %rax	; keywordList[11], _39
; src/lib.c:208:     TRUE_KEYWORD = keywordList[11];
	movq	%rax, TRUE_KEYWORD(%rip)	; _39, TRUE_KEYWORD
; src/lib.c:209:     FALSE_KEYWORD = keywordList[12];
	movq	96+keywordList(%rip), %rax	; keywordList[12], _40
; src/lib.c:209:     FALSE_KEYWORD = keywordList[12];
	movq	%rax, FALSE_KEYWORD(%rip)	; _40, FALSE_KEYWORD
; src/lib.c:210:     RETURN_KEYWORD = keywordList[13];
	movq	104+keywordList(%rip), %rax	; keywordList[13], _41
; src/lib.c:210:     RETURN_KEYWORD = keywordList[13];
	movq	%rax, RETURN_KEYWORD(%rip)	; _41, RETURN_KEYWORD
; src/lib.c:211:     BREAK_KEYWORD = keywordList[14];
	movq	112+keywordList(%rip), %rax	; keywordList[14], _42
; src/lib.c:211:     BREAK_KEYWORD = keywordList[14];
	movq	%rax, BREAK_KEYWORD(%rip)	; _42, BREAK_KEYWORD
; src/lib.c:212:     CONTINUE_KEYWORD = keywordList[15];
	movq	120+keywordList(%rip), %rax	; keywordList[15], _43
; src/lib.c:212:     CONTINUE_KEYWORD = keywordList[15];
	movq	%rax, CONTINUE_KEYWORD(%rip)	; _43, CONTINUE_KEYWORD
; src/lib.c:213:     INT_KEYWORD = keywordList[16];
	movq	128+keywordList(%rip), %rax	; keywordList[16], _44
; src/lib.c:213:     INT_KEYWORD = keywordList[16];
	movq	%rax, INT_KEYWORD(%rip)	; _44, INT_KEYWORD
; src/lib.c:214:     FLOAT_KEYWORD = keywordList[17];
	movq	136+keywordList(%rip), %rax	; keywordList[17], _45
; src/lib.c:214:     FLOAT_KEYWORD = keywordList[17];
	movq	%rax, FLOAT_KEYWORD(%rip)	; _45, FLOAT_KEYWORD
; src/lib.c:215:     STRING_KEYWORD = keywordList[18];
	movq	144+keywordList(%rip), %rax	; keywordList[18], _46
; src/lib.c:215:     STRING_KEYWORD = keywordList[18];
	movq	%rax, STRING_KEYWORD(%rip)	; _46, STRING_KEYWORD
; src/lib.c:216:     BOOL_KEYWORD = keywordList[19];
	movq	152+keywordList(%rip), %rax	; keywordList[19], _47
; src/lib.c:216:     BOOL_KEYWORD = keywordList[19];
	movq	%rax, BOOL_KEYWORD(%rip)	; _47, BOOL_KEYWORD
; src/lib.c:217:     VOID_KEYWORD = keywordList[20];
	movq	160+keywordList(%rip), %rax	; keywordList[20], _48
; src/lib.c:217:     VOID_KEYWORD = keywordList[20];
	movq	%rax, VOID_KEYWORD(%rip)	; _48, VOID_KEYWORD
; src/lib.c:218:     VAR_KEYWORD = keywordList[21];
	movq	168+keywordList(%rip), %rax	; keywordList[21], _49
; src/lib.c:218:     VAR_KEYWORD = keywordList[21];
	movq	%rax, VAR_KEYWORD(%rip)	; _49, VAR_KEYWORD
; src/lib.c:219:     L_PAREN_SYMBOL = symbolList[0];
	movq	symbolList(%rip), %rax	; symbolList[0], _50
; src/lib.c:219:     L_PAREN_SYMBOL = symbolList[0];
	movq	%rax, L_PAREN_SYMBOL(%rip)	; _50, L_PAREN_SYMBOL
; src/lib.c:220:     R_PAREN_SYMBOL = symbolList[1];
	movq	8+symbolList(%rip), %rax	; symbolList[1], _51
; src/lib.c:220:     R_PAREN_SYMBOL = symbolList[1];
	movq	%rax, R_PAREN_SYMBOL(%rip)	; _51, R_PAREN_SYMBOL
; src/lib.c:221:     L_BRACE_SYMBOL = symbolList[2];
	movq	16+symbolList(%rip), %rax	; symbolList[2], _52
; src/lib.c:221:     L_BRACE_SYMBOL = symbolList[2];
	movq	%rax, L_BRACE_SYMBOL(%rip)	; _52, L_BRACE_SYMBOL
; src/lib.c:222:     R_BRACE_SYMBOL = symbolList[3];
	movq	24+symbolList(%rip), %rax	; symbolList[3], _53
; src/lib.c:222:     R_BRACE_SYMBOL = symbolList[3];
	movq	%rax, R_BRACE_SYMBOL(%rip)	; _53, R_BRACE_SYMBOL
; src/lib.c:223:     COMMA_SYMBOL = symbolList[4];
	movq	32+symbolList(%rip), %rax	; symbolList[4], _54
; src/lib.c:223:     COMMA_SYMBOL = symbolList[4];
	movq	%rax, COMMA_SYMBOL(%rip)	; _54, COMMA_SYMBOL
; src/lib.c:224:     NOT_SYMBOL = symbolList[5];
	movq	40+symbolList(%rip), %rax	; symbolList[5], _55
; src/lib.c:224:     NOT_SYMBOL = symbolList[5];
	movq	%rax, NOT_SYMBOL(%rip)	; _55, NOT_SYMBOL
; src/lib.c:225:     DOT_SYMBOL = symbolList[6];
	movq	48+symbolList(%rip), %rax	; symbolList[6], _56
; src/lib.c:225:     DOT_SYMBOL = symbolList[6];
	movq	%rax, DOT_SYMBOL(%rip)	; _56, DOT_SYMBOL
; src/lib.c:226:     L_BRACKET_SYMBOL = symbolList[7];
	movq	56+symbolList(%rip), %rax	; symbolList[7], _57
; src/lib.c:226:     L_BRACKET_SYMBOL = symbolList[7];
	movq	%rax, L_BRACKET_SYMBOL(%rip)	; _57, L_BRACKET_SYMBOL
; src/lib.c:227:     R_BRACKET_SYMBOL = symbolList[8];
	movq	64+symbolList(%rip), %rax	; symbolList[8], _58
; src/lib.c:227:     R_BRACKET_SYMBOL = symbolList[8];
	movq	%rax, R_BRACKET_SYMBOL(%rip)	; _58, R_BRACKET_SYMBOL
; src/lib.c:228:     SEMICOLON_SYMBOL = symbolList[9];
	movq	72+symbolList(%rip), %rax	; symbolList[9], _59
; src/lib.c:228:     SEMICOLON_SYMBOL = symbolList[9];
	movq	%rax, SEMICOLON_SYMBOL(%rip)	; _59, SEMICOLON_SYMBOL
; src/lib.c:229:     UNDERLINE_SYMBOL = symbolList[10];
	movq	80+symbolList(%rip), %rax	; symbolList[10], _60
; src/lib.c:229:     UNDERLINE_SYMBOL = symbolList[10];
	movq	%rax, UNDERLINE_SYMBOL(%rip)	; _60, UNDERLINE_SYMBOL
; src/lib.c:230:     ADD_SYMBOL = symbolList[11];
	movq	88+symbolList(%rip), %rax	; symbolList[11], _61
; src/lib.c:230:     ADD_SYMBOL = symbolList[11];
	movq	%rax, ADD_SYMBOL(%rip)	; _61, ADD_SYMBOL
; src/lib.c:231:     SUB_SYMBOL = symbolList[12];
	movq	96+symbolList(%rip), %rax	; symbolList[12], _62
; src/lib.c:231:     SUB_SYMBOL = symbolList[12];
	movq	%rax, SUB_SYMBOL(%rip)	; _62, SUB_SYMBOL
; src/lib.c:232:     MUL_SYMBOL = symbolList[13];
	movq	104+symbolList(%rip), %rax	; symbolList[13], _63
; src/lib.c:232:     MUL_SYMBOL = symbolList[13];
	movq	%rax, MUL_SYMBOL(%rip)	; _63, MUL_SYMBOL
; src/lib.c:233:     DIV_SYMBOL = symbolList[14];
	movq	112+symbolList(%rip), %rax	; symbolList[14], _64
; src/lib.c:233:     DIV_SYMBOL = symbolList[14];
	movq	%rax, DIV_SYMBOL(%rip)	; _64, DIV_SYMBOL
; src/lib.c:234:     MOD_SYMBOL = symbolList[15];
	movq	120+symbolList(%rip), %rax	; symbolList[15], _65
; src/lib.c:234:     MOD_SYMBOL = symbolList[15];
	movq	%rax, MOD_SYMBOL(%rip)	; _65, MOD_SYMBOL
; src/lib.c:235:     LT_SYMBOL = symbolList[16];
	movq	128+symbolList(%rip), %rax	; symbolList[16], _66
; src/lib.c:235:     LT_SYMBOL = symbolList[16];
	movq	%rax, LT_SYMBOL(%rip)	; _66, LT_SYMBOL
; src/lib.c:236:     GT_SYMBOL = symbolList[17];
	movq	136+symbolList(%rip), %rax	; symbolList[17], _67
; src/lib.c:236:     GT_SYMBOL = symbolList[17];
	movq	%rax, GT_SYMBOL(%rip)	; _67, GT_SYMBOL
; src/lib.c:237:     ASSIGN_SYMBOL = symbolList[18];
	movq	144+symbolList(%rip), %rax	; symbolList[18], _68
; src/lib.c:237:     ASSIGN_SYMBOL = symbolList[18];
	movq	%rax, ASSIGN_SYMBOL(%rip)	; _68, ASSIGN_SYMBOL
; src/lib.c:238:     EQ_SYMBOL = symbolList[19];
	movq	152+symbolList(%rip), %rax	; symbolList[19], _69
; src/lib.c:238:     EQ_SYMBOL = symbolList[19];
	movq	%rax, EQ_SYMBOL(%rip)	; _69, EQ_SYMBOL
; src/lib.c:239:     NE_SYMBOL = symbolList[20];
	movq	160+symbolList(%rip), %rax	; symbolList[20], _70
; src/lib.c:239:     NE_SYMBOL = symbolList[20];
	movq	%rax, NE_SYMBOL(%rip)	; _70, NE_SYMBOL
; src/lib.c:240:     LE_SYMBOL = symbolList[21];
	movq	168+symbolList(%rip), %rax	; symbolList[21], _71
; src/lib.c:240:     LE_SYMBOL = symbolList[21];
	movq	%rax, LE_SYMBOL(%rip)	; _71, LE_SYMBOL
; src/lib.c:241:     GE_SYMBOL = symbolList[22];
	movq	176+symbolList(%rip), %rax	; symbolList[22], _72
; src/lib.c:241:     GE_SYMBOL = symbolList[22];
	movq	%rax, GE_SYMBOL(%rip)	; _72, GE_SYMBOL
; src/lib.c:242:     ADD_ASSIGN_SYMBOL = symbolList[23];
	movq	184+symbolList(%rip), %rax	; symbolList[23], _73
; src/lib.c:242:     ADD_ASSIGN_SYMBOL = symbolList[23];
	movq	%rax, ADD_ASSIGN_SYMBOL(%rip)	; _73, ADD_ASSIGN_SYMBOL
; src/lib.c:243:     SUB_ASSIGN_SYMBOL = symbolList[24];
	movq	192+symbolList(%rip), %rax	; symbolList[24], _74
; src/lib.c:243:     SUB_ASSIGN_SYMBOL = symbolList[24];
	movq	%rax, SUB_ASSIGN_SYMBOL(%rip)	; _74, SUB_ASSIGN_SYMBOL
; src/lib.c:244:     MUL_ASSIGN_SYMBOL = symbolList[25];
	movq	200+symbolList(%rip), %rax	; symbolList[25], _75
; src/lib.c:244:     MUL_ASSIGN_SYMBOL = symbolList[25];
	movq	%rax, MUL_ASSIGN_SYMBOL(%rip)	; _75, MUL_ASSIGN_SYMBOL
; src/lib.c:245:     DIV_ASSIGN_SYMBOL = symbolList[26];
	movq	208+symbolList(%rip), %rax	; symbolList[26], _76
; src/lib.c:245:     DIV_ASSIGN_SYMBOL = symbolList[26];
	movq	%rax, DIV_ASSIGN_SYMBOL(%rip)	; _76, DIV_ASSIGN_SYMBOL
; src/lib.c:246:     MOD_ASSIGN_SYMBOL = symbolList[27];
	movq	216+symbolList(%rip), %rax	; symbolList[27], _77
; src/lib.c:246:     MOD_ASSIGN_SYMBOL = symbolList[27];
	movq	%rax, MOD_ASSIGN_SYMBOL(%rip)	; _77, MOD_ASSIGN_SYMBOL
; src/lib.c:247:     AND_SYMBOL = symbolList[28];
	movq	224+symbolList(%rip), %rax	; symbolList[28], _78
; src/lib.c:247:     AND_SYMBOL = symbolList[28];
	movq	%rax, AND_SYMBOL(%rip)	; _78, AND_SYMBOL
; src/lib.c:248:     OR_SYMBOL = symbolList[29];
	movq	232+symbolList(%rip), %rax	; symbolList[29], _79
; src/lib.c:248:     OR_SYMBOL = symbolList[29];
	movq	%rax, OR_SYMBOL(%rip)	; _79, OR_SYMBOL
	jmp	.L25	;
.L36:
; src/lib.c:165:     if (initialized) return;
	nop	
.L25:
; src/lib.c:249: }
	movq	-8(%rbp), %rbx	;,
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
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; size, size
; src/lib.c:254:     if (!initialized) init();
	movzbl	initialized(%rip), %eax	; initialized, initialized.36_1
; src/lib.c:254:     if (!initialized) init();
	testb	%al, %al	; initialized.36_1
	jne	.L38	;,
; src/lib.c:254:     if (!initialized) init();
	call	init	;
.L38:
; src/lib.c:255:     if (struct_memory->used + size >= struct_memory->size)
	movq	struct_memory(%rip), %rax	; struct_memory, struct_memory.37_2
	movq	8(%rax), %rdx	; struct_memory.37_2->used, _3
; src/lib.c:255:     if (struct_memory->used + size >= struct_memory->size)
	movq	-24(%rbp), %rax	; size, tmp105
	addq	%rax, %rdx	; tmp105, _4
; src/lib.c:255:     if (struct_memory->used + size >= struct_memory->size)
	movq	struct_memory(%rip), %rax	; struct_memory, struct_memory.38_5
	movq	(%rax), %rax	; struct_memory.38_5->size, _6
; src/lib.c:255:     if (struct_memory->used + size >= struct_memory->size)
	cmpq	%rax, %rdx	; _6, _4
	jb	.L39	;,
; src/lib.c:256:         increase_memory_size(true);
	movl	$1, %edi	;,
	call	increase_memory_size	;
.L39:
; src/lib.c:257:     size = (size + ALIGN_SIZE - 1) & ~(ALIGN_SIZE - 1);
	movq	-24(%rbp), %rax	; size, tmp106
	addq	$7, %rax	;, _7
; src/lib.c:257:     size = (size + ALIGN_SIZE - 1) & ~(ALIGN_SIZE - 1);
	andq	$-8, %rax	;, tmp107
	movq	%rax, -24(%rbp)	; tmp107, size
; src/lib.c:258:     assert(struct_memory->used % ALIGN_SIZE == 0);
	movq	struct_memory(%rip), %rax	; struct_memory, struct_memory.39_8
	movq	8(%rax), %rax	; struct_memory.39_8->used, _9
	andl	$7, %eax	;, _10
	testq	%rax, %rax	; _10
	je	.L40	;,
; src/lib.c:258:     assert(struct_memory->used % ALIGN_SIZE == 0);
	leaq	__PRETTY_FUNCTION__.0(%rip), %rax	;, tmp108
	movq	%rax, %rcx	; tmp108,
	movl	$258, %edx	;,
	leaq	.LC54(%rip), %rax	;, tmp109
	movq	%rax, %rsi	; tmp109,
	leaq	.LC55(%rip), %rax	;, tmp110
	movq	%rax, %rdi	; tmp110,
	call	__assert_fail@PLT	;
.L40:
; src/lib.c:259:     size_t* ptr = struct_memory->block + (struct_memory->used / ALIGN_SIZE);
	movq	struct_memory(%rip), %rax	; struct_memory, struct_memory.40_11
	movq	24(%rax), %rdx	; struct_memory.40_11->block, _12
; src/lib.c:259:     size_t* ptr = struct_memory->block + (struct_memory->used / ALIGN_SIZE);
	movq	struct_memory(%rip), %rax	; struct_memory, struct_memory.41_13
	movq	8(%rax), %rax	; struct_memory.41_13->used, _14
; src/lib.c:259:     size_t* ptr = struct_memory->block + (struct_memory->used / ALIGN_SIZE);
	andq	$-8, %rax	;, _15
; src/lib.c:259:     size_t* ptr = struct_memory->block + (struct_memory->used / ALIGN_SIZE);
	addq	%rdx, %rax	; _12, tmp111
	movq	%rax, -8(%rbp)	; tmp111, ptr
; src/lib.c:260:     struct_memory->used += size;
	movq	struct_memory(%rip), %rax	; struct_memory, struct_memory.42_16
	movq	8(%rax), %rcx	; struct_memory.42_16->used, _17
	movq	struct_memory(%rip), %rax	; struct_memory, struct_memory.43_18
; src/lib.c:260:     struct_memory->used += size;
	movq	-24(%rbp), %rdx	; size, tmp112
	addq	%rcx, %rdx	; _17, _19
	movq	%rdx, 8(%rax)	; _19, struct_memory.43_18->used
; src/lib.c:261:     ++memoryBlockCount;
	movq	memoryBlockCount(%rip), %rax	; memoryBlockCount, memoryBlockCount.44_20
	addq	$1, %rax	;, _21
	movq	%rax, memoryBlockCount(%rip)	; _21, memoryBlockCount
; src/lib.c:262:     return ptr;
	movq	-8(%rbp), %rax	; ptr, _33
; src/lib.c:263: }
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
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; str, str
; src/lib.c:266:     if (!initialized) init();
	movzbl	initialized(%rip), %eax	; initialized, initialized.45_1
; src/lib.c:266:     if (!initialized) init();
	testb	%al, %al	; initialized.45_1
	jne	.L43	;,
; src/lib.c:266:     if (!initialized) init();
	call	init	;
.L43:
; src/lib.c:267:     for (size_t i = 0; i < keywordCount; ++i)
	movq	$0, -8(%rbp)	;, i
; src/lib.c:267:     for (size_t i = 0; i < keywordCount; ++i)
	jmp	.L44	;
.L47:
; src/lib.c:268:         if (string_equal(str, keywordList[i]))
	movq	-8(%rbp), %rax	; i, tmp87
	leaq	0(,%rax,8), %rdx	;, tmp88
	leaq	keywordList(%rip), %rax	;, tmp89
	movq	(%rdx,%rax), %rdx	; keywordList[i_4], _2
	movq	-24(%rbp), %rax	; str, tmp90
	movq	%rdx, %rsi	; _2,
	movq	%rax, %rdi	; tmp90,
	call	string_equal	;
; src/lib.c:268:         if (string_equal(str, keywordList[i]))
	testb	%al, %al	; _3
	je	.L45	;,
; src/lib.c:269:             return true;
	movl	$1, %eax	;, _5
	jmp	.L46	;
.L45:
; src/lib.c:267:     for (size_t i = 0; i < keywordCount; ++i)
	addq	$1, -8(%rbp)	;, i
.L44:
; src/lib.c:267:     for (size_t i = 0; i < keywordCount; ++i)
	cmpq	$21, -8(%rbp)	;, i
	jbe	.L47	;,
; src/lib.c:270:     return false;
	movl	$0, %eax	;, _5
.L46:
; src/lib.c:271: }
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
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	; a, a
	movq	%rsi, -16(%rbp)	; b, b
; src/lib.c:274:     return a == b;
	movq	-8(%rbp), %rax	; a, tmp85
	cmpq	-16(%rbp), %rax	; b, tmp85
	sete	%al	;, _1
; src/lib.c:275: }
	popq	%rbp	;
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
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	;,
; src/lib.c:278:     size_t stringCount = 0;
	movq	$0, -40(%rbp)	;, stringCount
; src/lib.c:279:     StringList* current = all_string_list;
	movq	all_string_list(%rip), %rax	; all_string_list, tmp95
	movq	%rax, -32(%rbp)	; tmp95, current
; src/lib.c:280:     while (current != NULL) {
	jmp	.L51	;
.L52:
; src/lib.c:281:         stringCount++;
	addq	$1, -40(%rbp)	;, stringCount
; src/lib.c:282:         current = current->next;
	movq	-32(%rbp), %rax	; current, tmp96
	movq	16(%rax), %rax	; current_13->next, tmp97
	movq	%rax, -32(%rbp)	; tmp97, current
.L51:
; src/lib.c:280:     while (current != NULL) {
	cmpq	$0, -32(%rbp)	;, current
	jne	.L52	;,
; src/lib.c:285:     string struct_memory_used_str = create_string_check("", 48, false);
	movl	$0, %edx	;,
	movl	$48, %esi	;,
	leaq	.LC56(%rip), %rax	;, tmp98
	movq	%rax, %rdi	; tmp98,
	call	create_string_check	;
	movq	%rax, -24(%rbp)	; tmp99, struct_memory_used_str
; src/lib.c:286:     sprintf(struct_memory_used_str, "%zu/%zu bytes", struct_memory_used + struct_memory->used, struct_memory_count);
	movq	struct_memory_count(%rip), %rdx	; struct_memory_count, struct_memory_count.46_1
; src/lib.c:286:     sprintf(struct_memory_used_str, "%zu/%zu bytes", struct_memory_used + struct_memory->used, struct_memory_count);
	movq	struct_memory(%rip), %rax	; struct_memory, struct_memory.47_2
	movq	8(%rax), %rcx	; struct_memory.47_2->used, _3
; src/lib.c:286:     sprintf(struct_memory_used_str, "%zu/%zu bytes", struct_memory_used + struct_memory->used, struct_memory_count);
	movq	struct_memory_used(%rip), %rax	; struct_memory_used, struct_memory_used.48_4
	leaq	(%rcx,%rax), %rsi	;, _5
	movq	-24(%rbp), %rax	; struct_memory_used_str, tmp100
	movq	%rdx, %rcx	; struct_memory_count.46_1,
	movq	%rsi, %rdx	; _5,
	leaq	.LC57(%rip), %rsi	;, tmp101
	movq	%rax, %rdi	; tmp100,
	movl	$0, %eax	;,
	call	sprintf@PLT	;
; src/lib.c:288:     string string_memory_used_str = create_string_check("", 48, false);
	movl	$0, %edx	;,
	movl	$48, %esi	;,
	leaq	.LC56(%rip), %rax	;, tmp102
	movq	%rax, %rdi	; tmp102,
	call	create_string_check	;
	movq	%rax, -16(%rbp)	; tmp103, string_memory_used_str
; src/lib.c:289:     sprintf(string_memory_used_str, "%zu/%zu bytes", string_memory_used + string_memory->used, string_memory_count);
	movq	string_memory_count(%rip), %rdx	; string_memory_count, string_memory_count.49_6
; src/lib.c:289:     sprintf(string_memory_used_str, "%zu/%zu bytes", string_memory_used + string_memory->used, string_memory_count);
	movq	string_memory(%rip), %rax	; string_memory, string_memory.50_7
	movq	8(%rax), %rcx	; string_memory.50_7->used, _8
; src/lib.c:289:     sprintf(string_memory_used_str, "%zu/%zu bytes", string_memory_used + string_memory->used, string_memory_count);
	movq	string_memory_used(%rip), %rax	; string_memory_used, string_memory_used.51_9
	leaq	(%rcx,%rax), %rsi	;, _10
	movq	-16(%rbp), %rax	; string_memory_used_str, tmp104
	movq	%rdx, %rcx	; string_memory_count.49_6,
	movq	%rsi, %rdx	; _10,
	leaq	.LC57(%rip), %rsi	;, tmp105
	movq	%rax, %rdi	; tmp104,
	movl	$0, %eax	;,
	call	sprintf@PLT	;
; src/lib.c:291:     string info = (string)create_string_check("", 240, false);
	movl	$0, %edx	;,
	movl	$240, %esi	;,
	leaq	.LC56(%rip), %rax	;, tmp106
	movq	%rax, %rdi	; tmp106,
	call	create_string_check	;
	movq	%rax, -8(%rbp)	; tmp107, info
; src/lib.c:292:     sprintf(info, "Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu", PLATFORM, struct_memory_used_str, string_memory_used_str, stringCount, memoryBlockCount);
	movq	memoryBlockCount(%rip), %rcx	; memoryBlockCount, memoryBlockCount.52_11
	movq	-40(%rbp), %rdi	; stringCount, tmp108
	movq	-16(%rbp), %rsi	; string_memory_used_str, tmp109
	movq	-24(%rbp), %rdx	; struct_memory_used_str, tmp110
	movq	-8(%rbp), %rax	; info, tmp111
	subq	$8, %rsp	;,
	pushq	%rcx	; memoryBlockCount.52_11
	movq	%rdi, %r9	; tmp108,
	movq	%rsi, %r8	; tmp109,
	movq	%rdx, %rcx	; tmp110,
	movl	$3, %edx	;,
	leaq	.LC58(%rip), %rsi	;, tmp112
	movq	%rax, %rdi	; tmp111,
	movl	$0, %eax	;,
	call	sprintf@PLT	;
	addq	$16, %rsp	;,
; src/lib.c:293:     return info;
	movq	-8(%rbp), %rax	; info, _26
; src/lib.c:294: }
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
