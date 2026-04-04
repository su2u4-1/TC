	.file	"parser.c"
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Failed to parse import statement\0"
	.align 8
.LC1:
	.ascii "Failed to parse function declaration\0"
	.align 8
.LC2:
	.ascii "Failed to parse class declaration\0"
	.align 8
.LC3:
	.ascii "Unexpected token in code member\0"
	.text
	.globl	parse_code
	.def	parse_code;	.scl	2;	.type	32;	.endef
parse_code:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L2
	movl	$0, %ecx
	call	create_symbol_table
	movq	.refptr.builtin_scope(%rip), %rdx
	movq	%rax, (%rdx)
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %rdx
	movq	.refptr.VOID_KEYWORD(%rip), %rax
	movq	(%rax), %rax
	movq	%rdx, %r9
	movl	$0, %r8d
	movl	$6, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	.refptr.name_void(%rip), %rdx
	movq	%rax, (%rdx)
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %rdx
	movq	.refptr.INT_KEYWORD(%rip), %rax
	movq	(%rax), %rax
	movq	%rdx, %r9
	movl	$0, %r8d
	movl	$6, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	.refptr.name_int(%rip), %rdx
	movq	%rax, (%rdx)
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %rdx
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	movq	(%rax), %rax
	movq	%rdx, %r9
	movl	$0, %r8d
	movl	$6, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	.refptr.name_float(%rip), %rdx
	movq	%rax, (%rdx)
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %rdx
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	movq	(%rax), %rax
	movq	%rdx, %r9
	movl	$0, %r8d
	movl	$6, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	.refptr.name_string(%rip), %rdx
	movq	%rax, (%rdx)
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %rdx
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	movq	(%rax), %rax
	movq	%rdx, %r9
	movl	$0, %r8d
	movl	$6, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	.refptr.name_bool(%rip), %rdx
	movq	%rax, (%rdx)
.L2:
	cmpq	$0, 24(%rbp)
	jne	.L3
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 24(%rbp)
.L3:
	movq	$0, -8(%rbp)
	call	create_list
	movq	%rax, -16(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	create_symbol_table
	movq	%rax, -24(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	jmp	.L4
.L13:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L5
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L5
	movq	32(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_import
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L6
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L6:
	movq	-32(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_code_member
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L7
.L5:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L8
	movq	.refptr.FUNC_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L8
	movq	32(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_function
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L9
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L9:
	movq	-40(%rbp), %rax
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$1, %ecx
	call	create_code_member
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L7
.L8:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L10
	movq	.refptr.CLASS_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L10
	movq	32(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_class
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L11
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L11:
	movq	-48(%rbp), %rax
	movq	%rax, %r9
	movl	$0, %r8d
	movl	$0, %edx
	movl	$2, %ecx
	call	create_code_member
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L7
.L10:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC3(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L7:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
.L4:
	cmpq	$0, -8(%rbp)
	je	.L12
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	jne	.L13
.L12:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	create_code
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "Expected identifier after 'import'\0"
	.align 8
.LC5:
	.ascii "Expected string literal after 'from'\0"
	.align 8
.LC6:
	.ascii "Expected ';' at end of import statement\0"
	.align 8
.LC7:
	.ascii "Failed to import module '%s' from source '%s'\12\0"
	.text
	.def	parse_import;	.scl	3;	.type	32;	.endef
parse_import:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -8(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L16
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L17
.L16:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	$0, -16(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L18
	movq	.refptr.FROM_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L18
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$4, %eax
	je	.L19
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC5(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L17
.L19:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
.L18:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L20
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L21
.L20:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L17
.L21:
	movq	32(%rbp), %rax
	movq	(%rax), %r8
	movq	24(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%r8, %r9
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_import_file
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L22
	call	__getreent
	movq	24(%rax), %rax
	movq	-16(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	.refptr.name_void(%rip), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rcx
	movq	-32(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$3, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, -24(%rbp)
.L22:
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	create_import
.L17:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC8:
	.ascii "Expected function return type after 'func'\0"
.LC9:
	.ascii "Unknown function return type\0"
	.align 8
.LC10:
	.ascii "Expected function name after return type\0"
	.align 8
.LC11:
	.ascii "Expected '(' after function name\0"
	.align 8
.LC12:
	.ascii "Failed to parse function parameter\0"
	.align 8
.LC13:
	.ascii "Function parameters cannot have default values\0"
	.align 8
.LC14:
	.ascii "Expected ',' or ')' after function parameter\0"
	.align 8
.LC15:
	.ascii "Expected '{' to start function body\0"
	.align 8
.LC16:
	.ascii "Failed to parse function body statement\0"
	.align 8
.LC17:
	.ascii "Unreachable code after return statement\0"
	.align 8
.LC18:
	.ascii "Function missing return statement\0"
	.text
	.def	parse_function;	.scl	3;	.type	32;	.endef
parse_function:
	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-128, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -8(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	create_symbol_table
	movq	%rax, -24(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L24
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L25
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	is_builtin_type
	testb	%al, %al
	jne	.L24
.L25:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L26
.L24:
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	search_name
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L27
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC9(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L26
.L27:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L28
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC10(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L26
.L28:
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-40(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$1, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, -48(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L29
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L30
.L29:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC11(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L26
.L30:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	call	create_list
	movq	%rax, -56(%rbp)
	jmp	.L31
.L38:
	movq	32(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_variable
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	jne	.L32
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC12(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	jmp	.L33
.L32:
	movq	-80(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L34
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	jmp	.L33
.L34:
	movq	-80(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
.L33:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L35
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L35
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	jmp	.L31
.L35:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L37
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L31
.L37:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC14(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L26
.L31:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L38
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L38
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L39
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L40
.L39:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L26
.L40:
	call	create_list
	movq	%rax, -64(%rbp)
	movq	32(%rbp), %rax
	movb	$1, 8(%rax)
	movb	$0, -9(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	jmp	.L41
.L45:
	movq	32(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_statement
	movq	%rax, -72(%rbp)
	cmpq	$0, -72(%rbp)
	jne	.L42
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC16(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	jmp	.L43
.L42:
	cmpb	$0, -9(%rbp)
	je	.L43
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC17(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L43:
	cmpq	$0, -72(%rbp)
	je	.L44
	movq	-72(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$5, %eax
	jne	.L44
	movb	$1, -9(%rbp)
.L44:
	movq	-72(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
.L41:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L45
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L45
	movq	32(%rbp), %rax
	movb	$0, 8(%rax)
	cmpb	$0, -9(%rbp)
	jne	.L46
	movq	.refptr.name_void(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, -32(%rbp)
	je	.L46
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC18(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L46:
	cmpb	$0, -9(%rbp)
	jne	.L47
	movq	.refptr.name_void(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, -32(%rbp)
	jne	.L47
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$5, %ecx
	call	create_statement
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
.L47:
	movq	-56(%rbp), %r9
	movq	-32(%rbp), %r8
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movq	-64(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movq	%rax, %rcx
	call	create_function_use_ptr
.L26:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC19:
	.ascii "Expected method return type after 'method'\0"
	.align 8
.LC20:
	.ascii "Unknown return type for method\0"
	.align 8
.LC21:
	.ascii "Expected method name after return type\0"
	.align 8
.LC22:
	.ascii "Expected '(' after method name\0"
	.align 8
.LC23:
	.ascii "Expected 'self' as first parameter of method\0"
	.align 8
.LC24:
	.ascii "Expected ',' or ')' after method parameter\0"
	.align 8
.LC25:
	.ascii "Failed to parse method parameter\0"
	.align 8
.LC26:
	.ascii "Method parameters cannot have default values\0"
	.align 8
.LC27:
	.ascii "Expected '{' to start method body\0"
	.align 8
.LC28:
	.ascii "Failed to parse method body statement\0"
	.align 8
.LC29:
	.ascii "Method missing return statement\0"
	.text
	.def	parse_method;	.scl	3;	.type	32;	.endef
parse_method:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$144, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	$0, -8(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	create_symbol_table
	movq	%rax, -24(%rbp)
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$3, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, -32(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L49
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L50
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	is_builtin_type
	testb	%al, %al
	jne	.L49
.L50:
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC19(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L51
.L49:
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	search_name
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L52
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC20(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L51
.L52:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L53
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC21(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L51
.L53:
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	make_method_name
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$2, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, -56(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L54
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L55
.L54:
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC22(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L51
.L55:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L56
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L57
.L56:
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC23(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L57:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	call	create_list
	movq	%rax, -64(%rbp)
	movq	-32(%rbp), %rdx
	movq	32(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rcx
	call	create_variable
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L58
.L66:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L59
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L59
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	nop
	movq	40(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_variable
	movq	%rax, -72(%rbp)
	cmpq	$0, -72(%rbp)
	jne	.L63
	jmp	.L76
.L59:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L61
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L62
.L61:
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC24(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L51
.L76:
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC25(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	jmp	.L64
.L63:
	movq	-72(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L65
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC26(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	jmp	.L64
.L65:
	movq	-72(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
.L64:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
.L58:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L66
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L66
.L62:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L67
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L68
.L67:
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC27(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L51
.L68:
	call	create_list
	movq	%rax, -80(%rbp)
	movq	40(%rbp), %rax
	movb	$1, 8(%rax)
	movq	40(%rbp), %rax
	movb	$1, 9(%rax)
	movb	$0, -9(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	jmp	.L69
.L73:
	movq	40(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_statement
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L70
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC28(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	jmp	.L71
.L70:
	cmpb	$0, -9(%rbp)
	je	.L71
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC17(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L71:
	cmpq	$0, -88(%rbp)
	je	.L72
	movq	-88(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$5, %eax
	jne	.L72
	movb	$1, -9(%rbp)
.L72:
	movq	-88(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
.L69:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L73
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L73
	movq	40(%rbp), %rax
	movb	$0, 8(%rax)
	movq	40(%rbp), %rax
	movb	$0, 9(%rax)
	cmpb	$0, -9(%rbp)
	jne	.L74
	movq	.refptr.name_void(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, -40(%rbp)
	je	.L74
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC29(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L74:
	cmpb	$0, -9(%rbp)
	jne	.L75
	movq	.refptr.name_void(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, -40(%rbp)
	jne	.L75
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$5, %ecx
	call	create_statement
	movq	%rax, %rdx
	movq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
.L75:
	movq	-64(%rbp), %r9
	movq	-40(%rbp), %r8
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movq	-80(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movq	%rax, %rcx
	call	create_method_use_ptr
.L51:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC30:
	.ascii "Expected class name after 'class'\0"
	.align 8
.LC31:
	.ascii "Expected '{' to start class body\0"
.LC32:
	.ascii "Failed to parse class method\0"
	.align 8
.LC33:
	.ascii "Failed to parse class variable\0"
	.align 8
.LC34:
	.ascii "[warning] Unsupported type for class variable '%s': %s\12\0"
	.align 8
.LC35:
	.ascii "Expected ';' after class variable declaration\0"
	.align 8
.LC36:
	.ascii "Unexpected token in class member\0"
	.align 8
.LC37:
	.ascii "Constructor name conflicts with existing member\0"
.LC38:
	.ascii "0\0"
	.text
	.def	parse_class;	.scl	3;	.type	32;	.endef
parse_class:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	pushq	%rbx
	subq	$288, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -24(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	create_symbol_table
	movq	%rax, -48(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L78
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC30(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L79
.L78:
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-56(%rbp), %rdx
	movq	%rdx, %r9
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, -64(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L80
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L81
.L80:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC31(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L79
.L81:
	call	create_list
	movq	%rax, -72(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -24(%rbp)
	movq	$0, -32(%rbp)
	jmp	.L82
.L96:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L83
	movq	.refptr.METHOD_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L83
	movq	32(%rbp), %r8
	movq	-64(%rbp), %rcx
	movq	-48(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%r8, %r9
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_method
	movq	%rax, -232(%rbp)
	cmpq	$0, -232(%rbp)
	jne	.L84
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC32(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L84:
	movq	-232(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_class_member
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L85
.L83:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L86
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L86
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -24(%rbp)
	movq	32(%rbp), %rax
	movb	$1, 10(%rax)
	movq	32(%rbp), %rcx
	movq	-48(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_variable
	movq	%rax, -240(%rbp)
	movq	32(%rbp), %rax
	movb	$0, 10(%rax)
	cmpq	$0, -240(%rbp)
	jne	.L87
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC33(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L87:
	movq	-240(%rbp), %rax
	movq	%rax, %r8
	movl	$0, %edx
	movl	$1, %ecx
	call	create_class_member
	movq	%rax, -248(%rbp)
	movq	-248(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	-248(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$1, %eax
	jne	.L88
	movq	-248(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -256(%rbp)
	movq	.refptr.name_int(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, -256(%rbp)
	je	.L89
	movq	.refptr.name_float(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, -256(%rbp)
	je	.L89
	movq	.refptr.name_string(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, -256(%rbp)
	jne	.L90
.L89:
	addq	$8, -32(%rbp)
	jmp	.L88
.L90:
	movq	.refptr.name_bool(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, -256(%rbp)
	je	.L91
	movq	.refptr.name_void(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, -256(%rbp)
	jne	.L92
.L91:
	addq	$1, -32(%rbp)
	jmp	.L88
.L92:
	movq	-256(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L93
	addq	$8, -32(%rbp)
	jmp	.L88
.L93:
	movq	-256(%rbp), %rax
	movq	8(%rax), %rsi
	movq	-248(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rbx
	call	__getreent
	movq	24(%rax), %rax
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC34(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L88:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L94
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L110
.L94:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC35(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	jmp	.L110
.L86:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC36(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	jmp	.L85
.L110:
	nop
.L85:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -24(%rbp)
.L82:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L96
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L96
	movq	.refptr.DEFAULT_INIT_NAME(%rip), %rax
	movq	(%rax), %rdx
	movq	-64(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	make_method_name
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	search_name_use_strcmp
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L97
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, -88(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	create_symbol_table
	movq	-88(%rbp), %rdx
	movq	%rax, 32(%rdx)
	movq	-88(%rbp), %rcx
	movq	-64(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$2, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, -40(%rbp)
	call	create_list
	movq	%rax, -96(%rbp)
	movq	-88(%rbp), %rax
	movq	32(%rax), %rcx
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$3, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, -104(%rbp)
	movq	-104(%rbp), %rdx
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rcx
	call	create_variable
	movq	%rax, %rdx
	movq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	call	create_list
	movq	%rax, -112(%rbp)
	movq	-104(%rbp), %rax
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
	movq	-112(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	-88(%rbp), %rax
	movq	32(%rax), %rcx
	movq	-96(%rbp), %r9
	movq	-64(%rbp), %r8
	movq	-40(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rcx, 40(%rsp)
	movq	-112(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movq	%rax, %rcx
	call	create_method_use_ptr
	movq	-88(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_class_member
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
.L97:
	movq	-40(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	je	.L98
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC37(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L98:
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax
	movq	(%rax), %rdx
	movq	-64(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	make_method_name
	movq	%rax, -120(%rbp)
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, -128(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	create_symbol_table
	movq	-128(%rbp), %rdx
	movq	%rax, 32(%rdx)
	movq	-128(%rbp), %rcx
	movq	-64(%rbp), %rdx
	movq	-120(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$2, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, -136(%rbp)
	call	create_list
	movq	%rax, -144(%rbp)
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$3, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, -152(%rbp)
	movq	-152(%rbp), %rdx
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rcx
	call	create_variable
	movq	%rax, %rdx
	movq	-144(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -160(%rbp)
	jmp	.L99
.L102:
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-168(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L111
	movq	-168(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-168(%rbp), %rax
	movq	(%rax), %rax
	movl	$0, %r8d
	movq	%rax, %rcx
	call	create_variable
	movq	%rax, %rdx
	movq	-144(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L99
.L111:
	nop
.L99:
	movq	-160(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -168(%rbp)
	cmpq	$0, -168(%rbp)
	jne	.L102
	call	create_list
	movq	%rax, -176(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -184(%rbp)
	jmp	.L104
.L107:
	movq	-192(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$1, %eax
	jne	.L104
	movq	-192(%rbp), %rax
	movq	(%rax), %rax
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
	movq	%rax, -216(%rbp)
	movq	-192(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L105
	movq	-192(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	jmp	.L106
.L105:
	movl	$2, %edx
	leaq	.LC38(%rip), %rax
	movq	%rax, %rcx
	call	create_string
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
.L106:
	movq	%rax, -224(%rbp)
	movq	-224(%rbp), %rdx
	movq	-216(%rbp), %rax
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
	movq	-176(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
.L104:
	movq	-184(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -192(%rbp)
	cmpq	$0, -192(%rbp)
	jne	.L107
	call	create_list
	movq	%rax, -200(%rbp)
	movq	-144(%rbp), %rax
	movq	%rax, %rcx
	call	list_copy
	movq	%rax, -208(%rbp)
	jmp	.L108
.L109:
	movq	-168(%rbp), %rax
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
	movq	-200(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
.L108:
	movq	-208(%rbp), %rax
	movq	%rax, %rcx
	call	list_pop
	movq	%rax, -168(%rbp)
	cmpq	$0, -168(%rbp)
	jne	.L109
	movq	-40(%rbp), %rax
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	create_variable_access
	movq	%rax, %rdx
	movq	-200(%rbp), %rax
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
	movq	-176(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	-144(%rbp), %r9
	movq	-64(%rbp), %r8
	movq	-136(%rbp), %rdx
	movq	-128(%rbp), %rax
	movq	%rcx, 40(%rsp)
	movq	-176(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movq	%rax, %rcx
	call	create_method_use_ptr
	movq	-128(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_class_member
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	-48(%rbp), %r9
	movq	-72(%rbp), %r8
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movq	%rax, %rcx
	call	create_class_use_ptr
.L79:
	addq	$288, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC39:
	.ascii "Expected variable type\0"
	.align 8
.LC40:
	.ascii "Expected a type for variable declaration\0"
.LC41:
	.ascii "Unknown variable type\0"
.LC42:
	.ascii "Expected variable name\0"
	.align 8
.LC43:
	.ascii "Failed to parse variable initializer\0"
	.text
	.def	parse_variable;	.scl	3;	.type	32;	.endef
parse_variable:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -16(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	peek_current_token
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L113
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L114
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	is_builtin_type
	testb	%al, %al
	jne	.L113
.L114:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC39(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L115
.L113:
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	search_name
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L116
	movq	-24(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$6, %eax
	je	.L117
	movq	-24(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	je	.L117
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC40(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	jmp	.L117
.L116:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC41(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L117:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L118
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC42(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L118:
	movq	32(%rbp), %rax
	movzbl	10(%rax), %eax
	testb	%al, %al
	je	.L119
	movq	32(%rbp), %rax
	movzbl	9(%rax), %eax
	testb	%al, %al
	jne	.L119
	movl	$5, %r10d
	jmp	.L120
.L119:
	movl	$3, %r10d
.L120:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	%r10d, %edx
	movq	%rax, %rcx
	call	create_symbol
	movq	%rax, -32(%rbp)
	movq	$0, -8(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L121
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L121
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -16(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -16(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L121
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC43(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L121:
	movq	-8(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	create_variable
.L115:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC44:
	.ascii "Cannot use 'break' outside of a loop\0"
	.align 8
.LC45:
	.ascii "Cannot use 'continue' outside of a loop\0"
.LC46:
	.ascii "Failed to parse statement\0"
.LC47:
	.ascii "Expected ';' after statement\0"
	.text
	.def	parse_statement;	.scl	3;	.type	32;	.endef
parse_statement:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -16(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	peek_current_token
	movq	%rax, -16(%rbp)
	movq	$0, -8(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L123
	movq	.refptr.IF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L124
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
	jmp	.L125
.L124:
	movq	.refptr.FOR_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L126
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
	jmp	.L125
.L126:
	movq	.refptr.WHILE_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L127
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
	jmp	.L125
.L127:
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L128
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
	movq	%rax, -8(%rbp)
	jmp	.L129
.L128:
	movq	.refptr.RETURN_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L130
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L131
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L131
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$5, %ecx
	call	create_statement
	jmp	.L125
.L131:
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
	movq	%rax, -8(%rbp)
	jmp	.L129
.L130:
	movq	.refptr.BREAK_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L132
	movq	32(%rbp), %rax
	movzbl	11(%rax), %eax
	testb	%al, %al
	jne	.L133
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC44(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L125
.L133:
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$6, %ecx
	call	create_statement
	movq	%rax, -8(%rbp)
	jmp	.L129
.L132:
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L134
	movq	32(%rbp), %rax
	movzbl	11(%rax), %eax
	testb	%al, %al
	jne	.L135
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC45(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L125
.L135:
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$7, %ecx
	call	create_statement
	movq	%rax, -8(%rbp)
	jmp	.L129
.L134:
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
	movq	%rax, -8(%rbp)
	jmp	.L129
.L123:
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
	movq	%rax, -8(%rbp)
.L129:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	peek_current_token
	movq	%rax, -16(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L136
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC46(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L136:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L137
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L138
.L137:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC47(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L138:
	movq	-8(%rbp), %rax
.L125:
	leave
	ret
	.section .rdata,"dr"
.LC48:
	.ascii "Expected '(' after 'if'\0"
.LC49:
	.ascii "Failed to parse if condition\0"
	.align 8
.LC50:
	.ascii "Expected ')' after if condition\0"
.LC51:
	.ascii "Expected '{' to start if body\0"
	.align 8
.LC52:
	.ascii "Failed to parse if body statement\0"
.LC53:
	.ascii "Expected '(' after 'elif'\0"
	.align 8
.LC54:
	.ascii "Failed to parse else-if condition\0"
	.align 8
.LC55:
	.ascii "Expected ')' after else-if condition\0"
	.align 8
.LC56:
	.ascii "Expected '{' to start else-if body\0"
	.align 8
.LC57:
	.ascii "Failed to parse else-if body statement\0"
	.align 8
.LC58:
	.ascii "Expected '{' to start else body\0"
	.align 8
.LC59:
	.ascii "Failed to parse else body statement\0"
	.text
	.def	parse_if;	.scl	3;	.type	32;	.endef
parse_if:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$112, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -8(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L140
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L141
.L140:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC48(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L142
.L141:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L143
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC49(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L143:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L144
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L145
.L144:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC50(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L142
.L145:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L146
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L147
.L146:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC51(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L142
.L147:
	call	create_list
	movq	%rax, -24(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	jmp	.L148
.L150:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_statement
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	jne	.L149
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC52(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L149:
	movq	-80(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
.L148:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L150
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L150
	call	create_list
	movq	%rax, -32(%rbp)
	call	create_list
	movq	%rax, -40(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -8(%rbp)
	jmp	.L151
.L163:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L152
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L153
.L152:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC53(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L142
.L153:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L154
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC54(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L154:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L155
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L156
.L155:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC55(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L142
.L156:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L157
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L158
.L157:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC56(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L142
.L158:
	call	create_list
	movq	%rax, -56(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	jmp	.L159
.L161:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_statement
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.L160
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC57(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L160:
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
.L159:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L161
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L161
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	create_else_if
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -8(%rbp)
.L151:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L162
	movq	.refptr.ELIF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L163
.L162:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L164
	movq	.refptr.ELSE_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L164
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L165
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L166
.L165:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC58(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L142
.L166:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	jmp	.L167
.L169:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_statement
	movq	%rax, -72(%rbp)
	cmpq	$0, -72(%rbp)
	jne	.L168
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC59(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L168:
	movq	-72(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
.L167:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L169
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L169
.L164:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	peek_current_token
	movq	%rax, -8(%rbp)
	movq	-40(%rbp), %r8
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%r8, %r9
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	create_if
.L142:
	leave
	ret
	.section .rdata,"dr"
.LC60:
	.ascii "Expected '(' after 'for'\0"
	.align 8
.LC61:
	.ascii "Failed to parse for loop initializer\0"
	.align 8
.LC62:
	.ascii "Expected ';' after for loop initializer\0"
	.align 8
.LC63:
	.ascii "Failed to parse for loop condition\0"
	.align 8
.LC64:
	.ascii "Expected ';' after for loop condition\0"
	.align 8
.LC65:
	.ascii "Failed to parse for loop increment\0"
	.align 8
.LC66:
	.ascii "Expected ')' after for loop increment\0"
	.align 8
.LC67:
	.ascii "Expected '{' to start for loop body\0"
	.align 8
.LC68:
	.ascii "Failed to parse for loop body statement\0"
	.text
	.def	parse_for;	.scl	3;	.type	32;	.endef
parse_for:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -8(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L171
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L172
.L171:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC60(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L173
.L172:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	$0, -16(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L174
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L175
.L174:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_variable
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L176
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC61(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L176:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
.L175:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L177
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L178
.L177:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC62(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L173
.L178:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	$0, -24(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L179
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L180
.L179:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L181
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC63(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L181:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
.L180:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L182
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L183
.L182:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC64(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L173
.L183:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	$0, -32(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L184
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L185
.L184:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L186
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC65(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L186:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
.L185:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L187
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L188
.L187:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC66(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L173
.L188:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L189
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L190
.L189:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC67(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L173
.L190:
	call	create_list
	movq	%rax, -40(%rbp)
	movq	32(%rbp), %rax
	movb	$1, 11(%rax)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	jmp	.L191
.L193:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_statement
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L192
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC68(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L192:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
.L191:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L193
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L193
	movq	32(%rbp), %rax
	movb	$0, 11(%rax)
	movq	-40(%rbp), %r8
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%r8, %r9
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	create_for
.L173:
	leave
	ret
	.section .rdata,"dr"
.LC69:
	.ascii "Expected '(' after 'while'\0"
	.align 8
.LC70:
	.ascii "Failed to parse while condition\0"
	.align 8
.LC71:
	.ascii "Expected ')' after while condition\0"
	.align 8
.LC72:
	.ascii "Expected '{' to start while body\0"
	.align 8
.LC73:
	.ascii "Failed to parse while body statement\0"
	.text
	.def	parse_while;	.scl	3;	.type	32;	.endef
parse_while:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -8(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L195
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L196
.L195:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC69(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L197
.L196:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L198
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC70(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L198:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L199
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L200
.L199:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC71(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L197
.L200:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L201
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L202
.L201:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC72(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L197
.L202:
	call	create_list
	movq	%rax, -24(%rbp)
	movq	32(%rbp), %rax
	movb	$1, 11(%rax)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	jmp	.L203
.L205:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_statement
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L204
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC73(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L204:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
.L203:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L205
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L205
	movq	32(%rbp), %rax
	movb	$0, 11(%rax)
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	create_while
.L197:
	leave
	ret
	.section .rdata,"dr"
.LC74:
	.ascii "Failed to parse right operand\0"
	.text
	.def	parse_expr_prec;	.scl	3;	.type	32;	.endef
parse_expr_prec:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$96, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	$0, -8(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -8(%rbp)
	jmp	.L207
.L215:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_to_operator
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %ecx
	call	operator_precedence
	movl	%eax, -24(%rbp)
	cmpl	$19, -20(%rbp)
	je	.L208
	movl	-24(%rbp), %eax
	cmpl	32(%rbp), %eax
	jl	.L208
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	48(%rbp), %rcx
	movq	40(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_primary
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L209
	movq	48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC74(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L210
.L209:
	movq	-32(%rbp), %rax
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$19, %ecx
	call	create_expression
	movq	%rax, -16(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -8(%rbp)
	jmp	.L211
.L214:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_to_operator
	movl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %ecx
	call	operator_precedence
	movl	%eax, -40(%rbp)
	cmpl	$19, -36(%rbp)
	je	.L212
	movl	-40(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jle	.L212
	movq	40(%rbp), %r9
	movl	-40(%rbp), %r8d
	movq	-16(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	48(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movq	%rax, %rcx
	call	parse_expr_prec
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L213
	movl	$0, %eax
	jmp	.L210
.L213:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -8(%rbp)
.L211:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	je	.L214
.L212:
	movq	-16(%rbp), %rcx
	movq	24(%rbp), %rdx
	movl	-20(%rbp), %eax
	movq	%rcx, %r9
	movl	$0, %r8d
	movl	%eax, %ecx
	call	create_expression
	movq	%rax, 24(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -8(%rbp)
.L207:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	je	.L215
.L208:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	peek_current_token
	movq	%rax, -8(%rbp)
	movq	24(%rbp), %rax
.L210:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC75:
	.ascii "Failed to parse expression primary\0"
	.text
	.def	parse_expression;	.scl	3;	.type	32;	.endef
parse_expression:
	pushq	%rbp
	movq	%rsp, %rbp
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
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L217
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rbx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	peek_current_token
	movq	%rbx, %r8
	movq	%rax, %rdx
	leaq	.LC75(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L218
.L217:
	movq	-24(%rbp), %rax
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
.L218:
	movq	-8(%rbp), %rbx
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC76:
	.ascii "Failed to parse parenthesized expression\0"
.LC77:
	.ascii "Expected ')' after expression\0"
	.align 8
.LC78:
	.ascii "Failed to parse operand of unary '!'\0"
	.align 8
.LC79:
	.ascii "Failed to parse operand of unary '-'\0"
	.align 8
.LC80:
	.ascii "Failed to parse variable access\0"
	.align 8
.LC81:
	.ascii "Unexpected token in primary expression\0"
	.text
	.def	parse_primary;	.scl	3;	.type	32;	.endef
parse_primary:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$96, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -48(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	peek_current_token
	movq	%rax, -48(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -40(%rbp)
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$2, %eax
	jne	.L220
	movl	$0, -4(%rbp)
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L221
.L220:
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$3, %eax
	jne	.L222
	movl	$1, -4(%rbp)
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L221
.L222:
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$4, %eax
	jne	.L223
	movl	$2, -4(%rbp)
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L221
.L223:
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L224
	movq	.refptr.TRUE_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L224
	movl	$3, -4(%rbp)
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L221
.L224:
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L225
	movq	.refptr.FALSE_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L225
	movl	$4, -4(%rbp)
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L221
.L225:
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L226
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L226
	movl	$5, -4(%rbp)
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
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L227
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC76(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L228
.L227:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L229
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L238
.L229:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC77(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L228
.L226:
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L231
	movq	.refptr.NOT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L231
	movl	$6, -4(%rbp)
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
	call	parse_primary
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L221
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC78(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L228
.L231:
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L233
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L233
	movl	$7, -4(%rbp)
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
	call	parse_primary
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L221
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC79(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L228
.L233:
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L235
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L236
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L236
	movq	32(%rbp), %rax
	movzbl	9(%rax), %eax
	testb	%al, %al
	je	.L236
.L235:
	movl	$8, -4(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_variable_access
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L221
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC80(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L228
.L236:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC81(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L228
.L238:
	nop
.L221:
	movq	-32(%rbp), %r9
	movq	-24(%rbp), %r8
	movq	-16(%rbp), %rdx
	movl	-4(%rbp), %eax
	movq	-40(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movl	%eax, %ecx
	call	create_primary
.L228:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC82:
	.ascii "Expected variable name in variable access\0"
	.align 8
.LC83:
	.ascii "Cannot call undefined variable\0"
	.align 8
.LC84:
	.ascii "Cannot call non-function variable\0"
	.align 8
.LC85:
	.ascii "Failed to parse function call argument\0"
	.align 8
.LC86:
	.ascii "Expected ',' or ')' after function call argument\0"
	.align 8
.LC87:
	.ascii "Failed to parse sequence index\0"
	.align 8
.LC88:
	.ascii "Expected ']' after sequence index\0"
	.align 8
.LC89:
	.ascii "Cannot access attribute without a valid scope\0"
	.align 8
.LC90:
	.ascii "Expected attribute name after '.'\0"
.LC91:
	.ascii "Unknown attribute name\0"
	.text
	.def	parse_variable_access;	.scl	3;	.type	32;	.endef
parse_variable_access:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$144, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	peek_current_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L240
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L241
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L240
.L241:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC82(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L242
.L240:
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movq	$0, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	search_name
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	create_variable_access
	movq	%rax, -40(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -8(%rbp)
	jmp	.L243
.L269:
	cmpq	$0, -24(%rbp)
	je	.L244
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L244
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
.L244:
	cmpq	$0, -32(%rbp)
	jne	.L245
	cmpq	$0, -16(%rbp)
	je	.L245
	movq	-16(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L245
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	movq	%rax, -32(%rbp)
.L245:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L246
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L247
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC83(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	jmp	.L248
.L247:
	movq	-24(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L248
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	make_method_name
	movq	%rax, -72(%rbp)
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	movq	-72(%rbp), %rdx
	movq	%rax, %rcx
	call	search_name_use_strcmp
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$2, %ecx
	call	create_variable_access
	movq	%rax, -40(%rbp)
.L248:
	cmpq	$0, -24(%rbp)
	je	.L249
	movq	-24(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$1, %eax
	je	.L249
	movq	-24(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	je	.L249
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC84(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L249:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	call	create_list
	movq	%rax, -80(%rbp)
	jmp	.L250
.L255:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L251
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC85(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L251:
	movq	-88(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L252
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L252
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	jmp	.L250
.L252:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L254
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L250
.L254:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC86(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L242
.L250:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L255
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L255
	movq	-40(%rbp), %rax
	movq	-80(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_variable_access
	movq	%rax, -40(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -32(%rbp)
	movq	-24(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L256
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	movq	%rax, -32(%rbp)
	jmp	.L256
.L246:
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L257
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.L258
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC87(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L258:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L259
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L260
.L259:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC88(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L242
.L260:
	movq	-64(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	$0, 32(%rsp)
	movq	%rdx, %r9
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$3, %ecx
	call	create_variable_access
	movq	%rax, -40(%rbp)
	jmp	.L256
.L257:
	movq	.refptr.DOT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L270
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L262
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC89(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L242
.L262:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L263
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC90(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L242
.L263:
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	search_name
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L264
	movq	$0, -48(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L265
	movq	-16(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L266
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -48(%rbp)
	jmp	.L265
.L266:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L265
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L265
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -48(%rbp)
.L265:
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	make_method_name
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	search_name_use_strcmp
	movq	%rax, -24(%rbp)
.L264:
	cmpq	$0, -24(%rbp)
	jne	.L267
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	get_full_path
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC91(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L242
.L267:
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$2, %ecx
	call	create_variable_access
	movq	%rax, -40(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -32(%rbp)
.L256:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -8(%rbp)
.L243:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	je	.L269
	jmp	.L268
.L270:
	nop
.L268:
	movq	-40(%rbp), %rax
.L242:
	leave
	ret
	.ident	"GCC: (GNU) 13.2.0"
	.def	create_symbol_table;	.scl	2;	.type	32;	.endef
	.def	create_symbol;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	get_full_path;	.scl	2;	.type	32;	.endef
	.def	parser_error;	.scl	2;	.type	32;	.endef
	.def	create_code_member;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	create_code;	.scl	2;	.type	32;	.endef
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	create_import;	.scl	2;	.type	32;	.endef
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.def	search_name;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.def	create_function_use_ptr;	.scl	2;	.type	32;	.endef
	.def	make_method_name;	.scl	2;	.type	32;	.endef
	.def	create_variable;	.scl	2;	.type	32;	.endef
	.def	create_method_use_ptr;	.scl	2;	.type	32;	.endef
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	create_class_use_ptr;	.scl	2;	.type	32;	.endef
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
	.def	create_else_if;	.scl	2;	.type	32;	.endef
	.def	create_if;	.scl	2;	.type	32;	.endef
	.def	create_for;	.scl	2;	.type	32;	.endef
	.def	create_while;	.scl	2;	.type	32;	.endef
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.DOT_SYMBOL, "dr"
	.globl	.refptr.DOT_SYMBOL
	.linkonce	discard
.refptr.DOT_SYMBOL:
	.quad	DOT_SYMBOL
	.section	.rdata$.refptr.R_BRACKET_SYMBOL, "dr"
	.globl	.refptr.R_BRACKET_SYMBOL
	.linkonce	discard
.refptr.R_BRACKET_SYMBOL:
	.quad	R_BRACKET_SYMBOL
	.section	.rdata$.refptr.L_BRACKET_SYMBOL, "dr"
	.globl	.refptr.L_BRACKET_SYMBOL
	.linkonce	discard
.refptr.L_BRACKET_SYMBOL:
	.quad	L_BRACKET_SYMBOL
	.section	.rdata$.refptr.SUB_SYMBOL, "dr"
	.globl	.refptr.SUB_SYMBOL
	.linkonce	discard
.refptr.SUB_SYMBOL:
	.quad	SUB_SYMBOL
	.section	.rdata$.refptr.NOT_SYMBOL, "dr"
	.globl	.refptr.NOT_SYMBOL
	.linkonce	discard
.refptr.NOT_SYMBOL:
	.quad	NOT_SYMBOL
	.section	.rdata$.refptr.FALSE_KEYWORD, "dr"
	.globl	.refptr.FALSE_KEYWORD
	.linkonce	discard
.refptr.FALSE_KEYWORD:
	.quad	FALSE_KEYWORD
	.section	.rdata$.refptr.TRUE_KEYWORD, "dr"
	.globl	.refptr.TRUE_KEYWORD
	.linkonce	discard
.refptr.TRUE_KEYWORD:
	.quad	TRUE_KEYWORD
	.section	.rdata$.refptr.ELSE_KEYWORD, "dr"
	.globl	.refptr.ELSE_KEYWORD
	.linkonce	discard
.refptr.ELSE_KEYWORD:
	.quad	ELSE_KEYWORD
	.section	.rdata$.refptr.ELIF_KEYWORD, "dr"
	.globl	.refptr.ELIF_KEYWORD
	.linkonce	discard
.refptr.ELIF_KEYWORD:
	.quad	ELIF_KEYWORD
	.section	.rdata$.refptr.CONTINUE_KEYWORD, "dr"
	.globl	.refptr.CONTINUE_KEYWORD
	.linkonce	discard
.refptr.CONTINUE_KEYWORD:
	.quad	CONTINUE_KEYWORD
	.section	.rdata$.refptr.BREAK_KEYWORD, "dr"
	.globl	.refptr.BREAK_KEYWORD
	.linkonce	discard
.refptr.BREAK_KEYWORD:
	.quad	BREAK_KEYWORD
	.section	.rdata$.refptr.RETURN_KEYWORD, "dr"
	.globl	.refptr.RETURN_KEYWORD
	.linkonce	discard
.refptr.RETURN_KEYWORD:
	.quad	RETURN_KEYWORD
	.section	.rdata$.refptr.WHILE_KEYWORD, "dr"
	.globl	.refptr.WHILE_KEYWORD
	.linkonce	discard
.refptr.WHILE_KEYWORD:
	.quad	WHILE_KEYWORD
	.section	.rdata$.refptr.FOR_KEYWORD, "dr"
	.globl	.refptr.FOR_KEYWORD
	.linkonce	discard
.refptr.FOR_KEYWORD:
	.quad	FOR_KEYWORD
	.section	.rdata$.refptr.IF_KEYWORD, "dr"
	.globl	.refptr.IF_KEYWORD
	.linkonce	discard
.refptr.IF_KEYWORD:
	.quad	IF_KEYWORD
	.section	.rdata$.refptr.ASSIGN_SYMBOL, "dr"
	.globl	.refptr.ASSIGN_SYMBOL
	.linkonce	discard
.refptr.ASSIGN_SYMBOL:
	.quad	ASSIGN_SYMBOL
	.section	.rdata$.refptr.DEFAULT_CONSTRUCTOR_NAME, "dr"
	.globl	.refptr.DEFAULT_CONSTRUCTOR_NAME
	.linkonce	discard
.refptr.DEFAULT_CONSTRUCTOR_NAME:
	.quad	DEFAULT_CONSTRUCTOR_NAME
	.section	.rdata$.refptr.DEFAULT_INIT_NAME, "dr"
	.globl	.refptr.DEFAULT_INIT_NAME
	.linkonce	discard
.refptr.DEFAULT_INIT_NAME:
	.quad	DEFAULT_INIT_NAME
	.section	.rdata$.refptr.VAR_KEYWORD, "dr"
	.globl	.refptr.VAR_KEYWORD
	.linkonce	discard
.refptr.VAR_KEYWORD:
	.quad	VAR_KEYWORD
	.section	.rdata$.refptr.METHOD_KEYWORD, "dr"
	.globl	.refptr.METHOD_KEYWORD
	.linkonce	discard
.refptr.METHOD_KEYWORD:
	.quad	METHOD_KEYWORD
	.section	.rdata$.refptr.SELF_KEYWORD, "dr"
	.globl	.refptr.SELF_KEYWORD
	.linkonce	discard
.refptr.SELF_KEYWORD:
	.quad	SELF_KEYWORD
	.section	.rdata$.refptr.R_BRACE_SYMBOL, "dr"
	.globl	.refptr.R_BRACE_SYMBOL
	.linkonce	discard
.refptr.R_BRACE_SYMBOL:
	.quad	R_BRACE_SYMBOL
	.section	.rdata$.refptr.L_BRACE_SYMBOL, "dr"
	.globl	.refptr.L_BRACE_SYMBOL
	.linkonce	discard
.refptr.L_BRACE_SYMBOL:
	.quad	L_BRACE_SYMBOL
	.section	.rdata$.refptr.R_PAREN_SYMBOL, "dr"
	.globl	.refptr.R_PAREN_SYMBOL
	.linkonce	discard
.refptr.R_PAREN_SYMBOL:
	.quad	R_PAREN_SYMBOL
	.section	.rdata$.refptr.COMMA_SYMBOL, "dr"
	.globl	.refptr.COMMA_SYMBOL
	.linkonce	discard
.refptr.COMMA_SYMBOL:
	.quad	COMMA_SYMBOL
	.section	.rdata$.refptr.L_PAREN_SYMBOL, "dr"
	.globl	.refptr.L_PAREN_SYMBOL
	.linkonce	discard
.refptr.L_PAREN_SYMBOL:
	.quad	L_PAREN_SYMBOL
	.section	.rdata$.refptr.SEMICOLON_SYMBOL, "dr"
	.globl	.refptr.SEMICOLON_SYMBOL
	.linkonce	discard
.refptr.SEMICOLON_SYMBOL:
	.quad	SEMICOLON_SYMBOL
	.section	.rdata$.refptr.FROM_KEYWORD, "dr"
	.globl	.refptr.FROM_KEYWORD
	.linkonce	discard
.refptr.FROM_KEYWORD:
	.quad	FROM_KEYWORD
	.section	.rdata$.refptr.CLASS_KEYWORD, "dr"
	.globl	.refptr.CLASS_KEYWORD
	.linkonce	discard
.refptr.CLASS_KEYWORD:
	.quad	CLASS_KEYWORD
	.section	.rdata$.refptr.FUNC_KEYWORD, "dr"
	.globl	.refptr.FUNC_KEYWORD
	.linkonce	discard
.refptr.FUNC_KEYWORD:
	.quad	FUNC_KEYWORD
	.section	.rdata$.refptr.IMPORT_KEYWORD, "dr"
	.globl	.refptr.IMPORT_KEYWORD
	.linkonce	discard
.refptr.IMPORT_KEYWORD:
	.quad	IMPORT_KEYWORD
	.section	.rdata$.refptr.name_bool, "dr"
	.globl	.refptr.name_bool
	.linkonce	discard
.refptr.name_bool:
	.quad	name_bool
	.section	.rdata$.refptr.BOOL_KEYWORD, "dr"
	.globl	.refptr.BOOL_KEYWORD
	.linkonce	discard
.refptr.BOOL_KEYWORD:
	.quad	BOOL_KEYWORD
	.section	.rdata$.refptr.name_string, "dr"
	.globl	.refptr.name_string
	.linkonce	discard
.refptr.name_string:
	.quad	name_string
	.section	.rdata$.refptr.STRING_KEYWORD, "dr"
	.globl	.refptr.STRING_KEYWORD
	.linkonce	discard
.refptr.STRING_KEYWORD:
	.quad	STRING_KEYWORD
	.section	.rdata$.refptr.name_float, "dr"
	.globl	.refptr.name_float
	.linkonce	discard
.refptr.name_float:
	.quad	name_float
	.section	.rdata$.refptr.FLOAT_KEYWORD, "dr"
	.globl	.refptr.FLOAT_KEYWORD
	.linkonce	discard
.refptr.FLOAT_KEYWORD:
	.quad	FLOAT_KEYWORD
	.section	.rdata$.refptr.name_int, "dr"
	.globl	.refptr.name_int
	.linkonce	discard
.refptr.name_int:
	.quad	name_int
	.section	.rdata$.refptr.INT_KEYWORD, "dr"
	.globl	.refptr.INT_KEYWORD
	.linkonce	discard
.refptr.INT_KEYWORD:
	.quad	INT_KEYWORD
	.section	.rdata$.refptr.name_void, "dr"
	.globl	.refptr.name_void
	.linkonce	discard
.refptr.name_void:
	.quad	name_void
	.section	.rdata$.refptr.VOID_KEYWORD, "dr"
	.globl	.refptr.VOID_KEYWORD
	.linkonce	discard
.refptr.VOID_KEYWORD:
	.quad	VOID_KEYWORD
	.section	.rdata$.refptr.builtin_scope, "dr"
	.globl	.refptr.builtin_scope
	.linkonce	discard
.refptr.builtin_scope:
	.quad	builtin_scope
