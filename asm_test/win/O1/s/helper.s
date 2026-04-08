	.file	"helper.c"
	.text
	.globl	create_list
	.def	create_list;	.scl	2;	.type	32;	.endef
create_list:
	subq	$40, %rsp
	movl	$16, %ecx
	call	alloc_memory
	movq	$0, (%rax)
	movq	$0, 8(%rax)
	addq	$40, %rsp
	ret
	.section .rdata,"dr"
	.align 8
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
	je	.L8
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	movl	$16, %ecx
	call	alloc_memory
	movq	$0, (%rax)
	movq	%rsi, 8(%rax)
	cmpq	$0, (%rbx)
	je	.L9
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rbx)
.L3:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L8:
	call	__getreent
	movq	24(%rax), %r9
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	call	fwrite
	jmp	.L3
.L9:
	movq	%rax, (%rbx)
	movq	%rax, 8(%rbx)
	jmp	.L3
	.globl	list_copy
	.def	list_copy;	.scl	2;	.type	32;	.endef
list_copy:
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbx
	testq	%rcx, %rcx
	je	.L12
	call	create_list
	movq	(%rbx), %rdx
	movq	%rdx, (%rax)
	movq	8(%rbx), %rdx
	movq	%rdx, 8(%rax)
.L10:
	addq	$32, %rsp
	popq	%rbx
	ret
.L12:
	movq	%rcx, %rax
	jmp	.L10
	.globl	list_pop
	.def	list_pop;	.scl	2;	.type	32;	.endef
list_pop:
	testq	%rcx, %rcx
	je	.L17
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L14
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	testq	%rdx, %rdx
	je	.L18
.L16:
	movq	8(%rax), %rax
	ret
.L18:
	movq	$0, 8(%rcx)
	jmp	.L16
.L17:
	movq	%rcx, %rax
.L14:
	ret
	.globl	list_pop_back
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
list_pop_back:
	testq	%rcx, %rcx
	je	.L22
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L19
	movq	8(%rcx), %rdx
	cmpq	%rdx, %rax
	je	.L25
.L21:
	movq	%rax, %r8
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L21
	movq	8(%rdx), %rax
	movq	$0, (%r8)
	movq	%r8, 8(%rcx)
	ret
.L25:
	movq	8(%rax), %rax
	movq	$0, (%rcx)
	movq	$0, 8(%rcx)
	ret
.L22:
	movq	%rcx, %rax
.L19:
	ret
	.globl	list_is_empty
	.def	list_is_empty;	.scl	2;	.type	32;	.endef
list_is_empty:
	movl	$1, %eax
	testq	%rcx, %rcx
	je	.L27
	cmpq	$0, (%rcx)
	je	.L27
	cmpq	$0, 8(%rcx)
	sete	%al
	movzbl	%al, %eax
.L27:
	ret
	.globl	create_symbol_table
	.def	create_symbol_table;	.scl	2;	.type	32;	.endef
create_symbol_table:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rsi
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, %rbx
	movq	%rsi, (%rax)
	call	create_list
	movq	%rax, 8(%rbx)
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.globl	search_name_use_strcmp
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
search_name_use_strcmp:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rbp
	movq	%rdx, %rdi
	testq	%rcx, %rcx
	je	.L37
.L36:
	movq	8(%rbp), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	je	.L34
.L35:
	movq	8(%rbx), %rsi
	movq	8(%rsi), %rcx
	movq	%rdi, %rdx
	call	strcmp
	testl	%eax, %eax
	je	.L32
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L35
.L34:
	movq	0(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L36
	movq	%rbp, %rsi
	jmp	.L32
.L37:
	movq	%rcx, %rsi
.L32:
	movq	%rsi, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.globl	search_name
	.def	search_name;	.scl	2;	.type	32;	.endef
search_name:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rbp
	movq	%rdx, %rdi
	testq	%rcx, %rcx
	je	.L46
.L45:
	movq	8(%rbp), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	je	.L43
.L44:
	movq	8(%rbx), %rsi
	movq	8(%rsi), %rcx
	movq	%rdi, %rdx
	call	string_equal
	testb	%al, %al
	jne	.L41
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L44
.L43:
	movq	0(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L45
	movq	%rbp, %rsi
	jmp	.L41
.L46:
	movq	%rcx, %rsi
.L41:
	movq	%rsi, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "[Warning] Creating symbol with unknown SymbolType: %u\12\0"
	.align 8
.LC2:
	.ascii "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\12\0"
	.align 8
.LC3:
	.ascii "[Warning] Creating symbol with unknown SymbolType for ast_node assignment: %u\12\0"
	.align 8
.LC4:
	.ascii "[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\12\0"
	.text
	.globl	create_symbol
	.def	create_symbol;	.scl	2;	.type	32;	.endef
create_symbol:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	movq	%rcx, %rdi
	movl	%edx, %ebx
	movq	%r8, %r12
	movq	%r9, %rbp
	cmpl	$2, %edx
	je	.L51
	ja	.L52
	testl	%edx, %edx
	je	.L71
	movq	32(%r9), %rax
	movq	(%rax), %r13
	jmp	.L56
.L52:
	leal	-3(%rdx), %eax
	movq	%r9, %r13
	cmpl	$3, %eax
	jbe	.L56
	call	__getreent
	movq	24(%rax), %rcx
	movl	%ebx, %r8d
	leaq	.LC1(%rip), %rdx
	call	fprintf
	movl	$0, %r13d
	jmp	.L56
.L71:
	movq	16(%r9), %rax
	movq	(%rax), %r13
.L56:
	movq	%rdi, %rdx
	movq	%r13, %rcx
	call	search_name
	testq	%rax, %rax
	je	.L57
	movq	id_counter.0(%rip), %rdx
	leaq	1(%rdx), %rsi
	movq	16(%rax), %r14
	movl	32(%rax), %r15d
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rsi, 40(%rsp)
	movq	%r14, 32(%rsp)
	movl	%r15d, %r9d
	movq	%rdi, %r8
	leaq	.LC2(%rip), %rdx
	call	fprintf
.L57:
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, %rsi
	movq	%rdi, 8(%rax)
	movq	id_counter.0(%rip), %rax
	addq	$1, %rax
	movq	%rax, id_counter.0(%rip)
	movq	%rax, 16(%rsi)
	movl	%ebx, 32(%rsi)
	movq	%r12, (%rsi)
	cmpl	$2, %ebx
	je	.L58
	ja	.L59
	testl	%ebx, %ebx
	je	.L72
	movq	%rbp, 24(%rsi)
	jmp	.L64
.L51:
	movq	32(%r9), %rax
	movq	(%rax), %r13
	jmp	.L56
.L59:
	leal	-3(%rbx), %eax
	cmpl	$3, %eax
	ja	.L73
	movq	%rbp, 24(%rsi)
	jmp	.L64
.L72:
	movq	%rbp, 24(%rsi)
.L64:
	testq	%r13, %r13
	je	.L74
	movq	8(%r13), %rcx
	movq	%rsi, %rdx
	call	list_append
.L50:
	movq	%rsi, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L58:
	movq	%rbp, 24(%rsi)
	jmp	.L64
.L73:
	call	__getreent
	movq	24(%rax), %rcx
	movl	%ebx, %r8d
	leaq	.LC3(%rip), %rdx
	call	fprintf
	jmp	.L64
.L74:
	movq	16(%rsi), %rbp
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rbp, 32(%rsp)
	movl	%ebx, %r9d
	movq	%rdi, %r8
	leaq	.LC4(%rip), %rdx
	call	fprintf
	jmp	.L50
	.globl	is_builtin_type
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
is_builtin_type:
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbx
	movq	.refptr.INT_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	je	.L82
.L76:
	addq	$32, %rsp
	popq	%rbx
	ret
.L82:
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L76
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L76
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L76
	movq	.refptr.VOID_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	testb	%al, %al
	setne	%al
	movzbl	%al, %eax
	jmp	.L76
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "[Parser Error] at %s:%zu:%zu: %s\12\0"
	.text
	.globl	parser_error
	.def	parser_error;	.scl	2;	.type	32;	.endef
parser_error:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	movq	%rcx, %rbp
	movq	%r8, %rbx
	movq	16(%rdx), %rax
	leaq	1(%rax), %rdi
	movq	8(%rdx), %rsi
	addq	$1, %rsi
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rbp, 40(%rsp)
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC5(%rip), %rdx
	call	fprintf
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
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
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbp
	movq	%rdx, %rsi
	movl	%r8d, %r14d
	movq	%r9, %rdi
	movq	%rdx, %rax
	shrq	$3, %rax
	addq	%r9, %rax
	movzbl	(%rax), %edx
	testb	%r8b, %r8b
	jne	.L86
	movl	%esi, %ecx
	andl	$7, %ecx
	movl	$1, %r8d
	sall	%cl, %r8d
	orl	%r8d, %edx
.L87:
	movb	%dl, (%rax)
	cmpq	$1, %rsi
	jbe	.L88
	movl	$1, %ebx
	leaq	.LC7(%rip), %r13
	leaq	.LC6(%rip), %r12
.L90:
	movq	%rbx, %rax
	shrq	$3, %rax
	movsbl	(%rdi,%rax), %eax
	movl	%ebx, %ecx
	andl	$7, %ecx
	sarl	%cl, %eax
	testb	$1, %al
	movq	%r12, %rdx
	cmove	%r13, %rdx
	movq	%rbp, %rcx
	call	fprintf
	addq	$1, %rbx
	cmpq	%rbx, %rsi
	jne	.L90
.L91:
	testb	%r14b, %r14b
	leaq	.LC9(%rip), %rdx
	leaq	.LC8(%rip), %rax
	cmovne	%rax, %rdx
	movq	%rbp, %rcx
	call	fprintf
	jmp	.L85
.L86:
	movl	%esi, %ecx
	andl	$7, %ecx
	movl	$1, %r8d
	sall	%cl, %r8d
	notl	%r8d
	andl	%r8d, %edx
	jmp	.L87
.L88:
	testq	%rsi, %rsi
	jne	.L91
.L85:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.globl	indention_tac
	.def	indention_tac;	.scl	2;	.type	32;	.endef
indention_tac:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rdx, %rsi
	salq	$2, %rsi
	je	.L98
	movq	%rcx, %rdi
	movl	$0, %ebx
.L100:
	movq	%rdi, %rdx
	movl	$32, %ecx
	call	putc
	addq	$1, %rbx
	cmpq	%rsi, %rbx
	jne	.L100
.L98:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.globl	create_parser
	.def	create_parser;	.scl	2;	.type	32;	.endef
create_parser:
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbx
	movl	$16, %ecx
	call	alloc_memory
	movb	$0, 8(%rax)
	movb	$0, 9(%rax)
	movb	$0, 11(%rax)
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
	.align 8
.LC14:
	.ascii "Error opening library file for import: %s\12\0"
	.align 8
.LC15:
	.ascii "Info: Starting parsing lib file for import: %s\12\0"
	.align 8
.LC16:
	.ascii "Info: Finished parsing lib file for import: %s\12\0"
	.align 8
.LC17:
	.ascii "Error parsing library file for import: %s\12\0"
	.align 8
.LC18:
	.ascii "Error: Imported symbol '%s' was not found in %s\12\0"
	.text
	.globl	parse_import_file
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
parse_import_file:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	movq	%rcx, %rdi
	movq	%r8, %rbp
	testq	%rdx, %rdx
	je	.L113
	movq	%rdx, %rbx
	movq	%r9, %rcx
	call	get_file_dir
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	absolute_path
	movq	%rax, %rsi
.L107:
	leaq	.LC13(%rip), %rdx
	movq	%rsi, %rcx
	call	fopen
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L114
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rsi, %r8
	leaq	.LC15(%rip), %rdx
	call	fprintf
	movq	$0, 40(%rsp)
	leaq	40(%rsp), %rdx
	movq	%rbx, %rcx
	call	read_source
	movq	%rax, %r12
	movq	%rbx, %rcx
	call	fclose
	movq	%rsi, %rcx
	call	create_file
	movq	%rax, %rcx
	call	create_parser
	movq	%rax, %rbx
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %r13
	movq	%rsi, %r8
	movq	40(%rsp), %rdx
	movq	%r12, %rcx
	call	create_lexer
	movq	%rax, %rcx
	movq	%rbx, %r8
	movq	%r13, %rdx
	call	parse_code
	movq	%rax, %rbx
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rsi, %r8
	leaq	.LC16(%rip), %rdx
	call	fprintf
	testq	%rbx, %rbx
	je	.L115
	movq	8(%rbx), %rcx
	movq	%rdi, %rdx
	call	search_name_use_strcmp
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L111
	movq	8(%rbp), %rcx
	movq	%rax, %rdx
	call	list_append
.L105:
	movq	%rbx, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L113:
	call	strlen
	leaq	4(%rax), %rdx
	leaq	.LC10(%rip), %rcx
	call	create_string_not_check
	movq	%rax, %rbx
	movq	%rdi, %r8
	leaq	.LC11(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	leaq	.LC12(%rip), %rdx
	movq	%rbx, %rcx
	call	absolute_path
	movq	%rax, %rsi
	jmp	.L107
.L114:
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rsi, %r8
	leaq	.LC14(%rip), %rdx
	call	fprintf
	jmp	.L105
.L115:
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rsi, %r8
	leaq	.LC17(%rip), %rdx
	call	fprintf
	jmp	.L105
.L111:
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rsi, %r9
	movq	%rdi, %r8
	leaq	.LC18(%rip), %rdx
	call	fprintf
	jmp	.L105
	.section .rdata,"dr"
.LC19:
	.ascii "%s.%s\0"
	.text
	.globl	make_method_name
	.def	make_method_name;	.scl	2;	.type	32;	.endef
make_method_name:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	call	strlen
	movq	%rax, %rbx
	movq	%rdi, %rcx
	call	strlen
	leaq	2(%rbx,%rax), %rdx
	leaq	.LC10(%rip), %rcx
	call	create_string
	movq	%rax, %rbx
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC19(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.globl	string_to_operator
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
string_to_operator:
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbx
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$13, %eax
	testb	%dl, %dl
	jne	.L118
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$14, %eax
	testb	%dl, %dl
	jne	.L118
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$15, %eax
	testb	%dl, %dl
	jne	.L118
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$16, %eax
	testb	%dl, %dl
	jne	.L118
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$17, %eax
	testb	%dl, %dl
	jne	.L118
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$18, %eax
	testb	%dl, %dl
	jne	.L118
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$11, %eax
	testb	%dl, %dl
	jne	.L118
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$12, %eax
	testb	%dl, %dl
	jne	.L118
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$5, %eax
	testb	%dl, %dl
	jne	.L118
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$6, %eax
	testb	%dl, %dl
	jne	.L118
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$7, %eax
	testb	%dl, %dl
	jne	.L118
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$8, %eax
	testb	%dl, %dl
	jne	.L118
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$9, %eax
	testb	%dl, %dl
	jne	.L118
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$10, %eax
	testb	%dl, %dl
	jne	.L118
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$0, %eax
	testb	%dl, %dl
	je	.L140
.L118:
	addq	$32, %rsp
	popq	%rbx
	ret
.L140:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L118
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L136
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L137
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	cmpb	$1, %al
	sbbl	%eax, %eax
	andl	$15, %eax
	addl	$4, %eax
	jmp	.L118
.L136:
	movl	$2, %eax
	jmp	.L118
.L137:
	movl	$3, %eax
	jmp	.L118
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
operator_precedence:
	cmpl	$18, %ecx
	ja	.L142
	movl	%ecx, %ecx
	leaq	.L144(%rip), %rdx
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L144:
	.long	.L148-.L144
	.long	.L148-.L144
	.long	.L147-.L144
	.long	.L147-.L144
	.long	.L147-.L144
	.long	.L146-.L144
	.long	.L146-.L144
	.long	.L146-.L144
	.long	.L146-.L144
	.long	.L146-.L144
	.long	.L146-.L144
	.long	.L149-.L144
	.long	.L149-.L144
	.long	.L143-.L144
	.long	.L143-.L144
	.long	.L143-.L144
	.long	.L143-.L144
	.long	.L143-.L144
	.long	.L143-.L144
	.text
.L143:
	movl	$1, %eax
	ret
.L146:
	movl	$3, %eax
	ret
.L148:
	movl	$4, %eax
	ret
.L147:
	movl	$5, %eax
	ret
.L142:
	movl	$0, %eax
	ret
.L149:
	movl	$2, %eax
	ret
	.globl	operator_to_string
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
operator_to_string:
	cmpl	$18, %ecx
	ja	.L172
	movl	%ecx, %ecx
	leaq	.L153(%rip), %rdx
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
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
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L157:
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L156:
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L155:
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L154:
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L152:
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L160:
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L159:
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L166:
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L165:
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L164:
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L163:
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L162:
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L161:
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L171:
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L170:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L169:
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L168:
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L167:
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L172:
	movl	$0, %eax
	ret
.lcomm id_counter.0,8,8
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	putc;	.scl	2;	.type	32;	.endef
	.def	get_file_dir;	.scl	2;	.type	32;	.endef
	.def	absolute_path;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	read_source;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	create_file;	.scl	2;	.type	32;	.endef
	.def	create_lexer;	.scl	2;	.type	32;	.endef
	.def	parse_code;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
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
