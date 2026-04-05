	.file	"helper.c"
	.text
	.p2align 4
	.globl	create_list
	.type	create_list, @function
create_list:
	subq	$8, %rsp
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	addq	$8, %rsp
	ret
	.size	create_list, .-create_list
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Error: list_append received NULL list\n"
	.text
	.p2align 4
	.globl	list_append
	.type	list_append, @function
list_append:
	testq	%rdi, %rdi
	je	.L10
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movq	%rdi, %rbx
	movl	$16, %edi
	subq	$8, %rsp
	call	*alloc_memory@GOTPCREL(%rip)
	cmpq	$0, (%rbx)
	movq	$0, (%rax)
	movq	%rbp, 8(%rax)
	je	.L11
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rbx)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L11:
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm0
	movups	%xmm0, (%rbx)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	movq	stderr(%rip), %rcx
	movl	$38, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	jmp	*fwrite@GOTPCREL(%rip)
	.size	list_append, .-list_append
	.p2align 4
	.globl	list_copy
	.type	list_copy, @function
list_copy:
	testq	%rdi, %rdi
	je	.L14
	pushq	%rbx
	movq	%rdi, %rbx
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%rbx), %xmm1
	movups	%xmm1, (%rax)
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	xorl	%eax, %eax
	ret
	.size	list_copy, .-list_copy
	.p2align 4
	.globl	list_pop
	.type	list_pop, @function
list_pop:
	testq	%rdi, %rdi
	je	.L22
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L19
	movq	(%rax), %rdx
	movq	%rdx, (%rdi)
	testq	%rdx, %rdx
	je	.L26
	movq	8(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L22:
	xorl	%eax, %eax
.L19:
	ret
	.p2align 4,,10
	.p2align 3
.L26:
	movq	$0, 8(%rdi)
	movq	8(%rax), %rax
	ret
	.size	list_pop, .-list_pop
	.p2align 4
	.globl	list_pop_back
	.type	list_pop_back, @function
list_pop_back:
	testq	%rdi, %rdi
	je	.L30
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L27
	movq	8(%rdi), %rdx
	cmpq	%rdx, %rax
	je	.L36
	.p2align 4,,10
	.p2align 3
.L29:
	movq	%rax, %rcx
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L29
	movq	8(%rax), %rax
	movq	$0, (%rcx)
	movq	%rcx, 8(%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L30:
	xorl	%eax, %eax
.L27:
	ret
	.p2align 4,,10
	.p2align 3
.L36:
	pxor	%xmm0, %xmm0
	movq	8(%rax), %rax
	movups	%xmm0, (%rdi)
	ret
	.size	list_pop_back, .-list_pop_back
	.p2align 4
	.globl	list_is_empty
	.type	list_is_empty, @function
list_is_empty:
	movl	$1, %eax
	testq	%rdi, %rdi
	je	.L37
	cmpq	$0, (%rdi)
	je	.L37
	cmpq	$0, 8(%rdi)
	sete	%al
.L37:
	ret
	.size	list_is_empty, .-list_is_empty
	.section	.rodata.str1.8
	.align 8
.LC1:
	.string	"Warning: Creating symbol with unknown SymbolType: %u\n"
	.align 8
.LC2:
	.string	"Warning: Creating symbol with unknown SymbolType for ast_node assignment: %u\n"
	.align 8
.LC3:
	.string	"Warning: Creating symbol '%s' with NULL scope, kind: %u, id: %zu\n"
	.align 8
.LC4:
	.string	"Warning: Name '%s' already exists in the current scope, kind: %u, id: %zu %zu\n"
	.text
	.p2align 4
	.globl	create_symbol
	.type	create_symbol, @function
create_symbol:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movl	%esi, %ebp
	pushq	%rbx
	movq	%rdi, %rbx
	subq	$24, %rsp
	movq	%rdx, 8(%rsp)
	movq	%rcx, (%rsp)
	cmpl	$2, %esi
	je	.L43
	ja	.L44
	testl	%esi, %esi
	je	.L75
.L43:
	movq	(%rsp), %rax
	movq	32(%rax), %rax
	movq	(%rax), %r15
.L48:
	testq	%r15, %r15
	je	.L50
	movq	%r15, %r12
.L54:
	movq	8(%r12), %rax
	movq	(%rax), %r13
	testq	%r13, %r13
	jne	.L53
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L76:
	movq	0(%r13), %r13
	testq	%r13, %r13
	je	.L51
.L53:
	movq	8(%r13), %r14
	movq	%rbx, %rsi
	movq	8(%r14), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L76
	subq	$8, %rsp
	movq	16(%r14), %r9
	movl	32(%r14), %r8d
	movq	%rbx, %rcx
	movq	id_counter.0(%rip), %rax
	leaq	.LC4(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	addq	$1, %rax
	pushq	%rax
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	popq	%rax
	popq	%rdx
.L50:
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, 8(%rax)
	movq	%rax, %r12
	movq	id_counter.0(%rip), %rax
	movl	%ebp, 32(%r12)
	addq	$1, %rax
	movq	%rax, id_counter.0(%rip)
	movq	%rax, 16(%r12)
	movq	8(%rsp), %rax
	movq	%rax, (%r12)
	movq	(%rsp), %rax
	movq	%rax, 24(%r12)
	testq	%r15, %r15
	je	.L72
	movq	8(%r15), %rdi
	movq	%r12, %rsi
	call	list_append
.L42:
	addq	$24, %rsp
	movq	%r12, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L44:
	leal	-3(%rsi), %eax
	movq	(%rsp), %r15
	cmpl	$3, %eax
	jbe	.L48
	movl	%esi, %ecx
	leaq	.LC1(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	movq	stderr(%rip), %rdi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	stderr(%rip), %rdi
	movl	%ebp, %ecx
	leaq	.LC2(%rip), %rdx
	movq	%rbx, 8(%rax)
	movq	%rax, %r12
	movq	id_counter.0(%rip), %rax
	movl	$2, %esi
	movl	%ebp, 32(%r12)
	addq	$1, %rax
	movq	%rax, id_counter.0(%rip)
	movq	%rax, 16(%r12)
	movq	8(%rsp), %rax
	movq	%rax, (%r12)
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L72:
	movq	16(%r12), %r9
	movl	%ebp, %r8d
	movq	%rbx, %rcx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	leaq	.LC3(%rip), %rdx
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L42
	.p2align 4,,10
	.p2align 3
.L51:
	movq	(%r12), %r12
	testq	%r12, %r12
	jne	.L54
	jmp	.L50
	.p2align 4,,10
	.p2align 3
.L75:
	movq	(%rsp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %r15
	jmp	.L48
	.size	create_symbol, .-create_symbol
	.p2align 4
	.globl	create_symbol_table
	.type	create_symbol_table, @function
create_symbol_table:
	pushq	%rbp
	movq	%rdi, %rbp
	movl	$16, %edi
	pushq	%rbx
	subq	$8, %rsp
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$16, %edi
	movq	%rax, %rbx
	movq	%rbp, (%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, 8(%rbx)
	addq	$8, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	ret
	.size	create_symbol_table, .-create_symbol_table
	.p2align 4
	.globl	search_name_use_strcmp
	.type	search_name_use_strcmp, @function
search_name_use_strcmp:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	testq	%rdi, %rdi
	je	.L84
	movq	%rdi, %r13
	movq	%rsi, %r12
.L83:
	movq	8(%r13), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L82
	jmp	.L81
	.p2align 4,,10
	.p2align 3
.L94:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L81
.L82:
	movq	8(%rbx), %rbp
	movq	%r12, %rsi
	movq	8(%rbp), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L94
	addq	$8, %rsp
	movq	%rbp, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L81:
	movq	0(%r13), %r13
	testq	%r13, %r13
	jne	.L83
.L84:
	addq	$8, %rsp
	xorl	%ebp, %ebp
	popq	%rbx
	movq	%rbp, %rax
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	search_name_use_strcmp, .-search_name_use_strcmp
	.p2align 4
	.globl	search_name
	.type	search_name, @function
search_name:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	testq	%rdi, %rdi
	je	.L96
	movq	%rdi, %r13
	movq	%rsi, %r12
.L100:
	movq	8(%r13), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L99
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L110:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L97
.L99:
	movq	8(%rbx), %rbp
	movq	%r12, %rsi
	movq	8(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L110
	addq	$8, %rsp
	movq	%rbp, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L97:
	movq	0(%r13), %r13
	testq	%r13, %r13
	jne	.L100
.L96:
	addq	$8, %rsp
	xorl	%ebp, %ebp
	popq	%rbx
	movq	%rbp, %rax
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	search_name, .-search_name
	.p2align 4
	.globl	is_builtin_type
	.type	is_builtin_type, @function
is_builtin_type:
	pushq	%rbx
	movq	INT_KEYWORD(%rip), %rsi
	movq	%rdi, %rbx
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L112
.L114:
	movl	$1, %eax
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L112:
	movq	FLOAT_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L114
	movq	STRING_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L114
	movq	BOOL_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L114
	movq	%rbx, %rdi
	movq	VOID_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	popq	%rbx
	testb	%al, %al
	setne	%al
	ret
	.size	is_builtin_type, .-is_builtin_type
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"Parser Error at %s:%zu:%zu: %s\n"
	.text
	.p2align 4
	.globl	parser_error
	.type	parser_error, @function
parser_error:
	subq	$16, %rsp
	movq	%rdx, %rcx
	movq	8(%rsi), %rax
	movq	16(%rsi), %rdx
	pushq	%rdi
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	xorl	%eax, %eax
	leaq	.LC5(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	addq	$24, %rsp
	ret
	.size	parser_error, .-parser_error
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC6:
	.string	"\342\224\202   "
.LC7:
	.string	"    "
.LC8:
	.string	"\342\224\224\342\224\200\342\224\200 "
.LC9:
	.string	"\342\224\234\342\224\200\342\224\200 "
	.text
	.p2align 4
	.globl	indention
	.type	indention, @function
indention:
	pushq	%r15
	movq	%rsi, %rax
	pushq	%r14
	shrq	$3, %rax
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	movl	%edx, %edi
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$24, %rsp
	movl	%edx, 12(%rsp)
	movq	%rax, %rdx
	movl	$1, %eax
	addq	%rcx, %rdx
	movl	%ebx, %ecx
	andl	$7, %ecx
	movzbl	(%rdx), %esi
	sall	%cl, %eax
	testb	%dil, %dil
	jne	.L119
	orl	%eax, %esi
	movb	%sil, (%rdx)
	cmpq	$1, %rbx
	jbe	.L130
.L120:
	movl	$1, %r15d
	leaq	.LC7(%rip), %r14
	leaq	.LC6(%rip), %r13
	.p2align 4,,10
	.p2align 3
.L125:
	movq	%r15, %rax
	movl	%r15d, %ecx
	movq	%r13, %rdx
	movl	$2, %esi
	shrq	$3, %rax
	andl	$7, %ecx
	movq	%r12, %rdi
	movsbl	0(%rbp,%rax), %eax
	sarl	%cl, %eax
	testb	$1, %al
	cmove	%r14, %rdx
	addq	$1, %r15
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	cmpq	%r15, %rbx
	jne	.L125
	cmpb	$0, 12(%rsp)
	je	.L121
.L123:
	leaq	.LC8(%rip), %rdx
.L126:
	addq	$24, %rsp
	movq	%r12, %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L119:
	notl	%eax
	andl	%esi, %eax
	movb	%al, (%rdx)
	cmpq	$1, %rbx
	ja	.L120
	testq	%rbx, %rbx
	jne	.L123
.L118:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L130:
	testq	%rbx, %rbx
	je	.L118
	.p2align 4,,10
	.p2align 3
.L121:
	leaq	.LC9(%rip), %rdx
	jmp	.L126
	.size	indention, .-indention
	.p2align 4
	.globl	indention_tac
	.type	indention_tac, @function
indention_tac:
	salq	$2, %rsi
	je	.L139
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L133:
	addq	$1, %rbx
	movq	%r12, %rsi
	movl	$32, %edi
	call	*putc@GOTPCREL(%rip)
	cmpq	%rbp, %rbx
	jne	.L133
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L139:
	ret
	.size	indention_tac, .-indention_tac
	.p2align 4
	.globl	create_parser
	.type	create_parser, @function
create_parser:
	pushq	%rbx
	movq	%rdi, %rbx
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	xorl	%edx, %edx
	movw	%dx, 8(%rax)
	movb	$0, 11(%rax)
	movq	%rbx, (%rax)
	popq	%rbx
	ret
	.size	create_parser, .-create_parser
	.section	.rodata.str1.1
.LC10:
	.string	""
.LC11:
	.string	"%s.tc"
.LC12:
	.string	"/home/su2u4/code/TC/std/"
.LC13:
	.string	"r"
	.section	.rodata.str1.8
	.align 8
.LC14:
	.string	"Error opening library file for import: %s\n"
	.align 8
.LC15:
	.string	"Info: Starting parsing lib file for import: %s\n"
	.align 8
.LC16:
	.string	"Info: Finished parsing lib file for import: %s\n"
	.align 8
.LC17:
	.string	"Error parsing library file for import: %s\n"
	.align 8
.LC18:
	.string	"Error: Imported symbol '%s' was not found in %s\n"
	.text
	.p2align 4
	.globl	parse_import_file
	.type	parse_import_file, @function
parse_import_file:
	pushq	%r15
	movq	%rdx, %r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	pushq	%rbx
	subq	$24, %rsp
	testq	%rsi, %rsi
	je	.L165
	movq	%rsi, %rbx
	movq	%rcx, %rdi
	call	*get_file_dir@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, %rsi
	call	*absolute_path@GOTPCREL(%rip)
	movq	%rax, %r13
.L146:
	leaq	.LC13(%rip), %rsi
	movq	%r13, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L166
	movq	%r13, %rdx
	leaq	.LC15(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	*__printf_chk@GOTPCREL(%rip)
	leaq	8(%rsp), %rsi
	movq	%rbx, %rdi
	movq	$0, 8(%rsp)
	call	*read_source@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	*fclose@GOTPCREL(%rip)
	movq	%r13, %rdi
	call	*create_file@GOTPCREL(%rip)
	movl	$16, %edi
	movq	%rax, %r14
	call	*alloc_memory@GOTPCREL(%rip)
	movq	8(%rsp), %rsi
	movq	%rbp, %rdi
	movq	%rax, %rbx
	xorl	%eax, %eax
	movq	%r14, (%rbx)
	movq	builtin_scope(%rip), %r14
	movw	%ax, 8(%rbx)
	movb	$0, 11(%rbx)
	call	*create_lexer@GOTPCREL(%rip)
	movq	%rbx, %rdx
	movq	%r14, %rsi
	movq	%rax, %rdi
	call	*parse_code@GOTPCREL(%rip)
	movq	%r13, %rdx
	movl	$2, %edi
	leaq	.LC16(%rip), %rsi
	movq	%rax, %rbx
	xorl	%eax, %eax
	call	*__printf_chk@GOTPCREL(%rip)
	testq	%rbx, %rbx
	je	.L167
	movq	8(%rbx), %r14
	testq	%r14, %r14
	je	.L151
.L155:
	movq	8(%r14), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L154
	jmp	.L152
	.p2align 4,,10
	.p2align 3
.L168:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L152
.L154:
	movq	8(%rbx), %rbp
	movq	%r12, %rsi
	movq	8(%rbp), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L168
	movq	8(%r15), %rdi
	movq	%rbp, %rsi
	call	list_append
.L144:
	addq	$24, %rsp
	movq	%rbp, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L152:
	movq	(%r14), %r14
	testq	%r14, %r14
	jne	.L155
.L151:
	movq	stderr(%rip), %rdi
	movq	%r13, %r8
	movq	%r12, %rcx
	xorl	%eax, %eax
	leaq	.LC18(%rip), %rdx
	movl	$2, %esi
	xorl	%ebp, %ebp
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L144
	.p2align 4,,10
	.p2align 3
.L165:
	call	*strlen@GOTPCREL(%rip)
	leaq	.LC10(%rip), %rdi
	leaq	4(%rax), %rsi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%r12, %r8
	movl	$2, %esi
	leaq	.LC11(%rip), %rcx
	movq	%rax, %rbx
	movq	%rax, %rdi
	movq	$-1, %rdx
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	leaq	.LC12(%rip), %rsi
	movq	%rbx, %rdi
	call	*absolute_path@GOTPCREL(%rip)
	movq	%rax, %r13
	jmp	.L146
.L167:
	movq	stderr(%rip), %rdi
	movq	%r13, %rcx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	leaq	.LC17(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L144
.L166:
	movq	stderr(%rip), %rdi
	movq	%r13, %rcx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	leaq	.LC14(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L144
	.size	parse_import_file, .-parse_import_file
	.section	.rodata.str1.1
.LC19:
	.string	"%s.%s"
	.text
	.p2align 4
	.globl	make_method_name
	.type	make_method_name, @function
make_method_name:
	pushq	%r12
	movq	%rsi, %r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	call	*strlen@GOTPCREL(%rip)
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	*strlen@GOTPCREL(%rip)
	leaq	.LC10(%rip), %rdi
	leaq	2(%rbx,%rax), %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	%r12, %r9
	movq	%rbp, %r8
	movl	$2, %esi
	movq	%rax, %rbx
	movq	%rax, %rdi
	xorl	%eax, %eax
	movq	$-1, %rdx
	leaq	.LC19(%rip), %rcx
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	make_method_name, .-make_method_name
	.p2align 4
	.globl	string_to_operator
	.type	string_to_operator, @function
string_to_operator:
	pushq	%rbx
	movq	ASSIGN_SYMBOL(%rip), %rsi
	movq	%rdi, %rbx
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$13, %eax
	testb	%dl, %dl
	jne	.L171
	movq	ADD_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$14, %eax
	testb	%dl, %dl
	jne	.L171
	movq	SUB_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$15, %eax
	testb	%dl, %dl
	jne	.L171
	movq	MUL_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$16, %eax
	testb	%dl, %dl
	jne	.L171
	movq	DIV_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$17, %eax
	testb	%dl, %dl
	jne	.L171
	movq	MOD_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$18, %eax
	testb	%dl, %dl
	jne	.L171
	movq	AND_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$11, %eax
	testb	%dl, %dl
	jne	.L171
	movq	OR_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$12, %eax
	testb	%dl, %dl
	jne	.L171
	movq	EQ_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$5, %eax
	testb	%dl, %dl
	jne	.L171
	movq	NE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$6, %eax
	testb	%dl, %dl
	jne	.L171
	movq	LT_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$7, %eax
	testb	%dl, %dl
	jne	.L171
	movq	GT_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$8, %eax
	testb	%dl, %dl
	jne	.L171
	movq	LE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$9, %eax
	testb	%dl, %dl
	jne	.L171
	movq	GE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$10, %eax
	testb	%dl, %dl
	jne	.L171
	movq	ADD_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	xorl	%eax, %eax
	testb	%dl, %dl
	jne	.L171
	movq	SUB_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L171
	movq	MUL_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L189
	movq	DIV_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L190
	movq	MOD_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	cmpb	$1, %al
	sbbl	%eax, %eax
	andl	$15, %eax
	addl	$4, %eax
.L171:
	popq	%rbx
	ret
.L189:
	movl	$2, %eax
	popq	%rbx
	ret
.L190:
	movl	$3, %eax
	popq	%rbx
	ret
	.size	string_to_operator, .-string_to_operator
	.p2align 4
	.globl	operator_precedence
	.type	operator_precedence, @function
operator_precedence:
	xorl	%eax, %eax
	cmpl	$18, %edi
	ja	.L193
	movl	%edi, %edi
	leaq	CSWTCH.68(%rip), %rax
	movl	(%rax,%rdi,4), %eax
.L193:
	ret
	.size	operator_precedence, .-operator_precedence
	.section	.text.unlikely,"ax",@progbits
.LCOLDB20:
	.text
.LHOTB20:
	.p2align 4
	.globl	operator_to_string
	.type	operator_to_string, @function
operator_to_string:
	cmpl	$18, %edi
	ja	.L218
	leaq	.L199(%rip), %rdx
	movl	%edi, %edi
	movslq	(%rdx,%rdi,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L199:
	.long	.L217-.L199
	.long	.L216-.L199
	.long	.L215-.L199
	.long	.L214-.L199
	.long	.L213-.L199
	.long	.L212-.L199
	.long	.L211-.L199
	.long	.L210-.L199
	.long	.L209-.L199
	.long	.L208-.L199
	.long	.L207-.L199
	.long	.L206-.L199
	.long	.L205-.L199
	.long	.L204-.L199
	.long	.L203-.L199
	.long	.L202-.L199
	.long	.L201-.L199
	.long	.L200-.L199
	.long	.L198-.L199
	.text
	.p2align 4,,10
	.p2align 3
.L200:
	movq	DIV_ASSIGN_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L201:
	movq	MUL_ASSIGN_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L202:
	movq	SUB_ASSIGN_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L203:
	movq	ADD_ASSIGN_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L204:
	movq	ASSIGN_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L205:
	movq	OR_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L206:
	movq	AND_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L207:
	movq	GE_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L208:
	movq	LE_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L209:
	movq	GT_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L210:
	movq	LT_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L211:
	movq	NE_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L212:
	movq	EQ_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L213:
	movq	MOD_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L214:
	movq	DIV_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L215:
	movq	MUL_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L216:
	movq	SUB_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L217:
	movq	ADD_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L198:
	movq	MOD_ASSIGN_SYMBOL(%rip), %rax
	ret
	.section	.text.unlikely
	.type	operator_to_string.cold, @function
operator_to_string.cold:
.L218:
	xorl	%eax, %eax
	ret
	.text
	.size	operator_to_string, .-operator_to_string
	.section	.text.unlikely
	.size	operator_to_string.cold, .-operator_to_string.cold
.LCOLDE20:
	.text
.LHOTE20:
	.section	.rodata
	.align 32
	.type	CSWTCH.68, @object
	.size	CSWTCH.68, 76
CSWTCH.68:
	.long	4
	.long	4
	.long	5
	.long	5
	.long	5
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	2
	.long	2
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.local	id_counter.0
	.comm	id_counter.0,8,8
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
