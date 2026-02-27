	.file	"D:\\TC\\src\\create.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -Os
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Error creating code member: content is NULL\12\0"
.LC1:
	.ascii "Error creating code member: unknown type %d\12\0"
	.text
	.globl	create_code_member
	.def	create_code_member;	.scl	2;	.type	32;	.endef
	.seh_proc	create_code_member
create_code_member:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
 ; D:\TC\src\create.c:3: CodeMember* create_code_member(CodeMemberType type, Import* import_content, Function* function_content, Class* class_content) {
	movl	%ecx, %ebx	 ; tmp124, type
 ; D:\TC\src\create.c:4:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	movl	$16, %ecx	 ;,
 ; D:\TC\src\create.c:3: CodeMember* create_code_member(CodeMemberType type, Import* import_content, Function* function_content, Class* class_content) {
	movq	%rdx, %rdi	 ; tmp125, import_content
	movq	%r8, %rbp	 ; tmp126, function_content
	movq	%r9, %rsi	 ; tmp127, class_content
 ; D:\TC\src\create.c:4:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	call	alloc_memory	 ;
 ; D:\TC\src\create.c:5:     code_member->type = type;
	movl	%ebx, 8(%rax)	 ; type, code_member_23->type
 ; D:\TC\src\create.c:6:     if (type == CODE_IMPORT && import_content != NULL)
	testl	%ebx, %ebx	 ; type
	jne	.L2	 ;,
	testq	%rdi, %rdi	 ; import_content
	je	.L2	 ;,
 ; D:\TC\src\create.c:7:         code_member->content.import = import_content;
	movq	%rdi, (%rax)	 ; import_content, code_member_23->content.import
	jmp	.L1	 ;
.L2:
 ; D:\TC\src\create.c:8:     else if (type == CODE_FUNCTION && function_content != NULL)
	cmpl	$1, %ebx	 ;, type
	jne	.L4	 ;,
	testq	%rbp, %rbp	 ; function_content
	je	.L4	 ;,
 ; D:\TC\src\create.c:9:         code_member->content.function = function_content;
	movq	%rbp, (%rax)	 ; function_content, code_member_23->content.function
	jmp	.L1	 ;
.L4:
 ; D:\TC\src\create.c:10:     else if (type == CODE_CLASS && class_content != NULL)
	cmpl	$2, %ebx	 ;, type
	jne	.L6	 ;,
	testq	%rsi, %rsi	 ; class_content
	je	.L6	 ;,
 ; D:\TC\src\create.c:11:         code_member->content.class_ = class_content;
	movq	%rsi, (%rax)	 ; class_content, code_member_23->content.class_
	jmp	.L1	 ;
.L6:
 ; D:\TC\src\create.c:13:         if (import_content == 0 && function_content == 0 && class_content == 0)
	orq	%rbp, %rsi	 ; function_content, tmp117
	orq	%rsi, %rdi	 ; tmp117, tmp131
	jne	.L7	 ;,
 ; D:\TC\src\create.c:14:             fprintf(stderr, "Error creating code member: content is NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:14:             fprintf(stderr, "Error creating code member: content is NULL\n");
	leaq	.LC0(%rip), %rcx	 ;, tmp120
	movq	24(%rax), %rdx	 ; _13->_stderr, _13->_stderr
	call	fputs	 ;
 ; D:\TC\src\create.c:14:             fprintf(stderr, "Error creating code member: content is NULL\n");
	jmp	.L8	 ;
.L7:
 ; D:\TC\src\create.c:16:             fprintf(stderr, "Error creating code member: unknown type %d\n", type);
	call	__getreent	 ;
 ; D:\TC\src\create.c:16:             fprintf(stderr, "Error creating code member: unknown type %d\n", type);
	movl	%ebx, %r8d	 ; type,
	leaq	.LC1(%rip), %rdx	 ;, tmp122
	movq	24(%rax), %rcx	 ; _15->_stderr, _15->_stderr
	call	fprintf	 ;
.L8:
 ; D:\TC\src\create.c:17:         return 0;
	xorl	%eax, %eax	 ; <retval>
.L1:
 ; D:\TC\src\create.c:20: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	create_code
	.def	create_code;	.scl	2;	.type	32;	.endef
	.seh_proc	create_code
create_code:
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
 ; D:\TC\src\create.c:22: Code* create_code(list(CodeMember*) members, Scope* global_scope) {
	movq	%rcx, %rsi	 ; tmp86, members
 ; D:\TC\src\create.c:23:     Code* code = (Code*)alloc_memory(sizeof(Code));
	movl	$16, %ecx	 ;,
 ; D:\TC\src\create.c:22: Code* create_code(list(CodeMember*) members, Scope* global_scope) {
	movq	%rdx, %rbx	 ; tmp87, global_scope
 ; D:\TC\src\create.c:23:     Code* code = (Code*)alloc_memory(sizeof(Code));
	call	alloc_memory	 ;
 ; D:\TC\src\create.c:25:     code_ptr->members = members;
	movq	%rsi, (%rax)	 ; members, code_3->members
 ; D:\TC\src\create.c:26:     code_ptr->global_scope = global_scope;
	movq	%rbx, 8(%rax)	 ; global_scope, code_3->global_scope
 ; D:\TC\src\create.c:28: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC2:
	.ascii "Error creating import: name is NULL\12\0"
	.text
	.globl	create_import
	.def	create_import;	.scl	2;	.type	32;	.endef
	.seh_proc	create_import
create_import:
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
 ; D:\TC\src\create.c:30: Import* create_import(Name* name, string source) {
	movq	%rcx, %rbx	 ; tmp90, name
	movq	%rdx, %rsi	 ; tmp91, source
 ; D:\TC\src\create.c:31:     if (name == 0) {
	testq	%rcx, %rcx	 ; name
	jne	.L30	 ;,
 ; D:\TC\src\create.c:32:         fprintf(stderr, "Error creating import: name is NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:32:         fprintf(stderr, "Error creating import: name is NULL\n");
	leaq	.LC2(%rip), %rcx	 ;, tmp88
	movq	24(%rax), %rdx	 ; _1->_stderr, _1->_stderr
	call	fputs	 ;
 ; D:\TC\src\create.c:33:         return 0;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L29	 ;
.L30:
 ; D:\TC\src\create.c:35:     Import* import = (Import*)alloc_memory(sizeof(Import));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\create.c:37:     import_ptr->name = name;
	movq	%rbx, (%rax)	 ; name, import_8->name
 ; D:\TC\src\create.c:38:     import_ptr->source = source;
	movq	%rsi, 8(%rax)	 ; source, import_8->source
.L29:
 ; D:\TC\src\create.c:40: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "Error creating function: name or return_type is NULL\12\0"
	.text
	.globl	create_function
	.def	create_function;	.scl	2;	.type	32;	.endef
	.seh_proc	create_function
create_function:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
 ; D:\TC\src\create.c:42: Function* create_function(Name* name, Name* return_type, list(Variable*) parameters, list(Statement*) body, Scope* function_scope) {
	movq	%rcx, %rsi	 ; tmp100, name
	movq	%rdx, %rbx	 ; tmp101, return_type
	movq	%r8, %rbp	 ; tmp102, parameters
	movq	%r9, %rdi	 ; tmp103, body
 ; D:\TC\src\create.c:43:     if (name == 0 || return_type == 0) {
	testq	%rcx, %rcx	 ; name
	je	.L36	 ;,
	testq	%rdx, %rdx	 ; return_type
	jne	.L33	 ;,
.L36:
 ; D:\TC\src\create.c:44:         fprintf(stderr, "Error creating function: name or return_type is NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:44:         fprintf(stderr, "Error creating function: name or return_type is NULL\n");
	leaq	.LC3(%rip), %rcx	 ;, tmp98
	movq	24(%rax), %rdx	 ; _4->_stderr, _4->_stderr
	call	fputs	 ;
 ; D:\TC\src\create.c:45:         return 0;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L32	 ;
.L33:
 ; D:\TC\src\create.c:47:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\create.c:53:     function_ptr->function_scope = function_scope;
	movq	112(%rsp), %rdx	 ; function_scope, function_scope
 ; D:\TC\src\create.c:49:     function_ptr->name = name;
	movq	%rsi, (%rax)	 ; name, function_12->name
 ; D:\TC\src\create.c:50:     function_ptr->return_type = return_type;
	movq	%rbx, 8(%rax)	 ; return_type, function_12->return_type
 ; D:\TC\src\create.c:51:     function_ptr->parameters = parameters;
	movq	%rbp, 16(%rax)	 ; parameters, function_12->parameters
 ; D:\TC\src\create.c:52:     function_ptr->body = body;
	movq	%rdi, 24(%rax)	 ; body, function_12->body
 ; D:\TC\src\create.c:53:     function_ptr->function_scope = function_scope;
	movq	%rdx, 32(%rax)	 ; function_scope, function_12->function_scope
.L32:
 ; D:\TC\src\create.c:55: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC4:
	.ascii "Error creating method: name or return_type is NULL\12\0"
	.text
	.globl	create_method
	.def	create_method;	.scl	2;	.type	32;	.endef
	.seh_proc	create_method
create_method:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
 ; D:\TC\src\create.c:57: Method* create_method(Name* name, Name* return_type, list(Variable*) parameters, list(Statement*) body, Scope* method_scope) {
	movq	%rcx, %rsi	 ; tmp100, name
	movq	%rdx, %rbx	 ; tmp101, return_type
	movq	%r8, %rbp	 ; tmp102, parameters
	movq	%r9, %rdi	 ; tmp103, body
 ; D:\TC\src\create.c:58:     if (name == 0 || return_type == 0) {
	testq	%rcx, %rcx	 ; name
	je	.L41	 ;,
	testq	%rdx, %rdx	 ; return_type
	jne	.L38	 ;,
.L41:
 ; D:\TC\src\create.c:59:         fprintf(stderr, "Error creating method: name or return_type is NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:59:         fprintf(stderr, "Error creating method: name or return_type is NULL\n");
	leaq	.LC4(%rip), %rcx	 ;, tmp98
	movq	24(%rax), %rdx	 ; _4->_stderr, _4->_stderr
	call	fputs	 ;
 ; D:\TC\src\create.c:60:         return 0;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L37	 ;
.L38:
 ; D:\TC\src\create.c:62:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\create.c:68:     method_ptr->method_scope = method_scope;
	movq	112(%rsp), %rdx	 ; method_scope, method_scope
 ; D:\TC\src\create.c:64:     method_ptr->name = name;
	movq	%rsi, (%rax)	 ; name, method_12->name
 ; D:\TC\src\create.c:65:     method_ptr->return_type = return_type;
	movq	%rbx, 8(%rax)	 ; return_type, method_12->return_type
 ; D:\TC\src\create.c:66:     method_ptr->parameters = parameters;
	movq	%rbp, 16(%rax)	 ; parameters, method_12->parameters
 ; D:\TC\src\create.c:67:     method_ptr->body = body;
	movq	%rdi, 24(%rax)	 ; body, method_12->body
 ; D:\TC\src\create.c:68:     method_ptr->method_scope = method_scope;
	movq	%rdx, 32(%rax)	 ; method_scope, method_12->method_scope
.L37:
 ; D:\TC\src\create.c:70: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC5:
	.ascii "Error creating class member: content is NULL\12\0"
.LC6:
	.ascii "Error creating class member: unknown type %d\12\0"
	.text
	.globl	create_class_member
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.seh_proc	create_class_member
create_class_member:
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$32, %rsp	 ;,
	.seh_stackalloc	32
	.seh_endprologue
 ; D:\TC\src\create.c:72: ClassMember* create_class_member(ClassMemberType type, Method* method_content, Variable* variable_content) {
	movl	%ecx, %ebx	 ; tmp113, type
 ; D:\TC\src\create.c:73:     ClassMember* class_member = (ClassMember*)alloc_memory(sizeof(ClassMember));
	movl	$16, %ecx	 ;,
 ; D:\TC\src\create.c:72: ClassMember* create_class_member(ClassMemberType type, Method* method_content, Variable* variable_content) {
	movq	%rdx, %rsi	 ; tmp114, method_content
	movq	%r8, %rdi	 ; tmp115, variable_content
 ; D:\TC\src\create.c:73:     ClassMember* class_member = (ClassMember*)alloc_memory(sizeof(ClassMember));
	call	alloc_memory	 ;
 ; D:\TC\src\create.c:75:     class_member_ptr->type = type;
	movl	%ebx, 8(%rax)	 ; type, class_member_20->type
 ; D:\TC\src\create.c:76:     if (type == CLASS_METHOD && method_content != NULL)
	testl	%ebx, %ebx	 ; type
	jne	.L43	 ;,
	testq	%rsi, %rsi	 ; method_content
	je	.L43	 ;,
 ; D:\TC\src\create.c:77:         class_member_ptr->content.method = method_content;
	movq	%rsi, (%rax)	 ; method_content, class_member_20->content.method
	jmp	.L42	 ;
.L43:
 ; D:\TC\src\create.c:78:     else if (type == CLASS_VARIABLE && variable_content != NULL)
	cmpl	$1, %ebx	 ;, type
	jne	.L45	 ;,
	testq	%rdi, %rdi	 ; variable_content
	je	.L45	 ;,
 ; D:\TC\src\create.c:79:         class_member_ptr->content.variable = variable_content;
	movq	%rdi, (%rax)	 ; variable_content, class_member_20->content.variable
	jmp	.L42	 ;
.L45:
 ; D:\TC\src\create.c:81:         if (method_content == 0 && variable_content == 0)
	orq	%rdi, %rsi	 ; variable_content, tmp119
	jne	.L47	 ;,
 ; D:\TC\src\create.c:82:             fprintf(stderr, "Error creating class member: content is NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:82:             fprintf(stderr, "Error creating class member: content is NULL\n");
	leaq	.LC5(%rip), %rcx	 ;, tmp109
	movq	24(%rax), %rdx	 ; _10->_stderr, _10->_stderr
	call	fputs	 ;
	jmp	.L48	 ;
.L47:
 ; D:\TC\src\create.c:84:             fprintf(stderr, "Error creating class member: unknown type %d\n", type);
	call	__getreent	 ;
 ; D:\TC\src\create.c:84:             fprintf(stderr, "Error creating class member: unknown type %d\n", type);
	movl	%ebx, %r8d	 ; type,
	leaq	.LC6(%rip), %rdx	 ;, tmp111
	movq	24(%rax), %rcx	 ; _12->_stderr, _12->_stderr
	call	fprintf	 ;
.L48:
 ; D:\TC\src\create.c:85:         return 0;
	xorl	%eax, %eax	 ; <retval>
.L42:
 ; D:\TC\src\create.c:88: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC7:
	.ascii "Error creating class: name is NULL\12\0"
	.text
	.globl	create_class
	.def	create_class;	.scl	2;	.type	32;	.endef
	.seh_proc	create_class
create_class:
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$32, %rsp	 ;,
	.seh_stackalloc	32
	.seh_endprologue
 ; D:\TC\src\create.c:90: Class* create_class(Name* name, list(ClassMember*) members, Scope* class_scope) {
	movq	%rcx, %rbx	 ; tmp91, name
	movq	%rdx, %rdi	 ; tmp92, members
	movq	%r8, %rsi	 ; tmp93, class_scope
 ; D:\TC\src\create.c:91:     if (name == 0) {
	testq	%rcx, %rcx	 ; name
	jne	.L62	 ;,
 ; D:\TC\src\create.c:92:         fprintf(stderr, "Error creating class: name is NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:92:         fprintf(stderr, "Error creating class: name is NULL\n");
	leaq	.LC7(%rip), %rcx	 ;, tmp89
	movq	24(%rax), %rdx	 ; _1->_stderr, _1->_stderr
	call	fputs	 ;
 ; D:\TC\src\create.c:93:         return 0;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L61	 ;
.L62:
 ; D:\TC\src\create.c:95:     Class* class = (Class*)alloc_memory(sizeof(Class));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\create.c:97:     class_ptr->name = name;
	movq	%rbx, (%rax)	 ; name, class_8->name
 ; D:\TC\src\create.c:98:     class_ptr->members = members;
	movq	%rdi, 8(%rax)	 ; members, class_8->members
 ; D:\TC\src\create.c:99:     class_ptr->class_scope = class_scope;
	movq	%rsi, 16(%rax)	 ; class_scope, class_8->class_scope
.L61:
 ; D:\TC\src\create.c:101: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC8:
	.ascii "Error creating variable: type or name is NULL\12\0"
	.text
	.globl	create_variable
	.def	create_variable;	.scl	2;	.type	32;	.endef
	.seh_proc	create_variable
create_variable:
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$32, %rsp	 ;,
	.seh_stackalloc	32
	.seh_endprologue
 ; D:\TC\src\create.c:103: Variable* create_variable(Name* type, Name* name, Expression* value) {
	movq	%rcx, %rsi	 ; tmp98, type
	movq	%rdx, %rbx	 ; tmp99, name
	movq	%r8, %rdi	 ; tmp100, value
 ; D:\TC\src\create.c:104:     if (type == 0 || name == 0) {
	testq	%rcx, %rcx	 ; type
	je	.L68	 ;,
	testq	%rdx, %rdx	 ; name
	jne	.L65	 ;,
.L68:
 ; D:\TC\src\create.c:105:         fprintf(stderr, "Error creating variable: type or name is NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:105:         fprintf(stderr, "Error creating variable: type or name is NULL\n");
	leaq	.LC8(%rip), %rcx	 ;, tmp96
	movq	24(%rax), %rdx	 ; _4->_stderr, _4->_stderr
	call	fputs	 ;
 ; D:\TC\src\create.c:106:         return 0;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L64	 ;
.L65:
 ; D:\TC\src\create.c:108:     Variable* variable = (Variable*)alloc_memory(sizeof(Variable));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\create.c:110:     variable_ptr->type = type;
	movq	%rsi, (%rax)	 ; type, variable_12->type
 ; D:\TC\src\create.c:111:     variable_ptr->name = name;
	movq	%rbx, 8(%rax)	 ; name, variable_12->name
 ; D:\TC\src\create.c:112:     variable_ptr->value = value;
	movq	%rdi, 16(%rax)	 ; value, variable_12->value
.L64:
 ; D:\TC\src\create.c:114: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC9:
	.ascii "Error creating statement: content is NULL\12\0"
.LC10:
	.ascii "Error creating statement: unknown type %d\12\0"
	.text
	.globl	create_statement
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.seh_proc	create_statement
create_statement:
	pushq	%r13	 ;
	.seh_pushreg	%r13
	pushq	%r12	 ;
	.seh_pushreg	%r12
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
 ; D:\TC\src\create.c:116: Statement* create_statement(StatementType type, If* if_stmt, While* while_stmt, For* for_stmt, Expression* expr, Variable* var_stmt) {
	movq	128(%rsp), %r12	 ; expr, expr
	movq	136(%rsp), %rbp	 ; var_stmt, var_stmt
	movl	%ecx, %ebx	 ; tmp151, type
 ; D:\TC\src\create.c:117:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	movl	$16, %ecx	 ;,
 ; D:\TC\src\create.c:116: Statement* create_statement(StatementType type, If* if_stmt, While* while_stmt, For* for_stmt, Expression* expr, Variable* var_stmt) {
	movq	%rdx, %rsi	 ; tmp152, if_stmt
	movq	%r8, %r13	 ; tmp153, while_stmt
	movq	%r9, %rdi	 ; tmp154, for_stmt
 ; D:\TC\src\create.c:117:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	call	alloc_memory	 ;
 ; D:\TC\src\create.c:120:     if (type == EXPRESSION_STATEMENT && expr != 0)
	testq	%r12, %r12	 ; expr
 ; D:\TC\src\create.c:119:     statement_ptr->type = type;
	movl	%ebx, 8(%rax)	 ; type, statement_35->type
 ; D:\TC\src\create.c:120:     if (type == EXPRESSION_STATEMENT && expr != 0)
	setne	%dl	 ;, tmp120
 ; D:\TC\src\create.c:120:     if (type == EXPRESSION_STATEMENT && expr != 0)
	testl	%ebx, %ebx	 ; type
	jne	.L70	 ;,
	testb	%dl, %dl	 ; tmp120
	jne	.L117	 ;,
.L70:
 ; D:\TC\src\create.c:122:     else if (type == VARIABLE_STATEMENT && var_stmt != 0)
	cmpl	$1, %ebx	 ;, type
	jne	.L72	 ;,
	testq	%rbp, %rbp	 ; var_stmt
	je	.L72	 ;,
 ; D:\TC\src\create.c:123:         statement_ptr->stmt.var = var_stmt;
	movq	%rbp, (%rax)	 ; var_stmt, statement_35->stmt.var
	jmp	.L69	 ;
.L72:
 ; D:\TC\src\create.c:124:     else if (type == IF_STATEMENT && if_stmt != 0)
	cmpl	$2, %ebx	 ;, type
	jne	.L74	 ;,
	testq	%rsi, %rsi	 ; if_stmt
	je	.L74	 ;,
 ; D:\TC\src\create.c:125:         statement_ptr->stmt.if_stmt = if_stmt;
	movq	%rsi, (%rax)	 ; if_stmt, statement_35->stmt.if_stmt
	jmp	.L69	 ;
.L74:
 ; D:\TC\src\create.c:126:     else if (type == WHILE_STATEMENT && while_stmt != 0)
	cmpl	$3, %ebx	 ;, type
	jne	.L75	 ;,
	testq	%r13, %r13	 ; while_stmt
	je	.L75	 ;,
 ; D:\TC\src\create.c:127:         statement_ptr->stmt.while_stmt = while_stmt;
	movq	%r13, (%rax)	 ; while_stmt, statement_35->stmt.while_stmt
	jmp	.L69	 ;
.L75:
 ; D:\TC\src\create.c:128:     else if (type == FOR_STATEMENT && for_stmt != 0)
	cmpl	$4, %ebx	 ;, type
	jne	.L76	 ;,
	testq	%rdi, %rdi	 ; for_stmt
	je	.L76	 ;,
 ; D:\TC\src\create.c:129:         statement_ptr->stmt.for_stmt = for_stmt;
	movq	%rdi, (%rax)	 ; for_stmt, statement_35->stmt.for_stmt
	jmp	.L69	 ;
.L76:
 ; D:\TC\src\create.c:130:     else if (type == RETURN_STATEMENT && expr != 0)
	cmpl	$5, %ebx	 ;, type
	jne	.L77	 ;,
	testb	%dl, %dl	 ; tmp120
	je	.L77	 ;,
.L117:
 ; D:\TC\src\create.c:131:         statement_ptr->stmt.return_expr = expr;
	movq	%r12, (%rax)	 ; expr,* <retval>
	jmp	.L69	 ;
.L77:
 ; D:\TC\src\create.c:132:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	leal	-6(%rbx), %edx	 ;, tmp141
 ; D:\TC\src\create.c:132:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	cmpl	$1, %edx	 ;, tmp141
	ja	.L78	 ;,
 ; D:\TC\src\create.c:133:         statement_ptr->stmt.expr = 0;
	xorl	%edx, %edx	 ;
	movq	%rdx, (%rax)	 ;, statement_35->stmt.expr
	jmp	.L69	 ;
.L78:
 ; D:\TC\src\create.c:135:         if (if_stmt == 0 && while_stmt == 0 && for_stmt == 0 && expr == 0 && var_stmt == 0)
	orq	%r13, %rdi	 ; while_stmt, tmp142
	orq	%rdi, %rsi	 ; tmp142, tmp143
	orq	%rsi, %rbp	 ; tmp143, tmp144
	orq	%rbp, %r12	 ; tmp144, tmp158
	jne	.L79	 ;,
 ; D:\TC\src\create.c:136:             fprintf(stderr, "Error creating statement: content is NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:136:             fprintf(stderr, "Error creating statement: content is NULL\n");
	leaq	.LC9(%rip), %rcx	 ;, tmp147
	movq	24(%rax), %rdx	 ; _25->_stderr, _25->_stderr
	call	fputs	 ;
 ; D:\TC\src\create.c:136:             fprintf(stderr, "Error creating statement: content is NULL\n");
	jmp	.L80	 ;
.L79:
 ; D:\TC\src\create.c:138:             fprintf(stderr, "Error creating statement: unknown type %d\n", type);
	call	__getreent	 ;
 ; D:\TC\src\create.c:138:             fprintf(stderr, "Error creating statement: unknown type %d\n", type);
	movl	%ebx, %r8d	 ; type,
	leaq	.LC10(%rip), %rdx	 ;, tmp149
	movq	24(%rax), %rcx	 ; _27->_stderr, _27->_stderr
	call	fprintf	 ;
.L80:
 ; D:\TC\src\create.c:139:         return 0;
	xorl	%eax, %eax	 ; <retval>
.L69:
 ; D:\TC\src\create.c:142: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC11:
	.ascii "Error creating if statement: condition is NULL\12\0"
	.text
	.globl	create_if
	.def	create_if;	.scl	2;	.type	32;	.endef
	.seh_proc	create_if
create_if:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
 ; D:\TC\src\create.c:144: If* create_if(Expression* condition, list(Statement*) body, list(ElseIf*) else_if, list(Statement*) else_body) {
	movq	%rcx, %rbx	 ; tmp92, condition
	movq	%rdx, %rbp	 ; tmp93, body
	movq	%r8, %rdi	 ; tmp94, else_if
	movq	%r9, %rsi	 ; tmp95, else_body
 ; D:\TC\src\create.c:145:     if (condition == 0) {
	testq	%rcx, %rcx	 ; condition
	jne	.L119	 ;,
 ; D:\TC\src\create.c:146:         fprintf(stderr, "Error creating if statement: condition is NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:146:         fprintf(stderr, "Error creating if statement: condition is NULL\n");
	leaq	.LC11(%rip), %rcx	 ;, tmp90
	movq	24(%rax), %rdx	 ; _1->_stderr, _1->_stderr
	call	fputs	 ;
 ; D:\TC\src\create.c:147:         return 0;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L118	 ;
.L119:
 ; D:\TC\src\create.c:149:     If* if_ = (If*)alloc_memory(sizeof(If));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\create.c:151:     if_ptr->condition = condition;
	movq	%rbx, (%rax)	 ; condition, if__8->condition
 ; D:\TC\src\create.c:152:     if_ptr->body = body;
	movq	%rbp, 8(%rax)	 ; body, if__8->body
 ; D:\TC\src\create.c:153:     if_ptr->else_if = else_if;
	movq	%rdi, 16(%rax)	 ; else_if, if__8->else_if
 ; D:\TC\src\create.c:154:     if_ptr->else_body = else_body;
	movq	%rsi, 24(%rax)	 ; else_body, if__8->else_body
.L118:
 ; D:\TC\src\create.c:156: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC12:
	.ascii "Error creating else-if statement: condition is NULL\12\0"
	.text
	.globl	create_else_if
	.def	create_else_if;	.scl	2;	.type	32;	.endef
	.seh_proc	create_else_if
create_else_if:
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
 ; D:\TC\src\create.c:158: ElseIf* create_else_if(Expression* condition, list(Statement*) body) {
	movq	%rcx, %rbx	 ; tmp90, condition
	movq	%rdx, %rsi	 ; tmp91, body
 ; D:\TC\src\create.c:159:     if (condition == 0) {
	testq	%rcx, %rcx	 ; condition
	jne	.L122	 ;,
 ; D:\TC\src\create.c:160:         fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:160:         fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
	leaq	.LC12(%rip), %rcx	 ;, tmp88
	movq	24(%rax), %rdx	 ; _1->_stderr, _1->_stderr
	call	fputs	 ;
 ; D:\TC\src\create.c:161:         return 0;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L121	 ;
.L122:
 ; D:\TC\src\create.c:163:     ElseIf* else_if = (ElseIf*)alloc_memory(sizeof(ElseIf));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\create.c:165:     else_if_ptr->condition = condition;
	movq	%rbx, (%rax)	 ; condition, else_if_8->condition
 ; D:\TC\src\create.c:166:     else_if_ptr->body = body;
	movq	%rsi, 8(%rax)	 ; body, else_if_8->body
.L121:
 ; D:\TC\src\create.c:168: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.seh_endproc
	.globl	create_for
	.def	create_for;	.scl	2;	.type	32;	.endef
	.seh_proc	create_for
create_for:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
 ; D:\TC\src\create.c:170: For* create_for(Variable* initializer, Expression* condition, Expression* increment, list(Statement*) body) {
	movq	%rcx, %rbp	 ; tmp88, initializer
 ; D:\TC\src\create.c:171:     For* for_ = (For*)alloc_memory(sizeof(For));
	movl	$32, %ecx	 ;,
 ; D:\TC\src\create.c:170: For* create_for(Variable* initializer, Expression* condition, Expression* increment, list(Statement*) body) {
	movq	%rdx, %rdi	 ; tmp89, condition
	movq	%r8, %rsi	 ; tmp90, increment
	movq	%r9, %rbx	 ; tmp91, body
 ; D:\TC\src\create.c:171:     For* for_ = (For*)alloc_memory(sizeof(For));
	call	alloc_memory	 ;
 ; D:\TC\src\create.c:173:     for_ptr->initializer = initializer;
	movq	%rbp, (%rax)	 ; initializer, for__3->initializer
 ; D:\TC\src\create.c:174:     for_ptr->condition = condition;
	movq	%rdi, 8(%rax)	 ; condition, for__3->condition
 ; D:\TC\src\create.c:175:     for_ptr->increment = increment;
	movq	%rsi, 16(%rax)	 ; increment, for__3->increment
 ; D:\TC\src\create.c:176:     for_ptr->body = body;
	movq	%rbx, 24(%rax)	 ; body, for__3->body
 ; D:\TC\src\create.c:178: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	create_while
	.def	create_while;	.scl	2;	.type	32;	.endef
	.seh_proc	create_while
create_while:
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
 ; D:\TC\src\create.c:180: While* create_while(Expression* condition, list(Statement*) body) {
	movq	%rcx, %rsi	 ; tmp86, condition
 ; D:\TC\src\create.c:181:     While* while_ = (While*)alloc_memory(sizeof(While));
	movl	$16, %ecx	 ;,
 ; D:\TC\src\create.c:180: While* create_while(Expression* condition, list(Statement*) body) {
	movq	%rdx, %rbx	 ; tmp87, body
 ; D:\TC\src\create.c:181:     While* while_ = (While*)alloc_memory(sizeof(While));
	call	alloc_memory	 ;
 ; D:\TC\src\create.c:183:     while_ptr->condition = condition;
	movq	%rsi, (%rax)	 ; condition, while__3->condition
 ; D:\TC\src\create.c:184:     while_ptr->body = body;
	movq	%rbx, 8(%rax)	 ; body, while__3->body
 ; D:\TC\src\create.c:186: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC13:
	.ascii "true\0"
.LC14:
	.ascii "false\0"
.LC15:
	.ascii "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\12\0"
.LC16:
	.ascii "Error creating expression: both expr_left and prim_left are NULL\12\0"
	.text
	.globl	create_expression
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.seh_proc	create_expression
create_expression:
	pushq	%r12	 ;
	.seh_pushreg	%r12
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$64, %rsp	 ;,
	.seh_stackalloc	64
	.seh_endprologue
 ; D:\TC\src\create.c:189:     if ((operator == OP_NONE) != (right == 0) || (expr_left == 0 && prim_left == 0)) {
	cmpl	$19, %ecx	 ;, operator
 ; D:\TC\src\create.c:188: Expression* create_expression(OperatorType operator, Expression* expr_left, Primary* prim_left, Expression* right) {
	movq	%rdx, %rsi	 ; tmp136, expr_left
	movl	%ecx, %r12d	 ; tmp135, operator
	movq	%r8, %rbp	 ; tmp137, prim_left
 ; D:\TC\src\create.c:189:     if ((operator == OP_NONE) != (right == 0) || (expr_left == 0 && prim_left == 0)) {
	sete	%dl	 ;, tmp101
	testq	%r9, %r9	 ; right
 ; D:\TC\src\create.c:188: Expression* create_expression(OperatorType operator, Expression* expr_left, Primary* prim_left, Expression* right) {
	movq	%r9, %rdi	 ; tmp138, right
 ; D:\TC\src\create.c:189:     if ((operator == OP_NONE) != (right == 0) || (expr_left == 0 && prim_left == 0)) {
	sete	%al	 ;, tmp103
 ; D:\TC\src\create.c:189:     if ((operator == OP_NONE) != (right == 0) || (expr_left == 0 && prim_left == 0)) {
	cmpb	%al, %dl	 ; tmp103, tmp101
	jne	.L127	 ;,
 ; D:\TC\src\create.c:189:     if ((operator == OP_NONE) != (right == 0) || (expr_left == 0 && prim_left == 0)) {
	movq	%r8, %rax	 ; prim_left, tmp142
	orq	%rsi, %rax	 ; expr_left, tmp142
	jne	.L144	 ;,
	jmp	.L145	 ;
.L127:
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC14(%rip), %rbx	 ;, tmp116
	leaq	.LC13(%rip), %rax	 ;, tmp115
	testq	%r9, %r9	 ; right
	movq	%rbx, %rdi	 ; tmp116, iftmp.0_11
	cmove	%rax, %rdi	 ; tmp115,, iftmp.0_11
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	testq	%r8, %r8	 ; prim_left
	cmove	%rax, %rbx	 ; tmp116,, tmp115, iftmp.1_4
.L131:
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	testq	%rsi, %rsi	 ; expr_left
	leaq	.LC14(%rip), %r9	 ;, tmp121
	leaq	.LC13(%rip), %rax	 ;, tmp122
	cmove	%rax, %r9	 ; tmp121,, tmp122, iftmp.2_13
	jmp	.L132	 ;
.L145:
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	testq	%r9, %r9	 ; right
	jne	.L146	 ;,
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC13(%rip), %rdi	 ;, iftmp.0_11
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	movq	%rdi, %rbx	 ; iftmp.0_11, iftmp.1_4
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	movq	%rdi, %r9	 ; iftmp.0_11, iftmp.2_13
.L132:
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	cmpl	$19, %r12d	 ;, operator
	leaq	.LC13(%rip), %rax	 ;, tmp128
	movq	%r9, 56(%rsp)	 ; iftmp.2_13, %sfp
	leaq	.LC14(%rip), %r8	 ;, tmp127
	cmove	%rax, %r8	 ; tmp127,, tmp128, iftmp.3_14
	movq	%r8, 48(%rsp)	 ; iftmp.3_14, %sfp
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	call	__getreent	 ;
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	movq	56(%rsp), %r9	 ; %sfp, iftmp.2_13
	movq	48(%rsp), %r8	 ; %sfp, iftmp.3_14
	leaq	.LC15(%rip), %rdx	 ;, tmp106
	movq	24(%rax), %rcx	 ; _7->_stderr, _7->_stderr
	movq	%rdi, 40(%rsp)	 ; iftmp.0_11,
	movq	%rbx, 32(%rsp)	 ; iftmp.1_4,
	call	fprintf	 ;
 ; D:\TC\src\create.c:195:         return 0;
	jmp	.L134	 ;
.L144:
 ; D:\TC\src\create.c:197:     Expression* expression = (Expression*)alloc_memory(sizeof(Expression));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\create.c:199:     expression_ptr->operator = operator;
	movl	%r12d, 24(%rax)	 ; operator, expression_24->operator
 ; D:\TC\src\create.c:200:     if (expr_left != 0)
	testq	%rsi, %rsi	 ; expr_left
	je	.L135	 ;,
 ; D:\TC\src\create.c:201:         expression_ptr->expr_left = expr_left;
	movq	%rsi, (%rax)	 ; expr_left, expression_24->expr_left
	jmp	.L136	 ;
.L135:
 ; D:\TC\src\create.c:202:     else if (prim_left != 0)
	testq	%rbp, %rbp	 ; prim_left
	je	.L137	 ;,
 ; D:\TC\src\create.c:203:         expression_ptr->prim_left = prim_left;
	movq	%rbp, 8(%rax)	 ; prim_left, expression_24->prim_left
	jmp	.L136	 ;
.L137:
 ; D:\TC\src\create.c:205:         fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:205:         fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
	leaq	.LC16(%rip), %rcx	 ;, tmp108
	movq	24(%rax), %rdx	 ; _9->_stderr, _9->_stderr
	call	fputs	 ;
.L134:
 ; D:\TC\src\create.c:195:         return 0;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L126	 ;
.L136:
 ; D:\TC\src\create.c:208:     expression_ptr->right = right;
	movq	%rdi, 16(%rax)	 ; right, expression_24->right
 ; D:\TC\src\create.c:209:     return expression;
	jmp	.L126	 ;
.L146:
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC14(%rip), %rdi	 ;, iftmp.0_11
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC13(%rip), %rbx	 ;, iftmp.1_4
	jmp	.L131	 ;
.L126:
 ; D:\TC\src\create.c:210: }
	addq	$64, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC17:
	.ascii "Error creating primary: value is NULL\12\0"
.LC18:
	.ascii "Error creating primary: unknown type %d\12\0"
	.text
	.globl	create_primary
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.seh_proc	create_primary
create_primary:
	pushq	%r12	 ;
	.seh_pushreg	%r12
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$32, %rsp	 ;,
	.seh_stackalloc	32
	.seh_endprologue
 ; D:\TC\src\create.c:212: Primary* create_primary(PrimaryType type, string str_value, Expression* expr_value, Primary* prim_value, VariableAccess* variable_value) {
	movq	112(%rsp), %rbp	 ; variable_value, variable_value
	movl	%ecx, %ebx	 ; tmp137, type
 ; D:\TC\src\create.c:213:     Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
	movl	$16, %ecx	 ;,
 ; D:\TC\src\create.c:212: Primary* create_primary(PrimaryType type, string str_value, Expression* expr_value, Primary* prim_value, VariableAccess* variable_value) {
	movq	%rdx, %rdi	 ; tmp138, str_value
	movq	%r8, %rsi	 ; tmp139, expr_value
	movq	%r9, %r12	 ; tmp140, prim_value
 ; D:\TC\src\create.c:213:     Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
	call	alloc_memory	 ;
 ; D:\TC\src\create.c:215:     primary_ptr->type = type;
	movl	%ebx, 8(%rax)	 ; type, primary_27->type
 ; D:\TC\src\create.c:216:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != 0)
	cmpl	$4, %ebx	 ;, type
	ja	.L148	 ;,
	testq	%rdi, %rdi	 ; str_value
	je	.L148	 ;,
 ; D:\TC\src\create.c:217:         primary_ptr->value.literal_value = str_value;
	movq	%rdi, (%rax)	 ; str_value, primary_27->value.literal_value
	jmp	.L147	 ;
.L148:
 ; D:\TC\src\create.c:218:     else if (type == PRIM_EXPRESSION && expr_value != 0)
	cmpl	$5, %ebx	 ;, type
	jne	.L150	 ;,
	testq	%rsi, %rsi	 ; expr_value
	je	.L150	 ;,
 ; D:\TC\src\create.c:219:         primary_ptr->value.expr = expr_value;
	movq	%rsi, (%rax)	 ; expr_value, primary_27->value.expr
	jmp	.L147	 ;
.L150:
 ; D:\TC\src\create.c:220:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != 0)
	leal	-6(%rbx), %edx	 ;, tmp120
 ; D:\TC\src\create.c:220:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != 0)
	cmpl	$1, %edx	 ;, tmp120
	ja	.L152	 ;,
	testq	%r12, %r12	 ; prim_value
	je	.L152	 ;,
 ; D:\TC\src\create.c:221:         primary_ptr->value.operand = prim_value;
	movq	%r12, (%rax)	 ; prim_value, primary_27->value.operand
	jmp	.L147	 ;
.L152:
 ; D:\TC\src\create.c:222:     else if (type == PRIM_VARIABLE_ACCESS && variable_value != 0)
	cmpl	$8, %ebx	 ;, type
	jne	.L153	 ;,
	testq	%rbp, %rbp	 ; variable_value
	je	.L153	 ;,
 ; D:\TC\src\create.c:223:         primary_ptr->value.var = variable_value;
	movq	%rbp, (%rax)	 ; variable_value, primary_27->value.var
	jmp	.L147	 ;
.L153:
 ; D:\TC\src\create.c:225:         if (str_value == 0 && expr_value == 0 && prim_value == 0 && variable_value == 0)
	orq	%r12, %rbp	 ; prim_value, tmp129
	orq	%rbp, %rsi	 ; tmp129, tmp130
	orq	%rdi, %rsi	 ; str_value, tmp144
	jne	.L154	 ;,
 ; D:\TC\src\create.c:226:             fprintf(stderr, "Error creating primary: value is NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:226:             fprintf(stderr, "Error creating primary: value is NULL\n");
	leaq	.LC17(%rip), %rcx	 ;, tmp133
	movq	24(%rax), %rdx	 ; _17->_stderr, _17->_stderr
	call	fputs	 ;
 ; D:\TC\src\create.c:226:             fprintf(stderr, "Error creating primary: value is NULL\n");
	jmp	.L155	 ;
.L154:
 ; D:\TC\src\create.c:228:             fprintf(stderr, "Error creating primary: unknown type %d\n", type);
	call	__getreent	 ;
 ; D:\TC\src\create.c:228:             fprintf(stderr, "Error creating primary: unknown type %d\n", type);
	movl	%ebx, %r8d	 ; type,
	leaq	.LC18(%rip), %rdx	 ;, tmp135
	movq	24(%rax), %rcx	 ; _19->_stderr, _19->_stderr
	call	fprintf	 ;
.L155:
 ; D:\TC\src\create.c:229:         return 0;
	xorl	%eax, %eax	 ; <retval>
.L147:
 ; D:\TC\src\create.c:232: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC19:
	.ascii "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\12\0"
.LC20:
	.ascii "Error creating variable access: content is NULL\12\0"
.LC21:
	.ascii "Error creating variable access: unknown type %d\12\0"
	.text
	.globl	create_variable_access
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
	.seh_proc	create_variable_access
create_variable_access:
	pushq	%r13	 ;
	.seh_pushreg	%r13
	pushq	%r12	 ;
	.seh_pushreg	%r12
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$56, %rsp	 ;,
	.seh_stackalloc	56
	.seh_endprologue
 ; D:\TC\src\create.c:234: VariableAccess* create_variable_access(VariableAccessType type, VariableAccess* base, Name* name_content, Expression* expr_content, list(Expression*) args_content) {
	movq	144(%rsp), %r12	 ; args_content, args_content
 ; D:\TC\src\create.c:235:     if ((base == 0) != (type == VAR_NAME)) {
	testl	%ecx, %ecx	 ; type
 ; D:\TC\src\create.c:234: VariableAccess* create_variable_access(VariableAccessType type, VariableAccess* base, Name* name_content, Expression* expr_content, list(Expression*) args_content) {
	movl	%ecx, %ebx	 ; tmp148, type
	movq	%rdx, %rbp	 ; tmp149, base
	movq	%r8, %rdi	 ; tmp150, name_content
 ; D:\TC\src\create.c:235:     if ((base == 0) != (type == VAR_NAME)) {
	sete	%al	 ;, tmp113
	testq	%rdx, %rdx	 ; base
 ; D:\TC\src\create.c:234: VariableAccess* create_variable_access(VariableAccessType type, VariableAccess* base, Name* name_content, Expression* expr_content, list(Expression*) args_content) {
	movq	%r9, %rsi	 ; tmp151, expr_content
 ; D:\TC\src\create.c:235:     if ((base == 0) != (type == VAR_NAME)) {
	sete	%r13b	 ;, tmp115
 ; D:\TC\src\create.c:235:     if ((base == 0) != (type == VAR_NAME)) {
	cmpb	%al, %r13b	 ; tmp113, tmp115
	je	.L181	 ;,
 ; D:\TC\src\create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	leaq	.LC13(%rip), %rax	 ;, tmp141
	testl	%ecx, %ecx	 ; type
	leaq	.LC14(%rip), %r8	 ;, tmp140
	movq	%rax, %r9	 ; tmp141, iftmp.4_23
	cmovne	%r8, %r9	 ; tmp140,, iftmp.4_23
 ; D:\TC\src\create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	testq	%rdx, %rdx	 ; base
	cmove	%rax, %r8	 ; tmp140,, tmp141, iftmp.5_24
 ; D:\TC\src\create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movq	%r9, 40(%rsp)	 ; iftmp.4_23, %sfp
 ; D:\TC\src\create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movq	%r8, 32(%rsp)	 ; iftmp.5_24, %sfp
 ; D:\TC\src\create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	call	__getreent	 ;
 ; D:\TC\src\create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movq	40(%rsp), %r9	 ; %sfp, iftmp.4_23
	movq	32(%rsp), %r8	 ; %sfp, iftmp.5_24
	leaq	.LC19(%rip), %rdx	 ;, tmp117
	movq	24(%rax), %rcx	 ; _4->_stderr, _4->_stderr
	call	fprintf	 ;
 ; D:\TC\src\create.c:237:         return 0;
	jmp	.L184	 ;
.L181:
 ; D:\TC\src\create.c:239:     VariableAccess* variable_access = (VariableAccess*)alloc_memory(sizeof(VariableAccess));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\create.c:243:     if (type == VAR_NAME && name_content != 0)
	testq	%rdi, %rdi	 ; name_content
 ; D:\TC\src\create.c:241:     variable_access_ptr->type = type;
	movl	%ebx, 16(%rax)	 ; type, variable_access_33->type
 ; D:\TC\src\create.c:243:     if (type == VAR_NAME && name_content != 0)
	setne	%dl	 ;, tmp118
 ; D:\TC\src\create.c:242:     variable_access_ptr->base = base;
	movq	%rbp, (%rax)	 ; base, variable_access_33->base
 ; D:\TC\src\create.c:243:     if (type == VAR_NAME && name_content != 0)
	testb	%r13b, %r13b	 ; tmp115
	je	.L185	 ;,
	testb	%dl, %dl	 ; tmp118
	jne	.L218	 ;,
.L185:
 ; D:\TC\src\create.c:245:     else if (type == VAR_FUNC_CALL && args_content != 0)
	cmpl	$1, %ebx	 ;, type
	jne	.L187	 ;,
	testq	%r12, %r12	 ; args_content
	je	.L187	 ;,
 ; D:\TC\src\create.c:246:         variable_access_ptr->content.args = args_content;
	movq	%r12, 8(%rax)	 ; args_content, variable_access_33->content.args
	jmp	.L180	 ;
.L187:
 ; D:\TC\src\create.c:247:     else if (type == VAR_GET_SEQ && expr_content != 0)
	cmpl	$3, %ebx	 ;, type
	jne	.L189	 ;,
	testq	%rsi, %rsi	 ; expr_content
	je	.L189	 ;,
 ; D:\TC\src\create.c:248:         variable_access_ptr->content.index = expr_content;
	movq	%rsi, 8(%rax)	 ; expr_content, variable_access_33->content.index
	jmp	.L180	 ;
.L189:
 ; D:\TC\src\create.c:249:     else if (type == VAR_GET_ATTR && name_content != 0)
	cmpl	$2, %ebx	 ;, type
	jne	.L190	 ;,
	testb	%dl, %dl	 ; tmp118
	je	.L190	 ;,
.L218:
 ; D:\TC\src\create.c:250:         variable_access_ptr->content.attr_name = name_content;
	movq	%rdi, 8(%rax)	 ; name_content,
	jmp	.L180	 ;
.L190:
 ; D:\TC\src\create.c:252:         if (name_content == 0 && expr_content == 0 && args_content == 0)
	orq	%r12, %rsi	 ; args_content, tmp129
	orq	%rsi, %rdi	 ; tmp129, tmp156
	jne	.L191	 ;,
 ; D:\TC\src\create.c:253:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:253:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	leaq	.LC20(%rip), %rcx	 ;, tmp132
	movq	24(%rax), %rdx	 ; _19->_stderr, _19->_stderr
	call	fputs	 ;
 ; D:\TC\src\create.c:253:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	jmp	.L184	 ;
.L191:
 ; D:\TC\src\create.c:255:             fprintf(stderr, "Error creating variable access: unknown type %d\n", type);
	call	__getreent	 ;
 ; D:\TC\src\create.c:255:             fprintf(stderr, "Error creating variable access: unknown type %d\n", type);
	movl	%ebx, %r8d	 ; type,
	leaq	.LC21(%rip), %rdx	 ;, tmp134
	movq	24(%rax), %rcx	 ; _21->_stderr, _21->_stderr
	call	fprintf	 ;
.L184:
 ; D:\TC\src\create.c:237:         return 0;
	xorl	%eax, %eax	 ; <retval>
.L180:
 ; D:\TC\src\create.c:259: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	ret	
	.seh_endproc
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
