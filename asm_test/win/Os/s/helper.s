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
	.globl	create_node
	.def	create_node;	.scl	2;	.type	32;	.endef
create_node:
	pushq	%rbx
	movq	%rcx, %rbx
	movl	$16, %ecx
	subq	$32, %rsp
	call	alloc_memory
	xorl	%edx, %edx
	movq	%rdx, (%rax)
	movq	%rbx, 8(%rax)
	addq	$32, %rsp
	popq	%rbx
	ret
	.globl	list_append
	.def	list_append;	.scl	2;	.type	32;	.endef
list_append:
	pushq	%rbx
	movq	%rcx, %rbx
	movq	%rdx, %rcx
	subq	$32, %rsp
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
	addq	$32, %rsp
	popq	%rbx
	ret
	.globl	list_copy
	.def	list_copy;	.scl	2;	.type	32;	.endef
list_copy:
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$32, %rsp
	call	create_list
	movq	(%rbx), %rdx
	movq	%rdx, (%rax)
	movq	8(%rbx), %rdx
	movq	%rdx, 8(%rax)
	addq	$32, %rsp
	popq	%rbx
	ret
	.globl	list_pop
	.def	list_pop;	.scl	2;	.type	32;	.endef
list_pop:
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L12
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	testq	%rdx, %rdx
	jne	.L14
	xorl	%edx, %edx
	movq	%rdx, 8(%rcx)
.L14:
	movq	8(%rax), %rax
.L12:
	ret
	.globl	create_scope
	.def	create_scope;	.scl	2;	.type	32;	.endef
create_scope:
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
	.globl	search
	.def	search;	.scl	2;	.type	32;	.endef
search:
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$40, %rsp
.L21:
	testq	%rbx, %rbx
	je	.L27
	movq	8(%rbx), %rax
	movq	(%rax), %rsi
.L22:
	testq	%rsi, %rsi
	je	.L28
	movq	8(%rsi), %rdi
	movq	%rbp, %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L20
	movq	(%rsi), %rsi
	jmp	.L22
.L28:
	movq	(%rbx), %rbx
	jmp	.L21
.L27:
	xorl	%edi, %edi
.L20:
	addq	$40, %rsp
	movq	%rdi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC0:
	.ascii "Warning: Name '%s' already exists in the current scope, returning existing name, kind: \0"
.LC1:
	.ascii "type\12\0"
.LC2:
	.ascii "variable\12\0"
.LC3:
	.ascii "function\12\0"
.LC4:
	.ascii "method\12\0"
.LC5:
	.ascii "class\12\0"
.LC6:
	.ascii "attribute\12\0"
.LC7:
	.ascii "unknown\12\0"
.LC8:
	.ascii "Error creating name: name_info and scope_info are both NULL for kind %u\12\0"
.LC9:
	.ascii "Error creating name: unknown NameType %u\12\0"
	.text
	.globl	create_name
	.def	create_name;	.scl	2;	.type	32;	.endef
create_name:
	pushq	%r12
	movq	%rcx, %r12
	pushq	%rbp
	movq	%r8, %rbp
	pushq	%rdi
	movq	%r9, %rdi
	pushq	%rsi
	movl	%edx, %esi
	movq	%rcx, %rdx
	pushq	%rbx
	subq	$32, %rsp
	movq	112(%rsp), %rcx
	call	search
	testq	%rax, %rax
	je	.L30
	movq	%rax, %rbx
	call	__getreent
	movq	%r12, %r8
	leaq	.LC0(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	cmpl	$5, 24(%rbx)
	ja	.L31
	movl	24(%rbx), %eax
	leaq	.L33(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
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
	call	__getreent
	leaq	.LC1(%rip), %rcx
	movq	24(%rax), %rdx
	jmp	.L58
.L37:
	call	__getreent
	leaq	.LC2(%rip), %rcx
	movq	24(%rax), %rdx
	jmp	.L58
.L36:
	call	__getreent
	leaq	.LC3(%rip), %rcx
	movq	24(%rax), %rdx
	jmp	.L58
.L35:
	call	__getreent
	leaq	.LC4(%rip), %rcx
	movq	24(%rax), %rdx
	jmp	.L58
.L34:
	call	__getreent
	leaq	.LC5(%rip), %rcx
	movq	24(%rax), %rdx
	jmp	.L58
.L32:
	call	__getreent
	leaq	.LC6(%rip), %rcx
	movq	24(%rax), %rdx
	jmp	.L58
.L31:
	call	__getreent
	leaq	.LC7(%rip), %rcx
	movq	24(%rax), %rdx
.L58:
	call	fputs
.L30:
	movl	$32, %ecx
	call	alloc_memory
	movq	%r12, (%rax)
	movq	%rax, %rbx
	movq	id_counter.0(%rip), %rax
	movl	%esi, 24(%rbx)
	incq	%rax
	movq	%rax, id_counter.0(%rip)
	movq	%rax, 8(%rbx)
	leal	-1(%rsi), %eax
	cmpl	$2, %eax
	jbe	.L39
	cmpl	$5, %esi
	je	.L39
	cmpl	$4, %esi
	jne	.L42
	testq	%rdi, %rdi
	je	.L42
	movq	%rdi, 16(%rbx)
	jmp	.L44
.L39:
	testq	%rbp, %rbp
	je	.L43
	movq	%rbp, 16(%rbx)
	jmp	.L44
.L42:
	testl	%esi, %esi
	jne	.L43
	xorl	%eax, %eax
	movq	%rax, 16(%rbx)
	jmp	.L44
.L43:
	orq	%rbp, %rdi
	jne	.L45
	call	__getreent
	movl	%esi, %r8d
	leaq	.LC8(%rip), %rdx
	movq	24(%rax), %rcx
	jmp	.L59
.L45:
	call	__getreent
	movl	%esi, %r8d
	leaq	.LC9(%rip), %rdx
	movq	24(%rax), %rcx
.L59:
	call	fprintf
	xorl	%ebx, %ebx
	jmp	.L29
.L44:
	movq	112(%rsp), %rax
	movq	%rbx, %rdx
	movq	8(%rax), %rcx
	call	list_append
.L29:
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
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
	je	.L61
.L63:
	movl	$1, %eax
	jmp	.L62
.L61:
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L63
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L63
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L63
	movq	.refptr.VOID_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	setne	%al
	movzbl	%al, %eax
.L62:
	addq	$32, %rsp
	popq	%rbx
	ret
	.globl	is_type
	.def	is_type;	.scl	2;	.type	32;	.endef
is_type:
	testl	$-5, 24(%rcx)
	sete	%al
	ret
	.section .rdata,"dr"
.LC10:
	.ascii "Parser Error at line %zu, column %zu: %s\12\0"
	.text
	.globl	parser_error
	.def	parser_error;	.scl	2;	.type	32;	.endef
parser_error:
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$64, %rsp
	movq	16(%rdx), %rax
	movq	8(%rdx), %r8
	leaq	1(%rax), %r9
	incq	%r8
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	__getreent
	movq	56(%rsp), %r9
	movq	48(%rsp), %r8
	leaq	.LC10(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, 32(%rsp)
	call	fprintf
	addq	$64, %rsp
	popq	%rbx
	ret
	.section .rdata,"dr"
.LC11:
	.ascii "\342\224\202   \0"
.LC12:
	.ascii "    \0"
.LC13:
	.ascii "\342\224\224\342\224\200\342\224\200 \0"
.LC14:
	.ascii "\342\224\234\342\224\200\342\224\200 \0"
	.text
	.globl	indention
	.def	indention;	.scl	2;	.type	32;	.endef
indention:
	pushq	%r14
	movl	$1, %eax
	pushq	%r13
	pushq	%r12
	leaq	3(%r9), %r12
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
	jne	.L69
	orl	%eax, %edx
.L71:
	movb	%dl, (%r8)
	movl	$1, %esi
	leaq	.LC12(%rip), %r13
	leaq	.LC11(%rip), %r14
	jmp	.L70
.L69:
	notl	%eax
	andl	%eax, %edx
	jmp	.L71
.L70:
	cmpq	%rbx, %rsi
	jnb	.L79
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
	jmp	.L70
.L79:
	testq	%rbx, %rbx
	je	.L68
	testb	%bpl, %bpl
	leaq	.LC14(%rip), %rdx
	leaq	.LC13(%rip), %rax
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
.L68:
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
	subq	$40, %rsp
	movl	$35, %ecx
	call	alloc_memory
	movw	$0, (%rax)
	movb	$0, 2(%rax)
	addq	$40, %rsp
	ret
	.section .rdata,"dr"
.LC15:
	.ascii "print\0"
.LC16:
	.ascii "./std/print.tc\0"
.LC17:
	.ascii "arr\0"
.LC18:
	.ascii "./std/arr.tc\0"
.LC19:
	.ascii "Error: Standard library file for import not found: %s\12\0"
.LC20:
	.ascii "/\0"
.LC21:
	.ascii ".tc\0"
.LC22:
	.ascii "r\0"
.LC23:
	.ascii "Error opening library file for import: %s\12\0"
.LC24:
	.ascii "Info: Starting parsing lib file for import: %s\12\0"
.LC25:
	.ascii "Info: Finished parsing lib file for import: %s\12\0"
.LC26:
	.ascii "Error parsing library file for import: %s\12\0"
	.text
	.globl	parse_import_file
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
parse_import_file:
	pushq	%r12
	pushq	%rbp
	movq	%r8, %rbp
	pushq	%rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	subq	$1088, %rsp
	testq	%rdx, %rdx
	movb	$0, 64(%rsp)
	leaq	64(%rsp), %rbx
	jne	.L83
	leaq	.LC15(%rip), %rdx
	call	strcmp
	leaq	.LC16(%rip), %rdx
	testl	%eax, %eax
	je	.L96
	leaq	.LC17(%rip), %rdx
	movq	%rsi, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L86
	leaq	.LC18(%rip), %rdx
.L96:
	movq	%rbx, %rcx
	call	strcpy
	jmp	.L85
.L86:
	call	__getreent
	movq	%rbx, %r8
	leaq	.LC19(%rip), %rdx
	movq	24(%rax), %rcx
	jmp	.L97
.L83:
	movq	%rdx, %r9
	movq	%rbx, %r8
	movl	$1024, %edx
	movq	%rbx, %rcx
	call	string_append
	movq	%rbx, %r8
	movl	$1024, %edx
	movq	%rbx, %rcx
	leaq	.LC20(%rip), %r9
	call	string_append
	movq	%rsi, %r9
	movq	%rbx, %r8
	movl	$1024, %edx
	movq	%rbx, %rcx
	call	string_append
	movq	%rbx, %r8
	movl	$1024, %edx
	movq	%rbx, %rcx
	leaq	.LC21(%rip), %r9
	call	string_append
.L85:
	leaq	.LC22(%rip), %rdx
	movq	%rbx, %rcx
	call	fopen
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L88
	call	__getreent
	movq	%rbx, %r8
	leaq	.LC23(%rip), %rdx
	movq	24(%rax), %rcx
.L97:
	call	fprintf
	xorl	%ebx, %ebx
	jmp	.L82
.L88:
	movq	%rbx, %rdx
	leaq	.LC24(%rip), %rcx
	call	printf
	leaq	56(%rsp), %rdx
	xorl	%eax, %eax
	movq	%rdi, %rcx
	movq	%rax, 56(%rsp)
	call	read_source
	movq	%rdi, %rcx
	movq	%rax, %r12
	call	fclose
	call	create_parser
	movq	56(%rsp), %rdx
	movq	%r12, %rcx
	movq	%rax, 40(%rsp)
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %rdi
	call	create_lexer
	movq	40(%rsp), %r8
	movq	%rdi, %rdx
	movq	%rax, %rcx
	call	parse_code
	movq	%rbx, %rdx
	leaq	.LC25(%rip), %rcx
	movq	%rax, %rdi
	call	printf
	testq	%rdi, %rdi
	jne	.L90
	call	__getreent
	movq	%rbx, %r8
	leaq	.LC26(%rip), %rdx
	movq	24(%rax), %rcx
	jmp	.L97
.L90:
	movq	8(%rdi), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rbx
.L91:
	testq	%rbx, %rbx
	je	.L82
	movq	8(%rbx), %rdi
	movq	%rsi, %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L92
	movq	(%rbx), %rbx
	jmp	.L91
.L92:
	movq	8(%rbp), %rcx
	movq	%rdi, %rdx
	movq	%rdi, %rbx
	call	list_append
.L82:
	addq	$1088, %rsp
	movq	%rbx, %rax
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
	jne	.L98
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$14, %eax
	testb	%dl, %dl
	jne	.L98
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$15, %eax
	testb	%dl, %dl
	jne	.L98
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$16, %eax
	testb	%dl, %dl
	jne	.L98
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$17, %eax
	testb	%dl, %dl
	jne	.L98
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$18, %eax
	testb	%dl, %dl
	jne	.L98
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$11, %eax
	testb	%dl, %dl
	jne	.L98
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$12, %eax
	testb	%dl, %dl
	jne	.L98
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$5, %eax
	testb	%dl, %dl
	jne	.L98
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$6, %eax
	testb	%dl, %dl
	jne	.L98
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$7, %eax
	testb	%dl, %dl
	jne	.L98
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$8, %eax
	testb	%dl, %dl
	jne	.L98
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$9, %eax
	testb	%dl, %dl
	jne	.L98
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$10, %eax
	testb	%dl, %dl
	jne	.L98
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	xorl	%eax, %eax
	testb	%dl, %dl
	jne	.L98
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L98
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$2, %eax
	testb	%dl, %dl
	jne	.L98
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$3, %eax
	testb	%dl, %dl
	jne	.L98
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	cmpb	$1, %al
	sbbl	%eax, %eax
	andl	$15, %eax
	addl	$4, %eax
.L98:
	addq	$32, %rsp
	popq	%rbx
	ret
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
operator_precedence:
	xorl	%eax, %eax
	cmpl	$18, %ecx
	ja	.L120
	movl	%ecx, %ecx
	leaq	CSWTCH.49(%rip), %rax
	movsbl	(%rax,%rcx), %eax
.L120:
	ret
	.globl	operator_to_string
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
operator_to_string:
	xorl	%eax, %eax
	cmpl	$18, %ecx
	ja	.L123
	leaq	.L126(%rip), %rdx
	movl	%ecx, %ecx
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L126:
	.long	.L144-.L126
	.long	.L143-.L126
	.long	.L142-.L126
	.long	.L141-.L126
	.long	.L140-.L126
	.long	.L139-.L126
	.long	.L138-.L126
	.long	.L137-.L126
	.long	.L136-.L126
	.long	.L135-.L126
	.long	.L134-.L126
	.long	.L133-.L126
	.long	.L132-.L126
	.long	.L131-.L126
	.long	.L130-.L126
	.long	.L129-.L126
	.long	.L128-.L126
	.long	.L127-.L126
	.long	.L125-.L126
	.text
.L131:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	jmp	.L146
.L130:
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L146
.L129:
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L146
.L128:
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L146
.L127:
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L146
.L125:
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L146
.L133:
	movq	.refptr.AND_SYMBOL(%rip), %rax
	jmp	.L146
.L132:
	movq	.refptr.OR_SYMBOL(%rip), %rax
	jmp	.L146
.L139:
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	jmp	.L146
.L138:
	movq	.refptr.NE_SYMBOL(%rip), %rax
	jmp	.L146
.L137:
	movq	.refptr.LT_SYMBOL(%rip), %rax
	jmp	.L146
.L136:
	movq	.refptr.GT_SYMBOL(%rip), %rax
	jmp	.L146
.L135:
	movq	.refptr.LE_SYMBOL(%rip), %rax
	jmp	.L146
.L134:
	movq	.refptr.GE_SYMBOL(%rip), %rax
	jmp	.L146
.L144:
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	jmp	.L146
.L143:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	jmp	.L146
.L142:
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	jmp	.L146
.L141:
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	jmp	.L146
.L140:
	movq	.refptr.MOD_SYMBOL(%rip), %rax
.L146:
	movq	(%rax), %rax
.L123:
	ret
	.section .rdata,"dr"
	.align 16
CSWTCH.49:
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
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	string_append;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	read_source;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
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
