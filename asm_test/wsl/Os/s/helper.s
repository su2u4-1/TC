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
	.globl	create_node
	.type	create_node, @function
create_node:
	pushq	%rbx
	movq	%rdi, %rbx
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	%rdx, (%rax)
	movq	%rbx, 8(%rax)
	popq	%rbx
	ret
	.size	create_node, .-create_node
	.globl	list_append
	.type	list_append, @function
list_append:
	pushq	%rbx
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	call	create_node
	cmpq	$0, (%rbx)
	jne	.L6
	movq	%rax, (%rbx)
	jmp	.L7
.L6:
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
.L7:
	movq	%rax, 8(%rbx)
	popq	%rbx
	ret
	.size	list_append, .-list_append
	.globl	list_copy
	.type	list_copy, @function
list_copy:
	pushq	%rbx
	movq	%rdi, %rbx
	call	create_list
	movq	(%rbx), %rdx
	movq	%rdx, (%rax)
	movq	8(%rbx), %rdx
	movq	%rdx, 8(%rax)
	popq	%rbx
	ret
	.size	list_copy, .-list_copy
	.globl	list_pop
	.type	list_pop, @function
list_pop:
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L12
	movq	(%rax), %rdx
	movq	%rdx, (%rdi)
	testq	%rdx, %rdx
	jne	.L14
	xorl	%edx, %edx
	movq	%rdx, 8(%rdi)
.L14:
	movq	8(%rax), %rax
.L12:
	ret
	.size	list_pop, .-list_pop
	.globl	create_scope
	.type	create_scope, @function
create_scope:
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
	.size	create_scope, .-create_scope
	.globl	search
	.type	search, @function
search:
	pushq	%r13
	movq	%rsi, %r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	pushq	%rcx
.L21:
	testq	%rbx, %rbx
	je	.L27
	movq	8(%rbx), %rax
	movq	(%rax), %rbp
.L22:
	testq	%rbp, %rbp
	je	.L28
	movq	8(%rbp), %r12
	movq	%r13, %rsi
	movq	(%r12), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L20
	movq	0(%rbp), %rbp
	jmp	.L22
.L28:
	movq	(%rbx), %rbx
	jmp	.L21
.L27:
	xorl	%r12d, %r12d
.L20:
	popq	%rdx
	movq	%r12, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	search, .-search
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Warning: Name '%s' already exists in the current scope, returning existing name, kind: "
.LC1:
	.string	"type\n"
.LC2:
	.string	"variable\n"
.LC3:
	.string	"function\n"
.LC4:
	.string	"method\n"
.LC5:
	.string	"class\n"
.LC6:
	.string	"attribute\n"
.LC7:
	.string	"unknown\n"
.LC8:
	.string	"Error creating name: name_info and scope_info are both NULL for kind %u\n"
.LC9:
	.string	"Error creating name: unknown NameType %u\n"
	.text
	.globl	create_name
	.type	create_name, @function
create_name:
	pushq	%r15
	movq	%r8, %r15
	pushq	%r14
	movq	%rdi, %r14
	pushq	%r13
	movq	%rdx, %r13
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rbp
	movl	%esi, %ebp
	movq	%rdi, %rsi
	movq	%r8, %rdi
	pushq	%rbx
	pushq	%r9
	call	search
	testq	%rax, %rax
	je	.L30
	movq	%rax, %rbx
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	movq	%r14, %rcx
	movl	$2, %esi
	leaq	.LC0(%rip), %rdx
	call	*__fprintf_chk@GOTPCREL(%rip)
	cmpl	$5, 24(%rbx)
	movq	stderr(%rip), %rsi
	leaq	.LC7(%rip), %rdi
	ja	.L58
	movl	24(%rbx), %eax
	leaq	.L33(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L33:
	.long	.L38-.L33
	.long	.L37-.L33
	.long	.L36-.L33
	.long	.L35-.L33
	.long	.L34-.L33
	.long	.L32-.L33
	.text
.L38:
	leaq	.LC1(%rip), %rdi
	jmp	.L58
.L37:
	leaq	.LC2(%rip), %rdi
	jmp	.L58
.L36:
	leaq	.LC3(%rip), %rdi
	jmp	.L58
.L35:
	leaq	.LC4(%rip), %rdi
	jmp	.L58
.L34:
	leaq	.LC5(%rip), %rdi
	jmp	.L58
.L32:
	leaq	.LC6(%rip), %rdi
.L58:
	call	*fputs@GOTPCREL(%rip)
.L30:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, (%rax)
	movq	%rax, %rbx
	movq	id_counter.0(%rip), %rax
	movl	%ebp, 24(%rbx)
	incq	%rax
	movq	%rax, id_counter.0(%rip)
	movq	%rax, 8(%rbx)
	leal	-1(%rbp), %eax
	cmpl	$2, %eax
	jbe	.L39
	cmpl	$5, %ebp
	je	.L39
	cmpl	$4, %ebp
	jne	.L42
	testq	%r12, %r12
	je	.L42
	movq	%r12, 16(%rbx)
	jmp	.L44
.L39:
	testq	%r13, %r13
	je	.L43
	movq	%r13, 16(%rbx)
	jmp	.L44
.L42:
	testl	%ebp, %ebp
	jne	.L43
	xorl	%ecx, %ecx
	movq	%rcx, 16(%rbx)
	jmp	.L44
.L43:
	orq	%r13, %r12
	movq	stderr(%rip), %rdi
	movl	%ebp, %ecx
	leaq	.LC8(%rip), %rdx
	je	.L59
	leaq	.LC9(%rip), %rdx
.L59:
	movl	$2, %esi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L29
.L44:
	movq	8(%r15), %rdi
	movq	%rbx, %rsi
	call	list_append
.L29:
	popq	%rdx
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	create_name, .-create_name
	.globl	is_builtin_type
	.type	is_builtin_type, @function
is_builtin_type:
	pushq	%rbx
	movq	INT_KEYWORD(%rip), %rsi
	movq	%rdi, %rbx
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L61
.L63:
	movl	$1, %eax
	jmp	.L62
.L61:
	movq	FLOAT_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L63
	movq	STRING_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L63
	movq	BOOL_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L63
	movq	VOID_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	setne	%al
	movzbl	%al, %eax
.L62:
	popq	%rbx
	ret
	.size	is_builtin_type, .-is_builtin_type
	.globl	is_type
	.type	is_type, @function
is_type:
	testl	$-5, 24(%rdi)
	sete	%al
	ret
	.size	is_type, .-is_type
	.section	.rodata.str1.1
.LC10:
	.string	"Parser Error at line %zu, column %zu: %s\n"
	.text
	.globl	parser_error
	.type	parser_error, @function
parser_error:
	movq	16(%rsi), %rax
	movq	8(%rsi), %rcx
	movq	%rdi, %r9
	leaq	.LC10(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	leaq	1(%rax), %r8
	incq	%rcx
	xorl	%eax, %eax
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.size	parser_error, .-parser_error
	.section	.rodata.str1.1
.LC11:
	.string	"\342\224\202   "
.LC12:
	.string	"    "
.LC13:
	.string	"\342\224\224\342\224\200\342\224\200 "
.LC14:
	.string	"\342\224\234\342\224\200\342\224\200 "
	.text
	.globl	indention
	.type	indention, @function
indention:
	pushq	%r15
	movl	$1, %eax
	pushq	%r14
	leaq	3(%rcx), %r14
	pushq	%r13
	movl	%edx, %r13d
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	shrq	$3, %rsi
	movl	%ebx, %ecx
	addq	%r14, %rsi
	andl	$7, %ecx
	subq	$16, %rsp
	sall	%cl, %eax
	movb	(%rsi), %dl
	testb	%r13b, %r13b
	jne	.L68
	orl	%eax, %edx
.L70:
	movb	%dl, (%rsi)
	movl	$1, %ebp
	leaq	.LC12(%rip), %r15
	jmp	.L69
.L68:
	notl	%eax
	andl	%eax, %edx
	jmp	.L70
.L69:
	cmpq	%rbx, %rbp
	jnb	.L78
	movq	%rbp, %rax
	movl	%ebp, %ecx
	movq	%rdi, 8(%rsp)
	movl	$2, %esi
	shrq	$3, %rax
	andl	$7, %ecx
	leaq	.LC11(%rip), %rdx
	movsbl	(%r14,%rax), %eax
	sarl	%cl, %eax
	testb	$1, %al
	cmove	%r15, %rdx
	xorl	%eax, %eax
	incq	%rbp
	call	*__fprintf_chk@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	jmp	.L69
.L78:
	testq	%rbx, %rbx
	je	.L67
	testb	%r13b, %r13b
	leaq	.LC13(%rip), %rax
	movl	$2, %esi
	leaq	.LC14(%rip), %rdx
	cmovne	%rax, %rdx
	addq	$16, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*__fprintf_chk@GOTPCREL(%rip)
.L67:
	addq	$16, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	indention, .-indention
	.globl	create_parser
	.type	create_parser, @function
create_parser:
	movl	$35, %edi
	pushq	%rax
	call	*alloc_memory@GOTPCREL(%rip)
	movw	$0, (%rax)
	movb	$0, 2(%rax)
	popq	%rdx
	ret
	.size	create_parser, .-create_parser
	.section	.rodata.str1.1
.LC15:
	.string	"print"
.LC16:
	.string	"arr"
.LC17:
	.string	"Error: Standard library file for import not found: %s\n"
.LC18:
	.string	"/"
.LC19:
	.string	".tc"
.LC20:
	.string	"r"
.LC21:
	.string	"Error opening library file for import: %s\n"
.LC22:
	.string	"Info: Starting parsing lib file for import: %s\n"
.LC23:
	.string	"Info: Finished parsing lib file for import: %s\n"
.LC24:
	.string	"Error parsing library file for import: %s\n"
	.text
	.globl	parse_import_file
	.type	parse_import_file, @function
parse_import_file:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	movq	%rdx, %r13
	pushq	%r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	subq	$1048, %rsp
	testq	%rsi, %rsi
	movb	$0, 16(%rsp)
	leaq	16(%rsp), %rbx
	jne	.L82
	leaq	.LC15(%rip), %rsi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L83
	movabsq	$8246143026212319022, %rax
	movq	%rax, 16(%rsp)
	movabsq	$27993765565065586, %rax
	movq	%rax, 23(%rsp)
	jmp	.L84
.L83:
	leaq	.LC16(%rip), %rsi
	movq	%rbp, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L85
	movabsq	$8241920901561659182, %rax
	movq	%rax, 16(%rsp)
	movabsq	$27993765531771183, %rax
	movq	%rax, 21(%rsp)
	jmp	.L84
.L85:
	movq	%rbx, %rcx
	leaq	.LC17(%rip), %rdx
	jmp	.L95
.L82:
	movq	%rsi, %rcx
	movq	%rbx, %rdx
	movl	$1024, %esi
	movq	%rbx, %rdi
	call	*string_append@GOTPCREL(%rip)
	movq	%rbx, %rdx
	movl	$1024, %esi
	movq	%rbx, %rdi
	leaq	.LC18(%rip), %rcx
	call	*string_append@GOTPCREL(%rip)
	movq	%rbp, %rcx
	movq	%rbx, %rdx
	movl	$1024, %esi
	movq	%rbx, %rdi
	call	*string_append@GOTPCREL(%rip)
	movq	%rbx, %rdx
	movl	$1024, %esi
	movq	%rbx, %rdi
	leaq	.LC19(%rip), %rcx
	call	*string_append@GOTPCREL(%rip)
.L84:
	leaq	.LC20(%rip), %rsi
	movq	%rbx, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L87
	movq	%rbx, %rcx
	leaq	.LC21(%rip), %rdx
.L95:
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L81
.L87:
	movq	%rbx, %rdx
	leaq	.LC22(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	*__printf_chk@GOTPCREL(%rip)
	xorl	%eax, %eax
	leaq	8(%rsp), %rsi
	movq	%r12, %rdi
	movq	%rax, 8(%rsp)
	call	*read_source@GOTPCREL(%rip)
	movq	%r12, %rdi
	movq	%rax, %r14
	call	*fclose@GOTPCREL(%rip)
	call	create_parser
	movq	builtin_scope(%rip), %r12
	movq	8(%rsp), %rsi
	movq	%r14, %rdi
	movq	%rax, %r15
	call	*create_lexer@GOTPCREL(%rip)
	movq	%r12, %rsi
	movq	%r15, %rdx
	movq	%rax, %rdi
	call	*parse_code@GOTPCREL(%rip)
	movq	%rbx, %rdx
	movl	$2, %edi
	leaq	.LC23(%rip), %rsi
	movq	%rax, %r12
	xorl	%eax, %eax
	call	*__printf_chk@GOTPCREL(%rip)
	movq	%rbx, %rcx
	leaq	.LC24(%rip), %rdx
	testq	%r12, %r12
	je	.L95
	movq	8(%r12), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rbx
.L90:
	testq	%rbx, %rbx
	je	.L81
	movq	8(%rbx), %r12
	movq	%rbp, %rsi
	movq	(%r12), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L91
	movq	(%rbx), %rbx
	jmp	.L90
.L91:
	movq	8(%r13), %rdi
	movq	%r12, %rsi
	movq	%r12, %rbx
	call	list_append
.L81:
	addq	$1048, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	parse_import_file, .-parse_import_file
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
	jne	.L96
	movq	ADD_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$14, %eax
	testb	%dl, %dl
	jne	.L96
	movq	SUB_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$15, %eax
	testb	%dl, %dl
	jne	.L96
	movq	MUL_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$16, %eax
	testb	%dl, %dl
	jne	.L96
	movq	DIV_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$17, %eax
	testb	%dl, %dl
	jne	.L96
	movq	MOD_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$18, %eax
	testb	%dl, %dl
	jne	.L96
	movq	AND_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$11, %eax
	testb	%dl, %dl
	jne	.L96
	movq	OR_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$12, %eax
	testb	%dl, %dl
	jne	.L96
	movq	EQ_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$5, %eax
	testb	%dl, %dl
	jne	.L96
	movq	NE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$6, %eax
	testb	%dl, %dl
	jne	.L96
	movq	LT_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$7, %eax
	testb	%dl, %dl
	jne	.L96
	movq	GT_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$8, %eax
	testb	%dl, %dl
	jne	.L96
	movq	LE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$9, %eax
	testb	%dl, %dl
	jne	.L96
	movq	GE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$10, %eax
	testb	%dl, %dl
	jne	.L96
	movq	ADD_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	xorl	%eax, %eax
	testb	%dl, %dl
	jne	.L96
	movq	SUB_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L96
	movq	MUL_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$2, %eax
	testb	%dl, %dl
	jne	.L96
	movq	DIV_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$3, %eax
	testb	%dl, %dl
	jne	.L96
	movq	MOD_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	cmpb	$1, %al
	sbbl	%eax, %eax
	andl	$15, %eax
	addl	$4, %eax
.L96:
	popq	%rbx
	ret
	.size	string_to_operator, .-string_to_operator
	.globl	operator_precedence
	.type	operator_precedence, @function
operator_precedence:
	xorl	%eax, %eax
	cmpl	$18, %edi
	ja	.L118
	movl	%edi, %edi
	leaq	CSWTCH.66(%rip), %rax
	movsbl	(%rax,%rdi), %eax
.L118:
	ret
	.size	operator_precedence, .-operator_precedence
	.globl	operator_to_string
	.type	operator_to_string, @function
operator_to_string:
	xorl	%eax, %eax
	cmpl	$18, %edi
	ja	.L121
	leaq	.L124(%rip), %rdx
	movl	%edi, %edi
	movslq	(%rdx,%rdi,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L124:
	.long	.L142-.L124
	.long	.L141-.L124
	.long	.L140-.L124
	.long	.L139-.L124
	.long	.L138-.L124
	.long	.L137-.L124
	.long	.L136-.L124
	.long	.L135-.L124
	.long	.L134-.L124
	.long	.L133-.L124
	.long	.L132-.L124
	.long	.L131-.L124
	.long	.L130-.L124
	.long	.L129-.L124
	.long	.L128-.L124
	.long	.L127-.L124
	.long	.L126-.L124
	.long	.L125-.L124
	.long	.L123-.L124
	.text
.L129:
	movq	ASSIGN_SYMBOL(%rip), %rax
	ret
.L128:
	movq	ADD_ASSIGN_SYMBOL(%rip), %rax
	ret
.L127:
	movq	SUB_ASSIGN_SYMBOL(%rip), %rax
	ret
.L126:
	movq	MUL_ASSIGN_SYMBOL(%rip), %rax
	ret
.L125:
	movq	DIV_ASSIGN_SYMBOL(%rip), %rax
	ret
.L123:
	movq	MOD_ASSIGN_SYMBOL(%rip), %rax
	ret
.L131:
	movq	AND_SYMBOL(%rip), %rax
	ret
.L130:
	movq	OR_SYMBOL(%rip), %rax
	ret
.L137:
	movq	EQ_SYMBOL(%rip), %rax
	ret
.L136:
	movq	NE_SYMBOL(%rip), %rax
	ret
.L135:
	movq	LT_SYMBOL(%rip), %rax
	ret
.L134:
	movq	GT_SYMBOL(%rip), %rax
	ret
.L133:
	movq	LE_SYMBOL(%rip), %rax
	ret
.L132:
	movq	GE_SYMBOL(%rip), %rax
	ret
.L142:
	movq	ADD_SYMBOL(%rip), %rax
	ret
.L141:
	movq	SUB_SYMBOL(%rip), %rax
	ret
.L140:
	movq	MUL_SYMBOL(%rip), %rax
	ret
.L139:
	movq	DIV_SYMBOL(%rip), %rax
	ret
.L138:
	movq	MOD_SYMBOL(%rip), %rax
.L121:
	ret
	.size	operator_to_string, .-operator_to_string
	.section	.rodata
	.align 16
	.type	CSWTCH.66, @object
	.size	CSWTCH.66, 19
CSWTCH.66:
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
