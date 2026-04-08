	.file	"create.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O1 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Error creating code member: content is NULL\n"
	.align 8
.LC1:
	.string	"Error creating code member: unknown type %u\n"
	.text
	.globl	create_code_member
	.type	create_code_member, @function
create_code_member:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movl	%edi, %ebp	; tmp122, type
	movq	%rsi, %r12	; tmp123, import_content
	movq	%rdx, %r14	; tmp124, function_content
	movq	%rcx, %r13	; tmp125, class_content
; src/create.c:4:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp126, <retval>
; src/create.c:5:     code_member->type = type;
	movl	%ebp, 8(%rax)	; type, code_member_18->type
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
.L2:
; src/create.c:8:     else if (type == CODE_FUNCTION && function_content != NULL)
	cmpl	$1, %ebp	;, type
	jne	.L4	;,
	testq	%r14, %r14	; function_content
	je	.L4	;,
; src/create.c:9:         code_member->content.function = function_content;
	movq	%r14, (%rbx)	; function_content, code_member_18->content.function
	jmp	.L1	;
.L4:
; src/create.c:10:     else if (type == CODE_CLASS && class_content != NULL)
	cmpl	$2, %ebp	;, type
	jne	.L5	;,
	testq	%r13, %r13	; class_content
	je	.L5	;,
; src/create.c:11:         code_member->content.class = class_content;
	movq	%r13, (%rbx)	; class_content, code_member_18->content.class
	jmp	.L1	;
.L5:
; src/create.c:12:     else if (import_content == NULL && function_content == NULL && class_content == NULL)
	movq	%r13, %rcx	; class_content, class_content
	orq	%r14, %rcx	; function_content, class_content
	orq	%r12, %rcx	; import_content, tmp127
	je	.L8	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebp, %ecx	; type,
	leaq	.LC1(%rip), %rdx	;, tmp120
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:16:     return code_member;
	jmp	.L1	;
.L8:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$44, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp118
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L1	;
	.size	create_code_member, .-create_code_member
	.globl	create_code
	.type	create_code, @function
create_code:
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %rbp	; tmp86, members
	movq	%rsi, %rbx	; tmp87, global_scope
; src/create.c:20:     Code* code = (Code*)alloc_memory(sizeof(Code));
	movl	$16, %edi	;,
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
	.globl	create_import
	.type	create_import, @function
create_import:
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %rbx	; tmp89, name
; src/create.c:27:     if (name == NULL) {
	testq	%rdi, %rdi	; name
	je	.L15	;,
	movq	%rsi, %rbp	; tmp90, source
; src/create.c:31:     Import* import = (Import*)alloc_memory(sizeof(Import));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:32:     import->name = name;
	movq	%rbx, (%rax)	; name, import_7->name
; src/create.c:33:     import->source = source;
	movq	%rbp, 8(%rax)	; source, import_7->source
.L11:
; src/create.c:35: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
.L15:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$36, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC2(%rip), %rdi	;, tmp87
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:29:         return NULL;
	movq	%rbx, %rax	; name, <retval>
	jmp	.L11	;
	.size	create_import, .-create_import
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"Error creating function: name or return_type is NULL\n"
	.text
	.globl	create_function_use_ptr
	.type	create_function_use_ptr, @function
create_function_use_ptr:
; src/create.c:38:     if (name == NULL || return_type == NULL) {
	testq	%rsi, %rsi	; name
	je	.L20	;,
	movq	%rdi, %rax	; tmp100, function
	testq	%rdx, %rdx	; return_type
	je	.L20	;,
; src/create.c:42:     function->name = name;
	movq	%rsi, (%rdi)	; name, function_10(D)->name
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
.L20:
; src/create.c:37: Function* create_function_use_ptr(Function* function, Symbol* name, Symbol* return_type, list(Variable*) parameters, list(Statement*) body, SymbolTable* function_scope) {
	subq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$53, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC3(%rip), %rdi	;, tmp98
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:40:         return NULL;
	movl	$0, %eax	;, <retval>
; src/create.c:48: }
	addq	$8, %rsp	;,
	ret	
	.size	create_function_use_ptr, .-create_function_use_ptr
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"Error creating method: name or return_type is NULL\n"
	.text
	.globl	create_method_use_ptr
	.type	create_method_use_ptr, @function
create_method_use_ptr:
; src/create.c:51:     if (name == NULL || return_type == NULL) {
	testq	%rsi, %rsi	; name
	je	.L28	;,
	movq	%rdi, %rax	; tmp100, method
	testq	%rdx, %rdx	; return_type
	je	.L28	;,
; src/create.c:55:     method->name = name;
	movq	%rsi, (%rdi)	; name, method_10(D)->name
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
.L28:
; src/create.c:50: Method* create_method_use_ptr(Method* method, Symbol* name, Symbol* return_type, list(Variable*) parameters, list(Statement*) body, SymbolTable* method_scope) {
	subq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$51, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rdi	;, tmp98
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:53:         return NULL;
	movl	$0, %eax	;, <retval>
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
	.globl	create_class_member
	.type	create_class_member, @function
create_class_member:
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movl	%edi, %ebx	; tmp111, type
	movq	%rsi, %rbp	; tmp112, method_content
	movq	%rdx, %r12	; tmp113, variable_content
; src/create.c:64:     ClassMember* class_member = (ClassMember*)alloc_memory(sizeof(ClassMember));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:65:     class_member->type = type;
	movl	%ebx, 8(%rax)	; type, class_member_17->type
; src/create.c:66:     if (type == CLASS_METHOD && method_content != NULL)
	testl	%ebx, %ebx	; type
	jne	.L33	;,
	testq	%rbp, %rbp	; method_content
	je	.L33	;,
; src/create.c:67:         class_member->content.method = method_content;
	movq	%rbp, (%rax)	; method_content, class_member_17->content.method
.L32:
; src/create.c:78: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
.L33:
; src/create.c:68:     else if (type == CLASS_VARIABLE && variable_content != NULL)
	cmpl	$1, %ebx	;, type
	jne	.L35	;,
	testq	%r12, %r12	; variable_content
	je	.L35	;,
; src/create.c:69:         class_member->content.variable = variable_content;
	movq	%r12, (%rax)	; variable_content, class_member_17->content.variable
	jmp	.L32	;
.L35:
; src/create.c:71:         if (method_content == NULL && variable_content == NULL)
	orq	%rbp, %r12	; method_content, variable_content
	jne	.L36	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$45, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp107
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:75:         return NULL;
	movl	$0, %eax	;, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L32	;
.L36:
	movl	%ebx, %ecx	; type,
	leaq	.LC6(%rip), %rdx	;, tmp109
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:75:         return NULL;
	movl	$0, %eax	;, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L32	;
	.size	create_class_member, .-create_class_member
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"Error creating class: name is NULL\n"
	.text
	.globl	create_class_use_ptr
	.type	create_class_use_ptr, @function
create_class_use_ptr:
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp93, name
; src/create.c:81:     if (name == NULL) {
	testq	%rsi, %rsi	; name
	je	.L42	;,
; src/create.c:85:     class->name = name;
	movq	%rsi, (%rdi)	; name, class_6(D)->name
; src/create.c:86:     class->members = members;
	movq	%rdx, 8(%rdi)	; members, class_6(D)->members
; src/create.c:87:     class->class_scope = class_scope;
	movq	%rcx, 16(%rdi)	; class_scope, class_6(D)->class_scope
; src/create.c:88:     class->size = size;
	movq	%r8, 24(%rdi)	; size, class_6(D)->size
; src/create.c:89:     return class;
	movq	%rdi, %rax	; class, <retval>
.L38:
; src/create.c:90: }
	popq	%rbx	;
	ret	
.L42:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$35, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rdi	;, tmp90
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:83:         return NULL;
	movq	%rbx, %rax	; name, <retval>
	jmp	.L38	;
	.size	create_class_use_ptr, .-create_class_use_ptr
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"Error creating variable: type or name is NULL\n"
	.text
	.globl	create_variable
	.type	create_variable, @function
create_variable:
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
; src/create.c:93:     if (type == NULL || name == NULL) {
	testq	%rdi, %rdi	; type
	je	.L47	;,
	movq	%rdi, %rbx	; tmp97, type
	movq	%rsi, %rbp	; tmp98, name
	movq	%rdx, %r12	; tmp99, value
	testq	%rsi, %rsi	; name
	je	.L47	;,
; src/create.c:97:     Variable* variable = (Variable*)alloc_memory(sizeof(Variable));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:98:     variable->type = type;
	movq	%rbx, (%rax)	; type, variable_11->type
; src/create.c:99:     variable->name = name;
	movq	%rbp, 8(%rax)	; name, variable_11->name
; src/create.c:100:     variable->value = value;
	movq	%r12, 16(%rax)	; value, variable_11->value
.L43:
; src/create.c:102: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
.L47:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$46, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC8(%rip), %rdi	;, tmp95
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:95:         return NULL;
	movl	$0, %eax	;, <retval>
	jmp	.L43	;
	.size	create_variable, .-create_variable
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"Error creating statement: content is NULL\n"
	.align 8
.LC10:
	.string	"Error creating statement: unknown type %u\n"
	.text
	.globl	create_statement
	.type	create_statement, @function
create_statement:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movl	%edi, %ebx	; tmp146, type
	movq	%rsi, %r13	; tmp147, if_stmt
	movq	%rdx, %r14	; tmp148, while_stmt
	movq	%rcx, %r15	; tmp149, for_stmt
	movq	%r8, %rbp	; tmp150, expr
	movq	%r9, %r12	; tmp151, var_stmt
; src/create.c:105:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:106:     statement->type = type;
	movl	%ebx, 8(%rax)	; type, statement_30->type
; src/create.c:107:     if (type == EXPRESSION_STATEMENT && expr != NULL)
	testl	%ebx, %ebx	; type
	jne	.L50	;,
	testq	%rbp, %rbp	; expr
	je	.L50	;,
; src/create.c:108:         statement->stmt.expr = expr;
	movq	%rbp, (%rax)	; expr, statement_30->stmt.expr
.L49:
; src/create.c:129: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L50:
; src/create.c:109:     else if (type == VARIABLE_STATEMENT && var_stmt != NULL)
	cmpl	$1, %ebx	;, type
	jne	.L52	;,
	testq	%r12, %r12	; var_stmt
	je	.L52	;,
; src/create.c:110:         statement->stmt.var = var_stmt;
	movq	%r12, (%rax)	; var_stmt, statement_30->stmt.var
	jmp	.L49	;
.L52:
; src/create.c:111:     else if (type == IF_STATEMENT && if_stmt != NULL)
	cmpl	$2, %ebx	;, type
	jne	.L53	;,
	testq	%r13, %r13	; if_stmt
	je	.L53	;,
; src/create.c:112:         statement->stmt.if_stmt = if_stmt;
	movq	%r13, (%rax)	; if_stmt, statement_30->stmt.if_stmt
	jmp	.L49	;
.L53:
; src/create.c:113:     else if (type == WHILE_STATEMENT && while_stmt != NULL)
	cmpl	$3, %ebx	;, type
	jne	.L54	;,
	testq	%r14, %r14	; while_stmt
	je	.L54	;,
; src/create.c:114:         statement->stmt.while_stmt = while_stmt;
	movq	%r14, (%rax)	; while_stmt, statement_30->stmt.while_stmt
	jmp	.L49	;
.L54:
; src/create.c:115:     else if (type == FOR_STATEMENT && for_stmt != NULL)
	cmpl	$4, %ebx	;, type
	jne	.L55	;,
	testq	%r15, %r15	; for_stmt
	je	.L55	;,
; src/create.c:116:         statement->stmt.for_stmt = for_stmt;
	movq	%r15, (%rax)	; for_stmt, statement_30->stmt.for_stmt
	jmp	.L49	;
.L55:
; src/create.c:117:     else if (type == RETURN_STATEMENT)
	cmpl	$5, %ebx	;, type
	je	.L60	;,
; src/create.c:119:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	leal	-6(%rbx), %edx	;, tmp136
; src/create.c:119:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	cmpl	$1, %edx	;, tmp136
	ja	.L57	;,
; src/create.c:120:         statement->stmt.expr = NULL;
	movq	$0, (%rax)	;, statement_30->stmt.expr
	jmp	.L49	;
.L60:
; src/create.c:118:         statement->stmt.return_expr = expr;
	movq	%rbp, (%rax)	; expr, statement_30->stmt.return_expr
	jmp	.L49	;
.L57:
; src/create.c:122:         if (if_stmt == NULL && while_stmt == NULL && for_stmt == NULL && expr == NULL && var_stmt == NULL)
	orq	%r14, %r15	; while_stmt, tmp137
	orq	%r15, %r13	; tmp137, tmp138
	orq	%r13, %r12	; tmp138, tmp139
	orq	%rbp, %r12	; expr, tmp153
	je	.L61	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebx, %ecx	; type,
	leaq	.LC10(%rip), %rdx	;, tmp144
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:126:         return NULL;
	movl	$0, %eax	;, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L49	;
.L61:
	movq	stderr(%rip), %rcx	; stderr,
	movl	$42, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC9(%rip), %rdi	;, tmp142
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:126:         return NULL;
	movl	$0, %eax	;, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L49	;
	.size	create_statement, .-create_statement
	.section	.rodata.str1.8
	.align 8
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
	subq	$8, %rsp	;,
	movq	%rdi, %rbx	; tmp91, condition
; src/create.c:132:     if (condition == NULL) {
	testq	%rdi, %rdi	; condition
	je	.L66	;,
	movq	%rsi, %r12	; tmp92, body
	movq	%rdx, %rbp	; tmp93, else_if
	movq	%rcx, %r13	; tmp94, else_body
; src/create.c:136:     If* if_ = (If*)alloc_memory(sizeof(If));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:137:     if_->condition = condition;
	movq	%rbx, (%rax)	; condition, if__7->condition
; src/create.c:138:     if_->body = body;
	movq	%r12, 8(%rax)	; body, if__7->body
; src/create.c:139:     if_->else_if = else_if;
	movq	%rbp, 16(%rax)	; else_if, if__7->else_if
; src/create.c:140:     if_->else_body = else_body;
	movq	%r13, 24(%rax)	; else_body, if__7->else_body
.L62:
; src/create.c:142: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L66:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$47, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rdi	;, tmp89
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:134:         return NULL;
	movq	%rbx, %rax	; condition, <retval>
	jmp	.L62	;
	.size	create_if, .-create_if
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"Error creating else-if statement: condition is NULL\n"
	.text
	.globl	create_else_if
	.type	create_else_if, @function
create_else_if:
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %rbx	; tmp89, condition
; src/create.c:145:     if (condition == NULL) {
	testq	%rdi, %rdi	; condition
	je	.L71	;,
	movq	%rsi, %rbp	; tmp90, body
; src/create.c:149:     ElseIf* else_if = (ElseIf*)alloc_memory(sizeof(ElseIf));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:150:     else_if->condition = condition;
	movq	%rbx, (%rax)	; condition, else_if_7->condition
; src/create.c:151:     else_if->body = body;
	movq	%rbp, 8(%rax)	; body, else_if_7->body
.L67:
; src/create.c:153: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
.L71:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$52, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC12(%rip), %rdi	;, tmp87
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:147:         return NULL;
	movq	%rbx, %rax	; condition, <retval>
	jmp	.L67	;
	.size	create_else_if, .-create_else_if
	.globl	create_for
	.type	create_for, @function
create_for:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %r13	; tmp88, initializer
	movq	%rsi, %r12	; tmp89, condition
	movq	%rdx, %rbp	; tmp90, increment
	movq	%rcx, %rbx	; tmp91, body
; src/create.c:156:     For* for_ = (For*)alloc_memory(sizeof(For));
	movl	$32, %edi	;,
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
	.globl	create_while
	.type	create_while, @function
create_while:
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %rbp	; tmp86, condition
	movq	%rsi, %rbx	; tmp87, body
; src/create.c:165:     While* while_ = (While*)alloc_memory(sizeof(While));
	movl	$16, %edi	;,
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
	.globl	create_expression
	.type	create_expression, @function
create_expression:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movl	%edi, %ebx	; tmp120, operator
	movq	%rsi, %rbp	; tmp121, expr_left
	movq	%rdx, %r13	; tmp122, prim_left
	movq	%rcx, %r12	; tmp123, right
; src/create.c:172:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	cmpl	$19, %edi	;, operator
	sete	%dl	;, tmp99
	testq	%rcx, %rcx	; right
	sete	%al	;, tmp101
; src/create.c:172:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	cmpb	%al, %dl	; tmp101, tmp99
	jne	.L77	;,
; src/create.c:172:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	movq	%r13, %rax	; prim_left, tmp125
	orq	%rsi, %rax	; expr_left, tmp125
	je	.L95	;,
; src/create.c:180:     Expression* expression = (Expression*)alloc_memory(sizeof(Expression));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:181:     expression->operator = operator;
	movl	%ebx, 24(%rax)	; operator, expression_21->operator
; src/create.c:182:     if (expr_left != NULL)
	testq	%rbp, %rbp	; expr_left
	je	.L85	;,
; src/create.c:183:         expression->expr_left = expr_left;
	movq	%rbp, (%rax)	; expr_left, expression_21->expr_left
.L86:
; src/create.c:190:     expression->right = right;
	movq	%r12, 16(%rax)	; right, expression_21->right
; src/create.c:191:     return expression;
	jmp	.L76	;
.L77:
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%rcx, %rcx	; right
	leaq	.LC13(%rip), %rax	;, tmp108
	leaq	.LC14(%rip), %rdx	;, tmp109
	cmovne	%rdx, %rax	; tmp108,, tmp109, iftmp.13_4
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%r13, %r13	; prim_left
	movq	%rdx, %r9	;, tmp118
	leaq	.LC13(%rip), %rdx	;, tmp119
	cmove	%rdx, %r9	; tmp118,, tmp119, iftmp.14_3
.L81:
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%rbp, %rbp	; expr_left
	leaq	.LC14(%rip), %r8	;, tmp110
	leaq	.LC13(%rip), %rdx	;, tmp111
	cmove	%rdx, %r8	; tmp110,, tmp111, iftmp.15_10
.L82:
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	cmpl	$19, %ebx	;, operator
	leaq	.LC14(%rip), %rcx	;, tmp112
	leaq	.LC13(%rip), %rdx	;, tmp113
	cmove	%rdx, %rcx	; tmp112,, tmp113, iftmp.16_11
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	subq	$8, %rsp	;,
	pushq	%rax	; iftmp.13_4
	leaq	.LC15(%rip), %rdx	;, tmp104
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:178:         return NULL;
	addq	$16, %rsp	;,
	movl	$0, %eax	;, <retval>
.L76:
; src/create.c:192: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L85:
; src/create.c:184:     else if (prim_left != NULL)
	testq	%r13, %r13	; prim_left
	je	.L87	;,
; src/create.c:185:         expression->prim_left = prim_left;
	movq	%r13, 8(%rax)	; prim_left, expression_21->prim_left
	jmp	.L86	;
.L87:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$65, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rdi	;, tmp106
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:188:         return NULL;
	movq	%r13, %rax	; prim_left, <retval>
	jmp	.L76	;
.L95:
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC14(%rip), %rax	;, iftmp.13_4
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC13(%rip), %r9	;, iftmp.14_3
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%rcx, %rcx	; right
	jne	.L81	;,
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC13(%rip), %rax	;, iftmp.13_4
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%rax, %r9	; iftmp.13_4, iftmp.14_3
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%rax, %r8	; iftmp.13_4, iftmp.15_10
	jmp	.L82	;
	.size	create_expression, .-create_expression
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"Error creating primary: value is NULL\n"
	.align 8
.LC18:
	.string	"Error creating primary: unknown type %u\n"
	.text
	.globl	create_primary
	.type	create_primary, @function
create_primary:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movl	%edi, %ebx	; tmp135, type
	movq	%rsi, %rbp	; tmp136, str_value
	movq	%rdx, %r12	; tmp137, expr_value
	movq	%rcx, %r14	; tmp138, prim_value
	movq	%r8, %r13	; tmp139, variable_value
; src/create.c:195:     Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:196:     primary->type = type;
	movl	%ebx, 8(%rax)	; type, primary_24->type
; src/create.c:197:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != NULL)
	cmpl	$4, %ebx	;, type
	ja	.L97	;,
	testq	%rbp, %rbp	; str_value
	je	.L97	;,
; src/create.c:198:         primary->value.literal_value = str_value;
	movq	%rbp, (%rax)	; str_value, primary_24->value.literal_value
.L96:
; src/create.c:213: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
.L97:
; src/create.c:199:     else if (type == PRIM_EXPRESSION && expr_value != NULL)
	cmpl	$5, %ebx	;, type
	jne	.L99	;,
	testq	%r12, %r12	; expr_value
	je	.L99	;,
; src/create.c:200:         primary->value.expr = expr_value;
	movq	%r12, (%rax)	; expr_value, primary_24->value.expr
	jmp	.L96	;
.L99:
; src/create.c:201:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	leal	-6(%rbx), %edx	;, tmp118
; src/create.c:201:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	cmpl	$1, %edx	;, tmp118
	ja	.L100	;,
	testq	%r14, %r14	; prim_value
	jne	.L104	;,
.L100:
; src/create.c:203:     else if (type == PRIM_VARIABLE_ACCESS && variable_value != NULL)
	cmpl	$8, %ebx	;, type
	jne	.L101	;,
	testq	%r13, %r13	; variable_value
	je	.L101	;,
; src/create.c:204:         primary->value.var = variable_value;
	movq	%r13, (%rax)	; variable_value, primary_24->value.var
	jmp	.L96	;
.L104:
; src/create.c:202:         primary->value.operand = prim_value;
	movq	%r14, (%rax)	; prim_value, primary_24->value.operand
	jmp	.L96	;
.L101:
; src/create.c:206:         if (str_value == NULL && expr_value == NULL && prim_value == NULL && variable_value == NULL)
	orq	%r14, %r13	; prim_value, tmp127
	orq	%r13, %r12	; tmp127, tmp128
	orq	%rbp, %r12	; str_value, tmp141
	jne	.L102	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$38, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC17(%rip), %rdi	;, tmp131
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:210:         return NULL;
	movl	$0, %eax	;, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L96	;
.L102:
	movl	%ebx, %ecx	; type,
	leaq	.LC18(%rip), %rdx	;, tmp133
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:210:         return NULL;
	movl	$0, %eax	;, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L96	;
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
	.globl	create_variable_access
	.type	create_variable_access, @function
create_variable_access:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movl	%edi, %ebx	; tmp137, type
	movq	%rsi, %rbp	; tmp138, base
; src/create.c:216:     if ((base == NULL) != (type == VAR_NAME)) {
	testl	%edi, %edi	; type
	sete	%r15b	;, _2
	testq	%rsi, %rsi	; base
	sete	%al	;, tmp112
; src/create.c:216:     if ((base == NULL) != (type == VAR_NAME)) {
	cmpb	%r15b, %al	; _2, tmp112
	jne	.L118	;,
	movq	%rdx, %r12	; tmp139, name_content
	movq	%rcx, %r14	; tmp140, expr_content
	movq	%r8, %r13	; tmp141, args_content
; src/create.c:220:     VariableAccess* variable_access = (VariableAccess*)alloc_memory(sizeof(VariableAccess));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:221:     variable_access->type = type;
	movl	%ebx, 16(%rax)	; type, variable_access_28->type
; src/create.c:222:     variable_access->base = base;
	movq	%rbp, (%rax)	; base, variable_access_28->base
; src/create.c:223:     if (type == VAR_NAME && name_content != NULL)
	testq	%r12, %r12	; name_content
	setne	%dl	;, _4
; src/create.c:223:     if (type == VAR_NAME && name_content != NULL)
	testb	%r15b, %r15b	; _2
	je	.L110	;,
	testb	%dl, %dl	; _4
	je	.L110	;,
; src/create.c:224:         variable_access->content.name = name_content;
	movq	%r12, 8(%rax)	; name_content, variable_access_28->content.name
	jmp	.L105	;
.L118:
; src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	testl	%edi, %edi	; type
	leaq	.LC14(%rip), %r8	;, tmp133
	leaq	.LC13(%rip), %rax	;, tmp134
	cmove	%rax, %r8	; tmp133,, tmp134, iftmp.21_19
; src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	testq	%rsi, %rsi	; base
	leaq	.LC14(%rip), %rcx	;, tmp135
	cmove	%rax, %rcx	; tmp135,, tmp136, iftmp.22_20
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC19(%rip), %rdx	;, tmp114
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:218:         return NULL;
	movl	$0, %eax	;, <retval>
.L105:
; src/create.c:239: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L110:
; src/create.c:225:     else if (type == VAR_FUNC_CALL && args_content != NULL)
	cmpl	$1, %ebx	;, type
	jne	.L111	;,
	testq	%r13, %r13	; args_content
	je	.L111	;,
; src/create.c:226:         variable_access->content.args = args_content;
	movq	%r13, 8(%rax)	; args_content, variable_access_28->content.args
	jmp	.L105	;
.L111:
; src/create.c:227:     else if (type == VAR_GET_SEQ && expr_content != NULL)
	cmpl	$3, %ebx	;, type
	jne	.L112	;,
	testq	%r14, %r14	; expr_content
	je	.L112	;,
; src/create.c:228:         variable_access->content.index = expr_content;
	movq	%r14, 8(%rax)	; expr_content, variable_access_28->content.index
	jmp	.L105	;
.L112:
; src/create.c:229:     else if (type == VAR_GET_ATTR && name_content != NULL)
	cmpl	$2, %ebx	;, type
	jne	.L113	;,
	testb	%dl, %dl	; _4
	je	.L113	;,
; src/create.c:230:         variable_access->content.attr_name = name_content;
	movq	%r12, 8(%rax)	; name_content, variable_access_28->content.attr_name
	jmp	.L105	;
.L113:
; src/create.c:232:         if (name_content == NULL && expr_content == NULL && args_content == NULL)
	orq	%r13, %r14	; args_content, tmp126
	orq	%r12, %r14	; name_content, tmp143
	je	.L119	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebx, %ecx	; type,
	leaq	.LC21(%rip), %rdx	;, tmp131
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:236:         return NULL;
	movl	$0, %eax	;, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L105	;
.L119:
	movq	stderr(%rip), %rcx	; stderr,
	movl	$48, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC20(%rip), %rdi	;, tmp129
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:236:         return NULL;
	movl	$0, %eax	;, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L105	;
	.size	create_variable_access, .-create_variable_access
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
