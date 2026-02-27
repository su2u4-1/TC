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
	.globl	create_node
	.def	create_node;	.scl	2;	.type	32;	.endef
create_node:
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbx
	movl	$16, %ecx
	call	alloc_memory
	movq	$0, (%rax)
	movq	%rbx, 8(%rax)
	addq	$32, %rsp
	popq	%rbx
	ret
	.globl	list_append
	.def	list_append;	.scl	2;	.type	32;	.endef
list_append:
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rcx
	call	create_node
	cmpq	$0, (%rbx)
	je	.L9
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
.L7:
	movq	%rax, 8(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
.L9:
	movq	%rax, (%rbx)
	jmp	.L7
	.globl	list_copy
	.def	list_copy;	.scl	2;	.type	32;	.endef
list_copy:
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbx
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
	je	.L15
.L14:
	movq	8(%rax), %rax
.L12:
	ret
.L15:
	movq	$0, 8(%rcx)
	jmp	.L14
	.globl	create_scope
	.def	create_scope;	.scl	2;	.type	32;	.endef
create_scope:
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
	.globl	search
	.def	search;	.scl	2;	.type	32;	.endef
search:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rbp
	movq	%rdx, %rdi
	testq	%rcx, %rcx
	je	.L23
.L22:
	movq	8(%rbp), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	je	.L20
.L21:
	movq	8(%rbx), %rsi
	movq	(%rsi), %rcx
	movq	%rdi, %rdx
	call	string_equal
	testb	%al, %al
	jne	.L18
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L21
.L20:
	movq	0(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L22
	movq	%rbp, %rsi
	jmp	.L18
.L23:
	movq	%rcx, %rsi
.L18:
	movq	%rsi, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
	.align 8
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
	.align 8
.LC8:
	.ascii "Error creating name: name_info and scope_info are both NULL for kind %u\12\0"
	.align 8
.LC9:
	.ascii "Error creating name: unknown NameType %u\12\0"
	.text
	.globl	create_name
	.def	create_name;	.scl	2;	.type	32;	.endef
create_name:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rdi
	movl	%edx, %esi
	movq	%r8, %rbp
	movq	%r9, %r12
	movq	128(%rsp), %r13
	movq	%rcx, %rdx
	movq	%r13, %rcx
	call	search
	testq	%rax, %rax
	je	.L28
	movq	%rax, %rbx
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rdi, %r8
	leaq	.LC0(%rip), %rdx
	call	fprintf
	cmpl	$5, 24(%rbx)
	ja	.L29
	movl	24(%rbx), %eax
	leaq	.L31(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L31:
	.long	.L36-.L31
	.long	.L35-.L31
	.long	.L34-.L31
	.long	.L33-.L31
	.long	.L32-.L31
	.long	.L30-.L31
	.text
.L36:
	call	__getreent
	movq	24(%rax), %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC1(%rip), %rcx
	call	fwrite
.L28:
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, %rbx
	movq	%rdi, (%rax)
	movq	id_counter.0(%rip), %rax
	addq	$1, %rax
	movq	%rax, id_counter.0(%rip)
	movq	%rax, 8(%rbx)
	movl	%esi, 24(%rbx)
	leal	-1(%rsi), %eax
	cmpl	$2, %eax
	jbe	.L37
	cmpl	$5, %esi
	je	.L37
	cmpl	$4, %esi
	jne	.L40
	testq	%r12, %r12
	je	.L40
	movq	%r12, 16(%rbx)
	jmp	.L42
.L35:
	call	__getreent
	movq	24(%rax), %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC2(%rip), %rcx
	call	fwrite
	jmp	.L28
.L34:
	call	__getreent
	movq	24(%rax), %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC3(%rip), %rcx
	call	fwrite
	jmp	.L28
.L33:
	call	__getreent
	movq	24(%rax), %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rcx
	call	fwrite
	jmp	.L28
.L32:
	call	__getreent
	movq	24(%rax), %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rcx
	call	fwrite
	jmp	.L28
.L30:
	call	__getreent
	movq	24(%rax), %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC6(%rip), %rcx
	call	fwrite
	jmp	.L28
.L29:
	call	__getreent
	movq	24(%rax), %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rcx
	call	fwrite
	jmp	.L28
.L37:
	testq	%rbp, %rbp
	je	.L41
	movq	%rbp, 16(%rbx)
.L42:
	movq	8(%r13), %rcx
	movq	%rbx, %rdx
	call	list_append
.L27:
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L40:
	testl	%esi, %esi
	jne	.L41
	movq	$0, 16(%rbx)
	jmp	.L42
.L41:
	orq	%rbp, %r12
	jne	.L43
	call	__getreent
	movq	24(%rax), %rcx
	movl	%esi, %r8d
	leaq	.LC8(%rip), %rdx
	call	fprintf
	movl	$0, %ebx
	jmp	.L27
.L43:
	call	__getreent
	movq	24(%rax), %rcx
	movl	%esi, %r8d
	leaq	.LC9(%rip), %rdx
	call	fprintf
	movl	$0, %ebx
	jmp	.L27
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
	je	.L53
.L47:
	addq	$32, %rsp
	popq	%rbx
	ret
.L53:
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L47
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L47
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L47
	movq	.refptr.VOID_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	testb	%al, %al
	setne	%al
	movzbl	%al, %eax
	jmp	.L47
	.globl	is_type
	.def	is_type;	.scl	2;	.type	32;	.endef
is_type:
	testl	$-5, 24(%rcx)
	sete	%al
	ret
	.section .rdata,"dr"
	.align 8
.LC10:
	.ascii "Parser Error at line %zu, column %zu: %s\12\0"
	.text
	.globl	parser_error
	.def	parser_error;	.scl	2;	.type	32;	.endef
parser_error:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$48, %rsp
	movq	%rcx, %rdi
	movq	16(%rdx), %rax
	leaq	1(%rax), %rsi
	movq	8(%rdx), %rbx
	addq	$1, %rbx
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC10(%rip), %rdx
	call	fprintf
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
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
	leaq	3(%r9), %rdi
	movq	%rdx, %rax
	shrq	$3, %rax
	addq	%rdi, %rax
	movzbl	(%rax), %edx
	testb	%r8b, %r8b
	jne	.L58
	movl	%esi, %ecx
	andl	$7, %ecx
	movl	$1, %r8d
	sall	%cl, %r8d
	orl	%r8d, %edx
.L61:
	movb	%dl, (%rax)
	movl	$1, %ebx
	leaq	.LC12(%rip), %r13
	leaq	.LC11(%rip), %r12
	cmpq	$1, %rsi
	jbe	.L73
.L59:
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
	jne	.L59
.L63:
	testb	%r14b, %r14b
	leaq	.LC14(%rip), %rdx
	leaq	.LC13(%rip), %rax
	cmovne	%rax, %rdx
	movq	%rbp, %rcx
	call	fprintf
	jmp	.L57
.L58:
	movl	%esi, %ecx
	andl	$7, %ecx
	movl	$1, %r8d
	sall	%cl, %r8d
	notl	%r8d
	andl	%r8d, %edx
	jmp	.L61
.L73:
	testq	%rsi, %rsi
	jne	.L63
.L57:
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
	movb	$0, (%rax)
	movb	$0, 1(%rax)
	movb	$0, 2(%rax)
	addq	$40, %rsp
	ret
	.section .rdata,"dr"
.LC15:
	.ascii "print\0"
.LC16:
	.ascii "arr\0"
	.align 8
.LC17:
	.ascii "Error: Standard library file for import not found: %s\12\0"
.LC18:
	.ascii "/\0"
.LC19:
	.ascii ".tc\0"
.LC20:
	.ascii "r\0"
	.align 8
.LC21:
	.ascii "Error opening library file for import: %s\12\0"
	.align 8
.LC22:
	.ascii "Info: Starting parsing lib file for import: %s\12\0"
	.align 8
.LC23:
	.ascii "Info: Finished parsing lib file for import: %s\12\0"
	.align 8
.LC24:
	.ascii "Error parsing library file for import: %s\12\0"
	.text
	.globl	parse_import_file
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
parse_import_file:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$1072, %rsp
	movq	%rcx, %rdi
	movq	%rdx, %rbx
	movq	%r8, %r12
	movb	$0, 48(%rsp)
	testq	%rdx, %rdx
	je	.L88
	leaq	48(%rsp), %rsi
	movq	%rdx, %r9
	movq	%rsi, %r8
	movl	$1024, %edx
	movq	%rsi, %rcx
	call	string_append
	leaq	.LC18(%rip), %r9
	movq	%rsi, %r8
	movl	$1024, %edx
	movq	%rsi, %rcx
	call	string_append
	movq	%rdi, %r9
	movq	%rsi, %r8
	movl	$1024, %edx
	movq	%rsi, %rcx
	call	string_append
	leaq	.LC19(%rip), %r9
	movq	%rsi, %r8
	movl	$1024, %edx
	movq	%rsi, %rcx
	call	string_append
.L79:
	leaq	48(%rsp), %rcx
	leaq	.LC20(%rip), %rdx
	call	fopen
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L89
	leaq	48(%rsp), %rsi
	movq	%rsi, %rdx
	leaq	.LC22(%rip), %rcx
	call	printf
	movq	$0, 40(%rsp)
	leaq	40(%rsp), %rdx
	movq	%rbx, %rcx
	call	read_source
	movq	%rax, %r14
	movq	%rbx, %rcx
	call	fclose
	call	create_parser
	movq	%rax, %rbx
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %r13
	movq	40(%rsp), %rdx
	movq	%r14, %rcx
	call	create_lexer
	movq	%rax, %rcx
	movq	%rbx, %r8
	movq	%r13, %rdx
	call	parse_code
	movq	%rax, %rbx
	movq	%rsi, %rdx
	leaq	.LC23(%rip), %rcx
	call	printf
	testq	%rbx, %rbx
	je	.L90
	movq	8(%rbx), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	je	.L76
.L85:
	movq	8(%rbx), %rsi
	movq	(%rsi), %rcx
	movq	%rdi, %rdx
	call	string_equal
	testb	%al, %al
	jne	.L84
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L85
	jmp	.L76
.L88:
	leaq	.LC15(%rip), %rdx
	call	strcmp
	testl	%eax, %eax
	je	.L91
	leaq	.LC16(%rip), %rdx
	movq	%rdi, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L80
	movabsq	$8241920901561659182, %rax
	movq	%rax, 48(%rsp)
	movabsq	$27993765531771183, %rax
	movq	%rax, 53(%rsp)
	jmp	.L79
.L91:
	movabsq	$8246143026212319022, %rax
	movq	%rax, 48(%rsp)
	movabsq	$27993765565065586, %rax
	movq	%rax, 55(%rsp)
	jmp	.L79
.L80:
	call	__getreent
	movq	24(%rax), %rcx
	leaq	48(%rsp), %r8
	leaq	.LC17(%rip), %rdx
	call	fprintf
	jmp	.L76
.L89:
	call	__getreent
	movq	24(%rax), %rcx
	leaq	48(%rsp), %r8
	leaq	.LC21(%rip), %rdx
	call	fprintf
	jmp	.L76
.L90:
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rsi, %r8
	leaq	.LC24(%rip), %rdx
	call	fprintf
	jmp	.L76
.L84:
	movq	8(%r12), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	%rsi, %rbx
.L76:
	movq	%rbx, %rax
	leaq	-48(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
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
	jne	.L92
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$14, %eax
	testb	%dl, %dl
	jne	.L92
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$15, %eax
	testb	%dl, %dl
	jne	.L92
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$16, %eax
	testb	%dl, %dl
	jne	.L92
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$17, %eax
	testb	%dl, %dl
	jne	.L92
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$18, %eax
	testb	%dl, %dl
	jne	.L92
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$11, %eax
	testb	%dl, %dl
	jne	.L92
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$12, %eax
	testb	%dl, %dl
	jne	.L92
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$5, %eax
	testb	%dl, %dl
	jne	.L92
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$6, %eax
	testb	%dl, %dl
	jne	.L92
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$7, %eax
	testb	%dl, %dl
	jne	.L92
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$8, %eax
	testb	%dl, %dl
	jne	.L92
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$9, %eax
	testb	%dl, %dl
	jne	.L92
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$10, %eax
	testb	%dl, %dl
	jne	.L92
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$0, %eax
	testb	%dl, %dl
	je	.L114
.L92:
	addq	$32, %rsp
	popq	%rbx
	ret
.L114:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L92
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L110
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L111
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	cmpb	$1, %al
	sbbl	%eax, %eax
	andl	$15, %eax
	addl	$4, %eax
	jmp	.L92
.L110:
	movl	$2, %eax
	jmp	.L92
.L111:
	movl	$3, %eax
	jmp	.L92
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
operator_precedence:
	cmpl	$18, %ecx
	ja	.L116
	movl	%ecx, %ecx
	leaq	.L118(%rip), %rdx
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L118:
	.long	.L122-.L118
	.long	.L122-.L118
	.long	.L121-.L118
	.long	.L121-.L118
	.long	.L121-.L118
	.long	.L120-.L118
	.long	.L120-.L118
	.long	.L120-.L118
	.long	.L120-.L118
	.long	.L120-.L118
	.long	.L120-.L118
	.long	.L123-.L118
	.long	.L123-.L118
	.long	.L117-.L118
	.long	.L117-.L118
	.long	.L117-.L118
	.long	.L117-.L118
	.long	.L117-.L118
	.long	.L117-.L118
	.text
.L117:
	movl	$1, %eax
	ret
.L120:
	movl	$3, %eax
	ret
.L122:
	movl	$4, %eax
	ret
.L121:
	movl	$5, %eax
	ret
.L116:
	movl	$0, %eax
	ret
.L123:
	movl	$2, %eax
	ret
	.globl	operator_to_string
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
operator_to_string:
	cmpl	$18, %ecx
	ja	.L146
	movl	%ecx, %ecx
	leaq	.L127(%rip), %rdx
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L127:
	.long	.L145-.L127
	.long	.L144-.L127
	.long	.L143-.L127
	.long	.L142-.L127
	.long	.L141-.L127
	.long	.L140-.L127
	.long	.L139-.L127
	.long	.L138-.L127
	.long	.L137-.L127
	.long	.L136-.L127
	.long	.L135-.L127
	.long	.L134-.L127
	.long	.L133-.L127
	.long	.L132-.L127
	.long	.L131-.L127
	.long	.L130-.L127
	.long	.L129-.L127
	.long	.L128-.L127
	.long	.L126-.L127
	.text
.L132:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L131:
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L130:
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L129:
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L128:
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L126:
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L134:
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L133:
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L140:
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L139:
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L138:
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L137:
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L136:
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L135:
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L145:
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L144:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L143:
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L142:
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L141:
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
.L146:
	movl	$0, %eax
	ret
.lcomm id_counter.0,8,8
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	string_append;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	read_source;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	create_lexer;	.scl	2;	.type	32;	.endef
	.def	parse_code;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
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
