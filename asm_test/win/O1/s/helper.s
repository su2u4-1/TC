	.file	"D:\\TC\\src\\helper.c"
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
	je	.L33
.L32:
	movq	8(%rbp), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	je	.L30
.L31:
	movq	8(%rbx), %rsi
	movq	16(%rsi), %rcx
	movq	%rdi, %rdx
	call	string_equal
	testb	%al, %al
	jne	.L28
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L31
.L30:
	movq	0(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L32
	movq	%rbp, %rsi
	jmp	.L28
.L33:
	movq	%rcx, %rsi
.L28:
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
	.ascii "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\12\0"
	.text
	.globl	create_symbol
	.def	create_symbol;	.scl	2;	.type	32;	.endef
create_symbol:
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$48, %rsp
	movq	%rcx, %r12
	movl	%edx, %edi
	movq	%r8, %rbp
	movq	%r9, %rsi
	movq	%rcx, %rdx
	movq	%r9, %rcx
	call	search_name
	testq	%rax, %rax
	je	.L38
	movq	id_counter.0(%rip), %rdx
	leaq	1(%rdx), %rbx
	movq	24(%rax), %r13
	movl	32(%rax), %r14d
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rbx, 40(%rsp)
	movq	%r13, 32(%rsp)
	movl	%r14d, %r9d
	movq	%r12, %r8
	leaq	.LC1(%rip), %rdx
	call	fprintf
.L38:
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, %rbx
	movq	%r12, 16(%rax)
	movq	id_counter.0(%rip), %rax
	addq	$1, %rax
	movq	%rax, id_counter.0(%rip)
	movq	%rax, 24(%rbx)
	movl	%edi, 32(%rbx)
	movq	%rbp, (%rbx)
	movq	%rsi, 8(%rbx)
	cmpl	$1, %edi
	jbe	.L42
	movq	8(%rsi), %rcx
	movq	%rbx, %rdx
	call	list_append
.L37:
	movq	%rbx, %rax
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L42:
	movq	(%rsi), %rax
	movq	8(%rax), %rcx
	movq	%rbx, %rdx
	call	list_append
	jmp	.L37
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
	je	.L50
.L44:
	addq	$32, %rsp
	popq	%rbx
	ret
.L50:
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L44
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L44
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L44
	movq	.refptr.VOID_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	testb	%al, %al
	setne	%al
	movzbl	%al, %eax
	jmp	.L44
	.section .rdata,"dr"
	.align 8
.LC2:
	.ascii "Parser Error at %s:%zu:%zu: %s\12\0"
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
	leaq	.LC2(%rip), %rdx
	call	fprintf
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
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
	leaq	11(%r9), %rdi
	movq	%rdx, %rax
	shrq	$3, %rax
	addq	%rdi, %rax
	movzbl	(%rax), %edx
	testb	%r8b, %r8b
	jne	.L54
	movl	%esi, %ecx
	andl	$7, %ecx
	movl	$1, %r8d
	sall	%cl, %r8d
	orl	%r8d, %edx
.L57:
	movb	%dl, (%rax)
	movl	$1, %ebx
	leaq	.LC4(%rip), %r13
	leaq	.LC3(%rip), %r12
	cmpq	$1, %rsi
	jbe	.L69
.L55:
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
	jne	.L55
.L59:
	testb	%r14b, %r14b
	leaq	.LC6(%rip), %rdx
	leaq	.LC5(%rip), %rax
	cmovne	%rax, %rdx
	movq	%rbp, %rcx
	call	fprintf
	jmp	.L53
.L54:
	movl	%esi, %ecx
	andl	$7, %ecx
	movl	$1, %r8d
	sall	%cl, %r8d
	notl	%r8d
	andl	%r8d, %edx
	jmp	.L57
.L69:
	testq	%rsi, %rsi
	jne	.L59
.L53:
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
	subq	$32, %rsp
	movq	%rcx, %rbx
	movl	$48, %ecx
	call	alloc_memory
	movb	$0, 8(%rax)
	movb	$0, 9(%rax)
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
	.align 8
.LC11:
	.ascii "Error opening library file for import: %s\12\0"
	.align 8
.LC12:
	.ascii "Info: Starting parsing lib file for import: %s\12\0"
	.align 8
.LC13:
	.ascii "Info: Finished parsing lib file for import: %s\12\0"
	.align 8
.LC14:
	.ascii "Error parsing library file for import: %s\12\0"
	.align 8
.LC15:
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
	movq	%r8, %r12
	testq	%rdx, %rdx
	je	.L83
	movq	%rdx, %rbx
	movq	%r9, %rcx
	call	get_file_dir
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	absolute_path
	movq	%rax, %rbp
.L74:
	leaq	.LC10(%rip), %rdx
	movq	%rbp, %rcx
	call	fopen
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L84
	movq	%rbp, %rdx
	leaq	.LC12(%rip), %rcx
	call	printf
	movq	$0, 40(%rsp)
	leaq	40(%rsp), %rdx
	movq	%rsi, %rcx
	call	read_source
	movq	%rax, %r13
	movq	%rsi, %rcx
	call	fclose
	movq	%rbp, %rcx
	call	create_file
	movq	%rax, %rcx
	call	create_parser
	movq	%rax, %rbx
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %rsi
	movq	40(%rsp), %rdx
	movq	%r13, %rcx
	call	create_lexer
	movq	%rax, %rcx
	movq	%rbx, %r8
	movq	%rsi, %rdx
	call	parse_code
	movq	%rax, %rsi
	movq	%rbp, %rdx
	leaq	.LC13(%rip), %rcx
	call	printf
	testq	%rsi, %rsi
	je	.L85
	movq	8(%rsi), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	je	.L78
.L80:
	movq	8(%rbx), %rsi
	movq	16(%rsi), %rcx
	movq	%rdi, %rdx
	call	string_equal
	testb	%al, %al
	jne	.L79
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L80
.L78:
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rbp, %r9
	movq	%rdi, %r8
	leaq	.LC15(%rip), %rdx
	call	fprintf
	movl	$0, %esi
	jmp	.L72
.L83:
	call	strlen
	leaq	4(%rax), %rdx
	leaq	.LC7(%rip), %rcx
	call	create_string_not_check
	movq	%rax, %rbx
	movq	%rdi, %r8
	leaq	.LC8(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	leaq	.LC9(%rip), %rdx
	movq	%rbx, %rcx
	call	absolute_path
	movq	%rax, %rbp
	jmp	.L74
.L84:
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rbp, %r8
	leaq	.LC11(%rip), %rdx
	call	fprintf
	jmp	.L72
.L85:
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rbp, %r8
	leaq	.LC14(%rip), %rdx
	call	fprintf
	jmp	.L72
.L79:
	movq	8(%r12), %rcx
	movq	%rsi, %rdx
	call	list_append
.L72:
	movq	%rsi, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
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
	jne	.L86
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$14, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$15, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$16, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$17, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$18, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$11, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$12, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$5, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$6, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$7, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$8, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$9, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$10, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$0, %eax
	testb	%dl, %dl
	je	.L108
.L86:
	addq	$32, %rsp
	popq	%rbx
	ret
.L108:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L104
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L105
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	cmpb	$1, %al
	sbbl	%eax, %eax
	andl	$15, %eax
	addl	$4, %eax
	jmp	.L86
.L104:
	movl	$2, %eax
	jmp	.L86
.L105:
	movl	$3, %eax
	jmp	.L86
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
operator_precedence:
	cmpl	$18, %ecx
	ja	.L110
	movl	%ecx, %ecx
	leaq	.L112(%rip), %rdx
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L112:
	.long	.L116-.L112
	.long	.L116-.L112
	.long	.L115-.L112
	.long	.L115-.L112
	.long	.L115-.L112
	.long	.L114-.L112
	.long	.L114-.L112
	.long	.L114-.L112
	.long	.L114-.L112
	.long	.L114-.L112
	.long	.L114-.L112
	.long	.L117-.L112
	.long	.L117-.L112
	.long	.L111-.L112
	.long	.L111-.L112
	.long	.L111-.L112
	.long	.L111-.L112
	.long	.L111-.L112
	.long	.L111-.L112
	.text
.L111:
	movl	$1, %eax
	ret
.L114:
	movl	$3, %eax
	ret
.L116:
	movl	$4, %eax
	ret
.L115:
	movl	$5, %eax
	ret
.L110:
	movl	$0, %eax
	ret
.L117:
	movl	$2, %eax
	ret
	.globl	operator_to_string
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
operator_to_string:
	cmpl	$18, %ecx
	ja	.L140
	movl	%ecx, %ecx
	leaq	.L121(%rip), %rdx
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L121:
	.long	.L139-.L121
	.long	.L138-.L121
	.long	.L137-.L121
	.long	.L136-.L121
	.long	.L135-.L121
	.long	.L134-.L121
	.long	.L133-.L121
	.long	.L132-.L121
	.long	.L131-.L121
	.long	.L130-.L121
	.long	.L129-.L121
	.long	.L128-.L121
	.long	.L127-.L121
	.long	.L126-.L121
	.long	.L125-.L121
	.long	.L124-.L121
	.long	.L123-.L121
	.long	.L122-.L121
	.long	.L120-.L121
	.text
.L126:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L125:
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L124:
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L123:
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L122:
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L120:
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L128:
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L127:
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L134:
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L133:
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L132:
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L131:
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L130:
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L129:
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L139:
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L138:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L137:
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L136:
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L135:
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L140:
	movl	$0, %eax
	ret
.lcomm id_counter.0,8,8
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	get_file_dir;	.scl	2;	.type	32;	.endef
	.def	absolute_path;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	read_source;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	create_file;	.scl	2;	.type	32;	.endef
	.def	create_lexer;	.scl	2;	.type	32;	.endef
	.def	parse_code;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
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
