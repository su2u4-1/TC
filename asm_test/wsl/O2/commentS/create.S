	.file	"create.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O2 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
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
	pushq	%r14	;
	movq	%rcx, %r14	; tmp122, class_content
	pushq	%r13	;
	movq	%rdx, %r13	; tmp121, function_content
	pushq	%r12	;
	movq	%rsi, %r12	; tmp120, import_content
	pushq	%rbp	;
	movl	%edi, %ebp	; tmp119, type
; src/create.c:4:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	movl	$16, %edi	;,
; src/create.c:3: CodeMember* create_code_member(CodeMemberType type, Import* import_content, Function* function_content, Class* class_content) {
	pushq	%rbx	;
; src/create.c:4:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:5:     code_member->type = type;
	movl	%ebp, 8(%rax)	; type, code_member_18->type
; src/create.c:4:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	movq	%rax, %rbx	; tmp123, <retval>
; src/create.c:6:     if (type == CODE_IMPORT && import_content != NULL)
	testl	%ebp, %ebp	; type
	jne	.L2	;,
	testq	%r12, %r12	; import_content
	je	.L2	;,
; src/create.c:7:         code_member->content.import = import_content;
	movq	%r12, (%rax)	; import_content, code_member_18->content.import
.L1:
; src/create.c:17: }
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L2:
; src/create.c:8:     else if (type == CODE_FUNCTION && function_content != NULL)
	cmpl	$1, %ebp	;, type
	jne	.L4	;,
	testq	%r13, %r13	; function_content
	je	.L4	;,
; src/create.c:9:         code_member->content.function = function_content;
	movq	%r13, (%rbx)	; function_content, code_member_18->content.function
; src/create.c:17: }
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L4:
; src/create.c:10:     else if (type == CODE_CLASS && class_content != NULL)
	cmpl	$2, %ebp	;, type
	jne	.L5	;,
	testq	%r14, %r14	; class_content
	je	.L5	;,
; src/create.c:11:         code_member->content.class = class_content;
	movq	%r14, (%rbx)	; class_content, code_member_18->content.class
; src/create.c:17: }
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L5:
; src/create.c:12:     else if (import_content == NULL && function_content == NULL && class_content == NULL)
	movq	%r14, %rcx	; class_content, class_content
; src/create.c:13:         fprintf(stderr, "Error creating code member: content is NULL\n");
	movq	stderr(%rip), %rdi	; stderr, pretmp_30
; src/create.c:12:     else if (import_content == NULL && function_content == NULL && class_content == NULL)
	orq	%r13, %rcx	; function_content, class_content
	orq	%rcx, %r12	; tmp114, tmp124
	je	.L27	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebp, %ecx	; type,
	leaq	.LC1(%rip), %rdx	;, tmp117
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:17: }
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L27:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, %rcx	; pretmp_30,
	movl	$44, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp116
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L1	;
	.size	create_code_member, .-create_code_member
	.p2align 4
	.globl	create_code
	.type	create_code, @function
create_code:
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp86, members
; src/create.c:20:     Code* code = (Code*)alloc_memory(sizeof(Code));
	movl	$16, %edi	;,
; src/create.c:19: Code* create_code(list(CodeMember*) members, SymbolTable* global_scope) {
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp87, global_scope
	subq	$8, %rsp	;,
; src/create.c:20:     Code* code = (Code*)alloc_memory(sizeof(Code));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:21:     code->members = members;
	movq	%rbp, (%rax)	; members, code_3->members
; src/create.c:22:     code->global_scope = global_scope;
	movq	%rbx, 8(%rax)	; global_scope, code_3->global_scope
; src/create.c:24: }
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
; src/create.c:27:     if (name == NULL) {
	testq	%rdi, %rdi	; name
	je	.L34	;,
	movq	%rdi, %rbx	; tmp89, name
	movq	%rsi, %rbp	; tmp90, source
; src/create.c:31:     Import* import = (Import*)alloc_memory(sizeof(Import));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:32:     import->name = name;
	movq	%rbx, (%rax)	; name, import_7->name
; src/create.c:33:     import->source = source;
	movq	%rbp, 8(%rax)	; source, import_7->source
.L30:
; src/create.c:35: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.p2align 4,,10
	.p2align 3
.L34:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$36, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC2(%rip), %rdi	;, tmp87
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:29:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L30	;
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
; src/create.c:38:     if (name == NULL || return_type == NULL) {
	testq	%rsi, %rsi	; name
	je	.L39	;,
	testq	%rdx, %rdx	; return_type
	je	.L39	;,
; src/create.c:42:     function->name = name;
	movq	%rsi, (%rdi)	; name, function_10(D)->name
	movq	%rdi, %rax	; tmp100, function
; src/create.c:43:     function->return_type = return_type;
	movq	%rdx, 8(%rdi)	; return_type, function_10(D)->return_type
; src/create.c:44:     function->parameters = parameters;
	movq	%rcx, 16(%rdi)	; parameters, function_10(D)->parameters
; src/create.c:45:     function->body = body;
	movq	%r8, 24(%rdi)	; body, function_10(D)->body
; src/create.c:46:     function->function_scope = function_scope;
	movq	%r9, 32(%rdi)	; function_scope, function_10(D)->function_scope
; src/create.c:48: }
	ret	
	.p2align 4,,10
	.p2align 3
.L39:
; src/create.c:37: Function* create_function_use_ptr(Function* function, Symbol* name, Symbol* return_type, list(Variable*) parameters, list(Statement*) body, SymbolTable* function_scope) {
	subq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$53, %edx	;,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$1, %esi	;,
	leaq	.LC3(%rip), %rdi	;, tmp98
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:40:         return NULL;
	xorl	%eax, %eax	; <retval>
; src/create.c:48: }
	addq	$8, %rsp	;,
	ret	
	.size	create_function_use_ptr, .-create_function_use_ptr
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"Error creating method: name or return_type is NULL\n"
	.text
	.p2align 4
	.globl	create_method_use_ptr
	.type	create_method_use_ptr, @function
create_method_use_ptr:
; src/create.c:51:     if (name == NULL || return_type == NULL) {
	testq	%rsi, %rsi	; name
	je	.L47	;,
	testq	%rdx, %rdx	; return_type
	je	.L47	;,
; src/create.c:55:     method->name = name;
	movq	%rsi, (%rdi)	; name, method_10(D)->name
	movq	%rdi, %rax	; tmp100, method
; src/create.c:56:     method->return_type = return_type;
	movq	%rdx, 8(%rdi)	; return_type, method_10(D)->return_type
; src/create.c:57:     method->parameters = parameters;
	movq	%rcx, 16(%rdi)	; parameters, method_10(D)->parameters
; src/create.c:58:     method->body = body;
	movq	%r8, 24(%rdi)	; body, method_10(D)->body
; src/create.c:59:     method->method_scope = method_scope;
	movq	%r9, 32(%rdi)	; method_scope, method_10(D)->method_scope
; src/create.c:61: }
	ret	
	.p2align 4,,10
	.p2align 3
.L47:
; src/create.c:50: Method* create_method_use_ptr(Method* method, Symbol* name, Symbol* return_type, list(Variable*) parameters, list(Statement*) body, SymbolTable* method_scope) {
	subq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$51, %edx	;,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rdi	;, tmp98
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:53:         return NULL;
	xorl	%eax, %eax	; <retval>
; src/create.c:61: }
	addq	$8, %rsp	;,
	ret	
	.size	create_method_use_ptr, .-create_method_use_ptr
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
; src/create.c:63: ClassMember* create_class_member(ClassMemberType type, Method* method_content, Variable* variable_content) {
	movl	%edi, %ebx	; tmp108, type
; src/create.c:64:     ClassMember* class_member = (ClassMember*)alloc_memory(sizeof(ClassMember));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:65:     class_member->type = type;
	movl	%ebx, 8(%rax)	; type, class_member_18->type
; src/create.c:66:     if (type == CLASS_METHOD && method_content != NULL)
	testl	%ebx, %ebx	; type
	jne	.L52	;,
	testq	%rbp, %rbp	; method_content
	je	.L52	;,
; src/create.c:67:         class_member->content.method = method_content;
	movq	%rbp, (%rax)	; method_content, class_member_18->content.method
.L51:
; src/create.c:78: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.p2align 4,,10
	.p2align 3
.L52:
; src/create.c:68:     else if (type == CLASS_VARIABLE && variable_content != NULL)
	cmpl	$1, %ebx	;, type
	jne	.L54	;,
	testq	%r12, %r12	; variable_content
	je	.L54	;,
; src/create.c:69:         class_member->content.variable = variable_content;
	movq	%r12, (%rax)	; variable_content, class_member_18->content.variable
; src/create.c:78: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.p2align 4,,10
	.p2align 3
.L54:
; src/create.c:71:         if (method_content == NULL && variable_content == NULL)
	orq	%r12, %rbp	; variable_content, tmp112
; src/create.c:72:             fprintf(stderr, "Error creating class member: content is NULL\n");
	movq	stderr(%rip), %rdi	; stderr, pretmp_9
; src/create.c:71:         if (method_content == NULL && variable_content == NULL)
	jne	.L56	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, %rcx	; pretmp_9,
	movl	$45, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp105
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:75:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L51	;
	.p2align 4,,10
	.p2align 3
.L56:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebx, %ecx	; type,
	leaq	.LC6(%rip), %rdx	;, tmp106
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:75:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L51	;
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
; src/create.c:81:     if (name == NULL) {
	testq	%rsi, %rsi	; name
	je	.L78	;,
; src/create.c:85:     class->name = name;
	movq	%rsi, (%rdi)	; name, class_6(D)->name
; src/create.c:89:     return class;
	movq	%rdi, %rax	; class, <retval>
; src/create.c:86:     class->members = members;
	movq	%rdx, 8(%rdi)	; members, class_6(D)->members
; src/create.c:87:     class->class_scope = class_scope;
	movq	%rcx, 16(%rdi)	; class_scope, class_6(D)->class_scope
; src/create.c:88:     class->size = size;
	movq	%r8, 24(%rdi)	; size, class_6(D)->size
; src/create.c:90: }
	ret	
	.p2align 4,,10
	.p2align 3
.L78:
; src/create.c:80: Class* create_class_use_ptr(Class* class, Symbol* name, list(ClassMember*) members, SymbolTable* class_scope, size_t size) {
	subq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$35, %edx	;,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rdi	;, tmp90
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:83:         return NULL;
	xorl	%eax, %eax	; <retval>
; src/create.c:90: }
	addq	$8, %rsp	;,
	ret	
	.size	create_class_use_ptr, .-create_class_use_ptr
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
; src/create.c:93:     if (type == NULL || name == NULL) {
	testq	%rdi, %rdi	; type
	je	.L83	;,
	movq	%rsi, %rbp	; tmp98, name
	testq	%rsi, %rsi	; name
	je	.L83	;,
	movq	%rdi, %rbx	; tmp97, type
	movq	%rdx, %r12	; tmp99, value
; src/create.c:97:     Variable* variable = (Variable*)alloc_memory(sizeof(Variable));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:98:     variable->type = type;
	movq	%rbx, (%rax)	; type, variable_11->type
; src/create.c:99:     variable->name = name;
	movq	%rbp, 8(%rax)	; name, variable_11->name
; src/create.c:100:     variable->value = value;
	movq	%r12, 16(%rax)	; value, variable_11->value
; src/create.c:102: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.p2align 4,,10
	.p2align 3
.L83:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$46, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC8(%rip), %rdi	;, tmp95
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:102: }
	popq	%rbx	;
; src/create.c:95:         return NULL;
	xorl	%eax, %eax	; <retval>
; src/create.c:102: }
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
; src/create.c:105:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	movl	$16, %edi	;,
; src/create.c:104: Statement* create_statement(StatementType type, If* if_stmt, While* while_stmt, For* for_stmt, Expression* expr, Variable* var_stmt) {
	pushq	%r13	;
	movq	%rcx, %r13	; tmp146, for_stmt
	pushq	%r12	;
	movq	%rdx, %r12	; tmp145, while_stmt
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp144, if_stmt
	pushq	%rbx	;
	movq	%r9, %rbx	; tmp148, var_stmt
	subq	$8, %rsp	;,
; src/create.c:105:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:106:     statement->type = type;
	movl	%r14d, 8(%rax)	; type, statement_31->type
; src/create.c:107:     if (type == EXPRESSION_STATEMENT && expr != NULL)
	testl	%r14d, %r14d	; type
	jne	.L86	;,
	testq	%r15, %r15	; expr
	je	.L86	;,
.L128:
; src/create.c:118:         statement->stmt.return_expr = expr;
	movq	%r15, (%rax)	; expr,* <retval>
.L85:
; src/create.c:129: }
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
.L86:
; src/create.c:109:     else if (type == VARIABLE_STATEMENT && var_stmt != NULL)
	cmpl	$1, %r14d	;, type
	jne	.L88	;,
	testq	%rbx, %rbx	; var_stmt
	je	.L88	;,
; src/create.c:110:         statement->stmt.var = var_stmt;
	movq	%rbx, (%rax)	; var_stmt, statement_31->stmt.var
; src/create.c:129: }
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
.L88:
; src/create.c:111:     else if (type == IF_STATEMENT && if_stmt != NULL)
	cmpl	$2, %r14d	;, type
	jne	.L90	;,
	testq	%rbp, %rbp	; if_stmt
	je	.L90	;,
; src/create.c:112:         statement->stmt.if_stmt = if_stmt;
	movq	%rbp, (%rax)	; if_stmt, statement_31->stmt.if_stmt
; src/create.c:129: }
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
.L90:
; src/create.c:113:     else if (type == WHILE_STATEMENT && while_stmt != NULL)
	cmpl	$3, %r14d	;, type
	jne	.L91	;,
	testq	%r12, %r12	; while_stmt
	je	.L91	;,
; src/create.c:114:         statement->stmt.while_stmt = while_stmt;
	movq	%r12, (%rax)	; while_stmt, statement_31->stmt.while_stmt
	jmp	.L85	;
	.p2align 4,,10
	.p2align 3
.L91:
; src/create.c:115:     else if (type == FOR_STATEMENT && for_stmt != NULL)
	cmpl	$4, %r14d	;, type
	jne	.L92	;,
	testq	%r13, %r13	; for_stmt
	je	.L92	;,
; src/create.c:116:         statement->stmt.for_stmt = for_stmt;
	movq	%r13, (%rax)	; for_stmt, statement_31->stmt.for_stmt
	jmp	.L85	;
	.p2align 4,,10
	.p2align 3
.L92:
; src/create.c:117:     else if (type == RETURN_STATEMENT)
	cmpl	$5, %r14d	;, type
	je	.L128	;,
; src/create.c:119:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	leal	-6(%r14), %edx	;, tmp135
; src/create.c:119:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	cmpl	$1, %edx	;, tmp135
	ja	.L94	;,
; src/create.c:120:         statement->stmt.expr = NULL;
	movq	$0, (%rax)	;, statement_31->stmt.expr
	jmp	.L85	;
.L94:
; src/create.c:122:         if (if_stmt == NULL && while_stmt == NULL && for_stmt == NULL && expr == NULL && var_stmt == NULL)
	orq	%r12, %r13	; while_stmt, tmp136
; src/create.c:123:             fprintf(stderr, "Error creating statement: content is NULL\n");
	movq	stderr(%rip), %rdi	; stderr, pretmp_61
; src/create.c:122:         if (if_stmt == NULL && while_stmt == NULL && for_stmt == NULL && expr == NULL && var_stmt == NULL)
	orq	%r13, %rbp	; tmp136, tmp137
	orq	%rbp, %rbx	; tmp137, tmp138
	orq	%r15, %rbx	; expr, tmp150
	je	.L129	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%r14d, %ecx	; type,
	leaq	.LC10(%rip), %rdx	;, tmp141
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:126:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L85	;
.L129:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, %rcx	; pretmp_61,
	movl	$42, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC9(%rip), %rdi	;, tmp140
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:126:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L85	;
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
; src/create.c:132:     if (condition == NULL) {
	testq	%rdi, %rdi	; condition
	je	.L134	;,
	movq	%rdi, %rbx	; tmp91, condition
	movq	%rsi, %r13	; tmp92, body
	movq	%rdx, %r12	; tmp93, else_if
	movq	%rcx, %rbp	; tmp94, else_body
; src/create.c:136:     If* if_ = (If*)alloc_memory(sizeof(If));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:137:     if_->condition = condition;
	movq	%rbx, (%rax)	; condition, if__7->condition
; src/create.c:138:     if_->body = body;
	movq	%r13, 8(%rax)	; body, if__7->body
; src/create.c:139:     if_->else_if = else_if;
	movq	%r12, 16(%rax)	; else_if, if__7->else_if
; src/create.c:140:     if_->else_body = else_body;
	movq	%rbp, 24(%rax)	; else_body, if__7->else_body
.L130:
; src/create.c:142: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L134:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$47, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rdi	;, tmp89
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:134:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L130	;
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
; src/create.c:145:     if (condition == NULL) {
	testq	%rdi, %rdi	; condition
	je	.L139	;,
	movq	%rdi, %rbx	; tmp89, condition
	movq	%rsi, %rbp	; tmp90, body
; src/create.c:149:     ElseIf* else_if = (ElseIf*)alloc_memory(sizeof(ElseIf));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:150:     else_if->condition = condition;
	movq	%rbx, (%rax)	; condition, else_if_7->condition
; src/create.c:151:     else_if->body = body;
	movq	%rbp, 8(%rax)	; body, else_if_7->body
.L135:
; src/create.c:153: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.p2align 4,,10
	.p2align 3
.L139:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$52, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC12(%rip), %rdi	;, tmp87
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:147:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L135	;
	.size	create_else_if, .-create_else_if
	.p2align 4
	.globl	create_for
	.type	create_for, @function
create_for:
	pushq	%r13	;
	movq	%rdi, %r13	; tmp88, initializer
; src/create.c:156:     For* for_ = (For*)alloc_memory(sizeof(For));
	movl	$32, %edi	;,
; src/create.c:155: For* create_for(Variable* initializer, Expression* condition, Expression* increment, list(Statement*) body) {
	pushq	%r12	;
	movq	%rsi, %r12	; tmp89, condition
	pushq	%rbp	;
	movq	%rdx, %rbp	; tmp90, increment
	pushq	%rbx	;
	movq	%rcx, %rbx	; tmp91, body
	subq	$8, %rsp	;,
; src/create.c:156:     For* for_ = (For*)alloc_memory(sizeof(For));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:157:     for_->initializer = initializer;
	movq	%r13, (%rax)	; initializer, for__3->initializer
; src/create.c:158:     for_->condition = condition;
	movq	%r12, 8(%rax)	; condition, for__3->condition
; src/create.c:159:     for_->increment = increment;
	movq	%rbp, 16(%rax)	; increment, for__3->increment
; src/create.c:160:     for_->body = body;
	movq	%rbx, 24(%rax)	; body, for__3->body
; src/create.c:162: }
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
; src/create.c:165:     While* while_ = (While*)alloc_memory(sizeof(While));
	movl	$16, %edi	;,
; src/create.c:164: While* create_while(Expression* condition, list(Statement*) body) {
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp87, body
	subq	$8, %rsp	;,
; src/create.c:165:     While* while_ = (While*)alloc_memory(sizeof(While));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:166:     while_->condition = condition;
	movq	%rbp, (%rax)	; condition, while__3->condition
; src/create.c:167:     while_->body = body;
	movq	%rbx, 8(%rax)	; body, while__3->body
; src/create.c:169: }
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
; src/create.c:172:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	cmpl	$19, %edi	;, operator
	sete	%dl	;, tmp99
	testq	%rcx, %rcx	; right
	sete	%al	;, tmp101
; src/create.c:172:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	cmpb	%al, %dl	; tmp101, tmp99
	jne	.L145	;,
; src/create.c:172:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	movq	%r13, %rax	; prim_left, tmp121
	orq	%rsi, %rax	; expr_left, tmp121
	je	.L162	;,
; src/create.c:180:     Expression* expression = (Expression*)alloc_memory(sizeof(Expression));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:181:     expression->operator = operator;
	movl	%ebx, 24(%rax)	; operator, expression_22->operator
; src/create.c:182:     if (expr_left != NULL)
	testq	%r12, %r12	; expr_left
	je	.L152	;,
; src/create.c:183:         expression->expr_left = expr_left;
	movq	%r12, (%rax)	; expr_left, expression_22->expr_left
.L153:
; src/create.c:190:     expression->right = right;
	movq	%rbp, 16(%rax)	; right, expression_22->right
.L144:
; src/create.c:192: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L162:
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC13(%rip), %r9	;, iftmp.14_10
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC14(%rip), %rdx	;, iftmp.13_9
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%r9, %r8	; iftmp.14_10, iftmp.15_11
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%rcx, %rcx	; right
	je	.L163	;,
.L147:
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	cmpl	$19, %ebx	;, operator
	leaq	.LC13(%rip), %rax	;, tmp113
	leaq	.LC14(%rip), %rcx	;, tmp112
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	cmove	%rax, %rcx	; tmp112,, tmp113, iftmp.16_12
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	subq	$8, %rsp	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	pushq	%rdx	; iftmp.13_9
	leaq	.LC15(%rip), %rdx	;, tmp104
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:178:         return NULL;
	popq	%rax	;
	xorl	%eax, %eax	; <retval>
	popq	%rdx	;
	jmp	.L144	;
	.p2align 4,,10
	.p2align 3
.L145:
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC13(%rip), %rax	;, tmp109
	leaq	.LC14(%rip), %r8	;, tmp108
	testq	%rcx, %rcx	; right
	movq	%rax, %rdx	; tmp109, iftmp.13_9
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%rax, %r9	; tmp109, iftmp.14_10
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	cmovne	%r8, %rdx	; tmp108,, iftmp.13_9
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%r13, %r13	; prim_left
	cmovne	%r8, %r9	; tmp108,, iftmp.14_10
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%rsi, %rsi	; expr_left
	cmove	%rax, %r8	; tmp108,, tmp109, iftmp.15_11
	jmp	.L147	;
	.p2align 4,,10
	.p2align 3
.L163:
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%r9, %rdx	; iftmp.14_10, iftmp.13_9
	jmp	.L147	;
	.p2align 4,,10
	.p2align 3
.L152:
; src/create.c:184:     else if (prim_left != NULL)
	testq	%r13, %r13	; prim_left
	je	.L154	;,
; src/create.c:185:         expression->prim_left = prim_left;
	movq	%r13, 8(%rax)	; prim_left, expression_22->prim_left
	jmp	.L153	;
.L154:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$65, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rdi	;, tmp106
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:178:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L144	;
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
; src/create.c:194: Primary* create_primary(PrimaryType type, string str_value, Expression* expr_value, Primary* prim_value, VariableAccess* variable_value) {
	movl	%edi, %ebx	; tmp125, type
; src/create.c:195:     Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:196:     primary->type = type;
	movl	%ebx, 8(%rax)	; type, primary_25->type
; src/create.c:197:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != NULL)
	cmpl	$4, %ebx	;, type
	ja	.L165	;,
	testq	%r14, %r14	; str_value
	je	.L165	;,
; src/create.c:198:         primary->value.literal_value = str_value;
	movq	%r14, (%rax)	; str_value, primary_25->value.literal_value
.L164:
; src/create.c:213: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L165:
; src/create.c:199:     else if (type == PRIM_EXPRESSION && expr_value != NULL)
	cmpl	$5, %ebx	;, type
	jne	.L167	;,
	testq	%rbp, %rbp	; expr_value
	je	.L167	;,
; src/create.c:200:         primary->value.expr = expr_value;
	movq	%rbp, (%rax)	; expr_value, primary_25->value.expr
; src/create.c:213: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L167:
; src/create.c:201:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	leal	-6(%rbx), %edx	;, tmp114
; src/create.c:201:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	cmpl	$1, %edx	;, tmp114
	jbe	.L195	;,
; src/create.c:203:     else if (type == PRIM_VARIABLE_ACCESS && variable_value != NULL)
	cmpl	$8, %ebx	;, type
	jne	.L170	;,
	testq	%r12, %r12	; variable_value
	je	.L170	;,
; src/create.c:204:         primary->value.var = variable_value;
	movq	%r12, (%rax)	; variable_value, primary_25->value.var
; src/create.c:213: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L195:
; src/create.c:201:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	testq	%r13, %r13	; prim_value
	je	.L170	;,
; src/create.c:202:         primary->value.operand = prim_value;
	movq	%r13, (%rax)	; prim_value, primary_25->value.operand
	jmp	.L164	;
	.p2align 4,,10
	.p2align 3
.L170:
; src/create.c:206:         if (str_value == NULL && expr_value == NULL && prim_value == NULL && variable_value == NULL)
	orq	%r13, %r12	; prim_value, tmp119
; src/create.c:207:             fprintf(stderr, "Error creating primary: value is NULL\n");
	movq	stderr(%rip), %rdi	; stderr, pretmp_46
; src/create.c:206:         if (str_value == NULL && expr_value == NULL && prim_value == NULL && variable_value == NULL)
	orq	%r12, %rbp	; tmp119, tmp120
	orq	%r14, %rbp	; str_value, tmp131
	jne	.L171	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, %rcx	; pretmp_46,
	movl	$38, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC17(%rip), %rdi	;, tmp122
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:210:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L164	;
	.p2align 4,,10
	.p2align 3
.L171:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebx, %ecx	; type,
	leaq	.LC18(%rip), %rdx	;, tmp123
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:210:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L164	;
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
; src/create.c:216:     if ((base == NULL) != (type == VAR_NAME)) {
	testl	%edi, %edi	; type
	sete	%al	;, tmp109
	testq	%rsi, %rsi	; base
	sete	%r15b	;, tmp111
; src/create.c:216:     if ((base == NULL) != (type == VAR_NAME)) {
	cmpb	%al, %r15b	; tmp109, tmp111
	jne	.L236	;,
	movq	%rdx, %r12	; tmp136, name_content
	movq	%rcx, %r14	; tmp137, expr_content
	movq	%r8, %r13	; tmp138, args_content
; src/create.c:220:     VariableAccess* variable_access = (VariableAccess*)alloc_memory(sizeof(VariableAccess));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:223:     if (type == VAR_NAME && name_content != NULL)
	testq	%r12, %r12	; name_content
; src/create.c:221:     variable_access->type = type;
	movl	%ebx, 16(%rax)	; type, variable_access_30->type
; src/create.c:223:     if (type == VAR_NAME && name_content != NULL)
	setne	%dl	;, tmp114
; src/create.c:222:     variable_access->base = base;
	movq	%rbp, (%rax)	; base, variable_access_30->base
; src/create.c:223:     if (type == VAR_NAME && name_content != NULL)
	testb	%r15b, %r15b	; tmp111
	je	.L201	;,
	testb	%dl, %dl	; tmp114
	je	.L201	;,
.L235:
; src/create.c:230:         variable_access->content.attr_name = name_content;
	movq	%r12, 8(%rax)	; name_content,
.L196:
; src/create.c:239: }
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
.L201:
; src/create.c:225:     else if (type == VAR_FUNC_CALL && args_content != NULL)
	cmpl	$1, %ebx	;, type
	jne	.L203	;,
	testq	%r13, %r13	; args_content
	je	.L203	;,
; src/create.c:226:         variable_access->content.args = args_content;
	movq	%r13, 8(%rax)	; args_content, variable_access_30->content.args
; src/create.c:239: }
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
.L236:
; src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	leaq	.LC13(%rip), %rax	;, tmp131
	testl	%edi, %edi	; type
	leaq	.LC14(%rip), %rcx	;, tmp130
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
; src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movq	%rax, %r8	; tmp131, iftmp.21_20
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC19(%rip), %rdx	;, tmp113
; src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	cmovne	%rcx, %r8	; tmp130,, iftmp.21_20
; src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	testq	%rsi, %rsi	; base
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
; src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	cmove	%rax, %rcx	; tmp130,, tmp131, iftmp.22_21
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:218:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L196	;
	.p2align 4,,10
	.p2align 3
.L203:
; src/create.c:227:     else if (type == VAR_GET_SEQ && expr_content != NULL)
	cmpl	$3, %ebx	;, type
	jne	.L205	;,
	testq	%r14, %r14	; expr_content
	je	.L205	;,
; src/create.c:228:         variable_access->content.index = expr_content;
	movq	%r14, 8(%rax)	; expr_content, variable_access_30->content.index
	jmp	.L196	;
	.p2align 4,,10
	.p2align 3
.L205:
; src/create.c:229:     else if (type == VAR_GET_ATTR && name_content != NULL)
	cmpl	$2, %ebx	;, type
	jne	.L206	;,
	testb	%dl, %dl	; tmp114
	jne	.L235	;,
.L206:
; src/create.c:232:         if (name_content == NULL && expr_content == NULL && args_content == NULL)
	movq	%r14, %rcx	; expr_content, expr_content
; src/create.c:233:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	movq	stderr(%rip), %rdi	; stderr, pretmp_23
; src/create.c:232:         if (name_content == NULL && expr_content == NULL && args_content == NULL)
	orq	%r13, %rcx	; args_content, expr_content
	orq	%r12, %rcx	; name_content, tmp140
	je	.L237	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebx, %ecx	; type,
	leaq	.LC21(%rip), %rdx	;, tmp128
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:218:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L196	;
.L237:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, %rcx	; pretmp_23,
	movl	$48, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC20(%rip), %rdi	;, tmp127
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:218:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L196	;
	.size	create_variable_access, .-create_variable_access
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
