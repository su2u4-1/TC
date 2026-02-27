	.file	"D:\\TC\\src\\parser.c"
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
	subq	$112, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L2
	movl	$0, %ecx
	call	create_scope
	movq	.refptr.builtin_scope(%rip), %rdx
	movq	%rax, (%rdx)
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %rdx
	movq	.refptr.VOID_KEYWORD(%rip), %rax
	movq	(%rax), %rax
	movq	%rdx, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	create_name
	movq	.refptr.name_void(%rip), %rdx
	movq	%rax, (%rdx)
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %rdx
	movq	.refptr.INT_KEYWORD(%rip), %rax
	movq	(%rax), %rax
	movq	%rdx, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	create_name
	movq	.refptr.name_int(%rip), %rdx
	movq	%rax, (%rdx)
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %rdx
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	movq	(%rax), %rax
	movq	%rdx, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	create_name
	movq	.refptr.name_float(%rip), %rdx
	movq	%rax, (%rdx)
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %rdx
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	movq	(%rax), %rax
	movq	%rdx, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	create_name
	movq	.refptr.name_string(%rip), %rdx
	movq	%rax, (%rdx)
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %rdx
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	movq	(%rax), %rax
	movq	%rdx, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	create_name
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
	movq	$0, -16(%rbp)
	call	create_list
	movq	%rax, -24(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	create_scope
	movq	%rax, -32(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L4
.L13:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L5
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L5
	movq	-32(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	parse_import
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L6
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L6:
	movq	-40(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_code_member
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L7
.L5:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L8
	movq	.refptr.FUNC_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L8
	movq	32(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_function
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L9
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L9:
	movq	-48(%rbp), %rax
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$1, %ecx
	call	create_code_member
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L7
.L8:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L10
	movq	.refptr.CLASS_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L10
	movq	32(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_class
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L11
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L11:
	movq	-56(%rbp), %rax
	movq	%rax, %r9
	movl	$0, %r8d
	movl	$0, %edx
	movl	$2, %ecx
	call	create_code_member
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L7
.L10:
	movq	-8(%rbp), %rax
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
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
.L4:
	cmpq	$0, -8(%rbp)
	je	.L12
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	jne	.L13
.L12:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
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
	.text
	.def	parse_import;	.scl	3;	.type	32;	.endef
parse_import:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$96, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	$0, -8(%rbp)
	movq	$0, -16(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L16
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L17
.L16:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	$0, -24(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L18
	movq	.refptr.FROM_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
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
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$4, %eax
	je	.L19
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC5(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L17
.L19:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
.L18:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L20
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L21
.L20:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L17
.L21:
	movq	24(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_import_file
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L22
	movq	.refptr.name_void(%rip), %rax
	movq	(%rax), %rcx
	movq	-40(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movl	$0, %r9d
	movq	%rcx, %r8
	movl	$1, %edx
	movq	%rax, %rcx
	call	create_name
	movq	%rax, -32(%rbp)
.L22:
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	create_import
.L17:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC7:
	.ascii "Expected function return type after 'func'\0"
.LC8:
	.ascii "Unknown function return type\0"
	.align 8
.LC9:
	.ascii "Expected function name after return type\0"
	.align 8
.LC10:
	.ascii "Expected '(' after function name\0"
	.align 8
.LC11:
	.ascii "Failed to parse function parameter\0"
	.align 8
.LC12:
	.ascii "Function parameters cannot have default values\0"
	.align 8
.LC13:
	.ascii "Expected ',' or ')' after function parameter\0"
	.align 8
.LC14:
	.ascii "Expected '{' to start function body\0"
	.align 8
.LC15:
	.ascii "Failed to parse function body statement\0"
	.align 8
.LC16:
	.ascii "Unreachable code after return statement\0"
	.align 8
.LC17:
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
	movq	$0, -16(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	create_scope
	movq	%rax, -32(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L24
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L25
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	is_builtin_type
	testb	%al, %al
	jne	.L24
.L25:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L26
.L24:
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	search
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L27
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC8(%rip), %rax
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
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L28
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC9(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L26
.L28:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	-40(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movl	$0, %r9d
	movq	%rcx, %r8
	movl	$2, %edx
	movq	%rax, %rcx
	call	create_name
	movq	%rax, -48(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L29
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L30
.L29:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC10(%rip), %rax
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
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	call	create_list
	movq	%rax, -56(%rbp)
	jmp	.L31
.L38:
	movq	32(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_variable
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	jne	.L32
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC11(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	jmp	.L33
.L32:
	movq	-80(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L34
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC12(%rip), %rax
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
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L35
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
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
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L31
.L35:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L37
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L31
.L37:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L26
.L31:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L38
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
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
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L39
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L40
.L39:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC14(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L26
.L40:
	call	create_list
	movq	%rax, -64(%rbp)
	movq	32(%rbp), %rax
	movb	$1, (%rax)
	movb	$0, -17(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L41
.L45:
	movq	32(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_statement
	movq	%rax, -72(%rbp)
	cmpq	$0, -72(%rbp)
	jne	.L42
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	jmp	.L43
.L42:
	cmpb	$0, -17(%rbp)
	je	.L43
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC16(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L43:
	movq	-72(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$5, %eax
	jne	.L44
	movb	$1, -17(%rbp)
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
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
.L41:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L45
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L45
	movq	32(%rbp), %rax
	movb	$0, (%rax)
	cmpb	$0, -17(%rbp)
	jne	.L46
	movq	.refptr.name_void(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, -40(%rbp)
	je	.L46
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC17(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L46:
	movq	-64(%rbp), %r9
	movq	-56(%rbp), %r8
	movq	-40(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movq	%rax, %rcx
	call	create_function
.L26:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC18:
	.ascii "Expected method return type after 'method'\0"
	.align 8
.LC19:
	.ascii "Unknown return type for method\0"
	.align 8
.LC20:
	.ascii "Expected method name after return type\0"
	.align 8
.LC21:
	.ascii "Expected '(' after method name\0"
	.align 8
.LC22:
	.ascii "Expected 'self' as first parameter of method\0"
	.align 8
.LC23:
	.ascii "Expected ',' or ')' after method parameter\0"
	.align 8
.LC24:
	.ascii "Failed to parse method parameter\0"
	.align 8
.LC25:
	.ascii "Method parameters cannot have default values\0"
	.align 8
.LC26:
	.ascii "Expected '{' to start method body\0"
	.align 8
.LC27:
	.ascii "Failed to parse method body statement\0"
	.align 8
.LC28:
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
	movq	$0, -16(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	create_scope
	movq	%rax, -32(%rbp)
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rax
	movq	32(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movl	$0, %r9d
	movq	%rcx, %r8
	movl	$1, %edx
	movq	%rax, %rcx
	call	create_name
	movq	%rax, -40(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L48
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L49
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	is_builtin_type
	testb	%al, %al
	jne	.L48
.L49:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC18(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L50
.L48:
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	search
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L51
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC19(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L50
.L51:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L52
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC20(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L50
.L52:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movl	$0, %r9d
	movq	%rcx, %r8
	movl	$3, %edx
	movq	%rax, %rcx
	call	create_name
	movq	%rax, -56(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L53
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L54
.L53:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC21(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L50
.L54:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L55
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L56
.L55:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC22(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L56:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	call	create_list
	movq	%rax, -64(%rbp)
	movq	-40(%rbp), %rdx
	movq	32(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rcx
	call	create_variable
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L57
.L65:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L58
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L58
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	40(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_variable
	movq	%rax, -72(%rbp)
	cmpq	$0, -72(%rbp)
	je	.L59
	jmp	.L74
.L58:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L61
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L62
.L61:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC23(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L50
.L59:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC24(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	jmp	.L63
.L74:
	movq	-72(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L64
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC25(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	jmp	.L63
.L64:
	movq	-72(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
.L63:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
.L57:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L65
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L65
.L62:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L66
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L67
.L66:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC26(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L50
.L67:
	call	create_list
	movq	%rax, -80(%rbp)
	movq	40(%rbp), %rax
	movb	$1, (%rax)
	movq	40(%rbp), %rax
	movb	$1, 1(%rax)
	movb	$0, -17(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L68
.L72:
	movq	40(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_statement
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L69
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC27(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	jmp	.L70
.L69:
	cmpb	$0, -17(%rbp)
	je	.L70
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC16(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L70:
	movq	-88(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$5, %eax
	jne	.L71
	movb	$1, -17(%rbp)
.L71:
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
	movq	%rax, -16(%rbp)
.L68:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L72
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L72
	movq	40(%rbp), %rax
	movb	$0, (%rax)
	movq	40(%rbp), %rax
	movb	$0, 1(%rax)
	cmpb	$0, -17(%rbp)
	jne	.L73
	movq	.refptr.name_void(%rip), %rax
	movq	(%rax), %rax
	cmpq	%rax, -48(%rbp)
	je	.L73
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC28(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L73:
	movq	-80(%rbp), %r9
	movq	-64(%rbp), %r8
	movq	-48(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movq	%rax, %rcx
	call	create_method
.L50:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC29:
	.ascii "Expected class name after 'class'\0"
	.align 8
.LC30:
	.ascii "Expected '{' to start class body\0"
.LC31:
	.ascii "Failed to parse class method\0"
	.align 8
.LC32:
	.ascii "Failed to parse class variable\0"
	.align 8
.LC33:
	.ascii "Expected ';' after class variable declaration\0"
	.align 8
.LC34:
	.ascii "Unexpected token in class member\0"
	.text
	.def	parse_class;	.scl	3;	.type	32;	.endef
parse_class:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$112, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -8(%rbp)
	movq	$0, -16(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	create_scope
	movq	%rax, -24(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L76
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC29(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L77
.L76:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movq	%rcx, %r9
	movl	$0, %r8d
	movl	$4, %edx
	movq	%rax, %rcx
	call	create_name
	movq	%rax, -32(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L78
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L79
.L78:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC30(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L77
.L79:
	call	create_list
	movq	%rax, -40(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L80
.L88:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L81
	movq	.refptr.METHOD_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L81
	movq	32(%rbp), %r8
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%r8, %r9
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_method
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L82
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC31(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L82:
	movq	-48(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$0, %ecx
	call	create_class_member
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	jmp	.L83
.L81:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L84
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L84
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	32(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_variable
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L85
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC32(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L85:
	movq	-56(%rbp), %rax
	movq	%rax, %r8
	movl	$0, %edx
	movl	$1, %ecx
	call	create_class_member
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L86
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L89
.L86:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC33(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	jmp	.L89
.L84:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC34(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	jmp	.L83
.L89:
	nop
.L83:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
.L80:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L88
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L88
	movq	-24(%rbp), %rcx
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	create_class
.L77:
	leave
	ret
	.section .rdata,"dr"
.LC35:
	.ascii "Expected variable type\0"
	.align 8
.LC36:
	.ascii "Expected a type for variable declaration\0"
.LC37:
	.ascii "Unknown variable type\0"
.LC38:
	.ascii "Expected variable name\0"
	.align 8
.LC39:
	.ascii "Failed to parse variable initializer\0"
	.text
	.def	parse_variable;	.scl	3;	.type	32;	.endef
parse_variable:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$96, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	peek_current_token
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L91
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L92
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	is_builtin_type
	testb	%al, %al
	jne	.L91
.L92:
	movq	-16(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC35(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L93
.L91:
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	search
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L94
	movq	-32(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	je	.L95
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$4, %eax
	je	.L95
	movq	-16(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC36(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	jmp	.L95
.L94:
	movq	-16(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC37(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L95:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L96
	movq	-16(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC38(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L96:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movl	$0, %r9d
	movq	%rcx, %r8
	movl	$1, %edx
	movq	%rax, %rcx
	call	create_name
	movq	%rax, -48(%rbp)
	movq	$0, -8(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L97
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L97
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L97
	movq	-16(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC39(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L97:
	movq	-8(%rbp), %rcx
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	create_variable
.L93:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC40:
	.ascii "Cannot use 'break' outside of a loop\0"
	.align 8
.LC41:
	.ascii "Cannot use 'continue' outside of a loop\0"
.LC42:
	.ascii "Failed to parse statement\0"
.LC43:
	.ascii "Expected ';' after statement\0"
	.text
	.def	parse_statement;	.scl	3;	.type	32;	.endef
parse_statement:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	peek_current_token
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	$0, -8(%rbp)
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L99
	movq	.refptr.IF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L100
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
	jmp	.L101
.L100:
	movq	.refptr.FOR_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L102
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
	jmp	.L101
.L102:
	movq	.refptr.WHILE_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L103
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
	jmp	.L101
.L103:
	movq	.refptr.VAR_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L104
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
	jmp	.L105
.L104:
	movq	.refptr.RETURN_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L106
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -24(%rbp)
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
	jmp	.L105
.L106:
	movq	.refptr.BREAK_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L107
	movq	32(%rbp), %rax
	movzbl	2(%rax), %eax
	testb	%al, %al
	jne	.L108
	movq	-16(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC40(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L101
.L108:
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$6, %ecx
	call	create_statement
	movq	%rax, -8(%rbp)
	jmp	.L105
.L107:
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L109
	movq	32(%rbp), %rax
	movzbl	2(%rax), %eax
	testb	%al, %al
	jne	.L110
	movq	-16(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC41(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L101
.L110:
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$7, %ecx
	call	create_statement
	movq	%rax, -8(%rbp)
	jmp	.L105
.L109:
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
	jmp	.L105
.L99:
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
.L105:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	peek_current_token
	movq	%rax, -16(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L111
	movq	-16(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC42(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L111:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L112
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L113
.L112:
	movq	-16(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC43(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L113:
	movq	-8(%rbp), %rax
.L101:
	leave
	ret
	.section .rdata,"dr"
.LC44:
	.ascii "Expected '(' after 'if'\0"
.LC45:
	.ascii "Failed to parse if condition\0"
	.align 8
.LC46:
	.ascii "Expected ')' after if condition\0"
.LC47:
	.ascii "Expected '{' to start if body\0"
	.align 8
.LC48:
	.ascii "Failed to parse if body statement\0"
.LC49:
	.ascii "Expected '(' after 'elif'\0"
	.align 8
.LC50:
	.ascii "Failed to parse else-if condition\0"
	.align 8
.LC51:
	.ascii "Expected ')' after else-if condition\0"
	.align 8
.LC52:
	.ascii "Expected '{' to start else-if body\0"
	.align 8
.LC53:
	.ascii "Failed to parse else-if body statement\0"
	.align 8
.LC54:
	.ascii "Expected '{' to start else body\0"
	.align 8
.LC55:
	.ascii "Failed to parse else body statement\0"
	.text
	.def	parse_if;	.scl	3;	.type	32;	.endef
parse_if:
	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-128, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -8(%rbp)
	movq	$0, -16(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L115
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L116
.L115:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC44(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L117
.L116:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L118
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC45(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L118:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L119
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L120
.L119:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC46(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L117
.L120:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L121
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L122
.L121:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC47(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L117
.L122:
	call	create_list
	movq	%rax, -32(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L123
.L125:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_statement
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L124
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC48(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L124:
	movq	-88(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
.L123:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L125
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L125
	call	create_list
	movq	%rax, -40(%rbp)
	call	create_list
	movq	%rax, -48(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L126
.L138:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L127
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L128
.L127:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC49(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L117
.L128:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L129
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC50(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L129:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L130
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L131
.L130:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC51(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L117
.L131:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L132
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L133
.L132:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC52(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L117
.L133:
	call	create_list
	movq	%rax, -64(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L134
.L136:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_statement
	movq	%rax, -72(%rbp)
	cmpq	$0, -72(%rbp)
	jne	.L135
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC53(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L135:
	movq	-72(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
.L134:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L136
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L136
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	create_else_if
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
.L126:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L137
	movq	.refptr.ELIF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L138
.L137:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L139
	movq	.refptr.ELSE_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L139
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L140
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L141
.L140:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC54(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L117
.L141:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L142
.L144:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_statement
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	jne	.L143
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC55(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L143:
	movq	-80(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
.L142:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L144
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L144
.L139:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	peek_current_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-48(%rbp), %r8
	movq	-40(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%r8, %r9
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	create_if
.L117:
	leave
	ret
	.section .rdata,"dr"
.LC56:
	.ascii "Expected '(' after 'for'\0"
	.align 8
.LC57:
	.ascii "Failed to parse for loop initializer\0"
	.align 8
.LC58:
	.ascii "Expected ';' after for loop initializer\0"
	.align 8
.LC59:
	.ascii "Failed to parse for loop condition\0"
	.align 8
.LC60:
	.ascii "Expected ';' after for loop condition\0"
	.align 8
.LC61:
	.ascii "Failed to parse for loop increment\0"
	.align 8
.LC62:
	.ascii "Expected ')' after for loop increment\0"
	.align 8
.LC63:
	.ascii "Expected '{' to start for loop body\0"
	.align 8
.LC64:
	.ascii "Failed to parse for loop body statement\0"
	.text
	.def	parse_for;	.scl	3;	.type	32;	.endef
parse_for:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$96, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -8(%rbp)
	movq	$0, -16(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L146
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L147
.L146:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC56(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L148
.L147:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	$0, -24(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L149
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L150
.L149:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_variable
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L151
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC57(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L151:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
.L150:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L152
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L153
.L152:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC58(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L148
.L153:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	$0, -32(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L154
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L155
.L154:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L156
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC59(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L156:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
.L155:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L157
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L158
.L157:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC60(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L148
.L158:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	$0, -40(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L159
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L160
.L159:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L161
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC61(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L161:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
.L160:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L162
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L163
.L162:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC62(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L148
.L163:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L164
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L165
.L164:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC63(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L148
.L165:
	call	create_list
	movq	%rax, -48(%rbp)
	movq	32(%rbp), %rax
	movb	$1, 2(%rax)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L166
.L168:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_statement
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L167
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC64(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L167:
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
.L166:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L168
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L168
	movq	32(%rbp), %rax
	movb	$0, 2(%rax)
	movq	-48(%rbp), %r8
	movq	-40(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%r8, %r9
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	create_for
.L148:
	leave
	ret
	.section .rdata,"dr"
.LC65:
	.ascii "Expected '(' after 'while'\0"
	.align 8
.LC66:
	.ascii "Failed to parse while condition\0"
	.align 8
.LC67:
	.ascii "Expected ')' after while condition\0"
	.align 8
.LC68:
	.ascii "Expected '{' to start while body\0"
	.align 8
.LC69:
	.ascii "Failed to parse while body statement\0"
	.text
	.def	parse_while;	.scl	3;	.type	32;	.endef
parse_while:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -8(%rbp)
	movq	$0, -16(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L170
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L171
.L170:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC65(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L172
.L171:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L173
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC66(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L173:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L174
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L175
.L174:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC67(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L172
.L175:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L176
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L177
.L176:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC68(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L172
.L177:
	call	create_list
	movq	%rax, -32(%rbp)
	movq	32(%rbp), %rax
	movb	$1, 2(%rax)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L178
.L180:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_statement
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L179
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC69(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L179:
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	list_append
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
.L178:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L180
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L180
	movq	32(%rbp), %rax
	movb	$0, 2(%rax)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	create_while
.L172:
	leave
	ret
	.section .rdata,"dr"
.LC70:
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
	movq	$0, -24(%rbp)
	movq	$0, -8(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L182
.L190:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_to_operator
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, %ecx
	call	operator_precedence
	movl	%eax, -32(%rbp)
	cmpl	$19, -28(%rbp)
	je	.L183
	movl	-32(%rbp), %eax
	cmpl	32(%rbp), %eax
	jl	.L183
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	48(%rbp), %rcx
	movq	40(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_primary
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L184
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC70(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L185
.L184:
	movq	-40(%rbp), %rax
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
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L186
.L189:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_to_operator
	movl	%eax, -44(%rbp)
	movl	-44(%rbp), %eax
	movl	%eax, %ecx
	call	operator_precedence
	movl	%eax, -48(%rbp)
	cmpl	$19, -44(%rbp)
	je	.L187
	movl	-48(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jle	.L187
	movq	40(%rbp), %r9
	movl	-48(%rbp), %r8d
	movq	-16(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	48(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movq	%rax, %rcx
	call	parse_expr_prec
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L188
	movl	$0, %eax
	jmp	.L185
.L188:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
.L186:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	je	.L189
.L187:
	movq	-16(%rbp), %rcx
	movq	24(%rbp), %rdx
	movl	-28(%rbp), %eax
	movq	%rcx, %r9
	movl	$0, %r8d
	movl	%eax, %ecx
	call	create_expression
	movq	%rax, 24(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
.L182:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	je	.L190
.L183:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	peek_current_token
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	24(%rbp), %rax
.L185:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC71:
	.ascii "Failed to parse expression primary\0"
	.text
	.def	parse_expression;	.scl	3;	.type	32;	.endef
parse_expression:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_primary
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L192
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	peek_current_token
	movq	%rax, %rdx
	leaq	.LC71(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L193
.L192:
	movq	-8(%rbp), %rax
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
.L193:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC72:
	.ascii "Failed to parse parenthesized expression\0"
.LC73:
	.ascii "Expected ')' after expression\0"
	.align 8
.LC74:
	.ascii "Failed to parse operand of unary '!'\0"
	.align 8
.LC75:
	.ascii "Failed to parse operand of unary '-'\0"
	.align 8
.LC76:
	.ascii "Failed to parse variable access\0"
	.align 8
.LC77:
	.ascii "Unexpected token in primary expression\0"
	.text
	.def	parse_primary;	.scl	3;	.type	32;	.endef
parse_primary:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$112, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -56(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	peek_current_token
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -40(%rbp)
	movq	-56(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$2, %eax
	jne	.L195
	movl	$0, -4(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L196
.L195:
	movq	-56(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$3, %eax
	jne	.L197
	movl	$1, -4(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L196
.L197:
	movq	-56(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$4, %eax
	jne	.L198
	movl	$2, -4(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L196
.L198:
	movq	-56(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L199
	movq	.refptr.TRUE_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L199
	movl	$3, -4(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L196
.L199:
	movq	-56(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L200
	movq	.refptr.FALSE_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L200
	movl	$4, -4(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L196
.L200:
	movq	-56(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L201
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L201
	movl	$5, -4(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L202
	movq	-48(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC72(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L203
.L202:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L204
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L213
.L204:
	movq	-48(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC73(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L203
.L201:
	movq	-56(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L206
	movq	.refptr.NOT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L206
	movl	$6, -4(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_primary
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L196
	movq	-48(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC74(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L203
.L206:
	movq	-56(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L208
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L208
	movl	$7, -4(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_primary
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L196
	movq	-48(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC75(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L203
.L208:
	movq	-56(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L210
	movq	-56(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L211
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L211
	movq	32(%rbp), %rax
	movzbl	1(%rax), %eax
	testb	%al, %al
	je	.L211
.L210:
	movl	$8, -4(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_variable_access
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L196
	movq	-48(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC76(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L203
.L211:
	movq	-48(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC77(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L203
.L213:
	nop
.L196:
	movq	-32(%rbp), %r9
	movq	-24(%rbp), %r8
	movq	-16(%rbp), %rdx
	movl	-4(%rbp), %eax
	movq	-40(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movl	%eax, %ecx
	call	create_primary
.L203:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC78:
	.ascii "Expected variable name in variable access\0"
	.align 8
.LC79:
	.ascii "Cannot call undefined variable\0"
	.align 8
.LC80:
	.ascii "Cannot call non-function variable\0"
	.align 8
.LC81:
	.ascii "Failed to parse function call argument\0"
	.align 8
.LC82:
	.ascii "Expected ',' or ')' after function call argument\0"
	.align 8
.LC83:
	.ascii "Failed to parse sequence index\0"
	.align 8
.LC84:
	.ascii "Expected ']' after sequence index\0"
	.align 8
.LC85:
	.ascii "Cannot access attribute without a valid scope\0"
	.align 8
.LC86:
	.ascii "Expected attribute name after '.'\0"
.LC87:
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
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L215
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L216
	movq	.refptr.SELF_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L215
.L216:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC78(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L217
.L215:
	movq	$0, -24(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -56(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	search
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	create_variable_access
	movq	%rax, -48(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L218
.L243:
	cmpq	$0, -32(%rbp)
	je	.L219
	movq	-32(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L220
	movq	-56(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	je	.L220
	movq	-56(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$2, %eax
	je	.L220
	movq	-56(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$3, %eax
	jne	.L221
.L220:
	movq	-56(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -24(%rbp)
	jmp	.L219
.L221:
	movq	-56(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$4, %eax
	je	.L222
	movq	-56(%rbp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	jne	.L219
.L222:
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
.L219:
	cmpq	$0, -40(%rbp)
	jne	.L223
	cmpq	$0, -24(%rbp)
	je	.L223
	movq	-24(%rbp), %rax
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$4, %eax
	jne	.L223
	movq	-64(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -40(%rbp)
.L223:
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L224
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L225
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC79(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L225:
	movq	-32(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$2, %eax
	je	.L226
	movq	-56(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$3, %eax
	je	.L226
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC80(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L226:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	call	create_list
	movq	%rax, -80(%rbp)
	jmp	.L227
.L232:
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L228
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC81(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L228:
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
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L229
	movq	.refptr.COMMA_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L229
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L227
.L229:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L231
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L227
.L231:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC82(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L217
.L227:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L232
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L232
	movq	-48(%rbp), %rax
	movq	-80(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$1, %ecx
	call	create_variable_access
	movq	%rax, -48(%rbp)
	movq	-56(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	$0, -24(%rbp)
	movq	$0, -40(%rbp)
	jmp	.L233
.L224:
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L234
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	parse_expression
	movq	%rax, -72(%rbp)
	cmpq	$0, -72(%rbp)
	jne	.L235
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC83(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
.L235:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L236
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L237
.L236:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC84(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L217
.L237:
	movq	-72(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	$0, 32(%rsp)
	movq	%rdx, %r9
	movl	$0, %r8d
	movq	%rax, %rdx
	movl	$3, %ecx
	call	create_variable_access
	movq	%rax, -48(%rbp)
	jmp	.L233
.L234:
	movq	.refptr.DOT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L244
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	get_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L239
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC85(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L217
.L239:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L240
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC86(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L217
.L240:
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	search
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L241
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC87(%rip), %rax
	movq	%rax, %rcx
	call	parser_error
	movl	$0, %eax
	jmp	.L217
.L241:
	movq	-32(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$2, %ecx
	call	create_variable_access
	movq	%rax, -48(%rbp)
	movq	$0, -24(%rbp)
	movq	$0, -40(%rbp)
.L233:
	movq	16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	peek_next_token
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
.L218:
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	je	.L243
	jmp	.L242
.L244:
	nop
.L242:
	movq	-48(%rbp), %rax
.L217:
	leave
	ret
	.ident	"GCC: (GNU) 13.2.0"
	.def	create_scope;	.scl	2;	.type	32;	.endef
	.def	create_name;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	parser_error;	.scl	2;	.type	32;	.endef
	.def	create_code_member;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	create_code;	.scl	2;	.type	32;	.endef
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.def	create_import;	.scl	2;	.type	32;	.endef
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.def	search;	.scl	2;	.type	32;	.endef
	.def	create_function;	.scl	2;	.type	32;	.endef
	.def	create_variable;	.scl	2;	.type	32;	.endef
	.def	create_method;	.scl	2;	.type	32;	.endef
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.def	create_class;	.scl	2;	.type	32;	.endef
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.def	create_else_if;	.scl	2;	.type	32;	.endef
	.def	create_if;	.scl	2;	.type	32;	.endef
	.def	create_for;	.scl	2;	.type	32;	.endef
	.def	create_while;	.scl	2;	.type	32;	.endef
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
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
