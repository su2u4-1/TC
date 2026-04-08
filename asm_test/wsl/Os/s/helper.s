	.file	"helper.c"
	.text
	.globl	create_list
	.type	create_list, @function
create_list:
	movl	$16, %edi
	pushq	%rax
	call	*alloc_memory@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	%rdx, (%rax)
	movq	%rdx, 8(%rax)
	popq	%rcx
	ret
	.size	create_list, .-create_list
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Error: list_append received NULL list\n"
	.text
	.globl	list_append
	.type	list_append, @function
list_append:
	testq	%rdi, %rdi
	jne	.L4
	movq	stderr(%rip), %rsi
	leaq	.LC0(%rip), %rdi
	jmp	*fputs@GOTPCREL(%rip)
.L4:
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movq	%rdi, %rbx
	movl	$16, %edi
	pushq	%rdx
	call	*alloc_memory@GOTPCREL(%rip)
	xorl	%ecx, %ecx
	cmpq	$0, (%rbx)
	movq	%rcx, (%rax)
	movq	%rbp, 8(%rax)
	jne	.L5
	movq	%rax, (%rbx)
	jmp	.L9
.L5:
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
.L9:
	movq	%rax, 8(%rbx)
	popq	%rax
	popq	%rbx
	popq	%rbp
	ret
	.size	list_append, .-list_append
	.globl	list_copy
	.type	list_copy, @function
list_copy:
	pushq	%rbx
	movq	%rdi, %rbx
	testq	%rdi, %rdi
	je	.L12
	call	create_list
	movq	(%rbx), %rdx
	movq	%rdx, (%rax)
	movq	8(%rbx), %rdx
	movq	%rax, %rbx
	movq	%rdx, 8(%rax)
.L12:
	movq	%rbx, %rax
	popq	%rbx
	ret
	.size	list_copy, .-list_copy
	.globl	list_pop
	.type	list_pop, @function
list_pop:
	xorl	%eax, %eax
	testq	%rdi, %rdi
	je	.L17
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L17
	movq	(%rax), %rdx
	movq	%rdx, (%rdi)
	testq	%rdx, %rdx
	jne	.L19
	xorl	%edx, %edx
	movq	%rdx, 8(%rdi)
.L19:
	movq	8(%rax), %rax
.L17:
	ret
	.size	list_pop, .-list_pop
	.globl	list_pop_back
	.type	list_pop_back, @function
list_pop_back:
	xorl	%eax, %eax
	testq	%rdi, %rdi
	je	.L24
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L24
	movq	8(%rdi), %rcx
	cmpq	%rcx, %rax
	jne	.L26
	xorl	%esi, %esi
	movq	8(%rax), %rax
	movq	%rsi, (%rdi)
	movq	%rsi, 8(%rdi)
	ret
.L26:
	movq	%rax, %rdx
	movq	(%rax), %rax
	cmpq	%rax, %rcx
	jne	.L26
	xorl	%ecx, %ecx
	movq	8(%rax), %rax
	movq	%rcx, (%rdx)
	movq	%rdx, 8(%rdi)
.L24:
	ret
	.size	list_pop_back, .-list_pop_back
	.globl	list_is_empty
	.type	list_is_empty, @function
list_is_empty:
	movl	$1, %eax
	testq	%rdi, %rdi
	je	.L34
	cmpq	$0, (%rdi)
	je	.L34
	xorl	%eax, %eax
	cmpq	$0, 8(%rdi)
	sete	%al
.L34:
	ret
	.size	list_is_empty, .-list_is_empty
	.globl	create_symbol_table
	.type	create_symbol_table, @function
create_symbol_table:
	pushq	%rbp
	movq	%rdi, %rbp
	movl	$16, %edi
	pushq	%rbx
	pushq	%rax
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbp, (%rax)
	movq	%rax, %rbx
	call	create_list
	movq	%rax, 8(%rbx)
	movq	%rbx, %rax
	popq	%rdx
	popq	%rbx
	popq	%rbp
	ret
	.size	create_symbol_table, .-create_symbol_table
	.globl	search_name_use_strcmp
	.type	search_name_use_strcmp, @function
search_name_use_strcmp:
	pushq	%r13
	movq	%rsi, %r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	pushq	%rcx
.L40:
	testq	%rbx, %rbx
	je	.L49
	movq	8(%rbx), %rax
	movq	(%rax), %rbp
.L41:
	testq	%rbp, %rbp
	je	.L50
	movq	8(%rbp), %r12
	movq	%r13, %rsi
	movq	8(%r12), %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L39
	movq	0(%rbp), %rbp
	jmp	.L41
.L50:
	movq	(%rbx), %rbx
	jmp	.L40
.L49:
	xorl	%r12d, %r12d
.L39:
	popq	%rdx
	movq	%r12, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	search_name_use_strcmp, .-search_name_use_strcmp
	.globl	search_name
	.type	search_name, @function
search_name:
	pushq	%r13
	movq	%rsi, %r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	pushq	%rcx
.L52:
	testq	%rbx, %rbx
	je	.L58
	movq	8(%rbx), %rax
	movq	(%rax), %rbp
.L53:
	testq	%rbp, %rbp
	je	.L59
	movq	8(%rbp), %r12
	movq	%r13, %rsi
	movq	8(%r12), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L51
	movq	0(%rbp), %rbp
	jmp	.L53
.L59:
	movq	(%rbx), %rbx
	jmp	.L52
.L58:
	xorl	%r12d, %r12d
.L51:
	popq	%rdx
	movq	%r12, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	search_name, .-search_name
	.section	.rodata.str1.1
.LC1:
	.string	"[Warning] Creating symbol with unknown SymbolType: %u\n"
.LC2:
	.string	"[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n"
.LC3:
	.string	"[Warning] Creating symbol with unknown SymbolType for ast_node assignment: %u\n"
.LC4:
	.string	"[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\n"
	.text
	.globl	create_symbol
	.type	create_symbol, @function
create_symbol:
	pushq	%r15
	movq	%rdx, %r15
	pushq	%r14
	movq	%rdi, %r14
	pushq	%r13
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rbp
	movl	%esi, %ebp
	pushq	%rbx
	pushq	%r8
	cmpl	$2, %esi
	je	.L80
	ja	.L62
	testl	%esi, %esi
	jne	.L80
	movq	16(%rcx), %rax
	jmp	.L84
.L62:
	leal	-3(%rsi), %eax
	movq	%rcx, %r13
	cmpl	$3, %eax
	jbe	.L66
	movl	%esi, %ecx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC1(%rip), %rdx
	xorl	%r13d, %r13d
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L66
.L80:
	movq	32(%r12), %rax
.L84:
	movq	(%rax), %r13
.L66:
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	search_name
	testq	%rax, %rax
	je	.L67
	movq	16(%rax), %r9
	movl	32(%rax), %r8d
	movl	$2, %esi
	pushq	%rcx
	movq	id_counter.0(%rip), %rax
	movq	stderr(%rip), %rdi
	movq	%r14, %rcx
	leaq	.LC2(%rip), %rdx
	incq	%rax
	pushq	%rax
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	popq	%rsi
	popq	%rdi
.L67:
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, 8(%rax)
	movq	%rax, %rbx
	movq	id_counter.0(%rip), %rax
	movl	%ebp, 32(%rbx)
	incq	%rax
	movq	%r15, (%rbx)
	movq	%rax, id_counter.0(%rip)
	movq	%rax, 16(%rbx)
	cmpl	$2, %ebp
	je	.L82
	jbe	.L82
	leal	-3(%rbp), %eax
	cmpl	$3, %eax
	ja	.L85
.L82:
	movq	%r12, 24(%rbx)
	jmp	.L74
.L85:
	movq	stderr(%rip), %rdi
	movl	%ebp, %ecx
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
.L74:
	testq	%r13, %r13
	jne	.L75
	movq	16(%rbx), %r9
	movq	stderr(%rip), %rdi
	movl	%ebp, %r8d
	xorl	%eax, %eax
	movq	%r14, %rcx
	leaq	.LC4(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L60
.L75:
	movq	8(%r13), %rdi
	movq	%rbx, %rsi
	call	list_append
.L60:
	popq	%rdx
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	create_symbol, .-create_symbol
	.globl	is_builtin_type
	.type	is_builtin_type, @function
is_builtin_type:
	pushq	%rbx
	movq	INT_KEYWORD(%rip), %rsi
	movq	%rdi, %rbx
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L87
.L89:
	movl	$1, %eax
	jmp	.L88
.L87:
	movq	FLOAT_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L89
	movq	STRING_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L89
	movq	BOOL_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L89
	movq	VOID_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	setne	%al
	movzbl	%al, %eax
.L88:
	popq	%rbx
	ret
	.size	is_builtin_type, .-is_builtin_type
	.section	.rodata.str1.1
.LC5:
	.string	"[Parser Error] at %s:%zu:%zu: %s\n"
	.text
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
	.section	.rodata.str1.1
.LC6:
	.string	"\342\224\202   "
.LC7:
	.string	"    "
.LC8:
	.string	"\342\224\224\342\224\200\342\224\200 "
.LC9:
	.string	"\342\224\234\342\224\200\342\224\200 "
	.text
	.globl	indention
	.type	indention, @function
indention:
	pushq	%r15
	movl	$1, %eax
	pushq	%r14
	movq	%rcx, %r14
	pushq	%r13
	movl	%edx, %r13d
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	shrq	$3, %rsi
	addq	%rcx, %rsi
	movl	%ebx, %ecx
	andl	$7, %ecx
	subq	$16, %rsp
	sall	%cl, %eax
	movb	(%rsi), %dl
	testb	%r13b, %r13b
	jne	.L94
	orl	%eax, %edx
	jmp	.L95
.L94:
	notl	%eax
	andl	%eax, %edx
.L95:
	movb	%dl, (%rsi)
	movl	$1, %ebp
	leaq	.LC7(%rip), %r15
.L96:
	cmpq	%rbx, %rbp
	jnb	.L104
	movq	%rbp, %rax
	movl	%ebp, %ecx
	movq	%rdi, 8(%rsp)
	movl	$2, %esi
	shrq	$3, %rax
	andl	$7, %ecx
	leaq	.LC6(%rip), %rdx
	movsbl	(%r14,%rax), %eax
	sarl	%cl, %eax
	testb	$1, %al
	cmove	%r15, %rdx
	xorl	%eax, %eax
	incq	%rbp
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	jmp	.L96
.L104:
	testq	%rbx, %rbx
	je	.L93
	testb	%r13b, %r13b
	leaq	.LC8(%rip), %rax
	movl	$2, %esi
	leaq	.LC9(%rip), %rdx
	cmovne	%rax, %rdx
	addq	$16, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*__fprintf_chk@GOTPCREL(%rip)
.L93:
	addq	$16, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	indention, .-indention
	.globl	indention_tac
	.type	indention_tac, @function
indention_tac:
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	xorl	%ebp, %ebp
	pushq	%rbx
	leaq	0(,%rsi,4), %rbx
.L106:
	cmpq	%rbx, %rbp
	jnb	.L109
	movq	%r12, %rsi
	movl	$32, %edi
	incq	%rbp
	call	*putc@GOTPCREL(%rip)
	jmp	.L106
.L109:
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	indention_tac, .-indention_tac
	.globl	create_parser
	.type	create_parser, @function
create_parser:
	pushq	%rbx
	movq	%rdi, %rbx
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movw	$0, 8(%rax)
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
.LC14:
	.string	"Error opening library file for import: %s\n"
.LC15:
	.string	"Info: Starting parsing lib file for import: %s\n"
.LC16:
	.string	"Info: Finished parsing lib file for import: %s\n"
.LC17:
	.string	"Error parsing library file for import: %s\n"
.LC18:
	.string	"Error: Imported symbol '%s' was not found in %s\n"
	.text
	.globl	parse_import_file
	.type	parse_import_file, @function
parse_import_file:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	movq	%rdx, %r13
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	pushq	%rbx
	subq	$40, %rsp
	testq	%rsi, %rsi
	jne	.L113
	call	*strlen@GOTPCREL(%rip)
	leaq	.LC10(%rip), %rdi
	leaq	4(%rax), %rsi
	call	*create_string_not_check@GOTPCREL(%rip)
	movl	$2, %esi
	movq	%r12, %r8
	orq	$-1, %rdx
	movq	%rax, %rdi
	movq	%rax, %rbx
	leaq	.LC11(%rip), %rcx
	xorl	%eax, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	leaq	.LC12(%rip), %rsi
	jmp	.L121
.L113:
	movq	%rsi, %rbx
	movq	%rcx, %rdi
	call	*get_file_dir@GOTPCREL(%rip)
	movq	%rax, %rsi
.L121:
	movq	%rbx, %rdi
	call	*absolute_path@GOTPCREL(%rip)
	leaq	.LC13(%rip), %rsi
	movq	%rax, %rbx
	movq	%rax, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	stderr(%rip), %rdi
	movq	%rbx, %rcx
	leaq	.LC14(%rip), %rdx
	testq	%rax, %rax
	movq	%rax, %rbp
	movl	$2, %esi
	je	.L122
	leaq	.LC15(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	xorl	%eax, %eax
	leaq	24(%rsp), %rsi
	movq	%rbp, %rdi
	movq	%rax, 24(%rsp)
	call	*read_source@GOTPCREL(%rip)
	movq	%rbp, %rdi
	movq	%rax, %r14
	call	*fclose@GOTPCREL(%rip)
	movq	%rbx, %rdi
	call	*create_file@GOTPCREL(%rip)
	movq	%rax, %rdi
	call	create_parser
	movq	24(%rsp), %rsi
	movq	%rbx, %rdx
	movq	%r14, %rdi
	movq	builtin_scope(%rip), %r15
	movq	%rax, %rbp
	call	*create_lexer@GOTPCREL(%rip)
	movq	%rbp, %rdx
	movq	%rax, %rdi
	movq	%r15, %rsi
	call	*parse_code@GOTPCREL(%rip)
	movq	stderr(%rip), %rdi
	movq	%rbx, %rcx
	leaq	.LC16(%rip), %rdx
	movq	%rax, %rbp
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	testq	%rbp, %rbp
	jne	.L117
	movq	stderr(%rip), %rdi
	movq	%rbx, %rcx
	movl	$2, %esi
	leaq	.LC17(%rip), %rdx
.L122:
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L116:
	xorl	%eax, %eax
	jmp	.L112
.L117:
	movq	8(%rbp), %rdi
	movq	%r12, %rsi
	call	search_name_use_strcmp
	testq	%rax, %rax
	je	.L119
	movq	8(%r13), %rdi
	movq	%rax, %rsi
	movq	%rax, 8(%rsp)
	call	list_append
	movq	8(%rsp), %rax
	jmp	.L112
.L119:
	movq	stderr(%rip), %rdi
	movq	%rbx, %r8
	movq	%r12, %rcx
	xorl	%eax, %eax
	leaq	.LC18(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L116
.L112:
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	parse_import_file, .-parse_import_file
	.section	.rodata.str1.1
.LC19:
	.string	"%s.%s"
	.text
	.globl	make_method_name
	.type	make_method_name, @function
make_method_name:
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	subq	$24, %rsp
	movq	%rdi, 8(%rsp)
	call	*strlen@GOTPCREL(%rip)
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	*strlen@GOTPCREL(%rip)
	leaq	.LC10(%rip), %rdi
	leaq	2(%rbx,%rax), %rsi
	call	*create_string@GOTPCREL(%rip)
	movq	8(%rsp), %r8
	movq	%rbp, %r9
	orq	$-1, %rdx
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC19(%rip), %rcx
	call	*__sprintf_chk@GOTPCREL(%rip)
	addq	$24, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	ret
	.size	make_method_name, .-make_method_name
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
	jne	.L125
	movq	ADD_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$14, %eax
	testb	%dl, %dl
	jne	.L125
	movq	SUB_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$15, %eax
	testb	%dl, %dl
	jne	.L125
	movq	MUL_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$16, %eax
	testb	%dl, %dl
	jne	.L125
	movq	DIV_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$17, %eax
	testb	%dl, %dl
	jne	.L125
	movq	MOD_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$18, %eax
	testb	%dl, %dl
	jne	.L125
	movq	AND_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$11, %eax
	testb	%dl, %dl
	jne	.L125
	movq	OR_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$12, %eax
	testb	%dl, %dl
	jne	.L125
	movq	EQ_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$5, %eax
	testb	%dl, %dl
	jne	.L125
	movq	NE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$6, %eax
	testb	%dl, %dl
	jne	.L125
	movq	LT_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$7, %eax
	testb	%dl, %dl
	jne	.L125
	movq	GT_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$8, %eax
	testb	%dl, %dl
	jne	.L125
	movq	LE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$9, %eax
	testb	%dl, %dl
	jne	.L125
	movq	GE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$10, %eax
	testb	%dl, %dl
	jne	.L125
	movq	ADD_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	xorl	%eax, %eax
	testb	%dl, %dl
	jne	.L125
	movq	SUB_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L125
	movq	MUL_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$2, %eax
	testb	%dl, %dl
	jne	.L125
	movq	DIV_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$3, %eax
	testb	%dl, %dl
	jne	.L125
	movq	MOD_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	cmpb	$1, %al
	sbbl	%eax, %eax
	andl	$15, %eax
	addl	$4, %eax
.L125:
	popq	%rbx
	ret
	.size	string_to_operator, .-string_to_operator
	.globl	operator_precedence
	.type	operator_precedence, @function
operator_precedence:
	xorl	%eax, %eax
	cmpl	$18, %edi
	ja	.L147
	movl	%edi, %edi
	leaq	CSWTCH.69(%rip), %rax
	movsbl	(%rax,%rdi), %eax
.L147:
	ret
	.size	operator_precedence, .-operator_precedence
	.globl	operator_to_string
	.type	operator_to_string, @function
operator_to_string:
	xorl	%eax, %eax
	cmpl	$18, %edi
	ja	.L150
	leaq	.L153(%rip), %rdx
	movl	%edi, %edi
	movslq	(%rdx,%rdi,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L153:
	.long	.L171-.L153
	.long	.L170-.L153
	.long	.L169-.L153
	.long	.L168-.L153
	.long	.L167-.L153
	.long	.L166-.L153
	.long	.L165-.L153
	.long	.L164-.L153
	.long	.L163-.L153
	.long	.L162-.L153
	.long	.L161-.L153
	.long	.L160-.L153
	.long	.L159-.L153
	.long	.L158-.L153
	.long	.L157-.L153
	.long	.L156-.L153
	.long	.L155-.L153
	.long	.L154-.L153
	.long	.L152-.L153
	.text
.L158:
	movq	ASSIGN_SYMBOL(%rip), %rax
	ret
.L157:
	movq	ADD_ASSIGN_SYMBOL(%rip), %rax
	ret
.L156:
	movq	SUB_ASSIGN_SYMBOL(%rip), %rax
	ret
.L155:
	movq	MUL_ASSIGN_SYMBOL(%rip), %rax
	ret
.L154:
	movq	DIV_ASSIGN_SYMBOL(%rip), %rax
	ret
.L152:
	movq	MOD_ASSIGN_SYMBOL(%rip), %rax
	ret
.L160:
	movq	AND_SYMBOL(%rip), %rax
	ret
.L159:
	movq	OR_SYMBOL(%rip), %rax
	ret
.L166:
	movq	EQ_SYMBOL(%rip), %rax
	ret
.L165:
	movq	NE_SYMBOL(%rip), %rax
	ret
.L164:
	movq	LT_SYMBOL(%rip), %rax
	ret
.L163:
	movq	GT_SYMBOL(%rip), %rax
	ret
.L162:
	movq	LE_SYMBOL(%rip), %rax
	ret
.L161:
	movq	GE_SYMBOL(%rip), %rax
	ret
.L171:
	movq	ADD_SYMBOL(%rip), %rax
	ret
.L170:
	movq	SUB_SYMBOL(%rip), %rax
	ret
.L169:
	movq	MUL_SYMBOL(%rip), %rax
	ret
.L168:
	movq	DIV_SYMBOL(%rip), %rax
	ret
.L167:
	movq	MOD_SYMBOL(%rip), %rax
.L150:
	ret
	.size	operator_to_string, .-operator_to_string
	.section	.rodata
	.align 16
	.type	CSWTCH.69, @object
	.size	CSWTCH.69, 19
CSWTCH.69:
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	5
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	2
	.byte	2
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.local	id_counter.0
	.comm	id_counter.0,8,8
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
