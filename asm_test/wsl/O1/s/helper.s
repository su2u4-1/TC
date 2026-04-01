	.file	"helper.c"
	.text
	.globl	create_list
	.type	create_list, @function
create_list:
	subq	$8, %rsp
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	$0, (%rax)
	movq	$0, 8(%rax)
	addq	$8, %rsp
	ret
	.size	create_list, .-create_list
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Error: list_append received NULL list\n"
	.text
	.globl	list_append
	.type	list_append, @function
list_append:
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	testq	%rdi, %rdi
	je	.L8
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	$0, (%rax)
	movq	%rbp, 8(%rax)
	cmpq	$0, (%rbx)
	je	.L9
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rbx)
.L3:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.L8:
	movq	stderr(%rip), %rcx
	movl	$38, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L3
.L9:
	movq	%rax, (%rbx)
	movq	%rax, 8(%rbx)
	jmp	.L3
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
	movq	%rdx, 8(%rax)
.L10:
	popq	%rbx
	ret
.L12:
	movq	%rdi, %rax
	jmp	.L10
	.size	list_copy, .-list_copy
	.globl	list_pop
	.type	list_pop, @function
list_pop:
	testq	%rdi, %rdi
	je	.L17
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L14
	movq	(%rax), %rdx
	movq	%rdx, (%rdi)
	testq	%rdx, %rdx
	je	.L18
.L16:
	movq	8(%rax), %rax
	ret
.L18:
	movq	$0, 8(%rdi)
	jmp	.L16
.L17:
	movq	%rdi, %rax
.L14:
	ret
	.size	list_pop, .-list_pop
	.globl	list_pop_back
	.type	list_pop_back, @function
list_pop_back:
	testq	%rdi, %rdi
	je	.L22
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L19
	movq	8(%rdi), %rdx
	cmpq	%rdx, %rax
	je	.L25
.L21:
	movq	%rax, %rcx
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L21
	movq	8(%rdx), %rax
	movq	$0, (%rcx)
	movq	%rcx, 8(%rdi)
	ret
.L25:
	movq	8(%rax), %rax
	movq	$0, (%rdi)
	movq	$0, 8(%rdi)
	ret
.L22:
	movq	%rdi, %rax
.L19:
	ret
	.size	list_pop_back, .-list_pop_back
	.globl	list_is_empty
	.type	list_is_empty, @function
list_is_empty:
	movl	$1, %eax
	testq	%rdi, %rdi
	je	.L27
	cmpq	$0, (%rdi)
	je	.L27
	cmpq	$0, 8(%rdi)
	sete	%al
	movzbl	%al, %eax
.L27:
	ret
	.size	list_is_empty, .-list_is_empty
	.globl	create_symbol_table
	.type	create_symbol_table, @function
create_symbol_table:
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbp
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%rbp, (%rax)
	call	create_list
	movq	%rax, 8(%rbx)
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.size	create_symbol_table, .-create_symbol_table
	.globl	search_name_use_strcmp
	.type	search_name_use_strcmp, @function
search_name_use_strcmp:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %r13
	movq	%rsi, %r12
	testq	%rdi, %rdi
	je	.L37
.L36:
	movq	8(%r13), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	je	.L34
.L35:
	movq	8(%rbx), %rbp
	movq	8(%rbp), %rdi
	movq	%r12, %rsi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L32
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L35
.L34:
	movq	0(%r13), %r13
	testq	%r13, %r13
	jne	.L36
	movq	%r13, %rbp
	jmp	.L32
.L37:
	movq	%rdi, %rbp
.L32:
	movq	%rbp, %rax
	addq	$8, %rsp
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
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %r13
	movq	%rsi, %r12
	testq	%rdi, %rdi
	je	.L46
.L45:
	movq	8(%r13), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	je	.L43
.L44:
	movq	8(%rbx), %rbp
	movq	8(%rbp), %rdi
	movq	%r12, %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L41
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L44
.L43:
	movq	0(%r13), %r13
	testq	%r13, %r13
	jne	.L45
	movq	%r13, %rbp
	jmp	.L41
.L46:
	movq	%rdi, %rbp
.L41:
	movq	%rbp, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	search_name, .-search_name
	.section	.rodata.str1.8
	.align 8
.LC1:
	.string	"Warning: Creating symbol with unknown SymbolType: %d\n"
	.align 8
.LC2:
	.string	"Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\n"
	.align 8
.LC3:
	.string	"Warning: Creating symbol with unknown SymbolType for ast_node assignment: %d\n"
	.align 8
.LC4:
	.string	"Warning: Creating symbol '%s' with NULL scope, kind: %d, id: %zu\n"
	.text
	.globl	create_symbol
	.type	create_symbol, @function
create_symbol:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %r12
	movl	%esi, %ebx
	movq	%rdx, %r14
	movq	%rcx, %r13
	cmpl	$2, %esi
	je	.L51
	ja	.L52
	testl	%esi, %esi
	je	.L71
	movq	32(%rcx), %rax
	movq	(%rax), %r15
	jmp	.L56
.L52:
	leal	-3(%rsi), %eax
	movq	%rcx, %r15
	cmpl	$3, %eax
	jbe	.L56
	movl	%esi, %ecx
	leaq	.LC1(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %r15d
	jmp	.L56
.L71:
	movq	16(%rcx), %rax
	movq	(%rax), %r15
.L56:
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	search_name
	testq	%rax, %rax
	je	.L57
	movq	16(%rax), %r9
	movl	32(%rax), %r8d
	subq	$8, %rsp
	movq	id_counter.0(%rip), %rax
	addq	$1, %rax
	pushq	%rax
	movq	%r12, %rcx
	leaq	.LC2(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	addq	$16, %rsp
.L57:
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%r12, 8(%rax)
	movq	id_counter.0(%rip), %rax
	addq	$1, %rax
	movq	%rax, id_counter.0(%rip)
	movq	%rax, 16(%rbp)
	movl	%ebx, 32(%rbp)
	movq	%r14, 0(%rbp)
	cmpl	$2, %ebx
	je	.L58
	ja	.L59
	testl	%ebx, %ebx
	je	.L72
	movq	%r13, 24(%rbp)
	jmp	.L64
.L51:
	movq	32(%rcx), %rax
	movq	(%rax), %r15
	jmp	.L56
.L59:
	leal	-3(%rbx), %eax
	cmpl	$3, %eax
	ja	.L73
	movq	%r13, 24(%rbp)
	jmp	.L64
.L72:
	movq	%r13, 24(%rbp)
.L64:
	testq	%r15, %r15
	je	.L74
	movq	8(%r15), %rdi
	movq	%rbp, %rsi
	call	list_append
.L50:
	movq	%rbp, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L58:
	movq	%r13, 24(%rbp)
	jmp	.L64
.L73:
	movl	%ebx, %ecx
	leaq	.LC3(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L64
.L74:
	movq	16(%rbp), %r9
	movl	%ebx, %r8d
	movq	%r12, %rcx
	leaq	.LC4(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L50
	.size	create_symbol, .-create_symbol
	.globl	is_builtin_type
	.type	is_builtin_type, @function
is_builtin_type:
	pushq	%rbx
	movq	%rdi, %rbx
	movq	INT_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	je	.L82
.L76:
	popq	%rbx
	ret
.L82:
	movq	FLOAT_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L76
	movq	STRING_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L76
	movq	BOOL_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L76
	movq	VOID_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	setne	%al
	movzbl	%al, %eax
	jmp	.L76
	.size	is_builtin_type, .-is_builtin_type
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"Parser Error at %s:%zu:%zu: %s\n"
	.text
	.globl	parser_error
	.type	parser_error, @function
parser_error:
	subq	$16, %rsp
	movq	%rdx, %rcx
	movq	16(%rsi), %rdx
	movq	8(%rsi), %rax
	pushq	%rdi
	leaq	1(%rdx), %r9
	leaq	1(%rax), %r8
	leaq	.LC5(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
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
	.globl	indention
	.type	indention, @function
indention:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$24, %rsp
	movq	%rdi, %r13
	movq	%rsi, %rbp
	movl	%edx, %edi
	movl	%edx, 12(%rsp)
	leaq	11(%rcx), %r12
	movq	%rsi, %rax
	shrq	$3, %rax
	addq	%r12, %rax
	movzbl	(%rax), %edx
	testb	%dil, %dil
	jne	.L86
	movl	%esi, %ecx
	andl	$7, %ecx
	movl	$1, %esi
	sall	%cl, %esi
	orl	%esi, %edx
.L87:
	movb	%dl, (%rax)
	cmpq	$1, %rbp
	jbe	.L88
	movl	$1, %ebx
	leaq	.LC7(%rip), %r15
	leaq	.LC6(%rip), %r14
.L90:
	movq	%rbx, %rax
	shrq	$3, %rax
	movsbl	(%r12,%rax), %eax
	movl	%ebx, %ecx
	andl	$7, %ecx
	sarl	%cl, %eax
	testb	$1, %al
	movq	%r14, %rdx
	cmove	%r15, %rdx
	movl	$2, %esi
	movq	%r13, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	addq	$1, %rbx
	cmpq	%rbx, %rbp
	jne	.L90
.L91:
	cmpb	$0, 12(%rsp)
	leaq	.LC9(%rip), %rdx
	leaq	.LC8(%rip), %rax
	cmovne	%rax, %rdx
	movl	$2, %esi
	movq	%r13, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L85
.L86:
	movl	%esi, %ecx
	andl	$7, %ecx
	movl	$1, %esi
	sall	%cl, %esi
	notl	%esi
	andl	%esi, %edx
	jmp	.L87
.L88:
	testq	%rbp, %rbp
	jne	.L91
.L85:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	indention, .-indention
	.globl	create_parser
	.type	create_parser, @function
create_parser:
	pushq	%rbx
	movq	%rdi, %rbx
	movl	$48, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, 8(%rax)
	movb	$0, 9(%rax)
	movb	$0, 10(%rax)
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
	.string	"D:/TC/std/"
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
	.globl	parse_import_file
	.type	parse_import_file, @function
parse_import_file:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$24, %rsp
	movq	%rdi, %r12
	movq	%rdx, %r14
	testq	%rsi, %rsi
	je	.L111
	movq	%rsi, %rbx
	movq	%rcx, %rdi
	call	*get_file_dir@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	*absolute_path@GOTPCREL(%rip)
	movq	%rax, %r13
.L102:
	leaq	.LC13(%rip), %rsi
	movq	%r13, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L112
	movq	%r13, %rdx
	leaq	.LC15(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	*__printf_chk@GOTPCREL(%rip)
	movq	$0, 8(%rsp)
	leaq	8(%rsp), %rsi
	movq	%rbp, %rdi
	call	*read_source@GOTPCREL(%rip)
	movq	%rax, %r15
	movq	%rbp, %rdi
	call	*fclose@GOTPCREL(%rip)
	movq	%r13, %rdi
	call	*create_file@GOTPCREL(%rip)
	movq	%rax, %rdi
	call	create_parser
	movq	%rax, %rbx
	movq	builtin_scope(%rip), %rbp
	movq	8(%rsp), %rsi
	movq	%r15, %rdi
	call	*create_lexer@GOTPCREL(%rip)
	movq	%rax, %rdi
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	call	*parse_code@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%r13, %rdx
	leaq	.LC16(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	*__printf_chk@GOTPCREL(%rip)
	testq	%rbp, %rbp
	je	.L113
	movq	8(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	je	.L106
.L108:
	movq	8(%rbx), %rbp
	movq	8(%rbp), %rdi
	movq	%r12, %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L107
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L108
.L106:
	movq	%r13, %r8
	movq	%r12, %rcx
	leaq	.LC18(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %ebp
	jmp	.L100
.L111:
	call	*strlen@GOTPCREL(%rip)
	leaq	4(%rax), %rsi
	leaq	.LC10(%rip), %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%r12, %r8
	leaq	.LC11(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	leaq	.LC12(%rip), %rsi
	movq	%rbx, %rdi
	call	*absolute_path@GOTPCREL(%rip)
	movq	%rax, %r13
	jmp	.L102
.L112:
	movq	%r13, %rcx
	leaq	.LC14(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L100
.L113:
	movq	%r13, %rcx
	leaq	.LC17(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L100
.L107:
	movq	8(%r14), %rdi
	movq	%rbp, %rsi
	call	list_append
.L100:
	movq	%rbp, %rax
	addq	$24, %rsp
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
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbp
	movq	%rsi, %r12
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%r12, %rdi
	call	*strlen@GOTPCREL(%rip)
	leaq	2(%rbx,%rax), %rsi
	leaq	.LC10(%rip), %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%r12, %r9
	movq	%rbp, %r8
	leaq	.LC19(%rip), %rcx
	movq	$-1, %rdx
	movl	$2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*__sprintf_chk@GOTPCREL(%rip)
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	make_method_name, .-make_method_name
	.globl	string_to_operator
	.type	string_to_operator, @function
string_to_operator:
	pushq	%rbx
	movq	%rdi, %rbx
	movq	ASSIGN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$13, %eax
	testb	%dl, %dl
	jne	.L116
	movq	ADD_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$14, %eax
	testb	%dl, %dl
	jne	.L116
	movq	SUB_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$15, %eax
	testb	%dl, %dl
	jne	.L116
	movq	MUL_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$16, %eax
	testb	%dl, %dl
	jne	.L116
	movq	DIV_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$17, %eax
	testb	%dl, %dl
	jne	.L116
	movq	MOD_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$18, %eax
	testb	%dl, %dl
	jne	.L116
	movq	AND_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$11, %eax
	testb	%dl, %dl
	jne	.L116
	movq	OR_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$12, %eax
	testb	%dl, %dl
	jne	.L116
	movq	EQ_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$5, %eax
	testb	%dl, %dl
	jne	.L116
	movq	NE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$6, %eax
	testb	%dl, %dl
	jne	.L116
	movq	LT_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$7, %eax
	testb	%dl, %dl
	jne	.L116
	movq	GT_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$8, %eax
	testb	%dl, %dl
	jne	.L116
	movq	LE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$9, %eax
	testb	%dl, %dl
	jne	.L116
	movq	GE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$10, %eax
	testb	%dl, %dl
	jne	.L116
	movq	ADD_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$0, %eax
	testb	%dl, %dl
	je	.L138
.L116:
	popq	%rbx
	ret
.L138:
	movq	SUB_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L116
	movq	MUL_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L134
	movq	DIV_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L135
	movq	MOD_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	cmpb	$1, %al
	sbbl	%eax, %eax
	andl	$15, %eax
	addl	$4, %eax
	jmp	.L116
.L134:
	movl	$2, %eax
	jmp	.L116
.L135:
	movl	$3, %eax
	jmp	.L116
	.size	string_to_operator, .-string_to_operator
	.globl	operator_precedence
	.type	operator_precedence, @function
operator_precedence:
	cmpl	$18, %edi
	ja	.L140
	movl	%edi, %edi
	leaq	.L142(%rip), %rdx
	movslq	(%rdx,%rdi,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L142:
	.long	.L146-.L142
	.long	.L146-.L142
	.long	.L145-.L142
	.long	.L145-.L142
	.long	.L145-.L142
	.long	.L144-.L142
	.long	.L144-.L142
	.long	.L144-.L142
	.long	.L144-.L142
	.long	.L144-.L142
	.long	.L144-.L142
	.long	.L147-.L142
	.long	.L147-.L142
	.long	.L141-.L142
	.long	.L141-.L142
	.long	.L141-.L142
	.long	.L141-.L142
	.long	.L141-.L142
	.long	.L141-.L142
	.text
.L141:
	movl	$1, %eax
	ret
.L144:
	movl	$3, %eax
	ret
.L146:
	movl	$4, %eax
	ret
.L145:
	movl	$5, %eax
	ret
.L140:
	movl	$0, %eax
	ret
.L147:
	movl	$2, %eax
	ret
	.size	operator_precedence, .-operator_precedence
	.globl	operator_to_string
	.type	operator_to_string, @function
operator_to_string:
	cmpl	$18, %edi
	ja	.L170
	movl	%edi, %edi
	leaq	.L151(%rip), %rdx
	movslq	(%rdx,%rdi,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L151:
	.long	.L169-.L151
	.long	.L168-.L151
	.long	.L167-.L151
	.long	.L166-.L151
	.long	.L165-.L151
	.long	.L164-.L151
	.long	.L163-.L151
	.long	.L162-.L151
	.long	.L161-.L151
	.long	.L160-.L151
	.long	.L159-.L151
	.long	.L158-.L151
	.long	.L157-.L151
	.long	.L156-.L151
	.long	.L155-.L151
	.long	.L154-.L151
	.long	.L153-.L151
	.long	.L152-.L151
	.long	.L150-.L151
	.text
.L156:
	movq	ASSIGN_SYMBOL(%rip), %rax
	ret
.L155:
	movq	ADD_ASSIGN_SYMBOL(%rip), %rax
	ret
.L154:
	movq	SUB_ASSIGN_SYMBOL(%rip), %rax
	ret
.L153:
	movq	MUL_ASSIGN_SYMBOL(%rip), %rax
	ret
.L152:
	movq	DIV_ASSIGN_SYMBOL(%rip), %rax
	ret
.L150:
	movq	MOD_ASSIGN_SYMBOL(%rip), %rax
	ret
.L158:
	movq	AND_SYMBOL(%rip), %rax
	ret
.L157:
	movq	OR_SYMBOL(%rip), %rax
	ret
.L164:
	movq	EQ_SYMBOL(%rip), %rax
	ret
.L163:
	movq	NE_SYMBOL(%rip), %rax
	ret
.L162:
	movq	LT_SYMBOL(%rip), %rax
	ret
.L161:
	movq	GT_SYMBOL(%rip), %rax
	ret
.L160:
	movq	LE_SYMBOL(%rip), %rax
	ret
.L159:
	movq	GE_SYMBOL(%rip), %rax
	ret
.L169:
	movq	ADD_SYMBOL(%rip), %rax
	ret
.L168:
	movq	SUB_SYMBOL(%rip), %rax
	ret
.L167:
	movq	MUL_SYMBOL(%rip), %rax
	ret
.L166:
	movq	DIV_SYMBOL(%rip), %rax
	ret
.L165:
	movq	MOD_SYMBOL(%rip), %rax
	ret
.L170:
	movl	$0, %eax
	ret
	.size	operator_to_string, .-operator_to_string
	.local	id_counter.0
	.comm	id_counter.0,8,8
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
