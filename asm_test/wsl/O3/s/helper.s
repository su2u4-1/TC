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
	je	.L77
.L43:
	movq	32(%rcx), %rax
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
.L78:
	movq	0(%r13), %r13
	testq	%r13, %r13
	je	.L51
.L53:
	movq	8(%r13), %r14
	movq	%rbx, %rsi
	movq	8(%r14), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L78
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
	je	.L74
	movq	8(%r15), %rbx
	testq	%rbx, %rbx
	je	.L79
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	cmpq	$0, (%rbx)
	movq	$0, (%rax)
	movq	%r12, 8(%rax)
	je	.L80
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rbx)
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
	movq	%rcx, %r15
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
.L74:
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
.L77:
	movq	16(%rcx), %rax
	movq	(%rax), %r15
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L80:
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm0
	movups	%xmm0, (%rbx)
	jmp	.L42
.L79:
	movq	stderr(%rip), %rcx
	movl	$38, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L42
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
	je	.L88
	movq	%rdi, %r13
	movq	%rsi, %r12
.L87:
	movq	8(%r13), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L86
	jmp	.L85
	.p2align 4,,10
	.p2align 3
.L98:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L85
.L86:
	movq	8(%rbx), %rbp
	movq	%r12, %rsi
	movq	8(%rbp), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L98
	addq	$8, %rsp
	movq	%rbp, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L85:
	movq	0(%r13), %r13
	testq	%r13, %r13
	jne	.L87
.L88:
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
	je	.L100
	movq	%rdi, %r13
	movq	%rsi, %r12
.L104:
	movq	8(%r13), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L103
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L114:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L101
.L103:
	movq	8(%rbx), %rbp
	movq	%r12, %rsi
	movq	8(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L114
	addq	$8, %rsp
	movq	%rbp, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L101:
	movq	0(%r13), %r13
	testq	%r13, %r13
	jne	.L104
.L100:
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
	je	.L116
.L118:
	movl	$1, %eax
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L116:
	movq	FLOAT_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L118
	movq	STRING_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L118
	movq	BOOL_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L118
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
	.string	"\342\224\224\342\224\200\342\224\200 "
.LC7:
	.string	"\342\224\234\342\224\200\342\224\200 "
.LC8:
	.string	"\342\224\202   "
.LC9:
	.string	"    "
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
	jne	.L123
	orl	%eax, %esi
	movb	%sil, (%rdx)
	cmpq	$1, %rbx
	jbe	.L135
.L124:
	movl	$1, %r15d
	leaq	.LC9(%rip), %r14
	leaq	.LC8(%rip), %r13
	.p2align 4,,10
	.p2align 3
.L128:
	movq	%r15, %rax
	movq	%r12, %rcx
	shrq	$3, %rax
	movsbl	0(%rbp,%rax), %edx
	movl	%r15d, %eax
	andl	$7, %eax
	btl	%eax, %edx
	jnc	.L130
	addq	$1, %r15
	movl	$6, %edx
	movl	$1, %esi
	movq	%r13, %rdi
	call	*fwrite@GOTPCREL(%rip)
	cmpq	%r15, %rbx
	jne	.L128
	cmpb	$0, 12(%rsp)
	je	.L125
	.p2align 4,,10
	.p2align 3
.L129:
	leaq	.LC6(%rip), %rdx
.L133:
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
.L130:
	addq	$1, %r15
	movl	$4, %edx
	movl	$1, %esi
	movq	%r14, %rdi
	call	*fwrite@GOTPCREL(%rip)
	cmpq	%r15, %rbx
	jne	.L128
	cmpb	$0, 12(%rsp)
	jne	.L129
.L125:
	leaq	.LC7(%rip), %rdx
	jmp	.L133
	.p2align 4,,10
	.p2align 3
.L123:
	notl	%eax
	andl	%esi, %eax
	movb	%al, (%rdx)
	cmpq	$1, %rbx
	ja	.L124
	testq	%rbx, %rbx
	jne	.L129
.L122:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L135:
	testq	%rbx, %rbx
	je	.L122
	jmp	.L125
	.size	indention, .-indention
	.p2align 4
	.globl	indention_tac
	.type	indention_tac, @function
indention_tac:
	salq	$2, %rsi
	je	.L144
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L138:
	addq	$1, %rbx
	movq	%r12, %rsi
	movl	$32, %edi
	call	*putc@GOTPCREL(%rip)
	cmpq	%rbp, %rbx
	jne	.L138
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L144:
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
	je	.L175
	movq	%rsi, %rbx
	movq	%rcx, %rdi
	call	*get_file_dir@GOTPCREL(%rip)
	movq	%rbx, %rdi
	movq	%rax, %rsi
	call	*absolute_path@GOTPCREL(%rip)
	movq	%rax, %r13
.L151:
	leaq	.LC13(%rip), %rsi
	movq	%r13, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L176
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
	je	.L177
	movq	8(%rbx), %r14
	testq	%r14, %r14
	je	.L156
.L160:
	movq	8(%r14), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L159
	jmp	.L157
	.p2align 4,,10
	.p2align 3
.L178:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L157
.L159:
	movq	8(%rbx), %rbp
	movq	%r12, %rsi
	movq	8(%rbp), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L178
	movq	8(%r15), %rbx
	testq	%rbx, %rbx
	je	.L179
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	cmpq	$0, (%rbx)
	movq	$0, (%rax)
	movq	%rbp, 8(%rax)
	je	.L180
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rbx)
.L149:
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
.L157:
	movq	(%r14), %r14
	testq	%r14, %r14
	jne	.L160
.L156:
	movq	stderr(%rip), %rdi
	movq	%r13, %r8
	movq	%r12, %rcx
	xorl	%eax, %eax
	leaq	.LC18(%rip), %rdx
	movl	$2, %esi
	xorl	%ebp, %ebp
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L149
	.p2align 4,,10
	.p2align 3
.L175:
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
	jmp	.L151
	.p2align 4,,10
	.p2align 3
.L180:
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm0
	movups	%xmm0, (%rbx)
	jmp	.L149
.L179:
	movq	stderr(%rip), %rcx
	movl	$38, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L149
.L177:
	movq	stderr(%rip), %rdi
	movq	%r13, %rcx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	leaq	.LC17(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L149
.L176:
	movq	stderr(%rip), %rdi
	movq	%r13, %rcx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	leaq	.LC14(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L149
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
	jne	.L183
	movq	ADD_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$14, %eax
	testb	%dl, %dl
	jne	.L183
	movq	SUB_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$15, %eax
	testb	%dl, %dl
	jne	.L183
	movq	MUL_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$16, %eax
	testb	%dl, %dl
	jne	.L183
	movq	DIV_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$17, %eax
	testb	%dl, %dl
	jne	.L183
	movq	MOD_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$18, %eax
	testb	%dl, %dl
	jne	.L183
	movq	AND_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$11, %eax
	testb	%dl, %dl
	jne	.L183
	movq	OR_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$12, %eax
	testb	%dl, %dl
	jne	.L183
	movq	EQ_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$5, %eax
	testb	%dl, %dl
	jne	.L183
	movq	NE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$6, %eax
	testb	%dl, %dl
	jne	.L183
	movq	LT_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$7, %eax
	testb	%dl, %dl
	jne	.L183
	movq	GT_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$8, %eax
	testb	%dl, %dl
	jne	.L183
	movq	LE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$9, %eax
	testb	%dl, %dl
	jne	.L183
	movq	GE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$10, %eax
	testb	%dl, %dl
	jne	.L183
	movq	ADD_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	xorl	%eax, %eax
	testb	%dl, %dl
	jne	.L183
	movq	SUB_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L183
	movq	MUL_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L201
	movq	DIV_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L202
	movq	MOD_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	cmpb	$1, %al
	sbbl	%eax, %eax
	andl	$15, %eax
	addl	$4, %eax
.L183:
	popq	%rbx
	ret
.L201:
	movl	$2, %eax
	popq	%rbx
	ret
.L202:
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
	ja	.L205
	movl	%edi, %edi
	leaq	CSWTCH.68(%rip), %rax
	movl	(%rax,%rdi,4), %eax
.L205:
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
	ja	.L230
	leaq	.L211(%rip), %rdx
	movl	%edi, %edi
	movslq	(%rdx,%rdi,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L211:
	.long	.L229-.L211
	.long	.L228-.L211
	.long	.L227-.L211
	.long	.L226-.L211
	.long	.L225-.L211
	.long	.L224-.L211
	.long	.L223-.L211
	.long	.L222-.L211
	.long	.L221-.L211
	.long	.L220-.L211
	.long	.L219-.L211
	.long	.L218-.L211
	.long	.L217-.L211
	.long	.L216-.L211
	.long	.L215-.L211
	.long	.L214-.L211
	.long	.L213-.L211
	.long	.L212-.L211
	.long	.L210-.L211
	.text
	.p2align 4,,10
	.p2align 3
.L212:
	movq	DIV_ASSIGN_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L213:
	movq	MUL_ASSIGN_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L214:
	movq	SUB_ASSIGN_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L215:
	movq	ADD_ASSIGN_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L216:
	movq	ASSIGN_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L217:
	movq	OR_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L218:
	movq	AND_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L219:
	movq	GE_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L220:
	movq	LE_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L221:
	movq	GT_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L222:
	movq	LT_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L223:
	movq	NE_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L224:
	movq	EQ_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L225:
	movq	MOD_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L226:
	movq	DIV_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L227:
	movq	MUL_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L228:
	movq	SUB_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L229:
	movq	ADD_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L210:
	movq	MOD_ASSIGN_SYMBOL(%rip), %rax
	ret
	.section	.text.unlikely
	.type	operator_to_string.cold, @function
operator_to_string.cold:
.L230:
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
