	.file	"D:\\TC\\src\\lib.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O0
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
	.seh_proc	increase_memory_size
increase_memory_size:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$64, %rsp	 ;,
	.seh_stackalloc	64
	.seh_endprologue
	movl	%ecx, %eax	 ; for_struct, tmp100
	movb	%al, 16(%rbp)	 ; tmp101, for_struct
 ; D:\TC\src\lib.c:79:     MemoryBlock* new_block = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movl	$32, %ecx	 ;,
	call	malloc	 ;
	movq	%rax, -16(%rbp)	 ; tmp102, new_block
 ; D:\TC\src\lib.c:80:     if (new_block == NULL) {
	cmpq	$0, -16(%rbp)	 ;, new_block
	jne	.L2	 ;,
 ; D:\TC\src\lib.c:81:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	call	__getreent	 ;
 ; D:\TC\src\lib.c:81:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:\TC\src\lib.c:81:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movq	%rax, %r9	 ; _2,
	movl	$30, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC52(%rip), %rax	 ;, tmp103
	movq	%rax, %rcx	 ; tmp103,
	call	fwrite	 ;
 ; D:\TC\src\lib.c:82:         MemoryBlock* current = string_memory;
	movq	string_memory(%rip), %rax	 ; string_memory, tmp104
	movq	%rax, -8(%rbp)	 ; tmp104, current
 ; D:\TC\src\lib.c:83:         while (current != NULL) {
	jmp	.L3	 ;
.L4:
 ; D:\TC\src\lib.c:84:             MemoryBlock* next = current->next;
	movq	-8(%rbp), %rax	 ; current, tmp105
	movq	16(%rax), %rax	 ; current_19->next, tmp106
	movq	%rax, -24(%rbp)	 ; tmp106, next
 ; D:\TC\src\lib.c:85:             free(current->block);
	movq	-8(%rbp), %rax	 ; current, tmp107
	movq	24(%rax), %rax	 ; current_19->block, _3
 ; D:\TC\src\lib.c:85:             free(current->block);
	movq	%rax, %rcx	 ; _3,
	call	free	 ;
 ; D:\TC\src\lib.c:86:             free(current);
	movq	-8(%rbp), %rax	 ; current, tmp108
	movq	%rax, %rcx	 ; tmp108,
	call	free	 ;
 ; D:\TC\src\lib.c:87:             current = next;
	movq	-24(%rbp), %rax	 ; next, tmp109
	movq	%rax, -8(%rbp)	 ; tmp109, current
.L3:
 ; D:\TC\src\lib.c:83:         while (current != NULL) {
	cmpq	$0, -8(%rbp)	 ;, current
	jne	.L4	 ;,
 ; D:\TC\src\lib.c:89:         initialized = false;
	movb	$0, initialized(%rip)	 ;, initialized
 ; D:\TC\src\lib.c:90:         exit(1);
	movl	$1, %ecx	 ;,
	call	exit	 ;
.L2:
 ; D:\TC\src\lib.c:92:     new_block->block = (pointer)malloc(defaultMemorySize);
	movl	$1024, %ecx	 ;,
	call	malloc	 ;
	movq	%rax, %rdx	 ; tmp110, _4
 ; D:\TC\src\lib.c:92:     new_block->block = (pointer)malloc(defaultMemorySize);
	movq	-16(%rbp), %rax	 ; new_block, tmp111
	movq	%rdx, 24(%rax)	 ; _4, new_block_24->block
 ; D:\TC\src\lib.c:93:     new_block->size = defaultMemorySize;
	movq	-16(%rbp), %rax	 ; new_block, tmp112
	movq	$1024, (%rax)	 ;, new_block_24->size
 ; D:\TC\src\lib.c:94:     new_block->used = 0;
	movq	-16(%rbp), %rax	 ; new_block, tmp113
	movq	$0, 8(%rax)	 ;, new_block_24->used
 ; D:\TC\src\lib.c:95:     new_block->next = NULL;
	movq	-16(%rbp), %rax	 ; new_block, tmp114
	movq	$0, 16(%rax)	 ;, new_block_24->next
 ; D:\TC\src\lib.c:96:     if (for_struct) {
	cmpb	$0, 16(%rbp)	 ;, for_struct
	je	.L5	 ;,
 ; D:\TC\src\lib.c:97:         struct_memory_used += struct_memory->used;
	movq	struct_memory(%rip), %rax	 ; struct_memory, struct_memory.0_5
	movq	8(%rax), %rdx	 ; struct_memory.0_5->used, _6
 ; D:\TC\src\lib.c:97:         struct_memory_used += struct_memory->used;
	movq	struct_memory_used(%rip), %rax	 ; struct_memory_used, struct_memory_used.1_7
	addq	%rdx, %rax	 ; _6, _8
	movq	%rax, struct_memory_used(%rip)	 ; _8, struct_memory_used
 ; D:\TC\src\lib.c:98:         new_block->next = struct_memory;
	movq	struct_memory(%rip), %rdx	 ; struct_memory, struct_memory.2_9
	movq	-16(%rbp), %rax	 ; new_block, tmp115
	movq	%rdx, 16(%rax)	 ; struct_memory.2_9, new_block_24->next
 ; D:\TC\src\lib.c:99:         struct_memory = new_block;
	movq	-16(%rbp), %rax	 ; new_block, tmp116
	movq	%rax, struct_memory(%rip)	 ; tmp116, struct_memory
 ; D:\TC\src\lib.c:100:         struct_memory_count += defaultMemorySize;
	movq	struct_memory_count(%rip), %rax	 ; struct_memory_count, struct_memory_count.3_10
	addq	$1024, %rax	 ;, _11
	movq	%rax, struct_memory_count(%rip)	 ; _11, struct_memory_count
 ; D:\TC\src\lib.c:113: }
	jmp	.L7	 ;
.L5:
 ; D:\TC\src\lib.c:105:         string_memory_used += string_memory->used;
	movq	string_memory(%rip), %rax	 ; string_memory, string_memory.4_12
	movq	8(%rax), %rdx	 ; string_memory.4_12->used, _13
 ; D:\TC\src\lib.c:105:         string_memory_used += string_memory->used;
	movq	string_memory_used(%rip), %rax	 ; string_memory_used, string_memory_used.5_14
	addq	%rdx, %rax	 ; _13, _15
	movq	%rax, string_memory_used(%rip)	 ; _15, string_memory_used
 ; D:\TC\src\lib.c:106:         new_block->next = string_memory;
	movq	string_memory(%rip), %rdx	 ; string_memory, string_memory.6_16
	movq	-16(%rbp), %rax	 ; new_block, tmp117
	movq	%rdx, 16(%rax)	 ; string_memory.6_16, new_block_24->next
 ; D:\TC\src\lib.c:107:         string_memory = new_block;
	movq	-16(%rbp), %rax	 ; new_block, tmp118
	movq	%rax, string_memory(%rip)	 ; tmp118, string_memory
 ; D:\TC\src\lib.c:108:         string_memory_count += defaultMemorySize;
	movq	string_memory_count(%rip), %rax	 ; string_memory_count, string_memory_count.7_17
	addq	$1024, %rax	 ;, _18
	movq	%rax, string_memory_count(%rip)	 ; _18, string_memory_count
.L7:
 ; D:\TC\src\lib.c:113: }
	nop	
	addq	$64, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC53:
	.ascii "Info: Allocate big memory block of size %zu bytes\12\0"
	.text
	.def	alloc_big_memory;	.scl	3;	.type	32;	.endef
	.seh_proc	alloc_big_memory
alloc_big_memory:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; size, size
 ; D:\TC\src\lib.c:116:     string_memory_count += size;
	movq	string_memory_count(%rip), %rdx	 ; string_memory_count, string_memory_count.8_1
	movq	16(%rbp), %rax	 ; size, tmp92
	addq	%rdx, %rax	 ; string_memory_count.8_1, _2
	movq	%rax, string_memory_count(%rip)	 ; _2, string_memory_count
 ; D:\TC\src\lib.c:117:     string_memory_used += size;
	movq	string_memory_used(%rip), %rdx	 ; string_memory_used, string_memory_used.9_3
	movq	16(%rbp), %rax	 ; size, tmp93
	addq	%rdx, %rax	 ; string_memory_used.9_3, _4
	movq	%rax, string_memory_used(%rip)	 ; _4, string_memory_used
 ; D:\TC\src\lib.c:118:     char* block = (char*)malloc(size);
	movq	16(%rbp), %rax	 ; size, tmp94
	movq	%rax, %rcx	 ; tmp94,
	call	malloc	 ;
	movq	%rax, -8(%rbp)	 ; tmp95, block
 ; D:\TC\src\lib.c:119:     fprintf(stderr, "Info: Allocate big memory block of size %zu bytes\n", size);
	call	__getreent	 ;
 ; D:\TC\src\lib.c:119:     fprintf(stderr, "Info: Allocate big memory block of size %zu bytes\n", size);
	movq	24(%rax), %rax	 ; _5->_stderr, _6
 ; D:\TC\src\lib.c:119:     fprintf(stderr, "Info: Allocate big memory block of size %zu bytes\n", size);
	movq	16(%rbp), %rdx	 ; size, tmp96
	movq	%rdx, %r8	 ; tmp96,
	leaq	.LC53(%rip), %rdx	 ;, tmp97
	movq	%rax, %rcx	 ; _6,
	call	fprintf	 ;
 ; D:\TC\src\lib.c:120:     if (block == NULL) {
	cmpq	$0, -8(%rbp)	 ;, block
	jne	.L9	 ;,
 ; D:\TC\src\lib.c:121:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	call	__getreent	 ;
 ; D:\TC\src\lib.c:121:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movq	24(%rax), %rax	 ; _7->_stderr, _8
 ; D:\TC\src\lib.c:121:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movq	%rax, %r9	 ; _8,
	movl	$30, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC52(%rip), %rax	 ;, tmp98
	movq	%rax, %rcx	 ; tmp98,
	call	fwrite	 ;
 ; D:\TC\src\lib.c:122:         exit(1);
	movl	$1, %ecx	 ;,
	call	exit	 ;
.L9:
 ; D:\TC\src\lib.c:124:     return block;
	movq	-8(%rbp), %rax	 ; block, _17
 ; D:\TC\src\lib.c:125: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.def	create_string_check;	.scl	3;	.type	32;	.endef
	.seh_proc	create_string_check
create_string_check:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$64, %rsp	 ;,
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; data, data
	movq	%rdx, 24(%rbp)	 ; length, length
	movl	%r8d, %eax	 ; check, tmp106
	movb	%al, 32(%rbp)	 ; tmp107, check
 ; D:\TC\src\lib.c:128:     if (!initialized) init();
	movzbl	initialized(%rip), %eax	 ; initialized, initialized.10_1
 ; D:\TC\src\lib.c:128:     if (!initialized) init();
	testb	%al, %al	 ; initialized.10_1
	jne	.L12	 ;,
 ; D:\TC\src\lib.c:128:     if (!initialized) init();
	call	init	 ;
.L12:
 ; D:\TC\src\lib.c:129:     if (data == NULL || length == 0) return 0;
	cmpq	$0, 16(%rbp)	 ;, data
	je	.L13	 ;,
 ; D:\TC\src\lib.c:129:     if (data == NULL || length == 0) return 0;
	cmpq	$0, 24(%rbp)	 ;, length
	jne	.L14	 ;,
.L13:
 ; D:\TC\src\lib.c:129:     if (data == NULL || length == 0) return 0;
	movl	$0, %eax	 ;, _27
 ; D:\TC\src\lib.c:129:     if (data == NULL || length == 0) return 0;
	jmp	.L15	 ;
.L14:
 ; D:\TC\src\lib.c:130:     if (check) {
	cmpb	$0, 32(%rbp)	 ;, check
	je	.L16	 ;,
 ; D:\TC\src\lib.c:131:         StringList* current = all_string_list;
	movq	all_string_list(%rip), %rax	 ; all_string_list, tmp108
	movq	%rax, -8(%rbp)	 ; tmp108, current
 ; D:\TC\src\lib.c:132:         string existing = NULL;
	movq	$0, -16(%rbp)	 ;, existing
 ; D:\TC\src\lib.c:133:         while (current != NULL) {
	jmp	.L17	 ;
.L19:
 ; D:\TC\src\lib.c:134:             if (current->length == length && current->str != 0 && strncmp(current->str, data, length) == 0)
	movq	-8(%rbp), %rax	 ; current, tmp109
	movq	8(%rax), %rax	 ; current_23->length, _2
 ; D:\TC\src\lib.c:134:             if (current->length == length && current->str != 0 && strncmp(current->str, data, length) == 0)
	cmpq	%rax, 24(%rbp)	 ; _2, length
	jne	.L18	 ;,
 ; D:\TC\src\lib.c:134:             if (current->length == length && current->str != 0 && strncmp(current->str, data, length) == 0)
	movq	-8(%rbp), %rax	 ; current, tmp110
	movq	(%rax), %rax	 ; current_23->str, _3
 ; D:\TC\src\lib.c:134:             if (current->length == length && current->str != 0 && strncmp(current->str, data, length) == 0)
	testq	%rax, %rax	 ; _3
	je	.L18	 ;,
 ; D:\TC\src\lib.c:134:             if (current->length == length && current->str != 0 && strncmp(current->str, data, length) == 0)
	movq	-8(%rbp), %rax	 ; current, tmp111
	movq	(%rax), %rax	 ; current_23->str, _4
 ; D:\TC\src\lib.c:134:             if (current->length == length && current->str != 0 && strncmp(current->str, data, length) == 0)
	movq	24(%rbp), %rcx	 ; length, tmp112
	movq	16(%rbp), %rdx	 ; data, tmp113
	movq	%rcx, %r8	 ; tmp112,
	movq	%rax, %rcx	 ; _4,
	call	strncmp	 ;
 ; D:\TC\src\lib.c:134:             if (current->length == length && current->str != 0 && strncmp(current->str, data, length) == 0)
	testl	%eax, %eax	 ; _5
	jne	.L18	 ;,
 ; D:\TC\src\lib.c:135:                 existing = current->str;
	movq	-8(%rbp), %rax	 ; current, tmp114
	movq	(%rax), %rax	 ; current_23->str, tmp115
	movq	%rax, -16(%rbp)	 ; tmp115, existing
.L18:
 ; D:\TC\src\lib.c:136:             current = current->next;
	movq	-8(%rbp), %rax	 ; current, tmp116
	movq	16(%rax), %rax	 ; current_23->next, tmp117
	movq	%rax, -8(%rbp)	 ; tmp117, current
.L17:
 ; D:\TC\src\lib.c:133:         while (current != NULL) {
	cmpq	$0, -8(%rbp)	 ;, current
	jne	.L19	 ;,
 ; D:\TC\src\lib.c:138:         if (existing != NULL)
	cmpq	$0, -16(%rbp)	 ;, existing
	je	.L16	 ;,
 ; D:\TC\src\lib.c:139:             return existing;
	movq	-16(%rbp), %rax	 ; existing, _27
	jmp	.L15	 ;
.L16:
 ; D:\TC\src\lib.c:142:     if (length >= defaultMemorySize - 1)
	cmpq	$1022, 24(%rbp)	 ;, length
	jbe	.L20	 ;,
 ; D:\TC\src\lib.c:143:         str = alloc_big_memory(length + 1);
	movq	24(%rbp), %rax	 ; length, tmp118
	addq	$1, %rax	 ;, _6
	movq	%rax, %rcx	 ; _6,
	call	alloc_big_memory	 ;
	movq	%rax, -24(%rbp)	 ; tmp119, str
	jmp	.L21	 ;
.L20:
 ; D:\TC\src\lib.c:145:         if (string_memory->used + length >= string_memory->size)
	movq	string_memory(%rip), %rax	 ; string_memory, string_memory.11_7
	movq	8(%rax), %rdx	 ; string_memory.11_7->used, _8
 ; D:\TC\src\lib.c:145:         if (string_memory->used + length >= string_memory->size)
	movq	24(%rbp), %rax	 ; length, tmp120
	addq	%rax, %rdx	 ; tmp120, _9
 ; D:\TC\src\lib.c:145:         if (string_memory->used + length >= string_memory->size)
	movq	string_memory(%rip), %rax	 ; string_memory, string_memory.12_10
	movq	(%rax), %rax	 ; string_memory.12_10->size, _11
 ; D:\TC\src\lib.c:145:         if (string_memory->used + length >= string_memory->size)
	cmpq	%rax, %rdx	 ; _11, _9
	jb	.L22	 ;,
 ; D:\TC\src\lib.c:146:             increase_memory_size(false);
	movl	$0, %ecx	 ;,
	call	increase_memory_size	 ;
.L22:
 ; D:\TC\src\lib.c:147:         str = &((char*)(string_memory->block))[string_memory->used];
	movq	string_memory(%rip), %rax	 ; string_memory, string_memory.13_12
	movq	24(%rax), %rdx	 ; string_memory.13_12->block, _13
 ; D:\TC\src\lib.c:147:         str = &((char*)(string_memory->block))[string_memory->used];
	movq	string_memory(%rip), %rax	 ; string_memory, string_memory.14_14
	movq	8(%rax), %rax	 ; string_memory.14_14->used, _15
 ; D:\TC\src\lib.c:147:         str = &((char*)(string_memory->block))[string_memory->used];
	addq	%rdx, %rax	 ; _13, tmp121
	movq	%rax, -24(%rbp)	 ; tmp121, str
 ; D:\TC\src\lib.c:148:         string_memory->used += length + 1;
	movq	string_memory(%rip), %rax	 ; string_memory, string_memory.15_16
	movq	8(%rax), %rdx	 ; string_memory.15_16->used, _17
 ; D:\TC\src\lib.c:148:         string_memory->used += length + 1;
	movq	24(%rbp), %rax	 ; length, tmp122
	addq	%rax, %rdx	 ; tmp122, _18
 ; D:\TC\src\lib.c:148:         string_memory->used += length + 1;
	movq	string_memory(%rip), %rax	 ; string_memory, string_memory.16_19
 ; D:\TC\src\lib.c:148:         string_memory->used += length + 1;
	addq	$1, %rdx	 ;, _20
	movq	%rdx, 8(%rax)	 ; _20, string_memory.16_19->used
.L21:
 ; D:\TC\src\lib.c:150:     strncpy(str, data, length);
	movq	24(%rbp), %rcx	 ; length, tmp123
	movq	16(%rbp), %rdx	 ; data, tmp124
	movq	-24(%rbp), %rax	 ; str, tmp125
	movq	%rcx, %r8	 ; tmp123,
	movq	%rax, %rcx	 ; tmp125,
	call	strncpy	 ;
 ; D:\TC\src\lib.c:151:     str[length] = '\0';
	movq	-24(%rbp), %rdx	 ; str, tmp126
	movq	24(%rbp), %rax	 ; length, tmp127
	addq	%rdx, %rax	 ; tmp126, _21
 ; D:\TC\src\lib.c:151:     str[length] = '\0';
	movb	$0, (%rax)	 ;, *_21
 ; D:\TC\src\lib.c:152:     StringList* new_str = (StringList*)alloc_memory(sizeof(StringList));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -32(%rbp)	 ; tmp128, new_str
 ; D:\TC\src\lib.c:153:     new_str->str = str;
	movq	-32(%rbp), %rax	 ; new_str, tmp129
	movq	-24(%rbp), %rdx	 ; str, tmp130
	movq	%rdx, (%rax)	 ; tmp130, new_str_50->str
 ; D:\TC\src\lib.c:154:     new_str->length = length;
	movq	-32(%rbp), %rax	 ; new_str, tmp131
	movq	24(%rbp), %rdx	 ; length, tmp132
	movq	%rdx, 8(%rax)	 ; tmp132, new_str_50->length
 ; D:\TC\src\lib.c:155:     new_str->next = all_string_list;
	movq	all_string_list(%rip), %rdx	 ; all_string_list, all_string_list.17_22
	movq	-32(%rbp), %rax	 ; new_str, tmp133
	movq	%rdx, 16(%rax)	 ; all_string_list.17_22, new_str_50->next
 ; D:\TC\src\lib.c:156:     all_string_list = new_str;
	movq	-32(%rbp), %rax	 ; new_str, tmp134
	movq	%rax, all_string_list(%rip)	 ; tmp134, all_string_list
 ; D:\TC\src\lib.c:157:     return str;
	movq	-24(%rbp), %rax	 ; str, _27
.L15:
 ; D:\TC\src\lib.c:158: }
	addq	$64, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	create_string
	.def	create_string;	.scl	2;	.type	32;	.endef
	.seh_proc	create_string
create_string:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$32, %rsp	 ;,
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; data, data
	movq	%rdx, 24(%rbp)	 ; length, length
 ; D:\TC\src\lib.c:161:     return create_string_check(data, length, true);
	movq	24(%rbp), %rdx	 ; length, tmp84
	movq	16(%rbp), %rax	 ; data, tmp85
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp85,
	call	create_string_check	 ;
 ; D:\TC\src\lib.c:162: }
	addq	$32, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	init
	.def	init;	.scl	2;	.type	32;	.endef
	.seh_proc	init
init:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$56, %rsp	 ;,
	.seh_stackalloc	56
	leaq	48(%rsp), %rbp	 ;,
	.seh_setframe	%rbp, 48
	.seh_endprologue
 ; D:\TC\src\lib.c:165:     if (initialized) return;
	movzbl	initialized(%rip), %eax	 ; initialized, initialized.18_1
 ; D:\TC\src\lib.c:165:     if (initialized) return;
	testb	%al, %al	 ; initialized.18_1
	jne	.L36	 ;,
 ; D:\TC\src\lib.c:166:     if (struct_memory == NULL) {
	movq	struct_memory(%rip), %rax	 ; struct_memory, struct_memory.19_2
 ; D:\TC\src\lib.c:166:     if (struct_memory == NULL) {
	testq	%rax, %rax	 ; struct_memory.19_2
	jne	.L28	 ;,
 ; D:\TC\src\lib.c:167:         struct_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movl	$32, %ecx	 ;,
	call	malloc	 ;
 ; D:\TC\src\lib.c:167:         struct_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movq	%rax, struct_memory(%rip)	 ; _3, struct_memory
 ; D:\TC\src\lib.c:168:         if (struct_memory == NULL) {
	movq	struct_memory(%rip), %rax	 ; struct_memory, struct_memory.20_4
 ; D:\TC\src\lib.c:168:         if (struct_memory == NULL) {
	testq	%rax, %rax	 ; struct_memory.20_4
	jne	.L29	 ;,
 ; D:\TC\src\lib.c:169:             fprintf(stderr, "Fatal: Cannot allocate memory\n");
	call	__getreent	 ;
 ; D:\TC\src\lib.c:169:             fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movq	24(%rax), %rax	 ; _5->_stderr, _6
 ; D:\TC\src\lib.c:169:             fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movq	%rax, %r9	 ; _6,
	movl	$30, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC52(%rip), %rax	 ;, tmp164
	movq	%rax, %rcx	 ; tmp164,
	call	fwrite	 ;
 ; D:\TC\src\lib.c:170:             initialized = false;
	movb	$0, initialized(%rip)	 ;, initialized
 ; D:\TC\src\lib.c:171:             exit(1);
	movl	$1, %ecx	 ;,
	call	exit	 ;
.L29:
 ; D:\TC\src\lib.c:173:         struct_memory->block = (size_t*)malloc(defaultMemorySize);
	movq	struct_memory(%rip), %rbx	 ; struct_memory, struct_memory.21_7
 ; D:\TC\src\lib.c:173:         struct_memory->block = (size_t*)malloc(defaultMemorySize);
	movl	$1024, %ecx	 ;,
	call	malloc	 ;
 ; D:\TC\src\lib.c:173:         struct_memory->block = (size_t*)malloc(defaultMemorySize);
	movq	%rax, 24(%rbx)	 ; _8, struct_memory.21_7->block
 ; D:\TC\src\lib.c:174:         struct_memory->size = defaultMemorySize;
	movq	struct_memory(%rip), %rax	 ; struct_memory, struct_memory.22_9
 ; D:\TC\src\lib.c:174:         struct_memory->size = defaultMemorySize;
	movq	$1024, (%rax)	 ;, struct_memory.22_9->size
 ; D:\TC\src\lib.c:175:         struct_memory->used = 0;
	movq	struct_memory(%rip), %rax	 ; struct_memory, struct_memory.23_10
 ; D:\TC\src\lib.c:175:         struct_memory->used = 0;
	movq	$0, 8(%rax)	 ;, struct_memory.23_10->used
 ; D:\TC\src\lib.c:176:         struct_memory->next = NULL;
	movq	struct_memory(%rip), %rax	 ; struct_memory, struct_memory.24_11
 ; D:\TC\src\lib.c:176:         struct_memory->next = NULL;
	movq	$0, 16(%rax)	 ;, struct_memory.24_11->next
 ; D:\TC\src\lib.c:177:         struct_memory_count = defaultMemorySize;
	movq	$1024, struct_memory_count(%rip)	 ;, struct_memory_count
.L28:
 ; D:\TC\src\lib.c:179:     if (string_memory == NULL) {
	movq	string_memory(%rip), %rax	 ; string_memory, string_memory.25_12
 ; D:\TC\src\lib.c:179:     if (string_memory == NULL) {
	testq	%rax, %rax	 ; string_memory.25_12
	jne	.L30	 ;,
 ; D:\TC\src\lib.c:180:         string_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movl	$32, %ecx	 ;,
	call	malloc	 ;
 ; D:\TC\src\lib.c:180:         string_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movq	%rax, string_memory(%rip)	 ; _13, string_memory
 ; D:\TC\src\lib.c:181:         if (string_memory == NULL) {
	movq	string_memory(%rip), %rax	 ; string_memory, string_memory.26_14
 ; D:\TC\src\lib.c:181:         if (string_memory == NULL) {
	testq	%rax, %rax	 ; string_memory.26_14
	jne	.L31	 ;,
 ; D:\TC\src\lib.c:182:             fprintf(stderr, "Fatal: Cannot allocate memory\n");
	call	__getreent	 ;
 ; D:\TC\src\lib.c:182:             fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movq	24(%rax), %rax	 ; _15->_stderr, _16
 ; D:\TC\src\lib.c:182:             fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movq	%rax, %r9	 ; _16,
	movl	$30, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC52(%rip), %rax	 ;, tmp167
	movq	%rax, %rcx	 ; tmp167,
	call	fwrite	 ;
 ; D:\TC\src\lib.c:183:             initialized = false;
	movb	$0, initialized(%rip)	 ;, initialized
 ; D:\TC\src\lib.c:184:             exit(1);
	movl	$1, %ecx	 ;,
	call	exit	 ;
.L31:
 ; D:\TC\src\lib.c:186:         string_memory->block = (pointer)malloc(defaultMemorySize);
	movq	string_memory(%rip), %rbx	 ; string_memory, string_memory.27_17
 ; D:\TC\src\lib.c:186:         string_memory->block = (pointer)malloc(defaultMemorySize);
	movl	$1024, %ecx	 ;,
	call	malloc	 ;
 ; D:\TC\src\lib.c:186:         string_memory->block = (pointer)malloc(defaultMemorySize);
	movq	%rax, 24(%rbx)	 ; _18, string_memory.27_17->block
 ; D:\TC\src\lib.c:187:         string_memory->size = defaultMemorySize;
	movq	string_memory(%rip), %rax	 ; string_memory, string_memory.28_19
 ; D:\TC\src\lib.c:187:         string_memory->size = defaultMemorySize;
	movq	$1024, (%rax)	 ;, string_memory.28_19->size
 ; D:\TC\src\lib.c:188:         string_memory->used = 0;
	movq	string_memory(%rip), %rax	 ; string_memory, string_memory.29_20
 ; D:\TC\src\lib.c:188:         string_memory->used = 0;
	movq	$0, 8(%rax)	 ;, string_memory.29_20->used
 ; D:\TC\src\lib.c:189:         string_memory->next = NULL;
	movq	string_memory(%rip), %rax	 ; string_memory, string_memory.30_21
 ; D:\TC\src\lib.c:189:         string_memory->next = NULL;
	movq	$0, 16(%rax)	 ;, string_memory.30_21->next
 ; D:\TC\src\lib.c:190:         string_memory_count = defaultMemorySize;
	movq	$1024, string_memory_count(%rip)	 ;, string_memory_count
.L30:
 ; D:\TC\src\lib.c:192:     initialized = true;
	movb	$1, initialized(%rip)	 ;, initialized
 ; D:\TC\src\lib.c:193:     for (size_t i = 0; i < keywordCount; ++i)
	movq	$0, -8(%rbp)	 ;, i
 ; D:\TC\src\lib.c:193:     for (size_t i = 0; i < keywordCount; ++i)
	jmp	.L32	 ;
.L33:
 ; D:\TC\src\lib.c:194:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), false);
	movq	-8(%rbp), %rax	 ; i, tmp169
	leaq	0(,%rax,8), %rdx	 ;, tmp170
	leaq	keywordStrings(%rip), %rax	 ;, tmp171
	movq	(%rdx,%rax), %rax	 ; keywordStrings[i_82], _22
	movq	%rax, %rcx	 ; _22,
	call	strlen	 ;
	movq	%rax, %rdx	 ;, _23
 ; D:\TC\src\lib.c:194:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), false);
	movq	-8(%rbp), %rax	 ; i, tmp172
	leaq	0(,%rax,8), %rcx	 ;, tmp173
	leaq	keywordStrings(%rip), %rax	 ;, tmp174
	movq	(%rcx,%rax), %rax	 ; keywordStrings[i_82], _24
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; _24,
	call	create_string_check	 ;
 ; D:\TC\src\lib.c:194:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), false);
	movq	-8(%rbp), %rdx	 ; i, tmp175
	leaq	0(,%rdx,8), %rcx	 ;, tmp176
	leaq	keywordList(%rip), %rdx	 ;, tmp177
	movq	%rax, (%rcx,%rdx)	 ; _25, keywordList[i_82]
 ; D:\TC\src\lib.c:193:     for (size_t i = 0; i < keywordCount; ++i)
	addq	$1, -8(%rbp)	 ;, i
.L32:
 ; D:\TC\src\lib.c:193:     for (size_t i = 0; i < keywordCount; ++i)
	cmpq	$21, -8(%rbp)	 ;, i
	jbe	.L33	 ;,
 ; D:\TC\src\lib.c:195:     for (size_t i = 0; i < symbolCount; ++i)
	movq	$0, -16(%rbp)	 ;, i
 ; D:\TC\src\lib.c:195:     for (size_t i = 0; i < symbolCount; ++i)
	jmp	.L34	 ;
.L35:
 ; D:\TC\src\lib.c:196:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), false);
	movq	-16(%rbp), %rax	 ; i, tmp178
	leaq	0(,%rax,8), %rdx	 ;, tmp179
	leaq	symbolStrings(%rip), %rax	 ;, tmp180
	movq	(%rdx,%rax), %rax	 ; symbolStrings[i_83], _26
	movq	%rax, %rcx	 ; _26,
	call	strlen	 ;
	movq	%rax, %rdx	 ;, _27
 ; D:\TC\src\lib.c:196:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), false);
	movq	-16(%rbp), %rax	 ; i, tmp181
	leaq	0(,%rax,8), %rcx	 ;, tmp182
	leaq	symbolStrings(%rip), %rax	 ;, tmp183
	movq	(%rcx,%rax), %rax	 ; symbolStrings[i_83], _28
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; _28,
	call	create_string_check	 ;
 ; D:\TC\src\lib.c:196:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), false);
	movq	-16(%rbp), %rdx	 ; i, tmp184
	leaq	0(,%rdx,8), %rcx	 ;, tmp185
	leaq	symbolList(%rip), %rdx	 ;, tmp186
	movq	%rax, (%rcx,%rdx)	 ; _29, symbolList[i_83]
 ; D:\TC\src\lib.c:195:     for (size_t i = 0; i < symbolCount; ++i)
	addq	$1, -16(%rbp)	 ;, i
.L34:
 ; D:\TC\src\lib.c:195:     for (size_t i = 0; i < symbolCount; ++i)
	cmpq	$29, -16(%rbp)	 ;, i
	jbe	.L35	 ;,
 ; D:\TC\src\lib.c:197:     IMPORT_KEYWORD = keywordList[0];
	movq	keywordList(%rip), %rax	 ; keywordList[0], _30
 ; D:\TC\src\lib.c:197:     IMPORT_KEYWORD = keywordList[0];
	movq	%rax, IMPORT_KEYWORD(%rip)	 ; _30, IMPORT_KEYWORD
 ; D:\TC\src\lib.c:198:     FROM_KEYWORD = keywordList[1];
	movq	8+keywordList(%rip), %rax	 ; keywordList[1], _31
 ; D:\TC\src\lib.c:198:     FROM_KEYWORD = keywordList[1];
	movq	%rax, FROM_KEYWORD(%rip)	 ; _31, FROM_KEYWORD
 ; D:\TC\src\lib.c:199:     FUNC_KEYWORD = keywordList[2];
	movq	16+keywordList(%rip), %rax	 ; keywordList[2], _32
 ; D:\TC\src\lib.c:199:     FUNC_KEYWORD = keywordList[2];
	movq	%rax, FUNC_KEYWORD(%rip)	 ; _32, FUNC_KEYWORD
 ; D:\TC\src\lib.c:200:     CLASS_KEYWORD = keywordList[3];
	movq	24+keywordList(%rip), %rax	 ; keywordList[3], _33
 ; D:\TC\src\lib.c:200:     CLASS_KEYWORD = keywordList[3];
	movq	%rax, CLASS_KEYWORD(%rip)	 ; _33, CLASS_KEYWORD
 ; D:\TC\src\lib.c:201:     METHOD_KEYWORD = keywordList[4];
	movq	32+keywordList(%rip), %rax	 ; keywordList[4], _34
 ; D:\TC\src\lib.c:201:     METHOD_KEYWORD = keywordList[4];
	movq	%rax, METHOD_KEYWORD(%rip)	 ; _34, METHOD_KEYWORD
 ; D:\TC\src\lib.c:202:     SELF_KEYWORD = keywordList[5];
	movq	40+keywordList(%rip), %rax	 ; keywordList[5], _35
 ; D:\TC\src\lib.c:202:     SELF_KEYWORD = keywordList[5];
	movq	%rax, SELF_KEYWORD(%rip)	 ; _35, SELF_KEYWORD
 ; D:\TC\src\lib.c:203:     IF_KEYWORD = keywordList[6];
	movq	48+keywordList(%rip), %rax	 ; keywordList[6], _36
 ; D:\TC\src\lib.c:203:     IF_KEYWORD = keywordList[6];
	movq	%rax, IF_KEYWORD(%rip)	 ; _36, IF_KEYWORD
 ; D:\TC\src\lib.c:204:     ELIF_KEYWORD = keywordList[7];
	movq	56+keywordList(%rip), %rax	 ; keywordList[7], _37
 ; D:\TC\src\lib.c:204:     ELIF_KEYWORD = keywordList[7];
	movq	%rax, ELIF_KEYWORD(%rip)	 ; _37, ELIF_KEYWORD
 ; D:\TC\src\lib.c:205:     ELSE_KEYWORD = keywordList[8];
	movq	64+keywordList(%rip), %rax	 ; keywordList[8], _38
 ; D:\TC\src\lib.c:205:     ELSE_KEYWORD = keywordList[8];
	movq	%rax, ELSE_KEYWORD(%rip)	 ; _38, ELSE_KEYWORD
 ; D:\TC\src\lib.c:206:     WHILE_KEYWORD = keywordList[9];
	movq	72+keywordList(%rip), %rax	 ; keywordList[9], _39
 ; D:\TC\src\lib.c:206:     WHILE_KEYWORD = keywordList[9];
	movq	%rax, WHILE_KEYWORD(%rip)	 ; _39, WHILE_KEYWORD
 ; D:\TC\src\lib.c:207:     FOR_KEYWORD = keywordList[10];
	movq	80+keywordList(%rip), %rax	 ; keywordList[10], _40
 ; D:\TC\src\lib.c:207:     FOR_KEYWORD = keywordList[10];
	movq	%rax, FOR_KEYWORD(%rip)	 ; _40, FOR_KEYWORD
 ; D:\TC\src\lib.c:208:     TRUE_KEYWORD = keywordList[11];
	movq	88+keywordList(%rip), %rax	 ; keywordList[11], _41
 ; D:\TC\src\lib.c:208:     TRUE_KEYWORD = keywordList[11];
	movq	%rax, TRUE_KEYWORD(%rip)	 ; _41, TRUE_KEYWORD
 ; D:\TC\src\lib.c:209:     FALSE_KEYWORD = keywordList[12];
	movq	96+keywordList(%rip), %rax	 ; keywordList[12], _42
 ; D:\TC\src\lib.c:209:     FALSE_KEYWORD = keywordList[12];
	movq	%rax, FALSE_KEYWORD(%rip)	 ; _42, FALSE_KEYWORD
 ; D:\TC\src\lib.c:210:     RETURN_KEYWORD = keywordList[13];
	movq	104+keywordList(%rip), %rax	 ; keywordList[13], _43
 ; D:\TC\src\lib.c:210:     RETURN_KEYWORD = keywordList[13];
	movq	%rax, RETURN_KEYWORD(%rip)	 ; _43, RETURN_KEYWORD
 ; D:\TC\src\lib.c:211:     BREAK_KEYWORD = keywordList[14];
	movq	112+keywordList(%rip), %rax	 ; keywordList[14], _44
 ; D:\TC\src\lib.c:211:     BREAK_KEYWORD = keywordList[14];
	movq	%rax, BREAK_KEYWORD(%rip)	 ; _44, BREAK_KEYWORD
 ; D:\TC\src\lib.c:212:     CONTINUE_KEYWORD = keywordList[15];
	movq	120+keywordList(%rip), %rax	 ; keywordList[15], _45
 ; D:\TC\src\lib.c:212:     CONTINUE_KEYWORD = keywordList[15];
	movq	%rax, CONTINUE_KEYWORD(%rip)	 ; _45, CONTINUE_KEYWORD
 ; D:\TC\src\lib.c:213:     INT_KEYWORD = keywordList[16];
	movq	128+keywordList(%rip), %rax	 ; keywordList[16], _46
 ; D:\TC\src\lib.c:213:     INT_KEYWORD = keywordList[16];
	movq	%rax, INT_KEYWORD(%rip)	 ; _46, INT_KEYWORD
 ; D:\TC\src\lib.c:214:     FLOAT_KEYWORD = keywordList[17];
	movq	136+keywordList(%rip), %rax	 ; keywordList[17], _47
 ; D:\TC\src\lib.c:214:     FLOAT_KEYWORD = keywordList[17];
	movq	%rax, FLOAT_KEYWORD(%rip)	 ; _47, FLOAT_KEYWORD
 ; D:\TC\src\lib.c:215:     STRING_KEYWORD = keywordList[18];
	movq	144+keywordList(%rip), %rax	 ; keywordList[18], _48
 ; D:\TC\src\lib.c:215:     STRING_KEYWORD = keywordList[18];
	movq	%rax, STRING_KEYWORD(%rip)	 ; _48, STRING_KEYWORD
 ; D:\TC\src\lib.c:216:     BOOL_KEYWORD = keywordList[19];
	movq	152+keywordList(%rip), %rax	 ; keywordList[19], _49
 ; D:\TC\src\lib.c:216:     BOOL_KEYWORD = keywordList[19];
	movq	%rax, BOOL_KEYWORD(%rip)	 ; _49, BOOL_KEYWORD
 ; D:\TC\src\lib.c:217:     VOID_KEYWORD = keywordList[20];
	movq	160+keywordList(%rip), %rax	 ; keywordList[20], _50
 ; D:\TC\src\lib.c:217:     VOID_KEYWORD = keywordList[20];
	movq	%rax, VOID_KEYWORD(%rip)	 ; _50, VOID_KEYWORD
 ; D:\TC\src\lib.c:218:     VAR_KEYWORD = keywordList[21];
	movq	168+keywordList(%rip), %rax	 ; keywordList[21], _51
 ; D:\TC\src\lib.c:218:     VAR_KEYWORD = keywordList[21];
	movq	%rax, VAR_KEYWORD(%rip)	 ; _51, VAR_KEYWORD
 ; D:\TC\src\lib.c:219:     L_PAREN_SYMBOL = symbolList[0];
	movq	symbolList(%rip), %rax	 ; symbolList[0], _52
 ; D:\TC\src\lib.c:219:     L_PAREN_SYMBOL = symbolList[0];
	movq	%rax, L_PAREN_SYMBOL(%rip)	 ; _52, L_PAREN_SYMBOL
 ; D:\TC\src\lib.c:220:     R_PAREN_SYMBOL = symbolList[1];
	movq	8+symbolList(%rip), %rax	 ; symbolList[1], _53
 ; D:\TC\src\lib.c:220:     R_PAREN_SYMBOL = symbolList[1];
	movq	%rax, R_PAREN_SYMBOL(%rip)	 ; _53, R_PAREN_SYMBOL
 ; D:\TC\src\lib.c:221:     L_BRACE_SYMBOL = symbolList[2];
	movq	16+symbolList(%rip), %rax	 ; symbolList[2], _54
 ; D:\TC\src\lib.c:221:     L_BRACE_SYMBOL = symbolList[2];
	movq	%rax, L_BRACE_SYMBOL(%rip)	 ; _54, L_BRACE_SYMBOL
 ; D:\TC\src\lib.c:222:     R_BRACE_SYMBOL = symbolList[3];
	movq	24+symbolList(%rip), %rax	 ; symbolList[3], _55
 ; D:\TC\src\lib.c:222:     R_BRACE_SYMBOL = symbolList[3];
	movq	%rax, R_BRACE_SYMBOL(%rip)	 ; _55, R_BRACE_SYMBOL
 ; D:\TC\src\lib.c:223:     COMMA_SYMBOL = symbolList[4];
	movq	32+symbolList(%rip), %rax	 ; symbolList[4], _56
 ; D:\TC\src\lib.c:223:     COMMA_SYMBOL = symbolList[4];
	movq	%rax, COMMA_SYMBOL(%rip)	 ; _56, COMMA_SYMBOL
 ; D:\TC\src\lib.c:224:     NOT_SYMBOL = symbolList[5];
	movq	40+symbolList(%rip), %rax	 ; symbolList[5], _57
 ; D:\TC\src\lib.c:224:     NOT_SYMBOL = symbolList[5];
	movq	%rax, NOT_SYMBOL(%rip)	 ; _57, NOT_SYMBOL
 ; D:\TC\src\lib.c:225:     DOT_SYMBOL = symbolList[6];
	movq	48+symbolList(%rip), %rax	 ; symbolList[6], _58
 ; D:\TC\src\lib.c:225:     DOT_SYMBOL = symbolList[6];
	movq	%rax, DOT_SYMBOL(%rip)	 ; _58, DOT_SYMBOL
 ; D:\TC\src\lib.c:226:     L_BRACKET_SYMBOL = symbolList[7];
	movq	56+symbolList(%rip), %rax	 ; symbolList[7], _59
 ; D:\TC\src\lib.c:226:     L_BRACKET_SYMBOL = symbolList[7];
	movq	%rax, L_BRACKET_SYMBOL(%rip)	 ; _59, L_BRACKET_SYMBOL
 ; D:\TC\src\lib.c:227:     R_BRACKET_SYMBOL = symbolList[8];
	movq	64+symbolList(%rip), %rax	 ; symbolList[8], _60
 ; D:\TC\src\lib.c:227:     R_BRACKET_SYMBOL = symbolList[8];
	movq	%rax, R_BRACKET_SYMBOL(%rip)	 ; _60, R_BRACKET_SYMBOL
 ; D:\TC\src\lib.c:228:     SEMICOLON_SYMBOL = symbolList[9];
	movq	72+symbolList(%rip), %rax	 ; symbolList[9], _61
 ; D:\TC\src\lib.c:228:     SEMICOLON_SYMBOL = symbolList[9];
	movq	%rax, SEMICOLON_SYMBOL(%rip)	 ; _61, SEMICOLON_SYMBOL
 ; D:\TC\src\lib.c:229:     UNDERLINE_SYMBOL = symbolList[10];
	movq	80+symbolList(%rip), %rax	 ; symbolList[10], _62
 ; D:\TC\src\lib.c:229:     UNDERLINE_SYMBOL = symbolList[10];
	movq	%rax, UNDERLINE_SYMBOL(%rip)	 ; _62, UNDERLINE_SYMBOL
 ; D:\TC\src\lib.c:230:     ADD_SYMBOL = symbolList[11];
	movq	88+symbolList(%rip), %rax	 ; symbolList[11], _63
 ; D:\TC\src\lib.c:230:     ADD_SYMBOL = symbolList[11];
	movq	%rax, ADD_SYMBOL(%rip)	 ; _63, ADD_SYMBOL
 ; D:\TC\src\lib.c:231:     SUB_SYMBOL = symbolList[12];
	movq	96+symbolList(%rip), %rax	 ; symbolList[12], _64
 ; D:\TC\src\lib.c:231:     SUB_SYMBOL = symbolList[12];
	movq	%rax, SUB_SYMBOL(%rip)	 ; _64, SUB_SYMBOL
 ; D:\TC\src\lib.c:232:     MUL_SYMBOL = symbolList[13];
	movq	104+symbolList(%rip), %rax	 ; symbolList[13], _65
 ; D:\TC\src\lib.c:232:     MUL_SYMBOL = symbolList[13];
	movq	%rax, MUL_SYMBOL(%rip)	 ; _65, MUL_SYMBOL
 ; D:\TC\src\lib.c:233:     DIV_SYMBOL = symbolList[14];
	movq	112+symbolList(%rip), %rax	 ; symbolList[14], _66
 ; D:\TC\src\lib.c:233:     DIV_SYMBOL = symbolList[14];
	movq	%rax, DIV_SYMBOL(%rip)	 ; _66, DIV_SYMBOL
 ; D:\TC\src\lib.c:234:     MOD_SYMBOL = symbolList[15];
	movq	120+symbolList(%rip), %rax	 ; symbolList[15], _67
 ; D:\TC\src\lib.c:234:     MOD_SYMBOL = symbolList[15];
	movq	%rax, MOD_SYMBOL(%rip)	 ; _67, MOD_SYMBOL
 ; D:\TC\src\lib.c:235:     LT_SYMBOL = symbolList[16];
	movq	128+symbolList(%rip), %rax	 ; symbolList[16], _68
 ; D:\TC\src\lib.c:235:     LT_SYMBOL = symbolList[16];
	movq	%rax, LT_SYMBOL(%rip)	 ; _68, LT_SYMBOL
 ; D:\TC\src\lib.c:236:     GT_SYMBOL = symbolList[17];
	movq	136+symbolList(%rip), %rax	 ; symbolList[17], _69
 ; D:\TC\src\lib.c:236:     GT_SYMBOL = symbolList[17];
	movq	%rax, GT_SYMBOL(%rip)	 ; _69, GT_SYMBOL
 ; D:\TC\src\lib.c:237:     ASSIGN_SYMBOL = symbolList[18];
	movq	144+symbolList(%rip), %rax	 ; symbolList[18], _70
 ; D:\TC\src\lib.c:237:     ASSIGN_SYMBOL = symbolList[18];
	movq	%rax, ASSIGN_SYMBOL(%rip)	 ; _70, ASSIGN_SYMBOL
 ; D:\TC\src\lib.c:238:     EQ_SYMBOL = symbolList[19];
	movq	152+symbolList(%rip), %rax	 ; symbolList[19], _71
 ; D:\TC\src\lib.c:238:     EQ_SYMBOL = symbolList[19];
	movq	%rax, EQ_SYMBOL(%rip)	 ; _71, EQ_SYMBOL
 ; D:\TC\src\lib.c:239:     NE_SYMBOL = symbolList[20];
	movq	160+symbolList(%rip), %rax	 ; symbolList[20], _72
 ; D:\TC\src\lib.c:239:     NE_SYMBOL = symbolList[20];
	movq	%rax, NE_SYMBOL(%rip)	 ; _72, NE_SYMBOL
 ; D:\TC\src\lib.c:240:     LE_SYMBOL = symbolList[21];
	movq	168+symbolList(%rip), %rax	 ; symbolList[21], _73
 ; D:\TC\src\lib.c:240:     LE_SYMBOL = symbolList[21];
	movq	%rax, LE_SYMBOL(%rip)	 ; _73, LE_SYMBOL
 ; D:\TC\src\lib.c:241:     GE_SYMBOL = symbolList[22];
	movq	176+symbolList(%rip), %rax	 ; symbolList[22], _74
 ; D:\TC\src\lib.c:241:     GE_SYMBOL = symbolList[22];
	movq	%rax, GE_SYMBOL(%rip)	 ; _74, GE_SYMBOL
 ; D:\TC\src\lib.c:242:     ADD_ASSIGN_SYMBOL = symbolList[23];
	movq	184+symbolList(%rip), %rax	 ; symbolList[23], _75
 ; D:\TC\src\lib.c:242:     ADD_ASSIGN_SYMBOL = symbolList[23];
	movq	%rax, ADD_ASSIGN_SYMBOL(%rip)	 ; _75, ADD_ASSIGN_SYMBOL
 ; D:\TC\src\lib.c:243:     SUB_ASSIGN_SYMBOL = symbolList[24];
	movq	192+symbolList(%rip), %rax	 ; symbolList[24], _76
 ; D:\TC\src\lib.c:243:     SUB_ASSIGN_SYMBOL = symbolList[24];
	movq	%rax, SUB_ASSIGN_SYMBOL(%rip)	 ; _76, SUB_ASSIGN_SYMBOL
 ; D:\TC\src\lib.c:244:     MUL_ASSIGN_SYMBOL = symbolList[25];
	movq	200+symbolList(%rip), %rax	 ; symbolList[25], _77
 ; D:\TC\src\lib.c:244:     MUL_ASSIGN_SYMBOL = symbolList[25];
	movq	%rax, MUL_ASSIGN_SYMBOL(%rip)	 ; _77, MUL_ASSIGN_SYMBOL
 ; D:\TC\src\lib.c:245:     DIV_ASSIGN_SYMBOL = symbolList[26];
	movq	208+symbolList(%rip), %rax	 ; symbolList[26], _78
 ; D:\TC\src\lib.c:245:     DIV_ASSIGN_SYMBOL = symbolList[26];
	movq	%rax, DIV_ASSIGN_SYMBOL(%rip)	 ; _78, DIV_ASSIGN_SYMBOL
 ; D:\TC\src\lib.c:246:     MOD_ASSIGN_SYMBOL = symbolList[27];
	movq	216+symbolList(%rip), %rax	 ; symbolList[27], _79
 ; D:\TC\src\lib.c:246:     MOD_ASSIGN_SYMBOL = symbolList[27];
	movq	%rax, MOD_ASSIGN_SYMBOL(%rip)	 ; _79, MOD_ASSIGN_SYMBOL
 ; D:\TC\src\lib.c:247:     AND_SYMBOL = symbolList[28];
	movq	224+symbolList(%rip), %rax	 ; symbolList[28], _80
 ; D:\TC\src\lib.c:247:     AND_SYMBOL = symbolList[28];
	movq	%rax, AND_SYMBOL(%rip)	 ; _80, AND_SYMBOL
 ; D:\TC\src\lib.c:248:     OR_SYMBOL = symbolList[29];
	movq	232+symbolList(%rip), %rax	 ; symbolList[29], _81
 ; D:\TC\src\lib.c:248:     OR_SYMBOL = symbolList[29];
	movq	%rax, OR_SYMBOL(%rip)	 ; _81, OR_SYMBOL
	jmp	.L25	 ;
.L36:
 ; D:\TC\src\lib.c:165:     if (initialized) return;
	nop	
.L25:
 ; D:\TC\src\lib.c:249: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rbp	 ;
	ret	
	.seh_endproc
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
	.seh_proc	alloc_memory
alloc_memory:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; size, size
 ; D:\TC\src\lib.c:254:     if (!initialized) init();
	movzbl	initialized(%rip), %eax	 ; initialized, initialized.31_1
 ; D:\TC\src\lib.c:254:     if (!initialized) init();
	testb	%al, %al	 ; initialized.31_1
	jne	.L38	 ;,
 ; D:\TC\src\lib.c:254:     if (!initialized) init();
	call	init	 ;
.L38:
 ; D:\TC\src\lib.c:255:     if (struct_memory->used + size >= struct_memory->size)
	movq	struct_memory(%rip), %rax	 ; struct_memory, struct_memory.32_2
	movq	8(%rax), %rdx	 ; struct_memory.32_2->used, _3
 ; D:\TC\src\lib.c:255:     if (struct_memory->used + size >= struct_memory->size)
	movq	16(%rbp), %rax	 ; size, tmp105
	addq	%rax, %rdx	 ; tmp105, _4
 ; D:\TC\src\lib.c:255:     if (struct_memory->used + size >= struct_memory->size)
	movq	struct_memory(%rip), %rax	 ; struct_memory, struct_memory.33_5
	movq	(%rax), %rax	 ; struct_memory.33_5->size, _6
 ; D:\TC\src\lib.c:255:     if (struct_memory->used + size >= struct_memory->size)
	cmpq	%rax, %rdx	 ; _6, _4
	jb	.L39	 ;,
 ; D:\TC\src\lib.c:256:         increase_memory_size(true);
	movl	$1, %ecx	 ;,
	call	increase_memory_size	 ;
.L39:
 ; D:\TC\src\lib.c:257:     size = (size + ALIGN_SIZE - 1) & ~(ALIGN_SIZE - 1);
	movq	16(%rbp), %rax	 ; size, tmp106
	addq	$7, %rax	 ;, _7
 ; D:\TC\src\lib.c:257:     size = (size + ALIGN_SIZE - 1) & ~(ALIGN_SIZE - 1);
	andq	$-8, %rax	 ;, tmp107
	movq	%rax, 16(%rbp)	 ; tmp107, size
 ; D:\TC\src\lib.c:258:     assert(struct_memory->used % ALIGN_SIZE == 0);
	movq	struct_memory(%rip), %rax	 ; struct_memory, struct_memory.34_8
	movq	8(%rax), %rax	 ; struct_memory.34_8->used, _9
	andl	$7, %eax	 ;, _10
	testq	%rax, %rax	 ; _10
	je	.L40	 ;,
 ; D:\TC\src\lib.c:258:     assert(struct_memory->used % ALIGN_SIZE == 0);
	leaq	.LC54(%rip), %r9	 ;,
	leaq	__func__.0(%rip), %r8	 ;,
	movl	$258, %edx	 ;,
	leaq	.LC55(%rip), %rax	 ;, tmp108
	movq	%rax, %rcx	 ; tmp108,
	call	__assert_func	 ;
.L40:
 ; D:\TC\src\lib.c:259:     size_t* ptr = struct_memory->block + (struct_memory->used / ALIGN_SIZE);
	movq	struct_memory(%rip), %rax	 ; struct_memory, struct_memory.35_11
	movq	24(%rax), %rdx	 ; struct_memory.35_11->block, _12
 ; D:\TC\src\lib.c:259:     size_t* ptr = struct_memory->block + (struct_memory->used / ALIGN_SIZE);
	movq	struct_memory(%rip), %rax	 ; struct_memory, struct_memory.36_13
	movq	8(%rax), %rax	 ; struct_memory.36_13->used, _14
 ; D:\TC\src\lib.c:259:     size_t* ptr = struct_memory->block + (struct_memory->used / ALIGN_SIZE);
	andq	$-8, %rax	 ;, _15
 ; D:\TC\src\lib.c:259:     size_t* ptr = struct_memory->block + (struct_memory->used / ALIGN_SIZE);
	addq	%rdx, %rax	 ; _12, tmp109
	movq	%rax, -8(%rbp)	 ; tmp109, ptr
 ; D:\TC\src\lib.c:260:     struct_memory->used += size;
	movq	struct_memory(%rip), %rax	 ; struct_memory, struct_memory.37_16
	movq	8(%rax), %rcx	 ; struct_memory.37_16->used, _17
	movq	struct_memory(%rip), %rax	 ; struct_memory, struct_memory.38_18
 ; D:\TC\src\lib.c:260:     struct_memory->used += size;
	movq	16(%rbp), %rdx	 ; size, tmp110
	addq	%rcx, %rdx	 ; _17, _19
	movq	%rdx, 8(%rax)	 ; _19, struct_memory.38_18->used
 ; D:\TC\src\lib.c:261:     ++memoryBlockCount;
	movq	memoryBlockCount(%rip), %rax	 ; memoryBlockCount, memoryBlockCount.39_20
	addq	$1, %rax	 ;, _21
	movq	%rax, memoryBlockCount(%rip)	 ; _21, memoryBlockCount
 ; D:\TC\src\lib.c:262:     return ptr;
	movq	-8(%rbp), %rax	 ; ptr, _32
 ; D:\TC\src\lib.c:263: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	is_keyword
	.def	is_keyword;	.scl	2;	.type	32;	.endef
	.seh_proc	is_keyword
is_keyword:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; str, str
 ; D:\TC\src\lib.c:266:     if (!initialized) init();
	movzbl	initialized(%rip), %eax	 ; initialized, initialized.40_1
 ; D:\TC\src\lib.c:266:     if (!initialized) init();
	testb	%al, %al	 ; initialized.40_1
	jne	.L43	 ;,
 ; D:\TC\src\lib.c:266:     if (!initialized) init();
	call	init	 ;
.L43:
 ; D:\TC\src\lib.c:267:     for (size_t i = 0; i < keywordCount; ++i)
	movq	$0, -8(%rbp)	 ;, i
 ; D:\TC\src\lib.c:267:     for (size_t i = 0; i < keywordCount; ++i)
	jmp	.L44	 ;
.L47:
 ; D:\TC\src\lib.c:268:         if (string_equal(str, keywordList[i]))
	movq	-8(%rbp), %rax	 ; i, tmp87
	leaq	0(,%rax,8), %rdx	 ;, tmp88
	leaq	keywordList(%rip), %rax	 ;, tmp89
	movq	(%rdx,%rax), %rdx	 ; keywordList[i_4], _2
	movq	16(%rbp), %rax	 ; str, tmp90
	movq	%rax, %rcx	 ; tmp90,
	call	string_equal	 ;
 ; D:\TC\src\lib.c:268:         if (string_equal(str, keywordList[i]))
	testb	%al, %al	 ; _3
	je	.L45	 ;,
 ; D:\TC\src\lib.c:269:             return true;
	movl	$1, %eax	 ;, _5
	jmp	.L46	 ;
.L45:
 ; D:\TC\src\lib.c:267:     for (size_t i = 0; i < keywordCount; ++i)
	addq	$1, -8(%rbp)	 ;, i
.L44:
 ; D:\TC\src\lib.c:267:     for (size_t i = 0; i < keywordCount; ++i)
	cmpq	$21, -8(%rbp)	 ;, i
	jbe	.L47	 ;,
 ; D:\TC\src\lib.c:270:     return false;
	movl	$0, %eax	 ;, _5
.L46:
 ; D:\TC\src\lib.c:271: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	string_equal
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.seh_proc	string_equal
string_equal:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; a, a
	movq	%rdx, 24(%rbp)	 ; b, b
 ; D:\TC\src\lib.c:274:     return a == b;
	movq	16(%rbp), %rax	 ; a, tmp85
	cmpq	24(%rbp), %rax	 ; b, tmp85
	sete	%al	 ;, _1
 ; D:\TC\src\lib.c:275: }
	popq	%rbp	 ;
	ret	
	.seh_endproc
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
	.seh_proc	get_info
get_info:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$112, %rsp	 ;,
	.seh_stackalloc	112
	.seh_endprologue
 ; D:\TC\src\lib.c:278:     size_t stringCount = 0;
	movq	$0, -8(%rbp)	 ;, stringCount
 ; D:\TC\src\lib.c:279:     StringList* current = all_string_list;
	movq	all_string_list(%rip), %rax	 ; all_string_list, tmp95
	movq	%rax, -16(%rbp)	 ; tmp95, current
 ; D:\TC\src\lib.c:280:     while (current != NULL) {
	jmp	.L51	 ;
.L52:
 ; D:\TC\src\lib.c:281:         stringCount++;
	addq	$1, -8(%rbp)	 ;, stringCount
 ; D:\TC\src\lib.c:282:         current = current->next;
	movq	-16(%rbp), %rax	 ; current, tmp96
	movq	16(%rax), %rax	 ; current_13->next, tmp97
	movq	%rax, -16(%rbp)	 ; tmp97, current
.L51:
 ; D:\TC\src\lib.c:280:     while (current != NULL) {
	cmpq	$0, -16(%rbp)	 ;, current
	jne	.L52	 ;,
 ; D:\TC\src\lib.c:285:     string struct_memory_used_str = create_string_check("", 48, false);
	movl	$0, %r8d	 ;,
	movl	$48, %edx	 ;,
	leaq	.LC56(%rip), %rax	 ;, tmp98
	movq	%rax, %rcx	 ; tmp98,
	call	create_string_check	 ;
	movq	%rax, -24(%rbp)	 ; tmp99, struct_memory_used_str
 ; D:\TC\src\lib.c:286:     sprintf(struct_memory_used_str, "%zu/%zu bytes", struct_memory_used + struct_memory->used, struct_memory_count);
	movq	struct_memory_count(%rip), %rcx	 ; struct_memory_count, struct_memory_count.41_1
 ; D:\TC\src\lib.c:286:     sprintf(struct_memory_used_str, "%zu/%zu bytes", struct_memory_used + struct_memory->used, struct_memory_count);
	movq	struct_memory(%rip), %rax	 ; struct_memory, struct_memory.42_2
	movq	8(%rax), %rdx	 ; struct_memory.42_2->used, _3
 ; D:\TC\src\lib.c:286:     sprintf(struct_memory_used_str, "%zu/%zu bytes", struct_memory_used + struct_memory->used, struct_memory_count);
	movq	struct_memory_used(%rip), %rax	 ; struct_memory_used, struct_memory_used.43_4
	addq	%rax, %rdx	 ; struct_memory_used.43_4, _5
	movq	-24(%rbp), %rax	 ; struct_memory_used_str, tmp100
	movq	%rcx, %r9	 ; struct_memory_count.41_1,
	movq	%rdx, %r8	 ; _5,
	leaq	.LC57(%rip), %rdx	 ;, tmp101
	movq	%rax, %rcx	 ; tmp100,
	call	sprintf	 ;
 ; D:\TC\src\lib.c:288:     string string_memory_used_str = create_string_check("", 48, false);
	movl	$0, %r8d	 ;,
	movl	$48, %edx	 ;,
	leaq	.LC56(%rip), %rax	 ;, tmp102
	movq	%rax, %rcx	 ; tmp102,
	call	create_string_check	 ;
	movq	%rax, -32(%rbp)	 ; tmp103, string_memory_used_str
 ; D:\TC\src\lib.c:289:     sprintf(string_memory_used_str, "%zu/%zu bytes", string_memory_used + string_memory->used, string_memory_count);
	movq	string_memory_count(%rip), %rcx	 ; string_memory_count, string_memory_count.44_6
 ; D:\TC\src\lib.c:289:     sprintf(string_memory_used_str, "%zu/%zu bytes", string_memory_used + string_memory->used, string_memory_count);
	movq	string_memory(%rip), %rax	 ; string_memory, string_memory.45_7
	movq	8(%rax), %rdx	 ; string_memory.45_7->used, _8
 ; D:\TC\src\lib.c:289:     sprintf(string_memory_used_str, "%zu/%zu bytes", string_memory_used + string_memory->used, string_memory_count);
	movq	string_memory_used(%rip), %rax	 ; string_memory_used, string_memory_used.46_9
	addq	%rax, %rdx	 ; string_memory_used.46_9, _10
	movq	-32(%rbp), %rax	 ; string_memory_used_str, tmp104
	movq	%rcx, %r9	 ; string_memory_count.44_6,
	movq	%rdx, %r8	 ; _10,
	leaq	.LC57(%rip), %rdx	 ;, tmp105
	movq	%rax, %rcx	 ; tmp104,
	call	sprintf	 ;
 ; D:\TC\src\lib.c:291:     string info = (string)create_string_check("", 240, false);
	movl	$0, %r8d	 ;,
	movl	$240, %edx	 ;,
	leaq	.LC56(%rip), %rax	 ;, tmp106
	movq	%rax, %rcx	 ; tmp106,
	call	create_string_check	 ;
	movq	%rax, -40(%rbp)	 ; tmp107, info
 ; D:\TC\src\lib.c:292:     sprintf(info, "Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu", PLATFORM, struct_memory_used_str, string_memory_used_str, stringCount, memoryBlockCount);
	movq	memoryBlockCount(%rip), %rdx	 ; memoryBlockCount, memoryBlockCount.47_11
	movq	-24(%rbp), %rcx	 ; struct_memory_used_str, tmp108
	movq	-40(%rbp), %rax	 ; info, tmp109
	movq	%rdx, 48(%rsp)	 ; memoryBlockCount.47_11,
	movq	-8(%rbp), %rdx	 ; stringCount, tmp110
	movq	%rdx, 40(%rsp)	 ; tmp110,
	movq	-32(%rbp), %rdx	 ; string_memory_used_str, tmp111
	movq	%rdx, 32(%rsp)	 ; tmp111,
	movq	%rcx, %r9	 ; tmp108,
	movl	$2, %r8d	 ;,
	leaq	.LC58(%rip), %rdx	 ;, tmp112
	movq	%rax, %rcx	 ; tmp109,
	call	sprintf	 ;
 ; D:\TC\src\lib.c:293:     return info;
	movq	-40(%rbp), %rax	 ; info, _26
 ; D:\TC\src\lib.c:294: }
	addq	$112, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
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
