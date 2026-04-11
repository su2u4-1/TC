	.file	"all.c"
	.text
.lcomm initialized,1,1
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
.lcomm string_memory,8,8
.lcomm struct_memory,8,8
.lcomm memoryBlockCount,8,8
.lcomm string_memory_count,8,8
.lcomm string_memory_used,8,8
.lcomm struct_memory_count,8,8
.lcomm struct_memory_used,8,8
.lcomm DEFAULT_CONSTRUCTOR_NAME,8,8
.lcomm DEFAULT_INIT_NAME,8,8
.lcomm keywordList,176,32
.lcomm symbolList,240,32
.lcomm all_string_list,8,8
.lcomm name_bool,8,8
.lcomm name_float,8,8
.lcomm name_int,8,8
.lcomm name_string,8,8
.lcomm name_void,8,8
.lcomm builtin_scope,8,8
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
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
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
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	16(%rbp), %rax
	movq	%rax, %r8
	leaq	.LC53(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	cmpq	$0, -8(%rbp)
	jne	.L9
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
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
	.def	create_memory_block;	.scl	3;	.type	32;	.endef
create_memory_block:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movl	$32, %ecx
	call	malloc
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L24
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$30, %r8d
	movl	$1, %edx
	leaq	.LC52(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movb	$0, initialized(%rip)
	movl	$1, %ecx
	call	exit
.L24:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	malloc
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 24(%rax)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.section .rdata,"dr"
.LC54:
	.ascii "init\0"
.LC55:
	.ascii "$constructor\0"
	.text
	.def	init;	.scl	3;	.type	32;	.endef
init:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movzbl	initialized(%rip), %eax
	testb	%al, %al
	jne	.L35
	movq	struct_memory(%rip), %rax
	testq	%rax, %rax
	jne	.L29
	movl	$1024, %ecx
	call	create_memory_block
	movq	%rax, struct_memory(%rip)
	movq	$1024, struct_memory_count(%rip)
.L29:
	movq	string_memory(%rip), %rax
	testq	%rax, %rax
	jne	.L30
	movl	$1024, %ecx
	call	create_memory_block
	movq	%rax, string_memory(%rip)
	movq	$1024, string_memory_count(%rip)
.L30:
	movb	$1, initialized(%rip)
	movq	$0, -8(%rbp)
	jmp	.L31
.L32:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	keywordStrings(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	leaq	keywordStrings(%rip), %rax
	movq	(%rcx,%rax), %rax
	movl	$0, %r8d
	movq	%rax, %rcx
	call	create_string_check
	movq	-8(%rbp), %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	keywordList(%rip), %rdx
	movq	%rax, (%rcx,%rdx)
	addq	$1, -8(%rbp)
.L31:
	cmpq	$21, -8(%rbp)
	jbe	.L32
	movq	$0, -16(%rbp)
	jmp	.L33
.L34:
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	symbolStrings(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	leaq	symbolStrings(%rip), %rax
	movq	(%rcx,%rax), %rax
	movl	$0, %r8d
	movq	%rax, %rcx
	call	create_string_check
	movq	-16(%rbp), %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	symbolList(%rip), %rdx
	movq	%rax, (%rcx,%rdx)
	addq	$1, -16(%rbp)
.L33:
	cmpq	$29, -16(%rbp)
	jbe	.L34
	movl	$0, %r8d
	movl	$4, %edx
	leaq	.LC54(%rip), %rax
	movq	%rax, %rcx
	call	create_string_check
	movq	%rax, DEFAULT_INIT_NAME(%rip)
	movl	$0, %r8d
	movl	$13, %edx
	leaq	.LC55(%rip), %rax
	movq	%rax, %rcx
	call	create_string_check
	movq	%rax, DEFAULT_CONSTRUCTOR_NAME(%rip)
	jmp	.L26
.L35:
	nop
.L26:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC56:
	.ascii "Fatal: Memory allocation is not aligned, used: %zu bytes\12\0"
	.text
	.def	alloc_memory;	.scl	3;	.type	32;	.endef
alloc_memory:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$56, %rsp
	movq	%rcx, 16(%rbp)
	movzbl	initialized(%rip), %eax
	testb	%al, %al
	jne	.L37
	call	init
.L37:
	movq	16(%rbp), %rax
	addq	$7, %rax
	andq	$-8, %rax
	movq	%rax, 16(%rbp)
	movq	struct_memory(%rip), %rax
	movq	8(%rax), %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movq	struct_memory(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jb	.L38
	movl	$1, %ecx
	call	increase_memory_size
.L38:
	movq	struct_memory(%rip), %rax
	movq	8(%rax), %rax
	andl	$7, %eax
	testq	%rax, %rax
	je	.L39
	movq	struct_memory(%rip), %rax
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, %r8
	leaq	.LC56(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movb	$0, initialized(%rip)
	movl	$1, %ecx
	call	exit
.L39:
	movq	struct_memory(%rip), %rax
	movq	24(%rax), %rdx
	movq	struct_memory(%rip), %rax
	movq	8(%rax), %rax
	andq	$-8, %rax
	addq	%rdx, %rax
	movq	%rax, -24(%rbp)
	movq	struct_memory(%rip), %rax
	movq	8(%rax), %rcx
	movq	struct_memory(%rip), %rax
	movq	16(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rdx, 8(%rax)
	movq	memoryBlockCount(%rip), %rax
	addq	$1, %rax
	movq	%rax, memoryBlockCount(%rip)
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rbx
	leave
	ret
	.def	is_keyword;	.scl	3;	.type	32;	.endef
is_keyword:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movzbl	initialized(%rip), %eax
	testb	%al, %al
	jne	.L42
	call	init
.L42:
	movq	$0, -8(%rbp)
	jmp	.L43
.L46:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	keywordList(%rip), %rax
	movq	(%rdx,%rax), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L44
	movl	$1, %eax
	jmp	.L45
.L44:
	addq	$1, -8(%rbp)
.L43:
	cmpq	$21, -8(%rbp)
	jbe	.L46
	movl	$0, %eax
.L45:
	leave
	ret
	.section .rdata,"dr"
.LC57:
	.ascii "\0"
.LC58:
	.ascii "%zu/%zu bytes\0"
	.align 8
.LC59:
	.ascii "Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu\0"
	.text
	.def	get_info;	.scl	3;	.type	32;	.endef
get_info:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$112, %rsp
	movq	$0, -8(%rbp)
	movq	all_string_list(%rip), %rax
	movq	%rax, -16(%rbp)
	jmp	.L48
.L49:
	addq	$1, -8(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -16(%rbp)
.L48:
	cmpq	$0, -16(%rbp)
	jne	.L49
	movl	$0, %r8d
	movl	$48, %edx
	leaq	.LC57(%rip), %rax
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
	leaq	.LC58(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movl	$0, %r8d
	movl	$48, %edx
	leaq	.LC57(%rip), %rax
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
	leaq	.LC58(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movl	$0, %r8d
	movl	$240, %edx
	leaq	.LC57(%rip), %rax
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
	leaq	.LC59(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movq	-40(%rbp), %rax
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC60:
	.ascii "Error creating code member: content is NULL\12\0"
	.align 8
.LC61:
	.ascii "Error creating code member: unknown type %u\12\0"
	.text
	.def	create_code_member;	.scl	3;	.type	32;	.endef
create_code_member:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 8(%rax)
	cmpl	$0, 16(%rbp)
	jne	.L52
	cmpq	$0, 24(%rbp)
	je	.L52
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L53
.L52:
	cmpl	$1, 16(%rbp)
	jne	.L54
	cmpq	$0, 32(%rbp)
	je	.L54
	movq	-8(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L53
.L54:
	cmpl	$2, 16(%rbp)
	jne	.L55
	cmpq	$0, 40(%rbp)
	je	.L55
	movq	-8(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L53
.L55:
	cmpq	$0, 24(%rbp)
	jne	.L56
	cmpq	$0, 32(%rbp)
	jne	.L56
	cmpq	$0, 40(%rbp)
	jne	.L56
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$44, %r8d
	movl	$1, %edx
	leaq	.LC60(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L53
.L56:
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movl	16(%rbp), %eax
	movl	%eax, %r8d
	leaq	.LC61(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L53:
	movq	-8(%rbp), %rax
	leave
	ret
	.def	create_code;	.scl	3;	.type	32;	.endef
create_code:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC62:
	.ascii "Error creating import: name is NULL\12\0"
	.text
	.def	create_import;	.scl	3;	.type	32;	.endef
create_import:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L61
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$36, %r8d
	movl	$1, %edx
	leaq	.LC62(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L62
.L61:
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
.L62:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC63:
	.ascii "Error creating function: name or return_type is NULL\12\0"
	.text
	.def	create_function_use_ptr;	.scl	3;	.type	32;	.endef
create_function_use_ptr:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	cmpq	$0, 24(%rbp)
	je	.L64
	cmpq	$0, 32(%rbp)
	jne	.L65
.L64:
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$53, %r8d
	movl	$1, %edx
	leaq	.LC63(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L66
.L65:
	movq	16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	48(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	16(%rbp), %rax
	movq	56(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	16(%rbp), %rax
.L66:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC64:
	.ascii "Error creating method: name or return_type is NULL\12\0"
	.text
	.def	create_method_use_ptr;	.scl	3;	.type	32;	.endef
create_method_use_ptr:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	cmpq	$0, 24(%rbp)
	je	.L68
	cmpq	$0, 32(%rbp)
	jne	.L69
.L68:
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$51, %r8d
	movl	$1, %edx
	leaq	.LC64(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L70
.L69:
	movq	16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	48(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	16(%rbp), %rax
	movq	56(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	16(%rbp), %rax
.L70:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC65:
	.ascii "Error creating class member: content is NULL\12\0"
	.align 8
.LC66:
	.ascii "Error creating class member: unknown type %u\12\0"
	.text
	.def	create_class_member;	.scl	3;	.type	32;	.endef
create_class_member:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 8(%rax)
	cmpl	$0, 16(%rbp)
	jne	.L72
	cmpq	$0, 24(%rbp)
	je	.L72
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L73
.L72:
	cmpl	$1, 16(%rbp)
	jne	.L74
	cmpq	$0, 32(%rbp)
	je	.L74
	movq	-8(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L73
.L74:
	cmpq	$0, 24(%rbp)
	jne	.L75
	cmpq	$0, 32(%rbp)
	jne	.L75
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$45, %r8d
	movl	$1, %edx
	leaq	.LC65(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L76
.L75:
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movl	16(%rbp), %eax
	movl	%eax, %r8d
	leaq	.LC66(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L76:
	movl	$0, %eax
	jmp	.L77
.L73:
	movq	-8(%rbp), %rax
.L77:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC67:
	.ascii "Error creating class: name is NULL\12\0"
	.text
	.def	create_class_use_ptr;	.scl	3;	.type	32;	.endef
create_class_use_ptr:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	cmpq	$0, 24(%rbp)
	jne	.L79
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$35, %r8d
	movl	$1, %edx
	leaq	.LC67(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L80
.L79:
	movq	16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	48(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	16(%rbp), %rax
.L80:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC68:
	.ascii "Error creating variable: type or name is NULL\12\0"
	.text
	.def	create_variable;	.scl	3;	.type	32;	.endef
create_variable:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L82
	cmpq	$0, 24(%rbp)
	jne	.L83
.L82:
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$46, %r8d
	movl	$1, %edx
	leaq	.LC68(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L84
.L83:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
.L84:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC69:
	.ascii "Error creating statement: content is NULL\12\0"
	.align 8
.LC70:
	.ascii "Error creating statement: unknown type %u\12\0"
	.text
	.def	create_statement;	.scl	3;	.type	32;	.endef
create_statement:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 8(%rax)
	cmpl	$0, 16(%rbp)
	jne	.L86
	cmpq	$0, 48(%rbp)
	je	.L86
	movq	-8(%rbp), %rax
	movq	48(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L87
.L86:
	cmpl	$1, 16(%rbp)
	jne	.L88
	cmpq	$0, 56(%rbp)
	je	.L88
	movq	-8(%rbp), %rax
	movq	56(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L87
.L88:
	cmpl	$2, 16(%rbp)
	jne	.L89
	cmpq	$0, 24(%rbp)
	je	.L89
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L87
.L89:
	cmpl	$3, 16(%rbp)
	jne	.L90
	cmpq	$0, 32(%rbp)
	je	.L90
	movq	-8(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L87
.L90:
	cmpl	$4, 16(%rbp)
	jne	.L91
	cmpq	$0, 40(%rbp)
	je	.L91
	movq	-8(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L87
.L91:
	cmpl	$5, 16(%rbp)
	jne	.L92
	movq	-8(%rbp), %rax
	movq	48(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L87
.L92:
	cmpl	$6, 16(%rbp)
	je	.L93
	cmpl	$7, 16(%rbp)
	jne	.L94
.L93:
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	jmp	.L87
.L94:
	cmpq	$0, 24(%rbp)
	jne	.L95
	cmpq	$0, 32(%rbp)
	jne	.L95
	cmpq	$0, 40(%rbp)
	jne	.L95
	cmpq	$0, 48(%rbp)
	jne	.L95
	cmpq	$0, 56(%rbp)
	jne	.L95
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$42, %r8d
	movl	$1, %edx
	leaq	.LC69(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L96
.L95:
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movl	16(%rbp), %eax
	movl	%eax, %r8d
	leaq	.LC70(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L96:
	movl	$0, %eax
	jmp	.L97
.L87:
	movq	-8(%rbp), %rax
.L97:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC71:
	.ascii "Error creating if statement: condition is NULL\12\0"
	.text
	.def	create_if;	.scl	3;	.type	32;	.endef
create_if:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L99
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$47, %r8d
	movl	$1, %edx
	leaq	.LC71(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L100
.L99:
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-8(%rbp), %rax
.L100:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC72:
	.ascii "Error creating else-if statement: condition is NULL\12\0"
	.text
	.def	create_else_if;	.scl	3;	.type	32;	.endef
create_else_if:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L102
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC72(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L103
.L102:
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
.L103:
	leave
	ret
	.def	create_for;	.scl	3;	.type	32;	.endef
create_for:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.def	create_while;	.scl	3;	.type	32;	.endef
create_while:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC73:
	.ascii "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\12\0"
	.align 8
.LC74:
	.ascii "Error creating expression: both expr_left and prim_left are NULL\12\0"
	.text
	.def	create_expression;	.scl	3;	.type	32;	.endef
create_expression:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$64, %rsp
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	cmpl	$19, 16(%rbp)
	sete	%dl
	cmpq	$0, 40(%rbp)
	sete	%al
	xorl	%edx, %eax
	testb	%al, %al
	jne	.L109
	cmpq	$0, 24(%rbp)
	jne	.L110
	cmpq	$0, 32(%rbp)
	jne	.L110
.L109:
	cmpq	$0, 40(%rbp)
	jne	.L111
	leaq	.LC11(%rip), %rsi
	jmp	.L112
.L111:
	leaq	.LC12(%rip), %rsi
.L112:
	cmpq	$0, 32(%rbp)
	jne	.L113
	leaq	.LC11(%rip), %rbx
	jmp	.L114
.L113:
	leaq	.LC12(%rip), %rbx
.L114:
	cmpq	$0, 24(%rbp)
	jne	.L115
	leaq	.LC11(%rip), %r12
	jmp	.L116
.L115:
	leaq	.LC12(%rip), %r12
.L116:
	cmpl	$19, 16(%rbp)
	jne	.L117
	leaq	.LC11(%rip), %rdi
	jmp	.L118
.L117:
	leaq	.LC12(%rip), %rdi
.L118:
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rsi, 40(%rsp)
	movq	%rbx, 32(%rsp)
	movq	%r12, %r9
	movq	%rdi, %r8
	leaq	.LC73(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L119
.L110:
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 24(%rax)
	cmpq	$0, 24(%rbp)
	je	.L120
	movq	-40(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L121
.L120:
	cmpq	$0, 32(%rbp)
	je	.L122
	movq	-40(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L121
.L122:
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$65, %r8d
	movl	$1, %edx
	leaq	.LC74(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L119
.L121:
	movq	-40(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-40(%rbp), %rax
.L119:
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC75:
	.ascii "Error creating primary: value is NULL\12\0"
	.align 8
.LC76:
	.ascii "Error creating primary: unknown type %u\12\0"
	.text
	.def	create_primary;	.scl	3;	.type	32;	.endef
create_primary:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 8(%rax)
	cmpl	$0, 16(%rbp)
	je	.L124
	cmpl	$1, 16(%rbp)
	je	.L124
	cmpl	$2, 16(%rbp)
	je	.L124
	cmpl	$3, 16(%rbp)
	je	.L124
	cmpl	$4, 16(%rbp)
	jne	.L125
.L124:
	cmpq	$0, 24(%rbp)
	je	.L125
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L126
.L125:
	cmpl	$5, 16(%rbp)
	jne	.L127
	cmpq	$0, 32(%rbp)
	je	.L127
	movq	-8(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L126
.L127:
	cmpl	$6, 16(%rbp)
	je	.L128
	cmpl	$7, 16(%rbp)
	jne	.L129
.L128:
	cmpq	$0, 40(%rbp)
	je	.L129
	movq	-8(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L126
.L129:
	cmpl	$8, 16(%rbp)
	jne	.L130
	cmpq	$0, 48(%rbp)
	je	.L130
	movq	-8(%rbp), %rax
	movq	48(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L126
.L130:
	cmpq	$0, 24(%rbp)
	jne	.L131
	cmpq	$0, 32(%rbp)
	jne	.L131
	cmpq	$0, 40(%rbp)
	jne	.L131
	cmpq	$0, 48(%rbp)
	jne	.L131
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC75(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L132
.L131:
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movl	16(%rbp), %eax
	movl	%eax, %r8d
	leaq	.LC76(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L132:
	movl	$0, %eax
	jmp	.L133
.L126:
	movq	-8(%rbp), %rax
.L133:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC77:
	.ascii "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\12\0"
	.align 8
.LC78:
	.ascii "Error creating variable access: content is NULL\12\0"
	.align 8
.LC79:
	.ascii "Error creating variable access: unknown type %u\12\0"
	.text
	.def	create_variable_access;	.scl	3;	.type	32;	.endef
create_variable_access:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	pushq	%rbx
	subq	$48, %rsp
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	cmpq	$0, 24(%rbp)
	sete	%dl
	cmpl	$0, 16(%rbp)
	sete	%al
	xorl	%edx, %eax
	testb	%al, %al
	je	.L135
	cmpl	$0, 16(%rbp)
	jne	.L136
	leaq	.LC11(%rip), %rsi
	jmp	.L137
.L136:
	leaq	.LC12(%rip), %rsi
.L137:
	cmpq	$0, 24(%rbp)
	jne	.L138
	leaq	.LC11(%rip), %rbx
	jmp	.L139
.L138:
	leaq	.LC12(%rip), %rbx
.L139:
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC77(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L140
.L135:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 16(%rax)
	movq	-24(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	cmpl	$0, 16(%rbp)
	jne	.L141
	cmpq	$0, 32(%rbp)
	je	.L141
	movq	-24(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L142
.L141:
	cmpl	$1, 16(%rbp)
	jne	.L143
	cmpq	$0, 48(%rbp)
	je	.L143
	movq	-24(%rbp), %rax
	movq	48(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L142
.L143:
	cmpl	$3, 16(%rbp)
	jne	.L144
	cmpq	$0, 40(%rbp)
	je	.L144
	movq	-24(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L142
.L144:
	cmpl	$2, 16(%rbp)
	jne	.L145
	cmpq	$0, 32(%rbp)
	je	.L145
	movq	-24(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L142
.L145:
	cmpq	$0, 32(%rbp)
	jne	.L146
	cmpq	$0, 40(%rbp)
	jne	.L146
	cmpq	$0, 48(%rbp)
	jne	.L146
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$48, %r8d
	movl	$1, %edx
	leaq	.LC78(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L147
.L146:
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movl	16(%rbp), %eax
	movl	%eax, %r8d
	leaq	.LC79(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L147:
	movl	$0, %eax
	jmp	.L140
.L142:
	movq	-24(%rbp), %rax
.L140:
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.def	read_source;	.scl	3;	.type	32;	.endef
read_source:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movl	$2, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	fseek
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	ftell
	movslq	%eax, %rdx
	movq	24(%rbp), %rax
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	fseek
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, %rax
	movl	$0, %r8d
	movq	%rax, %rdx
	leaq	.LC57(%rip), %rax
	movq	%rax, %rcx
	call	create_string_check
	movq	%rax, -16(%rbp)
	movq	24(%rbp), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rcx
	movq	-16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$1, %edx
	movq	%rax, %rcx
	call	fread
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	24(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	$0, -8(%rbp)
	jmp	.L149
.L152:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$13, %al
	je	.L150
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$9, %al
	jne	.L151
.L150:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$32, (%rax)
.L151:
	addq	$1, -8(%rbp)
.L149:
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, -8(%rbp)
	jb	.L152
	movq	-16(%rbp), %rax
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC80:
	.ascii "Token(Type: EOF,         Line: %zu, Column: %zu)\12\0"
	.align 8
.LC81:
	.ascii "Token(Type: identifier,  Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC82:
	.ascii "Token(Type: integer,     Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC83:
	.ascii "Token(Type: float,       Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC84:
	.ascii "Token(Type: string,      Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC85:
	.ascii "Token(Type: symbol,      Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC86:
	.ascii "Token(Type: keyword,     Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC87:
	.ascii "Token(Type: comment,     Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC88:
	.ascii "\\0\0"
.LC89:
	.ascii "\\n\0"
.LC90:
	.ascii "\\t\0"
.LC91:
	.ascii "\\r\0"
.LC92:
	.ascii "'\12\0"
	.text
	.def	output_one_token;	.scl	3;	.type	32;	.endef
output_one_token:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	jne	.L155
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC80(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L154
.L155:
	movq	24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	jne	.L157
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC81(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L158
.L157:
	movq	24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$2, %eax
	jne	.L159
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC82(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L158
.L159:
	movq	24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$3, %eax
	jne	.L160
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC83(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L158
.L160:
	movq	24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$4, %eax
	jne	.L161
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC84(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L158
.L161:
	movq	24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L162
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC85(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L158
.L162:
	movq	24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L163
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC86(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L158
.L163:
	movq	24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$7, %eax
	jne	.L158
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC87(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L158:
	movq	$0, -8(%rbp)
	jmp	.L164
.L170:
	movq	24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -9(%rbp)
	cmpb	$0, -9(%rbp)
	jne	.L165
	movq	16(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC88(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L166
.L165:
	cmpb	$10, -9(%rbp)
	jne	.L167
	movq	16(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC89(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L166
.L167:
	cmpb	$9, -9(%rbp)
	jne	.L168
	movq	16(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC90(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L166
.L168:
	cmpb	$13, -9(%rbp)
	jne	.L169
	movq	16(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC91(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L166
.L169:
	movsbl	-9(%rbp), %eax
	movq	16(%rbp), %rdx
	movl	%eax, %ecx
	call	fputc
.L166:
	addq	$1, -8(%rbp)
.L164:
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	strlen
	cmpq	%rax, -8(%rbp)
	jb	.L170
	movq	16(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC92(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L154:
	leave
	ret
	.section .rdata,"dr"
.LC93:
	.ascii "\12info by lib:\12    %s\12\0"
	.text
	.def	output_token;	.scl	3;	.type	32;	.endef
output_token:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	jmp	.L172
.L175:
	movq	-8(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	output_one_token
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	je	.L176
	movq	24(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
.L172:
	cmpq	$0, -8(%rbp)
	jne	.L175
	jmp	.L174
.L176:
	nop
.L174:
	call	get_info
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC93(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
	leave
	ret
	.def	output_ast;	.scl	3;	.type	32;	.endef
output_ast:
	pushq	%rbp
	movq	%rsp, %rbp
	andq	$-16, %rsp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	leaq	32(%rsp), %rcx
	movq	16(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	output_code
	call	get_info
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC93(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
	leave
	ret
	.def	output_tac;	.scl	3;	.type	32;	.endef
output_tac:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rdx
	movq	24(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rcx
	call	output_TAC
	call	get_info
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC93(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
	leave
	ret
	.section .rdata,"dr"
.LC94:
	.ascii "r\0"
.LC95:
	.ascii "Error opening file: %s\12\0"
.LC96:
	.ascii ".token\0"
.LC97:
	.ascii "w\0"
.LC98:
	.ascii ".ast\0"
.LC99:
	.ascii ".tc\0"
.LC100:
	.ascii ".tac\0"
	.text
	.def	parse_file;	.scl	3;	.type	32;	.endef
parse_file:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$160, %rsp
	movq	%rcx, 16(%rbp)
	movl	%edx, %eax
	movl	%r8d, %ecx
	movl	%r9d, %edx
	movb	%al, 24(%rbp)
	movl	%ecx, %eax
	movb	%al, 32(%rbp)
	movl	%edx, %eax
	movb	%al, 40(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	create_file
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	$0, -120(%rbp)
	movq	-24(%rbp), %rax
	leaq	.LC94(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L180
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	movq	%rax, %r8
	leaq	.LC95(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	jmp	.L179
.L180:
	leaq	-120(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	read_source
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movq	-120(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	create_lexer
	movq	%rax, -48(%rbp)
	cmpb	$0, 24(%rbp)
	je	.L182
	movl	$1, %r8d
	movl	$6, %edx
	leaq	.LC96(%rip), %rax
	movq	%rax, %rcx
	call	create_string_check
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	change_file_extension
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	leaq	.LC97(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.L183
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	-56(%rbp), %rax
	movq	%rax, %r8
	leaq	.LC95(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	jmp	.L182
.L183:
	movq	-48(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	output_token
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
.L182:
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	reset_lexer
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	create_parser
	movq	%rax, -72(%rbp)
	movq	$0, -8(%rbp)
	cmpb	$0, 32(%rbp)
	jne	.L184
	cmpb	$0, 40(%rbp)
	je	.L185
.L184:
	movq	builtin_scope(%rip), %rdx
	movq	-72(%rbp), %rcx
	movq	-48(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_code
	movq	%rax, -8(%rbp)
.L185:
	cmpb	$0, 32(%rbp)
	je	.L186
	movl	$1, %r8d
	movl	$4, %edx
	leaq	.LC98(%rip), %rax
	movq	%rax, %rcx
	call	create_string_check
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	change_file_extension
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -80(%rbp)
	movl	$1, %r8d
	movl	$3, %edx
	leaq	.LC99(%rip), %rax
	movq	%rax, %rcx
	call	create_string_check
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	change_file_extension
	movq	-80(%rbp), %rax
	leaq	.LC97(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L187
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	-80(%rbp), %rax
	movq	%rax, %r8
	leaq	.LC95(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	jmp	.L186
.L187:
	movq	-8(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rax, %rcx
	call	output_ast
	movq	-88(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
.L186:
	cmpb	$0, 40(%rbp)
	je	.L179
	movl	$1, %r8d
	movl	$4, %edx
	leaq	.LC100(%rip), %rax
	movq	%rax, %rcx
	call	create_string_check
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	change_file_extension
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -96(%rbp)
	movl	$1, %r8d
	movl	$3, %edx
	leaq	.LC99(%rip), %rax
	movq	%rax, %rcx
	call	create_string_check
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	change_file_extension
	movq	-96(%rbp), %rax
	leaq	.LC97(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -104(%rbp)
	cmpq	$0, -104(%rbp)
	jne	.L189
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	-96(%rbp), %rax
	movq	%rax, %r8
	leaq	.LC95(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	jmp	.L179
.L189:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	tac_code
	movq	%rax, -112(%rbp)
	movq	-112(%rbp), %rdx
	movq	-104(%rbp), %rax
	movq	%rax, %rcx
	call	output_tac
	movq	-104(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
.L179:
	leave
	ret
	.def	create_list;	.scl	3;	.type	32;	.endef
create_list:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.def	create_node;	.scl	3;	.type	32;	.endef
create_node:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC101:
	.ascii "Error: list_append received NULL list\12\0"
	.text
	.def	list_append;	.scl	3;	.type	32;	.endef
list_append:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L195
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC101(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L194
.L195:
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	create_node
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L197
	movq	16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L194
.L197:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
.L194:
	leave
	ret
	.def	list_copy;	.scl	3;	.type	32;	.endef
list_copy:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L199
	movl	$0, %eax
	jmp	.L200
.L199:
	call	create_list
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
.L200:
	leave
	ret
	.def	list_pop;	.scl	3;	.type	32;	.endef
list_pop:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L202
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L203
.L202:
	movl	$0, %eax
	jmp	.L204
.L203:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L205
	movq	16(%rbp), %rax
	movq	$0, 8(%rax)
.L205:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
.L204:
	leave
	ret
	.def	list_pop_back;	.scl	3;	.type	32;	.endef
list_pop_back:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L207
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L208
.L207:
	movl	$0, %eax
	jmp	.L209
.L208:
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L210
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	16(%rbp), %rax
	movq	$0, (%rax)
	movq	16(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-24(%rbp), %rax
	jmp	.L209
.L210:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L211
.L212:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
.L211:
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L212
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-16(%rbp), %rax
.L209:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC102:
	.ascii "[Warning] Creating symbol with unknown SymbolType: %u\12\0"
	.align 8
.LC103:
	.ascii "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\12\0"
	.align 8
.LC104:
	.ascii "[Warning] Creating symbol with unknown SymbolType for ast_node assignment: %u\12\0"
	.align 8
.LC105:
	.ascii "[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\12\0"
	.text
	.def	create_symbol;	.scl	3;	.type	32;	.endef
create_symbol:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$88, %rsp
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	$0, -40(%rbp)
	cmpl	$6, 24(%rbp)
	ja	.L214
	cmpl	$3, 24(%rbp)
	jnb	.L215
	cmpl	$2, 24(%rbp)
	je	.L216
	cmpl	$2, 24(%rbp)
	ja	.L214
	cmpl	$0, 24(%rbp)
	je	.L217
	cmpl	$1, 24(%rbp)
	je	.L218
	jmp	.L214
.L217:
	movq	40(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	jmp	.L219
.L218:
	movq	40(%rbp), %rax
	movq	32(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	jmp	.L219
.L216:
	movq	40(%rbp), %rax
	movq	32(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	jmp	.L219
.L215:
	movq	40(%rbp), %rax
	movq	%rax, -40(%rbp)
	jmp	.L219
.L214:
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movl	24(%rbp), %eax
	movl	%eax, %r8d
	leaq	.LC102(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	nop
.L219:
	movq	16(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	search_name
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	je	.L220
	movq	id_counter.0(%rip), %rax
	leaq	1(%rax), %rsi
	movq	-48(%rbp), %rax
	movq	16(%rax), %rbx
	movq	-48(%rbp), %rax
	movl	32(%rax), %edi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	16(%rbp), %rax
	movq	%rsi, 40(%rsp)
	movq	%rbx, 32(%rsp)
	movl	%edi, %r9d
	movq	%rax, %r8
	leaq	.LC103(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L220:
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	id_counter.0(%rip), %rax
	addq	$1, %rax
	movq	%rax, id_counter.0(%rip)
	movq	id_counter.0(%rip), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-56(%rbp), %rax
	movl	24(%rbp), %edx
	movl	%edx, 32(%rax)
	movq	-56(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, (%rax)
	cmpl	$6, 24(%rbp)
	ja	.L221
	cmpl	$3, 24(%rbp)
	jnb	.L222
	cmpl	$2, 24(%rbp)
	je	.L223
	cmpl	$2, 24(%rbp)
	ja	.L221
	cmpl	$0, 24(%rbp)
	je	.L224
	cmpl	$1, 24(%rbp)
	je	.L225
	jmp	.L221
.L224:
	movq	-56(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 24(%rax)
	jmp	.L226
.L225:
	movq	-56(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 24(%rax)
	jmp	.L226
.L223:
	movq	-56(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 24(%rax)
	jmp	.L226
.L222:
	movq	-56(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 24(%rax)
	jmp	.L226
.L221:
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movl	24(%rbp), %eax
	movl	%eax, %r8d
	leaq	.LC104(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	nop
.L226:
	cmpq	$0, -40(%rbp)
	jne	.L227
	movq	-56(%rbp), %rax
	movq	16(%rax), %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movl	24(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rbx, 32(%rsp)
	movl	%edx, %r9d
	movq	%rax, %r8
	leaq	.LC105(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	jmp	.L228
.L227:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	-56(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
.L228:
	movq	-56(%rbp), %rax
	addq	$88, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.def	create_symbol_table;	.scl	3;	.type	32;	.endef
create_symbol_table:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	call	create_list
	movq	-8(%rbp), %rdx
	movq	%rax, 8(%rdx)
	movq	-8(%rbp), %rax
	leave
	ret
	.def	search_name_use_strcmp;	.scl	3;	.type	32;	.endef
search_name_use_strcmp:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	jmp	.L233
.L238:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L234
.L237:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L235
	movq	-24(%rbp), %rax
	jmp	.L236
.L235:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
.L234:
	cmpq	$0, -8(%rbp)
	jne	.L237
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, 16(%rbp)
.L233:
	cmpq	$0, 16(%rbp)
	jne	.L238
	movl	$0, %eax
.L236:
	leave
	ret
	.def	search_name;	.scl	3;	.type	32;	.endef
search_name:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	jmp	.L240
.L245:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L241
.L244:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, 24(%rbp)
	jne	.L242
	movq	-24(%rbp), %rax
	jmp	.L243
.L242:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
.L241:
	cmpq	$0, -8(%rbp)
	jne	.L244
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, 16(%rbp)
.L240:
	cmpq	$0, 16(%rbp)
	jne	.L245
	movl	$0, %eax
.L243:
	leave
	ret
	.section .rdata,"dr"
.LC106:
	.ascii "\342\224\202   \0"
.LC107:
	.ascii "    \0"
.LC108:
	.ascii "\342\224\224\342\224\200\342\224\200 \0"
.LC109:
	.ascii "\342\224\234\342\224\200\342\224\200 \0"
	.text
	.def	indention;	.scl	3;	.type	32;	.endef
indention:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, %eax
	movq	%r9, 40(%rbp)
	movb	%al, 32(%rbp)
	cmpb	$0, 32(%rbp)
	jne	.L247
	movq	24(%rbp), %rax
	shrq	$3, %rax
	movq	%rax, %rdx
	movq	40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movq	24(%rbp), %rax
	andl	$7, %eax
	movl	$1, %r8d
	movl	%eax, %ecx
	sall	%cl, %r8d
	movl	%r8d, %eax
	orl	%edx, %eax
	jmp	.L248
.L247:
	movq	24(%rbp), %rax
	shrq	$3, %rax
	movq	%rax, %rdx
	movq	40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movq	24(%rbp), %rax
	andl	$7, %eax
	movl	$1, %r8d
	movl	%eax, %ecx
	sall	%cl, %r8d
	movl	%r8d, %eax
	notl	%eax
	andl	%edx, %eax
.L248:
	movq	24(%rbp), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	movq	40(%rbp), %rdx
	addq	%rcx, %rdx
	movb	%al, (%rdx)
	movq	$1, -8(%rbp)
	jmp	.L249
.L252:
	movq	-8(%rbp), %rax
	shrq	$3, %rax
	movq	%rax, %rdx
	movq	40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	movq	-8(%rbp), %rax
	andl	$7, %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L250
	leaq	.LC106(%rip), %rax
	jmp	.L251
.L250:
	leaq	.LC107(%rip), %rax
.L251:
	movq	16(%rbp), %rcx
	movq	%rax, %rdx
	call	fprintf
	addq	$1, -8(%rbp)
.L249:
	movq	-8(%rbp), %rax
	cmpq	24(%rbp), %rax
	jb	.L252
	cmpq	$0, 24(%rbp)
	je	.L256
	cmpb	$0, 32(%rbp)
	je	.L254
	leaq	.LC108(%rip), %rax
	jmp	.L255
.L254:
	leaq	.LC109(%rip), %rax
.L255:
	movq	16(%rbp), %rcx
	movq	%rax, %rdx
	call	fprintf
.L256:
	nop
	leave
	ret
	.def	create_parser;	.scl	3;	.type	32;	.endef
create_parser:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movb	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movb	$0, 9(%rax)
	movq	-8(%rbp), %rax
	movb	$0, 11(%rax)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.section .rdata,"dr"
.LC110:
	.ascii "%s.tc\0"
.LC111:
	.ascii "D:/TC/std/\0"
	.align 8
.LC112:
	.ascii "Error opening library file for import: %s\12\0"
	.align 8
.LC113:
	.ascii "Info: Starting parsing lib file for import: %s\12\0"
	.align 8
.LC114:
	.ascii "Info: Finished parsing lib file for import: %s\12\0"
	.align 8
.LC115:
	.ascii "Error parsing library file for import: %s\12\0"
	.align 8
.LC116:
	.ascii "Error: Imported symbol '%s' was not found in %s\12\0"
	.text
	.def	parse_import_file;	.scl	3;	.type	32;	.endef
parse_import_file:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	pushq	%rbx
	subq	$96, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	$0, -32(%rbp)
	cmpq	$0, 24(%rbp)
	jne	.L260
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	addq	$4, %rax
	movl	$0, %r8d
	movq	%rax, %rdx
	leaq	.LC57(%rip), %rax
	movq	%rax, %rcx
	call	create_string_check
	movq	%rax, -40(%rbp)
	movq	16(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC110(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movq	-40(%rbp), %rax
	leaq	.LC111(%rip), %rdx
	movq	%rax, %rcx
	call	absolute_path
	movq	%rax, -24(%rbp)
	jmp	.L261
.L260:
	movq	40(%rbp), %rax
	movq	%rax, %rcx
	call	get_file_dir
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	absolute_path
	movq	%rax, -24(%rbp)
.L261:
	movq	-24(%rbp), %rax
	leaq	.LC94(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L262
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	movq	%rax, %r8
	leaq	.LC112(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L267
.L262:
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	movq	%rax, %r8
	leaq	.LC113(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movq	$0, -72(%rbp)
	leaq	-72(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	read_source
	movq	%rax, -56(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	create_file
	movq	%rax, %rcx
	call	create_parser
	movq	%rax, %rsi
	movq	builtin_scope(%rip), %rbx
	movq	-72(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	create_lexer
	movq	%rsi, %r8
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	parse_code
	movq	%rax, -64(%rbp)
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	movq	%rax, %r8
	leaq	.LC114(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	cmpq	$0, -64(%rbp)
	jne	.L264
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	movq	%rax, %r8
	leaq	.LC115(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L267
.L264:
	movq	-64(%rbp), %rax
	movq	8(%rax), %rax
	movq	16(%rbp), %rdx
	movq	%rax, %rcx
	call	search_name_use_strcmp
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L265
	movq	32(%rbp), %rax
	movq	8(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	jmp	.L266
.L265:
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, %r9
	movq	%rax, %r8
	leaq	.LC116(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L266:
	movq	-32(%rbp), %rax
.L267:
	addq	$96, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC117:
	.ascii "%s.%s\0"
	.text
	.def	make_method_name;	.scl	3;	.type	32;	.endef
make_method_name:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$56, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rbx
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	addq	%rbx, %rax
	addq	$2, %rax
	movl	$1, %r8d
	movq	%rax, %rdx
	leaq	.LC57(%rip), %rax
	movq	%rax, %rcx
	call	create_string_check
	movq	%rax, -24(%rbp)
	movq	24(%rbp), %rcx
	movq	16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC117(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rbx
	leave
	ret
	.def	string_to_operator;	.scl	3;	.type	32;	.endef
string_to_operator:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rcx, 16(%rbp)
	movq	144+symbolList(%rip), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L271
	movl	$13, %eax
	jmp	.L272
.L271:
	movq	184+symbolList(%rip), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L273
	movl	$14, %eax
	jmp	.L272
.L273:
	movq	192+symbolList(%rip), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L274
	movl	$15, %eax
	jmp	.L272
.L274:
	movq	200+symbolList(%rip), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L275
	movl	$16, %eax
	jmp	.L272
.L275:
	movq	208+symbolList(%rip), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L276
	movl	$17, %eax
	jmp	.L272
.L276:
	movq	216+symbolList(%rip), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L277
	movl	$18, %eax
	jmp	.L272
.L277:
	movq	224+symbolList(%rip), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L278
	movl	$11, %eax
	jmp	.L272
.L278:
	movq	232+symbolList(%rip), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L279
	movl	$12, %eax
	jmp	.L272
.L279:
	movq	152+symbolList(%rip), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L280
	movl	$5, %eax
	jmp	.L272
.L280:
	movq	160+symbolList(%rip), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L281
	movl	$6, %eax
	jmp	.L272
.L281:
	movq	128+symbolList(%rip), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L282
	movl	$7, %eax
	jmp	.L272
.L282:
	movq	136+symbolList(%rip), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L283
	movl	$8, %eax
	jmp	.L272
.L283:
	movq	168+symbolList(%rip), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L284
	movl	$9, %eax
	jmp	.L272
.L284:
	movq	176+symbolList(%rip), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L285
	movl	$10, %eax
	jmp	.L272
.L285:
	movq	88+symbolList(%rip), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L286
	movl	$0, %eax
	jmp	.L272
.L286:
	movq	96+symbolList(%rip), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L287
	movl	$1, %eax
	jmp	.L272
.L287:
	movq	104+symbolList(%rip), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L288
	movl	$2, %eax
	jmp	.L272
.L288:
	movq	112+symbolList(%rip), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L289
	movl	$3, %eax
	jmp	.L272
.L289:
	movq	120+symbolList(%rip), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L290
	movl	$4, %eax
	jmp	.L272
.L290:
	movl	$19, %eax
.L272:
	popq	%rbp
	ret
	.def	operator_precedence;	.scl	3;	.type	32;	.endef
operator_precedence:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%ecx, 16(%rbp)
	cmpl	$18, 16(%rbp)
	ja	.L292
	movl	16(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L294(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L294(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L294:
	.long	.L298-.L294
	.long	.L298-.L294
	.long	.L297-.L294
	.long	.L297-.L294
	.long	.L297-.L294
	.long	.L296-.L294
	.long	.L296-.L294
	.long	.L296-.L294
	.long	.L296-.L294
	.long	.L296-.L294
	.long	.L296-.L294
	.long	.L295-.L294
	.long	.L295-.L294
	.long	.L293-.L294
	.long	.L293-.L294
	.long	.L293-.L294
	.long	.L293-.L294
	.long	.L293-.L294
	.long	.L293-.L294
	.text
.L293:
	movl	$1, %eax
	jmp	.L299
.L295:
	movl	$2, %eax
	jmp	.L299
.L296:
	movl	$3, %eax
	jmp	.L299
.L298:
	movl	$4, %eax
	jmp	.L299
.L297:
	movl	$5, %eax
	jmp	.L299
.L292:
	movl	$0, %eax
.L299:
	popq	%rbp
	ret
	.def	operator_to_string;	.scl	3;	.type	32;	.endef
operator_to_string:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%ecx, 16(%rbp)
	cmpl	$18, 16(%rbp)
	ja	.L301
	movl	16(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L303(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L303(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L303:
	.long	.L321-.L303
	.long	.L320-.L303
	.long	.L319-.L303
	.long	.L318-.L303
	.long	.L317-.L303
	.long	.L316-.L303
	.long	.L315-.L303
	.long	.L314-.L303
	.long	.L313-.L303
	.long	.L312-.L303
	.long	.L311-.L303
	.long	.L310-.L303
	.long	.L309-.L303
	.long	.L308-.L303
	.long	.L307-.L303
	.long	.L306-.L303
	.long	.L305-.L303
	.long	.L304-.L303
	.long	.L302-.L303
	.text
.L308:
	movq	144+symbolList(%rip), %rax
	jmp	.L322
.L307:
	movq	184+symbolList(%rip), %rax
	jmp	.L322
.L306:
	movq	192+symbolList(%rip), %rax
	jmp	.L322
.L305:
	movq	200+symbolList(%rip), %rax
	jmp	.L322
.L304:
	movq	208+symbolList(%rip), %rax
	jmp	.L322
.L302:
	movq	216+symbolList(%rip), %rax
	jmp	.L322
.L310:
	movq	224+symbolList(%rip), %rax
	jmp	.L322
.L309:
	movq	232+symbolList(%rip), %rax
	jmp	.L322
.L316:
	movq	152+symbolList(%rip), %rax
	jmp	.L322
.L315:
	movq	160+symbolList(%rip), %rax
	jmp	.L322
.L314:
	movq	128+symbolList(%rip), %rax
	jmp	.L322
.L313:
	movq	136+symbolList(%rip), %rax
	jmp	.L322
.L312:
	movq	168+symbolList(%rip), %rax
	jmp	.L322
.L311:
	movq	176+symbolList(%rip), %rax
	jmp	.L322
.L321:
	movq	88+symbolList(%rip), %rax
	jmp	.L322
.L320:
	movq	96+symbolList(%rip), %rax
	jmp	.L322
.L319:
	movq	104+symbolList(%rip), %rax
	jmp	.L322
.L318:
	movq	112+symbolList(%rip), %rax
	jmp	.L322
.L317:
	movq	120+symbolList(%rip), %rax
	jmp	.L322
.L301:
	movl	$0, %eax
.L322:
	popq	%rbp
	ret
	.def	create_lexer;	.scl	3;	.type	32;	.endef
create_lexer:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movl	$88, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 32(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 40(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 48(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 56(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 64(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 72(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 80(%rax)
	movq	-8(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.def	create_token;	.scl	3;	.type	32;	.endef
create_token:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 24(%rax)
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.def	get_current_char;	.scl	3;	.type	32;	.endef
get_current_char:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	16(%rax), %rdx
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	cmpq	%rax, %rdx
	jb	.L328
	movl	$0, %eax
	jmp	.L329
.L328:
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 40(%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %r8
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	16(%rbp), %rdx
	movq	%rcx, 16(%rdx)
	addq	%r8, %rax
	movzbl	(%rax), %eax
.L329:
	popq	%rbp
	ret
	.def	peek_next_char;	.scl	3;	.type	32;	.endef
peek_next_char:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	16(%rax), %rdx
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	cmpq	%rax, %rdx
	jb	.L331
	movl	$0, %eax
	jmp	.L332
.L331:
	movq	16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
.L332:
	popq	%rbp
	ret
	.def	move_position;	.scl	3;	.type	32;	.endef
move_position:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	cmpl	$0, 24(%rbp)
	js	.L334
	movq	16(%rbp), %rax
	movq	16(%rax), %rdx
	movl	24(%rbp), %eax
	cltq
	addq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	40(%rax), %rdx
	movl	24(%rbp), %eax
	cltq
	addq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 40(%rax)
	jmp	.L336
.L334:
	movq	16(%rbp), %rax
	movq	16(%rax), %rdx
	movl	24(%rbp), %eax
	negl	%eax
	cltq
	subq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	40(%rax), %rdx
	movl	24(%rbp), %eax
	negl	%eax
	cltq
	subq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 40(%rax)
.L336:
	nop
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC118:
	.ascii "[Lexer Error] at %s:%zu:%zu: Unterminated string literal\12\0"
.LC119:
	.ascii "\0\0"
	.align 8
.LC120:
	.ascii "[Lexer Error] at %s:%zu:%zu: Unterminated comment\12\0"
	.align 8
.LC121:
	.ascii "[Lexer Error] at %s:%zu:%zu: Unexpected character\12\0"
	.text
	.def	next_token;	.scl	3;	.type	32;	.endef
next_token:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$168, %rsp
	movq	%rcx, 16(%rbp)
	movl	%edx, %eax
	movb	%al, 24(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movb	%al, -33(%rbp)
	cmpb	$0, -33(%rbp)
	jne	.L338
	movq	16(%rbp), %rax
	movq	40(%rax), %rdx
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rdx, %r9
	movq	%rax, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	create_token
	jmp	.L339
.L338:
	cmpb	$32, -33(%rbp)
	je	.L340
	cmpb	$9, -33(%rbp)
	je	.L340
	cmpb	$13, -33(%rbp)
	jne	.L341
.L340:
	movsbl	24(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	next_token
	jmp	.L339
.L341:
	cmpb	$10, -33(%rbp)
	jne	.L342
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 32(%rax)
	movq	16(%rbp), %rax
	movq	$0, 40(%rax)
	movsbl	24(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	next_token
	jmp	.L339
.L342:
	cmpb	$96, -33(%rbp)
	jle	.L343
	cmpb	$122, -33(%rbp)
	jle	.L344
.L343:
	cmpb	$64, -33(%rbp)
	jle	.L345
	cmpb	$90, -33(%rbp)
	jle	.L344
.L345:
	cmpb	$95, -33(%rbp)
	jne	.L346
.L344:
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	subq	$1, %rax
	movq	%rax, -128(%rbp)
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	subq	$1, %rax
	movq	%rax, -136(%rbp)
	jmp	.L347
.L349:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movb	%al, -33(%rbp)
.L347:
	cmpb	$96, -33(%rbp)
	jle	.L348
	cmpb	$122, -33(%rbp)
	jle	.L349
.L348:
	cmpb	$64, -33(%rbp)
	jle	.L350
	cmpb	$90, -33(%rbp)
	jle	.L349
.L350:
	cmpb	$47, -33(%rbp)
	jle	.L351
	cmpb	$57, -33(%rbp)
	jle	.L349
.L351:
	cmpb	$95, -33(%rbp)
	je	.L349
	movq	16(%rbp), %rax
	movl	$-1, %edx
	movq	%rax, %rcx
	call	move_position
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	subq	-128(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	8(%rdx), %rcx
	movq	-128(%rbp), %rdx
	addq	%rdx, %rcx
	movl	$1, %r8d
	movq	%rax, %rdx
	call	create_string_check
	movq	%rax, -144(%rbp)
	movq	-144(%rbp), %rax
	movq	%rax, %rcx
	call	is_keyword
	testb	%al, %al
	je	.L352
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	-136(%rbp), %rcx
	movq	-144(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_token
	jmp	.L339
.L352:
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	-136(%rbp), %rcx
	movq	-144(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_token
	jmp	.L339
.L346:
	cmpb	$47, -33(%rbp)
	jle	.L353
	cmpb	$57, -33(%rbp)
	jg	.L353
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	subq	$1, %rax
	movq	%rax, -56(%rbp)
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	subq	$1, %rax
	movq	%rax, -64(%rbp)
	jmp	.L354
.L356:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movb	%al, -33(%rbp)
.L354:
	cmpb	$47, -33(%rbp)
	jle	.L355
	cmpb	$57, -33(%rbp)
	jle	.L356
.L355:
	movl	$2, -40(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	peek_next_char
	movb	%al, -65(%rbp)
	cmpb	$46, -33(%rbp)
	jne	.L357
	cmpb	$47, -65(%rbp)
	jle	.L357
	cmpb	$57, -65(%rbp)
	jg	.L357
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movb	%al, -33(%rbp)
	jmp	.L358
.L360:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movb	%al, -33(%rbp)
.L358:
	cmpb	$47, -33(%rbp)
	jle	.L359
	cmpb	$57, -33(%rbp)
	jle	.L360
.L359:
	movl	$3, -40(%rbp)
.L357:
	movq	16(%rbp), %rax
	movl	$-1, %edx
	movq	%rax, %rcx
	call	move_position
	movq	16(%rbp), %rax
	movq	32(%rax), %rbx
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	subq	-56(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	8(%rdx), %rcx
	movq	-56(%rbp), %rdx
	addq	%rdx, %rcx
	movl	$1, %r8d
	movq	%rax, %rdx
	call	create_string_check
	movq	%rax, %rdx
	movq	-64(%rbp), %rcx
	movl	-40(%rbp), %eax
	movq	%rcx, %r9
	movq	%rbx, %r8
	movl	%eax, %ecx
	call	create_token
	jmp	.L339
.L353:
	cmpb	$34, -33(%rbp)
	jne	.L361
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -112(%rbp)
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	subq	$1, %rax
	movq	%rax, -120(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movb	%al, -33(%rbp)
	jmp	.L362
.L364:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movb	%al, -33(%rbp)
.L362:
	cmpb	$34, -33(%rbp)
	je	.L363
	cmpb	$0, -33(%rbp)
	je	.L363
	cmpb	$10, -33(%rbp)
	jne	.L364
.L363:
	cmpb	$34, -33(%rbp)
	je	.L365
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	1(%rax), %rsi
	movq	16(%rbp), %rax
	movq	(%rax), %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	-112(%rbp), %rax
	movq	%rax, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC118(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	cmpb	$10, -33(%rbp)
	jne	.L365
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 32(%rax)
	movq	16(%rbp), %rax
	movq	$0, 40(%rax)
.L365:
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	subq	-112(%rbp), %rax
	cmpq	$1, %rax
	jne	.L366
	movq	16(%rbp), %rax
	movq	32(%rax), %rbx
	movl	$1, %r8d
	movl	$1, %edx
	leaq	.LC119(%rip), %rax
	movq	%rax, %rcx
	call	create_string_check
	movq	-120(%rbp), %rdx
	movq	%rdx, %r9
	movq	%rbx, %r8
	movq	%rax, %rdx
	movl	$4, %ecx
	call	create_token
	jmp	.L339
.L366:
	movq	16(%rbp), %rax
	movq	32(%rax), %rbx
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	subq	-112(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	8(%rax), %rcx
	movq	-112(%rbp), %rax
	addq	%rcx, %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	create_string_check
	movq	-120(%rbp), %rdx
	movq	%rdx, %r9
	movq	%rbx, %r8
	movq	%rax, %rdx
	movl	$4, %ecx
	call	create_token
	jmp	.L339
.L361:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	peek_next_char
	movb	%al, -41(%rbp)
	cmpb	$47, -33(%rbp)
	jne	.L367
	cmpb	$47, -41(%rbp)
	jne	.L367
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	addq	$1, %rax
	movq	%rax, -80(%rbp)
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	subq	$1, %rax
	movq	%rax, -88(%rbp)
	jmp	.L368
.L370:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movb	%al, -33(%rbp)
.L368:
	cmpb	$10, -33(%rbp)
	je	.L369
	cmpb	$0, -33(%rbp)
	jne	.L370
.L369:
	movq	16(%rbp), %rax
	movl	$-1, %edx
	movq	%rax, %rcx
	call	move_position
	cmpb	$0, 24(%rbp)
	je	.L371
	movsbl	24(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	next_token
	jmp	.L339
.L371:
	movq	16(%rbp), %rax
	movq	32(%rax), %rbx
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	subq	-80(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	8(%rdx), %rcx
	movq	-80(%rbp), %rdx
	addq	%rdx, %rcx
	movl	$1, %r8d
	movq	%rax, %rdx
	call	create_string_check
	movq	-88(%rbp), %rdx
	movq	%rdx, %r9
	movq	%rbx, %r8
	movq	%rax, %rdx
	movl	$7, %ecx
	call	create_token
	jmp	.L339
.L367:
	cmpb	$47, -33(%rbp)
	jne	.L372
	cmpb	$42, -41(%rbp)
	jne	.L372
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	addq	$1, %rax
	movq	%rax, -96(%rbp)
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	subq	$1, %rax
	movq	%rax, -104(%rbp)
	jmp	.L373
.L378:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movb	%al, -33(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	peek_next_char
	movb	%al, -41(%rbp)
	cmpb	$10, -33(%rbp)
	jne	.L374
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 32(%rax)
	movq	16(%rbp), %rax
	movq	$0, 40(%rax)
.L374:
	cmpb	$0, -41(%rbp)
	je	.L413
	cmpb	$0, -33(%rbp)
	jne	.L373
	movq	-96(%rbp), %rax
	leaq	1(%rax), %rbx
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	1(%rax), %rdi
	movq	16(%rbp), %rax
	movq	(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC120(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	cmpb	$0, 24(%rbp)
	je	.L377
	movsbl	24(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	next_token
	jmp	.L339
.L377:
	movq	16(%rbp), %rax
	movq	32(%rax), %rbx
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	subq	-96(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	8(%rdx), %rcx
	movq	-96(%rbp), %rdx
	addq	%rdx, %rcx
	movl	$1, %r8d
	movq	%rax, %rdx
	call	create_string_check
	movq	-104(%rbp), %rdx
	movq	%rdx, %r9
	movq	%rbx, %r8
	movq	%rax, %rdx
	movl	$7, %ecx
	call	create_token
	jmp	.L339
.L373:
	cmpb	$42, -33(%rbp)
	jne	.L378
	cmpb	$47, -41(%rbp)
	jne	.L378
	jmp	.L376
.L413:
	nop
.L376:
	cmpb	$0, -41(%rbp)
	jne	.L379
	cmpb	$0, -33(%rbp)
	jne	.L380
	movq	16(%rbp), %rax
	movl	$-1, %edx
	movq	%rax, %rcx
	call	move_position
.L380:
	movq	-96(%rbp), %rax
	leaq	1(%rax), %rbx
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	1(%rax), %rdi
	movq	16(%rbp), %rax
	movq	(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC120(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	cmpb	$0, 24(%rbp)
	je	.L381
	movsbl	24(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	next_token
	jmp	.L339
.L381:
	movq	16(%rbp), %rax
	movq	32(%rax), %rbx
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	subq	-96(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	8(%rdx), %rcx
	movq	-96(%rbp), %rdx
	addq	%rdx, %rcx
	movl	$1, %r8d
	movq	%rax, %rdx
	call	create_string_check
	movq	-104(%rbp), %rdx
	movq	%rdx, %r9
	movq	%rbx, %r8
	movq	%rax, %rdx
	movl	$7, %ecx
	call	create_token
	jmp	.L339
.L379:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movb	%al, -33(%rbp)
	cmpb	$0, 24(%rbp)
	je	.L382
	movsbl	24(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	next_token
	jmp	.L339
.L382:
	movq	16(%rbp), %rax
	movq	32(%rax), %rbx
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	subq	-96(%rbp), %rax
	leaq	-2(%rax), %rdx
	movq	16(%rbp), %rax
	movq	8(%rax), %rcx
	movq	-96(%rbp), %rax
	addq	%rcx, %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	create_string_check
	movq	-104(%rbp), %rdx
	movq	%rdx, %r9
	movq	%rbx, %r8
	movq	%rax, %rdx
	movl	$7, %ecx
	call	create_token
	jmp	.L339
.L372:
	cmpb	$61, -33(%rbp)
	jne	.L383
	cmpb	$61, -41(%rbp)
	jne	.L383
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	152+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L383:
	cmpb	$33, -33(%rbp)
	jne	.L384
	cmpb	$61, -41(%rbp)
	jne	.L384
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	160+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L384:
	cmpb	$60, -33(%rbp)
	jne	.L385
	cmpb	$61, -41(%rbp)
	jne	.L385
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	168+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L385:
	cmpb	$62, -33(%rbp)
	jne	.L386
	cmpb	$61, -41(%rbp)
	jne	.L386
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	176+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L386:
	cmpb	$43, -33(%rbp)
	jne	.L387
	cmpb	$61, -41(%rbp)
	jne	.L387
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	184+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L387:
	cmpb	$45, -33(%rbp)
	jne	.L388
	cmpb	$61, -41(%rbp)
	jne	.L388
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	192+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L388:
	cmpb	$42, -33(%rbp)
	jne	.L389
	cmpb	$61, -41(%rbp)
	jne	.L389
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	200+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L389:
	cmpb	$47, -33(%rbp)
	jne	.L390
	cmpb	$61, -41(%rbp)
	jne	.L390
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	208+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L390:
	cmpb	$37, -33(%rbp)
	jne	.L391
	cmpb	$61, -41(%rbp)
	jne	.L391
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	216+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L391:
	cmpb	$38, -33(%rbp)
	jne	.L392
	cmpb	$38, -41(%rbp)
	jne	.L392
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	224+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L392:
	cmpb	$124, -33(%rbp)
	jne	.L393
	cmpb	$124, -41(%rbp)
	jne	.L393
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_current_char
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-2(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	232+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L393:
	cmpb	$40, -33(%rbp)
	jne	.L394
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L394:
	cmpb	$41, -33(%rbp)
	jne	.L395
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	8+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L395:
	cmpb	$123, -33(%rbp)
	jne	.L396
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	16+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L396:
	cmpb	$125, -33(%rbp)
	jne	.L397
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	24+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L397:
	cmpb	$44, -33(%rbp)
	jne	.L398
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	32+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L398:
	cmpb	$33, -33(%rbp)
	jne	.L399
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	40+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L399:
	cmpb	$46, -33(%rbp)
	jne	.L400
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	48+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L400:
	cmpb	$91, -33(%rbp)
	jne	.L401
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	56+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L401:
	cmpb	$93, -33(%rbp)
	jne	.L402
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	64+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L402:
	cmpb	$59, -33(%rbp)
	jne	.L403
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	72+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L403:
	cmpb	$95, -33(%rbp)
	jne	.L404
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	80+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L404:
	cmpb	$43, -33(%rbp)
	jne	.L405
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	88+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L405:
	cmpb	$45, -33(%rbp)
	jne	.L406
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	96+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L406:
	cmpb	$42, -33(%rbp)
	jne	.L407
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	104+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L407:
	cmpb	$47, -33(%rbp)
	jne	.L408
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	112+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L408:
	cmpb	$37, -33(%rbp)
	jne	.L409
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	120+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L409:
	cmpb	$60, -33(%rbp)
	jne	.L410
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	128+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L410:
	cmpb	$62, -33(%rbp)
	jne	.L411
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	136+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L411:
	cmpb	$61, -33(%rbp)
	jne	.L412
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	144+symbolList(%rip), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$5, %ecx
	call	create_token
	jmp	.L339
.L412:
	movq	16(%rbp), %rax
	movq	40(%rax), %rbx
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	leaq	1(%rax), %rdi
	movq	16(%rbp), %rax
	movq	(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC121(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_token
.L339:
	addq	$168, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.def	get_next_token;	.scl	3;	.type	32;	.endef
get_next_token:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movl	%edx, %eax
	movb	%al, 24(%rbp)
	movq	16(%rbp), %rax
	movq	48(%rax), %rax
	testq	%rax, %rax
	je	.L415
	movq	16(%rbp), %rax
	movq	48(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 80(%rax)
	movq	16(%rbp), %rax
	movq	56(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	64(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 32(%rax)
	movq	16(%rbp), %rax
	movq	72(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 40(%rax)
	movq	16(%rbp), %rax
	movq	$0, 48(%rax)
	movq	16(%rbp), %rax
	movq	80(%rax), %rax
	jmp	.L416
.L415:
	movsbl	24(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	next_token
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 80(%rax)
	movq	16(%rbp), %rax
	movq	80(%rax), %rax
.L416:
	leave
	ret
	.def	peek_next_token;	.scl	3;	.type	32;	.endef
peek_next_token:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movl	%edx, %eax
	movb	%al, 24(%rbp)
	movq	16(%rbp), %rax
	movq	48(%rax), %rax
	testq	%rax, %rax
	je	.L418
	movq	16(%rbp), %rax
	movq	48(%rax), %rax
	jmp	.L419
.L418:
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	16(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -24(%rbp)
	movsbl	24(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -32(%rbp)
	movq	16(%rbp), %rax
	movq	16(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 56(%rax)
	movq	16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 64(%rax)
	movq	16(%rbp), %rax
	movq	40(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 72(%rax)
	movq	16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	16(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 40(%rax)
	movq	16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 48(%rax)
	movq	-32(%rbp), %rax
.L419:
	leave
	ret
	.def	reset_lexer;	.scl	3;	.type	32;	.endef
reset_lexer:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	$0, 16(%rax)
	movq	16(%rbp), %rax
	movq	$0, 32(%rax)
	movq	16(%rbp), %rax
	movq	$0, 40(%rax)
	movq	16(%rbp), %rax
	movq	$0, 48(%rax)
	movq	16(%rbp), %rax
	movq	$0, 56(%rax)
	movq	16(%rbp), %rax
	movq	$0, 64(%rax)
	movq	16(%rbp), %rax
	movq	$0, 72(%rax)
	movq	16(%rbp), %rax
	movq	$0, 80(%rax)
	nop
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC122:
	.ascii "import\12\0"
.LC123:
	.ascii "function\12\0"
.LC124:
	.ascii "class\12\0"
.LC125:
	.ascii "unknown_CodeMemberType: %u\12\0"
	.text
	.def	output_code_member;	.scl	3;	.type	32;	.endef
output_code_member:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$2, %eax
	je	.L422
	cmpl	$2, %eax
	ja	.L423
	testl	%eax, %eax
	je	.L424
	cmpl	$1, %eax
	je	.L425
	jmp	.L423
.L424:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC122(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_import
	jmp	.L426
.L425:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC123(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_function
	jmp	.L426
.L422:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC124(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_class
	jmp	.L426
.L423:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	16(%rbp), %rax
	movl	8(%rax), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC125(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
.L426:
	nop
	leave
	ret
	.def	output_code;	.scl	3;	.type	32;	.endef
output_code:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -8(%rbp)
	jmp	.L428
.L429:
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_code_member
.L428:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L429
	nop
	nop
	leave
	ret
	.section .rdata,"dr"
.LC126:
	.ascii "name\12\0"
.LC127:
	.ascii "NULL\0"
.LC128:
	.ascii "source: \"%s\"\12\0"
	.text
	.def	output_import;	.scl	3;	.type	32;	.endef
output_import:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC126(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L431
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	jmp	.L432
.L431:
	leaq	.LC127(%rip), %rax
.L432:
	movq	24(%rbp), %rcx
	movq	%rax, %r8
	leaq	.LC128(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	nop
	leave
	ret
	.section .rdata,"dr"
.LC129:
	.ascii "return_type\12\0"
.LC130:
	.ascii "parameters\12\0"
.LC131:
	.ascii "parameters[%d]\12\0"
.LC132:
	.ascii "body\12\0"
	.text
	.def	output_function;	.scl	3;	.type	32;	.endef
output_function:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC126(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC129(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC130(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -16(%rbp)
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -24(%rbp)
	movl	$-1, -4(%rbp)
	jmp	.L434
.L435:
	movq	32(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC131(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	32(%rbp), %rax
	leaq	2(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_variable
.L434:
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L435
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC132(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L436
.L437:
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_statement
.L436:
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L437
	nop
	nop
	leave
	ret
	.def	output_method;	.scl	3;	.type	32;	.endef
output_method:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC126(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC129(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC130(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -16(%rbp)
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -24(%rbp)
	movl	$-1, -4(%rbp)
	jmp	.L439
.L440:
	movq	32(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC131(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	32(%rbp), %rax
	leaq	2(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_variable
.L439:
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L440
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC132(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L441
.L442:
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_statement
.L441:
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L442
	nop
	nop
	leave
	ret
	.section .rdata,"dr"
.LC133:
	.ascii "method\12\0"
.LC134:
	.ascii "variable\12\0"
.LC135:
	.ascii "unknown_ClassMemberType: %u\12\0"
	.text
	.def	output_class_member;	.scl	3;	.type	32;	.endef
output_class_member:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	je	.L444
	cmpl	$1, %eax
	je	.L445
	jmp	.L448
.L444:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC133(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_method
	jmp	.L447
.L445:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC134(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_variable
	jmp	.L447
.L448:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	16(%rbp), %rax
	movl	8(%rax), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC135(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
.L447:
	nop
	leave
	ret
	.section .rdata,"dr"
.LC136:
	.ascii "members\12\0"
	.text
	.def	output_class;	.scl	3;	.type	32;	.endef
output_class:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC126(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC136(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -8(%rbp)
	jmp	.L450
.L451:
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_class_member
.L450:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L451
	nop
	nop
	leave
	ret
	.section .rdata,"dr"
.LC137:
	.ascii "type\12\0"
.LC138:
	.ascii "value\12\0"
.LC139:
	.ascii "value: \"NULL\"\12\0"
	.text
	.def	output_variable;	.scl	3;	.type	32;	.endef
output_variable:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC137(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC126(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L453
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC138(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
	jmp	.L455
.L453:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC139(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L455:
	nop
	leave
	ret
	.section .rdata,"dr"
.LC140:
	.ascii "if_statement\12\0"
.LC141:
	.ascii "for_statement\12\0"
.LC142:
	.ascii "while_statement\12\0"
	.align 8
.LC143:
	.ascii "variable_declaration_statement\12\0"
.LC144:
	.ascii "return_statement: \"NULL\"\12\0"
.LC145:
	.ascii "return_statement\12\0"
.LC146:
	.ascii "break_statement: \"NULL\"\12\0"
.LC147:
	.ascii "continue_statement: \"NULL\"\12\0"
.LC148:
	.ascii "expression_statement: \"NULL\"\12\0"
.LC149:
	.ascii "expression_statement\12\0"
.LC150:
	.ascii "unknown_StatementType: %u\12\0"
	.text
	.def	output_statement;	.scl	3;	.type	32;	.endef
output_statement:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$7, %eax
	ja	.L457
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L459(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L459(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L459:
	.long	.L466-.L459
	.long	.L465-.L459
	.long	.L464-.L459
	.long	.L463-.L459
	.long	.L462-.L459
	.long	.L461-.L459
	.long	.L460-.L459
	.long	.L458-.L459
	.text
.L464:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC140(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_if
	jmp	.L456
.L462:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC141(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_for
	jmp	.L456
.L463:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC142(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_while
	jmp	.L456
.L465:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$31, %r8d
	movl	$1, %edx
	leaq	.LC143(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_variable
	jmp	.L456
.L461:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L468
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$25, %r8d
	movl	$1, %edx
	leaq	.LC144(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L456
.L468:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC145(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
	jmp	.L456
.L460:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$24, %r8d
	movl	$1, %edx
	leaq	.LC146(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L456
.L458:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$27, %r8d
	movl	$1, %edx
	leaq	.LC147(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L456
.L466:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L469
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$29, %r8d
	movl	$1, %edx
	leaq	.LC148(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L456
.L469:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$21, %r8d
	movl	$1, %edx
	leaq	.LC149(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
	jmp	.L456
.L457:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	16(%rbp), %rax
	movl	8(%rax), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC150(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
.L456:
	leave
	ret
	.section .rdata,"dr"
.LC151:
	.ascii "condition\12\0"
.LC152:
	.ascii "else_if\12\0"
.LC153:
	.ascii "else_body\12\0"
	.text
	.def	output_if;	.scl	3;	.type	32;	.endef
output_if:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -16(%rbp)
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -24(%rbp)
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC151(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC132(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L471
.L472:
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_statement
.L471:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L472
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC152(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L473
.L474:
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_else_if
.L473:
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L474
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC153(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L475
.L476:
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_statement
.L475:
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L476
	nop
	nop
	leave
	ret
	.def	output_else_if;	.scl	3;	.type	32;	.endef
output_else_if:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -8(%rbp)
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC151(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC132(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L478
.L479:
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_statement
.L478:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L479
	nop
	nop
	leave
	ret
	.section .rdata,"dr"
.LC154:
	.ascii "initializer\12\0"
.LC155:
	.ascii "initializer: \"NULL\"\12\0"
.LC156:
	.ascii "condition: \"NULL\"\12\0"
.LC157:
	.ascii "increment\12\0"
.LC158:
	.ascii "increment: \"NULL\"\12\0"
	.text
	.def	output_for;	.scl	3;	.type	32;	.endef
output_for:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L481
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC154(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_variable
	jmp	.L482
.L481:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$20, %r8d
	movl	$1, %edx
	leaq	.LC155(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L482:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L483
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC151(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
	jmp	.L484
.L483:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC156(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L484:
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L485
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC157(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
	jmp	.L486
.L485:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC158(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L486:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC132(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L487
.L488:
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_statement
.L487:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L488
	nop
	nop
	leave
	ret
	.def	output_while;	.scl	3;	.type	32;	.endef
output_while:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -8(%rbp)
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC151(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC132(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L490
.L491:
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_statement
.L490:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L491
	nop
	nop
	leave
	ret
	.section .rdata,"dr"
.LC159:
	.ascii "primary\12\0"
.LC160:
	.ascii "UNKNOWN_OPERATOR\0"
.LC161:
	.ascii "operator: \"%s\"\12\0"
.LC162:
	.ascii "left\12\0"
.LC163:
	.ascii "right\12\0"
	.text
	.def	output_expression;	.scl	3;	.type	32;	.endef
output_expression:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$19, %eax
	jne	.L493
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC159(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_primary
	jmp	.L497
.L493:
	movq	16(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, %ecx
	call	operator_to_string
	movq	%rax, -8(%rbp)
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	cmpq	$0, -8(%rbp)
	je	.L495
	movq	-8(%rbp), %rax
	jmp	.L496
.L495:
	leaq	.LC160(%rip), %rax
.L496:
	movq	24(%rbp), %rcx
	movq	%rax, %r8
	leaq	.LC161(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC162(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC163(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
.L497:
	nop
	leave
	ret
	.section .rdata,"dr"
.LC164:
	.ascii "type: \"integer\"\12\0"
.LC165:
	.ascii "value: %s\12\0"
.LC166:
	.ascii "type: \"float\"\12\0"
.LC167:
	.ascii "type: \"string\"\12\0"
.LC168:
	.ascii "value: \"%s\"\12\0"
.LC169:
	.ascii "type: \"boolean\"\12\0"
.LC170:
	.ascii "value: \"true\"\12\0"
.LC171:
	.ascii "value: \"false\"\12\0"
.LC172:
	.ascii "type: \"expression\"\12\0"
.LC173:
	.ascii "type: \"!\"\12\0"
.LC174:
	.ascii "type: \"-\"\12\0"
.LC175:
	.ascii "type: \"variable\"\12\0"
.LC176:
	.ascii "unknown_PrimaryType: %u\12\0"
	.text
	.def	output_primary;	.scl	3;	.type	32;	.endef
output_primary:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$8, %eax
	ja	.L499
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L501(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L501(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L501:
	.long	.L509-.L501
	.long	.L508-.L501
	.long	.L507-.L501
	.long	.L506-.L501
	.long	.L505-.L501
	.long	.L504-.L501
	.long	.L503-.L501
	.long	.L502-.L501
	.long	.L500-.L501
	.text
.L509:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC164(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC165(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L510
.L508:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC166(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC165(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L510
.L507:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC167(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC168(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L510
.L506:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC169(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC170(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L510
.L505:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC169(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC171(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L510
.L504:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$19, %r8d
	movl	$1, %edx
	leaq	.LC172(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC138(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
	jmp	.L510
.L503:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC173(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC138(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_primary
	jmp	.L510
.L502:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC174(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC138(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_primary
	jmp	.L510
.L500:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC175(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC138(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_variable_access
	jmp	.L510
.L499:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	16(%rbp), %rax
	movl	8(%rax), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC176(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
.L510:
	nop
	leave
	ret
	.section .rdata,"dr"
.LC177:
	.ascii "type: \"name\"\12\0"
.LC178:
	.ascii "type: \"function_call\"\12\0"
.LC179:
	.ascii "arguments\12\0"
.LC180:
	.ascii "arguments[%d]\12\0"
.LC181:
	.ascii "type: \"get sequence_element\"\12\0"
.LC182:
	.ascii "sequence\12\0"
.LC183:
	.ascii "index\12\0"
.LC184:
	.ascii "type: \"get_attribute\"\12\0"
.LC185:
	.ascii "object\12\0"
.LC186:
	.ascii "attribute_name\12\0"
	.align 8
.LC187:
	.ascii "unknown_VariableAccessType: %u\12\0"
	.text
	.def	output_variable_access;	.scl	3;	.type	32;	.endef
output_variable_access:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$3, %eax
	je	.L512
	cmpl	$3, %eax
	ja	.L513
	cmpl	$2, %eax
	je	.L514
	cmpl	$2, %eax
	ja	.L513
	testl	%eax, %eax
	je	.L515
	cmpl	$1, %eax
	je	.L516
	jmp	.L513
.L515:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC177(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC126(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	jmp	.L517
.L516:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -16(%rbp)
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$22, %r8d
	movl	$1, %edx
	leaq	.LC178(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC123(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_variable_access
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC179(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$-1, -4(%rbp)
	jmp	.L518
.L519:
	movq	32(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC180(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	32(%rbp), %rax
	leaq	2(%rax), %r8
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
.L518:
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L519
	jmp	.L517
.L512:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$29, %r8d
	movl	$1, %edx
	leaq	.LC181(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC182(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_variable_access
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC183(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_expression
	jmp	.L517
.L514:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$22, %r8d
	movl	$1, %edx
	leaq	.LC184(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC185(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_variable_access
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC186(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	jmp	.L517
.L513:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	16(%rbp), %rax
	movl	16(%rax), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC187(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
.L517:
	nop
	leave
	ret
	.section .rdata,"dr"
.LC188:
	.ascii "Name: \"NULL\"\12\0"
.LC189:
	.ascii "name: \"%s\"\12\0"
.LC190:
	.ascii "id: %zu\12\0"
.LC191:
	.ascii "kind: \"type\"\12\0"
.LC192:
	.ascii "kind: \"variable\"\12\0"
.LC193:
	.ascii "kind: \"function\"\12\0"
.LC194:
	.ascii "kind: \"method\"\12\0"
.LC195:
	.ascii "kind: \"class\"\12\0"
.LC196:
	.ascii "kind: \"attribute\"\12\0"
.LC197:
	.ascii "kind: \"parameter\"\12\0"
.LC198:
	.ascii "kind: \"unknown_NameType\"\12\0"
	.text
	.def	output_name;	.scl	3;	.type	32;	.endef
output_name:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L521
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC188(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L520
.L521:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC189(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	16(%rbp), %rax
	movq	16(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC190(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	16(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$6, %eax
	ja	.L523
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L525(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L525(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L525:
	.long	.L531-.L525
	.long	.L530-.L525
	.long	.L529-.L525
	.long	.L528-.L525
	.long	.L527-.L525
	.long	.L526-.L525
	.long	.L524-.L525
	.text
.L524:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$13, %r8d
	movl	$1, %edx
	leaq	.LC191(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L520
.L528:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC192(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC137(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	jmp	.L520
.L530:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC193(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC129(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	jmp	.L520
.L529:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC194(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC129(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	jmp	.L520
.L531:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC195(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L520
.L526:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC196(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC137(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	jmp	.L520
.L527:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC197(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC137(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	32(%rbp), %rax
	leaq	1(%rax), %r8
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	output_name
	jmp	.L520
.L523:
	movq	40(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	indention
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$25, %r8d
	movl	$1, %edx
	leaq	.LC198(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	nop
.L520:
	leave
	ret
	.section .rdata,"dr"
.LC199:
	.ascii "TAC: \"NULL\"\12\0"
.LC200:
	.ascii "TAC {\12\0"
.LC201:
	.ascii "designs: []\12\0"
.LC202:
	.ascii "designs: [\12\0"
.LC203:
	.ascii "]\12\0"
.LC204:
	.ascii "entry_point: \"NULL\"\12\0"
.LC205:
	.ascii "entry_point: %s\12\0"
.LC206:
	.ascii "global: []\12\0"
.LC207:
	.ascii "global: [\12\0"
.LC208:
	.ascii "subroutines: []\12\0"
.LC209:
	.ascii "subroutines: [\12\0"
.LC210:
	.ascii "}\12\0"
	.text
	.def	output_TAC;	.scl	3;	.type	32;	.endef
output_TAC:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$176, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L533
	movq	$0, -8(%rbp)
	jmp	.L534
.L535:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -8(%rbp)
.L534:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -8(%rbp)
	jb	.L535
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC199(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L532
.L533:
	movq	$0, -16(%rbp)
	jmp	.L537
.L538:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -16(%rbp)
.L537:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -16(%rbp)
	jb	.L538
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC200(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L539
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L539
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L540
.L539:
	movq	$0, -24(%rbp)
	jmp	.L541
.L542:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -24(%rbp)
.L541:
	movq	32(%rbp), %rax
	addq	$1, %rax
	salq	$2, %rax
	cmpq	%rax, -24(%rbp)
	jb	.L542
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC201(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L543
.L540:
	movq	$0, -32(%rbp)
	jmp	.L544
.L545:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -32(%rbp)
.L544:
	movq	32(%rbp), %rax
	addq	$1, %rax
	salq	$2, %rax
	cmpq	%rax, -32(%rbp)
	jb	.L545
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC202(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L546
.L547:
	movq	32(%rbp), %rax
	leaq	2(%rax), %rcx
	movq	24(%rbp), %rdx
	movq	-120(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	output_attribute_table
.L546:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -120(%rbp)
	cmpq	$0, -120(%rbp)
	jne	.L547
	movq	$0, -40(%rbp)
	jmp	.L548
.L549:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -40(%rbp)
.L548:
	movq	32(%rbp), %rax
	addq	$1, %rax
	salq	$2, %rax
	cmpq	%rax, -40(%rbp)
	jb	.L549
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC203(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L543:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L550
	movq	$0, -48(%rbp)
	jmp	.L551
.L552:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -48(%rbp)
.L551:
	movq	32(%rbp), %rax
	addq	$1, %rax
	salq	$2, %rax
	cmpq	%rax, -48(%rbp)
	jb	.L552
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$20, %r8d
	movl	$1, %edx
	leaq	.LC204(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L553
.L550:
	movq	$0, -56(%rbp)
	jmp	.L554
.L555:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -56(%rbp)
.L554:
	movq	32(%rbp), %rax
	addq	$1, %rax
	salq	$2, %rax
	cmpq	%rax, -56(%rbp)
	jb	.L555
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC205(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L553:
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L556
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L556
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L557
.L556:
	movq	$0, -64(%rbp)
	jmp	.L558
.L559:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -64(%rbp)
.L558:
	movq	32(%rbp), %rax
	addq	$1, %rax
	salq	$2, %rax
	cmpq	%rax, -64(%rbp)
	jb	.L559
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$11, %r8d
	movl	$1, %edx
	leaq	.LC206(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L560
.L557:
	movq	$0, -72(%rbp)
	jmp	.L561
.L562:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -72(%rbp)
.L561:
	movq	32(%rbp), %rax
	addq	$1, %rax
	salq	$2, %rax
	cmpq	%rax, -72(%rbp)
	jb	.L562
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC207(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L563
.L564:
	movq	32(%rbp), %rax
	leaq	2(%rax), %rcx
	movq	24(%rbp), %rdx
	movq	-128(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	output_var
.L563:
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -128(%rbp)
	cmpq	$0, -128(%rbp)
	jne	.L564
	movq	$0, -80(%rbp)
	jmp	.L565
.L566:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -80(%rbp)
.L565:
	movq	32(%rbp), %rax
	addq	$1, %rax
	salq	$2, %rax
	cmpq	%rax, -80(%rbp)
	jb	.L566
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC203(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L560:
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L567
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L567
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L568
.L567:
	movq	$0, -88(%rbp)
	jmp	.L569
.L570:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -88(%rbp)
.L569:
	movq	32(%rbp), %rax
	addq	$1, %rax
	salq	$2, %rax
	cmpq	%rax, -88(%rbp)
	jb	.L570
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC208(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L571
.L568:
	movq	$0, -96(%rbp)
	jmp	.L572
.L573:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -96(%rbp)
.L572:
	movq	32(%rbp), %rax
	addq	$1, %rax
	salq	$2, %rax
	cmpq	%rax, -96(%rbp)
	jb	.L573
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC209(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L574
.L575:
	movq	32(%rbp), %rax
	leaq	2(%rax), %rcx
	movq	24(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	output_subroutine
.L574:
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -136(%rbp)
	cmpq	$0, -136(%rbp)
	jne	.L575
	movq	$0, -104(%rbp)
	jmp	.L576
.L577:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -104(%rbp)
.L576:
	movq	32(%rbp), %rax
	addq	$1, %rax
	salq	$2, %rax
	cmpq	%rax, -104(%rbp)
	jb	.L577
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC203(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L571:
	movq	$0, -112(%rbp)
	jmp	.L578
.L579:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -112(%rbp)
.L578:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -112(%rbp)
	jb	.L579
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC210(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L532:
	leave
	ret
	.section .rdata,"dr"
.LC211:
	.ascii "Subroutine: \"NULL\"\12\0"
.LC212:
	.ascii "NULL {\12\0"
.LC213:
	.ascii "%s {\12\0"
.LC214:
	.ascii "return_type: \"NULL\"\12\0"
.LC215:
	.ascii "return_type: %s\12\0"
.LC216:
	.ascii "parameters: []\12\0"
.LC217:
	.ascii "parameters: [\12\0"
.LC218:
	.ascii "local: []\12\0"
.LC219:
	.ascii "local: [\12\0"
.LC220:
	.ascii "instructions: []\12\0"
.LC221:
	.ascii "instructions: [\12\0"
	.text
	.def	output_subroutine;	.scl	3;	.type	32;	.endef
output_subroutine:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$176, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L581
	movq	$0, -8(%rbp)
	jmp	.L582
.L583:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -8(%rbp)
.L582:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -8(%rbp)
	jb	.L583
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$19, %r8d
	movl	$1, %edx
	leaq	.LC211(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L580
.L581:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L585
	movq	$0, -16(%rbp)
	jmp	.L586
.L587:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -16(%rbp)
.L586:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -16(%rbp)
	jb	.L587
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC212(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L588
.L585:
	movq	$0, -24(%rbp)
	jmp	.L589
.L590:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -24(%rbp)
.L589:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -24(%rbp)
	jb	.L590
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC213(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L588:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L591
	movq	$0, -32(%rbp)
	jmp	.L592
.L593:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -32(%rbp)
.L592:
	movq	32(%rbp), %rax
	addq	$1, %rax
	salq	$2, %rax
	cmpq	%rax, -32(%rbp)
	jb	.L593
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$20, %r8d
	movl	$1, %edx
	leaq	.LC214(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L594
.L591:
	movq	$0, -40(%rbp)
	jmp	.L595
.L596:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -40(%rbp)
.L595:
	movq	32(%rbp), %rax
	addq	$1, %rax
	salq	$2, %rax
	cmpq	%rax, -40(%rbp)
	jb	.L596
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC215(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L594:
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L597
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L597
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L598
.L597:
	movq	$0, -48(%rbp)
	jmp	.L599
.L600:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -48(%rbp)
.L599:
	movq	32(%rbp), %rax
	addq	$1, %rax
	salq	$2, %rax
	cmpq	%rax, -48(%rbp)
	jb	.L600
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$15, %r8d
	movl	$1, %edx
	leaq	.LC216(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L601
.L598:
	movq	$0, -56(%rbp)
	jmp	.L602
.L603:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -56(%rbp)
.L602:
	movq	32(%rbp), %rax
	addq	$1, %rax
	salq	$2, %rax
	cmpq	%rax, -56(%rbp)
	jb	.L603
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC217(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L604
.L605:
	movq	32(%rbp), %rax
	leaq	2(%rax), %rcx
	movq	24(%rbp), %rdx
	movq	-128(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	output_var
.L604:
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -128(%rbp)
	cmpq	$0, -128(%rbp)
	jne	.L605
	movq	$0, -64(%rbp)
	jmp	.L606
.L607:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -64(%rbp)
.L606:
	movq	32(%rbp), %rax
	addq	$1, %rax
	salq	$2, %rax
	cmpq	%rax, -64(%rbp)
	jb	.L607
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC203(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L601:
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L608
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L608
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L609
.L608:
	movq	$0, -72(%rbp)
	jmp	.L610
.L611:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -72(%rbp)
.L610:
	movq	32(%rbp), %rax
	addq	$1, %rax
	salq	$2, %rax
	cmpq	%rax, -72(%rbp)
	jb	.L611
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC218(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L612
.L609:
	movq	$0, -80(%rbp)
	jmp	.L613
.L614:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -80(%rbp)
.L613:
	movq	32(%rbp), %rax
	addq	$1, %rax
	salq	$2, %rax
	cmpq	%rax, -80(%rbp)
	jb	.L614
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC219(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L615
.L616:
	movq	32(%rbp), %rax
	leaq	2(%rax), %rcx
	movq	24(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	output_var
.L615:
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -136(%rbp)
	cmpq	$0, -136(%rbp)
	jne	.L616
	movq	$0, -88(%rbp)
	jmp	.L617
.L618:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -88(%rbp)
.L617:
	movq	32(%rbp), %rax
	addq	$1, %rax
	salq	$2, %rax
	cmpq	%rax, -88(%rbp)
	jb	.L618
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC203(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L612:
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	je	.L619
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L619
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L620
.L619:
	movq	$0, -96(%rbp)
	jmp	.L621
.L622:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -96(%rbp)
.L621:
	movq	32(%rbp), %rax
	addq	$1, %rax
	salq	$2, %rax
	cmpq	%rax, -96(%rbp)
	jb	.L622
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$17, %r8d
	movl	$1, %edx
	leaq	.LC220(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L623
.L620:
	movq	$0, -104(%rbp)
	jmp	.L624
.L625:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -104(%rbp)
.L624:
	movq	32(%rbp), %rax
	addq	$1, %rax
	salq	$2, %rax
	cmpq	%rax, -104(%rbp)
	jb	.L625
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$16, %r8d
	movl	$1, %edx
	leaq	.LC221(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L626
.L627:
	movq	32(%rbp), %rax
	leaq	2(%rax), %rcx
	movq	24(%rbp), %rdx
	movq	-144(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	output_block
.L626:
	movq	16(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -144(%rbp)
	cmpq	$0, -144(%rbp)
	jne	.L627
	movq	$0, -112(%rbp)
	jmp	.L628
.L629:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -112(%rbp)
.L628:
	movq	32(%rbp), %rax
	addq	$1, %rax
	salq	$2, %rax
	cmpq	%rax, -112(%rbp)
	jb	.L629
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC203(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L623:
	movq	$0, -120(%rbp)
	jmp	.L630
.L631:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -120(%rbp)
.L630:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -120(%rbp)
	jb	.L631
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC210(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L580:
	leave
	ret
	.section .rdata,"dr"
.LC222:
	.ascii "Var: \"NULL\"\12\0"
.LC223:
	.ascii "NULL\11%s\12\0"
.LC224:
	.ascii "%s\11%s(%s)\12\0"
.LC225:
	.ascii "%s\11%s\12\0"
	.text
	.def	output_var;	.scl	3;	.type	32;	.endef
output_var:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L633
	movq	$0, -8(%rbp)
	jmp	.L634
.L635:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -8(%rbp)
.L634:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -8(%rbp)
	jb	.L635
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$12, %r8d
	movl	$1, %edx
	leaq	.LC222(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L632
.L633:
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L637
	movq	$0, -16(%rbp)
	jmp	.L638
.L639:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -16(%rbp)
.L638:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -16(%rbp)
	jb	.L639
	movq	16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC223(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L632
.L637:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L640
	movq	$0, -24(%rbp)
	jmp	.L641
.L642:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -24(%rbp)
.L641:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -24(%rbp)
	jb	.L642
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movq	16(%rbp), %rax
	movq	8(%rax), %r8
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rcx
	movq	24(%rbp), %rax
	movq	%rdx, 32(%rsp)
	movq	%r8, %r9
	movq	%rcx, %r8
	leaq	.LC224(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L632
.L640:
	movq	$0, -32(%rbp)
	jmp	.L643
.L644:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -32(%rbp)
.L643:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -32(%rbp)
	jb	.L644
	movq	16(%rbp), %rax
	movq	8(%rax), %rcx
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC225(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L632:
	leave
	ret
	.section .rdata,"dr"
.LC226:
	.ascii "Block: \"NULL\"\12\0"
.LC227:
	.ascii "NULL \0"
.LC228:
	.ascii "%s \0"
.LC229:
	.ascii "{}\12\0"
.LC230:
	.ascii "{\12\0"
	.text
	.def	output_block;	.scl	3;	.type	32;	.endef
output_block:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L646
	movq	$0, -8(%rbp)
	jmp	.L647
.L648:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -8(%rbp)
.L647:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -8(%rbp)
	jb	.L648
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$14, %r8d
	movl	$1, %edx
	leaq	.LC226(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L645
.L646:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L650
	movq	$0, -16(%rbp)
	jmp	.L651
.L652:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -16(%rbp)
.L651:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -16(%rbp)
	jb	.L652
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC227(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L653
.L650:
	movq	$0, -24(%rbp)
	jmp	.L654
.L655:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -24(%rbp)
.L654:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -24(%rbp)
	jb	.L655
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC228(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L653:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L656
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L656
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L657
.L656:
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$3, %r8d
	movl	$1, %edx
	leaq	.LC229(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L645
.L657:
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC230(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L658
.L659:
	movq	32(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	output_instruction
.L658:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L659
	movq	$0, -32(%rbp)
	jmp	.L660
.L661:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -32(%rbp)
.L660:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -32(%rbp)
	jb	.L661
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC210(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L645:
	leave
	ret
	.section .rdata,"dr"
.LC231:
	.ascii "\"NULL\"\0"
.LC232:
	.ascii "%s(%s)\0"
.LC233:
	.ascii "%lld\0"
.LC234:
	.ascii "%f\0"
.LC235:
	.ascii "\"%s\"\0"
.LC236:
	.ascii "NONE\0"
.LC237:
	.ascii "unknown_ArgType: %u\0"
	.text
	.def	output_arg;	.scl	3;	.type	32;	.endef
output_arg:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L663
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC231(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L662
.L663:
	movq	16(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$9, %eax
	ja	.L665
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L667(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L667(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L667:
	.long	.L675-.L667
	.long	.L674-.L667
	.long	.L673-.L667
	.long	.L672-.L667
	.long	.L671-.L667
	.long	.L670-.L667
	.long	.L669-.L667
	.long	.L668-.L667
	.long	.L668-.L667
	.long	.L666-.L667
	.text
.L675:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L676
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rcx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC232(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L662
.L676:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	fputs
	jmp	.L662
.L674:
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC233(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L662
.L673:
	movq	16(%rbp), %rax
	movsd	(%rax), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %rdx
	movq	%rdx, %xmm0
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movapd	%xmm0, %xmm2
	movq	%rdx, %r8
	leaq	.LC234(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L662
.L672:
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC235(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L662
.L671:
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L678
	leaq	.LC11(%rip), %rax
	jmp	.L679
.L678:
	leaq	.LC12(%rip), %rax
.L679:
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	fputs
	jmp	.L662
.L670:
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC20(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L662
.L669:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	fputs
	jmp	.L662
.L668:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L680
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rcx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC232(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L662
.L680:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	fputs
	jmp	.L662
.L666:
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC236(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L662
.L665:
	movq	16(%rbp), %rax
	movl	16(%rax), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC237(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
.L662:
	leave
	ret
	.section .rdata,"dr"
.LC238:
	.ascii "Instruction: \"NULL\"\12\0"
.LC239:
	.ascii "add\11\0"
.LC240:
	.ascii "sub\11\0"
.LC241:
	.ascii "mul\11\0"
.LC242:
	.ascii "div\11\0"
.LC243:
	.ascii "mod\11\0"
.LC244:
	.ascii "eq \11\0"
.LC245:
	.ascii "ne \11\0"
.LC246:
	.ascii "lt \11\0"
.LC247:
	.ascii "gt \11\0"
.LC248:
	.ascii "le \11\0"
.LC249:
	.ascii "ge \11\0"
.LC250:
	.ascii "and\11\0"
.LC251:
	.ascii "or \11\0"
.LC252:
	.ascii "not\11\0"
.LC253:
	.ascii "assign\11\0"
.LC254:
	.ascii "get_attr\11\0"
.LC255:
	.ascii "get_elem\11\0"
.LC256:
	.ascii "param\11\0"
.LC257:
	.ascii "alloc\11\0"
.LC258:
	.ascii "jmp_c\11\0"
.LC259:
	.ascii "jmp\11\0"
.LC260:
	.ascii "ret\11\0"
.LC261:
	.ascii "call\11\0"
.LC262:
	.ascii "load\11\0"
.LC263:
	.ascii "store\11\0"
.LC264:
	.ascii "INST_NONE\12\0"
.LC265:
	.ascii "unknown_InstructionType: %u\12\0"
	.text
	.def	output_instruction;	.scl	3;	.type	32;	.endef
output_instruction:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$256, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L683
	movq	$0, -8(%rbp)
	jmp	.L684
.L685:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -8(%rbp)
.L684:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -8(%rbp)
	jb	.L685
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$20, %r8d
	movl	$1, %edx
	leaq	.LC238(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L682
.L683:
	movq	16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$25, %eax
	ja	.L687
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L689(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L689(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L689:
	.long	.L714-.L689
	.long	.L713-.L689
	.long	.L712-.L689
	.long	.L711-.L689
	.long	.L710-.L689
	.long	.L709-.L689
	.long	.L708-.L689
	.long	.L707-.L689
	.long	.L706-.L689
	.long	.L705-.L689
	.long	.L704-.L689
	.long	.L703-.L689
	.long	.L702-.L689
	.long	.L701-.L689
	.long	.L700-.L689
	.long	.L699-.L689
	.long	.L698-.L689
	.long	.L697-.L689
	.long	.L696-.L689
	.long	.L695-.L689
	.long	.L694-.L689
	.long	.L693-.L689
	.long	.L692-.L689
	.long	.L691-.L689
	.long	.L690-.L689
	.long	.L688-.L689
	.text
.L714:
	movq	$0, -16(%rbp)
	jmp	.L715
.L716:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -16(%rbp)
.L715:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -16(%rbp)
	jb	.L716
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC239(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L717
.L713:
	movq	$0, -24(%rbp)
	jmp	.L718
.L719:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -24(%rbp)
.L718:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -24(%rbp)
	jb	.L719
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC240(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L717
.L712:
	movq	$0, -32(%rbp)
	jmp	.L720
.L721:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -32(%rbp)
.L720:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -32(%rbp)
	jb	.L721
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC241(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L717
.L711:
	movq	$0, -40(%rbp)
	jmp	.L722
.L723:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -40(%rbp)
.L722:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -40(%rbp)
	jb	.L723
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC242(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L717
.L710:
	movq	$0, -48(%rbp)
	jmp	.L724
.L725:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -48(%rbp)
.L724:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -48(%rbp)
	jb	.L725
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC243(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L717
.L709:
	movq	$0, -56(%rbp)
	jmp	.L726
.L727:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -56(%rbp)
.L726:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -56(%rbp)
	jb	.L727
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC244(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L717
.L708:
	movq	$0, -64(%rbp)
	jmp	.L728
.L729:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -64(%rbp)
.L728:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -64(%rbp)
	jb	.L729
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC245(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L717
.L707:
	movq	$0, -72(%rbp)
	jmp	.L730
.L731:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -72(%rbp)
.L730:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -72(%rbp)
	jb	.L731
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC246(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L717
.L706:
	movq	$0, -80(%rbp)
	jmp	.L732
.L733:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -80(%rbp)
.L732:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -80(%rbp)
	jb	.L733
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC247(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L717
.L705:
	movq	$0, -88(%rbp)
	jmp	.L734
.L735:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -88(%rbp)
.L734:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -88(%rbp)
	jb	.L735
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC248(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L717
.L704:
	movq	$0, -96(%rbp)
	jmp	.L736
.L737:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -96(%rbp)
.L736:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -96(%rbp)
	jb	.L737
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC249(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L717
.L703:
	movq	$0, -104(%rbp)
	jmp	.L738
.L739:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -104(%rbp)
.L738:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -104(%rbp)
	jb	.L739
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC250(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L717
.L702:
	movq	$0, -112(%rbp)
	jmp	.L740
.L741:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -112(%rbp)
.L740:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -112(%rbp)
	jb	.L741
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC251(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L717
.L701:
	movq	$0, -120(%rbp)
	jmp	.L742
.L743:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -120(%rbp)
.L742:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -120(%rbp)
	jb	.L743
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC252(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L717
.L700:
	movq	$0, -128(%rbp)
	jmp	.L744
.L745:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -128(%rbp)
.L744:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -128(%rbp)
	jb	.L745
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC253(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L717
.L699:
	movq	$0, -136(%rbp)
	jmp	.L746
.L747:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -136(%rbp)
.L746:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -136(%rbp)
	jb	.L747
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC254(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L717
.L698:
	movq	$0, -144(%rbp)
	jmp	.L748
.L749:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -144(%rbp)
.L748:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -144(%rbp)
	jb	.L749
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC255(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L717
.L697:
	movq	$0, -152(%rbp)
	jmp	.L750
.L751:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -152(%rbp)
.L750:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -152(%rbp)
	jb	.L751
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC256(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L717
.L696:
	movq	$0, -160(%rbp)
	jmp	.L752
.L753:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -160(%rbp)
.L752:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -160(%rbp)
	jb	.L753
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC257(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L717
.L695:
	movq	$0, -168(%rbp)
	jmp	.L754
.L755:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -168(%rbp)
.L754:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -168(%rbp)
	jb	.L755
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC258(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L717
.L694:
	movq	$0, -176(%rbp)
	jmp	.L756
.L757:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -176(%rbp)
.L756:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -176(%rbp)
	jb	.L757
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC259(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L717
.L693:
	movq	$0, -184(%rbp)
	jmp	.L758
.L759:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -184(%rbp)
.L758:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -184(%rbp)
	jb	.L759
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	.LC260(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L717
.L692:
	movq	$0, -192(%rbp)
	jmp	.L760
.L761:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -192(%rbp)
.L760:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -192(%rbp)
	jb	.L761
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC261(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L717
.L691:
	movq	$0, -200(%rbp)
	jmp	.L762
.L763:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -200(%rbp)
.L762:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -200(%rbp)
	jb	.L763
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC262(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L717
.L690:
	movq	$0, -208(%rbp)
	jmp	.L764
.L765:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -208(%rbp)
.L764:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -208(%rbp)
	jb	.L765
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC263(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L717
.L688:
	movq	$0, -216(%rbp)
	jmp	.L766
.L767:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -216(%rbp)
.L766:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -216(%rbp)
	jb	.L767
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC264(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L682
.L687:
	movq	$0, -224(%rbp)
	jmp	.L768
.L769:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -224(%rbp)
.L768:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -224(%rbp)
	jb	.L769
	movq	16(%rbp), %rax
	movl	24(%rax), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC265(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L682
.L717:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	output_arg
	movq	16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$24, %eax
	seta	%dl
	testb	%dl, %dl
	jne	.L775
	movl	$1, %edx
	movl	%eax, %ecx
	salq	%cl, %rdx
	movq	%rdx, %rax
	movq	%rax, %rdx
	andl	$4825087, %edx
	testq	%rdx, %rdx
	setne	%dl
	testb	%dl, %dl
	jne	.L771
	movq	%rax, %rdx
	andl	$25583616, %edx
	testq	%rdx, %rdx
	setne	%dl
	testb	%dl, %dl
	jne	.L772
	andl	$3145728, %eax
	testq	%rax, %rax
	setne	%al
	testb	%al, %al
	jne	.L776
	jmp	.L775
.L771:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	fputc
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	output_arg
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	fputc
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	output_arg
	jmp	.L774
.L772:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	fputc
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	output_arg
	jmp	.L774
.L776:
	nop
.L774:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$10, %ecx
	call	fputc
	jmp	.L682
.L775:
	nop
.L682:
	leave
	ret
	.section .rdata,"dr"
.LC266:
	.ascii "AttributeTable: \"NULL\"\12\0"
.LC267:
	.ascii "%zu \0"
	.text
	.def	output_attribute_table;	.scl	3;	.type	32;	.endef
output_attribute_table:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L778
	movq	$0, -8(%rbp)
	jmp	.L779
.L780:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -8(%rbp)
.L779:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -8(%rbp)
	jb	.L780
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$23, %r8d
	movl	$1, %edx
	leaq	.LC266(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L777
.L778:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L782
	movq	$0, -16(%rbp)
	jmp	.L783
.L784:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -16(%rbp)
.L783:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -16(%rbp)
	jb	.L784
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC227(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L785
.L782:
	movq	$0, -24(%rbp)
	jmp	.L786
.L787:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -24(%rbp)
.L786:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -24(%rbp)
	jb	.L787
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC228(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L785:
	movq	16(%rbp), %rax
	movq	16(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC267(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L788
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L788
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L789
.L788:
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$3, %r8d
	movl	$1, %edx
	leaq	.LC229(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L777
.L789:
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC230(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L790
.L791:
	movq	32(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	output_attribute
.L790:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L791
	movq	$0, -32(%rbp)
	jmp	.L792
.L793:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -32(%rbp)
.L792:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -32(%rbp)
	jb	.L793
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC210(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L777:
	leave
	ret
	.section .rdata,"dr"
.LC268:
	.ascii "Attribute: \"NULL\"\12\0"
.LC269:
	.ascii "NULL\11\0"
.LC270:
	.ascii "%s\11\0"
.LC271:
	.ascii "%s(%s) \0"
.LC272:
	.ascii "%zu\12\0"
	.text
	.def	output_attribute;	.scl	3;	.type	32;	.endef
output_attribute:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L795
	movq	$0, -8(%rbp)
	jmp	.L796
.L797:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -8(%rbp)
.L796:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -8(%rbp)
	jb	.L797
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$18, %r8d
	movl	$1, %edx
	leaq	.LC268(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L794
.L795:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L799
	movq	$0, -16(%rbp)
	jmp	.L800
.L801:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -16(%rbp)
.L800:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -16(%rbp)
	jb	.L801
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC269(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L802
.L799:
	movq	$0, -24(%rbp)
	jmp	.L803
.L804:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, -24(%rbp)
.L803:
	movq	32(%rbp), %rax
	salq	$2, %rax
	cmpq	%rax, -24(%rbp)
	jb	.L804
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC270(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L802:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L805
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC227(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L806
.L805:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L807
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rcx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC271(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L806
.L807:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC228(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L806:
	movq	16(%rbp), %rax
	movq	16(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC272(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L794:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC273:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse import statement\12\0"
	.align 8
.LC274:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function declaration\12\0"
	.align 8
.LC275:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse class declaration\12\0"
	.align 8
.LC276:
	.ascii "[Parser Error] at %s:%zu:%zu: Unexpected token in code member\12\0"
	.text
	.def	parse_code;	.scl	3;	.type	32;	.endef
parse_code:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$104, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	builtin_scope(%rip), %rax
	testq	%rax, %rax
	jne	.L809
	movl	$0, %ecx
	call	create_symbol_table
	movq	%rax, builtin_scope(%rip)
	movq	builtin_scope(%rip), %rdx
	movq	160+keywordList(%rip), %rax
	movq	%rdx, %r9
	movl	$0, %r8d
	movl	$6, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, name_void(%rip)
	movq	builtin_scope(%rip), %rdx
	movq	128+keywordList(%rip), %rax
	movq	%rdx, %r9
	movl	$0, %r8d
	movl	$6, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, name_int(%rip)
	movq	builtin_scope(%rip), %rdx
	movq	136+keywordList(%rip), %rax
	movq	%rdx, %r9
	movl	$0, %r8d
	movl	$6, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, name_float(%rip)
	movq	builtin_scope(%rip), %rdx
	movq	144+keywordList(%rip), %rax
	movq	%rdx, %r9
	movl	$0, %r8d
	movl	$6, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, name_string(%rip)
	movq	builtin_scope(%rip), %rdx
	movq	152+keywordList(%rip), %rax
	movq	%rdx, %r9
	movl	$0, %r8d
	movl	$6, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, name_bool(%rip)
.L809:
	cmpq	$0, 24(%rbp)
	jne	.L810
	movq	builtin_scope(%rip), %rax
	movq	%rax, 24(%rbp)
.L810:
	movq	$0, -40(%rbp)
	call	create_list
	movq	%rax, -48(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	create_symbol_table
	movq	%rax, -56(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	jmp	.L811
.L820:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L812
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	keywordList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L812
	movq	32(%rbp), %rcx
	movq	-56(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_import
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.L813
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC273(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L813:
	movq	-64(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_code_member
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L814
.L812:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L815
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	16+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L815
	movq	32(%rbp), %rcx
	movq	-56(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_function
	movq	%rax, -72(%rbp)
	cmpq	$0, -72(%rbp)
	jne	.L816
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC274(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L816:
	movq	-72(%rbp), %rax
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$1, %ecx
	call	create_code_member
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L814
.L815:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L817
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	24+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L817
	movq	32(%rbp), %rcx
	movq	-56(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_class
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	jne	.L818
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC275(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L818:
	movq	-80(%rbp), %rax
	movq	%rax, %r9
	movl	$0, %r8d
	movl	$0, %edx
	movl	$2, %ecx
	call	create_code_member
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L814
.L817:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC276(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L814:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
.L811:
	cmpq	$0, -40(%rbp)
	je	.L819
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	jne	.L820
.L819:
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	create_code
	addq	$104, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC277:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected identifier after 'import'\12\0"
	.align 8
.LC278:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected string literal after 'from'\12\0"
	.align 8
.LC279:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' at end of import statement\12\0"
	.align 8
.LC280:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to import module\12\0"
	.text
	.def	parse_import;	.scl	3;	.type	32;	.endef
parse_import:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$88, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -40(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L823
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC277(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L824
.L823:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -64(%rbp)
	movq	$0, -48(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L825
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	8+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L825
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$4, %eax
	je	.L826
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC278(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L824
.L826:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
.L825:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L827
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	72+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L828
.L827:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC279(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L824
.L828:
	movq	32(%rbp), %rax
	movq	(%rax), %r8
	movq	24(%rbp), %rcx
	movq	-48(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%r8, %r9
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_import_file
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L829
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC280(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movq	name_void(%rip), %rdx
	movq	24(%rbp), %rcx
	movq	-64(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$3, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, -56(%rbp)
.L829:
	movq	-48(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	create_import
.L824:
	addq	$88, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC281:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected function return type after 'func'\12\0"
	.align 8
.LC282:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown function return type\12\0"
	.align 8
.LC283:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected function name after return type\12\0"
	.align 8
.LC284:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after function name\12\0"
	.align 8
.LC285:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function parameter\12\0"
	.align 8
.LC286:
	.ascii "[Parser Error] at %s:%zu:%zu: Function parameters cannot have default values\12\0"
	.align 8
.LC287:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function parameter\12\0"
	.align 8
.LC288:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start function body\12\0"
	.align 8
.LC289:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function body statement\12\0"
	.align 8
.LC290:
	.ascii "[Parser Error] at %s:%zu:%zu: Unreachable code after return statement\12\0"
	.align 8
.LC291:
	.ascii "[Parser Error] at %s:%zu:%zu: Function missing return statement\12\0"
	.text
	.def	parse_function;	.scl	3;	.type	32;	.endef
parse_function:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$136, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -40(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	create_symbol_table
	movq	%rax, -56(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L831
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L832
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	128+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L831
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	136+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L831
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	144+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L831
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	152+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L831
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	160+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L831
.L832:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC281(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L833
.L831:
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	search_name
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.L834
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC282(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L833
.L834:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L835
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC283(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L833
.L835:
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	-72(%rbp), %rcx
	movq	-64(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$1, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, -80(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L836
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L837
.L836:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC284(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L833
.L837:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	call	create_list
	movq	%rax, -88(%rbp)
	jmp	.L838
.L845:
	movq	32(%rbp), %rcx
	movq	-56(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_variable
	movq	%rax, -112(%rbp)
	cmpq	$0, -112(%rbp)
	jne	.L839
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC285(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	jmp	.L840
.L839:
	movq	-112(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L841
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC286(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	jmp	.L840
.L841:
	movq	-112(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
.L840:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L842
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	32+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L842
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	jmp	.L838
.L842:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L844
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	8+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L838
.L844:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC287(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L833
.L838:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L845
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	8+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L845
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L846
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	16+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L847
.L846:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC288(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L833
.L847:
	call	create_list
	movq	%rax, -96(%rbp)
	movq	32(%rbp), %rax
	movb	$1, 8(%rax)
	movb	$0, -41(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	jmp	.L848
.L852:
	movq	32(%rbp), %rcx
	movq	-56(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_statement
	movq	%rax, -104(%rbp)
	cmpq	$0, -104(%rbp)
	jne	.L849
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC289(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	jmp	.L850
.L849:
	cmpb	$0, -41(%rbp)
	je	.L850
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC290(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L850:
	cmpq	$0, -104(%rbp)
	je	.L851
	movq	-104(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$5, %eax
	jne	.L851
	movb	$1, -41(%rbp)
.L851:
	movq	-104(%rbp), %rdx
	movq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
.L848:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L852
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L852
	movq	32(%rbp), %rax
	movb	$0, 8(%rax)
	cmpb	$0, -41(%rbp)
	jne	.L853
	movq	name_void(%rip), %rax
	cmpq	%rax, -64(%rbp)
	je	.L853
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC291(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L853:
	cmpb	$0, -41(%rbp)
	jne	.L854
	movq	name_void(%rip), %rax
	cmpq	%rax, -64(%rbp)
	jne	.L854
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$5, %ecx
	call	create_statement
	movq	%rax, %rdx
	movq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
.L854:
	movq	-88(%rbp), %r9
	movq	-64(%rbp), %r8
	movq	-80(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	-56(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movq	-96(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movq	%rax, %rcx
	call	create_function_use_ptr
.L833:
	addq	$136, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC292:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected method return type after 'method'\12\0"
	.align 8
.LC293:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown return type for method\12\0"
	.align 8
.LC294:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected method name after return type\12\0"
	.align 8
.LC295:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after method name\12\0"
	.align 8
.LC296:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected 'self' as first parameter of method\12\0"
	.align 8
.LC297:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after method parameter\12\0"
	.align 8
.LC298:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse method parameter\12\0"
	.align 8
.LC299:
	.ascii "[Parser Error] at %s:%zu:%zu: Method parameters cannot have default values\12\0"
	.align 8
.LC300:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start method body\12\0"
	.align 8
.LC301:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse method body statement\12\0"
	.align 8
.LC302:
	.ascii "[Parser Error] at %s:%zu:%zu: Method missing return statement\12\0"
	.text
	.def	parse_method;	.scl	3;	.type	32;	.endef
parse_method:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$152, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	$0, -40(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	create_symbol_table
	movq	%rax, -56(%rbp)
	movq	40+keywordList(%rip), %rax
	movq	-56(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$3, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, -64(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L856
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L857
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	128+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L856
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	136+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L856
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	144+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L856
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	152+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L856
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	160+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L856
.L857:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC292(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L858
.L856:
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	search_name
	movq	%rax, -72(%rbp)
	cmpq	$0, -72(%rbp)
	jne	.L859
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC293(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L858
.L859:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L860
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC294(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L858
.L860:
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	make_method_name
	movq	-80(%rbp), %rcx
	movq	-72(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$2, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, -88(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L861
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L862
.L861:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC295(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L858
.L862:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L863
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	40+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L864
.L863:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC296(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L864:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	call	create_list
	movq	%rax, -96(%rbp)
	movq	-64(%rbp), %rdx
	movq	32(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rcx
	call	create_variable
	movq	%rax, %rdx
	movq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L865
.L873:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L866
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	32+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L866
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	nop
	movq	40(%rbp), %rcx
	movq	-56(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_variable
	movq	%rax, -104(%rbp)
	cmpq	$0, -104(%rbp)
	jne	.L870
	jmp	.L883
.L866:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L868
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	8+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L869
.L868:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC297(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L858
.L883:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC298(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	jmp	.L871
.L870:
	movq	-104(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L872
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC299(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	jmp	.L871
.L872:
	movq	-104(%rbp), %rdx
	movq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
.L871:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
.L865:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L873
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	8+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L873
.L869:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L874
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	16+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L875
.L874:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC300(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L858
.L875:
	call	create_list
	movq	%rax, -112(%rbp)
	movq	40(%rbp), %rax
	movb	$1, 8(%rax)
	movq	40(%rbp), %rax
	movb	$1, 9(%rax)
	movb	$0, -41(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	jmp	.L876
.L880:
	movq	40(%rbp), %rcx
	movq	-56(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_statement
	movq	%rax, -120(%rbp)
	cmpq	$0, -120(%rbp)
	jne	.L877
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC301(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	jmp	.L878
.L877:
	cmpb	$0, -41(%rbp)
	je	.L878
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC290(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L878:
	cmpq	$0, -120(%rbp)
	je	.L879
	movq	-120(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$5, %eax
	jne	.L879
	movb	$1, -41(%rbp)
.L879:
	movq	-120(%rbp), %rdx
	movq	-112(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
.L876:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L880
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L880
	movq	40(%rbp), %rax
	movb	$0, 8(%rax)
	movq	40(%rbp), %rax
	movb	$0, 9(%rax)
	cmpb	$0, -41(%rbp)
	jne	.L881
	movq	name_void(%rip), %rax
	cmpq	%rax, -72(%rbp)
	je	.L881
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC302(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L881:
	cmpb	$0, -41(%rbp)
	jne	.L882
	movq	name_void(%rip), %rax
	cmpq	%rax, -72(%rbp)
	jne	.L882
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$5, %ecx
	call	create_statement
	movq	%rax, %rdx
	movq	-112(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
.L882:
	movq	-96(%rbp), %r9
	movq	-72(%rbp), %r8
	movq	-88(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	-56(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movq	-112(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movq	%rax, %rcx
	call	create_method_use_ptr
.L858:
	addq	$152, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC303:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected class name after 'class'\12\0"
	.align 8
.LC304:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start class body\12\0"
	.align 8
.LC305:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse class method\12\0"
	.align 8
.LC306:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse class variable\12\0"
	.align 8
.LC307:
	.ascii "[Parser Error] at %s:%zu:%zu: Unsupported type for class variable\12\0"
	.align 8
.LC308:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after class variable declaration\12\0"
	.align 8
.LC309:
	.ascii "[Parser Error] at %s:%zu:%zu: Unexpected token in class member\12\0"
	.align 8
.LC310:
	.ascii "[Parser Error] at %s:%zu:%zu: Constructor name conflicts with existing member\12\0"
.LC311:
	.ascii "0\0"
	.text
	.def	parse_class;	.scl	3;	.type	32;	.endef
parse_class:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$296, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -40(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	create_symbol_table
	movq	%rax, -64(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L885
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC303(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L886
.L885:
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, %r9
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, -80(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L887
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	16+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L888
.L887:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC304(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L886
.L888:
	call	create_list
	movq	%rax, -88(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	$0, -48(%rbp)
	jmp	.L889
.L903:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L890
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	32+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L890
	movq	32(%rbp), %r8
	movq	-80(%rbp), %rcx
	movq	-64(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%r8, %r9
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_method
	movq	%rax, -248(%rbp)
	cmpq	$0, -248(%rbp)
	jne	.L891
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC305(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L891:
	movq	-248(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_class_member
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L892
.L890:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L893
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	168+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L893
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	32(%rbp), %rax
	movb	$1, 10(%rax)
	movq	32(%rbp), %rcx
	movq	-64(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_variable
	movq	%rax, -256(%rbp)
	movq	32(%rbp), %rax
	movb	$0, 10(%rax)
	cmpq	$0, -256(%rbp)
	jne	.L894
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC306(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L894:
	movq	-256(%rbp), %rax
	movq	%rax, %r8
	movl	$0, %edx
	movl	$1, %ecx
	call	create_class_member
	movq	%rax, -264(%rbp)
	movq	-264(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	-264(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$1, %eax
	jne	.L895
	movq	-264(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -272(%rbp)
	movq	name_int(%rip), %rax
	cmpq	%rax, -272(%rbp)
	je	.L896
	movq	name_float(%rip), %rax
	cmpq	%rax, -272(%rbp)
	je	.L896
	movq	name_string(%rip), %rax
	cmpq	%rax, -272(%rbp)
	jne	.L897
.L896:
	addq	$8, -48(%rbp)
	jmp	.L895
.L897:
	movq	name_bool(%rip), %rax
	cmpq	%rax, -272(%rbp)
	je	.L898
	movq	name_void(%rip), %rax
	cmpq	%rax, -272(%rbp)
	jne	.L899
.L898:
	addq	$1, -48(%rbp)
	jmp	.L895
.L899:
	movq	-272(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L900
	addq	$8, -48(%rbp)
	jmp	.L895
.L900:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC307(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L895:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L901
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	72+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L917
.L901:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC308(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	jmp	.L917
.L893:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC309(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	jmp	.L892
.L917:
	nop
.L892:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
.L889:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L903
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L903
	movq	DEFAULT_INIT_NAME(%rip), %rdx
	movq	-80(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	make_method_name
	movq	%rax, -96(%rbp)
	movq	-96(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	search_name_use_strcmp
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L904
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, -104(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	create_symbol_table
	movq	-104(%rbp), %rdx
	movq	%rax, 32(%rdx)
	movq	-104(%rbp), %rcx
	movq	-80(%rbp), %rdx
	movq	-96(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$2, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, -56(%rbp)
	call	create_list
	movq	%rax, -112(%rbp)
	movq	-104(%rbp), %rax
	movq	32(%rax), %rcx
	movq	40+keywordList(%rip), %rax
	movq	-80(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$3, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, -120(%rbp)
	movq	-120(%rbp), %rdx
	movq	-80(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rcx
	call	create_variable
	movq	%rax, %rdx
	movq	-112(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	call	create_list
	movq	%rax, -128(%rbp)
	movq	-120(%rbp), %rax
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	create_variable_access
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$8, %ecx
	call	create_primary
	movl	$0, %r9d
	movq	%rax, %r8
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
	movq	-128(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	-104(%rbp), %rax
	movq	32(%rax), %rcx
	movq	-112(%rbp), %r9
	movq	-80(%rbp), %r8
	movq	-56(%rbp), %rdx
	movq	-104(%rbp), %rax
	movq	%rcx, 40(%rsp)
	movq	-128(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movq	%rax, %rcx
	call	create_method_use_ptr
	movq	-104(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_class_member
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
.L904:
	movq	-56(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	je	.L905
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC310(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L905:
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	movq	-80(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	make_method_name
	movq	%rax, -136(%rbp)
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, -144(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	create_symbol_table
	movq	-144(%rbp), %rdx
	movq	%rax, 32(%rdx)
	movq	-144(%rbp), %rcx
	movq	-80(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$2, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, -152(%rbp)
	call	create_list
	movq	%rax, -160(%rbp)
	movq	-144(%rbp), %rax
	movq	32(%rax), %rcx
	movq	40+keywordList(%rip), %rax
	movq	-80(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$3, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, -168(%rbp)
	movq	-56(%rbp), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -176(%rbp)
	jmp	.L906
.L909:
	movq	-184(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	movq	40+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L918
	movq	-184(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	movl	$0, %r8d
	movq	%rax, %rcx
	call	create_variable
	movq	%rax, %rdx
	movq	-160(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L906
.L918:
	nop
.L906:
	movq	-176(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -184(%rbp)
	cmpq	$0, -184(%rbp)
	jne	.L909
	call	create_list
	movq	%rax, -192(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -200(%rbp)
	movq	-168(%rbp), %rax
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	create_variable_access
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$8, %ecx
	call	create_primary
	movl	$0, %r9d
	movq	%rax, %r8
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
	movq	-192(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L911
.L914:
	movq	-208(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$1, %eax
	jne	.L911
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rbx
	movq	-168(%rbp), %rax
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	create_variable_access
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rbx, %r8
	movq	%rax, %rdx
	movl	$2, %ecx
	call	create_variable_access
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$8, %ecx
	call	create_primary
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, -232(%rbp)
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L912
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	jmp	.L913
.L912:
	movl	$1, %r8d
	movl	$2, %edx
	leaq	.LC311(%rip), %rax
	movq	%rax, %rcx
	call	create_string_check
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_primary
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
.L913:
	movq	%rax, -240(%rbp)
	movq	-240(%rbp), %rdx
	movq	-232(%rbp), %rax
	movq	%rdx, %r9
	movl	$0, %r8d
	movq	%rax, %rdx
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
	movq	-192(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
.L911:
	movq	-200(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -208(%rbp)
	cmpq	$0, -208(%rbp)
	jne	.L914
	call	create_list
	movq	%rax, -216(%rbp)
	movq	-168(%rbp), %rax
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	create_variable_access
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$8, %ecx
	call	create_primary
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %rdx
	movq	-216(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	-160(%rbp), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -224(%rbp)
	jmp	.L915
.L916:
	movq	-184(%rbp), %rax
	movq	8(%rax), %rax
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	create_variable_access
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$8, %ecx
	call	create_primary
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %rdx
	movq	-216(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
.L915:
	movq	-224(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -184(%rbp)
	cmpq	$0, -184(%rbp)
	jne	.L916
	movq	-56(%rbp), %rax
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	create_variable_access
	movq	%rax, %rdx
	movq	-216(%rbp), %rax
	movq	%rax, 32(%rsp)
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
	movl	$0, %r9d
	movq	%rax, %r8
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
	movq	-192(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	-144(%rbp), %rax
	movq	32(%rax), %rcx
	movq	-160(%rbp), %r9
	movq	-80(%rbp), %r8
	movq	-152(%rbp), %rdx
	movq	-144(%rbp), %rax
	movq	%rcx, 40(%rsp)
	movq	-192(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movq	%rax, %rcx
	call	create_method_use_ptr
	movq	-144(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_class_member
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	-64(%rbp), %r9
	movq	-88(%rbp), %r8
	movq	-80(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	-48(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movq	%rax, %rcx
	call	create_class_use_ptr
.L886:
	addq	$296, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC312:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected variable type\12\0"
	.align 8
.LC313:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected a type for variable declaration\12\0"
	.align 8
.LC314:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown variable type\12\0"
	.align 8
.LC315:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected variable name\12\0"
	.align 8
.LC316:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse variable initializer\12\0"
	.text
	.def	parse_variable;	.scl	3;	.type	32;	.endef
parse_variable:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$88, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -48(%rbp)
	movq	16(%rbp), %rax
	movq	80(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L920
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L921
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	movq	128+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L920
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	movq	136+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L920
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	movq	144+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L920
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	movq	152+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L920
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	movq	160+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L920
.L921:
	movq	-48(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC312(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L922
.L920:
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	search_name
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	je	.L923
	movq	-56(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$6, %eax
	je	.L924
	movq	-56(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	je	.L924
	movq	-48(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC313(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	jmp	.L924
.L923:
	movq	-48(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC314(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L924:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L925
	movq	-48(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC315(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L925:
	movq	32(%rbp), %rax
	movzbl	10(%rax), %eax
	testb	%al, %al
	je	.L926
	movq	32(%rbp), %rax
	movzbl	9(%rax), %eax
	testb	%al, %al
	jne	.L926
	movl	$5, %r10d
	jmp	.L927
.L926:
	movl	$3, %r10d
.L927:
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rcx
	movq	-56(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	%r10d, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, -64(%rbp)
	movq	$0, -40(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L928
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	movq	144+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L928
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -48(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -48(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L928
	movq	-48(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC316(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L928:
	movq	-40(%rbp), %rcx
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	create_variable
.L922:
	addq	$88, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC317:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot use 'break' outside of a loop\12\0"
	.align 8
.LC318:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot use 'continue' outside of a loop\12\0"
	.align 8
.LC319:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse statement\12\0"
	.align 8
.LC320:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after statement\12\0"
	.text
	.def	parse_statement;	.scl	3;	.type	32;	.endef
parse_statement:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$72, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -48(%rbp)
	movq	16(%rbp), %rax
	movq	80(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	$0, -40(%rbp)
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L930
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	movq	48+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L931
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_if
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$2, %ecx
	call	create_statement
	jmp	.L932
.L931:
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	movq	80+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L933
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_for
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movq	%rax, %r9
	movl	$0, %r8d
	movl	$0, %edx
	movl	$4, %ecx
	call	create_statement
	jmp	.L932
.L933:
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	movq	72+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L934
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_while
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$3, %ecx
	call	create_statement
	jmp	.L932
.L934:
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	movq	168+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L935
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_variable
	movq	%rax, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$1, %ecx
	call	create_statement
	movq	%rax, -40(%rbp)
	jmp	.L936
.L935:
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	movq	104+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L937
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L938
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	movq	72+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L938
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$5, %ecx
	call	create_statement
	jmp	.L932
.L938:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	$0, 40(%rsp)
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$5, %ecx
	call	create_statement
	movq	%rax, -40(%rbp)
	jmp	.L936
.L937:
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	movq	112+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L939
	movq	32(%rbp), %rax
	movzbl	11(%rax), %eax
	testb	%al, %al
	jne	.L940
	movq	-48(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC317(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L932
.L940:
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$6, %ecx
	call	create_statement
	movq	%rax, -40(%rbp)
	jmp	.L936
.L939:
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	movq	120+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L941
	movq	32(%rbp), %rax
	movzbl	11(%rax), %eax
	testb	%al, %al
	jne	.L942
	movq	-48(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC318(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L932
.L942:
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$7, %ecx
	call	create_statement
	movq	%rax, -40(%rbp)
	jmp	.L936
.L941:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	$0, 40(%rsp)
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_statement
	movq	%rax, -40(%rbp)
	jmp	.L936
.L930:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	$0, 40(%rsp)
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_statement
	movq	%rax, -40(%rbp)
.L936:
	movq	16(%rbp), %rax
	movq	80(%rax), %rax
	movq	%rax, -48(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L943
	movq	-48(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC319(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L943:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L944
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	movq	72+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L945
.L944:
	movq	-48(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC320(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L945:
	movq	-40(%rbp), %rax
.L932:
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC321:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'if'\12\0"
	.align 8
.LC322:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse if condition\12\0"
	.align 8
.LC323:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after if condition\12\0"
	.align 8
.LC324:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start if body\12\0"
	.align 8
.LC325:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse if body statement\12\0"
	.align 8
.LC326:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'elif'\12\0"
	.align 8
.LC327:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse else-if condition\12\0"
	.align 8
.LC328:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after else-if condition\12\0"
	.align 8
.LC329:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start else-if body\12\0"
	.align 8
.LC330:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse else-if body statement\12\0"
	.align 8
.LC331:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start else body\12\0"
	.align 8
.LC332:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse else body statement\12\0"
	.text
	.def	parse_if;	.scl	3;	.type	32;	.endef
parse_if:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$136, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -40(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L947
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L948
.L947:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC321(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L949
.L948:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L950
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC322(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L950:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L951
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	8+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L952
.L951:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC323(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L949
.L952:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L953
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	16+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L954
.L953:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC324(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L949
.L954:
	call	create_list
	movq	%rax, -56(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	jmp	.L955
.L957:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_statement
	movq	%rax, -112(%rbp)
	cmpq	$0, -112(%rbp)
	jne	.L956
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC325(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L956:
	movq	-112(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
.L955:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L957
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L957
	call	create_list
	movq	%rax, -64(%rbp)
	call	create_list
	movq	%rax, -72(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -40(%rbp)
	jmp	.L958
.L970:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L959
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L960
.L959:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC326(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L949
.L960:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	jne	.L961
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC327(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L961:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L962
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	8+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L963
.L962:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC328(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L949
.L963:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L964
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	16+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L965
.L964:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC329(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L949
.L965:
	call	create_list
	movq	%rax, -88(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	jmp	.L966
.L968:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_statement
	movq	%rax, -96(%rbp)
	cmpq	$0, -96(%rbp)
	jne	.L967
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC330(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L967:
	movq	-96(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
.L966:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L968
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L968
	movq	-88(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	create_else_if
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -40(%rbp)
.L958:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L969
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	56+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L970
.L969:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L971
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	64+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L971
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L972
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	16+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L973
.L972:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC331(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L949
.L973:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	jmp	.L974
.L976:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_statement
	movq	%rax, -104(%rbp)
	cmpq	$0, -104(%rbp)
	jne	.L975
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC332(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L975:
	movq	-104(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
.L974:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L976
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L976
.L971:
	movq	16(%rbp), %rax
	movq	80(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-72(%rbp), %r8
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%r8, %r9
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	create_if
.L949:
	addq	$136, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC333:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'for'\12\0"
	.align 8
.LC334:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop initializer\12\0"
	.align 8
.LC335:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop initializer\12\0"
	.align 8
.LC336:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop condition\12\0"
	.align 8
.LC337:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop condition\12\0"
	.align 8
.LC338:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop increment\12\0"
	.align 8
.LC339:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after for loop increment\12\0"
	.align 8
.LC340:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start for loop body\12\0"
	.align 8
.LC341:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop body statement\12\0"
	.text
	.def	parse_for;	.scl	3;	.type	32;	.endef
parse_for:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$104, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -40(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L978
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L979
.L978:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC333(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L980
.L979:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	$0, -48(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L981
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	72+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L982
.L981:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_variable
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L983
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC334(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L983:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
.L982:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L984
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	72+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L985
.L984:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC335(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L980
.L985:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	$0, -56(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L986
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	72+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L987
.L986:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L988
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC336(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L988:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
.L987:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L989
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	72+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L990
.L989:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC337(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L980
.L990:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	$0, -64(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L991
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	8+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L992
.L991:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.L993
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC338(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L993:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
.L992:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L994
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	8+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L995
.L994:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC339(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L980
.L995:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L996
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	16+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L997
.L996:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC340(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L980
.L997:
	call	create_list
	movq	%rax, -72(%rbp)
	movq	32(%rbp), %rax
	movb	$1, 11(%rax)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	jmp	.L998
.L1000:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_statement
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	jne	.L999
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC341(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L999:
	movq	-80(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
.L998:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L1000
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L1000
	movq	32(%rbp), %rax
	movb	$0, 11(%rax)
	movq	-72(%rbp), %r8
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%r8, %r9
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	create_for
.L980:
	addq	$104, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC342:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'while'\12\0"
	.align 8
.LC343:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse while condition\12\0"
	.align 8
.LC344:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after while condition\12\0"
	.align 8
.LC345:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start while body\12\0"
	.align 8
.LC346:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse while body statement\12\0"
	.text
	.def	parse_while;	.scl	3;	.type	32;	.endef
parse_while:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$88, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -40(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L1002
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L1003
.L1002:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC342(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1004
.L1003:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L1005
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC343(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L1005:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L1006
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	8+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L1007
.L1006:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC344(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1004
.L1007:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L1008
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	16+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L1009
.L1008:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC345(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1004
.L1009:
	call	create_list
	movq	%rax, -56(%rbp)
	movq	32(%rbp), %rax
	movb	$1, 11(%rax)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	jmp	.L1010
.L1012:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_statement
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.L1011
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC346(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L1011:
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
.L1010:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L1012
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	24+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L1012
	movq	32(%rbp), %rax
	movb	$0, 11(%rax)
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	create_while
.L1004:
	addq	$88, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC347:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse right operand\12\0"
	.text
	.def	parse_expr_prec;	.scl	3;	.type	32;	.endef
parse_expr_prec:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$104, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	$0, -40(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -40(%rbp)
	jmp	.L1014
.L1022:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_to_operator
	movl	%eax, -52(%rbp)
	movl	-52(%rbp), %eax
	movl	%eax, %ecx
	call	operator_precedence
	movl	%eax, -56(%rbp)
	cmpl	$19, -52(%rbp)
	je	.L1015
	movl	-56(%rbp), %eax
	cmpl	32(%rbp), %eax
	jl	.L1015
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	48(%rbp), %rcx
	movq	40(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_primary
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.L1016
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	48(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC347(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1017
.L1016:
	movq	-64(%rbp), %rax
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, -48(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -40(%rbp)
	jmp	.L1018
.L1021:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_to_operator
	movl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	movl	%eax, %ecx
	call	operator_precedence
	movl	%eax, -72(%rbp)
	cmpl	$19, -68(%rbp)
	je	.L1019
	movl	-72(%rbp), %eax
	cmpl	-56(%rbp), %eax
	jle	.L1019
	movq	40(%rbp), %r9
	movl	-72(%rbp), %r8d
	movq	-48(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	48(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movq	%rax, %rcx
	call	parse_expr_prec
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L1020
	movl	$0, %eax
	jmp	.L1017
.L1020:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -40(%rbp)
.L1018:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	je	.L1021
.L1019:
	movq	-48(%rbp), %rcx
	movq	24(%rbp), %rdx
	movl	-52(%rbp), %eax
	movq	%rcx, %r9
	movl	$0, %r8d
	movl	%eax, %ecx
	call	create_expression
	movq	%rax, 24(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -40(%rbp)
.L1014:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	je	.L1022
.L1015:
	movq	16(%rbp), %rax
	movq	80(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	24(%rbp), %rax
.L1017:
	addq	$104, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC348:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse expression primary\12\0"
	.text
	.def	parse_expression;	.scl	3;	.type	32;	.endef
parse_expression:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$72, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_primary
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L1024
	movq	16(%rbp), %rax
	movq	80(%rax), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	16(%rbp), %rax
	movq	80(%rax), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC348(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1025
.L1024:
	movq	-40(%rbp), %rax
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %rcx
	movq	24(%rbp), %r8
	movq	16(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movq	%r8, %r9
	movl	$0, %r8d
	movq	%rcx, %rdx
	movq	%rax, %rcx
	call	parse_expr_prec
.L1025:
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC349:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse parenthesized expression\12\0"
	.align 8
.LC350:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after expression\12\0"
	.align 8
.LC351:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '!'\12\0"
	.align 8
.LC352:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '-'\12\0"
	.align 8
.LC353:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse variable access\12\0"
	.align 8
.LC354:
	.ascii "[Parser Error] at %s:%zu:%zu: Unexpected token in primary expression\12\0"
	.text
	.def	parse_primary;	.scl	3;	.type	32;	.endef
parse_primary:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$104, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -80(%rbp)
	movq	16(%rbp), %rax
	movq	80(%rax), %rax
	movq	%rax, -80(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -64(%rbp)
	movq	$0, -72(%rbp)
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$2, %eax
	jne	.L1027
	movl	$0, -36(%rbp)
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	jmp	.L1028
.L1027:
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$3, %eax
	jne	.L1029
	movl	$1, -36(%rbp)
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	jmp	.L1028
.L1029:
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$4, %eax
	jne	.L1030
	movl	$2, -36(%rbp)
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	jmp	.L1028
.L1030:
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L1031
	movq	-80(%rbp), %rax
	movq	(%rax), %rdx
	movq	88+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L1031
	movl	$3, -36(%rbp)
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	jmp	.L1028
.L1031:
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L1032
	movq	-80(%rbp), %rax
	movq	(%rax), %rdx
	movq	96+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L1032
	movl	$4, -36(%rbp)
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	jmp	.L1028
.L1032:
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L1033
	movq	-80(%rbp), %rax
	movq	(%rax), %rdx
	movq	symbolList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L1033
	movl	$5, -36(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -80(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L1034
	movq	-80(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-80(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC349(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1035
.L1034:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L1036
	movq	-80(%rbp), %rax
	movq	(%rax), %rdx
	movq	8+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L1045
.L1036:
	movq	-80(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-80(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC350(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1035
.L1033:
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L1038
	movq	-80(%rbp), %rax
	movq	(%rax), %rdx
	movq	40+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L1038
	movl	$6, -36(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -80(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_primary
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.L1028
	movq	-80(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-80(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC351(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1035
.L1038:
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L1040
	movq	-80(%rbp), %rax
	movq	(%rax), %rdx
	movq	96+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L1040
	movl	$7, -36(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -80(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_primary
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.L1028
	movq	-80(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-80(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC352(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1035
.L1040:
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L1042
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L1043
	movq	-80(%rbp), %rax
	movq	(%rax), %rdx
	movq	40+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L1043
	movq	32(%rbp), %rax
	movzbl	9(%rax), %eax
	testb	%al, %al
	je	.L1043
.L1042:
	movl	$8, -36(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_variable_access
	movq	%rax, -72(%rbp)
	cmpq	$0, -72(%rbp)
	jne	.L1028
	movq	-80(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-80(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC353(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1035
.L1043:
	movq	-80(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-80(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC354(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1035
.L1045:
	nop
.L1028:
	movq	-64(%rbp), %r9
	movq	-56(%rbp), %r8
	movq	-48(%rbp), %rdx
	movl	-36(%rbp), %eax
	movq	-72(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movl	%eax, %ecx
	call	create_primary
.L1035:
	addq	$104, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC355:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected variable name in variable access\12\0"
	.align 8
.LC356:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot call undefined variable\12\0"
	.align 8
.LC357:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot call non-function variable\12\0"
	.align 8
.LC358:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function call argument\12\0"
	.align 8
.LC359:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function call argument\12\0"
	.align 8
.LC360:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse sequence index\12\0"
	.align 8
.LC361:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ']' after sequence index\12\0"
	.align 8
.LC362:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot access attribute without a valid scope\12\0"
	.align 8
.LC363:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected attribute name after '.'\12\0"
	.align 8
.LC364:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown attribute name\12\0"
	.text
	.def	parse_variable_access;	.scl	3;	.type	32;	.endef
parse_variable_access:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$152, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	16(%rbp), %rax
	movq	80(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L1047
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L1048
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	40+keywordList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L1047
.L1048:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC355(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1049
.L1047:
	movq	$0, -48(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -64(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	search_name
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	create_variable_access
	movq	%rax, -72(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -40(%rbp)
	jmp	.L1050
.L1076:
	cmpq	$0, -56(%rbp)
	je	.L1051
	movq	-56(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L1051
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
.L1051:
	cmpq	$0, -64(%rbp)
	jne	.L1052
	cmpq	$0, -48(%rbp)
	je	.L1052
	movq	-48(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L1052
	movq	-48(%rbp), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	movq	%rax, -64(%rbp)
.L1052:
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	symbolList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L1053
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L1054
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC356(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	jmp	.L1055
.L1054:
	movq	-56(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L1055
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	movq	-56(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	make_method_name
	movq	%rax, -104(%rbp)
	movq	-56(%rbp), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	movq	-104(%rbp), %rdx
	movq	%rax, %rcx
	call	search_name_use_strcmp
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$2, %ecx
	call	create_variable_access
	movq	%rax, -72(%rbp)
.L1055:
	cmpq	$0, -56(%rbp)
	je	.L1056
	movq	-56(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$1, %eax
	je	.L1056
	movq	-56(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	je	.L1056
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC357(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L1056:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	call	create_list
	movq	%rax, -112(%rbp)
	jmp	.L1057
.L1062:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -120(%rbp)
	cmpq	$0, -120(%rbp)
	jne	.L1058
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC358(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L1058:
	movq	-120(%rbp), %rdx
	movq	-112(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L1059
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	32+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L1059
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	jmp	.L1057
.L1059:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L1061
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	8+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L1057
.L1061:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC359(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1049
.L1057:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L1062
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	8+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L1062
	movq	-72(%rbp), %rax
	movq	-112(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_variable_access
	movq	%rax, -72(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -56(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -64(%rbp)
	movq	-56(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L1063
	movq	-56(%rbp), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	movq	%rax, -64(%rbp)
	jmp	.L1063
.L1053:
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	56+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L1064
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -96(%rbp)
	cmpq	$0, -96(%rbp)
	jne	.L1065
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC360(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L1065:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L1066
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	64+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	je	.L1067
.L1066:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC361(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1049
.L1067:
	movq	-96(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	$0, 32(%rsp)
	movq	%rdx, %r9
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$3, %ecx
	call	create_variable_access
	movq	%rax, -72(%rbp)
	jmp	.L1063
.L1064:
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	48+symbolList(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L1077
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -40(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.L1069
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC362(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1049
.L1069:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L1070
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC363(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1049
.L1070:
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	search_name
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L1071
	movq	$0, -80(%rbp)
	cmpq	$0, -48(%rbp)
	je	.L1072
	movq	-48(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L1073
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -80(%rbp)
	jmp	.L1072
.L1073:
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L1072
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L1072
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -80(%rbp)
.L1072:
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	make_method_name
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	search_name_use_strcmp
	movq	%rax, -56(%rbp)
.L1071:
	cmpq	$0, -56(%rbp)
	jne	.L1074
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdi
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rsi
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, 32(%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC364(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1049
.L1074:
	movq	-56(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$2, %ecx
	call	create_variable_access
	movq	%rax, -72(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -64(%rbp)
.L1063:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -40(%rbp)
.L1050:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	je	.L1076
	jmp	.L1075
.L1077:
	nop
.L1075:
	movq	-72(%rbp), %rax
.L1049:
	addq	$152, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.def	create_attribute_table;	.scl	3;	.type	32;	.endef
create_attribute_table:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	call	create_list
	movq	-8(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC365:
	.ascii "[Warning] Unsupported type for size lookup: %s\12\0"
	.text
	.def	get_type_size;	.scl	3;	.type	32;	.endef
get_type_size:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$56, %rsp
	movq	%rcx, 16(%rbp)
	movq	$8, -24(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L1081
	movq	$0, -24(%rbp)
	jmp	.L1082
.L1081:
	movq	name_int(%rip), %rax
	cmpq	%rax, 16(%rbp)
	je	.L1083
	movq	name_float(%rip), %rax
	cmpq	%rax, 16(%rbp)
	je	.L1083
	movq	name_string(%rip), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L1084
.L1083:
	movq	$8, -24(%rbp)
	jmp	.L1082
.L1084:
	movq	name_bool(%rip), %rax
	cmpq	%rax, 16(%rbp)
	je	.L1085
	movq	name_void(%rip), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L1086
.L1085:
	movq	$1, -24(%rbp)
	jmp	.L1082
.L1086:
	movq	16(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L1087
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	24(%rax), %rax
	movq	%rax, -24(%rbp)
	jmp	.L1082
.L1087:
	movq	16(%rbp), %rax
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, %r8
	leaq	.LC365(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L1082:
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rbx
	leave
	ret
	.def	get_instruction_type;	.scl	3;	.type	32;	.endef
get_instruction_type:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%ecx, 16(%rbp)
	cmpl	$18, 16(%rbp)
	ja	.L1090
	movl	16(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L1092(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L1092(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L1092:
	.long	.L1096-.L1092
	.long	.L1095-.L1092
	.long	.L1094-.L1092
	.long	.L1093-.L1092
	.long	.L1091-.L1092
	.long	.L1105-.L1092
	.long	.L1104-.L1092
	.long	.L1103-.L1092
	.long	.L1102-.L1092
	.long	.L1101-.L1092
	.long	.L1100-.L1092
	.long	.L1099-.L1092
	.long	.L1098-.L1092
	.long	.L1097-.L1092
	.long	.L1096-.L1092
	.long	.L1095-.L1092
	.long	.L1094-.L1092
	.long	.L1093-.L1092
	.long	.L1091-.L1092
	.text
.L1096:
	movl	$0, %eax
	jmp	.L1106
.L1095:
	movl	$1, %eax
	jmp	.L1106
.L1094:
	movl	$2, %eax
	jmp	.L1106
.L1093:
	movl	$3, %eax
	jmp	.L1106
.L1091:
	movl	$4, %eax
	jmp	.L1106
.L1097:
	movl	$14, %eax
	jmp	.L1106
.L1105:
	movl	$5, %eax
	jmp	.L1106
.L1104:
	movl	$6, %eax
	jmp	.L1106
.L1103:
	movl	$7, %eax
	jmp	.L1106
.L1102:
	movl	$8, %eax
	jmp	.L1106
.L1101:
	movl	$9, %eax
	jmp	.L1106
.L1100:
	movl	$10, %eax
	jmp	.L1106
.L1099:
	movl	$11, %eax
	jmp	.L1106
.L1098:
	movl	$12, %eax
	jmp	.L1106
.L1090:
	movl	$25, %eax
.L1106:
	popq	%rbp
	ret
	.def	create_tac;	.scl	3;	.type	32;	.endef
create_tac:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	call	create_list
	movq	-8(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	call	create_list
	movq	-8(%rbp), %rdx
	movq	%rax, 16(%rdx)
	call	create_list
	movq	-8(%rbp), %rdx
	movq	%rax, 24(%rdx)
	movq	-8(%rbp), %rax
	leave
	ret
	.def	create_tac_status;	.scl	3;	.type	32;	.endef
create_tac_status:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movl	$96, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	call	create_list
	movq	-8(%rbp), %rdx
	movq	%rax, 32(%rdx)
	call	create_list
	movq	-8(%rbp), %rdx
	movq	%rax, 40(%rdx)
	movq	-8(%rbp), %rax
	movq	$0, 48(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 56(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 64(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 72(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 80(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 88(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.def	create_subroutine;	.scl	3;	.type	32;	.endef
create_subroutine:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	call	create_list
	movq	-8(%rbp), %rdx
	movq	%rax, 16(%rdx)
	call	create_list
	movq	-8(%rbp), %rdx
	movq	%rax, 24(%rdx)
	call	create_list
	movq	-8(%rbp), %rdx
	movq	%rax, 32(%rdx)
	movq	-8(%rbp), %rax
	leave
	ret
	.def	create_block;	.scl	3;	.type	32;	.endef
create_block:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	call	create_list
	movq	-8(%rbp), %rdx
	movq	%rax, 8(%rdx)
	movq	-8(%rbp), %rax
	leave
	ret
	.def	search_var;	.scl	3;	.type	32;	.endef
search_var:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$112, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1116
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L1116
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L1116
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1116
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -8(%rbp)
	jmp	.L1117
.L1119:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L1117
	movq	-16(%rbp), %rax
	jmp	.L1118
.L1117:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L1119
.L1116:
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1120
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L1120
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L1120
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1120
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -24(%rbp)
	jmp	.L1121
.L1122:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L1121
	movq	-32(%rbp), %rax
	jmp	.L1118
.L1121:
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L1122
.L1120:
	movq	24(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L1123
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L1123
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L1123
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1123
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -40(%rbp)
	jmp	.L1124
.L1128:
	movq	-48(%rbp), %rax
	movq	8(%rax), %rdx
	movq	24(%rbp), %rax
	movq	24(%rax), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L1124
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L1124
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L1124
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1124
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -56(%rbp)
	jmp	.L1126
.L1127:
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L1126
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	jmp	.L1118
.L1126:
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.L1127
.L1124:
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L1128
.L1123:
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L1129
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L1129
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1129
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -72(%rbp)
	jmp	.L1130
.L1131:
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, 16(%rbp)
	jne	.L1130
	movq	-80(%rbp), %rax
	jmp	.L1118
.L1130:
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	jne	.L1131
.L1129:
	movl	$0, %eax
.L1118:
	leave
	ret
	.section .rdata,"dr"
.LC366:
	.ascii "$%d-error\0"
.LC367:
	.ascii "$%c%zu\0"
	.text
	.def	create_var;	.scl	3;	.type	32;	.endef
create_var:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movq	%r9, 40(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L1133
	movq	$0, -8(%rbp)
	movq	24(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L1134
	movq	40(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	24(%rbp), %rax
	movq	24(%rax), %rdx
	movq	40(%rbp), %rax
	movq	%rdx, 24(%rax)
.L1134:
	movq	40(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	search_var
	movq	%rax, -24(%rbp)
	movq	24(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L1135
	movq	40(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 24(%rax)
.L1135:
	cmpq	$0, -24(%rbp)
	je	.L1133
	movq	-24(%rbp), %rax
	jmp	.L1136
.L1133:
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movl	32(%rbp), %eax
	subl	$97, %eax
	cmpl	$21, %eax
	ja	.L1137
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L1139(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L1139(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L1139:
	.long	.L1144-.L1139
	.long	.L1143-.L1139
	.long	.L1137-.L1139
	.long	.L1137-.L1139
	.long	.L1137-.L1139
	.long	.L1142-.L1139
	.long	.L1137-.L1139
	.long	.L1137-.L1139
	.long	.L1137-.L1139
	.long	.L1137-.L1139
	.long	.L1137-.L1139
	.long	.L1137-.L1139
	.long	.L1137-.L1139
	.long	.L1137-.L1139
	.long	.L1137-.L1139
	.long	.L1141-.L1139
	.long	.L1137-.L1139
	.long	.L1137-.L1139
	.long	.L1137-.L1139
	.long	.L1140-.L1139
	.long	.L1137-.L1139
	.long	.L1138-.L1139
	.text
.L1144:
	movq	40(%rbp), %rax
	movq	48(%rax), %rax
	leaq	1(%rax), %rcx
	movq	40(%rbp), %rdx
	movq	%rcx, 48(%rdx)
	movq	%rax, -16(%rbp)
	jmp	.L1145
.L1141:
	movq	40(%rbp), %rax
	movq	56(%rax), %rax
	leaq	1(%rax), %rcx
	movq	40(%rbp), %rdx
	movq	%rcx, 56(%rdx)
	movq	%rax, -16(%rbp)
	jmp	.L1145
.L1138:
	movq	40(%rbp), %rax
	movq	64(%rax), %rax
	leaq	1(%rax), %rcx
	movq	40(%rbp), %rdx
	movq	%rcx, 64(%rdx)
	movq	%rax, -16(%rbp)
	jmp	.L1145
.L1140:
	movq	40(%rbp), %rax
	movq	72(%rax), %rax
	leaq	1(%rax), %rcx
	movq	40(%rbp), %rdx
	movq	%rcx, 72(%rdx)
	movq	%rax, -16(%rbp)
	jmp	.L1145
.L1143:
	movq	40(%rbp), %rax
	movq	80(%rax), %rax
	leaq	1(%rax), %rcx
	movq	40(%rbp), %rdx
	movq	%rcx, 80(%rdx)
	movq	%rax, -16(%rbp)
	jmp	.L1145
.L1142:
	movq	40(%rbp), %rax
	movq	88(%rax), %rax
	leaq	1(%rax), %rcx
	movq	40(%rbp), %rdx
	movq	%rcx, 88(%rdx)
	movq	%rax, -16(%rbp)
	jmp	.L1145
.L1137:
	movq	$-1, -16(%rbp)
	nop
.L1145:
	movl	$1, %r8d
	movl	$32, %edx
	leaq	.LC57(%rip), %rax
	movq	%rax, %rcx
	call	create_string_check
	movq	-32(%rbp), %rdx
	movq	%rax, 8(%rdx)
	cmpq	$-1, -16(%rbp)
	jne	.L1146
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rbp), %edx
	movl	%edx, %r8d
	leaq	.LC366(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	jmp	.L1147
.L1146:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rcx
	movl	32(%rbp), %edx
	movq	%rcx, %r9
	movl	%edx, %r8d
	leaq	.LC367(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
.L1147:
	movq	-32(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 16(%rax)
	cmpl	$116, 32(%rbp)
	je	.L1148
	cmpl	$118, 32(%rbp)
	jne	.L1149
.L1148:
	movq	40(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
.L1149:
	movq	-32(%rbp), %rax
.L1136:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC368:
	.ascii "Error: create_attribute received NULL table\12\0"
	.align 8
.LC369:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
	.text
	.def	create_attribute;	.scl	3;	.type	32;	.endef
create_attribute:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	48(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r9
	movl	$97, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	-8(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	cmpq	$0, 40(%rbp)
	jne	.L1151
	cmpq	$0, 32(%rbp)
	je	.L1151
	movq	32(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	get_type_size
	movq	32(%rbp), %rdx
	movq	16(%rdx), %rdx
	addq	%rax, %rdx
	movq	32(%rbp), %rax
	movq	%rdx, 16(%rax)
	jmp	.L1152
.L1151:
	cmpq	$0, 32(%rbp)
	jne	.L1152
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$44, %r8d
	movl	$1, %edx
	leaq	.LC368(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L1152:
	cmpq	$0, 32(%rbp)
	je	.L1153
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L1154
.L1153:
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$63, %r8d
	movl	$1, %edx
	leaq	.LC369(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L1155
.L1154:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
.L1155:
	movq	-8(%rbp), %rax
	leave
	ret
	.def	create_instruction;	.scl	3;	.type	32;	.endef
create_instruction:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 24(%rax)
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC370:
	.ascii "[Warning] Unsupported argument type for create_arg: %d\12\0"
	.text
	.def	create_arg;	.scl	3;	.type	32;	.endef
create_arg:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	$24, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 16(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	cmpl	$8, 16(%rbp)
	ja	.L1160
	movl	16(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L1162(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L1162(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L1162:
	.long	.L1169-.L1162
	.long	.L1168-.L1162
	.long	.L1167-.L1162
	.long	.L1166-.L1162
	.long	.L1165-.L1162
	.long	.L1164-.L1162
	.long	.L1163-.L1162
	.long	.L1161-.L1162
	.long	.L1161-.L1162
	.text
.L1169:
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L1170
.L1168:
	movq	24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	name_int(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L1170
.L1167:
	movq	24(%rbp), %rax
	movsd	(%rax), %xmm0
	movq	-8(%rbp), %rax
	movsd	%xmm0, (%rax)
	movq	name_float(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L1170
.L1166:
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	name_string(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L1170
.L1165:
	movq	24(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	movq	name_bool(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L1170
.L1164:
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	name_void(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L1170
.L1163:
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L1170
.L1161:
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L1170
.L1160:
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movl	16(%rbp), %eax
	movl	%eax, %r8d
	leaq	.LC370(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	nop
.L1170:
	movq	-8(%rbp), %rax
	movb	$0, 20(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.def	load_rvalue;	.scl	3;	.type	32;	.endef
load_rvalue:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L1173
	movl	$0, %eax
	jmp	.L1174
.L1173:
	movq	16(%rbp), %rax
	movzbl	20(%rax), %eax
	testb	%al, %al
	je	.L1175
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, %r9
	movl	$116, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movl	$0, %r9d
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$23, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	movq	-8(%rbp), %rax
	jmp	.L1174
.L1175:
	movq	16(%rbp), %rax
.L1174:
	leave
	ret
	.section .rdata,"dr"
.LC371:
	.ascii "main\0"
	.text
	.def	tac_code;	.scl	3;	.type	32;	.endef
tac_code:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	call	create_tac
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	create_tac_status
	movq	%rax, -16(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -24(%rbp)
	jmp	.L1177
.L1181:
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$1, %eax
	jne	.L1178
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_function
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	leaq	.LC371(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L1177
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L1177
.L1178:
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$2, %eax
	jne	.L1180
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_class
	jmp	.L1177
.L1180:
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	jne	.L1177
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rdx
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	tac_import
.L1177:
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L1181
	movq	-8(%rbp), %rax
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC372:
	.ascii "[Warning] Unsupported symbol kind for import: %d\12\0"
	.text
	.def	tac_import;	.scl	3;	.type	32;	.endef
tac_import:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$3, %eax
	jne	.L1184
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	32(%rbp), %rcx
	movq	%rcx, %r9
	movl	$118, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L1189
.L1184:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$1, %eax
	je	.L1186
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	jne	.L1187
.L1186:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	32(%rbp), %rcx
	movq	%rcx, %r9
	movl	$102, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L1189
.L1187:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L1188
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rax
	movq	32(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_class
	jmp	.L1189
.L1188:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %ebx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movl	%ebx, %r8d
	leaq	.LC372(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
.L1189:
	nop
	movq	-8(%rbp), %rbx
	leave
	ret
	.def	tac_function;	.scl	3;	.type	32;	.endef
tac_function:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	create_subroutine
	movq	%rax, -8(%rbp)
	movq	24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -16(%rbp)
	jmp	.L1191
.L1192:
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rcx
	movq	%rcx, %r9
	movl	$112, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_append
.L1191:
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L1192
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -40(%rbp)
	jmp	.L1193
.L1194:
	movq	24(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	tac_statement
.L1193:
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L1194
	movq	24(%rbp), %rax
	movq	$0, 8(%rax)
	nop
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC373:
	.ascii "[Warning] Constructor '%s' does not start with 'self' initialization\12\0"
	.text
	.def	tac_method;	.scl	3;	.type	32;	.endef
tac_method:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$104, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	create_subroutine
	movq	%rax, -24(%rbp)
	movq	24(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -32(%rbp)
	jmp	.L1196
.L1197:
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rcx
	movq	%rcx, %r9
	movl	$112, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_append
.L1196:
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L1197
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -48(%rbp)
	movq	-24(%rbp), %rax
	movq	32(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -56(%rbp)
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	movq	24(%rbp), %rax
	movq	24(%rax), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	make_method_name
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L1202
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	jne	.L1199
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movl	24(%rax), %eax
	cmpl	$19, %eax
	jne	.L1199
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movl	8(%rax), %eax
	cmpl	$8, %eax
	jne	.L1199
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rax
	movl	16(%rax), %eax
	testl	%eax, %eax
	je	.L1200
.L1199:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, %r8
	leaq	.LC373(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	jmp	.L1195
.L1200:
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -72(%rbp)
	movq	24(%rbp), %rax
	movq	24(%rax), %rax
	addq	$24, %rax
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rax, %rbx
	movq	-72(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rcx
	movq	-72(%rbp), %rax
	movq	%rcx, %r9
	movl	$118, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movl	$0, %r9d
	movq	%rbx, %r8
	movq	%rax, %rdx
	movl	$18, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L1202
.L1203:
	movq	24(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	tac_statement
.L1202:
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	jne	.L1203
	movq	24(%rbp), %rax
	movq	$0, 8(%rax)
.L1195:
	movq	-8(%rbp), %rbx
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC374:
	.ascii "[Warning] Unsupported class member type for tac_class: %d\12\0"
	.text
	.def	tac_class;	.scl	3;	.type	32;	.endef
tac_class:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$72, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -24(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	create_attribute_table
	movq	%rax, -32(%rbp)
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	jmp	.L1205
.L1210:
	movq	-40(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	je	.L1206
	cmpl	$1, %eax
	je	.L1207
	jmp	.L1211
.L1206:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_method
	jmp	.L1205
.L1207:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movl	$1, %r8d
	movq	%rax, %rcx
	call	tac_variable
	jmp	.L1205
.L1211:
	movq	-40(%rbp), %rax
	movl	8(%rax), %ebx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movl	%ebx, %r8d
	leaq	.LC374(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	nop
.L1205:
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L1210
	movq	24(%rbp), %rax
	movq	$0, 24(%rax)
	nop
	movq	-8(%rbp), %rbx
	leave
	ret
	.def	tac_variable;	.scl	3;	.type	32;	.endef
tac_variable:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, %eax
	movb	%al, 32(%rbp)
	movq	$0, -16(%rbp)
	cmpb	$0, 32(%rbp)
	je	.L1213
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	list_pop_back
	movq	%rax, -24(%rbp)
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %r8
	movq	24(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %rcx
	call	create_attribute
	jmp	.L1217
.L1213:
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rcx
	movq	%rcx, %r9
	movl	$118, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, -16(%rbp)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L1215
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -8(%rbp)
	jmp	.L1216
.L1215:
	movq	$0, -32(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rax, -8(%rbp)
.L1216:
	movq	-16(%rbp), %rax
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	-8(%rbp), %rdx
	movl	$0, %r9d
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$14, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_append
.L1217:
	nop
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC375:
	.ascii "[Warning] 'break' statement used outside of loop\12\0"
	.align 8
.LC376:
	.ascii "[Warning] 'continue' statement used outside of loop\12\0"
	.align 8
.LC377:
	.ascii "[Warning] Unsupported statement type for tac_statement: %d\12\0"
	.text
	.def	tac_statement;	.scl	3;	.type	32;	.endef
tac_statement:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$88, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$7, %eax
	ja	.L1219
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L1221(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L1221(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L1221:
	.long	.L1228-.L1221
	.long	.L1227-.L1221
	.long	.L1226-.L1221
	.long	.L1225-.L1221
	.long	.L1224-.L1221
	.long	.L1223-.L1221
	.long	.L1222-.L1221
	.long	.L1220-.L1221
	.text
.L1228:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	jmp	.L1229
.L1227:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movl	$0, %r8d
	movq	%rax, %rcx
	call	tac_variable
	jmp	.L1229
.L1226:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_if
	jmp	.L1229
.L1225:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_while
	jmp	.L1229
.L1224:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_for
	jmp	.L1229
.L1223:
	movl	$0, %edx
	movl	$5, %ecx
	call	create_arg
	movq	%rax, -24(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L1230
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -24(%rbp)
.L1230:
	movq	-24(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$21, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L1229
.L1222:
	movq	24(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	je	.L1231
	movq	24(%rbp), %rax
	movq	32(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L1231
	movq	24(%rbp), %rax
	movq	32(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1231
	movq	24(%rbp), %rax
	movq	32(%rax), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	je	.L1231
	movq	-48(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, -56(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-56(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	jmp	.L1229
.L1231:
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$49, %r8d
	movl	$1, %edx
	leaq	.LC375(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L1229
.L1220:
	movq	24(%rbp), %rax
	movq	40(%rax), %rax
	testq	%rax, %rax
	je	.L1232
	movq	24(%rbp), %rax
	movq	40(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L1232
	movq	24(%rbp), %rax
	movq	40(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1232
	movq	24(%rbp), %rax
	movq	40(%rax), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L1232
	movq	-32(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, -40(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-40(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	jmp	.L1229
.L1232:
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$52, %r8d
	movl	$1, %edx
	leaq	.LC376(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L1229
.L1219:
	movq	16(%rbp), %rax
	movl	8(%rax), %ebx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movl	%ebx, %r8d
	leaq	.LC377(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	nop
.L1229:
	nop
	movq	-8(%rbp), %rbx
	leave
	ret
	.def	tac_if;	.scl	3;	.type	32;	.endef
tac_if:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$200, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, -40(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, -24(%rbp)
	movq	$0, -32(%rbp)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L1234
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L1234
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L1235
.L1234:
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L1236
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L1236
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L1235
.L1236:
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	jmp	.L1237
.L1235:
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, -32(%rbp)
.L1237:
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, -48(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -56(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rbx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$19, %ecx
	call	create_instruction
	movq	%rax, -64(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -72(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-72(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -80(%rbp)
	jmp	.L1238
.L1239:
	movq	24(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rax, %rcx
	call	tac_statement
.L1238:
	movq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L1239
	movq	-48(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, -96(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-96(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L1240
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L1240
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1240
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -104(%rbp)
	jmp	.L1241
.L1247:
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -120(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-120(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-120(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, -40(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, -24(%rbp)
	movq	-112(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -56(%rbp)
	cmpq	$0, -104(%rbp)
	je	.L1242
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L1242
	movq	-104(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L1243
.L1242:
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L1244
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L1244
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L1243
.L1244:
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
.L1243:
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rbx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$19, %ecx
	call	create_instruction
	movq	%rax, -64(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -72(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-72(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-112(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -128(%rbp)
	jmp	.L1245
.L1246:
	movq	24(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rax, %rcx
	call	tac_statement
.L1245:
	movq	-128(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -136(%rbp)
	cmpq	$0, -136(%rbp)
	jne	.L1246
	movq	-48(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, -96(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-96(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
.L1241:
	movq	-104(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -112(%rbp)
	cmpq	$0, -112(%rbp)
	jne	.L1247
.L1240:
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L1248
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L1248
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1248
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -144(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-144(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-144(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -152(%rbp)
	jmp	.L1249
.L1250:
	movq	24(%rbp), %rdx
	movq	-160(%rbp), %rax
	movq	%rax, %rcx
	call	tac_statement
.L1249:
	movq	-152(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -160(%rbp)
	cmpq	$0, -160(%rbp)
	jne	.L1250
	movq	-48(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, -96(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-96(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
.L1248:
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -168(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-168(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-168(%rbp), %rdx
	movq	%rdx, 16(%rax)
	nop
	movq	-8(%rbp), %rbx
	leave
	ret
	.def	tac_for;	.scl	3;	.type	32;	.endef
tac_for:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$168, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L1252
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movl	$0, %r8d
	movq	%rax, %rcx
	call	tac_variable
.L1252:
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, -32(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, -40(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, -48(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1253
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, -64(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -72(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-72(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -80(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	-80(%rbp), %rax
	movq	%rbx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$19, %ecx
	call	create_instruction
	movq	%rax, -64(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	jmp	.L1254
.L1253:
	movq	-40(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, -56(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-56(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
.L1254:
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -88(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-88(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-88(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, -96(%rbp)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L1255
	movq	-96(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L1256
.L1255:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1257
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L1256
.L1257:
	movq	-40(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, %rcx
	call	list_append
.L1256:
	movq	-48(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -104(%rbp)
	jmp	.L1258
.L1259:
	movq	24(%rbp), %rdx
	movq	-112(%rbp), %rax
	movq	%rax, %rcx
	call	tac_statement
.L1258:
	movq	-104(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -112(%rbp)
	cmpq	$0, -112(%rbp)
	jne	.L1259
	movq	24(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, %rcx
	call	list_pop_back
	movq	24(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rcx
	call	list_pop_back
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L1260
	movq	-96(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, -120(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-120(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -128(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-128(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-128(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
.L1260:
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, -24(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L1261
	movq	-40(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, -24(%rbp)
.L1261:
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -136(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-136(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-136(%rbp), %rdx
	movq	%rdx, 16(%rax)
	nop
	movq	-8(%rbp), %rbx
	leave
	ret
	.def	tac_while;	.scl	3;	.type	32;	.endef
tac_while:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$120, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, -32(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -40(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-40(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, -48(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$98, %r8d
	movl	$0, %edx
	movl	$0, %ecx
	call	create_var
	movq	%rax, -56(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -64(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rbx
	movq	-48(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rbx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$19, %ecx
	call	create_instruction
	movq	%rax, -32(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -72(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-72(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	movq	-56(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -80(%rbp)
	jmp	.L1263
.L1264:
	movq	24(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rax, %rcx
	call	tac_statement
.L1263:
	movq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L1264
	movq	24(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, %rcx
	call	list_pop_back
	movq	24(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rcx
	call	list_pop_back
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	movl	$6, %ecx
	call	create_arg
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$20, %ecx
	call	create_instruction
	movq	%rax, -32(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	create_block
	movq	%rax, -96(%rbp)
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-96(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	24(%rbp), %rax
	movq	-96(%rbp), %rdx
	movq	%rdx, 16(%rax)
	nop
	movq	-8(%rbp), %rbx
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC378:
	.ascii "[Warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.def	tac_expression;	.scl	3;	.type	32;	.endef
tac_expression:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$96, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$19, %eax
	jne	.L1266
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_primary
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	jmp	.L1267
.L1266:
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, %ecx
	call	get_instruction_type
	movl	%eax, -20(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, -32(%rbp)
	movq	16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$13, %eax
	je	.L1268
	movq	16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$14, %eax
	je	.L1268
	movq	16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$15, %eax
	je	.L1268
	movq	16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$16, %eax
	je	.L1268
	movq	16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$17, %eax
	je	.L1268
	movq	16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$18, %eax
	jne	.L1269
.L1268:
	cmpl	$14, -20(%rbp)
	je	.L1270
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, %r9
	movl	$116, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, -48(%rbp)
	movq	24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rax, %rcx
	movq	-8(%rbp), %r8
	movq	-48(%rbp), %rdx
	movl	-20(%rbp), %eax
	movq	%r8, %r9
	movq	%rcx, %r8
	movl	%eax, %ecx
	call	create_instruction
	movq	%rax, -16(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-48(%rbp), %rax
	movq	%rax, -8(%rbp)
.L1270:
	movq	-32(%rbp), %rax
	movl	16(%rax), %eax
	testl	%eax, %eax
	je	.L1271
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$57, %r8d
	movl	$1, %edx
	leaq	.LC378(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
.L1271:
	movq	-8(%rbp), %rdx
	movq	-32(%rbp), %rax
	movl	$0, %r9d
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$14, %ecx
	call	create_instruction
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movzbl	20(%rax), %eax
	testb	%al, %al
	je	.L1273
	movq	-8(%rbp), %rdx
	movq	-32(%rbp), %rax
	movl	$0, %r9d
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$24, %ecx
	call	create_instruction
	movq	%rax, -16(%rbp)
	jmp	.L1273
.L1269:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, %r9
	movl	$116, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, -40(%rbp)
	movq	24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	load_rvalue
	movq	%rax, %rcx
	movq	-8(%rbp), %r8
	movq	-40(%rbp), %rdx
	movl	-20(%rbp), %eax
	movq	%r8, %r9
	movq	%rcx, %r8
	movl	%eax, %ecx
	call	create_instruction
	movq	%rax, -16(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -8(%rbp)
.L1273:
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-8(%rbp), %rax
.L1267:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC380:
	.ascii "[Warning] Unsupported type for negation: %s\12\0"
	.align 8
.LC381:
	.ascii "[Warning] Unsupported primary type for tac_primary: %d\12\0"
	.text
	.def	tac_primary;	.scl	3;	.type	32;	.endef
tac_primary:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$136, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$8, %eax
	ja	.L1275
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L1277(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L1277(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L1277:
	.long	.L1285-.L1277
	.long	.L1284-.L1277
	.long	.L1283-.L1277
	.long	.L1282-.L1277
	.long	.L1281-.L1277
	.long	.L1280-.L1277
	.long	.L1279-.L1277
	.long	.L1278-.L1277
	.long	.L1276-.L1277
	.text
.L1285:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	$10, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	strtoll
	movq	%rax, -72(%rbp)
	leaq	-72(%rbp), %rax
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_arg
	jmp	.L1286
.L1284:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	strtod
	movq	%xmm0, %rax
	movq	%rax, -80(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdx
	movl	$2, %ecx
	call	create_arg
	jmp	.L1286
.L1283:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movl	$3, %ecx
	call	create_arg
	jmp	.L1286
.L1282:
	movb	$1, -81(%rbp)
	leaq	-81(%rbp), %rax
	movq	%rax, %rdx
	movl	$4, %ecx
	call	create_arg
	jmp	.L1286
.L1281:
	movb	$0, -82(%rbp)
	leaq	-82(%rbp), %rax
	movq	%rax, %rdx
	movl	$4, %ecx
	call	create_arg
	jmp	.L1286
.L1280:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_expression
	jmp	.L1286
.L1279:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_primary
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -48(%rbp)
	movq	name_bool(%rip), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, %r9
	movl	$116, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, -56(%rbp)
	movq	-48(%rbp), %rdx
	movq	-56(%rbp), %rax
	movl	$0, %r9d
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$13, %ecx
	call	create_instruction
	movq	%rax, -64(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-56(%rbp), %rax
	jmp	.L1286
.L1278:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_primary
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, %r9
	movl	$116, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, -40(%rbp)
	movq	$0, -24(%rbp)
	movq	$0, -96(%rbp)
	movsd	.LC379(%rip), %xmm0
	movsd	%xmm0, -104(%rbp)
	movq	-32(%rbp), %rax
	movq	8(%rax), %rdx
	movq	name_int(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L1287
	leaq	-96(%rbp), %rax
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	-32(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_instruction
	movq	%rax, -24(%rbp)
	jmp	.L1288
.L1287:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rdx
	movq	name_float(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L1289
	leaq	-104(%rbp), %rax
	movq	%rax, %rdx
	movl	$2, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	-32(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$2, %ecx
	call	create_instruction
	movq	%rax, -24(%rbp)
	jmp	.L1288
.L1289:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, %r8
	leaq	.LC380(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1286
.L1288:
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-40(%rbp), %rax
	jmp	.L1286
.L1276:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_variable_access
	jmp	.L1286
.L1275:
	movq	16(%rbp), %rax
	movl	8(%rax), %ebx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movl	%ebx, %r8d
	leaq	.LC381(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
.L1286:
	movq	-8(%rbp), %rbx
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC382:
	.ascii "[Warning] Unsupported variable access with NULL base\12\0"
	.align 8
.LC383:
	.ascii "[Warning] Failed to generate variable access for base\12\0"
	.align 8
.LC384:
	.ascii "[Warning] Attempting to access attribute of non-object type: %s\12\0"
	.align 8
.LC385:
	.ascii "[Warning] Attribute '%s' not found in type '%s'\12\0"
	.align 8
.LC386:
	.ascii "[Warning] Attempting to access function '%s' as attribute of type '%s'\12\0"
	.align 8
.LC387:
	.ascii "[Warning] Symbol '%s' in type '%s' is not an attribute\12\0"
.LC388:
	.ascii "arr\0"
	.align 8
.LC389:
	.ascii "[Warning] Attempting to index non-array type: %s\12\0"
	.align 8
.LC390:
	.ascii "[Warning] Failed to generate variable access for index\12\0"
	.align 8
.LC391:
	.ascii "[Warning] Attempting to call non-function, kind: %u, type name: %s\12\0"
	.align 8
.LC392:
	.ascii "[Warning] Unsupported variable access type for tac_variable_access: %u\12\0"
	.text
	.def	tac_variable_access;	.scl	3;	.type	32;	.endef
tac_variable_access:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	pushq	%rbx
	subq	$224, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movl	16(%rax), %eax
	testl	%eax, %eax
	jne	.L1292
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1292
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$1, %eax
	je	.L1293
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	jne	.L1294
.L1293:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rcx
	movq	%rcx, %r9
	movl	$102, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$7, %ecx
	call	create_arg
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	jmp	.L1295
.L1294:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L1296
	movq	16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rcx
	movq	%rcx, %r9
	movl	$118, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	jmp	.L1295
.L1296:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rcx
	movq	%rcx, %r9
	movl	$118, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	jmp	.L1295
.L1292:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L1297
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$53, %r8d
	movl	$1, %edx
	leaq	.LC382(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L1295
.L1297:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_variable_access
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L1298
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$54, %r8d
	movl	$1, %edx
	leaq	.LC383(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L1295
.L1298:
	movq	16(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$2, %eax
	jne	.L1299
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$1, %eax
	je	.L1300
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	jne	.L1301
.L1300:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, %r8
	leaq	.LC384(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1295
.L1301:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L1302
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	movq	%rax, -32(%rbp)
.L1302:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	search_name_use_strcmp
	movq	%rax, -152(%rbp)
	cmpq	$0, -152(%rbp)
	jne	.L1303
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rsi
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC385(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1295
.L1303:
	movq	-152(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$1, %eax
	jne	.L1304
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rsi
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC386(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movq	-152(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rcx
	movq	-152(%rbp), %rax
	movq	%rcx, %r9
	movl	$102, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$7, %ecx
	call	create_arg
	jmp	.L1295
.L1304:
	movq	-152(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	jne	.L1305
	movq	-152(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rcx
	movq	-152(%rbp), %rax
	movq	%rcx, %r9
	movl	$102, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$8, %ecx
	call	create_arg
	jmp	.L1295
.L1305:
	movq	-152(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$5, %eax
	je	.L1306
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rsi
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC387(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1295
.L1306:
	movq	-152(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, %r9
	movl	$116, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, -160(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rcx
	movq	%rcx, %r9
	movl	$97, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	-24(%rbp), %rcx
	movq	-160(%rbp), %rax
	movq	%rdx, %r9
	movq	%rcx, %r8
	movq	%rax, %rdx
	movl	$15, %ecx
	call	create_instruction
	movq	%rax, -168(%rbp)
	movq	-160(%rbp), %rax
	movb	$1, 20(%rax)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-168(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-160(%rbp), %rax
	jmp	.L1295
.L1299:
	movq	16(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$3, %eax
	jne	.L1307
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	leaq	.LC388(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L1308
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, %r8
	leaq	.LC389(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1295
.L1308:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -128(%rbp)
	cmpq	$0, -128(%rbp)
	jne	.L1309
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$55, %r8d
	movl	$1, %edx
	leaq	.LC390(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$0, %eax
	jmp	.L1295
.L1309:
	movq	name_int(%rip), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, %r9
	movl	$116, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, -136(%rbp)
	movq	-128(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$16, %ecx
	call	create_instruction
	movq	%rax, -144(%rbp)
	movq	-136(%rbp), %rax
	movb	$1, 20(%rax)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-144(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-136(%rbp), %rax
	jmp	.L1295
.L1307:
	movq	16(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$1, %eax
	jne	.L1310
	movq	-24(%rbp), %rax
	movl	16(%rax), %eax
	testl	%eax, %eax
	jne	.L1311
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L1311
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	make_method_name
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	search_name_use_strcmp
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rcx
	movq	-64(%rbp), %rax
	movq	%rcx, %r9
	movl	$102, %r8d
	movq	%rax, %rcx
	call	create_var
	movq	%rax, %rdx
	movl	$8, %ecx
	call	create_arg
	movq	%rax, -24(%rbp)
.L1311:
	movq	-24(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$8, %eax
	je	.L1312
	movq	-24(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$7, %eax
	je	.L1312
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rsi
	movq	-24(%rbp), %rax
	movl	16(%rax), %ebx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rsi, %r9
	movl	%ebx, %r8d
	leaq	.LC391(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
	jmp	.L1295
.L1312:
	movq	$0, -176(%rbp)
	call	create_list
	movq	%rax, -72(%rbp)
	movq	-24(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$8, %eax
	jne	.L1314
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	make_method_name
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L1314
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$8, %ecx
	call	create_primary
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	tac_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	get_type_size
	movq	%rax, -184(%rbp)
	leaq	-184(%rbp), %rax
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_arg
	movq	-80(%rbp), %rdx
	movl	$0, %r9d
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$17, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	-176(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -176(%rbp)
.L1314:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -88(%rbp)
	jmp	.L1315
.L1316:
	movq	24(%rbp), %rdx
	movq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	tac_expression
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	call	load_rvalue
	movq	%rax, -120(%rbp)
	movq	-120(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	get_type_size
	movq	%rax, -192(%rbp)
	leaq	-192(%rbp), %rax
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_arg
	movq	-120(%rbp), %rdx
	movl	$0, %r9d
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$17, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	-176(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -176(%rbp)
.L1315:
	movq	-88(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -96(%rbp)
	cmpq	$0, -96(%rbp)
	jne	.L1316
	jmp	.L1317
.L1318:
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	-104(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
.L1317:
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -104(%rbp)
	cmpq	$0, -104(%rbp)
	jne	.L1318
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, %r9
	movl	$116, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_var
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_arg
	movq	%rax, -112(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_arg
	movq	%rax, %rdx
	movq	-24(%rbp), %rcx
	movq	-112(%rbp), %rax
	movq	%rdx, %r9
	movq	%rcx, %r8
	movq	%rax, %rdx
	movl	$22, %ecx
	call	create_instruction
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	list_append
	movq	-112(%rbp), %rax
	jmp	.L1295
.L1310:
	movq	16(%rbp), %rax
	movl	16(%rax), %ebx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movl	%ebx, %r8d
	leaq	.LC392(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$0, %eax
.L1295:
	addq	$224, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.def	create_file;	.scl	3;	.type	32;	.endef
create_file:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	absolute_path
	movq	-8(%rbp), %rdx
	movq	%rax, 24(%rdx)
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	normalize_path
	movq	-8(%rbp), %rax
	leave
	ret
	.section .rdata,"dr"
.LC393:
	.ascii "%s/%s\0"
	.text
	.def	absolute_path;	.scl	3;	.type	32;	.endef
absolute_path:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rcx
	call	create_string_check
	movq	%rax, 16(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, -8(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L1322
.L1326:
	movq	16(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$92, %al
	jne	.L1323
	movq	16(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movb	$47, (%rax)
.L1323:
	cmpq	$1, -16(%rbp)
	jbe	.L1324
	movq	16(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L1324
	movq	-16(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$46, %al
	jne	.L1324
	movq	-16(%rbp), %rax
	leaq	-2(%rax), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L1324
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	movq	%rax, %rcx
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movq	-16(%rbp), %rax
	leaq	-1(%rax), %r8
	movq	16(%rbp), %rax
	addq	%r8, %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	memmove
	subq	$2, -8(%rbp)
	subq	$2, -16(%rbp)
.L1324:
	cmpq	$0, -16(%rbp)
	je	.L1325
	movq	16(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L1325
	movq	-16(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L1325
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	movq	%rax, %r8
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movq	16(%rbp), %rcx
	movq	-16(%rbp), %rax
	addq	%rcx, %rax
	movq	%rax, %rcx
	call	memmove
	subq	$1, -8(%rbp)
	subq	$1, -16(%rbp)
.L1325:
	addq	$1, -16(%rbp)
.L1322:
	movq	-16(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jb	.L1326
	cmpq	$2, -8(%rbp)
	jbe	.L1327
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L1327
	movq	16(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$96, %al
	jle	.L1327
	movq	16(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$122, %al
	jg	.L1327
	movq	16(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L1327
	movq	16(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$96, %al
	jle	.L1328
	movq	16(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$122, %al
	jg	.L1328
	movq	16(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	subl	$32, %eax
	jmp	.L1329
.L1328:
	movq	16(%rbp), %rax
	movzbl	1(%rax), %eax
.L1329:
	movq	16(%rbp), %rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	addq	$1, %rax
	movb	$58, (%rax)
	movq	16(%rbp), %rax
	jmp	.L1330
.L1327:
	cmpq	$1, -8(%rbp)
	jbe	.L1331
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$64, %al
	jle	.L1331
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$90, %al
	jg	.L1331
	movq	16(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$58, %al
	jne	.L1331
	movq	16(%rbp), %rax
	jmp	.L1330
.L1331:
	cmpq	$0, -8(%rbp)
	je	.L1332
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L1332
	movq	16(%rbp), %rax
	jmp	.L1330
.L1332:
	cmpq	$0, 24(%rbp)
	jne	.L1333
	movl	$0, %edx
	movl	$0, %ecx
	call	getcwd
	movq	%rax, 24(%rbp)
.L1333:
	cmpq	$0, 24(%rbp)
	jne	.L1334
	movq	16(%rbp), %rax
	jmp	.L1330
.L1334:
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	-8(%rbp), %rdx
	addq	%rdx, %rax
	addq	$2, %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdx
	leaq	.LC57(%rip), %rax
	movq	%rax, %rcx
	call	create_string_check
	movq	%rax, -32(%rbp)
	movq	16(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC393(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	create_string_check
	movl	$0, %edx
	movq	%rax, %rcx
	call	absolute_path
.L1330:
	leave
	ret
	.def	get_file_dir;	.scl	3;	.type	32;	.endef
get_file_dir:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L1336
	movl	$0, %eax
	jmp	.L1337
.L1336:
	movq	$0, -8(%rbp)
	movq	$0, -16(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	jmp	.L1338
.L1340:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1339
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	addq	%rax, -8(%rbp)
	addq	$1, -16(%rbp)
.L1339:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
.L1338:
	cmpq	$0, -24(%rbp)
	jne	.L1340
	cmpq	$0, -16(%rbp)
	jne	.L1341
	movl	$0, %eax
	jmp	.L1337
.L1341:
	cmpq	$1, -16(%rbp)
	jbe	.L1342
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	subq	$1, %rax
	movq	%rax, -8(%rbp)
.L1342:
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movl	$0, %r8d
	movq	%rax, %rdx
	leaq	.LC57(%rip), %rax
	movq	%rax, %rcx
	call	create_string_check
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movb	$0, (%rax)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movb	$1, -25(%rbp)
	jmp	.L1343
.L1346:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1344
	cmpb	$0, -25(%rbp)
	jne	.L1345
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC36(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L1345
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L1345
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	leaq	-1(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	je	.L1345
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movw	$47, (%rax)
.L1345:
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	strcat
	movb	$0, -25(%rbp)
.L1344:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
.L1343:
	cmpq	$0, -24(%rbp)
	jne	.L1346
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	create_string_check
.L1337:
	leave
	ret
	.section .rdata,"dr"
.LC394:
	.ascii "%s/%s%s\0"
.LC395:
	.ascii "%s%s\0"
	.text
	.def	rebuild_full_path;	.scl	3;	.type	32;	.endef
rebuild_full_path:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$104, %rsp
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	get_file_dir
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L1348
	movq	-32(%rbp), %rax
	jmp	.L1349
.L1348:
	leaq	.LC57(%rip), %rax
.L1349:
	movq	%rax, -40(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1350
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	jmp	.L1351
.L1350:
	leaq	.LC57(%rip), %rax
.L1351:
	movq	%rax, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rbx
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	strlen
	addq	%rbx, %rax
	addq	$1, %rax
	movq	%rax, -24(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L1352
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	addq	%rax, -24(%rbp)
.L1352:
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movl	$0, %r8d
	movq	%rax, %rdx
	leaq	.LC57(%rip), %rax
	movq	%rax, %rcx
	call	create_string_check
	movq	%rax, -56(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L1353
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L1353
	movq	16(%rbp), %rax
	movq	16(%rax), %r8
	movq	-40(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movq	%r8, %r9
	movq	%rcx, %r8
	leaq	.LC394(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	jmp	.L1354
.L1353:
	movq	16(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-48(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC395(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
.L1354:
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	create_string_check
	movq	16(%rbp), %rdx
	movq	%rax, 24(%rdx)
	nop
	movq	-8(%rbp), %rbx
	leave
	ret
	.def	change_file_extension;	.scl	3;	.type	32;	.endef
change_file_extension:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	rebuild_full_path
	nop
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC396:
	.ascii "Warning: Path component too long, truncating to %zu characters\12\0"
.LC397:
	.ascii "..\0"
	.text
	.def	normalize_path;	.scl	3;	.type	32;	.endef
normalize_path:
	pushq	%rbp
	movq	%rsp, %rbp
	andq	$-16, %rsp
	subq	$448, %rsp
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, 360(%rsp)
	movq	360(%rsp), %rax
	addq	$1, %rax
	movl	$0, %r8d
	movq	%rax, %rdx
	leaq	.LC57(%rip), %rax
	movq	%rax, %rcx
	call	create_string_check
	movq	%rax, 352(%rsp)
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	352(%rsp), %rax
	movq	%rax, %rcx
	call	strcpy
	movq	$0, 440(%rsp)
	movq	$0, 432(%rsp)
	movq	$0, 424(%rsp)
	cmpq	$0, 360(%rsp)
	je	.L1357
	movq	352(%rsp), %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L1357
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, 344(%rsp)
	movl	$1, %r8d
	movl	$1, %edx
	leaq	.LC36(%rip), %rax
	movq	%rax, %rcx
	call	create_string_check
	movq	344(%rsp), %rdx
	movq	%rax, (%rdx)
	movq	344(%rsp), %rax
	movq	$0, 8(%rax)
	movq	344(%rsp), %rax
	movq	%rax, 440(%rsp)
	movq	344(%rsp), %rax
	movq	%rax, 432(%rsp)
	movq	$1, 424(%rsp)
.L1357:
	movq	424(%rsp), %rax
	movq	%rax, 416(%rsp)
	jmp	.L1358
.L1373:
	movq	416(%rsp), %rax
	cmpq	360(%rsp), %rax
	je	.L1359
	movq	352(%rsp), %rdx
	movq	416(%rsp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L1360
.L1359:
	movq	416(%rsp), %rax
	cmpq	%rax, 424(%rsp)
	jnb	.L1361
	movq	416(%rsp), %rax
	subq	424(%rsp), %rax
	movq	%rax, 408(%rsp)
	cmpq	$255, 408(%rsp)
	jbe	.L1362
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	408(%rsp), %rax
	movq	%rax, %r8
	leaq	.LC396(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movq	$255, 408(%rsp)
.L1362:
	movq	352(%rsp), %rdx
	movq	424(%rsp), %rax
	addq	%rax, %rdx
	movq	408(%rsp), %rcx
	leaq	32(%rsp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	leaq	32(%rsp), %rdx
	movq	408(%rsp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	leaq	32(%rsp), %rax
	leaq	.LC28(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L1361
	leaq	32(%rsp), %rax
	leaq	.LC397(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L1364
	cmpq	$0, 432(%rsp)
	je	.L1365
	movq	432(%rsp), %rax
	cmpq	440(%rsp), %rax
	je	.L1365
	movq	432(%rsp), %rax
	movq	(%rax), %rax
	leaq	.LC397(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L1366
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, 304(%rsp)
	movl	$1, %r8d
	movl	$2, %edx
	leaq	.LC397(%rip), %rax
	movq	%rax, %rcx
	call	create_string_check
	movq	304(%rsp), %rdx
	movq	%rax, (%rdx)
	movq	304(%rsp), %rax
	movq	$0, 8(%rax)
	movq	432(%rsp), %rax
	movq	304(%rsp), %rdx
	movq	%rdx, 8(%rax)
	movq	304(%rsp), %rax
	movq	%rax, 432(%rsp)
	jmp	.L1384
.L1366:
	movq	440(%rsp), %rax
	movq	%rax, 400(%rsp)
	jmp	.L1368
.L1370:
	movq	400(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 400(%rsp)
.L1368:
	cmpq	$0, 400(%rsp)
	je	.L1369
	movq	400(%rsp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, 432(%rsp)
	jne	.L1370
.L1369:
	cmpq	$0, 400(%rsp)
	je	.L1384
	movq	400(%rsp), %rax
	movq	$0, 8(%rax)
	movq	400(%rsp), %rax
	movq	%rax, 432(%rsp)
	jmp	.L1384
.L1365:
	cmpq	$0, 440(%rsp)
	jne	.L1361
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, 296(%rsp)
	movl	$1, %r8d
	movl	$2, %edx
	leaq	.LC397(%rip), %rax
	movq	%rax, %rcx
	call	create_string_check
	movq	296(%rsp), %rdx
	movq	%rax, (%rdx)
	movq	296(%rsp), %rax
	movq	$0, 8(%rax)
	movq	296(%rsp), %rax
	movq	%rax, 440(%rsp)
	movq	296(%rsp), %rax
	movq	%rax, 432(%rsp)
	jmp	.L1361
.L1364:
	leaq	32(%rsp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L1361
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, 312(%rsp)
	movq	408(%rsp), %rdx
	leaq	32(%rsp), %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	create_string_check
	movq	312(%rsp), %rdx
	movq	%rax, (%rdx)
	movq	312(%rsp), %rax
	movq	$0, 8(%rax)
	cmpq	$0, 432(%rsp)
	je	.L1372
	movq	432(%rsp), %rax
	movq	312(%rsp), %rdx
	movq	%rdx, 8(%rax)
.L1372:
	movq	312(%rsp), %rax
	movq	%rax, 432(%rsp)
	cmpq	$0, 440(%rsp)
	jne	.L1361
	movq	312(%rsp), %rax
	movq	%rax, 440(%rsp)
	jmp	.L1361
.L1384:
	nop
.L1361:
	movq	416(%rsp), %rax
	addq	$1, %rax
	movq	%rax, 424(%rsp)
.L1360:
	addq	$1, 416(%rsp)
.L1358:
	movq	416(%rsp), %rax
	cmpq	%rax, 360(%rsp)
	jnb	.L1373
	movq	16(%rbp), %rax
	movq	440(%rsp), %rdx
	movq	%rdx, (%rax)
	cmpq	$0, 432(%rsp)
	je	.L1374
	movq	432(%rsp), %rax
	movq	(%rax), %rax
	movl	$46, %edx
	movq	%rax, %rcx
	call	strrchr
	movq	%rax, 336(%rsp)
	cmpq	$0, 336(%rsp)
	je	.L1375
	movq	432(%rsp), %rax
	movq	(%rax), %rax
	cmpq	%rax, 336(%rsp)
	je	.L1375
	movq	432(%rsp), %rax
	movq	(%rax), %rax
	movq	336(%rsp), %rdx
	subq	%rax, %rdx
	movq	%rdx, 328(%rsp)
	movq	432(%rsp), %rax
	movq	(%rax), %rax
	movq	328(%rsp), %rdx
	movl	$1, %r8d
	movq	%rax, %rcx
	call	create_string_check
	movq	16(%rbp), %rdx
	movq	%rax, 16(%rdx)
	movq	336(%rsp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	336(%rsp), %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	create_string_check
	movq	16(%rbp), %rdx
	movq	%rax, 8(%rdx)
	jmp	.L1377
.L1375:
	movq	432(%rsp), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	$0, 8(%rax)
	jmp	.L1377
.L1374:
	movq	16(%rbp), %rax
	movq	$0, 16(%rax)
	movq	16(%rbp), %rax
	movq	$0, 8(%rax)
.L1377:
	movq	$0, 392(%rsp)
	movq	440(%rsp), %rax
	movq	%rax, 384(%rsp)
	movq	$0, 376(%rsp)
	jmp	.L1378
.L1379:
	movq	384(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	strlen
	addq	%rax, 392(%rsp)
	addq	$1, 376(%rsp)
	movq	384(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 384(%rsp)
.L1378:
	cmpq	$0, 384(%rsp)
	jne	.L1379
	cmpq	$1, 376(%rsp)
	jbe	.L1380
	movq	376(%rsp), %rdx
	movq	392(%rsp), %rax
	addq	%rdx, %rax
	subq	$1, %rax
	movq	%rax, 392(%rsp)
.L1380:
	movq	392(%rsp), %rax
	addq	$1, %rax
	movl	$0, %r8d
	movq	%rax, %rdx
	leaq	.LC57(%rip), %rax
	movq	%rax, %rcx
	call	create_string_check
	movq	%rax, 320(%rsp)
	movq	320(%rsp), %rax
	movb	$0, (%rax)
	movq	440(%rsp), %rax
	movq	%rax, 384(%rsp)
	movb	$1, 375(%rsp)
	jmp	.L1381
.L1383:
	cmpb	$0, 375(%rsp)
	jne	.L1382
	movq	384(%rsp), %rax
	movq	(%rax), %rax
	leaq	.LC36(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L1382
	movq	320(%rsp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L1382
	movq	320(%rsp), %rax
	movq	%rax, %rcx
	call	strlen
	leaq	-1(%rax), %rdx
	movq	320(%rsp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	je	.L1382
	movq	320(%rsp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	320(%rsp), %rax
	addq	%rdx, %rax
	movw	$47, (%rax)
.L1382:
	movq	384(%rsp), %rax
	movq	(%rax), %rdx
	movq	320(%rsp), %rax
	movq	%rax, %rcx
	call	strcat
	movb	$0, 375(%rsp)
	movq	384(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 384(%rsp)
.L1381:
	cmpq	$0, 384(%rsp)
	jne	.L1383
	movq	320(%rsp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	320(%rsp), %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	create_string_check
	movq	16(%rbp), %rdx
	movq	%rax, 24(%rdx)
	nop
	leave
	ret
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC398:
	.ascii "Usage: %s <filename>\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
main:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$56, %rsp
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	call	__main
	cmpl	$1, 16(%rbp)
	jg	.L1386
	movq	24(%rbp), %rax
	movq	(%rax), %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, %r8
	leaq	.LC398(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	movl	$1, %eax
	jmp	.L1387
.L1386:
	call	init
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	$1, %r9d
	movl	$1, %r8d
	movl	$1, %edx
	movq	%rax, %rcx
	call	parse_file
	movl	$0, %eax
.L1387:
	movq	-8(%rbp), %rbx
	leave
	ret
.lcomm id_counter.0,8,8
	.section .rdata,"dr"
	.align 8
.LC379:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Rev6, Built by MSYS2 project) 13.2.0"
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	strncmp;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	ftell;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	putc;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
	.def	strtoll;	.scl	2;	.type	32;	.endef
	.def	strtod;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	getcwd;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	strcat;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef
