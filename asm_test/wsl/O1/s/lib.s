	.file	"lib.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Fatal: Cannot allocate memory\n"
	.text
	.type	increase_memory_size, @function
increase_memory_size:
.LFB65:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	%edi, %ebp
	movl	$32, %edi
	call	malloc@PLT
	testq	%rax, %rax
	je	.L9
	movq	%rax, %rbx
	movl	$1024, %edi
	call	malloc@PLT
	movq	%rax, 24(%rbx)
	movq	$1024, (%rbx)
	movq	$0, 8(%rbx)
	movq	$0, 16(%rbx)
	testb	%bpl, %bpl
	je	.L5
	movq	struct_memory(%rip), %rax
	movq	8(%rax), %rdx
	addq	%rdx, struct_memory_used(%rip)
	movq	%rax, 16(%rbx)
	movq	%rbx, struct_memory(%rip)
	addq	$1024, struct_memory_count(%rip)
.L1:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L9:
	.cfi_restore_state
	movq	stderr(%rip), %rcx
	movl	$30, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	fwrite@PLT
	movq	string_memory(%rip), %rbx
	testq	%rbx, %rbx
	je	.L3
.L4:
	movq	%rbx, %rbp
	movq	16(%rbx), %rbx
	movq	24(%rbp), %rdi
	call	free@PLT
	movq	%rbp, %rdi
	call	free@PLT
	testq	%rbx, %rbx
	jne	.L4
.L3:
	movb	$0, initialized(%rip)
	movl	$1, %edi
	call	exit@PLT
.L5:
	movq	string_memory(%rip), %rax
	movq	8(%rax), %rdx
	addq	%rdx, string_memory_used(%rip)
	movq	%rax, 16(%rbx)
	movq	%rbx, string_memory(%rip)
	addq	$1024, string_memory_count(%rip)
	jmp	.L1
	.cfi_endproc
.LFE65:
	.size	increase_memory_size, .-increase_memory_size
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"src/lib.c"
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"struct_memory->used % ALIGN_SIZE == 0"
	.text
	.globl	alloc_memory
	.type	alloc_memory, @function
alloc_memory:
.LFB70:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	cmpb	$0, initialized(%rip)
	je	.L15
.L11:
	movq	struct_memory(%rip), %rax
	movq	%rbx, %rdx
	addq	8(%rax), %rdx
	cmpq	(%rax), %rdx
	jnb	.L16
.L12:
	addq	$7, %rbx
	andq	$-8, %rbx
	movq	struct_memory(%rip), %rcx
	movq	8(%rcx), %rdx
	testb	$7, %dl
	jne	.L17
	movq	%rdx, %rax
	andq	$-8, %rax
	addq	24(%rcx), %rax
	addq	%rbx, %rdx
	movq	%rdx, 8(%rcx)
	addq	$1, memoryBlockCount(%rip)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L15:
	.cfi_restore_state
	call	init
	jmp	.L11
.L16:
	movl	$1, %edi
	call	increase_memory_size
	jmp	.L12
.L17:
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$258, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE70:
	.size	alloc_memory, .-alloc_memory
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"Info: Allocate big memory block of size %zu bytes\n"
	.text
	.type	create_string_check, @function
create_string_check:
.LFB67:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %r13
	movq	%rsi, %rbp
	movl	%edx, %ebx
	cmpb	$0, initialized(%rip)
	je	.L31
.L19:
	testq	%r13, %r13
	je	.L27
	testq	%rbp, %rbp
	je	.L27
	testb	%bl, %bl
	je	.L21
	movq	all_string_list(%rip), %rbx
	testq	%rbx, %rbx
	je	.L21
	movl	$0, %r12d
	jmp	.L23
.L31:
	call	init
	jmp	.L19
.L22:
	movq	16(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L32
.L23:
	cmpq	%rbp, 8(%rbx)
	jne	.L22
	movq	(%rbx), %r14
	testq	%r14, %r14
	je	.L22
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	cmove	%r14, %r12
	jmp	.L22
.L32:
	testq	%r12, %r12
	jne	.L18
.L21:
	cmpq	$1022, %rbp
	ja	.L33
	movq	string_memory(%rip), %rax
	movq	%rbp, %rdx
	addq	8(%rax), %rdx
	cmpq	(%rax), %rdx
	jnb	.L34
.L26:
	movq	string_memory(%rip), %rax
	movq	8(%rax), %rdx
	movq	%rdx, %r12
	addq	24(%rax), %r12
	leaq	1(%rdx,%rbp), %rdx
	movq	%rdx, 8(%rax)
.L25:
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	strncpy@PLT
	movb	$0, (%r12,%rbp)
	movl	$24, %edi
	call	alloc_memory
	movq	%r12, (%rax)
	movq	%rbp, 8(%rax)
	movq	all_string_list(%rip), %rdx
	movq	%rdx, 16(%rax)
	movq	%rax, all_string_list(%rip)
.L18:
	movq	%r12, %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L33:
	.cfi_restore_state
	leaq	1(%rbp), %rbx
	addq	%rbx, string_memory_count(%rip)
	addq	%rbx, string_memory_used(%rip)
	movq	%rbx, %rdi
	call	malloc@PLT
	movq	%rax, %r12
	movq	%rbx, %rcx
	leaq	.LC3(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	testq	%r12, %r12
	jne	.L25
	movq	stderr(%rip), %rcx
	movl	$30, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	fwrite@PLT
	movl	$1, %edi
	call	exit@PLT
.L34:
	movl	$0, %edi
	call	increase_memory_size
	jmp	.L26
.L27:
	movl	$0, %r12d
	jmp	.L18
	.cfi_endproc
.LFE67:
	.size	create_string_check, .-create_string_check
	.globl	create_string
	.type	create_string, @function
create_string:
.LFB68:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$1, %edx
	call	create_string_check
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE68:
	.size	create_string, .-create_string
	.globl	init
	.type	init, @function
init:
.LFB69:
	.cfi_startproc
	endbr64
	cmpb	$0, initialized(%rip)
	jne	.L48
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	cmpq	$0, struct_memory(%rip)
	je	.L51
.L39:
	cmpq	$0, string_memory(%rip)
	je	.L52
.L41:
	movb	$1, initialized(%rip)
	leaq	keywordStrings(%rip), %rbx
	leaq	keywordList(%rip), %rbp
	leaq	176(%rbx), %r13
.L43:
	movq	(%rbx), %r12
	movq	%r12, %rdi
	call	strlen@PLT
	movq	%rax, %rsi
	movl	$0, %edx
	movq	%r12, %rdi
	call	create_string_check
	movq	%rax, 0(%rbp)
	addq	$8, %rbx
	addq	$8, %rbp
	cmpq	%r13, %rbx
	jne	.L43
	leaq	symbolStrings(%rip), %rbx
	leaq	symbolList(%rip), %rbp
	leaq	240(%rbx), %r13
.L44:
	movq	(%rbx), %r12
	movq	%r12, %rdi
	call	strlen@PLT
	movq	%rax, %rsi
	movl	$0, %edx
	movq	%r12, %rdi
	call	create_string_check
	movq	%rax, 0(%rbp)
	addq	$8, %rbx
	addq	$8, %rbp
	cmpq	%r13, %rbx
	jne	.L44
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
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L51:
	.cfi_restore_state
	movl	$32, %edi
	call	malloc@PLT
	movq	%rax, %rbx
	movq	%rax, struct_memory(%rip)
	testq	%rax, %rax
	je	.L53
	movl	$1024, %edi
	call	malloc@PLT
	movq	%rax, 24(%rbx)
	movq	$1024, (%rbx)
	movq	$0, 8(%rbx)
	movq	$0, 16(%rbx)
	movq	$1024, struct_memory_count(%rip)
	jmp	.L39
.L53:
	movq	stderr(%rip), %rcx
	movl	$30, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	fwrite@PLT
	movb	$0, initialized(%rip)
	movl	$1, %edi
	call	exit@PLT
.L52:
	movl	$32, %edi
	call	malloc@PLT
	movq	%rax, %rbx
	movq	%rax, string_memory(%rip)
	testq	%rax, %rax
	je	.L54
	movl	$1024, %edi
	call	malloc@PLT
	movq	%rax, 24(%rbx)
	movq	$1024, (%rbx)
	movq	$0, 8(%rbx)
	movq	$0, 16(%rbx)
	movq	$1024, string_memory_count(%rip)
	jmp	.L41
.L54:
	movq	stderr(%rip), %rcx
	movl	$30, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	fwrite@PLT
	movb	$0, initialized(%rip)
	movl	$1, %edi
	call	exit@PLT
.L48:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	ret
	.cfi_endproc
.LFE69:
	.size	init, .-init
	.globl	is_keyword
	.type	is_keyword, @function
is_keyword:
.LFB71:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	cmpb	$0, initialized(%rip)
	je	.L62
.L56:
	leaq	keywordList(%rip), %rax
	leaq	176(%rax), %rdx
.L58:
	cmpq	%rbx, (%rax)
	je	.L59
	addq	$8, %rax
	cmpq	%rdx, %rax
	jne	.L58
	movl	$0, %eax
	jmp	.L55
.L62:
	call	init
	jmp	.L56
.L59:
	movl	$1, %eax
.L55:
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE71:
	.size	is_keyword, .-is_keyword
	.globl	string_equal
	.type	string_equal, @function
string_equal:
.LFB72:
	.cfi_startproc
	endbr64
	cmpq	%rdi, %rsi
	sete	%al
	ret
	.cfi_endproc
.LFE72:
	.size	string_equal, .-string_equal
	.section	.rodata.str1.1
.LC4:
	.string	""
.LC5:
	.string	"%zu/%zu bytes"
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu"
	.text
	.globl	get_info
	.type	get_info, @function
get_info:
.LFB73:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	all_string_list(%rip), %rax
	testq	%rax, %rax
	je	.L67
	movl	$0, %ebx
.L66:
	addq	$1, %rbx
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L66
.L65:
	movl	$0, %edx
	movl	$48, %esi
	leaq	.LC4(%rip), %rbp
	movq	%rbp, %rdi
	call	create_string_check
	movq	%rax, %r12
	movq	struct_memory_count(%rip), %r9
	movq	struct_memory(%rip), %rax
	movq	struct_memory_used(%rip), %r8
	addq	8(%rax), %r8
	leaq	.LC5(%rip), %r14
	movq	%r14, %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	movq	%r12, %rdi
	movl	$0, %eax
	call	__sprintf_chk@PLT
	movl	$0, %edx
	movl	$48, %esi
	movq	%rbp, %rdi
	call	create_string_check
	movq	%rax, %r13
	movq	string_memory_count(%rip), %r9
	movq	string_memory(%rip), %rax
	movq	string_memory_used(%rip), %r8
	addq	8(%rax), %r8
	movq	%r14, %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	movq	%r13, %rdi
	movl	$0, %eax
	call	__sprintf_chk@PLT
	movl	$0, %edx
	movl	$240, %esi
	movq	%rbp, %rdi
	call	create_string_check
	movq	%rax, %rbp
	subq	$8, %rsp
	.cfi_def_cfa_offset 56
	pushq	memoryBlockCount(%rip)
	.cfi_def_cfa_offset 64
	pushq	%rbx
	.cfi_def_cfa_offset 72
	pushq	%r13
	.cfi_def_cfa_offset 80
	movq	%r12, %r9
	movl	$3, %r8d
	leaq	.LC6(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__sprintf_chk@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 48
	movq	%rbp, %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L67:
	.cfi_restore_state
	movl	$0, %ebx
	jmp	.L65
	.cfi_endproc
.LFE73:
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
