	.file	"D:\\TC\\src\\helper.c"
	.text
	.globl	create_list
	.def	create_list;	.scl	2;	.type	32;	.endef
	.seh_proc	create_list
create_list:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movl	$16, %ecx
	call	alloc_memory
	xorl	%edx, %edx
	movq	%rdx, (%rax)
	movq	%rdx, 8(%rax)
	addq	$40, %rsp
	ret
	.seh_endproc
	.globl	create_node
	.def	create_node;	.scl	2;	.type	32;	.endef
	.seh_proc	create_node
create_node:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx
	movl	$16, %ecx
	call	alloc_memory
	xorl	%edx, %edx
	movq	%rdx, (%rax)
	movq	%rbx, 8(%rax)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.globl	list_append
	.def	list_append;	.scl	2;	.type	32;	.endef
	.seh_proc	list_append
list_append:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%rdx, %rcx
	call	create_node
	cmpq	$0, (%rbx)
	jne	.L4
	movq	%rax, (%rbx)
	jmp	.L5
.L4:
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
.L5:
	movq	%rax, 8(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.globl	list_copy
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.seh_proc	list_copy
list_copy:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx
	call	create_list
	movq	(%rbx), %rdx
	movq	%rdx, (%rax)
	movq	8(%rbx), %rdx
	movq	%rdx, 8(%rax)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.globl	list_pop
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.seh_proc	list_pop
list_pop:
	.seh_endprologue
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L8
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	testq	%rdx, %rdx
	jne	.L10
	xorl	%edx, %edx
	movq	%rdx, 8(%rcx)
.L10:
	movq	8(%rax), %rax
.L8:
	ret
	.seh_endproc
	.globl	create_scope
	.def	create_scope;	.scl	2;	.type	32;	.endef
	.seh_proc	create_scope
create_scope:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rsi
	movl	$16, %ecx
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rax, %rbx
	call	create_list
	movq	%rax, 8(%rbx)
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.globl	search
	.def	search;	.scl	2;	.type	32;	.endef
	.seh_proc	search
search:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%rdx, %rbp
.L16:
	testq	%rbx, %rbx
	je	.L21
	movq	8(%rbx), %rax
	movq	(%rax), %rsi
.L17:
	testq	%rsi, %rsi
	je	.L22
	movq	8(%rsi), %rdi
	movq	%rbp, %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L15
	movq	(%rsi), %rsi
	jmp	.L17
.L22:
	movq	(%rbx), %rbx
	jmp	.L16
.L21:
	xorl	%edi, %edi
.L15:
	movq	%rdi, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
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
	.seh_proc	create_name
create_name:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %r12
	movl	%edx, %esi
	movq	%rcx, %rdx
	movq	112(%rsp), %rcx
	movq	%r8, %rbp
	movq	%r9, %rdi
	call	search
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L24
	call	__getreent
	movq	%r12, %r8
	leaq	.LC0(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	cmpl	$5, 24(%rbx)
	ja	.L25
	movl	24(%rbx), %eax
	leaq	.L27(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L27:
	.long	.L32-.L27
	.long	.L31-.L27
	.long	.L30-.L27
	.long	.L29-.L27
	.long	.L28-.L27
	.long	.L26-.L27
	.text
.L32:
	call	__getreent
	leaq	.LC1(%rip), %rcx
	movq	24(%rax), %rdx
	jmp	.L51
.L31:
	call	__getreent
	leaq	.LC2(%rip), %rcx
	movq	24(%rax), %rdx
	jmp	.L51
.L30:
	call	__getreent
	leaq	.LC3(%rip), %rcx
	movq	24(%rax), %rdx
	jmp	.L51
.L29:
	call	__getreent
	leaq	.LC4(%rip), %rcx
	movq	24(%rax), %rdx
	jmp	.L51
.L28:
	call	__getreent
	leaq	.LC5(%rip), %rcx
	movq	24(%rax), %rdx
	jmp	.L51
.L26:
	call	__getreent
	leaq	.LC6(%rip), %rcx
	movq	24(%rax), %rdx
	jmp	.L51
.L25:
	call	__getreent
	leaq	.LC7(%rip), %rcx
	movq	24(%rax), %rdx
.L51:
	call	fputs
.L24:
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
	jbe	.L33
	cmpl	$5, %esi
	je	.L33
	cmpl	$4, %esi
	jne	.L36
	testq	%rdi, %rdi
	je	.L36
	movq	%rdi, 16(%rbx)
	jmp	.L38
.L33:
	testq	%rbp, %rbp
	je	.L37
	movq	%rbp, 16(%rbx)
	jmp	.L38
.L36:
	testl	%esi, %esi
	jne	.L37
	xorl	%eax, %eax
	movq	%rax, 16(%rbx)
	jmp	.L38
.L37:
	orq	%rbp, %rdi
	jne	.L39
	call	__getreent
	movl	%esi, %r8d
	leaq	.LC8(%rip), %rdx
	movq	24(%rax), %rcx
	jmp	.L52
.L39:
	call	__getreent
	movl	%esi, %r8d
	leaq	.LC9(%rip), %rdx
	movq	24(%rax), %rcx
.L52:
	call	fprintf
	xorl	%ebx, %ebx
	jmp	.L23
.L38:
	movq	112(%rsp), %rax
	movq	%rbx, %rdx
	movq	8(%rax), %rcx
	call	list_append
.L23:
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.seh_endproc
	.globl	is_builtin_type
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.seh_proc	is_builtin_type
is_builtin_type:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	.refptr.INT_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	%rcx, %rbx
	call	string_equal
	testb	%al, %al
	je	.L54
.L56:
	movl	$1, %eax
	jmp	.L55
.L54:
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L56
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L56
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L56
	movq	.refptr.VOID_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	setne	%al
	movzbl	%al, %eax
.L55:
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.globl	is_type
	.def	is_type;	.scl	2;	.type	32;	.endef
	.seh_proc	is_type
is_type:
	.seh_endprologue
	testl	$-5, 24(%rcx)
	sete	%al
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC10:
	.ascii "Parser Error at line %zu, column %zu: %s\12\0"
	.text
	.globl	parser_error
	.def	parser_error;	.scl	2;	.type	32;	.endef
	.seh_proc	parser_error
parser_error:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	16(%rdx), %rax
	movq	8(%rdx), %r8
	leaq	1(%rax), %r9
	incq	%r8
	movq	%rcx, %rbx
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	__getreent
	movq	56(%rsp), %r9
	movq	48(%rsp), %r8
	leaq	.LC10(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, 32(%rsp)
	call	fprintf
	nop
	addq	$64, %rsp
	popq	%rbx
	ret
	.seh_endproc
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
	.seh_proc	indention
indention:
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	$1, %eax
	movq	%rdx, %rbx
	movl	%r8d, %ebp
	movq	%rdx, %r8
	movq	%rcx, %rdi
	leaq	3(%r9), %r12
	shrq	$3, %r8
	movl	%ebx, %ecx
	addq	%r12, %r8
	andl	$7, %ecx
	movb	(%r8), %dl
	sall	%cl, %eax
	testb	%bpl, %bpl
	jne	.L60
	orl	%eax, %edx
.L62:
	movb	%dl, (%r8)
	movl	$1, %esi
	leaq	.LC12(%rip), %r13
	leaq	.LC11(%rip), %r14
	jmp	.L61
.L60:
	notl	%eax
	andl	%eax, %edx
	jmp	.L62
.L61:
	cmpq	%rbx, %rsi
	jnb	.L69
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
.L69:
	testq	%rbx, %rbx
	je	.L59
	testb	%bpl, %bpl
	leaq	.LC13(%rip), %rax
	leaq	.LC14(%rip), %rdx
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
	.seh_endproc
	.globl	create_parser
	.def	create_parser;	.scl	2;	.type	32;	.endef
	.seh_proc	create_parser
create_parser:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movl	$35, %ecx
	call	alloc_memory
	movw	$0, (%rax)
	movb	$0, 2(%rax)
	addq	$40, %rsp
	ret
	.seh_endproc
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
	.seh_proc	parse_import_file
parse_import_file:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$1088, %rsp
	.seh_stackalloc	1088
	.seh_endprologue
	testq	%rdx, %rdx
	movb	$0, 64(%rsp)
	movq	%rcx, %rsi
	movq	%rdx, %r9
	movq	%r8, %rbp
	leaq	64(%rsp), %rbx
	jne	.L72
	leaq	.LC15(%rip), %rdx
	call	strcmp
	leaq	.LC16(%rip), %rdx
	testl	%eax, %eax
	je	.L84
	leaq	.LC17(%rip), %rdx
	movq	%rsi, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L75
	leaq	.LC18(%rip), %rdx
.L84:
	movq	%rbx, %rcx
	call	strcpy
	jmp	.L74
.L75:
	call	__getreent
	movq	%rbx, %r8
	leaq	.LC19(%rip), %rdx
	movq	24(%rax), %rcx
	jmp	.L85
.L72:
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
.L74:
	leaq	.LC22(%rip), %rdx
	movq	%rbx, %rcx
	call	fopen
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L77
	call	__getreent
	movq	%rbx, %r8
	leaq	.LC23(%rip), %rdx
	movq	24(%rax), %rcx
.L85:
	call	fprintf
	xorl	%ebx, %ebx
	jmp	.L71
.L77:
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
	jne	.L79
	call	__getreent
	movq	%rbx, %r8
	leaq	.LC26(%rip), %rdx
	movq	24(%rax), %rcx
	jmp	.L85
.L79:
	movq	8(%rdi), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rbx
.L80:
	testq	%rbx, %rbx
	je	.L71
	movq	8(%rbx), %rdi
	movq	%rsi, %rdx
	movq	(%rdi), %rcx
	call	string_equal
	testb	%al, %al
	jne	.L81
	movq	(%rbx), %rbx
	jmp	.L80
.L81:
	movq	8(%rbp), %rcx
	movq	%rdi, %rdx
	movq	%rdi, %rbx
	call	list_append
.L71:
	movq	%rbx, %rax
	addq	$1088, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.seh_endproc
	.globl	string_to_operator
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.seh_proc	string_to_operator
string_to_operator:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rcx, %rbx
	call	string_equal
	movl	%eax, %edx
	movl	$13, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$14, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$15, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$16, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$17, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$18, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$11, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$12, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$5, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$6, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$7, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$8, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$9, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$10, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	xorl	%eax, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$2, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$3, %eax
	testb	%dl, %dl
	jne	.L86
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	cmpb	$1, %al
	sbbl	%eax, %eax
	andl	$15, %eax
	addl	$4, %eax
.L86:
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.seh_proc	operator_precedence
operator_precedence:
	.seh_endprologue
	xorl	%eax, %eax
	cmpl	$18, %ecx
	ja	.L107
	movl	%ecx, %ecx
	leaq	CSWTCH.49(%rip), %rax
	movsbl	(%rax,%rcx), %eax
.L107:
	ret
	.seh_endproc
	.globl	operator_to_string
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
	.seh_proc	operator_to_string
operator_to_string:
	.seh_endprologue
	xorl	%eax, %eax
	cmpl	$18, %ecx
	ja	.L110
	leaq	.L113(%rip), %rdx
	movl	%ecx, %ecx
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L113:
	.long	.L131-.L113
	.long	.L130-.L113
	.long	.L129-.L113
	.long	.L128-.L113
	.long	.L127-.L113
	.long	.L126-.L113
	.long	.L125-.L113
	.long	.L124-.L113
	.long	.L123-.L113
	.long	.L122-.L113
	.long	.L121-.L113
	.long	.L120-.L113
	.long	.L119-.L113
	.long	.L118-.L113
	.long	.L117-.L113
	.long	.L116-.L113
	.long	.L115-.L113
	.long	.L114-.L113
	.long	.L112-.L113
	.text
.L118:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	jmp	.L133
.L117:
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L133
.L116:
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L133
.L115:
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L133
.L114:
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L133
.L112:
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L133
.L120:
	movq	.refptr.AND_SYMBOL(%rip), %rax
	jmp	.L133
.L119:
	movq	.refptr.OR_SYMBOL(%rip), %rax
	jmp	.L133
.L126:
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	jmp	.L133
.L125:
	movq	.refptr.NE_SYMBOL(%rip), %rax
	jmp	.L133
.L124:
	movq	.refptr.LT_SYMBOL(%rip), %rax
	jmp	.L133
.L123:
	movq	.refptr.GT_SYMBOL(%rip), %rax
	jmp	.L133
.L122:
	movq	.refptr.LE_SYMBOL(%rip), %rax
	jmp	.L133
.L121:
	movq	.refptr.GE_SYMBOL(%rip), %rax
	jmp	.L133
.L131:
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	jmp	.L133
.L130:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	jmp	.L133
.L129:
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	jmp	.L133
.L128:
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	jmp	.L133
.L127:
	movq	.refptr.MOD_SYMBOL(%rip), %rax
.L133:
	movq	(%rax), %rax
.L110:
	ret
	.seh_endproc
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
