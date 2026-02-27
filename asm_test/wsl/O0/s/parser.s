	.file	"parser.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Failed to parse import statement"
	.align 8
.LC1:
	.string	"Failed to parse function declaration"
	.align 8
.LC2:
	.string	"Failed to parse class declaration"
	.align 8
.LC3:
	.string	"Unexpected token in code member"
	.text
	.globl	parse_code
	.type	parse_code, @function
parse_code:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%rdx, -88(%rbp)
	movq	builtin_scope(%rip), %rax
	testq	%rax, %rax
	jne	.L2
	movl	$0, %edi
	call	create_scope@PLT
	movq	%rax, builtin_scope(%rip)
	movq	builtin_scope(%rip), %rdx
	movq	VOID_KEYWORD(%rip), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	create_name@PLT
	movq	%rax, name_void(%rip)
	movq	builtin_scope(%rip), %rdx
	movq	INT_KEYWORD(%rip), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	create_name@PLT
	movq	%rax, name_int(%rip)
	movq	builtin_scope(%rip), %rdx
	movq	FLOAT_KEYWORD(%rip), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	create_name@PLT
	movq	%rax, name_float(%rip)
	movq	builtin_scope(%rip), %rdx
	movq	STRING_KEYWORD(%rip), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	create_name@PLT
	movq	%rax, name_string(%rip)
	movq	builtin_scope(%rip), %rdx
	movq	BOOL_KEYWORD(%rip), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	create_name@PLT
	movq	%rax, name_bool(%rip)
.L2:
	cmpq	$0, -80(%rbp)
	jne	.L3
	movq	builtin_scope(%rip), %rax
	movq	%rax, -80(%rbp)
.L3:
	movq	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	call	create_list@PLT
	movq	%rax, -40(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	create_scope@PLT
	movq	%rax, -32(%rbp)
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -48(%rbp)
	jmp	.L4
.L13:
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L5
	movq	IMPORT_KEYWORD(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L5
	movq	-32(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	parse_import
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L6
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L6:
	movq	-24(%rbp), %rax
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_code_member@PLT
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	list_append@PLT
	jmp	.L7
.L5:
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L8
	movq	FUNC_KEYWORD(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L8
	movq	-88(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-72(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_function
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L9
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L9:
	movq	-16(%rbp), %rax
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$1, %edi
	call	create_code_member@PLT
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	list_append@PLT
	jmp	.L7
.L8:
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L10
	movq	CLASS_KEYWORD(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L10
	movq	-88(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-72(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_class
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L11
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L11:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	movl	$0, %edx
	movl	$0, %esi
	movl	$2, %edi
	call	create_code_member@PLT
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	list_append@PLT
	jmp	.L7
.L10:
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L7:
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -48(%rbp)
.L4:
	cmpq	$0, -56(%rbp)
	je	.L12
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	jne	.L13
.L12:
	movq	-32(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	create_code@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	parse_code, .-parse_code
	.section	.rodata
	.align 8
.LC4:
	.string	"Expected identifier after 'import'"
	.align 8
.LC5:
	.string	"Expected string literal after 'from'"
	.align 8
.LC6:
	.string	"Expected ';' at end of import statement"
	.text
	.type	parse_import, @function
parse_import:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L16
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L17
.L16:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	$0, -24(%rbp)
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L18
	movq	FROM_KEYWORD(%rip), %rdx
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L18
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$4, %eax
	je	.L19
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L17
.L19:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
.L18:
	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L20
	movq	SEMICOLON_SYMBOL(%rip), %rdx
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L21
.L20:
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L17
.L21:
	movq	-64(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_import_file@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L22
	movq	name_void(%rip), %rdx
	movq	-64(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %r8
	movl	$0, %ecx
	movl	$1, %esi
	movq	%rax, %rdi
	call	create_name@PLT
	movq	%rax, -16(%rbp)
.L22:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	create_import@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	parse_import, .-parse_import
	.section	.rodata
	.align 8
.LC7:
	.string	"Expected function return type after 'func'"
.LC8:
	.string	"Unknown function return type"
	.align 8
.LC9:
	.string	"Expected function name after return type"
	.align 8
.LC10:
	.string	"Expected '(' after function name"
	.align 8
.LC11:
	.string	"Failed to parse function parameter"
	.align 8
.LC12:
	.string	"Function parameters cannot have default values"
	.align 8
.LC13:
	.string	"Expected ',' or ')' after function parameter"
	.align 8
.LC14:
	.string	"Expected '{' to start function body"
	.align 8
.LC15:
	.string	"Failed to parse function body statement"
	.align 8
.LC16:
	.string	"Unreachable code after return statement"
	.align 8
.LC17:
	.string	"Function missing return statement"
	.text
	.type	parse_function, @function
parse_function:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%rdi, -88(%rbp)
	movq	%rsi, -96(%rbp)
	movq	%rdx, -104(%rbp)
	movq	$0, -72(%rbp)
	movq	$0, -64(%rbp)
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	create_scope@PLT
	movq	%rax, -56(%rbp)
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L24
	movq	-64(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L25
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	is_builtin_type@PLT
	testb	%al, %al
	jne	.L24
.L25:
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L26
.L24:
	movq	-64(%rbp), %rax
	movq	(%rax), %rdx
	movq	-96(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	search@PLT
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L27
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L26
.L27:
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L28
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L26
.L28:
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	-96(%rbp), %rcx
	movq	-48(%rbp), %rdx
	movq	%rcx, %r8
	movl	$0, %ecx
	movl	$2, %esi
	movq	%rax, %rdi
	call	create_name@PLT
	movq	%rax, -40(%rbp)
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L29
	movq	L_PAREN_SYMBOL(%rip), %rdx
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L30
.L29:
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L26
.L30:
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, -64(%rbp)
	call	create_list@PLT
	movq	%rax, -32(%rbp)
	jmp	.L31
.L38:
	movq	-104(%rbp), %rdx
	movq	-56(%rbp), %rcx
	movq	-88(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_variable
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L32
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	jmp	.L33
.L32:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L34
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	jmp	.L33
.L34:
	movq	-8(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	list_append@PLT
.L33:
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L35
	movq	COMMA_SYMBOL(%rip), %rdx
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L35
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, -64(%rbp)
	jmp	.L31
.L35:
	movq	-64(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L37
	movq	R_PAREN_SYMBOL(%rip), %rdx
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L31
.L37:
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L26
.L31:
	movq	-64(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L38
	movq	R_PAREN_SYMBOL(%rip), %rdx
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L38
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L39
	movq	L_BRACE_SYMBOL(%rip), %rdx
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L40
.L39:
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L26
.L40:
	call	create_list@PLT
	movq	%rax, -24(%rbp)
	movq	-104(%rbp), %rax
	movb	$1, (%rax)
	movb	$0, -73(%rbp)
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, -64(%rbp)
	jmp	.L41
.L45:
	movq	-104(%rbp), %rdx
	movq	-56(%rbp), %rcx
	movq	-88(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_statement
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L42
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	jmp	.L43
.L42:
	cmpb	$0, -73(%rbp)
	je	.L43
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L43:
	movq	-16(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$5, %eax
	jne	.L44
	movb	$1, -73(%rbp)
.L44:
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	list_append@PLT
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, -64(%rbp)
.L41:
	movq	-64(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L45
	movq	R_BRACE_SYMBOL(%rip), %rdx
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L45
	movq	-104(%rbp), %rax
	movb	$0, (%rax)
	cmpb	$0, -73(%rbp)
	jne	.L46
	movq	name_void(%rip), %rax
	cmpq	%rax, -48(%rbp)
	je	.L46
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L46:
	movq	-56(%rbp), %rdi
	movq	-24(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	-40(%rbp), %rax
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	create_function@PLT
.L26:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	parse_function, .-parse_function
	.section	.rodata
	.align 8
.LC18:
	.string	"Expected method return type after 'method'"
	.align 8
.LC19:
	.string	"Unknown return type for method"
	.align 8
.LC20:
	.string	"Expected method name after return type"
	.align 8
.LC21:
	.string	"Expected '(' after method name"
	.align 8
.LC22:
	.string	"Expected 'self' as first parameter of method"
	.align 8
.LC23:
	.string	"Expected ',' or ')' after method parameter"
	.align 8
.LC24:
	.string	"Failed to parse method parameter"
	.align 8
.LC25:
	.string	"Method parameters cannot have default values"
	.align 8
.LC26:
	.string	"Expected '{' to start method body"
	.align 8
.LC27:
	.string	"Failed to parse method body statement"
	.align 8
.LC28:
	.string	"Method missing return statement"
	.text
	.type	parse_method, @function
parse_method:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%rdx, -120(%rbp)
	movq	%rcx, -128(%rbp)
	movq	$0, -80(%rbp)
	movq	$0, -72(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	create_scope@PLT
	movq	%rax, -64(%rbp)
	movq	SELF_KEYWORD(%rip), %rax
	movq	-64(%rbp), %rcx
	movq	-120(%rbp), %rdx
	movq	%rcx, %r8
	movl	$0, %ecx
	movl	$1, %esi
	movq	%rax, %rdi
	call	create_name@PLT
	movq	%rax, -56(%rbp)
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L48
	movq	-72(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L49
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	is_builtin_type@PLT
	testb	%al, %al
	jne	.L48
.L49:
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L50
.L48:
	movq	-72(%rbp), %rax
	movq	(%rax), %rdx
	movq	-112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	search@PLT
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L51
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L50
.L51:
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L52
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L50
.L52:
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	-112(%rbp), %rcx
	movq	-48(%rbp), %rdx
	movq	%rcx, %r8
	movl	$0, %ecx
	movl	$3, %esi
	movq	%rax, %rdi
	call	create_name@PLT
	movq	%rax, -40(%rbp)
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L53
	movq	L_PAREN_SYMBOL(%rip), %rdx
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L54
.L53:
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L50
.L54:
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L55
	movq	SELF_KEYWORD(%rip), %rdx
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L56
.L55:
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L56:
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, -72(%rbp)
	call	create_list@PLT
	movq	%rax, -32(%rbp)
	movq	-56(%rbp), %rcx
	movq	-120(%rbp), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	create_variable@PLT
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	list_append@PLT
	jmp	.L57
.L65:
	movq	-72(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L58
	movq	COMMA_SYMBOL(%rip), %rdx
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L58
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-128(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movq	-104(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_variable
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L59
	jmp	.L74
.L58:
	movq	-72(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L61
	movq	R_PAREN_SYMBOL(%rip), %rdx
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L62
.L61:
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L50
.L59:
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	jmp	.L63
.L74:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L64
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	jmp	.L63
.L64:
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	list_append@PLT
.L63:
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, -72(%rbp)
.L57:
	movq	-72(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L65
	movq	R_PAREN_SYMBOL(%rip), %rdx
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L65
.L62:
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L66
	movq	L_BRACE_SYMBOL(%rip), %rdx
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L67
.L66:
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L50
.L67:
	call	create_list@PLT
	movq	%rax, -16(%rbp)
	movq	-128(%rbp), %rax
	movb	$1, (%rax)
	movq	-128(%rbp), %rax
	movb	$1, 1(%rax)
	movb	$0, -81(%rbp)
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, -72(%rbp)
	jmp	.L68
.L72:
	movq	-128(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movq	-104(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_statement
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L69
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	jmp	.L70
.L69:
	cmpb	$0, -81(%rbp)
	je	.L70
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L70:
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$5, %eax
	jne	.L71
	movb	$1, -81(%rbp)
.L71:
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	list_append@PLT
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, -72(%rbp)
.L68:
	movq	-72(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L72
	movq	R_BRACE_SYMBOL(%rip), %rdx
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L72
	movq	-128(%rbp), %rax
	movb	$0, (%rax)
	movq	-128(%rbp), %rax
	movb	$0, 1(%rax)
	cmpb	$0, -81(%rbp)
	jne	.L73
	movq	name_void(%rip), %rax
	cmpq	%rax, -48(%rbp)
	je	.L73
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L73:
	movq	-64(%rbp), %rdi
	movq	-16(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	-40(%rbp), %rax
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	create_method@PLT
.L50:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	parse_method, .-parse_method
	.section	.rodata
	.align 8
.LC29:
	.string	"Expected class name after 'class'"
	.align 8
.LC30:
	.string	"Expected '{' to start class body"
.LC31:
	.string	"Failed to parse class method"
	.align 8
.LC32:
	.string	"Failed to parse class variable"
	.align 8
.LC33:
	.string	"Expected ';' after class variable declaration"
	.align 8
.LC34:
	.string	"Unexpected token in class member"
	.text
	.type	parse_class, @function
parse_class:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%rdx, -88(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	create_scope@PLT
	movq	%rax, -40(%rbp)
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L76
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L77
.L76:
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	-80(%rbp), %rcx
	movq	-40(%rbp), %rdx
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movl	$0, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	create_name@PLT
	movq	%rax, -32(%rbp)
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L78
	movq	L_BRACE_SYMBOL(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L79
.L78:
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L77
.L79:
	call	create_list@PLT
	movq	%rax, -24(%rbp)
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -48(%rbp)
	jmp	.L80
.L88:
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L81
	movq	METHOD_KEYWORD(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L81
	movq	-88(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	parse_method
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L82
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC31(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L82:
	movq	-16(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	create_class_member@PLT
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	list_append@PLT
	jmp	.L83
.L81:
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L84
	movq	VAR_KEYWORD(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L84
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-88(%rbp), %rdx
	movq	-40(%rbp), %rcx
	movq	-72(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_variable
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L85
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L85:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$1, %edi
	call	create_class_member@PLT
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	list_append@PLT
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L86
	movq	SEMICOLON_SYMBOL(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L89
.L86:
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	jmp	.L89
.L84:
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC34(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	jmp	.L83
.L89:
	nop
.L83:
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -48(%rbp)
.L80:
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L88
	movq	R_BRACE_SYMBOL(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L88
	movq	-40(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	-32(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	create_class@PLT
.L77:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	parse_class, .-parse_class
	.section	.rodata
.LC35:
	.string	"Expected variable type"
	.align 8
.LC36:
	.string	"Expected a type for variable declaration"
.LC37:
	.string	"Unknown variable type"
.LC38:
	.string	"Expected variable name"
	.align 8
.LC39:
	.string	"Failed to parse variable initializer"
	.text
	.type	parse_variable, @function
parse_variable:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	peek_current_token@PLT
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L91
	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L92
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	is_builtin_type@PLT
	testb	%al, %al
	jne	.L91
.L92:
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC35(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L93
.L91:
	movq	-32(%rbp), %rax
	movq	(%rax), %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	search@PLT
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L94
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	je	.L95
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$4, %eax
	je	.L95
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC36(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	jmp	.L95
.L94:
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC37(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L95:
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L96
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC38(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L96:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	-64(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	%rcx, %r8
	movl	$0, %ecx
	movl	$1, %esi
	movq	%rax, %rdi
	call	create_name@PLT
	movq	%rax, -8(%rbp)
	movq	$0, -48(%rbp)
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	peek_next_token@PLT
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L97
	movq	ASSIGN_SYMBOL(%rip), %rdx
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L97
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-72(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_expression
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L97
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC39(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L97:
	movq	-48(%rbp), %rdx
	movq	-8(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	create_variable@PLT
.L93:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	parse_variable, .-parse_variable
	.section	.rodata
	.align 8
.LC40:
	.string	"Cannot use 'break' outside of a loop"
	.align 8
.LC41:
	.string	"Cannot use 'continue' outside of a loop"
.LC42:
	.string	"Failed to parse statement"
.LC43:
	.string	"Expected ';' after statement"
	.text
	.type	parse_statement, @function
parse_statement:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -8(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	peek_current_token@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	$0, -24(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L99
	movq	IF_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L100
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_if
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$2, %edi
	call	create_statement@PLT
	jmp	.L101
.L100:
	movq	FOR_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L102
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_for
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rcx
	movl	$0, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	create_statement@PLT
	jmp	.L101
.L102:
	movq	WHILE_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L103
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_while
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$3, %edi
	call	create_statement@PLT
	jmp	.L101
.L103:
	movq	VAR_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L104
	movq	-40(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_variable
	movq	%rax, %r9
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$1, %edi
	call	create_statement@PLT
	movq	%rax, -24(%rbp)
	jmp	.L105
.L104:
	movq	RETURN_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L106
	movq	-40(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_expression
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$5, %edi
	call	create_statement@PLT
	movq	%rax, -24(%rbp)
	jmp	.L105
.L106:
	movq	BREAK_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L107
	movq	-56(%rbp), %rax
	movzbl	2(%rax), %eax
	testb	%al, %al
	jne	.L108
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC40(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L101
.L108:
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$6, %edi
	call	create_statement@PLT
	movq	%rax, -24(%rbp)
	jmp	.L105
.L107:
	movq	CONTINUE_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L109
	movq	-56(%rbp), %rax
	movzbl	2(%rax), %eax
	testb	%al, %al
	jne	.L110
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC41(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L101
.L110:
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$7, %edi
	call	create_statement@PLT
	movq	%rax, -24(%rbp)
	jmp	.L105
.L109:
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_expression
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_statement@PLT
	movq	%rax, -24(%rbp)
	jmp	.L105
.L99:
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_expression
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	create_statement@PLT
	movq	%rax, -24(%rbp)
.L105:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	peek_current_token@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L111
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC42(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L111:
	movq	-40(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L112
	movq	SEMICOLON_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L113
.L112:
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC43(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L113:
	movq	-24(%rbp), %rax
.L101:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	parse_statement, .-parse_statement
	.section	.rodata
.LC44:
	.string	"Expected '(' after 'if'"
.LC45:
	.string	"Failed to parse if condition"
	.align 8
.LC46:
	.string	"Expected ')' after if condition"
.LC47:
	.string	"Expected '{' to start if body"
	.align 8
.LC48:
	.string	"Failed to parse if body statement"
.LC49:
	.string	"Expected '(' after 'elif'"
	.align 8
.LC50:
	.string	"Failed to parse else-if condition"
	.align 8
.LC51:
	.string	"Expected ')' after else-if condition"
	.align 8
.LC52:
	.string	"Expected '{' to start else-if body"
	.align 8
.LC53:
	.string	"Failed to parse else-if body statement"
	.align 8
.LC54:
	.string	"Expected '{' to start else body"
	.align 8
.LC55:
	.string	"Failed to parse else body statement"
	.text
	.type	parse_if, @function
parse_if:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%rdx, -120(%rbp)
	movq	$0, -88(%rbp)
	movq	$0, -80(%rbp)
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L115
	movq	L_PAREN_SYMBOL(%rip), %rdx
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L116
.L115:
	movq	-88(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC44(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L117
.L116:
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-120(%rbp), %rdx
	movq	-112(%rbp), %rcx
	movq	-104(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_expression
	movq	%rax, -72(%rbp)
	cmpq	$0, -72(%rbp)
	jne	.L118
	movq	-88(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC45(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L118:
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L119
	movq	R_PAREN_SYMBOL(%rip), %rdx
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L120
.L119:
	movq	-88(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC46(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L117
.L120:
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L121
	movq	L_BRACE_SYMBOL(%rip), %rdx
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L122
.L121:
	movq	-88(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC47(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L117
.L122:
	call	create_list@PLT
	movq	%rax, -64(%rbp)
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	jmp	.L123
.L125:
	movq	-120(%rbp), %rdx
	movq	-112(%rbp), %rcx
	movq	-104(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_statement
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L124
	movq	-88(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC48(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L124:
	movq	-8(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	list_append@PLT
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
.L123:
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L125
	movq	R_BRACE_SYMBOL(%rip), %rdx
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L125
	call	create_list@PLT
	movq	%rax, -56(%rbp)
	call	create_list@PLT
	movq	%rax, -48(%rbp)
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	peek_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	jmp	.L126
.L138:
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L127
	movq	L_PAREN_SYMBOL(%rip), %rdx
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L128
.L127:
	movq	-88(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC49(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L117
.L128:
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-120(%rbp), %rdx
	movq	-112(%rbp), %rcx
	movq	-104(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_expression
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L129
	movq	-88(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC50(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L129:
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L130
	movq	R_PAREN_SYMBOL(%rip), %rdx
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L131
.L130:
	movq	-88(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC51(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L117
.L131:
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L132
	movq	L_BRACE_SYMBOL(%rip), %rdx
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L133
.L132:
	movq	-88(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC52(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L117
.L133:
	call	create_list@PLT
	movq	%rax, -32(%rbp)
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	jmp	.L134
.L136:
	movq	-120(%rbp), %rdx
	movq	-112(%rbp), %rcx
	movq	-104(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_statement
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L135
	movq	-88(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC53(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L135:
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	list_append@PLT
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
.L134:
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L136
	movq	R_BRACE_SYMBOL(%rip), %rdx
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L136
	movq	-32(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	create_else_if@PLT
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	list_append@PLT
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	peek_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
.L126:
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L137
	movq	ELIF_KEYWORD(%rip), %rdx
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L138
.L137:
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L139
	movq	ELSE_KEYWORD(%rip), %rdx
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L139
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L140
	movq	L_BRACE_SYMBOL(%rip), %rdx
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L141
.L140:
	movq	-88(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC54(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L117
.L141:
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	jmp	.L142
.L144:
	movq	-120(%rbp), %rdx
	movq	-112(%rbp), %rcx
	movq	-104(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_statement
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L143
	movq	-88(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC55(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L143:
	movq	-16(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	list_append@PLT
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
.L142:
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L144
	movq	R_BRACE_SYMBOL(%rip), %rdx
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L144
.L139:
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	peek_current_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-48(%rbp), %rcx
	movq	-56(%rbp), %rdx
	movq	-64(%rbp), %rsi
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	create_if@PLT
.L117:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	parse_if, .-parse_if
	.section	.rodata
.LC56:
	.string	"Expected '(' after 'for'"
	.align 8
.LC57:
	.string	"Failed to parse for loop initializer"
	.align 8
.LC58:
	.string	"Expected ';' after for loop initializer"
	.align 8
.LC59:
	.string	"Failed to parse for loop condition"
	.align 8
.LC60:
	.string	"Expected ';' after for loop condition"
	.align 8
.LC61:
	.string	"Failed to parse for loop increment"
	.align 8
.LC62:
	.string	"Expected ')' after for loop increment"
	.align 8
.LC63:
	.string	"Expected '{' to start for loop body"
	.align 8
.LC64:
	.string	"Failed to parse for loop body statement"
	.text
	.type	parse_for, @function
parse_for:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%rdx, -88(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L146
	movq	L_PAREN_SYMBOL(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L147
.L146:
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC56(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L148
.L147:
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	$0, -40(%rbp)
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L149
	movq	SEMICOLON_SYMBOL(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L150
.L149:
	movq	-88(%rbp), %rdx
	movq	-80(%rbp), %rcx
	movq	-72(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_variable
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L151
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC57(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L151:
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -48(%rbp)
.L150:
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L152
	movq	SEMICOLON_SYMBOL(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L153
.L152:
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC58(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L148
.L153:
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	$0, -32(%rbp)
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L154
	movq	SEMICOLON_SYMBOL(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L155
.L154:
	movq	-88(%rbp), %rdx
	movq	-80(%rbp), %rcx
	movq	-72(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_expression
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L156
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC59(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L156:
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -48(%rbp)
.L155:
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L157
	movq	SEMICOLON_SYMBOL(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L158
.L157:
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC60(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L148
.L158:
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	$0, -24(%rbp)
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L159
	movq	R_PAREN_SYMBOL(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L160
.L159:
	movq	-88(%rbp), %rdx
	movq	-80(%rbp), %rcx
	movq	-72(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_expression
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L161
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC61(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L161:
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -48(%rbp)
.L160:
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L162
	movq	R_PAREN_SYMBOL(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L163
.L162:
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC62(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L148
.L163:
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L164
	movq	L_BRACE_SYMBOL(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L165
.L164:
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC63(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L148
.L165:
	call	create_list@PLT
	movq	%rax, -16(%rbp)
	movq	-88(%rbp), %rax
	movb	$1, 2(%rax)
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -48(%rbp)
	jmp	.L166
.L168:
	movq	-88(%rbp), %rdx
	movq	-80(%rbp), %rcx
	movq	-72(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_statement
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L167
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC64(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L167:
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	list_append@PLT
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -48(%rbp)
.L166:
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L168
	movq	R_BRACE_SYMBOL(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L168
	movq	-88(%rbp), %rax
	movb	$0, 2(%rax)
	movq	-16(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	create_for@PLT
.L148:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	parse_for, .-parse_for
	.section	.rodata
.LC65:
	.string	"Expected '(' after 'while'"
	.align 8
.LC66:
	.string	"Failed to parse while condition"
	.align 8
.LC67:
	.string	"Expected ')' after while condition"
	.align 8
.LC68:
	.string	"Expected '{' to start while body"
	.align 8
.LC69:
	.string	"Failed to parse while body statement"
	.text
	.type	parse_while, @function
parse_while:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L170
	movq	L_PAREN_SYMBOL(%rip), %rdx
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L171
.L170:
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC65(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L172
.L171:
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-72(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_expression
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L173
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC66(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L173:
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L174
	movq	R_PAREN_SYMBOL(%rip), %rdx
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L175
.L174:
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC67(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L172
.L175:
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L176
	movq	L_BRACE_SYMBOL(%rip), %rdx
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L177
.L176:
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC68(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L172
.L177:
	call	create_list@PLT
	movq	%rax, -16(%rbp)
	movq	-72(%rbp), %rax
	movb	$1, 2(%rax)
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
	jmp	.L178
.L180:
	movq	-72(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_statement
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L179
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC69(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L179:
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	list_append@PLT
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
.L178:
	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L180
	movq	R_BRACE_SYMBOL(%rip), %rdx
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L180
	movq	-72(%rbp), %rax
	movb	$0, 2(%rax)
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	create_while@PLT
.L172:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	parse_while, .-parse_while
	.section	.rodata
.LC70:
	.string	"Failed to parse right operand"
	.text
	.type	parse_expr_prec, @function
parse_expr_prec:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%r8, -88(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -32(%rbp)
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	peek_next_token@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)
	jmp	.L182
.L190:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	string_to_operator@PLT
	movl	%eax, -48(%rbp)
	movl	-48(%rbp), %eax
	movl	%eax, %edi
	call	operator_precedence@PLT
	movl	%eax, -44(%rbp)
	cmpl	$19, -48(%rbp)
	je	.L183
	movl	-44(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L183
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-88(%rbp), %rdx
	movq	-80(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_primary
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L184
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC70(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L185
.L184:
	movq	-8(%rbp), %rax
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$19, %edi
	call	create_expression@PLT
	movq	%rax, -24(%rbp)
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	peek_next_token@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)
	jmp	.L186
.L189:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	string_to_operator@PLT
	movl	%eax, -40(%rbp)
	movl	-40(%rbp), %eax
	movl	%eax, %edi
	call	operator_precedence@PLT
	movl	%eax, -36(%rbp)
	cmpl	$19, -40(%rbp)
	je	.L187
	movl	-36(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jle	.L187
	movq	-88(%rbp), %rdi
	movq	-80(%rbp), %rcx
	movl	-36(%rbp), %edx
	movq	-24(%rbp), %rsi
	movq	-56(%rbp), %rax
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	parse_expr_prec
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L188
	movl	$0, %eax
	jmp	.L185
.L188:
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	peek_next_token@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)
.L186:
	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	je	.L189
.L187:
	movq	-24(%rbp), %rdx
	movq	-64(%rbp), %rsi
	movl	-48(%rbp), %eax
	movq	%rdx, %rcx
	movl	$0, %edx
	movl	%eax, %edi
	call	create_expression@PLT
	movq	%rax, -64(%rbp)
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	peek_next_token@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)
.L182:
	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	je	.L190
.L183:
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	peek_current_token@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-64(%rbp), %rax
.L185:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	parse_expr_prec, .-parse_expr_prec
	.section	.rodata
	.align 8
.LC71:
	.string	"Failed to parse expression primary"
	.text
	.type	parse_expression, @function
parse_expression:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_primary
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L192
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	peek_current_token@PLT
	movq	%rax, %rsi
	leaq	.LC71(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L193
.L192:
	movq	-8(%rbp), %rax
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$19, %edi
	call	create_expression@PLT
	movq	%rax, %rsi
	movq	-40(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	parse_expr_prec
.L193:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	parse_expression, .-parse_expression
	.section	.rodata
	.align 8
.LC72:
	.string	"Failed to parse parenthesized expression"
.LC73:
	.string	"Expected ')' after expression"
	.align 8
.LC74:
	.string	"Failed to parse operand of unary '!'"
	.align 8
.LC75:
	.string	"Failed to parse operand of unary '-'"
	.align 8
.LC76:
	.string	"Failed to parse variable access"
	.align 8
.LC77:
	.string	"Unexpected token in primary expression"
	.text
	.type	parse_primary, @function
parse_primary:
.LFB18:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%rdx, -88(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -8(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	peek_current_token@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$2, %eax
	jne	.L195
	movl	$0, -52(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	jmp	.L196
.L195:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$3, %eax
	jne	.L197
	movl	$1, -52(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	jmp	.L196
.L197:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$4, %eax
	jne	.L198
	movl	$2, -52(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	jmp	.L196
.L198:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L199
	movq	TRUE_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L199
	movl	$3, -52(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	jmp	.L196
.L199:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L200
	movq	FALSE_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L200
	movl	$4, -52(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	jmp	.L196
.L200:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L201
	movq	L_PAREN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L201
	movl	$5, -52(%rbp)
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-88(%rbp), %rdx
	movq	-80(%rbp), %rcx
	movq	-72(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_expression
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L202
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC72(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L203
.L202:
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L204
	movq	R_PAREN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L213
.L204:
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC73(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L203
.L201:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L206
	movq	NOT_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L206
	movl	$6, -52(%rbp)
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-88(%rbp), %rdx
	movq	-80(%rbp), %rcx
	movq	-72(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_primary
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L196
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC74(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L203
.L206:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L208
	movq	SUB_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L208
	movl	$7, -52(%rbp)
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-88(%rbp), %rdx
	movq	-80(%rbp), %rcx
	movq	-72(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_primary
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L196
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC75(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L203
.L208:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L210
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L211
	movq	SELF_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L211
	movq	-88(%rbp), %rax
	movzbl	1(%rax), %eax
	testb	%al, %al
	je	.L211
.L210:
	movl	$8, -52(%rbp)
	movq	-88(%rbp), %rdx
	movq	-80(%rbp), %rcx
	movq	-72(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_variable_access
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L196
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC76(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L203
.L211:
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC77(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L203
.L213:
	nop
.L196:
	movq	-24(%rbp), %rdi
	movq	-32(%rbp), %rcx
	movq	-40(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movl	-52(%rbp), %eax
	movq	%rdi, %r8
	movl	%eax, %edi
	call	create_primary@PLT
.L203:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	parse_primary, .-parse_primary
	.section	.rodata
	.align 8
.LC78:
	.string	"Expected variable name in variable access"
	.align 8
.LC79:
	.string	"Cannot call undefined variable"
	.align 8
.LC80:
	.string	"Cannot call non-function variable"
	.align 8
.LC81:
	.string	"Failed to parse function call argument"
	.align 8
.LC82:
	.string	"Expected ',' or ')' after function call argument"
	.align 8
.LC83:
	.string	"Failed to parse sequence index"
	.align 8
.LC84:
	.string	"Expected ']' after sequence index"
	.align 8
.LC85:
	.string	"Cannot access attribute without a valid scope"
	.align 8
.LC86:
	.string	"Expected attribute name after '.'"
.LC87:
	.string	"Unknown attribute name"
	.text
	.type	parse_variable_access, @function
parse_variable_access:
.LFB19:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%rdx, -120(%rbp)
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	peek_current_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L215
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L216
	movq	SELF_KEYWORD(%rip), %rdx
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L215
.L216:
	movq	-88(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC78(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L217
.L215:
	movq	$0, -72(%rbp)
	movq	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -40(%rbp)
	movq	-80(%rbp), %rax
	movq	(%rax), %rdx
	movq	-112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	search@PLT
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	create_variable_access@PLT
	movq	%rax, -48(%rbp)
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	peek_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	jmp	.L218
.L243:
	cmpq	$0, -64(%rbp)
	je	.L219
	movq	-64(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L220
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	je	.L220
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$2, %eax
	je	.L220
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$3, %eax
	jne	.L221
.L220:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -72(%rbp)
	jmp	.L219
.L221:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$4, %eax
	je	.L222
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	jne	.L219
.L222:
	movq	-64(%rbp), %rax
	movq	%rax, -72(%rbp)
.L219:
	cmpq	$0, -56(%rbp)
	jne	.L223
	cmpq	$0, -72(%rbp)
	je	.L223
	movq	-72(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$4, %eax
	jne	.L223
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -56(%rbp)
.L223:
	movq	L_PAREN_SYMBOL(%rip), %rdx
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L224
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.L225
	movq	-88(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC79(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L225:
	movq	-64(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$2, %eax
	je	.L226
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$3, %eax
	je	.L226
	movq	-88(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC80(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L226:
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	call	create_list@PLT
	movq	%rax, -16(%rbp)
	jmp	.L227
.L232:
	movq	-120(%rbp), %rdx
	movq	-112(%rbp), %rcx
	movq	-104(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_expression
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L228
	movq	-88(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC81(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L228:
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	list_append@PLT
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L229
	movq	COMMA_SYMBOL(%rip), %rdx
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L229
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	jmp	.L227
.L229:
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L231
	movq	R_PAREN_SYMBOL(%rip), %rdx
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L227
.L231:
	movq	-88(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC82(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L217
.L227:
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L232
	movq	R_PAREN_SYMBOL(%rip), %rdx
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L232
	movq	-16(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$1, %edi
	call	create_variable_access@PLT
	movq	%rax, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -64(%rbp)
	movq	$0, -72(%rbp)
	movq	$0, -56(%rbp)
	jmp	.L233
.L224:
	movq	L_BRACKET_SYMBOL(%rip), %rdx
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L234
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-120(%rbp), %rdx
	movq	-112(%rbp), %rcx
	movq	-104(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_expression
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L235
	movq	-88(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC83(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
.L235:
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L236
	movq	R_BRACKET_SYMBOL(%rip), %rdx
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L237
.L236:
	movq	-88(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC84(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L217
.L237:
	movq	-24(%rbp), %rdx
	movq	-48(%rbp), %rax
	movl	$0, %r8d
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$3, %edi
	call	create_variable_access@PLT
	movq	%rax, -48(%rbp)
	jmp	.L233
.L234:
	movq	DOT_SYMBOL(%rip), %rdx
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L244
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L239
	movq	-88(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC85(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L217
.L239:
	movq	-80(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L240
	movq	-88(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC86(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L217
.L240:
	movq	-80(%rbp), %rax
	movq	(%rax), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	search@PLT
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.L241
	movq	-88(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC87(%rip), %rax
	movq	%rax, %rdi
	call	parser_error@PLT
	movl	$0, %eax
	jmp	.L217
.L241:
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rsi
	movl	$2, %edi
	call	create_variable_access@PLT
	movq	%rax, -48(%rbp)
	movq	$0, -72(%rbp)
	movq	$0, -56(%rbp)
.L233:
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	peek_next_token@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
.L218:
	movq	-80(%rbp), %rax
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
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	parse_variable_access, .-parse_variable_access
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
