	.file	"create.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Error creating code member: content is NULL\n"
.LC1:
	.string	"Error creating code member: unknown type %u\n"
	.text
	.globl	create_code_member
	.type	create_code_member, @function
create_code_member:
	pushq	%r13	;
	movq	%rdx, %r13	; tmp121, function_content
	pushq	%r12	;
	movq	%rsi, %r12	; tmp120, import_content
	pushq	%rbp	;
	movq	%rcx, %rbp	; tmp122, class_content
	pushq	%rbx	;
	movl	%edi, %ebx	; tmp119, type
; src/create.c:4:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	movl	$16, %edi	;,
; src/create.c:3: CodeMember* create_code_member(CodeMemberType type, Import* import_content, Function* function_content, Class* class_content) {
	pushq	%r8	;
; src/create.c:4:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:5:     code_member->type = type;
	movl	%ebx, 8(%rax)	; type, code_member_21->type
; src/create.c:6:     if (type == CODE_IMPORT && import_content != NULL)
	testl	%ebx, %ebx	; type
	jne	.L2	;,
	testq	%r12, %r12	; import_content
	je	.L2	;,
; src/create.c:7:         code_member->content.import = import_content;
	movq	%r12, (%rax)	; import_content, code_member_21->content.import
	jmp	.L1	;
.L2:
; src/create.c:8:     else if (type == CODE_FUNCTION && function_content != NULL)
	cmpl	$1, %ebx	;, type
	jne	.L4	;,
	testq	%r13, %r13	; function_content
	je	.L4	;,
; src/create.c:9:         code_member->content.function = function_content;
	movq	%r13, (%rax)	; function_content, code_member_21->content.function
	jmp	.L1	;
.L4:
; src/create.c:10:     else if (type == CODE_CLASS && class_content != NULL)
	cmpl	$2, %ebx	;, type
	jne	.L6	;,
	testq	%rbp, %rbp	; class_content
	je	.L6	;,
; src/create.c:11:         code_member->content.class = class_content;
	movq	%rbp, (%rax)	; class_content, code_member_21->content.class
	jmp	.L1	;
.L6:
; src/create.c:13:         if (import_content == NULL && function_content == NULL && class_content == NULL)
	orq	%r13, %rbp	; function_content, tmp114
; src/create.c:14:             fprintf(stderr, "Error creating code member: content is NULL\n");
	movq	stderr(%rip), %rdi	; stderr, pretmp_16
; src/create.c:13:         if (import_content == NULL && function_content == NULL && class_content == NULL)
	orq	%rbp, %r12	; tmp114, tmp124
	jne	.L7	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, %rsi	; pretmp_16,
	leaq	.LC0(%rip), %rdi	;, tmp116
	call	*fputs@GOTPCREL(%rip)	;
	jmp	.L8	;
.L7:
	movl	%ebx, %ecx	; type,
	leaq	.LC1(%rip), %rdx	;, tmp117
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L8:
; src/create.c:17:         return NULL;
	xorl	%eax, %eax	; <retval>
.L1:
; src/create.c:20: }
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	create_code_member, .-create_code_member
	.globl	create_code
	.type	create_code, @function
create_code:
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp86, members
; src/create.c:23:     Code* code = (Code*)alloc_memory(sizeof(Code));
	movl	$16, %edi	;,
; src/create.c:22: Code* create_code(list(CodeMember*) members, SymbolTable* global_scope) {
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp87, global_scope
	pushq	%rax	;
; src/create.c:23:     Code* code = (Code*)alloc_memory(sizeof(Code));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:24:     code->members = members;
	movq	%rbp, (%rax)	; members, code_3->members
; src/create.c:25:     code->global_scope = global_scope;
	movq	%rbx, 8(%rax)	; global_scope, code_3->global_scope
; src/create.c:27: }
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	create_code, .-create_code
	.section	.rodata.str1.1
.LC2:
	.string	"Error creating import: name is NULL\n"
	.text
	.globl	create_import
	.type	create_import, @function
create_import:
	pushq	%rbp	;
	pushq	%rbx	;
	pushq	%rcx	;
; src/create.c:30:     if (name == NULL) {
	testq	%rdi, %rdi	; name
	jne	.L32	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC2(%rip), %rdi	;, tmp87
	call	*fputs@GOTPCREL(%rip)	;
; src/create.c:32:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L31	;
.L32:
	movq	%rdi, %rbx	; tmp89, name
	movq	%rsi, %rbp	; tmp90, source
; src/create.c:34:     Import* import = (Import*)alloc_memory(sizeof(Import));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:35:     import->name = name;
	movq	%rbx, (%rax)	; name, import_7->name
; src/create.c:36:     import->source = source;
	movq	%rbp, 8(%rax)	; source, import_7->source
.L31:
; src/create.c:38: }
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	create_import, .-create_import
	.section	.rodata.str1.1
.LC3:
	.string	"Error creating function: name or return_type is NULL\n"
	.text
	.globl	create_function_use_ptr
	.type	create_function_use_ptr, @function
create_function_use_ptr:
; src/create.c:41:     if (name == NULL || return_type == NULL) {
	testq	%rsi, %rsi	; name
	je	.L39	;,
	testq	%rdx, %rdx	; return_type
	jne	.L36	;,
.L39:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC3(%rip), %rdi	;, tmp98
; src/create.c:40: Function* create_function_use_ptr(Function* function, Symbol* name, Symbol* return_type, list(Variable*) parameters, list(Statement*) body, SymbolTable* function_scope) {
	pushq	%rax	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	call	*fputs@GOTPCREL(%rip)	;
	xorl	%eax, %eax	; function
; src/create.c:51: }
	popq	%rdx	;
	ret	
.L36:
; src/create.c:45:     function->name = name;
	movq	%rsi, (%rdi)	; name, function_8(D)->name
	movq	%rdi, %rax	; tmp100, function
; src/create.c:46:     function->return_type = return_type;
	movq	%rdx, 8(%rdi)	; return_type, function_8(D)->return_type
; src/create.c:47:     function->parameters = parameters;
	movq	%rcx, 16(%rdi)	; parameters, function_8(D)->parameters
; src/create.c:48:     function->body = body;
	movq	%r8, 24(%rdi)	; body, function_8(D)->body
; src/create.c:49:     function->function_scope = function_scope;
	movq	%r9, 32(%rdi)	; function_scope, function_8(D)->function_scope
; src/create.c:51: }
	ret	
	.size	create_function_use_ptr, .-create_function_use_ptr
	.globl	create_function
	.type	create_function, @function
create_function:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$24, %rsp	;,
; src/create.c:53:     if (name == NULL || return_type == NULL) {
	testq	%rdi, %rdi	; name
	je	.L47	;,
	movq	%rsi, %rbp	; tmp101, return_type
	testq	%rsi, %rsi	; return_type
	je	.L47	;,
	movq	%rdx, %r12	; tmp102, parameters
	movq	%rcx, %r13	; tmp103, body
	movq	%r8, 8(%rsp)	; function_scope, %sfp
	movq	%rdi, %rbx	; tmp100, name
; src/create.c:57:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:58:     return create_function_use_ptr(function, name, return_type, parameters, body, function_scope);
	movq	8(%rsp), %r9	; %sfp, function_scope
	movq	%r13, %r8	; body,
	movq	%r12, %rcx	; parameters,
; src/create.c:59: }
	addq	$24, %rsp	;,
; src/create.c:58:     return create_function_use_ptr(function, name, return_type, parameters, body, function_scope);
	movq	%rbp, %rdx	; return_type,
	movq	%rbx, %rsi	; name,
; src/create.c:57:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movq	%rax, %rdi	; tmp105, function
; src/create.c:59: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; src/create.c:58:     return create_function_use_ptr(function, name, return_type, parameters, body, function_scope);
	jmp	create_function_use_ptr	;
.L47:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC3(%rip), %rdi	;, tmp98
	call	*fputs@GOTPCREL(%rip)	;
; src/create.c:59: }
	addq	$24, %rsp	;,
	xorl	%eax, %eax	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	create_function, .-create_function
	.section	.rodata.str1.1
.LC4:
	.string	"Error creating method: name or return_type is NULL\n"
	.text
	.globl	create_method_use_ptr
	.type	create_method_use_ptr, @function
create_method_use_ptr:
; src/create.c:62:     if (name == NULL || return_type == NULL) {
	testq	%rsi, %rsi	; name
	je	.L54	;,
	testq	%rdx, %rdx	; return_type
	jne	.L51	;,
.L54:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC4(%rip), %rdi	;, tmp98
; src/create.c:61: Method* create_method_use_ptr(Method* method, Symbol* name, Symbol* return_type, list(Variable*) parameters, list(Statement*) body, SymbolTable* method_scope) {
	pushq	%rax	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	call	*fputs@GOTPCREL(%rip)	;
	xorl	%eax, %eax	; method
; src/create.c:72: }
	popq	%rdx	;
	ret	
.L51:
; src/create.c:66:     method->name = name;
	movq	%rsi, (%rdi)	; name, method_8(D)->name
	movq	%rdi, %rax	; tmp100, method
; src/create.c:67:     method->return_type = return_type;
	movq	%rdx, 8(%rdi)	; return_type, method_8(D)->return_type
; src/create.c:68:     method->parameters = parameters;
	movq	%rcx, 16(%rdi)	; parameters, method_8(D)->parameters
; src/create.c:69:     method->body = body;
	movq	%r8, 24(%rdi)	; body, method_8(D)->body
; src/create.c:70:     method->method_scope = method_scope;
	movq	%r9, 32(%rdi)	; method_scope, method_8(D)->method_scope
; src/create.c:72: }
	ret	
	.size	create_method_use_ptr, .-create_method_use_ptr
	.globl	create_method
	.type	create_method, @function
create_method:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$24, %rsp	;,
; src/create.c:74:     if (name == NULL || return_type == NULL) {
	testq	%rdi, %rdi	; name
	je	.L62	;,
	movq	%rsi, %rbp	; tmp101, return_type
	testq	%rsi, %rsi	; return_type
	je	.L62	;,
	movq	%rdx, %r12	; tmp102, parameters
	movq	%rcx, %r13	; tmp103, body
	movq	%r8, 8(%rsp)	; method_scope, %sfp
	movq	%rdi, %rbx	; tmp100, name
; src/create.c:78:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:79:     return create_method_use_ptr(method, name, return_type, parameters, body, method_scope);
	movq	8(%rsp), %r9	; %sfp, method_scope
	movq	%r13, %r8	; body,
	movq	%r12, %rcx	; parameters,
; src/create.c:80: }
	addq	$24, %rsp	;,
; src/create.c:79:     return create_method_use_ptr(method, name, return_type, parameters, body, method_scope);
	movq	%rbp, %rdx	; return_type,
	movq	%rbx, %rsi	; name,
; src/create.c:78:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movq	%rax, %rdi	; tmp105, method
; src/create.c:80: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; src/create.c:79:     return create_method_use_ptr(method, name, return_type, parameters, body, method_scope);
	jmp	create_method_use_ptr	;
.L62:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC4(%rip), %rdi	;, tmp98
	call	*fputs@GOTPCREL(%rip)	;
; src/create.c:80: }
	addq	$24, %rsp	;,
	xorl	%eax, %eax	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	create_method, .-create_method
	.section	.rodata.str1.1
.LC5:
	.string	"Error creating class member: content is NULL\n"
.LC6:
	.string	"Error creating class member: unknown type %u\n"
	.text
	.globl	create_class_member
	.type	create_class_member, @function
create_class_member:
	pushq	%r12	;
	movq	%rdx, %r12	; tmp110, variable_content
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp109, method_content
	pushq	%rbx	;
; src/create.c:82: ClassMember* create_class_member(ClassMemberType type, Method* method_content, Variable* variable_content) {
	movl	%edi, %ebx	; tmp108, type
; src/create.c:83:     ClassMember* class_member = (ClassMember*)alloc_memory(sizeof(ClassMember));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:84:     class_member->type = type;
	movl	%ebx, 8(%rax)	; type, class_member_18->type
; src/create.c:85:     if (type == CLASS_METHOD && method_content != NULL)
	testl	%ebx, %ebx	; type
	jne	.L66	;,
	testq	%rbp, %rbp	; method_content
	je	.L66	;,
; src/create.c:86:         class_member->content.method = method_content;
	movq	%rbp, (%rax)	; method_content, class_member_18->content.method
	jmp	.L65	;
.L66:
; src/create.c:87:     else if (type == CLASS_VARIABLE && variable_content != NULL)
	cmpl	$1, %ebx	;, type
	jne	.L68	;,
	testq	%r12, %r12	; variable_content
	je	.L68	;,
; src/create.c:88:         class_member->content.variable = variable_content;
	movq	%r12, (%rax)	; variable_content, class_member_18->content.variable
	jmp	.L65	;
.L68:
; src/create.c:90:         if (method_content == NULL && variable_content == NULL)
	orq	%r12, %rbp	; variable_content, tmp112
; src/create.c:91:             fprintf(stderr, "Error creating class member: content is NULL\n");
	movq	stderr(%rip), %rdi	; stderr, pretmp_9
; src/create.c:90:         if (method_content == NULL && variable_content == NULL)
	jne	.L70	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, %rsi	; pretmp_9,
	leaq	.LC5(%rip), %rdi	;, tmp105
	call	*fputs@GOTPCREL(%rip)	;
	jmp	.L71	;
.L70:
	movl	%ebx, %ecx	; type,
	leaq	.LC6(%rip), %rdx	;, tmp106
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L71:
; src/create.c:94:         return NULL;
	xorl	%eax, %eax	; <retval>
.L65:
; src/create.c:97: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	create_class_member, .-create_class_member
	.section	.rodata.str1.1
.LC7:
	.string	"Error creating class: name is NULL\n"
	.text
	.globl	create_class_use_ptr
	.type	create_class_use_ptr, @function
create_class_use_ptr:
	pushq	%rbx	;
; src/create.c:99: Class* create_class_use_ptr(Class* class, Symbol* name, list(ClassMember*) members, SymbolTable* class_scope, size_t size) {
	movq	%rsi, %rbx	; tmp93, name
; src/create.c:100:     if (name == NULL) {
	testq	%rsi, %rsi	; name
	jne	.L86	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC7(%rip), %rdi	;, tmp90
	call	*fputs@GOTPCREL(%rip)	;
	jmp	.L87	;
.L86:
; src/create.c:104:     class->name = name;
	movq	%rsi, (%rdi)	; name, class_4(D)->name
; src/create.c:108:     return class;
	movq	%rdi, %rbx	; class, name
; src/create.c:105:     class->members = members;
	movq	%rdx, 8(%rdi)	; members, class_4(D)->members
; src/create.c:106:     class->class_scope = class_scope;
	movq	%rcx, 16(%rdi)	; class_scope, class_4(D)->class_scope
; src/create.c:107:     class->size = size;
	movq	%r8, 24(%rdi)	; size, class_4(D)->size
.L87:
; src/create.c:109: }
	movq	%rbx, %rax	; name,
	popq	%rbx	;
	ret	
	.size	create_class_use_ptr, .-create_class_use_ptr
	.globl	create_class
	.type	create_class, @function
create_class:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	pushq	%r8	;
; src/create.c:111:     if (name == NULL) {
	testq	%rdi, %rdi	; name
	jne	.L90	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC7(%rip), %rdi	;, tmp89
	call	*fputs@GOTPCREL(%rip)	;
; src/create.c:113:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L89	;
.L90:
	movq	%rdi, %rbx	; tmp91, name
	movq	%rsi, %r13	; tmp92, members
	movq	%rdx, %r12	; tmp93, class_scope
	movq	%rcx, %rbp	; tmp94, size
; src/create.c:115:     Class* class = (Class*)alloc_memory(sizeof(Class));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:104:     class->name = name;
	movq	%rbx, (%rax)	; name, class_7->name
; src/create.c:105:     class->members = members;
	movq	%r13, 8(%rax)	; members, class_7->members
; src/create.c:106:     class->class_scope = class_scope;
	movq	%r12, 16(%rax)	; class_scope, class_7->class_scope
; src/create.c:107:     class->size = size;
	movq	%rbp, 24(%rax)	; size, class_7->size
.L89:
; src/create.c:117: }
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	create_class, .-create_class
	.section	.rodata.str1.1
.LC8:
	.string	"Error creating variable: type or name is NULL\n"
	.text
	.globl	create_variable
	.type	create_variable, @function
create_variable:
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
; src/create.c:120:     if (type == NULL || name == NULL) {
	testq	%rdi, %rdi	; type
	je	.L97	;,
	movq	%rsi, %rbx	; tmp98, name
	testq	%rsi, %rsi	; name
	jne	.L94	;,
.L97:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC8(%rip), %rdi	;, tmp95
	call	*fputs@GOTPCREL(%rip)	;
; src/create.c:122:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L93	;
.L94:
	movq	%rdi, %rbp	; tmp97, type
	movq	%rdx, %r12	; tmp99, value
; src/create.c:124:     Variable* variable = (Variable*)alloc_memory(sizeof(Variable));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:125:     variable->type = type;
	movq	%rbp, (%rax)	; type, variable_11->type
; src/create.c:126:     variable->name = name;
	movq	%rbx, 8(%rax)	; name, variable_11->name
; src/create.c:127:     variable->value = value;
	movq	%r12, 16(%rax)	; value, variable_11->value
.L93:
; src/create.c:129: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	create_variable, .-create_variable
	.section	.rodata.str1.1
.LC9:
	.string	"Error creating statement: content is NULL\n"
.LC10:
	.string	"Error creating statement: unknown type %u\n"
	.text
	.globl	create_statement
	.type	create_statement, @function
create_statement:
	pushq	%r15	;
	movq	%rdx, %r15	; tmp145, while_stmt
	pushq	%r14	;
	movq	%r8, %r14	; tmp147, expr
	pushq	%r13	;
	movq	%rcx, %r13	; tmp146, for_stmt
	pushq	%r12	;
	movq	%rsi, %r12	; tmp144, if_stmt
	pushq	%rbp	;
	movq	%r9, %rbp	; tmp148, var_stmt
	pushq	%rbx	;
	movl	%edi, %ebx	; tmp143, type
; src/create.c:132:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	movl	$16, %edi	;,
; src/create.c:131: Statement* create_statement(StatementType type, If* if_stmt, While* while_stmt, For* for_stmt, Expression* expr, Variable* var_stmt) {
	pushq	%r10	;
; src/create.c:132:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:133:     statement->type = type;
	movl	%ebx, 8(%rax)	; type, statement_31->type
; src/create.c:134:     if (type == EXPRESSION_STATEMENT && expr != NULL)
	testl	%ebx, %ebx	; type
	jne	.L100	;,
	testq	%r14, %r14	; expr
	jne	.L142	;,
.L100:
; src/create.c:136:     else if (type == VARIABLE_STATEMENT && var_stmt != NULL)
	cmpl	$1, %ebx	;, type
	jne	.L102	;,
	testq	%rbp, %rbp	; var_stmt
	je	.L102	;,
; src/create.c:137:         statement->stmt.var = var_stmt;
	movq	%rbp, (%rax)	; var_stmt, statement_31->stmt.var
	jmp	.L99	;
.L102:
; src/create.c:138:     else if (type == IF_STATEMENT && if_stmt != NULL)
	cmpl	$2, %ebx	;, type
	jne	.L104	;,
	testq	%r12, %r12	; if_stmt
	je	.L104	;,
; src/create.c:139:         statement->stmt.if_stmt = if_stmt;
	movq	%r12, (%rax)	; if_stmt, statement_31->stmt.if_stmt
	jmp	.L99	;
.L104:
; src/create.c:140:     else if (type == WHILE_STATEMENT && while_stmt != NULL)
	cmpl	$3, %ebx	;, type
	jne	.L105	;,
	testq	%r15, %r15	; while_stmt
	je	.L105	;,
; src/create.c:141:         statement->stmt.while_stmt = while_stmt;
	movq	%r15, (%rax)	; while_stmt, statement_31->stmt.while_stmt
	jmp	.L99	;
.L105:
; src/create.c:142:     else if (type == FOR_STATEMENT && for_stmt != NULL)
	cmpl	$4, %ebx	;, type
	jne	.L106	;,
	testq	%r13, %r13	; for_stmt
	je	.L106	;,
; src/create.c:143:         statement->stmt.for_stmt = for_stmt;
	movq	%r13, (%rax)	; for_stmt, statement_31->stmt.for_stmt
	jmp	.L99	;
.L106:
; src/create.c:144:     else if (type == RETURN_STATEMENT)
	cmpl	$5, %ebx	;, type
	jne	.L107	;,
.L142:
; src/create.c:145:         statement->stmt.return_expr = expr;
	movq	%r14, (%rax)	; expr,* <retval>
	jmp	.L99	;
.L107:
; src/create.c:146:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	leal	-6(%rbx), %edx	;, tmp135
; src/create.c:146:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	cmpl	$1, %edx	;, tmp135
	ja	.L108	;,
; src/create.c:147:         statement->stmt.expr = NULL;
	xorl	%ecx, %ecx	;
	movq	%rcx, (%rax)	;, statement_31->stmt.expr
	jmp	.L99	;
.L108:
; src/create.c:149:         if (if_stmt == NULL && while_stmt == NULL && for_stmt == NULL && expr == NULL && var_stmt == NULL)
	orq	%r15, %r13	; while_stmt, tmp136
; src/create.c:150:             fprintf(stderr, "Error creating statement: content is NULL\n");
	movq	stderr(%rip), %rdi	; stderr, pretmp_61
; src/create.c:149:         if (if_stmt == NULL && while_stmt == NULL && for_stmt == NULL && expr == NULL && var_stmt == NULL)
	orq	%r13, %r12	; tmp136, tmp137
	orq	%r12, %rbp	; tmp137, tmp138
	orq	%r14, %rbp	; expr, tmp150
	jne	.L109	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, %rsi	; pretmp_61,
	leaq	.LC9(%rip), %rdi	;, tmp140
	call	*fputs@GOTPCREL(%rip)	;
	jmp	.L110	;
.L109:
	movl	%ebx, %ecx	; type,
	leaq	.LC10(%rip), %rdx	;, tmp141
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L110:
; src/create.c:153:         return NULL;
	xorl	%eax, %eax	; <retval>
.L99:
; src/create.c:156: }
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	create_statement, .-create_statement
	.section	.rodata.str1.1
.LC11:
	.string	"Error creating if statement: condition is NULL\n"
	.text
	.globl	create_if
	.type	create_if, @function
create_if:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	pushq	%r8	;
; src/create.c:159:     if (condition == NULL) {
	testq	%rdi, %rdi	; condition
	jne	.L144	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC11(%rip), %rdi	;, tmp89
	call	*fputs@GOTPCREL(%rip)	;
; src/create.c:161:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L143	;
.L144:
	movq	%rdi, %rbx	; tmp91, condition
	movq	%rsi, %r13	; tmp92, body
	movq	%rdx, %r12	; tmp93, else_if
	movq	%rcx, %rbp	; tmp94, else_body
; src/create.c:163:     If* if_ = (If*)alloc_memory(sizeof(If));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:164:     if_->condition = condition;
	movq	%rbx, (%rax)	; condition, if__7->condition
; src/create.c:165:     if_->body = body;
	movq	%r13, 8(%rax)	; body, if__7->body
; src/create.c:166:     if_->else_if = else_if;
	movq	%r12, 16(%rax)	; else_if, if__7->else_if
; src/create.c:167:     if_->else_body = else_body;
	movq	%rbp, 24(%rax)	; else_body, if__7->else_body
.L143:
; src/create.c:169: }
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	create_if, .-create_if
	.section	.rodata.str1.1
.LC12:
	.string	"Error creating else-if statement: condition is NULL\n"
	.text
	.globl	create_else_if
	.type	create_else_if, @function
create_else_if:
	pushq	%rbp	;
	pushq	%rbx	;
	pushq	%rcx	;
; src/create.c:172:     if (condition == NULL) {
	testq	%rdi, %rdi	; condition
	jne	.L148	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC12(%rip), %rdi	;, tmp87
	call	*fputs@GOTPCREL(%rip)	;
; src/create.c:174:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L147	;
.L148:
	movq	%rdi, %rbx	; tmp89, condition
	movq	%rsi, %rbp	; tmp90, body
; src/create.c:176:     ElseIf* else_if = (ElseIf*)alloc_memory(sizeof(ElseIf));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:177:     else_if->condition = condition;
	movq	%rbx, (%rax)	; condition, else_if_7->condition
; src/create.c:178:     else_if->body = body;
	movq	%rbp, 8(%rax)	; body, else_if_7->body
.L147:
; src/create.c:180: }
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	create_else_if, .-create_else_if
	.globl	create_for
	.type	create_for, @function
create_for:
	pushq	%r13	;
	movq	%rdi, %r13	; tmp88, initializer
; src/create.c:183:     For* for_ = (For*)alloc_memory(sizeof(For));
	movl	$32, %edi	;,
; src/create.c:182: For* create_for(Variable* initializer, Expression* condition, Expression* increment, list(Statement*) body) {
	pushq	%r12	;
	movq	%rsi, %r12	; tmp89, condition
	pushq	%rbp	;
	movq	%rdx, %rbp	; tmp90, increment
	pushq	%rbx	;
	movq	%rcx, %rbx	; tmp91, body
	pushq	%rax	;
; src/create.c:183:     For* for_ = (For*)alloc_memory(sizeof(For));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:184:     for_->initializer = initializer;
	movq	%r13, (%rax)	; initializer, for__3->initializer
; src/create.c:185:     for_->condition = condition;
	movq	%r12, 8(%rax)	; condition, for__3->condition
; src/create.c:186:     for_->increment = increment;
	movq	%rbp, 16(%rax)	; increment, for__3->increment
; src/create.c:187:     for_->body = body;
	movq	%rbx, 24(%rax)	; body, for__3->body
; src/create.c:189: }
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	create_for, .-create_for
	.globl	create_while
	.type	create_while, @function
create_while:
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp86, condition
; src/create.c:192:     While* while_ = (While*)alloc_memory(sizeof(While));
	movl	$16, %edi	;,
; src/create.c:191: While* create_while(Expression* condition, list(Statement*) body) {
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp87, body
	pushq	%rax	;
; src/create.c:192:     While* while_ = (While*)alloc_memory(sizeof(While));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:193:     while_->condition = condition;
	movq	%rbp, (%rax)	; condition, while__3->condition
; src/create.c:194:     while_->body = body;
	movq	%rbx, 8(%rax)	; body, while__3->body
; src/create.c:196: }
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	create_while, .-create_while
	.section	.rodata.str1.1
.LC13:
	.string	"true"
.LC14:
	.string	"false"
.LC15:
	.string	"Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n"
.LC16:
	.string	"Error creating expression: both expr_left and prim_left are NULL\n"
	.text
	.globl	create_expression
	.type	create_expression, @function
create_expression:
; src/create.c:199:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	cmpl	$19, %edi	;, operator
; src/create.c:198: Expression* create_expression(OperatorType operator, Expression* expr_left, Primary* prim_left, Expression* right) {
	pushq	%r13	;
	movl	%edi, %r13d	; tmp133, operator
	pushq	%r12	;
	movq	%rdx, %r12	; tmp135, prim_left
; src/create.c:199:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	sete	%dl	;, tmp99
	testq	%rcx, %rcx	; right
	sete	%al	;, tmp101
; src/create.c:198: Expression* create_expression(OperatorType operator, Expression* expr_left, Primary* prim_left, Expression* right) {
	pushq	%rbp	;
	movq	%rcx, %rbp	; tmp136, right
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp134, expr_left
	pushq	%r9	;
; src/create.c:199:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	cmpb	%al, %dl	; tmp101, tmp99
	jne	.L156	;,
; src/create.c:199:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	movq	%r12, %rax	; prim_left, tmp138
	orq	%rsi, %rax	; expr_left, tmp138
	jne	.L173	;,
	jmp	.L175	;
.L156:
; src/create.c:200:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC14(%rip), %r9	;, tmp114
	leaq	.LC13(%rip), %rdx	;, tmp113
	testq	%rcx, %rcx	; right
	movq	%r9, %rax	; tmp114, iftmp.16_9
	cmove	%rdx, %rax	; tmp113,, iftmp.16_9
; src/create.c:200:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%r12, %r12	; prim_left
	cmove	%rdx, %r9	; tmp114,, tmp113, iftmp.17_4
.L160:
; src/create.c:200:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%rbx, %rbx	; expr_left
	leaq	.LC14(%rip), %r8	;, tmp119
	leaq	.LC13(%rip), %rdx	;, tmp120
	cmove	%rdx, %r8	; tmp119,, tmp120, iftmp.18_11
	jmp	.L161	;
.L175:
; src/create.c:200:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC14(%rip), %rax	;, iftmp.16_9
; src/create.c:200:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC13(%rip), %r9	;, iftmp.17_4
; src/create.c:200:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%rcx, %rcx	; right
	jne	.L160	;,
; src/create.c:200:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC13(%rip), %rax	;, iftmp.16_9
; src/create.c:200:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%rax, %r9	; iftmp.16_9, iftmp.17_4
; src/create.c:200:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%rax, %r8	; iftmp.16_9, iftmp.18_11
.L161:
; src/create.c:200:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	cmpl	$19, %r13d	;, operator
	leaq	.LC13(%rip), %rdx	;, tmp126
	leaq	.LC14(%rip), %rcx	;, tmp125
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
; src/create.c:200:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	cmove	%rdx, %rcx	; tmp125,, tmp126, iftmp.19_12
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC15(%rip), %rdx	;, tmp104
	pushq	%rsi	;
	movl	$2, %esi	;,
	pushq	%rax	; iftmp.16_9
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:205:         return NULL;
	popq	%rdi	;
	popq	%r8	;
	jmp	.L163	;
.L173:
; src/create.c:207:     Expression* expression = (Expression*)alloc_memory(sizeof(Expression));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:208:     expression->operator = operator;
	movl	%r13d, 24(%rax)	; operator, expression_22->operator
; src/create.c:209:     if (expr_left != NULL)
	testq	%rbx, %rbx	; expr_left
	je	.L164	;,
; src/create.c:210:         expression->expr_left = expr_left;
	movq	%rbx, (%rax)	; expr_left, expression_22->expr_left
	jmp	.L165	;
.L164:
; src/create.c:211:     else if (prim_left != NULL)
	testq	%r12, %r12	; prim_left
	je	.L166	;,
; src/create.c:212:         expression->prim_left = prim_left;
	movq	%r12, 8(%rax)	; prim_left, expression_22->prim_left
	jmp	.L165	;
.L166:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC16(%rip), %rdi	;, tmp106
	call	*fputs@GOTPCREL(%rip)	;
.L163:
; src/create.c:205:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L155	;
.L165:
; src/create.c:217:     expression->right = right;
	movq	%rbp, 16(%rax)	; right, expression_22->right
.L155:
; src/create.c:219: }
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	create_expression, .-create_expression
	.section	.rodata.str1.1
.LC17:
	.string	"Error creating primary: value is NULL\n"
.LC18:
	.string	"Error creating primary: unknown type %u\n"
	.text
	.globl	create_primary
	.type	create_primary, @function
create_primary:
	pushq	%r14	;
	movq	%rcx, %r14	; tmp135, prim_value
	pushq	%r13	;
	movq	%rsi, %r13	; tmp133, str_value
	pushq	%r12	;
	movq	%r8, %r12	; tmp136, variable_value
	pushq	%rbp	;
	movq	%rdx, %rbp	; tmp134, expr_value
	pushq	%rbx	;
; src/create.c:221: Primary* create_primary(PrimaryType type, string str_value, Expression* expr_value, Primary* prim_value, VariableAccess* variable_value) {
	movl	%edi, %ebx	; tmp132, type
; src/create.c:222:     Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:223:     primary->type = type;
	movl	%ebx, 8(%rax)	; type, primary_25->type
; src/create.c:224:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != NULL)
	cmpl	$4, %ebx	;, type
	ja	.L177	;,
	testq	%r13, %r13	; str_value
	je	.L177	;,
; src/create.c:225:         primary->value.literal_value = str_value;
	movq	%r13, (%rax)	; str_value, primary_25->value.literal_value
	jmp	.L176	;
.L177:
; src/create.c:226:     else if (type == PRIM_EXPRESSION && expr_value != NULL)
	cmpl	$5, %ebx	;, type
	jne	.L179	;,
	testq	%rbp, %rbp	; expr_value
	je	.L179	;,
; src/create.c:227:         primary->value.expr = expr_value;
	movq	%rbp, (%rax)	; expr_value, primary_25->value.expr
	jmp	.L176	;
.L179:
; src/create.c:228:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	leal	-6(%rbx), %edx	;, tmp117
; src/create.c:228:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	cmpl	$1, %edx	;, tmp117
	ja	.L181	;,
	testq	%r14, %r14	; prim_value
	je	.L181	;,
; src/create.c:229:         primary->value.operand = prim_value;
	movq	%r14, (%rax)	; prim_value, primary_25->value.operand
	jmp	.L176	;
.L181:
; src/create.c:230:     else if (type == PRIM_VARIABLE_ACCESS && variable_value != NULL)
	cmpl	$8, %ebx	;, type
	jne	.L182	;,
	testq	%r12, %r12	; variable_value
	je	.L182	;,
; src/create.c:231:         primary->value.var = variable_value;
	movq	%r12, (%rax)	; variable_value, primary_25->value.var
	jmp	.L176	;
.L182:
; src/create.c:233:         if (str_value == NULL && expr_value == NULL && prim_value == NULL && variable_value == NULL)
	orq	%r14, %r12	; prim_value, tmp126
; src/create.c:234:             fprintf(stderr, "Error creating primary: value is NULL\n");
	movq	stderr(%rip), %rdi	; stderr, pretmp_49
; src/create.c:233:         if (str_value == NULL && expr_value == NULL && prim_value == NULL && variable_value == NULL)
	orq	%r12, %rbp	; tmp126, tmp127
	orq	%r13, %rbp	; str_value, tmp138
	jne	.L183	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, %rsi	; pretmp_49,
	leaq	.LC17(%rip), %rdi	;, tmp129
	call	*fputs@GOTPCREL(%rip)	;
	jmp	.L184	;
.L183:
	movl	%ebx, %ecx	; type,
	leaq	.LC18(%rip), %rdx	;, tmp130
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L184:
; src/create.c:237:         return NULL;
	xorl	%eax, %eax	; <retval>
.L176:
; src/create.c:240: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	create_primary, .-create_primary
	.section	.rodata.str1.1
.LC19:
	.string	"Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n"
.LC20:
	.string	"Error creating variable access: content is NULL\n"
.LC21:
	.string	"Error creating variable access: unknown type %u\n"
	.text
	.globl	create_variable_access
	.type	create_variable_access, @function
create_variable_access:
; src/create.c:243:     if ((base == NULL) != (type == VAR_NAME)) {
	testl	%edi, %edi	; type
; src/create.c:242: VariableAccess* create_variable_access(VariableAccessType type, VariableAccess* base, Symbol* name_content, Expression* expr_content, list(Expression*) args_content) {
	pushq	%r15	;
; src/create.c:243:     if ((base == NULL) != (type == VAR_NAME)) {
	sete	%al	;, tmp109
	testq	%rsi, %rsi	; base
; src/create.c:242: VariableAccess* create_variable_access(VariableAccessType type, VariableAccess* base, Symbol* name_content, Expression* expr_content, list(Expression*) args_content) {
	pushq	%r14	;
	movq	%rsi, %r14	; tmp143, base
; src/create.c:243:     if ((base == NULL) != (type == VAR_NAME)) {
	sete	%r15b	;, tmp111
; src/create.c:242: VariableAccess* create_variable_access(VariableAccessType type, VariableAccess* base, Symbol* name_content, Expression* expr_content, list(Expression*) args_content) {
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movl	%edi, %ebx	; tmp142, type
	pushq	%r9	;
; src/create.c:243:     if ((base == NULL) != (type == VAR_NAME)) {
	cmpb	%al, %r15b	; tmp109, tmp111
	je	.L211	;,
; src/create.c:244:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	leaq	.LC13(%rip), %rax	;, tmp135
	testl	%edi, %edi	; type
	leaq	.LC14(%rip), %rcx	;, tmp134
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
; src/create.c:244:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movq	%rax, %r8	; tmp135, iftmp.24_20
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC19(%rip), %rdx	;, tmp113
; src/create.c:244:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	cmovne	%rcx, %r8	; tmp134,, iftmp.24_20
; src/create.c:244:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	testq	%rsi, %rsi	; base
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
; src/create.c:244:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	cmove	%rax, %rcx	; tmp134,, tmp135, iftmp.25_21
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:245:         return NULL;
	jmp	.L214	;
.L211:
	movq	%rdx, %r12	; tmp144, name_content
	movq	%rcx, %rbp	; tmp145, expr_content
	movq	%r8, %r13	; tmp146, args_content
; src/create.c:247:     VariableAccess* variable_access = (VariableAccess*)alloc_memory(sizeof(VariableAccess));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:250:     if (type == VAR_NAME && name_content != NULL)
	testq	%r12, %r12	; name_content
; src/create.c:248:     variable_access->type = type;
	movl	%ebx, 16(%rax)	; type, variable_access_30->type
; src/create.c:250:     if (type == VAR_NAME && name_content != NULL)
	setne	%dl	;, tmp114
; src/create.c:249:     variable_access->base = base;
	movq	%r14, (%rax)	; base, variable_access_30->base
; src/create.c:250:     if (type == VAR_NAME && name_content != NULL)
	testb	%r15b, %r15b	; tmp111
	je	.L215	;,
	testb	%dl, %dl	; tmp114
	jne	.L249	;,
.L215:
; src/create.c:252:     else if (type == VAR_FUNC_CALL && args_content != NULL)
	cmpl	$1, %ebx	;, type
	jne	.L217	;,
	testq	%r13, %r13	; args_content
	je	.L217	;,
; src/create.c:253:         variable_access->content.args = args_content;
	movq	%r13, 8(%rax)	; args_content, variable_access_30->content.args
	jmp	.L210	;
.L217:
; src/create.c:254:     else if (type == VAR_GET_SEQ && expr_content != NULL)
	cmpl	$3, %ebx	;, type
	jne	.L219	;,
	testq	%rbp, %rbp	; expr_content
	je	.L219	;,
; src/create.c:255:         variable_access->content.index = expr_content;
	movq	%rbp, 8(%rax)	; expr_content, variable_access_30->content.index
	jmp	.L210	;
.L219:
; src/create.c:256:     else if (type == VAR_GET_ATTR && name_content != NULL)
	cmpl	$2, %ebx	;, type
	jne	.L220	;,
	testb	%dl, %dl	; tmp114
	je	.L220	;,
.L249:
; src/create.c:257:         variable_access->content.attr_name = name_content;
	movq	%r12, 8(%rax)	; name_content,
	jmp	.L210	;
.L220:
; src/create.c:259:         if (name_content == NULL && expr_content == NULL && args_content == NULL)
	orq	%r13, %rbp	; args_content, tmp125
; src/create.c:260:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	movq	stderr(%rip), %rdi	; stderr, pretmp_23
; src/create.c:259:         if (name_content == NULL && expr_content == NULL && args_content == NULL)
	orq	%r12, %rbp	; name_content, tmp148
	jne	.L221	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, %rsi	; pretmp_23,
	leaq	.LC20(%rip), %rdi	;, tmp127
	call	*fputs@GOTPCREL(%rip)	;
	jmp	.L214	;
.L221:
	movl	%ebx, %ecx	; type,
	leaq	.LC21(%rip), %rdx	;, tmp128
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L214:
; src/create.c:245:         return NULL;
	xorl	%eax, %eax	; <retval>
.L210:
; src/create.c:266: }
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	create_variable_access, .-create_variable_access
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
