	.file	"create.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O3 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Error creating code member: content is NULL\n"
	.align 8
.LC1:
	.string	"Error creating code member: unknown type %u\n"
	.text
	.p2align 4
	.globl	create_code_member
	.type	create_code_member, @function
create_code_member:
	pushq	%r13	;
	movq	%rcx, %r13	; tmp122, class_content
	pushq	%r12	;
	movq	%rdx, %r12	; tmp121, function_content
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp120, import_content
	pushq	%rbx	;
	movl	%edi, %ebx	; tmp119, type
; src/create.c:4:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	movl	$16, %edi	;,
; src/create.c:3: CodeMember* create_code_member(CodeMemberType type, Import* import_content, Function* function_content, Class* class_content) {
	subq	$8, %rsp	;,
; src/create.c:4:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:5:     code_member->type = type;
	movl	%ebx, 8(%rax)	; type, code_member_21->type
; src/create.c:6:     if (type == CODE_IMPORT && import_content != NULL)
	testl	%ebx, %ebx	; type
	jne	.L2	;,
	testq	%rbp, %rbp	; import_content
	je	.L2	;,
; src/create.c:7:         code_member->content.import = import_content;
	movq	%rbp, (%rax)	; import_content, code_member_21->content.import
.L1:
; src/create.c:20: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L2:
; src/create.c:8:     else if (type == CODE_FUNCTION && function_content != NULL)
	cmpl	$1, %ebx	;, type
	jne	.L4	;,
	testq	%r12, %r12	; function_content
	je	.L4	;,
; src/create.c:9:         code_member->content.function = function_content;
	movq	%r12, (%rax)	; function_content, code_member_21->content.function
; src/create.c:20: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L4:
; src/create.c:10:     else if (type == CODE_CLASS && class_content != NULL)
	cmpl	$2, %ebx	;, type
	jne	.L6	;,
	testq	%r13, %r13	; class_content
	je	.L6	;,
; src/create.c:11:         code_member->content.class = class_content;
	movq	%r13, (%rax)	; class_content, code_member_21->content.class
; src/create.c:20: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L6:
; src/create.c:13:         if (import_content == NULL && function_content == NULL && class_content == NULL)
	movq	%r13, %rcx	; class_content, class_content
; src/create.c:14:             fprintf(stderr, "Error creating code member: content is NULL\n");
	movq	stderr(%rip), %rdi	; stderr, pretmp_16
; src/create.c:13:         if (import_content == NULL && function_content == NULL && class_content == NULL)
	orq	%r12, %rcx	; function_content, class_content
	orq	%rcx, %rbp	; tmp114, tmp124
	je	.L29	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebx, %ecx	; type,
	leaq	.LC1(%rip), %rdx	;, tmp117
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:17:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L1	;
.L29:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, %rcx	; pretmp_16,
	movl	$44, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp116
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:17:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L1	;
	.size	create_code_member, .-create_code_member
	.p2align 4
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
	subq	$8, %rsp	;,
; src/create.c:23:     Code* code = (Code*)alloc_memory(sizeof(Code));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:24:     code->members = members;
	movq	%rbp, (%rax)	; members, code_3->members
; src/create.c:25:     code->global_scope = global_scope;
	movq	%rbx, 8(%rax)	; global_scope, code_3->global_scope
; src/create.c:27: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	create_code, .-create_code
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"Error creating import: name is NULL\n"
	.text
	.p2align 4
	.globl	create_import
	.type	create_import, @function
create_import:
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/create.c:30:     if (name == NULL) {
	testq	%rdi, %rdi	; name
	je	.L36	;,
	movq	%rdi, %rbx	; tmp89, name
	movq	%rsi, %rbp	; tmp90, source
; src/create.c:34:     Import* import = (Import*)alloc_memory(sizeof(Import));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:35:     import->name = name;
	movq	%rbx, (%rax)	; name, import_7->name
; src/create.c:36:     import->source = source;
	movq	%rbp, 8(%rax)	; source, import_7->source
.L32:
; src/create.c:38: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.p2align 4,,10
	.p2align 3
.L36:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$36, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC2(%rip), %rdi	;, tmp87
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:32:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L32	;
	.size	create_import, .-create_import
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"Error creating function: name or return_type is NULL\n"
	.text
	.p2align 4
	.globl	create_function_use_ptr
	.type	create_function_use_ptr, @function
create_function_use_ptr:
; src/create.c:41:     if (name == NULL || return_type == NULL) {
	testq	%rsi, %rsi	; name
	je	.L41	;,
	testq	%rdx, %rdx	; return_type
	je	.L41	;,
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
	.p2align 4,,10
	.p2align 3
.L41:
; src/create.c:40: Function* create_function_use_ptr(Function* function, Symbol* name, Symbol* return_type, list(Variable*) parameters, list(Statement*) body, SymbolTable* function_scope) {
	subq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$53, %edx	;,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$1, %esi	;,
	leaq	.LC3(%rip), %rdi	;, tmp98
	call	*fwrite@GOTPCREL(%rip)	;
	xorl	%eax, %eax	; <retval>
; src/create.c:51: }
	addq	$8, %rsp	;,
	ret	
	.size	create_function_use_ptr, .-create_function_use_ptr
	.p2align 4
	.globl	create_function
	.type	create_function, @function
create_function:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
; src/create.c:53:     if (name == NULL || return_type == NULL) {
	testq	%rdi, %rdi	; name
	je	.L49	;,
	movq	%rsi, %rbp	; tmp100, return_type
	testq	%rsi, %rsi	; return_type
	je	.L49	;,
	movq	%rdi, %rbx	; tmp99, name
	movq	%rdx, %r14	; tmp101, parameters
	movq	%rcx, %r13	; tmp102, body
	movq	%r8, %r12	; tmp103, function_scope
; src/create.c:57:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:45:     function->name = name;
	movq	%rbx, (%rax)	; name, function_11->name
; src/create.c:46:     function->return_type = return_type;
	movq	%rbp, 8(%rax)	; return_type, function_11->return_type
; src/create.c:47:     function->parameters = parameters;
	movq	%r14, 16(%rax)	; parameters, function_11->parameters
; src/create.c:48:     function->body = body;
	movq	%r13, 24(%rax)	; body, function_11->body
; src/create.c:49:     function->function_scope = function_scope;
	movq	%r12, 32(%rax)	; function_scope, function_11->function_scope
; src/create.c:59: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L49:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$53, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC3(%rip), %rdi	;, tmp97
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:59: }
	popq	%rbx	;
; src/create.c:55:         return NULL;
	xorl	%eax, %eax	; <retval>
; src/create.c:59: }
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	create_function, .-create_function
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"Error creating method: name or return_type is NULL\n"
	.text
	.p2align 4
	.globl	create_method_use_ptr
	.type	create_method_use_ptr, @function
create_method_use_ptr:
; src/create.c:62:     if (name == NULL || return_type == NULL) {
	testq	%rsi, %rsi	; name
	je	.L55	;,
	testq	%rdx, %rdx	; return_type
	je	.L55	;,
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
	.p2align 4,,10
	.p2align 3
.L55:
; src/create.c:61: Method* create_method_use_ptr(Method* method, Symbol* name, Symbol* return_type, list(Variable*) parameters, list(Statement*) body, SymbolTable* method_scope) {
	subq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$51, %edx	;,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rdi	;, tmp98
	call	*fwrite@GOTPCREL(%rip)	;
	xorl	%eax, %eax	; <retval>
; src/create.c:72: }
	addq	$8, %rsp	;,
	ret	
	.size	create_method_use_ptr, .-create_method_use_ptr
	.p2align 4
	.globl	create_method
	.type	create_method, @function
create_method:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
; src/create.c:74:     if (name == NULL || return_type == NULL) {
	testq	%rdi, %rdi	; name
	je	.L63	;,
	movq	%rsi, %rbp	; tmp100, return_type
	testq	%rsi, %rsi	; return_type
	je	.L63	;,
	movq	%rdi, %rbx	; tmp99, name
	movq	%rdx, %r14	; tmp101, parameters
	movq	%rcx, %r13	; tmp102, body
	movq	%r8, %r12	; tmp103, method_scope
; src/create.c:78:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:66:     method->name = name;
	movq	%rbx, (%rax)	; name, method_11->name
; src/create.c:67:     method->return_type = return_type;
	movq	%rbp, 8(%rax)	; return_type, method_11->return_type
; src/create.c:68:     method->parameters = parameters;
	movq	%r14, 16(%rax)	; parameters, method_11->parameters
; src/create.c:69:     method->body = body;
	movq	%r13, 24(%rax)	; body, method_11->body
; src/create.c:70:     method->method_scope = method_scope;
	movq	%r12, 32(%rax)	; method_scope, method_11->method_scope
; src/create.c:80: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L63:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$51, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rdi	;, tmp97
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:80: }
	popq	%rbx	;
; src/create.c:76:         return NULL;
	xorl	%eax, %eax	; <retval>
; src/create.c:80: }
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	create_method, .-create_method
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"Error creating class member: content is NULL\n"
	.align 8
.LC6:
	.string	"Error creating class member: unknown type %u\n"
	.text
	.p2align 4
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
.L65:
; src/create.c:97: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.p2align 4,,10
	.p2align 3
.L66:
; src/create.c:87:     else if (type == CLASS_VARIABLE && variable_content != NULL)
	cmpl	$1, %ebx	;, type
	jne	.L68	;,
	testq	%r12, %r12	; variable_content
	je	.L68	;,
; src/create.c:88:         class_member->content.variable = variable_content;
	movq	%r12, (%rax)	; variable_content, class_member_18->content.variable
; src/create.c:97: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.p2align 4,,10
	.p2align 3
.L68:
; src/create.c:90:         if (method_content == NULL && variable_content == NULL)
	orq	%r12, %rbp	; variable_content, tmp112
; src/create.c:91:             fprintf(stderr, "Error creating class member: content is NULL\n");
	movq	stderr(%rip), %rdi	; stderr, pretmp_9
; src/create.c:90:         if (method_content == NULL && variable_content == NULL)
	jne	.L70	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, %rcx	; pretmp_9,
	movl	$45, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp105
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:94:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L65	;
	.p2align 4,,10
	.p2align 3
.L70:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebx, %ecx	; type,
	leaq	.LC6(%rip), %rdx	;, tmp106
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:94:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L65	;
	.size	create_class_member, .-create_class_member
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"Error creating class: name is NULL\n"
	.text
	.p2align 4
	.globl	create_class_use_ptr
	.type	create_class_use_ptr, @function
create_class_use_ptr:
; src/create.c:100:     if (name == NULL) {
	testq	%rsi, %rsi	; name
	je	.L92	;,
; src/create.c:104:     class->name = name;
	movq	%rsi, (%rdi)	; name, class_4(D)->name
; src/create.c:108:     return class;
	movq	%rdi, %rax	; class, <retval>
; src/create.c:105:     class->members = members;
	movq	%rdx, 8(%rdi)	; members, class_4(D)->members
; src/create.c:106:     class->class_scope = class_scope;
	movq	%rcx, 16(%rdi)	; class_scope, class_4(D)->class_scope
; src/create.c:107:     class->size = size;
	movq	%r8, 24(%rdi)	; size, class_4(D)->size
; src/create.c:109: }
	ret	
	.p2align 4,,10
	.p2align 3
.L92:
; src/create.c:99: Class* create_class_use_ptr(Class* class, Symbol* name, list(ClassMember*) members, SymbolTable* class_scope, size_t size) {
	subq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$35, %edx	;,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rdi	;, tmp90
	call	*fwrite@GOTPCREL(%rip)	;
	xorl	%eax, %eax	; <retval>
; src/create.c:109: }
	addq	$8, %rsp	;,
	ret	
	.size	create_class_use_ptr, .-create_class_use_ptr
	.p2align 4
	.globl	create_class
	.type	create_class, @function
create_class:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/create.c:111:     if (name == NULL) {
	testq	%rdi, %rdi	; name
	je	.L97	;,
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
.L93:
; src/create.c:117: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L97:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$35, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rdi	;, tmp89
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:113:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L93	;
	.size	create_class, .-create_class
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"Error creating variable: type or name is NULL\n"
	.text
	.p2align 4
	.globl	create_variable
	.type	create_variable, @function
create_variable:
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
; src/create.c:120:     if (type == NULL || name == NULL) {
	testq	%rdi, %rdi	; type
	je	.L102	;,
	movq	%rsi, %rbp	; tmp98, name
	testq	%rsi, %rsi	; name
	je	.L102	;,
	movq	%rdi, %rbx	; tmp97, type
	movq	%rdx, %r12	; tmp99, value
; src/create.c:124:     Variable* variable = (Variable*)alloc_memory(sizeof(Variable));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:125:     variable->type = type;
	movq	%rbx, (%rax)	; type, variable_11->type
; src/create.c:126:     variable->name = name;
	movq	%rbp, 8(%rax)	; name, variable_11->name
; src/create.c:127:     variable->value = value;
	movq	%r12, 16(%rax)	; value, variable_11->value
; src/create.c:129: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.p2align 4,,10
	.p2align 3
.L102:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$46, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC8(%rip), %rdi	;, tmp95
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:129: }
	popq	%rbx	;
; src/create.c:122:         return NULL;
	xorl	%eax, %eax	; <retval>
; src/create.c:129: }
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	create_variable, .-create_variable
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"Error creating statement: content is NULL\n"
	.align 8
.LC10:
	.string	"Error creating statement: unknown type %u\n"
	.text
	.p2align 4
	.globl	create_statement
	.type	create_statement, @function
create_statement:
	pushq	%r15	;
	movq	%r8, %r15	; tmp147, expr
	pushq	%r14	;
	movl	%edi, %r14d	; tmp143, type
; src/create.c:132:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	movl	$16, %edi	;,
; src/create.c:131: Statement* create_statement(StatementType type, If* if_stmt, While* while_stmt, For* for_stmt, Expression* expr, Variable* var_stmt) {
	pushq	%r13	;
	movq	%rcx, %r13	; tmp146, for_stmt
	pushq	%r12	;
	movq	%rdx, %r12	; tmp145, while_stmt
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp144, if_stmt
	pushq	%rbx	;
	movq	%r9, %rbx	; tmp148, var_stmt
	subq	$8, %rsp	;,
; src/create.c:132:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:133:     statement->type = type;
	movl	%r14d, 8(%rax)	; type, statement_31->type
; src/create.c:134:     if (type == EXPRESSION_STATEMENT && expr != NULL)
	testl	%r14d, %r14d	; type
	jne	.L105	;,
	testq	%r15, %r15	; expr
	je	.L105	;,
.L147:
; src/create.c:145:         statement->stmt.return_expr = expr;
	movq	%r15, (%rax)	; expr,* <retval>
.L104:
; src/create.c:156: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L105:
; src/create.c:136:     else if (type == VARIABLE_STATEMENT && var_stmt != NULL)
	cmpl	$1, %r14d	;, type
	jne	.L107	;,
	testq	%rbx, %rbx	; var_stmt
	je	.L107	;,
; src/create.c:137:         statement->stmt.var = var_stmt;
	movq	%rbx, (%rax)	; var_stmt, statement_31->stmt.var
; src/create.c:156: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L107:
; src/create.c:138:     else if (type == IF_STATEMENT && if_stmt != NULL)
	cmpl	$2, %r14d	;, type
	jne	.L109	;,
	testq	%rbp, %rbp	; if_stmt
	je	.L109	;,
; src/create.c:139:         statement->stmt.if_stmt = if_stmt;
	movq	%rbp, (%rax)	; if_stmt, statement_31->stmt.if_stmt
; src/create.c:156: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L109:
; src/create.c:140:     else if (type == WHILE_STATEMENT && while_stmt != NULL)
	cmpl	$3, %r14d	;, type
	jne	.L110	;,
	testq	%r12, %r12	; while_stmt
	je	.L110	;,
; src/create.c:141:         statement->stmt.while_stmt = while_stmt;
	movq	%r12, (%rax)	; while_stmt, statement_31->stmt.while_stmt
	jmp	.L104	;
	.p2align 4,,10
	.p2align 3
.L110:
; src/create.c:142:     else if (type == FOR_STATEMENT && for_stmt != NULL)
	cmpl	$4, %r14d	;, type
	jne	.L111	;,
	testq	%r13, %r13	; for_stmt
	je	.L111	;,
; src/create.c:143:         statement->stmt.for_stmt = for_stmt;
	movq	%r13, (%rax)	; for_stmt, statement_31->stmt.for_stmt
	jmp	.L104	;
	.p2align 4,,10
	.p2align 3
.L111:
; src/create.c:144:     else if (type == RETURN_STATEMENT)
	cmpl	$5, %r14d	;, type
	je	.L147	;,
; src/create.c:146:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	leal	-6(%r14), %edx	;, tmp135
; src/create.c:146:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	cmpl	$1, %edx	;, tmp135
	ja	.L113	;,
; src/create.c:147:         statement->stmt.expr = NULL;
	movq	$0, (%rax)	;, statement_31->stmt.expr
	jmp	.L104	;
.L113:
; src/create.c:149:         if (if_stmt == NULL && while_stmt == NULL && for_stmt == NULL && expr == NULL && var_stmt == NULL)
	orq	%r12, %r13	; while_stmt, tmp136
; src/create.c:150:             fprintf(stderr, "Error creating statement: content is NULL\n");
	movq	stderr(%rip), %rdi	; stderr, pretmp_61
; src/create.c:149:         if (if_stmt == NULL && while_stmt == NULL && for_stmt == NULL && expr == NULL && var_stmt == NULL)
	orq	%r13, %rbp	; tmp136, tmp137
	orq	%rbp, %rbx	; tmp137, tmp138
	orq	%r15, %rbx	; expr, tmp150
	je	.L148	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%r14d, %ecx	; type,
	leaq	.LC10(%rip), %rdx	;, tmp141
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:153:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L104	;
.L148:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, %rcx	; pretmp_61,
	movl	$42, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC9(%rip), %rdi	;, tmp140
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:153:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L104	;
	.size	create_statement, .-create_statement
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"Error creating if statement: condition is NULL\n"
	.text
	.p2align 4
	.globl	create_if
	.type	create_if, @function
create_if:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/create.c:159:     if (condition == NULL) {
	testq	%rdi, %rdi	; condition
	je	.L153	;,
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
.L149:
; src/create.c:169: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L153:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$47, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rdi	;, tmp89
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:161:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L149	;
	.size	create_if, .-create_if
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"Error creating else-if statement: condition is NULL\n"
	.text
	.p2align 4
	.globl	create_else_if
	.type	create_else_if, @function
create_else_if:
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/create.c:172:     if (condition == NULL) {
	testq	%rdi, %rdi	; condition
	je	.L158	;,
	movq	%rdi, %rbx	; tmp89, condition
	movq	%rsi, %rbp	; tmp90, body
; src/create.c:176:     ElseIf* else_if = (ElseIf*)alloc_memory(sizeof(ElseIf));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:177:     else_if->condition = condition;
	movq	%rbx, (%rax)	; condition, else_if_7->condition
; src/create.c:178:     else_if->body = body;
	movq	%rbp, 8(%rax)	; body, else_if_7->body
.L154:
; src/create.c:180: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.p2align 4,,10
	.p2align 3
.L158:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$52, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC12(%rip), %rdi	;, tmp87
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:174:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L154	;
	.size	create_else_if, .-create_else_if
	.p2align 4
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
	subq	$8, %rsp	;,
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
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	create_for, .-create_for
	.p2align 4
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
	subq	$8, %rsp	;,
; src/create.c:192:     While* while_ = (While*)alloc_memory(sizeof(While));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:193:     while_->condition = condition;
	movq	%rbp, (%rax)	; condition, while__3->condition
; src/create.c:194:     while_->body = body;
	movq	%rbx, 8(%rax)	; body, while__3->body
; src/create.c:196: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	create_while, .-create_while
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC13:
	.string	"true"
.LC14:
	.string	"false"
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	"Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n"
	.align 8
.LC16:
	.string	"Error creating expression: both expr_left and prim_left are NULL\n"
	.text
	.p2align 4
	.globl	create_expression
	.type	create_expression, @function
create_expression:
	pushq	%r13	;
	movq	%rdx, %r13	; tmp118, prim_left
	pushq	%r12	;
	movq	%rsi, %r12	; tmp117, expr_left
	pushq	%rbp	;
	movq	%rcx, %rbp	; tmp119, right
	pushq	%rbx	;
	movl	%edi, %ebx	; tmp116, operator
	subq	$8, %rsp	;,
; src/create.c:199:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	cmpl	$19, %edi	;, operator
	sete	%dl	;, tmp99
	testq	%rcx, %rcx	; right
	sete	%al	;, tmp101
; src/create.c:199:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	cmpb	%al, %dl	; tmp101, tmp99
	jne	.L164	;,
; src/create.c:199:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	movq	%r13, %rax	; prim_left, tmp121
	orq	%rsi, %rax	; expr_left, tmp121
	je	.L181	;,
; src/create.c:207:     Expression* expression = (Expression*)alloc_memory(sizeof(Expression));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:208:     expression->operator = operator;
	movl	%ebx, 24(%rax)	; operator, expression_22->operator
; src/create.c:209:     if (expr_left != NULL)
	testq	%r12, %r12	; expr_left
	je	.L171	;,
; src/create.c:210:         expression->expr_left = expr_left;
	movq	%r12, (%rax)	; expr_left, expression_22->expr_left
.L172:
; src/create.c:217:     expression->right = right;
	movq	%rbp, 16(%rax)	; right, expression_22->right
.L163:
; src/create.c:219: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L181:
; src/create.c:200:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC13(%rip), %r9	;, iftmp.17_10
; src/create.c:200:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC14(%rip), %rdx	;, iftmp.16_9
; src/create.c:200:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%r9, %r8	; iftmp.17_10, iftmp.18_11
; src/create.c:200:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%rcx, %rcx	; right
	je	.L182	;,
.L166:
; src/create.c:200:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	cmpl	$19, %ebx	;, operator
	leaq	.LC13(%rip), %rax	;, tmp113
	leaq	.LC14(%rip), %rcx	;, tmp112
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
; src/create.c:200:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	cmove	%rax, %rcx	; tmp112,, tmp113, iftmp.19_12
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	subq	$8, %rsp	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	pushq	%rdx	; iftmp.16_9
	leaq	.LC15(%rip), %rdx	;, tmp104
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:205:         return NULL;
	popq	%rax	;
	xorl	%eax, %eax	; <retval>
	popq	%rdx	;
	jmp	.L163	;
	.p2align 4,,10
	.p2align 3
.L164:
; src/create.c:200:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC13(%rip), %rax	;, tmp109
	leaq	.LC14(%rip), %r8	;, tmp108
	testq	%rcx, %rcx	; right
	movq	%rax, %rdx	; tmp109, iftmp.16_9
; src/create.c:200:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%rax, %r9	; tmp109, iftmp.17_10
; src/create.c:200:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	cmovne	%r8, %rdx	; tmp108,, iftmp.16_9
; src/create.c:200:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%r13, %r13	; prim_left
	cmovne	%r8, %r9	; tmp108,, iftmp.17_10
; src/create.c:200:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%rsi, %rsi	; expr_left
	cmove	%rax, %r8	; tmp108,, tmp109, iftmp.18_11
	jmp	.L166	;
	.p2align 4,,10
	.p2align 3
.L182:
; src/create.c:200:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%r9, %rdx	; iftmp.17_10, iftmp.16_9
	jmp	.L166	;
	.p2align 4,,10
	.p2align 3
.L171:
; src/create.c:211:     else if (prim_left != NULL)
	testq	%r13, %r13	; prim_left
	je	.L173	;,
; src/create.c:212:         expression->prim_left = prim_left;
	movq	%r13, 8(%rax)	; prim_left, expression_22->prim_left
	jmp	.L172	;
.L173:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$65, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rdi	;, tmp106
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:205:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L163	;
	.size	create_expression, .-create_expression
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"Error creating primary: value is NULL\n"
	.align 8
.LC18:
	.string	"Error creating primary: unknown type %u\n"
	.text
	.p2align 4
	.globl	create_primary
	.type	create_primary, @function
create_primary:
	pushq	%r14	;
	movq	%rsi, %r14	; tmp126, str_value
	pushq	%r13	;
	movq	%rcx, %r13	; tmp128, prim_value
	pushq	%r12	;
	movq	%r8, %r12	; tmp129, variable_value
	pushq	%rbp	;
	movq	%rdx, %rbp	; tmp127, expr_value
	pushq	%rbx	;
; src/create.c:221: Primary* create_primary(PrimaryType type, string str_value, Expression* expr_value, Primary* prim_value, VariableAccess* variable_value) {
	movl	%edi, %ebx	; tmp125, type
; src/create.c:222:     Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:223:     primary->type = type;
	movl	%ebx, 8(%rax)	; type, primary_25->type
; src/create.c:224:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != NULL)
	cmpl	$4, %ebx	;, type
	ja	.L184	;,
	testq	%r14, %r14	; str_value
	je	.L184	;,
; src/create.c:225:         primary->value.literal_value = str_value;
	movq	%r14, (%rax)	; str_value, primary_25->value.literal_value
.L183:
; src/create.c:240: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L184:
; src/create.c:226:     else if (type == PRIM_EXPRESSION && expr_value != NULL)
	cmpl	$5, %ebx	;, type
	jne	.L186	;,
	testq	%rbp, %rbp	; expr_value
	je	.L186	;,
; src/create.c:227:         primary->value.expr = expr_value;
	movq	%rbp, (%rax)	; expr_value, primary_25->value.expr
; src/create.c:240: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L186:
; src/create.c:228:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	leal	-6(%rbx), %edx	;, tmp114
; src/create.c:228:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	cmpl	$1, %edx	;, tmp114
	jbe	.L214	;,
; src/create.c:230:     else if (type == PRIM_VARIABLE_ACCESS && variable_value != NULL)
	cmpl	$8, %ebx	;, type
	jne	.L189	;,
	testq	%r12, %r12	; variable_value
	je	.L189	;,
; src/create.c:231:         primary->value.var = variable_value;
	movq	%r12, (%rax)	; variable_value, primary_25->value.var
; src/create.c:240: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L214:
; src/create.c:228:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	testq	%r13, %r13	; prim_value
	je	.L189	;,
; src/create.c:229:         primary->value.operand = prim_value;
	movq	%r13, (%rax)	; prim_value, primary_25->value.operand
	jmp	.L183	;
	.p2align 4,,10
	.p2align 3
.L189:
; src/create.c:233:         if (str_value == NULL && expr_value == NULL && prim_value == NULL && variable_value == NULL)
	orq	%r13, %r12	; prim_value, tmp119
; src/create.c:234:             fprintf(stderr, "Error creating primary: value is NULL\n");
	movq	stderr(%rip), %rdi	; stderr, pretmp_46
; src/create.c:233:         if (str_value == NULL && expr_value == NULL && prim_value == NULL && variable_value == NULL)
	orq	%r12, %rbp	; tmp119, tmp120
	orq	%r14, %rbp	; str_value, tmp131
	jne	.L190	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, %rcx	; pretmp_46,
	movl	$38, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC17(%rip), %rdi	;, tmp122
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:237:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L183	;
	.p2align 4,,10
	.p2align 3
.L190:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebx, %ecx	; type,
	leaq	.LC18(%rip), %rdx	;, tmp123
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:237:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L183	;
	.size	create_primary, .-create_primary
	.section	.rodata.str1.8
	.align 8
.LC19:
	.string	"Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n"
	.align 8
.LC20:
	.string	"Error creating variable access: content is NULL\n"
	.align 8
.LC21:
	.string	"Error creating variable access: unknown type %u\n"
	.text
	.p2align 4
	.globl	create_variable_access
	.type	create_variable_access, @function
create_variable_access:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp135, base
	pushq	%rbx	;
	movl	%edi, %ebx	; tmp134, type
	subq	$8, %rsp	;,
; src/create.c:243:     if ((base == NULL) != (type == VAR_NAME)) {
	testl	%edi, %edi	; type
	sete	%al	;, tmp109
	testq	%rsi, %rsi	; base
	sete	%r15b	;, tmp111
; src/create.c:243:     if ((base == NULL) != (type == VAR_NAME)) {
	cmpb	%al, %r15b	; tmp109, tmp111
	jne	.L255	;,
	movq	%rdx, %r12	; tmp136, name_content
	movq	%rcx, %r14	; tmp137, expr_content
	movq	%r8, %r13	; tmp138, args_content
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
	movq	%rbp, (%rax)	; base, variable_access_30->base
; src/create.c:250:     if (type == VAR_NAME && name_content != NULL)
	testb	%r15b, %r15b	; tmp111
	je	.L220	;,
	testb	%dl, %dl	; tmp114
	je	.L220	;,
.L254:
; src/create.c:257:         variable_access->content.attr_name = name_content;
	movq	%r12, 8(%rax)	; name_content,
.L215:
; src/create.c:266: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L220:
; src/create.c:252:     else if (type == VAR_FUNC_CALL && args_content != NULL)
	cmpl	$1, %ebx	;, type
	jne	.L222	;,
	testq	%r13, %r13	; args_content
	je	.L222	;,
; src/create.c:253:         variable_access->content.args = args_content;
	movq	%r13, 8(%rax)	; args_content, variable_access_30->content.args
; src/create.c:266: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L255:
; src/create.c:244:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	leaq	.LC13(%rip), %rax	;, tmp131
	testl	%edi, %edi	; type
	leaq	.LC14(%rip), %rcx	;, tmp130
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
; src/create.c:244:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movq	%rax, %r8	; tmp131, iftmp.24_20
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC19(%rip), %rdx	;, tmp113
; src/create.c:244:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	cmovne	%rcx, %r8	; tmp130,, iftmp.24_20
; src/create.c:244:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	testq	%rsi, %rsi	; base
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
; src/create.c:244:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	cmove	%rax, %rcx	; tmp130,, tmp131, iftmp.25_21
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:245:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L215	;
	.p2align 4,,10
	.p2align 3
.L222:
; src/create.c:254:     else if (type == VAR_GET_SEQ && expr_content != NULL)
	cmpl	$3, %ebx	;, type
	jne	.L224	;,
	testq	%r14, %r14	; expr_content
	je	.L224	;,
; src/create.c:255:         variable_access->content.index = expr_content;
	movq	%r14, 8(%rax)	; expr_content, variable_access_30->content.index
	jmp	.L215	;
	.p2align 4,,10
	.p2align 3
.L224:
; src/create.c:256:     else if (type == VAR_GET_ATTR && name_content != NULL)
	cmpl	$2, %ebx	;, type
	jne	.L225	;,
	testb	%dl, %dl	; tmp114
	jne	.L254	;,
.L225:
; src/create.c:259:         if (name_content == NULL && expr_content == NULL && args_content == NULL)
	movq	%r14, %rcx	; expr_content, expr_content
; src/create.c:260:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	movq	stderr(%rip), %rdi	; stderr, pretmp_23
; src/create.c:259:         if (name_content == NULL && expr_content == NULL && args_content == NULL)
	orq	%r13, %rcx	; args_content, expr_content
	orq	%r12, %rcx	; name_content, tmp140
	je	.L256	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebx, %ecx	; type,
	leaq	.LC21(%rip), %rdx	;, tmp128
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:245:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L215	;
.L256:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, %rcx	; pretmp_23,
	movl	$48, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC20(%rip), %rdi	;, tmp127
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:245:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L215	;
	.size	create_variable_access, .-create_variable_access
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
