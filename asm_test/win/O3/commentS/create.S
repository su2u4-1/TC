	.file	"create.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O3 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Error creating code member: content is NULL\12\0"
	.align 8
.LC1:
	.ascii "Error creating code member: unknown type %u\12\0"
	.text
	.p2align 4
	.globl	create_code_member
	.def	create_code_member;	.scl	2;	.type	32;	.endef
create_code_member:
	pushq	%r12	 ;
	movq	%r9, %r12	 ; tmp127, class_content
	pushq	%rbp	 ;
	movq	%r8, %rbp	 ; tmp126, function_content
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp125, import_content
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
	testq	%rdi, %rdi	 ; import_content
	je	.L2	 ;,
 ; D:/TC/src/create.c:7:         code_member->content.import = import_content;
	movq	%rdi, (%rax)	 ; import_content, code_member_20->content.import
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
	.p2align 4,,10
	.p2align 3
.L2:
 ; D:/TC/src/create.c:8:     else if (type == CODE_FUNCTION && function_content != NULL)
	cmpl	$1, %esi	 ;, type
	jne	.L4	 ;,
	testq	%rbp, %rbp	 ; function_content
	je	.L4	 ;,
 ; D:/TC/src/create.c:9:         code_member->content.function = function_content;
	movq	%rbp, (%rbx)	 ; function_content, code_member_20->content.function
 ; D:/TC/src/create.c:17: }
	addq	$32, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L4:
 ; D:/TC/src/create.c:10:     else if (type == CODE_CLASS && class_content != NULL)
	cmpl	$2, %esi	 ;, type
	jne	.L5	 ;,
	testq	%r12, %r12	 ; class_content
	je	.L5	 ;,
 ; D:/TC/src/create.c:11:         code_member->content.class = class_content;
	movq	%r12, (%rbx)	 ; class_content, code_member_20->content.class
 ; D:/TC/src/create.c:17: }
	addq	$32, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L5:
 ; D:/TC/src/create.c:12:     else if (import_content == NULL && function_content == NULL && class_content == NULL)
	movq	%r12, %r9	 ; class_content, class_content
	orq	%rbp, %r9	 ; function_content, class_content
	orq	%r9, %rdi	 ; tmp117, tmp131
	je	.L27	 ;,
 ; D:/TC/src/create.c:15:         fprintf(stderr, "Error creating code member: unknown type %u\n", type);
	call	__getreent	 ;
 ; D:/TC/src/create.c:15:         fprintf(stderr, "Error creating code member: unknown type %u\n", type);
	movl	%esi, %r8d	 ; type,
	leaq	.LC1(%rip), %rdx	 ;, tmp122
	movq	24(%rax), %rcx	 ; _15->_stderr, _15->_stderr
	call	fprintf	 ;
 ; D:/TC/src/create.c:17: }
	addq	$32, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L27:
 ; D:/TC/src/create.c:13:         fprintf(stderr, "Error creating code member: content is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:13:         fprintf(stderr, "Error creating code member: content is NULL\n");
	movl	$44, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp120
	movq	24(%rax), %r9	 ; _13->_stderr,
	call	fwrite	 ;
 ; D:/TC/src/create.c:13:         fprintf(stderr, "Error creating code member: content is NULL\n");
	jmp	.L1	 ;
	.p2align 4
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
	.align 8
.LC2:
	.ascii "Error creating import: name is NULL\12\0"
	.text
	.p2align 4
	.globl	create_import
	.def	create_import;	.scl	2;	.type	32;	.endef
create_import:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:/TC/src/create.c:27:     if (name == NULL) {
	testq	%rcx, %rcx	 ; name
	je	.L34	 ;,
	movq	%rcx, %rbx	 ; tmp90, name
 ; D:/TC/src/create.c:31:     Import* import = (Import*)alloc_memory(sizeof(Import));
	movl	$16, %ecx	 ;,
	movq	%rdx, %rsi	 ; tmp91, source
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:32:     import->name = name;
	movq	%rbx, (%rax)	 ; name, import_8->name
 ; D:/TC/src/create.c:33:     import->source = source;
	movq	%rsi, 8(%rax)	 ; source, import_8->source
.L30:
 ; D:/TC/src/create.c:35: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L34:
 ; D:/TC/src/create.c:28:         fprintf(stderr, "Error creating import: name is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:28:         fprintf(stderr, "Error creating import: name is NULL\n");
	movl	$36, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC2(%rip), %rcx	 ;, tmp88
	movq	24(%rax), %r9	 ; _1->_stderr,
	call	fwrite	 ;
 ; D:/TC/src/create.c:29:         return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L30	 ;
	.section .rdata,"dr"
	.align 8
.LC3:
	.ascii "Error creating function: name or return_type is NULL\12\0"
	.text
	.p2align 4
	.globl	create_function_use_ptr
	.def	create_function_use_ptr;	.scl	2;	.type	32;	.endef
create_function_use_ptr:
	subq	$40, %rsp	 ;,
 ; D:/TC/src/create.c:38:     if (name == NULL || return_type == NULL) {
	testq	%rdx, %rdx	 ; name
	je	.L39	 ;,
	testq	%r8, %r8	 ; return_type
	je	.L39	 ;,
 ; D:/TC/src/create.c:45:     function->body = body;
	movq	80(%rsp), %rax	 ; body, body
 ; D:/TC/src/create.c:42:     function->name = name;
	movq	%rdx, (%rcx)	 ; name, function_11(D)->name
 ; D:/TC/src/create.c:43:     function->return_type = return_type;
	movq	%r8, 8(%rcx)	 ; return_type, function_11(D)->return_type
 ; D:/TC/src/create.c:45:     function->body = body;
	movq	%rax, 24(%rcx)	 ; body, function_11(D)->body
 ; D:/TC/src/create.c:46:     function->function_scope = function_scope;
	movq	88(%rsp), %rax	 ; function_scope, function_scope
 ; D:/TC/src/create.c:44:     function->parameters = parameters;
	movq	%r9, 16(%rcx)	 ; parameters, function_11(D)->parameters
 ; D:/TC/src/create.c:46:     function->function_scope = function_scope;
	movq	%rax, 32(%rcx)	 ; function_scope, function_11(D)->function_scope
 ; D:/TC/src/create.c:47:     return function;
	movq	%rcx, %rax	 ; function, <retval>
.L35:
 ; D:/TC/src/create.c:48: }
	addq	$40, %rsp	 ;,
	ret	
	.p2align 4,,10
	.p2align 3
.L39:
 ; D:/TC/src/create.c:39:         fprintf(stderr, "Error creating function: name or return_type is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:39:         fprintf(stderr, "Error creating function: name or return_type is NULL\n");
	movl	$53, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC3(%rip), %rcx	 ;, tmp99
	movq	24(%rax), %r9	 ; _4->_stderr,
	call	fwrite	 ;
 ; D:/TC/src/create.c:40:         return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L35	 ;
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "Error creating method: name or return_type is NULL\12\0"
	.text
	.p2align 4
	.globl	create_method_use_ptr
	.def	create_method_use_ptr;	.scl	2;	.type	32;	.endef
create_method_use_ptr:
	subq	$40, %rsp	 ;,
 ; D:/TC/src/create.c:51:     if (name == NULL || return_type == NULL) {
	testq	%rdx, %rdx	 ; name
	je	.L45	 ;,
	testq	%r8, %r8	 ; return_type
	je	.L45	 ;,
 ; D:/TC/src/create.c:58:     method->body = body;
	movq	80(%rsp), %rax	 ; body, body
 ; D:/TC/src/create.c:55:     method->name = name;
	movq	%rdx, (%rcx)	 ; name, method_11(D)->name
 ; D:/TC/src/create.c:56:     method->return_type = return_type;
	movq	%r8, 8(%rcx)	 ; return_type, method_11(D)->return_type
 ; D:/TC/src/create.c:58:     method->body = body;
	movq	%rax, 24(%rcx)	 ; body, method_11(D)->body
 ; D:/TC/src/create.c:59:     method->method_scope = method_scope;
	movq	88(%rsp), %rax	 ; method_scope, method_scope
 ; D:/TC/src/create.c:57:     method->parameters = parameters;
	movq	%r9, 16(%rcx)	 ; parameters, method_11(D)->parameters
 ; D:/TC/src/create.c:59:     method->method_scope = method_scope;
	movq	%rax, 32(%rcx)	 ; method_scope, method_11(D)->method_scope
 ; D:/TC/src/create.c:60:     return method;
	movq	%rcx, %rax	 ; method, <retval>
.L41:
 ; D:/TC/src/create.c:61: }
	addq	$40, %rsp	 ;,
	ret	
	.p2align 4,,10
	.p2align 3
.L45:
 ; D:/TC/src/create.c:52:         fprintf(stderr, "Error creating method: name or return_type is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:52:         fprintf(stderr, "Error creating method: name or return_type is NULL\n");
	movl	$51, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rcx	 ;, tmp99
	movq	24(%rax), %r9	 ; _4->_stderr,
	call	fwrite	 ;
 ; D:/TC/src/create.c:53:         return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L41	 ;
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "Error creating class member: content is NULL\12\0"
	.align 8
.LC6:
	.ascii "Error creating class member: unknown type %u\12\0"
	.text
	.p2align 4
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
	jne	.L48	 ;,
	testq	%rsi, %rsi	 ; method_content
	je	.L48	 ;,
 ; D:/TC/src/create.c:67:         class_member->content.method = method_content;
	movq	%rsi, (%rax)	 ; method_content, class_member_20->content.method
.L47:
 ; D:/TC/src/create.c:78: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L48:
 ; D:/TC/src/create.c:68:     else if (type == CLASS_VARIABLE && variable_content != NULL)
	cmpl	$1, %ebx	 ;, type
	jne	.L50	 ;,
	testq	%rdi, %rdi	 ; variable_content
	je	.L50	 ;,
 ; D:/TC/src/create.c:69:         class_member->content.variable = variable_content;
	movq	%rdi, (%rax)	 ; variable_content, class_member_20->content.variable
 ; D:/TC/src/create.c:78: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L50:
 ; D:/TC/src/create.c:71:         if (method_content == NULL && variable_content == NULL)
	orq	%rdi, %rsi	 ; variable_content, tmp119
	jne	.L52	 ;,
 ; D:/TC/src/create.c:72:             fprintf(stderr, "Error creating class member: content is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:72:             fprintf(stderr, "Error creating class member: content is NULL\n");
	movl	$45, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp109
	movq	24(%rax), %r9	 ; _10->_stderr,
	call	fwrite	 ;
 ; D:/TC/src/create.c:75:         return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L47	 ;
	.p2align 4,,10
	.p2align 3
.L52:
 ; D:/TC/src/create.c:74:             fprintf(stderr, "Error creating class member: unknown type %u\n", type);
	call	__getreent	 ;
 ; D:/TC/src/create.c:74:             fprintf(stderr, "Error creating class member: unknown type %u\n", type);
	movl	%ebx, %r8d	 ; type,
	leaq	.LC6(%rip), %rdx	 ;, tmp111
	movq	24(%rax), %rcx	 ; _12->_stderr, _12->_stderr
	call	fprintf	 ;
 ; D:/TC/src/create.c:75:         return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L47	 ;
	.section .rdata,"dr"
	.align 8
.LC7:
	.ascii "Error creating class: name is NULL\12\0"
	.text
	.p2align 4
	.globl	create_class_use_ptr
	.def	create_class_use_ptr;	.scl	2;	.type	32;	.endef
create_class_use_ptr:
	subq	$40, %rsp	 ;,
 ; D:/TC/src/create.c:81:     if (name == NULL) {
	testq	%rdx, %rdx	 ; name
	je	.L71	 ;,
 ; D:/TC/src/create.c:88:     class->size = size;
	movq	80(%rsp), %rax	 ; size, size
 ; D:/TC/src/create.c:85:     class->name = name;
	movq	%rdx, (%rcx)	 ; name, class_7(D)->name
 ; D:/TC/src/create.c:86:     class->members = members;
	movq	%r8, 8(%rcx)	 ; members, class_7(D)->members
 ; D:/TC/src/create.c:87:     class->class_scope = class_scope;
	movq	%r9, 16(%rcx)	 ; class_scope, class_7(D)->class_scope
 ; D:/TC/src/create.c:88:     class->size = size;
	movq	%rax, 24(%rcx)	 ; size, class_7(D)->size
 ; D:/TC/src/create.c:89:     return class;
	movq	%rcx, %rax	 ; class, <retval>
.L67:
 ; D:/TC/src/create.c:90: }
	addq	$40, %rsp	 ;,
	ret	
	.p2align 4,,10
	.p2align 3
.L71:
 ; D:/TC/src/create.c:82:         fprintf(stderr, "Error creating class: name is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:82:         fprintf(stderr, "Error creating class: name is NULL\n");
	movl	$35, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rcx	 ;, tmp91
	movq	24(%rax), %r9	 ; _1->_stderr,
	call	fwrite	 ;
 ; D:/TC/src/create.c:83:         return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L67	 ;
	.section .rdata,"dr"
	.align 8
.LC8:
	.ascii "Error creating variable: type or name is NULL\12\0"
	.text
	.p2align 4
	.globl	create_variable
	.def	create_variable;	.scl	2;	.type	32;	.endef
create_variable:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:/TC/src/create.c:93:     if (type == NULL || name == NULL) {
	testq	%rcx, %rcx	 ; type
	je	.L76	 ;,
	movq	%rdx, %rsi	 ; tmp99, name
	testq	%rdx, %rdx	 ; name
	je	.L76	 ;,
	movq	%rcx, %rbx	 ; tmp98, type
 ; D:/TC/src/create.c:97:     Variable* variable = (Variable*)alloc_memory(sizeof(Variable));
	movl	$24, %ecx	 ;,
	movq	%r8, %rdi	 ; tmp100, value
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:98:     variable->type = type;
	movq	%rbx, (%rax)	 ; type, variable_12->type
 ; D:/TC/src/create.c:99:     variable->name = name;
	movq	%rsi, 8(%rax)	 ; name, variable_12->name
 ; D:/TC/src/create.c:100:     variable->value = value;
	movq	%rdi, 16(%rax)	 ; value, variable_12->value
 ; D:/TC/src/create.c:102: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L76:
 ; D:/TC/src/create.c:94:         fprintf(stderr, "Error creating variable: type or name is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:94:         fprintf(stderr, "Error creating variable: type or name is NULL\n");
	movl	$46, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC8(%rip), %rcx	 ;, tmp96
	movq	24(%rax), %r9	 ; _4->_stderr,
	call	fwrite	 ;
 ; D:/TC/src/create.c:102: }
	addq	$32, %rsp	 ;,
 ; D:/TC/src/create.c:95:         return NULL;
	xorl	%eax, %eax	 ; <retval>
 ; D:/TC/src/create.c:102: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC9:
	.ascii "Error creating statement: content is NULL\12\0"
	.align 8
.LC10:
	.ascii "Error creating statement: unknown type %u\12\0"
	.text
	.p2align 4
	.globl	create_statement
	.def	create_statement;	.scl	2;	.type	32;	.endef
create_statement:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%r8, %rbp	 ; tmp150, while_stmt
	pushq	%rdi	 ;
	movq	%r9, %rdi	 ; tmp151, for_stmt
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp149, if_stmt
	pushq	%rbx	 ;
	movl	%ecx, %ebx	 ; tmp148, type
 ; D:/TC/src/create.c:105:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	movl	$16, %ecx	 ;,
 ; D:/TC/src/create.c:104: Statement* create_statement(StatementType type, If* if_stmt, While* while_stmt, For* for_stmt, Expression* expr, Variable* var_stmt) {
	subq	$32, %rsp	 ;,
 ; D:/TC/src/create.c:104: Statement* create_statement(StatementType type, If* if_stmt, While* while_stmt, For* for_stmt, Expression* expr, Variable* var_stmt) {
	movq	112(%rsp), %r12	 ; expr, expr
 ; D:/TC/src/create.c:105:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:106:     statement->type = type;
	movl	%ebx, 8(%rax)	 ; type, statement_33->type
 ; D:/TC/src/create.c:107:     if (type == EXPRESSION_STATEMENT && expr != NULL)
	testl	%ebx, %ebx	 ; type
	jne	.L79	 ;,
	testq	%r12, %r12	 ; expr
	je	.L79	 ;,
.L121:
 ; D:/TC/src/create.c:118:         statement->stmt.return_expr = expr;
	movq	%r12, (%rax)	 ; expr,* <retval>
.L78:
 ; D:/TC/src/create.c:129: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L79:
 ; D:/TC/src/create.c:109:     else if (type == VARIABLE_STATEMENT && var_stmt != NULL)
	cmpl	$1, %ebx	 ;, type
	jne	.L81	 ;,
	cmpq	$0, 120(%rsp)	 ;, var_stmt
	je	.L81	 ;,
 ; D:/TC/src/create.c:110:         statement->stmt.var = var_stmt;
	movq	120(%rsp), %rdi	 ; var_stmt, tmp157
	movq	%rdi, (%rax)	 ; tmp157,* <retval>
 ; D:/TC/src/create.c:129: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L81:
 ; D:/TC/src/create.c:111:     else if (type == IF_STATEMENT && if_stmt != NULL)
	cmpl	$2, %ebx	 ;, type
	jne	.L83	 ;,
	testq	%rsi, %rsi	 ; if_stmt
	je	.L83	 ;,
 ; D:/TC/src/create.c:112:         statement->stmt.if_stmt = if_stmt;
	movq	%rsi, (%rax)	 ; if_stmt, statement_33->stmt.if_stmt
 ; D:/TC/src/create.c:129: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L83:
 ; D:/TC/src/create.c:113:     else if (type == WHILE_STATEMENT && while_stmt != NULL)
	cmpl	$3, %ebx	 ;, type
	jne	.L84	 ;,
	testq	%rbp, %rbp	 ; while_stmt
	je	.L84	 ;,
 ; D:/TC/src/create.c:114:         statement->stmt.while_stmt = while_stmt;
	movq	%rbp, (%rax)	 ; while_stmt, statement_33->stmt.while_stmt
	jmp	.L78	 ;
	.p2align 4,,10
	.p2align 3
.L84:
 ; D:/TC/src/create.c:115:     else if (type == FOR_STATEMENT && for_stmt != NULL)
	cmpl	$4, %ebx	 ;, type
	jne	.L85	 ;,
	testq	%rdi, %rdi	 ; for_stmt
	je	.L85	 ;,
 ; D:/TC/src/create.c:116:         statement->stmt.for_stmt = for_stmt;
	movq	%rdi, (%rax)	 ; for_stmt,* <retval>
	jmp	.L78	 ;
	.p2align 4,,10
	.p2align 3
.L85:
 ; D:/TC/src/create.c:117:     else if (type == RETURN_STATEMENT)
	cmpl	$5, %ebx	 ;, type
	je	.L121	 ;,
 ; D:/TC/src/create.c:119:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	leal	-6(%rbx), %edx	 ;, tmp138
 ; D:/TC/src/create.c:119:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	cmpl	$1, %edx	 ;, tmp138
	ja	.L87	 ;,
 ; D:/TC/src/create.c:120:         statement->stmt.expr = NULL;
	movq	$0, (%rax)	 ;, statement_33->stmt.expr
	jmp	.L78	 ;
.L87:
 ; D:/TC/src/create.c:122:         if (if_stmt == NULL && while_stmt == NULL && for_stmt == NULL && expr == NULL && var_stmt == NULL)
	orq	%rbp, %rdi	 ; while_stmt, for_stmt
	movq	120(%rsp), %rax	 ; var_stmt, tmp140
	orq	%rdi, %rsi	 ; tmp139, tmp140
	orq	%rsi, %rax	 ; tmp140, tmp140
	orq	%r12, %rax	 ; expr, tmp155
	je	.L122	 ;,
 ; D:/TC/src/create.c:125:             fprintf(stderr, "Error creating statement: unknown type %u\n", type);
	call	__getreent	 ;
 ; D:/TC/src/create.c:125:             fprintf(stderr, "Error creating statement: unknown type %u\n", type);
	movl	%ebx, %r8d	 ; type,
	leaq	.LC10(%rip), %rdx	 ;, tmp146
	movq	24(%rax), %rcx	 ; _25->_stderr, _25->_stderr
	call	fprintf	 ;
 ; D:/TC/src/create.c:126:         return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L78	 ;
.L122:
 ; D:/TC/src/create.c:123:             fprintf(stderr, "Error creating statement: content is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:123:             fprintf(stderr, "Error creating statement: content is NULL\n");
	movl	$42, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC9(%rip), %rcx	 ;, tmp144
	movq	24(%rax), %r9	 ; _23->_stderr,
	call	fwrite	 ;
 ; D:/TC/src/create.c:126:         return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L78	 ;
	.section .rdata,"dr"
	.align 8
.LC11:
	.ascii "Error creating if statement: condition is NULL\12\0"
	.text
	.p2align 4
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
	je	.L127	 ;,
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
.L123:
 ; D:/TC/src/create.c:142: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L127:
 ; D:/TC/src/create.c:133:         fprintf(stderr, "Error creating if statement: condition is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:133:         fprintf(stderr, "Error creating if statement: condition is NULL\n");
	movl	$47, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC11(%rip), %rcx	 ;, tmp90
	movq	24(%rax), %r9	 ; _1->_stderr,
	call	fwrite	 ;
 ; D:/TC/src/create.c:134:         return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L123	 ;
	.section .rdata,"dr"
	.align 8
.LC12:
	.ascii "Error creating else-if statement: condition is NULL\12\0"
	.text
	.p2align 4
	.globl	create_else_if
	.def	create_else_if;	.scl	2;	.type	32;	.endef
create_else_if:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:/TC/src/create.c:145:     if (condition == NULL) {
	testq	%rcx, %rcx	 ; condition
	je	.L132	 ;,
	movq	%rcx, %rbx	 ; tmp90, condition
 ; D:/TC/src/create.c:149:     ElseIf* else_if = (ElseIf*)alloc_memory(sizeof(ElseIf));
	movl	$16, %ecx	 ;,
	movq	%rdx, %rsi	 ; tmp91, body
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:150:     else_if->condition = condition;
	movq	%rbx, (%rax)	 ; condition, else_if_8->condition
 ; D:/TC/src/create.c:151:     else_if->body = body;
	movq	%rsi, 8(%rax)	 ; body, else_if_8->body
.L128:
 ; D:/TC/src/create.c:153: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L132:
 ; D:/TC/src/create.c:146:         fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:146:         fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
	movl	$52, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC12(%rip), %rcx	 ;, tmp88
	movq	24(%rax), %r9	 ; _1->_stderr,
	call	fwrite	 ;
 ; D:/TC/src/create.c:147:         return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L128	 ;
	.p2align 4
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
	.p2align 4
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
	.align 8
.LC15:
	.ascii "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\12\0"
	.align 8
.LC16:
	.ascii "Error creating expression: both expr_left and prim_left are NULL\12\0"
	.text
	.p2align 4
	.globl	create_expression
	.def	create_expression;	.scl	2;	.type	32;	.endef
create_expression:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%r8, %rbp	 ; tmp120, prim_left
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp119, expr_left
	pushq	%rsi	 ;
	movq	%r9, %rsi	 ; tmp121, right
	pushq	%rbx	 ;
	movl	%ecx, %ebx	 ; tmp118, operator
	subq	$48, %rsp	 ;,
 ; D:/TC/src/create.c:172:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	cmpl	$19, %ecx	 ;, operator
	sete	%dl	 ;, tmp101
	testq	%r9, %r9	 ; right
	sete	%al	 ;, tmp103
 ; D:/TC/src/create.c:172:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	cmpb	%al, %dl	 ; tmp103, tmp101
	jne	.L138	 ;,
 ; D:/TC/src/create.c:172:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	movq	%r8, %rax	 ; prim_left, tmp125
	orq	%rdi, %rax	 ; expr_left, tmp125
	je	.L155	 ;,
 ; D:/TC/src/create.c:180:     Expression* expression = (Expression*)alloc_memory(sizeof(Expression));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:181:     expression->operator = operator;
	movl	%ebx, 24(%rax)	 ; operator, expression_24->operator
 ; D:/TC/src/create.c:182:     if (expr_left != NULL)
	testq	%rdi, %rdi	 ; expr_left
	je	.L145	 ;,
 ; D:/TC/src/create.c:183:         expression->expr_left = expr_left;
	movq	%rdi, (%rax)	 ; expr_left, expression_24->expr_left
.L146:
 ; D:/TC/src/create.c:190:     expression->right = right;
	movq	%rsi, 16(%rax)	 ; right, expression_24->right
.L137:
 ; D:/TC/src/create.c:192: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L155:
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC13(%rip), %rbp	 ;, iftmp.1_12
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%r9, %r9	 ; right
	je	.L149	 ;,
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC14(%rip), %r12	 ;, iftmp.0_11
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%rbp, %rsi	 ; iftmp.1_12, iftmp.2_13
	jmp	.L140	 ;
	.p2align 4,,10
	.p2align 3
.L138:
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC13(%rip), %rax	 ;, tmp111
	leaq	.LC14(%rip), %r9	 ;, tmp110
	testq	%rsi, %rsi	 ; right
	movq	%rax, %r12	 ; tmp111, iftmp.0_11
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%rax, %rbp	 ; tmp111, iftmp.1_12
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	cmovne	%r9, %r12	 ; tmp110,, iftmp.0_11
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%r8, %r8	 ; prim_left
	cmovne	%r9, %rbp	 ; tmp110,, iftmp.1_12
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%rdi, %rdi	 ; expr_left
	cmovne	%r9, %rax	 ; tmp110,, tmp111
	movq	%rax, %rsi	 ; tmp111, iftmp.2_13
.L140:
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	cmpl	$19, %ebx	 ;, operator
	leaq	.LC13(%rip), %rax	 ;, tmp115
	leaq	.LC14(%rip), %rbx	 ;, tmp114
	cmove	%rax, %rbx	 ; tmp114,, tmp115, iftmp.3_14
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	call	__getreent	 ;
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%rsi, %r9	 ; iftmp.2_13,
	leaq	.LC15(%rip), %rdx	 ;, tmp106
	movq	24(%rax), %rcx	 ; _7->_stderr, _7->_stderr
	movq	%r12, 40(%rsp)	 ; iftmp.0_11,
	movq	%rbx, %r8	 ; iftmp.3_14,
	movq	%rbp, 32(%rsp)	 ; iftmp.1_12,
	call	fprintf	 ;
 ; D:/TC/src/create.c:178:         return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L137	 ;
	.p2align 4,,10
	.p2align 3
.L149:
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%rbp, %r12	 ; iftmp.1_12, iftmp.0_11
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%rbp, %rsi	 ; iftmp.1_12, iftmp.2_13
	jmp	.L140	 ;
	.p2align 4,,10
	.p2align 3
.L145:
 ; D:/TC/src/create.c:184:     else if (prim_left != NULL)
	testq	%rbp, %rbp	 ; prim_left
	je	.L147	 ;,
 ; D:/TC/src/create.c:185:         expression->prim_left = prim_left;
	movq	%rbp, 8(%rax)	 ; prim_left, expression_24->prim_left
	jmp	.L146	 ;
.L147:
 ; D:/TC/src/create.c:187:         fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:187:         fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
	movl	$65, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rcx	 ;, tmp108
	movq	24(%rax), %r9	 ; _9->_stderr,
	call	fwrite	 ;
 ; D:/TC/src/create.c:178:         return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L137	 ;
	.section .rdata,"dr"
	.align 8
.LC17:
	.ascii "Error creating primary: value is NULL\12\0"
	.align 8
.LC18:
	.ascii "Error creating primary: unknown type %u\12\0"
	.text
	.p2align 4
	.globl	create_primary
	.def	create_primary;	.scl	2;	.type	32;	.endef
create_primary:
	pushq	%rbp	 ;
	movq	%r8, %rbp	 ; tmp132, expr_value
	pushq	%rdi	 ;
	movq	%r9, %rdi	 ; tmp133, prim_value
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp131, str_value
	pushq	%rbx	 ;
	movl	%ecx, %ebx	 ; tmp130, type
 ; D:/TC/src/create.c:195:     Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
	movl	$16, %ecx	 ;,
 ; D:/TC/src/create.c:194: Primary* create_primary(PrimaryType type, string str_value, Expression* expr_value, Primary* prim_value, VariableAccess* variable_value) {
	subq	$40, %rsp	 ;,
 ; D:/TC/src/create.c:195:     Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:196:     primary->type = type;
	movl	%ebx, 8(%rax)	 ; type, primary_27->type
 ; D:/TC/src/create.c:197:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != NULL)
	cmpl	$4, %ebx	 ;, type
	ja	.L157	 ;,
	testq	%rsi, %rsi	 ; str_value
	je	.L157	 ;,
 ; D:/TC/src/create.c:198:         primary->value.literal_value = str_value;
	movq	%rsi, (%rax)	 ; str_value, primary_27->value.literal_value
.L156:
 ; D:/TC/src/create.c:213: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L157:
 ; D:/TC/src/create.c:199:     else if (type == PRIM_EXPRESSION && expr_value != NULL)
	cmpl	$5, %ebx	 ;, type
	jne	.L159	 ;,
	testq	%rbp, %rbp	 ; expr_value
	je	.L159	 ;,
 ; D:/TC/src/create.c:200:         primary->value.expr = expr_value;
	movq	%rbp, (%rax)	 ; expr_value, primary_27->value.expr
 ; D:/TC/src/create.c:213: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L159:
 ; D:/TC/src/create.c:201:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	leal	-6(%rbx), %edx	 ;, tmp117
 ; D:/TC/src/create.c:201:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	cmpl	$1, %edx	 ;, tmp117
	jbe	.L188	 ;,
 ; D:/TC/src/create.c:203:     else if (type == PRIM_VARIABLE_ACCESS && variable_value != NULL)
	cmpl	$8, %ebx	 ;, type
	jne	.L162	 ;,
	cmpq	$0, 112(%rsp)	 ;, variable_value
	je	.L162	 ;,
 ; D:/TC/src/create.c:204:         primary->value.var = variable_value;
	movq	112(%rsp), %rdi	 ; variable_value, tmp139
.L187:
	movq	%rdi, (%rax)	 ; tmp139,* <retval>
 ; D:/TC/src/create.c:213: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L188:
 ; D:/TC/src/create.c:201:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	testq	%rdi, %rdi	 ; prim_value
	jne	.L187	 ;,
.L162:
 ; D:/TC/src/create.c:206:         if (str_value == NULL && expr_value == NULL && prim_value == NULL && variable_value == NULL)
	movq	112(%rsp), %rax	 ; variable_value, prim_value
	movq	%rbp, %r8	 ; expr_value, expr_value
	orq	%rdi, %rax	 ; prim_value, prim_value
	orq	%rax, %r8	 ; tmp122, expr_value
	orq	%r8, %rsi	 ; tmp123, tmp137
	jne	.L163	 ;,
 ; D:/TC/src/create.c:207:             fprintf(stderr, "Error creating primary: value is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:207:             fprintf(stderr, "Error creating primary: value is NULL\n");
	movl	$38, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC17(%rip), %rcx	 ;, tmp126
	movq	24(%rax), %r9	 ; _17->_stderr,
	call	fwrite	 ;
 ; D:/TC/src/create.c:210:         return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L156	 ;
	.p2align 4,,10
	.p2align 3
.L163:
 ; D:/TC/src/create.c:209:             fprintf(stderr, "Error creating primary: unknown type %u\n", type);
	call	__getreent	 ;
 ; D:/TC/src/create.c:209:             fprintf(stderr, "Error creating primary: unknown type %u\n", type);
	movl	%ebx, %r8d	 ; type,
	leaq	.LC18(%rip), %rdx	 ;, tmp128
	movq	24(%rax), %rcx	 ; _19->_stderr, _19->_stderr
	call	fprintf	 ;
 ; D:/TC/src/create.c:210:         return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L156	 ;
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
	.p2align 4
	.globl	create_variable_access
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
create_variable_access:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp141, base
	pushq	%rbx	 ;
	movl	%ecx, %ebx	 ; tmp140, type
	subq	$32, %rsp	 ;,
 ; D:/TC/src/create.c:216:     if ((base == NULL) != (type == VAR_NAME)) {
	testl	%ecx, %ecx	 ; type
	sete	%al	 ;, tmp113
	testq	%rdx, %rdx	 ; base
	sete	%r12b	 ;, tmp115
 ; D:/TC/src/create.c:216:     if ((base == NULL) != (type == VAR_NAME)) {
	cmpb	%al, %r12b	 ; tmp113, tmp115
	jne	.L229	 ;,
	movq	%r8, %rdi	 ; tmp142, name_content
 ; D:/TC/src/create.c:220:     VariableAccess* variable_access = (VariableAccess*)alloc_memory(sizeof(VariableAccess));
	movl	$24, %ecx	 ;,
	movq	%r9, %rbp	 ; tmp143, expr_content
	call	alloc_memory	 ;
 ; D:/TC/src/create.c:223:     if (type == VAR_NAME && name_content != NULL)
	testq	%rdi, %rdi	 ; name_content
 ; D:/TC/src/create.c:221:     variable_access->type = type;
	movl	%ebx, 16(%rax)	 ; type, variable_access_33->type
 ; D:/TC/src/create.c:223:     if (type == VAR_NAME && name_content != NULL)
	setne	%dl	 ;, tmp118
 ; D:/TC/src/create.c:222:     variable_access->base = base;
	movq	%rsi, (%rax)	 ; base, variable_access_33->base
 ; D:/TC/src/create.c:223:     if (type == VAR_NAME && name_content != NULL)
	testb	%r12b, %r12b	 ; tmp115
	je	.L194	 ;,
	testb	%dl, %dl	 ; tmp118
	je	.L194	 ;,
.L228:
 ; D:/TC/src/create.c:230:         variable_access->content.attr_name = name_content;
	movq	%rdi, 8(%rax)	 ; name_content,
.L189:
 ; D:/TC/src/create.c:239: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L194:
 ; D:/TC/src/create.c:225:     else if (type == VAR_FUNC_CALL && args_content != NULL)
	cmpl	$1, %ebx	 ;, type
	jne	.L196	 ;,
	cmpq	$0, 112(%rsp)	 ;, args_content
	je	.L196	 ;,
 ; D:/TC/src/create.c:226:         variable_access->content.args = args_content;
	movq	112(%rsp), %rsi	 ; args_content, tmp152
	movq	%rsi, 8(%rax)	 ; tmp152, variable_access_33->content.args
 ; D:/TC/src/create.c:239: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L229:
 ; D:/TC/src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	leaq	.LC13(%rip), %rax	 ;, tmp137
	leaq	.LC14(%rip), %r8	 ;, tmp136
	testl	%ecx, %ecx	 ; type
	movq	%rax, %rdi	 ; tmp137, iftmp.4_23
	cmovne	%r8, %rdi	 ; tmp136,, iftmp.4_23
 ; D:/TC/src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	testq	%rdx, %rdx	 ; base
	cmovne	%r8, %rax	 ; tmp136,, tmp137
	movq	%rax, %rbx	 ; tmp137, iftmp.5_24
 ; D:/TC/src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	call	__getreent	 ;
 ; D:/TC/src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movq	%rdi, %r9	 ; iftmp.4_23,
	movq	%rbx, %r8	 ; iftmp.5_24,
	leaq	.LC19(%rip), %rdx	 ;, tmp117
	movq	24(%rax), %rcx	 ; _4->_stderr, _4->_stderr
	call	fprintf	 ;
 ; D:/TC/src/create.c:218:         return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L189	 ;
	.p2align 4,,10
	.p2align 3
.L196:
 ; D:/TC/src/create.c:227:     else if (type == VAR_GET_SEQ && expr_content != NULL)
	cmpl	$3, %ebx	 ;, type
	jne	.L198	 ;,
	testq	%rbp, %rbp	 ; expr_content
	je	.L198	 ;,
 ; D:/TC/src/create.c:228:         variable_access->content.index = expr_content;
	movq	%rbp, 8(%rax)	 ; expr_content, variable_access_33->content.index
	jmp	.L189	 ;
	.p2align 4,,10
	.p2align 3
.L198:
 ; D:/TC/src/create.c:229:     else if (type == VAR_GET_ATTR && name_content != NULL)
	cmpl	$2, %ebx	 ;, type
	jne	.L199	 ;,
	testb	%dl, %dl	 ; tmp118
	jne	.L228	 ;,
.L199:
 ; D:/TC/src/create.c:232:         if (name_content == NULL && expr_content == NULL && args_content == NULL)
	movq	112(%rsp), %r9	 ; args_content, expr_content
	orq	%rbp, %r9	 ; expr_content, expr_content
	orq	%r9, %rdi	 ; tmp129, name_content
	je	.L230	 ;,
 ; D:/TC/src/create.c:235:             fprintf(stderr, "Error creating variable access: unknown type %u\n", type);
	call	__getreent	 ;
 ; D:/TC/src/create.c:235:             fprintf(stderr, "Error creating variable access: unknown type %u\n", type);
	movl	%ebx, %r8d	 ; type,
	leaq	.LC21(%rip), %rdx	 ;, tmp134
	movq	24(%rax), %rcx	 ; _21->_stderr, _21->_stderr
	call	fprintf	 ;
 ; D:/TC/src/create.c:218:         return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L189	 ;
.L230:
 ; D:/TC/src/create.c:233:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:233:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	movl	$48, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC20(%rip), %rcx	 ;, tmp132
	movq	24(%rax), %r9	 ; _19->_stderr,
	call	fwrite	 ;
 ; D:/TC/src/create.c:218:         return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L189	 ;
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
