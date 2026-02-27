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
	.globl	create_node
	.type	create_node, @function
create_node:
	pushq	%rbx
	movq	%rdi, %rbx
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	$0, (%rax)
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
	je	.L9
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
.L7:
	movq	%rax, 8(%rbx)
	popq	%rbx
	ret
.L9:
	movq	%rax, (%rbx)
	jmp	.L7
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
	je	.L15
.L14:
	movq	8(%rax), %rax
.L12:
	ret
.L15:
	movq	$0, 8(%rdi)
	jmp	.L14
	.size	list_pop, .-list_pop
	.globl	create_scope
	.type	create_scope, @function
create_scope:
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
	.size	create_scope, .-create_scope
	.globl	search
	.type	search, @function
search:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %r13
	movq	%rsi, %r12
	testq	%rdi, %rdi
	je	.L23
.L22:
	movq	8(%r13), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	je	.L20
.L21:
	movq	8(%rbx), %rbp
	movq	0(%rbp), %rdi
	movq	%r12, %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L18
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L21
.L20:
	movq	0(%r13), %r13
	testq	%r13, %r13
	jne	.L22
	movq	%r13, %rbp
	jmp	.L18
.L23:
	movq	%rdi, %rbp
.L18:
	movq	%rbp, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	search, .-search
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Warning: Name '%s' already exists in the current scope, returning existing name, kind: "
	.section	.rodata.str1.1,"aMS",@progbits,1
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
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"Error creating name: name_info and scope_info are both NULL for kind %u\n"
	.align 8
.LC9:
	.string	"Error creating name: unknown NameType %u\n"
	.text
	.globl	create_name
	.type	create_name, @function
create_name:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %r12
	movl	%esi, %ebp
	movq	%rdx, %r14
	movq	%rcx, %r15
	movq	%r8, %r13
	movq	%rdi, %rsi
	movq	%r8, %rdi
	call	search
	testq	%rax, %rax
	je	.L28
	movq	%rax, %rbx
	movq	%r12, %rcx
	leaq	.LC0(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	cmpl	$5, 24(%rbx)
	ja	.L29
	movl	24(%rbx), %eax
	leaq	.L31(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L31:
	.long	.L36-.L31
	.long	.L35-.L31
	.long	.L34-.L31
	.long	.L33-.L31
	.long	.L32-.L31
	.long	.L30-.L31
	.text
.L36:
	movq	stderr(%rip), %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC1(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
.L28:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%r12, (%rax)
	movq	id_counter.0(%rip), %rax
	addq	$1, %rax
	movq	%rax, id_counter.0(%rip)
	movq	%rax, 8(%rbx)
	movl	%ebp, 24(%rbx)
	leal	-1(%rbp), %eax
	cmpl	$2, %eax
	jbe	.L37
	cmpl	$5, %ebp
	je	.L37
	cmpl	$4, %ebp
	jne	.L40
	testq	%r15, %r15
	je	.L40
	movq	%r15, 16(%rbx)
	jmp	.L42
.L35:
	movq	stderr(%rip), %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L28
.L34:
	movq	stderr(%rip), %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L28
.L33:
	movq	stderr(%rip), %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L28
.L32:
	movq	stderr(%rip), %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L28
.L30:
	movq	stderr(%rip), %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L28
.L29:
	movq	stderr(%rip), %rcx
	movl	$8, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L28
.L37:
	testq	%r14, %r14
	je	.L41
	movq	%r14, 16(%rbx)
.L42:
	movq	8(%r13), %rdi
	movq	%rbx, %rsi
	call	list_append
.L27:
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L40:
	testl	%ebp, %ebp
	jne	.L41
	movq	$0, 16(%rbx)
	jmp	.L42
.L41:
	orq	%r14, %r15
	jne	.L43
	movl	%ebp, %ecx
	leaq	.LC8(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %ebx
	jmp	.L27
.L43:
	movl	%ebp, %ecx
	leaq	.LC9(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$0, %ebx
	jmp	.L27
	.size	create_name, .-create_name
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
	je	.L53
.L47:
	popq	%rbx
	ret
.L53:
	movq	FLOAT_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L47
	movq	STRING_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L47
	movq	BOOL_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L47
	movq	VOID_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	setne	%al
	movzbl	%al, %eax
	jmp	.L47
	.size	is_builtin_type, .-is_builtin_type
	.globl	is_type
	.type	is_type, @function
is_type:
	testl	$-5, 24(%rdi)
	sete	%al
	ret
	.size	is_type, .-is_type
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"Parser Error at line %zu, column %zu: %s\n"
	.text
	.globl	parser_error
	.type	parser_error, @function
parser_error:
	subq	$8, %rsp
	movq	%rdi, %r9
	movq	16(%rsi), %rax
	movq	8(%rsi), %rcx
	addq	$1, %rcx
	leaq	1(%rax), %r8
	leaq	.LC10(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	addq	$8, %rsp
	ret
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
	leaq	3(%rcx), %r12
	movq	%rsi, %rax
	shrq	$3, %rax
	addq	%r12, %rax
	movzbl	(%rax), %edx
	testb	%dil, %dil
	jne	.L58
	movl	%esi, %ecx
	andl	$7, %ecx
	movl	$1, %esi
	sall	%cl, %esi
	orl	%esi, %edx
.L61:
	movb	%dl, (%rax)
	movl	$1, %ebx
	leaq	.LC12(%rip), %r15
	leaq	.LC11(%rip), %r14
	cmpq	$1, %rbp
	jbe	.L73
.L59:
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
	jne	.L59
.L63:
	cmpb	$0, 12(%rsp)
	leaq	.LC14(%rip), %rdx
	leaq	.LC13(%rip), %rax
	cmovne	%rax, %rdx
	movl	$2, %esi
	movq	%r13, %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L57
.L58:
	movl	%esi, %ecx
	andl	$7, %ecx
	movl	$1, %esi
	sall	%cl, %esi
	notl	%esi
	andl	%esi, %edx
	jmp	.L61
.L73:
	testq	%rbp, %rbp
	jne	.L63
.L57:
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
	subq	$8, %rsp
	movl	$35, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movb	$0, (%rax)
	movb	$0, 1(%rax)
	movb	$0, 2(%rax)
	addq	$8, %rsp
	ret
	.size	create_parser, .-create_parser
	.section	.rodata.str1.1
.LC15:
	.string	"print"
.LC16:
	.string	"arr"
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"Error: Standard library file for import not found: %s\n"
	.section	.rodata.str1.1
.LC18:
	.string	"/"
.LC19:
	.string	".tc"
.LC20:
	.string	"r"
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"Error opening library file for import: %s\n"
	.align 8
.LC22:
	.string	"Info: Starting parsing lib file for import: %s\n"
	.align 8
.LC23:
	.string	"Info: Finished parsing lib file for import: %s\n"
	.align 8
.LC24:
	.string	"Error parsing library file for import: %s\n"
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
	subq	$1048, %rsp
	movq	%rdi, %r12
	movq	%rsi, %rbx
	movq	%rdx, %r13
	movb	$0, 16(%rsp)
	testq	%rsi, %rsi
	je	.L88
	leaq	16(%rsp), %rbp
	movq	%rsi, %rcx
	movq	%rbp, %rdx
	movl	$1024, %esi
	movq	%rbp, %rdi
	call	*string_append@GOTPCREL(%rip)
	leaq	.LC18(%rip), %rcx
	movq	%rbp, %rdx
	movl	$1024, %esi
	movq	%rbp, %rdi
	call	*string_append@GOTPCREL(%rip)
	movq	%r12, %rcx
	movq	%rbp, %rdx
	movl	$1024, %esi
	movq	%rbp, %rdi
	call	*string_append@GOTPCREL(%rip)
	leaq	.LC19(%rip), %rcx
	movq	%rbp, %rdx
	movl	$1024, %esi
	movq	%rbp, %rdi
	call	*string_append@GOTPCREL(%rip)
.L79:
	leaq	16(%rsp), %rdi
	leaq	.LC20(%rip), %rsi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L89
	leaq	16(%rsp), %r14
	movq	%r14, %rdx
	leaq	.LC22(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	*__printf_chk@GOTPCREL(%rip)
	movq	$0, 8(%rsp)
	leaq	8(%rsp), %rsi
	movq	%rbx, %rdi
	call	*read_source@GOTPCREL(%rip)
	movq	%rax, %rbp
	movq	%rbx, %rdi
	call	*fclose@GOTPCREL(%rip)
	call	create_parser
	movq	%rax, %rbx
	movq	builtin_scope(%rip), %r15
	movq	8(%rsp), %rsi
	movq	%rbp, %rdi
	call	*create_lexer@GOTPCREL(%rip)
	movq	%rax, %rdi
	movq	%rbx, %rdx
	movq	%r15, %rsi
	call	*parse_code@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%r14, %rdx
	leaq	.LC23(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	*__printf_chk@GOTPCREL(%rip)
	testq	%rbx, %rbx
	je	.L90
	movq	8(%rbx), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	je	.L76
.L85:
	movq	8(%rbx), %rbp
	movq	0(%rbp), %rdi
	movq	%r12, %rsi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L84
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L85
	jmp	.L76
.L88:
	leaq	.LC15(%rip), %rsi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L91
	leaq	.LC16(%rip), %rsi
	movq	%r12, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L80
	movabsq	$8241920901561659182, %rax
	movq	%rax, 16(%rsp)
	movabsq	$27993765531771183, %rax
	movq	%rax, 21(%rsp)
	jmp	.L79
.L91:
	movabsq	$8246143026212319022, %rax
	movq	%rax, 16(%rsp)
	movabsq	$27993765565065586, %rax
	movq	%rax, 23(%rsp)
	jmp	.L79
.L80:
	leaq	16(%rsp), %rcx
	leaq	.LC17(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L76
.L89:
	leaq	16(%rsp), %rcx
	leaq	.LC21(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L76
.L90:
	movq	%r14, %rcx
	leaq	.LC24(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L76
.L84:
	movq	8(%r13), %rdi
	movq	%rbp, %rsi
	call	list_append
	movq	%rbp, %rbx
.L76:
	movq	%rbx, %rax
	addq	$1048, %rsp
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
	movq	%rdi, %rbx
	movq	ASSIGN_SYMBOL(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$13, %eax
	testb	%dl, %dl
	jne	.L92
	movq	ADD_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$14, %eax
	testb	%dl, %dl
	jne	.L92
	movq	SUB_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$15, %eax
	testb	%dl, %dl
	jne	.L92
	movq	MUL_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$16, %eax
	testb	%dl, %dl
	jne	.L92
	movq	DIV_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$17, %eax
	testb	%dl, %dl
	jne	.L92
	movq	MOD_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$18, %eax
	testb	%dl, %dl
	jne	.L92
	movq	AND_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$11, %eax
	testb	%dl, %dl
	jne	.L92
	movq	OR_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$12, %eax
	testb	%dl, %dl
	jne	.L92
	movq	EQ_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$5, %eax
	testb	%dl, %dl
	jne	.L92
	movq	NE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$6, %eax
	testb	%dl, %dl
	jne	.L92
	movq	LT_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$7, %eax
	testb	%dl, %dl
	jne	.L92
	movq	GT_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$8, %eax
	testb	%dl, %dl
	jne	.L92
	movq	LE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$9, %eax
	testb	%dl, %dl
	jne	.L92
	movq	GE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$10, %eax
	testb	%dl, %dl
	jne	.L92
	movq	ADD_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$0, %eax
	testb	%dl, %dl
	je	.L114
.L92:
	popq	%rbx
	ret
.L114:
	movq	SUB_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L92
	movq	MUL_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L110
	movq	DIV_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L111
	movq	MOD_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	cmpb	$1, %al
	sbbl	%eax, %eax
	andl	$15, %eax
	addl	$4, %eax
	jmp	.L92
.L110:
	movl	$2, %eax
	jmp	.L92
.L111:
	movl	$3, %eax
	jmp	.L92
	.size	string_to_operator, .-string_to_operator
	.globl	operator_precedence
	.type	operator_precedence, @function
operator_precedence:
	cmpl	$18, %edi
	ja	.L116
	movl	%edi, %edi
	leaq	.L118(%rip), %rdx
	movslq	(%rdx,%rdi,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L118:
	.long	.L122-.L118
	.long	.L122-.L118
	.long	.L121-.L118
	.long	.L121-.L118
	.long	.L121-.L118
	.long	.L120-.L118
	.long	.L120-.L118
	.long	.L120-.L118
	.long	.L120-.L118
	.long	.L120-.L118
	.long	.L120-.L118
	.long	.L123-.L118
	.long	.L123-.L118
	.long	.L117-.L118
	.long	.L117-.L118
	.long	.L117-.L118
	.long	.L117-.L118
	.long	.L117-.L118
	.long	.L117-.L118
	.text
.L117:
	movl	$1, %eax
	ret
.L120:
	movl	$3, %eax
	ret
.L122:
	movl	$4, %eax
	ret
.L121:
	movl	$5, %eax
	ret
.L116:
	movl	$0, %eax
	ret
.L123:
	movl	$2, %eax
	ret
	.size	operator_precedence, .-operator_precedence
	.globl	operator_to_string
	.type	operator_to_string, @function
operator_to_string:
	cmpl	$18, %edi
	ja	.L146
	movl	%edi, %edi
	leaq	.L127(%rip), %rdx
	movslq	(%rdx,%rdi,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L127:
	.long	.L145-.L127
	.long	.L144-.L127
	.long	.L143-.L127
	.long	.L142-.L127
	.long	.L141-.L127
	.long	.L140-.L127
	.long	.L139-.L127
	.long	.L138-.L127
	.long	.L137-.L127
	.long	.L136-.L127
	.long	.L135-.L127
	.long	.L134-.L127
	.long	.L133-.L127
	.long	.L132-.L127
	.long	.L131-.L127
	.long	.L130-.L127
	.long	.L129-.L127
	.long	.L128-.L127
	.long	.L126-.L127
	.text
.L132:
	movq	ASSIGN_SYMBOL(%rip), %rax
	ret
.L131:
	movq	ADD_ASSIGN_SYMBOL(%rip), %rax
	ret
.L130:
	movq	SUB_ASSIGN_SYMBOL(%rip), %rax
	ret
.L129:
	movq	MUL_ASSIGN_SYMBOL(%rip), %rax
	ret
.L128:
	movq	DIV_ASSIGN_SYMBOL(%rip), %rax
	ret
.L126:
	movq	MOD_ASSIGN_SYMBOL(%rip), %rax
	ret
.L134:
	movq	AND_SYMBOL(%rip), %rax
	ret
.L133:
	movq	OR_SYMBOL(%rip), %rax
	ret
.L140:
	movq	EQ_SYMBOL(%rip), %rax
	ret
.L139:
	movq	NE_SYMBOL(%rip), %rax
	ret
.L138:
	movq	LT_SYMBOL(%rip), %rax
	ret
.L137:
	movq	GT_SYMBOL(%rip), %rax
	ret
.L136:
	movq	LE_SYMBOL(%rip), %rax
	ret
.L135:
	movq	GE_SYMBOL(%rip), %rax
	ret
.L145:
	movq	ADD_SYMBOL(%rip), %rax
	ret
.L144:
	movq	SUB_SYMBOL(%rip), %rax
	ret
.L143:
	movq	MUL_SYMBOL(%rip), %rax
	ret
.L142:
	movq	DIV_SYMBOL(%rip), %rax
	ret
.L141:
	movq	MOD_SYMBOL(%rip), %rax
	ret
.L146:
	movl	$0, %eax
	ret
	.size	operator_to_string, .-operator_to_string
	.local	id_counter.0
	.comm	id_counter.0,8,8
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
