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
.L35:
	testq	%rbx, %rbx
	je	.L41
	movq	8(%rbx), %rax
	movq	(%rax), %rsi
.L36:
	testq	%rsi, %rsi
	je	.L42
	movq	8(%rsi), %rdi
	movq	%rbp, %rdx
	movq	16(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L34
	movq	(%rsi), %rsi
	jmp	.L36
.L42:
	movq	(%rbx), %rbx
	jmp	.L35
.L41:
	xorl	%edi, %edi
.L34:
	addq	$40, %rsp
	movq	%rdi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC1:
	.ascii "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\12\0"
	.text
	.globl	create_symbol
	.def	create_symbol;	.scl	2;	.type	32;	.endef
create_symbol:
	pushq	%r13
	pushq	%r12
	movq	%r8, %r12
	pushq	%rbp
	movl	%edx, %ebp
	movq	%rcx, %rdx
	pushq	%rdi
	movq	%rcx, %rdi
	movq	%r9, %rcx
	pushq	%rsi
	movq	%r9, %rsi
	pushq	%rbx
	subq	$72, %rsp
	call	search_name
	testq	%rax, %rax
	je	.L44
	movq	id_counter.0(%rip), %rdx
	movl	32(%rax), %r9d
	movq	24(%rax), %r13
	leaq	1(%rdx), %rbx
	movl	%r9d, 60(%rsp)
	call	__getreent
	movl	60(%rsp), %r9d
	movq	%rdi, %r8
	leaq	.LC1(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, 40(%rsp)
	movq	%r13, 32(%rsp)
	call	fprintf
.L44:
	movl	$40, %ecx
	call	alloc_memory
	movq	%rdi, 16(%rax)
	movq	%rax, %rbx
	movq	id_counter.0(%rip), %rax
	movl	%ebp, 32(%rbx)
	incq	%rax
	movq	%r12, (%rbx)
	movq	%rax, id_counter.0(%rip)
	movq	%rax, 24(%rbx)
	movq	%rsi, 8(%rbx)
	cmpl	$1, %ebp
	ja	.L45
	movq	(%rsi), %rax
	movq	8(%rax), %rcx
	jmp	.L51
.L45:
	movq	8(%rsi), %rcx
.L51:
	movq	%rbx, %rdx
	call	list_append
	addq	$72, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
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
	je	.L53
.L55:
	movl	$1, %eax
	jmp	.L54
.L53:
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L55
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L55
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L55
	movq	.refptr.VOID_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	setne	%al
	movzbl	%al, %eax
.L54:
	addq	$32, %rsp
	popq	%rbx
	ret
	.section .rdata,"dr"
.LC2:
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
	leaq	.LC2(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rsi, 40(%rsp)
	movq	%rbx, 32(%rsp)
	call	fprintf
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.section .rdata,"dr"
.LC3:
	.ascii "\342\224\202   \0"
.LC4:
	.ascii "    \0"
.LC5:
	.ascii "\342\224\224\342\224\200\342\224\200 \0"
.LC6:
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
	jne	.L60
	orl	%eax, %edx
.L62:
	movb	%dl, (%r8)
	movl	$1, %esi
	leaq	.LC4(%rip), %r13
	leaq	.LC3(%rip), %r14
	jmp	.L61
.L60:
	notl	%eax
	andl	%eax, %edx
	jmp	.L62
.L61:
	cmpq	%rbx, %rsi
	jnb	.L70
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
	jmp	.L61
.L70:
	testq	%rbx, %rbx
	je	.L59
	testb	%bpl, %bpl
	leaq	.LC6(%rip), %rdx
	leaq	.LC5(%rip), %rax
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
.L59:
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
.LC7:
	.ascii "\0"
.LC8:
	.ascii "%s.tc\0"
.LC9:
	.ascii "D:/TC/std/\0"
.LC10:
	.ascii "r\0"
.LC11:
	.ascii "Error opening library file for import: %s\12\0"
.LC12:
	.ascii "Info: Starting parsing lib file for import: %s\12\0"
.LC13:
	.ascii "Info: Finished parsing lib file for import: %s\12\0"
.LC14:
	.ascii "Error parsing library file for import: %s\12\0"
.LC15:
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
	jne	.L74
	call	strlen
	leaq	.LC7(%rip), %rcx
	leaq	4(%rax), %rdx
	call	create_string_not_check
	leaq	.LC8(%rip), %rdx
	movq	%rsi, %r8
	movq	%rax, %rcx
	movq	%rax, %rbx
	call	sprintf
	leaq	.LC9(%rip), %rdx
	jmp	.L86
.L74:
	movq	%r9, %rcx
	movq	%rdx, %rbx
	call	get_file_dir
	movq	%rax, %rdx
.L86:
	movq	%rbx, %rcx
	call	absolute_path
	leaq	.LC10(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rbx
	call	fopen
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L76
	call	__getreent
	movq	%rbx, %r8
	leaq	.LC11(%rip), %rdx
	movq	24(%rax), %rcx
	jmp	.L87
.L76:
	movq	%rbx, %rdx
	leaq	.LC12(%rip), %rcx
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
	leaq	.LC13(%rip), %rcx
	movq	%rax, %rdi
	call	printf
	testq	%rdi, %rdi
	jne	.L78
	call	__getreent
	movq	%rbx, %r8
	leaq	.LC14(%rip), %rdx
	movq	24(%rax), %rcx
.L87:
	call	fprintf
.L77:
	xorl	%edi, %edi
	jmp	.L73
.L78:
	movq	8(%rdi), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rbp
.L80:
	testq	%rbp, %rbp
	je	.L88
	movq	8(%rbp), %rdi
	movq	%rsi, %rdx
	movq	16(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L81
	movq	0(%rbp), %rbp
	jmp	.L80
.L81:
	movq	8(%r12), %rcx
	movq	%rdi, %rdx
	call	list_append
	jmp	.L73
.L88:
	call	__getreent
	movq	%rbx, %r9
	movq	%rsi, %r8
	leaq	.LC15(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L77
.L73:
	addq	$64, %rsp
	movq	%rdi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
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
	jne	.L89
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$14, %eax
	testb	%dl, %dl
	jne	.L89
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$15, %eax
	testb	%dl, %dl
	jne	.L89
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$16, %eax
	testb	%dl, %dl
	jne	.L89
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$17, %eax
	testb	%dl, %dl
	jne	.L89
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$18, %eax
	testb	%dl, %dl
	jne	.L89
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$11, %eax
	testb	%dl, %dl
	jne	.L89
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$12, %eax
	testb	%dl, %dl
	jne	.L89
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$5, %eax
	testb	%dl, %dl
	jne	.L89
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$6, %eax
	testb	%dl, %dl
	jne	.L89
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$7, %eax
	testb	%dl, %dl
	jne	.L89
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$8, %eax
	testb	%dl, %dl
	jne	.L89
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$9, %eax
	testb	%dl, %dl
	jne	.L89
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$10, %eax
	testb	%dl, %dl
	jne	.L89
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	xorl	%eax, %eax
	testb	%dl, %dl
	jne	.L89
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L89
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$2, %eax
	testb	%dl, %dl
	jne	.L89
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$3, %eax
	testb	%dl, %dl
	jne	.L89
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	cmpb	$1, %al
	sbbl	%eax, %eax
	andl	$15, %eax
	addl	$4, %eax
.L89:
	addq	$32, %rsp
	popq	%rbx
	ret
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
operator_precedence:
	xorl	%eax, %eax
	cmpl	$18, %ecx
	ja	.L111
	movl	%ecx, %ecx
	leaq	CSWTCH.50(%rip), %rax
	movsbl	(%rax,%rcx), %eax
.L111:
	ret
	.globl	operator_to_string
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
operator_to_string:
	xorl	%eax, %eax
	cmpl	$18, %ecx
	ja	.L114
	leaq	.L117(%rip), %rdx
	movl	%ecx, %ecx
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L117:
	.long	.L135-.L117
	.long	.L134-.L117
	.long	.L133-.L117
	.long	.L132-.L117
	.long	.L131-.L117
	.long	.L130-.L117
	.long	.L129-.L117
	.long	.L128-.L117
	.long	.L127-.L117
	.long	.L126-.L117
	.long	.L125-.L117
	.long	.L124-.L117
	.long	.L123-.L117
	.long	.L122-.L117
	.long	.L121-.L117
	.long	.L120-.L117
	.long	.L119-.L117
	.long	.L118-.L117
	.long	.L116-.L117
	.text
.L122:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	jmp	.L137
.L121:
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L137
.L120:
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L137
.L119:
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L137
.L118:
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L137
.L116:
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L137
.L124:
	movq	.refptr.AND_SYMBOL(%rip), %rax
	jmp	.L137
.L123:
	movq	.refptr.OR_SYMBOL(%rip), %rax
	jmp	.L137
.L130:
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	jmp	.L137
.L129:
	movq	.refptr.NE_SYMBOL(%rip), %rax
	jmp	.L137
.L128:
	movq	.refptr.LT_SYMBOL(%rip), %rax
	jmp	.L137
.L127:
	movq	.refptr.GT_SYMBOL(%rip), %rax
	jmp	.L137
.L126:
	movq	.refptr.LE_SYMBOL(%rip), %rax
	jmp	.L137
.L125:
	movq	.refptr.GE_SYMBOL(%rip), %rax
	jmp	.L137
.L135:
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	jmp	.L137
.L134:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	jmp	.L137
.L133:
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	jmp	.L137
.L132:
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	jmp	.L137
.L131:
	movq	.refptr.MOD_SYMBOL(%rip), %rax
.L137:
	movq	(%rax), %rax
.L114:
	ret
	.section .rdata,"dr"
	.align 16
CSWTCH.50:
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
