	.file	"create.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Error creating code member: content is NULL\12\0"
.LC1:
	.ascii "Error creating code member: unknown type %u\12\0"
	.text
	.globl	create_code_member
	.def	create_code_member;	.scl	2;	.type	32;	.endef
create_code_member:
	pushq	%r12	 ;
	movq	%r8, %r12	 ; tmp126, function_content
	pushq	%rbp	 ;
	movq	%rdx, %rbp	 ; tmp125, import_content
	pushq	%rdi	 ;
	movq	%r9, %rdi	 ; tmp127, class_content
	pushq	%rsi	 ;
	movl	%ecx, %esi	 ; tmp124, type
 ; D:/TC/src/create.c:4:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	movl	$16, %ecx	 ;,
 ; D:/TC/src/create.c:3: CodeMember* create_code_member(CodeMemberType type, Import* import_content, Function* function_content, Class* class_content) {
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:/TC/src/create.c:4:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:5:     code_member->type = type;
	movl	%esi, 8(%rax)	 ; type, code_member_20->type
 ; D:/TC/src/create.c:4:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	movq	%rax, %rbx	 ; tmp128, <retval>
 ; D:/TC/src/create.c:6:     if (type == CODE_IMPORT && import_content != NULL)
	testl	%esi, %esi	 ; type
	jne	.L2	 ;,
	testq	%rbp, %rbp	 ; import_content
	je	.L2	 ;,
 ; D:/TC/src/create.c:7:         code_member->content.import = import_content;
	movq	%rbp, (%rax)	 ; import_content, code_member_20->content.import
	jmp	.L1	 ;
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
	testq	%rdi, %rdi	 ; class_content
	je	.L5	 ;,
 ; D:/TC/src/create.c:11:         code_member->content.class = class_content;
	movq	%rdi, (%rbx)	 ; class_content, code_member_20->content.class
	jmp	.L1	 ;
.L5:
 ; D:/TC/src/create.c:12:     else if (import_content == NULL && function_content == NULL && class_content == NULL)
	orq	%r12, %rdi	 ; function_content, tmp117
	orq	%rdi, %rbp	 ; tmp117, tmp131
	jne	.L6	 ;,
 ; D:/TC/src/create.c:13:         fprintf(stderr, "Error creating code member: content is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:13:         fprintf(stderr, "Error creating code member: content is NULL\n");
	leaq	.LC0(%rip), %rcx	 ;, tmp120
	movq	24(%rax), %rdx	 ; _13->_stderr, _13->_stderr
	call	fputs	 ;
 ; D:/TC/src/create.c:13:         fprintf(stderr, "Error creating code member: content is NULL\n");
	jmp	.L1	 ;
.L6:
 ; D:/TC/src/create.c:15:         fprintf(stderr, "Error creating code member: unknown type %u\n", type);
	call	__getreent	 ;
 ; D:/TC/src/create.c:15:         fprintf(stderr, "Error creating code member: unknown type %u\n", type);
	movl	%esi, %r8d	 ; type,
	leaq	.LC1(%rip), %rdx	 ;, tmp122
	movq	24(%rax), %rcx	 ; _15->_stderr, _15->_stderr
	call	fprintf	 ;
.L1:
 ; D:/TC/src/create.c:17: }
	addq	$32, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.globl	create_code
	.def	create_code;	.scl	2;	.type	32;	.endef
create_code:
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp86, members
 ; D:/TC/src/create.c:20:     Code* code = (Code*)alloc_memory(sizeof(Code));
	movl	$16, %ecx	 ;,
 ; D:/TC/src/create.c:19: Code* create_code(list(CodeMember*) members, SymbolTable* global_scope) {
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp87, global_scope
	subq	$40, %rsp	 ;,
 ; D:/TC/src/create.c:20:     Code* code = (Code*)alloc_memory(sizeof(Code));
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
.LC2:
	.ascii "Error creating import: name is NULL\12\0"
	.text
	.globl	create_import
	.def	create_import;	.scl	2;	.type	32;	.endef
create_import:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:/TC/src/create.c:27:     if (name == NULL) {
	testq	%rcx, %rcx	 ; name
	jne	.L30	 ;,
 ; D:/TC/src/create.c:28:         fprintf(stderr, "Error creating import: name is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:28:         fprintf(stderr, "Error creating import: name is NULL\n");
	leaq	.LC2(%rip), %rcx	 ;, tmp88
	movq	24(%rax), %rdx	 ; _1->_stderr, _1->_stderr
	call	fputs	 ;
 ; D:/TC/src/create.c:29:         return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L29	 ;
.L30:
	movq	%rcx, %rbx	 ; tmp90, name
 ; D:/TC/src/create.c:31:     Import* import = (Import*)alloc_memory(sizeof(Import));
	movl	$16, %ecx	 ;,
	movq	%rdx, %rsi	 ; tmp91, source
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:32:     import->name = name;
	movq	%rbx, (%rax)	 ; name, import_8->name
 ; D:/TC/src/create.c:33:     import->source = source;
	movq	%rsi, 8(%rax)	 ; source, import_8->source
.L29:
 ; D:/TC/src/create.c:35: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.section .rdata,"dr"
.LC3:
	.ascii "Error creating function: name or return_type is NULL\12\0"
	.text
	.globl	create_function_use_ptr
	.def	create_function_use_ptr;	.scl	2;	.type	32;	.endef
create_function_use_ptr:
	subq	$40, %rsp	 ;,
 ; D:/TC/src/create.c:38:     if (name == NULL || return_type == NULL) {
	testq	%rdx, %rdx	 ; name
	je	.L37	 ;,
	testq	%r8, %r8	 ; return_type
	jne	.L34	 ;,
.L37:
 ; D:/TC/src/create.c:39:         fprintf(stderr, "Error creating function: name or return_type is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:39:         fprintf(stderr, "Error creating function: name or return_type is NULL\n");
	leaq	.LC3(%rip), %rcx	 ;, tmp99
	movq	24(%rax), %rdx	 ; _4->_stderr, _4->_stderr
	call	fputs	 ;
 ; D:/TC/src/create.c:40:         return NULL;
	xorl	%eax, %eax	 ; function
	jmp	.L36	 ;
.L34:
 ; D:/TC/src/create.c:42:     function->name = name;
	movq	%rdx, (%rcx)	 ; name, function_11(D)->name
 ; D:/TC/src/create.c:45:     function->body = body;
	movq	80(%rsp), %rdx	 ; body, body
	movq	%rcx, %rax	 ; tmp101, function
 ; D:/TC/src/create.c:43:     function->return_type = return_type;
	movq	%r8, 8(%rcx)	 ; return_type, function_11(D)->return_type
 ; D:/TC/src/create.c:45:     function->body = body;
	movq	%rdx, 24(%rcx)	 ; body, function_11(D)->body
 ; D:/TC/src/create.c:46:     function->function_scope = function_scope;
	movq	88(%rsp), %rdx	 ; function_scope, function_scope
 ; D:/TC/src/create.c:44:     function->parameters = parameters;
	movq	%r9, 16(%rcx)	 ; parameters, function_11(D)->parameters
 ; D:/TC/src/create.c:46:     function->function_scope = function_scope;
	movq	%rdx, 32(%rcx)	 ; function_scope, function_11(D)->function_scope
.L36:
 ; D:/TC/src/create.c:48: }
	addq	$40, %rsp	 ;,
	ret	
	.section .rdata,"dr"
.LC4:
	.ascii "Error creating method: name or return_type is NULL\12\0"
	.text
	.globl	create_method_use_ptr
	.def	create_method_use_ptr;	.scl	2;	.type	32;	.endef
create_method_use_ptr:
	subq	$40, %rsp	 ;,
 ; D:/TC/src/create.c:51:     if (name == NULL || return_type == NULL) {
	testq	%rdx, %rdx	 ; name
	je	.L43	 ;,
	testq	%r8, %r8	 ; return_type
	jne	.L40	 ;,
.L43:
 ; D:/TC/src/create.c:52:         fprintf(stderr, "Error creating method: name or return_type is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:52:         fprintf(stderr, "Error creating method: name or return_type is NULL\n");
	leaq	.LC4(%rip), %rcx	 ;, tmp99
	movq	24(%rax), %rdx	 ; _4->_stderr, _4->_stderr
	call	fputs	 ;
 ; D:/TC/src/create.c:53:         return NULL;
	xorl	%eax, %eax	 ; method
	jmp	.L42	 ;
.L40:
 ; D:/TC/src/create.c:55:     method->name = name;
	movq	%rdx, (%rcx)	 ; name, method_11(D)->name
 ; D:/TC/src/create.c:58:     method->body = body;
	movq	80(%rsp), %rdx	 ; body, body
	movq	%rcx, %rax	 ; tmp101, method
 ; D:/TC/src/create.c:56:     method->return_type = return_type;
	movq	%r8, 8(%rcx)	 ; return_type, method_11(D)->return_type
 ; D:/TC/src/create.c:58:     method->body = body;
	movq	%rdx, 24(%rcx)	 ; body, method_11(D)->body
 ; D:/TC/src/create.c:59:     method->method_scope = method_scope;
	movq	88(%rsp), %rdx	 ; method_scope, method_scope
 ; D:/TC/src/create.c:57:     method->parameters = parameters;
	movq	%r9, 16(%rcx)	 ; parameters, method_11(D)->parameters
 ; D:/TC/src/create.c:59:     method->method_scope = method_scope;
	movq	%rdx, 32(%rcx)	 ; method_scope, method_11(D)->method_scope
.L42:
 ; D:/TC/src/create.c:61: }
	addq	$40, %rsp	 ;,
	ret	
	.section .rdata,"dr"
.LC5:
	.ascii "Error creating class member: content is NULL\12\0"
.LC6:
	.ascii "Error creating class member: unknown type %u\12\0"
	.text
	.globl	create_class_member
	.def	create_class_member;	.scl	2;	.type	32;	.endef
create_class_member:
	pushq	%rdi	 ;
	movq	%r8, %rdi	 ; tmp115, variable_content
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp114, method_content
	pushq	%rbx	 ;
	movl	%ecx, %ebx	 ; tmp113, type
 ; D:/TC/src/create.c:64:     ClassMember* class_member = (ClassMember*)alloc_memory(sizeof(ClassMember));
	movl	$16, %ecx	 ;,
 ; D:/TC/src/create.c:63: ClassMember* create_class_member(ClassMemberType type, Method* method_content, Variable* variable_content) {
	subq	$32, %rsp	 ;,
 ; D:/TC/src/create.c:64:     ClassMember* class_member = (ClassMember*)alloc_memory(sizeof(ClassMember));
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:65:     class_member->type = type;
	movl	%ebx, 8(%rax)	 ; type, class_member_20->type
 ; D:/TC/src/create.c:66:     if (type == CLASS_METHOD && method_content != NULL)
	testl	%ebx, %ebx	 ; type
	jne	.L46	 ;,
	testq	%rsi, %rsi	 ; method_content
	je	.L46	 ;,
 ; D:/TC/src/create.c:67:         class_member->content.method = method_content;
	movq	%rsi, (%rax)	 ; method_content, class_member_20->content.method
	jmp	.L45	 ;
.L46:
 ; D:/TC/src/create.c:68:     else if (type == CLASS_VARIABLE && variable_content != NULL)
	cmpl	$1, %ebx	 ;, type
	jne	.L48	 ;,
	testq	%rdi, %rdi	 ; variable_content
	je	.L48	 ;,
 ; D:/TC/src/create.c:69:         class_member->content.variable = variable_content;
	movq	%rdi, (%rax)	 ; variable_content, class_member_20->content.variable
	jmp	.L45	 ;
.L48:
 ; D:/TC/src/create.c:71:         if (method_content == NULL && variable_content == NULL)
	orq	%rdi, %rsi	 ; variable_content, tmp119
	jne	.L50	 ;,
 ; D:/TC/src/create.c:72:             fprintf(stderr, "Error creating class member: content is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:72:             fprintf(stderr, "Error creating class member: content is NULL\n");
	leaq	.LC5(%rip), %rcx	 ;, tmp109
	movq	24(%rax), %rdx	 ; _10->_stderr, _10->_stderr
	call	fputs	 ;
	jmp	.L51	 ;
.L50:
 ; D:/TC/src/create.c:74:             fprintf(stderr, "Error creating class member: unknown type %u\n", type);
	call	__getreent	 ;
 ; D:/TC/src/create.c:74:             fprintf(stderr, "Error creating class member: unknown type %u\n", type);
	movl	%ebx, %r8d	 ; type,
	leaq	.LC6(%rip), %rdx	 ;, tmp111
	movq	24(%rax), %rcx	 ; _12->_stderr, _12->_stderr
	call	fprintf	 ;
.L51:
 ; D:/TC/src/create.c:75:         return NULL;
	xorl	%eax, %eax	 ; <retval>
.L45:
 ; D:/TC/src/create.c:78: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.section .rdata,"dr"
.LC7:
	.ascii "Error creating class: name is NULL\12\0"
	.text
	.globl	create_class_use_ptr
	.def	create_class_use_ptr;	.scl	2;	.type	32;	.endef
create_class_use_ptr:
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp94, name
	subq	$32, %rsp	 ;,
 ; D:/TC/src/create.c:81:     if (name == NULL) {
	testq	%rdx, %rdx	 ; name
	jne	.L66	 ;,
 ; D:/TC/src/create.c:82:         fprintf(stderr, "Error creating class: name is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:82:         fprintf(stderr, "Error creating class: name is NULL\n");
	leaq	.LC7(%rip), %rcx	 ;, tmp91
	movq	24(%rax), %rdx	 ; _1->_stderr, _1->_stderr
	call	fputs	 ;
 ; D:/TC/src/create.c:83:         return NULL;
	jmp	.L67	 ;
.L66:
 ; D:/TC/src/create.c:88:     class->size = size;
	movq	80(%rsp), %rax	 ; size, size
 ; D:/TC/src/create.c:85:     class->name = name;
	movq	%rdx, (%rcx)	 ; name, class_7(D)->name
 ; D:/TC/src/create.c:89:     return class;
	movq	%rcx, %rbx	 ; class, name
 ; D:/TC/src/create.c:86:     class->members = members;
	movq	%r8, 8(%rcx)	 ; members, class_7(D)->members
 ; D:/TC/src/create.c:87:     class->class_scope = class_scope;
	movq	%r9, 16(%rcx)	 ; class_scope, class_7(D)->class_scope
 ; D:/TC/src/create.c:88:     class->size = size;
	movq	%rax, 24(%rcx)	 ; size, class_7(D)->size
.L67:
 ; D:/TC/src/create.c:90: }
	addq	$32, %rsp	 ;,
	movq	%rbx, %rax	 ; name,
	popq	%rbx	 ;
	ret	
	.section .rdata,"dr"
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
	je	.L73	 ;,
	movq	%rdx, %rbx	 ; tmp99, name
	testq	%rdx, %rdx	 ; name
	jne	.L70	 ;,
.L73:
 ; D:/TC/src/create.c:94:         fprintf(stderr, "Error creating variable: type or name is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:94:         fprintf(stderr, "Error creating variable: type or name is NULL\n");
	leaq	.LC8(%rip), %rcx	 ;, tmp96
	movq	24(%rax), %rdx	 ; _4->_stderr, _4->_stderr
	call	fputs	 ;
 ; D:/TC/src/create.c:95:         return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L69	 ;
.L70:
	movq	%rcx, %rsi	 ; tmp98, type
 ; D:/TC/src/create.c:97:     Variable* variable = (Variable*)alloc_memory(sizeof(Variable));
	movl	$24, %ecx	 ;,
	movq	%r8, %rdi	 ; tmp100, value
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:98:     variable->type = type;
	movq	%rsi, (%rax)	 ; type, variable_12->type
 ; D:/TC/src/create.c:99:     variable->name = name;
	movq	%rbx, 8(%rax)	 ; name, variable_12->name
 ; D:/TC/src/create.c:100:     variable->value = value;
	movq	%rdi, 16(%rax)	 ; value, variable_12->value
.L69:
 ; D:/TC/src/create.c:102: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.section .rdata,"dr"
.LC9:
	.ascii "Error creating statement: content is NULL\12\0"
.LC10:
	.ascii "Error creating statement: unknown type %u\12\0"
	.text
	.globl	create_statement
	.def	create_statement;	.scl	2;	.type	32;	.endef
create_statement:
	pushq	%r13	 ;
	movq	%r8, %r13	 ; tmp150, while_stmt
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%r9, %rdi	 ; tmp151, for_stmt
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp149, if_stmt
	pushq	%rbx	 ;
	movl	%ecx, %ebx	 ; tmp148, type
 ; D:/TC/src/create.c:105:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	movl	$16, %ecx	 ;,
 ; D:/TC/src/create.c:104: Statement* create_statement(StatementType type, If* if_stmt, While* while_stmt, For* for_stmt, Expression* expr, Variable* var_stmt) {
	subq	$40, %rsp	 ;,
 ; D:/TC/src/create.c:104: Statement* create_statement(StatementType type, If* if_stmt, While* while_stmt, For* for_stmt, Expression* expr, Variable* var_stmt) {
	movq	128(%rsp), %r12	 ; expr, expr
	movq	136(%rsp), %rbp	 ; var_stmt, var_stmt
 ; D:/TC/src/create.c:105:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:106:     statement->type = type;
	movl	%ebx, 8(%rax)	 ; type, statement_33->type
 ; D:/TC/src/create.c:107:     if (type == EXPRESSION_STATEMENT && expr != NULL)
	testl	%ebx, %ebx	 ; type
	jne	.L76	 ;,
	testq	%r12, %r12	 ; expr
	jne	.L118	 ;,
.L76:
 ; D:/TC/src/create.c:109:     else if (type == VARIABLE_STATEMENT && var_stmt != NULL)
	cmpl	$1, %ebx	 ;, type
	jne	.L78	 ;,
	testq	%rbp, %rbp	 ; var_stmt
	je	.L78	 ;,
 ; D:/TC/src/create.c:110:         statement->stmt.var = var_stmt;
	movq	%rbp, (%rax)	 ; var_stmt, statement_33->stmt.var
	jmp	.L75	 ;
.L78:
 ; D:/TC/src/create.c:111:     else if (type == IF_STATEMENT && if_stmt != NULL)
	cmpl	$2, %ebx	 ;, type
	jne	.L80	 ;,
	testq	%rsi, %rsi	 ; if_stmt
	je	.L80	 ;,
 ; D:/TC/src/create.c:112:         statement->stmt.if_stmt = if_stmt;
	movq	%rsi, (%rax)	 ; if_stmt, statement_33->stmt.if_stmt
	jmp	.L75	 ;
.L80:
 ; D:/TC/src/create.c:113:     else if (type == WHILE_STATEMENT && while_stmt != NULL)
	cmpl	$3, %ebx	 ;, type
	jne	.L81	 ;,
	testq	%r13, %r13	 ; while_stmt
	je	.L81	 ;,
 ; D:/TC/src/create.c:114:         statement->stmt.while_stmt = while_stmt;
	movq	%r13, (%rax)	 ; while_stmt, statement_33->stmt.while_stmt
	jmp	.L75	 ;
.L81:
 ; D:/TC/src/create.c:115:     else if (type == FOR_STATEMENT && for_stmt != NULL)
	cmpl	$4, %ebx	 ;, type
	jne	.L82	 ;,
	testq	%rdi, %rdi	 ; for_stmt
	je	.L82	 ;,
 ; D:/TC/src/create.c:116:         statement->stmt.for_stmt = for_stmt;
	movq	%rdi, (%rax)	 ; for_stmt, statement_33->stmt.for_stmt
	jmp	.L75	 ;
.L82:
 ; D:/TC/src/create.c:117:     else if (type == RETURN_STATEMENT)
	cmpl	$5, %ebx	 ;, type
	jne	.L83	 ;,
.L118:
 ; D:/TC/src/create.c:118:         statement->stmt.return_expr = expr;
	movq	%r12, (%rax)	 ; expr,* <retval>
	jmp	.L75	 ;
.L83:
 ; D:/TC/src/create.c:119:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	leal	-6(%rbx), %edx	 ;, tmp138
 ; D:/TC/src/create.c:119:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	cmpl	$1, %edx	 ;, tmp138
	ja	.L84	 ;,
 ; D:/TC/src/create.c:120:         statement->stmt.expr = NULL;
	xorl	%edx, %edx	 ;
	movq	%rdx, (%rax)	 ;, statement_33->stmt.expr
	jmp	.L75	 ;
.L84:
 ; D:/TC/src/create.c:122:         if (if_stmt == NULL && while_stmt == NULL && for_stmt == NULL && expr == NULL && var_stmt == NULL)
	orq	%r13, %rdi	 ; while_stmt, tmp139
	orq	%rdi, %rsi	 ; tmp139, tmp140
	orq	%rsi, %rbp	 ; tmp140, tmp141
	orq	%rbp, %r12	 ; tmp141, tmp155
	jne	.L85	 ;,
 ; D:/TC/src/create.c:123:             fprintf(stderr, "Error creating statement: content is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:123:             fprintf(stderr, "Error creating statement: content is NULL\n");
	leaq	.LC9(%rip), %rcx	 ;, tmp144
	movq	24(%rax), %rdx	 ; _23->_stderr, _23->_stderr
	call	fputs	 ;
 ; D:/TC/src/create.c:123:             fprintf(stderr, "Error creating statement: content is NULL\n");
	jmp	.L86	 ;
.L85:
 ; D:/TC/src/create.c:125:             fprintf(stderr, "Error creating statement: unknown type %u\n", type);
	call	__getreent	 ;
 ; D:/TC/src/create.c:125:             fprintf(stderr, "Error creating statement: unknown type %u\n", type);
	movl	%ebx, %r8d	 ; type,
	leaq	.LC10(%rip), %rdx	 ;, tmp146
	movq	24(%rax), %rcx	 ; _25->_stderr, _25->_stderr
	call	fprintf	 ;
.L86:
 ; D:/TC/src/create.c:126:         return NULL;
	xorl	%eax, %eax	 ; <retval>
.L75:
 ; D:/TC/src/create.c:129: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	ret	
	.section .rdata,"dr"
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
 ; D:/TC/src/create.c:132:     if (condition == NULL) {
	testq	%rcx, %rcx	 ; condition
	jne	.L120	 ;,
 ; D:/TC/src/create.c:133:         fprintf(stderr, "Error creating if statement: condition is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:133:         fprintf(stderr, "Error creating if statement: condition is NULL\n");
	leaq	.LC11(%rip), %rcx	 ;, tmp90
	movq	24(%rax), %rdx	 ; _1->_stderr, _1->_stderr
	call	fputs	 ;
 ; D:/TC/src/create.c:134:         return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L119	 ;
.L120:
	movq	%rcx, %rbx	 ; tmp92, condition
 ; D:/TC/src/create.c:136:     If* if_ = (If*)alloc_memory(sizeof(If));
	movl	$32, %ecx	 ;,
	movq	%rdx, %rbp	 ; tmp93, body
	movq	%r8, %rdi	 ; tmp94, else_if
	movq	%r9, %rsi	 ; tmp95, else_body
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:137:     if_->condition = condition;
	movq	%rbx, (%rax)	 ; condition, if__8->condition
 ; D:/TC/src/create.c:138:     if_->body = body;
	movq	%rbp, 8(%rax)	 ; body, if__8->body
 ; D:/TC/src/create.c:139:     if_->else_if = else_if;
	movq	%rdi, 16(%rax)	 ; else_if, if__8->else_if
 ; D:/TC/src/create.c:140:     if_->else_body = else_body;
	movq	%rsi, 24(%rax)	 ; else_body, if__8->else_body
.L119:
 ; D:/TC/src/create.c:142: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
.LC12:
	.ascii "Error creating else-if statement: condition is NULL\12\0"
	.text
	.globl	create_else_if
	.def	create_else_if;	.scl	2;	.type	32;	.endef
create_else_if:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:/TC/src/create.c:145:     if (condition == NULL) {
	testq	%rcx, %rcx	 ; condition
	jne	.L124	 ;,
 ; D:/TC/src/create.c:146:         fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:146:         fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
	leaq	.LC12(%rip), %rcx	 ;, tmp88
	movq	24(%rax), %rdx	 ; _1->_stderr, _1->_stderr
	call	fputs	 ;
 ; D:/TC/src/create.c:147:         return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L123	 ;
.L124:
	movq	%rcx, %rbx	 ; tmp90, condition
 ; D:/TC/src/create.c:149:     ElseIf* else_if = (ElseIf*)alloc_memory(sizeof(ElseIf));
	movl	$16, %ecx	 ;,
	movq	%rdx, %rsi	 ; tmp91, body
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:150:     else_if->condition = condition;
	movq	%rbx, (%rax)	 ; condition, else_if_8->condition
 ; D:/TC/src/create.c:151:     else_if->body = body;
	movq	%rsi, 8(%rax)	 ; body, else_if_8->body
.L123:
 ; D:/TC/src/create.c:153: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.globl	create_for
	.def	create_for;	.scl	2;	.type	32;	.endef
create_for:
	pushq	%rbp	 ;
	movq	%rcx, %rbp	 ; tmp88, initializer
 ; D:/TC/src/create.c:156:     For* for_ = (For*)alloc_memory(sizeof(For));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/create.c:155: For* create_for(Variable* initializer, Expression* condition, Expression* increment, list(Statement*) body) {
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp89, condition
	pushq	%rsi	 ;
	movq	%r8, %rsi	 ; tmp90, increment
	pushq	%rbx	 ;
	movq	%r9, %rbx	 ; tmp91, body
	subq	$40, %rsp	 ;,
 ; D:/TC/src/create.c:156:     For* for_ = (For*)alloc_memory(sizeof(For));
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
	movq	%rcx, %rsi	 ; tmp86, condition
 ; D:/TC/src/create.c:165:     While* while_ = (While*)alloc_memory(sizeof(While));
	movl	$16, %ecx	 ;,
 ; D:/TC/src/create.c:164: While* create_while(Expression* condition, list(Statement*) body) {
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp87, body
	subq	$40, %rsp	 ;,
 ; D:/TC/src/create.c:165:     While* while_ = (While*)alloc_memory(sizeof(While));
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
.LC15:
	.ascii "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\12\0"
.LC16:
	.ascii "Error creating expression: both expr_left and prim_left are NULL\12\0"
	.text
	.globl	create_expression
	.def	create_expression;	.scl	2;	.type	32;	.endef
create_expression:
	pushq	%r12	 ;
	movl	%ecx, %r12d	 ; tmp135, operator
	pushq	%rbp	 ;
	movq	%r8, %rbp	 ; tmp137, prim_left
	pushq	%rdi	 ;
	movq	%r9, %rdi	 ; tmp138, right
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp136, expr_left
	pushq	%rbx	 ;
	subq	$64, %rsp	 ;,
 ; D:/TC/src/create.c:172:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	cmpl	$19, %ecx	 ;, operator
	sete	%dl	 ;, tmp101
	testq	%r9, %r9	 ; right
	sete	%al	 ;, tmp103
 ; D:/TC/src/create.c:172:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	cmpb	%al, %dl	 ; tmp103, tmp101
	jne	.L132	 ;,
 ; D:/TC/src/create.c:172:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	movq	%r8, %rax	 ; prim_left, tmp142
	orq	%rsi, %rax	 ; expr_left, tmp142
	jne	.L149	 ;,
	jmp	.L151	 ;
.L132:
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC14(%rip), %rbx	 ;, tmp116
	leaq	.LC13(%rip), %rax	 ;, tmp115
	testq	%r9, %r9	 ; right
	movq	%rbx, %rdi	 ; tmp116, iftmp.0_11
	cmove	%rax, %rdi	 ; tmp115,, iftmp.0_11
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%r8, %r8	 ; prim_left
	cmove	%rax, %rbx	 ; tmp116,, tmp115, iftmp.1_4
.L136:
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%rsi, %rsi	 ; expr_left
	leaq	.LC14(%rip), %r9	 ;, tmp121
	leaq	.LC13(%rip), %rax	 ;, tmp122
	cmove	%rax, %r9	 ; tmp121,, tmp122, iftmp.2_13
	jmp	.L137	 ;
.L151:
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%r9, %r9	 ; right
	jne	.L152	 ;,
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC13(%rip), %rdi	 ;, iftmp.0_11
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%rdi, %rbx	 ; iftmp.0_11, iftmp.1_4
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%rdi, %r9	 ; iftmp.0_11, iftmp.2_13
.L137:
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	cmpl	$19, %r12d	 ;, operator
	leaq	.LC13(%rip), %rax	 ;, tmp128
	movq	%r9, 56(%rsp)	 ; iftmp.2_13, %sfp
	leaq	.LC14(%rip), %r8	 ;, tmp127
	cmove	%rax, %r8	 ; tmp127,, tmp128, iftmp.3_14
	movq	%r8, 48(%rsp)	 ; iftmp.3_14, %sfp
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	call	__getreent	 ;
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	56(%rsp), %r9	 ; %sfp, iftmp.2_13
	movq	48(%rsp), %r8	 ; %sfp, iftmp.3_14
	leaq	.LC15(%rip), %rdx	 ;, tmp106
	movq	24(%rax), %rcx	 ; _7->_stderr, _7->_stderr
	movq	%rdi, 40(%rsp)	 ; iftmp.0_11,
	movq	%rbx, 32(%rsp)	 ; iftmp.1_4,
	call	fprintf	 ;
 ; D:/TC/src/create.c:178:         return NULL;
	jmp	.L139	 ;
.L149:
 ; D:/TC/src/create.c:180:     Expression* expression = (Expression*)alloc_memory(sizeof(Expression));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:181:     expression->operator = operator;
	movl	%r12d, 24(%rax)	 ; operator, expression_24->operator
 ; D:/TC/src/create.c:182:     if (expr_left != NULL)
	testq	%rsi, %rsi	 ; expr_left
	je	.L140	 ;,
 ; D:/TC/src/create.c:183:         expression->expr_left = expr_left;
	movq	%rsi, (%rax)	 ; expr_left, expression_24->expr_left
	jmp	.L141	 ;
.L140:
 ; D:/TC/src/create.c:184:     else if (prim_left != NULL)
	testq	%rbp, %rbp	 ; prim_left
	je	.L142	 ;,
 ; D:/TC/src/create.c:185:         expression->prim_left = prim_left;
	movq	%rbp, 8(%rax)	 ; prim_left, expression_24->prim_left
	jmp	.L141	 ;
.L142:
 ; D:/TC/src/create.c:187:         fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:187:         fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
	leaq	.LC16(%rip), %rcx	 ;, tmp108
	movq	24(%rax), %rdx	 ; _9->_stderr, _9->_stderr
	call	fputs	 ;
.L139:
 ; D:/TC/src/create.c:178:         return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L131	 ;
.L141:
 ; D:/TC/src/create.c:190:     expression->right = right;
	movq	%rdi, 16(%rax)	 ; right, expression_24->right
 ; D:/TC/src/create.c:191:     return expression;
	jmp	.L131	 ;
.L152:
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC14(%rip), %rdi	 ;, iftmp.0_11
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC13(%rip), %rbx	 ;, iftmp.1_4
	jmp	.L136	 ;
.L131:
 ; D:/TC/src/create.c:192: }
	addq	$64, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.section .rdata,"dr"
.LC17:
	.ascii "Error creating primary: value is NULL\12\0"
.LC18:
	.ascii "Error creating primary: unknown type %u\12\0"
	.text
	.globl	create_primary
	.def	create_primary;	.scl	2;	.type	32;	.endef
create_primary:
	pushq	%r12	 ;
	movq	%r9, %r12	 ; tmp140, prim_value
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp138, str_value
	pushq	%rsi	 ;
	movq	%r8, %rsi	 ; tmp139, expr_value
	pushq	%rbx	 ;
	movl	%ecx, %ebx	 ; tmp137, type
 ; D:/TC/src/create.c:195:     Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
	movl	$16, %ecx	 ;,
 ; D:/TC/src/create.c:194: Primary* create_primary(PrimaryType type, string str_value, Expression* expr_value, Primary* prim_value, VariableAccess* variable_value) {
	subq	$32, %rsp	 ;,
 ; D:/TC/src/create.c:194: Primary* create_primary(PrimaryType type, string str_value, Expression* expr_value, Primary* prim_value, VariableAccess* variable_value) {
	movq	112(%rsp), %rbp	 ; variable_value, variable_value
 ; D:/TC/src/create.c:195:     Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:196:     primary->type = type;
	movl	%ebx, 8(%rax)	 ; type, primary_27->type
 ; D:/TC/src/create.c:197:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != NULL)
	cmpl	$4, %ebx	 ;, type
	ja	.L154	 ;,
	testq	%rdi, %rdi	 ; str_value
	je	.L154	 ;,
 ; D:/TC/src/create.c:198:         primary->value.literal_value = str_value;
	movq	%rdi, (%rax)	 ; str_value, primary_27->value.literal_value
	jmp	.L153	 ;
.L154:
 ; D:/TC/src/create.c:199:     else if (type == PRIM_EXPRESSION && expr_value != NULL)
	cmpl	$5, %ebx	 ;, type
	jne	.L156	 ;,
	testq	%rsi, %rsi	 ; expr_value
	je	.L156	 ;,
 ; D:/TC/src/create.c:200:         primary->value.expr = expr_value;
	movq	%rsi, (%rax)	 ; expr_value, primary_27->value.expr
	jmp	.L153	 ;
.L156:
 ; D:/TC/src/create.c:201:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	leal	-6(%rbx), %edx	 ;, tmp120
 ; D:/TC/src/create.c:201:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	cmpl	$1, %edx	 ;, tmp120
	ja	.L158	 ;,
	testq	%r12, %r12	 ; prim_value
	je	.L158	 ;,
 ; D:/TC/src/create.c:202:         primary->value.operand = prim_value;
	movq	%r12, (%rax)	 ; prim_value, primary_27->value.operand
	jmp	.L153	 ;
.L158:
 ; D:/TC/src/create.c:203:     else if (type == PRIM_VARIABLE_ACCESS && variable_value != NULL)
	cmpl	$8, %ebx	 ;, type
	jne	.L159	 ;,
	testq	%rbp, %rbp	 ; variable_value
	je	.L159	 ;,
 ; D:/TC/src/create.c:204:         primary->value.var = variable_value;
	movq	%rbp, (%rax)	 ; variable_value, primary_27->value.var
	jmp	.L153	 ;
.L159:
 ; D:/TC/src/create.c:206:         if (str_value == NULL && expr_value == NULL && prim_value == NULL && variable_value == NULL)
	orq	%r12, %rbp	 ; prim_value, tmp129
	orq	%rbp, %rsi	 ; tmp129, tmp130
	orq	%rdi, %rsi	 ; str_value, tmp144
	jne	.L160	 ;,
 ; D:/TC/src/create.c:207:             fprintf(stderr, "Error creating primary: value is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:207:             fprintf(stderr, "Error creating primary: value is NULL\n");
	leaq	.LC17(%rip), %rcx	 ;, tmp133
	movq	24(%rax), %rdx	 ; _17->_stderr, _17->_stderr
	call	fputs	 ;
 ; D:/TC/src/create.c:207:             fprintf(stderr, "Error creating primary: value is NULL\n");
	jmp	.L161	 ;
.L160:
 ; D:/TC/src/create.c:209:             fprintf(stderr, "Error creating primary: unknown type %u\n", type);
	call	__getreent	 ;
 ; D:/TC/src/create.c:209:             fprintf(stderr, "Error creating primary: unknown type %u\n", type);
	movl	%ebx, %r8d	 ; type,
	leaq	.LC18(%rip), %rdx	 ;, tmp135
	movq	24(%rax), %rcx	 ; _19->_stderr, _19->_stderr
	call	fprintf	 ;
.L161:
 ; D:/TC/src/create.c:210:         return NULL;
	xorl	%eax, %eax	 ; <retval>
.L153:
 ; D:/TC/src/create.c:213: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.section .rdata,"dr"
.LC19:
	.ascii "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\12\0"
.LC20:
	.ascii "Error creating variable access: content is NULL\12\0"
.LC21:
	.ascii "Error creating variable access: unknown type %u\12\0"
	.text
	.globl	create_variable_access
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
create_variable_access:
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%rdx, %rbp	 ; tmp149, base
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movl	%ecx, %ebx	 ; tmp148, type
	subq	$56, %rsp	 ;,
 ; D:/TC/src/create.c:216:     if ((base == NULL) != (type == VAR_NAME)) {
	testl	%ecx, %ecx	 ; type
	sete	%al	 ;, tmp113
	testq	%rdx, %rdx	 ; base
 ; D:/TC/src/create.c:215: VariableAccess* create_variable_access(VariableAccessType type, VariableAccess* base, Symbol* name_content, Expression* expr_content, list(Expression*) args_content) {
	movq	144(%rsp), %r12	 ; args_content, args_content
 ; D:/TC/src/create.c:216:     if ((base == NULL) != (type == VAR_NAME)) {
	sete	%r13b	 ;, tmp115
 ; D:/TC/src/create.c:216:     if ((base == NULL) != (type == VAR_NAME)) {
	cmpb	%al, %r13b	 ; tmp113, tmp115
	je	.L188	 ;,
 ; D:/TC/src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	leaq	.LC13(%rip), %rax	 ;, tmp141
	testl	%ecx, %ecx	 ; type
	leaq	.LC14(%rip), %r8	 ;, tmp140
	movq	%rax, %r9	 ; tmp141, iftmp.4_23
	cmovne	%r8, %r9	 ; tmp140,, iftmp.4_23
 ; D:/TC/src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	testq	%rdx, %rdx	 ; base
	cmove	%rax, %r8	 ; tmp140,, tmp141, iftmp.5_24
 ; D:/TC/src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movq	%r9, 40(%rsp)	 ; iftmp.4_23, %sfp
 ; D:/TC/src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movq	%r8, 32(%rsp)	 ; iftmp.5_24, %sfp
 ; D:/TC/src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	call	__getreent	 ;
 ; D:/TC/src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movq	40(%rsp), %r9	 ; %sfp, iftmp.4_23
	movq	32(%rsp), %r8	 ; %sfp, iftmp.5_24
	leaq	.LC19(%rip), %rdx	 ;, tmp117
	movq	24(%rax), %rcx	 ; _4->_stderr, _4->_stderr
	call	fprintf	 ;
 ; D:/TC/src/create.c:218:         return NULL;
	jmp	.L191	 ;
.L188:
	movq	%r8, %rdi	 ; tmp150, name_content
 ; D:/TC/src/create.c:220:     VariableAccess* variable_access = (VariableAccess*)alloc_memory(sizeof(VariableAccess));
	movl	$24, %ecx	 ;,
	movq	%r9, %rsi	 ; tmp151, expr_content
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:223:     if (type == VAR_NAME && name_content != NULL)
	testq	%rdi, %rdi	 ; name_content
 ; D:/TC/src/create.c:221:     variable_access->type = type;
	movl	%ebx, 16(%rax)	 ; type, variable_access_33->type
 ; D:/TC/src/create.c:223:     if (type == VAR_NAME && name_content != NULL)
	setne	%dl	 ;, tmp118
 ; D:/TC/src/create.c:222:     variable_access->base = base;
	movq	%rbp, (%rax)	 ; base, variable_access_33->base
 ; D:/TC/src/create.c:223:     if (type == VAR_NAME && name_content != NULL)
	testb	%r13b, %r13b	 ; tmp115
	je	.L192	 ;,
	testb	%dl, %dl	 ; tmp118
	jne	.L226	 ;,
.L192:
 ; D:/TC/src/create.c:225:     else if (type == VAR_FUNC_CALL && args_content != NULL)
	cmpl	$1, %ebx	 ;, type
	jne	.L194	 ;,
	testq	%r12, %r12	 ; args_content
	je	.L194	 ;,
 ; D:/TC/src/create.c:226:         variable_access->content.args = args_content;
	movq	%r12, 8(%rax)	 ; args_content, variable_access_33->content.args
	jmp	.L187	 ;
.L194:
 ; D:/TC/src/create.c:227:     else if (type == VAR_GET_SEQ && expr_content != NULL)
	cmpl	$3, %ebx	 ;, type
	jne	.L196	 ;,
	testq	%rsi, %rsi	 ; expr_content
	je	.L196	 ;,
 ; D:/TC/src/create.c:228:         variable_access->content.index = expr_content;
	movq	%rsi, 8(%rax)	 ; expr_content, variable_access_33->content.index
	jmp	.L187	 ;
.L196:
 ; D:/TC/src/create.c:229:     else if (type == VAR_GET_ATTR && name_content != NULL)
	cmpl	$2, %ebx	 ;, type
	jne	.L197	 ;,
	testb	%dl, %dl	 ; tmp118
	je	.L197	 ;,
.L226:
 ; D:/TC/src/create.c:230:         variable_access->content.attr_name = name_content;
	movq	%rdi, 8(%rax)	 ; name_content,
	jmp	.L187	 ;
.L197:
 ; D:/TC/src/create.c:232:         if (name_content == NULL && expr_content == NULL && args_content == NULL)
	orq	%r12, %rsi	 ; args_content, tmp129
	orq	%rsi, %rdi	 ; tmp129, tmp156
	jne	.L198	 ;,
 ; D:/TC/src/create.c:233:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:233:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	leaq	.LC20(%rip), %rcx	 ;, tmp132
	movq	24(%rax), %rdx	 ; _19->_stderr, _19->_stderr
	call	fputs	 ;
 ; D:/TC/src/create.c:233:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	jmp	.L191	 ;
.L198:
 ; D:/TC/src/create.c:235:             fprintf(stderr, "Error creating variable access: unknown type %u\n", type);
	call	__getreent	 ;
 ; D:/TC/src/create.c:235:             fprintf(stderr, "Error creating variable access: unknown type %u\n", type);
	movl	%ebx, %r8d	 ; type,
	leaq	.LC21(%rip), %rdx	 ;, tmp134
	movq	24(%rax), %rcx	 ; _21->_stderr, _21->_stderr
	call	fprintf	 ;
.L191:
 ; D:/TC/src/create.c:218:         return NULL;
	xorl	%eax, %eax	 ; <retval>
.L187:
 ; D:/TC/src/create.c:239: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	ret	
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
