	.file	"D:\\TC\\src\\helper.c"
	.text
	.globl	create_list
	.def	create_list;	.scl	2;	.type	32;	.endef
create_list:
	subq	$40, %rsp
	movl	$16, %ecx
	call	alloc_memory
	xorl	%edx, %edx
	movq	%rdx, (%rax)
	movq	%rdx, 8(%rax)
	addq	$40, %rsp
	ret
	.section .rdata,"dr"
.LC0:
	.ascii "Error: list_append received NULL list\12\0"
	.text
	.globl	list_append
	.def	list_append;	.scl	2;	.type	32;	.endef
list_append:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	testq	%rcx, %rcx
	jne	.L4
	call	__getreent
	leaq	.LC0(%rip), %rcx
	movq	24(%rax), %rdx
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	jmp	fputs
.L4:
	movq	%rcx, %rbx
	movl	$16, %ecx
	movq	%rdx, %rsi
	call	alloc_memory
	xorl	%edx, %edx
	cmpq	$0, (%rbx)
	movq	%rdx, (%rax)
	movq	%rsi, 8(%rax)
	jne	.L5
	movq	%rax, (%rbx)
	jmp	.L8
.L5:
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
.L8:
	movq	%rax, 8(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.globl	list_copy
	.def	list_copy;	.scl	2;	.type	32;	.endef
list_copy:
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$32, %rsp
	testq	%rcx, %rcx
	je	.L11
	call	create_list
	movq	(%rbx), %rdx
	movq	%rdx, (%rax)
	movq	8(%rbx), %rdx
	movq	%rax, %rbx
	movq	%rdx, 8(%rax)
.L11:
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	ret
	.globl	list_pop
	.def	list_pop;	.scl	2;	.type	32;	.endef
list_pop:
	xorl	%eax, %eax
	testq	%rcx, %rcx
	je	.L16
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L16
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	testq	%rdx, %rdx
	jne	.L18
	xorl	%edx, %edx
	movq	%rdx, 8(%rcx)
.L18:
	movq	8(%rax), %rax
.L16:
	ret
	.globl	list_pop_back
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
list_pop_back:
	xorl	%eax, %eax
	testq	%rcx, %rcx
	je	.L23
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L23
	movq	8(%rcx), %r8
	cmpq	%r8, %rax
	jne	.L25
	xorl	%r9d, %r9d
	movq	8(%rax), %rax
	movq	%r9, (%rcx)
	movq	%r9, 8(%rcx)
	ret
.L25:
	movq	%rax, %rdx
	movq	(%rax), %rax
	cmpq	%rax, %r8
	jne	.L25
	xorl	%r8d, %r8d
	movq	8(%rax), %rax
	movq	%r8, (%rdx)
	movq	%rdx, 8(%rcx)
.L23:
	ret
	.globl	list_is_empty
	.def	list_is_empty;	.scl	2;	.type	32;	.endef
list_is_empty:
	movl	$1, %eax
	testq	%rcx, %rcx
	je	.L33
	cmpq	$0, (%rcx)
	je	.L33
	xorl	%eax, %eax
	cmpq	$0, 8(%rcx)
	sete	%al
.L33:
	ret
	.globl	create_symbol_table
	.def	create_symbol_table;	.scl	2;	.type	32;	.endef
create_symbol_table:
	pushq	%rsi
	movq	%rcx, %rsi
	movl	$16, %ecx
	pushq	%rbx
	subq	$40, %rsp
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rax, %rbx
	call	create_list
	movq	%rax, 8(%rbx)
	addq	$40, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	ret
	.globl	search_name_use_strcmp
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
search_name_use_strcmp:
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$40, %rsp
.L39:
	testq	%rbx, %rbx
	je	.L48
	movq	8(%rbx), %rax
	movq	(%rax), %rsi
.L40:
	testq	%rsi, %rsi
	je	.L49
	movq	8(%rsi), %rdi
	movq	%rbp, %rdx
	movq	8(%rdi), %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L38
	movq	(%rsi), %rsi
	jmp	.L40
.L49:
	movq	(%rbx), %rbx
	jmp	.L39
.L48:
	xorl	%edi, %edi
.L38:
	addq	$40, %rsp
	movq	%rdi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.globl	search_name
	.def	search_name;	.scl	2;	.type	32;	.endef
search_name:
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$40, %rsp
.L51:
	testq	%rbx, %rbx
	je	.L57
	movq	8(%rbx), %rax
	movq	(%rax), %rsi
.L52:
	testq	%rsi, %rsi
	je	.L58
	movq	8(%rsi), %rdi
	movq	%rbp, %rdx
	movq	8(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L50
	movq	(%rsi), %rsi
	jmp	.L52
.L58:
	movq	(%rbx), %rbx
	jmp	.L51
.L57:
	xorl	%edi, %edi
.L50:
	addq	$40, %rsp
	movq	%rdi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC1:
	.ascii "Warning: Creating symbol with unknown SymbolType: %d\12\0"
.LC2:
	.ascii "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\12\0"
.LC3:
	.ascii "Warning: Creating symbol with unknown SymbolType for ast_node assignment: %d\12\0"
.LC4:
	.ascii "Warning: Creating symbol '%s' with NULL scope, kind: %d, id: %zu\12\0"
	.text
	.globl	create_symbol
	.def	create_symbol;	.scl	2;	.type	32;	.endef
create_symbol:
	pushq	%r14
	pushq	%r13
	movq	%r8, %r13
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rbp
	pushq	%rdi
	movq	%r9, %rdi
	pushq	%rsi
	movl	%edx, %esi
	pushq	%rbx
	subq	$64, %rsp
	cmpl	$2, %edx
	je	.L79
	ja	.L61
	testl	%edx, %edx
	jne	.L79
	movq	16(%r9), %rax
	jmp	.L83
.L61:
	leal	-3(%rdx), %eax
	movq	%r9, %rbp
	cmpl	$3, %eax
	jbe	.L65
	call	__getreent
	movl	%esi, %r8d
	leaq	.LC1(%rip), %rdx
	xorl	%ebp, %ebp
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L65
.L79:
	movq	32(%rdi), %rax
.L83:
	movq	(%rax), %rbp
.L65:
	movq	%r12, %rdx
	movq	%rbp, %rcx
	call	search_name
	testq	%rax, %rax
	je	.L66
	movl	32(%rax), %r9d
	movq	id_counter.0(%rip), %rbx
	movq	16(%rax), %r14
	movl	%r9d, 60(%rsp)
	incq	%rbx
	call	__getreent
	movl	60(%rsp), %r9d
	movq	%r12, %r8
	leaq	.LC2(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, 40(%rsp)
	movq	%r14, 32(%rsp)
	call	fprintf
.L66:
	movl	$40, %ecx
	call	alloc_memory
	movq	%r12, 8(%rax)
	movq	%rax, %rbx
	movq	id_counter.0(%rip), %rax
	movl	%esi, 32(%rbx)
	incq	%rax
	movq	%r13, (%rbx)
	movq	%rax, id_counter.0(%rip)
	movq	%rax, 16(%rbx)
	cmpl	$2, %esi
	je	.L81
	jbe	.L81
	leal	-3(%rsi), %eax
	cmpl	$3, %eax
	ja	.L84
.L81:
	movq	%rdi, 24(%rbx)
	jmp	.L73
.L84:
	call	__getreent
	movl	%esi, %r8d
	leaq	.LC3(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L73:
	testq	%rbp, %rbp
	jne	.L74
	movq	16(%rbx), %rdi
	call	__getreent
	movl	%esi, %r9d
	movq	%r12, %r8
	leaq	.LC4(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rdi, 32(%rsp)
	call	fprintf
	jmp	.L59
.L74:
	movq	8(%rbp), %rcx
	movq	%rbx, %rdx
	call	list_append
.L59:
	addq	$64, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.globl	is_builtin_type
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
is_builtin_type:
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$32, %rsp
	movq	.refptr.INT_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L86
.L88:
	movl	$1, %eax
	jmp	.L87
.L86:
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L88
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L88
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L88
	movq	.refptr.VOID_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	setne	%al
	movzbl	%al, %eax
.L87:
	addq	$32, %rsp
	popq	%rbx
	ret
	.section .rdata,"dr"
.LC5:
	.ascii "Parser Error at %s:%zu:%zu: %s\12\0"
	.text
	.globl	parser_error
	.def	parser_error;	.scl	2;	.type	32;	.endef
parser_error:
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	subq	$72, %rsp
	movq	8(%rdx), %r9
	movq	16(%rdx), %rax
	movq	%r8, 112(%rsp)
	incq	%r9
	leaq	1(%rax), %rbx
	movq	%r9, 56(%rsp)
	call	__getreent
	movq	56(%rsp), %r9
	movq	112(%rsp), %r8
	leaq	.LC5(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rsi, 40(%rsp)
	movq	%rbx, 32(%rsp)
	call	fprintf
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.section .rdata,"dr"
.LC6:
	.ascii "\342\224\202   \0"
.LC7:
	.ascii "    \0"
.LC8:
	.ascii "\342\224\224\342\224\200\342\224\200 \0"
.LC9:
	.ascii "\342\224\234\342\224\200\342\224\200 \0"
	.text
	.globl	indention
	.def	indention;	.scl	2;	.type	32;	.endef
indention:
	pushq	%r14
	movl	$1, %eax
	pushq	%r13
	pushq	%r12
	leaq	11(%r9), %r12
	pushq	%rbp
	movl	%r8d, %ebp
	movq	%rdx, %r8
	pushq	%rdi
	shrq	$3, %r8
	movq	%rcx, %rdi
	pushq	%rsi
	addq	%r12, %r8
	pushq	%rbx
	movq	%rdx, %rbx
	movl	%ebx, %ecx
	andl	$7, %ecx
	subq	$32, %rsp
	sall	%cl, %eax
	movb	(%r8), %dl
	testb	%bpl, %bpl
	jne	.L93
	orl	%eax, %edx
	jmp	.L94
.L93:
	notl	%eax
	andl	%eax, %edx
.L94:
	movb	%dl, (%r8)
	movl	$1, %esi
	leaq	.LC7(%rip), %r13
	leaq	.LC6(%rip), %r14
.L95:
	cmpq	%rbx, %rsi
	jnb	.L103
	movq	%rsi, %rax
	movl	%esi, %ecx
	movq	%r14, %rdx
	shrq	$3, %rax
	andl	$7, %ecx
	movsbl	(%r12,%rax), %eax
	sarl	%cl, %eax
	movq	%rdi, %rcx
	testb	$1, %al
	cmove	%r13, %rdx
	incq	%rsi
	call	fprintf
	jmp	.L95
.L103:
	testq	%rbx, %rbx
	je	.L92
	testb	%bpl, %bpl
	leaq	.LC9(%rip), %rdx
	leaq	.LC8(%rip), %rax
	movq	%rdi, %rcx
	cmovne	%rax, %rdx
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	fprintf
.L92:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.globl	create_parser
	.def	create_parser;	.scl	2;	.type	32;	.endef
create_parser:
	pushq	%rbx
	movq	%rcx, %rbx
	movl	$48, %ecx
	subq	$32, %rsp
	call	alloc_memory
	movw	$0, 8(%rax)
	movb	$0, 10(%rax)
	movq	%rbx, (%rax)
	addq	$32, %rsp
	popq	%rbx
	ret
	.section .rdata,"dr"
.LC10:
	.ascii "\0"
.LC11:
	.ascii "%s.tc\0"
.LC12:
	.ascii "D:/TC/std/\0"
.LC13:
	.ascii "r\0"
.LC14:
	.ascii "Error opening library file for import: %s\12\0"
.LC15:
	.ascii "Info: Starting parsing lib file for import: %s\12\0"
.LC16:
	.ascii "Info: Finished parsing lib file for import: %s\12\0"
.LC17:
	.ascii "Error parsing library file for import: %s\12\0"
.LC18:
	.ascii "Error: Imported symbol '%s' was not found in %s\12\0"
	.text
	.globl	parse_import_file
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
parse_import_file:
	pushq	%r12
	movq	%r8, %r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	subq	$64, %rsp
	testq	%rdx, %rdx
	jne	.L107
	call	strlen
	leaq	.LC10(%rip), %rcx
	leaq	4(%rax), %rdx
	call	create_string_not_check
	leaq	.LC11(%rip), %rdx
	movq	%rsi, %r8
	movq	%rax, %rcx
	movq	%rax, %rbx
	call	sprintf
	leaq	.LC12(%rip), %rdx
	jmp	.L119
.L107:
	movq	%r9, %rcx
	movq	%rdx, %rbx
	call	get_file_dir
	movq	%rax, %rdx
.L119:
	movq	%rbx, %rcx
	call	absolute_path
	leaq	.LC13(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rbx
	call	fopen
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L109
	call	__getreent
	movq	%rbx, %r8
	leaq	.LC14(%rip), %rdx
	movq	24(%rax), %rcx
	jmp	.L120
.L109:
	movq	%rbx, %rdx
	leaq	.LC15(%rip), %rcx
	call	printf
	leaq	56(%rsp), %rdx
	xorl	%eax, %eax
	movq	%rdi, %rcx
	movq	%rax, 56(%rsp)
	call	read_source
	movq	%rdi, %rcx
	movq	%rax, %rbp
	call	fclose
	movq	%rbx, %rcx
	call	create_file
	movq	%rax, %rcx
	call	create_parser
	movq	56(%rsp), %rdx
	movq	%rbp, %rcx
	movq	%rax, 40(%rsp)
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %rdi
	call	create_lexer
	movq	40(%rsp), %r8
	movq	%rdi, %rdx
	movq	%rax, %rcx
	call	parse_code
	movq	%rbx, %rdx
	leaq	.LC16(%rip), %rcx
	movq	%rax, %rdi
	call	printf
	testq	%rdi, %rdi
	jne	.L111
	call	__getreent
	movq	%rbx, %r8
	leaq	.LC17(%rip), %rdx
	movq	24(%rax), %rcx
.L120:
	call	fprintf
.L110:
	xorl	%edi, %edi
	jmp	.L106
.L111:
	movq	8(%rdi), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rbp
.L113:
	testq	%rbp, %rbp
	je	.L121
	movq	8(%rbp), %rdi
	movq	%rsi, %rdx
	movq	8(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L114
	movq	0(%rbp), %rbp
	jmp	.L113
.L114:
	movq	8(%r12), %rcx
	movq	%rdi, %rdx
	call	list_append
	jmp	.L106
.L121:
	call	__getreent
	movq	%rbx, %r9
	movq	%rsi, %r8
	leaq	.LC18(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L110
.L106:
	addq	$64, %rsp
	movq	%rdi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.section .rdata,"dr"
.LC19:
	.ascii "%s.%s\0"
	.text
	.globl	make_method_name
	.def	make_method_name;	.scl	2;	.type	32;	.endef
make_method_name:
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, 64(%rsp)
	call	strlen
	movq	%rsi, %rcx
	movq	%rax, %rbx
	call	strlen
	leaq	.LC10(%rip), %rcx
	leaq	2(%rbx,%rax), %rdx
	call	create_string
	movq	64(%rsp), %r8
	movq	%rsi, %r9
	leaq	.LC19(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rbx
	call	sprintf
	addq	$40, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	ret
	.globl	string_to_operator
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
string_to_operator:
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$32, %rsp
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$13, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$14, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$15, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$16, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$17, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$18, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$11, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$12, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$5, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$6, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$7, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$8, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$9, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$10, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	xorl	%eax, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$2, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$3, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	cmpb	$1, %al
	sbbl	%eax, %eax
	andl	$15, %eax
	addl	$4, %eax
.L124:
	addq	$32, %rsp
	popq	%rbx
	ret
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
operator_precedence:
	xorl	%eax, %eax
	cmpl	$18, %ecx
	ja	.L146
	movl	%ecx, %ecx
	leaq	CSWTCH.55(%rip), %rax
	movsbl	(%rax,%rcx), %eax
.L146:
	ret
	.globl	operator_to_string
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
operator_to_string:
	xorl	%eax, %eax
	cmpl	$18, %ecx
	ja	.L149
	leaq	.L152(%rip), %rdx
	movl	%ecx, %ecx
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L152:
	.long	.L170-.L152
	.long	.L169-.L152
	.long	.L168-.L152
	.long	.L167-.L152
	.long	.L166-.L152
	.long	.L165-.L152
	.long	.L164-.L152
	.long	.L163-.L152
	.long	.L162-.L152
	.long	.L161-.L152
	.long	.L160-.L152
	.long	.L159-.L152
	.long	.L158-.L152
	.long	.L157-.L152
	.long	.L156-.L152
	.long	.L155-.L152
	.long	.L154-.L152
	.long	.L153-.L152
	.long	.L151-.L152
	.text
.L157:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	jmp	.L172
.L156:
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L172
.L155:
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L172
.L154:
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L172
.L153:
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L172
.L151:
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L172
.L159:
	movq	.refptr.AND_SYMBOL(%rip), %rax
	jmp	.L172
.L158:
	movq	.refptr.OR_SYMBOL(%rip), %rax
	jmp	.L172
.L165:
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	jmp	.L172
.L164:
	movq	.refptr.NE_SYMBOL(%rip), %rax
	jmp	.L172
.L163:
	movq	.refptr.LT_SYMBOL(%rip), %rax
	jmp	.L172
.L162:
	movq	.refptr.GT_SYMBOL(%rip), %rax
	jmp	.L172
.L161:
	movq	.refptr.LE_SYMBOL(%rip), %rax
	jmp	.L172
.L160:
	movq	.refptr.GE_SYMBOL(%rip), %rax
	jmp	.L172
.L170:
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	jmp	.L172
.L169:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	jmp	.L172
.L168:
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	jmp	.L172
.L167:
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	jmp	.L172
.L166:
	movq	.refptr.MOD_SYMBOL(%rip), %rax
.L172:
	movq	(%rax), %rax
.L149:
	ret
	.section .rdata,"dr"
	.align 16
CSWTCH.55:
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
.lcomm id_counter.0,8,8
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	get_file_dir;	.scl	2;	.type	32;	.endef
	.def	absolute_path;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	read_source;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	create_file;	.scl	2;	.type	32;	.endef
	.def	create_lexer;	.scl	2;	.type	32;	.endef
	.def	parse_code;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.MOD_SYMBOL, "dr"
	.globl	.refptr.MOD_SYMBOL
	.linkonce	discard
.refptr.MOD_SYMBOL:
	.quad	MOD_SYMBOL
	.section	.rdata$.refptr.DIV_SYMBOL, "dr"
	.globl	.refptr.DIV_SYMBOL
	.linkonce	discard
.refptr.DIV_SYMBOL:
	.quad	DIV_SYMBOL
	.section	.rdata$.refptr.MUL_SYMBOL, "dr"
	.globl	.refptr.MUL_SYMBOL
	.linkonce	discard
.refptr.MUL_SYMBOL:
	.quad	MUL_SYMBOL
	.section	.rdata$.refptr.SUB_SYMBOL, "dr"
	.globl	.refptr.SUB_SYMBOL
	.linkonce	discard
.refptr.SUB_SYMBOL:
	.quad	SUB_SYMBOL
	.section	.rdata$.refptr.ADD_SYMBOL, "dr"
	.globl	.refptr.ADD_SYMBOL
	.linkonce	discard
.refptr.ADD_SYMBOL:
	.quad	ADD_SYMBOL
	.section	.rdata$.refptr.GE_SYMBOL, "dr"
	.globl	.refptr.GE_SYMBOL
	.linkonce	discard
.refptr.GE_SYMBOL:
	.quad	GE_SYMBOL
	.section	.rdata$.refptr.LE_SYMBOL, "dr"
	.globl	.refptr.LE_SYMBOL
	.linkonce	discard
.refptr.LE_SYMBOL:
	.quad	LE_SYMBOL
	.section	.rdata$.refptr.GT_SYMBOL, "dr"
	.globl	.refptr.GT_SYMBOL
	.linkonce	discard
.refptr.GT_SYMBOL:
	.quad	GT_SYMBOL
	.section	.rdata$.refptr.LT_SYMBOL, "dr"
	.globl	.refptr.LT_SYMBOL
	.linkonce	discard
.refptr.LT_SYMBOL:
	.quad	LT_SYMBOL
	.section	.rdata$.refptr.NE_SYMBOL, "dr"
	.globl	.refptr.NE_SYMBOL
	.linkonce	discard
.refptr.NE_SYMBOL:
	.quad	NE_SYMBOL
	.section	.rdata$.refptr.EQ_SYMBOL, "dr"
	.globl	.refptr.EQ_SYMBOL
	.linkonce	discard
.refptr.EQ_SYMBOL:
	.quad	EQ_SYMBOL
	.section	.rdata$.refptr.OR_SYMBOL, "dr"
	.globl	.refptr.OR_SYMBOL
	.linkonce	discard
.refptr.OR_SYMBOL:
	.quad	OR_SYMBOL
	.section	.rdata$.refptr.AND_SYMBOL, "dr"
	.globl	.refptr.AND_SYMBOL
	.linkonce	discard
.refptr.AND_SYMBOL:
	.quad	AND_SYMBOL
	.section	.rdata$.refptr.MOD_ASSIGN_SYMBOL, "dr"
	.globl	.refptr.MOD_ASSIGN_SYMBOL
	.linkonce	discard
.refptr.MOD_ASSIGN_SYMBOL:
	.quad	MOD_ASSIGN_SYMBOL
	.section	.rdata$.refptr.DIV_ASSIGN_SYMBOL, "dr"
	.globl	.refptr.DIV_ASSIGN_SYMBOL
	.linkonce	discard
.refptr.DIV_ASSIGN_SYMBOL:
	.quad	DIV_ASSIGN_SYMBOL
	.section	.rdata$.refptr.MUL_ASSIGN_SYMBOL, "dr"
	.globl	.refptr.MUL_ASSIGN_SYMBOL
	.linkonce	discard
.refptr.MUL_ASSIGN_SYMBOL:
	.quad	MUL_ASSIGN_SYMBOL
	.section	.rdata$.refptr.SUB_ASSIGN_SYMBOL, "dr"
	.globl	.refptr.SUB_ASSIGN_SYMBOL
	.linkonce	discard
.refptr.SUB_ASSIGN_SYMBOL:
	.quad	SUB_ASSIGN_SYMBOL
	.section	.rdata$.refptr.ADD_ASSIGN_SYMBOL, "dr"
	.globl	.refptr.ADD_ASSIGN_SYMBOL
	.linkonce	discard
.refptr.ADD_ASSIGN_SYMBOL:
	.quad	ADD_ASSIGN_SYMBOL
	.section	.rdata$.refptr.ASSIGN_SYMBOL, "dr"
	.globl	.refptr.ASSIGN_SYMBOL
	.linkonce	discard
.refptr.ASSIGN_SYMBOL:
	.quad	ASSIGN_SYMBOL
	.section	.rdata$.refptr.builtin_scope, "dr"
	.globl	.refptr.builtin_scope
	.linkonce	discard
.refptr.builtin_scope:
	.quad	builtin_scope
	.section	.rdata$.refptr.VOID_KEYWORD, "dr"
	.globl	.refptr.VOID_KEYWORD
	.linkonce	discard
.refptr.VOID_KEYWORD:
	.quad	VOID_KEYWORD
	.section	.rdata$.refptr.BOOL_KEYWORD, "dr"
	.globl	.refptr.BOOL_KEYWORD
	.linkonce	discard
.refptr.BOOL_KEYWORD:
	.quad	BOOL_KEYWORD
	.section	.rdata$.refptr.STRING_KEYWORD, "dr"
	.globl	.refptr.STRING_KEYWORD
	.linkonce	discard
.refptr.STRING_KEYWORD:
	.quad	STRING_KEYWORD
	.section	.rdata$.refptr.FLOAT_KEYWORD, "dr"
	.globl	.refptr.FLOAT_KEYWORD
	.linkonce	discard
.refptr.FLOAT_KEYWORD:
	.quad	FLOAT_KEYWORD
	.section	.rdata$.refptr.INT_KEYWORD, "dr"
	.globl	.refptr.INT_KEYWORD
	.linkonce	discard
.refptr.INT_KEYWORD:
	.quad	INT_KEYWORD
