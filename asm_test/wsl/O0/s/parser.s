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
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movq	builtin_scope(%rip), %rax
	testq	%rax, %rax
	jne	.L2
	movl	$0, %edi
	call	*create_symbol_table@GOTPCREL(%rip)
	movq	%rax, builtin_scope(%rip)
	movq	builtin_scope(%rip), %rdx
	movq	VOID_KEYWORD(%rip), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movl	$6, %esi
	movq	%rax, %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, name_void(%rip)
	movq	builtin_scope(%rip), %rdx
	movq	INT_KEYWORD(%rip), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movl	$6, %esi
	movq	%rax, %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, name_int(%rip)
	movq	builtin_scope(%rip), %rdx
	movq	FLOAT_KEYWORD(%rip), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movl	$6, %esi
	movq	%rax, %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, name_float(%rip)
	movq	builtin_scope(%rip), %rdx
	movq	STRING_KEYWORD(%rip), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movl	$6, %esi
	movq	%rax, %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, name_string(%rip)
	movq	builtin_scope(%rip), %rdx
	movq	BOOL_KEYWORD(%rip), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movl	$6, %esi
	movq	%rax, %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, name_bool(%rip)
.L2:
	cmpq	$0, -64(%rbp)
	jne	.L3
	movq	builtin_scope(%rip), %rax
	movq	%rax, -64(%rbp)
.L3:
	movq	$0, -8(%rbp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	*create_symbol_table@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	jmp	.L4
.L13:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L5
	movq	IMPORT_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L5
	movq	-72(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_import
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L6
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L6:
	movq	-32(%rbp), %rax
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	*create_code_member@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L7
.L5:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L8
	movq	FUNC_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L8
	movq	-72(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_function
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L9
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L9:
	movq	-40(%rbp), %rax
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$1, %edi
	call	*create_code_member@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L7
.L8:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L10
	movq	CLASS_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L10
	movq	-72(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_class
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L11
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L11:
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$0, %edx
	movl	$0, %esi
	movl	$2, %edi
	call	*create_code_member@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L7
.L10:
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L7:
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
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
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*create_code@GOTPCREL(%rip)
	leave
	ret
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
.LC7:
	.string	"Failed to import module"
	.text
	.type	parse_import, @function
parse_import:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	$0, -8(%rbp)
	movq	-40(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L16
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L17
.L16:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	$0, -16(%rbp)
	movq	-40(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L18
	movq	FROM_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L18
	movq	-40(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$4, %eax
	je	.L19
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L17
.L19:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-40(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
.L18:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L20
	movq	SEMICOLON_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L21
.L20:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L17
.L21:
	movq	-56(%rbp), %rax
	movq	(%rax), %rcx
	movq	-48(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	*parse_import_file@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L22
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movq	name_void(%rip), %rdx
	movq	-48(%rbp), %rcx
	movq	-32(%rbp), %rax
	movl	$3, %esi
	movq	%rax, %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
.L22:
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*create_import@GOTPCREL(%rip)
.L17:
	leave
	ret
	.size	parse_import, .-parse_import
	.section	.rodata
	.align 8
.LC8:
	.string	"Expected function return type after 'func'"
.LC9:
	.string	"Unknown function return type"
	.align 8
.LC10:
	.string	"Expected function name after return type"
	.align 8
.LC11:
	.string	"Expected '(' after function name"
	.align 8
.LC12:
	.string	"Failed to parse function parameter"
	.align 8
.LC13:
	.string	"Function parameters cannot have default values"
	.align 8
.LC14:
	.string	"Expected ',' or ')' after function parameter"
	.align 8
.LC15:
	.string	"Expected '{' to start function body"
	.align 8
.LC16:
	.string	"Failed to parse function body statement"
	.align 8
.LC17:
	.string	"Unreachable code after return statement"
	.align 8
.LC18:
	.string	"Function missing return statement"
	.text
	.type	parse_function, @function
parse_function:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$112, %rsp
	movq	%rdi, -88(%rbp)
	movq	%rsi, -96(%rbp)
	movq	%rdx, -104(%rbp)
	movq	$0, -8(%rbp)
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	*create_symbol_table@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
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
	movq	%rax, %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L24
.L25:
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L26
.L24:
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-96(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*search_name@GOTPCREL(%rip)
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L27
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L26
.L27:
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L28
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L26
.L28:
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-40(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movl	$1, %esi
	movq	%rax, %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, -48(%rbp)
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L29
	movq	L_PAREN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L30
.L29:
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L26
.L30:
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, -56(%rbp)
	jmp	.L31
.L38:
	movq	-104(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	-88(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_variable
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	jne	.L32
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L33
.L32:
	movq	-80(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L34
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L33
.L34:
	movq	-80(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
.L33:
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L35
	movq	COMMA_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L35
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	jmp	.L31
.L35:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L37
	movq	R_PAREN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L31
.L37:
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L26
.L31:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L38
	movq	R_PAREN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L38
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L39
	movq	L_BRACE_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L40
.L39:
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L26
.L40:
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, -64(%rbp)
	movq	-104(%rbp), %rax
	movb	$1, 8(%rax)
	movb	$0, -9(%rbp)
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	jmp	.L41
.L45:
	movq	-104(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	-88(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_statement
	movq	%rax, -72(%rbp)
	cmpq	$0, -72(%rbp)
	jne	.L42
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L43
.L42:
	cmpb	$0, -9(%rbp)
	je	.L43
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
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
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
.L41:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L45
	movq	R_BRACE_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L45
	movq	-104(%rbp), %rax
	movb	$0, 8(%rax)
	cmpb	$0, -9(%rbp)
	jne	.L46
	movq	name_void(%rip), %rax
	cmpq	%rax, -32(%rbp)
	je	.L46
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L46:
	cmpb	$0, -9(%rbp)
	jne	.L47
	movq	name_void(%rip), %rax
	cmpq	%rax, -32(%rbp)
	jne	.L47
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$5, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
.L47:
	movq	-24(%rbp), %r8
	movq	-64(%rbp), %rdi
	movq	-56(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	-40(%rbp), %rax
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	*create_function_use_ptr@GOTPCREL(%rip)
.L26:
	leave
	ret
	.size	parse_function, .-parse_function
	.section	.rodata
	.align 8
.LC19:
	.string	"Expected method return type after 'method'"
	.align 8
.LC20:
	.string	"Unknown return type for method"
	.align 8
.LC21:
	.string	"Expected method name after return type"
	.align 8
.LC22:
	.string	"Expected '(' after method name"
	.align 8
.LC23:
	.string	"Expected 'self' as first parameter of method"
	.align 8
.LC24:
	.string	"Expected ',' or ')' after method parameter"
	.align 8
.LC25:
	.string	"Failed to parse method parameter"
	.align 8
.LC26:
	.string	"Method parameters cannot have default values"
	.align 8
.LC27:
	.string	"Expected '{' to start method body"
	.align 8
.LC28:
	.string	"Failed to parse method body statement"
	.align 8
.LC29:
	.string	"Method missing return statement"
	.text
	.type	parse_method, @function
parse_method:
	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-128, %rsp
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%rdx, -120(%rbp)
	movq	%rcx, -128(%rbp)
	movq	$0, -8(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	*create_symbol_table@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	movq	SELF_KEYWORD(%rip), %rax
	movq	-24(%rbp), %rcx
	movq	-120(%rbp), %rdx
	movl	$3, %esi
	movq	%rax, %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, -32(%rbp)
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
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
	movq	%rax, %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L49
.L50:
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L51
.L49:
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*search_name@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L52
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L51
.L52:
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L53
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L51
.L53:
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-120(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, %rdi
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$2, %esi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, -56(%rbp)
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L54
	movq	L_PAREN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L55
.L54:
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L51
.L55:
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L56
	movq	SELF_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L57
.L56:
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L57:
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, -64(%rbp)
	movq	-32(%rbp), %rcx
	movq	-120(%rbp), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	*create_variable@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L58
.L66:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L59
	movq	COMMA_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L59
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	nop
	movq	-128(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	-104(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
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
	movq	R_PAREN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L62
.L61:
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L51
.L76:
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L64
.L63:
	movq	-72(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L65
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L64
.L65:
	movq	-72(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
.L64:
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
.L58:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L66
	movq	R_PAREN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L66
.L62:
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L67
	movq	L_BRACE_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L68
.L67:
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L51
.L68:
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, -80(%rbp)
	movq	-128(%rbp), %rax
	movb	$1, 8(%rax)
	movq	-128(%rbp), %rax
	movb	$1, 9(%rax)
	movb	$0, -9(%rbp)
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	jmp	.L69
.L73:
	movq	-128(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	-104(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_statement
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L70
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L71
.L70:
	cmpb	$0, -9(%rbp)
	je	.L71
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
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
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
.L69:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L73
	movq	R_BRACE_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L73
	movq	-128(%rbp), %rax
	movb	$0, 8(%rax)
	movq	-128(%rbp), %rax
	movb	$0, 9(%rax)
	cmpb	$0, -9(%rbp)
	jne	.L74
	movq	name_void(%rip), %rax
	cmpq	%rax, -40(%rbp)
	je	.L74
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L74:
	cmpb	$0, -9(%rbp)
	jne	.L75
	movq	name_void(%rip), %rax
	cmpq	%rax, -40(%rbp)
	jne	.L75
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$5, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
.L75:
	movq	-24(%rbp), %r8
	movq	-80(%rbp), %rdi
	movq	-64(%rbp), %rcx
	movq	-40(%rbp), %rdx
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rax
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	*create_method_use_ptr@GOTPCREL(%rip)
.L51:
	leave
	ret
	.size	parse_method, .-parse_method
	.section	.rodata
	.align 8
.LC30:
	.string	"Expected class name after 'class'"
	.align 8
.LC31:
	.string	"Expected '{' to start class body"
.LC32:
	.string	"Failed to parse class method"
	.align 8
.LC33:
	.string	"Failed to parse class variable"
	.align 8
.LC34:
	.string	"Unsupported type for class variable"
	.align 8
.LC35:
	.string	"Expected ';' after class variable declaration"
	.align 8
.LC36:
	.string	"Unexpected token in class member"
	.align 8
.LC37:
	.string	"Constructor name conflicts with existing member"
.LC38:
	.string	"0"
	.text
	.type	parse_class, @function
parse_class:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$280, %rsp
	movq	%rdi, -264(%rbp)
	movq	%rsi, -272(%rbp)
	movq	%rdx, -280(%rbp)
	movq	$0, -24(%rbp)
	movq	-272(%rbp), %rax
	movq	%rax, %rdi
	call	*create_symbol_table@GOTPCREL(%rip)
	movq	%rax, -48(%rbp)
	movq	-264(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L78
	movq	-280(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L79
.L78:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-56(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, -64(%rbp)
	movq	-264(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L80
	movq	L_BRACE_SYMBOL(%rip), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L81
.L80:
	movq	-280(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC31(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L79
.L81:
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, -72(%rbp)
	movq	-264(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	movq	$0, -32(%rbp)
	jmp	.L82
.L96:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L83
	movq	METHOD_KEYWORD(%rip), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L83
	movq	-280(%rbp), %rcx
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	-264(%rbp), %rax
	movq	%rax, %rdi
	call	parse_method
	movq	%rax, -232(%rbp)
	cmpq	$0, -232(%rbp)
	jne	.L84
	movq	-280(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L84:
	movq	-232(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	*create_class_member@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L85
.L83:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L86
	movq	VAR_KEYWORD(%rip), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L86
	movq	-264(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	movq	-280(%rbp), %rax
	movb	$1, 10(%rax)
	movq	-280(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movq	-264(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_variable
	movq	%rax, -240(%rbp)
	movq	-280(%rbp), %rax
	movb	$0, 10(%rax)
	cmpq	$0, -240(%rbp)
	jne	.L87
	movq	-280(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L87:
	movq	-240(%rbp), %rax
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$1, %edi
	call	*create_class_member@GOTPCREL(%rip)
	movq	%rax, -248(%rbp)
	movq	-248(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-248(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$1, %eax
	jne	.L88
	movq	-248(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -256(%rbp)
	movq	name_int(%rip), %rax
	cmpq	%rax, -256(%rbp)
	je	.L89
	movq	name_float(%rip), %rax
	cmpq	%rax, -256(%rbp)
	je	.L89
	movq	name_string(%rip), %rax
	cmpq	%rax, -256(%rbp)
	jne	.L90
.L89:
	addq	$8, -32(%rbp)
	jmp	.L88
.L90:
	movq	name_bool(%rip), %rax
	cmpq	%rax, -256(%rbp)
	je	.L91
	movq	name_void(%rip), %rax
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
	movq	-280(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC34(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L88:
	movq	-264(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L94
	movq	SEMICOLON_SYMBOL(%rip), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L110
.L94:
	movq	-280(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC35(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L110
.L86:
	movq	-280(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC36(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L85
.L110:
	nop
.L85:
	movq	-264(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
.L82:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L96
	movq	R_BRACE_SYMBOL(%rip), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L96
	movq	DEFAULT_INIT_NAME(%rip), %rdx
	movq	-64(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L97
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -88(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	*create_symbol_table@GOTPCREL(%rip)
	movq	-88(%rbp), %rdx
	movq	%rax, 32(%rdx)
	movq	-88(%rbp), %rcx
	movq	-64(%rbp), %rdx
	movq	-80(%rbp), %rax
	movl	$2, %esi
	movq	%rax, %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, -96(%rbp)
	movq	-88(%rbp), %rax
	movq	32(%rax), %rcx
	movq	SELF_KEYWORD(%rip), %rax
	movq	-64(%rbp), %rdx
	movl	$3, %esi
	movq	%rax, %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, -104(%rbp)
	movq	-104(%rbp), %rcx
	movq	-64(%rbp), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	*create_variable@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-96(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, -112(%rbp)
	movq	-104(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$8, %edi
	call	*create_primary@GOTPCREL(%rip)
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$5, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-88(%rbp), %rax
	movq	32(%rax), %r8
	movq	-112(%rbp), %rdi
	movq	-96(%rbp), %rcx
	movq	-64(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movq	-88(%rbp), %rax
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	*create_method_use_ptr@GOTPCREL(%rip)
	movq	-88(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	*create_class_member@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
.L97:
	movq	-40(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	$2, %eax
	je	.L98
	movq	-280(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC37(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L98:
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	movq	-64(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, -120(%rbp)
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -128(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	*create_symbol_table@GOTPCREL(%rip)
	movq	-128(%rbp), %rdx
	movq	%rax, 32(%rdx)
	movq	-128(%rbp), %rcx
	movq	-64(%rbp), %rdx
	movq	-120(%rbp), %rax
	movl	$2, %esi
	movq	%rax, %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, -136(%rbp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, -144(%rbp)
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	SELF_KEYWORD(%rip), %rax
	movq	-64(%rbp), %rdx
	movl	$3, %esi
	movq	%rax, %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, -152(%rbp)
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -160(%rbp)
	jmp	.L99
.L102:
	movq	SELF_KEYWORD(%rip), %rdx
	movq	-168(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L111
	movq	-168(%rbp), %rax
	movq	8(%rax), %rcx
	movq	-168(%rbp), %rax
	movq	(%rax), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	*create_variable@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-144(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L99
.L111:
	nop
.L99:
	movq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -168(%rbp)
	cmpq	$0, -168(%rbp)
	jne	.L102
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, -176(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -184(%rbp)
	movq	-152(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$8, %edi
	call	*create_primary@GOTPCREL(%rip)
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-176(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	jmp	.L104
.L107:
	movq	-192(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$1, %eax
	jne	.L104
	movq	-192(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rbx
	movq	-152(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rbx, %rdx
	movq	%rax, %rsi
	movl	$2, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$8, %edi
	call	*create_primary@GOTPCREL(%rip)
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
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
	movl	$2, %esi
	leaq	.LC38(%rip), %rax
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	*create_primary@GOTPCREL(%rip)
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
.L106:
	movq	%rax, -224(%rbp)
	movq	-224(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$13, %edi
	call	*create_expression@GOTPCREL(%rip)
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-176(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
.L104:
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -192(%rbp)
	cmpq	$0, -192(%rbp)
	jne	.L107
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, -200(%rbp)
	movq	-152(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$8, %edi
	call	*create_primary@GOTPCREL(%rip)
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-200(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	*list_copy@GOTPCREL(%rip)
	movq	%rax, -208(%rbp)
	jmp	.L108
.L109:
	movq	-168(%rbp), %rax
	movq	8(%rax), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$8, %edi
	call	*create_primary@GOTPCREL(%rip)
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-200(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
.L108:
	movq	-208(%rbp), %rax
	movq	%rax, %rdi
	call	*list_pop@GOTPCREL(%rip)
	movq	%rax, -168(%rbp)
	cmpq	$0, -168(%rbp)
	jne	.L109
	movq	-40(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	-200(%rbp), %rdx
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$1, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$8, %edi
	call	*create_primary@GOTPCREL(%rip)
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$5, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-176(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-128(%rbp), %rax
	movq	32(%rax), %r8
	movq	-176(%rbp), %rdi
	movq	-144(%rbp), %rcx
	movq	-64(%rbp), %rdx
	movq	-136(%rbp), %rsi
	movq	-128(%rbp), %rax
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	*create_method_use_ptr@GOTPCREL(%rip)
	movq	-128(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	*create_class_member@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-32(%rbp), %rdi
	movq	-48(%rbp), %rcx
	movq	-72(%rbp), %rdx
	movq	-64(%rbp), %rsi
	movq	-56(%rbp), %rax
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	*create_class_use_ptr@GOTPCREL(%rip)
.L79:
	movq	-8(%rbp), %rbx
	leave
	ret
	.size	parse_class, .-parse_class
	.section	.rodata
.LC39:
	.string	"Expected variable type"
	.align 8
.LC40:
	.string	"Expected a type for variable declaration"
.LC41:
	.string	"Unknown variable type"
.LC42:
	.string	"Expected variable name"
	.align 8
.LC43:
	.string	"Failed to parse variable initializer"
	.text
	.type	parse_variable, @function
parse_variable:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	$0, -16(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
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
	movq	%rax, %rdi
	call	*is_builtin_type@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L113
.L114:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC39(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L115
.L113:
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*search_name@GOTPCREL(%rip)
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
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC40(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L117
.L116:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC41(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L117:
	movq	-40(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L118
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC42(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L118:
	movq	-56(%rbp), %rax
	movzbl	10(%rax), %eax
	testb	%al, %al
	je	.L119
	movq	-56(%rbp), %rax
	movzbl	9(%rax), %eax
	testb	%al, %al
	jne	.L119
	movl	$5, %esi
	jmp	.L120
.L119:
	movl	$3, %esi
.L120:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	%rax, %rdi
	call	*create_symbol@GOTPCREL(%rip)
	movq	%rax, -32(%rbp)
	movq	$0, -8(%rbp)
	movq	-40(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L121
	movq	ASSIGN_SYMBOL(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L121
	movq	-40(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	movq	-40(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_expression
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L121
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC43(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L121:
	movq	-8(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	*create_variable@GOTPCREL(%rip)
.L115:
	leave
	ret
	.size	parse_variable, .-parse_variable
	.section	.rodata
	.align 8
.LC44:
	.string	"Cannot use 'break' outside of a loop"
	.align 8
.LC45:
	.string	"Cannot use 'continue' outside of a loop"
.LC46:
	.string	"Failed to parse statement"
.LC47:
	.string	"Expected ';' after statement"
	.text
	.type	parse_statement, @function
parse_statement:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	$0, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	movq	$0, -8(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L123
	movq	IF_KEYWORD(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L124
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_if
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$2, %edi
	call	*create_statement@GOTPCREL(%rip)
	jmp	.L125
.L124:
	movq	FOR_KEYWORD(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L126
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_for
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rcx
	movl	$0, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	*create_statement@GOTPCREL(%rip)
	jmp	.L125
.L126:
	movq	WHILE_KEYWORD(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L127
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_while
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$3, %edi
	call	*create_statement@GOTPCREL(%rip)
	jmp	.L125
.L127:
	movq	VAR_KEYWORD(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L128
	movq	-24(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_variable
	movq	%rax, %r9
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$1, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	jmp	.L129
.L128:
	movq	RETURN_KEYWORD(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L130
	movq	-24(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L131
	movq	SEMICOLON_SYMBOL(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L131
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$5, %edi
	call	*create_statement@GOTPCREL(%rip)
	jmp	.L125
.L131:
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_expression
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$5, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	jmp	.L129
.L130:
	movq	BREAK_KEYWORD(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L132
	movq	-40(%rbp), %rax
	movzbl	11(%rax), %eax
	testb	%al, %al
	jne	.L133
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC44(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L125
.L133:
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$6, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	jmp	.L129
.L132:
	movq	CONTINUE_KEYWORD(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L134
	movq	-40(%rbp), %rax
	movzbl	11(%rax), %eax
	testb	%al, %al
	jne	.L135
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC45(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L125
.L135:
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$7, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	jmp	.L129
.L134:
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_expression
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	jmp	.L129
.L123:
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_expression
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	*create_statement@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
.L129:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L136
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC46(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L136:
	movq	-24(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L137
	movq	SEMICOLON_SYMBOL(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L138
.L137:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC47(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L138:
	movq	-8(%rbp), %rax
.L125:
	leave
	ret
	.size	parse_statement, .-parse_statement
	.section	.rodata
.LC48:
	.string	"Expected '(' after 'if'"
.LC49:
	.string	"Failed to parse if condition"
	.align 8
.LC50:
	.string	"Expected ')' after if condition"
.LC51:
	.string	"Expected '{' to start if body"
	.align 8
.LC52:
	.string	"Failed to parse if body statement"
.LC53:
	.string	"Expected '(' after 'elif'"
	.align 8
.LC54:
	.string	"Failed to parse else-if condition"
	.align 8
.LC55:
	.string	"Expected ')' after else-if condition"
	.align 8
.LC56:
	.string	"Expected '{' to start else-if body"
	.align 8
.LC57:
	.string	"Failed to parse else-if body statement"
	.align 8
.LC58:
	.string	"Expected '{' to start else body"
	.align 8
.LC59:
	.string	"Failed to parse else body statement"
	.text
	.type	parse_if, @function
parse_if:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$112, %rsp
	movq	%rdi, -88(%rbp)
	movq	%rsi, -96(%rbp)
	movq	%rdx, -104(%rbp)
	movq	$0, -8(%rbp)
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L140
	movq	L_PAREN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L141
.L140:
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC48(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L142
.L141:
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-104(%rbp), %rdx
	movq	-96(%rbp), %rcx
	movq	-88(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_expression
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L143
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC49(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L143:
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L144
	movq	R_PAREN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L145
.L144:
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC50(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L142
.L145:
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L146
	movq	L_BRACE_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L147
.L146:
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC51(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L142
.L147:
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	jmp	.L148
.L150:
	movq	-104(%rbp), %rdx
	movq	-96(%rbp), %rcx
	movq	-88(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_statement
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	jne	.L149
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC52(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L149:
	movq	-80(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
.L148:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L150
	movq	R_BRACE_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L150
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, -32(%rbp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	jmp	.L151
.L163:
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L152
	movq	L_PAREN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L153
.L152:
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC53(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L142
.L153:
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-104(%rbp), %rdx
	movq	-96(%rbp), %rcx
	movq	-88(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_expression
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L154
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC54(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L154:
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L155
	movq	R_PAREN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L156
.L155:
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC55(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L142
.L156:
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L157
	movq	L_BRACE_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L158
.L157:
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC56(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L142
.L158:
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, -56(%rbp)
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	jmp	.L159
.L161:
	movq	-104(%rbp), %rdx
	movq	-96(%rbp), %rcx
	movq	-88(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_statement
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.L160
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC57(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L160:
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
.L159:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L161
	movq	R_BRACE_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L161
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*create_else_if@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
.L151:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L162
	movq	ELIF_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L163
.L162:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L164
	movq	ELSE_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L164
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L165
	movq	L_BRACE_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L166
.L165:
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC58(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L142
.L166:
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	jmp	.L167
.L169:
	movq	-104(%rbp), %rdx
	movq	-96(%rbp), %rcx
	movq	-88(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_statement
	movq	%rax, -72(%rbp)
	cmpq	$0, -72(%rbp)
	jne	.L168
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC59(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L168:
	movq	-72(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-88(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
.L167:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L169
	movq	R_BRACE_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L169
.L164:
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-40(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	*create_if@GOTPCREL(%rip)
.L142:
	leave
	ret
	.size	parse_if, .-parse_if
	.section	.rodata
.LC60:
	.string	"Expected '(' after 'for'"
	.align 8
.LC61:
	.string	"Failed to parse for loop initializer"
	.align 8
.LC62:
	.string	"Expected ';' after for loop initializer"
	.align 8
.LC63:
	.string	"Failed to parse for loop condition"
	.align 8
.LC64:
	.string	"Expected ';' after for loop condition"
	.align 8
.LC65:
	.string	"Failed to parse for loop increment"
	.align 8
.LC66:
	.string	"Expected ')' after for loop increment"
	.align 8
.LC67:
	.string	"Expected '{' to start for loop body"
	.align 8
.LC68:
	.string	"Failed to parse for loop body statement"
	.text
	.type	parse_for, @function
parse_for:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movq	$0, -8(%rbp)
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L171
	movq	L_PAREN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L172
.L171:
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC60(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L173
.L172:
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	$0, -16(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L174
	movq	SEMICOLON_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L175
.L174:
	movq	-72(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_variable
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L176
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC61(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L176:
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
.L175:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L177
	movq	SEMICOLON_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L178
.L177:
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC62(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L173
.L178:
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	$0, -24(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L179
	movq	SEMICOLON_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L180
.L179:
	movq	-72(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_expression
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L181
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC63(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L181:
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
.L180:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L182
	movq	SEMICOLON_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L183
.L182:
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC64(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L173
.L183:
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	$0, -32(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L184
	movq	R_PAREN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L185
.L184:
	movq	-72(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_expression
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L186
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC65(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L186:
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
.L185:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L187
	movq	R_PAREN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L188
.L187:
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC66(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L173
.L188:
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L189
	movq	L_BRACE_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L190
.L189:
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC67(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L173
.L190:
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	movq	-72(%rbp), %rax
	movb	$1, 11(%rax)
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	jmp	.L191
.L193:
	movq	-72(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_statement
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L192
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC68(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L192:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
.L191:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L193
	movq	R_BRACE_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L193
	movq	-72(%rbp), %rax
	movb	$0, 11(%rax)
	movq	-40(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	*create_for@GOTPCREL(%rip)
.L173:
	leave
	ret
	.size	parse_for, .-parse_for
	.section	.rodata
.LC69:
	.string	"Expected '(' after 'while'"
	.align 8
.LC70:
	.string	"Failed to parse while condition"
	.align 8
.LC71:
	.string	"Expected ')' after while condition"
	.align 8
.LC72:
	.string	"Expected '{' to start while body"
	.align 8
.LC73:
	.string	"Failed to parse while body statement"
	.text
	.type	parse_while, @function
parse_while:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	$0, -8(%rbp)
	movq	-40(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L195
	movq	L_PAREN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L196
.L195:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC69(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L197
.L196:
	movq	-40(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_expression
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L198
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC70(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L198:
	movq	-40(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L199
	movq	R_PAREN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L200
.L199:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC71(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L197
.L200:
	movq	-40(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L201
	movq	L_BRACE_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L202
.L201:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC72(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L197
.L202:
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	movq	-56(%rbp), %rax
	movb	$1, 11(%rax)
	movq	-40(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	jmp	.L203
.L205:
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_statement
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L204
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC73(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L204:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-40(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
.L203:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L205
	movq	R_BRACE_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L205
	movq	-56(%rbp), %rax
	movb	$0, 11(%rax)
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*create_while@GOTPCREL(%rip)
.L197:
	leave
	ret
	.size	parse_while, .-parse_while
	.section	.rodata
.LC74:
	.string	"Failed to parse right operand"
	.text
	.type	parse_expr_prec, @function
parse_expr_prec:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$96, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%r8, -88(%rbp)
	movq	$0, -8(%rbp)
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	jmp	.L207
.L215:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*string_to_operator@GOTPCREL(%rip)
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	*operator_precedence@GOTPCREL(%rip)
	movl	%eax, -24(%rbp)
	cmpl	$19, -20(%rbp)
	je	.L208
	movl	-24(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L208
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-88(%rbp), %rdx
	movq	-80(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_primary
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L209
	movq	-88(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC74(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L210
.L209:
	movq	-32(%rbp), %rax
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rax, -16(%rbp)
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	jmp	.L211
.L214:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*string_to_operator@GOTPCREL(%rip)
	movl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %edi
	call	*operator_precedence@GOTPCREL(%rip)
	movl	%eax, -40(%rbp)
	cmpl	$19, -36(%rbp)
	je	.L212
	movl	-40(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jle	.L212
	movq	-88(%rbp), %rdi
	movq	-80(%rbp), %rcx
	movl	-40(%rbp), %edx
	movq	-16(%rbp), %rsi
	movq	-56(%rbp), %rax
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	parse_expr_prec
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L213
	movl	$0, %eax
	jmp	.L210
.L213:
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
.L211:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	je	.L214
.L212:
	movq	-16(%rbp), %rdx
	movq	-64(%rbp), %rsi
	movl	-20(%rbp), %eax
	movq	%rdx, %rcx
	movl	$0, %edx
	movl	%eax, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rax, -64(%rbp)
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
.L207:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	je	.L215
.L208:
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-64(%rbp), %rax
.L210:
	leave
	ret
	.size	parse_expr_prec, .-parse_expr_prec
	.section	.rodata
	.align 8
.LC75:
	.string	"Failed to parse expression primary"
	.text
	.type	parse_expression, @function
parse_expression:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$56, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_primary
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L217
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rbx, %rdx
	movq	%rax, %rsi
	leaq	.LC75(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L218
.L217:
	movq	-24(%rbp), %rax
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$19, %edi
	call	*create_expression@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	-56(%rbp), %rcx
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	parse_expr_prec
.L218:
	movq	-8(%rbp), %rbx
	leave
	ret
	.size	parse_expression, .-parse_expression
	.section	.rodata
	.align 8
.LC76:
	.string	"Failed to parse parenthesized expression"
.LC77:
	.string	"Expected ')' after expression"
	.align 8
.LC78:
	.string	"Failed to parse operand of unary '!'"
	.align 8
.LC79:
	.string	"Failed to parse operand of unary '-'"
	.align 8
.LC80:
	.string	"Failed to parse variable access"
	.align 8
.LC81:
	.string	"Unexpected token in primary expression"
	.text
	.type	parse_primary, @function
parse_primary:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movq	$0, -48(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
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
	movq	TRUE_KEYWORD(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
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
	movq	FALSE_KEYWORD(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
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
	movq	L_PAREN_SYMBOL(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L226
	movl	$5, -4(%rbp)
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -48(%rbp)
	movq	-72(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_expression
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L227
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC76(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L228
.L227:
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L229
	movq	R_PAREN_SYMBOL(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L238
.L229:
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC77(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L228
.L226:
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L231
	movq	NOT_SYMBOL(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L231
	movl	$6, -4(%rbp)
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -48(%rbp)
	movq	-72(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_primary
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L221
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC78(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L228
.L231:
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L233
	movq	SUB_SYMBOL(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L233
	movl	$7, -4(%rbp)
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -48(%rbp)
	movq	-72(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_primary
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L221
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC79(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
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
	movq	SELF_KEYWORD(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L236
	movq	-72(%rbp), %rax
	movzbl	9(%rax), %eax
	testb	%al, %al
	je	.L236
.L235:
	movl	$8, -4(%rbp)
	movq	-72(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_variable_access
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L221
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC80(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L228
.L236:
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC81(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L228
.L238:
	nop
.L221:
	movq	-40(%rbp), %rdi
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movl	-4(%rbp), %eax
	movq	%rdi, %r8
	movl	%eax, %edi
	call	*create_primary@GOTPCREL(%rip)
.L228:
	leave
	ret
	.size	parse_primary, .-parse_primary
	.section	.rodata
	.align 8
.LC82:
	.string	"Expected variable name in variable access"
	.align 8
.LC83:
	.string	"Cannot call undefined variable"
	.align 8
.LC84:
	.string	"Cannot call non-function variable"
	.align 8
.LC85:
	.string	"Failed to parse function call argument"
	.align 8
.LC86:
	.string	"Expected ',' or ')' after function call argument"
	.align 8
.LC87:
	.string	"Failed to parse sequence index"
	.align 8
.LC88:
	.string	"Expected ']' after sequence index"
	.align 8
.LC89:
	.string	"Cannot access attribute without a valid scope"
	.align 8
.LC90:
	.string	"Expected attribute name after '.'"
.LC91:
	.string	"Unknown attribute name"
	.text
	.type	parse_variable_access, @function
parse_variable_access:
	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-128, %rsp
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%rdx, -120(%rbp)
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	*peek_current_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L240
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$6, %eax
	jne	.L241
	movq	SELF_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L240
.L241:
	movq	-120(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC82(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L242
.L240:
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movq	$0, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*search_name@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
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
	movq	L_PAREN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L246
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L247
	movq	-120(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC83(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	jmp	.L248
.L247:
	movq	-24(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L248
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, -72(%rbp)
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	movq	16(%rax), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rsi
	movl	$2, %edi
	call	*create_variable_access@GOTPCREL(%rip)
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
	movq	-120(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC84(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L249:
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	call	*create_list@GOTPCREL(%rip)
	movq	%rax, -80(%rbp)
	jmp	.L250
.L255:
	movq	-120(%rbp), %rdx
	movq	-112(%rbp), %rcx
	movq	-104(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_expression
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L251
	movq	-120(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC85(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L251:
	movq	-88(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*list_append@GOTPCREL(%rip)
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L252
	movq	COMMA_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L252
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	jmp	.L250
.L252:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L254
	movq	R_PAREN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L250
.L254:
	movq	-120(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC86(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L242
.L250:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L255
	movq	R_PAREN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L255
	movq	-80(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$1, %edi
	call	*create_variable_access@GOTPCREL(%rip)
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
	movq	L_BRACKET_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L257
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-120(%rbp), %rdx
	movq	-112(%rbp), %rcx
	movq	-104(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_expression
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.L258
	movq	-120(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC87(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
.L258:
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	jne	.L259
	movq	R_BRACKET_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L260
.L259:
	movq	-120(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC88(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L242
.L260:
	movq	-64(%rbp), %rdx
	movq	-40(%rbp), %rax
	movl	$0, %r8d
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$3, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	jmp	.L256
.L257:
	movq	DOT_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L270
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*get_next_token@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L262
	movq	-120(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC89(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L242
.L262:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$1, %eax
	je	.L263
	movq	-120(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC90(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L242
.L263:
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*search_name@GOTPCREL(%rip)
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
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*make_method_name@GOTPCREL(%rip)
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*search_name_use_strcmp@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
.L264:
	cmpq	$0, -24(%rbp)
	jne	.L267
	movq	-120(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	*get_full_path@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC91(%rip), %rax
	movq	%rax, %rdi
	call	*parser_error@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L242
.L267:
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rsi
	movl	$2, %edi
	call	*create_variable_access@GOTPCREL(%rip)
	movq	%rax, -40(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -32(%rbp)
.L256:
	movq	-104(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*peek_next_token@GOTPCREL(%rip)
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
	.size	parse_variable_access, .-parse_variable_access
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
