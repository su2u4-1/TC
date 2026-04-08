	.file	"create.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O1 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Error creating code member: content is NULL\12\0"
	.align 8
.LC1:
	.ascii "Error creating code member: unknown type %u\12\0"
	.text
	.globl	create_code_member
	.def	create_code_member;	.scl	2;	.type	32;	.endef
create_code_member:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movl	%ecx, %esi	 ; tmp124, type
	movq	%rdx, %rdi	 ; tmp125, import_content
	movq	%r8, %r12	 ; tmp126, function_content
	movq	%r9, %rbp	 ; tmp127, class_content
 ; D:/TC/src/create.c:4:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp128, <retval>
 ; D:/TC/src/create.c:5:     code_member->type = type;
	movl	%esi, 8(%rax)	 ; type, code_member_20->type
 ; D:/TC/src/create.c:6:     if (type == CODE_IMPORT && import_content != NULL)
	testl	%esi, %esi	 ; type
	jne	.L2	 ;,
	testq	%rdi, %rdi	 ; import_content
	je	.L2	 ;,
 ; D:/TC/src/create.c:7:         code_member->content.import = import_content;
	movq	%rdi, (%rax)	 ; import_content, code_member_20->content.import
.L1:
 ; D:/TC/src/create.c:17: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L2:
 ; D:/TC/src/create.c:8:     else if (type == CODE_FUNCTION && function_content != NULL)
	cmpl	$1, %esi	 ;, type
	jne	.L4	 ;,
	testq	%r12, %r12	 ; function_content
	je	.L4	 ;,
 ; D:/TC/src/create.c:9:         code_member->content.function = function_content;
	movq	%r12, (%rbx)	 ; function_content, code_member_20->content.function
	jmp	.L1	 ;
.L4:
 ; D:/TC/src/create.c:10:     else if (type == CODE_CLASS && class_content != NULL)
	cmpl	$2, %esi	 ;, type
	jne	.L5	 ;,
	testq	%rbp, %rbp	 ; class_content
	je	.L5	 ;,
 ; D:/TC/src/create.c:11:         code_member->content.class = class_content;
	movq	%rbp, (%rbx)	 ; class_content, code_member_20->content.class
	jmp	.L1	 ;
.L5:
 ; D:/TC/src/create.c:12:     else if (import_content == NULL && function_content == NULL && class_content == NULL)
	movq	%rbp, %r9	 ; class_content, class_content
	orq	%r12, %r9	 ; function_content, class_content
	orq	%rdi, %r9	 ; import_content, tmp131
	je	.L8	 ;,
 ; D:/TC/src/create.c:15:         fprintf(stderr, "Error creating code member: unknown type %u\n", type);
	call	__getreent	 ;
 ; D:/TC/src/create.c:15:         fprintf(stderr, "Error creating code member: unknown type %u\n", type);
	movq	24(%rax), %rcx	 ; _15->_stderr, _15->_stderr
	movl	%esi, %r8d	 ; type,
	leaq	.LC1(%rip), %rdx	 ;, tmp122
	call	fprintf	 ;
 ; D:/TC/src/create.c:16:     return code_member;
	jmp	.L1	 ;
.L8:
 ; D:/TC/src/create.c:13:         fprintf(stderr, "Error creating code member: content is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:13:         fprintf(stderr, "Error creating code member: content is NULL\n");
	movq	24(%rax), %r9	 ; _13->_stderr,
	movl	$44, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp120
	call	fwrite	 ;
 ; D:/TC/src/create.c:13:         fprintf(stderr, "Error creating code member: content is NULL\n");
	jmp	.L1	 ;
	.globl	create_code
	.def	create_code;	.scl	2;	.type	32;	.endef
create_code:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp86, members
	movq	%rdx, %rbx	 ; tmp87, global_scope
 ; D:/TC/src/create.c:20:     Code* code = (Code*)alloc_memory(sizeof(Code));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:21:     code->members = members;
	movq	%rsi, (%rax)	 ; members, code_3->members
 ; D:/TC/src/create.c:22:     code->global_scope = global_scope;
	movq	%rbx, 8(%rax)	 ; global_scope, code_3->global_scope
 ; D:/TC/src/create.c:24: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC2:
	.ascii "Error creating import: name is NULL\12\0"
	.text
	.globl	create_import
	.def	create_import;	.scl	2;	.type	32;	.endef
create_import:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp90, name
 ; D:/TC/src/create.c:27:     if (name == NULL) {
	testq	%rcx, %rcx	 ; name
	je	.L15	 ;,
	movq	%rdx, %rsi	 ; tmp91, source
 ; D:/TC/src/create.c:31:     Import* import = (Import*)alloc_memory(sizeof(Import));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:32:     import->name = name;
	movq	%rbx, (%rax)	 ; name, import_8->name
 ; D:/TC/src/create.c:33:     import->source = source;
	movq	%rsi, 8(%rax)	 ; source, import_8->source
.L11:
 ; D:/TC/src/create.c:35: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
.L15:
 ; D:/TC/src/create.c:28:         fprintf(stderr, "Error creating import: name is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:28:         fprintf(stderr, "Error creating import: name is NULL\n");
	movq	24(%rax), %r9	 ; _1->_stderr,
	movl	$36, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC2(%rip), %rcx	 ;, tmp88
	call	fwrite	 ;
 ; D:/TC/src/create.c:29:         return NULL;
	movq	%rbx, %rax	 ; name, <retval>
	jmp	.L11	 ;
	.section .rdata,"dr"
	.align 8
.LC3:
	.ascii "Error creating function: name or return_type is NULL\12\0"
	.text
	.globl	create_function_use_ptr
	.def	create_function_use_ptr;	.scl	2;	.type	32;	.endef
create_function_use_ptr:
	subq	$40, %rsp	 ;,
 ; D:/TC/src/create.c:38:     if (name == NULL || return_type == NULL) {
	testq	%rdx, %rdx	 ; name
	je	.L20	 ;,
	testq	%r8, %r8	 ; return_type
	je	.L20	 ;,
 ; D:/TC/src/create.c:42:     function->name = name;
	movq	%rdx, (%rcx)	 ; name, function_11(D)->name
 ; D:/TC/src/create.c:43:     function->return_type = return_type;
	movq	%r8, 8(%rcx)	 ; return_type, function_11(D)->return_type
 ; D:/TC/src/create.c:44:     function->parameters = parameters;
	movq	%r9, 16(%rcx)	 ; parameters, function_11(D)->parameters
 ; D:/TC/src/create.c:45:     function->body = body;
	movq	80(%rsp), %rax	 ; body, body
	movq	%rax, 24(%rcx)	 ; body, function_11(D)->body
 ; D:/TC/src/create.c:46:     function->function_scope = function_scope;
	movq	88(%rsp), %rax	 ; function_scope, function_scope
	movq	%rax, 32(%rcx)	 ; function_scope, function_11(D)->function_scope
 ; D:/TC/src/create.c:47:     return function;
	movq	%rcx, %rax	 ; function, <retval>
.L16:
 ; D:/TC/src/create.c:48: }
	addq	$40, %rsp	 ;,
	ret	
.L20:
 ; D:/TC/src/create.c:39:         fprintf(stderr, "Error creating function: name or return_type is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:39:         fprintf(stderr, "Error creating function: name or return_type is NULL\n");
	movq	24(%rax), %r9	 ; _4->_stderr,
	movl	$53, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC3(%rip), %rcx	 ;, tmp99
	call	fwrite	 ;
 ; D:/TC/src/create.c:40:         return NULL;
	movl	$0, %eax	 ;, <retval>
	jmp	.L16	 ;
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "Error creating method: name or return_type is NULL\12\0"
	.text
	.globl	create_method_use_ptr
	.def	create_method_use_ptr;	.scl	2;	.type	32;	.endef
create_method_use_ptr:
	subq	$40, %rsp	 ;,
 ; D:/TC/src/create.c:51:     if (name == NULL || return_type == NULL) {
	testq	%rdx, %rdx	 ; name
	je	.L26	 ;,
	testq	%r8, %r8	 ; return_type
	je	.L26	 ;,
 ; D:/TC/src/create.c:55:     method->name = name;
	movq	%rdx, (%rcx)	 ; name, method_11(D)->name
 ; D:/TC/src/create.c:56:     method->return_type = return_type;
	movq	%r8, 8(%rcx)	 ; return_type, method_11(D)->return_type
 ; D:/TC/src/create.c:57:     method->parameters = parameters;
	movq	%r9, 16(%rcx)	 ; parameters, method_11(D)->parameters
 ; D:/TC/src/create.c:58:     method->body = body;
	movq	80(%rsp), %rax	 ; body, body
	movq	%rax, 24(%rcx)	 ; body, method_11(D)->body
 ; D:/TC/src/create.c:59:     method->method_scope = method_scope;
	movq	88(%rsp), %rax	 ; method_scope, method_scope
	movq	%rax, 32(%rcx)	 ; method_scope, method_11(D)->method_scope
 ; D:/TC/src/create.c:60:     return method;
	movq	%rcx, %rax	 ; method, <retval>
.L22:
 ; D:/TC/src/create.c:61: }
	addq	$40, %rsp	 ;,
	ret	
.L26:
 ; D:/TC/src/create.c:52:         fprintf(stderr, "Error creating method: name or return_type is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:52:         fprintf(stderr, "Error creating method: name or return_type is NULL\n");
	movq	24(%rax), %r9	 ; _4->_stderr,
	movl	$51, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rcx	 ;, tmp99
	call	fwrite	 ;
 ; D:/TC/src/create.c:53:         return NULL;
	movl	$0, %eax	 ;, <retval>
	jmp	.L22	 ;
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "Error creating class member: content is NULL\12\0"
	.align 8
.LC6:
	.ascii "Error creating class member: unknown type %u\12\0"
	.text
	.globl	create_class_member
	.def	create_class_member;	.scl	2;	.type	32;	.endef
create_class_member:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movl	%ecx, %ebx	 ; tmp113, type
	movq	%rdx, %rsi	 ; tmp114, method_content
	movq	%r8, %rdi	 ; tmp115, variable_content
 ; D:/TC/src/create.c:64:     ClassMember* class_member = (ClassMember*)alloc_memory(sizeof(ClassMember));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:65:     class_member->type = type;
	movl	%ebx, 8(%rax)	 ; type, class_member_19->type
 ; D:/TC/src/create.c:66:     if (type == CLASS_METHOD && method_content != NULL)
	testl	%ebx, %ebx	 ; type
	jne	.L29	 ;,
	testq	%rsi, %rsi	 ; method_content
	je	.L29	 ;,
 ; D:/TC/src/create.c:67:         class_member->content.method = method_content;
	movq	%rsi, (%rax)	 ; method_content, class_member_19->content.method
.L28:
 ; D:/TC/src/create.c:78: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
.L29:
 ; D:/TC/src/create.c:68:     else if (type == CLASS_VARIABLE && variable_content != NULL)
	cmpl	$1, %ebx	 ;, type
	jne	.L31	 ;,
	testq	%rdi, %rdi	 ; variable_content
	je	.L31	 ;,
 ; D:/TC/src/create.c:69:         class_member->content.variable = variable_content;
	movq	%rdi, (%rax)	 ; variable_content, class_member_19->content.variable
	jmp	.L28	 ;
.L31:
 ; D:/TC/src/create.c:71:         if (method_content == NULL && variable_content == NULL)
	orq	%rsi, %rdi	 ; method_content, variable_content
	jne	.L32	 ;,
 ; D:/TC/src/create.c:72:             fprintf(stderr, "Error creating class member: content is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:72:             fprintf(stderr, "Error creating class member: content is NULL\n");
	movq	24(%rax), %r9	 ; _10->_stderr,
	movl	$45, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp109
	call	fwrite	 ;
 ; D:/TC/src/create.c:75:         return NULL;
	movl	$0, %eax	 ;, <retval>
	jmp	.L28	 ;
.L32:
 ; D:/TC/src/create.c:74:             fprintf(stderr, "Error creating class member: unknown type %u\n", type);
	call	__getreent	 ;
 ; D:/TC/src/create.c:74:             fprintf(stderr, "Error creating class member: unknown type %u\n", type);
	movq	24(%rax), %rcx	 ; _12->_stderr, _12->_stderr
	movl	%ebx, %r8d	 ; type,
	leaq	.LC6(%rip), %rdx	 ;, tmp111
	call	fprintf	 ;
 ; D:/TC/src/create.c:75:         return NULL;
	movl	$0, %eax	 ;, <retval>
	jmp	.L28	 ;
	.section .rdata,"dr"
	.align 8
.LC7:
	.ascii "Error creating class: name is NULL\12\0"
	.text
	.globl	create_class_use_ptr
	.def	create_class_use_ptr;	.scl	2;	.type	32;	.endef
create_class_use_ptr:
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rdx, %rbx	 ; tmp94, name
 ; D:/TC/src/create.c:81:     if (name == NULL) {
	testq	%rdx, %rdx	 ; name
	je	.L38	 ;,
 ; D:/TC/src/create.c:85:     class->name = name;
	movq	%rdx, (%rcx)	 ; name, class_7(D)->name
 ; D:/TC/src/create.c:86:     class->members = members;
	movq	%r8, 8(%rcx)	 ; members, class_7(D)->members
 ; D:/TC/src/create.c:87:     class->class_scope = class_scope;
	movq	%r9, 16(%rcx)	 ; class_scope, class_7(D)->class_scope
 ; D:/TC/src/create.c:88:     class->size = size;
	movq	80(%rsp), %rax	 ; size, size
	movq	%rax, 24(%rcx)	 ; size, class_7(D)->size
 ; D:/TC/src/create.c:89:     return class;
	movq	%rcx, %rax	 ; class, <retval>
.L34:
 ; D:/TC/src/create.c:90: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
.L38:
 ; D:/TC/src/create.c:82:         fprintf(stderr, "Error creating class: name is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:82:         fprintf(stderr, "Error creating class: name is NULL\n");
	movq	24(%rax), %r9	 ; _1->_stderr,
	movl	$35, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rcx	 ;, tmp91
	call	fwrite	 ;
 ; D:/TC/src/create.c:83:         return NULL;
	movq	%rbx, %rax	 ; name, <retval>
	jmp	.L34	 ;
	.section .rdata,"dr"
	.align 8
.LC8:
	.ascii "Error creating variable: type or name is NULL\12\0"
	.text
	.globl	create_variable
	.def	create_variable;	.scl	2;	.type	32;	.endef
create_variable:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:/TC/src/create.c:93:     if (type == NULL || name == NULL) {
	testq	%rcx, %rcx	 ; type
	je	.L43	 ;,
	movq	%rcx, %rbx	 ; tmp98, type
	movq	%rdx, %rsi	 ; tmp99, name
	movq	%r8, %rdi	 ; tmp100, value
	testq	%rdx, %rdx	 ; name
	je	.L43	 ;,
 ; D:/TC/src/create.c:97:     Variable* variable = (Variable*)alloc_memory(sizeof(Variable));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:98:     variable->type = type;
	movq	%rbx, (%rax)	 ; type, variable_12->type
 ; D:/TC/src/create.c:99:     variable->name = name;
	movq	%rsi, 8(%rax)	 ; name, variable_12->name
 ; D:/TC/src/create.c:100:     variable->value = value;
	movq	%rdi, 16(%rax)	 ; value, variable_12->value
.L39:
 ; D:/TC/src/create.c:102: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
.L43:
 ; D:/TC/src/create.c:94:         fprintf(stderr, "Error creating variable: type or name is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:94:         fprintf(stderr, "Error creating variable: type or name is NULL\n");
	movq	24(%rax), %r9	 ; _4->_stderr,
	movl	$46, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC8(%rip), %rcx	 ;, tmp96
	call	fwrite	 ;
 ; D:/TC/src/create.c:95:         return NULL;
	movl	$0, %eax	 ;, <retval>
	jmp	.L39	 ;
	.section .rdata,"dr"
	.align 8
.LC9:
	.ascii "Error creating statement: content is NULL\12\0"
	.align 8
.LC10:
	.ascii "Error creating statement: unknown type %u\12\0"
	.text
	.globl	create_statement
	.def	create_statement;	.scl	2;	.type	32;	.endef
create_statement:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movl	%ecx, %ebx	 ; tmp148, type
	movq	%rdx, %rsi	 ; tmp149, if_stmt
	movq	%r8, %rbp	 ; tmp150, while_stmt
	movq	%r9, %rdi	 ; tmp151, for_stmt
	movq	112(%rsp), %r12	 ; expr, expr
 ; D:/TC/src/create.c:105:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:106:     statement->type = type;
	movl	%ebx, 8(%rax)	 ; type, statement_32->type
 ; D:/TC/src/create.c:107:     if (type == EXPRESSION_STATEMENT && expr != NULL)
	testl	%ebx, %ebx	 ; type
	jne	.L46	 ;,
	testq	%r12, %r12	 ; expr
	je	.L46	 ;,
 ; D:/TC/src/create.c:108:         statement->stmt.expr = expr;
	movq	%r12, (%rax)	 ; expr, statement_32->stmt.expr
.L45:
 ; D:/TC/src/create.c:129: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L46:
 ; D:/TC/src/create.c:109:     else if (type == VARIABLE_STATEMENT && var_stmt != NULL)
	cmpl	$1, %ebx	 ;, type
	jne	.L48	 ;,
	cmpq	$0, 120(%rsp)	 ;, var_stmt
	je	.L48	 ;,
 ; D:/TC/src/create.c:110:         statement->stmt.var = var_stmt;
	movq	120(%rsp), %rdi	 ; var_stmt, tmp157
	movq	%rdi, (%rax)	 ; tmp157, statement_32->stmt.var
	jmp	.L45	 ;
.L48:
 ; D:/TC/src/create.c:111:     else if (type == IF_STATEMENT && if_stmt != NULL)
	cmpl	$2, %ebx	 ;, type
	jne	.L49	 ;,
	testq	%rsi, %rsi	 ; if_stmt
	je	.L49	 ;,
 ; D:/TC/src/create.c:112:         statement->stmt.if_stmt = if_stmt;
	movq	%rsi, (%rax)	 ; if_stmt, statement_32->stmt.if_stmt
	jmp	.L45	 ;
.L49:
 ; D:/TC/src/create.c:113:     else if (type == WHILE_STATEMENT && while_stmt != NULL)
	cmpl	$3, %ebx	 ;, type
	jne	.L50	 ;,
	testq	%rbp, %rbp	 ; while_stmt
	je	.L50	 ;,
 ; D:/TC/src/create.c:114:         statement->stmt.while_stmt = while_stmt;
	movq	%rbp, (%rax)	 ; while_stmt, statement_32->stmt.while_stmt
	jmp	.L45	 ;
.L50:
 ; D:/TC/src/create.c:115:     else if (type == FOR_STATEMENT && for_stmt != NULL)
	cmpl	$4, %ebx	 ;, type
	jne	.L51	 ;,
	testq	%rdi, %rdi	 ; for_stmt
	je	.L51	 ;,
 ; D:/TC/src/create.c:116:         statement->stmt.for_stmt = for_stmt;
	movq	%rdi, (%rax)	 ; for_stmt, statement_32->stmt.for_stmt
	jmp	.L45	 ;
.L51:
 ; D:/TC/src/create.c:117:     else if (type == RETURN_STATEMENT)
	cmpl	$5, %ebx	 ;, type
	je	.L56	 ;,
 ; D:/TC/src/create.c:119:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	leal	-6(%rbx), %edx	 ;, tmp138
 ; D:/TC/src/create.c:119:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	cmpl	$1, %edx	 ;, tmp138
	ja	.L53	 ;,
 ; D:/TC/src/create.c:120:         statement->stmt.expr = NULL;
	movq	$0, (%rax)	 ;, statement_32->stmt.expr
	jmp	.L45	 ;
.L56:
 ; D:/TC/src/create.c:118:         statement->stmt.return_expr = expr;
	movq	%r12, (%rax)	 ; expr, statement_32->stmt.return_expr
	jmp	.L45	 ;
.L53:
 ; D:/TC/src/create.c:122:         if (if_stmt == NULL && while_stmt == NULL && for_stmt == NULL && expr == NULL && var_stmt == NULL)
	orq	%rbp, %rdi	 ; while_stmt, for_stmt
	orq	%rdi, %rsi	 ; tmp139, tmp140
	movq	%rsi, %rax	 ; tmp140, tmp140
	orq	120(%rsp), %rax	 ; var_stmt, tmp140
	orq	%r12, %rax	 ; expr, tmp155
	je	.L57	 ;,
 ; D:/TC/src/create.c:125:             fprintf(stderr, "Error creating statement: unknown type %u\n", type);
	call	__getreent	 ;
 ; D:/TC/src/create.c:125:             fprintf(stderr, "Error creating statement: unknown type %u\n", type);
	movq	24(%rax), %rcx	 ; _25->_stderr, _25->_stderr
	movl	%ebx, %r8d	 ; type,
	leaq	.LC10(%rip), %rdx	 ;, tmp146
	call	fprintf	 ;
 ; D:/TC/src/create.c:126:         return NULL;
	movl	$0, %eax	 ;, <retval>
	jmp	.L45	 ;
.L57:
 ; D:/TC/src/create.c:123:             fprintf(stderr, "Error creating statement: content is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:123:             fprintf(stderr, "Error creating statement: content is NULL\n");
	movq	24(%rax), %r9	 ; _23->_stderr,
	movl	$42, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC9(%rip), %rcx	 ;, tmp144
	call	fwrite	 ;
 ; D:/TC/src/create.c:126:         return NULL;
	movl	$0, %eax	 ;, <retval>
 ; D:/TC/src/create.c:123:             fprintf(stderr, "Error creating statement: content is NULL\n");
	jmp	.L45	 ;
	.section .rdata,"dr"
	.align 8
.LC11:
	.ascii "Error creating if statement: condition is NULL\12\0"
	.text
	.globl	create_if
	.def	create_if;	.scl	2;	.type	32;	.endef
create_if:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp92, condition
 ; D:/TC/src/create.c:132:     if (condition == NULL) {
	testq	%rcx, %rcx	 ; condition
	je	.L62	 ;,
	movq	%rdx, %rbp	 ; tmp93, body
	movq	%r8, %rdi	 ; tmp94, else_if
	movq	%r9, %rsi	 ; tmp95, else_body
 ; D:/TC/src/create.c:136:     If* if_ = (If*)alloc_memory(sizeof(If));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:137:     if_->condition = condition;
	movq	%rbx, (%rax)	 ; condition, if__8->condition
 ; D:/TC/src/create.c:138:     if_->body = body;
	movq	%rbp, 8(%rax)	 ; body, if__8->body
 ; D:/TC/src/create.c:139:     if_->else_if = else_if;
	movq	%rdi, 16(%rax)	 ; else_if, if__8->else_if
 ; D:/TC/src/create.c:140:     if_->else_body = else_body;
	movq	%rsi, 24(%rax)	 ; else_body, if__8->else_body
.L58:
 ; D:/TC/src/create.c:142: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L62:
 ; D:/TC/src/create.c:133:         fprintf(stderr, "Error creating if statement: condition is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:133:         fprintf(stderr, "Error creating if statement: condition is NULL\n");
	movq	24(%rax), %r9	 ; _1->_stderr,
	movl	$47, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC11(%rip), %rcx	 ;, tmp90
	call	fwrite	 ;
 ; D:/TC/src/create.c:134:         return NULL;
	movq	%rbx, %rax	 ; condition, <retval>
	jmp	.L58	 ;
	.section .rdata,"dr"
	.align 8
.LC12:
	.ascii "Error creating else-if statement: condition is NULL\12\0"
	.text
	.globl	create_else_if
	.def	create_else_if;	.scl	2;	.type	32;	.endef
create_else_if:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp90, condition
 ; D:/TC/src/create.c:145:     if (condition == NULL) {
	testq	%rcx, %rcx	 ; condition
	je	.L67	 ;,
	movq	%rdx, %rsi	 ; tmp91, body
 ; D:/TC/src/create.c:149:     ElseIf* else_if = (ElseIf*)alloc_memory(sizeof(ElseIf));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:150:     else_if->condition = condition;
	movq	%rbx, (%rax)	 ; condition, else_if_8->condition
 ; D:/TC/src/create.c:151:     else_if->body = body;
	movq	%rsi, 8(%rax)	 ; body, else_if_8->body
.L63:
 ; D:/TC/src/create.c:153: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
.L67:
 ; D:/TC/src/create.c:146:         fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:146:         fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
	movq	24(%rax), %r9	 ; _1->_stderr,
	movl	$52, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC12(%rip), %rcx	 ;, tmp88
	call	fwrite	 ;
 ; D:/TC/src/create.c:147:         return NULL;
	movq	%rbx, %rax	 ; condition, <retval>
	jmp	.L63	 ;
	.globl	create_for
	.def	create_for;	.scl	2;	.type	32;	.endef
create_for:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rbp	 ; tmp88, initializer
	movq	%rdx, %rdi	 ; tmp89, condition
	movq	%r8, %rsi	 ; tmp90, increment
	movq	%r9, %rbx	 ; tmp91, body
 ; D:/TC/src/create.c:156:     For* for_ = (For*)alloc_memory(sizeof(For));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:157:     for_->initializer = initializer;
	movq	%rbp, (%rax)	 ; initializer, for__3->initializer
 ; D:/TC/src/create.c:158:     for_->condition = condition;
	movq	%rdi, 8(%rax)	 ; condition, for__3->condition
 ; D:/TC/src/create.c:159:     for_->increment = increment;
	movq	%rsi, 16(%rax)	 ; increment, for__3->increment
 ; D:/TC/src/create.c:160:     for_->body = body;
	movq	%rbx, 24(%rax)	 ; body, for__3->body
 ; D:/TC/src/create.c:162: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.globl	create_while
	.def	create_while;	.scl	2;	.type	32;	.endef
create_while:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp86, condition
	movq	%rdx, %rbx	 ; tmp87, body
 ; D:/TC/src/create.c:165:     While* while_ = (While*)alloc_memory(sizeof(While));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:166:     while_->condition = condition;
	movq	%rsi, (%rax)	 ; condition, while__3->condition
 ; D:/TC/src/create.c:167:     while_->body = body;
	movq	%rbx, 8(%rax)	 ; body, while__3->body
 ; D:/TC/src/create.c:169: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.section .rdata,"dr"
.LC13:
	.ascii "true\0"
.LC14:
	.ascii "false\0"
	.align 8
.LC15:
	.ascii "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\12\0"
	.align 8
.LC16:
	.ascii "Error creating expression: both expr_left and prim_left are NULL\12\0"
	.text
	.globl	create_expression
	.def	create_expression;	.scl	2;	.type	32;	.endef
create_expression:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
	movl	%ecx, %ebx	 ; tmp122, operator
	movq	%rdx, %rsi	 ; tmp123, expr_left
	movq	%r8, %rbp	 ; tmp124, prim_left
	movq	%r9, %rdi	 ; tmp125, right
 ; D:/TC/src/create.c:172:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	cmpl	$19, %ecx	 ;, operator
	sete	%dl	 ;, tmp101
	testq	%r9, %r9	 ; right
	sete	%al	 ;, tmp103
 ; D:/TC/src/create.c:172:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	cmpb	%al, %dl	 ; tmp103, tmp101
	jne	.L73	 ;,
 ; D:/TC/src/create.c:172:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	movq	%r8, %rax	 ; prim_left, tmp129
	orq	%rsi, %rax	 ; expr_left, tmp129
	je	.L91	 ;,
 ; D:/TC/src/create.c:180:     Expression* expression = (Expression*)alloc_memory(sizeof(Expression));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:181:     expression->operator = operator;
	movl	%ebx, 24(%rax)	 ; operator, expression_23->operator
 ; D:/TC/src/create.c:182:     if (expr_left != NULL)
	testq	%rsi, %rsi	 ; expr_left
	je	.L81	 ;,
 ; D:/TC/src/create.c:183:         expression->expr_left = expr_left;
	movq	%rsi, (%rax)	 ; expr_left, expression_23->expr_left
.L82:
 ; D:/TC/src/create.c:190:     expression->right = right;
	movq	%rdi, 16(%rax)	 ; right, expression_23->right
 ; D:/TC/src/create.c:191:     return expression;
	jmp	.L72	 ;
.L73:
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%r9, %r9	 ; right
	leaq	.LC13(%rip), %rdi	 ;, tmp110
	leaq	.LC14(%rip), %rax	 ;, tmp111
	cmovne	%rax, %rdi	 ; tmp110,, tmp111, iftmp.0_4
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%r8, %r8	 ; prim_left
	movq	%rax, %rbp	 ;, tmp120
	leaq	.LC13(%rip), %rax	 ;, tmp121
	cmove	%rax, %rbp	 ; tmp120,, tmp121, iftmp.1_3
.L77:
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%rsi, %rsi	 ; expr_left
	leaq	.LC14(%rip), %rsi	 ;, tmp112
	leaq	.LC13(%rip), %rax	 ;, tmp113
	cmove	%rax, %rsi	 ; tmp112,, tmp113, iftmp.2_12
.L78:
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	cmpl	$19, %ebx	 ;, operator
	leaq	.LC14(%rip), %rbx	 ;, tmp114
	leaq	.LC13(%rip), %rax	 ;, tmp115
	cmove	%rax, %rbx	 ; tmp114,, tmp115, iftmp.3_13
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	call	__getreent	 ;
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	24(%rax), %rcx	 ; _6->_stderr, _6->_stderr
	movq	%rdi, 40(%rsp)	 ; iftmp.0_4,
	movq	%rbp, 32(%rsp)	 ; iftmp.1_3,
	movq	%rsi, %r9	 ; iftmp.2_12,
	movq	%rbx, %r8	 ; iftmp.3_13,
	leaq	.LC15(%rip), %rdx	 ;, tmp106
	call	fprintf	 ;
 ; D:/TC/src/create.c:178:         return NULL;
	movl	$0, %eax	 ;, <retval>
.L72:
 ; D:/TC/src/create.c:192: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L88:
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC13(%rip), %rdi	 ;, iftmp.0_4
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%rdi, %rbp	 ; iftmp.0_4, iftmp.1_3
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%rdi, %rsi	 ; iftmp.0_4, iftmp.2_12
	jmp	.L78	 ;
.L81:
 ; D:/TC/src/create.c:184:     else if (prim_left != NULL)
	testq	%rbp, %rbp	 ; prim_left
	je	.L83	 ;,
 ; D:/TC/src/create.c:185:         expression->prim_left = prim_left;
	movq	%rbp, 8(%rax)	 ; prim_left, expression_23->prim_left
	jmp	.L82	 ;
.L83:
 ; D:/TC/src/create.c:187:         fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:187:         fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
	movq	24(%rax), %r9	 ; _8->_stderr,
	movl	$65, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rcx	 ;, tmp108
	call	fwrite	 ;
 ; D:/TC/src/create.c:188:         return NULL;
	movq	%rbp, %rax	 ; prim_left, <retval>
	jmp	.L72	 ;
.L91:
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%r9, %r9	 ; right
	je	.L88	 ;,
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC14(%rip), %rdi	 ;, iftmp.0_4
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC13(%rip), %rbp	 ;, iftmp.1_3
	jmp	.L77	 ;
	.section .rdata,"dr"
	.align 8
.LC17:
	.ascii "Error creating primary: value is NULL\12\0"
	.align 8
.LC18:
	.ascii "Error creating primary: unknown type %u\12\0"
	.text
	.globl	create_primary
	.def	create_primary;	.scl	2;	.type	32;	.endef
create_primary:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movl	%ecx, %ebx	 ; tmp137, type
	movq	%rdx, %rsi	 ; tmp138, str_value
	movq	%r8, %rbp	 ; tmp139, expr_value
	movq	%r9, %rdi	 ; tmp140, prim_value
 ; D:/TC/src/create.c:195:     Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:196:     primary->type = type;
	movl	%ebx, 8(%rax)	 ; type, primary_26->type
 ; D:/TC/src/create.c:197:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != NULL)
	cmpl	$4, %ebx	 ;, type
	ja	.L93	 ;,
	testq	%rsi, %rsi	 ; str_value
	je	.L93	 ;,
 ; D:/TC/src/create.c:198:         primary->value.literal_value = str_value;
	movq	%rsi, (%rax)	 ; str_value, primary_26->value.literal_value
.L92:
 ; D:/TC/src/create.c:213: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L93:
 ; D:/TC/src/create.c:199:     else if (type == PRIM_EXPRESSION && expr_value != NULL)
	cmpl	$5, %ebx	 ;, type
	jne	.L95	 ;,
	testq	%rbp, %rbp	 ; expr_value
	je	.L95	 ;,
 ; D:/TC/src/create.c:200:         primary->value.expr = expr_value;
	movq	%rbp, (%rax)	 ; expr_value, primary_26->value.expr
	jmp	.L92	 ;
.L95:
 ; D:/TC/src/create.c:201:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	leal	-6(%rbx), %edx	 ;, tmp120
 ; D:/TC/src/create.c:201:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	cmpl	$1, %edx	 ;, tmp120
	ja	.L96	 ;,
	testq	%rdi, %rdi	 ; prim_value
	jne	.L100	 ;,
.L96:
 ; D:/TC/src/create.c:203:     else if (type == PRIM_VARIABLE_ACCESS && variable_value != NULL)
	cmpl	$8, %ebx	 ;, type
	jne	.L97	 ;,
	cmpq	$0, 112(%rsp)	 ;, variable_value
	je	.L97	 ;,
 ; D:/TC/src/create.c:204:         primary->value.var = variable_value;
	movq	112(%rsp), %rdi	 ; variable_value, tmp146
	movq	%rdi, (%rax)	 ; tmp146, primary_26->value.var
	jmp	.L92	 ;
.L100:
 ; D:/TC/src/create.c:202:         primary->value.operand = prim_value;
	movq	%rdi, (%rax)	 ; prim_value, primary_26->value.operand
	jmp	.L92	 ;
.L97:
 ; D:/TC/src/create.c:206:         if (str_value == NULL && expr_value == NULL && prim_value == NULL && variable_value == NULL)
	movq	%rdi, %rax	 ; prim_value, prim_value
	orq	112(%rsp), %rax	 ; variable_value, prim_value
	movq	%rbp, %r8	 ; expr_value, expr_value
	orq	%rax, %r8	 ; tmp129, expr_value
	orq	%rsi, %r8	 ; str_value, tmp144
	jne	.L98	 ;,
 ; D:/TC/src/create.c:207:             fprintf(stderr, "Error creating primary: value is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:207:             fprintf(stderr, "Error creating primary: value is NULL\n");
	movq	24(%rax), %r9	 ; _17->_stderr,
	movl	$38, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC17(%rip), %rcx	 ;, tmp133
	call	fwrite	 ;
 ; D:/TC/src/create.c:210:         return NULL;
	movl	$0, %eax	 ;, <retval>
 ; D:/TC/src/create.c:207:             fprintf(stderr, "Error creating primary: value is NULL\n");
	jmp	.L92	 ;
.L98:
 ; D:/TC/src/create.c:209:             fprintf(stderr, "Error creating primary: unknown type %u\n", type);
	call	__getreent	 ;
 ; D:/TC/src/create.c:209:             fprintf(stderr, "Error creating primary: unknown type %u\n", type);
	movq	24(%rax), %rcx	 ; _19->_stderr, _19->_stderr
	movl	%ebx, %r8d	 ; type,
	leaq	.LC18(%rip), %rdx	 ;, tmp135
	call	fprintf	 ;
 ; D:/TC/src/create.c:210:         return NULL;
	movl	$0, %eax	 ;, <retval>
	jmp	.L92	 ;
	.section .rdata,"dr"
	.align 8
.LC19:
	.ascii "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\12\0"
	.align 8
.LC20:
	.ascii "Error creating variable access: content is NULL\12\0"
	.align 8
.LC21:
	.ascii "Error creating variable access: unknown type %u\12\0"
	.text
	.globl	create_variable_access
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
create_variable_access:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movl	%ecx, %ebx	 ; tmp140, type
	movq	%rdx, %rsi	 ; tmp141, base
 ; D:/TC/src/create.c:216:     if ((base == NULL) != (type == VAR_NAME)) {
	testl	%ecx, %ecx	 ; type
	sete	%r12b	 ;, _2
	testq	%rdx, %rdx	 ; base
	sete	%al	 ;, tmp115
 ; D:/TC/src/create.c:216:     if ((base == NULL) != (type == VAR_NAME)) {
	cmpb	%r12b, %al	 ; _2, tmp115
	jne	.L114	 ;,
	movq	%r8, %rbp	 ; tmp142, name_content
	movq	%r9, %rdi	 ; tmp143, expr_content
 ; D:/TC/src/create.c:220:     VariableAccess* variable_access = (VariableAccess*)alloc_memory(sizeof(VariableAccess));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:221:     variable_access->type = type;
	movl	%ebx, 16(%rax)	 ; type, variable_access_31->type
 ; D:/TC/src/create.c:222:     variable_access->base = base;
	movq	%rsi, (%rax)	 ; base, variable_access_31->base
 ; D:/TC/src/create.c:223:     if (type == VAR_NAME && name_content != NULL)
	testq	%rbp, %rbp	 ; name_content
	setne	%dl	 ;, _5
 ; D:/TC/src/create.c:223:     if (type == VAR_NAME && name_content != NULL)
	testb	%r12b, %r12b	 ; _2
	je	.L106	 ;,
	testb	%dl, %dl	 ; _5
	je	.L106	 ;,
 ; D:/TC/src/create.c:224:         variable_access->content.name = name_content;
	movq	%rbp, 8(%rax)	 ; name_content, variable_access_31->content.name
	jmp	.L101	 ;
.L114:
 ; D:/TC/src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	testl	%ecx, %ecx	 ; type
	leaq	.LC14(%rip), %rdi	 ;, tmp136
	leaq	.LC13(%rip), %rax	 ;, tmp137
	cmove	%rax, %rdi	 ; tmp136,, tmp137, iftmp.4_22
 ; D:/TC/src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	testq	%rdx, %rdx	 ; base
	leaq	.LC14(%rip), %rbx	 ;, tmp138
	cmove	%rax, %rbx	 ; tmp138,, tmp139, iftmp.5_23
 ; D:/TC/src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	call	__getreent	 ;
 ; D:/TC/src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movq	24(%rax), %rcx	 ; _3->_stderr, _3->_stderr
	movq	%rdi, %r9	 ; iftmp.4_22,
	movq	%rbx, %r8	 ; iftmp.5_23,
	leaq	.LC19(%rip), %rdx	 ;, tmp117
	call	fprintf	 ;
 ; D:/TC/src/create.c:218:         return NULL;
	movl	$0, %eax	 ;, <retval>
.L101:
 ; D:/TC/src/create.c:239: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L106:
 ; D:/TC/src/create.c:225:     else if (type == VAR_FUNC_CALL && args_content != NULL)
	cmpl	$1, %ebx	 ;, type
	jne	.L107	 ;,
	cmpq	$0, 112(%rsp)	 ;, args_content
	je	.L107	 ;,
 ; D:/TC/src/create.c:226:         variable_access->content.args = args_content;
	movq	112(%rsp), %rdi	 ; args_content, tmp150
	movq	%rdi, 8(%rax)	 ; tmp150, variable_access_31->content.args
	jmp	.L101	 ;
.L107:
 ; D:/TC/src/create.c:227:     else if (type == VAR_GET_SEQ && expr_content != NULL)
	cmpl	$3, %ebx	 ;, type
	jne	.L108	 ;,
	testq	%rdi, %rdi	 ; expr_content
	je	.L108	 ;,
 ; D:/TC/src/create.c:228:         variable_access->content.index = expr_content;
	movq	%rdi, 8(%rax)	 ; expr_content, variable_access_31->content.index
	jmp	.L101	 ;
.L108:
 ; D:/TC/src/create.c:229:     else if (type == VAR_GET_ATTR && name_content != NULL)
	cmpl	$2, %ebx	 ;, type
	jne	.L109	 ;,
	testb	%dl, %dl	 ; _5
	je	.L109	 ;,
 ; D:/TC/src/create.c:230:         variable_access->content.attr_name = name_content;
	movq	%rbp, 8(%rax)	 ; name_content, variable_access_31->content.attr_name
	jmp	.L101	 ;
.L109:
 ; D:/TC/src/create.c:232:         if (name_content == NULL && expr_content == NULL && args_content == NULL)
	orq	112(%rsp), %rdi	 ; args_content, expr_content
	movq	%rdi, %r9	 ; expr_content, tmp129
	orq	%rbp, %r9	 ; name_content, tmp148
	je	.L115	 ;,
 ; D:/TC/src/create.c:235:             fprintf(stderr, "Error creating variable access: unknown type %u\n", type);
	call	__getreent	 ;
 ; D:/TC/src/create.c:235:             fprintf(stderr, "Error creating variable access: unknown type %u\n", type);
	movq	24(%rax), %rcx	 ; _20->_stderr, _20->_stderr
	movl	%ebx, %r8d	 ; type,
	leaq	.LC21(%rip), %rdx	 ;, tmp134
	call	fprintf	 ;
 ; D:/TC/src/create.c:236:         return NULL;
	movl	$0, %eax	 ;, <retval>
	jmp	.L101	 ;
.L115:
 ; D:/TC/src/create.c:233:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:233:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	movq	24(%rax), %r9	 ; _18->_stderr,
	movl	$48, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC20(%rip), %rcx	 ;, tmp132
	call	fwrite	 ;
 ; D:/TC/src/create.c:236:         return NULL;
	movl	$0, %eax	 ;, <retval>
 ; D:/TC/src/create.c:233:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	jmp	.L101	 ;
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
